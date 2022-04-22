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
      ?auto_5177 - BLOCK
    )
    :vars
    (
      ?auto_5178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5177 ?auto_5178 ) ( CLEAR ?auto_5177 ) ( HAND-EMPTY ) ( not ( = ?auto_5177 ?auto_5178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5177 ?auto_5178 )
      ( !PUTDOWN ?auto_5177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5180 - BLOCK
    )
    :vars
    (
      ?auto_5181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5180 ?auto_5181 ) ( CLEAR ?auto_5180 ) ( HAND-EMPTY ) ( not ( = ?auto_5180 ?auto_5181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5180 ?auto_5181 )
      ( !PUTDOWN ?auto_5180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5184 - BLOCK
      ?auto_5185 - BLOCK
    )
    :vars
    (
      ?auto_5186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5184 ) ( ON ?auto_5185 ?auto_5186 ) ( CLEAR ?auto_5185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5184 ) ( not ( = ?auto_5184 ?auto_5185 ) ) ( not ( = ?auto_5184 ?auto_5186 ) ) ( not ( = ?auto_5185 ?auto_5186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5185 ?auto_5186 )
      ( !STACK ?auto_5185 ?auto_5184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5189 - BLOCK
      ?auto_5190 - BLOCK
    )
    :vars
    (
      ?auto_5191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5189 ) ( ON ?auto_5190 ?auto_5191 ) ( CLEAR ?auto_5190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5189 ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( not ( = ?auto_5189 ?auto_5191 ) ) ( not ( = ?auto_5190 ?auto_5191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5190 ?auto_5191 )
      ( !STACK ?auto_5190 ?auto_5189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5194 - BLOCK
      ?auto_5195 - BLOCK
    )
    :vars
    (
      ?auto_5196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5195 ?auto_5196 ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5194 ?auto_5196 ) ) ( not ( = ?auto_5195 ?auto_5196 ) ) ( ON ?auto_5194 ?auto_5195 ) ( CLEAR ?auto_5194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5194 )
      ( MAKE-2PILE ?auto_5194 ?auto_5195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5199 - BLOCK
      ?auto_5200 - BLOCK
    )
    :vars
    (
      ?auto_5201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5200 ?auto_5201 ) ( not ( = ?auto_5199 ?auto_5200 ) ) ( not ( = ?auto_5199 ?auto_5201 ) ) ( not ( = ?auto_5200 ?auto_5201 ) ) ( ON ?auto_5199 ?auto_5200 ) ( CLEAR ?auto_5199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5199 )
      ( MAKE-2PILE ?auto_5199 ?auto_5200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5205 - BLOCK
      ?auto_5206 - BLOCK
      ?auto_5207 - BLOCK
    )
    :vars
    (
      ?auto_5208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5206 ) ( ON ?auto_5207 ?auto_5208 ) ( CLEAR ?auto_5207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5205 ) ( ON ?auto_5206 ?auto_5205 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5205 ?auto_5207 ) ) ( not ( = ?auto_5205 ?auto_5208 ) ) ( not ( = ?auto_5206 ?auto_5207 ) ) ( not ( = ?auto_5206 ?auto_5208 ) ) ( not ( = ?auto_5207 ?auto_5208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5207 ?auto_5208 )
      ( !STACK ?auto_5207 ?auto_5206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5212 - BLOCK
      ?auto_5213 - BLOCK
      ?auto_5214 - BLOCK
    )
    :vars
    (
      ?auto_5215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5213 ) ( ON ?auto_5214 ?auto_5215 ) ( CLEAR ?auto_5214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5212 ) ( ON ?auto_5213 ?auto_5212 ) ( not ( = ?auto_5212 ?auto_5213 ) ) ( not ( = ?auto_5212 ?auto_5214 ) ) ( not ( = ?auto_5212 ?auto_5215 ) ) ( not ( = ?auto_5213 ?auto_5214 ) ) ( not ( = ?auto_5213 ?auto_5215 ) ) ( not ( = ?auto_5214 ?auto_5215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5214 ?auto_5215 )
      ( !STACK ?auto_5214 ?auto_5213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5219 - BLOCK
      ?auto_5220 - BLOCK
      ?auto_5221 - BLOCK
    )
    :vars
    (
      ?auto_5222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5221 ?auto_5222 ) ( ON-TABLE ?auto_5219 ) ( not ( = ?auto_5219 ?auto_5220 ) ) ( not ( = ?auto_5219 ?auto_5221 ) ) ( not ( = ?auto_5219 ?auto_5222 ) ) ( not ( = ?auto_5220 ?auto_5221 ) ) ( not ( = ?auto_5220 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( CLEAR ?auto_5219 ) ( ON ?auto_5220 ?auto_5221 ) ( CLEAR ?auto_5220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5219 ?auto_5220 )
      ( MAKE-3PILE ?auto_5219 ?auto_5220 ?auto_5221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5226 - BLOCK
      ?auto_5227 - BLOCK
      ?auto_5228 - BLOCK
    )
    :vars
    (
      ?auto_5229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5228 ?auto_5229 ) ( ON-TABLE ?auto_5226 ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5228 ) ) ( not ( = ?auto_5226 ?auto_5229 ) ) ( not ( = ?auto_5227 ?auto_5228 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( not ( = ?auto_5228 ?auto_5229 ) ) ( CLEAR ?auto_5226 ) ( ON ?auto_5227 ?auto_5228 ) ( CLEAR ?auto_5227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5226 ?auto_5227 )
      ( MAKE-3PILE ?auto_5226 ?auto_5227 ?auto_5228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5233 - BLOCK
      ?auto_5234 - BLOCK
      ?auto_5235 - BLOCK
    )
    :vars
    (
      ?auto_5236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5235 ?auto_5236 ) ( not ( = ?auto_5233 ?auto_5234 ) ) ( not ( = ?auto_5233 ?auto_5235 ) ) ( not ( = ?auto_5233 ?auto_5236 ) ) ( not ( = ?auto_5234 ?auto_5235 ) ) ( not ( = ?auto_5234 ?auto_5236 ) ) ( not ( = ?auto_5235 ?auto_5236 ) ) ( ON ?auto_5234 ?auto_5235 ) ( ON ?auto_5233 ?auto_5234 ) ( CLEAR ?auto_5233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5233 )
      ( MAKE-3PILE ?auto_5233 ?auto_5234 ?auto_5235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5240 - BLOCK
      ?auto_5241 - BLOCK
      ?auto_5242 - BLOCK
    )
    :vars
    (
      ?auto_5243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5242 ?auto_5243 ) ( not ( = ?auto_5240 ?auto_5241 ) ) ( not ( = ?auto_5240 ?auto_5242 ) ) ( not ( = ?auto_5240 ?auto_5243 ) ) ( not ( = ?auto_5241 ?auto_5242 ) ) ( not ( = ?auto_5241 ?auto_5243 ) ) ( not ( = ?auto_5242 ?auto_5243 ) ) ( ON ?auto_5241 ?auto_5242 ) ( ON ?auto_5240 ?auto_5241 ) ( CLEAR ?auto_5240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5240 )
      ( MAKE-3PILE ?auto_5240 ?auto_5241 ?auto_5242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5248 - BLOCK
      ?auto_5249 - BLOCK
      ?auto_5250 - BLOCK
      ?auto_5251 - BLOCK
    )
    :vars
    (
      ?auto_5252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5250 ) ( ON ?auto_5251 ?auto_5252 ) ( CLEAR ?auto_5251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5248 ) ( ON ?auto_5249 ?auto_5248 ) ( ON ?auto_5250 ?auto_5249 ) ( not ( = ?auto_5248 ?auto_5249 ) ) ( not ( = ?auto_5248 ?auto_5250 ) ) ( not ( = ?auto_5248 ?auto_5251 ) ) ( not ( = ?auto_5248 ?auto_5252 ) ) ( not ( = ?auto_5249 ?auto_5250 ) ) ( not ( = ?auto_5249 ?auto_5251 ) ) ( not ( = ?auto_5249 ?auto_5252 ) ) ( not ( = ?auto_5250 ?auto_5251 ) ) ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5251 ?auto_5252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5251 ?auto_5252 )
      ( !STACK ?auto_5251 ?auto_5250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5257 - BLOCK
      ?auto_5258 - BLOCK
      ?auto_5259 - BLOCK
      ?auto_5260 - BLOCK
    )
    :vars
    (
      ?auto_5261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5259 ) ( ON ?auto_5260 ?auto_5261 ) ( CLEAR ?auto_5260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5257 ) ( ON ?auto_5258 ?auto_5257 ) ( ON ?auto_5259 ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5258 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( not ( = ?auto_5257 ?auto_5260 ) ) ( not ( = ?auto_5257 ?auto_5261 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5260 ) ) ( not ( = ?auto_5258 ?auto_5261 ) ) ( not ( = ?auto_5259 ?auto_5260 ) ) ( not ( = ?auto_5259 ?auto_5261 ) ) ( not ( = ?auto_5260 ?auto_5261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5260 ?auto_5261 )
      ( !STACK ?auto_5260 ?auto_5259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5266 - BLOCK
      ?auto_5267 - BLOCK
      ?auto_5268 - BLOCK
      ?auto_5269 - BLOCK
    )
    :vars
    (
      ?auto_5270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5269 ?auto_5270 ) ( ON-TABLE ?auto_5266 ) ( ON ?auto_5267 ?auto_5266 ) ( not ( = ?auto_5266 ?auto_5267 ) ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( not ( = ?auto_5266 ?auto_5269 ) ) ( not ( = ?auto_5266 ?auto_5270 ) ) ( not ( = ?auto_5267 ?auto_5268 ) ) ( not ( = ?auto_5267 ?auto_5269 ) ) ( not ( = ?auto_5267 ?auto_5270 ) ) ( not ( = ?auto_5268 ?auto_5269 ) ) ( not ( = ?auto_5268 ?auto_5270 ) ) ( not ( = ?auto_5269 ?auto_5270 ) ) ( CLEAR ?auto_5267 ) ( ON ?auto_5268 ?auto_5269 ) ( CLEAR ?auto_5268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5266 ?auto_5267 ?auto_5268 )
      ( MAKE-4PILE ?auto_5266 ?auto_5267 ?auto_5268 ?auto_5269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5275 - BLOCK
      ?auto_5276 - BLOCK
      ?auto_5277 - BLOCK
      ?auto_5278 - BLOCK
    )
    :vars
    (
      ?auto_5279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5278 ?auto_5279 ) ( ON-TABLE ?auto_5275 ) ( ON ?auto_5276 ?auto_5275 ) ( not ( = ?auto_5275 ?auto_5276 ) ) ( not ( = ?auto_5275 ?auto_5277 ) ) ( not ( = ?auto_5275 ?auto_5278 ) ) ( not ( = ?auto_5275 ?auto_5279 ) ) ( not ( = ?auto_5276 ?auto_5277 ) ) ( not ( = ?auto_5276 ?auto_5278 ) ) ( not ( = ?auto_5276 ?auto_5279 ) ) ( not ( = ?auto_5277 ?auto_5278 ) ) ( not ( = ?auto_5277 ?auto_5279 ) ) ( not ( = ?auto_5278 ?auto_5279 ) ) ( CLEAR ?auto_5276 ) ( ON ?auto_5277 ?auto_5278 ) ( CLEAR ?auto_5277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5275 ?auto_5276 ?auto_5277 )
      ( MAKE-4PILE ?auto_5275 ?auto_5276 ?auto_5277 ?auto_5278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5284 - BLOCK
      ?auto_5285 - BLOCK
      ?auto_5286 - BLOCK
      ?auto_5287 - BLOCK
    )
    :vars
    (
      ?auto_5288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5287 ?auto_5288 ) ( ON-TABLE ?auto_5284 ) ( not ( = ?auto_5284 ?auto_5285 ) ) ( not ( = ?auto_5284 ?auto_5286 ) ) ( not ( = ?auto_5284 ?auto_5287 ) ) ( not ( = ?auto_5284 ?auto_5288 ) ) ( not ( = ?auto_5285 ?auto_5286 ) ) ( not ( = ?auto_5285 ?auto_5287 ) ) ( not ( = ?auto_5285 ?auto_5288 ) ) ( not ( = ?auto_5286 ?auto_5287 ) ) ( not ( = ?auto_5286 ?auto_5288 ) ) ( not ( = ?auto_5287 ?auto_5288 ) ) ( ON ?auto_5286 ?auto_5287 ) ( CLEAR ?auto_5284 ) ( ON ?auto_5285 ?auto_5286 ) ( CLEAR ?auto_5285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5284 ?auto_5285 )
      ( MAKE-4PILE ?auto_5284 ?auto_5285 ?auto_5286 ?auto_5287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5293 - BLOCK
      ?auto_5294 - BLOCK
      ?auto_5295 - BLOCK
      ?auto_5296 - BLOCK
    )
    :vars
    (
      ?auto_5297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5296 ?auto_5297 ) ( ON-TABLE ?auto_5293 ) ( not ( = ?auto_5293 ?auto_5294 ) ) ( not ( = ?auto_5293 ?auto_5295 ) ) ( not ( = ?auto_5293 ?auto_5296 ) ) ( not ( = ?auto_5293 ?auto_5297 ) ) ( not ( = ?auto_5294 ?auto_5295 ) ) ( not ( = ?auto_5294 ?auto_5296 ) ) ( not ( = ?auto_5294 ?auto_5297 ) ) ( not ( = ?auto_5295 ?auto_5296 ) ) ( not ( = ?auto_5295 ?auto_5297 ) ) ( not ( = ?auto_5296 ?auto_5297 ) ) ( ON ?auto_5295 ?auto_5296 ) ( CLEAR ?auto_5293 ) ( ON ?auto_5294 ?auto_5295 ) ( CLEAR ?auto_5294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5293 ?auto_5294 )
      ( MAKE-4PILE ?auto_5293 ?auto_5294 ?auto_5295 ?auto_5296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5302 - BLOCK
      ?auto_5303 - BLOCK
      ?auto_5304 - BLOCK
      ?auto_5305 - BLOCK
    )
    :vars
    (
      ?auto_5306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5305 ?auto_5306 ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5304 ) ) ( not ( = ?auto_5302 ?auto_5305 ) ) ( not ( = ?auto_5302 ?auto_5306 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5305 ) ) ( not ( = ?auto_5303 ?auto_5306 ) ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5306 ) ) ( not ( = ?auto_5305 ?auto_5306 ) ) ( ON ?auto_5304 ?auto_5305 ) ( ON ?auto_5303 ?auto_5304 ) ( ON ?auto_5302 ?auto_5303 ) ( CLEAR ?auto_5302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5302 )
      ( MAKE-4PILE ?auto_5302 ?auto_5303 ?auto_5304 ?auto_5305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5311 - BLOCK
      ?auto_5312 - BLOCK
      ?auto_5313 - BLOCK
      ?auto_5314 - BLOCK
    )
    :vars
    (
      ?auto_5315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5314 ?auto_5315 ) ( not ( = ?auto_5311 ?auto_5312 ) ) ( not ( = ?auto_5311 ?auto_5313 ) ) ( not ( = ?auto_5311 ?auto_5314 ) ) ( not ( = ?auto_5311 ?auto_5315 ) ) ( not ( = ?auto_5312 ?auto_5313 ) ) ( not ( = ?auto_5312 ?auto_5314 ) ) ( not ( = ?auto_5312 ?auto_5315 ) ) ( not ( = ?auto_5313 ?auto_5314 ) ) ( not ( = ?auto_5313 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( ON ?auto_5313 ?auto_5314 ) ( ON ?auto_5312 ?auto_5313 ) ( ON ?auto_5311 ?auto_5312 ) ( CLEAR ?auto_5311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5311 )
      ( MAKE-4PILE ?auto_5311 ?auto_5312 ?auto_5313 ?auto_5314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5321 - BLOCK
      ?auto_5322 - BLOCK
      ?auto_5323 - BLOCK
      ?auto_5324 - BLOCK
      ?auto_5325 - BLOCK
    )
    :vars
    (
      ?auto_5326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5324 ) ( ON ?auto_5325 ?auto_5326 ) ( CLEAR ?auto_5325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5321 ) ( ON ?auto_5322 ?auto_5321 ) ( ON ?auto_5323 ?auto_5322 ) ( ON ?auto_5324 ?auto_5323 ) ( not ( = ?auto_5321 ?auto_5322 ) ) ( not ( = ?auto_5321 ?auto_5323 ) ) ( not ( = ?auto_5321 ?auto_5324 ) ) ( not ( = ?auto_5321 ?auto_5325 ) ) ( not ( = ?auto_5321 ?auto_5326 ) ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( not ( = ?auto_5322 ?auto_5324 ) ) ( not ( = ?auto_5322 ?auto_5325 ) ) ( not ( = ?auto_5322 ?auto_5326 ) ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5325 ) ) ( not ( = ?auto_5323 ?auto_5326 ) ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5324 ?auto_5326 ) ) ( not ( = ?auto_5325 ?auto_5326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5325 ?auto_5326 )
      ( !STACK ?auto_5325 ?auto_5324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5332 - BLOCK
      ?auto_5333 - BLOCK
      ?auto_5334 - BLOCK
      ?auto_5335 - BLOCK
      ?auto_5336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5335 ) ( ON-TABLE ?auto_5336 ) ( CLEAR ?auto_5336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5332 ) ( ON ?auto_5333 ?auto_5332 ) ( ON ?auto_5334 ?auto_5333 ) ( ON ?auto_5335 ?auto_5334 ) ( not ( = ?auto_5332 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5334 ) ) ( not ( = ?auto_5332 ?auto_5335 ) ) ( not ( = ?auto_5332 ?auto_5336 ) ) ( not ( = ?auto_5333 ?auto_5334 ) ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( not ( = ?auto_5333 ?auto_5336 ) ) ( not ( = ?auto_5334 ?auto_5335 ) ) ( not ( = ?auto_5334 ?auto_5336 ) ) ( not ( = ?auto_5335 ?auto_5336 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_5336 )
      ( !STACK ?auto_5336 ?auto_5335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5342 - BLOCK
      ?auto_5343 - BLOCK
      ?auto_5344 - BLOCK
      ?auto_5345 - BLOCK
      ?auto_5346 - BLOCK
    )
    :vars
    (
      ?auto_5347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5346 ?auto_5347 ) ( ON-TABLE ?auto_5342 ) ( ON ?auto_5343 ?auto_5342 ) ( ON ?auto_5344 ?auto_5343 ) ( not ( = ?auto_5342 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5344 ) ) ( not ( = ?auto_5342 ?auto_5345 ) ) ( not ( = ?auto_5342 ?auto_5346 ) ) ( not ( = ?auto_5342 ?auto_5347 ) ) ( not ( = ?auto_5343 ?auto_5344 ) ) ( not ( = ?auto_5343 ?auto_5345 ) ) ( not ( = ?auto_5343 ?auto_5346 ) ) ( not ( = ?auto_5343 ?auto_5347 ) ) ( not ( = ?auto_5344 ?auto_5345 ) ) ( not ( = ?auto_5344 ?auto_5346 ) ) ( not ( = ?auto_5344 ?auto_5347 ) ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5347 ) ) ( not ( = ?auto_5346 ?auto_5347 ) ) ( CLEAR ?auto_5344 ) ( ON ?auto_5345 ?auto_5346 ) ( CLEAR ?auto_5345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5342 ?auto_5343 ?auto_5344 ?auto_5345 )
      ( MAKE-5PILE ?auto_5342 ?auto_5343 ?auto_5344 ?auto_5345 ?auto_5346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5353 - BLOCK
      ?auto_5354 - BLOCK
      ?auto_5355 - BLOCK
      ?auto_5356 - BLOCK
      ?auto_5357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5357 ) ( ON-TABLE ?auto_5353 ) ( ON ?auto_5354 ?auto_5353 ) ( ON ?auto_5355 ?auto_5354 ) ( not ( = ?auto_5353 ?auto_5354 ) ) ( not ( = ?auto_5353 ?auto_5355 ) ) ( not ( = ?auto_5353 ?auto_5356 ) ) ( not ( = ?auto_5353 ?auto_5357 ) ) ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) ( not ( = ?auto_5354 ?auto_5357 ) ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5357 ) ) ( CLEAR ?auto_5355 ) ( ON ?auto_5356 ?auto_5357 ) ( CLEAR ?auto_5356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5353 ?auto_5354 ?auto_5355 ?auto_5356 )
      ( MAKE-5PILE ?auto_5353 ?auto_5354 ?auto_5355 ?auto_5356 ?auto_5357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5363 - BLOCK
      ?auto_5364 - BLOCK
      ?auto_5365 - BLOCK
      ?auto_5366 - BLOCK
      ?auto_5367 - BLOCK
    )
    :vars
    (
      ?auto_5368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5367 ?auto_5368 ) ( ON-TABLE ?auto_5363 ) ( ON ?auto_5364 ?auto_5363 ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( not ( = ?auto_5363 ?auto_5365 ) ) ( not ( = ?auto_5363 ?auto_5366 ) ) ( not ( = ?auto_5363 ?auto_5367 ) ) ( not ( = ?auto_5363 ?auto_5368 ) ) ( not ( = ?auto_5364 ?auto_5365 ) ) ( not ( = ?auto_5364 ?auto_5366 ) ) ( not ( = ?auto_5364 ?auto_5367 ) ) ( not ( = ?auto_5364 ?auto_5368 ) ) ( not ( = ?auto_5365 ?auto_5366 ) ) ( not ( = ?auto_5365 ?auto_5367 ) ) ( not ( = ?auto_5365 ?auto_5368 ) ) ( not ( = ?auto_5366 ?auto_5367 ) ) ( not ( = ?auto_5366 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( ON ?auto_5366 ?auto_5367 ) ( CLEAR ?auto_5364 ) ( ON ?auto_5365 ?auto_5366 ) ( CLEAR ?auto_5365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5363 ?auto_5364 ?auto_5365 )
      ( MAKE-5PILE ?auto_5363 ?auto_5364 ?auto_5365 ?auto_5366 ?auto_5367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5374 - BLOCK
      ?auto_5375 - BLOCK
      ?auto_5376 - BLOCK
      ?auto_5377 - BLOCK
      ?auto_5378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5378 ) ( ON-TABLE ?auto_5374 ) ( ON ?auto_5375 ?auto_5374 ) ( not ( = ?auto_5374 ?auto_5375 ) ) ( not ( = ?auto_5374 ?auto_5376 ) ) ( not ( = ?auto_5374 ?auto_5377 ) ) ( not ( = ?auto_5374 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5376 ?auto_5377 ) ) ( not ( = ?auto_5376 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( ON ?auto_5377 ?auto_5378 ) ( CLEAR ?auto_5375 ) ( ON ?auto_5376 ?auto_5377 ) ( CLEAR ?auto_5376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5374 ?auto_5375 ?auto_5376 )
      ( MAKE-5PILE ?auto_5374 ?auto_5375 ?auto_5376 ?auto_5377 ?auto_5378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5384 - BLOCK
      ?auto_5385 - BLOCK
      ?auto_5386 - BLOCK
      ?auto_5387 - BLOCK
      ?auto_5388 - BLOCK
    )
    :vars
    (
      ?auto_5389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5388 ?auto_5389 ) ( ON-TABLE ?auto_5384 ) ( not ( = ?auto_5384 ?auto_5385 ) ) ( not ( = ?auto_5384 ?auto_5386 ) ) ( not ( = ?auto_5384 ?auto_5387 ) ) ( not ( = ?auto_5384 ?auto_5388 ) ) ( not ( = ?auto_5384 ?auto_5389 ) ) ( not ( = ?auto_5385 ?auto_5386 ) ) ( not ( = ?auto_5385 ?auto_5387 ) ) ( not ( = ?auto_5385 ?auto_5388 ) ) ( not ( = ?auto_5385 ?auto_5389 ) ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( ON ?auto_5387 ?auto_5388 ) ( ON ?auto_5386 ?auto_5387 ) ( CLEAR ?auto_5384 ) ( ON ?auto_5385 ?auto_5386 ) ( CLEAR ?auto_5385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5384 ?auto_5385 )
      ( MAKE-5PILE ?auto_5384 ?auto_5385 ?auto_5386 ?auto_5387 ?auto_5388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5395 - BLOCK
      ?auto_5396 - BLOCK
      ?auto_5397 - BLOCK
      ?auto_5398 - BLOCK
      ?auto_5399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5399 ) ( ON-TABLE ?auto_5395 ) ( not ( = ?auto_5395 ?auto_5396 ) ) ( not ( = ?auto_5395 ?auto_5397 ) ) ( not ( = ?auto_5395 ?auto_5398 ) ) ( not ( = ?auto_5395 ?auto_5399 ) ) ( not ( = ?auto_5396 ?auto_5397 ) ) ( not ( = ?auto_5396 ?auto_5398 ) ) ( not ( = ?auto_5396 ?auto_5399 ) ) ( not ( = ?auto_5397 ?auto_5398 ) ) ( not ( = ?auto_5397 ?auto_5399 ) ) ( not ( = ?auto_5398 ?auto_5399 ) ) ( ON ?auto_5398 ?auto_5399 ) ( ON ?auto_5397 ?auto_5398 ) ( CLEAR ?auto_5395 ) ( ON ?auto_5396 ?auto_5397 ) ( CLEAR ?auto_5396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5395 ?auto_5396 )
      ( MAKE-5PILE ?auto_5395 ?auto_5396 ?auto_5397 ?auto_5398 ?auto_5399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5405 - BLOCK
      ?auto_5406 - BLOCK
      ?auto_5407 - BLOCK
      ?auto_5408 - BLOCK
      ?auto_5409 - BLOCK
    )
    :vars
    (
      ?auto_5410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5409 ?auto_5410 ) ( not ( = ?auto_5405 ?auto_5406 ) ) ( not ( = ?auto_5405 ?auto_5407 ) ) ( not ( = ?auto_5405 ?auto_5408 ) ) ( not ( = ?auto_5405 ?auto_5409 ) ) ( not ( = ?auto_5405 ?auto_5410 ) ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5408 ) ) ( not ( = ?auto_5406 ?auto_5409 ) ) ( not ( = ?auto_5406 ?auto_5410 ) ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5407 ?auto_5410 ) ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5410 ) ) ( not ( = ?auto_5409 ?auto_5410 ) ) ( ON ?auto_5408 ?auto_5409 ) ( ON ?auto_5407 ?auto_5408 ) ( ON ?auto_5406 ?auto_5407 ) ( ON ?auto_5405 ?auto_5406 ) ( CLEAR ?auto_5405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5405 )
      ( MAKE-5PILE ?auto_5405 ?auto_5406 ?auto_5407 ?auto_5408 ?auto_5409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5416 - BLOCK
      ?auto_5417 - BLOCK
      ?auto_5418 - BLOCK
      ?auto_5419 - BLOCK
      ?auto_5420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5420 ) ( not ( = ?auto_5416 ?auto_5417 ) ) ( not ( = ?auto_5416 ?auto_5418 ) ) ( not ( = ?auto_5416 ?auto_5419 ) ) ( not ( = ?auto_5416 ?auto_5420 ) ) ( not ( = ?auto_5417 ?auto_5418 ) ) ( not ( = ?auto_5417 ?auto_5419 ) ) ( not ( = ?auto_5417 ?auto_5420 ) ) ( not ( = ?auto_5418 ?auto_5419 ) ) ( not ( = ?auto_5418 ?auto_5420 ) ) ( not ( = ?auto_5419 ?auto_5420 ) ) ( ON ?auto_5419 ?auto_5420 ) ( ON ?auto_5418 ?auto_5419 ) ( ON ?auto_5417 ?auto_5418 ) ( ON ?auto_5416 ?auto_5417 ) ( CLEAR ?auto_5416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5416 )
      ( MAKE-5PILE ?auto_5416 ?auto_5417 ?auto_5418 ?auto_5419 ?auto_5420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5426 - BLOCK
      ?auto_5427 - BLOCK
      ?auto_5428 - BLOCK
      ?auto_5429 - BLOCK
      ?auto_5430 - BLOCK
    )
    :vars
    (
      ?auto_5431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5426 ?auto_5427 ) ) ( not ( = ?auto_5426 ?auto_5428 ) ) ( not ( = ?auto_5426 ?auto_5429 ) ) ( not ( = ?auto_5426 ?auto_5430 ) ) ( not ( = ?auto_5427 ?auto_5428 ) ) ( not ( = ?auto_5427 ?auto_5429 ) ) ( not ( = ?auto_5427 ?auto_5430 ) ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( not ( = ?auto_5429 ?auto_5430 ) ) ( ON ?auto_5426 ?auto_5431 ) ( not ( = ?auto_5430 ?auto_5431 ) ) ( not ( = ?auto_5429 ?auto_5431 ) ) ( not ( = ?auto_5428 ?auto_5431 ) ) ( not ( = ?auto_5427 ?auto_5431 ) ) ( not ( = ?auto_5426 ?auto_5431 ) ) ( ON ?auto_5427 ?auto_5426 ) ( ON ?auto_5428 ?auto_5427 ) ( ON ?auto_5429 ?auto_5428 ) ( ON ?auto_5430 ?auto_5429 ) ( CLEAR ?auto_5430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_5430 ?auto_5429 ?auto_5428 ?auto_5427 ?auto_5426 )
      ( MAKE-5PILE ?auto_5426 ?auto_5427 ?auto_5428 ?auto_5429 ?auto_5430 ) )
  )

)

