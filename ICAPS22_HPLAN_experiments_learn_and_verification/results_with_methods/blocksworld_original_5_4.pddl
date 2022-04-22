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
      ?auto_22213 - BLOCK
      ?auto_22214 - BLOCK
      ?auto_22215 - BLOCK
      ?auto_22216 - BLOCK
      ?auto_22217 - BLOCK
    )
    :vars
    (
      ?auto_22218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22218 ?auto_22217 ) ( CLEAR ?auto_22218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22213 ) ( ON ?auto_22214 ?auto_22213 ) ( ON ?auto_22215 ?auto_22214 ) ( ON ?auto_22216 ?auto_22215 ) ( ON ?auto_22217 ?auto_22216 ) ( not ( = ?auto_22213 ?auto_22214 ) ) ( not ( = ?auto_22213 ?auto_22215 ) ) ( not ( = ?auto_22213 ?auto_22216 ) ) ( not ( = ?auto_22213 ?auto_22217 ) ) ( not ( = ?auto_22213 ?auto_22218 ) ) ( not ( = ?auto_22214 ?auto_22215 ) ) ( not ( = ?auto_22214 ?auto_22216 ) ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( not ( = ?auto_22214 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22218 ?auto_22217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22220 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22220 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22220 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22221 - BLOCK
    )
    :vars
    (
      ?auto_22222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22221 ?auto_22222 ) ( CLEAR ?auto_22221 ) ( HAND-EMPTY ) ( not ( = ?auto_22221 ?auto_22222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22221 ?auto_22222 )
      ( MAKE-1PILE ?auto_22221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22227 - BLOCK
      ?auto_22228 - BLOCK
      ?auto_22229 - BLOCK
      ?auto_22230 - BLOCK
    )
    :vars
    (
      ?auto_22231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22231 ?auto_22230 ) ( CLEAR ?auto_22231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22227 ) ( ON ?auto_22228 ?auto_22227 ) ( ON ?auto_22229 ?auto_22228 ) ( ON ?auto_22230 ?auto_22229 ) ( not ( = ?auto_22227 ?auto_22228 ) ) ( not ( = ?auto_22227 ?auto_22229 ) ) ( not ( = ?auto_22227 ?auto_22230 ) ) ( not ( = ?auto_22227 ?auto_22231 ) ) ( not ( = ?auto_22228 ?auto_22229 ) ) ( not ( = ?auto_22228 ?auto_22230 ) ) ( not ( = ?auto_22228 ?auto_22231 ) ) ( not ( = ?auto_22229 ?auto_22230 ) ) ( not ( = ?auto_22229 ?auto_22231 ) ) ( not ( = ?auto_22230 ?auto_22231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22231 ?auto_22230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22232 - BLOCK
      ?auto_22233 - BLOCK
      ?auto_22234 - BLOCK
      ?auto_22235 - BLOCK
    )
    :vars
    (
      ?auto_22236 - BLOCK
      ?auto_22237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22236 ?auto_22235 ) ( CLEAR ?auto_22236 ) ( ON-TABLE ?auto_22232 ) ( ON ?auto_22233 ?auto_22232 ) ( ON ?auto_22234 ?auto_22233 ) ( ON ?auto_22235 ?auto_22234 ) ( not ( = ?auto_22232 ?auto_22233 ) ) ( not ( = ?auto_22232 ?auto_22234 ) ) ( not ( = ?auto_22232 ?auto_22235 ) ) ( not ( = ?auto_22232 ?auto_22236 ) ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( not ( = ?auto_22233 ?auto_22235 ) ) ( not ( = ?auto_22233 ?auto_22236 ) ) ( not ( = ?auto_22234 ?auto_22235 ) ) ( not ( = ?auto_22234 ?auto_22236 ) ) ( not ( = ?auto_22235 ?auto_22236 ) ) ( HOLDING ?auto_22237 ) ( not ( = ?auto_22232 ?auto_22237 ) ) ( not ( = ?auto_22233 ?auto_22237 ) ) ( not ( = ?auto_22234 ?auto_22237 ) ) ( not ( = ?auto_22235 ?auto_22237 ) ) ( not ( = ?auto_22236 ?auto_22237 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22237 )
      ( MAKE-4PILE ?auto_22232 ?auto_22233 ?auto_22234 ?auto_22235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22238 - BLOCK
      ?auto_22239 - BLOCK
      ?auto_22240 - BLOCK
      ?auto_22241 - BLOCK
    )
    :vars
    (
      ?auto_22242 - BLOCK
      ?auto_22243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22242 ?auto_22241 ) ( ON-TABLE ?auto_22238 ) ( ON ?auto_22239 ?auto_22238 ) ( ON ?auto_22240 ?auto_22239 ) ( ON ?auto_22241 ?auto_22240 ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22242 ) ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22239 ?auto_22241 ) ) ( not ( = ?auto_22239 ?auto_22242 ) ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22238 ?auto_22243 ) ) ( not ( = ?auto_22239 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( ON ?auto_22243 ?auto_22242 ) ( CLEAR ?auto_22243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ?auto_22242 )
      ( MAKE-4PILE ?auto_22238 ?auto_22239 ?auto_22240 ?auto_22241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22246 - BLOCK
      ?auto_22247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22247 ) ( CLEAR ?auto_22246 ) ( ON-TABLE ?auto_22246 ) ( not ( = ?auto_22246 ?auto_22247 ) ) )
    :subtasks
    ( ( !STACK ?auto_22247 ?auto_22246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22248 - BLOCK
      ?auto_22249 - BLOCK
    )
    :vars
    (
      ?auto_22250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22248 ) ( ON-TABLE ?auto_22248 ) ( not ( = ?auto_22248 ?auto_22249 ) ) ( ON ?auto_22249 ?auto_22250 ) ( CLEAR ?auto_22249 ) ( HAND-EMPTY ) ( not ( = ?auto_22248 ?auto_22250 ) ) ( not ( = ?auto_22249 ?auto_22250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22249 ?auto_22250 )
      ( MAKE-2PILE ?auto_22248 ?auto_22249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22251 - BLOCK
      ?auto_22252 - BLOCK
    )
    :vars
    (
      ?auto_22253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22251 ?auto_22252 ) ) ( ON ?auto_22252 ?auto_22253 ) ( CLEAR ?auto_22252 ) ( not ( = ?auto_22251 ?auto_22253 ) ) ( not ( = ?auto_22252 ?auto_22253 ) ) ( HOLDING ?auto_22251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22251 )
      ( MAKE-2PILE ?auto_22251 ?auto_22252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22254 - BLOCK
      ?auto_22255 - BLOCK
    )
    :vars
    (
      ?auto_22256 - BLOCK
      ?auto_22259 - BLOCK
      ?auto_22257 - BLOCK
      ?auto_22258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22254 ?auto_22255 ) ) ( ON ?auto_22255 ?auto_22256 ) ( not ( = ?auto_22254 ?auto_22256 ) ) ( not ( = ?auto_22255 ?auto_22256 ) ) ( ON ?auto_22254 ?auto_22255 ) ( CLEAR ?auto_22254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22259 ) ( ON ?auto_22257 ?auto_22259 ) ( ON ?auto_22258 ?auto_22257 ) ( ON ?auto_22256 ?auto_22258 ) ( not ( = ?auto_22259 ?auto_22257 ) ) ( not ( = ?auto_22259 ?auto_22258 ) ) ( not ( = ?auto_22259 ?auto_22256 ) ) ( not ( = ?auto_22259 ?auto_22255 ) ) ( not ( = ?auto_22259 ?auto_22254 ) ) ( not ( = ?auto_22257 ?auto_22258 ) ) ( not ( = ?auto_22257 ?auto_22256 ) ) ( not ( = ?auto_22257 ?auto_22255 ) ) ( not ( = ?auto_22257 ?auto_22254 ) ) ( not ( = ?auto_22258 ?auto_22256 ) ) ( not ( = ?auto_22258 ?auto_22255 ) ) ( not ( = ?auto_22258 ?auto_22254 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22259 ?auto_22257 ?auto_22258 ?auto_22256 ?auto_22255 )
      ( MAKE-2PILE ?auto_22254 ?auto_22255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22263 - BLOCK
      ?auto_22264 - BLOCK
      ?auto_22265 - BLOCK
    )
    :vars
    (
      ?auto_22266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22266 ?auto_22265 ) ( CLEAR ?auto_22266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22263 ) ( ON ?auto_22264 ?auto_22263 ) ( ON ?auto_22265 ?auto_22264 ) ( not ( = ?auto_22263 ?auto_22264 ) ) ( not ( = ?auto_22263 ?auto_22265 ) ) ( not ( = ?auto_22263 ?auto_22266 ) ) ( not ( = ?auto_22264 ?auto_22265 ) ) ( not ( = ?auto_22264 ?auto_22266 ) ) ( not ( = ?auto_22265 ?auto_22266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22266 ?auto_22265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22267 - BLOCK
      ?auto_22268 - BLOCK
      ?auto_22269 - BLOCK
    )
    :vars
    (
      ?auto_22270 - BLOCK
      ?auto_22271 - BLOCK
      ?auto_22272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22270 ?auto_22269 ) ( CLEAR ?auto_22270 ) ( ON-TABLE ?auto_22267 ) ( ON ?auto_22268 ?auto_22267 ) ( ON ?auto_22269 ?auto_22268 ) ( not ( = ?auto_22267 ?auto_22268 ) ) ( not ( = ?auto_22267 ?auto_22269 ) ) ( not ( = ?auto_22267 ?auto_22270 ) ) ( not ( = ?auto_22268 ?auto_22269 ) ) ( not ( = ?auto_22268 ?auto_22270 ) ) ( not ( = ?auto_22269 ?auto_22270 ) ) ( HOLDING ?auto_22271 ) ( CLEAR ?auto_22272 ) ( not ( = ?auto_22267 ?auto_22271 ) ) ( not ( = ?auto_22267 ?auto_22272 ) ) ( not ( = ?auto_22268 ?auto_22271 ) ) ( not ( = ?auto_22268 ?auto_22272 ) ) ( not ( = ?auto_22269 ?auto_22271 ) ) ( not ( = ?auto_22269 ?auto_22272 ) ) ( not ( = ?auto_22270 ?auto_22271 ) ) ( not ( = ?auto_22270 ?auto_22272 ) ) ( not ( = ?auto_22271 ?auto_22272 ) ) )
    :subtasks
    ( ( !STACK ?auto_22271 ?auto_22272 )
      ( MAKE-3PILE ?auto_22267 ?auto_22268 ?auto_22269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22273 - BLOCK
      ?auto_22274 - BLOCK
      ?auto_22275 - BLOCK
    )
    :vars
    (
      ?auto_22277 - BLOCK
      ?auto_22276 - BLOCK
      ?auto_22278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22277 ?auto_22275 ) ( ON-TABLE ?auto_22273 ) ( ON ?auto_22274 ?auto_22273 ) ( ON ?auto_22275 ?auto_22274 ) ( not ( = ?auto_22273 ?auto_22274 ) ) ( not ( = ?auto_22273 ?auto_22275 ) ) ( not ( = ?auto_22273 ?auto_22277 ) ) ( not ( = ?auto_22274 ?auto_22275 ) ) ( not ( = ?auto_22274 ?auto_22277 ) ) ( not ( = ?auto_22275 ?auto_22277 ) ) ( CLEAR ?auto_22276 ) ( not ( = ?auto_22273 ?auto_22278 ) ) ( not ( = ?auto_22273 ?auto_22276 ) ) ( not ( = ?auto_22274 ?auto_22278 ) ) ( not ( = ?auto_22274 ?auto_22276 ) ) ( not ( = ?auto_22275 ?auto_22278 ) ) ( not ( = ?auto_22275 ?auto_22276 ) ) ( not ( = ?auto_22277 ?auto_22278 ) ) ( not ( = ?auto_22277 ?auto_22276 ) ) ( not ( = ?auto_22278 ?auto_22276 ) ) ( ON ?auto_22278 ?auto_22277 ) ( CLEAR ?auto_22278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22273 ?auto_22274 ?auto_22275 ?auto_22277 )
      ( MAKE-3PILE ?auto_22273 ?auto_22274 ?auto_22275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22279 - BLOCK
      ?auto_22280 - BLOCK
      ?auto_22281 - BLOCK
    )
    :vars
    (
      ?auto_22282 - BLOCK
      ?auto_22283 - BLOCK
      ?auto_22284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22282 ?auto_22281 ) ( ON-TABLE ?auto_22279 ) ( ON ?auto_22280 ?auto_22279 ) ( ON ?auto_22281 ?auto_22280 ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22283 ) ) ( not ( = ?auto_22279 ?auto_22284 ) ) ( not ( = ?auto_22280 ?auto_22283 ) ) ( not ( = ?auto_22280 ?auto_22284 ) ) ( not ( = ?auto_22281 ?auto_22283 ) ) ( not ( = ?auto_22281 ?auto_22284 ) ) ( not ( = ?auto_22282 ?auto_22283 ) ) ( not ( = ?auto_22282 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22284 ) ) ( ON ?auto_22283 ?auto_22282 ) ( CLEAR ?auto_22283 ) ( HOLDING ?auto_22284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22284 )
      ( MAKE-3PILE ?auto_22279 ?auto_22280 ?auto_22281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22285 - BLOCK
      ?auto_22286 - BLOCK
      ?auto_22287 - BLOCK
    )
    :vars
    (
      ?auto_22290 - BLOCK
      ?auto_22289 - BLOCK
      ?auto_22288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22290 ?auto_22287 ) ( ON-TABLE ?auto_22285 ) ( ON ?auto_22286 ?auto_22285 ) ( ON ?auto_22287 ?auto_22286 ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22285 ?auto_22287 ) ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22286 ?auto_22287 ) ) ( not ( = ?auto_22286 ?auto_22290 ) ) ( not ( = ?auto_22287 ?auto_22290 ) ) ( not ( = ?auto_22285 ?auto_22289 ) ) ( not ( = ?auto_22285 ?auto_22288 ) ) ( not ( = ?auto_22286 ?auto_22289 ) ) ( not ( = ?auto_22286 ?auto_22288 ) ) ( not ( = ?auto_22287 ?auto_22289 ) ) ( not ( = ?auto_22287 ?auto_22288 ) ) ( not ( = ?auto_22290 ?auto_22289 ) ) ( not ( = ?auto_22290 ?auto_22288 ) ) ( not ( = ?auto_22289 ?auto_22288 ) ) ( ON ?auto_22289 ?auto_22290 ) ( ON ?auto_22288 ?auto_22289 ) ( CLEAR ?auto_22288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22285 ?auto_22286 ?auto_22287 ?auto_22290 ?auto_22289 )
      ( MAKE-3PILE ?auto_22285 ?auto_22286 ?auto_22287 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22294 - BLOCK
      ?auto_22295 - BLOCK
      ?auto_22296 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22296 ) ( CLEAR ?auto_22295 ) ( ON-TABLE ?auto_22294 ) ( ON ?auto_22295 ?auto_22294 ) ( not ( = ?auto_22294 ?auto_22295 ) ) ( not ( = ?auto_22294 ?auto_22296 ) ) ( not ( = ?auto_22295 ?auto_22296 ) ) )
    :subtasks
    ( ( !STACK ?auto_22296 ?auto_22295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22297 - BLOCK
      ?auto_22298 - BLOCK
      ?auto_22299 - BLOCK
    )
    :vars
    (
      ?auto_22300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22298 ) ( ON-TABLE ?auto_22297 ) ( ON ?auto_22298 ?auto_22297 ) ( not ( = ?auto_22297 ?auto_22298 ) ) ( not ( = ?auto_22297 ?auto_22299 ) ) ( not ( = ?auto_22298 ?auto_22299 ) ) ( ON ?auto_22299 ?auto_22300 ) ( CLEAR ?auto_22299 ) ( HAND-EMPTY ) ( not ( = ?auto_22297 ?auto_22300 ) ) ( not ( = ?auto_22298 ?auto_22300 ) ) ( not ( = ?auto_22299 ?auto_22300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22299 ?auto_22300 )
      ( MAKE-3PILE ?auto_22297 ?auto_22298 ?auto_22299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22301 - BLOCK
      ?auto_22302 - BLOCK
      ?auto_22303 - BLOCK
    )
    :vars
    (
      ?auto_22304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22301 ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( not ( = ?auto_22301 ?auto_22303 ) ) ( not ( = ?auto_22302 ?auto_22303 ) ) ( ON ?auto_22303 ?auto_22304 ) ( CLEAR ?auto_22303 ) ( not ( = ?auto_22301 ?auto_22304 ) ) ( not ( = ?auto_22302 ?auto_22304 ) ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( HOLDING ?auto_22302 ) ( CLEAR ?auto_22301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22301 ?auto_22302 )
      ( MAKE-3PILE ?auto_22301 ?auto_22302 ?auto_22303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22305 - BLOCK
      ?auto_22306 - BLOCK
      ?auto_22307 - BLOCK
    )
    :vars
    (
      ?auto_22308 - BLOCK
      ?auto_22310 - BLOCK
      ?auto_22309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22305 ) ( not ( = ?auto_22305 ?auto_22306 ) ) ( not ( = ?auto_22305 ?auto_22307 ) ) ( not ( = ?auto_22306 ?auto_22307 ) ) ( ON ?auto_22307 ?auto_22308 ) ( not ( = ?auto_22305 ?auto_22308 ) ) ( not ( = ?auto_22306 ?auto_22308 ) ) ( not ( = ?auto_22307 ?auto_22308 ) ) ( CLEAR ?auto_22305 ) ( ON ?auto_22306 ?auto_22307 ) ( CLEAR ?auto_22306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22310 ) ( ON ?auto_22309 ?auto_22310 ) ( ON ?auto_22308 ?auto_22309 ) ( not ( = ?auto_22310 ?auto_22309 ) ) ( not ( = ?auto_22310 ?auto_22308 ) ) ( not ( = ?auto_22310 ?auto_22307 ) ) ( not ( = ?auto_22310 ?auto_22306 ) ) ( not ( = ?auto_22309 ?auto_22308 ) ) ( not ( = ?auto_22309 ?auto_22307 ) ) ( not ( = ?auto_22309 ?auto_22306 ) ) ( not ( = ?auto_22305 ?auto_22310 ) ) ( not ( = ?auto_22305 ?auto_22309 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22310 ?auto_22309 ?auto_22308 ?auto_22307 )
      ( MAKE-3PILE ?auto_22305 ?auto_22306 ?auto_22307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22311 - BLOCK
      ?auto_22312 - BLOCK
      ?auto_22313 - BLOCK
    )
    :vars
    (
      ?auto_22314 - BLOCK
      ?auto_22316 - BLOCK
      ?auto_22315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22311 ?auto_22312 ) ) ( not ( = ?auto_22311 ?auto_22313 ) ) ( not ( = ?auto_22312 ?auto_22313 ) ) ( ON ?auto_22313 ?auto_22314 ) ( not ( = ?auto_22311 ?auto_22314 ) ) ( not ( = ?auto_22312 ?auto_22314 ) ) ( not ( = ?auto_22313 ?auto_22314 ) ) ( ON ?auto_22312 ?auto_22313 ) ( CLEAR ?auto_22312 ) ( ON-TABLE ?auto_22316 ) ( ON ?auto_22315 ?auto_22316 ) ( ON ?auto_22314 ?auto_22315 ) ( not ( = ?auto_22316 ?auto_22315 ) ) ( not ( = ?auto_22316 ?auto_22314 ) ) ( not ( = ?auto_22316 ?auto_22313 ) ) ( not ( = ?auto_22316 ?auto_22312 ) ) ( not ( = ?auto_22315 ?auto_22314 ) ) ( not ( = ?auto_22315 ?auto_22313 ) ) ( not ( = ?auto_22315 ?auto_22312 ) ) ( not ( = ?auto_22311 ?auto_22316 ) ) ( not ( = ?auto_22311 ?auto_22315 ) ) ( HOLDING ?auto_22311 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22311 )
      ( MAKE-3PILE ?auto_22311 ?auto_22312 ?auto_22313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22317 - BLOCK
      ?auto_22318 - BLOCK
      ?auto_22319 - BLOCK
    )
    :vars
    (
      ?auto_22320 - BLOCK
      ?auto_22321 - BLOCK
      ?auto_22322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22317 ?auto_22318 ) ) ( not ( = ?auto_22317 ?auto_22319 ) ) ( not ( = ?auto_22318 ?auto_22319 ) ) ( ON ?auto_22319 ?auto_22320 ) ( not ( = ?auto_22317 ?auto_22320 ) ) ( not ( = ?auto_22318 ?auto_22320 ) ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( ON ?auto_22318 ?auto_22319 ) ( ON-TABLE ?auto_22321 ) ( ON ?auto_22322 ?auto_22321 ) ( ON ?auto_22320 ?auto_22322 ) ( not ( = ?auto_22321 ?auto_22322 ) ) ( not ( = ?auto_22321 ?auto_22320 ) ) ( not ( = ?auto_22321 ?auto_22319 ) ) ( not ( = ?auto_22321 ?auto_22318 ) ) ( not ( = ?auto_22322 ?auto_22320 ) ) ( not ( = ?auto_22322 ?auto_22319 ) ) ( not ( = ?auto_22322 ?auto_22318 ) ) ( not ( = ?auto_22317 ?auto_22321 ) ) ( not ( = ?auto_22317 ?auto_22322 ) ) ( ON ?auto_22317 ?auto_22318 ) ( CLEAR ?auto_22317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22321 ?auto_22322 ?auto_22320 ?auto_22319 ?auto_22318 )
      ( MAKE-3PILE ?auto_22317 ?auto_22318 ?auto_22319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22325 - BLOCK
      ?auto_22326 - BLOCK
    )
    :vars
    (
      ?auto_22327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22327 ?auto_22326 ) ( CLEAR ?auto_22327 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22325 ) ( ON ?auto_22326 ?auto_22325 ) ( not ( = ?auto_22325 ?auto_22326 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22327 ?auto_22326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22328 - BLOCK
      ?auto_22329 - BLOCK
    )
    :vars
    (
      ?auto_22330 - BLOCK
      ?auto_22331 - BLOCK
      ?auto_22332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22330 ?auto_22329 ) ( CLEAR ?auto_22330 ) ( ON-TABLE ?auto_22328 ) ( ON ?auto_22329 ?auto_22328 ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22328 ?auto_22330 ) ) ( not ( = ?auto_22329 ?auto_22330 ) ) ( HOLDING ?auto_22331 ) ( CLEAR ?auto_22332 ) ( not ( = ?auto_22328 ?auto_22331 ) ) ( not ( = ?auto_22328 ?auto_22332 ) ) ( not ( = ?auto_22329 ?auto_22331 ) ) ( not ( = ?auto_22329 ?auto_22332 ) ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22330 ?auto_22332 ) ) ( not ( = ?auto_22331 ?auto_22332 ) ) )
    :subtasks
    ( ( !STACK ?auto_22331 ?auto_22332 )
      ( MAKE-2PILE ?auto_22328 ?auto_22329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22333 - BLOCK
      ?auto_22334 - BLOCK
    )
    :vars
    (
      ?auto_22336 - BLOCK
      ?auto_22335 - BLOCK
      ?auto_22337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22336 ?auto_22334 ) ( ON-TABLE ?auto_22333 ) ( ON ?auto_22334 ?auto_22333 ) ( not ( = ?auto_22333 ?auto_22334 ) ) ( not ( = ?auto_22333 ?auto_22336 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( CLEAR ?auto_22335 ) ( not ( = ?auto_22333 ?auto_22337 ) ) ( not ( = ?auto_22333 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22337 ) ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22336 ?auto_22337 ) ) ( not ( = ?auto_22336 ?auto_22335 ) ) ( not ( = ?auto_22337 ?auto_22335 ) ) ( ON ?auto_22337 ?auto_22336 ) ( CLEAR ?auto_22337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22333 ?auto_22334 ?auto_22336 )
      ( MAKE-2PILE ?auto_22333 ?auto_22334 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22338 - BLOCK
      ?auto_22339 - BLOCK
    )
    :vars
    (
      ?auto_22340 - BLOCK
      ?auto_22342 - BLOCK
      ?auto_22341 - BLOCK
      ?auto_22343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22340 ?auto_22339 ) ( ON-TABLE ?auto_22338 ) ( ON ?auto_22339 ?auto_22338 ) ( not ( = ?auto_22338 ?auto_22339 ) ) ( not ( = ?auto_22338 ?auto_22340 ) ) ( not ( = ?auto_22339 ?auto_22340 ) ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22338 ?auto_22341 ) ) ( not ( = ?auto_22339 ?auto_22342 ) ) ( not ( = ?auto_22339 ?auto_22341 ) ) ( not ( = ?auto_22340 ?auto_22342 ) ) ( not ( = ?auto_22340 ?auto_22341 ) ) ( not ( = ?auto_22342 ?auto_22341 ) ) ( ON ?auto_22342 ?auto_22340 ) ( CLEAR ?auto_22342 ) ( HOLDING ?auto_22341 ) ( CLEAR ?auto_22343 ) ( ON-TABLE ?auto_22343 ) ( not ( = ?auto_22343 ?auto_22341 ) ) ( not ( = ?auto_22338 ?auto_22343 ) ) ( not ( = ?auto_22339 ?auto_22343 ) ) ( not ( = ?auto_22340 ?auto_22343 ) ) ( not ( = ?auto_22342 ?auto_22343 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22343 ?auto_22341 )
      ( MAKE-2PILE ?auto_22338 ?auto_22339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22344 - BLOCK
      ?auto_22345 - BLOCK
    )
    :vars
    (
      ?auto_22348 - BLOCK
      ?auto_22349 - BLOCK
      ?auto_22347 - BLOCK
      ?auto_22346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22348 ?auto_22345 ) ( ON-TABLE ?auto_22344 ) ( ON ?auto_22345 ?auto_22344 ) ( not ( = ?auto_22344 ?auto_22345 ) ) ( not ( = ?auto_22344 ?auto_22348 ) ) ( not ( = ?auto_22345 ?auto_22348 ) ) ( not ( = ?auto_22344 ?auto_22349 ) ) ( not ( = ?auto_22344 ?auto_22347 ) ) ( not ( = ?auto_22345 ?auto_22349 ) ) ( not ( = ?auto_22345 ?auto_22347 ) ) ( not ( = ?auto_22348 ?auto_22349 ) ) ( not ( = ?auto_22348 ?auto_22347 ) ) ( not ( = ?auto_22349 ?auto_22347 ) ) ( ON ?auto_22349 ?auto_22348 ) ( CLEAR ?auto_22346 ) ( ON-TABLE ?auto_22346 ) ( not ( = ?auto_22346 ?auto_22347 ) ) ( not ( = ?auto_22344 ?auto_22346 ) ) ( not ( = ?auto_22345 ?auto_22346 ) ) ( not ( = ?auto_22348 ?auto_22346 ) ) ( not ( = ?auto_22349 ?auto_22346 ) ) ( ON ?auto_22347 ?auto_22349 ) ( CLEAR ?auto_22347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22344 ?auto_22345 ?auto_22348 ?auto_22349 )
      ( MAKE-2PILE ?auto_22344 ?auto_22345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22350 - BLOCK
      ?auto_22351 - BLOCK
    )
    :vars
    (
      ?auto_22354 - BLOCK
      ?auto_22355 - BLOCK
      ?auto_22353 - BLOCK
      ?auto_22352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22354 ?auto_22351 ) ( ON-TABLE ?auto_22350 ) ( ON ?auto_22351 ?auto_22350 ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22350 ?auto_22354 ) ) ( not ( = ?auto_22351 ?auto_22354 ) ) ( not ( = ?auto_22350 ?auto_22355 ) ) ( not ( = ?auto_22350 ?auto_22353 ) ) ( not ( = ?auto_22351 ?auto_22355 ) ) ( not ( = ?auto_22351 ?auto_22353 ) ) ( not ( = ?auto_22354 ?auto_22355 ) ) ( not ( = ?auto_22354 ?auto_22353 ) ) ( not ( = ?auto_22355 ?auto_22353 ) ) ( ON ?auto_22355 ?auto_22354 ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( not ( = ?auto_22350 ?auto_22352 ) ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( not ( = ?auto_22354 ?auto_22352 ) ) ( not ( = ?auto_22355 ?auto_22352 ) ) ( ON ?auto_22353 ?auto_22355 ) ( CLEAR ?auto_22353 ) ( HOLDING ?auto_22352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22352 )
      ( MAKE-2PILE ?auto_22350 ?auto_22351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22356 - BLOCK
      ?auto_22357 - BLOCK
    )
    :vars
    (
      ?auto_22359 - BLOCK
      ?auto_22361 - BLOCK
      ?auto_22360 - BLOCK
      ?auto_22358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22359 ?auto_22357 ) ( ON-TABLE ?auto_22356 ) ( ON ?auto_22357 ?auto_22356 ) ( not ( = ?auto_22356 ?auto_22357 ) ) ( not ( = ?auto_22356 ?auto_22359 ) ) ( not ( = ?auto_22357 ?auto_22359 ) ) ( not ( = ?auto_22356 ?auto_22361 ) ) ( not ( = ?auto_22356 ?auto_22360 ) ) ( not ( = ?auto_22357 ?auto_22361 ) ) ( not ( = ?auto_22357 ?auto_22360 ) ) ( not ( = ?auto_22359 ?auto_22361 ) ) ( not ( = ?auto_22359 ?auto_22360 ) ) ( not ( = ?auto_22361 ?auto_22360 ) ) ( ON ?auto_22361 ?auto_22359 ) ( not ( = ?auto_22358 ?auto_22360 ) ) ( not ( = ?auto_22356 ?auto_22358 ) ) ( not ( = ?auto_22357 ?auto_22358 ) ) ( not ( = ?auto_22359 ?auto_22358 ) ) ( not ( = ?auto_22361 ?auto_22358 ) ) ( ON ?auto_22360 ?auto_22361 ) ( ON ?auto_22358 ?auto_22360 ) ( CLEAR ?auto_22358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22356 ?auto_22357 ?auto_22359 ?auto_22361 ?auto_22360 )
      ( MAKE-2PILE ?auto_22356 ?auto_22357 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22366 - BLOCK
      ?auto_22367 - BLOCK
      ?auto_22368 - BLOCK
      ?auto_22369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22369 ) ( CLEAR ?auto_22368 ) ( ON-TABLE ?auto_22366 ) ( ON ?auto_22367 ?auto_22366 ) ( ON ?auto_22368 ?auto_22367 ) ( not ( = ?auto_22366 ?auto_22367 ) ) ( not ( = ?auto_22366 ?auto_22368 ) ) ( not ( = ?auto_22366 ?auto_22369 ) ) ( not ( = ?auto_22367 ?auto_22368 ) ) ( not ( = ?auto_22367 ?auto_22369 ) ) ( not ( = ?auto_22368 ?auto_22369 ) ) )
    :subtasks
    ( ( !STACK ?auto_22369 ?auto_22368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22370 - BLOCK
      ?auto_22371 - BLOCK
      ?auto_22372 - BLOCK
      ?auto_22373 - BLOCK
    )
    :vars
    (
      ?auto_22374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22372 ) ( ON-TABLE ?auto_22370 ) ( ON ?auto_22371 ?auto_22370 ) ( ON ?auto_22372 ?auto_22371 ) ( not ( = ?auto_22370 ?auto_22371 ) ) ( not ( = ?auto_22370 ?auto_22372 ) ) ( not ( = ?auto_22370 ?auto_22373 ) ) ( not ( = ?auto_22371 ?auto_22372 ) ) ( not ( = ?auto_22371 ?auto_22373 ) ) ( not ( = ?auto_22372 ?auto_22373 ) ) ( ON ?auto_22373 ?auto_22374 ) ( CLEAR ?auto_22373 ) ( HAND-EMPTY ) ( not ( = ?auto_22370 ?auto_22374 ) ) ( not ( = ?auto_22371 ?auto_22374 ) ) ( not ( = ?auto_22372 ?auto_22374 ) ) ( not ( = ?auto_22373 ?auto_22374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22373 ?auto_22374 )
      ( MAKE-4PILE ?auto_22370 ?auto_22371 ?auto_22372 ?auto_22373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22375 - BLOCK
      ?auto_22376 - BLOCK
      ?auto_22377 - BLOCK
      ?auto_22378 - BLOCK
    )
    :vars
    (
      ?auto_22379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22375 ) ( ON ?auto_22376 ?auto_22375 ) ( not ( = ?auto_22375 ?auto_22376 ) ) ( not ( = ?auto_22375 ?auto_22377 ) ) ( not ( = ?auto_22375 ?auto_22378 ) ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22378 ) ) ( not ( = ?auto_22377 ?auto_22378 ) ) ( ON ?auto_22378 ?auto_22379 ) ( CLEAR ?auto_22378 ) ( not ( = ?auto_22375 ?auto_22379 ) ) ( not ( = ?auto_22376 ?auto_22379 ) ) ( not ( = ?auto_22377 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( HOLDING ?auto_22377 ) ( CLEAR ?auto_22376 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22375 ?auto_22376 ?auto_22377 )
      ( MAKE-4PILE ?auto_22375 ?auto_22376 ?auto_22377 ?auto_22378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22380 - BLOCK
      ?auto_22381 - BLOCK
      ?auto_22382 - BLOCK
      ?auto_22383 - BLOCK
    )
    :vars
    (
      ?auto_22384 - BLOCK
      ?auto_22385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22380 ) ( ON ?auto_22381 ?auto_22380 ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( ON ?auto_22383 ?auto_22384 ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( CLEAR ?auto_22381 ) ( ON ?auto_22382 ?auto_22383 ) ( CLEAR ?auto_22382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22385 ) ( ON ?auto_22384 ?auto_22385 ) ( not ( = ?auto_22385 ?auto_22384 ) ) ( not ( = ?auto_22385 ?auto_22383 ) ) ( not ( = ?auto_22385 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22385 ) ) ( not ( = ?auto_22381 ?auto_22385 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22385 ?auto_22384 ?auto_22383 )
      ( MAKE-4PILE ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22386 - BLOCK
      ?auto_22387 - BLOCK
      ?auto_22388 - BLOCK
      ?auto_22389 - BLOCK
    )
    :vars
    (
      ?auto_22390 - BLOCK
      ?auto_22391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22386 ) ( not ( = ?auto_22386 ?auto_22387 ) ) ( not ( = ?auto_22386 ?auto_22388 ) ) ( not ( = ?auto_22386 ?auto_22389 ) ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( not ( = ?auto_22387 ?auto_22389 ) ) ( not ( = ?auto_22388 ?auto_22389 ) ) ( ON ?auto_22389 ?auto_22390 ) ( not ( = ?auto_22386 ?auto_22390 ) ) ( not ( = ?auto_22387 ?auto_22390 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( not ( = ?auto_22389 ?auto_22390 ) ) ( ON ?auto_22388 ?auto_22389 ) ( CLEAR ?auto_22388 ) ( ON-TABLE ?auto_22391 ) ( ON ?auto_22390 ?auto_22391 ) ( not ( = ?auto_22391 ?auto_22390 ) ) ( not ( = ?auto_22391 ?auto_22389 ) ) ( not ( = ?auto_22391 ?auto_22388 ) ) ( not ( = ?auto_22386 ?auto_22391 ) ) ( not ( = ?auto_22387 ?auto_22391 ) ) ( HOLDING ?auto_22387 ) ( CLEAR ?auto_22386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22386 ?auto_22387 )
      ( MAKE-4PILE ?auto_22386 ?auto_22387 ?auto_22388 ?auto_22389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22392 - BLOCK
      ?auto_22393 - BLOCK
      ?auto_22394 - BLOCK
      ?auto_22395 - BLOCK
    )
    :vars
    (
      ?auto_22396 - BLOCK
      ?auto_22397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22392 ) ( not ( = ?auto_22392 ?auto_22393 ) ) ( not ( = ?auto_22392 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22395 ) ) ( not ( = ?auto_22393 ?auto_22394 ) ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( not ( = ?auto_22394 ?auto_22395 ) ) ( ON ?auto_22395 ?auto_22396 ) ( not ( = ?auto_22392 ?auto_22396 ) ) ( not ( = ?auto_22393 ?auto_22396 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( not ( = ?auto_22395 ?auto_22396 ) ) ( ON ?auto_22394 ?auto_22395 ) ( ON-TABLE ?auto_22397 ) ( ON ?auto_22396 ?auto_22397 ) ( not ( = ?auto_22397 ?auto_22396 ) ) ( not ( = ?auto_22397 ?auto_22395 ) ) ( not ( = ?auto_22397 ?auto_22394 ) ) ( not ( = ?auto_22392 ?auto_22397 ) ) ( not ( = ?auto_22393 ?auto_22397 ) ) ( CLEAR ?auto_22392 ) ( ON ?auto_22393 ?auto_22394 ) ( CLEAR ?auto_22393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22397 ?auto_22396 ?auto_22395 ?auto_22394 )
      ( MAKE-4PILE ?auto_22392 ?auto_22393 ?auto_22394 ?auto_22395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22398 - BLOCK
      ?auto_22399 - BLOCK
      ?auto_22400 - BLOCK
      ?auto_22401 - BLOCK
    )
    :vars
    (
      ?auto_22403 - BLOCK
      ?auto_22402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22398 ?auto_22399 ) ) ( not ( = ?auto_22398 ?auto_22400 ) ) ( not ( = ?auto_22398 ?auto_22401 ) ) ( not ( = ?auto_22399 ?auto_22400 ) ) ( not ( = ?auto_22399 ?auto_22401 ) ) ( not ( = ?auto_22400 ?auto_22401 ) ) ( ON ?auto_22401 ?auto_22403 ) ( not ( = ?auto_22398 ?auto_22403 ) ) ( not ( = ?auto_22399 ?auto_22403 ) ) ( not ( = ?auto_22400 ?auto_22403 ) ) ( not ( = ?auto_22401 ?auto_22403 ) ) ( ON ?auto_22400 ?auto_22401 ) ( ON-TABLE ?auto_22402 ) ( ON ?auto_22403 ?auto_22402 ) ( not ( = ?auto_22402 ?auto_22403 ) ) ( not ( = ?auto_22402 ?auto_22401 ) ) ( not ( = ?auto_22402 ?auto_22400 ) ) ( not ( = ?auto_22398 ?auto_22402 ) ) ( not ( = ?auto_22399 ?auto_22402 ) ) ( ON ?auto_22399 ?auto_22400 ) ( CLEAR ?auto_22399 ) ( HOLDING ?auto_22398 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22398 )
      ( MAKE-4PILE ?auto_22398 ?auto_22399 ?auto_22400 ?auto_22401 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22404 - BLOCK
      ?auto_22405 - BLOCK
      ?auto_22406 - BLOCK
      ?auto_22407 - BLOCK
    )
    :vars
    (
      ?auto_22409 - BLOCK
      ?auto_22408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22404 ?auto_22405 ) ) ( not ( = ?auto_22404 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22407 ) ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22405 ?auto_22407 ) ) ( not ( = ?auto_22406 ?auto_22407 ) ) ( ON ?auto_22407 ?auto_22409 ) ( not ( = ?auto_22404 ?auto_22409 ) ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22407 ?auto_22409 ) ) ( ON ?auto_22406 ?auto_22407 ) ( ON-TABLE ?auto_22408 ) ( ON ?auto_22409 ?auto_22408 ) ( not ( = ?auto_22408 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22407 ) ) ( not ( = ?auto_22408 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22408 ) ) ( not ( = ?auto_22405 ?auto_22408 ) ) ( ON ?auto_22405 ?auto_22406 ) ( ON ?auto_22404 ?auto_22405 ) ( CLEAR ?auto_22404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22408 ?auto_22409 ?auto_22407 ?auto_22406 ?auto_22405 )
      ( MAKE-4PILE ?auto_22404 ?auto_22405 ?auto_22406 ?auto_22407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22411 - BLOCK
    )
    :vars
    (
      ?auto_22412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22412 ?auto_22411 ) ( CLEAR ?auto_22412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22411 ) ( not ( = ?auto_22411 ?auto_22412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22412 ?auto_22411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22413 - BLOCK
    )
    :vars
    (
      ?auto_22414 - BLOCK
      ?auto_22415 - BLOCK
      ?auto_22416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22414 ?auto_22413 ) ( CLEAR ?auto_22414 ) ( ON-TABLE ?auto_22413 ) ( not ( = ?auto_22413 ?auto_22414 ) ) ( HOLDING ?auto_22415 ) ( CLEAR ?auto_22416 ) ( not ( = ?auto_22413 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22416 ) ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( not ( = ?auto_22414 ?auto_22416 ) ) ( not ( = ?auto_22415 ?auto_22416 ) ) )
    :subtasks
    ( ( !STACK ?auto_22415 ?auto_22416 )
      ( MAKE-1PILE ?auto_22413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22417 - BLOCK
    )
    :vars
    (
      ?auto_22419 - BLOCK
      ?auto_22418 - BLOCK
      ?auto_22420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22419 ?auto_22417 ) ( ON-TABLE ?auto_22417 ) ( not ( = ?auto_22417 ?auto_22419 ) ) ( CLEAR ?auto_22418 ) ( not ( = ?auto_22417 ?auto_22420 ) ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( not ( = ?auto_22419 ?auto_22420 ) ) ( not ( = ?auto_22419 ?auto_22418 ) ) ( not ( = ?auto_22420 ?auto_22418 ) ) ( ON ?auto_22420 ?auto_22419 ) ( CLEAR ?auto_22420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22417 ?auto_22419 )
      ( MAKE-1PILE ?auto_22417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22421 - BLOCK
    )
    :vars
    (
      ?auto_22424 - BLOCK
      ?auto_22423 - BLOCK
      ?auto_22422 - BLOCK
      ?auto_22425 - BLOCK
      ?auto_22426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22424 ?auto_22421 ) ( ON-TABLE ?auto_22421 ) ( not ( = ?auto_22421 ?auto_22424 ) ) ( not ( = ?auto_22421 ?auto_22423 ) ) ( not ( = ?auto_22421 ?auto_22422 ) ) ( not ( = ?auto_22424 ?auto_22423 ) ) ( not ( = ?auto_22424 ?auto_22422 ) ) ( not ( = ?auto_22423 ?auto_22422 ) ) ( ON ?auto_22423 ?auto_22424 ) ( CLEAR ?auto_22423 ) ( HOLDING ?auto_22422 ) ( CLEAR ?auto_22425 ) ( ON-TABLE ?auto_22426 ) ( ON ?auto_22425 ?auto_22426 ) ( not ( = ?auto_22426 ?auto_22425 ) ) ( not ( = ?auto_22426 ?auto_22422 ) ) ( not ( = ?auto_22425 ?auto_22422 ) ) ( not ( = ?auto_22421 ?auto_22425 ) ) ( not ( = ?auto_22421 ?auto_22426 ) ) ( not ( = ?auto_22424 ?auto_22425 ) ) ( not ( = ?auto_22424 ?auto_22426 ) ) ( not ( = ?auto_22423 ?auto_22425 ) ) ( not ( = ?auto_22423 ?auto_22426 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22426 ?auto_22425 ?auto_22422 )
      ( MAKE-1PILE ?auto_22421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22427 - BLOCK
    )
    :vars
    (
      ?auto_22431 - BLOCK
      ?auto_22432 - BLOCK
      ?auto_22428 - BLOCK
      ?auto_22429 - BLOCK
      ?auto_22430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22431 ?auto_22427 ) ( ON-TABLE ?auto_22427 ) ( not ( = ?auto_22427 ?auto_22431 ) ) ( not ( = ?auto_22427 ?auto_22432 ) ) ( not ( = ?auto_22427 ?auto_22428 ) ) ( not ( = ?auto_22431 ?auto_22432 ) ) ( not ( = ?auto_22431 ?auto_22428 ) ) ( not ( = ?auto_22432 ?auto_22428 ) ) ( ON ?auto_22432 ?auto_22431 ) ( CLEAR ?auto_22429 ) ( ON-TABLE ?auto_22430 ) ( ON ?auto_22429 ?auto_22430 ) ( not ( = ?auto_22430 ?auto_22429 ) ) ( not ( = ?auto_22430 ?auto_22428 ) ) ( not ( = ?auto_22429 ?auto_22428 ) ) ( not ( = ?auto_22427 ?auto_22429 ) ) ( not ( = ?auto_22427 ?auto_22430 ) ) ( not ( = ?auto_22431 ?auto_22429 ) ) ( not ( = ?auto_22431 ?auto_22430 ) ) ( not ( = ?auto_22432 ?auto_22429 ) ) ( not ( = ?auto_22432 ?auto_22430 ) ) ( ON ?auto_22428 ?auto_22432 ) ( CLEAR ?auto_22428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22427 ?auto_22431 ?auto_22432 )
      ( MAKE-1PILE ?auto_22427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22433 - BLOCK
    )
    :vars
    (
      ?auto_22437 - BLOCK
      ?auto_22436 - BLOCK
      ?auto_22438 - BLOCK
      ?auto_22434 - BLOCK
      ?auto_22435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22437 ?auto_22433 ) ( ON-TABLE ?auto_22433 ) ( not ( = ?auto_22433 ?auto_22437 ) ) ( not ( = ?auto_22433 ?auto_22436 ) ) ( not ( = ?auto_22433 ?auto_22438 ) ) ( not ( = ?auto_22437 ?auto_22436 ) ) ( not ( = ?auto_22437 ?auto_22438 ) ) ( not ( = ?auto_22436 ?auto_22438 ) ) ( ON ?auto_22436 ?auto_22437 ) ( ON-TABLE ?auto_22434 ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22434 ?auto_22438 ) ) ( not ( = ?auto_22435 ?auto_22438 ) ) ( not ( = ?auto_22433 ?auto_22435 ) ) ( not ( = ?auto_22433 ?auto_22434 ) ) ( not ( = ?auto_22437 ?auto_22435 ) ) ( not ( = ?auto_22437 ?auto_22434 ) ) ( not ( = ?auto_22436 ?auto_22435 ) ) ( not ( = ?auto_22436 ?auto_22434 ) ) ( ON ?auto_22438 ?auto_22436 ) ( CLEAR ?auto_22438 ) ( HOLDING ?auto_22435 ) ( CLEAR ?auto_22434 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22434 ?auto_22435 )
      ( MAKE-1PILE ?auto_22433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22439 - BLOCK
    )
    :vars
    (
      ?auto_22442 - BLOCK
      ?auto_22441 - BLOCK
      ?auto_22440 - BLOCK
      ?auto_22444 - BLOCK
      ?auto_22443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22442 ?auto_22439 ) ( ON-TABLE ?auto_22439 ) ( not ( = ?auto_22439 ?auto_22442 ) ) ( not ( = ?auto_22439 ?auto_22441 ) ) ( not ( = ?auto_22439 ?auto_22440 ) ) ( not ( = ?auto_22442 ?auto_22441 ) ) ( not ( = ?auto_22442 ?auto_22440 ) ) ( not ( = ?auto_22441 ?auto_22440 ) ) ( ON ?auto_22441 ?auto_22442 ) ( ON-TABLE ?auto_22444 ) ( not ( = ?auto_22444 ?auto_22443 ) ) ( not ( = ?auto_22444 ?auto_22440 ) ) ( not ( = ?auto_22443 ?auto_22440 ) ) ( not ( = ?auto_22439 ?auto_22443 ) ) ( not ( = ?auto_22439 ?auto_22444 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22444 ) ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( not ( = ?auto_22441 ?auto_22444 ) ) ( ON ?auto_22440 ?auto_22441 ) ( CLEAR ?auto_22444 ) ( ON ?auto_22443 ?auto_22440 ) ( CLEAR ?auto_22443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22439 ?auto_22442 ?auto_22441 ?auto_22440 )
      ( MAKE-1PILE ?auto_22439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22445 - BLOCK
    )
    :vars
    (
      ?auto_22449 - BLOCK
      ?auto_22447 - BLOCK
      ?auto_22450 - BLOCK
      ?auto_22446 - BLOCK
      ?auto_22448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22449 ?auto_22445 ) ( ON-TABLE ?auto_22445 ) ( not ( = ?auto_22445 ?auto_22449 ) ) ( not ( = ?auto_22445 ?auto_22447 ) ) ( not ( = ?auto_22445 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22447 ) ) ( not ( = ?auto_22449 ?auto_22450 ) ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( ON ?auto_22447 ?auto_22449 ) ( not ( = ?auto_22446 ?auto_22448 ) ) ( not ( = ?auto_22446 ?auto_22450 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22445 ?auto_22448 ) ) ( not ( = ?auto_22445 ?auto_22446 ) ) ( not ( = ?auto_22449 ?auto_22448 ) ) ( not ( = ?auto_22449 ?auto_22446 ) ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22447 ?auto_22446 ) ) ( ON ?auto_22450 ?auto_22447 ) ( ON ?auto_22448 ?auto_22450 ) ( CLEAR ?auto_22448 ) ( HOLDING ?auto_22446 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22446 )
      ( MAKE-1PILE ?auto_22445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22451 - BLOCK
    )
    :vars
    (
      ?auto_22453 - BLOCK
      ?auto_22454 - BLOCK
      ?auto_22452 - BLOCK
      ?auto_22455 - BLOCK
      ?auto_22456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22453 ?auto_22451 ) ( ON-TABLE ?auto_22451 ) ( not ( = ?auto_22451 ?auto_22453 ) ) ( not ( = ?auto_22451 ?auto_22454 ) ) ( not ( = ?auto_22451 ?auto_22452 ) ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( not ( = ?auto_22453 ?auto_22452 ) ) ( not ( = ?auto_22454 ?auto_22452 ) ) ( ON ?auto_22454 ?auto_22453 ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22455 ?auto_22452 ) ) ( not ( = ?auto_22456 ?auto_22452 ) ) ( not ( = ?auto_22451 ?auto_22456 ) ) ( not ( = ?auto_22451 ?auto_22455 ) ) ( not ( = ?auto_22453 ?auto_22456 ) ) ( not ( = ?auto_22453 ?auto_22455 ) ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( ON ?auto_22452 ?auto_22454 ) ( ON ?auto_22456 ?auto_22452 ) ( ON ?auto_22455 ?auto_22456 ) ( CLEAR ?auto_22455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22451 ?auto_22453 ?auto_22454 ?auto_22452 ?auto_22456 )
      ( MAKE-1PILE ?auto_22451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22462 - BLOCK
      ?auto_22463 - BLOCK
      ?auto_22464 - BLOCK
      ?auto_22465 - BLOCK
      ?auto_22466 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22466 ) ( CLEAR ?auto_22465 ) ( ON-TABLE ?auto_22462 ) ( ON ?auto_22463 ?auto_22462 ) ( ON ?auto_22464 ?auto_22463 ) ( ON ?auto_22465 ?auto_22464 ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( not ( = ?auto_22462 ?auto_22465 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) ( not ( = ?auto_22463 ?auto_22464 ) ) ( not ( = ?auto_22463 ?auto_22465 ) ) ( not ( = ?auto_22463 ?auto_22466 ) ) ( not ( = ?auto_22464 ?auto_22465 ) ) ( not ( = ?auto_22464 ?auto_22466 ) ) ( not ( = ?auto_22465 ?auto_22466 ) ) )
    :subtasks
    ( ( !STACK ?auto_22466 ?auto_22465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22467 - BLOCK
      ?auto_22468 - BLOCK
      ?auto_22469 - BLOCK
      ?auto_22470 - BLOCK
      ?auto_22471 - BLOCK
    )
    :vars
    (
      ?auto_22472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22470 ) ( ON-TABLE ?auto_22467 ) ( ON ?auto_22468 ?auto_22467 ) ( ON ?auto_22469 ?auto_22468 ) ( ON ?auto_22470 ?auto_22469 ) ( not ( = ?auto_22467 ?auto_22468 ) ) ( not ( = ?auto_22467 ?auto_22469 ) ) ( not ( = ?auto_22467 ?auto_22470 ) ) ( not ( = ?auto_22467 ?auto_22471 ) ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22468 ?auto_22470 ) ) ( not ( = ?auto_22468 ?auto_22471 ) ) ( not ( = ?auto_22469 ?auto_22470 ) ) ( not ( = ?auto_22469 ?auto_22471 ) ) ( not ( = ?auto_22470 ?auto_22471 ) ) ( ON ?auto_22471 ?auto_22472 ) ( CLEAR ?auto_22471 ) ( HAND-EMPTY ) ( not ( = ?auto_22467 ?auto_22472 ) ) ( not ( = ?auto_22468 ?auto_22472 ) ) ( not ( = ?auto_22469 ?auto_22472 ) ) ( not ( = ?auto_22470 ?auto_22472 ) ) ( not ( = ?auto_22471 ?auto_22472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22471 ?auto_22472 )
      ( MAKE-5PILE ?auto_22467 ?auto_22468 ?auto_22469 ?auto_22470 ?auto_22471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22473 - BLOCK
      ?auto_22474 - BLOCK
      ?auto_22475 - BLOCK
      ?auto_22476 - BLOCK
      ?auto_22477 - BLOCK
    )
    :vars
    (
      ?auto_22478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22473 ) ( ON ?auto_22474 ?auto_22473 ) ( ON ?auto_22475 ?auto_22474 ) ( not ( = ?auto_22473 ?auto_22474 ) ) ( not ( = ?auto_22473 ?auto_22475 ) ) ( not ( = ?auto_22473 ?auto_22476 ) ) ( not ( = ?auto_22473 ?auto_22477 ) ) ( not ( = ?auto_22474 ?auto_22475 ) ) ( not ( = ?auto_22474 ?auto_22476 ) ) ( not ( = ?auto_22474 ?auto_22477 ) ) ( not ( = ?auto_22475 ?auto_22476 ) ) ( not ( = ?auto_22475 ?auto_22477 ) ) ( not ( = ?auto_22476 ?auto_22477 ) ) ( ON ?auto_22477 ?auto_22478 ) ( CLEAR ?auto_22477 ) ( not ( = ?auto_22473 ?auto_22478 ) ) ( not ( = ?auto_22474 ?auto_22478 ) ) ( not ( = ?auto_22475 ?auto_22478 ) ) ( not ( = ?auto_22476 ?auto_22478 ) ) ( not ( = ?auto_22477 ?auto_22478 ) ) ( HOLDING ?auto_22476 ) ( CLEAR ?auto_22475 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22473 ?auto_22474 ?auto_22475 ?auto_22476 )
      ( MAKE-5PILE ?auto_22473 ?auto_22474 ?auto_22475 ?auto_22476 ?auto_22477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22479 - BLOCK
      ?auto_22480 - BLOCK
      ?auto_22481 - BLOCK
      ?auto_22482 - BLOCK
      ?auto_22483 - BLOCK
    )
    :vars
    (
      ?auto_22484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22479 ) ( ON ?auto_22480 ?auto_22479 ) ( ON ?auto_22481 ?auto_22480 ) ( not ( = ?auto_22479 ?auto_22480 ) ) ( not ( = ?auto_22479 ?auto_22481 ) ) ( not ( = ?auto_22479 ?auto_22482 ) ) ( not ( = ?auto_22479 ?auto_22483 ) ) ( not ( = ?auto_22480 ?auto_22481 ) ) ( not ( = ?auto_22480 ?auto_22482 ) ) ( not ( = ?auto_22480 ?auto_22483 ) ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22481 ?auto_22483 ) ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( ON ?auto_22483 ?auto_22484 ) ( not ( = ?auto_22479 ?auto_22484 ) ) ( not ( = ?auto_22480 ?auto_22484 ) ) ( not ( = ?auto_22481 ?auto_22484 ) ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( CLEAR ?auto_22481 ) ( ON ?auto_22482 ?auto_22483 ) ( CLEAR ?auto_22482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22484 ?auto_22483 )
      ( MAKE-5PILE ?auto_22479 ?auto_22480 ?auto_22481 ?auto_22482 ?auto_22483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22485 - BLOCK
      ?auto_22486 - BLOCK
      ?auto_22487 - BLOCK
      ?auto_22488 - BLOCK
      ?auto_22489 - BLOCK
    )
    :vars
    (
      ?auto_22490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22485 ) ( ON ?auto_22486 ?auto_22485 ) ( not ( = ?auto_22485 ?auto_22486 ) ) ( not ( = ?auto_22485 ?auto_22487 ) ) ( not ( = ?auto_22485 ?auto_22488 ) ) ( not ( = ?auto_22485 ?auto_22489 ) ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22486 ?auto_22488 ) ) ( not ( = ?auto_22486 ?auto_22489 ) ) ( not ( = ?auto_22487 ?auto_22488 ) ) ( not ( = ?auto_22487 ?auto_22489 ) ) ( not ( = ?auto_22488 ?auto_22489 ) ) ( ON ?auto_22489 ?auto_22490 ) ( not ( = ?auto_22485 ?auto_22490 ) ) ( not ( = ?auto_22486 ?auto_22490 ) ) ( not ( = ?auto_22487 ?auto_22490 ) ) ( not ( = ?auto_22488 ?auto_22490 ) ) ( not ( = ?auto_22489 ?auto_22490 ) ) ( ON ?auto_22488 ?auto_22489 ) ( CLEAR ?auto_22488 ) ( ON-TABLE ?auto_22490 ) ( HOLDING ?auto_22487 ) ( CLEAR ?auto_22486 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22485 ?auto_22486 ?auto_22487 )
      ( MAKE-5PILE ?auto_22485 ?auto_22486 ?auto_22487 ?auto_22488 ?auto_22489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22491 - BLOCK
      ?auto_22492 - BLOCK
      ?auto_22493 - BLOCK
      ?auto_22494 - BLOCK
      ?auto_22495 - BLOCK
    )
    :vars
    (
      ?auto_22496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22491 ) ( ON ?auto_22492 ?auto_22491 ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22494 ) ) ( not ( = ?auto_22491 ?auto_22495 ) ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22494 ) ) ( not ( = ?auto_22492 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( ON ?auto_22495 ?auto_22496 ) ( not ( = ?auto_22491 ?auto_22496 ) ) ( not ( = ?auto_22492 ?auto_22496 ) ) ( not ( = ?auto_22493 ?auto_22496 ) ) ( not ( = ?auto_22494 ?auto_22496 ) ) ( not ( = ?auto_22495 ?auto_22496 ) ) ( ON ?auto_22494 ?auto_22495 ) ( ON-TABLE ?auto_22496 ) ( CLEAR ?auto_22492 ) ( ON ?auto_22493 ?auto_22494 ) ( CLEAR ?auto_22493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22496 ?auto_22495 ?auto_22494 )
      ( MAKE-5PILE ?auto_22491 ?auto_22492 ?auto_22493 ?auto_22494 ?auto_22495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22497 - BLOCK
      ?auto_22498 - BLOCK
      ?auto_22499 - BLOCK
      ?auto_22500 - BLOCK
      ?auto_22501 - BLOCK
    )
    :vars
    (
      ?auto_22502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22497 ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22497 ?auto_22499 ) ) ( not ( = ?auto_22497 ?auto_22500 ) ) ( not ( = ?auto_22497 ?auto_22501 ) ) ( not ( = ?auto_22498 ?auto_22499 ) ) ( not ( = ?auto_22498 ?auto_22500 ) ) ( not ( = ?auto_22498 ?auto_22501 ) ) ( not ( = ?auto_22499 ?auto_22500 ) ) ( not ( = ?auto_22499 ?auto_22501 ) ) ( not ( = ?auto_22500 ?auto_22501 ) ) ( ON ?auto_22501 ?auto_22502 ) ( not ( = ?auto_22497 ?auto_22502 ) ) ( not ( = ?auto_22498 ?auto_22502 ) ) ( not ( = ?auto_22499 ?auto_22502 ) ) ( not ( = ?auto_22500 ?auto_22502 ) ) ( not ( = ?auto_22501 ?auto_22502 ) ) ( ON ?auto_22500 ?auto_22501 ) ( ON-TABLE ?auto_22502 ) ( ON ?auto_22499 ?auto_22500 ) ( CLEAR ?auto_22499 ) ( HOLDING ?auto_22498 ) ( CLEAR ?auto_22497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22497 ?auto_22498 )
      ( MAKE-5PILE ?auto_22497 ?auto_22498 ?auto_22499 ?auto_22500 ?auto_22501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22503 - BLOCK
      ?auto_22504 - BLOCK
      ?auto_22505 - BLOCK
      ?auto_22506 - BLOCK
      ?auto_22507 - BLOCK
    )
    :vars
    (
      ?auto_22508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22503 ) ( not ( = ?auto_22503 ?auto_22504 ) ) ( not ( = ?auto_22503 ?auto_22505 ) ) ( not ( = ?auto_22503 ?auto_22506 ) ) ( not ( = ?auto_22503 ?auto_22507 ) ) ( not ( = ?auto_22504 ?auto_22505 ) ) ( not ( = ?auto_22504 ?auto_22506 ) ) ( not ( = ?auto_22504 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( not ( = ?auto_22505 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( ON ?auto_22507 ?auto_22508 ) ( not ( = ?auto_22503 ?auto_22508 ) ) ( not ( = ?auto_22504 ?auto_22508 ) ) ( not ( = ?auto_22505 ?auto_22508 ) ) ( not ( = ?auto_22506 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( ON ?auto_22506 ?auto_22507 ) ( ON-TABLE ?auto_22508 ) ( ON ?auto_22505 ?auto_22506 ) ( CLEAR ?auto_22503 ) ( ON ?auto_22504 ?auto_22505 ) ( CLEAR ?auto_22504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22508 ?auto_22507 ?auto_22506 ?auto_22505 )
      ( MAKE-5PILE ?auto_22503 ?auto_22504 ?auto_22505 ?auto_22506 ?auto_22507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22509 - BLOCK
      ?auto_22510 - BLOCK
      ?auto_22511 - BLOCK
      ?auto_22512 - BLOCK
      ?auto_22513 - BLOCK
    )
    :vars
    (
      ?auto_22514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22509 ?auto_22511 ) ) ( not ( = ?auto_22509 ?auto_22512 ) ) ( not ( = ?auto_22509 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22512 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( not ( = ?auto_22511 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( ON ?auto_22513 ?auto_22514 ) ( not ( = ?auto_22509 ?auto_22514 ) ) ( not ( = ?auto_22510 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( ON ?auto_22512 ?auto_22513 ) ( ON-TABLE ?auto_22514 ) ( ON ?auto_22511 ?auto_22512 ) ( ON ?auto_22510 ?auto_22511 ) ( CLEAR ?auto_22510 ) ( HOLDING ?auto_22509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22509 )
      ( MAKE-5PILE ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ?auto_22513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22515 - BLOCK
      ?auto_22516 - BLOCK
      ?auto_22517 - BLOCK
      ?auto_22518 - BLOCK
      ?auto_22519 - BLOCK
    )
    :vars
    (
      ?auto_22520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22515 ?auto_22516 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22518 ) ) ( not ( = ?auto_22515 ?auto_22519 ) ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22518 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( ON ?auto_22519 ?auto_22520 ) ( not ( = ?auto_22515 ?auto_22520 ) ) ( not ( = ?auto_22516 ?auto_22520 ) ) ( not ( = ?auto_22517 ?auto_22520 ) ) ( not ( = ?auto_22518 ?auto_22520 ) ) ( not ( = ?auto_22519 ?auto_22520 ) ) ( ON ?auto_22518 ?auto_22519 ) ( ON-TABLE ?auto_22520 ) ( ON ?auto_22517 ?auto_22518 ) ( ON ?auto_22516 ?auto_22517 ) ( ON ?auto_22515 ?auto_22516 ) ( CLEAR ?auto_22515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22520 ?auto_22519 ?auto_22518 ?auto_22517 ?auto_22516 )
      ( MAKE-5PILE ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 ?auto_22519 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22525 - BLOCK
      ?auto_22526 - BLOCK
      ?auto_22527 - BLOCK
      ?auto_22528 - BLOCK
    )
    :vars
    (
      ?auto_22529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22529 ?auto_22528 ) ( CLEAR ?auto_22529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22525 ) ( ON ?auto_22526 ?auto_22525 ) ( ON ?auto_22527 ?auto_22526 ) ( ON ?auto_22528 ?auto_22527 ) ( not ( = ?auto_22525 ?auto_22526 ) ) ( not ( = ?auto_22525 ?auto_22527 ) ) ( not ( = ?auto_22525 ?auto_22528 ) ) ( not ( = ?auto_22525 ?auto_22529 ) ) ( not ( = ?auto_22526 ?auto_22527 ) ) ( not ( = ?auto_22526 ?auto_22528 ) ) ( not ( = ?auto_22526 ?auto_22529 ) ) ( not ( = ?auto_22527 ?auto_22528 ) ) ( not ( = ?auto_22527 ?auto_22529 ) ) ( not ( = ?auto_22528 ?auto_22529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22529 ?auto_22528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22541 - BLOCK
      ?auto_22542 - BLOCK
      ?auto_22543 - BLOCK
      ?auto_22544 - BLOCK
    )
    :vars
    (
      ?auto_22545 - BLOCK
      ?auto_22546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22541 ) ( ON ?auto_22542 ?auto_22541 ) ( ON ?auto_22543 ?auto_22542 ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22543 ) ) ( not ( = ?auto_22541 ?auto_22544 ) ) ( not ( = ?auto_22541 ?auto_22545 ) ) ( not ( = ?auto_22542 ?auto_22543 ) ) ( not ( = ?auto_22542 ?auto_22544 ) ) ( not ( = ?auto_22542 ?auto_22545 ) ) ( not ( = ?auto_22543 ?auto_22544 ) ) ( not ( = ?auto_22543 ?auto_22545 ) ) ( not ( = ?auto_22544 ?auto_22545 ) ) ( ON ?auto_22545 ?auto_22546 ) ( CLEAR ?auto_22545 ) ( not ( = ?auto_22541 ?auto_22546 ) ) ( not ( = ?auto_22542 ?auto_22546 ) ) ( not ( = ?auto_22543 ?auto_22546 ) ) ( not ( = ?auto_22544 ?auto_22546 ) ) ( not ( = ?auto_22545 ?auto_22546 ) ) ( HOLDING ?auto_22544 ) ( CLEAR ?auto_22543 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22541 ?auto_22542 ?auto_22543 ?auto_22544 ?auto_22545 )
      ( MAKE-4PILE ?auto_22541 ?auto_22542 ?auto_22543 ?auto_22544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22547 - BLOCK
      ?auto_22548 - BLOCK
      ?auto_22549 - BLOCK
      ?auto_22550 - BLOCK
    )
    :vars
    (
      ?auto_22552 - BLOCK
      ?auto_22551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22547 ) ( ON ?auto_22548 ?auto_22547 ) ( ON ?auto_22549 ?auto_22548 ) ( not ( = ?auto_22547 ?auto_22548 ) ) ( not ( = ?auto_22547 ?auto_22549 ) ) ( not ( = ?auto_22547 ?auto_22550 ) ) ( not ( = ?auto_22547 ?auto_22552 ) ) ( not ( = ?auto_22548 ?auto_22549 ) ) ( not ( = ?auto_22548 ?auto_22550 ) ) ( not ( = ?auto_22548 ?auto_22552 ) ) ( not ( = ?auto_22549 ?auto_22550 ) ) ( not ( = ?auto_22549 ?auto_22552 ) ) ( not ( = ?auto_22550 ?auto_22552 ) ) ( ON ?auto_22552 ?auto_22551 ) ( not ( = ?auto_22547 ?auto_22551 ) ) ( not ( = ?auto_22548 ?auto_22551 ) ) ( not ( = ?auto_22549 ?auto_22551 ) ) ( not ( = ?auto_22550 ?auto_22551 ) ) ( not ( = ?auto_22552 ?auto_22551 ) ) ( CLEAR ?auto_22549 ) ( ON ?auto_22550 ?auto_22552 ) ( CLEAR ?auto_22550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22551 ?auto_22552 )
      ( MAKE-4PILE ?auto_22547 ?auto_22548 ?auto_22549 ?auto_22550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22553 - BLOCK
      ?auto_22554 - BLOCK
      ?auto_22555 - BLOCK
      ?auto_22556 - BLOCK
    )
    :vars
    (
      ?auto_22557 - BLOCK
      ?auto_22558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22553 ) ( ON ?auto_22554 ?auto_22553 ) ( not ( = ?auto_22553 ?auto_22554 ) ) ( not ( = ?auto_22553 ?auto_22555 ) ) ( not ( = ?auto_22553 ?auto_22556 ) ) ( not ( = ?auto_22553 ?auto_22557 ) ) ( not ( = ?auto_22554 ?auto_22555 ) ) ( not ( = ?auto_22554 ?auto_22556 ) ) ( not ( = ?auto_22554 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22556 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( ON ?auto_22557 ?auto_22558 ) ( not ( = ?auto_22553 ?auto_22558 ) ) ( not ( = ?auto_22554 ?auto_22558 ) ) ( not ( = ?auto_22555 ?auto_22558 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( ON ?auto_22556 ?auto_22557 ) ( CLEAR ?auto_22556 ) ( ON-TABLE ?auto_22558 ) ( HOLDING ?auto_22555 ) ( CLEAR ?auto_22554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22553 ?auto_22554 ?auto_22555 )
      ( MAKE-4PILE ?auto_22553 ?auto_22554 ?auto_22555 ?auto_22556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22559 - BLOCK
      ?auto_22560 - BLOCK
      ?auto_22561 - BLOCK
      ?auto_22562 - BLOCK
    )
    :vars
    (
      ?auto_22563 - BLOCK
      ?auto_22564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22559 ) ( ON ?auto_22560 ?auto_22559 ) ( not ( = ?auto_22559 ?auto_22560 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22559 ?auto_22562 ) ) ( not ( = ?auto_22559 ?auto_22563 ) ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22560 ?auto_22562 ) ) ( not ( = ?auto_22560 ?auto_22563 ) ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22563 ) ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( ON ?auto_22563 ?auto_22564 ) ( not ( = ?auto_22559 ?auto_22564 ) ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22564 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22563 ?auto_22564 ) ) ( ON ?auto_22562 ?auto_22563 ) ( ON-TABLE ?auto_22564 ) ( CLEAR ?auto_22560 ) ( ON ?auto_22561 ?auto_22562 ) ( CLEAR ?auto_22561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22564 ?auto_22563 ?auto_22562 )
      ( MAKE-4PILE ?auto_22559 ?auto_22560 ?auto_22561 ?auto_22562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22565 - BLOCK
      ?auto_22566 - BLOCK
      ?auto_22567 - BLOCK
      ?auto_22568 - BLOCK
    )
    :vars
    (
      ?auto_22569 - BLOCK
      ?auto_22570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22565 ) ( not ( = ?auto_22565 ?auto_22566 ) ) ( not ( = ?auto_22565 ?auto_22567 ) ) ( not ( = ?auto_22565 ?auto_22568 ) ) ( not ( = ?auto_22565 ?auto_22569 ) ) ( not ( = ?auto_22566 ?auto_22567 ) ) ( not ( = ?auto_22566 ?auto_22568 ) ) ( not ( = ?auto_22566 ?auto_22569 ) ) ( not ( = ?auto_22567 ?auto_22568 ) ) ( not ( = ?auto_22567 ?auto_22569 ) ) ( not ( = ?auto_22568 ?auto_22569 ) ) ( ON ?auto_22569 ?auto_22570 ) ( not ( = ?auto_22565 ?auto_22570 ) ) ( not ( = ?auto_22566 ?auto_22570 ) ) ( not ( = ?auto_22567 ?auto_22570 ) ) ( not ( = ?auto_22568 ?auto_22570 ) ) ( not ( = ?auto_22569 ?auto_22570 ) ) ( ON ?auto_22568 ?auto_22569 ) ( ON-TABLE ?auto_22570 ) ( ON ?auto_22567 ?auto_22568 ) ( CLEAR ?auto_22567 ) ( HOLDING ?auto_22566 ) ( CLEAR ?auto_22565 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22565 ?auto_22566 )
      ( MAKE-4PILE ?auto_22565 ?auto_22566 ?auto_22567 ?auto_22568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22571 - BLOCK
      ?auto_22572 - BLOCK
      ?auto_22573 - BLOCK
      ?auto_22574 - BLOCK
    )
    :vars
    (
      ?auto_22575 - BLOCK
      ?auto_22576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22571 ) ( not ( = ?auto_22571 ?auto_22572 ) ) ( not ( = ?auto_22571 ?auto_22573 ) ) ( not ( = ?auto_22571 ?auto_22574 ) ) ( not ( = ?auto_22571 ?auto_22575 ) ) ( not ( = ?auto_22572 ?auto_22573 ) ) ( not ( = ?auto_22572 ?auto_22574 ) ) ( not ( = ?auto_22572 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( ON ?auto_22575 ?auto_22576 ) ( not ( = ?auto_22571 ?auto_22576 ) ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( ON ?auto_22574 ?auto_22575 ) ( ON-TABLE ?auto_22576 ) ( ON ?auto_22573 ?auto_22574 ) ( CLEAR ?auto_22571 ) ( ON ?auto_22572 ?auto_22573 ) ( CLEAR ?auto_22572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22576 ?auto_22575 ?auto_22574 ?auto_22573 )
      ( MAKE-4PILE ?auto_22571 ?auto_22572 ?auto_22573 ?auto_22574 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22577 - BLOCK
      ?auto_22578 - BLOCK
      ?auto_22579 - BLOCK
      ?auto_22580 - BLOCK
    )
    :vars
    (
      ?auto_22582 - BLOCK
      ?auto_22581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22579 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22582 ) ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22582 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22582 ) ) ( not ( = ?auto_22580 ?auto_22582 ) ) ( ON ?auto_22582 ?auto_22581 ) ( not ( = ?auto_22577 ?auto_22581 ) ) ( not ( = ?auto_22578 ?auto_22581 ) ) ( not ( = ?auto_22579 ?auto_22581 ) ) ( not ( = ?auto_22580 ?auto_22581 ) ) ( not ( = ?auto_22582 ?auto_22581 ) ) ( ON ?auto_22580 ?auto_22582 ) ( ON-TABLE ?auto_22581 ) ( ON ?auto_22579 ?auto_22580 ) ( ON ?auto_22578 ?auto_22579 ) ( CLEAR ?auto_22578 ) ( HOLDING ?auto_22577 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22577 )
      ( MAKE-4PILE ?auto_22577 ?auto_22578 ?auto_22579 ?auto_22580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22583 - BLOCK
      ?auto_22584 - BLOCK
      ?auto_22585 - BLOCK
      ?auto_22586 - BLOCK
    )
    :vars
    (
      ?auto_22587 - BLOCK
      ?auto_22588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22583 ?auto_22584 ) ) ( not ( = ?auto_22583 ?auto_22585 ) ) ( not ( = ?auto_22583 ?auto_22586 ) ) ( not ( = ?auto_22583 ?auto_22587 ) ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( not ( = ?auto_22584 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22587 ) ) ( not ( = ?auto_22585 ?auto_22586 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( ON ?auto_22587 ?auto_22588 ) ( not ( = ?auto_22583 ?auto_22588 ) ) ( not ( = ?auto_22584 ?auto_22588 ) ) ( not ( = ?auto_22585 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22587 ?auto_22588 ) ) ( ON ?auto_22586 ?auto_22587 ) ( ON-TABLE ?auto_22588 ) ( ON ?auto_22585 ?auto_22586 ) ( ON ?auto_22584 ?auto_22585 ) ( ON ?auto_22583 ?auto_22584 ) ( CLEAR ?auto_22583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22588 ?auto_22587 ?auto_22586 ?auto_22585 ?auto_22584 )
      ( MAKE-4PILE ?auto_22583 ?auto_22584 ?auto_22585 ?auto_22586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22590 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22590 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22591 - BLOCK
    )
    :vars
    (
      ?auto_22592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22591 ?auto_22592 ) ( CLEAR ?auto_22591 ) ( HAND-EMPTY ) ( not ( = ?auto_22591 ?auto_22592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22591 ?auto_22592 )
      ( MAKE-1PILE ?auto_22591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22593 - BLOCK
    )
    :vars
    (
      ?auto_22594 - BLOCK
      ?auto_22597 - BLOCK
      ?auto_22596 - BLOCK
      ?auto_22595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22593 ?auto_22594 ) ) ( HOLDING ?auto_22593 ) ( CLEAR ?auto_22594 ) ( ON-TABLE ?auto_22597 ) ( ON ?auto_22596 ?auto_22597 ) ( ON ?auto_22595 ?auto_22596 ) ( ON ?auto_22594 ?auto_22595 ) ( not ( = ?auto_22597 ?auto_22596 ) ) ( not ( = ?auto_22597 ?auto_22595 ) ) ( not ( = ?auto_22597 ?auto_22594 ) ) ( not ( = ?auto_22597 ?auto_22593 ) ) ( not ( = ?auto_22596 ?auto_22595 ) ) ( not ( = ?auto_22596 ?auto_22594 ) ) ( not ( = ?auto_22596 ?auto_22593 ) ) ( not ( = ?auto_22595 ?auto_22594 ) ) ( not ( = ?auto_22595 ?auto_22593 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22597 ?auto_22596 ?auto_22595 ?auto_22594 ?auto_22593 )
      ( MAKE-1PILE ?auto_22593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22598 - BLOCK
    )
    :vars
    (
      ?auto_22600 - BLOCK
      ?auto_22601 - BLOCK
      ?auto_22602 - BLOCK
      ?auto_22599 - BLOCK
      ?auto_22603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22598 ?auto_22600 ) ) ( CLEAR ?auto_22600 ) ( ON-TABLE ?auto_22601 ) ( ON ?auto_22602 ?auto_22601 ) ( ON ?auto_22599 ?auto_22602 ) ( ON ?auto_22600 ?auto_22599 ) ( not ( = ?auto_22601 ?auto_22602 ) ) ( not ( = ?auto_22601 ?auto_22599 ) ) ( not ( = ?auto_22601 ?auto_22600 ) ) ( not ( = ?auto_22601 ?auto_22598 ) ) ( not ( = ?auto_22602 ?auto_22599 ) ) ( not ( = ?auto_22602 ?auto_22600 ) ) ( not ( = ?auto_22602 ?auto_22598 ) ) ( not ( = ?auto_22599 ?auto_22600 ) ) ( not ( = ?auto_22599 ?auto_22598 ) ) ( ON ?auto_22598 ?auto_22603 ) ( CLEAR ?auto_22598 ) ( HAND-EMPTY ) ( not ( = ?auto_22598 ?auto_22603 ) ) ( not ( = ?auto_22600 ?auto_22603 ) ) ( not ( = ?auto_22601 ?auto_22603 ) ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( not ( = ?auto_22599 ?auto_22603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22598 ?auto_22603 )
      ( MAKE-1PILE ?auto_22598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22604 - BLOCK
    )
    :vars
    (
      ?auto_22607 - BLOCK
      ?auto_22608 - BLOCK
      ?auto_22609 - BLOCK
      ?auto_22606 - BLOCK
      ?auto_22605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22604 ?auto_22607 ) ) ( ON-TABLE ?auto_22608 ) ( ON ?auto_22609 ?auto_22608 ) ( ON ?auto_22606 ?auto_22609 ) ( not ( = ?auto_22608 ?auto_22609 ) ) ( not ( = ?auto_22608 ?auto_22606 ) ) ( not ( = ?auto_22608 ?auto_22607 ) ) ( not ( = ?auto_22608 ?auto_22604 ) ) ( not ( = ?auto_22609 ?auto_22606 ) ) ( not ( = ?auto_22609 ?auto_22607 ) ) ( not ( = ?auto_22609 ?auto_22604 ) ) ( not ( = ?auto_22606 ?auto_22607 ) ) ( not ( = ?auto_22606 ?auto_22604 ) ) ( ON ?auto_22604 ?auto_22605 ) ( CLEAR ?auto_22604 ) ( not ( = ?auto_22604 ?auto_22605 ) ) ( not ( = ?auto_22607 ?auto_22605 ) ) ( not ( = ?auto_22608 ?auto_22605 ) ) ( not ( = ?auto_22609 ?auto_22605 ) ) ( not ( = ?auto_22606 ?auto_22605 ) ) ( HOLDING ?auto_22607 ) ( CLEAR ?auto_22606 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22608 ?auto_22609 ?auto_22606 ?auto_22607 )
      ( MAKE-1PILE ?auto_22604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22610 - BLOCK
    )
    :vars
    (
      ?auto_22613 - BLOCK
      ?auto_22611 - BLOCK
      ?auto_22612 - BLOCK
      ?auto_22614 - BLOCK
      ?auto_22615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22610 ?auto_22613 ) ) ( ON-TABLE ?auto_22611 ) ( ON ?auto_22612 ?auto_22611 ) ( ON ?auto_22614 ?auto_22612 ) ( not ( = ?auto_22611 ?auto_22612 ) ) ( not ( = ?auto_22611 ?auto_22614 ) ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( not ( = ?auto_22611 ?auto_22610 ) ) ( not ( = ?auto_22612 ?auto_22614 ) ) ( not ( = ?auto_22612 ?auto_22613 ) ) ( not ( = ?auto_22612 ?auto_22610 ) ) ( not ( = ?auto_22614 ?auto_22613 ) ) ( not ( = ?auto_22614 ?auto_22610 ) ) ( ON ?auto_22610 ?auto_22615 ) ( not ( = ?auto_22610 ?auto_22615 ) ) ( not ( = ?auto_22613 ?auto_22615 ) ) ( not ( = ?auto_22611 ?auto_22615 ) ) ( not ( = ?auto_22612 ?auto_22615 ) ) ( not ( = ?auto_22614 ?auto_22615 ) ) ( CLEAR ?auto_22614 ) ( ON ?auto_22613 ?auto_22610 ) ( CLEAR ?auto_22613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22615 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22615 ?auto_22610 )
      ( MAKE-1PILE ?auto_22610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22616 - BLOCK
    )
    :vars
    (
      ?auto_22618 - BLOCK
      ?auto_22617 - BLOCK
      ?auto_22621 - BLOCK
      ?auto_22619 - BLOCK
      ?auto_22620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22616 ?auto_22618 ) ) ( ON-TABLE ?auto_22617 ) ( ON ?auto_22621 ?auto_22617 ) ( not ( = ?auto_22617 ?auto_22621 ) ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( not ( = ?auto_22617 ?auto_22618 ) ) ( not ( = ?auto_22617 ?auto_22616 ) ) ( not ( = ?auto_22621 ?auto_22619 ) ) ( not ( = ?auto_22621 ?auto_22618 ) ) ( not ( = ?auto_22621 ?auto_22616 ) ) ( not ( = ?auto_22619 ?auto_22618 ) ) ( not ( = ?auto_22619 ?auto_22616 ) ) ( ON ?auto_22616 ?auto_22620 ) ( not ( = ?auto_22616 ?auto_22620 ) ) ( not ( = ?auto_22618 ?auto_22620 ) ) ( not ( = ?auto_22617 ?auto_22620 ) ) ( not ( = ?auto_22621 ?auto_22620 ) ) ( not ( = ?auto_22619 ?auto_22620 ) ) ( ON ?auto_22618 ?auto_22616 ) ( CLEAR ?auto_22618 ) ( ON-TABLE ?auto_22620 ) ( HOLDING ?auto_22619 ) ( CLEAR ?auto_22621 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22617 ?auto_22621 ?auto_22619 )
      ( MAKE-1PILE ?auto_22616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22622 - BLOCK
    )
    :vars
    (
      ?auto_22625 - BLOCK
      ?auto_22627 - BLOCK
      ?auto_22624 - BLOCK
      ?auto_22626 - BLOCK
      ?auto_22623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22622 ?auto_22625 ) ) ( ON-TABLE ?auto_22627 ) ( ON ?auto_22624 ?auto_22627 ) ( not ( = ?auto_22627 ?auto_22624 ) ) ( not ( = ?auto_22627 ?auto_22626 ) ) ( not ( = ?auto_22627 ?auto_22625 ) ) ( not ( = ?auto_22627 ?auto_22622 ) ) ( not ( = ?auto_22624 ?auto_22626 ) ) ( not ( = ?auto_22624 ?auto_22625 ) ) ( not ( = ?auto_22624 ?auto_22622 ) ) ( not ( = ?auto_22626 ?auto_22625 ) ) ( not ( = ?auto_22626 ?auto_22622 ) ) ( ON ?auto_22622 ?auto_22623 ) ( not ( = ?auto_22622 ?auto_22623 ) ) ( not ( = ?auto_22625 ?auto_22623 ) ) ( not ( = ?auto_22627 ?auto_22623 ) ) ( not ( = ?auto_22624 ?auto_22623 ) ) ( not ( = ?auto_22626 ?auto_22623 ) ) ( ON ?auto_22625 ?auto_22622 ) ( ON-TABLE ?auto_22623 ) ( CLEAR ?auto_22624 ) ( ON ?auto_22626 ?auto_22625 ) ( CLEAR ?auto_22626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22623 ?auto_22622 ?auto_22625 )
      ( MAKE-1PILE ?auto_22622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22628 - BLOCK
    )
    :vars
    (
      ?auto_22629 - BLOCK
      ?auto_22630 - BLOCK
      ?auto_22633 - BLOCK
      ?auto_22631 - BLOCK
      ?auto_22632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22628 ?auto_22629 ) ) ( ON-TABLE ?auto_22630 ) ( not ( = ?auto_22630 ?auto_22633 ) ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( not ( = ?auto_22630 ?auto_22629 ) ) ( not ( = ?auto_22630 ?auto_22628 ) ) ( not ( = ?auto_22633 ?auto_22631 ) ) ( not ( = ?auto_22633 ?auto_22629 ) ) ( not ( = ?auto_22633 ?auto_22628 ) ) ( not ( = ?auto_22631 ?auto_22629 ) ) ( not ( = ?auto_22631 ?auto_22628 ) ) ( ON ?auto_22628 ?auto_22632 ) ( not ( = ?auto_22628 ?auto_22632 ) ) ( not ( = ?auto_22629 ?auto_22632 ) ) ( not ( = ?auto_22630 ?auto_22632 ) ) ( not ( = ?auto_22633 ?auto_22632 ) ) ( not ( = ?auto_22631 ?auto_22632 ) ) ( ON ?auto_22629 ?auto_22628 ) ( ON-TABLE ?auto_22632 ) ( ON ?auto_22631 ?auto_22629 ) ( CLEAR ?auto_22631 ) ( HOLDING ?auto_22633 ) ( CLEAR ?auto_22630 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22630 ?auto_22633 )
      ( MAKE-1PILE ?auto_22628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22634 - BLOCK
    )
    :vars
    (
      ?auto_22637 - BLOCK
      ?auto_22635 - BLOCK
      ?auto_22639 - BLOCK
      ?auto_22636 - BLOCK
      ?auto_22638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22634 ?auto_22637 ) ) ( ON-TABLE ?auto_22635 ) ( not ( = ?auto_22635 ?auto_22639 ) ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22635 ?auto_22637 ) ) ( not ( = ?auto_22635 ?auto_22634 ) ) ( not ( = ?auto_22639 ?auto_22636 ) ) ( not ( = ?auto_22639 ?auto_22637 ) ) ( not ( = ?auto_22639 ?auto_22634 ) ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( not ( = ?auto_22636 ?auto_22634 ) ) ( ON ?auto_22634 ?auto_22638 ) ( not ( = ?auto_22634 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22638 ) ) ( not ( = ?auto_22639 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( ON ?auto_22637 ?auto_22634 ) ( ON-TABLE ?auto_22638 ) ( ON ?auto_22636 ?auto_22637 ) ( CLEAR ?auto_22635 ) ( ON ?auto_22639 ?auto_22636 ) ( CLEAR ?auto_22639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22638 ?auto_22634 ?auto_22637 ?auto_22636 )
      ( MAKE-1PILE ?auto_22634 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22640 - BLOCK
    )
    :vars
    (
      ?auto_22645 - BLOCK
      ?auto_22642 - BLOCK
      ?auto_22644 - BLOCK
      ?auto_22641 - BLOCK
      ?auto_22643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22640 ?auto_22645 ) ) ( not ( = ?auto_22642 ?auto_22644 ) ) ( not ( = ?auto_22642 ?auto_22641 ) ) ( not ( = ?auto_22642 ?auto_22645 ) ) ( not ( = ?auto_22642 ?auto_22640 ) ) ( not ( = ?auto_22644 ?auto_22641 ) ) ( not ( = ?auto_22644 ?auto_22645 ) ) ( not ( = ?auto_22644 ?auto_22640 ) ) ( not ( = ?auto_22641 ?auto_22645 ) ) ( not ( = ?auto_22641 ?auto_22640 ) ) ( ON ?auto_22640 ?auto_22643 ) ( not ( = ?auto_22640 ?auto_22643 ) ) ( not ( = ?auto_22645 ?auto_22643 ) ) ( not ( = ?auto_22642 ?auto_22643 ) ) ( not ( = ?auto_22644 ?auto_22643 ) ) ( not ( = ?auto_22641 ?auto_22643 ) ) ( ON ?auto_22645 ?auto_22640 ) ( ON-TABLE ?auto_22643 ) ( ON ?auto_22641 ?auto_22645 ) ( ON ?auto_22644 ?auto_22641 ) ( CLEAR ?auto_22644 ) ( HOLDING ?auto_22642 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22642 )
      ( MAKE-1PILE ?auto_22640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22646 - BLOCK
    )
    :vars
    (
      ?auto_22647 - BLOCK
      ?auto_22649 - BLOCK
      ?auto_22648 - BLOCK
      ?auto_22651 - BLOCK
      ?auto_22650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22646 ?auto_22647 ) ) ( not ( = ?auto_22649 ?auto_22648 ) ) ( not ( = ?auto_22649 ?auto_22651 ) ) ( not ( = ?auto_22649 ?auto_22647 ) ) ( not ( = ?auto_22649 ?auto_22646 ) ) ( not ( = ?auto_22648 ?auto_22651 ) ) ( not ( = ?auto_22648 ?auto_22647 ) ) ( not ( = ?auto_22648 ?auto_22646 ) ) ( not ( = ?auto_22651 ?auto_22647 ) ) ( not ( = ?auto_22651 ?auto_22646 ) ) ( ON ?auto_22646 ?auto_22650 ) ( not ( = ?auto_22646 ?auto_22650 ) ) ( not ( = ?auto_22647 ?auto_22650 ) ) ( not ( = ?auto_22649 ?auto_22650 ) ) ( not ( = ?auto_22648 ?auto_22650 ) ) ( not ( = ?auto_22651 ?auto_22650 ) ) ( ON ?auto_22647 ?auto_22646 ) ( ON-TABLE ?auto_22650 ) ( ON ?auto_22651 ?auto_22647 ) ( ON ?auto_22648 ?auto_22651 ) ( ON ?auto_22649 ?auto_22648 ) ( CLEAR ?auto_22649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22650 ?auto_22646 ?auto_22647 ?auto_22651 ?auto_22648 )
      ( MAKE-1PILE ?auto_22646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22655 - BLOCK
      ?auto_22656 - BLOCK
      ?auto_22657 - BLOCK
    )
    :vars
    (
      ?auto_22658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22658 ?auto_22657 ) ( CLEAR ?auto_22658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22655 ) ( ON ?auto_22656 ?auto_22655 ) ( ON ?auto_22657 ?auto_22656 ) ( not ( = ?auto_22655 ?auto_22656 ) ) ( not ( = ?auto_22655 ?auto_22657 ) ) ( not ( = ?auto_22655 ?auto_22658 ) ) ( not ( = ?auto_22656 ?auto_22657 ) ) ( not ( = ?auto_22656 ?auto_22658 ) ) ( not ( = ?auto_22657 ?auto_22658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22658 ?auto_22657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22659 - BLOCK
      ?auto_22660 - BLOCK
      ?auto_22661 - BLOCK
    )
    :vars
    (
      ?auto_22662 - BLOCK
      ?auto_22663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22662 ?auto_22661 ) ( CLEAR ?auto_22662 ) ( ON-TABLE ?auto_22659 ) ( ON ?auto_22660 ?auto_22659 ) ( ON ?auto_22661 ?auto_22660 ) ( not ( = ?auto_22659 ?auto_22660 ) ) ( not ( = ?auto_22659 ?auto_22661 ) ) ( not ( = ?auto_22659 ?auto_22662 ) ) ( not ( = ?auto_22660 ?auto_22661 ) ) ( not ( = ?auto_22660 ?auto_22662 ) ) ( not ( = ?auto_22661 ?auto_22662 ) ) ( HOLDING ?auto_22663 ) ( not ( = ?auto_22659 ?auto_22663 ) ) ( not ( = ?auto_22660 ?auto_22663 ) ) ( not ( = ?auto_22661 ?auto_22663 ) ) ( not ( = ?auto_22662 ?auto_22663 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_22663 )
      ( MAKE-3PILE ?auto_22659 ?auto_22660 ?auto_22661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22664 - BLOCK
      ?auto_22665 - BLOCK
      ?auto_22666 - BLOCK
    )
    :vars
    (
      ?auto_22668 - BLOCK
      ?auto_22667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22668 ?auto_22666 ) ( ON-TABLE ?auto_22664 ) ( ON ?auto_22665 ?auto_22664 ) ( ON ?auto_22666 ?auto_22665 ) ( not ( = ?auto_22664 ?auto_22665 ) ) ( not ( = ?auto_22664 ?auto_22666 ) ) ( not ( = ?auto_22664 ?auto_22668 ) ) ( not ( = ?auto_22665 ?auto_22666 ) ) ( not ( = ?auto_22665 ?auto_22668 ) ) ( not ( = ?auto_22666 ?auto_22668 ) ) ( not ( = ?auto_22664 ?auto_22667 ) ) ( not ( = ?auto_22665 ?auto_22667 ) ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22668 ?auto_22667 ) ) ( ON ?auto_22667 ?auto_22668 ) ( CLEAR ?auto_22667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22664 ?auto_22665 ?auto_22666 ?auto_22668 )
      ( MAKE-3PILE ?auto_22664 ?auto_22665 ?auto_22666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22669 - BLOCK
      ?auto_22670 - BLOCK
      ?auto_22671 - BLOCK
    )
    :vars
    (
      ?auto_22673 - BLOCK
      ?auto_22672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22673 ?auto_22671 ) ( ON-TABLE ?auto_22669 ) ( ON ?auto_22670 ?auto_22669 ) ( ON ?auto_22671 ?auto_22670 ) ( not ( = ?auto_22669 ?auto_22670 ) ) ( not ( = ?auto_22669 ?auto_22671 ) ) ( not ( = ?auto_22669 ?auto_22673 ) ) ( not ( = ?auto_22670 ?auto_22671 ) ) ( not ( = ?auto_22670 ?auto_22673 ) ) ( not ( = ?auto_22671 ?auto_22673 ) ) ( not ( = ?auto_22669 ?auto_22672 ) ) ( not ( = ?auto_22670 ?auto_22672 ) ) ( not ( = ?auto_22671 ?auto_22672 ) ) ( not ( = ?auto_22673 ?auto_22672 ) ) ( HOLDING ?auto_22672 ) ( CLEAR ?auto_22673 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22669 ?auto_22670 ?auto_22671 ?auto_22673 ?auto_22672 )
      ( MAKE-3PILE ?auto_22669 ?auto_22670 ?auto_22671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22674 - BLOCK
      ?auto_22675 - BLOCK
      ?auto_22676 - BLOCK
    )
    :vars
    (
      ?auto_22678 - BLOCK
      ?auto_22677 - BLOCK
      ?auto_22679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22678 ?auto_22676 ) ( ON-TABLE ?auto_22674 ) ( ON ?auto_22675 ?auto_22674 ) ( ON ?auto_22676 ?auto_22675 ) ( not ( = ?auto_22674 ?auto_22675 ) ) ( not ( = ?auto_22674 ?auto_22676 ) ) ( not ( = ?auto_22674 ?auto_22678 ) ) ( not ( = ?auto_22675 ?auto_22676 ) ) ( not ( = ?auto_22675 ?auto_22678 ) ) ( not ( = ?auto_22676 ?auto_22678 ) ) ( not ( = ?auto_22674 ?auto_22677 ) ) ( not ( = ?auto_22675 ?auto_22677 ) ) ( not ( = ?auto_22676 ?auto_22677 ) ) ( not ( = ?auto_22678 ?auto_22677 ) ) ( CLEAR ?auto_22678 ) ( ON ?auto_22677 ?auto_22679 ) ( CLEAR ?auto_22677 ) ( HAND-EMPTY ) ( not ( = ?auto_22674 ?auto_22679 ) ) ( not ( = ?auto_22675 ?auto_22679 ) ) ( not ( = ?auto_22676 ?auto_22679 ) ) ( not ( = ?auto_22678 ?auto_22679 ) ) ( not ( = ?auto_22677 ?auto_22679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22677 ?auto_22679 )
      ( MAKE-3PILE ?auto_22674 ?auto_22675 ?auto_22676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22692 - BLOCK
      ?auto_22693 - BLOCK
      ?auto_22694 - BLOCK
    )
    :vars
    (
      ?auto_22696 - BLOCK
      ?auto_22695 - BLOCK
      ?auto_22697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22692 ) ( ON ?auto_22693 ?auto_22692 ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( not ( = ?auto_22692 ?auto_22694 ) ) ( not ( = ?auto_22692 ?auto_22696 ) ) ( not ( = ?auto_22693 ?auto_22694 ) ) ( not ( = ?auto_22693 ?auto_22696 ) ) ( not ( = ?auto_22694 ?auto_22696 ) ) ( not ( = ?auto_22692 ?auto_22695 ) ) ( not ( = ?auto_22693 ?auto_22695 ) ) ( not ( = ?auto_22694 ?auto_22695 ) ) ( not ( = ?auto_22696 ?auto_22695 ) ) ( ON ?auto_22695 ?auto_22697 ) ( not ( = ?auto_22692 ?auto_22697 ) ) ( not ( = ?auto_22693 ?auto_22697 ) ) ( not ( = ?auto_22694 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22695 ?auto_22697 ) ) ( ON ?auto_22696 ?auto_22695 ) ( CLEAR ?auto_22696 ) ( HOLDING ?auto_22694 ) ( CLEAR ?auto_22693 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22692 ?auto_22693 ?auto_22694 ?auto_22696 )
      ( MAKE-3PILE ?auto_22692 ?auto_22693 ?auto_22694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22698 - BLOCK
      ?auto_22699 - BLOCK
      ?auto_22700 - BLOCK
    )
    :vars
    (
      ?auto_22702 - BLOCK
      ?auto_22703 - BLOCK
      ?auto_22701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22698 ) ( ON ?auto_22699 ?auto_22698 ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22702 ) ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22698 ?auto_22703 ) ) ( not ( = ?auto_22699 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22702 ?auto_22703 ) ) ( ON ?auto_22703 ?auto_22701 ) ( not ( = ?auto_22698 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22702 ?auto_22701 ) ) ( not ( = ?auto_22703 ?auto_22701 ) ) ( ON ?auto_22702 ?auto_22703 ) ( CLEAR ?auto_22699 ) ( ON ?auto_22700 ?auto_22702 ) ( CLEAR ?auto_22700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22701 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22701 ?auto_22703 ?auto_22702 )
      ( MAKE-3PILE ?auto_22698 ?auto_22699 ?auto_22700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22704 - BLOCK
      ?auto_22705 - BLOCK
      ?auto_22706 - BLOCK
    )
    :vars
    (
      ?auto_22708 - BLOCK
      ?auto_22707 - BLOCK
      ?auto_22709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22704 ) ( not ( = ?auto_22704 ?auto_22705 ) ) ( not ( = ?auto_22704 ?auto_22706 ) ) ( not ( = ?auto_22704 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22706 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( not ( = ?auto_22704 ?auto_22707 ) ) ( not ( = ?auto_22705 ?auto_22707 ) ) ( not ( = ?auto_22706 ?auto_22707 ) ) ( not ( = ?auto_22708 ?auto_22707 ) ) ( ON ?auto_22707 ?auto_22709 ) ( not ( = ?auto_22704 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22708 ?auto_22709 ) ) ( not ( = ?auto_22707 ?auto_22709 ) ) ( ON ?auto_22708 ?auto_22707 ) ( ON ?auto_22706 ?auto_22708 ) ( CLEAR ?auto_22706 ) ( ON-TABLE ?auto_22709 ) ( HOLDING ?auto_22705 ) ( CLEAR ?auto_22704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22704 ?auto_22705 )
      ( MAKE-3PILE ?auto_22704 ?auto_22705 ?auto_22706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22710 - BLOCK
      ?auto_22711 - BLOCK
      ?auto_22712 - BLOCK
    )
    :vars
    (
      ?auto_22713 - BLOCK
      ?auto_22715 - BLOCK
      ?auto_22714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22710 ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22712 ) ) ( not ( = ?auto_22710 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22710 ?auto_22715 ) ) ( not ( = ?auto_22711 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( not ( = ?auto_22713 ?auto_22715 ) ) ( ON ?auto_22715 ?auto_22714 ) ( not ( = ?auto_22710 ?auto_22714 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22715 ?auto_22714 ) ) ( ON ?auto_22713 ?auto_22715 ) ( ON ?auto_22712 ?auto_22713 ) ( ON-TABLE ?auto_22714 ) ( CLEAR ?auto_22710 ) ( ON ?auto_22711 ?auto_22712 ) ( CLEAR ?auto_22711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22714 ?auto_22715 ?auto_22713 ?auto_22712 )
      ( MAKE-3PILE ?auto_22710 ?auto_22711 ?auto_22712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22716 - BLOCK
      ?auto_22717 - BLOCK
      ?auto_22718 - BLOCK
    )
    :vars
    (
      ?auto_22719 - BLOCK
      ?auto_22721 - BLOCK
      ?auto_22720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22717 ?auto_22719 ) ) ( not ( = ?auto_22718 ?auto_22719 ) ) ( not ( = ?auto_22716 ?auto_22721 ) ) ( not ( = ?auto_22717 ?auto_22721 ) ) ( not ( = ?auto_22718 ?auto_22721 ) ) ( not ( = ?auto_22719 ?auto_22721 ) ) ( ON ?auto_22721 ?auto_22720 ) ( not ( = ?auto_22716 ?auto_22720 ) ) ( not ( = ?auto_22717 ?auto_22720 ) ) ( not ( = ?auto_22718 ?auto_22720 ) ) ( not ( = ?auto_22719 ?auto_22720 ) ) ( not ( = ?auto_22721 ?auto_22720 ) ) ( ON ?auto_22719 ?auto_22721 ) ( ON ?auto_22718 ?auto_22719 ) ( ON-TABLE ?auto_22720 ) ( ON ?auto_22717 ?auto_22718 ) ( CLEAR ?auto_22717 ) ( HOLDING ?auto_22716 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22716 )
      ( MAKE-3PILE ?auto_22716 ?auto_22717 ?auto_22718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22722 - BLOCK
      ?auto_22723 - BLOCK
      ?auto_22724 - BLOCK
    )
    :vars
    (
      ?auto_22725 - BLOCK
      ?auto_22726 - BLOCK
      ?auto_22727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22722 ?auto_22723 ) ) ( not ( = ?auto_22722 ?auto_22724 ) ) ( not ( = ?auto_22722 ?auto_22725 ) ) ( not ( = ?auto_22723 ?auto_22724 ) ) ( not ( = ?auto_22723 ?auto_22725 ) ) ( not ( = ?auto_22724 ?auto_22725 ) ) ( not ( = ?auto_22722 ?auto_22726 ) ) ( not ( = ?auto_22723 ?auto_22726 ) ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( not ( = ?auto_22725 ?auto_22726 ) ) ( ON ?auto_22726 ?auto_22727 ) ( not ( = ?auto_22722 ?auto_22727 ) ) ( not ( = ?auto_22723 ?auto_22727 ) ) ( not ( = ?auto_22724 ?auto_22727 ) ) ( not ( = ?auto_22725 ?auto_22727 ) ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( ON ?auto_22725 ?auto_22726 ) ( ON ?auto_22724 ?auto_22725 ) ( ON-TABLE ?auto_22727 ) ( ON ?auto_22723 ?auto_22724 ) ( ON ?auto_22722 ?auto_22723 ) ( CLEAR ?auto_22722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22727 ?auto_22726 ?auto_22725 ?auto_22724 ?auto_22723 )
      ( MAKE-3PILE ?auto_22722 ?auto_22723 ?auto_22724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22730 - BLOCK
      ?auto_22731 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22731 ) ( CLEAR ?auto_22730 ) ( ON-TABLE ?auto_22730 ) ( not ( = ?auto_22730 ?auto_22731 ) ) )
    :subtasks
    ( ( !STACK ?auto_22731 ?auto_22730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22732 - BLOCK
      ?auto_22733 - BLOCK
    )
    :vars
    (
      ?auto_22734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22732 ) ( ON-TABLE ?auto_22732 ) ( not ( = ?auto_22732 ?auto_22733 ) ) ( ON ?auto_22733 ?auto_22734 ) ( CLEAR ?auto_22733 ) ( HAND-EMPTY ) ( not ( = ?auto_22732 ?auto_22734 ) ) ( not ( = ?auto_22733 ?auto_22734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22733 ?auto_22734 )
      ( MAKE-2PILE ?auto_22732 ?auto_22733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22735 - BLOCK
      ?auto_22736 - BLOCK
    )
    :vars
    (
      ?auto_22737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22735 ?auto_22736 ) ) ( ON ?auto_22736 ?auto_22737 ) ( CLEAR ?auto_22736 ) ( not ( = ?auto_22735 ?auto_22737 ) ) ( not ( = ?auto_22736 ?auto_22737 ) ) ( HOLDING ?auto_22735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22735 )
      ( MAKE-2PILE ?auto_22735 ?auto_22736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22738 - BLOCK
      ?auto_22739 - BLOCK
    )
    :vars
    (
      ?auto_22740 - BLOCK
      ?auto_22741 - BLOCK
      ?auto_22742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22738 ?auto_22739 ) ) ( ON ?auto_22739 ?auto_22740 ) ( not ( = ?auto_22738 ?auto_22740 ) ) ( not ( = ?auto_22739 ?auto_22740 ) ) ( ON ?auto_22738 ?auto_22739 ) ( CLEAR ?auto_22738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22741 ) ( ON ?auto_22742 ?auto_22741 ) ( ON ?auto_22740 ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22742 ) ) ( not ( = ?auto_22741 ?auto_22740 ) ) ( not ( = ?auto_22741 ?auto_22739 ) ) ( not ( = ?auto_22741 ?auto_22738 ) ) ( not ( = ?auto_22742 ?auto_22740 ) ) ( not ( = ?auto_22742 ?auto_22739 ) ) ( not ( = ?auto_22742 ?auto_22738 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22741 ?auto_22742 ?auto_22740 ?auto_22739 )
      ( MAKE-2PILE ?auto_22738 ?auto_22739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22743 - BLOCK
      ?auto_22744 - BLOCK
    )
    :vars
    (
      ?auto_22746 - BLOCK
      ?auto_22747 - BLOCK
      ?auto_22745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22743 ?auto_22744 ) ) ( ON ?auto_22744 ?auto_22746 ) ( not ( = ?auto_22743 ?auto_22746 ) ) ( not ( = ?auto_22744 ?auto_22746 ) ) ( ON-TABLE ?auto_22747 ) ( ON ?auto_22745 ?auto_22747 ) ( ON ?auto_22746 ?auto_22745 ) ( not ( = ?auto_22747 ?auto_22745 ) ) ( not ( = ?auto_22747 ?auto_22746 ) ) ( not ( = ?auto_22747 ?auto_22744 ) ) ( not ( = ?auto_22747 ?auto_22743 ) ) ( not ( = ?auto_22745 ?auto_22746 ) ) ( not ( = ?auto_22745 ?auto_22744 ) ) ( not ( = ?auto_22745 ?auto_22743 ) ) ( HOLDING ?auto_22743 ) ( CLEAR ?auto_22744 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22747 ?auto_22745 ?auto_22746 ?auto_22744 ?auto_22743 )
      ( MAKE-2PILE ?auto_22743 ?auto_22744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22748 - BLOCK
      ?auto_22749 - BLOCK
    )
    :vars
    (
      ?auto_22750 - BLOCK
      ?auto_22751 - BLOCK
      ?auto_22752 - BLOCK
      ?auto_22753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22748 ?auto_22749 ) ) ( ON ?auto_22749 ?auto_22750 ) ( not ( = ?auto_22748 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( ON-TABLE ?auto_22751 ) ( ON ?auto_22752 ?auto_22751 ) ( ON ?auto_22750 ?auto_22752 ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( not ( = ?auto_22751 ?auto_22750 ) ) ( not ( = ?auto_22751 ?auto_22749 ) ) ( not ( = ?auto_22751 ?auto_22748 ) ) ( not ( = ?auto_22752 ?auto_22750 ) ) ( not ( = ?auto_22752 ?auto_22749 ) ) ( not ( = ?auto_22752 ?auto_22748 ) ) ( CLEAR ?auto_22749 ) ( ON ?auto_22748 ?auto_22753 ) ( CLEAR ?auto_22748 ) ( HAND-EMPTY ) ( not ( = ?auto_22748 ?auto_22753 ) ) ( not ( = ?auto_22749 ?auto_22753 ) ) ( not ( = ?auto_22750 ?auto_22753 ) ) ( not ( = ?auto_22751 ?auto_22753 ) ) ( not ( = ?auto_22752 ?auto_22753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22748 ?auto_22753 )
      ( MAKE-2PILE ?auto_22748 ?auto_22749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22754 - BLOCK
      ?auto_22755 - BLOCK
    )
    :vars
    (
      ?auto_22756 - BLOCK
      ?auto_22759 - BLOCK
      ?auto_22758 - BLOCK
      ?auto_22757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22754 ?auto_22755 ) ) ( not ( = ?auto_22754 ?auto_22756 ) ) ( not ( = ?auto_22755 ?auto_22756 ) ) ( ON-TABLE ?auto_22759 ) ( ON ?auto_22758 ?auto_22759 ) ( ON ?auto_22756 ?auto_22758 ) ( not ( = ?auto_22759 ?auto_22758 ) ) ( not ( = ?auto_22759 ?auto_22756 ) ) ( not ( = ?auto_22759 ?auto_22755 ) ) ( not ( = ?auto_22759 ?auto_22754 ) ) ( not ( = ?auto_22758 ?auto_22756 ) ) ( not ( = ?auto_22758 ?auto_22755 ) ) ( not ( = ?auto_22758 ?auto_22754 ) ) ( ON ?auto_22754 ?auto_22757 ) ( CLEAR ?auto_22754 ) ( not ( = ?auto_22754 ?auto_22757 ) ) ( not ( = ?auto_22755 ?auto_22757 ) ) ( not ( = ?auto_22756 ?auto_22757 ) ) ( not ( = ?auto_22759 ?auto_22757 ) ) ( not ( = ?auto_22758 ?auto_22757 ) ) ( HOLDING ?auto_22755 ) ( CLEAR ?auto_22756 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22759 ?auto_22758 ?auto_22756 ?auto_22755 )
      ( MAKE-2PILE ?auto_22754 ?auto_22755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22760 - BLOCK
      ?auto_22761 - BLOCK
    )
    :vars
    (
      ?auto_22764 - BLOCK
      ?auto_22763 - BLOCK
      ?auto_22765 - BLOCK
      ?auto_22762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22760 ?auto_22761 ) ) ( not ( = ?auto_22760 ?auto_22764 ) ) ( not ( = ?auto_22761 ?auto_22764 ) ) ( ON-TABLE ?auto_22763 ) ( ON ?auto_22765 ?auto_22763 ) ( ON ?auto_22764 ?auto_22765 ) ( not ( = ?auto_22763 ?auto_22765 ) ) ( not ( = ?auto_22763 ?auto_22764 ) ) ( not ( = ?auto_22763 ?auto_22761 ) ) ( not ( = ?auto_22763 ?auto_22760 ) ) ( not ( = ?auto_22765 ?auto_22764 ) ) ( not ( = ?auto_22765 ?auto_22761 ) ) ( not ( = ?auto_22765 ?auto_22760 ) ) ( ON ?auto_22760 ?auto_22762 ) ( not ( = ?auto_22760 ?auto_22762 ) ) ( not ( = ?auto_22761 ?auto_22762 ) ) ( not ( = ?auto_22764 ?auto_22762 ) ) ( not ( = ?auto_22763 ?auto_22762 ) ) ( not ( = ?auto_22765 ?auto_22762 ) ) ( CLEAR ?auto_22764 ) ( ON ?auto_22761 ?auto_22760 ) ( CLEAR ?auto_22761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22762 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22762 ?auto_22760 )
      ( MAKE-2PILE ?auto_22760 ?auto_22761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22766 - BLOCK
      ?auto_22767 - BLOCK
    )
    :vars
    (
      ?auto_22769 - BLOCK
      ?auto_22770 - BLOCK
      ?auto_22771 - BLOCK
      ?auto_22768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22766 ?auto_22767 ) ) ( not ( = ?auto_22766 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) ( ON-TABLE ?auto_22770 ) ( ON ?auto_22771 ?auto_22770 ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22769 ) ) ( not ( = ?auto_22770 ?auto_22767 ) ) ( not ( = ?auto_22770 ?auto_22766 ) ) ( not ( = ?auto_22771 ?auto_22769 ) ) ( not ( = ?auto_22771 ?auto_22767 ) ) ( not ( = ?auto_22771 ?auto_22766 ) ) ( ON ?auto_22766 ?auto_22768 ) ( not ( = ?auto_22766 ?auto_22768 ) ) ( not ( = ?auto_22767 ?auto_22768 ) ) ( not ( = ?auto_22769 ?auto_22768 ) ) ( not ( = ?auto_22770 ?auto_22768 ) ) ( not ( = ?auto_22771 ?auto_22768 ) ) ( ON ?auto_22767 ?auto_22766 ) ( CLEAR ?auto_22767 ) ( ON-TABLE ?auto_22768 ) ( HOLDING ?auto_22769 ) ( CLEAR ?auto_22771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22770 ?auto_22771 ?auto_22769 )
      ( MAKE-2PILE ?auto_22766 ?auto_22767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22772 - BLOCK
      ?auto_22773 - BLOCK
    )
    :vars
    (
      ?auto_22775 - BLOCK
      ?auto_22777 - BLOCK
      ?auto_22776 - BLOCK
      ?auto_22774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22772 ?auto_22773 ) ) ( not ( = ?auto_22772 ?auto_22775 ) ) ( not ( = ?auto_22773 ?auto_22775 ) ) ( ON-TABLE ?auto_22777 ) ( ON ?auto_22776 ?auto_22777 ) ( not ( = ?auto_22777 ?auto_22776 ) ) ( not ( = ?auto_22777 ?auto_22775 ) ) ( not ( = ?auto_22777 ?auto_22773 ) ) ( not ( = ?auto_22777 ?auto_22772 ) ) ( not ( = ?auto_22776 ?auto_22775 ) ) ( not ( = ?auto_22776 ?auto_22773 ) ) ( not ( = ?auto_22776 ?auto_22772 ) ) ( ON ?auto_22772 ?auto_22774 ) ( not ( = ?auto_22772 ?auto_22774 ) ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22775 ?auto_22774 ) ) ( not ( = ?auto_22777 ?auto_22774 ) ) ( not ( = ?auto_22776 ?auto_22774 ) ) ( ON ?auto_22773 ?auto_22772 ) ( ON-TABLE ?auto_22774 ) ( CLEAR ?auto_22776 ) ( ON ?auto_22775 ?auto_22773 ) ( CLEAR ?auto_22775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22774 ?auto_22772 ?auto_22773 )
      ( MAKE-2PILE ?auto_22772 ?auto_22773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22778 - BLOCK
      ?auto_22779 - BLOCK
    )
    :vars
    (
      ?auto_22781 - BLOCK
      ?auto_22783 - BLOCK
      ?auto_22780 - BLOCK
      ?auto_22782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22778 ?auto_22779 ) ) ( not ( = ?auto_22778 ?auto_22781 ) ) ( not ( = ?auto_22779 ?auto_22781 ) ) ( ON-TABLE ?auto_22783 ) ( not ( = ?auto_22783 ?auto_22780 ) ) ( not ( = ?auto_22783 ?auto_22781 ) ) ( not ( = ?auto_22783 ?auto_22779 ) ) ( not ( = ?auto_22783 ?auto_22778 ) ) ( not ( = ?auto_22780 ?auto_22781 ) ) ( not ( = ?auto_22780 ?auto_22779 ) ) ( not ( = ?auto_22780 ?auto_22778 ) ) ( ON ?auto_22778 ?auto_22782 ) ( not ( = ?auto_22778 ?auto_22782 ) ) ( not ( = ?auto_22779 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22783 ?auto_22782 ) ) ( not ( = ?auto_22780 ?auto_22782 ) ) ( ON ?auto_22779 ?auto_22778 ) ( ON-TABLE ?auto_22782 ) ( ON ?auto_22781 ?auto_22779 ) ( CLEAR ?auto_22781 ) ( HOLDING ?auto_22780 ) ( CLEAR ?auto_22783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22783 ?auto_22780 )
      ( MAKE-2PILE ?auto_22778 ?auto_22779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22784 - BLOCK
      ?auto_22785 - BLOCK
    )
    :vars
    (
      ?auto_22786 - BLOCK
      ?auto_22787 - BLOCK
      ?auto_22789 - BLOCK
      ?auto_22788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22784 ?auto_22785 ) ) ( not ( = ?auto_22784 ?auto_22786 ) ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( ON-TABLE ?auto_22787 ) ( not ( = ?auto_22787 ?auto_22789 ) ) ( not ( = ?auto_22787 ?auto_22786 ) ) ( not ( = ?auto_22787 ?auto_22785 ) ) ( not ( = ?auto_22787 ?auto_22784 ) ) ( not ( = ?auto_22789 ?auto_22786 ) ) ( not ( = ?auto_22789 ?auto_22785 ) ) ( not ( = ?auto_22789 ?auto_22784 ) ) ( ON ?auto_22784 ?auto_22788 ) ( not ( = ?auto_22784 ?auto_22788 ) ) ( not ( = ?auto_22785 ?auto_22788 ) ) ( not ( = ?auto_22786 ?auto_22788 ) ) ( not ( = ?auto_22787 ?auto_22788 ) ) ( not ( = ?auto_22789 ?auto_22788 ) ) ( ON ?auto_22785 ?auto_22784 ) ( ON-TABLE ?auto_22788 ) ( ON ?auto_22786 ?auto_22785 ) ( CLEAR ?auto_22787 ) ( ON ?auto_22789 ?auto_22786 ) ( CLEAR ?auto_22789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22788 ?auto_22784 ?auto_22785 ?auto_22786 )
      ( MAKE-2PILE ?auto_22784 ?auto_22785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22790 - BLOCK
      ?auto_22791 - BLOCK
    )
    :vars
    (
      ?auto_22792 - BLOCK
      ?auto_22793 - BLOCK
      ?auto_22795 - BLOCK
      ?auto_22794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22790 ?auto_22791 ) ) ( not ( = ?auto_22790 ?auto_22792 ) ) ( not ( = ?auto_22791 ?auto_22792 ) ) ( not ( = ?auto_22793 ?auto_22795 ) ) ( not ( = ?auto_22793 ?auto_22792 ) ) ( not ( = ?auto_22793 ?auto_22791 ) ) ( not ( = ?auto_22793 ?auto_22790 ) ) ( not ( = ?auto_22795 ?auto_22792 ) ) ( not ( = ?auto_22795 ?auto_22791 ) ) ( not ( = ?auto_22795 ?auto_22790 ) ) ( ON ?auto_22790 ?auto_22794 ) ( not ( = ?auto_22790 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( not ( = ?auto_22792 ?auto_22794 ) ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22795 ?auto_22794 ) ) ( ON ?auto_22791 ?auto_22790 ) ( ON-TABLE ?auto_22794 ) ( ON ?auto_22792 ?auto_22791 ) ( ON ?auto_22795 ?auto_22792 ) ( CLEAR ?auto_22795 ) ( HOLDING ?auto_22793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22793 )
      ( MAKE-2PILE ?auto_22790 ?auto_22791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22796 - BLOCK
      ?auto_22797 - BLOCK
    )
    :vars
    (
      ?auto_22799 - BLOCK
      ?auto_22798 - BLOCK
      ?auto_22801 - BLOCK
      ?auto_22800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22796 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22799 ) ) ( not ( = ?auto_22797 ?auto_22799 ) ) ( not ( = ?auto_22798 ?auto_22801 ) ) ( not ( = ?auto_22798 ?auto_22799 ) ) ( not ( = ?auto_22798 ?auto_22797 ) ) ( not ( = ?auto_22798 ?auto_22796 ) ) ( not ( = ?auto_22801 ?auto_22799 ) ) ( not ( = ?auto_22801 ?auto_22797 ) ) ( not ( = ?auto_22801 ?auto_22796 ) ) ( ON ?auto_22796 ?auto_22800 ) ( not ( = ?auto_22796 ?auto_22800 ) ) ( not ( = ?auto_22797 ?auto_22800 ) ) ( not ( = ?auto_22799 ?auto_22800 ) ) ( not ( = ?auto_22798 ?auto_22800 ) ) ( not ( = ?auto_22801 ?auto_22800 ) ) ( ON ?auto_22797 ?auto_22796 ) ( ON-TABLE ?auto_22800 ) ( ON ?auto_22799 ?auto_22797 ) ( ON ?auto_22801 ?auto_22799 ) ( ON ?auto_22798 ?auto_22801 ) ( CLEAR ?auto_22798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22800 ?auto_22796 ?auto_22797 ?auto_22799 ?auto_22801 )
      ( MAKE-2PILE ?auto_22796 ?auto_22797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22804 - BLOCK
      ?auto_22805 - BLOCK
    )
    :vars
    (
      ?auto_22806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22806 ?auto_22805 ) ( CLEAR ?auto_22806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22804 ) ( ON ?auto_22805 ?auto_22804 ) ( not ( = ?auto_22804 ?auto_22805 ) ) ( not ( = ?auto_22804 ?auto_22806 ) ) ( not ( = ?auto_22805 ?auto_22806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22806 ?auto_22805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22807 - BLOCK
      ?auto_22808 - BLOCK
    )
    :vars
    (
      ?auto_22809 - BLOCK
      ?auto_22810 - BLOCK
      ?auto_22811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22809 ?auto_22808 ) ( CLEAR ?auto_22809 ) ( ON-TABLE ?auto_22807 ) ( ON ?auto_22808 ?auto_22807 ) ( not ( = ?auto_22807 ?auto_22808 ) ) ( not ( = ?auto_22807 ?auto_22809 ) ) ( not ( = ?auto_22808 ?auto_22809 ) ) ( HOLDING ?auto_22810 ) ( CLEAR ?auto_22811 ) ( not ( = ?auto_22807 ?auto_22810 ) ) ( not ( = ?auto_22807 ?auto_22811 ) ) ( not ( = ?auto_22808 ?auto_22810 ) ) ( not ( = ?auto_22808 ?auto_22811 ) ) ( not ( = ?auto_22809 ?auto_22810 ) ) ( not ( = ?auto_22809 ?auto_22811 ) ) ( not ( = ?auto_22810 ?auto_22811 ) ) )
    :subtasks
    ( ( !STACK ?auto_22810 ?auto_22811 )
      ( MAKE-2PILE ?auto_22807 ?auto_22808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22812 - BLOCK
      ?auto_22813 - BLOCK
    )
    :vars
    (
      ?auto_22815 - BLOCK
      ?auto_22816 - BLOCK
      ?auto_22814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22815 ?auto_22813 ) ( ON-TABLE ?auto_22812 ) ( ON ?auto_22813 ?auto_22812 ) ( not ( = ?auto_22812 ?auto_22813 ) ) ( not ( = ?auto_22812 ?auto_22815 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) ( CLEAR ?auto_22816 ) ( not ( = ?auto_22812 ?auto_22814 ) ) ( not ( = ?auto_22812 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22814 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22814 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( ON ?auto_22814 ?auto_22815 ) ( CLEAR ?auto_22814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22812 ?auto_22813 ?auto_22815 )
      ( MAKE-2PILE ?auto_22812 ?auto_22813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22817 - BLOCK
      ?auto_22818 - BLOCK
    )
    :vars
    (
      ?auto_22819 - BLOCK
      ?auto_22820 - BLOCK
      ?auto_22821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22819 ?auto_22818 ) ( ON-TABLE ?auto_22817 ) ( ON ?auto_22818 ?auto_22817 ) ( not ( = ?auto_22817 ?auto_22818 ) ) ( not ( = ?auto_22817 ?auto_22819 ) ) ( not ( = ?auto_22818 ?auto_22819 ) ) ( not ( = ?auto_22817 ?auto_22820 ) ) ( not ( = ?auto_22817 ?auto_22821 ) ) ( not ( = ?auto_22818 ?auto_22820 ) ) ( not ( = ?auto_22818 ?auto_22821 ) ) ( not ( = ?auto_22819 ?auto_22820 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( not ( = ?auto_22820 ?auto_22821 ) ) ( ON ?auto_22820 ?auto_22819 ) ( CLEAR ?auto_22820 ) ( HOLDING ?auto_22821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22821 )
      ( MAKE-2PILE ?auto_22817 ?auto_22818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22822 - BLOCK
      ?auto_22823 - BLOCK
    )
    :vars
    (
      ?auto_22824 - BLOCK
      ?auto_22826 - BLOCK
      ?auto_22825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22824 ?auto_22823 ) ( ON-TABLE ?auto_22822 ) ( ON ?auto_22823 ?auto_22822 ) ( not ( = ?auto_22822 ?auto_22823 ) ) ( not ( = ?auto_22822 ?auto_22824 ) ) ( not ( = ?auto_22823 ?auto_22824 ) ) ( not ( = ?auto_22822 ?auto_22826 ) ) ( not ( = ?auto_22822 ?auto_22825 ) ) ( not ( = ?auto_22823 ?auto_22826 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) ( not ( = ?auto_22824 ?auto_22826 ) ) ( not ( = ?auto_22824 ?auto_22825 ) ) ( not ( = ?auto_22826 ?auto_22825 ) ) ( ON ?auto_22826 ?auto_22824 ) ( ON ?auto_22825 ?auto_22826 ) ( CLEAR ?auto_22825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22822 ?auto_22823 ?auto_22824 ?auto_22826 )
      ( MAKE-2PILE ?auto_22822 ?auto_22823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22827 - BLOCK
      ?auto_22828 - BLOCK
    )
    :vars
    (
      ?auto_22831 - BLOCK
      ?auto_22829 - BLOCK
      ?auto_22830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22831 ?auto_22828 ) ( ON-TABLE ?auto_22827 ) ( ON ?auto_22828 ?auto_22827 ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22827 ?auto_22831 ) ) ( not ( = ?auto_22828 ?auto_22831 ) ) ( not ( = ?auto_22827 ?auto_22829 ) ) ( not ( = ?auto_22827 ?auto_22830 ) ) ( not ( = ?auto_22828 ?auto_22829 ) ) ( not ( = ?auto_22828 ?auto_22830 ) ) ( not ( = ?auto_22831 ?auto_22829 ) ) ( not ( = ?auto_22831 ?auto_22830 ) ) ( not ( = ?auto_22829 ?auto_22830 ) ) ( ON ?auto_22829 ?auto_22831 ) ( HOLDING ?auto_22830 ) ( CLEAR ?auto_22829 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22827 ?auto_22828 ?auto_22831 ?auto_22829 ?auto_22830 )
      ( MAKE-2PILE ?auto_22827 ?auto_22828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22832 - BLOCK
      ?auto_22833 - BLOCK
    )
    :vars
    (
      ?auto_22835 - BLOCK
      ?auto_22834 - BLOCK
      ?auto_22836 - BLOCK
      ?auto_22837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22835 ?auto_22833 ) ( ON-TABLE ?auto_22832 ) ( ON ?auto_22833 ?auto_22832 ) ( not ( = ?auto_22832 ?auto_22833 ) ) ( not ( = ?auto_22832 ?auto_22835 ) ) ( not ( = ?auto_22833 ?auto_22835 ) ) ( not ( = ?auto_22832 ?auto_22834 ) ) ( not ( = ?auto_22832 ?auto_22836 ) ) ( not ( = ?auto_22833 ?auto_22834 ) ) ( not ( = ?auto_22833 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22834 ) ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( not ( = ?auto_22834 ?auto_22836 ) ) ( ON ?auto_22834 ?auto_22835 ) ( CLEAR ?auto_22834 ) ( ON ?auto_22836 ?auto_22837 ) ( CLEAR ?auto_22836 ) ( HAND-EMPTY ) ( not ( = ?auto_22832 ?auto_22837 ) ) ( not ( = ?auto_22833 ?auto_22837 ) ) ( not ( = ?auto_22835 ?auto_22837 ) ) ( not ( = ?auto_22834 ?auto_22837 ) ) ( not ( = ?auto_22836 ?auto_22837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22836 ?auto_22837 )
      ( MAKE-2PILE ?auto_22832 ?auto_22833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22838 - BLOCK
      ?auto_22839 - BLOCK
    )
    :vars
    (
      ?auto_22840 - BLOCK
      ?auto_22841 - BLOCK
      ?auto_22843 - BLOCK
      ?auto_22842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22840 ?auto_22839 ) ( ON-TABLE ?auto_22838 ) ( ON ?auto_22839 ?auto_22838 ) ( not ( = ?auto_22838 ?auto_22839 ) ) ( not ( = ?auto_22838 ?auto_22840 ) ) ( not ( = ?auto_22839 ?auto_22840 ) ) ( not ( = ?auto_22838 ?auto_22841 ) ) ( not ( = ?auto_22838 ?auto_22843 ) ) ( not ( = ?auto_22839 ?auto_22841 ) ) ( not ( = ?auto_22839 ?auto_22843 ) ) ( not ( = ?auto_22840 ?auto_22841 ) ) ( not ( = ?auto_22840 ?auto_22843 ) ) ( not ( = ?auto_22841 ?auto_22843 ) ) ( ON ?auto_22843 ?auto_22842 ) ( CLEAR ?auto_22843 ) ( not ( = ?auto_22838 ?auto_22842 ) ) ( not ( = ?auto_22839 ?auto_22842 ) ) ( not ( = ?auto_22840 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( not ( = ?auto_22843 ?auto_22842 ) ) ( HOLDING ?auto_22841 ) ( CLEAR ?auto_22840 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22838 ?auto_22839 ?auto_22840 ?auto_22841 )
      ( MAKE-2PILE ?auto_22838 ?auto_22839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22844 - BLOCK
      ?auto_22845 - BLOCK
    )
    :vars
    (
      ?auto_22846 - BLOCK
      ?auto_22847 - BLOCK
      ?auto_22848 - BLOCK
      ?auto_22849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22846 ?auto_22845 ) ( ON-TABLE ?auto_22844 ) ( ON ?auto_22845 ?auto_22844 ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22844 ?auto_22847 ) ) ( not ( = ?auto_22844 ?auto_22848 ) ) ( not ( = ?auto_22845 ?auto_22847 ) ) ( not ( = ?auto_22845 ?auto_22848 ) ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22846 ?auto_22848 ) ) ( not ( = ?auto_22847 ?auto_22848 ) ) ( ON ?auto_22848 ?auto_22849 ) ( not ( = ?auto_22844 ?auto_22849 ) ) ( not ( = ?auto_22845 ?auto_22849 ) ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( CLEAR ?auto_22846 ) ( ON ?auto_22847 ?auto_22848 ) ( CLEAR ?auto_22847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22849 ?auto_22848 )
      ( MAKE-2PILE ?auto_22844 ?auto_22845 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22862 - BLOCK
      ?auto_22863 - BLOCK
    )
    :vars
    (
      ?auto_22866 - BLOCK
      ?auto_22867 - BLOCK
      ?auto_22864 - BLOCK
      ?auto_22865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22862 ) ( not ( = ?auto_22862 ?auto_22863 ) ) ( not ( = ?auto_22862 ?auto_22866 ) ) ( not ( = ?auto_22863 ?auto_22866 ) ) ( not ( = ?auto_22862 ?auto_22867 ) ) ( not ( = ?auto_22862 ?auto_22864 ) ) ( not ( = ?auto_22863 ?auto_22867 ) ) ( not ( = ?auto_22863 ?auto_22864 ) ) ( not ( = ?auto_22866 ?auto_22867 ) ) ( not ( = ?auto_22866 ?auto_22864 ) ) ( not ( = ?auto_22867 ?auto_22864 ) ) ( ON ?auto_22864 ?auto_22865 ) ( not ( = ?auto_22862 ?auto_22865 ) ) ( not ( = ?auto_22863 ?auto_22865 ) ) ( not ( = ?auto_22866 ?auto_22865 ) ) ( not ( = ?auto_22867 ?auto_22865 ) ) ( not ( = ?auto_22864 ?auto_22865 ) ) ( ON ?auto_22867 ?auto_22864 ) ( ON-TABLE ?auto_22865 ) ( ON ?auto_22866 ?auto_22867 ) ( CLEAR ?auto_22866 ) ( HOLDING ?auto_22863 ) ( CLEAR ?auto_22862 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22862 ?auto_22863 ?auto_22866 )
      ( MAKE-2PILE ?auto_22862 ?auto_22863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22868 - BLOCK
      ?auto_22869 - BLOCK
    )
    :vars
    (
      ?auto_22872 - BLOCK
      ?auto_22873 - BLOCK
      ?auto_22870 - BLOCK
      ?auto_22871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22868 ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22868 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( not ( = ?auto_22868 ?auto_22873 ) ) ( not ( = ?auto_22868 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22873 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22872 ?auto_22873 ) ) ( not ( = ?auto_22872 ?auto_22870 ) ) ( not ( = ?auto_22873 ?auto_22870 ) ) ( ON ?auto_22870 ?auto_22871 ) ( not ( = ?auto_22868 ?auto_22871 ) ) ( not ( = ?auto_22869 ?auto_22871 ) ) ( not ( = ?auto_22872 ?auto_22871 ) ) ( not ( = ?auto_22873 ?auto_22871 ) ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( ON ?auto_22873 ?auto_22870 ) ( ON-TABLE ?auto_22871 ) ( ON ?auto_22872 ?auto_22873 ) ( CLEAR ?auto_22868 ) ( ON ?auto_22869 ?auto_22872 ) ( CLEAR ?auto_22869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22871 ?auto_22870 ?auto_22873 ?auto_22872 )
      ( MAKE-2PILE ?auto_22868 ?auto_22869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22874 - BLOCK
      ?auto_22875 - BLOCK
    )
    :vars
    (
      ?auto_22877 - BLOCK
      ?auto_22879 - BLOCK
      ?auto_22878 - BLOCK
      ?auto_22876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22874 ?auto_22875 ) ) ( not ( = ?auto_22874 ?auto_22877 ) ) ( not ( = ?auto_22875 ?auto_22877 ) ) ( not ( = ?auto_22874 ?auto_22879 ) ) ( not ( = ?auto_22874 ?auto_22878 ) ) ( not ( = ?auto_22875 ?auto_22879 ) ) ( not ( = ?auto_22875 ?auto_22878 ) ) ( not ( = ?auto_22877 ?auto_22879 ) ) ( not ( = ?auto_22877 ?auto_22878 ) ) ( not ( = ?auto_22879 ?auto_22878 ) ) ( ON ?auto_22878 ?auto_22876 ) ( not ( = ?auto_22874 ?auto_22876 ) ) ( not ( = ?auto_22875 ?auto_22876 ) ) ( not ( = ?auto_22877 ?auto_22876 ) ) ( not ( = ?auto_22879 ?auto_22876 ) ) ( not ( = ?auto_22878 ?auto_22876 ) ) ( ON ?auto_22879 ?auto_22878 ) ( ON-TABLE ?auto_22876 ) ( ON ?auto_22877 ?auto_22879 ) ( ON ?auto_22875 ?auto_22877 ) ( CLEAR ?auto_22875 ) ( HOLDING ?auto_22874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22874 )
      ( MAKE-2PILE ?auto_22874 ?auto_22875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22880 - BLOCK
      ?auto_22881 - BLOCK
    )
    :vars
    (
      ?auto_22884 - BLOCK
      ?auto_22883 - BLOCK
      ?auto_22882 - BLOCK
      ?auto_22885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22880 ?auto_22884 ) ) ( not ( = ?auto_22881 ?auto_22884 ) ) ( not ( = ?auto_22880 ?auto_22883 ) ) ( not ( = ?auto_22880 ?auto_22882 ) ) ( not ( = ?auto_22881 ?auto_22883 ) ) ( not ( = ?auto_22881 ?auto_22882 ) ) ( not ( = ?auto_22884 ?auto_22883 ) ) ( not ( = ?auto_22884 ?auto_22882 ) ) ( not ( = ?auto_22883 ?auto_22882 ) ) ( ON ?auto_22882 ?auto_22885 ) ( not ( = ?auto_22880 ?auto_22885 ) ) ( not ( = ?auto_22881 ?auto_22885 ) ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22882 ?auto_22885 ) ) ( ON ?auto_22883 ?auto_22882 ) ( ON-TABLE ?auto_22885 ) ( ON ?auto_22884 ?auto_22883 ) ( ON ?auto_22881 ?auto_22884 ) ( ON ?auto_22880 ?auto_22881 ) ( CLEAR ?auto_22880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22885 ?auto_22882 ?auto_22883 ?auto_22884 ?auto_22881 )
      ( MAKE-2PILE ?auto_22880 ?auto_22881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22889 - BLOCK
      ?auto_22890 - BLOCK
      ?auto_22891 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22891 ) ( CLEAR ?auto_22890 ) ( ON-TABLE ?auto_22889 ) ( ON ?auto_22890 ?auto_22889 ) ( not ( = ?auto_22889 ?auto_22890 ) ) ( not ( = ?auto_22889 ?auto_22891 ) ) ( not ( = ?auto_22890 ?auto_22891 ) ) )
    :subtasks
    ( ( !STACK ?auto_22891 ?auto_22890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22892 - BLOCK
      ?auto_22893 - BLOCK
      ?auto_22894 - BLOCK
    )
    :vars
    (
      ?auto_22895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22893 ) ( ON-TABLE ?auto_22892 ) ( ON ?auto_22893 ?auto_22892 ) ( not ( = ?auto_22892 ?auto_22893 ) ) ( not ( = ?auto_22892 ?auto_22894 ) ) ( not ( = ?auto_22893 ?auto_22894 ) ) ( ON ?auto_22894 ?auto_22895 ) ( CLEAR ?auto_22894 ) ( HAND-EMPTY ) ( not ( = ?auto_22892 ?auto_22895 ) ) ( not ( = ?auto_22893 ?auto_22895 ) ) ( not ( = ?auto_22894 ?auto_22895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22894 ?auto_22895 )
      ( MAKE-3PILE ?auto_22892 ?auto_22893 ?auto_22894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22896 - BLOCK
      ?auto_22897 - BLOCK
      ?auto_22898 - BLOCK
    )
    :vars
    (
      ?auto_22899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22896 ) ( not ( = ?auto_22896 ?auto_22897 ) ) ( not ( = ?auto_22896 ?auto_22898 ) ) ( not ( = ?auto_22897 ?auto_22898 ) ) ( ON ?auto_22898 ?auto_22899 ) ( CLEAR ?auto_22898 ) ( not ( = ?auto_22896 ?auto_22899 ) ) ( not ( = ?auto_22897 ?auto_22899 ) ) ( not ( = ?auto_22898 ?auto_22899 ) ) ( HOLDING ?auto_22897 ) ( CLEAR ?auto_22896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22896 ?auto_22897 )
      ( MAKE-3PILE ?auto_22896 ?auto_22897 ?auto_22898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22900 - BLOCK
      ?auto_22901 - BLOCK
      ?auto_22902 - BLOCK
    )
    :vars
    (
      ?auto_22903 - BLOCK
      ?auto_22904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22900 ) ( not ( = ?auto_22900 ?auto_22901 ) ) ( not ( = ?auto_22900 ?auto_22902 ) ) ( not ( = ?auto_22901 ?auto_22902 ) ) ( ON ?auto_22902 ?auto_22903 ) ( not ( = ?auto_22900 ?auto_22903 ) ) ( not ( = ?auto_22901 ?auto_22903 ) ) ( not ( = ?auto_22902 ?auto_22903 ) ) ( CLEAR ?auto_22900 ) ( ON ?auto_22901 ?auto_22902 ) ( CLEAR ?auto_22901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22904 ) ( ON ?auto_22903 ?auto_22904 ) ( not ( = ?auto_22904 ?auto_22903 ) ) ( not ( = ?auto_22904 ?auto_22902 ) ) ( not ( = ?auto_22904 ?auto_22901 ) ) ( not ( = ?auto_22900 ?auto_22904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22904 ?auto_22903 ?auto_22902 )
      ( MAKE-3PILE ?auto_22900 ?auto_22901 ?auto_22902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22905 - BLOCK
      ?auto_22906 - BLOCK
      ?auto_22907 - BLOCK
    )
    :vars
    (
      ?auto_22909 - BLOCK
      ?auto_22908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22905 ?auto_22906 ) ) ( not ( = ?auto_22905 ?auto_22907 ) ) ( not ( = ?auto_22906 ?auto_22907 ) ) ( ON ?auto_22907 ?auto_22909 ) ( not ( = ?auto_22905 ?auto_22909 ) ) ( not ( = ?auto_22906 ?auto_22909 ) ) ( not ( = ?auto_22907 ?auto_22909 ) ) ( ON ?auto_22906 ?auto_22907 ) ( CLEAR ?auto_22906 ) ( ON-TABLE ?auto_22908 ) ( ON ?auto_22909 ?auto_22908 ) ( not ( = ?auto_22908 ?auto_22909 ) ) ( not ( = ?auto_22908 ?auto_22907 ) ) ( not ( = ?auto_22908 ?auto_22906 ) ) ( not ( = ?auto_22905 ?auto_22908 ) ) ( HOLDING ?auto_22905 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22905 )
      ( MAKE-3PILE ?auto_22905 ?auto_22906 ?auto_22907 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22910 - BLOCK
      ?auto_22911 - BLOCK
      ?auto_22912 - BLOCK
    )
    :vars
    (
      ?auto_22914 - BLOCK
      ?auto_22913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22910 ?auto_22911 ) ) ( not ( = ?auto_22910 ?auto_22912 ) ) ( not ( = ?auto_22911 ?auto_22912 ) ) ( ON ?auto_22912 ?auto_22914 ) ( not ( = ?auto_22910 ?auto_22914 ) ) ( not ( = ?auto_22911 ?auto_22914 ) ) ( not ( = ?auto_22912 ?auto_22914 ) ) ( ON ?auto_22911 ?auto_22912 ) ( ON-TABLE ?auto_22913 ) ( ON ?auto_22914 ?auto_22913 ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22912 ) ) ( not ( = ?auto_22913 ?auto_22911 ) ) ( not ( = ?auto_22910 ?auto_22913 ) ) ( ON ?auto_22910 ?auto_22911 ) ( CLEAR ?auto_22910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22913 ?auto_22914 ?auto_22912 ?auto_22911 )
      ( MAKE-3PILE ?auto_22910 ?auto_22911 ?auto_22912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22915 - BLOCK
      ?auto_22916 - BLOCK
      ?auto_22917 - BLOCK
    )
    :vars
    (
      ?auto_22918 - BLOCK
      ?auto_22919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22917 ) ) ( not ( = ?auto_22916 ?auto_22917 ) ) ( ON ?auto_22917 ?auto_22918 ) ( not ( = ?auto_22915 ?auto_22918 ) ) ( not ( = ?auto_22916 ?auto_22918 ) ) ( not ( = ?auto_22917 ?auto_22918 ) ) ( ON ?auto_22916 ?auto_22917 ) ( ON-TABLE ?auto_22919 ) ( ON ?auto_22918 ?auto_22919 ) ( not ( = ?auto_22919 ?auto_22918 ) ) ( not ( = ?auto_22919 ?auto_22917 ) ) ( not ( = ?auto_22919 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22919 ) ) ( HOLDING ?auto_22915 ) ( CLEAR ?auto_22916 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22919 ?auto_22918 ?auto_22917 ?auto_22916 ?auto_22915 )
      ( MAKE-3PILE ?auto_22915 ?auto_22916 ?auto_22917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22920 - BLOCK
      ?auto_22921 - BLOCK
      ?auto_22922 - BLOCK
    )
    :vars
    (
      ?auto_22923 - BLOCK
      ?auto_22924 - BLOCK
      ?auto_22925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22920 ?auto_22921 ) ) ( not ( = ?auto_22920 ?auto_22922 ) ) ( not ( = ?auto_22921 ?auto_22922 ) ) ( ON ?auto_22922 ?auto_22923 ) ( not ( = ?auto_22920 ?auto_22923 ) ) ( not ( = ?auto_22921 ?auto_22923 ) ) ( not ( = ?auto_22922 ?auto_22923 ) ) ( ON ?auto_22921 ?auto_22922 ) ( ON-TABLE ?auto_22924 ) ( ON ?auto_22923 ?auto_22924 ) ( not ( = ?auto_22924 ?auto_22923 ) ) ( not ( = ?auto_22924 ?auto_22922 ) ) ( not ( = ?auto_22924 ?auto_22921 ) ) ( not ( = ?auto_22920 ?auto_22924 ) ) ( CLEAR ?auto_22921 ) ( ON ?auto_22920 ?auto_22925 ) ( CLEAR ?auto_22920 ) ( HAND-EMPTY ) ( not ( = ?auto_22920 ?auto_22925 ) ) ( not ( = ?auto_22921 ?auto_22925 ) ) ( not ( = ?auto_22922 ?auto_22925 ) ) ( not ( = ?auto_22923 ?auto_22925 ) ) ( not ( = ?auto_22924 ?auto_22925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22920 ?auto_22925 )
      ( MAKE-3PILE ?auto_22920 ?auto_22921 ?auto_22922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22926 - BLOCK
      ?auto_22927 - BLOCK
      ?auto_22928 - BLOCK
    )
    :vars
    (
      ?auto_22929 - BLOCK
      ?auto_22930 - BLOCK
      ?auto_22931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22926 ?auto_22927 ) ) ( not ( = ?auto_22926 ?auto_22928 ) ) ( not ( = ?auto_22927 ?auto_22928 ) ) ( ON ?auto_22928 ?auto_22929 ) ( not ( = ?auto_22926 ?auto_22929 ) ) ( not ( = ?auto_22927 ?auto_22929 ) ) ( not ( = ?auto_22928 ?auto_22929 ) ) ( ON-TABLE ?auto_22930 ) ( ON ?auto_22929 ?auto_22930 ) ( not ( = ?auto_22930 ?auto_22929 ) ) ( not ( = ?auto_22930 ?auto_22928 ) ) ( not ( = ?auto_22930 ?auto_22927 ) ) ( not ( = ?auto_22926 ?auto_22930 ) ) ( ON ?auto_22926 ?auto_22931 ) ( CLEAR ?auto_22926 ) ( not ( = ?auto_22926 ?auto_22931 ) ) ( not ( = ?auto_22927 ?auto_22931 ) ) ( not ( = ?auto_22928 ?auto_22931 ) ) ( not ( = ?auto_22929 ?auto_22931 ) ) ( not ( = ?auto_22930 ?auto_22931 ) ) ( HOLDING ?auto_22927 ) ( CLEAR ?auto_22928 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22930 ?auto_22929 ?auto_22928 ?auto_22927 )
      ( MAKE-3PILE ?auto_22926 ?auto_22927 ?auto_22928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22932 - BLOCK
      ?auto_22933 - BLOCK
      ?auto_22934 - BLOCK
    )
    :vars
    (
      ?auto_22937 - BLOCK
      ?auto_22936 - BLOCK
      ?auto_22935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22932 ?auto_22933 ) ) ( not ( = ?auto_22932 ?auto_22934 ) ) ( not ( = ?auto_22933 ?auto_22934 ) ) ( ON ?auto_22934 ?auto_22937 ) ( not ( = ?auto_22932 ?auto_22937 ) ) ( not ( = ?auto_22933 ?auto_22937 ) ) ( not ( = ?auto_22934 ?auto_22937 ) ) ( ON-TABLE ?auto_22936 ) ( ON ?auto_22937 ?auto_22936 ) ( not ( = ?auto_22936 ?auto_22937 ) ) ( not ( = ?auto_22936 ?auto_22934 ) ) ( not ( = ?auto_22936 ?auto_22933 ) ) ( not ( = ?auto_22932 ?auto_22936 ) ) ( ON ?auto_22932 ?auto_22935 ) ( not ( = ?auto_22932 ?auto_22935 ) ) ( not ( = ?auto_22933 ?auto_22935 ) ) ( not ( = ?auto_22934 ?auto_22935 ) ) ( not ( = ?auto_22937 ?auto_22935 ) ) ( not ( = ?auto_22936 ?auto_22935 ) ) ( CLEAR ?auto_22934 ) ( ON ?auto_22933 ?auto_22932 ) ( CLEAR ?auto_22933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22935 ?auto_22932 )
      ( MAKE-3PILE ?auto_22932 ?auto_22933 ?auto_22934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22938 - BLOCK
      ?auto_22939 - BLOCK
      ?auto_22940 - BLOCK
    )
    :vars
    (
      ?auto_22942 - BLOCK
      ?auto_22943 - BLOCK
      ?auto_22941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22938 ?auto_22939 ) ) ( not ( = ?auto_22938 ?auto_22940 ) ) ( not ( = ?auto_22939 ?auto_22940 ) ) ( not ( = ?auto_22938 ?auto_22942 ) ) ( not ( = ?auto_22939 ?auto_22942 ) ) ( not ( = ?auto_22940 ?auto_22942 ) ) ( ON-TABLE ?auto_22943 ) ( ON ?auto_22942 ?auto_22943 ) ( not ( = ?auto_22943 ?auto_22942 ) ) ( not ( = ?auto_22943 ?auto_22940 ) ) ( not ( = ?auto_22943 ?auto_22939 ) ) ( not ( = ?auto_22938 ?auto_22943 ) ) ( ON ?auto_22938 ?auto_22941 ) ( not ( = ?auto_22938 ?auto_22941 ) ) ( not ( = ?auto_22939 ?auto_22941 ) ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22942 ?auto_22941 ) ) ( not ( = ?auto_22943 ?auto_22941 ) ) ( ON ?auto_22939 ?auto_22938 ) ( CLEAR ?auto_22939 ) ( ON-TABLE ?auto_22941 ) ( HOLDING ?auto_22940 ) ( CLEAR ?auto_22942 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22943 ?auto_22942 ?auto_22940 )
      ( MAKE-3PILE ?auto_22938 ?auto_22939 ?auto_22940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22944 - BLOCK
      ?auto_22945 - BLOCK
      ?auto_22946 - BLOCK
    )
    :vars
    (
      ?auto_22947 - BLOCK
      ?auto_22948 - BLOCK
      ?auto_22949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22944 ?auto_22945 ) ) ( not ( = ?auto_22944 ?auto_22946 ) ) ( not ( = ?auto_22945 ?auto_22946 ) ) ( not ( = ?auto_22944 ?auto_22947 ) ) ( not ( = ?auto_22945 ?auto_22947 ) ) ( not ( = ?auto_22946 ?auto_22947 ) ) ( ON-TABLE ?auto_22948 ) ( ON ?auto_22947 ?auto_22948 ) ( not ( = ?auto_22948 ?auto_22947 ) ) ( not ( = ?auto_22948 ?auto_22946 ) ) ( not ( = ?auto_22948 ?auto_22945 ) ) ( not ( = ?auto_22944 ?auto_22948 ) ) ( ON ?auto_22944 ?auto_22949 ) ( not ( = ?auto_22944 ?auto_22949 ) ) ( not ( = ?auto_22945 ?auto_22949 ) ) ( not ( = ?auto_22946 ?auto_22949 ) ) ( not ( = ?auto_22947 ?auto_22949 ) ) ( not ( = ?auto_22948 ?auto_22949 ) ) ( ON ?auto_22945 ?auto_22944 ) ( ON-TABLE ?auto_22949 ) ( CLEAR ?auto_22947 ) ( ON ?auto_22946 ?auto_22945 ) ( CLEAR ?auto_22946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22949 ?auto_22944 ?auto_22945 )
      ( MAKE-3PILE ?auto_22944 ?auto_22945 ?auto_22946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22950 - BLOCK
      ?auto_22951 - BLOCK
      ?auto_22952 - BLOCK
    )
    :vars
    (
      ?auto_22953 - BLOCK
      ?auto_22954 - BLOCK
      ?auto_22955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( ON-TABLE ?auto_22954 ) ( not ( = ?auto_22954 ?auto_22953 ) ) ( not ( = ?auto_22954 ?auto_22952 ) ) ( not ( = ?auto_22954 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( ON ?auto_22950 ?auto_22955 ) ( not ( = ?auto_22950 ?auto_22955 ) ) ( not ( = ?auto_22951 ?auto_22955 ) ) ( not ( = ?auto_22952 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( ON ?auto_22951 ?auto_22950 ) ( ON-TABLE ?auto_22955 ) ( ON ?auto_22952 ?auto_22951 ) ( CLEAR ?auto_22952 ) ( HOLDING ?auto_22953 ) ( CLEAR ?auto_22954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22954 ?auto_22953 )
      ( MAKE-3PILE ?auto_22950 ?auto_22951 ?auto_22952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22956 - BLOCK
      ?auto_22957 - BLOCK
      ?auto_22958 - BLOCK
    )
    :vars
    (
      ?auto_22959 - BLOCK
      ?auto_22961 - BLOCK
      ?auto_22960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22956 ?auto_22957 ) ) ( not ( = ?auto_22956 ?auto_22958 ) ) ( not ( = ?auto_22957 ?auto_22958 ) ) ( not ( = ?auto_22956 ?auto_22959 ) ) ( not ( = ?auto_22957 ?auto_22959 ) ) ( not ( = ?auto_22958 ?auto_22959 ) ) ( ON-TABLE ?auto_22961 ) ( not ( = ?auto_22961 ?auto_22959 ) ) ( not ( = ?auto_22961 ?auto_22958 ) ) ( not ( = ?auto_22961 ?auto_22957 ) ) ( not ( = ?auto_22956 ?auto_22961 ) ) ( ON ?auto_22956 ?auto_22960 ) ( not ( = ?auto_22956 ?auto_22960 ) ) ( not ( = ?auto_22957 ?auto_22960 ) ) ( not ( = ?auto_22958 ?auto_22960 ) ) ( not ( = ?auto_22959 ?auto_22960 ) ) ( not ( = ?auto_22961 ?auto_22960 ) ) ( ON ?auto_22957 ?auto_22956 ) ( ON-TABLE ?auto_22960 ) ( ON ?auto_22958 ?auto_22957 ) ( CLEAR ?auto_22961 ) ( ON ?auto_22959 ?auto_22958 ) ( CLEAR ?auto_22959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22960 ?auto_22956 ?auto_22957 ?auto_22958 )
      ( MAKE-3PILE ?auto_22956 ?auto_22957 ?auto_22958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22962 - BLOCK
      ?auto_22963 - BLOCK
      ?auto_22964 - BLOCK
    )
    :vars
    (
      ?auto_22966 - BLOCK
      ?auto_22967 - BLOCK
      ?auto_22965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22962 ?auto_22963 ) ) ( not ( = ?auto_22962 ?auto_22964 ) ) ( not ( = ?auto_22963 ?auto_22964 ) ) ( not ( = ?auto_22962 ?auto_22966 ) ) ( not ( = ?auto_22963 ?auto_22966 ) ) ( not ( = ?auto_22964 ?auto_22966 ) ) ( not ( = ?auto_22967 ?auto_22966 ) ) ( not ( = ?auto_22967 ?auto_22964 ) ) ( not ( = ?auto_22967 ?auto_22963 ) ) ( not ( = ?auto_22962 ?auto_22967 ) ) ( ON ?auto_22962 ?auto_22965 ) ( not ( = ?auto_22962 ?auto_22965 ) ) ( not ( = ?auto_22963 ?auto_22965 ) ) ( not ( = ?auto_22964 ?auto_22965 ) ) ( not ( = ?auto_22966 ?auto_22965 ) ) ( not ( = ?auto_22967 ?auto_22965 ) ) ( ON ?auto_22963 ?auto_22962 ) ( ON-TABLE ?auto_22965 ) ( ON ?auto_22964 ?auto_22963 ) ( ON ?auto_22966 ?auto_22964 ) ( CLEAR ?auto_22966 ) ( HOLDING ?auto_22967 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22967 )
      ( MAKE-3PILE ?auto_22962 ?auto_22963 ?auto_22964 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22968 - BLOCK
      ?auto_22969 - BLOCK
      ?auto_22970 - BLOCK
    )
    :vars
    (
      ?auto_22971 - BLOCK
      ?auto_22973 - BLOCK
      ?auto_22972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22968 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22970 ) ) ( not ( = ?auto_22969 ?auto_22970 ) ) ( not ( = ?auto_22968 ?auto_22971 ) ) ( not ( = ?auto_22969 ?auto_22971 ) ) ( not ( = ?auto_22970 ?auto_22971 ) ) ( not ( = ?auto_22973 ?auto_22971 ) ) ( not ( = ?auto_22973 ?auto_22970 ) ) ( not ( = ?auto_22973 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22973 ) ) ( ON ?auto_22968 ?auto_22972 ) ( not ( = ?auto_22968 ?auto_22972 ) ) ( not ( = ?auto_22969 ?auto_22972 ) ) ( not ( = ?auto_22970 ?auto_22972 ) ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( not ( = ?auto_22973 ?auto_22972 ) ) ( ON ?auto_22969 ?auto_22968 ) ( ON-TABLE ?auto_22972 ) ( ON ?auto_22970 ?auto_22969 ) ( ON ?auto_22971 ?auto_22970 ) ( ON ?auto_22973 ?auto_22971 ) ( CLEAR ?auto_22973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22972 ?auto_22968 ?auto_22969 ?auto_22970 ?auto_22971 )
      ( MAKE-3PILE ?auto_22968 ?auto_22969 ?auto_22970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22975 - BLOCK
    )
    :vars
    (
      ?auto_22976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22976 ?auto_22975 ) ( CLEAR ?auto_22976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22975 ) ( not ( = ?auto_22975 ?auto_22976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22976 ?auto_22975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22977 - BLOCK
    )
    :vars
    (
      ?auto_22978 - BLOCK
      ?auto_22979 - BLOCK
      ?auto_22980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22978 ?auto_22977 ) ( CLEAR ?auto_22978 ) ( ON-TABLE ?auto_22977 ) ( not ( = ?auto_22977 ?auto_22978 ) ) ( HOLDING ?auto_22979 ) ( CLEAR ?auto_22980 ) ( not ( = ?auto_22977 ?auto_22979 ) ) ( not ( = ?auto_22977 ?auto_22980 ) ) ( not ( = ?auto_22978 ?auto_22979 ) ) ( not ( = ?auto_22978 ?auto_22980 ) ) ( not ( = ?auto_22979 ?auto_22980 ) ) )
    :subtasks
    ( ( !STACK ?auto_22979 ?auto_22980 )
      ( MAKE-1PILE ?auto_22977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22981 - BLOCK
    )
    :vars
    (
      ?auto_22983 - BLOCK
      ?auto_22984 - BLOCK
      ?auto_22982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22983 ?auto_22981 ) ( ON-TABLE ?auto_22981 ) ( not ( = ?auto_22981 ?auto_22983 ) ) ( CLEAR ?auto_22984 ) ( not ( = ?auto_22981 ?auto_22982 ) ) ( not ( = ?auto_22981 ?auto_22984 ) ) ( not ( = ?auto_22983 ?auto_22982 ) ) ( not ( = ?auto_22983 ?auto_22984 ) ) ( not ( = ?auto_22982 ?auto_22984 ) ) ( ON ?auto_22982 ?auto_22983 ) ( CLEAR ?auto_22982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22981 ?auto_22983 )
      ( MAKE-1PILE ?auto_22981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22985 - BLOCK
    )
    :vars
    (
      ?auto_22986 - BLOCK
      ?auto_22987 - BLOCK
      ?auto_22988 - BLOCK
      ?auto_22989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22986 ?auto_22985 ) ( ON-TABLE ?auto_22985 ) ( not ( = ?auto_22985 ?auto_22986 ) ) ( not ( = ?auto_22985 ?auto_22987 ) ) ( not ( = ?auto_22985 ?auto_22988 ) ) ( not ( = ?auto_22986 ?auto_22987 ) ) ( not ( = ?auto_22986 ?auto_22988 ) ) ( not ( = ?auto_22987 ?auto_22988 ) ) ( ON ?auto_22987 ?auto_22986 ) ( CLEAR ?auto_22987 ) ( HOLDING ?auto_22988 ) ( CLEAR ?auto_22989 ) ( ON-TABLE ?auto_22989 ) ( not ( = ?auto_22989 ?auto_22988 ) ) ( not ( = ?auto_22985 ?auto_22989 ) ) ( not ( = ?auto_22986 ?auto_22989 ) ) ( not ( = ?auto_22987 ?auto_22989 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22989 ?auto_22988 )
      ( MAKE-1PILE ?auto_22985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22990 - BLOCK
    )
    :vars
    (
      ?auto_22994 - BLOCK
      ?auto_22992 - BLOCK
      ?auto_22993 - BLOCK
      ?auto_22991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22994 ?auto_22990 ) ( ON-TABLE ?auto_22990 ) ( not ( = ?auto_22990 ?auto_22994 ) ) ( not ( = ?auto_22990 ?auto_22992 ) ) ( not ( = ?auto_22990 ?auto_22993 ) ) ( not ( = ?auto_22994 ?auto_22992 ) ) ( not ( = ?auto_22994 ?auto_22993 ) ) ( not ( = ?auto_22992 ?auto_22993 ) ) ( ON ?auto_22992 ?auto_22994 ) ( CLEAR ?auto_22991 ) ( ON-TABLE ?auto_22991 ) ( not ( = ?auto_22991 ?auto_22993 ) ) ( not ( = ?auto_22990 ?auto_22991 ) ) ( not ( = ?auto_22994 ?auto_22991 ) ) ( not ( = ?auto_22992 ?auto_22991 ) ) ( ON ?auto_22993 ?auto_22992 ) ( CLEAR ?auto_22993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22990 ?auto_22994 ?auto_22992 )
      ( MAKE-1PILE ?auto_22990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_22995 - BLOCK
    )
    :vars
    (
      ?auto_22998 - BLOCK
      ?auto_22999 - BLOCK
      ?auto_22997 - BLOCK
      ?auto_22996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22998 ?auto_22995 ) ( ON-TABLE ?auto_22995 ) ( not ( = ?auto_22995 ?auto_22998 ) ) ( not ( = ?auto_22995 ?auto_22999 ) ) ( not ( = ?auto_22995 ?auto_22997 ) ) ( not ( = ?auto_22998 ?auto_22999 ) ) ( not ( = ?auto_22998 ?auto_22997 ) ) ( not ( = ?auto_22999 ?auto_22997 ) ) ( ON ?auto_22999 ?auto_22998 ) ( not ( = ?auto_22996 ?auto_22997 ) ) ( not ( = ?auto_22995 ?auto_22996 ) ) ( not ( = ?auto_22998 ?auto_22996 ) ) ( not ( = ?auto_22999 ?auto_22996 ) ) ( ON ?auto_22997 ?auto_22999 ) ( CLEAR ?auto_22997 ) ( HOLDING ?auto_22996 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22996 )
      ( MAKE-1PILE ?auto_22995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23000 - BLOCK
    )
    :vars
    (
      ?auto_23001 - BLOCK
      ?auto_23002 - BLOCK
      ?auto_23004 - BLOCK
      ?auto_23003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23001 ?auto_23000 ) ( ON-TABLE ?auto_23000 ) ( not ( = ?auto_23000 ?auto_23001 ) ) ( not ( = ?auto_23000 ?auto_23002 ) ) ( not ( = ?auto_23000 ?auto_23004 ) ) ( not ( = ?auto_23001 ?auto_23002 ) ) ( not ( = ?auto_23001 ?auto_23004 ) ) ( not ( = ?auto_23002 ?auto_23004 ) ) ( ON ?auto_23002 ?auto_23001 ) ( not ( = ?auto_23003 ?auto_23004 ) ) ( not ( = ?auto_23000 ?auto_23003 ) ) ( not ( = ?auto_23001 ?auto_23003 ) ) ( not ( = ?auto_23002 ?auto_23003 ) ) ( ON ?auto_23004 ?auto_23002 ) ( ON ?auto_23003 ?auto_23004 ) ( CLEAR ?auto_23003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23000 ?auto_23001 ?auto_23002 ?auto_23004 )
      ( MAKE-1PILE ?auto_23000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23005 - BLOCK
    )
    :vars
    (
      ?auto_23008 - BLOCK
      ?auto_23009 - BLOCK
      ?auto_23006 - BLOCK
      ?auto_23007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23008 ?auto_23005 ) ( ON-TABLE ?auto_23005 ) ( not ( = ?auto_23005 ?auto_23008 ) ) ( not ( = ?auto_23005 ?auto_23009 ) ) ( not ( = ?auto_23005 ?auto_23006 ) ) ( not ( = ?auto_23008 ?auto_23009 ) ) ( not ( = ?auto_23008 ?auto_23006 ) ) ( not ( = ?auto_23009 ?auto_23006 ) ) ( ON ?auto_23009 ?auto_23008 ) ( not ( = ?auto_23007 ?auto_23006 ) ) ( not ( = ?auto_23005 ?auto_23007 ) ) ( not ( = ?auto_23008 ?auto_23007 ) ) ( not ( = ?auto_23009 ?auto_23007 ) ) ( ON ?auto_23006 ?auto_23009 ) ( HOLDING ?auto_23007 ) ( CLEAR ?auto_23006 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23005 ?auto_23008 ?auto_23009 ?auto_23006 ?auto_23007 )
      ( MAKE-1PILE ?auto_23005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23010 - BLOCK
    )
    :vars
    (
      ?auto_23013 - BLOCK
      ?auto_23012 - BLOCK
      ?auto_23011 - BLOCK
      ?auto_23014 - BLOCK
      ?auto_23015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23013 ?auto_23010 ) ( ON-TABLE ?auto_23010 ) ( not ( = ?auto_23010 ?auto_23013 ) ) ( not ( = ?auto_23010 ?auto_23012 ) ) ( not ( = ?auto_23010 ?auto_23011 ) ) ( not ( = ?auto_23013 ?auto_23012 ) ) ( not ( = ?auto_23013 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23011 ) ) ( ON ?auto_23012 ?auto_23013 ) ( not ( = ?auto_23014 ?auto_23011 ) ) ( not ( = ?auto_23010 ?auto_23014 ) ) ( not ( = ?auto_23013 ?auto_23014 ) ) ( not ( = ?auto_23012 ?auto_23014 ) ) ( ON ?auto_23011 ?auto_23012 ) ( CLEAR ?auto_23011 ) ( ON ?auto_23014 ?auto_23015 ) ( CLEAR ?auto_23014 ) ( HAND-EMPTY ) ( not ( = ?auto_23010 ?auto_23015 ) ) ( not ( = ?auto_23013 ?auto_23015 ) ) ( not ( = ?auto_23012 ?auto_23015 ) ) ( not ( = ?auto_23011 ?auto_23015 ) ) ( not ( = ?auto_23014 ?auto_23015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23014 ?auto_23015 )
      ( MAKE-1PILE ?auto_23010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23016 - BLOCK
    )
    :vars
    (
      ?auto_23017 - BLOCK
      ?auto_23019 - BLOCK
      ?auto_23020 - BLOCK
      ?auto_23018 - BLOCK
      ?auto_23021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23017 ?auto_23016 ) ( ON-TABLE ?auto_23016 ) ( not ( = ?auto_23016 ?auto_23017 ) ) ( not ( = ?auto_23016 ?auto_23019 ) ) ( not ( = ?auto_23016 ?auto_23020 ) ) ( not ( = ?auto_23017 ?auto_23019 ) ) ( not ( = ?auto_23017 ?auto_23020 ) ) ( not ( = ?auto_23019 ?auto_23020 ) ) ( ON ?auto_23019 ?auto_23017 ) ( not ( = ?auto_23018 ?auto_23020 ) ) ( not ( = ?auto_23016 ?auto_23018 ) ) ( not ( = ?auto_23017 ?auto_23018 ) ) ( not ( = ?auto_23019 ?auto_23018 ) ) ( ON ?auto_23018 ?auto_23021 ) ( CLEAR ?auto_23018 ) ( not ( = ?auto_23016 ?auto_23021 ) ) ( not ( = ?auto_23017 ?auto_23021 ) ) ( not ( = ?auto_23019 ?auto_23021 ) ) ( not ( = ?auto_23020 ?auto_23021 ) ) ( not ( = ?auto_23018 ?auto_23021 ) ) ( HOLDING ?auto_23020 ) ( CLEAR ?auto_23019 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23016 ?auto_23017 ?auto_23019 ?auto_23020 )
      ( MAKE-1PILE ?auto_23016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23022 - BLOCK
    )
    :vars
    (
      ?auto_23026 - BLOCK
      ?auto_23027 - BLOCK
      ?auto_23025 - BLOCK
      ?auto_23023 - BLOCK
      ?auto_23024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23026 ?auto_23022 ) ( ON-TABLE ?auto_23022 ) ( not ( = ?auto_23022 ?auto_23026 ) ) ( not ( = ?auto_23022 ?auto_23027 ) ) ( not ( = ?auto_23022 ?auto_23025 ) ) ( not ( = ?auto_23026 ?auto_23027 ) ) ( not ( = ?auto_23026 ?auto_23025 ) ) ( not ( = ?auto_23027 ?auto_23025 ) ) ( ON ?auto_23027 ?auto_23026 ) ( not ( = ?auto_23023 ?auto_23025 ) ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( not ( = ?auto_23026 ?auto_23023 ) ) ( not ( = ?auto_23027 ?auto_23023 ) ) ( ON ?auto_23023 ?auto_23024 ) ( not ( = ?auto_23022 ?auto_23024 ) ) ( not ( = ?auto_23026 ?auto_23024 ) ) ( not ( = ?auto_23027 ?auto_23024 ) ) ( not ( = ?auto_23025 ?auto_23024 ) ) ( not ( = ?auto_23023 ?auto_23024 ) ) ( CLEAR ?auto_23027 ) ( ON ?auto_23025 ?auto_23023 ) ( CLEAR ?auto_23025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23024 ?auto_23023 )
      ( MAKE-1PILE ?auto_23022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23028 - BLOCK
    )
    :vars
    (
      ?auto_23032 - BLOCK
      ?auto_23031 - BLOCK
      ?auto_23029 - BLOCK
      ?auto_23030 - BLOCK
      ?auto_23033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23032 ?auto_23028 ) ( ON-TABLE ?auto_23028 ) ( not ( = ?auto_23028 ?auto_23032 ) ) ( not ( = ?auto_23028 ?auto_23031 ) ) ( not ( = ?auto_23028 ?auto_23029 ) ) ( not ( = ?auto_23032 ?auto_23031 ) ) ( not ( = ?auto_23032 ?auto_23029 ) ) ( not ( = ?auto_23031 ?auto_23029 ) ) ( not ( = ?auto_23030 ?auto_23029 ) ) ( not ( = ?auto_23028 ?auto_23030 ) ) ( not ( = ?auto_23032 ?auto_23030 ) ) ( not ( = ?auto_23031 ?auto_23030 ) ) ( ON ?auto_23030 ?auto_23033 ) ( not ( = ?auto_23028 ?auto_23033 ) ) ( not ( = ?auto_23032 ?auto_23033 ) ) ( not ( = ?auto_23031 ?auto_23033 ) ) ( not ( = ?auto_23029 ?auto_23033 ) ) ( not ( = ?auto_23030 ?auto_23033 ) ) ( ON ?auto_23029 ?auto_23030 ) ( CLEAR ?auto_23029 ) ( ON-TABLE ?auto_23033 ) ( HOLDING ?auto_23031 ) ( CLEAR ?auto_23032 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23028 ?auto_23032 ?auto_23031 )
      ( MAKE-1PILE ?auto_23028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23034 - BLOCK
    )
    :vars
    (
      ?auto_23039 - BLOCK
      ?auto_23038 - BLOCK
      ?auto_23035 - BLOCK
      ?auto_23037 - BLOCK
      ?auto_23036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23039 ?auto_23034 ) ( ON-TABLE ?auto_23034 ) ( not ( = ?auto_23034 ?auto_23039 ) ) ( not ( = ?auto_23034 ?auto_23038 ) ) ( not ( = ?auto_23034 ?auto_23035 ) ) ( not ( = ?auto_23039 ?auto_23038 ) ) ( not ( = ?auto_23039 ?auto_23035 ) ) ( not ( = ?auto_23038 ?auto_23035 ) ) ( not ( = ?auto_23037 ?auto_23035 ) ) ( not ( = ?auto_23034 ?auto_23037 ) ) ( not ( = ?auto_23039 ?auto_23037 ) ) ( not ( = ?auto_23038 ?auto_23037 ) ) ( ON ?auto_23037 ?auto_23036 ) ( not ( = ?auto_23034 ?auto_23036 ) ) ( not ( = ?auto_23039 ?auto_23036 ) ) ( not ( = ?auto_23038 ?auto_23036 ) ) ( not ( = ?auto_23035 ?auto_23036 ) ) ( not ( = ?auto_23037 ?auto_23036 ) ) ( ON ?auto_23035 ?auto_23037 ) ( ON-TABLE ?auto_23036 ) ( CLEAR ?auto_23039 ) ( ON ?auto_23038 ?auto_23035 ) ( CLEAR ?auto_23038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23036 ?auto_23037 ?auto_23035 )
      ( MAKE-1PILE ?auto_23034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23052 - BLOCK
    )
    :vars
    (
      ?auto_23056 - BLOCK
      ?auto_23054 - BLOCK
      ?auto_23057 - BLOCK
      ?auto_23055 - BLOCK
      ?auto_23053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23052 ?auto_23056 ) ) ( not ( = ?auto_23052 ?auto_23054 ) ) ( not ( = ?auto_23052 ?auto_23057 ) ) ( not ( = ?auto_23056 ?auto_23054 ) ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23054 ?auto_23057 ) ) ( not ( = ?auto_23055 ?auto_23057 ) ) ( not ( = ?auto_23052 ?auto_23055 ) ) ( not ( = ?auto_23056 ?auto_23055 ) ) ( not ( = ?auto_23054 ?auto_23055 ) ) ( ON ?auto_23055 ?auto_23053 ) ( not ( = ?auto_23052 ?auto_23053 ) ) ( not ( = ?auto_23056 ?auto_23053 ) ) ( not ( = ?auto_23054 ?auto_23053 ) ) ( not ( = ?auto_23057 ?auto_23053 ) ) ( not ( = ?auto_23055 ?auto_23053 ) ) ( ON ?auto_23057 ?auto_23055 ) ( ON-TABLE ?auto_23053 ) ( ON ?auto_23054 ?auto_23057 ) ( ON ?auto_23056 ?auto_23054 ) ( CLEAR ?auto_23056 ) ( HOLDING ?auto_23052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23052 ?auto_23056 )
      ( MAKE-1PILE ?auto_23052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23058 - BLOCK
    )
    :vars
    (
      ?auto_23059 - BLOCK
      ?auto_23063 - BLOCK
      ?auto_23062 - BLOCK
      ?auto_23060 - BLOCK
      ?auto_23061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23058 ?auto_23063 ) ) ( not ( = ?auto_23058 ?auto_23062 ) ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23059 ?auto_23062 ) ) ( not ( = ?auto_23063 ?auto_23062 ) ) ( not ( = ?auto_23060 ?auto_23062 ) ) ( not ( = ?auto_23058 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23063 ?auto_23060 ) ) ( ON ?auto_23060 ?auto_23061 ) ( not ( = ?auto_23058 ?auto_23061 ) ) ( not ( = ?auto_23059 ?auto_23061 ) ) ( not ( = ?auto_23063 ?auto_23061 ) ) ( not ( = ?auto_23062 ?auto_23061 ) ) ( not ( = ?auto_23060 ?auto_23061 ) ) ( ON ?auto_23062 ?auto_23060 ) ( ON-TABLE ?auto_23061 ) ( ON ?auto_23063 ?auto_23062 ) ( ON ?auto_23059 ?auto_23063 ) ( ON ?auto_23058 ?auto_23059 ) ( CLEAR ?auto_23058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23061 ?auto_23060 ?auto_23062 ?auto_23063 ?auto_23059 )
      ( MAKE-1PILE ?auto_23058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23068 - BLOCK
      ?auto_23069 - BLOCK
      ?auto_23070 - BLOCK
      ?auto_23071 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23071 ) ( CLEAR ?auto_23070 ) ( ON-TABLE ?auto_23068 ) ( ON ?auto_23069 ?auto_23068 ) ( ON ?auto_23070 ?auto_23069 ) ( not ( = ?auto_23068 ?auto_23069 ) ) ( not ( = ?auto_23068 ?auto_23070 ) ) ( not ( = ?auto_23068 ?auto_23071 ) ) ( not ( = ?auto_23069 ?auto_23070 ) ) ( not ( = ?auto_23069 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23071 ) ) )
    :subtasks
    ( ( !STACK ?auto_23071 ?auto_23070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23072 - BLOCK
      ?auto_23073 - BLOCK
      ?auto_23074 - BLOCK
      ?auto_23075 - BLOCK
    )
    :vars
    (
      ?auto_23076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23074 ) ( ON-TABLE ?auto_23072 ) ( ON ?auto_23073 ?auto_23072 ) ( ON ?auto_23074 ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( not ( = ?auto_23072 ?auto_23074 ) ) ( not ( = ?auto_23072 ?auto_23075 ) ) ( not ( = ?auto_23073 ?auto_23074 ) ) ( not ( = ?auto_23073 ?auto_23075 ) ) ( not ( = ?auto_23074 ?auto_23075 ) ) ( ON ?auto_23075 ?auto_23076 ) ( CLEAR ?auto_23075 ) ( HAND-EMPTY ) ( not ( = ?auto_23072 ?auto_23076 ) ) ( not ( = ?auto_23073 ?auto_23076 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) ( not ( = ?auto_23075 ?auto_23076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23075 ?auto_23076 )
      ( MAKE-4PILE ?auto_23072 ?auto_23073 ?auto_23074 ?auto_23075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23077 - BLOCK
      ?auto_23078 - BLOCK
      ?auto_23079 - BLOCK
      ?auto_23080 - BLOCK
    )
    :vars
    (
      ?auto_23081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23077 ) ( ON ?auto_23078 ?auto_23077 ) ( not ( = ?auto_23077 ?auto_23078 ) ) ( not ( = ?auto_23077 ?auto_23079 ) ) ( not ( = ?auto_23077 ?auto_23080 ) ) ( not ( = ?auto_23078 ?auto_23079 ) ) ( not ( = ?auto_23078 ?auto_23080 ) ) ( not ( = ?auto_23079 ?auto_23080 ) ) ( ON ?auto_23080 ?auto_23081 ) ( CLEAR ?auto_23080 ) ( not ( = ?auto_23077 ?auto_23081 ) ) ( not ( = ?auto_23078 ?auto_23081 ) ) ( not ( = ?auto_23079 ?auto_23081 ) ) ( not ( = ?auto_23080 ?auto_23081 ) ) ( HOLDING ?auto_23079 ) ( CLEAR ?auto_23078 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23077 ?auto_23078 ?auto_23079 )
      ( MAKE-4PILE ?auto_23077 ?auto_23078 ?auto_23079 ?auto_23080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23082 - BLOCK
      ?auto_23083 - BLOCK
      ?auto_23084 - BLOCK
      ?auto_23085 - BLOCK
    )
    :vars
    (
      ?auto_23086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23082 ) ( ON ?auto_23083 ?auto_23082 ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( not ( = ?auto_23082 ?auto_23084 ) ) ( not ( = ?auto_23082 ?auto_23085 ) ) ( not ( = ?auto_23083 ?auto_23084 ) ) ( not ( = ?auto_23083 ?auto_23085 ) ) ( not ( = ?auto_23084 ?auto_23085 ) ) ( ON ?auto_23085 ?auto_23086 ) ( not ( = ?auto_23082 ?auto_23086 ) ) ( not ( = ?auto_23083 ?auto_23086 ) ) ( not ( = ?auto_23084 ?auto_23086 ) ) ( not ( = ?auto_23085 ?auto_23086 ) ) ( CLEAR ?auto_23083 ) ( ON ?auto_23084 ?auto_23085 ) ( CLEAR ?auto_23084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23086 ?auto_23085 )
      ( MAKE-4PILE ?auto_23082 ?auto_23083 ?auto_23084 ?auto_23085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23087 - BLOCK
      ?auto_23088 - BLOCK
      ?auto_23089 - BLOCK
      ?auto_23090 - BLOCK
    )
    :vars
    (
      ?auto_23091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23087 ) ( not ( = ?auto_23087 ?auto_23088 ) ) ( not ( = ?auto_23087 ?auto_23089 ) ) ( not ( = ?auto_23087 ?auto_23090 ) ) ( not ( = ?auto_23088 ?auto_23089 ) ) ( not ( = ?auto_23088 ?auto_23090 ) ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( ON ?auto_23090 ?auto_23091 ) ( not ( = ?auto_23087 ?auto_23091 ) ) ( not ( = ?auto_23088 ?auto_23091 ) ) ( not ( = ?auto_23089 ?auto_23091 ) ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( ON ?auto_23089 ?auto_23090 ) ( CLEAR ?auto_23089 ) ( ON-TABLE ?auto_23091 ) ( HOLDING ?auto_23088 ) ( CLEAR ?auto_23087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23087 ?auto_23088 )
      ( MAKE-4PILE ?auto_23087 ?auto_23088 ?auto_23089 ?auto_23090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23092 - BLOCK
      ?auto_23093 - BLOCK
      ?auto_23094 - BLOCK
      ?auto_23095 - BLOCK
    )
    :vars
    (
      ?auto_23096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23092 ) ( not ( = ?auto_23092 ?auto_23093 ) ) ( not ( = ?auto_23092 ?auto_23094 ) ) ( not ( = ?auto_23092 ?auto_23095 ) ) ( not ( = ?auto_23093 ?auto_23094 ) ) ( not ( = ?auto_23093 ?auto_23095 ) ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( ON ?auto_23095 ?auto_23096 ) ( not ( = ?auto_23092 ?auto_23096 ) ) ( not ( = ?auto_23093 ?auto_23096 ) ) ( not ( = ?auto_23094 ?auto_23096 ) ) ( not ( = ?auto_23095 ?auto_23096 ) ) ( ON ?auto_23094 ?auto_23095 ) ( ON-TABLE ?auto_23096 ) ( CLEAR ?auto_23092 ) ( ON ?auto_23093 ?auto_23094 ) ( CLEAR ?auto_23093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23096 ?auto_23095 ?auto_23094 )
      ( MAKE-4PILE ?auto_23092 ?auto_23093 ?auto_23094 ?auto_23095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23097 - BLOCK
      ?auto_23098 - BLOCK
      ?auto_23099 - BLOCK
      ?auto_23100 - BLOCK
    )
    :vars
    (
      ?auto_23101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23097 ?auto_23098 ) ) ( not ( = ?auto_23097 ?auto_23099 ) ) ( not ( = ?auto_23097 ?auto_23100 ) ) ( not ( = ?auto_23098 ?auto_23099 ) ) ( not ( = ?auto_23098 ?auto_23100 ) ) ( not ( = ?auto_23099 ?auto_23100 ) ) ( ON ?auto_23100 ?auto_23101 ) ( not ( = ?auto_23097 ?auto_23101 ) ) ( not ( = ?auto_23098 ?auto_23101 ) ) ( not ( = ?auto_23099 ?auto_23101 ) ) ( not ( = ?auto_23100 ?auto_23101 ) ) ( ON ?auto_23099 ?auto_23100 ) ( ON-TABLE ?auto_23101 ) ( ON ?auto_23098 ?auto_23099 ) ( CLEAR ?auto_23098 ) ( HOLDING ?auto_23097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23097 )
      ( MAKE-4PILE ?auto_23097 ?auto_23098 ?auto_23099 ?auto_23100 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23102 - BLOCK
      ?auto_23103 - BLOCK
      ?auto_23104 - BLOCK
      ?auto_23105 - BLOCK
    )
    :vars
    (
      ?auto_23106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23102 ?auto_23103 ) ) ( not ( = ?auto_23102 ?auto_23104 ) ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( not ( = ?auto_23103 ?auto_23104 ) ) ( not ( = ?auto_23103 ?auto_23105 ) ) ( not ( = ?auto_23104 ?auto_23105 ) ) ( ON ?auto_23105 ?auto_23106 ) ( not ( = ?auto_23102 ?auto_23106 ) ) ( not ( = ?auto_23103 ?auto_23106 ) ) ( not ( = ?auto_23104 ?auto_23106 ) ) ( not ( = ?auto_23105 ?auto_23106 ) ) ( ON ?auto_23104 ?auto_23105 ) ( ON-TABLE ?auto_23106 ) ( ON ?auto_23103 ?auto_23104 ) ( ON ?auto_23102 ?auto_23103 ) ( CLEAR ?auto_23102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23106 ?auto_23105 ?auto_23104 ?auto_23103 )
      ( MAKE-4PILE ?auto_23102 ?auto_23103 ?auto_23104 ?auto_23105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23107 - BLOCK
      ?auto_23108 - BLOCK
      ?auto_23109 - BLOCK
      ?auto_23110 - BLOCK
    )
    :vars
    (
      ?auto_23111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23107 ?auto_23108 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23110 ) ) ( not ( = ?auto_23108 ?auto_23109 ) ) ( not ( = ?auto_23108 ?auto_23110 ) ) ( not ( = ?auto_23109 ?auto_23110 ) ) ( ON ?auto_23110 ?auto_23111 ) ( not ( = ?auto_23107 ?auto_23111 ) ) ( not ( = ?auto_23108 ?auto_23111 ) ) ( not ( = ?auto_23109 ?auto_23111 ) ) ( not ( = ?auto_23110 ?auto_23111 ) ) ( ON ?auto_23109 ?auto_23110 ) ( ON-TABLE ?auto_23111 ) ( ON ?auto_23108 ?auto_23109 ) ( HOLDING ?auto_23107 ) ( CLEAR ?auto_23108 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23111 ?auto_23110 ?auto_23109 ?auto_23108 ?auto_23107 )
      ( MAKE-4PILE ?auto_23107 ?auto_23108 ?auto_23109 ?auto_23110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23112 - BLOCK
      ?auto_23113 - BLOCK
      ?auto_23114 - BLOCK
      ?auto_23115 - BLOCK
    )
    :vars
    (
      ?auto_23116 - BLOCK
      ?auto_23117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23112 ?auto_23113 ) ) ( not ( = ?auto_23112 ?auto_23114 ) ) ( not ( = ?auto_23112 ?auto_23115 ) ) ( not ( = ?auto_23113 ?auto_23114 ) ) ( not ( = ?auto_23113 ?auto_23115 ) ) ( not ( = ?auto_23114 ?auto_23115 ) ) ( ON ?auto_23115 ?auto_23116 ) ( not ( = ?auto_23112 ?auto_23116 ) ) ( not ( = ?auto_23113 ?auto_23116 ) ) ( not ( = ?auto_23114 ?auto_23116 ) ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( ON ?auto_23114 ?auto_23115 ) ( ON-TABLE ?auto_23116 ) ( ON ?auto_23113 ?auto_23114 ) ( CLEAR ?auto_23113 ) ( ON ?auto_23112 ?auto_23117 ) ( CLEAR ?auto_23112 ) ( HAND-EMPTY ) ( not ( = ?auto_23112 ?auto_23117 ) ) ( not ( = ?auto_23113 ?auto_23117 ) ) ( not ( = ?auto_23114 ?auto_23117 ) ) ( not ( = ?auto_23115 ?auto_23117 ) ) ( not ( = ?auto_23116 ?auto_23117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23112 ?auto_23117 )
      ( MAKE-4PILE ?auto_23112 ?auto_23113 ?auto_23114 ?auto_23115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23118 - BLOCK
      ?auto_23119 - BLOCK
      ?auto_23120 - BLOCK
      ?auto_23121 - BLOCK
    )
    :vars
    (
      ?auto_23123 - BLOCK
      ?auto_23122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23118 ?auto_23119 ) ) ( not ( = ?auto_23118 ?auto_23120 ) ) ( not ( = ?auto_23118 ?auto_23121 ) ) ( not ( = ?auto_23119 ?auto_23120 ) ) ( not ( = ?auto_23119 ?auto_23121 ) ) ( not ( = ?auto_23120 ?auto_23121 ) ) ( ON ?auto_23121 ?auto_23123 ) ( not ( = ?auto_23118 ?auto_23123 ) ) ( not ( = ?auto_23119 ?auto_23123 ) ) ( not ( = ?auto_23120 ?auto_23123 ) ) ( not ( = ?auto_23121 ?auto_23123 ) ) ( ON ?auto_23120 ?auto_23121 ) ( ON-TABLE ?auto_23123 ) ( ON ?auto_23118 ?auto_23122 ) ( CLEAR ?auto_23118 ) ( not ( = ?auto_23118 ?auto_23122 ) ) ( not ( = ?auto_23119 ?auto_23122 ) ) ( not ( = ?auto_23120 ?auto_23122 ) ) ( not ( = ?auto_23121 ?auto_23122 ) ) ( not ( = ?auto_23123 ?auto_23122 ) ) ( HOLDING ?auto_23119 ) ( CLEAR ?auto_23120 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23123 ?auto_23121 ?auto_23120 ?auto_23119 )
      ( MAKE-4PILE ?auto_23118 ?auto_23119 ?auto_23120 ?auto_23121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23124 - BLOCK
      ?auto_23125 - BLOCK
      ?auto_23126 - BLOCK
      ?auto_23127 - BLOCK
    )
    :vars
    (
      ?auto_23128 - BLOCK
      ?auto_23129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23124 ?auto_23125 ) ) ( not ( = ?auto_23124 ?auto_23126 ) ) ( not ( = ?auto_23124 ?auto_23127 ) ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23127 ) ) ( not ( = ?auto_23126 ?auto_23127 ) ) ( ON ?auto_23127 ?auto_23128 ) ( not ( = ?auto_23124 ?auto_23128 ) ) ( not ( = ?auto_23125 ?auto_23128 ) ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23128 ) ) ( ON ?auto_23126 ?auto_23127 ) ( ON-TABLE ?auto_23128 ) ( ON ?auto_23124 ?auto_23129 ) ( not ( = ?auto_23124 ?auto_23129 ) ) ( not ( = ?auto_23125 ?auto_23129 ) ) ( not ( = ?auto_23126 ?auto_23129 ) ) ( not ( = ?auto_23127 ?auto_23129 ) ) ( not ( = ?auto_23128 ?auto_23129 ) ) ( CLEAR ?auto_23126 ) ( ON ?auto_23125 ?auto_23124 ) ( CLEAR ?auto_23125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23129 ?auto_23124 )
      ( MAKE-4PILE ?auto_23124 ?auto_23125 ?auto_23126 ?auto_23127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23130 - BLOCK
      ?auto_23131 - BLOCK
      ?auto_23132 - BLOCK
      ?auto_23133 - BLOCK
    )
    :vars
    (
      ?auto_23134 - BLOCK
      ?auto_23135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23130 ?auto_23131 ) ) ( not ( = ?auto_23130 ?auto_23132 ) ) ( not ( = ?auto_23130 ?auto_23133 ) ) ( not ( = ?auto_23131 ?auto_23132 ) ) ( not ( = ?auto_23131 ?auto_23133 ) ) ( not ( = ?auto_23132 ?auto_23133 ) ) ( ON ?auto_23133 ?auto_23134 ) ( not ( = ?auto_23130 ?auto_23134 ) ) ( not ( = ?auto_23131 ?auto_23134 ) ) ( not ( = ?auto_23132 ?auto_23134 ) ) ( not ( = ?auto_23133 ?auto_23134 ) ) ( ON-TABLE ?auto_23134 ) ( ON ?auto_23130 ?auto_23135 ) ( not ( = ?auto_23130 ?auto_23135 ) ) ( not ( = ?auto_23131 ?auto_23135 ) ) ( not ( = ?auto_23132 ?auto_23135 ) ) ( not ( = ?auto_23133 ?auto_23135 ) ) ( not ( = ?auto_23134 ?auto_23135 ) ) ( ON ?auto_23131 ?auto_23130 ) ( CLEAR ?auto_23131 ) ( ON-TABLE ?auto_23135 ) ( HOLDING ?auto_23132 ) ( CLEAR ?auto_23133 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23134 ?auto_23133 ?auto_23132 )
      ( MAKE-4PILE ?auto_23130 ?auto_23131 ?auto_23132 ?auto_23133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23136 - BLOCK
      ?auto_23137 - BLOCK
      ?auto_23138 - BLOCK
      ?auto_23139 - BLOCK
    )
    :vars
    (
      ?auto_23141 - BLOCK
      ?auto_23140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23136 ?auto_23137 ) ) ( not ( = ?auto_23136 ?auto_23138 ) ) ( not ( = ?auto_23136 ?auto_23139 ) ) ( not ( = ?auto_23137 ?auto_23138 ) ) ( not ( = ?auto_23137 ?auto_23139 ) ) ( not ( = ?auto_23138 ?auto_23139 ) ) ( ON ?auto_23139 ?auto_23141 ) ( not ( = ?auto_23136 ?auto_23141 ) ) ( not ( = ?auto_23137 ?auto_23141 ) ) ( not ( = ?auto_23138 ?auto_23141 ) ) ( not ( = ?auto_23139 ?auto_23141 ) ) ( ON-TABLE ?auto_23141 ) ( ON ?auto_23136 ?auto_23140 ) ( not ( = ?auto_23136 ?auto_23140 ) ) ( not ( = ?auto_23137 ?auto_23140 ) ) ( not ( = ?auto_23138 ?auto_23140 ) ) ( not ( = ?auto_23139 ?auto_23140 ) ) ( not ( = ?auto_23141 ?auto_23140 ) ) ( ON ?auto_23137 ?auto_23136 ) ( ON-TABLE ?auto_23140 ) ( CLEAR ?auto_23139 ) ( ON ?auto_23138 ?auto_23137 ) ( CLEAR ?auto_23138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23140 ?auto_23136 ?auto_23137 )
      ( MAKE-4PILE ?auto_23136 ?auto_23137 ?auto_23138 ?auto_23139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23142 - BLOCK
      ?auto_23143 - BLOCK
      ?auto_23144 - BLOCK
      ?auto_23145 - BLOCK
    )
    :vars
    (
      ?auto_23147 - BLOCK
      ?auto_23146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23142 ?auto_23143 ) ) ( not ( = ?auto_23142 ?auto_23144 ) ) ( not ( = ?auto_23142 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23142 ?auto_23147 ) ) ( not ( = ?auto_23143 ?auto_23147 ) ) ( not ( = ?auto_23144 ?auto_23147 ) ) ( not ( = ?auto_23145 ?auto_23147 ) ) ( ON-TABLE ?auto_23147 ) ( ON ?auto_23142 ?auto_23146 ) ( not ( = ?auto_23142 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23147 ?auto_23146 ) ) ( ON ?auto_23143 ?auto_23142 ) ( ON-TABLE ?auto_23146 ) ( ON ?auto_23144 ?auto_23143 ) ( CLEAR ?auto_23144 ) ( HOLDING ?auto_23145 ) ( CLEAR ?auto_23147 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23147 ?auto_23145 )
      ( MAKE-4PILE ?auto_23142 ?auto_23143 ?auto_23144 ?auto_23145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23148 - BLOCK
      ?auto_23149 - BLOCK
      ?auto_23150 - BLOCK
      ?auto_23151 - BLOCK
    )
    :vars
    (
      ?auto_23153 - BLOCK
      ?auto_23152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23148 ?auto_23149 ) ) ( not ( = ?auto_23148 ?auto_23150 ) ) ( not ( = ?auto_23148 ?auto_23151 ) ) ( not ( = ?auto_23149 ?auto_23150 ) ) ( not ( = ?auto_23149 ?auto_23151 ) ) ( not ( = ?auto_23150 ?auto_23151 ) ) ( not ( = ?auto_23148 ?auto_23153 ) ) ( not ( = ?auto_23149 ?auto_23153 ) ) ( not ( = ?auto_23150 ?auto_23153 ) ) ( not ( = ?auto_23151 ?auto_23153 ) ) ( ON-TABLE ?auto_23153 ) ( ON ?auto_23148 ?auto_23152 ) ( not ( = ?auto_23148 ?auto_23152 ) ) ( not ( = ?auto_23149 ?auto_23152 ) ) ( not ( = ?auto_23150 ?auto_23152 ) ) ( not ( = ?auto_23151 ?auto_23152 ) ) ( not ( = ?auto_23153 ?auto_23152 ) ) ( ON ?auto_23149 ?auto_23148 ) ( ON-TABLE ?auto_23152 ) ( ON ?auto_23150 ?auto_23149 ) ( CLEAR ?auto_23153 ) ( ON ?auto_23151 ?auto_23150 ) ( CLEAR ?auto_23151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23152 ?auto_23148 ?auto_23149 ?auto_23150 )
      ( MAKE-4PILE ?auto_23148 ?auto_23149 ?auto_23150 ?auto_23151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23154 - BLOCK
      ?auto_23155 - BLOCK
      ?auto_23156 - BLOCK
      ?auto_23157 - BLOCK
    )
    :vars
    (
      ?auto_23159 - BLOCK
      ?auto_23158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23154 ?auto_23155 ) ) ( not ( = ?auto_23154 ?auto_23156 ) ) ( not ( = ?auto_23154 ?auto_23157 ) ) ( not ( = ?auto_23155 ?auto_23156 ) ) ( not ( = ?auto_23155 ?auto_23157 ) ) ( not ( = ?auto_23156 ?auto_23157 ) ) ( not ( = ?auto_23154 ?auto_23159 ) ) ( not ( = ?auto_23155 ?auto_23159 ) ) ( not ( = ?auto_23156 ?auto_23159 ) ) ( not ( = ?auto_23157 ?auto_23159 ) ) ( ON ?auto_23154 ?auto_23158 ) ( not ( = ?auto_23154 ?auto_23158 ) ) ( not ( = ?auto_23155 ?auto_23158 ) ) ( not ( = ?auto_23156 ?auto_23158 ) ) ( not ( = ?auto_23157 ?auto_23158 ) ) ( not ( = ?auto_23159 ?auto_23158 ) ) ( ON ?auto_23155 ?auto_23154 ) ( ON-TABLE ?auto_23158 ) ( ON ?auto_23156 ?auto_23155 ) ( ON ?auto_23157 ?auto_23156 ) ( CLEAR ?auto_23157 ) ( HOLDING ?auto_23159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23159 )
      ( MAKE-4PILE ?auto_23154 ?auto_23155 ?auto_23156 ?auto_23157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23160 - BLOCK
      ?auto_23161 - BLOCK
      ?auto_23162 - BLOCK
      ?auto_23163 - BLOCK
    )
    :vars
    (
      ?auto_23165 - BLOCK
      ?auto_23164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23160 ?auto_23161 ) ) ( not ( = ?auto_23160 ?auto_23162 ) ) ( not ( = ?auto_23160 ?auto_23163 ) ) ( not ( = ?auto_23161 ?auto_23162 ) ) ( not ( = ?auto_23161 ?auto_23163 ) ) ( not ( = ?auto_23162 ?auto_23163 ) ) ( not ( = ?auto_23160 ?auto_23165 ) ) ( not ( = ?auto_23161 ?auto_23165 ) ) ( not ( = ?auto_23162 ?auto_23165 ) ) ( not ( = ?auto_23163 ?auto_23165 ) ) ( ON ?auto_23160 ?auto_23164 ) ( not ( = ?auto_23160 ?auto_23164 ) ) ( not ( = ?auto_23161 ?auto_23164 ) ) ( not ( = ?auto_23162 ?auto_23164 ) ) ( not ( = ?auto_23163 ?auto_23164 ) ) ( not ( = ?auto_23165 ?auto_23164 ) ) ( ON ?auto_23161 ?auto_23160 ) ( ON-TABLE ?auto_23164 ) ( ON ?auto_23162 ?auto_23161 ) ( ON ?auto_23163 ?auto_23162 ) ( ON ?auto_23165 ?auto_23163 ) ( CLEAR ?auto_23165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23164 ?auto_23160 ?auto_23161 ?auto_23162 ?auto_23163 )
      ( MAKE-4PILE ?auto_23160 ?auto_23161 ?auto_23162 ?auto_23163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23171 - BLOCK
      ?auto_23172 - BLOCK
      ?auto_23173 - BLOCK
      ?auto_23174 - BLOCK
      ?auto_23175 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23175 ) ( CLEAR ?auto_23174 ) ( ON-TABLE ?auto_23171 ) ( ON ?auto_23172 ?auto_23171 ) ( ON ?auto_23173 ?auto_23172 ) ( ON ?auto_23174 ?auto_23173 ) ( not ( = ?auto_23171 ?auto_23172 ) ) ( not ( = ?auto_23171 ?auto_23173 ) ) ( not ( = ?auto_23171 ?auto_23174 ) ) ( not ( = ?auto_23171 ?auto_23175 ) ) ( not ( = ?auto_23172 ?auto_23173 ) ) ( not ( = ?auto_23172 ?auto_23174 ) ) ( not ( = ?auto_23172 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23174 ?auto_23175 ) ) )
    :subtasks
    ( ( !STACK ?auto_23175 ?auto_23174 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23176 - BLOCK
      ?auto_23177 - BLOCK
      ?auto_23178 - BLOCK
      ?auto_23179 - BLOCK
      ?auto_23180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23179 ) ( ON-TABLE ?auto_23176 ) ( ON ?auto_23177 ?auto_23176 ) ( ON ?auto_23178 ?auto_23177 ) ( ON ?auto_23179 ?auto_23178 ) ( not ( = ?auto_23176 ?auto_23177 ) ) ( not ( = ?auto_23176 ?auto_23178 ) ) ( not ( = ?auto_23176 ?auto_23179 ) ) ( not ( = ?auto_23176 ?auto_23180 ) ) ( not ( = ?auto_23177 ?auto_23178 ) ) ( not ( = ?auto_23177 ?auto_23179 ) ) ( not ( = ?auto_23177 ?auto_23180 ) ) ( not ( = ?auto_23178 ?auto_23179 ) ) ( not ( = ?auto_23178 ?auto_23180 ) ) ( not ( = ?auto_23179 ?auto_23180 ) ) ( ON-TABLE ?auto_23180 ) ( CLEAR ?auto_23180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_23180 )
      ( MAKE-5PILE ?auto_23176 ?auto_23177 ?auto_23178 ?auto_23179 ?auto_23180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23181 - BLOCK
      ?auto_23182 - BLOCK
      ?auto_23183 - BLOCK
      ?auto_23184 - BLOCK
      ?auto_23185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23181 ) ( ON ?auto_23182 ?auto_23181 ) ( ON ?auto_23183 ?auto_23182 ) ( not ( = ?auto_23181 ?auto_23182 ) ) ( not ( = ?auto_23181 ?auto_23183 ) ) ( not ( = ?auto_23181 ?auto_23184 ) ) ( not ( = ?auto_23181 ?auto_23185 ) ) ( not ( = ?auto_23182 ?auto_23183 ) ) ( not ( = ?auto_23182 ?auto_23184 ) ) ( not ( = ?auto_23182 ?auto_23185 ) ) ( not ( = ?auto_23183 ?auto_23184 ) ) ( not ( = ?auto_23183 ?auto_23185 ) ) ( not ( = ?auto_23184 ?auto_23185 ) ) ( ON-TABLE ?auto_23185 ) ( CLEAR ?auto_23185 ) ( HOLDING ?auto_23184 ) ( CLEAR ?auto_23183 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23181 ?auto_23182 ?auto_23183 ?auto_23184 )
      ( MAKE-5PILE ?auto_23181 ?auto_23182 ?auto_23183 ?auto_23184 ?auto_23185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23186 - BLOCK
      ?auto_23187 - BLOCK
      ?auto_23188 - BLOCK
      ?auto_23189 - BLOCK
      ?auto_23190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23186 ) ( ON ?auto_23187 ?auto_23186 ) ( ON ?auto_23188 ?auto_23187 ) ( not ( = ?auto_23186 ?auto_23187 ) ) ( not ( = ?auto_23186 ?auto_23188 ) ) ( not ( = ?auto_23186 ?auto_23189 ) ) ( not ( = ?auto_23186 ?auto_23190 ) ) ( not ( = ?auto_23187 ?auto_23188 ) ) ( not ( = ?auto_23187 ?auto_23189 ) ) ( not ( = ?auto_23187 ?auto_23190 ) ) ( not ( = ?auto_23188 ?auto_23189 ) ) ( not ( = ?auto_23188 ?auto_23190 ) ) ( not ( = ?auto_23189 ?auto_23190 ) ) ( ON-TABLE ?auto_23190 ) ( CLEAR ?auto_23188 ) ( ON ?auto_23189 ?auto_23190 ) ( CLEAR ?auto_23189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23190 )
      ( MAKE-5PILE ?auto_23186 ?auto_23187 ?auto_23188 ?auto_23189 ?auto_23190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23191 - BLOCK
      ?auto_23192 - BLOCK
      ?auto_23193 - BLOCK
      ?auto_23194 - BLOCK
      ?auto_23195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23191 ) ( ON ?auto_23192 ?auto_23191 ) ( not ( = ?auto_23191 ?auto_23192 ) ) ( not ( = ?auto_23191 ?auto_23193 ) ) ( not ( = ?auto_23191 ?auto_23194 ) ) ( not ( = ?auto_23191 ?auto_23195 ) ) ( not ( = ?auto_23192 ?auto_23193 ) ) ( not ( = ?auto_23192 ?auto_23194 ) ) ( not ( = ?auto_23192 ?auto_23195 ) ) ( not ( = ?auto_23193 ?auto_23194 ) ) ( not ( = ?auto_23193 ?auto_23195 ) ) ( not ( = ?auto_23194 ?auto_23195 ) ) ( ON-TABLE ?auto_23195 ) ( ON ?auto_23194 ?auto_23195 ) ( CLEAR ?auto_23194 ) ( HOLDING ?auto_23193 ) ( CLEAR ?auto_23192 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23191 ?auto_23192 ?auto_23193 )
      ( MAKE-5PILE ?auto_23191 ?auto_23192 ?auto_23193 ?auto_23194 ?auto_23195 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23196 - BLOCK
      ?auto_23197 - BLOCK
      ?auto_23198 - BLOCK
      ?auto_23199 - BLOCK
      ?auto_23200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23196 ) ( ON ?auto_23197 ?auto_23196 ) ( not ( = ?auto_23196 ?auto_23197 ) ) ( not ( = ?auto_23196 ?auto_23198 ) ) ( not ( = ?auto_23196 ?auto_23199 ) ) ( not ( = ?auto_23196 ?auto_23200 ) ) ( not ( = ?auto_23197 ?auto_23198 ) ) ( not ( = ?auto_23197 ?auto_23199 ) ) ( not ( = ?auto_23197 ?auto_23200 ) ) ( not ( = ?auto_23198 ?auto_23199 ) ) ( not ( = ?auto_23198 ?auto_23200 ) ) ( not ( = ?auto_23199 ?auto_23200 ) ) ( ON-TABLE ?auto_23200 ) ( ON ?auto_23199 ?auto_23200 ) ( CLEAR ?auto_23197 ) ( ON ?auto_23198 ?auto_23199 ) ( CLEAR ?auto_23198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23200 ?auto_23199 )
      ( MAKE-5PILE ?auto_23196 ?auto_23197 ?auto_23198 ?auto_23199 ?auto_23200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23201 - BLOCK
      ?auto_23202 - BLOCK
      ?auto_23203 - BLOCK
      ?auto_23204 - BLOCK
      ?auto_23205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23201 ) ( not ( = ?auto_23201 ?auto_23202 ) ) ( not ( = ?auto_23201 ?auto_23203 ) ) ( not ( = ?auto_23201 ?auto_23204 ) ) ( not ( = ?auto_23201 ?auto_23205 ) ) ( not ( = ?auto_23202 ?auto_23203 ) ) ( not ( = ?auto_23202 ?auto_23204 ) ) ( not ( = ?auto_23202 ?auto_23205 ) ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( not ( = ?auto_23203 ?auto_23205 ) ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( ON-TABLE ?auto_23205 ) ( ON ?auto_23204 ?auto_23205 ) ( ON ?auto_23203 ?auto_23204 ) ( CLEAR ?auto_23203 ) ( HOLDING ?auto_23202 ) ( CLEAR ?auto_23201 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23201 ?auto_23202 )
      ( MAKE-5PILE ?auto_23201 ?auto_23202 ?auto_23203 ?auto_23204 ?auto_23205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23206 - BLOCK
      ?auto_23207 - BLOCK
      ?auto_23208 - BLOCK
      ?auto_23209 - BLOCK
      ?auto_23210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23206 ) ( not ( = ?auto_23206 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23210 ) ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23207 ?auto_23209 ) ) ( not ( = ?auto_23207 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( ON-TABLE ?auto_23210 ) ( ON ?auto_23209 ?auto_23210 ) ( ON ?auto_23208 ?auto_23209 ) ( CLEAR ?auto_23206 ) ( ON ?auto_23207 ?auto_23208 ) ( CLEAR ?auto_23207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23210 ?auto_23209 ?auto_23208 )
      ( MAKE-5PILE ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23209 ?auto_23210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23211 - BLOCK
      ?auto_23212 - BLOCK
      ?auto_23213 - BLOCK
      ?auto_23214 - BLOCK
      ?auto_23215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23213 ) ) ( not ( = ?auto_23211 ?auto_23214 ) ) ( not ( = ?auto_23211 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23213 ) ) ( not ( = ?auto_23212 ?auto_23214 ) ) ( not ( = ?auto_23212 ?auto_23215 ) ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23213 ?auto_23215 ) ) ( not ( = ?auto_23214 ?auto_23215 ) ) ( ON-TABLE ?auto_23215 ) ( ON ?auto_23214 ?auto_23215 ) ( ON ?auto_23213 ?auto_23214 ) ( ON ?auto_23212 ?auto_23213 ) ( CLEAR ?auto_23212 ) ( HOLDING ?auto_23211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23211 )
      ( MAKE-5PILE ?auto_23211 ?auto_23212 ?auto_23213 ?auto_23214 ?auto_23215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23216 - BLOCK
      ?auto_23217 - BLOCK
      ?auto_23218 - BLOCK
      ?auto_23219 - BLOCK
      ?auto_23220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23216 ?auto_23217 ) ) ( not ( = ?auto_23216 ?auto_23218 ) ) ( not ( = ?auto_23216 ?auto_23219 ) ) ( not ( = ?auto_23216 ?auto_23220 ) ) ( not ( = ?auto_23217 ?auto_23218 ) ) ( not ( = ?auto_23217 ?auto_23219 ) ) ( not ( = ?auto_23217 ?auto_23220 ) ) ( not ( = ?auto_23218 ?auto_23219 ) ) ( not ( = ?auto_23218 ?auto_23220 ) ) ( not ( = ?auto_23219 ?auto_23220 ) ) ( ON-TABLE ?auto_23220 ) ( ON ?auto_23219 ?auto_23220 ) ( ON ?auto_23218 ?auto_23219 ) ( ON ?auto_23217 ?auto_23218 ) ( ON ?auto_23216 ?auto_23217 ) ( CLEAR ?auto_23216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23220 ?auto_23219 ?auto_23218 ?auto_23217 )
      ( MAKE-5PILE ?auto_23216 ?auto_23217 ?auto_23218 ?auto_23219 ?auto_23220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23221 - BLOCK
      ?auto_23222 - BLOCK
      ?auto_23223 - BLOCK
      ?auto_23224 - BLOCK
      ?auto_23225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23221 ?auto_23222 ) ) ( not ( = ?auto_23221 ?auto_23223 ) ) ( not ( = ?auto_23221 ?auto_23224 ) ) ( not ( = ?auto_23221 ?auto_23225 ) ) ( not ( = ?auto_23222 ?auto_23223 ) ) ( not ( = ?auto_23222 ?auto_23224 ) ) ( not ( = ?auto_23222 ?auto_23225 ) ) ( not ( = ?auto_23223 ?auto_23224 ) ) ( not ( = ?auto_23223 ?auto_23225 ) ) ( not ( = ?auto_23224 ?auto_23225 ) ) ( ON-TABLE ?auto_23225 ) ( ON ?auto_23224 ?auto_23225 ) ( ON ?auto_23223 ?auto_23224 ) ( ON ?auto_23222 ?auto_23223 ) ( HOLDING ?auto_23221 ) ( CLEAR ?auto_23222 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23225 ?auto_23224 ?auto_23223 ?auto_23222 ?auto_23221 )
      ( MAKE-5PILE ?auto_23221 ?auto_23222 ?auto_23223 ?auto_23224 ?auto_23225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23226 - BLOCK
      ?auto_23227 - BLOCK
      ?auto_23228 - BLOCK
      ?auto_23229 - BLOCK
      ?auto_23230 - BLOCK
    )
    :vars
    (
      ?auto_23231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23226 ?auto_23227 ) ) ( not ( = ?auto_23226 ?auto_23228 ) ) ( not ( = ?auto_23226 ?auto_23229 ) ) ( not ( = ?auto_23226 ?auto_23230 ) ) ( not ( = ?auto_23227 ?auto_23228 ) ) ( not ( = ?auto_23227 ?auto_23229 ) ) ( not ( = ?auto_23227 ?auto_23230 ) ) ( not ( = ?auto_23228 ?auto_23229 ) ) ( not ( = ?auto_23228 ?auto_23230 ) ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( ON-TABLE ?auto_23230 ) ( ON ?auto_23229 ?auto_23230 ) ( ON ?auto_23228 ?auto_23229 ) ( ON ?auto_23227 ?auto_23228 ) ( CLEAR ?auto_23227 ) ( ON ?auto_23226 ?auto_23231 ) ( CLEAR ?auto_23226 ) ( HAND-EMPTY ) ( not ( = ?auto_23226 ?auto_23231 ) ) ( not ( = ?auto_23227 ?auto_23231 ) ) ( not ( = ?auto_23228 ?auto_23231 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23230 ?auto_23231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23226 ?auto_23231 )
      ( MAKE-5PILE ?auto_23226 ?auto_23227 ?auto_23228 ?auto_23229 ?auto_23230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23232 - BLOCK
      ?auto_23233 - BLOCK
      ?auto_23234 - BLOCK
      ?auto_23235 - BLOCK
      ?auto_23236 - BLOCK
    )
    :vars
    (
      ?auto_23237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23232 ?auto_23233 ) ) ( not ( = ?auto_23232 ?auto_23234 ) ) ( not ( = ?auto_23232 ?auto_23235 ) ) ( not ( = ?auto_23232 ?auto_23236 ) ) ( not ( = ?auto_23233 ?auto_23234 ) ) ( not ( = ?auto_23233 ?auto_23235 ) ) ( not ( = ?auto_23233 ?auto_23236 ) ) ( not ( = ?auto_23234 ?auto_23235 ) ) ( not ( = ?auto_23234 ?auto_23236 ) ) ( not ( = ?auto_23235 ?auto_23236 ) ) ( ON-TABLE ?auto_23236 ) ( ON ?auto_23235 ?auto_23236 ) ( ON ?auto_23234 ?auto_23235 ) ( ON ?auto_23232 ?auto_23237 ) ( CLEAR ?auto_23232 ) ( not ( = ?auto_23232 ?auto_23237 ) ) ( not ( = ?auto_23233 ?auto_23237 ) ) ( not ( = ?auto_23234 ?auto_23237 ) ) ( not ( = ?auto_23235 ?auto_23237 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( HOLDING ?auto_23233 ) ( CLEAR ?auto_23234 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23236 ?auto_23235 ?auto_23234 ?auto_23233 )
      ( MAKE-5PILE ?auto_23232 ?auto_23233 ?auto_23234 ?auto_23235 ?auto_23236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23238 - BLOCK
      ?auto_23239 - BLOCK
      ?auto_23240 - BLOCK
      ?auto_23241 - BLOCK
      ?auto_23242 - BLOCK
    )
    :vars
    (
      ?auto_23243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23238 ?auto_23239 ) ) ( not ( = ?auto_23238 ?auto_23240 ) ) ( not ( = ?auto_23238 ?auto_23241 ) ) ( not ( = ?auto_23238 ?auto_23242 ) ) ( not ( = ?auto_23239 ?auto_23240 ) ) ( not ( = ?auto_23239 ?auto_23241 ) ) ( not ( = ?auto_23239 ?auto_23242 ) ) ( not ( = ?auto_23240 ?auto_23241 ) ) ( not ( = ?auto_23240 ?auto_23242 ) ) ( not ( = ?auto_23241 ?auto_23242 ) ) ( ON-TABLE ?auto_23242 ) ( ON ?auto_23241 ?auto_23242 ) ( ON ?auto_23240 ?auto_23241 ) ( ON ?auto_23238 ?auto_23243 ) ( not ( = ?auto_23238 ?auto_23243 ) ) ( not ( = ?auto_23239 ?auto_23243 ) ) ( not ( = ?auto_23240 ?auto_23243 ) ) ( not ( = ?auto_23241 ?auto_23243 ) ) ( not ( = ?auto_23242 ?auto_23243 ) ) ( CLEAR ?auto_23240 ) ( ON ?auto_23239 ?auto_23238 ) ( CLEAR ?auto_23239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23243 ?auto_23238 )
      ( MAKE-5PILE ?auto_23238 ?auto_23239 ?auto_23240 ?auto_23241 ?auto_23242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23244 - BLOCK
      ?auto_23245 - BLOCK
      ?auto_23246 - BLOCK
      ?auto_23247 - BLOCK
      ?auto_23248 - BLOCK
    )
    :vars
    (
      ?auto_23249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23244 ?auto_23245 ) ) ( not ( = ?auto_23244 ?auto_23246 ) ) ( not ( = ?auto_23244 ?auto_23247 ) ) ( not ( = ?auto_23244 ?auto_23248 ) ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( not ( = ?auto_23245 ?auto_23247 ) ) ( not ( = ?auto_23245 ?auto_23248 ) ) ( not ( = ?auto_23246 ?auto_23247 ) ) ( not ( = ?auto_23246 ?auto_23248 ) ) ( not ( = ?auto_23247 ?auto_23248 ) ) ( ON-TABLE ?auto_23248 ) ( ON ?auto_23247 ?auto_23248 ) ( ON ?auto_23244 ?auto_23249 ) ( not ( = ?auto_23244 ?auto_23249 ) ) ( not ( = ?auto_23245 ?auto_23249 ) ) ( not ( = ?auto_23246 ?auto_23249 ) ) ( not ( = ?auto_23247 ?auto_23249 ) ) ( not ( = ?auto_23248 ?auto_23249 ) ) ( ON ?auto_23245 ?auto_23244 ) ( CLEAR ?auto_23245 ) ( ON-TABLE ?auto_23249 ) ( HOLDING ?auto_23246 ) ( CLEAR ?auto_23247 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23248 ?auto_23247 ?auto_23246 )
      ( MAKE-5PILE ?auto_23244 ?auto_23245 ?auto_23246 ?auto_23247 ?auto_23248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23250 - BLOCK
      ?auto_23251 - BLOCK
      ?auto_23252 - BLOCK
      ?auto_23253 - BLOCK
      ?auto_23254 - BLOCK
    )
    :vars
    (
      ?auto_23255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23250 ?auto_23251 ) ) ( not ( = ?auto_23250 ?auto_23252 ) ) ( not ( = ?auto_23250 ?auto_23253 ) ) ( not ( = ?auto_23250 ?auto_23254 ) ) ( not ( = ?auto_23251 ?auto_23252 ) ) ( not ( = ?auto_23251 ?auto_23253 ) ) ( not ( = ?auto_23251 ?auto_23254 ) ) ( not ( = ?auto_23252 ?auto_23253 ) ) ( not ( = ?auto_23252 ?auto_23254 ) ) ( not ( = ?auto_23253 ?auto_23254 ) ) ( ON-TABLE ?auto_23254 ) ( ON ?auto_23253 ?auto_23254 ) ( ON ?auto_23250 ?auto_23255 ) ( not ( = ?auto_23250 ?auto_23255 ) ) ( not ( = ?auto_23251 ?auto_23255 ) ) ( not ( = ?auto_23252 ?auto_23255 ) ) ( not ( = ?auto_23253 ?auto_23255 ) ) ( not ( = ?auto_23254 ?auto_23255 ) ) ( ON ?auto_23251 ?auto_23250 ) ( ON-TABLE ?auto_23255 ) ( CLEAR ?auto_23253 ) ( ON ?auto_23252 ?auto_23251 ) ( CLEAR ?auto_23252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23255 ?auto_23250 ?auto_23251 )
      ( MAKE-5PILE ?auto_23250 ?auto_23251 ?auto_23252 ?auto_23253 ?auto_23254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23256 - BLOCK
      ?auto_23257 - BLOCK
      ?auto_23258 - BLOCK
      ?auto_23259 - BLOCK
      ?auto_23260 - BLOCK
    )
    :vars
    (
      ?auto_23261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23256 ?auto_23258 ) ) ( not ( = ?auto_23256 ?auto_23259 ) ) ( not ( = ?auto_23256 ?auto_23260 ) ) ( not ( = ?auto_23257 ?auto_23258 ) ) ( not ( = ?auto_23257 ?auto_23259 ) ) ( not ( = ?auto_23257 ?auto_23260 ) ) ( not ( = ?auto_23258 ?auto_23259 ) ) ( not ( = ?auto_23258 ?auto_23260 ) ) ( not ( = ?auto_23259 ?auto_23260 ) ) ( ON-TABLE ?auto_23260 ) ( ON ?auto_23256 ?auto_23261 ) ( not ( = ?auto_23256 ?auto_23261 ) ) ( not ( = ?auto_23257 ?auto_23261 ) ) ( not ( = ?auto_23258 ?auto_23261 ) ) ( not ( = ?auto_23259 ?auto_23261 ) ) ( not ( = ?auto_23260 ?auto_23261 ) ) ( ON ?auto_23257 ?auto_23256 ) ( ON-TABLE ?auto_23261 ) ( ON ?auto_23258 ?auto_23257 ) ( CLEAR ?auto_23258 ) ( HOLDING ?auto_23259 ) ( CLEAR ?auto_23260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23260 ?auto_23259 )
      ( MAKE-5PILE ?auto_23256 ?auto_23257 ?auto_23258 ?auto_23259 ?auto_23260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23262 - BLOCK
      ?auto_23263 - BLOCK
      ?auto_23264 - BLOCK
      ?auto_23265 - BLOCK
      ?auto_23266 - BLOCK
    )
    :vars
    (
      ?auto_23267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23262 ?auto_23263 ) ) ( not ( = ?auto_23262 ?auto_23264 ) ) ( not ( = ?auto_23262 ?auto_23265 ) ) ( not ( = ?auto_23262 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( not ( = ?auto_23263 ?auto_23265 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( not ( = ?auto_23264 ?auto_23265 ) ) ( not ( = ?auto_23264 ?auto_23266 ) ) ( not ( = ?auto_23265 ?auto_23266 ) ) ( ON-TABLE ?auto_23266 ) ( ON ?auto_23262 ?auto_23267 ) ( not ( = ?auto_23262 ?auto_23267 ) ) ( not ( = ?auto_23263 ?auto_23267 ) ) ( not ( = ?auto_23264 ?auto_23267 ) ) ( not ( = ?auto_23265 ?auto_23267 ) ) ( not ( = ?auto_23266 ?auto_23267 ) ) ( ON ?auto_23263 ?auto_23262 ) ( ON-TABLE ?auto_23267 ) ( ON ?auto_23264 ?auto_23263 ) ( CLEAR ?auto_23266 ) ( ON ?auto_23265 ?auto_23264 ) ( CLEAR ?auto_23265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23267 ?auto_23262 ?auto_23263 ?auto_23264 )
      ( MAKE-5PILE ?auto_23262 ?auto_23263 ?auto_23264 ?auto_23265 ?auto_23266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23268 - BLOCK
      ?auto_23269 - BLOCK
      ?auto_23270 - BLOCK
      ?auto_23271 - BLOCK
      ?auto_23272 - BLOCK
    )
    :vars
    (
      ?auto_23273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23268 ?auto_23269 ) ) ( not ( = ?auto_23268 ?auto_23270 ) ) ( not ( = ?auto_23268 ?auto_23271 ) ) ( not ( = ?auto_23268 ?auto_23272 ) ) ( not ( = ?auto_23269 ?auto_23270 ) ) ( not ( = ?auto_23269 ?auto_23271 ) ) ( not ( = ?auto_23269 ?auto_23272 ) ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23270 ?auto_23272 ) ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( ON ?auto_23268 ?auto_23273 ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23269 ?auto_23273 ) ) ( not ( = ?auto_23270 ?auto_23273 ) ) ( not ( = ?auto_23271 ?auto_23273 ) ) ( not ( = ?auto_23272 ?auto_23273 ) ) ( ON ?auto_23269 ?auto_23268 ) ( ON-TABLE ?auto_23273 ) ( ON ?auto_23270 ?auto_23269 ) ( ON ?auto_23271 ?auto_23270 ) ( CLEAR ?auto_23271 ) ( HOLDING ?auto_23272 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23272 )
      ( MAKE-5PILE ?auto_23268 ?auto_23269 ?auto_23270 ?auto_23271 ?auto_23272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23274 - BLOCK
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
    ( and ( not ( = ?auto_23274 ?auto_23275 ) ) ( not ( = ?auto_23274 ?auto_23276 ) ) ( not ( = ?auto_23274 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23278 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23275 ?auto_23278 ) ) ( not ( = ?auto_23276 ?auto_23277 ) ) ( not ( = ?auto_23276 ?auto_23278 ) ) ( not ( = ?auto_23277 ?auto_23278 ) ) ( ON ?auto_23274 ?auto_23279 ) ( not ( = ?auto_23274 ?auto_23279 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( not ( = ?auto_23276 ?auto_23279 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23278 ?auto_23279 ) ) ( ON ?auto_23275 ?auto_23274 ) ( ON-TABLE ?auto_23279 ) ( ON ?auto_23276 ?auto_23275 ) ( ON ?auto_23277 ?auto_23276 ) ( ON ?auto_23278 ?auto_23277 ) ( CLEAR ?auto_23278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23279 ?auto_23274 ?auto_23275 ?auto_23276 ?auto_23277 )
      ( MAKE-5PILE ?auto_23274 ?auto_23275 ?auto_23276 ?auto_23277 ?auto_23278 ) )
  )

)

