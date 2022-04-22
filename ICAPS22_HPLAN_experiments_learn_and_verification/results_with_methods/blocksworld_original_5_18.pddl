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
      ?auto_37221 - BLOCK
      ?auto_37222 - BLOCK
      ?auto_37223 - BLOCK
      ?auto_37224 - BLOCK
      ?auto_37225 - BLOCK
    )
    :vars
    (
      ?auto_37226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37226 ?auto_37225 ) ( CLEAR ?auto_37226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37221 ) ( ON ?auto_37222 ?auto_37221 ) ( ON ?auto_37223 ?auto_37222 ) ( ON ?auto_37224 ?auto_37223 ) ( ON ?auto_37225 ?auto_37224 ) ( not ( = ?auto_37221 ?auto_37222 ) ) ( not ( = ?auto_37221 ?auto_37223 ) ) ( not ( = ?auto_37221 ?auto_37224 ) ) ( not ( = ?auto_37221 ?auto_37225 ) ) ( not ( = ?auto_37221 ?auto_37226 ) ) ( not ( = ?auto_37222 ?auto_37223 ) ) ( not ( = ?auto_37222 ?auto_37224 ) ) ( not ( = ?auto_37222 ?auto_37225 ) ) ( not ( = ?auto_37222 ?auto_37226 ) ) ( not ( = ?auto_37223 ?auto_37224 ) ) ( not ( = ?auto_37223 ?auto_37225 ) ) ( not ( = ?auto_37223 ?auto_37226 ) ) ( not ( = ?auto_37224 ?auto_37225 ) ) ( not ( = ?auto_37224 ?auto_37226 ) ) ( not ( = ?auto_37225 ?auto_37226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37226 ?auto_37225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37228 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37228 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37229 - BLOCK
    )
    :vars
    (
      ?auto_37230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37229 ?auto_37230 ) ( CLEAR ?auto_37229 ) ( HAND-EMPTY ) ( not ( = ?auto_37229 ?auto_37230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37229 ?auto_37230 )
      ( MAKE-1PILE ?auto_37229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37235 - BLOCK
      ?auto_37236 - BLOCK
      ?auto_37237 - BLOCK
      ?auto_37238 - BLOCK
    )
    :vars
    (
      ?auto_37239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37239 ?auto_37238 ) ( CLEAR ?auto_37239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37235 ) ( ON ?auto_37236 ?auto_37235 ) ( ON ?auto_37237 ?auto_37236 ) ( ON ?auto_37238 ?auto_37237 ) ( not ( = ?auto_37235 ?auto_37236 ) ) ( not ( = ?auto_37235 ?auto_37237 ) ) ( not ( = ?auto_37235 ?auto_37238 ) ) ( not ( = ?auto_37235 ?auto_37239 ) ) ( not ( = ?auto_37236 ?auto_37237 ) ) ( not ( = ?auto_37236 ?auto_37238 ) ) ( not ( = ?auto_37236 ?auto_37239 ) ) ( not ( = ?auto_37237 ?auto_37238 ) ) ( not ( = ?auto_37237 ?auto_37239 ) ) ( not ( = ?auto_37238 ?auto_37239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37239 ?auto_37238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37240 - BLOCK
      ?auto_37241 - BLOCK
      ?auto_37242 - BLOCK
      ?auto_37243 - BLOCK
    )
    :vars
    (
      ?auto_37244 - BLOCK
      ?auto_37245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37244 ?auto_37243 ) ( CLEAR ?auto_37244 ) ( ON-TABLE ?auto_37240 ) ( ON ?auto_37241 ?auto_37240 ) ( ON ?auto_37242 ?auto_37241 ) ( ON ?auto_37243 ?auto_37242 ) ( not ( = ?auto_37240 ?auto_37241 ) ) ( not ( = ?auto_37240 ?auto_37242 ) ) ( not ( = ?auto_37240 ?auto_37243 ) ) ( not ( = ?auto_37240 ?auto_37244 ) ) ( not ( = ?auto_37241 ?auto_37242 ) ) ( not ( = ?auto_37241 ?auto_37243 ) ) ( not ( = ?auto_37241 ?auto_37244 ) ) ( not ( = ?auto_37242 ?auto_37243 ) ) ( not ( = ?auto_37242 ?auto_37244 ) ) ( not ( = ?auto_37243 ?auto_37244 ) ) ( HOLDING ?auto_37245 ) ( not ( = ?auto_37240 ?auto_37245 ) ) ( not ( = ?auto_37241 ?auto_37245 ) ) ( not ( = ?auto_37242 ?auto_37245 ) ) ( not ( = ?auto_37243 ?auto_37245 ) ) ( not ( = ?auto_37244 ?auto_37245 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37245 )
      ( MAKE-4PILE ?auto_37240 ?auto_37241 ?auto_37242 ?auto_37243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37246 - BLOCK
      ?auto_37247 - BLOCK
      ?auto_37248 - BLOCK
      ?auto_37249 - BLOCK
    )
    :vars
    (
      ?auto_37250 - BLOCK
      ?auto_37251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37250 ?auto_37249 ) ( ON-TABLE ?auto_37246 ) ( ON ?auto_37247 ?auto_37246 ) ( ON ?auto_37248 ?auto_37247 ) ( ON ?auto_37249 ?auto_37248 ) ( not ( = ?auto_37246 ?auto_37247 ) ) ( not ( = ?auto_37246 ?auto_37248 ) ) ( not ( = ?auto_37246 ?auto_37249 ) ) ( not ( = ?auto_37246 ?auto_37250 ) ) ( not ( = ?auto_37247 ?auto_37248 ) ) ( not ( = ?auto_37247 ?auto_37249 ) ) ( not ( = ?auto_37247 ?auto_37250 ) ) ( not ( = ?auto_37248 ?auto_37249 ) ) ( not ( = ?auto_37248 ?auto_37250 ) ) ( not ( = ?auto_37249 ?auto_37250 ) ) ( not ( = ?auto_37246 ?auto_37251 ) ) ( not ( = ?auto_37247 ?auto_37251 ) ) ( not ( = ?auto_37248 ?auto_37251 ) ) ( not ( = ?auto_37249 ?auto_37251 ) ) ( not ( = ?auto_37250 ?auto_37251 ) ) ( ON ?auto_37251 ?auto_37250 ) ( CLEAR ?auto_37251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37246 ?auto_37247 ?auto_37248 ?auto_37249 ?auto_37250 )
      ( MAKE-4PILE ?auto_37246 ?auto_37247 ?auto_37248 ?auto_37249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37254 - BLOCK
      ?auto_37255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37255 ) ( CLEAR ?auto_37254 ) ( ON-TABLE ?auto_37254 ) ( not ( = ?auto_37254 ?auto_37255 ) ) )
    :subtasks
    ( ( !STACK ?auto_37255 ?auto_37254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37256 - BLOCK
      ?auto_37257 - BLOCK
    )
    :vars
    (
      ?auto_37258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37256 ) ( ON-TABLE ?auto_37256 ) ( not ( = ?auto_37256 ?auto_37257 ) ) ( ON ?auto_37257 ?auto_37258 ) ( CLEAR ?auto_37257 ) ( HAND-EMPTY ) ( not ( = ?auto_37256 ?auto_37258 ) ) ( not ( = ?auto_37257 ?auto_37258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37257 ?auto_37258 )
      ( MAKE-2PILE ?auto_37256 ?auto_37257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37259 - BLOCK
      ?auto_37260 - BLOCK
    )
    :vars
    (
      ?auto_37261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37259 ?auto_37260 ) ) ( ON ?auto_37260 ?auto_37261 ) ( CLEAR ?auto_37260 ) ( not ( = ?auto_37259 ?auto_37261 ) ) ( not ( = ?auto_37260 ?auto_37261 ) ) ( HOLDING ?auto_37259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37259 )
      ( MAKE-2PILE ?auto_37259 ?auto_37260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37262 - BLOCK
      ?auto_37263 - BLOCK
    )
    :vars
    (
      ?auto_37264 - BLOCK
      ?auto_37266 - BLOCK
      ?auto_37267 - BLOCK
      ?auto_37265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37262 ?auto_37263 ) ) ( ON ?auto_37263 ?auto_37264 ) ( not ( = ?auto_37262 ?auto_37264 ) ) ( not ( = ?auto_37263 ?auto_37264 ) ) ( ON ?auto_37262 ?auto_37263 ) ( CLEAR ?auto_37262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37266 ) ( ON ?auto_37267 ?auto_37266 ) ( ON ?auto_37265 ?auto_37267 ) ( ON ?auto_37264 ?auto_37265 ) ( not ( = ?auto_37266 ?auto_37267 ) ) ( not ( = ?auto_37266 ?auto_37265 ) ) ( not ( = ?auto_37266 ?auto_37264 ) ) ( not ( = ?auto_37266 ?auto_37263 ) ) ( not ( = ?auto_37266 ?auto_37262 ) ) ( not ( = ?auto_37267 ?auto_37265 ) ) ( not ( = ?auto_37267 ?auto_37264 ) ) ( not ( = ?auto_37267 ?auto_37263 ) ) ( not ( = ?auto_37267 ?auto_37262 ) ) ( not ( = ?auto_37265 ?auto_37264 ) ) ( not ( = ?auto_37265 ?auto_37263 ) ) ( not ( = ?auto_37265 ?auto_37262 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37266 ?auto_37267 ?auto_37265 ?auto_37264 ?auto_37263 )
      ( MAKE-2PILE ?auto_37262 ?auto_37263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37271 - BLOCK
      ?auto_37272 - BLOCK
      ?auto_37273 - BLOCK
    )
    :vars
    (
      ?auto_37274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37274 ?auto_37273 ) ( CLEAR ?auto_37274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37271 ) ( ON ?auto_37272 ?auto_37271 ) ( ON ?auto_37273 ?auto_37272 ) ( not ( = ?auto_37271 ?auto_37272 ) ) ( not ( = ?auto_37271 ?auto_37273 ) ) ( not ( = ?auto_37271 ?auto_37274 ) ) ( not ( = ?auto_37272 ?auto_37273 ) ) ( not ( = ?auto_37272 ?auto_37274 ) ) ( not ( = ?auto_37273 ?auto_37274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37274 ?auto_37273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37275 - BLOCK
      ?auto_37276 - BLOCK
      ?auto_37277 - BLOCK
    )
    :vars
    (
      ?auto_37278 - BLOCK
      ?auto_37279 - BLOCK
      ?auto_37280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37278 ?auto_37277 ) ( CLEAR ?auto_37278 ) ( ON-TABLE ?auto_37275 ) ( ON ?auto_37276 ?auto_37275 ) ( ON ?auto_37277 ?auto_37276 ) ( not ( = ?auto_37275 ?auto_37276 ) ) ( not ( = ?auto_37275 ?auto_37277 ) ) ( not ( = ?auto_37275 ?auto_37278 ) ) ( not ( = ?auto_37276 ?auto_37277 ) ) ( not ( = ?auto_37276 ?auto_37278 ) ) ( not ( = ?auto_37277 ?auto_37278 ) ) ( HOLDING ?auto_37279 ) ( CLEAR ?auto_37280 ) ( not ( = ?auto_37275 ?auto_37279 ) ) ( not ( = ?auto_37275 ?auto_37280 ) ) ( not ( = ?auto_37276 ?auto_37279 ) ) ( not ( = ?auto_37276 ?auto_37280 ) ) ( not ( = ?auto_37277 ?auto_37279 ) ) ( not ( = ?auto_37277 ?auto_37280 ) ) ( not ( = ?auto_37278 ?auto_37279 ) ) ( not ( = ?auto_37278 ?auto_37280 ) ) ( not ( = ?auto_37279 ?auto_37280 ) ) )
    :subtasks
    ( ( !STACK ?auto_37279 ?auto_37280 )
      ( MAKE-3PILE ?auto_37275 ?auto_37276 ?auto_37277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37281 - BLOCK
      ?auto_37282 - BLOCK
      ?auto_37283 - BLOCK
    )
    :vars
    (
      ?auto_37285 - BLOCK
      ?auto_37286 - BLOCK
      ?auto_37284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37285 ?auto_37283 ) ( ON-TABLE ?auto_37281 ) ( ON ?auto_37282 ?auto_37281 ) ( ON ?auto_37283 ?auto_37282 ) ( not ( = ?auto_37281 ?auto_37282 ) ) ( not ( = ?auto_37281 ?auto_37283 ) ) ( not ( = ?auto_37281 ?auto_37285 ) ) ( not ( = ?auto_37282 ?auto_37283 ) ) ( not ( = ?auto_37282 ?auto_37285 ) ) ( not ( = ?auto_37283 ?auto_37285 ) ) ( CLEAR ?auto_37286 ) ( not ( = ?auto_37281 ?auto_37284 ) ) ( not ( = ?auto_37281 ?auto_37286 ) ) ( not ( = ?auto_37282 ?auto_37284 ) ) ( not ( = ?auto_37282 ?auto_37286 ) ) ( not ( = ?auto_37283 ?auto_37284 ) ) ( not ( = ?auto_37283 ?auto_37286 ) ) ( not ( = ?auto_37285 ?auto_37284 ) ) ( not ( = ?auto_37285 ?auto_37286 ) ) ( not ( = ?auto_37284 ?auto_37286 ) ) ( ON ?auto_37284 ?auto_37285 ) ( CLEAR ?auto_37284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37281 ?auto_37282 ?auto_37283 ?auto_37285 )
      ( MAKE-3PILE ?auto_37281 ?auto_37282 ?auto_37283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37287 - BLOCK
      ?auto_37288 - BLOCK
      ?auto_37289 - BLOCK
    )
    :vars
    (
      ?auto_37290 - BLOCK
      ?auto_37291 - BLOCK
      ?auto_37292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37290 ?auto_37289 ) ( ON-TABLE ?auto_37287 ) ( ON ?auto_37288 ?auto_37287 ) ( ON ?auto_37289 ?auto_37288 ) ( not ( = ?auto_37287 ?auto_37288 ) ) ( not ( = ?auto_37287 ?auto_37289 ) ) ( not ( = ?auto_37287 ?auto_37290 ) ) ( not ( = ?auto_37288 ?auto_37289 ) ) ( not ( = ?auto_37288 ?auto_37290 ) ) ( not ( = ?auto_37289 ?auto_37290 ) ) ( not ( = ?auto_37287 ?auto_37291 ) ) ( not ( = ?auto_37287 ?auto_37292 ) ) ( not ( = ?auto_37288 ?auto_37291 ) ) ( not ( = ?auto_37288 ?auto_37292 ) ) ( not ( = ?auto_37289 ?auto_37291 ) ) ( not ( = ?auto_37289 ?auto_37292 ) ) ( not ( = ?auto_37290 ?auto_37291 ) ) ( not ( = ?auto_37290 ?auto_37292 ) ) ( not ( = ?auto_37291 ?auto_37292 ) ) ( ON ?auto_37291 ?auto_37290 ) ( CLEAR ?auto_37291 ) ( HOLDING ?auto_37292 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37292 )
      ( MAKE-3PILE ?auto_37287 ?auto_37288 ?auto_37289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37293 - BLOCK
      ?auto_37294 - BLOCK
      ?auto_37295 - BLOCK
    )
    :vars
    (
      ?auto_37298 - BLOCK
      ?auto_37296 - BLOCK
      ?auto_37297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37298 ?auto_37295 ) ( ON-TABLE ?auto_37293 ) ( ON ?auto_37294 ?auto_37293 ) ( ON ?auto_37295 ?auto_37294 ) ( not ( = ?auto_37293 ?auto_37294 ) ) ( not ( = ?auto_37293 ?auto_37295 ) ) ( not ( = ?auto_37293 ?auto_37298 ) ) ( not ( = ?auto_37294 ?auto_37295 ) ) ( not ( = ?auto_37294 ?auto_37298 ) ) ( not ( = ?auto_37295 ?auto_37298 ) ) ( not ( = ?auto_37293 ?auto_37296 ) ) ( not ( = ?auto_37293 ?auto_37297 ) ) ( not ( = ?auto_37294 ?auto_37296 ) ) ( not ( = ?auto_37294 ?auto_37297 ) ) ( not ( = ?auto_37295 ?auto_37296 ) ) ( not ( = ?auto_37295 ?auto_37297 ) ) ( not ( = ?auto_37298 ?auto_37296 ) ) ( not ( = ?auto_37298 ?auto_37297 ) ) ( not ( = ?auto_37296 ?auto_37297 ) ) ( ON ?auto_37296 ?auto_37298 ) ( ON ?auto_37297 ?auto_37296 ) ( CLEAR ?auto_37297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37293 ?auto_37294 ?auto_37295 ?auto_37298 ?auto_37296 )
      ( MAKE-3PILE ?auto_37293 ?auto_37294 ?auto_37295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37302 - BLOCK
      ?auto_37303 - BLOCK
      ?auto_37304 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37304 ) ( CLEAR ?auto_37303 ) ( ON-TABLE ?auto_37302 ) ( ON ?auto_37303 ?auto_37302 ) ( not ( = ?auto_37302 ?auto_37303 ) ) ( not ( = ?auto_37302 ?auto_37304 ) ) ( not ( = ?auto_37303 ?auto_37304 ) ) )
    :subtasks
    ( ( !STACK ?auto_37304 ?auto_37303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37305 - BLOCK
      ?auto_37306 - BLOCK
      ?auto_37307 - BLOCK
    )
    :vars
    (
      ?auto_37308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37306 ) ( ON-TABLE ?auto_37305 ) ( ON ?auto_37306 ?auto_37305 ) ( not ( = ?auto_37305 ?auto_37306 ) ) ( not ( = ?auto_37305 ?auto_37307 ) ) ( not ( = ?auto_37306 ?auto_37307 ) ) ( ON ?auto_37307 ?auto_37308 ) ( CLEAR ?auto_37307 ) ( HAND-EMPTY ) ( not ( = ?auto_37305 ?auto_37308 ) ) ( not ( = ?auto_37306 ?auto_37308 ) ) ( not ( = ?auto_37307 ?auto_37308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37307 ?auto_37308 )
      ( MAKE-3PILE ?auto_37305 ?auto_37306 ?auto_37307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37309 - BLOCK
      ?auto_37310 - BLOCK
      ?auto_37311 - BLOCK
    )
    :vars
    (
      ?auto_37312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37309 ) ( not ( = ?auto_37309 ?auto_37310 ) ) ( not ( = ?auto_37309 ?auto_37311 ) ) ( not ( = ?auto_37310 ?auto_37311 ) ) ( ON ?auto_37311 ?auto_37312 ) ( CLEAR ?auto_37311 ) ( not ( = ?auto_37309 ?auto_37312 ) ) ( not ( = ?auto_37310 ?auto_37312 ) ) ( not ( = ?auto_37311 ?auto_37312 ) ) ( HOLDING ?auto_37310 ) ( CLEAR ?auto_37309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37309 ?auto_37310 )
      ( MAKE-3PILE ?auto_37309 ?auto_37310 ?auto_37311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37313 - BLOCK
      ?auto_37314 - BLOCK
      ?auto_37315 - BLOCK
    )
    :vars
    (
      ?auto_37316 - BLOCK
      ?auto_37318 - BLOCK
      ?auto_37317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37313 ) ( not ( = ?auto_37313 ?auto_37314 ) ) ( not ( = ?auto_37313 ?auto_37315 ) ) ( not ( = ?auto_37314 ?auto_37315 ) ) ( ON ?auto_37315 ?auto_37316 ) ( not ( = ?auto_37313 ?auto_37316 ) ) ( not ( = ?auto_37314 ?auto_37316 ) ) ( not ( = ?auto_37315 ?auto_37316 ) ) ( CLEAR ?auto_37313 ) ( ON ?auto_37314 ?auto_37315 ) ( CLEAR ?auto_37314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37318 ) ( ON ?auto_37317 ?auto_37318 ) ( ON ?auto_37316 ?auto_37317 ) ( not ( = ?auto_37318 ?auto_37317 ) ) ( not ( = ?auto_37318 ?auto_37316 ) ) ( not ( = ?auto_37318 ?auto_37315 ) ) ( not ( = ?auto_37318 ?auto_37314 ) ) ( not ( = ?auto_37317 ?auto_37316 ) ) ( not ( = ?auto_37317 ?auto_37315 ) ) ( not ( = ?auto_37317 ?auto_37314 ) ) ( not ( = ?auto_37313 ?auto_37318 ) ) ( not ( = ?auto_37313 ?auto_37317 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37318 ?auto_37317 ?auto_37316 ?auto_37315 )
      ( MAKE-3PILE ?auto_37313 ?auto_37314 ?auto_37315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37319 - BLOCK
      ?auto_37320 - BLOCK
      ?auto_37321 - BLOCK
    )
    :vars
    (
      ?auto_37322 - BLOCK
      ?auto_37324 - BLOCK
      ?auto_37323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37319 ?auto_37320 ) ) ( not ( = ?auto_37319 ?auto_37321 ) ) ( not ( = ?auto_37320 ?auto_37321 ) ) ( ON ?auto_37321 ?auto_37322 ) ( not ( = ?auto_37319 ?auto_37322 ) ) ( not ( = ?auto_37320 ?auto_37322 ) ) ( not ( = ?auto_37321 ?auto_37322 ) ) ( ON ?auto_37320 ?auto_37321 ) ( CLEAR ?auto_37320 ) ( ON-TABLE ?auto_37324 ) ( ON ?auto_37323 ?auto_37324 ) ( ON ?auto_37322 ?auto_37323 ) ( not ( = ?auto_37324 ?auto_37323 ) ) ( not ( = ?auto_37324 ?auto_37322 ) ) ( not ( = ?auto_37324 ?auto_37321 ) ) ( not ( = ?auto_37324 ?auto_37320 ) ) ( not ( = ?auto_37323 ?auto_37322 ) ) ( not ( = ?auto_37323 ?auto_37321 ) ) ( not ( = ?auto_37323 ?auto_37320 ) ) ( not ( = ?auto_37319 ?auto_37324 ) ) ( not ( = ?auto_37319 ?auto_37323 ) ) ( HOLDING ?auto_37319 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37319 )
      ( MAKE-3PILE ?auto_37319 ?auto_37320 ?auto_37321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37325 - BLOCK
      ?auto_37326 - BLOCK
      ?auto_37327 - BLOCK
    )
    :vars
    (
      ?auto_37329 - BLOCK
      ?auto_37330 - BLOCK
      ?auto_37328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37325 ?auto_37326 ) ) ( not ( = ?auto_37325 ?auto_37327 ) ) ( not ( = ?auto_37326 ?auto_37327 ) ) ( ON ?auto_37327 ?auto_37329 ) ( not ( = ?auto_37325 ?auto_37329 ) ) ( not ( = ?auto_37326 ?auto_37329 ) ) ( not ( = ?auto_37327 ?auto_37329 ) ) ( ON ?auto_37326 ?auto_37327 ) ( ON-TABLE ?auto_37330 ) ( ON ?auto_37328 ?auto_37330 ) ( ON ?auto_37329 ?auto_37328 ) ( not ( = ?auto_37330 ?auto_37328 ) ) ( not ( = ?auto_37330 ?auto_37329 ) ) ( not ( = ?auto_37330 ?auto_37327 ) ) ( not ( = ?auto_37330 ?auto_37326 ) ) ( not ( = ?auto_37328 ?auto_37329 ) ) ( not ( = ?auto_37328 ?auto_37327 ) ) ( not ( = ?auto_37328 ?auto_37326 ) ) ( not ( = ?auto_37325 ?auto_37330 ) ) ( not ( = ?auto_37325 ?auto_37328 ) ) ( ON ?auto_37325 ?auto_37326 ) ( CLEAR ?auto_37325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37330 ?auto_37328 ?auto_37329 ?auto_37327 ?auto_37326 )
      ( MAKE-3PILE ?auto_37325 ?auto_37326 ?auto_37327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37333 - BLOCK
      ?auto_37334 - BLOCK
    )
    :vars
    (
      ?auto_37335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37335 ?auto_37334 ) ( CLEAR ?auto_37335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37333 ) ( ON ?auto_37334 ?auto_37333 ) ( not ( = ?auto_37333 ?auto_37334 ) ) ( not ( = ?auto_37333 ?auto_37335 ) ) ( not ( = ?auto_37334 ?auto_37335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37335 ?auto_37334 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37336 - BLOCK
      ?auto_37337 - BLOCK
    )
    :vars
    (
      ?auto_37338 - BLOCK
      ?auto_37339 - BLOCK
      ?auto_37340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37338 ?auto_37337 ) ( CLEAR ?auto_37338 ) ( ON-TABLE ?auto_37336 ) ( ON ?auto_37337 ?auto_37336 ) ( not ( = ?auto_37336 ?auto_37337 ) ) ( not ( = ?auto_37336 ?auto_37338 ) ) ( not ( = ?auto_37337 ?auto_37338 ) ) ( HOLDING ?auto_37339 ) ( CLEAR ?auto_37340 ) ( not ( = ?auto_37336 ?auto_37339 ) ) ( not ( = ?auto_37336 ?auto_37340 ) ) ( not ( = ?auto_37337 ?auto_37339 ) ) ( not ( = ?auto_37337 ?auto_37340 ) ) ( not ( = ?auto_37338 ?auto_37339 ) ) ( not ( = ?auto_37338 ?auto_37340 ) ) ( not ( = ?auto_37339 ?auto_37340 ) ) )
    :subtasks
    ( ( !STACK ?auto_37339 ?auto_37340 )
      ( MAKE-2PILE ?auto_37336 ?auto_37337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37341 - BLOCK
      ?auto_37342 - BLOCK
    )
    :vars
    (
      ?auto_37344 - BLOCK
      ?auto_37345 - BLOCK
      ?auto_37343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37344 ?auto_37342 ) ( ON-TABLE ?auto_37341 ) ( ON ?auto_37342 ?auto_37341 ) ( not ( = ?auto_37341 ?auto_37342 ) ) ( not ( = ?auto_37341 ?auto_37344 ) ) ( not ( = ?auto_37342 ?auto_37344 ) ) ( CLEAR ?auto_37345 ) ( not ( = ?auto_37341 ?auto_37343 ) ) ( not ( = ?auto_37341 ?auto_37345 ) ) ( not ( = ?auto_37342 ?auto_37343 ) ) ( not ( = ?auto_37342 ?auto_37345 ) ) ( not ( = ?auto_37344 ?auto_37343 ) ) ( not ( = ?auto_37344 ?auto_37345 ) ) ( not ( = ?auto_37343 ?auto_37345 ) ) ( ON ?auto_37343 ?auto_37344 ) ( CLEAR ?auto_37343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37341 ?auto_37342 ?auto_37344 )
      ( MAKE-2PILE ?auto_37341 ?auto_37342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37346 - BLOCK
      ?auto_37347 - BLOCK
    )
    :vars
    (
      ?auto_37348 - BLOCK
      ?auto_37349 - BLOCK
      ?auto_37350 - BLOCK
      ?auto_37351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37348 ?auto_37347 ) ( ON-TABLE ?auto_37346 ) ( ON ?auto_37347 ?auto_37346 ) ( not ( = ?auto_37346 ?auto_37347 ) ) ( not ( = ?auto_37346 ?auto_37348 ) ) ( not ( = ?auto_37347 ?auto_37348 ) ) ( not ( = ?auto_37346 ?auto_37349 ) ) ( not ( = ?auto_37346 ?auto_37350 ) ) ( not ( = ?auto_37347 ?auto_37349 ) ) ( not ( = ?auto_37347 ?auto_37350 ) ) ( not ( = ?auto_37348 ?auto_37349 ) ) ( not ( = ?auto_37348 ?auto_37350 ) ) ( not ( = ?auto_37349 ?auto_37350 ) ) ( ON ?auto_37349 ?auto_37348 ) ( CLEAR ?auto_37349 ) ( HOLDING ?auto_37350 ) ( CLEAR ?auto_37351 ) ( ON-TABLE ?auto_37351 ) ( not ( = ?auto_37351 ?auto_37350 ) ) ( not ( = ?auto_37346 ?auto_37351 ) ) ( not ( = ?auto_37347 ?auto_37351 ) ) ( not ( = ?auto_37348 ?auto_37351 ) ) ( not ( = ?auto_37349 ?auto_37351 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37351 ?auto_37350 )
      ( MAKE-2PILE ?auto_37346 ?auto_37347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37352 - BLOCK
      ?auto_37353 - BLOCK
    )
    :vars
    (
      ?auto_37356 - BLOCK
      ?auto_37357 - BLOCK
      ?auto_37355 - BLOCK
      ?auto_37354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37356 ?auto_37353 ) ( ON-TABLE ?auto_37352 ) ( ON ?auto_37353 ?auto_37352 ) ( not ( = ?auto_37352 ?auto_37353 ) ) ( not ( = ?auto_37352 ?auto_37356 ) ) ( not ( = ?auto_37353 ?auto_37356 ) ) ( not ( = ?auto_37352 ?auto_37357 ) ) ( not ( = ?auto_37352 ?auto_37355 ) ) ( not ( = ?auto_37353 ?auto_37357 ) ) ( not ( = ?auto_37353 ?auto_37355 ) ) ( not ( = ?auto_37356 ?auto_37357 ) ) ( not ( = ?auto_37356 ?auto_37355 ) ) ( not ( = ?auto_37357 ?auto_37355 ) ) ( ON ?auto_37357 ?auto_37356 ) ( CLEAR ?auto_37354 ) ( ON-TABLE ?auto_37354 ) ( not ( = ?auto_37354 ?auto_37355 ) ) ( not ( = ?auto_37352 ?auto_37354 ) ) ( not ( = ?auto_37353 ?auto_37354 ) ) ( not ( = ?auto_37356 ?auto_37354 ) ) ( not ( = ?auto_37357 ?auto_37354 ) ) ( ON ?auto_37355 ?auto_37357 ) ( CLEAR ?auto_37355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37352 ?auto_37353 ?auto_37356 ?auto_37357 )
      ( MAKE-2PILE ?auto_37352 ?auto_37353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37358 - BLOCK
      ?auto_37359 - BLOCK
    )
    :vars
    (
      ?auto_37362 - BLOCK
      ?auto_37361 - BLOCK
      ?auto_37363 - BLOCK
      ?auto_37360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37362 ?auto_37359 ) ( ON-TABLE ?auto_37358 ) ( ON ?auto_37359 ?auto_37358 ) ( not ( = ?auto_37358 ?auto_37359 ) ) ( not ( = ?auto_37358 ?auto_37362 ) ) ( not ( = ?auto_37359 ?auto_37362 ) ) ( not ( = ?auto_37358 ?auto_37361 ) ) ( not ( = ?auto_37358 ?auto_37363 ) ) ( not ( = ?auto_37359 ?auto_37361 ) ) ( not ( = ?auto_37359 ?auto_37363 ) ) ( not ( = ?auto_37362 ?auto_37361 ) ) ( not ( = ?auto_37362 ?auto_37363 ) ) ( not ( = ?auto_37361 ?auto_37363 ) ) ( ON ?auto_37361 ?auto_37362 ) ( not ( = ?auto_37360 ?auto_37363 ) ) ( not ( = ?auto_37358 ?auto_37360 ) ) ( not ( = ?auto_37359 ?auto_37360 ) ) ( not ( = ?auto_37362 ?auto_37360 ) ) ( not ( = ?auto_37361 ?auto_37360 ) ) ( ON ?auto_37363 ?auto_37361 ) ( CLEAR ?auto_37363 ) ( HOLDING ?auto_37360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37360 )
      ( MAKE-2PILE ?auto_37358 ?auto_37359 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37364 - BLOCK
      ?auto_37365 - BLOCK
    )
    :vars
    (
      ?auto_37366 - BLOCK
      ?auto_37369 - BLOCK
      ?auto_37367 - BLOCK
      ?auto_37368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37366 ?auto_37365 ) ( ON-TABLE ?auto_37364 ) ( ON ?auto_37365 ?auto_37364 ) ( not ( = ?auto_37364 ?auto_37365 ) ) ( not ( = ?auto_37364 ?auto_37366 ) ) ( not ( = ?auto_37365 ?auto_37366 ) ) ( not ( = ?auto_37364 ?auto_37369 ) ) ( not ( = ?auto_37364 ?auto_37367 ) ) ( not ( = ?auto_37365 ?auto_37369 ) ) ( not ( = ?auto_37365 ?auto_37367 ) ) ( not ( = ?auto_37366 ?auto_37369 ) ) ( not ( = ?auto_37366 ?auto_37367 ) ) ( not ( = ?auto_37369 ?auto_37367 ) ) ( ON ?auto_37369 ?auto_37366 ) ( not ( = ?auto_37368 ?auto_37367 ) ) ( not ( = ?auto_37364 ?auto_37368 ) ) ( not ( = ?auto_37365 ?auto_37368 ) ) ( not ( = ?auto_37366 ?auto_37368 ) ) ( not ( = ?auto_37369 ?auto_37368 ) ) ( ON ?auto_37367 ?auto_37369 ) ( ON ?auto_37368 ?auto_37367 ) ( CLEAR ?auto_37368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37364 ?auto_37365 ?auto_37366 ?auto_37369 ?auto_37367 )
      ( MAKE-2PILE ?auto_37364 ?auto_37365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37374 - BLOCK
      ?auto_37375 - BLOCK
      ?auto_37376 - BLOCK
      ?auto_37377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37377 ) ( CLEAR ?auto_37376 ) ( ON-TABLE ?auto_37374 ) ( ON ?auto_37375 ?auto_37374 ) ( ON ?auto_37376 ?auto_37375 ) ( not ( = ?auto_37374 ?auto_37375 ) ) ( not ( = ?auto_37374 ?auto_37376 ) ) ( not ( = ?auto_37374 ?auto_37377 ) ) ( not ( = ?auto_37375 ?auto_37376 ) ) ( not ( = ?auto_37375 ?auto_37377 ) ) ( not ( = ?auto_37376 ?auto_37377 ) ) )
    :subtasks
    ( ( !STACK ?auto_37377 ?auto_37376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37378 - BLOCK
      ?auto_37379 - BLOCK
      ?auto_37380 - BLOCK
      ?auto_37381 - BLOCK
    )
    :vars
    (
      ?auto_37382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37380 ) ( ON-TABLE ?auto_37378 ) ( ON ?auto_37379 ?auto_37378 ) ( ON ?auto_37380 ?auto_37379 ) ( not ( = ?auto_37378 ?auto_37379 ) ) ( not ( = ?auto_37378 ?auto_37380 ) ) ( not ( = ?auto_37378 ?auto_37381 ) ) ( not ( = ?auto_37379 ?auto_37380 ) ) ( not ( = ?auto_37379 ?auto_37381 ) ) ( not ( = ?auto_37380 ?auto_37381 ) ) ( ON ?auto_37381 ?auto_37382 ) ( CLEAR ?auto_37381 ) ( HAND-EMPTY ) ( not ( = ?auto_37378 ?auto_37382 ) ) ( not ( = ?auto_37379 ?auto_37382 ) ) ( not ( = ?auto_37380 ?auto_37382 ) ) ( not ( = ?auto_37381 ?auto_37382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37381 ?auto_37382 )
      ( MAKE-4PILE ?auto_37378 ?auto_37379 ?auto_37380 ?auto_37381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37383 - BLOCK
      ?auto_37384 - BLOCK
      ?auto_37385 - BLOCK
      ?auto_37386 - BLOCK
    )
    :vars
    (
      ?auto_37387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37383 ) ( ON ?auto_37384 ?auto_37383 ) ( not ( = ?auto_37383 ?auto_37384 ) ) ( not ( = ?auto_37383 ?auto_37385 ) ) ( not ( = ?auto_37383 ?auto_37386 ) ) ( not ( = ?auto_37384 ?auto_37385 ) ) ( not ( = ?auto_37384 ?auto_37386 ) ) ( not ( = ?auto_37385 ?auto_37386 ) ) ( ON ?auto_37386 ?auto_37387 ) ( CLEAR ?auto_37386 ) ( not ( = ?auto_37383 ?auto_37387 ) ) ( not ( = ?auto_37384 ?auto_37387 ) ) ( not ( = ?auto_37385 ?auto_37387 ) ) ( not ( = ?auto_37386 ?auto_37387 ) ) ( HOLDING ?auto_37385 ) ( CLEAR ?auto_37384 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37383 ?auto_37384 ?auto_37385 )
      ( MAKE-4PILE ?auto_37383 ?auto_37384 ?auto_37385 ?auto_37386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37388 - BLOCK
      ?auto_37389 - BLOCK
      ?auto_37390 - BLOCK
      ?auto_37391 - BLOCK
    )
    :vars
    (
      ?auto_37392 - BLOCK
      ?auto_37393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37388 ) ( ON ?auto_37389 ?auto_37388 ) ( not ( = ?auto_37388 ?auto_37389 ) ) ( not ( = ?auto_37388 ?auto_37390 ) ) ( not ( = ?auto_37388 ?auto_37391 ) ) ( not ( = ?auto_37389 ?auto_37390 ) ) ( not ( = ?auto_37389 ?auto_37391 ) ) ( not ( = ?auto_37390 ?auto_37391 ) ) ( ON ?auto_37391 ?auto_37392 ) ( not ( = ?auto_37388 ?auto_37392 ) ) ( not ( = ?auto_37389 ?auto_37392 ) ) ( not ( = ?auto_37390 ?auto_37392 ) ) ( not ( = ?auto_37391 ?auto_37392 ) ) ( CLEAR ?auto_37389 ) ( ON ?auto_37390 ?auto_37391 ) ( CLEAR ?auto_37390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37393 ) ( ON ?auto_37392 ?auto_37393 ) ( not ( = ?auto_37393 ?auto_37392 ) ) ( not ( = ?auto_37393 ?auto_37391 ) ) ( not ( = ?auto_37393 ?auto_37390 ) ) ( not ( = ?auto_37388 ?auto_37393 ) ) ( not ( = ?auto_37389 ?auto_37393 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37393 ?auto_37392 ?auto_37391 )
      ( MAKE-4PILE ?auto_37388 ?auto_37389 ?auto_37390 ?auto_37391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37394 - BLOCK
      ?auto_37395 - BLOCK
      ?auto_37396 - BLOCK
      ?auto_37397 - BLOCK
    )
    :vars
    (
      ?auto_37399 - BLOCK
      ?auto_37398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37394 ) ( not ( = ?auto_37394 ?auto_37395 ) ) ( not ( = ?auto_37394 ?auto_37396 ) ) ( not ( = ?auto_37394 ?auto_37397 ) ) ( not ( = ?auto_37395 ?auto_37396 ) ) ( not ( = ?auto_37395 ?auto_37397 ) ) ( not ( = ?auto_37396 ?auto_37397 ) ) ( ON ?auto_37397 ?auto_37399 ) ( not ( = ?auto_37394 ?auto_37399 ) ) ( not ( = ?auto_37395 ?auto_37399 ) ) ( not ( = ?auto_37396 ?auto_37399 ) ) ( not ( = ?auto_37397 ?auto_37399 ) ) ( ON ?auto_37396 ?auto_37397 ) ( CLEAR ?auto_37396 ) ( ON-TABLE ?auto_37398 ) ( ON ?auto_37399 ?auto_37398 ) ( not ( = ?auto_37398 ?auto_37399 ) ) ( not ( = ?auto_37398 ?auto_37397 ) ) ( not ( = ?auto_37398 ?auto_37396 ) ) ( not ( = ?auto_37394 ?auto_37398 ) ) ( not ( = ?auto_37395 ?auto_37398 ) ) ( HOLDING ?auto_37395 ) ( CLEAR ?auto_37394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37394 ?auto_37395 )
      ( MAKE-4PILE ?auto_37394 ?auto_37395 ?auto_37396 ?auto_37397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37400 - BLOCK
      ?auto_37401 - BLOCK
      ?auto_37402 - BLOCK
      ?auto_37403 - BLOCK
    )
    :vars
    (
      ?auto_37405 - BLOCK
      ?auto_37404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37400 ) ( not ( = ?auto_37400 ?auto_37401 ) ) ( not ( = ?auto_37400 ?auto_37402 ) ) ( not ( = ?auto_37400 ?auto_37403 ) ) ( not ( = ?auto_37401 ?auto_37402 ) ) ( not ( = ?auto_37401 ?auto_37403 ) ) ( not ( = ?auto_37402 ?auto_37403 ) ) ( ON ?auto_37403 ?auto_37405 ) ( not ( = ?auto_37400 ?auto_37405 ) ) ( not ( = ?auto_37401 ?auto_37405 ) ) ( not ( = ?auto_37402 ?auto_37405 ) ) ( not ( = ?auto_37403 ?auto_37405 ) ) ( ON ?auto_37402 ?auto_37403 ) ( ON-TABLE ?auto_37404 ) ( ON ?auto_37405 ?auto_37404 ) ( not ( = ?auto_37404 ?auto_37405 ) ) ( not ( = ?auto_37404 ?auto_37403 ) ) ( not ( = ?auto_37404 ?auto_37402 ) ) ( not ( = ?auto_37400 ?auto_37404 ) ) ( not ( = ?auto_37401 ?auto_37404 ) ) ( CLEAR ?auto_37400 ) ( ON ?auto_37401 ?auto_37402 ) ( CLEAR ?auto_37401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37404 ?auto_37405 ?auto_37403 ?auto_37402 )
      ( MAKE-4PILE ?auto_37400 ?auto_37401 ?auto_37402 ?auto_37403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37406 - BLOCK
      ?auto_37407 - BLOCK
      ?auto_37408 - BLOCK
      ?auto_37409 - BLOCK
    )
    :vars
    (
      ?auto_37410 - BLOCK
      ?auto_37411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37406 ?auto_37407 ) ) ( not ( = ?auto_37406 ?auto_37408 ) ) ( not ( = ?auto_37406 ?auto_37409 ) ) ( not ( = ?auto_37407 ?auto_37408 ) ) ( not ( = ?auto_37407 ?auto_37409 ) ) ( not ( = ?auto_37408 ?auto_37409 ) ) ( ON ?auto_37409 ?auto_37410 ) ( not ( = ?auto_37406 ?auto_37410 ) ) ( not ( = ?auto_37407 ?auto_37410 ) ) ( not ( = ?auto_37408 ?auto_37410 ) ) ( not ( = ?auto_37409 ?auto_37410 ) ) ( ON ?auto_37408 ?auto_37409 ) ( ON-TABLE ?auto_37411 ) ( ON ?auto_37410 ?auto_37411 ) ( not ( = ?auto_37411 ?auto_37410 ) ) ( not ( = ?auto_37411 ?auto_37409 ) ) ( not ( = ?auto_37411 ?auto_37408 ) ) ( not ( = ?auto_37406 ?auto_37411 ) ) ( not ( = ?auto_37407 ?auto_37411 ) ) ( ON ?auto_37407 ?auto_37408 ) ( CLEAR ?auto_37407 ) ( HOLDING ?auto_37406 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37406 )
      ( MAKE-4PILE ?auto_37406 ?auto_37407 ?auto_37408 ?auto_37409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37412 - BLOCK
      ?auto_37413 - BLOCK
      ?auto_37414 - BLOCK
      ?auto_37415 - BLOCK
    )
    :vars
    (
      ?auto_37417 - BLOCK
      ?auto_37416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37412 ?auto_37413 ) ) ( not ( = ?auto_37412 ?auto_37414 ) ) ( not ( = ?auto_37412 ?auto_37415 ) ) ( not ( = ?auto_37413 ?auto_37414 ) ) ( not ( = ?auto_37413 ?auto_37415 ) ) ( not ( = ?auto_37414 ?auto_37415 ) ) ( ON ?auto_37415 ?auto_37417 ) ( not ( = ?auto_37412 ?auto_37417 ) ) ( not ( = ?auto_37413 ?auto_37417 ) ) ( not ( = ?auto_37414 ?auto_37417 ) ) ( not ( = ?auto_37415 ?auto_37417 ) ) ( ON ?auto_37414 ?auto_37415 ) ( ON-TABLE ?auto_37416 ) ( ON ?auto_37417 ?auto_37416 ) ( not ( = ?auto_37416 ?auto_37417 ) ) ( not ( = ?auto_37416 ?auto_37415 ) ) ( not ( = ?auto_37416 ?auto_37414 ) ) ( not ( = ?auto_37412 ?auto_37416 ) ) ( not ( = ?auto_37413 ?auto_37416 ) ) ( ON ?auto_37413 ?auto_37414 ) ( ON ?auto_37412 ?auto_37413 ) ( CLEAR ?auto_37412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37416 ?auto_37417 ?auto_37415 ?auto_37414 ?auto_37413 )
      ( MAKE-4PILE ?auto_37412 ?auto_37413 ?auto_37414 ?auto_37415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37419 - BLOCK
    )
    :vars
    (
      ?auto_37420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37420 ?auto_37419 ) ( CLEAR ?auto_37420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37419 ) ( not ( = ?auto_37419 ?auto_37420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37420 ?auto_37419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37421 - BLOCK
    )
    :vars
    (
      ?auto_37422 - BLOCK
      ?auto_37423 - BLOCK
      ?auto_37424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37422 ?auto_37421 ) ( CLEAR ?auto_37422 ) ( ON-TABLE ?auto_37421 ) ( not ( = ?auto_37421 ?auto_37422 ) ) ( HOLDING ?auto_37423 ) ( CLEAR ?auto_37424 ) ( not ( = ?auto_37421 ?auto_37423 ) ) ( not ( = ?auto_37421 ?auto_37424 ) ) ( not ( = ?auto_37422 ?auto_37423 ) ) ( not ( = ?auto_37422 ?auto_37424 ) ) ( not ( = ?auto_37423 ?auto_37424 ) ) )
    :subtasks
    ( ( !STACK ?auto_37423 ?auto_37424 )
      ( MAKE-1PILE ?auto_37421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37425 - BLOCK
    )
    :vars
    (
      ?auto_37427 - BLOCK
      ?auto_37426 - BLOCK
      ?auto_37428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37427 ?auto_37425 ) ( ON-TABLE ?auto_37425 ) ( not ( = ?auto_37425 ?auto_37427 ) ) ( CLEAR ?auto_37426 ) ( not ( = ?auto_37425 ?auto_37428 ) ) ( not ( = ?auto_37425 ?auto_37426 ) ) ( not ( = ?auto_37427 ?auto_37428 ) ) ( not ( = ?auto_37427 ?auto_37426 ) ) ( not ( = ?auto_37428 ?auto_37426 ) ) ( ON ?auto_37428 ?auto_37427 ) ( CLEAR ?auto_37428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37425 ?auto_37427 )
      ( MAKE-1PILE ?auto_37425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37429 - BLOCK
    )
    :vars
    (
      ?auto_37431 - BLOCK
      ?auto_37432 - BLOCK
      ?auto_37430 - BLOCK
      ?auto_37433 - BLOCK
      ?auto_37434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37431 ?auto_37429 ) ( ON-TABLE ?auto_37429 ) ( not ( = ?auto_37429 ?auto_37431 ) ) ( not ( = ?auto_37429 ?auto_37432 ) ) ( not ( = ?auto_37429 ?auto_37430 ) ) ( not ( = ?auto_37431 ?auto_37432 ) ) ( not ( = ?auto_37431 ?auto_37430 ) ) ( not ( = ?auto_37432 ?auto_37430 ) ) ( ON ?auto_37432 ?auto_37431 ) ( CLEAR ?auto_37432 ) ( HOLDING ?auto_37430 ) ( CLEAR ?auto_37433 ) ( ON-TABLE ?auto_37434 ) ( ON ?auto_37433 ?auto_37434 ) ( not ( = ?auto_37434 ?auto_37433 ) ) ( not ( = ?auto_37434 ?auto_37430 ) ) ( not ( = ?auto_37433 ?auto_37430 ) ) ( not ( = ?auto_37429 ?auto_37433 ) ) ( not ( = ?auto_37429 ?auto_37434 ) ) ( not ( = ?auto_37431 ?auto_37433 ) ) ( not ( = ?auto_37431 ?auto_37434 ) ) ( not ( = ?auto_37432 ?auto_37433 ) ) ( not ( = ?auto_37432 ?auto_37434 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37434 ?auto_37433 ?auto_37430 )
      ( MAKE-1PILE ?auto_37429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37435 - BLOCK
    )
    :vars
    (
      ?auto_37437 - BLOCK
      ?auto_37438 - BLOCK
      ?auto_37436 - BLOCK
      ?auto_37440 - BLOCK
      ?auto_37439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37437 ?auto_37435 ) ( ON-TABLE ?auto_37435 ) ( not ( = ?auto_37435 ?auto_37437 ) ) ( not ( = ?auto_37435 ?auto_37438 ) ) ( not ( = ?auto_37435 ?auto_37436 ) ) ( not ( = ?auto_37437 ?auto_37438 ) ) ( not ( = ?auto_37437 ?auto_37436 ) ) ( not ( = ?auto_37438 ?auto_37436 ) ) ( ON ?auto_37438 ?auto_37437 ) ( CLEAR ?auto_37440 ) ( ON-TABLE ?auto_37439 ) ( ON ?auto_37440 ?auto_37439 ) ( not ( = ?auto_37439 ?auto_37440 ) ) ( not ( = ?auto_37439 ?auto_37436 ) ) ( not ( = ?auto_37440 ?auto_37436 ) ) ( not ( = ?auto_37435 ?auto_37440 ) ) ( not ( = ?auto_37435 ?auto_37439 ) ) ( not ( = ?auto_37437 ?auto_37440 ) ) ( not ( = ?auto_37437 ?auto_37439 ) ) ( not ( = ?auto_37438 ?auto_37440 ) ) ( not ( = ?auto_37438 ?auto_37439 ) ) ( ON ?auto_37436 ?auto_37438 ) ( CLEAR ?auto_37436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37435 ?auto_37437 ?auto_37438 )
      ( MAKE-1PILE ?auto_37435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37441 - BLOCK
    )
    :vars
    (
      ?auto_37445 - BLOCK
      ?auto_37446 - BLOCK
      ?auto_37442 - BLOCK
      ?auto_37443 - BLOCK
      ?auto_37444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37445 ?auto_37441 ) ( ON-TABLE ?auto_37441 ) ( not ( = ?auto_37441 ?auto_37445 ) ) ( not ( = ?auto_37441 ?auto_37446 ) ) ( not ( = ?auto_37441 ?auto_37442 ) ) ( not ( = ?auto_37445 ?auto_37446 ) ) ( not ( = ?auto_37445 ?auto_37442 ) ) ( not ( = ?auto_37446 ?auto_37442 ) ) ( ON ?auto_37446 ?auto_37445 ) ( ON-TABLE ?auto_37443 ) ( not ( = ?auto_37443 ?auto_37444 ) ) ( not ( = ?auto_37443 ?auto_37442 ) ) ( not ( = ?auto_37444 ?auto_37442 ) ) ( not ( = ?auto_37441 ?auto_37444 ) ) ( not ( = ?auto_37441 ?auto_37443 ) ) ( not ( = ?auto_37445 ?auto_37444 ) ) ( not ( = ?auto_37445 ?auto_37443 ) ) ( not ( = ?auto_37446 ?auto_37444 ) ) ( not ( = ?auto_37446 ?auto_37443 ) ) ( ON ?auto_37442 ?auto_37446 ) ( CLEAR ?auto_37442 ) ( HOLDING ?auto_37444 ) ( CLEAR ?auto_37443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37443 ?auto_37444 )
      ( MAKE-1PILE ?auto_37441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37447 - BLOCK
    )
    :vars
    (
      ?auto_37450 - BLOCK
      ?auto_37451 - BLOCK
      ?auto_37452 - BLOCK
      ?auto_37448 - BLOCK
      ?auto_37449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37450 ?auto_37447 ) ( ON-TABLE ?auto_37447 ) ( not ( = ?auto_37447 ?auto_37450 ) ) ( not ( = ?auto_37447 ?auto_37451 ) ) ( not ( = ?auto_37447 ?auto_37452 ) ) ( not ( = ?auto_37450 ?auto_37451 ) ) ( not ( = ?auto_37450 ?auto_37452 ) ) ( not ( = ?auto_37451 ?auto_37452 ) ) ( ON ?auto_37451 ?auto_37450 ) ( ON-TABLE ?auto_37448 ) ( not ( = ?auto_37448 ?auto_37449 ) ) ( not ( = ?auto_37448 ?auto_37452 ) ) ( not ( = ?auto_37449 ?auto_37452 ) ) ( not ( = ?auto_37447 ?auto_37449 ) ) ( not ( = ?auto_37447 ?auto_37448 ) ) ( not ( = ?auto_37450 ?auto_37449 ) ) ( not ( = ?auto_37450 ?auto_37448 ) ) ( not ( = ?auto_37451 ?auto_37449 ) ) ( not ( = ?auto_37451 ?auto_37448 ) ) ( ON ?auto_37452 ?auto_37451 ) ( CLEAR ?auto_37448 ) ( ON ?auto_37449 ?auto_37452 ) ( CLEAR ?auto_37449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37447 ?auto_37450 ?auto_37451 ?auto_37452 )
      ( MAKE-1PILE ?auto_37447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37453 - BLOCK
    )
    :vars
    (
      ?auto_37457 - BLOCK
      ?auto_37458 - BLOCK
      ?auto_37456 - BLOCK
      ?auto_37454 - BLOCK
      ?auto_37455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37457 ?auto_37453 ) ( ON-TABLE ?auto_37453 ) ( not ( = ?auto_37453 ?auto_37457 ) ) ( not ( = ?auto_37453 ?auto_37458 ) ) ( not ( = ?auto_37453 ?auto_37456 ) ) ( not ( = ?auto_37457 ?auto_37458 ) ) ( not ( = ?auto_37457 ?auto_37456 ) ) ( not ( = ?auto_37458 ?auto_37456 ) ) ( ON ?auto_37458 ?auto_37457 ) ( not ( = ?auto_37454 ?auto_37455 ) ) ( not ( = ?auto_37454 ?auto_37456 ) ) ( not ( = ?auto_37455 ?auto_37456 ) ) ( not ( = ?auto_37453 ?auto_37455 ) ) ( not ( = ?auto_37453 ?auto_37454 ) ) ( not ( = ?auto_37457 ?auto_37455 ) ) ( not ( = ?auto_37457 ?auto_37454 ) ) ( not ( = ?auto_37458 ?auto_37455 ) ) ( not ( = ?auto_37458 ?auto_37454 ) ) ( ON ?auto_37456 ?auto_37458 ) ( ON ?auto_37455 ?auto_37456 ) ( CLEAR ?auto_37455 ) ( HOLDING ?auto_37454 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37454 )
      ( MAKE-1PILE ?auto_37453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37459 - BLOCK
    )
    :vars
    (
      ?auto_37460 - BLOCK
      ?auto_37461 - BLOCK
      ?auto_37462 - BLOCK
      ?auto_37464 - BLOCK
      ?auto_37463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37460 ?auto_37459 ) ( ON-TABLE ?auto_37459 ) ( not ( = ?auto_37459 ?auto_37460 ) ) ( not ( = ?auto_37459 ?auto_37461 ) ) ( not ( = ?auto_37459 ?auto_37462 ) ) ( not ( = ?auto_37460 ?auto_37461 ) ) ( not ( = ?auto_37460 ?auto_37462 ) ) ( not ( = ?auto_37461 ?auto_37462 ) ) ( ON ?auto_37461 ?auto_37460 ) ( not ( = ?auto_37464 ?auto_37463 ) ) ( not ( = ?auto_37464 ?auto_37462 ) ) ( not ( = ?auto_37463 ?auto_37462 ) ) ( not ( = ?auto_37459 ?auto_37463 ) ) ( not ( = ?auto_37459 ?auto_37464 ) ) ( not ( = ?auto_37460 ?auto_37463 ) ) ( not ( = ?auto_37460 ?auto_37464 ) ) ( not ( = ?auto_37461 ?auto_37463 ) ) ( not ( = ?auto_37461 ?auto_37464 ) ) ( ON ?auto_37462 ?auto_37461 ) ( ON ?auto_37463 ?auto_37462 ) ( ON ?auto_37464 ?auto_37463 ) ( CLEAR ?auto_37464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37459 ?auto_37460 ?auto_37461 ?auto_37462 ?auto_37463 )
      ( MAKE-1PILE ?auto_37459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37470 - BLOCK
      ?auto_37471 - BLOCK
      ?auto_37472 - BLOCK
      ?auto_37473 - BLOCK
      ?auto_37474 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37474 ) ( CLEAR ?auto_37473 ) ( ON-TABLE ?auto_37470 ) ( ON ?auto_37471 ?auto_37470 ) ( ON ?auto_37472 ?auto_37471 ) ( ON ?auto_37473 ?auto_37472 ) ( not ( = ?auto_37470 ?auto_37471 ) ) ( not ( = ?auto_37470 ?auto_37472 ) ) ( not ( = ?auto_37470 ?auto_37473 ) ) ( not ( = ?auto_37470 ?auto_37474 ) ) ( not ( = ?auto_37471 ?auto_37472 ) ) ( not ( = ?auto_37471 ?auto_37473 ) ) ( not ( = ?auto_37471 ?auto_37474 ) ) ( not ( = ?auto_37472 ?auto_37473 ) ) ( not ( = ?auto_37472 ?auto_37474 ) ) ( not ( = ?auto_37473 ?auto_37474 ) ) )
    :subtasks
    ( ( !STACK ?auto_37474 ?auto_37473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37475 - BLOCK
      ?auto_37476 - BLOCK
      ?auto_37477 - BLOCK
      ?auto_37478 - BLOCK
      ?auto_37479 - BLOCK
    )
    :vars
    (
      ?auto_37480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37478 ) ( ON-TABLE ?auto_37475 ) ( ON ?auto_37476 ?auto_37475 ) ( ON ?auto_37477 ?auto_37476 ) ( ON ?auto_37478 ?auto_37477 ) ( not ( = ?auto_37475 ?auto_37476 ) ) ( not ( = ?auto_37475 ?auto_37477 ) ) ( not ( = ?auto_37475 ?auto_37478 ) ) ( not ( = ?auto_37475 ?auto_37479 ) ) ( not ( = ?auto_37476 ?auto_37477 ) ) ( not ( = ?auto_37476 ?auto_37478 ) ) ( not ( = ?auto_37476 ?auto_37479 ) ) ( not ( = ?auto_37477 ?auto_37478 ) ) ( not ( = ?auto_37477 ?auto_37479 ) ) ( not ( = ?auto_37478 ?auto_37479 ) ) ( ON ?auto_37479 ?auto_37480 ) ( CLEAR ?auto_37479 ) ( HAND-EMPTY ) ( not ( = ?auto_37475 ?auto_37480 ) ) ( not ( = ?auto_37476 ?auto_37480 ) ) ( not ( = ?auto_37477 ?auto_37480 ) ) ( not ( = ?auto_37478 ?auto_37480 ) ) ( not ( = ?auto_37479 ?auto_37480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37479 ?auto_37480 )
      ( MAKE-5PILE ?auto_37475 ?auto_37476 ?auto_37477 ?auto_37478 ?auto_37479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37481 - BLOCK
      ?auto_37482 - BLOCK
      ?auto_37483 - BLOCK
      ?auto_37484 - BLOCK
      ?auto_37485 - BLOCK
    )
    :vars
    (
      ?auto_37486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37481 ) ( ON ?auto_37482 ?auto_37481 ) ( ON ?auto_37483 ?auto_37482 ) ( not ( = ?auto_37481 ?auto_37482 ) ) ( not ( = ?auto_37481 ?auto_37483 ) ) ( not ( = ?auto_37481 ?auto_37484 ) ) ( not ( = ?auto_37481 ?auto_37485 ) ) ( not ( = ?auto_37482 ?auto_37483 ) ) ( not ( = ?auto_37482 ?auto_37484 ) ) ( not ( = ?auto_37482 ?auto_37485 ) ) ( not ( = ?auto_37483 ?auto_37484 ) ) ( not ( = ?auto_37483 ?auto_37485 ) ) ( not ( = ?auto_37484 ?auto_37485 ) ) ( ON ?auto_37485 ?auto_37486 ) ( CLEAR ?auto_37485 ) ( not ( = ?auto_37481 ?auto_37486 ) ) ( not ( = ?auto_37482 ?auto_37486 ) ) ( not ( = ?auto_37483 ?auto_37486 ) ) ( not ( = ?auto_37484 ?auto_37486 ) ) ( not ( = ?auto_37485 ?auto_37486 ) ) ( HOLDING ?auto_37484 ) ( CLEAR ?auto_37483 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37481 ?auto_37482 ?auto_37483 ?auto_37484 )
      ( MAKE-5PILE ?auto_37481 ?auto_37482 ?auto_37483 ?auto_37484 ?auto_37485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37487 - BLOCK
      ?auto_37488 - BLOCK
      ?auto_37489 - BLOCK
      ?auto_37490 - BLOCK
      ?auto_37491 - BLOCK
    )
    :vars
    (
      ?auto_37492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37487 ) ( ON ?auto_37488 ?auto_37487 ) ( ON ?auto_37489 ?auto_37488 ) ( not ( = ?auto_37487 ?auto_37488 ) ) ( not ( = ?auto_37487 ?auto_37489 ) ) ( not ( = ?auto_37487 ?auto_37490 ) ) ( not ( = ?auto_37487 ?auto_37491 ) ) ( not ( = ?auto_37488 ?auto_37489 ) ) ( not ( = ?auto_37488 ?auto_37490 ) ) ( not ( = ?auto_37488 ?auto_37491 ) ) ( not ( = ?auto_37489 ?auto_37490 ) ) ( not ( = ?auto_37489 ?auto_37491 ) ) ( not ( = ?auto_37490 ?auto_37491 ) ) ( ON ?auto_37491 ?auto_37492 ) ( not ( = ?auto_37487 ?auto_37492 ) ) ( not ( = ?auto_37488 ?auto_37492 ) ) ( not ( = ?auto_37489 ?auto_37492 ) ) ( not ( = ?auto_37490 ?auto_37492 ) ) ( not ( = ?auto_37491 ?auto_37492 ) ) ( CLEAR ?auto_37489 ) ( ON ?auto_37490 ?auto_37491 ) ( CLEAR ?auto_37490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37492 ?auto_37491 )
      ( MAKE-5PILE ?auto_37487 ?auto_37488 ?auto_37489 ?auto_37490 ?auto_37491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37493 - BLOCK
      ?auto_37494 - BLOCK
      ?auto_37495 - BLOCK
      ?auto_37496 - BLOCK
      ?auto_37497 - BLOCK
    )
    :vars
    (
      ?auto_37498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37493 ) ( ON ?auto_37494 ?auto_37493 ) ( not ( = ?auto_37493 ?auto_37494 ) ) ( not ( = ?auto_37493 ?auto_37495 ) ) ( not ( = ?auto_37493 ?auto_37496 ) ) ( not ( = ?auto_37493 ?auto_37497 ) ) ( not ( = ?auto_37494 ?auto_37495 ) ) ( not ( = ?auto_37494 ?auto_37496 ) ) ( not ( = ?auto_37494 ?auto_37497 ) ) ( not ( = ?auto_37495 ?auto_37496 ) ) ( not ( = ?auto_37495 ?auto_37497 ) ) ( not ( = ?auto_37496 ?auto_37497 ) ) ( ON ?auto_37497 ?auto_37498 ) ( not ( = ?auto_37493 ?auto_37498 ) ) ( not ( = ?auto_37494 ?auto_37498 ) ) ( not ( = ?auto_37495 ?auto_37498 ) ) ( not ( = ?auto_37496 ?auto_37498 ) ) ( not ( = ?auto_37497 ?auto_37498 ) ) ( ON ?auto_37496 ?auto_37497 ) ( CLEAR ?auto_37496 ) ( ON-TABLE ?auto_37498 ) ( HOLDING ?auto_37495 ) ( CLEAR ?auto_37494 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37493 ?auto_37494 ?auto_37495 )
      ( MAKE-5PILE ?auto_37493 ?auto_37494 ?auto_37495 ?auto_37496 ?auto_37497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37499 - BLOCK
      ?auto_37500 - BLOCK
      ?auto_37501 - BLOCK
      ?auto_37502 - BLOCK
      ?auto_37503 - BLOCK
    )
    :vars
    (
      ?auto_37504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37499 ) ( ON ?auto_37500 ?auto_37499 ) ( not ( = ?auto_37499 ?auto_37500 ) ) ( not ( = ?auto_37499 ?auto_37501 ) ) ( not ( = ?auto_37499 ?auto_37502 ) ) ( not ( = ?auto_37499 ?auto_37503 ) ) ( not ( = ?auto_37500 ?auto_37501 ) ) ( not ( = ?auto_37500 ?auto_37502 ) ) ( not ( = ?auto_37500 ?auto_37503 ) ) ( not ( = ?auto_37501 ?auto_37502 ) ) ( not ( = ?auto_37501 ?auto_37503 ) ) ( not ( = ?auto_37502 ?auto_37503 ) ) ( ON ?auto_37503 ?auto_37504 ) ( not ( = ?auto_37499 ?auto_37504 ) ) ( not ( = ?auto_37500 ?auto_37504 ) ) ( not ( = ?auto_37501 ?auto_37504 ) ) ( not ( = ?auto_37502 ?auto_37504 ) ) ( not ( = ?auto_37503 ?auto_37504 ) ) ( ON ?auto_37502 ?auto_37503 ) ( ON-TABLE ?auto_37504 ) ( CLEAR ?auto_37500 ) ( ON ?auto_37501 ?auto_37502 ) ( CLEAR ?auto_37501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37504 ?auto_37503 ?auto_37502 )
      ( MAKE-5PILE ?auto_37499 ?auto_37500 ?auto_37501 ?auto_37502 ?auto_37503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37505 - BLOCK
      ?auto_37506 - BLOCK
      ?auto_37507 - BLOCK
      ?auto_37508 - BLOCK
      ?auto_37509 - BLOCK
    )
    :vars
    (
      ?auto_37510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37505 ) ( not ( = ?auto_37505 ?auto_37506 ) ) ( not ( = ?auto_37505 ?auto_37507 ) ) ( not ( = ?auto_37505 ?auto_37508 ) ) ( not ( = ?auto_37505 ?auto_37509 ) ) ( not ( = ?auto_37506 ?auto_37507 ) ) ( not ( = ?auto_37506 ?auto_37508 ) ) ( not ( = ?auto_37506 ?auto_37509 ) ) ( not ( = ?auto_37507 ?auto_37508 ) ) ( not ( = ?auto_37507 ?auto_37509 ) ) ( not ( = ?auto_37508 ?auto_37509 ) ) ( ON ?auto_37509 ?auto_37510 ) ( not ( = ?auto_37505 ?auto_37510 ) ) ( not ( = ?auto_37506 ?auto_37510 ) ) ( not ( = ?auto_37507 ?auto_37510 ) ) ( not ( = ?auto_37508 ?auto_37510 ) ) ( not ( = ?auto_37509 ?auto_37510 ) ) ( ON ?auto_37508 ?auto_37509 ) ( ON-TABLE ?auto_37510 ) ( ON ?auto_37507 ?auto_37508 ) ( CLEAR ?auto_37507 ) ( HOLDING ?auto_37506 ) ( CLEAR ?auto_37505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37505 ?auto_37506 )
      ( MAKE-5PILE ?auto_37505 ?auto_37506 ?auto_37507 ?auto_37508 ?auto_37509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37511 - BLOCK
      ?auto_37512 - BLOCK
      ?auto_37513 - BLOCK
      ?auto_37514 - BLOCK
      ?auto_37515 - BLOCK
    )
    :vars
    (
      ?auto_37516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37511 ) ( not ( = ?auto_37511 ?auto_37512 ) ) ( not ( = ?auto_37511 ?auto_37513 ) ) ( not ( = ?auto_37511 ?auto_37514 ) ) ( not ( = ?auto_37511 ?auto_37515 ) ) ( not ( = ?auto_37512 ?auto_37513 ) ) ( not ( = ?auto_37512 ?auto_37514 ) ) ( not ( = ?auto_37512 ?auto_37515 ) ) ( not ( = ?auto_37513 ?auto_37514 ) ) ( not ( = ?auto_37513 ?auto_37515 ) ) ( not ( = ?auto_37514 ?auto_37515 ) ) ( ON ?auto_37515 ?auto_37516 ) ( not ( = ?auto_37511 ?auto_37516 ) ) ( not ( = ?auto_37512 ?auto_37516 ) ) ( not ( = ?auto_37513 ?auto_37516 ) ) ( not ( = ?auto_37514 ?auto_37516 ) ) ( not ( = ?auto_37515 ?auto_37516 ) ) ( ON ?auto_37514 ?auto_37515 ) ( ON-TABLE ?auto_37516 ) ( ON ?auto_37513 ?auto_37514 ) ( CLEAR ?auto_37511 ) ( ON ?auto_37512 ?auto_37513 ) ( CLEAR ?auto_37512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37516 ?auto_37515 ?auto_37514 ?auto_37513 )
      ( MAKE-5PILE ?auto_37511 ?auto_37512 ?auto_37513 ?auto_37514 ?auto_37515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37517 - BLOCK
      ?auto_37518 - BLOCK
      ?auto_37519 - BLOCK
      ?auto_37520 - BLOCK
      ?auto_37521 - BLOCK
    )
    :vars
    (
      ?auto_37522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37517 ?auto_37518 ) ) ( not ( = ?auto_37517 ?auto_37519 ) ) ( not ( = ?auto_37517 ?auto_37520 ) ) ( not ( = ?auto_37517 ?auto_37521 ) ) ( not ( = ?auto_37518 ?auto_37519 ) ) ( not ( = ?auto_37518 ?auto_37520 ) ) ( not ( = ?auto_37518 ?auto_37521 ) ) ( not ( = ?auto_37519 ?auto_37520 ) ) ( not ( = ?auto_37519 ?auto_37521 ) ) ( not ( = ?auto_37520 ?auto_37521 ) ) ( ON ?auto_37521 ?auto_37522 ) ( not ( = ?auto_37517 ?auto_37522 ) ) ( not ( = ?auto_37518 ?auto_37522 ) ) ( not ( = ?auto_37519 ?auto_37522 ) ) ( not ( = ?auto_37520 ?auto_37522 ) ) ( not ( = ?auto_37521 ?auto_37522 ) ) ( ON ?auto_37520 ?auto_37521 ) ( ON-TABLE ?auto_37522 ) ( ON ?auto_37519 ?auto_37520 ) ( ON ?auto_37518 ?auto_37519 ) ( CLEAR ?auto_37518 ) ( HOLDING ?auto_37517 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37517 )
      ( MAKE-5PILE ?auto_37517 ?auto_37518 ?auto_37519 ?auto_37520 ?auto_37521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37523 - BLOCK
      ?auto_37524 - BLOCK
      ?auto_37525 - BLOCK
      ?auto_37526 - BLOCK
      ?auto_37527 - BLOCK
    )
    :vars
    (
      ?auto_37528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37523 ?auto_37524 ) ) ( not ( = ?auto_37523 ?auto_37525 ) ) ( not ( = ?auto_37523 ?auto_37526 ) ) ( not ( = ?auto_37523 ?auto_37527 ) ) ( not ( = ?auto_37524 ?auto_37525 ) ) ( not ( = ?auto_37524 ?auto_37526 ) ) ( not ( = ?auto_37524 ?auto_37527 ) ) ( not ( = ?auto_37525 ?auto_37526 ) ) ( not ( = ?auto_37525 ?auto_37527 ) ) ( not ( = ?auto_37526 ?auto_37527 ) ) ( ON ?auto_37527 ?auto_37528 ) ( not ( = ?auto_37523 ?auto_37528 ) ) ( not ( = ?auto_37524 ?auto_37528 ) ) ( not ( = ?auto_37525 ?auto_37528 ) ) ( not ( = ?auto_37526 ?auto_37528 ) ) ( not ( = ?auto_37527 ?auto_37528 ) ) ( ON ?auto_37526 ?auto_37527 ) ( ON-TABLE ?auto_37528 ) ( ON ?auto_37525 ?auto_37526 ) ( ON ?auto_37524 ?auto_37525 ) ( ON ?auto_37523 ?auto_37524 ) ( CLEAR ?auto_37523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37528 ?auto_37527 ?auto_37526 ?auto_37525 ?auto_37524 )
      ( MAKE-5PILE ?auto_37523 ?auto_37524 ?auto_37525 ?auto_37526 ?auto_37527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37533 - BLOCK
      ?auto_37534 - BLOCK
      ?auto_37535 - BLOCK
      ?auto_37536 - BLOCK
    )
    :vars
    (
      ?auto_37537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37537 ?auto_37536 ) ( CLEAR ?auto_37537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37533 ) ( ON ?auto_37534 ?auto_37533 ) ( ON ?auto_37535 ?auto_37534 ) ( ON ?auto_37536 ?auto_37535 ) ( not ( = ?auto_37533 ?auto_37534 ) ) ( not ( = ?auto_37533 ?auto_37535 ) ) ( not ( = ?auto_37533 ?auto_37536 ) ) ( not ( = ?auto_37533 ?auto_37537 ) ) ( not ( = ?auto_37534 ?auto_37535 ) ) ( not ( = ?auto_37534 ?auto_37536 ) ) ( not ( = ?auto_37534 ?auto_37537 ) ) ( not ( = ?auto_37535 ?auto_37536 ) ) ( not ( = ?auto_37535 ?auto_37537 ) ) ( not ( = ?auto_37536 ?auto_37537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37537 ?auto_37536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37549 - BLOCK
      ?auto_37550 - BLOCK
      ?auto_37551 - BLOCK
      ?auto_37552 - BLOCK
    )
    :vars
    (
      ?auto_37553 - BLOCK
      ?auto_37554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37549 ) ( ON ?auto_37550 ?auto_37549 ) ( ON ?auto_37551 ?auto_37550 ) ( not ( = ?auto_37549 ?auto_37550 ) ) ( not ( = ?auto_37549 ?auto_37551 ) ) ( not ( = ?auto_37549 ?auto_37552 ) ) ( not ( = ?auto_37549 ?auto_37553 ) ) ( not ( = ?auto_37550 ?auto_37551 ) ) ( not ( = ?auto_37550 ?auto_37552 ) ) ( not ( = ?auto_37550 ?auto_37553 ) ) ( not ( = ?auto_37551 ?auto_37552 ) ) ( not ( = ?auto_37551 ?auto_37553 ) ) ( not ( = ?auto_37552 ?auto_37553 ) ) ( ON ?auto_37553 ?auto_37554 ) ( CLEAR ?auto_37553 ) ( not ( = ?auto_37549 ?auto_37554 ) ) ( not ( = ?auto_37550 ?auto_37554 ) ) ( not ( = ?auto_37551 ?auto_37554 ) ) ( not ( = ?auto_37552 ?auto_37554 ) ) ( not ( = ?auto_37553 ?auto_37554 ) ) ( HOLDING ?auto_37552 ) ( CLEAR ?auto_37551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37549 ?auto_37550 ?auto_37551 ?auto_37552 ?auto_37553 )
      ( MAKE-4PILE ?auto_37549 ?auto_37550 ?auto_37551 ?auto_37552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37555 - BLOCK
      ?auto_37556 - BLOCK
      ?auto_37557 - BLOCK
      ?auto_37558 - BLOCK
    )
    :vars
    (
      ?auto_37559 - BLOCK
      ?auto_37560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37555 ) ( ON ?auto_37556 ?auto_37555 ) ( ON ?auto_37557 ?auto_37556 ) ( not ( = ?auto_37555 ?auto_37556 ) ) ( not ( = ?auto_37555 ?auto_37557 ) ) ( not ( = ?auto_37555 ?auto_37558 ) ) ( not ( = ?auto_37555 ?auto_37559 ) ) ( not ( = ?auto_37556 ?auto_37557 ) ) ( not ( = ?auto_37556 ?auto_37558 ) ) ( not ( = ?auto_37556 ?auto_37559 ) ) ( not ( = ?auto_37557 ?auto_37558 ) ) ( not ( = ?auto_37557 ?auto_37559 ) ) ( not ( = ?auto_37558 ?auto_37559 ) ) ( ON ?auto_37559 ?auto_37560 ) ( not ( = ?auto_37555 ?auto_37560 ) ) ( not ( = ?auto_37556 ?auto_37560 ) ) ( not ( = ?auto_37557 ?auto_37560 ) ) ( not ( = ?auto_37558 ?auto_37560 ) ) ( not ( = ?auto_37559 ?auto_37560 ) ) ( CLEAR ?auto_37557 ) ( ON ?auto_37558 ?auto_37559 ) ( CLEAR ?auto_37558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37560 ?auto_37559 )
      ( MAKE-4PILE ?auto_37555 ?auto_37556 ?auto_37557 ?auto_37558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37561 - BLOCK
      ?auto_37562 - BLOCK
      ?auto_37563 - BLOCK
      ?auto_37564 - BLOCK
    )
    :vars
    (
      ?auto_37566 - BLOCK
      ?auto_37565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37561 ) ( ON ?auto_37562 ?auto_37561 ) ( not ( = ?auto_37561 ?auto_37562 ) ) ( not ( = ?auto_37561 ?auto_37563 ) ) ( not ( = ?auto_37561 ?auto_37564 ) ) ( not ( = ?auto_37561 ?auto_37566 ) ) ( not ( = ?auto_37562 ?auto_37563 ) ) ( not ( = ?auto_37562 ?auto_37564 ) ) ( not ( = ?auto_37562 ?auto_37566 ) ) ( not ( = ?auto_37563 ?auto_37564 ) ) ( not ( = ?auto_37563 ?auto_37566 ) ) ( not ( = ?auto_37564 ?auto_37566 ) ) ( ON ?auto_37566 ?auto_37565 ) ( not ( = ?auto_37561 ?auto_37565 ) ) ( not ( = ?auto_37562 ?auto_37565 ) ) ( not ( = ?auto_37563 ?auto_37565 ) ) ( not ( = ?auto_37564 ?auto_37565 ) ) ( not ( = ?auto_37566 ?auto_37565 ) ) ( ON ?auto_37564 ?auto_37566 ) ( CLEAR ?auto_37564 ) ( ON-TABLE ?auto_37565 ) ( HOLDING ?auto_37563 ) ( CLEAR ?auto_37562 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37561 ?auto_37562 ?auto_37563 )
      ( MAKE-4PILE ?auto_37561 ?auto_37562 ?auto_37563 ?auto_37564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37567 - BLOCK
      ?auto_37568 - BLOCK
      ?auto_37569 - BLOCK
      ?auto_37570 - BLOCK
    )
    :vars
    (
      ?auto_37572 - BLOCK
      ?auto_37571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37567 ) ( ON ?auto_37568 ?auto_37567 ) ( not ( = ?auto_37567 ?auto_37568 ) ) ( not ( = ?auto_37567 ?auto_37569 ) ) ( not ( = ?auto_37567 ?auto_37570 ) ) ( not ( = ?auto_37567 ?auto_37572 ) ) ( not ( = ?auto_37568 ?auto_37569 ) ) ( not ( = ?auto_37568 ?auto_37570 ) ) ( not ( = ?auto_37568 ?auto_37572 ) ) ( not ( = ?auto_37569 ?auto_37570 ) ) ( not ( = ?auto_37569 ?auto_37572 ) ) ( not ( = ?auto_37570 ?auto_37572 ) ) ( ON ?auto_37572 ?auto_37571 ) ( not ( = ?auto_37567 ?auto_37571 ) ) ( not ( = ?auto_37568 ?auto_37571 ) ) ( not ( = ?auto_37569 ?auto_37571 ) ) ( not ( = ?auto_37570 ?auto_37571 ) ) ( not ( = ?auto_37572 ?auto_37571 ) ) ( ON ?auto_37570 ?auto_37572 ) ( ON-TABLE ?auto_37571 ) ( CLEAR ?auto_37568 ) ( ON ?auto_37569 ?auto_37570 ) ( CLEAR ?auto_37569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37571 ?auto_37572 ?auto_37570 )
      ( MAKE-4PILE ?auto_37567 ?auto_37568 ?auto_37569 ?auto_37570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37573 - BLOCK
      ?auto_37574 - BLOCK
      ?auto_37575 - BLOCK
      ?auto_37576 - BLOCK
    )
    :vars
    (
      ?auto_37578 - BLOCK
      ?auto_37577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37573 ) ( not ( = ?auto_37573 ?auto_37574 ) ) ( not ( = ?auto_37573 ?auto_37575 ) ) ( not ( = ?auto_37573 ?auto_37576 ) ) ( not ( = ?auto_37573 ?auto_37578 ) ) ( not ( = ?auto_37574 ?auto_37575 ) ) ( not ( = ?auto_37574 ?auto_37576 ) ) ( not ( = ?auto_37574 ?auto_37578 ) ) ( not ( = ?auto_37575 ?auto_37576 ) ) ( not ( = ?auto_37575 ?auto_37578 ) ) ( not ( = ?auto_37576 ?auto_37578 ) ) ( ON ?auto_37578 ?auto_37577 ) ( not ( = ?auto_37573 ?auto_37577 ) ) ( not ( = ?auto_37574 ?auto_37577 ) ) ( not ( = ?auto_37575 ?auto_37577 ) ) ( not ( = ?auto_37576 ?auto_37577 ) ) ( not ( = ?auto_37578 ?auto_37577 ) ) ( ON ?auto_37576 ?auto_37578 ) ( ON-TABLE ?auto_37577 ) ( ON ?auto_37575 ?auto_37576 ) ( CLEAR ?auto_37575 ) ( HOLDING ?auto_37574 ) ( CLEAR ?auto_37573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37573 ?auto_37574 )
      ( MAKE-4PILE ?auto_37573 ?auto_37574 ?auto_37575 ?auto_37576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37579 - BLOCK
      ?auto_37580 - BLOCK
      ?auto_37581 - BLOCK
      ?auto_37582 - BLOCK
    )
    :vars
    (
      ?auto_37584 - BLOCK
      ?auto_37583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37579 ) ( not ( = ?auto_37579 ?auto_37580 ) ) ( not ( = ?auto_37579 ?auto_37581 ) ) ( not ( = ?auto_37579 ?auto_37582 ) ) ( not ( = ?auto_37579 ?auto_37584 ) ) ( not ( = ?auto_37580 ?auto_37581 ) ) ( not ( = ?auto_37580 ?auto_37582 ) ) ( not ( = ?auto_37580 ?auto_37584 ) ) ( not ( = ?auto_37581 ?auto_37582 ) ) ( not ( = ?auto_37581 ?auto_37584 ) ) ( not ( = ?auto_37582 ?auto_37584 ) ) ( ON ?auto_37584 ?auto_37583 ) ( not ( = ?auto_37579 ?auto_37583 ) ) ( not ( = ?auto_37580 ?auto_37583 ) ) ( not ( = ?auto_37581 ?auto_37583 ) ) ( not ( = ?auto_37582 ?auto_37583 ) ) ( not ( = ?auto_37584 ?auto_37583 ) ) ( ON ?auto_37582 ?auto_37584 ) ( ON-TABLE ?auto_37583 ) ( ON ?auto_37581 ?auto_37582 ) ( CLEAR ?auto_37579 ) ( ON ?auto_37580 ?auto_37581 ) ( CLEAR ?auto_37580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37583 ?auto_37584 ?auto_37582 ?auto_37581 )
      ( MAKE-4PILE ?auto_37579 ?auto_37580 ?auto_37581 ?auto_37582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37585 - BLOCK
      ?auto_37586 - BLOCK
      ?auto_37587 - BLOCK
      ?auto_37588 - BLOCK
    )
    :vars
    (
      ?auto_37589 - BLOCK
      ?auto_37590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37585 ?auto_37586 ) ) ( not ( = ?auto_37585 ?auto_37587 ) ) ( not ( = ?auto_37585 ?auto_37588 ) ) ( not ( = ?auto_37585 ?auto_37589 ) ) ( not ( = ?auto_37586 ?auto_37587 ) ) ( not ( = ?auto_37586 ?auto_37588 ) ) ( not ( = ?auto_37586 ?auto_37589 ) ) ( not ( = ?auto_37587 ?auto_37588 ) ) ( not ( = ?auto_37587 ?auto_37589 ) ) ( not ( = ?auto_37588 ?auto_37589 ) ) ( ON ?auto_37589 ?auto_37590 ) ( not ( = ?auto_37585 ?auto_37590 ) ) ( not ( = ?auto_37586 ?auto_37590 ) ) ( not ( = ?auto_37587 ?auto_37590 ) ) ( not ( = ?auto_37588 ?auto_37590 ) ) ( not ( = ?auto_37589 ?auto_37590 ) ) ( ON ?auto_37588 ?auto_37589 ) ( ON-TABLE ?auto_37590 ) ( ON ?auto_37587 ?auto_37588 ) ( ON ?auto_37586 ?auto_37587 ) ( CLEAR ?auto_37586 ) ( HOLDING ?auto_37585 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37585 )
      ( MAKE-4PILE ?auto_37585 ?auto_37586 ?auto_37587 ?auto_37588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37591 - BLOCK
      ?auto_37592 - BLOCK
      ?auto_37593 - BLOCK
      ?auto_37594 - BLOCK
    )
    :vars
    (
      ?auto_37596 - BLOCK
      ?auto_37595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37591 ?auto_37592 ) ) ( not ( = ?auto_37591 ?auto_37593 ) ) ( not ( = ?auto_37591 ?auto_37594 ) ) ( not ( = ?auto_37591 ?auto_37596 ) ) ( not ( = ?auto_37592 ?auto_37593 ) ) ( not ( = ?auto_37592 ?auto_37594 ) ) ( not ( = ?auto_37592 ?auto_37596 ) ) ( not ( = ?auto_37593 ?auto_37594 ) ) ( not ( = ?auto_37593 ?auto_37596 ) ) ( not ( = ?auto_37594 ?auto_37596 ) ) ( ON ?auto_37596 ?auto_37595 ) ( not ( = ?auto_37591 ?auto_37595 ) ) ( not ( = ?auto_37592 ?auto_37595 ) ) ( not ( = ?auto_37593 ?auto_37595 ) ) ( not ( = ?auto_37594 ?auto_37595 ) ) ( not ( = ?auto_37596 ?auto_37595 ) ) ( ON ?auto_37594 ?auto_37596 ) ( ON-TABLE ?auto_37595 ) ( ON ?auto_37593 ?auto_37594 ) ( ON ?auto_37592 ?auto_37593 ) ( ON ?auto_37591 ?auto_37592 ) ( CLEAR ?auto_37591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37595 ?auto_37596 ?auto_37594 ?auto_37593 ?auto_37592 )
      ( MAKE-4PILE ?auto_37591 ?auto_37592 ?auto_37593 ?auto_37594 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37598 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37599 - BLOCK
    )
    :vars
    (
      ?auto_37600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37599 ?auto_37600 ) ( CLEAR ?auto_37599 ) ( HAND-EMPTY ) ( not ( = ?auto_37599 ?auto_37600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37599 ?auto_37600 )
      ( MAKE-1PILE ?auto_37599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37601 - BLOCK
    )
    :vars
    (
      ?auto_37602 - BLOCK
      ?auto_37604 - BLOCK
      ?auto_37603 - BLOCK
      ?auto_37605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37601 ?auto_37602 ) ) ( HOLDING ?auto_37601 ) ( CLEAR ?auto_37602 ) ( ON-TABLE ?auto_37604 ) ( ON ?auto_37603 ?auto_37604 ) ( ON ?auto_37605 ?auto_37603 ) ( ON ?auto_37602 ?auto_37605 ) ( not ( = ?auto_37604 ?auto_37603 ) ) ( not ( = ?auto_37604 ?auto_37605 ) ) ( not ( = ?auto_37604 ?auto_37602 ) ) ( not ( = ?auto_37604 ?auto_37601 ) ) ( not ( = ?auto_37603 ?auto_37605 ) ) ( not ( = ?auto_37603 ?auto_37602 ) ) ( not ( = ?auto_37603 ?auto_37601 ) ) ( not ( = ?auto_37605 ?auto_37602 ) ) ( not ( = ?auto_37605 ?auto_37601 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37604 ?auto_37603 ?auto_37605 ?auto_37602 ?auto_37601 )
      ( MAKE-1PILE ?auto_37601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37606 - BLOCK
    )
    :vars
    (
      ?auto_37607 - BLOCK
      ?auto_37608 - BLOCK
      ?auto_37610 - BLOCK
      ?auto_37609 - BLOCK
      ?auto_37611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37606 ?auto_37607 ) ) ( CLEAR ?auto_37607 ) ( ON-TABLE ?auto_37608 ) ( ON ?auto_37610 ?auto_37608 ) ( ON ?auto_37609 ?auto_37610 ) ( ON ?auto_37607 ?auto_37609 ) ( not ( = ?auto_37608 ?auto_37610 ) ) ( not ( = ?auto_37608 ?auto_37609 ) ) ( not ( = ?auto_37608 ?auto_37607 ) ) ( not ( = ?auto_37608 ?auto_37606 ) ) ( not ( = ?auto_37610 ?auto_37609 ) ) ( not ( = ?auto_37610 ?auto_37607 ) ) ( not ( = ?auto_37610 ?auto_37606 ) ) ( not ( = ?auto_37609 ?auto_37607 ) ) ( not ( = ?auto_37609 ?auto_37606 ) ) ( ON ?auto_37606 ?auto_37611 ) ( CLEAR ?auto_37606 ) ( HAND-EMPTY ) ( not ( = ?auto_37606 ?auto_37611 ) ) ( not ( = ?auto_37607 ?auto_37611 ) ) ( not ( = ?auto_37608 ?auto_37611 ) ) ( not ( = ?auto_37610 ?auto_37611 ) ) ( not ( = ?auto_37609 ?auto_37611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37606 ?auto_37611 )
      ( MAKE-1PILE ?auto_37606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37612 - BLOCK
    )
    :vars
    (
      ?auto_37615 - BLOCK
      ?auto_37613 - BLOCK
      ?auto_37614 - BLOCK
      ?auto_37616 - BLOCK
      ?auto_37617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37612 ?auto_37615 ) ) ( ON-TABLE ?auto_37613 ) ( ON ?auto_37614 ?auto_37613 ) ( ON ?auto_37616 ?auto_37614 ) ( not ( = ?auto_37613 ?auto_37614 ) ) ( not ( = ?auto_37613 ?auto_37616 ) ) ( not ( = ?auto_37613 ?auto_37615 ) ) ( not ( = ?auto_37613 ?auto_37612 ) ) ( not ( = ?auto_37614 ?auto_37616 ) ) ( not ( = ?auto_37614 ?auto_37615 ) ) ( not ( = ?auto_37614 ?auto_37612 ) ) ( not ( = ?auto_37616 ?auto_37615 ) ) ( not ( = ?auto_37616 ?auto_37612 ) ) ( ON ?auto_37612 ?auto_37617 ) ( CLEAR ?auto_37612 ) ( not ( = ?auto_37612 ?auto_37617 ) ) ( not ( = ?auto_37615 ?auto_37617 ) ) ( not ( = ?auto_37613 ?auto_37617 ) ) ( not ( = ?auto_37614 ?auto_37617 ) ) ( not ( = ?auto_37616 ?auto_37617 ) ) ( HOLDING ?auto_37615 ) ( CLEAR ?auto_37616 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37613 ?auto_37614 ?auto_37616 ?auto_37615 )
      ( MAKE-1PILE ?auto_37612 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37618 - BLOCK
    )
    :vars
    (
      ?auto_37622 - BLOCK
      ?auto_37620 - BLOCK
      ?auto_37619 - BLOCK
      ?auto_37623 - BLOCK
      ?auto_37621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37618 ?auto_37622 ) ) ( ON-TABLE ?auto_37620 ) ( ON ?auto_37619 ?auto_37620 ) ( ON ?auto_37623 ?auto_37619 ) ( not ( = ?auto_37620 ?auto_37619 ) ) ( not ( = ?auto_37620 ?auto_37623 ) ) ( not ( = ?auto_37620 ?auto_37622 ) ) ( not ( = ?auto_37620 ?auto_37618 ) ) ( not ( = ?auto_37619 ?auto_37623 ) ) ( not ( = ?auto_37619 ?auto_37622 ) ) ( not ( = ?auto_37619 ?auto_37618 ) ) ( not ( = ?auto_37623 ?auto_37622 ) ) ( not ( = ?auto_37623 ?auto_37618 ) ) ( ON ?auto_37618 ?auto_37621 ) ( not ( = ?auto_37618 ?auto_37621 ) ) ( not ( = ?auto_37622 ?auto_37621 ) ) ( not ( = ?auto_37620 ?auto_37621 ) ) ( not ( = ?auto_37619 ?auto_37621 ) ) ( not ( = ?auto_37623 ?auto_37621 ) ) ( CLEAR ?auto_37623 ) ( ON ?auto_37622 ?auto_37618 ) ( CLEAR ?auto_37622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37621 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37621 ?auto_37618 )
      ( MAKE-1PILE ?auto_37618 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37624 - BLOCK
    )
    :vars
    (
      ?auto_37627 - BLOCK
      ?auto_37629 - BLOCK
      ?auto_37628 - BLOCK
      ?auto_37625 - BLOCK
      ?auto_37626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37624 ?auto_37627 ) ) ( ON-TABLE ?auto_37629 ) ( ON ?auto_37628 ?auto_37629 ) ( not ( = ?auto_37629 ?auto_37628 ) ) ( not ( = ?auto_37629 ?auto_37625 ) ) ( not ( = ?auto_37629 ?auto_37627 ) ) ( not ( = ?auto_37629 ?auto_37624 ) ) ( not ( = ?auto_37628 ?auto_37625 ) ) ( not ( = ?auto_37628 ?auto_37627 ) ) ( not ( = ?auto_37628 ?auto_37624 ) ) ( not ( = ?auto_37625 ?auto_37627 ) ) ( not ( = ?auto_37625 ?auto_37624 ) ) ( ON ?auto_37624 ?auto_37626 ) ( not ( = ?auto_37624 ?auto_37626 ) ) ( not ( = ?auto_37627 ?auto_37626 ) ) ( not ( = ?auto_37629 ?auto_37626 ) ) ( not ( = ?auto_37628 ?auto_37626 ) ) ( not ( = ?auto_37625 ?auto_37626 ) ) ( ON ?auto_37627 ?auto_37624 ) ( CLEAR ?auto_37627 ) ( ON-TABLE ?auto_37626 ) ( HOLDING ?auto_37625 ) ( CLEAR ?auto_37628 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37629 ?auto_37628 ?auto_37625 )
      ( MAKE-1PILE ?auto_37624 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37630 - BLOCK
    )
    :vars
    (
      ?auto_37631 - BLOCK
      ?auto_37635 - BLOCK
      ?auto_37634 - BLOCK
      ?auto_37632 - BLOCK
      ?auto_37633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37630 ?auto_37631 ) ) ( ON-TABLE ?auto_37635 ) ( ON ?auto_37634 ?auto_37635 ) ( not ( = ?auto_37635 ?auto_37634 ) ) ( not ( = ?auto_37635 ?auto_37632 ) ) ( not ( = ?auto_37635 ?auto_37631 ) ) ( not ( = ?auto_37635 ?auto_37630 ) ) ( not ( = ?auto_37634 ?auto_37632 ) ) ( not ( = ?auto_37634 ?auto_37631 ) ) ( not ( = ?auto_37634 ?auto_37630 ) ) ( not ( = ?auto_37632 ?auto_37631 ) ) ( not ( = ?auto_37632 ?auto_37630 ) ) ( ON ?auto_37630 ?auto_37633 ) ( not ( = ?auto_37630 ?auto_37633 ) ) ( not ( = ?auto_37631 ?auto_37633 ) ) ( not ( = ?auto_37635 ?auto_37633 ) ) ( not ( = ?auto_37634 ?auto_37633 ) ) ( not ( = ?auto_37632 ?auto_37633 ) ) ( ON ?auto_37631 ?auto_37630 ) ( ON-TABLE ?auto_37633 ) ( CLEAR ?auto_37634 ) ( ON ?auto_37632 ?auto_37631 ) ( CLEAR ?auto_37632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37633 ?auto_37630 ?auto_37631 )
      ( MAKE-1PILE ?auto_37630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37636 - BLOCK
    )
    :vars
    (
      ?auto_37641 - BLOCK
      ?auto_37640 - BLOCK
      ?auto_37639 - BLOCK
      ?auto_37638 - BLOCK
      ?auto_37637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37636 ?auto_37641 ) ) ( ON-TABLE ?auto_37640 ) ( not ( = ?auto_37640 ?auto_37639 ) ) ( not ( = ?auto_37640 ?auto_37638 ) ) ( not ( = ?auto_37640 ?auto_37641 ) ) ( not ( = ?auto_37640 ?auto_37636 ) ) ( not ( = ?auto_37639 ?auto_37638 ) ) ( not ( = ?auto_37639 ?auto_37641 ) ) ( not ( = ?auto_37639 ?auto_37636 ) ) ( not ( = ?auto_37638 ?auto_37641 ) ) ( not ( = ?auto_37638 ?auto_37636 ) ) ( ON ?auto_37636 ?auto_37637 ) ( not ( = ?auto_37636 ?auto_37637 ) ) ( not ( = ?auto_37641 ?auto_37637 ) ) ( not ( = ?auto_37640 ?auto_37637 ) ) ( not ( = ?auto_37639 ?auto_37637 ) ) ( not ( = ?auto_37638 ?auto_37637 ) ) ( ON ?auto_37641 ?auto_37636 ) ( ON-TABLE ?auto_37637 ) ( ON ?auto_37638 ?auto_37641 ) ( CLEAR ?auto_37638 ) ( HOLDING ?auto_37639 ) ( CLEAR ?auto_37640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37640 ?auto_37639 )
      ( MAKE-1PILE ?auto_37636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37642 - BLOCK
    )
    :vars
    (
      ?auto_37644 - BLOCK
      ?auto_37646 - BLOCK
      ?auto_37647 - BLOCK
      ?auto_37645 - BLOCK
      ?auto_37643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37642 ?auto_37644 ) ) ( ON-TABLE ?auto_37646 ) ( not ( = ?auto_37646 ?auto_37647 ) ) ( not ( = ?auto_37646 ?auto_37645 ) ) ( not ( = ?auto_37646 ?auto_37644 ) ) ( not ( = ?auto_37646 ?auto_37642 ) ) ( not ( = ?auto_37647 ?auto_37645 ) ) ( not ( = ?auto_37647 ?auto_37644 ) ) ( not ( = ?auto_37647 ?auto_37642 ) ) ( not ( = ?auto_37645 ?auto_37644 ) ) ( not ( = ?auto_37645 ?auto_37642 ) ) ( ON ?auto_37642 ?auto_37643 ) ( not ( = ?auto_37642 ?auto_37643 ) ) ( not ( = ?auto_37644 ?auto_37643 ) ) ( not ( = ?auto_37646 ?auto_37643 ) ) ( not ( = ?auto_37647 ?auto_37643 ) ) ( not ( = ?auto_37645 ?auto_37643 ) ) ( ON ?auto_37644 ?auto_37642 ) ( ON-TABLE ?auto_37643 ) ( ON ?auto_37645 ?auto_37644 ) ( CLEAR ?auto_37646 ) ( ON ?auto_37647 ?auto_37645 ) ( CLEAR ?auto_37647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37643 ?auto_37642 ?auto_37644 ?auto_37645 )
      ( MAKE-1PILE ?auto_37642 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37648 - BLOCK
    )
    :vars
    (
      ?auto_37650 - BLOCK
      ?auto_37651 - BLOCK
      ?auto_37653 - BLOCK
      ?auto_37649 - BLOCK
      ?auto_37652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37648 ?auto_37650 ) ) ( not ( = ?auto_37651 ?auto_37653 ) ) ( not ( = ?auto_37651 ?auto_37649 ) ) ( not ( = ?auto_37651 ?auto_37650 ) ) ( not ( = ?auto_37651 ?auto_37648 ) ) ( not ( = ?auto_37653 ?auto_37649 ) ) ( not ( = ?auto_37653 ?auto_37650 ) ) ( not ( = ?auto_37653 ?auto_37648 ) ) ( not ( = ?auto_37649 ?auto_37650 ) ) ( not ( = ?auto_37649 ?auto_37648 ) ) ( ON ?auto_37648 ?auto_37652 ) ( not ( = ?auto_37648 ?auto_37652 ) ) ( not ( = ?auto_37650 ?auto_37652 ) ) ( not ( = ?auto_37651 ?auto_37652 ) ) ( not ( = ?auto_37653 ?auto_37652 ) ) ( not ( = ?auto_37649 ?auto_37652 ) ) ( ON ?auto_37650 ?auto_37648 ) ( ON-TABLE ?auto_37652 ) ( ON ?auto_37649 ?auto_37650 ) ( ON ?auto_37653 ?auto_37649 ) ( CLEAR ?auto_37653 ) ( HOLDING ?auto_37651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37651 )
      ( MAKE-1PILE ?auto_37648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37654 - BLOCK
    )
    :vars
    (
      ?auto_37655 - BLOCK
      ?auto_37656 - BLOCK
      ?auto_37658 - BLOCK
      ?auto_37659 - BLOCK
      ?auto_37657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37654 ?auto_37655 ) ) ( not ( = ?auto_37656 ?auto_37658 ) ) ( not ( = ?auto_37656 ?auto_37659 ) ) ( not ( = ?auto_37656 ?auto_37655 ) ) ( not ( = ?auto_37656 ?auto_37654 ) ) ( not ( = ?auto_37658 ?auto_37659 ) ) ( not ( = ?auto_37658 ?auto_37655 ) ) ( not ( = ?auto_37658 ?auto_37654 ) ) ( not ( = ?auto_37659 ?auto_37655 ) ) ( not ( = ?auto_37659 ?auto_37654 ) ) ( ON ?auto_37654 ?auto_37657 ) ( not ( = ?auto_37654 ?auto_37657 ) ) ( not ( = ?auto_37655 ?auto_37657 ) ) ( not ( = ?auto_37656 ?auto_37657 ) ) ( not ( = ?auto_37658 ?auto_37657 ) ) ( not ( = ?auto_37659 ?auto_37657 ) ) ( ON ?auto_37655 ?auto_37654 ) ( ON-TABLE ?auto_37657 ) ( ON ?auto_37659 ?auto_37655 ) ( ON ?auto_37658 ?auto_37659 ) ( ON ?auto_37656 ?auto_37658 ) ( CLEAR ?auto_37656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37657 ?auto_37654 ?auto_37655 ?auto_37659 ?auto_37658 )
      ( MAKE-1PILE ?auto_37654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37663 - BLOCK
      ?auto_37664 - BLOCK
      ?auto_37665 - BLOCK
    )
    :vars
    (
      ?auto_37666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37666 ?auto_37665 ) ( CLEAR ?auto_37666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37663 ) ( ON ?auto_37664 ?auto_37663 ) ( ON ?auto_37665 ?auto_37664 ) ( not ( = ?auto_37663 ?auto_37664 ) ) ( not ( = ?auto_37663 ?auto_37665 ) ) ( not ( = ?auto_37663 ?auto_37666 ) ) ( not ( = ?auto_37664 ?auto_37665 ) ) ( not ( = ?auto_37664 ?auto_37666 ) ) ( not ( = ?auto_37665 ?auto_37666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37666 ?auto_37665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37667 - BLOCK
      ?auto_37668 - BLOCK
      ?auto_37669 - BLOCK
    )
    :vars
    (
      ?auto_37670 - BLOCK
      ?auto_37671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37670 ?auto_37669 ) ( CLEAR ?auto_37670 ) ( ON-TABLE ?auto_37667 ) ( ON ?auto_37668 ?auto_37667 ) ( ON ?auto_37669 ?auto_37668 ) ( not ( = ?auto_37667 ?auto_37668 ) ) ( not ( = ?auto_37667 ?auto_37669 ) ) ( not ( = ?auto_37667 ?auto_37670 ) ) ( not ( = ?auto_37668 ?auto_37669 ) ) ( not ( = ?auto_37668 ?auto_37670 ) ) ( not ( = ?auto_37669 ?auto_37670 ) ) ( HOLDING ?auto_37671 ) ( not ( = ?auto_37667 ?auto_37671 ) ) ( not ( = ?auto_37668 ?auto_37671 ) ) ( not ( = ?auto_37669 ?auto_37671 ) ) ( not ( = ?auto_37670 ?auto_37671 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37671 )
      ( MAKE-3PILE ?auto_37667 ?auto_37668 ?auto_37669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37672 - BLOCK
      ?auto_37673 - BLOCK
      ?auto_37674 - BLOCK
    )
    :vars
    (
      ?auto_37675 - BLOCK
      ?auto_37676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37675 ?auto_37674 ) ( ON-TABLE ?auto_37672 ) ( ON ?auto_37673 ?auto_37672 ) ( ON ?auto_37674 ?auto_37673 ) ( not ( = ?auto_37672 ?auto_37673 ) ) ( not ( = ?auto_37672 ?auto_37674 ) ) ( not ( = ?auto_37672 ?auto_37675 ) ) ( not ( = ?auto_37673 ?auto_37674 ) ) ( not ( = ?auto_37673 ?auto_37675 ) ) ( not ( = ?auto_37674 ?auto_37675 ) ) ( not ( = ?auto_37672 ?auto_37676 ) ) ( not ( = ?auto_37673 ?auto_37676 ) ) ( not ( = ?auto_37674 ?auto_37676 ) ) ( not ( = ?auto_37675 ?auto_37676 ) ) ( ON ?auto_37676 ?auto_37675 ) ( CLEAR ?auto_37676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37672 ?auto_37673 ?auto_37674 ?auto_37675 )
      ( MAKE-3PILE ?auto_37672 ?auto_37673 ?auto_37674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37677 - BLOCK
      ?auto_37678 - BLOCK
      ?auto_37679 - BLOCK
    )
    :vars
    (
      ?auto_37681 - BLOCK
      ?auto_37680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37681 ?auto_37679 ) ( ON-TABLE ?auto_37677 ) ( ON ?auto_37678 ?auto_37677 ) ( ON ?auto_37679 ?auto_37678 ) ( not ( = ?auto_37677 ?auto_37678 ) ) ( not ( = ?auto_37677 ?auto_37679 ) ) ( not ( = ?auto_37677 ?auto_37681 ) ) ( not ( = ?auto_37678 ?auto_37679 ) ) ( not ( = ?auto_37678 ?auto_37681 ) ) ( not ( = ?auto_37679 ?auto_37681 ) ) ( not ( = ?auto_37677 ?auto_37680 ) ) ( not ( = ?auto_37678 ?auto_37680 ) ) ( not ( = ?auto_37679 ?auto_37680 ) ) ( not ( = ?auto_37681 ?auto_37680 ) ) ( HOLDING ?auto_37680 ) ( CLEAR ?auto_37681 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37677 ?auto_37678 ?auto_37679 ?auto_37681 ?auto_37680 )
      ( MAKE-3PILE ?auto_37677 ?auto_37678 ?auto_37679 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37682 - BLOCK
      ?auto_37683 - BLOCK
      ?auto_37684 - BLOCK
    )
    :vars
    (
      ?auto_37685 - BLOCK
      ?auto_37686 - BLOCK
      ?auto_37687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37685 ?auto_37684 ) ( ON-TABLE ?auto_37682 ) ( ON ?auto_37683 ?auto_37682 ) ( ON ?auto_37684 ?auto_37683 ) ( not ( = ?auto_37682 ?auto_37683 ) ) ( not ( = ?auto_37682 ?auto_37684 ) ) ( not ( = ?auto_37682 ?auto_37685 ) ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37685 ) ) ( not ( = ?auto_37684 ?auto_37685 ) ) ( not ( = ?auto_37682 ?auto_37686 ) ) ( not ( = ?auto_37683 ?auto_37686 ) ) ( not ( = ?auto_37684 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( CLEAR ?auto_37685 ) ( ON ?auto_37686 ?auto_37687 ) ( CLEAR ?auto_37686 ) ( HAND-EMPTY ) ( not ( = ?auto_37682 ?auto_37687 ) ) ( not ( = ?auto_37683 ?auto_37687 ) ) ( not ( = ?auto_37684 ?auto_37687 ) ) ( not ( = ?auto_37685 ?auto_37687 ) ) ( not ( = ?auto_37686 ?auto_37687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37686 ?auto_37687 )
      ( MAKE-3PILE ?auto_37682 ?auto_37683 ?auto_37684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37700 - BLOCK
      ?auto_37701 - BLOCK
      ?auto_37702 - BLOCK
    )
    :vars
    (
      ?auto_37704 - BLOCK
      ?auto_37705 - BLOCK
      ?auto_37703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37700 ) ( ON ?auto_37701 ?auto_37700 ) ( not ( = ?auto_37700 ?auto_37701 ) ) ( not ( = ?auto_37700 ?auto_37702 ) ) ( not ( = ?auto_37700 ?auto_37704 ) ) ( not ( = ?auto_37701 ?auto_37702 ) ) ( not ( = ?auto_37701 ?auto_37704 ) ) ( not ( = ?auto_37702 ?auto_37704 ) ) ( not ( = ?auto_37700 ?auto_37705 ) ) ( not ( = ?auto_37701 ?auto_37705 ) ) ( not ( = ?auto_37702 ?auto_37705 ) ) ( not ( = ?auto_37704 ?auto_37705 ) ) ( ON ?auto_37705 ?auto_37703 ) ( not ( = ?auto_37700 ?auto_37703 ) ) ( not ( = ?auto_37701 ?auto_37703 ) ) ( not ( = ?auto_37702 ?auto_37703 ) ) ( not ( = ?auto_37704 ?auto_37703 ) ) ( not ( = ?auto_37705 ?auto_37703 ) ) ( ON ?auto_37704 ?auto_37705 ) ( CLEAR ?auto_37704 ) ( HOLDING ?auto_37702 ) ( CLEAR ?auto_37701 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37700 ?auto_37701 ?auto_37702 ?auto_37704 )
      ( MAKE-3PILE ?auto_37700 ?auto_37701 ?auto_37702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37706 - BLOCK
      ?auto_37707 - BLOCK
      ?auto_37708 - BLOCK
    )
    :vars
    (
      ?auto_37709 - BLOCK
      ?auto_37711 - BLOCK
      ?auto_37710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37706 ) ( ON ?auto_37707 ?auto_37706 ) ( not ( = ?auto_37706 ?auto_37707 ) ) ( not ( = ?auto_37706 ?auto_37708 ) ) ( not ( = ?auto_37706 ?auto_37709 ) ) ( not ( = ?auto_37707 ?auto_37708 ) ) ( not ( = ?auto_37707 ?auto_37709 ) ) ( not ( = ?auto_37708 ?auto_37709 ) ) ( not ( = ?auto_37706 ?auto_37711 ) ) ( not ( = ?auto_37707 ?auto_37711 ) ) ( not ( = ?auto_37708 ?auto_37711 ) ) ( not ( = ?auto_37709 ?auto_37711 ) ) ( ON ?auto_37711 ?auto_37710 ) ( not ( = ?auto_37706 ?auto_37710 ) ) ( not ( = ?auto_37707 ?auto_37710 ) ) ( not ( = ?auto_37708 ?auto_37710 ) ) ( not ( = ?auto_37709 ?auto_37710 ) ) ( not ( = ?auto_37711 ?auto_37710 ) ) ( ON ?auto_37709 ?auto_37711 ) ( CLEAR ?auto_37707 ) ( ON ?auto_37708 ?auto_37709 ) ( CLEAR ?auto_37708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37710 ?auto_37711 ?auto_37709 )
      ( MAKE-3PILE ?auto_37706 ?auto_37707 ?auto_37708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37712 - BLOCK
      ?auto_37713 - BLOCK
      ?auto_37714 - BLOCK
    )
    :vars
    (
      ?auto_37715 - BLOCK
      ?auto_37716 - BLOCK
      ?auto_37717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37712 ) ( not ( = ?auto_37712 ?auto_37713 ) ) ( not ( = ?auto_37712 ?auto_37714 ) ) ( not ( = ?auto_37712 ?auto_37715 ) ) ( not ( = ?auto_37713 ?auto_37714 ) ) ( not ( = ?auto_37713 ?auto_37715 ) ) ( not ( = ?auto_37714 ?auto_37715 ) ) ( not ( = ?auto_37712 ?auto_37716 ) ) ( not ( = ?auto_37713 ?auto_37716 ) ) ( not ( = ?auto_37714 ?auto_37716 ) ) ( not ( = ?auto_37715 ?auto_37716 ) ) ( ON ?auto_37716 ?auto_37717 ) ( not ( = ?auto_37712 ?auto_37717 ) ) ( not ( = ?auto_37713 ?auto_37717 ) ) ( not ( = ?auto_37714 ?auto_37717 ) ) ( not ( = ?auto_37715 ?auto_37717 ) ) ( not ( = ?auto_37716 ?auto_37717 ) ) ( ON ?auto_37715 ?auto_37716 ) ( ON ?auto_37714 ?auto_37715 ) ( CLEAR ?auto_37714 ) ( ON-TABLE ?auto_37717 ) ( HOLDING ?auto_37713 ) ( CLEAR ?auto_37712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37712 ?auto_37713 )
      ( MAKE-3PILE ?auto_37712 ?auto_37713 ?auto_37714 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37718 - BLOCK
      ?auto_37719 - BLOCK
      ?auto_37720 - BLOCK
    )
    :vars
    (
      ?auto_37722 - BLOCK
      ?auto_37723 - BLOCK
      ?auto_37721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37718 ) ( not ( = ?auto_37718 ?auto_37719 ) ) ( not ( = ?auto_37718 ?auto_37720 ) ) ( not ( = ?auto_37718 ?auto_37722 ) ) ( not ( = ?auto_37719 ?auto_37720 ) ) ( not ( = ?auto_37719 ?auto_37722 ) ) ( not ( = ?auto_37720 ?auto_37722 ) ) ( not ( = ?auto_37718 ?auto_37723 ) ) ( not ( = ?auto_37719 ?auto_37723 ) ) ( not ( = ?auto_37720 ?auto_37723 ) ) ( not ( = ?auto_37722 ?auto_37723 ) ) ( ON ?auto_37723 ?auto_37721 ) ( not ( = ?auto_37718 ?auto_37721 ) ) ( not ( = ?auto_37719 ?auto_37721 ) ) ( not ( = ?auto_37720 ?auto_37721 ) ) ( not ( = ?auto_37722 ?auto_37721 ) ) ( not ( = ?auto_37723 ?auto_37721 ) ) ( ON ?auto_37722 ?auto_37723 ) ( ON ?auto_37720 ?auto_37722 ) ( ON-TABLE ?auto_37721 ) ( CLEAR ?auto_37718 ) ( ON ?auto_37719 ?auto_37720 ) ( CLEAR ?auto_37719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37721 ?auto_37723 ?auto_37722 ?auto_37720 )
      ( MAKE-3PILE ?auto_37718 ?auto_37719 ?auto_37720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37724 - BLOCK
      ?auto_37725 - BLOCK
      ?auto_37726 - BLOCK
    )
    :vars
    (
      ?auto_37729 - BLOCK
      ?auto_37727 - BLOCK
      ?auto_37728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37724 ?auto_37725 ) ) ( not ( = ?auto_37724 ?auto_37726 ) ) ( not ( = ?auto_37724 ?auto_37729 ) ) ( not ( = ?auto_37725 ?auto_37726 ) ) ( not ( = ?auto_37725 ?auto_37729 ) ) ( not ( = ?auto_37726 ?auto_37729 ) ) ( not ( = ?auto_37724 ?auto_37727 ) ) ( not ( = ?auto_37725 ?auto_37727 ) ) ( not ( = ?auto_37726 ?auto_37727 ) ) ( not ( = ?auto_37729 ?auto_37727 ) ) ( ON ?auto_37727 ?auto_37728 ) ( not ( = ?auto_37724 ?auto_37728 ) ) ( not ( = ?auto_37725 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37728 ) ) ( not ( = ?auto_37729 ?auto_37728 ) ) ( not ( = ?auto_37727 ?auto_37728 ) ) ( ON ?auto_37729 ?auto_37727 ) ( ON ?auto_37726 ?auto_37729 ) ( ON-TABLE ?auto_37728 ) ( ON ?auto_37725 ?auto_37726 ) ( CLEAR ?auto_37725 ) ( HOLDING ?auto_37724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37724 )
      ( MAKE-3PILE ?auto_37724 ?auto_37725 ?auto_37726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37730 - BLOCK
      ?auto_37731 - BLOCK
      ?auto_37732 - BLOCK
    )
    :vars
    (
      ?auto_37734 - BLOCK
      ?auto_37733 - BLOCK
      ?auto_37735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37730 ?auto_37731 ) ) ( not ( = ?auto_37730 ?auto_37732 ) ) ( not ( = ?auto_37730 ?auto_37734 ) ) ( not ( = ?auto_37731 ?auto_37732 ) ) ( not ( = ?auto_37731 ?auto_37734 ) ) ( not ( = ?auto_37732 ?auto_37734 ) ) ( not ( = ?auto_37730 ?auto_37733 ) ) ( not ( = ?auto_37731 ?auto_37733 ) ) ( not ( = ?auto_37732 ?auto_37733 ) ) ( not ( = ?auto_37734 ?auto_37733 ) ) ( ON ?auto_37733 ?auto_37735 ) ( not ( = ?auto_37730 ?auto_37735 ) ) ( not ( = ?auto_37731 ?auto_37735 ) ) ( not ( = ?auto_37732 ?auto_37735 ) ) ( not ( = ?auto_37734 ?auto_37735 ) ) ( not ( = ?auto_37733 ?auto_37735 ) ) ( ON ?auto_37734 ?auto_37733 ) ( ON ?auto_37732 ?auto_37734 ) ( ON-TABLE ?auto_37735 ) ( ON ?auto_37731 ?auto_37732 ) ( ON ?auto_37730 ?auto_37731 ) ( CLEAR ?auto_37730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37735 ?auto_37733 ?auto_37734 ?auto_37732 ?auto_37731 )
      ( MAKE-3PILE ?auto_37730 ?auto_37731 ?auto_37732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37738 - BLOCK
      ?auto_37739 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37739 ) ( CLEAR ?auto_37738 ) ( ON-TABLE ?auto_37738 ) ( not ( = ?auto_37738 ?auto_37739 ) ) )
    :subtasks
    ( ( !STACK ?auto_37739 ?auto_37738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37740 - BLOCK
      ?auto_37741 - BLOCK
    )
    :vars
    (
      ?auto_37742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37740 ) ( ON-TABLE ?auto_37740 ) ( not ( = ?auto_37740 ?auto_37741 ) ) ( ON ?auto_37741 ?auto_37742 ) ( CLEAR ?auto_37741 ) ( HAND-EMPTY ) ( not ( = ?auto_37740 ?auto_37742 ) ) ( not ( = ?auto_37741 ?auto_37742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37741 ?auto_37742 )
      ( MAKE-2PILE ?auto_37740 ?auto_37741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37743 - BLOCK
      ?auto_37744 - BLOCK
    )
    :vars
    (
      ?auto_37745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37743 ?auto_37744 ) ) ( ON ?auto_37744 ?auto_37745 ) ( CLEAR ?auto_37744 ) ( not ( = ?auto_37743 ?auto_37745 ) ) ( not ( = ?auto_37744 ?auto_37745 ) ) ( HOLDING ?auto_37743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37743 )
      ( MAKE-2PILE ?auto_37743 ?auto_37744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37746 - BLOCK
      ?auto_37747 - BLOCK
    )
    :vars
    (
      ?auto_37748 - BLOCK
      ?auto_37749 - BLOCK
      ?auto_37750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37746 ?auto_37747 ) ) ( ON ?auto_37747 ?auto_37748 ) ( not ( = ?auto_37746 ?auto_37748 ) ) ( not ( = ?auto_37747 ?auto_37748 ) ) ( ON ?auto_37746 ?auto_37747 ) ( CLEAR ?auto_37746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37749 ) ( ON ?auto_37750 ?auto_37749 ) ( ON ?auto_37748 ?auto_37750 ) ( not ( = ?auto_37749 ?auto_37750 ) ) ( not ( = ?auto_37749 ?auto_37748 ) ) ( not ( = ?auto_37749 ?auto_37747 ) ) ( not ( = ?auto_37749 ?auto_37746 ) ) ( not ( = ?auto_37750 ?auto_37748 ) ) ( not ( = ?auto_37750 ?auto_37747 ) ) ( not ( = ?auto_37750 ?auto_37746 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37749 ?auto_37750 ?auto_37748 ?auto_37747 )
      ( MAKE-2PILE ?auto_37746 ?auto_37747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37751 - BLOCK
      ?auto_37752 - BLOCK
    )
    :vars
    (
      ?auto_37753 - BLOCK
      ?auto_37755 - BLOCK
      ?auto_37754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37751 ?auto_37752 ) ) ( ON ?auto_37752 ?auto_37753 ) ( not ( = ?auto_37751 ?auto_37753 ) ) ( not ( = ?auto_37752 ?auto_37753 ) ) ( ON-TABLE ?auto_37755 ) ( ON ?auto_37754 ?auto_37755 ) ( ON ?auto_37753 ?auto_37754 ) ( not ( = ?auto_37755 ?auto_37754 ) ) ( not ( = ?auto_37755 ?auto_37753 ) ) ( not ( = ?auto_37755 ?auto_37752 ) ) ( not ( = ?auto_37755 ?auto_37751 ) ) ( not ( = ?auto_37754 ?auto_37753 ) ) ( not ( = ?auto_37754 ?auto_37752 ) ) ( not ( = ?auto_37754 ?auto_37751 ) ) ( HOLDING ?auto_37751 ) ( CLEAR ?auto_37752 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37755 ?auto_37754 ?auto_37753 ?auto_37752 ?auto_37751 )
      ( MAKE-2PILE ?auto_37751 ?auto_37752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37756 - BLOCK
      ?auto_37757 - BLOCK
    )
    :vars
    (
      ?auto_37758 - BLOCK
      ?auto_37759 - BLOCK
      ?auto_37760 - BLOCK
      ?auto_37761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37756 ?auto_37757 ) ) ( ON ?auto_37757 ?auto_37758 ) ( not ( = ?auto_37756 ?auto_37758 ) ) ( not ( = ?auto_37757 ?auto_37758 ) ) ( ON-TABLE ?auto_37759 ) ( ON ?auto_37760 ?auto_37759 ) ( ON ?auto_37758 ?auto_37760 ) ( not ( = ?auto_37759 ?auto_37760 ) ) ( not ( = ?auto_37759 ?auto_37758 ) ) ( not ( = ?auto_37759 ?auto_37757 ) ) ( not ( = ?auto_37759 ?auto_37756 ) ) ( not ( = ?auto_37760 ?auto_37758 ) ) ( not ( = ?auto_37760 ?auto_37757 ) ) ( not ( = ?auto_37760 ?auto_37756 ) ) ( CLEAR ?auto_37757 ) ( ON ?auto_37756 ?auto_37761 ) ( CLEAR ?auto_37756 ) ( HAND-EMPTY ) ( not ( = ?auto_37756 ?auto_37761 ) ) ( not ( = ?auto_37757 ?auto_37761 ) ) ( not ( = ?auto_37758 ?auto_37761 ) ) ( not ( = ?auto_37759 ?auto_37761 ) ) ( not ( = ?auto_37760 ?auto_37761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37756 ?auto_37761 )
      ( MAKE-2PILE ?auto_37756 ?auto_37757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37762 - BLOCK
      ?auto_37763 - BLOCK
    )
    :vars
    (
      ?auto_37764 - BLOCK
      ?auto_37767 - BLOCK
      ?auto_37765 - BLOCK
      ?auto_37766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37762 ?auto_37763 ) ) ( not ( = ?auto_37762 ?auto_37764 ) ) ( not ( = ?auto_37763 ?auto_37764 ) ) ( ON-TABLE ?auto_37767 ) ( ON ?auto_37765 ?auto_37767 ) ( ON ?auto_37764 ?auto_37765 ) ( not ( = ?auto_37767 ?auto_37765 ) ) ( not ( = ?auto_37767 ?auto_37764 ) ) ( not ( = ?auto_37767 ?auto_37763 ) ) ( not ( = ?auto_37767 ?auto_37762 ) ) ( not ( = ?auto_37765 ?auto_37764 ) ) ( not ( = ?auto_37765 ?auto_37763 ) ) ( not ( = ?auto_37765 ?auto_37762 ) ) ( ON ?auto_37762 ?auto_37766 ) ( CLEAR ?auto_37762 ) ( not ( = ?auto_37762 ?auto_37766 ) ) ( not ( = ?auto_37763 ?auto_37766 ) ) ( not ( = ?auto_37764 ?auto_37766 ) ) ( not ( = ?auto_37767 ?auto_37766 ) ) ( not ( = ?auto_37765 ?auto_37766 ) ) ( HOLDING ?auto_37763 ) ( CLEAR ?auto_37764 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37767 ?auto_37765 ?auto_37764 ?auto_37763 )
      ( MAKE-2PILE ?auto_37762 ?auto_37763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37768 - BLOCK
      ?auto_37769 - BLOCK
    )
    :vars
    (
      ?auto_37770 - BLOCK
      ?auto_37773 - BLOCK
      ?auto_37772 - BLOCK
      ?auto_37771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37768 ?auto_37769 ) ) ( not ( = ?auto_37768 ?auto_37770 ) ) ( not ( = ?auto_37769 ?auto_37770 ) ) ( ON-TABLE ?auto_37773 ) ( ON ?auto_37772 ?auto_37773 ) ( ON ?auto_37770 ?auto_37772 ) ( not ( = ?auto_37773 ?auto_37772 ) ) ( not ( = ?auto_37773 ?auto_37770 ) ) ( not ( = ?auto_37773 ?auto_37769 ) ) ( not ( = ?auto_37773 ?auto_37768 ) ) ( not ( = ?auto_37772 ?auto_37770 ) ) ( not ( = ?auto_37772 ?auto_37769 ) ) ( not ( = ?auto_37772 ?auto_37768 ) ) ( ON ?auto_37768 ?auto_37771 ) ( not ( = ?auto_37768 ?auto_37771 ) ) ( not ( = ?auto_37769 ?auto_37771 ) ) ( not ( = ?auto_37770 ?auto_37771 ) ) ( not ( = ?auto_37773 ?auto_37771 ) ) ( not ( = ?auto_37772 ?auto_37771 ) ) ( CLEAR ?auto_37770 ) ( ON ?auto_37769 ?auto_37768 ) ( CLEAR ?auto_37769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37771 ?auto_37768 )
      ( MAKE-2PILE ?auto_37768 ?auto_37769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37774 - BLOCK
      ?auto_37775 - BLOCK
    )
    :vars
    (
      ?auto_37776 - BLOCK
      ?auto_37779 - BLOCK
      ?auto_37777 - BLOCK
      ?auto_37778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37774 ?auto_37775 ) ) ( not ( = ?auto_37774 ?auto_37776 ) ) ( not ( = ?auto_37775 ?auto_37776 ) ) ( ON-TABLE ?auto_37779 ) ( ON ?auto_37777 ?auto_37779 ) ( not ( = ?auto_37779 ?auto_37777 ) ) ( not ( = ?auto_37779 ?auto_37776 ) ) ( not ( = ?auto_37779 ?auto_37775 ) ) ( not ( = ?auto_37779 ?auto_37774 ) ) ( not ( = ?auto_37777 ?auto_37776 ) ) ( not ( = ?auto_37777 ?auto_37775 ) ) ( not ( = ?auto_37777 ?auto_37774 ) ) ( ON ?auto_37774 ?auto_37778 ) ( not ( = ?auto_37774 ?auto_37778 ) ) ( not ( = ?auto_37775 ?auto_37778 ) ) ( not ( = ?auto_37776 ?auto_37778 ) ) ( not ( = ?auto_37779 ?auto_37778 ) ) ( not ( = ?auto_37777 ?auto_37778 ) ) ( ON ?auto_37775 ?auto_37774 ) ( CLEAR ?auto_37775 ) ( ON-TABLE ?auto_37778 ) ( HOLDING ?auto_37776 ) ( CLEAR ?auto_37777 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37779 ?auto_37777 ?auto_37776 )
      ( MAKE-2PILE ?auto_37774 ?auto_37775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37780 - BLOCK
      ?auto_37781 - BLOCK
    )
    :vars
    (
      ?auto_37784 - BLOCK
      ?auto_37782 - BLOCK
      ?auto_37783 - BLOCK
      ?auto_37785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37780 ?auto_37781 ) ) ( not ( = ?auto_37780 ?auto_37784 ) ) ( not ( = ?auto_37781 ?auto_37784 ) ) ( ON-TABLE ?auto_37782 ) ( ON ?auto_37783 ?auto_37782 ) ( not ( = ?auto_37782 ?auto_37783 ) ) ( not ( = ?auto_37782 ?auto_37784 ) ) ( not ( = ?auto_37782 ?auto_37781 ) ) ( not ( = ?auto_37782 ?auto_37780 ) ) ( not ( = ?auto_37783 ?auto_37784 ) ) ( not ( = ?auto_37783 ?auto_37781 ) ) ( not ( = ?auto_37783 ?auto_37780 ) ) ( ON ?auto_37780 ?auto_37785 ) ( not ( = ?auto_37780 ?auto_37785 ) ) ( not ( = ?auto_37781 ?auto_37785 ) ) ( not ( = ?auto_37784 ?auto_37785 ) ) ( not ( = ?auto_37782 ?auto_37785 ) ) ( not ( = ?auto_37783 ?auto_37785 ) ) ( ON ?auto_37781 ?auto_37780 ) ( ON-TABLE ?auto_37785 ) ( CLEAR ?auto_37783 ) ( ON ?auto_37784 ?auto_37781 ) ( CLEAR ?auto_37784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37785 ?auto_37780 ?auto_37781 )
      ( MAKE-2PILE ?auto_37780 ?auto_37781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37786 - BLOCK
      ?auto_37787 - BLOCK
    )
    :vars
    (
      ?auto_37789 - BLOCK
      ?auto_37788 - BLOCK
      ?auto_37791 - BLOCK
      ?auto_37790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37786 ?auto_37787 ) ) ( not ( = ?auto_37786 ?auto_37789 ) ) ( not ( = ?auto_37787 ?auto_37789 ) ) ( ON-TABLE ?auto_37788 ) ( not ( = ?auto_37788 ?auto_37791 ) ) ( not ( = ?auto_37788 ?auto_37789 ) ) ( not ( = ?auto_37788 ?auto_37787 ) ) ( not ( = ?auto_37788 ?auto_37786 ) ) ( not ( = ?auto_37791 ?auto_37789 ) ) ( not ( = ?auto_37791 ?auto_37787 ) ) ( not ( = ?auto_37791 ?auto_37786 ) ) ( ON ?auto_37786 ?auto_37790 ) ( not ( = ?auto_37786 ?auto_37790 ) ) ( not ( = ?auto_37787 ?auto_37790 ) ) ( not ( = ?auto_37789 ?auto_37790 ) ) ( not ( = ?auto_37788 ?auto_37790 ) ) ( not ( = ?auto_37791 ?auto_37790 ) ) ( ON ?auto_37787 ?auto_37786 ) ( ON-TABLE ?auto_37790 ) ( ON ?auto_37789 ?auto_37787 ) ( CLEAR ?auto_37789 ) ( HOLDING ?auto_37791 ) ( CLEAR ?auto_37788 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37788 ?auto_37791 )
      ( MAKE-2PILE ?auto_37786 ?auto_37787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37792 - BLOCK
      ?auto_37793 - BLOCK
    )
    :vars
    (
      ?auto_37796 - BLOCK
      ?auto_37795 - BLOCK
      ?auto_37794 - BLOCK
      ?auto_37797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37792 ?auto_37793 ) ) ( not ( = ?auto_37792 ?auto_37796 ) ) ( not ( = ?auto_37793 ?auto_37796 ) ) ( ON-TABLE ?auto_37795 ) ( not ( = ?auto_37795 ?auto_37794 ) ) ( not ( = ?auto_37795 ?auto_37796 ) ) ( not ( = ?auto_37795 ?auto_37793 ) ) ( not ( = ?auto_37795 ?auto_37792 ) ) ( not ( = ?auto_37794 ?auto_37796 ) ) ( not ( = ?auto_37794 ?auto_37793 ) ) ( not ( = ?auto_37794 ?auto_37792 ) ) ( ON ?auto_37792 ?auto_37797 ) ( not ( = ?auto_37792 ?auto_37797 ) ) ( not ( = ?auto_37793 ?auto_37797 ) ) ( not ( = ?auto_37796 ?auto_37797 ) ) ( not ( = ?auto_37795 ?auto_37797 ) ) ( not ( = ?auto_37794 ?auto_37797 ) ) ( ON ?auto_37793 ?auto_37792 ) ( ON-TABLE ?auto_37797 ) ( ON ?auto_37796 ?auto_37793 ) ( CLEAR ?auto_37795 ) ( ON ?auto_37794 ?auto_37796 ) ( CLEAR ?auto_37794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37797 ?auto_37792 ?auto_37793 ?auto_37796 )
      ( MAKE-2PILE ?auto_37792 ?auto_37793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37798 - BLOCK
      ?auto_37799 - BLOCK
    )
    :vars
    (
      ?auto_37802 - BLOCK
      ?auto_37803 - BLOCK
      ?auto_37801 - BLOCK
      ?auto_37800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37798 ?auto_37799 ) ) ( not ( = ?auto_37798 ?auto_37802 ) ) ( not ( = ?auto_37799 ?auto_37802 ) ) ( not ( = ?auto_37803 ?auto_37801 ) ) ( not ( = ?auto_37803 ?auto_37802 ) ) ( not ( = ?auto_37803 ?auto_37799 ) ) ( not ( = ?auto_37803 ?auto_37798 ) ) ( not ( = ?auto_37801 ?auto_37802 ) ) ( not ( = ?auto_37801 ?auto_37799 ) ) ( not ( = ?auto_37801 ?auto_37798 ) ) ( ON ?auto_37798 ?auto_37800 ) ( not ( = ?auto_37798 ?auto_37800 ) ) ( not ( = ?auto_37799 ?auto_37800 ) ) ( not ( = ?auto_37802 ?auto_37800 ) ) ( not ( = ?auto_37803 ?auto_37800 ) ) ( not ( = ?auto_37801 ?auto_37800 ) ) ( ON ?auto_37799 ?auto_37798 ) ( ON-TABLE ?auto_37800 ) ( ON ?auto_37802 ?auto_37799 ) ( ON ?auto_37801 ?auto_37802 ) ( CLEAR ?auto_37801 ) ( HOLDING ?auto_37803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37803 )
      ( MAKE-2PILE ?auto_37798 ?auto_37799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37804 - BLOCK
      ?auto_37805 - BLOCK
    )
    :vars
    (
      ?auto_37808 - BLOCK
      ?auto_37806 - BLOCK
      ?auto_37809 - BLOCK
      ?auto_37807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37804 ?auto_37805 ) ) ( not ( = ?auto_37804 ?auto_37808 ) ) ( not ( = ?auto_37805 ?auto_37808 ) ) ( not ( = ?auto_37806 ?auto_37809 ) ) ( not ( = ?auto_37806 ?auto_37808 ) ) ( not ( = ?auto_37806 ?auto_37805 ) ) ( not ( = ?auto_37806 ?auto_37804 ) ) ( not ( = ?auto_37809 ?auto_37808 ) ) ( not ( = ?auto_37809 ?auto_37805 ) ) ( not ( = ?auto_37809 ?auto_37804 ) ) ( ON ?auto_37804 ?auto_37807 ) ( not ( = ?auto_37804 ?auto_37807 ) ) ( not ( = ?auto_37805 ?auto_37807 ) ) ( not ( = ?auto_37808 ?auto_37807 ) ) ( not ( = ?auto_37806 ?auto_37807 ) ) ( not ( = ?auto_37809 ?auto_37807 ) ) ( ON ?auto_37805 ?auto_37804 ) ( ON-TABLE ?auto_37807 ) ( ON ?auto_37808 ?auto_37805 ) ( ON ?auto_37809 ?auto_37808 ) ( ON ?auto_37806 ?auto_37809 ) ( CLEAR ?auto_37806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37807 ?auto_37804 ?auto_37805 ?auto_37808 ?auto_37809 )
      ( MAKE-2PILE ?auto_37804 ?auto_37805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37812 - BLOCK
      ?auto_37813 - BLOCK
    )
    :vars
    (
      ?auto_37814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37814 ?auto_37813 ) ( CLEAR ?auto_37814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37812 ) ( ON ?auto_37813 ?auto_37812 ) ( not ( = ?auto_37812 ?auto_37813 ) ) ( not ( = ?auto_37812 ?auto_37814 ) ) ( not ( = ?auto_37813 ?auto_37814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37814 ?auto_37813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37815 - BLOCK
      ?auto_37816 - BLOCK
    )
    :vars
    (
      ?auto_37817 - BLOCK
      ?auto_37818 - BLOCK
      ?auto_37819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37817 ?auto_37816 ) ( CLEAR ?auto_37817 ) ( ON-TABLE ?auto_37815 ) ( ON ?auto_37816 ?auto_37815 ) ( not ( = ?auto_37815 ?auto_37816 ) ) ( not ( = ?auto_37815 ?auto_37817 ) ) ( not ( = ?auto_37816 ?auto_37817 ) ) ( HOLDING ?auto_37818 ) ( CLEAR ?auto_37819 ) ( not ( = ?auto_37815 ?auto_37818 ) ) ( not ( = ?auto_37815 ?auto_37819 ) ) ( not ( = ?auto_37816 ?auto_37818 ) ) ( not ( = ?auto_37816 ?auto_37819 ) ) ( not ( = ?auto_37817 ?auto_37818 ) ) ( not ( = ?auto_37817 ?auto_37819 ) ) ( not ( = ?auto_37818 ?auto_37819 ) ) )
    :subtasks
    ( ( !STACK ?auto_37818 ?auto_37819 )
      ( MAKE-2PILE ?auto_37815 ?auto_37816 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37820 - BLOCK
      ?auto_37821 - BLOCK
    )
    :vars
    (
      ?auto_37823 - BLOCK
      ?auto_37822 - BLOCK
      ?auto_37824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37823 ?auto_37821 ) ( ON-TABLE ?auto_37820 ) ( ON ?auto_37821 ?auto_37820 ) ( not ( = ?auto_37820 ?auto_37821 ) ) ( not ( = ?auto_37820 ?auto_37823 ) ) ( not ( = ?auto_37821 ?auto_37823 ) ) ( CLEAR ?auto_37822 ) ( not ( = ?auto_37820 ?auto_37824 ) ) ( not ( = ?auto_37820 ?auto_37822 ) ) ( not ( = ?auto_37821 ?auto_37824 ) ) ( not ( = ?auto_37821 ?auto_37822 ) ) ( not ( = ?auto_37823 ?auto_37824 ) ) ( not ( = ?auto_37823 ?auto_37822 ) ) ( not ( = ?auto_37824 ?auto_37822 ) ) ( ON ?auto_37824 ?auto_37823 ) ( CLEAR ?auto_37824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37820 ?auto_37821 ?auto_37823 )
      ( MAKE-2PILE ?auto_37820 ?auto_37821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37825 - BLOCK
      ?auto_37826 - BLOCK
    )
    :vars
    (
      ?auto_37829 - BLOCK
      ?auto_37827 - BLOCK
      ?auto_37828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37829 ?auto_37826 ) ( ON-TABLE ?auto_37825 ) ( ON ?auto_37826 ?auto_37825 ) ( not ( = ?auto_37825 ?auto_37826 ) ) ( not ( = ?auto_37825 ?auto_37829 ) ) ( not ( = ?auto_37826 ?auto_37829 ) ) ( not ( = ?auto_37825 ?auto_37827 ) ) ( not ( = ?auto_37825 ?auto_37828 ) ) ( not ( = ?auto_37826 ?auto_37827 ) ) ( not ( = ?auto_37826 ?auto_37828 ) ) ( not ( = ?auto_37829 ?auto_37827 ) ) ( not ( = ?auto_37829 ?auto_37828 ) ) ( not ( = ?auto_37827 ?auto_37828 ) ) ( ON ?auto_37827 ?auto_37829 ) ( CLEAR ?auto_37827 ) ( HOLDING ?auto_37828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37828 )
      ( MAKE-2PILE ?auto_37825 ?auto_37826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37830 - BLOCK
      ?auto_37831 - BLOCK
    )
    :vars
    (
      ?auto_37834 - BLOCK
      ?auto_37833 - BLOCK
      ?auto_37832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37834 ?auto_37831 ) ( ON-TABLE ?auto_37830 ) ( ON ?auto_37831 ?auto_37830 ) ( not ( = ?auto_37830 ?auto_37831 ) ) ( not ( = ?auto_37830 ?auto_37834 ) ) ( not ( = ?auto_37831 ?auto_37834 ) ) ( not ( = ?auto_37830 ?auto_37833 ) ) ( not ( = ?auto_37830 ?auto_37832 ) ) ( not ( = ?auto_37831 ?auto_37833 ) ) ( not ( = ?auto_37831 ?auto_37832 ) ) ( not ( = ?auto_37834 ?auto_37833 ) ) ( not ( = ?auto_37834 ?auto_37832 ) ) ( not ( = ?auto_37833 ?auto_37832 ) ) ( ON ?auto_37833 ?auto_37834 ) ( ON ?auto_37832 ?auto_37833 ) ( CLEAR ?auto_37832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37830 ?auto_37831 ?auto_37834 ?auto_37833 )
      ( MAKE-2PILE ?auto_37830 ?auto_37831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37835 - BLOCK
      ?auto_37836 - BLOCK
    )
    :vars
    (
      ?auto_37837 - BLOCK
      ?auto_37839 - BLOCK
      ?auto_37838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37837 ?auto_37836 ) ( ON-TABLE ?auto_37835 ) ( ON ?auto_37836 ?auto_37835 ) ( not ( = ?auto_37835 ?auto_37836 ) ) ( not ( = ?auto_37835 ?auto_37837 ) ) ( not ( = ?auto_37836 ?auto_37837 ) ) ( not ( = ?auto_37835 ?auto_37839 ) ) ( not ( = ?auto_37835 ?auto_37838 ) ) ( not ( = ?auto_37836 ?auto_37839 ) ) ( not ( = ?auto_37836 ?auto_37838 ) ) ( not ( = ?auto_37837 ?auto_37839 ) ) ( not ( = ?auto_37837 ?auto_37838 ) ) ( not ( = ?auto_37839 ?auto_37838 ) ) ( ON ?auto_37839 ?auto_37837 ) ( HOLDING ?auto_37838 ) ( CLEAR ?auto_37839 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37835 ?auto_37836 ?auto_37837 ?auto_37839 ?auto_37838 )
      ( MAKE-2PILE ?auto_37835 ?auto_37836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37840 - BLOCK
      ?auto_37841 - BLOCK
    )
    :vars
    (
      ?auto_37844 - BLOCK
      ?auto_37843 - BLOCK
      ?auto_37842 - BLOCK
      ?auto_37845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37844 ?auto_37841 ) ( ON-TABLE ?auto_37840 ) ( ON ?auto_37841 ?auto_37840 ) ( not ( = ?auto_37840 ?auto_37841 ) ) ( not ( = ?auto_37840 ?auto_37844 ) ) ( not ( = ?auto_37841 ?auto_37844 ) ) ( not ( = ?auto_37840 ?auto_37843 ) ) ( not ( = ?auto_37840 ?auto_37842 ) ) ( not ( = ?auto_37841 ?auto_37843 ) ) ( not ( = ?auto_37841 ?auto_37842 ) ) ( not ( = ?auto_37844 ?auto_37843 ) ) ( not ( = ?auto_37844 ?auto_37842 ) ) ( not ( = ?auto_37843 ?auto_37842 ) ) ( ON ?auto_37843 ?auto_37844 ) ( CLEAR ?auto_37843 ) ( ON ?auto_37842 ?auto_37845 ) ( CLEAR ?auto_37842 ) ( HAND-EMPTY ) ( not ( = ?auto_37840 ?auto_37845 ) ) ( not ( = ?auto_37841 ?auto_37845 ) ) ( not ( = ?auto_37844 ?auto_37845 ) ) ( not ( = ?auto_37843 ?auto_37845 ) ) ( not ( = ?auto_37842 ?auto_37845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37842 ?auto_37845 )
      ( MAKE-2PILE ?auto_37840 ?auto_37841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37846 - BLOCK
      ?auto_37847 - BLOCK
    )
    :vars
    (
      ?auto_37850 - BLOCK
      ?auto_37851 - BLOCK
      ?auto_37849 - BLOCK
      ?auto_37848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37850 ?auto_37847 ) ( ON-TABLE ?auto_37846 ) ( ON ?auto_37847 ?auto_37846 ) ( not ( = ?auto_37846 ?auto_37847 ) ) ( not ( = ?auto_37846 ?auto_37850 ) ) ( not ( = ?auto_37847 ?auto_37850 ) ) ( not ( = ?auto_37846 ?auto_37851 ) ) ( not ( = ?auto_37846 ?auto_37849 ) ) ( not ( = ?auto_37847 ?auto_37851 ) ) ( not ( = ?auto_37847 ?auto_37849 ) ) ( not ( = ?auto_37850 ?auto_37851 ) ) ( not ( = ?auto_37850 ?auto_37849 ) ) ( not ( = ?auto_37851 ?auto_37849 ) ) ( ON ?auto_37849 ?auto_37848 ) ( CLEAR ?auto_37849 ) ( not ( = ?auto_37846 ?auto_37848 ) ) ( not ( = ?auto_37847 ?auto_37848 ) ) ( not ( = ?auto_37850 ?auto_37848 ) ) ( not ( = ?auto_37851 ?auto_37848 ) ) ( not ( = ?auto_37849 ?auto_37848 ) ) ( HOLDING ?auto_37851 ) ( CLEAR ?auto_37850 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37846 ?auto_37847 ?auto_37850 ?auto_37851 )
      ( MAKE-2PILE ?auto_37846 ?auto_37847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37852 - BLOCK
      ?auto_37853 - BLOCK
    )
    :vars
    (
      ?auto_37857 - BLOCK
      ?auto_37855 - BLOCK
      ?auto_37854 - BLOCK
      ?auto_37856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37857 ?auto_37853 ) ( ON-TABLE ?auto_37852 ) ( ON ?auto_37853 ?auto_37852 ) ( not ( = ?auto_37852 ?auto_37853 ) ) ( not ( = ?auto_37852 ?auto_37857 ) ) ( not ( = ?auto_37853 ?auto_37857 ) ) ( not ( = ?auto_37852 ?auto_37855 ) ) ( not ( = ?auto_37852 ?auto_37854 ) ) ( not ( = ?auto_37853 ?auto_37855 ) ) ( not ( = ?auto_37853 ?auto_37854 ) ) ( not ( = ?auto_37857 ?auto_37855 ) ) ( not ( = ?auto_37857 ?auto_37854 ) ) ( not ( = ?auto_37855 ?auto_37854 ) ) ( ON ?auto_37854 ?auto_37856 ) ( not ( = ?auto_37852 ?auto_37856 ) ) ( not ( = ?auto_37853 ?auto_37856 ) ) ( not ( = ?auto_37857 ?auto_37856 ) ) ( not ( = ?auto_37855 ?auto_37856 ) ) ( not ( = ?auto_37854 ?auto_37856 ) ) ( CLEAR ?auto_37857 ) ( ON ?auto_37855 ?auto_37854 ) ( CLEAR ?auto_37855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37856 ?auto_37854 )
      ( MAKE-2PILE ?auto_37852 ?auto_37853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37870 - BLOCK
      ?auto_37871 - BLOCK
    )
    :vars
    (
      ?auto_37875 - BLOCK
      ?auto_37873 - BLOCK
      ?auto_37872 - BLOCK
      ?auto_37874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37870 ) ( not ( = ?auto_37870 ?auto_37871 ) ) ( not ( = ?auto_37870 ?auto_37875 ) ) ( not ( = ?auto_37871 ?auto_37875 ) ) ( not ( = ?auto_37870 ?auto_37873 ) ) ( not ( = ?auto_37870 ?auto_37872 ) ) ( not ( = ?auto_37871 ?auto_37873 ) ) ( not ( = ?auto_37871 ?auto_37872 ) ) ( not ( = ?auto_37875 ?auto_37873 ) ) ( not ( = ?auto_37875 ?auto_37872 ) ) ( not ( = ?auto_37873 ?auto_37872 ) ) ( ON ?auto_37872 ?auto_37874 ) ( not ( = ?auto_37870 ?auto_37874 ) ) ( not ( = ?auto_37871 ?auto_37874 ) ) ( not ( = ?auto_37875 ?auto_37874 ) ) ( not ( = ?auto_37873 ?auto_37874 ) ) ( not ( = ?auto_37872 ?auto_37874 ) ) ( ON ?auto_37873 ?auto_37872 ) ( ON-TABLE ?auto_37874 ) ( ON ?auto_37875 ?auto_37873 ) ( CLEAR ?auto_37875 ) ( HOLDING ?auto_37871 ) ( CLEAR ?auto_37870 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37870 ?auto_37871 ?auto_37875 )
      ( MAKE-2PILE ?auto_37870 ?auto_37871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37876 - BLOCK
      ?auto_37877 - BLOCK
    )
    :vars
    (
      ?auto_37879 - BLOCK
      ?auto_37878 - BLOCK
      ?auto_37881 - BLOCK
      ?auto_37880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37876 ) ( not ( = ?auto_37876 ?auto_37877 ) ) ( not ( = ?auto_37876 ?auto_37879 ) ) ( not ( = ?auto_37877 ?auto_37879 ) ) ( not ( = ?auto_37876 ?auto_37878 ) ) ( not ( = ?auto_37876 ?auto_37881 ) ) ( not ( = ?auto_37877 ?auto_37878 ) ) ( not ( = ?auto_37877 ?auto_37881 ) ) ( not ( = ?auto_37879 ?auto_37878 ) ) ( not ( = ?auto_37879 ?auto_37881 ) ) ( not ( = ?auto_37878 ?auto_37881 ) ) ( ON ?auto_37881 ?auto_37880 ) ( not ( = ?auto_37876 ?auto_37880 ) ) ( not ( = ?auto_37877 ?auto_37880 ) ) ( not ( = ?auto_37879 ?auto_37880 ) ) ( not ( = ?auto_37878 ?auto_37880 ) ) ( not ( = ?auto_37881 ?auto_37880 ) ) ( ON ?auto_37878 ?auto_37881 ) ( ON-TABLE ?auto_37880 ) ( ON ?auto_37879 ?auto_37878 ) ( CLEAR ?auto_37876 ) ( ON ?auto_37877 ?auto_37879 ) ( CLEAR ?auto_37877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37880 ?auto_37881 ?auto_37878 ?auto_37879 )
      ( MAKE-2PILE ?auto_37876 ?auto_37877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37882 - BLOCK
      ?auto_37883 - BLOCK
    )
    :vars
    (
      ?auto_37885 - BLOCK
      ?auto_37887 - BLOCK
      ?auto_37886 - BLOCK
      ?auto_37884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37882 ?auto_37883 ) ) ( not ( = ?auto_37882 ?auto_37885 ) ) ( not ( = ?auto_37883 ?auto_37885 ) ) ( not ( = ?auto_37882 ?auto_37887 ) ) ( not ( = ?auto_37882 ?auto_37886 ) ) ( not ( = ?auto_37883 ?auto_37887 ) ) ( not ( = ?auto_37883 ?auto_37886 ) ) ( not ( = ?auto_37885 ?auto_37887 ) ) ( not ( = ?auto_37885 ?auto_37886 ) ) ( not ( = ?auto_37887 ?auto_37886 ) ) ( ON ?auto_37886 ?auto_37884 ) ( not ( = ?auto_37882 ?auto_37884 ) ) ( not ( = ?auto_37883 ?auto_37884 ) ) ( not ( = ?auto_37885 ?auto_37884 ) ) ( not ( = ?auto_37887 ?auto_37884 ) ) ( not ( = ?auto_37886 ?auto_37884 ) ) ( ON ?auto_37887 ?auto_37886 ) ( ON-TABLE ?auto_37884 ) ( ON ?auto_37885 ?auto_37887 ) ( ON ?auto_37883 ?auto_37885 ) ( CLEAR ?auto_37883 ) ( HOLDING ?auto_37882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37882 )
      ( MAKE-2PILE ?auto_37882 ?auto_37883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37888 - BLOCK
      ?auto_37889 - BLOCK
    )
    :vars
    (
      ?auto_37893 - BLOCK
      ?auto_37891 - BLOCK
      ?auto_37890 - BLOCK
      ?auto_37892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37888 ?auto_37889 ) ) ( not ( = ?auto_37888 ?auto_37893 ) ) ( not ( = ?auto_37889 ?auto_37893 ) ) ( not ( = ?auto_37888 ?auto_37891 ) ) ( not ( = ?auto_37888 ?auto_37890 ) ) ( not ( = ?auto_37889 ?auto_37891 ) ) ( not ( = ?auto_37889 ?auto_37890 ) ) ( not ( = ?auto_37893 ?auto_37891 ) ) ( not ( = ?auto_37893 ?auto_37890 ) ) ( not ( = ?auto_37891 ?auto_37890 ) ) ( ON ?auto_37890 ?auto_37892 ) ( not ( = ?auto_37888 ?auto_37892 ) ) ( not ( = ?auto_37889 ?auto_37892 ) ) ( not ( = ?auto_37893 ?auto_37892 ) ) ( not ( = ?auto_37891 ?auto_37892 ) ) ( not ( = ?auto_37890 ?auto_37892 ) ) ( ON ?auto_37891 ?auto_37890 ) ( ON-TABLE ?auto_37892 ) ( ON ?auto_37893 ?auto_37891 ) ( ON ?auto_37889 ?auto_37893 ) ( ON ?auto_37888 ?auto_37889 ) ( CLEAR ?auto_37888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37892 ?auto_37890 ?auto_37891 ?auto_37893 ?auto_37889 )
      ( MAKE-2PILE ?auto_37888 ?auto_37889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37897 - BLOCK
      ?auto_37898 - BLOCK
      ?auto_37899 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37899 ) ( CLEAR ?auto_37898 ) ( ON-TABLE ?auto_37897 ) ( ON ?auto_37898 ?auto_37897 ) ( not ( = ?auto_37897 ?auto_37898 ) ) ( not ( = ?auto_37897 ?auto_37899 ) ) ( not ( = ?auto_37898 ?auto_37899 ) ) )
    :subtasks
    ( ( !STACK ?auto_37899 ?auto_37898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37900 - BLOCK
      ?auto_37901 - BLOCK
      ?auto_37902 - BLOCK
    )
    :vars
    (
      ?auto_37903 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37901 ) ( ON-TABLE ?auto_37900 ) ( ON ?auto_37901 ?auto_37900 ) ( not ( = ?auto_37900 ?auto_37901 ) ) ( not ( = ?auto_37900 ?auto_37902 ) ) ( not ( = ?auto_37901 ?auto_37902 ) ) ( ON ?auto_37902 ?auto_37903 ) ( CLEAR ?auto_37902 ) ( HAND-EMPTY ) ( not ( = ?auto_37900 ?auto_37903 ) ) ( not ( = ?auto_37901 ?auto_37903 ) ) ( not ( = ?auto_37902 ?auto_37903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37902 ?auto_37903 )
      ( MAKE-3PILE ?auto_37900 ?auto_37901 ?auto_37902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37904 - BLOCK
      ?auto_37905 - BLOCK
      ?auto_37906 - BLOCK
    )
    :vars
    (
      ?auto_37907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37904 ) ( not ( = ?auto_37904 ?auto_37905 ) ) ( not ( = ?auto_37904 ?auto_37906 ) ) ( not ( = ?auto_37905 ?auto_37906 ) ) ( ON ?auto_37906 ?auto_37907 ) ( CLEAR ?auto_37906 ) ( not ( = ?auto_37904 ?auto_37907 ) ) ( not ( = ?auto_37905 ?auto_37907 ) ) ( not ( = ?auto_37906 ?auto_37907 ) ) ( HOLDING ?auto_37905 ) ( CLEAR ?auto_37904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37904 ?auto_37905 )
      ( MAKE-3PILE ?auto_37904 ?auto_37905 ?auto_37906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37908 - BLOCK
      ?auto_37909 - BLOCK
      ?auto_37910 - BLOCK
    )
    :vars
    (
      ?auto_37911 - BLOCK
      ?auto_37912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37908 ) ( not ( = ?auto_37908 ?auto_37909 ) ) ( not ( = ?auto_37908 ?auto_37910 ) ) ( not ( = ?auto_37909 ?auto_37910 ) ) ( ON ?auto_37910 ?auto_37911 ) ( not ( = ?auto_37908 ?auto_37911 ) ) ( not ( = ?auto_37909 ?auto_37911 ) ) ( not ( = ?auto_37910 ?auto_37911 ) ) ( CLEAR ?auto_37908 ) ( ON ?auto_37909 ?auto_37910 ) ( CLEAR ?auto_37909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37912 ) ( ON ?auto_37911 ?auto_37912 ) ( not ( = ?auto_37912 ?auto_37911 ) ) ( not ( = ?auto_37912 ?auto_37910 ) ) ( not ( = ?auto_37912 ?auto_37909 ) ) ( not ( = ?auto_37908 ?auto_37912 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37912 ?auto_37911 ?auto_37910 )
      ( MAKE-3PILE ?auto_37908 ?auto_37909 ?auto_37910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37913 - BLOCK
      ?auto_37914 - BLOCK
      ?auto_37915 - BLOCK
    )
    :vars
    (
      ?auto_37917 - BLOCK
      ?auto_37916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37913 ?auto_37914 ) ) ( not ( = ?auto_37913 ?auto_37915 ) ) ( not ( = ?auto_37914 ?auto_37915 ) ) ( ON ?auto_37915 ?auto_37917 ) ( not ( = ?auto_37913 ?auto_37917 ) ) ( not ( = ?auto_37914 ?auto_37917 ) ) ( not ( = ?auto_37915 ?auto_37917 ) ) ( ON ?auto_37914 ?auto_37915 ) ( CLEAR ?auto_37914 ) ( ON-TABLE ?auto_37916 ) ( ON ?auto_37917 ?auto_37916 ) ( not ( = ?auto_37916 ?auto_37917 ) ) ( not ( = ?auto_37916 ?auto_37915 ) ) ( not ( = ?auto_37916 ?auto_37914 ) ) ( not ( = ?auto_37913 ?auto_37916 ) ) ( HOLDING ?auto_37913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37913 )
      ( MAKE-3PILE ?auto_37913 ?auto_37914 ?auto_37915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37918 - BLOCK
      ?auto_37919 - BLOCK
      ?auto_37920 - BLOCK
    )
    :vars
    (
      ?auto_37922 - BLOCK
      ?auto_37921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37918 ?auto_37919 ) ) ( not ( = ?auto_37918 ?auto_37920 ) ) ( not ( = ?auto_37919 ?auto_37920 ) ) ( ON ?auto_37920 ?auto_37922 ) ( not ( = ?auto_37918 ?auto_37922 ) ) ( not ( = ?auto_37919 ?auto_37922 ) ) ( not ( = ?auto_37920 ?auto_37922 ) ) ( ON ?auto_37919 ?auto_37920 ) ( ON-TABLE ?auto_37921 ) ( ON ?auto_37922 ?auto_37921 ) ( not ( = ?auto_37921 ?auto_37922 ) ) ( not ( = ?auto_37921 ?auto_37920 ) ) ( not ( = ?auto_37921 ?auto_37919 ) ) ( not ( = ?auto_37918 ?auto_37921 ) ) ( ON ?auto_37918 ?auto_37919 ) ( CLEAR ?auto_37918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37921 ?auto_37922 ?auto_37920 ?auto_37919 )
      ( MAKE-3PILE ?auto_37918 ?auto_37919 ?auto_37920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37923 - BLOCK
      ?auto_37924 - BLOCK
      ?auto_37925 - BLOCK
    )
    :vars
    (
      ?auto_37927 - BLOCK
      ?auto_37926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37923 ?auto_37924 ) ) ( not ( = ?auto_37923 ?auto_37925 ) ) ( not ( = ?auto_37924 ?auto_37925 ) ) ( ON ?auto_37925 ?auto_37927 ) ( not ( = ?auto_37923 ?auto_37927 ) ) ( not ( = ?auto_37924 ?auto_37927 ) ) ( not ( = ?auto_37925 ?auto_37927 ) ) ( ON ?auto_37924 ?auto_37925 ) ( ON-TABLE ?auto_37926 ) ( ON ?auto_37927 ?auto_37926 ) ( not ( = ?auto_37926 ?auto_37927 ) ) ( not ( = ?auto_37926 ?auto_37925 ) ) ( not ( = ?auto_37926 ?auto_37924 ) ) ( not ( = ?auto_37923 ?auto_37926 ) ) ( HOLDING ?auto_37923 ) ( CLEAR ?auto_37924 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37926 ?auto_37927 ?auto_37925 ?auto_37924 ?auto_37923 )
      ( MAKE-3PILE ?auto_37923 ?auto_37924 ?auto_37925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37928 - BLOCK
      ?auto_37929 - BLOCK
      ?auto_37930 - BLOCK
    )
    :vars
    (
      ?auto_37931 - BLOCK
      ?auto_37932 - BLOCK
      ?auto_37933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37928 ?auto_37929 ) ) ( not ( = ?auto_37928 ?auto_37930 ) ) ( not ( = ?auto_37929 ?auto_37930 ) ) ( ON ?auto_37930 ?auto_37931 ) ( not ( = ?auto_37928 ?auto_37931 ) ) ( not ( = ?auto_37929 ?auto_37931 ) ) ( not ( = ?auto_37930 ?auto_37931 ) ) ( ON ?auto_37929 ?auto_37930 ) ( ON-TABLE ?auto_37932 ) ( ON ?auto_37931 ?auto_37932 ) ( not ( = ?auto_37932 ?auto_37931 ) ) ( not ( = ?auto_37932 ?auto_37930 ) ) ( not ( = ?auto_37932 ?auto_37929 ) ) ( not ( = ?auto_37928 ?auto_37932 ) ) ( CLEAR ?auto_37929 ) ( ON ?auto_37928 ?auto_37933 ) ( CLEAR ?auto_37928 ) ( HAND-EMPTY ) ( not ( = ?auto_37928 ?auto_37933 ) ) ( not ( = ?auto_37929 ?auto_37933 ) ) ( not ( = ?auto_37930 ?auto_37933 ) ) ( not ( = ?auto_37931 ?auto_37933 ) ) ( not ( = ?auto_37932 ?auto_37933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37928 ?auto_37933 )
      ( MAKE-3PILE ?auto_37928 ?auto_37929 ?auto_37930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37934 - BLOCK
      ?auto_37935 - BLOCK
      ?auto_37936 - BLOCK
    )
    :vars
    (
      ?auto_37939 - BLOCK
      ?auto_37938 - BLOCK
      ?auto_37937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37934 ?auto_37935 ) ) ( not ( = ?auto_37934 ?auto_37936 ) ) ( not ( = ?auto_37935 ?auto_37936 ) ) ( ON ?auto_37936 ?auto_37939 ) ( not ( = ?auto_37934 ?auto_37939 ) ) ( not ( = ?auto_37935 ?auto_37939 ) ) ( not ( = ?auto_37936 ?auto_37939 ) ) ( ON-TABLE ?auto_37938 ) ( ON ?auto_37939 ?auto_37938 ) ( not ( = ?auto_37938 ?auto_37939 ) ) ( not ( = ?auto_37938 ?auto_37936 ) ) ( not ( = ?auto_37938 ?auto_37935 ) ) ( not ( = ?auto_37934 ?auto_37938 ) ) ( ON ?auto_37934 ?auto_37937 ) ( CLEAR ?auto_37934 ) ( not ( = ?auto_37934 ?auto_37937 ) ) ( not ( = ?auto_37935 ?auto_37937 ) ) ( not ( = ?auto_37936 ?auto_37937 ) ) ( not ( = ?auto_37939 ?auto_37937 ) ) ( not ( = ?auto_37938 ?auto_37937 ) ) ( HOLDING ?auto_37935 ) ( CLEAR ?auto_37936 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37938 ?auto_37939 ?auto_37936 ?auto_37935 )
      ( MAKE-3PILE ?auto_37934 ?auto_37935 ?auto_37936 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37940 - BLOCK
      ?auto_37941 - BLOCK
      ?auto_37942 - BLOCK
    )
    :vars
    (
      ?auto_37945 - BLOCK
      ?auto_37944 - BLOCK
      ?auto_37943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37940 ?auto_37941 ) ) ( not ( = ?auto_37940 ?auto_37942 ) ) ( not ( = ?auto_37941 ?auto_37942 ) ) ( ON ?auto_37942 ?auto_37945 ) ( not ( = ?auto_37940 ?auto_37945 ) ) ( not ( = ?auto_37941 ?auto_37945 ) ) ( not ( = ?auto_37942 ?auto_37945 ) ) ( ON-TABLE ?auto_37944 ) ( ON ?auto_37945 ?auto_37944 ) ( not ( = ?auto_37944 ?auto_37945 ) ) ( not ( = ?auto_37944 ?auto_37942 ) ) ( not ( = ?auto_37944 ?auto_37941 ) ) ( not ( = ?auto_37940 ?auto_37944 ) ) ( ON ?auto_37940 ?auto_37943 ) ( not ( = ?auto_37940 ?auto_37943 ) ) ( not ( = ?auto_37941 ?auto_37943 ) ) ( not ( = ?auto_37942 ?auto_37943 ) ) ( not ( = ?auto_37945 ?auto_37943 ) ) ( not ( = ?auto_37944 ?auto_37943 ) ) ( CLEAR ?auto_37942 ) ( ON ?auto_37941 ?auto_37940 ) ( CLEAR ?auto_37941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37943 ?auto_37940 )
      ( MAKE-3PILE ?auto_37940 ?auto_37941 ?auto_37942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37946 - BLOCK
      ?auto_37947 - BLOCK
      ?auto_37948 - BLOCK
    )
    :vars
    (
      ?auto_37951 - BLOCK
      ?auto_37949 - BLOCK
      ?auto_37950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37946 ?auto_37947 ) ) ( not ( = ?auto_37946 ?auto_37948 ) ) ( not ( = ?auto_37947 ?auto_37948 ) ) ( not ( = ?auto_37946 ?auto_37951 ) ) ( not ( = ?auto_37947 ?auto_37951 ) ) ( not ( = ?auto_37948 ?auto_37951 ) ) ( ON-TABLE ?auto_37949 ) ( ON ?auto_37951 ?auto_37949 ) ( not ( = ?auto_37949 ?auto_37951 ) ) ( not ( = ?auto_37949 ?auto_37948 ) ) ( not ( = ?auto_37949 ?auto_37947 ) ) ( not ( = ?auto_37946 ?auto_37949 ) ) ( ON ?auto_37946 ?auto_37950 ) ( not ( = ?auto_37946 ?auto_37950 ) ) ( not ( = ?auto_37947 ?auto_37950 ) ) ( not ( = ?auto_37948 ?auto_37950 ) ) ( not ( = ?auto_37951 ?auto_37950 ) ) ( not ( = ?auto_37949 ?auto_37950 ) ) ( ON ?auto_37947 ?auto_37946 ) ( CLEAR ?auto_37947 ) ( ON-TABLE ?auto_37950 ) ( HOLDING ?auto_37948 ) ( CLEAR ?auto_37951 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37949 ?auto_37951 ?auto_37948 )
      ( MAKE-3PILE ?auto_37946 ?auto_37947 ?auto_37948 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37952 - BLOCK
      ?auto_37953 - BLOCK
      ?auto_37954 - BLOCK
    )
    :vars
    (
      ?auto_37955 - BLOCK
      ?auto_37956 - BLOCK
      ?auto_37957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37952 ?auto_37953 ) ) ( not ( = ?auto_37952 ?auto_37954 ) ) ( not ( = ?auto_37953 ?auto_37954 ) ) ( not ( = ?auto_37952 ?auto_37955 ) ) ( not ( = ?auto_37953 ?auto_37955 ) ) ( not ( = ?auto_37954 ?auto_37955 ) ) ( ON-TABLE ?auto_37956 ) ( ON ?auto_37955 ?auto_37956 ) ( not ( = ?auto_37956 ?auto_37955 ) ) ( not ( = ?auto_37956 ?auto_37954 ) ) ( not ( = ?auto_37956 ?auto_37953 ) ) ( not ( = ?auto_37952 ?auto_37956 ) ) ( ON ?auto_37952 ?auto_37957 ) ( not ( = ?auto_37952 ?auto_37957 ) ) ( not ( = ?auto_37953 ?auto_37957 ) ) ( not ( = ?auto_37954 ?auto_37957 ) ) ( not ( = ?auto_37955 ?auto_37957 ) ) ( not ( = ?auto_37956 ?auto_37957 ) ) ( ON ?auto_37953 ?auto_37952 ) ( ON-TABLE ?auto_37957 ) ( CLEAR ?auto_37955 ) ( ON ?auto_37954 ?auto_37953 ) ( CLEAR ?auto_37954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37957 ?auto_37952 ?auto_37953 )
      ( MAKE-3PILE ?auto_37952 ?auto_37953 ?auto_37954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37958 - BLOCK
      ?auto_37959 - BLOCK
      ?auto_37960 - BLOCK
    )
    :vars
    (
      ?auto_37961 - BLOCK
      ?auto_37963 - BLOCK
      ?auto_37962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37958 ?auto_37959 ) ) ( not ( = ?auto_37958 ?auto_37960 ) ) ( not ( = ?auto_37959 ?auto_37960 ) ) ( not ( = ?auto_37958 ?auto_37961 ) ) ( not ( = ?auto_37959 ?auto_37961 ) ) ( not ( = ?auto_37960 ?auto_37961 ) ) ( ON-TABLE ?auto_37963 ) ( not ( = ?auto_37963 ?auto_37961 ) ) ( not ( = ?auto_37963 ?auto_37960 ) ) ( not ( = ?auto_37963 ?auto_37959 ) ) ( not ( = ?auto_37958 ?auto_37963 ) ) ( ON ?auto_37958 ?auto_37962 ) ( not ( = ?auto_37958 ?auto_37962 ) ) ( not ( = ?auto_37959 ?auto_37962 ) ) ( not ( = ?auto_37960 ?auto_37962 ) ) ( not ( = ?auto_37961 ?auto_37962 ) ) ( not ( = ?auto_37963 ?auto_37962 ) ) ( ON ?auto_37959 ?auto_37958 ) ( ON-TABLE ?auto_37962 ) ( ON ?auto_37960 ?auto_37959 ) ( CLEAR ?auto_37960 ) ( HOLDING ?auto_37961 ) ( CLEAR ?auto_37963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37963 ?auto_37961 )
      ( MAKE-3PILE ?auto_37958 ?auto_37959 ?auto_37960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37964 - BLOCK
      ?auto_37965 - BLOCK
      ?auto_37966 - BLOCK
    )
    :vars
    (
      ?auto_37967 - BLOCK
      ?auto_37969 - BLOCK
      ?auto_37968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37964 ?auto_37965 ) ) ( not ( = ?auto_37964 ?auto_37966 ) ) ( not ( = ?auto_37965 ?auto_37966 ) ) ( not ( = ?auto_37964 ?auto_37967 ) ) ( not ( = ?auto_37965 ?auto_37967 ) ) ( not ( = ?auto_37966 ?auto_37967 ) ) ( ON-TABLE ?auto_37969 ) ( not ( = ?auto_37969 ?auto_37967 ) ) ( not ( = ?auto_37969 ?auto_37966 ) ) ( not ( = ?auto_37969 ?auto_37965 ) ) ( not ( = ?auto_37964 ?auto_37969 ) ) ( ON ?auto_37964 ?auto_37968 ) ( not ( = ?auto_37964 ?auto_37968 ) ) ( not ( = ?auto_37965 ?auto_37968 ) ) ( not ( = ?auto_37966 ?auto_37968 ) ) ( not ( = ?auto_37967 ?auto_37968 ) ) ( not ( = ?auto_37969 ?auto_37968 ) ) ( ON ?auto_37965 ?auto_37964 ) ( ON-TABLE ?auto_37968 ) ( ON ?auto_37966 ?auto_37965 ) ( CLEAR ?auto_37969 ) ( ON ?auto_37967 ?auto_37966 ) ( CLEAR ?auto_37967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37968 ?auto_37964 ?auto_37965 ?auto_37966 )
      ( MAKE-3PILE ?auto_37964 ?auto_37965 ?auto_37966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37970 - BLOCK
      ?auto_37971 - BLOCK
      ?auto_37972 - BLOCK
    )
    :vars
    (
      ?auto_37974 - BLOCK
      ?auto_37975 - BLOCK
      ?auto_37973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37970 ?auto_37971 ) ) ( not ( = ?auto_37970 ?auto_37972 ) ) ( not ( = ?auto_37971 ?auto_37972 ) ) ( not ( = ?auto_37970 ?auto_37974 ) ) ( not ( = ?auto_37971 ?auto_37974 ) ) ( not ( = ?auto_37972 ?auto_37974 ) ) ( not ( = ?auto_37975 ?auto_37974 ) ) ( not ( = ?auto_37975 ?auto_37972 ) ) ( not ( = ?auto_37975 ?auto_37971 ) ) ( not ( = ?auto_37970 ?auto_37975 ) ) ( ON ?auto_37970 ?auto_37973 ) ( not ( = ?auto_37970 ?auto_37973 ) ) ( not ( = ?auto_37971 ?auto_37973 ) ) ( not ( = ?auto_37972 ?auto_37973 ) ) ( not ( = ?auto_37974 ?auto_37973 ) ) ( not ( = ?auto_37975 ?auto_37973 ) ) ( ON ?auto_37971 ?auto_37970 ) ( ON-TABLE ?auto_37973 ) ( ON ?auto_37972 ?auto_37971 ) ( ON ?auto_37974 ?auto_37972 ) ( CLEAR ?auto_37974 ) ( HOLDING ?auto_37975 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37975 )
      ( MAKE-3PILE ?auto_37970 ?auto_37971 ?auto_37972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37976 - BLOCK
      ?auto_37977 - BLOCK
      ?auto_37978 - BLOCK
    )
    :vars
    (
      ?auto_37980 - BLOCK
      ?auto_37979 - BLOCK
      ?auto_37981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37976 ?auto_37977 ) ) ( not ( = ?auto_37976 ?auto_37978 ) ) ( not ( = ?auto_37977 ?auto_37978 ) ) ( not ( = ?auto_37976 ?auto_37980 ) ) ( not ( = ?auto_37977 ?auto_37980 ) ) ( not ( = ?auto_37978 ?auto_37980 ) ) ( not ( = ?auto_37979 ?auto_37980 ) ) ( not ( = ?auto_37979 ?auto_37978 ) ) ( not ( = ?auto_37979 ?auto_37977 ) ) ( not ( = ?auto_37976 ?auto_37979 ) ) ( ON ?auto_37976 ?auto_37981 ) ( not ( = ?auto_37976 ?auto_37981 ) ) ( not ( = ?auto_37977 ?auto_37981 ) ) ( not ( = ?auto_37978 ?auto_37981 ) ) ( not ( = ?auto_37980 ?auto_37981 ) ) ( not ( = ?auto_37979 ?auto_37981 ) ) ( ON ?auto_37977 ?auto_37976 ) ( ON-TABLE ?auto_37981 ) ( ON ?auto_37978 ?auto_37977 ) ( ON ?auto_37980 ?auto_37978 ) ( ON ?auto_37979 ?auto_37980 ) ( CLEAR ?auto_37979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37981 ?auto_37976 ?auto_37977 ?auto_37978 ?auto_37980 )
      ( MAKE-3PILE ?auto_37976 ?auto_37977 ?auto_37978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37983 - BLOCK
    )
    :vars
    (
      ?auto_37984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37984 ?auto_37983 ) ( CLEAR ?auto_37984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37983 ) ( not ( = ?auto_37983 ?auto_37984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37984 ?auto_37983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37985 - BLOCK
    )
    :vars
    (
      ?auto_37986 - BLOCK
      ?auto_37987 - BLOCK
      ?auto_37988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37986 ?auto_37985 ) ( CLEAR ?auto_37986 ) ( ON-TABLE ?auto_37985 ) ( not ( = ?auto_37985 ?auto_37986 ) ) ( HOLDING ?auto_37987 ) ( CLEAR ?auto_37988 ) ( not ( = ?auto_37985 ?auto_37987 ) ) ( not ( = ?auto_37985 ?auto_37988 ) ) ( not ( = ?auto_37986 ?auto_37987 ) ) ( not ( = ?auto_37986 ?auto_37988 ) ) ( not ( = ?auto_37987 ?auto_37988 ) ) )
    :subtasks
    ( ( !STACK ?auto_37987 ?auto_37988 )
      ( MAKE-1PILE ?auto_37985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37989 - BLOCK
    )
    :vars
    (
      ?auto_37992 - BLOCK
      ?auto_37991 - BLOCK
      ?auto_37990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37992 ?auto_37989 ) ( ON-TABLE ?auto_37989 ) ( not ( = ?auto_37989 ?auto_37992 ) ) ( CLEAR ?auto_37991 ) ( not ( = ?auto_37989 ?auto_37990 ) ) ( not ( = ?auto_37989 ?auto_37991 ) ) ( not ( = ?auto_37992 ?auto_37990 ) ) ( not ( = ?auto_37992 ?auto_37991 ) ) ( not ( = ?auto_37990 ?auto_37991 ) ) ( ON ?auto_37990 ?auto_37992 ) ( CLEAR ?auto_37990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37989 ?auto_37992 )
      ( MAKE-1PILE ?auto_37989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37993 - BLOCK
    )
    :vars
    (
      ?auto_37995 - BLOCK
      ?auto_37996 - BLOCK
      ?auto_37994 - BLOCK
      ?auto_37997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37995 ?auto_37993 ) ( ON-TABLE ?auto_37993 ) ( not ( = ?auto_37993 ?auto_37995 ) ) ( not ( = ?auto_37993 ?auto_37996 ) ) ( not ( = ?auto_37993 ?auto_37994 ) ) ( not ( = ?auto_37995 ?auto_37996 ) ) ( not ( = ?auto_37995 ?auto_37994 ) ) ( not ( = ?auto_37996 ?auto_37994 ) ) ( ON ?auto_37996 ?auto_37995 ) ( CLEAR ?auto_37996 ) ( HOLDING ?auto_37994 ) ( CLEAR ?auto_37997 ) ( ON-TABLE ?auto_37997 ) ( not ( = ?auto_37997 ?auto_37994 ) ) ( not ( = ?auto_37993 ?auto_37997 ) ) ( not ( = ?auto_37995 ?auto_37997 ) ) ( not ( = ?auto_37996 ?auto_37997 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37997 ?auto_37994 )
      ( MAKE-1PILE ?auto_37993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37998 - BLOCK
    )
    :vars
    (
      ?auto_37999 - BLOCK
      ?auto_38002 - BLOCK
      ?auto_38000 - BLOCK
      ?auto_38001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37999 ?auto_37998 ) ( ON-TABLE ?auto_37998 ) ( not ( = ?auto_37998 ?auto_37999 ) ) ( not ( = ?auto_37998 ?auto_38002 ) ) ( not ( = ?auto_37998 ?auto_38000 ) ) ( not ( = ?auto_37999 ?auto_38002 ) ) ( not ( = ?auto_37999 ?auto_38000 ) ) ( not ( = ?auto_38002 ?auto_38000 ) ) ( ON ?auto_38002 ?auto_37999 ) ( CLEAR ?auto_38001 ) ( ON-TABLE ?auto_38001 ) ( not ( = ?auto_38001 ?auto_38000 ) ) ( not ( = ?auto_37998 ?auto_38001 ) ) ( not ( = ?auto_37999 ?auto_38001 ) ) ( not ( = ?auto_38002 ?auto_38001 ) ) ( ON ?auto_38000 ?auto_38002 ) ( CLEAR ?auto_38000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37998 ?auto_37999 ?auto_38002 )
      ( MAKE-1PILE ?auto_37998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38003 - BLOCK
    )
    :vars
    (
      ?auto_38004 - BLOCK
      ?auto_38005 - BLOCK
      ?auto_38006 - BLOCK
      ?auto_38007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38004 ?auto_38003 ) ( ON-TABLE ?auto_38003 ) ( not ( = ?auto_38003 ?auto_38004 ) ) ( not ( = ?auto_38003 ?auto_38005 ) ) ( not ( = ?auto_38003 ?auto_38006 ) ) ( not ( = ?auto_38004 ?auto_38005 ) ) ( not ( = ?auto_38004 ?auto_38006 ) ) ( not ( = ?auto_38005 ?auto_38006 ) ) ( ON ?auto_38005 ?auto_38004 ) ( not ( = ?auto_38007 ?auto_38006 ) ) ( not ( = ?auto_38003 ?auto_38007 ) ) ( not ( = ?auto_38004 ?auto_38007 ) ) ( not ( = ?auto_38005 ?auto_38007 ) ) ( ON ?auto_38006 ?auto_38005 ) ( CLEAR ?auto_38006 ) ( HOLDING ?auto_38007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38007 )
      ( MAKE-1PILE ?auto_38003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38008 - BLOCK
    )
    :vars
    (
      ?auto_38011 - BLOCK
      ?auto_38012 - BLOCK
      ?auto_38009 - BLOCK
      ?auto_38010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38011 ?auto_38008 ) ( ON-TABLE ?auto_38008 ) ( not ( = ?auto_38008 ?auto_38011 ) ) ( not ( = ?auto_38008 ?auto_38012 ) ) ( not ( = ?auto_38008 ?auto_38009 ) ) ( not ( = ?auto_38011 ?auto_38012 ) ) ( not ( = ?auto_38011 ?auto_38009 ) ) ( not ( = ?auto_38012 ?auto_38009 ) ) ( ON ?auto_38012 ?auto_38011 ) ( not ( = ?auto_38010 ?auto_38009 ) ) ( not ( = ?auto_38008 ?auto_38010 ) ) ( not ( = ?auto_38011 ?auto_38010 ) ) ( not ( = ?auto_38012 ?auto_38010 ) ) ( ON ?auto_38009 ?auto_38012 ) ( ON ?auto_38010 ?auto_38009 ) ( CLEAR ?auto_38010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38008 ?auto_38011 ?auto_38012 ?auto_38009 )
      ( MAKE-1PILE ?auto_38008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38013 - BLOCK
    )
    :vars
    (
      ?auto_38016 - BLOCK
      ?auto_38017 - BLOCK
      ?auto_38014 - BLOCK
      ?auto_38015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38016 ?auto_38013 ) ( ON-TABLE ?auto_38013 ) ( not ( = ?auto_38013 ?auto_38016 ) ) ( not ( = ?auto_38013 ?auto_38017 ) ) ( not ( = ?auto_38013 ?auto_38014 ) ) ( not ( = ?auto_38016 ?auto_38017 ) ) ( not ( = ?auto_38016 ?auto_38014 ) ) ( not ( = ?auto_38017 ?auto_38014 ) ) ( ON ?auto_38017 ?auto_38016 ) ( not ( = ?auto_38015 ?auto_38014 ) ) ( not ( = ?auto_38013 ?auto_38015 ) ) ( not ( = ?auto_38016 ?auto_38015 ) ) ( not ( = ?auto_38017 ?auto_38015 ) ) ( ON ?auto_38014 ?auto_38017 ) ( HOLDING ?auto_38015 ) ( CLEAR ?auto_38014 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38013 ?auto_38016 ?auto_38017 ?auto_38014 ?auto_38015 )
      ( MAKE-1PILE ?auto_38013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38018 - BLOCK
    )
    :vars
    (
      ?auto_38020 - BLOCK
      ?auto_38022 - BLOCK
      ?auto_38019 - BLOCK
      ?auto_38021 - BLOCK
      ?auto_38023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38020 ?auto_38018 ) ( ON-TABLE ?auto_38018 ) ( not ( = ?auto_38018 ?auto_38020 ) ) ( not ( = ?auto_38018 ?auto_38022 ) ) ( not ( = ?auto_38018 ?auto_38019 ) ) ( not ( = ?auto_38020 ?auto_38022 ) ) ( not ( = ?auto_38020 ?auto_38019 ) ) ( not ( = ?auto_38022 ?auto_38019 ) ) ( ON ?auto_38022 ?auto_38020 ) ( not ( = ?auto_38021 ?auto_38019 ) ) ( not ( = ?auto_38018 ?auto_38021 ) ) ( not ( = ?auto_38020 ?auto_38021 ) ) ( not ( = ?auto_38022 ?auto_38021 ) ) ( ON ?auto_38019 ?auto_38022 ) ( CLEAR ?auto_38019 ) ( ON ?auto_38021 ?auto_38023 ) ( CLEAR ?auto_38021 ) ( HAND-EMPTY ) ( not ( = ?auto_38018 ?auto_38023 ) ) ( not ( = ?auto_38020 ?auto_38023 ) ) ( not ( = ?auto_38022 ?auto_38023 ) ) ( not ( = ?auto_38019 ?auto_38023 ) ) ( not ( = ?auto_38021 ?auto_38023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38021 ?auto_38023 )
      ( MAKE-1PILE ?auto_38018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38024 - BLOCK
    )
    :vars
    (
      ?auto_38029 - BLOCK
      ?auto_38028 - BLOCK
      ?auto_38027 - BLOCK
      ?auto_38026 - BLOCK
      ?auto_38025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38029 ?auto_38024 ) ( ON-TABLE ?auto_38024 ) ( not ( = ?auto_38024 ?auto_38029 ) ) ( not ( = ?auto_38024 ?auto_38028 ) ) ( not ( = ?auto_38024 ?auto_38027 ) ) ( not ( = ?auto_38029 ?auto_38028 ) ) ( not ( = ?auto_38029 ?auto_38027 ) ) ( not ( = ?auto_38028 ?auto_38027 ) ) ( ON ?auto_38028 ?auto_38029 ) ( not ( = ?auto_38026 ?auto_38027 ) ) ( not ( = ?auto_38024 ?auto_38026 ) ) ( not ( = ?auto_38029 ?auto_38026 ) ) ( not ( = ?auto_38028 ?auto_38026 ) ) ( ON ?auto_38026 ?auto_38025 ) ( CLEAR ?auto_38026 ) ( not ( = ?auto_38024 ?auto_38025 ) ) ( not ( = ?auto_38029 ?auto_38025 ) ) ( not ( = ?auto_38028 ?auto_38025 ) ) ( not ( = ?auto_38027 ?auto_38025 ) ) ( not ( = ?auto_38026 ?auto_38025 ) ) ( HOLDING ?auto_38027 ) ( CLEAR ?auto_38028 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38024 ?auto_38029 ?auto_38028 ?auto_38027 )
      ( MAKE-1PILE ?auto_38024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38030 - BLOCK
    )
    :vars
    (
      ?auto_38033 - BLOCK
      ?auto_38031 - BLOCK
      ?auto_38035 - BLOCK
      ?auto_38032 - BLOCK
      ?auto_38034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38033 ?auto_38030 ) ( ON-TABLE ?auto_38030 ) ( not ( = ?auto_38030 ?auto_38033 ) ) ( not ( = ?auto_38030 ?auto_38031 ) ) ( not ( = ?auto_38030 ?auto_38035 ) ) ( not ( = ?auto_38033 ?auto_38031 ) ) ( not ( = ?auto_38033 ?auto_38035 ) ) ( not ( = ?auto_38031 ?auto_38035 ) ) ( ON ?auto_38031 ?auto_38033 ) ( not ( = ?auto_38032 ?auto_38035 ) ) ( not ( = ?auto_38030 ?auto_38032 ) ) ( not ( = ?auto_38033 ?auto_38032 ) ) ( not ( = ?auto_38031 ?auto_38032 ) ) ( ON ?auto_38032 ?auto_38034 ) ( not ( = ?auto_38030 ?auto_38034 ) ) ( not ( = ?auto_38033 ?auto_38034 ) ) ( not ( = ?auto_38031 ?auto_38034 ) ) ( not ( = ?auto_38035 ?auto_38034 ) ) ( not ( = ?auto_38032 ?auto_38034 ) ) ( CLEAR ?auto_38031 ) ( ON ?auto_38035 ?auto_38032 ) ( CLEAR ?auto_38035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38034 ?auto_38032 )
      ( MAKE-1PILE ?auto_38030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38036 - BLOCK
    )
    :vars
    (
      ?auto_38040 - BLOCK
      ?auto_38037 - BLOCK
      ?auto_38038 - BLOCK
      ?auto_38041 - BLOCK
      ?auto_38039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38040 ?auto_38036 ) ( ON-TABLE ?auto_38036 ) ( not ( = ?auto_38036 ?auto_38040 ) ) ( not ( = ?auto_38036 ?auto_38037 ) ) ( not ( = ?auto_38036 ?auto_38038 ) ) ( not ( = ?auto_38040 ?auto_38037 ) ) ( not ( = ?auto_38040 ?auto_38038 ) ) ( not ( = ?auto_38037 ?auto_38038 ) ) ( not ( = ?auto_38041 ?auto_38038 ) ) ( not ( = ?auto_38036 ?auto_38041 ) ) ( not ( = ?auto_38040 ?auto_38041 ) ) ( not ( = ?auto_38037 ?auto_38041 ) ) ( ON ?auto_38041 ?auto_38039 ) ( not ( = ?auto_38036 ?auto_38039 ) ) ( not ( = ?auto_38040 ?auto_38039 ) ) ( not ( = ?auto_38037 ?auto_38039 ) ) ( not ( = ?auto_38038 ?auto_38039 ) ) ( not ( = ?auto_38041 ?auto_38039 ) ) ( ON ?auto_38038 ?auto_38041 ) ( CLEAR ?auto_38038 ) ( ON-TABLE ?auto_38039 ) ( HOLDING ?auto_38037 ) ( CLEAR ?auto_38040 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38036 ?auto_38040 ?auto_38037 )
      ( MAKE-1PILE ?auto_38036 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38042 - BLOCK
    )
    :vars
    (
      ?auto_38044 - BLOCK
      ?auto_38045 - BLOCK
      ?auto_38046 - BLOCK
      ?auto_38047 - BLOCK
      ?auto_38043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38044 ?auto_38042 ) ( ON-TABLE ?auto_38042 ) ( not ( = ?auto_38042 ?auto_38044 ) ) ( not ( = ?auto_38042 ?auto_38045 ) ) ( not ( = ?auto_38042 ?auto_38046 ) ) ( not ( = ?auto_38044 ?auto_38045 ) ) ( not ( = ?auto_38044 ?auto_38046 ) ) ( not ( = ?auto_38045 ?auto_38046 ) ) ( not ( = ?auto_38047 ?auto_38046 ) ) ( not ( = ?auto_38042 ?auto_38047 ) ) ( not ( = ?auto_38044 ?auto_38047 ) ) ( not ( = ?auto_38045 ?auto_38047 ) ) ( ON ?auto_38047 ?auto_38043 ) ( not ( = ?auto_38042 ?auto_38043 ) ) ( not ( = ?auto_38044 ?auto_38043 ) ) ( not ( = ?auto_38045 ?auto_38043 ) ) ( not ( = ?auto_38046 ?auto_38043 ) ) ( not ( = ?auto_38047 ?auto_38043 ) ) ( ON ?auto_38046 ?auto_38047 ) ( ON-TABLE ?auto_38043 ) ( CLEAR ?auto_38044 ) ( ON ?auto_38045 ?auto_38046 ) ( CLEAR ?auto_38045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38043 ?auto_38047 ?auto_38046 )
      ( MAKE-1PILE ?auto_38042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38060 - BLOCK
    )
    :vars
    (
      ?auto_38064 - BLOCK
      ?auto_38063 - BLOCK
      ?auto_38062 - BLOCK
      ?auto_38061 - BLOCK
      ?auto_38065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38060 ?auto_38064 ) ) ( not ( = ?auto_38060 ?auto_38063 ) ) ( not ( = ?auto_38060 ?auto_38062 ) ) ( not ( = ?auto_38064 ?auto_38063 ) ) ( not ( = ?auto_38064 ?auto_38062 ) ) ( not ( = ?auto_38063 ?auto_38062 ) ) ( not ( = ?auto_38061 ?auto_38062 ) ) ( not ( = ?auto_38060 ?auto_38061 ) ) ( not ( = ?auto_38064 ?auto_38061 ) ) ( not ( = ?auto_38063 ?auto_38061 ) ) ( ON ?auto_38061 ?auto_38065 ) ( not ( = ?auto_38060 ?auto_38065 ) ) ( not ( = ?auto_38064 ?auto_38065 ) ) ( not ( = ?auto_38063 ?auto_38065 ) ) ( not ( = ?auto_38062 ?auto_38065 ) ) ( not ( = ?auto_38061 ?auto_38065 ) ) ( ON ?auto_38062 ?auto_38061 ) ( ON-TABLE ?auto_38065 ) ( ON ?auto_38063 ?auto_38062 ) ( ON ?auto_38064 ?auto_38063 ) ( CLEAR ?auto_38064 ) ( HOLDING ?auto_38060 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38060 ?auto_38064 )
      ( MAKE-1PILE ?auto_38060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38066 - BLOCK
    )
    :vars
    (
      ?auto_38068 - BLOCK
      ?auto_38071 - BLOCK
      ?auto_38069 - BLOCK
      ?auto_38070 - BLOCK
      ?auto_38067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38066 ?auto_38068 ) ) ( not ( = ?auto_38066 ?auto_38071 ) ) ( not ( = ?auto_38066 ?auto_38069 ) ) ( not ( = ?auto_38068 ?auto_38071 ) ) ( not ( = ?auto_38068 ?auto_38069 ) ) ( not ( = ?auto_38071 ?auto_38069 ) ) ( not ( = ?auto_38070 ?auto_38069 ) ) ( not ( = ?auto_38066 ?auto_38070 ) ) ( not ( = ?auto_38068 ?auto_38070 ) ) ( not ( = ?auto_38071 ?auto_38070 ) ) ( ON ?auto_38070 ?auto_38067 ) ( not ( = ?auto_38066 ?auto_38067 ) ) ( not ( = ?auto_38068 ?auto_38067 ) ) ( not ( = ?auto_38071 ?auto_38067 ) ) ( not ( = ?auto_38069 ?auto_38067 ) ) ( not ( = ?auto_38070 ?auto_38067 ) ) ( ON ?auto_38069 ?auto_38070 ) ( ON-TABLE ?auto_38067 ) ( ON ?auto_38071 ?auto_38069 ) ( ON ?auto_38068 ?auto_38071 ) ( ON ?auto_38066 ?auto_38068 ) ( CLEAR ?auto_38066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38067 ?auto_38070 ?auto_38069 ?auto_38071 ?auto_38068 )
      ( MAKE-1PILE ?auto_38066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38076 - BLOCK
      ?auto_38077 - BLOCK
      ?auto_38078 - BLOCK
      ?auto_38079 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38079 ) ( CLEAR ?auto_38078 ) ( ON-TABLE ?auto_38076 ) ( ON ?auto_38077 ?auto_38076 ) ( ON ?auto_38078 ?auto_38077 ) ( not ( = ?auto_38076 ?auto_38077 ) ) ( not ( = ?auto_38076 ?auto_38078 ) ) ( not ( = ?auto_38076 ?auto_38079 ) ) ( not ( = ?auto_38077 ?auto_38078 ) ) ( not ( = ?auto_38077 ?auto_38079 ) ) ( not ( = ?auto_38078 ?auto_38079 ) ) )
    :subtasks
    ( ( !STACK ?auto_38079 ?auto_38078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38080 - BLOCK
      ?auto_38081 - BLOCK
      ?auto_38082 - BLOCK
      ?auto_38083 - BLOCK
    )
    :vars
    (
      ?auto_38084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38082 ) ( ON-TABLE ?auto_38080 ) ( ON ?auto_38081 ?auto_38080 ) ( ON ?auto_38082 ?auto_38081 ) ( not ( = ?auto_38080 ?auto_38081 ) ) ( not ( = ?auto_38080 ?auto_38082 ) ) ( not ( = ?auto_38080 ?auto_38083 ) ) ( not ( = ?auto_38081 ?auto_38082 ) ) ( not ( = ?auto_38081 ?auto_38083 ) ) ( not ( = ?auto_38082 ?auto_38083 ) ) ( ON ?auto_38083 ?auto_38084 ) ( CLEAR ?auto_38083 ) ( HAND-EMPTY ) ( not ( = ?auto_38080 ?auto_38084 ) ) ( not ( = ?auto_38081 ?auto_38084 ) ) ( not ( = ?auto_38082 ?auto_38084 ) ) ( not ( = ?auto_38083 ?auto_38084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38083 ?auto_38084 )
      ( MAKE-4PILE ?auto_38080 ?auto_38081 ?auto_38082 ?auto_38083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38085 - BLOCK
      ?auto_38086 - BLOCK
      ?auto_38087 - BLOCK
      ?auto_38088 - BLOCK
    )
    :vars
    (
      ?auto_38089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38085 ) ( ON ?auto_38086 ?auto_38085 ) ( not ( = ?auto_38085 ?auto_38086 ) ) ( not ( = ?auto_38085 ?auto_38087 ) ) ( not ( = ?auto_38085 ?auto_38088 ) ) ( not ( = ?auto_38086 ?auto_38087 ) ) ( not ( = ?auto_38086 ?auto_38088 ) ) ( not ( = ?auto_38087 ?auto_38088 ) ) ( ON ?auto_38088 ?auto_38089 ) ( CLEAR ?auto_38088 ) ( not ( = ?auto_38085 ?auto_38089 ) ) ( not ( = ?auto_38086 ?auto_38089 ) ) ( not ( = ?auto_38087 ?auto_38089 ) ) ( not ( = ?auto_38088 ?auto_38089 ) ) ( HOLDING ?auto_38087 ) ( CLEAR ?auto_38086 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38085 ?auto_38086 ?auto_38087 )
      ( MAKE-4PILE ?auto_38085 ?auto_38086 ?auto_38087 ?auto_38088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38090 - BLOCK
      ?auto_38091 - BLOCK
      ?auto_38092 - BLOCK
      ?auto_38093 - BLOCK
    )
    :vars
    (
      ?auto_38094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38090 ) ( ON ?auto_38091 ?auto_38090 ) ( not ( = ?auto_38090 ?auto_38091 ) ) ( not ( = ?auto_38090 ?auto_38092 ) ) ( not ( = ?auto_38090 ?auto_38093 ) ) ( not ( = ?auto_38091 ?auto_38092 ) ) ( not ( = ?auto_38091 ?auto_38093 ) ) ( not ( = ?auto_38092 ?auto_38093 ) ) ( ON ?auto_38093 ?auto_38094 ) ( not ( = ?auto_38090 ?auto_38094 ) ) ( not ( = ?auto_38091 ?auto_38094 ) ) ( not ( = ?auto_38092 ?auto_38094 ) ) ( not ( = ?auto_38093 ?auto_38094 ) ) ( CLEAR ?auto_38091 ) ( ON ?auto_38092 ?auto_38093 ) ( CLEAR ?auto_38092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38094 ?auto_38093 )
      ( MAKE-4PILE ?auto_38090 ?auto_38091 ?auto_38092 ?auto_38093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38095 - BLOCK
      ?auto_38096 - BLOCK
      ?auto_38097 - BLOCK
      ?auto_38098 - BLOCK
    )
    :vars
    (
      ?auto_38099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38095 ) ( not ( = ?auto_38095 ?auto_38096 ) ) ( not ( = ?auto_38095 ?auto_38097 ) ) ( not ( = ?auto_38095 ?auto_38098 ) ) ( not ( = ?auto_38096 ?auto_38097 ) ) ( not ( = ?auto_38096 ?auto_38098 ) ) ( not ( = ?auto_38097 ?auto_38098 ) ) ( ON ?auto_38098 ?auto_38099 ) ( not ( = ?auto_38095 ?auto_38099 ) ) ( not ( = ?auto_38096 ?auto_38099 ) ) ( not ( = ?auto_38097 ?auto_38099 ) ) ( not ( = ?auto_38098 ?auto_38099 ) ) ( ON ?auto_38097 ?auto_38098 ) ( CLEAR ?auto_38097 ) ( ON-TABLE ?auto_38099 ) ( HOLDING ?auto_38096 ) ( CLEAR ?auto_38095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38095 ?auto_38096 )
      ( MAKE-4PILE ?auto_38095 ?auto_38096 ?auto_38097 ?auto_38098 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38100 - BLOCK
      ?auto_38101 - BLOCK
      ?auto_38102 - BLOCK
      ?auto_38103 - BLOCK
    )
    :vars
    (
      ?auto_38104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38100 ) ( not ( = ?auto_38100 ?auto_38101 ) ) ( not ( = ?auto_38100 ?auto_38102 ) ) ( not ( = ?auto_38100 ?auto_38103 ) ) ( not ( = ?auto_38101 ?auto_38102 ) ) ( not ( = ?auto_38101 ?auto_38103 ) ) ( not ( = ?auto_38102 ?auto_38103 ) ) ( ON ?auto_38103 ?auto_38104 ) ( not ( = ?auto_38100 ?auto_38104 ) ) ( not ( = ?auto_38101 ?auto_38104 ) ) ( not ( = ?auto_38102 ?auto_38104 ) ) ( not ( = ?auto_38103 ?auto_38104 ) ) ( ON ?auto_38102 ?auto_38103 ) ( ON-TABLE ?auto_38104 ) ( CLEAR ?auto_38100 ) ( ON ?auto_38101 ?auto_38102 ) ( CLEAR ?auto_38101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38104 ?auto_38103 ?auto_38102 )
      ( MAKE-4PILE ?auto_38100 ?auto_38101 ?auto_38102 ?auto_38103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38105 - BLOCK
      ?auto_38106 - BLOCK
      ?auto_38107 - BLOCK
      ?auto_38108 - BLOCK
    )
    :vars
    (
      ?auto_38109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38105 ?auto_38106 ) ) ( not ( = ?auto_38105 ?auto_38107 ) ) ( not ( = ?auto_38105 ?auto_38108 ) ) ( not ( = ?auto_38106 ?auto_38107 ) ) ( not ( = ?auto_38106 ?auto_38108 ) ) ( not ( = ?auto_38107 ?auto_38108 ) ) ( ON ?auto_38108 ?auto_38109 ) ( not ( = ?auto_38105 ?auto_38109 ) ) ( not ( = ?auto_38106 ?auto_38109 ) ) ( not ( = ?auto_38107 ?auto_38109 ) ) ( not ( = ?auto_38108 ?auto_38109 ) ) ( ON ?auto_38107 ?auto_38108 ) ( ON-TABLE ?auto_38109 ) ( ON ?auto_38106 ?auto_38107 ) ( CLEAR ?auto_38106 ) ( HOLDING ?auto_38105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38105 )
      ( MAKE-4PILE ?auto_38105 ?auto_38106 ?auto_38107 ?auto_38108 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38110 - BLOCK
      ?auto_38111 - BLOCK
      ?auto_38112 - BLOCK
      ?auto_38113 - BLOCK
    )
    :vars
    (
      ?auto_38114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38110 ?auto_38111 ) ) ( not ( = ?auto_38110 ?auto_38112 ) ) ( not ( = ?auto_38110 ?auto_38113 ) ) ( not ( = ?auto_38111 ?auto_38112 ) ) ( not ( = ?auto_38111 ?auto_38113 ) ) ( not ( = ?auto_38112 ?auto_38113 ) ) ( ON ?auto_38113 ?auto_38114 ) ( not ( = ?auto_38110 ?auto_38114 ) ) ( not ( = ?auto_38111 ?auto_38114 ) ) ( not ( = ?auto_38112 ?auto_38114 ) ) ( not ( = ?auto_38113 ?auto_38114 ) ) ( ON ?auto_38112 ?auto_38113 ) ( ON-TABLE ?auto_38114 ) ( ON ?auto_38111 ?auto_38112 ) ( ON ?auto_38110 ?auto_38111 ) ( CLEAR ?auto_38110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38114 ?auto_38113 ?auto_38112 ?auto_38111 )
      ( MAKE-4PILE ?auto_38110 ?auto_38111 ?auto_38112 ?auto_38113 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38115 - BLOCK
      ?auto_38116 - BLOCK
      ?auto_38117 - BLOCK
      ?auto_38118 - BLOCK
    )
    :vars
    (
      ?auto_38119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38115 ?auto_38116 ) ) ( not ( = ?auto_38115 ?auto_38117 ) ) ( not ( = ?auto_38115 ?auto_38118 ) ) ( not ( = ?auto_38116 ?auto_38117 ) ) ( not ( = ?auto_38116 ?auto_38118 ) ) ( not ( = ?auto_38117 ?auto_38118 ) ) ( ON ?auto_38118 ?auto_38119 ) ( not ( = ?auto_38115 ?auto_38119 ) ) ( not ( = ?auto_38116 ?auto_38119 ) ) ( not ( = ?auto_38117 ?auto_38119 ) ) ( not ( = ?auto_38118 ?auto_38119 ) ) ( ON ?auto_38117 ?auto_38118 ) ( ON-TABLE ?auto_38119 ) ( ON ?auto_38116 ?auto_38117 ) ( HOLDING ?auto_38115 ) ( CLEAR ?auto_38116 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38119 ?auto_38118 ?auto_38117 ?auto_38116 ?auto_38115 )
      ( MAKE-4PILE ?auto_38115 ?auto_38116 ?auto_38117 ?auto_38118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38120 - BLOCK
      ?auto_38121 - BLOCK
      ?auto_38122 - BLOCK
      ?auto_38123 - BLOCK
    )
    :vars
    (
      ?auto_38124 - BLOCK
      ?auto_38125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38120 ?auto_38121 ) ) ( not ( = ?auto_38120 ?auto_38122 ) ) ( not ( = ?auto_38120 ?auto_38123 ) ) ( not ( = ?auto_38121 ?auto_38122 ) ) ( not ( = ?auto_38121 ?auto_38123 ) ) ( not ( = ?auto_38122 ?auto_38123 ) ) ( ON ?auto_38123 ?auto_38124 ) ( not ( = ?auto_38120 ?auto_38124 ) ) ( not ( = ?auto_38121 ?auto_38124 ) ) ( not ( = ?auto_38122 ?auto_38124 ) ) ( not ( = ?auto_38123 ?auto_38124 ) ) ( ON ?auto_38122 ?auto_38123 ) ( ON-TABLE ?auto_38124 ) ( ON ?auto_38121 ?auto_38122 ) ( CLEAR ?auto_38121 ) ( ON ?auto_38120 ?auto_38125 ) ( CLEAR ?auto_38120 ) ( HAND-EMPTY ) ( not ( = ?auto_38120 ?auto_38125 ) ) ( not ( = ?auto_38121 ?auto_38125 ) ) ( not ( = ?auto_38122 ?auto_38125 ) ) ( not ( = ?auto_38123 ?auto_38125 ) ) ( not ( = ?auto_38124 ?auto_38125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38120 ?auto_38125 )
      ( MAKE-4PILE ?auto_38120 ?auto_38121 ?auto_38122 ?auto_38123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38126 - BLOCK
      ?auto_38127 - BLOCK
      ?auto_38128 - BLOCK
      ?auto_38129 - BLOCK
    )
    :vars
    (
      ?auto_38131 - BLOCK
      ?auto_38130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38126 ?auto_38127 ) ) ( not ( = ?auto_38126 ?auto_38128 ) ) ( not ( = ?auto_38126 ?auto_38129 ) ) ( not ( = ?auto_38127 ?auto_38128 ) ) ( not ( = ?auto_38127 ?auto_38129 ) ) ( not ( = ?auto_38128 ?auto_38129 ) ) ( ON ?auto_38129 ?auto_38131 ) ( not ( = ?auto_38126 ?auto_38131 ) ) ( not ( = ?auto_38127 ?auto_38131 ) ) ( not ( = ?auto_38128 ?auto_38131 ) ) ( not ( = ?auto_38129 ?auto_38131 ) ) ( ON ?auto_38128 ?auto_38129 ) ( ON-TABLE ?auto_38131 ) ( ON ?auto_38126 ?auto_38130 ) ( CLEAR ?auto_38126 ) ( not ( = ?auto_38126 ?auto_38130 ) ) ( not ( = ?auto_38127 ?auto_38130 ) ) ( not ( = ?auto_38128 ?auto_38130 ) ) ( not ( = ?auto_38129 ?auto_38130 ) ) ( not ( = ?auto_38131 ?auto_38130 ) ) ( HOLDING ?auto_38127 ) ( CLEAR ?auto_38128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38131 ?auto_38129 ?auto_38128 ?auto_38127 )
      ( MAKE-4PILE ?auto_38126 ?auto_38127 ?auto_38128 ?auto_38129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38132 - BLOCK
      ?auto_38133 - BLOCK
      ?auto_38134 - BLOCK
      ?auto_38135 - BLOCK
    )
    :vars
    (
      ?auto_38137 - BLOCK
      ?auto_38136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38132 ?auto_38133 ) ) ( not ( = ?auto_38132 ?auto_38134 ) ) ( not ( = ?auto_38132 ?auto_38135 ) ) ( not ( = ?auto_38133 ?auto_38134 ) ) ( not ( = ?auto_38133 ?auto_38135 ) ) ( not ( = ?auto_38134 ?auto_38135 ) ) ( ON ?auto_38135 ?auto_38137 ) ( not ( = ?auto_38132 ?auto_38137 ) ) ( not ( = ?auto_38133 ?auto_38137 ) ) ( not ( = ?auto_38134 ?auto_38137 ) ) ( not ( = ?auto_38135 ?auto_38137 ) ) ( ON ?auto_38134 ?auto_38135 ) ( ON-TABLE ?auto_38137 ) ( ON ?auto_38132 ?auto_38136 ) ( not ( = ?auto_38132 ?auto_38136 ) ) ( not ( = ?auto_38133 ?auto_38136 ) ) ( not ( = ?auto_38134 ?auto_38136 ) ) ( not ( = ?auto_38135 ?auto_38136 ) ) ( not ( = ?auto_38137 ?auto_38136 ) ) ( CLEAR ?auto_38134 ) ( ON ?auto_38133 ?auto_38132 ) ( CLEAR ?auto_38133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38136 ?auto_38132 )
      ( MAKE-4PILE ?auto_38132 ?auto_38133 ?auto_38134 ?auto_38135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38138 - BLOCK
      ?auto_38139 - BLOCK
      ?auto_38140 - BLOCK
      ?auto_38141 - BLOCK
    )
    :vars
    (
      ?auto_38143 - BLOCK
      ?auto_38142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38138 ?auto_38139 ) ) ( not ( = ?auto_38138 ?auto_38140 ) ) ( not ( = ?auto_38138 ?auto_38141 ) ) ( not ( = ?auto_38139 ?auto_38140 ) ) ( not ( = ?auto_38139 ?auto_38141 ) ) ( not ( = ?auto_38140 ?auto_38141 ) ) ( ON ?auto_38141 ?auto_38143 ) ( not ( = ?auto_38138 ?auto_38143 ) ) ( not ( = ?auto_38139 ?auto_38143 ) ) ( not ( = ?auto_38140 ?auto_38143 ) ) ( not ( = ?auto_38141 ?auto_38143 ) ) ( ON-TABLE ?auto_38143 ) ( ON ?auto_38138 ?auto_38142 ) ( not ( = ?auto_38138 ?auto_38142 ) ) ( not ( = ?auto_38139 ?auto_38142 ) ) ( not ( = ?auto_38140 ?auto_38142 ) ) ( not ( = ?auto_38141 ?auto_38142 ) ) ( not ( = ?auto_38143 ?auto_38142 ) ) ( ON ?auto_38139 ?auto_38138 ) ( CLEAR ?auto_38139 ) ( ON-TABLE ?auto_38142 ) ( HOLDING ?auto_38140 ) ( CLEAR ?auto_38141 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38143 ?auto_38141 ?auto_38140 )
      ( MAKE-4PILE ?auto_38138 ?auto_38139 ?auto_38140 ?auto_38141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38144 - BLOCK
      ?auto_38145 - BLOCK
      ?auto_38146 - BLOCK
      ?auto_38147 - BLOCK
    )
    :vars
    (
      ?auto_38148 - BLOCK
      ?auto_38149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38144 ?auto_38145 ) ) ( not ( = ?auto_38144 ?auto_38146 ) ) ( not ( = ?auto_38144 ?auto_38147 ) ) ( not ( = ?auto_38145 ?auto_38146 ) ) ( not ( = ?auto_38145 ?auto_38147 ) ) ( not ( = ?auto_38146 ?auto_38147 ) ) ( ON ?auto_38147 ?auto_38148 ) ( not ( = ?auto_38144 ?auto_38148 ) ) ( not ( = ?auto_38145 ?auto_38148 ) ) ( not ( = ?auto_38146 ?auto_38148 ) ) ( not ( = ?auto_38147 ?auto_38148 ) ) ( ON-TABLE ?auto_38148 ) ( ON ?auto_38144 ?auto_38149 ) ( not ( = ?auto_38144 ?auto_38149 ) ) ( not ( = ?auto_38145 ?auto_38149 ) ) ( not ( = ?auto_38146 ?auto_38149 ) ) ( not ( = ?auto_38147 ?auto_38149 ) ) ( not ( = ?auto_38148 ?auto_38149 ) ) ( ON ?auto_38145 ?auto_38144 ) ( ON-TABLE ?auto_38149 ) ( CLEAR ?auto_38147 ) ( ON ?auto_38146 ?auto_38145 ) ( CLEAR ?auto_38146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38149 ?auto_38144 ?auto_38145 )
      ( MAKE-4PILE ?auto_38144 ?auto_38145 ?auto_38146 ?auto_38147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38150 - BLOCK
      ?auto_38151 - BLOCK
      ?auto_38152 - BLOCK
      ?auto_38153 - BLOCK
    )
    :vars
    (
      ?auto_38155 - BLOCK
      ?auto_38154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38150 ?auto_38151 ) ) ( not ( = ?auto_38150 ?auto_38152 ) ) ( not ( = ?auto_38150 ?auto_38153 ) ) ( not ( = ?auto_38151 ?auto_38152 ) ) ( not ( = ?auto_38151 ?auto_38153 ) ) ( not ( = ?auto_38152 ?auto_38153 ) ) ( not ( = ?auto_38150 ?auto_38155 ) ) ( not ( = ?auto_38151 ?auto_38155 ) ) ( not ( = ?auto_38152 ?auto_38155 ) ) ( not ( = ?auto_38153 ?auto_38155 ) ) ( ON-TABLE ?auto_38155 ) ( ON ?auto_38150 ?auto_38154 ) ( not ( = ?auto_38150 ?auto_38154 ) ) ( not ( = ?auto_38151 ?auto_38154 ) ) ( not ( = ?auto_38152 ?auto_38154 ) ) ( not ( = ?auto_38153 ?auto_38154 ) ) ( not ( = ?auto_38155 ?auto_38154 ) ) ( ON ?auto_38151 ?auto_38150 ) ( ON-TABLE ?auto_38154 ) ( ON ?auto_38152 ?auto_38151 ) ( CLEAR ?auto_38152 ) ( HOLDING ?auto_38153 ) ( CLEAR ?auto_38155 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38155 ?auto_38153 )
      ( MAKE-4PILE ?auto_38150 ?auto_38151 ?auto_38152 ?auto_38153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38156 - BLOCK
      ?auto_38157 - BLOCK
      ?auto_38158 - BLOCK
      ?auto_38159 - BLOCK
    )
    :vars
    (
      ?auto_38161 - BLOCK
      ?auto_38160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38156 ?auto_38157 ) ) ( not ( = ?auto_38156 ?auto_38158 ) ) ( not ( = ?auto_38156 ?auto_38159 ) ) ( not ( = ?auto_38157 ?auto_38158 ) ) ( not ( = ?auto_38157 ?auto_38159 ) ) ( not ( = ?auto_38158 ?auto_38159 ) ) ( not ( = ?auto_38156 ?auto_38161 ) ) ( not ( = ?auto_38157 ?auto_38161 ) ) ( not ( = ?auto_38158 ?auto_38161 ) ) ( not ( = ?auto_38159 ?auto_38161 ) ) ( ON-TABLE ?auto_38161 ) ( ON ?auto_38156 ?auto_38160 ) ( not ( = ?auto_38156 ?auto_38160 ) ) ( not ( = ?auto_38157 ?auto_38160 ) ) ( not ( = ?auto_38158 ?auto_38160 ) ) ( not ( = ?auto_38159 ?auto_38160 ) ) ( not ( = ?auto_38161 ?auto_38160 ) ) ( ON ?auto_38157 ?auto_38156 ) ( ON-TABLE ?auto_38160 ) ( ON ?auto_38158 ?auto_38157 ) ( CLEAR ?auto_38161 ) ( ON ?auto_38159 ?auto_38158 ) ( CLEAR ?auto_38159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38160 ?auto_38156 ?auto_38157 ?auto_38158 )
      ( MAKE-4PILE ?auto_38156 ?auto_38157 ?auto_38158 ?auto_38159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38162 - BLOCK
      ?auto_38163 - BLOCK
      ?auto_38164 - BLOCK
      ?auto_38165 - BLOCK
    )
    :vars
    (
      ?auto_38167 - BLOCK
      ?auto_38166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38162 ?auto_38163 ) ) ( not ( = ?auto_38162 ?auto_38164 ) ) ( not ( = ?auto_38162 ?auto_38165 ) ) ( not ( = ?auto_38163 ?auto_38164 ) ) ( not ( = ?auto_38163 ?auto_38165 ) ) ( not ( = ?auto_38164 ?auto_38165 ) ) ( not ( = ?auto_38162 ?auto_38167 ) ) ( not ( = ?auto_38163 ?auto_38167 ) ) ( not ( = ?auto_38164 ?auto_38167 ) ) ( not ( = ?auto_38165 ?auto_38167 ) ) ( ON ?auto_38162 ?auto_38166 ) ( not ( = ?auto_38162 ?auto_38166 ) ) ( not ( = ?auto_38163 ?auto_38166 ) ) ( not ( = ?auto_38164 ?auto_38166 ) ) ( not ( = ?auto_38165 ?auto_38166 ) ) ( not ( = ?auto_38167 ?auto_38166 ) ) ( ON ?auto_38163 ?auto_38162 ) ( ON-TABLE ?auto_38166 ) ( ON ?auto_38164 ?auto_38163 ) ( ON ?auto_38165 ?auto_38164 ) ( CLEAR ?auto_38165 ) ( HOLDING ?auto_38167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38167 )
      ( MAKE-4PILE ?auto_38162 ?auto_38163 ?auto_38164 ?auto_38165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38168 - BLOCK
      ?auto_38169 - BLOCK
      ?auto_38170 - BLOCK
      ?auto_38171 - BLOCK
    )
    :vars
    (
      ?auto_38173 - BLOCK
      ?auto_38172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38168 ?auto_38169 ) ) ( not ( = ?auto_38168 ?auto_38170 ) ) ( not ( = ?auto_38168 ?auto_38171 ) ) ( not ( = ?auto_38169 ?auto_38170 ) ) ( not ( = ?auto_38169 ?auto_38171 ) ) ( not ( = ?auto_38170 ?auto_38171 ) ) ( not ( = ?auto_38168 ?auto_38173 ) ) ( not ( = ?auto_38169 ?auto_38173 ) ) ( not ( = ?auto_38170 ?auto_38173 ) ) ( not ( = ?auto_38171 ?auto_38173 ) ) ( ON ?auto_38168 ?auto_38172 ) ( not ( = ?auto_38168 ?auto_38172 ) ) ( not ( = ?auto_38169 ?auto_38172 ) ) ( not ( = ?auto_38170 ?auto_38172 ) ) ( not ( = ?auto_38171 ?auto_38172 ) ) ( not ( = ?auto_38173 ?auto_38172 ) ) ( ON ?auto_38169 ?auto_38168 ) ( ON-TABLE ?auto_38172 ) ( ON ?auto_38170 ?auto_38169 ) ( ON ?auto_38171 ?auto_38170 ) ( ON ?auto_38173 ?auto_38171 ) ( CLEAR ?auto_38173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38172 ?auto_38168 ?auto_38169 ?auto_38170 ?auto_38171 )
      ( MAKE-4PILE ?auto_38168 ?auto_38169 ?auto_38170 ?auto_38171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38179 - BLOCK
      ?auto_38180 - BLOCK
      ?auto_38181 - BLOCK
      ?auto_38182 - BLOCK
      ?auto_38183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38183 ) ( CLEAR ?auto_38182 ) ( ON-TABLE ?auto_38179 ) ( ON ?auto_38180 ?auto_38179 ) ( ON ?auto_38181 ?auto_38180 ) ( ON ?auto_38182 ?auto_38181 ) ( not ( = ?auto_38179 ?auto_38180 ) ) ( not ( = ?auto_38179 ?auto_38181 ) ) ( not ( = ?auto_38179 ?auto_38182 ) ) ( not ( = ?auto_38179 ?auto_38183 ) ) ( not ( = ?auto_38180 ?auto_38181 ) ) ( not ( = ?auto_38180 ?auto_38182 ) ) ( not ( = ?auto_38180 ?auto_38183 ) ) ( not ( = ?auto_38181 ?auto_38182 ) ) ( not ( = ?auto_38181 ?auto_38183 ) ) ( not ( = ?auto_38182 ?auto_38183 ) ) )
    :subtasks
    ( ( !STACK ?auto_38183 ?auto_38182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38184 - BLOCK
      ?auto_38185 - BLOCK
      ?auto_38186 - BLOCK
      ?auto_38187 - BLOCK
      ?auto_38188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38187 ) ( ON-TABLE ?auto_38184 ) ( ON ?auto_38185 ?auto_38184 ) ( ON ?auto_38186 ?auto_38185 ) ( ON ?auto_38187 ?auto_38186 ) ( not ( = ?auto_38184 ?auto_38185 ) ) ( not ( = ?auto_38184 ?auto_38186 ) ) ( not ( = ?auto_38184 ?auto_38187 ) ) ( not ( = ?auto_38184 ?auto_38188 ) ) ( not ( = ?auto_38185 ?auto_38186 ) ) ( not ( = ?auto_38185 ?auto_38187 ) ) ( not ( = ?auto_38185 ?auto_38188 ) ) ( not ( = ?auto_38186 ?auto_38187 ) ) ( not ( = ?auto_38186 ?auto_38188 ) ) ( not ( = ?auto_38187 ?auto_38188 ) ) ( ON-TABLE ?auto_38188 ) ( CLEAR ?auto_38188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_38188 )
      ( MAKE-5PILE ?auto_38184 ?auto_38185 ?auto_38186 ?auto_38187 ?auto_38188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38189 - BLOCK
      ?auto_38190 - BLOCK
      ?auto_38191 - BLOCK
      ?auto_38192 - BLOCK
      ?auto_38193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38189 ) ( ON ?auto_38190 ?auto_38189 ) ( ON ?auto_38191 ?auto_38190 ) ( not ( = ?auto_38189 ?auto_38190 ) ) ( not ( = ?auto_38189 ?auto_38191 ) ) ( not ( = ?auto_38189 ?auto_38192 ) ) ( not ( = ?auto_38189 ?auto_38193 ) ) ( not ( = ?auto_38190 ?auto_38191 ) ) ( not ( = ?auto_38190 ?auto_38192 ) ) ( not ( = ?auto_38190 ?auto_38193 ) ) ( not ( = ?auto_38191 ?auto_38192 ) ) ( not ( = ?auto_38191 ?auto_38193 ) ) ( not ( = ?auto_38192 ?auto_38193 ) ) ( ON-TABLE ?auto_38193 ) ( CLEAR ?auto_38193 ) ( HOLDING ?auto_38192 ) ( CLEAR ?auto_38191 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38189 ?auto_38190 ?auto_38191 ?auto_38192 )
      ( MAKE-5PILE ?auto_38189 ?auto_38190 ?auto_38191 ?auto_38192 ?auto_38193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38194 - BLOCK
      ?auto_38195 - BLOCK
      ?auto_38196 - BLOCK
      ?auto_38197 - BLOCK
      ?auto_38198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38194 ) ( ON ?auto_38195 ?auto_38194 ) ( ON ?auto_38196 ?auto_38195 ) ( not ( = ?auto_38194 ?auto_38195 ) ) ( not ( = ?auto_38194 ?auto_38196 ) ) ( not ( = ?auto_38194 ?auto_38197 ) ) ( not ( = ?auto_38194 ?auto_38198 ) ) ( not ( = ?auto_38195 ?auto_38196 ) ) ( not ( = ?auto_38195 ?auto_38197 ) ) ( not ( = ?auto_38195 ?auto_38198 ) ) ( not ( = ?auto_38196 ?auto_38197 ) ) ( not ( = ?auto_38196 ?auto_38198 ) ) ( not ( = ?auto_38197 ?auto_38198 ) ) ( ON-TABLE ?auto_38198 ) ( CLEAR ?auto_38196 ) ( ON ?auto_38197 ?auto_38198 ) ( CLEAR ?auto_38197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38198 )
      ( MAKE-5PILE ?auto_38194 ?auto_38195 ?auto_38196 ?auto_38197 ?auto_38198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38199 - BLOCK
      ?auto_38200 - BLOCK
      ?auto_38201 - BLOCK
      ?auto_38202 - BLOCK
      ?auto_38203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38199 ) ( ON ?auto_38200 ?auto_38199 ) ( not ( = ?auto_38199 ?auto_38200 ) ) ( not ( = ?auto_38199 ?auto_38201 ) ) ( not ( = ?auto_38199 ?auto_38202 ) ) ( not ( = ?auto_38199 ?auto_38203 ) ) ( not ( = ?auto_38200 ?auto_38201 ) ) ( not ( = ?auto_38200 ?auto_38202 ) ) ( not ( = ?auto_38200 ?auto_38203 ) ) ( not ( = ?auto_38201 ?auto_38202 ) ) ( not ( = ?auto_38201 ?auto_38203 ) ) ( not ( = ?auto_38202 ?auto_38203 ) ) ( ON-TABLE ?auto_38203 ) ( ON ?auto_38202 ?auto_38203 ) ( CLEAR ?auto_38202 ) ( HOLDING ?auto_38201 ) ( CLEAR ?auto_38200 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38199 ?auto_38200 ?auto_38201 )
      ( MAKE-5PILE ?auto_38199 ?auto_38200 ?auto_38201 ?auto_38202 ?auto_38203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38204 - BLOCK
      ?auto_38205 - BLOCK
      ?auto_38206 - BLOCK
      ?auto_38207 - BLOCK
      ?auto_38208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38204 ) ( ON ?auto_38205 ?auto_38204 ) ( not ( = ?auto_38204 ?auto_38205 ) ) ( not ( = ?auto_38204 ?auto_38206 ) ) ( not ( = ?auto_38204 ?auto_38207 ) ) ( not ( = ?auto_38204 ?auto_38208 ) ) ( not ( = ?auto_38205 ?auto_38206 ) ) ( not ( = ?auto_38205 ?auto_38207 ) ) ( not ( = ?auto_38205 ?auto_38208 ) ) ( not ( = ?auto_38206 ?auto_38207 ) ) ( not ( = ?auto_38206 ?auto_38208 ) ) ( not ( = ?auto_38207 ?auto_38208 ) ) ( ON-TABLE ?auto_38208 ) ( ON ?auto_38207 ?auto_38208 ) ( CLEAR ?auto_38205 ) ( ON ?auto_38206 ?auto_38207 ) ( CLEAR ?auto_38206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38208 ?auto_38207 )
      ( MAKE-5PILE ?auto_38204 ?auto_38205 ?auto_38206 ?auto_38207 ?auto_38208 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38209 - BLOCK
      ?auto_38210 - BLOCK
      ?auto_38211 - BLOCK
      ?auto_38212 - BLOCK
      ?auto_38213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38209 ) ( not ( = ?auto_38209 ?auto_38210 ) ) ( not ( = ?auto_38209 ?auto_38211 ) ) ( not ( = ?auto_38209 ?auto_38212 ) ) ( not ( = ?auto_38209 ?auto_38213 ) ) ( not ( = ?auto_38210 ?auto_38211 ) ) ( not ( = ?auto_38210 ?auto_38212 ) ) ( not ( = ?auto_38210 ?auto_38213 ) ) ( not ( = ?auto_38211 ?auto_38212 ) ) ( not ( = ?auto_38211 ?auto_38213 ) ) ( not ( = ?auto_38212 ?auto_38213 ) ) ( ON-TABLE ?auto_38213 ) ( ON ?auto_38212 ?auto_38213 ) ( ON ?auto_38211 ?auto_38212 ) ( CLEAR ?auto_38211 ) ( HOLDING ?auto_38210 ) ( CLEAR ?auto_38209 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38209 ?auto_38210 )
      ( MAKE-5PILE ?auto_38209 ?auto_38210 ?auto_38211 ?auto_38212 ?auto_38213 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38214 - BLOCK
      ?auto_38215 - BLOCK
      ?auto_38216 - BLOCK
      ?auto_38217 - BLOCK
      ?auto_38218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38214 ) ( not ( = ?auto_38214 ?auto_38215 ) ) ( not ( = ?auto_38214 ?auto_38216 ) ) ( not ( = ?auto_38214 ?auto_38217 ) ) ( not ( = ?auto_38214 ?auto_38218 ) ) ( not ( = ?auto_38215 ?auto_38216 ) ) ( not ( = ?auto_38215 ?auto_38217 ) ) ( not ( = ?auto_38215 ?auto_38218 ) ) ( not ( = ?auto_38216 ?auto_38217 ) ) ( not ( = ?auto_38216 ?auto_38218 ) ) ( not ( = ?auto_38217 ?auto_38218 ) ) ( ON-TABLE ?auto_38218 ) ( ON ?auto_38217 ?auto_38218 ) ( ON ?auto_38216 ?auto_38217 ) ( CLEAR ?auto_38214 ) ( ON ?auto_38215 ?auto_38216 ) ( CLEAR ?auto_38215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38218 ?auto_38217 ?auto_38216 )
      ( MAKE-5PILE ?auto_38214 ?auto_38215 ?auto_38216 ?auto_38217 ?auto_38218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38219 - BLOCK
      ?auto_38220 - BLOCK
      ?auto_38221 - BLOCK
      ?auto_38222 - BLOCK
      ?auto_38223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38219 ?auto_38220 ) ) ( not ( = ?auto_38219 ?auto_38221 ) ) ( not ( = ?auto_38219 ?auto_38222 ) ) ( not ( = ?auto_38219 ?auto_38223 ) ) ( not ( = ?auto_38220 ?auto_38221 ) ) ( not ( = ?auto_38220 ?auto_38222 ) ) ( not ( = ?auto_38220 ?auto_38223 ) ) ( not ( = ?auto_38221 ?auto_38222 ) ) ( not ( = ?auto_38221 ?auto_38223 ) ) ( not ( = ?auto_38222 ?auto_38223 ) ) ( ON-TABLE ?auto_38223 ) ( ON ?auto_38222 ?auto_38223 ) ( ON ?auto_38221 ?auto_38222 ) ( ON ?auto_38220 ?auto_38221 ) ( CLEAR ?auto_38220 ) ( HOLDING ?auto_38219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38219 )
      ( MAKE-5PILE ?auto_38219 ?auto_38220 ?auto_38221 ?auto_38222 ?auto_38223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38224 - BLOCK
      ?auto_38225 - BLOCK
      ?auto_38226 - BLOCK
      ?auto_38227 - BLOCK
      ?auto_38228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38224 ?auto_38225 ) ) ( not ( = ?auto_38224 ?auto_38226 ) ) ( not ( = ?auto_38224 ?auto_38227 ) ) ( not ( = ?auto_38224 ?auto_38228 ) ) ( not ( = ?auto_38225 ?auto_38226 ) ) ( not ( = ?auto_38225 ?auto_38227 ) ) ( not ( = ?auto_38225 ?auto_38228 ) ) ( not ( = ?auto_38226 ?auto_38227 ) ) ( not ( = ?auto_38226 ?auto_38228 ) ) ( not ( = ?auto_38227 ?auto_38228 ) ) ( ON-TABLE ?auto_38228 ) ( ON ?auto_38227 ?auto_38228 ) ( ON ?auto_38226 ?auto_38227 ) ( ON ?auto_38225 ?auto_38226 ) ( ON ?auto_38224 ?auto_38225 ) ( CLEAR ?auto_38224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38228 ?auto_38227 ?auto_38226 ?auto_38225 )
      ( MAKE-5PILE ?auto_38224 ?auto_38225 ?auto_38226 ?auto_38227 ?auto_38228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38229 - BLOCK
      ?auto_38230 - BLOCK
      ?auto_38231 - BLOCK
      ?auto_38232 - BLOCK
      ?auto_38233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38229 ?auto_38230 ) ) ( not ( = ?auto_38229 ?auto_38231 ) ) ( not ( = ?auto_38229 ?auto_38232 ) ) ( not ( = ?auto_38229 ?auto_38233 ) ) ( not ( = ?auto_38230 ?auto_38231 ) ) ( not ( = ?auto_38230 ?auto_38232 ) ) ( not ( = ?auto_38230 ?auto_38233 ) ) ( not ( = ?auto_38231 ?auto_38232 ) ) ( not ( = ?auto_38231 ?auto_38233 ) ) ( not ( = ?auto_38232 ?auto_38233 ) ) ( ON-TABLE ?auto_38233 ) ( ON ?auto_38232 ?auto_38233 ) ( ON ?auto_38231 ?auto_38232 ) ( ON ?auto_38230 ?auto_38231 ) ( HOLDING ?auto_38229 ) ( CLEAR ?auto_38230 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38233 ?auto_38232 ?auto_38231 ?auto_38230 ?auto_38229 )
      ( MAKE-5PILE ?auto_38229 ?auto_38230 ?auto_38231 ?auto_38232 ?auto_38233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38234 - BLOCK
      ?auto_38235 - BLOCK
      ?auto_38236 - BLOCK
      ?auto_38237 - BLOCK
      ?auto_38238 - BLOCK
    )
    :vars
    (
      ?auto_38239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38234 ?auto_38235 ) ) ( not ( = ?auto_38234 ?auto_38236 ) ) ( not ( = ?auto_38234 ?auto_38237 ) ) ( not ( = ?auto_38234 ?auto_38238 ) ) ( not ( = ?auto_38235 ?auto_38236 ) ) ( not ( = ?auto_38235 ?auto_38237 ) ) ( not ( = ?auto_38235 ?auto_38238 ) ) ( not ( = ?auto_38236 ?auto_38237 ) ) ( not ( = ?auto_38236 ?auto_38238 ) ) ( not ( = ?auto_38237 ?auto_38238 ) ) ( ON-TABLE ?auto_38238 ) ( ON ?auto_38237 ?auto_38238 ) ( ON ?auto_38236 ?auto_38237 ) ( ON ?auto_38235 ?auto_38236 ) ( CLEAR ?auto_38235 ) ( ON ?auto_38234 ?auto_38239 ) ( CLEAR ?auto_38234 ) ( HAND-EMPTY ) ( not ( = ?auto_38234 ?auto_38239 ) ) ( not ( = ?auto_38235 ?auto_38239 ) ) ( not ( = ?auto_38236 ?auto_38239 ) ) ( not ( = ?auto_38237 ?auto_38239 ) ) ( not ( = ?auto_38238 ?auto_38239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38234 ?auto_38239 )
      ( MAKE-5PILE ?auto_38234 ?auto_38235 ?auto_38236 ?auto_38237 ?auto_38238 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38240 - BLOCK
      ?auto_38241 - BLOCK
      ?auto_38242 - BLOCK
      ?auto_38243 - BLOCK
      ?auto_38244 - BLOCK
    )
    :vars
    (
      ?auto_38245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38240 ?auto_38241 ) ) ( not ( = ?auto_38240 ?auto_38242 ) ) ( not ( = ?auto_38240 ?auto_38243 ) ) ( not ( = ?auto_38240 ?auto_38244 ) ) ( not ( = ?auto_38241 ?auto_38242 ) ) ( not ( = ?auto_38241 ?auto_38243 ) ) ( not ( = ?auto_38241 ?auto_38244 ) ) ( not ( = ?auto_38242 ?auto_38243 ) ) ( not ( = ?auto_38242 ?auto_38244 ) ) ( not ( = ?auto_38243 ?auto_38244 ) ) ( ON-TABLE ?auto_38244 ) ( ON ?auto_38243 ?auto_38244 ) ( ON ?auto_38242 ?auto_38243 ) ( ON ?auto_38240 ?auto_38245 ) ( CLEAR ?auto_38240 ) ( not ( = ?auto_38240 ?auto_38245 ) ) ( not ( = ?auto_38241 ?auto_38245 ) ) ( not ( = ?auto_38242 ?auto_38245 ) ) ( not ( = ?auto_38243 ?auto_38245 ) ) ( not ( = ?auto_38244 ?auto_38245 ) ) ( HOLDING ?auto_38241 ) ( CLEAR ?auto_38242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38244 ?auto_38243 ?auto_38242 ?auto_38241 )
      ( MAKE-5PILE ?auto_38240 ?auto_38241 ?auto_38242 ?auto_38243 ?auto_38244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38246 - BLOCK
      ?auto_38247 - BLOCK
      ?auto_38248 - BLOCK
      ?auto_38249 - BLOCK
      ?auto_38250 - BLOCK
    )
    :vars
    (
      ?auto_38251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38246 ?auto_38247 ) ) ( not ( = ?auto_38246 ?auto_38248 ) ) ( not ( = ?auto_38246 ?auto_38249 ) ) ( not ( = ?auto_38246 ?auto_38250 ) ) ( not ( = ?auto_38247 ?auto_38248 ) ) ( not ( = ?auto_38247 ?auto_38249 ) ) ( not ( = ?auto_38247 ?auto_38250 ) ) ( not ( = ?auto_38248 ?auto_38249 ) ) ( not ( = ?auto_38248 ?auto_38250 ) ) ( not ( = ?auto_38249 ?auto_38250 ) ) ( ON-TABLE ?auto_38250 ) ( ON ?auto_38249 ?auto_38250 ) ( ON ?auto_38248 ?auto_38249 ) ( ON ?auto_38246 ?auto_38251 ) ( not ( = ?auto_38246 ?auto_38251 ) ) ( not ( = ?auto_38247 ?auto_38251 ) ) ( not ( = ?auto_38248 ?auto_38251 ) ) ( not ( = ?auto_38249 ?auto_38251 ) ) ( not ( = ?auto_38250 ?auto_38251 ) ) ( CLEAR ?auto_38248 ) ( ON ?auto_38247 ?auto_38246 ) ( CLEAR ?auto_38247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38251 ?auto_38246 )
      ( MAKE-5PILE ?auto_38246 ?auto_38247 ?auto_38248 ?auto_38249 ?auto_38250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38252 - BLOCK
      ?auto_38253 - BLOCK
      ?auto_38254 - BLOCK
      ?auto_38255 - BLOCK
      ?auto_38256 - BLOCK
    )
    :vars
    (
      ?auto_38257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38252 ?auto_38253 ) ) ( not ( = ?auto_38252 ?auto_38254 ) ) ( not ( = ?auto_38252 ?auto_38255 ) ) ( not ( = ?auto_38252 ?auto_38256 ) ) ( not ( = ?auto_38253 ?auto_38254 ) ) ( not ( = ?auto_38253 ?auto_38255 ) ) ( not ( = ?auto_38253 ?auto_38256 ) ) ( not ( = ?auto_38254 ?auto_38255 ) ) ( not ( = ?auto_38254 ?auto_38256 ) ) ( not ( = ?auto_38255 ?auto_38256 ) ) ( ON-TABLE ?auto_38256 ) ( ON ?auto_38255 ?auto_38256 ) ( ON ?auto_38252 ?auto_38257 ) ( not ( = ?auto_38252 ?auto_38257 ) ) ( not ( = ?auto_38253 ?auto_38257 ) ) ( not ( = ?auto_38254 ?auto_38257 ) ) ( not ( = ?auto_38255 ?auto_38257 ) ) ( not ( = ?auto_38256 ?auto_38257 ) ) ( ON ?auto_38253 ?auto_38252 ) ( CLEAR ?auto_38253 ) ( ON-TABLE ?auto_38257 ) ( HOLDING ?auto_38254 ) ( CLEAR ?auto_38255 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38256 ?auto_38255 ?auto_38254 )
      ( MAKE-5PILE ?auto_38252 ?auto_38253 ?auto_38254 ?auto_38255 ?auto_38256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38258 - BLOCK
      ?auto_38259 - BLOCK
      ?auto_38260 - BLOCK
      ?auto_38261 - BLOCK
      ?auto_38262 - BLOCK
    )
    :vars
    (
      ?auto_38263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38258 ?auto_38259 ) ) ( not ( = ?auto_38258 ?auto_38260 ) ) ( not ( = ?auto_38258 ?auto_38261 ) ) ( not ( = ?auto_38258 ?auto_38262 ) ) ( not ( = ?auto_38259 ?auto_38260 ) ) ( not ( = ?auto_38259 ?auto_38261 ) ) ( not ( = ?auto_38259 ?auto_38262 ) ) ( not ( = ?auto_38260 ?auto_38261 ) ) ( not ( = ?auto_38260 ?auto_38262 ) ) ( not ( = ?auto_38261 ?auto_38262 ) ) ( ON-TABLE ?auto_38262 ) ( ON ?auto_38261 ?auto_38262 ) ( ON ?auto_38258 ?auto_38263 ) ( not ( = ?auto_38258 ?auto_38263 ) ) ( not ( = ?auto_38259 ?auto_38263 ) ) ( not ( = ?auto_38260 ?auto_38263 ) ) ( not ( = ?auto_38261 ?auto_38263 ) ) ( not ( = ?auto_38262 ?auto_38263 ) ) ( ON ?auto_38259 ?auto_38258 ) ( ON-TABLE ?auto_38263 ) ( CLEAR ?auto_38261 ) ( ON ?auto_38260 ?auto_38259 ) ( CLEAR ?auto_38260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38263 ?auto_38258 ?auto_38259 )
      ( MAKE-5PILE ?auto_38258 ?auto_38259 ?auto_38260 ?auto_38261 ?auto_38262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38264 - BLOCK
      ?auto_38265 - BLOCK
      ?auto_38266 - BLOCK
      ?auto_38267 - BLOCK
      ?auto_38268 - BLOCK
    )
    :vars
    (
      ?auto_38269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38264 ?auto_38265 ) ) ( not ( = ?auto_38264 ?auto_38266 ) ) ( not ( = ?auto_38264 ?auto_38267 ) ) ( not ( = ?auto_38264 ?auto_38268 ) ) ( not ( = ?auto_38265 ?auto_38266 ) ) ( not ( = ?auto_38265 ?auto_38267 ) ) ( not ( = ?auto_38265 ?auto_38268 ) ) ( not ( = ?auto_38266 ?auto_38267 ) ) ( not ( = ?auto_38266 ?auto_38268 ) ) ( not ( = ?auto_38267 ?auto_38268 ) ) ( ON-TABLE ?auto_38268 ) ( ON ?auto_38264 ?auto_38269 ) ( not ( = ?auto_38264 ?auto_38269 ) ) ( not ( = ?auto_38265 ?auto_38269 ) ) ( not ( = ?auto_38266 ?auto_38269 ) ) ( not ( = ?auto_38267 ?auto_38269 ) ) ( not ( = ?auto_38268 ?auto_38269 ) ) ( ON ?auto_38265 ?auto_38264 ) ( ON-TABLE ?auto_38269 ) ( ON ?auto_38266 ?auto_38265 ) ( CLEAR ?auto_38266 ) ( HOLDING ?auto_38267 ) ( CLEAR ?auto_38268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38268 ?auto_38267 )
      ( MAKE-5PILE ?auto_38264 ?auto_38265 ?auto_38266 ?auto_38267 ?auto_38268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38270 - BLOCK
      ?auto_38271 - BLOCK
      ?auto_38272 - BLOCK
      ?auto_38273 - BLOCK
      ?auto_38274 - BLOCK
    )
    :vars
    (
      ?auto_38275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38270 ?auto_38271 ) ) ( not ( = ?auto_38270 ?auto_38272 ) ) ( not ( = ?auto_38270 ?auto_38273 ) ) ( not ( = ?auto_38270 ?auto_38274 ) ) ( not ( = ?auto_38271 ?auto_38272 ) ) ( not ( = ?auto_38271 ?auto_38273 ) ) ( not ( = ?auto_38271 ?auto_38274 ) ) ( not ( = ?auto_38272 ?auto_38273 ) ) ( not ( = ?auto_38272 ?auto_38274 ) ) ( not ( = ?auto_38273 ?auto_38274 ) ) ( ON-TABLE ?auto_38274 ) ( ON ?auto_38270 ?auto_38275 ) ( not ( = ?auto_38270 ?auto_38275 ) ) ( not ( = ?auto_38271 ?auto_38275 ) ) ( not ( = ?auto_38272 ?auto_38275 ) ) ( not ( = ?auto_38273 ?auto_38275 ) ) ( not ( = ?auto_38274 ?auto_38275 ) ) ( ON ?auto_38271 ?auto_38270 ) ( ON-TABLE ?auto_38275 ) ( ON ?auto_38272 ?auto_38271 ) ( CLEAR ?auto_38274 ) ( ON ?auto_38273 ?auto_38272 ) ( CLEAR ?auto_38273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38275 ?auto_38270 ?auto_38271 ?auto_38272 )
      ( MAKE-5PILE ?auto_38270 ?auto_38271 ?auto_38272 ?auto_38273 ?auto_38274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38276 - BLOCK
      ?auto_38277 - BLOCK
      ?auto_38278 - BLOCK
      ?auto_38279 - BLOCK
      ?auto_38280 - BLOCK
    )
    :vars
    (
      ?auto_38281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38276 ?auto_38277 ) ) ( not ( = ?auto_38276 ?auto_38278 ) ) ( not ( = ?auto_38276 ?auto_38279 ) ) ( not ( = ?auto_38276 ?auto_38280 ) ) ( not ( = ?auto_38277 ?auto_38278 ) ) ( not ( = ?auto_38277 ?auto_38279 ) ) ( not ( = ?auto_38277 ?auto_38280 ) ) ( not ( = ?auto_38278 ?auto_38279 ) ) ( not ( = ?auto_38278 ?auto_38280 ) ) ( not ( = ?auto_38279 ?auto_38280 ) ) ( ON ?auto_38276 ?auto_38281 ) ( not ( = ?auto_38276 ?auto_38281 ) ) ( not ( = ?auto_38277 ?auto_38281 ) ) ( not ( = ?auto_38278 ?auto_38281 ) ) ( not ( = ?auto_38279 ?auto_38281 ) ) ( not ( = ?auto_38280 ?auto_38281 ) ) ( ON ?auto_38277 ?auto_38276 ) ( ON-TABLE ?auto_38281 ) ( ON ?auto_38278 ?auto_38277 ) ( ON ?auto_38279 ?auto_38278 ) ( CLEAR ?auto_38279 ) ( HOLDING ?auto_38280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38280 )
      ( MAKE-5PILE ?auto_38276 ?auto_38277 ?auto_38278 ?auto_38279 ?auto_38280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38282 - BLOCK
      ?auto_38283 - BLOCK
      ?auto_38284 - BLOCK
      ?auto_38285 - BLOCK
      ?auto_38286 - BLOCK
    )
    :vars
    (
      ?auto_38287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38282 ?auto_38283 ) ) ( not ( = ?auto_38282 ?auto_38284 ) ) ( not ( = ?auto_38282 ?auto_38285 ) ) ( not ( = ?auto_38282 ?auto_38286 ) ) ( not ( = ?auto_38283 ?auto_38284 ) ) ( not ( = ?auto_38283 ?auto_38285 ) ) ( not ( = ?auto_38283 ?auto_38286 ) ) ( not ( = ?auto_38284 ?auto_38285 ) ) ( not ( = ?auto_38284 ?auto_38286 ) ) ( not ( = ?auto_38285 ?auto_38286 ) ) ( ON ?auto_38282 ?auto_38287 ) ( not ( = ?auto_38282 ?auto_38287 ) ) ( not ( = ?auto_38283 ?auto_38287 ) ) ( not ( = ?auto_38284 ?auto_38287 ) ) ( not ( = ?auto_38285 ?auto_38287 ) ) ( not ( = ?auto_38286 ?auto_38287 ) ) ( ON ?auto_38283 ?auto_38282 ) ( ON-TABLE ?auto_38287 ) ( ON ?auto_38284 ?auto_38283 ) ( ON ?auto_38285 ?auto_38284 ) ( ON ?auto_38286 ?auto_38285 ) ( CLEAR ?auto_38286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38287 ?auto_38282 ?auto_38283 ?auto_38284 ?auto_38285 )
      ( MAKE-5PILE ?auto_38282 ?auto_38283 ?auto_38284 ?auto_38285 ?auto_38286 ) )
  )

)

