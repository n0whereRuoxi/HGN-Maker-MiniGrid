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
      ?auto_279206 - BLOCK
    )
    :vars
    (
      ?auto_279207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279206 ?auto_279207 ) ( CLEAR ?auto_279206 ) ( HAND-EMPTY ) ( not ( = ?auto_279206 ?auto_279207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279206 ?auto_279207 )
      ( !PUTDOWN ?auto_279206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_279209 - BLOCK
    )
    :vars
    (
      ?auto_279210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279209 ?auto_279210 ) ( CLEAR ?auto_279209 ) ( HAND-EMPTY ) ( not ( = ?auto_279209 ?auto_279210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279209 ?auto_279210 )
      ( !PUTDOWN ?auto_279209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_279213 - BLOCK
      ?auto_279214 - BLOCK
    )
    :vars
    (
      ?auto_279215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279213 ) ( ON ?auto_279214 ?auto_279215 ) ( CLEAR ?auto_279214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279213 ) ( not ( = ?auto_279213 ?auto_279214 ) ) ( not ( = ?auto_279213 ?auto_279215 ) ) ( not ( = ?auto_279214 ?auto_279215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279214 ?auto_279215 )
      ( !STACK ?auto_279214 ?auto_279213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_279218 - BLOCK
      ?auto_279219 - BLOCK
    )
    :vars
    (
      ?auto_279220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279218 ) ( ON ?auto_279219 ?auto_279220 ) ( CLEAR ?auto_279219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279218 ) ( not ( = ?auto_279218 ?auto_279219 ) ) ( not ( = ?auto_279218 ?auto_279220 ) ) ( not ( = ?auto_279219 ?auto_279220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279219 ?auto_279220 )
      ( !STACK ?auto_279219 ?auto_279218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_279223 - BLOCK
      ?auto_279224 - BLOCK
    )
    :vars
    (
      ?auto_279225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279224 ?auto_279225 ) ( not ( = ?auto_279223 ?auto_279224 ) ) ( not ( = ?auto_279223 ?auto_279225 ) ) ( not ( = ?auto_279224 ?auto_279225 ) ) ( ON ?auto_279223 ?auto_279224 ) ( CLEAR ?auto_279223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279223 )
      ( MAKE-2PILE ?auto_279223 ?auto_279224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_279228 - BLOCK
      ?auto_279229 - BLOCK
    )
    :vars
    (
      ?auto_279230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279229 ?auto_279230 ) ( not ( = ?auto_279228 ?auto_279229 ) ) ( not ( = ?auto_279228 ?auto_279230 ) ) ( not ( = ?auto_279229 ?auto_279230 ) ) ( ON ?auto_279228 ?auto_279229 ) ( CLEAR ?auto_279228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279228 )
      ( MAKE-2PILE ?auto_279228 ?auto_279229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279234 - BLOCK
      ?auto_279235 - BLOCK
      ?auto_279236 - BLOCK
    )
    :vars
    (
      ?auto_279237 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279235 ) ( ON ?auto_279236 ?auto_279237 ) ( CLEAR ?auto_279236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279234 ) ( ON ?auto_279235 ?auto_279234 ) ( not ( = ?auto_279234 ?auto_279235 ) ) ( not ( = ?auto_279234 ?auto_279236 ) ) ( not ( = ?auto_279234 ?auto_279237 ) ) ( not ( = ?auto_279235 ?auto_279236 ) ) ( not ( = ?auto_279235 ?auto_279237 ) ) ( not ( = ?auto_279236 ?auto_279237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279236 ?auto_279237 )
      ( !STACK ?auto_279236 ?auto_279235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279241 - BLOCK
      ?auto_279242 - BLOCK
      ?auto_279243 - BLOCK
    )
    :vars
    (
      ?auto_279244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279242 ) ( ON ?auto_279243 ?auto_279244 ) ( CLEAR ?auto_279243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279241 ) ( ON ?auto_279242 ?auto_279241 ) ( not ( = ?auto_279241 ?auto_279242 ) ) ( not ( = ?auto_279241 ?auto_279243 ) ) ( not ( = ?auto_279241 ?auto_279244 ) ) ( not ( = ?auto_279242 ?auto_279243 ) ) ( not ( = ?auto_279242 ?auto_279244 ) ) ( not ( = ?auto_279243 ?auto_279244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279243 ?auto_279244 )
      ( !STACK ?auto_279243 ?auto_279242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279248 - BLOCK
      ?auto_279249 - BLOCK
      ?auto_279250 - BLOCK
    )
    :vars
    (
      ?auto_279251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279250 ?auto_279251 ) ( ON-TABLE ?auto_279248 ) ( not ( = ?auto_279248 ?auto_279249 ) ) ( not ( = ?auto_279248 ?auto_279250 ) ) ( not ( = ?auto_279248 ?auto_279251 ) ) ( not ( = ?auto_279249 ?auto_279250 ) ) ( not ( = ?auto_279249 ?auto_279251 ) ) ( not ( = ?auto_279250 ?auto_279251 ) ) ( CLEAR ?auto_279248 ) ( ON ?auto_279249 ?auto_279250 ) ( CLEAR ?auto_279249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279248 ?auto_279249 )
      ( MAKE-3PILE ?auto_279248 ?auto_279249 ?auto_279250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279255 - BLOCK
      ?auto_279256 - BLOCK
      ?auto_279257 - BLOCK
    )
    :vars
    (
      ?auto_279258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279257 ?auto_279258 ) ( ON-TABLE ?auto_279255 ) ( not ( = ?auto_279255 ?auto_279256 ) ) ( not ( = ?auto_279255 ?auto_279257 ) ) ( not ( = ?auto_279255 ?auto_279258 ) ) ( not ( = ?auto_279256 ?auto_279257 ) ) ( not ( = ?auto_279256 ?auto_279258 ) ) ( not ( = ?auto_279257 ?auto_279258 ) ) ( CLEAR ?auto_279255 ) ( ON ?auto_279256 ?auto_279257 ) ( CLEAR ?auto_279256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279255 ?auto_279256 )
      ( MAKE-3PILE ?auto_279255 ?auto_279256 ?auto_279257 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279262 - BLOCK
      ?auto_279263 - BLOCK
      ?auto_279264 - BLOCK
    )
    :vars
    (
      ?auto_279265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279264 ?auto_279265 ) ( not ( = ?auto_279262 ?auto_279263 ) ) ( not ( = ?auto_279262 ?auto_279264 ) ) ( not ( = ?auto_279262 ?auto_279265 ) ) ( not ( = ?auto_279263 ?auto_279264 ) ) ( not ( = ?auto_279263 ?auto_279265 ) ) ( not ( = ?auto_279264 ?auto_279265 ) ) ( ON ?auto_279263 ?auto_279264 ) ( ON ?auto_279262 ?auto_279263 ) ( CLEAR ?auto_279262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279262 )
      ( MAKE-3PILE ?auto_279262 ?auto_279263 ?auto_279264 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_279269 - BLOCK
      ?auto_279270 - BLOCK
      ?auto_279271 - BLOCK
    )
    :vars
    (
      ?auto_279272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279271 ?auto_279272 ) ( not ( = ?auto_279269 ?auto_279270 ) ) ( not ( = ?auto_279269 ?auto_279271 ) ) ( not ( = ?auto_279269 ?auto_279272 ) ) ( not ( = ?auto_279270 ?auto_279271 ) ) ( not ( = ?auto_279270 ?auto_279272 ) ) ( not ( = ?auto_279271 ?auto_279272 ) ) ( ON ?auto_279270 ?auto_279271 ) ( ON ?auto_279269 ?auto_279270 ) ( CLEAR ?auto_279269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279269 )
      ( MAKE-3PILE ?auto_279269 ?auto_279270 ?auto_279271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279277 - BLOCK
      ?auto_279278 - BLOCK
      ?auto_279279 - BLOCK
      ?auto_279280 - BLOCK
    )
    :vars
    (
      ?auto_279281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279279 ) ( ON ?auto_279280 ?auto_279281 ) ( CLEAR ?auto_279280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279277 ) ( ON ?auto_279278 ?auto_279277 ) ( ON ?auto_279279 ?auto_279278 ) ( not ( = ?auto_279277 ?auto_279278 ) ) ( not ( = ?auto_279277 ?auto_279279 ) ) ( not ( = ?auto_279277 ?auto_279280 ) ) ( not ( = ?auto_279277 ?auto_279281 ) ) ( not ( = ?auto_279278 ?auto_279279 ) ) ( not ( = ?auto_279278 ?auto_279280 ) ) ( not ( = ?auto_279278 ?auto_279281 ) ) ( not ( = ?auto_279279 ?auto_279280 ) ) ( not ( = ?auto_279279 ?auto_279281 ) ) ( not ( = ?auto_279280 ?auto_279281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279280 ?auto_279281 )
      ( !STACK ?auto_279280 ?auto_279279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279286 - BLOCK
      ?auto_279287 - BLOCK
      ?auto_279288 - BLOCK
      ?auto_279289 - BLOCK
    )
    :vars
    (
      ?auto_279290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279288 ) ( ON ?auto_279289 ?auto_279290 ) ( CLEAR ?auto_279289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279286 ) ( ON ?auto_279287 ?auto_279286 ) ( ON ?auto_279288 ?auto_279287 ) ( not ( = ?auto_279286 ?auto_279287 ) ) ( not ( = ?auto_279286 ?auto_279288 ) ) ( not ( = ?auto_279286 ?auto_279289 ) ) ( not ( = ?auto_279286 ?auto_279290 ) ) ( not ( = ?auto_279287 ?auto_279288 ) ) ( not ( = ?auto_279287 ?auto_279289 ) ) ( not ( = ?auto_279287 ?auto_279290 ) ) ( not ( = ?auto_279288 ?auto_279289 ) ) ( not ( = ?auto_279288 ?auto_279290 ) ) ( not ( = ?auto_279289 ?auto_279290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279289 ?auto_279290 )
      ( !STACK ?auto_279289 ?auto_279288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279295 - BLOCK
      ?auto_279296 - BLOCK
      ?auto_279297 - BLOCK
      ?auto_279298 - BLOCK
    )
    :vars
    (
      ?auto_279299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279298 ?auto_279299 ) ( ON-TABLE ?auto_279295 ) ( ON ?auto_279296 ?auto_279295 ) ( not ( = ?auto_279295 ?auto_279296 ) ) ( not ( = ?auto_279295 ?auto_279297 ) ) ( not ( = ?auto_279295 ?auto_279298 ) ) ( not ( = ?auto_279295 ?auto_279299 ) ) ( not ( = ?auto_279296 ?auto_279297 ) ) ( not ( = ?auto_279296 ?auto_279298 ) ) ( not ( = ?auto_279296 ?auto_279299 ) ) ( not ( = ?auto_279297 ?auto_279298 ) ) ( not ( = ?auto_279297 ?auto_279299 ) ) ( not ( = ?auto_279298 ?auto_279299 ) ) ( CLEAR ?auto_279296 ) ( ON ?auto_279297 ?auto_279298 ) ( CLEAR ?auto_279297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279295 ?auto_279296 ?auto_279297 )
      ( MAKE-4PILE ?auto_279295 ?auto_279296 ?auto_279297 ?auto_279298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279304 - BLOCK
      ?auto_279305 - BLOCK
      ?auto_279306 - BLOCK
      ?auto_279307 - BLOCK
    )
    :vars
    (
      ?auto_279308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279307 ?auto_279308 ) ( ON-TABLE ?auto_279304 ) ( ON ?auto_279305 ?auto_279304 ) ( not ( = ?auto_279304 ?auto_279305 ) ) ( not ( = ?auto_279304 ?auto_279306 ) ) ( not ( = ?auto_279304 ?auto_279307 ) ) ( not ( = ?auto_279304 ?auto_279308 ) ) ( not ( = ?auto_279305 ?auto_279306 ) ) ( not ( = ?auto_279305 ?auto_279307 ) ) ( not ( = ?auto_279305 ?auto_279308 ) ) ( not ( = ?auto_279306 ?auto_279307 ) ) ( not ( = ?auto_279306 ?auto_279308 ) ) ( not ( = ?auto_279307 ?auto_279308 ) ) ( CLEAR ?auto_279305 ) ( ON ?auto_279306 ?auto_279307 ) ( CLEAR ?auto_279306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279304 ?auto_279305 ?auto_279306 )
      ( MAKE-4PILE ?auto_279304 ?auto_279305 ?auto_279306 ?auto_279307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279313 - BLOCK
      ?auto_279314 - BLOCK
      ?auto_279315 - BLOCK
      ?auto_279316 - BLOCK
    )
    :vars
    (
      ?auto_279317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279316 ?auto_279317 ) ( ON-TABLE ?auto_279313 ) ( not ( = ?auto_279313 ?auto_279314 ) ) ( not ( = ?auto_279313 ?auto_279315 ) ) ( not ( = ?auto_279313 ?auto_279316 ) ) ( not ( = ?auto_279313 ?auto_279317 ) ) ( not ( = ?auto_279314 ?auto_279315 ) ) ( not ( = ?auto_279314 ?auto_279316 ) ) ( not ( = ?auto_279314 ?auto_279317 ) ) ( not ( = ?auto_279315 ?auto_279316 ) ) ( not ( = ?auto_279315 ?auto_279317 ) ) ( not ( = ?auto_279316 ?auto_279317 ) ) ( ON ?auto_279315 ?auto_279316 ) ( CLEAR ?auto_279313 ) ( ON ?auto_279314 ?auto_279315 ) ( CLEAR ?auto_279314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279313 ?auto_279314 )
      ( MAKE-4PILE ?auto_279313 ?auto_279314 ?auto_279315 ?auto_279316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279322 - BLOCK
      ?auto_279323 - BLOCK
      ?auto_279324 - BLOCK
      ?auto_279325 - BLOCK
    )
    :vars
    (
      ?auto_279326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279325 ?auto_279326 ) ( ON-TABLE ?auto_279322 ) ( not ( = ?auto_279322 ?auto_279323 ) ) ( not ( = ?auto_279322 ?auto_279324 ) ) ( not ( = ?auto_279322 ?auto_279325 ) ) ( not ( = ?auto_279322 ?auto_279326 ) ) ( not ( = ?auto_279323 ?auto_279324 ) ) ( not ( = ?auto_279323 ?auto_279325 ) ) ( not ( = ?auto_279323 ?auto_279326 ) ) ( not ( = ?auto_279324 ?auto_279325 ) ) ( not ( = ?auto_279324 ?auto_279326 ) ) ( not ( = ?auto_279325 ?auto_279326 ) ) ( ON ?auto_279324 ?auto_279325 ) ( CLEAR ?auto_279322 ) ( ON ?auto_279323 ?auto_279324 ) ( CLEAR ?auto_279323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279322 ?auto_279323 )
      ( MAKE-4PILE ?auto_279322 ?auto_279323 ?auto_279324 ?auto_279325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279331 - BLOCK
      ?auto_279332 - BLOCK
      ?auto_279333 - BLOCK
      ?auto_279334 - BLOCK
    )
    :vars
    (
      ?auto_279335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279334 ?auto_279335 ) ( not ( = ?auto_279331 ?auto_279332 ) ) ( not ( = ?auto_279331 ?auto_279333 ) ) ( not ( = ?auto_279331 ?auto_279334 ) ) ( not ( = ?auto_279331 ?auto_279335 ) ) ( not ( = ?auto_279332 ?auto_279333 ) ) ( not ( = ?auto_279332 ?auto_279334 ) ) ( not ( = ?auto_279332 ?auto_279335 ) ) ( not ( = ?auto_279333 ?auto_279334 ) ) ( not ( = ?auto_279333 ?auto_279335 ) ) ( not ( = ?auto_279334 ?auto_279335 ) ) ( ON ?auto_279333 ?auto_279334 ) ( ON ?auto_279332 ?auto_279333 ) ( ON ?auto_279331 ?auto_279332 ) ( CLEAR ?auto_279331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279331 )
      ( MAKE-4PILE ?auto_279331 ?auto_279332 ?auto_279333 ?auto_279334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_279340 - BLOCK
      ?auto_279341 - BLOCK
      ?auto_279342 - BLOCK
      ?auto_279343 - BLOCK
    )
    :vars
    (
      ?auto_279344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279343 ?auto_279344 ) ( not ( = ?auto_279340 ?auto_279341 ) ) ( not ( = ?auto_279340 ?auto_279342 ) ) ( not ( = ?auto_279340 ?auto_279343 ) ) ( not ( = ?auto_279340 ?auto_279344 ) ) ( not ( = ?auto_279341 ?auto_279342 ) ) ( not ( = ?auto_279341 ?auto_279343 ) ) ( not ( = ?auto_279341 ?auto_279344 ) ) ( not ( = ?auto_279342 ?auto_279343 ) ) ( not ( = ?auto_279342 ?auto_279344 ) ) ( not ( = ?auto_279343 ?auto_279344 ) ) ( ON ?auto_279342 ?auto_279343 ) ( ON ?auto_279341 ?auto_279342 ) ( ON ?auto_279340 ?auto_279341 ) ( CLEAR ?auto_279340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279340 )
      ( MAKE-4PILE ?auto_279340 ?auto_279341 ?auto_279342 ?auto_279343 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279350 - BLOCK
      ?auto_279351 - BLOCK
      ?auto_279352 - BLOCK
      ?auto_279353 - BLOCK
      ?auto_279354 - BLOCK
    )
    :vars
    (
      ?auto_279355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279353 ) ( ON ?auto_279354 ?auto_279355 ) ( CLEAR ?auto_279354 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279350 ) ( ON ?auto_279351 ?auto_279350 ) ( ON ?auto_279352 ?auto_279351 ) ( ON ?auto_279353 ?auto_279352 ) ( not ( = ?auto_279350 ?auto_279351 ) ) ( not ( = ?auto_279350 ?auto_279352 ) ) ( not ( = ?auto_279350 ?auto_279353 ) ) ( not ( = ?auto_279350 ?auto_279354 ) ) ( not ( = ?auto_279350 ?auto_279355 ) ) ( not ( = ?auto_279351 ?auto_279352 ) ) ( not ( = ?auto_279351 ?auto_279353 ) ) ( not ( = ?auto_279351 ?auto_279354 ) ) ( not ( = ?auto_279351 ?auto_279355 ) ) ( not ( = ?auto_279352 ?auto_279353 ) ) ( not ( = ?auto_279352 ?auto_279354 ) ) ( not ( = ?auto_279352 ?auto_279355 ) ) ( not ( = ?auto_279353 ?auto_279354 ) ) ( not ( = ?auto_279353 ?auto_279355 ) ) ( not ( = ?auto_279354 ?auto_279355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279354 ?auto_279355 )
      ( !STACK ?auto_279354 ?auto_279353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279361 - BLOCK
      ?auto_279362 - BLOCK
      ?auto_279363 - BLOCK
      ?auto_279364 - BLOCK
      ?auto_279365 - BLOCK
    )
    :vars
    (
      ?auto_279366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279364 ) ( ON ?auto_279365 ?auto_279366 ) ( CLEAR ?auto_279365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279361 ) ( ON ?auto_279362 ?auto_279361 ) ( ON ?auto_279363 ?auto_279362 ) ( ON ?auto_279364 ?auto_279363 ) ( not ( = ?auto_279361 ?auto_279362 ) ) ( not ( = ?auto_279361 ?auto_279363 ) ) ( not ( = ?auto_279361 ?auto_279364 ) ) ( not ( = ?auto_279361 ?auto_279365 ) ) ( not ( = ?auto_279361 ?auto_279366 ) ) ( not ( = ?auto_279362 ?auto_279363 ) ) ( not ( = ?auto_279362 ?auto_279364 ) ) ( not ( = ?auto_279362 ?auto_279365 ) ) ( not ( = ?auto_279362 ?auto_279366 ) ) ( not ( = ?auto_279363 ?auto_279364 ) ) ( not ( = ?auto_279363 ?auto_279365 ) ) ( not ( = ?auto_279363 ?auto_279366 ) ) ( not ( = ?auto_279364 ?auto_279365 ) ) ( not ( = ?auto_279364 ?auto_279366 ) ) ( not ( = ?auto_279365 ?auto_279366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279365 ?auto_279366 )
      ( !STACK ?auto_279365 ?auto_279364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279372 - BLOCK
      ?auto_279373 - BLOCK
      ?auto_279374 - BLOCK
      ?auto_279375 - BLOCK
      ?auto_279376 - BLOCK
    )
    :vars
    (
      ?auto_279377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279376 ?auto_279377 ) ( ON-TABLE ?auto_279372 ) ( ON ?auto_279373 ?auto_279372 ) ( ON ?auto_279374 ?auto_279373 ) ( not ( = ?auto_279372 ?auto_279373 ) ) ( not ( = ?auto_279372 ?auto_279374 ) ) ( not ( = ?auto_279372 ?auto_279375 ) ) ( not ( = ?auto_279372 ?auto_279376 ) ) ( not ( = ?auto_279372 ?auto_279377 ) ) ( not ( = ?auto_279373 ?auto_279374 ) ) ( not ( = ?auto_279373 ?auto_279375 ) ) ( not ( = ?auto_279373 ?auto_279376 ) ) ( not ( = ?auto_279373 ?auto_279377 ) ) ( not ( = ?auto_279374 ?auto_279375 ) ) ( not ( = ?auto_279374 ?auto_279376 ) ) ( not ( = ?auto_279374 ?auto_279377 ) ) ( not ( = ?auto_279375 ?auto_279376 ) ) ( not ( = ?auto_279375 ?auto_279377 ) ) ( not ( = ?auto_279376 ?auto_279377 ) ) ( CLEAR ?auto_279374 ) ( ON ?auto_279375 ?auto_279376 ) ( CLEAR ?auto_279375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279372 ?auto_279373 ?auto_279374 ?auto_279375 )
      ( MAKE-5PILE ?auto_279372 ?auto_279373 ?auto_279374 ?auto_279375 ?auto_279376 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279383 - BLOCK
      ?auto_279384 - BLOCK
      ?auto_279385 - BLOCK
      ?auto_279386 - BLOCK
      ?auto_279387 - BLOCK
    )
    :vars
    (
      ?auto_279388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279387 ?auto_279388 ) ( ON-TABLE ?auto_279383 ) ( ON ?auto_279384 ?auto_279383 ) ( ON ?auto_279385 ?auto_279384 ) ( not ( = ?auto_279383 ?auto_279384 ) ) ( not ( = ?auto_279383 ?auto_279385 ) ) ( not ( = ?auto_279383 ?auto_279386 ) ) ( not ( = ?auto_279383 ?auto_279387 ) ) ( not ( = ?auto_279383 ?auto_279388 ) ) ( not ( = ?auto_279384 ?auto_279385 ) ) ( not ( = ?auto_279384 ?auto_279386 ) ) ( not ( = ?auto_279384 ?auto_279387 ) ) ( not ( = ?auto_279384 ?auto_279388 ) ) ( not ( = ?auto_279385 ?auto_279386 ) ) ( not ( = ?auto_279385 ?auto_279387 ) ) ( not ( = ?auto_279385 ?auto_279388 ) ) ( not ( = ?auto_279386 ?auto_279387 ) ) ( not ( = ?auto_279386 ?auto_279388 ) ) ( not ( = ?auto_279387 ?auto_279388 ) ) ( CLEAR ?auto_279385 ) ( ON ?auto_279386 ?auto_279387 ) ( CLEAR ?auto_279386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279383 ?auto_279384 ?auto_279385 ?auto_279386 )
      ( MAKE-5PILE ?auto_279383 ?auto_279384 ?auto_279385 ?auto_279386 ?auto_279387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279394 - BLOCK
      ?auto_279395 - BLOCK
      ?auto_279396 - BLOCK
      ?auto_279397 - BLOCK
      ?auto_279398 - BLOCK
    )
    :vars
    (
      ?auto_279399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279398 ?auto_279399 ) ( ON-TABLE ?auto_279394 ) ( ON ?auto_279395 ?auto_279394 ) ( not ( = ?auto_279394 ?auto_279395 ) ) ( not ( = ?auto_279394 ?auto_279396 ) ) ( not ( = ?auto_279394 ?auto_279397 ) ) ( not ( = ?auto_279394 ?auto_279398 ) ) ( not ( = ?auto_279394 ?auto_279399 ) ) ( not ( = ?auto_279395 ?auto_279396 ) ) ( not ( = ?auto_279395 ?auto_279397 ) ) ( not ( = ?auto_279395 ?auto_279398 ) ) ( not ( = ?auto_279395 ?auto_279399 ) ) ( not ( = ?auto_279396 ?auto_279397 ) ) ( not ( = ?auto_279396 ?auto_279398 ) ) ( not ( = ?auto_279396 ?auto_279399 ) ) ( not ( = ?auto_279397 ?auto_279398 ) ) ( not ( = ?auto_279397 ?auto_279399 ) ) ( not ( = ?auto_279398 ?auto_279399 ) ) ( ON ?auto_279397 ?auto_279398 ) ( CLEAR ?auto_279395 ) ( ON ?auto_279396 ?auto_279397 ) ( CLEAR ?auto_279396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279394 ?auto_279395 ?auto_279396 )
      ( MAKE-5PILE ?auto_279394 ?auto_279395 ?auto_279396 ?auto_279397 ?auto_279398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279405 - BLOCK
      ?auto_279406 - BLOCK
      ?auto_279407 - BLOCK
      ?auto_279408 - BLOCK
      ?auto_279409 - BLOCK
    )
    :vars
    (
      ?auto_279410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279409 ?auto_279410 ) ( ON-TABLE ?auto_279405 ) ( ON ?auto_279406 ?auto_279405 ) ( not ( = ?auto_279405 ?auto_279406 ) ) ( not ( = ?auto_279405 ?auto_279407 ) ) ( not ( = ?auto_279405 ?auto_279408 ) ) ( not ( = ?auto_279405 ?auto_279409 ) ) ( not ( = ?auto_279405 ?auto_279410 ) ) ( not ( = ?auto_279406 ?auto_279407 ) ) ( not ( = ?auto_279406 ?auto_279408 ) ) ( not ( = ?auto_279406 ?auto_279409 ) ) ( not ( = ?auto_279406 ?auto_279410 ) ) ( not ( = ?auto_279407 ?auto_279408 ) ) ( not ( = ?auto_279407 ?auto_279409 ) ) ( not ( = ?auto_279407 ?auto_279410 ) ) ( not ( = ?auto_279408 ?auto_279409 ) ) ( not ( = ?auto_279408 ?auto_279410 ) ) ( not ( = ?auto_279409 ?auto_279410 ) ) ( ON ?auto_279408 ?auto_279409 ) ( CLEAR ?auto_279406 ) ( ON ?auto_279407 ?auto_279408 ) ( CLEAR ?auto_279407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279405 ?auto_279406 ?auto_279407 )
      ( MAKE-5PILE ?auto_279405 ?auto_279406 ?auto_279407 ?auto_279408 ?auto_279409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279416 - BLOCK
      ?auto_279417 - BLOCK
      ?auto_279418 - BLOCK
      ?auto_279419 - BLOCK
      ?auto_279420 - BLOCK
    )
    :vars
    (
      ?auto_279421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279420 ?auto_279421 ) ( ON-TABLE ?auto_279416 ) ( not ( = ?auto_279416 ?auto_279417 ) ) ( not ( = ?auto_279416 ?auto_279418 ) ) ( not ( = ?auto_279416 ?auto_279419 ) ) ( not ( = ?auto_279416 ?auto_279420 ) ) ( not ( = ?auto_279416 ?auto_279421 ) ) ( not ( = ?auto_279417 ?auto_279418 ) ) ( not ( = ?auto_279417 ?auto_279419 ) ) ( not ( = ?auto_279417 ?auto_279420 ) ) ( not ( = ?auto_279417 ?auto_279421 ) ) ( not ( = ?auto_279418 ?auto_279419 ) ) ( not ( = ?auto_279418 ?auto_279420 ) ) ( not ( = ?auto_279418 ?auto_279421 ) ) ( not ( = ?auto_279419 ?auto_279420 ) ) ( not ( = ?auto_279419 ?auto_279421 ) ) ( not ( = ?auto_279420 ?auto_279421 ) ) ( ON ?auto_279419 ?auto_279420 ) ( ON ?auto_279418 ?auto_279419 ) ( CLEAR ?auto_279416 ) ( ON ?auto_279417 ?auto_279418 ) ( CLEAR ?auto_279417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279416 ?auto_279417 )
      ( MAKE-5PILE ?auto_279416 ?auto_279417 ?auto_279418 ?auto_279419 ?auto_279420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279427 - BLOCK
      ?auto_279428 - BLOCK
      ?auto_279429 - BLOCK
      ?auto_279430 - BLOCK
      ?auto_279431 - BLOCK
    )
    :vars
    (
      ?auto_279432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279431 ?auto_279432 ) ( ON-TABLE ?auto_279427 ) ( not ( = ?auto_279427 ?auto_279428 ) ) ( not ( = ?auto_279427 ?auto_279429 ) ) ( not ( = ?auto_279427 ?auto_279430 ) ) ( not ( = ?auto_279427 ?auto_279431 ) ) ( not ( = ?auto_279427 ?auto_279432 ) ) ( not ( = ?auto_279428 ?auto_279429 ) ) ( not ( = ?auto_279428 ?auto_279430 ) ) ( not ( = ?auto_279428 ?auto_279431 ) ) ( not ( = ?auto_279428 ?auto_279432 ) ) ( not ( = ?auto_279429 ?auto_279430 ) ) ( not ( = ?auto_279429 ?auto_279431 ) ) ( not ( = ?auto_279429 ?auto_279432 ) ) ( not ( = ?auto_279430 ?auto_279431 ) ) ( not ( = ?auto_279430 ?auto_279432 ) ) ( not ( = ?auto_279431 ?auto_279432 ) ) ( ON ?auto_279430 ?auto_279431 ) ( ON ?auto_279429 ?auto_279430 ) ( CLEAR ?auto_279427 ) ( ON ?auto_279428 ?auto_279429 ) ( CLEAR ?auto_279428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279427 ?auto_279428 )
      ( MAKE-5PILE ?auto_279427 ?auto_279428 ?auto_279429 ?auto_279430 ?auto_279431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279438 - BLOCK
      ?auto_279439 - BLOCK
      ?auto_279440 - BLOCK
      ?auto_279441 - BLOCK
      ?auto_279442 - BLOCK
    )
    :vars
    (
      ?auto_279443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279442 ?auto_279443 ) ( not ( = ?auto_279438 ?auto_279439 ) ) ( not ( = ?auto_279438 ?auto_279440 ) ) ( not ( = ?auto_279438 ?auto_279441 ) ) ( not ( = ?auto_279438 ?auto_279442 ) ) ( not ( = ?auto_279438 ?auto_279443 ) ) ( not ( = ?auto_279439 ?auto_279440 ) ) ( not ( = ?auto_279439 ?auto_279441 ) ) ( not ( = ?auto_279439 ?auto_279442 ) ) ( not ( = ?auto_279439 ?auto_279443 ) ) ( not ( = ?auto_279440 ?auto_279441 ) ) ( not ( = ?auto_279440 ?auto_279442 ) ) ( not ( = ?auto_279440 ?auto_279443 ) ) ( not ( = ?auto_279441 ?auto_279442 ) ) ( not ( = ?auto_279441 ?auto_279443 ) ) ( not ( = ?auto_279442 ?auto_279443 ) ) ( ON ?auto_279441 ?auto_279442 ) ( ON ?auto_279440 ?auto_279441 ) ( ON ?auto_279439 ?auto_279440 ) ( ON ?auto_279438 ?auto_279439 ) ( CLEAR ?auto_279438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279438 )
      ( MAKE-5PILE ?auto_279438 ?auto_279439 ?auto_279440 ?auto_279441 ?auto_279442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_279449 - BLOCK
      ?auto_279450 - BLOCK
      ?auto_279451 - BLOCK
      ?auto_279452 - BLOCK
      ?auto_279453 - BLOCK
    )
    :vars
    (
      ?auto_279454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279453 ?auto_279454 ) ( not ( = ?auto_279449 ?auto_279450 ) ) ( not ( = ?auto_279449 ?auto_279451 ) ) ( not ( = ?auto_279449 ?auto_279452 ) ) ( not ( = ?auto_279449 ?auto_279453 ) ) ( not ( = ?auto_279449 ?auto_279454 ) ) ( not ( = ?auto_279450 ?auto_279451 ) ) ( not ( = ?auto_279450 ?auto_279452 ) ) ( not ( = ?auto_279450 ?auto_279453 ) ) ( not ( = ?auto_279450 ?auto_279454 ) ) ( not ( = ?auto_279451 ?auto_279452 ) ) ( not ( = ?auto_279451 ?auto_279453 ) ) ( not ( = ?auto_279451 ?auto_279454 ) ) ( not ( = ?auto_279452 ?auto_279453 ) ) ( not ( = ?auto_279452 ?auto_279454 ) ) ( not ( = ?auto_279453 ?auto_279454 ) ) ( ON ?auto_279452 ?auto_279453 ) ( ON ?auto_279451 ?auto_279452 ) ( ON ?auto_279450 ?auto_279451 ) ( ON ?auto_279449 ?auto_279450 ) ( CLEAR ?auto_279449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279449 )
      ( MAKE-5PILE ?auto_279449 ?auto_279450 ?auto_279451 ?auto_279452 ?auto_279453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279461 - BLOCK
      ?auto_279462 - BLOCK
      ?auto_279463 - BLOCK
      ?auto_279464 - BLOCK
      ?auto_279465 - BLOCK
      ?auto_279466 - BLOCK
    )
    :vars
    (
      ?auto_279467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279465 ) ( ON ?auto_279466 ?auto_279467 ) ( CLEAR ?auto_279466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279461 ) ( ON ?auto_279462 ?auto_279461 ) ( ON ?auto_279463 ?auto_279462 ) ( ON ?auto_279464 ?auto_279463 ) ( ON ?auto_279465 ?auto_279464 ) ( not ( = ?auto_279461 ?auto_279462 ) ) ( not ( = ?auto_279461 ?auto_279463 ) ) ( not ( = ?auto_279461 ?auto_279464 ) ) ( not ( = ?auto_279461 ?auto_279465 ) ) ( not ( = ?auto_279461 ?auto_279466 ) ) ( not ( = ?auto_279461 ?auto_279467 ) ) ( not ( = ?auto_279462 ?auto_279463 ) ) ( not ( = ?auto_279462 ?auto_279464 ) ) ( not ( = ?auto_279462 ?auto_279465 ) ) ( not ( = ?auto_279462 ?auto_279466 ) ) ( not ( = ?auto_279462 ?auto_279467 ) ) ( not ( = ?auto_279463 ?auto_279464 ) ) ( not ( = ?auto_279463 ?auto_279465 ) ) ( not ( = ?auto_279463 ?auto_279466 ) ) ( not ( = ?auto_279463 ?auto_279467 ) ) ( not ( = ?auto_279464 ?auto_279465 ) ) ( not ( = ?auto_279464 ?auto_279466 ) ) ( not ( = ?auto_279464 ?auto_279467 ) ) ( not ( = ?auto_279465 ?auto_279466 ) ) ( not ( = ?auto_279465 ?auto_279467 ) ) ( not ( = ?auto_279466 ?auto_279467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279466 ?auto_279467 )
      ( !STACK ?auto_279466 ?auto_279465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279474 - BLOCK
      ?auto_279475 - BLOCK
      ?auto_279476 - BLOCK
      ?auto_279477 - BLOCK
      ?auto_279478 - BLOCK
      ?auto_279479 - BLOCK
    )
    :vars
    (
      ?auto_279480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279478 ) ( ON ?auto_279479 ?auto_279480 ) ( CLEAR ?auto_279479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279474 ) ( ON ?auto_279475 ?auto_279474 ) ( ON ?auto_279476 ?auto_279475 ) ( ON ?auto_279477 ?auto_279476 ) ( ON ?auto_279478 ?auto_279477 ) ( not ( = ?auto_279474 ?auto_279475 ) ) ( not ( = ?auto_279474 ?auto_279476 ) ) ( not ( = ?auto_279474 ?auto_279477 ) ) ( not ( = ?auto_279474 ?auto_279478 ) ) ( not ( = ?auto_279474 ?auto_279479 ) ) ( not ( = ?auto_279474 ?auto_279480 ) ) ( not ( = ?auto_279475 ?auto_279476 ) ) ( not ( = ?auto_279475 ?auto_279477 ) ) ( not ( = ?auto_279475 ?auto_279478 ) ) ( not ( = ?auto_279475 ?auto_279479 ) ) ( not ( = ?auto_279475 ?auto_279480 ) ) ( not ( = ?auto_279476 ?auto_279477 ) ) ( not ( = ?auto_279476 ?auto_279478 ) ) ( not ( = ?auto_279476 ?auto_279479 ) ) ( not ( = ?auto_279476 ?auto_279480 ) ) ( not ( = ?auto_279477 ?auto_279478 ) ) ( not ( = ?auto_279477 ?auto_279479 ) ) ( not ( = ?auto_279477 ?auto_279480 ) ) ( not ( = ?auto_279478 ?auto_279479 ) ) ( not ( = ?auto_279478 ?auto_279480 ) ) ( not ( = ?auto_279479 ?auto_279480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279479 ?auto_279480 )
      ( !STACK ?auto_279479 ?auto_279478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279487 - BLOCK
      ?auto_279488 - BLOCK
      ?auto_279489 - BLOCK
      ?auto_279490 - BLOCK
      ?auto_279491 - BLOCK
      ?auto_279492 - BLOCK
    )
    :vars
    (
      ?auto_279493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279492 ?auto_279493 ) ( ON-TABLE ?auto_279487 ) ( ON ?auto_279488 ?auto_279487 ) ( ON ?auto_279489 ?auto_279488 ) ( ON ?auto_279490 ?auto_279489 ) ( not ( = ?auto_279487 ?auto_279488 ) ) ( not ( = ?auto_279487 ?auto_279489 ) ) ( not ( = ?auto_279487 ?auto_279490 ) ) ( not ( = ?auto_279487 ?auto_279491 ) ) ( not ( = ?auto_279487 ?auto_279492 ) ) ( not ( = ?auto_279487 ?auto_279493 ) ) ( not ( = ?auto_279488 ?auto_279489 ) ) ( not ( = ?auto_279488 ?auto_279490 ) ) ( not ( = ?auto_279488 ?auto_279491 ) ) ( not ( = ?auto_279488 ?auto_279492 ) ) ( not ( = ?auto_279488 ?auto_279493 ) ) ( not ( = ?auto_279489 ?auto_279490 ) ) ( not ( = ?auto_279489 ?auto_279491 ) ) ( not ( = ?auto_279489 ?auto_279492 ) ) ( not ( = ?auto_279489 ?auto_279493 ) ) ( not ( = ?auto_279490 ?auto_279491 ) ) ( not ( = ?auto_279490 ?auto_279492 ) ) ( not ( = ?auto_279490 ?auto_279493 ) ) ( not ( = ?auto_279491 ?auto_279492 ) ) ( not ( = ?auto_279491 ?auto_279493 ) ) ( not ( = ?auto_279492 ?auto_279493 ) ) ( CLEAR ?auto_279490 ) ( ON ?auto_279491 ?auto_279492 ) ( CLEAR ?auto_279491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279487 ?auto_279488 ?auto_279489 ?auto_279490 ?auto_279491 )
      ( MAKE-6PILE ?auto_279487 ?auto_279488 ?auto_279489 ?auto_279490 ?auto_279491 ?auto_279492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279500 - BLOCK
      ?auto_279501 - BLOCK
      ?auto_279502 - BLOCK
      ?auto_279503 - BLOCK
      ?auto_279504 - BLOCK
      ?auto_279505 - BLOCK
    )
    :vars
    (
      ?auto_279506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279505 ?auto_279506 ) ( ON-TABLE ?auto_279500 ) ( ON ?auto_279501 ?auto_279500 ) ( ON ?auto_279502 ?auto_279501 ) ( ON ?auto_279503 ?auto_279502 ) ( not ( = ?auto_279500 ?auto_279501 ) ) ( not ( = ?auto_279500 ?auto_279502 ) ) ( not ( = ?auto_279500 ?auto_279503 ) ) ( not ( = ?auto_279500 ?auto_279504 ) ) ( not ( = ?auto_279500 ?auto_279505 ) ) ( not ( = ?auto_279500 ?auto_279506 ) ) ( not ( = ?auto_279501 ?auto_279502 ) ) ( not ( = ?auto_279501 ?auto_279503 ) ) ( not ( = ?auto_279501 ?auto_279504 ) ) ( not ( = ?auto_279501 ?auto_279505 ) ) ( not ( = ?auto_279501 ?auto_279506 ) ) ( not ( = ?auto_279502 ?auto_279503 ) ) ( not ( = ?auto_279502 ?auto_279504 ) ) ( not ( = ?auto_279502 ?auto_279505 ) ) ( not ( = ?auto_279502 ?auto_279506 ) ) ( not ( = ?auto_279503 ?auto_279504 ) ) ( not ( = ?auto_279503 ?auto_279505 ) ) ( not ( = ?auto_279503 ?auto_279506 ) ) ( not ( = ?auto_279504 ?auto_279505 ) ) ( not ( = ?auto_279504 ?auto_279506 ) ) ( not ( = ?auto_279505 ?auto_279506 ) ) ( CLEAR ?auto_279503 ) ( ON ?auto_279504 ?auto_279505 ) ( CLEAR ?auto_279504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279500 ?auto_279501 ?auto_279502 ?auto_279503 ?auto_279504 )
      ( MAKE-6PILE ?auto_279500 ?auto_279501 ?auto_279502 ?auto_279503 ?auto_279504 ?auto_279505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279513 - BLOCK
      ?auto_279514 - BLOCK
      ?auto_279515 - BLOCK
      ?auto_279516 - BLOCK
      ?auto_279517 - BLOCK
      ?auto_279518 - BLOCK
    )
    :vars
    (
      ?auto_279519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279518 ?auto_279519 ) ( ON-TABLE ?auto_279513 ) ( ON ?auto_279514 ?auto_279513 ) ( ON ?auto_279515 ?auto_279514 ) ( not ( = ?auto_279513 ?auto_279514 ) ) ( not ( = ?auto_279513 ?auto_279515 ) ) ( not ( = ?auto_279513 ?auto_279516 ) ) ( not ( = ?auto_279513 ?auto_279517 ) ) ( not ( = ?auto_279513 ?auto_279518 ) ) ( not ( = ?auto_279513 ?auto_279519 ) ) ( not ( = ?auto_279514 ?auto_279515 ) ) ( not ( = ?auto_279514 ?auto_279516 ) ) ( not ( = ?auto_279514 ?auto_279517 ) ) ( not ( = ?auto_279514 ?auto_279518 ) ) ( not ( = ?auto_279514 ?auto_279519 ) ) ( not ( = ?auto_279515 ?auto_279516 ) ) ( not ( = ?auto_279515 ?auto_279517 ) ) ( not ( = ?auto_279515 ?auto_279518 ) ) ( not ( = ?auto_279515 ?auto_279519 ) ) ( not ( = ?auto_279516 ?auto_279517 ) ) ( not ( = ?auto_279516 ?auto_279518 ) ) ( not ( = ?auto_279516 ?auto_279519 ) ) ( not ( = ?auto_279517 ?auto_279518 ) ) ( not ( = ?auto_279517 ?auto_279519 ) ) ( not ( = ?auto_279518 ?auto_279519 ) ) ( ON ?auto_279517 ?auto_279518 ) ( CLEAR ?auto_279515 ) ( ON ?auto_279516 ?auto_279517 ) ( CLEAR ?auto_279516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279513 ?auto_279514 ?auto_279515 ?auto_279516 )
      ( MAKE-6PILE ?auto_279513 ?auto_279514 ?auto_279515 ?auto_279516 ?auto_279517 ?auto_279518 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279526 - BLOCK
      ?auto_279527 - BLOCK
      ?auto_279528 - BLOCK
      ?auto_279529 - BLOCK
      ?auto_279530 - BLOCK
      ?auto_279531 - BLOCK
    )
    :vars
    (
      ?auto_279532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279531 ?auto_279532 ) ( ON-TABLE ?auto_279526 ) ( ON ?auto_279527 ?auto_279526 ) ( ON ?auto_279528 ?auto_279527 ) ( not ( = ?auto_279526 ?auto_279527 ) ) ( not ( = ?auto_279526 ?auto_279528 ) ) ( not ( = ?auto_279526 ?auto_279529 ) ) ( not ( = ?auto_279526 ?auto_279530 ) ) ( not ( = ?auto_279526 ?auto_279531 ) ) ( not ( = ?auto_279526 ?auto_279532 ) ) ( not ( = ?auto_279527 ?auto_279528 ) ) ( not ( = ?auto_279527 ?auto_279529 ) ) ( not ( = ?auto_279527 ?auto_279530 ) ) ( not ( = ?auto_279527 ?auto_279531 ) ) ( not ( = ?auto_279527 ?auto_279532 ) ) ( not ( = ?auto_279528 ?auto_279529 ) ) ( not ( = ?auto_279528 ?auto_279530 ) ) ( not ( = ?auto_279528 ?auto_279531 ) ) ( not ( = ?auto_279528 ?auto_279532 ) ) ( not ( = ?auto_279529 ?auto_279530 ) ) ( not ( = ?auto_279529 ?auto_279531 ) ) ( not ( = ?auto_279529 ?auto_279532 ) ) ( not ( = ?auto_279530 ?auto_279531 ) ) ( not ( = ?auto_279530 ?auto_279532 ) ) ( not ( = ?auto_279531 ?auto_279532 ) ) ( ON ?auto_279530 ?auto_279531 ) ( CLEAR ?auto_279528 ) ( ON ?auto_279529 ?auto_279530 ) ( CLEAR ?auto_279529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279526 ?auto_279527 ?auto_279528 ?auto_279529 )
      ( MAKE-6PILE ?auto_279526 ?auto_279527 ?auto_279528 ?auto_279529 ?auto_279530 ?auto_279531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279539 - BLOCK
      ?auto_279540 - BLOCK
      ?auto_279541 - BLOCK
      ?auto_279542 - BLOCK
      ?auto_279543 - BLOCK
      ?auto_279544 - BLOCK
    )
    :vars
    (
      ?auto_279545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279544 ?auto_279545 ) ( ON-TABLE ?auto_279539 ) ( ON ?auto_279540 ?auto_279539 ) ( not ( = ?auto_279539 ?auto_279540 ) ) ( not ( = ?auto_279539 ?auto_279541 ) ) ( not ( = ?auto_279539 ?auto_279542 ) ) ( not ( = ?auto_279539 ?auto_279543 ) ) ( not ( = ?auto_279539 ?auto_279544 ) ) ( not ( = ?auto_279539 ?auto_279545 ) ) ( not ( = ?auto_279540 ?auto_279541 ) ) ( not ( = ?auto_279540 ?auto_279542 ) ) ( not ( = ?auto_279540 ?auto_279543 ) ) ( not ( = ?auto_279540 ?auto_279544 ) ) ( not ( = ?auto_279540 ?auto_279545 ) ) ( not ( = ?auto_279541 ?auto_279542 ) ) ( not ( = ?auto_279541 ?auto_279543 ) ) ( not ( = ?auto_279541 ?auto_279544 ) ) ( not ( = ?auto_279541 ?auto_279545 ) ) ( not ( = ?auto_279542 ?auto_279543 ) ) ( not ( = ?auto_279542 ?auto_279544 ) ) ( not ( = ?auto_279542 ?auto_279545 ) ) ( not ( = ?auto_279543 ?auto_279544 ) ) ( not ( = ?auto_279543 ?auto_279545 ) ) ( not ( = ?auto_279544 ?auto_279545 ) ) ( ON ?auto_279543 ?auto_279544 ) ( ON ?auto_279542 ?auto_279543 ) ( CLEAR ?auto_279540 ) ( ON ?auto_279541 ?auto_279542 ) ( CLEAR ?auto_279541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279539 ?auto_279540 ?auto_279541 )
      ( MAKE-6PILE ?auto_279539 ?auto_279540 ?auto_279541 ?auto_279542 ?auto_279543 ?auto_279544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279552 - BLOCK
      ?auto_279553 - BLOCK
      ?auto_279554 - BLOCK
      ?auto_279555 - BLOCK
      ?auto_279556 - BLOCK
      ?auto_279557 - BLOCK
    )
    :vars
    (
      ?auto_279558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279557 ?auto_279558 ) ( ON-TABLE ?auto_279552 ) ( ON ?auto_279553 ?auto_279552 ) ( not ( = ?auto_279552 ?auto_279553 ) ) ( not ( = ?auto_279552 ?auto_279554 ) ) ( not ( = ?auto_279552 ?auto_279555 ) ) ( not ( = ?auto_279552 ?auto_279556 ) ) ( not ( = ?auto_279552 ?auto_279557 ) ) ( not ( = ?auto_279552 ?auto_279558 ) ) ( not ( = ?auto_279553 ?auto_279554 ) ) ( not ( = ?auto_279553 ?auto_279555 ) ) ( not ( = ?auto_279553 ?auto_279556 ) ) ( not ( = ?auto_279553 ?auto_279557 ) ) ( not ( = ?auto_279553 ?auto_279558 ) ) ( not ( = ?auto_279554 ?auto_279555 ) ) ( not ( = ?auto_279554 ?auto_279556 ) ) ( not ( = ?auto_279554 ?auto_279557 ) ) ( not ( = ?auto_279554 ?auto_279558 ) ) ( not ( = ?auto_279555 ?auto_279556 ) ) ( not ( = ?auto_279555 ?auto_279557 ) ) ( not ( = ?auto_279555 ?auto_279558 ) ) ( not ( = ?auto_279556 ?auto_279557 ) ) ( not ( = ?auto_279556 ?auto_279558 ) ) ( not ( = ?auto_279557 ?auto_279558 ) ) ( ON ?auto_279556 ?auto_279557 ) ( ON ?auto_279555 ?auto_279556 ) ( CLEAR ?auto_279553 ) ( ON ?auto_279554 ?auto_279555 ) ( CLEAR ?auto_279554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279552 ?auto_279553 ?auto_279554 )
      ( MAKE-6PILE ?auto_279552 ?auto_279553 ?auto_279554 ?auto_279555 ?auto_279556 ?auto_279557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279565 - BLOCK
      ?auto_279566 - BLOCK
      ?auto_279567 - BLOCK
      ?auto_279568 - BLOCK
      ?auto_279569 - BLOCK
      ?auto_279570 - BLOCK
    )
    :vars
    (
      ?auto_279571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279570 ?auto_279571 ) ( ON-TABLE ?auto_279565 ) ( not ( = ?auto_279565 ?auto_279566 ) ) ( not ( = ?auto_279565 ?auto_279567 ) ) ( not ( = ?auto_279565 ?auto_279568 ) ) ( not ( = ?auto_279565 ?auto_279569 ) ) ( not ( = ?auto_279565 ?auto_279570 ) ) ( not ( = ?auto_279565 ?auto_279571 ) ) ( not ( = ?auto_279566 ?auto_279567 ) ) ( not ( = ?auto_279566 ?auto_279568 ) ) ( not ( = ?auto_279566 ?auto_279569 ) ) ( not ( = ?auto_279566 ?auto_279570 ) ) ( not ( = ?auto_279566 ?auto_279571 ) ) ( not ( = ?auto_279567 ?auto_279568 ) ) ( not ( = ?auto_279567 ?auto_279569 ) ) ( not ( = ?auto_279567 ?auto_279570 ) ) ( not ( = ?auto_279567 ?auto_279571 ) ) ( not ( = ?auto_279568 ?auto_279569 ) ) ( not ( = ?auto_279568 ?auto_279570 ) ) ( not ( = ?auto_279568 ?auto_279571 ) ) ( not ( = ?auto_279569 ?auto_279570 ) ) ( not ( = ?auto_279569 ?auto_279571 ) ) ( not ( = ?auto_279570 ?auto_279571 ) ) ( ON ?auto_279569 ?auto_279570 ) ( ON ?auto_279568 ?auto_279569 ) ( ON ?auto_279567 ?auto_279568 ) ( CLEAR ?auto_279565 ) ( ON ?auto_279566 ?auto_279567 ) ( CLEAR ?auto_279566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279565 ?auto_279566 )
      ( MAKE-6PILE ?auto_279565 ?auto_279566 ?auto_279567 ?auto_279568 ?auto_279569 ?auto_279570 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279578 - BLOCK
      ?auto_279579 - BLOCK
      ?auto_279580 - BLOCK
      ?auto_279581 - BLOCK
      ?auto_279582 - BLOCK
      ?auto_279583 - BLOCK
    )
    :vars
    (
      ?auto_279584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279583 ?auto_279584 ) ( ON-TABLE ?auto_279578 ) ( not ( = ?auto_279578 ?auto_279579 ) ) ( not ( = ?auto_279578 ?auto_279580 ) ) ( not ( = ?auto_279578 ?auto_279581 ) ) ( not ( = ?auto_279578 ?auto_279582 ) ) ( not ( = ?auto_279578 ?auto_279583 ) ) ( not ( = ?auto_279578 ?auto_279584 ) ) ( not ( = ?auto_279579 ?auto_279580 ) ) ( not ( = ?auto_279579 ?auto_279581 ) ) ( not ( = ?auto_279579 ?auto_279582 ) ) ( not ( = ?auto_279579 ?auto_279583 ) ) ( not ( = ?auto_279579 ?auto_279584 ) ) ( not ( = ?auto_279580 ?auto_279581 ) ) ( not ( = ?auto_279580 ?auto_279582 ) ) ( not ( = ?auto_279580 ?auto_279583 ) ) ( not ( = ?auto_279580 ?auto_279584 ) ) ( not ( = ?auto_279581 ?auto_279582 ) ) ( not ( = ?auto_279581 ?auto_279583 ) ) ( not ( = ?auto_279581 ?auto_279584 ) ) ( not ( = ?auto_279582 ?auto_279583 ) ) ( not ( = ?auto_279582 ?auto_279584 ) ) ( not ( = ?auto_279583 ?auto_279584 ) ) ( ON ?auto_279582 ?auto_279583 ) ( ON ?auto_279581 ?auto_279582 ) ( ON ?auto_279580 ?auto_279581 ) ( CLEAR ?auto_279578 ) ( ON ?auto_279579 ?auto_279580 ) ( CLEAR ?auto_279579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279578 ?auto_279579 )
      ( MAKE-6PILE ?auto_279578 ?auto_279579 ?auto_279580 ?auto_279581 ?auto_279582 ?auto_279583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279591 - BLOCK
      ?auto_279592 - BLOCK
      ?auto_279593 - BLOCK
      ?auto_279594 - BLOCK
      ?auto_279595 - BLOCK
      ?auto_279596 - BLOCK
    )
    :vars
    (
      ?auto_279597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279596 ?auto_279597 ) ( not ( = ?auto_279591 ?auto_279592 ) ) ( not ( = ?auto_279591 ?auto_279593 ) ) ( not ( = ?auto_279591 ?auto_279594 ) ) ( not ( = ?auto_279591 ?auto_279595 ) ) ( not ( = ?auto_279591 ?auto_279596 ) ) ( not ( = ?auto_279591 ?auto_279597 ) ) ( not ( = ?auto_279592 ?auto_279593 ) ) ( not ( = ?auto_279592 ?auto_279594 ) ) ( not ( = ?auto_279592 ?auto_279595 ) ) ( not ( = ?auto_279592 ?auto_279596 ) ) ( not ( = ?auto_279592 ?auto_279597 ) ) ( not ( = ?auto_279593 ?auto_279594 ) ) ( not ( = ?auto_279593 ?auto_279595 ) ) ( not ( = ?auto_279593 ?auto_279596 ) ) ( not ( = ?auto_279593 ?auto_279597 ) ) ( not ( = ?auto_279594 ?auto_279595 ) ) ( not ( = ?auto_279594 ?auto_279596 ) ) ( not ( = ?auto_279594 ?auto_279597 ) ) ( not ( = ?auto_279595 ?auto_279596 ) ) ( not ( = ?auto_279595 ?auto_279597 ) ) ( not ( = ?auto_279596 ?auto_279597 ) ) ( ON ?auto_279595 ?auto_279596 ) ( ON ?auto_279594 ?auto_279595 ) ( ON ?auto_279593 ?auto_279594 ) ( ON ?auto_279592 ?auto_279593 ) ( ON ?auto_279591 ?auto_279592 ) ( CLEAR ?auto_279591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279591 )
      ( MAKE-6PILE ?auto_279591 ?auto_279592 ?auto_279593 ?auto_279594 ?auto_279595 ?auto_279596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_279604 - BLOCK
      ?auto_279605 - BLOCK
      ?auto_279606 - BLOCK
      ?auto_279607 - BLOCK
      ?auto_279608 - BLOCK
      ?auto_279609 - BLOCK
    )
    :vars
    (
      ?auto_279610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279609 ?auto_279610 ) ( not ( = ?auto_279604 ?auto_279605 ) ) ( not ( = ?auto_279604 ?auto_279606 ) ) ( not ( = ?auto_279604 ?auto_279607 ) ) ( not ( = ?auto_279604 ?auto_279608 ) ) ( not ( = ?auto_279604 ?auto_279609 ) ) ( not ( = ?auto_279604 ?auto_279610 ) ) ( not ( = ?auto_279605 ?auto_279606 ) ) ( not ( = ?auto_279605 ?auto_279607 ) ) ( not ( = ?auto_279605 ?auto_279608 ) ) ( not ( = ?auto_279605 ?auto_279609 ) ) ( not ( = ?auto_279605 ?auto_279610 ) ) ( not ( = ?auto_279606 ?auto_279607 ) ) ( not ( = ?auto_279606 ?auto_279608 ) ) ( not ( = ?auto_279606 ?auto_279609 ) ) ( not ( = ?auto_279606 ?auto_279610 ) ) ( not ( = ?auto_279607 ?auto_279608 ) ) ( not ( = ?auto_279607 ?auto_279609 ) ) ( not ( = ?auto_279607 ?auto_279610 ) ) ( not ( = ?auto_279608 ?auto_279609 ) ) ( not ( = ?auto_279608 ?auto_279610 ) ) ( not ( = ?auto_279609 ?auto_279610 ) ) ( ON ?auto_279608 ?auto_279609 ) ( ON ?auto_279607 ?auto_279608 ) ( ON ?auto_279606 ?auto_279607 ) ( ON ?auto_279605 ?auto_279606 ) ( ON ?auto_279604 ?auto_279605 ) ( CLEAR ?auto_279604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279604 )
      ( MAKE-6PILE ?auto_279604 ?auto_279605 ?auto_279606 ?auto_279607 ?auto_279608 ?auto_279609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279618 - BLOCK
      ?auto_279619 - BLOCK
      ?auto_279620 - BLOCK
      ?auto_279621 - BLOCK
      ?auto_279622 - BLOCK
      ?auto_279623 - BLOCK
      ?auto_279624 - BLOCK
    )
    :vars
    (
      ?auto_279625 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279623 ) ( ON ?auto_279624 ?auto_279625 ) ( CLEAR ?auto_279624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279618 ) ( ON ?auto_279619 ?auto_279618 ) ( ON ?auto_279620 ?auto_279619 ) ( ON ?auto_279621 ?auto_279620 ) ( ON ?auto_279622 ?auto_279621 ) ( ON ?auto_279623 ?auto_279622 ) ( not ( = ?auto_279618 ?auto_279619 ) ) ( not ( = ?auto_279618 ?auto_279620 ) ) ( not ( = ?auto_279618 ?auto_279621 ) ) ( not ( = ?auto_279618 ?auto_279622 ) ) ( not ( = ?auto_279618 ?auto_279623 ) ) ( not ( = ?auto_279618 ?auto_279624 ) ) ( not ( = ?auto_279618 ?auto_279625 ) ) ( not ( = ?auto_279619 ?auto_279620 ) ) ( not ( = ?auto_279619 ?auto_279621 ) ) ( not ( = ?auto_279619 ?auto_279622 ) ) ( not ( = ?auto_279619 ?auto_279623 ) ) ( not ( = ?auto_279619 ?auto_279624 ) ) ( not ( = ?auto_279619 ?auto_279625 ) ) ( not ( = ?auto_279620 ?auto_279621 ) ) ( not ( = ?auto_279620 ?auto_279622 ) ) ( not ( = ?auto_279620 ?auto_279623 ) ) ( not ( = ?auto_279620 ?auto_279624 ) ) ( not ( = ?auto_279620 ?auto_279625 ) ) ( not ( = ?auto_279621 ?auto_279622 ) ) ( not ( = ?auto_279621 ?auto_279623 ) ) ( not ( = ?auto_279621 ?auto_279624 ) ) ( not ( = ?auto_279621 ?auto_279625 ) ) ( not ( = ?auto_279622 ?auto_279623 ) ) ( not ( = ?auto_279622 ?auto_279624 ) ) ( not ( = ?auto_279622 ?auto_279625 ) ) ( not ( = ?auto_279623 ?auto_279624 ) ) ( not ( = ?auto_279623 ?auto_279625 ) ) ( not ( = ?auto_279624 ?auto_279625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279624 ?auto_279625 )
      ( !STACK ?auto_279624 ?auto_279623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279633 - BLOCK
      ?auto_279634 - BLOCK
      ?auto_279635 - BLOCK
      ?auto_279636 - BLOCK
      ?auto_279637 - BLOCK
      ?auto_279638 - BLOCK
      ?auto_279639 - BLOCK
    )
    :vars
    (
      ?auto_279640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279638 ) ( ON ?auto_279639 ?auto_279640 ) ( CLEAR ?auto_279639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279633 ) ( ON ?auto_279634 ?auto_279633 ) ( ON ?auto_279635 ?auto_279634 ) ( ON ?auto_279636 ?auto_279635 ) ( ON ?auto_279637 ?auto_279636 ) ( ON ?auto_279638 ?auto_279637 ) ( not ( = ?auto_279633 ?auto_279634 ) ) ( not ( = ?auto_279633 ?auto_279635 ) ) ( not ( = ?auto_279633 ?auto_279636 ) ) ( not ( = ?auto_279633 ?auto_279637 ) ) ( not ( = ?auto_279633 ?auto_279638 ) ) ( not ( = ?auto_279633 ?auto_279639 ) ) ( not ( = ?auto_279633 ?auto_279640 ) ) ( not ( = ?auto_279634 ?auto_279635 ) ) ( not ( = ?auto_279634 ?auto_279636 ) ) ( not ( = ?auto_279634 ?auto_279637 ) ) ( not ( = ?auto_279634 ?auto_279638 ) ) ( not ( = ?auto_279634 ?auto_279639 ) ) ( not ( = ?auto_279634 ?auto_279640 ) ) ( not ( = ?auto_279635 ?auto_279636 ) ) ( not ( = ?auto_279635 ?auto_279637 ) ) ( not ( = ?auto_279635 ?auto_279638 ) ) ( not ( = ?auto_279635 ?auto_279639 ) ) ( not ( = ?auto_279635 ?auto_279640 ) ) ( not ( = ?auto_279636 ?auto_279637 ) ) ( not ( = ?auto_279636 ?auto_279638 ) ) ( not ( = ?auto_279636 ?auto_279639 ) ) ( not ( = ?auto_279636 ?auto_279640 ) ) ( not ( = ?auto_279637 ?auto_279638 ) ) ( not ( = ?auto_279637 ?auto_279639 ) ) ( not ( = ?auto_279637 ?auto_279640 ) ) ( not ( = ?auto_279638 ?auto_279639 ) ) ( not ( = ?auto_279638 ?auto_279640 ) ) ( not ( = ?auto_279639 ?auto_279640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279639 ?auto_279640 )
      ( !STACK ?auto_279639 ?auto_279638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279648 - BLOCK
      ?auto_279649 - BLOCK
      ?auto_279650 - BLOCK
      ?auto_279651 - BLOCK
      ?auto_279652 - BLOCK
      ?auto_279653 - BLOCK
      ?auto_279654 - BLOCK
    )
    :vars
    (
      ?auto_279655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279654 ?auto_279655 ) ( ON-TABLE ?auto_279648 ) ( ON ?auto_279649 ?auto_279648 ) ( ON ?auto_279650 ?auto_279649 ) ( ON ?auto_279651 ?auto_279650 ) ( ON ?auto_279652 ?auto_279651 ) ( not ( = ?auto_279648 ?auto_279649 ) ) ( not ( = ?auto_279648 ?auto_279650 ) ) ( not ( = ?auto_279648 ?auto_279651 ) ) ( not ( = ?auto_279648 ?auto_279652 ) ) ( not ( = ?auto_279648 ?auto_279653 ) ) ( not ( = ?auto_279648 ?auto_279654 ) ) ( not ( = ?auto_279648 ?auto_279655 ) ) ( not ( = ?auto_279649 ?auto_279650 ) ) ( not ( = ?auto_279649 ?auto_279651 ) ) ( not ( = ?auto_279649 ?auto_279652 ) ) ( not ( = ?auto_279649 ?auto_279653 ) ) ( not ( = ?auto_279649 ?auto_279654 ) ) ( not ( = ?auto_279649 ?auto_279655 ) ) ( not ( = ?auto_279650 ?auto_279651 ) ) ( not ( = ?auto_279650 ?auto_279652 ) ) ( not ( = ?auto_279650 ?auto_279653 ) ) ( not ( = ?auto_279650 ?auto_279654 ) ) ( not ( = ?auto_279650 ?auto_279655 ) ) ( not ( = ?auto_279651 ?auto_279652 ) ) ( not ( = ?auto_279651 ?auto_279653 ) ) ( not ( = ?auto_279651 ?auto_279654 ) ) ( not ( = ?auto_279651 ?auto_279655 ) ) ( not ( = ?auto_279652 ?auto_279653 ) ) ( not ( = ?auto_279652 ?auto_279654 ) ) ( not ( = ?auto_279652 ?auto_279655 ) ) ( not ( = ?auto_279653 ?auto_279654 ) ) ( not ( = ?auto_279653 ?auto_279655 ) ) ( not ( = ?auto_279654 ?auto_279655 ) ) ( CLEAR ?auto_279652 ) ( ON ?auto_279653 ?auto_279654 ) ( CLEAR ?auto_279653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_279648 ?auto_279649 ?auto_279650 ?auto_279651 ?auto_279652 ?auto_279653 )
      ( MAKE-7PILE ?auto_279648 ?auto_279649 ?auto_279650 ?auto_279651 ?auto_279652 ?auto_279653 ?auto_279654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279663 - BLOCK
      ?auto_279664 - BLOCK
      ?auto_279665 - BLOCK
      ?auto_279666 - BLOCK
      ?auto_279667 - BLOCK
      ?auto_279668 - BLOCK
      ?auto_279669 - BLOCK
    )
    :vars
    (
      ?auto_279670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279669 ?auto_279670 ) ( ON-TABLE ?auto_279663 ) ( ON ?auto_279664 ?auto_279663 ) ( ON ?auto_279665 ?auto_279664 ) ( ON ?auto_279666 ?auto_279665 ) ( ON ?auto_279667 ?auto_279666 ) ( not ( = ?auto_279663 ?auto_279664 ) ) ( not ( = ?auto_279663 ?auto_279665 ) ) ( not ( = ?auto_279663 ?auto_279666 ) ) ( not ( = ?auto_279663 ?auto_279667 ) ) ( not ( = ?auto_279663 ?auto_279668 ) ) ( not ( = ?auto_279663 ?auto_279669 ) ) ( not ( = ?auto_279663 ?auto_279670 ) ) ( not ( = ?auto_279664 ?auto_279665 ) ) ( not ( = ?auto_279664 ?auto_279666 ) ) ( not ( = ?auto_279664 ?auto_279667 ) ) ( not ( = ?auto_279664 ?auto_279668 ) ) ( not ( = ?auto_279664 ?auto_279669 ) ) ( not ( = ?auto_279664 ?auto_279670 ) ) ( not ( = ?auto_279665 ?auto_279666 ) ) ( not ( = ?auto_279665 ?auto_279667 ) ) ( not ( = ?auto_279665 ?auto_279668 ) ) ( not ( = ?auto_279665 ?auto_279669 ) ) ( not ( = ?auto_279665 ?auto_279670 ) ) ( not ( = ?auto_279666 ?auto_279667 ) ) ( not ( = ?auto_279666 ?auto_279668 ) ) ( not ( = ?auto_279666 ?auto_279669 ) ) ( not ( = ?auto_279666 ?auto_279670 ) ) ( not ( = ?auto_279667 ?auto_279668 ) ) ( not ( = ?auto_279667 ?auto_279669 ) ) ( not ( = ?auto_279667 ?auto_279670 ) ) ( not ( = ?auto_279668 ?auto_279669 ) ) ( not ( = ?auto_279668 ?auto_279670 ) ) ( not ( = ?auto_279669 ?auto_279670 ) ) ( CLEAR ?auto_279667 ) ( ON ?auto_279668 ?auto_279669 ) ( CLEAR ?auto_279668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_279663 ?auto_279664 ?auto_279665 ?auto_279666 ?auto_279667 ?auto_279668 )
      ( MAKE-7PILE ?auto_279663 ?auto_279664 ?auto_279665 ?auto_279666 ?auto_279667 ?auto_279668 ?auto_279669 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279678 - BLOCK
      ?auto_279679 - BLOCK
      ?auto_279680 - BLOCK
      ?auto_279681 - BLOCK
      ?auto_279682 - BLOCK
      ?auto_279683 - BLOCK
      ?auto_279684 - BLOCK
    )
    :vars
    (
      ?auto_279685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279684 ?auto_279685 ) ( ON-TABLE ?auto_279678 ) ( ON ?auto_279679 ?auto_279678 ) ( ON ?auto_279680 ?auto_279679 ) ( ON ?auto_279681 ?auto_279680 ) ( not ( = ?auto_279678 ?auto_279679 ) ) ( not ( = ?auto_279678 ?auto_279680 ) ) ( not ( = ?auto_279678 ?auto_279681 ) ) ( not ( = ?auto_279678 ?auto_279682 ) ) ( not ( = ?auto_279678 ?auto_279683 ) ) ( not ( = ?auto_279678 ?auto_279684 ) ) ( not ( = ?auto_279678 ?auto_279685 ) ) ( not ( = ?auto_279679 ?auto_279680 ) ) ( not ( = ?auto_279679 ?auto_279681 ) ) ( not ( = ?auto_279679 ?auto_279682 ) ) ( not ( = ?auto_279679 ?auto_279683 ) ) ( not ( = ?auto_279679 ?auto_279684 ) ) ( not ( = ?auto_279679 ?auto_279685 ) ) ( not ( = ?auto_279680 ?auto_279681 ) ) ( not ( = ?auto_279680 ?auto_279682 ) ) ( not ( = ?auto_279680 ?auto_279683 ) ) ( not ( = ?auto_279680 ?auto_279684 ) ) ( not ( = ?auto_279680 ?auto_279685 ) ) ( not ( = ?auto_279681 ?auto_279682 ) ) ( not ( = ?auto_279681 ?auto_279683 ) ) ( not ( = ?auto_279681 ?auto_279684 ) ) ( not ( = ?auto_279681 ?auto_279685 ) ) ( not ( = ?auto_279682 ?auto_279683 ) ) ( not ( = ?auto_279682 ?auto_279684 ) ) ( not ( = ?auto_279682 ?auto_279685 ) ) ( not ( = ?auto_279683 ?auto_279684 ) ) ( not ( = ?auto_279683 ?auto_279685 ) ) ( not ( = ?auto_279684 ?auto_279685 ) ) ( ON ?auto_279683 ?auto_279684 ) ( CLEAR ?auto_279681 ) ( ON ?auto_279682 ?auto_279683 ) ( CLEAR ?auto_279682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279678 ?auto_279679 ?auto_279680 ?auto_279681 ?auto_279682 )
      ( MAKE-7PILE ?auto_279678 ?auto_279679 ?auto_279680 ?auto_279681 ?auto_279682 ?auto_279683 ?auto_279684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279693 - BLOCK
      ?auto_279694 - BLOCK
      ?auto_279695 - BLOCK
      ?auto_279696 - BLOCK
      ?auto_279697 - BLOCK
      ?auto_279698 - BLOCK
      ?auto_279699 - BLOCK
    )
    :vars
    (
      ?auto_279700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279699 ?auto_279700 ) ( ON-TABLE ?auto_279693 ) ( ON ?auto_279694 ?auto_279693 ) ( ON ?auto_279695 ?auto_279694 ) ( ON ?auto_279696 ?auto_279695 ) ( not ( = ?auto_279693 ?auto_279694 ) ) ( not ( = ?auto_279693 ?auto_279695 ) ) ( not ( = ?auto_279693 ?auto_279696 ) ) ( not ( = ?auto_279693 ?auto_279697 ) ) ( not ( = ?auto_279693 ?auto_279698 ) ) ( not ( = ?auto_279693 ?auto_279699 ) ) ( not ( = ?auto_279693 ?auto_279700 ) ) ( not ( = ?auto_279694 ?auto_279695 ) ) ( not ( = ?auto_279694 ?auto_279696 ) ) ( not ( = ?auto_279694 ?auto_279697 ) ) ( not ( = ?auto_279694 ?auto_279698 ) ) ( not ( = ?auto_279694 ?auto_279699 ) ) ( not ( = ?auto_279694 ?auto_279700 ) ) ( not ( = ?auto_279695 ?auto_279696 ) ) ( not ( = ?auto_279695 ?auto_279697 ) ) ( not ( = ?auto_279695 ?auto_279698 ) ) ( not ( = ?auto_279695 ?auto_279699 ) ) ( not ( = ?auto_279695 ?auto_279700 ) ) ( not ( = ?auto_279696 ?auto_279697 ) ) ( not ( = ?auto_279696 ?auto_279698 ) ) ( not ( = ?auto_279696 ?auto_279699 ) ) ( not ( = ?auto_279696 ?auto_279700 ) ) ( not ( = ?auto_279697 ?auto_279698 ) ) ( not ( = ?auto_279697 ?auto_279699 ) ) ( not ( = ?auto_279697 ?auto_279700 ) ) ( not ( = ?auto_279698 ?auto_279699 ) ) ( not ( = ?auto_279698 ?auto_279700 ) ) ( not ( = ?auto_279699 ?auto_279700 ) ) ( ON ?auto_279698 ?auto_279699 ) ( CLEAR ?auto_279696 ) ( ON ?auto_279697 ?auto_279698 ) ( CLEAR ?auto_279697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279693 ?auto_279694 ?auto_279695 ?auto_279696 ?auto_279697 )
      ( MAKE-7PILE ?auto_279693 ?auto_279694 ?auto_279695 ?auto_279696 ?auto_279697 ?auto_279698 ?auto_279699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279708 - BLOCK
      ?auto_279709 - BLOCK
      ?auto_279710 - BLOCK
      ?auto_279711 - BLOCK
      ?auto_279712 - BLOCK
      ?auto_279713 - BLOCK
      ?auto_279714 - BLOCK
    )
    :vars
    (
      ?auto_279715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279714 ?auto_279715 ) ( ON-TABLE ?auto_279708 ) ( ON ?auto_279709 ?auto_279708 ) ( ON ?auto_279710 ?auto_279709 ) ( not ( = ?auto_279708 ?auto_279709 ) ) ( not ( = ?auto_279708 ?auto_279710 ) ) ( not ( = ?auto_279708 ?auto_279711 ) ) ( not ( = ?auto_279708 ?auto_279712 ) ) ( not ( = ?auto_279708 ?auto_279713 ) ) ( not ( = ?auto_279708 ?auto_279714 ) ) ( not ( = ?auto_279708 ?auto_279715 ) ) ( not ( = ?auto_279709 ?auto_279710 ) ) ( not ( = ?auto_279709 ?auto_279711 ) ) ( not ( = ?auto_279709 ?auto_279712 ) ) ( not ( = ?auto_279709 ?auto_279713 ) ) ( not ( = ?auto_279709 ?auto_279714 ) ) ( not ( = ?auto_279709 ?auto_279715 ) ) ( not ( = ?auto_279710 ?auto_279711 ) ) ( not ( = ?auto_279710 ?auto_279712 ) ) ( not ( = ?auto_279710 ?auto_279713 ) ) ( not ( = ?auto_279710 ?auto_279714 ) ) ( not ( = ?auto_279710 ?auto_279715 ) ) ( not ( = ?auto_279711 ?auto_279712 ) ) ( not ( = ?auto_279711 ?auto_279713 ) ) ( not ( = ?auto_279711 ?auto_279714 ) ) ( not ( = ?auto_279711 ?auto_279715 ) ) ( not ( = ?auto_279712 ?auto_279713 ) ) ( not ( = ?auto_279712 ?auto_279714 ) ) ( not ( = ?auto_279712 ?auto_279715 ) ) ( not ( = ?auto_279713 ?auto_279714 ) ) ( not ( = ?auto_279713 ?auto_279715 ) ) ( not ( = ?auto_279714 ?auto_279715 ) ) ( ON ?auto_279713 ?auto_279714 ) ( ON ?auto_279712 ?auto_279713 ) ( CLEAR ?auto_279710 ) ( ON ?auto_279711 ?auto_279712 ) ( CLEAR ?auto_279711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279708 ?auto_279709 ?auto_279710 ?auto_279711 )
      ( MAKE-7PILE ?auto_279708 ?auto_279709 ?auto_279710 ?auto_279711 ?auto_279712 ?auto_279713 ?auto_279714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279723 - BLOCK
      ?auto_279724 - BLOCK
      ?auto_279725 - BLOCK
      ?auto_279726 - BLOCK
      ?auto_279727 - BLOCK
      ?auto_279728 - BLOCK
      ?auto_279729 - BLOCK
    )
    :vars
    (
      ?auto_279730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279729 ?auto_279730 ) ( ON-TABLE ?auto_279723 ) ( ON ?auto_279724 ?auto_279723 ) ( ON ?auto_279725 ?auto_279724 ) ( not ( = ?auto_279723 ?auto_279724 ) ) ( not ( = ?auto_279723 ?auto_279725 ) ) ( not ( = ?auto_279723 ?auto_279726 ) ) ( not ( = ?auto_279723 ?auto_279727 ) ) ( not ( = ?auto_279723 ?auto_279728 ) ) ( not ( = ?auto_279723 ?auto_279729 ) ) ( not ( = ?auto_279723 ?auto_279730 ) ) ( not ( = ?auto_279724 ?auto_279725 ) ) ( not ( = ?auto_279724 ?auto_279726 ) ) ( not ( = ?auto_279724 ?auto_279727 ) ) ( not ( = ?auto_279724 ?auto_279728 ) ) ( not ( = ?auto_279724 ?auto_279729 ) ) ( not ( = ?auto_279724 ?auto_279730 ) ) ( not ( = ?auto_279725 ?auto_279726 ) ) ( not ( = ?auto_279725 ?auto_279727 ) ) ( not ( = ?auto_279725 ?auto_279728 ) ) ( not ( = ?auto_279725 ?auto_279729 ) ) ( not ( = ?auto_279725 ?auto_279730 ) ) ( not ( = ?auto_279726 ?auto_279727 ) ) ( not ( = ?auto_279726 ?auto_279728 ) ) ( not ( = ?auto_279726 ?auto_279729 ) ) ( not ( = ?auto_279726 ?auto_279730 ) ) ( not ( = ?auto_279727 ?auto_279728 ) ) ( not ( = ?auto_279727 ?auto_279729 ) ) ( not ( = ?auto_279727 ?auto_279730 ) ) ( not ( = ?auto_279728 ?auto_279729 ) ) ( not ( = ?auto_279728 ?auto_279730 ) ) ( not ( = ?auto_279729 ?auto_279730 ) ) ( ON ?auto_279728 ?auto_279729 ) ( ON ?auto_279727 ?auto_279728 ) ( CLEAR ?auto_279725 ) ( ON ?auto_279726 ?auto_279727 ) ( CLEAR ?auto_279726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279723 ?auto_279724 ?auto_279725 ?auto_279726 )
      ( MAKE-7PILE ?auto_279723 ?auto_279724 ?auto_279725 ?auto_279726 ?auto_279727 ?auto_279728 ?auto_279729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279738 - BLOCK
      ?auto_279739 - BLOCK
      ?auto_279740 - BLOCK
      ?auto_279741 - BLOCK
      ?auto_279742 - BLOCK
      ?auto_279743 - BLOCK
      ?auto_279744 - BLOCK
    )
    :vars
    (
      ?auto_279745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279744 ?auto_279745 ) ( ON-TABLE ?auto_279738 ) ( ON ?auto_279739 ?auto_279738 ) ( not ( = ?auto_279738 ?auto_279739 ) ) ( not ( = ?auto_279738 ?auto_279740 ) ) ( not ( = ?auto_279738 ?auto_279741 ) ) ( not ( = ?auto_279738 ?auto_279742 ) ) ( not ( = ?auto_279738 ?auto_279743 ) ) ( not ( = ?auto_279738 ?auto_279744 ) ) ( not ( = ?auto_279738 ?auto_279745 ) ) ( not ( = ?auto_279739 ?auto_279740 ) ) ( not ( = ?auto_279739 ?auto_279741 ) ) ( not ( = ?auto_279739 ?auto_279742 ) ) ( not ( = ?auto_279739 ?auto_279743 ) ) ( not ( = ?auto_279739 ?auto_279744 ) ) ( not ( = ?auto_279739 ?auto_279745 ) ) ( not ( = ?auto_279740 ?auto_279741 ) ) ( not ( = ?auto_279740 ?auto_279742 ) ) ( not ( = ?auto_279740 ?auto_279743 ) ) ( not ( = ?auto_279740 ?auto_279744 ) ) ( not ( = ?auto_279740 ?auto_279745 ) ) ( not ( = ?auto_279741 ?auto_279742 ) ) ( not ( = ?auto_279741 ?auto_279743 ) ) ( not ( = ?auto_279741 ?auto_279744 ) ) ( not ( = ?auto_279741 ?auto_279745 ) ) ( not ( = ?auto_279742 ?auto_279743 ) ) ( not ( = ?auto_279742 ?auto_279744 ) ) ( not ( = ?auto_279742 ?auto_279745 ) ) ( not ( = ?auto_279743 ?auto_279744 ) ) ( not ( = ?auto_279743 ?auto_279745 ) ) ( not ( = ?auto_279744 ?auto_279745 ) ) ( ON ?auto_279743 ?auto_279744 ) ( ON ?auto_279742 ?auto_279743 ) ( ON ?auto_279741 ?auto_279742 ) ( CLEAR ?auto_279739 ) ( ON ?auto_279740 ?auto_279741 ) ( CLEAR ?auto_279740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279738 ?auto_279739 ?auto_279740 )
      ( MAKE-7PILE ?auto_279738 ?auto_279739 ?auto_279740 ?auto_279741 ?auto_279742 ?auto_279743 ?auto_279744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279753 - BLOCK
      ?auto_279754 - BLOCK
      ?auto_279755 - BLOCK
      ?auto_279756 - BLOCK
      ?auto_279757 - BLOCK
      ?auto_279758 - BLOCK
      ?auto_279759 - BLOCK
    )
    :vars
    (
      ?auto_279760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279759 ?auto_279760 ) ( ON-TABLE ?auto_279753 ) ( ON ?auto_279754 ?auto_279753 ) ( not ( = ?auto_279753 ?auto_279754 ) ) ( not ( = ?auto_279753 ?auto_279755 ) ) ( not ( = ?auto_279753 ?auto_279756 ) ) ( not ( = ?auto_279753 ?auto_279757 ) ) ( not ( = ?auto_279753 ?auto_279758 ) ) ( not ( = ?auto_279753 ?auto_279759 ) ) ( not ( = ?auto_279753 ?auto_279760 ) ) ( not ( = ?auto_279754 ?auto_279755 ) ) ( not ( = ?auto_279754 ?auto_279756 ) ) ( not ( = ?auto_279754 ?auto_279757 ) ) ( not ( = ?auto_279754 ?auto_279758 ) ) ( not ( = ?auto_279754 ?auto_279759 ) ) ( not ( = ?auto_279754 ?auto_279760 ) ) ( not ( = ?auto_279755 ?auto_279756 ) ) ( not ( = ?auto_279755 ?auto_279757 ) ) ( not ( = ?auto_279755 ?auto_279758 ) ) ( not ( = ?auto_279755 ?auto_279759 ) ) ( not ( = ?auto_279755 ?auto_279760 ) ) ( not ( = ?auto_279756 ?auto_279757 ) ) ( not ( = ?auto_279756 ?auto_279758 ) ) ( not ( = ?auto_279756 ?auto_279759 ) ) ( not ( = ?auto_279756 ?auto_279760 ) ) ( not ( = ?auto_279757 ?auto_279758 ) ) ( not ( = ?auto_279757 ?auto_279759 ) ) ( not ( = ?auto_279757 ?auto_279760 ) ) ( not ( = ?auto_279758 ?auto_279759 ) ) ( not ( = ?auto_279758 ?auto_279760 ) ) ( not ( = ?auto_279759 ?auto_279760 ) ) ( ON ?auto_279758 ?auto_279759 ) ( ON ?auto_279757 ?auto_279758 ) ( ON ?auto_279756 ?auto_279757 ) ( CLEAR ?auto_279754 ) ( ON ?auto_279755 ?auto_279756 ) ( CLEAR ?auto_279755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279753 ?auto_279754 ?auto_279755 )
      ( MAKE-7PILE ?auto_279753 ?auto_279754 ?auto_279755 ?auto_279756 ?auto_279757 ?auto_279758 ?auto_279759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279768 - BLOCK
      ?auto_279769 - BLOCK
      ?auto_279770 - BLOCK
      ?auto_279771 - BLOCK
      ?auto_279772 - BLOCK
      ?auto_279773 - BLOCK
      ?auto_279774 - BLOCK
    )
    :vars
    (
      ?auto_279775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279774 ?auto_279775 ) ( ON-TABLE ?auto_279768 ) ( not ( = ?auto_279768 ?auto_279769 ) ) ( not ( = ?auto_279768 ?auto_279770 ) ) ( not ( = ?auto_279768 ?auto_279771 ) ) ( not ( = ?auto_279768 ?auto_279772 ) ) ( not ( = ?auto_279768 ?auto_279773 ) ) ( not ( = ?auto_279768 ?auto_279774 ) ) ( not ( = ?auto_279768 ?auto_279775 ) ) ( not ( = ?auto_279769 ?auto_279770 ) ) ( not ( = ?auto_279769 ?auto_279771 ) ) ( not ( = ?auto_279769 ?auto_279772 ) ) ( not ( = ?auto_279769 ?auto_279773 ) ) ( not ( = ?auto_279769 ?auto_279774 ) ) ( not ( = ?auto_279769 ?auto_279775 ) ) ( not ( = ?auto_279770 ?auto_279771 ) ) ( not ( = ?auto_279770 ?auto_279772 ) ) ( not ( = ?auto_279770 ?auto_279773 ) ) ( not ( = ?auto_279770 ?auto_279774 ) ) ( not ( = ?auto_279770 ?auto_279775 ) ) ( not ( = ?auto_279771 ?auto_279772 ) ) ( not ( = ?auto_279771 ?auto_279773 ) ) ( not ( = ?auto_279771 ?auto_279774 ) ) ( not ( = ?auto_279771 ?auto_279775 ) ) ( not ( = ?auto_279772 ?auto_279773 ) ) ( not ( = ?auto_279772 ?auto_279774 ) ) ( not ( = ?auto_279772 ?auto_279775 ) ) ( not ( = ?auto_279773 ?auto_279774 ) ) ( not ( = ?auto_279773 ?auto_279775 ) ) ( not ( = ?auto_279774 ?auto_279775 ) ) ( ON ?auto_279773 ?auto_279774 ) ( ON ?auto_279772 ?auto_279773 ) ( ON ?auto_279771 ?auto_279772 ) ( ON ?auto_279770 ?auto_279771 ) ( CLEAR ?auto_279768 ) ( ON ?auto_279769 ?auto_279770 ) ( CLEAR ?auto_279769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279768 ?auto_279769 )
      ( MAKE-7PILE ?auto_279768 ?auto_279769 ?auto_279770 ?auto_279771 ?auto_279772 ?auto_279773 ?auto_279774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279783 - BLOCK
      ?auto_279784 - BLOCK
      ?auto_279785 - BLOCK
      ?auto_279786 - BLOCK
      ?auto_279787 - BLOCK
      ?auto_279788 - BLOCK
      ?auto_279789 - BLOCK
    )
    :vars
    (
      ?auto_279790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279789 ?auto_279790 ) ( ON-TABLE ?auto_279783 ) ( not ( = ?auto_279783 ?auto_279784 ) ) ( not ( = ?auto_279783 ?auto_279785 ) ) ( not ( = ?auto_279783 ?auto_279786 ) ) ( not ( = ?auto_279783 ?auto_279787 ) ) ( not ( = ?auto_279783 ?auto_279788 ) ) ( not ( = ?auto_279783 ?auto_279789 ) ) ( not ( = ?auto_279783 ?auto_279790 ) ) ( not ( = ?auto_279784 ?auto_279785 ) ) ( not ( = ?auto_279784 ?auto_279786 ) ) ( not ( = ?auto_279784 ?auto_279787 ) ) ( not ( = ?auto_279784 ?auto_279788 ) ) ( not ( = ?auto_279784 ?auto_279789 ) ) ( not ( = ?auto_279784 ?auto_279790 ) ) ( not ( = ?auto_279785 ?auto_279786 ) ) ( not ( = ?auto_279785 ?auto_279787 ) ) ( not ( = ?auto_279785 ?auto_279788 ) ) ( not ( = ?auto_279785 ?auto_279789 ) ) ( not ( = ?auto_279785 ?auto_279790 ) ) ( not ( = ?auto_279786 ?auto_279787 ) ) ( not ( = ?auto_279786 ?auto_279788 ) ) ( not ( = ?auto_279786 ?auto_279789 ) ) ( not ( = ?auto_279786 ?auto_279790 ) ) ( not ( = ?auto_279787 ?auto_279788 ) ) ( not ( = ?auto_279787 ?auto_279789 ) ) ( not ( = ?auto_279787 ?auto_279790 ) ) ( not ( = ?auto_279788 ?auto_279789 ) ) ( not ( = ?auto_279788 ?auto_279790 ) ) ( not ( = ?auto_279789 ?auto_279790 ) ) ( ON ?auto_279788 ?auto_279789 ) ( ON ?auto_279787 ?auto_279788 ) ( ON ?auto_279786 ?auto_279787 ) ( ON ?auto_279785 ?auto_279786 ) ( CLEAR ?auto_279783 ) ( ON ?auto_279784 ?auto_279785 ) ( CLEAR ?auto_279784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_279783 ?auto_279784 )
      ( MAKE-7PILE ?auto_279783 ?auto_279784 ?auto_279785 ?auto_279786 ?auto_279787 ?auto_279788 ?auto_279789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279798 - BLOCK
      ?auto_279799 - BLOCK
      ?auto_279800 - BLOCK
      ?auto_279801 - BLOCK
      ?auto_279802 - BLOCK
      ?auto_279803 - BLOCK
      ?auto_279804 - BLOCK
    )
    :vars
    (
      ?auto_279805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279804 ?auto_279805 ) ( not ( = ?auto_279798 ?auto_279799 ) ) ( not ( = ?auto_279798 ?auto_279800 ) ) ( not ( = ?auto_279798 ?auto_279801 ) ) ( not ( = ?auto_279798 ?auto_279802 ) ) ( not ( = ?auto_279798 ?auto_279803 ) ) ( not ( = ?auto_279798 ?auto_279804 ) ) ( not ( = ?auto_279798 ?auto_279805 ) ) ( not ( = ?auto_279799 ?auto_279800 ) ) ( not ( = ?auto_279799 ?auto_279801 ) ) ( not ( = ?auto_279799 ?auto_279802 ) ) ( not ( = ?auto_279799 ?auto_279803 ) ) ( not ( = ?auto_279799 ?auto_279804 ) ) ( not ( = ?auto_279799 ?auto_279805 ) ) ( not ( = ?auto_279800 ?auto_279801 ) ) ( not ( = ?auto_279800 ?auto_279802 ) ) ( not ( = ?auto_279800 ?auto_279803 ) ) ( not ( = ?auto_279800 ?auto_279804 ) ) ( not ( = ?auto_279800 ?auto_279805 ) ) ( not ( = ?auto_279801 ?auto_279802 ) ) ( not ( = ?auto_279801 ?auto_279803 ) ) ( not ( = ?auto_279801 ?auto_279804 ) ) ( not ( = ?auto_279801 ?auto_279805 ) ) ( not ( = ?auto_279802 ?auto_279803 ) ) ( not ( = ?auto_279802 ?auto_279804 ) ) ( not ( = ?auto_279802 ?auto_279805 ) ) ( not ( = ?auto_279803 ?auto_279804 ) ) ( not ( = ?auto_279803 ?auto_279805 ) ) ( not ( = ?auto_279804 ?auto_279805 ) ) ( ON ?auto_279803 ?auto_279804 ) ( ON ?auto_279802 ?auto_279803 ) ( ON ?auto_279801 ?auto_279802 ) ( ON ?auto_279800 ?auto_279801 ) ( ON ?auto_279799 ?auto_279800 ) ( ON ?auto_279798 ?auto_279799 ) ( CLEAR ?auto_279798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279798 )
      ( MAKE-7PILE ?auto_279798 ?auto_279799 ?auto_279800 ?auto_279801 ?auto_279802 ?auto_279803 ?auto_279804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_279813 - BLOCK
      ?auto_279814 - BLOCK
      ?auto_279815 - BLOCK
      ?auto_279816 - BLOCK
      ?auto_279817 - BLOCK
      ?auto_279818 - BLOCK
      ?auto_279819 - BLOCK
    )
    :vars
    (
      ?auto_279820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279819 ?auto_279820 ) ( not ( = ?auto_279813 ?auto_279814 ) ) ( not ( = ?auto_279813 ?auto_279815 ) ) ( not ( = ?auto_279813 ?auto_279816 ) ) ( not ( = ?auto_279813 ?auto_279817 ) ) ( not ( = ?auto_279813 ?auto_279818 ) ) ( not ( = ?auto_279813 ?auto_279819 ) ) ( not ( = ?auto_279813 ?auto_279820 ) ) ( not ( = ?auto_279814 ?auto_279815 ) ) ( not ( = ?auto_279814 ?auto_279816 ) ) ( not ( = ?auto_279814 ?auto_279817 ) ) ( not ( = ?auto_279814 ?auto_279818 ) ) ( not ( = ?auto_279814 ?auto_279819 ) ) ( not ( = ?auto_279814 ?auto_279820 ) ) ( not ( = ?auto_279815 ?auto_279816 ) ) ( not ( = ?auto_279815 ?auto_279817 ) ) ( not ( = ?auto_279815 ?auto_279818 ) ) ( not ( = ?auto_279815 ?auto_279819 ) ) ( not ( = ?auto_279815 ?auto_279820 ) ) ( not ( = ?auto_279816 ?auto_279817 ) ) ( not ( = ?auto_279816 ?auto_279818 ) ) ( not ( = ?auto_279816 ?auto_279819 ) ) ( not ( = ?auto_279816 ?auto_279820 ) ) ( not ( = ?auto_279817 ?auto_279818 ) ) ( not ( = ?auto_279817 ?auto_279819 ) ) ( not ( = ?auto_279817 ?auto_279820 ) ) ( not ( = ?auto_279818 ?auto_279819 ) ) ( not ( = ?auto_279818 ?auto_279820 ) ) ( not ( = ?auto_279819 ?auto_279820 ) ) ( ON ?auto_279818 ?auto_279819 ) ( ON ?auto_279817 ?auto_279818 ) ( ON ?auto_279816 ?auto_279817 ) ( ON ?auto_279815 ?auto_279816 ) ( ON ?auto_279814 ?auto_279815 ) ( ON ?auto_279813 ?auto_279814 ) ( CLEAR ?auto_279813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_279813 )
      ( MAKE-7PILE ?auto_279813 ?auto_279814 ?auto_279815 ?auto_279816 ?auto_279817 ?auto_279818 ?auto_279819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279829 - BLOCK
      ?auto_279830 - BLOCK
      ?auto_279831 - BLOCK
      ?auto_279832 - BLOCK
      ?auto_279833 - BLOCK
      ?auto_279834 - BLOCK
      ?auto_279835 - BLOCK
      ?auto_279836 - BLOCK
    )
    :vars
    (
      ?auto_279837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279835 ) ( ON ?auto_279836 ?auto_279837 ) ( CLEAR ?auto_279836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279829 ) ( ON ?auto_279830 ?auto_279829 ) ( ON ?auto_279831 ?auto_279830 ) ( ON ?auto_279832 ?auto_279831 ) ( ON ?auto_279833 ?auto_279832 ) ( ON ?auto_279834 ?auto_279833 ) ( ON ?auto_279835 ?auto_279834 ) ( not ( = ?auto_279829 ?auto_279830 ) ) ( not ( = ?auto_279829 ?auto_279831 ) ) ( not ( = ?auto_279829 ?auto_279832 ) ) ( not ( = ?auto_279829 ?auto_279833 ) ) ( not ( = ?auto_279829 ?auto_279834 ) ) ( not ( = ?auto_279829 ?auto_279835 ) ) ( not ( = ?auto_279829 ?auto_279836 ) ) ( not ( = ?auto_279829 ?auto_279837 ) ) ( not ( = ?auto_279830 ?auto_279831 ) ) ( not ( = ?auto_279830 ?auto_279832 ) ) ( not ( = ?auto_279830 ?auto_279833 ) ) ( not ( = ?auto_279830 ?auto_279834 ) ) ( not ( = ?auto_279830 ?auto_279835 ) ) ( not ( = ?auto_279830 ?auto_279836 ) ) ( not ( = ?auto_279830 ?auto_279837 ) ) ( not ( = ?auto_279831 ?auto_279832 ) ) ( not ( = ?auto_279831 ?auto_279833 ) ) ( not ( = ?auto_279831 ?auto_279834 ) ) ( not ( = ?auto_279831 ?auto_279835 ) ) ( not ( = ?auto_279831 ?auto_279836 ) ) ( not ( = ?auto_279831 ?auto_279837 ) ) ( not ( = ?auto_279832 ?auto_279833 ) ) ( not ( = ?auto_279832 ?auto_279834 ) ) ( not ( = ?auto_279832 ?auto_279835 ) ) ( not ( = ?auto_279832 ?auto_279836 ) ) ( not ( = ?auto_279832 ?auto_279837 ) ) ( not ( = ?auto_279833 ?auto_279834 ) ) ( not ( = ?auto_279833 ?auto_279835 ) ) ( not ( = ?auto_279833 ?auto_279836 ) ) ( not ( = ?auto_279833 ?auto_279837 ) ) ( not ( = ?auto_279834 ?auto_279835 ) ) ( not ( = ?auto_279834 ?auto_279836 ) ) ( not ( = ?auto_279834 ?auto_279837 ) ) ( not ( = ?auto_279835 ?auto_279836 ) ) ( not ( = ?auto_279835 ?auto_279837 ) ) ( not ( = ?auto_279836 ?auto_279837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279836 ?auto_279837 )
      ( !STACK ?auto_279836 ?auto_279835 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279846 - BLOCK
      ?auto_279847 - BLOCK
      ?auto_279848 - BLOCK
      ?auto_279849 - BLOCK
      ?auto_279850 - BLOCK
      ?auto_279851 - BLOCK
      ?auto_279852 - BLOCK
      ?auto_279853 - BLOCK
    )
    :vars
    (
      ?auto_279854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279852 ) ( ON ?auto_279853 ?auto_279854 ) ( CLEAR ?auto_279853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_279846 ) ( ON ?auto_279847 ?auto_279846 ) ( ON ?auto_279848 ?auto_279847 ) ( ON ?auto_279849 ?auto_279848 ) ( ON ?auto_279850 ?auto_279849 ) ( ON ?auto_279851 ?auto_279850 ) ( ON ?auto_279852 ?auto_279851 ) ( not ( = ?auto_279846 ?auto_279847 ) ) ( not ( = ?auto_279846 ?auto_279848 ) ) ( not ( = ?auto_279846 ?auto_279849 ) ) ( not ( = ?auto_279846 ?auto_279850 ) ) ( not ( = ?auto_279846 ?auto_279851 ) ) ( not ( = ?auto_279846 ?auto_279852 ) ) ( not ( = ?auto_279846 ?auto_279853 ) ) ( not ( = ?auto_279846 ?auto_279854 ) ) ( not ( = ?auto_279847 ?auto_279848 ) ) ( not ( = ?auto_279847 ?auto_279849 ) ) ( not ( = ?auto_279847 ?auto_279850 ) ) ( not ( = ?auto_279847 ?auto_279851 ) ) ( not ( = ?auto_279847 ?auto_279852 ) ) ( not ( = ?auto_279847 ?auto_279853 ) ) ( not ( = ?auto_279847 ?auto_279854 ) ) ( not ( = ?auto_279848 ?auto_279849 ) ) ( not ( = ?auto_279848 ?auto_279850 ) ) ( not ( = ?auto_279848 ?auto_279851 ) ) ( not ( = ?auto_279848 ?auto_279852 ) ) ( not ( = ?auto_279848 ?auto_279853 ) ) ( not ( = ?auto_279848 ?auto_279854 ) ) ( not ( = ?auto_279849 ?auto_279850 ) ) ( not ( = ?auto_279849 ?auto_279851 ) ) ( not ( = ?auto_279849 ?auto_279852 ) ) ( not ( = ?auto_279849 ?auto_279853 ) ) ( not ( = ?auto_279849 ?auto_279854 ) ) ( not ( = ?auto_279850 ?auto_279851 ) ) ( not ( = ?auto_279850 ?auto_279852 ) ) ( not ( = ?auto_279850 ?auto_279853 ) ) ( not ( = ?auto_279850 ?auto_279854 ) ) ( not ( = ?auto_279851 ?auto_279852 ) ) ( not ( = ?auto_279851 ?auto_279853 ) ) ( not ( = ?auto_279851 ?auto_279854 ) ) ( not ( = ?auto_279852 ?auto_279853 ) ) ( not ( = ?auto_279852 ?auto_279854 ) ) ( not ( = ?auto_279853 ?auto_279854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_279853 ?auto_279854 )
      ( !STACK ?auto_279853 ?auto_279852 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279863 - BLOCK
      ?auto_279864 - BLOCK
      ?auto_279865 - BLOCK
      ?auto_279866 - BLOCK
      ?auto_279867 - BLOCK
      ?auto_279868 - BLOCK
      ?auto_279869 - BLOCK
      ?auto_279870 - BLOCK
    )
    :vars
    (
      ?auto_279871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279870 ?auto_279871 ) ( ON-TABLE ?auto_279863 ) ( ON ?auto_279864 ?auto_279863 ) ( ON ?auto_279865 ?auto_279864 ) ( ON ?auto_279866 ?auto_279865 ) ( ON ?auto_279867 ?auto_279866 ) ( ON ?auto_279868 ?auto_279867 ) ( not ( = ?auto_279863 ?auto_279864 ) ) ( not ( = ?auto_279863 ?auto_279865 ) ) ( not ( = ?auto_279863 ?auto_279866 ) ) ( not ( = ?auto_279863 ?auto_279867 ) ) ( not ( = ?auto_279863 ?auto_279868 ) ) ( not ( = ?auto_279863 ?auto_279869 ) ) ( not ( = ?auto_279863 ?auto_279870 ) ) ( not ( = ?auto_279863 ?auto_279871 ) ) ( not ( = ?auto_279864 ?auto_279865 ) ) ( not ( = ?auto_279864 ?auto_279866 ) ) ( not ( = ?auto_279864 ?auto_279867 ) ) ( not ( = ?auto_279864 ?auto_279868 ) ) ( not ( = ?auto_279864 ?auto_279869 ) ) ( not ( = ?auto_279864 ?auto_279870 ) ) ( not ( = ?auto_279864 ?auto_279871 ) ) ( not ( = ?auto_279865 ?auto_279866 ) ) ( not ( = ?auto_279865 ?auto_279867 ) ) ( not ( = ?auto_279865 ?auto_279868 ) ) ( not ( = ?auto_279865 ?auto_279869 ) ) ( not ( = ?auto_279865 ?auto_279870 ) ) ( not ( = ?auto_279865 ?auto_279871 ) ) ( not ( = ?auto_279866 ?auto_279867 ) ) ( not ( = ?auto_279866 ?auto_279868 ) ) ( not ( = ?auto_279866 ?auto_279869 ) ) ( not ( = ?auto_279866 ?auto_279870 ) ) ( not ( = ?auto_279866 ?auto_279871 ) ) ( not ( = ?auto_279867 ?auto_279868 ) ) ( not ( = ?auto_279867 ?auto_279869 ) ) ( not ( = ?auto_279867 ?auto_279870 ) ) ( not ( = ?auto_279867 ?auto_279871 ) ) ( not ( = ?auto_279868 ?auto_279869 ) ) ( not ( = ?auto_279868 ?auto_279870 ) ) ( not ( = ?auto_279868 ?auto_279871 ) ) ( not ( = ?auto_279869 ?auto_279870 ) ) ( not ( = ?auto_279869 ?auto_279871 ) ) ( not ( = ?auto_279870 ?auto_279871 ) ) ( CLEAR ?auto_279868 ) ( ON ?auto_279869 ?auto_279870 ) ( CLEAR ?auto_279869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_279863 ?auto_279864 ?auto_279865 ?auto_279866 ?auto_279867 ?auto_279868 ?auto_279869 )
      ( MAKE-8PILE ?auto_279863 ?auto_279864 ?auto_279865 ?auto_279866 ?auto_279867 ?auto_279868 ?auto_279869 ?auto_279870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279880 - BLOCK
      ?auto_279881 - BLOCK
      ?auto_279882 - BLOCK
      ?auto_279883 - BLOCK
      ?auto_279884 - BLOCK
      ?auto_279885 - BLOCK
      ?auto_279886 - BLOCK
      ?auto_279887 - BLOCK
    )
    :vars
    (
      ?auto_279888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279887 ?auto_279888 ) ( ON-TABLE ?auto_279880 ) ( ON ?auto_279881 ?auto_279880 ) ( ON ?auto_279882 ?auto_279881 ) ( ON ?auto_279883 ?auto_279882 ) ( ON ?auto_279884 ?auto_279883 ) ( ON ?auto_279885 ?auto_279884 ) ( not ( = ?auto_279880 ?auto_279881 ) ) ( not ( = ?auto_279880 ?auto_279882 ) ) ( not ( = ?auto_279880 ?auto_279883 ) ) ( not ( = ?auto_279880 ?auto_279884 ) ) ( not ( = ?auto_279880 ?auto_279885 ) ) ( not ( = ?auto_279880 ?auto_279886 ) ) ( not ( = ?auto_279880 ?auto_279887 ) ) ( not ( = ?auto_279880 ?auto_279888 ) ) ( not ( = ?auto_279881 ?auto_279882 ) ) ( not ( = ?auto_279881 ?auto_279883 ) ) ( not ( = ?auto_279881 ?auto_279884 ) ) ( not ( = ?auto_279881 ?auto_279885 ) ) ( not ( = ?auto_279881 ?auto_279886 ) ) ( not ( = ?auto_279881 ?auto_279887 ) ) ( not ( = ?auto_279881 ?auto_279888 ) ) ( not ( = ?auto_279882 ?auto_279883 ) ) ( not ( = ?auto_279882 ?auto_279884 ) ) ( not ( = ?auto_279882 ?auto_279885 ) ) ( not ( = ?auto_279882 ?auto_279886 ) ) ( not ( = ?auto_279882 ?auto_279887 ) ) ( not ( = ?auto_279882 ?auto_279888 ) ) ( not ( = ?auto_279883 ?auto_279884 ) ) ( not ( = ?auto_279883 ?auto_279885 ) ) ( not ( = ?auto_279883 ?auto_279886 ) ) ( not ( = ?auto_279883 ?auto_279887 ) ) ( not ( = ?auto_279883 ?auto_279888 ) ) ( not ( = ?auto_279884 ?auto_279885 ) ) ( not ( = ?auto_279884 ?auto_279886 ) ) ( not ( = ?auto_279884 ?auto_279887 ) ) ( not ( = ?auto_279884 ?auto_279888 ) ) ( not ( = ?auto_279885 ?auto_279886 ) ) ( not ( = ?auto_279885 ?auto_279887 ) ) ( not ( = ?auto_279885 ?auto_279888 ) ) ( not ( = ?auto_279886 ?auto_279887 ) ) ( not ( = ?auto_279886 ?auto_279888 ) ) ( not ( = ?auto_279887 ?auto_279888 ) ) ( CLEAR ?auto_279885 ) ( ON ?auto_279886 ?auto_279887 ) ( CLEAR ?auto_279886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_279880 ?auto_279881 ?auto_279882 ?auto_279883 ?auto_279884 ?auto_279885 ?auto_279886 )
      ( MAKE-8PILE ?auto_279880 ?auto_279881 ?auto_279882 ?auto_279883 ?auto_279884 ?auto_279885 ?auto_279886 ?auto_279887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279897 - BLOCK
      ?auto_279898 - BLOCK
      ?auto_279899 - BLOCK
      ?auto_279900 - BLOCK
      ?auto_279901 - BLOCK
      ?auto_279902 - BLOCK
      ?auto_279903 - BLOCK
      ?auto_279904 - BLOCK
    )
    :vars
    (
      ?auto_279905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279904 ?auto_279905 ) ( ON-TABLE ?auto_279897 ) ( ON ?auto_279898 ?auto_279897 ) ( ON ?auto_279899 ?auto_279898 ) ( ON ?auto_279900 ?auto_279899 ) ( ON ?auto_279901 ?auto_279900 ) ( not ( = ?auto_279897 ?auto_279898 ) ) ( not ( = ?auto_279897 ?auto_279899 ) ) ( not ( = ?auto_279897 ?auto_279900 ) ) ( not ( = ?auto_279897 ?auto_279901 ) ) ( not ( = ?auto_279897 ?auto_279902 ) ) ( not ( = ?auto_279897 ?auto_279903 ) ) ( not ( = ?auto_279897 ?auto_279904 ) ) ( not ( = ?auto_279897 ?auto_279905 ) ) ( not ( = ?auto_279898 ?auto_279899 ) ) ( not ( = ?auto_279898 ?auto_279900 ) ) ( not ( = ?auto_279898 ?auto_279901 ) ) ( not ( = ?auto_279898 ?auto_279902 ) ) ( not ( = ?auto_279898 ?auto_279903 ) ) ( not ( = ?auto_279898 ?auto_279904 ) ) ( not ( = ?auto_279898 ?auto_279905 ) ) ( not ( = ?auto_279899 ?auto_279900 ) ) ( not ( = ?auto_279899 ?auto_279901 ) ) ( not ( = ?auto_279899 ?auto_279902 ) ) ( not ( = ?auto_279899 ?auto_279903 ) ) ( not ( = ?auto_279899 ?auto_279904 ) ) ( not ( = ?auto_279899 ?auto_279905 ) ) ( not ( = ?auto_279900 ?auto_279901 ) ) ( not ( = ?auto_279900 ?auto_279902 ) ) ( not ( = ?auto_279900 ?auto_279903 ) ) ( not ( = ?auto_279900 ?auto_279904 ) ) ( not ( = ?auto_279900 ?auto_279905 ) ) ( not ( = ?auto_279901 ?auto_279902 ) ) ( not ( = ?auto_279901 ?auto_279903 ) ) ( not ( = ?auto_279901 ?auto_279904 ) ) ( not ( = ?auto_279901 ?auto_279905 ) ) ( not ( = ?auto_279902 ?auto_279903 ) ) ( not ( = ?auto_279902 ?auto_279904 ) ) ( not ( = ?auto_279902 ?auto_279905 ) ) ( not ( = ?auto_279903 ?auto_279904 ) ) ( not ( = ?auto_279903 ?auto_279905 ) ) ( not ( = ?auto_279904 ?auto_279905 ) ) ( ON ?auto_279903 ?auto_279904 ) ( CLEAR ?auto_279901 ) ( ON ?auto_279902 ?auto_279903 ) ( CLEAR ?auto_279902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_279897 ?auto_279898 ?auto_279899 ?auto_279900 ?auto_279901 ?auto_279902 )
      ( MAKE-8PILE ?auto_279897 ?auto_279898 ?auto_279899 ?auto_279900 ?auto_279901 ?auto_279902 ?auto_279903 ?auto_279904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279914 - BLOCK
      ?auto_279915 - BLOCK
      ?auto_279916 - BLOCK
      ?auto_279917 - BLOCK
      ?auto_279918 - BLOCK
      ?auto_279919 - BLOCK
      ?auto_279920 - BLOCK
      ?auto_279921 - BLOCK
    )
    :vars
    (
      ?auto_279922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279921 ?auto_279922 ) ( ON-TABLE ?auto_279914 ) ( ON ?auto_279915 ?auto_279914 ) ( ON ?auto_279916 ?auto_279915 ) ( ON ?auto_279917 ?auto_279916 ) ( ON ?auto_279918 ?auto_279917 ) ( not ( = ?auto_279914 ?auto_279915 ) ) ( not ( = ?auto_279914 ?auto_279916 ) ) ( not ( = ?auto_279914 ?auto_279917 ) ) ( not ( = ?auto_279914 ?auto_279918 ) ) ( not ( = ?auto_279914 ?auto_279919 ) ) ( not ( = ?auto_279914 ?auto_279920 ) ) ( not ( = ?auto_279914 ?auto_279921 ) ) ( not ( = ?auto_279914 ?auto_279922 ) ) ( not ( = ?auto_279915 ?auto_279916 ) ) ( not ( = ?auto_279915 ?auto_279917 ) ) ( not ( = ?auto_279915 ?auto_279918 ) ) ( not ( = ?auto_279915 ?auto_279919 ) ) ( not ( = ?auto_279915 ?auto_279920 ) ) ( not ( = ?auto_279915 ?auto_279921 ) ) ( not ( = ?auto_279915 ?auto_279922 ) ) ( not ( = ?auto_279916 ?auto_279917 ) ) ( not ( = ?auto_279916 ?auto_279918 ) ) ( not ( = ?auto_279916 ?auto_279919 ) ) ( not ( = ?auto_279916 ?auto_279920 ) ) ( not ( = ?auto_279916 ?auto_279921 ) ) ( not ( = ?auto_279916 ?auto_279922 ) ) ( not ( = ?auto_279917 ?auto_279918 ) ) ( not ( = ?auto_279917 ?auto_279919 ) ) ( not ( = ?auto_279917 ?auto_279920 ) ) ( not ( = ?auto_279917 ?auto_279921 ) ) ( not ( = ?auto_279917 ?auto_279922 ) ) ( not ( = ?auto_279918 ?auto_279919 ) ) ( not ( = ?auto_279918 ?auto_279920 ) ) ( not ( = ?auto_279918 ?auto_279921 ) ) ( not ( = ?auto_279918 ?auto_279922 ) ) ( not ( = ?auto_279919 ?auto_279920 ) ) ( not ( = ?auto_279919 ?auto_279921 ) ) ( not ( = ?auto_279919 ?auto_279922 ) ) ( not ( = ?auto_279920 ?auto_279921 ) ) ( not ( = ?auto_279920 ?auto_279922 ) ) ( not ( = ?auto_279921 ?auto_279922 ) ) ( ON ?auto_279920 ?auto_279921 ) ( CLEAR ?auto_279918 ) ( ON ?auto_279919 ?auto_279920 ) ( CLEAR ?auto_279919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_279914 ?auto_279915 ?auto_279916 ?auto_279917 ?auto_279918 ?auto_279919 )
      ( MAKE-8PILE ?auto_279914 ?auto_279915 ?auto_279916 ?auto_279917 ?auto_279918 ?auto_279919 ?auto_279920 ?auto_279921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279931 - BLOCK
      ?auto_279932 - BLOCK
      ?auto_279933 - BLOCK
      ?auto_279934 - BLOCK
      ?auto_279935 - BLOCK
      ?auto_279936 - BLOCK
      ?auto_279937 - BLOCK
      ?auto_279938 - BLOCK
    )
    :vars
    (
      ?auto_279939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279938 ?auto_279939 ) ( ON-TABLE ?auto_279931 ) ( ON ?auto_279932 ?auto_279931 ) ( ON ?auto_279933 ?auto_279932 ) ( ON ?auto_279934 ?auto_279933 ) ( not ( = ?auto_279931 ?auto_279932 ) ) ( not ( = ?auto_279931 ?auto_279933 ) ) ( not ( = ?auto_279931 ?auto_279934 ) ) ( not ( = ?auto_279931 ?auto_279935 ) ) ( not ( = ?auto_279931 ?auto_279936 ) ) ( not ( = ?auto_279931 ?auto_279937 ) ) ( not ( = ?auto_279931 ?auto_279938 ) ) ( not ( = ?auto_279931 ?auto_279939 ) ) ( not ( = ?auto_279932 ?auto_279933 ) ) ( not ( = ?auto_279932 ?auto_279934 ) ) ( not ( = ?auto_279932 ?auto_279935 ) ) ( not ( = ?auto_279932 ?auto_279936 ) ) ( not ( = ?auto_279932 ?auto_279937 ) ) ( not ( = ?auto_279932 ?auto_279938 ) ) ( not ( = ?auto_279932 ?auto_279939 ) ) ( not ( = ?auto_279933 ?auto_279934 ) ) ( not ( = ?auto_279933 ?auto_279935 ) ) ( not ( = ?auto_279933 ?auto_279936 ) ) ( not ( = ?auto_279933 ?auto_279937 ) ) ( not ( = ?auto_279933 ?auto_279938 ) ) ( not ( = ?auto_279933 ?auto_279939 ) ) ( not ( = ?auto_279934 ?auto_279935 ) ) ( not ( = ?auto_279934 ?auto_279936 ) ) ( not ( = ?auto_279934 ?auto_279937 ) ) ( not ( = ?auto_279934 ?auto_279938 ) ) ( not ( = ?auto_279934 ?auto_279939 ) ) ( not ( = ?auto_279935 ?auto_279936 ) ) ( not ( = ?auto_279935 ?auto_279937 ) ) ( not ( = ?auto_279935 ?auto_279938 ) ) ( not ( = ?auto_279935 ?auto_279939 ) ) ( not ( = ?auto_279936 ?auto_279937 ) ) ( not ( = ?auto_279936 ?auto_279938 ) ) ( not ( = ?auto_279936 ?auto_279939 ) ) ( not ( = ?auto_279937 ?auto_279938 ) ) ( not ( = ?auto_279937 ?auto_279939 ) ) ( not ( = ?auto_279938 ?auto_279939 ) ) ( ON ?auto_279937 ?auto_279938 ) ( ON ?auto_279936 ?auto_279937 ) ( CLEAR ?auto_279934 ) ( ON ?auto_279935 ?auto_279936 ) ( CLEAR ?auto_279935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279931 ?auto_279932 ?auto_279933 ?auto_279934 ?auto_279935 )
      ( MAKE-8PILE ?auto_279931 ?auto_279932 ?auto_279933 ?auto_279934 ?auto_279935 ?auto_279936 ?auto_279937 ?auto_279938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279948 - BLOCK
      ?auto_279949 - BLOCK
      ?auto_279950 - BLOCK
      ?auto_279951 - BLOCK
      ?auto_279952 - BLOCK
      ?auto_279953 - BLOCK
      ?auto_279954 - BLOCK
      ?auto_279955 - BLOCK
    )
    :vars
    (
      ?auto_279956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279955 ?auto_279956 ) ( ON-TABLE ?auto_279948 ) ( ON ?auto_279949 ?auto_279948 ) ( ON ?auto_279950 ?auto_279949 ) ( ON ?auto_279951 ?auto_279950 ) ( not ( = ?auto_279948 ?auto_279949 ) ) ( not ( = ?auto_279948 ?auto_279950 ) ) ( not ( = ?auto_279948 ?auto_279951 ) ) ( not ( = ?auto_279948 ?auto_279952 ) ) ( not ( = ?auto_279948 ?auto_279953 ) ) ( not ( = ?auto_279948 ?auto_279954 ) ) ( not ( = ?auto_279948 ?auto_279955 ) ) ( not ( = ?auto_279948 ?auto_279956 ) ) ( not ( = ?auto_279949 ?auto_279950 ) ) ( not ( = ?auto_279949 ?auto_279951 ) ) ( not ( = ?auto_279949 ?auto_279952 ) ) ( not ( = ?auto_279949 ?auto_279953 ) ) ( not ( = ?auto_279949 ?auto_279954 ) ) ( not ( = ?auto_279949 ?auto_279955 ) ) ( not ( = ?auto_279949 ?auto_279956 ) ) ( not ( = ?auto_279950 ?auto_279951 ) ) ( not ( = ?auto_279950 ?auto_279952 ) ) ( not ( = ?auto_279950 ?auto_279953 ) ) ( not ( = ?auto_279950 ?auto_279954 ) ) ( not ( = ?auto_279950 ?auto_279955 ) ) ( not ( = ?auto_279950 ?auto_279956 ) ) ( not ( = ?auto_279951 ?auto_279952 ) ) ( not ( = ?auto_279951 ?auto_279953 ) ) ( not ( = ?auto_279951 ?auto_279954 ) ) ( not ( = ?auto_279951 ?auto_279955 ) ) ( not ( = ?auto_279951 ?auto_279956 ) ) ( not ( = ?auto_279952 ?auto_279953 ) ) ( not ( = ?auto_279952 ?auto_279954 ) ) ( not ( = ?auto_279952 ?auto_279955 ) ) ( not ( = ?auto_279952 ?auto_279956 ) ) ( not ( = ?auto_279953 ?auto_279954 ) ) ( not ( = ?auto_279953 ?auto_279955 ) ) ( not ( = ?auto_279953 ?auto_279956 ) ) ( not ( = ?auto_279954 ?auto_279955 ) ) ( not ( = ?auto_279954 ?auto_279956 ) ) ( not ( = ?auto_279955 ?auto_279956 ) ) ( ON ?auto_279954 ?auto_279955 ) ( ON ?auto_279953 ?auto_279954 ) ( CLEAR ?auto_279951 ) ( ON ?auto_279952 ?auto_279953 ) ( CLEAR ?auto_279952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_279948 ?auto_279949 ?auto_279950 ?auto_279951 ?auto_279952 )
      ( MAKE-8PILE ?auto_279948 ?auto_279949 ?auto_279950 ?auto_279951 ?auto_279952 ?auto_279953 ?auto_279954 ?auto_279955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279965 - BLOCK
      ?auto_279966 - BLOCK
      ?auto_279967 - BLOCK
      ?auto_279968 - BLOCK
      ?auto_279969 - BLOCK
      ?auto_279970 - BLOCK
      ?auto_279971 - BLOCK
      ?auto_279972 - BLOCK
    )
    :vars
    (
      ?auto_279973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279972 ?auto_279973 ) ( ON-TABLE ?auto_279965 ) ( ON ?auto_279966 ?auto_279965 ) ( ON ?auto_279967 ?auto_279966 ) ( not ( = ?auto_279965 ?auto_279966 ) ) ( not ( = ?auto_279965 ?auto_279967 ) ) ( not ( = ?auto_279965 ?auto_279968 ) ) ( not ( = ?auto_279965 ?auto_279969 ) ) ( not ( = ?auto_279965 ?auto_279970 ) ) ( not ( = ?auto_279965 ?auto_279971 ) ) ( not ( = ?auto_279965 ?auto_279972 ) ) ( not ( = ?auto_279965 ?auto_279973 ) ) ( not ( = ?auto_279966 ?auto_279967 ) ) ( not ( = ?auto_279966 ?auto_279968 ) ) ( not ( = ?auto_279966 ?auto_279969 ) ) ( not ( = ?auto_279966 ?auto_279970 ) ) ( not ( = ?auto_279966 ?auto_279971 ) ) ( not ( = ?auto_279966 ?auto_279972 ) ) ( not ( = ?auto_279966 ?auto_279973 ) ) ( not ( = ?auto_279967 ?auto_279968 ) ) ( not ( = ?auto_279967 ?auto_279969 ) ) ( not ( = ?auto_279967 ?auto_279970 ) ) ( not ( = ?auto_279967 ?auto_279971 ) ) ( not ( = ?auto_279967 ?auto_279972 ) ) ( not ( = ?auto_279967 ?auto_279973 ) ) ( not ( = ?auto_279968 ?auto_279969 ) ) ( not ( = ?auto_279968 ?auto_279970 ) ) ( not ( = ?auto_279968 ?auto_279971 ) ) ( not ( = ?auto_279968 ?auto_279972 ) ) ( not ( = ?auto_279968 ?auto_279973 ) ) ( not ( = ?auto_279969 ?auto_279970 ) ) ( not ( = ?auto_279969 ?auto_279971 ) ) ( not ( = ?auto_279969 ?auto_279972 ) ) ( not ( = ?auto_279969 ?auto_279973 ) ) ( not ( = ?auto_279970 ?auto_279971 ) ) ( not ( = ?auto_279970 ?auto_279972 ) ) ( not ( = ?auto_279970 ?auto_279973 ) ) ( not ( = ?auto_279971 ?auto_279972 ) ) ( not ( = ?auto_279971 ?auto_279973 ) ) ( not ( = ?auto_279972 ?auto_279973 ) ) ( ON ?auto_279971 ?auto_279972 ) ( ON ?auto_279970 ?auto_279971 ) ( ON ?auto_279969 ?auto_279970 ) ( CLEAR ?auto_279967 ) ( ON ?auto_279968 ?auto_279969 ) ( CLEAR ?auto_279968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279965 ?auto_279966 ?auto_279967 ?auto_279968 )
      ( MAKE-8PILE ?auto_279965 ?auto_279966 ?auto_279967 ?auto_279968 ?auto_279969 ?auto_279970 ?auto_279971 ?auto_279972 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279982 - BLOCK
      ?auto_279983 - BLOCK
      ?auto_279984 - BLOCK
      ?auto_279985 - BLOCK
      ?auto_279986 - BLOCK
      ?auto_279987 - BLOCK
      ?auto_279988 - BLOCK
      ?auto_279989 - BLOCK
    )
    :vars
    (
      ?auto_279990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_279989 ?auto_279990 ) ( ON-TABLE ?auto_279982 ) ( ON ?auto_279983 ?auto_279982 ) ( ON ?auto_279984 ?auto_279983 ) ( not ( = ?auto_279982 ?auto_279983 ) ) ( not ( = ?auto_279982 ?auto_279984 ) ) ( not ( = ?auto_279982 ?auto_279985 ) ) ( not ( = ?auto_279982 ?auto_279986 ) ) ( not ( = ?auto_279982 ?auto_279987 ) ) ( not ( = ?auto_279982 ?auto_279988 ) ) ( not ( = ?auto_279982 ?auto_279989 ) ) ( not ( = ?auto_279982 ?auto_279990 ) ) ( not ( = ?auto_279983 ?auto_279984 ) ) ( not ( = ?auto_279983 ?auto_279985 ) ) ( not ( = ?auto_279983 ?auto_279986 ) ) ( not ( = ?auto_279983 ?auto_279987 ) ) ( not ( = ?auto_279983 ?auto_279988 ) ) ( not ( = ?auto_279983 ?auto_279989 ) ) ( not ( = ?auto_279983 ?auto_279990 ) ) ( not ( = ?auto_279984 ?auto_279985 ) ) ( not ( = ?auto_279984 ?auto_279986 ) ) ( not ( = ?auto_279984 ?auto_279987 ) ) ( not ( = ?auto_279984 ?auto_279988 ) ) ( not ( = ?auto_279984 ?auto_279989 ) ) ( not ( = ?auto_279984 ?auto_279990 ) ) ( not ( = ?auto_279985 ?auto_279986 ) ) ( not ( = ?auto_279985 ?auto_279987 ) ) ( not ( = ?auto_279985 ?auto_279988 ) ) ( not ( = ?auto_279985 ?auto_279989 ) ) ( not ( = ?auto_279985 ?auto_279990 ) ) ( not ( = ?auto_279986 ?auto_279987 ) ) ( not ( = ?auto_279986 ?auto_279988 ) ) ( not ( = ?auto_279986 ?auto_279989 ) ) ( not ( = ?auto_279986 ?auto_279990 ) ) ( not ( = ?auto_279987 ?auto_279988 ) ) ( not ( = ?auto_279987 ?auto_279989 ) ) ( not ( = ?auto_279987 ?auto_279990 ) ) ( not ( = ?auto_279988 ?auto_279989 ) ) ( not ( = ?auto_279988 ?auto_279990 ) ) ( not ( = ?auto_279989 ?auto_279990 ) ) ( ON ?auto_279988 ?auto_279989 ) ( ON ?auto_279987 ?auto_279988 ) ( ON ?auto_279986 ?auto_279987 ) ( CLEAR ?auto_279984 ) ( ON ?auto_279985 ?auto_279986 ) ( CLEAR ?auto_279985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_279982 ?auto_279983 ?auto_279984 ?auto_279985 )
      ( MAKE-8PILE ?auto_279982 ?auto_279983 ?auto_279984 ?auto_279985 ?auto_279986 ?auto_279987 ?auto_279988 ?auto_279989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_279999 - BLOCK
      ?auto_280000 - BLOCK
      ?auto_280001 - BLOCK
      ?auto_280002 - BLOCK
      ?auto_280003 - BLOCK
      ?auto_280004 - BLOCK
      ?auto_280005 - BLOCK
      ?auto_280006 - BLOCK
    )
    :vars
    (
      ?auto_280007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280006 ?auto_280007 ) ( ON-TABLE ?auto_279999 ) ( ON ?auto_280000 ?auto_279999 ) ( not ( = ?auto_279999 ?auto_280000 ) ) ( not ( = ?auto_279999 ?auto_280001 ) ) ( not ( = ?auto_279999 ?auto_280002 ) ) ( not ( = ?auto_279999 ?auto_280003 ) ) ( not ( = ?auto_279999 ?auto_280004 ) ) ( not ( = ?auto_279999 ?auto_280005 ) ) ( not ( = ?auto_279999 ?auto_280006 ) ) ( not ( = ?auto_279999 ?auto_280007 ) ) ( not ( = ?auto_280000 ?auto_280001 ) ) ( not ( = ?auto_280000 ?auto_280002 ) ) ( not ( = ?auto_280000 ?auto_280003 ) ) ( not ( = ?auto_280000 ?auto_280004 ) ) ( not ( = ?auto_280000 ?auto_280005 ) ) ( not ( = ?auto_280000 ?auto_280006 ) ) ( not ( = ?auto_280000 ?auto_280007 ) ) ( not ( = ?auto_280001 ?auto_280002 ) ) ( not ( = ?auto_280001 ?auto_280003 ) ) ( not ( = ?auto_280001 ?auto_280004 ) ) ( not ( = ?auto_280001 ?auto_280005 ) ) ( not ( = ?auto_280001 ?auto_280006 ) ) ( not ( = ?auto_280001 ?auto_280007 ) ) ( not ( = ?auto_280002 ?auto_280003 ) ) ( not ( = ?auto_280002 ?auto_280004 ) ) ( not ( = ?auto_280002 ?auto_280005 ) ) ( not ( = ?auto_280002 ?auto_280006 ) ) ( not ( = ?auto_280002 ?auto_280007 ) ) ( not ( = ?auto_280003 ?auto_280004 ) ) ( not ( = ?auto_280003 ?auto_280005 ) ) ( not ( = ?auto_280003 ?auto_280006 ) ) ( not ( = ?auto_280003 ?auto_280007 ) ) ( not ( = ?auto_280004 ?auto_280005 ) ) ( not ( = ?auto_280004 ?auto_280006 ) ) ( not ( = ?auto_280004 ?auto_280007 ) ) ( not ( = ?auto_280005 ?auto_280006 ) ) ( not ( = ?auto_280005 ?auto_280007 ) ) ( not ( = ?auto_280006 ?auto_280007 ) ) ( ON ?auto_280005 ?auto_280006 ) ( ON ?auto_280004 ?auto_280005 ) ( ON ?auto_280003 ?auto_280004 ) ( ON ?auto_280002 ?auto_280003 ) ( CLEAR ?auto_280000 ) ( ON ?auto_280001 ?auto_280002 ) ( CLEAR ?auto_280001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_279999 ?auto_280000 ?auto_280001 )
      ( MAKE-8PILE ?auto_279999 ?auto_280000 ?auto_280001 ?auto_280002 ?auto_280003 ?auto_280004 ?auto_280005 ?auto_280006 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_280016 - BLOCK
      ?auto_280017 - BLOCK
      ?auto_280018 - BLOCK
      ?auto_280019 - BLOCK
      ?auto_280020 - BLOCK
      ?auto_280021 - BLOCK
      ?auto_280022 - BLOCK
      ?auto_280023 - BLOCK
    )
    :vars
    (
      ?auto_280024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280023 ?auto_280024 ) ( ON-TABLE ?auto_280016 ) ( ON ?auto_280017 ?auto_280016 ) ( not ( = ?auto_280016 ?auto_280017 ) ) ( not ( = ?auto_280016 ?auto_280018 ) ) ( not ( = ?auto_280016 ?auto_280019 ) ) ( not ( = ?auto_280016 ?auto_280020 ) ) ( not ( = ?auto_280016 ?auto_280021 ) ) ( not ( = ?auto_280016 ?auto_280022 ) ) ( not ( = ?auto_280016 ?auto_280023 ) ) ( not ( = ?auto_280016 ?auto_280024 ) ) ( not ( = ?auto_280017 ?auto_280018 ) ) ( not ( = ?auto_280017 ?auto_280019 ) ) ( not ( = ?auto_280017 ?auto_280020 ) ) ( not ( = ?auto_280017 ?auto_280021 ) ) ( not ( = ?auto_280017 ?auto_280022 ) ) ( not ( = ?auto_280017 ?auto_280023 ) ) ( not ( = ?auto_280017 ?auto_280024 ) ) ( not ( = ?auto_280018 ?auto_280019 ) ) ( not ( = ?auto_280018 ?auto_280020 ) ) ( not ( = ?auto_280018 ?auto_280021 ) ) ( not ( = ?auto_280018 ?auto_280022 ) ) ( not ( = ?auto_280018 ?auto_280023 ) ) ( not ( = ?auto_280018 ?auto_280024 ) ) ( not ( = ?auto_280019 ?auto_280020 ) ) ( not ( = ?auto_280019 ?auto_280021 ) ) ( not ( = ?auto_280019 ?auto_280022 ) ) ( not ( = ?auto_280019 ?auto_280023 ) ) ( not ( = ?auto_280019 ?auto_280024 ) ) ( not ( = ?auto_280020 ?auto_280021 ) ) ( not ( = ?auto_280020 ?auto_280022 ) ) ( not ( = ?auto_280020 ?auto_280023 ) ) ( not ( = ?auto_280020 ?auto_280024 ) ) ( not ( = ?auto_280021 ?auto_280022 ) ) ( not ( = ?auto_280021 ?auto_280023 ) ) ( not ( = ?auto_280021 ?auto_280024 ) ) ( not ( = ?auto_280022 ?auto_280023 ) ) ( not ( = ?auto_280022 ?auto_280024 ) ) ( not ( = ?auto_280023 ?auto_280024 ) ) ( ON ?auto_280022 ?auto_280023 ) ( ON ?auto_280021 ?auto_280022 ) ( ON ?auto_280020 ?auto_280021 ) ( ON ?auto_280019 ?auto_280020 ) ( CLEAR ?auto_280017 ) ( ON ?auto_280018 ?auto_280019 ) ( CLEAR ?auto_280018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_280016 ?auto_280017 ?auto_280018 )
      ( MAKE-8PILE ?auto_280016 ?auto_280017 ?auto_280018 ?auto_280019 ?auto_280020 ?auto_280021 ?auto_280022 ?auto_280023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_280033 - BLOCK
      ?auto_280034 - BLOCK
      ?auto_280035 - BLOCK
      ?auto_280036 - BLOCK
      ?auto_280037 - BLOCK
      ?auto_280038 - BLOCK
      ?auto_280039 - BLOCK
      ?auto_280040 - BLOCK
    )
    :vars
    (
      ?auto_280041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280040 ?auto_280041 ) ( ON-TABLE ?auto_280033 ) ( not ( = ?auto_280033 ?auto_280034 ) ) ( not ( = ?auto_280033 ?auto_280035 ) ) ( not ( = ?auto_280033 ?auto_280036 ) ) ( not ( = ?auto_280033 ?auto_280037 ) ) ( not ( = ?auto_280033 ?auto_280038 ) ) ( not ( = ?auto_280033 ?auto_280039 ) ) ( not ( = ?auto_280033 ?auto_280040 ) ) ( not ( = ?auto_280033 ?auto_280041 ) ) ( not ( = ?auto_280034 ?auto_280035 ) ) ( not ( = ?auto_280034 ?auto_280036 ) ) ( not ( = ?auto_280034 ?auto_280037 ) ) ( not ( = ?auto_280034 ?auto_280038 ) ) ( not ( = ?auto_280034 ?auto_280039 ) ) ( not ( = ?auto_280034 ?auto_280040 ) ) ( not ( = ?auto_280034 ?auto_280041 ) ) ( not ( = ?auto_280035 ?auto_280036 ) ) ( not ( = ?auto_280035 ?auto_280037 ) ) ( not ( = ?auto_280035 ?auto_280038 ) ) ( not ( = ?auto_280035 ?auto_280039 ) ) ( not ( = ?auto_280035 ?auto_280040 ) ) ( not ( = ?auto_280035 ?auto_280041 ) ) ( not ( = ?auto_280036 ?auto_280037 ) ) ( not ( = ?auto_280036 ?auto_280038 ) ) ( not ( = ?auto_280036 ?auto_280039 ) ) ( not ( = ?auto_280036 ?auto_280040 ) ) ( not ( = ?auto_280036 ?auto_280041 ) ) ( not ( = ?auto_280037 ?auto_280038 ) ) ( not ( = ?auto_280037 ?auto_280039 ) ) ( not ( = ?auto_280037 ?auto_280040 ) ) ( not ( = ?auto_280037 ?auto_280041 ) ) ( not ( = ?auto_280038 ?auto_280039 ) ) ( not ( = ?auto_280038 ?auto_280040 ) ) ( not ( = ?auto_280038 ?auto_280041 ) ) ( not ( = ?auto_280039 ?auto_280040 ) ) ( not ( = ?auto_280039 ?auto_280041 ) ) ( not ( = ?auto_280040 ?auto_280041 ) ) ( ON ?auto_280039 ?auto_280040 ) ( ON ?auto_280038 ?auto_280039 ) ( ON ?auto_280037 ?auto_280038 ) ( ON ?auto_280036 ?auto_280037 ) ( ON ?auto_280035 ?auto_280036 ) ( CLEAR ?auto_280033 ) ( ON ?auto_280034 ?auto_280035 ) ( CLEAR ?auto_280034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280033 ?auto_280034 )
      ( MAKE-8PILE ?auto_280033 ?auto_280034 ?auto_280035 ?auto_280036 ?auto_280037 ?auto_280038 ?auto_280039 ?auto_280040 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_280050 - BLOCK
      ?auto_280051 - BLOCK
      ?auto_280052 - BLOCK
      ?auto_280053 - BLOCK
      ?auto_280054 - BLOCK
      ?auto_280055 - BLOCK
      ?auto_280056 - BLOCK
      ?auto_280057 - BLOCK
    )
    :vars
    (
      ?auto_280058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280057 ?auto_280058 ) ( ON-TABLE ?auto_280050 ) ( not ( = ?auto_280050 ?auto_280051 ) ) ( not ( = ?auto_280050 ?auto_280052 ) ) ( not ( = ?auto_280050 ?auto_280053 ) ) ( not ( = ?auto_280050 ?auto_280054 ) ) ( not ( = ?auto_280050 ?auto_280055 ) ) ( not ( = ?auto_280050 ?auto_280056 ) ) ( not ( = ?auto_280050 ?auto_280057 ) ) ( not ( = ?auto_280050 ?auto_280058 ) ) ( not ( = ?auto_280051 ?auto_280052 ) ) ( not ( = ?auto_280051 ?auto_280053 ) ) ( not ( = ?auto_280051 ?auto_280054 ) ) ( not ( = ?auto_280051 ?auto_280055 ) ) ( not ( = ?auto_280051 ?auto_280056 ) ) ( not ( = ?auto_280051 ?auto_280057 ) ) ( not ( = ?auto_280051 ?auto_280058 ) ) ( not ( = ?auto_280052 ?auto_280053 ) ) ( not ( = ?auto_280052 ?auto_280054 ) ) ( not ( = ?auto_280052 ?auto_280055 ) ) ( not ( = ?auto_280052 ?auto_280056 ) ) ( not ( = ?auto_280052 ?auto_280057 ) ) ( not ( = ?auto_280052 ?auto_280058 ) ) ( not ( = ?auto_280053 ?auto_280054 ) ) ( not ( = ?auto_280053 ?auto_280055 ) ) ( not ( = ?auto_280053 ?auto_280056 ) ) ( not ( = ?auto_280053 ?auto_280057 ) ) ( not ( = ?auto_280053 ?auto_280058 ) ) ( not ( = ?auto_280054 ?auto_280055 ) ) ( not ( = ?auto_280054 ?auto_280056 ) ) ( not ( = ?auto_280054 ?auto_280057 ) ) ( not ( = ?auto_280054 ?auto_280058 ) ) ( not ( = ?auto_280055 ?auto_280056 ) ) ( not ( = ?auto_280055 ?auto_280057 ) ) ( not ( = ?auto_280055 ?auto_280058 ) ) ( not ( = ?auto_280056 ?auto_280057 ) ) ( not ( = ?auto_280056 ?auto_280058 ) ) ( not ( = ?auto_280057 ?auto_280058 ) ) ( ON ?auto_280056 ?auto_280057 ) ( ON ?auto_280055 ?auto_280056 ) ( ON ?auto_280054 ?auto_280055 ) ( ON ?auto_280053 ?auto_280054 ) ( ON ?auto_280052 ?auto_280053 ) ( CLEAR ?auto_280050 ) ( ON ?auto_280051 ?auto_280052 ) ( CLEAR ?auto_280051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280050 ?auto_280051 )
      ( MAKE-8PILE ?auto_280050 ?auto_280051 ?auto_280052 ?auto_280053 ?auto_280054 ?auto_280055 ?auto_280056 ?auto_280057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_280067 - BLOCK
      ?auto_280068 - BLOCK
      ?auto_280069 - BLOCK
      ?auto_280070 - BLOCK
      ?auto_280071 - BLOCK
      ?auto_280072 - BLOCK
      ?auto_280073 - BLOCK
      ?auto_280074 - BLOCK
    )
    :vars
    (
      ?auto_280075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280074 ?auto_280075 ) ( not ( = ?auto_280067 ?auto_280068 ) ) ( not ( = ?auto_280067 ?auto_280069 ) ) ( not ( = ?auto_280067 ?auto_280070 ) ) ( not ( = ?auto_280067 ?auto_280071 ) ) ( not ( = ?auto_280067 ?auto_280072 ) ) ( not ( = ?auto_280067 ?auto_280073 ) ) ( not ( = ?auto_280067 ?auto_280074 ) ) ( not ( = ?auto_280067 ?auto_280075 ) ) ( not ( = ?auto_280068 ?auto_280069 ) ) ( not ( = ?auto_280068 ?auto_280070 ) ) ( not ( = ?auto_280068 ?auto_280071 ) ) ( not ( = ?auto_280068 ?auto_280072 ) ) ( not ( = ?auto_280068 ?auto_280073 ) ) ( not ( = ?auto_280068 ?auto_280074 ) ) ( not ( = ?auto_280068 ?auto_280075 ) ) ( not ( = ?auto_280069 ?auto_280070 ) ) ( not ( = ?auto_280069 ?auto_280071 ) ) ( not ( = ?auto_280069 ?auto_280072 ) ) ( not ( = ?auto_280069 ?auto_280073 ) ) ( not ( = ?auto_280069 ?auto_280074 ) ) ( not ( = ?auto_280069 ?auto_280075 ) ) ( not ( = ?auto_280070 ?auto_280071 ) ) ( not ( = ?auto_280070 ?auto_280072 ) ) ( not ( = ?auto_280070 ?auto_280073 ) ) ( not ( = ?auto_280070 ?auto_280074 ) ) ( not ( = ?auto_280070 ?auto_280075 ) ) ( not ( = ?auto_280071 ?auto_280072 ) ) ( not ( = ?auto_280071 ?auto_280073 ) ) ( not ( = ?auto_280071 ?auto_280074 ) ) ( not ( = ?auto_280071 ?auto_280075 ) ) ( not ( = ?auto_280072 ?auto_280073 ) ) ( not ( = ?auto_280072 ?auto_280074 ) ) ( not ( = ?auto_280072 ?auto_280075 ) ) ( not ( = ?auto_280073 ?auto_280074 ) ) ( not ( = ?auto_280073 ?auto_280075 ) ) ( not ( = ?auto_280074 ?auto_280075 ) ) ( ON ?auto_280073 ?auto_280074 ) ( ON ?auto_280072 ?auto_280073 ) ( ON ?auto_280071 ?auto_280072 ) ( ON ?auto_280070 ?auto_280071 ) ( ON ?auto_280069 ?auto_280070 ) ( ON ?auto_280068 ?auto_280069 ) ( ON ?auto_280067 ?auto_280068 ) ( CLEAR ?auto_280067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280067 )
      ( MAKE-8PILE ?auto_280067 ?auto_280068 ?auto_280069 ?auto_280070 ?auto_280071 ?auto_280072 ?auto_280073 ?auto_280074 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_280084 - BLOCK
      ?auto_280085 - BLOCK
      ?auto_280086 - BLOCK
      ?auto_280087 - BLOCK
      ?auto_280088 - BLOCK
      ?auto_280089 - BLOCK
      ?auto_280090 - BLOCK
      ?auto_280091 - BLOCK
    )
    :vars
    (
      ?auto_280092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280091 ?auto_280092 ) ( not ( = ?auto_280084 ?auto_280085 ) ) ( not ( = ?auto_280084 ?auto_280086 ) ) ( not ( = ?auto_280084 ?auto_280087 ) ) ( not ( = ?auto_280084 ?auto_280088 ) ) ( not ( = ?auto_280084 ?auto_280089 ) ) ( not ( = ?auto_280084 ?auto_280090 ) ) ( not ( = ?auto_280084 ?auto_280091 ) ) ( not ( = ?auto_280084 ?auto_280092 ) ) ( not ( = ?auto_280085 ?auto_280086 ) ) ( not ( = ?auto_280085 ?auto_280087 ) ) ( not ( = ?auto_280085 ?auto_280088 ) ) ( not ( = ?auto_280085 ?auto_280089 ) ) ( not ( = ?auto_280085 ?auto_280090 ) ) ( not ( = ?auto_280085 ?auto_280091 ) ) ( not ( = ?auto_280085 ?auto_280092 ) ) ( not ( = ?auto_280086 ?auto_280087 ) ) ( not ( = ?auto_280086 ?auto_280088 ) ) ( not ( = ?auto_280086 ?auto_280089 ) ) ( not ( = ?auto_280086 ?auto_280090 ) ) ( not ( = ?auto_280086 ?auto_280091 ) ) ( not ( = ?auto_280086 ?auto_280092 ) ) ( not ( = ?auto_280087 ?auto_280088 ) ) ( not ( = ?auto_280087 ?auto_280089 ) ) ( not ( = ?auto_280087 ?auto_280090 ) ) ( not ( = ?auto_280087 ?auto_280091 ) ) ( not ( = ?auto_280087 ?auto_280092 ) ) ( not ( = ?auto_280088 ?auto_280089 ) ) ( not ( = ?auto_280088 ?auto_280090 ) ) ( not ( = ?auto_280088 ?auto_280091 ) ) ( not ( = ?auto_280088 ?auto_280092 ) ) ( not ( = ?auto_280089 ?auto_280090 ) ) ( not ( = ?auto_280089 ?auto_280091 ) ) ( not ( = ?auto_280089 ?auto_280092 ) ) ( not ( = ?auto_280090 ?auto_280091 ) ) ( not ( = ?auto_280090 ?auto_280092 ) ) ( not ( = ?auto_280091 ?auto_280092 ) ) ( ON ?auto_280090 ?auto_280091 ) ( ON ?auto_280089 ?auto_280090 ) ( ON ?auto_280088 ?auto_280089 ) ( ON ?auto_280087 ?auto_280088 ) ( ON ?auto_280086 ?auto_280087 ) ( ON ?auto_280085 ?auto_280086 ) ( ON ?auto_280084 ?auto_280085 ) ( CLEAR ?auto_280084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280084 )
      ( MAKE-8PILE ?auto_280084 ?auto_280085 ?auto_280086 ?auto_280087 ?auto_280088 ?auto_280089 ?auto_280090 ?auto_280091 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280102 - BLOCK
      ?auto_280103 - BLOCK
      ?auto_280104 - BLOCK
      ?auto_280105 - BLOCK
      ?auto_280106 - BLOCK
      ?auto_280107 - BLOCK
      ?auto_280108 - BLOCK
      ?auto_280109 - BLOCK
      ?auto_280110 - BLOCK
    )
    :vars
    (
      ?auto_280111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280109 ) ( ON ?auto_280110 ?auto_280111 ) ( CLEAR ?auto_280110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280102 ) ( ON ?auto_280103 ?auto_280102 ) ( ON ?auto_280104 ?auto_280103 ) ( ON ?auto_280105 ?auto_280104 ) ( ON ?auto_280106 ?auto_280105 ) ( ON ?auto_280107 ?auto_280106 ) ( ON ?auto_280108 ?auto_280107 ) ( ON ?auto_280109 ?auto_280108 ) ( not ( = ?auto_280102 ?auto_280103 ) ) ( not ( = ?auto_280102 ?auto_280104 ) ) ( not ( = ?auto_280102 ?auto_280105 ) ) ( not ( = ?auto_280102 ?auto_280106 ) ) ( not ( = ?auto_280102 ?auto_280107 ) ) ( not ( = ?auto_280102 ?auto_280108 ) ) ( not ( = ?auto_280102 ?auto_280109 ) ) ( not ( = ?auto_280102 ?auto_280110 ) ) ( not ( = ?auto_280102 ?auto_280111 ) ) ( not ( = ?auto_280103 ?auto_280104 ) ) ( not ( = ?auto_280103 ?auto_280105 ) ) ( not ( = ?auto_280103 ?auto_280106 ) ) ( not ( = ?auto_280103 ?auto_280107 ) ) ( not ( = ?auto_280103 ?auto_280108 ) ) ( not ( = ?auto_280103 ?auto_280109 ) ) ( not ( = ?auto_280103 ?auto_280110 ) ) ( not ( = ?auto_280103 ?auto_280111 ) ) ( not ( = ?auto_280104 ?auto_280105 ) ) ( not ( = ?auto_280104 ?auto_280106 ) ) ( not ( = ?auto_280104 ?auto_280107 ) ) ( not ( = ?auto_280104 ?auto_280108 ) ) ( not ( = ?auto_280104 ?auto_280109 ) ) ( not ( = ?auto_280104 ?auto_280110 ) ) ( not ( = ?auto_280104 ?auto_280111 ) ) ( not ( = ?auto_280105 ?auto_280106 ) ) ( not ( = ?auto_280105 ?auto_280107 ) ) ( not ( = ?auto_280105 ?auto_280108 ) ) ( not ( = ?auto_280105 ?auto_280109 ) ) ( not ( = ?auto_280105 ?auto_280110 ) ) ( not ( = ?auto_280105 ?auto_280111 ) ) ( not ( = ?auto_280106 ?auto_280107 ) ) ( not ( = ?auto_280106 ?auto_280108 ) ) ( not ( = ?auto_280106 ?auto_280109 ) ) ( not ( = ?auto_280106 ?auto_280110 ) ) ( not ( = ?auto_280106 ?auto_280111 ) ) ( not ( = ?auto_280107 ?auto_280108 ) ) ( not ( = ?auto_280107 ?auto_280109 ) ) ( not ( = ?auto_280107 ?auto_280110 ) ) ( not ( = ?auto_280107 ?auto_280111 ) ) ( not ( = ?auto_280108 ?auto_280109 ) ) ( not ( = ?auto_280108 ?auto_280110 ) ) ( not ( = ?auto_280108 ?auto_280111 ) ) ( not ( = ?auto_280109 ?auto_280110 ) ) ( not ( = ?auto_280109 ?auto_280111 ) ) ( not ( = ?auto_280110 ?auto_280111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280110 ?auto_280111 )
      ( !STACK ?auto_280110 ?auto_280109 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280121 - BLOCK
      ?auto_280122 - BLOCK
      ?auto_280123 - BLOCK
      ?auto_280124 - BLOCK
      ?auto_280125 - BLOCK
      ?auto_280126 - BLOCK
      ?auto_280127 - BLOCK
      ?auto_280128 - BLOCK
      ?auto_280129 - BLOCK
    )
    :vars
    (
      ?auto_280130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280128 ) ( ON ?auto_280129 ?auto_280130 ) ( CLEAR ?auto_280129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280121 ) ( ON ?auto_280122 ?auto_280121 ) ( ON ?auto_280123 ?auto_280122 ) ( ON ?auto_280124 ?auto_280123 ) ( ON ?auto_280125 ?auto_280124 ) ( ON ?auto_280126 ?auto_280125 ) ( ON ?auto_280127 ?auto_280126 ) ( ON ?auto_280128 ?auto_280127 ) ( not ( = ?auto_280121 ?auto_280122 ) ) ( not ( = ?auto_280121 ?auto_280123 ) ) ( not ( = ?auto_280121 ?auto_280124 ) ) ( not ( = ?auto_280121 ?auto_280125 ) ) ( not ( = ?auto_280121 ?auto_280126 ) ) ( not ( = ?auto_280121 ?auto_280127 ) ) ( not ( = ?auto_280121 ?auto_280128 ) ) ( not ( = ?auto_280121 ?auto_280129 ) ) ( not ( = ?auto_280121 ?auto_280130 ) ) ( not ( = ?auto_280122 ?auto_280123 ) ) ( not ( = ?auto_280122 ?auto_280124 ) ) ( not ( = ?auto_280122 ?auto_280125 ) ) ( not ( = ?auto_280122 ?auto_280126 ) ) ( not ( = ?auto_280122 ?auto_280127 ) ) ( not ( = ?auto_280122 ?auto_280128 ) ) ( not ( = ?auto_280122 ?auto_280129 ) ) ( not ( = ?auto_280122 ?auto_280130 ) ) ( not ( = ?auto_280123 ?auto_280124 ) ) ( not ( = ?auto_280123 ?auto_280125 ) ) ( not ( = ?auto_280123 ?auto_280126 ) ) ( not ( = ?auto_280123 ?auto_280127 ) ) ( not ( = ?auto_280123 ?auto_280128 ) ) ( not ( = ?auto_280123 ?auto_280129 ) ) ( not ( = ?auto_280123 ?auto_280130 ) ) ( not ( = ?auto_280124 ?auto_280125 ) ) ( not ( = ?auto_280124 ?auto_280126 ) ) ( not ( = ?auto_280124 ?auto_280127 ) ) ( not ( = ?auto_280124 ?auto_280128 ) ) ( not ( = ?auto_280124 ?auto_280129 ) ) ( not ( = ?auto_280124 ?auto_280130 ) ) ( not ( = ?auto_280125 ?auto_280126 ) ) ( not ( = ?auto_280125 ?auto_280127 ) ) ( not ( = ?auto_280125 ?auto_280128 ) ) ( not ( = ?auto_280125 ?auto_280129 ) ) ( not ( = ?auto_280125 ?auto_280130 ) ) ( not ( = ?auto_280126 ?auto_280127 ) ) ( not ( = ?auto_280126 ?auto_280128 ) ) ( not ( = ?auto_280126 ?auto_280129 ) ) ( not ( = ?auto_280126 ?auto_280130 ) ) ( not ( = ?auto_280127 ?auto_280128 ) ) ( not ( = ?auto_280127 ?auto_280129 ) ) ( not ( = ?auto_280127 ?auto_280130 ) ) ( not ( = ?auto_280128 ?auto_280129 ) ) ( not ( = ?auto_280128 ?auto_280130 ) ) ( not ( = ?auto_280129 ?auto_280130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280129 ?auto_280130 )
      ( !STACK ?auto_280129 ?auto_280128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280140 - BLOCK
      ?auto_280141 - BLOCK
      ?auto_280142 - BLOCK
      ?auto_280143 - BLOCK
      ?auto_280144 - BLOCK
      ?auto_280145 - BLOCK
      ?auto_280146 - BLOCK
      ?auto_280147 - BLOCK
      ?auto_280148 - BLOCK
    )
    :vars
    (
      ?auto_280149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280148 ?auto_280149 ) ( ON-TABLE ?auto_280140 ) ( ON ?auto_280141 ?auto_280140 ) ( ON ?auto_280142 ?auto_280141 ) ( ON ?auto_280143 ?auto_280142 ) ( ON ?auto_280144 ?auto_280143 ) ( ON ?auto_280145 ?auto_280144 ) ( ON ?auto_280146 ?auto_280145 ) ( not ( = ?auto_280140 ?auto_280141 ) ) ( not ( = ?auto_280140 ?auto_280142 ) ) ( not ( = ?auto_280140 ?auto_280143 ) ) ( not ( = ?auto_280140 ?auto_280144 ) ) ( not ( = ?auto_280140 ?auto_280145 ) ) ( not ( = ?auto_280140 ?auto_280146 ) ) ( not ( = ?auto_280140 ?auto_280147 ) ) ( not ( = ?auto_280140 ?auto_280148 ) ) ( not ( = ?auto_280140 ?auto_280149 ) ) ( not ( = ?auto_280141 ?auto_280142 ) ) ( not ( = ?auto_280141 ?auto_280143 ) ) ( not ( = ?auto_280141 ?auto_280144 ) ) ( not ( = ?auto_280141 ?auto_280145 ) ) ( not ( = ?auto_280141 ?auto_280146 ) ) ( not ( = ?auto_280141 ?auto_280147 ) ) ( not ( = ?auto_280141 ?auto_280148 ) ) ( not ( = ?auto_280141 ?auto_280149 ) ) ( not ( = ?auto_280142 ?auto_280143 ) ) ( not ( = ?auto_280142 ?auto_280144 ) ) ( not ( = ?auto_280142 ?auto_280145 ) ) ( not ( = ?auto_280142 ?auto_280146 ) ) ( not ( = ?auto_280142 ?auto_280147 ) ) ( not ( = ?auto_280142 ?auto_280148 ) ) ( not ( = ?auto_280142 ?auto_280149 ) ) ( not ( = ?auto_280143 ?auto_280144 ) ) ( not ( = ?auto_280143 ?auto_280145 ) ) ( not ( = ?auto_280143 ?auto_280146 ) ) ( not ( = ?auto_280143 ?auto_280147 ) ) ( not ( = ?auto_280143 ?auto_280148 ) ) ( not ( = ?auto_280143 ?auto_280149 ) ) ( not ( = ?auto_280144 ?auto_280145 ) ) ( not ( = ?auto_280144 ?auto_280146 ) ) ( not ( = ?auto_280144 ?auto_280147 ) ) ( not ( = ?auto_280144 ?auto_280148 ) ) ( not ( = ?auto_280144 ?auto_280149 ) ) ( not ( = ?auto_280145 ?auto_280146 ) ) ( not ( = ?auto_280145 ?auto_280147 ) ) ( not ( = ?auto_280145 ?auto_280148 ) ) ( not ( = ?auto_280145 ?auto_280149 ) ) ( not ( = ?auto_280146 ?auto_280147 ) ) ( not ( = ?auto_280146 ?auto_280148 ) ) ( not ( = ?auto_280146 ?auto_280149 ) ) ( not ( = ?auto_280147 ?auto_280148 ) ) ( not ( = ?auto_280147 ?auto_280149 ) ) ( not ( = ?auto_280148 ?auto_280149 ) ) ( CLEAR ?auto_280146 ) ( ON ?auto_280147 ?auto_280148 ) ( CLEAR ?auto_280147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_280140 ?auto_280141 ?auto_280142 ?auto_280143 ?auto_280144 ?auto_280145 ?auto_280146 ?auto_280147 )
      ( MAKE-9PILE ?auto_280140 ?auto_280141 ?auto_280142 ?auto_280143 ?auto_280144 ?auto_280145 ?auto_280146 ?auto_280147 ?auto_280148 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280159 - BLOCK
      ?auto_280160 - BLOCK
      ?auto_280161 - BLOCK
      ?auto_280162 - BLOCK
      ?auto_280163 - BLOCK
      ?auto_280164 - BLOCK
      ?auto_280165 - BLOCK
      ?auto_280166 - BLOCK
      ?auto_280167 - BLOCK
    )
    :vars
    (
      ?auto_280168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280167 ?auto_280168 ) ( ON-TABLE ?auto_280159 ) ( ON ?auto_280160 ?auto_280159 ) ( ON ?auto_280161 ?auto_280160 ) ( ON ?auto_280162 ?auto_280161 ) ( ON ?auto_280163 ?auto_280162 ) ( ON ?auto_280164 ?auto_280163 ) ( ON ?auto_280165 ?auto_280164 ) ( not ( = ?auto_280159 ?auto_280160 ) ) ( not ( = ?auto_280159 ?auto_280161 ) ) ( not ( = ?auto_280159 ?auto_280162 ) ) ( not ( = ?auto_280159 ?auto_280163 ) ) ( not ( = ?auto_280159 ?auto_280164 ) ) ( not ( = ?auto_280159 ?auto_280165 ) ) ( not ( = ?auto_280159 ?auto_280166 ) ) ( not ( = ?auto_280159 ?auto_280167 ) ) ( not ( = ?auto_280159 ?auto_280168 ) ) ( not ( = ?auto_280160 ?auto_280161 ) ) ( not ( = ?auto_280160 ?auto_280162 ) ) ( not ( = ?auto_280160 ?auto_280163 ) ) ( not ( = ?auto_280160 ?auto_280164 ) ) ( not ( = ?auto_280160 ?auto_280165 ) ) ( not ( = ?auto_280160 ?auto_280166 ) ) ( not ( = ?auto_280160 ?auto_280167 ) ) ( not ( = ?auto_280160 ?auto_280168 ) ) ( not ( = ?auto_280161 ?auto_280162 ) ) ( not ( = ?auto_280161 ?auto_280163 ) ) ( not ( = ?auto_280161 ?auto_280164 ) ) ( not ( = ?auto_280161 ?auto_280165 ) ) ( not ( = ?auto_280161 ?auto_280166 ) ) ( not ( = ?auto_280161 ?auto_280167 ) ) ( not ( = ?auto_280161 ?auto_280168 ) ) ( not ( = ?auto_280162 ?auto_280163 ) ) ( not ( = ?auto_280162 ?auto_280164 ) ) ( not ( = ?auto_280162 ?auto_280165 ) ) ( not ( = ?auto_280162 ?auto_280166 ) ) ( not ( = ?auto_280162 ?auto_280167 ) ) ( not ( = ?auto_280162 ?auto_280168 ) ) ( not ( = ?auto_280163 ?auto_280164 ) ) ( not ( = ?auto_280163 ?auto_280165 ) ) ( not ( = ?auto_280163 ?auto_280166 ) ) ( not ( = ?auto_280163 ?auto_280167 ) ) ( not ( = ?auto_280163 ?auto_280168 ) ) ( not ( = ?auto_280164 ?auto_280165 ) ) ( not ( = ?auto_280164 ?auto_280166 ) ) ( not ( = ?auto_280164 ?auto_280167 ) ) ( not ( = ?auto_280164 ?auto_280168 ) ) ( not ( = ?auto_280165 ?auto_280166 ) ) ( not ( = ?auto_280165 ?auto_280167 ) ) ( not ( = ?auto_280165 ?auto_280168 ) ) ( not ( = ?auto_280166 ?auto_280167 ) ) ( not ( = ?auto_280166 ?auto_280168 ) ) ( not ( = ?auto_280167 ?auto_280168 ) ) ( CLEAR ?auto_280165 ) ( ON ?auto_280166 ?auto_280167 ) ( CLEAR ?auto_280166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_280159 ?auto_280160 ?auto_280161 ?auto_280162 ?auto_280163 ?auto_280164 ?auto_280165 ?auto_280166 )
      ( MAKE-9PILE ?auto_280159 ?auto_280160 ?auto_280161 ?auto_280162 ?auto_280163 ?auto_280164 ?auto_280165 ?auto_280166 ?auto_280167 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280178 - BLOCK
      ?auto_280179 - BLOCK
      ?auto_280180 - BLOCK
      ?auto_280181 - BLOCK
      ?auto_280182 - BLOCK
      ?auto_280183 - BLOCK
      ?auto_280184 - BLOCK
      ?auto_280185 - BLOCK
      ?auto_280186 - BLOCK
    )
    :vars
    (
      ?auto_280187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280186 ?auto_280187 ) ( ON-TABLE ?auto_280178 ) ( ON ?auto_280179 ?auto_280178 ) ( ON ?auto_280180 ?auto_280179 ) ( ON ?auto_280181 ?auto_280180 ) ( ON ?auto_280182 ?auto_280181 ) ( ON ?auto_280183 ?auto_280182 ) ( not ( = ?auto_280178 ?auto_280179 ) ) ( not ( = ?auto_280178 ?auto_280180 ) ) ( not ( = ?auto_280178 ?auto_280181 ) ) ( not ( = ?auto_280178 ?auto_280182 ) ) ( not ( = ?auto_280178 ?auto_280183 ) ) ( not ( = ?auto_280178 ?auto_280184 ) ) ( not ( = ?auto_280178 ?auto_280185 ) ) ( not ( = ?auto_280178 ?auto_280186 ) ) ( not ( = ?auto_280178 ?auto_280187 ) ) ( not ( = ?auto_280179 ?auto_280180 ) ) ( not ( = ?auto_280179 ?auto_280181 ) ) ( not ( = ?auto_280179 ?auto_280182 ) ) ( not ( = ?auto_280179 ?auto_280183 ) ) ( not ( = ?auto_280179 ?auto_280184 ) ) ( not ( = ?auto_280179 ?auto_280185 ) ) ( not ( = ?auto_280179 ?auto_280186 ) ) ( not ( = ?auto_280179 ?auto_280187 ) ) ( not ( = ?auto_280180 ?auto_280181 ) ) ( not ( = ?auto_280180 ?auto_280182 ) ) ( not ( = ?auto_280180 ?auto_280183 ) ) ( not ( = ?auto_280180 ?auto_280184 ) ) ( not ( = ?auto_280180 ?auto_280185 ) ) ( not ( = ?auto_280180 ?auto_280186 ) ) ( not ( = ?auto_280180 ?auto_280187 ) ) ( not ( = ?auto_280181 ?auto_280182 ) ) ( not ( = ?auto_280181 ?auto_280183 ) ) ( not ( = ?auto_280181 ?auto_280184 ) ) ( not ( = ?auto_280181 ?auto_280185 ) ) ( not ( = ?auto_280181 ?auto_280186 ) ) ( not ( = ?auto_280181 ?auto_280187 ) ) ( not ( = ?auto_280182 ?auto_280183 ) ) ( not ( = ?auto_280182 ?auto_280184 ) ) ( not ( = ?auto_280182 ?auto_280185 ) ) ( not ( = ?auto_280182 ?auto_280186 ) ) ( not ( = ?auto_280182 ?auto_280187 ) ) ( not ( = ?auto_280183 ?auto_280184 ) ) ( not ( = ?auto_280183 ?auto_280185 ) ) ( not ( = ?auto_280183 ?auto_280186 ) ) ( not ( = ?auto_280183 ?auto_280187 ) ) ( not ( = ?auto_280184 ?auto_280185 ) ) ( not ( = ?auto_280184 ?auto_280186 ) ) ( not ( = ?auto_280184 ?auto_280187 ) ) ( not ( = ?auto_280185 ?auto_280186 ) ) ( not ( = ?auto_280185 ?auto_280187 ) ) ( not ( = ?auto_280186 ?auto_280187 ) ) ( ON ?auto_280185 ?auto_280186 ) ( CLEAR ?auto_280183 ) ( ON ?auto_280184 ?auto_280185 ) ( CLEAR ?auto_280184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_280178 ?auto_280179 ?auto_280180 ?auto_280181 ?auto_280182 ?auto_280183 ?auto_280184 )
      ( MAKE-9PILE ?auto_280178 ?auto_280179 ?auto_280180 ?auto_280181 ?auto_280182 ?auto_280183 ?auto_280184 ?auto_280185 ?auto_280186 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280197 - BLOCK
      ?auto_280198 - BLOCK
      ?auto_280199 - BLOCK
      ?auto_280200 - BLOCK
      ?auto_280201 - BLOCK
      ?auto_280202 - BLOCK
      ?auto_280203 - BLOCK
      ?auto_280204 - BLOCK
      ?auto_280205 - BLOCK
    )
    :vars
    (
      ?auto_280206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280205 ?auto_280206 ) ( ON-TABLE ?auto_280197 ) ( ON ?auto_280198 ?auto_280197 ) ( ON ?auto_280199 ?auto_280198 ) ( ON ?auto_280200 ?auto_280199 ) ( ON ?auto_280201 ?auto_280200 ) ( ON ?auto_280202 ?auto_280201 ) ( not ( = ?auto_280197 ?auto_280198 ) ) ( not ( = ?auto_280197 ?auto_280199 ) ) ( not ( = ?auto_280197 ?auto_280200 ) ) ( not ( = ?auto_280197 ?auto_280201 ) ) ( not ( = ?auto_280197 ?auto_280202 ) ) ( not ( = ?auto_280197 ?auto_280203 ) ) ( not ( = ?auto_280197 ?auto_280204 ) ) ( not ( = ?auto_280197 ?auto_280205 ) ) ( not ( = ?auto_280197 ?auto_280206 ) ) ( not ( = ?auto_280198 ?auto_280199 ) ) ( not ( = ?auto_280198 ?auto_280200 ) ) ( not ( = ?auto_280198 ?auto_280201 ) ) ( not ( = ?auto_280198 ?auto_280202 ) ) ( not ( = ?auto_280198 ?auto_280203 ) ) ( not ( = ?auto_280198 ?auto_280204 ) ) ( not ( = ?auto_280198 ?auto_280205 ) ) ( not ( = ?auto_280198 ?auto_280206 ) ) ( not ( = ?auto_280199 ?auto_280200 ) ) ( not ( = ?auto_280199 ?auto_280201 ) ) ( not ( = ?auto_280199 ?auto_280202 ) ) ( not ( = ?auto_280199 ?auto_280203 ) ) ( not ( = ?auto_280199 ?auto_280204 ) ) ( not ( = ?auto_280199 ?auto_280205 ) ) ( not ( = ?auto_280199 ?auto_280206 ) ) ( not ( = ?auto_280200 ?auto_280201 ) ) ( not ( = ?auto_280200 ?auto_280202 ) ) ( not ( = ?auto_280200 ?auto_280203 ) ) ( not ( = ?auto_280200 ?auto_280204 ) ) ( not ( = ?auto_280200 ?auto_280205 ) ) ( not ( = ?auto_280200 ?auto_280206 ) ) ( not ( = ?auto_280201 ?auto_280202 ) ) ( not ( = ?auto_280201 ?auto_280203 ) ) ( not ( = ?auto_280201 ?auto_280204 ) ) ( not ( = ?auto_280201 ?auto_280205 ) ) ( not ( = ?auto_280201 ?auto_280206 ) ) ( not ( = ?auto_280202 ?auto_280203 ) ) ( not ( = ?auto_280202 ?auto_280204 ) ) ( not ( = ?auto_280202 ?auto_280205 ) ) ( not ( = ?auto_280202 ?auto_280206 ) ) ( not ( = ?auto_280203 ?auto_280204 ) ) ( not ( = ?auto_280203 ?auto_280205 ) ) ( not ( = ?auto_280203 ?auto_280206 ) ) ( not ( = ?auto_280204 ?auto_280205 ) ) ( not ( = ?auto_280204 ?auto_280206 ) ) ( not ( = ?auto_280205 ?auto_280206 ) ) ( ON ?auto_280204 ?auto_280205 ) ( CLEAR ?auto_280202 ) ( ON ?auto_280203 ?auto_280204 ) ( CLEAR ?auto_280203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_280197 ?auto_280198 ?auto_280199 ?auto_280200 ?auto_280201 ?auto_280202 ?auto_280203 )
      ( MAKE-9PILE ?auto_280197 ?auto_280198 ?auto_280199 ?auto_280200 ?auto_280201 ?auto_280202 ?auto_280203 ?auto_280204 ?auto_280205 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280216 - BLOCK
      ?auto_280217 - BLOCK
      ?auto_280218 - BLOCK
      ?auto_280219 - BLOCK
      ?auto_280220 - BLOCK
      ?auto_280221 - BLOCK
      ?auto_280222 - BLOCK
      ?auto_280223 - BLOCK
      ?auto_280224 - BLOCK
    )
    :vars
    (
      ?auto_280225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280224 ?auto_280225 ) ( ON-TABLE ?auto_280216 ) ( ON ?auto_280217 ?auto_280216 ) ( ON ?auto_280218 ?auto_280217 ) ( ON ?auto_280219 ?auto_280218 ) ( ON ?auto_280220 ?auto_280219 ) ( not ( = ?auto_280216 ?auto_280217 ) ) ( not ( = ?auto_280216 ?auto_280218 ) ) ( not ( = ?auto_280216 ?auto_280219 ) ) ( not ( = ?auto_280216 ?auto_280220 ) ) ( not ( = ?auto_280216 ?auto_280221 ) ) ( not ( = ?auto_280216 ?auto_280222 ) ) ( not ( = ?auto_280216 ?auto_280223 ) ) ( not ( = ?auto_280216 ?auto_280224 ) ) ( not ( = ?auto_280216 ?auto_280225 ) ) ( not ( = ?auto_280217 ?auto_280218 ) ) ( not ( = ?auto_280217 ?auto_280219 ) ) ( not ( = ?auto_280217 ?auto_280220 ) ) ( not ( = ?auto_280217 ?auto_280221 ) ) ( not ( = ?auto_280217 ?auto_280222 ) ) ( not ( = ?auto_280217 ?auto_280223 ) ) ( not ( = ?auto_280217 ?auto_280224 ) ) ( not ( = ?auto_280217 ?auto_280225 ) ) ( not ( = ?auto_280218 ?auto_280219 ) ) ( not ( = ?auto_280218 ?auto_280220 ) ) ( not ( = ?auto_280218 ?auto_280221 ) ) ( not ( = ?auto_280218 ?auto_280222 ) ) ( not ( = ?auto_280218 ?auto_280223 ) ) ( not ( = ?auto_280218 ?auto_280224 ) ) ( not ( = ?auto_280218 ?auto_280225 ) ) ( not ( = ?auto_280219 ?auto_280220 ) ) ( not ( = ?auto_280219 ?auto_280221 ) ) ( not ( = ?auto_280219 ?auto_280222 ) ) ( not ( = ?auto_280219 ?auto_280223 ) ) ( not ( = ?auto_280219 ?auto_280224 ) ) ( not ( = ?auto_280219 ?auto_280225 ) ) ( not ( = ?auto_280220 ?auto_280221 ) ) ( not ( = ?auto_280220 ?auto_280222 ) ) ( not ( = ?auto_280220 ?auto_280223 ) ) ( not ( = ?auto_280220 ?auto_280224 ) ) ( not ( = ?auto_280220 ?auto_280225 ) ) ( not ( = ?auto_280221 ?auto_280222 ) ) ( not ( = ?auto_280221 ?auto_280223 ) ) ( not ( = ?auto_280221 ?auto_280224 ) ) ( not ( = ?auto_280221 ?auto_280225 ) ) ( not ( = ?auto_280222 ?auto_280223 ) ) ( not ( = ?auto_280222 ?auto_280224 ) ) ( not ( = ?auto_280222 ?auto_280225 ) ) ( not ( = ?auto_280223 ?auto_280224 ) ) ( not ( = ?auto_280223 ?auto_280225 ) ) ( not ( = ?auto_280224 ?auto_280225 ) ) ( ON ?auto_280223 ?auto_280224 ) ( ON ?auto_280222 ?auto_280223 ) ( CLEAR ?auto_280220 ) ( ON ?auto_280221 ?auto_280222 ) ( CLEAR ?auto_280221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_280216 ?auto_280217 ?auto_280218 ?auto_280219 ?auto_280220 ?auto_280221 )
      ( MAKE-9PILE ?auto_280216 ?auto_280217 ?auto_280218 ?auto_280219 ?auto_280220 ?auto_280221 ?auto_280222 ?auto_280223 ?auto_280224 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280235 - BLOCK
      ?auto_280236 - BLOCK
      ?auto_280237 - BLOCK
      ?auto_280238 - BLOCK
      ?auto_280239 - BLOCK
      ?auto_280240 - BLOCK
      ?auto_280241 - BLOCK
      ?auto_280242 - BLOCK
      ?auto_280243 - BLOCK
    )
    :vars
    (
      ?auto_280244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280243 ?auto_280244 ) ( ON-TABLE ?auto_280235 ) ( ON ?auto_280236 ?auto_280235 ) ( ON ?auto_280237 ?auto_280236 ) ( ON ?auto_280238 ?auto_280237 ) ( ON ?auto_280239 ?auto_280238 ) ( not ( = ?auto_280235 ?auto_280236 ) ) ( not ( = ?auto_280235 ?auto_280237 ) ) ( not ( = ?auto_280235 ?auto_280238 ) ) ( not ( = ?auto_280235 ?auto_280239 ) ) ( not ( = ?auto_280235 ?auto_280240 ) ) ( not ( = ?auto_280235 ?auto_280241 ) ) ( not ( = ?auto_280235 ?auto_280242 ) ) ( not ( = ?auto_280235 ?auto_280243 ) ) ( not ( = ?auto_280235 ?auto_280244 ) ) ( not ( = ?auto_280236 ?auto_280237 ) ) ( not ( = ?auto_280236 ?auto_280238 ) ) ( not ( = ?auto_280236 ?auto_280239 ) ) ( not ( = ?auto_280236 ?auto_280240 ) ) ( not ( = ?auto_280236 ?auto_280241 ) ) ( not ( = ?auto_280236 ?auto_280242 ) ) ( not ( = ?auto_280236 ?auto_280243 ) ) ( not ( = ?auto_280236 ?auto_280244 ) ) ( not ( = ?auto_280237 ?auto_280238 ) ) ( not ( = ?auto_280237 ?auto_280239 ) ) ( not ( = ?auto_280237 ?auto_280240 ) ) ( not ( = ?auto_280237 ?auto_280241 ) ) ( not ( = ?auto_280237 ?auto_280242 ) ) ( not ( = ?auto_280237 ?auto_280243 ) ) ( not ( = ?auto_280237 ?auto_280244 ) ) ( not ( = ?auto_280238 ?auto_280239 ) ) ( not ( = ?auto_280238 ?auto_280240 ) ) ( not ( = ?auto_280238 ?auto_280241 ) ) ( not ( = ?auto_280238 ?auto_280242 ) ) ( not ( = ?auto_280238 ?auto_280243 ) ) ( not ( = ?auto_280238 ?auto_280244 ) ) ( not ( = ?auto_280239 ?auto_280240 ) ) ( not ( = ?auto_280239 ?auto_280241 ) ) ( not ( = ?auto_280239 ?auto_280242 ) ) ( not ( = ?auto_280239 ?auto_280243 ) ) ( not ( = ?auto_280239 ?auto_280244 ) ) ( not ( = ?auto_280240 ?auto_280241 ) ) ( not ( = ?auto_280240 ?auto_280242 ) ) ( not ( = ?auto_280240 ?auto_280243 ) ) ( not ( = ?auto_280240 ?auto_280244 ) ) ( not ( = ?auto_280241 ?auto_280242 ) ) ( not ( = ?auto_280241 ?auto_280243 ) ) ( not ( = ?auto_280241 ?auto_280244 ) ) ( not ( = ?auto_280242 ?auto_280243 ) ) ( not ( = ?auto_280242 ?auto_280244 ) ) ( not ( = ?auto_280243 ?auto_280244 ) ) ( ON ?auto_280242 ?auto_280243 ) ( ON ?auto_280241 ?auto_280242 ) ( CLEAR ?auto_280239 ) ( ON ?auto_280240 ?auto_280241 ) ( CLEAR ?auto_280240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_280235 ?auto_280236 ?auto_280237 ?auto_280238 ?auto_280239 ?auto_280240 )
      ( MAKE-9PILE ?auto_280235 ?auto_280236 ?auto_280237 ?auto_280238 ?auto_280239 ?auto_280240 ?auto_280241 ?auto_280242 ?auto_280243 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280254 - BLOCK
      ?auto_280255 - BLOCK
      ?auto_280256 - BLOCK
      ?auto_280257 - BLOCK
      ?auto_280258 - BLOCK
      ?auto_280259 - BLOCK
      ?auto_280260 - BLOCK
      ?auto_280261 - BLOCK
      ?auto_280262 - BLOCK
    )
    :vars
    (
      ?auto_280263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280262 ?auto_280263 ) ( ON-TABLE ?auto_280254 ) ( ON ?auto_280255 ?auto_280254 ) ( ON ?auto_280256 ?auto_280255 ) ( ON ?auto_280257 ?auto_280256 ) ( not ( = ?auto_280254 ?auto_280255 ) ) ( not ( = ?auto_280254 ?auto_280256 ) ) ( not ( = ?auto_280254 ?auto_280257 ) ) ( not ( = ?auto_280254 ?auto_280258 ) ) ( not ( = ?auto_280254 ?auto_280259 ) ) ( not ( = ?auto_280254 ?auto_280260 ) ) ( not ( = ?auto_280254 ?auto_280261 ) ) ( not ( = ?auto_280254 ?auto_280262 ) ) ( not ( = ?auto_280254 ?auto_280263 ) ) ( not ( = ?auto_280255 ?auto_280256 ) ) ( not ( = ?auto_280255 ?auto_280257 ) ) ( not ( = ?auto_280255 ?auto_280258 ) ) ( not ( = ?auto_280255 ?auto_280259 ) ) ( not ( = ?auto_280255 ?auto_280260 ) ) ( not ( = ?auto_280255 ?auto_280261 ) ) ( not ( = ?auto_280255 ?auto_280262 ) ) ( not ( = ?auto_280255 ?auto_280263 ) ) ( not ( = ?auto_280256 ?auto_280257 ) ) ( not ( = ?auto_280256 ?auto_280258 ) ) ( not ( = ?auto_280256 ?auto_280259 ) ) ( not ( = ?auto_280256 ?auto_280260 ) ) ( not ( = ?auto_280256 ?auto_280261 ) ) ( not ( = ?auto_280256 ?auto_280262 ) ) ( not ( = ?auto_280256 ?auto_280263 ) ) ( not ( = ?auto_280257 ?auto_280258 ) ) ( not ( = ?auto_280257 ?auto_280259 ) ) ( not ( = ?auto_280257 ?auto_280260 ) ) ( not ( = ?auto_280257 ?auto_280261 ) ) ( not ( = ?auto_280257 ?auto_280262 ) ) ( not ( = ?auto_280257 ?auto_280263 ) ) ( not ( = ?auto_280258 ?auto_280259 ) ) ( not ( = ?auto_280258 ?auto_280260 ) ) ( not ( = ?auto_280258 ?auto_280261 ) ) ( not ( = ?auto_280258 ?auto_280262 ) ) ( not ( = ?auto_280258 ?auto_280263 ) ) ( not ( = ?auto_280259 ?auto_280260 ) ) ( not ( = ?auto_280259 ?auto_280261 ) ) ( not ( = ?auto_280259 ?auto_280262 ) ) ( not ( = ?auto_280259 ?auto_280263 ) ) ( not ( = ?auto_280260 ?auto_280261 ) ) ( not ( = ?auto_280260 ?auto_280262 ) ) ( not ( = ?auto_280260 ?auto_280263 ) ) ( not ( = ?auto_280261 ?auto_280262 ) ) ( not ( = ?auto_280261 ?auto_280263 ) ) ( not ( = ?auto_280262 ?auto_280263 ) ) ( ON ?auto_280261 ?auto_280262 ) ( ON ?auto_280260 ?auto_280261 ) ( ON ?auto_280259 ?auto_280260 ) ( CLEAR ?auto_280257 ) ( ON ?auto_280258 ?auto_280259 ) ( CLEAR ?auto_280258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_280254 ?auto_280255 ?auto_280256 ?auto_280257 ?auto_280258 )
      ( MAKE-9PILE ?auto_280254 ?auto_280255 ?auto_280256 ?auto_280257 ?auto_280258 ?auto_280259 ?auto_280260 ?auto_280261 ?auto_280262 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280273 - BLOCK
      ?auto_280274 - BLOCK
      ?auto_280275 - BLOCK
      ?auto_280276 - BLOCK
      ?auto_280277 - BLOCK
      ?auto_280278 - BLOCK
      ?auto_280279 - BLOCK
      ?auto_280280 - BLOCK
      ?auto_280281 - BLOCK
    )
    :vars
    (
      ?auto_280282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280281 ?auto_280282 ) ( ON-TABLE ?auto_280273 ) ( ON ?auto_280274 ?auto_280273 ) ( ON ?auto_280275 ?auto_280274 ) ( ON ?auto_280276 ?auto_280275 ) ( not ( = ?auto_280273 ?auto_280274 ) ) ( not ( = ?auto_280273 ?auto_280275 ) ) ( not ( = ?auto_280273 ?auto_280276 ) ) ( not ( = ?auto_280273 ?auto_280277 ) ) ( not ( = ?auto_280273 ?auto_280278 ) ) ( not ( = ?auto_280273 ?auto_280279 ) ) ( not ( = ?auto_280273 ?auto_280280 ) ) ( not ( = ?auto_280273 ?auto_280281 ) ) ( not ( = ?auto_280273 ?auto_280282 ) ) ( not ( = ?auto_280274 ?auto_280275 ) ) ( not ( = ?auto_280274 ?auto_280276 ) ) ( not ( = ?auto_280274 ?auto_280277 ) ) ( not ( = ?auto_280274 ?auto_280278 ) ) ( not ( = ?auto_280274 ?auto_280279 ) ) ( not ( = ?auto_280274 ?auto_280280 ) ) ( not ( = ?auto_280274 ?auto_280281 ) ) ( not ( = ?auto_280274 ?auto_280282 ) ) ( not ( = ?auto_280275 ?auto_280276 ) ) ( not ( = ?auto_280275 ?auto_280277 ) ) ( not ( = ?auto_280275 ?auto_280278 ) ) ( not ( = ?auto_280275 ?auto_280279 ) ) ( not ( = ?auto_280275 ?auto_280280 ) ) ( not ( = ?auto_280275 ?auto_280281 ) ) ( not ( = ?auto_280275 ?auto_280282 ) ) ( not ( = ?auto_280276 ?auto_280277 ) ) ( not ( = ?auto_280276 ?auto_280278 ) ) ( not ( = ?auto_280276 ?auto_280279 ) ) ( not ( = ?auto_280276 ?auto_280280 ) ) ( not ( = ?auto_280276 ?auto_280281 ) ) ( not ( = ?auto_280276 ?auto_280282 ) ) ( not ( = ?auto_280277 ?auto_280278 ) ) ( not ( = ?auto_280277 ?auto_280279 ) ) ( not ( = ?auto_280277 ?auto_280280 ) ) ( not ( = ?auto_280277 ?auto_280281 ) ) ( not ( = ?auto_280277 ?auto_280282 ) ) ( not ( = ?auto_280278 ?auto_280279 ) ) ( not ( = ?auto_280278 ?auto_280280 ) ) ( not ( = ?auto_280278 ?auto_280281 ) ) ( not ( = ?auto_280278 ?auto_280282 ) ) ( not ( = ?auto_280279 ?auto_280280 ) ) ( not ( = ?auto_280279 ?auto_280281 ) ) ( not ( = ?auto_280279 ?auto_280282 ) ) ( not ( = ?auto_280280 ?auto_280281 ) ) ( not ( = ?auto_280280 ?auto_280282 ) ) ( not ( = ?auto_280281 ?auto_280282 ) ) ( ON ?auto_280280 ?auto_280281 ) ( ON ?auto_280279 ?auto_280280 ) ( ON ?auto_280278 ?auto_280279 ) ( CLEAR ?auto_280276 ) ( ON ?auto_280277 ?auto_280278 ) ( CLEAR ?auto_280277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_280273 ?auto_280274 ?auto_280275 ?auto_280276 ?auto_280277 )
      ( MAKE-9PILE ?auto_280273 ?auto_280274 ?auto_280275 ?auto_280276 ?auto_280277 ?auto_280278 ?auto_280279 ?auto_280280 ?auto_280281 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280292 - BLOCK
      ?auto_280293 - BLOCK
      ?auto_280294 - BLOCK
      ?auto_280295 - BLOCK
      ?auto_280296 - BLOCK
      ?auto_280297 - BLOCK
      ?auto_280298 - BLOCK
      ?auto_280299 - BLOCK
      ?auto_280300 - BLOCK
    )
    :vars
    (
      ?auto_280301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280300 ?auto_280301 ) ( ON-TABLE ?auto_280292 ) ( ON ?auto_280293 ?auto_280292 ) ( ON ?auto_280294 ?auto_280293 ) ( not ( = ?auto_280292 ?auto_280293 ) ) ( not ( = ?auto_280292 ?auto_280294 ) ) ( not ( = ?auto_280292 ?auto_280295 ) ) ( not ( = ?auto_280292 ?auto_280296 ) ) ( not ( = ?auto_280292 ?auto_280297 ) ) ( not ( = ?auto_280292 ?auto_280298 ) ) ( not ( = ?auto_280292 ?auto_280299 ) ) ( not ( = ?auto_280292 ?auto_280300 ) ) ( not ( = ?auto_280292 ?auto_280301 ) ) ( not ( = ?auto_280293 ?auto_280294 ) ) ( not ( = ?auto_280293 ?auto_280295 ) ) ( not ( = ?auto_280293 ?auto_280296 ) ) ( not ( = ?auto_280293 ?auto_280297 ) ) ( not ( = ?auto_280293 ?auto_280298 ) ) ( not ( = ?auto_280293 ?auto_280299 ) ) ( not ( = ?auto_280293 ?auto_280300 ) ) ( not ( = ?auto_280293 ?auto_280301 ) ) ( not ( = ?auto_280294 ?auto_280295 ) ) ( not ( = ?auto_280294 ?auto_280296 ) ) ( not ( = ?auto_280294 ?auto_280297 ) ) ( not ( = ?auto_280294 ?auto_280298 ) ) ( not ( = ?auto_280294 ?auto_280299 ) ) ( not ( = ?auto_280294 ?auto_280300 ) ) ( not ( = ?auto_280294 ?auto_280301 ) ) ( not ( = ?auto_280295 ?auto_280296 ) ) ( not ( = ?auto_280295 ?auto_280297 ) ) ( not ( = ?auto_280295 ?auto_280298 ) ) ( not ( = ?auto_280295 ?auto_280299 ) ) ( not ( = ?auto_280295 ?auto_280300 ) ) ( not ( = ?auto_280295 ?auto_280301 ) ) ( not ( = ?auto_280296 ?auto_280297 ) ) ( not ( = ?auto_280296 ?auto_280298 ) ) ( not ( = ?auto_280296 ?auto_280299 ) ) ( not ( = ?auto_280296 ?auto_280300 ) ) ( not ( = ?auto_280296 ?auto_280301 ) ) ( not ( = ?auto_280297 ?auto_280298 ) ) ( not ( = ?auto_280297 ?auto_280299 ) ) ( not ( = ?auto_280297 ?auto_280300 ) ) ( not ( = ?auto_280297 ?auto_280301 ) ) ( not ( = ?auto_280298 ?auto_280299 ) ) ( not ( = ?auto_280298 ?auto_280300 ) ) ( not ( = ?auto_280298 ?auto_280301 ) ) ( not ( = ?auto_280299 ?auto_280300 ) ) ( not ( = ?auto_280299 ?auto_280301 ) ) ( not ( = ?auto_280300 ?auto_280301 ) ) ( ON ?auto_280299 ?auto_280300 ) ( ON ?auto_280298 ?auto_280299 ) ( ON ?auto_280297 ?auto_280298 ) ( ON ?auto_280296 ?auto_280297 ) ( CLEAR ?auto_280294 ) ( ON ?auto_280295 ?auto_280296 ) ( CLEAR ?auto_280295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_280292 ?auto_280293 ?auto_280294 ?auto_280295 )
      ( MAKE-9PILE ?auto_280292 ?auto_280293 ?auto_280294 ?auto_280295 ?auto_280296 ?auto_280297 ?auto_280298 ?auto_280299 ?auto_280300 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280311 - BLOCK
      ?auto_280312 - BLOCK
      ?auto_280313 - BLOCK
      ?auto_280314 - BLOCK
      ?auto_280315 - BLOCK
      ?auto_280316 - BLOCK
      ?auto_280317 - BLOCK
      ?auto_280318 - BLOCK
      ?auto_280319 - BLOCK
    )
    :vars
    (
      ?auto_280320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280319 ?auto_280320 ) ( ON-TABLE ?auto_280311 ) ( ON ?auto_280312 ?auto_280311 ) ( ON ?auto_280313 ?auto_280312 ) ( not ( = ?auto_280311 ?auto_280312 ) ) ( not ( = ?auto_280311 ?auto_280313 ) ) ( not ( = ?auto_280311 ?auto_280314 ) ) ( not ( = ?auto_280311 ?auto_280315 ) ) ( not ( = ?auto_280311 ?auto_280316 ) ) ( not ( = ?auto_280311 ?auto_280317 ) ) ( not ( = ?auto_280311 ?auto_280318 ) ) ( not ( = ?auto_280311 ?auto_280319 ) ) ( not ( = ?auto_280311 ?auto_280320 ) ) ( not ( = ?auto_280312 ?auto_280313 ) ) ( not ( = ?auto_280312 ?auto_280314 ) ) ( not ( = ?auto_280312 ?auto_280315 ) ) ( not ( = ?auto_280312 ?auto_280316 ) ) ( not ( = ?auto_280312 ?auto_280317 ) ) ( not ( = ?auto_280312 ?auto_280318 ) ) ( not ( = ?auto_280312 ?auto_280319 ) ) ( not ( = ?auto_280312 ?auto_280320 ) ) ( not ( = ?auto_280313 ?auto_280314 ) ) ( not ( = ?auto_280313 ?auto_280315 ) ) ( not ( = ?auto_280313 ?auto_280316 ) ) ( not ( = ?auto_280313 ?auto_280317 ) ) ( not ( = ?auto_280313 ?auto_280318 ) ) ( not ( = ?auto_280313 ?auto_280319 ) ) ( not ( = ?auto_280313 ?auto_280320 ) ) ( not ( = ?auto_280314 ?auto_280315 ) ) ( not ( = ?auto_280314 ?auto_280316 ) ) ( not ( = ?auto_280314 ?auto_280317 ) ) ( not ( = ?auto_280314 ?auto_280318 ) ) ( not ( = ?auto_280314 ?auto_280319 ) ) ( not ( = ?auto_280314 ?auto_280320 ) ) ( not ( = ?auto_280315 ?auto_280316 ) ) ( not ( = ?auto_280315 ?auto_280317 ) ) ( not ( = ?auto_280315 ?auto_280318 ) ) ( not ( = ?auto_280315 ?auto_280319 ) ) ( not ( = ?auto_280315 ?auto_280320 ) ) ( not ( = ?auto_280316 ?auto_280317 ) ) ( not ( = ?auto_280316 ?auto_280318 ) ) ( not ( = ?auto_280316 ?auto_280319 ) ) ( not ( = ?auto_280316 ?auto_280320 ) ) ( not ( = ?auto_280317 ?auto_280318 ) ) ( not ( = ?auto_280317 ?auto_280319 ) ) ( not ( = ?auto_280317 ?auto_280320 ) ) ( not ( = ?auto_280318 ?auto_280319 ) ) ( not ( = ?auto_280318 ?auto_280320 ) ) ( not ( = ?auto_280319 ?auto_280320 ) ) ( ON ?auto_280318 ?auto_280319 ) ( ON ?auto_280317 ?auto_280318 ) ( ON ?auto_280316 ?auto_280317 ) ( ON ?auto_280315 ?auto_280316 ) ( CLEAR ?auto_280313 ) ( ON ?auto_280314 ?auto_280315 ) ( CLEAR ?auto_280314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_280311 ?auto_280312 ?auto_280313 ?auto_280314 )
      ( MAKE-9PILE ?auto_280311 ?auto_280312 ?auto_280313 ?auto_280314 ?auto_280315 ?auto_280316 ?auto_280317 ?auto_280318 ?auto_280319 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280330 - BLOCK
      ?auto_280331 - BLOCK
      ?auto_280332 - BLOCK
      ?auto_280333 - BLOCK
      ?auto_280334 - BLOCK
      ?auto_280335 - BLOCK
      ?auto_280336 - BLOCK
      ?auto_280337 - BLOCK
      ?auto_280338 - BLOCK
    )
    :vars
    (
      ?auto_280339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280338 ?auto_280339 ) ( ON-TABLE ?auto_280330 ) ( ON ?auto_280331 ?auto_280330 ) ( not ( = ?auto_280330 ?auto_280331 ) ) ( not ( = ?auto_280330 ?auto_280332 ) ) ( not ( = ?auto_280330 ?auto_280333 ) ) ( not ( = ?auto_280330 ?auto_280334 ) ) ( not ( = ?auto_280330 ?auto_280335 ) ) ( not ( = ?auto_280330 ?auto_280336 ) ) ( not ( = ?auto_280330 ?auto_280337 ) ) ( not ( = ?auto_280330 ?auto_280338 ) ) ( not ( = ?auto_280330 ?auto_280339 ) ) ( not ( = ?auto_280331 ?auto_280332 ) ) ( not ( = ?auto_280331 ?auto_280333 ) ) ( not ( = ?auto_280331 ?auto_280334 ) ) ( not ( = ?auto_280331 ?auto_280335 ) ) ( not ( = ?auto_280331 ?auto_280336 ) ) ( not ( = ?auto_280331 ?auto_280337 ) ) ( not ( = ?auto_280331 ?auto_280338 ) ) ( not ( = ?auto_280331 ?auto_280339 ) ) ( not ( = ?auto_280332 ?auto_280333 ) ) ( not ( = ?auto_280332 ?auto_280334 ) ) ( not ( = ?auto_280332 ?auto_280335 ) ) ( not ( = ?auto_280332 ?auto_280336 ) ) ( not ( = ?auto_280332 ?auto_280337 ) ) ( not ( = ?auto_280332 ?auto_280338 ) ) ( not ( = ?auto_280332 ?auto_280339 ) ) ( not ( = ?auto_280333 ?auto_280334 ) ) ( not ( = ?auto_280333 ?auto_280335 ) ) ( not ( = ?auto_280333 ?auto_280336 ) ) ( not ( = ?auto_280333 ?auto_280337 ) ) ( not ( = ?auto_280333 ?auto_280338 ) ) ( not ( = ?auto_280333 ?auto_280339 ) ) ( not ( = ?auto_280334 ?auto_280335 ) ) ( not ( = ?auto_280334 ?auto_280336 ) ) ( not ( = ?auto_280334 ?auto_280337 ) ) ( not ( = ?auto_280334 ?auto_280338 ) ) ( not ( = ?auto_280334 ?auto_280339 ) ) ( not ( = ?auto_280335 ?auto_280336 ) ) ( not ( = ?auto_280335 ?auto_280337 ) ) ( not ( = ?auto_280335 ?auto_280338 ) ) ( not ( = ?auto_280335 ?auto_280339 ) ) ( not ( = ?auto_280336 ?auto_280337 ) ) ( not ( = ?auto_280336 ?auto_280338 ) ) ( not ( = ?auto_280336 ?auto_280339 ) ) ( not ( = ?auto_280337 ?auto_280338 ) ) ( not ( = ?auto_280337 ?auto_280339 ) ) ( not ( = ?auto_280338 ?auto_280339 ) ) ( ON ?auto_280337 ?auto_280338 ) ( ON ?auto_280336 ?auto_280337 ) ( ON ?auto_280335 ?auto_280336 ) ( ON ?auto_280334 ?auto_280335 ) ( ON ?auto_280333 ?auto_280334 ) ( CLEAR ?auto_280331 ) ( ON ?auto_280332 ?auto_280333 ) ( CLEAR ?auto_280332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_280330 ?auto_280331 ?auto_280332 )
      ( MAKE-9PILE ?auto_280330 ?auto_280331 ?auto_280332 ?auto_280333 ?auto_280334 ?auto_280335 ?auto_280336 ?auto_280337 ?auto_280338 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280349 - BLOCK
      ?auto_280350 - BLOCK
      ?auto_280351 - BLOCK
      ?auto_280352 - BLOCK
      ?auto_280353 - BLOCK
      ?auto_280354 - BLOCK
      ?auto_280355 - BLOCK
      ?auto_280356 - BLOCK
      ?auto_280357 - BLOCK
    )
    :vars
    (
      ?auto_280358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280357 ?auto_280358 ) ( ON-TABLE ?auto_280349 ) ( ON ?auto_280350 ?auto_280349 ) ( not ( = ?auto_280349 ?auto_280350 ) ) ( not ( = ?auto_280349 ?auto_280351 ) ) ( not ( = ?auto_280349 ?auto_280352 ) ) ( not ( = ?auto_280349 ?auto_280353 ) ) ( not ( = ?auto_280349 ?auto_280354 ) ) ( not ( = ?auto_280349 ?auto_280355 ) ) ( not ( = ?auto_280349 ?auto_280356 ) ) ( not ( = ?auto_280349 ?auto_280357 ) ) ( not ( = ?auto_280349 ?auto_280358 ) ) ( not ( = ?auto_280350 ?auto_280351 ) ) ( not ( = ?auto_280350 ?auto_280352 ) ) ( not ( = ?auto_280350 ?auto_280353 ) ) ( not ( = ?auto_280350 ?auto_280354 ) ) ( not ( = ?auto_280350 ?auto_280355 ) ) ( not ( = ?auto_280350 ?auto_280356 ) ) ( not ( = ?auto_280350 ?auto_280357 ) ) ( not ( = ?auto_280350 ?auto_280358 ) ) ( not ( = ?auto_280351 ?auto_280352 ) ) ( not ( = ?auto_280351 ?auto_280353 ) ) ( not ( = ?auto_280351 ?auto_280354 ) ) ( not ( = ?auto_280351 ?auto_280355 ) ) ( not ( = ?auto_280351 ?auto_280356 ) ) ( not ( = ?auto_280351 ?auto_280357 ) ) ( not ( = ?auto_280351 ?auto_280358 ) ) ( not ( = ?auto_280352 ?auto_280353 ) ) ( not ( = ?auto_280352 ?auto_280354 ) ) ( not ( = ?auto_280352 ?auto_280355 ) ) ( not ( = ?auto_280352 ?auto_280356 ) ) ( not ( = ?auto_280352 ?auto_280357 ) ) ( not ( = ?auto_280352 ?auto_280358 ) ) ( not ( = ?auto_280353 ?auto_280354 ) ) ( not ( = ?auto_280353 ?auto_280355 ) ) ( not ( = ?auto_280353 ?auto_280356 ) ) ( not ( = ?auto_280353 ?auto_280357 ) ) ( not ( = ?auto_280353 ?auto_280358 ) ) ( not ( = ?auto_280354 ?auto_280355 ) ) ( not ( = ?auto_280354 ?auto_280356 ) ) ( not ( = ?auto_280354 ?auto_280357 ) ) ( not ( = ?auto_280354 ?auto_280358 ) ) ( not ( = ?auto_280355 ?auto_280356 ) ) ( not ( = ?auto_280355 ?auto_280357 ) ) ( not ( = ?auto_280355 ?auto_280358 ) ) ( not ( = ?auto_280356 ?auto_280357 ) ) ( not ( = ?auto_280356 ?auto_280358 ) ) ( not ( = ?auto_280357 ?auto_280358 ) ) ( ON ?auto_280356 ?auto_280357 ) ( ON ?auto_280355 ?auto_280356 ) ( ON ?auto_280354 ?auto_280355 ) ( ON ?auto_280353 ?auto_280354 ) ( ON ?auto_280352 ?auto_280353 ) ( CLEAR ?auto_280350 ) ( ON ?auto_280351 ?auto_280352 ) ( CLEAR ?auto_280351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_280349 ?auto_280350 ?auto_280351 )
      ( MAKE-9PILE ?auto_280349 ?auto_280350 ?auto_280351 ?auto_280352 ?auto_280353 ?auto_280354 ?auto_280355 ?auto_280356 ?auto_280357 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280368 - BLOCK
      ?auto_280369 - BLOCK
      ?auto_280370 - BLOCK
      ?auto_280371 - BLOCK
      ?auto_280372 - BLOCK
      ?auto_280373 - BLOCK
      ?auto_280374 - BLOCK
      ?auto_280375 - BLOCK
      ?auto_280376 - BLOCK
    )
    :vars
    (
      ?auto_280377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280376 ?auto_280377 ) ( ON-TABLE ?auto_280368 ) ( not ( = ?auto_280368 ?auto_280369 ) ) ( not ( = ?auto_280368 ?auto_280370 ) ) ( not ( = ?auto_280368 ?auto_280371 ) ) ( not ( = ?auto_280368 ?auto_280372 ) ) ( not ( = ?auto_280368 ?auto_280373 ) ) ( not ( = ?auto_280368 ?auto_280374 ) ) ( not ( = ?auto_280368 ?auto_280375 ) ) ( not ( = ?auto_280368 ?auto_280376 ) ) ( not ( = ?auto_280368 ?auto_280377 ) ) ( not ( = ?auto_280369 ?auto_280370 ) ) ( not ( = ?auto_280369 ?auto_280371 ) ) ( not ( = ?auto_280369 ?auto_280372 ) ) ( not ( = ?auto_280369 ?auto_280373 ) ) ( not ( = ?auto_280369 ?auto_280374 ) ) ( not ( = ?auto_280369 ?auto_280375 ) ) ( not ( = ?auto_280369 ?auto_280376 ) ) ( not ( = ?auto_280369 ?auto_280377 ) ) ( not ( = ?auto_280370 ?auto_280371 ) ) ( not ( = ?auto_280370 ?auto_280372 ) ) ( not ( = ?auto_280370 ?auto_280373 ) ) ( not ( = ?auto_280370 ?auto_280374 ) ) ( not ( = ?auto_280370 ?auto_280375 ) ) ( not ( = ?auto_280370 ?auto_280376 ) ) ( not ( = ?auto_280370 ?auto_280377 ) ) ( not ( = ?auto_280371 ?auto_280372 ) ) ( not ( = ?auto_280371 ?auto_280373 ) ) ( not ( = ?auto_280371 ?auto_280374 ) ) ( not ( = ?auto_280371 ?auto_280375 ) ) ( not ( = ?auto_280371 ?auto_280376 ) ) ( not ( = ?auto_280371 ?auto_280377 ) ) ( not ( = ?auto_280372 ?auto_280373 ) ) ( not ( = ?auto_280372 ?auto_280374 ) ) ( not ( = ?auto_280372 ?auto_280375 ) ) ( not ( = ?auto_280372 ?auto_280376 ) ) ( not ( = ?auto_280372 ?auto_280377 ) ) ( not ( = ?auto_280373 ?auto_280374 ) ) ( not ( = ?auto_280373 ?auto_280375 ) ) ( not ( = ?auto_280373 ?auto_280376 ) ) ( not ( = ?auto_280373 ?auto_280377 ) ) ( not ( = ?auto_280374 ?auto_280375 ) ) ( not ( = ?auto_280374 ?auto_280376 ) ) ( not ( = ?auto_280374 ?auto_280377 ) ) ( not ( = ?auto_280375 ?auto_280376 ) ) ( not ( = ?auto_280375 ?auto_280377 ) ) ( not ( = ?auto_280376 ?auto_280377 ) ) ( ON ?auto_280375 ?auto_280376 ) ( ON ?auto_280374 ?auto_280375 ) ( ON ?auto_280373 ?auto_280374 ) ( ON ?auto_280372 ?auto_280373 ) ( ON ?auto_280371 ?auto_280372 ) ( ON ?auto_280370 ?auto_280371 ) ( CLEAR ?auto_280368 ) ( ON ?auto_280369 ?auto_280370 ) ( CLEAR ?auto_280369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280368 ?auto_280369 )
      ( MAKE-9PILE ?auto_280368 ?auto_280369 ?auto_280370 ?auto_280371 ?auto_280372 ?auto_280373 ?auto_280374 ?auto_280375 ?auto_280376 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280387 - BLOCK
      ?auto_280388 - BLOCK
      ?auto_280389 - BLOCK
      ?auto_280390 - BLOCK
      ?auto_280391 - BLOCK
      ?auto_280392 - BLOCK
      ?auto_280393 - BLOCK
      ?auto_280394 - BLOCK
      ?auto_280395 - BLOCK
    )
    :vars
    (
      ?auto_280396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280395 ?auto_280396 ) ( ON-TABLE ?auto_280387 ) ( not ( = ?auto_280387 ?auto_280388 ) ) ( not ( = ?auto_280387 ?auto_280389 ) ) ( not ( = ?auto_280387 ?auto_280390 ) ) ( not ( = ?auto_280387 ?auto_280391 ) ) ( not ( = ?auto_280387 ?auto_280392 ) ) ( not ( = ?auto_280387 ?auto_280393 ) ) ( not ( = ?auto_280387 ?auto_280394 ) ) ( not ( = ?auto_280387 ?auto_280395 ) ) ( not ( = ?auto_280387 ?auto_280396 ) ) ( not ( = ?auto_280388 ?auto_280389 ) ) ( not ( = ?auto_280388 ?auto_280390 ) ) ( not ( = ?auto_280388 ?auto_280391 ) ) ( not ( = ?auto_280388 ?auto_280392 ) ) ( not ( = ?auto_280388 ?auto_280393 ) ) ( not ( = ?auto_280388 ?auto_280394 ) ) ( not ( = ?auto_280388 ?auto_280395 ) ) ( not ( = ?auto_280388 ?auto_280396 ) ) ( not ( = ?auto_280389 ?auto_280390 ) ) ( not ( = ?auto_280389 ?auto_280391 ) ) ( not ( = ?auto_280389 ?auto_280392 ) ) ( not ( = ?auto_280389 ?auto_280393 ) ) ( not ( = ?auto_280389 ?auto_280394 ) ) ( not ( = ?auto_280389 ?auto_280395 ) ) ( not ( = ?auto_280389 ?auto_280396 ) ) ( not ( = ?auto_280390 ?auto_280391 ) ) ( not ( = ?auto_280390 ?auto_280392 ) ) ( not ( = ?auto_280390 ?auto_280393 ) ) ( not ( = ?auto_280390 ?auto_280394 ) ) ( not ( = ?auto_280390 ?auto_280395 ) ) ( not ( = ?auto_280390 ?auto_280396 ) ) ( not ( = ?auto_280391 ?auto_280392 ) ) ( not ( = ?auto_280391 ?auto_280393 ) ) ( not ( = ?auto_280391 ?auto_280394 ) ) ( not ( = ?auto_280391 ?auto_280395 ) ) ( not ( = ?auto_280391 ?auto_280396 ) ) ( not ( = ?auto_280392 ?auto_280393 ) ) ( not ( = ?auto_280392 ?auto_280394 ) ) ( not ( = ?auto_280392 ?auto_280395 ) ) ( not ( = ?auto_280392 ?auto_280396 ) ) ( not ( = ?auto_280393 ?auto_280394 ) ) ( not ( = ?auto_280393 ?auto_280395 ) ) ( not ( = ?auto_280393 ?auto_280396 ) ) ( not ( = ?auto_280394 ?auto_280395 ) ) ( not ( = ?auto_280394 ?auto_280396 ) ) ( not ( = ?auto_280395 ?auto_280396 ) ) ( ON ?auto_280394 ?auto_280395 ) ( ON ?auto_280393 ?auto_280394 ) ( ON ?auto_280392 ?auto_280393 ) ( ON ?auto_280391 ?auto_280392 ) ( ON ?auto_280390 ?auto_280391 ) ( ON ?auto_280389 ?auto_280390 ) ( CLEAR ?auto_280387 ) ( ON ?auto_280388 ?auto_280389 ) ( CLEAR ?auto_280388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280387 ?auto_280388 )
      ( MAKE-9PILE ?auto_280387 ?auto_280388 ?auto_280389 ?auto_280390 ?auto_280391 ?auto_280392 ?auto_280393 ?auto_280394 ?auto_280395 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280406 - BLOCK
      ?auto_280407 - BLOCK
      ?auto_280408 - BLOCK
      ?auto_280409 - BLOCK
      ?auto_280410 - BLOCK
      ?auto_280411 - BLOCK
      ?auto_280412 - BLOCK
      ?auto_280413 - BLOCK
      ?auto_280414 - BLOCK
    )
    :vars
    (
      ?auto_280415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280414 ?auto_280415 ) ( not ( = ?auto_280406 ?auto_280407 ) ) ( not ( = ?auto_280406 ?auto_280408 ) ) ( not ( = ?auto_280406 ?auto_280409 ) ) ( not ( = ?auto_280406 ?auto_280410 ) ) ( not ( = ?auto_280406 ?auto_280411 ) ) ( not ( = ?auto_280406 ?auto_280412 ) ) ( not ( = ?auto_280406 ?auto_280413 ) ) ( not ( = ?auto_280406 ?auto_280414 ) ) ( not ( = ?auto_280406 ?auto_280415 ) ) ( not ( = ?auto_280407 ?auto_280408 ) ) ( not ( = ?auto_280407 ?auto_280409 ) ) ( not ( = ?auto_280407 ?auto_280410 ) ) ( not ( = ?auto_280407 ?auto_280411 ) ) ( not ( = ?auto_280407 ?auto_280412 ) ) ( not ( = ?auto_280407 ?auto_280413 ) ) ( not ( = ?auto_280407 ?auto_280414 ) ) ( not ( = ?auto_280407 ?auto_280415 ) ) ( not ( = ?auto_280408 ?auto_280409 ) ) ( not ( = ?auto_280408 ?auto_280410 ) ) ( not ( = ?auto_280408 ?auto_280411 ) ) ( not ( = ?auto_280408 ?auto_280412 ) ) ( not ( = ?auto_280408 ?auto_280413 ) ) ( not ( = ?auto_280408 ?auto_280414 ) ) ( not ( = ?auto_280408 ?auto_280415 ) ) ( not ( = ?auto_280409 ?auto_280410 ) ) ( not ( = ?auto_280409 ?auto_280411 ) ) ( not ( = ?auto_280409 ?auto_280412 ) ) ( not ( = ?auto_280409 ?auto_280413 ) ) ( not ( = ?auto_280409 ?auto_280414 ) ) ( not ( = ?auto_280409 ?auto_280415 ) ) ( not ( = ?auto_280410 ?auto_280411 ) ) ( not ( = ?auto_280410 ?auto_280412 ) ) ( not ( = ?auto_280410 ?auto_280413 ) ) ( not ( = ?auto_280410 ?auto_280414 ) ) ( not ( = ?auto_280410 ?auto_280415 ) ) ( not ( = ?auto_280411 ?auto_280412 ) ) ( not ( = ?auto_280411 ?auto_280413 ) ) ( not ( = ?auto_280411 ?auto_280414 ) ) ( not ( = ?auto_280411 ?auto_280415 ) ) ( not ( = ?auto_280412 ?auto_280413 ) ) ( not ( = ?auto_280412 ?auto_280414 ) ) ( not ( = ?auto_280412 ?auto_280415 ) ) ( not ( = ?auto_280413 ?auto_280414 ) ) ( not ( = ?auto_280413 ?auto_280415 ) ) ( not ( = ?auto_280414 ?auto_280415 ) ) ( ON ?auto_280413 ?auto_280414 ) ( ON ?auto_280412 ?auto_280413 ) ( ON ?auto_280411 ?auto_280412 ) ( ON ?auto_280410 ?auto_280411 ) ( ON ?auto_280409 ?auto_280410 ) ( ON ?auto_280408 ?auto_280409 ) ( ON ?auto_280407 ?auto_280408 ) ( ON ?auto_280406 ?auto_280407 ) ( CLEAR ?auto_280406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280406 )
      ( MAKE-9PILE ?auto_280406 ?auto_280407 ?auto_280408 ?auto_280409 ?auto_280410 ?auto_280411 ?auto_280412 ?auto_280413 ?auto_280414 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_280425 - BLOCK
      ?auto_280426 - BLOCK
      ?auto_280427 - BLOCK
      ?auto_280428 - BLOCK
      ?auto_280429 - BLOCK
      ?auto_280430 - BLOCK
      ?auto_280431 - BLOCK
      ?auto_280432 - BLOCK
      ?auto_280433 - BLOCK
    )
    :vars
    (
      ?auto_280434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280433 ?auto_280434 ) ( not ( = ?auto_280425 ?auto_280426 ) ) ( not ( = ?auto_280425 ?auto_280427 ) ) ( not ( = ?auto_280425 ?auto_280428 ) ) ( not ( = ?auto_280425 ?auto_280429 ) ) ( not ( = ?auto_280425 ?auto_280430 ) ) ( not ( = ?auto_280425 ?auto_280431 ) ) ( not ( = ?auto_280425 ?auto_280432 ) ) ( not ( = ?auto_280425 ?auto_280433 ) ) ( not ( = ?auto_280425 ?auto_280434 ) ) ( not ( = ?auto_280426 ?auto_280427 ) ) ( not ( = ?auto_280426 ?auto_280428 ) ) ( not ( = ?auto_280426 ?auto_280429 ) ) ( not ( = ?auto_280426 ?auto_280430 ) ) ( not ( = ?auto_280426 ?auto_280431 ) ) ( not ( = ?auto_280426 ?auto_280432 ) ) ( not ( = ?auto_280426 ?auto_280433 ) ) ( not ( = ?auto_280426 ?auto_280434 ) ) ( not ( = ?auto_280427 ?auto_280428 ) ) ( not ( = ?auto_280427 ?auto_280429 ) ) ( not ( = ?auto_280427 ?auto_280430 ) ) ( not ( = ?auto_280427 ?auto_280431 ) ) ( not ( = ?auto_280427 ?auto_280432 ) ) ( not ( = ?auto_280427 ?auto_280433 ) ) ( not ( = ?auto_280427 ?auto_280434 ) ) ( not ( = ?auto_280428 ?auto_280429 ) ) ( not ( = ?auto_280428 ?auto_280430 ) ) ( not ( = ?auto_280428 ?auto_280431 ) ) ( not ( = ?auto_280428 ?auto_280432 ) ) ( not ( = ?auto_280428 ?auto_280433 ) ) ( not ( = ?auto_280428 ?auto_280434 ) ) ( not ( = ?auto_280429 ?auto_280430 ) ) ( not ( = ?auto_280429 ?auto_280431 ) ) ( not ( = ?auto_280429 ?auto_280432 ) ) ( not ( = ?auto_280429 ?auto_280433 ) ) ( not ( = ?auto_280429 ?auto_280434 ) ) ( not ( = ?auto_280430 ?auto_280431 ) ) ( not ( = ?auto_280430 ?auto_280432 ) ) ( not ( = ?auto_280430 ?auto_280433 ) ) ( not ( = ?auto_280430 ?auto_280434 ) ) ( not ( = ?auto_280431 ?auto_280432 ) ) ( not ( = ?auto_280431 ?auto_280433 ) ) ( not ( = ?auto_280431 ?auto_280434 ) ) ( not ( = ?auto_280432 ?auto_280433 ) ) ( not ( = ?auto_280432 ?auto_280434 ) ) ( not ( = ?auto_280433 ?auto_280434 ) ) ( ON ?auto_280432 ?auto_280433 ) ( ON ?auto_280431 ?auto_280432 ) ( ON ?auto_280430 ?auto_280431 ) ( ON ?auto_280429 ?auto_280430 ) ( ON ?auto_280428 ?auto_280429 ) ( ON ?auto_280427 ?auto_280428 ) ( ON ?auto_280426 ?auto_280427 ) ( ON ?auto_280425 ?auto_280426 ) ( CLEAR ?auto_280425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280425 )
      ( MAKE-9PILE ?auto_280425 ?auto_280426 ?auto_280427 ?auto_280428 ?auto_280429 ?auto_280430 ?auto_280431 ?auto_280432 ?auto_280433 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280445 - BLOCK
      ?auto_280446 - BLOCK
      ?auto_280447 - BLOCK
      ?auto_280448 - BLOCK
      ?auto_280449 - BLOCK
      ?auto_280450 - BLOCK
      ?auto_280451 - BLOCK
      ?auto_280452 - BLOCK
      ?auto_280453 - BLOCK
      ?auto_280454 - BLOCK
    )
    :vars
    (
      ?auto_280455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280453 ) ( ON ?auto_280454 ?auto_280455 ) ( CLEAR ?auto_280454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280445 ) ( ON ?auto_280446 ?auto_280445 ) ( ON ?auto_280447 ?auto_280446 ) ( ON ?auto_280448 ?auto_280447 ) ( ON ?auto_280449 ?auto_280448 ) ( ON ?auto_280450 ?auto_280449 ) ( ON ?auto_280451 ?auto_280450 ) ( ON ?auto_280452 ?auto_280451 ) ( ON ?auto_280453 ?auto_280452 ) ( not ( = ?auto_280445 ?auto_280446 ) ) ( not ( = ?auto_280445 ?auto_280447 ) ) ( not ( = ?auto_280445 ?auto_280448 ) ) ( not ( = ?auto_280445 ?auto_280449 ) ) ( not ( = ?auto_280445 ?auto_280450 ) ) ( not ( = ?auto_280445 ?auto_280451 ) ) ( not ( = ?auto_280445 ?auto_280452 ) ) ( not ( = ?auto_280445 ?auto_280453 ) ) ( not ( = ?auto_280445 ?auto_280454 ) ) ( not ( = ?auto_280445 ?auto_280455 ) ) ( not ( = ?auto_280446 ?auto_280447 ) ) ( not ( = ?auto_280446 ?auto_280448 ) ) ( not ( = ?auto_280446 ?auto_280449 ) ) ( not ( = ?auto_280446 ?auto_280450 ) ) ( not ( = ?auto_280446 ?auto_280451 ) ) ( not ( = ?auto_280446 ?auto_280452 ) ) ( not ( = ?auto_280446 ?auto_280453 ) ) ( not ( = ?auto_280446 ?auto_280454 ) ) ( not ( = ?auto_280446 ?auto_280455 ) ) ( not ( = ?auto_280447 ?auto_280448 ) ) ( not ( = ?auto_280447 ?auto_280449 ) ) ( not ( = ?auto_280447 ?auto_280450 ) ) ( not ( = ?auto_280447 ?auto_280451 ) ) ( not ( = ?auto_280447 ?auto_280452 ) ) ( not ( = ?auto_280447 ?auto_280453 ) ) ( not ( = ?auto_280447 ?auto_280454 ) ) ( not ( = ?auto_280447 ?auto_280455 ) ) ( not ( = ?auto_280448 ?auto_280449 ) ) ( not ( = ?auto_280448 ?auto_280450 ) ) ( not ( = ?auto_280448 ?auto_280451 ) ) ( not ( = ?auto_280448 ?auto_280452 ) ) ( not ( = ?auto_280448 ?auto_280453 ) ) ( not ( = ?auto_280448 ?auto_280454 ) ) ( not ( = ?auto_280448 ?auto_280455 ) ) ( not ( = ?auto_280449 ?auto_280450 ) ) ( not ( = ?auto_280449 ?auto_280451 ) ) ( not ( = ?auto_280449 ?auto_280452 ) ) ( not ( = ?auto_280449 ?auto_280453 ) ) ( not ( = ?auto_280449 ?auto_280454 ) ) ( not ( = ?auto_280449 ?auto_280455 ) ) ( not ( = ?auto_280450 ?auto_280451 ) ) ( not ( = ?auto_280450 ?auto_280452 ) ) ( not ( = ?auto_280450 ?auto_280453 ) ) ( not ( = ?auto_280450 ?auto_280454 ) ) ( not ( = ?auto_280450 ?auto_280455 ) ) ( not ( = ?auto_280451 ?auto_280452 ) ) ( not ( = ?auto_280451 ?auto_280453 ) ) ( not ( = ?auto_280451 ?auto_280454 ) ) ( not ( = ?auto_280451 ?auto_280455 ) ) ( not ( = ?auto_280452 ?auto_280453 ) ) ( not ( = ?auto_280452 ?auto_280454 ) ) ( not ( = ?auto_280452 ?auto_280455 ) ) ( not ( = ?auto_280453 ?auto_280454 ) ) ( not ( = ?auto_280453 ?auto_280455 ) ) ( not ( = ?auto_280454 ?auto_280455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280454 ?auto_280455 )
      ( !STACK ?auto_280454 ?auto_280453 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280466 - BLOCK
      ?auto_280467 - BLOCK
      ?auto_280468 - BLOCK
      ?auto_280469 - BLOCK
      ?auto_280470 - BLOCK
      ?auto_280471 - BLOCK
      ?auto_280472 - BLOCK
      ?auto_280473 - BLOCK
      ?auto_280474 - BLOCK
      ?auto_280475 - BLOCK
    )
    :vars
    (
      ?auto_280476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280474 ) ( ON ?auto_280475 ?auto_280476 ) ( CLEAR ?auto_280475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280466 ) ( ON ?auto_280467 ?auto_280466 ) ( ON ?auto_280468 ?auto_280467 ) ( ON ?auto_280469 ?auto_280468 ) ( ON ?auto_280470 ?auto_280469 ) ( ON ?auto_280471 ?auto_280470 ) ( ON ?auto_280472 ?auto_280471 ) ( ON ?auto_280473 ?auto_280472 ) ( ON ?auto_280474 ?auto_280473 ) ( not ( = ?auto_280466 ?auto_280467 ) ) ( not ( = ?auto_280466 ?auto_280468 ) ) ( not ( = ?auto_280466 ?auto_280469 ) ) ( not ( = ?auto_280466 ?auto_280470 ) ) ( not ( = ?auto_280466 ?auto_280471 ) ) ( not ( = ?auto_280466 ?auto_280472 ) ) ( not ( = ?auto_280466 ?auto_280473 ) ) ( not ( = ?auto_280466 ?auto_280474 ) ) ( not ( = ?auto_280466 ?auto_280475 ) ) ( not ( = ?auto_280466 ?auto_280476 ) ) ( not ( = ?auto_280467 ?auto_280468 ) ) ( not ( = ?auto_280467 ?auto_280469 ) ) ( not ( = ?auto_280467 ?auto_280470 ) ) ( not ( = ?auto_280467 ?auto_280471 ) ) ( not ( = ?auto_280467 ?auto_280472 ) ) ( not ( = ?auto_280467 ?auto_280473 ) ) ( not ( = ?auto_280467 ?auto_280474 ) ) ( not ( = ?auto_280467 ?auto_280475 ) ) ( not ( = ?auto_280467 ?auto_280476 ) ) ( not ( = ?auto_280468 ?auto_280469 ) ) ( not ( = ?auto_280468 ?auto_280470 ) ) ( not ( = ?auto_280468 ?auto_280471 ) ) ( not ( = ?auto_280468 ?auto_280472 ) ) ( not ( = ?auto_280468 ?auto_280473 ) ) ( not ( = ?auto_280468 ?auto_280474 ) ) ( not ( = ?auto_280468 ?auto_280475 ) ) ( not ( = ?auto_280468 ?auto_280476 ) ) ( not ( = ?auto_280469 ?auto_280470 ) ) ( not ( = ?auto_280469 ?auto_280471 ) ) ( not ( = ?auto_280469 ?auto_280472 ) ) ( not ( = ?auto_280469 ?auto_280473 ) ) ( not ( = ?auto_280469 ?auto_280474 ) ) ( not ( = ?auto_280469 ?auto_280475 ) ) ( not ( = ?auto_280469 ?auto_280476 ) ) ( not ( = ?auto_280470 ?auto_280471 ) ) ( not ( = ?auto_280470 ?auto_280472 ) ) ( not ( = ?auto_280470 ?auto_280473 ) ) ( not ( = ?auto_280470 ?auto_280474 ) ) ( not ( = ?auto_280470 ?auto_280475 ) ) ( not ( = ?auto_280470 ?auto_280476 ) ) ( not ( = ?auto_280471 ?auto_280472 ) ) ( not ( = ?auto_280471 ?auto_280473 ) ) ( not ( = ?auto_280471 ?auto_280474 ) ) ( not ( = ?auto_280471 ?auto_280475 ) ) ( not ( = ?auto_280471 ?auto_280476 ) ) ( not ( = ?auto_280472 ?auto_280473 ) ) ( not ( = ?auto_280472 ?auto_280474 ) ) ( not ( = ?auto_280472 ?auto_280475 ) ) ( not ( = ?auto_280472 ?auto_280476 ) ) ( not ( = ?auto_280473 ?auto_280474 ) ) ( not ( = ?auto_280473 ?auto_280475 ) ) ( not ( = ?auto_280473 ?auto_280476 ) ) ( not ( = ?auto_280474 ?auto_280475 ) ) ( not ( = ?auto_280474 ?auto_280476 ) ) ( not ( = ?auto_280475 ?auto_280476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280475 ?auto_280476 )
      ( !STACK ?auto_280475 ?auto_280474 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280487 - BLOCK
      ?auto_280488 - BLOCK
      ?auto_280489 - BLOCK
      ?auto_280490 - BLOCK
      ?auto_280491 - BLOCK
      ?auto_280492 - BLOCK
      ?auto_280493 - BLOCK
      ?auto_280494 - BLOCK
      ?auto_280495 - BLOCK
      ?auto_280496 - BLOCK
    )
    :vars
    (
      ?auto_280497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280496 ?auto_280497 ) ( ON-TABLE ?auto_280487 ) ( ON ?auto_280488 ?auto_280487 ) ( ON ?auto_280489 ?auto_280488 ) ( ON ?auto_280490 ?auto_280489 ) ( ON ?auto_280491 ?auto_280490 ) ( ON ?auto_280492 ?auto_280491 ) ( ON ?auto_280493 ?auto_280492 ) ( ON ?auto_280494 ?auto_280493 ) ( not ( = ?auto_280487 ?auto_280488 ) ) ( not ( = ?auto_280487 ?auto_280489 ) ) ( not ( = ?auto_280487 ?auto_280490 ) ) ( not ( = ?auto_280487 ?auto_280491 ) ) ( not ( = ?auto_280487 ?auto_280492 ) ) ( not ( = ?auto_280487 ?auto_280493 ) ) ( not ( = ?auto_280487 ?auto_280494 ) ) ( not ( = ?auto_280487 ?auto_280495 ) ) ( not ( = ?auto_280487 ?auto_280496 ) ) ( not ( = ?auto_280487 ?auto_280497 ) ) ( not ( = ?auto_280488 ?auto_280489 ) ) ( not ( = ?auto_280488 ?auto_280490 ) ) ( not ( = ?auto_280488 ?auto_280491 ) ) ( not ( = ?auto_280488 ?auto_280492 ) ) ( not ( = ?auto_280488 ?auto_280493 ) ) ( not ( = ?auto_280488 ?auto_280494 ) ) ( not ( = ?auto_280488 ?auto_280495 ) ) ( not ( = ?auto_280488 ?auto_280496 ) ) ( not ( = ?auto_280488 ?auto_280497 ) ) ( not ( = ?auto_280489 ?auto_280490 ) ) ( not ( = ?auto_280489 ?auto_280491 ) ) ( not ( = ?auto_280489 ?auto_280492 ) ) ( not ( = ?auto_280489 ?auto_280493 ) ) ( not ( = ?auto_280489 ?auto_280494 ) ) ( not ( = ?auto_280489 ?auto_280495 ) ) ( not ( = ?auto_280489 ?auto_280496 ) ) ( not ( = ?auto_280489 ?auto_280497 ) ) ( not ( = ?auto_280490 ?auto_280491 ) ) ( not ( = ?auto_280490 ?auto_280492 ) ) ( not ( = ?auto_280490 ?auto_280493 ) ) ( not ( = ?auto_280490 ?auto_280494 ) ) ( not ( = ?auto_280490 ?auto_280495 ) ) ( not ( = ?auto_280490 ?auto_280496 ) ) ( not ( = ?auto_280490 ?auto_280497 ) ) ( not ( = ?auto_280491 ?auto_280492 ) ) ( not ( = ?auto_280491 ?auto_280493 ) ) ( not ( = ?auto_280491 ?auto_280494 ) ) ( not ( = ?auto_280491 ?auto_280495 ) ) ( not ( = ?auto_280491 ?auto_280496 ) ) ( not ( = ?auto_280491 ?auto_280497 ) ) ( not ( = ?auto_280492 ?auto_280493 ) ) ( not ( = ?auto_280492 ?auto_280494 ) ) ( not ( = ?auto_280492 ?auto_280495 ) ) ( not ( = ?auto_280492 ?auto_280496 ) ) ( not ( = ?auto_280492 ?auto_280497 ) ) ( not ( = ?auto_280493 ?auto_280494 ) ) ( not ( = ?auto_280493 ?auto_280495 ) ) ( not ( = ?auto_280493 ?auto_280496 ) ) ( not ( = ?auto_280493 ?auto_280497 ) ) ( not ( = ?auto_280494 ?auto_280495 ) ) ( not ( = ?auto_280494 ?auto_280496 ) ) ( not ( = ?auto_280494 ?auto_280497 ) ) ( not ( = ?auto_280495 ?auto_280496 ) ) ( not ( = ?auto_280495 ?auto_280497 ) ) ( not ( = ?auto_280496 ?auto_280497 ) ) ( CLEAR ?auto_280494 ) ( ON ?auto_280495 ?auto_280496 ) ( CLEAR ?auto_280495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_280487 ?auto_280488 ?auto_280489 ?auto_280490 ?auto_280491 ?auto_280492 ?auto_280493 ?auto_280494 ?auto_280495 )
      ( MAKE-10PILE ?auto_280487 ?auto_280488 ?auto_280489 ?auto_280490 ?auto_280491 ?auto_280492 ?auto_280493 ?auto_280494 ?auto_280495 ?auto_280496 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280508 - BLOCK
      ?auto_280509 - BLOCK
      ?auto_280510 - BLOCK
      ?auto_280511 - BLOCK
      ?auto_280512 - BLOCK
      ?auto_280513 - BLOCK
      ?auto_280514 - BLOCK
      ?auto_280515 - BLOCK
      ?auto_280516 - BLOCK
      ?auto_280517 - BLOCK
    )
    :vars
    (
      ?auto_280518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280517 ?auto_280518 ) ( ON-TABLE ?auto_280508 ) ( ON ?auto_280509 ?auto_280508 ) ( ON ?auto_280510 ?auto_280509 ) ( ON ?auto_280511 ?auto_280510 ) ( ON ?auto_280512 ?auto_280511 ) ( ON ?auto_280513 ?auto_280512 ) ( ON ?auto_280514 ?auto_280513 ) ( ON ?auto_280515 ?auto_280514 ) ( not ( = ?auto_280508 ?auto_280509 ) ) ( not ( = ?auto_280508 ?auto_280510 ) ) ( not ( = ?auto_280508 ?auto_280511 ) ) ( not ( = ?auto_280508 ?auto_280512 ) ) ( not ( = ?auto_280508 ?auto_280513 ) ) ( not ( = ?auto_280508 ?auto_280514 ) ) ( not ( = ?auto_280508 ?auto_280515 ) ) ( not ( = ?auto_280508 ?auto_280516 ) ) ( not ( = ?auto_280508 ?auto_280517 ) ) ( not ( = ?auto_280508 ?auto_280518 ) ) ( not ( = ?auto_280509 ?auto_280510 ) ) ( not ( = ?auto_280509 ?auto_280511 ) ) ( not ( = ?auto_280509 ?auto_280512 ) ) ( not ( = ?auto_280509 ?auto_280513 ) ) ( not ( = ?auto_280509 ?auto_280514 ) ) ( not ( = ?auto_280509 ?auto_280515 ) ) ( not ( = ?auto_280509 ?auto_280516 ) ) ( not ( = ?auto_280509 ?auto_280517 ) ) ( not ( = ?auto_280509 ?auto_280518 ) ) ( not ( = ?auto_280510 ?auto_280511 ) ) ( not ( = ?auto_280510 ?auto_280512 ) ) ( not ( = ?auto_280510 ?auto_280513 ) ) ( not ( = ?auto_280510 ?auto_280514 ) ) ( not ( = ?auto_280510 ?auto_280515 ) ) ( not ( = ?auto_280510 ?auto_280516 ) ) ( not ( = ?auto_280510 ?auto_280517 ) ) ( not ( = ?auto_280510 ?auto_280518 ) ) ( not ( = ?auto_280511 ?auto_280512 ) ) ( not ( = ?auto_280511 ?auto_280513 ) ) ( not ( = ?auto_280511 ?auto_280514 ) ) ( not ( = ?auto_280511 ?auto_280515 ) ) ( not ( = ?auto_280511 ?auto_280516 ) ) ( not ( = ?auto_280511 ?auto_280517 ) ) ( not ( = ?auto_280511 ?auto_280518 ) ) ( not ( = ?auto_280512 ?auto_280513 ) ) ( not ( = ?auto_280512 ?auto_280514 ) ) ( not ( = ?auto_280512 ?auto_280515 ) ) ( not ( = ?auto_280512 ?auto_280516 ) ) ( not ( = ?auto_280512 ?auto_280517 ) ) ( not ( = ?auto_280512 ?auto_280518 ) ) ( not ( = ?auto_280513 ?auto_280514 ) ) ( not ( = ?auto_280513 ?auto_280515 ) ) ( not ( = ?auto_280513 ?auto_280516 ) ) ( not ( = ?auto_280513 ?auto_280517 ) ) ( not ( = ?auto_280513 ?auto_280518 ) ) ( not ( = ?auto_280514 ?auto_280515 ) ) ( not ( = ?auto_280514 ?auto_280516 ) ) ( not ( = ?auto_280514 ?auto_280517 ) ) ( not ( = ?auto_280514 ?auto_280518 ) ) ( not ( = ?auto_280515 ?auto_280516 ) ) ( not ( = ?auto_280515 ?auto_280517 ) ) ( not ( = ?auto_280515 ?auto_280518 ) ) ( not ( = ?auto_280516 ?auto_280517 ) ) ( not ( = ?auto_280516 ?auto_280518 ) ) ( not ( = ?auto_280517 ?auto_280518 ) ) ( CLEAR ?auto_280515 ) ( ON ?auto_280516 ?auto_280517 ) ( CLEAR ?auto_280516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_280508 ?auto_280509 ?auto_280510 ?auto_280511 ?auto_280512 ?auto_280513 ?auto_280514 ?auto_280515 ?auto_280516 )
      ( MAKE-10PILE ?auto_280508 ?auto_280509 ?auto_280510 ?auto_280511 ?auto_280512 ?auto_280513 ?auto_280514 ?auto_280515 ?auto_280516 ?auto_280517 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280529 - BLOCK
      ?auto_280530 - BLOCK
      ?auto_280531 - BLOCK
      ?auto_280532 - BLOCK
      ?auto_280533 - BLOCK
      ?auto_280534 - BLOCK
      ?auto_280535 - BLOCK
      ?auto_280536 - BLOCK
      ?auto_280537 - BLOCK
      ?auto_280538 - BLOCK
    )
    :vars
    (
      ?auto_280539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280538 ?auto_280539 ) ( ON-TABLE ?auto_280529 ) ( ON ?auto_280530 ?auto_280529 ) ( ON ?auto_280531 ?auto_280530 ) ( ON ?auto_280532 ?auto_280531 ) ( ON ?auto_280533 ?auto_280532 ) ( ON ?auto_280534 ?auto_280533 ) ( ON ?auto_280535 ?auto_280534 ) ( not ( = ?auto_280529 ?auto_280530 ) ) ( not ( = ?auto_280529 ?auto_280531 ) ) ( not ( = ?auto_280529 ?auto_280532 ) ) ( not ( = ?auto_280529 ?auto_280533 ) ) ( not ( = ?auto_280529 ?auto_280534 ) ) ( not ( = ?auto_280529 ?auto_280535 ) ) ( not ( = ?auto_280529 ?auto_280536 ) ) ( not ( = ?auto_280529 ?auto_280537 ) ) ( not ( = ?auto_280529 ?auto_280538 ) ) ( not ( = ?auto_280529 ?auto_280539 ) ) ( not ( = ?auto_280530 ?auto_280531 ) ) ( not ( = ?auto_280530 ?auto_280532 ) ) ( not ( = ?auto_280530 ?auto_280533 ) ) ( not ( = ?auto_280530 ?auto_280534 ) ) ( not ( = ?auto_280530 ?auto_280535 ) ) ( not ( = ?auto_280530 ?auto_280536 ) ) ( not ( = ?auto_280530 ?auto_280537 ) ) ( not ( = ?auto_280530 ?auto_280538 ) ) ( not ( = ?auto_280530 ?auto_280539 ) ) ( not ( = ?auto_280531 ?auto_280532 ) ) ( not ( = ?auto_280531 ?auto_280533 ) ) ( not ( = ?auto_280531 ?auto_280534 ) ) ( not ( = ?auto_280531 ?auto_280535 ) ) ( not ( = ?auto_280531 ?auto_280536 ) ) ( not ( = ?auto_280531 ?auto_280537 ) ) ( not ( = ?auto_280531 ?auto_280538 ) ) ( not ( = ?auto_280531 ?auto_280539 ) ) ( not ( = ?auto_280532 ?auto_280533 ) ) ( not ( = ?auto_280532 ?auto_280534 ) ) ( not ( = ?auto_280532 ?auto_280535 ) ) ( not ( = ?auto_280532 ?auto_280536 ) ) ( not ( = ?auto_280532 ?auto_280537 ) ) ( not ( = ?auto_280532 ?auto_280538 ) ) ( not ( = ?auto_280532 ?auto_280539 ) ) ( not ( = ?auto_280533 ?auto_280534 ) ) ( not ( = ?auto_280533 ?auto_280535 ) ) ( not ( = ?auto_280533 ?auto_280536 ) ) ( not ( = ?auto_280533 ?auto_280537 ) ) ( not ( = ?auto_280533 ?auto_280538 ) ) ( not ( = ?auto_280533 ?auto_280539 ) ) ( not ( = ?auto_280534 ?auto_280535 ) ) ( not ( = ?auto_280534 ?auto_280536 ) ) ( not ( = ?auto_280534 ?auto_280537 ) ) ( not ( = ?auto_280534 ?auto_280538 ) ) ( not ( = ?auto_280534 ?auto_280539 ) ) ( not ( = ?auto_280535 ?auto_280536 ) ) ( not ( = ?auto_280535 ?auto_280537 ) ) ( not ( = ?auto_280535 ?auto_280538 ) ) ( not ( = ?auto_280535 ?auto_280539 ) ) ( not ( = ?auto_280536 ?auto_280537 ) ) ( not ( = ?auto_280536 ?auto_280538 ) ) ( not ( = ?auto_280536 ?auto_280539 ) ) ( not ( = ?auto_280537 ?auto_280538 ) ) ( not ( = ?auto_280537 ?auto_280539 ) ) ( not ( = ?auto_280538 ?auto_280539 ) ) ( ON ?auto_280537 ?auto_280538 ) ( CLEAR ?auto_280535 ) ( ON ?auto_280536 ?auto_280537 ) ( CLEAR ?auto_280536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_280529 ?auto_280530 ?auto_280531 ?auto_280532 ?auto_280533 ?auto_280534 ?auto_280535 ?auto_280536 )
      ( MAKE-10PILE ?auto_280529 ?auto_280530 ?auto_280531 ?auto_280532 ?auto_280533 ?auto_280534 ?auto_280535 ?auto_280536 ?auto_280537 ?auto_280538 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280550 - BLOCK
      ?auto_280551 - BLOCK
      ?auto_280552 - BLOCK
      ?auto_280553 - BLOCK
      ?auto_280554 - BLOCK
      ?auto_280555 - BLOCK
      ?auto_280556 - BLOCK
      ?auto_280557 - BLOCK
      ?auto_280558 - BLOCK
      ?auto_280559 - BLOCK
    )
    :vars
    (
      ?auto_280560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280559 ?auto_280560 ) ( ON-TABLE ?auto_280550 ) ( ON ?auto_280551 ?auto_280550 ) ( ON ?auto_280552 ?auto_280551 ) ( ON ?auto_280553 ?auto_280552 ) ( ON ?auto_280554 ?auto_280553 ) ( ON ?auto_280555 ?auto_280554 ) ( ON ?auto_280556 ?auto_280555 ) ( not ( = ?auto_280550 ?auto_280551 ) ) ( not ( = ?auto_280550 ?auto_280552 ) ) ( not ( = ?auto_280550 ?auto_280553 ) ) ( not ( = ?auto_280550 ?auto_280554 ) ) ( not ( = ?auto_280550 ?auto_280555 ) ) ( not ( = ?auto_280550 ?auto_280556 ) ) ( not ( = ?auto_280550 ?auto_280557 ) ) ( not ( = ?auto_280550 ?auto_280558 ) ) ( not ( = ?auto_280550 ?auto_280559 ) ) ( not ( = ?auto_280550 ?auto_280560 ) ) ( not ( = ?auto_280551 ?auto_280552 ) ) ( not ( = ?auto_280551 ?auto_280553 ) ) ( not ( = ?auto_280551 ?auto_280554 ) ) ( not ( = ?auto_280551 ?auto_280555 ) ) ( not ( = ?auto_280551 ?auto_280556 ) ) ( not ( = ?auto_280551 ?auto_280557 ) ) ( not ( = ?auto_280551 ?auto_280558 ) ) ( not ( = ?auto_280551 ?auto_280559 ) ) ( not ( = ?auto_280551 ?auto_280560 ) ) ( not ( = ?auto_280552 ?auto_280553 ) ) ( not ( = ?auto_280552 ?auto_280554 ) ) ( not ( = ?auto_280552 ?auto_280555 ) ) ( not ( = ?auto_280552 ?auto_280556 ) ) ( not ( = ?auto_280552 ?auto_280557 ) ) ( not ( = ?auto_280552 ?auto_280558 ) ) ( not ( = ?auto_280552 ?auto_280559 ) ) ( not ( = ?auto_280552 ?auto_280560 ) ) ( not ( = ?auto_280553 ?auto_280554 ) ) ( not ( = ?auto_280553 ?auto_280555 ) ) ( not ( = ?auto_280553 ?auto_280556 ) ) ( not ( = ?auto_280553 ?auto_280557 ) ) ( not ( = ?auto_280553 ?auto_280558 ) ) ( not ( = ?auto_280553 ?auto_280559 ) ) ( not ( = ?auto_280553 ?auto_280560 ) ) ( not ( = ?auto_280554 ?auto_280555 ) ) ( not ( = ?auto_280554 ?auto_280556 ) ) ( not ( = ?auto_280554 ?auto_280557 ) ) ( not ( = ?auto_280554 ?auto_280558 ) ) ( not ( = ?auto_280554 ?auto_280559 ) ) ( not ( = ?auto_280554 ?auto_280560 ) ) ( not ( = ?auto_280555 ?auto_280556 ) ) ( not ( = ?auto_280555 ?auto_280557 ) ) ( not ( = ?auto_280555 ?auto_280558 ) ) ( not ( = ?auto_280555 ?auto_280559 ) ) ( not ( = ?auto_280555 ?auto_280560 ) ) ( not ( = ?auto_280556 ?auto_280557 ) ) ( not ( = ?auto_280556 ?auto_280558 ) ) ( not ( = ?auto_280556 ?auto_280559 ) ) ( not ( = ?auto_280556 ?auto_280560 ) ) ( not ( = ?auto_280557 ?auto_280558 ) ) ( not ( = ?auto_280557 ?auto_280559 ) ) ( not ( = ?auto_280557 ?auto_280560 ) ) ( not ( = ?auto_280558 ?auto_280559 ) ) ( not ( = ?auto_280558 ?auto_280560 ) ) ( not ( = ?auto_280559 ?auto_280560 ) ) ( ON ?auto_280558 ?auto_280559 ) ( CLEAR ?auto_280556 ) ( ON ?auto_280557 ?auto_280558 ) ( CLEAR ?auto_280557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_280550 ?auto_280551 ?auto_280552 ?auto_280553 ?auto_280554 ?auto_280555 ?auto_280556 ?auto_280557 )
      ( MAKE-10PILE ?auto_280550 ?auto_280551 ?auto_280552 ?auto_280553 ?auto_280554 ?auto_280555 ?auto_280556 ?auto_280557 ?auto_280558 ?auto_280559 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280571 - BLOCK
      ?auto_280572 - BLOCK
      ?auto_280573 - BLOCK
      ?auto_280574 - BLOCK
      ?auto_280575 - BLOCK
      ?auto_280576 - BLOCK
      ?auto_280577 - BLOCK
      ?auto_280578 - BLOCK
      ?auto_280579 - BLOCK
      ?auto_280580 - BLOCK
    )
    :vars
    (
      ?auto_280581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280580 ?auto_280581 ) ( ON-TABLE ?auto_280571 ) ( ON ?auto_280572 ?auto_280571 ) ( ON ?auto_280573 ?auto_280572 ) ( ON ?auto_280574 ?auto_280573 ) ( ON ?auto_280575 ?auto_280574 ) ( ON ?auto_280576 ?auto_280575 ) ( not ( = ?auto_280571 ?auto_280572 ) ) ( not ( = ?auto_280571 ?auto_280573 ) ) ( not ( = ?auto_280571 ?auto_280574 ) ) ( not ( = ?auto_280571 ?auto_280575 ) ) ( not ( = ?auto_280571 ?auto_280576 ) ) ( not ( = ?auto_280571 ?auto_280577 ) ) ( not ( = ?auto_280571 ?auto_280578 ) ) ( not ( = ?auto_280571 ?auto_280579 ) ) ( not ( = ?auto_280571 ?auto_280580 ) ) ( not ( = ?auto_280571 ?auto_280581 ) ) ( not ( = ?auto_280572 ?auto_280573 ) ) ( not ( = ?auto_280572 ?auto_280574 ) ) ( not ( = ?auto_280572 ?auto_280575 ) ) ( not ( = ?auto_280572 ?auto_280576 ) ) ( not ( = ?auto_280572 ?auto_280577 ) ) ( not ( = ?auto_280572 ?auto_280578 ) ) ( not ( = ?auto_280572 ?auto_280579 ) ) ( not ( = ?auto_280572 ?auto_280580 ) ) ( not ( = ?auto_280572 ?auto_280581 ) ) ( not ( = ?auto_280573 ?auto_280574 ) ) ( not ( = ?auto_280573 ?auto_280575 ) ) ( not ( = ?auto_280573 ?auto_280576 ) ) ( not ( = ?auto_280573 ?auto_280577 ) ) ( not ( = ?auto_280573 ?auto_280578 ) ) ( not ( = ?auto_280573 ?auto_280579 ) ) ( not ( = ?auto_280573 ?auto_280580 ) ) ( not ( = ?auto_280573 ?auto_280581 ) ) ( not ( = ?auto_280574 ?auto_280575 ) ) ( not ( = ?auto_280574 ?auto_280576 ) ) ( not ( = ?auto_280574 ?auto_280577 ) ) ( not ( = ?auto_280574 ?auto_280578 ) ) ( not ( = ?auto_280574 ?auto_280579 ) ) ( not ( = ?auto_280574 ?auto_280580 ) ) ( not ( = ?auto_280574 ?auto_280581 ) ) ( not ( = ?auto_280575 ?auto_280576 ) ) ( not ( = ?auto_280575 ?auto_280577 ) ) ( not ( = ?auto_280575 ?auto_280578 ) ) ( not ( = ?auto_280575 ?auto_280579 ) ) ( not ( = ?auto_280575 ?auto_280580 ) ) ( not ( = ?auto_280575 ?auto_280581 ) ) ( not ( = ?auto_280576 ?auto_280577 ) ) ( not ( = ?auto_280576 ?auto_280578 ) ) ( not ( = ?auto_280576 ?auto_280579 ) ) ( not ( = ?auto_280576 ?auto_280580 ) ) ( not ( = ?auto_280576 ?auto_280581 ) ) ( not ( = ?auto_280577 ?auto_280578 ) ) ( not ( = ?auto_280577 ?auto_280579 ) ) ( not ( = ?auto_280577 ?auto_280580 ) ) ( not ( = ?auto_280577 ?auto_280581 ) ) ( not ( = ?auto_280578 ?auto_280579 ) ) ( not ( = ?auto_280578 ?auto_280580 ) ) ( not ( = ?auto_280578 ?auto_280581 ) ) ( not ( = ?auto_280579 ?auto_280580 ) ) ( not ( = ?auto_280579 ?auto_280581 ) ) ( not ( = ?auto_280580 ?auto_280581 ) ) ( ON ?auto_280579 ?auto_280580 ) ( ON ?auto_280578 ?auto_280579 ) ( CLEAR ?auto_280576 ) ( ON ?auto_280577 ?auto_280578 ) ( CLEAR ?auto_280577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_280571 ?auto_280572 ?auto_280573 ?auto_280574 ?auto_280575 ?auto_280576 ?auto_280577 )
      ( MAKE-10PILE ?auto_280571 ?auto_280572 ?auto_280573 ?auto_280574 ?auto_280575 ?auto_280576 ?auto_280577 ?auto_280578 ?auto_280579 ?auto_280580 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280592 - BLOCK
      ?auto_280593 - BLOCK
      ?auto_280594 - BLOCK
      ?auto_280595 - BLOCK
      ?auto_280596 - BLOCK
      ?auto_280597 - BLOCK
      ?auto_280598 - BLOCK
      ?auto_280599 - BLOCK
      ?auto_280600 - BLOCK
      ?auto_280601 - BLOCK
    )
    :vars
    (
      ?auto_280602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280601 ?auto_280602 ) ( ON-TABLE ?auto_280592 ) ( ON ?auto_280593 ?auto_280592 ) ( ON ?auto_280594 ?auto_280593 ) ( ON ?auto_280595 ?auto_280594 ) ( ON ?auto_280596 ?auto_280595 ) ( ON ?auto_280597 ?auto_280596 ) ( not ( = ?auto_280592 ?auto_280593 ) ) ( not ( = ?auto_280592 ?auto_280594 ) ) ( not ( = ?auto_280592 ?auto_280595 ) ) ( not ( = ?auto_280592 ?auto_280596 ) ) ( not ( = ?auto_280592 ?auto_280597 ) ) ( not ( = ?auto_280592 ?auto_280598 ) ) ( not ( = ?auto_280592 ?auto_280599 ) ) ( not ( = ?auto_280592 ?auto_280600 ) ) ( not ( = ?auto_280592 ?auto_280601 ) ) ( not ( = ?auto_280592 ?auto_280602 ) ) ( not ( = ?auto_280593 ?auto_280594 ) ) ( not ( = ?auto_280593 ?auto_280595 ) ) ( not ( = ?auto_280593 ?auto_280596 ) ) ( not ( = ?auto_280593 ?auto_280597 ) ) ( not ( = ?auto_280593 ?auto_280598 ) ) ( not ( = ?auto_280593 ?auto_280599 ) ) ( not ( = ?auto_280593 ?auto_280600 ) ) ( not ( = ?auto_280593 ?auto_280601 ) ) ( not ( = ?auto_280593 ?auto_280602 ) ) ( not ( = ?auto_280594 ?auto_280595 ) ) ( not ( = ?auto_280594 ?auto_280596 ) ) ( not ( = ?auto_280594 ?auto_280597 ) ) ( not ( = ?auto_280594 ?auto_280598 ) ) ( not ( = ?auto_280594 ?auto_280599 ) ) ( not ( = ?auto_280594 ?auto_280600 ) ) ( not ( = ?auto_280594 ?auto_280601 ) ) ( not ( = ?auto_280594 ?auto_280602 ) ) ( not ( = ?auto_280595 ?auto_280596 ) ) ( not ( = ?auto_280595 ?auto_280597 ) ) ( not ( = ?auto_280595 ?auto_280598 ) ) ( not ( = ?auto_280595 ?auto_280599 ) ) ( not ( = ?auto_280595 ?auto_280600 ) ) ( not ( = ?auto_280595 ?auto_280601 ) ) ( not ( = ?auto_280595 ?auto_280602 ) ) ( not ( = ?auto_280596 ?auto_280597 ) ) ( not ( = ?auto_280596 ?auto_280598 ) ) ( not ( = ?auto_280596 ?auto_280599 ) ) ( not ( = ?auto_280596 ?auto_280600 ) ) ( not ( = ?auto_280596 ?auto_280601 ) ) ( not ( = ?auto_280596 ?auto_280602 ) ) ( not ( = ?auto_280597 ?auto_280598 ) ) ( not ( = ?auto_280597 ?auto_280599 ) ) ( not ( = ?auto_280597 ?auto_280600 ) ) ( not ( = ?auto_280597 ?auto_280601 ) ) ( not ( = ?auto_280597 ?auto_280602 ) ) ( not ( = ?auto_280598 ?auto_280599 ) ) ( not ( = ?auto_280598 ?auto_280600 ) ) ( not ( = ?auto_280598 ?auto_280601 ) ) ( not ( = ?auto_280598 ?auto_280602 ) ) ( not ( = ?auto_280599 ?auto_280600 ) ) ( not ( = ?auto_280599 ?auto_280601 ) ) ( not ( = ?auto_280599 ?auto_280602 ) ) ( not ( = ?auto_280600 ?auto_280601 ) ) ( not ( = ?auto_280600 ?auto_280602 ) ) ( not ( = ?auto_280601 ?auto_280602 ) ) ( ON ?auto_280600 ?auto_280601 ) ( ON ?auto_280599 ?auto_280600 ) ( CLEAR ?auto_280597 ) ( ON ?auto_280598 ?auto_280599 ) ( CLEAR ?auto_280598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_280592 ?auto_280593 ?auto_280594 ?auto_280595 ?auto_280596 ?auto_280597 ?auto_280598 )
      ( MAKE-10PILE ?auto_280592 ?auto_280593 ?auto_280594 ?auto_280595 ?auto_280596 ?auto_280597 ?auto_280598 ?auto_280599 ?auto_280600 ?auto_280601 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280613 - BLOCK
      ?auto_280614 - BLOCK
      ?auto_280615 - BLOCK
      ?auto_280616 - BLOCK
      ?auto_280617 - BLOCK
      ?auto_280618 - BLOCK
      ?auto_280619 - BLOCK
      ?auto_280620 - BLOCK
      ?auto_280621 - BLOCK
      ?auto_280622 - BLOCK
    )
    :vars
    (
      ?auto_280623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280622 ?auto_280623 ) ( ON-TABLE ?auto_280613 ) ( ON ?auto_280614 ?auto_280613 ) ( ON ?auto_280615 ?auto_280614 ) ( ON ?auto_280616 ?auto_280615 ) ( ON ?auto_280617 ?auto_280616 ) ( not ( = ?auto_280613 ?auto_280614 ) ) ( not ( = ?auto_280613 ?auto_280615 ) ) ( not ( = ?auto_280613 ?auto_280616 ) ) ( not ( = ?auto_280613 ?auto_280617 ) ) ( not ( = ?auto_280613 ?auto_280618 ) ) ( not ( = ?auto_280613 ?auto_280619 ) ) ( not ( = ?auto_280613 ?auto_280620 ) ) ( not ( = ?auto_280613 ?auto_280621 ) ) ( not ( = ?auto_280613 ?auto_280622 ) ) ( not ( = ?auto_280613 ?auto_280623 ) ) ( not ( = ?auto_280614 ?auto_280615 ) ) ( not ( = ?auto_280614 ?auto_280616 ) ) ( not ( = ?auto_280614 ?auto_280617 ) ) ( not ( = ?auto_280614 ?auto_280618 ) ) ( not ( = ?auto_280614 ?auto_280619 ) ) ( not ( = ?auto_280614 ?auto_280620 ) ) ( not ( = ?auto_280614 ?auto_280621 ) ) ( not ( = ?auto_280614 ?auto_280622 ) ) ( not ( = ?auto_280614 ?auto_280623 ) ) ( not ( = ?auto_280615 ?auto_280616 ) ) ( not ( = ?auto_280615 ?auto_280617 ) ) ( not ( = ?auto_280615 ?auto_280618 ) ) ( not ( = ?auto_280615 ?auto_280619 ) ) ( not ( = ?auto_280615 ?auto_280620 ) ) ( not ( = ?auto_280615 ?auto_280621 ) ) ( not ( = ?auto_280615 ?auto_280622 ) ) ( not ( = ?auto_280615 ?auto_280623 ) ) ( not ( = ?auto_280616 ?auto_280617 ) ) ( not ( = ?auto_280616 ?auto_280618 ) ) ( not ( = ?auto_280616 ?auto_280619 ) ) ( not ( = ?auto_280616 ?auto_280620 ) ) ( not ( = ?auto_280616 ?auto_280621 ) ) ( not ( = ?auto_280616 ?auto_280622 ) ) ( not ( = ?auto_280616 ?auto_280623 ) ) ( not ( = ?auto_280617 ?auto_280618 ) ) ( not ( = ?auto_280617 ?auto_280619 ) ) ( not ( = ?auto_280617 ?auto_280620 ) ) ( not ( = ?auto_280617 ?auto_280621 ) ) ( not ( = ?auto_280617 ?auto_280622 ) ) ( not ( = ?auto_280617 ?auto_280623 ) ) ( not ( = ?auto_280618 ?auto_280619 ) ) ( not ( = ?auto_280618 ?auto_280620 ) ) ( not ( = ?auto_280618 ?auto_280621 ) ) ( not ( = ?auto_280618 ?auto_280622 ) ) ( not ( = ?auto_280618 ?auto_280623 ) ) ( not ( = ?auto_280619 ?auto_280620 ) ) ( not ( = ?auto_280619 ?auto_280621 ) ) ( not ( = ?auto_280619 ?auto_280622 ) ) ( not ( = ?auto_280619 ?auto_280623 ) ) ( not ( = ?auto_280620 ?auto_280621 ) ) ( not ( = ?auto_280620 ?auto_280622 ) ) ( not ( = ?auto_280620 ?auto_280623 ) ) ( not ( = ?auto_280621 ?auto_280622 ) ) ( not ( = ?auto_280621 ?auto_280623 ) ) ( not ( = ?auto_280622 ?auto_280623 ) ) ( ON ?auto_280621 ?auto_280622 ) ( ON ?auto_280620 ?auto_280621 ) ( ON ?auto_280619 ?auto_280620 ) ( CLEAR ?auto_280617 ) ( ON ?auto_280618 ?auto_280619 ) ( CLEAR ?auto_280618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_280613 ?auto_280614 ?auto_280615 ?auto_280616 ?auto_280617 ?auto_280618 )
      ( MAKE-10PILE ?auto_280613 ?auto_280614 ?auto_280615 ?auto_280616 ?auto_280617 ?auto_280618 ?auto_280619 ?auto_280620 ?auto_280621 ?auto_280622 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280634 - BLOCK
      ?auto_280635 - BLOCK
      ?auto_280636 - BLOCK
      ?auto_280637 - BLOCK
      ?auto_280638 - BLOCK
      ?auto_280639 - BLOCK
      ?auto_280640 - BLOCK
      ?auto_280641 - BLOCK
      ?auto_280642 - BLOCK
      ?auto_280643 - BLOCK
    )
    :vars
    (
      ?auto_280644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280643 ?auto_280644 ) ( ON-TABLE ?auto_280634 ) ( ON ?auto_280635 ?auto_280634 ) ( ON ?auto_280636 ?auto_280635 ) ( ON ?auto_280637 ?auto_280636 ) ( ON ?auto_280638 ?auto_280637 ) ( not ( = ?auto_280634 ?auto_280635 ) ) ( not ( = ?auto_280634 ?auto_280636 ) ) ( not ( = ?auto_280634 ?auto_280637 ) ) ( not ( = ?auto_280634 ?auto_280638 ) ) ( not ( = ?auto_280634 ?auto_280639 ) ) ( not ( = ?auto_280634 ?auto_280640 ) ) ( not ( = ?auto_280634 ?auto_280641 ) ) ( not ( = ?auto_280634 ?auto_280642 ) ) ( not ( = ?auto_280634 ?auto_280643 ) ) ( not ( = ?auto_280634 ?auto_280644 ) ) ( not ( = ?auto_280635 ?auto_280636 ) ) ( not ( = ?auto_280635 ?auto_280637 ) ) ( not ( = ?auto_280635 ?auto_280638 ) ) ( not ( = ?auto_280635 ?auto_280639 ) ) ( not ( = ?auto_280635 ?auto_280640 ) ) ( not ( = ?auto_280635 ?auto_280641 ) ) ( not ( = ?auto_280635 ?auto_280642 ) ) ( not ( = ?auto_280635 ?auto_280643 ) ) ( not ( = ?auto_280635 ?auto_280644 ) ) ( not ( = ?auto_280636 ?auto_280637 ) ) ( not ( = ?auto_280636 ?auto_280638 ) ) ( not ( = ?auto_280636 ?auto_280639 ) ) ( not ( = ?auto_280636 ?auto_280640 ) ) ( not ( = ?auto_280636 ?auto_280641 ) ) ( not ( = ?auto_280636 ?auto_280642 ) ) ( not ( = ?auto_280636 ?auto_280643 ) ) ( not ( = ?auto_280636 ?auto_280644 ) ) ( not ( = ?auto_280637 ?auto_280638 ) ) ( not ( = ?auto_280637 ?auto_280639 ) ) ( not ( = ?auto_280637 ?auto_280640 ) ) ( not ( = ?auto_280637 ?auto_280641 ) ) ( not ( = ?auto_280637 ?auto_280642 ) ) ( not ( = ?auto_280637 ?auto_280643 ) ) ( not ( = ?auto_280637 ?auto_280644 ) ) ( not ( = ?auto_280638 ?auto_280639 ) ) ( not ( = ?auto_280638 ?auto_280640 ) ) ( not ( = ?auto_280638 ?auto_280641 ) ) ( not ( = ?auto_280638 ?auto_280642 ) ) ( not ( = ?auto_280638 ?auto_280643 ) ) ( not ( = ?auto_280638 ?auto_280644 ) ) ( not ( = ?auto_280639 ?auto_280640 ) ) ( not ( = ?auto_280639 ?auto_280641 ) ) ( not ( = ?auto_280639 ?auto_280642 ) ) ( not ( = ?auto_280639 ?auto_280643 ) ) ( not ( = ?auto_280639 ?auto_280644 ) ) ( not ( = ?auto_280640 ?auto_280641 ) ) ( not ( = ?auto_280640 ?auto_280642 ) ) ( not ( = ?auto_280640 ?auto_280643 ) ) ( not ( = ?auto_280640 ?auto_280644 ) ) ( not ( = ?auto_280641 ?auto_280642 ) ) ( not ( = ?auto_280641 ?auto_280643 ) ) ( not ( = ?auto_280641 ?auto_280644 ) ) ( not ( = ?auto_280642 ?auto_280643 ) ) ( not ( = ?auto_280642 ?auto_280644 ) ) ( not ( = ?auto_280643 ?auto_280644 ) ) ( ON ?auto_280642 ?auto_280643 ) ( ON ?auto_280641 ?auto_280642 ) ( ON ?auto_280640 ?auto_280641 ) ( CLEAR ?auto_280638 ) ( ON ?auto_280639 ?auto_280640 ) ( CLEAR ?auto_280639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_280634 ?auto_280635 ?auto_280636 ?auto_280637 ?auto_280638 ?auto_280639 )
      ( MAKE-10PILE ?auto_280634 ?auto_280635 ?auto_280636 ?auto_280637 ?auto_280638 ?auto_280639 ?auto_280640 ?auto_280641 ?auto_280642 ?auto_280643 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280655 - BLOCK
      ?auto_280656 - BLOCK
      ?auto_280657 - BLOCK
      ?auto_280658 - BLOCK
      ?auto_280659 - BLOCK
      ?auto_280660 - BLOCK
      ?auto_280661 - BLOCK
      ?auto_280662 - BLOCK
      ?auto_280663 - BLOCK
      ?auto_280664 - BLOCK
    )
    :vars
    (
      ?auto_280665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280664 ?auto_280665 ) ( ON-TABLE ?auto_280655 ) ( ON ?auto_280656 ?auto_280655 ) ( ON ?auto_280657 ?auto_280656 ) ( ON ?auto_280658 ?auto_280657 ) ( not ( = ?auto_280655 ?auto_280656 ) ) ( not ( = ?auto_280655 ?auto_280657 ) ) ( not ( = ?auto_280655 ?auto_280658 ) ) ( not ( = ?auto_280655 ?auto_280659 ) ) ( not ( = ?auto_280655 ?auto_280660 ) ) ( not ( = ?auto_280655 ?auto_280661 ) ) ( not ( = ?auto_280655 ?auto_280662 ) ) ( not ( = ?auto_280655 ?auto_280663 ) ) ( not ( = ?auto_280655 ?auto_280664 ) ) ( not ( = ?auto_280655 ?auto_280665 ) ) ( not ( = ?auto_280656 ?auto_280657 ) ) ( not ( = ?auto_280656 ?auto_280658 ) ) ( not ( = ?auto_280656 ?auto_280659 ) ) ( not ( = ?auto_280656 ?auto_280660 ) ) ( not ( = ?auto_280656 ?auto_280661 ) ) ( not ( = ?auto_280656 ?auto_280662 ) ) ( not ( = ?auto_280656 ?auto_280663 ) ) ( not ( = ?auto_280656 ?auto_280664 ) ) ( not ( = ?auto_280656 ?auto_280665 ) ) ( not ( = ?auto_280657 ?auto_280658 ) ) ( not ( = ?auto_280657 ?auto_280659 ) ) ( not ( = ?auto_280657 ?auto_280660 ) ) ( not ( = ?auto_280657 ?auto_280661 ) ) ( not ( = ?auto_280657 ?auto_280662 ) ) ( not ( = ?auto_280657 ?auto_280663 ) ) ( not ( = ?auto_280657 ?auto_280664 ) ) ( not ( = ?auto_280657 ?auto_280665 ) ) ( not ( = ?auto_280658 ?auto_280659 ) ) ( not ( = ?auto_280658 ?auto_280660 ) ) ( not ( = ?auto_280658 ?auto_280661 ) ) ( not ( = ?auto_280658 ?auto_280662 ) ) ( not ( = ?auto_280658 ?auto_280663 ) ) ( not ( = ?auto_280658 ?auto_280664 ) ) ( not ( = ?auto_280658 ?auto_280665 ) ) ( not ( = ?auto_280659 ?auto_280660 ) ) ( not ( = ?auto_280659 ?auto_280661 ) ) ( not ( = ?auto_280659 ?auto_280662 ) ) ( not ( = ?auto_280659 ?auto_280663 ) ) ( not ( = ?auto_280659 ?auto_280664 ) ) ( not ( = ?auto_280659 ?auto_280665 ) ) ( not ( = ?auto_280660 ?auto_280661 ) ) ( not ( = ?auto_280660 ?auto_280662 ) ) ( not ( = ?auto_280660 ?auto_280663 ) ) ( not ( = ?auto_280660 ?auto_280664 ) ) ( not ( = ?auto_280660 ?auto_280665 ) ) ( not ( = ?auto_280661 ?auto_280662 ) ) ( not ( = ?auto_280661 ?auto_280663 ) ) ( not ( = ?auto_280661 ?auto_280664 ) ) ( not ( = ?auto_280661 ?auto_280665 ) ) ( not ( = ?auto_280662 ?auto_280663 ) ) ( not ( = ?auto_280662 ?auto_280664 ) ) ( not ( = ?auto_280662 ?auto_280665 ) ) ( not ( = ?auto_280663 ?auto_280664 ) ) ( not ( = ?auto_280663 ?auto_280665 ) ) ( not ( = ?auto_280664 ?auto_280665 ) ) ( ON ?auto_280663 ?auto_280664 ) ( ON ?auto_280662 ?auto_280663 ) ( ON ?auto_280661 ?auto_280662 ) ( ON ?auto_280660 ?auto_280661 ) ( CLEAR ?auto_280658 ) ( ON ?auto_280659 ?auto_280660 ) ( CLEAR ?auto_280659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_280655 ?auto_280656 ?auto_280657 ?auto_280658 ?auto_280659 )
      ( MAKE-10PILE ?auto_280655 ?auto_280656 ?auto_280657 ?auto_280658 ?auto_280659 ?auto_280660 ?auto_280661 ?auto_280662 ?auto_280663 ?auto_280664 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280676 - BLOCK
      ?auto_280677 - BLOCK
      ?auto_280678 - BLOCK
      ?auto_280679 - BLOCK
      ?auto_280680 - BLOCK
      ?auto_280681 - BLOCK
      ?auto_280682 - BLOCK
      ?auto_280683 - BLOCK
      ?auto_280684 - BLOCK
      ?auto_280685 - BLOCK
    )
    :vars
    (
      ?auto_280686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280685 ?auto_280686 ) ( ON-TABLE ?auto_280676 ) ( ON ?auto_280677 ?auto_280676 ) ( ON ?auto_280678 ?auto_280677 ) ( ON ?auto_280679 ?auto_280678 ) ( not ( = ?auto_280676 ?auto_280677 ) ) ( not ( = ?auto_280676 ?auto_280678 ) ) ( not ( = ?auto_280676 ?auto_280679 ) ) ( not ( = ?auto_280676 ?auto_280680 ) ) ( not ( = ?auto_280676 ?auto_280681 ) ) ( not ( = ?auto_280676 ?auto_280682 ) ) ( not ( = ?auto_280676 ?auto_280683 ) ) ( not ( = ?auto_280676 ?auto_280684 ) ) ( not ( = ?auto_280676 ?auto_280685 ) ) ( not ( = ?auto_280676 ?auto_280686 ) ) ( not ( = ?auto_280677 ?auto_280678 ) ) ( not ( = ?auto_280677 ?auto_280679 ) ) ( not ( = ?auto_280677 ?auto_280680 ) ) ( not ( = ?auto_280677 ?auto_280681 ) ) ( not ( = ?auto_280677 ?auto_280682 ) ) ( not ( = ?auto_280677 ?auto_280683 ) ) ( not ( = ?auto_280677 ?auto_280684 ) ) ( not ( = ?auto_280677 ?auto_280685 ) ) ( not ( = ?auto_280677 ?auto_280686 ) ) ( not ( = ?auto_280678 ?auto_280679 ) ) ( not ( = ?auto_280678 ?auto_280680 ) ) ( not ( = ?auto_280678 ?auto_280681 ) ) ( not ( = ?auto_280678 ?auto_280682 ) ) ( not ( = ?auto_280678 ?auto_280683 ) ) ( not ( = ?auto_280678 ?auto_280684 ) ) ( not ( = ?auto_280678 ?auto_280685 ) ) ( not ( = ?auto_280678 ?auto_280686 ) ) ( not ( = ?auto_280679 ?auto_280680 ) ) ( not ( = ?auto_280679 ?auto_280681 ) ) ( not ( = ?auto_280679 ?auto_280682 ) ) ( not ( = ?auto_280679 ?auto_280683 ) ) ( not ( = ?auto_280679 ?auto_280684 ) ) ( not ( = ?auto_280679 ?auto_280685 ) ) ( not ( = ?auto_280679 ?auto_280686 ) ) ( not ( = ?auto_280680 ?auto_280681 ) ) ( not ( = ?auto_280680 ?auto_280682 ) ) ( not ( = ?auto_280680 ?auto_280683 ) ) ( not ( = ?auto_280680 ?auto_280684 ) ) ( not ( = ?auto_280680 ?auto_280685 ) ) ( not ( = ?auto_280680 ?auto_280686 ) ) ( not ( = ?auto_280681 ?auto_280682 ) ) ( not ( = ?auto_280681 ?auto_280683 ) ) ( not ( = ?auto_280681 ?auto_280684 ) ) ( not ( = ?auto_280681 ?auto_280685 ) ) ( not ( = ?auto_280681 ?auto_280686 ) ) ( not ( = ?auto_280682 ?auto_280683 ) ) ( not ( = ?auto_280682 ?auto_280684 ) ) ( not ( = ?auto_280682 ?auto_280685 ) ) ( not ( = ?auto_280682 ?auto_280686 ) ) ( not ( = ?auto_280683 ?auto_280684 ) ) ( not ( = ?auto_280683 ?auto_280685 ) ) ( not ( = ?auto_280683 ?auto_280686 ) ) ( not ( = ?auto_280684 ?auto_280685 ) ) ( not ( = ?auto_280684 ?auto_280686 ) ) ( not ( = ?auto_280685 ?auto_280686 ) ) ( ON ?auto_280684 ?auto_280685 ) ( ON ?auto_280683 ?auto_280684 ) ( ON ?auto_280682 ?auto_280683 ) ( ON ?auto_280681 ?auto_280682 ) ( CLEAR ?auto_280679 ) ( ON ?auto_280680 ?auto_280681 ) ( CLEAR ?auto_280680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_280676 ?auto_280677 ?auto_280678 ?auto_280679 ?auto_280680 )
      ( MAKE-10PILE ?auto_280676 ?auto_280677 ?auto_280678 ?auto_280679 ?auto_280680 ?auto_280681 ?auto_280682 ?auto_280683 ?auto_280684 ?auto_280685 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280697 - BLOCK
      ?auto_280698 - BLOCK
      ?auto_280699 - BLOCK
      ?auto_280700 - BLOCK
      ?auto_280701 - BLOCK
      ?auto_280702 - BLOCK
      ?auto_280703 - BLOCK
      ?auto_280704 - BLOCK
      ?auto_280705 - BLOCK
      ?auto_280706 - BLOCK
    )
    :vars
    (
      ?auto_280707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280706 ?auto_280707 ) ( ON-TABLE ?auto_280697 ) ( ON ?auto_280698 ?auto_280697 ) ( ON ?auto_280699 ?auto_280698 ) ( not ( = ?auto_280697 ?auto_280698 ) ) ( not ( = ?auto_280697 ?auto_280699 ) ) ( not ( = ?auto_280697 ?auto_280700 ) ) ( not ( = ?auto_280697 ?auto_280701 ) ) ( not ( = ?auto_280697 ?auto_280702 ) ) ( not ( = ?auto_280697 ?auto_280703 ) ) ( not ( = ?auto_280697 ?auto_280704 ) ) ( not ( = ?auto_280697 ?auto_280705 ) ) ( not ( = ?auto_280697 ?auto_280706 ) ) ( not ( = ?auto_280697 ?auto_280707 ) ) ( not ( = ?auto_280698 ?auto_280699 ) ) ( not ( = ?auto_280698 ?auto_280700 ) ) ( not ( = ?auto_280698 ?auto_280701 ) ) ( not ( = ?auto_280698 ?auto_280702 ) ) ( not ( = ?auto_280698 ?auto_280703 ) ) ( not ( = ?auto_280698 ?auto_280704 ) ) ( not ( = ?auto_280698 ?auto_280705 ) ) ( not ( = ?auto_280698 ?auto_280706 ) ) ( not ( = ?auto_280698 ?auto_280707 ) ) ( not ( = ?auto_280699 ?auto_280700 ) ) ( not ( = ?auto_280699 ?auto_280701 ) ) ( not ( = ?auto_280699 ?auto_280702 ) ) ( not ( = ?auto_280699 ?auto_280703 ) ) ( not ( = ?auto_280699 ?auto_280704 ) ) ( not ( = ?auto_280699 ?auto_280705 ) ) ( not ( = ?auto_280699 ?auto_280706 ) ) ( not ( = ?auto_280699 ?auto_280707 ) ) ( not ( = ?auto_280700 ?auto_280701 ) ) ( not ( = ?auto_280700 ?auto_280702 ) ) ( not ( = ?auto_280700 ?auto_280703 ) ) ( not ( = ?auto_280700 ?auto_280704 ) ) ( not ( = ?auto_280700 ?auto_280705 ) ) ( not ( = ?auto_280700 ?auto_280706 ) ) ( not ( = ?auto_280700 ?auto_280707 ) ) ( not ( = ?auto_280701 ?auto_280702 ) ) ( not ( = ?auto_280701 ?auto_280703 ) ) ( not ( = ?auto_280701 ?auto_280704 ) ) ( not ( = ?auto_280701 ?auto_280705 ) ) ( not ( = ?auto_280701 ?auto_280706 ) ) ( not ( = ?auto_280701 ?auto_280707 ) ) ( not ( = ?auto_280702 ?auto_280703 ) ) ( not ( = ?auto_280702 ?auto_280704 ) ) ( not ( = ?auto_280702 ?auto_280705 ) ) ( not ( = ?auto_280702 ?auto_280706 ) ) ( not ( = ?auto_280702 ?auto_280707 ) ) ( not ( = ?auto_280703 ?auto_280704 ) ) ( not ( = ?auto_280703 ?auto_280705 ) ) ( not ( = ?auto_280703 ?auto_280706 ) ) ( not ( = ?auto_280703 ?auto_280707 ) ) ( not ( = ?auto_280704 ?auto_280705 ) ) ( not ( = ?auto_280704 ?auto_280706 ) ) ( not ( = ?auto_280704 ?auto_280707 ) ) ( not ( = ?auto_280705 ?auto_280706 ) ) ( not ( = ?auto_280705 ?auto_280707 ) ) ( not ( = ?auto_280706 ?auto_280707 ) ) ( ON ?auto_280705 ?auto_280706 ) ( ON ?auto_280704 ?auto_280705 ) ( ON ?auto_280703 ?auto_280704 ) ( ON ?auto_280702 ?auto_280703 ) ( ON ?auto_280701 ?auto_280702 ) ( CLEAR ?auto_280699 ) ( ON ?auto_280700 ?auto_280701 ) ( CLEAR ?auto_280700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_280697 ?auto_280698 ?auto_280699 ?auto_280700 )
      ( MAKE-10PILE ?auto_280697 ?auto_280698 ?auto_280699 ?auto_280700 ?auto_280701 ?auto_280702 ?auto_280703 ?auto_280704 ?auto_280705 ?auto_280706 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280718 - BLOCK
      ?auto_280719 - BLOCK
      ?auto_280720 - BLOCK
      ?auto_280721 - BLOCK
      ?auto_280722 - BLOCK
      ?auto_280723 - BLOCK
      ?auto_280724 - BLOCK
      ?auto_280725 - BLOCK
      ?auto_280726 - BLOCK
      ?auto_280727 - BLOCK
    )
    :vars
    (
      ?auto_280728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280727 ?auto_280728 ) ( ON-TABLE ?auto_280718 ) ( ON ?auto_280719 ?auto_280718 ) ( ON ?auto_280720 ?auto_280719 ) ( not ( = ?auto_280718 ?auto_280719 ) ) ( not ( = ?auto_280718 ?auto_280720 ) ) ( not ( = ?auto_280718 ?auto_280721 ) ) ( not ( = ?auto_280718 ?auto_280722 ) ) ( not ( = ?auto_280718 ?auto_280723 ) ) ( not ( = ?auto_280718 ?auto_280724 ) ) ( not ( = ?auto_280718 ?auto_280725 ) ) ( not ( = ?auto_280718 ?auto_280726 ) ) ( not ( = ?auto_280718 ?auto_280727 ) ) ( not ( = ?auto_280718 ?auto_280728 ) ) ( not ( = ?auto_280719 ?auto_280720 ) ) ( not ( = ?auto_280719 ?auto_280721 ) ) ( not ( = ?auto_280719 ?auto_280722 ) ) ( not ( = ?auto_280719 ?auto_280723 ) ) ( not ( = ?auto_280719 ?auto_280724 ) ) ( not ( = ?auto_280719 ?auto_280725 ) ) ( not ( = ?auto_280719 ?auto_280726 ) ) ( not ( = ?auto_280719 ?auto_280727 ) ) ( not ( = ?auto_280719 ?auto_280728 ) ) ( not ( = ?auto_280720 ?auto_280721 ) ) ( not ( = ?auto_280720 ?auto_280722 ) ) ( not ( = ?auto_280720 ?auto_280723 ) ) ( not ( = ?auto_280720 ?auto_280724 ) ) ( not ( = ?auto_280720 ?auto_280725 ) ) ( not ( = ?auto_280720 ?auto_280726 ) ) ( not ( = ?auto_280720 ?auto_280727 ) ) ( not ( = ?auto_280720 ?auto_280728 ) ) ( not ( = ?auto_280721 ?auto_280722 ) ) ( not ( = ?auto_280721 ?auto_280723 ) ) ( not ( = ?auto_280721 ?auto_280724 ) ) ( not ( = ?auto_280721 ?auto_280725 ) ) ( not ( = ?auto_280721 ?auto_280726 ) ) ( not ( = ?auto_280721 ?auto_280727 ) ) ( not ( = ?auto_280721 ?auto_280728 ) ) ( not ( = ?auto_280722 ?auto_280723 ) ) ( not ( = ?auto_280722 ?auto_280724 ) ) ( not ( = ?auto_280722 ?auto_280725 ) ) ( not ( = ?auto_280722 ?auto_280726 ) ) ( not ( = ?auto_280722 ?auto_280727 ) ) ( not ( = ?auto_280722 ?auto_280728 ) ) ( not ( = ?auto_280723 ?auto_280724 ) ) ( not ( = ?auto_280723 ?auto_280725 ) ) ( not ( = ?auto_280723 ?auto_280726 ) ) ( not ( = ?auto_280723 ?auto_280727 ) ) ( not ( = ?auto_280723 ?auto_280728 ) ) ( not ( = ?auto_280724 ?auto_280725 ) ) ( not ( = ?auto_280724 ?auto_280726 ) ) ( not ( = ?auto_280724 ?auto_280727 ) ) ( not ( = ?auto_280724 ?auto_280728 ) ) ( not ( = ?auto_280725 ?auto_280726 ) ) ( not ( = ?auto_280725 ?auto_280727 ) ) ( not ( = ?auto_280725 ?auto_280728 ) ) ( not ( = ?auto_280726 ?auto_280727 ) ) ( not ( = ?auto_280726 ?auto_280728 ) ) ( not ( = ?auto_280727 ?auto_280728 ) ) ( ON ?auto_280726 ?auto_280727 ) ( ON ?auto_280725 ?auto_280726 ) ( ON ?auto_280724 ?auto_280725 ) ( ON ?auto_280723 ?auto_280724 ) ( ON ?auto_280722 ?auto_280723 ) ( CLEAR ?auto_280720 ) ( ON ?auto_280721 ?auto_280722 ) ( CLEAR ?auto_280721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_280718 ?auto_280719 ?auto_280720 ?auto_280721 )
      ( MAKE-10PILE ?auto_280718 ?auto_280719 ?auto_280720 ?auto_280721 ?auto_280722 ?auto_280723 ?auto_280724 ?auto_280725 ?auto_280726 ?auto_280727 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280739 - BLOCK
      ?auto_280740 - BLOCK
      ?auto_280741 - BLOCK
      ?auto_280742 - BLOCK
      ?auto_280743 - BLOCK
      ?auto_280744 - BLOCK
      ?auto_280745 - BLOCK
      ?auto_280746 - BLOCK
      ?auto_280747 - BLOCK
      ?auto_280748 - BLOCK
    )
    :vars
    (
      ?auto_280749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280748 ?auto_280749 ) ( ON-TABLE ?auto_280739 ) ( ON ?auto_280740 ?auto_280739 ) ( not ( = ?auto_280739 ?auto_280740 ) ) ( not ( = ?auto_280739 ?auto_280741 ) ) ( not ( = ?auto_280739 ?auto_280742 ) ) ( not ( = ?auto_280739 ?auto_280743 ) ) ( not ( = ?auto_280739 ?auto_280744 ) ) ( not ( = ?auto_280739 ?auto_280745 ) ) ( not ( = ?auto_280739 ?auto_280746 ) ) ( not ( = ?auto_280739 ?auto_280747 ) ) ( not ( = ?auto_280739 ?auto_280748 ) ) ( not ( = ?auto_280739 ?auto_280749 ) ) ( not ( = ?auto_280740 ?auto_280741 ) ) ( not ( = ?auto_280740 ?auto_280742 ) ) ( not ( = ?auto_280740 ?auto_280743 ) ) ( not ( = ?auto_280740 ?auto_280744 ) ) ( not ( = ?auto_280740 ?auto_280745 ) ) ( not ( = ?auto_280740 ?auto_280746 ) ) ( not ( = ?auto_280740 ?auto_280747 ) ) ( not ( = ?auto_280740 ?auto_280748 ) ) ( not ( = ?auto_280740 ?auto_280749 ) ) ( not ( = ?auto_280741 ?auto_280742 ) ) ( not ( = ?auto_280741 ?auto_280743 ) ) ( not ( = ?auto_280741 ?auto_280744 ) ) ( not ( = ?auto_280741 ?auto_280745 ) ) ( not ( = ?auto_280741 ?auto_280746 ) ) ( not ( = ?auto_280741 ?auto_280747 ) ) ( not ( = ?auto_280741 ?auto_280748 ) ) ( not ( = ?auto_280741 ?auto_280749 ) ) ( not ( = ?auto_280742 ?auto_280743 ) ) ( not ( = ?auto_280742 ?auto_280744 ) ) ( not ( = ?auto_280742 ?auto_280745 ) ) ( not ( = ?auto_280742 ?auto_280746 ) ) ( not ( = ?auto_280742 ?auto_280747 ) ) ( not ( = ?auto_280742 ?auto_280748 ) ) ( not ( = ?auto_280742 ?auto_280749 ) ) ( not ( = ?auto_280743 ?auto_280744 ) ) ( not ( = ?auto_280743 ?auto_280745 ) ) ( not ( = ?auto_280743 ?auto_280746 ) ) ( not ( = ?auto_280743 ?auto_280747 ) ) ( not ( = ?auto_280743 ?auto_280748 ) ) ( not ( = ?auto_280743 ?auto_280749 ) ) ( not ( = ?auto_280744 ?auto_280745 ) ) ( not ( = ?auto_280744 ?auto_280746 ) ) ( not ( = ?auto_280744 ?auto_280747 ) ) ( not ( = ?auto_280744 ?auto_280748 ) ) ( not ( = ?auto_280744 ?auto_280749 ) ) ( not ( = ?auto_280745 ?auto_280746 ) ) ( not ( = ?auto_280745 ?auto_280747 ) ) ( not ( = ?auto_280745 ?auto_280748 ) ) ( not ( = ?auto_280745 ?auto_280749 ) ) ( not ( = ?auto_280746 ?auto_280747 ) ) ( not ( = ?auto_280746 ?auto_280748 ) ) ( not ( = ?auto_280746 ?auto_280749 ) ) ( not ( = ?auto_280747 ?auto_280748 ) ) ( not ( = ?auto_280747 ?auto_280749 ) ) ( not ( = ?auto_280748 ?auto_280749 ) ) ( ON ?auto_280747 ?auto_280748 ) ( ON ?auto_280746 ?auto_280747 ) ( ON ?auto_280745 ?auto_280746 ) ( ON ?auto_280744 ?auto_280745 ) ( ON ?auto_280743 ?auto_280744 ) ( ON ?auto_280742 ?auto_280743 ) ( CLEAR ?auto_280740 ) ( ON ?auto_280741 ?auto_280742 ) ( CLEAR ?auto_280741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_280739 ?auto_280740 ?auto_280741 )
      ( MAKE-10PILE ?auto_280739 ?auto_280740 ?auto_280741 ?auto_280742 ?auto_280743 ?auto_280744 ?auto_280745 ?auto_280746 ?auto_280747 ?auto_280748 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280760 - BLOCK
      ?auto_280761 - BLOCK
      ?auto_280762 - BLOCK
      ?auto_280763 - BLOCK
      ?auto_280764 - BLOCK
      ?auto_280765 - BLOCK
      ?auto_280766 - BLOCK
      ?auto_280767 - BLOCK
      ?auto_280768 - BLOCK
      ?auto_280769 - BLOCK
    )
    :vars
    (
      ?auto_280770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280769 ?auto_280770 ) ( ON-TABLE ?auto_280760 ) ( ON ?auto_280761 ?auto_280760 ) ( not ( = ?auto_280760 ?auto_280761 ) ) ( not ( = ?auto_280760 ?auto_280762 ) ) ( not ( = ?auto_280760 ?auto_280763 ) ) ( not ( = ?auto_280760 ?auto_280764 ) ) ( not ( = ?auto_280760 ?auto_280765 ) ) ( not ( = ?auto_280760 ?auto_280766 ) ) ( not ( = ?auto_280760 ?auto_280767 ) ) ( not ( = ?auto_280760 ?auto_280768 ) ) ( not ( = ?auto_280760 ?auto_280769 ) ) ( not ( = ?auto_280760 ?auto_280770 ) ) ( not ( = ?auto_280761 ?auto_280762 ) ) ( not ( = ?auto_280761 ?auto_280763 ) ) ( not ( = ?auto_280761 ?auto_280764 ) ) ( not ( = ?auto_280761 ?auto_280765 ) ) ( not ( = ?auto_280761 ?auto_280766 ) ) ( not ( = ?auto_280761 ?auto_280767 ) ) ( not ( = ?auto_280761 ?auto_280768 ) ) ( not ( = ?auto_280761 ?auto_280769 ) ) ( not ( = ?auto_280761 ?auto_280770 ) ) ( not ( = ?auto_280762 ?auto_280763 ) ) ( not ( = ?auto_280762 ?auto_280764 ) ) ( not ( = ?auto_280762 ?auto_280765 ) ) ( not ( = ?auto_280762 ?auto_280766 ) ) ( not ( = ?auto_280762 ?auto_280767 ) ) ( not ( = ?auto_280762 ?auto_280768 ) ) ( not ( = ?auto_280762 ?auto_280769 ) ) ( not ( = ?auto_280762 ?auto_280770 ) ) ( not ( = ?auto_280763 ?auto_280764 ) ) ( not ( = ?auto_280763 ?auto_280765 ) ) ( not ( = ?auto_280763 ?auto_280766 ) ) ( not ( = ?auto_280763 ?auto_280767 ) ) ( not ( = ?auto_280763 ?auto_280768 ) ) ( not ( = ?auto_280763 ?auto_280769 ) ) ( not ( = ?auto_280763 ?auto_280770 ) ) ( not ( = ?auto_280764 ?auto_280765 ) ) ( not ( = ?auto_280764 ?auto_280766 ) ) ( not ( = ?auto_280764 ?auto_280767 ) ) ( not ( = ?auto_280764 ?auto_280768 ) ) ( not ( = ?auto_280764 ?auto_280769 ) ) ( not ( = ?auto_280764 ?auto_280770 ) ) ( not ( = ?auto_280765 ?auto_280766 ) ) ( not ( = ?auto_280765 ?auto_280767 ) ) ( not ( = ?auto_280765 ?auto_280768 ) ) ( not ( = ?auto_280765 ?auto_280769 ) ) ( not ( = ?auto_280765 ?auto_280770 ) ) ( not ( = ?auto_280766 ?auto_280767 ) ) ( not ( = ?auto_280766 ?auto_280768 ) ) ( not ( = ?auto_280766 ?auto_280769 ) ) ( not ( = ?auto_280766 ?auto_280770 ) ) ( not ( = ?auto_280767 ?auto_280768 ) ) ( not ( = ?auto_280767 ?auto_280769 ) ) ( not ( = ?auto_280767 ?auto_280770 ) ) ( not ( = ?auto_280768 ?auto_280769 ) ) ( not ( = ?auto_280768 ?auto_280770 ) ) ( not ( = ?auto_280769 ?auto_280770 ) ) ( ON ?auto_280768 ?auto_280769 ) ( ON ?auto_280767 ?auto_280768 ) ( ON ?auto_280766 ?auto_280767 ) ( ON ?auto_280765 ?auto_280766 ) ( ON ?auto_280764 ?auto_280765 ) ( ON ?auto_280763 ?auto_280764 ) ( CLEAR ?auto_280761 ) ( ON ?auto_280762 ?auto_280763 ) ( CLEAR ?auto_280762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_280760 ?auto_280761 ?auto_280762 )
      ( MAKE-10PILE ?auto_280760 ?auto_280761 ?auto_280762 ?auto_280763 ?auto_280764 ?auto_280765 ?auto_280766 ?auto_280767 ?auto_280768 ?auto_280769 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280781 - BLOCK
      ?auto_280782 - BLOCK
      ?auto_280783 - BLOCK
      ?auto_280784 - BLOCK
      ?auto_280785 - BLOCK
      ?auto_280786 - BLOCK
      ?auto_280787 - BLOCK
      ?auto_280788 - BLOCK
      ?auto_280789 - BLOCK
      ?auto_280790 - BLOCK
    )
    :vars
    (
      ?auto_280791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280790 ?auto_280791 ) ( ON-TABLE ?auto_280781 ) ( not ( = ?auto_280781 ?auto_280782 ) ) ( not ( = ?auto_280781 ?auto_280783 ) ) ( not ( = ?auto_280781 ?auto_280784 ) ) ( not ( = ?auto_280781 ?auto_280785 ) ) ( not ( = ?auto_280781 ?auto_280786 ) ) ( not ( = ?auto_280781 ?auto_280787 ) ) ( not ( = ?auto_280781 ?auto_280788 ) ) ( not ( = ?auto_280781 ?auto_280789 ) ) ( not ( = ?auto_280781 ?auto_280790 ) ) ( not ( = ?auto_280781 ?auto_280791 ) ) ( not ( = ?auto_280782 ?auto_280783 ) ) ( not ( = ?auto_280782 ?auto_280784 ) ) ( not ( = ?auto_280782 ?auto_280785 ) ) ( not ( = ?auto_280782 ?auto_280786 ) ) ( not ( = ?auto_280782 ?auto_280787 ) ) ( not ( = ?auto_280782 ?auto_280788 ) ) ( not ( = ?auto_280782 ?auto_280789 ) ) ( not ( = ?auto_280782 ?auto_280790 ) ) ( not ( = ?auto_280782 ?auto_280791 ) ) ( not ( = ?auto_280783 ?auto_280784 ) ) ( not ( = ?auto_280783 ?auto_280785 ) ) ( not ( = ?auto_280783 ?auto_280786 ) ) ( not ( = ?auto_280783 ?auto_280787 ) ) ( not ( = ?auto_280783 ?auto_280788 ) ) ( not ( = ?auto_280783 ?auto_280789 ) ) ( not ( = ?auto_280783 ?auto_280790 ) ) ( not ( = ?auto_280783 ?auto_280791 ) ) ( not ( = ?auto_280784 ?auto_280785 ) ) ( not ( = ?auto_280784 ?auto_280786 ) ) ( not ( = ?auto_280784 ?auto_280787 ) ) ( not ( = ?auto_280784 ?auto_280788 ) ) ( not ( = ?auto_280784 ?auto_280789 ) ) ( not ( = ?auto_280784 ?auto_280790 ) ) ( not ( = ?auto_280784 ?auto_280791 ) ) ( not ( = ?auto_280785 ?auto_280786 ) ) ( not ( = ?auto_280785 ?auto_280787 ) ) ( not ( = ?auto_280785 ?auto_280788 ) ) ( not ( = ?auto_280785 ?auto_280789 ) ) ( not ( = ?auto_280785 ?auto_280790 ) ) ( not ( = ?auto_280785 ?auto_280791 ) ) ( not ( = ?auto_280786 ?auto_280787 ) ) ( not ( = ?auto_280786 ?auto_280788 ) ) ( not ( = ?auto_280786 ?auto_280789 ) ) ( not ( = ?auto_280786 ?auto_280790 ) ) ( not ( = ?auto_280786 ?auto_280791 ) ) ( not ( = ?auto_280787 ?auto_280788 ) ) ( not ( = ?auto_280787 ?auto_280789 ) ) ( not ( = ?auto_280787 ?auto_280790 ) ) ( not ( = ?auto_280787 ?auto_280791 ) ) ( not ( = ?auto_280788 ?auto_280789 ) ) ( not ( = ?auto_280788 ?auto_280790 ) ) ( not ( = ?auto_280788 ?auto_280791 ) ) ( not ( = ?auto_280789 ?auto_280790 ) ) ( not ( = ?auto_280789 ?auto_280791 ) ) ( not ( = ?auto_280790 ?auto_280791 ) ) ( ON ?auto_280789 ?auto_280790 ) ( ON ?auto_280788 ?auto_280789 ) ( ON ?auto_280787 ?auto_280788 ) ( ON ?auto_280786 ?auto_280787 ) ( ON ?auto_280785 ?auto_280786 ) ( ON ?auto_280784 ?auto_280785 ) ( ON ?auto_280783 ?auto_280784 ) ( CLEAR ?auto_280781 ) ( ON ?auto_280782 ?auto_280783 ) ( CLEAR ?auto_280782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280781 ?auto_280782 )
      ( MAKE-10PILE ?auto_280781 ?auto_280782 ?auto_280783 ?auto_280784 ?auto_280785 ?auto_280786 ?auto_280787 ?auto_280788 ?auto_280789 ?auto_280790 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280802 - BLOCK
      ?auto_280803 - BLOCK
      ?auto_280804 - BLOCK
      ?auto_280805 - BLOCK
      ?auto_280806 - BLOCK
      ?auto_280807 - BLOCK
      ?auto_280808 - BLOCK
      ?auto_280809 - BLOCK
      ?auto_280810 - BLOCK
      ?auto_280811 - BLOCK
    )
    :vars
    (
      ?auto_280812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280811 ?auto_280812 ) ( ON-TABLE ?auto_280802 ) ( not ( = ?auto_280802 ?auto_280803 ) ) ( not ( = ?auto_280802 ?auto_280804 ) ) ( not ( = ?auto_280802 ?auto_280805 ) ) ( not ( = ?auto_280802 ?auto_280806 ) ) ( not ( = ?auto_280802 ?auto_280807 ) ) ( not ( = ?auto_280802 ?auto_280808 ) ) ( not ( = ?auto_280802 ?auto_280809 ) ) ( not ( = ?auto_280802 ?auto_280810 ) ) ( not ( = ?auto_280802 ?auto_280811 ) ) ( not ( = ?auto_280802 ?auto_280812 ) ) ( not ( = ?auto_280803 ?auto_280804 ) ) ( not ( = ?auto_280803 ?auto_280805 ) ) ( not ( = ?auto_280803 ?auto_280806 ) ) ( not ( = ?auto_280803 ?auto_280807 ) ) ( not ( = ?auto_280803 ?auto_280808 ) ) ( not ( = ?auto_280803 ?auto_280809 ) ) ( not ( = ?auto_280803 ?auto_280810 ) ) ( not ( = ?auto_280803 ?auto_280811 ) ) ( not ( = ?auto_280803 ?auto_280812 ) ) ( not ( = ?auto_280804 ?auto_280805 ) ) ( not ( = ?auto_280804 ?auto_280806 ) ) ( not ( = ?auto_280804 ?auto_280807 ) ) ( not ( = ?auto_280804 ?auto_280808 ) ) ( not ( = ?auto_280804 ?auto_280809 ) ) ( not ( = ?auto_280804 ?auto_280810 ) ) ( not ( = ?auto_280804 ?auto_280811 ) ) ( not ( = ?auto_280804 ?auto_280812 ) ) ( not ( = ?auto_280805 ?auto_280806 ) ) ( not ( = ?auto_280805 ?auto_280807 ) ) ( not ( = ?auto_280805 ?auto_280808 ) ) ( not ( = ?auto_280805 ?auto_280809 ) ) ( not ( = ?auto_280805 ?auto_280810 ) ) ( not ( = ?auto_280805 ?auto_280811 ) ) ( not ( = ?auto_280805 ?auto_280812 ) ) ( not ( = ?auto_280806 ?auto_280807 ) ) ( not ( = ?auto_280806 ?auto_280808 ) ) ( not ( = ?auto_280806 ?auto_280809 ) ) ( not ( = ?auto_280806 ?auto_280810 ) ) ( not ( = ?auto_280806 ?auto_280811 ) ) ( not ( = ?auto_280806 ?auto_280812 ) ) ( not ( = ?auto_280807 ?auto_280808 ) ) ( not ( = ?auto_280807 ?auto_280809 ) ) ( not ( = ?auto_280807 ?auto_280810 ) ) ( not ( = ?auto_280807 ?auto_280811 ) ) ( not ( = ?auto_280807 ?auto_280812 ) ) ( not ( = ?auto_280808 ?auto_280809 ) ) ( not ( = ?auto_280808 ?auto_280810 ) ) ( not ( = ?auto_280808 ?auto_280811 ) ) ( not ( = ?auto_280808 ?auto_280812 ) ) ( not ( = ?auto_280809 ?auto_280810 ) ) ( not ( = ?auto_280809 ?auto_280811 ) ) ( not ( = ?auto_280809 ?auto_280812 ) ) ( not ( = ?auto_280810 ?auto_280811 ) ) ( not ( = ?auto_280810 ?auto_280812 ) ) ( not ( = ?auto_280811 ?auto_280812 ) ) ( ON ?auto_280810 ?auto_280811 ) ( ON ?auto_280809 ?auto_280810 ) ( ON ?auto_280808 ?auto_280809 ) ( ON ?auto_280807 ?auto_280808 ) ( ON ?auto_280806 ?auto_280807 ) ( ON ?auto_280805 ?auto_280806 ) ( ON ?auto_280804 ?auto_280805 ) ( CLEAR ?auto_280802 ) ( ON ?auto_280803 ?auto_280804 ) ( CLEAR ?auto_280803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_280802 ?auto_280803 )
      ( MAKE-10PILE ?auto_280802 ?auto_280803 ?auto_280804 ?auto_280805 ?auto_280806 ?auto_280807 ?auto_280808 ?auto_280809 ?auto_280810 ?auto_280811 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280823 - BLOCK
      ?auto_280824 - BLOCK
      ?auto_280825 - BLOCK
      ?auto_280826 - BLOCK
      ?auto_280827 - BLOCK
      ?auto_280828 - BLOCK
      ?auto_280829 - BLOCK
      ?auto_280830 - BLOCK
      ?auto_280831 - BLOCK
      ?auto_280832 - BLOCK
    )
    :vars
    (
      ?auto_280833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280832 ?auto_280833 ) ( not ( = ?auto_280823 ?auto_280824 ) ) ( not ( = ?auto_280823 ?auto_280825 ) ) ( not ( = ?auto_280823 ?auto_280826 ) ) ( not ( = ?auto_280823 ?auto_280827 ) ) ( not ( = ?auto_280823 ?auto_280828 ) ) ( not ( = ?auto_280823 ?auto_280829 ) ) ( not ( = ?auto_280823 ?auto_280830 ) ) ( not ( = ?auto_280823 ?auto_280831 ) ) ( not ( = ?auto_280823 ?auto_280832 ) ) ( not ( = ?auto_280823 ?auto_280833 ) ) ( not ( = ?auto_280824 ?auto_280825 ) ) ( not ( = ?auto_280824 ?auto_280826 ) ) ( not ( = ?auto_280824 ?auto_280827 ) ) ( not ( = ?auto_280824 ?auto_280828 ) ) ( not ( = ?auto_280824 ?auto_280829 ) ) ( not ( = ?auto_280824 ?auto_280830 ) ) ( not ( = ?auto_280824 ?auto_280831 ) ) ( not ( = ?auto_280824 ?auto_280832 ) ) ( not ( = ?auto_280824 ?auto_280833 ) ) ( not ( = ?auto_280825 ?auto_280826 ) ) ( not ( = ?auto_280825 ?auto_280827 ) ) ( not ( = ?auto_280825 ?auto_280828 ) ) ( not ( = ?auto_280825 ?auto_280829 ) ) ( not ( = ?auto_280825 ?auto_280830 ) ) ( not ( = ?auto_280825 ?auto_280831 ) ) ( not ( = ?auto_280825 ?auto_280832 ) ) ( not ( = ?auto_280825 ?auto_280833 ) ) ( not ( = ?auto_280826 ?auto_280827 ) ) ( not ( = ?auto_280826 ?auto_280828 ) ) ( not ( = ?auto_280826 ?auto_280829 ) ) ( not ( = ?auto_280826 ?auto_280830 ) ) ( not ( = ?auto_280826 ?auto_280831 ) ) ( not ( = ?auto_280826 ?auto_280832 ) ) ( not ( = ?auto_280826 ?auto_280833 ) ) ( not ( = ?auto_280827 ?auto_280828 ) ) ( not ( = ?auto_280827 ?auto_280829 ) ) ( not ( = ?auto_280827 ?auto_280830 ) ) ( not ( = ?auto_280827 ?auto_280831 ) ) ( not ( = ?auto_280827 ?auto_280832 ) ) ( not ( = ?auto_280827 ?auto_280833 ) ) ( not ( = ?auto_280828 ?auto_280829 ) ) ( not ( = ?auto_280828 ?auto_280830 ) ) ( not ( = ?auto_280828 ?auto_280831 ) ) ( not ( = ?auto_280828 ?auto_280832 ) ) ( not ( = ?auto_280828 ?auto_280833 ) ) ( not ( = ?auto_280829 ?auto_280830 ) ) ( not ( = ?auto_280829 ?auto_280831 ) ) ( not ( = ?auto_280829 ?auto_280832 ) ) ( not ( = ?auto_280829 ?auto_280833 ) ) ( not ( = ?auto_280830 ?auto_280831 ) ) ( not ( = ?auto_280830 ?auto_280832 ) ) ( not ( = ?auto_280830 ?auto_280833 ) ) ( not ( = ?auto_280831 ?auto_280832 ) ) ( not ( = ?auto_280831 ?auto_280833 ) ) ( not ( = ?auto_280832 ?auto_280833 ) ) ( ON ?auto_280831 ?auto_280832 ) ( ON ?auto_280830 ?auto_280831 ) ( ON ?auto_280829 ?auto_280830 ) ( ON ?auto_280828 ?auto_280829 ) ( ON ?auto_280827 ?auto_280828 ) ( ON ?auto_280826 ?auto_280827 ) ( ON ?auto_280825 ?auto_280826 ) ( ON ?auto_280824 ?auto_280825 ) ( ON ?auto_280823 ?auto_280824 ) ( CLEAR ?auto_280823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280823 )
      ( MAKE-10PILE ?auto_280823 ?auto_280824 ?auto_280825 ?auto_280826 ?auto_280827 ?auto_280828 ?auto_280829 ?auto_280830 ?auto_280831 ?auto_280832 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_280844 - BLOCK
      ?auto_280845 - BLOCK
      ?auto_280846 - BLOCK
      ?auto_280847 - BLOCK
      ?auto_280848 - BLOCK
      ?auto_280849 - BLOCK
      ?auto_280850 - BLOCK
      ?auto_280851 - BLOCK
      ?auto_280852 - BLOCK
      ?auto_280853 - BLOCK
    )
    :vars
    (
      ?auto_280854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280853 ?auto_280854 ) ( not ( = ?auto_280844 ?auto_280845 ) ) ( not ( = ?auto_280844 ?auto_280846 ) ) ( not ( = ?auto_280844 ?auto_280847 ) ) ( not ( = ?auto_280844 ?auto_280848 ) ) ( not ( = ?auto_280844 ?auto_280849 ) ) ( not ( = ?auto_280844 ?auto_280850 ) ) ( not ( = ?auto_280844 ?auto_280851 ) ) ( not ( = ?auto_280844 ?auto_280852 ) ) ( not ( = ?auto_280844 ?auto_280853 ) ) ( not ( = ?auto_280844 ?auto_280854 ) ) ( not ( = ?auto_280845 ?auto_280846 ) ) ( not ( = ?auto_280845 ?auto_280847 ) ) ( not ( = ?auto_280845 ?auto_280848 ) ) ( not ( = ?auto_280845 ?auto_280849 ) ) ( not ( = ?auto_280845 ?auto_280850 ) ) ( not ( = ?auto_280845 ?auto_280851 ) ) ( not ( = ?auto_280845 ?auto_280852 ) ) ( not ( = ?auto_280845 ?auto_280853 ) ) ( not ( = ?auto_280845 ?auto_280854 ) ) ( not ( = ?auto_280846 ?auto_280847 ) ) ( not ( = ?auto_280846 ?auto_280848 ) ) ( not ( = ?auto_280846 ?auto_280849 ) ) ( not ( = ?auto_280846 ?auto_280850 ) ) ( not ( = ?auto_280846 ?auto_280851 ) ) ( not ( = ?auto_280846 ?auto_280852 ) ) ( not ( = ?auto_280846 ?auto_280853 ) ) ( not ( = ?auto_280846 ?auto_280854 ) ) ( not ( = ?auto_280847 ?auto_280848 ) ) ( not ( = ?auto_280847 ?auto_280849 ) ) ( not ( = ?auto_280847 ?auto_280850 ) ) ( not ( = ?auto_280847 ?auto_280851 ) ) ( not ( = ?auto_280847 ?auto_280852 ) ) ( not ( = ?auto_280847 ?auto_280853 ) ) ( not ( = ?auto_280847 ?auto_280854 ) ) ( not ( = ?auto_280848 ?auto_280849 ) ) ( not ( = ?auto_280848 ?auto_280850 ) ) ( not ( = ?auto_280848 ?auto_280851 ) ) ( not ( = ?auto_280848 ?auto_280852 ) ) ( not ( = ?auto_280848 ?auto_280853 ) ) ( not ( = ?auto_280848 ?auto_280854 ) ) ( not ( = ?auto_280849 ?auto_280850 ) ) ( not ( = ?auto_280849 ?auto_280851 ) ) ( not ( = ?auto_280849 ?auto_280852 ) ) ( not ( = ?auto_280849 ?auto_280853 ) ) ( not ( = ?auto_280849 ?auto_280854 ) ) ( not ( = ?auto_280850 ?auto_280851 ) ) ( not ( = ?auto_280850 ?auto_280852 ) ) ( not ( = ?auto_280850 ?auto_280853 ) ) ( not ( = ?auto_280850 ?auto_280854 ) ) ( not ( = ?auto_280851 ?auto_280852 ) ) ( not ( = ?auto_280851 ?auto_280853 ) ) ( not ( = ?auto_280851 ?auto_280854 ) ) ( not ( = ?auto_280852 ?auto_280853 ) ) ( not ( = ?auto_280852 ?auto_280854 ) ) ( not ( = ?auto_280853 ?auto_280854 ) ) ( ON ?auto_280852 ?auto_280853 ) ( ON ?auto_280851 ?auto_280852 ) ( ON ?auto_280850 ?auto_280851 ) ( ON ?auto_280849 ?auto_280850 ) ( ON ?auto_280848 ?auto_280849 ) ( ON ?auto_280847 ?auto_280848 ) ( ON ?auto_280846 ?auto_280847 ) ( ON ?auto_280845 ?auto_280846 ) ( ON ?auto_280844 ?auto_280845 ) ( CLEAR ?auto_280844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_280844 )
      ( MAKE-10PILE ?auto_280844 ?auto_280845 ?auto_280846 ?auto_280847 ?auto_280848 ?auto_280849 ?auto_280850 ?auto_280851 ?auto_280852 ?auto_280853 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280866 - BLOCK
      ?auto_280867 - BLOCK
      ?auto_280868 - BLOCK
      ?auto_280869 - BLOCK
      ?auto_280870 - BLOCK
      ?auto_280871 - BLOCK
      ?auto_280872 - BLOCK
      ?auto_280873 - BLOCK
      ?auto_280874 - BLOCK
      ?auto_280875 - BLOCK
      ?auto_280876 - BLOCK
    )
    :vars
    (
      ?auto_280877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280875 ) ( ON ?auto_280876 ?auto_280877 ) ( CLEAR ?auto_280876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280866 ) ( ON ?auto_280867 ?auto_280866 ) ( ON ?auto_280868 ?auto_280867 ) ( ON ?auto_280869 ?auto_280868 ) ( ON ?auto_280870 ?auto_280869 ) ( ON ?auto_280871 ?auto_280870 ) ( ON ?auto_280872 ?auto_280871 ) ( ON ?auto_280873 ?auto_280872 ) ( ON ?auto_280874 ?auto_280873 ) ( ON ?auto_280875 ?auto_280874 ) ( not ( = ?auto_280866 ?auto_280867 ) ) ( not ( = ?auto_280866 ?auto_280868 ) ) ( not ( = ?auto_280866 ?auto_280869 ) ) ( not ( = ?auto_280866 ?auto_280870 ) ) ( not ( = ?auto_280866 ?auto_280871 ) ) ( not ( = ?auto_280866 ?auto_280872 ) ) ( not ( = ?auto_280866 ?auto_280873 ) ) ( not ( = ?auto_280866 ?auto_280874 ) ) ( not ( = ?auto_280866 ?auto_280875 ) ) ( not ( = ?auto_280866 ?auto_280876 ) ) ( not ( = ?auto_280866 ?auto_280877 ) ) ( not ( = ?auto_280867 ?auto_280868 ) ) ( not ( = ?auto_280867 ?auto_280869 ) ) ( not ( = ?auto_280867 ?auto_280870 ) ) ( not ( = ?auto_280867 ?auto_280871 ) ) ( not ( = ?auto_280867 ?auto_280872 ) ) ( not ( = ?auto_280867 ?auto_280873 ) ) ( not ( = ?auto_280867 ?auto_280874 ) ) ( not ( = ?auto_280867 ?auto_280875 ) ) ( not ( = ?auto_280867 ?auto_280876 ) ) ( not ( = ?auto_280867 ?auto_280877 ) ) ( not ( = ?auto_280868 ?auto_280869 ) ) ( not ( = ?auto_280868 ?auto_280870 ) ) ( not ( = ?auto_280868 ?auto_280871 ) ) ( not ( = ?auto_280868 ?auto_280872 ) ) ( not ( = ?auto_280868 ?auto_280873 ) ) ( not ( = ?auto_280868 ?auto_280874 ) ) ( not ( = ?auto_280868 ?auto_280875 ) ) ( not ( = ?auto_280868 ?auto_280876 ) ) ( not ( = ?auto_280868 ?auto_280877 ) ) ( not ( = ?auto_280869 ?auto_280870 ) ) ( not ( = ?auto_280869 ?auto_280871 ) ) ( not ( = ?auto_280869 ?auto_280872 ) ) ( not ( = ?auto_280869 ?auto_280873 ) ) ( not ( = ?auto_280869 ?auto_280874 ) ) ( not ( = ?auto_280869 ?auto_280875 ) ) ( not ( = ?auto_280869 ?auto_280876 ) ) ( not ( = ?auto_280869 ?auto_280877 ) ) ( not ( = ?auto_280870 ?auto_280871 ) ) ( not ( = ?auto_280870 ?auto_280872 ) ) ( not ( = ?auto_280870 ?auto_280873 ) ) ( not ( = ?auto_280870 ?auto_280874 ) ) ( not ( = ?auto_280870 ?auto_280875 ) ) ( not ( = ?auto_280870 ?auto_280876 ) ) ( not ( = ?auto_280870 ?auto_280877 ) ) ( not ( = ?auto_280871 ?auto_280872 ) ) ( not ( = ?auto_280871 ?auto_280873 ) ) ( not ( = ?auto_280871 ?auto_280874 ) ) ( not ( = ?auto_280871 ?auto_280875 ) ) ( not ( = ?auto_280871 ?auto_280876 ) ) ( not ( = ?auto_280871 ?auto_280877 ) ) ( not ( = ?auto_280872 ?auto_280873 ) ) ( not ( = ?auto_280872 ?auto_280874 ) ) ( not ( = ?auto_280872 ?auto_280875 ) ) ( not ( = ?auto_280872 ?auto_280876 ) ) ( not ( = ?auto_280872 ?auto_280877 ) ) ( not ( = ?auto_280873 ?auto_280874 ) ) ( not ( = ?auto_280873 ?auto_280875 ) ) ( not ( = ?auto_280873 ?auto_280876 ) ) ( not ( = ?auto_280873 ?auto_280877 ) ) ( not ( = ?auto_280874 ?auto_280875 ) ) ( not ( = ?auto_280874 ?auto_280876 ) ) ( not ( = ?auto_280874 ?auto_280877 ) ) ( not ( = ?auto_280875 ?auto_280876 ) ) ( not ( = ?auto_280875 ?auto_280877 ) ) ( not ( = ?auto_280876 ?auto_280877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280876 ?auto_280877 )
      ( !STACK ?auto_280876 ?auto_280875 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280889 - BLOCK
      ?auto_280890 - BLOCK
      ?auto_280891 - BLOCK
      ?auto_280892 - BLOCK
      ?auto_280893 - BLOCK
      ?auto_280894 - BLOCK
      ?auto_280895 - BLOCK
      ?auto_280896 - BLOCK
      ?auto_280897 - BLOCK
      ?auto_280898 - BLOCK
      ?auto_280899 - BLOCK
    )
    :vars
    (
      ?auto_280900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_280898 ) ( ON ?auto_280899 ?auto_280900 ) ( CLEAR ?auto_280899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_280889 ) ( ON ?auto_280890 ?auto_280889 ) ( ON ?auto_280891 ?auto_280890 ) ( ON ?auto_280892 ?auto_280891 ) ( ON ?auto_280893 ?auto_280892 ) ( ON ?auto_280894 ?auto_280893 ) ( ON ?auto_280895 ?auto_280894 ) ( ON ?auto_280896 ?auto_280895 ) ( ON ?auto_280897 ?auto_280896 ) ( ON ?auto_280898 ?auto_280897 ) ( not ( = ?auto_280889 ?auto_280890 ) ) ( not ( = ?auto_280889 ?auto_280891 ) ) ( not ( = ?auto_280889 ?auto_280892 ) ) ( not ( = ?auto_280889 ?auto_280893 ) ) ( not ( = ?auto_280889 ?auto_280894 ) ) ( not ( = ?auto_280889 ?auto_280895 ) ) ( not ( = ?auto_280889 ?auto_280896 ) ) ( not ( = ?auto_280889 ?auto_280897 ) ) ( not ( = ?auto_280889 ?auto_280898 ) ) ( not ( = ?auto_280889 ?auto_280899 ) ) ( not ( = ?auto_280889 ?auto_280900 ) ) ( not ( = ?auto_280890 ?auto_280891 ) ) ( not ( = ?auto_280890 ?auto_280892 ) ) ( not ( = ?auto_280890 ?auto_280893 ) ) ( not ( = ?auto_280890 ?auto_280894 ) ) ( not ( = ?auto_280890 ?auto_280895 ) ) ( not ( = ?auto_280890 ?auto_280896 ) ) ( not ( = ?auto_280890 ?auto_280897 ) ) ( not ( = ?auto_280890 ?auto_280898 ) ) ( not ( = ?auto_280890 ?auto_280899 ) ) ( not ( = ?auto_280890 ?auto_280900 ) ) ( not ( = ?auto_280891 ?auto_280892 ) ) ( not ( = ?auto_280891 ?auto_280893 ) ) ( not ( = ?auto_280891 ?auto_280894 ) ) ( not ( = ?auto_280891 ?auto_280895 ) ) ( not ( = ?auto_280891 ?auto_280896 ) ) ( not ( = ?auto_280891 ?auto_280897 ) ) ( not ( = ?auto_280891 ?auto_280898 ) ) ( not ( = ?auto_280891 ?auto_280899 ) ) ( not ( = ?auto_280891 ?auto_280900 ) ) ( not ( = ?auto_280892 ?auto_280893 ) ) ( not ( = ?auto_280892 ?auto_280894 ) ) ( not ( = ?auto_280892 ?auto_280895 ) ) ( not ( = ?auto_280892 ?auto_280896 ) ) ( not ( = ?auto_280892 ?auto_280897 ) ) ( not ( = ?auto_280892 ?auto_280898 ) ) ( not ( = ?auto_280892 ?auto_280899 ) ) ( not ( = ?auto_280892 ?auto_280900 ) ) ( not ( = ?auto_280893 ?auto_280894 ) ) ( not ( = ?auto_280893 ?auto_280895 ) ) ( not ( = ?auto_280893 ?auto_280896 ) ) ( not ( = ?auto_280893 ?auto_280897 ) ) ( not ( = ?auto_280893 ?auto_280898 ) ) ( not ( = ?auto_280893 ?auto_280899 ) ) ( not ( = ?auto_280893 ?auto_280900 ) ) ( not ( = ?auto_280894 ?auto_280895 ) ) ( not ( = ?auto_280894 ?auto_280896 ) ) ( not ( = ?auto_280894 ?auto_280897 ) ) ( not ( = ?auto_280894 ?auto_280898 ) ) ( not ( = ?auto_280894 ?auto_280899 ) ) ( not ( = ?auto_280894 ?auto_280900 ) ) ( not ( = ?auto_280895 ?auto_280896 ) ) ( not ( = ?auto_280895 ?auto_280897 ) ) ( not ( = ?auto_280895 ?auto_280898 ) ) ( not ( = ?auto_280895 ?auto_280899 ) ) ( not ( = ?auto_280895 ?auto_280900 ) ) ( not ( = ?auto_280896 ?auto_280897 ) ) ( not ( = ?auto_280896 ?auto_280898 ) ) ( not ( = ?auto_280896 ?auto_280899 ) ) ( not ( = ?auto_280896 ?auto_280900 ) ) ( not ( = ?auto_280897 ?auto_280898 ) ) ( not ( = ?auto_280897 ?auto_280899 ) ) ( not ( = ?auto_280897 ?auto_280900 ) ) ( not ( = ?auto_280898 ?auto_280899 ) ) ( not ( = ?auto_280898 ?auto_280900 ) ) ( not ( = ?auto_280899 ?auto_280900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_280899 ?auto_280900 )
      ( !STACK ?auto_280899 ?auto_280898 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280912 - BLOCK
      ?auto_280913 - BLOCK
      ?auto_280914 - BLOCK
      ?auto_280915 - BLOCK
      ?auto_280916 - BLOCK
      ?auto_280917 - BLOCK
      ?auto_280918 - BLOCK
      ?auto_280919 - BLOCK
      ?auto_280920 - BLOCK
      ?auto_280921 - BLOCK
      ?auto_280922 - BLOCK
    )
    :vars
    (
      ?auto_280923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280922 ?auto_280923 ) ( ON-TABLE ?auto_280912 ) ( ON ?auto_280913 ?auto_280912 ) ( ON ?auto_280914 ?auto_280913 ) ( ON ?auto_280915 ?auto_280914 ) ( ON ?auto_280916 ?auto_280915 ) ( ON ?auto_280917 ?auto_280916 ) ( ON ?auto_280918 ?auto_280917 ) ( ON ?auto_280919 ?auto_280918 ) ( ON ?auto_280920 ?auto_280919 ) ( not ( = ?auto_280912 ?auto_280913 ) ) ( not ( = ?auto_280912 ?auto_280914 ) ) ( not ( = ?auto_280912 ?auto_280915 ) ) ( not ( = ?auto_280912 ?auto_280916 ) ) ( not ( = ?auto_280912 ?auto_280917 ) ) ( not ( = ?auto_280912 ?auto_280918 ) ) ( not ( = ?auto_280912 ?auto_280919 ) ) ( not ( = ?auto_280912 ?auto_280920 ) ) ( not ( = ?auto_280912 ?auto_280921 ) ) ( not ( = ?auto_280912 ?auto_280922 ) ) ( not ( = ?auto_280912 ?auto_280923 ) ) ( not ( = ?auto_280913 ?auto_280914 ) ) ( not ( = ?auto_280913 ?auto_280915 ) ) ( not ( = ?auto_280913 ?auto_280916 ) ) ( not ( = ?auto_280913 ?auto_280917 ) ) ( not ( = ?auto_280913 ?auto_280918 ) ) ( not ( = ?auto_280913 ?auto_280919 ) ) ( not ( = ?auto_280913 ?auto_280920 ) ) ( not ( = ?auto_280913 ?auto_280921 ) ) ( not ( = ?auto_280913 ?auto_280922 ) ) ( not ( = ?auto_280913 ?auto_280923 ) ) ( not ( = ?auto_280914 ?auto_280915 ) ) ( not ( = ?auto_280914 ?auto_280916 ) ) ( not ( = ?auto_280914 ?auto_280917 ) ) ( not ( = ?auto_280914 ?auto_280918 ) ) ( not ( = ?auto_280914 ?auto_280919 ) ) ( not ( = ?auto_280914 ?auto_280920 ) ) ( not ( = ?auto_280914 ?auto_280921 ) ) ( not ( = ?auto_280914 ?auto_280922 ) ) ( not ( = ?auto_280914 ?auto_280923 ) ) ( not ( = ?auto_280915 ?auto_280916 ) ) ( not ( = ?auto_280915 ?auto_280917 ) ) ( not ( = ?auto_280915 ?auto_280918 ) ) ( not ( = ?auto_280915 ?auto_280919 ) ) ( not ( = ?auto_280915 ?auto_280920 ) ) ( not ( = ?auto_280915 ?auto_280921 ) ) ( not ( = ?auto_280915 ?auto_280922 ) ) ( not ( = ?auto_280915 ?auto_280923 ) ) ( not ( = ?auto_280916 ?auto_280917 ) ) ( not ( = ?auto_280916 ?auto_280918 ) ) ( not ( = ?auto_280916 ?auto_280919 ) ) ( not ( = ?auto_280916 ?auto_280920 ) ) ( not ( = ?auto_280916 ?auto_280921 ) ) ( not ( = ?auto_280916 ?auto_280922 ) ) ( not ( = ?auto_280916 ?auto_280923 ) ) ( not ( = ?auto_280917 ?auto_280918 ) ) ( not ( = ?auto_280917 ?auto_280919 ) ) ( not ( = ?auto_280917 ?auto_280920 ) ) ( not ( = ?auto_280917 ?auto_280921 ) ) ( not ( = ?auto_280917 ?auto_280922 ) ) ( not ( = ?auto_280917 ?auto_280923 ) ) ( not ( = ?auto_280918 ?auto_280919 ) ) ( not ( = ?auto_280918 ?auto_280920 ) ) ( not ( = ?auto_280918 ?auto_280921 ) ) ( not ( = ?auto_280918 ?auto_280922 ) ) ( not ( = ?auto_280918 ?auto_280923 ) ) ( not ( = ?auto_280919 ?auto_280920 ) ) ( not ( = ?auto_280919 ?auto_280921 ) ) ( not ( = ?auto_280919 ?auto_280922 ) ) ( not ( = ?auto_280919 ?auto_280923 ) ) ( not ( = ?auto_280920 ?auto_280921 ) ) ( not ( = ?auto_280920 ?auto_280922 ) ) ( not ( = ?auto_280920 ?auto_280923 ) ) ( not ( = ?auto_280921 ?auto_280922 ) ) ( not ( = ?auto_280921 ?auto_280923 ) ) ( not ( = ?auto_280922 ?auto_280923 ) ) ( CLEAR ?auto_280920 ) ( ON ?auto_280921 ?auto_280922 ) ( CLEAR ?auto_280921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_280912 ?auto_280913 ?auto_280914 ?auto_280915 ?auto_280916 ?auto_280917 ?auto_280918 ?auto_280919 ?auto_280920 ?auto_280921 )
      ( MAKE-11PILE ?auto_280912 ?auto_280913 ?auto_280914 ?auto_280915 ?auto_280916 ?auto_280917 ?auto_280918 ?auto_280919 ?auto_280920 ?auto_280921 ?auto_280922 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280935 - BLOCK
      ?auto_280936 - BLOCK
      ?auto_280937 - BLOCK
      ?auto_280938 - BLOCK
      ?auto_280939 - BLOCK
      ?auto_280940 - BLOCK
      ?auto_280941 - BLOCK
      ?auto_280942 - BLOCK
      ?auto_280943 - BLOCK
      ?auto_280944 - BLOCK
      ?auto_280945 - BLOCK
    )
    :vars
    (
      ?auto_280946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280945 ?auto_280946 ) ( ON-TABLE ?auto_280935 ) ( ON ?auto_280936 ?auto_280935 ) ( ON ?auto_280937 ?auto_280936 ) ( ON ?auto_280938 ?auto_280937 ) ( ON ?auto_280939 ?auto_280938 ) ( ON ?auto_280940 ?auto_280939 ) ( ON ?auto_280941 ?auto_280940 ) ( ON ?auto_280942 ?auto_280941 ) ( ON ?auto_280943 ?auto_280942 ) ( not ( = ?auto_280935 ?auto_280936 ) ) ( not ( = ?auto_280935 ?auto_280937 ) ) ( not ( = ?auto_280935 ?auto_280938 ) ) ( not ( = ?auto_280935 ?auto_280939 ) ) ( not ( = ?auto_280935 ?auto_280940 ) ) ( not ( = ?auto_280935 ?auto_280941 ) ) ( not ( = ?auto_280935 ?auto_280942 ) ) ( not ( = ?auto_280935 ?auto_280943 ) ) ( not ( = ?auto_280935 ?auto_280944 ) ) ( not ( = ?auto_280935 ?auto_280945 ) ) ( not ( = ?auto_280935 ?auto_280946 ) ) ( not ( = ?auto_280936 ?auto_280937 ) ) ( not ( = ?auto_280936 ?auto_280938 ) ) ( not ( = ?auto_280936 ?auto_280939 ) ) ( not ( = ?auto_280936 ?auto_280940 ) ) ( not ( = ?auto_280936 ?auto_280941 ) ) ( not ( = ?auto_280936 ?auto_280942 ) ) ( not ( = ?auto_280936 ?auto_280943 ) ) ( not ( = ?auto_280936 ?auto_280944 ) ) ( not ( = ?auto_280936 ?auto_280945 ) ) ( not ( = ?auto_280936 ?auto_280946 ) ) ( not ( = ?auto_280937 ?auto_280938 ) ) ( not ( = ?auto_280937 ?auto_280939 ) ) ( not ( = ?auto_280937 ?auto_280940 ) ) ( not ( = ?auto_280937 ?auto_280941 ) ) ( not ( = ?auto_280937 ?auto_280942 ) ) ( not ( = ?auto_280937 ?auto_280943 ) ) ( not ( = ?auto_280937 ?auto_280944 ) ) ( not ( = ?auto_280937 ?auto_280945 ) ) ( not ( = ?auto_280937 ?auto_280946 ) ) ( not ( = ?auto_280938 ?auto_280939 ) ) ( not ( = ?auto_280938 ?auto_280940 ) ) ( not ( = ?auto_280938 ?auto_280941 ) ) ( not ( = ?auto_280938 ?auto_280942 ) ) ( not ( = ?auto_280938 ?auto_280943 ) ) ( not ( = ?auto_280938 ?auto_280944 ) ) ( not ( = ?auto_280938 ?auto_280945 ) ) ( not ( = ?auto_280938 ?auto_280946 ) ) ( not ( = ?auto_280939 ?auto_280940 ) ) ( not ( = ?auto_280939 ?auto_280941 ) ) ( not ( = ?auto_280939 ?auto_280942 ) ) ( not ( = ?auto_280939 ?auto_280943 ) ) ( not ( = ?auto_280939 ?auto_280944 ) ) ( not ( = ?auto_280939 ?auto_280945 ) ) ( not ( = ?auto_280939 ?auto_280946 ) ) ( not ( = ?auto_280940 ?auto_280941 ) ) ( not ( = ?auto_280940 ?auto_280942 ) ) ( not ( = ?auto_280940 ?auto_280943 ) ) ( not ( = ?auto_280940 ?auto_280944 ) ) ( not ( = ?auto_280940 ?auto_280945 ) ) ( not ( = ?auto_280940 ?auto_280946 ) ) ( not ( = ?auto_280941 ?auto_280942 ) ) ( not ( = ?auto_280941 ?auto_280943 ) ) ( not ( = ?auto_280941 ?auto_280944 ) ) ( not ( = ?auto_280941 ?auto_280945 ) ) ( not ( = ?auto_280941 ?auto_280946 ) ) ( not ( = ?auto_280942 ?auto_280943 ) ) ( not ( = ?auto_280942 ?auto_280944 ) ) ( not ( = ?auto_280942 ?auto_280945 ) ) ( not ( = ?auto_280942 ?auto_280946 ) ) ( not ( = ?auto_280943 ?auto_280944 ) ) ( not ( = ?auto_280943 ?auto_280945 ) ) ( not ( = ?auto_280943 ?auto_280946 ) ) ( not ( = ?auto_280944 ?auto_280945 ) ) ( not ( = ?auto_280944 ?auto_280946 ) ) ( not ( = ?auto_280945 ?auto_280946 ) ) ( CLEAR ?auto_280943 ) ( ON ?auto_280944 ?auto_280945 ) ( CLEAR ?auto_280944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_280935 ?auto_280936 ?auto_280937 ?auto_280938 ?auto_280939 ?auto_280940 ?auto_280941 ?auto_280942 ?auto_280943 ?auto_280944 )
      ( MAKE-11PILE ?auto_280935 ?auto_280936 ?auto_280937 ?auto_280938 ?auto_280939 ?auto_280940 ?auto_280941 ?auto_280942 ?auto_280943 ?auto_280944 ?auto_280945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280958 - BLOCK
      ?auto_280959 - BLOCK
      ?auto_280960 - BLOCK
      ?auto_280961 - BLOCK
      ?auto_280962 - BLOCK
      ?auto_280963 - BLOCK
      ?auto_280964 - BLOCK
      ?auto_280965 - BLOCK
      ?auto_280966 - BLOCK
      ?auto_280967 - BLOCK
      ?auto_280968 - BLOCK
    )
    :vars
    (
      ?auto_280969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280968 ?auto_280969 ) ( ON-TABLE ?auto_280958 ) ( ON ?auto_280959 ?auto_280958 ) ( ON ?auto_280960 ?auto_280959 ) ( ON ?auto_280961 ?auto_280960 ) ( ON ?auto_280962 ?auto_280961 ) ( ON ?auto_280963 ?auto_280962 ) ( ON ?auto_280964 ?auto_280963 ) ( ON ?auto_280965 ?auto_280964 ) ( not ( = ?auto_280958 ?auto_280959 ) ) ( not ( = ?auto_280958 ?auto_280960 ) ) ( not ( = ?auto_280958 ?auto_280961 ) ) ( not ( = ?auto_280958 ?auto_280962 ) ) ( not ( = ?auto_280958 ?auto_280963 ) ) ( not ( = ?auto_280958 ?auto_280964 ) ) ( not ( = ?auto_280958 ?auto_280965 ) ) ( not ( = ?auto_280958 ?auto_280966 ) ) ( not ( = ?auto_280958 ?auto_280967 ) ) ( not ( = ?auto_280958 ?auto_280968 ) ) ( not ( = ?auto_280958 ?auto_280969 ) ) ( not ( = ?auto_280959 ?auto_280960 ) ) ( not ( = ?auto_280959 ?auto_280961 ) ) ( not ( = ?auto_280959 ?auto_280962 ) ) ( not ( = ?auto_280959 ?auto_280963 ) ) ( not ( = ?auto_280959 ?auto_280964 ) ) ( not ( = ?auto_280959 ?auto_280965 ) ) ( not ( = ?auto_280959 ?auto_280966 ) ) ( not ( = ?auto_280959 ?auto_280967 ) ) ( not ( = ?auto_280959 ?auto_280968 ) ) ( not ( = ?auto_280959 ?auto_280969 ) ) ( not ( = ?auto_280960 ?auto_280961 ) ) ( not ( = ?auto_280960 ?auto_280962 ) ) ( not ( = ?auto_280960 ?auto_280963 ) ) ( not ( = ?auto_280960 ?auto_280964 ) ) ( not ( = ?auto_280960 ?auto_280965 ) ) ( not ( = ?auto_280960 ?auto_280966 ) ) ( not ( = ?auto_280960 ?auto_280967 ) ) ( not ( = ?auto_280960 ?auto_280968 ) ) ( not ( = ?auto_280960 ?auto_280969 ) ) ( not ( = ?auto_280961 ?auto_280962 ) ) ( not ( = ?auto_280961 ?auto_280963 ) ) ( not ( = ?auto_280961 ?auto_280964 ) ) ( not ( = ?auto_280961 ?auto_280965 ) ) ( not ( = ?auto_280961 ?auto_280966 ) ) ( not ( = ?auto_280961 ?auto_280967 ) ) ( not ( = ?auto_280961 ?auto_280968 ) ) ( not ( = ?auto_280961 ?auto_280969 ) ) ( not ( = ?auto_280962 ?auto_280963 ) ) ( not ( = ?auto_280962 ?auto_280964 ) ) ( not ( = ?auto_280962 ?auto_280965 ) ) ( not ( = ?auto_280962 ?auto_280966 ) ) ( not ( = ?auto_280962 ?auto_280967 ) ) ( not ( = ?auto_280962 ?auto_280968 ) ) ( not ( = ?auto_280962 ?auto_280969 ) ) ( not ( = ?auto_280963 ?auto_280964 ) ) ( not ( = ?auto_280963 ?auto_280965 ) ) ( not ( = ?auto_280963 ?auto_280966 ) ) ( not ( = ?auto_280963 ?auto_280967 ) ) ( not ( = ?auto_280963 ?auto_280968 ) ) ( not ( = ?auto_280963 ?auto_280969 ) ) ( not ( = ?auto_280964 ?auto_280965 ) ) ( not ( = ?auto_280964 ?auto_280966 ) ) ( not ( = ?auto_280964 ?auto_280967 ) ) ( not ( = ?auto_280964 ?auto_280968 ) ) ( not ( = ?auto_280964 ?auto_280969 ) ) ( not ( = ?auto_280965 ?auto_280966 ) ) ( not ( = ?auto_280965 ?auto_280967 ) ) ( not ( = ?auto_280965 ?auto_280968 ) ) ( not ( = ?auto_280965 ?auto_280969 ) ) ( not ( = ?auto_280966 ?auto_280967 ) ) ( not ( = ?auto_280966 ?auto_280968 ) ) ( not ( = ?auto_280966 ?auto_280969 ) ) ( not ( = ?auto_280967 ?auto_280968 ) ) ( not ( = ?auto_280967 ?auto_280969 ) ) ( not ( = ?auto_280968 ?auto_280969 ) ) ( ON ?auto_280967 ?auto_280968 ) ( CLEAR ?auto_280965 ) ( ON ?auto_280966 ?auto_280967 ) ( CLEAR ?auto_280966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_280958 ?auto_280959 ?auto_280960 ?auto_280961 ?auto_280962 ?auto_280963 ?auto_280964 ?auto_280965 ?auto_280966 )
      ( MAKE-11PILE ?auto_280958 ?auto_280959 ?auto_280960 ?auto_280961 ?auto_280962 ?auto_280963 ?auto_280964 ?auto_280965 ?auto_280966 ?auto_280967 ?auto_280968 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_280981 - BLOCK
      ?auto_280982 - BLOCK
      ?auto_280983 - BLOCK
      ?auto_280984 - BLOCK
      ?auto_280985 - BLOCK
      ?auto_280986 - BLOCK
      ?auto_280987 - BLOCK
      ?auto_280988 - BLOCK
      ?auto_280989 - BLOCK
      ?auto_280990 - BLOCK
      ?auto_280991 - BLOCK
    )
    :vars
    (
      ?auto_280992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_280991 ?auto_280992 ) ( ON-TABLE ?auto_280981 ) ( ON ?auto_280982 ?auto_280981 ) ( ON ?auto_280983 ?auto_280982 ) ( ON ?auto_280984 ?auto_280983 ) ( ON ?auto_280985 ?auto_280984 ) ( ON ?auto_280986 ?auto_280985 ) ( ON ?auto_280987 ?auto_280986 ) ( ON ?auto_280988 ?auto_280987 ) ( not ( = ?auto_280981 ?auto_280982 ) ) ( not ( = ?auto_280981 ?auto_280983 ) ) ( not ( = ?auto_280981 ?auto_280984 ) ) ( not ( = ?auto_280981 ?auto_280985 ) ) ( not ( = ?auto_280981 ?auto_280986 ) ) ( not ( = ?auto_280981 ?auto_280987 ) ) ( not ( = ?auto_280981 ?auto_280988 ) ) ( not ( = ?auto_280981 ?auto_280989 ) ) ( not ( = ?auto_280981 ?auto_280990 ) ) ( not ( = ?auto_280981 ?auto_280991 ) ) ( not ( = ?auto_280981 ?auto_280992 ) ) ( not ( = ?auto_280982 ?auto_280983 ) ) ( not ( = ?auto_280982 ?auto_280984 ) ) ( not ( = ?auto_280982 ?auto_280985 ) ) ( not ( = ?auto_280982 ?auto_280986 ) ) ( not ( = ?auto_280982 ?auto_280987 ) ) ( not ( = ?auto_280982 ?auto_280988 ) ) ( not ( = ?auto_280982 ?auto_280989 ) ) ( not ( = ?auto_280982 ?auto_280990 ) ) ( not ( = ?auto_280982 ?auto_280991 ) ) ( not ( = ?auto_280982 ?auto_280992 ) ) ( not ( = ?auto_280983 ?auto_280984 ) ) ( not ( = ?auto_280983 ?auto_280985 ) ) ( not ( = ?auto_280983 ?auto_280986 ) ) ( not ( = ?auto_280983 ?auto_280987 ) ) ( not ( = ?auto_280983 ?auto_280988 ) ) ( not ( = ?auto_280983 ?auto_280989 ) ) ( not ( = ?auto_280983 ?auto_280990 ) ) ( not ( = ?auto_280983 ?auto_280991 ) ) ( not ( = ?auto_280983 ?auto_280992 ) ) ( not ( = ?auto_280984 ?auto_280985 ) ) ( not ( = ?auto_280984 ?auto_280986 ) ) ( not ( = ?auto_280984 ?auto_280987 ) ) ( not ( = ?auto_280984 ?auto_280988 ) ) ( not ( = ?auto_280984 ?auto_280989 ) ) ( not ( = ?auto_280984 ?auto_280990 ) ) ( not ( = ?auto_280984 ?auto_280991 ) ) ( not ( = ?auto_280984 ?auto_280992 ) ) ( not ( = ?auto_280985 ?auto_280986 ) ) ( not ( = ?auto_280985 ?auto_280987 ) ) ( not ( = ?auto_280985 ?auto_280988 ) ) ( not ( = ?auto_280985 ?auto_280989 ) ) ( not ( = ?auto_280985 ?auto_280990 ) ) ( not ( = ?auto_280985 ?auto_280991 ) ) ( not ( = ?auto_280985 ?auto_280992 ) ) ( not ( = ?auto_280986 ?auto_280987 ) ) ( not ( = ?auto_280986 ?auto_280988 ) ) ( not ( = ?auto_280986 ?auto_280989 ) ) ( not ( = ?auto_280986 ?auto_280990 ) ) ( not ( = ?auto_280986 ?auto_280991 ) ) ( not ( = ?auto_280986 ?auto_280992 ) ) ( not ( = ?auto_280987 ?auto_280988 ) ) ( not ( = ?auto_280987 ?auto_280989 ) ) ( not ( = ?auto_280987 ?auto_280990 ) ) ( not ( = ?auto_280987 ?auto_280991 ) ) ( not ( = ?auto_280987 ?auto_280992 ) ) ( not ( = ?auto_280988 ?auto_280989 ) ) ( not ( = ?auto_280988 ?auto_280990 ) ) ( not ( = ?auto_280988 ?auto_280991 ) ) ( not ( = ?auto_280988 ?auto_280992 ) ) ( not ( = ?auto_280989 ?auto_280990 ) ) ( not ( = ?auto_280989 ?auto_280991 ) ) ( not ( = ?auto_280989 ?auto_280992 ) ) ( not ( = ?auto_280990 ?auto_280991 ) ) ( not ( = ?auto_280990 ?auto_280992 ) ) ( not ( = ?auto_280991 ?auto_280992 ) ) ( ON ?auto_280990 ?auto_280991 ) ( CLEAR ?auto_280988 ) ( ON ?auto_280989 ?auto_280990 ) ( CLEAR ?auto_280989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_280981 ?auto_280982 ?auto_280983 ?auto_280984 ?auto_280985 ?auto_280986 ?auto_280987 ?auto_280988 ?auto_280989 )
      ( MAKE-11PILE ?auto_280981 ?auto_280982 ?auto_280983 ?auto_280984 ?auto_280985 ?auto_280986 ?auto_280987 ?auto_280988 ?auto_280989 ?auto_280990 ?auto_280991 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281004 - BLOCK
      ?auto_281005 - BLOCK
      ?auto_281006 - BLOCK
      ?auto_281007 - BLOCK
      ?auto_281008 - BLOCK
      ?auto_281009 - BLOCK
      ?auto_281010 - BLOCK
      ?auto_281011 - BLOCK
      ?auto_281012 - BLOCK
      ?auto_281013 - BLOCK
      ?auto_281014 - BLOCK
    )
    :vars
    (
      ?auto_281015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281014 ?auto_281015 ) ( ON-TABLE ?auto_281004 ) ( ON ?auto_281005 ?auto_281004 ) ( ON ?auto_281006 ?auto_281005 ) ( ON ?auto_281007 ?auto_281006 ) ( ON ?auto_281008 ?auto_281007 ) ( ON ?auto_281009 ?auto_281008 ) ( ON ?auto_281010 ?auto_281009 ) ( not ( = ?auto_281004 ?auto_281005 ) ) ( not ( = ?auto_281004 ?auto_281006 ) ) ( not ( = ?auto_281004 ?auto_281007 ) ) ( not ( = ?auto_281004 ?auto_281008 ) ) ( not ( = ?auto_281004 ?auto_281009 ) ) ( not ( = ?auto_281004 ?auto_281010 ) ) ( not ( = ?auto_281004 ?auto_281011 ) ) ( not ( = ?auto_281004 ?auto_281012 ) ) ( not ( = ?auto_281004 ?auto_281013 ) ) ( not ( = ?auto_281004 ?auto_281014 ) ) ( not ( = ?auto_281004 ?auto_281015 ) ) ( not ( = ?auto_281005 ?auto_281006 ) ) ( not ( = ?auto_281005 ?auto_281007 ) ) ( not ( = ?auto_281005 ?auto_281008 ) ) ( not ( = ?auto_281005 ?auto_281009 ) ) ( not ( = ?auto_281005 ?auto_281010 ) ) ( not ( = ?auto_281005 ?auto_281011 ) ) ( not ( = ?auto_281005 ?auto_281012 ) ) ( not ( = ?auto_281005 ?auto_281013 ) ) ( not ( = ?auto_281005 ?auto_281014 ) ) ( not ( = ?auto_281005 ?auto_281015 ) ) ( not ( = ?auto_281006 ?auto_281007 ) ) ( not ( = ?auto_281006 ?auto_281008 ) ) ( not ( = ?auto_281006 ?auto_281009 ) ) ( not ( = ?auto_281006 ?auto_281010 ) ) ( not ( = ?auto_281006 ?auto_281011 ) ) ( not ( = ?auto_281006 ?auto_281012 ) ) ( not ( = ?auto_281006 ?auto_281013 ) ) ( not ( = ?auto_281006 ?auto_281014 ) ) ( not ( = ?auto_281006 ?auto_281015 ) ) ( not ( = ?auto_281007 ?auto_281008 ) ) ( not ( = ?auto_281007 ?auto_281009 ) ) ( not ( = ?auto_281007 ?auto_281010 ) ) ( not ( = ?auto_281007 ?auto_281011 ) ) ( not ( = ?auto_281007 ?auto_281012 ) ) ( not ( = ?auto_281007 ?auto_281013 ) ) ( not ( = ?auto_281007 ?auto_281014 ) ) ( not ( = ?auto_281007 ?auto_281015 ) ) ( not ( = ?auto_281008 ?auto_281009 ) ) ( not ( = ?auto_281008 ?auto_281010 ) ) ( not ( = ?auto_281008 ?auto_281011 ) ) ( not ( = ?auto_281008 ?auto_281012 ) ) ( not ( = ?auto_281008 ?auto_281013 ) ) ( not ( = ?auto_281008 ?auto_281014 ) ) ( not ( = ?auto_281008 ?auto_281015 ) ) ( not ( = ?auto_281009 ?auto_281010 ) ) ( not ( = ?auto_281009 ?auto_281011 ) ) ( not ( = ?auto_281009 ?auto_281012 ) ) ( not ( = ?auto_281009 ?auto_281013 ) ) ( not ( = ?auto_281009 ?auto_281014 ) ) ( not ( = ?auto_281009 ?auto_281015 ) ) ( not ( = ?auto_281010 ?auto_281011 ) ) ( not ( = ?auto_281010 ?auto_281012 ) ) ( not ( = ?auto_281010 ?auto_281013 ) ) ( not ( = ?auto_281010 ?auto_281014 ) ) ( not ( = ?auto_281010 ?auto_281015 ) ) ( not ( = ?auto_281011 ?auto_281012 ) ) ( not ( = ?auto_281011 ?auto_281013 ) ) ( not ( = ?auto_281011 ?auto_281014 ) ) ( not ( = ?auto_281011 ?auto_281015 ) ) ( not ( = ?auto_281012 ?auto_281013 ) ) ( not ( = ?auto_281012 ?auto_281014 ) ) ( not ( = ?auto_281012 ?auto_281015 ) ) ( not ( = ?auto_281013 ?auto_281014 ) ) ( not ( = ?auto_281013 ?auto_281015 ) ) ( not ( = ?auto_281014 ?auto_281015 ) ) ( ON ?auto_281013 ?auto_281014 ) ( ON ?auto_281012 ?auto_281013 ) ( CLEAR ?auto_281010 ) ( ON ?auto_281011 ?auto_281012 ) ( CLEAR ?auto_281011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_281004 ?auto_281005 ?auto_281006 ?auto_281007 ?auto_281008 ?auto_281009 ?auto_281010 ?auto_281011 )
      ( MAKE-11PILE ?auto_281004 ?auto_281005 ?auto_281006 ?auto_281007 ?auto_281008 ?auto_281009 ?auto_281010 ?auto_281011 ?auto_281012 ?auto_281013 ?auto_281014 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281027 - BLOCK
      ?auto_281028 - BLOCK
      ?auto_281029 - BLOCK
      ?auto_281030 - BLOCK
      ?auto_281031 - BLOCK
      ?auto_281032 - BLOCK
      ?auto_281033 - BLOCK
      ?auto_281034 - BLOCK
      ?auto_281035 - BLOCK
      ?auto_281036 - BLOCK
      ?auto_281037 - BLOCK
    )
    :vars
    (
      ?auto_281038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281037 ?auto_281038 ) ( ON-TABLE ?auto_281027 ) ( ON ?auto_281028 ?auto_281027 ) ( ON ?auto_281029 ?auto_281028 ) ( ON ?auto_281030 ?auto_281029 ) ( ON ?auto_281031 ?auto_281030 ) ( ON ?auto_281032 ?auto_281031 ) ( ON ?auto_281033 ?auto_281032 ) ( not ( = ?auto_281027 ?auto_281028 ) ) ( not ( = ?auto_281027 ?auto_281029 ) ) ( not ( = ?auto_281027 ?auto_281030 ) ) ( not ( = ?auto_281027 ?auto_281031 ) ) ( not ( = ?auto_281027 ?auto_281032 ) ) ( not ( = ?auto_281027 ?auto_281033 ) ) ( not ( = ?auto_281027 ?auto_281034 ) ) ( not ( = ?auto_281027 ?auto_281035 ) ) ( not ( = ?auto_281027 ?auto_281036 ) ) ( not ( = ?auto_281027 ?auto_281037 ) ) ( not ( = ?auto_281027 ?auto_281038 ) ) ( not ( = ?auto_281028 ?auto_281029 ) ) ( not ( = ?auto_281028 ?auto_281030 ) ) ( not ( = ?auto_281028 ?auto_281031 ) ) ( not ( = ?auto_281028 ?auto_281032 ) ) ( not ( = ?auto_281028 ?auto_281033 ) ) ( not ( = ?auto_281028 ?auto_281034 ) ) ( not ( = ?auto_281028 ?auto_281035 ) ) ( not ( = ?auto_281028 ?auto_281036 ) ) ( not ( = ?auto_281028 ?auto_281037 ) ) ( not ( = ?auto_281028 ?auto_281038 ) ) ( not ( = ?auto_281029 ?auto_281030 ) ) ( not ( = ?auto_281029 ?auto_281031 ) ) ( not ( = ?auto_281029 ?auto_281032 ) ) ( not ( = ?auto_281029 ?auto_281033 ) ) ( not ( = ?auto_281029 ?auto_281034 ) ) ( not ( = ?auto_281029 ?auto_281035 ) ) ( not ( = ?auto_281029 ?auto_281036 ) ) ( not ( = ?auto_281029 ?auto_281037 ) ) ( not ( = ?auto_281029 ?auto_281038 ) ) ( not ( = ?auto_281030 ?auto_281031 ) ) ( not ( = ?auto_281030 ?auto_281032 ) ) ( not ( = ?auto_281030 ?auto_281033 ) ) ( not ( = ?auto_281030 ?auto_281034 ) ) ( not ( = ?auto_281030 ?auto_281035 ) ) ( not ( = ?auto_281030 ?auto_281036 ) ) ( not ( = ?auto_281030 ?auto_281037 ) ) ( not ( = ?auto_281030 ?auto_281038 ) ) ( not ( = ?auto_281031 ?auto_281032 ) ) ( not ( = ?auto_281031 ?auto_281033 ) ) ( not ( = ?auto_281031 ?auto_281034 ) ) ( not ( = ?auto_281031 ?auto_281035 ) ) ( not ( = ?auto_281031 ?auto_281036 ) ) ( not ( = ?auto_281031 ?auto_281037 ) ) ( not ( = ?auto_281031 ?auto_281038 ) ) ( not ( = ?auto_281032 ?auto_281033 ) ) ( not ( = ?auto_281032 ?auto_281034 ) ) ( not ( = ?auto_281032 ?auto_281035 ) ) ( not ( = ?auto_281032 ?auto_281036 ) ) ( not ( = ?auto_281032 ?auto_281037 ) ) ( not ( = ?auto_281032 ?auto_281038 ) ) ( not ( = ?auto_281033 ?auto_281034 ) ) ( not ( = ?auto_281033 ?auto_281035 ) ) ( not ( = ?auto_281033 ?auto_281036 ) ) ( not ( = ?auto_281033 ?auto_281037 ) ) ( not ( = ?auto_281033 ?auto_281038 ) ) ( not ( = ?auto_281034 ?auto_281035 ) ) ( not ( = ?auto_281034 ?auto_281036 ) ) ( not ( = ?auto_281034 ?auto_281037 ) ) ( not ( = ?auto_281034 ?auto_281038 ) ) ( not ( = ?auto_281035 ?auto_281036 ) ) ( not ( = ?auto_281035 ?auto_281037 ) ) ( not ( = ?auto_281035 ?auto_281038 ) ) ( not ( = ?auto_281036 ?auto_281037 ) ) ( not ( = ?auto_281036 ?auto_281038 ) ) ( not ( = ?auto_281037 ?auto_281038 ) ) ( ON ?auto_281036 ?auto_281037 ) ( ON ?auto_281035 ?auto_281036 ) ( CLEAR ?auto_281033 ) ( ON ?auto_281034 ?auto_281035 ) ( CLEAR ?auto_281034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_281027 ?auto_281028 ?auto_281029 ?auto_281030 ?auto_281031 ?auto_281032 ?auto_281033 ?auto_281034 )
      ( MAKE-11PILE ?auto_281027 ?auto_281028 ?auto_281029 ?auto_281030 ?auto_281031 ?auto_281032 ?auto_281033 ?auto_281034 ?auto_281035 ?auto_281036 ?auto_281037 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281050 - BLOCK
      ?auto_281051 - BLOCK
      ?auto_281052 - BLOCK
      ?auto_281053 - BLOCK
      ?auto_281054 - BLOCK
      ?auto_281055 - BLOCK
      ?auto_281056 - BLOCK
      ?auto_281057 - BLOCK
      ?auto_281058 - BLOCK
      ?auto_281059 - BLOCK
      ?auto_281060 - BLOCK
    )
    :vars
    (
      ?auto_281061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281060 ?auto_281061 ) ( ON-TABLE ?auto_281050 ) ( ON ?auto_281051 ?auto_281050 ) ( ON ?auto_281052 ?auto_281051 ) ( ON ?auto_281053 ?auto_281052 ) ( ON ?auto_281054 ?auto_281053 ) ( ON ?auto_281055 ?auto_281054 ) ( not ( = ?auto_281050 ?auto_281051 ) ) ( not ( = ?auto_281050 ?auto_281052 ) ) ( not ( = ?auto_281050 ?auto_281053 ) ) ( not ( = ?auto_281050 ?auto_281054 ) ) ( not ( = ?auto_281050 ?auto_281055 ) ) ( not ( = ?auto_281050 ?auto_281056 ) ) ( not ( = ?auto_281050 ?auto_281057 ) ) ( not ( = ?auto_281050 ?auto_281058 ) ) ( not ( = ?auto_281050 ?auto_281059 ) ) ( not ( = ?auto_281050 ?auto_281060 ) ) ( not ( = ?auto_281050 ?auto_281061 ) ) ( not ( = ?auto_281051 ?auto_281052 ) ) ( not ( = ?auto_281051 ?auto_281053 ) ) ( not ( = ?auto_281051 ?auto_281054 ) ) ( not ( = ?auto_281051 ?auto_281055 ) ) ( not ( = ?auto_281051 ?auto_281056 ) ) ( not ( = ?auto_281051 ?auto_281057 ) ) ( not ( = ?auto_281051 ?auto_281058 ) ) ( not ( = ?auto_281051 ?auto_281059 ) ) ( not ( = ?auto_281051 ?auto_281060 ) ) ( not ( = ?auto_281051 ?auto_281061 ) ) ( not ( = ?auto_281052 ?auto_281053 ) ) ( not ( = ?auto_281052 ?auto_281054 ) ) ( not ( = ?auto_281052 ?auto_281055 ) ) ( not ( = ?auto_281052 ?auto_281056 ) ) ( not ( = ?auto_281052 ?auto_281057 ) ) ( not ( = ?auto_281052 ?auto_281058 ) ) ( not ( = ?auto_281052 ?auto_281059 ) ) ( not ( = ?auto_281052 ?auto_281060 ) ) ( not ( = ?auto_281052 ?auto_281061 ) ) ( not ( = ?auto_281053 ?auto_281054 ) ) ( not ( = ?auto_281053 ?auto_281055 ) ) ( not ( = ?auto_281053 ?auto_281056 ) ) ( not ( = ?auto_281053 ?auto_281057 ) ) ( not ( = ?auto_281053 ?auto_281058 ) ) ( not ( = ?auto_281053 ?auto_281059 ) ) ( not ( = ?auto_281053 ?auto_281060 ) ) ( not ( = ?auto_281053 ?auto_281061 ) ) ( not ( = ?auto_281054 ?auto_281055 ) ) ( not ( = ?auto_281054 ?auto_281056 ) ) ( not ( = ?auto_281054 ?auto_281057 ) ) ( not ( = ?auto_281054 ?auto_281058 ) ) ( not ( = ?auto_281054 ?auto_281059 ) ) ( not ( = ?auto_281054 ?auto_281060 ) ) ( not ( = ?auto_281054 ?auto_281061 ) ) ( not ( = ?auto_281055 ?auto_281056 ) ) ( not ( = ?auto_281055 ?auto_281057 ) ) ( not ( = ?auto_281055 ?auto_281058 ) ) ( not ( = ?auto_281055 ?auto_281059 ) ) ( not ( = ?auto_281055 ?auto_281060 ) ) ( not ( = ?auto_281055 ?auto_281061 ) ) ( not ( = ?auto_281056 ?auto_281057 ) ) ( not ( = ?auto_281056 ?auto_281058 ) ) ( not ( = ?auto_281056 ?auto_281059 ) ) ( not ( = ?auto_281056 ?auto_281060 ) ) ( not ( = ?auto_281056 ?auto_281061 ) ) ( not ( = ?auto_281057 ?auto_281058 ) ) ( not ( = ?auto_281057 ?auto_281059 ) ) ( not ( = ?auto_281057 ?auto_281060 ) ) ( not ( = ?auto_281057 ?auto_281061 ) ) ( not ( = ?auto_281058 ?auto_281059 ) ) ( not ( = ?auto_281058 ?auto_281060 ) ) ( not ( = ?auto_281058 ?auto_281061 ) ) ( not ( = ?auto_281059 ?auto_281060 ) ) ( not ( = ?auto_281059 ?auto_281061 ) ) ( not ( = ?auto_281060 ?auto_281061 ) ) ( ON ?auto_281059 ?auto_281060 ) ( ON ?auto_281058 ?auto_281059 ) ( ON ?auto_281057 ?auto_281058 ) ( CLEAR ?auto_281055 ) ( ON ?auto_281056 ?auto_281057 ) ( CLEAR ?auto_281056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_281050 ?auto_281051 ?auto_281052 ?auto_281053 ?auto_281054 ?auto_281055 ?auto_281056 )
      ( MAKE-11PILE ?auto_281050 ?auto_281051 ?auto_281052 ?auto_281053 ?auto_281054 ?auto_281055 ?auto_281056 ?auto_281057 ?auto_281058 ?auto_281059 ?auto_281060 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281073 - BLOCK
      ?auto_281074 - BLOCK
      ?auto_281075 - BLOCK
      ?auto_281076 - BLOCK
      ?auto_281077 - BLOCK
      ?auto_281078 - BLOCK
      ?auto_281079 - BLOCK
      ?auto_281080 - BLOCK
      ?auto_281081 - BLOCK
      ?auto_281082 - BLOCK
      ?auto_281083 - BLOCK
    )
    :vars
    (
      ?auto_281084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281083 ?auto_281084 ) ( ON-TABLE ?auto_281073 ) ( ON ?auto_281074 ?auto_281073 ) ( ON ?auto_281075 ?auto_281074 ) ( ON ?auto_281076 ?auto_281075 ) ( ON ?auto_281077 ?auto_281076 ) ( ON ?auto_281078 ?auto_281077 ) ( not ( = ?auto_281073 ?auto_281074 ) ) ( not ( = ?auto_281073 ?auto_281075 ) ) ( not ( = ?auto_281073 ?auto_281076 ) ) ( not ( = ?auto_281073 ?auto_281077 ) ) ( not ( = ?auto_281073 ?auto_281078 ) ) ( not ( = ?auto_281073 ?auto_281079 ) ) ( not ( = ?auto_281073 ?auto_281080 ) ) ( not ( = ?auto_281073 ?auto_281081 ) ) ( not ( = ?auto_281073 ?auto_281082 ) ) ( not ( = ?auto_281073 ?auto_281083 ) ) ( not ( = ?auto_281073 ?auto_281084 ) ) ( not ( = ?auto_281074 ?auto_281075 ) ) ( not ( = ?auto_281074 ?auto_281076 ) ) ( not ( = ?auto_281074 ?auto_281077 ) ) ( not ( = ?auto_281074 ?auto_281078 ) ) ( not ( = ?auto_281074 ?auto_281079 ) ) ( not ( = ?auto_281074 ?auto_281080 ) ) ( not ( = ?auto_281074 ?auto_281081 ) ) ( not ( = ?auto_281074 ?auto_281082 ) ) ( not ( = ?auto_281074 ?auto_281083 ) ) ( not ( = ?auto_281074 ?auto_281084 ) ) ( not ( = ?auto_281075 ?auto_281076 ) ) ( not ( = ?auto_281075 ?auto_281077 ) ) ( not ( = ?auto_281075 ?auto_281078 ) ) ( not ( = ?auto_281075 ?auto_281079 ) ) ( not ( = ?auto_281075 ?auto_281080 ) ) ( not ( = ?auto_281075 ?auto_281081 ) ) ( not ( = ?auto_281075 ?auto_281082 ) ) ( not ( = ?auto_281075 ?auto_281083 ) ) ( not ( = ?auto_281075 ?auto_281084 ) ) ( not ( = ?auto_281076 ?auto_281077 ) ) ( not ( = ?auto_281076 ?auto_281078 ) ) ( not ( = ?auto_281076 ?auto_281079 ) ) ( not ( = ?auto_281076 ?auto_281080 ) ) ( not ( = ?auto_281076 ?auto_281081 ) ) ( not ( = ?auto_281076 ?auto_281082 ) ) ( not ( = ?auto_281076 ?auto_281083 ) ) ( not ( = ?auto_281076 ?auto_281084 ) ) ( not ( = ?auto_281077 ?auto_281078 ) ) ( not ( = ?auto_281077 ?auto_281079 ) ) ( not ( = ?auto_281077 ?auto_281080 ) ) ( not ( = ?auto_281077 ?auto_281081 ) ) ( not ( = ?auto_281077 ?auto_281082 ) ) ( not ( = ?auto_281077 ?auto_281083 ) ) ( not ( = ?auto_281077 ?auto_281084 ) ) ( not ( = ?auto_281078 ?auto_281079 ) ) ( not ( = ?auto_281078 ?auto_281080 ) ) ( not ( = ?auto_281078 ?auto_281081 ) ) ( not ( = ?auto_281078 ?auto_281082 ) ) ( not ( = ?auto_281078 ?auto_281083 ) ) ( not ( = ?auto_281078 ?auto_281084 ) ) ( not ( = ?auto_281079 ?auto_281080 ) ) ( not ( = ?auto_281079 ?auto_281081 ) ) ( not ( = ?auto_281079 ?auto_281082 ) ) ( not ( = ?auto_281079 ?auto_281083 ) ) ( not ( = ?auto_281079 ?auto_281084 ) ) ( not ( = ?auto_281080 ?auto_281081 ) ) ( not ( = ?auto_281080 ?auto_281082 ) ) ( not ( = ?auto_281080 ?auto_281083 ) ) ( not ( = ?auto_281080 ?auto_281084 ) ) ( not ( = ?auto_281081 ?auto_281082 ) ) ( not ( = ?auto_281081 ?auto_281083 ) ) ( not ( = ?auto_281081 ?auto_281084 ) ) ( not ( = ?auto_281082 ?auto_281083 ) ) ( not ( = ?auto_281082 ?auto_281084 ) ) ( not ( = ?auto_281083 ?auto_281084 ) ) ( ON ?auto_281082 ?auto_281083 ) ( ON ?auto_281081 ?auto_281082 ) ( ON ?auto_281080 ?auto_281081 ) ( CLEAR ?auto_281078 ) ( ON ?auto_281079 ?auto_281080 ) ( CLEAR ?auto_281079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_281073 ?auto_281074 ?auto_281075 ?auto_281076 ?auto_281077 ?auto_281078 ?auto_281079 )
      ( MAKE-11PILE ?auto_281073 ?auto_281074 ?auto_281075 ?auto_281076 ?auto_281077 ?auto_281078 ?auto_281079 ?auto_281080 ?auto_281081 ?auto_281082 ?auto_281083 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281096 - BLOCK
      ?auto_281097 - BLOCK
      ?auto_281098 - BLOCK
      ?auto_281099 - BLOCK
      ?auto_281100 - BLOCK
      ?auto_281101 - BLOCK
      ?auto_281102 - BLOCK
      ?auto_281103 - BLOCK
      ?auto_281104 - BLOCK
      ?auto_281105 - BLOCK
      ?auto_281106 - BLOCK
    )
    :vars
    (
      ?auto_281107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281106 ?auto_281107 ) ( ON-TABLE ?auto_281096 ) ( ON ?auto_281097 ?auto_281096 ) ( ON ?auto_281098 ?auto_281097 ) ( ON ?auto_281099 ?auto_281098 ) ( ON ?auto_281100 ?auto_281099 ) ( not ( = ?auto_281096 ?auto_281097 ) ) ( not ( = ?auto_281096 ?auto_281098 ) ) ( not ( = ?auto_281096 ?auto_281099 ) ) ( not ( = ?auto_281096 ?auto_281100 ) ) ( not ( = ?auto_281096 ?auto_281101 ) ) ( not ( = ?auto_281096 ?auto_281102 ) ) ( not ( = ?auto_281096 ?auto_281103 ) ) ( not ( = ?auto_281096 ?auto_281104 ) ) ( not ( = ?auto_281096 ?auto_281105 ) ) ( not ( = ?auto_281096 ?auto_281106 ) ) ( not ( = ?auto_281096 ?auto_281107 ) ) ( not ( = ?auto_281097 ?auto_281098 ) ) ( not ( = ?auto_281097 ?auto_281099 ) ) ( not ( = ?auto_281097 ?auto_281100 ) ) ( not ( = ?auto_281097 ?auto_281101 ) ) ( not ( = ?auto_281097 ?auto_281102 ) ) ( not ( = ?auto_281097 ?auto_281103 ) ) ( not ( = ?auto_281097 ?auto_281104 ) ) ( not ( = ?auto_281097 ?auto_281105 ) ) ( not ( = ?auto_281097 ?auto_281106 ) ) ( not ( = ?auto_281097 ?auto_281107 ) ) ( not ( = ?auto_281098 ?auto_281099 ) ) ( not ( = ?auto_281098 ?auto_281100 ) ) ( not ( = ?auto_281098 ?auto_281101 ) ) ( not ( = ?auto_281098 ?auto_281102 ) ) ( not ( = ?auto_281098 ?auto_281103 ) ) ( not ( = ?auto_281098 ?auto_281104 ) ) ( not ( = ?auto_281098 ?auto_281105 ) ) ( not ( = ?auto_281098 ?auto_281106 ) ) ( not ( = ?auto_281098 ?auto_281107 ) ) ( not ( = ?auto_281099 ?auto_281100 ) ) ( not ( = ?auto_281099 ?auto_281101 ) ) ( not ( = ?auto_281099 ?auto_281102 ) ) ( not ( = ?auto_281099 ?auto_281103 ) ) ( not ( = ?auto_281099 ?auto_281104 ) ) ( not ( = ?auto_281099 ?auto_281105 ) ) ( not ( = ?auto_281099 ?auto_281106 ) ) ( not ( = ?auto_281099 ?auto_281107 ) ) ( not ( = ?auto_281100 ?auto_281101 ) ) ( not ( = ?auto_281100 ?auto_281102 ) ) ( not ( = ?auto_281100 ?auto_281103 ) ) ( not ( = ?auto_281100 ?auto_281104 ) ) ( not ( = ?auto_281100 ?auto_281105 ) ) ( not ( = ?auto_281100 ?auto_281106 ) ) ( not ( = ?auto_281100 ?auto_281107 ) ) ( not ( = ?auto_281101 ?auto_281102 ) ) ( not ( = ?auto_281101 ?auto_281103 ) ) ( not ( = ?auto_281101 ?auto_281104 ) ) ( not ( = ?auto_281101 ?auto_281105 ) ) ( not ( = ?auto_281101 ?auto_281106 ) ) ( not ( = ?auto_281101 ?auto_281107 ) ) ( not ( = ?auto_281102 ?auto_281103 ) ) ( not ( = ?auto_281102 ?auto_281104 ) ) ( not ( = ?auto_281102 ?auto_281105 ) ) ( not ( = ?auto_281102 ?auto_281106 ) ) ( not ( = ?auto_281102 ?auto_281107 ) ) ( not ( = ?auto_281103 ?auto_281104 ) ) ( not ( = ?auto_281103 ?auto_281105 ) ) ( not ( = ?auto_281103 ?auto_281106 ) ) ( not ( = ?auto_281103 ?auto_281107 ) ) ( not ( = ?auto_281104 ?auto_281105 ) ) ( not ( = ?auto_281104 ?auto_281106 ) ) ( not ( = ?auto_281104 ?auto_281107 ) ) ( not ( = ?auto_281105 ?auto_281106 ) ) ( not ( = ?auto_281105 ?auto_281107 ) ) ( not ( = ?auto_281106 ?auto_281107 ) ) ( ON ?auto_281105 ?auto_281106 ) ( ON ?auto_281104 ?auto_281105 ) ( ON ?auto_281103 ?auto_281104 ) ( ON ?auto_281102 ?auto_281103 ) ( CLEAR ?auto_281100 ) ( ON ?auto_281101 ?auto_281102 ) ( CLEAR ?auto_281101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_281096 ?auto_281097 ?auto_281098 ?auto_281099 ?auto_281100 ?auto_281101 )
      ( MAKE-11PILE ?auto_281096 ?auto_281097 ?auto_281098 ?auto_281099 ?auto_281100 ?auto_281101 ?auto_281102 ?auto_281103 ?auto_281104 ?auto_281105 ?auto_281106 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281119 - BLOCK
      ?auto_281120 - BLOCK
      ?auto_281121 - BLOCK
      ?auto_281122 - BLOCK
      ?auto_281123 - BLOCK
      ?auto_281124 - BLOCK
      ?auto_281125 - BLOCK
      ?auto_281126 - BLOCK
      ?auto_281127 - BLOCK
      ?auto_281128 - BLOCK
      ?auto_281129 - BLOCK
    )
    :vars
    (
      ?auto_281130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281129 ?auto_281130 ) ( ON-TABLE ?auto_281119 ) ( ON ?auto_281120 ?auto_281119 ) ( ON ?auto_281121 ?auto_281120 ) ( ON ?auto_281122 ?auto_281121 ) ( ON ?auto_281123 ?auto_281122 ) ( not ( = ?auto_281119 ?auto_281120 ) ) ( not ( = ?auto_281119 ?auto_281121 ) ) ( not ( = ?auto_281119 ?auto_281122 ) ) ( not ( = ?auto_281119 ?auto_281123 ) ) ( not ( = ?auto_281119 ?auto_281124 ) ) ( not ( = ?auto_281119 ?auto_281125 ) ) ( not ( = ?auto_281119 ?auto_281126 ) ) ( not ( = ?auto_281119 ?auto_281127 ) ) ( not ( = ?auto_281119 ?auto_281128 ) ) ( not ( = ?auto_281119 ?auto_281129 ) ) ( not ( = ?auto_281119 ?auto_281130 ) ) ( not ( = ?auto_281120 ?auto_281121 ) ) ( not ( = ?auto_281120 ?auto_281122 ) ) ( not ( = ?auto_281120 ?auto_281123 ) ) ( not ( = ?auto_281120 ?auto_281124 ) ) ( not ( = ?auto_281120 ?auto_281125 ) ) ( not ( = ?auto_281120 ?auto_281126 ) ) ( not ( = ?auto_281120 ?auto_281127 ) ) ( not ( = ?auto_281120 ?auto_281128 ) ) ( not ( = ?auto_281120 ?auto_281129 ) ) ( not ( = ?auto_281120 ?auto_281130 ) ) ( not ( = ?auto_281121 ?auto_281122 ) ) ( not ( = ?auto_281121 ?auto_281123 ) ) ( not ( = ?auto_281121 ?auto_281124 ) ) ( not ( = ?auto_281121 ?auto_281125 ) ) ( not ( = ?auto_281121 ?auto_281126 ) ) ( not ( = ?auto_281121 ?auto_281127 ) ) ( not ( = ?auto_281121 ?auto_281128 ) ) ( not ( = ?auto_281121 ?auto_281129 ) ) ( not ( = ?auto_281121 ?auto_281130 ) ) ( not ( = ?auto_281122 ?auto_281123 ) ) ( not ( = ?auto_281122 ?auto_281124 ) ) ( not ( = ?auto_281122 ?auto_281125 ) ) ( not ( = ?auto_281122 ?auto_281126 ) ) ( not ( = ?auto_281122 ?auto_281127 ) ) ( not ( = ?auto_281122 ?auto_281128 ) ) ( not ( = ?auto_281122 ?auto_281129 ) ) ( not ( = ?auto_281122 ?auto_281130 ) ) ( not ( = ?auto_281123 ?auto_281124 ) ) ( not ( = ?auto_281123 ?auto_281125 ) ) ( not ( = ?auto_281123 ?auto_281126 ) ) ( not ( = ?auto_281123 ?auto_281127 ) ) ( not ( = ?auto_281123 ?auto_281128 ) ) ( not ( = ?auto_281123 ?auto_281129 ) ) ( not ( = ?auto_281123 ?auto_281130 ) ) ( not ( = ?auto_281124 ?auto_281125 ) ) ( not ( = ?auto_281124 ?auto_281126 ) ) ( not ( = ?auto_281124 ?auto_281127 ) ) ( not ( = ?auto_281124 ?auto_281128 ) ) ( not ( = ?auto_281124 ?auto_281129 ) ) ( not ( = ?auto_281124 ?auto_281130 ) ) ( not ( = ?auto_281125 ?auto_281126 ) ) ( not ( = ?auto_281125 ?auto_281127 ) ) ( not ( = ?auto_281125 ?auto_281128 ) ) ( not ( = ?auto_281125 ?auto_281129 ) ) ( not ( = ?auto_281125 ?auto_281130 ) ) ( not ( = ?auto_281126 ?auto_281127 ) ) ( not ( = ?auto_281126 ?auto_281128 ) ) ( not ( = ?auto_281126 ?auto_281129 ) ) ( not ( = ?auto_281126 ?auto_281130 ) ) ( not ( = ?auto_281127 ?auto_281128 ) ) ( not ( = ?auto_281127 ?auto_281129 ) ) ( not ( = ?auto_281127 ?auto_281130 ) ) ( not ( = ?auto_281128 ?auto_281129 ) ) ( not ( = ?auto_281128 ?auto_281130 ) ) ( not ( = ?auto_281129 ?auto_281130 ) ) ( ON ?auto_281128 ?auto_281129 ) ( ON ?auto_281127 ?auto_281128 ) ( ON ?auto_281126 ?auto_281127 ) ( ON ?auto_281125 ?auto_281126 ) ( CLEAR ?auto_281123 ) ( ON ?auto_281124 ?auto_281125 ) ( CLEAR ?auto_281124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_281119 ?auto_281120 ?auto_281121 ?auto_281122 ?auto_281123 ?auto_281124 )
      ( MAKE-11PILE ?auto_281119 ?auto_281120 ?auto_281121 ?auto_281122 ?auto_281123 ?auto_281124 ?auto_281125 ?auto_281126 ?auto_281127 ?auto_281128 ?auto_281129 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281142 - BLOCK
      ?auto_281143 - BLOCK
      ?auto_281144 - BLOCK
      ?auto_281145 - BLOCK
      ?auto_281146 - BLOCK
      ?auto_281147 - BLOCK
      ?auto_281148 - BLOCK
      ?auto_281149 - BLOCK
      ?auto_281150 - BLOCK
      ?auto_281151 - BLOCK
      ?auto_281152 - BLOCK
    )
    :vars
    (
      ?auto_281153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281152 ?auto_281153 ) ( ON-TABLE ?auto_281142 ) ( ON ?auto_281143 ?auto_281142 ) ( ON ?auto_281144 ?auto_281143 ) ( ON ?auto_281145 ?auto_281144 ) ( not ( = ?auto_281142 ?auto_281143 ) ) ( not ( = ?auto_281142 ?auto_281144 ) ) ( not ( = ?auto_281142 ?auto_281145 ) ) ( not ( = ?auto_281142 ?auto_281146 ) ) ( not ( = ?auto_281142 ?auto_281147 ) ) ( not ( = ?auto_281142 ?auto_281148 ) ) ( not ( = ?auto_281142 ?auto_281149 ) ) ( not ( = ?auto_281142 ?auto_281150 ) ) ( not ( = ?auto_281142 ?auto_281151 ) ) ( not ( = ?auto_281142 ?auto_281152 ) ) ( not ( = ?auto_281142 ?auto_281153 ) ) ( not ( = ?auto_281143 ?auto_281144 ) ) ( not ( = ?auto_281143 ?auto_281145 ) ) ( not ( = ?auto_281143 ?auto_281146 ) ) ( not ( = ?auto_281143 ?auto_281147 ) ) ( not ( = ?auto_281143 ?auto_281148 ) ) ( not ( = ?auto_281143 ?auto_281149 ) ) ( not ( = ?auto_281143 ?auto_281150 ) ) ( not ( = ?auto_281143 ?auto_281151 ) ) ( not ( = ?auto_281143 ?auto_281152 ) ) ( not ( = ?auto_281143 ?auto_281153 ) ) ( not ( = ?auto_281144 ?auto_281145 ) ) ( not ( = ?auto_281144 ?auto_281146 ) ) ( not ( = ?auto_281144 ?auto_281147 ) ) ( not ( = ?auto_281144 ?auto_281148 ) ) ( not ( = ?auto_281144 ?auto_281149 ) ) ( not ( = ?auto_281144 ?auto_281150 ) ) ( not ( = ?auto_281144 ?auto_281151 ) ) ( not ( = ?auto_281144 ?auto_281152 ) ) ( not ( = ?auto_281144 ?auto_281153 ) ) ( not ( = ?auto_281145 ?auto_281146 ) ) ( not ( = ?auto_281145 ?auto_281147 ) ) ( not ( = ?auto_281145 ?auto_281148 ) ) ( not ( = ?auto_281145 ?auto_281149 ) ) ( not ( = ?auto_281145 ?auto_281150 ) ) ( not ( = ?auto_281145 ?auto_281151 ) ) ( not ( = ?auto_281145 ?auto_281152 ) ) ( not ( = ?auto_281145 ?auto_281153 ) ) ( not ( = ?auto_281146 ?auto_281147 ) ) ( not ( = ?auto_281146 ?auto_281148 ) ) ( not ( = ?auto_281146 ?auto_281149 ) ) ( not ( = ?auto_281146 ?auto_281150 ) ) ( not ( = ?auto_281146 ?auto_281151 ) ) ( not ( = ?auto_281146 ?auto_281152 ) ) ( not ( = ?auto_281146 ?auto_281153 ) ) ( not ( = ?auto_281147 ?auto_281148 ) ) ( not ( = ?auto_281147 ?auto_281149 ) ) ( not ( = ?auto_281147 ?auto_281150 ) ) ( not ( = ?auto_281147 ?auto_281151 ) ) ( not ( = ?auto_281147 ?auto_281152 ) ) ( not ( = ?auto_281147 ?auto_281153 ) ) ( not ( = ?auto_281148 ?auto_281149 ) ) ( not ( = ?auto_281148 ?auto_281150 ) ) ( not ( = ?auto_281148 ?auto_281151 ) ) ( not ( = ?auto_281148 ?auto_281152 ) ) ( not ( = ?auto_281148 ?auto_281153 ) ) ( not ( = ?auto_281149 ?auto_281150 ) ) ( not ( = ?auto_281149 ?auto_281151 ) ) ( not ( = ?auto_281149 ?auto_281152 ) ) ( not ( = ?auto_281149 ?auto_281153 ) ) ( not ( = ?auto_281150 ?auto_281151 ) ) ( not ( = ?auto_281150 ?auto_281152 ) ) ( not ( = ?auto_281150 ?auto_281153 ) ) ( not ( = ?auto_281151 ?auto_281152 ) ) ( not ( = ?auto_281151 ?auto_281153 ) ) ( not ( = ?auto_281152 ?auto_281153 ) ) ( ON ?auto_281151 ?auto_281152 ) ( ON ?auto_281150 ?auto_281151 ) ( ON ?auto_281149 ?auto_281150 ) ( ON ?auto_281148 ?auto_281149 ) ( ON ?auto_281147 ?auto_281148 ) ( CLEAR ?auto_281145 ) ( ON ?auto_281146 ?auto_281147 ) ( CLEAR ?auto_281146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_281142 ?auto_281143 ?auto_281144 ?auto_281145 ?auto_281146 )
      ( MAKE-11PILE ?auto_281142 ?auto_281143 ?auto_281144 ?auto_281145 ?auto_281146 ?auto_281147 ?auto_281148 ?auto_281149 ?auto_281150 ?auto_281151 ?auto_281152 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281165 - BLOCK
      ?auto_281166 - BLOCK
      ?auto_281167 - BLOCK
      ?auto_281168 - BLOCK
      ?auto_281169 - BLOCK
      ?auto_281170 - BLOCK
      ?auto_281171 - BLOCK
      ?auto_281172 - BLOCK
      ?auto_281173 - BLOCK
      ?auto_281174 - BLOCK
      ?auto_281175 - BLOCK
    )
    :vars
    (
      ?auto_281176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281175 ?auto_281176 ) ( ON-TABLE ?auto_281165 ) ( ON ?auto_281166 ?auto_281165 ) ( ON ?auto_281167 ?auto_281166 ) ( ON ?auto_281168 ?auto_281167 ) ( not ( = ?auto_281165 ?auto_281166 ) ) ( not ( = ?auto_281165 ?auto_281167 ) ) ( not ( = ?auto_281165 ?auto_281168 ) ) ( not ( = ?auto_281165 ?auto_281169 ) ) ( not ( = ?auto_281165 ?auto_281170 ) ) ( not ( = ?auto_281165 ?auto_281171 ) ) ( not ( = ?auto_281165 ?auto_281172 ) ) ( not ( = ?auto_281165 ?auto_281173 ) ) ( not ( = ?auto_281165 ?auto_281174 ) ) ( not ( = ?auto_281165 ?auto_281175 ) ) ( not ( = ?auto_281165 ?auto_281176 ) ) ( not ( = ?auto_281166 ?auto_281167 ) ) ( not ( = ?auto_281166 ?auto_281168 ) ) ( not ( = ?auto_281166 ?auto_281169 ) ) ( not ( = ?auto_281166 ?auto_281170 ) ) ( not ( = ?auto_281166 ?auto_281171 ) ) ( not ( = ?auto_281166 ?auto_281172 ) ) ( not ( = ?auto_281166 ?auto_281173 ) ) ( not ( = ?auto_281166 ?auto_281174 ) ) ( not ( = ?auto_281166 ?auto_281175 ) ) ( not ( = ?auto_281166 ?auto_281176 ) ) ( not ( = ?auto_281167 ?auto_281168 ) ) ( not ( = ?auto_281167 ?auto_281169 ) ) ( not ( = ?auto_281167 ?auto_281170 ) ) ( not ( = ?auto_281167 ?auto_281171 ) ) ( not ( = ?auto_281167 ?auto_281172 ) ) ( not ( = ?auto_281167 ?auto_281173 ) ) ( not ( = ?auto_281167 ?auto_281174 ) ) ( not ( = ?auto_281167 ?auto_281175 ) ) ( not ( = ?auto_281167 ?auto_281176 ) ) ( not ( = ?auto_281168 ?auto_281169 ) ) ( not ( = ?auto_281168 ?auto_281170 ) ) ( not ( = ?auto_281168 ?auto_281171 ) ) ( not ( = ?auto_281168 ?auto_281172 ) ) ( not ( = ?auto_281168 ?auto_281173 ) ) ( not ( = ?auto_281168 ?auto_281174 ) ) ( not ( = ?auto_281168 ?auto_281175 ) ) ( not ( = ?auto_281168 ?auto_281176 ) ) ( not ( = ?auto_281169 ?auto_281170 ) ) ( not ( = ?auto_281169 ?auto_281171 ) ) ( not ( = ?auto_281169 ?auto_281172 ) ) ( not ( = ?auto_281169 ?auto_281173 ) ) ( not ( = ?auto_281169 ?auto_281174 ) ) ( not ( = ?auto_281169 ?auto_281175 ) ) ( not ( = ?auto_281169 ?auto_281176 ) ) ( not ( = ?auto_281170 ?auto_281171 ) ) ( not ( = ?auto_281170 ?auto_281172 ) ) ( not ( = ?auto_281170 ?auto_281173 ) ) ( not ( = ?auto_281170 ?auto_281174 ) ) ( not ( = ?auto_281170 ?auto_281175 ) ) ( not ( = ?auto_281170 ?auto_281176 ) ) ( not ( = ?auto_281171 ?auto_281172 ) ) ( not ( = ?auto_281171 ?auto_281173 ) ) ( not ( = ?auto_281171 ?auto_281174 ) ) ( not ( = ?auto_281171 ?auto_281175 ) ) ( not ( = ?auto_281171 ?auto_281176 ) ) ( not ( = ?auto_281172 ?auto_281173 ) ) ( not ( = ?auto_281172 ?auto_281174 ) ) ( not ( = ?auto_281172 ?auto_281175 ) ) ( not ( = ?auto_281172 ?auto_281176 ) ) ( not ( = ?auto_281173 ?auto_281174 ) ) ( not ( = ?auto_281173 ?auto_281175 ) ) ( not ( = ?auto_281173 ?auto_281176 ) ) ( not ( = ?auto_281174 ?auto_281175 ) ) ( not ( = ?auto_281174 ?auto_281176 ) ) ( not ( = ?auto_281175 ?auto_281176 ) ) ( ON ?auto_281174 ?auto_281175 ) ( ON ?auto_281173 ?auto_281174 ) ( ON ?auto_281172 ?auto_281173 ) ( ON ?auto_281171 ?auto_281172 ) ( ON ?auto_281170 ?auto_281171 ) ( CLEAR ?auto_281168 ) ( ON ?auto_281169 ?auto_281170 ) ( CLEAR ?auto_281169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_281165 ?auto_281166 ?auto_281167 ?auto_281168 ?auto_281169 )
      ( MAKE-11PILE ?auto_281165 ?auto_281166 ?auto_281167 ?auto_281168 ?auto_281169 ?auto_281170 ?auto_281171 ?auto_281172 ?auto_281173 ?auto_281174 ?auto_281175 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281188 - BLOCK
      ?auto_281189 - BLOCK
      ?auto_281190 - BLOCK
      ?auto_281191 - BLOCK
      ?auto_281192 - BLOCK
      ?auto_281193 - BLOCK
      ?auto_281194 - BLOCK
      ?auto_281195 - BLOCK
      ?auto_281196 - BLOCK
      ?auto_281197 - BLOCK
      ?auto_281198 - BLOCK
    )
    :vars
    (
      ?auto_281199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281198 ?auto_281199 ) ( ON-TABLE ?auto_281188 ) ( ON ?auto_281189 ?auto_281188 ) ( ON ?auto_281190 ?auto_281189 ) ( not ( = ?auto_281188 ?auto_281189 ) ) ( not ( = ?auto_281188 ?auto_281190 ) ) ( not ( = ?auto_281188 ?auto_281191 ) ) ( not ( = ?auto_281188 ?auto_281192 ) ) ( not ( = ?auto_281188 ?auto_281193 ) ) ( not ( = ?auto_281188 ?auto_281194 ) ) ( not ( = ?auto_281188 ?auto_281195 ) ) ( not ( = ?auto_281188 ?auto_281196 ) ) ( not ( = ?auto_281188 ?auto_281197 ) ) ( not ( = ?auto_281188 ?auto_281198 ) ) ( not ( = ?auto_281188 ?auto_281199 ) ) ( not ( = ?auto_281189 ?auto_281190 ) ) ( not ( = ?auto_281189 ?auto_281191 ) ) ( not ( = ?auto_281189 ?auto_281192 ) ) ( not ( = ?auto_281189 ?auto_281193 ) ) ( not ( = ?auto_281189 ?auto_281194 ) ) ( not ( = ?auto_281189 ?auto_281195 ) ) ( not ( = ?auto_281189 ?auto_281196 ) ) ( not ( = ?auto_281189 ?auto_281197 ) ) ( not ( = ?auto_281189 ?auto_281198 ) ) ( not ( = ?auto_281189 ?auto_281199 ) ) ( not ( = ?auto_281190 ?auto_281191 ) ) ( not ( = ?auto_281190 ?auto_281192 ) ) ( not ( = ?auto_281190 ?auto_281193 ) ) ( not ( = ?auto_281190 ?auto_281194 ) ) ( not ( = ?auto_281190 ?auto_281195 ) ) ( not ( = ?auto_281190 ?auto_281196 ) ) ( not ( = ?auto_281190 ?auto_281197 ) ) ( not ( = ?auto_281190 ?auto_281198 ) ) ( not ( = ?auto_281190 ?auto_281199 ) ) ( not ( = ?auto_281191 ?auto_281192 ) ) ( not ( = ?auto_281191 ?auto_281193 ) ) ( not ( = ?auto_281191 ?auto_281194 ) ) ( not ( = ?auto_281191 ?auto_281195 ) ) ( not ( = ?auto_281191 ?auto_281196 ) ) ( not ( = ?auto_281191 ?auto_281197 ) ) ( not ( = ?auto_281191 ?auto_281198 ) ) ( not ( = ?auto_281191 ?auto_281199 ) ) ( not ( = ?auto_281192 ?auto_281193 ) ) ( not ( = ?auto_281192 ?auto_281194 ) ) ( not ( = ?auto_281192 ?auto_281195 ) ) ( not ( = ?auto_281192 ?auto_281196 ) ) ( not ( = ?auto_281192 ?auto_281197 ) ) ( not ( = ?auto_281192 ?auto_281198 ) ) ( not ( = ?auto_281192 ?auto_281199 ) ) ( not ( = ?auto_281193 ?auto_281194 ) ) ( not ( = ?auto_281193 ?auto_281195 ) ) ( not ( = ?auto_281193 ?auto_281196 ) ) ( not ( = ?auto_281193 ?auto_281197 ) ) ( not ( = ?auto_281193 ?auto_281198 ) ) ( not ( = ?auto_281193 ?auto_281199 ) ) ( not ( = ?auto_281194 ?auto_281195 ) ) ( not ( = ?auto_281194 ?auto_281196 ) ) ( not ( = ?auto_281194 ?auto_281197 ) ) ( not ( = ?auto_281194 ?auto_281198 ) ) ( not ( = ?auto_281194 ?auto_281199 ) ) ( not ( = ?auto_281195 ?auto_281196 ) ) ( not ( = ?auto_281195 ?auto_281197 ) ) ( not ( = ?auto_281195 ?auto_281198 ) ) ( not ( = ?auto_281195 ?auto_281199 ) ) ( not ( = ?auto_281196 ?auto_281197 ) ) ( not ( = ?auto_281196 ?auto_281198 ) ) ( not ( = ?auto_281196 ?auto_281199 ) ) ( not ( = ?auto_281197 ?auto_281198 ) ) ( not ( = ?auto_281197 ?auto_281199 ) ) ( not ( = ?auto_281198 ?auto_281199 ) ) ( ON ?auto_281197 ?auto_281198 ) ( ON ?auto_281196 ?auto_281197 ) ( ON ?auto_281195 ?auto_281196 ) ( ON ?auto_281194 ?auto_281195 ) ( ON ?auto_281193 ?auto_281194 ) ( ON ?auto_281192 ?auto_281193 ) ( CLEAR ?auto_281190 ) ( ON ?auto_281191 ?auto_281192 ) ( CLEAR ?auto_281191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_281188 ?auto_281189 ?auto_281190 ?auto_281191 )
      ( MAKE-11PILE ?auto_281188 ?auto_281189 ?auto_281190 ?auto_281191 ?auto_281192 ?auto_281193 ?auto_281194 ?auto_281195 ?auto_281196 ?auto_281197 ?auto_281198 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281211 - BLOCK
      ?auto_281212 - BLOCK
      ?auto_281213 - BLOCK
      ?auto_281214 - BLOCK
      ?auto_281215 - BLOCK
      ?auto_281216 - BLOCK
      ?auto_281217 - BLOCK
      ?auto_281218 - BLOCK
      ?auto_281219 - BLOCK
      ?auto_281220 - BLOCK
      ?auto_281221 - BLOCK
    )
    :vars
    (
      ?auto_281222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281221 ?auto_281222 ) ( ON-TABLE ?auto_281211 ) ( ON ?auto_281212 ?auto_281211 ) ( ON ?auto_281213 ?auto_281212 ) ( not ( = ?auto_281211 ?auto_281212 ) ) ( not ( = ?auto_281211 ?auto_281213 ) ) ( not ( = ?auto_281211 ?auto_281214 ) ) ( not ( = ?auto_281211 ?auto_281215 ) ) ( not ( = ?auto_281211 ?auto_281216 ) ) ( not ( = ?auto_281211 ?auto_281217 ) ) ( not ( = ?auto_281211 ?auto_281218 ) ) ( not ( = ?auto_281211 ?auto_281219 ) ) ( not ( = ?auto_281211 ?auto_281220 ) ) ( not ( = ?auto_281211 ?auto_281221 ) ) ( not ( = ?auto_281211 ?auto_281222 ) ) ( not ( = ?auto_281212 ?auto_281213 ) ) ( not ( = ?auto_281212 ?auto_281214 ) ) ( not ( = ?auto_281212 ?auto_281215 ) ) ( not ( = ?auto_281212 ?auto_281216 ) ) ( not ( = ?auto_281212 ?auto_281217 ) ) ( not ( = ?auto_281212 ?auto_281218 ) ) ( not ( = ?auto_281212 ?auto_281219 ) ) ( not ( = ?auto_281212 ?auto_281220 ) ) ( not ( = ?auto_281212 ?auto_281221 ) ) ( not ( = ?auto_281212 ?auto_281222 ) ) ( not ( = ?auto_281213 ?auto_281214 ) ) ( not ( = ?auto_281213 ?auto_281215 ) ) ( not ( = ?auto_281213 ?auto_281216 ) ) ( not ( = ?auto_281213 ?auto_281217 ) ) ( not ( = ?auto_281213 ?auto_281218 ) ) ( not ( = ?auto_281213 ?auto_281219 ) ) ( not ( = ?auto_281213 ?auto_281220 ) ) ( not ( = ?auto_281213 ?auto_281221 ) ) ( not ( = ?auto_281213 ?auto_281222 ) ) ( not ( = ?auto_281214 ?auto_281215 ) ) ( not ( = ?auto_281214 ?auto_281216 ) ) ( not ( = ?auto_281214 ?auto_281217 ) ) ( not ( = ?auto_281214 ?auto_281218 ) ) ( not ( = ?auto_281214 ?auto_281219 ) ) ( not ( = ?auto_281214 ?auto_281220 ) ) ( not ( = ?auto_281214 ?auto_281221 ) ) ( not ( = ?auto_281214 ?auto_281222 ) ) ( not ( = ?auto_281215 ?auto_281216 ) ) ( not ( = ?auto_281215 ?auto_281217 ) ) ( not ( = ?auto_281215 ?auto_281218 ) ) ( not ( = ?auto_281215 ?auto_281219 ) ) ( not ( = ?auto_281215 ?auto_281220 ) ) ( not ( = ?auto_281215 ?auto_281221 ) ) ( not ( = ?auto_281215 ?auto_281222 ) ) ( not ( = ?auto_281216 ?auto_281217 ) ) ( not ( = ?auto_281216 ?auto_281218 ) ) ( not ( = ?auto_281216 ?auto_281219 ) ) ( not ( = ?auto_281216 ?auto_281220 ) ) ( not ( = ?auto_281216 ?auto_281221 ) ) ( not ( = ?auto_281216 ?auto_281222 ) ) ( not ( = ?auto_281217 ?auto_281218 ) ) ( not ( = ?auto_281217 ?auto_281219 ) ) ( not ( = ?auto_281217 ?auto_281220 ) ) ( not ( = ?auto_281217 ?auto_281221 ) ) ( not ( = ?auto_281217 ?auto_281222 ) ) ( not ( = ?auto_281218 ?auto_281219 ) ) ( not ( = ?auto_281218 ?auto_281220 ) ) ( not ( = ?auto_281218 ?auto_281221 ) ) ( not ( = ?auto_281218 ?auto_281222 ) ) ( not ( = ?auto_281219 ?auto_281220 ) ) ( not ( = ?auto_281219 ?auto_281221 ) ) ( not ( = ?auto_281219 ?auto_281222 ) ) ( not ( = ?auto_281220 ?auto_281221 ) ) ( not ( = ?auto_281220 ?auto_281222 ) ) ( not ( = ?auto_281221 ?auto_281222 ) ) ( ON ?auto_281220 ?auto_281221 ) ( ON ?auto_281219 ?auto_281220 ) ( ON ?auto_281218 ?auto_281219 ) ( ON ?auto_281217 ?auto_281218 ) ( ON ?auto_281216 ?auto_281217 ) ( ON ?auto_281215 ?auto_281216 ) ( CLEAR ?auto_281213 ) ( ON ?auto_281214 ?auto_281215 ) ( CLEAR ?auto_281214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_281211 ?auto_281212 ?auto_281213 ?auto_281214 )
      ( MAKE-11PILE ?auto_281211 ?auto_281212 ?auto_281213 ?auto_281214 ?auto_281215 ?auto_281216 ?auto_281217 ?auto_281218 ?auto_281219 ?auto_281220 ?auto_281221 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281234 - BLOCK
      ?auto_281235 - BLOCK
      ?auto_281236 - BLOCK
      ?auto_281237 - BLOCK
      ?auto_281238 - BLOCK
      ?auto_281239 - BLOCK
      ?auto_281240 - BLOCK
      ?auto_281241 - BLOCK
      ?auto_281242 - BLOCK
      ?auto_281243 - BLOCK
      ?auto_281244 - BLOCK
    )
    :vars
    (
      ?auto_281245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281244 ?auto_281245 ) ( ON-TABLE ?auto_281234 ) ( ON ?auto_281235 ?auto_281234 ) ( not ( = ?auto_281234 ?auto_281235 ) ) ( not ( = ?auto_281234 ?auto_281236 ) ) ( not ( = ?auto_281234 ?auto_281237 ) ) ( not ( = ?auto_281234 ?auto_281238 ) ) ( not ( = ?auto_281234 ?auto_281239 ) ) ( not ( = ?auto_281234 ?auto_281240 ) ) ( not ( = ?auto_281234 ?auto_281241 ) ) ( not ( = ?auto_281234 ?auto_281242 ) ) ( not ( = ?auto_281234 ?auto_281243 ) ) ( not ( = ?auto_281234 ?auto_281244 ) ) ( not ( = ?auto_281234 ?auto_281245 ) ) ( not ( = ?auto_281235 ?auto_281236 ) ) ( not ( = ?auto_281235 ?auto_281237 ) ) ( not ( = ?auto_281235 ?auto_281238 ) ) ( not ( = ?auto_281235 ?auto_281239 ) ) ( not ( = ?auto_281235 ?auto_281240 ) ) ( not ( = ?auto_281235 ?auto_281241 ) ) ( not ( = ?auto_281235 ?auto_281242 ) ) ( not ( = ?auto_281235 ?auto_281243 ) ) ( not ( = ?auto_281235 ?auto_281244 ) ) ( not ( = ?auto_281235 ?auto_281245 ) ) ( not ( = ?auto_281236 ?auto_281237 ) ) ( not ( = ?auto_281236 ?auto_281238 ) ) ( not ( = ?auto_281236 ?auto_281239 ) ) ( not ( = ?auto_281236 ?auto_281240 ) ) ( not ( = ?auto_281236 ?auto_281241 ) ) ( not ( = ?auto_281236 ?auto_281242 ) ) ( not ( = ?auto_281236 ?auto_281243 ) ) ( not ( = ?auto_281236 ?auto_281244 ) ) ( not ( = ?auto_281236 ?auto_281245 ) ) ( not ( = ?auto_281237 ?auto_281238 ) ) ( not ( = ?auto_281237 ?auto_281239 ) ) ( not ( = ?auto_281237 ?auto_281240 ) ) ( not ( = ?auto_281237 ?auto_281241 ) ) ( not ( = ?auto_281237 ?auto_281242 ) ) ( not ( = ?auto_281237 ?auto_281243 ) ) ( not ( = ?auto_281237 ?auto_281244 ) ) ( not ( = ?auto_281237 ?auto_281245 ) ) ( not ( = ?auto_281238 ?auto_281239 ) ) ( not ( = ?auto_281238 ?auto_281240 ) ) ( not ( = ?auto_281238 ?auto_281241 ) ) ( not ( = ?auto_281238 ?auto_281242 ) ) ( not ( = ?auto_281238 ?auto_281243 ) ) ( not ( = ?auto_281238 ?auto_281244 ) ) ( not ( = ?auto_281238 ?auto_281245 ) ) ( not ( = ?auto_281239 ?auto_281240 ) ) ( not ( = ?auto_281239 ?auto_281241 ) ) ( not ( = ?auto_281239 ?auto_281242 ) ) ( not ( = ?auto_281239 ?auto_281243 ) ) ( not ( = ?auto_281239 ?auto_281244 ) ) ( not ( = ?auto_281239 ?auto_281245 ) ) ( not ( = ?auto_281240 ?auto_281241 ) ) ( not ( = ?auto_281240 ?auto_281242 ) ) ( not ( = ?auto_281240 ?auto_281243 ) ) ( not ( = ?auto_281240 ?auto_281244 ) ) ( not ( = ?auto_281240 ?auto_281245 ) ) ( not ( = ?auto_281241 ?auto_281242 ) ) ( not ( = ?auto_281241 ?auto_281243 ) ) ( not ( = ?auto_281241 ?auto_281244 ) ) ( not ( = ?auto_281241 ?auto_281245 ) ) ( not ( = ?auto_281242 ?auto_281243 ) ) ( not ( = ?auto_281242 ?auto_281244 ) ) ( not ( = ?auto_281242 ?auto_281245 ) ) ( not ( = ?auto_281243 ?auto_281244 ) ) ( not ( = ?auto_281243 ?auto_281245 ) ) ( not ( = ?auto_281244 ?auto_281245 ) ) ( ON ?auto_281243 ?auto_281244 ) ( ON ?auto_281242 ?auto_281243 ) ( ON ?auto_281241 ?auto_281242 ) ( ON ?auto_281240 ?auto_281241 ) ( ON ?auto_281239 ?auto_281240 ) ( ON ?auto_281238 ?auto_281239 ) ( ON ?auto_281237 ?auto_281238 ) ( CLEAR ?auto_281235 ) ( ON ?auto_281236 ?auto_281237 ) ( CLEAR ?auto_281236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_281234 ?auto_281235 ?auto_281236 )
      ( MAKE-11PILE ?auto_281234 ?auto_281235 ?auto_281236 ?auto_281237 ?auto_281238 ?auto_281239 ?auto_281240 ?auto_281241 ?auto_281242 ?auto_281243 ?auto_281244 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281257 - BLOCK
      ?auto_281258 - BLOCK
      ?auto_281259 - BLOCK
      ?auto_281260 - BLOCK
      ?auto_281261 - BLOCK
      ?auto_281262 - BLOCK
      ?auto_281263 - BLOCK
      ?auto_281264 - BLOCK
      ?auto_281265 - BLOCK
      ?auto_281266 - BLOCK
      ?auto_281267 - BLOCK
    )
    :vars
    (
      ?auto_281268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281267 ?auto_281268 ) ( ON-TABLE ?auto_281257 ) ( ON ?auto_281258 ?auto_281257 ) ( not ( = ?auto_281257 ?auto_281258 ) ) ( not ( = ?auto_281257 ?auto_281259 ) ) ( not ( = ?auto_281257 ?auto_281260 ) ) ( not ( = ?auto_281257 ?auto_281261 ) ) ( not ( = ?auto_281257 ?auto_281262 ) ) ( not ( = ?auto_281257 ?auto_281263 ) ) ( not ( = ?auto_281257 ?auto_281264 ) ) ( not ( = ?auto_281257 ?auto_281265 ) ) ( not ( = ?auto_281257 ?auto_281266 ) ) ( not ( = ?auto_281257 ?auto_281267 ) ) ( not ( = ?auto_281257 ?auto_281268 ) ) ( not ( = ?auto_281258 ?auto_281259 ) ) ( not ( = ?auto_281258 ?auto_281260 ) ) ( not ( = ?auto_281258 ?auto_281261 ) ) ( not ( = ?auto_281258 ?auto_281262 ) ) ( not ( = ?auto_281258 ?auto_281263 ) ) ( not ( = ?auto_281258 ?auto_281264 ) ) ( not ( = ?auto_281258 ?auto_281265 ) ) ( not ( = ?auto_281258 ?auto_281266 ) ) ( not ( = ?auto_281258 ?auto_281267 ) ) ( not ( = ?auto_281258 ?auto_281268 ) ) ( not ( = ?auto_281259 ?auto_281260 ) ) ( not ( = ?auto_281259 ?auto_281261 ) ) ( not ( = ?auto_281259 ?auto_281262 ) ) ( not ( = ?auto_281259 ?auto_281263 ) ) ( not ( = ?auto_281259 ?auto_281264 ) ) ( not ( = ?auto_281259 ?auto_281265 ) ) ( not ( = ?auto_281259 ?auto_281266 ) ) ( not ( = ?auto_281259 ?auto_281267 ) ) ( not ( = ?auto_281259 ?auto_281268 ) ) ( not ( = ?auto_281260 ?auto_281261 ) ) ( not ( = ?auto_281260 ?auto_281262 ) ) ( not ( = ?auto_281260 ?auto_281263 ) ) ( not ( = ?auto_281260 ?auto_281264 ) ) ( not ( = ?auto_281260 ?auto_281265 ) ) ( not ( = ?auto_281260 ?auto_281266 ) ) ( not ( = ?auto_281260 ?auto_281267 ) ) ( not ( = ?auto_281260 ?auto_281268 ) ) ( not ( = ?auto_281261 ?auto_281262 ) ) ( not ( = ?auto_281261 ?auto_281263 ) ) ( not ( = ?auto_281261 ?auto_281264 ) ) ( not ( = ?auto_281261 ?auto_281265 ) ) ( not ( = ?auto_281261 ?auto_281266 ) ) ( not ( = ?auto_281261 ?auto_281267 ) ) ( not ( = ?auto_281261 ?auto_281268 ) ) ( not ( = ?auto_281262 ?auto_281263 ) ) ( not ( = ?auto_281262 ?auto_281264 ) ) ( not ( = ?auto_281262 ?auto_281265 ) ) ( not ( = ?auto_281262 ?auto_281266 ) ) ( not ( = ?auto_281262 ?auto_281267 ) ) ( not ( = ?auto_281262 ?auto_281268 ) ) ( not ( = ?auto_281263 ?auto_281264 ) ) ( not ( = ?auto_281263 ?auto_281265 ) ) ( not ( = ?auto_281263 ?auto_281266 ) ) ( not ( = ?auto_281263 ?auto_281267 ) ) ( not ( = ?auto_281263 ?auto_281268 ) ) ( not ( = ?auto_281264 ?auto_281265 ) ) ( not ( = ?auto_281264 ?auto_281266 ) ) ( not ( = ?auto_281264 ?auto_281267 ) ) ( not ( = ?auto_281264 ?auto_281268 ) ) ( not ( = ?auto_281265 ?auto_281266 ) ) ( not ( = ?auto_281265 ?auto_281267 ) ) ( not ( = ?auto_281265 ?auto_281268 ) ) ( not ( = ?auto_281266 ?auto_281267 ) ) ( not ( = ?auto_281266 ?auto_281268 ) ) ( not ( = ?auto_281267 ?auto_281268 ) ) ( ON ?auto_281266 ?auto_281267 ) ( ON ?auto_281265 ?auto_281266 ) ( ON ?auto_281264 ?auto_281265 ) ( ON ?auto_281263 ?auto_281264 ) ( ON ?auto_281262 ?auto_281263 ) ( ON ?auto_281261 ?auto_281262 ) ( ON ?auto_281260 ?auto_281261 ) ( CLEAR ?auto_281258 ) ( ON ?auto_281259 ?auto_281260 ) ( CLEAR ?auto_281259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_281257 ?auto_281258 ?auto_281259 )
      ( MAKE-11PILE ?auto_281257 ?auto_281258 ?auto_281259 ?auto_281260 ?auto_281261 ?auto_281262 ?auto_281263 ?auto_281264 ?auto_281265 ?auto_281266 ?auto_281267 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281280 - BLOCK
      ?auto_281281 - BLOCK
      ?auto_281282 - BLOCK
      ?auto_281283 - BLOCK
      ?auto_281284 - BLOCK
      ?auto_281285 - BLOCK
      ?auto_281286 - BLOCK
      ?auto_281287 - BLOCK
      ?auto_281288 - BLOCK
      ?auto_281289 - BLOCK
      ?auto_281290 - BLOCK
    )
    :vars
    (
      ?auto_281291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281290 ?auto_281291 ) ( ON-TABLE ?auto_281280 ) ( not ( = ?auto_281280 ?auto_281281 ) ) ( not ( = ?auto_281280 ?auto_281282 ) ) ( not ( = ?auto_281280 ?auto_281283 ) ) ( not ( = ?auto_281280 ?auto_281284 ) ) ( not ( = ?auto_281280 ?auto_281285 ) ) ( not ( = ?auto_281280 ?auto_281286 ) ) ( not ( = ?auto_281280 ?auto_281287 ) ) ( not ( = ?auto_281280 ?auto_281288 ) ) ( not ( = ?auto_281280 ?auto_281289 ) ) ( not ( = ?auto_281280 ?auto_281290 ) ) ( not ( = ?auto_281280 ?auto_281291 ) ) ( not ( = ?auto_281281 ?auto_281282 ) ) ( not ( = ?auto_281281 ?auto_281283 ) ) ( not ( = ?auto_281281 ?auto_281284 ) ) ( not ( = ?auto_281281 ?auto_281285 ) ) ( not ( = ?auto_281281 ?auto_281286 ) ) ( not ( = ?auto_281281 ?auto_281287 ) ) ( not ( = ?auto_281281 ?auto_281288 ) ) ( not ( = ?auto_281281 ?auto_281289 ) ) ( not ( = ?auto_281281 ?auto_281290 ) ) ( not ( = ?auto_281281 ?auto_281291 ) ) ( not ( = ?auto_281282 ?auto_281283 ) ) ( not ( = ?auto_281282 ?auto_281284 ) ) ( not ( = ?auto_281282 ?auto_281285 ) ) ( not ( = ?auto_281282 ?auto_281286 ) ) ( not ( = ?auto_281282 ?auto_281287 ) ) ( not ( = ?auto_281282 ?auto_281288 ) ) ( not ( = ?auto_281282 ?auto_281289 ) ) ( not ( = ?auto_281282 ?auto_281290 ) ) ( not ( = ?auto_281282 ?auto_281291 ) ) ( not ( = ?auto_281283 ?auto_281284 ) ) ( not ( = ?auto_281283 ?auto_281285 ) ) ( not ( = ?auto_281283 ?auto_281286 ) ) ( not ( = ?auto_281283 ?auto_281287 ) ) ( not ( = ?auto_281283 ?auto_281288 ) ) ( not ( = ?auto_281283 ?auto_281289 ) ) ( not ( = ?auto_281283 ?auto_281290 ) ) ( not ( = ?auto_281283 ?auto_281291 ) ) ( not ( = ?auto_281284 ?auto_281285 ) ) ( not ( = ?auto_281284 ?auto_281286 ) ) ( not ( = ?auto_281284 ?auto_281287 ) ) ( not ( = ?auto_281284 ?auto_281288 ) ) ( not ( = ?auto_281284 ?auto_281289 ) ) ( not ( = ?auto_281284 ?auto_281290 ) ) ( not ( = ?auto_281284 ?auto_281291 ) ) ( not ( = ?auto_281285 ?auto_281286 ) ) ( not ( = ?auto_281285 ?auto_281287 ) ) ( not ( = ?auto_281285 ?auto_281288 ) ) ( not ( = ?auto_281285 ?auto_281289 ) ) ( not ( = ?auto_281285 ?auto_281290 ) ) ( not ( = ?auto_281285 ?auto_281291 ) ) ( not ( = ?auto_281286 ?auto_281287 ) ) ( not ( = ?auto_281286 ?auto_281288 ) ) ( not ( = ?auto_281286 ?auto_281289 ) ) ( not ( = ?auto_281286 ?auto_281290 ) ) ( not ( = ?auto_281286 ?auto_281291 ) ) ( not ( = ?auto_281287 ?auto_281288 ) ) ( not ( = ?auto_281287 ?auto_281289 ) ) ( not ( = ?auto_281287 ?auto_281290 ) ) ( not ( = ?auto_281287 ?auto_281291 ) ) ( not ( = ?auto_281288 ?auto_281289 ) ) ( not ( = ?auto_281288 ?auto_281290 ) ) ( not ( = ?auto_281288 ?auto_281291 ) ) ( not ( = ?auto_281289 ?auto_281290 ) ) ( not ( = ?auto_281289 ?auto_281291 ) ) ( not ( = ?auto_281290 ?auto_281291 ) ) ( ON ?auto_281289 ?auto_281290 ) ( ON ?auto_281288 ?auto_281289 ) ( ON ?auto_281287 ?auto_281288 ) ( ON ?auto_281286 ?auto_281287 ) ( ON ?auto_281285 ?auto_281286 ) ( ON ?auto_281284 ?auto_281285 ) ( ON ?auto_281283 ?auto_281284 ) ( ON ?auto_281282 ?auto_281283 ) ( CLEAR ?auto_281280 ) ( ON ?auto_281281 ?auto_281282 ) ( CLEAR ?auto_281281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_281280 ?auto_281281 )
      ( MAKE-11PILE ?auto_281280 ?auto_281281 ?auto_281282 ?auto_281283 ?auto_281284 ?auto_281285 ?auto_281286 ?auto_281287 ?auto_281288 ?auto_281289 ?auto_281290 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281303 - BLOCK
      ?auto_281304 - BLOCK
      ?auto_281305 - BLOCK
      ?auto_281306 - BLOCK
      ?auto_281307 - BLOCK
      ?auto_281308 - BLOCK
      ?auto_281309 - BLOCK
      ?auto_281310 - BLOCK
      ?auto_281311 - BLOCK
      ?auto_281312 - BLOCK
      ?auto_281313 - BLOCK
    )
    :vars
    (
      ?auto_281314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281313 ?auto_281314 ) ( ON-TABLE ?auto_281303 ) ( not ( = ?auto_281303 ?auto_281304 ) ) ( not ( = ?auto_281303 ?auto_281305 ) ) ( not ( = ?auto_281303 ?auto_281306 ) ) ( not ( = ?auto_281303 ?auto_281307 ) ) ( not ( = ?auto_281303 ?auto_281308 ) ) ( not ( = ?auto_281303 ?auto_281309 ) ) ( not ( = ?auto_281303 ?auto_281310 ) ) ( not ( = ?auto_281303 ?auto_281311 ) ) ( not ( = ?auto_281303 ?auto_281312 ) ) ( not ( = ?auto_281303 ?auto_281313 ) ) ( not ( = ?auto_281303 ?auto_281314 ) ) ( not ( = ?auto_281304 ?auto_281305 ) ) ( not ( = ?auto_281304 ?auto_281306 ) ) ( not ( = ?auto_281304 ?auto_281307 ) ) ( not ( = ?auto_281304 ?auto_281308 ) ) ( not ( = ?auto_281304 ?auto_281309 ) ) ( not ( = ?auto_281304 ?auto_281310 ) ) ( not ( = ?auto_281304 ?auto_281311 ) ) ( not ( = ?auto_281304 ?auto_281312 ) ) ( not ( = ?auto_281304 ?auto_281313 ) ) ( not ( = ?auto_281304 ?auto_281314 ) ) ( not ( = ?auto_281305 ?auto_281306 ) ) ( not ( = ?auto_281305 ?auto_281307 ) ) ( not ( = ?auto_281305 ?auto_281308 ) ) ( not ( = ?auto_281305 ?auto_281309 ) ) ( not ( = ?auto_281305 ?auto_281310 ) ) ( not ( = ?auto_281305 ?auto_281311 ) ) ( not ( = ?auto_281305 ?auto_281312 ) ) ( not ( = ?auto_281305 ?auto_281313 ) ) ( not ( = ?auto_281305 ?auto_281314 ) ) ( not ( = ?auto_281306 ?auto_281307 ) ) ( not ( = ?auto_281306 ?auto_281308 ) ) ( not ( = ?auto_281306 ?auto_281309 ) ) ( not ( = ?auto_281306 ?auto_281310 ) ) ( not ( = ?auto_281306 ?auto_281311 ) ) ( not ( = ?auto_281306 ?auto_281312 ) ) ( not ( = ?auto_281306 ?auto_281313 ) ) ( not ( = ?auto_281306 ?auto_281314 ) ) ( not ( = ?auto_281307 ?auto_281308 ) ) ( not ( = ?auto_281307 ?auto_281309 ) ) ( not ( = ?auto_281307 ?auto_281310 ) ) ( not ( = ?auto_281307 ?auto_281311 ) ) ( not ( = ?auto_281307 ?auto_281312 ) ) ( not ( = ?auto_281307 ?auto_281313 ) ) ( not ( = ?auto_281307 ?auto_281314 ) ) ( not ( = ?auto_281308 ?auto_281309 ) ) ( not ( = ?auto_281308 ?auto_281310 ) ) ( not ( = ?auto_281308 ?auto_281311 ) ) ( not ( = ?auto_281308 ?auto_281312 ) ) ( not ( = ?auto_281308 ?auto_281313 ) ) ( not ( = ?auto_281308 ?auto_281314 ) ) ( not ( = ?auto_281309 ?auto_281310 ) ) ( not ( = ?auto_281309 ?auto_281311 ) ) ( not ( = ?auto_281309 ?auto_281312 ) ) ( not ( = ?auto_281309 ?auto_281313 ) ) ( not ( = ?auto_281309 ?auto_281314 ) ) ( not ( = ?auto_281310 ?auto_281311 ) ) ( not ( = ?auto_281310 ?auto_281312 ) ) ( not ( = ?auto_281310 ?auto_281313 ) ) ( not ( = ?auto_281310 ?auto_281314 ) ) ( not ( = ?auto_281311 ?auto_281312 ) ) ( not ( = ?auto_281311 ?auto_281313 ) ) ( not ( = ?auto_281311 ?auto_281314 ) ) ( not ( = ?auto_281312 ?auto_281313 ) ) ( not ( = ?auto_281312 ?auto_281314 ) ) ( not ( = ?auto_281313 ?auto_281314 ) ) ( ON ?auto_281312 ?auto_281313 ) ( ON ?auto_281311 ?auto_281312 ) ( ON ?auto_281310 ?auto_281311 ) ( ON ?auto_281309 ?auto_281310 ) ( ON ?auto_281308 ?auto_281309 ) ( ON ?auto_281307 ?auto_281308 ) ( ON ?auto_281306 ?auto_281307 ) ( ON ?auto_281305 ?auto_281306 ) ( CLEAR ?auto_281303 ) ( ON ?auto_281304 ?auto_281305 ) ( CLEAR ?auto_281304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_281303 ?auto_281304 )
      ( MAKE-11PILE ?auto_281303 ?auto_281304 ?auto_281305 ?auto_281306 ?auto_281307 ?auto_281308 ?auto_281309 ?auto_281310 ?auto_281311 ?auto_281312 ?auto_281313 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281326 - BLOCK
      ?auto_281327 - BLOCK
      ?auto_281328 - BLOCK
      ?auto_281329 - BLOCK
      ?auto_281330 - BLOCK
      ?auto_281331 - BLOCK
      ?auto_281332 - BLOCK
      ?auto_281333 - BLOCK
      ?auto_281334 - BLOCK
      ?auto_281335 - BLOCK
      ?auto_281336 - BLOCK
    )
    :vars
    (
      ?auto_281337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281336 ?auto_281337 ) ( not ( = ?auto_281326 ?auto_281327 ) ) ( not ( = ?auto_281326 ?auto_281328 ) ) ( not ( = ?auto_281326 ?auto_281329 ) ) ( not ( = ?auto_281326 ?auto_281330 ) ) ( not ( = ?auto_281326 ?auto_281331 ) ) ( not ( = ?auto_281326 ?auto_281332 ) ) ( not ( = ?auto_281326 ?auto_281333 ) ) ( not ( = ?auto_281326 ?auto_281334 ) ) ( not ( = ?auto_281326 ?auto_281335 ) ) ( not ( = ?auto_281326 ?auto_281336 ) ) ( not ( = ?auto_281326 ?auto_281337 ) ) ( not ( = ?auto_281327 ?auto_281328 ) ) ( not ( = ?auto_281327 ?auto_281329 ) ) ( not ( = ?auto_281327 ?auto_281330 ) ) ( not ( = ?auto_281327 ?auto_281331 ) ) ( not ( = ?auto_281327 ?auto_281332 ) ) ( not ( = ?auto_281327 ?auto_281333 ) ) ( not ( = ?auto_281327 ?auto_281334 ) ) ( not ( = ?auto_281327 ?auto_281335 ) ) ( not ( = ?auto_281327 ?auto_281336 ) ) ( not ( = ?auto_281327 ?auto_281337 ) ) ( not ( = ?auto_281328 ?auto_281329 ) ) ( not ( = ?auto_281328 ?auto_281330 ) ) ( not ( = ?auto_281328 ?auto_281331 ) ) ( not ( = ?auto_281328 ?auto_281332 ) ) ( not ( = ?auto_281328 ?auto_281333 ) ) ( not ( = ?auto_281328 ?auto_281334 ) ) ( not ( = ?auto_281328 ?auto_281335 ) ) ( not ( = ?auto_281328 ?auto_281336 ) ) ( not ( = ?auto_281328 ?auto_281337 ) ) ( not ( = ?auto_281329 ?auto_281330 ) ) ( not ( = ?auto_281329 ?auto_281331 ) ) ( not ( = ?auto_281329 ?auto_281332 ) ) ( not ( = ?auto_281329 ?auto_281333 ) ) ( not ( = ?auto_281329 ?auto_281334 ) ) ( not ( = ?auto_281329 ?auto_281335 ) ) ( not ( = ?auto_281329 ?auto_281336 ) ) ( not ( = ?auto_281329 ?auto_281337 ) ) ( not ( = ?auto_281330 ?auto_281331 ) ) ( not ( = ?auto_281330 ?auto_281332 ) ) ( not ( = ?auto_281330 ?auto_281333 ) ) ( not ( = ?auto_281330 ?auto_281334 ) ) ( not ( = ?auto_281330 ?auto_281335 ) ) ( not ( = ?auto_281330 ?auto_281336 ) ) ( not ( = ?auto_281330 ?auto_281337 ) ) ( not ( = ?auto_281331 ?auto_281332 ) ) ( not ( = ?auto_281331 ?auto_281333 ) ) ( not ( = ?auto_281331 ?auto_281334 ) ) ( not ( = ?auto_281331 ?auto_281335 ) ) ( not ( = ?auto_281331 ?auto_281336 ) ) ( not ( = ?auto_281331 ?auto_281337 ) ) ( not ( = ?auto_281332 ?auto_281333 ) ) ( not ( = ?auto_281332 ?auto_281334 ) ) ( not ( = ?auto_281332 ?auto_281335 ) ) ( not ( = ?auto_281332 ?auto_281336 ) ) ( not ( = ?auto_281332 ?auto_281337 ) ) ( not ( = ?auto_281333 ?auto_281334 ) ) ( not ( = ?auto_281333 ?auto_281335 ) ) ( not ( = ?auto_281333 ?auto_281336 ) ) ( not ( = ?auto_281333 ?auto_281337 ) ) ( not ( = ?auto_281334 ?auto_281335 ) ) ( not ( = ?auto_281334 ?auto_281336 ) ) ( not ( = ?auto_281334 ?auto_281337 ) ) ( not ( = ?auto_281335 ?auto_281336 ) ) ( not ( = ?auto_281335 ?auto_281337 ) ) ( not ( = ?auto_281336 ?auto_281337 ) ) ( ON ?auto_281335 ?auto_281336 ) ( ON ?auto_281334 ?auto_281335 ) ( ON ?auto_281333 ?auto_281334 ) ( ON ?auto_281332 ?auto_281333 ) ( ON ?auto_281331 ?auto_281332 ) ( ON ?auto_281330 ?auto_281331 ) ( ON ?auto_281329 ?auto_281330 ) ( ON ?auto_281328 ?auto_281329 ) ( ON ?auto_281327 ?auto_281328 ) ( ON ?auto_281326 ?auto_281327 ) ( CLEAR ?auto_281326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_281326 )
      ( MAKE-11PILE ?auto_281326 ?auto_281327 ?auto_281328 ?auto_281329 ?auto_281330 ?auto_281331 ?auto_281332 ?auto_281333 ?auto_281334 ?auto_281335 ?auto_281336 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_281349 - BLOCK
      ?auto_281350 - BLOCK
      ?auto_281351 - BLOCK
      ?auto_281352 - BLOCK
      ?auto_281353 - BLOCK
      ?auto_281354 - BLOCK
      ?auto_281355 - BLOCK
      ?auto_281356 - BLOCK
      ?auto_281357 - BLOCK
      ?auto_281358 - BLOCK
      ?auto_281359 - BLOCK
    )
    :vars
    (
      ?auto_281360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281359 ?auto_281360 ) ( not ( = ?auto_281349 ?auto_281350 ) ) ( not ( = ?auto_281349 ?auto_281351 ) ) ( not ( = ?auto_281349 ?auto_281352 ) ) ( not ( = ?auto_281349 ?auto_281353 ) ) ( not ( = ?auto_281349 ?auto_281354 ) ) ( not ( = ?auto_281349 ?auto_281355 ) ) ( not ( = ?auto_281349 ?auto_281356 ) ) ( not ( = ?auto_281349 ?auto_281357 ) ) ( not ( = ?auto_281349 ?auto_281358 ) ) ( not ( = ?auto_281349 ?auto_281359 ) ) ( not ( = ?auto_281349 ?auto_281360 ) ) ( not ( = ?auto_281350 ?auto_281351 ) ) ( not ( = ?auto_281350 ?auto_281352 ) ) ( not ( = ?auto_281350 ?auto_281353 ) ) ( not ( = ?auto_281350 ?auto_281354 ) ) ( not ( = ?auto_281350 ?auto_281355 ) ) ( not ( = ?auto_281350 ?auto_281356 ) ) ( not ( = ?auto_281350 ?auto_281357 ) ) ( not ( = ?auto_281350 ?auto_281358 ) ) ( not ( = ?auto_281350 ?auto_281359 ) ) ( not ( = ?auto_281350 ?auto_281360 ) ) ( not ( = ?auto_281351 ?auto_281352 ) ) ( not ( = ?auto_281351 ?auto_281353 ) ) ( not ( = ?auto_281351 ?auto_281354 ) ) ( not ( = ?auto_281351 ?auto_281355 ) ) ( not ( = ?auto_281351 ?auto_281356 ) ) ( not ( = ?auto_281351 ?auto_281357 ) ) ( not ( = ?auto_281351 ?auto_281358 ) ) ( not ( = ?auto_281351 ?auto_281359 ) ) ( not ( = ?auto_281351 ?auto_281360 ) ) ( not ( = ?auto_281352 ?auto_281353 ) ) ( not ( = ?auto_281352 ?auto_281354 ) ) ( not ( = ?auto_281352 ?auto_281355 ) ) ( not ( = ?auto_281352 ?auto_281356 ) ) ( not ( = ?auto_281352 ?auto_281357 ) ) ( not ( = ?auto_281352 ?auto_281358 ) ) ( not ( = ?auto_281352 ?auto_281359 ) ) ( not ( = ?auto_281352 ?auto_281360 ) ) ( not ( = ?auto_281353 ?auto_281354 ) ) ( not ( = ?auto_281353 ?auto_281355 ) ) ( not ( = ?auto_281353 ?auto_281356 ) ) ( not ( = ?auto_281353 ?auto_281357 ) ) ( not ( = ?auto_281353 ?auto_281358 ) ) ( not ( = ?auto_281353 ?auto_281359 ) ) ( not ( = ?auto_281353 ?auto_281360 ) ) ( not ( = ?auto_281354 ?auto_281355 ) ) ( not ( = ?auto_281354 ?auto_281356 ) ) ( not ( = ?auto_281354 ?auto_281357 ) ) ( not ( = ?auto_281354 ?auto_281358 ) ) ( not ( = ?auto_281354 ?auto_281359 ) ) ( not ( = ?auto_281354 ?auto_281360 ) ) ( not ( = ?auto_281355 ?auto_281356 ) ) ( not ( = ?auto_281355 ?auto_281357 ) ) ( not ( = ?auto_281355 ?auto_281358 ) ) ( not ( = ?auto_281355 ?auto_281359 ) ) ( not ( = ?auto_281355 ?auto_281360 ) ) ( not ( = ?auto_281356 ?auto_281357 ) ) ( not ( = ?auto_281356 ?auto_281358 ) ) ( not ( = ?auto_281356 ?auto_281359 ) ) ( not ( = ?auto_281356 ?auto_281360 ) ) ( not ( = ?auto_281357 ?auto_281358 ) ) ( not ( = ?auto_281357 ?auto_281359 ) ) ( not ( = ?auto_281357 ?auto_281360 ) ) ( not ( = ?auto_281358 ?auto_281359 ) ) ( not ( = ?auto_281358 ?auto_281360 ) ) ( not ( = ?auto_281359 ?auto_281360 ) ) ( ON ?auto_281358 ?auto_281359 ) ( ON ?auto_281357 ?auto_281358 ) ( ON ?auto_281356 ?auto_281357 ) ( ON ?auto_281355 ?auto_281356 ) ( ON ?auto_281354 ?auto_281355 ) ( ON ?auto_281353 ?auto_281354 ) ( ON ?auto_281352 ?auto_281353 ) ( ON ?auto_281351 ?auto_281352 ) ( ON ?auto_281350 ?auto_281351 ) ( ON ?auto_281349 ?auto_281350 ) ( CLEAR ?auto_281349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_281349 )
      ( MAKE-11PILE ?auto_281349 ?auto_281350 ?auto_281351 ?auto_281352 ?auto_281353 ?auto_281354 ?auto_281355 ?auto_281356 ?auto_281357 ?auto_281358 ?auto_281359 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281373 - BLOCK
      ?auto_281374 - BLOCK
      ?auto_281375 - BLOCK
      ?auto_281376 - BLOCK
      ?auto_281377 - BLOCK
      ?auto_281378 - BLOCK
      ?auto_281379 - BLOCK
      ?auto_281380 - BLOCK
      ?auto_281381 - BLOCK
      ?auto_281382 - BLOCK
      ?auto_281383 - BLOCK
      ?auto_281384 - BLOCK
    )
    :vars
    (
      ?auto_281385 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_281383 ) ( ON ?auto_281384 ?auto_281385 ) ( CLEAR ?auto_281384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_281373 ) ( ON ?auto_281374 ?auto_281373 ) ( ON ?auto_281375 ?auto_281374 ) ( ON ?auto_281376 ?auto_281375 ) ( ON ?auto_281377 ?auto_281376 ) ( ON ?auto_281378 ?auto_281377 ) ( ON ?auto_281379 ?auto_281378 ) ( ON ?auto_281380 ?auto_281379 ) ( ON ?auto_281381 ?auto_281380 ) ( ON ?auto_281382 ?auto_281381 ) ( ON ?auto_281383 ?auto_281382 ) ( not ( = ?auto_281373 ?auto_281374 ) ) ( not ( = ?auto_281373 ?auto_281375 ) ) ( not ( = ?auto_281373 ?auto_281376 ) ) ( not ( = ?auto_281373 ?auto_281377 ) ) ( not ( = ?auto_281373 ?auto_281378 ) ) ( not ( = ?auto_281373 ?auto_281379 ) ) ( not ( = ?auto_281373 ?auto_281380 ) ) ( not ( = ?auto_281373 ?auto_281381 ) ) ( not ( = ?auto_281373 ?auto_281382 ) ) ( not ( = ?auto_281373 ?auto_281383 ) ) ( not ( = ?auto_281373 ?auto_281384 ) ) ( not ( = ?auto_281373 ?auto_281385 ) ) ( not ( = ?auto_281374 ?auto_281375 ) ) ( not ( = ?auto_281374 ?auto_281376 ) ) ( not ( = ?auto_281374 ?auto_281377 ) ) ( not ( = ?auto_281374 ?auto_281378 ) ) ( not ( = ?auto_281374 ?auto_281379 ) ) ( not ( = ?auto_281374 ?auto_281380 ) ) ( not ( = ?auto_281374 ?auto_281381 ) ) ( not ( = ?auto_281374 ?auto_281382 ) ) ( not ( = ?auto_281374 ?auto_281383 ) ) ( not ( = ?auto_281374 ?auto_281384 ) ) ( not ( = ?auto_281374 ?auto_281385 ) ) ( not ( = ?auto_281375 ?auto_281376 ) ) ( not ( = ?auto_281375 ?auto_281377 ) ) ( not ( = ?auto_281375 ?auto_281378 ) ) ( not ( = ?auto_281375 ?auto_281379 ) ) ( not ( = ?auto_281375 ?auto_281380 ) ) ( not ( = ?auto_281375 ?auto_281381 ) ) ( not ( = ?auto_281375 ?auto_281382 ) ) ( not ( = ?auto_281375 ?auto_281383 ) ) ( not ( = ?auto_281375 ?auto_281384 ) ) ( not ( = ?auto_281375 ?auto_281385 ) ) ( not ( = ?auto_281376 ?auto_281377 ) ) ( not ( = ?auto_281376 ?auto_281378 ) ) ( not ( = ?auto_281376 ?auto_281379 ) ) ( not ( = ?auto_281376 ?auto_281380 ) ) ( not ( = ?auto_281376 ?auto_281381 ) ) ( not ( = ?auto_281376 ?auto_281382 ) ) ( not ( = ?auto_281376 ?auto_281383 ) ) ( not ( = ?auto_281376 ?auto_281384 ) ) ( not ( = ?auto_281376 ?auto_281385 ) ) ( not ( = ?auto_281377 ?auto_281378 ) ) ( not ( = ?auto_281377 ?auto_281379 ) ) ( not ( = ?auto_281377 ?auto_281380 ) ) ( not ( = ?auto_281377 ?auto_281381 ) ) ( not ( = ?auto_281377 ?auto_281382 ) ) ( not ( = ?auto_281377 ?auto_281383 ) ) ( not ( = ?auto_281377 ?auto_281384 ) ) ( not ( = ?auto_281377 ?auto_281385 ) ) ( not ( = ?auto_281378 ?auto_281379 ) ) ( not ( = ?auto_281378 ?auto_281380 ) ) ( not ( = ?auto_281378 ?auto_281381 ) ) ( not ( = ?auto_281378 ?auto_281382 ) ) ( not ( = ?auto_281378 ?auto_281383 ) ) ( not ( = ?auto_281378 ?auto_281384 ) ) ( not ( = ?auto_281378 ?auto_281385 ) ) ( not ( = ?auto_281379 ?auto_281380 ) ) ( not ( = ?auto_281379 ?auto_281381 ) ) ( not ( = ?auto_281379 ?auto_281382 ) ) ( not ( = ?auto_281379 ?auto_281383 ) ) ( not ( = ?auto_281379 ?auto_281384 ) ) ( not ( = ?auto_281379 ?auto_281385 ) ) ( not ( = ?auto_281380 ?auto_281381 ) ) ( not ( = ?auto_281380 ?auto_281382 ) ) ( not ( = ?auto_281380 ?auto_281383 ) ) ( not ( = ?auto_281380 ?auto_281384 ) ) ( not ( = ?auto_281380 ?auto_281385 ) ) ( not ( = ?auto_281381 ?auto_281382 ) ) ( not ( = ?auto_281381 ?auto_281383 ) ) ( not ( = ?auto_281381 ?auto_281384 ) ) ( not ( = ?auto_281381 ?auto_281385 ) ) ( not ( = ?auto_281382 ?auto_281383 ) ) ( not ( = ?auto_281382 ?auto_281384 ) ) ( not ( = ?auto_281382 ?auto_281385 ) ) ( not ( = ?auto_281383 ?auto_281384 ) ) ( not ( = ?auto_281383 ?auto_281385 ) ) ( not ( = ?auto_281384 ?auto_281385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_281384 ?auto_281385 )
      ( !STACK ?auto_281384 ?auto_281383 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281398 - BLOCK
      ?auto_281399 - BLOCK
      ?auto_281400 - BLOCK
      ?auto_281401 - BLOCK
      ?auto_281402 - BLOCK
      ?auto_281403 - BLOCK
      ?auto_281404 - BLOCK
      ?auto_281405 - BLOCK
      ?auto_281406 - BLOCK
      ?auto_281407 - BLOCK
      ?auto_281408 - BLOCK
      ?auto_281409 - BLOCK
    )
    :vars
    (
      ?auto_281410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_281408 ) ( ON ?auto_281409 ?auto_281410 ) ( CLEAR ?auto_281409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_281398 ) ( ON ?auto_281399 ?auto_281398 ) ( ON ?auto_281400 ?auto_281399 ) ( ON ?auto_281401 ?auto_281400 ) ( ON ?auto_281402 ?auto_281401 ) ( ON ?auto_281403 ?auto_281402 ) ( ON ?auto_281404 ?auto_281403 ) ( ON ?auto_281405 ?auto_281404 ) ( ON ?auto_281406 ?auto_281405 ) ( ON ?auto_281407 ?auto_281406 ) ( ON ?auto_281408 ?auto_281407 ) ( not ( = ?auto_281398 ?auto_281399 ) ) ( not ( = ?auto_281398 ?auto_281400 ) ) ( not ( = ?auto_281398 ?auto_281401 ) ) ( not ( = ?auto_281398 ?auto_281402 ) ) ( not ( = ?auto_281398 ?auto_281403 ) ) ( not ( = ?auto_281398 ?auto_281404 ) ) ( not ( = ?auto_281398 ?auto_281405 ) ) ( not ( = ?auto_281398 ?auto_281406 ) ) ( not ( = ?auto_281398 ?auto_281407 ) ) ( not ( = ?auto_281398 ?auto_281408 ) ) ( not ( = ?auto_281398 ?auto_281409 ) ) ( not ( = ?auto_281398 ?auto_281410 ) ) ( not ( = ?auto_281399 ?auto_281400 ) ) ( not ( = ?auto_281399 ?auto_281401 ) ) ( not ( = ?auto_281399 ?auto_281402 ) ) ( not ( = ?auto_281399 ?auto_281403 ) ) ( not ( = ?auto_281399 ?auto_281404 ) ) ( not ( = ?auto_281399 ?auto_281405 ) ) ( not ( = ?auto_281399 ?auto_281406 ) ) ( not ( = ?auto_281399 ?auto_281407 ) ) ( not ( = ?auto_281399 ?auto_281408 ) ) ( not ( = ?auto_281399 ?auto_281409 ) ) ( not ( = ?auto_281399 ?auto_281410 ) ) ( not ( = ?auto_281400 ?auto_281401 ) ) ( not ( = ?auto_281400 ?auto_281402 ) ) ( not ( = ?auto_281400 ?auto_281403 ) ) ( not ( = ?auto_281400 ?auto_281404 ) ) ( not ( = ?auto_281400 ?auto_281405 ) ) ( not ( = ?auto_281400 ?auto_281406 ) ) ( not ( = ?auto_281400 ?auto_281407 ) ) ( not ( = ?auto_281400 ?auto_281408 ) ) ( not ( = ?auto_281400 ?auto_281409 ) ) ( not ( = ?auto_281400 ?auto_281410 ) ) ( not ( = ?auto_281401 ?auto_281402 ) ) ( not ( = ?auto_281401 ?auto_281403 ) ) ( not ( = ?auto_281401 ?auto_281404 ) ) ( not ( = ?auto_281401 ?auto_281405 ) ) ( not ( = ?auto_281401 ?auto_281406 ) ) ( not ( = ?auto_281401 ?auto_281407 ) ) ( not ( = ?auto_281401 ?auto_281408 ) ) ( not ( = ?auto_281401 ?auto_281409 ) ) ( not ( = ?auto_281401 ?auto_281410 ) ) ( not ( = ?auto_281402 ?auto_281403 ) ) ( not ( = ?auto_281402 ?auto_281404 ) ) ( not ( = ?auto_281402 ?auto_281405 ) ) ( not ( = ?auto_281402 ?auto_281406 ) ) ( not ( = ?auto_281402 ?auto_281407 ) ) ( not ( = ?auto_281402 ?auto_281408 ) ) ( not ( = ?auto_281402 ?auto_281409 ) ) ( not ( = ?auto_281402 ?auto_281410 ) ) ( not ( = ?auto_281403 ?auto_281404 ) ) ( not ( = ?auto_281403 ?auto_281405 ) ) ( not ( = ?auto_281403 ?auto_281406 ) ) ( not ( = ?auto_281403 ?auto_281407 ) ) ( not ( = ?auto_281403 ?auto_281408 ) ) ( not ( = ?auto_281403 ?auto_281409 ) ) ( not ( = ?auto_281403 ?auto_281410 ) ) ( not ( = ?auto_281404 ?auto_281405 ) ) ( not ( = ?auto_281404 ?auto_281406 ) ) ( not ( = ?auto_281404 ?auto_281407 ) ) ( not ( = ?auto_281404 ?auto_281408 ) ) ( not ( = ?auto_281404 ?auto_281409 ) ) ( not ( = ?auto_281404 ?auto_281410 ) ) ( not ( = ?auto_281405 ?auto_281406 ) ) ( not ( = ?auto_281405 ?auto_281407 ) ) ( not ( = ?auto_281405 ?auto_281408 ) ) ( not ( = ?auto_281405 ?auto_281409 ) ) ( not ( = ?auto_281405 ?auto_281410 ) ) ( not ( = ?auto_281406 ?auto_281407 ) ) ( not ( = ?auto_281406 ?auto_281408 ) ) ( not ( = ?auto_281406 ?auto_281409 ) ) ( not ( = ?auto_281406 ?auto_281410 ) ) ( not ( = ?auto_281407 ?auto_281408 ) ) ( not ( = ?auto_281407 ?auto_281409 ) ) ( not ( = ?auto_281407 ?auto_281410 ) ) ( not ( = ?auto_281408 ?auto_281409 ) ) ( not ( = ?auto_281408 ?auto_281410 ) ) ( not ( = ?auto_281409 ?auto_281410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_281409 ?auto_281410 )
      ( !STACK ?auto_281409 ?auto_281408 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281423 - BLOCK
      ?auto_281424 - BLOCK
      ?auto_281425 - BLOCK
      ?auto_281426 - BLOCK
      ?auto_281427 - BLOCK
      ?auto_281428 - BLOCK
      ?auto_281429 - BLOCK
      ?auto_281430 - BLOCK
      ?auto_281431 - BLOCK
      ?auto_281432 - BLOCK
      ?auto_281433 - BLOCK
      ?auto_281434 - BLOCK
    )
    :vars
    (
      ?auto_281435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281434 ?auto_281435 ) ( ON-TABLE ?auto_281423 ) ( ON ?auto_281424 ?auto_281423 ) ( ON ?auto_281425 ?auto_281424 ) ( ON ?auto_281426 ?auto_281425 ) ( ON ?auto_281427 ?auto_281426 ) ( ON ?auto_281428 ?auto_281427 ) ( ON ?auto_281429 ?auto_281428 ) ( ON ?auto_281430 ?auto_281429 ) ( ON ?auto_281431 ?auto_281430 ) ( ON ?auto_281432 ?auto_281431 ) ( not ( = ?auto_281423 ?auto_281424 ) ) ( not ( = ?auto_281423 ?auto_281425 ) ) ( not ( = ?auto_281423 ?auto_281426 ) ) ( not ( = ?auto_281423 ?auto_281427 ) ) ( not ( = ?auto_281423 ?auto_281428 ) ) ( not ( = ?auto_281423 ?auto_281429 ) ) ( not ( = ?auto_281423 ?auto_281430 ) ) ( not ( = ?auto_281423 ?auto_281431 ) ) ( not ( = ?auto_281423 ?auto_281432 ) ) ( not ( = ?auto_281423 ?auto_281433 ) ) ( not ( = ?auto_281423 ?auto_281434 ) ) ( not ( = ?auto_281423 ?auto_281435 ) ) ( not ( = ?auto_281424 ?auto_281425 ) ) ( not ( = ?auto_281424 ?auto_281426 ) ) ( not ( = ?auto_281424 ?auto_281427 ) ) ( not ( = ?auto_281424 ?auto_281428 ) ) ( not ( = ?auto_281424 ?auto_281429 ) ) ( not ( = ?auto_281424 ?auto_281430 ) ) ( not ( = ?auto_281424 ?auto_281431 ) ) ( not ( = ?auto_281424 ?auto_281432 ) ) ( not ( = ?auto_281424 ?auto_281433 ) ) ( not ( = ?auto_281424 ?auto_281434 ) ) ( not ( = ?auto_281424 ?auto_281435 ) ) ( not ( = ?auto_281425 ?auto_281426 ) ) ( not ( = ?auto_281425 ?auto_281427 ) ) ( not ( = ?auto_281425 ?auto_281428 ) ) ( not ( = ?auto_281425 ?auto_281429 ) ) ( not ( = ?auto_281425 ?auto_281430 ) ) ( not ( = ?auto_281425 ?auto_281431 ) ) ( not ( = ?auto_281425 ?auto_281432 ) ) ( not ( = ?auto_281425 ?auto_281433 ) ) ( not ( = ?auto_281425 ?auto_281434 ) ) ( not ( = ?auto_281425 ?auto_281435 ) ) ( not ( = ?auto_281426 ?auto_281427 ) ) ( not ( = ?auto_281426 ?auto_281428 ) ) ( not ( = ?auto_281426 ?auto_281429 ) ) ( not ( = ?auto_281426 ?auto_281430 ) ) ( not ( = ?auto_281426 ?auto_281431 ) ) ( not ( = ?auto_281426 ?auto_281432 ) ) ( not ( = ?auto_281426 ?auto_281433 ) ) ( not ( = ?auto_281426 ?auto_281434 ) ) ( not ( = ?auto_281426 ?auto_281435 ) ) ( not ( = ?auto_281427 ?auto_281428 ) ) ( not ( = ?auto_281427 ?auto_281429 ) ) ( not ( = ?auto_281427 ?auto_281430 ) ) ( not ( = ?auto_281427 ?auto_281431 ) ) ( not ( = ?auto_281427 ?auto_281432 ) ) ( not ( = ?auto_281427 ?auto_281433 ) ) ( not ( = ?auto_281427 ?auto_281434 ) ) ( not ( = ?auto_281427 ?auto_281435 ) ) ( not ( = ?auto_281428 ?auto_281429 ) ) ( not ( = ?auto_281428 ?auto_281430 ) ) ( not ( = ?auto_281428 ?auto_281431 ) ) ( not ( = ?auto_281428 ?auto_281432 ) ) ( not ( = ?auto_281428 ?auto_281433 ) ) ( not ( = ?auto_281428 ?auto_281434 ) ) ( not ( = ?auto_281428 ?auto_281435 ) ) ( not ( = ?auto_281429 ?auto_281430 ) ) ( not ( = ?auto_281429 ?auto_281431 ) ) ( not ( = ?auto_281429 ?auto_281432 ) ) ( not ( = ?auto_281429 ?auto_281433 ) ) ( not ( = ?auto_281429 ?auto_281434 ) ) ( not ( = ?auto_281429 ?auto_281435 ) ) ( not ( = ?auto_281430 ?auto_281431 ) ) ( not ( = ?auto_281430 ?auto_281432 ) ) ( not ( = ?auto_281430 ?auto_281433 ) ) ( not ( = ?auto_281430 ?auto_281434 ) ) ( not ( = ?auto_281430 ?auto_281435 ) ) ( not ( = ?auto_281431 ?auto_281432 ) ) ( not ( = ?auto_281431 ?auto_281433 ) ) ( not ( = ?auto_281431 ?auto_281434 ) ) ( not ( = ?auto_281431 ?auto_281435 ) ) ( not ( = ?auto_281432 ?auto_281433 ) ) ( not ( = ?auto_281432 ?auto_281434 ) ) ( not ( = ?auto_281432 ?auto_281435 ) ) ( not ( = ?auto_281433 ?auto_281434 ) ) ( not ( = ?auto_281433 ?auto_281435 ) ) ( not ( = ?auto_281434 ?auto_281435 ) ) ( CLEAR ?auto_281432 ) ( ON ?auto_281433 ?auto_281434 ) ( CLEAR ?auto_281433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_281423 ?auto_281424 ?auto_281425 ?auto_281426 ?auto_281427 ?auto_281428 ?auto_281429 ?auto_281430 ?auto_281431 ?auto_281432 ?auto_281433 )
      ( MAKE-12PILE ?auto_281423 ?auto_281424 ?auto_281425 ?auto_281426 ?auto_281427 ?auto_281428 ?auto_281429 ?auto_281430 ?auto_281431 ?auto_281432 ?auto_281433 ?auto_281434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281448 - BLOCK
      ?auto_281449 - BLOCK
      ?auto_281450 - BLOCK
      ?auto_281451 - BLOCK
      ?auto_281452 - BLOCK
      ?auto_281453 - BLOCK
      ?auto_281454 - BLOCK
      ?auto_281455 - BLOCK
      ?auto_281456 - BLOCK
      ?auto_281457 - BLOCK
      ?auto_281458 - BLOCK
      ?auto_281459 - BLOCK
    )
    :vars
    (
      ?auto_281460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281459 ?auto_281460 ) ( ON-TABLE ?auto_281448 ) ( ON ?auto_281449 ?auto_281448 ) ( ON ?auto_281450 ?auto_281449 ) ( ON ?auto_281451 ?auto_281450 ) ( ON ?auto_281452 ?auto_281451 ) ( ON ?auto_281453 ?auto_281452 ) ( ON ?auto_281454 ?auto_281453 ) ( ON ?auto_281455 ?auto_281454 ) ( ON ?auto_281456 ?auto_281455 ) ( ON ?auto_281457 ?auto_281456 ) ( not ( = ?auto_281448 ?auto_281449 ) ) ( not ( = ?auto_281448 ?auto_281450 ) ) ( not ( = ?auto_281448 ?auto_281451 ) ) ( not ( = ?auto_281448 ?auto_281452 ) ) ( not ( = ?auto_281448 ?auto_281453 ) ) ( not ( = ?auto_281448 ?auto_281454 ) ) ( not ( = ?auto_281448 ?auto_281455 ) ) ( not ( = ?auto_281448 ?auto_281456 ) ) ( not ( = ?auto_281448 ?auto_281457 ) ) ( not ( = ?auto_281448 ?auto_281458 ) ) ( not ( = ?auto_281448 ?auto_281459 ) ) ( not ( = ?auto_281448 ?auto_281460 ) ) ( not ( = ?auto_281449 ?auto_281450 ) ) ( not ( = ?auto_281449 ?auto_281451 ) ) ( not ( = ?auto_281449 ?auto_281452 ) ) ( not ( = ?auto_281449 ?auto_281453 ) ) ( not ( = ?auto_281449 ?auto_281454 ) ) ( not ( = ?auto_281449 ?auto_281455 ) ) ( not ( = ?auto_281449 ?auto_281456 ) ) ( not ( = ?auto_281449 ?auto_281457 ) ) ( not ( = ?auto_281449 ?auto_281458 ) ) ( not ( = ?auto_281449 ?auto_281459 ) ) ( not ( = ?auto_281449 ?auto_281460 ) ) ( not ( = ?auto_281450 ?auto_281451 ) ) ( not ( = ?auto_281450 ?auto_281452 ) ) ( not ( = ?auto_281450 ?auto_281453 ) ) ( not ( = ?auto_281450 ?auto_281454 ) ) ( not ( = ?auto_281450 ?auto_281455 ) ) ( not ( = ?auto_281450 ?auto_281456 ) ) ( not ( = ?auto_281450 ?auto_281457 ) ) ( not ( = ?auto_281450 ?auto_281458 ) ) ( not ( = ?auto_281450 ?auto_281459 ) ) ( not ( = ?auto_281450 ?auto_281460 ) ) ( not ( = ?auto_281451 ?auto_281452 ) ) ( not ( = ?auto_281451 ?auto_281453 ) ) ( not ( = ?auto_281451 ?auto_281454 ) ) ( not ( = ?auto_281451 ?auto_281455 ) ) ( not ( = ?auto_281451 ?auto_281456 ) ) ( not ( = ?auto_281451 ?auto_281457 ) ) ( not ( = ?auto_281451 ?auto_281458 ) ) ( not ( = ?auto_281451 ?auto_281459 ) ) ( not ( = ?auto_281451 ?auto_281460 ) ) ( not ( = ?auto_281452 ?auto_281453 ) ) ( not ( = ?auto_281452 ?auto_281454 ) ) ( not ( = ?auto_281452 ?auto_281455 ) ) ( not ( = ?auto_281452 ?auto_281456 ) ) ( not ( = ?auto_281452 ?auto_281457 ) ) ( not ( = ?auto_281452 ?auto_281458 ) ) ( not ( = ?auto_281452 ?auto_281459 ) ) ( not ( = ?auto_281452 ?auto_281460 ) ) ( not ( = ?auto_281453 ?auto_281454 ) ) ( not ( = ?auto_281453 ?auto_281455 ) ) ( not ( = ?auto_281453 ?auto_281456 ) ) ( not ( = ?auto_281453 ?auto_281457 ) ) ( not ( = ?auto_281453 ?auto_281458 ) ) ( not ( = ?auto_281453 ?auto_281459 ) ) ( not ( = ?auto_281453 ?auto_281460 ) ) ( not ( = ?auto_281454 ?auto_281455 ) ) ( not ( = ?auto_281454 ?auto_281456 ) ) ( not ( = ?auto_281454 ?auto_281457 ) ) ( not ( = ?auto_281454 ?auto_281458 ) ) ( not ( = ?auto_281454 ?auto_281459 ) ) ( not ( = ?auto_281454 ?auto_281460 ) ) ( not ( = ?auto_281455 ?auto_281456 ) ) ( not ( = ?auto_281455 ?auto_281457 ) ) ( not ( = ?auto_281455 ?auto_281458 ) ) ( not ( = ?auto_281455 ?auto_281459 ) ) ( not ( = ?auto_281455 ?auto_281460 ) ) ( not ( = ?auto_281456 ?auto_281457 ) ) ( not ( = ?auto_281456 ?auto_281458 ) ) ( not ( = ?auto_281456 ?auto_281459 ) ) ( not ( = ?auto_281456 ?auto_281460 ) ) ( not ( = ?auto_281457 ?auto_281458 ) ) ( not ( = ?auto_281457 ?auto_281459 ) ) ( not ( = ?auto_281457 ?auto_281460 ) ) ( not ( = ?auto_281458 ?auto_281459 ) ) ( not ( = ?auto_281458 ?auto_281460 ) ) ( not ( = ?auto_281459 ?auto_281460 ) ) ( CLEAR ?auto_281457 ) ( ON ?auto_281458 ?auto_281459 ) ( CLEAR ?auto_281458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_281448 ?auto_281449 ?auto_281450 ?auto_281451 ?auto_281452 ?auto_281453 ?auto_281454 ?auto_281455 ?auto_281456 ?auto_281457 ?auto_281458 )
      ( MAKE-12PILE ?auto_281448 ?auto_281449 ?auto_281450 ?auto_281451 ?auto_281452 ?auto_281453 ?auto_281454 ?auto_281455 ?auto_281456 ?auto_281457 ?auto_281458 ?auto_281459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281473 - BLOCK
      ?auto_281474 - BLOCK
      ?auto_281475 - BLOCK
      ?auto_281476 - BLOCK
      ?auto_281477 - BLOCK
      ?auto_281478 - BLOCK
      ?auto_281479 - BLOCK
      ?auto_281480 - BLOCK
      ?auto_281481 - BLOCK
      ?auto_281482 - BLOCK
      ?auto_281483 - BLOCK
      ?auto_281484 - BLOCK
    )
    :vars
    (
      ?auto_281485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281484 ?auto_281485 ) ( ON-TABLE ?auto_281473 ) ( ON ?auto_281474 ?auto_281473 ) ( ON ?auto_281475 ?auto_281474 ) ( ON ?auto_281476 ?auto_281475 ) ( ON ?auto_281477 ?auto_281476 ) ( ON ?auto_281478 ?auto_281477 ) ( ON ?auto_281479 ?auto_281478 ) ( ON ?auto_281480 ?auto_281479 ) ( ON ?auto_281481 ?auto_281480 ) ( not ( = ?auto_281473 ?auto_281474 ) ) ( not ( = ?auto_281473 ?auto_281475 ) ) ( not ( = ?auto_281473 ?auto_281476 ) ) ( not ( = ?auto_281473 ?auto_281477 ) ) ( not ( = ?auto_281473 ?auto_281478 ) ) ( not ( = ?auto_281473 ?auto_281479 ) ) ( not ( = ?auto_281473 ?auto_281480 ) ) ( not ( = ?auto_281473 ?auto_281481 ) ) ( not ( = ?auto_281473 ?auto_281482 ) ) ( not ( = ?auto_281473 ?auto_281483 ) ) ( not ( = ?auto_281473 ?auto_281484 ) ) ( not ( = ?auto_281473 ?auto_281485 ) ) ( not ( = ?auto_281474 ?auto_281475 ) ) ( not ( = ?auto_281474 ?auto_281476 ) ) ( not ( = ?auto_281474 ?auto_281477 ) ) ( not ( = ?auto_281474 ?auto_281478 ) ) ( not ( = ?auto_281474 ?auto_281479 ) ) ( not ( = ?auto_281474 ?auto_281480 ) ) ( not ( = ?auto_281474 ?auto_281481 ) ) ( not ( = ?auto_281474 ?auto_281482 ) ) ( not ( = ?auto_281474 ?auto_281483 ) ) ( not ( = ?auto_281474 ?auto_281484 ) ) ( not ( = ?auto_281474 ?auto_281485 ) ) ( not ( = ?auto_281475 ?auto_281476 ) ) ( not ( = ?auto_281475 ?auto_281477 ) ) ( not ( = ?auto_281475 ?auto_281478 ) ) ( not ( = ?auto_281475 ?auto_281479 ) ) ( not ( = ?auto_281475 ?auto_281480 ) ) ( not ( = ?auto_281475 ?auto_281481 ) ) ( not ( = ?auto_281475 ?auto_281482 ) ) ( not ( = ?auto_281475 ?auto_281483 ) ) ( not ( = ?auto_281475 ?auto_281484 ) ) ( not ( = ?auto_281475 ?auto_281485 ) ) ( not ( = ?auto_281476 ?auto_281477 ) ) ( not ( = ?auto_281476 ?auto_281478 ) ) ( not ( = ?auto_281476 ?auto_281479 ) ) ( not ( = ?auto_281476 ?auto_281480 ) ) ( not ( = ?auto_281476 ?auto_281481 ) ) ( not ( = ?auto_281476 ?auto_281482 ) ) ( not ( = ?auto_281476 ?auto_281483 ) ) ( not ( = ?auto_281476 ?auto_281484 ) ) ( not ( = ?auto_281476 ?auto_281485 ) ) ( not ( = ?auto_281477 ?auto_281478 ) ) ( not ( = ?auto_281477 ?auto_281479 ) ) ( not ( = ?auto_281477 ?auto_281480 ) ) ( not ( = ?auto_281477 ?auto_281481 ) ) ( not ( = ?auto_281477 ?auto_281482 ) ) ( not ( = ?auto_281477 ?auto_281483 ) ) ( not ( = ?auto_281477 ?auto_281484 ) ) ( not ( = ?auto_281477 ?auto_281485 ) ) ( not ( = ?auto_281478 ?auto_281479 ) ) ( not ( = ?auto_281478 ?auto_281480 ) ) ( not ( = ?auto_281478 ?auto_281481 ) ) ( not ( = ?auto_281478 ?auto_281482 ) ) ( not ( = ?auto_281478 ?auto_281483 ) ) ( not ( = ?auto_281478 ?auto_281484 ) ) ( not ( = ?auto_281478 ?auto_281485 ) ) ( not ( = ?auto_281479 ?auto_281480 ) ) ( not ( = ?auto_281479 ?auto_281481 ) ) ( not ( = ?auto_281479 ?auto_281482 ) ) ( not ( = ?auto_281479 ?auto_281483 ) ) ( not ( = ?auto_281479 ?auto_281484 ) ) ( not ( = ?auto_281479 ?auto_281485 ) ) ( not ( = ?auto_281480 ?auto_281481 ) ) ( not ( = ?auto_281480 ?auto_281482 ) ) ( not ( = ?auto_281480 ?auto_281483 ) ) ( not ( = ?auto_281480 ?auto_281484 ) ) ( not ( = ?auto_281480 ?auto_281485 ) ) ( not ( = ?auto_281481 ?auto_281482 ) ) ( not ( = ?auto_281481 ?auto_281483 ) ) ( not ( = ?auto_281481 ?auto_281484 ) ) ( not ( = ?auto_281481 ?auto_281485 ) ) ( not ( = ?auto_281482 ?auto_281483 ) ) ( not ( = ?auto_281482 ?auto_281484 ) ) ( not ( = ?auto_281482 ?auto_281485 ) ) ( not ( = ?auto_281483 ?auto_281484 ) ) ( not ( = ?auto_281483 ?auto_281485 ) ) ( not ( = ?auto_281484 ?auto_281485 ) ) ( ON ?auto_281483 ?auto_281484 ) ( CLEAR ?auto_281481 ) ( ON ?auto_281482 ?auto_281483 ) ( CLEAR ?auto_281482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_281473 ?auto_281474 ?auto_281475 ?auto_281476 ?auto_281477 ?auto_281478 ?auto_281479 ?auto_281480 ?auto_281481 ?auto_281482 )
      ( MAKE-12PILE ?auto_281473 ?auto_281474 ?auto_281475 ?auto_281476 ?auto_281477 ?auto_281478 ?auto_281479 ?auto_281480 ?auto_281481 ?auto_281482 ?auto_281483 ?auto_281484 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281498 - BLOCK
      ?auto_281499 - BLOCK
      ?auto_281500 - BLOCK
      ?auto_281501 - BLOCK
      ?auto_281502 - BLOCK
      ?auto_281503 - BLOCK
      ?auto_281504 - BLOCK
      ?auto_281505 - BLOCK
      ?auto_281506 - BLOCK
      ?auto_281507 - BLOCK
      ?auto_281508 - BLOCK
      ?auto_281509 - BLOCK
    )
    :vars
    (
      ?auto_281510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281509 ?auto_281510 ) ( ON-TABLE ?auto_281498 ) ( ON ?auto_281499 ?auto_281498 ) ( ON ?auto_281500 ?auto_281499 ) ( ON ?auto_281501 ?auto_281500 ) ( ON ?auto_281502 ?auto_281501 ) ( ON ?auto_281503 ?auto_281502 ) ( ON ?auto_281504 ?auto_281503 ) ( ON ?auto_281505 ?auto_281504 ) ( ON ?auto_281506 ?auto_281505 ) ( not ( = ?auto_281498 ?auto_281499 ) ) ( not ( = ?auto_281498 ?auto_281500 ) ) ( not ( = ?auto_281498 ?auto_281501 ) ) ( not ( = ?auto_281498 ?auto_281502 ) ) ( not ( = ?auto_281498 ?auto_281503 ) ) ( not ( = ?auto_281498 ?auto_281504 ) ) ( not ( = ?auto_281498 ?auto_281505 ) ) ( not ( = ?auto_281498 ?auto_281506 ) ) ( not ( = ?auto_281498 ?auto_281507 ) ) ( not ( = ?auto_281498 ?auto_281508 ) ) ( not ( = ?auto_281498 ?auto_281509 ) ) ( not ( = ?auto_281498 ?auto_281510 ) ) ( not ( = ?auto_281499 ?auto_281500 ) ) ( not ( = ?auto_281499 ?auto_281501 ) ) ( not ( = ?auto_281499 ?auto_281502 ) ) ( not ( = ?auto_281499 ?auto_281503 ) ) ( not ( = ?auto_281499 ?auto_281504 ) ) ( not ( = ?auto_281499 ?auto_281505 ) ) ( not ( = ?auto_281499 ?auto_281506 ) ) ( not ( = ?auto_281499 ?auto_281507 ) ) ( not ( = ?auto_281499 ?auto_281508 ) ) ( not ( = ?auto_281499 ?auto_281509 ) ) ( not ( = ?auto_281499 ?auto_281510 ) ) ( not ( = ?auto_281500 ?auto_281501 ) ) ( not ( = ?auto_281500 ?auto_281502 ) ) ( not ( = ?auto_281500 ?auto_281503 ) ) ( not ( = ?auto_281500 ?auto_281504 ) ) ( not ( = ?auto_281500 ?auto_281505 ) ) ( not ( = ?auto_281500 ?auto_281506 ) ) ( not ( = ?auto_281500 ?auto_281507 ) ) ( not ( = ?auto_281500 ?auto_281508 ) ) ( not ( = ?auto_281500 ?auto_281509 ) ) ( not ( = ?auto_281500 ?auto_281510 ) ) ( not ( = ?auto_281501 ?auto_281502 ) ) ( not ( = ?auto_281501 ?auto_281503 ) ) ( not ( = ?auto_281501 ?auto_281504 ) ) ( not ( = ?auto_281501 ?auto_281505 ) ) ( not ( = ?auto_281501 ?auto_281506 ) ) ( not ( = ?auto_281501 ?auto_281507 ) ) ( not ( = ?auto_281501 ?auto_281508 ) ) ( not ( = ?auto_281501 ?auto_281509 ) ) ( not ( = ?auto_281501 ?auto_281510 ) ) ( not ( = ?auto_281502 ?auto_281503 ) ) ( not ( = ?auto_281502 ?auto_281504 ) ) ( not ( = ?auto_281502 ?auto_281505 ) ) ( not ( = ?auto_281502 ?auto_281506 ) ) ( not ( = ?auto_281502 ?auto_281507 ) ) ( not ( = ?auto_281502 ?auto_281508 ) ) ( not ( = ?auto_281502 ?auto_281509 ) ) ( not ( = ?auto_281502 ?auto_281510 ) ) ( not ( = ?auto_281503 ?auto_281504 ) ) ( not ( = ?auto_281503 ?auto_281505 ) ) ( not ( = ?auto_281503 ?auto_281506 ) ) ( not ( = ?auto_281503 ?auto_281507 ) ) ( not ( = ?auto_281503 ?auto_281508 ) ) ( not ( = ?auto_281503 ?auto_281509 ) ) ( not ( = ?auto_281503 ?auto_281510 ) ) ( not ( = ?auto_281504 ?auto_281505 ) ) ( not ( = ?auto_281504 ?auto_281506 ) ) ( not ( = ?auto_281504 ?auto_281507 ) ) ( not ( = ?auto_281504 ?auto_281508 ) ) ( not ( = ?auto_281504 ?auto_281509 ) ) ( not ( = ?auto_281504 ?auto_281510 ) ) ( not ( = ?auto_281505 ?auto_281506 ) ) ( not ( = ?auto_281505 ?auto_281507 ) ) ( not ( = ?auto_281505 ?auto_281508 ) ) ( not ( = ?auto_281505 ?auto_281509 ) ) ( not ( = ?auto_281505 ?auto_281510 ) ) ( not ( = ?auto_281506 ?auto_281507 ) ) ( not ( = ?auto_281506 ?auto_281508 ) ) ( not ( = ?auto_281506 ?auto_281509 ) ) ( not ( = ?auto_281506 ?auto_281510 ) ) ( not ( = ?auto_281507 ?auto_281508 ) ) ( not ( = ?auto_281507 ?auto_281509 ) ) ( not ( = ?auto_281507 ?auto_281510 ) ) ( not ( = ?auto_281508 ?auto_281509 ) ) ( not ( = ?auto_281508 ?auto_281510 ) ) ( not ( = ?auto_281509 ?auto_281510 ) ) ( ON ?auto_281508 ?auto_281509 ) ( CLEAR ?auto_281506 ) ( ON ?auto_281507 ?auto_281508 ) ( CLEAR ?auto_281507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_281498 ?auto_281499 ?auto_281500 ?auto_281501 ?auto_281502 ?auto_281503 ?auto_281504 ?auto_281505 ?auto_281506 ?auto_281507 )
      ( MAKE-12PILE ?auto_281498 ?auto_281499 ?auto_281500 ?auto_281501 ?auto_281502 ?auto_281503 ?auto_281504 ?auto_281505 ?auto_281506 ?auto_281507 ?auto_281508 ?auto_281509 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281523 - BLOCK
      ?auto_281524 - BLOCK
      ?auto_281525 - BLOCK
      ?auto_281526 - BLOCK
      ?auto_281527 - BLOCK
      ?auto_281528 - BLOCK
      ?auto_281529 - BLOCK
      ?auto_281530 - BLOCK
      ?auto_281531 - BLOCK
      ?auto_281532 - BLOCK
      ?auto_281533 - BLOCK
      ?auto_281534 - BLOCK
    )
    :vars
    (
      ?auto_281535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281534 ?auto_281535 ) ( ON-TABLE ?auto_281523 ) ( ON ?auto_281524 ?auto_281523 ) ( ON ?auto_281525 ?auto_281524 ) ( ON ?auto_281526 ?auto_281525 ) ( ON ?auto_281527 ?auto_281526 ) ( ON ?auto_281528 ?auto_281527 ) ( ON ?auto_281529 ?auto_281528 ) ( ON ?auto_281530 ?auto_281529 ) ( not ( = ?auto_281523 ?auto_281524 ) ) ( not ( = ?auto_281523 ?auto_281525 ) ) ( not ( = ?auto_281523 ?auto_281526 ) ) ( not ( = ?auto_281523 ?auto_281527 ) ) ( not ( = ?auto_281523 ?auto_281528 ) ) ( not ( = ?auto_281523 ?auto_281529 ) ) ( not ( = ?auto_281523 ?auto_281530 ) ) ( not ( = ?auto_281523 ?auto_281531 ) ) ( not ( = ?auto_281523 ?auto_281532 ) ) ( not ( = ?auto_281523 ?auto_281533 ) ) ( not ( = ?auto_281523 ?auto_281534 ) ) ( not ( = ?auto_281523 ?auto_281535 ) ) ( not ( = ?auto_281524 ?auto_281525 ) ) ( not ( = ?auto_281524 ?auto_281526 ) ) ( not ( = ?auto_281524 ?auto_281527 ) ) ( not ( = ?auto_281524 ?auto_281528 ) ) ( not ( = ?auto_281524 ?auto_281529 ) ) ( not ( = ?auto_281524 ?auto_281530 ) ) ( not ( = ?auto_281524 ?auto_281531 ) ) ( not ( = ?auto_281524 ?auto_281532 ) ) ( not ( = ?auto_281524 ?auto_281533 ) ) ( not ( = ?auto_281524 ?auto_281534 ) ) ( not ( = ?auto_281524 ?auto_281535 ) ) ( not ( = ?auto_281525 ?auto_281526 ) ) ( not ( = ?auto_281525 ?auto_281527 ) ) ( not ( = ?auto_281525 ?auto_281528 ) ) ( not ( = ?auto_281525 ?auto_281529 ) ) ( not ( = ?auto_281525 ?auto_281530 ) ) ( not ( = ?auto_281525 ?auto_281531 ) ) ( not ( = ?auto_281525 ?auto_281532 ) ) ( not ( = ?auto_281525 ?auto_281533 ) ) ( not ( = ?auto_281525 ?auto_281534 ) ) ( not ( = ?auto_281525 ?auto_281535 ) ) ( not ( = ?auto_281526 ?auto_281527 ) ) ( not ( = ?auto_281526 ?auto_281528 ) ) ( not ( = ?auto_281526 ?auto_281529 ) ) ( not ( = ?auto_281526 ?auto_281530 ) ) ( not ( = ?auto_281526 ?auto_281531 ) ) ( not ( = ?auto_281526 ?auto_281532 ) ) ( not ( = ?auto_281526 ?auto_281533 ) ) ( not ( = ?auto_281526 ?auto_281534 ) ) ( not ( = ?auto_281526 ?auto_281535 ) ) ( not ( = ?auto_281527 ?auto_281528 ) ) ( not ( = ?auto_281527 ?auto_281529 ) ) ( not ( = ?auto_281527 ?auto_281530 ) ) ( not ( = ?auto_281527 ?auto_281531 ) ) ( not ( = ?auto_281527 ?auto_281532 ) ) ( not ( = ?auto_281527 ?auto_281533 ) ) ( not ( = ?auto_281527 ?auto_281534 ) ) ( not ( = ?auto_281527 ?auto_281535 ) ) ( not ( = ?auto_281528 ?auto_281529 ) ) ( not ( = ?auto_281528 ?auto_281530 ) ) ( not ( = ?auto_281528 ?auto_281531 ) ) ( not ( = ?auto_281528 ?auto_281532 ) ) ( not ( = ?auto_281528 ?auto_281533 ) ) ( not ( = ?auto_281528 ?auto_281534 ) ) ( not ( = ?auto_281528 ?auto_281535 ) ) ( not ( = ?auto_281529 ?auto_281530 ) ) ( not ( = ?auto_281529 ?auto_281531 ) ) ( not ( = ?auto_281529 ?auto_281532 ) ) ( not ( = ?auto_281529 ?auto_281533 ) ) ( not ( = ?auto_281529 ?auto_281534 ) ) ( not ( = ?auto_281529 ?auto_281535 ) ) ( not ( = ?auto_281530 ?auto_281531 ) ) ( not ( = ?auto_281530 ?auto_281532 ) ) ( not ( = ?auto_281530 ?auto_281533 ) ) ( not ( = ?auto_281530 ?auto_281534 ) ) ( not ( = ?auto_281530 ?auto_281535 ) ) ( not ( = ?auto_281531 ?auto_281532 ) ) ( not ( = ?auto_281531 ?auto_281533 ) ) ( not ( = ?auto_281531 ?auto_281534 ) ) ( not ( = ?auto_281531 ?auto_281535 ) ) ( not ( = ?auto_281532 ?auto_281533 ) ) ( not ( = ?auto_281532 ?auto_281534 ) ) ( not ( = ?auto_281532 ?auto_281535 ) ) ( not ( = ?auto_281533 ?auto_281534 ) ) ( not ( = ?auto_281533 ?auto_281535 ) ) ( not ( = ?auto_281534 ?auto_281535 ) ) ( ON ?auto_281533 ?auto_281534 ) ( ON ?auto_281532 ?auto_281533 ) ( CLEAR ?auto_281530 ) ( ON ?auto_281531 ?auto_281532 ) ( CLEAR ?auto_281531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_281523 ?auto_281524 ?auto_281525 ?auto_281526 ?auto_281527 ?auto_281528 ?auto_281529 ?auto_281530 ?auto_281531 )
      ( MAKE-12PILE ?auto_281523 ?auto_281524 ?auto_281525 ?auto_281526 ?auto_281527 ?auto_281528 ?auto_281529 ?auto_281530 ?auto_281531 ?auto_281532 ?auto_281533 ?auto_281534 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281548 - BLOCK
      ?auto_281549 - BLOCK
      ?auto_281550 - BLOCK
      ?auto_281551 - BLOCK
      ?auto_281552 - BLOCK
      ?auto_281553 - BLOCK
      ?auto_281554 - BLOCK
      ?auto_281555 - BLOCK
      ?auto_281556 - BLOCK
      ?auto_281557 - BLOCK
      ?auto_281558 - BLOCK
      ?auto_281559 - BLOCK
    )
    :vars
    (
      ?auto_281560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281559 ?auto_281560 ) ( ON-TABLE ?auto_281548 ) ( ON ?auto_281549 ?auto_281548 ) ( ON ?auto_281550 ?auto_281549 ) ( ON ?auto_281551 ?auto_281550 ) ( ON ?auto_281552 ?auto_281551 ) ( ON ?auto_281553 ?auto_281552 ) ( ON ?auto_281554 ?auto_281553 ) ( ON ?auto_281555 ?auto_281554 ) ( not ( = ?auto_281548 ?auto_281549 ) ) ( not ( = ?auto_281548 ?auto_281550 ) ) ( not ( = ?auto_281548 ?auto_281551 ) ) ( not ( = ?auto_281548 ?auto_281552 ) ) ( not ( = ?auto_281548 ?auto_281553 ) ) ( not ( = ?auto_281548 ?auto_281554 ) ) ( not ( = ?auto_281548 ?auto_281555 ) ) ( not ( = ?auto_281548 ?auto_281556 ) ) ( not ( = ?auto_281548 ?auto_281557 ) ) ( not ( = ?auto_281548 ?auto_281558 ) ) ( not ( = ?auto_281548 ?auto_281559 ) ) ( not ( = ?auto_281548 ?auto_281560 ) ) ( not ( = ?auto_281549 ?auto_281550 ) ) ( not ( = ?auto_281549 ?auto_281551 ) ) ( not ( = ?auto_281549 ?auto_281552 ) ) ( not ( = ?auto_281549 ?auto_281553 ) ) ( not ( = ?auto_281549 ?auto_281554 ) ) ( not ( = ?auto_281549 ?auto_281555 ) ) ( not ( = ?auto_281549 ?auto_281556 ) ) ( not ( = ?auto_281549 ?auto_281557 ) ) ( not ( = ?auto_281549 ?auto_281558 ) ) ( not ( = ?auto_281549 ?auto_281559 ) ) ( not ( = ?auto_281549 ?auto_281560 ) ) ( not ( = ?auto_281550 ?auto_281551 ) ) ( not ( = ?auto_281550 ?auto_281552 ) ) ( not ( = ?auto_281550 ?auto_281553 ) ) ( not ( = ?auto_281550 ?auto_281554 ) ) ( not ( = ?auto_281550 ?auto_281555 ) ) ( not ( = ?auto_281550 ?auto_281556 ) ) ( not ( = ?auto_281550 ?auto_281557 ) ) ( not ( = ?auto_281550 ?auto_281558 ) ) ( not ( = ?auto_281550 ?auto_281559 ) ) ( not ( = ?auto_281550 ?auto_281560 ) ) ( not ( = ?auto_281551 ?auto_281552 ) ) ( not ( = ?auto_281551 ?auto_281553 ) ) ( not ( = ?auto_281551 ?auto_281554 ) ) ( not ( = ?auto_281551 ?auto_281555 ) ) ( not ( = ?auto_281551 ?auto_281556 ) ) ( not ( = ?auto_281551 ?auto_281557 ) ) ( not ( = ?auto_281551 ?auto_281558 ) ) ( not ( = ?auto_281551 ?auto_281559 ) ) ( not ( = ?auto_281551 ?auto_281560 ) ) ( not ( = ?auto_281552 ?auto_281553 ) ) ( not ( = ?auto_281552 ?auto_281554 ) ) ( not ( = ?auto_281552 ?auto_281555 ) ) ( not ( = ?auto_281552 ?auto_281556 ) ) ( not ( = ?auto_281552 ?auto_281557 ) ) ( not ( = ?auto_281552 ?auto_281558 ) ) ( not ( = ?auto_281552 ?auto_281559 ) ) ( not ( = ?auto_281552 ?auto_281560 ) ) ( not ( = ?auto_281553 ?auto_281554 ) ) ( not ( = ?auto_281553 ?auto_281555 ) ) ( not ( = ?auto_281553 ?auto_281556 ) ) ( not ( = ?auto_281553 ?auto_281557 ) ) ( not ( = ?auto_281553 ?auto_281558 ) ) ( not ( = ?auto_281553 ?auto_281559 ) ) ( not ( = ?auto_281553 ?auto_281560 ) ) ( not ( = ?auto_281554 ?auto_281555 ) ) ( not ( = ?auto_281554 ?auto_281556 ) ) ( not ( = ?auto_281554 ?auto_281557 ) ) ( not ( = ?auto_281554 ?auto_281558 ) ) ( not ( = ?auto_281554 ?auto_281559 ) ) ( not ( = ?auto_281554 ?auto_281560 ) ) ( not ( = ?auto_281555 ?auto_281556 ) ) ( not ( = ?auto_281555 ?auto_281557 ) ) ( not ( = ?auto_281555 ?auto_281558 ) ) ( not ( = ?auto_281555 ?auto_281559 ) ) ( not ( = ?auto_281555 ?auto_281560 ) ) ( not ( = ?auto_281556 ?auto_281557 ) ) ( not ( = ?auto_281556 ?auto_281558 ) ) ( not ( = ?auto_281556 ?auto_281559 ) ) ( not ( = ?auto_281556 ?auto_281560 ) ) ( not ( = ?auto_281557 ?auto_281558 ) ) ( not ( = ?auto_281557 ?auto_281559 ) ) ( not ( = ?auto_281557 ?auto_281560 ) ) ( not ( = ?auto_281558 ?auto_281559 ) ) ( not ( = ?auto_281558 ?auto_281560 ) ) ( not ( = ?auto_281559 ?auto_281560 ) ) ( ON ?auto_281558 ?auto_281559 ) ( ON ?auto_281557 ?auto_281558 ) ( CLEAR ?auto_281555 ) ( ON ?auto_281556 ?auto_281557 ) ( CLEAR ?auto_281556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_281548 ?auto_281549 ?auto_281550 ?auto_281551 ?auto_281552 ?auto_281553 ?auto_281554 ?auto_281555 ?auto_281556 )
      ( MAKE-12PILE ?auto_281548 ?auto_281549 ?auto_281550 ?auto_281551 ?auto_281552 ?auto_281553 ?auto_281554 ?auto_281555 ?auto_281556 ?auto_281557 ?auto_281558 ?auto_281559 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281573 - BLOCK
      ?auto_281574 - BLOCK
      ?auto_281575 - BLOCK
      ?auto_281576 - BLOCK
      ?auto_281577 - BLOCK
      ?auto_281578 - BLOCK
      ?auto_281579 - BLOCK
      ?auto_281580 - BLOCK
      ?auto_281581 - BLOCK
      ?auto_281582 - BLOCK
      ?auto_281583 - BLOCK
      ?auto_281584 - BLOCK
    )
    :vars
    (
      ?auto_281585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281584 ?auto_281585 ) ( ON-TABLE ?auto_281573 ) ( ON ?auto_281574 ?auto_281573 ) ( ON ?auto_281575 ?auto_281574 ) ( ON ?auto_281576 ?auto_281575 ) ( ON ?auto_281577 ?auto_281576 ) ( ON ?auto_281578 ?auto_281577 ) ( ON ?auto_281579 ?auto_281578 ) ( not ( = ?auto_281573 ?auto_281574 ) ) ( not ( = ?auto_281573 ?auto_281575 ) ) ( not ( = ?auto_281573 ?auto_281576 ) ) ( not ( = ?auto_281573 ?auto_281577 ) ) ( not ( = ?auto_281573 ?auto_281578 ) ) ( not ( = ?auto_281573 ?auto_281579 ) ) ( not ( = ?auto_281573 ?auto_281580 ) ) ( not ( = ?auto_281573 ?auto_281581 ) ) ( not ( = ?auto_281573 ?auto_281582 ) ) ( not ( = ?auto_281573 ?auto_281583 ) ) ( not ( = ?auto_281573 ?auto_281584 ) ) ( not ( = ?auto_281573 ?auto_281585 ) ) ( not ( = ?auto_281574 ?auto_281575 ) ) ( not ( = ?auto_281574 ?auto_281576 ) ) ( not ( = ?auto_281574 ?auto_281577 ) ) ( not ( = ?auto_281574 ?auto_281578 ) ) ( not ( = ?auto_281574 ?auto_281579 ) ) ( not ( = ?auto_281574 ?auto_281580 ) ) ( not ( = ?auto_281574 ?auto_281581 ) ) ( not ( = ?auto_281574 ?auto_281582 ) ) ( not ( = ?auto_281574 ?auto_281583 ) ) ( not ( = ?auto_281574 ?auto_281584 ) ) ( not ( = ?auto_281574 ?auto_281585 ) ) ( not ( = ?auto_281575 ?auto_281576 ) ) ( not ( = ?auto_281575 ?auto_281577 ) ) ( not ( = ?auto_281575 ?auto_281578 ) ) ( not ( = ?auto_281575 ?auto_281579 ) ) ( not ( = ?auto_281575 ?auto_281580 ) ) ( not ( = ?auto_281575 ?auto_281581 ) ) ( not ( = ?auto_281575 ?auto_281582 ) ) ( not ( = ?auto_281575 ?auto_281583 ) ) ( not ( = ?auto_281575 ?auto_281584 ) ) ( not ( = ?auto_281575 ?auto_281585 ) ) ( not ( = ?auto_281576 ?auto_281577 ) ) ( not ( = ?auto_281576 ?auto_281578 ) ) ( not ( = ?auto_281576 ?auto_281579 ) ) ( not ( = ?auto_281576 ?auto_281580 ) ) ( not ( = ?auto_281576 ?auto_281581 ) ) ( not ( = ?auto_281576 ?auto_281582 ) ) ( not ( = ?auto_281576 ?auto_281583 ) ) ( not ( = ?auto_281576 ?auto_281584 ) ) ( not ( = ?auto_281576 ?auto_281585 ) ) ( not ( = ?auto_281577 ?auto_281578 ) ) ( not ( = ?auto_281577 ?auto_281579 ) ) ( not ( = ?auto_281577 ?auto_281580 ) ) ( not ( = ?auto_281577 ?auto_281581 ) ) ( not ( = ?auto_281577 ?auto_281582 ) ) ( not ( = ?auto_281577 ?auto_281583 ) ) ( not ( = ?auto_281577 ?auto_281584 ) ) ( not ( = ?auto_281577 ?auto_281585 ) ) ( not ( = ?auto_281578 ?auto_281579 ) ) ( not ( = ?auto_281578 ?auto_281580 ) ) ( not ( = ?auto_281578 ?auto_281581 ) ) ( not ( = ?auto_281578 ?auto_281582 ) ) ( not ( = ?auto_281578 ?auto_281583 ) ) ( not ( = ?auto_281578 ?auto_281584 ) ) ( not ( = ?auto_281578 ?auto_281585 ) ) ( not ( = ?auto_281579 ?auto_281580 ) ) ( not ( = ?auto_281579 ?auto_281581 ) ) ( not ( = ?auto_281579 ?auto_281582 ) ) ( not ( = ?auto_281579 ?auto_281583 ) ) ( not ( = ?auto_281579 ?auto_281584 ) ) ( not ( = ?auto_281579 ?auto_281585 ) ) ( not ( = ?auto_281580 ?auto_281581 ) ) ( not ( = ?auto_281580 ?auto_281582 ) ) ( not ( = ?auto_281580 ?auto_281583 ) ) ( not ( = ?auto_281580 ?auto_281584 ) ) ( not ( = ?auto_281580 ?auto_281585 ) ) ( not ( = ?auto_281581 ?auto_281582 ) ) ( not ( = ?auto_281581 ?auto_281583 ) ) ( not ( = ?auto_281581 ?auto_281584 ) ) ( not ( = ?auto_281581 ?auto_281585 ) ) ( not ( = ?auto_281582 ?auto_281583 ) ) ( not ( = ?auto_281582 ?auto_281584 ) ) ( not ( = ?auto_281582 ?auto_281585 ) ) ( not ( = ?auto_281583 ?auto_281584 ) ) ( not ( = ?auto_281583 ?auto_281585 ) ) ( not ( = ?auto_281584 ?auto_281585 ) ) ( ON ?auto_281583 ?auto_281584 ) ( ON ?auto_281582 ?auto_281583 ) ( ON ?auto_281581 ?auto_281582 ) ( CLEAR ?auto_281579 ) ( ON ?auto_281580 ?auto_281581 ) ( CLEAR ?auto_281580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_281573 ?auto_281574 ?auto_281575 ?auto_281576 ?auto_281577 ?auto_281578 ?auto_281579 ?auto_281580 )
      ( MAKE-12PILE ?auto_281573 ?auto_281574 ?auto_281575 ?auto_281576 ?auto_281577 ?auto_281578 ?auto_281579 ?auto_281580 ?auto_281581 ?auto_281582 ?auto_281583 ?auto_281584 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281598 - BLOCK
      ?auto_281599 - BLOCK
      ?auto_281600 - BLOCK
      ?auto_281601 - BLOCK
      ?auto_281602 - BLOCK
      ?auto_281603 - BLOCK
      ?auto_281604 - BLOCK
      ?auto_281605 - BLOCK
      ?auto_281606 - BLOCK
      ?auto_281607 - BLOCK
      ?auto_281608 - BLOCK
      ?auto_281609 - BLOCK
    )
    :vars
    (
      ?auto_281610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281609 ?auto_281610 ) ( ON-TABLE ?auto_281598 ) ( ON ?auto_281599 ?auto_281598 ) ( ON ?auto_281600 ?auto_281599 ) ( ON ?auto_281601 ?auto_281600 ) ( ON ?auto_281602 ?auto_281601 ) ( ON ?auto_281603 ?auto_281602 ) ( ON ?auto_281604 ?auto_281603 ) ( not ( = ?auto_281598 ?auto_281599 ) ) ( not ( = ?auto_281598 ?auto_281600 ) ) ( not ( = ?auto_281598 ?auto_281601 ) ) ( not ( = ?auto_281598 ?auto_281602 ) ) ( not ( = ?auto_281598 ?auto_281603 ) ) ( not ( = ?auto_281598 ?auto_281604 ) ) ( not ( = ?auto_281598 ?auto_281605 ) ) ( not ( = ?auto_281598 ?auto_281606 ) ) ( not ( = ?auto_281598 ?auto_281607 ) ) ( not ( = ?auto_281598 ?auto_281608 ) ) ( not ( = ?auto_281598 ?auto_281609 ) ) ( not ( = ?auto_281598 ?auto_281610 ) ) ( not ( = ?auto_281599 ?auto_281600 ) ) ( not ( = ?auto_281599 ?auto_281601 ) ) ( not ( = ?auto_281599 ?auto_281602 ) ) ( not ( = ?auto_281599 ?auto_281603 ) ) ( not ( = ?auto_281599 ?auto_281604 ) ) ( not ( = ?auto_281599 ?auto_281605 ) ) ( not ( = ?auto_281599 ?auto_281606 ) ) ( not ( = ?auto_281599 ?auto_281607 ) ) ( not ( = ?auto_281599 ?auto_281608 ) ) ( not ( = ?auto_281599 ?auto_281609 ) ) ( not ( = ?auto_281599 ?auto_281610 ) ) ( not ( = ?auto_281600 ?auto_281601 ) ) ( not ( = ?auto_281600 ?auto_281602 ) ) ( not ( = ?auto_281600 ?auto_281603 ) ) ( not ( = ?auto_281600 ?auto_281604 ) ) ( not ( = ?auto_281600 ?auto_281605 ) ) ( not ( = ?auto_281600 ?auto_281606 ) ) ( not ( = ?auto_281600 ?auto_281607 ) ) ( not ( = ?auto_281600 ?auto_281608 ) ) ( not ( = ?auto_281600 ?auto_281609 ) ) ( not ( = ?auto_281600 ?auto_281610 ) ) ( not ( = ?auto_281601 ?auto_281602 ) ) ( not ( = ?auto_281601 ?auto_281603 ) ) ( not ( = ?auto_281601 ?auto_281604 ) ) ( not ( = ?auto_281601 ?auto_281605 ) ) ( not ( = ?auto_281601 ?auto_281606 ) ) ( not ( = ?auto_281601 ?auto_281607 ) ) ( not ( = ?auto_281601 ?auto_281608 ) ) ( not ( = ?auto_281601 ?auto_281609 ) ) ( not ( = ?auto_281601 ?auto_281610 ) ) ( not ( = ?auto_281602 ?auto_281603 ) ) ( not ( = ?auto_281602 ?auto_281604 ) ) ( not ( = ?auto_281602 ?auto_281605 ) ) ( not ( = ?auto_281602 ?auto_281606 ) ) ( not ( = ?auto_281602 ?auto_281607 ) ) ( not ( = ?auto_281602 ?auto_281608 ) ) ( not ( = ?auto_281602 ?auto_281609 ) ) ( not ( = ?auto_281602 ?auto_281610 ) ) ( not ( = ?auto_281603 ?auto_281604 ) ) ( not ( = ?auto_281603 ?auto_281605 ) ) ( not ( = ?auto_281603 ?auto_281606 ) ) ( not ( = ?auto_281603 ?auto_281607 ) ) ( not ( = ?auto_281603 ?auto_281608 ) ) ( not ( = ?auto_281603 ?auto_281609 ) ) ( not ( = ?auto_281603 ?auto_281610 ) ) ( not ( = ?auto_281604 ?auto_281605 ) ) ( not ( = ?auto_281604 ?auto_281606 ) ) ( not ( = ?auto_281604 ?auto_281607 ) ) ( not ( = ?auto_281604 ?auto_281608 ) ) ( not ( = ?auto_281604 ?auto_281609 ) ) ( not ( = ?auto_281604 ?auto_281610 ) ) ( not ( = ?auto_281605 ?auto_281606 ) ) ( not ( = ?auto_281605 ?auto_281607 ) ) ( not ( = ?auto_281605 ?auto_281608 ) ) ( not ( = ?auto_281605 ?auto_281609 ) ) ( not ( = ?auto_281605 ?auto_281610 ) ) ( not ( = ?auto_281606 ?auto_281607 ) ) ( not ( = ?auto_281606 ?auto_281608 ) ) ( not ( = ?auto_281606 ?auto_281609 ) ) ( not ( = ?auto_281606 ?auto_281610 ) ) ( not ( = ?auto_281607 ?auto_281608 ) ) ( not ( = ?auto_281607 ?auto_281609 ) ) ( not ( = ?auto_281607 ?auto_281610 ) ) ( not ( = ?auto_281608 ?auto_281609 ) ) ( not ( = ?auto_281608 ?auto_281610 ) ) ( not ( = ?auto_281609 ?auto_281610 ) ) ( ON ?auto_281608 ?auto_281609 ) ( ON ?auto_281607 ?auto_281608 ) ( ON ?auto_281606 ?auto_281607 ) ( CLEAR ?auto_281604 ) ( ON ?auto_281605 ?auto_281606 ) ( CLEAR ?auto_281605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_281598 ?auto_281599 ?auto_281600 ?auto_281601 ?auto_281602 ?auto_281603 ?auto_281604 ?auto_281605 )
      ( MAKE-12PILE ?auto_281598 ?auto_281599 ?auto_281600 ?auto_281601 ?auto_281602 ?auto_281603 ?auto_281604 ?auto_281605 ?auto_281606 ?auto_281607 ?auto_281608 ?auto_281609 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281623 - BLOCK
      ?auto_281624 - BLOCK
      ?auto_281625 - BLOCK
      ?auto_281626 - BLOCK
      ?auto_281627 - BLOCK
      ?auto_281628 - BLOCK
      ?auto_281629 - BLOCK
      ?auto_281630 - BLOCK
      ?auto_281631 - BLOCK
      ?auto_281632 - BLOCK
      ?auto_281633 - BLOCK
      ?auto_281634 - BLOCK
    )
    :vars
    (
      ?auto_281635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281634 ?auto_281635 ) ( ON-TABLE ?auto_281623 ) ( ON ?auto_281624 ?auto_281623 ) ( ON ?auto_281625 ?auto_281624 ) ( ON ?auto_281626 ?auto_281625 ) ( ON ?auto_281627 ?auto_281626 ) ( ON ?auto_281628 ?auto_281627 ) ( not ( = ?auto_281623 ?auto_281624 ) ) ( not ( = ?auto_281623 ?auto_281625 ) ) ( not ( = ?auto_281623 ?auto_281626 ) ) ( not ( = ?auto_281623 ?auto_281627 ) ) ( not ( = ?auto_281623 ?auto_281628 ) ) ( not ( = ?auto_281623 ?auto_281629 ) ) ( not ( = ?auto_281623 ?auto_281630 ) ) ( not ( = ?auto_281623 ?auto_281631 ) ) ( not ( = ?auto_281623 ?auto_281632 ) ) ( not ( = ?auto_281623 ?auto_281633 ) ) ( not ( = ?auto_281623 ?auto_281634 ) ) ( not ( = ?auto_281623 ?auto_281635 ) ) ( not ( = ?auto_281624 ?auto_281625 ) ) ( not ( = ?auto_281624 ?auto_281626 ) ) ( not ( = ?auto_281624 ?auto_281627 ) ) ( not ( = ?auto_281624 ?auto_281628 ) ) ( not ( = ?auto_281624 ?auto_281629 ) ) ( not ( = ?auto_281624 ?auto_281630 ) ) ( not ( = ?auto_281624 ?auto_281631 ) ) ( not ( = ?auto_281624 ?auto_281632 ) ) ( not ( = ?auto_281624 ?auto_281633 ) ) ( not ( = ?auto_281624 ?auto_281634 ) ) ( not ( = ?auto_281624 ?auto_281635 ) ) ( not ( = ?auto_281625 ?auto_281626 ) ) ( not ( = ?auto_281625 ?auto_281627 ) ) ( not ( = ?auto_281625 ?auto_281628 ) ) ( not ( = ?auto_281625 ?auto_281629 ) ) ( not ( = ?auto_281625 ?auto_281630 ) ) ( not ( = ?auto_281625 ?auto_281631 ) ) ( not ( = ?auto_281625 ?auto_281632 ) ) ( not ( = ?auto_281625 ?auto_281633 ) ) ( not ( = ?auto_281625 ?auto_281634 ) ) ( not ( = ?auto_281625 ?auto_281635 ) ) ( not ( = ?auto_281626 ?auto_281627 ) ) ( not ( = ?auto_281626 ?auto_281628 ) ) ( not ( = ?auto_281626 ?auto_281629 ) ) ( not ( = ?auto_281626 ?auto_281630 ) ) ( not ( = ?auto_281626 ?auto_281631 ) ) ( not ( = ?auto_281626 ?auto_281632 ) ) ( not ( = ?auto_281626 ?auto_281633 ) ) ( not ( = ?auto_281626 ?auto_281634 ) ) ( not ( = ?auto_281626 ?auto_281635 ) ) ( not ( = ?auto_281627 ?auto_281628 ) ) ( not ( = ?auto_281627 ?auto_281629 ) ) ( not ( = ?auto_281627 ?auto_281630 ) ) ( not ( = ?auto_281627 ?auto_281631 ) ) ( not ( = ?auto_281627 ?auto_281632 ) ) ( not ( = ?auto_281627 ?auto_281633 ) ) ( not ( = ?auto_281627 ?auto_281634 ) ) ( not ( = ?auto_281627 ?auto_281635 ) ) ( not ( = ?auto_281628 ?auto_281629 ) ) ( not ( = ?auto_281628 ?auto_281630 ) ) ( not ( = ?auto_281628 ?auto_281631 ) ) ( not ( = ?auto_281628 ?auto_281632 ) ) ( not ( = ?auto_281628 ?auto_281633 ) ) ( not ( = ?auto_281628 ?auto_281634 ) ) ( not ( = ?auto_281628 ?auto_281635 ) ) ( not ( = ?auto_281629 ?auto_281630 ) ) ( not ( = ?auto_281629 ?auto_281631 ) ) ( not ( = ?auto_281629 ?auto_281632 ) ) ( not ( = ?auto_281629 ?auto_281633 ) ) ( not ( = ?auto_281629 ?auto_281634 ) ) ( not ( = ?auto_281629 ?auto_281635 ) ) ( not ( = ?auto_281630 ?auto_281631 ) ) ( not ( = ?auto_281630 ?auto_281632 ) ) ( not ( = ?auto_281630 ?auto_281633 ) ) ( not ( = ?auto_281630 ?auto_281634 ) ) ( not ( = ?auto_281630 ?auto_281635 ) ) ( not ( = ?auto_281631 ?auto_281632 ) ) ( not ( = ?auto_281631 ?auto_281633 ) ) ( not ( = ?auto_281631 ?auto_281634 ) ) ( not ( = ?auto_281631 ?auto_281635 ) ) ( not ( = ?auto_281632 ?auto_281633 ) ) ( not ( = ?auto_281632 ?auto_281634 ) ) ( not ( = ?auto_281632 ?auto_281635 ) ) ( not ( = ?auto_281633 ?auto_281634 ) ) ( not ( = ?auto_281633 ?auto_281635 ) ) ( not ( = ?auto_281634 ?auto_281635 ) ) ( ON ?auto_281633 ?auto_281634 ) ( ON ?auto_281632 ?auto_281633 ) ( ON ?auto_281631 ?auto_281632 ) ( ON ?auto_281630 ?auto_281631 ) ( CLEAR ?auto_281628 ) ( ON ?auto_281629 ?auto_281630 ) ( CLEAR ?auto_281629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_281623 ?auto_281624 ?auto_281625 ?auto_281626 ?auto_281627 ?auto_281628 ?auto_281629 )
      ( MAKE-12PILE ?auto_281623 ?auto_281624 ?auto_281625 ?auto_281626 ?auto_281627 ?auto_281628 ?auto_281629 ?auto_281630 ?auto_281631 ?auto_281632 ?auto_281633 ?auto_281634 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281648 - BLOCK
      ?auto_281649 - BLOCK
      ?auto_281650 - BLOCK
      ?auto_281651 - BLOCK
      ?auto_281652 - BLOCK
      ?auto_281653 - BLOCK
      ?auto_281654 - BLOCK
      ?auto_281655 - BLOCK
      ?auto_281656 - BLOCK
      ?auto_281657 - BLOCK
      ?auto_281658 - BLOCK
      ?auto_281659 - BLOCK
    )
    :vars
    (
      ?auto_281660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281659 ?auto_281660 ) ( ON-TABLE ?auto_281648 ) ( ON ?auto_281649 ?auto_281648 ) ( ON ?auto_281650 ?auto_281649 ) ( ON ?auto_281651 ?auto_281650 ) ( ON ?auto_281652 ?auto_281651 ) ( ON ?auto_281653 ?auto_281652 ) ( not ( = ?auto_281648 ?auto_281649 ) ) ( not ( = ?auto_281648 ?auto_281650 ) ) ( not ( = ?auto_281648 ?auto_281651 ) ) ( not ( = ?auto_281648 ?auto_281652 ) ) ( not ( = ?auto_281648 ?auto_281653 ) ) ( not ( = ?auto_281648 ?auto_281654 ) ) ( not ( = ?auto_281648 ?auto_281655 ) ) ( not ( = ?auto_281648 ?auto_281656 ) ) ( not ( = ?auto_281648 ?auto_281657 ) ) ( not ( = ?auto_281648 ?auto_281658 ) ) ( not ( = ?auto_281648 ?auto_281659 ) ) ( not ( = ?auto_281648 ?auto_281660 ) ) ( not ( = ?auto_281649 ?auto_281650 ) ) ( not ( = ?auto_281649 ?auto_281651 ) ) ( not ( = ?auto_281649 ?auto_281652 ) ) ( not ( = ?auto_281649 ?auto_281653 ) ) ( not ( = ?auto_281649 ?auto_281654 ) ) ( not ( = ?auto_281649 ?auto_281655 ) ) ( not ( = ?auto_281649 ?auto_281656 ) ) ( not ( = ?auto_281649 ?auto_281657 ) ) ( not ( = ?auto_281649 ?auto_281658 ) ) ( not ( = ?auto_281649 ?auto_281659 ) ) ( not ( = ?auto_281649 ?auto_281660 ) ) ( not ( = ?auto_281650 ?auto_281651 ) ) ( not ( = ?auto_281650 ?auto_281652 ) ) ( not ( = ?auto_281650 ?auto_281653 ) ) ( not ( = ?auto_281650 ?auto_281654 ) ) ( not ( = ?auto_281650 ?auto_281655 ) ) ( not ( = ?auto_281650 ?auto_281656 ) ) ( not ( = ?auto_281650 ?auto_281657 ) ) ( not ( = ?auto_281650 ?auto_281658 ) ) ( not ( = ?auto_281650 ?auto_281659 ) ) ( not ( = ?auto_281650 ?auto_281660 ) ) ( not ( = ?auto_281651 ?auto_281652 ) ) ( not ( = ?auto_281651 ?auto_281653 ) ) ( not ( = ?auto_281651 ?auto_281654 ) ) ( not ( = ?auto_281651 ?auto_281655 ) ) ( not ( = ?auto_281651 ?auto_281656 ) ) ( not ( = ?auto_281651 ?auto_281657 ) ) ( not ( = ?auto_281651 ?auto_281658 ) ) ( not ( = ?auto_281651 ?auto_281659 ) ) ( not ( = ?auto_281651 ?auto_281660 ) ) ( not ( = ?auto_281652 ?auto_281653 ) ) ( not ( = ?auto_281652 ?auto_281654 ) ) ( not ( = ?auto_281652 ?auto_281655 ) ) ( not ( = ?auto_281652 ?auto_281656 ) ) ( not ( = ?auto_281652 ?auto_281657 ) ) ( not ( = ?auto_281652 ?auto_281658 ) ) ( not ( = ?auto_281652 ?auto_281659 ) ) ( not ( = ?auto_281652 ?auto_281660 ) ) ( not ( = ?auto_281653 ?auto_281654 ) ) ( not ( = ?auto_281653 ?auto_281655 ) ) ( not ( = ?auto_281653 ?auto_281656 ) ) ( not ( = ?auto_281653 ?auto_281657 ) ) ( not ( = ?auto_281653 ?auto_281658 ) ) ( not ( = ?auto_281653 ?auto_281659 ) ) ( not ( = ?auto_281653 ?auto_281660 ) ) ( not ( = ?auto_281654 ?auto_281655 ) ) ( not ( = ?auto_281654 ?auto_281656 ) ) ( not ( = ?auto_281654 ?auto_281657 ) ) ( not ( = ?auto_281654 ?auto_281658 ) ) ( not ( = ?auto_281654 ?auto_281659 ) ) ( not ( = ?auto_281654 ?auto_281660 ) ) ( not ( = ?auto_281655 ?auto_281656 ) ) ( not ( = ?auto_281655 ?auto_281657 ) ) ( not ( = ?auto_281655 ?auto_281658 ) ) ( not ( = ?auto_281655 ?auto_281659 ) ) ( not ( = ?auto_281655 ?auto_281660 ) ) ( not ( = ?auto_281656 ?auto_281657 ) ) ( not ( = ?auto_281656 ?auto_281658 ) ) ( not ( = ?auto_281656 ?auto_281659 ) ) ( not ( = ?auto_281656 ?auto_281660 ) ) ( not ( = ?auto_281657 ?auto_281658 ) ) ( not ( = ?auto_281657 ?auto_281659 ) ) ( not ( = ?auto_281657 ?auto_281660 ) ) ( not ( = ?auto_281658 ?auto_281659 ) ) ( not ( = ?auto_281658 ?auto_281660 ) ) ( not ( = ?auto_281659 ?auto_281660 ) ) ( ON ?auto_281658 ?auto_281659 ) ( ON ?auto_281657 ?auto_281658 ) ( ON ?auto_281656 ?auto_281657 ) ( ON ?auto_281655 ?auto_281656 ) ( CLEAR ?auto_281653 ) ( ON ?auto_281654 ?auto_281655 ) ( CLEAR ?auto_281654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_281648 ?auto_281649 ?auto_281650 ?auto_281651 ?auto_281652 ?auto_281653 ?auto_281654 )
      ( MAKE-12PILE ?auto_281648 ?auto_281649 ?auto_281650 ?auto_281651 ?auto_281652 ?auto_281653 ?auto_281654 ?auto_281655 ?auto_281656 ?auto_281657 ?auto_281658 ?auto_281659 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281673 - BLOCK
      ?auto_281674 - BLOCK
      ?auto_281675 - BLOCK
      ?auto_281676 - BLOCK
      ?auto_281677 - BLOCK
      ?auto_281678 - BLOCK
      ?auto_281679 - BLOCK
      ?auto_281680 - BLOCK
      ?auto_281681 - BLOCK
      ?auto_281682 - BLOCK
      ?auto_281683 - BLOCK
      ?auto_281684 - BLOCK
    )
    :vars
    (
      ?auto_281685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281684 ?auto_281685 ) ( ON-TABLE ?auto_281673 ) ( ON ?auto_281674 ?auto_281673 ) ( ON ?auto_281675 ?auto_281674 ) ( ON ?auto_281676 ?auto_281675 ) ( ON ?auto_281677 ?auto_281676 ) ( not ( = ?auto_281673 ?auto_281674 ) ) ( not ( = ?auto_281673 ?auto_281675 ) ) ( not ( = ?auto_281673 ?auto_281676 ) ) ( not ( = ?auto_281673 ?auto_281677 ) ) ( not ( = ?auto_281673 ?auto_281678 ) ) ( not ( = ?auto_281673 ?auto_281679 ) ) ( not ( = ?auto_281673 ?auto_281680 ) ) ( not ( = ?auto_281673 ?auto_281681 ) ) ( not ( = ?auto_281673 ?auto_281682 ) ) ( not ( = ?auto_281673 ?auto_281683 ) ) ( not ( = ?auto_281673 ?auto_281684 ) ) ( not ( = ?auto_281673 ?auto_281685 ) ) ( not ( = ?auto_281674 ?auto_281675 ) ) ( not ( = ?auto_281674 ?auto_281676 ) ) ( not ( = ?auto_281674 ?auto_281677 ) ) ( not ( = ?auto_281674 ?auto_281678 ) ) ( not ( = ?auto_281674 ?auto_281679 ) ) ( not ( = ?auto_281674 ?auto_281680 ) ) ( not ( = ?auto_281674 ?auto_281681 ) ) ( not ( = ?auto_281674 ?auto_281682 ) ) ( not ( = ?auto_281674 ?auto_281683 ) ) ( not ( = ?auto_281674 ?auto_281684 ) ) ( not ( = ?auto_281674 ?auto_281685 ) ) ( not ( = ?auto_281675 ?auto_281676 ) ) ( not ( = ?auto_281675 ?auto_281677 ) ) ( not ( = ?auto_281675 ?auto_281678 ) ) ( not ( = ?auto_281675 ?auto_281679 ) ) ( not ( = ?auto_281675 ?auto_281680 ) ) ( not ( = ?auto_281675 ?auto_281681 ) ) ( not ( = ?auto_281675 ?auto_281682 ) ) ( not ( = ?auto_281675 ?auto_281683 ) ) ( not ( = ?auto_281675 ?auto_281684 ) ) ( not ( = ?auto_281675 ?auto_281685 ) ) ( not ( = ?auto_281676 ?auto_281677 ) ) ( not ( = ?auto_281676 ?auto_281678 ) ) ( not ( = ?auto_281676 ?auto_281679 ) ) ( not ( = ?auto_281676 ?auto_281680 ) ) ( not ( = ?auto_281676 ?auto_281681 ) ) ( not ( = ?auto_281676 ?auto_281682 ) ) ( not ( = ?auto_281676 ?auto_281683 ) ) ( not ( = ?auto_281676 ?auto_281684 ) ) ( not ( = ?auto_281676 ?auto_281685 ) ) ( not ( = ?auto_281677 ?auto_281678 ) ) ( not ( = ?auto_281677 ?auto_281679 ) ) ( not ( = ?auto_281677 ?auto_281680 ) ) ( not ( = ?auto_281677 ?auto_281681 ) ) ( not ( = ?auto_281677 ?auto_281682 ) ) ( not ( = ?auto_281677 ?auto_281683 ) ) ( not ( = ?auto_281677 ?auto_281684 ) ) ( not ( = ?auto_281677 ?auto_281685 ) ) ( not ( = ?auto_281678 ?auto_281679 ) ) ( not ( = ?auto_281678 ?auto_281680 ) ) ( not ( = ?auto_281678 ?auto_281681 ) ) ( not ( = ?auto_281678 ?auto_281682 ) ) ( not ( = ?auto_281678 ?auto_281683 ) ) ( not ( = ?auto_281678 ?auto_281684 ) ) ( not ( = ?auto_281678 ?auto_281685 ) ) ( not ( = ?auto_281679 ?auto_281680 ) ) ( not ( = ?auto_281679 ?auto_281681 ) ) ( not ( = ?auto_281679 ?auto_281682 ) ) ( not ( = ?auto_281679 ?auto_281683 ) ) ( not ( = ?auto_281679 ?auto_281684 ) ) ( not ( = ?auto_281679 ?auto_281685 ) ) ( not ( = ?auto_281680 ?auto_281681 ) ) ( not ( = ?auto_281680 ?auto_281682 ) ) ( not ( = ?auto_281680 ?auto_281683 ) ) ( not ( = ?auto_281680 ?auto_281684 ) ) ( not ( = ?auto_281680 ?auto_281685 ) ) ( not ( = ?auto_281681 ?auto_281682 ) ) ( not ( = ?auto_281681 ?auto_281683 ) ) ( not ( = ?auto_281681 ?auto_281684 ) ) ( not ( = ?auto_281681 ?auto_281685 ) ) ( not ( = ?auto_281682 ?auto_281683 ) ) ( not ( = ?auto_281682 ?auto_281684 ) ) ( not ( = ?auto_281682 ?auto_281685 ) ) ( not ( = ?auto_281683 ?auto_281684 ) ) ( not ( = ?auto_281683 ?auto_281685 ) ) ( not ( = ?auto_281684 ?auto_281685 ) ) ( ON ?auto_281683 ?auto_281684 ) ( ON ?auto_281682 ?auto_281683 ) ( ON ?auto_281681 ?auto_281682 ) ( ON ?auto_281680 ?auto_281681 ) ( ON ?auto_281679 ?auto_281680 ) ( CLEAR ?auto_281677 ) ( ON ?auto_281678 ?auto_281679 ) ( CLEAR ?auto_281678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_281673 ?auto_281674 ?auto_281675 ?auto_281676 ?auto_281677 ?auto_281678 )
      ( MAKE-12PILE ?auto_281673 ?auto_281674 ?auto_281675 ?auto_281676 ?auto_281677 ?auto_281678 ?auto_281679 ?auto_281680 ?auto_281681 ?auto_281682 ?auto_281683 ?auto_281684 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281698 - BLOCK
      ?auto_281699 - BLOCK
      ?auto_281700 - BLOCK
      ?auto_281701 - BLOCK
      ?auto_281702 - BLOCK
      ?auto_281703 - BLOCK
      ?auto_281704 - BLOCK
      ?auto_281705 - BLOCK
      ?auto_281706 - BLOCK
      ?auto_281707 - BLOCK
      ?auto_281708 - BLOCK
      ?auto_281709 - BLOCK
    )
    :vars
    (
      ?auto_281710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281709 ?auto_281710 ) ( ON-TABLE ?auto_281698 ) ( ON ?auto_281699 ?auto_281698 ) ( ON ?auto_281700 ?auto_281699 ) ( ON ?auto_281701 ?auto_281700 ) ( ON ?auto_281702 ?auto_281701 ) ( not ( = ?auto_281698 ?auto_281699 ) ) ( not ( = ?auto_281698 ?auto_281700 ) ) ( not ( = ?auto_281698 ?auto_281701 ) ) ( not ( = ?auto_281698 ?auto_281702 ) ) ( not ( = ?auto_281698 ?auto_281703 ) ) ( not ( = ?auto_281698 ?auto_281704 ) ) ( not ( = ?auto_281698 ?auto_281705 ) ) ( not ( = ?auto_281698 ?auto_281706 ) ) ( not ( = ?auto_281698 ?auto_281707 ) ) ( not ( = ?auto_281698 ?auto_281708 ) ) ( not ( = ?auto_281698 ?auto_281709 ) ) ( not ( = ?auto_281698 ?auto_281710 ) ) ( not ( = ?auto_281699 ?auto_281700 ) ) ( not ( = ?auto_281699 ?auto_281701 ) ) ( not ( = ?auto_281699 ?auto_281702 ) ) ( not ( = ?auto_281699 ?auto_281703 ) ) ( not ( = ?auto_281699 ?auto_281704 ) ) ( not ( = ?auto_281699 ?auto_281705 ) ) ( not ( = ?auto_281699 ?auto_281706 ) ) ( not ( = ?auto_281699 ?auto_281707 ) ) ( not ( = ?auto_281699 ?auto_281708 ) ) ( not ( = ?auto_281699 ?auto_281709 ) ) ( not ( = ?auto_281699 ?auto_281710 ) ) ( not ( = ?auto_281700 ?auto_281701 ) ) ( not ( = ?auto_281700 ?auto_281702 ) ) ( not ( = ?auto_281700 ?auto_281703 ) ) ( not ( = ?auto_281700 ?auto_281704 ) ) ( not ( = ?auto_281700 ?auto_281705 ) ) ( not ( = ?auto_281700 ?auto_281706 ) ) ( not ( = ?auto_281700 ?auto_281707 ) ) ( not ( = ?auto_281700 ?auto_281708 ) ) ( not ( = ?auto_281700 ?auto_281709 ) ) ( not ( = ?auto_281700 ?auto_281710 ) ) ( not ( = ?auto_281701 ?auto_281702 ) ) ( not ( = ?auto_281701 ?auto_281703 ) ) ( not ( = ?auto_281701 ?auto_281704 ) ) ( not ( = ?auto_281701 ?auto_281705 ) ) ( not ( = ?auto_281701 ?auto_281706 ) ) ( not ( = ?auto_281701 ?auto_281707 ) ) ( not ( = ?auto_281701 ?auto_281708 ) ) ( not ( = ?auto_281701 ?auto_281709 ) ) ( not ( = ?auto_281701 ?auto_281710 ) ) ( not ( = ?auto_281702 ?auto_281703 ) ) ( not ( = ?auto_281702 ?auto_281704 ) ) ( not ( = ?auto_281702 ?auto_281705 ) ) ( not ( = ?auto_281702 ?auto_281706 ) ) ( not ( = ?auto_281702 ?auto_281707 ) ) ( not ( = ?auto_281702 ?auto_281708 ) ) ( not ( = ?auto_281702 ?auto_281709 ) ) ( not ( = ?auto_281702 ?auto_281710 ) ) ( not ( = ?auto_281703 ?auto_281704 ) ) ( not ( = ?auto_281703 ?auto_281705 ) ) ( not ( = ?auto_281703 ?auto_281706 ) ) ( not ( = ?auto_281703 ?auto_281707 ) ) ( not ( = ?auto_281703 ?auto_281708 ) ) ( not ( = ?auto_281703 ?auto_281709 ) ) ( not ( = ?auto_281703 ?auto_281710 ) ) ( not ( = ?auto_281704 ?auto_281705 ) ) ( not ( = ?auto_281704 ?auto_281706 ) ) ( not ( = ?auto_281704 ?auto_281707 ) ) ( not ( = ?auto_281704 ?auto_281708 ) ) ( not ( = ?auto_281704 ?auto_281709 ) ) ( not ( = ?auto_281704 ?auto_281710 ) ) ( not ( = ?auto_281705 ?auto_281706 ) ) ( not ( = ?auto_281705 ?auto_281707 ) ) ( not ( = ?auto_281705 ?auto_281708 ) ) ( not ( = ?auto_281705 ?auto_281709 ) ) ( not ( = ?auto_281705 ?auto_281710 ) ) ( not ( = ?auto_281706 ?auto_281707 ) ) ( not ( = ?auto_281706 ?auto_281708 ) ) ( not ( = ?auto_281706 ?auto_281709 ) ) ( not ( = ?auto_281706 ?auto_281710 ) ) ( not ( = ?auto_281707 ?auto_281708 ) ) ( not ( = ?auto_281707 ?auto_281709 ) ) ( not ( = ?auto_281707 ?auto_281710 ) ) ( not ( = ?auto_281708 ?auto_281709 ) ) ( not ( = ?auto_281708 ?auto_281710 ) ) ( not ( = ?auto_281709 ?auto_281710 ) ) ( ON ?auto_281708 ?auto_281709 ) ( ON ?auto_281707 ?auto_281708 ) ( ON ?auto_281706 ?auto_281707 ) ( ON ?auto_281705 ?auto_281706 ) ( ON ?auto_281704 ?auto_281705 ) ( CLEAR ?auto_281702 ) ( ON ?auto_281703 ?auto_281704 ) ( CLEAR ?auto_281703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_281698 ?auto_281699 ?auto_281700 ?auto_281701 ?auto_281702 ?auto_281703 )
      ( MAKE-12PILE ?auto_281698 ?auto_281699 ?auto_281700 ?auto_281701 ?auto_281702 ?auto_281703 ?auto_281704 ?auto_281705 ?auto_281706 ?auto_281707 ?auto_281708 ?auto_281709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281723 - BLOCK
      ?auto_281724 - BLOCK
      ?auto_281725 - BLOCK
      ?auto_281726 - BLOCK
      ?auto_281727 - BLOCK
      ?auto_281728 - BLOCK
      ?auto_281729 - BLOCK
      ?auto_281730 - BLOCK
      ?auto_281731 - BLOCK
      ?auto_281732 - BLOCK
      ?auto_281733 - BLOCK
      ?auto_281734 - BLOCK
    )
    :vars
    (
      ?auto_281735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281734 ?auto_281735 ) ( ON-TABLE ?auto_281723 ) ( ON ?auto_281724 ?auto_281723 ) ( ON ?auto_281725 ?auto_281724 ) ( ON ?auto_281726 ?auto_281725 ) ( not ( = ?auto_281723 ?auto_281724 ) ) ( not ( = ?auto_281723 ?auto_281725 ) ) ( not ( = ?auto_281723 ?auto_281726 ) ) ( not ( = ?auto_281723 ?auto_281727 ) ) ( not ( = ?auto_281723 ?auto_281728 ) ) ( not ( = ?auto_281723 ?auto_281729 ) ) ( not ( = ?auto_281723 ?auto_281730 ) ) ( not ( = ?auto_281723 ?auto_281731 ) ) ( not ( = ?auto_281723 ?auto_281732 ) ) ( not ( = ?auto_281723 ?auto_281733 ) ) ( not ( = ?auto_281723 ?auto_281734 ) ) ( not ( = ?auto_281723 ?auto_281735 ) ) ( not ( = ?auto_281724 ?auto_281725 ) ) ( not ( = ?auto_281724 ?auto_281726 ) ) ( not ( = ?auto_281724 ?auto_281727 ) ) ( not ( = ?auto_281724 ?auto_281728 ) ) ( not ( = ?auto_281724 ?auto_281729 ) ) ( not ( = ?auto_281724 ?auto_281730 ) ) ( not ( = ?auto_281724 ?auto_281731 ) ) ( not ( = ?auto_281724 ?auto_281732 ) ) ( not ( = ?auto_281724 ?auto_281733 ) ) ( not ( = ?auto_281724 ?auto_281734 ) ) ( not ( = ?auto_281724 ?auto_281735 ) ) ( not ( = ?auto_281725 ?auto_281726 ) ) ( not ( = ?auto_281725 ?auto_281727 ) ) ( not ( = ?auto_281725 ?auto_281728 ) ) ( not ( = ?auto_281725 ?auto_281729 ) ) ( not ( = ?auto_281725 ?auto_281730 ) ) ( not ( = ?auto_281725 ?auto_281731 ) ) ( not ( = ?auto_281725 ?auto_281732 ) ) ( not ( = ?auto_281725 ?auto_281733 ) ) ( not ( = ?auto_281725 ?auto_281734 ) ) ( not ( = ?auto_281725 ?auto_281735 ) ) ( not ( = ?auto_281726 ?auto_281727 ) ) ( not ( = ?auto_281726 ?auto_281728 ) ) ( not ( = ?auto_281726 ?auto_281729 ) ) ( not ( = ?auto_281726 ?auto_281730 ) ) ( not ( = ?auto_281726 ?auto_281731 ) ) ( not ( = ?auto_281726 ?auto_281732 ) ) ( not ( = ?auto_281726 ?auto_281733 ) ) ( not ( = ?auto_281726 ?auto_281734 ) ) ( not ( = ?auto_281726 ?auto_281735 ) ) ( not ( = ?auto_281727 ?auto_281728 ) ) ( not ( = ?auto_281727 ?auto_281729 ) ) ( not ( = ?auto_281727 ?auto_281730 ) ) ( not ( = ?auto_281727 ?auto_281731 ) ) ( not ( = ?auto_281727 ?auto_281732 ) ) ( not ( = ?auto_281727 ?auto_281733 ) ) ( not ( = ?auto_281727 ?auto_281734 ) ) ( not ( = ?auto_281727 ?auto_281735 ) ) ( not ( = ?auto_281728 ?auto_281729 ) ) ( not ( = ?auto_281728 ?auto_281730 ) ) ( not ( = ?auto_281728 ?auto_281731 ) ) ( not ( = ?auto_281728 ?auto_281732 ) ) ( not ( = ?auto_281728 ?auto_281733 ) ) ( not ( = ?auto_281728 ?auto_281734 ) ) ( not ( = ?auto_281728 ?auto_281735 ) ) ( not ( = ?auto_281729 ?auto_281730 ) ) ( not ( = ?auto_281729 ?auto_281731 ) ) ( not ( = ?auto_281729 ?auto_281732 ) ) ( not ( = ?auto_281729 ?auto_281733 ) ) ( not ( = ?auto_281729 ?auto_281734 ) ) ( not ( = ?auto_281729 ?auto_281735 ) ) ( not ( = ?auto_281730 ?auto_281731 ) ) ( not ( = ?auto_281730 ?auto_281732 ) ) ( not ( = ?auto_281730 ?auto_281733 ) ) ( not ( = ?auto_281730 ?auto_281734 ) ) ( not ( = ?auto_281730 ?auto_281735 ) ) ( not ( = ?auto_281731 ?auto_281732 ) ) ( not ( = ?auto_281731 ?auto_281733 ) ) ( not ( = ?auto_281731 ?auto_281734 ) ) ( not ( = ?auto_281731 ?auto_281735 ) ) ( not ( = ?auto_281732 ?auto_281733 ) ) ( not ( = ?auto_281732 ?auto_281734 ) ) ( not ( = ?auto_281732 ?auto_281735 ) ) ( not ( = ?auto_281733 ?auto_281734 ) ) ( not ( = ?auto_281733 ?auto_281735 ) ) ( not ( = ?auto_281734 ?auto_281735 ) ) ( ON ?auto_281733 ?auto_281734 ) ( ON ?auto_281732 ?auto_281733 ) ( ON ?auto_281731 ?auto_281732 ) ( ON ?auto_281730 ?auto_281731 ) ( ON ?auto_281729 ?auto_281730 ) ( ON ?auto_281728 ?auto_281729 ) ( CLEAR ?auto_281726 ) ( ON ?auto_281727 ?auto_281728 ) ( CLEAR ?auto_281727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_281723 ?auto_281724 ?auto_281725 ?auto_281726 ?auto_281727 )
      ( MAKE-12PILE ?auto_281723 ?auto_281724 ?auto_281725 ?auto_281726 ?auto_281727 ?auto_281728 ?auto_281729 ?auto_281730 ?auto_281731 ?auto_281732 ?auto_281733 ?auto_281734 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281748 - BLOCK
      ?auto_281749 - BLOCK
      ?auto_281750 - BLOCK
      ?auto_281751 - BLOCK
      ?auto_281752 - BLOCK
      ?auto_281753 - BLOCK
      ?auto_281754 - BLOCK
      ?auto_281755 - BLOCK
      ?auto_281756 - BLOCK
      ?auto_281757 - BLOCK
      ?auto_281758 - BLOCK
      ?auto_281759 - BLOCK
    )
    :vars
    (
      ?auto_281760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281759 ?auto_281760 ) ( ON-TABLE ?auto_281748 ) ( ON ?auto_281749 ?auto_281748 ) ( ON ?auto_281750 ?auto_281749 ) ( ON ?auto_281751 ?auto_281750 ) ( not ( = ?auto_281748 ?auto_281749 ) ) ( not ( = ?auto_281748 ?auto_281750 ) ) ( not ( = ?auto_281748 ?auto_281751 ) ) ( not ( = ?auto_281748 ?auto_281752 ) ) ( not ( = ?auto_281748 ?auto_281753 ) ) ( not ( = ?auto_281748 ?auto_281754 ) ) ( not ( = ?auto_281748 ?auto_281755 ) ) ( not ( = ?auto_281748 ?auto_281756 ) ) ( not ( = ?auto_281748 ?auto_281757 ) ) ( not ( = ?auto_281748 ?auto_281758 ) ) ( not ( = ?auto_281748 ?auto_281759 ) ) ( not ( = ?auto_281748 ?auto_281760 ) ) ( not ( = ?auto_281749 ?auto_281750 ) ) ( not ( = ?auto_281749 ?auto_281751 ) ) ( not ( = ?auto_281749 ?auto_281752 ) ) ( not ( = ?auto_281749 ?auto_281753 ) ) ( not ( = ?auto_281749 ?auto_281754 ) ) ( not ( = ?auto_281749 ?auto_281755 ) ) ( not ( = ?auto_281749 ?auto_281756 ) ) ( not ( = ?auto_281749 ?auto_281757 ) ) ( not ( = ?auto_281749 ?auto_281758 ) ) ( not ( = ?auto_281749 ?auto_281759 ) ) ( not ( = ?auto_281749 ?auto_281760 ) ) ( not ( = ?auto_281750 ?auto_281751 ) ) ( not ( = ?auto_281750 ?auto_281752 ) ) ( not ( = ?auto_281750 ?auto_281753 ) ) ( not ( = ?auto_281750 ?auto_281754 ) ) ( not ( = ?auto_281750 ?auto_281755 ) ) ( not ( = ?auto_281750 ?auto_281756 ) ) ( not ( = ?auto_281750 ?auto_281757 ) ) ( not ( = ?auto_281750 ?auto_281758 ) ) ( not ( = ?auto_281750 ?auto_281759 ) ) ( not ( = ?auto_281750 ?auto_281760 ) ) ( not ( = ?auto_281751 ?auto_281752 ) ) ( not ( = ?auto_281751 ?auto_281753 ) ) ( not ( = ?auto_281751 ?auto_281754 ) ) ( not ( = ?auto_281751 ?auto_281755 ) ) ( not ( = ?auto_281751 ?auto_281756 ) ) ( not ( = ?auto_281751 ?auto_281757 ) ) ( not ( = ?auto_281751 ?auto_281758 ) ) ( not ( = ?auto_281751 ?auto_281759 ) ) ( not ( = ?auto_281751 ?auto_281760 ) ) ( not ( = ?auto_281752 ?auto_281753 ) ) ( not ( = ?auto_281752 ?auto_281754 ) ) ( not ( = ?auto_281752 ?auto_281755 ) ) ( not ( = ?auto_281752 ?auto_281756 ) ) ( not ( = ?auto_281752 ?auto_281757 ) ) ( not ( = ?auto_281752 ?auto_281758 ) ) ( not ( = ?auto_281752 ?auto_281759 ) ) ( not ( = ?auto_281752 ?auto_281760 ) ) ( not ( = ?auto_281753 ?auto_281754 ) ) ( not ( = ?auto_281753 ?auto_281755 ) ) ( not ( = ?auto_281753 ?auto_281756 ) ) ( not ( = ?auto_281753 ?auto_281757 ) ) ( not ( = ?auto_281753 ?auto_281758 ) ) ( not ( = ?auto_281753 ?auto_281759 ) ) ( not ( = ?auto_281753 ?auto_281760 ) ) ( not ( = ?auto_281754 ?auto_281755 ) ) ( not ( = ?auto_281754 ?auto_281756 ) ) ( not ( = ?auto_281754 ?auto_281757 ) ) ( not ( = ?auto_281754 ?auto_281758 ) ) ( not ( = ?auto_281754 ?auto_281759 ) ) ( not ( = ?auto_281754 ?auto_281760 ) ) ( not ( = ?auto_281755 ?auto_281756 ) ) ( not ( = ?auto_281755 ?auto_281757 ) ) ( not ( = ?auto_281755 ?auto_281758 ) ) ( not ( = ?auto_281755 ?auto_281759 ) ) ( not ( = ?auto_281755 ?auto_281760 ) ) ( not ( = ?auto_281756 ?auto_281757 ) ) ( not ( = ?auto_281756 ?auto_281758 ) ) ( not ( = ?auto_281756 ?auto_281759 ) ) ( not ( = ?auto_281756 ?auto_281760 ) ) ( not ( = ?auto_281757 ?auto_281758 ) ) ( not ( = ?auto_281757 ?auto_281759 ) ) ( not ( = ?auto_281757 ?auto_281760 ) ) ( not ( = ?auto_281758 ?auto_281759 ) ) ( not ( = ?auto_281758 ?auto_281760 ) ) ( not ( = ?auto_281759 ?auto_281760 ) ) ( ON ?auto_281758 ?auto_281759 ) ( ON ?auto_281757 ?auto_281758 ) ( ON ?auto_281756 ?auto_281757 ) ( ON ?auto_281755 ?auto_281756 ) ( ON ?auto_281754 ?auto_281755 ) ( ON ?auto_281753 ?auto_281754 ) ( CLEAR ?auto_281751 ) ( ON ?auto_281752 ?auto_281753 ) ( CLEAR ?auto_281752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_281748 ?auto_281749 ?auto_281750 ?auto_281751 ?auto_281752 )
      ( MAKE-12PILE ?auto_281748 ?auto_281749 ?auto_281750 ?auto_281751 ?auto_281752 ?auto_281753 ?auto_281754 ?auto_281755 ?auto_281756 ?auto_281757 ?auto_281758 ?auto_281759 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281773 - BLOCK
      ?auto_281774 - BLOCK
      ?auto_281775 - BLOCK
      ?auto_281776 - BLOCK
      ?auto_281777 - BLOCK
      ?auto_281778 - BLOCK
      ?auto_281779 - BLOCK
      ?auto_281780 - BLOCK
      ?auto_281781 - BLOCK
      ?auto_281782 - BLOCK
      ?auto_281783 - BLOCK
      ?auto_281784 - BLOCK
    )
    :vars
    (
      ?auto_281785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281784 ?auto_281785 ) ( ON-TABLE ?auto_281773 ) ( ON ?auto_281774 ?auto_281773 ) ( ON ?auto_281775 ?auto_281774 ) ( not ( = ?auto_281773 ?auto_281774 ) ) ( not ( = ?auto_281773 ?auto_281775 ) ) ( not ( = ?auto_281773 ?auto_281776 ) ) ( not ( = ?auto_281773 ?auto_281777 ) ) ( not ( = ?auto_281773 ?auto_281778 ) ) ( not ( = ?auto_281773 ?auto_281779 ) ) ( not ( = ?auto_281773 ?auto_281780 ) ) ( not ( = ?auto_281773 ?auto_281781 ) ) ( not ( = ?auto_281773 ?auto_281782 ) ) ( not ( = ?auto_281773 ?auto_281783 ) ) ( not ( = ?auto_281773 ?auto_281784 ) ) ( not ( = ?auto_281773 ?auto_281785 ) ) ( not ( = ?auto_281774 ?auto_281775 ) ) ( not ( = ?auto_281774 ?auto_281776 ) ) ( not ( = ?auto_281774 ?auto_281777 ) ) ( not ( = ?auto_281774 ?auto_281778 ) ) ( not ( = ?auto_281774 ?auto_281779 ) ) ( not ( = ?auto_281774 ?auto_281780 ) ) ( not ( = ?auto_281774 ?auto_281781 ) ) ( not ( = ?auto_281774 ?auto_281782 ) ) ( not ( = ?auto_281774 ?auto_281783 ) ) ( not ( = ?auto_281774 ?auto_281784 ) ) ( not ( = ?auto_281774 ?auto_281785 ) ) ( not ( = ?auto_281775 ?auto_281776 ) ) ( not ( = ?auto_281775 ?auto_281777 ) ) ( not ( = ?auto_281775 ?auto_281778 ) ) ( not ( = ?auto_281775 ?auto_281779 ) ) ( not ( = ?auto_281775 ?auto_281780 ) ) ( not ( = ?auto_281775 ?auto_281781 ) ) ( not ( = ?auto_281775 ?auto_281782 ) ) ( not ( = ?auto_281775 ?auto_281783 ) ) ( not ( = ?auto_281775 ?auto_281784 ) ) ( not ( = ?auto_281775 ?auto_281785 ) ) ( not ( = ?auto_281776 ?auto_281777 ) ) ( not ( = ?auto_281776 ?auto_281778 ) ) ( not ( = ?auto_281776 ?auto_281779 ) ) ( not ( = ?auto_281776 ?auto_281780 ) ) ( not ( = ?auto_281776 ?auto_281781 ) ) ( not ( = ?auto_281776 ?auto_281782 ) ) ( not ( = ?auto_281776 ?auto_281783 ) ) ( not ( = ?auto_281776 ?auto_281784 ) ) ( not ( = ?auto_281776 ?auto_281785 ) ) ( not ( = ?auto_281777 ?auto_281778 ) ) ( not ( = ?auto_281777 ?auto_281779 ) ) ( not ( = ?auto_281777 ?auto_281780 ) ) ( not ( = ?auto_281777 ?auto_281781 ) ) ( not ( = ?auto_281777 ?auto_281782 ) ) ( not ( = ?auto_281777 ?auto_281783 ) ) ( not ( = ?auto_281777 ?auto_281784 ) ) ( not ( = ?auto_281777 ?auto_281785 ) ) ( not ( = ?auto_281778 ?auto_281779 ) ) ( not ( = ?auto_281778 ?auto_281780 ) ) ( not ( = ?auto_281778 ?auto_281781 ) ) ( not ( = ?auto_281778 ?auto_281782 ) ) ( not ( = ?auto_281778 ?auto_281783 ) ) ( not ( = ?auto_281778 ?auto_281784 ) ) ( not ( = ?auto_281778 ?auto_281785 ) ) ( not ( = ?auto_281779 ?auto_281780 ) ) ( not ( = ?auto_281779 ?auto_281781 ) ) ( not ( = ?auto_281779 ?auto_281782 ) ) ( not ( = ?auto_281779 ?auto_281783 ) ) ( not ( = ?auto_281779 ?auto_281784 ) ) ( not ( = ?auto_281779 ?auto_281785 ) ) ( not ( = ?auto_281780 ?auto_281781 ) ) ( not ( = ?auto_281780 ?auto_281782 ) ) ( not ( = ?auto_281780 ?auto_281783 ) ) ( not ( = ?auto_281780 ?auto_281784 ) ) ( not ( = ?auto_281780 ?auto_281785 ) ) ( not ( = ?auto_281781 ?auto_281782 ) ) ( not ( = ?auto_281781 ?auto_281783 ) ) ( not ( = ?auto_281781 ?auto_281784 ) ) ( not ( = ?auto_281781 ?auto_281785 ) ) ( not ( = ?auto_281782 ?auto_281783 ) ) ( not ( = ?auto_281782 ?auto_281784 ) ) ( not ( = ?auto_281782 ?auto_281785 ) ) ( not ( = ?auto_281783 ?auto_281784 ) ) ( not ( = ?auto_281783 ?auto_281785 ) ) ( not ( = ?auto_281784 ?auto_281785 ) ) ( ON ?auto_281783 ?auto_281784 ) ( ON ?auto_281782 ?auto_281783 ) ( ON ?auto_281781 ?auto_281782 ) ( ON ?auto_281780 ?auto_281781 ) ( ON ?auto_281779 ?auto_281780 ) ( ON ?auto_281778 ?auto_281779 ) ( ON ?auto_281777 ?auto_281778 ) ( CLEAR ?auto_281775 ) ( ON ?auto_281776 ?auto_281777 ) ( CLEAR ?auto_281776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_281773 ?auto_281774 ?auto_281775 ?auto_281776 )
      ( MAKE-12PILE ?auto_281773 ?auto_281774 ?auto_281775 ?auto_281776 ?auto_281777 ?auto_281778 ?auto_281779 ?auto_281780 ?auto_281781 ?auto_281782 ?auto_281783 ?auto_281784 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281798 - BLOCK
      ?auto_281799 - BLOCK
      ?auto_281800 - BLOCK
      ?auto_281801 - BLOCK
      ?auto_281802 - BLOCK
      ?auto_281803 - BLOCK
      ?auto_281804 - BLOCK
      ?auto_281805 - BLOCK
      ?auto_281806 - BLOCK
      ?auto_281807 - BLOCK
      ?auto_281808 - BLOCK
      ?auto_281809 - BLOCK
    )
    :vars
    (
      ?auto_281810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281809 ?auto_281810 ) ( ON-TABLE ?auto_281798 ) ( ON ?auto_281799 ?auto_281798 ) ( ON ?auto_281800 ?auto_281799 ) ( not ( = ?auto_281798 ?auto_281799 ) ) ( not ( = ?auto_281798 ?auto_281800 ) ) ( not ( = ?auto_281798 ?auto_281801 ) ) ( not ( = ?auto_281798 ?auto_281802 ) ) ( not ( = ?auto_281798 ?auto_281803 ) ) ( not ( = ?auto_281798 ?auto_281804 ) ) ( not ( = ?auto_281798 ?auto_281805 ) ) ( not ( = ?auto_281798 ?auto_281806 ) ) ( not ( = ?auto_281798 ?auto_281807 ) ) ( not ( = ?auto_281798 ?auto_281808 ) ) ( not ( = ?auto_281798 ?auto_281809 ) ) ( not ( = ?auto_281798 ?auto_281810 ) ) ( not ( = ?auto_281799 ?auto_281800 ) ) ( not ( = ?auto_281799 ?auto_281801 ) ) ( not ( = ?auto_281799 ?auto_281802 ) ) ( not ( = ?auto_281799 ?auto_281803 ) ) ( not ( = ?auto_281799 ?auto_281804 ) ) ( not ( = ?auto_281799 ?auto_281805 ) ) ( not ( = ?auto_281799 ?auto_281806 ) ) ( not ( = ?auto_281799 ?auto_281807 ) ) ( not ( = ?auto_281799 ?auto_281808 ) ) ( not ( = ?auto_281799 ?auto_281809 ) ) ( not ( = ?auto_281799 ?auto_281810 ) ) ( not ( = ?auto_281800 ?auto_281801 ) ) ( not ( = ?auto_281800 ?auto_281802 ) ) ( not ( = ?auto_281800 ?auto_281803 ) ) ( not ( = ?auto_281800 ?auto_281804 ) ) ( not ( = ?auto_281800 ?auto_281805 ) ) ( not ( = ?auto_281800 ?auto_281806 ) ) ( not ( = ?auto_281800 ?auto_281807 ) ) ( not ( = ?auto_281800 ?auto_281808 ) ) ( not ( = ?auto_281800 ?auto_281809 ) ) ( not ( = ?auto_281800 ?auto_281810 ) ) ( not ( = ?auto_281801 ?auto_281802 ) ) ( not ( = ?auto_281801 ?auto_281803 ) ) ( not ( = ?auto_281801 ?auto_281804 ) ) ( not ( = ?auto_281801 ?auto_281805 ) ) ( not ( = ?auto_281801 ?auto_281806 ) ) ( not ( = ?auto_281801 ?auto_281807 ) ) ( not ( = ?auto_281801 ?auto_281808 ) ) ( not ( = ?auto_281801 ?auto_281809 ) ) ( not ( = ?auto_281801 ?auto_281810 ) ) ( not ( = ?auto_281802 ?auto_281803 ) ) ( not ( = ?auto_281802 ?auto_281804 ) ) ( not ( = ?auto_281802 ?auto_281805 ) ) ( not ( = ?auto_281802 ?auto_281806 ) ) ( not ( = ?auto_281802 ?auto_281807 ) ) ( not ( = ?auto_281802 ?auto_281808 ) ) ( not ( = ?auto_281802 ?auto_281809 ) ) ( not ( = ?auto_281802 ?auto_281810 ) ) ( not ( = ?auto_281803 ?auto_281804 ) ) ( not ( = ?auto_281803 ?auto_281805 ) ) ( not ( = ?auto_281803 ?auto_281806 ) ) ( not ( = ?auto_281803 ?auto_281807 ) ) ( not ( = ?auto_281803 ?auto_281808 ) ) ( not ( = ?auto_281803 ?auto_281809 ) ) ( not ( = ?auto_281803 ?auto_281810 ) ) ( not ( = ?auto_281804 ?auto_281805 ) ) ( not ( = ?auto_281804 ?auto_281806 ) ) ( not ( = ?auto_281804 ?auto_281807 ) ) ( not ( = ?auto_281804 ?auto_281808 ) ) ( not ( = ?auto_281804 ?auto_281809 ) ) ( not ( = ?auto_281804 ?auto_281810 ) ) ( not ( = ?auto_281805 ?auto_281806 ) ) ( not ( = ?auto_281805 ?auto_281807 ) ) ( not ( = ?auto_281805 ?auto_281808 ) ) ( not ( = ?auto_281805 ?auto_281809 ) ) ( not ( = ?auto_281805 ?auto_281810 ) ) ( not ( = ?auto_281806 ?auto_281807 ) ) ( not ( = ?auto_281806 ?auto_281808 ) ) ( not ( = ?auto_281806 ?auto_281809 ) ) ( not ( = ?auto_281806 ?auto_281810 ) ) ( not ( = ?auto_281807 ?auto_281808 ) ) ( not ( = ?auto_281807 ?auto_281809 ) ) ( not ( = ?auto_281807 ?auto_281810 ) ) ( not ( = ?auto_281808 ?auto_281809 ) ) ( not ( = ?auto_281808 ?auto_281810 ) ) ( not ( = ?auto_281809 ?auto_281810 ) ) ( ON ?auto_281808 ?auto_281809 ) ( ON ?auto_281807 ?auto_281808 ) ( ON ?auto_281806 ?auto_281807 ) ( ON ?auto_281805 ?auto_281806 ) ( ON ?auto_281804 ?auto_281805 ) ( ON ?auto_281803 ?auto_281804 ) ( ON ?auto_281802 ?auto_281803 ) ( CLEAR ?auto_281800 ) ( ON ?auto_281801 ?auto_281802 ) ( CLEAR ?auto_281801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_281798 ?auto_281799 ?auto_281800 ?auto_281801 )
      ( MAKE-12PILE ?auto_281798 ?auto_281799 ?auto_281800 ?auto_281801 ?auto_281802 ?auto_281803 ?auto_281804 ?auto_281805 ?auto_281806 ?auto_281807 ?auto_281808 ?auto_281809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281823 - BLOCK
      ?auto_281824 - BLOCK
      ?auto_281825 - BLOCK
      ?auto_281826 - BLOCK
      ?auto_281827 - BLOCK
      ?auto_281828 - BLOCK
      ?auto_281829 - BLOCK
      ?auto_281830 - BLOCK
      ?auto_281831 - BLOCK
      ?auto_281832 - BLOCK
      ?auto_281833 - BLOCK
      ?auto_281834 - BLOCK
    )
    :vars
    (
      ?auto_281835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281834 ?auto_281835 ) ( ON-TABLE ?auto_281823 ) ( ON ?auto_281824 ?auto_281823 ) ( not ( = ?auto_281823 ?auto_281824 ) ) ( not ( = ?auto_281823 ?auto_281825 ) ) ( not ( = ?auto_281823 ?auto_281826 ) ) ( not ( = ?auto_281823 ?auto_281827 ) ) ( not ( = ?auto_281823 ?auto_281828 ) ) ( not ( = ?auto_281823 ?auto_281829 ) ) ( not ( = ?auto_281823 ?auto_281830 ) ) ( not ( = ?auto_281823 ?auto_281831 ) ) ( not ( = ?auto_281823 ?auto_281832 ) ) ( not ( = ?auto_281823 ?auto_281833 ) ) ( not ( = ?auto_281823 ?auto_281834 ) ) ( not ( = ?auto_281823 ?auto_281835 ) ) ( not ( = ?auto_281824 ?auto_281825 ) ) ( not ( = ?auto_281824 ?auto_281826 ) ) ( not ( = ?auto_281824 ?auto_281827 ) ) ( not ( = ?auto_281824 ?auto_281828 ) ) ( not ( = ?auto_281824 ?auto_281829 ) ) ( not ( = ?auto_281824 ?auto_281830 ) ) ( not ( = ?auto_281824 ?auto_281831 ) ) ( not ( = ?auto_281824 ?auto_281832 ) ) ( not ( = ?auto_281824 ?auto_281833 ) ) ( not ( = ?auto_281824 ?auto_281834 ) ) ( not ( = ?auto_281824 ?auto_281835 ) ) ( not ( = ?auto_281825 ?auto_281826 ) ) ( not ( = ?auto_281825 ?auto_281827 ) ) ( not ( = ?auto_281825 ?auto_281828 ) ) ( not ( = ?auto_281825 ?auto_281829 ) ) ( not ( = ?auto_281825 ?auto_281830 ) ) ( not ( = ?auto_281825 ?auto_281831 ) ) ( not ( = ?auto_281825 ?auto_281832 ) ) ( not ( = ?auto_281825 ?auto_281833 ) ) ( not ( = ?auto_281825 ?auto_281834 ) ) ( not ( = ?auto_281825 ?auto_281835 ) ) ( not ( = ?auto_281826 ?auto_281827 ) ) ( not ( = ?auto_281826 ?auto_281828 ) ) ( not ( = ?auto_281826 ?auto_281829 ) ) ( not ( = ?auto_281826 ?auto_281830 ) ) ( not ( = ?auto_281826 ?auto_281831 ) ) ( not ( = ?auto_281826 ?auto_281832 ) ) ( not ( = ?auto_281826 ?auto_281833 ) ) ( not ( = ?auto_281826 ?auto_281834 ) ) ( not ( = ?auto_281826 ?auto_281835 ) ) ( not ( = ?auto_281827 ?auto_281828 ) ) ( not ( = ?auto_281827 ?auto_281829 ) ) ( not ( = ?auto_281827 ?auto_281830 ) ) ( not ( = ?auto_281827 ?auto_281831 ) ) ( not ( = ?auto_281827 ?auto_281832 ) ) ( not ( = ?auto_281827 ?auto_281833 ) ) ( not ( = ?auto_281827 ?auto_281834 ) ) ( not ( = ?auto_281827 ?auto_281835 ) ) ( not ( = ?auto_281828 ?auto_281829 ) ) ( not ( = ?auto_281828 ?auto_281830 ) ) ( not ( = ?auto_281828 ?auto_281831 ) ) ( not ( = ?auto_281828 ?auto_281832 ) ) ( not ( = ?auto_281828 ?auto_281833 ) ) ( not ( = ?auto_281828 ?auto_281834 ) ) ( not ( = ?auto_281828 ?auto_281835 ) ) ( not ( = ?auto_281829 ?auto_281830 ) ) ( not ( = ?auto_281829 ?auto_281831 ) ) ( not ( = ?auto_281829 ?auto_281832 ) ) ( not ( = ?auto_281829 ?auto_281833 ) ) ( not ( = ?auto_281829 ?auto_281834 ) ) ( not ( = ?auto_281829 ?auto_281835 ) ) ( not ( = ?auto_281830 ?auto_281831 ) ) ( not ( = ?auto_281830 ?auto_281832 ) ) ( not ( = ?auto_281830 ?auto_281833 ) ) ( not ( = ?auto_281830 ?auto_281834 ) ) ( not ( = ?auto_281830 ?auto_281835 ) ) ( not ( = ?auto_281831 ?auto_281832 ) ) ( not ( = ?auto_281831 ?auto_281833 ) ) ( not ( = ?auto_281831 ?auto_281834 ) ) ( not ( = ?auto_281831 ?auto_281835 ) ) ( not ( = ?auto_281832 ?auto_281833 ) ) ( not ( = ?auto_281832 ?auto_281834 ) ) ( not ( = ?auto_281832 ?auto_281835 ) ) ( not ( = ?auto_281833 ?auto_281834 ) ) ( not ( = ?auto_281833 ?auto_281835 ) ) ( not ( = ?auto_281834 ?auto_281835 ) ) ( ON ?auto_281833 ?auto_281834 ) ( ON ?auto_281832 ?auto_281833 ) ( ON ?auto_281831 ?auto_281832 ) ( ON ?auto_281830 ?auto_281831 ) ( ON ?auto_281829 ?auto_281830 ) ( ON ?auto_281828 ?auto_281829 ) ( ON ?auto_281827 ?auto_281828 ) ( ON ?auto_281826 ?auto_281827 ) ( CLEAR ?auto_281824 ) ( ON ?auto_281825 ?auto_281826 ) ( CLEAR ?auto_281825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_281823 ?auto_281824 ?auto_281825 )
      ( MAKE-12PILE ?auto_281823 ?auto_281824 ?auto_281825 ?auto_281826 ?auto_281827 ?auto_281828 ?auto_281829 ?auto_281830 ?auto_281831 ?auto_281832 ?auto_281833 ?auto_281834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281848 - BLOCK
      ?auto_281849 - BLOCK
      ?auto_281850 - BLOCK
      ?auto_281851 - BLOCK
      ?auto_281852 - BLOCK
      ?auto_281853 - BLOCK
      ?auto_281854 - BLOCK
      ?auto_281855 - BLOCK
      ?auto_281856 - BLOCK
      ?auto_281857 - BLOCK
      ?auto_281858 - BLOCK
      ?auto_281859 - BLOCK
    )
    :vars
    (
      ?auto_281860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281859 ?auto_281860 ) ( ON-TABLE ?auto_281848 ) ( ON ?auto_281849 ?auto_281848 ) ( not ( = ?auto_281848 ?auto_281849 ) ) ( not ( = ?auto_281848 ?auto_281850 ) ) ( not ( = ?auto_281848 ?auto_281851 ) ) ( not ( = ?auto_281848 ?auto_281852 ) ) ( not ( = ?auto_281848 ?auto_281853 ) ) ( not ( = ?auto_281848 ?auto_281854 ) ) ( not ( = ?auto_281848 ?auto_281855 ) ) ( not ( = ?auto_281848 ?auto_281856 ) ) ( not ( = ?auto_281848 ?auto_281857 ) ) ( not ( = ?auto_281848 ?auto_281858 ) ) ( not ( = ?auto_281848 ?auto_281859 ) ) ( not ( = ?auto_281848 ?auto_281860 ) ) ( not ( = ?auto_281849 ?auto_281850 ) ) ( not ( = ?auto_281849 ?auto_281851 ) ) ( not ( = ?auto_281849 ?auto_281852 ) ) ( not ( = ?auto_281849 ?auto_281853 ) ) ( not ( = ?auto_281849 ?auto_281854 ) ) ( not ( = ?auto_281849 ?auto_281855 ) ) ( not ( = ?auto_281849 ?auto_281856 ) ) ( not ( = ?auto_281849 ?auto_281857 ) ) ( not ( = ?auto_281849 ?auto_281858 ) ) ( not ( = ?auto_281849 ?auto_281859 ) ) ( not ( = ?auto_281849 ?auto_281860 ) ) ( not ( = ?auto_281850 ?auto_281851 ) ) ( not ( = ?auto_281850 ?auto_281852 ) ) ( not ( = ?auto_281850 ?auto_281853 ) ) ( not ( = ?auto_281850 ?auto_281854 ) ) ( not ( = ?auto_281850 ?auto_281855 ) ) ( not ( = ?auto_281850 ?auto_281856 ) ) ( not ( = ?auto_281850 ?auto_281857 ) ) ( not ( = ?auto_281850 ?auto_281858 ) ) ( not ( = ?auto_281850 ?auto_281859 ) ) ( not ( = ?auto_281850 ?auto_281860 ) ) ( not ( = ?auto_281851 ?auto_281852 ) ) ( not ( = ?auto_281851 ?auto_281853 ) ) ( not ( = ?auto_281851 ?auto_281854 ) ) ( not ( = ?auto_281851 ?auto_281855 ) ) ( not ( = ?auto_281851 ?auto_281856 ) ) ( not ( = ?auto_281851 ?auto_281857 ) ) ( not ( = ?auto_281851 ?auto_281858 ) ) ( not ( = ?auto_281851 ?auto_281859 ) ) ( not ( = ?auto_281851 ?auto_281860 ) ) ( not ( = ?auto_281852 ?auto_281853 ) ) ( not ( = ?auto_281852 ?auto_281854 ) ) ( not ( = ?auto_281852 ?auto_281855 ) ) ( not ( = ?auto_281852 ?auto_281856 ) ) ( not ( = ?auto_281852 ?auto_281857 ) ) ( not ( = ?auto_281852 ?auto_281858 ) ) ( not ( = ?auto_281852 ?auto_281859 ) ) ( not ( = ?auto_281852 ?auto_281860 ) ) ( not ( = ?auto_281853 ?auto_281854 ) ) ( not ( = ?auto_281853 ?auto_281855 ) ) ( not ( = ?auto_281853 ?auto_281856 ) ) ( not ( = ?auto_281853 ?auto_281857 ) ) ( not ( = ?auto_281853 ?auto_281858 ) ) ( not ( = ?auto_281853 ?auto_281859 ) ) ( not ( = ?auto_281853 ?auto_281860 ) ) ( not ( = ?auto_281854 ?auto_281855 ) ) ( not ( = ?auto_281854 ?auto_281856 ) ) ( not ( = ?auto_281854 ?auto_281857 ) ) ( not ( = ?auto_281854 ?auto_281858 ) ) ( not ( = ?auto_281854 ?auto_281859 ) ) ( not ( = ?auto_281854 ?auto_281860 ) ) ( not ( = ?auto_281855 ?auto_281856 ) ) ( not ( = ?auto_281855 ?auto_281857 ) ) ( not ( = ?auto_281855 ?auto_281858 ) ) ( not ( = ?auto_281855 ?auto_281859 ) ) ( not ( = ?auto_281855 ?auto_281860 ) ) ( not ( = ?auto_281856 ?auto_281857 ) ) ( not ( = ?auto_281856 ?auto_281858 ) ) ( not ( = ?auto_281856 ?auto_281859 ) ) ( not ( = ?auto_281856 ?auto_281860 ) ) ( not ( = ?auto_281857 ?auto_281858 ) ) ( not ( = ?auto_281857 ?auto_281859 ) ) ( not ( = ?auto_281857 ?auto_281860 ) ) ( not ( = ?auto_281858 ?auto_281859 ) ) ( not ( = ?auto_281858 ?auto_281860 ) ) ( not ( = ?auto_281859 ?auto_281860 ) ) ( ON ?auto_281858 ?auto_281859 ) ( ON ?auto_281857 ?auto_281858 ) ( ON ?auto_281856 ?auto_281857 ) ( ON ?auto_281855 ?auto_281856 ) ( ON ?auto_281854 ?auto_281855 ) ( ON ?auto_281853 ?auto_281854 ) ( ON ?auto_281852 ?auto_281853 ) ( ON ?auto_281851 ?auto_281852 ) ( CLEAR ?auto_281849 ) ( ON ?auto_281850 ?auto_281851 ) ( CLEAR ?auto_281850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_281848 ?auto_281849 ?auto_281850 )
      ( MAKE-12PILE ?auto_281848 ?auto_281849 ?auto_281850 ?auto_281851 ?auto_281852 ?auto_281853 ?auto_281854 ?auto_281855 ?auto_281856 ?auto_281857 ?auto_281858 ?auto_281859 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281873 - BLOCK
      ?auto_281874 - BLOCK
      ?auto_281875 - BLOCK
      ?auto_281876 - BLOCK
      ?auto_281877 - BLOCK
      ?auto_281878 - BLOCK
      ?auto_281879 - BLOCK
      ?auto_281880 - BLOCK
      ?auto_281881 - BLOCK
      ?auto_281882 - BLOCK
      ?auto_281883 - BLOCK
      ?auto_281884 - BLOCK
    )
    :vars
    (
      ?auto_281885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281884 ?auto_281885 ) ( ON-TABLE ?auto_281873 ) ( not ( = ?auto_281873 ?auto_281874 ) ) ( not ( = ?auto_281873 ?auto_281875 ) ) ( not ( = ?auto_281873 ?auto_281876 ) ) ( not ( = ?auto_281873 ?auto_281877 ) ) ( not ( = ?auto_281873 ?auto_281878 ) ) ( not ( = ?auto_281873 ?auto_281879 ) ) ( not ( = ?auto_281873 ?auto_281880 ) ) ( not ( = ?auto_281873 ?auto_281881 ) ) ( not ( = ?auto_281873 ?auto_281882 ) ) ( not ( = ?auto_281873 ?auto_281883 ) ) ( not ( = ?auto_281873 ?auto_281884 ) ) ( not ( = ?auto_281873 ?auto_281885 ) ) ( not ( = ?auto_281874 ?auto_281875 ) ) ( not ( = ?auto_281874 ?auto_281876 ) ) ( not ( = ?auto_281874 ?auto_281877 ) ) ( not ( = ?auto_281874 ?auto_281878 ) ) ( not ( = ?auto_281874 ?auto_281879 ) ) ( not ( = ?auto_281874 ?auto_281880 ) ) ( not ( = ?auto_281874 ?auto_281881 ) ) ( not ( = ?auto_281874 ?auto_281882 ) ) ( not ( = ?auto_281874 ?auto_281883 ) ) ( not ( = ?auto_281874 ?auto_281884 ) ) ( not ( = ?auto_281874 ?auto_281885 ) ) ( not ( = ?auto_281875 ?auto_281876 ) ) ( not ( = ?auto_281875 ?auto_281877 ) ) ( not ( = ?auto_281875 ?auto_281878 ) ) ( not ( = ?auto_281875 ?auto_281879 ) ) ( not ( = ?auto_281875 ?auto_281880 ) ) ( not ( = ?auto_281875 ?auto_281881 ) ) ( not ( = ?auto_281875 ?auto_281882 ) ) ( not ( = ?auto_281875 ?auto_281883 ) ) ( not ( = ?auto_281875 ?auto_281884 ) ) ( not ( = ?auto_281875 ?auto_281885 ) ) ( not ( = ?auto_281876 ?auto_281877 ) ) ( not ( = ?auto_281876 ?auto_281878 ) ) ( not ( = ?auto_281876 ?auto_281879 ) ) ( not ( = ?auto_281876 ?auto_281880 ) ) ( not ( = ?auto_281876 ?auto_281881 ) ) ( not ( = ?auto_281876 ?auto_281882 ) ) ( not ( = ?auto_281876 ?auto_281883 ) ) ( not ( = ?auto_281876 ?auto_281884 ) ) ( not ( = ?auto_281876 ?auto_281885 ) ) ( not ( = ?auto_281877 ?auto_281878 ) ) ( not ( = ?auto_281877 ?auto_281879 ) ) ( not ( = ?auto_281877 ?auto_281880 ) ) ( not ( = ?auto_281877 ?auto_281881 ) ) ( not ( = ?auto_281877 ?auto_281882 ) ) ( not ( = ?auto_281877 ?auto_281883 ) ) ( not ( = ?auto_281877 ?auto_281884 ) ) ( not ( = ?auto_281877 ?auto_281885 ) ) ( not ( = ?auto_281878 ?auto_281879 ) ) ( not ( = ?auto_281878 ?auto_281880 ) ) ( not ( = ?auto_281878 ?auto_281881 ) ) ( not ( = ?auto_281878 ?auto_281882 ) ) ( not ( = ?auto_281878 ?auto_281883 ) ) ( not ( = ?auto_281878 ?auto_281884 ) ) ( not ( = ?auto_281878 ?auto_281885 ) ) ( not ( = ?auto_281879 ?auto_281880 ) ) ( not ( = ?auto_281879 ?auto_281881 ) ) ( not ( = ?auto_281879 ?auto_281882 ) ) ( not ( = ?auto_281879 ?auto_281883 ) ) ( not ( = ?auto_281879 ?auto_281884 ) ) ( not ( = ?auto_281879 ?auto_281885 ) ) ( not ( = ?auto_281880 ?auto_281881 ) ) ( not ( = ?auto_281880 ?auto_281882 ) ) ( not ( = ?auto_281880 ?auto_281883 ) ) ( not ( = ?auto_281880 ?auto_281884 ) ) ( not ( = ?auto_281880 ?auto_281885 ) ) ( not ( = ?auto_281881 ?auto_281882 ) ) ( not ( = ?auto_281881 ?auto_281883 ) ) ( not ( = ?auto_281881 ?auto_281884 ) ) ( not ( = ?auto_281881 ?auto_281885 ) ) ( not ( = ?auto_281882 ?auto_281883 ) ) ( not ( = ?auto_281882 ?auto_281884 ) ) ( not ( = ?auto_281882 ?auto_281885 ) ) ( not ( = ?auto_281883 ?auto_281884 ) ) ( not ( = ?auto_281883 ?auto_281885 ) ) ( not ( = ?auto_281884 ?auto_281885 ) ) ( ON ?auto_281883 ?auto_281884 ) ( ON ?auto_281882 ?auto_281883 ) ( ON ?auto_281881 ?auto_281882 ) ( ON ?auto_281880 ?auto_281881 ) ( ON ?auto_281879 ?auto_281880 ) ( ON ?auto_281878 ?auto_281879 ) ( ON ?auto_281877 ?auto_281878 ) ( ON ?auto_281876 ?auto_281877 ) ( ON ?auto_281875 ?auto_281876 ) ( CLEAR ?auto_281873 ) ( ON ?auto_281874 ?auto_281875 ) ( CLEAR ?auto_281874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_281873 ?auto_281874 )
      ( MAKE-12PILE ?auto_281873 ?auto_281874 ?auto_281875 ?auto_281876 ?auto_281877 ?auto_281878 ?auto_281879 ?auto_281880 ?auto_281881 ?auto_281882 ?auto_281883 ?auto_281884 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281898 - BLOCK
      ?auto_281899 - BLOCK
      ?auto_281900 - BLOCK
      ?auto_281901 - BLOCK
      ?auto_281902 - BLOCK
      ?auto_281903 - BLOCK
      ?auto_281904 - BLOCK
      ?auto_281905 - BLOCK
      ?auto_281906 - BLOCK
      ?auto_281907 - BLOCK
      ?auto_281908 - BLOCK
      ?auto_281909 - BLOCK
    )
    :vars
    (
      ?auto_281910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281909 ?auto_281910 ) ( ON-TABLE ?auto_281898 ) ( not ( = ?auto_281898 ?auto_281899 ) ) ( not ( = ?auto_281898 ?auto_281900 ) ) ( not ( = ?auto_281898 ?auto_281901 ) ) ( not ( = ?auto_281898 ?auto_281902 ) ) ( not ( = ?auto_281898 ?auto_281903 ) ) ( not ( = ?auto_281898 ?auto_281904 ) ) ( not ( = ?auto_281898 ?auto_281905 ) ) ( not ( = ?auto_281898 ?auto_281906 ) ) ( not ( = ?auto_281898 ?auto_281907 ) ) ( not ( = ?auto_281898 ?auto_281908 ) ) ( not ( = ?auto_281898 ?auto_281909 ) ) ( not ( = ?auto_281898 ?auto_281910 ) ) ( not ( = ?auto_281899 ?auto_281900 ) ) ( not ( = ?auto_281899 ?auto_281901 ) ) ( not ( = ?auto_281899 ?auto_281902 ) ) ( not ( = ?auto_281899 ?auto_281903 ) ) ( not ( = ?auto_281899 ?auto_281904 ) ) ( not ( = ?auto_281899 ?auto_281905 ) ) ( not ( = ?auto_281899 ?auto_281906 ) ) ( not ( = ?auto_281899 ?auto_281907 ) ) ( not ( = ?auto_281899 ?auto_281908 ) ) ( not ( = ?auto_281899 ?auto_281909 ) ) ( not ( = ?auto_281899 ?auto_281910 ) ) ( not ( = ?auto_281900 ?auto_281901 ) ) ( not ( = ?auto_281900 ?auto_281902 ) ) ( not ( = ?auto_281900 ?auto_281903 ) ) ( not ( = ?auto_281900 ?auto_281904 ) ) ( not ( = ?auto_281900 ?auto_281905 ) ) ( not ( = ?auto_281900 ?auto_281906 ) ) ( not ( = ?auto_281900 ?auto_281907 ) ) ( not ( = ?auto_281900 ?auto_281908 ) ) ( not ( = ?auto_281900 ?auto_281909 ) ) ( not ( = ?auto_281900 ?auto_281910 ) ) ( not ( = ?auto_281901 ?auto_281902 ) ) ( not ( = ?auto_281901 ?auto_281903 ) ) ( not ( = ?auto_281901 ?auto_281904 ) ) ( not ( = ?auto_281901 ?auto_281905 ) ) ( not ( = ?auto_281901 ?auto_281906 ) ) ( not ( = ?auto_281901 ?auto_281907 ) ) ( not ( = ?auto_281901 ?auto_281908 ) ) ( not ( = ?auto_281901 ?auto_281909 ) ) ( not ( = ?auto_281901 ?auto_281910 ) ) ( not ( = ?auto_281902 ?auto_281903 ) ) ( not ( = ?auto_281902 ?auto_281904 ) ) ( not ( = ?auto_281902 ?auto_281905 ) ) ( not ( = ?auto_281902 ?auto_281906 ) ) ( not ( = ?auto_281902 ?auto_281907 ) ) ( not ( = ?auto_281902 ?auto_281908 ) ) ( not ( = ?auto_281902 ?auto_281909 ) ) ( not ( = ?auto_281902 ?auto_281910 ) ) ( not ( = ?auto_281903 ?auto_281904 ) ) ( not ( = ?auto_281903 ?auto_281905 ) ) ( not ( = ?auto_281903 ?auto_281906 ) ) ( not ( = ?auto_281903 ?auto_281907 ) ) ( not ( = ?auto_281903 ?auto_281908 ) ) ( not ( = ?auto_281903 ?auto_281909 ) ) ( not ( = ?auto_281903 ?auto_281910 ) ) ( not ( = ?auto_281904 ?auto_281905 ) ) ( not ( = ?auto_281904 ?auto_281906 ) ) ( not ( = ?auto_281904 ?auto_281907 ) ) ( not ( = ?auto_281904 ?auto_281908 ) ) ( not ( = ?auto_281904 ?auto_281909 ) ) ( not ( = ?auto_281904 ?auto_281910 ) ) ( not ( = ?auto_281905 ?auto_281906 ) ) ( not ( = ?auto_281905 ?auto_281907 ) ) ( not ( = ?auto_281905 ?auto_281908 ) ) ( not ( = ?auto_281905 ?auto_281909 ) ) ( not ( = ?auto_281905 ?auto_281910 ) ) ( not ( = ?auto_281906 ?auto_281907 ) ) ( not ( = ?auto_281906 ?auto_281908 ) ) ( not ( = ?auto_281906 ?auto_281909 ) ) ( not ( = ?auto_281906 ?auto_281910 ) ) ( not ( = ?auto_281907 ?auto_281908 ) ) ( not ( = ?auto_281907 ?auto_281909 ) ) ( not ( = ?auto_281907 ?auto_281910 ) ) ( not ( = ?auto_281908 ?auto_281909 ) ) ( not ( = ?auto_281908 ?auto_281910 ) ) ( not ( = ?auto_281909 ?auto_281910 ) ) ( ON ?auto_281908 ?auto_281909 ) ( ON ?auto_281907 ?auto_281908 ) ( ON ?auto_281906 ?auto_281907 ) ( ON ?auto_281905 ?auto_281906 ) ( ON ?auto_281904 ?auto_281905 ) ( ON ?auto_281903 ?auto_281904 ) ( ON ?auto_281902 ?auto_281903 ) ( ON ?auto_281901 ?auto_281902 ) ( ON ?auto_281900 ?auto_281901 ) ( CLEAR ?auto_281898 ) ( ON ?auto_281899 ?auto_281900 ) ( CLEAR ?auto_281899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_281898 ?auto_281899 )
      ( MAKE-12PILE ?auto_281898 ?auto_281899 ?auto_281900 ?auto_281901 ?auto_281902 ?auto_281903 ?auto_281904 ?auto_281905 ?auto_281906 ?auto_281907 ?auto_281908 ?auto_281909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281923 - BLOCK
      ?auto_281924 - BLOCK
      ?auto_281925 - BLOCK
      ?auto_281926 - BLOCK
      ?auto_281927 - BLOCK
      ?auto_281928 - BLOCK
      ?auto_281929 - BLOCK
      ?auto_281930 - BLOCK
      ?auto_281931 - BLOCK
      ?auto_281932 - BLOCK
      ?auto_281933 - BLOCK
      ?auto_281934 - BLOCK
    )
    :vars
    (
      ?auto_281935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281934 ?auto_281935 ) ( not ( = ?auto_281923 ?auto_281924 ) ) ( not ( = ?auto_281923 ?auto_281925 ) ) ( not ( = ?auto_281923 ?auto_281926 ) ) ( not ( = ?auto_281923 ?auto_281927 ) ) ( not ( = ?auto_281923 ?auto_281928 ) ) ( not ( = ?auto_281923 ?auto_281929 ) ) ( not ( = ?auto_281923 ?auto_281930 ) ) ( not ( = ?auto_281923 ?auto_281931 ) ) ( not ( = ?auto_281923 ?auto_281932 ) ) ( not ( = ?auto_281923 ?auto_281933 ) ) ( not ( = ?auto_281923 ?auto_281934 ) ) ( not ( = ?auto_281923 ?auto_281935 ) ) ( not ( = ?auto_281924 ?auto_281925 ) ) ( not ( = ?auto_281924 ?auto_281926 ) ) ( not ( = ?auto_281924 ?auto_281927 ) ) ( not ( = ?auto_281924 ?auto_281928 ) ) ( not ( = ?auto_281924 ?auto_281929 ) ) ( not ( = ?auto_281924 ?auto_281930 ) ) ( not ( = ?auto_281924 ?auto_281931 ) ) ( not ( = ?auto_281924 ?auto_281932 ) ) ( not ( = ?auto_281924 ?auto_281933 ) ) ( not ( = ?auto_281924 ?auto_281934 ) ) ( not ( = ?auto_281924 ?auto_281935 ) ) ( not ( = ?auto_281925 ?auto_281926 ) ) ( not ( = ?auto_281925 ?auto_281927 ) ) ( not ( = ?auto_281925 ?auto_281928 ) ) ( not ( = ?auto_281925 ?auto_281929 ) ) ( not ( = ?auto_281925 ?auto_281930 ) ) ( not ( = ?auto_281925 ?auto_281931 ) ) ( not ( = ?auto_281925 ?auto_281932 ) ) ( not ( = ?auto_281925 ?auto_281933 ) ) ( not ( = ?auto_281925 ?auto_281934 ) ) ( not ( = ?auto_281925 ?auto_281935 ) ) ( not ( = ?auto_281926 ?auto_281927 ) ) ( not ( = ?auto_281926 ?auto_281928 ) ) ( not ( = ?auto_281926 ?auto_281929 ) ) ( not ( = ?auto_281926 ?auto_281930 ) ) ( not ( = ?auto_281926 ?auto_281931 ) ) ( not ( = ?auto_281926 ?auto_281932 ) ) ( not ( = ?auto_281926 ?auto_281933 ) ) ( not ( = ?auto_281926 ?auto_281934 ) ) ( not ( = ?auto_281926 ?auto_281935 ) ) ( not ( = ?auto_281927 ?auto_281928 ) ) ( not ( = ?auto_281927 ?auto_281929 ) ) ( not ( = ?auto_281927 ?auto_281930 ) ) ( not ( = ?auto_281927 ?auto_281931 ) ) ( not ( = ?auto_281927 ?auto_281932 ) ) ( not ( = ?auto_281927 ?auto_281933 ) ) ( not ( = ?auto_281927 ?auto_281934 ) ) ( not ( = ?auto_281927 ?auto_281935 ) ) ( not ( = ?auto_281928 ?auto_281929 ) ) ( not ( = ?auto_281928 ?auto_281930 ) ) ( not ( = ?auto_281928 ?auto_281931 ) ) ( not ( = ?auto_281928 ?auto_281932 ) ) ( not ( = ?auto_281928 ?auto_281933 ) ) ( not ( = ?auto_281928 ?auto_281934 ) ) ( not ( = ?auto_281928 ?auto_281935 ) ) ( not ( = ?auto_281929 ?auto_281930 ) ) ( not ( = ?auto_281929 ?auto_281931 ) ) ( not ( = ?auto_281929 ?auto_281932 ) ) ( not ( = ?auto_281929 ?auto_281933 ) ) ( not ( = ?auto_281929 ?auto_281934 ) ) ( not ( = ?auto_281929 ?auto_281935 ) ) ( not ( = ?auto_281930 ?auto_281931 ) ) ( not ( = ?auto_281930 ?auto_281932 ) ) ( not ( = ?auto_281930 ?auto_281933 ) ) ( not ( = ?auto_281930 ?auto_281934 ) ) ( not ( = ?auto_281930 ?auto_281935 ) ) ( not ( = ?auto_281931 ?auto_281932 ) ) ( not ( = ?auto_281931 ?auto_281933 ) ) ( not ( = ?auto_281931 ?auto_281934 ) ) ( not ( = ?auto_281931 ?auto_281935 ) ) ( not ( = ?auto_281932 ?auto_281933 ) ) ( not ( = ?auto_281932 ?auto_281934 ) ) ( not ( = ?auto_281932 ?auto_281935 ) ) ( not ( = ?auto_281933 ?auto_281934 ) ) ( not ( = ?auto_281933 ?auto_281935 ) ) ( not ( = ?auto_281934 ?auto_281935 ) ) ( ON ?auto_281933 ?auto_281934 ) ( ON ?auto_281932 ?auto_281933 ) ( ON ?auto_281931 ?auto_281932 ) ( ON ?auto_281930 ?auto_281931 ) ( ON ?auto_281929 ?auto_281930 ) ( ON ?auto_281928 ?auto_281929 ) ( ON ?auto_281927 ?auto_281928 ) ( ON ?auto_281926 ?auto_281927 ) ( ON ?auto_281925 ?auto_281926 ) ( ON ?auto_281924 ?auto_281925 ) ( ON ?auto_281923 ?auto_281924 ) ( CLEAR ?auto_281923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_281923 )
      ( MAKE-12PILE ?auto_281923 ?auto_281924 ?auto_281925 ?auto_281926 ?auto_281927 ?auto_281928 ?auto_281929 ?auto_281930 ?auto_281931 ?auto_281932 ?auto_281933 ?auto_281934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_281948 - BLOCK
      ?auto_281949 - BLOCK
      ?auto_281950 - BLOCK
      ?auto_281951 - BLOCK
      ?auto_281952 - BLOCK
      ?auto_281953 - BLOCK
      ?auto_281954 - BLOCK
      ?auto_281955 - BLOCK
      ?auto_281956 - BLOCK
      ?auto_281957 - BLOCK
      ?auto_281958 - BLOCK
      ?auto_281959 - BLOCK
    )
    :vars
    (
      ?auto_281960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_281959 ?auto_281960 ) ( not ( = ?auto_281948 ?auto_281949 ) ) ( not ( = ?auto_281948 ?auto_281950 ) ) ( not ( = ?auto_281948 ?auto_281951 ) ) ( not ( = ?auto_281948 ?auto_281952 ) ) ( not ( = ?auto_281948 ?auto_281953 ) ) ( not ( = ?auto_281948 ?auto_281954 ) ) ( not ( = ?auto_281948 ?auto_281955 ) ) ( not ( = ?auto_281948 ?auto_281956 ) ) ( not ( = ?auto_281948 ?auto_281957 ) ) ( not ( = ?auto_281948 ?auto_281958 ) ) ( not ( = ?auto_281948 ?auto_281959 ) ) ( not ( = ?auto_281948 ?auto_281960 ) ) ( not ( = ?auto_281949 ?auto_281950 ) ) ( not ( = ?auto_281949 ?auto_281951 ) ) ( not ( = ?auto_281949 ?auto_281952 ) ) ( not ( = ?auto_281949 ?auto_281953 ) ) ( not ( = ?auto_281949 ?auto_281954 ) ) ( not ( = ?auto_281949 ?auto_281955 ) ) ( not ( = ?auto_281949 ?auto_281956 ) ) ( not ( = ?auto_281949 ?auto_281957 ) ) ( not ( = ?auto_281949 ?auto_281958 ) ) ( not ( = ?auto_281949 ?auto_281959 ) ) ( not ( = ?auto_281949 ?auto_281960 ) ) ( not ( = ?auto_281950 ?auto_281951 ) ) ( not ( = ?auto_281950 ?auto_281952 ) ) ( not ( = ?auto_281950 ?auto_281953 ) ) ( not ( = ?auto_281950 ?auto_281954 ) ) ( not ( = ?auto_281950 ?auto_281955 ) ) ( not ( = ?auto_281950 ?auto_281956 ) ) ( not ( = ?auto_281950 ?auto_281957 ) ) ( not ( = ?auto_281950 ?auto_281958 ) ) ( not ( = ?auto_281950 ?auto_281959 ) ) ( not ( = ?auto_281950 ?auto_281960 ) ) ( not ( = ?auto_281951 ?auto_281952 ) ) ( not ( = ?auto_281951 ?auto_281953 ) ) ( not ( = ?auto_281951 ?auto_281954 ) ) ( not ( = ?auto_281951 ?auto_281955 ) ) ( not ( = ?auto_281951 ?auto_281956 ) ) ( not ( = ?auto_281951 ?auto_281957 ) ) ( not ( = ?auto_281951 ?auto_281958 ) ) ( not ( = ?auto_281951 ?auto_281959 ) ) ( not ( = ?auto_281951 ?auto_281960 ) ) ( not ( = ?auto_281952 ?auto_281953 ) ) ( not ( = ?auto_281952 ?auto_281954 ) ) ( not ( = ?auto_281952 ?auto_281955 ) ) ( not ( = ?auto_281952 ?auto_281956 ) ) ( not ( = ?auto_281952 ?auto_281957 ) ) ( not ( = ?auto_281952 ?auto_281958 ) ) ( not ( = ?auto_281952 ?auto_281959 ) ) ( not ( = ?auto_281952 ?auto_281960 ) ) ( not ( = ?auto_281953 ?auto_281954 ) ) ( not ( = ?auto_281953 ?auto_281955 ) ) ( not ( = ?auto_281953 ?auto_281956 ) ) ( not ( = ?auto_281953 ?auto_281957 ) ) ( not ( = ?auto_281953 ?auto_281958 ) ) ( not ( = ?auto_281953 ?auto_281959 ) ) ( not ( = ?auto_281953 ?auto_281960 ) ) ( not ( = ?auto_281954 ?auto_281955 ) ) ( not ( = ?auto_281954 ?auto_281956 ) ) ( not ( = ?auto_281954 ?auto_281957 ) ) ( not ( = ?auto_281954 ?auto_281958 ) ) ( not ( = ?auto_281954 ?auto_281959 ) ) ( not ( = ?auto_281954 ?auto_281960 ) ) ( not ( = ?auto_281955 ?auto_281956 ) ) ( not ( = ?auto_281955 ?auto_281957 ) ) ( not ( = ?auto_281955 ?auto_281958 ) ) ( not ( = ?auto_281955 ?auto_281959 ) ) ( not ( = ?auto_281955 ?auto_281960 ) ) ( not ( = ?auto_281956 ?auto_281957 ) ) ( not ( = ?auto_281956 ?auto_281958 ) ) ( not ( = ?auto_281956 ?auto_281959 ) ) ( not ( = ?auto_281956 ?auto_281960 ) ) ( not ( = ?auto_281957 ?auto_281958 ) ) ( not ( = ?auto_281957 ?auto_281959 ) ) ( not ( = ?auto_281957 ?auto_281960 ) ) ( not ( = ?auto_281958 ?auto_281959 ) ) ( not ( = ?auto_281958 ?auto_281960 ) ) ( not ( = ?auto_281959 ?auto_281960 ) ) ( ON ?auto_281958 ?auto_281959 ) ( ON ?auto_281957 ?auto_281958 ) ( ON ?auto_281956 ?auto_281957 ) ( ON ?auto_281955 ?auto_281956 ) ( ON ?auto_281954 ?auto_281955 ) ( ON ?auto_281953 ?auto_281954 ) ( ON ?auto_281952 ?auto_281953 ) ( ON ?auto_281951 ?auto_281952 ) ( ON ?auto_281950 ?auto_281951 ) ( ON ?auto_281949 ?auto_281950 ) ( ON ?auto_281948 ?auto_281949 ) ( CLEAR ?auto_281948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_281948 )
      ( MAKE-12PILE ?auto_281948 ?auto_281949 ?auto_281950 ?auto_281951 ?auto_281952 ?auto_281953 ?auto_281954 ?auto_281955 ?auto_281956 ?auto_281957 ?auto_281958 ?auto_281959 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_281974 - BLOCK
      ?auto_281975 - BLOCK
      ?auto_281976 - BLOCK
      ?auto_281977 - BLOCK
      ?auto_281978 - BLOCK
      ?auto_281979 - BLOCK
      ?auto_281980 - BLOCK
      ?auto_281981 - BLOCK
      ?auto_281982 - BLOCK
      ?auto_281983 - BLOCK
      ?auto_281984 - BLOCK
      ?auto_281985 - BLOCK
      ?auto_281986 - BLOCK
    )
    :vars
    (
      ?auto_281987 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_281985 ) ( ON ?auto_281986 ?auto_281987 ) ( CLEAR ?auto_281986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_281974 ) ( ON ?auto_281975 ?auto_281974 ) ( ON ?auto_281976 ?auto_281975 ) ( ON ?auto_281977 ?auto_281976 ) ( ON ?auto_281978 ?auto_281977 ) ( ON ?auto_281979 ?auto_281978 ) ( ON ?auto_281980 ?auto_281979 ) ( ON ?auto_281981 ?auto_281980 ) ( ON ?auto_281982 ?auto_281981 ) ( ON ?auto_281983 ?auto_281982 ) ( ON ?auto_281984 ?auto_281983 ) ( ON ?auto_281985 ?auto_281984 ) ( not ( = ?auto_281974 ?auto_281975 ) ) ( not ( = ?auto_281974 ?auto_281976 ) ) ( not ( = ?auto_281974 ?auto_281977 ) ) ( not ( = ?auto_281974 ?auto_281978 ) ) ( not ( = ?auto_281974 ?auto_281979 ) ) ( not ( = ?auto_281974 ?auto_281980 ) ) ( not ( = ?auto_281974 ?auto_281981 ) ) ( not ( = ?auto_281974 ?auto_281982 ) ) ( not ( = ?auto_281974 ?auto_281983 ) ) ( not ( = ?auto_281974 ?auto_281984 ) ) ( not ( = ?auto_281974 ?auto_281985 ) ) ( not ( = ?auto_281974 ?auto_281986 ) ) ( not ( = ?auto_281974 ?auto_281987 ) ) ( not ( = ?auto_281975 ?auto_281976 ) ) ( not ( = ?auto_281975 ?auto_281977 ) ) ( not ( = ?auto_281975 ?auto_281978 ) ) ( not ( = ?auto_281975 ?auto_281979 ) ) ( not ( = ?auto_281975 ?auto_281980 ) ) ( not ( = ?auto_281975 ?auto_281981 ) ) ( not ( = ?auto_281975 ?auto_281982 ) ) ( not ( = ?auto_281975 ?auto_281983 ) ) ( not ( = ?auto_281975 ?auto_281984 ) ) ( not ( = ?auto_281975 ?auto_281985 ) ) ( not ( = ?auto_281975 ?auto_281986 ) ) ( not ( = ?auto_281975 ?auto_281987 ) ) ( not ( = ?auto_281976 ?auto_281977 ) ) ( not ( = ?auto_281976 ?auto_281978 ) ) ( not ( = ?auto_281976 ?auto_281979 ) ) ( not ( = ?auto_281976 ?auto_281980 ) ) ( not ( = ?auto_281976 ?auto_281981 ) ) ( not ( = ?auto_281976 ?auto_281982 ) ) ( not ( = ?auto_281976 ?auto_281983 ) ) ( not ( = ?auto_281976 ?auto_281984 ) ) ( not ( = ?auto_281976 ?auto_281985 ) ) ( not ( = ?auto_281976 ?auto_281986 ) ) ( not ( = ?auto_281976 ?auto_281987 ) ) ( not ( = ?auto_281977 ?auto_281978 ) ) ( not ( = ?auto_281977 ?auto_281979 ) ) ( not ( = ?auto_281977 ?auto_281980 ) ) ( not ( = ?auto_281977 ?auto_281981 ) ) ( not ( = ?auto_281977 ?auto_281982 ) ) ( not ( = ?auto_281977 ?auto_281983 ) ) ( not ( = ?auto_281977 ?auto_281984 ) ) ( not ( = ?auto_281977 ?auto_281985 ) ) ( not ( = ?auto_281977 ?auto_281986 ) ) ( not ( = ?auto_281977 ?auto_281987 ) ) ( not ( = ?auto_281978 ?auto_281979 ) ) ( not ( = ?auto_281978 ?auto_281980 ) ) ( not ( = ?auto_281978 ?auto_281981 ) ) ( not ( = ?auto_281978 ?auto_281982 ) ) ( not ( = ?auto_281978 ?auto_281983 ) ) ( not ( = ?auto_281978 ?auto_281984 ) ) ( not ( = ?auto_281978 ?auto_281985 ) ) ( not ( = ?auto_281978 ?auto_281986 ) ) ( not ( = ?auto_281978 ?auto_281987 ) ) ( not ( = ?auto_281979 ?auto_281980 ) ) ( not ( = ?auto_281979 ?auto_281981 ) ) ( not ( = ?auto_281979 ?auto_281982 ) ) ( not ( = ?auto_281979 ?auto_281983 ) ) ( not ( = ?auto_281979 ?auto_281984 ) ) ( not ( = ?auto_281979 ?auto_281985 ) ) ( not ( = ?auto_281979 ?auto_281986 ) ) ( not ( = ?auto_281979 ?auto_281987 ) ) ( not ( = ?auto_281980 ?auto_281981 ) ) ( not ( = ?auto_281980 ?auto_281982 ) ) ( not ( = ?auto_281980 ?auto_281983 ) ) ( not ( = ?auto_281980 ?auto_281984 ) ) ( not ( = ?auto_281980 ?auto_281985 ) ) ( not ( = ?auto_281980 ?auto_281986 ) ) ( not ( = ?auto_281980 ?auto_281987 ) ) ( not ( = ?auto_281981 ?auto_281982 ) ) ( not ( = ?auto_281981 ?auto_281983 ) ) ( not ( = ?auto_281981 ?auto_281984 ) ) ( not ( = ?auto_281981 ?auto_281985 ) ) ( not ( = ?auto_281981 ?auto_281986 ) ) ( not ( = ?auto_281981 ?auto_281987 ) ) ( not ( = ?auto_281982 ?auto_281983 ) ) ( not ( = ?auto_281982 ?auto_281984 ) ) ( not ( = ?auto_281982 ?auto_281985 ) ) ( not ( = ?auto_281982 ?auto_281986 ) ) ( not ( = ?auto_281982 ?auto_281987 ) ) ( not ( = ?auto_281983 ?auto_281984 ) ) ( not ( = ?auto_281983 ?auto_281985 ) ) ( not ( = ?auto_281983 ?auto_281986 ) ) ( not ( = ?auto_281983 ?auto_281987 ) ) ( not ( = ?auto_281984 ?auto_281985 ) ) ( not ( = ?auto_281984 ?auto_281986 ) ) ( not ( = ?auto_281984 ?auto_281987 ) ) ( not ( = ?auto_281985 ?auto_281986 ) ) ( not ( = ?auto_281985 ?auto_281987 ) ) ( not ( = ?auto_281986 ?auto_281987 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_281986 ?auto_281987 )
      ( !STACK ?auto_281986 ?auto_281985 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282001 - BLOCK
      ?auto_282002 - BLOCK
      ?auto_282003 - BLOCK
      ?auto_282004 - BLOCK
      ?auto_282005 - BLOCK
      ?auto_282006 - BLOCK
      ?auto_282007 - BLOCK
      ?auto_282008 - BLOCK
      ?auto_282009 - BLOCK
      ?auto_282010 - BLOCK
      ?auto_282011 - BLOCK
      ?auto_282012 - BLOCK
      ?auto_282013 - BLOCK
    )
    :vars
    (
      ?auto_282014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_282012 ) ( ON ?auto_282013 ?auto_282014 ) ( CLEAR ?auto_282013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_282001 ) ( ON ?auto_282002 ?auto_282001 ) ( ON ?auto_282003 ?auto_282002 ) ( ON ?auto_282004 ?auto_282003 ) ( ON ?auto_282005 ?auto_282004 ) ( ON ?auto_282006 ?auto_282005 ) ( ON ?auto_282007 ?auto_282006 ) ( ON ?auto_282008 ?auto_282007 ) ( ON ?auto_282009 ?auto_282008 ) ( ON ?auto_282010 ?auto_282009 ) ( ON ?auto_282011 ?auto_282010 ) ( ON ?auto_282012 ?auto_282011 ) ( not ( = ?auto_282001 ?auto_282002 ) ) ( not ( = ?auto_282001 ?auto_282003 ) ) ( not ( = ?auto_282001 ?auto_282004 ) ) ( not ( = ?auto_282001 ?auto_282005 ) ) ( not ( = ?auto_282001 ?auto_282006 ) ) ( not ( = ?auto_282001 ?auto_282007 ) ) ( not ( = ?auto_282001 ?auto_282008 ) ) ( not ( = ?auto_282001 ?auto_282009 ) ) ( not ( = ?auto_282001 ?auto_282010 ) ) ( not ( = ?auto_282001 ?auto_282011 ) ) ( not ( = ?auto_282001 ?auto_282012 ) ) ( not ( = ?auto_282001 ?auto_282013 ) ) ( not ( = ?auto_282001 ?auto_282014 ) ) ( not ( = ?auto_282002 ?auto_282003 ) ) ( not ( = ?auto_282002 ?auto_282004 ) ) ( not ( = ?auto_282002 ?auto_282005 ) ) ( not ( = ?auto_282002 ?auto_282006 ) ) ( not ( = ?auto_282002 ?auto_282007 ) ) ( not ( = ?auto_282002 ?auto_282008 ) ) ( not ( = ?auto_282002 ?auto_282009 ) ) ( not ( = ?auto_282002 ?auto_282010 ) ) ( not ( = ?auto_282002 ?auto_282011 ) ) ( not ( = ?auto_282002 ?auto_282012 ) ) ( not ( = ?auto_282002 ?auto_282013 ) ) ( not ( = ?auto_282002 ?auto_282014 ) ) ( not ( = ?auto_282003 ?auto_282004 ) ) ( not ( = ?auto_282003 ?auto_282005 ) ) ( not ( = ?auto_282003 ?auto_282006 ) ) ( not ( = ?auto_282003 ?auto_282007 ) ) ( not ( = ?auto_282003 ?auto_282008 ) ) ( not ( = ?auto_282003 ?auto_282009 ) ) ( not ( = ?auto_282003 ?auto_282010 ) ) ( not ( = ?auto_282003 ?auto_282011 ) ) ( not ( = ?auto_282003 ?auto_282012 ) ) ( not ( = ?auto_282003 ?auto_282013 ) ) ( not ( = ?auto_282003 ?auto_282014 ) ) ( not ( = ?auto_282004 ?auto_282005 ) ) ( not ( = ?auto_282004 ?auto_282006 ) ) ( not ( = ?auto_282004 ?auto_282007 ) ) ( not ( = ?auto_282004 ?auto_282008 ) ) ( not ( = ?auto_282004 ?auto_282009 ) ) ( not ( = ?auto_282004 ?auto_282010 ) ) ( not ( = ?auto_282004 ?auto_282011 ) ) ( not ( = ?auto_282004 ?auto_282012 ) ) ( not ( = ?auto_282004 ?auto_282013 ) ) ( not ( = ?auto_282004 ?auto_282014 ) ) ( not ( = ?auto_282005 ?auto_282006 ) ) ( not ( = ?auto_282005 ?auto_282007 ) ) ( not ( = ?auto_282005 ?auto_282008 ) ) ( not ( = ?auto_282005 ?auto_282009 ) ) ( not ( = ?auto_282005 ?auto_282010 ) ) ( not ( = ?auto_282005 ?auto_282011 ) ) ( not ( = ?auto_282005 ?auto_282012 ) ) ( not ( = ?auto_282005 ?auto_282013 ) ) ( not ( = ?auto_282005 ?auto_282014 ) ) ( not ( = ?auto_282006 ?auto_282007 ) ) ( not ( = ?auto_282006 ?auto_282008 ) ) ( not ( = ?auto_282006 ?auto_282009 ) ) ( not ( = ?auto_282006 ?auto_282010 ) ) ( not ( = ?auto_282006 ?auto_282011 ) ) ( not ( = ?auto_282006 ?auto_282012 ) ) ( not ( = ?auto_282006 ?auto_282013 ) ) ( not ( = ?auto_282006 ?auto_282014 ) ) ( not ( = ?auto_282007 ?auto_282008 ) ) ( not ( = ?auto_282007 ?auto_282009 ) ) ( not ( = ?auto_282007 ?auto_282010 ) ) ( not ( = ?auto_282007 ?auto_282011 ) ) ( not ( = ?auto_282007 ?auto_282012 ) ) ( not ( = ?auto_282007 ?auto_282013 ) ) ( not ( = ?auto_282007 ?auto_282014 ) ) ( not ( = ?auto_282008 ?auto_282009 ) ) ( not ( = ?auto_282008 ?auto_282010 ) ) ( not ( = ?auto_282008 ?auto_282011 ) ) ( not ( = ?auto_282008 ?auto_282012 ) ) ( not ( = ?auto_282008 ?auto_282013 ) ) ( not ( = ?auto_282008 ?auto_282014 ) ) ( not ( = ?auto_282009 ?auto_282010 ) ) ( not ( = ?auto_282009 ?auto_282011 ) ) ( not ( = ?auto_282009 ?auto_282012 ) ) ( not ( = ?auto_282009 ?auto_282013 ) ) ( not ( = ?auto_282009 ?auto_282014 ) ) ( not ( = ?auto_282010 ?auto_282011 ) ) ( not ( = ?auto_282010 ?auto_282012 ) ) ( not ( = ?auto_282010 ?auto_282013 ) ) ( not ( = ?auto_282010 ?auto_282014 ) ) ( not ( = ?auto_282011 ?auto_282012 ) ) ( not ( = ?auto_282011 ?auto_282013 ) ) ( not ( = ?auto_282011 ?auto_282014 ) ) ( not ( = ?auto_282012 ?auto_282013 ) ) ( not ( = ?auto_282012 ?auto_282014 ) ) ( not ( = ?auto_282013 ?auto_282014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_282013 ?auto_282014 )
      ( !STACK ?auto_282013 ?auto_282012 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282028 - BLOCK
      ?auto_282029 - BLOCK
      ?auto_282030 - BLOCK
      ?auto_282031 - BLOCK
      ?auto_282032 - BLOCK
      ?auto_282033 - BLOCK
      ?auto_282034 - BLOCK
      ?auto_282035 - BLOCK
      ?auto_282036 - BLOCK
      ?auto_282037 - BLOCK
      ?auto_282038 - BLOCK
      ?auto_282039 - BLOCK
      ?auto_282040 - BLOCK
    )
    :vars
    (
      ?auto_282041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282040 ?auto_282041 ) ( ON-TABLE ?auto_282028 ) ( ON ?auto_282029 ?auto_282028 ) ( ON ?auto_282030 ?auto_282029 ) ( ON ?auto_282031 ?auto_282030 ) ( ON ?auto_282032 ?auto_282031 ) ( ON ?auto_282033 ?auto_282032 ) ( ON ?auto_282034 ?auto_282033 ) ( ON ?auto_282035 ?auto_282034 ) ( ON ?auto_282036 ?auto_282035 ) ( ON ?auto_282037 ?auto_282036 ) ( ON ?auto_282038 ?auto_282037 ) ( not ( = ?auto_282028 ?auto_282029 ) ) ( not ( = ?auto_282028 ?auto_282030 ) ) ( not ( = ?auto_282028 ?auto_282031 ) ) ( not ( = ?auto_282028 ?auto_282032 ) ) ( not ( = ?auto_282028 ?auto_282033 ) ) ( not ( = ?auto_282028 ?auto_282034 ) ) ( not ( = ?auto_282028 ?auto_282035 ) ) ( not ( = ?auto_282028 ?auto_282036 ) ) ( not ( = ?auto_282028 ?auto_282037 ) ) ( not ( = ?auto_282028 ?auto_282038 ) ) ( not ( = ?auto_282028 ?auto_282039 ) ) ( not ( = ?auto_282028 ?auto_282040 ) ) ( not ( = ?auto_282028 ?auto_282041 ) ) ( not ( = ?auto_282029 ?auto_282030 ) ) ( not ( = ?auto_282029 ?auto_282031 ) ) ( not ( = ?auto_282029 ?auto_282032 ) ) ( not ( = ?auto_282029 ?auto_282033 ) ) ( not ( = ?auto_282029 ?auto_282034 ) ) ( not ( = ?auto_282029 ?auto_282035 ) ) ( not ( = ?auto_282029 ?auto_282036 ) ) ( not ( = ?auto_282029 ?auto_282037 ) ) ( not ( = ?auto_282029 ?auto_282038 ) ) ( not ( = ?auto_282029 ?auto_282039 ) ) ( not ( = ?auto_282029 ?auto_282040 ) ) ( not ( = ?auto_282029 ?auto_282041 ) ) ( not ( = ?auto_282030 ?auto_282031 ) ) ( not ( = ?auto_282030 ?auto_282032 ) ) ( not ( = ?auto_282030 ?auto_282033 ) ) ( not ( = ?auto_282030 ?auto_282034 ) ) ( not ( = ?auto_282030 ?auto_282035 ) ) ( not ( = ?auto_282030 ?auto_282036 ) ) ( not ( = ?auto_282030 ?auto_282037 ) ) ( not ( = ?auto_282030 ?auto_282038 ) ) ( not ( = ?auto_282030 ?auto_282039 ) ) ( not ( = ?auto_282030 ?auto_282040 ) ) ( not ( = ?auto_282030 ?auto_282041 ) ) ( not ( = ?auto_282031 ?auto_282032 ) ) ( not ( = ?auto_282031 ?auto_282033 ) ) ( not ( = ?auto_282031 ?auto_282034 ) ) ( not ( = ?auto_282031 ?auto_282035 ) ) ( not ( = ?auto_282031 ?auto_282036 ) ) ( not ( = ?auto_282031 ?auto_282037 ) ) ( not ( = ?auto_282031 ?auto_282038 ) ) ( not ( = ?auto_282031 ?auto_282039 ) ) ( not ( = ?auto_282031 ?auto_282040 ) ) ( not ( = ?auto_282031 ?auto_282041 ) ) ( not ( = ?auto_282032 ?auto_282033 ) ) ( not ( = ?auto_282032 ?auto_282034 ) ) ( not ( = ?auto_282032 ?auto_282035 ) ) ( not ( = ?auto_282032 ?auto_282036 ) ) ( not ( = ?auto_282032 ?auto_282037 ) ) ( not ( = ?auto_282032 ?auto_282038 ) ) ( not ( = ?auto_282032 ?auto_282039 ) ) ( not ( = ?auto_282032 ?auto_282040 ) ) ( not ( = ?auto_282032 ?auto_282041 ) ) ( not ( = ?auto_282033 ?auto_282034 ) ) ( not ( = ?auto_282033 ?auto_282035 ) ) ( not ( = ?auto_282033 ?auto_282036 ) ) ( not ( = ?auto_282033 ?auto_282037 ) ) ( not ( = ?auto_282033 ?auto_282038 ) ) ( not ( = ?auto_282033 ?auto_282039 ) ) ( not ( = ?auto_282033 ?auto_282040 ) ) ( not ( = ?auto_282033 ?auto_282041 ) ) ( not ( = ?auto_282034 ?auto_282035 ) ) ( not ( = ?auto_282034 ?auto_282036 ) ) ( not ( = ?auto_282034 ?auto_282037 ) ) ( not ( = ?auto_282034 ?auto_282038 ) ) ( not ( = ?auto_282034 ?auto_282039 ) ) ( not ( = ?auto_282034 ?auto_282040 ) ) ( not ( = ?auto_282034 ?auto_282041 ) ) ( not ( = ?auto_282035 ?auto_282036 ) ) ( not ( = ?auto_282035 ?auto_282037 ) ) ( not ( = ?auto_282035 ?auto_282038 ) ) ( not ( = ?auto_282035 ?auto_282039 ) ) ( not ( = ?auto_282035 ?auto_282040 ) ) ( not ( = ?auto_282035 ?auto_282041 ) ) ( not ( = ?auto_282036 ?auto_282037 ) ) ( not ( = ?auto_282036 ?auto_282038 ) ) ( not ( = ?auto_282036 ?auto_282039 ) ) ( not ( = ?auto_282036 ?auto_282040 ) ) ( not ( = ?auto_282036 ?auto_282041 ) ) ( not ( = ?auto_282037 ?auto_282038 ) ) ( not ( = ?auto_282037 ?auto_282039 ) ) ( not ( = ?auto_282037 ?auto_282040 ) ) ( not ( = ?auto_282037 ?auto_282041 ) ) ( not ( = ?auto_282038 ?auto_282039 ) ) ( not ( = ?auto_282038 ?auto_282040 ) ) ( not ( = ?auto_282038 ?auto_282041 ) ) ( not ( = ?auto_282039 ?auto_282040 ) ) ( not ( = ?auto_282039 ?auto_282041 ) ) ( not ( = ?auto_282040 ?auto_282041 ) ) ( CLEAR ?auto_282038 ) ( ON ?auto_282039 ?auto_282040 ) ( CLEAR ?auto_282039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_282028 ?auto_282029 ?auto_282030 ?auto_282031 ?auto_282032 ?auto_282033 ?auto_282034 ?auto_282035 ?auto_282036 ?auto_282037 ?auto_282038 ?auto_282039 )
      ( MAKE-13PILE ?auto_282028 ?auto_282029 ?auto_282030 ?auto_282031 ?auto_282032 ?auto_282033 ?auto_282034 ?auto_282035 ?auto_282036 ?auto_282037 ?auto_282038 ?auto_282039 ?auto_282040 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282055 - BLOCK
      ?auto_282056 - BLOCK
      ?auto_282057 - BLOCK
      ?auto_282058 - BLOCK
      ?auto_282059 - BLOCK
      ?auto_282060 - BLOCK
      ?auto_282061 - BLOCK
      ?auto_282062 - BLOCK
      ?auto_282063 - BLOCK
      ?auto_282064 - BLOCK
      ?auto_282065 - BLOCK
      ?auto_282066 - BLOCK
      ?auto_282067 - BLOCK
    )
    :vars
    (
      ?auto_282068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282067 ?auto_282068 ) ( ON-TABLE ?auto_282055 ) ( ON ?auto_282056 ?auto_282055 ) ( ON ?auto_282057 ?auto_282056 ) ( ON ?auto_282058 ?auto_282057 ) ( ON ?auto_282059 ?auto_282058 ) ( ON ?auto_282060 ?auto_282059 ) ( ON ?auto_282061 ?auto_282060 ) ( ON ?auto_282062 ?auto_282061 ) ( ON ?auto_282063 ?auto_282062 ) ( ON ?auto_282064 ?auto_282063 ) ( ON ?auto_282065 ?auto_282064 ) ( not ( = ?auto_282055 ?auto_282056 ) ) ( not ( = ?auto_282055 ?auto_282057 ) ) ( not ( = ?auto_282055 ?auto_282058 ) ) ( not ( = ?auto_282055 ?auto_282059 ) ) ( not ( = ?auto_282055 ?auto_282060 ) ) ( not ( = ?auto_282055 ?auto_282061 ) ) ( not ( = ?auto_282055 ?auto_282062 ) ) ( not ( = ?auto_282055 ?auto_282063 ) ) ( not ( = ?auto_282055 ?auto_282064 ) ) ( not ( = ?auto_282055 ?auto_282065 ) ) ( not ( = ?auto_282055 ?auto_282066 ) ) ( not ( = ?auto_282055 ?auto_282067 ) ) ( not ( = ?auto_282055 ?auto_282068 ) ) ( not ( = ?auto_282056 ?auto_282057 ) ) ( not ( = ?auto_282056 ?auto_282058 ) ) ( not ( = ?auto_282056 ?auto_282059 ) ) ( not ( = ?auto_282056 ?auto_282060 ) ) ( not ( = ?auto_282056 ?auto_282061 ) ) ( not ( = ?auto_282056 ?auto_282062 ) ) ( not ( = ?auto_282056 ?auto_282063 ) ) ( not ( = ?auto_282056 ?auto_282064 ) ) ( not ( = ?auto_282056 ?auto_282065 ) ) ( not ( = ?auto_282056 ?auto_282066 ) ) ( not ( = ?auto_282056 ?auto_282067 ) ) ( not ( = ?auto_282056 ?auto_282068 ) ) ( not ( = ?auto_282057 ?auto_282058 ) ) ( not ( = ?auto_282057 ?auto_282059 ) ) ( not ( = ?auto_282057 ?auto_282060 ) ) ( not ( = ?auto_282057 ?auto_282061 ) ) ( not ( = ?auto_282057 ?auto_282062 ) ) ( not ( = ?auto_282057 ?auto_282063 ) ) ( not ( = ?auto_282057 ?auto_282064 ) ) ( not ( = ?auto_282057 ?auto_282065 ) ) ( not ( = ?auto_282057 ?auto_282066 ) ) ( not ( = ?auto_282057 ?auto_282067 ) ) ( not ( = ?auto_282057 ?auto_282068 ) ) ( not ( = ?auto_282058 ?auto_282059 ) ) ( not ( = ?auto_282058 ?auto_282060 ) ) ( not ( = ?auto_282058 ?auto_282061 ) ) ( not ( = ?auto_282058 ?auto_282062 ) ) ( not ( = ?auto_282058 ?auto_282063 ) ) ( not ( = ?auto_282058 ?auto_282064 ) ) ( not ( = ?auto_282058 ?auto_282065 ) ) ( not ( = ?auto_282058 ?auto_282066 ) ) ( not ( = ?auto_282058 ?auto_282067 ) ) ( not ( = ?auto_282058 ?auto_282068 ) ) ( not ( = ?auto_282059 ?auto_282060 ) ) ( not ( = ?auto_282059 ?auto_282061 ) ) ( not ( = ?auto_282059 ?auto_282062 ) ) ( not ( = ?auto_282059 ?auto_282063 ) ) ( not ( = ?auto_282059 ?auto_282064 ) ) ( not ( = ?auto_282059 ?auto_282065 ) ) ( not ( = ?auto_282059 ?auto_282066 ) ) ( not ( = ?auto_282059 ?auto_282067 ) ) ( not ( = ?auto_282059 ?auto_282068 ) ) ( not ( = ?auto_282060 ?auto_282061 ) ) ( not ( = ?auto_282060 ?auto_282062 ) ) ( not ( = ?auto_282060 ?auto_282063 ) ) ( not ( = ?auto_282060 ?auto_282064 ) ) ( not ( = ?auto_282060 ?auto_282065 ) ) ( not ( = ?auto_282060 ?auto_282066 ) ) ( not ( = ?auto_282060 ?auto_282067 ) ) ( not ( = ?auto_282060 ?auto_282068 ) ) ( not ( = ?auto_282061 ?auto_282062 ) ) ( not ( = ?auto_282061 ?auto_282063 ) ) ( not ( = ?auto_282061 ?auto_282064 ) ) ( not ( = ?auto_282061 ?auto_282065 ) ) ( not ( = ?auto_282061 ?auto_282066 ) ) ( not ( = ?auto_282061 ?auto_282067 ) ) ( not ( = ?auto_282061 ?auto_282068 ) ) ( not ( = ?auto_282062 ?auto_282063 ) ) ( not ( = ?auto_282062 ?auto_282064 ) ) ( not ( = ?auto_282062 ?auto_282065 ) ) ( not ( = ?auto_282062 ?auto_282066 ) ) ( not ( = ?auto_282062 ?auto_282067 ) ) ( not ( = ?auto_282062 ?auto_282068 ) ) ( not ( = ?auto_282063 ?auto_282064 ) ) ( not ( = ?auto_282063 ?auto_282065 ) ) ( not ( = ?auto_282063 ?auto_282066 ) ) ( not ( = ?auto_282063 ?auto_282067 ) ) ( not ( = ?auto_282063 ?auto_282068 ) ) ( not ( = ?auto_282064 ?auto_282065 ) ) ( not ( = ?auto_282064 ?auto_282066 ) ) ( not ( = ?auto_282064 ?auto_282067 ) ) ( not ( = ?auto_282064 ?auto_282068 ) ) ( not ( = ?auto_282065 ?auto_282066 ) ) ( not ( = ?auto_282065 ?auto_282067 ) ) ( not ( = ?auto_282065 ?auto_282068 ) ) ( not ( = ?auto_282066 ?auto_282067 ) ) ( not ( = ?auto_282066 ?auto_282068 ) ) ( not ( = ?auto_282067 ?auto_282068 ) ) ( CLEAR ?auto_282065 ) ( ON ?auto_282066 ?auto_282067 ) ( CLEAR ?auto_282066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_282055 ?auto_282056 ?auto_282057 ?auto_282058 ?auto_282059 ?auto_282060 ?auto_282061 ?auto_282062 ?auto_282063 ?auto_282064 ?auto_282065 ?auto_282066 )
      ( MAKE-13PILE ?auto_282055 ?auto_282056 ?auto_282057 ?auto_282058 ?auto_282059 ?auto_282060 ?auto_282061 ?auto_282062 ?auto_282063 ?auto_282064 ?auto_282065 ?auto_282066 ?auto_282067 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282082 - BLOCK
      ?auto_282083 - BLOCK
      ?auto_282084 - BLOCK
      ?auto_282085 - BLOCK
      ?auto_282086 - BLOCK
      ?auto_282087 - BLOCK
      ?auto_282088 - BLOCK
      ?auto_282089 - BLOCK
      ?auto_282090 - BLOCK
      ?auto_282091 - BLOCK
      ?auto_282092 - BLOCK
      ?auto_282093 - BLOCK
      ?auto_282094 - BLOCK
    )
    :vars
    (
      ?auto_282095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282094 ?auto_282095 ) ( ON-TABLE ?auto_282082 ) ( ON ?auto_282083 ?auto_282082 ) ( ON ?auto_282084 ?auto_282083 ) ( ON ?auto_282085 ?auto_282084 ) ( ON ?auto_282086 ?auto_282085 ) ( ON ?auto_282087 ?auto_282086 ) ( ON ?auto_282088 ?auto_282087 ) ( ON ?auto_282089 ?auto_282088 ) ( ON ?auto_282090 ?auto_282089 ) ( ON ?auto_282091 ?auto_282090 ) ( not ( = ?auto_282082 ?auto_282083 ) ) ( not ( = ?auto_282082 ?auto_282084 ) ) ( not ( = ?auto_282082 ?auto_282085 ) ) ( not ( = ?auto_282082 ?auto_282086 ) ) ( not ( = ?auto_282082 ?auto_282087 ) ) ( not ( = ?auto_282082 ?auto_282088 ) ) ( not ( = ?auto_282082 ?auto_282089 ) ) ( not ( = ?auto_282082 ?auto_282090 ) ) ( not ( = ?auto_282082 ?auto_282091 ) ) ( not ( = ?auto_282082 ?auto_282092 ) ) ( not ( = ?auto_282082 ?auto_282093 ) ) ( not ( = ?auto_282082 ?auto_282094 ) ) ( not ( = ?auto_282082 ?auto_282095 ) ) ( not ( = ?auto_282083 ?auto_282084 ) ) ( not ( = ?auto_282083 ?auto_282085 ) ) ( not ( = ?auto_282083 ?auto_282086 ) ) ( not ( = ?auto_282083 ?auto_282087 ) ) ( not ( = ?auto_282083 ?auto_282088 ) ) ( not ( = ?auto_282083 ?auto_282089 ) ) ( not ( = ?auto_282083 ?auto_282090 ) ) ( not ( = ?auto_282083 ?auto_282091 ) ) ( not ( = ?auto_282083 ?auto_282092 ) ) ( not ( = ?auto_282083 ?auto_282093 ) ) ( not ( = ?auto_282083 ?auto_282094 ) ) ( not ( = ?auto_282083 ?auto_282095 ) ) ( not ( = ?auto_282084 ?auto_282085 ) ) ( not ( = ?auto_282084 ?auto_282086 ) ) ( not ( = ?auto_282084 ?auto_282087 ) ) ( not ( = ?auto_282084 ?auto_282088 ) ) ( not ( = ?auto_282084 ?auto_282089 ) ) ( not ( = ?auto_282084 ?auto_282090 ) ) ( not ( = ?auto_282084 ?auto_282091 ) ) ( not ( = ?auto_282084 ?auto_282092 ) ) ( not ( = ?auto_282084 ?auto_282093 ) ) ( not ( = ?auto_282084 ?auto_282094 ) ) ( not ( = ?auto_282084 ?auto_282095 ) ) ( not ( = ?auto_282085 ?auto_282086 ) ) ( not ( = ?auto_282085 ?auto_282087 ) ) ( not ( = ?auto_282085 ?auto_282088 ) ) ( not ( = ?auto_282085 ?auto_282089 ) ) ( not ( = ?auto_282085 ?auto_282090 ) ) ( not ( = ?auto_282085 ?auto_282091 ) ) ( not ( = ?auto_282085 ?auto_282092 ) ) ( not ( = ?auto_282085 ?auto_282093 ) ) ( not ( = ?auto_282085 ?auto_282094 ) ) ( not ( = ?auto_282085 ?auto_282095 ) ) ( not ( = ?auto_282086 ?auto_282087 ) ) ( not ( = ?auto_282086 ?auto_282088 ) ) ( not ( = ?auto_282086 ?auto_282089 ) ) ( not ( = ?auto_282086 ?auto_282090 ) ) ( not ( = ?auto_282086 ?auto_282091 ) ) ( not ( = ?auto_282086 ?auto_282092 ) ) ( not ( = ?auto_282086 ?auto_282093 ) ) ( not ( = ?auto_282086 ?auto_282094 ) ) ( not ( = ?auto_282086 ?auto_282095 ) ) ( not ( = ?auto_282087 ?auto_282088 ) ) ( not ( = ?auto_282087 ?auto_282089 ) ) ( not ( = ?auto_282087 ?auto_282090 ) ) ( not ( = ?auto_282087 ?auto_282091 ) ) ( not ( = ?auto_282087 ?auto_282092 ) ) ( not ( = ?auto_282087 ?auto_282093 ) ) ( not ( = ?auto_282087 ?auto_282094 ) ) ( not ( = ?auto_282087 ?auto_282095 ) ) ( not ( = ?auto_282088 ?auto_282089 ) ) ( not ( = ?auto_282088 ?auto_282090 ) ) ( not ( = ?auto_282088 ?auto_282091 ) ) ( not ( = ?auto_282088 ?auto_282092 ) ) ( not ( = ?auto_282088 ?auto_282093 ) ) ( not ( = ?auto_282088 ?auto_282094 ) ) ( not ( = ?auto_282088 ?auto_282095 ) ) ( not ( = ?auto_282089 ?auto_282090 ) ) ( not ( = ?auto_282089 ?auto_282091 ) ) ( not ( = ?auto_282089 ?auto_282092 ) ) ( not ( = ?auto_282089 ?auto_282093 ) ) ( not ( = ?auto_282089 ?auto_282094 ) ) ( not ( = ?auto_282089 ?auto_282095 ) ) ( not ( = ?auto_282090 ?auto_282091 ) ) ( not ( = ?auto_282090 ?auto_282092 ) ) ( not ( = ?auto_282090 ?auto_282093 ) ) ( not ( = ?auto_282090 ?auto_282094 ) ) ( not ( = ?auto_282090 ?auto_282095 ) ) ( not ( = ?auto_282091 ?auto_282092 ) ) ( not ( = ?auto_282091 ?auto_282093 ) ) ( not ( = ?auto_282091 ?auto_282094 ) ) ( not ( = ?auto_282091 ?auto_282095 ) ) ( not ( = ?auto_282092 ?auto_282093 ) ) ( not ( = ?auto_282092 ?auto_282094 ) ) ( not ( = ?auto_282092 ?auto_282095 ) ) ( not ( = ?auto_282093 ?auto_282094 ) ) ( not ( = ?auto_282093 ?auto_282095 ) ) ( not ( = ?auto_282094 ?auto_282095 ) ) ( ON ?auto_282093 ?auto_282094 ) ( CLEAR ?auto_282091 ) ( ON ?auto_282092 ?auto_282093 ) ( CLEAR ?auto_282092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_282082 ?auto_282083 ?auto_282084 ?auto_282085 ?auto_282086 ?auto_282087 ?auto_282088 ?auto_282089 ?auto_282090 ?auto_282091 ?auto_282092 )
      ( MAKE-13PILE ?auto_282082 ?auto_282083 ?auto_282084 ?auto_282085 ?auto_282086 ?auto_282087 ?auto_282088 ?auto_282089 ?auto_282090 ?auto_282091 ?auto_282092 ?auto_282093 ?auto_282094 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282109 - BLOCK
      ?auto_282110 - BLOCK
      ?auto_282111 - BLOCK
      ?auto_282112 - BLOCK
      ?auto_282113 - BLOCK
      ?auto_282114 - BLOCK
      ?auto_282115 - BLOCK
      ?auto_282116 - BLOCK
      ?auto_282117 - BLOCK
      ?auto_282118 - BLOCK
      ?auto_282119 - BLOCK
      ?auto_282120 - BLOCK
      ?auto_282121 - BLOCK
    )
    :vars
    (
      ?auto_282122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282121 ?auto_282122 ) ( ON-TABLE ?auto_282109 ) ( ON ?auto_282110 ?auto_282109 ) ( ON ?auto_282111 ?auto_282110 ) ( ON ?auto_282112 ?auto_282111 ) ( ON ?auto_282113 ?auto_282112 ) ( ON ?auto_282114 ?auto_282113 ) ( ON ?auto_282115 ?auto_282114 ) ( ON ?auto_282116 ?auto_282115 ) ( ON ?auto_282117 ?auto_282116 ) ( ON ?auto_282118 ?auto_282117 ) ( not ( = ?auto_282109 ?auto_282110 ) ) ( not ( = ?auto_282109 ?auto_282111 ) ) ( not ( = ?auto_282109 ?auto_282112 ) ) ( not ( = ?auto_282109 ?auto_282113 ) ) ( not ( = ?auto_282109 ?auto_282114 ) ) ( not ( = ?auto_282109 ?auto_282115 ) ) ( not ( = ?auto_282109 ?auto_282116 ) ) ( not ( = ?auto_282109 ?auto_282117 ) ) ( not ( = ?auto_282109 ?auto_282118 ) ) ( not ( = ?auto_282109 ?auto_282119 ) ) ( not ( = ?auto_282109 ?auto_282120 ) ) ( not ( = ?auto_282109 ?auto_282121 ) ) ( not ( = ?auto_282109 ?auto_282122 ) ) ( not ( = ?auto_282110 ?auto_282111 ) ) ( not ( = ?auto_282110 ?auto_282112 ) ) ( not ( = ?auto_282110 ?auto_282113 ) ) ( not ( = ?auto_282110 ?auto_282114 ) ) ( not ( = ?auto_282110 ?auto_282115 ) ) ( not ( = ?auto_282110 ?auto_282116 ) ) ( not ( = ?auto_282110 ?auto_282117 ) ) ( not ( = ?auto_282110 ?auto_282118 ) ) ( not ( = ?auto_282110 ?auto_282119 ) ) ( not ( = ?auto_282110 ?auto_282120 ) ) ( not ( = ?auto_282110 ?auto_282121 ) ) ( not ( = ?auto_282110 ?auto_282122 ) ) ( not ( = ?auto_282111 ?auto_282112 ) ) ( not ( = ?auto_282111 ?auto_282113 ) ) ( not ( = ?auto_282111 ?auto_282114 ) ) ( not ( = ?auto_282111 ?auto_282115 ) ) ( not ( = ?auto_282111 ?auto_282116 ) ) ( not ( = ?auto_282111 ?auto_282117 ) ) ( not ( = ?auto_282111 ?auto_282118 ) ) ( not ( = ?auto_282111 ?auto_282119 ) ) ( not ( = ?auto_282111 ?auto_282120 ) ) ( not ( = ?auto_282111 ?auto_282121 ) ) ( not ( = ?auto_282111 ?auto_282122 ) ) ( not ( = ?auto_282112 ?auto_282113 ) ) ( not ( = ?auto_282112 ?auto_282114 ) ) ( not ( = ?auto_282112 ?auto_282115 ) ) ( not ( = ?auto_282112 ?auto_282116 ) ) ( not ( = ?auto_282112 ?auto_282117 ) ) ( not ( = ?auto_282112 ?auto_282118 ) ) ( not ( = ?auto_282112 ?auto_282119 ) ) ( not ( = ?auto_282112 ?auto_282120 ) ) ( not ( = ?auto_282112 ?auto_282121 ) ) ( not ( = ?auto_282112 ?auto_282122 ) ) ( not ( = ?auto_282113 ?auto_282114 ) ) ( not ( = ?auto_282113 ?auto_282115 ) ) ( not ( = ?auto_282113 ?auto_282116 ) ) ( not ( = ?auto_282113 ?auto_282117 ) ) ( not ( = ?auto_282113 ?auto_282118 ) ) ( not ( = ?auto_282113 ?auto_282119 ) ) ( not ( = ?auto_282113 ?auto_282120 ) ) ( not ( = ?auto_282113 ?auto_282121 ) ) ( not ( = ?auto_282113 ?auto_282122 ) ) ( not ( = ?auto_282114 ?auto_282115 ) ) ( not ( = ?auto_282114 ?auto_282116 ) ) ( not ( = ?auto_282114 ?auto_282117 ) ) ( not ( = ?auto_282114 ?auto_282118 ) ) ( not ( = ?auto_282114 ?auto_282119 ) ) ( not ( = ?auto_282114 ?auto_282120 ) ) ( not ( = ?auto_282114 ?auto_282121 ) ) ( not ( = ?auto_282114 ?auto_282122 ) ) ( not ( = ?auto_282115 ?auto_282116 ) ) ( not ( = ?auto_282115 ?auto_282117 ) ) ( not ( = ?auto_282115 ?auto_282118 ) ) ( not ( = ?auto_282115 ?auto_282119 ) ) ( not ( = ?auto_282115 ?auto_282120 ) ) ( not ( = ?auto_282115 ?auto_282121 ) ) ( not ( = ?auto_282115 ?auto_282122 ) ) ( not ( = ?auto_282116 ?auto_282117 ) ) ( not ( = ?auto_282116 ?auto_282118 ) ) ( not ( = ?auto_282116 ?auto_282119 ) ) ( not ( = ?auto_282116 ?auto_282120 ) ) ( not ( = ?auto_282116 ?auto_282121 ) ) ( not ( = ?auto_282116 ?auto_282122 ) ) ( not ( = ?auto_282117 ?auto_282118 ) ) ( not ( = ?auto_282117 ?auto_282119 ) ) ( not ( = ?auto_282117 ?auto_282120 ) ) ( not ( = ?auto_282117 ?auto_282121 ) ) ( not ( = ?auto_282117 ?auto_282122 ) ) ( not ( = ?auto_282118 ?auto_282119 ) ) ( not ( = ?auto_282118 ?auto_282120 ) ) ( not ( = ?auto_282118 ?auto_282121 ) ) ( not ( = ?auto_282118 ?auto_282122 ) ) ( not ( = ?auto_282119 ?auto_282120 ) ) ( not ( = ?auto_282119 ?auto_282121 ) ) ( not ( = ?auto_282119 ?auto_282122 ) ) ( not ( = ?auto_282120 ?auto_282121 ) ) ( not ( = ?auto_282120 ?auto_282122 ) ) ( not ( = ?auto_282121 ?auto_282122 ) ) ( ON ?auto_282120 ?auto_282121 ) ( CLEAR ?auto_282118 ) ( ON ?auto_282119 ?auto_282120 ) ( CLEAR ?auto_282119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_282109 ?auto_282110 ?auto_282111 ?auto_282112 ?auto_282113 ?auto_282114 ?auto_282115 ?auto_282116 ?auto_282117 ?auto_282118 ?auto_282119 )
      ( MAKE-13PILE ?auto_282109 ?auto_282110 ?auto_282111 ?auto_282112 ?auto_282113 ?auto_282114 ?auto_282115 ?auto_282116 ?auto_282117 ?auto_282118 ?auto_282119 ?auto_282120 ?auto_282121 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282136 - BLOCK
      ?auto_282137 - BLOCK
      ?auto_282138 - BLOCK
      ?auto_282139 - BLOCK
      ?auto_282140 - BLOCK
      ?auto_282141 - BLOCK
      ?auto_282142 - BLOCK
      ?auto_282143 - BLOCK
      ?auto_282144 - BLOCK
      ?auto_282145 - BLOCK
      ?auto_282146 - BLOCK
      ?auto_282147 - BLOCK
      ?auto_282148 - BLOCK
    )
    :vars
    (
      ?auto_282149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282148 ?auto_282149 ) ( ON-TABLE ?auto_282136 ) ( ON ?auto_282137 ?auto_282136 ) ( ON ?auto_282138 ?auto_282137 ) ( ON ?auto_282139 ?auto_282138 ) ( ON ?auto_282140 ?auto_282139 ) ( ON ?auto_282141 ?auto_282140 ) ( ON ?auto_282142 ?auto_282141 ) ( ON ?auto_282143 ?auto_282142 ) ( ON ?auto_282144 ?auto_282143 ) ( not ( = ?auto_282136 ?auto_282137 ) ) ( not ( = ?auto_282136 ?auto_282138 ) ) ( not ( = ?auto_282136 ?auto_282139 ) ) ( not ( = ?auto_282136 ?auto_282140 ) ) ( not ( = ?auto_282136 ?auto_282141 ) ) ( not ( = ?auto_282136 ?auto_282142 ) ) ( not ( = ?auto_282136 ?auto_282143 ) ) ( not ( = ?auto_282136 ?auto_282144 ) ) ( not ( = ?auto_282136 ?auto_282145 ) ) ( not ( = ?auto_282136 ?auto_282146 ) ) ( not ( = ?auto_282136 ?auto_282147 ) ) ( not ( = ?auto_282136 ?auto_282148 ) ) ( not ( = ?auto_282136 ?auto_282149 ) ) ( not ( = ?auto_282137 ?auto_282138 ) ) ( not ( = ?auto_282137 ?auto_282139 ) ) ( not ( = ?auto_282137 ?auto_282140 ) ) ( not ( = ?auto_282137 ?auto_282141 ) ) ( not ( = ?auto_282137 ?auto_282142 ) ) ( not ( = ?auto_282137 ?auto_282143 ) ) ( not ( = ?auto_282137 ?auto_282144 ) ) ( not ( = ?auto_282137 ?auto_282145 ) ) ( not ( = ?auto_282137 ?auto_282146 ) ) ( not ( = ?auto_282137 ?auto_282147 ) ) ( not ( = ?auto_282137 ?auto_282148 ) ) ( not ( = ?auto_282137 ?auto_282149 ) ) ( not ( = ?auto_282138 ?auto_282139 ) ) ( not ( = ?auto_282138 ?auto_282140 ) ) ( not ( = ?auto_282138 ?auto_282141 ) ) ( not ( = ?auto_282138 ?auto_282142 ) ) ( not ( = ?auto_282138 ?auto_282143 ) ) ( not ( = ?auto_282138 ?auto_282144 ) ) ( not ( = ?auto_282138 ?auto_282145 ) ) ( not ( = ?auto_282138 ?auto_282146 ) ) ( not ( = ?auto_282138 ?auto_282147 ) ) ( not ( = ?auto_282138 ?auto_282148 ) ) ( not ( = ?auto_282138 ?auto_282149 ) ) ( not ( = ?auto_282139 ?auto_282140 ) ) ( not ( = ?auto_282139 ?auto_282141 ) ) ( not ( = ?auto_282139 ?auto_282142 ) ) ( not ( = ?auto_282139 ?auto_282143 ) ) ( not ( = ?auto_282139 ?auto_282144 ) ) ( not ( = ?auto_282139 ?auto_282145 ) ) ( not ( = ?auto_282139 ?auto_282146 ) ) ( not ( = ?auto_282139 ?auto_282147 ) ) ( not ( = ?auto_282139 ?auto_282148 ) ) ( not ( = ?auto_282139 ?auto_282149 ) ) ( not ( = ?auto_282140 ?auto_282141 ) ) ( not ( = ?auto_282140 ?auto_282142 ) ) ( not ( = ?auto_282140 ?auto_282143 ) ) ( not ( = ?auto_282140 ?auto_282144 ) ) ( not ( = ?auto_282140 ?auto_282145 ) ) ( not ( = ?auto_282140 ?auto_282146 ) ) ( not ( = ?auto_282140 ?auto_282147 ) ) ( not ( = ?auto_282140 ?auto_282148 ) ) ( not ( = ?auto_282140 ?auto_282149 ) ) ( not ( = ?auto_282141 ?auto_282142 ) ) ( not ( = ?auto_282141 ?auto_282143 ) ) ( not ( = ?auto_282141 ?auto_282144 ) ) ( not ( = ?auto_282141 ?auto_282145 ) ) ( not ( = ?auto_282141 ?auto_282146 ) ) ( not ( = ?auto_282141 ?auto_282147 ) ) ( not ( = ?auto_282141 ?auto_282148 ) ) ( not ( = ?auto_282141 ?auto_282149 ) ) ( not ( = ?auto_282142 ?auto_282143 ) ) ( not ( = ?auto_282142 ?auto_282144 ) ) ( not ( = ?auto_282142 ?auto_282145 ) ) ( not ( = ?auto_282142 ?auto_282146 ) ) ( not ( = ?auto_282142 ?auto_282147 ) ) ( not ( = ?auto_282142 ?auto_282148 ) ) ( not ( = ?auto_282142 ?auto_282149 ) ) ( not ( = ?auto_282143 ?auto_282144 ) ) ( not ( = ?auto_282143 ?auto_282145 ) ) ( not ( = ?auto_282143 ?auto_282146 ) ) ( not ( = ?auto_282143 ?auto_282147 ) ) ( not ( = ?auto_282143 ?auto_282148 ) ) ( not ( = ?auto_282143 ?auto_282149 ) ) ( not ( = ?auto_282144 ?auto_282145 ) ) ( not ( = ?auto_282144 ?auto_282146 ) ) ( not ( = ?auto_282144 ?auto_282147 ) ) ( not ( = ?auto_282144 ?auto_282148 ) ) ( not ( = ?auto_282144 ?auto_282149 ) ) ( not ( = ?auto_282145 ?auto_282146 ) ) ( not ( = ?auto_282145 ?auto_282147 ) ) ( not ( = ?auto_282145 ?auto_282148 ) ) ( not ( = ?auto_282145 ?auto_282149 ) ) ( not ( = ?auto_282146 ?auto_282147 ) ) ( not ( = ?auto_282146 ?auto_282148 ) ) ( not ( = ?auto_282146 ?auto_282149 ) ) ( not ( = ?auto_282147 ?auto_282148 ) ) ( not ( = ?auto_282147 ?auto_282149 ) ) ( not ( = ?auto_282148 ?auto_282149 ) ) ( ON ?auto_282147 ?auto_282148 ) ( ON ?auto_282146 ?auto_282147 ) ( CLEAR ?auto_282144 ) ( ON ?auto_282145 ?auto_282146 ) ( CLEAR ?auto_282145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_282136 ?auto_282137 ?auto_282138 ?auto_282139 ?auto_282140 ?auto_282141 ?auto_282142 ?auto_282143 ?auto_282144 ?auto_282145 )
      ( MAKE-13PILE ?auto_282136 ?auto_282137 ?auto_282138 ?auto_282139 ?auto_282140 ?auto_282141 ?auto_282142 ?auto_282143 ?auto_282144 ?auto_282145 ?auto_282146 ?auto_282147 ?auto_282148 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282163 - BLOCK
      ?auto_282164 - BLOCK
      ?auto_282165 - BLOCK
      ?auto_282166 - BLOCK
      ?auto_282167 - BLOCK
      ?auto_282168 - BLOCK
      ?auto_282169 - BLOCK
      ?auto_282170 - BLOCK
      ?auto_282171 - BLOCK
      ?auto_282172 - BLOCK
      ?auto_282173 - BLOCK
      ?auto_282174 - BLOCK
      ?auto_282175 - BLOCK
    )
    :vars
    (
      ?auto_282176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282175 ?auto_282176 ) ( ON-TABLE ?auto_282163 ) ( ON ?auto_282164 ?auto_282163 ) ( ON ?auto_282165 ?auto_282164 ) ( ON ?auto_282166 ?auto_282165 ) ( ON ?auto_282167 ?auto_282166 ) ( ON ?auto_282168 ?auto_282167 ) ( ON ?auto_282169 ?auto_282168 ) ( ON ?auto_282170 ?auto_282169 ) ( ON ?auto_282171 ?auto_282170 ) ( not ( = ?auto_282163 ?auto_282164 ) ) ( not ( = ?auto_282163 ?auto_282165 ) ) ( not ( = ?auto_282163 ?auto_282166 ) ) ( not ( = ?auto_282163 ?auto_282167 ) ) ( not ( = ?auto_282163 ?auto_282168 ) ) ( not ( = ?auto_282163 ?auto_282169 ) ) ( not ( = ?auto_282163 ?auto_282170 ) ) ( not ( = ?auto_282163 ?auto_282171 ) ) ( not ( = ?auto_282163 ?auto_282172 ) ) ( not ( = ?auto_282163 ?auto_282173 ) ) ( not ( = ?auto_282163 ?auto_282174 ) ) ( not ( = ?auto_282163 ?auto_282175 ) ) ( not ( = ?auto_282163 ?auto_282176 ) ) ( not ( = ?auto_282164 ?auto_282165 ) ) ( not ( = ?auto_282164 ?auto_282166 ) ) ( not ( = ?auto_282164 ?auto_282167 ) ) ( not ( = ?auto_282164 ?auto_282168 ) ) ( not ( = ?auto_282164 ?auto_282169 ) ) ( not ( = ?auto_282164 ?auto_282170 ) ) ( not ( = ?auto_282164 ?auto_282171 ) ) ( not ( = ?auto_282164 ?auto_282172 ) ) ( not ( = ?auto_282164 ?auto_282173 ) ) ( not ( = ?auto_282164 ?auto_282174 ) ) ( not ( = ?auto_282164 ?auto_282175 ) ) ( not ( = ?auto_282164 ?auto_282176 ) ) ( not ( = ?auto_282165 ?auto_282166 ) ) ( not ( = ?auto_282165 ?auto_282167 ) ) ( not ( = ?auto_282165 ?auto_282168 ) ) ( not ( = ?auto_282165 ?auto_282169 ) ) ( not ( = ?auto_282165 ?auto_282170 ) ) ( not ( = ?auto_282165 ?auto_282171 ) ) ( not ( = ?auto_282165 ?auto_282172 ) ) ( not ( = ?auto_282165 ?auto_282173 ) ) ( not ( = ?auto_282165 ?auto_282174 ) ) ( not ( = ?auto_282165 ?auto_282175 ) ) ( not ( = ?auto_282165 ?auto_282176 ) ) ( not ( = ?auto_282166 ?auto_282167 ) ) ( not ( = ?auto_282166 ?auto_282168 ) ) ( not ( = ?auto_282166 ?auto_282169 ) ) ( not ( = ?auto_282166 ?auto_282170 ) ) ( not ( = ?auto_282166 ?auto_282171 ) ) ( not ( = ?auto_282166 ?auto_282172 ) ) ( not ( = ?auto_282166 ?auto_282173 ) ) ( not ( = ?auto_282166 ?auto_282174 ) ) ( not ( = ?auto_282166 ?auto_282175 ) ) ( not ( = ?auto_282166 ?auto_282176 ) ) ( not ( = ?auto_282167 ?auto_282168 ) ) ( not ( = ?auto_282167 ?auto_282169 ) ) ( not ( = ?auto_282167 ?auto_282170 ) ) ( not ( = ?auto_282167 ?auto_282171 ) ) ( not ( = ?auto_282167 ?auto_282172 ) ) ( not ( = ?auto_282167 ?auto_282173 ) ) ( not ( = ?auto_282167 ?auto_282174 ) ) ( not ( = ?auto_282167 ?auto_282175 ) ) ( not ( = ?auto_282167 ?auto_282176 ) ) ( not ( = ?auto_282168 ?auto_282169 ) ) ( not ( = ?auto_282168 ?auto_282170 ) ) ( not ( = ?auto_282168 ?auto_282171 ) ) ( not ( = ?auto_282168 ?auto_282172 ) ) ( not ( = ?auto_282168 ?auto_282173 ) ) ( not ( = ?auto_282168 ?auto_282174 ) ) ( not ( = ?auto_282168 ?auto_282175 ) ) ( not ( = ?auto_282168 ?auto_282176 ) ) ( not ( = ?auto_282169 ?auto_282170 ) ) ( not ( = ?auto_282169 ?auto_282171 ) ) ( not ( = ?auto_282169 ?auto_282172 ) ) ( not ( = ?auto_282169 ?auto_282173 ) ) ( not ( = ?auto_282169 ?auto_282174 ) ) ( not ( = ?auto_282169 ?auto_282175 ) ) ( not ( = ?auto_282169 ?auto_282176 ) ) ( not ( = ?auto_282170 ?auto_282171 ) ) ( not ( = ?auto_282170 ?auto_282172 ) ) ( not ( = ?auto_282170 ?auto_282173 ) ) ( not ( = ?auto_282170 ?auto_282174 ) ) ( not ( = ?auto_282170 ?auto_282175 ) ) ( not ( = ?auto_282170 ?auto_282176 ) ) ( not ( = ?auto_282171 ?auto_282172 ) ) ( not ( = ?auto_282171 ?auto_282173 ) ) ( not ( = ?auto_282171 ?auto_282174 ) ) ( not ( = ?auto_282171 ?auto_282175 ) ) ( not ( = ?auto_282171 ?auto_282176 ) ) ( not ( = ?auto_282172 ?auto_282173 ) ) ( not ( = ?auto_282172 ?auto_282174 ) ) ( not ( = ?auto_282172 ?auto_282175 ) ) ( not ( = ?auto_282172 ?auto_282176 ) ) ( not ( = ?auto_282173 ?auto_282174 ) ) ( not ( = ?auto_282173 ?auto_282175 ) ) ( not ( = ?auto_282173 ?auto_282176 ) ) ( not ( = ?auto_282174 ?auto_282175 ) ) ( not ( = ?auto_282174 ?auto_282176 ) ) ( not ( = ?auto_282175 ?auto_282176 ) ) ( ON ?auto_282174 ?auto_282175 ) ( ON ?auto_282173 ?auto_282174 ) ( CLEAR ?auto_282171 ) ( ON ?auto_282172 ?auto_282173 ) ( CLEAR ?auto_282172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_282163 ?auto_282164 ?auto_282165 ?auto_282166 ?auto_282167 ?auto_282168 ?auto_282169 ?auto_282170 ?auto_282171 ?auto_282172 )
      ( MAKE-13PILE ?auto_282163 ?auto_282164 ?auto_282165 ?auto_282166 ?auto_282167 ?auto_282168 ?auto_282169 ?auto_282170 ?auto_282171 ?auto_282172 ?auto_282173 ?auto_282174 ?auto_282175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282190 - BLOCK
      ?auto_282191 - BLOCK
      ?auto_282192 - BLOCK
      ?auto_282193 - BLOCK
      ?auto_282194 - BLOCK
      ?auto_282195 - BLOCK
      ?auto_282196 - BLOCK
      ?auto_282197 - BLOCK
      ?auto_282198 - BLOCK
      ?auto_282199 - BLOCK
      ?auto_282200 - BLOCK
      ?auto_282201 - BLOCK
      ?auto_282202 - BLOCK
    )
    :vars
    (
      ?auto_282203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282202 ?auto_282203 ) ( ON-TABLE ?auto_282190 ) ( ON ?auto_282191 ?auto_282190 ) ( ON ?auto_282192 ?auto_282191 ) ( ON ?auto_282193 ?auto_282192 ) ( ON ?auto_282194 ?auto_282193 ) ( ON ?auto_282195 ?auto_282194 ) ( ON ?auto_282196 ?auto_282195 ) ( ON ?auto_282197 ?auto_282196 ) ( not ( = ?auto_282190 ?auto_282191 ) ) ( not ( = ?auto_282190 ?auto_282192 ) ) ( not ( = ?auto_282190 ?auto_282193 ) ) ( not ( = ?auto_282190 ?auto_282194 ) ) ( not ( = ?auto_282190 ?auto_282195 ) ) ( not ( = ?auto_282190 ?auto_282196 ) ) ( not ( = ?auto_282190 ?auto_282197 ) ) ( not ( = ?auto_282190 ?auto_282198 ) ) ( not ( = ?auto_282190 ?auto_282199 ) ) ( not ( = ?auto_282190 ?auto_282200 ) ) ( not ( = ?auto_282190 ?auto_282201 ) ) ( not ( = ?auto_282190 ?auto_282202 ) ) ( not ( = ?auto_282190 ?auto_282203 ) ) ( not ( = ?auto_282191 ?auto_282192 ) ) ( not ( = ?auto_282191 ?auto_282193 ) ) ( not ( = ?auto_282191 ?auto_282194 ) ) ( not ( = ?auto_282191 ?auto_282195 ) ) ( not ( = ?auto_282191 ?auto_282196 ) ) ( not ( = ?auto_282191 ?auto_282197 ) ) ( not ( = ?auto_282191 ?auto_282198 ) ) ( not ( = ?auto_282191 ?auto_282199 ) ) ( not ( = ?auto_282191 ?auto_282200 ) ) ( not ( = ?auto_282191 ?auto_282201 ) ) ( not ( = ?auto_282191 ?auto_282202 ) ) ( not ( = ?auto_282191 ?auto_282203 ) ) ( not ( = ?auto_282192 ?auto_282193 ) ) ( not ( = ?auto_282192 ?auto_282194 ) ) ( not ( = ?auto_282192 ?auto_282195 ) ) ( not ( = ?auto_282192 ?auto_282196 ) ) ( not ( = ?auto_282192 ?auto_282197 ) ) ( not ( = ?auto_282192 ?auto_282198 ) ) ( not ( = ?auto_282192 ?auto_282199 ) ) ( not ( = ?auto_282192 ?auto_282200 ) ) ( not ( = ?auto_282192 ?auto_282201 ) ) ( not ( = ?auto_282192 ?auto_282202 ) ) ( not ( = ?auto_282192 ?auto_282203 ) ) ( not ( = ?auto_282193 ?auto_282194 ) ) ( not ( = ?auto_282193 ?auto_282195 ) ) ( not ( = ?auto_282193 ?auto_282196 ) ) ( not ( = ?auto_282193 ?auto_282197 ) ) ( not ( = ?auto_282193 ?auto_282198 ) ) ( not ( = ?auto_282193 ?auto_282199 ) ) ( not ( = ?auto_282193 ?auto_282200 ) ) ( not ( = ?auto_282193 ?auto_282201 ) ) ( not ( = ?auto_282193 ?auto_282202 ) ) ( not ( = ?auto_282193 ?auto_282203 ) ) ( not ( = ?auto_282194 ?auto_282195 ) ) ( not ( = ?auto_282194 ?auto_282196 ) ) ( not ( = ?auto_282194 ?auto_282197 ) ) ( not ( = ?auto_282194 ?auto_282198 ) ) ( not ( = ?auto_282194 ?auto_282199 ) ) ( not ( = ?auto_282194 ?auto_282200 ) ) ( not ( = ?auto_282194 ?auto_282201 ) ) ( not ( = ?auto_282194 ?auto_282202 ) ) ( not ( = ?auto_282194 ?auto_282203 ) ) ( not ( = ?auto_282195 ?auto_282196 ) ) ( not ( = ?auto_282195 ?auto_282197 ) ) ( not ( = ?auto_282195 ?auto_282198 ) ) ( not ( = ?auto_282195 ?auto_282199 ) ) ( not ( = ?auto_282195 ?auto_282200 ) ) ( not ( = ?auto_282195 ?auto_282201 ) ) ( not ( = ?auto_282195 ?auto_282202 ) ) ( not ( = ?auto_282195 ?auto_282203 ) ) ( not ( = ?auto_282196 ?auto_282197 ) ) ( not ( = ?auto_282196 ?auto_282198 ) ) ( not ( = ?auto_282196 ?auto_282199 ) ) ( not ( = ?auto_282196 ?auto_282200 ) ) ( not ( = ?auto_282196 ?auto_282201 ) ) ( not ( = ?auto_282196 ?auto_282202 ) ) ( not ( = ?auto_282196 ?auto_282203 ) ) ( not ( = ?auto_282197 ?auto_282198 ) ) ( not ( = ?auto_282197 ?auto_282199 ) ) ( not ( = ?auto_282197 ?auto_282200 ) ) ( not ( = ?auto_282197 ?auto_282201 ) ) ( not ( = ?auto_282197 ?auto_282202 ) ) ( not ( = ?auto_282197 ?auto_282203 ) ) ( not ( = ?auto_282198 ?auto_282199 ) ) ( not ( = ?auto_282198 ?auto_282200 ) ) ( not ( = ?auto_282198 ?auto_282201 ) ) ( not ( = ?auto_282198 ?auto_282202 ) ) ( not ( = ?auto_282198 ?auto_282203 ) ) ( not ( = ?auto_282199 ?auto_282200 ) ) ( not ( = ?auto_282199 ?auto_282201 ) ) ( not ( = ?auto_282199 ?auto_282202 ) ) ( not ( = ?auto_282199 ?auto_282203 ) ) ( not ( = ?auto_282200 ?auto_282201 ) ) ( not ( = ?auto_282200 ?auto_282202 ) ) ( not ( = ?auto_282200 ?auto_282203 ) ) ( not ( = ?auto_282201 ?auto_282202 ) ) ( not ( = ?auto_282201 ?auto_282203 ) ) ( not ( = ?auto_282202 ?auto_282203 ) ) ( ON ?auto_282201 ?auto_282202 ) ( ON ?auto_282200 ?auto_282201 ) ( ON ?auto_282199 ?auto_282200 ) ( CLEAR ?auto_282197 ) ( ON ?auto_282198 ?auto_282199 ) ( CLEAR ?auto_282198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_282190 ?auto_282191 ?auto_282192 ?auto_282193 ?auto_282194 ?auto_282195 ?auto_282196 ?auto_282197 ?auto_282198 )
      ( MAKE-13PILE ?auto_282190 ?auto_282191 ?auto_282192 ?auto_282193 ?auto_282194 ?auto_282195 ?auto_282196 ?auto_282197 ?auto_282198 ?auto_282199 ?auto_282200 ?auto_282201 ?auto_282202 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282217 - BLOCK
      ?auto_282218 - BLOCK
      ?auto_282219 - BLOCK
      ?auto_282220 - BLOCK
      ?auto_282221 - BLOCK
      ?auto_282222 - BLOCK
      ?auto_282223 - BLOCK
      ?auto_282224 - BLOCK
      ?auto_282225 - BLOCK
      ?auto_282226 - BLOCK
      ?auto_282227 - BLOCK
      ?auto_282228 - BLOCK
      ?auto_282229 - BLOCK
    )
    :vars
    (
      ?auto_282230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282229 ?auto_282230 ) ( ON-TABLE ?auto_282217 ) ( ON ?auto_282218 ?auto_282217 ) ( ON ?auto_282219 ?auto_282218 ) ( ON ?auto_282220 ?auto_282219 ) ( ON ?auto_282221 ?auto_282220 ) ( ON ?auto_282222 ?auto_282221 ) ( ON ?auto_282223 ?auto_282222 ) ( ON ?auto_282224 ?auto_282223 ) ( not ( = ?auto_282217 ?auto_282218 ) ) ( not ( = ?auto_282217 ?auto_282219 ) ) ( not ( = ?auto_282217 ?auto_282220 ) ) ( not ( = ?auto_282217 ?auto_282221 ) ) ( not ( = ?auto_282217 ?auto_282222 ) ) ( not ( = ?auto_282217 ?auto_282223 ) ) ( not ( = ?auto_282217 ?auto_282224 ) ) ( not ( = ?auto_282217 ?auto_282225 ) ) ( not ( = ?auto_282217 ?auto_282226 ) ) ( not ( = ?auto_282217 ?auto_282227 ) ) ( not ( = ?auto_282217 ?auto_282228 ) ) ( not ( = ?auto_282217 ?auto_282229 ) ) ( not ( = ?auto_282217 ?auto_282230 ) ) ( not ( = ?auto_282218 ?auto_282219 ) ) ( not ( = ?auto_282218 ?auto_282220 ) ) ( not ( = ?auto_282218 ?auto_282221 ) ) ( not ( = ?auto_282218 ?auto_282222 ) ) ( not ( = ?auto_282218 ?auto_282223 ) ) ( not ( = ?auto_282218 ?auto_282224 ) ) ( not ( = ?auto_282218 ?auto_282225 ) ) ( not ( = ?auto_282218 ?auto_282226 ) ) ( not ( = ?auto_282218 ?auto_282227 ) ) ( not ( = ?auto_282218 ?auto_282228 ) ) ( not ( = ?auto_282218 ?auto_282229 ) ) ( not ( = ?auto_282218 ?auto_282230 ) ) ( not ( = ?auto_282219 ?auto_282220 ) ) ( not ( = ?auto_282219 ?auto_282221 ) ) ( not ( = ?auto_282219 ?auto_282222 ) ) ( not ( = ?auto_282219 ?auto_282223 ) ) ( not ( = ?auto_282219 ?auto_282224 ) ) ( not ( = ?auto_282219 ?auto_282225 ) ) ( not ( = ?auto_282219 ?auto_282226 ) ) ( not ( = ?auto_282219 ?auto_282227 ) ) ( not ( = ?auto_282219 ?auto_282228 ) ) ( not ( = ?auto_282219 ?auto_282229 ) ) ( not ( = ?auto_282219 ?auto_282230 ) ) ( not ( = ?auto_282220 ?auto_282221 ) ) ( not ( = ?auto_282220 ?auto_282222 ) ) ( not ( = ?auto_282220 ?auto_282223 ) ) ( not ( = ?auto_282220 ?auto_282224 ) ) ( not ( = ?auto_282220 ?auto_282225 ) ) ( not ( = ?auto_282220 ?auto_282226 ) ) ( not ( = ?auto_282220 ?auto_282227 ) ) ( not ( = ?auto_282220 ?auto_282228 ) ) ( not ( = ?auto_282220 ?auto_282229 ) ) ( not ( = ?auto_282220 ?auto_282230 ) ) ( not ( = ?auto_282221 ?auto_282222 ) ) ( not ( = ?auto_282221 ?auto_282223 ) ) ( not ( = ?auto_282221 ?auto_282224 ) ) ( not ( = ?auto_282221 ?auto_282225 ) ) ( not ( = ?auto_282221 ?auto_282226 ) ) ( not ( = ?auto_282221 ?auto_282227 ) ) ( not ( = ?auto_282221 ?auto_282228 ) ) ( not ( = ?auto_282221 ?auto_282229 ) ) ( not ( = ?auto_282221 ?auto_282230 ) ) ( not ( = ?auto_282222 ?auto_282223 ) ) ( not ( = ?auto_282222 ?auto_282224 ) ) ( not ( = ?auto_282222 ?auto_282225 ) ) ( not ( = ?auto_282222 ?auto_282226 ) ) ( not ( = ?auto_282222 ?auto_282227 ) ) ( not ( = ?auto_282222 ?auto_282228 ) ) ( not ( = ?auto_282222 ?auto_282229 ) ) ( not ( = ?auto_282222 ?auto_282230 ) ) ( not ( = ?auto_282223 ?auto_282224 ) ) ( not ( = ?auto_282223 ?auto_282225 ) ) ( not ( = ?auto_282223 ?auto_282226 ) ) ( not ( = ?auto_282223 ?auto_282227 ) ) ( not ( = ?auto_282223 ?auto_282228 ) ) ( not ( = ?auto_282223 ?auto_282229 ) ) ( not ( = ?auto_282223 ?auto_282230 ) ) ( not ( = ?auto_282224 ?auto_282225 ) ) ( not ( = ?auto_282224 ?auto_282226 ) ) ( not ( = ?auto_282224 ?auto_282227 ) ) ( not ( = ?auto_282224 ?auto_282228 ) ) ( not ( = ?auto_282224 ?auto_282229 ) ) ( not ( = ?auto_282224 ?auto_282230 ) ) ( not ( = ?auto_282225 ?auto_282226 ) ) ( not ( = ?auto_282225 ?auto_282227 ) ) ( not ( = ?auto_282225 ?auto_282228 ) ) ( not ( = ?auto_282225 ?auto_282229 ) ) ( not ( = ?auto_282225 ?auto_282230 ) ) ( not ( = ?auto_282226 ?auto_282227 ) ) ( not ( = ?auto_282226 ?auto_282228 ) ) ( not ( = ?auto_282226 ?auto_282229 ) ) ( not ( = ?auto_282226 ?auto_282230 ) ) ( not ( = ?auto_282227 ?auto_282228 ) ) ( not ( = ?auto_282227 ?auto_282229 ) ) ( not ( = ?auto_282227 ?auto_282230 ) ) ( not ( = ?auto_282228 ?auto_282229 ) ) ( not ( = ?auto_282228 ?auto_282230 ) ) ( not ( = ?auto_282229 ?auto_282230 ) ) ( ON ?auto_282228 ?auto_282229 ) ( ON ?auto_282227 ?auto_282228 ) ( ON ?auto_282226 ?auto_282227 ) ( CLEAR ?auto_282224 ) ( ON ?auto_282225 ?auto_282226 ) ( CLEAR ?auto_282225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_282217 ?auto_282218 ?auto_282219 ?auto_282220 ?auto_282221 ?auto_282222 ?auto_282223 ?auto_282224 ?auto_282225 )
      ( MAKE-13PILE ?auto_282217 ?auto_282218 ?auto_282219 ?auto_282220 ?auto_282221 ?auto_282222 ?auto_282223 ?auto_282224 ?auto_282225 ?auto_282226 ?auto_282227 ?auto_282228 ?auto_282229 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282244 - BLOCK
      ?auto_282245 - BLOCK
      ?auto_282246 - BLOCK
      ?auto_282247 - BLOCK
      ?auto_282248 - BLOCK
      ?auto_282249 - BLOCK
      ?auto_282250 - BLOCK
      ?auto_282251 - BLOCK
      ?auto_282252 - BLOCK
      ?auto_282253 - BLOCK
      ?auto_282254 - BLOCK
      ?auto_282255 - BLOCK
      ?auto_282256 - BLOCK
    )
    :vars
    (
      ?auto_282257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282256 ?auto_282257 ) ( ON-TABLE ?auto_282244 ) ( ON ?auto_282245 ?auto_282244 ) ( ON ?auto_282246 ?auto_282245 ) ( ON ?auto_282247 ?auto_282246 ) ( ON ?auto_282248 ?auto_282247 ) ( ON ?auto_282249 ?auto_282248 ) ( ON ?auto_282250 ?auto_282249 ) ( not ( = ?auto_282244 ?auto_282245 ) ) ( not ( = ?auto_282244 ?auto_282246 ) ) ( not ( = ?auto_282244 ?auto_282247 ) ) ( not ( = ?auto_282244 ?auto_282248 ) ) ( not ( = ?auto_282244 ?auto_282249 ) ) ( not ( = ?auto_282244 ?auto_282250 ) ) ( not ( = ?auto_282244 ?auto_282251 ) ) ( not ( = ?auto_282244 ?auto_282252 ) ) ( not ( = ?auto_282244 ?auto_282253 ) ) ( not ( = ?auto_282244 ?auto_282254 ) ) ( not ( = ?auto_282244 ?auto_282255 ) ) ( not ( = ?auto_282244 ?auto_282256 ) ) ( not ( = ?auto_282244 ?auto_282257 ) ) ( not ( = ?auto_282245 ?auto_282246 ) ) ( not ( = ?auto_282245 ?auto_282247 ) ) ( not ( = ?auto_282245 ?auto_282248 ) ) ( not ( = ?auto_282245 ?auto_282249 ) ) ( not ( = ?auto_282245 ?auto_282250 ) ) ( not ( = ?auto_282245 ?auto_282251 ) ) ( not ( = ?auto_282245 ?auto_282252 ) ) ( not ( = ?auto_282245 ?auto_282253 ) ) ( not ( = ?auto_282245 ?auto_282254 ) ) ( not ( = ?auto_282245 ?auto_282255 ) ) ( not ( = ?auto_282245 ?auto_282256 ) ) ( not ( = ?auto_282245 ?auto_282257 ) ) ( not ( = ?auto_282246 ?auto_282247 ) ) ( not ( = ?auto_282246 ?auto_282248 ) ) ( not ( = ?auto_282246 ?auto_282249 ) ) ( not ( = ?auto_282246 ?auto_282250 ) ) ( not ( = ?auto_282246 ?auto_282251 ) ) ( not ( = ?auto_282246 ?auto_282252 ) ) ( not ( = ?auto_282246 ?auto_282253 ) ) ( not ( = ?auto_282246 ?auto_282254 ) ) ( not ( = ?auto_282246 ?auto_282255 ) ) ( not ( = ?auto_282246 ?auto_282256 ) ) ( not ( = ?auto_282246 ?auto_282257 ) ) ( not ( = ?auto_282247 ?auto_282248 ) ) ( not ( = ?auto_282247 ?auto_282249 ) ) ( not ( = ?auto_282247 ?auto_282250 ) ) ( not ( = ?auto_282247 ?auto_282251 ) ) ( not ( = ?auto_282247 ?auto_282252 ) ) ( not ( = ?auto_282247 ?auto_282253 ) ) ( not ( = ?auto_282247 ?auto_282254 ) ) ( not ( = ?auto_282247 ?auto_282255 ) ) ( not ( = ?auto_282247 ?auto_282256 ) ) ( not ( = ?auto_282247 ?auto_282257 ) ) ( not ( = ?auto_282248 ?auto_282249 ) ) ( not ( = ?auto_282248 ?auto_282250 ) ) ( not ( = ?auto_282248 ?auto_282251 ) ) ( not ( = ?auto_282248 ?auto_282252 ) ) ( not ( = ?auto_282248 ?auto_282253 ) ) ( not ( = ?auto_282248 ?auto_282254 ) ) ( not ( = ?auto_282248 ?auto_282255 ) ) ( not ( = ?auto_282248 ?auto_282256 ) ) ( not ( = ?auto_282248 ?auto_282257 ) ) ( not ( = ?auto_282249 ?auto_282250 ) ) ( not ( = ?auto_282249 ?auto_282251 ) ) ( not ( = ?auto_282249 ?auto_282252 ) ) ( not ( = ?auto_282249 ?auto_282253 ) ) ( not ( = ?auto_282249 ?auto_282254 ) ) ( not ( = ?auto_282249 ?auto_282255 ) ) ( not ( = ?auto_282249 ?auto_282256 ) ) ( not ( = ?auto_282249 ?auto_282257 ) ) ( not ( = ?auto_282250 ?auto_282251 ) ) ( not ( = ?auto_282250 ?auto_282252 ) ) ( not ( = ?auto_282250 ?auto_282253 ) ) ( not ( = ?auto_282250 ?auto_282254 ) ) ( not ( = ?auto_282250 ?auto_282255 ) ) ( not ( = ?auto_282250 ?auto_282256 ) ) ( not ( = ?auto_282250 ?auto_282257 ) ) ( not ( = ?auto_282251 ?auto_282252 ) ) ( not ( = ?auto_282251 ?auto_282253 ) ) ( not ( = ?auto_282251 ?auto_282254 ) ) ( not ( = ?auto_282251 ?auto_282255 ) ) ( not ( = ?auto_282251 ?auto_282256 ) ) ( not ( = ?auto_282251 ?auto_282257 ) ) ( not ( = ?auto_282252 ?auto_282253 ) ) ( not ( = ?auto_282252 ?auto_282254 ) ) ( not ( = ?auto_282252 ?auto_282255 ) ) ( not ( = ?auto_282252 ?auto_282256 ) ) ( not ( = ?auto_282252 ?auto_282257 ) ) ( not ( = ?auto_282253 ?auto_282254 ) ) ( not ( = ?auto_282253 ?auto_282255 ) ) ( not ( = ?auto_282253 ?auto_282256 ) ) ( not ( = ?auto_282253 ?auto_282257 ) ) ( not ( = ?auto_282254 ?auto_282255 ) ) ( not ( = ?auto_282254 ?auto_282256 ) ) ( not ( = ?auto_282254 ?auto_282257 ) ) ( not ( = ?auto_282255 ?auto_282256 ) ) ( not ( = ?auto_282255 ?auto_282257 ) ) ( not ( = ?auto_282256 ?auto_282257 ) ) ( ON ?auto_282255 ?auto_282256 ) ( ON ?auto_282254 ?auto_282255 ) ( ON ?auto_282253 ?auto_282254 ) ( ON ?auto_282252 ?auto_282253 ) ( CLEAR ?auto_282250 ) ( ON ?auto_282251 ?auto_282252 ) ( CLEAR ?auto_282251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_282244 ?auto_282245 ?auto_282246 ?auto_282247 ?auto_282248 ?auto_282249 ?auto_282250 ?auto_282251 )
      ( MAKE-13PILE ?auto_282244 ?auto_282245 ?auto_282246 ?auto_282247 ?auto_282248 ?auto_282249 ?auto_282250 ?auto_282251 ?auto_282252 ?auto_282253 ?auto_282254 ?auto_282255 ?auto_282256 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282271 - BLOCK
      ?auto_282272 - BLOCK
      ?auto_282273 - BLOCK
      ?auto_282274 - BLOCK
      ?auto_282275 - BLOCK
      ?auto_282276 - BLOCK
      ?auto_282277 - BLOCK
      ?auto_282278 - BLOCK
      ?auto_282279 - BLOCK
      ?auto_282280 - BLOCK
      ?auto_282281 - BLOCK
      ?auto_282282 - BLOCK
      ?auto_282283 - BLOCK
    )
    :vars
    (
      ?auto_282284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282283 ?auto_282284 ) ( ON-TABLE ?auto_282271 ) ( ON ?auto_282272 ?auto_282271 ) ( ON ?auto_282273 ?auto_282272 ) ( ON ?auto_282274 ?auto_282273 ) ( ON ?auto_282275 ?auto_282274 ) ( ON ?auto_282276 ?auto_282275 ) ( ON ?auto_282277 ?auto_282276 ) ( not ( = ?auto_282271 ?auto_282272 ) ) ( not ( = ?auto_282271 ?auto_282273 ) ) ( not ( = ?auto_282271 ?auto_282274 ) ) ( not ( = ?auto_282271 ?auto_282275 ) ) ( not ( = ?auto_282271 ?auto_282276 ) ) ( not ( = ?auto_282271 ?auto_282277 ) ) ( not ( = ?auto_282271 ?auto_282278 ) ) ( not ( = ?auto_282271 ?auto_282279 ) ) ( not ( = ?auto_282271 ?auto_282280 ) ) ( not ( = ?auto_282271 ?auto_282281 ) ) ( not ( = ?auto_282271 ?auto_282282 ) ) ( not ( = ?auto_282271 ?auto_282283 ) ) ( not ( = ?auto_282271 ?auto_282284 ) ) ( not ( = ?auto_282272 ?auto_282273 ) ) ( not ( = ?auto_282272 ?auto_282274 ) ) ( not ( = ?auto_282272 ?auto_282275 ) ) ( not ( = ?auto_282272 ?auto_282276 ) ) ( not ( = ?auto_282272 ?auto_282277 ) ) ( not ( = ?auto_282272 ?auto_282278 ) ) ( not ( = ?auto_282272 ?auto_282279 ) ) ( not ( = ?auto_282272 ?auto_282280 ) ) ( not ( = ?auto_282272 ?auto_282281 ) ) ( not ( = ?auto_282272 ?auto_282282 ) ) ( not ( = ?auto_282272 ?auto_282283 ) ) ( not ( = ?auto_282272 ?auto_282284 ) ) ( not ( = ?auto_282273 ?auto_282274 ) ) ( not ( = ?auto_282273 ?auto_282275 ) ) ( not ( = ?auto_282273 ?auto_282276 ) ) ( not ( = ?auto_282273 ?auto_282277 ) ) ( not ( = ?auto_282273 ?auto_282278 ) ) ( not ( = ?auto_282273 ?auto_282279 ) ) ( not ( = ?auto_282273 ?auto_282280 ) ) ( not ( = ?auto_282273 ?auto_282281 ) ) ( not ( = ?auto_282273 ?auto_282282 ) ) ( not ( = ?auto_282273 ?auto_282283 ) ) ( not ( = ?auto_282273 ?auto_282284 ) ) ( not ( = ?auto_282274 ?auto_282275 ) ) ( not ( = ?auto_282274 ?auto_282276 ) ) ( not ( = ?auto_282274 ?auto_282277 ) ) ( not ( = ?auto_282274 ?auto_282278 ) ) ( not ( = ?auto_282274 ?auto_282279 ) ) ( not ( = ?auto_282274 ?auto_282280 ) ) ( not ( = ?auto_282274 ?auto_282281 ) ) ( not ( = ?auto_282274 ?auto_282282 ) ) ( not ( = ?auto_282274 ?auto_282283 ) ) ( not ( = ?auto_282274 ?auto_282284 ) ) ( not ( = ?auto_282275 ?auto_282276 ) ) ( not ( = ?auto_282275 ?auto_282277 ) ) ( not ( = ?auto_282275 ?auto_282278 ) ) ( not ( = ?auto_282275 ?auto_282279 ) ) ( not ( = ?auto_282275 ?auto_282280 ) ) ( not ( = ?auto_282275 ?auto_282281 ) ) ( not ( = ?auto_282275 ?auto_282282 ) ) ( not ( = ?auto_282275 ?auto_282283 ) ) ( not ( = ?auto_282275 ?auto_282284 ) ) ( not ( = ?auto_282276 ?auto_282277 ) ) ( not ( = ?auto_282276 ?auto_282278 ) ) ( not ( = ?auto_282276 ?auto_282279 ) ) ( not ( = ?auto_282276 ?auto_282280 ) ) ( not ( = ?auto_282276 ?auto_282281 ) ) ( not ( = ?auto_282276 ?auto_282282 ) ) ( not ( = ?auto_282276 ?auto_282283 ) ) ( not ( = ?auto_282276 ?auto_282284 ) ) ( not ( = ?auto_282277 ?auto_282278 ) ) ( not ( = ?auto_282277 ?auto_282279 ) ) ( not ( = ?auto_282277 ?auto_282280 ) ) ( not ( = ?auto_282277 ?auto_282281 ) ) ( not ( = ?auto_282277 ?auto_282282 ) ) ( not ( = ?auto_282277 ?auto_282283 ) ) ( not ( = ?auto_282277 ?auto_282284 ) ) ( not ( = ?auto_282278 ?auto_282279 ) ) ( not ( = ?auto_282278 ?auto_282280 ) ) ( not ( = ?auto_282278 ?auto_282281 ) ) ( not ( = ?auto_282278 ?auto_282282 ) ) ( not ( = ?auto_282278 ?auto_282283 ) ) ( not ( = ?auto_282278 ?auto_282284 ) ) ( not ( = ?auto_282279 ?auto_282280 ) ) ( not ( = ?auto_282279 ?auto_282281 ) ) ( not ( = ?auto_282279 ?auto_282282 ) ) ( not ( = ?auto_282279 ?auto_282283 ) ) ( not ( = ?auto_282279 ?auto_282284 ) ) ( not ( = ?auto_282280 ?auto_282281 ) ) ( not ( = ?auto_282280 ?auto_282282 ) ) ( not ( = ?auto_282280 ?auto_282283 ) ) ( not ( = ?auto_282280 ?auto_282284 ) ) ( not ( = ?auto_282281 ?auto_282282 ) ) ( not ( = ?auto_282281 ?auto_282283 ) ) ( not ( = ?auto_282281 ?auto_282284 ) ) ( not ( = ?auto_282282 ?auto_282283 ) ) ( not ( = ?auto_282282 ?auto_282284 ) ) ( not ( = ?auto_282283 ?auto_282284 ) ) ( ON ?auto_282282 ?auto_282283 ) ( ON ?auto_282281 ?auto_282282 ) ( ON ?auto_282280 ?auto_282281 ) ( ON ?auto_282279 ?auto_282280 ) ( CLEAR ?auto_282277 ) ( ON ?auto_282278 ?auto_282279 ) ( CLEAR ?auto_282278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_282271 ?auto_282272 ?auto_282273 ?auto_282274 ?auto_282275 ?auto_282276 ?auto_282277 ?auto_282278 )
      ( MAKE-13PILE ?auto_282271 ?auto_282272 ?auto_282273 ?auto_282274 ?auto_282275 ?auto_282276 ?auto_282277 ?auto_282278 ?auto_282279 ?auto_282280 ?auto_282281 ?auto_282282 ?auto_282283 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282298 - BLOCK
      ?auto_282299 - BLOCK
      ?auto_282300 - BLOCK
      ?auto_282301 - BLOCK
      ?auto_282302 - BLOCK
      ?auto_282303 - BLOCK
      ?auto_282304 - BLOCK
      ?auto_282305 - BLOCK
      ?auto_282306 - BLOCK
      ?auto_282307 - BLOCK
      ?auto_282308 - BLOCK
      ?auto_282309 - BLOCK
      ?auto_282310 - BLOCK
    )
    :vars
    (
      ?auto_282311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282310 ?auto_282311 ) ( ON-TABLE ?auto_282298 ) ( ON ?auto_282299 ?auto_282298 ) ( ON ?auto_282300 ?auto_282299 ) ( ON ?auto_282301 ?auto_282300 ) ( ON ?auto_282302 ?auto_282301 ) ( ON ?auto_282303 ?auto_282302 ) ( not ( = ?auto_282298 ?auto_282299 ) ) ( not ( = ?auto_282298 ?auto_282300 ) ) ( not ( = ?auto_282298 ?auto_282301 ) ) ( not ( = ?auto_282298 ?auto_282302 ) ) ( not ( = ?auto_282298 ?auto_282303 ) ) ( not ( = ?auto_282298 ?auto_282304 ) ) ( not ( = ?auto_282298 ?auto_282305 ) ) ( not ( = ?auto_282298 ?auto_282306 ) ) ( not ( = ?auto_282298 ?auto_282307 ) ) ( not ( = ?auto_282298 ?auto_282308 ) ) ( not ( = ?auto_282298 ?auto_282309 ) ) ( not ( = ?auto_282298 ?auto_282310 ) ) ( not ( = ?auto_282298 ?auto_282311 ) ) ( not ( = ?auto_282299 ?auto_282300 ) ) ( not ( = ?auto_282299 ?auto_282301 ) ) ( not ( = ?auto_282299 ?auto_282302 ) ) ( not ( = ?auto_282299 ?auto_282303 ) ) ( not ( = ?auto_282299 ?auto_282304 ) ) ( not ( = ?auto_282299 ?auto_282305 ) ) ( not ( = ?auto_282299 ?auto_282306 ) ) ( not ( = ?auto_282299 ?auto_282307 ) ) ( not ( = ?auto_282299 ?auto_282308 ) ) ( not ( = ?auto_282299 ?auto_282309 ) ) ( not ( = ?auto_282299 ?auto_282310 ) ) ( not ( = ?auto_282299 ?auto_282311 ) ) ( not ( = ?auto_282300 ?auto_282301 ) ) ( not ( = ?auto_282300 ?auto_282302 ) ) ( not ( = ?auto_282300 ?auto_282303 ) ) ( not ( = ?auto_282300 ?auto_282304 ) ) ( not ( = ?auto_282300 ?auto_282305 ) ) ( not ( = ?auto_282300 ?auto_282306 ) ) ( not ( = ?auto_282300 ?auto_282307 ) ) ( not ( = ?auto_282300 ?auto_282308 ) ) ( not ( = ?auto_282300 ?auto_282309 ) ) ( not ( = ?auto_282300 ?auto_282310 ) ) ( not ( = ?auto_282300 ?auto_282311 ) ) ( not ( = ?auto_282301 ?auto_282302 ) ) ( not ( = ?auto_282301 ?auto_282303 ) ) ( not ( = ?auto_282301 ?auto_282304 ) ) ( not ( = ?auto_282301 ?auto_282305 ) ) ( not ( = ?auto_282301 ?auto_282306 ) ) ( not ( = ?auto_282301 ?auto_282307 ) ) ( not ( = ?auto_282301 ?auto_282308 ) ) ( not ( = ?auto_282301 ?auto_282309 ) ) ( not ( = ?auto_282301 ?auto_282310 ) ) ( not ( = ?auto_282301 ?auto_282311 ) ) ( not ( = ?auto_282302 ?auto_282303 ) ) ( not ( = ?auto_282302 ?auto_282304 ) ) ( not ( = ?auto_282302 ?auto_282305 ) ) ( not ( = ?auto_282302 ?auto_282306 ) ) ( not ( = ?auto_282302 ?auto_282307 ) ) ( not ( = ?auto_282302 ?auto_282308 ) ) ( not ( = ?auto_282302 ?auto_282309 ) ) ( not ( = ?auto_282302 ?auto_282310 ) ) ( not ( = ?auto_282302 ?auto_282311 ) ) ( not ( = ?auto_282303 ?auto_282304 ) ) ( not ( = ?auto_282303 ?auto_282305 ) ) ( not ( = ?auto_282303 ?auto_282306 ) ) ( not ( = ?auto_282303 ?auto_282307 ) ) ( not ( = ?auto_282303 ?auto_282308 ) ) ( not ( = ?auto_282303 ?auto_282309 ) ) ( not ( = ?auto_282303 ?auto_282310 ) ) ( not ( = ?auto_282303 ?auto_282311 ) ) ( not ( = ?auto_282304 ?auto_282305 ) ) ( not ( = ?auto_282304 ?auto_282306 ) ) ( not ( = ?auto_282304 ?auto_282307 ) ) ( not ( = ?auto_282304 ?auto_282308 ) ) ( not ( = ?auto_282304 ?auto_282309 ) ) ( not ( = ?auto_282304 ?auto_282310 ) ) ( not ( = ?auto_282304 ?auto_282311 ) ) ( not ( = ?auto_282305 ?auto_282306 ) ) ( not ( = ?auto_282305 ?auto_282307 ) ) ( not ( = ?auto_282305 ?auto_282308 ) ) ( not ( = ?auto_282305 ?auto_282309 ) ) ( not ( = ?auto_282305 ?auto_282310 ) ) ( not ( = ?auto_282305 ?auto_282311 ) ) ( not ( = ?auto_282306 ?auto_282307 ) ) ( not ( = ?auto_282306 ?auto_282308 ) ) ( not ( = ?auto_282306 ?auto_282309 ) ) ( not ( = ?auto_282306 ?auto_282310 ) ) ( not ( = ?auto_282306 ?auto_282311 ) ) ( not ( = ?auto_282307 ?auto_282308 ) ) ( not ( = ?auto_282307 ?auto_282309 ) ) ( not ( = ?auto_282307 ?auto_282310 ) ) ( not ( = ?auto_282307 ?auto_282311 ) ) ( not ( = ?auto_282308 ?auto_282309 ) ) ( not ( = ?auto_282308 ?auto_282310 ) ) ( not ( = ?auto_282308 ?auto_282311 ) ) ( not ( = ?auto_282309 ?auto_282310 ) ) ( not ( = ?auto_282309 ?auto_282311 ) ) ( not ( = ?auto_282310 ?auto_282311 ) ) ( ON ?auto_282309 ?auto_282310 ) ( ON ?auto_282308 ?auto_282309 ) ( ON ?auto_282307 ?auto_282308 ) ( ON ?auto_282306 ?auto_282307 ) ( ON ?auto_282305 ?auto_282306 ) ( CLEAR ?auto_282303 ) ( ON ?auto_282304 ?auto_282305 ) ( CLEAR ?auto_282304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_282298 ?auto_282299 ?auto_282300 ?auto_282301 ?auto_282302 ?auto_282303 ?auto_282304 )
      ( MAKE-13PILE ?auto_282298 ?auto_282299 ?auto_282300 ?auto_282301 ?auto_282302 ?auto_282303 ?auto_282304 ?auto_282305 ?auto_282306 ?auto_282307 ?auto_282308 ?auto_282309 ?auto_282310 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282325 - BLOCK
      ?auto_282326 - BLOCK
      ?auto_282327 - BLOCK
      ?auto_282328 - BLOCK
      ?auto_282329 - BLOCK
      ?auto_282330 - BLOCK
      ?auto_282331 - BLOCK
      ?auto_282332 - BLOCK
      ?auto_282333 - BLOCK
      ?auto_282334 - BLOCK
      ?auto_282335 - BLOCK
      ?auto_282336 - BLOCK
      ?auto_282337 - BLOCK
    )
    :vars
    (
      ?auto_282338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282337 ?auto_282338 ) ( ON-TABLE ?auto_282325 ) ( ON ?auto_282326 ?auto_282325 ) ( ON ?auto_282327 ?auto_282326 ) ( ON ?auto_282328 ?auto_282327 ) ( ON ?auto_282329 ?auto_282328 ) ( ON ?auto_282330 ?auto_282329 ) ( not ( = ?auto_282325 ?auto_282326 ) ) ( not ( = ?auto_282325 ?auto_282327 ) ) ( not ( = ?auto_282325 ?auto_282328 ) ) ( not ( = ?auto_282325 ?auto_282329 ) ) ( not ( = ?auto_282325 ?auto_282330 ) ) ( not ( = ?auto_282325 ?auto_282331 ) ) ( not ( = ?auto_282325 ?auto_282332 ) ) ( not ( = ?auto_282325 ?auto_282333 ) ) ( not ( = ?auto_282325 ?auto_282334 ) ) ( not ( = ?auto_282325 ?auto_282335 ) ) ( not ( = ?auto_282325 ?auto_282336 ) ) ( not ( = ?auto_282325 ?auto_282337 ) ) ( not ( = ?auto_282325 ?auto_282338 ) ) ( not ( = ?auto_282326 ?auto_282327 ) ) ( not ( = ?auto_282326 ?auto_282328 ) ) ( not ( = ?auto_282326 ?auto_282329 ) ) ( not ( = ?auto_282326 ?auto_282330 ) ) ( not ( = ?auto_282326 ?auto_282331 ) ) ( not ( = ?auto_282326 ?auto_282332 ) ) ( not ( = ?auto_282326 ?auto_282333 ) ) ( not ( = ?auto_282326 ?auto_282334 ) ) ( not ( = ?auto_282326 ?auto_282335 ) ) ( not ( = ?auto_282326 ?auto_282336 ) ) ( not ( = ?auto_282326 ?auto_282337 ) ) ( not ( = ?auto_282326 ?auto_282338 ) ) ( not ( = ?auto_282327 ?auto_282328 ) ) ( not ( = ?auto_282327 ?auto_282329 ) ) ( not ( = ?auto_282327 ?auto_282330 ) ) ( not ( = ?auto_282327 ?auto_282331 ) ) ( not ( = ?auto_282327 ?auto_282332 ) ) ( not ( = ?auto_282327 ?auto_282333 ) ) ( not ( = ?auto_282327 ?auto_282334 ) ) ( not ( = ?auto_282327 ?auto_282335 ) ) ( not ( = ?auto_282327 ?auto_282336 ) ) ( not ( = ?auto_282327 ?auto_282337 ) ) ( not ( = ?auto_282327 ?auto_282338 ) ) ( not ( = ?auto_282328 ?auto_282329 ) ) ( not ( = ?auto_282328 ?auto_282330 ) ) ( not ( = ?auto_282328 ?auto_282331 ) ) ( not ( = ?auto_282328 ?auto_282332 ) ) ( not ( = ?auto_282328 ?auto_282333 ) ) ( not ( = ?auto_282328 ?auto_282334 ) ) ( not ( = ?auto_282328 ?auto_282335 ) ) ( not ( = ?auto_282328 ?auto_282336 ) ) ( not ( = ?auto_282328 ?auto_282337 ) ) ( not ( = ?auto_282328 ?auto_282338 ) ) ( not ( = ?auto_282329 ?auto_282330 ) ) ( not ( = ?auto_282329 ?auto_282331 ) ) ( not ( = ?auto_282329 ?auto_282332 ) ) ( not ( = ?auto_282329 ?auto_282333 ) ) ( not ( = ?auto_282329 ?auto_282334 ) ) ( not ( = ?auto_282329 ?auto_282335 ) ) ( not ( = ?auto_282329 ?auto_282336 ) ) ( not ( = ?auto_282329 ?auto_282337 ) ) ( not ( = ?auto_282329 ?auto_282338 ) ) ( not ( = ?auto_282330 ?auto_282331 ) ) ( not ( = ?auto_282330 ?auto_282332 ) ) ( not ( = ?auto_282330 ?auto_282333 ) ) ( not ( = ?auto_282330 ?auto_282334 ) ) ( not ( = ?auto_282330 ?auto_282335 ) ) ( not ( = ?auto_282330 ?auto_282336 ) ) ( not ( = ?auto_282330 ?auto_282337 ) ) ( not ( = ?auto_282330 ?auto_282338 ) ) ( not ( = ?auto_282331 ?auto_282332 ) ) ( not ( = ?auto_282331 ?auto_282333 ) ) ( not ( = ?auto_282331 ?auto_282334 ) ) ( not ( = ?auto_282331 ?auto_282335 ) ) ( not ( = ?auto_282331 ?auto_282336 ) ) ( not ( = ?auto_282331 ?auto_282337 ) ) ( not ( = ?auto_282331 ?auto_282338 ) ) ( not ( = ?auto_282332 ?auto_282333 ) ) ( not ( = ?auto_282332 ?auto_282334 ) ) ( not ( = ?auto_282332 ?auto_282335 ) ) ( not ( = ?auto_282332 ?auto_282336 ) ) ( not ( = ?auto_282332 ?auto_282337 ) ) ( not ( = ?auto_282332 ?auto_282338 ) ) ( not ( = ?auto_282333 ?auto_282334 ) ) ( not ( = ?auto_282333 ?auto_282335 ) ) ( not ( = ?auto_282333 ?auto_282336 ) ) ( not ( = ?auto_282333 ?auto_282337 ) ) ( not ( = ?auto_282333 ?auto_282338 ) ) ( not ( = ?auto_282334 ?auto_282335 ) ) ( not ( = ?auto_282334 ?auto_282336 ) ) ( not ( = ?auto_282334 ?auto_282337 ) ) ( not ( = ?auto_282334 ?auto_282338 ) ) ( not ( = ?auto_282335 ?auto_282336 ) ) ( not ( = ?auto_282335 ?auto_282337 ) ) ( not ( = ?auto_282335 ?auto_282338 ) ) ( not ( = ?auto_282336 ?auto_282337 ) ) ( not ( = ?auto_282336 ?auto_282338 ) ) ( not ( = ?auto_282337 ?auto_282338 ) ) ( ON ?auto_282336 ?auto_282337 ) ( ON ?auto_282335 ?auto_282336 ) ( ON ?auto_282334 ?auto_282335 ) ( ON ?auto_282333 ?auto_282334 ) ( ON ?auto_282332 ?auto_282333 ) ( CLEAR ?auto_282330 ) ( ON ?auto_282331 ?auto_282332 ) ( CLEAR ?auto_282331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_282325 ?auto_282326 ?auto_282327 ?auto_282328 ?auto_282329 ?auto_282330 ?auto_282331 )
      ( MAKE-13PILE ?auto_282325 ?auto_282326 ?auto_282327 ?auto_282328 ?auto_282329 ?auto_282330 ?auto_282331 ?auto_282332 ?auto_282333 ?auto_282334 ?auto_282335 ?auto_282336 ?auto_282337 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282352 - BLOCK
      ?auto_282353 - BLOCK
      ?auto_282354 - BLOCK
      ?auto_282355 - BLOCK
      ?auto_282356 - BLOCK
      ?auto_282357 - BLOCK
      ?auto_282358 - BLOCK
      ?auto_282359 - BLOCK
      ?auto_282360 - BLOCK
      ?auto_282361 - BLOCK
      ?auto_282362 - BLOCK
      ?auto_282363 - BLOCK
      ?auto_282364 - BLOCK
    )
    :vars
    (
      ?auto_282365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282364 ?auto_282365 ) ( ON-TABLE ?auto_282352 ) ( ON ?auto_282353 ?auto_282352 ) ( ON ?auto_282354 ?auto_282353 ) ( ON ?auto_282355 ?auto_282354 ) ( ON ?auto_282356 ?auto_282355 ) ( not ( = ?auto_282352 ?auto_282353 ) ) ( not ( = ?auto_282352 ?auto_282354 ) ) ( not ( = ?auto_282352 ?auto_282355 ) ) ( not ( = ?auto_282352 ?auto_282356 ) ) ( not ( = ?auto_282352 ?auto_282357 ) ) ( not ( = ?auto_282352 ?auto_282358 ) ) ( not ( = ?auto_282352 ?auto_282359 ) ) ( not ( = ?auto_282352 ?auto_282360 ) ) ( not ( = ?auto_282352 ?auto_282361 ) ) ( not ( = ?auto_282352 ?auto_282362 ) ) ( not ( = ?auto_282352 ?auto_282363 ) ) ( not ( = ?auto_282352 ?auto_282364 ) ) ( not ( = ?auto_282352 ?auto_282365 ) ) ( not ( = ?auto_282353 ?auto_282354 ) ) ( not ( = ?auto_282353 ?auto_282355 ) ) ( not ( = ?auto_282353 ?auto_282356 ) ) ( not ( = ?auto_282353 ?auto_282357 ) ) ( not ( = ?auto_282353 ?auto_282358 ) ) ( not ( = ?auto_282353 ?auto_282359 ) ) ( not ( = ?auto_282353 ?auto_282360 ) ) ( not ( = ?auto_282353 ?auto_282361 ) ) ( not ( = ?auto_282353 ?auto_282362 ) ) ( not ( = ?auto_282353 ?auto_282363 ) ) ( not ( = ?auto_282353 ?auto_282364 ) ) ( not ( = ?auto_282353 ?auto_282365 ) ) ( not ( = ?auto_282354 ?auto_282355 ) ) ( not ( = ?auto_282354 ?auto_282356 ) ) ( not ( = ?auto_282354 ?auto_282357 ) ) ( not ( = ?auto_282354 ?auto_282358 ) ) ( not ( = ?auto_282354 ?auto_282359 ) ) ( not ( = ?auto_282354 ?auto_282360 ) ) ( not ( = ?auto_282354 ?auto_282361 ) ) ( not ( = ?auto_282354 ?auto_282362 ) ) ( not ( = ?auto_282354 ?auto_282363 ) ) ( not ( = ?auto_282354 ?auto_282364 ) ) ( not ( = ?auto_282354 ?auto_282365 ) ) ( not ( = ?auto_282355 ?auto_282356 ) ) ( not ( = ?auto_282355 ?auto_282357 ) ) ( not ( = ?auto_282355 ?auto_282358 ) ) ( not ( = ?auto_282355 ?auto_282359 ) ) ( not ( = ?auto_282355 ?auto_282360 ) ) ( not ( = ?auto_282355 ?auto_282361 ) ) ( not ( = ?auto_282355 ?auto_282362 ) ) ( not ( = ?auto_282355 ?auto_282363 ) ) ( not ( = ?auto_282355 ?auto_282364 ) ) ( not ( = ?auto_282355 ?auto_282365 ) ) ( not ( = ?auto_282356 ?auto_282357 ) ) ( not ( = ?auto_282356 ?auto_282358 ) ) ( not ( = ?auto_282356 ?auto_282359 ) ) ( not ( = ?auto_282356 ?auto_282360 ) ) ( not ( = ?auto_282356 ?auto_282361 ) ) ( not ( = ?auto_282356 ?auto_282362 ) ) ( not ( = ?auto_282356 ?auto_282363 ) ) ( not ( = ?auto_282356 ?auto_282364 ) ) ( not ( = ?auto_282356 ?auto_282365 ) ) ( not ( = ?auto_282357 ?auto_282358 ) ) ( not ( = ?auto_282357 ?auto_282359 ) ) ( not ( = ?auto_282357 ?auto_282360 ) ) ( not ( = ?auto_282357 ?auto_282361 ) ) ( not ( = ?auto_282357 ?auto_282362 ) ) ( not ( = ?auto_282357 ?auto_282363 ) ) ( not ( = ?auto_282357 ?auto_282364 ) ) ( not ( = ?auto_282357 ?auto_282365 ) ) ( not ( = ?auto_282358 ?auto_282359 ) ) ( not ( = ?auto_282358 ?auto_282360 ) ) ( not ( = ?auto_282358 ?auto_282361 ) ) ( not ( = ?auto_282358 ?auto_282362 ) ) ( not ( = ?auto_282358 ?auto_282363 ) ) ( not ( = ?auto_282358 ?auto_282364 ) ) ( not ( = ?auto_282358 ?auto_282365 ) ) ( not ( = ?auto_282359 ?auto_282360 ) ) ( not ( = ?auto_282359 ?auto_282361 ) ) ( not ( = ?auto_282359 ?auto_282362 ) ) ( not ( = ?auto_282359 ?auto_282363 ) ) ( not ( = ?auto_282359 ?auto_282364 ) ) ( not ( = ?auto_282359 ?auto_282365 ) ) ( not ( = ?auto_282360 ?auto_282361 ) ) ( not ( = ?auto_282360 ?auto_282362 ) ) ( not ( = ?auto_282360 ?auto_282363 ) ) ( not ( = ?auto_282360 ?auto_282364 ) ) ( not ( = ?auto_282360 ?auto_282365 ) ) ( not ( = ?auto_282361 ?auto_282362 ) ) ( not ( = ?auto_282361 ?auto_282363 ) ) ( not ( = ?auto_282361 ?auto_282364 ) ) ( not ( = ?auto_282361 ?auto_282365 ) ) ( not ( = ?auto_282362 ?auto_282363 ) ) ( not ( = ?auto_282362 ?auto_282364 ) ) ( not ( = ?auto_282362 ?auto_282365 ) ) ( not ( = ?auto_282363 ?auto_282364 ) ) ( not ( = ?auto_282363 ?auto_282365 ) ) ( not ( = ?auto_282364 ?auto_282365 ) ) ( ON ?auto_282363 ?auto_282364 ) ( ON ?auto_282362 ?auto_282363 ) ( ON ?auto_282361 ?auto_282362 ) ( ON ?auto_282360 ?auto_282361 ) ( ON ?auto_282359 ?auto_282360 ) ( ON ?auto_282358 ?auto_282359 ) ( CLEAR ?auto_282356 ) ( ON ?auto_282357 ?auto_282358 ) ( CLEAR ?auto_282357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_282352 ?auto_282353 ?auto_282354 ?auto_282355 ?auto_282356 ?auto_282357 )
      ( MAKE-13PILE ?auto_282352 ?auto_282353 ?auto_282354 ?auto_282355 ?auto_282356 ?auto_282357 ?auto_282358 ?auto_282359 ?auto_282360 ?auto_282361 ?auto_282362 ?auto_282363 ?auto_282364 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282379 - BLOCK
      ?auto_282380 - BLOCK
      ?auto_282381 - BLOCK
      ?auto_282382 - BLOCK
      ?auto_282383 - BLOCK
      ?auto_282384 - BLOCK
      ?auto_282385 - BLOCK
      ?auto_282386 - BLOCK
      ?auto_282387 - BLOCK
      ?auto_282388 - BLOCK
      ?auto_282389 - BLOCK
      ?auto_282390 - BLOCK
      ?auto_282391 - BLOCK
    )
    :vars
    (
      ?auto_282392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282391 ?auto_282392 ) ( ON-TABLE ?auto_282379 ) ( ON ?auto_282380 ?auto_282379 ) ( ON ?auto_282381 ?auto_282380 ) ( ON ?auto_282382 ?auto_282381 ) ( ON ?auto_282383 ?auto_282382 ) ( not ( = ?auto_282379 ?auto_282380 ) ) ( not ( = ?auto_282379 ?auto_282381 ) ) ( not ( = ?auto_282379 ?auto_282382 ) ) ( not ( = ?auto_282379 ?auto_282383 ) ) ( not ( = ?auto_282379 ?auto_282384 ) ) ( not ( = ?auto_282379 ?auto_282385 ) ) ( not ( = ?auto_282379 ?auto_282386 ) ) ( not ( = ?auto_282379 ?auto_282387 ) ) ( not ( = ?auto_282379 ?auto_282388 ) ) ( not ( = ?auto_282379 ?auto_282389 ) ) ( not ( = ?auto_282379 ?auto_282390 ) ) ( not ( = ?auto_282379 ?auto_282391 ) ) ( not ( = ?auto_282379 ?auto_282392 ) ) ( not ( = ?auto_282380 ?auto_282381 ) ) ( not ( = ?auto_282380 ?auto_282382 ) ) ( not ( = ?auto_282380 ?auto_282383 ) ) ( not ( = ?auto_282380 ?auto_282384 ) ) ( not ( = ?auto_282380 ?auto_282385 ) ) ( not ( = ?auto_282380 ?auto_282386 ) ) ( not ( = ?auto_282380 ?auto_282387 ) ) ( not ( = ?auto_282380 ?auto_282388 ) ) ( not ( = ?auto_282380 ?auto_282389 ) ) ( not ( = ?auto_282380 ?auto_282390 ) ) ( not ( = ?auto_282380 ?auto_282391 ) ) ( not ( = ?auto_282380 ?auto_282392 ) ) ( not ( = ?auto_282381 ?auto_282382 ) ) ( not ( = ?auto_282381 ?auto_282383 ) ) ( not ( = ?auto_282381 ?auto_282384 ) ) ( not ( = ?auto_282381 ?auto_282385 ) ) ( not ( = ?auto_282381 ?auto_282386 ) ) ( not ( = ?auto_282381 ?auto_282387 ) ) ( not ( = ?auto_282381 ?auto_282388 ) ) ( not ( = ?auto_282381 ?auto_282389 ) ) ( not ( = ?auto_282381 ?auto_282390 ) ) ( not ( = ?auto_282381 ?auto_282391 ) ) ( not ( = ?auto_282381 ?auto_282392 ) ) ( not ( = ?auto_282382 ?auto_282383 ) ) ( not ( = ?auto_282382 ?auto_282384 ) ) ( not ( = ?auto_282382 ?auto_282385 ) ) ( not ( = ?auto_282382 ?auto_282386 ) ) ( not ( = ?auto_282382 ?auto_282387 ) ) ( not ( = ?auto_282382 ?auto_282388 ) ) ( not ( = ?auto_282382 ?auto_282389 ) ) ( not ( = ?auto_282382 ?auto_282390 ) ) ( not ( = ?auto_282382 ?auto_282391 ) ) ( not ( = ?auto_282382 ?auto_282392 ) ) ( not ( = ?auto_282383 ?auto_282384 ) ) ( not ( = ?auto_282383 ?auto_282385 ) ) ( not ( = ?auto_282383 ?auto_282386 ) ) ( not ( = ?auto_282383 ?auto_282387 ) ) ( not ( = ?auto_282383 ?auto_282388 ) ) ( not ( = ?auto_282383 ?auto_282389 ) ) ( not ( = ?auto_282383 ?auto_282390 ) ) ( not ( = ?auto_282383 ?auto_282391 ) ) ( not ( = ?auto_282383 ?auto_282392 ) ) ( not ( = ?auto_282384 ?auto_282385 ) ) ( not ( = ?auto_282384 ?auto_282386 ) ) ( not ( = ?auto_282384 ?auto_282387 ) ) ( not ( = ?auto_282384 ?auto_282388 ) ) ( not ( = ?auto_282384 ?auto_282389 ) ) ( not ( = ?auto_282384 ?auto_282390 ) ) ( not ( = ?auto_282384 ?auto_282391 ) ) ( not ( = ?auto_282384 ?auto_282392 ) ) ( not ( = ?auto_282385 ?auto_282386 ) ) ( not ( = ?auto_282385 ?auto_282387 ) ) ( not ( = ?auto_282385 ?auto_282388 ) ) ( not ( = ?auto_282385 ?auto_282389 ) ) ( not ( = ?auto_282385 ?auto_282390 ) ) ( not ( = ?auto_282385 ?auto_282391 ) ) ( not ( = ?auto_282385 ?auto_282392 ) ) ( not ( = ?auto_282386 ?auto_282387 ) ) ( not ( = ?auto_282386 ?auto_282388 ) ) ( not ( = ?auto_282386 ?auto_282389 ) ) ( not ( = ?auto_282386 ?auto_282390 ) ) ( not ( = ?auto_282386 ?auto_282391 ) ) ( not ( = ?auto_282386 ?auto_282392 ) ) ( not ( = ?auto_282387 ?auto_282388 ) ) ( not ( = ?auto_282387 ?auto_282389 ) ) ( not ( = ?auto_282387 ?auto_282390 ) ) ( not ( = ?auto_282387 ?auto_282391 ) ) ( not ( = ?auto_282387 ?auto_282392 ) ) ( not ( = ?auto_282388 ?auto_282389 ) ) ( not ( = ?auto_282388 ?auto_282390 ) ) ( not ( = ?auto_282388 ?auto_282391 ) ) ( not ( = ?auto_282388 ?auto_282392 ) ) ( not ( = ?auto_282389 ?auto_282390 ) ) ( not ( = ?auto_282389 ?auto_282391 ) ) ( not ( = ?auto_282389 ?auto_282392 ) ) ( not ( = ?auto_282390 ?auto_282391 ) ) ( not ( = ?auto_282390 ?auto_282392 ) ) ( not ( = ?auto_282391 ?auto_282392 ) ) ( ON ?auto_282390 ?auto_282391 ) ( ON ?auto_282389 ?auto_282390 ) ( ON ?auto_282388 ?auto_282389 ) ( ON ?auto_282387 ?auto_282388 ) ( ON ?auto_282386 ?auto_282387 ) ( ON ?auto_282385 ?auto_282386 ) ( CLEAR ?auto_282383 ) ( ON ?auto_282384 ?auto_282385 ) ( CLEAR ?auto_282384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_282379 ?auto_282380 ?auto_282381 ?auto_282382 ?auto_282383 ?auto_282384 )
      ( MAKE-13PILE ?auto_282379 ?auto_282380 ?auto_282381 ?auto_282382 ?auto_282383 ?auto_282384 ?auto_282385 ?auto_282386 ?auto_282387 ?auto_282388 ?auto_282389 ?auto_282390 ?auto_282391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282406 - BLOCK
      ?auto_282407 - BLOCK
      ?auto_282408 - BLOCK
      ?auto_282409 - BLOCK
      ?auto_282410 - BLOCK
      ?auto_282411 - BLOCK
      ?auto_282412 - BLOCK
      ?auto_282413 - BLOCK
      ?auto_282414 - BLOCK
      ?auto_282415 - BLOCK
      ?auto_282416 - BLOCK
      ?auto_282417 - BLOCK
      ?auto_282418 - BLOCK
    )
    :vars
    (
      ?auto_282419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282418 ?auto_282419 ) ( ON-TABLE ?auto_282406 ) ( ON ?auto_282407 ?auto_282406 ) ( ON ?auto_282408 ?auto_282407 ) ( ON ?auto_282409 ?auto_282408 ) ( not ( = ?auto_282406 ?auto_282407 ) ) ( not ( = ?auto_282406 ?auto_282408 ) ) ( not ( = ?auto_282406 ?auto_282409 ) ) ( not ( = ?auto_282406 ?auto_282410 ) ) ( not ( = ?auto_282406 ?auto_282411 ) ) ( not ( = ?auto_282406 ?auto_282412 ) ) ( not ( = ?auto_282406 ?auto_282413 ) ) ( not ( = ?auto_282406 ?auto_282414 ) ) ( not ( = ?auto_282406 ?auto_282415 ) ) ( not ( = ?auto_282406 ?auto_282416 ) ) ( not ( = ?auto_282406 ?auto_282417 ) ) ( not ( = ?auto_282406 ?auto_282418 ) ) ( not ( = ?auto_282406 ?auto_282419 ) ) ( not ( = ?auto_282407 ?auto_282408 ) ) ( not ( = ?auto_282407 ?auto_282409 ) ) ( not ( = ?auto_282407 ?auto_282410 ) ) ( not ( = ?auto_282407 ?auto_282411 ) ) ( not ( = ?auto_282407 ?auto_282412 ) ) ( not ( = ?auto_282407 ?auto_282413 ) ) ( not ( = ?auto_282407 ?auto_282414 ) ) ( not ( = ?auto_282407 ?auto_282415 ) ) ( not ( = ?auto_282407 ?auto_282416 ) ) ( not ( = ?auto_282407 ?auto_282417 ) ) ( not ( = ?auto_282407 ?auto_282418 ) ) ( not ( = ?auto_282407 ?auto_282419 ) ) ( not ( = ?auto_282408 ?auto_282409 ) ) ( not ( = ?auto_282408 ?auto_282410 ) ) ( not ( = ?auto_282408 ?auto_282411 ) ) ( not ( = ?auto_282408 ?auto_282412 ) ) ( not ( = ?auto_282408 ?auto_282413 ) ) ( not ( = ?auto_282408 ?auto_282414 ) ) ( not ( = ?auto_282408 ?auto_282415 ) ) ( not ( = ?auto_282408 ?auto_282416 ) ) ( not ( = ?auto_282408 ?auto_282417 ) ) ( not ( = ?auto_282408 ?auto_282418 ) ) ( not ( = ?auto_282408 ?auto_282419 ) ) ( not ( = ?auto_282409 ?auto_282410 ) ) ( not ( = ?auto_282409 ?auto_282411 ) ) ( not ( = ?auto_282409 ?auto_282412 ) ) ( not ( = ?auto_282409 ?auto_282413 ) ) ( not ( = ?auto_282409 ?auto_282414 ) ) ( not ( = ?auto_282409 ?auto_282415 ) ) ( not ( = ?auto_282409 ?auto_282416 ) ) ( not ( = ?auto_282409 ?auto_282417 ) ) ( not ( = ?auto_282409 ?auto_282418 ) ) ( not ( = ?auto_282409 ?auto_282419 ) ) ( not ( = ?auto_282410 ?auto_282411 ) ) ( not ( = ?auto_282410 ?auto_282412 ) ) ( not ( = ?auto_282410 ?auto_282413 ) ) ( not ( = ?auto_282410 ?auto_282414 ) ) ( not ( = ?auto_282410 ?auto_282415 ) ) ( not ( = ?auto_282410 ?auto_282416 ) ) ( not ( = ?auto_282410 ?auto_282417 ) ) ( not ( = ?auto_282410 ?auto_282418 ) ) ( not ( = ?auto_282410 ?auto_282419 ) ) ( not ( = ?auto_282411 ?auto_282412 ) ) ( not ( = ?auto_282411 ?auto_282413 ) ) ( not ( = ?auto_282411 ?auto_282414 ) ) ( not ( = ?auto_282411 ?auto_282415 ) ) ( not ( = ?auto_282411 ?auto_282416 ) ) ( not ( = ?auto_282411 ?auto_282417 ) ) ( not ( = ?auto_282411 ?auto_282418 ) ) ( not ( = ?auto_282411 ?auto_282419 ) ) ( not ( = ?auto_282412 ?auto_282413 ) ) ( not ( = ?auto_282412 ?auto_282414 ) ) ( not ( = ?auto_282412 ?auto_282415 ) ) ( not ( = ?auto_282412 ?auto_282416 ) ) ( not ( = ?auto_282412 ?auto_282417 ) ) ( not ( = ?auto_282412 ?auto_282418 ) ) ( not ( = ?auto_282412 ?auto_282419 ) ) ( not ( = ?auto_282413 ?auto_282414 ) ) ( not ( = ?auto_282413 ?auto_282415 ) ) ( not ( = ?auto_282413 ?auto_282416 ) ) ( not ( = ?auto_282413 ?auto_282417 ) ) ( not ( = ?auto_282413 ?auto_282418 ) ) ( not ( = ?auto_282413 ?auto_282419 ) ) ( not ( = ?auto_282414 ?auto_282415 ) ) ( not ( = ?auto_282414 ?auto_282416 ) ) ( not ( = ?auto_282414 ?auto_282417 ) ) ( not ( = ?auto_282414 ?auto_282418 ) ) ( not ( = ?auto_282414 ?auto_282419 ) ) ( not ( = ?auto_282415 ?auto_282416 ) ) ( not ( = ?auto_282415 ?auto_282417 ) ) ( not ( = ?auto_282415 ?auto_282418 ) ) ( not ( = ?auto_282415 ?auto_282419 ) ) ( not ( = ?auto_282416 ?auto_282417 ) ) ( not ( = ?auto_282416 ?auto_282418 ) ) ( not ( = ?auto_282416 ?auto_282419 ) ) ( not ( = ?auto_282417 ?auto_282418 ) ) ( not ( = ?auto_282417 ?auto_282419 ) ) ( not ( = ?auto_282418 ?auto_282419 ) ) ( ON ?auto_282417 ?auto_282418 ) ( ON ?auto_282416 ?auto_282417 ) ( ON ?auto_282415 ?auto_282416 ) ( ON ?auto_282414 ?auto_282415 ) ( ON ?auto_282413 ?auto_282414 ) ( ON ?auto_282412 ?auto_282413 ) ( ON ?auto_282411 ?auto_282412 ) ( CLEAR ?auto_282409 ) ( ON ?auto_282410 ?auto_282411 ) ( CLEAR ?auto_282410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_282406 ?auto_282407 ?auto_282408 ?auto_282409 ?auto_282410 )
      ( MAKE-13PILE ?auto_282406 ?auto_282407 ?auto_282408 ?auto_282409 ?auto_282410 ?auto_282411 ?auto_282412 ?auto_282413 ?auto_282414 ?auto_282415 ?auto_282416 ?auto_282417 ?auto_282418 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282433 - BLOCK
      ?auto_282434 - BLOCK
      ?auto_282435 - BLOCK
      ?auto_282436 - BLOCK
      ?auto_282437 - BLOCK
      ?auto_282438 - BLOCK
      ?auto_282439 - BLOCK
      ?auto_282440 - BLOCK
      ?auto_282441 - BLOCK
      ?auto_282442 - BLOCK
      ?auto_282443 - BLOCK
      ?auto_282444 - BLOCK
      ?auto_282445 - BLOCK
    )
    :vars
    (
      ?auto_282446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282445 ?auto_282446 ) ( ON-TABLE ?auto_282433 ) ( ON ?auto_282434 ?auto_282433 ) ( ON ?auto_282435 ?auto_282434 ) ( ON ?auto_282436 ?auto_282435 ) ( not ( = ?auto_282433 ?auto_282434 ) ) ( not ( = ?auto_282433 ?auto_282435 ) ) ( not ( = ?auto_282433 ?auto_282436 ) ) ( not ( = ?auto_282433 ?auto_282437 ) ) ( not ( = ?auto_282433 ?auto_282438 ) ) ( not ( = ?auto_282433 ?auto_282439 ) ) ( not ( = ?auto_282433 ?auto_282440 ) ) ( not ( = ?auto_282433 ?auto_282441 ) ) ( not ( = ?auto_282433 ?auto_282442 ) ) ( not ( = ?auto_282433 ?auto_282443 ) ) ( not ( = ?auto_282433 ?auto_282444 ) ) ( not ( = ?auto_282433 ?auto_282445 ) ) ( not ( = ?auto_282433 ?auto_282446 ) ) ( not ( = ?auto_282434 ?auto_282435 ) ) ( not ( = ?auto_282434 ?auto_282436 ) ) ( not ( = ?auto_282434 ?auto_282437 ) ) ( not ( = ?auto_282434 ?auto_282438 ) ) ( not ( = ?auto_282434 ?auto_282439 ) ) ( not ( = ?auto_282434 ?auto_282440 ) ) ( not ( = ?auto_282434 ?auto_282441 ) ) ( not ( = ?auto_282434 ?auto_282442 ) ) ( not ( = ?auto_282434 ?auto_282443 ) ) ( not ( = ?auto_282434 ?auto_282444 ) ) ( not ( = ?auto_282434 ?auto_282445 ) ) ( not ( = ?auto_282434 ?auto_282446 ) ) ( not ( = ?auto_282435 ?auto_282436 ) ) ( not ( = ?auto_282435 ?auto_282437 ) ) ( not ( = ?auto_282435 ?auto_282438 ) ) ( not ( = ?auto_282435 ?auto_282439 ) ) ( not ( = ?auto_282435 ?auto_282440 ) ) ( not ( = ?auto_282435 ?auto_282441 ) ) ( not ( = ?auto_282435 ?auto_282442 ) ) ( not ( = ?auto_282435 ?auto_282443 ) ) ( not ( = ?auto_282435 ?auto_282444 ) ) ( not ( = ?auto_282435 ?auto_282445 ) ) ( not ( = ?auto_282435 ?auto_282446 ) ) ( not ( = ?auto_282436 ?auto_282437 ) ) ( not ( = ?auto_282436 ?auto_282438 ) ) ( not ( = ?auto_282436 ?auto_282439 ) ) ( not ( = ?auto_282436 ?auto_282440 ) ) ( not ( = ?auto_282436 ?auto_282441 ) ) ( not ( = ?auto_282436 ?auto_282442 ) ) ( not ( = ?auto_282436 ?auto_282443 ) ) ( not ( = ?auto_282436 ?auto_282444 ) ) ( not ( = ?auto_282436 ?auto_282445 ) ) ( not ( = ?auto_282436 ?auto_282446 ) ) ( not ( = ?auto_282437 ?auto_282438 ) ) ( not ( = ?auto_282437 ?auto_282439 ) ) ( not ( = ?auto_282437 ?auto_282440 ) ) ( not ( = ?auto_282437 ?auto_282441 ) ) ( not ( = ?auto_282437 ?auto_282442 ) ) ( not ( = ?auto_282437 ?auto_282443 ) ) ( not ( = ?auto_282437 ?auto_282444 ) ) ( not ( = ?auto_282437 ?auto_282445 ) ) ( not ( = ?auto_282437 ?auto_282446 ) ) ( not ( = ?auto_282438 ?auto_282439 ) ) ( not ( = ?auto_282438 ?auto_282440 ) ) ( not ( = ?auto_282438 ?auto_282441 ) ) ( not ( = ?auto_282438 ?auto_282442 ) ) ( not ( = ?auto_282438 ?auto_282443 ) ) ( not ( = ?auto_282438 ?auto_282444 ) ) ( not ( = ?auto_282438 ?auto_282445 ) ) ( not ( = ?auto_282438 ?auto_282446 ) ) ( not ( = ?auto_282439 ?auto_282440 ) ) ( not ( = ?auto_282439 ?auto_282441 ) ) ( not ( = ?auto_282439 ?auto_282442 ) ) ( not ( = ?auto_282439 ?auto_282443 ) ) ( not ( = ?auto_282439 ?auto_282444 ) ) ( not ( = ?auto_282439 ?auto_282445 ) ) ( not ( = ?auto_282439 ?auto_282446 ) ) ( not ( = ?auto_282440 ?auto_282441 ) ) ( not ( = ?auto_282440 ?auto_282442 ) ) ( not ( = ?auto_282440 ?auto_282443 ) ) ( not ( = ?auto_282440 ?auto_282444 ) ) ( not ( = ?auto_282440 ?auto_282445 ) ) ( not ( = ?auto_282440 ?auto_282446 ) ) ( not ( = ?auto_282441 ?auto_282442 ) ) ( not ( = ?auto_282441 ?auto_282443 ) ) ( not ( = ?auto_282441 ?auto_282444 ) ) ( not ( = ?auto_282441 ?auto_282445 ) ) ( not ( = ?auto_282441 ?auto_282446 ) ) ( not ( = ?auto_282442 ?auto_282443 ) ) ( not ( = ?auto_282442 ?auto_282444 ) ) ( not ( = ?auto_282442 ?auto_282445 ) ) ( not ( = ?auto_282442 ?auto_282446 ) ) ( not ( = ?auto_282443 ?auto_282444 ) ) ( not ( = ?auto_282443 ?auto_282445 ) ) ( not ( = ?auto_282443 ?auto_282446 ) ) ( not ( = ?auto_282444 ?auto_282445 ) ) ( not ( = ?auto_282444 ?auto_282446 ) ) ( not ( = ?auto_282445 ?auto_282446 ) ) ( ON ?auto_282444 ?auto_282445 ) ( ON ?auto_282443 ?auto_282444 ) ( ON ?auto_282442 ?auto_282443 ) ( ON ?auto_282441 ?auto_282442 ) ( ON ?auto_282440 ?auto_282441 ) ( ON ?auto_282439 ?auto_282440 ) ( ON ?auto_282438 ?auto_282439 ) ( CLEAR ?auto_282436 ) ( ON ?auto_282437 ?auto_282438 ) ( CLEAR ?auto_282437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_282433 ?auto_282434 ?auto_282435 ?auto_282436 ?auto_282437 )
      ( MAKE-13PILE ?auto_282433 ?auto_282434 ?auto_282435 ?auto_282436 ?auto_282437 ?auto_282438 ?auto_282439 ?auto_282440 ?auto_282441 ?auto_282442 ?auto_282443 ?auto_282444 ?auto_282445 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282460 - BLOCK
      ?auto_282461 - BLOCK
      ?auto_282462 - BLOCK
      ?auto_282463 - BLOCK
      ?auto_282464 - BLOCK
      ?auto_282465 - BLOCK
      ?auto_282466 - BLOCK
      ?auto_282467 - BLOCK
      ?auto_282468 - BLOCK
      ?auto_282469 - BLOCK
      ?auto_282470 - BLOCK
      ?auto_282471 - BLOCK
      ?auto_282472 - BLOCK
    )
    :vars
    (
      ?auto_282473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282472 ?auto_282473 ) ( ON-TABLE ?auto_282460 ) ( ON ?auto_282461 ?auto_282460 ) ( ON ?auto_282462 ?auto_282461 ) ( not ( = ?auto_282460 ?auto_282461 ) ) ( not ( = ?auto_282460 ?auto_282462 ) ) ( not ( = ?auto_282460 ?auto_282463 ) ) ( not ( = ?auto_282460 ?auto_282464 ) ) ( not ( = ?auto_282460 ?auto_282465 ) ) ( not ( = ?auto_282460 ?auto_282466 ) ) ( not ( = ?auto_282460 ?auto_282467 ) ) ( not ( = ?auto_282460 ?auto_282468 ) ) ( not ( = ?auto_282460 ?auto_282469 ) ) ( not ( = ?auto_282460 ?auto_282470 ) ) ( not ( = ?auto_282460 ?auto_282471 ) ) ( not ( = ?auto_282460 ?auto_282472 ) ) ( not ( = ?auto_282460 ?auto_282473 ) ) ( not ( = ?auto_282461 ?auto_282462 ) ) ( not ( = ?auto_282461 ?auto_282463 ) ) ( not ( = ?auto_282461 ?auto_282464 ) ) ( not ( = ?auto_282461 ?auto_282465 ) ) ( not ( = ?auto_282461 ?auto_282466 ) ) ( not ( = ?auto_282461 ?auto_282467 ) ) ( not ( = ?auto_282461 ?auto_282468 ) ) ( not ( = ?auto_282461 ?auto_282469 ) ) ( not ( = ?auto_282461 ?auto_282470 ) ) ( not ( = ?auto_282461 ?auto_282471 ) ) ( not ( = ?auto_282461 ?auto_282472 ) ) ( not ( = ?auto_282461 ?auto_282473 ) ) ( not ( = ?auto_282462 ?auto_282463 ) ) ( not ( = ?auto_282462 ?auto_282464 ) ) ( not ( = ?auto_282462 ?auto_282465 ) ) ( not ( = ?auto_282462 ?auto_282466 ) ) ( not ( = ?auto_282462 ?auto_282467 ) ) ( not ( = ?auto_282462 ?auto_282468 ) ) ( not ( = ?auto_282462 ?auto_282469 ) ) ( not ( = ?auto_282462 ?auto_282470 ) ) ( not ( = ?auto_282462 ?auto_282471 ) ) ( not ( = ?auto_282462 ?auto_282472 ) ) ( not ( = ?auto_282462 ?auto_282473 ) ) ( not ( = ?auto_282463 ?auto_282464 ) ) ( not ( = ?auto_282463 ?auto_282465 ) ) ( not ( = ?auto_282463 ?auto_282466 ) ) ( not ( = ?auto_282463 ?auto_282467 ) ) ( not ( = ?auto_282463 ?auto_282468 ) ) ( not ( = ?auto_282463 ?auto_282469 ) ) ( not ( = ?auto_282463 ?auto_282470 ) ) ( not ( = ?auto_282463 ?auto_282471 ) ) ( not ( = ?auto_282463 ?auto_282472 ) ) ( not ( = ?auto_282463 ?auto_282473 ) ) ( not ( = ?auto_282464 ?auto_282465 ) ) ( not ( = ?auto_282464 ?auto_282466 ) ) ( not ( = ?auto_282464 ?auto_282467 ) ) ( not ( = ?auto_282464 ?auto_282468 ) ) ( not ( = ?auto_282464 ?auto_282469 ) ) ( not ( = ?auto_282464 ?auto_282470 ) ) ( not ( = ?auto_282464 ?auto_282471 ) ) ( not ( = ?auto_282464 ?auto_282472 ) ) ( not ( = ?auto_282464 ?auto_282473 ) ) ( not ( = ?auto_282465 ?auto_282466 ) ) ( not ( = ?auto_282465 ?auto_282467 ) ) ( not ( = ?auto_282465 ?auto_282468 ) ) ( not ( = ?auto_282465 ?auto_282469 ) ) ( not ( = ?auto_282465 ?auto_282470 ) ) ( not ( = ?auto_282465 ?auto_282471 ) ) ( not ( = ?auto_282465 ?auto_282472 ) ) ( not ( = ?auto_282465 ?auto_282473 ) ) ( not ( = ?auto_282466 ?auto_282467 ) ) ( not ( = ?auto_282466 ?auto_282468 ) ) ( not ( = ?auto_282466 ?auto_282469 ) ) ( not ( = ?auto_282466 ?auto_282470 ) ) ( not ( = ?auto_282466 ?auto_282471 ) ) ( not ( = ?auto_282466 ?auto_282472 ) ) ( not ( = ?auto_282466 ?auto_282473 ) ) ( not ( = ?auto_282467 ?auto_282468 ) ) ( not ( = ?auto_282467 ?auto_282469 ) ) ( not ( = ?auto_282467 ?auto_282470 ) ) ( not ( = ?auto_282467 ?auto_282471 ) ) ( not ( = ?auto_282467 ?auto_282472 ) ) ( not ( = ?auto_282467 ?auto_282473 ) ) ( not ( = ?auto_282468 ?auto_282469 ) ) ( not ( = ?auto_282468 ?auto_282470 ) ) ( not ( = ?auto_282468 ?auto_282471 ) ) ( not ( = ?auto_282468 ?auto_282472 ) ) ( not ( = ?auto_282468 ?auto_282473 ) ) ( not ( = ?auto_282469 ?auto_282470 ) ) ( not ( = ?auto_282469 ?auto_282471 ) ) ( not ( = ?auto_282469 ?auto_282472 ) ) ( not ( = ?auto_282469 ?auto_282473 ) ) ( not ( = ?auto_282470 ?auto_282471 ) ) ( not ( = ?auto_282470 ?auto_282472 ) ) ( not ( = ?auto_282470 ?auto_282473 ) ) ( not ( = ?auto_282471 ?auto_282472 ) ) ( not ( = ?auto_282471 ?auto_282473 ) ) ( not ( = ?auto_282472 ?auto_282473 ) ) ( ON ?auto_282471 ?auto_282472 ) ( ON ?auto_282470 ?auto_282471 ) ( ON ?auto_282469 ?auto_282470 ) ( ON ?auto_282468 ?auto_282469 ) ( ON ?auto_282467 ?auto_282468 ) ( ON ?auto_282466 ?auto_282467 ) ( ON ?auto_282465 ?auto_282466 ) ( ON ?auto_282464 ?auto_282465 ) ( CLEAR ?auto_282462 ) ( ON ?auto_282463 ?auto_282464 ) ( CLEAR ?auto_282463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_282460 ?auto_282461 ?auto_282462 ?auto_282463 )
      ( MAKE-13PILE ?auto_282460 ?auto_282461 ?auto_282462 ?auto_282463 ?auto_282464 ?auto_282465 ?auto_282466 ?auto_282467 ?auto_282468 ?auto_282469 ?auto_282470 ?auto_282471 ?auto_282472 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282487 - BLOCK
      ?auto_282488 - BLOCK
      ?auto_282489 - BLOCK
      ?auto_282490 - BLOCK
      ?auto_282491 - BLOCK
      ?auto_282492 - BLOCK
      ?auto_282493 - BLOCK
      ?auto_282494 - BLOCK
      ?auto_282495 - BLOCK
      ?auto_282496 - BLOCK
      ?auto_282497 - BLOCK
      ?auto_282498 - BLOCK
      ?auto_282499 - BLOCK
    )
    :vars
    (
      ?auto_282500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282499 ?auto_282500 ) ( ON-TABLE ?auto_282487 ) ( ON ?auto_282488 ?auto_282487 ) ( ON ?auto_282489 ?auto_282488 ) ( not ( = ?auto_282487 ?auto_282488 ) ) ( not ( = ?auto_282487 ?auto_282489 ) ) ( not ( = ?auto_282487 ?auto_282490 ) ) ( not ( = ?auto_282487 ?auto_282491 ) ) ( not ( = ?auto_282487 ?auto_282492 ) ) ( not ( = ?auto_282487 ?auto_282493 ) ) ( not ( = ?auto_282487 ?auto_282494 ) ) ( not ( = ?auto_282487 ?auto_282495 ) ) ( not ( = ?auto_282487 ?auto_282496 ) ) ( not ( = ?auto_282487 ?auto_282497 ) ) ( not ( = ?auto_282487 ?auto_282498 ) ) ( not ( = ?auto_282487 ?auto_282499 ) ) ( not ( = ?auto_282487 ?auto_282500 ) ) ( not ( = ?auto_282488 ?auto_282489 ) ) ( not ( = ?auto_282488 ?auto_282490 ) ) ( not ( = ?auto_282488 ?auto_282491 ) ) ( not ( = ?auto_282488 ?auto_282492 ) ) ( not ( = ?auto_282488 ?auto_282493 ) ) ( not ( = ?auto_282488 ?auto_282494 ) ) ( not ( = ?auto_282488 ?auto_282495 ) ) ( not ( = ?auto_282488 ?auto_282496 ) ) ( not ( = ?auto_282488 ?auto_282497 ) ) ( not ( = ?auto_282488 ?auto_282498 ) ) ( not ( = ?auto_282488 ?auto_282499 ) ) ( not ( = ?auto_282488 ?auto_282500 ) ) ( not ( = ?auto_282489 ?auto_282490 ) ) ( not ( = ?auto_282489 ?auto_282491 ) ) ( not ( = ?auto_282489 ?auto_282492 ) ) ( not ( = ?auto_282489 ?auto_282493 ) ) ( not ( = ?auto_282489 ?auto_282494 ) ) ( not ( = ?auto_282489 ?auto_282495 ) ) ( not ( = ?auto_282489 ?auto_282496 ) ) ( not ( = ?auto_282489 ?auto_282497 ) ) ( not ( = ?auto_282489 ?auto_282498 ) ) ( not ( = ?auto_282489 ?auto_282499 ) ) ( not ( = ?auto_282489 ?auto_282500 ) ) ( not ( = ?auto_282490 ?auto_282491 ) ) ( not ( = ?auto_282490 ?auto_282492 ) ) ( not ( = ?auto_282490 ?auto_282493 ) ) ( not ( = ?auto_282490 ?auto_282494 ) ) ( not ( = ?auto_282490 ?auto_282495 ) ) ( not ( = ?auto_282490 ?auto_282496 ) ) ( not ( = ?auto_282490 ?auto_282497 ) ) ( not ( = ?auto_282490 ?auto_282498 ) ) ( not ( = ?auto_282490 ?auto_282499 ) ) ( not ( = ?auto_282490 ?auto_282500 ) ) ( not ( = ?auto_282491 ?auto_282492 ) ) ( not ( = ?auto_282491 ?auto_282493 ) ) ( not ( = ?auto_282491 ?auto_282494 ) ) ( not ( = ?auto_282491 ?auto_282495 ) ) ( not ( = ?auto_282491 ?auto_282496 ) ) ( not ( = ?auto_282491 ?auto_282497 ) ) ( not ( = ?auto_282491 ?auto_282498 ) ) ( not ( = ?auto_282491 ?auto_282499 ) ) ( not ( = ?auto_282491 ?auto_282500 ) ) ( not ( = ?auto_282492 ?auto_282493 ) ) ( not ( = ?auto_282492 ?auto_282494 ) ) ( not ( = ?auto_282492 ?auto_282495 ) ) ( not ( = ?auto_282492 ?auto_282496 ) ) ( not ( = ?auto_282492 ?auto_282497 ) ) ( not ( = ?auto_282492 ?auto_282498 ) ) ( not ( = ?auto_282492 ?auto_282499 ) ) ( not ( = ?auto_282492 ?auto_282500 ) ) ( not ( = ?auto_282493 ?auto_282494 ) ) ( not ( = ?auto_282493 ?auto_282495 ) ) ( not ( = ?auto_282493 ?auto_282496 ) ) ( not ( = ?auto_282493 ?auto_282497 ) ) ( not ( = ?auto_282493 ?auto_282498 ) ) ( not ( = ?auto_282493 ?auto_282499 ) ) ( not ( = ?auto_282493 ?auto_282500 ) ) ( not ( = ?auto_282494 ?auto_282495 ) ) ( not ( = ?auto_282494 ?auto_282496 ) ) ( not ( = ?auto_282494 ?auto_282497 ) ) ( not ( = ?auto_282494 ?auto_282498 ) ) ( not ( = ?auto_282494 ?auto_282499 ) ) ( not ( = ?auto_282494 ?auto_282500 ) ) ( not ( = ?auto_282495 ?auto_282496 ) ) ( not ( = ?auto_282495 ?auto_282497 ) ) ( not ( = ?auto_282495 ?auto_282498 ) ) ( not ( = ?auto_282495 ?auto_282499 ) ) ( not ( = ?auto_282495 ?auto_282500 ) ) ( not ( = ?auto_282496 ?auto_282497 ) ) ( not ( = ?auto_282496 ?auto_282498 ) ) ( not ( = ?auto_282496 ?auto_282499 ) ) ( not ( = ?auto_282496 ?auto_282500 ) ) ( not ( = ?auto_282497 ?auto_282498 ) ) ( not ( = ?auto_282497 ?auto_282499 ) ) ( not ( = ?auto_282497 ?auto_282500 ) ) ( not ( = ?auto_282498 ?auto_282499 ) ) ( not ( = ?auto_282498 ?auto_282500 ) ) ( not ( = ?auto_282499 ?auto_282500 ) ) ( ON ?auto_282498 ?auto_282499 ) ( ON ?auto_282497 ?auto_282498 ) ( ON ?auto_282496 ?auto_282497 ) ( ON ?auto_282495 ?auto_282496 ) ( ON ?auto_282494 ?auto_282495 ) ( ON ?auto_282493 ?auto_282494 ) ( ON ?auto_282492 ?auto_282493 ) ( ON ?auto_282491 ?auto_282492 ) ( CLEAR ?auto_282489 ) ( ON ?auto_282490 ?auto_282491 ) ( CLEAR ?auto_282490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_282487 ?auto_282488 ?auto_282489 ?auto_282490 )
      ( MAKE-13PILE ?auto_282487 ?auto_282488 ?auto_282489 ?auto_282490 ?auto_282491 ?auto_282492 ?auto_282493 ?auto_282494 ?auto_282495 ?auto_282496 ?auto_282497 ?auto_282498 ?auto_282499 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282514 - BLOCK
      ?auto_282515 - BLOCK
      ?auto_282516 - BLOCK
      ?auto_282517 - BLOCK
      ?auto_282518 - BLOCK
      ?auto_282519 - BLOCK
      ?auto_282520 - BLOCK
      ?auto_282521 - BLOCK
      ?auto_282522 - BLOCK
      ?auto_282523 - BLOCK
      ?auto_282524 - BLOCK
      ?auto_282525 - BLOCK
      ?auto_282526 - BLOCK
    )
    :vars
    (
      ?auto_282527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282526 ?auto_282527 ) ( ON-TABLE ?auto_282514 ) ( ON ?auto_282515 ?auto_282514 ) ( not ( = ?auto_282514 ?auto_282515 ) ) ( not ( = ?auto_282514 ?auto_282516 ) ) ( not ( = ?auto_282514 ?auto_282517 ) ) ( not ( = ?auto_282514 ?auto_282518 ) ) ( not ( = ?auto_282514 ?auto_282519 ) ) ( not ( = ?auto_282514 ?auto_282520 ) ) ( not ( = ?auto_282514 ?auto_282521 ) ) ( not ( = ?auto_282514 ?auto_282522 ) ) ( not ( = ?auto_282514 ?auto_282523 ) ) ( not ( = ?auto_282514 ?auto_282524 ) ) ( not ( = ?auto_282514 ?auto_282525 ) ) ( not ( = ?auto_282514 ?auto_282526 ) ) ( not ( = ?auto_282514 ?auto_282527 ) ) ( not ( = ?auto_282515 ?auto_282516 ) ) ( not ( = ?auto_282515 ?auto_282517 ) ) ( not ( = ?auto_282515 ?auto_282518 ) ) ( not ( = ?auto_282515 ?auto_282519 ) ) ( not ( = ?auto_282515 ?auto_282520 ) ) ( not ( = ?auto_282515 ?auto_282521 ) ) ( not ( = ?auto_282515 ?auto_282522 ) ) ( not ( = ?auto_282515 ?auto_282523 ) ) ( not ( = ?auto_282515 ?auto_282524 ) ) ( not ( = ?auto_282515 ?auto_282525 ) ) ( not ( = ?auto_282515 ?auto_282526 ) ) ( not ( = ?auto_282515 ?auto_282527 ) ) ( not ( = ?auto_282516 ?auto_282517 ) ) ( not ( = ?auto_282516 ?auto_282518 ) ) ( not ( = ?auto_282516 ?auto_282519 ) ) ( not ( = ?auto_282516 ?auto_282520 ) ) ( not ( = ?auto_282516 ?auto_282521 ) ) ( not ( = ?auto_282516 ?auto_282522 ) ) ( not ( = ?auto_282516 ?auto_282523 ) ) ( not ( = ?auto_282516 ?auto_282524 ) ) ( not ( = ?auto_282516 ?auto_282525 ) ) ( not ( = ?auto_282516 ?auto_282526 ) ) ( not ( = ?auto_282516 ?auto_282527 ) ) ( not ( = ?auto_282517 ?auto_282518 ) ) ( not ( = ?auto_282517 ?auto_282519 ) ) ( not ( = ?auto_282517 ?auto_282520 ) ) ( not ( = ?auto_282517 ?auto_282521 ) ) ( not ( = ?auto_282517 ?auto_282522 ) ) ( not ( = ?auto_282517 ?auto_282523 ) ) ( not ( = ?auto_282517 ?auto_282524 ) ) ( not ( = ?auto_282517 ?auto_282525 ) ) ( not ( = ?auto_282517 ?auto_282526 ) ) ( not ( = ?auto_282517 ?auto_282527 ) ) ( not ( = ?auto_282518 ?auto_282519 ) ) ( not ( = ?auto_282518 ?auto_282520 ) ) ( not ( = ?auto_282518 ?auto_282521 ) ) ( not ( = ?auto_282518 ?auto_282522 ) ) ( not ( = ?auto_282518 ?auto_282523 ) ) ( not ( = ?auto_282518 ?auto_282524 ) ) ( not ( = ?auto_282518 ?auto_282525 ) ) ( not ( = ?auto_282518 ?auto_282526 ) ) ( not ( = ?auto_282518 ?auto_282527 ) ) ( not ( = ?auto_282519 ?auto_282520 ) ) ( not ( = ?auto_282519 ?auto_282521 ) ) ( not ( = ?auto_282519 ?auto_282522 ) ) ( not ( = ?auto_282519 ?auto_282523 ) ) ( not ( = ?auto_282519 ?auto_282524 ) ) ( not ( = ?auto_282519 ?auto_282525 ) ) ( not ( = ?auto_282519 ?auto_282526 ) ) ( not ( = ?auto_282519 ?auto_282527 ) ) ( not ( = ?auto_282520 ?auto_282521 ) ) ( not ( = ?auto_282520 ?auto_282522 ) ) ( not ( = ?auto_282520 ?auto_282523 ) ) ( not ( = ?auto_282520 ?auto_282524 ) ) ( not ( = ?auto_282520 ?auto_282525 ) ) ( not ( = ?auto_282520 ?auto_282526 ) ) ( not ( = ?auto_282520 ?auto_282527 ) ) ( not ( = ?auto_282521 ?auto_282522 ) ) ( not ( = ?auto_282521 ?auto_282523 ) ) ( not ( = ?auto_282521 ?auto_282524 ) ) ( not ( = ?auto_282521 ?auto_282525 ) ) ( not ( = ?auto_282521 ?auto_282526 ) ) ( not ( = ?auto_282521 ?auto_282527 ) ) ( not ( = ?auto_282522 ?auto_282523 ) ) ( not ( = ?auto_282522 ?auto_282524 ) ) ( not ( = ?auto_282522 ?auto_282525 ) ) ( not ( = ?auto_282522 ?auto_282526 ) ) ( not ( = ?auto_282522 ?auto_282527 ) ) ( not ( = ?auto_282523 ?auto_282524 ) ) ( not ( = ?auto_282523 ?auto_282525 ) ) ( not ( = ?auto_282523 ?auto_282526 ) ) ( not ( = ?auto_282523 ?auto_282527 ) ) ( not ( = ?auto_282524 ?auto_282525 ) ) ( not ( = ?auto_282524 ?auto_282526 ) ) ( not ( = ?auto_282524 ?auto_282527 ) ) ( not ( = ?auto_282525 ?auto_282526 ) ) ( not ( = ?auto_282525 ?auto_282527 ) ) ( not ( = ?auto_282526 ?auto_282527 ) ) ( ON ?auto_282525 ?auto_282526 ) ( ON ?auto_282524 ?auto_282525 ) ( ON ?auto_282523 ?auto_282524 ) ( ON ?auto_282522 ?auto_282523 ) ( ON ?auto_282521 ?auto_282522 ) ( ON ?auto_282520 ?auto_282521 ) ( ON ?auto_282519 ?auto_282520 ) ( ON ?auto_282518 ?auto_282519 ) ( ON ?auto_282517 ?auto_282518 ) ( CLEAR ?auto_282515 ) ( ON ?auto_282516 ?auto_282517 ) ( CLEAR ?auto_282516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_282514 ?auto_282515 ?auto_282516 )
      ( MAKE-13PILE ?auto_282514 ?auto_282515 ?auto_282516 ?auto_282517 ?auto_282518 ?auto_282519 ?auto_282520 ?auto_282521 ?auto_282522 ?auto_282523 ?auto_282524 ?auto_282525 ?auto_282526 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282541 - BLOCK
      ?auto_282542 - BLOCK
      ?auto_282543 - BLOCK
      ?auto_282544 - BLOCK
      ?auto_282545 - BLOCK
      ?auto_282546 - BLOCK
      ?auto_282547 - BLOCK
      ?auto_282548 - BLOCK
      ?auto_282549 - BLOCK
      ?auto_282550 - BLOCK
      ?auto_282551 - BLOCK
      ?auto_282552 - BLOCK
      ?auto_282553 - BLOCK
    )
    :vars
    (
      ?auto_282554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282553 ?auto_282554 ) ( ON-TABLE ?auto_282541 ) ( ON ?auto_282542 ?auto_282541 ) ( not ( = ?auto_282541 ?auto_282542 ) ) ( not ( = ?auto_282541 ?auto_282543 ) ) ( not ( = ?auto_282541 ?auto_282544 ) ) ( not ( = ?auto_282541 ?auto_282545 ) ) ( not ( = ?auto_282541 ?auto_282546 ) ) ( not ( = ?auto_282541 ?auto_282547 ) ) ( not ( = ?auto_282541 ?auto_282548 ) ) ( not ( = ?auto_282541 ?auto_282549 ) ) ( not ( = ?auto_282541 ?auto_282550 ) ) ( not ( = ?auto_282541 ?auto_282551 ) ) ( not ( = ?auto_282541 ?auto_282552 ) ) ( not ( = ?auto_282541 ?auto_282553 ) ) ( not ( = ?auto_282541 ?auto_282554 ) ) ( not ( = ?auto_282542 ?auto_282543 ) ) ( not ( = ?auto_282542 ?auto_282544 ) ) ( not ( = ?auto_282542 ?auto_282545 ) ) ( not ( = ?auto_282542 ?auto_282546 ) ) ( not ( = ?auto_282542 ?auto_282547 ) ) ( not ( = ?auto_282542 ?auto_282548 ) ) ( not ( = ?auto_282542 ?auto_282549 ) ) ( not ( = ?auto_282542 ?auto_282550 ) ) ( not ( = ?auto_282542 ?auto_282551 ) ) ( not ( = ?auto_282542 ?auto_282552 ) ) ( not ( = ?auto_282542 ?auto_282553 ) ) ( not ( = ?auto_282542 ?auto_282554 ) ) ( not ( = ?auto_282543 ?auto_282544 ) ) ( not ( = ?auto_282543 ?auto_282545 ) ) ( not ( = ?auto_282543 ?auto_282546 ) ) ( not ( = ?auto_282543 ?auto_282547 ) ) ( not ( = ?auto_282543 ?auto_282548 ) ) ( not ( = ?auto_282543 ?auto_282549 ) ) ( not ( = ?auto_282543 ?auto_282550 ) ) ( not ( = ?auto_282543 ?auto_282551 ) ) ( not ( = ?auto_282543 ?auto_282552 ) ) ( not ( = ?auto_282543 ?auto_282553 ) ) ( not ( = ?auto_282543 ?auto_282554 ) ) ( not ( = ?auto_282544 ?auto_282545 ) ) ( not ( = ?auto_282544 ?auto_282546 ) ) ( not ( = ?auto_282544 ?auto_282547 ) ) ( not ( = ?auto_282544 ?auto_282548 ) ) ( not ( = ?auto_282544 ?auto_282549 ) ) ( not ( = ?auto_282544 ?auto_282550 ) ) ( not ( = ?auto_282544 ?auto_282551 ) ) ( not ( = ?auto_282544 ?auto_282552 ) ) ( not ( = ?auto_282544 ?auto_282553 ) ) ( not ( = ?auto_282544 ?auto_282554 ) ) ( not ( = ?auto_282545 ?auto_282546 ) ) ( not ( = ?auto_282545 ?auto_282547 ) ) ( not ( = ?auto_282545 ?auto_282548 ) ) ( not ( = ?auto_282545 ?auto_282549 ) ) ( not ( = ?auto_282545 ?auto_282550 ) ) ( not ( = ?auto_282545 ?auto_282551 ) ) ( not ( = ?auto_282545 ?auto_282552 ) ) ( not ( = ?auto_282545 ?auto_282553 ) ) ( not ( = ?auto_282545 ?auto_282554 ) ) ( not ( = ?auto_282546 ?auto_282547 ) ) ( not ( = ?auto_282546 ?auto_282548 ) ) ( not ( = ?auto_282546 ?auto_282549 ) ) ( not ( = ?auto_282546 ?auto_282550 ) ) ( not ( = ?auto_282546 ?auto_282551 ) ) ( not ( = ?auto_282546 ?auto_282552 ) ) ( not ( = ?auto_282546 ?auto_282553 ) ) ( not ( = ?auto_282546 ?auto_282554 ) ) ( not ( = ?auto_282547 ?auto_282548 ) ) ( not ( = ?auto_282547 ?auto_282549 ) ) ( not ( = ?auto_282547 ?auto_282550 ) ) ( not ( = ?auto_282547 ?auto_282551 ) ) ( not ( = ?auto_282547 ?auto_282552 ) ) ( not ( = ?auto_282547 ?auto_282553 ) ) ( not ( = ?auto_282547 ?auto_282554 ) ) ( not ( = ?auto_282548 ?auto_282549 ) ) ( not ( = ?auto_282548 ?auto_282550 ) ) ( not ( = ?auto_282548 ?auto_282551 ) ) ( not ( = ?auto_282548 ?auto_282552 ) ) ( not ( = ?auto_282548 ?auto_282553 ) ) ( not ( = ?auto_282548 ?auto_282554 ) ) ( not ( = ?auto_282549 ?auto_282550 ) ) ( not ( = ?auto_282549 ?auto_282551 ) ) ( not ( = ?auto_282549 ?auto_282552 ) ) ( not ( = ?auto_282549 ?auto_282553 ) ) ( not ( = ?auto_282549 ?auto_282554 ) ) ( not ( = ?auto_282550 ?auto_282551 ) ) ( not ( = ?auto_282550 ?auto_282552 ) ) ( not ( = ?auto_282550 ?auto_282553 ) ) ( not ( = ?auto_282550 ?auto_282554 ) ) ( not ( = ?auto_282551 ?auto_282552 ) ) ( not ( = ?auto_282551 ?auto_282553 ) ) ( not ( = ?auto_282551 ?auto_282554 ) ) ( not ( = ?auto_282552 ?auto_282553 ) ) ( not ( = ?auto_282552 ?auto_282554 ) ) ( not ( = ?auto_282553 ?auto_282554 ) ) ( ON ?auto_282552 ?auto_282553 ) ( ON ?auto_282551 ?auto_282552 ) ( ON ?auto_282550 ?auto_282551 ) ( ON ?auto_282549 ?auto_282550 ) ( ON ?auto_282548 ?auto_282549 ) ( ON ?auto_282547 ?auto_282548 ) ( ON ?auto_282546 ?auto_282547 ) ( ON ?auto_282545 ?auto_282546 ) ( ON ?auto_282544 ?auto_282545 ) ( CLEAR ?auto_282542 ) ( ON ?auto_282543 ?auto_282544 ) ( CLEAR ?auto_282543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_282541 ?auto_282542 ?auto_282543 )
      ( MAKE-13PILE ?auto_282541 ?auto_282542 ?auto_282543 ?auto_282544 ?auto_282545 ?auto_282546 ?auto_282547 ?auto_282548 ?auto_282549 ?auto_282550 ?auto_282551 ?auto_282552 ?auto_282553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282568 - BLOCK
      ?auto_282569 - BLOCK
      ?auto_282570 - BLOCK
      ?auto_282571 - BLOCK
      ?auto_282572 - BLOCK
      ?auto_282573 - BLOCK
      ?auto_282574 - BLOCK
      ?auto_282575 - BLOCK
      ?auto_282576 - BLOCK
      ?auto_282577 - BLOCK
      ?auto_282578 - BLOCK
      ?auto_282579 - BLOCK
      ?auto_282580 - BLOCK
    )
    :vars
    (
      ?auto_282581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282580 ?auto_282581 ) ( ON-TABLE ?auto_282568 ) ( not ( = ?auto_282568 ?auto_282569 ) ) ( not ( = ?auto_282568 ?auto_282570 ) ) ( not ( = ?auto_282568 ?auto_282571 ) ) ( not ( = ?auto_282568 ?auto_282572 ) ) ( not ( = ?auto_282568 ?auto_282573 ) ) ( not ( = ?auto_282568 ?auto_282574 ) ) ( not ( = ?auto_282568 ?auto_282575 ) ) ( not ( = ?auto_282568 ?auto_282576 ) ) ( not ( = ?auto_282568 ?auto_282577 ) ) ( not ( = ?auto_282568 ?auto_282578 ) ) ( not ( = ?auto_282568 ?auto_282579 ) ) ( not ( = ?auto_282568 ?auto_282580 ) ) ( not ( = ?auto_282568 ?auto_282581 ) ) ( not ( = ?auto_282569 ?auto_282570 ) ) ( not ( = ?auto_282569 ?auto_282571 ) ) ( not ( = ?auto_282569 ?auto_282572 ) ) ( not ( = ?auto_282569 ?auto_282573 ) ) ( not ( = ?auto_282569 ?auto_282574 ) ) ( not ( = ?auto_282569 ?auto_282575 ) ) ( not ( = ?auto_282569 ?auto_282576 ) ) ( not ( = ?auto_282569 ?auto_282577 ) ) ( not ( = ?auto_282569 ?auto_282578 ) ) ( not ( = ?auto_282569 ?auto_282579 ) ) ( not ( = ?auto_282569 ?auto_282580 ) ) ( not ( = ?auto_282569 ?auto_282581 ) ) ( not ( = ?auto_282570 ?auto_282571 ) ) ( not ( = ?auto_282570 ?auto_282572 ) ) ( not ( = ?auto_282570 ?auto_282573 ) ) ( not ( = ?auto_282570 ?auto_282574 ) ) ( not ( = ?auto_282570 ?auto_282575 ) ) ( not ( = ?auto_282570 ?auto_282576 ) ) ( not ( = ?auto_282570 ?auto_282577 ) ) ( not ( = ?auto_282570 ?auto_282578 ) ) ( not ( = ?auto_282570 ?auto_282579 ) ) ( not ( = ?auto_282570 ?auto_282580 ) ) ( not ( = ?auto_282570 ?auto_282581 ) ) ( not ( = ?auto_282571 ?auto_282572 ) ) ( not ( = ?auto_282571 ?auto_282573 ) ) ( not ( = ?auto_282571 ?auto_282574 ) ) ( not ( = ?auto_282571 ?auto_282575 ) ) ( not ( = ?auto_282571 ?auto_282576 ) ) ( not ( = ?auto_282571 ?auto_282577 ) ) ( not ( = ?auto_282571 ?auto_282578 ) ) ( not ( = ?auto_282571 ?auto_282579 ) ) ( not ( = ?auto_282571 ?auto_282580 ) ) ( not ( = ?auto_282571 ?auto_282581 ) ) ( not ( = ?auto_282572 ?auto_282573 ) ) ( not ( = ?auto_282572 ?auto_282574 ) ) ( not ( = ?auto_282572 ?auto_282575 ) ) ( not ( = ?auto_282572 ?auto_282576 ) ) ( not ( = ?auto_282572 ?auto_282577 ) ) ( not ( = ?auto_282572 ?auto_282578 ) ) ( not ( = ?auto_282572 ?auto_282579 ) ) ( not ( = ?auto_282572 ?auto_282580 ) ) ( not ( = ?auto_282572 ?auto_282581 ) ) ( not ( = ?auto_282573 ?auto_282574 ) ) ( not ( = ?auto_282573 ?auto_282575 ) ) ( not ( = ?auto_282573 ?auto_282576 ) ) ( not ( = ?auto_282573 ?auto_282577 ) ) ( not ( = ?auto_282573 ?auto_282578 ) ) ( not ( = ?auto_282573 ?auto_282579 ) ) ( not ( = ?auto_282573 ?auto_282580 ) ) ( not ( = ?auto_282573 ?auto_282581 ) ) ( not ( = ?auto_282574 ?auto_282575 ) ) ( not ( = ?auto_282574 ?auto_282576 ) ) ( not ( = ?auto_282574 ?auto_282577 ) ) ( not ( = ?auto_282574 ?auto_282578 ) ) ( not ( = ?auto_282574 ?auto_282579 ) ) ( not ( = ?auto_282574 ?auto_282580 ) ) ( not ( = ?auto_282574 ?auto_282581 ) ) ( not ( = ?auto_282575 ?auto_282576 ) ) ( not ( = ?auto_282575 ?auto_282577 ) ) ( not ( = ?auto_282575 ?auto_282578 ) ) ( not ( = ?auto_282575 ?auto_282579 ) ) ( not ( = ?auto_282575 ?auto_282580 ) ) ( not ( = ?auto_282575 ?auto_282581 ) ) ( not ( = ?auto_282576 ?auto_282577 ) ) ( not ( = ?auto_282576 ?auto_282578 ) ) ( not ( = ?auto_282576 ?auto_282579 ) ) ( not ( = ?auto_282576 ?auto_282580 ) ) ( not ( = ?auto_282576 ?auto_282581 ) ) ( not ( = ?auto_282577 ?auto_282578 ) ) ( not ( = ?auto_282577 ?auto_282579 ) ) ( not ( = ?auto_282577 ?auto_282580 ) ) ( not ( = ?auto_282577 ?auto_282581 ) ) ( not ( = ?auto_282578 ?auto_282579 ) ) ( not ( = ?auto_282578 ?auto_282580 ) ) ( not ( = ?auto_282578 ?auto_282581 ) ) ( not ( = ?auto_282579 ?auto_282580 ) ) ( not ( = ?auto_282579 ?auto_282581 ) ) ( not ( = ?auto_282580 ?auto_282581 ) ) ( ON ?auto_282579 ?auto_282580 ) ( ON ?auto_282578 ?auto_282579 ) ( ON ?auto_282577 ?auto_282578 ) ( ON ?auto_282576 ?auto_282577 ) ( ON ?auto_282575 ?auto_282576 ) ( ON ?auto_282574 ?auto_282575 ) ( ON ?auto_282573 ?auto_282574 ) ( ON ?auto_282572 ?auto_282573 ) ( ON ?auto_282571 ?auto_282572 ) ( ON ?auto_282570 ?auto_282571 ) ( CLEAR ?auto_282568 ) ( ON ?auto_282569 ?auto_282570 ) ( CLEAR ?auto_282569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_282568 ?auto_282569 )
      ( MAKE-13PILE ?auto_282568 ?auto_282569 ?auto_282570 ?auto_282571 ?auto_282572 ?auto_282573 ?auto_282574 ?auto_282575 ?auto_282576 ?auto_282577 ?auto_282578 ?auto_282579 ?auto_282580 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282595 - BLOCK
      ?auto_282596 - BLOCK
      ?auto_282597 - BLOCK
      ?auto_282598 - BLOCK
      ?auto_282599 - BLOCK
      ?auto_282600 - BLOCK
      ?auto_282601 - BLOCK
      ?auto_282602 - BLOCK
      ?auto_282603 - BLOCK
      ?auto_282604 - BLOCK
      ?auto_282605 - BLOCK
      ?auto_282606 - BLOCK
      ?auto_282607 - BLOCK
    )
    :vars
    (
      ?auto_282608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282607 ?auto_282608 ) ( ON-TABLE ?auto_282595 ) ( not ( = ?auto_282595 ?auto_282596 ) ) ( not ( = ?auto_282595 ?auto_282597 ) ) ( not ( = ?auto_282595 ?auto_282598 ) ) ( not ( = ?auto_282595 ?auto_282599 ) ) ( not ( = ?auto_282595 ?auto_282600 ) ) ( not ( = ?auto_282595 ?auto_282601 ) ) ( not ( = ?auto_282595 ?auto_282602 ) ) ( not ( = ?auto_282595 ?auto_282603 ) ) ( not ( = ?auto_282595 ?auto_282604 ) ) ( not ( = ?auto_282595 ?auto_282605 ) ) ( not ( = ?auto_282595 ?auto_282606 ) ) ( not ( = ?auto_282595 ?auto_282607 ) ) ( not ( = ?auto_282595 ?auto_282608 ) ) ( not ( = ?auto_282596 ?auto_282597 ) ) ( not ( = ?auto_282596 ?auto_282598 ) ) ( not ( = ?auto_282596 ?auto_282599 ) ) ( not ( = ?auto_282596 ?auto_282600 ) ) ( not ( = ?auto_282596 ?auto_282601 ) ) ( not ( = ?auto_282596 ?auto_282602 ) ) ( not ( = ?auto_282596 ?auto_282603 ) ) ( not ( = ?auto_282596 ?auto_282604 ) ) ( not ( = ?auto_282596 ?auto_282605 ) ) ( not ( = ?auto_282596 ?auto_282606 ) ) ( not ( = ?auto_282596 ?auto_282607 ) ) ( not ( = ?auto_282596 ?auto_282608 ) ) ( not ( = ?auto_282597 ?auto_282598 ) ) ( not ( = ?auto_282597 ?auto_282599 ) ) ( not ( = ?auto_282597 ?auto_282600 ) ) ( not ( = ?auto_282597 ?auto_282601 ) ) ( not ( = ?auto_282597 ?auto_282602 ) ) ( not ( = ?auto_282597 ?auto_282603 ) ) ( not ( = ?auto_282597 ?auto_282604 ) ) ( not ( = ?auto_282597 ?auto_282605 ) ) ( not ( = ?auto_282597 ?auto_282606 ) ) ( not ( = ?auto_282597 ?auto_282607 ) ) ( not ( = ?auto_282597 ?auto_282608 ) ) ( not ( = ?auto_282598 ?auto_282599 ) ) ( not ( = ?auto_282598 ?auto_282600 ) ) ( not ( = ?auto_282598 ?auto_282601 ) ) ( not ( = ?auto_282598 ?auto_282602 ) ) ( not ( = ?auto_282598 ?auto_282603 ) ) ( not ( = ?auto_282598 ?auto_282604 ) ) ( not ( = ?auto_282598 ?auto_282605 ) ) ( not ( = ?auto_282598 ?auto_282606 ) ) ( not ( = ?auto_282598 ?auto_282607 ) ) ( not ( = ?auto_282598 ?auto_282608 ) ) ( not ( = ?auto_282599 ?auto_282600 ) ) ( not ( = ?auto_282599 ?auto_282601 ) ) ( not ( = ?auto_282599 ?auto_282602 ) ) ( not ( = ?auto_282599 ?auto_282603 ) ) ( not ( = ?auto_282599 ?auto_282604 ) ) ( not ( = ?auto_282599 ?auto_282605 ) ) ( not ( = ?auto_282599 ?auto_282606 ) ) ( not ( = ?auto_282599 ?auto_282607 ) ) ( not ( = ?auto_282599 ?auto_282608 ) ) ( not ( = ?auto_282600 ?auto_282601 ) ) ( not ( = ?auto_282600 ?auto_282602 ) ) ( not ( = ?auto_282600 ?auto_282603 ) ) ( not ( = ?auto_282600 ?auto_282604 ) ) ( not ( = ?auto_282600 ?auto_282605 ) ) ( not ( = ?auto_282600 ?auto_282606 ) ) ( not ( = ?auto_282600 ?auto_282607 ) ) ( not ( = ?auto_282600 ?auto_282608 ) ) ( not ( = ?auto_282601 ?auto_282602 ) ) ( not ( = ?auto_282601 ?auto_282603 ) ) ( not ( = ?auto_282601 ?auto_282604 ) ) ( not ( = ?auto_282601 ?auto_282605 ) ) ( not ( = ?auto_282601 ?auto_282606 ) ) ( not ( = ?auto_282601 ?auto_282607 ) ) ( not ( = ?auto_282601 ?auto_282608 ) ) ( not ( = ?auto_282602 ?auto_282603 ) ) ( not ( = ?auto_282602 ?auto_282604 ) ) ( not ( = ?auto_282602 ?auto_282605 ) ) ( not ( = ?auto_282602 ?auto_282606 ) ) ( not ( = ?auto_282602 ?auto_282607 ) ) ( not ( = ?auto_282602 ?auto_282608 ) ) ( not ( = ?auto_282603 ?auto_282604 ) ) ( not ( = ?auto_282603 ?auto_282605 ) ) ( not ( = ?auto_282603 ?auto_282606 ) ) ( not ( = ?auto_282603 ?auto_282607 ) ) ( not ( = ?auto_282603 ?auto_282608 ) ) ( not ( = ?auto_282604 ?auto_282605 ) ) ( not ( = ?auto_282604 ?auto_282606 ) ) ( not ( = ?auto_282604 ?auto_282607 ) ) ( not ( = ?auto_282604 ?auto_282608 ) ) ( not ( = ?auto_282605 ?auto_282606 ) ) ( not ( = ?auto_282605 ?auto_282607 ) ) ( not ( = ?auto_282605 ?auto_282608 ) ) ( not ( = ?auto_282606 ?auto_282607 ) ) ( not ( = ?auto_282606 ?auto_282608 ) ) ( not ( = ?auto_282607 ?auto_282608 ) ) ( ON ?auto_282606 ?auto_282607 ) ( ON ?auto_282605 ?auto_282606 ) ( ON ?auto_282604 ?auto_282605 ) ( ON ?auto_282603 ?auto_282604 ) ( ON ?auto_282602 ?auto_282603 ) ( ON ?auto_282601 ?auto_282602 ) ( ON ?auto_282600 ?auto_282601 ) ( ON ?auto_282599 ?auto_282600 ) ( ON ?auto_282598 ?auto_282599 ) ( ON ?auto_282597 ?auto_282598 ) ( CLEAR ?auto_282595 ) ( ON ?auto_282596 ?auto_282597 ) ( CLEAR ?auto_282596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_282595 ?auto_282596 )
      ( MAKE-13PILE ?auto_282595 ?auto_282596 ?auto_282597 ?auto_282598 ?auto_282599 ?auto_282600 ?auto_282601 ?auto_282602 ?auto_282603 ?auto_282604 ?auto_282605 ?auto_282606 ?auto_282607 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282622 - BLOCK
      ?auto_282623 - BLOCK
      ?auto_282624 - BLOCK
      ?auto_282625 - BLOCK
      ?auto_282626 - BLOCK
      ?auto_282627 - BLOCK
      ?auto_282628 - BLOCK
      ?auto_282629 - BLOCK
      ?auto_282630 - BLOCK
      ?auto_282631 - BLOCK
      ?auto_282632 - BLOCK
      ?auto_282633 - BLOCK
      ?auto_282634 - BLOCK
    )
    :vars
    (
      ?auto_282635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282634 ?auto_282635 ) ( not ( = ?auto_282622 ?auto_282623 ) ) ( not ( = ?auto_282622 ?auto_282624 ) ) ( not ( = ?auto_282622 ?auto_282625 ) ) ( not ( = ?auto_282622 ?auto_282626 ) ) ( not ( = ?auto_282622 ?auto_282627 ) ) ( not ( = ?auto_282622 ?auto_282628 ) ) ( not ( = ?auto_282622 ?auto_282629 ) ) ( not ( = ?auto_282622 ?auto_282630 ) ) ( not ( = ?auto_282622 ?auto_282631 ) ) ( not ( = ?auto_282622 ?auto_282632 ) ) ( not ( = ?auto_282622 ?auto_282633 ) ) ( not ( = ?auto_282622 ?auto_282634 ) ) ( not ( = ?auto_282622 ?auto_282635 ) ) ( not ( = ?auto_282623 ?auto_282624 ) ) ( not ( = ?auto_282623 ?auto_282625 ) ) ( not ( = ?auto_282623 ?auto_282626 ) ) ( not ( = ?auto_282623 ?auto_282627 ) ) ( not ( = ?auto_282623 ?auto_282628 ) ) ( not ( = ?auto_282623 ?auto_282629 ) ) ( not ( = ?auto_282623 ?auto_282630 ) ) ( not ( = ?auto_282623 ?auto_282631 ) ) ( not ( = ?auto_282623 ?auto_282632 ) ) ( not ( = ?auto_282623 ?auto_282633 ) ) ( not ( = ?auto_282623 ?auto_282634 ) ) ( not ( = ?auto_282623 ?auto_282635 ) ) ( not ( = ?auto_282624 ?auto_282625 ) ) ( not ( = ?auto_282624 ?auto_282626 ) ) ( not ( = ?auto_282624 ?auto_282627 ) ) ( not ( = ?auto_282624 ?auto_282628 ) ) ( not ( = ?auto_282624 ?auto_282629 ) ) ( not ( = ?auto_282624 ?auto_282630 ) ) ( not ( = ?auto_282624 ?auto_282631 ) ) ( not ( = ?auto_282624 ?auto_282632 ) ) ( not ( = ?auto_282624 ?auto_282633 ) ) ( not ( = ?auto_282624 ?auto_282634 ) ) ( not ( = ?auto_282624 ?auto_282635 ) ) ( not ( = ?auto_282625 ?auto_282626 ) ) ( not ( = ?auto_282625 ?auto_282627 ) ) ( not ( = ?auto_282625 ?auto_282628 ) ) ( not ( = ?auto_282625 ?auto_282629 ) ) ( not ( = ?auto_282625 ?auto_282630 ) ) ( not ( = ?auto_282625 ?auto_282631 ) ) ( not ( = ?auto_282625 ?auto_282632 ) ) ( not ( = ?auto_282625 ?auto_282633 ) ) ( not ( = ?auto_282625 ?auto_282634 ) ) ( not ( = ?auto_282625 ?auto_282635 ) ) ( not ( = ?auto_282626 ?auto_282627 ) ) ( not ( = ?auto_282626 ?auto_282628 ) ) ( not ( = ?auto_282626 ?auto_282629 ) ) ( not ( = ?auto_282626 ?auto_282630 ) ) ( not ( = ?auto_282626 ?auto_282631 ) ) ( not ( = ?auto_282626 ?auto_282632 ) ) ( not ( = ?auto_282626 ?auto_282633 ) ) ( not ( = ?auto_282626 ?auto_282634 ) ) ( not ( = ?auto_282626 ?auto_282635 ) ) ( not ( = ?auto_282627 ?auto_282628 ) ) ( not ( = ?auto_282627 ?auto_282629 ) ) ( not ( = ?auto_282627 ?auto_282630 ) ) ( not ( = ?auto_282627 ?auto_282631 ) ) ( not ( = ?auto_282627 ?auto_282632 ) ) ( not ( = ?auto_282627 ?auto_282633 ) ) ( not ( = ?auto_282627 ?auto_282634 ) ) ( not ( = ?auto_282627 ?auto_282635 ) ) ( not ( = ?auto_282628 ?auto_282629 ) ) ( not ( = ?auto_282628 ?auto_282630 ) ) ( not ( = ?auto_282628 ?auto_282631 ) ) ( not ( = ?auto_282628 ?auto_282632 ) ) ( not ( = ?auto_282628 ?auto_282633 ) ) ( not ( = ?auto_282628 ?auto_282634 ) ) ( not ( = ?auto_282628 ?auto_282635 ) ) ( not ( = ?auto_282629 ?auto_282630 ) ) ( not ( = ?auto_282629 ?auto_282631 ) ) ( not ( = ?auto_282629 ?auto_282632 ) ) ( not ( = ?auto_282629 ?auto_282633 ) ) ( not ( = ?auto_282629 ?auto_282634 ) ) ( not ( = ?auto_282629 ?auto_282635 ) ) ( not ( = ?auto_282630 ?auto_282631 ) ) ( not ( = ?auto_282630 ?auto_282632 ) ) ( not ( = ?auto_282630 ?auto_282633 ) ) ( not ( = ?auto_282630 ?auto_282634 ) ) ( not ( = ?auto_282630 ?auto_282635 ) ) ( not ( = ?auto_282631 ?auto_282632 ) ) ( not ( = ?auto_282631 ?auto_282633 ) ) ( not ( = ?auto_282631 ?auto_282634 ) ) ( not ( = ?auto_282631 ?auto_282635 ) ) ( not ( = ?auto_282632 ?auto_282633 ) ) ( not ( = ?auto_282632 ?auto_282634 ) ) ( not ( = ?auto_282632 ?auto_282635 ) ) ( not ( = ?auto_282633 ?auto_282634 ) ) ( not ( = ?auto_282633 ?auto_282635 ) ) ( not ( = ?auto_282634 ?auto_282635 ) ) ( ON ?auto_282633 ?auto_282634 ) ( ON ?auto_282632 ?auto_282633 ) ( ON ?auto_282631 ?auto_282632 ) ( ON ?auto_282630 ?auto_282631 ) ( ON ?auto_282629 ?auto_282630 ) ( ON ?auto_282628 ?auto_282629 ) ( ON ?auto_282627 ?auto_282628 ) ( ON ?auto_282626 ?auto_282627 ) ( ON ?auto_282625 ?auto_282626 ) ( ON ?auto_282624 ?auto_282625 ) ( ON ?auto_282623 ?auto_282624 ) ( ON ?auto_282622 ?auto_282623 ) ( CLEAR ?auto_282622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_282622 )
      ( MAKE-13PILE ?auto_282622 ?auto_282623 ?auto_282624 ?auto_282625 ?auto_282626 ?auto_282627 ?auto_282628 ?auto_282629 ?auto_282630 ?auto_282631 ?auto_282632 ?auto_282633 ?auto_282634 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_282649 - BLOCK
      ?auto_282650 - BLOCK
      ?auto_282651 - BLOCK
      ?auto_282652 - BLOCK
      ?auto_282653 - BLOCK
      ?auto_282654 - BLOCK
      ?auto_282655 - BLOCK
      ?auto_282656 - BLOCK
      ?auto_282657 - BLOCK
      ?auto_282658 - BLOCK
      ?auto_282659 - BLOCK
      ?auto_282660 - BLOCK
      ?auto_282661 - BLOCK
    )
    :vars
    (
      ?auto_282662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282661 ?auto_282662 ) ( not ( = ?auto_282649 ?auto_282650 ) ) ( not ( = ?auto_282649 ?auto_282651 ) ) ( not ( = ?auto_282649 ?auto_282652 ) ) ( not ( = ?auto_282649 ?auto_282653 ) ) ( not ( = ?auto_282649 ?auto_282654 ) ) ( not ( = ?auto_282649 ?auto_282655 ) ) ( not ( = ?auto_282649 ?auto_282656 ) ) ( not ( = ?auto_282649 ?auto_282657 ) ) ( not ( = ?auto_282649 ?auto_282658 ) ) ( not ( = ?auto_282649 ?auto_282659 ) ) ( not ( = ?auto_282649 ?auto_282660 ) ) ( not ( = ?auto_282649 ?auto_282661 ) ) ( not ( = ?auto_282649 ?auto_282662 ) ) ( not ( = ?auto_282650 ?auto_282651 ) ) ( not ( = ?auto_282650 ?auto_282652 ) ) ( not ( = ?auto_282650 ?auto_282653 ) ) ( not ( = ?auto_282650 ?auto_282654 ) ) ( not ( = ?auto_282650 ?auto_282655 ) ) ( not ( = ?auto_282650 ?auto_282656 ) ) ( not ( = ?auto_282650 ?auto_282657 ) ) ( not ( = ?auto_282650 ?auto_282658 ) ) ( not ( = ?auto_282650 ?auto_282659 ) ) ( not ( = ?auto_282650 ?auto_282660 ) ) ( not ( = ?auto_282650 ?auto_282661 ) ) ( not ( = ?auto_282650 ?auto_282662 ) ) ( not ( = ?auto_282651 ?auto_282652 ) ) ( not ( = ?auto_282651 ?auto_282653 ) ) ( not ( = ?auto_282651 ?auto_282654 ) ) ( not ( = ?auto_282651 ?auto_282655 ) ) ( not ( = ?auto_282651 ?auto_282656 ) ) ( not ( = ?auto_282651 ?auto_282657 ) ) ( not ( = ?auto_282651 ?auto_282658 ) ) ( not ( = ?auto_282651 ?auto_282659 ) ) ( not ( = ?auto_282651 ?auto_282660 ) ) ( not ( = ?auto_282651 ?auto_282661 ) ) ( not ( = ?auto_282651 ?auto_282662 ) ) ( not ( = ?auto_282652 ?auto_282653 ) ) ( not ( = ?auto_282652 ?auto_282654 ) ) ( not ( = ?auto_282652 ?auto_282655 ) ) ( not ( = ?auto_282652 ?auto_282656 ) ) ( not ( = ?auto_282652 ?auto_282657 ) ) ( not ( = ?auto_282652 ?auto_282658 ) ) ( not ( = ?auto_282652 ?auto_282659 ) ) ( not ( = ?auto_282652 ?auto_282660 ) ) ( not ( = ?auto_282652 ?auto_282661 ) ) ( not ( = ?auto_282652 ?auto_282662 ) ) ( not ( = ?auto_282653 ?auto_282654 ) ) ( not ( = ?auto_282653 ?auto_282655 ) ) ( not ( = ?auto_282653 ?auto_282656 ) ) ( not ( = ?auto_282653 ?auto_282657 ) ) ( not ( = ?auto_282653 ?auto_282658 ) ) ( not ( = ?auto_282653 ?auto_282659 ) ) ( not ( = ?auto_282653 ?auto_282660 ) ) ( not ( = ?auto_282653 ?auto_282661 ) ) ( not ( = ?auto_282653 ?auto_282662 ) ) ( not ( = ?auto_282654 ?auto_282655 ) ) ( not ( = ?auto_282654 ?auto_282656 ) ) ( not ( = ?auto_282654 ?auto_282657 ) ) ( not ( = ?auto_282654 ?auto_282658 ) ) ( not ( = ?auto_282654 ?auto_282659 ) ) ( not ( = ?auto_282654 ?auto_282660 ) ) ( not ( = ?auto_282654 ?auto_282661 ) ) ( not ( = ?auto_282654 ?auto_282662 ) ) ( not ( = ?auto_282655 ?auto_282656 ) ) ( not ( = ?auto_282655 ?auto_282657 ) ) ( not ( = ?auto_282655 ?auto_282658 ) ) ( not ( = ?auto_282655 ?auto_282659 ) ) ( not ( = ?auto_282655 ?auto_282660 ) ) ( not ( = ?auto_282655 ?auto_282661 ) ) ( not ( = ?auto_282655 ?auto_282662 ) ) ( not ( = ?auto_282656 ?auto_282657 ) ) ( not ( = ?auto_282656 ?auto_282658 ) ) ( not ( = ?auto_282656 ?auto_282659 ) ) ( not ( = ?auto_282656 ?auto_282660 ) ) ( not ( = ?auto_282656 ?auto_282661 ) ) ( not ( = ?auto_282656 ?auto_282662 ) ) ( not ( = ?auto_282657 ?auto_282658 ) ) ( not ( = ?auto_282657 ?auto_282659 ) ) ( not ( = ?auto_282657 ?auto_282660 ) ) ( not ( = ?auto_282657 ?auto_282661 ) ) ( not ( = ?auto_282657 ?auto_282662 ) ) ( not ( = ?auto_282658 ?auto_282659 ) ) ( not ( = ?auto_282658 ?auto_282660 ) ) ( not ( = ?auto_282658 ?auto_282661 ) ) ( not ( = ?auto_282658 ?auto_282662 ) ) ( not ( = ?auto_282659 ?auto_282660 ) ) ( not ( = ?auto_282659 ?auto_282661 ) ) ( not ( = ?auto_282659 ?auto_282662 ) ) ( not ( = ?auto_282660 ?auto_282661 ) ) ( not ( = ?auto_282660 ?auto_282662 ) ) ( not ( = ?auto_282661 ?auto_282662 ) ) ( ON ?auto_282660 ?auto_282661 ) ( ON ?auto_282659 ?auto_282660 ) ( ON ?auto_282658 ?auto_282659 ) ( ON ?auto_282657 ?auto_282658 ) ( ON ?auto_282656 ?auto_282657 ) ( ON ?auto_282655 ?auto_282656 ) ( ON ?auto_282654 ?auto_282655 ) ( ON ?auto_282653 ?auto_282654 ) ( ON ?auto_282652 ?auto_282653 ) ( ON ?auto_282651 ?auto_282652 ) ( ON ?auto_282650 ?auto_282651 ) ( ON ?auto_282649 ?auto_282650 ) ( CLEAR ?auto_282649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_282649 )
      ( MAKE-13PILE ?auto_282649 ?auto_282650 ?auto_282651 ?auto_282652 ?auto_282653 ?auto_282654 ?auto_282655 ?auto_282656 ?auto_282657 ?auto_282658 ?auto_282659 ?auto_282660 ?auto_282661 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282677 - BLOCK
      ?auto_282678 - BLOCK
      ?auto_282679 - BLOCK
      ?auto_282680 - BLOCK
      ?auto_282681 - BLOCK
      ?auto_282682 - BLOCK
      ?auto_282683 - BLOCK
      ?auto_282684 - BLOCK
      ?auto_282685 - BLOCK
      ?auto_282686 - BLOCK
      ?auto_282687 - BLOCK
      ?auto_282688 - BLOCK
      ?auto_282689 - BLOCK
      ?auto_282690 - BLOCK
    )
    :vars
    (
      ?auto_282691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_282689 ) ( ON ?auto_282690 ?auto_282691 ) ( CLEAR ?auto_282690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_282677 ) ( ON ?auto_282678 ?auto_282677 ) ( ON ?auto_282679 ?auto_282678 ) ( ON ?auto_282680 ?auto_282679 ) ( ON ?auto_282681 ?auto_282680 ) ( ON ?auto_282682 ?auto_282681 ) ( ON ?auto_282683 ?auto_282682 ) ( ON ?auto_282684 ?auto_282683 ) ( ON ?auto_282685 ?auto_282684 ) ( ON ?auto_282686 ?auto_282685 ) ( ON ?auto_282687 ?auto_282686 ) ( ON ?auto_282688 ?auto_282687 ) ( ON ?auto_282689 ?auto_282688 ) ( not ( = ?auto_282677 ?auto_282678 ) ) ( not ( = ?auto_282677 ?auto_282679 ) ) ( not ( = ?auto_282677 ?auto_282680 ) ) ( not ( = ?auto_282677 ?auto_282681 ) ) ( not ( = ?auto_282677 ?auto_282682 ) ) ( not ( = ?auto_282677 ?auto_282683 ) ) ( not ( = ?auto_282677 ?auto_282684 ) ) ( not ( = ?auto_282677 ?auto_282685 ) ) ( not ( = ?auto_282677 ?auto_282686 ) ) ( not ( = ?auto_282677 ?auto_282687 ) ) ( not ( = ?auto_282677 ?auto_282688 ) ) ( not ( = ?auto_282677 ?auto_282689 ) ) ( not ( = ?auto_282677 ?auto_282690 ) ) ( not ( = ?auto_282677 ?auto_282691 ) ) ( not ( = ?auto_282678 ?auto_282679 ) ) ( not ( = ?auto_282678 ?auto_282680 ) ) ( not ( = ?auto_282678 ?auto_282681 ) ) ( not ( = ?auto_282678 ?auto_282682 ) ) ( not ( = ?auto_282678 ?auto_282683 ) ) ( not ( = ?auto_282678 ?auto_282684 ) ) ( not ( = ?auto_282678 ?auto_282685 ) ) ( not ( = ?auto_282678 ?auto_282686 ) ) ( not ( = ?auto_282678 ?auto_282687 ) ) ( not ( = ?auto_282678 ?auto_282688 ) ) ( not ( = ?auto_282678 ?auto_282689 ) ) ( not ( = ?auto_282678 ?auto_282690 ) ) ( not ( = ?auto_282678 ?auto_282691 ) ) ( not ( = ?auto_282679 ?auto_282680 ) ) ( not ( = ?auto_282679 ?auto_282681 ) ) ( not ( = ?auto_282679 ?auto_282682 ) ) ( not ( = ?auto_282679 ?auto_282683 ) ) ( not ( = ?auto_282679 ?auto_282684 ) ) ( not ( = ?auto_282679 ?auto_282685 ) ) ( not ( = ?auto_282679 ?auto_282686 ) ) ( not ( = ?auto_282679 ?auto_282687 ) ) ( not ( = ?auto_282679 ?auto_282688 ) ) ( not ( = ?auto_282679 ?auto_282689 ) ) ( not ( = ?auto_282679 ?auto_282690 ) ) ( not ( = ?auto_282679 ?auto_282691 ) ) ( not ( = ?auto_282680 ?auto_282681 ) ) ( not ( = ?auto_282680 ?auto_282682 ) ) ( not ( = ?auto_282680 ?auto_282683 ) ) ( not ( = ?auto_282680 ?auto_282684 ) ) ( not ( = ?auto_282680 ?auto_282685 ) ) ( not ( = ?auto_282680 ?auto_282686 ) ) ( not ( = ?auto_282680 ?auto_282687 ) ) ( not ( = ?auto_282680 ?auto_282688 ) ) ( not ( = ?auto_282680 ?auto_282689 ) ) ( not ( = ?auto_282680 ?auto_282690 ) ) ( not ( = ?auto_282680 ?auto_282691 ) ) ( not ( = ?auto_282681 ?auto_282682 ) ) ( not ( = ?auto_282681 ?auto_282683 ) ) ( not ( = ?auto_282681 ?auto_282684 ) ) ( not ( = ?auto_282681 ?auto_282685 ) ) ( not ( = ?auto_282681 ?auto_282686 ) ) ( not ( = ?auto_282681 ?auto_282687 ) ) ( not ( = ?auto_282681 ?auto_282688 ) ) ( not ( = ?auto_282681 ?auto_282689 ) ) ( not ( = ?auto_282681 ?auto_282690 ) ) ( not ( = ?auto_282681 ?auto_282691 ) ) ( not ( = ?auto_282682 ?auto_282683 ) ) ( not ( = ?auto_282682 ?auto_282684 ) ) ( not ( = ?auto_282682 ?auto_282685 ) ) ( not ( = ?auto_282682 ?auto_282686 ) ) ( not ( = ?auto_282682 ?auto_282687 ) ) ( not ( = ?auto_282682 ?auto_282688 ) ) ( not ( = ?auto_282682 ?auto_282689 ) ) ( not ( = ?auto_282682 ?auto_282690 ) ) ( not ( = ?auto_282682 ?auto_282691 ) ) ( not ( = ?auto_282683 ?auto_282684 ) ) ( not ( = ?auto_282683 ?auto_282685 ) ) ( not ( = ?auto_282683 ?auto_282686 ) ) ( not ( = ?auto_282683 ?auto_282687 ) ) ( not ( = ?auto_282683 ?auto_282688 ) ) ( not ( = ?auto_282683 ?auto_282689 ) ) ( not ( = ?auto_282683 ?auto_282690 ) ) ( not ( = ?auto_282683 ?auto_282691 ) ) ( not ( = ?auto_282684 ?auto_282685 ) ) ( not ( = ?auto_282684 ?auto_282686 ) ) ( not ( = ?auto_282684 ?auto_282687 ) ) ( not ( = ?auto_282684 ?auto_282688 ) ) ( not ( = ?auto_282684 ?auto_282689 ) ) ( not ( = ?auto_282684 ?auto_282690 ) ) ( not ( = ?auto_282684 ?auto_282691 ) ) ( not ( = ?auto_282685 ?auto_282686 ) ) ( not ( = ?auto_282685 ?auto_282687 ) ) ( not ( = ?auto_282685 ?auto_282688 ) ) ( not ( = ?auto_282685 ?auto_282689 ) ) ( not ( = ?auto_282685 ?auto_282690 ) ) ( not ( = ?auto_282685 ?auto_282691 ) ) ( not ( = ?auto_282686 ?auto_282687 ) ) ( not ( = ?auto_282686 ?auto_282688 ) ) ( not ( = ?auto_282686 ?auto_282689 ) ) ( not ( = ?auto_282686 ?auto_282690 ) ) ( not ( = ?auto_282686 ?auto_282691 ) ) ( not ( = ?auto_282687 ?auto_282688 ) ) ( not ( = ?auto_282687 ?auto_282689 ) ) ( not ( = ?auto_282687 ?auto_282690 ) ) ( not ( = ?auto_282687 ?auto_282691 ) ) ( not ( = ?auto_282688 ?auto_282689 ) ) ( not ( = ?auto_282688 ?auto_282690 ) ) ( not ( = ?auto_282688 ?auto_282691 ) ) ( not ( = ?auto_282689 ?auto_282690 ) ) ( not ( = ?auto_282689 ?auto_282691 ) ) ( not ( = ?auto_282690 ?auto_282691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_282690 ?auto_282691 )
      ( !STACK ?auto_282690 ?auto_282689 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282706 - BLOCK
      ?auto_282707 - BLOCK
      ?auto_282708 - BLOCK
      ?auto_282709 - BLOCK
      ?auto_282710 - BLOCK
      ?auto_282711 - BLOCK
      ?auto_282712 - BLOCK
      ?auto_282713 - BLOCK
      ?auto_282714 - BLOCK
      ?auto_282715 - BLOCK
      ?auto_282716 - BLOCK
      ?auto_282717 - BLOCK
      ?auto_282718 - BLOCK
      ?auto_282719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_282718 ) ( ON-TABLE ?auto_282719 ) ( CLEAR ?auto_282719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_282706 ) ( ON ?auto_282707 ?auto_282706 ) ( ON ?auto_282708 ?auto_282707 ) ( ON ?auto_282709 ?auto_282708 ) ( ON ?auto_282710 ?auto_282709 ) ( ON ?auto_282711 ?auto_282710 ) ( ON ?auto_282712 ?auto_282711 ) ( ON ?auto_282713 ?auto_282712 ) ( ON ?auto_282714 ?auto_282713 ) ( ON ?auto_282715 ?auto_282714 ) ( ON ?auto_282716 ?auto_282715 ) ( ON ?auto_282717 ?auto_282716 ) ( ON ?auto_282718 ?auto_282717 ) ( not ( = ?auto_282706 ?auto_282707 ) ) ( not ( = ?auto_282706 ?auto_282708 ) ) ( not ( = ?auto_282706 ?auto_282709 ) ) ( not ( = ?auto_282706 ?auto_282710 ) ) ( not ( = ?auto_282706 ?auto_282711 ) ) ( not ( = ?auto_282706 ?auto_282712 ) ) ( not ( = ?auto_282706 ?auto_282713 ) ) ( not ( = ?auto_282706 ?auto_282714 ) ) ( not ( = ?auto_282706 ?auto_282715 ) ) ( not ( = ?auto_282706 ?auto_282716 ) ) ( not ( = ?auto_282706 ?auto_282717 ) ) ( not ( = ?auto_282706 ?auto_282718 ) ) ( not ( = ?auto_282706 ?auto_282719 ) ) ( not ( = ?auto_282707 ?auto_282708 ) ) ( not ( = ?auto_282707 ?auto_282709 ) ) ( not ( = ?auto_282707 ?auto_282710 ) ) ( not ( = ?auto_282707 ?auto_282711 ) ) ( not ( = ?auto_282707 ?auto_282712 ) ) ( not ( = ?auto_282707 ?auto_282713 ) ) ( not ( = ?auto_282707 ?auto_282714 ) ) ( not ( = ?auto_282707 ?auto_282715 ) ) ( not ( = ?auto_282707 ?auto_282716 ) ) ( not ( = ?auto_282707 ?auto_282717 ) ) ( not ( = ?auto_282707 ?auto_282718 ) ) ( not ( = ?auto_282707 ?auto_282719 ) ) ( not ( = ?auto_282708 ?auto_282709 ) ) ( not ( = ?auto_282708 ?auto_282710 ) ) ( not ( = ?auto_282708 ?auto_282711 ) ) ( not ( = ?auto_282708 ?auto_282712 ) ) ( not ( = ?auto_282708 ?auto_282713 ) ) ( not ( = ?auto_282708 ?auto_282714 ) ) ( not ( = ?auto_282708 ?auto_282715 ) ) ( not ( = ?auto_282708 ?auto_282716 ) ) ( not ( = ?auto_282708 ?auto_282717 ) ) ( not ( = ?auto_282708 ?auto_282718 ) ) ( not ( = ?auto_282708 ?auto_282719 ) ) ( not ( = ?auto_282709 ?auto_282710 ) ) ( not ( = ?auto_282709 ?auto_282711 ) ) ( not ( = ?auto_282709 ?auto_282712 ) ) ( not ( = ?auto_282709 ?auto_282713 ) ) ( not ( = ?auto_282709 ?auto_282714 ) ) ( not ( = ?auto_282709 ?auto_282715 ) ) ( not ( = ?auto_282709 ?auto_282716 ) ) ( not ( = ?auto_282709 ?auto_282717 ) ) ( not ( = ?auto_282709 ?auto_282718 ) ) ( not ( = ?auto_282709 ?auto_282719 ) ) ( not ( = ?auto_282710 ?auto_282711 ) ) ( not ( = ?auto_282710 ?auto_282712 ) ) ( not ( = ?auto_282710 ?auto_282713 ) ) ( not ( = ?auto_282710 ?auto_282714 ) ) ( not ( = ?auto_282710 ?auto_282715 ) ) ( not ( = ?auto_282710 ?auto_282716 ) ) ( not ( = ?auto_282710 ?auto_282717 ) ) ( not ( = ?auto_282710 ?auto_282718 ) ) ( not ( = ?auto_282710 ?auto_282719 ) ) ( not ( = ?auto_282711 ?auto_282712 ) ) ( not ( = ?auto_282711 ?auto_282713 ) ) ( not ( = ?auto_282711 ?auto_282714 ) ) ( not ( = ?auto_282711 ?auto_282715 ) ) ( not ( = ?auto_282711 ?auto_282716 ) ) ( not ( = ?auto_282711 ?auto_282717 ) ) ( not ( = ?auto_282711 ?auto_282718 ) ) ( not ( = ?auto_282711 ?auto_282719 ) ) ( not ( = ?auto_282712 ?auto_282713 ) ) ( not ( = ?auto_282712 ?auto_282714 ) ) ( not ( = ?auto_282712 ?auto_282715 ) ) ( not ( = ?auto_282712 ?auto_282716 ) ) ( not ( = ?auto_282712 ?auto_282717 ) ) ( not ( = ?auto_282712 ?auto_282718 ) ) ( not ( = ?auto_282712 ?auto_282719 ) ) ( not ( = ?auto_282713 ?auto_282714 ) ) ( not ( = ?auto_282713 ?auto_282715 ) ) ( not ( = ?auto_282713 ?auto_282716 ) ) ( not ( = ?auto_282713 ?auto_282717 ) ) ( not ( = ?auto_282713 ?auto_282718 ) ) ( not ( = ?auto_282713 ?auto_282719 ) ) ( not ( = ?auto_282714 ?auto_282715 ) ) ( not ( = ?auto_282714 ?auto_282716 ) ) ( not ( = ?auto_282714 ?auto_282717 ) ) ( not ( = ?auto_282714 ?auto_282718 ) ) ( not ( = ?auto_282714 ?auto_282719 ) ) ( not ( = ?auto_282715 ?auto_282716 ) ) ( not ( = ?auto_282715 ?auto_282717 ) ) ( not ( = ?auto_282715 ?auto_282718 ) ) ( not ( = ?auto_282715 ?auto_282719 ) ) ( not ( = ?auto_282716 ?auto_282717 ) ) ( not ( = ?auto_282716 ?auto_282718 ) ) ( not ( = ?auto_282716 ?auto_282719 ) ) ( not ( = ?auto_282717 ?auto_282718 ) ) ( not ( = ?auto_282717 ?auto_282719 ) ) ( not ( = ?auto_282718 ?auto_282719 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_282719 )
      ( !STACK ?auto_282719 ?auto_282718 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282734 - BLOCK
      ?auto_282735 - BLOCK
      ?auto_282736 - BLOCK
      ?auto_282737 - BLOCK
      ?auto_282738 - BLOCK
      ?auto_282739 - BLOCK
      ?auto_282740 - BLOCK
      ?auto_282741 - BLOCK
      ?auto_282742 - BLOCK
      ?auto_282743 - BLOCK
      ?auto_282744 - BLOCK
      ?auto_282745 - BLOCK
      ?auto_282746 - BLOCK
      ?auto_282747 - BLOCK
    )
    :vars
    (
      ?auto_282748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282747 ?auto_282748 ) ( ON-TABLE ?auto_282734 ) ( ON ?auto_282735 ?auto_282734 ) ( ON ?auto_282736 ?auto_282735 ) ( ON ?auto_282737 ?auto_282736 ) ( ON ?auto_282738 ?auto_282737 ) ( ON ?auto_282739 ?auto_282738 ) ( ON ?auto_282740 ?auto_282739 ) ( ON ?auto_282741 ?auto_282740 ) ( ON ?auto_282742 ?auto_282741 ) ( ON ?auto_282743 ?auto_282742 ) ( ON ?auto_282744 ?auto_282743 ) ( ON ?auto_282745 ?auto_282744 ) ( not ( = ?auto_282734 ?auto_282735 ) ) ( not ( = ?auto_282734 ?auto_282736 ) ) ( not ( = ?auto_282734 ?auto_282737 ) ) ( not ( = ?auto_282734 ?auto_282738 ) ) ( not ( = ?auto_282734 ?auto_282739 ) ) ( not ( = ?auto_282734 ?auto_282740 ) ) ( not ( = ?auto_282734 ?auto_282741 ) ) ( not ( = ?auto_282734 ?auto_282742 ) ) ( not ( = ?auto_282734 ?auto_282743 ) ) ( not ( = ?auto_282734 ?auto_282744 ) ) ( not ( = ?auto_282734 ?auto_282745 ) ) ( not ( = ?auto_282734 ?auto_282746 ) ) ( not ( = ?auto_282734 ?auto_282747 ) ) ( not ( = ?auto_282734 ?auto_282748 ) ) ( not ( = ?auto_282735 ?auto_282736 ) ) ( not ( = ?auto_282735 ?auto_282737 ) ) ( not ( = ?auto_282735 ?auto_282738 ) ) ( not ( = ?auto_282735 ?auto_282739 ) ) ( not ( = ?auto_282735 ?auto_282740 ) ) ( not ( = ?auto_282735 ?auto_282741 ) ) ( not ( = ?auto_282735 ?auto_282742 ) ) ( not ( = ?auto_282735 ?auto_282743 ) ) ( not ( = ?auto_282735 ?auto_282744 ) ) ( not ( = ?auto_282735 ?auto_282745 ) ) ( not ( = ?auto_282735 ?auto_282746 ) ) ( not ( = ?auto_282735 ?auto_282747 ) ) ( not ( = ?auto_282735 ?auto_282748 ) ) ( not ( = ?auto_282736 ?auto_282737 ) ) ( not ( = ?auto_282736 ?auto_282738 ) ) ( not ( = ?auto_282736 ?auto_282739 ) ) ( not ( = ?auto_282736 ?auto_282740 ) ) ( not ( = ?auto_282736 ?auto_282741 ) ) ( not ( = ?auto_282736 ?auto_282742 ) ) ( not ( = ?auto_282736 ?auto_282743 ) ) ( not ( = ?auto_282736 ?auto_282744 ) ) ( not ( = ?auto_282736 ?auto_282745 ) ) ( not ( = ?auto_282736 ?auto_282746 ) ) ( not ( = ?auto_282736 ?auto_282747 ) ) ( not ( = ?auto_282736 ?auto_282748 ) ) ( not ( = ?auto_282737 ?auto_282738 ) ) ( not ( = ?auto_282737 ?auto_282739 ) ) ( not ( = ?auto_282737 ?auto_282740 ) ) ( not ( = ?auto_282737 ?auto_282741 ) ) ( not ( = ?auto_282737 ?auto_282742 ) ) ( not ( = ?auto_282737 ?auto_282743 ) ) ( not ( = ?auto_282737 ?auto_282744 ) ) ( not ( = ?auto_282737 ?auto_282745 ) ) ( not ( = ?auto_282737 ?auto_282746 ) ) ( not ( = ?auto_282737 ?auto_282747 ) ) ( not ( = ?auto_282737 ?auto_282748 ) ) ( not ( = ?auto_282738 ?auto_282739 ) ) ( not ( = ?auto_282738 ?auto_282740 ) ) ( not ( = ?auto_282738 ?auto_282741 ) ) ( not ( = ?auto_282738 ?auto_282742 ) ) ( not ( = ?auto_282738 ?auto_282743 ) ) ( not ( = ?auto_282738 ?auto_282744 ) ) ( not ( = ?auto_282738 ?auto_282745 ) ) ( not ( = ?auto_282738 ?auto_282746 ) ) ( not ( = ?auto_282738 ?auto_282747 ) ) ( not ( = ?auto_282738 ?auto_282748 ) ) ( not ( = ?auto_282739 ?auto_282740 ) ) ( not ( = ?auto_282739 ?auto_282741 ) ) ( not ( = ?auto_282739 ?auto_282742 ) ) ( not ( = ?auto_282739 ?auto_282743 ) ) ( not ( = ?auto_282739 ?auto_282744 ) ) ( not ( = ?auto_282739 ?auto_282745 ) ) ( not ( = ?auto_282739 ?auto_282746 ) ) ( not ( = ?auto_282739 ?auto_282747 ) ) ( not ( = ?auto_282739 ?auto_282748 ) ) ( not ( = ?auto_282740 ?auto_282741 ) ) ( not ( = ?auto_282740 ?auto_282742 ) ) ( not ( = ?auto_282740 ?auto_282743 ) ) ( not ( = ?auto_282740 ?auto_282744 ) ) ( not ( = ?auto_282740 ?auto_282745 ) ) ( not ( = ?auto_282740 ?auto_282746 ) ) ( not ( = ?auto_282740 ?auto_282747 ) ) ( not ( = ?auto_282740 ?auto_282748 ) ) ( not ( = ?auto_282741 ?auto_282742 ) ) ( not ( = ?auto_282741 ?auto_282743 ) ) ( not ( = ?auto_282741 ?auto_282744 ) ) ( not ( = ?auto_282741 ?auto_282745 ) ) ( not ( = ?auto_282741 ?auto_282746 ) ) ( not ( = ?auto_282741 ?auto_282747 ) ) ( not ( = ?auto_282741 ?auto_282748 ) ) ( not ( = ?auto_282742 ?auto_282743 ) ) ( not ( = ?auto_282742 ?auto_282744 ) ) ( not ( = ?auto_282742 ?auto_282745 ) ) ( not ( = ?auto_282742 ?auto_282746 ) ) ( not ( = ?auto_282742 ?auto_282747 ) ) ( not ( = ?auto_282742 ?auto_282748 ) ) ( not ( = ?auto_282743 ?auto_282744 ) ) ( not ( = ?auto_282743 ?auto_282745 ) ) ( not ( = ?auto_282743 ?auto_282746 ) ) ( not ( = ?auto_282743 ?auto_282747 ) ) ( not ( = ?auto_282743 ?auto_282748 ) ) ( not ( = ?auto_282744 ?auto_282745 ) ) ( not ( = ?auto_282744 ?auto_282746 ) ) ( not ( = ?auto_282744 ?auto_282747 ) ) ( not ( = ?auto_282744 ?auto_282748 ) ) ( not ( = ?auto_282745 ?auto_282746 ) ) ( not ( = ?auto_282745 ?auto_282747 ) ) ( not ( = ?auto_282745 ?auto_282748 ) ) ( not ( = ?auto_282746 ?auto_282747 ) ) ( not ( = ?auto_282746 ?auto_282748 ) ) ( not ( = ?auto_282747 ?auto_282748 ) ) ( CLEAR ?auto_282745 ) ( ON ?auto_282746 ?auto_282747 ) ( CLEAR ?auto_282746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_282734 ?auto_282735 ?auto_282736 ?auto_282737 ?auto_282738 ?auto_282739 ?auto_282740 ?auto_282741 ?auto_282742 ?auto_282743 ?auto_282744 ?auto_282745 ?auto_282746 )
      ( MAKE-14PILE ?auto_282734 ?auto_282735 ?auto_282736 ?auto_282737 ?auto_282738 ?auto_282739 ?auto_282740 ?auto_282741 ?auto_282742 ?auto_282743 ?auto_282744 ?auto_282745 ?auto_282746 ?auto_282747 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282763 - BLOCK
      ?auto_282764 - BLOCK
      ?auto_282765 - BLOCK
      ?auto_282766 - BLOCK
      ?auto_282767 - BLOCK
      ?auto_282768 - BLOCK
      ?auto_282769 - BLOCK
      ?auto_282770 - BLOCK
      ?auto_282771 - BLOCK
      ?auto_282772 - BLOCK
      ?auto_282773 - BLOCK
      ?auto_282774 - BLOCK
      ?auto_282775 - BLOCK
      ?auto_282776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_282776 ) ( ON-TABLE ?auto_282763 ) ( ON ?auto_282764 ?auto_282763 ) ( ON ?auto_282765 ?auto_282764 ) ( ON ?auto_282766 ?auto_282765 ) ( ON ?auto_282767 ?auto_282766 ) ( ON ?auto_282768 ?auto_282767 ) ( ON ?auto_282769 ?auto_282768 ) ( ON ?auto_282770 ?auto_282769 ) ( ON ?auto_282771 ?auto_282770 ) ( ON ?auto_282772 ?auto_282771 ) ( ON ?auto_282773 ?auto_282772 ) ( ON ?auto_282774 ?auto_282773 ) ( not ( = ?auto_282763 ?auto_282764 ) ) ( not ( = ?auto_282763 ?auto_282765 ) ) ( not ( = ?auto_282763 ?auto_282766 ) ) ( not ( = ?auto_282763 ?auto_282767 ) ) ( not ( = ?auto_282763 ?auto_282768 ) ) ( not ( = ?auto_282763 ?auto_282769 ) ) ( not ( = ?auto_282763 ?auto_282770 ) ) ( not ( = ?auto_282763 ?auto_282771 ) ) ( not ( = ?auto_282763 ?auto_282772 ) ) ( not ( = ?auto_282763 ?auto_282773 ) ) ( not ( = ?auto_282763 ?auto_282774 ) ) ( not ( = ?auto_282763 ?auto_282775 ) ) ( not ( = ?auto_282763 ?auto_282776 ) ) ( not ( = ?auto_282764 ?auto_282765 ) ) ( not ( = ?auto_282764 ?auto_282766 ) ) ( not ( = ?auto_282764 ?auto_282767 ) ) ( not ( = ?auto_282764 ?auto_282768 ) ) ( not ( = ?auto_282764 ?auto_282769 ) ) ( not ( = ?auto_282764 ?auto_282770 ) ) ( not ( = ?auto_282764 ?auto_282771 ) ) ( not ( = ?auto_282764 ?auto_282772 ) ) ( not ( = ?auto_282764 ?auto_282773 ) ) ( not ( = ?auto_282764 ?auto_282774 ) ) ( not ( = ?auto_282764 ?auto_282775 ) ) ( not ( = ?auto_282764 ?auto_282776 ) ) ( not ( = ?auto_282765 ?auto_282766 ) ) ( not ( = ?auto_282765 ?auto_282767 ) ) ( not ( = ?auto_282765 ?auto_282768 ) ) ( not ( = ?auto_282765 ?auto_282769 ) ) ( not ( = ?auto_282765 ?auto_282770 ) ) ( not ( = ?auto_282765 ?auto_282771 ) ) ( not ( = ?auto_282765 ?auto_282772 ) ) ( not ( = ?auto_282765 ?auto_282773 ) ) ( not ( = ?auto_282765 ?auto_282774 ) ) ( not ( = ?auto_282765 ?auto_282775 ) ) ( not ( = ?auto_282765 ?auto_282776 ) ) ( not ( = ?auto_282766 ?auto_282767 ) ) ( not ( = ?auto_282766 ?auto_282768 ) ) ( not ( = ?auto_282766 ?auto_282769 ) ) ( not ( = ?auto_282766 ?auto_282770 ) ) ( not ( = ?auto_282766 ?auto_282771 ) ) ( not ( = ?auto_282766 ?auto_282772 ) ) ( not ( = ?auto_282766 ?auto_282773 ) ) ( not ( = ?auto_282766 ?auto_282774 ) ) ( not ( = ?auto_282766 ?auto_282775 ) ) ( not ( = ?auto_282766 ?auto_282776 ) ) ( not ( = ?auto_282767 ?auto_282768 ) ) ( not ( = ?auto_282767 ?auto_282769 ) ) ( not ( = ?auto_282767 ?auto_282770 ) ) ( not ( = ?auto_282767 ?auto_282771 ) ) ( not ( = ?auto_282767 ?auto_282772 ) ) ( not ( = ?auto_282767 ?auto_282773 ) ) ( not ( = ?auto_282767 ?auto_282774 ) ) ( not ( = ?auto_282767 ?auto_282775 ) ) ( not ( = ?auto_282767 ?auto_282776 ) ) ( not ( = ?auto_282768 ?auto_282769 ) ) ( not ( = ?auto_282768 ?auto_282770 ) ) ( not ( = ?auto_282768 ?auto_282771 ) ) ( not ( = ?auto_282768 ?auto_282772 ) ) ( not ( = ?auto_282768 ?auto_282773 ) ) ( not ( = ?auto_282768 ?auto_282774 ) ) ( not ( = ?auto_282768 ?auto_282775 ) ) ( not ( = ?auto_282768 ?auto_282776 ) ) ( not ( = ?auto_282769 ?auto_282770 ) ) ( not ( = ?auto_282769 ?auto_282771 ) ) ( not ( = ?auto_282769 ?auto_282772 ) ) ( not ( = ?auto_282769 ?auto_282773 ) ) ( not ( = ?auto_282769 ?auto_282774 ) ) ( not ( = ?auto_282769 ?auto_282775 ) ) ( not ( = ?auto_282769 ?auto_282776 ) ) ( not ( = ?auto_282770 ?auto_282771 ) ) ( not ( = ?auto_282770 ?auto_282772 ) ) ( not ( = ?auto_282770 ?auto_282773 ) ) ( not ( = ?auto_282770 ?auto_282774 ) ) ( not ( = ?auto_282770 ?auto_282775 ) ) ( not ( = ?auto_282770 ?auto_282776 ) ) ( not ( = ?auto_282771 ?auto_282772 ) ) ( not ( = ?auto_282771 ?auto_282773 ) ) ( not ( = ?auto_282771 ?auto_282774 ) ) ( not ( = ?auto_282771 ?auto_282775 ) ) ( not ( = ?auto_282771 ?auto_282776 ) ) ( not ( = ?auto_282772 ?auto_282773 ) ) ( not ( = ?auto_282772 ?auto_282774 ) ) ( not ( = ?auto_282772 ?auto_282775 ) ) ( not ( = ?auto_282772 ?auto_282776 ) ) ( not ( = ?auto_282773 ?auto_282774 ) ) ( not ( = ?auto_282773 ?auto_282775 ) ) ( not ( = ?auto_282773 ?auto_282776 ) ) ( not ( = ?auto_282774 ?auto_282775 ) ) ( not ( = ?auto_282774 ?auto_282776 ) ) ( not ( = ?auto_282775 ?auto_282776 ) ) ( CLEAR ?auto_282774 ) ( ON ?auto_282775 ?auto_282776 ) ( CLEAR ?auto_282775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_282763 ?auto_282764 ?auto_282765 ?auto_282766 ?auto_282767 ?auto_282768 ?auto_282769 ?auto_282770 ?auto_282771 ?auto_282772 ?auto_282773 ?auto_282774 ?auto_282775 )
      ( MAKE-14PILE ?auto_282763 ?auto_282764 ?auto_282765 ?auto_282766 ?auto_282767 ?auto_282768 ?auto_282769 ?auto_282770 ?auto_282771 ?auto_282772 ?auto_282773 ?auto_282774 ?auto_282775 ?auto_282776 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282791 - BLOCK
      ?auto_282792 - BLOCK
      ?auto_282793 - BLOCK
      ?auto_282794 - BLOCK
      ?auto_282795 - BLOCK
      ?auto_282796 - BLOCK
      ?auto_282797 - BLOCK
      ?auto_282798 - BLOCK
      ?auto_282799 - BLOCK
      ?auto_282800 - BLOCK
      ?auto_282801 - BLOCK
      ?auto_282802 - BLOCK
      ?auto_282803 - BLOCK
      ?auto_282804 - BLOCK
    )
    :vars
    (
      ?auto_282805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282804 ?auto_282805 ) ( ON-TABLE ?auto_282791 ) ( ON ?auto_282792 ?auto_282791 ) ( ON ?auto_282793 ?auto_282792 ) ( ON ?auto_282794 ?auto_282793 ) ( ON ?auto_282795 ?auto_282794 ) ( ON ?auto_282796 ?auto_282795 ) ( ON ?auto_282797 ?auto_282796 ) ( ON ?auto_282798 ?auto_282797 ) ( ON ?auto_282799 ?auto_282798 ) ( ON ?auto_282800 ?auto_282799 ) ( ON ?auto_282801 ?auto_282800 ) ( not ( = ?auto_282791 ?auto_282792 ) ) ( not ( = ?auto_282791 ?auto_282793 ) ) ( not ( = ?auto_282791 ?auto_282794 ) ) ( not ( = ?auto_282791 ?auto_282795 ) ) ( not ( = ?auto_282791 ?auto_282796 ) ) ( not ( = ?auto_282791 ?auto_282797 ) ) ( not ( = ?auto_282791 ?auto_282798 ) ) ( not ( = ?auto_282791 ?auto_282799 ) ) ( not ( = ?auto_282791 ?auto_282800 ) ) ( not ( = ?auto_282791 ?auto_282801 ) ) ( not ( = ?auto_282791 ?auto_282802 ) ) ( not ( = ?auto_282791 ?auto_282803 ) ) ( not ( = ?auto_282791 ?auto_282804 ) ) ( not ( = ?auto_282791 ?auto_282805 ) ) ( not ( = ?auto_282792 ?auto_282793 ) ) ( not ( = ?auto_282792 ?auto_282794 ) ) ( not ( = ?auto_282792 ?auto_282795 ) ) ( not ( = ?auto_282792 ?auto_282796 ) ) ( not ( = ?auto_282792 ?auto_282797 ) ) ( not ( = ?auto_282792 ?auto_282798 ) ) ( not ( = ?auto_282792 ?auto_282799 ) ) ( not ( = ?auto_282792 ?auto_282800 ) ) ( not ( = ?auto_282792 ?auto_282801 ) ) ( not ( = ?auto_282792 ?auto_282802 ) ) ( not ( = ?auto_282792 ?auto_282803 ) ) ( not ( = ?auto_282792 ?auto_282804 ) ) ( not ( = ?auto_282792 ?auto_282805 ) ) ( not ( = ?auto_282793 ?auto_282794 ) ) ( not ( = ?auto_282793 ?auto_282795 ) ) ( not ( = ?auto_282793 ?auto_282796 ) ) ( not ( = ?auto_282793 ?auto_282797 ) ) ( not ( = ?auto_282793 ?auto_282798 ) ) ( not ( = ?auto_282793 ?auto_282799 ) ) ( not ( = ?auto_282793 ?auto_282800 ) ) ( not ( = ?auto_282793 ?auto_282801 ) ) ( not ( = ?auto_282793 ?auto_282802 ) ) ( not ( = ?auto_282793 ?auto_282803 ) ) ( not ( = ?auto_282793 ?auto_282804 ) ) ( not ( = ?auto_282793 ?auto_282805 ) ) ( not ( = ?auto_282794 ?auto_282795 ) ) ( not ( = ?auto_282794 ?auto_282796 ) ) ( not ( = ?auto_282794 ?auto_282797 ) ) ( not ( = ?auto_282794 ?auto_282798 ) ) ( not ( = ?auto_282794 ?auto_282799 ) ) ( not ( = ?auto_282794 ?auto_282800 ) ) ( not ( = ?auto_282794 ?auto_282801 ) ) ( not ( = ?auto_282794 ?auto_282802 ) ) ( not ( = ?auto_282794 ?auto_282803 ) ) ( not ( = ?auto_282794 ?auto_282804 ) ) ( not ( = ?auto_282794 ?auto_282805 ) ) ( not ( = ?auto_282795 ?auto_282796 ) ) ( not ( = ?auto_282795 ?auto_282797 ) ) ( not ( = ?auto_282795 ?auto_282798 ) ) ( not ( = ?auto_282795 ?auto_282799 ) ) ( not ( = ?auto_282795 ?auto_282800 ) ) ( not ( = ?auto_282795 ?auto_282801 ) ) ( not ( = ?auto_282795 ?auto_282802 ) ) ( not ( = ?auto_282795 ?auto_282803 ) ) ( not ( = ?auto_282795 ?auto_282804 ) ) ( not ( = ?auto_282795 ?auto_282805 ) ) ( not ( = ?auto_282796 ?auto_282797 ) ) ( not ( = ?auto_282796 ?auto_282798 ) ) ( not ( = ?auto_282796 ?auto_282799 ) ) ( not ( = ?auto_282796 ?auto_282800 ) ) ( not ( = ?auto_282796 ?auto_282801 ) ) ( not ( = ?auto_282796 ?auto_282802 ) ) ( not ( = ?auto_282796 ?auto_282803 ) ) ( not ( = ?auto_282796 ?auto_282804 ) ) ( not ( = ?auto_282796 ?auto_282805 ) ) ( not ( = ?auto_282797 ?auto_282798 ) ) ( not ( = ?auto_282797 ?auto_282799 ) ) ( not ( = ?auto_282797 ?auto_282800 ) ) ( not ( = ?auto_282797 ?auto_282801 ) ) ( not ( = ?auto_282797 ?auto_282802 ) ) ( not ( = ?auto_282797 ?auto_282803 ) ) ( not ( = ?auto_282797 ?auto_282804 ) ) ( not ( = ?auto_282797 ?auto_282805 ) ) ( not ( = ?auto_282798 ?auto_282799 ) ) ( not ( = ?auto_282798 ?auto_282800 ) ) ( not ( = ?auto_282798 ?auto_282801 ) ) ( not ( = ?auto_282798 ?auto_282802 ) ) ( not ( = ?auto_282798 ?auto_282803 ) ) ( not ( = ?auto_282798 ?auto_282804 ) ) ( not ( = ?auto_282798 ?auto_282805 ) ) ( not ( = ?auto_282799 ?auto_282800 ) ) ( not ( = ?auto_282799 ?auto_282801 ) ) ( not ( = ?auto_282799 ?auto_282802 ) ) ( not ( = ?auto_282799 ?auto_282803 ) ) ( not ( = ?auto_282799 ?auto_282804 ) ) ( not ( = ?auto_282799 ?auto_282805 ) ) ( not ( = ?auto_282800 ?auto_282801 ) ) ( not ( = ?auto_282800 ?auto_282802 ) ) ( not ( = ?auto_282800 ?auto_282803 ) ) ( not ( = ?auto_282800 ?auto_282804 ) ) ( not ( = ?auto_282800 ?auto_282805 ) ) ( not ( = ?auto_282801 ?auto_282802 ) ) ( not ( = ?auto_282801 ?auto_282803 ) ) ( not ( = ?auto_282801 ?auto_282804 ) ) ( not ( = ?auto_282801 ?auto_282805 ) ) ( not ( = ?auto_282802 ?auto_282803 ) ) ( not ( = ?auto_282802 ?auto_282804 ) ) ( not ( = ?auto_282802 ?auto_282805 ) ) ( not ( = ?auto_282803 ?auto_282804 ) ) ( not ( = ?auto_282803 ?auto_282805 ) ) ( not ( = ?auto_282804 ?auto_282805 ) ) ( ON ?auto_282803 ?auto_282804 ) ( CLEAR ?auto_282801 ) ( ON ?auto_282802 ?auto_282803 ) ( CLEAR ?auto_282802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_282791 ?auto_282792 ?auto_282793 ?auto_282794 ?auto_282795 ?auto_282796 ?auto_282797 ?auto_282798 ?auto_282799 ?auto_282800 ?auto_282801 ?auto_282802 )
      ( MAKE-14PILE ?auto_282791 ?auto_282792 ?auto_282793 ?auto_282794 ?auto_282795 ?auto_282796 ?auto_282797 ?auto_282798 ?auto_282799 ?auto_282800 ?auto_282801 ?auto_282802 ?auto_282803 ?auto_282804 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282820 - BLOCK
      ?auto_282821 - BLOCK
      ?auto_282822 - BLOCK
      ?auto_282823 - BLOCK
      ?auto_282824 - BLOCK
      ?auto_282825 - BLOCK
      ?auto_282826 - BLOCK
      ?auto_282827 - BLOCK
      ?auto_282828 - BLOCK
      ?auto_282829 - BLOCK
      ?auto_282830 - BLOCK
      ?auto_282831 - BLOCK
      ?auto_282832 - BLOCK
      ?auto_282833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_282833 ) ( ON-TABLE ?auto_282820 ) ( ON ?auto_282821 ?auto_282820 ) ( ON ?auto_282822 ?auto_282821 ) ( ON ?auto_282823 ?auto_282822 ) ( ON ?auto_282824 ?auto_282823 ) ( ON ?auto_282825 ?auto_282824 ) ( ON ?auto_282826 ?auto_282825 ) ( ON ?auto_282827 ?auto_282826 ) ( ON ?auto_282828 ?auto_282827 ) ( ON ?auto_282829 ?auto_282828 ) ( ON ?auto_282830 ?auto_282829 ) ( not ( = ?auto_282820 ?auto_282821 ) ) ( not ( = ?auto_282820 ?auto_282822 ) ) ( not ( = ?auto_282820 ?auto_282823 ) ) ( not ( = ?auto_282820 ?auto_282824 ) ) ( not ( = ?auto_282820 ?auto_282825 ) ) ( not ( = ?auto_282820 ?auto_282826 ) ) ( not ( = ?auto_282820 ?auto_282827 ) ) ( not ( = ?auto_282820 ?auto_282828 ) ) ( not ( = ?auto_282820 ?auto_282829 ) ) ( not ( = ?auto_282820 ?auto_282830 ) ) ( not ( = ?auto_282820 ?auto_282831 ) ) ( not ( = ?auto_282820 ?auto_282832 ) ) ( not ( = ?auto_282820 ?auto_282833 ) ) ( not ( = ?auto_282821 ?auto_282822 ) ) ( not ( = ?auto_282821 ?auto_282823 ) ) ( not ( = ?auto_282821 ?auto_282824 ) ) ( not ( = ?auto_282821 ?auto_282825 ) ) ( not ( = ?auto_282821 ?auto_282826 ) ) ( not ( = ?auto_282821 ?auto_282827 ) ) ( not ( = ?auto_282821 ?auto_282828 ) ) ( not ( = ?auto_282821 ?auto_282829 ) ) ( not ( = ?auto_282821 ?auto_282830 ) ) ( not ( = ?auto_282821 ?auto_282831 ) ) ( not ( = ?auto_282821 ?auto_282832 ) ) ( not ( = ?auto_282821 ?auto_282833 ) ) ( not ( = ?auto_282822 ?auto_282823 ) ) ( not ( = ?auto_282822 ?auto_282824 ) ) ( not ( = ?auto_282822 ?auto_282825 ) ) ( not ( = ?auto_282822 ?auto_282826 ) ) ( not ( = ?auto_282822 ?auto_282827 ) ) ( not ( = ?auto_282822 ?auto_282828 ) ) ( not ( = ?auto_282822 ?auto_282829 ) ) ( not ( = ?auto_282822 ?auto_282830 ) ) ( not ( = ?auto_282822 ?auto_282831 ) ) ( not ( = ?auto_282822 ?auto_282832 ) ) ( not ( = ?auto_282822 ?auto_282833 ) ) ( not ( = ?auto_282823 ?auto_282824 ) ) ( not ( = ?auto_282823 ?auto_282825 ) ) ( not ( = ?auto_282823 ?auto_282826 ) ) ( not ( = ?auto_282823 ?auto_282827 ) ) ( not ( = ?auto_282823 ?auto_282828 ) ) ( not ( = ?auto_282823 ?auto_282829 ) ) ( not ( = ?auto_282823 ?auto_282830 ) ) ( not ( = ?auto_282823 ?auto_282831 ) ) ( not ( = ?auto_282823 ?auto_282832 ) ) ( not ( = ?auto_282823 ?auto_282833 ) ) ( not ( = ?auto_282824 ?auto_282825 ) ) ( not ( = ?auto_282824 ?auto_282826 ) ) ( not ( = ?auto_282824 ?auto_282827 ) ) ( not ( = ?auto_282824 ?auto_282828 ) ) ( not ( = ?auto_282824 ?auto_282829 ) ) ( not ( = ?auto_282824 ?auto_282830 ) ) ( not ( = ?auto_282824 ?auto_282831 ) ) ( not ( = ?auto_282824 ?auto_282832 ) ) ( not ( = ?auto_282824 ?auto_282833 ) ) ( not ( = ?auto_282825 ?auto_282826 ) ) ( not ( = ?auto_282825 ?auto_282827 ) ) ( not ( = ?auto_282825 ?auto_282828 ) ) ( not ( = ?auto_282825 ?auto_282829 ) ) ( not ( = ?auto_282825 ?auto_282830 ) ) ( not ( = ?auto_282825 ?auto_282831 ) ) ( not ( = ?auto_282825 ?auto_282832 ) ) ( not ( = ?auto_282825 ?auto_282833 ) ) ( not ( = ?auto_282826 ?auto_282827 ) ) ( not ( = ?auto_282826 ?auto_282828 ) ) ( not ( = ?auto_282826 ?auto_282829 ) ) ( not ( = ?auto_282826 ?auto_282830 ) ) ( not ( = ?auto_282826 ?auto_282831 ) ) ( not ( = ?auto_282826 ?auto_282832 ) ) ( not ( = ?auto_282826 ?auto_282833 ) ) ( not ( = ?auto_282827 ?auto_282828 ) ) ( not ( = ?auto_282827 ?auto_282829 ) ) ( not ( = ?auto_282827 ?auto_282830 ) ) ( not ( = ?auto_282827 ?auto_282831 ) ) ( not ( = ?auto_282827 ?auto_282832 ) ) ( not ( = ?auto_282827 ?auto_282833 ) ) ( not ( = ?auto_282828 ?auto_282829 ) ) ( not ( = ?auto_282828 ?auto_282830 ) ) ( not ( = ?auto_282828 ?auto_282831 ) ) ( not ( = ?auto_282828 ?auto_282832 ) ) ( not ( = ?auto_282828 ?auto_282833 ) ) ( not ( = ?auto_282829 ?auto_282830 ) ) ( not ( = ?auto_282829 ?auto_282831 ) ) ( not ( = ?auto_282829 ?auto_282832 ) ) ( not ( = ?auto_282829 ?auto_282833 ) ) ( not ( = ?auto_282830 ?auto_282831 ) ) ( not ( = ?auto_282830 ?auto_282832 ) ) ( not ( = ?auto_282830 ?auto_282833 ) ) ( not ( = ?auto_282831 ?auto_282832 ) ) ( not ( = ?auto_282831 ?auto_282833 ) ) ( not ( = ?auto_282832 ?auto_282833 ) ) ( ON ?auto_282832 ?auto_282833 ) ( CLEAR ?auto_282830 ) ( ON ?auto_282831 ?auto_282832 ) ( CLEAR ?auto_282831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_282820 ?auto_282821 ?auto_282822 ?auto_282823 ?auto_282824 ?auto_282825 ?auto_282826 ?auto_282827 ?auto_282828 ?auto_282829 ?auto_282830 ?auto_282831 )
      ( MAKE-14PILE ?auto_282820 ?auto_282821 ?auto_282822 ?auto_282823 ?auto_282824 ?auto_282825 ?auto_282826 ?auto_282827 ?auto_282828 ?auto_282829 ?auto_282830 ?auto_282831 ?auto_282832 ?auto_282833 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282848 - BLOCK
      ?auto_282849 - BLOCK
      ?auto_282850 - BLOCK
      ?auto_282851 - BLOCK
      ?auto_282852 - BLOCK
      ?auto_282853 - BLOCK
      ?auto_282854 - BLOCK
      ?auto_282855 - BLOCK
      ?auto_282856 - BLOCK
      ?auto_282857 - BLOCK
      ?auto_282858 - BLOCK
      ?auto_282859 - BLOCK
      ?auto_282860 - BLOCK
      ?auto_282861 - BLOCK
    )
    :vars
    (
      ?auto_282862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282861 ?auto_282862 ) ( ON-TABLE ?auto_282848 ) ( ON ?auto_282849 ?auto_282848 ) ( ON ?auto_282850 ?auto_282849 ) ( ON ?auto_282851 ?auto_282850 ) ( ON ?auto_282852 ?auto_282851 ) ( ON ?auto_282853 ?auto_282852 ) ( ON ?auto_282854 ?auto_282853 ) ( ON ?auto_282855 ?auto_282854 ) ( ON ?auto_282856 ?auto_282855 ) ( ON ?auto_282857 ?auto_282856 ) ( not ( = ?auto_282848 ?auto_282849 ) ) ( not ( = ?auto_282848 ?auto_282850 ) ) ( not ( = ?auto_282848 ?auto_282851 ) ) ( not ( = ?auto_282848 ?auto_282852 ) ) ( not ( = ?auto_282848 ?auto_282853 ) ) ( not ( = ?auto_282848 ?auto_282854 ) ) ( not ( = ?auto_282848 ?auto_282855 ) ) ( not ( = ?auto_282848 ?auto_282856 ) ) ( not ( = ?auto_282848 ?auto_282857 ) ) ( not ( = ?auto_282848 ?auto_282858 ) ) ( not ( = ?auto_282848 ?auto_282859 ) ) ( not ( = ?auto_282848 ?auto_282860 ) ) ( not ( = ?auto_282848 ?auto_282861 ) ) ( not ( = ?auto_282848 ?auto_282862 ) ) ( not ( = ?auto_282849 ?auto_282850 ) ) ( not ( = ?auto_282849 ?auto_282851 ) ) ( not ( = ?auto_282849 ?auto_282852 ) ) ( not ( = ?auto_282849 ?auto_282853 ) ) ( not ( = ?auto_282849 ?auto_282854 ) ) ( not ( = ?auto_282849 ?auto_282855 ) ) ( not ( = ?auto_282849 ?auto_282856 ) ) ( not ( = ?auto_282849 ?auto_282857 ) ) ( not ( = ?auto_282849 ?auto_282858 ) ) ( not ( = ?auto_282849 ?auto_282859 ) ) ( not ( = ?auto_282849 ?auto_282860 ) ) ( not ( = ?auto_282849 ?auto_282861 ) ) ( not ( = ?auto_282849 ?auto_282862 ) ) ( not ( = ?auto_282850 ?auto_282851 ) ) ( not ( = ?auto_282850 ?auto_282852 ) ) ( not ( = ?auto_282850 ?auto_282853 ) ) ( not ( = ?auto_282850 ?auto_282854 ) ) ( not ( = ?auto_282850 ?auto_282855 ) ) ( not ( = ?auto_282850 ?auto_282856 ) ) ( not ( = ?auto_282850 ?auto_282857 ) ) ( not ( = ?auto_282850 ?auto_282858 ) ) ( not ( = ?auto_282850 ?auto_282859 ) ) ( not ( = ?auto_282850 ?auto_282860 ) ) ( not ( = ?auto_282850 ?auto_282861 ) ) ( not ( = ?auto_282850 ?auto_282862 ) ) ( not ( = ?auto_282851 ?auto_282852 ) ) ( not ( = ?auto_282851 ?auto_282853 ) ) ( not ( = ?auto_282851 ?auto_282854 ) ) ( not ( = ?auto_282851 ?auto_282855 ) ) ( not ( = ?auto_282851 ?auto_282856 ) ) ( not ( = ?auto_282851 ?auto_282857 ) ) ( not ( = ?auto_282851 ?auto_282858 ) ) ( not ( = ?auto_282851 ?auto_282859 ) ) ( not ( = ?auto_282851 ?auto_282860 ) ) ( not ( = ?auto_282851 ?auto_282861 ) ) ( not ( = ?auto_282851 ?auto_282862 ) ) ( not ( = ?auto_282852 ?auto_282853 ) ) ( not ( = ?auto_282852 ?auto_282854 ) ) ( not ( = ?auto_282852 ?auto_282855 ) ) ( not ( = ?auto_282852 ?auto_282856 ) ) ( not ( = ?auto_282852 ?auto_282857 ) ) ( not ( = ?auto_282852 ?auto_282858 ) ) ( not ( = ?auto_282852 ?auto_282859 ) ) ( not ( = ?auto_282852 ?auto_282860 ) ) ( not ( = ?auto_282852 ?auto_282861 ) ) ( not ( = ?auto_282852 ?auto_282862 ) ) ( not ( = ?auto_282853 ?auto_282854 ) ) ( not ( = ?auto_282853 ?auto_282855 ) ) ( not ( = ?auto_282853 ?auto_282856 ) ) ( not ( = ?auto_282853 ?auto_282857 ) ) ( not ( = ?auto_282853 ?auto_282858 ) ) ( not ( = ?auto_282853 ?auto_282859 ) ) ( not ( = ?auto_282853 ?auto_282860 ) ) ( not ( = ?auto_282853 ?auto_282861 ) ) ( not ( = ?auto_282853 ?auto_282862 ) ) ( not ( = ?auto_282854 ?auto_282855 ) ) ( not ( = ?auto_282854 ?auto_282856 ) ) ( not ( = ?auto_282854 ?auto_282857 ) ) ( not ( = ?auto_282854 ?auto_282858 ) ) ( not ( = ?auto_282854 ?auto_282859 ) ) ( not ( = ?auto_282854 ?auto_282860 ) ) ( not ( = ?auto_282854 ?auto_282861 ) ) ( not ( = ?auto_282854 ?auto_282862 ) ) ( not ( = ?auto_282855 ?auto_282856 ) ) ( not ( = ?auto_282855 ?auto_282857 ) ) ( not ( = ?auto_282855 ?auto_282858 ) ) ( not ( = ?auto_282855 ?auto_282859 ) ) ( not ( = ?auto_282855 ?auto_282860 ) ) ( not ( = ?auto_282855 ?auto_282861 ) ) ( not ( = ?auto_282855 ?auto_282862 ) ) ( not ( = ?auto_282856 ?auto_282857 ) ) ( not ( = ?auto_282856 ?auto_282858 ) ) ( not ( = ?auto_282856 ?auto_282859 ) ) ( not ( = ?auto_282856 ?auto_282860 ) ) ( not ( = ?auto_282856 ?auto_282861 ) ) ( not ( = ?auto_282856 ?auto_282862 ) ) ( not ( = ?auto_282857 ?auto_282858 ) ) ( not ( = ?auto_282857 ?auto_282859 ) ) ( not ( = ?auto_282857 ?auto_282860 ) ) ( not ( = ?auto_282857 ?auto_282861 ) ) ( not ( = ?auto_282857 ?auto_282862 ) ) ( not ( = ?auto_282858 ?auto_282859 ) ) ( not ( = ?auto_282858 ?auto_282860 ) ) ( not ( = ?auto_282858 ?auto_282861 ) ) ( not ( = ?auto_282858 ?auto_282862 ) ) ( not ( = ?auto_282859 ?auto_282860 ) ) ( not ( = ?auto_282859 ?auto_282861 ) ) ( not ( = ?auto_282859 ?auto_282862 ) ) ( not ( = ?auto_282860 ?auto_282861 ) ) ( not ( = ?auto_282860 ?auto_282862 ) ) ( not ( = ?auto_282861 ?auto_282862 ) ) ( ON ?auto_282860 ?auto_282861 ) ( ON ?auto_282859 ?auto_282860 ) ( CLEAR ?auto_282857 ) ( ON ?auto_282858 ?auto_282859 ) ( CLEAR ?auto_282858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_282848 ?auto_282849 ?auto_282850 ?auto_282851 ?auto_282852 ?auto_282853 ?auto_282854 ?auto_282855 ?auto_282856 ?auto_282857 ?auto_282858 )
      ( MAKE-14PILE ?auto_282848 ?auto_282849 ?auto_282850 ?auto_282851 ?auto_282852 ?auto_282853 ?auto_282854 ?auto_282855 ?auto_282856 ?auto_282857 ?auto_282858 ?auto_282859 ?auto_282860 ?auto_282861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282877 - BLOCK
      ?auto_282878 - BLOCK
      ?auto_282879 - BLOCK
      ?auto_282880 - BLOCK
      ?auto_282881 - BLOCK
      ?auto_282882 - BLOCK
      ?auto_282883 - BLOCK
      ?auto_282884 - BLOCK
      ?auto_282885 - BLOCK
      ?auto_282886 - BLOCK
      ?auto_282887 - BLOCK
      ?auto_282888 - BLOCK
      ?auto_282889 - BLOCK
      ?auto_282890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_282890 ) ( ON-TABLE ?auto_282877 ) ( ON ?auto_282878 ?auto_282877 ) ( ON ?auto_282879 ?auto_282878 ) ( ON ?auto_282880 ?auto_282879 ) ( ON ?auto_282881 ?auto_282880 ) ( ON ?auto_282882 ?auto_282881 ) ( ON ?auto_282883 ?auto_282882 ) ( ON ?auto_282884 ?auto_282883 ) ( ON ?auto_282885 ?auto_282884 ) ( ON ?auto_282886 ?auto_282885 ) ( not ( = ?auto_282877 ?auto_282878 ) ) ( not ( = ?auto_282877 ?auto_282879 ) ) ( not ( = ?auto_282877 ?auto_282880 ) ) ( not ( = ?auto_282877 ?auto_282881 ) ) ( not ( = ?auto_282877 ?auto_282882 ) ) ( not ( = ?auto_282877 ?auto_282883 ) ) ( not ( = ?auto_282877 ?auto_282884 ) ) ( not ( = ?auto_282877 ?auto_282885 ) ) ( not ( = ?auto_282877 ?auto_282886 ) ) ( not ( = ?auto_282877 ?auto_282887 ) ) ( not ( = ?auto_282877 ?auto_282888 ) ) ( not ( = ?auto_282877 ?auto_282889 ) ) ( not ( = ?auto_282877 ?auto_282890 ) ) ( not ( = ?auto_282878 ?auto_282879 ) ) ( not ( = ?auto_282878 ?auto_282880 ) ) ( not ( = ?auto_282878 ?auto_282881 ) ) ( not ( = ?auto_282878 ?auto_282882 ) ) ( not ( = ?auto_282878 ?auto_282883 ) ) ( not ( = ?auto_282878 ?auto_282884 ) ) ( not ( = ?auto_282878 ?auto_282885 ) ) ( not ( = ?auto_282878 ?auto_282886 ) ) ( not ( = ?auto_282878 ?auto_282887 ) ) ( not ( = ?auto_282878 ?auto_282888 ) ) ( not ( = ?auto_282878 ?auto_282889 ) ) ( not ( = ?auto_282878 ?auto_282890 ) ) ( not ( = ?auto_282879 ?auto_282880 ) ) ( not ( = ?auto_282879 ?auto_282881 ) ) ( not ( = ?auto_282879 ?auto_282882 ) ) ( not ( = ?auto_282879 ?auto_282883 ) ) ( not ( = ?auto_282879 ?auto_282884 ) ) ( not ( = ?auto_282879 ?auto_282885 ) ) ( not ( = ?auto_282879 ?auto_282886 ) ) ( not ( = ?auto_282879 ?auto_282887 ) ) ( not ( = ?auto_282879 ?auto_282888 ) ) ( not ( = ?auto_282879 ?auto_282889 ) ) ( not ( = ?auto_282879 ?auto_282890 ) ) ( not ( = ?auto_282880 ?auto_282881 ) ) ( not ( = ?auto_282880 ?auto_282882 ) ) ( not ( = ?auto_282880 ?auto_282883 ) ) ( not ( = ?auto_282880 ?auto_282884 ) ) ( not ( = ?auto_282880 ?auto_282885 ) ) ( not ( = ?auto_282880 ?auto_282886 ) ) ( not ( = ?auto_282880 ?auto_282887 ) ) ( not ( = ?auto_282880 ?auto_282888 ) ) ( not ( = ?auto_282880 ?auto_282889 ) ) ( not ( = ?auto_282880 ?auto_282890 ) ) ( not ( = ?auto_282881 ?auto_282882 ) ) ( not ( = ?auto_282881 ?auto_282883 ) ) ( not ( = ?auto_282881 ?auto_282884 ) ) ( not ( = ?auto_282881 ?auto_282885 ) ) ( not ( = ?auto_282881 ?auto_282886 ) ) ( not ( = ?auto_282881 ?auto_282887 ) ) ( not ( = ?auto_282881 ?auto_282888 ) ) ( not ( = ?auto_282881 ?auto_282889 ) ) ( not ( = ?auto_282881 ?auto_282890 ) ) ( not ( = ?auto_282882 ?auto_282883 ) ) ( not ( = ?auto_282882 ?auto_282884 ) ) ( not ( = ?auto_282882 ?auto_282885 ) ) ( not ( = ?auto_282882 ?auto_282886 ) ) ( not ( = ?auto_282882 ?auto_282887 ) ) ( not ( = ?auto_282882 ?auto_282888 ) ) ( not ( = ?auto_282882 ?auto_282889 ) ) ( not ( = ?auto_282882 ?auto_282890 ) ) ( not ( = ?auto_282883 ?auto_282884 ) ) ( not ( = ?auto_282883 ?auto_282885 ) ) ( not ( = ?auto_282883 ?auto_282886 ) ) ( not ( = ?auto_282883 ?auto_282887 ) ) ( not ( = ?auto_282883 ?auto_282888 ) ) ( not ( = ?auto_282883 ?auto_282889 ) ) ( not ( = ?auto_282883 ?auto_282890 ) ) ( not ( = ?auto_282884 ?auto_282885 ) ) ( not ( = ?auto_282884 ?auto_282886 ) ) ( not ( = ?auto_282884 ?auto_282887 ) ) ( not ( = ?auto_282884 ?auto_282888 ) ) ( not ( = ?auto_282884 ?auto_282889 ) ) ( not ( = ?auto_282884 ?auto_282890 ) ) ( not ( = ?auto_282885 ?auto_282886 ) ) ( not ( = ?auto_282885 ?auto_282887 ) ) ( not ( = ?auto_282885 ?auto_282888 ) ) ( not ( = ?auto_282885 ?auto_282889 ) ) ( not ( = ?auto_282885 ?auto_282890 ) ) ( not ( = ?auto_282886 ?auto_282887 ) ) ( not ( = ?auto_282886 ?auto_282888 ) ) ( not ( = ?auto_282886 ?auto_282889 ) ) ( not ( = ?auto_282886 ?auto_282890 ) ) ( not ( = ?auto_282887 ?auto_282888 ) ) ( not ( = ?auto_282887 ?auto_282889 ) ) ( not ( = ?auto_282887 ?auto_282890 ) ) ( not ( = ?auto_282888 ?auto_282889 ) ) ( not ( = ?auto_282888 ?auto_282890 ) ) ( not ( = ?auto_282889 ?auto_282890 ) ) ( ON ?auto_282889 ?auto_282890 ) ( ON ?auto_282888 ?auto_282889 ) ( CLEAR ?auto_282886 ) ( ON ?auto_282887 ?auto_282888 ) ( CLEAR ?auto_282887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_282877 ?auto_282878 ?auto_282879 ?auto_282880 ?auto_282881 ?auto_282882 ?auto_282883 ?auto_282884 ?auto_282885 ?auto_282886 ?auto_282887 )
      ( MAKE-14PILE ?auto_282877 ?auto_282878 ?auto_282879 ?auto_282880 ?auto_282881 ?auto_282882 ?auto_282883 ?auto_282884 ?auto_282885 ?auto_282886 ?auto_282887 ?auto_282888 ?auto_282889 ?auto_282890 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282905 - BLOCK
      ?auto_282906 - BLOCK
      ?auto_282907 - BLOCK
      ?auto_282908 - BLOCK
      ?auto_282909 - BLOCK
      ?auto_282910 - BLOCK
      ?auto_282911 - BLOCK
      ?auto_282912 - BLOCK
      ?auto_282913 - BLOCK
      ?auto_282914 - BLOCK
      ?auto_282915 - BLOCK
      ?auto_282916 - BLOCK
      ?auto_282917 - BLOCK
      ?auto_282918 - BLOCK
    )
    :vars
    (
      ?auto_282919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282918 ?auto_282919 ) ( ON-TABLE ?auto_282905 ) ( ON ?auto_282906 ?auto_282905 ) ( ON ?auto_282907 ?auto_282906 ) ( ON ?auto_282908 ?auto_282907 ) ( ON ?auto_282909 ?auto_282908 ) ( ON ?auto_282910 ?auto_282909 ) ( ON ?auto_282911 ?auto_282910 ) ( ON ?auto_282912 ?auto_282911 ) ( ON ?auto_282913 ?auto_282912 ) ( not ( = ?auto_282905 ?auto_282906 ) ) ( not ( = ?auto_282905 ?auto_282907 ) ) ( not ( = ?auto_282905 ?auto_282908 ) ) ( not ( = ?auto_282905 ?auto_282909 ) ) ( not ( = ?auto_282905 ?auto_282910 ) ) ( not ( = ?auto_282905 ?auto_282911 ) ) ( not ( = ?auto_282905 ?auto_282912 ) ) ( not ( = ?auto_282905 ?auto_282913 ) ) ( not ( = ?auto_282905 ?auto_282914 ) ) ( not ( = ?auto_282905 ?auto_282915 ) ) ( not ( = ?auto_282905 ?auto_282916 ) ) ( not ( = ?auto_282905 ?auto_282917 ) ) ( not ( = ?auto_282905 ?auto_282918 ) ) ( not ( = ?auto_282905 ?auto_282919 ) ) ( not ( = ?auto_282906 ?auto_282907 ) ) ( not ( = ?auto_282906 ?auto_282908 ) ) ( not ( = ?auto_282906 ?auto_282909 ) ) ( not ( = ?auto_282906 ?auto_282910 ) ) ( not ( = ?auto_282906 ?auto_282911 ) ) ( not ( = ?auto_282906 ?auto_282912 ) ) ( not ( = ?auto_282906 ?auto_282913 ) ) ( not ( = ?auto_282906 ?auto_282914 ) ) ( not ( = ?auto_282906 ?auto_282915 ) ) ( not ( = ?auto_282906 ?auto_282916 ) ) ( not ( = ?auto_282906 ?auto_282917 ) ) ( not ( = ?auto_282906 ?auto_282918 ) ) ( not ( = ?auto_282906 ?auto_282919 ) ) ( not ( = ?auto_282907 ?auto_282908 ) ) ( not ( = ?auto_282907 ?auto_282909 ) ) ( not ( = ?auto_282907 ?auto_282910 ) ) ( not ( = ?auto_282907 ?auto_282911 ) ) ( not ( = ?auto_282907 ?auto_282912 ) ) ( not ( = ?auto_282907 ?auto_282913 ) ) ( not ( = ?auto_282907 ?auto_282914 ) ) ( not ( = ?auto_282907 ?auto_282915 ) ) ( not ( = ?auto_282907 ?auto_282916 ) ) ( not ( = ?auto_282907 ?auto_282917 ) ) ( not ( = ?auto_282907 ?auto_282918 ) ) ( not ( = ?auto_282907 ?auto_282919 ) ) ( not ( = ?auto_282908 ?auto_282909 ) ) ( not ( = ?auto_282908 ?auto_282910 ) ) ( not ( = ?auto_282908 ?auto_282911 ) ) ( not ( = ?auto_282908 ?auto_282912 ) ) ( not ( = ?auto_282908 ?auto_282913 ) ) ( not ( = ?auto_282908 ?auto_282914 ) ) ( not ( = ?auto_282908 ?auto_282915 ) ) ( not ( = ?auto_282908 ?auto_282916 ) ) ( not ( = ?auto_282908 ?auto_282917 ) ) ( not ( = ?auto_282908 ?auto_282918 ) ) ( not ( = ?auto_282908 ?auto_282919 ) ) ( not ( = ?auto_282909 ?auto_282910 ) ) ( not ( = ?auto_282909 ?auto_282911 ) ) ( not ( = ?auto_282909 ?auto_282912 ) ) ( not ( = ?auto_282909 ?auto_282913 ) ) ( not ( = ?auto_282909 ?auto_282914 ) ) ( not ( = ?auto_282909 ?auto_282915 ) ) ( not ( = ?auto_282909 ?auto_282916 ) ) ( not ( = ?auto_282909 ?auto_282917 ) ) ( not ( = ?auto_282909 ?auto_282918 ) ) ( not ( = ?auto_282909 ?auto_282919 ) ) ( not ( = ?auto_282910 ?auto_282911 ) ) ( not ( = ?auto_282910 ?auto_282912 ) ) ( not ( = ?auto_282910 ?auto_282913 ) ) ( not ( = ?auto_282910 ?auto_282914 ) ) ( not ( = ?auto_282910 ?auto_282915 ) ) ( not ( = ?auto_282910 ?auto_282916 ) ) ( not ( = ?auto_282910 ?auto_282917 ) ) ( not ( = ?auto_282910 ?auto_282918 ) ) ( not ( = ?auto_282910 ?auto_282919 ) ) ( not ( = ?auto_282911 ?auto_282912 ) ) ( not ( = ?auto_282911 ?auto_282913 ) ) ( not ( = ?auto_282911 ?auto_282914 ) ) ( not ( = ?auto_282911 ?auto_282915 ) ) ( not ( = ?auto_282911 ?auto_282916 ) ) ( not ( = ?auto_282911 ?auto_282917 ) ) ( not ( = ?auto_282911 ?auto_282918 ) ) ( not ( = ?auto_282911 ?auto_282919 ) ) ( not ( = ?auto_282912 ?auto_282913 ) ) ( not ( = ?auto_282912 ?auto_282914 ) ) ( not ( = ?auto_282912 ?auto_282915 ) ) ( not ( = ?auto_282912 ?auto_282916 ) ) ( not ( = ?auto_282912 ?auto_282917 ) ) ( not ( = ?auto_282912 ?auto_282918 ) ) ( not ( = ?auto_282912 ?auto_282919 ) ) ( not ( = ?auto_282913 ?auto_282914 ) ) ( not ( = ?auto_282913 ?auto_282915 ) ) ( not ( = ?auto_282913 ?auto_282916 ) ) ( not ( = ?auto_282913 ?auto_282917 ) ) ( not ( = ?auto_282913 ?auto_282918 ) ) ( not ( = ?auto_282913 ?auto_282919 ) ) ( not ( = ?auto_282914 ?auto_282915 ) ) ( not ( = ?auto_282914 ?auto_282916 ) ) ( not ( = ?auto_282914 ?auto_282917 ) ) ( not ( = ?auto_282914 ?auto_282918 ) ) ( not ( = ?auto_282914 ?auto_282919 ) ) ( not ( = ?auto_282915 ?auto_282916 ) ) ( not ( = ?auto_282915 ?auto_282917 ) ) ( not ( = ?auto_282915 ?auto_282918 ) ) ( not ( = ?auto_282915 ?auto_282919 ) ) ( not ( = ?auto_282916 ?auto_282917 ) ) ( not ( = ?auto_282916 ?auto_282918 ) ) ( not ( = ?auto_282916 ?auto_282919 ) ) ( not ( = ?auto_282917 ?auto_282918 ) ) ( not ( = ?auto_282917 ?auto_282919 ) ) ( not ( = ?auto_282918 ?auto_282919 ) ) ( ON ?auto_282917 ?auto_282918 ) ( ON ?auto_282916 ?auto_282917 ) ( ON ?auto_282915 ?auto_282916 ) ( CLEAR ?auto_282913 ) ( ON ?auto_282914 ?auto_282915 ) ( CLEAR ?auto_282914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_282905 ?auto_282906 ?auto_282907 ?auto_282908 ?auto_282909 ?auto_282910 ?auto_282911 ?auto_282912 ?auto_282913 ?auto_282914 )
      ( MAKE-14PILE ?auto_282905 ?auto_282906 ?auto_282907 ?auto_282908 ?auto_282909 ?auto_282910 ?auto_282911 ?auto_282912 ?auto_282913 ?auto_282914 ?auto_282915 ?auto_282916 ?auto_282917 ?auto_282918 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282934 - BLOCK
      ?auto_282935 - BLOCK
      ?auto_282936 - BLOCK
      ?auto_282937 - BLOCK
      ?auto_282938 - BLOCK
      ?auto_282939 - BLOCK
      ?auto_282940 - BLOCK
      ?auto_282941 - BLOCK
      ?auto_282942 - BLOCK
      ?auto_282943 - BLOCK
      ?auto_282944 - BLOCK
      ?auto_282945 - BLOCK
      ?auto_282946 - BLOCK
      ?auto_282947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_282947 ) ( ON-TABLE ?auto_282934 ) ( ON ?auto_282935 ?auto_282934 ) ( ON ?auto_282936 ?auto_282935 ) ( ON ?auto_282937 ?auto_282936 ) ( ON ?auto_282938 ?auto_282937 ) ( ON ?auto_282939 ?auto_282938 ) ( ON ?auto_282940 ?auto_282939 ) ( ON ?auto_282941 ?auto_282940 ) ( ON ?auto_282942 ?auto_282941 ) ( not ( = ?auto_282934 ?auto_282935 ) ) ( not ( = ?auto_282934 ?auto_282936 ) ) ( not ( = ?auto_282934 ?auto_282937 ) ) ( not ( = ?auto_282934 ?auto_282938 ) ) ( not ( = ?auto_282934 ?auto_282939 ) ) ( not ( = ?auto_282934 ?auto_282940 ) ) ( not ( = ?auto_282934 ?auto_282941 ) ) ( not ( = ?auto_282934 ?auto_282942 ) ) ( not ( = ?auto_282934 ?auto_282943 ) ) ( not ( = ?auto_282934 ?auto_282944 ) ) ( not ( = ?auto_282934 ?auto_282945 ) ) ( not ( = ?auto_282934 ?auto_282946 ) ) ( not ( = ?auto_282934 ?auto_282947 ) ) ( not ( = ?auto_282935 ?auto_282936 ) ) ( not ( = ?auto_282935 ?auto_282937 ) ) ( not ( = ?auto_282935 ?auto_282938 ) ) ( not ( = ?auto_282935 ?auto_282939 ) ) ( not ( = ?auto_282935 ?auto_282940 ) ) ( not ( = ?auto_282935 ?auto_282941 ) ) ( not ( = ?auto_282935 ?auto_282942 ) ) ( not ( = ?auto_282935 ?auto_282943 ) ) ( not ( = ?auto_282935 ?auto_282944 ) ) ( not ( = ?auto_282935 ?auto_282945 ) ) ( not ( = ?auto_282935 ?auto_282946 ) ) ( not ( = ?auto_282935 ?auto_282947 ) ) ( not ( = ?auto_282936 ?auto_282937 ) ) ( not ( = ?auto_282936 ?auto_282938 ) ) ( not ( = ?auto_282936 ?auto_282939 ) ) ( not ( = ?auto_282936 ?auto_282940 ) ) ( not ( = ?auto_282936 ?auto_282941 ) ) ( not ( = ?auto_282936 ?auto_282942 ) ) ( not ( = ?auto_282936 ?auto_282943 ) ) ( not ( = ?auto_282936 ?auto_282944 ) ) ( not ( = ?auto_282936 ?auto_282945 ) ) ( not ( = ?auto_282936 ?auto_282946 ) ) ( not ( = ?auto_282936 ?auto_282947 ) ) ( not ( = ?auto_282937 ?auto_282938 ) ) ( not ( = ?auto_282937 ?auto_282939 ) ) ( not ( = ?auto_282937 ?auto_282940 ) ) ( not ( = ?auto_282937 ?auto_282941 ) ) ( not ( = ?auto_282937 ?auto_282942 ) ) ( not ( = ?auto_282937 ?auto_282943 ) ) ( not ( = ?auto_282937 ?auto_282944 ) ) ( not ( = ?auto_282937 ?auto_282945 ) ) ( not ( = ?auto_282937 ?auto_282946 ) ) ( not ( = ?auto_282937 ?auto_282947 ) ) ( not ( = ?auto_282938 ?auto_282939 ) ) ( not ( = ?auto_282938 ?auto_282940 ) ) ( not ( = ?auto_282938 ?auto_282941 ) ) ( not ( = ?auto_282938 ?auto_282942 ) ) ( not ( = ?auto_282938 ?auto_282943 ) ) ( not ( = ?auto_282938 ?auto_282944 ) ) ( not ( = ?auto_282938 ?auto_282945 ) ) ( not ( = ?auto_282938 ?auto_282946 ) ) ( not ( = ?auto_282938 ?auto_282947 ) ) ( not ( = ?auto_282939 ?auto_282940 ) ) ( not ( = ?auto_282939 ?auto_282941 ) ) ( not ( = ?auto_282939 ?auto_282942 ) ) ( not ( = ?auto_282939 ?auto_282943 ) ) ( not ( = ?auto_282939 ?auto_282944 ) ) ( not ( = ?auto_282939 ?auto_282945 ) ) ( not ( = ?auto_282939 ?auto_282946 ) ) ( not ( = ?auto_282939 ?auto_282947 ) ) ( not ( = ?auto_282940 ?auto_282941 ) ) ( not ( = ?auto_282940 ?auto_282942 ) ) ( not ( = ?auto_282940 ?auto_282943 ) ) ( not ( = ?auto_282940 ?auto_282944 ) ) ( not ( = ?auto_282940 ?auto_282945 ) ) ( not ( = ?auto_282940 ?auto_282946 ) ) ( not ( = ?auto_282940 ?auto_282947 ) ) ( not ( = ?auto_282941 ?auto_282942 ) ) ( not ( = ?auto_282941 ?auto_282943 ) ) ( not ( = ?auto_282941 ?auto_282944 ) ) ( not ( = ?auto_282941 ?auto_282945 ) ) ( not ( = ?auto_282941 ?auto_282946 ) ) ( not ( = ?auto_282941 ?auto_282947 ) ) ( not ( = ?auto_282942 ?auto_282943 ) ) ( not ( = ?auto_282942 ?auto_282944 ) ) ( not ( = ?auto_282942 ?auto_282945 ) ) ( not ( = ?auto_282942 ?auto_282946 ) ) ( not ( = ?auto_282942 ?auto_282947 ) ) ( not ( = ?auto_282943 ?auto_282944 ) ) ( not ( = ?auto_282943 ?auto_282945 ) ) ( not ( = ?auto_282943 ?auto_282946 ) ) ( not ( = ?auto_282943 ?auto_282947 ) ) ( not ( = ?auto_282944 ?auto_282945 ) ) ( not ( = ?auto_282944 ?auto_282946 ) ) ( not ( = ?auto_282944 ?auto_282947 ) ) ( not ( = ?auto_282945 ?auto_282946 ) ) ( not ( = ?auto_282945 ?auto_282947 ) ) ( not ( = ?auto_282946 ?auto_282947 ) ) ( ON ?auto_282946 ?auto_282947 ) ( ON ?auto_282945 ?auto_282946 ) ( ON ?auto_282944 ?auto_282945 ) ( CLEAR ?auto_282942 ) ( ON ?auto_282943 ?auto_282944 ) ( CLEAR ?auto_282943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_282934 ?auto_282935 ?auto_282936 ?auto_282937 ?auto_282938 ?auto_282939 ?auto_282940 ?auto_282941 ?auto_282942 ?auto_282943 )
      ( MAKE-14PILE ?auto_282934 ?auto_282935 ?auto_282936 ?auto_282937 ?auto_282938 ?auto_282939 ?auto_282940 ?auto_282941 ?auto_282942 ?auto_282943 ?auto_282944 ?auto_282945 ?auto_282946 ?auto_282947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282962 - BLOCK
      ?auto_282963 - BLOCK
      ?auto_282964 - BLOCK
      ?auto_282965 - BLOCK
      ?auto_282966 - BLOCK
      ?auto_282967 - BLOCK
      ?auto_282968 - BLOCK
      ?auto_282969 - BLOCK
      ?auto_282970 - BLOCK
      ?auto_282971 - BLOCK
      ?auto_282972 - BLOCK
      ?auto_282973 - BLOCK
      ?auto_282974 - BLOCK
      ?auto_282975 - BLOCK
    )
    :vars
    (
      ?auto_282976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_282975 ?auto_282976 ) ( ON-TABLE ?auto_282962 ) ( ON ?auto_282963 ?auto_282962 ) ( ON ?auto_282964 ?auto_282963 ) ( ON ?auto_282965 ?auto_282964 ) ( ON ?auto_282966 ?auto_282965 ) ( ON ?auto_282967 ?auto_282966 ) ( ON ?auto_282968 ?auto_282967 ) ( ON ?auto_282969 ?auto_282968 ) ( not ( = ?auto_282962 ?auto_282963 ) ) ( not ( = ?auto_282962 ?auto_282964 ) ) ( not ( = ?auto_282962 ?auto_282965 ) ) ( not ( = ?auto_282962 ?auto_282966 ) ) ( not ( = ?auto_282962 ?auto_282967 ) ) ( not ( = ?auto_282962 ?auto_282968 ) ) ( not ( = ?auto_282962 ?auto_282969 ) ) ( not ( = ?auto_282962 ?auto_282970 ) ) ( not ( = ?auto_282962 ?auto_282971 ) ) ( not ( = ?auto_282962 ?auto_282972 ) ) ( not ( = ?auto_282962 ?auto_282973 ) ) ( not ( = ?auto_282962 ?auto_282974 ) ) ( not ( = ?auto_282962 ?auto_282975 ) ) ( not ( = ?auto_282962 ?auto_282976 ) ) ( not ( = ?auto_282963 ?auto_282964 ) ) ( not ( = ?auto_282963 ?auto_282965 ) ) ( not ( = ?auto_282963 ?auto_282966 ) ) ( not ( = ?auto_282963 ?auto_282967 ) ) ( not ( = ?auto_282963 ?auto_282968 ) ) ( not ( = ?auto_282963 ?auto_282969 ) ) ( not ( = ?auto_282963 ?auto_282970 ) ) ( not ( = ?auto_282963 ?auto_282971 ) ) ( not ( = ?auto_282963 ?auto_282972 ) ) ( not ( = ?auto_282963 ?auto_282973 ) ) ( not ( = ?auto_282963 ?auto_282974 ) ) ( not ( = ?auto_282963 ?auto_282975 ) ) ( not ( = ?auto_282963 ?auto_282976 ) ) ( not ( = ?auto_282964 ?auto_282965 ) ) ( not ( = ?auto_282964 ?auto_282966 ) ) ( not ( = ?auto_282964 ?auto_282967 ) ) ( not ( = ?auto_282964 ?auto_282968 ) ) ( not ( = ?auto_282964 ?auto_282969 ) ) ( not ( = ?auto_282964 ?auto_282970 ) ) ( not ( = ?auto_282964 ?auto_282971 ) ) ( not ( = ?auto_282964 ?auto_282972 ) ) ( not ( = ?auto_282964 ?auto_282973 ) ) ( not ( = ?auto_282964 ?auto_282974 ) ) ( not ( = ?auto_282964 ?auto_282975 ) ) ( not ( = ?auto_282964 ?auto_282976 ) ) ( not ( = ?auto_282965 ?auto_282966 ) ) ( not ( = ?auto_282965 ?auto_282967 ) ) ( not ( = ?auto_282965 ?auto_282968 ) ) ( not ( = ?auto_282965 ?auto_282969 ) ) ( not ( = ?auto_282965 ?auto_282970 ) ) ( not ( = ?auto_282965 ?auto_282971 ) ) ( not ( = ?auto_282965 ?auto_282972 ) ) ( not ( = ?auto_282965 ?auto_282973 ) ) ( not ( = ?auto_282965 ?auto_282974 ) ) ( not ( = ?auto_282965 ?auto_282975 ) ) ( not ( = ?auto_282965 ?auto_282976 ) ) ( not ( = ?auto_282966 ?auto_282967 ) ) ( not ( = ?auto_282966 ?auto_282968 ) ) ( not ( = ?auto_282966 ?auto_282969 ) ) ( not ( = ?auto_282966 ?auto_282970 ) ) ( not ( = ?auto_282966 ?auto_282971 ) ) ( not ( = ?auto_282966 ?auto_282972 ) ) ( not ( = ?auto_282966 ?auto_282973 ) ) ( not ( = ?auto_282966 ?auto_282974 ) ) ( not ( = ?auto_282966 ?auto_282975 ) ) ( not ( = ?auto_282966 ?auto_282976 ) ) ( not ( = ?auto_282967 ?auto_282968 ) ) ( not ( = ?auto_282967 ?auto_282969 ) ) ( not ( = ?auto_282967 ?auto_282970 ) ) ( not ( = ?auto_282967 ?auto_282971 ) ) ( not ( = ?auto_282967 ?auto_282972 ) ) ( not ( = ?auto_282967 ?auto_282973 ) ) ( not ( = ?auto_282967 ?auto_282974 ) ) ( not ( = ?auto_282967 ?auto_282975 ) ) ( not ( = ?auto_282967 ?auto_282976 ) ) ( not ( = ?auto_282968 ?auto_282969 ) ) ( not ( = ?auto_282968 ?auto_282970 ) ) ( not ( = ?auto_282968 ?auto_282971 ) ) ( not ( = ?auto_282968 ?auto_282972 ) ) ( not ( = ?auto_282968 ?auto_282973 ) ) ( not ( = ?auto_282968 ?auto_282974 ) ) ( not ( = ?auto_282968 ?auto_282975 ) ) ( not ( = ?auto_282968 ?auto_282976 ) ) ( not ( = ?auto_282969 ?auto_282970 ) ) ( not ( = ?auto_282969 ?auto_282971 ) ) ( not ( = ?auto_282969 ?auto_282972 ) ) ( not ( = ?auto_282969 ?auto_282973 ) ) ( not ( = ?auto_282969 ?auto_282974 ) ) ( not ( = ?auto_282969 ?auto_282975 ) ) ( not ( = ?auto_282969 ?auto_282976 ) ) ( not ( = ?auto_282970 ?auto_282971 ) ) ( not ( = ?auto_282970 ?auto_282972 ) ) ( not ( = ?auto_282970 ?auto_282973 ) ) ( not ( = ?auto_282970 ?auto_282974 ) ) ( not ( = ?auto_282970 ?auto_282975 ) ) ( not ( = ?auto_282970 ?auto_282976 ) ) ( not ( = ?auto_282971 ?auto_282972 ) ) ( not ( = ?auto_282971 ?auto_282973 ) ) ( not ( = ?auto_282971 ?auto_282974 ) ) ( not ( = ?auto_282971 ?auto_282975 ) ) ( not ( = ?auto_282971 ?auto_282976 ) ) ( not ( = ?auto_282972 ?auto_282973 ) ) ( not ( = ?auto_282972 ?auto_282974 ) ) ( not ( = ?auto_282972 ?auto_282975 ) ) ( not ( = ?auto_282972 ?auto_282976 ) ) ( not ( = ?auto_282973 ?auto_282974 ) ) ( not ( = ?auto_282973 ?auto_282975 ) ) ( not ( = ?auto_282973 ?auto_282976 ) ) ( not ( = ?auto_282974 ?auto_282975 ) ) ( not ( = ?auto_282974 ?auto_282976 ) ) ( not ( = ?auto_282975 ?auto_282976 ) ) ( ON ?auto_282974 ?auto_282975 ) ( ON ?auto_282973 ?auto_282974 ) ( ON ?auto_282972 ?auto_282973 ) ( ON ?auto_282971 ?auto_282972 ) ( CLEAR ?auto_282969 ) ( ON ?auto_282970 ?auto_282971 ) ( CLEAR ?auto_282970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_282962 ?auto_282963 ?auto_282964 ?auto_282965 ?auto_282966 ?auto_282967 ?auto_282968 ?auto_282969 ?auto_282970 )
      ( MAKE-14PILE ?auto_282962 ?auto_282963 ?auto_282964 ?auto_282965 ?auto_282966 ?auto_282967 ?auto_282968 ?auto_282969 ?auto_282970 ?auto_282971 ?auto_282972 ?auto_282973 ?auto_282974 ?auto_282975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_282991 - BLOCK
      ?auto_282992 - BLOCK
      ?auto_282993 - BLOCK
      ?auto_282994 - BLOCK
      ?auto_282995 - BLOCK
      ?auto_282996 - BLOCK
      ?auto_282997 - BLOCK
      ?auto_282998 - BLOCK
      ?auto_282999 - BLOCK
      ?auto_283000 - BLOCK
      ?auto_283001 - BLOCK
      ?auto_283002 - BLOCK
      ?auto_283003 - BLOCK
      ?auto_283004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283004 ) ( ON-TABLE ?auto_282991 ) ( ON ?auto_282992 ?auto_282991 ) ( ON ?auto_282993 ?auto_282992 ) ( ON ?auto_282994 ?auto_282993 ) ( ON ?auto_282995 ?auto_282994 ) ( ON ?auto_282996 ?auto_282995 ) ( ON ?auto_282997 ?auto_282996 ) ( ON ?auto_282998 ?auto_282997 ) ( not ( = ?auto_282991 ?auto_282992 ) ) ( not ( = ?auto_282991 ?auto_282993 ) ) ( not ( = ?auto_282991 ?auto_282994 ) ) ( not ( = ?auto_282991 ?auto_282995 ) ) ( not ( = ?auto_282991 ?auto_282996 ) ) ( not ( = ?auto_282991 ?auto_282997 ) ) ( not ( = ?auto_282991 ?auto_282998 ) ) ( not ( = ?auto_282991 ?auto_282999 ) ) ( not ( = ?auto_282991 ?auto_283000 ) ) ( not ( = ?auto_282991 ?auto_283001 ) ) ( not ( = ?auto_282991 ?auto_283002 ) ) ( not ( = ?auto_282991 ?auto_283003 ) ) ( not ( = ?auto_282991 ?auto_283004 ) ) ( not ( = ?auto_282992 ?auto_282993 ) ) ( not ( = ?auto_282992 ?auto_282994 ) ) ( not ( = ?auto_282992 ?auto_282995 ) ) ( not ( = ?auto_282992 ?auto_282996 ) ) ( not ( = ?auto_282992 ?auto_282997 ) ) ( not ( = ?auto_282992 ?auto_282998 ) ) ( not ( = ?auto_282992 ?auto_282999 ) ) ( not ( = ?auto_282992 ?auto_283000 ) ) ( not ( = ?auto_282992 ?auto_283001 ) ) ( not ( = ?auto_282992 ?auto_283002 ) ) ( not ( = ?auto_282992 ?auto_283003 ) ) ( not ( = ?auto_282992 ?auto_283004 ) ) ( not ( = ?auto_282993 ?auto_282994 ) ) ( not ( = ?auto_282993 ?auto_282995 ) ) ( not ( = ?auto_282993 ?auto_282996 ) ) ( not ( = ?auto_282993 ?auto_282997 ) ) ( not ( = ?auto_282993 ?auto_282998 ) ) ( not ( = ?auto_282993 ?auto_282999 ) ) ( not ( = ?auto_282993 ?auto_283000 ) ) ( not ( = ?auto_282993 ?auto_283001 ) ) ( not ( = ?auto_282993 ?auto_283002 ) ) ( not ( = ?auto_282993 ?auto_283003 ) ) ( not ( = ?auto_282993 ?auto_283004 ) ) ( not ( = ?auto_282994 ?auto_282995 ) ) ( not ( = ?auto_282994 ?auto_282996 ) ) ( not ( = ?auto_282994 ?auto_282997 ) ) ( not ( = ?auto_282994 ?auto_282998 ) ) ( not ( = ?auto_282994 ?auto_282999 ) ) ( not ( = ?auto_282994 ?auto_283000 ) ) ( not ( = ?auto_282994 ?auto_283001 ) ) ( not ( = ?auto_282994 ?auto_283002 ) ) ( not ( = ?auto_282994 ?auto_283003 ) ) ( not ( = ?auto_282994 ?auto_283004 ) ) ( not ( = ?auto_282995 ?auto_282996 ) ) ( not ( = ?auto_282995 ?auto_282997 ) ) ( not ( = ?auto_282995 ?auto_282998 ) ) ( not ( = ?auto_282995 ?auto_282999 ) ) ( not ( = ?auto_282995 ?auto_283000 ) ) ( not ( = ?auto_282995 ?auto_283001 ) ) ( not ( = ?auto_282995 ?auto_283002 ) ) ( not ( = ?auto_282995 ?auto_283003 ) ) ( not ( = ?auto_282995 ?auto_283004 ) ) ( not ( = ?auto_282996 ?auto_282997 ) ) ( not ( = ?auto_282996 ?auto_282998 ) ) ( not ( = ?auto_282996 ?auto_282999 ) ) ( not ( = ?auto_282996 ?auto_283000 ) ) ( not ( = ?auto_282996 ?auto_283001 ) ) ( not ( = ?auto_282996 ?auto_283002 ) ) ( not ( = ?auto_282996 ?auto_283003 ) ) ( not ( = ?auto_282996 ?auto_283004 ) ) ( not ( = ?auto_282997 ?auto_282998 ) ) ( not ( = ?auto_282997 ?auto_282999 ) ) ( not ( = ?auto_282997 ?auto_283000 ) ) ( not ( = ?auto_282997 ?auto_283001 ) ) ( not ( = ?auto_282997 ?auto_283002 ) ) ( not ( = ?auto_282997 ?auto_283003 ) ) ( not ( = ?auto_282997 ?auto_283004 ) ) ( not ( = ?auto_282998 ?auto_282999 ) ) ( not ( = ?auto_282998 ?auto_283000 ) ) ( not ( = ?auto_282998 ?auto_283001 ) ) ( not ( = ?auto_282998 ?auto_283002 ) ) ( not ( = ?auto_282998 ?auto_283003 ) ) ( not ( = ?auto_282998 ?auto_283004 ) ) ( not ( = ?auto_282999 ?auto_283000 ) ) ( not ( = ?auto_282999 ?auto_283001 ) ) ( not ( = ?auto_282999 ?auto_283002 ) ) ( not ( = ?auto_282999 ?auto_283003 ) ) ( not ( = ?auto_282999 ?auto_283004 ) ) ( not ( = ?auto_283000 ?auto_283001 ) ) ( not ( = ?auto_283000 ?auto_283002 ) ) ( not ( = ?auto_283000 ?auto_283003 ) ) ( not ( = ?auto_283000 ?auto_283004 ) ) ( not ( = ?auto_283001 ?auto_283002 ) ) ( not ( = ?auto_283001 ?auto_283003 ) ) ( not ( = ?auto_283001 ?auto_283004 ) ) ( not ( = ?auto_283002 ?auto_283003 ) ) ( not ( = ?auto_283002 ?auto_283004 ) ) ( not ( = ?auto_283003 ?auto_283004 ) ) ( ON ?auto_283003 ?auto_283004 ) ( ON ?auto_283002 ?auto_283003 ) ( ON ?auto_283001 ?auto_283002 ) ( ON ?auto_283000 ?auto_283001 ) ( CLEAR ?auto_282998 ) ( ON ?auto_282999 ?auto_283000 ) ( CLEAR ?auto_282999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_282991 ?auto_282992 ?auto_282993 ?auto_282994 ?auto_282995 ?auto_282996 ?auto_282997 ?auto_282998 ?auto_282999 )
      ( MAKE-14PILE ?auto_282991 ?auto_282992 ?auto_282993 ?auto_282994 ?auto_282995 ?auto_282996 ?auto_282997 ?auto_282998 ?auto_282999 ?auto_283000 ?auto_283001 ?auto_283002 ?auto_283003 ?auto_283004 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283019 - BLOCK
      ?auto_283020 - BLOCK
      ?auto_283021 - BLOCK
      ?auto_283022 - BLOCK
      ?auto_283023 - BLOCK
      ?auto_283024 - BLOCK
      ?auto_283025 - BLOCK
      ?auto_283026 - BLOCK
      ?auto_283027 - BLOCK
      ?auto_283028 - BLOCK
      ?auto_283029 - BLOCK
      ?auto_283030 - BLOCK
      ?auto_283031 - BLOCK
      ?auto_283032 - BLOCK
    )
    :vars
    (
      ?auto_283033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283032 ?auto_283033 ) ( ON-TABLE ?auto_283019 ) ( ON ?auto_283020 ?auto_283019 ) ( ON ?auto_283021 ?auto_283020 ) ( ON ?auto_283022 ?auto_283021 ) ( ON ?auto_283023 ?auto_283022 ) ( ON ?auto_283024 ?auto_283023 ) ( ON ?auto_283025 ?auto_283024 ) ( not ( = ?auto_283019 ?auto_283020 ) ) ( not ( = ?auto_283019 ?auto_283021 ) ) ( not ( = ?auto_283019 ?auto_283022 ) ) ( not ( = ?auto_283019 ?auto_283023 ) ) ( not ( = ?auto_283019 ?auto_283024 ) ) ( not ( = ?auto_283019 ?auto_283025 ) ) ( not ( = ?auto_283019 ?auto_283026 ) ) ( not ( = ?auto_283019 ?auto_283027 ) ) ( not ( = ?auto_283019 ?auto_283028 ) ) ( not ( = ?auto_283019 ?auto_283029 ) ) ( not ( = ?auto_283019 ?auto_283030 ) ) ( not ( = ?auto_283019 ?auto_283031 ) ) ( not ( = ?auto_283019 ?auto_283032 ) ) ( not ( = ?auto_283019 ?auto_283033 ) ) ( not ( = ?auto_283020 ?auto_283021 ) ) ( not ( = ?auto_283020 ?auto_283022 ) ) ( not ( = ?auto_283020 ?auto_283023 ) ) ( not ( = ?auto_283020 ?auto_283024 ) ) ( not ( = ?auto_283020 ?auto_283025 ) ) ( not ( = ?auto_283020 ?auto_283026 ) ) ( not ( = ?auto_283020 ?auto_283027 ) ) ( not ( = ?auto_283020 ?auto_283028 ) ) ( not ( = ?auto_283020 ?auto_283029 ) ) ( not ( = ?auto_283020 ?auto_283030 ) ) ( not ( = ?auto_283020 ?auto_283031 ) ) ( not ( = ?auto_283020 ?auto_283032 ) ) ( not ( = ?auto_283020 ?auto_283033 ) ) ( not ( = ?auto_283021 ?auto_283022 ) ) ( not ( = ?auto_283021 ?auto_283023 ) ) ( not ( = ?auto_283021 ?auto_283024 ) ) ( not ( = ?auto_283021 ?auto_283025 ) ) ( not ( = ?auto_283021 ?auto_283026 ) ) ( not ( = ?auto_283021 ?auto_283027 ) ) ( not ( = ?auto_283021 ?auto_283028 ) ) ( not ( = ?auto_283021 ?auto_283029 ) ) ( not ( = ?auto_283021 ?auto_283030 ) ) ( not ( = ?auto_283021 ?auto_283031 ) ) ( not ( = ?auto_283021 ?auto_283032 ) ) ( not ( = ?auto_283021 ?auto_283033 ) ) ( not ( = ?auto_283022 ?auto_283023 ) ) ( not ( = ?auto_283022 ?auto_283024 ) ) ( not ( = ?auto_283022 ?auto_283025 ) ) ( not ( = ?auto_283022 ?auto_283026 ) ) ( not ( = ?auto_283022 ?auto_283027 ) ) ( not ( = ?auto_283022 ?auto_283028 ) ) ( not ( = ?auto_283022 ?auto_283029 ) ) ( not ( = ?auto_283022 ?auto_283030 ) ) ( not ( = ?auto_283022 ?auto_283031 ) ) ( not ( = ?auto_283022 ?auto_283032 ) ) ( not ( = ?auto_283022 ?auto_283033 ) ) ( not ( = ?auto_283023 ?auto_283024 ) ) ( not ( = ?auto_283023 ?auto_283025 ) ) ( not ( = ?auto_283023 ?auto_283026 ) ) ( not ( = ?auto_283023 ?auto_283027 ) ) ( not ( = ?auto_283023 ?auto_283028 ) ) ( not ( = ?auto_283023 ?auto_283029 ) ) ( not ( = ?auto_283023 ?auto_283030 ) ) ( not ( = ?auto_283023 ?auto_283031 ) ) ( not ( = ?auto_283023 ?auto_283032 ) ) ( not ( = ?auto_283023 ?auto_283033 ) ) ( not ( = ?auto_283024 ?auto_283025 ) ) ( not ( = ?auto_283024 ?auto_283026 ) ) ( not ( = ?auto_283024 ?auto_283027 ) ) ( not ( = ?auto_283024 ?auto_283028 ) ) ( not ( = ?auto_283024 ?auto_283029 ) ) ( not ( = ?auto_283024 ?auto_283030 ) ) ( not ( = ?auto_283024 ?auto_283031 ) ) ( not ( = ?auto_283024 ?auto_283032 ) ) ( not ( = ?auto_283024 ?auto_283033 ) ) ( not ( = ?auto_283025 ?auto_283026 ) ) ( not ( = ?auto_283025 ?auto_283027 ) ) ( not ( = ?auto_283025 ?auto_283028 ) ) ( not ( = ?auto_283025 ?auto_283029 ) ) ( not ( = ?auto_283025 ?auto_283030 ) ) ( not ( = ?auto_283025 ?auto_283031 ) ) ( not ( = ?auto_283025 ?auto_283032 ) ) ( not ( = ?auto_283025 ?auto_283033 ) ) ( not ( = ?auto_283026 ?auto_283027 ) ) ( not ( = ?auto_283026 ?auto_283028 ) ) ( not ( = ?auto_283026 ?auto_283029 ) ) ( not ( = ?auto_283026 ?auto_283030 ) ) ( not ( = ?auto_283026 ?auto_283031 ) ) ( not ( = ?auto_283026 ?auto_283032 ) ) ( not ( = ?auto_283026 ?auto_283033 ) ) ( not ( = ?auto_283027 ?auto_283028 ) ) ( not ( = ?auto_283027 ?auto_283029 ) ) ( not ( = ?auto_283027 ?auto_283030 ) ) ( not ( = ?auto_283027 ?auto_283031 ) ) ( not ( = ?auto_283027 ?auto_283032 ) ) ( not ( = ?auto_283027 ?auto_283033 ) ) ( not ( = ?auto_283028 ?auto_283029 ) ) ( not ( = ?auto_283028 ?auto_283030 ) ) ( not ( = ?auto_283028 ?auto_283031 ) ) ( not ( = ?auto_283028 ?auto_283032 ) ) ( not ( = ?auto_283028 ?auto_283033 ) ) ( not ( = ?auto_283029 ?auto_283030 ) ) ( not ( = ?auto_283029 ?auto_283031 ) ) ( not ( = ?auto_283029 ?auto_283032 ) ) ( not ( = ?auto_283029 ?auto_283033 ) ) ( not ( = ?auto_283030 ?auto_283031 ) ) ( not ( = ?auto_283030 ?auto_283032 ) ) ( not ( = ?auto_283030 ?auto_283033 ) ) ( not ( = ?auto_283031 ?auto_283032 ) ) ( not ( = ?auto_283031 ?auto_283033 ) ) ( not ( = ?auto_283032 ?auto_283033 ) ) ( ON ?auto_283031 ?auto_283032 ) ( ON ?auto_283030 ?auto_283031 ) ( ON ?auto_283029 ?auto_283030 ) ( ON ?auto_283028 ?auto_283029 ) ( ON ?auto_283027 ?auto_283028 ) ( CLEAR ?auto_283025 ) ( ON ?auto_283026 ?auto_283027 ) ( CLEAR ?auto_283026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_283019 ?auto_283020 ?auto_283021 ?auto_283022 ?auto_283023 ?auto_283024 ?auto_283025 ?auto_283026 )
      ( MAKE-14PILE ?auto_283019 ?auto_283020 ?auto_283021 ?auto_283022 ?auto_283023 ?auto_283024 ?auto_283025 ?auto_283026 ?auto_283027 ?auto_283028 ?auto_283029 ?auto_283030 ?auto_283031 ?auto_283032 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283048 - BLOCK
      ?auto_283049 - BLOCK
      ?auto_283050 - BLOCK
      ?auto_283051 - BLOCK
      ?auto_283052 - BLOCK
      ?auto_283053 - BLOCK
      ?auto_283054 - BLOCK
      ?auto_283055 - BLOCK
      ?auto_283056 - BLOCK
      ?auto_283057 - BLOCK
      ?auto_283058 - BLOCK
      ?auto_283059 - BLOCK
      ?auto_283060 - BLOCK
      ?auto_283061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283061 ) ( ON-TABLE ?auto_283048 ) ( ON ?auto_283049 ?auto_283048 ) ( ON ?auto_283050 ?auto_283049 ) ( ON ?auto_283051 ?auto_283050 ) ( ON ?auto_283052 ?auto_283051 ) ( ON ?auto_283053 ?auto_283052 ) ( ON ?auto_283054 ?auto_283053 ) ( not ( = ?auto_283048 ?auto_283049 ) ) ( not ( = ?auto_283048 ?auto_283050 ) ) ( not ( = ?auto_283048 ?auto_283051 ) ) ( not ( = ?auto_283048 ?auto_283052 ) ) ( not ( = ?auto_283048 ?auto_283053 ) ) ( not ( = ?auto_283048 ?auto_283054 ) ) ( not ( = ?auto_283048 ?auto_283055 ) ) ( not ( = ?auto_283048 ?auto_283056 ) ) ( not ( = ?auto_283048 ?auto_283057 ) ) ( not ( = ?auto_283048 ?auto_283058 ) ) ( not ( = ?auto_283048 ?auto_283059 ) ) ( not ( = ?auto_283048 ?auto_283060 ) ) ( not ( = ?auto_283048 ?auto_283061 ) ) ( not ( = ?auto_283049 ?auto_283050 ) ) ( not ( = ?auto_283049 ?auto_283051 ) ) ( not ( = ?auto_283049 ?auto_283052 ) ) ( not ( = ?auto_283049 ?auto_283053 ) ) ( not ( = ?auto_283049 ?auto_283054 ) ) ( not ( = ?auto_283049 ?auto_283055 ) ) ( not ( = ?auto_283049 ?auto_283056 ) ) ( not ( = ?auto_283049 ?auto_283057 ) ) ( not ( = ?auto_283049 ?auto_283058 ) ) ( not ( = ?auto_283049 ?auto_283059 ) ) ( not ( = ?auto_283049 ?auto_283060 ) ) ( not ( = ?auto_283049 ?auto_283061 ) ) ( not ( = ?auto_283050 ?auto_283051 ) ) ( not ( = ?auto_283050 ?auto_283052 ) ) ( not ( = ?auto_283050 ?auto_283053 ) ) ( not ( = ?auto_283050 ?auto_283054 ) ) ( not ( = ?auto_283050 ?auto_283055 ) ) ( not ( = ?auto_283050 ?auto_283056 ) ) ( not ( = ?auto_283050 ?auto_283057 ) ) ( not ( = ?auto_283050 ?auto_283058 ) ) ( not ( = ?auto_283050 ?auto_283059 ) ) ( not ( = ?auto_283050 ?auto_283060 ) ) ( not ( = ?auto_283050 ?auto_283061 ) ) ( not ( = ?auto_283051 ?auto_283052 ) ) ( not ( = ?auto_283051 ?auto_283053 ) ) ( not ( = ?auto_283051 ?auto_283054 ) ) ( not ( = ?auto_283051 ?auto_283055 ) ) ( not ( = ?auto_283051 ?auto_283056 ) ) ( not ( = ?auto_283051 ?auto_283057 ) ) ( not ( = ?auto_283051 ?auto_283058 ) ) ( not ( = ?auto_283051 ?auto_283059 ) ) ( not ( = ?auto_283051 ?auto_283060 ) ) ( not ( = ?auto_283051 ?auto_283061 ) ) ( not ( = ?auto_283052 ?auto_283053 ) ) ( not ( = ?auto_283052 ?auto_283054 ) ) ( not ( = ?auto_283052 ?auto_283055 ) ) ( not ( = ?auto_283052 ?auto_283056 ) ) ( not ( = ?auto_283052 ?auto_283057 ) ) ( not ( = ?auto_283052 ?auto_283058 ) ) ( not ( = ?auto_283052 ?auto_283059 ) ) ( not ( = ?auto_283052 ?auto_283060 ) ) ( not ( = ?auto_283052 ?auto_283061 ) ) ( not ( = ?auto_283053 ?auto_283054 ) ) ( not ( = ?auto_283053 ?auto_283055 ) ) ( not ( = ?auto_283053 ?auto_283056 ) ) ( not ( = ?auto_283053 ?auto_283057 ) ) ( not ( = ?auto_283053 ?auto_283058 ) ) ( not ( = ?auto_283053 ?auto_283059 ) ) ( not ( = ?auto_283053 ?auto_283060 ) ) ( not ( = ?auto_283053 ?auto_283061 ) ) ( not ( = ?auto_283054 ?auto_283055 ) ) ( not ( = ?auto_283054 ?auto_283056 ) ) ( not ( = ?auto_283054 ?auto_283057 ) ) ( not ( = ?auto_283054 ?auto_283058 ) ) ( not ( = ?auto_283054 ?auto_283059 ) ) ( not ( = ?auto_283054 ?auto_283060 ) ) ( not ( = ?auto_283054 ?auto_283061 ) ) ( not ( = ?auto_283055 ?auto_283056 ) ) ( not ( = ?auto_283055 ?auto_283057 ) ) ( not ( = ?auto_283055 ?auto_283058 ) ) ( not ( = ?auto_283055 ?auto_283059 ) ) ( not ( = ?auto_283055 ?auto_283060 ) ) ( not ( = ?auto_283055 ?auto_283061 ) ) ( not ( = ?auto_283056 ?auto_283057 ) ) ( not ( = ?auto_283056 ?auto_283058 ) ) ( not ( = ?auto_283056 ?auto_283059 ) ) ( not ( = ?auto_283056 ?auto_283060 ) ) ( not ( = ?auto_283056 ?auto_283061 ) ) ( not ( = ?auto_283057 ?auto_283058 ) ) ( not ( = ?auto_283057 ?auto_283059 ) ) ( not ( = ?auto_283057 ?auto_283060 ) ) ( not ( = ?auto_283057 ?auto_283061 ) ) ( not ( = ?auto_283058 ?auto_283059 ) ) ( not ( = ?auto_283058 ?auto_283060 ) ) ( not ( = ?auto_283058 ?auto_283061 ) ) ( not ( = ?auto_283059 ?auto_283060 ) ) ( not ( = ?auto_283059 ?auto_283061 ) ) ( not ( = ?auto_283060 ?auto_283061 ) ) ( ON ?auto_283060 ?auto_283061 ) ( ON ?auto_283059 ?auto_283060 ) ( ON ?auto_283058 ?auto_283059 ) ( ON ?auto_283057 ?auto_283058 ) ( ON ?auto_283056 ?auto_283057 ) ( CLEAR ?auto_283054 ) ( ON ?auto_283055 ?auto_283056 ) ( CLEAR ?auto_283055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_283048 ?auto_283049 ?auto_283050 ?auto_283051 ?auto_283052 ?auto_283053 ?auto_283054 ?auto_283055 )
      ( MAKE-14PILE ?auto_283048 ?auto_283049 ?auto_283050 ?auto_283051 ?auto_283052 ?auto_283053 ?auto_283054 ?auto_283055 ?auto_283056 ?auto_283057 ?auto_283058 ?auto_283059 ?auto_283060 ?auto_283061 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283076 - BLOCK
      ?auto_283077 - BLOCK
      ?auto_283078 - BLOCK
      ?auto_283079 - BLOCK
      ?auto_283080 - BLOCK
      ?auto_283081 - BLOCK
      ?auto_283082 - BLOCK
      ?auto_283083 - BLOCK
      ?auto_283084 - BLOCK
      ?auto_283085 - BLOCK
      ?auto_283086 - BLOCK
      ?auto_283087 - BLOCK
      ?auto_283088 - BLOCK
      ?auto_283089 - BLOCK
    )
    :vars
    (
      ?auto_283090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283089 ?auto_283090 ) ( ON-TABLE ?auto_283076 ) ( ON ?auto_283077 ?auto_283076 ) ( ON ?auto_283078 ?auto_283077 ) ( ON ?auto_283079 ?auto_283078 ) ( ON ?auto_283080 ?auto_283079 ) ( ON ?auto_283081 ?auto_283080 ) ( not ( = ?auto_283076 ?auto_283077 ) ) ( not ( = ?auto_283076 ?auto_283078 ) ) ( not ( = ?auto_283076 ?auto_283079 ) ) ( not ( = ?auto_283076 ?auto_283080 ) ) ( not ( = ?auto_283076 ?auto_283081 ) ) ( not ( = ?auto_283076 ?auto_283082 ) ) ( not ( = ?auto_283076 ?auto_283083 ) ) ( not ( = ?auto_283076 ?auto_283084 ) ) ( not ( = ?auto_283076 ?auto_283085 ) ) ( not ( = ?auto_283076 ?auto_283086 ) ) ( not ( = ?auto_283076 ?auto_283087 ) ) ( not ( = ?auto_283076 ?auto_283088 ) ) ( not ( = ?auto_283076 ?auto_283089 ) ) ( not ( = ?auto_283076 ?auto_283090 ) ) ( not ( = ?auto_283077 ?auto_283078 ) ) ( not ( = ?auto_283077 ?auto_283079 ) ) ( not ( = ?auto_283077 ?auto_283080 ) ) ( not ( = ?auto_283077 ?auto_283081 ) ) ( not ( = ?auto_283077 ?auto_283082 ) ) ( not ( = ?auto_283077 ?auto_283083 ) ) ( not ( = ?auto_283077 ?auto_283084 ) ) ( not ( = ?auto_283077 ?auto_283085 ) ) ( not ( = ?auto_283077 ?auto_283086 ) ) ( not ( = ?auto_283077 ?auto_283087 ) ) ( not ( = ?auto_283077 ?auto_283088 ) ) ( not ( = ?auto_283077 ?auto_283089 ) ) ( not ( = ?auto_283077 ?auto_283090 ) ) ( not ( = ?auto_283078 ?auto_283079 ) ) ( not ( = ?auto_283078 ?auto_283080 ) ) ( not ( = ?auto_283078 ?auto_283081 ) ) ( not ( = ?auto_283078 ?auto_283082 ) ) ( not ( = ?auto_283078 ?auto_283083 ) ) ( not ( = ?auto_283078 ?auto_283084 ) ) ( not ( = ?auto_283078 ?auto_283085 ) ) ( not ( = ?auto_283078 ?auto_283086 ) ) ( not ( = ?auto_283078 ?auto_283087 ) ) ( not ( = ?auto_283078 ?auto_283088 ) ) ( not ( = ?auto_283078 ?auto_283089 ) ) ( not ( = ?auto_283078 ?auto_283090 ) ) ( not ( = ?auto_283079 ?auto_283080 ) ) ( not ( = ?auto_283079 ?auto_283081 ) ) ( not ( = ?auto_283079 ?auto_283082 ) ) ( not ( = ?auto_283079 ?auto_283083 ) ) ( not ( = ?auto_283079 ?auto_283084 ) ) ( not ( = ?auto_283079 ?auto_283085 ) ) ( not ( = ?auto_283079 ?auto_283086 ) ) ( not ( = ?auto_283079 ?auto_283087 ) ) ( not ( = ?auto_283079 ?auto_283088 ) ) ( not ( = ?auto_283079 ?auto_283089 ) ) ( not ( = ?auto_283079 ?auto_283090 ) ) ( not ( = ?auto_283080 ?auto_283081 ) ) ( not ( = ?auto_283080 ?auto_283082 ) ) ( not ( = ?auto_283080 ?auto_283083 ) ) ( not ( = ?auto_283080 ?auto_283084 ) ) ( not ( = ?auto_283080 ?auto_283085 ) ) ( not ( = ?auto_283080 ?auto_283086 ) ) ( not ( = ?auto_283080 ?auto_283087 ) ) ( not ( = ?auto_283080 ?auto_283088 ) ) ( not ( = ?auto_283080 ?auto_283089 ) ) ( not ( = ?auto_283080 ?auto_283090 ) ) ( not ( = ?auto_283081 ?auto_283082 ) ) ( not ( = ?auto_283081 ?auto_283083 ) ) ( not ( = ?auto_283081 ?auto_283084 ) ) ( not ( = ?auto_283081 ?auto_283085 ) ) ( not ( = ?auto_283081 ?auto_283086 ) ) ( not ( = ?auto_283081 ?auto_283087 ) ) ( not ( = ?auto_283081 ?auto_283088 ) ) ( not ( = ?auto_283081 ?auto_283089 ) ) ( not ( = ?auto_283081 ?auto_283090 ) ) ( not ( = ?auto_283082 ?auto_283083 ) ) ( not ( = ?auto_283082 ?auto_283084 ) ) ( not ( = ?auto_283082 ?auto_283085 ) ) ( not ( = ?auto_283082 ?auto_283086 ) ) ( not ( = ?auto_283082 ?auto_283087 ) ) ( not ( = ?auto_283082 ?auto_283088 ) ) ( not ( = ?auto_283082 ?auto_283089 ) ) ( not ( = ?auto_283082 ?auto_283090 ) ) ( not ( = ?auto_283083 ?auto_283084 ) ) ( not ( = ?auto_283083 ?auto_283085 ) ) ( not ( = ?auto_283083 ?auto_283086 ) ) ( not ( = ?auto_283083 ?auto_283087 ) ) ( not ( = ?auto_283083 ?auto_283088 ) ) ( not ( = ?auto_283083 ?auto_283089 ) ) ( not ( = ?auto_283083 ?auto_283090 ) ) ( not ( = ?auto_283084 ?auto_283085 ) ) ( not ( = ?auto_283084 ?auto_283086 ) ) ( not ( = ?auto_283084 ?auto_283087 ) ) ( not ( = ?auto_283084 ?auto_283088 ) ) ( not ( = ?auto_283084 ?auto_283089 ) ) ( not ( = ?auto_283084 ?auto_283090 ) ) ( not ( = ?auto_283085 ?auto_283086 ) ) ( not ( = ?auto_283085 ?auto_283087 ) ) ( not ( = ?auto_283085 ?auto_283088 ) ) ( not ( = ?auto_283085 ?auto_283089 ) ) ( not ( = ?auto_283085 ?auto_283090 ) ) ( not ( = ?auto_283086 ?auto_283087 ) ) ( not ( = ?auto_283086 ?auto_283088 ) ) ( not ( = ?auto_283086 ?auto_283089 ) ) ( not ( = ?auto_283086 ?auto_283090 ) ) ( not ( = ?auto_283087 ?auto_283088 ) ) ( not ( = ?auto_283087 ?auto_283089 ) ) ( not ( = ?auto_283087 ?auto_283090 ) ) ( not ( = ?auto_283088 ?auto_283089 ) ) ( not ( = ?auto_283088 ?auto_283090 ) ) ( not ( = ?auto_283089 ?auto_283090 ) ) ( ON ?auto_283088 ?auto_283089 ) ( ON ?auto_283087 ?auto_283088 ) ( ON ?auto_283086 ?auto_283087 ) ( ON ?auto_283085 ?auto_283086 ) ( ON ?auto_283084 ?auto_283085 ) ( ON ?auto_283083 ?auto_283084 ) ( CLEAR ?auto_283081 ) ( ON ?auto_283082 ?auto_283083 ) ( CLEAR ?auto_283082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_283076 ?auto_283077 ?auto_283078 ?auto_283079 ?auto_283080 ?auto_283081 ?auto_283082 )
      ( MAKE-14PILE ?auto_283076 ?auto_283077 ?auto_283078 ?auto_283079 ?auto_283080 ?auto_283081 ?auto_283082 ?auto_283083 ?auto_283084 ?auto_283085 ?auto_283086 ?auto_283087 ?auto_283088 ?auto_283089 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283105 - BLOCK
      ?auto_283106 - BLOCK
      ?auto_283107 - BLOCK
      ?auto_283108 - BLOCK
      ?auto_283109 - BLOCK
      ?auto_283110 - BLOCK
      ?auto_283111 - BLOCK
      ?auto_283112 - BLOCK
      ?auto_283113 - BLOCK
      ?auto_283114 - BLOCK
      ?auto_283115 - BLOCK
      ?auto_283116 - BLOCK
      ?auto_283117 - BLOCK
      ?auto_283118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283118 ) ( ON-TABLE ?auto_283105 ) ( ON ?auto_283106 ?auto_283105 ) ( ON ?auto_283107 ?auto_283106 ) ( ON ?auto_283108 ?auto_283107 ) ( ON ?auto_283109 ?auto_283108 ) ( ON ?auto_283110 ?auto_283109 ) ( not ( = ?auto_283105 ?auto_283106 ) ) ( not ( = ?auto_283105 ?auto_283107 ) ) ( not ( = ?auto_283105 ?auto_283108 ) ) ( not ( = ?auto_283105 ?auto_283109 ) ) ( not ( = ?auto_283105 ?auto_283110 ) ) ( not ( = ?auto_283105 ?auto_283111 ) ) ( not ( = ?auto_283105 ?auto_283112 ) ) ( not ( = ?auto_283105 ?auto_283113 ) ) ( not ( = ?auto_283105 ?auto_283114 ) ) ( not ( = ?auto_283105 ?auto_283115 ) ) ( not ( = ?auto_283105 ?auto_283116 ) ) ( not ( = ?auto_283105 ?auto_283117 ) ) ( not ( = ?auto_283105 ?auto_283118 ) ) ( not ( = ?auto_283106 ?auto_283107 ) ) ( not ( = ?auto_283106 ?auto_283108 ) ) ( not ( = ?auto_283106 ?auto_283109 ) ) ( not ( = ?auto_283106 ?auto_283110 ) ) ( not ( = ?auto_283106 ?auto_283111 ) ) ( not ( = ?auto_283106 ?auto_283112 ) ) ( not ( = ?auto_283106 ?auto_283113 ) ) ( not ( = ?auto_283106 ?auto_283114 ) ) ( not ( = ?auto_283106 ?auto_283115 ) ) ( not ( = ?auto_283106 ?auto_283116 ) ) ( not ( = ?auto_283106 ?auto_283117 ) ) ( not ( = ?auto_283106 ?auto_283118 ) ) ( not ( = ?auto_283107 ?auto_283108 ) ) ( not ( = ?auto_283107 ?auto_283109 ) ) ( not ( = ?auto_283107 ?auto_283110 ) ) ( not ( = ?auto_283107 ?auto_283111 ) ) ( not ( = ?auto_283107 ?auto_283112 ) ) ( not ( = ?auto_283107 ?auto_283113 ) ) ( not ( = ?auto_283107 ?auto_283114 ) ) ( not ( = ?auto_283107 ?auto_283115 ) ) ( not ( = ?auto_283107 ?auto_283116 ) ) ( not ( = ?auto_283107 ?auto_283117 ) ) ( not ( = ?auto_283107 ?auto_283118 ) ) ( not ( = ?auto_283108 ?auto_283109 ) ) ( not ( = ?auto_283108 ?auto_283110 ) ) ( not ( = ?auto_283108 ?auto_283111 ) ) ( not ( = ?auto_283108 ?auto_283112 ) ) ( not ( = ?auto_283108 ?auto_283113 ) ) ( not ( = ?auto_283108 ?auto_283114 ) ) ( not ( = ?auto_283108 ?auto_283115 ) ) ( not ( = ?auto_283108 ?auto_283116 ) ) ( not ( = ?auto_283108 ?auto_283117 ) ) ( not ( = ?auto_283108 ?auto_283118 ) ) ( not ( = ?auto_283109 ?auto_283110 ) ) ( not ( = ?auto_283109 ?auto_283111 ) ) ( not ( = ?auto_283109 ?auto_283112 ) ) ( not ( = ?auto_283109 ?auto_283113 ) ) ( not ( = ?auto_283109 ?auto_283114 ) ) ( not ( = ?auto_283109 ?auto_283115 ) ) ( not ( = ?auto_283109 ?auto_283116 ) ) ( not ( = ?auto_283109 ?auto_283117 ) ) ( not ( = ?auto_283109 ?auto_283118 ) ) ( not ( = ?auto_283110 ?auto_283111 ) ) ( not ( = ?auto_283110 ?auto_283112 ) ) ( not ( = ?auto_283110 ?auto_283113 ) ) ( not ( = ?auto_283110 ?auto_283114 ) ) ( not ( = ?auto_283110 ?auto_283115 ) ) ( not ( = ?auto_283110 ?auto_283116 ) ) ( not ( = ?auto_283110 ?auto_283117 ) ) ( not ( = ?auto_283110 ?auto_283118 ) ) ( not ( = ?auto_283111 ?auto_283112 ) ) ( not ( = ?auto_283111 ?auto_283113 ) ) ( not ( = ?auto_283111 ?auto_283114 ) ) ( not ( = ?auto_283111 ?auto_283115 ) ) ( not ( = ?auto_283111 ?auto_283116 ) ) ( not ( = ?auto_283111 ?auto_283117 ) ) ( not ( = ?auto_283111 ?auto_283118 ) ) ( not ( = ?auto_283112 ?auto_283113 ) ) ( not ( = ?auto_283112 ?auto_283114 ) ) ( not ( = ?auto_283112 ?auto_283115 ) ) ( not ( = ?auto_283112 ?auto_283116 ) ) ( not ( = ?auto_283112 ?auto_283117 ) ) ( not ( = ?auto_283112 ?auto_283118 ) ) ( not ( = ?auto_283113 ?auto_283114 ) ) ( not ( = ?auto_283113 ?auto_283115 ) ) ( not ( = ?auto_283113 ?auto_283116 ) ) ( not ( = ?auto_283113 ?auto_283117 ) ) ( not ( = ?auto_283113 ?auto_283118 ) ) ( not ( = ?auto_283114 ?auto_283115 ) ) ( not ( = ?auto_283114 ?auto_283116 ) ) ( not ( = ?auto_283114 ?auto_283117 ) ) ( not ( = ?auto_283114 ?auto_283118 ) ) ( not ( = ?auto_283115 ?auto_283116 ) ) ( not ( = ?auto_283115 ?auto_283117 ) ) ( not ( = ?auto_283115 ?auto_283118 ) ) ( not ( = ?auto_283116 ?auto_283117 ) ) ( not ( = ?auto_283116 ?auto_283118 ) ) ( not ( = ?auto_283117 ?auto_283118 ) ) ( ON ?auto_283117 ?auto_283118 ) ( ON ?auto_283116 ?auto_283117 ) ( ON ?auto_283115 ?auto_283116 ) ( ON ?auto_283114 ?auto_283115 ) ( ON ?auto_283113 ?auto_283114 ) ( ON ?auto_283112 ?auto_283113 ) ( CLEAR ?auto_283110 ) ( ON ?auto_283111 ?auto_283112 ) ( CLEAR ?auto_283111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_283105 ?auto_283106 ?auto_283107 ?auto_283108 ?auto_283109 ?auto_283110 ?auto_283111 )
      ( MAKE-14PILE ?auto_283105 ?auto_283106 ?auto_283107 ?auto_283108 ?auto_283109 ?auto_283110 ?auto_283111 ?auto_283112 ?auto_283113 ?auto_283114 ?auto_283115 ?auto_283116 ?auto_283117 ?auto_283118 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283133 - BLOCK
      ?auto_283134 - BLOCK
      ?auto_283135 - BLOCK
      ?auto_283136 - BLOCK
      ?auto_283137 - BLOCK
      ?auto_283138 - BLOCK
      ?auto_283139 - BLOCK
      ?auto_283140 - BLOCK
      ?auto_283141 - BLOCK
      ?auto_283142 - BLOCK
      ?auto_283143 - BLOCK
      ?auto_283144 - BLOCK
      ?auto_283145 - BLOCK
      ?auto_283146 - BLOCK
    )
    :vars
    (
      ?auto_283147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283146 ?auto_283147 ) ( ON-TABLE ?auto_283133 ) ( ON ?auto_283134 ?auto_283133 ) ( ON ?auto_283135 ?auto_283134 ) ( ON ?auto_283136 ?auto_283135 ) ( ON ?auto_283137 ?auto_283136 ) ( not ( = ?auto_283133 ?auto_283134 ) ) ( not ( = ?auto_283133 ?auto_283135 ) ) ( not ( = ?auto_283133 ?auto_283136 ) ) ( not ( = ?auto_283133 ?auto_283137 ) ) ( not ( = ?auto_283133 ?auto_283138 ) ) ( not ( = ?auto_283133 ?auto_283139 ) ) ( not ( = ?auto_283133 ?auto_283140 ) ) ( not ( = ?auto_283133 ?auto_283141 ) ) ( not ( = ?auto_283133 ?auto_283142 ) ) ( not ( = ?auto_283133 ?auto_283143 ) ) ( not ( = ?auto_283133 ?auto_283144 ) ) ( not ( = ?auto_283133 ?auto_283145 ) ) ( not ( = ?auto_283133 ?auto_283146 ) ) ( not ( = ?auto_283133 ?auto_283147 ) ) ( not ( = ?auto_283134 ?auto_283135 ) ) ( not ( = ?auto_283134 ?auto_283136 ) ) ( not ( = ?auto_283134 ?auto_283137 ) ) ( not ( = ?auto_283134 ?auto_283138 ) ) ( not ( = ?auto_283134 ?auto_283139 ) ) ( not ( = ?auto_283134 ?auto_283140 ) ) ( not ( = ?auto_283134 ?auto_283141 ) ) ( not ( = ?auto_283134 ?auto_283142 ) ) ( not ( = ?auto_283134 ?auto_283143 ) ) ( not ( = ?auto_283134 ?auto_283144 ) ) ( not ( = ?auto_283134 ?auto_283145 ) ) ( not ( = ?auto_283134 ?auto_283146 ) ) ( not ( = ?auto_283134 ?auto_283147 ) ) ( not ( = ?auto_283135 ?auto_283136 ) ) ( not ( = ?auto_283135 ?auto_283137 ) ) ( not ( = ?auto_283135 ?auto_283138 ) ) ( not ( = ?auto_283135 ?auto_283139 ) ) ( not ( = ?auto_283135 ?auto_283140 ) ) ( not ( = ?auto_283135 ?auto_283141 ) ) ( not ( = ?auto_283135 ?auto_283142 ) ) ( not ( = ?auto_283135 ?auto_283143 ) ) ( not ( = ?auto_283135 ?auto_283144 ) ) ( not ( = ?auto_283135 ?auto_283145 ) ) ( not ( = ?auto_283135 ?auto_283146 ) ) ( not ( = ?auto_283135 ?auto_283147 ) ) ( not ( = ?auto_283136 ?auto_283137 ) ) ( not ( = ?auto_283136 ?auto_283138 ) ) ( not ( = ?auto_283136 ?auto_283139 ) ) ( not ( = ?auto_283136 ?auto_283140 ) ) ( not ( = ?auto_283136 ?auto_283141 ) ) ( not ( = ?auto_283136 ?auto_283142 ) ) ( not ( = ?auto_283136 ?auto_283143 ) ) ( not ( = ?auto_283136 ?auto_283144 ) ) ( not ( = ?auto_283136 ?auto_283145 ) ) ( not ( = ?auto_283136 ?auto_283146 ) ) ( not ( = ?auto_283136 ?auto_283147 ) ) ( not ( = ?auto_283137 ?auto_283138 ) ) ( not ( = ?auto_283137 ?auto_283139 ) ) ( not ( = ?auto_283137 ?auto_283140 ) ) ( not ( = ?auto_283137 ?auto_283141 ) ) ( not ( = ?auto_283137 ?auto_283142 ) ) ( not ( = ?auto_283137 ?auto_283143 ) ) ( not ( = ?auto_283137 ?auto_283144 ) ) ( not ( = ?auto_283137 ?auto_283145 ) ) ( not ( = ?auto_283137 ?auto_283146 ) ) ( not ( = ?auto_283137 ?auto_283147 ) ) ( not ( = ?auto_283138 ?auto_283139 ) ) ( not ( = ?auto_283138 ?auto_283140 ) ) ( not ( = ?auto_283138 ?auto_283141 ) ) ( not ( = ?auto_283138 ?auto_283142 ) ) ( not ( = ?auto_283138 ?auto_283143 ) ) ( not ( = ?auto_283138 ?auto_283144 ) ) ( not ( = ?auto_283138 ?auto_283145 ) ) ( not ( = ?auto_283138 ?auto_283146 ) ) ( not ( = ?auto_283138 ?auto_283147 ) ) ( not ( = ?auto_283139 ?auto_283140 ) ) ( not ( = ?auto_283139 ?auto_283141 ) ) ( not ( = ?auto_283139 ?auto_283142 ) ) ( not ( = ?auto_283139 ?auto_283143 ) ) ( not ( = ?auto_283139 ?auto_283144 ) ) ( not ( = ?auto_283139 ?auto_283145 ) ) ( not ( = ?auto_283139 ?auto_283146 ) ) ( not ( = ?auto_283139 ?auto_283147 ) ) ( not ( = ?auto_283140 ?auto_283141 ) ) ( not ( = ?auto_283140 ?auto_283142 ) ) ( not ( = ?auto_283140 ?auto_283143 ) ) ( not ( = ?auto_283140 ?auto_283144 ) ) ( not ( = ?auto_283140 ?auto_283145 ) ) ( not ( = ?auto_283140 ?auto_283146 ) ) ( not ( = ?auto_283140 ?auto_283147 ) ) ( not ( = ?auto_283141 ?auto_283142 ) ) ( not ( = ?auto_283141 ?auto_283143 ) ) ( not ( = ?auto_283141 ?auto_283144 ) ) ( not ( = ?auto_283141 ?auto_283145 ) ) ( not ( = ?auto_283141 ?auto_283146 ) ) ( not ( = ?auto_283141 ?auto_283147 ) ) ( not ( = ?auto_283142 ?auto_283143 ) ) ( not ( = ?auto_283142 ?auto_283144 ) ) ( not ( = ?auto_283142 ?auto_283145 ) ) ( not ( = ?auto_283142 ?auto_283146 ) ) ( not ( = ?auto_283142 ?auto_283147 ) ) ( not ( = ?auto_283143 ?auto_283144 ) ) ( not ( = ?auto_283143 ?auto_283145 ) ) ( not ( = ?auto_283143 ?auto_283146 ) ) ( not ( = ?auto_283143 ?auto_283147 ) ) ( not ( = ?auto_283144 ?auto_283145 ) ) ( not ( = ?auto_283144 ?auto_283146 ) ) ( not ( = ?auto_283144 ?auto_283147 ) ) ( not ( = ?auto_283145 ?auto_283146 ) ) ( not ( = ?auto_283145 ?auto_283147 ) ) ( not ( = ?auto_283146 ?auto_283147 ) ) ( ON ?auto_283145 ?auto_283146 ) ( ON ?auto_283144 ?auto_283145 ) ( ON ?auto_283143 ?auto_283144 ) ( ON ?auto_283142 ?auto_283143 ) ( ON ?auto_283141 ?auto_283142 ) ( ON ?auto_283140 ?auto_283141 ) ( ON ?auto_283139 ?auto_283140 ) ( CLEAR ?auto_283137 ) ( ON ?auto_283138 ?auto_283139 ) ( CLEAR ?auto_283138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_283133 ?auto_283134 ?auto_283135 ?auto_283136 ?auto_283137 ?auto_283138 )
      ( MAKE-14PILE ?auto_283133 ?auto_283134 ?auto_283135 ?auto_283136 ?auto_283137 ?auto_283138 ?auto_283139 ?auto_283140 ?auto_283141 ?auto_283142 ?auto_283143 ?auto_283144 ?auto_283145 ?auto_283146 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283162 - BLOCK
      ?auto_283163 - BLOCK
      ?auto_283164 - BLOCK
      ?auto_283165 - BLOCK
      ?auto_283166 - BLOCK
      ?auto_283167 - BLOCK
      ?auto_283168 - BLOCK
      ?auto_283169 - BLOCK
      ?auto_283170 - BLOCK
      ?auto_283171 - BLOCK
      ?auto_283172 - BLOCK
      ?auto_283173 - BLOCK
      ?auto_283174 - BLOCK
      ?auto_283175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283175 ) ( ON-TABLE ?auto_283162 ) ( ON ?auto_283163 ?auto_283162 ) ( ON ?auto_283164 ?auto_283163 ) ( ON ?auto_283165 ?auto_283164 ) ( ON ?auto_283166 ?auto_283165 ) ( not ( = ?auto_283162 ?auto_283163 ) ) ( not ( = ?auto_283162 ?auto_283164 ) ) ( not ( = ?auto_283162 ?auto_283165 ) ) ( not ( = ?auto_283162 ?auto_283166 ) ) ( not ( = ?auto_283162 ?auto_283167 ) ) ( not ( = ?auto_283162 ?auto_283168 ) ) ( not ( = ?auto_283162 ?auto_283169 ) ) ( not ( = ?auto_283162 ?auto_283170 ) ) ( not ( = ?auto_283162 ?auto_283171 ) ) ( not ( = ?auto_283162 ?auto_283172 ) ) ( not ( = ?auto_283162 ?auto_283173 ) ) ( not ( = ?auto_283162 ?auto_283174 ) ) ( not ( = ?auto_283162 ?auto_283175 ) ) ( not ( = ?auto_283163 ?auto_283164 ) ) ( not ( = ?auto_283163 ?auto_283165 ) ) ( not ( = ?auto_283163 ?auto_283166 ) ) ( not ( = ?auto_283163 ?auto_283167 ) ) ( not ( = ?auto_283163 ?auto_283168 ) ) ( not ( = ?auto_283163 ?auto_283169 ) ) ( not ( = ?auto_283163 ?auto_283170 ) ) ( not ( = ?auto_283163 ?auto_283171 ) ) ( not ( = ?auto_283163 ?auto_283172 ) ) ( not ( = ?auto_283163 ?auto_283173 ) ) ( not ( = ?auto_283163 ?auto_283174 ) ) ( not ( = ?auto_283163 ?auto_283175 ) ) ( not ( = ?auto_283164 ?auto_283165 ) ) ( not ( = ?auto_283164 ?auto_283166 ) ) ( not ( = ?auto_283164 ?auto_283167 ) ) ( not ( = ?auto_283164 ?auto_283168 ) ) ( not ( = ?auto_283164 ?auto_283169 ) ) ( not ( = ?auto_283164 ?auto_283170 ) ) ( not ( = ?auto_283164 ?auto_283171 ) ) ( not ( = ?auto_283164 ?auto_283172 ) ) ( not ( = ?auto_283164 ?auto_283173 ) ) ( not ( = ?auto_283164 ?auto_283174 ) ) ( not ( = ?auto_283164 ?auto_283175 ) ) ( not ( = ?auto_283165 ?auto_283166 ) ) ( not ( = ?auto_283165 ?auto_283167 ) ) ( not ( = ?auto_283165 ?auto_283168 ) ) ( not ( = ?auto_283165 ?auto_283169 ) ) ( not ( = ?auto_283165 ?auto_283170 ) ) ( not ( = ?auto_283165 ?auto_283171 ) ) ( not ( = ?auto_283165 ?auto_283172 ) ) ( not ( = ?auto_283165 ?auto_283173 ) ) ( not ( = ?auto_283165 ?auto_283174 ) ) ( not ( = ?auto_283165 ?auto_283175 ) ) ( not ( = ?auto_283166 ?auto_283167 ) ) ( not ( = ?auto_283166 ?auto_283168 ) ) ( not ( = ?auto_283166 ?auto_283169 ) ) ( not ( = ?auto_283166 ?auto_283170 ) ) ( not ( = ?auto_283166 ?auto_283171 ) ) ( not ( = ?auto_283166 ?auto_283172 ) ) ( not ( = ?auto_283166 ?auto_283173 ) ) ( not ( = ?auto_283166 ?auto_283174 ) ) ( not ( = ?auto_283166 ?auto_283175 ) ) ( not ( = ?auto_283167 ?auto_283168 ) ) ( not ( = ?auto_283167 ?auto_283169 ) ) ( not ( = ?auto_283167 ?auto_283170 ) ) ( not ( = ?auto_283167 ?auto_283171 ) ) ( not ( = ?auto_283167 ?auto_283172 ) ) ( not ( = ?auto_283167 ?auto_283173 ) ) ( not ( = ?auto_283167 ?auto_283174 ) ) ( not ( = ?auto_283167 ?auto_283175 ) ) ( not ( = ?auto_283168 ?auto_283169 ) ) ( not ( = ?auto_283168 ?auto_283170 ) ) ( not ( = ?auto_283168 ?auto_283171 ) ) ( not ( = ?auto_283168 ?auto_283172 ) ) ( not ( = ?auto_283168 ?auto_283173 ) ) ( not ( = ?auto_283168 ?auto_283174 ) ) ( not ( = ?auto_283168 ?auto_283175 ) ) ( not ( = ?auto_283169 ?auto_283170 ) ) ( not ( = ?auto_283169 ?auto_283171 ) ) ( not ( = ?auto_283169 ?auto_283172 ) ) ( not ( = ?auto_283169 ?auto_283173 ) ) ( not ( = ?auto_283169 ?auto_283174 ) ) ( not ( = ?auto_283169 ?auto_283175 ) ) ( not ( = ?auto_283170 ?auto_283171 ) ) ( not ( = ?auto_283170 ?auto_283172 ) ) ( not ( = ?auto_283170 ?auto_283173 ) ) ( not ( = ?auto_283170 ?auto_283174 ) ) ( not ( = ?auto_283170 ?auto_283175 ) ) ( not ( = ?auto_283171 ?auto_283172 ) ) ( not ( = ?auto_283171 ?auto_283173 ) ) ( not ( = ?auto_283171 ?auto_283174 ) ) ( not ( = ?auto_283171 ?auto_283175 ) ) ( not ( = ?auto_283172 ?auto_283173 ) ) ( not ( = ?auto_283172 ?auto_283174 ) ) ( not ( = ?auto_283172 ?auto_283175 ) ) ( not ( = ?auto_283173 ?auto_283174 ) ) ( not ( = ?auto_283173 ?auto_283175 ) ) ( not ( = ?auto_283174 ?auto_283175 ) ) ( ON ?auto_283174 ?auto_283175 ) ( ON ?auto_283173 ?auto_283174 ) ( ON ?auto_283172 ?auto_283173 ) ( ON ?auto_283171 ?auto_283172 ) ( ON ?auto_283170 ?auto_283171 ) ( ON ?auto_283169 ?auto_283170 ) ( ON ?auto_283168 ?auto_283169 ) ( CLEAR ?auto_283166 ) ( ON ?auto_283167 ?auto_283168 ) ( CLEAR ?auto_283167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_283162 ?auto_283163 ?auto_283164 ?auto_283165 ?auto_283166 ?auto_283167 )
      ( MAKE-14PILE ?auto_283162 ?auto_283163 ?auto_283164 ?auto_283165 ?auto_283166 ?auto_283167 ?auto_283168 ?auto_283169 ?auto_283170 ?auto_283171 ?auto_283172 ?auto_283173 ?auto_283174 ?auto_283175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283190 - BLOCK
      ?auto_283191 - BLOCK
      ?auto_283192 - BLOCK
      ?auto_283193 - BLOCK
      ?auto_283194 - BLOCK
      ?auto_283195 - BLOCK
      ?auto_283196 - BLOCK
      ?auto_283197 - BLOCK
      ?auto_283198 - BLOCK
      ?auto_283199 - BLOCK
      ?auto_283200 - BLOCK
      ?auto_283201 - BLOCK
      ?auto_283202 - BLOCK
      ?auto_283203 - BLOCK
    )
    :vars
    (
      ?auto_283204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283203 ?auto_283204 ) ( ON-TABLE ?auto_283190 ) ( ON ?auto_283191 ?auto_283190 ) ( ON ?auto_283192 ?auto_283191 ) ( ON ?auto_283193 ?auto_283192 ) ( not ( = ?auto_283190 ?auto_283191 ) ) ( not ( = ?auto_283190 ?auto_283192 ) ) ( not ( = ?auto_283190 ?auto_283193 ) ) ( not ( = ?auto_283190 ?auto_283194 ) ) ( not ( = ?auto_283190 ?auto_283195 ) ) ( not ( = ?auto_283190 ?auto_283196 ) ) ( not ( = ?auto_283190 ?auto_283197 ) ) ( not ( = ?auto_283190 ?auto_283198 ) ) ( not ( = ?auto_283190 ?auto_283199 ) ) ( not ( = ?auto_283190 ?auto_283200 ) ) ( not ( = ?auto_283190 ?auto_283201 ) ) ( not ( = ?auto_283190 ?auto_283202 ) ) ( not ( = ?auto_283190 ?auto_283203 ) ) ( not ( = ?auto_283190 ?auto_283204 ) ) ( not ( = ?auto_283191 ?auto_283192 ) ) ( not ( = ?auto_283191 ?auto_283193 ) ) ( not ( = ?auto_283191 ?auto_283194 ) ) ( not ( = ?auto_283191 ?auto_283195 ) ) ( not ( = ?auto_283191 ?auto_283196 ) ) ( not ( = ?auto_283191 ?auto_283197 ) ) ( not ( = ?auto_283191 ?auto_283198 ) ) ( not ( = ?auto_283191 ?auto_283199 ) ) ( not ( = ?auto_283191 ?auto_283200 ) ) ( not ( = ?auto_283191 ?auto_283201 ) ) ( not ( = ?auto_283191 ?auto_283202 ) ) ( not ( = ?auto_283191 ?auto_283203 ) ) ( not ( = ?auto_283191 ?auto_283204 ) ) ( not ( = ?auto_283192 ?auto_283193 ) ) ( not ( = ?auto_283192 ?auto_283194 ) ) ( not ( = ?auto_283192 ?auto_283195 ) ) ( not ( = ?auto_283192 ?auto_283196 ) ) ( not ( = ?auto_283192 ?auto_283197 ) ) ( not ( = ?auto_283192 ?auto_283198 ) ) ( not ( = ?auto_283192 ?auto_283199 ) ) ( not ( = ?auto_283192 ?auto_283200 ) ) ( not ( = ?auto_283192 ?auto_283201 ) ) ( not ( = ?auto_283192 ?auto_283202 ) ) ( not ( = ?auto_283192 ?auto_283203 ) ) ( not ( = ?auto_283192 ?auto_283204 ) ) ( not ( = ?auto_283193 ?auto_283194 ) ) ( not ( = ?auto_283193 ?auto_283195 ) ) ( not ( = ?auto_283193 ?auto_283196 ) ) ( not ( = ?auto_283193 ?auto_283197 ) ) ( not ( = ?auto_283193 ?auto_283198 ) ) ( not ( = ?auto_283193 ?auto_283199 ) ) ( not ( = ?auto_283193 ?auto_283200 ) ) ( not ( = ?auto_283193 ?auto_283201 ) ) ( not ( = ?auto_283193 ?auto_283202 ) ) ( not ( = ?auto_283193 ?auto_283203 ) ) ( not ( = ?auto_283193 ?auto_283204 ) ) ( not ( = ?auto_283194 ?auto_283195 ) ) ( not ( = ?auto_283194 ?auto_283196 ) ) ( not ( = ?auto_283194 ?auto_283197 ) ) ( not ( = ?auto_283194 ?auto_283198 ) ) ( not ( = ?auto_283194 ?auto_283199 ) ) ( not ( = ?auto_283194 ?auto_283200 ) ) ( not ( = ?auto_283194 ?auto_283201 ) ) ( not ( = ?auto_283194 ?auto_283202 ) ) ( not ( = ?auto_283194 ?auto_283203 ) ) ( not ( = ?auto_283194 ?auto_283204 ) ) ( not ( = ?auto_283195 ?auto_283196 ) ) ( not ( = ?auto_283195 ?auto_283197 ) ) ( not ( = ?auto_283195 ?auto_283198 ) ) ( not ( = ?auto_283195 ?auto_283199 ) ) ( not ( = ?auto_283195 ?auto_283200 ) ) ( not ( = ?auto_283195 ?auto_283201 ) ) ( not ( = ?auto_283195 ?auto_283202 ) ) ( not ( = ?auto_283195 ?auto_283203 ) ) ( not ( = ?auto_283195 ?auto_283204 ) ) ( not ( = ?auto_283196 ?auto_283197 ) ) ( not ( = ?auto_283196 ?auto_283198 ) ) ( not ( = ?auto_283196 ?auto_283199 ) ) ( not ( = ?auto_283196 ?auto_283200 ) ) ( not ( = ?auto_283196 ?auto_283201 ) ) ( not ( = ?auto_283196 ?auto_283202 ) ) ( not ( = ?auto_283196 ?auto_283203 ) ) ( not ( = ?auto_283196 ?auto_283204 ) ) ( not ( = ?auto_283197 ?auto_283198 ) ) ( not ( = ?auto_283197 ?auto_283199 ) ) ( not ( = ?auto_283197 ?auto_283200 ) ) ( not ( = ?auto_283197 ?auto_283201 ) ) ( not ( = ?auto_283197 ?auto_283202 ) ) ( not ( = ?auto_283197 ?auto_283203 ) ) ( not ( = ?auto_283197 ?auto_283204 ) ) ( not ( = ?auto_283198 ?auto_283199 ) ) ( not ( = ?auto_283198 ?auto_283200 ) ) ( not ( = ?auto_283198 ?auto_283201 ) ) ( not ( = ?auto_283198 ?auto_283202 ) ) ( not ( = ?auto_283198 ?auto_283203 ) ) ( not ( = ?auto_283198 ?auto_283204 ) ) ( not ( = ?auto_283199 ?auto_283200 ) ) ( not ( = ?auto_283199 ?auto_283201 ) ) ( not ( = ?auto_283199 ?auto_283202 ) ) ( not ( = ?auto_283199 ?auto_283203 ) ) ( not ( = ?auto_283199 ?auto_283204 ) ) ( not ( = ?auto_283200 ?auto_283201 ) ) ( not ( = ?auto_283200 ?auto_283202 ) ) ( not ( = ?auto_283200 ?auto_283203 ) ) ( not ( = ?auto_283200 ?auto_283204 ) ) ( not ( = ?auto_283201 ?auto_283202 ) ) ( not ( = ?auto_283201 ?auto_283203 ) ) ( not ( = ?auto_283201 ?auto_283204 ) ) ( not ( = ?auto_283202 ?auto_283203 ) ) ( not ( = ?auto_283202 ?auto_283204 ) ) ( not ( = ?auto_283203 ?auto_283204 ) ) ( ON ?auto_283202 ?auto_283203 ) ( ON ?auto_283201 ?auto_283202 ) ( ON ?auto_283200 ?auto_283201 ) ( ON ?auto_283199 ?auto_283200 ) ( ON ?auto_283198 ?auto_283199 ) ( ON ?auto_283197 ?auto_283198 ) ( ON ?auto_283196 ?auto_283197 ) ( ON ?auto_283195 ?auto_283196 ) ( CLEAR ?auto_283193 ) ( ON ?auto_283194 ?auto_283195 ) ( CLEAR ?auto_283194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_283190 ?auto_283191 ?auto_283192 ?auto_283193 ?auto_283194 )
      ( MAKE-14PILE ?auto_283190 ?auto_283191 ?auto_283192 ?auto_283193 ?auto_283194 ?auto_283195 ?auto_283196 ?auto_283197 ?auto_283198 ?auto_283199 ?auto_283200 ?auto_283201 ?auto_283202 ?auto_283203 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283219 - BLOCK
      ?auto_283220 - BLOCK
      ?auto_283221 - BLOCK
      ?auto_283222 - BLOCK
      ?auto_283223 - BLOCK
      ?auto_283224 - BLOCK
      ?auto_283225 - BLOCK
      ?auto_283226 - BLOCK
      ?auto_283227 - BLOCK
      ?auto_283228 - BLOCK
      ?auto_283229 - BLOCK
      ?auto_283230 - BLOCK
      ?auto_283231 - BLOCK
      ?auto_283232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283232 ) ( ON-TABLE ?auto_283219 ) ( ON ?auto_283220 ?auto_283219 ) ( ON ?auto_283221 ?auto_283220 ) ( ON ?auto_283222 ?auto_283221 ) ( not ( = ?auto_283219 ?auto_283220 ) ) ( not ( = ?auto_283219 ?auto_283221 ) ) ( not ( = ?auto_283219 ?auto_283222 ) ) ( not ( = ?auto_283219 ?auto_283223 ) ) ( not ( = ?auto_283219 ?auto_283224 ) ) ( not ( = ?auto_283219 ?auto_283225 ) ) ( not ( = ?auto_283219 ?auto_283226 ) ) ( not ( = ?auto_283219 ?auto_283227 ) ) ( not ( = ?auto_283219 ?auto_283228 ) ) ( not ( = ?auto_283219 ?auto_283229 ) ) ( not ( = ?auto_283219 ?auto_283230 ) ) ( not ( = ?auto_283219 ?auto_283231 ) ) ( not ( = ?auto_283219 ?auto_283232 ) ) ( not ( = ?auto_283220 ?auto_283221 ) ) ( not ( = ?auto_283220 ?auto_283222 ) ) ( not ( = ?auto_283220 ?auto_283223 ) ) ( not ( = ?auto_283220 ?auto_283224 ) ) ( not ( = ?auto_283220 ?auto_283225 ) ) ( not ( = ?auto_283220 ?auto_283226 ) ) ( not ( = ?auto_283220 ?auto_283227 ) ) ( not ( = ?auto_283220 ?auto_283228 ) ) ( not ( = ?auto_283220 ?auto_283229 ) ) ( not ( = ?auto_283220 ?auto_283230 ) ) ( not ( = ?auto_283220 ?auto_283231 ) ) ( not ( = ?auto_283220 ?auto_283232 ) ) ( not ( = ?auto_283221 ?auto_283222 ) ) ( not ( = ?auto_283221 ?auto_283223 ) ) ( not ( = ?auto_283221 ?auto_283224 ) ) ( not ( = ?auto_283221 ?auto_283225 ) ) ( not ( = ?auto_283221 ?auto_283226 ) ) ( not ( = ?auto_283221 ?auto_283227 ) ) ( not ( = ?auto_283221 ?auto_283228 ) ) ( not ( = ?auto_283221 ?auto_283229 ) ) ( not ( = ?auto_283221 ?auto_283230 ) ) ( not ( = ?auto_283221 ?auto_283231 ) ) ( not ( = ?auto_283221 ?auto_283232 ) ) ( not ( = ?auto_283222 ?auto_283223 ) ) ( not ( = ?auto_283222 ?auto_283224 ) ) ( not ( = ?auto_283222 ?auto_283225 ) ) ( not ( = ?auto_283222 ?auto_283226 ) ) ( not ( = ?auto_283222 ?auto_283227 ) ) ( not ( = ?auto_283222 ?auto_283228 ) ) ( not ( = ?auto_283222 ?auto_283229 ) ) ( not ( = ?auto_283222 ?auto_283230 ) ) ( not ( = ?auto_283222 ?auto_283231 ) ) ( not ( = ?auto_283222 ?auto_283232 ) ) ( not ( = ?auto_283223 ?auto_283224 ) ) ( not ( = ?auto_283223 ?auto_283225 ) ) ( not ( = ?auto_283223 ?auto_283226 ) ) ( not ( = ?auto_283223 ?auto_283227 ) ) ( not ( = ?auto_283223 ?auto_283228 ) ) ( not ( = ?auto_283223 ?auto_283229 ) ) ( not ( = ?auto_283223 ?auto_283230 ) ) ( not ( = ?auto_283223 ?auto_283231 ) ) ( not ( = ?auto_283223 ?auto_283232 ) ) ( not ( = ?auto_283224 ?auto_283225 ) ) ( not ( = ?auto_283224 ?auto_283226 ) ) ( not ( = ?auto_283224 ?auto_283227 ) ) ( not ( = ?auto_283224 ?auto_283228 ) ) ( not ( = ?auto_283224 ?auto_283229 ) ) ( not ( = ?auto_283224 ?auto_283230 ) ) ( not ( = ?auto_283224 ?auto_283231 ) ) ( not ( = ?auto_283224 ?auto_283232 ) ) ( not ( = ?auto_283225 ?auto_283226 ) ) ( not ( = ?auto_283225 ?auto_283227 ) ) ( not ( = ?auto_283225 ?auto_283228 ) ) ( not ( = ?auto_283225 ?auto_283229 ) ) ( not ( = ?auto_283225 ?auto_283230 ) ) ( not ( = ?auto_283225 ?auto_283231 ) ) ( not ( = ?auto_283225 ?auto_283232 ) ) ( not ( = ?auto_283226 ?auto_283227 ) ) ( not ( = ?auto_283226 ?auto_283228 ) ) ( not ( = ?auto_283226 ?auto_283229 ) ) ( not ( = ?auto_283226 ?auto_283230 ) ) ( not ( = ?auto_283226 ?auto_283231 ) ) ( not ( = ?auto_283226 ?auto_283232 ) ) ( not ( = ?auto_283227 ?auto_283228 ) ) ( not ( = ?auto_283227 ?auto_283229 ) ) ( not ( = ?auto_283227 ?auto_283230 ) ) ( not ( = ?auto_283227 ?auto_283231 ) ) ( not ( = ?auto_283227 ?auto_283232 ) ) ( not ( = ?auto_283228 ?auto_283229 ) ) ( not ( = ?auto_283228 ?auto_283230 ) ) ( not ( = ?auto_283228 ?auto_283231 ) ) ( not ( = ?auto_283228 ?auto_283232 ) ) ( not ( = ?auto_283229 ?auto_283230 ) ) ( not ( = ?auto_283229 ?auto_283231 ) ) ( not ( = ?auto_283229 ?auto_283232 ) ) ( not ( = ?auto_283230 ?auto_283231 ) ) ( not ( = ?auto_283230 ?auto_283232 ) ) ( not ( = ?auto_283231 ?auto_283232 ) ) ( ON ?auto_283231 ?auto_283232 ) ( ON ?auto_283230 ?auto_283231 ) ( ON ?auto_283229 ?auto_283230 ) ( ON ?auto_283228 ?auto_283229 ) ( ON ?auto_283227 ?auto_283228 ) ( ON ?auto_283226 ?auto_283227 ) ( ON ?auto_283225 ?auto_283226 ) ( ON ?auto_283224 ?auto_283225 ) ( CLEAR ?auto_283222 ) ( ON ?auto_283223 ?auto_283224 ) ( CLEAR ?auto_283223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_283219 ?auto_283220 ?auto_283221 ?auto_283222 ?auto_283223 )
      ( MAKE-14PILE ?auto_283219 ?auto_283220 ?auto_283221 ?auto_283222 ?auto_283223 ?auto_283224 ?auto_283225 ?auto_283226 ?auto_283227 ?auto_283228 ?auto_283229 ?auto_283230 ?auto_283231 ?auto_283232 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283247 - BLOCK
      ?auto_283248 - BLOCK
      ?auto_283249 - BLOCK
      ?auto_283250 - BLOCK
      ?auto_283251 - BLOCK
      ?auto_283252 - BLOCK
      ?auto_283253 - BLOCK
      ?auto_283254 - BLOCK
      ?auto_283255 - BLOCK
      ?auto_283256 - BLOCK
      ?auto_283257 - BLOCK
      ?auto_283258 - BLOCK
      ?auto_283259 - BLOCK
      ?auto_283260 - BLOCK
    )
    :vars
    (
      ?auto_283261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283260 ?auto_283261 ) ( ON-TABLE ?auto_283247 ) ( ON ?auto_283248 ?auto_283247 ) ( ON ?auto_283249 ?auto_283248 ) ( not ( = ?auto_283247 ?auto_283248 ) ) ( not ( = ?auto_283247 ?auto_283249 ) ) ( not ( = ?auto_283247 ?auto_283250 ) ) ( not ( = ?auto_283247 ?auto_283251 ) ) ( not ( = ?auto_283247 ?auto_283252 ) ) ( not ( = ?auto_283247 ?auto_283253 ) ) ( not ( = ?auto_283247 ?auto_283254 ) ) ( not ( = ?auto_283247 ?auto_283255 ) ) ( not ( = ?auto_283247 ?auto_283256 ) ) ( not ( = ?auto_283247 ?auto_283257 ) ) ( not ( = ?auto_283247 ?auto_283258 ) ) ( not ( = ?auto_283247 ?auto_283259 ) ) ( not ( = ?auto_283247 ?auto_283260 ) ) ( not ( = ?auto_283247 ?auto_283261 ) ) ( not ( = ?auto_283248 ?auto_283249 ) ) ( not ( = ?auto_283248 ?auto_283250 ) ) ( not ( = ?auto_283248 ?auto_283251 ) ) ( not ( = ?auto_283248 ?auto_283252 ) ) ( not ( = ?auto_283248 ?auto_283253 ) ) ( not ( = ?auto_283248 ?auto_283254 ) ) ( not ( = ?auto_283248 ?auto_283255 ) ) ( not ( = ?auto_283248 ?auto_283256 ) ) ( not ( = ?auto_283248 ?auto_283257 ) ) ( not ( = ?auto_283248 ?auto_283258 ) ) ( not ( = ?auto_283248 ?auto_283259 ) ) ( not ( = ?auto_283248 ?auto_283260 ) ) ( not ( = ?auto_283248 ?auto_283261 ) ) ( not ( = ?auto_283249 ?auto_283250 ) ) ( not ( = ?auto_283249 ?auto_283251 ) ) ( not ( = ?auto_283249 ?auto_283252 ) ) ( not ( = ?auto_283249 ?auto_283253 ) ) ( not ( = ?auto_283249 ?auto_283254 ) ) ( not ( = ?auto_283249 ?auto_283255 ) ) ( not ( = ?auto_283249 ?auto_283256 ) ) ( not ( = ?auto_283249 ?auto_283257 ) ) ( not ( = ?auto_283249 ?auto_283258 ) ) ( not ( = ?auto_283249 ?auto_283259 ) ) ( not ( = ?auto_283249 ?auto_283260 ) ) ( not ( = ?auto_283249 ?auto_283261 ) ) ( not ( = ?auto_283250 ?auto_283251 ) ) ( not ( = ?auto_283250 ?auto_283252 ) ) ( not ( = ?auto_283250 ?auto_283253 ) ) ( not ( = ?auto_283250 ?auto_283254 ) ) ( not ( = ?auto_283250 ?auto_283255 ) ) ( not ( = ?auto_283250 ?auto_283256 ) ) ( not ( = ?auto_283250 ?auto_283257 ) ) ( not ( = ?auto_283250 ?auto_283258 ) ) ( not ( = ?auto_283250 ?auto_283259 ) ) ( not ( = ?auto_283250 ?auto_283260 ) ) ( not ( = ?auto_283250 ?auto_283261 ) ) ( not ( = ?auto_283251 ?auto_283252 ) ) ( not ( = ?auto_283251 ?auto_283253 ) ) ( not ( = ?auto_283251 ?auto_283254 ) ) ( not ( = ?auto_283251 ?auto_283255 ) ) ( not ( = ?auto_283251 ?auto_283256 ) ) ( not ( = ?auto_283251 ?auto_283257 ) ) ( not ( = ?auto_283251 ?auto_283258 ) ) ( not ( = ?auto_283251 ?auto_283259 ) ) ( not ( = ?auto_283251 ?auto_283260 ) ) ( not ( = ?auto_283251 ?auto_283261 ) ) ( not ( = ?auto_283252 ?auto_283253 ) ) ( not ( = ?auto_283252 ?auto_283254 ) ) ( not ( = ?auto_283252 ?auto_283255 ) ) ( not ( = ?auto_283252 ?auto_283256 ) ) ( not ( = ?auto_283252 ?auto_283257 ) ) ( not ( = ?auto_283252 ?auto_283258 ) ) ( not ( = ?auto_283252 ?auto_283259 ) ) ( not ( = ?auto_283252 ?auto_283260 ) ) ( not ( = ?auto_283252 ?auto_283261 ) ) ( not ( = ?auto_283253 ?auto_283254 ) ) ( not ( = ?auto_283253 ?auto_283255 ) ) ( not ( = ?auto_283253 ?auto_283256 ) ) ( not ( = ?auto_283253 ?auto_283257 ) ) ( not ( = ?auto_283253 ?auto_283258 ) ) ( not ( = ?auto_283253 ?auto_283259 ) ) ( not ( = ?auto_283253 ?auto_283260 ) ) ( not ( = ?auto_283253 ?auto_283261 ) ) ( not ( = ?auto_283254 ?auto_283255 ) ) ( not ( = ?auto_283254 ?auto_283256 ) ) ( not ( = ?auto_283254 ?auto_283257 ) ) ( not ( = ?auto_283254 ?auto_283258 ) ) ( not ( = ?auto_283254 ?auto_283259 ) ) ( not ( = ?auto_283254 ?auto_283260 ) ) ( not ( = ?auto_283254 ?auto_283261 ) ) ( not ( = ?auto_283255 ?auto_283256 ) ) ( not ( = ?auto_283255 ?auto_283257 ) ) ( not ( = ?auto_283255 ?auto_283258 ) ) ( not ( = ?auto_283255 ?auto_283259 ) ) ( not ( = ?auto_283255 ?auto_283260 ) ) ( not ( = ?auto_283255 ?auto_283261 ) ) ( not ( = ?auto_283256 ?auto_283257 ) ) ( not ( = ?auto_283256 ?auto_283258 ) ) ( not ( = ?auto_283256 ?auto_283259 ) ) ( not ( = ?auto_283256 ?auto_283260 ) ) ( not ( = ?auto_283256 ?auto_283261 ) ) ( not ( = ?auto_283257 ?auto_283258 ) ) ( not ( = ?auto_283257 ?auto_283259 ) ) ( not ( = ?auto_283257 ?auto_283260 ) ) ( not ( = ?auto_283257 ?auto_283261 ) ) ( not ( = ?auto_283258 ?auto_283259 ) ) ( not ( = ?auto_283258 ?auto_283260 ) ) ( not ( = ?auto_283258 ?auto_283261 ) ) ( not ( = ?auto_283259 ?auto_283260 ) ) ( not ( = ?auto_283259 ?auto_283261 ) ) ( not ( = ?auto_283260 ?auto_283261 ) ) ( ON ?auto_283259 ?auto_283260 ) ( ON ?auto_283258 ?auto_283259 ) ( ON ?auto_283257 ?auto_283258 ) ( ON ?auto_283256 ?auto_283257 ) ( ON ?auto_283255 ?auto_283256 ) ( ON ?auto_283254 ?auto_283255 ) ( ON ?auto_283253 ?auto_283254 ) ( ON ?auto_283252 ?auto_283253 ) ( ON ?auto_283251 ?auto_283252 ) ( CLEAR ?auto_283249 ) ( ON ?auto_283250 ?auto_283251 ) ( CLEAR ?auto_283250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_283247 ?auto_283248 ?auto_283249 ?auto_283250 )
      ( MAKE-14PILE ?auto_283247 ?auto_283248 ?auto_283249 ?auto_283250 ?auto_283251 ?auto_283252 ?auto_283253 ?auto_283254 ?auto_283255 ?auto_283256 ?auto_283257 ?auto_283258 ?auto_283259 ?auto_283260 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283276 - BLOCK
      ?auto_283277 - BLOCK
      ?auto_283278 - BLOCK
      ?auto_283279 - BLOCK
      ?auto_283280 - BLOCK
      ?auto_283281 - BLOCK
      ?auto_283282 - BLOCK
      ?auto_283283 - BLOCK
      ?auto_283284 - BLOCK
      ?auto_283285 - BLOCK
      ?auto_283286 - BLOCK
      ?auto_283287 - BLOCK
      ?auto_283288 - BLOCK
      ?auto_283289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283289 ) ( ON-TABLE ?auto_283276 ) ( ON ?auto_283277 ?auto_283276 ) ( ON ?auto_283278 ?auto_283277 ) ( not ( = ?auto_283276 ?auto_283277 ) ) ( not ( = ?auto_283276 ?auto_283278 ) ) ( not ( = ?auto_283276 ?auto_283279 ) ) ( not ( = ?auto_283276 ?auto_283280 ) ) ( not ( = ?auto_283276 ?auto_283281 ) ) ( not ( = ?auto_283276 ?auto_283282 ) ) ( not ( = ?auto_283276 ?auto_283283 ) ) ( not ( = ?auto_283276 ?auto_283284 ) ) ( not ( = ?auto_283276 ?auto_283285 ) ) ( not ( = ?auto_283276 ?auto_283286 ) ) ( not ( = ?auto_283276 ?auto_283287 ) ) ( not ( = ?auto_283276 ?auto_283288 ) ) ( not ( = ?auto_283276 ?auto_283289 ) ) ( not ( = ?auto_283277 ?auto_283278 ) ) ( not ( = ?auto_283277 ?auto_283279 ) ) ( not ( = ?auto_283277 ?auto_283280 ) ) ( not ( = ?auto_283277 ?auto_283281 ) ) ( not ( = ?auto_283277 ?auto_283282 ) ) ( not ( = ?auto_283277 ?auto_283283 ) ) ( not ( = ?auto_283277 ?auto_283284 ) ) ( not ( = ?auto_283277 ?auto_283285 ) ) ( not ( = ?auto_283277 ?auto_283286 ) ) ( not ( = ?auto_283277 ?auto_283287 ) ) ( not ( = ?auto_283277 ?auto_283288 ) ) ( not ( = ?auto_283277 ?auto_283289 ) ) ( not ( = ?auto_283278 ?auto_283279 ) ) ( not ( = ?auto_283278 ?auto_283280 ) ) ( not ( = ?auto_283278 ?auto_283281 ) ) ( not ( = ?auto_283278 ?auto_283282 ) ) ( not ( = ?auto_283278 ?auto_283283 ) ) ( not ( = ?auto_283278 ?auto_283284 ) ) ( not ( = ?auto_283278 ?auto_283285 ) ) ( not ( = ?auto_283278 ?auto_283286 ) ) ( not ( = ?auto_283278 ?auto_283287 ) ) ( not ( = ?auto_283278 ?auto_283288 ) ) ( not ( = ?auto_283278 ?auto_283289 ) ) ( not ( = ?auto_283279 ?auto_283280 ) ) ( not ( = ?auto_283279 ?auto_283281 ) ) ( not ( = ?auto_283279 ?auto_283282 ) ) ( not ( = ?auto_283279 ?auto_283283 ) ) ( not ( = ?auto_283279 ?auto_283284 ) ) ( not ( = ?auto_283279 ?auto_283285 ) ) ( not ( = ?auto_283279 ?auto_283286 ) ) ( not ( = ?auto_283279 ?auto_283287 ) ) ( not ( = ?auto_283279 ?auto_283288 ) ) ( not ( = ?auto_283279 ?auto_283289 ) ) ( not ( = ?auto_283280 ?auto_283281 ) ) ( not ( = ?auto_283280 ?auto_283282 ) ) ( not ( = ?auto_283280 ?auto_283283 ) ) ( not ( = ?auto_283280 ?auto_283284 ) ) ( not ( = ?auto_283280 ?auto_283285 ) ) ( not ( = ?auto_283280 ?auto_283286 ) ) ( not ( = ?auto_283280 ?auto_283287 ) ) ( not ( = ?auto_283280 ?auto_283288 ) ) ( not ( = ?auto_283280 ?auto_283289 ) ) ( not ( = ?auto_283281 ?auto_283282 ) ) ( not ( = ?auto_283281 ?auto_283283 ) ) ( not ( = ?auto_283281 ?auto_283284 ) ) ( not ( = ?auto_283281 ?auto_283285 ) ) ( not ( = ?auto_283281 ?auto_283286 ) ) ( not ( = ?auto_283281 ?auto_283287 ) ) ( not ( = ?auto_283281 ?auto_283288 ) ) ( not ( = ?auto_283281 ?auto_283289 ) ) ( not ( = ?auto_283282 ?auto_283283 ) ) ( not ( = ?auto_283282 ?auto_283284 ) ) ( not ( = ?auto_283282 ?auto_283285 ) ) ( not ( = ?auto_283282 ?auto_283286 ) ) ( not ( = ?auto_283282 ?auto_283287 ) ) ( not ( = ?auto_283282 ?auto_283288 ) ) ( not ( = ?auto_283282 ?auto_283289 ) ) ( not ( = ?auto_283283 ?auto_283284 ) ) ( not ( = ?auto_283283 ?auto_283285 ) ) ( not ( = ?auto_283283 ?auto_283286 ) ) ( not ( = ?auto_283283 ?auto_283287 ) ) ( not ( = ?auto_283283 ?auto_283288 ) ) ( not ( = ?auto_283283 ?auto_283289 ) ) ( not ( = ?auto_283284 ?auto_283285 ) ) ( not ( = ?auto_283284 ?auto_283286 ) ) ( not ( = ?auto_283284 ?auto_283287 ) ) ( not ( = ?auto_283284 ?auto_283288 ) ) ( not ( = ?auto_283284 ?auto_283289 ) ) ( not ( = ?auto_283285 ?auto_283286 ) ) ( not ( = ?auto_283285 ?auto_283287 ) ) ( not ( = ?auto_283285 ?auto_283288 ) ) ( not ( = ?auto_283285 ?auto_283289 ) ) ( not ( = ?auto_283286 ?auto_283287 ) ) ( not ( = ?auto_283286 ?auto_283288 ) ) ( not ( = ?auto_283286 ?auto_283289 ) ) ( not ( = ?auto_283287 ?auto_283288 ) ) ( not ( = ?auto_283287 ?auto_283289 ) ) ( not ( = ?auto_283288 ?auto_283289 ) ) ( ON ?auto_283288 ?auto_283289 ) ( ON ?auto_283287 ?auto_283288 ) ( ON ?auto_283286 ?auto_283287 ) ( ON ?auto_283285 ?auto_283286 ) ( ON ?auto_283284 ?auto_283285 ) ( ON ?auto_283283 ?auto_283284 ) ( ON ?auto_283282 ?auto_283283 ) ( ON ?auto_283281 ?auto_283282 ) ( ON ?auto_283280 ?auto_283281 ) ( CLEAR ?auto_283278 ) ( ON ?auto_283279 ?auto_283280 ) ( CLEAR ?auto_283279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_283276 ?auto_283277 ?auto_283278 ?auto_283279 )
      ( MAKE-14PILE ?auto_283276 ?auto_283277 ?auto_283278 ?auto_283279 ?auto_283280 ?auto_283281 ?auto_283282 ?auto_283283 ?auto_283284 ?auto_283285 ?auto_283286 ?auto_283287 ?auto_283288 ?auto_283289 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283304 - BLOCK
      ?auto_283305 - BLOCK
      ?auto_283306 - BLOCK
      ?auto_283307 - BLOCK
      ?auto_283308 - BLOCK
      ?auto_283309 - BLOCK
      ?auto_283310 - BLOCK
      ?auto_283311 - BLOCK
      ?auto_283312 - BLOCK
      ?auto_283313 - BLOCK
      ?auto_283314 - BLOCK
      ?auto_283315 - BLOCK
      ?auto_283316 - BLOCK
      ?auto_283317 - BLOCK
    )
    :vars
    (
      ?auto_283318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283317 ?auto_283318 ) ( ON-TABLE ?auto_283304 ) ( ON ?auto_283305 ?auto_283304 ) ( not ( = ?auto_283304 ?auto_283305 ) ) ( not ( = ?auto_283304 ?auto_283306 ) ) ( not ( = ?auto_283304 ?auto_283307 ) ) ( not ( = ?auto_283304 ?auto_283308 ) ) ( not ( = ?auto_283304 ?auto_283309 ) ) ( not ( = ?auto_283304 ?auto_283310 ) ) ( not ( = ?auto_283304 ?auto_283311 ) ) ( not ( = ?auto_283304 ?auto_283312 ) ) ( not ( = ?auto_283304 ?auto_283313 ) ) ( not ( = ?auto_283304 ?auto_283314 ) ) ( not ( = ?auto_283304 ?auto_283315 ) ) ( not ( = ?auto_283304 ?auto_283316 ) ) ( not ( = ?auto_283304 ?auto_283317 ) ) ( not ( = ?auto_283304 ?auto_283318 ) ) ( not ( = ?auto_283305 ?auto_283306 ) ) ( not ( = ?auto_283305 ?auto_283307 ) ) ( not ( = ?auto_283305 ?auto_283308 ) ) ( not ( = ?auto_283305 ?auto_283309 ) ) ( not ( = ?auto_283305 ?auto_283310 ) ) ( not ( = ?auto_283305 ?auto_283311 ) ) ( not ( = ?auto_283305 ?auto_283312 ) ) ( not ( = ?auto_283305 ?auto_283313 ) ) ( not ( = ?auto_283305 ?auto_283314 ) ) ( not ( = ?auto_283305 ?auto_283315 ) ) ( not ( = ?auto_283305 ?auto_283316 ) ) ( not ( = ?auto_283305 ?auto_283317 ) ) ( not ( = ?auto_283305 ?auto_283318 ) ) ( not ( = ?auto_283306 ?auto_283307 ) ) ( not ( = ?auto_283306 ?auto_283308 ) ) ( not ( = ?auto_283306 ?auto_283309 ) ) ( not ( = ?auto_283306 ?auto_283310 ) ) ( not ( = ?auto_283306 ?auto_283311 ) ) ( not ( = ?auto_283306 ?auto_283312 ) ) ( not ( = ?auto_283306 ?auto_283313 ) ) ( not ( = ?auto_283306 ?auto_283314 ) ) ( not ( = ?auto_283306 ?auto_283315 ) ) ( not ( = ?auto_283306 ?auto_283316 ) ) ( not ( = ?auto_283306 ?auto_283317 ) ) ( not ( = ?auto_283306 ?auto_283318 ) ) ( not ( = ?auto_283307 ?auto_283308 ) ) ( not ( = ?auto_283307 ?auto_283309 ) ) ( not ( = ?auto_283307 ?auto_283310 ) ) ( not ( = ?auto_283307 ?auto_283311 ) ) ( not ( = ?auto_283307 ?auto_283312 ) ) ( not ( = ?auto_283307 ?auto_283313 ) ) ( not ( = ?auto_283307 ?auto_283314 ) ) ( not ( = ?auto_283307 ?auto_283315 ) ) ( not ( = ?auto_283307 ?auto_283316 ) ) ( not ( = ?auto_283307 ?auto_283317 ) ) ( not ( = ?auto_283307 ?auto_283318 ) ) ( not ( = ?auto_283308 ?auto_283309 ) ) ( not ( = ?auto_283308 ?auto_283310 ) ) ( not ( = ?auto_283308 ?auto_283311 ) ) ( not ( = ?auto_283308 ?auto_283312 ) ) ( not ( = ?auto_283308 ?auto_283313 ) ) ( not ( = ?auto_283308 ?auto_283314 ) ) ( not ( = ?auto_283308 ?auto_283315 ) ) ( not ( = ?auto_283308 ?auto_283316 ) ) ( not ( = ?auto_283308 ?auto_283317 ) ) ( not ( = ?auto_283308 ?auto_283318 ) ) ( not ( = ?auto_283309 ?auto_283310 ) ) ( not ( = ?auto_283309 ?auto_283311 ) ) ( not ( = ?auto_283309 ?auto_283312 ) ) ( not ( = ?auto_283309 ?auto_283313 ) ) ( not ( = ?auto_283309 ?auto_283314 ) ) ( not ( = ?auto_283309 ?auto_283315 ) ) ( not ( = ?auto_283309 ?auto_283316 ) ) ( not ( = ?auto_283309 ?auto_283317 ) ) ( not ( = ?auto_283309 ?auto_283318 ) ) ( not ( = ?auto_283310 ?auto_283311 ) ) ( not ( = ?auto_283310 ?auto_283312 ) ) ( not ( = ?auto_283310 ?auto_283313 ) ) ( not ( = ?auto_283310 ?auto_283314 ) ) ( not ( = ?auto_283310 ?auto_283315 ) ) ( not ( = ?auto_283310 ?auto_283316 ) ) ( not ( = ?auto_283310 ?auto_283317 ) ) ( not ( = ?auto_283310 ?auto_283318 ) ) ( not ( = ?auto_283311 ?auto_283312 ) ) ( not ( = ?auto_283311 ?auto_283313 ) ) ( not ( = ?auto_283311 ?auto_283314 ) ) ( not ( = ?auto_283311 ?auto_283315 ) ) ( not ( = ?auto_283311 ?auto_283316 ) ) ( not ( = ?auto_283311 ?auto_283317 ) ) ( not ( = ?auto_283311 ?auto_283318 ) ) ( not ( = ?auto_283312 ?auto_283313 ) ) ( not ( = ?auto_283312 ?auto_283314 ) ) ( not ( = ?auto_283312 ?auto_283315 ) ) ( not ( = ?auto_283312 ?auto_283316 ) ) ( not ( = ?auto_283312 ?auto_283317 ) ) ( not ( = ?auto_283312 ?auto_283318 ) ) ( not ( = ?auto_283313 ?auto_283314 ) ) ( not ( = ?auto_283313 ?auto_283315 ) ) ( not ( = ?auto_283313 ?auto_283316 ) ) ( not ( = ?auto_283313 ?auto_283317 ) ) ( not ( = ?auto_283313 ?auto_283318 ) ) ( not ( = ?auto_283314 ?auto_283315 ) ) ( not ( = ?auto_283314 ?auto_283316 ) ) ( not ( = ?auto_283314 ?auto_283317 ) ) ( not ( = ?auto_283314 ?auto_283318 ) ) ( not ( = ?auto_283315 ?auto_283316 ) ) ( not ( = ?auto_283315 ?auto_283317 ) ) ( not ( = ?auto_283315 ?auto_283318 ) ) ( not ( = ?auto_283316 ?auto_283317 ) ) ( not ( = ?auto_283316 ?auto_283318 ) ) ( not ( = ?auto_283317 ?auto_283318 ) ) ( ON ?auto_283316 ?auto_283317 ) ( ON ?auto_283315 ?auto_283316 ) ( ON ?auto_283314 ?auto_283315 ) ( ON ?auto_283313 ?auto_283314 ) ( ON ?auto_283312 ?auto_283313 ) ( ON ?auto_283311 ?auto_283312 ) ( ON ?auto_283310 ?auto_283311 ) ( ON ?auto_283309 ?auto_283310 ) ( ON ?auto_283308 ?auto_283309 ) ( ON ?auto_283307 ?auto_283308 ) ( CLEAR ?auto_283305 ) ( ON ?auto_283306 ?auto_283307 ) ( CLEAR ?auto_283306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_283304 ?auto_283305 ?auto_283306 )
      ( MAKE-14PILE ?auto_283304 ?auto_283305 ?auto_283306 ?auto_283307 ?auto_283308 ?auto_283309 ?auto_283310 ?auto_283311 ?auto_283312 ?auto_283313 ?auto_283314 ?auto_283315 ?auto_283316 ?auto_283317 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283333 - BLOCK
      ?auto_283334 - BLOCK
      ?auto_283335 - BLOCK
      ?auto_283336 - BLOCK
      ?auto_283337 - BLOCK
      ?auto_283338 - BLOCK
      ?auto_283339 - BLOCK
      ?auto_283340 - BLOCK
      ?auto_283341 - BLOCK
      ?auto_283342 - BLOCK
      ?auto_283343 - BLOCK
      ?auto_283344 - BLOCK
      ?auto_283345 - BLOCK
      ?auto_283346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283346 ) ( ON-TABLE ?auto_283333 ) ( ON ?auto_283334 ?auto_283333 ) ( not ( = ?auto_283333 ?auto_283334 ) ) ( not ( = ?auto_283333 ?auto_283335 ) ) ( not ( = ?auto_283333 ?auto_283336 ) ) ( not ( = ?auto_283333 ?auto_283337 ) ) ( not ( = ?auto_283333 ?auto_283338 ) ) ( not ( = ?auto_283333 ?auto_283339 ) ) ( not ( = ?auto_283333 ?auto_283340 ) ) ( not ( = ?auto_283333 ?auto_283341 ) ) ( not ( = ?auto_283333 ?auto_283342 ) ) ( not ( = ?auto_283333 ?auto_283343 ) ) ( not ( = ?auto_283333 ?auto_283344 ) ) ( not ( = ?auto_283333 ?auto_283345 ) ) ( not ( = ?auto_283333 ?auto_283346 ) ) ( not ( = ?auto_283334 ?auto_283335 ) ) ( not ( = ?auto_283334 ?auto_283336 ) ) ( not ( = ?auto_283334 ?auto_283337 ) ) ( not ( = ?auto_283334 ?auto_283338 ) ) ( not ( = ?auto_283334 ?auto_283339 ) ) ( not ( = ?auto_283334 ?auto_283340 ) ) ( not ( = ?auto_283334 ?auto_283341 ) ) ( not ( = ?auto_283334 ?auto_283342 ) ) ( not ( = ?auto_283334 ?auto_283343 ) ) ( not ( = ?auto_283334 ?auto_283344 ) ) ( not ( = ?auto_283334 ?auto_283345 ) ) ( not ( = ?auto_283334 ?auto_283346 ) ) ( not ( = ?auto_283335 ?auto_283336 ) ) ( not ( = ?auto_283335 ?auto_283337 ) ) ( not ( = ?auto_283335 ?auto_283338 ) ) ( not ( = ?auto_283335 ?auto_283339 ) ) ( not ( = ?auto_283335 ?auto_283340 ) ) ( not ( = ?auto_283335 ?auto_283341 ) ) ( not ( = ?auto_283335 ?auto_283342 ) ) ( not ( = ?auto_283335 ?auto_283343 ) ) ( not ( = ?auto_283335 ?auto_283344 ) ) ( not ( = ?auto_283335 ?auto_283345 ) ) ( not ( = ?auto_283335 ?auto_283346 ) ) ( not ( = ?auto_283336 ?auto_283337 ) ) ( not ( = ?auto_283336 ?auto_283338 ) ) ( not ( = ?auto_283336 ?auto_283339 ) ) ( not ( = ?auto_283336 ?auto_283340 ) ) ( not ( = ?auto_283336 ?auto_283341 ) ) ( not ( = ?auto_283336 ?auto_283342 ) ) ( not ( = ?auto_283336 ?auto_283343 ) ) ( not ( = ?auto_283336 ?auto_283344 ) ) ( not ( = ?auto_283336 ?auto_283345 ) ) ( not ( = ?auto_283336 ?auto_283346 ) ) ( not ( = ?auto_283337 ?auto_283338 ) ) ( not ( = ?auto_283337 ?auto_283339 ) ) ( not ( = ?auto_283337 ?auto_283340 ) ) ( not ( = ?auto_283337 ?auto_283341 ) ) ( not ( = ?auto_283337 ?auto_283342 ) ) ( not ( = ?auto_283337 ?auto_283343 ) ) ( not ( = ?auto_283337 ?auto_283344 ) ) ( not ( = ?auto_283337 ?auto_283345 ) ) ( not ( = ?auto_283337 ?auto_283346 ) ) ( not ( = ?auto_283338 ?auto_283339 ) ) ( not ( = ?auto_283338 ?auto_283340 ) ) ( not ( = ?auto_283338 ?auto_283341 ) ) ( not ( = ?auto_283338 ?auto_283342 ) ) ( not ( = ?auto_283338 ?auto_283343 ) ) ( not ( = ?auto_283338 ?auto_283344 ) ) ( not ( = ?auto_283338 ?auto_283345 ) ) ( not ( = ?auto_283338 ?auto_283346 ) ) ( not ( = ?auto_283339 ?auto_283340 ) ) ( not ( = ?auto_283339 ?auto_283341 ) ) ( not ( = ?auto_283339 ?auto_283342 ) ) ( not ( = ?auto_283339 ?auto_283343 ) ) ( not ( = ?auto_283339 ?auto_283344 ) ) ( not ( = ?auto_283339 ?auto_283345 ) ) ( not ( = ?auto_283339 ?auto_283346 ) ) ( not ( = ?auto_283340 ?auto_283341 ) ) ( not ( = ?auto_283340 ?auto_283342 ) ) ( not ( = ?auto_283340 ?auto_283343 ) ) ( not ( = ?auto_283340 ?auto_283344 ) ) ( not ( = ?auto_283340 ?auto_283345 ) ) ( not ( = ?auto_283340 ?auto_283346 ) ) ( not ( = ?auto_283341 ?auto_283342 ) ) ( not ( = ?auto_283341 ?auto_283343 ) ) ( not ( = ?auto_283341 ?auto_283344 ) ) ( not ( = ?auto_283341 ?auto_283345 ) ) ( not ( = ?auto_283341 ?auto_283346 ) ) ( not ( = ?auto_283342 ?auto_283343 ) ) ( not ( = ?auto_283342 ?auto_283344 ) ) ( not ( = ?auto_283342 ?auto_283345 ) ) ( not ( = ?auto_283342 ?auto_283346 ) ) ( not ( = ?auto_283343 ?auto_283344 ) ) ( not ( = ?auto_283343 ?auto_283345 ) ) ( not ( = ?auto_283343 ?auto_283346 ) ) ( not ( = ?auto_283344 ?auto_283345 ) ) ( not ( = ?auto_283344 ?auto_283346 ) ) ( not ( = ?auto_283345 ?auto_283346 ) ) ( ON ?auto_283345 ?auto_283346 ) ( ON ?auto_283344 ?auto_283345 ) ( ON ?auto_283343 ?auto_283344 ) ( ON ?auto_283342 ?auto_283343 ) ( ON ?auto_283341 ?auto_283342 ) ( ON ?auto_283340 ?auto_283341 ) ( ON ?auto_283339 ?auto_283340 ) ( ON ?auto_283338 ?auto_283339 ) ( ON ?auto_283337 ?auto_283338 ) ( ON ?auto_283336 ?auto_283337 ) ( CLEAR ?auto_283334 ) ( ON ?auto_283335 ?auto_283336 ) ( CLEAR ?auto_283335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_283333 ?auto_283334 ?auto_283335 )
      ( MAKE-14PILE ?auto_283333 ?auto_283334 ?auto_283335 ?auto_283336 ?auto_283337 ?auto_283338 ?auto_283339 ?auto_283340 ?auto_283341 ?auto_283342 ?auto_283343 ?auto_283344 ?auto_283345 ?auto_283346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283361 - BLOCK
      ?auto_283362 - BLOCK
      ?auto_283363 - BLOCK
      ?auto_283364 - BLOCK
      ?auto_283365 - BLOCK
      ?auto_283366 - BLOCK
      ?auto_283367 - BLOCK
      ?auto_283368 - BLOCK
      ?auto_283369 - BLOCK
      ?auto_283370 - BLOCK
      ?auto_283371 - BLOCK
      ?auto_283372 - BLOCK
      ?auto_283373 - BLOCK
      ?auto_283374 - BLOCK
    )
    :vars
    (
      ?auto_283375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283374 ?auto_283375 ) ( ON-TABLE ?auto_283361 ) ( not ( = ?auto_283361 ?auto_283362 ) ) ( not ( = ?auto_283361 ?auto_283363 ) ) ( not ( = ?auto_283361 ?auto_283364 ) ) ( not ( = ?auto_283361 ?auto_283365 ) ) ( not ( = ?auto_283361 ?auto_283366 ) ) ( not ( = ?auto_283361 ?auto_283367 ) ) ( not ( = ?auto_283361 ?auto_283368 ) ) ( not ( = ?auto_283361 ?auto_283369 ) ) ( not ( = ?auto_283361 ?auto_283370 ) ) ( not ( = ?auto_283361 ?auto_283371 ) ) ( not ( = ?auto_283361 ?auto_283372 ) ) ( not ( = ?auto_283361 ?auto_283373 ) ) ( not ( = ?auto_283361 ?auto_283374 ) ) ( not ( = ?auto_283361 ?auto_283375 ) ) ( not ( = ?auto_283362 ?auto_283363 ) ) ( not ( = ?auto_283362 ?auto_283364 ) ) ( not ( = ?auto_283362 ?auto_283365 ) ) ( not ( = ?auto_283362 ?auto_283366 ) ) ( not ( = ?auto_283362 ?auto_283367 ) ) ( not ( = ?auto_283362 ?auto_283368 ) ) ( not ( = ?auto_283362 ?auto_283369 ) ) ( not ( = ?auto_283362 ?auto_283370 ) ) ( not ( = ?auto_283362 ?auto_283371 ) ) ( not ( = ?auto_283362 ?auto_283372 ) ) ( not ( = ?auto_283362 ?auto_283373 ) ) ( not ( = ?auto_283362 ?auto_283374 ) ) ( not ( = ?auto_283362 ?auto_283375 ) ) ( not ( = ?auto_283363 ?auto_283364 ) ) ( not ( = ?auto_283363 ?auto_283365 ) ) ( not ( = ?auto_283363 ?auto_283366 ) ) ( not ( = ?auto_283363 ?auto_283367 ) ) ( not ( = ?auto_283363 ?auto_283368 ) ) ( not ( = ?auto_283363 ?auto_283369 ) ) ( not ( = ?auto_283363 ?auto_283370 ) ) ( not ( = ?auto_283363 ?auto_283371 ) ) ( not ( = ?auto_283363 ?auto_283372 ) ) ( not ( = ?auto_283363 ?auto_283373 ) ) ( not ( = ?auto_283363 ?auto_283374 ) ) ( not ( = ?auto_283363 ?auto_283375 ) ) ( not ( = ?auto_283364 ?auto_283365 ) ) ( not ( = ?auto_283364 ?auto_283366 ) ) ( not ( = ?auto_283364 ?auto_283367 ) ) ( not ( = ?auto_283364 ?auto_283368 ) ) ( not ( = ?auto_283364 ?auto_283369 ) ) ( not ( = ?auto_283364 ?auto_283370 ) ) ( not ( = ?auto_283364 ?auto_283371 ) ) ( not ( = ?auto_283364 ?auto_283372 ) ) ( not ( = ?auto_283364 ?auto_283373 ) ) ( not ( = ?auto_283364 ?auto_283374 ) ) ( not ( = ?auto_283364 ?auto_283375 ) ) ( not ( = ?auto_283365 ?auto_283366 ) ) ( not ( = ?auto_283365 ?auto_283367 ) ) ( not ( = ?auto_283365 ?auto_283368 ) ) ( not ( = ?auto_283365 ?auto_283369 ) ) ( not ( = ?auto_283365 ?auto_283370 ) ) ( not ( = ?auto_283365 ?auto_283371 ) ) ( not ( = ?auto_283365 ?auto_283372 ) ) ( not ( = ?auto_283365 ?auto_283373 ) ) ( not ( = ?auto_283365 ?auto_283374 ) ) ( not ( = ?auto_283365 ?auto_283375 ) ) ( not ( = ?auto_283366 ?auto_283367 ) ) ( not ( = ?auto_283366 ?auto_283368 ) ) ( not ( = ?auto_283366 ?auto_283369 ) ) ( not ( = ?auto_283366 ?auto_283370 ) ) ( not ( = ?auto_283366 ?auto_283371 ) ) ( not ( = ?auto_283366 ?auto_283372 ) ) ( not ( = ?auto_283366 ?auto_283373 ) ) ( not ( = ?auto_283366 ?auto_283374 ) ) ( not ( = ?auto_283366 ?auto_283375 ) ) ( not ( = ?auto_283367 ?auto_283368 ) ) ( not ( = ?auto_283367 ?auto_283369 ) ) ( not ( = ?auto_283367 ?auto_283370 ) ) ( not ( = ?auto_283367 ?auto_283371 ) ) ( not ( = ?auto_283367 ?auto_283372 ) ) ( not ( = ?auto_283367 ?auto_283373 ) ) ( not ( = ?auto_283367 ?auto_283374 ) ) ( not ( = ?auto_283367 ?auto_283375 ) ) ( not ( = ?auto_283368 ?auto_283369 ) ) ( not ( = ?auto_283368 ?auto_283370 ) ) ( not ( = ?auto_283368 ?auto_283371 ) ) ( not ( = ?auto_283368 ?auto_283372 ) ) ( not ( = ?auto_283368 ?auto_283373 ) ) ( not ( = ?auto_283368 ?auto_283374 ) ) ( not ( = ?auto_283368 ?auto_283375 ) ) ( not ( = ?auto_283369 ?auto_283370 ) ) ( not ( = ?auto_283369 ?auto_283371 ) ) ( not ( = ?auto_283369 ?auto_283372 ) ) ( not ( = ?auto_283369 ?auto_283373 ) ) ( not ( = ?auto_283369 ?auto_283374 ) ) ( not ( = ?auto_283369 ?auto_283375 ) ) ( not ( = ?auto_283370 ?auto_283371 ) ) ( not ( = ?auto_283370 ?auto_283372 ) ) ( not ( = ?auto_283370 ?auto_283373 ) ) ( not ( = ?auto_283370 ?auto_283374 ) ) ( not ( = ?auto_283370 ?auto_283375 ) ) ( not ( = ?auto_283371 ?auto_283372 ) ) ( not ( = ?auto_283371 ?auto_283373 ) ) ( not ( = ?auto_283371 ?auto_283374 ) ) ( not ( = ?auto_283371 ?auto_283375 ) ) ( not ( = ?auto_283372 ?auto_283373 ) ) ( not ( = ?auto_283372 ?auto_283374 ) ) ( not ( = ?auto_283372 ?auto_283375 ) ) ( not ( = ?auto_283373 ?auto_283374 ) ) ( not ( = ?auto_283373 ?auto_283375 ) ) ( not ( = ?auto_283374 ?auto_283375 ) ) ( ON ?auto_283373 ?auto_283374 ) ( ON ?auto_283372 ?auto_283373 ) ( ON ?auto_283371 ?auto_283372 ) ( ON ?auto_283370 ?auto_283371 ) ( ON ?auto_283369 ?auto_283370 ) ( ON ?auto_283368 ?auto_283369 ) ( ON ?auto_283367 ?auto_283368 ) ( ON ?auto_283366 ?auto_283367 ) ( ON ?auto_283365 ?auto_283366 ) ( ON ?auto_283364 ?auto_283365 ) ( ON ?auto_283363 ?auto_283364 ) ( CLEAR ?auto_283361 ) ( ON ?auto_283362 ?auto_283363 ) ( CLEAR ?auto_283362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283361 ?auto_283362 )
      ( MAKE-14PILE ?auto_283361 ?auto_283362 ?auto_283363 ?auto_283364 ?auto_283365 ?auto_283366 ?auto_283367 ?auto_283368 ?auto_283369 ?auto_283370 ?auto_283371 ?auto_283372 ?auto_283373 ?auto_283374 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283390 - BLOCK
      ?auto_283391 - BLOCK
      ?auto_283392 - BLOCK
      ?auto_283393 - BLOCK
      ?auto_283394 - BLOCK
      ?auto_283395 - BLOCK
      ?auto_283396 - BLOCK
      ?auto_283397 - BLOCK
      ?auto_283398 - BLOCK
      ?auto_283399 - BLOCK
      ?auto_283400 - BLOCK
      ?auto_283401 - BLOCK
      ?auto_283402 - BLOCK
      ?auto_283403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283403 ) ( ON-TABLE ?auto_283390 ) ( not ( = ?auto_283390 ?auto_283391 ) ) ( not ( = ?auto_283390 ?auto_283392 ) ) ( not ( = ?auto_283390 ?auto_283393 ) ) ( not ( = ?auto_283390 ?auto_283394 ) ) ( not ( = ?auto_283390 ?auto_283395 ) ) ( not ( = ?auto_283390 ?auto_283396 ) ) ( not ( = ?auto_283390 ?auto_283397 ) ) ( not ( = ?auto_283390 ?auto_283398 ) ) ( not ( = ?auto_283390 ?auto_283399 ) ) ( not ( = ?auto_283390 ?auto_283400 ) ) ( not ( = ?auto_283390 ?auto_283401 ) ) ( not ( = ?auto_283390 ?auto_283402 ) ) ( not ( = ?auto_283390 ?auto_283403 ) ) ( not ( = ?auto_283391 ?auto_283392 ) ) ( not ( = ?auto_283391 ?auto_283393 ) ) ( not ( = ?auto_283391 ?auto_283394 ) ) ( not ( = ?auto_283391 ?auto_283395 ) ) ( not ( = ?auto_283391 ?auto_283396 ) ) ( not ( = ?auto_283391 ?auto_283397 ) ) ( not ( = ?auto_283391 ?auto_283398 ) ) ( not ( = ?auto_283391 ?auto_283399 ) ) ( not ( = ?auto_283391 ?auto_283400 ) ) ( not ( = ?auto_283391 ?auto_283401 ) ) ( not ( = ?auto_283391 ?auto_283402 ) ) ( not ( = ?auto_283391 ?auto_283403 ) ) ( not ( = ?auto_283392 ?auto_283393 ) ) ( not ( = ?auto_283392 ?auto_283394 ) ) ( not ( = ?auto_283392 ?auto_283395 ) ) ( not ( = ?auto_283392 ?auto_283396 ) ) ( not ( = ?auto_283392 ?auto_283397 ) ) ( not ( = ?auto_283392 ?auto_283398 ) ) ( not ( = ?auto_283392 ?auto_283399 ) ) ( not ( = ?auto_283392 ?auto_283400 ) ) ( not ( = ?auto_283392 ?auto_283401 ) ) ( not ( = ?auto_283392 ?auto_283402 ) ) ( not ( = ?auto_283392 ?auto_283403 ) ) ( not ( = ?auto_283393 ?auto_283394 ) ) ( not ( = ?auto_283393 ?auto_283395 ) ) ( not ( = ?auto_283393 ?auto_283396 ) ) ( not ( = ?auto_283393 ?auto_283397 ) ) ( not ( = ?auto_283393 ?auto_283398 ) ) ( not ( = ?auto_283393 ?auto_283399 ) ) ( not ( = ?auto_283393 ?auto_283400 ) ) ( not ( = ?auto_283393 ?auto_283401 ) ) ( not ( = ?auto_283393 ?auto_283402 ) ) ( not ( = ?auto_283393 ?auto_283403 ) ) ( not ( = ?auto_283394 ?auto_283395 ) ) ( not ( = ?auto_283394 ?auto_283396 ) ) ( not ( = ?auto_283394 ?auto_283397 ) ) ( not ( = ?auto_283394 ?auto_283398 ) ) ( not ( = ?auto_283394 ?auto_283399 ) ) ( not ( = ?auto_283394 ?auto_283400 ) ) ( not ( = ?auto_283394 ?auto_283401 ) ) ( not ( = ?auto_283394 ?auto_283402 ) ) ( not ( = ?auto_283394 ?auto_283403 ) ) ( not ( = ?auto_283395 ?auto_283396 ) ) ( not ( = ?auto_283395 ?auto_283397 ) ) ( not ( = ?auto_283395 ?auto_283398 ) ) ( not ( = ?auto_283395 ?auto_283399 ) ) ( not ( = ?auto_283395 ?auto_283400 ) ) ( not ( = ?auto_283395 ?auto_283401 ) ) ( not ( = ?auto_283395 ?auto_283402 ) ) ( not ( = ?auto_283395 ?auto_283403 ) ) ( not ( = ?auto_283396 ?auto_283397 ) ) ( not ( = ?auto_283396 ?auto_283398 ) ) ( not ( = ?auto_283396 ?auto_283399 ) ) ( not ( = ?auto_283396 ?auto_283400 ) ) ( not ( = ?auto_283396 ?auto_283401 ) ) ( not ( = ?auto_283396 ?auto_283402 ) ) ( not ( = ?auto_283396 ?auto_283403 ) ) ( not ( = ?auto_283397 ?auto_283398 ) ) ( not ( = ?auto_283397 ?auto_283399 ) ) ( not ( = ?auto_283397 ?auto_283400 ) ) ( not ( = ?auto_283397 ?auto_283401 ) ) ( not ( = ?auto_283397 ?auto_283402 ) ) ( not ( = ?auto_283397 ?auto_283403 ) ) ( not ( = ?auto_283398 ?auto_283399 ) ) ( not ( = ?auto_283398 ?auto_283400 ) ) ( not ( = ?auto_283398 ?auto_283401 ) ) ( not ( = ?auto_283398 ?auto_283402 ) ) ( not ( = ?auto_283398 ?auto_283403 ) ) ( not ( = ?auto_283399 ?auto_283400 ) ) ( not ( = ?auto_283399 ?auto_283401 ) ) ( not ( = ?auto_283399 ?auto_283402 ) ) ( not ( = ?auto_283399 ?auto_283403 ) ) ( not ( = ?auto_283400 ?auto_283401 ) ) ( not ( = ?auto_283400 ?auto_283402 ) ) ( not ( = ?auto_283400 ?auto_283403 ) ) ( not ( = ?auto_283401 ?auto_283402 ) ) ( not ( = ?auto_283401 ?auto_283403 ) ) ( not ( = ?auto_283402 ?auto_283403 ) ) ( ON ?auto_283402 ?auto_283403 ) ( ON ?auto_283401 ?auto_283402 ) ( ON ?auto_283400 ?auto_283401 ) ( ON ?auto_283399 ?auto_283400 ) ( ON ?auto_283398 ?auto_283399 ) ( ON ?auto_283397 ?auto_283398 ) ( ON ?auto_283396 ?auto_283397 ) ( ON ?auto_283395 ?auto_283396 ) ( ON ?auto_283394 ?auto_283395 ) ( ON ?auto_283393 ?auto_283394 ) ( ON ?auto_283392 ?auto_283393 ) ( CLEAR ?auto_283390 ) ( ON ?auto_283391 ?auto_283392 ) ( CLEAR ?auto_283391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_283390 ?auto_283391 )
      ( MAKE-14PILE ?auto_283390 ?auto_283391 ?auto_283392 ?auto_283393 ?auto_283394 ?auto_283395 ?auto_283396 ?auto_283397 ?auto_283398 ?auto_283399 ?auto_283400 ?auto_283401 ?auto_283402 ?auto_283403 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283418 - BLOCK
      ?auto_283419 - BLOCK
      ?auto_283420 - BLOCK
      ?auto_283421 - BLOCK
      ?auto_283422 - BLOCK
      ?auto_283423 - BLOCK
      ?auto_283424 - BLOCK
      ?auto_283425 - BLOCK
      ?auto_283426 - BLOCK
      ?auto_283427 - BLOCK
      ?auto_283428 - BLOCK
      ?auto_283429 - BLOCK
      ?auto_283430 - BLOCK
      ?auto_283431 - BLOCK
    )
    :vars
    (
      ?auto_283432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_283431 ?auto_283432 ) ( not ( = ?auto_283418 ?auto_283419 ) ) ( not ( = ?auto_283418 ?auto_283420 ) ) ( not ( = ?auto_283418 ?auto_283421 ) ) ( not ( = ?auto_283418 ?auto_283422 ) ) ( not ( = ?auto_283418 ?auto_283423 ) ) ( not ( = ?auto_283418 ?auto_283424 ) ) ( not ( = ?auto_283418 ?auto_283425 ) ) ( not ( = ?auto_283418 ?auto_283426 ) ) ( not ( = ?auto_283418 ?auto_283427 ) ) ( not ( = ?auto_283418 ?auto_283428 ) ) ( not ( = ?auto_283418 ?auto_283429 ) ) ( not ( = ?auto_283418 ?auto_283430 ) ) ( not ( = ?auto_283418 ?auto_283431 ) ) ( not ( = ?auto_283418 ?auto_283432 ) ) ( not ( = ?auto_283419 ?auto_283420 ) ) ( not ( = ?auto_283419 ?auto_283421 ) ) ( not ( = ?auto_283419 ?auto_283422 ) ) ( not ( = ?auto_283419 ?auto_283423 ) ) ( not ( = ?auto_283419 ?auto_283424 ) ) ( not ( = ?auto_283419 ?auto_283425 ) ) ( not ( = ?auto_283419 ?auto_283426 ) ) ( not ( = ?auto_283419 ?auto_283427 ) ) ( not ( = ?auto_283419 ?auto_283428 ) ) ( not ( = ?auto_283419 ?auto_283429 ) ) ( not ( = ?auto_283419 ?auto_283430 ) ) ( not ( = ?auto_283419 ?auto_283431 ) ) ( not ( = ?auto_283419 ?auto_283432 ) ) ( not ( = ?auto_283420 ?auto_283421 ) ) ( not ( = ?auto_283420 ?auto_283422 ) ) ( not ( = ?auto_283420 ?auto_283423 ) ) ( not ( = ?auto_283420 ?auto_283424 ) ) ( not ( = ?auto_283420 ?auto_283425 ) ) ( not ( = ?auto_283420 ?auto_283426 ) ) ( not ( = ?auto_283420 ?auto_283427 ) ) ( not ( = ?auto_283420 ?auto_283428 ) ) ( not ( = ?auto_283420 ?auto_283429 ) ) ( not ( = ?auto_283420 ?auto_283430 ) ) ( not ( = ?auto_283420 ?auto_283431 ) ) ( not ( = ?auto_283420 ?auto_283432 ) ) ( not ( = ?auto_283421 ?auto_283422 ) ) ( not ( = ?auto_283421 ?auto_283423 ) ) ( not ( = ?auto_283421 ?auto_283424 ) ) ( not ( = ?auto_283421 ?auto_283425 ) ) ( not ( = ?auto_283421 ?auto_283426 ) ) ( not ( = ?auto_283421 ?auto_283427 ) ) ( not ( = ?auto_283421 ?auto_283428 ) ) ( not ( = ?auto_283421 ?auto_283429 ) ) ( not ( = ?auto_283421 ?auto_283430 ) ) ( not ( = ?auto_283421 ?auto_283431 ) ) ( not ( = ?auto_283421 ?auto_283432 ) ) ( not ( = ?auto_283422 ?auto_283423 ) ) ( not ( = ?auto_283422 ?auto_283424 ) ) ( not ( = ?auto_283422 ?auto_283425 ) ) ( not ( = ?auto_283422 ?auto_283426 ) ) ( not ( = ?auto_283422 ?auto_283427 ) ) ( not ( = ?auto_283422 ?auto_283428 ) ) ( not ( = ?auto_283422 ?auto_283429 ) ) ( not ( = ?auto_283422 ?auto_283430 ) ) ( not ( = ?auto_283422 ?auto_283431 ) ) ( not ( = ?auto_283422 ?auto_283432 ) ) ( not ( = ?auto_283423 ?auto_283424 ) ) ( not ( = ?auto_283423 ?auto_283425 ) ) ( not ( = ?auto_283423 ?auto_283426 ) ) ( not ( = ?auto_283423 ?auto_283427 ) ) ( not ( = ?auto_283423 ?auto_283428 ) ) ( not ( = ?auto_283423 ?auto_283429 ) ) ( not ( = ?auto_283423 ?auto_283430 ) ) ( not ( = ?auto_283423 ?auto_283431 ) ) ( not ( = ?auto_283423 ?auto_283432 ) ) ( not ( = ?auto_283424 ?auto_283425 ) ) ( not ( = ?auto_283424 ?auto_283426 ) ) ( not ( = ?auto_283424 ?auto_283427 ) ) ( not ( = ?auto_283424 ?auto_283428 ) ) ( not ( = ?auto_283424 ?auto_283429 ) ) ( not ( = ?auto_283424 ?auto_283430 ) ) ( not ( = ?auto_283424 ?auto_283431 ) ) ( not ( = ?auto_283424 ?auto_283432 ) ) ( not ( = ?auto_283425 ?auto_283426 ) ) ( not ( = ?auto_283425 ?auto_283427 ) ) ( not ( = ?auto_283425 ?auto_283428 ) ) ( not ( = ?auto_283425 ?auto_283429 ) ) ( not ( = ?auto_283425 ?auto_283430 ) ) ( not ( = ?auto_283425 ?auto_283431 ) ) ( not ( = ?auto_283425 ?auto_283432 ) ) ( not ( = ?auto_283426 ?auto_283427 ) ) ( not ( = ?auto_283426 ?auto_283428 ) ) ( not ( = ?auto_283426 ?auto_283429 ) ) ( not ( = ?auto_283426 ?auto_283430 ) ) ( not ( = ?auto_283426 ?auto_283431 ) ) ( not ( = ?auto_283426 ?auto_283432 ) ) ( not ( = ?auto_283427 ?auto_283428 ) ) ( not ( = ?auto_283427 ?auto_283429 ) ) ( not ( = ?auto_283427 ?auto_283430 ) ) ( not ( = ?auto_283427 ?auto_283431 ) ) ( not ( = ?auto_283427 ?auto_283432 ) ) ( not ( = ?auto_283428 ?auto_283429 ) ) ( not ( = ?auto_283428 ?auto_283430 ) ) ( not ( = ?auto_283428 ?auto_283431 ) ) ( not ( = ?auto_283428 ?auto_283432 ) ) ( not ( = ?auto_283429 ?auto_283430 ) ) ( not ( = ?auto_283429 ?auto_283431 ) ) ( not ( = ?auto_283429 ?auto_283432 ) ) ( not ( = ?auto_283430 ?auto_283431 ) ) ( not ( = ?auto_283430 ?auto_283432 ) ) ( not ( = ?auto_283431 ?auto_283432 ) ) ( ON ?auto_283430 ?auto_283431 ) ( ON ?auto_283429 ?auto_283430 ) ( ON ?auto_283428 ?auto_283429 ) ( ON ?auto_283427 ?auto_283428 ) ( ON ?auto_283426 ?auto_283427 ) ( ON ?auto_283425 ?auto_283426 ) ( ON ?auto_283424 ?auto_283425 ) ( ON ?auto_283423 ?auto_283424 ) ( ON ?auto_283422 ?auto_283423 ) ( ON ?auto_283421 ?auto_283422 ) ( ON ?auto_283420 ?auto_283421 ) ( ON ?auto_283419 ?auto_283420 ) ( ON ?auto_283418 ?auto_283419 ) ( CLEAR ?auto_283418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283418 )
      ( MAKE-14PILE ?auto_283418 ?auto_283419 ?auto_283420 ?auto_283421 ?auto_283422 ?auto_283423 ?auto_283424 ?auto_283425 ?auto_283426 ?auto_283427 ?auto_283428 ?auto_283429 ?auto_283430 ?auto_283431 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283447 - BLOCK
      ?auto_283448 - BLOCK
      ?auto_283449 - BLOCK
      ?auto_283450 - BLOCK
      ?auto_283451 - BLOCK
      ?auto_283452 - BLOCK
      ?auto_283453 - BLOCK
      ?auto_283454 - BLOCK
      ?auto_283455 - BLOCK
      ?auto_283456 - BLOCK
      ?auto_283457 - BLOCK
      ?auto_283458 - BLOCK
      ?auto_283459 - BLOCK
      ?auto_283460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_283460 ) ( not ( = ?auto_283447 ?auto_283448 ) ) ( not ( = ?auto_283447 ?auto_283449 ) ) ( not ( = ?auto_283447 ?auto_283450 ) ) ( not ( = ?auto_283447 ?auto_283451 ) ) ( not ( = ?auto_283447 ?auto_283452 ) ) ( not ( = ?auto_283447 ?auto_283453 ) ) ( not ( = ?auto_283447 ?auto_283454 ) ) ( not ( = ?auto_283447 ?auto_283455 ) ) ( not ( = ?auto_283447 ?auto_283456 ) ) ( not ( = ?auto_283447 ?auto_283457 ) ) ( not ( = ?auto_283447 ?auto_283458 ) ) ( not ( = ?auto_283447 ?auto_283459 ) ) ( not ( = ?auto_283447 ?auto_283460 ) ) ( not ( = ?auto_283448 ?auto_283449 ) ) ( not ( = ?auto_283448 ?auto_283450 ) ) ( not ( = ?auto_283448 ?auto_283451 ) ) ( not ( = ?auto_283448 ?auto_283452 ) ) ( not ( = ?auto_283448 ?auto_283453 ) ) ( not ( = ?auto_283448 ?auto_283454 ) ) ( not ( = ?auto_283448 ?auto_283455 ) ) ( not ( = ?auto_283448 ?auto_283456 ) ) ( not ( = ?auto_283448 ?auto_283457 ) ) ( not ( = ?auto_283448 ?auto_283458 ) ) ( not ( = ?auto_283448 ?auto_283459 ) ) ( not ( = ?auto_283448 ?auto_283460 ) ) ( not ( = ?auto_283449 ?auto_283450 ) ) ( not ( = ?auto_283449 ?auto_283451 ) ) ( not ( = ?auto_283449 ?auto_283452 ) ) ( not ( = ?auto_283449 ?auto_283453 ) ) ( not ( = ?auto_283449 ?auto_283454 ) ) ( not ( = ?auto_283449 ?auto_283455 ) ) ( not ( = ?auto_283449 ?auto_283456 ) ) ( not ( = ?auto_283449 ?auto_283457 ) ) ( not ( = ?auto_283449 ?auto_283458 ) ) ( not ( = ?auto_283449 ?auto_283459 ) ) ( not ( = ?auto_283449 ?auto_283460 ) ) ( not ( = ?auto_283450 ?auto_283451 ) ) ( not ( = ?auto_283450 ?auto_283452 ) ) ( not ( = ?auto_283450 ?auto_283453 ) ) ( not ( = ?auto_283450 ?auto_283454 ) ) ( not ( = ?auto_283450 ?auto_283455 ) ) ( not ( = ?auto_283450 ?auto_283456 ) ) ( not ( = ?auto_283450 ?auto_283457 ) ) ( not ( = ?auto_283450 ?auto_283458 ) ) ( not ( = ?auto_283450 ?auto_283459 ) ) ( not ( = ?auto_283450 ?auto_283460 ) ) ( not ( = ?auto_283451 ?auto_283452 ) ) ( not ( = ?auto_283451 ?auto_283453 ) ) ( not ( = ?auto_283451 ?auto_283454 ) ) ( not ( = ?auto_283451 ?auto_283455 ) ) ( not ( = ?auto_283451 ?auto_283456 ) ) ( not ( = ?auto_283451 ?auto_283457 ) ) ( not ( = ?auto_283451 ?auto_283458 ) ) ( not ( = ?auto_283451 ?auto_283459 ) ) ( not ( = ?auto_283451 ?auto_283460 ) ) ( not ( = ?auto_283452 ?auto_283453 ) ) ( not ( = ?auto_283452 ?auto_283454 ) ) ( not ( = ?auto_283452 ?auto_283455 ) ) ( not ( = ?auto_283452 ?auto_283456 ) ) ( not ( = ?auto_283452 ?auto_283457 ) ) ( not ( = ?auto_283452 ?auto_283458 ) ) ( not ( = ?auto_283452 ?auto_283459 ) ) ( not ( = ?auto_283452 ?auto_283460 ) ) ( not ( = ?auto_283453 ?auto_283454 ) ) ( not ( = ?auto_283453 ?auto_283455 ) ) ( not ( = ?auto_283453 ?auto_283456 ) ) ( not ( = ?auto_283453 ?auto_283457 ) ) ( not ( = ?auto_283453 ?auto_283458 ) ) ( not ( = ?auto_283453 ?auto_283459 ) ) ( not ( = ?auto_283453 ?auto_283460 ) ) ( not ( = ?auto_283454 ?auto_283455 ) ) ( not ( = ?auto_283454 ?auto_283456 ) ) ( not ( = ?auto_283454 ?auto_283457 ) ) ( not ( = ?auto_283454 ?auto_283458 ) ) ( not ( = ?auto_283454 ?auto_283459 ) ) ( not ( = ?auto_283454 ?auto_283460 ) ) ( not ( = ?auto_283455 ?auto_283456 ) ) ( not ( = ?auto_283455 ?auto_283457 ) ) ( not ( = ?auto_283455 ?auto_283458 ) ) ( not ( = ?auto_283455 ?auto_283459 ) ) ( not ( = ?auto_283455 ?auto_283460 ) ) ( not ( = ?auto_283456 ?auto_283457 ) ) ( not ( = ?auto_283456 ?auto_283458 ) ) ( not ( = ?auto_283456 ?auto_283459 ) ) ( not ( = ?auto_283456 ?auto_283460 ) ) ( not ( = ?auto_283457 ?auto_283458 ) ) ( not ( = ?auto_283457 ?auto_283459 ) ) ( not ( = ?auto_283457 ?auto_283460 ) ) ( not ( = ?auto_283458 ?auto_283459 ) ) ( not ( = ?auto_283458 ?auto_283460 ) ) ( not ( = ?auto_283459 ?auto_283460 ) ) ( ON ?auto_283459 ?auto_283460 ) ( ON ?auto_283458 ?auto_283459 ) ( ON ?auto_283457 ?auto_283458 ) ( ON ?auto_283456 ?auto_283457 ) ( ON ?auto_283455 ?auto_283456 ) ( ON ?auto_283454 ?auto_283455 ) ( ON ?auto_283453 ?auto_283454 ) ( ON ?auto_283452 ?auto_283453 ) ( ON ?auto_283451 ?auto_283452 ) ( ON ?auto_283450 ?auto_283451 ) ( ON ?auto_283449 ?auto_283450 ) ( ON ?auto_283448 ?auto_283449 ) ( ON ?auto_283447 ?auto_283448 ) ( CLEAR ?auto_283447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_283447 )
      ( MAKE-14PILE ?auto_283447 ?auto_283448 ?auto_283449 ?auto_283450 ?auto_283451 ?auto_283452 ?auto_283453 ?auto_283454 ?auto_283455 ?auto_283456 ?auto_283457 ?auto_283458 ?auto_283459 ?auto_283460 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_283475 - BLOCK
      ?auto_283476 - BLOCK
      ?auto_283477 - BLOCK
      ?auto_283478 - BLOCK
      ?auto_283479 - BLOCK
      ?auto_283480 - BLOCK
      ?auto_283481 - BLOCK
      ?auto_283482 - BLOCK
      ?auto_283483 - BLOCK
      ?auto_283484 - BLOCK
      ?auto_283485 - BLOCK
      ?auto_283486 - BLOCK
      ?auto_283487 - BLOCK
      ?auto_283488 - BLOCK
    )
    :vars
    (
      ?auto_283489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_283475 ?auto_283476 ) ) ( not ( = ?auto_283475 ?auto_283477 ) ) ( not ( = ?auto_283475 ?auto_283478 ) ) ( not ( = ?auto_283475 ?auto_283479 ) ) ( not ( = ?auto_283475 ?auto_283480 ) ) ( not ( = ?auto_283475 ?auto_283481 ) ) ( not ( = ?auto_283475 ?auto_283482 ) ) ( not ( = ?auto_283475 ?auto_283483 ) ) ( not ( = ?auto_283475 ?auto_283484 ) ) ( not ( = ?auto_283475 ?auto_283485 ) ) ( not ( = ?auto_283475 ?auto_283486 ) ) ( not ( = ?auto_283475 ?auto_283487 ) ) ( not ( = ?auto_283475 ?auto_283488 ) ) ( not ( = ?auto_283476 ?auto_283477 ) ) ( not ( = ?auto_283476 ?auto_283478 ) ) ( not ( = ?auto_283476 ?auto_283479 ) ) ( not ( = ?auto_283476 ?auto_283480 ) ) ( not ( = ?auto_283476 ?auto_283481 ) ) ( not ( = ?auto_283476 ?auto_283482 ) ) ( not ( = ?auto_283476 ?auto_283483 ) ) ( not ( = ?auto_283476 ?auto_283484 ) ) ( not ( = ?auto_283476 ?auto_283485 ) ) ( not ( = ?auto_283476 ?auto_283486 ) ) ( not ( = ?auto_283476 ?auto_283487 ) ) ( not ( = ?auto_283476 ?auto_283488 ) ) ( not ( = ?auto_283477 ?auto_283478 ) ) ( not ( = ?auto_283477 ?auto_283479 ) ) ( not ( = ?auto_283477 ?auto_283480 ) ) ( not ( = ?auto_283477 ?auto_283481 ) ) ( not ( = ?auto_283477 ?auto_283482 ) ) ( not ( = ?auto_283477 ?auto_283483 ) ) ( not ( = ?auto_283477 ?auto_283484 ) ) ( not ( = ?auto_283477 ?auto_283485 ) ) ( not ( = ?auto_283477 ?auto_283486 ) ) ( not ( = ?auto_283477 ?auto_283487 ) ) ( not ( = ?auto_283477 ?auto_283488 ) ) ( not ( = ?auto_283478 ?auto_283479 ) ) ( not ( = ?auto_283478 ?auto_283480 ) ) ( not ( = ?auto_283478 ?auto_283481 ) ) ( not ( = ?auto_283478 ?auto_283482 ) ) ( not ( = ?auto_283478 ?auto_283483 ) ) ( not ( = ?auto_283478 ?auto_283484 ) ) ( not ( = ?auto_283478 ?auto_283485 ) ) ( not ( = ?auto_283478 ?auto_283486 ) ) ( not ( = ?auto_283478 ?auto_283487 ) ) ( not ( = ?auto_283478 ?auto_283488 ) ) ( not ( = ?auto_283479 ?auto_283480 ) ) ( not ( = ?auto_283479 ?auto_283481 ) ) ( not ( = ?auto_283479 ?auto_283482 ) ) ( not ( = ?auto_283479 ?auto_283483 ) ) ( not ( = ?auto_283479 ?auto_283484 ) ) ( not ( = ?auto_283479 ?auto_283485 ) ) ( not ( = ?auto_283479 ?auto_283486 ) ) ( not ( = ?auto_283479 ?auto_283487 ) ) ( not ( = ?auto_283479 ?auto_283488 ) ) ( not ( = ?auto_283480 ?auto_283481 ) ) ( not ( = ?auto_283480 ?auto_283482 ) ) ( not ( = ?auto_283480 ?auto_283483 ) ) ( not ( = ?auto_283480 ?auto_283484 ) ) ( not ( = ?auto_283480 ?auto_283485 ) ) ( not ( = ?auto_283480 ?auto_283486 ) ) ( not ( = ?auto_283480 ?auto_283487 ) ) ( not ( = ?auto_283480 ?auto_283488 ) ) ( not ( = ?auto_283481 ?auto_283482 ) ) ( not ( = ?auto_283481 ?auto_283483 ) ) ( not ( = ?auto_283481 ?auto_283484 ) ) ( not ( = ?auto_283481 ?auto_283485 ) ) ( not ( = ?auto_283481 ?auto_283486 ) ) ( not ( = ?auto_283481 ?auto_283487 ) ) ( not ( = ?auto_283481 ?auto_283488 ) ) ( not ( = ?auto_283482 ?auto_283483 ) ) ( not ( = ?auto_283482 ?auto_283484 ) ) ( not ( = ?auto_283482 ?auto_283485 ) ) ( not ( = ?auto_283482 ?auto_283486 ) ) ( not ( = ?auto_283482 ?auto_283487 ) ) ( not ( = ?auto_283482 ?auto_283488 ) ) ( not ( = ?auto_283483 ?auto_283484 ) ) ( not ( = ?auto_283483 ?auto_283485 ) ) ( not ( = ?auto_283483 ?auto_283486 ) ) ( not ( = ?auto_283483 ?auto_283487 ) ) ( not ( = ?auto_283483 ?auto_283488 ) ) ( not ( = ?auto_283484 ?auto_283485 ) ) ( not ( = ?auto_283484 ?auto_283486 ) ) ( not ( = ?auto_283484 ?auto_283487 ) ) ( not ( = ?auto_283484 ?auto_283488 ) ) ( not ( = ?auto_283485 ?auto_283486 ) ) ( not ( = ?auto_283485 ?auto_283487 ) ) ( not ( = ?auto_283485 ?auto_283488 ) ) ( not ( = ?auto_283486 ?auto_283487 ) ) ( not ( = ?auto_283486 ?auto_283488 ) ) ( not ( = ?auto_283487 ?auto_283488 ) ) ( ON ?auto_283475 ?auto_283489 ) ( not ( = ?auto_283488 ?auto_283489 ) ) ( not ( = ?auto_283487 ?auto_283489 ) ) ( not ( = ?auto_283486 ?auto_283489 ) ) ( not ( = ?auto_283485 ?auto_283489 ) ) ( not ( = ?auto_283484 ?auto_283489 ) ) ( not ( = ?auto_283483 ?auto_283489 ) ) ( not ( = ?auto_283482 ?auto_283489 ) ) ( not ( = ?auto_283481 ?auto_283489 ) ) ( not ( = ?auto_283480 ?auto_283489 ) ) ( not ( = ?auto_283479 ?auto_283489 ) ) ( not ( = ?auto_283478 ?auto_283489 ) ) ( not ( = ?auto_283477 ?auto_283489 ) ) ( not ( = ?auto_283476 ?auto_283489 ) ) ( not ( = ?auto_283475 ?auto_283489 ) ) ( ON ?auto_283476 ?auto_283475 ) ( ON ?auto_283477 ?auto_283476 ) ( ON ?auto_283478 ?auto_283477 ) ( ON ?auto_283479 ?auto_283478 ) ( ON ?auto_283480 ?auto_283479 ) ( ON ?auto_283481 ?auto_283480 ) ( ON ?auto_283482 ?auto_283481 ) ( ON ?auto_283483 ?auto_283482 ) ( ON ?auto_283484 ?auto_283483 ) ( ON ?auto_283485 ?auto_283484 ) ( ON ?auto_283486 ?auto_283485 ) ( ON ?auto_283487 ?auto_283486 ) ( ON ?auto_283488 ?auto_283487 ) ( CLEAR ?auto_283488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_283488 ?auto_283487 ?auto_283486 ?auto_283485 ?auto_283484 ?auto_283483 ?auto_283482 ?auto_283481 ?auto_283480 ?auto_283479 ?auto_283478 ?auto_283477 ?auto_283476 ?auto_283475 )
      ( MAKE-14PILE ?auto_283475 ?auto_283476 ?auto_283477 ?auto_283478 ?auto_283479 ?auto_283480 ?auto_283481 ?auto_283482 ?auto_283483 ?auto_283484 ?auto_283485 ?auto_283486 ?auto_283487 ?auto_283488 ) )
  )

)

