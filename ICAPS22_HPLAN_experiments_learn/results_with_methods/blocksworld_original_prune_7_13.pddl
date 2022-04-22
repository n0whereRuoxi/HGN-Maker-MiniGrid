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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99233 - BLOCK
      ?auto_99234 - BLOCK
      ?auto_99235 - BLOCK
      ?auto_99236 - BLOCK
      ?auto_99237 - BLOCK
      ?auto_99238 - BLOCK
      ?auto_99239 - BLOCK
    )
    :vars
    (
      ?auto_99240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99240 ?auto_99239 ) ( CLEAR ?auto_99240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99233 ) ( ON ?auto_99234 ?auto_99233 ) ( ON ?auto_99235 ?auto_99234 ) ( ON ?auto_99236 ?auto_99235 ) ( ON ?auto_99237 ?auto_99236 ) ( ON ?auto_99238 ?auto_99237 ) ( ON ?auto_99239 ?auto_99238 ) ( not ( = ?auto_99233 ?auto_99234 ) ) ( not ( = ?auto_99233 ?auto_99235 ) ) ( not ( = ?auto_99233 ?auto_99236 ) ) ( not ( = ?auto_99233 ?auto_99237 ) ) ( not ( = ?auto_99233 ?auto_99238 ) ) ( not ( = ?auto_99233 ?auto_99239 ) ) ( not ( = ?auto_99233 ?auto_99240 ) ) ( not ( = ?auto_99234 ?auto_99235 ) ) ( not ( = ?auto_99234 ?auto_99236 ) ) ( not ( = ?auto_99234 ?auto_99237 ) ) ( not ( = ?auto_99234 ?auto_99238 ) ) ( not ( = ?auto_99234 ?auto_99239 ) ) ( not ( = ?auto_99234 ?auto_99240 ) ) ( not ( = ?auto_99235 ?auto_99236 ) ) ( not ( = ?auto_99235 ?auto_99237 ) ) ( not ( = ?auto_99235 ?auto_99238 ) ) ( not ( = ?auto_99235 ?auto_99239 ) ) ( not ( = ?auto_99235 ?auto_99240 ) ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99236 ?auto_99239 ) ) ( not ( = ?auto_99236 ?auto_99240 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99239 ) ) ( not ( = ?auto_99237 ?auto_99240 ) ) ( not ( = ?auto_99238 ?auto_99239 ) ) ( not ( = ?auto_99238 ?auto_99240 ) ) ( not ( = ?auto_99239 ?auto_99240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99240 ?auto_99239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99242 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99242 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_99242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99243 - BLOCK
    )
    :vars
    (
      ?auto_99244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99243 ?auto_99244 ) ( CLEAR ?auto_99243 ) ( HAND-EMPTY ) ( not ( = ?auto_99243 ?auto_99244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99243 ?auto_99244 )
      ( MAKE-1PILE ?auto_99243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99251 - BLOCK
      ?auto_99252 - BLOCK
      ?auto_99253 - BLOCK
      ?auto_99254 - BLOCK
      ?auto_99255 - BLOCK
      ?auto_99256 - BLOCK
    )
    :vars
    (
      ?auto_99257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99257 ?auto_99256 ) ( CLEAR ?auto_99257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99251 ) ( ON ?auto_99252 ?auto_99251 ) ( ON ?auto_99253 ?auto_99252 ) ( ON ?auto_99254 ?auto_99253 ) ( ON ?auto_99255 ?auto_99254 ) ( ON ?auto_99256 ?auto_99255 ) ( not ( = ?auto_99251 ?auto_99252 ) ) ( not ( = ?auto_99251 ?auto_99253 ) ) ( not ( = ?auto_99251 ?auto_99254 ) ) ( not ( = ?auto_99251 ?auto_99255 ) ) ( not ( = ?auto_99251 ?auto_99256 ) ) ( not ( = ?auto_99251 ?auto_99257 ) ) ( not ( = ?auto_99252 ?auto_99253 ) ) ( not ( = ?auto_99252 ?auto_99254 ) ) ( not ( = ?auto_99252 ?auto_99255 ) ) ( not ( = ?auto_99252 ?auto_99256 ) ) ( not ( = ?auto_99252 ?auto_99257 ) ) ( not ( = ?auto_99253 ?auto_99254 ) ) ( not ( = ?auto_99253 ?auto_99255 ) ) ( not ( = ?auto_99253 ?auto_99256 ) ) ( not ( = ?auto_99253 ?auto_99257 ) ) ( not ( = ?auto_99254 ?auto_99255 ) ) ( not ( = ?auto_99254 ?auto_99256 ) ) ( not ( = ?auto_99254 ?auto_99257 ) ) ( not ( = ?auto_99255 ?auto_99256 ) ) ( not ( = ?auto_99255 ?auto_99257 ) ) ( not ( = ?auto_99256 ?auto_99257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99257 ?auto_99256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99258 - BLOCK
      ?auto_99259 - BLOCK
      ?auto_99260 - BLOCK
      ?auto_99261 - BLOCK
      ?auto_99262 - BLOCK
      ?auto_99263 - BLOCK
    )
    :vars
    (
      ?auto_99264 - BLOCK
      ?auto_99265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99264 ?auto_99263 ) ( CLEAR ?auto_99264 ) ( ON-TABLE ?auto_99258 ) ( ON ?auto_99259 ?auto_99258 ) ( ON ?auto_99260 ?auto_99259 ) ( ON ?auto_99261 ?auto_99260 ) ( ON ?auto_99262 ?auto_99261 ) ( ON ?auto_99263 ?auto_99262 ) ( not ( = ?auto_99258 ?auto_99259 ) ) ( not ( = ?auto_99258 ?auto_99260 ) ) ( not ( = ?auto_99258 ?auto_99261 ) ) ( not ( = ?auto_99258 ?auto_99262 ) ) ( not ( = ?auto_99258 ?auto_99263 ) ) ( not ( = ?auto_99258 ?auto_99264 ) ) ( not ( = ?auto_99259 ?auto_99260 ) ) ( not ( = ?auto_99259 ?auto_99261 ) ) ( not ( = ?auto_99259 ?auto_99262 ) ) ( not ( = ?auto_99259 ?auto_99263 ) ) ( not ( = ?auto_99259 ?auto_99264 ) ) ( not ( = ?auto_99260 ?auto_99261 ) ) ( not ( = ?auto_99260 ?auto_99262 ) ) ( not ( = ?auto_99260 ?auto_99263 ) ) ( not ( = ?auto_99260 ?auto_99264 ) ) ( not ( = ?auto_99261 ?auto_99262 ) ) ( not ( = ?auto_99261 ?auto_99263 ) ) ( not ( = ?auto_99261 ?auto_99264 ) ) ( not ( = ?auto_99262 ?auto_99263 ) ) ( not ( = ?auto_99262 ?auto_99264 ) ) ( not ( = ?auto_99263 ?auto_99264 ) ) ( HOLDING ?auto_99265 ) ( not ( = ?auto_99258 ?auto_99265 ) ) ( not ( = ?auto_99259 ?auto_99265 ) ) ( not ( = ?auto_99260 ?auto_99265 ) ) ( not ( = ?auto_99261 ?auto_99265 ) ) ( not ( = ?auto_99262 ?auto_99265 ) ) ( not ( = ?auto_99263 ?auto_99265 ) ) ( not ( = ?auto_99264 ?auto_99265 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_99265 )
      ( MAKE-6PILE ?auto_99258 ?auto_99259 ?auto_99260 ?auto_99261 ?auto_99262 ?auto_99263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99266 - BLOCK
      ?auto_99267 - BLOCK
      ?auto_99268 - BLOCK
      ?auto_99269 - BLOCK
      ?auto_99270 - BLOCK
      ?auto_99271 - BLOCK
    )
    :vars
    (
      ?auto_99273 - BLOCK
      ?auto_99272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99273 ?auto_99271 ) ( ON-TABLE ?auto_99266 ) ( ON ?auto_99267 ?auto_99266 ) ( ON ?auto_99268 ?auto_99267 ) ( ON ?auto_99269 ?auto_99268 ) ( ON ?auto_99270 ?auto_99269 ) ( ON ?auto_99271 ?auto_99270 ) ( not ( = ?auto_99266 ?auto_99267 ) ) ( not ( = ?auto_99266 ?auto_99268 ) ) ( not ( = ?auto_99266 ?auto_99269 ) ) ( not ( = ?auto_99266 ?auto_99270 ) ) ( not ( = ?auto_99266 ?auto_99271 ) ) ( not ( = ?auto_99266 ?auto_99273 ) ) ( not ( = ?auto_99267 ?auto_99268 ) ) ( not ( = ?auto_99267 ?auto_99269 ) ) ( not ( = ?auto_99267 ?auto_99270 ) ) ( not ( = ?auto_99267 ?auto_99271 ) ) ( not ( = ?auto_99267 ?auto_99273 ) ) ( not ( = ?auto_99268 ?auto_99269 ) ) ( not ( = ?auto_99268 ?auto_99270 ) ) ( not ( = ?auto_99268 ?auto_99271 ) ) ( not ( = ?auto_99268 ?auto_99273 ) ) ( not ( = ?auto_99269 ?auto_99270 ) ) ( not ( = ?auto_99269 ?auto_99271 ) ) ( not ( = ?auto_99269 ?auto_99273 ) ) ( not ( = ?auto_99270 ?auto_99271 ) ) ( not ( = ?auto_99270 ?auto_99273 ) ) ( not ( = ?auto_99271 ?auto_99273 ) ) ( not ( = ?auto_99266 ?auto_99272 ) ) ( not ( = ?auto_99267 ?auto_99272 ) ) ( not ( = ?auto_99268 ?auto_99272 ) ) ( not ( = ?auto_99269 ?auto_99272 ) ) ( not ( = ?auto_99270 ?auto_99272 ) ) ( not ( = ?auto_99271 ?auto_99272 ) ) ( not ( = ?auto_99273 ?auto_99272 ) ) ( ON ?auto_99272 ?auto_99273 ) ( CLEAR ?auto_99272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99266 ?auto_99267 ?auto_99268 ?auto_99269 ?auto_99270 ?auto_99271 ?auto_99273 )
      ( MAKE-6PILE ?auto_99266 ?auto_99267 ?auto_99268 ?auto_99269 ?auto_99270 ?auto_99271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99276 - BLOCK
      ?auto_99277 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99277 ) ( CLEAR ?auto_99276 ) ( ON-TABLE ?auto_99276 ) ( not ( = ?auto_99276 ?auto_99277 ) ) )
    :subtasks
    ( ( !STACK ?auto_99277 ?auto_99276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99278 - BLOCK
      ?auto_99279 - BLOCK
    )
    :vars
    (
      ?auto_99280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99278 ) ( ON-TABLE ?auto_99278 ) ( not ( = ?auto_99278 ?auto_99279 ) ) ( ON ?auto_99279 ?auto_99280 ) ( CLEAR ?auto_99279 ) ( HAND-EMPTY ) ( not ( = ?auto_99278 ?auto_99280 ) ) ( not ( = ?auto_99279 ?auto_99280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99279 ?auto_99280 )
      ( MAKE-2PILE ?auto_99278 ?auto_99279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99281 - BLOCK
      ?auto_99282 - BLOCK
    )
    :vars
    (
      ?auto_99283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99281 ?auto_99282 ) ) ( ON ?auto_99282 ?auto_99283 ) ( CLEAR ?auto_99282 ) ( not ( = ?auto_99281 ?auto_99283 ) ) ( not ( = ?auto_99282 ?auto_99283 ) ) ( HOLDING ?auto_99281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99281 )
      ( MAKE-2PILE ?auto_99281 ?auto_99282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99284 - BLOCK
      ?auto_99285 - BLOCK
    )
    :vars
    (
      ?auto_99286 - BLOCK
      ?auto_99290 - BLOCK
      ?auto_99289 - BLOCK
      ?auto_99291 - BLOCK
      ?auto_99287 - BLOCK
      ?auto_99288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99284 ?auto_99285 ) ) ( ON ?auto_99285 ?auto_99286 ) ( not ( = ?auto_99284 ?auto_99286 ) ) ( not ( = ?auto_99285 ?auto_99286 ) ) ( ON ?auto_99284 ?auto_99285 ) ( CLEAR ?auto_99284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99290 ) ( ON ?auto_99289 ?auto_99290 ) ( ON ?auto_99291 ?auto_99289 ) ( ON ?auto_99287 ?auto_99291 ) ( ON ?auto_99288 ?auto_99287 ) ( ON ?auto_99286 ?auto_99288 ) ( not ( = ?auto_99290 ?auto_99289 ) ) ( not ( = ?auto_99290 ?auto_99291 ) ) ( not ( = ?auto_99290 ?auto_99287 ) ) ( not ( = ?auto_99290 ?auto_99288 ) ) ( not ( = ?auto_99290 ?auto_99286 ) ) ( not ( = ?auto_99290 ?auto_99285 ) ) ( not ( = ?auto_99290 ?auto_99284 ) ) ( not ( = ?auto_99289 ?auto_99291 ) ) ( not ( = ?auto_99289 ?auto_99287 ) ) ( not ( = ?auto_99289 ?auto_99288 ) ) ( not ( = ?auto_99289 ?auto_99286 ) ) ( not ( = ?auto_99289 ?auto_99285 ) ) ( not ( = ?auto_99289 ?auto_99284 ) ) ( not ( = ?auto_99291 ?auto_99287 ) ) ( not ( = ?auto_99291 ?auto_99288 ) ) ( not ( = ?auto_99291 ?auto_99286 ) ) ( not ( = ?auto_99291 ?auto_99285 ) ) ( not ( = ?auto_99291 ?auto_99284 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99286 ) ) ( not ( = ?auto_99287 ?auto_99285 ) ) ( not ( = ?auto_99287 ?auto_99284 ) ) ( not ( = ?auto_99288 ?auto_99286 ) ) ( not ( = ?auto_99288 ?auto_99285 ) ) ( not ( = ?auto_99288 ?auto_99284 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99290 ?auto_99289 ?auto_99291 ?auto_99287 ?auto_99288 ?auto_99286 ?auto_99285 )
      ( MAKE-2PILE ?auto_99284 ?auto_99285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99297 - BLOCK
      ?auto_99298 - BLOCK
      ?auto_99299 - BLOCK
      ?auto_99300 - BLOCK
      ?auto_99301 - BLOCK
    )
    :vars
    (
      ?auto_99302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99302 ?auto_99301 ) ( CLEAR ?auto_99302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99297 ) ( ON ?auto_99298 ?auto_99297 ) ( ON ?auto_99299 ?auto_99298 ) ( ON ?auto_99300 ?auto_99299 ) ( ON ?auto_99301 ?auto_99300 ) ( not ( = ?auto_99297 ?auto_99298 ) ) ( not ( = ?auto_99297 ?auto_99299 ) ) ( not ( = ?auto_99297 ?auto_99300 ) ) ( not ( = ?auto_99297 ?auto_99301 ) ) ( not ( = ?auto_99297 ?auto_99302 ) ) ( not ( = ?auto_99298 ?auto_99299 ) ) ( not ( = ?auto_99298 ?auto_99300 ) ) ( not ( = ?auto_99298 ?auto_99301 ) ) ( not ( = ?auto_99298 ?auto_99302 ) ) ( not ( = ?auto_99299 ?auto_99300 ) ) ( not ( = ?auto_99299 ?auto_99301 ) ) ( not ( = ?auto_99299 ?auto_99302 ) ) ( not ( = ?auto_99300 ?auto_99301 ) ) ( not ( = ?auto_99300 ?auto_99302 ) ) ( not ( = ?auto_99301 ?auto_99302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99302 ?auto_99301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99303 - BLOCK
      ?auto_99304 - BLOCK
      ?auto_99305 - BLOCK
      ?auto_99306 - BLOCK
      ?auto_99307 - BLOCK
    )
    :vars
    (
      ?auto_99308 - BLOCK
      ?auto_99309 - BLOCK
      ?auto_99310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99308 ?auto_99307 ) ( CLEAR ?auto_99308 ) ( ON-TABLE ?auto_99303 ) ( ON ?auto_99304 ?auto_99303 ) ( ON ?auto_99305 ?auto_99304 ) ( ON ?auto_99306 ?auto_99305 ) ( ON ?auto_99307 ?auto_99306 ) ( not ( = ?auto_99303 ?auto_99304 ) ) ( not ( = ?auto_99303 ?auto_99305 ) ) ( not ( = ?auto_99303 ?auto_99306 ) ) ( not ( = ?auto_99303 ?auto_99307 ) ) ( not ( = ?auto_99303 ?auto_99308 ) ) ( not ( = ?auto_99304 ?auto_99305 ) ) ( not ( = ?auto_99304 ?auto_99306 ) ) ( not ( = ?auto_99304 ?auto_99307 ) ) ( not ( = ?auto_99304 ?auto_99308 ) ) ( not ( = ?auto_99305 ?auto_99306 ) ) ( not ( = ?auto_99305 ?auto_99307 ) ) ( not ( = ?auto_99305 ?auto_99308 ) ) ( not ( = ?auto_99306 ?auto_99307 ) ) ( not ( = ?auto_99306 ?auto_99308 ) ) ( not ( = ?auto_99307 ?auto_99308 ) ) ( HOLDING ?auto_99309 ) ( CLEAR ?auto_99310 ) ( not ( = ?auto_99303 ?auto_99309 ) ) ( not ( = ?auto_99303 ?auto_99310 ) ) ( not ( = ?auto_99304 ?auto_99309 ) ) ( not ( = ?auto_99304 ?auto_99310 ) ) ( not ( = ?auto_99305 ?auto_99309 ) ) ( not ( = ?auto_99305 ?auto_99310 ) ) ( not ( = ?auto_99306 ?auto_99309 ) ) ( not ( = ?auto_99306 ?auto_99310 ) ) ( not ( = ?auto_99307 ?auto_99309 ) ) ( not ( = ?auto_99307 ?auto_99310 ) ) ( not ( = ?auto_99308 ?auto_99309 ) ) ( not ( = ?auto_99308 ?auto_99310 ) ) ( not ( = ?auto_99309 ?auto_99310 ) ) )
    :subtasks
    ( ( !STACK ?auto_99309 ?auto_99310 )
      ( MAKE-5PILE ?auto_99303 ?auto_99304 ?auto_99305 ?auto_99306 ?auto_99307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100229 - BLOCK
      ?auto_100230 - BLOCK
      ?auto_100231 - BLOCK
      ?auto_100232 - BLOCK
      ?auto_100233 - BLOCK
    )
    :vars
    (
      ?auto_100234 - BLOCK
      ?auto_100235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100234 ?auto_100233 ) ( ON-TABLE ?auto_100229 ) ( ON ?auto_100230 ?auto_100229 ) ( ON ?auto_100231 ?auto_100230 ) ( ON ?auto_100232 ?auto_100231 ) ( ON ?auto_100233 ?auto_100232 ) ( not ( = ?auto_100229 ?auto_100230 ) ) ( not ( = ?auto_100229 ?auto_100231 ) ) ( not ( = ?auto_100229 ?auto_100232 ) ) ( not ( = ?auto_100229 ?auto_100233 ) ) ( not ( = ?auto_100229 ?auto_100234 ) ) ( not ( = ?auto_100230 ?auto_100231 ) ) ( not ( = ?auto_100230 ?auto_100232 ) ) ( not ( = ?auto_100230 ?auto_100233 ) ) ( not ( = ?auto_100230 ?auto_100234 ) ) ( not ( = ?auto_100231 ?auto_100232 ) ) ( not ( = ?auto_100231 ?auto_100233 ) ) ( not ( = ?auto_100231 ?auto_100234 ) ) ( not ( = ?auto_100232 ?auto_100233 ) ) ( not ( = ?auto_100232 ?auto_100234 ) ) ( not ( = ?auto_100233 ?auto_100234 ) ) ( not ( = ?auto_100229 ?auto_100235 ) ) ( not ( = ?auto_100230 ?auto_100235 ) ) ( not ( = ?auto_100231 ?auto_100235 ) ) ( not ( = ?auto_100232 ?auto_100235 ) ) ( not ( = ?auto_100233 ?auto_100235 ) ) ( not ( = ?auto_100234 ?auto_100235 ) ) ( ON ?auto_100235 ?auto_100234 ) ( CLEAR ?auto_100235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100229 ?auto_100230 ?auto_100231 ?auto_100232 ?auto_100233 ?auto_100234 )
      ( MAKE-5PILE ?auto_100229 ?auto_100230 ?auto_100231 ?auto_100232 ?auto_100233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99319 - BLOCK
      ?auto_99320 - BLOCK
      ?auto_99321 - BLOCK
      ?auto_99322 - BLOCK
      ?auto_99323 - BLOCK
    )
    :vars
    (
      ?auto_99324 - BLOCK
      ?auto_99325 - BLOCK
      ?auto_99326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99324 ?auto_99323 ) ( ON-TABLE ?auto_99319 ) ( ON ?auto_99320 ?auto_99319 ) ( ON ?auto_99321 ?auto_99320 ) ( ON ?auto_99322 ?auto_99321 ) ( ON ?auto_99323 ?auto_99322 ) ( not ( = ?auto_99319 ?auto_99320 ) ) ( not ( = ?auto_99319 ?auto_99321 ) ) ( not ( = ?auto_99319 ?auto_99322 ) ) ( not ( = ?auto_99319 ?auto_99323 ) ) ( not ( = ?auto_99319 ?auto_99324 ) ) ( not ( = ?auto_99320 ?auto_99321 ) ) ( not ( = ?auto_99320 ?auto_99322 ) ) ( not ( = ?auto_99320 ?auto_99323 ) ) ( not ( = ?auto_99320 ?auto_99324 ) ) ( not ( = ?auto_99321 ?auto_99322 ) ) ( not ( = ?auto_99321 ?auto_99323 ) ) ( not ( = ?auto_99321 ?auto_99324 ) ) ( not ( = ?auto_99322 ?auto_99323 ) ) ( not ( = ?auto_99322 ?auto_99324 ) ) ( not ( = ?auto_99323 ?auto_99324 ) ) ( not ( = ?auto_99319 ?auto_99325 ) ) ( not ( = ?auto_99319 ?auto_99326 ) ) ( not ( = ?auto_99320 ?auto_99325 ) ) ( not ( = ?auto_99320 ?auto_99326 ) ) ( not ( = ?auto_99321 ?auto_99325 ) ) ( not ( = ?auto_99321 ?auto_99326 ) ) ( not ( = ?auto_99322 ?auto_99325 ) ) ( not ( = ?auto_99322 ?auto_99326 ) ) ( not ( = ?auto_99323 ?auto_99325 ) ) ( not ( = ?auto_99323 ?auto_99326 ) ) ( not ( = ?auto_99324 ?auto_99325 ) ) ( not ( = ?auto_99324 ?auto_99326 ) ) ( not ( = ?auto_99325 ?auto_99326 ) ) ( ON ?auto_99325 ?auto_99324 ) ( CLEAR ?auto_99325 ) ( HOLDING ?auto_99326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99326 )
      ( MAKE-5PILE ?auto_99319 ?auto_99320 ?auto_99321 ?auto_99322 ?auto_99323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99327 - BLOCK
      ?auto_99328 - BLOCK
      ?auto_99329 - BLOCK
      ?auto_99330 - BLOCK
      ?auto_99331 - BLOCK
    )
    :vars
    (
      ?auto_99334 - BLOCK
      ?auto_99332 - BLOCK
      ?auto_99333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99334 ?auto_99331 ) ( ON-TABLE ?auto_99327 ) ( ON ?auto_99328 ?auto_99327 ) ( ON ?auto_99329 ?auto_99328 ) ( ON ?auto_99330 ?auto_99329 ) ( ON ?auto_99331 ?auto_99330 ) ( not ( = ?auto_99327 ?auto_99328 ) ) ( not ( = ?auto_99327 ?auto_99329 ) ) ( not ( = ?auto_99327 ?auto_99330 ) ) ( not ( = ?auto_99327 ?auto_99331 ) ) ( not ( = ?auto_99327 ?auto_99334 ) ) ( not ( = ?auto_99328 ?auto_99329 ) ) ( not ( = ?auto_99328 ?auto_99330 ) ) ( not ( = ?auto_99328 ?auto_99331 ) ) ( not ( = ?auto_99328 ?auto_99334 ) ) ( not ( = ?auto_99329 ?auto_99330 ) ) ( not ( = ?auto_99329 ?auto_99331 ) ) ( not ( = ?auto_99329 ?auto_99334 ) ) ( not ( = ?auto_99330 ?auto_99331 ) ) ( not ( = ?auto_99330 ?auto_99334 ) ) ( not ( = ?auto_99331 ?auto_99334 ) ) ( not ( = ?auto_99327 ?auto_99332 ) ) ( not ( = ?auto_99327 ?auto_99333 ) ) ( not ( = ?auto_99328 ?auto_99332 ) ) ( not ( = ?auto_99328 ?auto_99333 ) ) ( not ( = ?auto_99329 ?auto_99332 ) ) ( not ( = ?auto_99329 ?auto_99333 ) ) ( not ( = ?auto_99330 ?auto_99332 ) ) ( not ( = ?auto_99330 ?auto_99333 ) ) ( not ( = ?auto_99331 ?auto_99332 ) ) ( not ( = ?auto_99331 ?auto_99333 ) ) ( not ( = ?auto_99334 ?auto_99332 ) ) ( not ( = ?auto_99334 ?auto_99333 ) ) ( not ( = ?auto_99332 ?auto_99333 ) ) ( ON ?auto_99332 ?auto_99334 ) ( ON ?auto_99333 ?auto_99332 ) ( CLEAR ?auto_99333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99327 ?auto_99328 ?auto_99329 ?auto_99330 ?auto_99331 ?auto_99334 ?auto_99332 )
      ( MAKE-5PILE ?auto_99327 ?auto_99328 ?auto_99329 ?auto_99330 ?auto_99331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99338 - BLOCK
      ?auto_99339 - BLOCK
      ?auto_99340 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99340 ) ( CLEAR ?auto_99339 ) ( ON-TABLE ?auto_99338 ) ( ON ?auto_99339 ?auto_99338 ) ( not ( = ?auto_99338 ?auto_99339 ) ) ( not ( = ?auto_99338 ?auto_99340 ) ) ( not ( = ?auto_99339 ?auto_99340 ) ) )
    :subtasks
    ( ( !STACK ?auto_99340 ?auto_99339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99341 - BLOCK
      ?auto_99342 - BLOCK
      ?auto_99343 - BLOCK
    )
    :vars
    (
      ?auto_99344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99342 ) ( ON-TABLE ?auto_99341 ) ( ON ?auto_99342 ?auto_99341 ) ( not ( = ?auto_99341 ?auto_99342 ) ) ( not ( = ?auto_99341 ?auto_99343 ) ) ( not ( = ?auto_99342 ?auto_99343 ) ) ( ON ?auto_99343 ?auto_99344 ) ( CLEAR ?auto_99343 ) ( HAND-EMPTY ) ( not ( = ?auto_99341 ?auto_99344 ) ) ( not ( = ?auto_99342 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99343 ?auto_99344 )
      ( MAKE-3PILE ?auto_99341 ?auto_99342 ?auto_99343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99345 - BLOCK
      ?auto_99346 - BLOCK
      ?auto_99347 - BLOCK
    )
    :vars
    (
      ?auto_99348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99345 ) ( not ( = ?auto_99345 ?auto_99346 ) ) ( not ( = ?auto_99345 ?auto_99347 ) ) ( not ( = ?auto_99346 ?auto_99347 ) ) ( ON ?auto_99347 ?auto_99348 ) ( CLEAR ?auto_99347 ) ( not ( = ?auto_99345 ?auto_99348 ) ) ( not ( = ?auto_99346 ?auto_99348 ) ) ( not ( = ?auto_99347 ?auto_99348 ) ) ( HOLDING ?auto_99346 ) ( CLEAR ?auto_99345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99345 ?auto_99346 )
      ( MAKE-3PILE ?auto_99345 ?auto_99346 ?auto_99347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99349 - BLOCK
      ?auto_99350 - BLOCK
      ?auto_99351 - BLOCK
    )
    :vars
    (
      ?auto_99352 - BLOCK
      ?auto_99355 - BLOCK
      ?auto_99353 - BLOCK
      ?auto_99356 - BLOCK
      ?auto_99354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99349 ) ( not ( = ?auto_99349 ?auto_99350 ) ) ( not ( = ?auto_99349 ?auto_99351 ) ) ( not ( = ?auto_99350 ?auto_99351 ) ) ( ON ?auto_99351 ?auto_99352 ) ( not ( = ?auto_99349 ?auto_99352 ) ) ( not ( = ?auto_99350 ?auto_99352 ) ) ( not ( = ?auto_99351 ?auto_99352 ) ) ( CLEAR ?auto_99349 ) ( ON ?auto_99350 ?auto_99351 ) ( CLEAR ?auto_99350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99355 ) ( ON ?auto_99353 ?auto_99355 ) ( ON ?auto_99356 ?auto_99353 ) ( ON ?auto_99354 ?auto_99356 ) ( ON ?auto_99352 ?auto_99354 ) ( not ( = ?auto_99355 ?auto_99353 ) ) ( not ( = ?auto_99355 ?auto_99356 ) ) ( not ( = ?auto_99355 ?auto_99354 ) ) ( not ( = ?auto_99355 ?auto_99352 ) ) ( not ( = ?auto_99355 ?auto_99351 ) ) ( not ( = ?auto_99355 ?auto_99350 ) ) ( not ( = ?auto_99353 ?auto_99356 ) ) ( not ( = ?auto_99353 ?auto_99354 ) ) ( not ( = ?auto_99353 ?auto_99352 ) ) ( not ( = ?auto_99353 ?auto_99351 ) ) ( not ( = ?auto_99353 ?auto_99350 ) ) ( not ( = ?auto_99356 ?auto_99354 ) ) ( not ( = ?auto_99356 ?auto_99352 ) ) ( not ( = ?auto_99356 ?auto_99351 ) ) ( not ( = ?auto_99356 ?auto_99350 ) ) ( not ( = ?auto_99354 ?auto_99352 ) ) ( not ( = ?auto_99354 ?auto_99351 ) ) ( not ( = ?auto_99354 ?auto_99350 ) ) ( not ( = ?auto_99349 ?auto_99355 ) ) ( not ( = ?auto_99349 ?auto_99353 ) ) ( not ( = ?auto_99349 ?auto_99356 ) ) ( not ( = ?auto_99349 ?auto_99354 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99355 ?auto_99353 ?auto_99356 ?auto_99354 ?auto_99352 ?auto_99351 )
      ( MAKE-3PILE ?auto_99349 ?auto_99350 ?auto_99351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99357 - BLOCK
      ?auto_99358 - BLOCK
      ?auto_99359 - BLOCK
    )
    :vars
    (
      ?auto_99363 - BLOCK
      ?auto_99360 - BLOCK
      ?auto_99362 - BLOCK
      ?auto_99361 - BLOCK
      ?auto_99364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99357 ?auto_99358 ) ) ( not ( = ?auto_99357 ?auto_99359 ) ) ( not ( = ?auto_99358 ?auto_99359 ) ) ( ON ?auto_99359 ?auto_99363 ) ( not ( = ?auto_99357 ?auto_99363 ) ) ( not ( = ?auto_99358 ?auto_99363 ) ) ( not ( = ?auto_99359 ?auto_99363 ) ) ( ON ?auto_99358 ?auto_99359 ) ( CLEAR ?auto_99358 ) ( ON-TABLE ?auto_99360 ) ( ON ?auto_99362 ?auto_99360 ) ( ON ?auto_99361 ?auto_99362 ) ( ON ?auto_99364 ?auto_99361 ) ( ON ?auto_99363 ?auto_99364 ) ( not ( = ?auto_99360 ?auto_99362 ) ) ( not ( = ?auto_99360 ?auto_99361 ) ) ( not ( = ?auto_99360 ?auto_99364 ) ) ( not ( = ?auto_99360 ?auto_99363 ) ) ( not ( = ?auto_99360 ?auto_99359 ) ) ( not ( = ?auto_99360 ?auto_99358 ) ) ( not ( = ?auto_99362 ?auto_99361 ) ) ( not ( = ?auto_99362 ?auto_99364 ) ) ( not ( = ?auto_99362 ?auto_99363 ) ) ( not ( = ?auto_99362 ?auto_99359 ) ) ( not ( = ?auto_99362 ?auto_99358 ) ) ( not ( = ?auto_99361 ?auto_99364 ) ) ( not ( = ?auto_99361 ?auto_99363 ) ) ( not ( = ?auto_99361 ?auto_99359 ) ) ( not ( = ?auto_99361 ?auto_99358 ) ) ( not ( = ?auto_99364 ?auto_99363 ) ) ( not ( = ?auto_99364 ?auto_99359 ) ) ( not ( = ?auto_99364 ?auto_99358 ) ) ( not ( = ?auto_99357 ?auto_99360 ) ) ( not ( = ?auto_99357 ?auto_99362 ) ) ( not ( = ?auto_99357 ?auto_99361 ) ) ( not ( = ?auto_99357 ?auto_99364 ) ) ( HOLDING ?auto_99357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99357 )
      ( MAKE-3PILE ?auto_99357 ?auto_99358 ?auto_99359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99365 - BLOCK
      ?auto_99366 - BLOCK
      ?auto_99367 - BLOCK
    )
    :vars
    (
      ?auto_99371 - BLOCK
      ?auto_99372 - BLOCK
      ?auto_99369 - BLOCK
      ?auto_99370 - BLOCK
      ?auto_99368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99365 ?auto_99366 ) ) ( not ( = ?auto_99365 ?auto_99367 ) ) ( not ( = ?auto_99366 ?auto_99367 ) ) ( ON ?auto_99367 ?auto_99371 ) ( not ( = ?auto_99365 ?auto_99371 ) ) ( not ( = ?auto_99366 ?auto_99371 ) ) ( not ( = ?auto_99367 ?auto_99371 ) ) ( ON ?auto_99366 ?auto_99367 ) ( ON-TABLE ?auto_99372 ) ( ON ?auto_99369 ?auto_99372 ) ( ON ?auto_99370 ?auto_99369 ) ( ON ?auto_99368 ?auto_99370 ) ( ON ?auto_99371 ?auto_99368 ) ( not ( = ?auto_99372 ?auto_99369 ) ) ( not ( = ?auto_99372 ?auto_99370 ) ) ( not ( = ?auto_99372 ?auto_99368 ) ) ( not ( = ?auto_99372 ?auto_99371 ) ) ( not ( = ?auto_99372 ?auto_99367 ) ) ( not ( = ?auto_99372 ?auto_99366 ) ) ( not ( = ?auto_99369 ?auto_99370 ) ) ( not ( = ?auto_99369 ?auto_99368 ) ) ( not ( = ?auto_99369 ?auto_99371 ) ) ( not ( = ?auto_99369 ?auto_99367 ) ) ( not ( = ?auto_99369 ?auto_99366 ) ) ( not ( = ?auto_99370 ?auto_99368 ) ) ( not ( = ?auto_99370 ?auto_99371 ) ) ( not ( = ?auto_99370 ?auto_99367 ) ) ( not ( = ?auto_99370 ?auto_99366 ) ) ( not ( = ?auto_99368 ?auto_99371 ) ) ( not ( = ?auto_99368 ?auto_99367 ) ) ( not ( = ?auto_99368 ?auto_99366 ) ) ( not ( = ?auto_99365 ?auto_99372 ) ) ( not ( = ?auto_99365 ?auto_99369 ) ) ( not ( = ?auto_99365 ?auto_99370 ) ) ( not ( = ?auto_99365 ?auto_99368 ) ) ( ON ?auto_99365 ?auto_99366 ) ( CLEAR ?auto_99365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99372 ?auto_99369 ?auto_99370 ?auto_99368 ?auto_99371 ?auto_99367 ?auto_99366 )
      ( MAKE-3PILE ?auto_99365 ?auto_99366 ?auto_99367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99377 - BLOCK
      ?auto_99378 - BLOCK
      ?auto_99379 - BLOCK
      ?auto_99380 - BLOCK
    )
    :vars
    (
      ?auto_99381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99381 ?auto_99380 ) ( CLEAR ?auto_99381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99377 ) ( ON ?auto_99378 ?auto_99377 ) ( ON ?auto_99379 ?auto_99378 ) ( ON ?auto_99380 ?auto_99379 ) ( not ( = ?auto_99377 ?auto_99378 ) ) ( not ( = ?auto_99377 ?auto_99379 ) ) ( not ( = ?auto_99377 ?auto_99380 ) ) ( not ( = ?auto_99377 ?auto_99381 ) ) ( not ( = ?auto_99378 ?auto_99379 ) ) ( not ( = ?auto_99378 ?auto_99380 ) ) ( not ( = ?auto_99378 ?auto_99381 ) ) ( not ( = ?auto_99379 ?auto_99380 ) ) ( not ( = ?auto_99379 ?auto_99381 ) ) ( not ( = ?auto_99380 ?auto_99381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99381 ?auto_99380 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99382 - BLOCK
      ?auto_99383 - BLOCK
      ?auto_99384 - BLOCK
      ?auto_99385 - BLOCK
    )
    :vars
    (
      ?auto_99386 - BLOCK
      ?auto_99387 - BLOCK
      ?auto_99388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99386 ?auto_99385 ) ( CLEAR ?auto_99386 ) ( ON-TABLE ?auto_99382 ) ( ON ?auto_99383 ?auto_99382 ) ( ON ?auto_99384 ?auto_99383 ) ( ON ?auto_99385 ?auto_99384 ) ( not ( = ?auto_99382 ?auto_99383 ) ) ( not ( = ?auto_99382 ?auto_99384 ) ) ( not ( = ?auto_99382 ?auto_99385 ) ) ( not ( = ?auto_99382 ?auto_99386 ) ) ( not ( = ?auto_99383 ?auto_99384 ) ) ( not ( = ?auto_99383 ?auto_99385 ) ) ( not ( = ?auto_99383 ?auto_99386 ) ) ( not ( = ?auto_99384 ?auto_99385 ) ) ( not ( = ?auto_99384 ?auto_99386 ) ) ( not ( = ?auto_99385 ?auto_99386 ) ) ( HOLDING ?auto_99387 ) ( CLEAR ?auto_99388 ) ( not ( = ?auto_99382 ?auto_99387 ) ) ( not ( = ?auto_99382 ?auto_99388 ) ) ( not ( = ?auto_99383 ?auto_99387 ) ) ( not ( = ?auto_99383 ?auto_99388 ) ) ( not ( = ?auto_99384 ?auto_99387 ) ) ( not ( = ?auto_99384 ?auto_99388 ) ) ( not ( = ?auto_99385 ?auto_99387 ) ) ( not ( = ?auto_99385 ?auto_99388 ) ) ( not ( = ?auto_99386 ?auto_99387 ) ) ( not ( = ?auto_99386 ?auto_99388 ) ) ( not ( = ?auto_99387 ?auto_99388 ) ) )
    :subtasks
    ( ( !STACK ?auto_99387 ?auto_99388 )
      ( MAKE-4PILE ?auto_99382 ?auto_99383 ?auto_99384 ?auto_99385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99389 - BLOCK
      ?auto_99390 - BLOCK
      ?auto_99391 - BLOCK
      ?auto_99392 - BLOCK
    )
    :vars
    (
      ?auto_99395 - BLOCK
      ?auto_99394 - BLOCK
      ?auto_99393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99395 ?auto_99392 ) ( ON-TABLE ?auto_99389 ) ( ON ?auto_99390 ?auto_99389 ) ( ON ?auto_99391 ?auto_99390 ) ( ON ?auto_99392 ?auto_99391 ) ( not ( = ?auto_99389 ?auto_99390 ) ) ( not ( = ?auto_99389 ?auto_99391 ) ) ( not ( = ?auto_99389 ?auto_99392 ) ) ( not ( = ?auto_99389 ?auto_99395 ) ) ( not ( = ?auto_99390 ?auto_99391 ) ) ( not ( = ?auto_99390 ?auto_99392 ) ) ( not ( = ?auto_99390 ?auto_99395 ) ) ( not ( = ?auto_99391 ?auto_99392 ) ) ( not ( = ?auto_99391 ?auto_99395 ) ) ( not ( = ?auto_99392 ?auto_99395 ) ) ( CLEAR ?auto_99394 ) ( not ( = ?auto_99389 ?auto_99393 ) ) ( not ( = ?auto_99389 ?auto_99394 ) ) ( not ( = ?auto_99390 ?auto_99393 ) ) ( not ( = ?auto_99390 ?auto_99394 ) ) ( not ( = ?auto_99391 ?auto_99393 ) ) ( not ( = ?auto_99391 ?auto_99394 ) ) ( not ( = ?auto_99392 ?auto_99393 ) ) ( not ( = ?auto_99392 ?auto_99394 ) ) ( not ( = ?auto_99395 ?auto_99393 ) ) ( not ( = ?auto_99395 ?auto_99394 ) ) ( not ( = ?auto_99393 ?auto_99394 ) ) ( ON ?auto_99393 ?auto_99395 ) ( CLEAR ?auto_99393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99389 ?auto_99390 ?auto_99391 ?auto_99392 ?auto_99395 )
      ( MAKE-4PILE ?auto_99389 ?auto_99390 ?auto_99391 ?auto_99392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99396 - BLOCK
      ?auto_99397 - BLOCK
      ?auto_99398 - BLOCK
      ?auto_99399 - BLOCK
    )
    :vars
    (
      ?auto_99402 - BLOCK
      ?auto_99400 - BLOCK
      ?auto_99401 - BLOCK
      ?auto_99403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99402 ?auto_99399 ) ( ON-TABLE ?auto_99396 ) ( ON ?auto_99397 ?auto_99396 ) ( ON ?auto_99398 ?auto_99397 ) ( ON ?auto_99399 ?auto_99398 ) ( not ( = ?auto_99396 ?auto_99397 ) ) ( not ( = ?auto_99396 ?auto_99398 ) ) ( not ( = ?auto_99396 ?auto_99399 ) ) ( not ( = ?auto_99396 ?auto_99402 ) ) ( not ( = ?auto_99397 ?auto_99398 ) ) ( not ( = ?auto_99397 ?auto_99399 ) ) ( not ( = ?auto_99397 ?auto_99402 ) ) ( not ( = ?auto_99398 ?auto_99399 ) ) ( not ( = ?auto_99398 ?auto_99402 ) ) ( not ( = ?auto_99399 ?auto_99402 ) ) ( not ( = ?auto_99396 ?auto_99400 ) ) ( not ( = ?auto_99396 ?auto_99401 ) ) ( not ( = ?auto_99397 ?auto_99400 ) ) ( not ( = ?auto_99397 ?auto_99401 ) ) ( not ( = ?auto_99398 ?auto_99400 ) ) ( not ( = ?auto_99398 ?auto_99401 ) ) ( not ( = ?auto_99399 ?auto_99400 ) ) ( not ( = ?auto_99399 ?auto_99401 ) ) ( not ( = ?auto_99402 ?auto_99400 ) ) ( not ( = ?auto_99402 ?auto_99401 ) ) ( not ( = ?auto_99400 ?auto_99401 ) ) ( ON ?auto_99400 ?auto_99402 ) ( CLEAR ?auto_99400 ) ( HOLDING ?auto_99401 ) ( CLEAR ?auto_99403 ) ( ON-TABLE ?auto_99403 ) ( not ( = ?auto_99403 ?auto_99401 ) ) ( not ( = ?auto_99396 ?auto_99403 ) ) ( not ( = ?auto_99397 ?auto_99403 ) ) ( not ( = ?auto_99398 ?auto_99403 ) ) ( not ( = ?auto_99399 ?auto_99403 ) ) ( not ( = ?auto_99402 ?auto_99403 ) ) ( not ( = ?auto_99400 ?auto_99403 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99403 ?auto_99401 )
      ( MAKE-4PILE ?auto_99396 ?auto_99397 ?auto_99398 ?auto_99399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100458 - BLOCK
      ?auto_100459 - BLOCK
      ?auto_100460 - BLOCK
      ?auto_100461 - BLOCK
    )
    :vars
    (
      ?auto_100464 - BLOCK
      ?auto_100463 - BLOCK
      ?auto_100462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100464 ?auto_100461 ) ( ON-TABLE ?auto_100458 ) ( ON ?auto_100459 ?auto_100458 ) ( ON ?auto_100460 ?auto_100459 ) ( ON ?auto_100461 ?auto_100460 ) ( not ( = ?auto_100458 ?auto_100459 ) ) ( not ( = ?auto_100458 ?auto_100460 ) ) ( not ( = ?auto_100458 ?auto_100461 ) ) ( not ( = ?auto_100458 ?auto_100464 ) ) ( not ( = ?auto_100459 ?auto_100460 ) ) ( not ( = ?auto_100459 ?auto_100461 ) ) ( not ( = ?auto_100459 ?auto_100464 ) ) ( not ( = ?auto_100460 ?auto_100461 ) ) ( not ( = ?auto_100460 ?auto_100464 ) ) ( not ( = ?auto_100461 ?auto_100464 ) ) ( not ( = ?auto_100458 ?auto_100463 ) ) ( not ( = ?auto_100458 ?auto_100462 ) ) ( not ( = ?auto_100459 ?auto_100463 ) ) ( not ( = ?auto_100459 ?auto_100462 ) ) ( not ( = ?auto_100460 ?auto_100463 ) ) ( not ( = ?auto_100460 ?auto_100462 ) ) ( not ( = ?auto_100461 ?auto_100463 ) ) ( not ( = ?auto_100461 ?auto_100462 ) ) ( not ( = ?auto_100464 ?auto_100463 ) ) ( not ( = ?auto_100464 ?auto_100462 ) ) ( not ( = ?auto_100463 ?auto_100462 ) ) ( ON ?auto_100463 ?auto_100464 ) ( ON ?auto_100462 ?auto_100463 ) ( CLEAR ?auto_100462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ?auto_100464 ?auto_100463 )
      ( MAKE-4PILE ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99412 - BLOCK
      ?auto_99413 - BLOCK
      ?auto_99414 - BLOCK
      ?auto_99415 - BLOCK
    )
    :vars
    (
      ?auto_99419 - BLOCK
      ?auto_99416 - BLOCK
      ?auto_99418 - BLOCK
      ?auto_99417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99419 ?auto_99415 ) ( ON-TABLE ?auto_99412 ) ( ON ?auto_99413 ?auto_99412 ) ( ON ?auto_99414 ?auto_99413 ) ( ON ?auto_99415 ?auto_99414 ) ( not ( = ?auto_99412 ?auto_99413 ) ) ( not ( = ?auto_99412 ?auto_99414 ) ) ( not ( = ?auto_99412 ?auto_99415 ) ) ( not ( = ?auto_99412 ?auto_99419 ) ) ( not ( = ?auto_99413 ?auto_99414 ) ) ( not ( = ?auto_99413 ?auto_99415 ) ) ( not ( = ?auto_99413 ?auto_99419 ) ) ( not ( = ?auto_99414 ?auto_99415 ) ) ( not ( = ?auto_99414 ?auto_99419 ) ) ( not ( = ?auto_99415 ?auto_99419 ) ) ( not ( = ?auto_99412 ?auto_99416 ) ) ( not ( = ?auto_99412 ?auto_99418 ) ) ( not ( = ?auto_99413 ?auto_99416 ) ) ( not ( = ?auto_99413 ?auto_99418 ) ) ( not ( = ?auto_99414 ?auto_99416 ) ) ( not ( = ?auto_99414 ?auto_99418 ) ) ( not ( = ?auto_99415 ?auto_99416 ) ) ( not ( = ?auto_99415 ?auto_99418 ) ) ( not ( = ?auto_99419 ?auto_99416 ) ) ( not ( = ?auto_99419 ?auto_99418 ) ) ( not ( = ?auto_99416 ?auto_99418 ) ) ( ON ?auto_99416 ?auto_99419 ) ( not ( = ?auto_99417 ?auto_99418 ) ) ( not ( = ?auto_99412 ?auto_99417 ) ) ( not ( = ?auto_99413 ?auto_99417 ) ) ( not ( = ?auto_99414 ?auto_99417 ) ) ( not ( = ?auto_99415 ?auto_99417 ) ) ( not ( = ?auto_99419 ?auto_99417 ) ) ( not ( = ?auto_99416 ?auto_99417 ) ) ( ON ?auto_99418 ?auto_99416 ) ( CLEAR ?auto_99418 ) ( HOLDING ?auto_99417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99417 )
      ( MAKE-4PILE ?auto_99412 ?auto_99413 ?auto_99414 ?auto_99415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99420 - BLOCK
      ?auto_99421 - BLOCK
      ?auto_99422 - BLOCK
      ?auto_99423 - BLOCK
    )
    :vars
    (
      ?auto_99424 - BLOCK
      ?auto_99427 - BLOCK
      ?auto_99425 - BLOCK
      ?auto_99426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99424 ?auto_99423 ) ( ON-TABLE ?auto_99420 ) ( ON ?auto_99421 ?auto_99420 ) ( ON ?auto_99422 ?auto_99421 ) ( ON ?auto_99423 ?auto_99422 ) ( not ( = ?auto_99420 ?auto_99421 ) ) ( not ( = ?auto_99420 ?auto_99422 ) ) ( not ( = ?auto_99420 ?auto_99423 ) ) ( not ( = ?auto_99420 ?auto_99424 ) ) ( not ( = ?auto_99421 ?auto_99422 ) ) ( not ( = ?auto_99421 ?auto_99423 ) ) ( not ( = ?auto_99421 ?auto_99424 ) ) ( not ( = ?auto_99422 ?auto_99423 ) ) ( not ( = ?auto_99422 ?auto_99424 ) ) ( not ( = ?auto_99423 ?auto_99424 ) ) ( not ( = ?auto_99420 ?auto_99427 ) ) ( not ( = ?auto_99420 ?auto_99425 ) ) ( not ( = ?auto_99421 ?auto_99427 ) ) ( not ( = ?auto_99421 ?auto_99425 ) ) ( not ( = ?auto_99422 ?auto_99427 ) ) ( not ( = ?auto_99422 ?auto_99425 ) ) ( not ( = ?auto_99423 ?auto_99427 ) ) ( not ( = ?auto_99423 ?auto_99425 ) ) ( not ( = ?auto_99424 ?auto_99427 ) ) ( not ( = ?auto_99424 ?auto_99425 ) ) ( not ( = ?auto_99427 ?auto_99425 ) ) ( ON ?auto_99427 ?auto_99424 ) ( not ( = ?auto_99426 ?auto_99425 ) ) ( not ( = ?auto_99420 ?auto_99426 ) ) ( not ( = ?auto_99421 ?auto_99426 ) ) ( not ( = ?auto_99422 ?auto_99426 ) ) ( not ( = ?auto_99423 ?auto_99426 ) ) ( not ( = ?auto_99424 ?auto_99426 ) ) ( not ( = ?auto_99427 ?auto_99426 ) ) ( ON ?auto_99425 ?auto_99427 ) ( ON ?auto_99426 ?auto_99425 ) ( CLEAR ?auto_99426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99420 ?auto_99421 ?auto_99422 ?auto_99423 ?auto_99424 ?auto_99427 ?auto_99425 )
      ( MAKE-4PILE ?auto_99420 ?auto_99421 ?auto_99422 ?auto_99423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99432 - BLOCK
      ?auto_99433 - BLOCK
      ?auto_99434 - BLOCK
      ?auto_99435 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99435 ) ( CLEAR ?auto_99434 ) ( ON-TABLE ?auto_99432 ) ( ON ?auto_99433 ?auto_99432 ) ( ON ?auto_99434 ?auto_99433 ) ( not ( = ?auto_99432 ?auto_99433 ) ) ( not ( = ?auto_99432 ?auto_99434 ) ) ( not ( = ?auto_99432 ?auto_99435 ) ) ( not ( = ?auto_99433 ?auto_99434 ) ) ( not ( = ?auto_99433 ?auto_99435 ) ) ( not ( = ?auto_99434 ?auto_99435 ) ) )
    :subtasks
    ( ( !STACK ?auto_99435 ?auto_99434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99436 - BLOCK
      ?auto_99437 - BLOCK
      ?auto_99438 - BLOCK
      ?auto_99439 - BLOCK
    )
    :vars
    (
      ?auto_99440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99438 ) ( ON-TABLE ?auto_99436 ) ( ON ?auto_99437 ?auto_99436 ) ( ON ?auto_99438 ?auto_99437 ) ( not ( = ?auto_99436 ?auto_99437 ) ) ( not ( = ?auto_99436 ?auto_99438 ) ) ( not ( = ?auto_99436 ?auto_99439 ) ) ( not ( = ?auto_99437 ?auto_99438 ) ) ( not ( = ?auto_99437 ?auto_99439 ) ) ( not ( = ?auto_99438 ?auto_99439 ) ) ( ON ?auto_99439 ?auto_99440 ) ( CLEAR ?auto_99439 ) ( HAND-EMPTY ) ( not ( = ?auto_99436 ?auto_99440 ) ) ( not ( = ?auto_99437 ?auto_99440 ) ) ( not ( = ?auto_99438 ?auto_99440 ) ) ( not ( = ?auto_99439 ?auto_99440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99439 ?auto_99440 )
      ( MAKE-4PILE ?auto_99436 ?auto_99437 ?auto_99438 ?auto_99439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99441 - BLOCK
      ?auto_99442 - BLOCK
      ?auto_99443 - BLOCK
      ?auto_99444 - BLOCK
    )
    :vars
    (
      ?auto_99445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99441 ) ( ON ?auto_99442 ?auto_99441 ) ( not ( = ?auto_99441 ?auto_99442 ) ) ( not ( = ?auto_99441 ?auto_99443 ) ) ( not ( = ?auto_99441 ?auto_99444 ) ) ( not ( = ?auto_99442 ?auto_99443 ) ) ( not ( = ?auto_99442 ?auto_99444 ) ) ( not ( = ?auto_99443 ?auto_99444 ) ) ( ON ?auto_99444 ?auto_99445 ) ( CLEAR ?auto_99444 ) ( not ( = ?auto_99441 ?auto_99445 ) ) ( not ( = ?auto_99442 ?auto_99445 ) ) ( not ( = ?auto_99443 ?auto_99445 ) ) ( not ( = ?auto_99444 ?auto_99445 ) ) ( HOLDING ?auto_99443 ) ( CLEAR ?auto_99442 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99441 ?auto_99442 ?auto_99443 )
      ( MAKE-4PILE ?auto_99441 ?auto_99442 ?auto_99443 ?auto_99444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99446 - BLOCK
      ?auto_99447 - BLOCK
      ?auto_99448 - BLOCK
      ?auto_99449 - BLOCK
    )
    :vars
    (
      ?auto_99450 - BLOCK
      ?auto_99452 - BLOCK
      ?auto_99453 - BLOCK
      ?auto_99451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99446 ) ( ON ?auto_99447 ?auto_99446 ) ( not ( = ?auto_99446 ?auto_99447 ) ) ( not ( = ?auto_99446 ?auto_99448 ) ) ( not ( = ?auto_99446 ?auto_99449 ) ) ( not ( = ?auto_99447 ?auto_99448 ) ) ( not ( = ?auto_99447 ?auto_99449 ) ) ( not ( = ?auto_99448 ?auto_99449 ) ) ( ON ?auto_99449 ?auto_99450 ) ( not ( = ?auto_99446 ?auto_99450 ) ) ( not ( = ?auto_99447 ?auto_99450 ) ) ( not ( = ?auto_99448 ?auto_99450 ) ) ( not ( = ?auto_99449 ?auto_99450 ) ) ( CLEAR ?auto_99447 ) ( ON ?auto_99448 ?auto_99449 ) ( CLEAR ?auto_99448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99452 ) ( ON ?auto_99453 ?auto_99452 ) ( ON ?auto_99451 ?auto_99453 ) ( ON ?auto_99450 ?auto_99451 ) ( not ( = ?auto_99452 ?auto_99453 ) ) ( not ( = ?auto_99452 ?auto_99451 ) ) ( not ( = ?auto_99452 ?auto_99450 ) ) ( not ( = ?auto_99452 ?auto_99449 ) ) ( not ( = ?auto_99452 ?auto_99448 ) ) ( not ( = ?auto_99453 ?auto_99451 ) ) ( not ( = ?auto_99453 ?auto_99450 ) ) ( not ( = ?auto_99453 ?auto_99449 ) ) ( not ( = ?auto_99453 ?auto_99448 ) ) ( not ( = ?auto_99451 ?auto_99450 ) ) ( not ( = ?auto_99451 ?auto_99449 ) ) ( not ( = ?auto_99451 ?auto_99448 ) ) ( not ( = ?auto_99446 ?auto_99452 ) ) ( not ( = ?auto_99446 ?auto_99453 ) ) ( not ( = ?auto_99446 ?auto_99451 ) ) ( not ( = ?auto_99447 ?auto_99452 ) ) ( not ( = ?auto_99447 ?auto_99453 ) ) ( not ( = ?auto_99447 ?auto_99451 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99452 ?auto_99453 ?auto_99451 ?auto_99450 ?auto_99449 )
      ( MAKE-4PILE ?auto_99446 ?auto_99447 ?auto_99448 ?auto_99449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99454 - BLOCK
      ?auto_99455 - BLOCK
      ?auto_99456 - BLOCK
      ?auto_99457 - BLOCK
    )
    :vars
    (
      ?auto_99460 - BLOCK
      ?auto_99459 - BLOCK
      ?auto_99461 - BLOCK
      ?auto_99458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99454 ) ( not ( = ?auto_99454 ?auto_99455 ) ) ( not ( = ?auto_99454 ?auto_99456 ) ) ( not ( = ?auto_99454 ?auto_99457 ) ) ( not ( = ?auto_99455 ?auto_99456 ) ) ( not ( = ?auto_99455 ?auto_99457 ) ) ( not ( = ?auto_99456 ?auto_99457 ) ) ( ON ?auto_99457 ?auto_99460 ) ( not ( = ?auto_99454 ?auto_99460 ) ) ( not ( = ?auto_99455 ?auto_99460 ) ) ( not ( = ?auto_99456 ?auto_99460 ) ) ( not ( = ?auto_99457 ?auto_99460 ) ) ( ON ?auto_99456 ?auto_99457 ) ( CLEAR ?auto_99456 ) ( ON-TABLE ?auto_99459 ) ( ON ?auto_99461 ?auto_99459 ) ( ON ?auto_99458 ?auto_99461 ) ( ON ?auto_99460 ?auto_99458 ) ( not ( = ?auto_99459 ?auto_99461 ) ) ( not ( = ?auto_99459 ?auto_99458 ) ) ( not ( = ?auto_99459 ?auto_99460 ) ) ( not ( = ?auto_99459 ?auto_99457 ) ) ( not ( = ?auto_99459 ?auto_99456 ) ) ( not ( = ?auto_99461 ?auto_99458 ) ) ( not ( = ?auto_99461 ?auto_99460 ) ) ( not ( = ?auto_99461 ?auto_99457 ) ) ( not ( = ?auto_99461 ?auto_99456 ) ) ( not ( = ?auto_99458 ?auto_99460 ) ) ( not ( = ?auto_99458 ?auto_99457 ) ) ( not ( = ?auto_99458 ?auto_99456 ) ) ( not ( = ?auto_99454 ?auto_99459 ) ) ( not ( = ?auto_99454 ?auto_99461 ) ) ( not ( = ?auto_99454 ?auto_99458 ) ) ( not ( = ?auto_99455 ?auto_99459 ) ) ( not ( = ?auto_99455 ?auto_99461 ) ) ( not ( = ?auto_99455 ?auto_99458 ) ) ( HOLDING ?auto_99455 ) ( CLEAR ?auto_99454 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99454 ?auto_99455 )
      ( MAKE-4PILE ?auto_99454 ?auto_99455 ?auto_99456 ?auto_99457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99462 - BLOCK
      ?auto_99463 - BLOCK
      ?auto_99464 - BLOCK
      ?auto_99465 - BLOCK
    )
    :vars
    (
      ?auto_99469 - BLOCK
      ?auto_99468 - BLOCK
      ?auto_99466 - BLOCK
      ?auto_99467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99462 ) ( not ( = ?auto_99462 ?auto_99463 ) ) ( not ( = ?auto_99462 ?auto_99464 ) ) ( not ( = ?auto_99462 ?auto_99465 ) ) ( not ( = ?auto_99463 ?auto_99464 ) ) ( not ( = ?auto_99463 ?auto_99465 ) ) ( not ( = ?auto_99464 ?auto_99465 ) ) ( ON ?auto_99465 ?auto_99469 ) ( not ( = ?auto_99462 ?auto_99469 ) ) ( not ( = ?auto_99463 ?auto_99469 ) ) ( not ( = ?auto_99464 ?auto_99469 ) ) ( not ( = ?auto_99465 ?auto_99469 ) ) ( ON ?auto_99464 ?auto_99465 ) ( ON-TABLE ?auto_99468 ) ( ON ?auto_99466 ?auto_99468 ) ( ON ?auto_99467 ?auto_99466 ) ( ON ?auto_99469 ?auto_99467 ) ( not ( = ?auto_99468 ?auto_99466 ) ) ( not ( = ?auto_99468 ?auto_99467 ) ) ( not ( = ?auto_99468 ?auto_99469 ) ) ( not ( = ?auto_99468 ?auto_99465 ) ) ( not ( = ?auto_99468 ?auto_99464 ) ) ( not ( = ?auto_99466 ?auto_99467 ) ) ( not ( = ?auto_99466 ?auto_99469 ) ) ( not ( = ?auto_99466 ?auto_99465 ) ) ( not ( = ?auto_99466 ?auto_99464 ) ) ( not ( = ?auto_99467 ?auto_99469 ) ) ( not ( = ?auto_99467 ?auto_99465 ) ) ( not ( = ?auto_99467 ?auto_99464 ) ) ( not ( = ?auto_99462 ?auto_99468 ) ) ( not ( = ?auto_99462 ?auto_99466 ) ) ( not ( = ?auto_99462 ?auto_99467 ) ) ( not ( = ?auto_99463 ?auto_99468 ) ) ( not ( = ?auto_99463 ?auto_99466 ) ) ( not ( = ?auto_99463 ?auto_99467 ) ) ( CLEAR ?auto_99462 ) ( ON ?auto_99463 ?auto_99464 ) ( CLEAR ?auto_99463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99468 ?auto_99466 ?auto_99467 ?auto_99469 ?auto_99465 ?auto_99464 )
      ( MAKE-4PILE ?auto_99462 ?auto_99463 ?auto_99464 ?auto_99465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99470 - BLOCK
      ?auto_99471 - BLOCK
      ?auto_99472 - BLOCK
      ?auto_99473 - BLOCK
    )
    :vars
    (
      ?auto_99475 - BLOCK
      ?auto_99477 - BLOCK
      ?auto_99474 - BLOCK
      ?auto_99476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99470 ?auto_99471 ) ) ( not ( = ?auto_99470 ?auto_99472 ) ) ( not ( = ?auto_99470 ?auto_99473 ) ) ( not ( = ?auto_99471 ?auto_99472 ) ) ( not ( = ?auto_99471 ?auto_99473 ) ) ( not ( = ?auto_99472 ?auto_99473 ) ) ( ON ?auto_99473 ?auto_99475 ) ( not ( = ?auto_99470 ?auto_99475 ) ) ( not ( = ?auto_99471 ?auto_99475 ) ) ( not ( = ?auto_99472 ?auto_99475 ) ) ( not ( = ?auto_99473 ?auto_99475 ) ) ( ON ?auto_99472 ?auto_99473 ) ( ON-TABLE ?auto_99477 ) ( ON ?auto_99474 ?auto_99477 ) ( ON ?auto_99476 ?auto_99474 ) ( ON ?auto_99475 ?auto_99476 ) ( not ( = ?auto_99477 ?auto_99474 ) ) ( not ( = ?auto_99477 ?auto_99476 ) ) ( not ( = ?auto_99477 ?auto_99475 ) ) ( not ( = ?auto_99477 ?auto_99473 ) ) ( not ( = ?auto_99477 ?auto_99472 ) ) ( not ( = ?auto_99474 ?auto_99476 ) ) ( not ( = ?auto_99474 ?auto_99475 ) ) ( not ( = ?auto_99474 ?auto_99473 ) ) ( not ( = ?auto_99474 ?auto_99472 ) ) ( not ( = ?auto_99476 ?auto_99475 ) ) ( not ( = ?auto_99476 ?auto_99473 ) ) ( not ( = ?auto_99476 ?auto_99472 ) ) ( not ( = ?auto_99470 ?auto_99477 ) ) ( not ( = ?auto_99470 ?auto_99474 ) ) ( not ( = ?auto_99470 ?auto_99476 ) ) ( not ( = ?auto_99471 ?auto_99477 ) ) ( not ( = ?auto_99471 ?auto_99474 ) ) ( not ( = ?auto_99471 ?auto_99476 ) ) ( ON ?auto_99471 ?auto_99472 ) ( CLEAR ?auto_99471 ) ( HOLDING ?auto_99470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99470 )
      ( MAKE-4PILE ?auto_99470 ?auto_99471 ?auto_99472 ?auto_99473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_99478 - BLOCK
      ?auto_99479 - BLOCK
      ?auto_99480 - BLOCK
      ?auto_99481 - BLOCK
    )
    :vars
    (
      ?auto_99483 - BLOCK
      ?auto_99484 - BLOCK
      ?auto_99482 - BLOCK
      ?auto_99485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99478 ?auto_99479 ) ) ( not ( = ?auto_99478 ?auto_99480 ) ) ( not ( = ?auto_99478 ?auto_99481 ) ) ( not ( = ?auto_99479 ?auto_99480 ) ) ( not ( = ?auto_99479 ?auto_99481 ) ) ( not ( = ?auto_99480 ?auto_99481 ) ) ( ON ?auto_99481 ?auto_99483 ) ( not ( = ?auto_99478 ?auto_99483 ) ) ( not ( = ?auto_99479 ?auto_99483 ) ) ( not ( = ?auto_99480 ?auto_99483 ) ) ( not ( = ?auto_99481 ?auto_99483 ) ) ( ON ?auto_99480 ?auto_99481 ) ( ON-TABLE ?auto_99484 ) ( ON ?auto_99482 ?auto_99484 ) ( ON ?auto_99485 ?auto_99482 ) ( ON ?auto_99483 ?auto_99485 ) ( not ( = ?auto_99484 ?auto_99482 ) ) ( not ( = ?auto_99484 ?auto_99485 ) ) ( not ( = ?auto_99484 ?auto_99483 ) ) ( not ( = ?auto_99484 ?auto_99481 ) ) ( not ( = ?auto_99484 ?auto_99480 ) ) ( not ( = ?auto_99482 ?auto_99485 ) ) ( not ( = ?auto_99482 ?auto_99483 ) ) ( not ( = ?auto_99482 ?auto_99481 ) ) ( not ( = ?auto_99482 ?auto_99480 ) ) ( not ( = ?auto_99485 ?auto_99483 ) ) ( not ( = ?auto_99485 ?auto_99481 ) ) ( not ( = ?auto_99485 ?auto_99480 ) ) ( not ( = ?auto_99478 ?auto_99484 ) ) ( not ( = ?auto_99478 ?auto_99482 ) ) ( not ( = ?auto_99478 ?auto_99485 ) ) ( not ( = ?auto_99479 ?auto_99484 ) ) ( not ( = ?auto_99479 ?auto_99482 ) ) ( not ( = ?auto_99479 ?auto_99485 ) ) ( ON ?auto_99479 ?auto_99480 ) ( ON ?auto_99478 ?auto_99479 ) ( CLEAR ?auto_99478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99484 ?auto_99482 ?auto_99485 ?auto_99483 ?auto_99481 ?auto_99480 ?auto_99479 )
      ( MAKE-4PILE ?auto_99478 ?auto_99479 ?auto_99480 ?auto_99481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99489 - BLOCK
      ?auto_99490 - BLOCK
      ?auto_99491 - BLOCK
    )
    :vars
    (
      ?auto_99492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99492 ?auto_99491 ) ( CLEAR ?auto_99492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99489 ) ( ON ?auto_99490 ?auto_99489 ) ( ON ?auto_99491 ?auto_99490 ) ( not ( = ?auto_99489 ?auto_99490 ) ) ( not ( = ?auto_99489 ?auto_99491 ) ) ( not ( = ?auto_99489 ?auto_99492 ) ) ( not ( = ?auto_99490 ?auto_99491 ) ) ( not ( = ?auto_99490 ?auto_99492 ) ) ( not ( = ?auto_99491 ?auto_99492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99492 ?auto_99491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99493 - BLOCK
      ?auto_99494 - BLOCK
      ?auto_99495 - BLOCK
    )
    :vars
    (
      ?auto_99496 - BLOCK
      ?auto_99497 - BLOCK
      ?auto_99498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99496 ?auto_99495 ) ( CLEAR ?auto_99496 ) ( ON-TABLE ?auto_99493 ) ( ON ?auto_99494 ?auto_99493 ) ( ON ?auto_99495 ?auto_99494 ) ( not ( = ?auto_99493 ?auto_99494 ) ) ( not ( = ?auto_99493 ?auto_99495 ) ) ( not ( = ?auto_99493 ?auto_99496 ) ) ( not ( = ?auto_99494 ?auto_99495 ) ) ( not ( = ?auto_99494 ?auto_99496 ) ) ( not ( = ?auto_99495 ?auto_99496 ) ) ( HOLDING ?auto_99497 ) ( CLEAR ?auto_99498 ) ( not ( = ?auto_99493 ?auto_99497 ) ) ( not ( = ?auto_99493 ?auto_99498 ) ) ( not ( = ?auto_99494 ?auto_99497 ) ) ( not ( = ?auto_99494 ?auto_99498 ) ) ( not ( = ?auto_99495 ?auto_99497 ) ) ( not ( = ?auto_99495 ?auto_99498 ) ) ( not ( = ?auto_99496 ?auto_99497 ) ) ( not ( = ?auto_99496 ?auto_99498 ) ) ( not ( = ?auto_99497 ?auto_99498 ) ) )
    :subtasks
    ( ( !STACK ?auto_99497 ?auto_99498 )
      ( MAKE-3PILE ?auto_99493 ?auto_99494 ?auto_99495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99499 - BLOCK
      ?auto_99500 - BLOCK
      ?auto_99501 - BLOCK
    )
    :vars
    (
      ?auto_99502 - BLOCK
      ?auto_99504 - BLOCK
      ?auto_99503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99502 ?auto_99501 ) ( ON-TABLE ?auto_99499 ) ( ON ?auto_99500 ?auto_99499 ) ( ON ?auto_99501 ?auto_99500 ) ( not ( = ?auto_99499 ?auto_99500 ) ) ( not ( = ?auto_99499 ?auto_99501 ) ) ( not ( = ?auto_99499 ?auto_99502 ) ) ( not ( = ?auto_99500 ?auto_99501 ) ) ( not ( = ?auto_99500 ?auto_99502 ) ) ( not ( = ?auto_99501 ?auto_99502 ) ) ( CLEAR ?auto_99504 ) ( not ( = ?auto_99499 ?auto_99503 ) ) ( not ( = ?auto_99499 ?auto_99504 ) ) ( not ( = ?auto_99500 ?auto_99503 ) ) ( not ( = ?auto_99500 ?auto_99504 ) ) ( not ( = ?auto_99501 ?auto_99503 ) ) ( not ( = ?auto_99501 ?auto_99504 ) ) ( not ( = ?auto_99502 ?auto_99503 ) ) ( not ( = ?auto_99502 ?auto_99504 ) ) ( not ( = ?auto_99503 ?auto_99504 ) ) ( ON ?auto_99503 ?auto_99502 ) ( CLEAR ?auto_99503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99499 ?auto_99500 ?auto_99501 ?auto_99502 )
      ( MAKE-3PILE ?auto_99499 ?auto_99500 ?auto_99501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99505 - BLOCK
      ?auto_99506 - BLOCK
      ?auto_99507 - BLOCK
    )
    :vars
    (
      ?auto_99510 - BLOCK
      ?auto_99509 - BLOCK
      ?auto_99508 - BLOCK
      ?auto_99512 - BLOCK
      ?auto_99511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99510 ?auto_99507 ) ( ON-TABLE ?auto_99505 ) ( ON ?auto_99506 ?auto_99505 ) ( ON ?auto_99507 ?auto_99506 ) ( not ( = ?auto_99505 ?auto_99506 ) ) ( not ( = ?auto_99505 ?auto_99507 ) ) ( not ( = ?auto_99505 ?auto_99510 ) ) ( not ( = ?auto_99506 ?auto_99507 ) ) ( not ( = ?auto_99506 ?auto_99510 ) ) ( not ( = ?auto_99507 ?auto_99510 ) ) ( not ( = ?auto_99505 ?auto_99509 ) ) ( not ( = ?auto_99505 ?auto_99508 ) ) ( not ( = ?auto_99506 ?auto_99509 ) ) ( not ( = ?auto_99506 ?auto_99508 ) ) ( not ( = ?auto_99507 ?auto_99509 ) ) ( not ( = ?auto_99507 ?auto_99508 ) ) ( not ( = ?auto_99510 ?auto_99509 ) ) ( not ( = ?auto_99510 ?auto_99508 ) ) ( not ( = ?auto_99509 ?auto_99508 ) ) ( ON ?auto_99509 ?auto_99510 ) ( CLEAR ?auto_99509 ) ( HOLDING ?auto_99508 ) ( CLEAR ?auto_99512 ) ( ON-TABLE ?auto_99511 ) ( ON ?auto_99512 ?auto_99511 ) ( not ( = ?auto_99511 ?auto_99512 ) ) ( not ( = ?auto_99511 ?auto_99508 ) ) ( not ( = ?auto_99512 ?auto_99508 ) ) ( not ( = ?auto_99505 ?auto_99512 ) ) ( not ( = ?auto_99505 ?auto_99511 ) ) ( not ( = ?auto_99506 ?auto_99512 ) ) ( not ( = ?auto_99506 ?auto_99511 ) ) ( not ( = ?auto_99507 ?auto_99512 ) ) ( not ( = ?auto_99507 ?auto_99511 ) ) ( not ( = ?auto_99510 ?auto_99512 ) ) ( not ( = ?auto_99510 ?auto_99511 ) ) ( not ( = ?auto_99509 ?auto_99512 ) ) ( not ( = ?auto_99509 ?auto_99511 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99511 ?auto_99512 ?auto_99508 )
      ( MAKE-3PILE ?auto_99505 ?auto_99506 ?auto_99507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99513 - BLOCK
      ?auto_99514 - BLOCK
      ?auto_99515 - BLOCK
    )
    :vars
    (
      ?auto_99516 - BLOCK
      ?auto_99517 - BLOCK
      ?auto_99520 - BLOCK
      ?auto_99519 - BLOCK
      ?auto_99518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99516 ?auto_99515 ) ( ON-TABLE ?auto_99513 ) ( ON ?auto_99514 ?auto_99513 ) ( ON ?auto_99515 ?auto_99514 ) ( not ( = ?auto_99513 ?auto_99514 ) ) ( not ( = ?auto_99513 ?auto_99515 ) ) ( not ( = ?auto_99513 ?auto_99516 ) ) ( not ( = ?auto_99514 ?auto_99515 ) ) ( not ( = ?auto_99514 ?auto_99516 ) ) ( not ( = ?auto_99515 ?auto_99516 ) ) ( not ( = ?auto_99513 ?auto_99517 ) ) ( not ( = ?auto_99513 ?auto_99520 ) ) ( not ( = ?auto_99514 ?auto_99517 ) ) ( not ( = ?auto_99514 ?auto_99520 ) ) ( not ( = ?auto_99515 ?auto_99517 ) ) ( not ( = ?auto_99515 ?auto_99520 ) ) ( not ( = ?auto_99516 ?auto_99517 ) ) ( not ( = ?auto_99516 ?auto_99520 ) ) ( not ( = ?auto_99517 ?auto_99520 ) ) ( ON ?auto_99517 ?auto_99516 ) ( CLEAR ?auto_99519 ) ( ON-TABLE ?auto_99518 ) ( ON ?auto_99519 ?auto_99518 ) ( not ( = ?auto_99518 ?auto_99519 ) ) ( not ( = ?auto_99518 ?auto_99520 ) ) ( not ( = ?auto_99519 ?auto_99520 ) ) ( not ( = ?auto_99513 ?auto_99519 ) ) ( not ( = ?auto_99513 ?auto_99518 ) ) ( not ( = ?auto_99514 ?auto_99519 ) ) ( not ( = ?auto_99514 ?auto_99518 ) ) ( not ( = ?auto_99515 ?auto_99519 ) ) ( not ( = ?auto_99515 ?auto_99518 ) ) ( not ( = ?auto_99516 ?auto_99519 ) ) ( not ( = ?auto_99516 ?auto_99518 ) ) ( not ( = ?auto_99517 ?auto_99519 ) ) ( not ( = ?auto_99517 ?auto_99518 ) ) ( ON ?auto_99520 ?auto_99517 ) ( CLEAR ?auto_99520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99513 ?auto_99514 ?auto_99515 ?auto_99516 ?auto_99517 )
      ( MAKE-3PILE ?auto_99513 ?auto_99514 ?auto_99515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99521 - BLOCK
      ?auto_99522 - BLOCK
      ?auto_99523 - BLOCK
    )
    :vars
    (
      ?auto_99528 - BLOCK
      ?auto_99524 - BLOCK
      ?auto_99525 - BLOCK
      ?auto_99526 - BLOCK
      ?auto_99527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99528 ?auto_99523 ) ( ON-TABLE ?auto_99521 ) ( ON ?auto_99522 ?auto_99521 ) ( ON ?auto_99523 ?auto_99522 ) ( not ( = ?auto_99521 ?auto_99522 ) ) ( not ( = ?auto_99521 ?auto_99523 ) ) ( not ( = ?auto_99521 ?auto_99528 ) ) ( not ( = ?auto_99522 ?auto_99523 ) ) ( not ( = ?auto_99522 ?auto_99528 ) ) ( not ( = ?auto_99523 ?auto_99528 ) ) ( not ( = ?auto_99521 ?auto_99524 ) ) ( not ( = ?auto_99521 ?auto_99525 ) ) ( not ( = ?auto_99522 ?auto_99524 ) ) ( not ( = ?auto_99522 ?auto_99525 ) ) ( not ( = ?auto_99523 ?auto_99524 ) ) ( not ( = ?auto_99523 ?auto_99525 ) ) ( not ( = ?auto_99528 ?auto_99524 ) ) ( not ( = ?auto_99528 ?auto_99525 ) ) ( not ( = ?auto_99524 ?auto_99525 ) ) ( ON ?auto_99524 ?auto_99528 ) ( ON-TABLE ?auto_99526 ) ( not ( = ?auto_99526 ?auto_99527 ) ) ( not ( = ?auto_99526 ?auto_99525 ) ) ( not ( = ?auto_99527 ?auto_99525 ) ) ( not ( = ?auto_99521 ?auto_99527 ) ) ( not ( = ?auto_99521 ?auto_99526 ) ) ( not ( = ?auto_99522 ?auto_99527 ) ) ( not ( = ?auto_99522 ?auto_99526 ) ) ( not ( = ?auto_99523 ?auto_99527 ) ) ( not ( = ?auto_99523 ?auto_99526 ) ) ( not ( = ?auto_99528 ?auto_99527 ) ) ( not ( = ?auto_99528 ?auto_99526 ) ) ( not ( = ?auto_99524 ?auto_99527 ) ) ( not ( = ?auto_99524 ?auto_99526 ) ) ( ON ?auto_99525 ?auto_99524 ) ( CLEAR ?auto_99525 ) ( HOLDING ?auto_99527 ) ( CLEAR ?auto_99526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99526 ?auto_99527 )
      ( MAKE-3PILE ?auto_99521 ?auto_99522 ?auto_99523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100706 - BLOCK
      ?auto_100707 - BLOCK
      ?auto_100708 - BLOCK
    )
    :vars
    (
      ?auto_100709 - BLOCK
      ?auto_100712 - BLOCK
      ?auto_100710 - BLOCK
      ?auto_100711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100709 ?auto_100708 ) ( ON-TABLE ?auto_100706 ) ( ON ?auto_100707 ?auto_100706 ) ( ON ?auto_100708 ?auto_100707 ) ( not ( = ?auto_100706 ?auto_100707 ) ) ( not ( = ?auto_100706 ?auto_100708 ) ) ( not ( = ?auto_100706 ?auto_100709 ) ) ( not ( = ?auto_100707 ?auto_100708 ) ) ( not ( = ?auto_100707 ?auto_100709 ) ) ( not ( = ?auto_100708 ?auto_100709 ) ) ( not ( = ?auto_100706 ?auto_100712 ) ) ( not ( = ?auto_100706 ?auto_100710 ) ) ( not ( = ?auto_100707 ?auto_100712 ) ) ( not ( = ?auto_100707 ?auto_100710 ) ) ( not ( = ?auto_100708 ?auto_100712 ) ) ( not ( = ?auto_100708 ?auto_100710 ) ) ( not ( = ?auto_100709 ?auto_100712 ) ) ( not ( = ?auto_100709 ?auto_100710 ) ) ( not ( = ?auto_100712 ?auto_100710 ) ) ( ON ?auto_100712 ?auto_100709 ) ( not ( = ?auto_100711 ?auto_100710 ) ) ( not ( = ?auto_100706 ?auto_100711 ) ) ( not ( = ?auto_100707 ?auto_100711 ) ) ( not ( = ?auto_100708 ?auto_100711 ) ) ( not ( = ?auto_100709 ?auto_100711 ) ) ( not ( = ?auto_100712 ?auto_100711 ) ) ( ON ?auto_100710 ?auto_100712 ) ( ON ?auto_100711 ?auto_100710 ) ( CLEAR ?auto_100711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100706 ?auto_100707 ?auto_100708 ?auto_100709 ?auto_100712 ?auto_100710 )
      ( MAKE-3PILE ?auto_100706 ?auto_100707 ?auto_100708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99537 - BLOCK
      ?auto_99538 - BLOCK
      ?auto_99539 - BLOCK
    )
    :vars
    (
      ?auto_99542 - BLOCK
      ?auto_99543 - BLOCK
      ?auto_99541 - BLOCK
      ?auto_99544 - BLOCK
      ?auto_99540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99542 ?auto_99539 ) ( ON-TABLE ?auto_99537 ) ( ON ?auto_99538 ?auto_99537 ) ( ON ?auto_99539 ?auto_99538 ) ( not ( = ?auto_99537 ?auto_99538 ) ) ( not ( = ?auto_99537 ?auto_99539 ) ) ( not ( = ?auto_99537 ?auto_99542 ) ) ( not ( = ?auto_99538 ?auto_99539 ) ) ( not ( = ?auto_99538 ?auto_99542 ) ) ( not ( = ?auto_99539 ?auto_99542 ) ) ( not ( = ?auto_99537 ?auto_99543 ) ) ( not ( = ?auto_99537 ?auto_99541 ) ) ( not ( = ?auto_99538 ?auto_99543 ) ) ( not ( = ?auto_99538 ?auto_99541 ) ) ( not ( = ?auto_99539 ?auto_99543 ) ) ( not ( = ?auto_99539 ?auto_99541 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99541 ) ) ( not ( = ?auto_99543 ?auto_99541 ) ) ( ON ?auto_99543 ?auto_99542 ) ( not ( = ?auto_99544 ?auto_99540 ) ) ( not ( = ?auto_99544 ?auto_99541 ) ) ( not ( = ?auto_99540 ?auto_99541 ) ) ( not ( = ?auto_99537 ?auto_99540 ) ) ( not ( = ?auto_99537 ?auto_99544 ) ) ( not ( = ?auto_99538 ?auto_99540 ) ) ( not ( = ?auto_99538 ?auto_99544 ) ) ( not ( = ?auto_99539 ?auto_99540 ) ) ( not ( = ?auto_99539 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99540 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99540 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( ON ?auto_99541 ?auto_99543 ) ( ON ?auto_99540 ?auto_99541 ) ( CLEAR ?auto_99540 ) ( HOLDING ?auto_99544 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99544 )
      ( MAKE-3PILE ?auto_99537 ?auto_99538 ?auto_99539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_99545 - BLOCK
      ?auto_99546 - BLOCK
      ?auto_99547 - BLOCK
    )
    :vars
    (
      ?auto_99548 - BLOCK
      ?auto_99551 - BLOCK
      ?auto_99552 - BLOCK
      ?auto_99549 - BLOCK
      ?auto_99550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99548 ?auto_99547 ) ( ON-TABLE ?auto_99545 ) ( ON ?auto_99546 ?auto_99545 ) ( ON ?auto_99547 ?auto_99546 ) ( not ( = ?auto_99545 ?auto_99546 ) ) ( not ( = ?auto_99545 ?auto_99547 ) ) ( not ( = ?auto_99545 ?auto_99548 ) ) ( not ( = ?auto_99546 ?auto_99547 ) ) ( not ( = ?auto_99546 ?auto_99548 ) ) ( not ( = ?auto_99547 ?auto_99548 ) ) ( not ( = ?auto_99545 ?auto_99551 ) ) ( not ( = ?auto_99545 ?auto_99552 ) ) ( not ( = ?auto_99546 ?auto_99551 ) ) ( not ( = ?auto_99546 ?auto_99552 ) ) ( not ( = ?auto_99547 ?auto_99551 ) ) ( not ( = ?auto_99547 ?auto_99552 ) ) ( not ( = ?auto_99548 ?auto_99551 ) ) ( not ( = ?auto_99548 ?auto_99552 ) ) ( not ( = ?auto_99551 ?auto_99552 ) ) ( ON ?auto_99551 ?auto_99548 ) ( not ( = ?auto_99549 ?auto_99550 ) ) ( not ( = ?auto_99549 ?auto_99552 ) ) ( not ( = ?auto_99550 ?auto_99552 ) ) ( not ( = ?auto_99545 ?auto_99550 ) ) ( not ( = ?auto_99545 ?auto_99549 ) ) ( not ( = ?auto_99546 ?auto_99550 ) ) ( not ( = ?auto_99546 ?auto_99549 ) ) ( not ( = ?auto_99547 ?auto_99550 ) ) ( not ( = ?auto_99547 ?auto_99549 ) ) ( not ( = ?auto_99548 ?auto_99550 ) ) ( not ( = ?auto_99548 ?auto_99549 ) ) ( not ( = ?auto_99551 ?auto_99550 ) ) ( not ( = ?auto_99551 ?auto_99549 ) ) ( ON ?auto_99552 ?auto_99551 ) ( ON ?auto_99550 ?auto_99552 ) ( ON ?auto_99549 ?auto_99550 ) ( CLEAR ?auto_99549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99545 ?auto_99546 ?auto_99547 ?auto_99548 ?auto_99551 ?auto_99552 ?auto_99550 )
      ( MAKE-3PILE ?auto_99545 ?auto_99546 ?auto_99547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99558 - BLOCK
      ?auto_99559 - BLOCK
      ?auto_99560 - BLOCK
      ?auto_99561 - BLOCK
      ?auto_99562 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99562 ) ( CLEAR ?auto_99561 ) ( ON-TABLE ?auto_99558 ) ( ON ?auto_99559 ?auto_99558 ) ( ON ?auto_99560 ?auto_99559 ) ( ON ?auto_99561 ?auto_99560 ) ( not ( = ?auto_99558 ?auto_99559 ) ) ( not ( = ?auto_99558 ?auto_99560 ) ) ( not ( = ?auto_99558 ?auto_99561 ) ) ( not ( = ?auto_99558 ?auto_99562 ) ) ( not ( = ?auto_99559 ?auto_99560 ) ) ( not ( = ?auto_99559 ?auto_99561 ) ) ( not ( = ?auto_99559 ?auto_99562 ) ) ( not ( = ?auto_99560 ?auto_99561 ) ) ( not ( = ?auto_99560 ?auto_99562 ) ) ( not ( = ?auto_99561 ?auto_99562 ) ) )
    :subtasks
    ( ( !STACK ?auto_99562 ?auto_99561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99563 - BLOCK
      ?auto_99564 - BLOCK
      ?auto_99565 - BLOCK
      ?auto_99566 - BLOCK
      ?auto_99567 - BLOCK
    )
    :vars
    (
      ?auto_99568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99566 ) ( ON-TABLE ?auto_99563 ) ( ON ?auto_99564 ?auto_99563 ) ( ON ?auto_99565 ?auto_99564 ) ( ON ?auto_99566 ?auto_99565 ) ( not ( = ?auto_99563 ?auto_99564 ) ) ( not ( = ?auto_99563 ?auto_99565 ) ) ( not ( = ?auto_99563 ?auto_99566 ) ) ( not ( = ?auto_99563 ?auto_99567 ) ) ( not ( = ?auto_99564 ?auto_99565 ) ) ( not ( = ?auto_99564 ?auto_99566 ) ) ( not ( = ?auto_99564 ?auto_99567 ) ) ( not ( = ?auto_99565 ?auto_99566 ) ) ( not ( = ?auto_99565 ?auto_99567 ) ) ( not ( = ?auto_99566 ?auto_99567 ) ) ( ON ?auto_99567 ?auto_99568 ) ( CLEAR ?auto_99567 ) ( HAND-EMPTY ) ( not ( = ?auto_99563 ?auto_99568 ) ) ( not ( = ?auto_99564 ?auto_99568 ) ) ( not ( = ?auto_99565 ?auto_99568 ) ) ( not ( = ?auto_99566 ?auto_99568 ) ) ( not ( = ?auto_99567 ?auto_99568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99567 ?auto_99568 )
      ( MAKE-5PILE ?auto_99563 ?auto_99564 ?auto_99565 ?auto_99566 ?auto_99567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99569 - BLOCK
      ?auto_99570 - BLOCK
      ?auto_99571 - BLOCK
      ?auto_99572 - BLOCK
      ?auto_99573 - BLOCK
    )
    :vars
    (
      ?auto_99574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99569 ) ( ON ?auto_99570 ?auto_99569 ) ( ON ?auto_99571 ?auto_99570 ) ( not ( = ?auto_99569 ?auto_99570 ) ) ( not ( = ?auto_99569 ?auto_99571 ) ) ( not ( = ?auto_99569 ?auto_99572 ) ) ( not ( = ?auto_99569 ?auto_99573 ) ) ( not ( = ?auto_99570 ?auto_99571 ) ) ( not ( = ?auto_99570 ?auto_99572 ) ) ( not ( = ?auto_99570 ?auto_99573 ) ) ( not ( = ?auto_99571 ?auto_99572 ) ) ( not ( = ?auto_99571 ?auto_99573 ) ) ( not ( = ?auto_99572 ?auto_99573 ) ) ( ON ?auto_99573 ?auto_99574 ) ( CLEAR ?auto_99573 ) ( not ( = ?auto_99569 ?auto_99574 ) ) ( not ( = ?auto_99570 ?auto_99574 ) ) ( not ( = ?auto_99571 ?auto_99574 ) ) ( not ( = ?auto_99572 ?auto_99574 ) ) ( not ( = ?auto_99573 ?auto_99574 ) ) ( HOLDING ?auto_99572 ) ( CLEAR ?auto_99571 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99569 ?auto_99570 ?auto_99571 ?auto_99572 )
      ( MAKE-5PILE ?auto_99569 ?auto_99570 ?auto_99571 ?auto_99572 ?auto_99573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99575 - BLOCK
      ?auto_99576 - BLOCK
      ?auto_99577 - BLOCK
      ?auto_99578 - BLOCK
      ?auto_99579 - BLOCK
    )
    :vars
    (
      ?auto_99580 - BLOCK
      ?auto_99581 - BLOCK
      ?auto_99582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99575 ) ( ON ?auto_99576 ?auto_99575 ) ( ON ?auto_99577 ?auto_99576 ) ( not ( = ?auto_99575 ?auto_99576 ) ) ( not ( = ?auto_99575 ?auto_99577 ) ) ( not ( = ?auto_99575 ?auto_99578 ) ) ( not ( = ?auto_99575 ?auto_99579 ) ) ( not ( = ?auto_99576 ?auto_99577 ) ) ( not ( = ?auto_99576 ?auto_99578 ) ) ( not ( = ?auto_99576 ?auto_99579 ) ) ( not ( = ?auto_99577 ?auto_99578 ) ) ( not ( = ?auto_99577 ?auto_99579 ) ) ( not ( = ?auto_99578 ?auto_99579 ) ) ( ON ?auto_99579 ?auto_99580 ) ( not ( = ?auto_99575 ?auto_99580 ) ) ( not ( = ?auto_99576 ?auto_99580 ) ) ( not ( = ?auto_99577 ?auto_99580 ) ) ( not ( = ?auto_99578 ?auto_99580 ) ) ( not ( = ?auto_99579 ?auto_99580 ) ) ( CLEAR ?auto_99577 ) ( ON ?auto_99578 ?auto_99579 ) ( CLEAR ?auto_99578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99581 ) ( ON ?auto_99582 ?auto_99581 ) ( ON ?auto_99580 ?auto_99582 ) ( not ( = ?auto_99581 ?auto_99582 ) ) ( not ( = ?auto_99581 ?auto_99580 ) ) ( not ( = ?auto_99581 ?auto_99579 ) ) ( not ( = ?auto_99581 ?auto_99578 ) ) ( not ( = ?auto_99582 ?auto_99580 ) ) ( not ( = ?auto_99582 ?auto_99579 ) ) ( not ( = ?auto_99582 ?auto_99578 ) ) ( not ( = ?auto_99575 ?auto_99581 ) ) ( not ( = ?auto_99575 ?auto_99582 ) ) ( not ( = ?auto_99576 ?auto_99581 ) ) ( not ( = ?auto_99576 ?auto_99582 ) ) ( not ( = ?auto_99577 ?auto_99581 ) ) ( not ( = ?auto_99577 ?auto_99582 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99581 ?auto_99582 ?auto_99580 ?auto_99579 )
      ( MAKE-5PILE ?auto_99575 ?auto_99576 ?auto_99577 ?auto_99578 ?auto_99579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99583 - BLOCK
      ?auto_99584 - BLOCK
      ?auto_99585 - BLOCK
      ?auto_99586 - BLOCK
      ?auto_99587 - BLOCK
    )
    :vars
    (
      ?auto_99590 - BLOCK
      ?auto_99588 - BLOCK
      ?auto_99589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99583 ) ( ON ?auto_99584 ?auto_99583 ) ( not ( = ?auto_99583 ?auto_99584 ) ) ( not ( = ?auto_99583 ?auto_99585 ) ) ( not ( = ?auto_99583 ?auto_99586 ) ) ( not ( = ?auto_99583 ?auto_99587 ) ) ( not ( = ?auto_99584 ?auto_99585 ) ) ( not ( = ?auto_99584 ?auto_99586 ) ) ( not ( = ?auto_99584 ?auto_99587 ) ) ( not ( = ?auto_99585 ?auto_99586 ) ) ( not ( = ?auto_99585 ?auto_99587 ) ) ( not ( = ?auto_99586 ?auto_99587 ) ) ( ON ?auto_99587 ?auto_99590 ) ( not ( = ?auto_99583 ?auto_99590 ) ) ( not ( = ?auto_99584 ?auto_99590 ) ) ( not ( = ?auto_99585 ?auto_99590 ) ) ( not ( = ?auto_99586 ?auto_99590 ) ) ( not ( = ?auto_99587 ?auto_99590 ) ) ( ON ?auto_99586 ?auto_99587 ) ( CLEAR ?auto_99586 ) ( ON-TABLE ?auto_99588 ) ( ON ?auto_99589 ?auto_99588 ) ( ON ?auto_99590 ?auto_99589 ) ( not ( = ?auto_99588 ?auto_99589 ) ) ( not ( = ?auto_99588 ?auto_99590 ) ) ( not ( = ?auto_99588 ?auto_99587 ) ) ( not ( = ?auto_99588 ?auto_99586 ) ) ( not ( = ?auto_99589 ?auto_99590 ) ) ( not ( = ?auto_99589 ?auto_99587 ) ) ( not ( = ?auto_99589 ?auto_99586 ) ) ( not ( = ?auto_99583 ?auto_99588 ) ) ( not ( = ?auto_99583 ?auto_99589 ) ) ( not ( = ?auto_99584 ?auto_99588 ) ) ( not ( = ?auto_99584 ?auto_99589 ) ) ( not ( = ?auto_99585 ?auto_99588 ) ) ( not ( = ?auto_99585 ?auto_99589 ) ) ( HOLDING ?auto_99585 ) ( CLEAR ?auto_99584 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99583 ?auto_99584 ?auto_99585 )
      ( MAKE-5PILE ?auto_99583 ?auto_99584 ?auto_99585 ?auto_99586 ?auto_99587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99591 - BLOCK
      ?auto_99592 - BLOCK
      ?auto_99593 - BLOCK
      ?auto_99594 - BLOCK
      ?auto_99595 - BLOCK
    )
    :vars
    (
      ?auto_99597 - BLOCK
      ?auto_99596 - BLOCK
      ?auto_99598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99591 ) ( ON ?auto_99592 ?auto_99591 ) ( not ( = ?auto_99591 ?auto_99592 ) ) ( not ( = ?auto_99591 ?auto_99593 ) ) ( not ( = ?auto_99591 ?auto_99594 ) ) ( not ( = ?auto_99591 ?auto_99595 ) ) ( not ( = ?auto_99592 ?auto_99593 ) ) ( not ( = ?auto_99592 ?auto_99594 ) ) ( not ( = ?auto_99592 ?auto_99595 ) ) ( not ( = ?auto_99593 ?auto_99594 ) ) ( not ( = ?auto_99593 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99595 ) ) ( ON ?auto_99595 ?auto_99597 ) ( not ( = ?auto_99591 ?auto_99597 ) ) ( not ( = ?auto_99592 ?auto_99597 ) ) ( not ( = ?auto_99593 ?auto_99597 ) ) ( not ( = ?auto_99594 ?auto_99597 ) ) ( not ( = ?auto_99595 ?auto_99597 ) ) ( ON ?auto_99594 ?auto_99595 ) ( ON-TABLE ?auto_99596 ) ( ON ?auto_99598 ?auto_99596 ) ( ON ?auto_99597 ?auto_99598 ) ( not ( = ?auto_99596 ?auto_99598 ) ) ( not ( = ?auto_99596 ?auto_99597 ) ) ( not ( = ?auto_99596 ?auto_99595 ) ) ( not ( = ?auto_99596 ?auto_99594 ) ) ( not ( = ?auto_99598 ?auto_99597 ) ) ( not ( = ?auto_99598 ?auto_99595 ) ) ( not ( = ?auto_99598 ?auto_99594 ) ) ( not ( = ?auto_99591 ?auto_99596 ) ) ( not ( = ?auto_99591 ?auto_99598 ) ) ( not ( = ?auto_99592 ?auto_99596 ) ) ( not ( = ?auto_99592 ?auto_99598 ) ) ( not ( = ?auto_99593 ?auto_99596 ) ) ( not ( = ?auto_99593 ?auto_99598 ) ) ( CLEAR ?auto_99592 ) ( ON ?auto_99593 ?auto_99594 ) ( CLEAR ?auto_99593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99596 ?auto_99598 ?auto_99597 ?auto_99595 ?auto_99594 )
      ( MAKE-5PILE ?auto_99591 ?auto_99592 ?auto_99593 ?auto_99594 ?auto_99595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99599 - BLOCK
      ?auto_99600 - BLOCK
      ?auto_99601 - BLOCK
      ?auto_99602 - BLOCK
      ?auto_99603 - BLOCK
    )
    :vars
    (
      ?auto_99604 - BLOCK
      ?auto_99606 - BLOCK
      ?auto_99605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99599 ) ( not ( = ?auto_99599 ?auto_99600 ) ) ( not ( = ?auto_99599 ?auto_99601 ) ) ( not ( = ?auto_99599 ?auto_99602 ) ) ( not ( = ?auto_99599 ?auto_99603 ) ) ( not ( = ?auto_99600 ?auto_99601 ) ) ( not ( = ?auto_99600 ?auto_99602 ) ) ( not ( = ?auto_99600 ?auto_99603 ) ) ( not ( = ?auto_99601 ?auto_99602 ) ) ( not ( = ?auto_99601 ?auto_99603 ) ) ( not ( = ?auto_99602 ?auto_99603 ) ) ( ON ?auto_99603 ?auto_99604 ) ( not ( = ?auto_99599 ?auto_99604 ) ) ( not ( = ?auto_99600 ?auto_99604 ) ) ( not ( = ?auto_99601 ?auto_99604 ) ) ( not ( = ?auto_99602 ?auto_99604 ) ) ( not ( = ?auto_99603 ?auto_99604 ) ) ( ON ?auto_99602 ?auto_99603 ) ( ON-TABLE ?auto_99606 ) ( ON ?auto_99605 ?auto_99606 ) ( ON ?auto_99604 ?auto_99605 ) ( not ( = ?auto_99606 ?auto_99605 ) ) ( not ( = ?auto_99606 ?auto_99604 ) ) ( not ( = ?auto_99606 ?auto_99603 ) ) ( not ( = ?auto_99606 ?auto_99602 ) ) ( not ( = ?auto_99605 ?auto_99604 ) ) ( not ( = ?auto_99605 ?auto_99603 ) ) ( not ( = ?auto_99605 ?auto_99602 ) ) ( not ( = ?auto_99599 ?auto_99606 ) ) ( not ( = ?auto_99599 ?auto_99605 ) ) ( not ( = ?auto_99600 ?auto_99606 ) ) ( not ( = ?auto_99600 ?auto_99605 ) ) ( not ( = ?auto_99601 ?auto_99606 ) ) ( not ( = ?auto_99601 ?auto_99605 ) ) ( ON ?auto_99601 ?auto_99602 ) ( CLEAR ?auto_99601 ) ( HOLDING ?auto_99600 ) ( CLEAR ?auto_99599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99599 ?auto_99600 )
      ( MAKE-5PILE ?auto_99599 ?auto_99600 ?auto_99601 ?auto_99602 ?auto_99603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99607 - BLOCK
      ?auto_99608 - BLOCK
      ?auto_99609 - BLOCK
      ?auto_99610 - BLOCK
      ?auto_99611 - BLOCK
    )
    :vars
    (
      ?auto_99614 - BLOCK
      ?auto_99612 - BLOCK
      ?auto_99613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99607 ) ( not ( = ?auto_99607 ?auto_99608 ) ) ( not ( = ?auto_99607 ?auto_99609 ) ) ( not ( = ?auto_99607 ?auto_99610 ) ) ( not ( = ?auto_99607 ?auto_99611 ) ) ( not ( = ?auto_99608 ?auto_99609 ) ) ( not ( = ?auto_99608 ?auto_99610 ) ) ( not ( = ?auto_99608 ?auto_99611 ) ) ( not ( = ?auto_99609 ?auto_99610 ) ) ( not ( = ?auto_99609 ?auto_99611 ) ) ( not ( = ?auto_99610 ?auto_99611 ) ) ( ON ?auto_99611 ?auto_99614 ) ( not ( = ?auto_99607 ?auto_99614 ) ) ( not ( = ?auto_99608 ?auto_99614 ) ) ( not ( = ?auto_99609 ?auto_99614 ) ) ( not ( = ?auto_99610 ?auto_99614 ) ) ( not ( = ?auto_99611 ?auto_99614 ) ) ( ON ?auto_99610 ?auto_99611 ) ( ON-TABLE ?auto_99612 ) ( ON ?auto_99613 ?auto_99612 ) ( ON ?auto_99614 ?auto_99613 ) ( not ( = ?auto_99612 ?auto_99613 ) ) ( not ( = ?auto_99612 ?auto_99614 ) ) ( not ( = ?auto_99612 ?auto_99611 ) ) ( not ( = ?auto_99612 ?auto_99610 ) ) ( not ( = ?auto_99613 ?auto_99614 ) ) ( not ( = ?auto_99613 ?auto_99611 ) ) ( not ( = ?auto_99613 ?auto_99610 ) ) ( not ( = ?auto_99607 ?auto_99612 ) ) ( not ( = ?auto_99607 ?auto_99613 ) ) ( not ( = ?auto_99608 ?auto_99612 ) ) ( not ( = ?auto_99608 ?auto_99613 ) ) ( not ( = ?auto_99609 ?auto_99612 ) ) ( not ( = ?auto_99609 ?auto_99613 ) ) ( ON ?auto_99609 ?auto_99610 ) ( CLEAR ?auto_99607 ) ( ON ?auto_99608 ?auto_99609 ) ( CLEAR ?auto_99608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99612 ?auto_99613 ?auto_99614 ?auto_99611 ?auto_99610 ?auto_99609 )
      ( MAKE-5PILE ?auto_99607 ?auto_99608 ?auto_99609 ?auto_99610 ?auto_99611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99615 - BLOCK
      ?auto_99616 - BLOCK
      ?auto_99617 - BLOCK
      ?auto_99618 - BLOCK
      ?auto_99619 - BLOCK
    )
    :vars
    (
      ?auto_99622 - BLOCK
      ?auto_99621 - BLOCK
      ?auto_99620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99615 ?auto_99616 ) ) ( not ( = ?auto_99615 ?auto_99617 ) ) ( not ( = ?auto_99615 ?auto_99618 ) ) ( not ( = ?auto_99615 ?auto_99619 ) ) ( not ( = ?auto_99616 ?auto_99617 ) ) ( not ( = ?auto_99616 ?auto_99618 ) ) ( not ( = ?auto_99616 ?auto_99619 ) ) ( not ( = ?auto_99617 ?auto_99618 ) ) ( not ( = ?auto_99617 ?auto_99619 ) ) ( not ( = ?auto_99618 ?auto_99619 ) ) ( ON ?auto_99619 ?auto_99622 ) ( not ( = ?auto_99615 ?auto_99622 ) ) ( not ( = ?auto_99616 ?auto_99622 ) ) ( not ( = ?auto_99617 ?auto_99622 ) ) ( not ( = ?auto_99618 ?auto_99622 ) ) ( not ( = ?auto_99619 ?auto_99622 ) ) ( ON ?auto_99618 ?auto_99619 ) ( ON-TABLE ?auto_99621 ) ( ON ?auto_99620 ?auto_99621 ) ( ON ?auto_99622 ?auto_99620 ) ( not ( = ?auto_99621 ?auto_99620 ) ) ( not ( = ?auto_99621 ?auto_99622 ) ) ( not ( = ?auto_99621 ?auto_99619 ) ) ( not ( = ?auto_99621 ?auto_99618 ) ) ( not ( = ?auto_99620 ?auto_99622 ) ) ( not ( = ?auto_99620 ?auto_99619 ) ) ( not ( = ?auto_99620 ?auto_99618 ) ) ( not ( = ?auto_99615 ?auto_99621 ) ) ( not ( = ?auto_99615 ?auto_99620 ) ) ( not ( = ?auto_99616 ?auto_99621 ) ) ( not ( = ?auto_99616 ?auto_99620 ) ) ( not ( = ?auto_99617 ?auto_99621 ) ) ( not ( = ?auto_99617 ?auto_99620 ) ) ( ON ?auto_99617 ?auto_99618 ) ( ON ?auto_99616 ?auto_99617 ) ( CLEAR ?auto_99616 ) ( HOLDING ?auto_99615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99615 )
      ( MAKE-5PILE ?auto_99615 ?auto_99616 ?auto_99617 ?auto_99618 ?auto_99619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_99623 - BLOCK
      ?auto_99624 - BLOCK
      ?auto_99625 - BLOCK
      ?auto_99626 - BLOCK
      ?auto_99627 - BLOCK
    )
    :vars
    (
      ?auto_99629 - BLOCK
      ?auto_99630 - BLOCK
      ?auto_99628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99623 ?auto_99624 ) ) ( not ( = ?auto_99623 ?auto_99625 ) ) ( not ( = ?auto_99623 ?auto_99626 ) ) ( not ( = ?auto_99623 ?auto_99627 ) ) ( not ( = ?auto_99624 ?auto_99625 ) ) ( not ( = ?auto_99624 ?auto_99626 ) ) ( not ( = ?auto_99624 ?auto_99627 ) ) ( not ( = ?auto_99625 ?auto_99626 ) ) ( not ( = ?auto_99625 ?auto_99627 ) ) ( not ( = ?auto_99626 ?auto_99627 ) ) ( ON ?auto_99627 ?auto_99629 ) ( not ( = ?auto_99623 ?auto_99629 ) ) ( not ( = ?auto_99624 ?auto_99629 ) ) ( not ( = ?auto_99625 ?auto_99629 ) ) ( not ( = ?auto_99626 ?auto_99629 ) ) ( not ( = ?auto_99627 ?auto_99629 ) ) ( ON ?auto_99626 ?auto_99627 ) ( ON-TABLE ?auto_99630 ) ( ON ?auto_99628 ?auto_99630 ) ( ON ?auto_99629 ?auto_99628 ) ( not ( = ?auto_99630 ?auto_99628 ) ) ( not ( = ?auto_99630 ?auto_99629 ) ) ( not ( = ?auto_99630 ?auto_99627 ) ) ( not ( = ?auto_99630 ?auto_99626 ) ) ( not ( = ?auto_99628 ?auto_99629 ) ) ( not ( = ?auto_99628 ?auto_99627 ) ) ( not ( = ?auto_99628 ?auto_99626 ) ) ( not ( = ?auto_99623 ?auto_99630 ) ) ( not ( = ?auto_99623 ?auto_99628 ) ) ( not ( = ?auto_99624 ?auto_99630 ) ) ( not ( = ?auto_99624 ?auto_99628 ) ) ( not ( = ?auto_99625 ?auto_99630 ) ) ( not ( = ?auto_99625 ?auto_99628 ) ) ( ON ?auto_99625 ?auto_99626 ) ( ON ?auto_99624 ?auto_99625 ) ( ON ?auto_99623 ?auto_99624 ) ( CLEAR ?auto_99623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99630 ?auto_99628 ?auto_99629 ?auto_99627 ?auto_99626 ?auto_99625 ?auto_99624 )
      ( MAKE-5PILE ?auto_99623 ?auto_99624 ?auto_99625 ?auto_99626 ?auto_99627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99633 - BLOCK
      ?auto_99634 - BLOCK
    )
    :vars
    (
      ?auto_99635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99635 ?auto_99634 ) ( CLEAR ?auto_99635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99633 ) ( ON ?auto_99634 ?auto_99633 ) ( not ( = ?auto_99633 ?auto_99634 ) ) ( not ( = ?auto_99633 ?auto_99635 ) ) ( not ( = ?auto_99634 ?auto_99635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99635 ?auto_99634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99636 - BLOCK
      ?auto_99637 - BLOCK
    )
    :vars
    (
      ?auto_99638 - BLOCK
      ?auto_99639 - BLOCK
      ?auto_99640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99638 ?auto_99637 ) ( CLEAR ?auto_99638 ) ( ON-TABLE ?auto_99636 ) ( ON ?auto_99637 ?auto_99636 ) ( not ( = ?auto_99636 ?auto_99637 ) ) ( not ( = ?auto_99636 ?auto_99638 ) ) ( not ( = ?auto_99637 ?auto_99638 ) ) ( HOLDING ?auto_99639 ) ( CLEAR ?auto_99640 ) ( not ( = ?auto_99636 ?auto_99639 ) ) ( not ( = ?auto_99636 ?auto_99640 ) ) ( not ( = ?auto_99637 ?auto_99639 ) ) ( not ( = ?auto_99637 ?auto_99640 ) ) ( not ( = ?auto_99638 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99640 ) ) ( not ( = ?auto_99639 ?auto_99640 ) ) )
    :subtasks
    ( ( !STACK ?auto_99639 ?auto_99640 )
      ( MAKE-2PILE ?auto_99636 ?auto_99637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99641 - BLOCK
      ?auto_99642 - BLOCK
    )
    :vars
    (
      ?auto_99643 - BLOCK
      ?auto_99645 - BLOCK
      ?auto_99644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99643 ?auto_99642 ) ( ON-TABLE ?auto_99641 ) ( ON ?auto_99642 ?auto_99641 ) ( not ( = ?auto_99641 ?auto_99642 ) ) ( not ( = ?auto_99641 ?auto_99643 ) ) ( not ( = ?auto_99642 ?auto_99643 ) ) ( CLEAR ?auto_99645 ) ( not ( = ?auto_99641 ?auto_99644 ) ) ( not ( = ?auto_99641 ?auto_99645 ) ) ( not ( = ?auto_99642 ?auto_99644 ) ) ( not ( = ?auto_99642 ?auto_99645 ) ) ( not ( = ?auto_99643 ?auto_99644 ) ) ( not ( = ?auto_99643 ?auto_99645 ) ) ( not ( = ?auto_99644 ?auto_99645 ) ) ( ON ?auto_99644 ?auto_99643 ) ( CLEAR ?auto_99644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99641 ?auto_99642 ?auto_99643 )
      ( MAKE-2PILE ?auto_99641 ?auto_99642 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99646 - BLOCK
      ?auto_99647 - BLOCK
    )
    :vars
    (
      ?auto_99649 - BLOCK
      ?auto_99650 - BLOCK
      ?auto_99648 - BLOCK
      ?auto_99653 - BLOCK
      ?auto_99651 - BLOCK
      ?auto_99652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99649 ?auto_99647 ) ( ON-TABLE ?auto_99646 ) ( ON ?auto_99647 ?auto_99646 ) ( not ( = ?auto_99646 ?auto_99647 ) ) ( not ( = ?auto_99646 ?auto_99649 ) ) ( not ( = ?auto_99647 ?auto_99649 ) ) ( not ( = ?auto_99646 ?auto_99650 ) ) ( not ( = ?auto_99646 ?auto_99648 ) ) ( not ( = ?auto_99647 ?auto_99650 ) ) ( not ( = ?auto_99647 ?auto_99648 ) ) ( not ( = ?auto_99649 ?auto_99650 ) ) ( not ( = ?auto_99649 ?auto_99648 ) ) ( not ( = ?auto_99650 ?auto_99648 ) ) ( ON ?auto_99650 ?auto_99649 ) ( CLEAR ?auto_99650 ) ( HOLDING ?auto_99648 ) ( CLEAR ?auto_99653 ) ( ON-TABLE ?auto_99651 ) ( ON ?auto_99652 ?auto_99651 ) ( ON ?auto_99653 ?auto_99652 ) ( not ( = ?auto_99651 ?auto_99652 ) ) ( not ( = ?auto_99651 ?auto_99653 ) ) ( not ( = ?auto_99651 ?auto_99648 ) ) ( not ( = ?auto_99652 ?auto_99653 ) ) ( not ( = ?auto_99652 ?auto_99648 ) ) ( not ( = ?auto_99653 ?auto_99648 ) ) ( not ( = ?auto_99646 ?auto_99653 ) ) ( not ( = ?auto_99646 ?auto_99651 ) ) ( not ( = ?auto_99646 ?auto_99652 ) ) ( not ( = ?auto_99647 ?auto_99653 ) ) ( not ( = ?auto_99647 ?auto_99651 ) ) ( not ( = ?auto_99647 ?auto_99652 ) ) ( not ( = ?auto_99649 ?auto_99653 ) ) ( not ( = ?auto_99649 ?auto_99651 ) ) ( not ( = ?auto_99649 ?auto_99652 ) ) ( not ( = ?auto_99650 ?auto_99653 ) ) ( not ( = ?auto_99650 ?auto_99651 ) ) ( not ( = ?auto_99650 ?auto_99652 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99651 ?auto_99652 ?auto_99653 ?auto_99648 )
      ( MAKE-2PILE ?auto_99646 ?auto_99647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99654 - BLOCK
      ?auto_99655 - BLOCK
    )
    :vars
    (
      ?auto_99658 - BLOCK
      ?auto_99660 - BLOCK
      ?auto_99659 - BLOCK
      ?auto_99661 - BLOCK
      ?auto_99657 - BLOCK
      ?auto_99656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99658 ?auto_99655 ) ( ON-TABLE ?auto_99654 ) ( ON ?auto_99655 ?auto_99654 ) ( not ( = ?auto_99654 ?auto_99655 ) ) ( not ( = ?auto_99654 ?auto_99658 ) ) ( not ( = ?auto_99655 ?auto_99658 ) ) ( not ( = ?auto_99654 ?auto_99660 ) ) ( not ( = ?auto_99654 ?auto_99659 ) ) ( not ( = ?auto_99655 ?auto_99660 ) ) ( not ( = ?auto_99655 ?auto_99659 ) ) ( not ( = ?auto_99658 ?auto_99660 ) ) ( not ( = ?auto_99658 ?auto_99659 ) ) ( not ( = ?auto_99660 ?auto_99659 ) ) ( ON ?auto_99660 ?auto_99658 ) ( CLEAR ?auto_99661 ) ( ON-TABLE ?auto_99657 ) ( ON ?auto_99656 ?auto_99657 ) ( ON ?auto_99661 ?auto_99656 ) ( not ( = ?auto_99657 ?auto_99656 ) ) ( not ( = ?auto_99657 ?auto_99661 ) ) ( not ( = ?auto_99657 ?auto_99659 ) ) ( not ( = ?auto_99656 ?auto_99661 ) ) ( not ( = ?auto_99656 ?auto_99659 ) ) ( not ( = ?auto_99661 ?auto_99659 ) ) ( not ( = ?auto_99654 ?auto_99661 ) ) ( not ( = ?auto_99654 ?auto_99657 ) ) ( not ( = ?auto_99654 ?auto_99656 ) ) ( not ( = ?auto_99655 ?auto_99661 ) ) ( not ( = ?auto_99655 ?auto_99657 ) ) ( not ( = ?auto_99655 ?auto_99656 ) ) ( not ( = ?auto_99658 ?auto_99661 ) ) ( not ( = ?auto_99658 ?auto_99657 ) ) ( not ( = ?auto_99658 ?auto_99656 ) ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99657 ) ) ( not ( = ?auto_99660 ?auto_99656 ) ) ( ON ?auto_99659 ?auto_99660 ) ( CLEAR ?auto_99659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99654 ?auto_99655 ?auto_99658 ?auto_99660 )
      ( MAKE-2PILE ?auto_99654 ?auto_99655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99662 - BLOCK
      ?auto_99663 - BLOCK
    )
    :vars
    (
      ?auto_99664 - BLOCK
      ?auto_99665 - BLOCK
      ?auto_99667 - BLOCK
      ?auto_99668 - BLOCK
      ?auto_99666 - BLOCK
      ?auto_99669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99664 ?auto_99663 ) ( ON-TABLE ?auto_99662 ) ( ON ?auto_99663 ?auto_99662 ) ( not ( = ?auto_99662 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99664 ) ) ( not ( = ?auto_99663 ?auto_99664 ) ) ( not ( = ?auto_99662 ?auto_99665 ) ) ( not ( = ?auto_99662 ?auto_99667 ) ) ( not ( = ?auto_99663 ?auto_99665 ) ) ( not ( = ?auto_99663 ?auto_99667 ) ) ( not ( = ?auto_99664 ?auto_99665 ) ) ( not ( = ?auto_99664 ?auto_99667 ) ) ( not ( = ?auto_99665 ?auto_99667 ) ) ( ON ?auto_99665 ?auto_99664 ) ( ON-TABLE ?auto_99668 ) ( ON ?auto_99666 ?auto_99668 ) ( not ( = ?auto_99668 ?auto_99666 ) ) ( not ( = ?auto_99668 ?auto_99669 ) ) ( not ( = ?auto_99668 ?auto_99667 ) ) ( not ( = ?auto_99666 ?auto_99669 ) ) ( not ( = ?auto_99666 ?auto_99667 ) ) ( not ( = ?auto_99669 ?auto_99667 ) ) ( not ( = ?auto_99662 ?auto_99669 ) ) ( not ( = ?auto_99662 ?auto_99668 ) ) ( not ( = ?auto_99662 ?auto_99666 ) ) ( not ( = ?auto_99663 ?auto_99669 ) ) ( not ( = ?auto_99663 ?auto_99668 ) ) ( not ( = ?auto_99663 ?auto_99666 ) ) ( not ( = ?auto_99664 ?auto_99669 ) ) ( not ( = ?auto_99664 ?auto_99668 ) ) ( not ( = ?auto_99664 ?auto_99666 ) ) ( not ( = ?auto_99665 ?auto_99669 ) ) ( not ( = ?auto_99665 ?auto_99668 ) ) ( not ( = ?auto_99665 ?auto_99666 ) ) ( ON ?auto_99667 ?auto_99665 ) ( CLEAR ?auto_99667 ) ( HOLDING ?auto_99669 ) ( CLEAR ?auto_99666 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99668 ?auto_99666 ?auto_99669 )
      ( MAKE-2PILE ?auto_99662 ?auto_99663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99670 - BLOCK
      ?auto_99671 - BLOCK
    )
    :vars
    (
      ?auto_99674 - BLOCK
      ?auto_99676 - BLOCK
      ?auto_99673 - BLOCK
      ?auto_99677 - BLOCK
      ?auto_99672 - BLOCK
      ?auto_99675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99674 ?auto_99671 ) ( ON-TABLE ?auto_99670 ) ( ON ?auto_99671 ?auto_99670 ) ( not ( = ?auto_99670 ?auto_99671 ) ) ( not ( = ?auto_99670 ?auto_99674 ) ) ( not ( = ?auto_99671 ?auto_99674 ) ) ( not ( = ?auto_99670 ?auto_99676 ) ) ( not ( = ?auto_99670 ?auto_99673 ) ) ( not ( = ?auto_99671 ?auto_99676 ) ) ( not ( = ?auto_99671 ?auto_99673 ) ) ( not ( = ?auto_99674 ?auto_99676 ) ) ( not ( = ?auto_99674 ?auto_99673 ) ) ( not ( = ?auto_99676 ?auto_99673 ) ) ( ON ?auto_99676 ?auto_99674 ) ( ON-TABLE ?auto_99677 ) ( ON ?auto_99672 ?auto_99677 ) ( not ( = ?auto_99677 ?auto_99672 ) ) ( not ( = ?auto_99677 ?auto_99675 ) ) ( not ( = ?auto_99677 ?auto_99673 ) ) ( not ( = ?auto_99672 ?auto_99675 ) ) ( not ( = ?auto_99672 ?auto_99673 ) ) ( not ( = ?auto_99675 ?auto_99673 ) ) ( not ( = ?auto_99670 ?auto_99675 ) ) ( not ( = ?auto_99670 ?auto_99677 ) ) ( not ( = ?auto_99670 ?auto_99672 ) ) ( not ( = ?auto_99671 ?auto_99675 ) ) ( not ( = ?auto_99671 ?auto_99677 ) ) ( not ( = ?auto_99671 ?auto_99672 ) ) ( not ( = ?auto_99674 ?auto_99675 ) ) ( not ( = ?auto_99674 ?auto_99677 ) ) ( not ( = ?auto_99674 ?auto_99672 ) ) ( not ( = ?auto_99676 ?auto_99675 ) ) ( not ( = ?auto_99676 ?auto_99677 ) ) ( not ( = ?auto_99676 ?auto_99672 ) ) ( ON ?auto_99673 ?auto_99676 ) ( CLEAR ?auto_99672 ) ( ON ?auto_99675 ?auto_99673 ) ( CLEAR ?auto_99675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99670 ?auto_99671 ?auto_99674 ?auto_99676 ?auto_99673 )
      ( MAKE-2PILE ?auto_99670 ?auto_99671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99678 - BLOCK
      ?auto_99679 - BLOCK
    )
    :vars
    (
      ?auto_99680 - BLOCK
      ?auto_99684 - BLOCK
      ?auto_99681 - BLOCK
      ?auto_99682 - BLOCK
      ?auto_99685 - BLOCK
      ?auto_99683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99680 ?auto_99679 ) ( ON-TABLE ?auto_99678 ) ( ON ?auto_99679 ?auto_99678 ) ( not ( = ?auto_99678 ?auto_99679 ) ) ( not ( = ?auto_99678 ?auto_99680 ) ) ( not ( = ?auto_99679 ?auto_99680 ) ) ( not ( = ?auto_99678 ?auto_99684 ) ) ( not ( = ?auto_99678 ?auto_99681 ) ) ( not ( = ?auto_99679 ?auto_99684 ) ) ( not ( = ?auto_99679 ?auto_99681 ) ) ( not ( = ?auto_99680 ?auto_99684 ) ) ( not ( = ?auto_99680 ?auto_99681 ) ) ( not ( = ?auto_99684 ?auto_99681 ) ) ( ON ?auto_99684 ?auto_99680 ) ( ON-TABLE ?auto_99682 ) ( not ( = ?auto_99682 ?auto_99685 ) ) ( not ( = ?auto_99682 ?auto_99683 ) ) ( not ( = ?auto_99682 ?auto_99681 ) ) ( not ( = ?auto_99685 ?auto_99683 ) ) ( not ( = ?auto_99685 ?auto_99681 ) ) ( not ( = ?auto_99683 ?auto_99681 ) ) ( not ( = ?auto_99678 ?auto_99683 ) ) ( not ( = ?auto_99678 ?auto_99682 ) ) ( not ( = ?auto_99678 ?auto_99685 ) ) ( not ( = ?auto_99679 ?auto_99683 ) ) ( not ( = ?auto_99679 ?auto_99682 ) ) ( not ( = ?auto_99679 ?auto_99685 ) ) ( not ( = ?auto_99680 ?auto_99683 ) ) ( not ( = ?auto_99680 ?auto_99682 ) ) ( not ( = ?auto_99680 ?auto_99685 ) ) ( not ( = ?auto_99684 ?auto_99683 ) ) ( not ( = ?auto_99684 ?auto_99682 ) ) ( not ( = ?auto_99684 ?auto_99685 ) ) ( ON ?auto_99681 ?auto_99684 ) ( ON ?auto_99683 ?auto_99681 ) ( CLEAR ?auto_99683 ) ( HOLDING ?auto_99685 ) ( CLEAR ?auto_99682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99682 ?auto_99685 )
      ( MAKE-2PILE ?auto_99678 ?auto_99679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100979 - BLOCK
      ?auto_100980 - BLOCK
    )
    :vars
    (
      ?auto_100984 - BLOCK
      ?auto_100983 - BLOCK
      ?auto_100981 - BLOCK
      ?auto_100982 - BLOCK
      ?auto_100985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100984 ?auto_100980 ) ( ON-TABLE ?auto_100979 ) ( ON ?auto_100980 ?auto_100979 ) ( not ( = ?auto_100979 ?auto_100980 ) ) ( not ( = ?auto_100979 ?auto_100984 ) ) ( not ( = ?auto_100980 ?auto_100984 ) ) ( not ( = ?auto_100979 ?auto_100983 ) ) ( not ( = ?auto_100979 ?auto_100981 ) ) ( not ( = ?auto_100980 ?auto_100983 ) ) ( not ( = ?auto_100980 ?auto_100981 ) ) ( not ( = ?auto_100984 ?auto_100983 ) ) ( not ( = ?auto_100984 ?auto_100981 ) ) ( not ( = ?auto_100983 ?auto_100981 ) ) ( ON ?auto_100983 ?auto_100984 ) ( not ( = ?auto_100982 ?auto_100985 ) ) ( not ( = ?auto_100982 ?auto_100981 ) ) ( not ( = ?auto_100985 ?auto_100981 ) ) ( not ( = ?auto_100979 ?auto_100985 ) ) ( not ( = ?auto_100979 ?auto_100982 ) ) ( not ( = ?auto_100980 ?auto_100985 ) ) ( not ( = ?auto_100980 ?auto_100982 ) ) ( not ( = ?auto_100984 ?auto_100985 ) ) ( not ( = ?auto_100984 ?auto_100982 ) ) ( not ( = ?auto_100983 ?auto_100985 ) ) ( not ( = ?auto_100983 ?auto_100982 ) ) ( ON ?auto_100981 ?auto_100983 ) ( ON ?auto_100985 ?auto_100981 ) ( ON ?auto_100982 ?auto_100985 ) ( CLEAR ?auto_100982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100979 ?auto_100980 ?auto_100984 ?auto_100983 ?auto_100981 ?auto_100985 )
      ( MAKE-2PILE ?auto_100979 ?auto_100980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99694 - BLOCK
      ?auto_99695 - BLOCK
    )
    :vars
    (
      ?auto_99700 - BLOCK
      ?auto_99696 - BLOCK
      ?auto_99699 - BLOCK
      ?auto_99698 - BLOCK
      ?auto_99701 - BLOCK
      ?auto_99697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99700 ?auto_99695 ) ( ON-TABLE ?auto_99694 ) ( ON ?auto_99695 ?auto_99694 ) ( not ( = ?auto_99694 ?auto_99695 ) ) ( not ( = ?auto_99694 ?auto_99700 ) ) ( not ( = ?auto_99695 ?auto_99700 ) ) ( not ( = ?auto_99694 ?auto_99696 ) ) ( not ( = ?auto_99694 ?auto_99699 ) ) ( not ( = ?auto_99695 ?auto_99696 ) ) ( not ( = ?auto_99695 ?auto_99699 ) ) ( not ( = ?auto_99700 ?auto_99696 ) ) ( not ( = ?auto_99700 ?auto_99699 ) ) ( not ( = ?auto_99696 ?auto_99699 ) ) ( ON ?auto_99696 ?auto_99700 ) ( not ( = ?auto_99698 ?auto_99701 ) ) ( not ( = ?auto_99698 ?auto_99697 ) ) ( not ( = ?auto_99698 ?auto_99699 ) ) ( not ( = ?auto_99701 ?auto_99697 ) ) ( not ( = ?auto_99701 ?auto_99699 ) ) ( not ( = ?auto_99697 ?auto_99699 ) ) ( not ( = ?auto_99694 ?auto_99697 ) ) ( not ( = ?auto_99694 ?auto_99698 ) ) ( not ( = ?auto_99694 ?auto_99701 ) ) ( not ( = ?auto_99695 ?auto_99697 ) ) ( not ( = ?auto_99695 ?auto_99698 ) ) ( not ( = ?auto_99695 ?auto_99701 ) ) ( not ( = ?auto_99700 ?auto_99697 ) ) ( not ( = ?auto_99700 ?auto_99698 ) ) ( not ( = ?auto_99700 ?auto_99701 ) ) ( not ( = ?auto_99696 ?auto_99697 ) ) ( not ( = ?auto_99696 ?auto_99698 ) ) ( not ( = ?auto_99696 ?auto_99701 ) ) ( ON ?auto_99699 ?auto_99696 ) ( ON ?auto_99697 ?auto_99699 ) ( ON ?auto_99701 ?auto_99697 ) ( CLEAR ?auto_99701 ) ( HOLDING ?auto_99698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99698 )
      ( MAKE-2PILE ?auto_99694 ?auto_99695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_99702 - BLOCK
      ?auto_99703 - BLOCK
    )
    :vars
    (
      ?auto_99704 - BLOCK
      ?auto_99706 - BLOCK
      ?auto_99709 - BLOCK
      ?auto_99705 - BLOCK
      ?auto_99707 - BLOCK
      ?auto_99708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99704 ?auto_99703 ) ( ON-TABLE ?auto_99702 ) ( ON ?auto_99703 ?auto_99702 ) ( not ( = ?auto_99702 ?auto_99703 ) ) ( not ( = ?auto_99702 ?auto_99704 ) ) ( not ( = ?auto_99703 ?auto_99704 ) ) ( not ( = ?auto_99702 ?auto_99706 ) ) ( not ( = ?auto_99702 ?auto_99709 ) ) ( not ( = ?auto_99703 ?auto_99706 ) ) ( not ( = ?auto_99703 ?auto_99709 ) ) ( not ( = ?auto_99704 ?auto_99706 ) ) ( not ( = ?auto_99704 ?auto_99709 ) ) ( not ( = ?auto_99706 ?auto_99709 ) ) ( ON ?auto_99706 ?auto_99704 ) ( not ( = ?auto_99705 ?auto_99707 ) ) ( not ( = ?auto_99705 ?auto_99708 ) ) ( not ( = ?auto_99705 ?auto_99709 ) ) ( not ( = ?auto_99707 ?auto_99708 ) ) ( not ( = ?auto_99707 ?auto_99709 ) ) ( not ( = ?auto_99708 ?auto_99709 ) ) ( not ( = ?auto_99702 ?auto_99708 ) ) ( not ( = ?auto_99702 ?auto_99705 ) ) ( not ( = ?auto_99702 ?auto_99707 ) ) ( not ( = ?auto_99703 ?auto_99708 ) ) ( not ( = ?auto_99703 ?auto_99705 ) ) ( not ( = ?auto_99703 ?auto_99707 ) ) ( not ( = ?auto_99704 ?auto_99708 ) ) ( not ( = ?auto_99704 ?auto_99705 ) ) ( not ( = ?auto_99704 ?auto_99707 ) ) ( not ( = ?auto_99706 ?auto_99708 ) ) ( not ( = ?auto_99706 ?auto_99705 ) ) ( not ( = ?auto_99706 ?auto_99707 ) ) ( ON ?auto_99709 ?auto_99706 ) ( ON ?auto_99708 ?auto_99709 ) ( ON ?auto_99707 ?auto_99708 ) ( ON ?auto_99705 ?auto_99707 ) ( CLEAR ?auto_99705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99702 ?auto_99703 ?auto_99704 ?auto_99706 ?auto_99709 ?auto_99708 ?auto_99707 )
      ( MAKE-2PILE ?auto_99702 ?auto_99703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99716 - BLOCK
      ?auto_99717 - BLOCK
      ?auto_99718 - BLOCK
      ?auto_99719 - BLOCK
      ?auto_99720 - BLOCK
      ?auto_99721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99721 ) ( CLEAR ?auto_99720 ) ( ON-TABLE ?auto_99716 ) ( ON ?auto_99717 ?auto_99716 ) ( ON ?auto_99718 ?auto_99717 ) ( ON ?auto_99719 ?auto_99718 ) ( ON ?auto_99720 ?auto_99719 ) ( not ( = ?auto_99716 ?auto_99717 ) ) ( not ( = ?auto_99716 ?auto_99718 ) ) ( not ( = ?auto_99716 ?auto_99719 ) ) ( not ( = ?auto_99716 ?auto_99720 ) ) ( not ( = ?auto_99716 ?auto_99721 ) ) ( not ( = ?auto_99717 ?auto_99718 ) ) ( not ( = ?auto_99717 ?auto_99719 ) ) ( not ( = ?auto_99717 ?auto_99720 ) ) ( not ( = ?auto_99717 ?auto_99721 ) ) ( not ( = ?auto_99718 ?auto_99719 ) ) ( not ( = ?auto_99718 ?auto_99720 ) ) ( not ( = ?auto_99718 ?auto_99721 ) ) ( not ( = ?auto_99719 ?auto_99720 ) ) ( not ( = ?auto_99719 ?auto_99721 ) ) ( not ( = ?auto_99720 ?auto_99721 ) ) )
    :subtasks
    ( ( !STACK ?auto_99721 ?auto_99720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99722 - BLOCK
      ?auto_99723 - BLOCK
      ?auto_99724 - BLOCK
      ?auto_99725 - BLOCK
      ?auto_99726 - BLOCK
      ?auto_99727 - BLOCK
    )
    :vars
    (
      ?auto_99728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99726 ) ( ON-TABLE ?auto_99722 ) ( ON ?auto_99723 ?auto_99722 ) ( ON ?auto_99724 ?auto_99723 ) ( ON ?auto_99725 ?auto_99724 ) ( ON ?auto_99726 ?auto_99725 ) ( not ( = ?auto_99722 ?auto_99723 ) ) ( not ( = ?auto_99722 ?auto_99724 ) ) ( not ( = ?auto_99722 ?auto_99725 ) ) ( not ( = ?auto_99722 ?auto_99726 ) ) ( not ( = ?auto_99722 ?auto_99727 ) ) ( not ( = ?auto_99723 ?auto_99724 ) ) ( not ( = ?auto_99723 ?auto_99725 ) ) ( not ( = ?auto_99723 ?auto_99726 ) ) ( not ( = ?auto_99723 ?auto_99727 ) ) ( not ( = ?auto_99724 ?auto_99725 ) ) ( not ( = ?auto_99724 ?auto_99726 ) ) ( not ( = ?auto_99724 ?auto_99727 ) ) ( not ( = ?auto_99725 ?auto_99726 ) ) ( not ( = ?auto_99725 ?auto_99727 ) ) ( not ( = ?auto_99726 ?auto_99727 ) ) ( ON ?auto_99727 ?auto_99728 ) ( CLEAR ?auto_99727 ) ( HAND-EMPTY ) ( not ( = ?auto_99722 ?auto_99728 ) ) ( not ( = ?auto_99723 ?auto_99728 ) ) ( not ( = ?auto_99724 ?auto_99728 ) ) ( not ( = ?auto_99725 ?auto_99728 ) ) ( not ( = ?auto_99726 ?auto_99728 ) ) ( not ( = ?auto_99727 ?auto_99728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99727 ?auto_99728 )
      ( MAKE-6PILE ?auto_99722 ?auto_99723 ?auto_99724 ?auto_99725 ?auto_99726 ?auto_99727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99729 - BLOCK
      ?auto_99730 - BLOCK
      ?auto_99731 - BLOCK
      ?auto_99732 - BLOCK
      ?auto_99733 - BLOCK
      ?auto_99734 - BLOCK
    )
    :vars
    (
      ?auto_99735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99729 ) ( ON ?auto_99730 ?auto_99729 ) ( ON ?auto_99731 ?auto_99730 ) ( ON ?auto_99732 ?auto_99731 ) ( not ( = ?auto_99729 ?auto_99730 ) ) ( not ( = ?auto_99729 ?auto_99731 ) ) ( not ( = ?auto_99729 ?auto_99732 ) ) ( not ( = ?auto_99729 ?auto_99733 ) ) ( not ( = ?auto_99729 ?auto_99734 ) ) ( not ( = ?auto_99730 ?auto_99731 ) ) ( not ( = ?auto_99730 ?auto_99732 ) ) ( not ( = ?auto_99730 ?auto_99733 ) ) ( not ( = ?auto_99730 ?auto_99734 ) ) ( not ( = ?auto_99731 ?auto_99732 ) ) ( not ( = ?auto_99731 ?auto_99733 ) ) ( not ( = ?auto_99731 ?auto_99734 ) ) ( not ( = ?auto_99732 ?auto_99733 ) ) ( not ( = ?auto_99732 ?auto_99734 ) ) ( not ( = ?auto_99733 ?auto_99734 ) ) ( ON ?auto_99734 ?auto_99735 ) ( CLEAR ?auto_99734 ) ( not ( = ?auto_99729 ?auto_99735 ) ) ( not ( = ?auto_99730 ?auto_99735 ) ) ( not ( = ?auto_99731 ?auto_99735 ) ) ( not ( = ?auto_99732 ?auto_99735 ) ) ( not ( = ?auto_99733 ?auto_99735 ) ) ( not ( = ?auto_99734 ?auto_99735 ) ) ( HOLDING ?auto_99733 ) ( CLEAR ?auto_99732 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99729 ?auto_99730 ?auto_99731 ?auto_99732 ?auto_99733 )
      ( MAKE-6PILE ?auto_99729 ?auto_99730 ?auto_99731 ?auto_99732 ?auto_99733 ?auto_99734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99736 - BLOCK
      ?auto_99737 - BLOCK
      ?auto_99738 - BLOCK
      ?auto_99739 - BLOCK
      ?auto_99740 - BLOCK
      ?auto_99741 - BLOCK
    )
    :vars
    (
      ?auto_99742 - BLOCK
      ?auto_99743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99736 ) ( ON ?auto_99737 ?auto_99736 ) ( ON ?auto_99738 ?auto_99737 ) ( ON ?auto_99739 ?auto_99738 ) ( not ( = ?auto_99736 ?auto_99737 ) ) ( not ( = ?auto_99736 ?auto_99738 ) ) ( not ( = ?auto_99736 ?auto_99739 ) ) ( not ( = ?auto_99736 ?auto_99740 ) ) ( not ( = ?auto_99736 ?auto_99741 ) ) ( not ( = ?auto_99737 ?auto_99738 ) ) ( not ( = ?auto_99737 ?auto_99739 ) ) ( not ( = ?auto_99737 ?auto_99740 ) ) ( not ( = ?auto_99737 ?auto_99741 ) ) ( not ( = ?auto_99738 ?auto_99739 ) ) ( not ( = ?auto_99738 ?auto_99740 ) ) ( not ( = ?auto_99738 ?auto_99741 ) ) ( not ( = ?auto_99739 ?auto_99740 ) ) ( not ( = ?auto_99739 ?auto_99741 ) ) ( not ( = ?auto_99740 ?auto_99741 ) ) ( ON ?auto_99741 ?auto_99742 ) ( not ( = ?auto_99736 ?auto_99742 ) ) ( not ( = ?auto_99737 ?auto_99742 ) ) ( not ( = ?auto_99738 ?auto_99742 ) ) ( not ( = ?auto_99739 ?auto_99742 ) ) ( not ( = ?auto_99740 ?auto_99742 ) ) ( not ( = ?auto_99741 ?auto_99742 ) ) ( CLEAR ?auto_99739 ) ( ON ?auto_99740 ?auto_99741 ) ( CLEAR ?auto_99740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99743 ) ( ON ?auto_99742 ?auto_99743 ) ( not ( = ?auto_99743 ?auto_99742 ) ) ( not ( = ?auto_99743 ?auto_99741 ) ) ( not ( = ?auto_99743 ?auto_99740 ) ) ( not ( = ?auto_99736 ?auto_99743 ) ) ( not ( = ?auto_99737 ?auto_99743 ) ) ( not ( = ?auto_99738 ?auto_99743 ) ) ( not ( = ?auto_99739 ?auto_99743 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99743 ?auto_99742 ?auto_99741 )
      ( MAKE-6PILE ?auto_99736 ?auto_99737 ?auto_99738 ?auto_99739 ?auto_99740 ?auto_99741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99744 - BLOCK
      ?auto_99745 - BLOCK
      ?auto_99746 - BLOCK
      ?auto_99747 - BLOCK
      ?auto_99748 - BLOCK
      ?auto_99749 - BLOCK
    )
    :vars
    (
      ?auto_99751 - BLOCK
      ?auto_99750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99744 ) ( ON ?auto_99745 ?auto_99744 ) ( ON ?auto_99746 ?auto_99745 ) ( not ( = ?auto_99744 ?auto_99745 ) ) ( not ( = ?auto_99744 ?auto_99746 ) ) ( not ( = ?auto_99744 ?auto_99747 ) ) ( not ( = ?auto_99744 ?auto_99748 ) ) ( not ( = ?auto_99744 ?auto_99749 ) ) ( not ( = ?auto_99745 ?auto_99746 ) ) ( not ( = ?auto_99745 ?auto_99747 ) ) ( not ( = ?auto_99745 ?auto_99748 ) ) ( not ( = ?auto_99745 ?auto_99749 ) ) ( not ( = ?auto_99746 ?auto_99747 ) ) ( not ( = ?auto_99746 ?auto_99748 ) ) ( not ( = ?auto_99746 ?auto_99749 ) ) ( not ( = ?auto_99747 ?auto_99748 ) ) ( not ( = ?auto_99747 ?auto_99749 ) ) ( not ( = ?auto_99748 ?auto_99749 ) ) ( ON ?auto_99749 ?auto_99751 ) ( not ( = ?auto_99744 ?auto_99751 ) ) ( not ( = ?auto_99745 ?auto_99751 ) ) ( not ( = ?auto_99746 ?auto_99751 ) ) ( not ( = ?auto_99747 ?auto_99751 ) ) ( not ( = ?auto_99748 ?auto_99751 ) ) ( not ( = ?auto_99749 ?auto_99751 ) ) ( ON ?auto_99748 ?auto_99749 ) ( CLEAR ?auto_99748 ) ( ON-TABLE ?auto_99750 ) ( ON ?auto_99751 ?auto_99750 ) ( not ( = ?auto_99750 ?auto_99751 ) ) ( not ( = ?auto_99750 ?auto_99749 ) ) ( not ( = ?auto_99750 ?auto_99748 ) ) ( not ( = ?auto_99744 ?auto_99750 ) ) ( not ( = ?auto_99745 ?auto_99750 ) ) ( not ( = ?auto_99746 ?auto_99750 ) ) ( not ( = ?auto_99747 ?auto_99750 ) ) ( HOLDING ?auto_99747 ) ( CLEAR ?auto_99746 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99744 ?auto_99745 ?auto_99746 ?auto_99747 )
      ( MAKE-6PILE ?auto_99744 ?auto_99745 ?auto_99746 ?auto_99747 ?auto_99748 ?auto_99749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99752 - BLOCK
      ?auto_99753 - BLOCK
      ?auto_99754 - BLOCK
      ?auto_99755 - BLOCK
      ?auto_99756 - BLOCK
      ?auto_99757 - BLOCK
    )
    :vars
    (
      ?auto_99758 - BLOCK
      ?auto_99759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99752 ) ( ON ?auto_99753 ?auto_99752 ) ( ON ?auto_99754 ?auto_99753 ) ( not ( = ?auto_99752 ?auto_99753 ) ) ( not ( = ?auto_99752 ?auto_99754 ) ) ( not ( = ?auto_99752 ?auto_99755 ) ) ( not ( = ?auto_99752 ?auto_99756 ) ) ( not ( = ?auto_99752 ?auto_99757 ) ) ( not ( = ?auto_99753 ?auto_99754 ) ) ( not ( = ?auto_99753 ?auto_99755 ) ) ( not ( = ?auto_99753 ?auto_99756 ) ) ( not ( = ?auto_99753 ?auto_99757 ) ) ( not ( = ?auto_99754 ?auto_99755 ) ) ( not ( = ?auto_99754 ?auto_99756 ) ) ( not ( = ?auto_99754 ?auto_99757 ) ) ( not ( = ?auto_99755 ?auto_99756 ) ) ( not ( = ?auto_99755 ?auto_99757 ) ) ( not ( = ?auto_99756 ?auto_99757 ) ) ( ON ?auto_99757 ?auto_99758 ) ( not ( = ?auto_99752 ?auto_99758 ) ) ( not ( = ?auto_99753 ?auto_99758 ) ) ( not ( = ?auto_99754 ?auto_99758 ) ) ( not ( = ?auto_99755 ?auto_99758 ) ) ( not ( = ?auto_99756 ?auto_99758 ) ) ( not ( = ?auto_99757 ?auto_99758 ) ) ( ON ?auto_99756 ?auto_99757 ) ( ON-TABLE ?auto_99759 ) ( ON ?auto_99758 ?auto_99759 ) ( not ( = ?auto_99759 ?auto_99758 ) ) ( not ( = ?auto_99759 ?auto_99757 ) ) ( not ( = ?auto_99759 ?auto_99756 ) ) ( not ( = ?auto_99752 ?auto_99759 ) ) ( not ( = ?auto_99753 ?auto_99759 ) ) ( not ( = ?auto_99754 ?auto_99759 ) ) ( not ( = ?auto_99755 ?auto_99759 ) ) ( CLEAR ?auto_99754 ) ( ON ?auto_99755 ?auto_99756 ) ( CLEAR ?auto_99755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99759 ?auto_99758 ?auto_99757 ?auto_99756 )
      ( MAKE-6PILE ?auto_99752 ?auto_99753 ?auto_99754 ?auto_99755 ?auto_99756 ?auto_99757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99760 - BLOCK
      ?auto_99761 - BLOCK
      ?auto_99762 - BLOCK
      ?auto_99763 - BLOCK
      ?auto_99764 - BLOCK
      ?auto_99765 - BLOCK
    )
    :vars
    (
      ?auto_99767 - BLOCK
      ?auto_99766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99760 ) ( ON ?auto_99761 ?auto_99760 ) ( not ( = ?auto_99760 ?auto_99761 ) ) ( not ( = ?auto_99760 ?auto_99762 ) ) ( not ( = ?auto_99760 ?auto_99763 ) ) ( not ( = ?auto_99760 ?auto_99764 ) ) ( not ( = ?auto_99760 ?auto_99765 ) ) ( not ( = ?auto_99761 ?auto_99762 ) ) ( not ( = ?auto_99761 ?auto_99763 ) ) ( not ( = ?auto_99761 ?auto_99764 ) ) ( not ( = ?auto_99761 ?auto_99765 ) ) ( not ( = ?auto_99762 ?auto_99763 ) ) ( not ( = ?auto_99762 ?auto_99764 ) ) ( not ( = ?auto_99762 ?auto_99765 ) ) ( not ( = ?auto_99763 ?auto_99764 ) ) ( not ( = ?auto_99763 ?auto_99765 ) ) ( not ( = ?auto_99764 ?auto_99765 ) ) ( ON ?auto_99765 ?auto_99767 ) ( not ( = ?auto_99760 ?auto_99767 ) ) ( not ( = ?auto_99761 ?auto_99767 ) ) ( not ( = ?auto_99762 ?auto_99767 ) ) ( not ( = ?auto_99763 ?auto_99767 ) ) ( not ( = ?auto_99764 ?auto_99767 ) ) ( not ( = ?auto_99765 ?auto_99767 ) ) ( ON ?auto_99764 ?auto_99765 ) ( ON-TABLE ?auto_99766 ) ( ON ?auto_99767 ?auto_99766 ) ( not ( = ?auto_99766 ?auto_99767 ) ) ( not ( = ?auto_99766 ?auto_99765 ) ) ( not ( = ?auto_99766 ?auto_99764 ) ) ( not ( = ?auto_99760 ?auto_99766 ) ) ( not ( = ?auto_99761 ?auto_99766 ) ) ( not ( = ?auto_99762 ?auto_99766 ) ) ( not ( = ?auto_99763 ?auto_99766 ) ) ( ON ?auto_99763 ?auto_99764 ) ( CLEAR ?auto_99763 ) ( HOLDING ?auto_99762 ) ( CLEAR ?auto_99761 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99760 ?auto_99761 ?auto_99762 )
      ( MAKE-6PILE ?auto_99760 ?auto_99761 ?auto_99762 ?auto_99763 ?auto_99764 ?auto_99765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99768 - BLOCK
      ?auto_99769 - BLOCK
      ?auto_99770 - BLOCK
      ?auto_99771 - BLOCK
      ?auto_99772 - BLOCK
      ?auto_99773 - BLOCK
    )
    :vars
    (
      ?auto_99774 - BLOCK
      ?auto_99775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99768 ) ( ON ?auto_99769 ?auto_99768 ) ( not ( = ?auto_99768 ?auto_99769 ) ) ( not ( = ?auto_99768 ?auto_99770 ) ) ( not ( = ?auto_99768 ?auto_99771 ) ) ( not ( = ?auto_99768 ?auto_99772 ) ) ( not ( = ?auto_99768 ?auto_99773 ) ) ( not ( = ?auto_99769 ?auto_99770 ) ) ( not ( = ?auto_99769 ?auto_99771 ) ) ( not ( = ?auto_99769 ?auto_99772 ) ) ( not ( = ?auto_99769 ?auto_99773 ) ) ( not ( = ?auto_99770 ?auto_99771 ) ) ( not ( = ?auto_99770 ?auto_99772 ) ) ( not ( = ?auto_99770 ?auto_99773 ) ) ( not ( = ?auto_99771 ?auto_99772 ) ) ( not ( = ?auto_99771 ?auto_99773 ) ) ( not ( = ?auto_99772 ?auto_99773 ) ) ( ON ?auto_99773 ?auto_99774 ) ( not ( = ?auto_99768 ?auto_99774 ) ) ( not ( = ?auto_99769 ?auto_99774 ) ) ( not ( = ?auto_99770 ?auto_99774 ) ) ( not ( = ?auto_99771 ?auto_99774 ) ) ( not ( = ?auto_99772 ?auto_99774 ) ) ( not ( = ?auto_99773 ?auto_99774 ) ) ( ON ?auto_99772 ?auto_99773 ) ( ON-TABLE ?auto_99775 ) ( ON ?auto_99774 ?auto_99775 ) ( not ( = ?auto_99775 ?auto_99774 ) ) ( not ( = ?auto_99775 ?auto_99773 ) ) ( not ( = ?auto_99775 ?auto_99772 ) ) ( not ( = ?auto_99768 ?auto_99775 ) ) ( not ( = ?auto_99769 ?auto_99775 ) ) ( not ( = ?auto_99770 ?auto_99775 ) ) ( not ( = ?auto_99771 ?auto_99775 ) ) ( ON ?auto_99771 ?auto_99772 ) ( CLEAR ?auto_99769 ) ( ON ?auto_99770 ?auto_99771 ) ( CLEAR ?auto_99770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99775 ?auto_99774 ?auto_99773 ?auto_99772 ?auto_99771 )
      ( MAKE-6PILE ?auto_99768 ?auto_99769 ?auto_99770 ?auto_99771 ?auto_99772 ?auto_99773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99776 - BLOCK
      ?auto_99777 - BLOCK
      ?auto_99778 - BLOCK
      ?auto_99779 - BLOCK
      ?auto_99780 - BLOCK
      ?auto_99781 - BLOCK
    )
    :vars
    (
      ?auto_99783 - BLOCK
      ?auto_99782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99776 ) ( not ( = ?auto_99776 ?auto_99777 ) ) ( not ( = ?auto_99776 ?auto_99778 ) ) ( not ( = ?auto_99776 ?auto_99779 ) ) ( not ( = ?auto_99776 ?auto_99780 ) ) ( not ( = ?auto_99776 ?auto_99781 ) ) ( not ( = ?auto_99777 ?auto_99778 ) ) ( not ( = ?auto_99777 ?auto_99779 ) ) ( not ( = ?auto_99777 ?auto_99780 ) ) ( not ( = ?auto_99777 ?auto_99781 ) ) ( not ( = ?auto_99778 ?auto_99779 ) ) ( not ( = ?auto_99778 ?auto_99780 ) ) ( not ( = ?auto_99778 ?auto_99781 ) ) ( not ( = ?auto_99779 ?auto_99780 ) ) ( not ( = ?auto_99779 ?auto_99781 ) ) ( not ( = ?auto_99780 ?auto_99781 ) ) ( ON ?auto_99781 ?auto_99783 ) ( not ( = ?auto_99776 ?auto_99783 ) ) ( not ( = ?auto_99777 ?auto_99783 ) ) ( not ( = ?auto_99778 ?auto_99783 ) ) ( not ( = ?auto_99779 ?auto_99783 ) ) ( not ( = ?auto_99780 ?auto_99783 ) ) ( not ( = ?auto_99781 ?auto_99783 ) ) ( ON ?auto_99780 ?auto_99781 ) ( ON-TABLE ?auto_99782 ) ( ON ?auto_99783 ?auto_99782 ) ( not ( = ?auto_99782 ?auto_99783 ) ) ( not ( = ?auto_99782 ?auto_99781 ) ) ( not ( = ?auto_99782 ?auto_99780 ) ) ( not ( = ?auto_99776 ?auto_99782 ) ) ( not ( = ?auto_99777 ?auto_99782 ) ) ( not ( = ?auto_99778 ?auto_99782 ) ) ( not ( = ?auto_99779 ?auto_99782 ) ) ( ON ?auto_99779 ?auto_99780 ) ( ON ?auto_99778 ?auto_99779 ) ( CLEAR ?auto_99778 ) ( HOLDING ?auto_99777 ) ( CLEAR ?auto_99776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99776 ?auto_99777 )
      ( MAKE-6PILE ?auto_99776 ?auto_99777 ?auto_99778 ?auto_99779 ?auto_99780 ?auto_99781 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99784 - BLOCK
      ?auto_99785 - BLOCK
      ?auto_99786 - BLOCK
      ?auto_99787 - BLOCK
      ?auto_99788 - BLOCK
      ?auto_99789 - BLOCK
    )
    :vars
    (
      ?auto_99790 - BLOCK
      ?auto_99791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99784 ) ( not ( = ?auto_99784 ?auto_99785 ) ) ( not ( = ?auto_99784 ?auto_99786 ) ) ( not ( = ?auto_99784 ?auto_99787 ) ) ( not ( = ?auto_99784 ?auto_99788 ) ) ( not ( = ?auto_99784 ?auto_99789 ) ) ( not ( = ?auto_99785 ?auto_99786 ) ) ( not ( = ?auto_99785 ?auto_99787 ) ) ( not ( = ?auto_99785 ?auto_99788 ) ) ( not ( = ?auto_99785 ?auto_99789 ) ) ( not ( = ?auto_99786 ?auto_99787 ) ) ( not ( = ?auto_99786 ?auto_99788 ) ) ( not ( = ?auto_99786 ?auto_99789 ) ) ( not ( = ?auto_99787 ?auto_99788 ) ) ( not ( = ?auto_99787 ?auto_99789 ) ) ( not ( = ?auto_99788 ?auto_99789 ) ) ( ON ?auto_99789 ?auto_99790 ) ( not ( = ?auto_99784 ?auto_99790 ) ) ( not ( = ?auto_99785 ?auto_99790 ) ) ( not ( = ?auto_99786 ?auto_99790 ) ) ( not ( = ?auto_99787 ?auto_99790 ) ) ( not ( = ?auto_99788 ?auto_99790 ) ) ( not ( = ?auto_99789 ?auto_99790 ) ) ( ON ?auto_99788 ?auto_99789 ) ( ON-TABLE ?auto_99791 ) ( ON ?auto_99790 ?auto_99791 ) ( not ( = ?auto_99791 ?auto_99790 ) ) ( not ( = ?auto_99791 ?auto_99789 ) ) ( not ( = ?auto_99791 ?auto_99788 ) ) ( not ( = ?auto_99784 ?auto_99791 ) ) ( not ( = ?auto_99785 ?auto_99791 ) ) ( not ( = ?auto_99786 ?auto_99791 ) ) ( not ( = ?auto_99787 ?auto_99791 ) ) ( ON ?auto_99787 ?auto_99788 ) ( ON ?auto_99786 ?auto_99787 ) ( CLEAR ?auto_99784 ) ( ON ?auto_99785 ?auto_99786 ) ( CLEAR ?auto_99785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99791 ?auto_99790 ?auto_99789 ?auto_99788 ?auto_99787 ?auto_99786 )
      ( MAKE-6PILE ?auto_99784 ?auto_99785 ?auto_99786 ?auto_99787 ?auto_99788 ?auto_99789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99792 - BLOCK
      ?auto_99793 - BLOCK
      ?auto_99794 - BLOCK
      ?auto_99795 - BLOCK
      ?auto_99796 - BLOCK
      ?auto_99797 - BLOCK
    )
    :vars
    (
      ?auto_99799 - BLOCK
      ?auto_99798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99792 ?auto_99793 ) ) ( not ( = ?auto_99792 ?auto_99794 ) ) ( not ( = ?auto_99792 ?auto_99795 ) ) ( not ( = ?auto_99792 ?auto_99796 ) ) ( not ( = ?auto_99792 ?auto_99797 ) ) ( not ( = ?auto_99793 ?auto_99794 ) ) ( not ( = ?auto_99793 ?auto_99795 ) ) ( not ( = ?auto_99793 ?auto_99796 ) ) ( not ( = ?auto_99793 ?auto_99797 ) ) ( not ( = ?auto_99794 ?auto_99795 ) ) ( not ( = ?auto_99794 ?auto_99796 ) ) ( not ( = ?auto_99794 ?auto_99797 ) ) ( not ( = ?auto_99795 ?auto_99796 ) ) ( not ( = ?auto_99795 ?auto_99797 ) ) ( not ( = ?auto_99796 ?auto_99797 ) ) ( ON ?auto_99797 ?auto_99799 ) ( not ( = ?auto_99792 ?auto_99799 ) ) ( not ( = ?auto_99793 ?auto_99799 ) ) ( not ( = ?auto_99794 ?auto_99799 ) ) ( not ( = ?auto_99795 ?auto_99799 ) ) ( not ( = ?auto_99796 ?auto_99799 ) ) ( not ( = ?auto_99797 ?auto_99799 ) ) ( ON ?auto_99796 ?auto_99797 ) ( ON-TABLE ?auto_99798 ) ( ON ?auto_99799 ?auto_99798 ) ( not ( = ?auto_99798 ?auto_99799 ) ) ( not ( = ?auto_99798 ?auto_99797 ) ) ( not ( = ?auto_99798 ?auto_99796 ) ) ( not ( = ?auto_99792 ?auto_99798 ) ) ( not ( = ?auto_99793 ?auto_99798 ) ) ( not ( = ?auto_99794 ?auto_99798 ) ) ( not ( = ?auto_99795 ?auto_99798 ) ) ( ON ?auto_99795 ?auto_99796 ) ( ON ?auto_99794 ?auto_99795 ) ( ON ?auto_99793 ?auto_99794 ) ( CLEAR ?auto_99793 ) ( HOLDING ?auto_99792 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99792 )
      ( MAKE-6PILE ?auto_99792 ?auto_99793 ?auto_99794 ?auto_99795 ?auto_99796 ?auto_99797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99800 - BLOCK
      ?auto_99801 - BLOCK
      ?auto_99802 - BLOCK
      ?auto_99803 - BLOCK
      ?auto_99804 - BLOCK
      ?auto_99805 - BLOCK
    )
    :vars
    (
      ?auto_99806 - BLOCK
      ?auto_99807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99800 ?auto_99801 ) ) ( not ( = ?auto_99800 ?auto_99802 ) ) ( not ( = ?auto_99800 ?auto_99803 ) ) ( not ( = ?auto_99800 ?auto_99804 ) ) ( not ( = ?auto_99800 ?auto_99805 ) ) ( not ( = ?auto_99801 ?auto_99802 ) ) ( not ( = ?auto_99801 ?auto_99803 ) ) ( not ( = ?auto_99801 ?auto_99804 ) ) ( not ( = ?auto_99801 ?auto_99805 ) ) ( not ( = ?auto_99802 ?auto_99803 ) ) ( not ( = ?auto_99802 ?auto_99804 ) ) ( not ( = ?auto_99802 ?auto_99805 ) ) ( not ( = ?auto_99803 ?auto_99804 ) ) ( not ( = ?auto_99803 ?auto_99805 ) ) ( not ( = ?auto_99804 ?auto_99805 ) ) ( ON ?auto_99805 ?auto_99806 ) ( not ( = ?auto_99800 ?auto_99806 ) ) ( not ( = ?auto_99801 ?auto_99806 ) ) ( not ( = ?auto_99802 ?auto_99806 ) ) ( not ( = ?auto_99803 ?auto_99806 ) ) ( not ( = ?auto_99804 ?auto_99806 ) ) ( not ( = ?auto_99805 ?auto_99806 ) ) ( ON ?auto_99804 ?auto_99805 ) ( ON-TABLE ?auto_99807 ) ( ON ?auto_99806 ?auto_99807 ) ( not ( = ?auto_99807 ?auto_99806 ) ) ( not ( = ?auto_99807 ?auto_99805 ) ) ( not ( = ?auto_99807 ?auto_99804 ) ) ( not ( = ?auto_99800 ?auto_99807 ) ) ( not ( = ?auto_99801 ?auto_99807 ) ) ( not ( = ?auto_99802 ?auto_99807 ) ) ( not ( = ?auto_99803 ?auto_99807 ) ) ( ON ?auto_99803 ?auto_99804 ) ( ON ?auto_99802 ?auto_99803 ) ( ON ?auto_99801 ?auto_99802 ) ( ON ?auto_99800 ?auto_99801 ) ( CLEAR ?auto_99800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99807 ?auto_99806 ?auto_99805 ?auto_99804 ?auto_99803 ?auto_99802 ?auto_99801 )
      ( MAKE-6PILE ?auto_99800 ?auto_99801 ?auto_99802 ?auto_99803 ?auto_99804 ?auto_99805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99809 - BLOCK
    )
    :vars
    (
      ?auto_99810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99810 ?auto_99809 ) ( CLEAR ?auto_99810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99809 ) ( not ( = ?auto_99809 ?auto_99810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99810 ?auto_99809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99811 - BLOCK
    )
    :vars
    (
      ?auto_99812 - BLOCK
      ?auto_99813 - BLOCK
      ?auto_99814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99812 ?auto_99811 ) ( CLEAR ?auto_99812 ) ( ON-TABLE ?auto_99811 ) ( not ( = ?auto_99811 ?auto_99812 ) ) ( HOLDING ?auto_99813 ) ( CLEAR ?auto_99814 ) ( not ( = ?auto_99811 ?auto_99813 ) ) ( not ( = ?auto_99811 ?auto_99814 ) ) ( not ( = ?auto_99812 ?auto_99813 ) ) ( not ( = ?auto_99812 ?auto_99814 ) ) ( not ( = ?auto_99813 ?auto_99814 ) ) )
    :subtasks
    ( ( !STACK ?auto_99813 ?auto_99814 )
      ( MAKE-1PILE ?auto_99811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99815 - BLOCK
    )
    :vars
    (
      ?auto_99818 - BLOCK
      ?auto_99817 - BLOCK
      ?auto_99816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99818 ?auto_99815 ) ( ON-TABLE ?auto_99815 ) ( not ( = ?auto_99815 ?auto_99818 ) ) ( CLEAR ?auto_99817 ) ( not ( = ?auto_99815 ?auto_99816 ) ) ( not ( = ?auto_99815 ?auto_99817 ) ) ( not ( = ?auto_99818 ?auto_99816 ) ) ( not ( = ?auto_99818 ?auto_99817 ) ) ( not ( = ?auto_99816 ?auto_99817 ) ) ( ON ?auto_99816 ?auto_99818 ) ( CLEAR ?auto_99816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99815 ?auto_99818 )
      ( MAKE-1PILE ?auto_99815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99819 - BLOCK
    )
    :vars
    (
      ?auto_99821 - BLOCK
      ?auto_99820 - BLOCK
      ?auto_99822 - BLOCK
      ?auto_99825 - BLOCK
      ?auto_99824 - BLOCK
      ?auto_99826 - BLOCK
      ?auto_99823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99821 ?auto_99819 ) ( ON-TABLE ?auto_99819 ) ( not ( = ?auto_99819 ?auto_99821 ) ) ( not ( = ?auto_99819 ?auto_99820 ) ) ( not ( = ?auto_99819 ?auto_99822 ) ) ( not ( = ?auto_99821 ?auto_99820 ) ) ( not ( = ?auto_99821 ?auto_99822 ) ) ( not ( = ?auto_99820 ?auto_99822 ) ) ( ON ?auto_99820 ?auto_99821 ) ( CLEAR ?auto_99820 ) ( HOLDING ?auto_99822 ) ( CLEAR ?auto_99825 ) ( ON-TABLE ?auto_99824 ) ( ON ?auto_99826 ?auto_99824 ) ( ON ?auto_99823 ?auto_99826 ) ( ON ?auto_99825 ?auto_99823 ) ( not ( = ?auto_99824 ?auto_99826 ) ) ( not ( = ?auto_99824 ?auto_99823 ) ) ( not ( = ?auto_99824 ?auto_99825 ) ) ( not ( = ?auto_99824 ?auto_99822 ) ) ( not ( = ?auto_99826 ?auto_99823 ) ) ( not ( = ?auto_99826 ?auto_99825 ) ) ( not ( = ?auto_99826 ?auto_99822 ) ) ( not ( = ?auto_99823 ?auto_99825 ) ) ( not ( = ?auto_99823 ?auto_99822 ) ) ( not ( = ?auto_99825 ?auto_99822 ) ) ( not ( = ?auto_99819 ?auto_99825 ) ) ( not ( = ?auto_99819 ?auto_99824 ) ) ( not ( = ?auto_99819 ?auto_99826 ) ) ( not ( = ?auto_99819 ?auto_99823 ) ) ( not ( = ?auto_99821 ?auto_99825 ) ) ( not ( = ?auto_99821 ?auto_99824 ) ) ( not ( = ?auto_99821 ?auto_99826 ) ) ( not ( = ?auto_99821 ?auto_99823 ) ) ( not ( = ?auto_99820 ?auto_99825 ) ) ( not ( = ?auto_99820 ?auto_99824 ) ) ( not ( = ?auto_99820 ?auto_99826 ) ) ( not ( = ?auto_99820 ?auto_99823 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99824 ?auto_99826 ?auto_99823 ?auto_99825 ?auto_99822 )
      ( MAKE-1PILE ?auto_99819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99827 - BLOCK
    )
    :vars
    (
      ?auto_99830 - BLOCK
      ?auto_99828 - BLOCK
      ?auto_99831 - BLOCK
      ?auto_99833 - BLOCK
      ?auto_99832 - BLOCK
      ?auto_99834 - BLOCK
      ?auto_99829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99830 ?auto_99827 ) ( ON-TABLE ?auto_99827 ) ( not ( = ?auto_99827 ?auto_99830 ) ) ( not ( = ?auto_99827 ?auto_99828 ) ) ( not ( = ?auto_99827 ?auto_99831 ) ) ( not ( = ?auto_99830 ?auto_99828 ) ) ( not ( = ?auto_99830 ?auto_99831 ) ) ( not ( = ?auto_99828 ?auto_99831 ) ) ( ON ?auto_99828 ?auto_99830 ) ( CLEAR ?auto_99833 ) ( ON-TABLE ?auto_99832 ) ( ON ?auto_99834 ?auto_99832 ) ( ON ?auto_99829 ?auto_99834 ) ( ON ?auto_99833 ?auto_99829 ) ( not ( = ?auto_99832 ?auto_99834 ) ) ( not ( = ?auto_99832 ?auto_99829 ) ) ( not ( = ?auto_99832 ?auto_99833 ) ) ( not ( = ?auto_99832 ?auto_99831 ) ) ( not ( = ?auto_99834 ?auto_99829 ) ) ( not ( = ?auto_99834 ?auto_99833 ) ) ( not ( = ?auto_99834 ?auto_99831 ) ) ( not ( = ?auto_99829 ?auto_99833 ) ) ( not ( = ?auto_99829 ?auto_99831 ) ) ( not ( = ?auto_99833 ?auto_99831 ) ) ( not ( = ?auto_99827 ?auto_99833 ) ) ( not ( = ?auto_99827 ?auto_99832 ) ) ( not ( = ?auto_99827 ?auto_99834 ) ) ( not ( = ?auto_99827 ?auto_99829 ) ) ( not ( = ?auto_99830 ?auto_99833 ) ) ( not ( = ?auto_99830 ?auto_99832 ) ) ( not ( = ?auto_99830 ?auto_99834 ) ) ( not ( = ?auto_99830 ?auto_99829 ) ) ( not ( = ?auto_99828 ?auto_99833 ) ) ( not ( = ?auto_99828 ?auto_99832 ) ) ( not ( = ?auto_99828 ?auto_99834 ) ) ( not ( = ?auto_99828 ?auto_99829 ) ) ( ON ?auto_99831 ?auto_99828 ) ( CLEAR ?auto_99831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99827 ?auto_99830 ?auto_99828 )
      ( MAKE-1PILE ?auto_99827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99835 - BLOCK
    )
    :vars
    (
      ?auto_99837 - BLOCK
      ?auto_99842 - BLOCK
      ?auto_99840 - BLOCK
      ?auto_99836 - BLOCK
      ?auto_99838 - BLOCK
      ?auto_99841 - BLOCK
      ?auto_99839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99837 ?auto_99835 ) ( ON-TABLE ?auto_99835 ) ( not ( = ?auto_99835 ?auto_99837 ) ) ( not ( = ?auto_99835 ?auto_99842 ) ) ( not ( = ?auto_99835 ?auto_99840 ) ) ( not ( = ?auto_99837 ?auto_99842 ) ) ( not ( = ?auto_99837 ?auto_99840 ) ) ( not ( = ?auto_99842 ?auto_99840 ) ) ( ON ?auto_99842 ?auto_99837 ) ( ON-TABLE ?auto_99836 ) ( ON ?auto_99838 ?auto_99836 ) ( ON ?auto_99841 ?auto_99838 ) ( not ( = ?auto_99836 ?auto_99838 ) ) ( not ( = ?auto_99836 ?auto_99841 ) ) ( not ( = ?auto_99836 ?auto_99839 ) ) ( not ( = ?auto_99836 ?auto_99840 ) ) ( not ( = ?auto_99838 ?auto_99841 ) ) ( not ( = ?auto_99838 ?auto_99839 ) ) ( not ( = ?auto_99838 ?auto_99840 ) ) ( not ( = ?auto_99841 ?auto_99839 ) ) ( not ( = ?auto_99841 ?auto_99840 ) ) ( not ( = ?auto_99839 ?auto_99840 ) ) ( not ( = ?auto_99835 ?auto_99839 ) ) ( not ( = ?auto_99835 ?auto_99836 ) ) ( not ( = ?auto_99835 ?auto_99838 ) ) ( not ( = ?auto_99835 ?auto_99841 ) ) ( not ( = ?auto_99837 ?auto_99839 ) ) ( not ( = ?auto_99837 ?auto_99836 ) ) ( not ( = ?auto_99837 ?auto_99838 ) ) ( not ( = ?auto_99837 ?auto_99841 ) ) ( not ( = ?auto_99842 ?auto_99839 ) ) ( not ( = ?auto_99842 ?auto_99836 ) ) ( not ( = ?auto_99842 ?auto_99838 ) ) ( not ( = ?auto_99842 ?auto_99841 ) ) ( ON ?auto_99840 ?auto_99842 ) ( CLEAR ?auto_99840 ) ( HOLDING ?auto_99839 ) ( CLEAR ?auto_99841 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99836 ?auto_99838 ?auto_99841 ?auto_99839 )
      ( MAKE-1PILE ?auto_99835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99843 - BLOCK
    )
    :vars
    (
      ?auto_99847 - BLOCK
      ?auto_99846 - BLOCK
      ?auto_99844 - BLOCK
      ?auto_99848 - BLOCK
      ?auto_99849 - BLOCK
      ?auto_99845 - BLOCK
      ?auto_99850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99847 ?auto_99843 ) ( ON-TABLE ?auto_99843 ) ( not ( = ?auto_99843 ?auto_99847 ) ) ( not ( = ?auto_99843 ?auto_99846 ) ) ( not ( = ?auto_99843 ?auto_99844 ) ) ( not ( = ?auto_99847 ?auto_99846 ) ) ( not ( = ?auto_99847 ?auto_99844 ) ) ( not ( = ?auto_99846 ?auto_99844 ) ) ( ON ?auto_99846 ?auto_99847 ) ( ON-TABLE ?auto_99848 ) ( ON ?auto_99849 ?auto_99848 ) ( ON ?auto_99845 ?auto_99849 ) ( not ( = ?auto_99848 ?auto_99849 ) ) ( not ( = ?auto_99848 ?auto_99845 ) ) ( not ( = ?auto_99848 ?auto_99850 ) ) ( not ( = ?auto_99848 ?auto_99844 ) ) ( not ( = ?auto_99849 ?auto_99845 ) ) ( not ( = ?auto_99849 ?auto_99850 ) ) ( not ( = ?auto_99849 ?auto_99844 ) ) ( not ( = ?auto_99845 ?auto_99850 ) ) ( not ( = ?auto_99845 ?auto_99844 ) ) ( not ( = ?auto_99850 ?auto_99844 ) ) ( not ( = ?auto_99843 ?auto_99850 ) ) ( not ( = ?auto_99843 ?auto_99848 ) ) ( not ( = ?auto_99843 ?auto_99849 ) ) ( not ( = ?auto_99843 ?auto_99845 ) ) ( not ( = ?auto_99847 ?auto_99850 ) ) ( not ( = ?auto_99847 ?auto_99848 ) ) ( not ( = ?auto_99847 ?auto_99849 ) ) ( not ( = ?auto_99847 ?auto_99845 ) ) ( not ( = ?auto_99846 ?auto_99850 ) ) ( not ( = ?auto_99846 ?auto_99848 ) ) ( not ( = ?auto_99846 ?auto_99849 ) ) ( not ( = ?auto_99846 ?auto_99845 ) ) ( ON ?auto_99844 ?auto_99846 ) ( CLEAR ?auto_99845 ) ( ON ?auto_99850 ?auto_99844 ) ( CLEAR ?auto_99850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99843 ?auto_99847 ?auto_99846 ?auto_99844 )
      ( MAKE-1PILE ?auto_99843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99851 - BLOCK
    )
    :vars
    (
      ?auto_99852 - BLOCK
      ?auto_99857 - BLOCK
      ?auto_99853 - BLOCK
      ?auto_99856 - BLOCK
      ?auto_99855 - BLOCK
      ?auto_99858 - BLOCK
      ?auto_99854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99852 ?auto_99851 ) ( ON-TABLE ?auto_99851 ) ( not ( = ?auto_99851 ?auto_99852 ) ) ( not ( = ?auto_99851 ?auto_99857 ) ) ( not ( = ?auto_99851 ?auto_99853 ) ) ( not ( = ?auto_99852 ?auto_99857 ) ) ( not ( = ?auto_99852 ?auto_99853 ) ) ( not ( = ?auto_99857 ?auto_99853 ) ) ( ON ?auto_99857 ?auto_99852 ) ( ON-TABLE ?auto_99856 ) ( ON ?auto_99855 ?auto_99856 ) ( not ( = ?auto_99856 ?auto_99855 ) ) ( not ( = ?auto_99856 ?auto_99858 ) ) ( not ( = ?auto_99856 ?auto_99854 ) ) ( not ( = ?auto_99856 ?auto_99853 ) ) ( not ( = ?auto_99855 ?auto_99858 ) ) ( not ( = ?auto_99855 ?auto_99854 ) ) ( not ( = ?auto_99855 ?auto_99853 ) ) ( not ( = ?auto_99858 ?auto_99854 ) ) ( not ( = ?auto_99858 ?auto_99853 ) ) ( not ( = ?auto_99854 ?auto_99853 ) ) ( not ( = ?auto_99851 ?auto_99854 ) ) ( not ( = ?auto_99851 ?auto_99856 ) ) ( not ( = ?auto_99851 ?auto_99855 ) ) ( not ( = ?auto_99851 ?auto_99858 ) ) ( not ( = ?auto_99852 ?auto_99854 ) ) ( not ( = ?auto_99852 ?auto_99856 ) ) ( not ( = ?auto_99852 ?auto_99855 ) ) ( not ( = ?auto_99852 ?auto_99858 ) ) ( not ( = ?auto_99857 ?auto_99854 ) ) ( not ( = ?auto_99857 ?auto_99856 ) ) ( not ( = ?auto_99857 ?auto_99855 ) ) ( not ( = ?auto_99857 ?auto_99858 ) ) ( ON ?auto_99853 ?auto_99857 ) ( ON ?auto_99854 ?auto_99853 ) ( CLEAR ?auto_99854 ) ( HOLDING ?auto_99858 ) ( CLEAR ?auto_99855 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99856 ?auto_99855 ?auto_99858 )
      ( MAKE-1PILE ?auto_99851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99859 - BLOCK
    )
    :vars
    (
      ?auto_99861 - BLOCK
      ?auto_99866 - BLOCK
      ?auto_99864 - BLOCK
      ?auto_99862 - BLOCK
      ?auto_99865 - BLOCK
      ?auto_99860 - BLOCK
      ?auto_99863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99861 ?auto_99859 ) ( ON-TABLE ?auto_99859 ) ( not ( = ?auto_99859 ?auto_99861 ) ) ( not ( = ?auto_99859 ?auto_99866 ) ) ( not ( = ?auto_99859 ?auto_99864 ) ) ( not ( = ?auto_99861 ?auto_99866 ) ) ( not ( = ?auto_99861 ?auto_99864 ) ) ( not ( = ?auto_99866 ?auto_99864 ) ) ( ON ?auto_99866 ?auto_99861 ) ( ON-TABLE ?auto_99862 ) ( ON ?auto_99865 ?auto_99862 ) ( not ( = ?auto_99862 ?auto_99865 ) ) ( not ( = ?auto_99862 ?auto_99860 ) ) ( not ( = ?auto_99862 ?auto_99863 ) ) ( not ( = ?auto_99862 ?auto_99864 ) ) ( not ( = ?auto_99865 ?auto_99860 ) ) ( not ( = ?auto_99865 ?auto_99863 ) ) ( not ( = ?auto_99865 ?auto_99864 ) ) ( not ( = ?auto_99860 ?auto_99863 ) ) ( not ( = ?auto_99860 ?auto_99864 ) ) ( not ( = ?auto_99863 ?auto_99864 ) ) ( not ( = ?auto_99859 ?auto_99863 ) ) ( not ( = ?auto_99859 ?auto_99862 ) ) ( not ( = ?auto_99859 ?auto_99865 ) ) ( not ( = ?auto_99859 ?auto_99860 ) ) ( not ( = ?auto_99861 ?auto_99863 ) ) ( not ( = ?auto_99861 ?auto_99862 ) ) ( not ( = ?auto_99861 ?auto_99865 ) ) ( not ( = ?auto_99861 ?auto_99860 ) ) ( not ( = ?auto_99866 ?auto_99863 ) ) ( not ( = ?auto_99866 ?auto_99862 ) ) ( not ( = ?auto_99866 ?auto_99865 ) ) ( not ( = ?auto_99866 ?auto_99860 ) ) ( ON ?auto_99864 ?auto_99866 ) ( ON ?auto_99863 ?auto_99864 ) ( CLEAR ?auto_99865 ) ( ON ?auto_99860 ?auto_99863 ) ( CLEAR ?auto_99860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99859 ?auto_99861 ?auto_99866 ?auto_99864 ?auto_99863 )
      ( MAKE-1PILE ?auto_99859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99867 - BLOCK
    )
    :vars
    (
      ?auto_99869 - BLOCK
      ?auto_99871 - BLOCK
      ?auto_99873 - BLOCK
      ?auto_99870 - BLOCK
      ?auto_99868 - BLOCK
      ?auto_99872 - BLOCK
      ?auto_99874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99869 ?auto_99867 ) ( ON-TABLE ?auto_99867 ) ( not ( = ?auto_99867 ?auto_99869 ) ) ( not ( = ?auto_99867 ?auto_99871 ) ) ( not ( = ?auto_99867 ?auto_99873 ) ) ( not ( = ?auto_99869 ?auto_99871 ) ) ( not ( = ?auto_99869 ?auto_99873 ) ) ( not ( = ?auto_99871 ?auto_99873 ) ) ( ON ?auto_99871 ?auto_99869 ) ( ON-TABLE ?auto_99870 ) ( not ( = ?auto_99870 ?auto_99868 ) ) ( not ( = ?auto_99870 ?auto_99872 ) ) ( not ( = ?auto_99870 ?auto_99874 ) ) ( not ( = ?auto_99870 ?auto_99873 ) ) ( not ( = ?auto_99868 ?auto_99872 ) ) ( not ( = ?auto_99868 ?auto_99874 ) ) ( not ( = ?auto_99868 ?auto_99873 ) ) ( not ( = ?auto_99872 ?auto_99874 ) ) ( not ( = ?auto_99872 ?auto_99873 ) ) ( not ( = ?auto_99874 ?auto_99873 ) ) ( not ( = ?auto_99867 ?auto_99874 ) ) ( not ( = ?auto_99867 ?auto_99870 ) ) ( not ( = ?auto_99867 ?auto_99868 ) ) ( not ( = ?auto_99867 ?auto_99872 ) ) ( not ( = ?auto_99869 ?auto_99874 ) ) ( not ( = ?auto_99869 ?auto_99870 ) ) ( not ( = ?auto_99869 ?auto_99868 ) ) ( not ( = ?auto_99869 ?auto_99872 ) ) ( not ( = ?auto_99871 ?auto_99874 ) ) ( not ( = ?auto_99871 ?auto_99870 ) ) ( not ( = ?auto_99871 ?auto_99868 ) ) ( not ( = ?auto_99871 ?auto_99872 ) ) ( ON ?auto_99873 ?auto_99871 ) ( ON ?auto_99874 ?auto_99873 ) ( ON ?auto_99872 ?auto_99874 ) ( CLEAR ?auto_99872 ) ( HOLDING ?auto_99868 ) ( CLEAR ?auto_99870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99870 ?auto_99868 )
      ( MAKE-1PILE ?auto_99867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101281 - BLOCK
    )
    :vars
    (
      ?auto_101284 - BLOCK
      ?auto_101283 - BLOCK
      ?auto_101287 - BLOCK
      ?auto_101282 - BLOCK
      ?auto_101285 - BLOCK
      ?auto_101286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101284 ?auto_101281 ) ( ON-TABLE ?auto_101281 ) ( not ( = ?auto_101281 ?auto_101284 ) ) ( not ( = ?auto_101281 ?auto_101283 ) ) ( not ( = ?auto_101281 ?auto_101287 ) ) ( not ( = ?auto_101284 ?auto_101283 ) ) ( not ( = ?auto_101284 ?auto_101287 ) ) ( not ( = ?auto_101283 ?auto_101287 ) ) ( ON ?auto_101283 ?auto_101284 ) ( not ( = ?auto_101282 ?auto_101285 ) ) ( not ( = ?auto_101282 ?auto_101286 ) ) ( not ( = ?auto_101282 ?auto_101287 ) ) ( not ( = ?auto_101285 ?auto_101286 ) ) ( not ( = ?auto_101285 ?auto_101287 ) ) ( not ( = ?auto_101286 ?auto_101287 ) ) ( not ( = ?auto_101281 ?auto_101286 ) ) ( not ( = ?auto_101281 ?auto_101282 ) ) ( not ( = ?auto_101281 ?auto_101285 ) ) ( not ( = ?auto_101284 ?auto_101286 ) ) ( not ( = ?auto_101284 ?auto_101282 ) ) ( not ( = ?auto_101284 ?auto_101285 ) ) ( not ( = ?auto_101283 ?auto_101286 ) ) ( not ( = ?auto_101283 ?auto_101282 ) ) ( not ( = ?auto_101283 ?auto_101285 ) ) ( ON ?auto_101287 ?auto_101283 ) ( ON ?auto_101286 ?auto_101287 ) ( ON ?auto_101285 ?auto_101286 ) ( ON ?auto_101282 ?auto_101285 ) ( CLEAR ?auto_101282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101281 ?auto_101284 ?auto_101283 ?auto_101287 ?auto_101286 ?auto_101285 )
      ( MAKE-1PILE ?auto_101281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99883 - BLOCK
    )
    :vars
    (
      ?auto_99886 - BLOCK
      ?auto_99890 - BLOCK
      ?auto_99885 - BLOCK
      ?auto_99889 - BLOCK
      ?auto_99888 - BLOCK
      ?auto_99884 - BLOCK
      ?auto_99887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99886 ?auto_99883 ) ( ON-TABLE ?auto_99883 ) ( not ( = ?auto_99883 ?auto_99886 ) ) ( not ( = ?auto_99883 ?auto_99890 ) ) ( not ( = ?auto_99883 ?auto_99885 ) ) ( not ( = ?auto_99886 ?auto_99890 ) ) ( not ( = ?auto_99886 ?auto_99885 ) ) ( not ( = ?auto_99890 ?auto_99885 ) ) ( ON ?auto_99890 ?auto_99886 ) ( not ( = ?auto_99889 ?auto_99888 ) ) ( not ( = ?auto_99889 ?auto_99884 ) ) ( not ( = ?auto_99889 ?auto_99887 ) ) ( not ( = ?auto_99889 ?auto_99885 ) ) ( not ( = ?auto_99888 ?auto_99884 ) ) ( not ( = ?auto_99888 ?auto_99887 ) ) ( not ( = ?auto_99888 ?auto_99885 ) ) ( not ( = ?auto_99884 ?auto_99887 ) ) ( not ( = ?auto_99884 ?auto_99885 ) ) ( not ( = ?auto_99887 ?auto_99885 ) ) ( not ( = ?auto_99883 ?auto_99887 ) ) ( not ( = ?auto_99883 ?auto_99889 ) ) ( not ( = ?auto_99883 ?auto_99888 ) ) ( not ( = ?auto_99883 ?auto_99884 ) ) ( not ( = ?auto_99886 ?auto_99887 ) ) ( not ( = ?auto_99886 ?auto_99889 ) ) ( not ( = ?auto_99886 ?auto_99888 ) ) ( not ( = ?auto_99886 ?auto_99884 ) ) ( not ( = ?auto_99890 ?auto_99887 ) ) ( not ( = ?auto_99890 ?auto_99889 ) ) ( not ( = ?auto_99890 ?auto_99888 ) ) ( not ( = ?auto_99890 ?auto_99884 ) ) ( ON ?auto_99885 ?auto_99890 ) ( ON ?auto_99887 ?auto_99885 ) ( ON ?auto_99884 ?auto_99887 ) ( ON ?auto_99888 ?auto_99884 ) ( CLEAR ?auto_99888 ) ( HOLDING ?auto_99889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99889 )
      ( MAKE-1PILE ?auto_99883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_99891 - BLOCK
    )
    :vars
    (
      ?auto_99895 - BLOCK
      ?auto_99893 - BLOCK
      ?auto_99892 - BLOCK
      ?auto_99897 - BLOCK
      ?auto_99898 - BLOCK
      ?auto_99896 - BLOCK
      ?auto_99894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99895 ?auto_99891 ) ( ON-TABLE ?auto_99891 ) ( not ( = ?auto_99891 ?auto_99895 ) ) ( not ( = ?auto_99891 ?auto_99893 ) ) ( not ( = ?auto_99891 ?auto_99892 ) ) ( not ( = ?auto_99895 ?auto_99893 ) ) ( not ( = ?auto_99895 ?auto_99892 ) ) ( not ( = ?auto_99893 ?auto_99892 ) ) ( ON ?auto_99893 ?auto_99895 ) ( not ( = ?auto_99897 ?auto_99898 ) ) ( not ( = ?auto_99897 ?auto_99896 ) ) ( not ( = ?auto_99897 ?auto_99894 ) ) ( not ( = ?auto_99897 ?auto_99892 ) ) ( not ( = ?auto_99898 ?auto_99896 ) ) ( not ( = ?auto_99898 ?auto_99894 ) ) ( not ( = ?auto_99898 ?auto_99892 ) ) ( not ( = ?auto_99896 ?auto_99894 ) ) ( not ( = ?auto_99896 ?auto_99892 ) ) ( not ( = ?auto_99894 ?auto_99892 ) ) ( not ( = ?auto_99891 ?auto_99894 ) ) ( not ( = ?auto_99891 ?auto_99897 ) ) ( not ( = ?auto_99891 ?auto_99898 ) ) ( not ( = ?auto_99891 ?auto_99896 ) ) ( not ( = ?auto_99895 ?auto_99894 ) ) ( not ( = ?auto_99895 ?auto_99897 ) ) ( not ( = ?auto_99895 ?auto_99898 ) ) ( not ( = ?auto_99895 ?auto_99896 ) ) ( not ( = ?auto_99893 ?auto_99894 ) ) ( not ( = ?auto_99893 ?auto_99897 ) ) ( not ( = ?auto_99893 ?auto_99898 ) ) ( not ( = ?auto_99893 ?auto_99896 ) ) ( ON ?auto_99892 ?auto_99893 ) ( ON ?auto_99894 ?auto_99892 ) ( ON ?auto_99896 ?auto_99894 ) ( ON ?auto_99898 ?auto_99896 ) ( ON ?auto_99897 ?auto_99898 ) ( CLEAR ?auto_99897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99891 ?auto_99895 ?auto_99893 ?auto_99892 ?auto_99894 ?auto_99896 ?auto_99898 )
      ( MAKE-1PILE ?auto_99891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99906 - BLOCK
      ?auto_99907 - BLOCK
      ?auto_99908 - BLOCK
      ?auto_99909 - BLOCK
      ?auto_99910 - BLOCK
      ?auto_99911 - BLOCK
      ?auto_99912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_99912 ) ( CLEAR ?auto_99911 ) ( ON-TABLE ?auto_99906 ) ( ON ?auto_99907 ?auto_99906 ) ( ON ?auto_99908 ?auto_99907 ) ( ON ?auto_99909 ?auto_99908 ) ( ON ?auto_99910 ?auto_99909 ) ( ON ?auto_99911 ?auto_99910 ) ( not ( = ?auto_99906 ?auto_99907 ) ) ( not ( = ?auto_99906 ?auto_99908 ) ) ( not ( = ?auto_99906 ?auto_99909 ) ) ( not ( = ?auto_99906 ?auto_99910 ) ) ( not ( = ?auto_99906 ?auto_99911 ) ) ( not ( = ?auto_99906 ?auto_99912 ) ) ( not ( = ?auto_99907 ?auto_99908 ) ) ( not ( = ?auto_99907 ?auto_99909 ) ) ( not ( = ?auto_99907 ?auto_99910 ) ) ( not ( = ?auto_99907 ?auto_99911 ) ) ( not ( = ?auto_99907 ?auto_99912 ) ) ( not ( = ?auto_99908 ?auto_99909 ) ) ( not ( = ?auto_99908 ?auto_99910 ) ) ( not ( = ?auto_99908 ?auto_99911 ) ) ( not ( = ?auto_99908 ?auto_99912 ) ) ( not ( = ?auto_99909 ?auto_99910 ) ) ( not ( = ?auto_99909 ?auto_99911 ) ) ( not ( = ?auto_99909 ?auto_99912 ) ) ( not ( = ?auto_99910 ?auto_99911 ) ) ( not ( = ?auto_99910 ?auto_99912 ) ) ( not ( = ?auto_99911 ?auto_99912 ) ) )
    :subtasks
    ( ( !STACK ?auto_99912 ?auto_99911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99913 - BLOCK
      ?auto_99914 - BLOCK
      ?auto_99915 - BLOCK
      ?auto_99916 - BLOCK
      ?auto_99917 - BLOCK
      ?auto_99918 - BLOCK
      ?auto_99919 - BLOCK
    )
    :vars
    (
      ?auto_99920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99918 ) ( ON-TABLE ?auto_99913 ) ( ON ?auto_99914 ?auto_99913 ) ( ON ?auto_99915 ?auto_99914 ) ( ON ?auto_99916 ?auto_99915 ) ( ON ?auto_99917 ?auto_99916 ) ( ON ?auto_99918 ?auto_99917 ) ( not ( = ?auto_99913 ?auto_99914 ) ) ( not ( = ?auto_99913 ?auto_99915 ) ) ( not ( = ?auto_99913 ?auto_99916 ) ) ( not ( = ?auto_99913 ?auto_99917 ) ) ( not ( = ?auto_99913 ?auto_99918 ) ) ( not ( = ?auto_99913 ?auto_99919 ) ) ( not ( = ?auto_99914 ?auto_99915 ) ) ( not ( = ?auto_99914 ?auto_99916 ) ) ( not ( = ?auto_99914 ?auto_99917 ) ) ( not ( = ?auto_99914 ?auto_99918 ) ) ( not ( = ?auto_99914 ?auto_99919 ) ) ( not ( = ?auto_99915 ?auto_99916 ) ) ( not ( = ?auto_99915 ?auto_99917 ) ) ( not ( = ?auto_99915 ?auto_99918 ) ) ( not ( = ?auto_99915 ?auto_99919 ) ) ( not ( = ?auto_99916 ?auto_99917 ) ) ( not ( = ?auto_99916 ?auto_99918 ) ) ( not ( = ?auto_99916 ?auto_99919 ) ) ( not ( = ?auto_99917 ?auto_99918 ) ) ( not ( = ?auto_99917 ?auto_99919 ) ) ( not ( = ?auto_99918 ?auto_99919 ) ) ( ON ?auto_99919 ?auto_99920 ) ( CLEAR ?auto_99919 ) ( HAND-EMPTY ) ( not ( = ?auto_99913 ?auto_99920 ) ) ( not ( = ?auto_99914 ?auto_99920 ) ) ( not ( = ?auto_99915 ?auto_99920 ) ) ( not ( = ?auto_99916 ?auto_99920 ) ) ( not ( = ?auto_99917 ?auto_99920 ) ) ( not ( = ?auto_99918 ?auto_99920 ) ) ( not ( = ?auto_99919 ?auto_99920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99919 ?auto_99920 )
      ( MAKE-7PILE ?auto_99913 ?auto_99914 ?auto_99915 ?auto_99916 ?auto_99917 ?auto_99918 ?auto_99919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99921 - BLOCK
      ?auto_99922 - BLOCK
      ?auto_99923 - BLOCK
      ?auto_99924 - BLOCK
      ?auto_99925 - BLOCK
      ?auto_99926 - BLOCK
      ?auto_99927 - BLOCK
    )
    :vars
    (
      ?auto_99928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99921 ) ( ON ?auto_99922 ?auto_99921 ) ( ON ?auto_99923 ?auto_99922 ) ( ON ?auto_99924 ?auto_99923 ) ( ON ?auto_99925 ?auto_99924 ) ( not ( = ?auto_99921 ?auto_99922 ) ) ( not ( = ?auto_99921 ?auto_99923 ) ) ( not ( = ?auto_99921 ?auto_99924 ) ) ( not ( = ?auto_99921 ?auto_99925 ) ) ( not ( = ?auto_99921 ?auto_99926 ) ) ( not ( = ?auto_99921 ?auto_99927 ) ) ( not ( = ?auto_99922 ?auto_99923 ) ) ( not ( = ?auto_99922 ?auto_99924 ) ) ( not ( = ?auto_99922 ?auto_99925 ) ) ( not ( = ?auto_99922 ?auto_99926 ) ) ( not ( = ?auto_99922 ?auto_99927 ) ) ( not ( = ?auto_99923 ?auto_99924 ) ) ( not ( = ?auto_99923 ?auto_99925 ) ) ( not ( = ?auto_99923 ?auto_99926 ) ) ( not ( = ?auto_99923 ?auto_99927 ) ) ( not ( = ?auto_99924 ?auto_99925 ) ) ( not ( = ?auto_99924 ?auto_99926 ) ) ( not ( = ?auto_99924 ?auto_99927 ) ) ( not ( = ?auto_99925 ?auto_99926 ) ) ( not ( = ?auto_99925 ?auto_99927 ) ) ( not ( = ?auto_99926 ?auto_99927 ) ) ( ON ?auto_99927 ?auto_99928 ) ( CLEAR ?auto_99927 ) ( not ( = ?auto_99921 ?auto_99928 ) ) ( not ( = ?auto_99922 ?auto_99928 ) ) ( not ( = ?auto_99923 ?auto_99928 ) ) ( not ( = ?auto_99924 ?auto_99928 ) ) ( not ( = ?auto_99925 ?auto_99928 ) ) ( not ( = ?auto_99926 ?auto_99928 ) ) ( not ( = ?auto_99927 ?auto_99928 ) ) ( HOLDING ?auto_99926 ) ( CLEAR ?auto_99925 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99921 ?auto_99922 ?auto_99923 ?auto_99924 ?auto_99925 ?auto_99926 )
      ( MAKE-7PILE ?auto_99921 ?auto_99922 ?auto_99923 ?auto_99924 ?auto_99925 ?auto_99926 ?auto_99927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99929 - BLOCK
      ?auto_99930 - BLOCK
      ?auto_99931 - BLOCK
      ?auto_99932 - BLOCK
      ?auto_99933 - BLOCK
      ?auto_99934 - BLOCK
      ?auto_99935 - BLOCK
    )
    :vars
    (
      ?auto_99936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99929 ) ( ON ?auto_99930 ?auto_99929 ) ( ON ?auto_99931 ?auto_99930 ) ( ON ?auto_99932 ?auto_99931 ) ( ON ?auto_99933 ?auto_99932 ) ( not ( = ?auto_99929 ?auto_99930 ) ) ( not ( = ?auto_99929 ?auto_99931 ) ) ( not ( = ?auto_99929 ?auto_99932 ) ) ( not ( = ?auto_99929 ?auto_99933 ) ) ( not ( = ?auto_99929 ?auto_99934 ) ) ( not ( = ?auto_99929 ?auto_99935 ) ) ( not ( = ?auto_99930 ?auto_99931 ) ) ( not ( = ?auto_99930 ?auto_99932 ) ) ( not ( = ?auto_99930 ?auto_99933 ) ) ( not ( = ?auto_99930 ?auto_99934 ) ) ( not ( = ?auto_99930 ?auto_99935 ) ) ( not ( = ?auto_99931 ?auto_99932 ) ) ( not ( = ?auto_99931 ?auto_99933 ) ) ( not ( = ?auto_99931 ?auto_99934 ) ) ( not ( = ?auto_99931 ?auto_99935 ) ) ( not ( = ?auto_99932 ?auto_99933 ) ) ( not ( = ?auto_99932 ?auto_99934 ) ) ( not ( = ?auto_99932 ?auto_99935 ) ) ( not ( = ?auto_99933 ?auto_99934 ) ) ( not ( = ?auto_99933 ?auto_99935 ) ) ( not ( = ?auto_99934 ?auto_99935 ) ) ( ON ?auto_99935 ?auto_99936 ) ( not ( = ?auto_99929 ?auto_99936 ) ) ( not ( = ?auto_99930 ?auto_99936 ) ) ( not ( = ?auto_99931 ?auto_99936 ) ) ( not ( = ?auto_99932 ?auto_99936 ) ) ( not ( = ?auto_99933 ?auto_99936 ) ) ( not ( = ?auto_99934 ?auto_99936 ) ) ( not ( = ?auto_99935 ?auto_99936 ) ) ( CLEAR ?auto_99933 ) ( ON ?auto_99934 ?auto_99935 ) ( CLEAR ?auto_99934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99936 ?auto_99935 )
      ( MAKE-7PILE ?auto_99929 ?auto_99930 ?auto_99931 ?auto_99932 ?auto_99933 ?auto_99934 ?auto_99935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99937 - BLOCK
      ?auto_99938 - BLOCK
      ?auto_99939 - BLOCK
      ?auto_99940 - BLOCK
      ?auto_99941 - BLOCK
      ?auto_99942 - BLOCK
      ?auto_99943 - BLOCK
    )
    :vars
    (
      ?auto_99944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99937 ) ( ON ?auto_99938 ?auto_99937 ) ( ON ?auto_99939 ?auto_99938 ) ( ON ?auto_99940 ?auto_99939 ) ( not ( = ?auto_99937 ?auto_99938 ) ) ( not ( = ?auto_99937 ?auto_99939 ) ) ( not ( = ?auto_99937 ?auto_99940 ) ) ( not ( = ?auto_99937 ?auto_99941 ) ) ( not ( = ?auto_99937 ?auto_99942 ) ) ( not ( = ?auto_99937 ?auto_99943 ) ) ( not ( = ?auto_99938 ?auto_99939 ) ) ( not ( = ?auto_99938 ?auto_99940 ) ) ( not ( = ?auto_99938 ?auto_99941 ) ) ( not ( = ?auto_99938 ?auto_99942 ) ) ( not ( = ?auto_99938 ?auto_99943 ) ) ( not ( = ?auto_99939 ?auto_99940 ) ) ( not ( = ?auto_99939 ?auto_99941 ) ) ( not ( = ?auto_99939 ?auto_99942 ) ) ( not ( = ?auto_99939 ?auto_99943 ) ) ( not ( = ?auto_99940 ?auto_99941 ) ) ( not ( = ?auto_99940 ?auto_99942 ) ) ( not ( = ?auto_99940 ?auto_99943 ) ) ( not ( = ?auto_99941 ?auto_99942 ) ) ( not ( = ?auto_99941 ?auto_99943 ) ) ( not ( = ?auto_99942 ?auto_99943 ) ) ( ON ?auto_99943 ?auto_99944 ) ( not ( = ?auto_99937 ?auto_99944 ) ) ( not ( = ?auto_99938 ?auto_99944 ) ) ( not ( = ?auto_99939 ?auto_99944 ) ) ( not ( = ?auto_99940 ?auto_99944 ) ) ( not ( = ?auto_99941 ?auto_99944 ) ) ( not ( = ?auto_99942 ?auto_99944 ) ) ( not ( = ?auto_99943 ?auto_99944 ) ) ( ON ?auto_99942 ?auto_99943 ) ( CLEAR ?auto_99942 ) ( ON-TABLE ?auto_99944 ) ( HOLDING ?auto_99941 ) ( CLEAR ?auto_99940 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99937 ?auto_99938 ?auto_99939 ?auto_99940 ?auto_99941 )
      ( MAKE-7PILE ?auto_99937 ?auto_99938 ?auto_99939 ?auto_99940 ?auto_99941 ?auto_99942 ?auto_99943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99945 - BLOCK
      ?auto_99946 - BLOCK
      ?auto_99947 - BLOCK
      ?auto_99948 - BLOCK
      ?auto_99949 - BLOCK
      ?auto_99950 - BLOCK
      ?auto_99951 - BLOCK
    )
    :vars
    (
      ?auto_99952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99945 ) ( ON ?auto_99946 ?auto_99945 ) ( ON ?auto_99947 ?auto_99946 ) ( ON ?auto_99948 ?auto_99947 ) ( not ( = ?auto_99945 ?auto_99946 ) ) ( not ( = ?auto_99945 ?auto_99947 ) ) ( not ( = ?auto_99945 ?auto_99948 ) ) ( not ( = ?auto_99945 ?auto_99949 ) ) ( not ( = ?auto_99945 ?auto_99950 ) ) ( not ( = ?auto_99945 ?auto_99951 ) ) ( not ( = ?auto_99946 ?auto_99947 ) ) ( not ( = ?auto_99946 ?auto_99948 ) ) ( not ( = ?auto_99946 ?auto_99949 ) ) ( not ( = ?auto_99946 ?auto_99950 ) ) ( not ( = ?auto_99946 ?auto_99951 ) ) ( not ( = ?auto_99947 ?auto_99948 ) ) ( not ( = ?auto_99947 ?auto_99949 ) ) ( not ( = ?auto_99947 ?auto_99950 ) ) ( not ( = ?auto_99947 ?auto_99951 ) ) ( not ( = ?auto_99948 ?auto_99949 ) ) ( not ( = ?auto_99948 ?auto_99950 ) ) ( not ( = ?auto_99948 ?auto_99951 ) ) ( not ( = ?auto_99949 ?auto_99950 ) ) ( not ( = ?auto_99949 ?auto_99951 ) ) ( not ( = ?auto_99950 ?auto_99951 ) ) ( ON ?auto_99951 ?auto_99952 ) ( not ( = ?auto_99945 ?auto_99952 ) ) ( not ( = ?auto_99946 ?auto_99952 ) ) ( not ( = ?auto_99947 ?auto_99952 ) ) ( not ( = ?auto_99948 ?auto_99952 ) ) ( not ( = ?auto_99949 ?auto_99952 ) ) ( not ( = ?auto_99950 ?auto_99952 ) ) ( not ( = ?auto_99951 ?auto_99952 ) ) ( ON ?auto_99950 ?auto_99951 ) ( ON-TABLE ?auto_99952 ) ( CLEAR ?auto_99948 ) ( ON ?auto_99949 ?auto_99950 ) ( CLEAR ?auto_99949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99952 ?auto_99951 ?auto_99950 )
      ( MAKE-7PILE ?auto_99945 ?auto_99946 ?auto_99947 ?auto_99948 ?auto_99949 ?auto_99950 ?auto_99951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99953 - BLOCK
      ?auto_99954 - BLOCK
      ?auto_99955 - BLOCK
      ?auto_99956 - BLOCK
      ?auto_99957 - BLOCK
      ?auto_99958 - BLOCK
      ?auto_99959 - BLOCK
    )
    :vars
    (
      ?auto_99960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99953 ) ( ON ?auto_99954 ?auto_99953 ) ( ON ?auto_99955 ?auto_99954 ) ( not ( = ?auto_99953 ?auto_99954 ) ) ( not ( = ?auto_99953 ?auto_99955 ) ) ( not ( = ?auto_99953 ?auto_99956 ) ) ( not ( = ?auto_99953 ?auto_99957 ) ) ( not ( = ?auto_99953 ?auto_99958 ) ) ( not ( = ?auto_99953 ?auto_99959 ) ) ( not ( = ?auto_99954 ?auto_99955 ) ) ( not ( = ?auto_99954 ?auto_99956 ) ) ( not ( = ?auto_99954 ?auto_99957 ) ) ( not ( = ?auto_99954 ?auto_99958 ) ) ( not ( = ?auto_99954 ?auto_99959 ) ) ( not ( = ?auto_99955 ?auto_99956 ) ) ( not ( = ?auto_99955 ?auto_99957 ) ) ( not ( = ?auto_99955 ?auto_99958 ) ) ( not ( = ?auto_99955 ?auto_99959 ) ) ( not ( = ?auto_99956 ?auto_99957 ) ) ( not ( = ?auto_99956 ?auto_99958 ) ) ( not ( = ?auto_99956 ?auto_99959 ) ) ( not ( = ?auto_99957 ?auto_99958 ) ) ( not ( = ?auto_99957 ?auto_99959 ) ) ( not ( = ?auto_99958 ?auto_99959 ) ) ( ON ?auto_99959 ?auto_99960 ) ( not ( = ?auto_99953 ?auto_99960 ) ) ( not ( = ?auto_99954 ?auto_99960 ) ) ( not ( = ?auto_99955 ?auto_99960 ) ) ( not ( = ?auto_99956 ?auto_99960 ) ) ( not ( = ?auto_99957 ?auto_99960 ) ) ( not ( = ?auto_99958 ?auto_99960 ) ) ( not ( = ?auto_99959 ?auto_99960 ) ) ( ON ?auto_99958 ?auto_99959 ) ( ON-TABLE ?auto_99960 ) ( ON ?auto_99957 ?auto_99958 ) ( CLEAR ?auto_99957 ) ( HOLDING ?auto_99956 ) ( CLEAR ?auto_99955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99953 ?auto_99954 ?auto_99955 ?auto_99956 )
      ( MAKE-7PILE ?auto_99953 ?auto_99954 ?auto_99955 ?auto_99956 ?auto_99957 ?auto_99958 ?auto_99959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99961 - BLOCK
      ?auto_99962 - BLOCK
      ?auto_99963 - BLOCK
      ?auto_99964 - BLOCK
      ?auto_99965 - BLOCK
      ?auto_99966 - BLOCK
      ?auto_99967 - BLOCK
    )
    :vars
    (
      ?auto_99968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99961 ) ( ON ?auto_99962 ?auto_99961 ) ( ON ?auto_99963 ?auto_99962 ) ( not ( = ?auto_99961 ?auto_99962 ) ) ( not ( = ?auto_99961 ?auto_99963 ) ) ( not ( = ?auto_99961 ?auto_99964 ) ) ( not ( = ?auto_99961 ?auto_99965 ) ) ( not ( = ?auto_99961 ?auto_99966 ) ) ( not ( = ?auto_99961 ?auto_99967 ) ) ( not ( = ?auto_99962 ?auto_99963 ) ) ( not ( = ?auto_99962 ?auto_99964 ) ) ( not ( = ?auto_99962 ?auto_99965 ) ) ( not ( = ?auto_99962 ?auto_99966 ) ) ( not ( = ?auto_99962 ?auto_99967 ) ) ( not ( = ?auto_99963 ?auto_99964 ) ) ( not ( = ?auto_99963 ?auto_99965 ) ) ( not ( = ?auto_99963 ?auto_99966 ) ) ( not ( = ?auto_99963 ?auto_99967 ) ) ( not ( = ?auto_99964 ?auto_99965 ) ) ( not ( = ?auto_99964 ?auto_99966 ) ) ( not ( = ?auto_99964 ?auto_99967 ) ) ( not ( = ?auto_99965 ?auto_99966 ) ) ( not ( = ?auto_99965 ?auto_99967 ) ) ( not ( = ?auto_99966 ?auto_99967 ) ) ( ON ?auto_99967 ?auto_99968 ) ( not ( = ?auto_99961 ?auto_99968 ) ) ( not ( = ?auto_99962 ?auto_99968 ) ) ( not ( = ?auto_99963 ?auto_99968 ) ) ( not ( = ?auto_99964 ?auto_99968 ) ) ( not ( = ?auto_99965 ?auto_99968 ) ) ( not ( = ?auto_99966 ?auto_99968 ) ) ( not ( = ?auto_99967 ?auto_99968 ) ) ( ON ?auto_99966 ?auto_99967 ) ( ON-TABLE ?auto_99968 ) ( ON ?auto_99965 ?auto_99966 ) ( CLEAR ?auto_99963 ) ( ON ?auto_99964 ?auto_99965 ) ( CLEAR ?auto_99964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99968 ?auto_99967 ?auto_99966 ?auto_99965 )
      ( MAKE-7PILE ?auto_99961 ?auto_99962 ?auto_99963 ?auto_99964 ?auto_99965 ?auto_99966 ?auto_99967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99969 - BLOCK
      ?auto_99970 - BLOCK
      ?auto_99971 - BLOCK
      ?auto_99972 - BLOCK
      ?auto_99973 - BLOCK
      ?auto_99974 - BLOCK
      ?auto_99975 - BLOCK
    )
    :vars
    (
      ?auto_99976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99969 ) ( ON ?auto_99970 ?auto_99969 ) ( not ( = ?auto_99969 ?auto_99970 ) ) ( not ( = ?auto_99969 ?auto_99971 ) ) ( not ( = ?auto_99969 ?auto_99972 ) ) ( not ( = ?auto_99969 ?auto_99973 ) ) ( not ( = ?auto_99969 ?auto_99974 ) ) ( not ( = ?auto_99969 ?auto_99975 ) ) ( not ( = ?auto_99970 ?auto_99971 ) ) ( not ( = ?auto_99970 ?auto_99972 ) ) ( not ( = ?auto_99970 ?auto_99973 ) ) ( not ( = ?auto_99970 ?auto_99974 ) ) ( not ( = ?auto_99970 ?auto_99975 ) ) ( not ( = ?auto_99971 ?auto_99972 ) ) ( not ( = ?auto_99971 ?auto_99973 ) ) ( not ( = ?auto_99971 ?auto_99974 ) ) ( not ( = ?auto_99971 ?auto_99975 ) ) ( not ( = ?auto_99972 ?auto_99973 ) ) ( not ( = ?auto_99972 ?auto_99974 ) ) ( not ( = ?auto_99972 ?auto_99975 ) ) ( not ( = ?auto_99973 ?auto_99974 ) ) ( not ( = ?auto_99973 ?auto_99975 ) ) ( not ( = ?auto_99974 ?auto_99975 ) ) ( ON ?auto_99975 ?auto_99976 ) ( not ( = ?auto_99969 ?auto_99976 ) ) ( not ( = ?auto_99970 ?auto_99976 ) ) ( not ( = ?auto_99971 ?auto_99976 ) ) ( not ( = ?auto_99972 ?auto_99976 ) ) ( not ( = ?auto_99973 ?auto_99976 ) ) ( not ( = ?auto_99974 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99976 ) ) ( ON ?auto_99974 ?auto_99975 ) ( ON-TABLE ?auto_99976 ) ( ON ?auto_99973 ?auto_99974 ) ( ON ?auto_99972 ?auto_99973 ) ( CLEAR ?auto_99972 ) ( HOLDING ?auto_99971 ) ( CLEAR ?auto_99970 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99969 ?auto_99970 ?auto_99971 )
      ( MAKE-7PILE ?auto_99969 ?auto_99970 ?auto_99971 ?auto_99972 ?auto_99973 ?auto_99974 ?auto_99975 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99977 - BLOCK
      ?auto_99978 - BLOCK
      ?auto_99979 - BLOCK
      ?auto_99980 - BLOCK
      ?auto_99981 - BLOCK
      ?auto_99982 - BLOCK
      ?auto_99983 - BLOCK
    )
    :vars
    (
      ?auto_99984 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99977 ) ( ON ?auto_99978 ?auto_99977 ) ( not ( = ?auto_99977 ?auto_99978 ) ) ( not ( = ?auto_99977 ?auto_99979 ) ) ( not ( = ?auto_99977 ?auto_99980 ) ) ( not ( = ?auto_99977 ?auto_99981 ) ) ( not ( = ?auto_99977 ?auto_99982 ) ) ( not ( = ?auto_99977 ?auto_99983 ) ) ( not ( = ?auto_99978 ?auto_99979 ) ) ( not ( = ?auto_99978 ?auto_99980 ) ) ( not ( = ?auto_99978 ?auto_99981 ) ) ( not ( = ?auto_99978 ?auto_99982 ) ) ( not ( = ?auto_99978 ?auto_99983 ) ) ( not ( = ?auto_99979 ?auto_99980 ) ) ( not ( = ?auto_99979 ?auto_99981 ) ) ( not ( = ?auto_99979 ?auto_99982 ) ) ( not ( = ?auto_99979 ?auto_99983 ) ) ( not ( = ?auto_99980 ?auto_99981 ) ) ( not ( = ?auto_99980 ?auto_99982 ) ) ( not ( = ?auto_99980 ?auto_99983 ) ) ( not ( = ?auto_99981 ?auto_99982 ) ) ( not ( = ?auto_99981 ?auto_99983 ) ) ( not ( = ?auto_99982 ?auto_99983 ) ) ( ON ?auto_99983 ?auto_99984 ) ( not ( = ?auto_99977 ?auto_99984 ) ) ( not ( = ?auto_99978 ?auto_99984 ) ) ( not ( = ?auto_99979 ?auto_99984 ) ) ( not ( = ?auto_99980 ?auto_99984 ) ) ( not ( = ?auto_99981 ?auto_99984 ) ) ( not ( = ?auto_99982 ?auto_99984 ) ) ( not ( = ?auto_99983 ?auto_99984 ) ) ( ON ?auto_99982 ?auto_99983 ) ( ON-TABLE ?auto_99984 ) ( ON ?auto_99981 ?auto_99982 ) ( ON ?auto_99980 ?auto_99981 ) ( CLEAR ?auto_99978 ) ( ON ?auto_99979 ?auto_99980 ) ( CLEAR ?auto_99979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99984 ?auto_99983 ?auto_99982 ?auto_99981 ?auto_99980 )
      ( MAKE-7PILE ?auto_99977 ?auto_99978 ?auto_99979 ?auto_99980 ?auto_99981 ?auto_99982 ?auto_99983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99985 - BLOCK
      ?auto_99986 - BLOCK
      ?auto_99987 - BLOCK
      ?auto_99988 - BLOCK
      ?auto_99989 - BLOCK
      ?auto_99990 - BLOCK
      ?auto_99991 - BLOCK
    )
    :vars
    (
      ?auto_99992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99985 ) ( not ( = ?auto_99985 ?auto_99986 ) ) ( not ( = ?auto_99985 ?auto_99987 ) ) ( not ( = ?auto_99985 ?auto_99988 ) ) ( not ( = ?auto_99985 ?auto_99989 ) ) ( not ( = ?auto_99985 ?auto_99990 ) ) ( not ( = ?auto_99985 ?auto_99991 ) ) ( not ( = ?auto_99986 ?auto_99987 ) ) ( not ( = ?auto_99986 ?auto_99988 ) ) ( not ( = ?auto_99986 ?auto_99989 ) ) ( not ( = ?auto_99986 ?auto_99990 ) ) ( not ( = ?auto_99986 ?auto_99991 ) ) ( not ( = ?auto_99987 ?auto_99988 ) ) ( not ( = ?auto_99987 ?auto_99989 ) ) ( not ( = ?auto_99987 ?auto_99990 ) ) ( not ( = ?auto_99987 ?auto_99991 ) ) ( not ( = ?auto_99988 ?auto_99989 ) ) ( not ( = ?auto_99988 ?auto_99990 ) ) ( not ( = ?auto_99988 ?auto_99991 ) ) ( not ( = ?auto_99989 ?auto_99990 ) ) ( not ( = ?auto_99989 ?auto_99991 ) ) ( not ( = ?auto_99990 ?auto_99991 ) ) ( ON ?auto_99991 ?auto_99992 ) ( not ( = ?auto_99985 ?auto_99992 ) ) ( not ( = ?auto_99986 ?auto_99992 ) ) ( not ( = ?auto_99987 ?auto_99992 ) ) ( not ( = ?auto_99988 ?auto_99992 ) ) ( not ( = ?auto_99989 ?auto_99992 ) ) ( not ( = ?auto_99990 ?auto_99992 ) ) ( not ( = ?auto_99991 ?auto_99992 ) ) ( ON ?auto_99990 ?auto_99991 ) ( ON-TABLE ?auto_99992 ) ( ON ?auto_99989 ?auto_99990 ) ( ON ?auto_99988 ?auto_99989 ) ( ON ?auto_99987 ?auto_99988 ) ( CLEAR ?auto_99987 ) ( HOLDING ?auto_99986 ) ( CLEAR ?auto_99985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99985 ?auto_99986 )
      ( MAKE-7PILE ?auto_99985 ?auto_99986 ?auto_99987 ?auto_99988 ?auto_99989 ?auto_99990 ?auto_99991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99993 - BLOCK
      ?auto_99994 - BLOCK
      ?auto_99995 - BLOCK
      ?auto_99996 - BLOCK
      ?auto_99997 - BLOCK
      ?auto_99998 - BLOCK
      ?auto_99999 - BLOCK
    )
    :vars
    (
      ?auto_100000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99993 ) ( not ( = ?auto_99993 ?auto_99994 ) ) ( not ( = ?auto_99993 ?auto_99995 ) ) ( not ( = ?auto_99993 ?auto_99996 ) ) ( not ( = ?auto_99993 ?auto_99997 ) ) ( not ( = ?auto_99993 ?auto_99998 ) ) ( not ( = ?auto_99993 ?auto_99999 ) ) ( not ( = ?auto_99994 ?auto_99995 ) ) ( not ( = ?auto_99994 ?auto_99996 ) ) ( not ( = ?auto_99994 ?auto_99997 ) ) ( not ( = ?auto_99994 ?auto_99998 ) ) ( not ( = ?auto_99994 ?auto_99999 ) ) ( not ( = ?auto_99995 ?auto_99996 ) ) ( not ( = ?auto_99995 ?auto_99997 ) ) ( not ( = ?auto_99995 ?auto_99998 ) ) ( not ( = ?auto_99995 ?auto_99999 ) ) ( not ( = ?auto_99996 ?auto_99997 ) ) ( not ( = ?auto_99996 ?auto_99998 ) ) ( not ( = ?auto_99996 ?auto_99999 ) ) ( not ( = ?auto_99997 ?auto_99998 ) ) ( not ( = ?auto_99997 ?auto_99999 ) ) ( not ( = ?auto_99998 ?auto_99999 ) ) ( ON ?auto_99999 ?auto_100000 ) ( not ( = ?auto_99993 ?auto_100000 ) ) ( not ( = ?auto_99994 ?auto_100000 ) ) ( not ( = ?auto_99995 ?auto_100000 ) ) ( not ( = ?auto_99996 ?auto_100000 ) ) ( not ( = ?auto_99997 ?auto_100000 ) ) ( not ( = ?auto_99998 ?auto_100000 ) ) ( not ( = ?auto_99999 ?auto_100000 ) ) ( ON ?auto_99998 ?auto_99999 ) ( ON-TABLE ?auto_100000 ) ( ON ?auto_99997 ?auto_99998 ) ( ON ?auto_99996 ?auto_99997 ) ( ON ?auto_99995 ?auto_99996 ) ( CLEAR ?auto_99993 ) ( ON ?auto_99994 ?auto_99995 ) ( CLEAR ?auto_99994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100000 ?auto_99999 ?auto_99998 ?auto_99997 ?auto_99996 ?auto_99995 )
      ( MAKE-7PILE ?auto_99993 ?auto_99994 ?auto_99995 ?auto_99996 ?auto_99997 ?auto_99998 ?auto_99999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100001 - BLOCK
      ?auto_100002 - BLOCK
      ?auto_100003 - BLOCK
      ?auto_100004 - BLOCK
      ?auto_100005 - BLOCK
      ?auto_100006 - BLOCK
      ?auto_100007 - BLOCK
    )
    :vars
    (
      ?auto_100008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100001 ?auto_100002 ) ) ( not ( = ?auto_100001 ?auto_100003 ) ) ( not ( = ?auto_100001 ?auto_100004 ) ) ( not ( = ?auto_100001 ?auto_100005 ) ) ( not ( = ?auto_100001 ?auto_100006 ) ) ( not ( = ?auto_100001 ?auto_100007 ) ) ( not ( = ?auto_100002 ?auto_100003 ) ) ( not ( = ?auto_100002 ?auto_100004 ) ) ( not ( = ?auto_100002 ?auto_100005 ) ) ( not ( = ?auto_100002 ?auto_100006 ) ) ( not ( = ?auto_100002 ?auto_100007 ) ) ( not ( = ?auto_100003 ?auto_100004 ) ) ( not ( = ?auto_100003 ?auto_100005 ) ) ( not ( = ?auto_100003 ?auto_100006 ) ) ( not ( = ?auto_100003 ?auto_100007 ) ) ( not ( = ?auto_100004 ?auto_100005 ) ) ( not ( = ?auto_100004 ?auto_100006 ) ) ( not ( = ?auto_100004 ?auto_100007 ) ) ( not ( = ?auto_100005 ?auto_100006 ) ) ( not ( = ?auto_100005 ?auto_100007 ) ) ( not ( = ?auto_100006 ?auto_100007 ) ) ( ON ?auto_100007 ?auto_100008 ) ( not ( = ?auto_100001 ?auto_100008 ) ) ( not ( = ?auto_100002 ?auto_100008 ) ) ( not ( = ?auto_100003 ?auto_100008 ) ) ( not ( = ?auto_100004 ?auto_100008 ) ) ( not ( = ?auto_100005 ?auto_100008 ) ) ( not ( = ?auto_100006 ?auto_100008 ) ) ( not ( = ?auto_100007 ?auto_100008 ) ) ( ON ?auto_100006 ?auto_100007 ) ( ON-TABLE ?auto_100008 ) ( ON ?auto_100005 ?auto_100006 ) ( ON ?auto_100004 ?auto_100005 ) ( ON ?auto_100003 ?auto_100004 ) ( ON ?auto_100002 ?auto_100003 ) ( CLEAR ?auto_100002 ) ( HOLDING ?auto_100001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100001 )
      ( MAKE-7PILE ?auto_100001 ?auto_100002 ?auto_100003 ?auto_100004 ?auto_100005 ?auto_100006 ?auto_100007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100009 - BLOCK
      ?auto_100010 - BLOCK
      ?auto_100011 - BLOCK
      ?auto_100012 - BLOCK
      ?auto_100013 - BLOCK
      ?auto_100014 - BLOCK
      ?auto_100015 - BLOCK
    )
    :vars
    (
      ?auto_100016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100009 ?auto_100010 ) ) ( not ( = ?auto_100009 ?auto_100011 ) ) ( not ( = ?auto_100009 ?auto_100012 ) ) ( not ( = ?auto_100009 ?auto_100013 ) ) ( not ( = ?auto_100009 ?auto_100014 ) ) ( not ( = ?auto_100009 ?auto_100015 ) ) ( not ( = ?auto_100010 ?auto_100011 ) ) ( not ( = ?auto_100010 ?auto_100012 ) ) ( not ( = ?auto_100010 ?auto_100013 ) ) ( not ( = ?auto_100010 ?auto_100014 ) ) ( not ( = ?auto_100010 ?auto_100015 ) ) ( not ( = ?auto_100011 ?auto_100012 ) ) ( not ( = ?auto_100011 ?auto_100013 ) ) ( not ( = ?auto_100011 ?auto_100014 ) ) ( not ( = ?auto_100011 ?auto_100015 ) ) ( not ( = ?auto_100012 ?auto_100013 ) ) ( not ( = ?auto_100012 ?auto_100014 ) ) ( not ( = ?auto_100012 ?auto_100015 ) ) ( not ( = ?auto_100013 ?auto_100014 ) ) ( not ( = ?auto_100013 ?auto_100015 ) ) ( not ( = ?auto_100014 ?auto_100015 ) ) ( ON ?auto_100015 ?auto_100016 ) ( not ( = ?auto_100009 ?auto_100016 ) ) ( not ( = ?auto_100010 ?auto_100016 ) ) ( not ( = ?auto_100011 ?auto_100016 ) ) ( not ( = ?auto_100012 ?auto_100016 ) ) ( not ( = ?auto_100013 ?auto_100016 ) ) ( not ( = ?auto_100014 ?auto_100016 ) ) ( not ( = ?auto_100015 ?auto_100016 ) ) ( ON ?auto_100014 ?auto_100015 ) ( ON-TABLE ?auto_100016 ) ( ON ?auto_100013 ?auto_100014 ) ( ON ?auto_100012 ?auto_100013 ) ( ON ?auto_100011 ?auto_100012 ) ( ON ?auto_100010 ?auto_100011 ) ( ON ?auto_100009 ?auto_100010 ) ( CLEAR ?auto_100009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100016 ?auto_100015 ?auto_100014 ?auto_100013 ?auto_100012 ?auto_100011 ?auto_100010 )
      ( MAKE-7PILE ?auto_100009 ?auto_100010 ?auto_100011 ?auto_100012 ?auto_100013 ?auto_100014 ?auto_100015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100123 - BLOCK
    )
    :vars
    (
      ?auto_100124 - BLOCK
      ?auto_100125 - BLOCK
      ?auto_100126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100123 ?auto_100124 ) ( CLEAR ?auto_100123 ) ( not ( = ?auto_100123 ?auto_100124 ) ) ( HOLDING ?auto_100125 ) ( CLEAR ?auto_100126 ) ( not ( = ?auto_100123 ?auto_100125 ) ) ( not ( = ?auto_100123 ?auto_100126 ) ) ( not ( = ?auto_100124 ?auto_100125 ) ) ( not ( = ?auto_100124 ?auto_100126 ) ) ( not ( = ?auto_100125 ?auto_100126 ) ) )
    :subtasks
    ( ( !STACK ?auto_100125 ?auto_100126 )
      ( MAKE-1PILE ?auto_100123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100127 - BLOCK
    )
    :vars
    (
      ?auto_100129 - BLOCK
      ?auto_100130 - BLOCK
      ?auto_100128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100127 ?auto_100129 ) ( not ( = ?auto_100127 ?auto_100129 ) ) ( CLEAR ?auto_100130 ) ( not ( = ?auto_100127 ?auto_100128 ) ) ( not ( = ?auto_100127 ?auto_100130 ) ) ( not ( = ?auto_100129 ?auto_100128 ) ) ( not ( = ?auto_100129 ?auto_100130 ) ) ( not ( = ?auto_100128 ?auto_100130 ) ) ( ON ?auto_100128 ?auto_100127 ) ( CLEAR ?auto_100128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100129 ?auto_100127 )
      ( MAKE-1PILE ?auto_100127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100131 - BLOCK
    )
    :vars
    (
      ?auto_100133 - BLOCK
      ?auto_100132 - BLOCK
      ?auto_100134 - BLOCK
      ?auto_100137 - BLOCK
      ?auto_100136 - BLOCK
      ?auto_100138 - BLOCK
      ?auto_100135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100131 ?auto_100133 ) ( not ( = ?auto_100131 ?auto_100133 ) ) ( not ( = ?auto_100131 ?auto_100132 ) ) ( not ( = ?auto_100131 ?auto_100134 ) ) ( not ( = ?auto_100133 ?auto_100132 ) ) ( not ( = ?auto_100133 ?auto_100134 ) ) ( not ( = ?auto_100132 ?auto_100134 ) ) ( ON ?auto_100132 ?auto_100131 ) ( CLEAR ?auto_100132 ) ( ON-TABLE ?auto_100133 ) ( HOLDING ?auto_100134 ) ( CLEAR ?auto_100137 ) ( ON-TABLE ?auto_100136 ) ( ON ?auto_100138 ?auto_100136 ) ( ON ?auto_100135 ?auto_100138 ) ( ON ?auto_100137 ?auto_100135 ) ( not ( = ?auto_100136 ?auto_100138 ) ) ( not ( = ?auto_100136 ?auto_100135 ) ) ( not ( = ?auto_100136 ?auto_100137 ) ) ( not ( = ?auto_100136 ?auto_100134 ) ) ( not ( = ?auto_100138 ?auto_100135 ) ) ( not ( = ?auto_100138 ?auto_100137 ) ) ( not ( = ?auto_100138 ?auto_100134 ) ) ( not ( = ?auto_100135 ?auto_100137 ) ) ( not ( = ?auto_100135 ?auto_100134 ) ) ( not ( = ?auto_100137 ?auto_100134 ) ) ( not ( = ?auto_100131 ?auto_100137 ) ) ( not ( = ?auto_100131 ?auto_100136 ) ) ( not ( = ?auto_100131 ?auto_100138 ) ) ( not ( = ?auto_100131 ?auto_100135 ) ) ( not ( = ?auto_100133 ?auto_100137 ) ) ( not ( = ?auto_100133 ?auto_100136 ) ) ( not ( = ?auto_100133 ?auto_100138 ) ) ( not ( = ?auto_100133 ?auto_100135 ) ) ( not ( = ?auto_100132 ?auto_100137 ) ) ( not ( = ?auto_100132 ?auto_100136 ) ) ( not ( = ?auto_100132 ?auto_100138 ) ) ( not ( = ?auto_100132 ?auto_100135 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100136 ?auto_100138 ?auto_100135 ?auto_100137 ?auto_100134 )
      ( MAKE-1PILE ?auto_100131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100139 - BLOCK
    )
    :vars
    (
      ?auto_100145 - BLOCK
      ?auto_100140 - BLOCK
      ?auto_100143 - BLOCK
      ?auto_100141 - BLOCK
      ?auto_100144 - BLOCK
      ?auto_100146 - BLOCK
      ?auto_100142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100139 ?auto_100145 ) ( not ( = ?auto_100139 ?auto_100145 ) ) ( not ( = ?auto_100139 ?auto_100140 ) ) ( not ( = ?auto_100139 ?auto_100143 ) ) ( not ( = ?auto_100145 ?auto_100140 ) ) ( not ( = ?auto_100145 ?auto_100143 ) ) ( not ( = ?auto_100140 ?auto_100143 ) ) ( ON ?auto_100140 ?auto_100139 ) ( ON-TABLE ?auto_100145 ) ( CLEAR ?auto_100141 ) ( ON-TABLE ?auto_100144 ) ( ON ?auto_100146 ?auto_100144 ) ( ON ?auto_100142 ?auto_100146 ) ( ON ?auto_100141 ?auto_100142 ) ( not ( = ?auto_100144 ?auto_100146 ) ) ( not ( = ?auto_100144 ?auto_100142 ) ) ( not ( = ?auto_100144 ?auto_100141 ) ) ( not ( = ?auto_100144 ?auto_100143 ) ) ( not ( = ?auto_100146 ?auto_100142 ) ) ( not ( = ?auto_100146 ?auto_100141 ) ) ( not ( = ?auto_100146 ?auto_100143 ) ) ( not ( = ?auto_100142 ?auto_100141 ) ) ( not ( = ?auto_100142 ?auto_100143 ) ) ( not ( = ?auto_100141 ?auto_100143 ) ) ( not ( = ?auto_100139 ?auto_100141 ) ) ( not ( = ?auto_100139 ?auto_100144 ) ) ( not ( = ?auto_100139 ?auto_100146 ) ) ( not ( = ?auto_100139 ?auto_100142 ) ) ( not ( = ?auto_100145 ?auto_100141 ) ) ( not ( = ?auto_100145 ?auto_100144 ) ) ( not ( = ?auto_100145 ?auto_100146 ) ) ( not ( = ?auto_100145 ?auto_100142 ) ) ( not ( = ?auto_100140 ?auto_100141 ) ) ( not ( = ?auto_100140 ?auto_100144 ) ) ( not ( = ?auto_100140 ?auto_100146 ) ) ( not ( = ?auto_100140 ?auto_100142 ) ) ( ON ?auto_100143 ?auto_100140 ) ( CLEAR ?auto_100143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100145 ?auto_100139 ?auto_100140 )
      ( MAKE-1PILE ?auto_100139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100147 - BLOCK
    )
    :vars
    (
      ?auto_100154 - BLOCK
      ?auto_100153 - BLOCK
      ?auto_100148 - BLOCK
      ?auto_100152 - BLOCK
      ?auto_100150 - BLOCK
      ?auto_100151 - BLOCK
      ?auto_100149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100147 ?auto_100154 ) ( not ( = ?auto_100147 ?auto_100154 ) ) ( not ( = ?auto_100147 ?auto_100153 ) ) ( not ( = ?auto_100147 ?auto_100148 ) ) ( not ( = ?auto_100154 ?auto_100153 ) ) ( not ( = ?auto_100154 ?auto_100148 ) ) ( not ( = ?auto_100153 ?auto_100148 ) ) ( ON ?auto_100153 ?auto_100147 ) ( ON-TABLE ?auto_100154 ) ( ON-TABLE ?auto_100152 ) ( ON ?auto_100150 ?auto_100152 ) ( ON ?auto_100151 ?auto_100150 ) ( not ( = ?auto_100152 ?auto_100150 ) ) ( not ( = ?auto_100152 ?auto_100151 ) ) ( not ( = ?auto_100152 ?auto_100149 ) ) ( not ( = ?auto_100152 ?auto_100148 ) ) ( not ( = ?auto_100150 ?auto_100151 ) ) ( not ( = ?auto_100150 ?auto_100149 ) ) ( not ( = ?auto_100150 ?auto_100148 ) ) ( not ( = ?auto_100151 ?auto_100149 ) ) ( not ( = ?auto_100151 ?auto_100148 ) ) ( not ( = ?auto_100149 ?auto_100148 ) ) ( not ( = ?auto_100147 ?auto_100149 ) ) ( not ( = ?auto_100147 ?auto_100152 ) ) ( not ( = ?auto_100147 ?auto_100150 ) ) ( not ( = ?auto_100147 ?auto_100151 ) ) ( not ( = ?auto_100154 ?auto_100149 ) ) ( not ( = ?auto_100154 ?auto_100152 ) ) ( not ( = ?auto_100154 ?auto_100150 ) ) ( not ( = ?auto_100154 ?auto_100151 ) ) ( not ( = ?auto_100153 ?auto_100149 ) ) ( not ( = ?auto_100153 ?auto_100152 ) ) ( not ( = ?auto_100153 ?auto_100150 ) ) ( not ( = ?auto_100153 ?auto_100151 ) ) ( ON ?auto_100148 ?auto_100153 ) ( CLEAR ?auto_100148 ) ( HOLDING ?auto_100149 ) ( CLEAR ?auto_100151 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100152 ?auto_100150 ?auto_100151 ?auto_100149 )
      ( MAKE-1PILE ?auto_100147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100155 - BLOCK
    )
    :vars
    (
      ?auto_100158 - BLOCK
      ?auto_100159 - BLOCK
      ?auto_100161 - BLOCK
      ?auto_100156 - BLOCK
      ?auto_100157 - BLOCK
      ?auto_100162 - BLOCK
      ?auto_100160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100155 ?auto_100158 ) ( not ( = ?auto_100155 ?auto_100158 ) ) ( not ( = ?auto_100155 ?auto_100159 ) ) ( not ( = ?auto_100155 ?auto_100161 ) ) ( not ( = ?auto_100158 ?auto_100159 ) ) ( not ( = ?auto_100158 ?auto_100161 ) ) ( not ( = ?auto_100159 ?auto_100161 ) ) ( ON ?auto_100159 ?auto_100155 ) ( ON-TABLE ?auto_100158 ) ( ON-TABLE ?auto_100156 ) ( ON ?auto_100157 ?auto_100156 ) ( ON ?auto_100162 ?auto_100157 ) ( not ( = ?auto_100156 ?auto_100157 ) ) ( not ( = ?auto_100156 ?auto_100162 ) ) ( not ( = ?auto_100156 ?auto_100160 ) ) ( not ( = ?auto_100156 ?auto_100161 ) ) ( not ( = ?auto_100157 ?auto_100162 ) ) ( not ( = ?auto_100157 ?auto_100160 ) ) ( not ( = ?auto_100157 ?auto_100161 ) ) ( not ( = ?auto_100162 ?auto_100160 ) ) ( not ( = ?auto_100162 ?auto_100161 ) ) ( not ( = ?auto_100160 ?auto_100161 ) ) ( not ( = ?auto_100155 ?auto_100160 ) ) ( not ( = ?auto_100155 ?auto_100156 ) ) ( not ( = ?auto_100155 ?auto_100157 ) ) ( not ( = ?auto_100155 ?auto_100162 ) ) ( not ( = ?auto_100158 ?auto_100160 ) ) ( not ( = ?auto_100158 ?auto_100156 ) ) ( not ( = ?auto_100158 ?auto_100157 ) ) ( not ( = ?auto_100158 ?auto_100162 ) ) ( not ( = ?auto_100159 ?auto_100160 ) ) ( not ( = ?auto_100159 ?auto_100156 ) ) ( not ( = ?auto_100159 ?auto_100157 ) ) ( not ( = ?auto_100159 ?auto_100162 ) ) ( ON ?auto_100161 ?auto_100159 ) ( CLEAR ?auto_100162 ) ( ON ?auto_100160 ?auto_100161 ) ( CLEAR ?auto_100160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100158 ?auto_100155 ?auto_100159 ?auto_100161 )
      ( MAKE-1PILE ?auto_100155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100163 - BLOCK
    )
    :vars
    (
      ?auto_100169 - BLOCK
      ?auto_100165 - BLOCK
      ?auto_100167 - BLOCK
      ?auto_100164 - BLOCK
      ?auto_100168 - BLOCK
      ?auto_100170 - BLOCK
      ?auto_100166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100163 ?auto_100169 ) ( not ( = ?auto_100163 ?auto_100169 ) ) ( not ( = ?auto_100163 ?auto_100165 ) ) ( not ( = ?auto_100163 ?auto_100167 ) ) ( not ( = ?auto_100169 ?auto_100165 ) ) ( not ( = ?auto_100169 ?auto_100167 ) ) ( not ( = ?auto_100165 ?auto_100167 ) ) ( ON ?auto_100165 ?auto_100163 ) ( ON-TABLE ?auto_100169 ) ( ON-TABLE ?auto_100164 ) ( ON ?auto_100168 ?auto_100164 ) ( not ( = ?auto_100164 ?auto_100168 ) ) ( not ( = ?auto_100164 ?auto_100170 ) ) ( not ( = ?auto_100164 ?auto_100166 ) ) ( not ( = ?auto_100164 ?auto_100167 ) ) ( not ( = ?auto_100168 ?auto_100170 ) ) ( not ( = ?auto_100168 ?auto_100166 ) ) ( not ( = ?auto_100168 ?auto_100167 ) ) ( not ( = ?auto_100170 ?auto_100166 ) ) ( not ( = ?auto_100170 ?auto_100167 ) ) ( not ( = ?auto_100166 ?auto_100167 ) ) ( not ( = ?auto_100163 ?auto_100166 ) ) ( not ( = ?auto_100163 ?auto_100164 ) ) ( not ( = ?auto_100163 ?auto_100168 ) ) ( not ( = ?auto_100163 ?auto_100170 ) ) ( not ( = ?auto_100169 ?auto_100166 ) ) ( not ( = ?auto_100169 ?auto_100164 ) ) ( not ( = ?auto_100169 ?auto_100168 ) ) ( not ( = ?auto_100169 ?auto_100170 ) ) ( not ( = ?auto_100165 ?auto_100166 ) ) ( not ( = ?auto_100165 ?auto_100164 ) ) ( not ( = ?auto_100165 ?auto_100168 ) ) ( not ( = ?auto_100165 ?auto_100170 ) ) ( ON ?auto_100167 ?auto_100165 ) ( ON ?auto_100166 ?auto_100167 ) ( CLEAR ?auto_100166 ) ( HOLDING ?auto_100170 ) ( CLEAR ?auto_100168 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100164 ?auto_100168 ?auto_100170 )
      ( MAKE-1PILE ?auto_100163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100171 - BLOCK
    )
    :vars
    (
      ?auto_100173 - BLOCK
      ?auto_100172 - BLOCK
      ?auto_100176 - BLOCK
      ?auto_100178 - BLOCK
      ?auto_100175 - BLOCK
      ?auto_100177 - BLOCK
      ?auto_100174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100171 ?auto_100173 ) ( not ( = ?auto_100171 ?auto_100173 ) ) ( not ( = ?auto_100171 ?auto_100172 ) ) ( not ( = ?auto_100171 ?auto_100176 ) ) ( not ( = ?auto_100173 ?auto_100172 ) ) ( not ( = ?auto_100173 ?auto_100176 ) ) ( not ( = ?auto_100172 ?auto_100176 ) ) ( ON ?auto_100172 ?auto_100171 ) ( ON-TABLE ?auto_100173 ) ( ON-TABLE ?auto_100178 ) ( ON ?auto_100175 ?auto_100178 ) ( not ( = ?auto_100178 ?auto_100175 ) ) ( not ( = ?auto_100178 ?auto_100177 ) ) ( not ( = ?auto_100178 ?auto_100174 ) ) ( not ( = ?auto_100178 ?auto_100176 ) ) ( not ( = ?auto_100175 ?auto_100177 ) ) ( not ( = ?auto_100175 ?auto_100174 ) ) ( not ( = ?auto_100175 ?auto_100176 ) ) ( not ( = ?auto_100177 ?auto_100174 ) ) ( not ( = ?auto_100177 ?auto_100176 ) ) ( not ( = ?auto_100174 ?auto_100176 ) ) ( not ( = ?auto_100171 ?auto_100174 ) ) ( not ( = ?auto_100171 ?auto_100178 ) ) ( not ( = ?auto_100171 ?auto_100175 ) ) ( not ( = ?auto_100171 ?auto_100177 ) ) ( not ( = ?auto_100173 ?auto_100174 ) ) ( not ( = ?auto_100173 ?auto_100178 ) ) ( not ( = ?auto_100173 ?auto_100175 ) ) ( not ( = ?auto_100173 ?auto_100177 ) ) ( not ( = ?auto_100172 ?auto_100174 ) ) ( not ( = ?auto_100172 ?auto_100178 ) ) ( not ( = ?auto_100172 ?auto_100175 ) ) ( not ( = ?auto_100172 ?auto_100177 ) ) ( ON ?auto_100176 ?auto_100172 ) ( ON ?auto_100174 ?auto_100176 ) ( CLEAR ?auto_100175 ) ( ON ?auto_100177 ?auto_100174 ) ( CLEAR ?auto_100177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100173 ?auto_100171 ?auto_100172 ?auto_100176 ?auto_100174 )
      ( MAKE-1PILE ?auto_100171 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100179 - BLOCK
    )
    :vars
    (
      ?auto_100186 - BLOCK
      ?auto_100184 - BLOCK
      ?auto_100182 - BLOCK
      ?auto_100183 - BLOCK
      ?auto_100180 - BLOCK
      ?auto_100181 - BLOCK
      ?auto_100185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100179 ?auto_100186 ) ( not ( = ?auto_100179 ?auto_100186 ) ) ( not ( = ?auto_100179 ?auto_100184 ) ) ( not ( = ?auto_100179 ?auto_100182 ) ) ( not ( = ?auto_100186 ?auto_100184 ) ) ( not ( = ?auto_100186 ?auto_100182 ) ) ( not ( = ?auto_100184 ?auto_100182 ) ) ( ON ?auto_100184 ?auto_100179 ) ( ON-TABLE ?auto_100186 ) ( ON-TABLE ?auto_100183 ) ( not ( = ?auto_100183 ?auto_100180 ) ) ( not ( = ?auto_100183 ?auto_100181 ) ) ( not ( = ?auto_100183 ?auto_100185 ) ) ( not ( = ?auto_100183 ?auto_100182 ) ) ( not ( = ?auto_100180 ?auto_100181 ) ) ( not ( = ?auto_100180 ?auto_100185 ) ) ( not ( = ?auto_100180 ?auto_100182 ) ) ( not ( = ?auto_100181 ?auto_100185 ) ) ( not ( = ?auto_100181 ?auto_100182 ) ) ( not ( = ?auto_100185 ?auto_100182 ) ) ( not ( = ?auto_100179 ?auto_100185 ) ) ( not ( = ?auto_100179 ?auto_100183 ) ) ( not ( = ?auto_100179 ?auto_100180 ) ) ( not ( = ?auto_100179 ?auto_100181 ) ) ( not ( = ?auto_100186 ?auto_100185 ) ) ( not ( = ?auto_100186 ?auto_100183 ) ) ( not ( = ?auto_100186 ?auto_100180 ) ) ( not ( = ?auto_100186 ?auto_100181 ) ) ( not ( = ?auto_100184 ?auto_100185 ) ) ( not ( = ?auto_100184 ?auto_100183 ) ) ( not ( = ?auto_100184 ?auto_100180 ) ) ( not ( = ?auto_100184 ?auto_100181 ) ) ( ON ?auto_100182 ?auto_100184 ) ( ON ?auto_100185 ?auto_100182 ) ( ON ?auto_100181 ?auto_100185 ) ( CLEAR ?auto_100181 ) ( HOLDING ?auto_100180 ) ( CLEAR ?auto_100183 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100183 ?auto_100180 )
      ( MAKE-1PILE ?auto_100179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100187 - BLOCK
    )
    :vars
    (
      ?auto_100188 - BLOCK
      ?auto_100192 - BLOCK
      ?auto_100193 - BLOCK
      ?auto_100194 - BLOCK
      ?auto_100191 - BLOCK
      ?auto_100190 - BLOCK
      ?auto_100189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100187 ?auto_100188 ) ( not ( = ?auto_100187 ?auto_100188 ) ) ( not ( = ?auto_100187 ?auto_100192 ) ) ( not ( = ?auto_100187 ?auto_100193 ) ) ( not ( = ?auto_100188 ?auto_100192 ) ) ( not ( = ?auto_100188 ?auto_100193 ) ) ( not ( = ?auto_100192 ?auto_100193 ) ) ( ON ?auto_100192 ?auto_100187 ) ( ON-TABLE ?auto_100188 ) ( ON-TABLE ?auto_100194 ) ( not ( = ?auto_100194 ?auto_100191 ) ) ( not ( = ?auto_100194 ?auto_100190 ) ) ( not ( = ?auto_100194 ?auto_100189 ) ) ( not ( = ?auto_100194 ?auto_100193 ) ) ( not ( = ?auto_100191 ?auto_100190 ) ) ( not ( = ?auto_100191 ?auto_100189 ) ) ( not ( = ?auto_100191 ?auto_100193 ) ) ( not ( = ?auto_100190 ?auto_100189 ) ) ( not ( = ?auto_100190 ?auto_100193 ) ) ( not ( = ?auto_100189 ?auto_100193 ) ) ( not ( = ?auto_100187 ?auto_100189 ) ) ( not ( = ?auto_100187 ?auto_100194 ) ) ( not ( = ?auto_100187 ?auto_100191 ) ) ( not ( = ?auto_100187 ?auto_100190 ) ) ( not ( = ?auto_100188 ?auto_100189 ) ) ( not ( = ?auto_100188 ?auto_100194 ) ) ( not ( = ?auto_100188 ?auto_100191 ) ) ( not ( = ?auto_100188 ?auto_100190 ) ) ( not ( = ?auto_100192 ?auto_100189 ) ) ( not ( = ?auto_100192 ?auto_100194 ) ) ( not ( = ?auto_100192 ?auto_100191 ) ) ( not ( = ?auto_100192 ?auto_100190 ) ) ( ON ?auto_100193 ?auto_100192 ) ( ON ?auto_100189 ?auto_100193 ) ( ON ?auto_100190 ?auto_100189 ) ( CLEAR ?auto_100194 ) ( ON ?auto_100191 ?auto_100190 ) ( CLEAR ?auto_100191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100188 ?auto_100187 ?auto_100192 ?auto_100193 ?auto_100189 ?auto_100190 )
      ( MAKE-1PILE ?auto_100187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100195 - BLOCK
    )
    :vars
    (
      ?auto_100196 - BLOCK
      ?auto_100200 - BLOCK
      ?auto_100202 - BLOCK
      ?auto_100197 - BLOCK
      ?auto_100198 - BLOCK
      ?auto_100199 - BLOCK
      ?auto_100201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100195 ?auto_100196 ) ( not ( = ?auto_100195 ?auto_100196 ) ) ( not ( = ?auto_100195 ?auto_100200 ) ) ( not ( = ?auto_100195 ?auto_100202 ) ) ( not ( = ?auto_100196 ?auto_100200 ) ) ( not ( = ?auto_100196 ?auto_100202 ) ) ( not ( = ?auto_100200 ?auto_100202 ) ) ( ON ?auto_100200 ?auto_100195 ) ( ON-TABLE ?auto_100196 ) ( not ( = ?auto_100197 ?auto_100198 ) ) ( not ( = ?auto_100197 ?auto_100199 ) ) ( not ( = ?auto_100197 ?auto_100201 ) ) ( not ( = ?auto_100197 ?auto_100202 ) ) ( not ( = ?auto_100198 ?auto_100199 ) ) ( not ( = ?auto_100198 ?auto_100201 ) ) ( not ( = ?auto_100198 ?auto_100202 ) ) ( not ( = ?auto_100199 ?auto_100201 ) ) ( not ( = ?auto_100199 ?auto_100202 ) ) ( not ( = ?auto_100201 ?auto_100202 ) ) ( not ( = ?auto_100195 ?auto_100201 ) ) ( not ( = ?auto_100195 ?auto_100197 ) ) ( not ( = ?auto_100195 ?auto_100198 ) ) ( not ( = ?auto_100195 ?auto_100199 ) ) ( not ( = ?auto_100196 ?auto_100201 ) ) ( not ( = ?auto_100196 ?auto_100197 ) ) ( not ( = ?auto_100196 ?auto_100198 ) ) ( not ( = ?auto_100196 ?auto_100199 ) ) ( not ( = ?auto_100200 ?auto_100201 ) ) ( not ( = ?auto_100200 ?auto_100197 ) ) ( not ( = ?auto_100200 ?auto_100198 ) ) ( not ( = ?auto_100200 ?auto_100199 ) ) ( ON ?auto_100202 ?auto_100200 ) ( ON ?auto_100201 ?auto_100202 ) ( ON ?auto_100199 ?auto_100201 ) ( ON ?auto_100198 ?auto_100199 ) ( CLEAR ?auto_100198 ) ( HOLDING ?auto_100197 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100197 )
      ( MAKE-1PILE ?auto_100195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100203 - BLOCK
    )
    :vars
    (
      ?auto_100210 - BLOCK
      ?auto_100204 - BLOCK
      ?auto_100206 - BLOCK
      ?auto_100209 - BLOCK
      ?auto_100207 - BLOCK
      ?auto_100208 - BLOCK
      ?auto_100205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100203 ?auto_100210 ) ( not ( = ?auto_100203 ?auto_100210 ) ) ( not ( = ?auto_100203 ?auto_100204 ) ) ( not ( = ?auto_100203 ?auto_100206 ) ) ( not ( = ?auto_100210 ?auto_100204 ) ) ( not ( = ?auto_100210 ?auto_100206 ) ) ( not ( = ?auto_100204 ?auto_100206 ) ) ( ON ?auto_100204 ?auto_100203 ) ( ON-TABLE ?auto_100210 ) ( not ( = ?auto_100209 ?auto_100207 ) ) ( not ( = ?auto_100209 ?auto_100208 ) ) ( not ( = ?auto_100209 ?auto_100205 ) ) ( not ( = ?auto_100209 ?auto_100206 ) ) ( not ( = ?auto_100207 ?auto_100208 ) ) ( not ( = ?auto_100207 ?auto_100205 ) ) ( not ( = ?auto_100207 ?auto_100206 ) ) ( not ( = ?auto_100208 ?auto_100205 ) ) ( not ( = ?auto_100208 ?auto_100206 ) ) ( not ( = ?auto_100205 ?auto_100206 ) ) ( not ( = ?auto_100203 ?auto_100205 ) ) ( not ( = ?auto_100203 ?auto_100209 ) ) ( not ( = ?auto_100203 ?auto_100207 ) ) ( not ( = ?auto_100203 ?auto_100208 ) ) ( not ( = ?auto_100210 ?auto_100205 ) ) ( not ( = ?auto_100210 ?auto_100209 ) ) ( not ( = ?auto_100210 ?auto_100207 ) ) ( not ( = ?auto_100210 ?auto_100208 ) ) ( not ( = ?auto_100204 ?auto_100205 ) ) ( not ( = ?auto_100204 ?auto_100209 ) ) ( not ( = ?auto_100204 ?auto_100207 ) ) ( not ( = ?auto_100204 ?auto_100208 ) ) ( ON ?auto_100206 ?auto_100204 ) ( ON ?auto_100205 ?auto_100206 ) ( ON ?auto_100208 ?auto_100205 ) ( ON ?auto_100207 ?auto_100208 ) ( ON ?auto_100209 ?auto_100207 ) ( CLEAR ?auto_100209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100210 ?auto_100203 ?auto_100204 ?auto_100206 ?auto_100205 ?auto_100208 ?auto_100207 )
      ( MAKE-1PILE ?auto_100203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100222 - BLOCK
      ?auto_100223 - BLOCK
      ?auto_100224 - BLOCK
      ?auto_100225 - BLOCK
      ?auto_100226 - BLOCK
    )
    :vars
    (
      ?auto_100227 - BLOCK
      ?auto_100228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100227 ?auto_100226 ) ( CLEAR ?auto_100227 ) ( ON-TABLE ?auto_100222 ) ( ON ?auto_100223 ?auto_100222 ) ( ON ?auto_100224 ?auto_100223 ) ( ON ?auto_100225 ?auto_100224 ) ( ON ?auto_100226 ?auto_100225 ) ( not ( = ?auto_100222 ?auto_100223 ) ) ( not ( = ?auto_100222 ?auto_100224 ) ) ( not ( = ?auto_100222 ?auto_100225 ) ) ( not ( = ?auto_100222 ?auto_100226 ) ) ( not ( = ?auto_100222 ?auto_100227 ) ) ( not ( = ?auto_100223 ?auto_100224 ) ) ( not ( = ?auto_100223 ?auto_100225 ) ) ( not ( = ?auto_100223 ?auto_100226 ) ) ( not ( = ?auto_100223 ?auto_100227 ) ) ( not ( = ?auto_100224 ?auto_100225 ) ) ( not ( = ?auto_100224 ?auto_100226 ) ) ( not ( = ?auto_100224 ?auto_100227 ) ) ( not ( = ?auto_100225 ?auto_100226 ) ) ( not ( = ?auto_100225 ?auto_100227 ) ) ( not ( = ?auto_100226 ?auto_100227 ) ) ( HOLDING ?auto_100228 ) ( not ( = ?auto_100222 ?auto_100228 ) ) ( not ( = ?auto_100223 ?auto_100228 ) ) ( not ( = ?auto_100224 ?auto_100228 ) ) ( not ( = ?auto_100225 ?auto_100228 ) ) ( not ( = ?auto_100226 ?auto_100228 ) ) ( not ( = ?auto_100227 ?auto_100228 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_100228 )
      ( MAKE-5PILE ?auto_100222 ?auto_100223 ?auto_100224 ?auto_100225 ?auto_100226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100319 - BLOCK
      ?auto_100320 - BLOCK
    )
    :vars
    (
      ?auto_100321 - BLOCK
      ?auto_100323 - BLOCK
      ?auto_100325 - BLOCK
      ?auto_100322 - BLOCK
      ?auto_100324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100319 ?auto_100320 ) ) ( ON ?auto_100320 ?auto_100321 ) ( not ( = ?auto_100319 ?auto_100321 ) ) ( not ( = ?auto_100320 ?auto_100321 ) ) ( ON ?auto_100319 ?auto_100320 ) ( CLEAR ?auto_100319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100323 ) ( ON ?auto_100325 ?auto_100323 ) ( ON ?auto_100322 ?auto_100325 ) ( ON ?auto_100324 ?auto_100322 ) ( ON ?auto_100321 ?auto_100324 ) ( not ( = ?auto_100323 ?auto_100325 ) ) ( not ( = ?auto_100323 ?auto_100322 ) ) ( not ( = ?auto_100323 ?auto_100324 ) ) ( not ( = ?auto_100323 ?auto_100321 ) ) ( not ( = ?auto_100323 ?auto_100320 ) ) ( not ( = ?auto_100323 ?auto_100319 ) ) ( not ( = ?auto_100325 ?auto_100322 ) ) ( not ( = ?auto_100325 ?auto_100324 ) ) ( not ( = ?auto_100325 ?auto_100321 ) ) ( not ( = ?auto_100325 ?auto_100320 ) ) ( not ( = ?auto_100325 ?auto_100319 ) ) ( not ( = ?auto_100322 ?auto_100324 ) ) ( not ( = ?auto_100322 ?auto_100321 ) ) ( not ( = ?auto_100322 ?auto_100320 ) ) ( not ( = ?auto_100322 ?auto_100319 ) ) ( not ( = ?auto_100324 ?auto_100321 ) ) ( not ( = ?auto_100324 ?auto_100320 ) ) ( not ( = ?auto_100324 ?auto_100319 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100323 ?auto_100325 ?auto_100322 ?auto_100324 ?auto_100321 ?auto_100320 )
      ( MAKE-2PILE ?auto_100319 ?auto_100320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100328 - BLOCK
      ?auto_100329 - BLOCK
    )
    :vars
    (
      ?auto_100330 - BLOCK
      ?auto_100331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100328 ?auto_100329 ) ) ( ON ?auto_100329 ?auto_100330 ) ( CLEAR ?auto_100329 ) ( not ( = ?auto_100328 ?auto_100330 ) ) ( not ( = ?auto_100329 ?auto_100330 ) ) ( ON ?auto_100328 ?auto_100331 ) ( CLEAR ?auto_100328 ) ( HAND-EMPTY ) ( not ( = ?auto_100328 ?auto_100331 ) ) ( not ( = ?auto_100329 ?auto_100331 ) ) ( not ( = ?auto_100330 ?auto_100331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100328 ?auto_100331 )
      ( MAKE-2PILE ?auto_100328 ?auto_100329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100332 - BLOCK
      ?auto_100333 - BLOCK
    )
    :vars
    (
      ?auto_100334 - BLOCK
      ?auto_100335 - BLOCK
      ?auto_100338 - BLOCK
      ?auto_100337 - BLOCK
      ?auto_100339 - BLOCK
      ?auto_100336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100332 ?auto_100333 ) ) ( not ( = ?auto_100332 ?auto_100334 ) ) ( not ( = ?auto_100333 ?auto_100334 ) ) ( ON ?auto_100332 ?auto_100335 ) ( CLEAR ?auto_100332 ) ( not ( = ?auto_100332 ?auto_100335 ) ) ( not ( = ?auto_100333 ?auto_100335 ) ) ( not ( = ?auto_100334 ?auto_100335 ) ) ( HOLDING ?auto_100333 ) ( CLEAR ?auto_100334 ) ( ON-TABLE ?auto_100338 ) ( ON ?auto_100337 ?auto_100338 ) ( ON ?auto_100339 ?auto_100337 ) ( ON ?auto_100336 ?auto_100339 ) ( ON ?auto_100334 ?auto_100336 ) ( not ( = ?auto_100338 ?auto_100337 ) ) ( not ( = ?auto_100338 ?auto_100339 ) ) ( not ( = ?auto_100338 ?auto_100336 ) ) ( not ( = ?auto_100338 ?auto_100334 ) ) ( not ( = ?auto_100338 ?auto_100333 ) ) ( not ( = ?auto_100337 ?auto_100339 ) ) ( not ( = ?auto_100337 ?auto_100336 ) ) ( not ( = ?auto_100337 ?auto_100334 ) ) ( not ( = ?auto_100337 ?auto_100333 ) ) ( not ( = ?auto_100339 ?auto_100336 ) ) ( not ( = ?auto_100339 ?auto_100334 ) ) ( not ( = ?auto_100339 ?auto_100333 ) ) ( not ( = ?auto_100336 ?auto_100334 ) ) ( not ( = ?auto_100336 ?auto_100333 ) ) ( not ( = ?auto_100332 ?auto_100338 ) ) ( not ( = ?auto_100332 ?auto_100337 ) ) ( not ( = ?auto_100332 ?auto_100339 ) ) ( not ( = ?auto_100332 ?auto_100336 ) ) ( not ( = ?auto_100335 ?auto_100338 ) ) ( not ( = ?auto_100335 ?auto_100337 ) ) ( not ( = ?auto_100335 ?auto_100339 ) ) ( not ( = ?auto_100335 ?auto_100336 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100338 ?auto_100337 ?auto_100339 ?auto_100336 ?auto_100334 ?auto_100333 )
      ( MAKE-2PILE ?auto_100332 ?auto_100333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100340 - BLOCK
      ?auto_100341 - BLOCK
    )
    :vars
    (
      ?auto_100344 - BLOCK
      ?auto_100345 - BLOCK
      ?auto_100346 - BLOCK
      ?auto_100343 - BLOCK
      ?auto_100347 - BLOCK
      ?auto_100342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100340 ?auto_100341 ) ) ( not ( = ?auto_100340 ?auto_100344 ) ) ( not ( = ?auto_100341 ?auto_100344 ) ) ( ON ?auto_100340 ?auto_100345 ) ( not ( = ?auto_100340 ?auto_100345 ) ) ( not ( = ?auto_100341 ?auto_100345 ) ) ( not ( = ?auto_100344 ?auto_100345 ) ) ( CLEAR ?auto_100344 ) ( ON-TABLE ?auto_100346 ) ( ON ?auto_100343 ?auto_100346 ) ( ON ?auto_100347 ?auto_100343 ) ( ON ?auto_100342 ?auto_100347 ) ( ON ?auto_100344 ?auto_100342 ) ( not ( = ?auto_100346 ?auto_100343 ) ) ( not ( = ?auto_100346 ?auto_100347 ) ) ( not ( = ?auto_100346 ?auto_100342 ) ) ( not ( = ?auto_100346 ?auto_100344 ) ) ( not ( = ?auto_100346 ?auto_100341 ) ) ( not ( = ?auto_100343 ?auto_100347 ) ) ( not ( = ?auto_100343 ?auto_100342 ) ) ( not ( = ?auto_100343 ?auto_100344 ) ) ( not ( = ?auto_100343 ?auto_100341 ) ) ( not ( = ?auto_100347 ?auto_100342 ) ) ( not ( = ?auto_100347 ?auto_100344 ) ) ( not ( = ?auto_100347 ?auto_100341 ) ) ( not ( = ?auto_100342 ?auto_100344 ) ) ( not ( = ?auto_100342 ?auto_100341 ) ) ( not ( = ?auto_100340 ?auto_100346 ) ) ( not ( = ?auto_100340 ?auto_100343 ) ) ( not ( = ?auto_100340 ?auto_100347 ) ) ( not ( = ?auto_100340 ?auto_100342 ) ) ( not ( = ?auto_100345 ?auto_100346 ) ) ( not ( = ?auto_100345 ?auto_100343 ) ) ( not ( = ?auto_100345 ?auto_100347 ) ) ( not ( = ?auto_100345 ?auto_100342 ) ) ( ON ?auto_100341 ?auto_100340 ) ( CLEAR ?auto_100341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100345 ?auto_100340 )
      ( MAKE-2PILE ?auto_100340 ?auto_100341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100348 - BLOCK
      ?auto_100349 - BLOCK
    )
    :vars
    (
      ?auto_100353 - BLOCK
      ?auto_100351 - BLOCK
      ?auto_100350 - BLOCK
      ?auto_100354 - BLOCK
      ?auto_100355 - BLOCK
      ?auto_100352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100348 ?auto_100349 ) ) ( not ( = ?auto_100348 ?auto_100353 ) ) ( not ( = ?auto_100349 ?auto_100353 ) ) ( ON ?auto_100348 ?auto_100351 ) ( not ( = ?auto_100348 ?auto_100351 ) ) ( not ( = ?auto_100349 ?auto_100351 ) ) ( not ( = ?auto_100353 ?auto_100351 ) ) ( ON-TABLE ?auto_100350 ) ( ON ?auto_100354 ?auto_100350 ) ( ON ?auto_100355 ?auto_100354 ) ( ON ?auto_100352 ?auto_100355 ) ( not ( = ?auto_100350 ?auto_100354 ) ) ( not ( = ?auto_100350 ?auto_100355 ) ) ( not ( = ?auto_100350 ?auto_100352 ) ) ( not ( = ?auto_100350 ?auto_100353 ) ) ( not ( = ?auto_100350 ?auto_100349 ) ) ( not ( = ?auto_100354 ?auto_100355 ) ) ( not ( = ?auto_100354 ?auto_100352 ) ) ( not ( = ?auto_100354 ?auto_100353 ) ) ( not ( = ?auto_100354 ?auto_100349 ) ) ( not ( = ?auto_100355 ?auto_100352 ) ) ( not ( = ?auto_100355 ?auto_100353 ) ) ( not ( = ?auto_100355 ?auto_100349 ) ) ( not ( = ?auto_100352 ?auto_100353 ) ) ( not ( = ?auto_100352 ?auto_100349 ) ) ( not ( = ?auto_100348 ?auto_100350 ) ) ( not ( = ?auto_100348 ?auto_100354 ) ) ( not ( = ?auto_100348 ?auto_100355 ) ) ( not ( = ?auto_100348 ?auto_100352 ) ) ( not ( = ?auto_100351 ?auto_100350 ) ) ( not ( = ?auto_100351 ?auto_100354 ) ) ( not ( = ?auto_100351 ?auto_100355 ) ) ( not ( = ?auto_100351 ?auto_100352 ) ) ( ON ?auto_100349 ?auto_100348 ) ( CLEAR ?auto_100349 ) ( ON-TABLE ?auto_100351 ) ( HOLDING ?auto_100353 ) ( CLEAR ?auto_100352 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100350 ?auto_100354 ?auto_100355 ?auto_100352 ?auto_100353 )
      ( MAKE-2PILE ?auto_100348 ?auto_100349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100356 - BLOCK
      ?auto_100357 - BLOCK
    )
    :vars
    (
      ?auto_100362 - BLOCK
      ?auto_100359 - BLOCK
      ?auto_100360 - BLOCK
      ?auto_100363 - BLOCK
      ?auto_100361 - BLOCK
      ?auto_100358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100356 ?auto_100357 ) ) ( not ( = ?auto_100356 ?auto_100362 ) ) ( not ( = ?auto_100357 ?auto_100362 ) ) ( ON ?auto_100356 ?auto_100359 ) ( not ( = ?auto_100356 ?auto_100359 ) ) ( not ( = ?auto_100357 ?auto_100359 ) ) ( not ( = ?auto_100362 ?auto_100359 ) ) ( ON-TABLE ?auto_100360 ) ( ON ?auto_100363 ?auto_100360 ) ( ON ?auto_100361 ?auto_100363 ) ( ON ?auto_100358 ?auto_100361 ) ( not ( = ?auto_100360 ?auto_100363 ) ) ( not ( = ?auto_100360 ?auto_100361 ) ) ( not ( = ?auto_100360 ?auto_100358 ) ) ( not ( = ?auto_100360 ?auto_100362 ) ) ( not ( = ?auto_100360 ?auto_100357 ) ) ( not ( = ?auto_100363 ?auto_100361 ) ) ( not ( = ?auto_100363 ?auto_100358 ) ) ( not ( = ?auto_100363 ?auto_100362 ) ) ( not ( = ?auto_100363 ?auto_100357 ) ) ( not ( = ?auto_100361 ?auto_100358 ) ) ( not ( = ?auto_100361 ?auto_100362 ) ) ( not ( = ?auto_100361 ?auto_100357 ) ) ( not ( = ?auto_100358 ?auto_100362 ) ) ( not ( = ?auto_100358 ?auto_100357 ) ) ( not ( = ?auto_100356 ?auto_100360 ) ) ( not ( = ?auto_100356 ?auto_100363 ) ) ( not ( = ?auto_100356 ?auto_100361 ) ) ( not ( = ?auto_100356 ?auto_100358 ) ) ( not ( = ?auto_100359 ?auto_100360 ) ) ( not ( = ?auto_100359 ?auto_100363 ) ) ( not ( = ?auto_100359 ?auto_100361 ) ) ( not ( = ?auto_100359 ?auto_100358 ) ) ( ON ?auto_100357 ?auto_100356 ) ( ON-TABLE ?auto_100359 ) ( CLEAR ?auto_100358 ) ( ON ?auto_100362 ?auto_100357 ) ( CLEAR ?auto_100362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100359 ?auto_100356 ?auto_100357 )
      ( MAKE-2PILE ?auto_100356 ?auto_100357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100364 - BLOCK
      ?auto_100365 - BLOCK
    )
    :vars
    (
      ?auto_100371 - BLOCK
      ?auto_100367 - BLOCK
      ?auto_100368 - BLOCK
      ?auto_100369 - BLOCK
      ?auto_100366 - BLOCK
      ?auto_100370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100364 ?auto_100365 ) ) ( not ( = ?auto_100364 ?auto_100371 ) ) ( not ( = ?auto_100365 ?auto_100371 ) ) ( ON ?auto_100364 ?auto_100367 ) ( not ( = ?auto_100364 ?auto_100367 ) ) ( not ( = ?auto_100365 ?auto_100367 ) ) ( not ( = ?auto_100371 ?auto_100367 ) ) ( ON-TABLE ?auto_100368 ) ( ON ?auto_100369 ?auto_100368 ) ( ON ?auto_100366 ?auto_100369 ) ( not ( = ?auto_100368 ?auto_100369 ) ) ( not ( = ?auto_100368 ?auto_100366 ) ) ( not ( = ?auto_100368 ?auto_100370 ) ) ( not ( = ?auto_100368 ?auto_100371 ) ) ( not ( = ?auto_100368 ?auto_100365 ) ) ( not ( = ?auto_100369 ?auto_100366 ) ) ( not ( = ?auto_100369 ?auto_100370 ) ) ( not ( = ?auto_100369 ?auto_100371 ) ) ( not ( = ?auto_100369 ?auto_100365 ) ) ( not ( = ?auto_100366 ?auto_100370 ) ) ( not ( = ?auto_100366 ?auto_100371 ) ) ( not ( = ?auto_100366 ?auto_100365 ) ) ( not ( = ?auto_100370 ?auto_100371 ) ) ( not ( = ?auto_100370 ?auto_100365 ) ) ( not ( = ?auto_100364 ?auto_100368 ) ) ( not ( = ?auto_100364 ?auto_100369 ) ) ( not ( = ?auto_100364 ?auto_100366 ) ) ( not ( = ?auto_100364 ?auto_100370 ) ) ( not ( = ?auto_100367 ?auto_100368 ) ) ( not ( = ?auto_100367 ?auto_100369 ) ) ( not ( = ?auto_100367 ?auto_100366 ) ) ( not ( = ?auto_100367 ?auto_100370 ) ) ( ON ?auto_100365 ?auto_100364 ) ( ON-TABLE ?auto_100367 ) ( ON ?auto_100371 ?auto_100365 ) ( CLEAR ?auto_100371 ) ( HOLDING ?auto_100370 ) ( CLEAR ?auto_100366 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100368 ?auto_100369 ?auto_100366 ?auto_100370 )
      ( MAKE-2PILE ?auto_100364 ?auto_100365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100372 - BLOCK
      ?auto_100373 - BLOCK
    )
    :vars
    (
      ?auto_100375 - BLOCK
      ?auto_100376 - BLOCK
      ?auto_100379 - BLOCK
      ?auto_100377 - BLOCK
      ?auto_100374 - BLOCK
      ?auto_100378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100372 ?auto_100373 ) ) ( not ( = ?auto_100372 ?auto_100375 ) ) ( not ( = ?auto_100373 ?auto_100375 ) ) ( ON ?auto_100372 ?auto_100376 ) ( not ( = ?auto_100372 ?auto_100376 ) ) ( not ( = ?auto_100373 ?auto_100376 ) ) ( not ( = ?auto_100375 ?auto_100376 ) ) ( ON-TABLE ?auto_100379 ) ( ON ?auto_100377 ?auto_100379 ) ( ON ?auto_100374 ?auto_100377 ) ( not ( = ?auto_100379 ?auto_100377 ) ) ( not ( = ?auto_100379 ?auto_100374 ) ) ( not ( = ?auto_100379 ?auto_100378 ) ) ( not ( = ?auto_100379 ?auto_100375 ) ) ( not ( = ?auto_100379 ?auto_100373 ) ) ( not ( = ?auto_100377 ?auto_100374 ) ) ( not ( = ?auto_100377 ?auto_100378 ) ) ( not ( = ?auto_100377 ?auto_100375 ) ) ( not ( = ?auto_100377 ?auto_100373 ) ) ( not ( = ?auto_100374 ?auto_100378 ) ) ( not ( = ?auto_100374 ?auto_100375 ) ) ( not ( = ?auto_100374 ?auto_100373 ) ) ( not ( = ?auto_100378 ?auto_100375 ) ) ( not ( = ?auto_100378 ?auto_100373 ) ) ( not ( = ?auto_100372 ?auto_100379 ) ) ( not ( = ?auto_100372 ?auto_100377 ) ) ( not ( = ?auto_100372 ?auto_100374 ) ) ( not ( = ?auto_100372 ?auto_100378 ) ) ( not ( = ?auto_100376 ?auto_100379 ) ) ( not ( = ?auto_100376 ?auto_100377 ) ) ( not ( = ?auto_100376 ?auto_100374 ) ) ( not ( = ?auto_100376 ?auto_100378 ) ) ( ON ?auto_100373 ?auto_100372 ) ( ON-TABLE ?auto_100376 ) ( ON ?auto_100375 ?auto_100373 ) ( CLEAR ?auto_100374 ) ( ON ?auto_100378 ?auto_100375 ) ( CLEAR ?auto_100378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100376 ?auto_100372 ?auto_100373 ?auto_100375 )
      ( MAKE-2PILE ?auto_100372 ?auto_100373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100380 - BLOCK
      ?auto_100381 - BLOCK
    )
    :vars
    (
      ?auto_100382 - BLOCK
      ?auto_100386 - BLOCK
      ?auto_100387 - BLOCK
      ?auto_100383 - BLOCK
      ?auto_100384 - BLOCK
      ?auto_100385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100380 ?auto_100381 ) ) ( not ( = ?auto_100380 ?auto_100382 ) ) ( not ( = ?auto_100381 ?auto_100382 ) ) ( ON ?auto_100380 ?auto_100386 ) ( not ( = ?auto_100380 ?auto_100386 ) ) ( not ( = ?auto_100381 ?auto_100386 ) ) ( not ( = ?auto_100382 ?auto_100386 ) ) ( ON-TABLE ?auto_100387 ) ( ON ?auto_100383 ?auto_100387 ) ( not ( = ?auto_100387 ?auto_100383 ) ) ( not ( = ?auto_100387 ?auto_100384 ) ) ( not ( = ?auto_100387 ?auto_100385 ) ) ( not ( = ?auto_100387 ?auto_100382 ) ) ( not ( = ?auto_100387 ?auto_100381 ) ) ( not ( = ?auto_100383 ?auto_100384 ) ) ( not ( = ?auto_100383 ?auto_100385 ) ) ( not ( = ?auto_100383 ?auto_100382 ) ) ( not ( = ?auto_100383 ?auto_100381 ) ) ( not ( = ?auto_100384 ?auto_100385 ) ) ( not ( = ?auto_100384 ?auto_100382 ) ) ( not ( = ?auto_100384 ?auto_100381 ) ) ( not ( = ?auto_100385 ?auto_100382 ) ) ( not ( = ?auto_100385 ?auto_100381 ) ) ( not ( = ?auto_100380 ?auto_100387 ) ) ( not ( = ?auto_100380 ?auto_100383 ) ) ( not ( = ?auto_100380 ?auto_100384 ) ) ( not ( = ?auto_100380 ?auto_100385 ) ) ( not ( = ?auto_100386 ?auto_100387 ) ) ( not ( = ?auto_100386 ?auto_100383 ) ) ( not ( = ?auto_100386 ?auto_100384 ) ) ( not ( = ?auto_100386 ?auto_100385 ) ) ( ON ?auto_100381 ?auto_100380 ) ( ON-TABLE ?auto_100386 ) ( ON ?auto_100382 ?auto_100381 ) ( ON ?auto_100385 ?auto_100382 ) ( CLEAR ?auto_100385 ) ( HOLDING ?auto_100384 ) ( CLEAR ?auto_100383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100387 ?auto_100383 ?auto_100384 )
      ( MAKE-2PILE ?auto_100380 ?auto_100381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100388 - BLOCK
      ?auto_100389 - BLOCK
    )
    :vars
    (
      ?auto_100390 - BLOCK
      ?auto_100392 - BLOCK
      ?auto_100393 - BLOCK
      ?auto_100395 - BLOCK
      ?auto_100394 - BLOCK
      ?auto_100391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100388 ?auto_100389 ) ) ( not ( = ?auto_100388 ?auto_100390 ) ) ( not ( = ?auto_100389 ?auto_100390 ) ) ( ON ?auto_100388 ?auto_100392 ) ( not ( = ?auto_100388 ?auto_100392 ) ) ( not ( = ?auto_100389 ?auto_100392 ) ) ( not ( = ?auto_100390 ?auto_100392 ) ) ( ON-TABLE ?auto_100393 ) ( ON ?auto_100395 ?auto_100393 ) ( not ( = ?auto_100393 ?auto_100395 ) ) ( not ( = ?auto_100393 ?auto_100394 ) ) ( not ( = ?auto_100393 ?auto_100391 ) ) ( not ( = ?auto_100393 ?auto_100390 ) ) ( not ( = ?auto_100393 ?auto_100389 ) ) ( not ( = ?auto_100395 ?auto_100394 ) ) ( not ( = ?auto_100395 ?auto_100391 ) ) ( not ( = ?auto_100395 ?auto_100390 ) ) ( not ( = ?auto_100395 ?auto_100389 ) ) ( not ( = ?auto_100394 ?auto_100391 ) ) ( not ( = ?auto_100394 ?auto_100390 ) ) ( not ( = ?auto_100394 ?auto_100389 ) ) ( not ( = ?auto_100391 ?auto_100390 ) ) ( not ( = ?auto_100391 ?auto_100389 ) ) ( not ( = ?auto_100388 ?auto_100393 ) ) ( not ( = ?auto_100388 ?auto_100395 ) ) ( not ( = ?auto_100388 ?auto_100394 ) ) ( not ( = ?auto_100388 ?auto_100391 ) ) ( not ( = ?auto_100392 ?auto_100393 ) ) ( not ( = ?auto_100392 ?auto_100395 ) ) ( not ( = ?auto_100392 ?auto_100394 ) ) ( not ( = ?auto_100392 ?auto_100391 ) ) ( ON ?auto_100389 ?auto_100388 ) ( ON-TABLE ?auto_100392 ) ( ON ?auto_100390 ?auto_100389 ) ( ON ?auto_100391 ?auto_100390 ) ( CLEAR ?auto_100395 ) ( ON ?auto_100394 ?auto_100391 ) ( CLEAR ?auto_100394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100392 ?auto_100388 ?auto_100389 ?auto_100390 ?auto_100391 )
      ( MAKE-2PILE ?auto_100388 ?auto_100389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100396 - BLOCK
      ?auto_100397 - BLOCK
    )
    :vars
    (
      ?auto_100403 - BLOCK
      ?auto_100399 - BLOCK
      ?auto_100402 - BLOCK
      ?auto_100401 - BLOCK
      ?auto_100398 - BLOCK
      ?auto_100400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100396 ?auto_100397 ) ) ( not ( = ?auto_100396 ?auto_100403 ) ) ( not ( = ?auto_100397 ?auto_100403 ) ) ( ON ?auto_100396 ?auto_100399 ) ( not ( = ?auto_100396 ?auto_100399 ) ) ( not ( = ?auto_100397 ?auto_100399 ) ) ( not ( = ?auto_100403 ?auto_100399 ) ) ( ON-TABLE ?auto_100402 ) ( not ( = ?auto_100402 ?auto_100401 ) ) ( not ( = ?auto_100402 ?auto_100398 ) ) ( not ( = ?auto_100402 ?auto_100400 ) ) ( not ( = ?auto_100402 ?auto_100403 ) ) ( not ( = ?auto_100402 ?auto_100397 ) ) ( not ( = ?auto_100401 ?auto_100398 ) ) ( not ( = ?auto_100401 ?auto_100400 ) ) ( not ( = ?auto_100401 ?auto_100403 ) ) ( not ( = ?auto_100401 ?auto_100397 ) ) ( not ( = ?auto_100398 ?auto_100400 ) ) ( not ( = ?auto_100398 ?auto_100403 ) ) ( not ( = ?auto_100398 ?auto_100397 ) ) ( not ( = ?auto_100400 ?auto_100403 ) ) ( not ( = ?auto_100400 ?auto_100397 ) ) ( not ( = ?auto_100396 ?auto_100402 ) ) ( not ( = ?auto_100396 ?auto_100401 ) ) ( not ( = ?auto_100396 ?auto_100398 ) ) ( not ( = ?auto_100396 ?auto_100400 ) ) ( not ( = ?auto_100399 ?auto_100402 ) ) ( not ( = ?auto_100399 ?auto_100401 ) ) ( not ( = ?auto_100399 ?auto_100398 ) ) ( not ( = ?auto_100399 ?auto_100400 ) ) ( ON ?auto_100397 ?auto_100396 ) ( ON-TABLE ?auto_100399 ) ( ON ?auto_100403 ?auto_100397 ) ( ON ?auto_100400 ?auto_100403 ) ( ON ?auto_100398 ?auto_100400 ) ( CLEAR ?auto_100398 ) ( HOLDING ?auto_100401 ) ( CLEAR ?auto_100402 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100402 ?auto_100401 )
      ( MAKE-2PILE ?auto_100396 ?auto_100397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100404 - BLOCK
      ?auto_100405 - BLOCK
    )
    :vars
    (
      ?auto_100406 - BLOCK
      ?auto_100411 - BLOCK
      ?auto_100410 - BLOCK
      ?auto_100409 - BLOCK
      ?auto_100407 - BLOCK
      ?auto_100408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100404 ?auto_100405 ) ) ( not ( = ?auto_100404 ?auto_100406 ) ) ( not ( = ?auto_100405 ?auto_100406 ) ) ( ON ?auto_100404 ?auto_100411 ) ( not ( = ?auto_100404 ?auto_100411 ) ) ( not ( = ?auto_100405 ?auto_100411 ) ) ( not ( = ?auto_100406 ?auto_100411 ) ) ( ON-TABLE ?auto_100410 ) ( not ( = ?auto_100410 ?auto_100409 ) ) ( not ( = ?auto_100410 ?auto_100407 ) ) ( not ( = ?auto_100410 ?auto_100408 ) ) ( not ( = ?auto_100410 ?auto_100406 ) ) ( not ( = ?auto_100410 ?auto_100405 ) ) ( not ( = ?auto_100409 ?auto_100407 ) ) ( not ( = ?auto_100409 ?auto_100408 ) ) ( not ( = ?auto_100409 ?auto_100406 ) ) ( not ( = ?auto_100409 ?auto_100405 ) ) ( not ( = ?auto_100407 ?auto_100408 ) ) ( not ( = ?auto_100407 ?auto_100406 ) ) ( not ( = ?auto_100407 ?auto_100405 ) ) ( not ( = ?auto_100408 ?auto_100406 ) ) ( not ( = ?auto_100408 ?auto_100405 ) ) ( not ( = ?auto_100404 ?auto_100410 ) ) ( not ( = ?auto_100404 ?auto_100409 ) ) ( not ( = ?auto_100404 ?auto_100407 ) ) ( not ( = ?auto_100404 ?auto_100408 ) ) ( not ( = ?auto_100411 ?auto_100410 ) ) ( not ( = ?auto_100411 ?auto_100409 ) ) ( not ( = ?auto_100411 ?auto_100407 ) ) ( not ( = ?auto_100411 ?auto_100408 ) ) ( ON ?auto_100405 ?auto_100404 ) ( ON-TABLE ?auto_100411 ) ( ON ?auto_100406 ?auto_100405 ) ( ON ?auto_100408 ?auto_100406 ) ( ON ?auto_100407 ?auto_100408 ) ( CLEAR ?auto_100410 ) ( ON ?auto_100409 ?auto_100407 ) ( CLEAR ?auto_100409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100411 ?auto_100404 ?auto_100405 ?auto_100406 ?auto_100408 ?auto_100407 )
      ( MAKE-2PILE ?auto_100404 ?auto_100405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100412 - BLOCK
      ?auto_100413 - BLOCK
    )
    :vars
    (
      ?auto_100419 - BLOCK
      ?auto_100417 - BLOCK
      ?auto_100416 - BLOCK
      ?auto_100414 - BLOCK
      ?auto_100418 - BLOCK
      ?auto_100415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100412 ?auto_100413 ) ) ( not ( = ?auto_100412 ?auto_100419 ) ) ( not ( = ?auto_100413 ?auto_100419 ) ) ( ON ?auto_100412 ?auto_100417 ) ( not ( = ?auto_100412 ?auto_100417 ) ) ( not ( = ?auto_100413 ?auto_100417 ) ) ( not ( = ?auto_100419 ?auto_100417 ) ) ( not ( = ?auto_100416 ?auto_100414 ) ) ( not ( = ?auto_100416 ?auto_100418 ) ) ( not ( = ?auto_100416 ?auto_100415 ) ) ( not ( = ?auto_100416 ?auto_100419 ) ) ( not ( = ?auto_100416 ?auto_100413 ) ) ( not ( = ?auto_100414 ?auto_100418 ) ) ( not ( = ?auto_100414 ?auto_100415 ) ) ( not ( = ?auto_100414 ?auto_100419 ) ) ( not ( = ?auto_100414 ?auto_100413 ) ) ( not ( = ?auto_100418 ?auto_100415 ) ) ( not ( = ?auto_100418 ?auto_100419 ) ) ( not ( = ?auto_100418 ?auto_100413 ) ) ( not ( = ?auto_100415 ?auto_100419 ) ) ( not ( = ?auto_100415 ?auto_100413 ) ) ( not ( = ?auto_100412 ?auto_100416 ) ) ( not ( = ?auto_100412 ?auto_100414 ) ) ( not ( = ?auto_100412 ?auto_100418 ) ) ( not ( = ?auto_100412 ?auto_100415 ) ) ( not ( = ?auto_100417 ?auto_100416 ) ) ( not ( = ?auto_100417 ?auto_100414 ) ) ( not ( = ?auto_100417 ?auto_100418 ) ) ( not ( = ?auto_100417 ?auto_100415 ) ) ( ON ?auto_100413 ?auto_100412 ) ( ON-TABLE ?auto_100417 ) ( ON ?auto_100419 ?auto_100413 ) ( ON ?auto_100415 ?auto_100419 ) ( ON ?auto_100418 ?auto_100415 ) ( ON ?auto_100414 ?auto_100418 ) ( CLEAR ?auto_100414 ) ( HOLDING ?auto_100416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100416 )
      ( MAKE-2PILE ?auto_100412 ?auto_100413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100420 - BLOCK
      ?auto_100421 - BLOCK
    )
    :vars
    (
      ?auto_100425 - BLOCK
      ?auto_100422 - BLOCK
      ?auto_100424 - BLOCK
      ?auto_100423 - BLOCK
      ?auto_100426 - BLOCK
      ?auto_100427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100420 ?auto_100421 ) ) ( not ( = ?auto_100420 ?auto_100425 ) ) ( not ( = ?auto_100421 ?auto_100425 ) ) ( ON ?auto_100420 ?auto_100422 ) ( not ( = ?auto_100420 ?auto_100422 ) ) ( not ( = ?auto_100421 ?auto_100422 ) ) ( not ( = ?auto_100425 ?auto_100422 ) ) ( not ( = ?auto_100424 ?auto_100423 ) ) ( not ( = ?auto_100424 ?auto_100426 ) ) ( not ( = ?auto_100424 ?auto_100427 ) ) ( not ( = ?auto_100424 ?auto_100425 ) ) ( not ( = ?auto_100424 ?auto_100421 ) ) ( not ( = ?auto_100423 ?auto_100426 ) ) ( not ( = ?auto_100423 ?auto_100427 ) ) ( not ( = ?auto_100423 ?auto_100425 ) ) ( not ( = ?auto_100423 ?auto_100421 ) ) ( not ( = ?auto_100426 ?auto_100427 ) ) ( not ( = ?auto_100426 ?auto_100425 ) ) ( not ( = ?auto_100426 ?auto_100421 ) ) ( not ( = ?auto_100427 ?auto_100425 ) ) ( not ( = ?auto_100427 ?auto_100421 ) ) ( not ( = ?auto_100420 ?auto_100424 ) ) ( not ( = ?auto_100420 ?auto_100423 ) ) ( not ( = ?auto_100420 ?auto_100426 ) ) ( not ( = ?auto_100420 ?auto_100427 ) ) ( not ( = ?auto_100422 ?auto_100424 ) ) ( not ( = ?auto_100422 ?auto_100423 ) ) ( not ( = ?auto_100422 ?auto_100426 ) ) ( not ( = ?auto_100422 ?auto_100427 ) ) ( ON ?auto_100421 ?auto_100420 ) ( ON-TABLE ?auto_100422 ) ( ON ?auto_100425 ?auto_100421 ) ( ON ?auto_100427 ?auto_100425 ) ( ON ?auto_100426 ?auto_100427 ) ( ON ?auto_100423 ?auto_100426 ) ( ON ?auto_100424 ?auto_100423 ) ( CLEAR ?auto_100424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100422 ?auto_100420 ?auto_100421 ?auto_100425 ?auto_100427 ?auto_100426 ?auto_100423 )
      ( MAKE-2PILE ?auto_100420 ?auto_100421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100451 - BLOCK
      ?auto_100452 - BLOCK
      ?auto_100453 - BLOCK
      ?auto_100454 - BLOCK
    )
    :vars
    (
      ?auto_100457 - BLOCK
      ?auto_100456 - BLOCK
      ?auto_100455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100457 ?auto_100454 ) ( ON-TABLE ?auto_100451 ) ( ON ?auto_100452 ?auto_100451 ) ( ON ?auto_100453 ?auto_100452 ) ( ON ?auto_100454 ?auto_100453 ) ( not ( = ?auto_100451 ?auto_100452 ) ) ( not ( = ?auto_100451 ?auto_100453 ) ) ( not ( = ?auto_100451 ?auto_100454 ) ) ( not ( = ?auto_100451 ?auto_100457 ) ) ( not ( = ?auto_100452 ?auto_100453 ) ) ( not ( = ?auto_100452 ?auto_100454 ) ) ( not ( = ?auto_100452 ?auto_100457 ) ) ( not ( = ?auto_100453 ?auto_100454 ) ) ( not ( = ?auto_100453 ?auto_100457 ) ) ( not ( = ?auto_100454 ?auto_100457 ) ) ( not ( = ?auto_100451 ?auto_100456 ) ) ( not ( = ?auto_100451 ?auto_100455 ) ) ( not ( = ?auto_100452 ?auto_100456 ) ) ( not ( = ?auto_100452 ?auto_100455 ) ) ( not ( = ?auto_100453 ?auto_100456 ) ) ( not ( = ?auto_100453 ?auto_100455 ) ) ( not ( = ?auto_100454 ?auto_100456 ) ) ( not ( = ?auto_100454 ?auto_100455 ) ) ( not ( = ?auto_100457 ?auto_100456 ) ) ( not ( = ?auto_100457 ?auto_100455 ) ) ( not ( = ?auto_100456 ?auto_100455 ) ) ( ON ?auto_100456 ?auto_100457 ) ( CLEAR ?auto_100456 ) ( HOLDING ?auto_100455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100455 )
      ( MAKE-4PILE ?auto_100451 ?auto_100452 ?auto_100453 ?auto_100454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100538 - BLOCK
      ?auto_100539 - BLOCK
      ?auto_100540 - BLOCK
    )
    :vars
    (
      ?auto_100541 - BLOCK
      ?auto_100544 - BLOCK
      ?auto_100542 - BLOCK
      ?auto_100543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100538 ) ( not ( = ?auto_100538 ?auto_100539 ) ) ( not ( = ?auto_100538 ?auto_100540 ) ) ( not ( = ?auto_100539 ?auto_100540 ) ) ( ON ?auto_100540 ?auto_100541 ) ( not ( = ?auto_100538 ?auto_100541 ) ) ( not ( = ?auto_100539 ?auto_100541 ) ) ( not ( = ?auto_100540 ?auto_100541 ) ) ( CLEAR ?auto_100538 ) ( ON ?auto_100539 ?auto_100540 ) ( CLEAR ?auto_100539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100544 ) ( ON ?auto_100542 ?auto_100544 ) ( ON ?auto_100543 ?auto_100542 ) ( ON ?auto_100541 ?auto_100543 ) ( not ( = ?auto_100544 ?auto_100542 ) ) ( not ( = ?auto_100544 ?auto_100543 ) ) ( not ( = ?auto_100544 ?auto_100541 ) ) ( not ( = ?auto_100544 ?auto_100540 ) ) ( not ( = ?auto_100544 ?auto_100539 ) ) ( not ( = ?auto_100542 ?auto_100543 ) ) ( not ( = ?auto_100542 ?auto_100541 ) ) ( not ( = ?auto_100542 ?auto_100540 ) ) ( not ( = ?auto_100542 ?auto_100539 ) ) ( not ( = ?auto_100543 ?auto_100541 ) ) ( not ( = ?auto_100543 ?auto_100540 ) ) ( not ( = ?auto_100543 ?auto_100539 ) ) ( not ( = ?auto_100538 ?auto_100544 ) ) ( not ( = ?auto_100538 ?auto_100542 ) ) ( not ( = ?auto_100538 ?auto_100543 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100544 ?auto_100542 ?auto_100543 ?auto_100541 ?auto_100540 )
      ( MAKE-3PILE ?auto_100538 ?auto_100539 ?auto_100540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100545 - BLOCK
      ?auto_100546 - BLOCK
      ?auto_100547 - BLOCK
    )
    :vars
    (
      ?auto_100550 - BLOCK
      ?auto_100548 - BLOCK
      ?auto_100551 - BLOCK
      ?auto_100549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100545 ?auto_100546 ) ) ( not ( = ?auto_100545 ?auto_100547 ) ) ( not ( = ?auto_100546 ?auto_100547 ) ) ( ON ?auto_100547 ?auto_100550 ) ( not ( = ?auto_100545 ?auto_100550 ) ) ( not ( = ?auto_100546 ?auto_100550 ) ) ( not ( = ?auto_100547 ?auto_100550 ) ) ( ON ?auto_100546 ?auto_100547 ) ( CLEAR ?auto_100546 ) ( ON-TABLE ?auto_100548 ) ( ON ?auto_100551 ?auto_100548 ) ( ON ?auto_100549 ?auto_100551 ) ( ON ?auto_100550 ?auto_100549 ) ( not ( = ?auto_100548 ?auto_100551 ) ) ( not ( = ?auto_100548 ?auto_100549 ) ) ( not ( = ?auto_100548 ?auto_100550 ) ) ( not ( = ?auto_100548 ?auto_100547 ) ) ( not ( = ?auto_100548 ?auto_100546 ) ) ( not ( = ?auto_100551 ?auto_100549 ) ) ( not ( = ?auto_100551 ?auto_100550 ) ) ( not ( = ?auto_100551 ?auto_100547 ) ) ( not ( = ?auto_100551 ?auto_100546 ) ) ( not ( = ?auto_100549 ?auto_100550 ) ) ( not ( = ?auto_100549 ?auto_100547 ) ) ( not ( = ?auto_100549 ?auto_100546 ) ) ( not ( = ?auto_100545 ?auto_100548 ) ) ( not ( = ?auto_100545 ?auto_100551 ) ) ( not ( = ?auto_100545 ?auto_100549 ) ) ( HOLDING ?auto_100545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100545 )
      ( MAKE-3PILE ?auto_100545 ?auto_100546 ?auto_100547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100552 - BLOCK
      ?auto_100553 - BLOCK
      ?auto_100554 - BLOCK
    )
    :vars
    (
      ?auto_100558 - BLOCK
      ?auto_100555 - BLOCK
      ?auto_100556 - BLOCK
      ?auto_100557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100552 ?auto_100553 ) ) ( not ( = ?auto_100552 ?auto_100554 ) ) ( not ( = ?auto_100553 ?auto_100554 ) ) ( ON ?auto_100554 ?auto_100558 ) ( not ( = ?auto_100552 ?auto_100558 ) ) ( not ( = ?auto_100553 ?auto_100558 ) ) ( not ( = ?auto_100554 ?auto_100558 ) ) ( ON ?auto_100553 ?auto_100554 ) ( ON-TABLE ?auto_100555 ) ( ON ?auto_100556 ?auto_100555 ) ( ON ?auto_100557 ?auto_100556 ) ( ON ?auto_100558 ?auto_100557 ) ( not ( = ?auto_100555 ?auto_100556 ) ) ( not ( = ?auto_100555 ?auto_100557 ) ) ( not ( = ?auto_100555 ?auto_100558 ) ) ( not ( = ?auto_100555 ?auto_100554 ) ) ( not ( = ?auto_100555 ?auto_100553 ) ) ( not ( = ?auto_100556 ?auto_100557 ) ) ( not ( = ?auto_100556 ?auto_100558 ) ) ( not ( = ?auto_100556 ?auto_100554 ) ) ( not ( = ?auto_100556 ?auto_100553 ) ) ( not ( = ?auto_100557 ?auto_100558 ) ) ( not ( = ?auto_100557 ?auto_100554 ) ) ( not ( = ?auto_100557 ?auto_100553 ) ) ( not ( = ?auto_100552 ?auto_100555 ) ) ( not ( = ?auto_100552 ?auto_100556 ) ) ( not ( = ?auto_100552 ?auto_100557 ) ) ( ON ?auto_100552 ?auto_100553 ) ( CLEAR ?auto_100552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100555 ?auto_100556 ?auto_100557 ?auto_100558 ?auto_100554 ?auto_100553 )
      ( MAKE-3PILE ?auto_100552 ?auto_100553 ?auto_100554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100562 - BLOCK
      ?auto_100563 - BLOCK
      ?auto_100564 - BLOCK
    )
    :vars
    (
      ?auto_100566 - BLOCK
      ?auto_100568 - BLOCK
      ?auto_100567 - BLOCK
      ?auto_100565 - BLOCK
      ?auto_100569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100562 ?auto_100563 ) ) ( not ( = ?auto_100562 ?auto_100564 ) ) ( not ( = ?auto_100563 ?auto_100564 ) ) ( ON ?auto_100564 ?auto_100566 ) ( not ( = ?auto_100562 ?auto_100566 ) ) ( not ( = ?auto_100563 ?auto_100566 ) ) ( not ( = ?auto_100564 ?auto_100566 ) ) ( ON ?auto_100563 ?auto_100564 ) ( CLEAR ?auto_100563 ) ( ON-TABLE ?auto_100568 ) ( ON ?auto_100567 ?auto_100568 ) ( ON ?auto_100565 ?auto_100567 ) ( ON ?auto_100566 ?auto_100565 ) ( not ( = ?auto_100568 ?auto_100567 ) ) ( not ( = ?auto_100568 ?auto_100565 ) ) ( not ( = ?auto_100568 ?auto_100566 ) ) ( not ( = ?auto_100568 ?auto_100564 ) ) ( not ( = ?auto_100568 ?auto_100563 ) ) ( not ( = ?auto_100567 ?auto_100565 ) ) ( not ( = ?auto_100567 ?auto_100566 ) ) ( not ( = ?auto_100567 ?auto_100564 ) ) ( not ( = ?auto_100567 ?auto_100563 ) ) ( not ( = ?auto_100565 ?auto_100566 ) ) ( not ( = ?auto_100565 ?auto_100564 ) ) ( not ( = ?auto_100565 ?auto_100563 ) ) ( not ( = ?auto_100562 ?auto_100568 ) ) ( not ( = ?auto_100562 ?auto_100567 ) ) ( not ( = ?auto_100562 ?auto_100565 ) ) ( ON ?auto_100562 ?auto_100569 ) ( CLEAR ?auto_100562 ) ( HAND-EMPTY ) ( not ( = ?auto_100562 ?auto_100569 ) ) ( not ( = ?auto_100563 ?auto_100569 ) ) ( not ( = ?auto_100564 ?auto_100569 ) ) ( not ( = ?auto_100566 ?auto_100569 ) ) ( not ( = ?auto_100568 ?auto_100569 ) ) ( not ( = ?auto_100567 ?auto_100569 ) ) ( not ( = ?auto_100565 ?auto_100569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100562 ?auto_100569 )
      ( MAKE-3PILE ?auto_100562 ?auto_100563 ?auto_100564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100570 - BLOCK
      ?auto_100571 - BLOCK
      ?auto_100572 - BLOCK
    )
    :vars
    (
      ?auto_100574 - BLOCK
      ?auto_100573 - BLOCK
      ?auto_100576 - BLOCK
      ?auto_100577 - BLOCK
      ?auto_100575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100570 ?auto_100571 ) ) ( not ( = ?auto_100570 ?auto_100572 ) ) ( not ( = ?auto_100571 ?auto_100572 ) ) ( ON ?auto_100572 ?auto_100574 ) ( not ( = ?auto_100570 ?auto_100574 ) ) ( not ( = ?auto_100571 ?auto_100574 ) ) ( not ( = ?auto_100572 ?auto_100574 ) ) ( ON-TABLE ?auto_100573 ) ( ON ?auto_100576 ?auto_100573 ) ( ON ?auto_100577 ?auto_100576 ) ( ON ?auto_100574 ?auto_100577 ) ( not ( = ?auto_100573 ?auto_100576 ) ) ( not ( = ?auto_100573 ?auto_100577 ) ) ( not ( = ?auto_100573 ?auto_100574 ) ) ( not ( = ?auto_100573 ?auto_100572 ) ) ( not ( = ?auto_100573 ?auto_100571 ) ) ( not ( = ?auto_100576 ?auto_100577 ) ) ( not ( = ?auto_100576 ?auto_100574 ) ) ( not ( = ?auto_100576 ?auto_100572 ) ) ( not ( = ?auto_100576 ?auto_100571 ) ) ( not ( = ?auto_100577 ?auto_100574 ) ) ( not ( = ?auto_100577 ?auto_100572 ) ) ( not ( = ?auto_100577 ?auto_100571 ) ) ( not ( = ?auto_100570 ?auto_100573 ) ) ( not ( = ?auto_100570 ?auto_100576 ) ) ( not ( = ?auto_100570 ?auto_100577 ) ) ( ON ?auto_100570 ?auto_100575 ) ( CLEAR ?auto_100570 ) ( not ( = ?auto_100570 ?auto_100575 ) ) ( not ( = ?auto_100571 ?auto_100575 ) ) ( not ( = ?auto_100572 ?auto_100575 ) ) ( not ( = ?auto_100574 ?auto_100575 ) ) ( not ( = ?auto_100573 ?auto_100575 ) ) ( not ( = ?auto_100576 ?auto_100575 ) ) ( not ( = ?auto_100577 ?auto_100575 ) ) ( HOLDING ?auto_100571 ) ( CLEAR ?auto_100572 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100573 ?auto_100576 ?auto_100577 ?auto_100574 ?auto_100572 ?auto_100571 )
      ( MAKE-3PILE ?auto_100570 ?auto_100571 ?auto_100572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100578 - BLOCK
      ?auto_100579 - BLOCK
      ?auto_100580 - BLOCK
    )
    :vars
    (
      ?auto_100582 - BLOCK
      ?auto_100581 - BLOCK
      ?auto_100585 - BLOCK
      ?auto_100584 - BLOCK
      ?auto_100583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100578 ?auto_100579 ) ) ( not ( = ?auto_100578 ?auto_100580 ) ) ( not ( = ?auto_100579 ?auto_100580 ) ) ( ON ?auto_100580 ?auto_100582 ) ( not ( = ?auto_100578 ?auto_100582 ) ) ( not ( = ?auto_100579 ?auto_100582 ) ) ( not ( = ?auto_100580 ?auto_100582 ) ) ( ON-TABLE ?auto_100581 ) ( ON ?auto_100585 ?auto_100581 ) ( ON ?auto_100584 ?auto_100585 ) ( ON ?auto_100582 ?auto_100584 ) ( not ( = ?auto_100581 ?auto_100585 ) ) ( not ( = ?auto_100581 ?auto_100584 ) ) ( not ( = ?auto_100581 ?auto_100582 ) ) ( not ( = ?auto_100581 ?auto_100580 ) ) ( not ( = ?auto_100581 ?auto_100579 ) ) ( not ( = ?auto_100585 ?auto_100584 ) ) ( not ( = ?auto_100585 ?auto_100582 ) ) ( not ( = ?auto_100585 ?auto_100580 ) ) ( not ( = ?auto_100585 ?auto_100579 ) ) ( not ( = ?auto_100584 ?auto_100582 ) ) ( not ( = ?auto_100584 ?auto_100580 ) ) ( not ( = ?auto_100584 ?auto_100579 ) ) ( not ( = ?auto_100578 ?auto_100581 ) ) ( not ( = ?auto_100578 ?auto_100585 ) ) ( not ( = ?auto_100578 ?auto_100584 ) ) ( ON ?auto_100578 ?auto_100583 ) ( not ( = ?auto_100578 ?auto_100583 ) ) ( not ( = ?auto_100579 ?auto_100583 ) ) ( not ( = ?auto_100580 ?auto_100583 ) ) ( not ( = ?auto_100582 ?auto_100583 ) ) ( not ( = ?auto_100581 ?auto_100583 ) ) ( not ( = ?auto_100585 ?auto_100583 ) ) ( not ( = ?auto_100584 ?auto_100583 ) ) ( CLEAR ?auto_100580 ) ( ON ?auto_100579 ?auto_100578 ) ( CLEAR ?auto_100579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100583 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100583 ?auto_100578 )
      ( MAKE-3PILE ?auto_100578 ?auto_100579 ?auto_100580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100586 - BLOCK
      ?auto_100587 - BLOCK
      ?auto_100588 - BLOCK
    )
    :vars
    (
      ?auto_100591 - BLOCK
      ?auto_100592 - BLOCK
      ?auto_100589 - BLOCK
      ?auto_100590 - BLOCK
      ?auto_100593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100586 ?auto_100587 ) ) ( not ( = ?auto_100586 ?auto_100588 ) ) ( not ( = ?auto_100587 ?auto_100588 ) ) ( not ( = ?auto_100586 ?auto_100591 ) ) ( not ( = ?auto_100587 ?auto_100591 ) ) ( not ( = ?auto_100588 ?auto_100591 ) ) ( ON-TABLE ?auto_100592 ) ( ON ?auto_100589 ?auto_100592 ) ( ON ?auto_100590 ?auto_100589 ) ( ON ?auto_100591 ?auto_100590 ) ( not ( = ?auto_100592 ?auto_100589 ) ) ( not ( = ?auto_100592 ?auto_100590 ) ) ( not ( = ?auto_100592 ?auto_100591 ) ) ( not ( = ?auto_100592 ?auto_100588 ) ) ( not ( = ?auto_100592 ?auto_100587 ) ) ( not ( = ?auto_100589 ?auto_100590 ) ) ( not ( = ?auto_100589 ?auto_100591 ) ) ( not ( = ?auto_100589 ?auto_100588 ) ) ( not ( = ?auto_100589 ?auto_100587 ) ) ( not ( = ?auto_100590 ?auto_100591 ) ) ( not ( = ?auto_100590 ?auto_100588 ) ) ( not ( = ?auto_100590 ?auto_100587 ) ) ( not ( = ?auto_100586 ?auto_100592 ) ) ( not ( = ?auto_100586 ?auto_100589 ) ) ( not ( = ?auto_100586 ?auto_100590 ) ) ( ON ?auto_100586 ?auto_100593 ) ( not ( = ?auto_100586 ?auto_100593 ) ) ( not ( = ?auto_100587 ?auto_100593 ) ) ( not ( = ?auto_100588 ?auto_100593 ) ) ( not ( = ?auto_100591 ?auto_100593 ) ) ( not ( = ?auto_100592 ?auto_100593 ) ) ( not ( = ?auto_100589 ?auto_100593 ) ) ( not ( = ?auto_100590 ?auto_100593 ) ) ( ON ?auto_100587 ?auto_100586 ) ( CLEAR ?auto_100587 ) ( ON-TABLE ?auto_100593 ) ( HOLDING ?auto_100588 ) ( CLEAR ?auto_100591 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100592 ?auto_100589 ?auto_100590 ?auto_100591 ?auto_100588 )
      ( MAKE-3PILE ?auto_100586 ?auto_100587 ?auto_100588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100594 - BLOCK
      ?auto_100595 - BLOCK
      ?auto_100596 - BLOCK
    )
    :vars
    (
      ?auto_100598 - BLOCK
      ?auto_100601 - BLOCK
      ?auto_100597 - BLOCK
      ?auto_100599 - BLOCK
      ?auto_100600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100594 ?auto_100595 ) ) ( not ( = ?auto_100594 ?auto_100596 ) ) ( not ( = ?auto_100595 ?auto_100596 ) ) ( not ( = ?auto_100594 ?auto_100598 ) ) ( not ( = ?auto_100595 ?auto_100598 ) ) ( not ( = ?auto_100596 ?auto_100598 ) ) ( ON-TABLE ?auto_100601 ) ( ON ?auto_100597 ?auto_100601 ) ( ON ?auto_100599 ?auto_100597 ) ( ON ?auto_100598 ?auto_100599 ) ( not ( = ?auto_100601 ?auto_100597 ) ) ( not ( = ?auto_100601 ?auto_100599 ) ) ( not ( = ?auto_100601 ?auto_100598 ) ) ( not ( = ?auto_100601 ?auto_100596 ) ) ( not ( = ?auto_100601 ?auto_100595 ) ) ( not ( = ?auto_100597 ?auto_100599 ) ) ( not ( = ?auto_100597 ?auto_100598 ) ) ( not ( = ?auto_100597 ?auto_100596 ) ) ( not ( = ?auto_100597 ?auto_100595 ) ) ( not ( = ?auto_100599 ?auto_100598 ) ) ( not ( = ?auto_100599 ?auto_100596 ) ) ( not ( = ?auto_100599 ?auto_100595 ) ) ( not ( = ?auto_100594 ?auto_100601 ) ) ( not ( = ?auto_100594 ?auto_100597 ) ) ( not ( = ?auto_100594 ?auto_100599 ) ) ( ON ?auto_100594 ?auto_100600 ) ( not ( = ?auto_100594 ?auto_100600 ) ) ( not ( = ?auto_100595 ?auto_100600 ) ) ( not ( = ?auto_100596 ?auto_100600 ) ) ( not ( = ?auto_100598 ?auto_100600 ) ) ( not ( = ?auto_100601 ?auto_100600 ) ) ( not ( = ?auto_100597 ?auto_100600 ) ) ( not ( = ?auto_100599 ?auto_100600 ) ) ( ON ?auto_100595 ?auto_100594 ) ( ON-TABLE ?auto_100600 ) ( CLEAR ?auto_100598 ) ( ON ?auto_100596 ?auto_100595 ) ( CLEAR ?auto_100596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100600 ?auto_100594 ?auto_100595 )
      ( MAKE-3PILE ?auto_100594 ?auto_100595 ?auto_100596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100602 - BLOCK
      ?auto_100603 - BLOCK
      ?auto_100604 - BLOCK
    )
    :vars
    (
      ?auto_100607 - BLOCK
      ?auto_100606 - BLOCK
      ?auto_100605 - BLOCK
      ?auto_100608 - BLOCK
      ?auto_100609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100602 ?auto_100603 ) ) ( not ( = ?auto_100602 ?auto_100604 ) ) ( not ( = ?auto_100603 ?auto_100604 ) ) ( not ( = ?auto_100602 ?auto_100607 ) ) ( not ( = ?auto_100603 ?auto_100607 ) ) ( not ( = ?auto_100604 ?auto_100607 ) ) ( ON-TABLE ?auto_100606 ) ( ON ?auto_100605 ?auto_100606 ) ( ON ?auto_100608 ?auto_100605 ) ( not ( = ?auto_100606 ?auto_100605 ) ) ( not ( = ?auto_100606 ?auto_100608 ) ) ( not ( = ?auto_100606 ?auto_100607 ) ) ( not ( = ?auto_100606 ?auto_100604 ) ) ( not ( = ?auto_100606 ?auto_100603 ) ) ( not ( = ?auto_100605 ?auto_100608 ) ) ( not ( = ?auto_100605 ?auto_100607 ) ) ( not ( = ?auto_100605 ?auto_100604 ) ) ( not ( = ?auto_100605 ?auto_100603 ) ) ( not ( = ?auto_100608 ?auto_100607 ) ) ( not ( = ?auto_100608 ?auto_100604 ) ) ( not ( = ?auto_100608 ?auto_100603 ) ) ( not ( = ?auto_100602 ?auto_100606 ) ) ( not ( = ?auto_100602 ?auto_100605 ) ) ( not ( = ?auto_100602 ?auto_100608 ) ) ( ON ?auto_100602 ?auto_100609 ) ( not ( = ?auto_100602 ?auto_100609 ) ) ( not ( = ?auto_100603 ?auto_100609 ) ) ( not ( = ?auto_100604 ?auto_100609 ) ) ( not ( = ?auto_100607 ?auto_100609 ) ) ( not ( = ?auto_100606 ?auto_100609 ) ) ( not ( = ?auto_100605 ?auto_100609 ) ) ( not ( = ?auto_100608 ?auto_100609 ) ) ( ON ?auto_100603 ?auto_100602 ) ( ON-TABLE ?auto_100609 ) ( ON ?auto_100604 ?auto_100603 ) ( CLEAR ?auto_100604 ) ( HOLDING ?auto_100607 ) ( CLEAR ?auto_100608 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100606 ?auto_100605 ?auto_100608 ?auto_100607 )
      ( MAKE-3PILE ?auto_100602 ?auto_100603 ?auto_100604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100610 - BLOCK
      ?auto_100611 - BLOCK
      ?auto_100612 - BLOCK
    )
    :vars
    (
      ?auto_100615 - BLOCK
      ?auto_100613 - BLOCK
      ?auto_100617 - BLOCK
      ?auto_100614 - BLOCK
      ?auto_100616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100610 ?auto_100611 ) ) ( not ( = ?auto_100610 ?auto_100612 ) ) ( not ( = ?auto_100611 ?auto_100612 ) ) ( not ( = ?auto_100610 ?auto_100615 ) ) ( not ( = ?auto_100611 ?auto_100615 ) ) ( not ( = ?auto_100612 ?auto_100615 ) ) ( ON-TABLE ?auto_100613 ) ( ON ?auto_100617 ?auto_100613 ) ( ON ?auto_100614 ?auto_100617 ) ( not ( = ?auto_100613 ?auto_100617 ) ) ( not ( = ?auto_100613 ?auto_100614 ) ) ( not ( = ?auto_100613 ?auto_100615 ) ) ( not ( = ?auto_100613 ?auto_100612 ) ) ( not ( = ?auto_100613 ?auto_100611 ) ) ( not ( = ?auto_100617 ?auto_100614 ) ) ( not ( = ?auto_100617 ?auto_100615 ) ) ( not ( = ?auto_100617 ?auto_100612 ) ) ( not ( = ?auto_100617 ?auto_100611 ) ) ( not ( = ?auto_100614 ?auto_100615 ) ) ( not ( = ?auto_100614 ?auto_100612 ) ) ( not ( = ?auto_100614 ?auto_100611 ) ) ( not ( = ?auto_100610 ?auto_100613 ) ) ( not ( = ?auto_100610 ?auto_100617 ) ) ( not ( = ?auto_100610 ?auto_100614 ) ) ( ON ?auto_100610 ?auto_100616 ) ( not ( = ?auto_100610 ?auto_100616 ) ) ( not ( = ?auto_100611 ?auto_100616 ) ) ( not ( = ?auto_100612 ?auto_100616 ) ) ( not ( = ?auto_100615 ?auto_100616 ) ) ( not ( = ?auto_100613 ?auto_100616 ) ) ( not ( = ?auto_100617 ?auto_100616 ) ) ( not ( = ?auto_100614 ?auto_100616 ) ) ( ON ?auto_100611 ?auto_100610 ) ( ON-TABLE ?auto_100616 ) ( ON ?auto_100612 ?auto_100611 ) ( CLEAR ?auto_100614 ) ( ON ?auto_100615 ?auto_100612 ) ( CLEAR ?auto_100615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100616 ?auto_100610 ?auto_100611 ?auto_100612 )
      ( MAKE-3PILE ?auto_100610 ?auto_100611 ?auto_100612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100618 - BLOCK
      ?auto_100619 - BLOCK
      ?auto_100620 - BLOCK
    )
    :vars
    (
      ?auto_100621 - BLOCK
      ?auto_100624 - BLOCK
      ?auto_100623 - BLOCK
      ?auto_100622 - BLOCK
      ?auto_100625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100618 ?auto_100619 ) ) ( not ( = ?auto_100618 ?auto_100620 ) ) ( not ( = ?auto_100619 ?auto_100620 ) ) ( not ( = ?auto_100618 ?auto_100621 ) ) ( not ( = ?auto_100619 ?auto_100621 ) ) ( not ( = ?auto_100620 ?auto_100621 ) ) ( ON-TABLE ?auto_100624 ) ( ON ?auto_100623 ?auto_100624 ) ( not ( = ?auto_100624 ?auto_100623 ) ) ( not ( = ?auto_100624 ?auto_100622 ) ) ( not ( = ?auto_100624 ?auto_100621 ) ) ( not ( = ?auto_100624 ?auto_100620 ) ) ( not ( = ?auto_100624 ?auto_100619 ) ) ( not ( = ?auto_100623 ?auto_100622 ) ) ( not ( = ?auto_100623 ?auto_100621 ) ) ( not ( = ?auto_100623 ?auto_100620 ) ) ( not ( = ?auto_100623 ?auto_100619 ) ) ( not ( = ?auto_100622 ?auto_100621 ) ) ( not ( = ?auto_100622 ?auto_100620 ) ) ( not ( = ?auto_100622 ?auto_100619 ) ) ( not ( = ?auto_100618 ?auto_100624 ) ) ( not ( = ?auto_100618 ?auto_100623 ) ) ( not ( = ?auto_100618 ?auto_100622 ) ) ( ON ?auto_100618 ?auto_100625 ) ( not ( = ?auto_100618 ?auto_100625 ) ) ( not ( = ?auto_100619 ?auto_100625 ) ) ( not ( = ?auto_100620 ?auto_100625 ) ) ( not ( = ?auto_100621 ?auto_100625 ) ) ( not ( = ?auto_100624 ?auto_100625 ) ) ( not ( = ?auto_100623 ?auto_100625 ) ) ( not ( = ?auto_100622 ?auto_100625 ) ) ( ON ?auto_100619 ?auto_100618 ) ( ON-TABLE ?auto_100625 ) ( ON ?auto_100620 ?auto_100619 ) ( ON ?auto_100621 ?auto_100620 ) ( CLEAR ?auto_100621 ) ( HOLDING ?auto_100622 ) ( CLEAR ?auto_100623 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100624 ?auto_100623 ?auto_100622 )
      ( MAKE-3PILE ?auto_100618 ?auto_100619 ?auto_100620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100626 - BLOCK
      ?auto_100627 - BLOCK
      ?auto_100628 - BLOCK
    )
    :vars
    (
      ?auto_100631 - BLOCK
      ?auto_100630 - BLOCK
      ?auto_100632 - BLOCK
      ?auto_100629 - BLOCK
      ?auto_100633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100626 ?auto_100627 ) ) ( not ( = ?auto_100626 ?auto_100628 ) ) ( not ( = ?auto_100627 ?auto_100628 ) ) ( not ( = ?auto_100626 ?auto_100631 ) ) ( not ( = ?auto_100627 ?auto_100631 ) ) ( not ( = ?auto_100628 ?auto_100631 ) ) ( ON-TABLE ?auto_100630 ) ( ON ?auto_100632 ?auto_100630 ) ( not ( = ?auto_100630 ?auto_100632 ) ) ( not ( = ?auto_100630 ?auto_100629 ) ) ( not ( = ?auto_100630 ?auto_100631 ) ) ( not ( = ?auto_100630 ?auto_100628 ) ) ( not ( = ?auto_100630 ?auto_100627 ) ) ( not ( = ?auto_100632 ?auto_100629 ) ) ( not ( = ?auto_100632 ?auto_100631 ) ) ( not ( = ?auto_100632 ?auto_100628 ) ) ( not ( = ?auto_100632 ?auto_100627 ) ) ( not ( = ?auto_100629 ?auto_100631 ) ) ( not ( = ?auto_100629 ?auto_100628 ) ) ( not ( = ?auto_100629 ?auto_100627 ) ) ( not ( = ?auto_100626 ?auto_100630 ) ) ( not ( = ?auto_100626 ?auto_100632 ) ) ( not ( = ?auto_100626 ?auto_100629 ) ) ( ON ?auto_100626 ?auto_100633 ) ( not ( = ?auto_100626 ?auto_100633 ) ) ( not ( = ?auto_100627 ?auto_100633 ) ) ( not ( = ?auto_100628 ?auto_100633 ) ) ( not ( = ?auto_100631 ?auto_100633 ) ) ( not ( = ?auto_100630 ?auto_100633 ) ) ( not ( = ?auto_100632 ?auto_100633 ) ) ( not ( = ?auto_100629 ?auto_100633 ) ) ( ON ?auto_100627 ?auto_100626 ) ( ON-TABLE ?auto_100633 ) ( ON ?auto_100628 ?auto_100627 ) ( ON ?auto_100631 ?auto_100628 ) ( CLEAR ?auto_100632 ) ( ON ?auto_100629 ?auto_100631 ) ( CLEAR ?auto_100629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100633 ?auto_100626 ?auto_100627 ?auto_100628 ?auto_100631 )
      ( MAKE-3PILE ?auto_100626 ?auto_100627 ?auto_100628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100634 - BLOCK
      ?auto_100635 - BLOCK
      ?auto_100636 - BLOCK
    )
    :vars
    (
      ?auto_100638 - BLOCK
      ?auto_100640 - BLOCK
      ?auto_100637 - BLOCK
      ?auto_100639 - BLOCK
      ?auto_100641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100634 ?auto_100635 ) ) ( not ( = ?auto_100634 ?auto_100636 ) ) ( not ( = ?auto_100635 ?auto_100636 ) ) ( not ( = ?auto_100634 ?auto_100638 ) ) ( not ( = ?auto_100635 ?auto_100638 ) ) ( not ( = ?auto_100636 ?auto_100638 ) ) ( ON-TABLE ?auto_100640 ) ( not ( = ?auto_100640 ?auto_100637 ) ) ( not ( = ?auto_100640 ?auto_100639 ) ) ( not ( = ?auto_100640 ?auto_100638 ) ) ( not ( = ?auto_100640 ?auto_100636 ) ) ( not ( = ?auto_100640 ?auto_100635 ) ) ( not ( = ?auto_100637 ?auto_100639 ) ) ( not ( = ?auto_100637 ?auto_100638 ) ) ( not ( = ?auto_100637 ?auto_100636 ) ) ( not ( = ?auto_100637 ?auto_100635 ) ) ( not ( = ?auto_100639 ?auto_100638 ) ) ( not ( = ?auto_100639 ?auto_100636 ) ) ( not ( = ?auto_100639 ?auto_100635 ) ) ( not ( = ?auto_100634 ?auto_100640 ) ) ( not ( = ?auto_100634 ?auto_100637 ) ) ( not ( = ?auto_100634 ?auto_100639 ) ) ( ON ?auto_100634 ?auto_100641 ) ( not ( = ?auto_100634 ?auto_100641 ) ) ( not ( = ?auto_100635 ?auto_100641 ) ) ( not ( = ?auto_100636 ?auto_100641 ) ) ( not ( = ?auto_100638 ?auto_100641 ) ) ( not ( = ?auto_100640 ?auto_100641 ) ) ( not ( = ?auto_100637 ?auto_100641 ) ) ( not ( = ?auto_100639 ?auto_100641 ) ) ( ON ?auto_100635 ?auto_100634 ) ( ON-TABLE ?auto_100641 ) ( ON ?auto_100636 ?auto_100635 ) ( ON ?auto_100638 ?auto_100636 ) ( ON ?auto_100639 ?auto_100638 ) ( CLEAR ?auto_100639 ) ( HOLDING ?auto_100637 ) ( CLEAR ?auto_100640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100640 ?auto_100637 )
      ( MAKE-3PILE ?auto_100634 ?auto_100635 ?auto_100636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100642 - BLOCK
      ?auto_100643 - BLOCK
      ?auto_100644 - BLOCK
    )
    :vars
    (
      ?auto_100645 - BLOCK
      ?auto_100646 - BLOCK
      ?auto_100649 - BLOCK
      ?auto_100648 - BLOCK
      ?auto_100647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100642 ?auto_100643 ) ) ( not ( = ?auto_100642 ?auto_100644 ) ) ( not ( = ?auto_100643 ?auto_100644 ) ) ( not ( = ?auto_100642 ?auto_100645 ) ) ( not ( = ?auto_100643 ?auto_100645 ) ) ( not ( = ?auto_100644 ?auto_100645 ) ) ( ON-TABLE ?auto_100646 ) ( not ( = ?auto_100646 ?auto_100649 ) ) ( not ( = ?auto_100646 ?auto_100648 ) ) ( not ( = ?auto_100646 ?auto_100645 ) ) ( not ( = ?auto_100646 ?auto_100644 ) ) ( not ( = ?auto_100646 ?auto_100643 ) ) ( not ( = ?auto_100649 ?auto_100648 ) ) ( not ( = ?auto_100649 ?auto_100645 ) ) ( not ( = ?auto_100649 ?auto_100644 ) ) ( not ( = ?auto_100649 ?auto_100643 ) ) ( not ( = ?auto_100648 ?auto_100645 ) ) ( not ( = ?auto_100648 ?auto_100644 ) ) ( not ( = ?auto_100648 ?auto_100643 ) ) ( not ( = ?auto_100642 ?auto_100646 ) ) ( not ( = ?auto_100642 ?auto_100649 ) ) ( not ( = ?auto_100642 ?auto_100648 ) ) ( ON ?auto_100642 ?auto_100647 ) ( not ( = ?auto_100642 ?auto_100647 ) ) ( not ( = ?auto_100643 ?auto_100647 ) ) ( not ( = ?auto_100644 ?auto_100647 ) ) ( not ( = ?auto_100645 ?auto_100647 ) ) ( not ( = ?auto_100646 ?auto_100647 ) ) ( not ( = ?auto_100649 ?auto_100647 ) ) ( not ( = ?auto_100648 ?auto_100647 ) ) ( ON ?auto_100643 ?auto_100642 ) ( ON-TABLE ?auto_100647 ) ( ON ?auto_100644 ?auto_100643 ) ( ON ?auto_100645 ?auto_100644 ) ( ON ?auto_100648 ?auto_100645 ) ( CLEAR ?auto_100646 ) ( ON ?auto_100649 ?auto_100648 ) ( CLEAR ?auto_100649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100647 ?auto_100642 ?auto_100643 ?auto_100644 ?auto_100645 ?auto_100648 )
      ( MAKE-3PILE ?auto_100642 ?auto_100643 ?auto_100644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100650 - BLOCK
      ?auto_100651 - BLOCK
      ?auto_100652 - BLOCK
    )
    :vars
    (
      ?auto_100654 - BLOCK
      ?auto_100657 - BLOCK
      ?auto_100656 - BLOCK
      ?auto_100655 - BLOCK
      ?auto_100653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100650 ?auto_100651 ) ) ( not ( = ?auto_100650 ?auto_100652 ) ) ( not ( = ?auto_100651 ?auto_100652 ) ) ( not ( = ?auto_100650 ?auto_100654 ) ) ( not ( = ?auto_100651 ?auto_100654 ) ) ( not ( = ?auto_100652 ?auto_100654 ) ) ( not ( = ?auto_100657 ?auto_100656 ) ) ( not ( = ?auto_100657 ?auto_100655 ) ) ( not ( = ?auto_100657 ?auto_100654 ) ) ( not ( = ?auto_100657 ?auto_100652 ) ) ( not ( = ?auto_100657 ?auto_100651 ) ) ( not ( = ?auto_100656 ?auto_100655 ) ) ( not ( = ?auto_100656 ?auto_100654 ) ) ( not ( = ?auto_100656 ?auto_100652 ) ) ( not ( = ?auto_100656 ?auto_100651 ) ) ( not ( = ?auto_100655 ?auto_100654 ) ) ( not ( = ?auto_100655 ?auto_100652 ) ) ( not ( = ?auto_100655 ?auto_100651 ) ) ( not ( = ?auto_100650 ?auto_100657 ) ) ( not ( = ?auto_100650 ?auto_100656 ) ) ( not ( = ?auto_100650 ?auto_100655 ) ) ( ON ?auto_100650 ?auto_100653 ) ( not ( = ?auto_100650 ?auto_100653 ) ) ( not ( = ?auto_100651 ?auto_100653 ) ) ( not ( = ?auto_100652 ?auto_100653 ) ) ( not ( = ?auto_100654 ?auto_100653 ) ) ( not ( = ?auto_100657 ?auto_100653 ) ) ( not ( = ?auto_100656 ?auto_100653 ) ) ( not ( = ?auto_100655 ?auto_100653 ) ) ( ON ?auto_100651 ?auto_100650 ) ( ON-TABLE ?auto_100653 ) ( ON ?auto_100652 ?auto_100651 ) ( ON ?auto_100654 ?auto_100652 ) ( ON ?auto_100655 ?auto_100654 ) ( ON ?auto_100656 ?auto_100655 ) ( CLEAR ?auto_100656 ) ( HOLDING ?auto_100657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100657 )
      ( MAKE-3PILE ?auto_100650 ?auto_100651 ?auto_100652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100658 - BLOCK
      ?auto_100659 - BLOCK
      ?auto_100660 - BLOCK
    )
    :vars
    (
      ?auto_100662 - BLOCK
      ?auto_100665 - BLOCK
      ?auto_100664 - BLOCK
      ?auto_100663 - BLOCK
      ?auto_100661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100658 ?auto_100659 ) ) ( not ( = ?auto_100658 ?auto_100660 ) ) ( not ( = ?auto_100659 ?auto_100660 ) ) ( not ( = ?auto_100658 ?auto_100662 ) ) ( not ( = ?auto_100659 ?auto_100662 ) ) ( not ( = ?auto_100660 ?auto_100662 ) ) ( not ( = ?auto_100665 ?auto_100664 ) ) ( not ( = ?auto_100665 ?auto_100663 ) ) ( not ( = ?auto_100665 ?auto_100662 ) ) ( not ( = ?auto_100665 ?auto_100660 ) ) ( not ( = ?auto_100665 ?auto_100659 ) ) ( not ( = ?auto_100664 ?auto_100663 ) ) ( not ( = ?auto_100664 ?auto_100662 ) ) ( not ( = ?auto_100664 ?auto_100660 ) ) ( not ( = ?auto_100664 ?auto_100659 ) ) ( not ( = ?auto_100663 ?auto_100662 ) ) ( not ( = ?auto_100663 ?auto_100660 ) ) ( not ( = ?auto_100663 ?auto_100659 ) ) ( not ( = ?auto_100658 ?auto_100665 ) ) ( not ( = ?auto_100658 ?auto_100664 ) ) ( not ( = ?auto_100658 ?auto_100663 ) ) ( ON ?auto_100658 ?auto_100661 ) ( not ( = ?auto_100658 ?auto_100661 ) ) ( not ( = ?auto_100659 ?auto_100661 ) ) ( not ( = ?auto_100660 ?auto_100661 ) ) ( not ( = ?auto_100662 ?auto_100661 ) ) ( not ( = ?auto_100665 ?auto_100661 ) ) ( not ( = ?auto_100664 ?auto_100661 ) ) ( not ( = ?auto_100663 ?auto_100661 ) ) ( ON ?auto_100659 ?auto_100658 ) ( ON-TABLE ?auto_100661 ) ( ON ?auto_100660 ?auto_100659 ) ( ON ?auto_100662 ?auto_100660 ) ( ON ?auto_100663 ?auto_100662 ) ( ON ?auto_100664 ?auto_100663 ) ( ON ?auto_100665 ?auto_100664 ) ( CLEAR ?auto_100665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100661 ?auto_100658 ?auto_100659 ?auto_100660 ?auto_100662 ?auto_100663 ?auto_100664 )
      ( MAKE-3PILE ?auto_100658 ?auto_100659 ?auto_100660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100685 - BLOCK
      ?auto_100686 - BLOCK
      ?auto_100687 - BLOCK
    )
    :vars
    (
      ?auto_100689 - BLOCK
      ?auto_100690 - BLOCK
      ?auto_100688 - BLOCK
      ?auto_100691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100689 ?auto_100687 ) ( ON-TABLE ?auto_100685 ) ( ON ?auto_100686 ?auto_100685 ) ( ON ?auto_100687 ?auto_100686 ) ( not ( = ?auto_100685 ?auto_100686 ) ) ( not ( = ?auto_100685 ?auto_100687 ) ) ( not ( = ?auto_100685 ?auto_100689 ) ) ( not ( = ?auto_100686 ?auto_100687 ) ) ( not ( = ?auto_100686 ?auto_100689 ) ) ( not ( = ?auto_100687 ?auto_100689 ) ) ( not ( = ?auto_100685 ?auto_100690 ) ) ( not ( = ?auto_100685 ?auto_100688 ) ) ( not ( = ?auto_100686 ?auto_100690 ) ) ( not ( = ?auto_100686 ?auto_100688 ) ) ( not ( = ?auto_100687 ?auto_100690 ) ) ( not ( = ?auto_100687 ?auto_100688 ) ) ( not ( = ?auto_100689 ?auto_100690 ) ) ( not ( = ?auto_100689 ?auto_100688 ) ) ( not ( = ?auto_100690 ?auto_100688 ) ) ( ON ?auto_100690 ?auto_100689 ) ( CLEAR ?auto_100690 ) ( HOLDING ?auto_100688 ) ( CLEAR ?auto_100691 ) ( ON-TABLE ?auto_100691 ) ( not ( = ?auto_100691 ?auto_100688 ) ) ( not ( = ?auto_100685 ?auto_100691 ) ) ( not ( = ?auto_100686 ?auto_100691 ) ) ( not ( = ?auto_100687 ?auto_100691 ) ) ( not ( = ?auto_100689 ?auto_100691 ) ) ( not ( = ?auto_100690 ?auto_100691 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100691 ?auto_100688 )
      ( MAKE-3PILE ?auto_100685 ?auto_100686 ?auto_100687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100692 - BLOCK
      ?auto_100693 - BLOCK
      ?auto_100694 - BLOCK
    )
    :vars
    (
      ?auto_100696 - BLOCK
      ?auto_100698 - BLOCK
      ?auto_100695 - BLOCK
      ?auto_100697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100696 ?auto_100694 ) ( ON-TABLE ?auto_100692 ) ( ON ?auto_100693 ?auto_100692 ) ( ON ?auto_100694 ?auto_100693 ) ( not ( = ?auto_100692 ?auto_100693 ) ) ( not ( = ?auto_100692 ?auto_100694 ) ) ( not ( = ?auto_100692 ?auto_100696 ) ) ( not ( = ?auto_100693 ?auto_100694 ) ) ( not ( = ?auto_100693 ?auto_100696 ) ) ( not ( = ?auto_100694 ?auto_100696 ) ) ( not ( = ?auto_100692 ?auto_100698 ) ) ( not ( = ?auto_100692 ?auto_100695 ) ) ( not ( = ?auto_100693 ?auto_100698 ) ) ( not ( = ?auto_100693 ?auto_100695 ) ) ( not ( = ?auto_100694 ?auto_100698 ) ) ( not ( = ?auto_100694 ?auto_100695 ) ) ( not ( = ?auto_100696 ?auto_100698 ) ) ( not ( = ?auto_100696 ?auto_100695 ) ) ( not ( = ?auto_100698 ?auto_100695 ) ) ( ON ?auto_100698 ?auto_100696 ) ( CLEAR ?auto_100697 ) ( ON-TABLE ?auto_100697 ) ( not ( = ?auto_100697 ?auto_100695 ) ) ( not ( = ?auto_100692 ?auto_100697 ) ) ( not ( = ?auto_100693 ?auto_100697 ) ) ( not ( = ?auto_100694 ?auto_100697 ) ) ( not ( = ?auto_100696 ?auto_100697 ) ) ( not ( = ?auto_100698 ?auto_100697 ) ) ( ON ?auto_100695 ?auto_100698 ) ( CLEAR ?auto_100695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100692 ?auto_100693 ?auto_100694 ?auto_100696 ?auto_100698 )
      ( MAKE-3PILE ?auto_100692 ?auto_100693 ?auto_100694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100699 - BLOCK
      ?auto_100700 - BLOCK
      ?auto_100701 - BLOCK
    )
    :vars
    (
      ?auto_100705 - BLOCK
      ?auto_100702 - BLOCK
      ?auto_100704 - BLOCK
      ?auto_100703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100705 ?auto_100701 ) ( ON-TABLE ?auto_100699 ) ( ON ?auto_100700 ?auto_100699 ) ( ON ?auto_100701 ?auto_100700 ) ( not ( = ?auto_100699 ?auto_100700 ) ) ( not ( = ?auto_100699 ?auto_100701 ) ) ( not ( = ?auto_100699 ?auto_100705 ) ) ( not ( = ?auto_100700 ?auto_100701 ) ) ( not ( = ?auto_100700 ?auto_100705 ) ) ( not ( = ?auto_100701 ?auto_100705 ) ) ( not ( = ?auto_100699 ?auto_100702 ) ) ( not ( = ?auto_100699 ?auto_100704 ) ) ( not ( = ?auto_100700 ?auto_100702 ) ) ( not ( = ?auto_100700 ?auto_100704 ) ) ( not ( = ?auto_100701 ?auto_100702 ) ) ( not ( = ?auto_100701 ?auto_100704 ) ) ( not ( = ?auto_100705 ?auto_100702 ) ) ( not ( = ?auto_100705 ?auto_100704 ) ) ( not ( = ?auto_100702 ?auto_100704 ) ) ( ON ?auto_100702 ?auto_100705 ) ( not ( = ?auto_100703 ?auto_100704 ) ) ( not ( = ?auto_100699 ?auto_100703 ) ) ( not ( = ?auto_100700 ?auto_100703 ) ) ( not ( = ?auto_100701 ?auto_100703 ) ) ( not ( = ?auto_100705 ?auto_100703 ) ) ( not ( = ?auto_100702 ?auto_100703 ) ) ( ON ?auto_100704 ?auto_100702 ) ( CLEAR ?auto_100704 ) ( HOLDING ?auto_100703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100703 )
      ( MAKE-3PILE ?auto_100699 ?auto_100700 ?auto_100701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100716 - BLOCK
      ?auto_100717 - BLOCK
      ?auto_100718 - BLOCK
    )
    :vars
    (
      ?auto_100721 - BLOCK
      ?auto_100720 - BLOCK
      ?auto_100719 - BLOCK
      ?auto_100722 - BLOCK
      ?auto_100723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100721 ?auto_100718 ) ( ON-TABLE ?auto_100716 ) ( ON ?auto_100717 ?auto_100716 ) ( ON ?auto_100718 ?auto_100717 ) ( not ( = ?auto_100716 ?auto_100717 ) ) ( not ( = ?auto_100716 ?auto_100718 ) ) ( not ( = ?auto_100716 ?auto_100721 ) ) ( not ( = ?auto_100717 ?auto_100718 ) ) ( not ( = ?auto_100717 ?auto_100721 ) ) ( not ( = ?auto_100718 ?auto_100721 ) ) ( not ( = ?auto_100716 ?auto_100720 ) ) ( not ( = ?auto_100716 ?auto_100719 ) ) ( not ( = ?auto_100717 ?auto_100720 ) ) ( not ( = ?auto_100717 ?auto_100719 ) ) ( not ( = ?auto_100718 ?auto_100720 ) ) ( not ( = ?auto_100718 ?auto_100719 ) ) ( not ( = ?auto_100721 ?auto_100720 ) ) ( not ( = ?auto_100721 ?auto_100719 ) ) ( not ( = ?auto_100720 ?auto_100719 ) ) ( ON ?auto_100720 ?auto_100721 ) ( not ( = ?auto_100722 ?auto_100719 ) ) ( not ( = ?auto_100716 ?auto_100722 ) ) ( not ( = ?auto_100717 ?auto_100722 ) ) ( not ( = ?auto_100718 ?auto_100722 ) ) ( not ( = ?auto_100721 ?auto_100722 ) ) ( not ( = ?auto_100720 ?auto_100722 ) ) ( ON ?auto_100719 ?auto_100720 ) ( CLEAR ?auto_100719 ) ( ON ?auto_100722 ?auto_100723 ) ( CLEAR ?auto_100722 ) ( HAND-EMPTY ) ( not ( = ?auto_100716 ?auto_100723 ) ) ( not ( = ?auto_100717 ?auto_100723 ) ) ( not ( = ?auto_100718 ?auto_100723 ) ) ( not ( = ?auto_100721 ?auto_100723 ) ) ( not ( = ?auto_100720 ?auto_100723 ) ) ( not ( = ?auto_100719 ?auto_100723 ) ) ( not ( = ?auto_100722 ?auto_100723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100722 ?auto_100723 )
      ( MAKE-3PILE ?auto_100716 ?auto_100717 ?auto_100718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100724 - BLOCK
      ?auto_100725 - BLOCK
      ?auto_100726 - BLOCK
    )
    :vars
    (
      ?auto_100728 - BLOCK
      ?auto_100730 - BLOCK
      ?auto_100729 - BLOCK
      ?auto_100727 - BLOCK
      ?auto_100731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100728 ?auto_100726 ) ( ON-TABLE ?auto_100724 ) ( ON ?auto_100725 ?auto_100724 ) ( ON ?auto_100726 ?auto_100725 ) ( not ( = ?auto_100724 ?auto_100725 ) ) ( not ( = ?auto_100724 ?auto_100726 ) ) ( not ( = ?auto_100724 ?auto_100728 ) ) ( not ( = ?auto_100725 ?auto_100726 ) ) ( not ( = ?auto_100725 ?auto_100728 ) ) ( not ( = ?auto_100726 ?auto_100728 ) ) ( not ( = ?auto_100724 ?auto_100730 ) ) ( not ( = ?auto_100724 ?auto_100729 ) ) ( not ( = ?auto_100725 ?auto_100730 ) ) ( not ( = ?auto_100725 ?auto_100729 ) ) ( not ( = ?auto_100726 ?auto_100730 ) ) ( not ( = ?auto_100726 ?auto_100729 ) ) ( not ( = ?auto_100728 ?auto_100730 ) ) ( not ( = ?auto_100728 ?auto_100729 ) ) ( not ( = ?auto_100730 ?auto_100729 ) ) ( ON ?auto_100730 ?auto_100728 ) ( not ( = ?auto_100727 ?auto_100729 ) ) ( not ( = ?auto_100724 ?auto_100727 ) ) ( not ( = ?auto_100725 ?auto_100727 ) ) ( not ( = ?auto_100726 ?auto_100727 ) ) ( not ( = ?auto_100728 ?auto_100727 ) ) ( not ( = ?auto_100730 ?auto_100727 ) ) ( ON ?auto_100727 ?auto_100731 ) ( CLEAR ?auto_100727 ) ( not ( = ?auto_100724 ?auto_100731 ) ) ( not ( = ?auto_100725 ?auto_100731 ) ) ( not ( = ?auto_100726 ?auto_100731 ) ) ( not ( = ?auto_100728 ?auto_100731 ) ) ( not ( = ?auto_100730 ?auto_100731 ) ) ( not ( = ?auto_100729 ?auto_100731 ) ) ( not ( = ?auto_100727 ?auto_100731 ) ) ( HOLDING ?auto_100729 ) ( CLEAR ?auto_100730 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100724 ?auto_100725 ?auto_100726 ?auto_100728 ?auto_100730 ?auto_100729 )
      ( MAKE-3PILE ?auto_100724 ?auto_100725 ?auto_100726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100786 - BLOCK
      ?auto_100787 - BLOCK
      ?auto_100788 - BLOCK
      ?auto_100789 - BLOCK
    )
    :vars
    (
      ?auto_100790 - BLOCK
      ?auto_100791 - BLOCK
      ?auto_100792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100786 ) ( ON ?auto_100787 ?auto_100786 ) ( not ( = ?auto_100786 ?auto_100787 ) ) ( not ( = ?auto_100786 ?auto_100788 ) ) ( not ( = ?auto_100786 ?auto_100789 ) ) ( not ( = ?auto_100787 ?auto_100788 ) ) ( not ( = ?auto_100787 ?auto_100789 ) ) ( not ( = ?auto_100788 ?auto_100789 ) ) ( ON ?auto_100789 ?auto_100790 ) ( not ( = ?auto_100786 ?auto_100790 ) ) ( not ( = ?auto_100787 ?auto_100790 ) ) ( not ( = ?auto_100788 ?auto_100790 ) ) ( not ( = ?auto_100789 ?auto_100790 ) ) ( CLEAR ?auto_100787 ) ( ON ?auto_100788 ?auto_100789 ) ( CLEAR ?auto_100788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100791 ) ( ON ?auto_100792 ?auto_100791 ) ( ON ?auto_100790 ?auto_100792 ) ( not ( = ?auto_100791 ?auto_100792 ) ) ( not ( = ?auto_100791 ?auto_100790 ) ) ( not ( = ?auto_100791 ?auto_100789 ) ) ( not ( = ?auto_100791 ?auto_100788 ) ) ( not ( = ?auto_100792 ?auto_100790 ) ) ( not ( = ?auto_100792 ?auto_100789 ) ) ( not ( = ?auto_100792 ?auto_100788 ) ) ( not ( = ?auto_100786 ?auto_100791 ) ) ( not ( = ?auto_100786 ?auto_100792 ) ) ( not ( = ?auto_100787 ?auto_100791 ) ) ( not ( = ?auto_100787 ?auto_100792 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100791 ?auto_100792 ?auto_100790 ?auto_100789 )
      ( MAKE-4PILE ?auto_100786 ?auto_100787 ?auto_100788 ?auto_100789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100793 - BLOCK
      ?auto_100794 - BLOCK
      ?auto_100795 - BLOCK
      ?auto_100796 - BLOCK
    )
    :vars
    (
      ?auto_100799 - BLOCK
      ?auto_100798 - BLOCK
      ?auto_100797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100793 ) ( not ( = ?auto_100793 ?auto_100794 ) ) ( not ( = ?auto_100793 ?auto_100795 ) ) ( not ( = ?auto_100793 ?auto_100796 ) ) ( not ( = ?auto_100794 ?auto_100795 ) ) ( not ( = ?auto_100794 ?auto_100796 ) ) ( not ( = ?auto_100795 ?auto_100796 ) ) ( ON ?auto_100796 ?auto_100799 ) ( not ( = ?auto_100793 ?auto_100799 ) ) ( not ( = ?auto_100794 ?auto_100799 ) ) ( not ( = ?auto_100795 ?auto_100799 ) ) ( not ( = ?auto_100796 ?auto_100799 ) ) ( ON ?auto_100795 ?auto_100796 ) ( CLEAR ?auto_100795 ) ( ON-TABLE ?auto_100798 ) ( ON ?auto_100797 ?auto_100798 ) ( ON ?auto_100799 ?auto_100797 ) ( not ( = ?auto_100798 ?auto_100797 ) ) ( not ( = ?auto_100798 ?auto_100799 ) ) ( not ( = ?auto_100798 ?auto_100796 ) ) ( not ( = ?auto_100798 ?auto_100795 ) ) ( not ( = ?auto_100797 ?auto_100799 ) ) ( not ( = ?auto_100797 ?auto_100796 ) ) ( not ( = ?auto_100797 ?auto_100795 ) ) ( not ( = ?auto_100793 ?auto_100798 ) ) ( not ( = ?auto_100793 ?auto_100797 ) ) ( not ( = ?auto_100794 ?auto_100798 ) ) ( not ( = ?auto_100794 ?auto_100797 ) ) ( HOLDING ?auto_100794 ) ( CLEAR ?auto_100793 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100793 ?auto_100794 )
      ( MAKE-4PILE ?auto_100793 ?auto_100794 ?auto_100795 ?auto_100796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100800 - BLOCK
      ?auto_100801 - BLOCK
      ?auto_100802 - BLOCK
      ?auto_100803 - BLOCK
    )
    :vars
    (
      ?auto_100806 - BLOCK
      ?auto_100805 - BLOCK
      ?auto_100804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100800 ) ( not ( = ?auto_100800 ?auto_100801 ) ) ( not ( = ?auto_100800 ?auto_100802 ) ) ( not ( = ?auto_100800 ?auto_100803 ) ) ( not ( = ?auto_100801 ?auto_100802 ) ) ( not ( = ?auto_100801 ?auto_100803 ) ) ( not ( = ?auto_100802 ?auto_100803 ) ) ( ON ?auto_100803 ?auto_100806 ) ( not ( = ?auto_100800 ?auto_100806 ) ) ( not ( = ?auto_100801 ?auto_100806 ) ) ( not ( = ?auto_100802 ?auto_100806 ) ) ( not ( = ?auto_100803 ?auto_100806 ) ) ( ON ?auto_100802 ?auto_100803 ) ( ON-TABLE ?auto_100805 ) ( ON ?auto_100804 ?auto_100805 ) ( ON ?auto_100806 ?auto_100804 ) ( not ( = ?auto_100805 ?auto_100804 ) ) ( not ( = ?auto_100805 ?auto_100806 ) ) ( not ( = ?auto_100805 ?auto_100803 ) ) ( not ( = ?auto_100805 ?auto_100802 ) ) ( not ( = ?auto_100804 ?auto_100806 ) ) ( not ( = ?auto_100804 ?auto_100803 ) ) ( not ( = ?auto_100804 ?auto_100802 ) ) ( not ( = ?auto_100800 ?auto_100805 ) ) ( not ( = ?auto_100800 ?auto_100804 ) ) ( not ( = ?auto_100801 ?auto_100805 ) ) ( not ( = ?auto_100801 ?auto_100804 ) ) ( CLEAR ?auto_100800 ) ( ON ?auto_100801 ?auto_100802 ) ( CLEAR ?auto_100801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100805 ?auto_100804 ?auto_100806 ?auto_100803 ?auto_100802 )
      ( MAKE-4PILE ?auto_100800 ?auto_100801 ?auto_100802 ?auto_100803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100807 - BLOCK
      ?auto_100808 - BLOCK
      ?auto_100809 - BLOCK
      ?auto_100810 - BLOCK
    )
    :vars
    (
      ?auto_100812 - BLOCK
      ?auto_100813 - BLOCK
      ?auto_100811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100807 ?auto_100808 ) ) ( not ( = ?auto_100807 ?auto_100809 ) ) ( not ( = ?auto_100807 ?auto_100810 ) ) ( not ( = ?auto_100808 ?auto_100809 ) ) ( not ( = ?auto_100808 ?auto_100810 ) ) ( not ( = ?auto_100809 ?auto_100810 ) ) ( ON ?auto_100810 ?auto_100812 ) ( not ( = ?auto_100807 ?auto_100812 ) ) ( not ( = ?auto_100808 ?auto_100812 ) ) ( not ( = ?auto_100809 ?auto_100812 ) ) ( not ( = ?auto_100810 ?auto_100812 ) ) ( ON ?auto_100809 ?auto_100810 ) ( ON-TABLE ?auto_100813 ) ( ON ?auto_100811 ?auto_100813 ) ( ON ?auto_100812 ?auto_100811 ) ( not ( = ?auto_100813 ?auto_100811 ) ) ( not ( = ?auto_100813 ?auto_100812 ) ) ( not ( = ?auto_100813 ?auto_100810 ) ) ( not ( = ?auto_100813 ?auto_100809 ) ) ( not ( = ?auto_100811 ?auto_100812 ) ) ( not ( = ?auto_100811 ?auto_100810 ) ) ( not ( = ?auto_100811 ?auto_100809 ) ) ( not ( = ?auto_100807 ?auto_100813 ) ) ( not ( = ?auto_100807 ?auto_100811 ) ) ( not ( = ?auto_100808 ?auto_100813 ) ) ( not ( = ?auto_100808 ?auto_100811 ) ) ( ON ?auto_100808 ?auto_100809 ) ( CLEAR ?auto_100808 ) ( HOLDING ?auto_100807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100807 )
      ( MAKE-4PILE ?auto_100807 ?auto_100808 ?auto_100809 ?auto_100810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100814 - BLOCK
      ?auto_100815 - BLOCK
      ?auto_100816 - BLOCK
      ?auto_100817 - BLOCK
    )
    :vars
    (
      ?auto_100818 - BLOCK
      ?auto_100820 - BLOCK
      ?auto_100819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100814 ?auto_100815 ) ) ( not ( = ?auto_100814 ?auto_100816 ) ) ( not ( = ?auto_100814 ?auto_100817 ) ) ( not ( = ?auto_100815 ?auto_100816 ) ) ( not ( = ?auto_100815 ?auto_100817 ) ) ( not ( = ?auto_100816 ?auto_100817 ) ) ( ON ?auto_100817 ?auto_100818 ) ( not ( = ?auto_100814 ?auto_100818 ) ) ( not ( = ?auto_100815 ?auto_100818 ) ) ( not ( = ?auto_100816 ?auto_100818 ) ) ( not ( = ?auto_100817 ?auto_100818 ) ) ( ON ?auto_100816 ?auto_100817 ) ( ON-TABLE ?auto_100820 ) ( ON ?auto_100819 ?auto_100820 ) ( ON ?auto_100818 ?auto_100819 ) ( not ( = ?auto_100820 ?auto_100819 ) ) ( not ( = ?auto_100820 ?auto_100818 ) ) ( not ( = ?auto_100820 ?auto_100817 ) ) ( not ( = ?auto_100820 ?auto_100816 ) ) ( not ( = ?auto_100819 ?auto_100818 ) ) ( not ( = ?auto_100819 ?auto_100817 ) ) ( not ( = ?auto_100819 ?auto_100816 ) ) ( not ( = ?auto_100814 ?auto_100820 ) ) ( not ( = ?auto_100814 ?auto_100819 ) ) ( not ( = ?auto_100815 ?auto_100820 ) ) ( not ( = ?auto_100815 ?auto_100819 ) ) ( ON ?auto_100815 ?auto_100816 ) ( ON ?auto_100814 ?auto_100815 ) ( CLEAR ?auto_100814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100820 ?auto_100819 ?auto_100818 ?auto_100817 ?auto_100816 ?auto_100815 )
      ( MAKE-4PILE ?auto_100814 ?auto_100815 ?auto_100816 ?auto_100817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100825 - BLOCK
      ?auto_100826 - BLOCK
      ?auto_100827 - BLOCK
      ?auto_100828 - BLOCK
    )
    :vars
    (
      ?auto_100830 - BLOCK
      ?auto_100829 - BLOCK
      ?auto_100831 - BLOCK
      ?auto_100832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100825 ?auto_100826 ) ) ( not ( = ?auto_100825 ?auto_100827 ) ) ( not ( = ?auto_100825 ?auto_100828 ) ) ( not ( = ?auto_100826 ?auto_100827 ) ) ( not ( = ?auto_100826 ?auto_100828 ) ) ( not ( = ?auto_100827 ?auto_100828 ) ) ( ON ?auto_100828 ?auto_100830 ) ( not ( = ?auto_100825 ?auto_100830 ) ) ( not ( = ?auto_100826 ?auto_100830 ) ) ( not ( = ?auto_100827 ?auto_100830 ) ) ( not ( = ?auto_100828 ?auto_100830 ) ) ( ON ?auto_100827 ?auto_100828 ) ( ON-TABLE ?auto_100829 ) ( ON ?auto_100831 ?auto_100829 ) ( ON ?auto_100830 ?auto_100831 ) ( not ( = ?auto_100829 ?auto_100831 ) ) ( not ( = ?auto_100829 ?auto_100830 ) ) ( not ( = ?auto_100829 ?auto_100828 ) ) ( not ( = ?auto_100829 ?auto_100827 ) ) ( not ( = ?auto_100831 ?auto_100830 ) ) ( not ( = ?auto_100831 ?auto_100828 ) ) ( not ( = ?auto_100831 ?auto_100827 ) ) ( not ( = ?auto_100825 ?auto_100829 ) ) ( not ( = ?auto_100825 ?auto_100831 ) ) ( not ( = ?auto_100826 ?auto_100829 ) ) ( not ( = ?auto_100826 ?auto_100831 ) ) ( ON ?auto_100826 ?auto_100827 ) ( CLEAR ?auto_100826 ) ( ON ?auto_100825 ?auto_100832 ) ( CLEAR ?auto_100825 ) ( HAND-EMPTY ) ( not ( = ?auto_100825 ?auto_100832 ) ) ( not ( = ?auto_100826 ?auto_100832 ) ) ( not ( = ?auto_100827 ?auto_100832 ) ) ( not ( = ?auto_100828 ?auto_100832 ) ) ( not ( = ?auto_100830 ?auto_100832 ) ) ( not ( = ?auto_100829 ?auto_100832 ) ) ( not ( = ?auto_100831 ?auto_100832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100825 ?auto_100832 )
      ( MAKE-4PILE ?auto_100825 ?auto_100826 ?auto_100827 ?auto_100828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100833 - BLOCK
      ?auto_100834 - BLOCK
      ?auto_100835 - BLOCK
      ?auto_100836 - BLOCK
    )
    :vars
    (
      ?auto_100840 - BLOCK
      ?auto_100838 - BLOCK
      ?auto_100839 - BLOCK
      ?auto_100837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100833 ?auto_100834 ) ) ( not ( = ?auto_100833 ?auto_100835 ) ) ( not ( = ?auto_100833 ?auto_100836 ) ) ( not ( = ?auto_100834 ?auto_100835 ) ) ( not ( = ?auto_100834 ?auto_100836 ) ) ( not ( = ?auto_100835 ?auto_100836 ) ) ( ON ?auto_100836 ?auto_100840 ) ( not ( = ?auto_100833 ?auto_100840 ) ) ( not ( = ?auto_100834 ?auto_100840 ) ) ( not ( = ?auto_100835 ?auto_100840 ) ) ( not ( = ?auto_100836 ?auto_100840 ) ) ( ON ?auto_100835 ?auto_100836 ) ( ON-TABLE ?auto_100838 ) ( ON ?auto_100839 ?auto_100838 ) ( ON ?auto_100840 ?auto_100839 ) ( not ( = ?auto_100838 ?auto_100839 ) ) ( not ( = ?auto_100838 ?auto_100840 ) ) ( not ( = ?auto_100838 ?auto_100836 ) ) ( not ( = ?auto_100838 ?auto_100835 ) ) ( not ( = ?auto_100839 ?auto_100840 ) ) ( not ( = ?auto_100839 ?auto_100836 ) ) ( not ( = ?auto_100839 ?auto_100835 ) ) ( not ( = ?auto_100833 ?auto_100838 ) ) ( not ( = ?auto_100833 ?auto_100839 ) ) ( not ( = ?auto_100834 ?auto_100838 ) ) ( not ( = ?auto_100834 ?auto_100839 ) ) ( ON ?auto_100833 ?auto_100837 ) ( CLEAR ?auto_100833 ) ( not ( = ?auto_100833 ?auto_100837 ) ) ( not ( = ?auto_100834 ?auto_100837 ) ) ( not ( = ?auto_100835 ?auto_100837 ) ) ( not ( = ?auto_100836 ?auto_100837 ) ) ( not ( = ?auto_100840 ?auto_100837 ) ) ( not ( = ?auto_100838 ?auto_100837 ) ) ( not ( = ?auto_100839 ?auto_100837 ) ) ( HOLDING ?auto_100834 ) ( CLEAR ?auto_100835 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100838 ?auto_100839 ?auto_100840 ?auto_100836 ?auto_100835 ?auto_100834 )
      ( MAKE-4PILE ?auto_100833 ?auto_100834 ?auto_100835 ?auto_100836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100841 - BLOCK
      ?auto_100842 - BLOCK
      ?auto_100843 - BLOCK
      ?auto_100844 - BLOCK
    )
    :vars
    (
      ?auto_100847 - BLOCK
      ?auto_100848 - BLOCK
      ?auto_100845 - BLOCK
      ?auto_100846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100841 ?auto_100842 ) ) ( not ( = ?auto_100841 ?auto_100843 ) ) ( not ( = ?auto_100841 ?auto_100844 ) ) ( not ( = ?auto_100842 ?auto_100843 ) ) ( not ( = ?auto_100842 ?auto_100844 ) ) ( not ( = ?auto_100843 ?auto_100844 ) ) ( ON ?auto_100844 ?auto_100847 ) ( not ( = ?auto_100841 ?auto_100847 ) ) ( not ( = ?auto_100842 ?auto_100847 ) ) ( not ( = ?auto_100843 ?auto_100847 ) ) ( not ( = ?auto_100844 ?auto_100847 ) ) ( ON ?auto_100843 ?auto_100844 ) ( ON-TABLE ?auto_100848 ) ( ON ?auto_100845 ?auto_100848 ) ( ON ?auto_100847 ?auto_100845 ) ( not ( = ?auto_100848 ?auto_100845 ) ) ( not ( = ?auto_100848 ?auto_100847 ) ) ( not ( = ?auto_100848 ?auto_100844 ) ) ( not ( = ?auto_100848 ?auto_100843 ) ) ( not ( = ?auto_100845 ?auto_100847 ) ) ( not ( = ?auto_100845 ?auto_100844 ) ) ( not ( = ?auto_100845 ?auto_100843 ) ) ( not ( = ?auto_100841 ?auto_100848 ) ) ( not ( = ?auto_100841 ?auto_100845 ) ) ( not ( = ?auto_100842 ?auto_100848 ) ) ( not ( = ?auto_100842 ?auto_100845 ) ) ( ON ?auto_100841 ?auto_100846 ) ( not ( = ?auto_100841 ?auto_100846 ) ) ( not ( = ?auto_100842 ?auto_100846 ) ) ( not ( = ?auto_100843 ?auto_100846 ) ) ( not ( = ?auto_100844 ?auto_100846 ) ) ( not ( = ?auto_100847 ?auto_100846 ) ) ( not ( = ?auto_100848 ?auto_100846 ) ) ( not ( = ?auto_100845 ?auto_100846 ) ) ( CLEAR ?auto_100843 ) ( ON ?auto_100842 ?auto_100841 ) ( CLEAR ?auto_100842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100846 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100846 ?auto_100841 )
      ( MAKE-4PILE ?auto_100841 ?auto_100842 ?auto_100843 ?auto_100844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100849 - BLOCK
      ?auto_100850 - BLOCK
      ?auto_100851 - BLOCK
      ?auto_100852 - BLOCK
    )
    :vars
    (
      ?auto_100855 - BLOCK
      ?auto_100856 - BLOCK
      ?auto_100854 - BLOCK
      ?auto_100853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100849 ?auto_100850 ) ) ( not ( = ?auto_100849 ?auto_100851 ) ) ( not ( = ?auto_100849 ?auto_100852 ) ) ( not ( = ?auto_100850 ?auto_100851 ) ) ( not ( = ?auto_100850 ?auto_100852 ) ) ( not ( = ?auto_100851 ?auto_100852 ) ) ( ON ?auto_100852 ?auto_100855 ) ( not ( = ?auto_100849 ?auto_100855 ) ) ( not ( = ?auto_100850 ?auto_100855 ) ) ( not ( = ?auto_100851 ?auto_100855 ) ) ( not ( = ?auto_100852 ?auto_100855 ) ) ( ON-TABLE ?auto_100856 ) ( ON ?auto_100854 ?auto_100856 ) ( ON ?auto_100855 ?auto_100854 ) ( not ( = ?auto_100856 ?auto_100854 ) ) ( not ( = ?auto_100856 ?auto_100855 ) ) ( not ( = ?auto_100856 ?auto_100852 ) ) ( not ( = ?auto_100856 ?auto_100851 ) ) ( not ( = ?auto_100854 ?auto_100855 ) ) ( not ( = ?auto_100854 ?auto_100852 ) ) ( not ( = ?auto_100854 ?auto_100851 ) ) ( not ( = ?auto_100849 ?auto_100856 ) ) ( not ( = ?auto_100849 ?auto_100854 ) ) ( not ( = ?auto_100850 ?auto_100856 ) ) ( not ( = ?auto_100850 ?auto_100854 ) ) ( ON ?auto_100849 ?auto_100853 ) ( not ( = ?auto_100849 ?auto_100853 ) ) ( not ( = ?auto_100850 ?auto_100853 ) ) ( not ( = ?auto_100851 ?auto_100853 ) ) ( not ( = ?auto_100852 ?auto_100853 ) ) ( not ( = ?auto_100855 ?auto_100853 ) ) ( not ( = ?auto_100856 ?auto_100853 ) ) ( not ( = ?auto_100854 ?auto_100853 ) ) ( ON ?auto_100850 ?auto_100849 ) ( CLEAR ?auto_100850 ) ( ON-TABLE ?auto_100853 ) ( HOLDING ?auto_100851 ) ( CLEAR ?auto_100852 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100856 ?auto_100854 ?auto_100855 ?auto_100852 ?auto_100851 )
      ( MAKE-4PILE ?auto_100849 ?auto_100850 ?auto_100851 ?auto_100852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100857 - BLOCK
      ?auto_100858 - BLOCK
      ?auto_100859 - BLOCK
      ?auto_100860 - BLOCK
    )
    :vars
    (
      ?auto_100864 - BLOCK
      ?auto_100862 - BLOCK
      ?auto_100863 - BLOCK
      ?auto_100861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100857 ?auto_100858 ) ) ( not ( = ?auto_100857 ?auto_100859 ) ) ( not ( = ?auto_100857 ?auto_100860 ) ) ( not ( = ?auto_100858 ?auto_100859 ) ) ( not ( = ?auto_100858 ?auto_100860 ) ) ( not ( = ?auto_100859 ?auto_100860 ) ) ( ON ?auto_100860 ?auto_100864 ) ( not ( = ?auto_100857 ?auto_100864 ) ) ( not ( = ?auto_100858 ?auto_100864 ) ) ( not ( = ?auto_100859 ?auto_100864 ) ) ( not ( = ?auto_100860 ?auto_100864 ) ) ( ON-TABLE ?auto_100862 ) ( ON ?auto_100863 ?auto_100862 ) ( ON ?auto_100864 ?auto_100863 ) ( not ( = ?auto_100862 ?auto_100863 ) ) ( not ( = ?auto_100862 ?auto_100864 ) ) ( not ( = ?auto_100862 ?auto_100860 ) ) ( not ( = ?auto_100862 ?auto_100859 ) ) ( not ( = ?auto_100863 ?auto_100864 ) ) ( not ( = ?auto_100863 ?auto_100860 ) ) ( not ( = ?auto_100863 ?auto_100859 ) ) ( not ( = ?auto_100857 ?auto_100862 ) ) ( not ( = ?auto_100857 ?auto_100863 ) ) ( not ( = ?auto_100858 ?auto_100862 ) ) ( not ( = ?auto_100858 ?auto_100863 ) ) ( ON ?auto_100857 ?auto_100861 ) ( not ( = ?auto_100857 ?auto_100861 ) ) ( not ( = ?auto_100858 ?auto_100861 ) ) ( not ( = ?auto_100859 ?auto_100861 ) ) ( not ( = ?auto_100860 ?auto_100861 ) ) ( not ( = ?auto_100864 ?auto_100861 ) ) ( not ( = ?auto_100862 ?auto_100861 ) ) ( not ( = ?auto_100863 ?auto_100861 ) ) ( ON ?auto_100858 ?auto_100857 ) ( ON-TABLE ?auto_100861 ) ( CLEAR ?auto_100860 ) ( ON ?auto_100859 ?auto_100858 ) ( CLEAR ?auto_100859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100861 ?auto_100857 ?auto_100858 )
      ( MAKE-4PILE ?auto_100857 ?auto_100858 ?auto_100859 ?auto_100860 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100865 - BLOCK
      ?auto_100866 - BLOCK
      ?auto_100867 - BLOCK
      ?auto_100868 - BLOCK
    )
    :vars
    (
      ?auto_100870 - BLOCK
      ?auto_100872 - BLOCK
      ?auto_100869 - BLOCK
      ?auto_100871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100865 ?auto_100866 ) ) ( not ( = ?auto_100865 ?auto_100867 ) ) ( not ( = ?auto_100865 ?auto_100868 ) ) ( not ( = ?auto_100866 ?auto_100867 ) ) ( not ( = ?auto_100866 ?auto_100868 ) ) ( not ( = ?auto_100867 ?auto_100868 ) ) ( not ( = ?auto_100865 ?auto_100870 ) ) ( not ( = ?auto_100866 ?auto_100870 ) ) ( not ( = ?auto_100867 ?auto_100870 ) ) ( not ( = ?auto_100868 ?auto_100870 ) ) ( ON-TABLE ?auto_100872 ) ( ON ?auto_100869 ?auto_100872 ) ( ON ?auto_100870 ?auto_100869 ) ( not ( = ?auto_100872 ?auto_100869 ) ) ( not ( = ?auto_100872 ?auto_100870 ) ) ( not ( = ?auto_100872 ?auto_100868 ) ) ( not ( = ?auto_100872 ?auto_100867 ) ) ( not ( = ?auto_100869 ?auto_100870 ) ) ( not ( = ?auto_100869 ?auto_100868 ) ) ( not ( = ?auto_100869 ?auto_100867 ) ) ( not ( = ?auto_100865 ?auto_100872 ) ) ( not ( = ?auto_100865 ?auto_100869 ) ) ( not ( = ?auto_100866 ?auto_100872 ) ) ( not ( = ?auto_100866 ?auto_100869 ) ) ( ON ?auto_100865 ?auto_100871 ) ( not ( = ?auto_100865 ?auto_100871 ) ) ( not ( = ?auto_100866 ?auto_100871 ) ) ( not ( = ?auto_100867 ?auto_100871 ) ) ( not ( = ?auto_100868 ?auto_100871 ) ) ( not ( = ?auto_100870 ?auto_100871 ) ) ( not ( = ?auto_100872 ?auto_100871 ) ) ( not ( = ?auto_100869 ?auto_100871 ) ) ( ON ?auto_100866 ?auto_100865 ) ( ON-TABLE ?auto_100871 ) ( ON ?auto_100867 ?auto_100866 ) ( CLEAR ?auto_100867 ) ( HOLDING ?auto_100868 ) ( CLEAR ?auto_100870 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100872 ?auto_100869 ?auto_100870 ?auto_100868 )
      ( MAKE-4PILE ?auto_100865 ?auto_100866 ?auto_100867 ?auto_100868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100873 - BLOCK
      ?auto_100874 - BLOCK
      ?auto_100875 - BLOCK
      ?auto_100876 - BLOCK
    )
    :vars
    (
      ?auto_100878 - BLOCK
      ?auto_100879 - BLOCK
      ?auto_100877 - BLOCK
      ?auto_100880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100873 ?auto_100874 ) ) ( not ( = ?auto_100873 ?auto_100875 ) ) ( not ( = ?auto_100873 ?auto_100876 ) ) ( not ( = ?auto_100874 ?auto_100875 ) ) ( not ( = ?auto_100874 ?auto_100876 ) ) ( not ( = ?auto_100875 ?auto_100876 ) ) ( not ( = ?auto_100873 ?auto_100878 ) ) ( not ( = ?auto_100874 ?auto_100878 ) ) ( not ( = ?auto_100875 ?auto_100878 ) ) ( not ( = ?auto_100876 ?auto_100878 ) ) ( ON-TABLE ?auto_100879 ) ( ON ?auto_100877 ?auto_100879 ) ( ON ?auto_100878 ?auto_100877 ) ( not ( = ?auto_100879 ?auto_100877 ) ) ( not ( = ?auto_100879 ?auto_100878 ) ) ( not ( = ?auto_100879 ?auto_100876 ) ) ( not ( = ?auto_100879 ?auto_100875 ) ) ( not ( = ?auto_100877 ?auto_100878 ) ) ( not ( = ?auto_100877 ?auto_100876 ) ) ( not ( = ?auto_100877 ?auto_100875 ) ) ( not ( = ?auto_100873 ?auto_100879 ) ) ( not ( = ?auto_100873 ?auto_100877 ) ) ( not ( = ?auto_100874 ?auto_100879 ) ) ( not ( = ?auto_100874 ?auto_100877 ) ) ( ON ?auto_100873 ?auto_100880 ) ( not ( = ?auto_100873 ?auto_100880 ) ) ( not ( = ?auto_100874 ?auto_100880 ) ) ( not ( = ?auto_100875 ?auto_100880 ) ) ( not ( = ?auto_100876 ?auto_100880 ) ) ( not ( = ?auto_100878 ?auto_100880 ) ) ( not ( = ?auto_100879 ?auto_100880 ) ) ( not ( = ?auto_100877 ?auto_100880 ) ) ( ON ?auto_100874 ?auto_100873 ) ( ON-TABLE ?auto_100880 ) ( ON ?auto_100875 ?auto_100874 ) ( CLEAR ?auto_100878 ) ( ON ?auto_100876 ?auto_100875 ) ( CLEAR ?auto_100876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100880 ?auto_100873 ?auto_100874 ?auto_100875 )
      ( MAKE-4PILE ?auto_100873 ?auto_100874 ?auto_100875 ?auto_100876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100881 - BLOCK
      ?auto_100882 - BLOCK
      ?auto_100883 - BLOCK
      ?auto_100884 - BLOCK
    )
    :vars
    (
      ?auto_100886 - BLOCK
      ?auto_100887 - BLOCK
      ?auto_100885 - BLOCK
      ?auto_100888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100881 ?auto_100882 ) ) ( not ( = ?auto_100881 ?auto_100883 ) ) ( not ( = ?auto_100881 ?auto_100884 ) ) ( not ( = ?auto_100882 ?auto_100883 ) ) ( not ( = ?auto_100882 ?auto_100884 ) ) ( not ( = ?auto_100883 ?auto_100884 ) ) ( not ( = ?auto_100881 ?auto_100886 ) ) ( not ( = ?auto_100882 ?auto_100886 ) ) ( not ( = ?auto_100883 ?auto_100886 ) ) ( not ( = ?auto_100884 ?auto_100886 ) ) ( ON-TABLE ?auto_100887 ) ( ON ?auto_100885 ?auto_100887 ) ( not ( = ?auto_100887 ?auto_100885 ) ) ( not ( = ?auto_100887 ?auto_100886 ) ) ( not ( = ?auto_100887 ?auto_100884 ) ) ( not ( = ?auto_100887 ?auto_100883 ) ) ( not ( = ?auto_100885 ?auto_100886 ) ) ( not ( = ?auto_100885 ?auto_100884 ) ) ( not ( = ?auto_100885 ?auto_100883 ) ) ( not ( = ?auto_100881 ?auto_100887 ) ) ( not ( = ?auto_100881 ?auto_100885 ) ) ( not ( = ?auto_100882 ?auto_100887 ) ) ( not ( = ?auto_100882 ?auto_100885 ) ) ( ON ?auto_100881 ?auto_100888 ) ( not ( = ?auto_100881 ?auto_100888 ) ) ( not ( = ?auto_100882 ?auto_100888 ) ) ( not ( = ?auto_100883 ?auto_100888 ) ) ( not ( = ?auto_100884 ?auto_100888 ) ) ( not ( = ?auto_100886 ?auto_100888 ) ) ( not ( = ?auto_100887 ?auto_100888 ) ) ( not ( = ?auto_100885 ?auto_100888 ) ) ( ON ?auto_100882 ?auto_100881 ) ( ON-TABLE ?auto_100888 ) ( ON ?auto_100883 ?auto_100882 ) ( ON ?auto_100884 ?auto_100883 ) ( CLEAR ?auto_100884 ) ( HOLDING ?auto_100886 ) ( CLEAR ?auto_100885 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100887 ?auto_100885 ?auto_100886 )
      ( MAKE-4PILE ?auto_100881 ?auto_100882 ?auto_100883 ?auto_100884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100889 - BLOCK
      ?auto_100890 - BLOCK
      ?auto_100891 - BLOCK
      ?auto_100892 - BLOCK
    )
    :vars
    (
      ?auto_100894 - BLOCK
      ?auto_100896 - BLOCK
      ?auto_100895 - BLOCK
      ?auto_100893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100889 ?auto_100890 ) ) ( not ( = ?auto_100889 ?auto_100891 ) ) ( not ( = ?auto_100889 ?auto_100892 ) ) ( not ( = ?auto_100890 ?auto_100891 ) ) ( not ( = ?auto_100890 ?auto_100892 ) ) ( not ( = ?auto_100891 ?auto_100892 ) ) ( not ( = ?auto_100889 ?auto_100894 ) ) ( not ( = ?auto_100890 ?auto_100894 ) ) ( not ( = ?auto_100891 ?auto_100894 ) ) ( not ( = ?auto_100892 ?auto_100894 ) ) ( ON-TABLE ?auto_100896 ) ( ON ?auto_100895 ?auto_100896 ) ( not ( = ?auto_100896 ?auto_100895 ) ) ( not ( = ?auto_100896 ?auto_100894 ) ) ( not ( = ?auto_100896 ?auto_100892 ) ) ( not ( = ?auto_100896 ?auto_100891 ) ) ( not ( = ?auto_100895 ?auto_100894 ) ) ( not ( = ?auto_100895 ?auto_100892 ) ) ( not ( = ?auto_100895 ?auto_100891 ) ) ( not ( = ?auto_100889 ?auto_100896 ) ) ( not ( = ?auto_100889 ?auto_100895 ) ) ( not ( = ?auto_100890 ?auto_100896 ) ) ( not ( = ?auto_100890 ?auto_100895 ) ) ( ON ?auto_100889 ?auto_100893 ) ( not ( = ?auto_100889 ?auto_100893 ) ) ( not ( = ?auto_100890 ?auto_100893 ) ) ( not ( = ?auto_100891 ?auto_100893 ) ) ( not ( = ?auto_100892 ?auto_100893 ) ) ( not ( = ?auto_100894 ?auto_100893 ) ) ( not ( = ?auto_100896 ?auto_100893 ) ) ( not ( = ?auto_100895 ?auto_100893 ) ) ( ON ?auto_100890 ?auto_100889 ) ( ON-TABLE ?auto_100893 ) ( ON ?auto_100891 ?auto_100890 ) ( ON ?auto_100892 ?auto_100891 ) ( CLEAR ?auto_100895 ) ( ON ?auto_100894 ?auto_100892 ) ( CLEAR ?auto_100894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100893 ?auto_100889 ?auto_100890 ?auto_100891 ?auto_100892 )
      ( MAKE-4PILE ?auto_100889 ?auto_100890 ?auto_100891 ?auto_100892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100897 - BLOCK
      ?auto_100898 - BLOCK
      ?auto_100899 - BLOCK
      ?auto_100900 - BLOCK
    )
    :vars
    (
      ?auto_100902 - BLOCK
      ?auto_100901 - BLOCK
      ?auto_100904 - BLOCK
      ?auto_100903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100897 ?auto_100898 ) ) ( not ( = ?auto_100897 ?auto_100899 ) ) ( not ( = ?auto_100897 ?auto_100900 ) ) ( not ( = ?auto_100898 ?auto_100899 ) ) ( not ( = ?auto_100898 ?auto_100900 ) ) ( not ( = ?auto_100899 ?auto_100900 ) ) ( not ( = ?auto_100897 ?auto_100902 ) ) ( not ( = ?auto_100898 ?auto_100902 ) ) ( not ( = ?auto_100899 ?auto_100902 ) ) ( not ( = ?auto_100900 ?auto_100902 ) ) ( ON-TABLE ?auto_100901 ) ( not ( = ?auto_100901 ?auto_100904 ) ) ( not ( = ?auto_100901 ?auto_100902 ) ) ( not ( = ?auto_100901 ?auto_100900 ) ) ( not ( = ?auto_100901 ?auto_100899 ) ) ( not ( = ?auto_100904 ?auto_100902 ) ) ( not ( = ?auto_100904 ?auto_100900 ) ) ( not ( = ?auto_100904 ?auto_100899 ) ) ( not ( = ?auto_100897 ?auto_100901 ) ) ( not ( = ?auto_100897 ?auto_100904 ) ) ( not ( = ?auto_100898 ?auto_100901 ) ) ( not ( = ?auto_100898 ?auto_100904 ) ) ( ON ?auto_100897 ?auto_100903 ) ( not ( = ?auto_100897 ?auto_100903 ) ) ( not ( = ?auto_100898 ?auto_100903 ) ) ( not ( = ?auto_100899 ?auto_100903 ) ) ( not ( = ?auto_100900 ?auto_100903 ) ) ( not ( = ?auto_100902 ?auto_100903 ) ) ( not ( = ?auto_100901 ?auto_100903 ) ) ( not ( = ?auto_100904 ?auto_100903 ) ) ( ON ?auto_100898 ?auto_100897 ) ( ON-TABLE ?auto_100903 ) ( ON ?auto_100899 ?auto_100898 ) ( ON ?auto_100900 ?auto_100899 ) ( ON ?auto_100902 ?auto_100900 ) ( CLEAR ?auto_100902 ) ( HOLDING ?auto_100904 ) ( CLEAR ?auto_100901 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100901 ?auto_100904 )
      ( MAKE-4PILE ?auto_100897 ?auto_100898 ?auto_100899 ?auto_100900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100905 - BLOCK
      ?auto_100906 - BLOCK
      ?auto_100907 - BLOCK
      ?auto_100908 - BLOCK
    )
    :vars
    (
      ?auto_100909 - BLOCK
      ?auto_100911 - BLOCK
      ?auto_100910 - BLOCK
      ?auto_100912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100905 ?auto_100906 ) ) ( not ( = ?auto_100905 ?auto_100907 ) ) ( not ( = ?auto_100905 ?auto_100908 ) ) ( not ( = ?auto_100906 ?auto_100907 ) ) ( not ( = ?auto_100906 ?auto_100908 ) ) ( not ( = ?auto_100907 ?auto_100908 ) ) ( not ( = ?auto_100905 ?auto_100909 ) ) ( not ( = ?auto_100906 ?auto_100909 ) ) ( not ( = ?auto_100907 ?auto_100909 ) ) ( not ( = ?auto_100908 ?auto_100909 ) ) ( ON-TABLE ?auto_100911 ) ( not ( = ?auto_100911 ?auto_100910 ) ) ( not ( = ?auto_100911 ?auto_100909 ) ) ( not ( = ?auto_100911 ?auto_100908 ) ) ( not ( = ?auto_100911 ?auto_100907 ) ) ( not ( = ?auto_100910 ?auto_100909 ) ) ( not ( = ?auto_100910 ?auto_100908 ) ) ( not ( = ?auto_100910 ?auto_100907 ) ) ( not ( = ?auto_100905 ?auto_100911 ) ) ( not ( = ?auto_100905 ?auto_100910 ) ) ( not ( = ?auto_100906 ?auto_100911 ) ) ( not ( = ?auto_100906 ?auto_100910 ) ) ( ON ?auto_100905 ?auto_100912 ) ( not ( = ?auto_100905 ?auto_100912 ) ) ( not ( = ?auto_100906 ?auto_100912 ) ) ( not ( = ?auto_100907 ?auto_100912 ) ) ( not ( = ?auto_100908 ?auto_100912 ) ) ( not ( = ?auto_100909 ?auto_100912 ) ) ( not ( = ?auto_100911 ?auto_100912 ) ) ( not ( = ?auto_100910 ?auto_100912 ) ) ( ON ?auto_100906 ?auto_100905 ) ( ON-TABLE ?auto_100912 ) ( ON ?auto_100907 ?auto_100906 ) ( ON ?auto_100908 ?auto_100907 ) ( ON ?auto_100909 ?auto_100908 ) ( CLEAR ?auto_100911 ) ( ON ?auto_100910 ?auto_100909 ) ( CLEAR ?auto_100910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100912 ?auto_100905 ?auto_100906 ?auto_100907 ?auto_100908 ?auto_100909 )
      ( MAKE-4PILE ?auto_100905 ?auto_100906 ?auto_100907 ?auto_100908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100913 - BLOCK
      ?auto_100914 - BLOCK
      ?auto_100915 - BLOCK
      ?auto_100916 - BLOCK
    )
    :vars
    (
      ?auto_100917 - BLOCK
      ?auto_100920 - BLOCK
      ?auto_100918 - BLOCK
      ?auto_100919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100913 ?auto_100914 ) ) ( not ( = ?auto_100913 ?auto_100915 ) ) ( not ( = ?auto_100913 ?auto_100916 ) ) ( not ( = ?auto_100914 ?auto_100915 ) ) ( not ( = ?auto_100914 ?auto_100916 ) ) ( not ( = ?auto_100915 ?auto_100916 ) ) ( not ( = ?auto_100913 ?auto_100917 ) ) ( not ( = ?auto_100914 ?auto_100917 ) ) ( not ( = ?auto_100915 ?auto_100917 ) ) ( not ( = ?auto_100916 ?auto_100917 ) ) ( not ( = ?auto_100920 ?auto_100918 ) ) ( not ( = ?auto_100920 ?auto_100917 ) ) ( not ( = ?auto_100920 ?auto_100916 ) ) ( not ( = ?auto_100920 ?auto_100915 ) ) ( not ( = ?auto_100918 ?auto_100917 ) ) ( not ( = ?auto_100918 ?auto_100916 ) ) ( not ( = ?auto_100918 ?auto_100915 ) ) ( not ( = ?auto_100913 ?auto_100920 ) ) ( not ( = ?auto_100913 ?auto_100918 ) ) ( not ( = ?auto_100914 ?auto_100920 ) ) ( not ( = ?auto_100914 ?auto_100918 ) ) ( ON ?auto_100913 ?auto_100919 ) ( not ( = ?auto_100913 ?auto_100919 ) ) ( not ( = ?auto_100914 ?auto_100919 ) ) ( not ( = ?auto_100915 ?auto_100919 ) ) ( not ( = ?auto_100916 ?auto_100919 ) ) ( not ( = ?auto_100917 ?auto_100919 ) ) ( not ( = ?auto_100920 ?auto_100919 ) ) ( not ( = ?auto_100918 ?auto_100919 ) ) ( ON ?auto_100914 ?auto_100913 ) ( ON-TABLE ?auto_100919 ) ( ON ?auto_100915 ?auto_100914 ) ( ON ?auto_100916 ?auto_100915 ) ( ON ?auto_100917 ?auto_100916 ) ( ON ?auto_100918 ?auto_100917 ) ( CLEAR ?auto_100918 ) ( HOLDING ?auto_100920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100920 )
      ( MAKE-4PILE ?auto_100913 ?auto_100914 ?auto_100915 ?auto_100916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100921 - BLOCK
      ?auto_100922 - BLOCK
      ?auto_100923 - BLOCK
      ?auto_100924 - BLOCK
    )
    :vars
    (
      ?auto_100925 - BLOCK
      ?auto_100928 - BLOCK
      ?auto_100927 - BLOCK
      ?auto_100926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100921 ?auto_100922 ) ) ( not ( = ?auto_100921 ?auto_100923 ) ) ( not ( = ?auto_100921 ?auto_100924 ) ) ( not ( = ?auto_100922 ?auto_100923 ) ) ( not ( = ?auto_100922 ?auto_100924 ) ) ( not ( = ?auto_100923 ?auto_100924 ) ) ( not ( = ?auto_100921 ?auto_100925 ) ) ( not ( = ?auto_100922 ?auto_100925 ) ) ( not ( = ?auto_100923 ?auto_100925 ) ) ( not ( = ?auto_100924 ?auto_100925 ) ) ( not ( = ?auto_100928 ?auto_100927 ) ) ( not ( = ?auto_100928 ?auto_100925 ) ) ( not ( = ?auto_100928 ?auto_100924 ) ) ( not ( = ?auto_100928 ?auto_100923 ) ) ( not ( = ?auto_100927 ?auto_100925 ) ) ( not ( = ?auto_100927 ?auto_100924 ) ) ( not ( = ?auto_100927 ?auto_100923 ) ) ( not ( = ?auto_100921 ?auto_100928 ) ) ( not ( = ?auto_100921 ?auto_100927 ) ) ( not ( = ?auto_100922 ?auto_100928 ) ) ( not ( = ?auto_100922 ?auto_100927 ) ) ( ON ?auto_100921 ?auto_100926 ) ( not ( = ?auto_100921 ?auto_100926 ) ) ( not ( = ?auto_100922 ?auto_100926 ) ) ( not ( = ?auto_100923 ?auto_100926 ) ) ( not ( = ?auto_100924 ?auto_100926 ) ) ( not ( = ?auto_100925 ?auto_100926 ) ) ( not ( = ?auto_100928 ?auto_100926 ) ) ( not ( = ?auto_100927 ?auto_100926 ) ) ( ON ?auto_100922 ?auto_100921 ) ( ON-TABLE ?auto_100926 ) ( ON ?auto_100923 ?auto_100922 ) ( ON ?auto_100924 ?auto_100923 ) ( ON ?auto_100925 ?auto_100924 ) ( ON ?auto_100927 ?auto_100925 ) ( ON ?auto_100928 ?auto_100927 ) ( CLEAR ?auto_100928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100926 ?auto_100921 ?auto_100922 ?auto_100923 ?auto_100924 ?auto_100925 ?auto_100927 )
      ( MAKE-4PILE ?auto_100921 ?auto_100922 ?auto_100923 ?auto_100924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100944 - BLOCK
      ?auto_100945 - BLOCK
    )
    :vars
    (
      ?auto_100947 - BLOCK
      ?auto_100948 - BLOCK
      ?auto_100946 - BLOCK
      ?auto_100949 - BLOCK
      ?auto_100950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100947 ?auto_100945 ) ( ON-TABLE ?auto_100944 ) ( ON ?auto_100945 ?auto_100944 ) ( not ( = ?auto_100944 ?auto_100945 ) ) ( not ( = ?auto_100944 ?auto_100947 ) ) ( not ( = ?auto_100945 ?auto_100947 ) ) ( not ( = ?auto_100944 ?auto_100948 ) ) ( not ( = ?auto_100944 ?auto_100946 ) ) ( not ( = ?auto_100945 ?auto_100948 ) ) ( not ( = ?auto_100945 ?auto_100946 ) ) ( not ( = ?auto_100947 ?auto_100948 ) ) ( not ( = ?auto_100947 ?auto_100946 ) ) ( not ( = ?auto_100948 ?auto_100946 ) ) ( ON ?auto_100948 ?auto_100947 ) ( CLEAR ?auto_100948 ) ( HOLDING ?auto_100946 ) ( CLEAR ?auto_100949 ) ( ON-TABLE ?auto_100950 ) ( ON ?auto_100949 ?auto_100950 ) ( not ( = ?auto_100950 ?auto_100949 ) ) ( not ( = ?auto_100950 ?auto_100946 ) ) ( not ( = ?auto_100949 ?auto_100946 ) ) ( not ( = ?auto_100944 ?auto_100949 ) ) ( not ( = ?auto_100944 ?auto_100950 ) ) ( not ( = ?auto_100945 ?auto_100949 ) ) ( not ( = ?auto_100945 ?auto_100950 ) ) ( not ( = ?auto_100947 ?auto_100949 ) ) ( not ( = ?auto_100947 ?auto_100950 ) ) ( not ( = ?auto_100948 ?auto_100949 ) ) ( not ( = ?auto_100948 ?auto_100950 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100950 ?auto_100949 ?auto_100946 )
      ( MAKE-2PILE ?auto_100944 ?auto_100945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100951 - BLOCK
      ?auto_100952 - BLOCK
    )
    :vars
    (
      ?auto_100957 - BLOCK
      ?auto_100955 - BLOCK
      ?auto_100954 - BLOCK
      ?auto_100953 - BLOCK
      ?auto_100956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100957 ?auto_100952 ) ( ON-TABLE ?auto_100951 ) ( ON ?auto_100952 ?auto_100951 ) ( not ( = ?auto_100951 ?auto_100952 ) ) ( not ( = ?auto_100951 ?auto_100957 ) ) ( not ( = ?auto_100952 ?auto_100957 ) ) ( not ( = ?auto_100951 ?auto_100955 ) ) ( not ( = ?auto_100951 ?auto_100954 ) ) ( not ( = ?auto_100952 ?auto_100955 ) ) ( not ( = ?auto_100952 ?auto_100954 ) ) ( not ( = ?auto_100957 ?auto_100955 ) ) ( not ( = ?auto_100957 ?auto_100954 ) ) ( not ( = ?auto_100955 ?auto_100954 ) ) ( ON ?auto_100955 ?auto_100957 ) ( CLEAR ?auto_100953 ) ( ON-TABLE ?auto_100956 ) ( ON ?auto_100953 ?auto_100956 ) ( not ( = ?auto_100956 ?auto_100953 ) ) ( not ( = ?auto_100956 ?auto_100954 ) ) ( not ( = ?auto_100953 ?auto_100954 ) ) ( not ( = ?auto_100951 ?auto_100953 ) ) ( not ( = ?auto_100951 ?auto_100956 ) ) ( not ( = ?auto_100952 ?auto_100953 ) ) ( not ( = ?auto_100952 ?auto_100956 ) ) ( not ( = ?auto_100957 ?auto_100953 ) ) ( not ( = ?auto_100957 ?auto_100956 ) ) ( not ( = ?auto_100955 ?auto_100953 ) ) ( not ( = ?auto_100955 ?auto_100956 ) ) ( ON ?auto_100954 ?auto_100955 ) ( CLEAR ?auto_100954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100951 ?auto_100952 ?auto_100957 ?auto_100955 )
      ( MAKE-2PILE ?auto_100951 ?auto_100952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100958 - BLOCK
      ?auto_100959 - BLOCK
    )
    :vars
    (
      ?auto_100960 - BLOCK
      ?auto_100963 - BLOCK
      ?auto_100964 - BLOCK
      ?auto_100962 - BLOCK
      ?auto_100961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100960 ?auto_100959 ) ( ON-TABLE ?auto_100958 ) ( ON ?auto_100959 ?auto_100958 ) ( not ( = ?auto_100958 ?auto_100959 ) ) ( not ( = ?auto_100958 ?auto_100960 ) ) ( not ( = ?auto_100959 ?auto_100960 ) ) ( not ( = ?auto_100958 ?auto_100963 ) ) ( not ( = ?auto_100958 ?auto_100964 ) ) ( not ( = ?auto_100959 ?auto_100963 ) ) ( not ( = ?auto_100959 ?auto_100964 ) ) ( not ( = ?auto_100960 ?auto_100963 ) ) ( not ( = ?auto_100960 ?auto_100964 ) ) ( not ( = ?auto_100963 ?auto_100964 ) ) ( ON ?auto_100963 ?auto_100960 ) ( ON-TABLE ?auto_100962 ) ( not ( = ?auto_100962 ?auto_100961 ) ) ( not ( = ?auto_100962 ?auto_100964 ) ) ( not ( = ?auto_100961 ?auto_100964 ) ) ( not ( = ?auto_100958 ?auto_100961 ) ) ( not ( = ?auto_100958 ?auto_100962 ) ) ( not ( = ?auto_100959 ?auto_100961 ) ) ( not ( = ?auto_100959 ?auto_100962 ) ) ( not ( = ?auto_100960 ?auto_100961 ) ) ( not ( = ?auto_100960 ?auto_100962 ) ) ( not ( = ?auto_100963 ?auto_100961 ) ) ( not ( = ?auto_100963 ?auto_100962 ) ) ( ON ?auto_100964 ?auto_100963 ) ( CLEAR ?auto_100964 ) ( HOLDING ?auto_100961 ) ( CLEAR ?auto_100962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100962 ?auto_100961 )
      ( MAKE-2PILE ?auto_100958 ?auto_100959 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100965 - BLOCK
      ?auto_100966 - BLOCK
    )
    :vars
    (
      ?auto_100967 - BLOCK
      ?auto_100971 - BLOCK
      ?auto_100969 - BLOCK
      ?auto_100970 - BLOCK
      ?auto_100968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100967 ?auto_100966 ) ( ON-TABLE ?auto_100965 ) ( ON ?auto_100966 ?auto_100965 ) ( not ( = ?auto_100965 ?auto_100966 ) ) ( not ( = ?auto_100965 ?auto_100967 ) ) ( not ( = ?auto_100966 ?auto_100967 ) ) ( not ( = ?auto_100965 ?auto_100971 ) ) ( not ( = ?auto_100965 ?auto_100969 ) ) ( not ( = ?auto_100966 ?auto_100971 ) ) ( not ( = ?auto_100966 ?auto_100969 ) ) ( not ( = ?auto_100967 ?auto_100971 ) ) ( not ( = ?auto_100967 ?auto_100969 ) ) ( not ( = ?auto_100971 ?auto_100969 ) ) ( ON ?auto_100971 ?auto_100967 ) ( ON-TABLE ?auto_100970 ) ( not ( = ?auto_100970 ?auto_100968 ) ) ( not ( = ?auto_100970 ?auto_100969 ) ) ( not ( = ?auto_100968 ?auto_100969 ) ) ( not ( = ?auto_100965 ?auto_100968 ) ) ( not ( = ?auto_100965 ?auto_100970 ) ) ( not ( = ?auto_100966 ?auto_100968 ) ) ( not ( = ?auto_100966 ?auto_100970 ) ) ( not ( = ?auto_100967 ?auto_100968 ) ) ( not ( = ?auto_100967 ?auto_100970 ) ) ( not ( = ?auto_100971 ?auto_100968 ) ) ( not ( = ?auto_100971 ?auto_100970 ) ) ( ON ?auto_100969 ?auto_100971 ) ( CLEAR ?auto_100970 ) ( ON ?auto_100968 ?auto_100969 ) ( CLEAR ?auto_100968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100965 ?auto_100966 ?auto_100967 ?auto_100971 ?auto_100969 )
      ( MAKE-2PILE ?auto_100965 ?auto_100966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100972 - BLOCK
      ?auto_100973 - BLOCK
    )
    :vars
    (
      ?auto_100976 - BLOCK
      ?auto_100977 - BLOCK
      ?auto_100974 - BLOCK
      ?auto_100978 - BLOCK
      ?auto_100975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100976 ?auto_100973 ) ( ON-TABLE ?auto_100972 ) ( ON ?auto_100973 ?auto_100972 ) ( not ( = ?auto_100972 ?auto_100973 ) ) ( not ( = ?auto_100972 ?auto_100976 ) ) ( not ( = ?auto_100973 ?auto_100976 ) ) ( not ( = ?auto_100972 ?auto_100977 ) ) ( not ( = ?auto_100972 ?auto_100974 ) ) ( not ( = ?auto_100973 ?auto_100977 ) ) ( not ( = ?auto_100973 ?auto_100974 ) ) ( not ( = ?auto_100976 ?auto_100977 ) ) ( not ( = ?auto_100976 ?auto_100974 ) ) ( not ( = ?auto_100977 ?auto_100974 ) ) ( ON ?auto_100977 ?auto_100976 ) ( not ( = ?auto_100978 ?auto_100975 ) ) ( not ( = ?auto_100978 ?auto_100974 ) ) ( not ( = ?auto_100975 ?auto_100974 ) ) ( not ( = ?auto_100972 ?auto_100975 ) ) ( not ( = ?auto_100972 ?auto_100978 ) ) ( not ( = ?auto_100973 ?auto_100975 ) ) ( not ( = ?auto_100973 ?auto_100978 ) ) ( not ( = ?auto_100976 ?auto_100975 ) ) ( not ( = ?auto_100976 ?auto_100978 ) ) ( not ( = ?auto_100977 ?auto_100975 ) ) ( not ( = ?auto_100977 ?auto_100978 ) ) ( ON ?auto_100974 ?auto_100977 ) ( ON ?auto_100975 ?auto_100974 ) ( CLEAR ?auto_100975 ) ( HOLDING ?auto_100978 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100978 )
      ( MAKE-2PILE ?auto_100972 ?auto_100973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100988 - BLOCK
      ?auto_100989 - BLOCK
    )
    :vars
    (
      ?auto_100994 - BLOCK
      ?auto_100993 - BLOCK
      ?auto_100991 - BLOCK
      ?auto_100992 - BLOCK
      ?auto_100990 - BLOCK
      ?auto_100995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100994 ?auto_100989 ) ( ON-TABLE ?auto_100988 ) ( ON ?auto_100989 ?auto_100988 ) ( not ( = ?auto_100988 ?auto_100989 ) ) ( not ( = ?auto_100988 ?auto_100994 ) ) ( not ( = ?auto_100989 ?auto_100994 ) ) ( not ( = ?auto_100988 ?auto_100993 ) ) ( not ( = ?auto_100988 ?auto_100991 ) ) ( not ( = ?auto_100989 ?auto_100993 ) ) ( not ( = ?auto_100989 ?auto_100991 ) ) ( not ( = ?auto_100994 ?auto_100993 ) ) ( not ( = ?auto_100994 ?auto_100991 ) ) ( not ( = ?auto_100993 ?auto_100991 ) ) ( ON ?auto_100993 ?auto_100994 ) ( not ( = ?auto_100992 ?auto_100990 ) ) ( not ( = ?auto_100992 ?auto_100991 ) ) ( not ( = ?auto_100990 ?auto_100991 ) ) ( not ( = ?auto_100988 ?auto_100990 ) ) ( not ( = ?auto_100988 ?auto_100992 ) ) ( not ( = ?auto_100989 ?auto_100990 ) ) ( not ( = ?auto_100989 ?auto_100992 ) ) ( not ( = ?auto_100994 ?auto_100990 ) ) ( not ( = ?auto_100994 ?auto_100992 ) ) ( not ( = ?auto_100993 ?auto_100990 ) ) ( not ( = ?auto_100993 ?auto_100992 ) ) ( ON ?auto_100991 ?auto_100993 ) ( ON ?auto_100990 ?auto_100991 ) ( CLEAR ?auto_100990 ) ( ON ?auto_100992 ?auto_100995 ) ( CLEAR ?auto_100992 ) ( HAND-EMPTY ) ( not ( = ?auto_100988 ?auto_100995 ) ) ( not ( = ?auto_100989 ?auto_100995 ) ) ( not ( = ?auto_100994 ?auto_100995 ) ) ( not ( = ?auto_100993 ?auto_100995 ) ) ( not ( = ?auto_100991 ?auto_100995 ) ) ( not ( = ?auto_100992 ?auto_100995 ) ) ( not ( = ?auto_100990 ?auto_100995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100992 ?auto_100995 )
      ( MAKE-2PILE ?auto_100988 ?auto_100989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100996 - BLOCK
      ?auto_100997 - BLOCK
    )
    :vars
    (
      ?auto_100998 - BLOCK
      ?auto_101003 - BLOCK
      ?auto_101000 - BLOCK
      ?auto_100999 - BLOCK
      ?auto_101001 - BLOCK
      ?auto_101002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100998 ?auto_100997 ) ( ON-TABLE ?auto_100996 ) ( ON ?auto_100997 ?auto_100996 ) ( not ( = ?auto_100996 ?auto_100997 ) ) ( not ( = ?auto_100996 ?auto_100998 ) ) ( not ( = ?auto_100997 ?auto_100998 ) ) ( not ( = ?auto_100996 ?auto_101003 ) ) ( not ( = ?auto_100996 ?auto_101000 ) ) ( not ( = ?auto_100997 ?auto_101003 ) ) ( not ( = ?auto_100997 ?auto_101000 ) ) ( not ( = ?auto_100998 ?auto_101003 ) ) ( not ( = ?auto_100998 ?auto_101000 ) ) ( not ( = ?auto_101003 ?auto_101000 ) ) ( ON ?auto_101003 ?auto_100998 ) ( not ( = ?auto_100999 ?auto_101001 ) ) ( not ( = ?auto_100999 ?auto_101000 ) ) ( not ( = ?auto_101001 ?auto_101000 ) ) ( not ( = ?auto_100996 ?auto_101001 ) ) ( not ( = ?auto_100996 ?auto_100999 ) ) ( not ( = ?auto_100997 ?auto_101001 ) ) ( not ( = ?auto_100997 ?auto_100999 ) ) ( not ( = ?auto_100998 ?auto_101001 ) ) ( not ( = ?auto_100998 ?auto_100999 ) ) ( not ( = ?auto_101003 ?auto_101001 ) ) ( not ( = ?auto_101003 ?auto_100999 ) ) ( ON ?auto_101000 ?auto_101003 ) ( ON ?auto_100999 ?auto_101002 ) ( CLEAR ?auto_100999 ) ( not ( = ?auto_100996 ?auto_101002 ) ) ( not ( = ?auto_100997 ?auto_101002 ) ) ( not ( = ?auto_100998 ?auto_101002 ) ) ( not ( = ?auto_101003 ?auto_101002 ) ) ( not ( = ?auto_101000 ?auto_101002 ) ) ( not ( = ?auto_100999 ?auto_101002 ) ) ( not ( = ?auto_101001 ?auto_101002 ) ) ( HOLDING ?auto_101001 ) ( CLEAR ?auto_101000 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100996 ?auto_100997 ?auto_100998 ?auto_101003 ?auto_101000 ?auto_101001 )
      ( MAKE-2PILE ?auto_100996 ?auto_100997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101004 - BLOCK
      ?auto_101005 - BLOCK
    )
    :vars
    (
      ?auto_101009 - BLOCK
      ?auto_101010 - BLOCK
      ?auto_101006 - BLOCK
      ?auto_101008 - BLOCK
      ?auto_101011 - BLOCK
      ?auto_101007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101009 ?auto_101005 ) ( ON-TABLE ?auto_101004 ) ( ON ?auto_101005 ?auto_101004 ) ( not ( = ?auto_101004 ?auto_101005 ) ) ( not ( = ?auto_101004 ?auto_101009 ) ) ( not ( = ?auto_101005 ?auto_101009 ) ) ( not ( = ?auto_101004 ?auto_101010 ) ) ( not ( = ?auto_101004 ?auto_101006 ) ) ( not ( = ?auto_101005 ?auto_101010 ) ) ( not ( = ?auto_101005 ?auto_101006 ) ) ( not ( = ?auto_101009 ?auto_101010 ) ) ( not ( = ?auto_101009 ?auto_101006 ) ) ( not ( = ?auto_101010 ?auto_101006 ) ) ( ON ?auto_101010 ?auto_101009 ) ( not ( = ?auto_101008 ?auto_101011 ) ) ( not ( = ?auto_101008 ?auto_101006 ) ) ( not ( = ?auto_101011 ?auto_101006 ) ) ( not ( = ?auto_101004 ?auto_101011 ) ) ( not ( = ?auto_101004 ?auto_101008 ) ) ( not ( = ?auto_101005 ?auto_101011 ) ) ( not ( = ?auto_101005 ?auto_101008 ) ) ( not ( = ?auto_101009 ?auto_101011 ) ) ( not ( = ?auto_101009 ?auto_101008 ) ) ( not ( = ?auto_101010 ?auto_101011 ) ) ( not ( = ?auto_101010 ?auto_101008 ) ) ( ON ?auto_101006 ?auto_101010 ) ( ON ?auto_101008 ?auto_101007 ) ( not ( = ?auto_101004 ?auto_101007 ) ) ( not ( = ?auto_101005 ?auto_101007 ) ) ( not ( = ?auto_101009 ?auto_101007 ) ) ( not ( = ?auto_101010 ?auto_101007 ) ) ( not ( = ?auto_101006 ?auto_101007 ) ) ( not ( = ?auto_101008 ?auto_101007 ) ) ( not ( = ?auto_101011 ?auto_101007 ) ) ( CLEAR ?auto_101006 ) ( ON ?auto_101011 ?auto_101008 ) ( CLEAR ?auto_101011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101007 ?auto_101008 )
      ( MAKE-2PILE ?auto_101004 ?auto_101005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101012 - BLOCK
      ?auto_101013 - BLOCK
    )
    :vars
    (
      ?auto_101018 - BLOCK
      ?auto_101019 - BLOCK
      ?auto_101015 - BLOCK
      ?auto_101017 - BLOCK
      ?auto_101014 - BLOCK
      ?auto_101016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101018 ?auto_101013 ) ( ON-TABLE ?auto_101012 ) ( ON ?auto_101013 ?auto_101012 ) ( not ( = ?auto_101012 ?auto_101013 ) ) ( not ( = ?auto_101012 ?auto_101018 ) ) ( not ( = ?auto_101013 ?auto_101018 ) ) ( not ( = ?auto_101012 ?auto_101019 ) ) ( not ( = ?auto_101012 ?auto_101015 ) ) ( not ( = ?auto_101013 ?auto_101019 ) ) ( not ( = ?auto_101013 ?auto_101015 ) ) ( not ( = ?auto_101018 ?auto_101019 ) ) ( not ( = ?auto_101018 ?auto_101015 ) ) ( not ( = ?auto_101019 ?auto_101015 ) ) ( ON ?auto_101019 ?auto_101018 ) ( not ( = ?auto_101017 ?auto_101014 ) ) ( not ( = ?auto_101017 ?auto_101015 ) ) ( not ( = ?auto_101014 ?auto_101015 ) ) ( not ( = ?auto_101012 ?auto_101014 ) ) ( not ( = ?auto_101012 ?auto_101017 ) ) ( not ( = ?auto_101013 ?auto_101014 ) ) ( not ( = ?auto_101013 ?auto_101017 ) ) ( not ( = ?auto_101018 ?auto_101014 ) ) ( not ( = ?auto_101018 ?auto_101017 ) ) ( not ( = ?auto_101019 ?auto_101014 ) ) ( not ( = ?auto_101019 ?auto_101017 ) ) ( ON ?auto_101017 ?auto_101016 ) ( not ( = ?auto_101012 ?auto_101016 ) ) ( not ( = ?auto_101013 ?auto_101016 ) ) ( not ( = ?auto_101018 ?auto_101016 ) ) ( not ( = ?auto_101019 ?auto_101016 ) ) ( not ( = ?auto_101015 ?auto_101016 ) ) ( not ( = ?auto_101017 ?auto_101016 ) ) ( not ( = ?auto_101014 ?auto_101016 ) ) ( ON ?auto_101014 ?auto_101017 ) ( CLEAR ?auto_101014 ) ( ON-TABLE ?auto_101016 ) ( HOLDING ?auto_101015 ) ( CLEAR ?auto_101019 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101012 ?auto_101013 ?auto_101018 ?auto_101019 ?auto_101015 )
      ( MAKE-2PILE ?auto_101012 ?auto_101013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101063 - BLOCK
      ?auto_101064 - BLOCK
      ?auto_101065 - BLOCK
      ?auto_101066 - BLOCK
      ?auto_101067 - BLOCK
    )
    :vars
    (
      ?auto_101068 - BLOCK
      ?auto_101069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101063 ) ( ON ?auto_101064 ?auto_101063 ) ( ON ?auto_101065 ?auto_101064 ) ( not ( = ?auto_101063 ?auto_101064 ) ) ( not ( = ?auto_101063 ?auto_101065 ) ) ( not ( = ?auto_101063 ?auto_101066 ) ) ( not ( = ?auto_101063 ?auto_101067 ) ) ( not ( = ?auto_101064 ?auto_101065 ) ) ( not ( = ?auto_101064 ?auto_101066 ) ) ( not ( = ?auto_101064 ?auto_101067 ) ) ( not ( = ?auto_101065 ?auto_101066 ) ) ( not ( = ?auto_101065 ?auto_101067 ) ) ( not ( = ?auto_101066 ?auto_101067 ) ) ( ON ?auto_101067 ?auto_101068 ) ( not ( = ?auto_101063 ?auto_101068 ) ) ( not ( = ?auto_101064 ?auto_101068 ) ) ( not ( = ?auto_101065 ?auto_101068 ) ) ( not ( = ?auto_101066 ?auto_101068 ) ) ( not ( = ?auto_101067 ?auto_101068 ) ) ( CLEAR ?auto_101065 ) ( ON ?auto_101066 ?auto_101067 ) ( CLEAR ?auto_101066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101069 ) ( ON ?auto_101068 ?auto_101069 ) ( not ( = ?auto_101069 ?auto_101068 ) ) ( not ( = ?auto_101069 ?auto_101067 ) ) ( not ( = ?auto_101069 ?auto_101066 ) ) ( not ( = ?auto_101063 ?auto_101069 ) ) ( not ( = ?auto_101064 ?auto_101069 ) ) ( not ( = ?auto_101065 ?auto_101069 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101069 ?auto_101068 ?auto_101067 )
      ( MAKE-5PILE ?auto_101063 ?auto_101064 ?auto_101065 ?auto_101066 ?auto_101067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101070 - BLOCK
      ?auto_101071 - BLOCK
      ?auto_101072 - BLOCK
      ?auto_101073 - BLOCK
      ?auto_101074 - BLOCK
    )
    :vars
    (
      ?auto_101076 - BLOCK
      ?auto_101075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101070 ) ( ON ?auto_101071 ?auto_101070 ) ( not ( = ?auto_101070 ?auto_101071 ) ) ( not ( = ?auto_101070 ?auto_101072 ) ) ( not ( = ?auto_101070 ?auto_101073 ) ) ( not ( = ?auto_101070 ?auto_101074 ) ) ( not ( = ?auto_101071 ?auto_101072 ) ) ( not ( = ?auto_101071 ?auto_101073 ) ) ( not ( = ?auto_101071 ?auto_101074 ) ) ( not ( = ?auto_101072 ?auto_101073 ) ) ( not ( = ?auto_101072 ?auto_101074 ) ) ( not ( = ?auto_101073 ?auto_101074 ) ) ( ON ?auto_101074 ?auto_101076 ) ( not ( = ?auto_101070 ?auto_101076 ) ) ( not ( = ?auto_101071 ?auto_101076 ) ) ( not ( = ?auto_101072 ?auto_101076 ) ) ( not ( = ?auto_101073 ?auto_101076 ) ) ( not ( = ?auto_101074 ?auto_101076 ) ) ( ON ?auto_101073 ?auto_101074 ) ( CLEAR ?auto_101073 ) ( ON-TABLE ?auto_101075 ) ( ON ?auto_101076 ?auto_101075 ) ( not ( = ?auto_101075 ?auto_101076 ) ) ( not ( = ?auto_101075 ?auto_101074 ) ) ( not ( = ?auto_101075 ?auto_101073 ) ) ( not ( = ?auto_101070 ?auto_101075 ) ) ( not ( = ?auto_101071 ?auto_101075 ) ) ( not ( = ?auto_101072 ?auto_101075 ) ) ( HOLDING ?auto_101072 ) ( CLEAR ?auto_101071 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101070 ?auto_101071 ?auto_101072 )
      ( MAKE-5PILE ?auto_101070 ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101077 - BLOCK
      ?auto_101078 - BLOCK
      ?auto_101079 - BLOCK
      ?auto_101080 - BLOCK
      ?auto_101081 - BLOCK
    )
    :vars
    (
      ?auto_101083 - BLOCK
      ?auto_101082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101077 ) ( ON ?auto_101078 ?auto_101077 ) ( not ( = ?auto_101077 ?auto_101078 ) ) ( not ( = ?auto_101077 ?auto_101079 ) ) ( not ( = ?auto_101077 ?auto_101080 ) ) ( not ( = ?auto_101077 ?auto_101081 ) ) ( not ( = ?auto_101078 ?auto_101079 ) ) ( not ( = ?auto_101078 ?auto_101080 ) ) ( not ( = ?auto_101078 ?auto_101081 ) ) ( not ( = ?auto_101079 ?auto_101080 ) ) ( not ( = ?auto_101079 ?auto_101081 ) ) ( not ( = ?auto_101080 ?auto_101081 ) ) ( ON ?auto_101081 ?auto_101083 ) ( not ( = ?auto_101077 ?auto_101083 ) ) ( not ( = ?auto_101078 ?auto_101083 ) ) ( not ( = ?auto_101079 ?auto_101083 ) ) ( not ( = ?auto_101080 ?auto_101083 ) ) ( not ( = ?auto_101081 ?auto_101083 ) ) ( ON ?auto_101080 ?auto_101081 ) ( ON-TABLE ?auto_101082 ) ( ON ?auto_101083 ?auto_101082 ) ( not ( = ?auto_101082 ?auto_101083 ) ) ( not ( = ?auto_101082 ?auto_101081 ) ) ( not ( = ?auto_101082 ?auto_101080 ) ) ( not ( = ?auto_101077 ?auto_101082 ) ) ( not ( = ?auto_101078 ?auto_101082 ) ) ( not ( = ?auto_101079 ?auto_101082 ) ) ( CLEAR ?auto_101078 ) ( ON ?auto_101079 ?auto_101080 ) ( CLEAR ?auto_101079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101082 ?auto_101083 ?auto_101081 ?auto_101080 )
      ( MAKE-5PILE ?auto_101077 ?auto_101078 ?auto_101079 ?auto_101080 ?auto_101081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101084 - BLOCK
      ?auto_101085 - BLOCK
      ?auto_101086 - BLOCK
      ?auto_101087 - BLOCK
      ?auto_101088 - BLOCK
    )
    :vars
    (
      ?auto_101090 - BLOCK
      ?auto_101089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101084 ) ( not ( = ?auto_101084 ?auto_101085 ) ) ( not ( = ?auto_101084 ?auto_101086 ) ) ( not ( = ?auto_101084 ?auto_101087 ) ) ( not ( = ?auto_101084 ?auto_101088 ) ) ( not ( = ?auto_101085 ?auto_101086 ) ) ( not ( = ?auto_101085 ?auto_101087 ) ) ( not ( = ?auto_101085 ?auto_101088 ) ) ( not ( = ?auto_101086 ?auto_101087 ) ) ( not ( = ?auto_101086 ?auto_101088 ) ) ( not ( = ?auto_101087 ?auto_101088 ) ) ( ON ?auto_101088 ?auto_101090 ) ( not ( = ?auto_101084 ?auto_101090 ) ) ( not ( = ?auto_101085 ?auto_101090 ) ) ( not ( = ?auto_101086 ?auto_101090 ) ) ( not ( = ?auto_101087 ?auto_101090 ) ) ( not ( = ?auto_101088 ?auto_101090 ) ) ( ON ?auto_101087 ?auto_101088 ) ( ON-TABLE ?auto_101089 ) ( ON ?auto_101090 ?auto_101089 ) ( not ( = ?auto_101089 ?auto_101090 ) ) ( not ( = ?auto_101089 ?auto_101088 ) ) ( not ( = ?auto_101089 ?auto_101087 ) ) ( not ( = ?auto_101084 ?auto_101089 ) ) ( not ( = ?auto_101085 ?auto_101089 ) ) ( not ( = ?auto_101086 ?auto_101089 ) ) ( ON ?auto_101086 ?auto_101087 ) ( CLEAR ?auto_101086 ) ( HOLDING ?auto_101085 ) ( CLEAR ?auto_101084 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101084 ?auto_101085 )
      ( MAKE-5PILE ?auto_101084 ?auto_101085 ?auto_101086 ?auto_101087 ?auto_101088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101091 - BLOCK
      ?auto_101092 - BLOCK
      ?auto_101093 - BLOCK
      ?auto_101094 - BLOCK
      ?auto_101095 - BLOCK
    )
    :vars
    (
      ?auto_101096 - BLOCK
      ?auto_101097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101091 ) ( not ( = ?auto_101091 ?auto_101092 ) ) ( not ( = ?auto_101091 ?auto_101093 ) ) ( not ( = ?auto_101091 ?auto_101094 ) ) ( not ( = ?auto_101091 ?auto_101095 ) ) ( not ( = ?auto_101092 ?auto_101093 ) ) ( not ( = ?auto_101092 ?auto_101094 ) ) ( not ( = ?auto_101092 ?auto_101095 ) ) ( not ( = ?auto_101093 ?auto_101094 ) ) ( not ( = ?auto_101093 ?auto_101095 ) ) ( not ( = ?auto_101094 ?auto_101095 ) ) ( ON ?auto_101095 ?auto_101096 ) ( not ( = ?auto_101091 ?auto_101096 ) ) ( not ( = ?auto_101092 ?auto_101096 ) ) ( not ( = ?auto_101093 ?auto_101096 ) ) ( not ( = ?auto_101094 ?auto_101096 ) ) ( not ( = ?auto_101095 ?auto_101096 ) ) ( ON ?auto_101094 ?auto_101095 ) ( ON-TABLE ?auto_101097 ) ( ON ?auto_101096 ?auto_101097 ) ( not ( = ?auto_101097 ?auto_101096 ) ) ( not ( = ?auto_101097 ?auto_101095 ) ) ( not ( = ?auto_101097 ?auto_101094 ) ) ( not ( = ?auto_101091 ?auto_101097 ) ) ( not ( = ?auto_101092 ?auto_101097 ) ) ( not ( = ?auto_101093 ?auto_101097 ) ) ( ON ?auto_101093 ?auto_101094 ) ( CLEAR ?auto_101091 ) ( ON ?auto_101092 ?auto_101093 ) ( CLEAR ?auto_101092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101097 ?auto_101096 ?auto_101095 ?auto_101094 ?auto_101093 )
      ( MAKE-5PILE ?auto_101091 ?auto_101092 ?auto_101093 ?auto_101094 ?auto_101095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101098 - BLOCK
      ?auto_101099 - BLOCK
      ?auto_101100 - BLOCK
      ?auto_101101 - BLOCK
      ?auto_101102 - BLOCK
    )
    :vars
    (
      ?auto_101104 - BLOCK
      ?auto_101103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101098 ?auto_101099 ) ) ( not ( = ?auto_101098 ?auto_101100 ) ) ( not ( = ?auto_101098 ?auto_101101 ) ) ( not ( = ?auto_101098 ?auto_101102 ) ) ( not ( = ?auto_101099 ?auto_101100 ) ) ( not ( = ?auto_101099 ?auto_101101 ) ) ( not ( = ?auto_101099 ?auto_101102 ) ) ( not ( = ?auto_101100 ?auto_101101 ) ) ( not ( = ?auto_101100 ?auto_101102 ) ) ( not ( = ?auto_101101 ?auto_101102 ) ) ( ON ?auto_101102 ?auto_101104 ) ( not ( = ?auto_101098 ?auto_101104 ) ) ( not ( = ?auto_101099 ?auto_101104 ) ) ( not ( = ?auto_101100 ?auto_101104 ) ) ( not ( = ?auto_101101 ?auto_101104 ) ) ( not ( = ?auto_101102 ?auto_101104 ) ) ( ON ?auto_101101 ?auto_101102 ) ( ON-TABLE ?auto_101103 ) ( ON ?auto_101104 ?auto_101103 ) ( not ( = ?auto_101103 ?auto_101104 ) ) ( not ( = ?auto_101103 ?auto_101102 ) ) ( not ( = ?auto_101103 ?auto_101101 ) ) ( not ( = ?auto_101098 ?auto_101103 ) ) ( not ( = ?auto_101099 ?auto_101103 ) ) ( not ( = ?auto_101100 ?auto_101103 ) ) ( ON ?auto_101100 ?auto_101101 ) ( ON ?auto_101099 ?auto_101100 ) ( CLEAR ?auto_101099 ) ( HOLDING ?auto_101098 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101098 )
      ( MAKE-5PILE ?auto_101098 ?auto_101099 ?auto_101100 ?auto_101101 ?auto_101102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101105 - BLOCK
      ?auto_101106 - BLOCK
      ?auto_101107 - BLOCK
      ?auto_101108 - BLOCK
      ?auto_101109 - BLOCK
    )
    :vars
    (
      ?auto_101110 - BLOCK
      ?auto_101111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101105 ?auto_101106 ) ) ( not ( = ?auto_101105 ?auto_101107 ) ) ( not ( = ?auto_101105 ?auto_101108 ) ) ( not ( = ?auto_101105 ?auto_101109 ) ) ( not ( = ?auto_101106 ?auto_101107 ) ) ( not ( = ?auto_101106 ?auto_101108 ) ) ( not ( = ?auto_101106 ?auto_101109 ) ) ( not ( = ?auto_101107 ?auto_101108 ) ) ( not ( = ?auto_101107 ?auto_101109 ) ) ( not ( = ?auto_101108 ?auto_101109 ) ) ( ON ?auto_101109 ?auto_101110 ) ( not ( = ?auto_101105 ?auto_101110 ) ) ( not ( = ?auto_101106 ?auto_101110 ) ) ( not ( = ?auto_101107 ?auto_101110 ) ) ( not ( = ?auto_101108 ?auto_101110 ) ) ( not ( = ?auto_101109 ?auto_101110 ) ) ( ON ?auto_101108 ?auto_101109 ) ( ON-TABLE ?auto_101111 ) ( ON ?auto_101110 ?auto_101111 ) ( not ( = ?auto_101111 ?auto_101110 ) ) ( not ( = ?auto_101111 ?auto_101109 ) ) ( not ( = ?auto_101111 ?auto_101108 ) ) ( not ( = ?auto_101105 ?auto_101111 ) ) ( not ( = ?auto_101106 ?auto_101111 ) ) ( not ( = ?auto_101107 ?auto_101111 ) ) ( ON ?auto_101107 ?auto_101108 ) ( ON ?auto_101106 ?auto_101107 ) ( ON ?auto_101105 ?auto_101106 ) ( CLEAR ?auto_101105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101111 ?auto_101110 ?auto_101109 ?auto_101108 ?auto_101107 ?auto_101106 )
      ( MAKE-5PILE ?auto_101105 ?auto_101106 ?auto_101107 ?auto_101108 ?auto_101109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101117 - BLOCK
      ?auto_101118 - BLOCK
      ?auto_101119 - BLOCK
      ?auto_101120 - BLOCK
      ?auto_101121 - BLOCK
    )
    :vars
    (
      ?auto_101122 - BLOCK
      ?auto_101123 - BLOCK
      ?auto_101124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101117 ?auto_101118 ) ) ( not ( = ?auto_101117 ?auto_101119 ) ) ( not ( = ?auto_101117 ?auto_101120 ) ) ( not ( = ?auto_101117 ?auto_101121 ) ) ( not ( = ?auto_101118 ?auto_101119 ) ) ( not ( = ?auto_101118 ?auto_101120 ) ) ( not ( = ?auto_101118 ?auto_101121 ) ) ( not ( = ?auto_101119 ?auto_101120 ) ) ( not ( = ?auto_101119 ?auto_101121 ) ) ( not ( = ?auto_101120 ?auto_101121 ) ) ( ON ?auto_101121 ?auto_101122 ) ( not ( = ?auto_101117 ?auto_101122 ) ) ( not ( = ?auto_101118 ?auto_101122 ) ) ( not ( = ?auto_101119 ?auto_101122 ) ) ( not ( = ?auto_101120 ?auto_101122 ) ) ( not ( = ?auto_101121 ?auto_101122 ) ) ( ON ?auto_101120 ?auto_101121 ) ( ON-TABLE ?auto_101123 ) ( ON ?auto_101122 ?auto_101123 ) ( not ( = ?auto_101123 ?auto_101122 ) ) ( not ( = ?auto_101123 ?auto_101121 ) ) ( not ( = ?auto_101123 ?auto_101120 ) ) ( not ( = ?auto_101117 ?auto_101123 ) ) ( not ( = ?auto_101118 ?auto_101123 ) ) ( not ( = ?auto_101119 ?auto_101123 ) ) ( ON ?auto_101119 ?auto_101120 ) ( ON ?auto_101118 ?auto_101119 ) ( CLEAR ?auto_101118 ) ( ON ?auto_101117 ?auto_101124 ) ( CLEAR ?auto_101117 ) ( HAND-EMPTY ) ( not ( = ?auto_101117 ?auto_101124 ) ) ( not ( = ?auto_101118 ?auto_101124 ) ) ( not ( = ?auto_101119 ?auto_101124 ) ) ( not ( = ?auto_101120 ?auto_101124 ) ) ( not ( = ?auto_101121 ?auto_101124 ) ) ( not ( = ?auto_101122 ?auto_101124 ) ) ( not ( = ?auto_101123 ?auto_101124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101117 ?auto_101124 )
      ( MAKE-5PILE ?auto_101117 ?auto_101118 ?auto_101119 ?auto_101120 ?auto_101121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101125 - BLOCK
      ?auto_101126 - BLOCK
      ?auto_101127 - BLOCK
      ?auto_101128 - BLOCK
      ?auto_101129 - BLOCK
    )
    :vars
    (
      ?auto_101132 - BLOCK
      ?auto_101131 - BLOCK
      ?auto_101130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101125 ?auto_101126 ) ) ( not ( = ?auto_101125 ?auto_101127 ) ) ( not ( = ?auto_101125 ?auto_101128 ) ) ( not ( = ?auto_101125 ?auto_101129 ) ) ( not ( = ?auto_101126 ?auto_101127 ) ) ( not ( = ?auto_101126 ?auto_101128 ) ) ( not ( = ?auto_101126 ?auto_101129 ) ) ( not ( = ?auto_101127 ?auto_101128 ) ) ( not ( = ?auto_101127 ?auto_101129 ) ) ( not ( = ?auto_101128 ?auto_101129 ) ) ( ON ?auto_101129 ?auto_101132 ) ( not ( = ?auto_101125 ?auto_101132 ) ) ( not ( = ?auto_101126 ?auto_101132 ) ) ( not ( = ?auto_101127 ?auto_101132 ) ) ( not ( = ?auto_101128 ?auto_101132 ) ) ( not ( = ?auto_101129 ?auto_101132 ) ) ( ON ?auto_101128 ?auto_101129 ) ( ON-TABLE ?auto_101131 ) ( ON ?auto_101132 ?auto_101131 ) ( not ( = ?auto_101131 ?auto_101132 ) ) ( not ( = ?auto_101131 ?auto_101129 ) ) ( not ( = ?auto_101131 ?auto_101128 ) ) ( not ( = ?auto_101125 ?auto_101131 ) ) ( not ( = ?auto_101126 ?auto_101131 ) ) ( not ( = ?auto_101127 ?auto_101131 ) ) ( ON ?auto_101127 ?auto_101128 ) ( ON ?auto_101125 ?auto_101130 ) ( CLEAR ?auto_101125 ) ( not ( = ?auto_101125 ?auto_101130 ) ) ( not ( = ?auto_101126 ?auto_101130 ) ) ( not ( = ?auto_101127 ?auto_101130 ) ) ( not ( = ?auto_101128 ?auto_101130 ) ) ( not ( = ?auto_101129 ?auto_101130 ) ) ( not ( = ?auto_101132 ?auto_101130 ) ) ( not ( = ?auto_101131 ?auto_101130 ) ) ( HOLDING ?auto_101126 ) ( CLEAR ?auto_101127 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101131 ?auto_101132 ?auto_101129 ?auto_101128 ?auto_101127 ?auto_101126 )
      ( MAKE-5PILE ?auto_101125 ?auto_101126 ?auto_101127 ?auto_101128 ?auto_101129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101133 - BLOCK
      ?auto_101134 - BLOCK
      ?auto_101135 - BLOCK
      ?auto_101136 - BLOCK
      ?auto_101137 - BLOCK
    )
    :vars
    (
      ?auto_101140 - BLOCK
      ?auto_101138 - BLOCK
      ?auto_101139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101133 ?auto_101134 ) ) ( not ( = ?auto_101133 ?auto_101135 ) ) ( not ( = ?auto_101133 ?auto_101136 ) ) ( not ( = ?auto_101133 ?auto_101137 ) ) ( not ( = ?auto_101134 ?auto_101135 ) ) ( not ( = ?auto_101134 ?auto_101136 ) ) ( not ( = ?auto_101134 ?auto_101137 ) ) ( not ( = ?auto_101135 ?auto_101136 ) ) ( not ( = ?auto_101135 ?auto_101137 ) ) ( not ( = ?auto_101136 ?auto_101137 ) ) ( ON ?auto_101137 ?auto_101140 ) ( not ( = ?auto_101133 ?auto_101140 ) ) ( not ( = ?auto_101134 ?auto_101140 ) ) ( not ( = ?auto_101135 ?auto_101140 ) ) ( not ( = ?auto_101136 ?auto_101140 ) ) ( not ( = ?auto_101137 ?auto_101140 ) ) ( ON ?auto_101136 ?auto_101137 ) ( ON-TABLE ?auto_101138 ) ( ON ?auto_101140 ?auto_101138 ) ( not ( = ?auto_101138 ?auto_101140 ) ) ( not ( = ?auto_101138 ?auto_101137 ) ) ( not ( = ?auto_101138 ?auto_101136 ) ) ( not ( = ?auto_101133 ?auto_101138 ) ) ( not ( = ?auto_101134 ?auto_101138 ) ) ( not ( = ?auto_101135 ?auto_101138 ) ) ( ON ?auto_101135 ?auto_101136 ) ( ON ?auto_101133 ?auto_101139 ) ( not ( = ?auto_101133 ?auto_101139 ) ) ( not ( = ?auto_101134 ?auto_101139 ) ) ( not ( = ?auto_101135 ?auto_101139 ) ) ( not ( = ?auto_101136 ?auto_101139 ) ) ( not ( = ?auto_101137 ?auto_101139 ) ) ( not ( = ?auto_101140 ?auto_101139 ) ) ( not ( = ?auto_101138 ?auto_101139 ) ) ( CLEAR ?auto_101135 ) ( ON ?auto_101134 ?auto_101133 ) ( CLEAR ?auto_101134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101139 ?auto_101133 )
      ( MAKE-5PILE ?auto_101133 ?auto_101134 ?auto_101135 ?auto_101136 ?auto_101137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101141 - BLOCK
      ?auto_101142 - BLOCK
      ?auto_101143 - BLOCK
      ?auto_101144 - BLOCK
      ?auto_101145 - BLOCK
    )
    :vars
    (
      ?auto_101146 - BLOCK
      ?auto_101147 - BLOCK
      ?auto_101148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101141 ?auto_101142 ) ) ( not ( = ?auto_101141 ?auto_101143 ) ) ( not ( = ?auto_101141 ?auto_101144 ) ) ( not ( = ?auto_101141 ?auto_101145 ) ) ( not ( = ?auto_101142 ?auto_101143 ) ) ( not ( = ?auto_101142 ?auto_101144 ) ) ( not ( = ?auto_101142 ?auto_101145 ) ) ( not ( = ?auto_101143 ?auto_101144 ) ) ( not ( = ?auto_101143 ?auto_101145 ) ) ( not ( = ?auto_101144 ?auto_101145 ) ) ( ON ?auto_101145 ?auto_101146 ) ( not ( = ?auto_101141 ?auto_101146 ) ) ( not ( = ?auto_101142 ?auto_101146 ) ) ( not ( = ?auto_101143 ?auto_101146 ) ) ( not ( = ?auto_101144 ?auto_101146 ) ) ( not ( = ?auto_101145 ?auto_101146 ) ) ( ON ?auto_101144 ?auto_101145 ) ( ON-TABLE ?auto_101147 ) ( ON ?auto_101146 ?auto_101147 ) ( not ( = ?auto_101147 ?auto_101146 ) ) ( not ( = ?auto_101147 ?auto_101145 ) ) ( not ( = ?auto_101147 ?auto_101144 ) ) ( not ( = ?auto_101141 ?auto_101147 ) ) ( not ( = ?auto_101142 ?auto_101147 ) ) ( not ( = ?auto_101143 ?auto_101147 ) ) ( ON ?auto_101141 ?auto_101148 ) ( not ( = ?auto_101141 ?auto_101148 ) ) ( not ( = ?auto_101142 ?auto_101148 ) ) ( not ( = ?auto_101143 ?auto_101148 ) ) ( not ( = ?auto_101144 ?auto_101148 ) ) ( not ( = ?auto_101145 ?auto_101148 ) ) ( not ( = ?auto_101146 ?auto_101148 ) ) ( not ( = ?auto_101147 ?auto_101148 ) ) ( ON ?auto_101142 ?auto_101141 ) ( CLEAR ?auto_101142 ) ( ON-TABLE ?auto_101148 ) ( HOLDING ?auto_101143 ) ( CLEAR ?auto_101144 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101147 ?auto_101146 ?auto_101145 ?auto_101144 ?auto_101143 )
      ( MAKE-5PILE ?auto_101141 ?auto_101142 ?auto_101143 ?auto_101144 ?auto_101145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101149 - BLOCK
      ?auto_101150 - BLOCK
      ?auto_101151 - BLOCK
      ?auto_101152 - BLOCK
      ?auto_101153 - BLOCK
    )
    :vars
    (
      ?auto_101154 - BLOCK
      ?auto_101156 - BLOCK
      ?auto_101155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101149 ?auto_101150 ) ) ( not ( = ?auto_101149 ?auto_101151 ) ) ( not ( = ?auto_101149 ?auto_101152 ) ) ( not ( = ?auto_101149 ?auto_101153 ) ) ( not ( = ?auto_101150 ?auto_101151 ) ) ( not ( = ?auto_101150 ?auto_101152 ) ) ( not ( = ?auto_101150 ?auto_101153 ) ) ( not ( = ?auto_101151 ?auto_101152 ) ) ( not ( = ?auto_101151 ?auto_101153 ) ) ( not ( = ?auto_101152 ?auto_101153 ) ) ( ON ?auto_101153 ?auto_101154 ) ( not ( = ?auto_101149 ?auto_101154 ) ) ( not ( = ?auto_101150 ?auto_101154 ) ) ( not ( = ?auto_101151 ?auto_101154 ) ) ( not ( = ?auto_101152 ?auto_101154 ) ) ( not ( = ?auto_101153 ?auto_101154 ) ) ( ON ?auto_101152 ?auto_101153 ) ( ON-TABLE ?auto_101156 ) ( ON ?auto_101154 ?auto_101156 ) ( not ( = ?auto_101156 ?auto_101154 ) ) ( not ( = ?auto_101156 ?auto_101153 ) ) ( not ( = ?auto_101156 ?auto_101152 ) ) ( not ( = ?auto_101149 ?auto_101156 ) ) ( not ( = ?auto_101150 ?auto_101156 ) ) ( not ( = ?auto_101151 ?auto_101156 ) ) ( ON ?auto_101149 ?auto_101155 ) ( not ( = ?auto_101149 ?auto_101155 ) ) ( not ( = ?auto_101150 ?auto_101155 ) ) ( not ( = ?auto_101151 ?auto_101155 ) ) ( not ( = ?auto_101152 ?auto_101155 ) ) ( not ( = ?auto_101153 ?auto_101155 ) ) ( not ( = ?auto_101154 ?auto_101155 ) ) ( not ( = ?auto_101156 ?auto_101155 ) ) ( ON ?auto_101150 ?auto_101149 ) ( ON-TABLE ?auto_101155 ) ( CLEAR ?auto_101152 ) ( ON ?auto_101151 ?auto_101150 ) ( CLEAR ?auto_101151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101155 ?auto_101149 ?auto_101150 )
      ( MAKE-5PILE ?auto_101149 ?auto_101150 ?auto_101151 ?auto_101152 ?auto_101153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101157 - BLOCK
      ?auto_101158 - BLOCK
      ?auto_101159 - BLOCK
      ?auto_101160 - BLOCK
      ?auto_101161 - BLOCK
    )
    :vars
    (
      ?auto_101163 - BLOCK
      ?auto_101162 - BLOCK
      ?auto_101164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101157 ?auto_101158 ) ) ( not ( = ?auto_101157 ?auto_101159 ) ) ( not ( = ?auto_101157 ?auto_101160 ) ) ( not ( = ?auto_101157 ?auto_101161 ) ) ( not ( = ?auto_101158 ?auto_101159 ) ) ( not ( = ?auto_101158 ?auto_101160 ) ) ( not ( = ?auto_101158 ?auto_101161 ) ) ( not ( = ?auto_101159 ?auto_101160 ) ) ( not ( = ?auto_101159 ?auto_101161 ) ) ( not ( = ?auto_101160 ?auto_101161 ) ) ( ON ?auto_101161 ?auto_101163 ) ( not ( = ?auto_101157 ?auto_101163 ) ) ( not ( = ?auto_101158 ?auto_101163 ) ) ( not ( = ?auto_101159 ?auto_101163 ) ) ( not ( = ?auto_101160 ?auto_101163 ) ) ( not ( = ?auto_101161 ?auto_101163 ) ) ( ON-TABLE ?auto_101162 ) ( ON ?auto_101163 ?auto_101162 ) ( not ( = ?auto_101162 ?auto_101163 ) ) ( not ( = ?auto_101162 ?auto_101161 ) ) ( not ( = ?auto_101162 ?auto_101160 ) ) ( not ( = ?auto_101157 ?auto_101162 ) ) ( not ( = ?auto_101158 ?auto_101162 ) ) ( not ( = ?auto_101159 ?auto_101162 ) ) ( ON ?auto_101157 ?auto_101164 ) ( not ( = ?auto_101157 ?auto_101164 ) ) ( not ( = ?auto_101158 ?auto_101164 ) ) ( not ( = ?auto_101159 ?auto_101164 ) ) ( not ( = ?auto_101160 ?auto_101164 ) ) ( not ( = ?auto_101161 ?auto_101164 ) ) ( not ( = ?auto_101163 ?auto_101164 ) ) ( not ( = ?auto_101162 ?auto_101164 ) ) ( ON ?auto_101158 ?auto_101157 ) ( ON-TABLE ?auto_101164 ) ( ON ?auto_101159 ?auto_101158 ) ( CLEAR ?auto_101159 ) ( HOLDING ?auto_101160 ) ( CLEAR ?auto_101161 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101162 ?auto_101163 ?auto_101161 ?auto_101160 )
      ( MAKE-5PILE ?auto_101157 ?auto_101158 ?auto_101159 ?auto_101160 ?auto_101161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101165 - BLOCK
      ?auto_101166 - BLOCK
      ?auto_101167 - BLOCK
      ?auto_101168 - BLOCK
      ?auto_101169 - BLOCK
    )
    :vars
    (
      ?auto_101172 - BLOCK
      ?auto_101171 - BLOCK
      ?auto_101170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101165 ?auto_101166 ) ) ( not ( = ?auto_101165 ?auto_101167 ) ) ( not ( = ?auto_101165 ?auto_101168 ) ) ( not ( = ?auto_101165 ?auto_101169 ) ) ( not ( = ?auto_101166 ?auto_101167 ) ) ( not ( = ?auto_101166 ?auto_101168 ) ) ( not ( = ?auto_101166 ?auto_101169 ) ) ( not ( = ?auto_101167 ?auto_101168 ) ) ( not ( = ?auto_101167 ?auto_101169 ) ) ( not ( = ?auto_101168 ?auto_101169 ) ) ( ON ?auto_101169 ?auto_101172 ) ( not ( = ?auto_101165 ?auto_101172 ) ) ( not ( = ?auto_101166 ?auto_101172 ) ) ( not ( = ?auto_101167 ?auto_101172 ) ) ( not ( = ?auto_101168 ?auto_101172 ) ) ( not ( = ?auto_101169 ?auto_101172 ) ) ( ON-TABLE ?auto_101171 ) ( ON ?auto_101172 ?auto_101171 ) ( not ( = ?auto_101171 ?auto_101172 ) ) ( not ( = ?auto_101171 ?auto_101169 ) ) ( not ( = ?auto_101171 ?auto_101168 ) ) ( not ( = ?auto_101165 ?auto_101171 ) ) ( not ( = ?auto_101166 ?auto_101171 ) ) ( not ( = ?auto_101167 ?auto_101171 ) ) ( ON ?auto_101165 ?auto_101170 ) ( not ( = ?auto_101165 ?auto_101170 ) ) ( not ( = ?auto_101166 ?auto_101170 ) ) ( not ( = ?auto_101167 ?auto_101170 ) ) ( not ( = ?auto_101168 ?auto_101170 ) ) ( not ( = ?auto_101169 ?auto_101170 ) ) ( not ( = ?auto_101172 ?auto_101170 ) ) ( not ( = ?auto_101171 ?auto_101170 ) ) ( ON ?auto_101166 ?auto_101165 ) ( ON-TABLE ?auto_101170 ) ( ON ?auto_101167 ?auto_101166 ) ( CLEAR ?auto_101169 ) ( ON ?auto_101168 ?auto_101167 ) ( CLEAR ?auto_101168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101170 ?auto_101165 ?auto_101166 ?auto_101167 )
      ( MAKE-5PILE ?auto_101165 ?auto_101166 ?auto_101167 ?auto_101168 ?auto_101169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101173 - BLOCK
      ?auto_101174 - BLOCK
      ?auto_101175 - BLOCK
      ?auto_101176 - BLOCK
      ?auto_101177 - BLOCK
    )
    :vars
    (
      ?auto_101180 - BLOCK
      ?auto_101179 - BLOCK
      ?auto_101178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101173 ?auto_101174 ) ) ( not ( = ?auto_101173 ?auto_101175 ) ) ( not ( = ?auto_101173 ?auto_101176 ) ) ( not ( = ?auto_101173 ?auto_101177 ) ) ( not ( = ?auto_101174 ?auto_101175 ) ) ( not ( = ?auto_101174 ?auto_101176 ) ) ( not ( = ?auto_101174 ?auto_101177 ) ) ( not ( = ?auto_101175 ?auto_101176 ) ) ( not ( = ?auto_101175 ?auto_101177 ) ) ( not ( = ?auto_101176 ?auto_101177 ) ) ( not ( = ?auto_101173 ?auto_101180 ) ) ( not ( = ?auto_101174 ?auto_101180 ) ) ( not ( = ?auto_101175 ?auto_101180 ) ) ( not ( = ?auto_101176 ?auto_101180 ) ) ( not ( = ?auto_101177 ?auto_101180 ) ) ( ON-TABLE ?auto_101179 ) ( ON ?auto_101180 ?auto_101179 ) ( not ( = ?auto_101179 ?auto_101180 ) ) ( not ( = ?auto_101179 ?auto_101177 ) ) ( not ( = ?auto_101179 ?auto_101176 ) ) ( not ( = ?auto_101173 ?auto_101179 ) ) ( not ( = ?auto_101174 ?auto_101179 ) ) ( not ( = ?auto_101175 ?auto_101179 ) ) ( ON ?auto_101173 ?auto_101178 ) ( not ( = ?auto_101173 ?auto_101178 ) ) ( not ( = ?auto_101174 ?auto_101178 ) ) ( not ( = ?auto_101175 ?auto_101178 ) ) ( not ( = ?auto_101176 ?auto_101178 ) ) ( not ( = ?auto_101177 ?auto_101178 ) ) ( not ( = ?auto_101180 ?auto_101178 ) ) ( not ( = ?auto_101179 ?auto_101178 ) ) ( ON ?auto_101174 ?auto_101173 ) ( ON-TABLE ?auto_101178 ) ( ON ?auto_101175 ?auto_101174 ) ( ON ?auto_101176 ?auto_101175 ) ( CLEAR ?auto_101176 ) ( HOLDING ?auto_101177 ) ( CLEAR ?auto_101180 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101179 ?auto_101180 ?auto_101177 )
      ( MAKE-5PILE ?auto_101173 ?auto_101174 ?auto_101175 ?auto_101176 ?auto_101177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101181 - BLOCK
      ?auto_101182 - BLOCK
      ?auto_101183 - BLOCK
      ?auto_101184 - BLOCK
      ?auto_101185 - BLOCK
    )
    :vars
    (
      ?auto_101188 - BLOCK
      ?auto_101186 - BLOCK
      ?auto_101187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101181 ?auto_101182 ) ) ( not ( = ?auto_101181 ?auto_101183 ) ) ( not ( = ?auto_101181 ?auto_101184 ) ) ( not ( = ?auto_101181 ?auto_101185 ) ) ( not ( = ?auto_101182 ?auto_101183 ) ) ( not ( = ?auto_101182 ?auto_101184 ) ) ( not ( = ?auto_101182 ?auto_101185 ) ) ( not ( = ?auto_101183 ?auto_101184 ) ) ( not ( = ?auto_101183 ?auto_101185 ) ) ( not ( = ?auto_101184 ?auto_101185 ) ) ( not ( = ?auto_101181 ?auto_101188 ) ) ( not ( = ?auto_101182 ?auto_101188 ) ) ( not ( = ?auto_101183 ?auto_101188 ) ) ( not ( = ?auto_101184 ?auto_101188 ) ) ( not ( = ?auto_101185 ?auto_101188 ) ) ( ON-TABLE ?auto_101186 ) ( ON ?auto_101188 ?auto_101186 ) ( not ( = ?auto_101186 ?auto_101188 ) ) ( not ( = ?auto_101186 ?auto_101185 ) ) ( not ( = ?auto_101186 ?auto_101184 ) ) ( not ( = ?auto_101181 ?auto_101186 ) ) ( not ( = ?auto_101182 ?auto_101186 ) ) ( not ( = ?auto_101183 ?auto_101186 ) ) ( ON ?auto_101181 ?auto_101187 ) ( not ( = ?auto_101181 ?auto_101187 ) ) ( not ( = ?auto_101182 ?auto_101187 ) ) ( not ( = ?auto_101183 ?auto_101187 ) ) ( not ( = ?auto_101184 ?auto_101187 ) ) ( not ( = ?auto_101185 ?auto_101187 ) ) ( not ( = ?auto_101188 ?auto_101187 ) ) ( not ( = ?auto_101186 ?auto_101187 ) ) ( ON ?auto_101182 ?auto_101181 ) ( ON-TABLE ?auto_101187 ) ( ON ?auto_101183 ?auto_101182 ) ( ON ?auto_101184 ?auto_101183 ) ( CLEAR ?auto_101188 ) ( ON ?auto_101185 ?auto_101184 ) ( CLEAR ?auto_101185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101187 ?auto_101181 ?auto_101182 ?auto_101183 ?auto_101184 )
      ( MAKE-5PILE ?auto_101181 ?auto_101182 ?auto_101183 ?auto_101184 ?auto_101185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101189 - BLOCK
      ?auto_101190 - BLOCK
      ?auto_101191 - BLOCK
      ?auto_101192 - BLOCK
      ?auto_101193 - BLOCK
    )
    :vars
    (
      ?auto_101195 - BLOCK
      ?auto_101194 - BLOCK
      ?auto_101196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101189 ?auto_101190 ) ) ( not ( = ?auto_101189 ?auto_101191 ) ) ( not ( = ?auto_101189 ?auto_101192 ) ) ( not ( = ?auto_101189 ?auto_101193 ) ) ( not ( = ?auto_101190 ?auto_101191 ) ) ( not ( = ?auto_101190 ?auto_101192 ) ) ( not ( = ?auto_101190 ?auto_101193 ) ) ( not ( = ?auto_101191 ?auto_101192 ) ) ( not ( = ?auto_101191 ?auto_101193 ) ) ( not ( = ?auto_101192 ?auto_101193 ) ) ( not ( = ?auto_101189 ?auto_101195 ) ) ( not ( = ?auto_101190 ?auto_101195 ) ) ( not ( = ?auto_101191 ?auto_101195 ) ) ( not ( = ?auto_101192 ?auto_101195 ) ) ( not ( = ?auto_101193 ?auto_101195 ) ) ( ON-TABLE ?auto_101194 ) ( not ( = ?auto_101194 ?auto_101195 ) ) ( not ( = ?auto_101194 ?auto_101193 ) ) ( not ( = ?auto_101194 ?auto_101192 ) ) ( not ( = ?auto_101189 ?auto_101194 ) ) ( not ( = ?auto_101190 ?auto_101194 ) ) ( not ( = ?auto_101191 ?auto_101194 ) ) ( ON ?auto_101189 ?auto_101196 ) ( not ( = ?auto_101189 ?auto_101196 ) ) ( not ( = ?auto_101190 ?auto_101196 ) ) ( not ( = ?auto_101191 ?auto_101196 ) ) ( not ( = ?auto_101192 ?auto_101196 ) ) ( not ( = ?auto_101193 ?auto_101196 ) ) ( not ( = ?auto_101195 ?auto_101196 ) ) ( not ( = ?auto_101194 ?auto_101196 ) ) ( ON ?auto_101190 ?auto_101189 ) ( ON-TABLE ?auto_101196 ) ( ON ?auto_101191 ?auto_101190 ) ( ON ?auto_101192 ?auto_101191 ) ( ON ?auto_101193 ?auto_101192 ) ( CLEAR ?auto_101193 ) ( HOLDING ?auto_101195 ) ( CLEAR ?auto_101194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101194 ?auto_101195 )
      ( MAKE-5PILE ?auto_101189 ?auto_101190 ?auto_101191 ?auto_101192 ?auto_101193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101197 - BLOCK
      ?auto_101198 - BLOCK
      ?auto_101199 - BLOCK
      ?auto_101200 - BLOCK
      ?auto_101201 - BLOCK
    )
    :vars
    (
      ?auto_101204 - BLOCK
      ?auto_101202 - BLOCK
      ?auto_101203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101197 ?auto_101198 ) ) ( not ( = ?auto_101197 ?auto_101199 ) ) ( not ( = ?auto_101197 ?auto_101200 ) ) ( not ( = ?auto_101197 ?auto_101201 ) ) ( not ( = ?auto_101198 ?auto_101199 ) ) ( not ( = ?auto_101198 ?auto_101200 ) ) ( not ( = ?auto_101198 ?auto_101201 ) ) ( not ( = ?auto_101199 ?auto_101200 ) ) ( not ( = ?auto_101199 ?auto_101201 ) ) ( not ( = ?auto_101200 ?auto_101201 ) ) ( not ( = ?auto_101197 ?auto_101204 ) ) ( not ( = ?auto_101198 ?auto_101204 ) ) ( not ( = ?auto_101199 ?auto_101204 ) ) ( not ( = ?auto_101200 ?auto_101204 ) ) ( not ( = ?auto_101201 ?auto_101204 ) ) ( ON-TABLE ?auto_101202 ) ( not ( = ?auto_101202 ?auto_101204 ) ) ( not ( = ?auto_101202 ?auto_101201 ) ) ( not ( = ?auto_101202 ?auto_101200 ) ) ( not ( = ?auto_101197 ?auto_101202 ) ) ( not ( = ?auto_101198 ?auto_101202 ) ) ( not ( = ?auto_101199 ?auto_101202 ) ) ( ON ?auto_101197 ?auto_101203 ) ( not ( = ?auto_101197 ?auto_101203 ) ) ( not ( = ?auto_101198 ?auto_101203 ) ) ( not ( = ?auto_101199 ?auto_101203 ) ) ( not ( = ?auto_101200 ?auto_101203 ) ) ( not ( = ?auto_101201 ?auto_101203 ) ) ( not ( = ?auto_101204 ?auto_101203 ) ) ( not ( = ?auto_101202 ?auto_101203 ) ) ( ON ?auto_101198 ?auto_101197 ) ( ON-TABLE ?auto_101203 ) ( ON ?auto_101199 ?auto_101198 ) ( ON ?auto_101200 ?auto_101199 ) ( ON ?auto_101201 ?auto_101200 ) ( CLEAR ?auto_101202 ) ( ON ?auto_101204 ?auto_101201 ) ( CLEAR ?auto_101204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101203 ?auto_101197 ?auto_101198 ?auto_101199 ?auto_101200 ?auto_101201 )
      ( MAKE-5PILE ?auto_101197 ?auto_101198 ?auto_101199 ?auto_101200 ?auto_101201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101205 - BLOCK
      ?auto_101206 - BLOCK
      ?auto_101207 - BLOCK
      ?auto_101208 - BLOCK
      ?auto_101209 - BLOCK
    )
    :vars
    (
      ?auto_101211 - BLOCK
      ?auto_101212 - BLOCK
      ?auto_101210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101205 ?auto_101206 ) ) ( not ( = ?auto_101205 ?auto_101207 ) ) ( not ( = ?auto_101205 ?auto_101208 ) ) ( not ( = ?auto_101205 ?auto_101209 ) ) ( not ( = ?auto_101206 ?auto_101207 ) ) ( not ( = ?auto_101206 ?auto_101208 ) ) ( not ( = ?auto_101206 ?auto_101209 ) ) ( not ( = ?auto_101207 ?auto_101208 ) ) ( not ( = ?auto_101207 ?auto_101209 ) ) ( not ( = ?auto_101208 ?auto_101209 ) ) ( not ( = ?auto_101205 ?auto_101211 ) ) ( not ( = ?auto_101206 ?auto_101211 ) ) ( not ( = ?auto_101207 ?auto_101211 ) ) ( not ( = ?auto_101208 ?auto_101211 ) ) ( not ( = ?auto_101209 ?auto_101211 ) ) ( not ( = ?auto_101212 ?auto_101211 ) ) ( not ( = ?auto_101212 ?auto_101209 ) ) ( not ( = ?auto_101212 ?auto_101208 ) ) ( not ( = ?auto_101205 ?auto_101212 ) ) ( not ( = ?auto_101206 ?auto_101212 ) ) ( not ( = ?auto_101207 ?auto_101212 ) ) ( ON ?auto_101205 ?auto_101210 ) ( not ( = ?auto_101205 ?auto_101210 ) ) ( not ( = ?auto_101206 ?auto_101210 ) ) ( not ( = ?auto_101207 ?auto_101210 ) ) ( not ( = ?auto_101208 ?auto_101210 ) ) ( not ( = ?auto_101209 ?auto_101210 ) ) ( not ( = ?auto_101211 ?auto_101210 ) ) ( not ( = ?auto_101212 ?auto_101210 ) ) ( ON ?auto_101206 ?auto_101205 ) ( ON-TABLE ?auto_101210 ) ( ON ?auto_101207 ?auto_101206 ) ( ON ?auto_101208 ?auto_101207 ) ( ON ?auto_101209 ?auto_101208 ) ( ON ?auto_101211 ?auto_101209 ) ( CLEAR ?auto_101211 ) ( HOLDING ?auto_101212 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101212 )
      ( MAKE-5PILE ?auto_101205 ?auto_101206 ?auto_101207 ?auto_101208 ?auto_101209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101213 - BLOCK
      ?auto_101214 - BLOCK
      ?auto_101215 - BLOCK
      ?auto_101216 - BLOCK
      ?auto_101217 - BLOCK
    )
    :vars
    (
      ?auto_101219 - BLOCK
      ?auto_101220 - BLOCK
      ?auto_101218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101213 ?auto_101214 ) ) ( not ( = ?auto_101213 ?auto_101215 ) ) ( not ( = ?auto_101213 ?auto_101216 ) ) ( not ( = ?auto_101213 ?auto_101217 ) ) ( not ( = ?auto_101214 ?auto_101215 ) ) ( not ( = ?auto_101214 ?auto_101216 ) ) ( not ( = ?auto_101214 ?auto_101217 ) ) ( not ( = ?auto_101215 ?auto_101216 ) ) ( not ( = ?auto_101215 ?auto_101217 ) ) ( not ( = ?auto_101216 ?auto_101217 ) ) ( not ( = ?auto_101213 ?auto_101219 ) ) ( not ( = ?auto_101214 ?auto_101219 ) ) ( not ( = ?auto_101215 ?auto_101219 ) ) ( not ( = ?auto_101216 ?auto_101219 ) ) ( not ( = ?auto_101217 ?auto_101219 ) ) ( not ( = ?auto_101220 ?auto_101219 ) ) ( not ( = ?auto_101220 ?auto_101217 ) ) ( not ( = ?auto_101220 ?auto_101216 ) ) ( not ( = ?auto_101213 ?auto_101220 ) ) ( not ( = ?auto_101214 ?auto_101220 ) ) ( not ( = ?auto_101215 ?auto_101220 ) ) ( ON ?auto_101213 ?auto_101218 ) ( not ( = ?auto_101213 ?auto_101218 ) ) ( not ( = ?auto_101214 ?auto_101218 ) ) ( not ( = ?auto_101215 ?auto_101218 ) ) ( not ( = ?auto_101216 ?auto_101218 ) ) ( not ( = ?auto_101217 ?auto_101218 ) ) ( not ( = ?auto_101219 ?auto_101218 ) ) ( not ( = ?auto_101220 ?auto_101218 ) ) ( ON ?auto_101214 ?auto_101213 ) ( ON-TABLE ?auto_101218 ) ( ON ?auto_101215 ?auto_101214 ) ( ON ?auto_101216 ?auto_101215 ) ( ON ?auto_101217 ?auto_101216 ) ( ON ?auto_101219 ?auto_101217 ) ( ON ?auto_101220 ?auto_101219 ) ( CLEAR ?auto_101220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101218 ?auto_101213 ?auto_101214 ?auto_101215 ?auto_101216 ?auto_101217 ?auto_101219 )
      ( MAKE-5PILE ?auto_101213 ?auto_101214 ?auto_101215 ?auto_101216 ?auto_101217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101232 - BLOCK
    )
    :vars
    (
      ?auto_101235 - BLOCK
      ?auto_101233 - BLOCK
      ?auto_101234 - BLOCK
      ?auto_101236 - BLOCK
      ?auto_101238 - BLOCK
      ?auto_101237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101235 ?auto_101232 ) ( ON-TABLE ?auto_101232 ) ( not ( = ?auto_101232 ?auto_101235 ) ) ( not ( = ?auto_101232 ?auto_101233 ) ) ( not ( = ?auto_101232 ?auto_101234 ) ) ( not ( = ?auto_101235 ?auto_101233 ) ) ( not ( = ?auto_101235 ?auto_101234 ) ) ( not ( = ?auto_101233 ?auto_101234 ) ) ( ON ?auto_101233 ?auto_101235 ) ( CLEAR ?auto_101233 ) ( HOLDING ?auto_101234 ) ( CLEAR ?auto_101236 ) ( ON-TABLE ?auto_101238 ) ( ON ?auto_101237 ?auto_101238 ) ( ON ?auto_101236 ?auto_101237 ) ( not ( = ?auto_101238 ?auto_101237 ) ) ( not ( = ?auto_101238 ?auto_101236 ) ) ( not ( = ?auto_101238 ?auto_101234 ) ) ( not ( = ?auto_101237 ?auto_101236 ) ) ( not ( = ?auto_101237 ?auto_101234 ) ) ( not ( = ?auto_101236 ?auto_101234 ) ) ( not ( = ?auto_101232 ?auto_101236 ) ) ( not ( = ?auto_101232 ?auto_101238 ) ) ( not ( = ?auto_101232 ?auto_101237 ) ) ( not ( = ?auto_101235 ?auto_101236 ) ) ( not ( = ?auto_101235 ?auto_101238 ) ) ( not ( = ?auto_101235 ?auto_101237 ) ) ( not ( = ?auto_101233 ?auto_101236 ) ) ( not ( = ?auto_101233 ?auto_101238 ) ) ( not ( = ?auto_101233 ?auto_101237 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101238 ?auto_101237 ?auto_101236 ?auto_101234 )
      ( MAKE-1PILE ?auto_101232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101239 - BLOCK
    )
    :vars
    (
      ?auto_101245 - BLOCK
      ?auto_101243 - BLOCK
      ?auto_101244 - BLOCK
      ?auto_101240 - BLOCK
      ?auto_101241 - BLOCK
      ?auto_101242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101245 ?auto_101239 ) ( ON-TABLE ?auto_101239 ) ( not ( = ?auto_101239 ?auto_101245 ) ) ( not ( = ?auto_101239 ?auto_101243 ) ) ( not ( = ?auto_101239 ?auto_101244 ) ) ( not ( = ?auto_101245 ?auto_101243 ) ) ( not ( = ?auto_101245 ?auto_101244 ) ) ( not ( = ?auto_101243 ?auto_101244 ) ) ( ON ?auto_101243 ?auto_101245 ) ( CLEAR ?auto_101240 ) ( ON-TABLE ?auto_101241 ) ( ON ?auto_101242 ?auto_101241 ) ( ON ?auto_101240 ?auto_101242 ) ( not ( = ?auto_101241 ?auto_101242 ) ) ( not ( = ?auto_101241 ?auto_101240 ) ) ( not ( = ?auto_101241 ?auto_101244 ) ) ( not ( = ?auto_101242 ?auto_101240 ) ) ( not ( = ?auto_101242 ?auto_101244 ) ) ( not ( = ?auto_101240 ?auto_101244 ) ) ( not ( = ?auto_101239 ?auto_101240 ) ) ( not ( = ?auto_101239 ?auto_101241 ) ) ( not ( = ?auto_101239 ?auto_101242 ) ) ( not ( = ?auto_101245 ?auto_101240 ) ) ( not ( = ?auto_101245 ?auto_101241 ) ) ( not ( = ?auto_101245 ?auto_101242 ) ) ( not ( = ?auto_101243 ?auto_101240 ) ) ( not ( = ?auto_101243 ?auto_101241 ) ) ( not ( = ?auto_101243 ?auto_101242 ) ) ( ON ?auto_101244 ?auto_101243 ) ( CLEAR ?auto_101244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101239 ?auto_101245 ?auto_101243 )
      ( MAKE-1PILE ?auto_101239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101246 - BLOCK
    )
    :vars
    (
      ?auto_101251 - BLOCK
      ?auto_101252 - BLOCK
      ?auto_101250 - BLOCK
      ?auto_101247 - BLOCK
      ?auto_101248 - BLOCK
      ?auto_101249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101251 ?auto_101246 ) ( ON-TABLE ?auto_101246 ) ( not ( = ?auto_101246 ?auto_101251 ) ) ( not ( = ?auto_101246 ?auto_101252 ) ) ( not ( = ?auto_101246 ?auto_101250 ) ) ( not ( = ?auto_101251 ?auto_101252 ) ) ( not ( = ?auto_101251 ?auto_101250 ) ) ( not ( = ?auto_101252 ?auto_101250 ) ) ( ON ?auto_101252 ?auto_101251 ) ( ON-TABLE ?auto_101247 ) ( ON ?auto_101248 ?auto_101247 ) ( not ( = ?auto_101247 ?auto_101248 ) ) ( not ( = ?auto_101247 ?auto_101249 ) ) ( not ( = ?auto_101247 ?auto_101250 ) ) ( not ( = ?auto_101248 ?auto_101249 ) ) ( not ( = ?auto_101248 ?auto_101250 ) ) ( not ( = ?auto_101249 ?auto_101250 ) ) ( not ( = ?auto_101246 ?auto_101249 ) ) ( not ( = ?auto_101246 ?auto_101247 ) ) ( not ( = ?auto_101246 ?auto_101248 ) ) ( not ( = ?auto_101251 ?auto_101249 ) ) ( not ( = ?auto_101251 ?auto_101247 ) ) ( not ( = ?auto_101251 ?auto_101248 ) ) ( not ( = ?auto_101252 ?auto_101249 ) ) ( not ( = ?auto_101252 ?auto_101247 ) ) ( not ( = ?auto_101252 ?auto_101248 ) ) ( ON ?auto_101250 ?auto_101252 ) ( CLEAR ?auto_101250 ) ( HOLDING ?auto_101249 ) ( CLEAR ?auto_101248 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101247 ?auto_101248 ?auto_101249 )
      ( MAKE-1PILE ?auto_101246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101253 - BLOCK
    )
    :vars
    (
      ?auto_101255 - BLOCK
      ?auto_101257 - BLOCK
      ?auto_101259 - BLOCK
      ?auto_101256 - BLOCK
      ?auto_101258 - BLOCK
      ?auto_101254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101255 ?auto_101253 ) ( ON-TABLE ?auto_101253 ) ( not ( = ?auto_101253 ?auto_101255 ) ) ( not ( = ?auto_101253 ?auto_101257 ) ) ( not ( = ?auto_101253 ?auto_101259 ) ) ( not ( = ?auto_101255 ?auto_101257 ) ) ( not ( = ?auto_101255 ?auto_101259 ) ) ( not ( = ?auto_101257 ?auto_101259 ) ) ( ON ?auto_101257 ?auto_101255 ) ( ON-TABLE ?auto_101256 ) ( ON ?auto_101258 ?auto_101256 ) ( not ( = ?auto_101256 ?auto_101258 ) ) ( not ( = ?auto_101256 ?auto_101254 ) ) ( not ( = ?auto_101256 ?auto_101259 ) ) ( not ( = ?auto_101258 ?auto_101254 ) ) ( not ( = ?auto_101258 ?auto_101259 ) ) ( not ( = ?auto_101254 ?auto_101259 ) ) ( not ( = ?auto_101253 ?auto_101254 ) ) ( not ( = ?auto_101253 ?auto_101256 ) ) ( not ( = ?auto_101253 ?auto_101258 ) ) ( not ( = ?auto_101255 ?auto_101254 ) ) ( not ( = ?auto_101255 ?auto_101256 ) ) ( not ( = ?auto_101255 ?auto_101258 ) ) ( not ( = ?auto_101257 ?auto_101254 ) ) ( not ( = ?auto_101257 ?auto_101256 ) ) ( not ( = ?auto_101257 ?auto_101258 ) ) ( ON ?auto_101259 ?auto_101257 ) ( CLEAR ?auto_101258 ) ( ON ?auto_101254 ?auto_101259 ) ( CLEAR ?auto_101254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101253 ?auto_101255 ?auto_101257 ?auto_101259 )
      ( MAKE-1PILE ?auto_101253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101260 - BLOCK
    )
    :vars
    (
      ?auto_101265 - BLOCK
      ?auto_101262 - BLOCK
      ?auto_101261 - BLOCK
      ?auto_101263 - BLOCK
      ?auto_101264 - BLOCK
      ?auto_101266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101265 ?auto_101260 ) ( ON-TABLE ?auto_101260 ) ( not ( = ?auto_101260 ?auto_101265 ) ) ( not ( = ?auto_101260 ?auto_101262 ) ) ( not ( = ?auto_101260 ?auto_101261 ) ) ( not ( = ?auto_101265 ?auto_101262 ) ) ( not ( = ?auto_101265 ?auto_101261 ) ) ( not ( = ?auto_101262 ?auto_101261 ) ) ( ON ?auto_101262 ?auto_101265 ) ( ON-TABLE ?auto_101263 ) ( not ( = ?auto_101263 ?auto_101264 ) ) ( not ( = ?auto_101263 ?auto_101266 ) ) ( not ( = ?auto_101263 ?auto_101261 ) ) ( not ( = ?auto_101264 ?auto_101266 ) ) ( not ( = ?auto_101264 ?auto_101261 ) ) ( not ( = ?auto_101266 ?auto_101261 ) ) ( not ( = ?auto_101260 ?auto_101266 ) ) ( not ( = ?auto_101260 ?auto_101263 ) ) ( not ( = ?auto_101260 ?auto_101264 ) ) ( not ( = ?auto_101265 ?auto_101266 ) ) ( not ( = ?auto_101265 ?auto_101263 ) ) ( not ( = ?auto_101265 ?auto_101264 ) ) ( not ( = ?auto_101262 ?auto_101266 ) ) ( not ( = ?auto_101262 ?auto_101263 ) ) ( not ( = ?auto_101262 ?auto_101264 ) ) ( ON ?auto_101261 ?auto_101262 ) ( ON ?auto_101266 ?auto_101261 ) ( CLEAR ?auto_101266 ) ( HOLDING ?auto_101264 ) ( CLEAR ?auto_101263 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101263 ?auto_101264 )
      ( MAKE-1PILE ?auto_101260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101267 - BLOCK
    )
    :vars
    (
      ?auto_101272 - BLOCK
      ?auto_101268 - BLOCK
      ?auto_101269 - BLOCK
      ?auto_101273 - BLOCK
      ?auto_101271 - BLOCK
      ?auto_101270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101272 ?auto_101267 ) ( ON-TABLE ?auto_101267 ) ( not ( = ?auto_101267 ?auto_101272 ) ) ( not ( = ?auto_101267 ?auto_101268 ) ) ( not ( = ?auto_101267 ?auto_101269 ) ) ( not ( = ?auto_101272 ?auto_101268 ) ) ( not ( = ?auto_101272 ?auto_101269 ) ) ( not ( = ?auto_101268 ?auto_101269 ) ) ( ON ?auto_101268 ?auto_101272 ) ( ON-TABLE ?auto_101273 ) ( not ( = ?auto_101273 ?auto_101271 ) ) ( not ( = ?auto_101273 ?auto_101270 ) ) ( not ( = ?auto_101273 ?auto_101269 ) ) ( not ( = ?auto_101271 ?auto_101270 ) ) ( not ( = ?auto_101271 ?auto_101269 ) ) ( not ( = ?auto_101270 ?auto_101269 ) ) ( not ( = ?auto_101267 ?auto_101270 ) ) ( not ( = ?auto_101267 ?auto_101273 ) ) ( not ( = ?auto_101267 ?auto_101271 ) ) ( not ( = ?auto_101272 ?auto_101270 ) ) ( not ( = ?auto_101272 ?auto_101273 ) ) ( not ( = ?auto_101272 ?auto_101271 ) ) ( not ( = ?auto_101268 ?auto_101270 ) ) ( not ( = ?auto_101268 ?auto_101273 ) ) ( not ( = ?auto_101268 ?auto_101271 ) ) ( ON ?auto_101269 ?auto_101268 ) ( ON ?auto_101270 ?auto_101269 ) ( CLEAR ?auto_101273 ) ( ON ?auto_101271 ?auto_101270 ) ( CLEAR ?auto_101271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101267 ?auto_101272 ?auto_101268 ?auto_101269 ?auto_101270 )
      ( MAKE-1PILE ?auto_101267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101274 - BLOCK
    )
    :vars
    (
      ?auto_101279 - BLOCK
      ?auto_101275 - BLOCK
      ?auto_101277 - BLOCK
      ?auto_101280 - BLOCK
      ?auto_101278 - BLOCK
      ?auto_101276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101279 ?auto_101274 ) ( ON-TABLE ?auto_101274 ) ( not ( = ?auto_101274 ?auto_101279 ) ) ( not ( = ?auto_101274 ?auto_101275 ) ) ( not ( = ?auto_101274 ?auto_101277 ) ) ( not ( = ?auto_101279 ?auto_101275 ) ) ( not ( = ?auto_101279 ?auto_101277 ) ) ( not ( = ?auto_101275 ?auto_101277 ) ) ( ON ?auto_101275 ?auto_101279 ) ( not ( = ?auto_101280 ?auto_101278 ) ) ( not ( = ?auto_101280 ?auto_101276 ) ) ( not ( = ?auto_101280 ?auto_101277 ) ) ( not ( = ?auto_101278 ?auto_101276 ) ) ( not ( = ?auto_101278 ?auto_101277 ) ) ( not ( = ?auto_101276 ?auto_101277 ) ) ( not ( = ?auto_101274 ?auto_101276 ) ) ( not ( = ?auto_101274 ?auto_101280 ) ) ( not ( = ?auto_101274 ?auto_101278 ) ) ( not ( = ?auto_101279 ?auto_101276 ) ) ( not ( = ?auto_101279 ?auto_101280 ) ) ( not ( = ?auto_101279 ?auto_101278 ) ) ( not ( = ?auto_101275 ?auto_101276 ) ) ( not ( = ?auto_101275 ?auto_101280 ) ) ( not ( = ?auto_101275 ?auto_101278 ) ) ( ON ?auto_101277 ?auto_101275 ) ( ON ?auto_101276 ?auto_101277 ) ( ON ?auto_101278 ?auto_101276 ) ( CLEAR ?auto_101278 ) ( HOLDING ?auto_101280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101280 )
      ( MAKE-1PILE ?auto_101274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101289 - BLOCK
    )
    :vars
    (
      ?auto_101291 - BLOCK
      ?auto_101293 - BLOCK
      ?auto_101294 - BLOCK
      ?auto_101290 - BLOCK
      ?auto_101292 - BLOCK
      ?auto_101295 - BLOCK
      ?auto_101296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101291 ?auto_101289 ) ( ON-TABLE ?auto_101289 ) ( not ( = ?auto_101289 ?auto_101291 ) ) ( not ( = ?auto_101289 ?auto_101293 ) ) ( not ( = ?auto_101289 ?auto_101294 ) ) ( not ( = ?auto_101291 ?auto_101293 ) ) ( not ( = ?auto_101291 ?auto_101294 ) ) ( not ( = ?auto_101293 ?auto_101294 ) ) ( ON ?auto_101293 ?auto_101291 ) ( not ( = ?auto_101290 ?auto_101292 ) ) ( not ( = ?auto_101290 ?auto_101295 ) ) ( not ( = ?auto_101290 ?auto_101294 ) ) ( not ( = ?auto_101292 ?auto_101295 ) ) ( not ( = ?auto_101292 ?auto_101294 ) ) ( not ( = ?auto_101295 ?auto_101294 ) ) ( not ( = ?auto_101289 ?auto_101295 ) ) ( not ( = ?auto_101289 ?auto_101290 ) ) ( not ( = ?auto_101289 ?auto_101292 ) ) ( not ( = ?auto_101291 ?auto_101295 ) ) ( not ( = ?auto_101291 ?auto_101290 ) ) ( not ( = ?auto_101291 ?auto_101292 ) ) ( not ( = ?auto_101293 ?auto_101295 ) ) ( not ( = ?auto_101293 ?auto_101290 ) ) ( not ( = ?auto_101293 ?auto_101292 ) ) ( ON ?auto_101294 ?auto_101293 ) ( ON ?auto_101295 ?auto_101294 ) ( ON ?auto_101292 ?auto_101295 ) ( CLEAR ?auto_101292 ) ( ON ?auto_101290 ?auto_101296 ) ( CLEAR ?auto_101290 ) ( HAND-EMPTY ) ( not ( = ?auto_101289 ?auto_101296 ) ) ( not ( = ?auto_101291 ?auto_101296 ) ) ( not ( = ?auto_101293 ?auto_101296 ) ) ( not ( = ?auto_101294 ?auto_101296 ) ) ( not ( = ?auto_101290 ?auto_101296 ) ) ( not ( = ?auto_101292 ?auto_101296 ) ) ( not ( = ?auto_101295 ?auto_101296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101290 ?auto_101296 )
      ( MAKE-1PILE ?auto_101289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101297 - BLOCK
    )
    :vars
    (
      ?auto_101301 - BLOCK
      ?auto_101298 - BLOCK
      ?auto_101302 - BLOCK
      ?auto_101304 - BLOCK
      ?auto_101300 - BLOCK
      ?auto_101303 - BLOCK
      ?auto_101299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101301 ?auto_101297 ) ( ON-TABLE ?auto_101297 ) ( not ( = ?auto_101297 ?auto_101301 ) ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101297 ?auto_101302 ) ) ( not ( = ?auto_101301 ?auto_101298 ) ) ( not ( = ?auto_101301 ?auto_101302 ) ) ( not ( = ?auto_101298 ?auto_101302 ) ) ( ON ?auto_101298 ?auto_101301 ) ( not ( = ?auto_101304 ?auto_101300 ) ) ( not ( = ?auto_101304 ?auto_101303 ) ) ( not ( = ?auto_101304 ?auto_101302 ) ) ( not ( = ?auto_101300 ?auto_101303 ) ) ( not ( = ?auto_101300 ?auto_101302 ) ) ( not ( = ?auto_101303 ?auto_101302 ) ) ( not ( = ?auto_101297 ?auto_101303 ) ) ( not ( = ?auto_101297 ?auto_101304 ) ) ( not ( = ?auto_101297 ?auto_101300 ) ) ( not ( = ?auto_101301 ?auto_101303 ) ) ( not ( = ?auto_101301 ?auto_101304 ) ) ( not ( = ?auto_101301 ?auto_101300 ) ) ( not ( = ?auto_101298 ?auto_101303 ) ) ( not ( = ?auto_101298 ?auto_101304 ) ) ( not ( = ?auto_101298 ?auto_101300 ) ) ( ON ?auto_101302 ?auto_101298 ) ( ON ?auto_101303 ?auto_101302 ) ( ON ?auto_101304 ?auto_101299 ) ( CLEAR ?auto_101304 ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( not ( = ?auto_101301 ?auto_101299 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) ( not ( = ?auto_101302 ?auto_101299 ) ) ( not ( = ?auto_101304 ?auto_101299 ) ) ( not ( = ?auto_101300 ?auto_101299 ) ) ( not ( = ?auto_101303 ?auto_101299 ) ) ( HOLDING ?auto_101300 ) ( CLEAR ?auto_101303 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101297 ?auto_101301 ?auto_101298 ?auto_101302 ?auto_101303 ?auto_101300 )
      ( MAKE-1PILE ?auto_101297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101305 - BLOCK
    )
    :vars
    (
      ?auto_101311 - BLOCK
      ?auto_101307 - BLOCK
      ?auto_101310 - BLOCK
      ?auto_101312 - BLOCK
      ?auto_101308 - BLOCK
      ?auto_101306 - BLOCK
      ?auto_101309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101311 ?auto_101305 ) ( ON-TABLE ?auto_101305 ) ( not ( = ?auto_101305 ?auto_101311 ) ) ( not ( = ?auto_101305 ?auto_101307 ) ) ( not ( = ?auto_101305 ?auto_101310 ) ) ( not ( = ?auto_101311 ?auto_101307 ) ) ( not ( = ?auto_101311 ?auto_101310 ) ) ( not ( = ?auto_101307 ?auto_101310 ) ) ( ON ?auto_101307 ?auto_101311 ) ( not ( = ?auto_101312 ?auto_101308 ) ) ( not ( = ?auto_101312 ?auto_101306 ) ) ( not ( = ?auto_101312 ?auto_101310 ) ) ( not ( = ?auto_101308 ?auto_101306 ) ) ( not ( = ?auto_101308 ?auto_101310 ) ) ( not ( = ?auto_101306 ?auto_101310 ) ) ( not ( = ?auto_101305 ?auto_101306 ) ) ( not ( = ?auto_101305 ?auto_101312 ) ) ( not ( = ?auto_101305 ?auto_101308 ) ) ( not ( = ?auto_101311 ?auto_101306 ) ) ( not ( = ?auto_101311 ?auto_101312 ) ) ( not ( = ?auto_101311 ?auto_101308 ) ) ( not ( = ?auto_101307 ?auto_101306 ) ) ( not ( = ?auto_101307 ?auto_101312 ) ) ( not ( = ?auto_101307 ?auto_101308 ) ) ( ON ?auto_101310 ?auto_101307 ) ( ON ?auto_101306 ?auto_101310 ) ( ON ?auto_101312 ?auto_101309 ) ( not ( = ?auto_101305 ?auto_101309 ) ) ( not ( = ?auto_101311 ?auto_101309 ) ) ( not ( = ?auto_101307 ?auto_101309 ) ) ( not ( = ?auto_101310 ?auto_101309 ) ) ( not ( = ?auto_101312 ?auto_101309 ) ) ( not ( = ?auto_101308 ?auto_101309 ) ) ( not ( = ?auto_101306 ?auto_101309 ) ) ( CLEAR ?auto_101306 ) ( ON ?auto_101308 ?auto_101312 ) ( CLEAR ?auto_101308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101309 ?auto_101312 )
      ( MAKE-1PILE ?auto_101305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101313 - BLOCK
    )
    :vars
    (
      ?auto_101314 - BLOCK
      ?auto_101316 - BLOCK
      ?auto_101315 - BLOCK
      ?auto_101318 - BLOCK
      ?auto_101317 - BLOCK
      ?auto_101320 - BLOCK
      ?auto_101319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101314 ?auto_101313 ) ( ON-TABLE ?auto_101313 ) ( not ( = ?auto_101313 ?auto_101314 ) ) ( not ( = ?auto_101313 ?auto_101316 ) ) ( not ( = ?auto_101313 ?auto_101315 ) ) ( not ( = ?auto_101314 ?auto_101316 ) ) ( not ( = ?auto_101314 ?auto_101315 ) ) ( not ( = ?auto_101316 ?auto_101315 ) ) ( ON ?auto_101316 ?auto_101314 ) ( not ( = ?auto_101318 ?auto_101317 ) ) ( not ( = ?auto_101318 ?auto_101320 ) ) ( not ( = ?auto_101318 ?auto_101315 ) ) ( not ( = ?auto_101317 ?auto_101320 ) ) ( not ( = ?auto_101317 ?auto_101315 ) ) ( not ( = ?auto_101320 ?auto_101315 ) ) ( not ( = ?auto_101313 ?auto_101320 ) ) ( not ( = ?auto_101313 ?auto_101318 ) ) ( not ( = ?auto_101313 ?auto_101317 ) ) ( not ( = ?auto_101314 ?auto_101320 ) ) ( not ( = ?auto_101314 ?auto_101318 ) ) ( not ( = ?auto_101314 ?auto_101317 ) ) ( not ( = ?auto_101316 ?auto_101320 ) ) ( not ( = ?auto_101316 ?auto_101318 ) ) ( not ( = ?auto_101316 ?auto_101317 ) ) ( ON ?auto_101315 ?auto_101316 ) ( ON ?auto_101318 ?auto_101319 ) ( not ( = ?auto_101313 ?auto_101319 ) ) ( not ( = ?auto_101314 ?auto_101319 ) ) ( not ( = ?auto_101316 ?auto_101319 ) ) ( not ( = ?auto_101315 ?auto_101319 ) ) ( not ( = ?auto_101318 ?auto_101319 ) ) ( not ( = ?auto_101317 ?auto_101319 ) ) ( not ( = ?auto_101320 ?auto_101319 ) ) ( ON ?auto_101317 ?auto_101318 ) ( CLEAR ?auto_101317 ) ( ON-TABLE ?auto_101319 ) ( HOLDING ?auto_101320 ) ( CLEAR ?auto_101315 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101313 ?auto_101314 ?auto_101316 ?auto_101315 ?auto_101320 )
      ( MAKE-1PILE ?auto_101313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101359 - BLOCK
      ?auto_101360 - BLOCK
      ?auto_101361 - BLOCK
      ?auto_101362 - BLOCK
      ?auto_101363 - BLOCK
      ?auto_101364 - BLOCK
    )
    :vars
    (
      ?auto_101365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101359 ) ( ON ?auto_101360 ?auto_101359 ) ( ON ?auto_101361 ?auto_101360 ) ( ON ?auto_101362 ?auto_101361 ) ( not ( = ?auto_101359 ?auto_101360 ) ) ( not ( = ?auto_101359 ?auto_101361 ) ) ( not ( = ?auto_101359 ?auto_101362 ) ) ( not ( = ?auto_101359 ?auto_101363 ) ) ( not ( = ?auto_101359 ?auto_101364 ) ) ( not ( = ?auto_101360 ?auto_101361 ) ) ( not ( = ?auto_101360 ?auto_101362 ) ) ( not ( = ?auto_101360 ?auto_101363 ) ) ( not ( = ?auto_101360 ?auto_101364 ) ) ( not ( = ?auto_101361 ?auto_101362 ) ) ( not ( = ?auto_101361 ?auto_101363 ) ) ( not ( = ?auto_101361 ?auto_101364 ) ) ( not ( = ?auto_101362 ?auto_101363 ) ) ( not ( = ?auto_101362 ?auto_101364 ) ) ( not ( = ?auto_101363 ?auto_101364 ) ) ( ON ?auto_101364 ?auto_101365 ) ( not ( = ?auto_101359 ?auto_101365 ) ) ( not ( = ?auto_101360 ?auto_101365 ) ) ( not ( = ?auto_101361 ?auto_101365 ) ) ( not ( = ?auto_101362 ?auto_101365 ) ) ( not ( = ?auto_101363 ?auto_101365 ) ) ( not ( = ?auto_101364 ?auto_101365 ) ) ( CLEAR ?auto_101362 ) ( ON ?auto_101363 ?auto_101364 ) ( CLEAR ?auto_101363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101365 ?auto_101364 )
      ( MAKE-6PILE ?auto_101359 ?auto_101360 ?auto_101361 ?auto_101362 ?auto_101363 ?auto_101364 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101366 - BLOCK
      ?auto_101367 - BLOCK
      ?auto_101368 - BLOCK
      ?auto_101369 - BLOCK
      ?auto_101370 - BLOCK
      ?auto_101371 - BLOCK
    )
    :vars
    (
      ?auto_101372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101366 ) ( ON ?auto_101367 ?auto_101366 ) ( ON ?auto_101368 ?auto_101367 ) ( not ( = ?auto_101366 ?auto_101367 ) ) ( not ( = ?auto_101366 ?auto_101368 ) ) ( not ( = ?auto_101366 ?auto_101369 ) ) ( not ( = ?auto_101366 ?auto_101370 ) ) ( not ( = ?auto_101366 ?auto_101371 ) ) ( not ( = ?auto_101367 ?auto_101368 ) ) ( not ( = ?auto_101367 ?auto_101369 ) ) ( not ( = ?auto_101367 ?auto_101370 ) ) ( not ( = ?auto_101367 ?auto_101371 ) ) ( not ( = ?auto_101368 ?auto_101369 ) ) ( not ( = ?auto_101368 ?auto_101370 ) ) ( not ( = ?auto_101368 ?auto_101371 ) ) ( not ( = ?auto_101369 ?auto_101370 ) ) ( not ( = ?auto_101369 ?auto_101371 ) ) ( not ( = ?auto_101370 ?auto_101371 ) ) ( ON ?auto_101371 ?auto_101372 ) ( not ( = ?auto_101366 ?auto_101372 ) ) ( not ( = ?auto_101367 ?auto_101372 ) ) ( not ( = ?auto_101368 ?auto_101372 ) ) ( not ( = ?auto_101369 ?auto_101372 ) ) ( not ( = ?auto_101370 ?auto_101372 ) ) ( not ( = ?auto_101371 ?auto_101372 ) ) ( ON ?auto_101370 ?auto_101371 ) ( CLEAR ?auto_101370 ) ( ON-TABLE ?auto_101372 ) ( HOLDING ?auto_101369 ) ( CLEAR ?auto_101368 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101366 ?auto_101367 ?auto_101368 ?auto_101369 )
      ( MAKE-6PILE ?auto_101366 ?auto_101367 ?auto_101368 ?auto_101369 ?auto_101370 ?auto_101371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101373 - BLOCK
      ?auto_101374 - BLOCK
      ?auto_101375 - BLOCK
      ?auto_101376 - BLOCK
      ?auto_101377 - BLOCK
      ?auto_101378 - BLOCK
    )
    :vars
    (
      ?auto_101379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101373 ) ( ON ?auto_101374 ?auto_101373 ) ( ON ?auto_101375 ?auto_101374 ) ( not ( = ?auto_101373 ?auto_101374 ) ) ( not ( = ?auto_101373 ?auto_101375 ) ) ( not ( = ?auto_101373 ?auto_101376 ) ) ( not ( = ?auto_101373 ?auto_101377 ) ) ( not ( = ?auto_101373 ?auto_101378 ) ) ( not ( = ?auto_101374 ?auto_101375 ) ) ( not ( = ?auto_101374 ?auto_101376 ) ) ( not ( = ?auto_101374 ?auto_101377 ) ) ( not ( = ?auto_101374 ?auto_101378 ) ) ( not ( = ?auto_101375 ?auto_101376 ) ) ( not ( = ?auto_101375 ?auto_101377 ) ) ( not ( = ?auto_101375 ?auto_101378 ) ) ( not ( = ?auto_101376 ?auto_101377 ) ) ( not ( = ?auto_101376 ?auto_101378 ) ) ( not ( = ?auto_101377 ?auto_101378 ) ) ( ON ?auto_101378 ?auto_101379 ) ( not ( = ?auto_101373 ?auto_101379 ) ) ( not ( = ?auto_101374 ?auto_101379 ) ) ( not ( = ?auto_101375 ?auto_101379 ) ) ( not ( = ?auto_101376 ?auto_101379 ) ) ( not ( = ?auto_101377 ?auto_101379 ) ) ( not ( = ?auto_101378 ?auto_101379 ) ) ( ON ?auto_101377 ?auto_101378 ) ( ON-TABLE ?auto_101379 ) ( CLEAR ?auto_101375 ) ( ON ?auto_101376 ?auto_101377 ) ( CLEAR ?auto_101376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101379 ?auto_101378 ?auto_101377 )
      ( MAKE-6PILE ?auto_101373 ?auto_101374 ?auto_101375 ?auto_101376 ?auto_101377 ?auto_101378 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101380 - BLOCK
      ?auto_101381 - BLOCK
      ?auto_101382 - BLOCK
      ?auto_101383 - BLOCK
      ?auto_101384 - BLOCK
      ?auto_101385 - BLOCK
    )
    :vars
    (
      ?auto_101386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101380 ) ( ON ?auto_101381 ?auto_101380 ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101380 ?auto_101382 ) ) ( not ( = ?auto_101380 ?auto_101383 ) ) ( not ( = ?auto_101380 ?auto_101384 ) ) ( not ( = ?auto_101380 ?auto_101385 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101383 ) ) ( not ( = ?auto_101381 ?auto_101384 ) ) ( not ( = ?auto_101381 ?auto_101385 ) ) ( not ( = ?auto_101382 ?auto_101383 ) ) ( not ( = ?auto_101382 ?auto_101384 ) ) ( not ( = ?auto_101382 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101384 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( not ( = ?auto_101384 ?auto_101385 ) ) ( ON ?auto_101385 ?auto_101386 ) ( not ( = ?auto_101380 ?auto_101386 ) ) ( not ( = ?auto_101381 ?auto_101386 ) ) ( not ( = ?auto_101382 ?auto_101386 ) ) ( not ( = ?auto_101383 ?auto_101386 ) ) ( not ( = ?auto_101384 ?auto_101386 ) ) ( not ( = ?auto_101385 ?auto_101386 ) ) ( ON ?auto_101384 ?auto_101385 ) ( ON-TABLE ?auto_101386 ) ( ON ?auto_101383 ?auto_101384 ) ( CLEAR ?auto_101383 ) ( HOLDING ?auto_101382 ) ( CLEAR ?auto_101381 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101380 ?auto_101381 ?auto_101382 )
      ( MAKE-6PILE ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ?auto_101385 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101387 - BLOCK
      ?auto_101388 - BLOCK
      ?auto_101389 - BLOCK
      ?auto_101390 - BLOCK
      ?auto_101391 - BLOCK
      ?auto_101392 - BLOCK
    )
    :vars
    (
      ?auto_101393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101387 ) ( ON ?auto_101388 ?auto_101387 ) ( not ( = ?auto_101387 ?auto_101388 ) ) ( not ( = ?auto_101387 ?auto_101389 ) ) ( not ( = ?auto_101387 ?auto_101390 ) ) ( not ( = ?auto_101387 ?auto_101391 ) ) ( not ( = ?auto_101387 ?auto_101392 ) ) ( not ( = ?auto_101388 ?auto_101389 ) ) ( not ( = ?auto_101388 ?auto_101390 ) ) ( not ( = ?auto_101388 ?auto_101391 ) ) ( not ( = ?auto_101388 ?auto_101392 ) ) ( not ( = ?auto_101389 ?auto_101390 ) ) ( not ( = ?auto_101389 ?auto_101391 ) ) ( not ( = ?auto_101389 ?auto_101392 ) ) ( not ( = ?auto_101390 ?auto_101391 ) ) ( not ( = ?auto_101390 ?auto_101392 ) ) ( not ( = ?auto_101391 ?auto_101392 ) ) ( ON ?auto_101392 ?auto_101393 ) ( not ( = ?auto_101387 ?auto_101393 ) ) ( not ( = ?auto_101388 ?auto_101393 ) ) ( not ( = ?auto_101389 ?auto_101393 ) ) ( not ( = ?auto_101390 ?auto_101393 ) ) ( not ( = ?auto_101391 ?auto_101393 ) ) ( not ( = ?auto_101392 ?auto_101393 ) ) ( ON ?auto_101391 ?auto_101392 ) ( ON-TABLE ?auto_101393 ) ( ON ?auto_101390 ?auto_101391 ) ( CLEAR ?auto_101388 ) ( ON ?auto_101389 ?auto_101390 ) ( CLEAR ?auto_101389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101393 ?auto_101392 ?auto_101391 ?auto_101390 )
      ( MAKE-6PILE ?auto_101387 ?auto_101388 ?auto_101389 ?auto_101390 ?auto_101391 ?auto_101392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101394 - BLOCK
      ?auto_101395 - BLOCK
      ?auto_101396 - BLOCK
      ?auto_101397 - BLOCK
      ?auto_101398 - BLOCK
      ?auto_101399 - BLOCK
    )
    :vars
    (
      ?auto_101400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101394 ) ( not ( = ?auto_101394 ?auto_101395 ) ) ( not ( = ?auto_101394 ?auto_101396 ) ) ( not ( = ?auto_101394 ?auto_101397 ) ) ( not ( = ?auto_101394 ?auto_101398 ) ) ( not ( = ?auto_101394 ?auto_101399 ) ) ( not ( = ?auto_101395 ?auto_101396 ) ) ( not ( = ?auto_101395 ?auto_101397 ) ) ( not ( = ?auto_101395 ?auto_101398 ) ) ( not ( = ?auto_101395 ?auto_101399 ) ) ( not ( = ?auto_101396 ?auto_101397 ) ) ( not ( = ?auto_101396 ?auto_101398 ) ) ( not ( = ?auto_101396 ?auto_101399 ) ) ( not ( = ?auto_101397 ?auto_101398 ) ) ( not ( = ?auto_101397 ?auto_101399 ) ) ( not ( = ?auto_101398 ?auto_101399 ) ) ( ON ?auto_101399 ?auto_101400 ) ( not ( = ?auto_101394 ?auto_101400 ) ) ( not ( = ?auto_101395 ?auto_101400 ) ) ( not ( = ?auto_101396 ?auto_101400 ) ) ( not ( = ?auto_101397 ?auto_101400 ) ) ( not ( = ?auto_101398 ?auto_101400 ) ) ( not ( = ?auto_101399 ?auto_101400 ) ) ( ON ?auto_101398 ?auto_101399 ) ( ON-TABLE ?auto_101400 ) ( ON ?auto_101397 ?auto_101398 ) ( ON ?auto_101396 ?auto_101397 ) ( CLEAR ?auto_101396 ) ( HOLDING ?auto_101395 ) ( CLEAR ?auto_101394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101394 ?auto_101395 )
      ( MAKE-6PILE ?auto_101394 ?auto_101395 ?auto_101396 ?auto_101397 ?auto_101398 ?auto_101399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101401 - BLOCK
      ?auto_101402 - BLOCK
      ?auto_101403 - BLOCK
      ?auto_101404 - BLOCK
      ?auto_101405 - BLOCK
      ?auto_101406 - BLOCK
    )
    :vars
    (
      ?auto_101407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101401 ) ( not ( = ?auto_101401 ?auto_101402 ) ) ( not ( = ?auto_101401 ?auto_101403 ) ) ( not ( = ?auto_101401 ?auto_101404 ) ) ( not ( = ?auto_101401 ?auto_101405 ) ) ( not ( = ?auto_101401 ?auto_101406 ) ) ( not ( = ?auto_101402 ?auto_101403 ) ) ( not ( = ?auto_101402 ?auto_101404 ) ) ( not ( = ?auto_101402 ?auto_101405 ) ) ( not ( = ?auto_101402 ?auto_101406 ) ) ( not ( = ?auto_101403 ?auto_101404 ) ) ( not ( = ?auto_101403 ?auto_101405 ) ) ( not ( = ?auto_101403 ?auto_101406 ) ) ( not ( = ?auto_101404 ?auto_101405 ) ) ( not ( = ?auto_101404 ?auto_101406 ) ) ( not ( = ?auto_101405 ?auto_101406 ) ) ( ON ?auto_101406 ?auto_101407 ) ( not ( = ?auto_101401 ?auto_101407 ) ) ( not ( = ?auto_101402 ?auto_101407 ) ) ( not ( = ?auto_101403 ?auto_101407 ) ) ( not ( = ?auto_101404 ?auto_101407 ) ) ( not ( = ?auto_101405 ?auto_101407 ) ) ( not ( = ?auto_101406 ?auto_101407 ) ) ( ON ?auto_101405 ?auto_101406 ) ( ON-TABLE ?auto_101407 ) ( ON ?auto_101404 ?auto_101405 ) ( ON ?auto_101403 ?auto_101404 ) ( CLEAR ?auto_101401 ) ( ON ?auto_101402 ?auto_101403 ) ( CLEAR ?auto_101402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101407 ?auto_101406 ?auto_101405 ?auto_101404 ?auto_101403 )
      ( MAKE-6PILE ?auto_101401 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101408 - BLOCK
      ?auto_101409 - BLOCK
      ?auto_101410 - BLOCK
      ?auto_101411 - BLOCK
      ?auto_101412 - BLOCK
      ?auto_101413 - BLOCK
    )
    :vars
    (
      ?auto_101414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101408 ?auto_101409 ) ) ( not ( = ?auto_101408 ?auto_101410 ) ) ( not ( = ?auto_101408 ?auto_101411 ) ) ( not ( = ?auto_101408 ?auto_101412 ) ) ( not ( = ?auto_101408 ?auto_101413 ) ) ( not ( = ?auto_101409 ?auto_101410 ) ) ( not ( = ?auto_101409 ?auto_101411 ) ) ( not ( = ?auto_101409 ?auto_101412 ) ) ( not ( = ?auto_101409 ?auto_101413 ) ) ( not ( = ?auto_101410 ?auto_101411 ) ) ( not ( = ?auto_101410 ?auto_101412 ) ) ( not ( = ?auto_101410 ?auto_101413 ) ) ( not ( = ?auto_101411 ?auto_101412 ) ) ( not ( = ?auto_101411 ?auto_101413 ) ) ( not ( = ?auto_101412 ?auto_101413 ) ) ( ON ?auto_101413 ?auto_101414 ) ( not ( = ?auto_101408 ?auto_101414 ) ) ( not ( = ?auto_101409 ?auto_101414 ) ) ( not ( = ?auto_101410 ?auto_101414 ) ) ( not ( = ?auto_101411 ?auto_101414 ) ) ( not ( = ?auto_101412 ?auto_101414 ) ) ( not ( = ?auto_101413 ?auto_101414 ) ) ( ON ?auto_101412 ?auto_101413 ) ( ON-TABLE ?auto_101414 ) ( ON ?auto_101411 ?auto_101412 ) ( ON ?auto_101410 ?auto_101411 ) ( ON ?auto_101409 ?auto_101410 ) ( CLEAR ?auto_101409 ) ( HOLDING ?auto_101408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101408 )
      ( MAKE-6PILE ?auto_101408 ?auto_101409 ?auto_101410 ?auto_101411 ?auto_101412 ?auto_101413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101415 - BLOCK
      ?auto_101416 - BLOCK
      ?auto_101417 - BLOCK
      ?auto_101418 - BLOCK
      ?auto_101419 - BLOCK
      ?auto_101420 - BLOCK
    )
    :vars
    (
      ?auto_101421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101415 ?auto_101416 ) ) ( not ( = ?auto_101415 ?auto_101417 ) ) ( not ( = ?auto_101415 ?auto_101418 ) ) ( not ( = ?auto_101415 ?auto_101419 ) ) ( not ( = ?auto_101415 ?auto_101420 ) ) ( not ( = ?auto_101416 ?auto_101417 ) ) ( not ( = ?auto_101416 ?auto_101418 ) ) ( not ( = ?auto_101416 ?auto_101419 ) ) ( not ( = ?auto_101416 ?auto_101420 ) ) ( not ( = ?auto_101417 ?auto_101418 ) ) ( not ( = ?auto_101417 ?auto_101419 ) ) ( not ( = ?auto_101417 ?auto_101420 ) ) ( not ( = ?auto_101418 ?auto_101419 ) ) ( not ( = ?auto_101418 ?auto_101420 ) ) ( not ( = ?auto_101419 ?auto_101420 ) ) ( ON ?auto_101420 ?auto_101421 ) ( not ( = ?auto_101415 ?auto_101421 ) ) ( not ( = ?auto_101416 ?auto_101421 ) ) ( not ( = ?auto_101417 ?auto_101421 ) ) ( not ( = ?auto_101418 ?auto_101421 ) ) ( not ( = ?auto_101419 ?auto_101421 ) ) ( not ( = ?auto_101420 ?auto_101421 ) ) ( ON ?auto_101419 ?auto_101420 ) ( ON-TABLE ?auto_101421 ) ( ON ?auto_101418 ?auto_101419 ) ( ON ?auto_101417 ?auto_101418 ) ( ON ?auto_101416 ?auto_101417 ) ( ON ?auto_101415 ?auto_101416 ) ( CLEAR ?auto_101415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101421 ?auto_101420 ?auto_101419 ?auto_101418 ?auto_101417 ?auto_101416 )
      ( MAKE-6PILE ?auto_101415 ?auto_101416 ?auto_101417 ?auto_101418 ?auto_101419 ?auto_101420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101428 - BLOCK
      ?auto_101429 - BLOCK
      ?auto_101430 - BLOCK
      ?auto_101431 - BLOCK
      ?auto_101432 - BLOCK
      ?auto_101433 - BLOCK
    )
    :vars
    (
      ?auto_101434 - BLOCK
      ?auto_101435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101428 ?auto_101429 ) ) ( not ( = ?auto_101428 ?auto_101430 ) ) ( not ( = ?auto_101428 ?auto_101431 ) ) ( not ( = ?auto_101428 ?auto_101432 ) ) ( not ( = ?auto_101428 ?auto_101433 ) ) ( not ( = ?auto_101429 ?auto_101430 ) ) ( not ( = ?auto_101429 ?auto_101431 ) ) ( not ( = ?auto_101429 ?auto_101432 ) ) ( not ( = ?auto_101429 ?auto_101433 ) ) ( not ( = ?auto_101430 ?auto_101431 ) ) ( not ( = ?auto_101430 ?auto_101432 ) ) ( not ( = ?auto_101430 ?auto_101433 ) ) ( not ( = ?auto_101431 ?auto_101432 ) ) ( not ( = ?auto_101431 ?auto_101433 ) ) ( not ( = ?auto_101432 ?auto_101433 ) ) ( ON ?auto_101433 ?auto_101434 ) ( not ( = ?auto_101428 ?auto_101434 ) ) ( not ( = ?auto_101429 ?auto_101434 ) ) ( not ( = ?auto_101430 ?auto_101434 ) ) ( not ( = ?auto_101431 ?auto_101434 ) ) ( not ( = ?auto_101432 ?auto_101434 ) ) ( not ( = ?auto_101433 ?auto_101434 ) ) ( ON ?auto_101432 ?auto_101433 ) ( ON-TABLE ?auto_101434 ) ( ON ?auto_101431 ?auto_101432 ) ( ON ?auto_101430 ?auto_101431 ) ( ON ?auto_101429 ?auto_101430 ) ( CLEAR ?auto_101429 ) ( ON ?auto_101428 ?auto_101435 ) ( CLEAR ?auto_101428 ) ( HAND-EMPTY ) ( not ( = ?auto_101428 ?auto_101435 ) ) ( not ( = ?auto_101429 ?auto_101435 ) ) ( not ( = ?auto_101430 ?auto_101435 ) ) ( not ( = ?auto_101431 ?auto_101435 ) ) ( not ( = ?auto_101432 ?auto_101435 ) ) ( not ( = ?auto_101433 ?auto_101435 ) ) ( not ( = ?auto_101434 ?auto_101435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101428 ?auto_101435 )
      ( MAKE-6PILE ?auto_101428 ?auto_101429 ?auto_101430 ?auto_101431 ?auto_101432 ?auto_101433 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101436 - BLOCK
      ?auto_101437 - BLOCK
      ?auto_101438 - BLOCK
      ?auto_101439 - BLOCK
      ?auto_101440 - BLOCK
      ?auto_101441 - BLOCK
    )
    :vars
    (
      ?auto_101443 - BLOCK
      ?auto_101442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101436 ?auto_101437 ) ) ( not ( = ?auto_101436 ?auto_101438 ) ) ( not ( = ?auto_101436 ?auto_101439 ) ) ( not ( = ?auto_101436 ?auto_101440 ) ) ( not ( = ?auto_101436 ?auto_101441 ) ) ( not ( = ?auto_101437 ?auto_101438 ) ) ( not ( = ?auto_101437 ?auto_101439 ) ) ( not ( = ?auto_101437 ?auto_101440 ) ) ( not ( = ?auto_101437 ?auto_101441 ) ) ( not ( = ?auto_101438 ?auto_101439 ) ) ( not ( = ?auto_101438 ?auto_101440 ) ) ( not ( = ?auto_101438 ?auto_101441 ) ) ( not ( = ?auto_101439 ?auto_101440 ) ) ( not ( = ?auto_101439 ?auto_101441 ) ) ( not ( = ?auto_101440 ?auto_101441 ) ) ( ON ?auto_101441 ?auto_101443 ) ( not ( = ?auto_101436 ?auto_101443 ) ) ( not ( = ?auto_101437 ?auto_101443 ) ) ( not ( = ?auto_101438 ?auto_101443 ) ) ( not ( = ?auto_101439 ?auto_101443 ) ) ( not ( = ?auto_101440 ?auto_101443 ) ) ( not ( = ?auto_101441 ?auto_101443 ) ) ( ON ?auto_101440 ?auto_101441 ) ( ON-TABLE ?auto_101443 ) ( ON ?auto_101439 ?auto_101440 ) ( ON ?auto_101438 ?auto_101439 ) ( ON ?auto_101436 ?auto_101442 ) ( CLEAR ?auto_101436 ) ( not ( = ?auto_101436 ?auto_101442 ) ) ( not ( = ?auto_101437 ?auto_101442 ) ) ( not ( = ?auto_101438 ?auto_101442 ) ) ( not ( = ?auto_101439 ?auto_101442 ) ) ( not ( = ?auto_101440 ?auto_101442 ) ) ( not ( = ?auto_101441 ?auto_101442 ) ) ( not ( = ?auto_101443 ?auto_101442 ) ) ( HOLDING ?auto_101437 ) ( CLEAR ?auto_101438 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101443 ?auto_101441 ?auto_101440 ?auto_101439 ?auto_101438 ?auto_101437 )
      ( MAKE-6PILE ?auto_101436 ?auto_101437 ?auto_101438 ?auto_101439 ?auto_101440 ?auto_101441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101444 - BLOCK
      ?auto_101445 - BLOCK
      ?auto_101446 - BLOCK
      ?auto_101447 - BLOCK
      ?auto_101448 - BLOCK
      ?auto_101449 - BLOCK
    )
    :vars
    (
      ?auto_101451 - BLOCK
      ?auto_101450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101444 ?auto_101445 ) ) ( not ( = ?auto_101444 ?auto_101446 ) ) ( not ( = ?auto_101444 ?auto_101447 ) ) ( not ( = ?auto_101444 ?auto_101448 ) ) ( not ( = ?auto_101444 ?auto_101449 ) ) ( not ( = ?auto_101445 ?auto_101446 ) ) ( not ( = ?auto_101445 ?auto_101447 ) ) ( not ( = ?auto_101445 ?auto_101448 ) ) ( not ( = ?auto_101445 ?auto_101449 ) ) ( not ( = ?auto_101446 ?auto_101447 ) ) ( not ( = ?auto_101446 ?auto_101448 ) ) ( not ( = ?auto_101446 ?auto_101449 ) ) ( not ( = ?auto_101447 ?auto_101448 ) ) ( not ( = ?auto_101447 ?auto_101449 ) ) ( not ( = ?auto_101448 ?auto_101449 ) ) ( ON ?auto_101449 ?auto_101451 ) ( not ( = ?auto_101444 ?auto_101451 ) ) ( not ( = ?auto_101445 ?auto_101451 ) ) ( not ( = ?auto_101446 ?auto_101451 ) ) ( not ( = ?auto_101447 ?auto_101451 ) ) ( not ( = ?auto_101448 ?auto_101451 ) ) ( not ( = ?auto_101449 ?auto_101451 ) ) ( ON ?auto_101448 ?auto_101449 ) ( ON-TABLE ?auto_101451 ) ( ON ?auto_101447 ?auto_101448 ) ( ON ?auto_101446 ?auto_101447 ) ( ON ?auto_101444 ?auto_101450 ) ( not ( = ?auto_101444 ?auto_101450 ) ) ( not ( = ?auto_101445 ?auto_101450 ) ) ( not ( = ?auto_101446 ?auto_101450 ) ) ( not ( = ?auto_101447 ?auto_101450 ) ) ( not ( = ?auto_101448 ?auto_101450 ) ) ( not ( = ?auto_101449 ?auto_101450 ) ) ( not ( = ?auto_101451 ?auto_101450 ) ) ( CLEAR ?auto_101446 ) ( ON ?auto_101445 ?auto_101444 ) ( CLEAR ?auto_101445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101450 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101450 ?auto_101444 )
      ( MAKE-6PILE ?auto_101444 ?auto_101445 ?auto_101446 ?auto_101447 ?auto_101448 ?auto_101449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101452 - BLOCK
      ?auto_101453 - BLOCK
      ?auto_101454 - BLOCK
      ?auto_101455 - BLOCK
      ?auto_101456 - BLOCK
      ?auto_101457 - BLOCK
    )
    :vars
    (
      ?auto_101458 - BLOCK
      ?auto_101459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101452 ?auto_101453 ) ) ( not ( = ?auto_101452 ?auto_101454 ) ) ( not ( = ?auto_101452 ?auto_101455 ) ) ( not ( = ?auto_101452 ?auto_101456 ) ) ( not ( = ?auto_101452 ?auto_101457 ) ) ( not ( = ?auto_101453 ?auto_101454 ) ) ( not ( = ?auto_101453 ?auto_101455 ) ) ( not ( = ?auto_101453 ?auto_101456 ) ) ( not ( = ?auto_101453 ?auto_101457 ) ) ( not ( = ?auto_101454 ?auto_101455 ) ) ( not ( = ?auto_101454 ?auto_101456 ) ) ( not ( = ?auto_101454 ?auto_101457 ) ) ( not ( = ?auto_101455 ?auto_101456 ) ) ( not ( = ?auto_101455 ?auto_101457 ) ) ( not ( = ?auto_101456 ?auto_101457 ) ) ( ON ?auto_101457 ?auto_101458 ) ( not ( = ?auto_101452 ?auto_101458 ) ) ( not ( = ?auto_101453 ?auto_101458 ) ) ( not ( = ?auto_101454 ?auto_101458 ) ) ( not ( = ?auto_101455 ?auto_101458 ) ) ( not ( = ?auto_101456 ?auto_101458 ) ) ( not ( = ?auto_101457 ?auto_101458 ) ) ( ON ?auto_101456 ?auto_101457 ) ( ON-TABLE ?auto_101458 ) ( ON ?auto_101455 ?auto_101456 ) ( ON ?auto_101452 ?auto_101459 ) ( not ( = ?auto_101452 ?auto_101459 ) ) ( not ( = ?auto_101453 ?auto_101459 ) ) ( not ( = ?auto_101454 ?auto_101459 ) ) ( not ( = ?auto_101455 ?auto_101459 ) ) ( not ( = ?auto_101456 ?auto_101459 ) ) ( not ( = ?auto_101457 ?auto_101459 ) ) ( not ( = ?auto_101458 ?auto_101459 ) ) ( ON ?auto_101453 ?auto_101452 ) ( CLEAR ?auto_101453 ) ( ON-TABLE ?auto_101459 ) ( HOLDING ?auto_101454 ) ( CLEAR ?auto_101455 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101458 ?auto_101457 ?auto_101456 ?auto_101455 ?auto_101454 )
      ( MAKE-6PILE ?auto_101452 ?auto_101453 ?auto_101454 ?auto_101455 ?auto_101456 ?auto_101457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101460 - BLOCK
      ?auto_101461 - BLOCK
      ?auto_101462 - BLOCK
      ?auto_101463 - BLOCK
      ?auto_101464 - BLOCK
      ?auto_101465 - BLOCK
    )
    :vars
    (
      ?auto_101467 - BLOCK
      ?auto_101466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101460 ?auto_101461 ) ) ( not ( = ?auto_101460 ?auto_101462 ) ) ( not ( = ?auto_101460 ?auto_101463 ) ) ( not ( = ?auto_101460 ?auto_101464 ) ) ( not ( = ?auto_101460 ?auto_101465 ) ) ( not ( = ?auto_101461 ?auto_101462 ) ) ( not ( = ?auto_101461 ?auto_101463 ) ) ( not ( = ?auto_101461 ?auto_101464 ) ) ( not ( = ?auto_101461 ?auto_101465 ) ) ( not ( = ?auto_101462 ?auto_101463 ) ) ( not ( = ?auto_101462 ?auto_101464 ) ) ( not ( = ?auto_101462 ?auto_101465 ) ) ( not ( = ?auto_101463 ?auto_101464 ) ) ( not ( = ?auto_101463 ?auto_101465 ) ) ( not ( = ?auto_101464 ?auto_101465 ) ) ( ON ?auto_101465 ?auto_101467 ) ( not ( = ?auto_101460 ?auto_101467 ) ) ( not ( = ?auto_101461 ?auto_101467 ) ) ( not ( = ?auto_101462 ?auto_101467 ) ) ( not ( = ?auto_101463 ?auto_101467 ) ) ( not ( = ?auto_101464 ?auto_101467 ) ) ( not ( = ?auto_101465 ?auto_101467 ) ) ( ON ?auto_101464 ?auto_101465 ) ( ON-TABLE ?auto_101467 ) ( ON ?auto_101463 ?auto_101464 ) ( ON ?auto_101460 ?auto_101466 ) ( not ( = ?auto_101460 ?auto_101466 ) ) ( not ( = ?auto_101461 ?auto_101466 ) ) ( not ( = ?auto_101462 ?auto_101466 ) ) ( not ( = ?auto_101463 ?auto_101466 ) ) ( not ( = ?auto_101464 ?auto_101466 ) ) ( not ( = ?auto_101465 ?auto_101466 ) ) ( not ( = ?auto_101467 ?auto_101466 ) ) ( ON ?auto_101461 ?auto_101460 ) ( ON-TABLE ?auto_101466 ) ( CLEAR ?auto_101463 ) ( ON ?auto_101462 ?auto_101461 ) ( CLEAR ?auto_101462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101466 ?auto_101460 ?auto_101461 )
      ( MAKE-6PILE ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ?auto_101464 ?auto_101465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101468 - BLOCK
      ?auto_101469 - BLOCK
      ?auto_101470 - BLOCK
      ?auto_101471 - BLOCK
      ?auto_101472 - BLOCK
      ?auto_101473 - BLOCK
    )
    :vars
    (
      ?auto_101475 - BLOCK
      ?auto_101474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101468 ?auto_101469 ) ) ( not ( = ?auto_101468 ?auto_101470 ) ) ( not ( = ?auto_101468 ?auto_101471 ) ) ( not ( = ?auto_101468 ?auto_101472 ) ) ( not ( = ?auto_101468 ?auto_101473 ) ) ( not ( = ?auto_101469 ?auto_101470 ) ) ( not ( = ?auto_101469 ?auto_101471 ) ) ( not ( = ?auto_101469 ?auto_101472 ) ) ( not ( = ?auto_101469 ?auto_101473 ) ) ( not ( = ?auto_101470 ?auto_101471 ) ) ( not ( = ?auto_101470 ?auto_101472 ) ) ( not ( = ?auto_101470 ?auto_101473 ) ) ( not ( = ?auto_101471 ?auto_101472 ) ) ( not ( = ?auto_101471 ?auto_101473 ) ) ( not ( = ?auto_101472 ?auto_101473 ) ) ( ON ?auto_101473 ?auto_101475 ) ( not ( = ?auto_101468 ?auto_101475 ) ) ( not ( = ?auto_101469 ?auto_101475 ) ) ( not ( = ?auto_101470 ?auto_101475 ) ) ( not ( = ?auto_101471 ?auto_101475 ) ) ( not ( = ?auto_101472 ?auto_101475 ) ) ( not ( = ?auto_101473 ?auto_101475 ) ) ( ON ?auto_101472 ?auto_101473 ) ( ON-TABLE ?auto_101475 ) ( ON ?auto_101468 ?auto_101474 ) ( not ( = ?auto_101468 ?auto_101474 ) ) ( not ( = ?auto_101469 ?auto_101474 ) ) ( not ( = ?auto_101470 ?auto_101474 ) ) ( not ( = ?auto_101471 ?auto_101474 ) ) ( not ( = ?auto_101472 ?auto_101474 ) ) ( not ( = ?auto_101473 ?auto_101474 ) ) ( not ( = ?auto_101475 ?auto_101474 ) ) ( ON ?auto_101469 ?auto_101468 ) ( ON-TABLE ?auto_101474 ) ( ON ?auto_101470 ?auto_101469 ) ( CLEAR ?auto_101470 ) ( HOLDING ?auto_101471 ) ( CLEAR ?auto_101472 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101475 ?auto_101473 ?auto_101472 ?auto_101471 )
      ( MAKE-6PILE ?auto_101468 ?auto_101469 ?auto_101470 ?auto_101471 ?auto_101472 ?auto_101473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101476 - BLOCK
      ?auto_101477 - BLOCK
      ?auto_101478 - BLOCK
      ?auto_101479 - BLOCK
      ?auto_101480 - BLOCK
      ?auto_101481 - BLOCK
    )
    :vars
    (
      ?auto_101483 - BLOCK
      ?auto_101482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101476 ?auto_101477 ) ) ( not ( = ?auto_101476 ?auto_101478 ) ) ( not ( = ?auto_101476 ?auto_101479 ) ) ( not ( = ?auto_101476 ?auto_101480 ) ) ( not ( = ?auto_101476 ?auto_101481 ) ) ( not ( = ?auto_101477 ?auto_101478 ) ) ( not ( = ?auto_101477 ?auto_101479 ) ) ( not ( = ?auto_101477 ?auto_101480 ) ) ( not ( = ?auto_101477 ?auto_101481 ) ) ( not ( = ?auto_101478 ?auto_101479 ) ) ( not ( = ?auto_101478 ?auto_101480 ) ) ( not ( = ?auto_101478 ?auto_101481 ) ) ( not ( = ?auto_101479 ?auto_101480 ) ) ( not ( = ?auto_101479 ?auto_101481 ) ) ( not ( = ?auto_101480 ?auto_101481 ) ) ( ON ?auto_101481 ?auto_101483 ) ( not ( = ?auto_101476 ?auto_101483 ) ) ( not ( = ?auto_101477 ?auto_101483 ) ) ( not ( = ?auto_101478 ?auto_101483 ) ) ( not ( = ?auto_101479 ?auto_101483 ) ) ( not ( = ?auto_101480 ?auto_101483 ) ) ( not ( = ?auto_101481 ?auto_101483 ) ) ( ON ?auto_101480 ?auto_101481 ) ( ON-TABLE ?auto_101483 ) ( ON ?auto_101476 ?auto_101482 ) ( not ( = ?auto_101476 ?auto_101482 ) ) ( not ( = ?auto_101477 ?auto_101482 ) ) ( not ( = ?auto_101478 ?auto_101482 ) ) ( not ( = ?auto_101479 ?auto_101482 ) ) ( not ( = ?auto_101480 ?auto_101482 ) ) ( not ( = ?auto_101481 ?auto_101482 ) ) ( not ( = ?auto_101483 ?auto_101482 ) ) ( ON ?auto_101477 ?auto_101476 ) ( ON-TABLE ?auto_101482 ) ( ON ?auto_101478 ?auto_101477 ) ( CLEAR ?auto_101480 ) ( ON ?auto_101479 ?auto_101478 ) ( CLEAR ?auto_101479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101482 ?auto_101476 ?auto_101477 ?auto_101478 )
      ( MAKE-6PILE ?auto_101476 ?auto_101477 ?auto_101478 ?auto_101479 ?auto_101480 ?auto_101481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101484 - BLOCK
      ?auto_101485 - BLOCK
      ?auto_101486 - BLOCK
      ?auto_101487 - BLOCK
      ?auto_101488 - BLOCK
      ?auto_101489 - BLOCK
    )
    :vars
    (
      ?auto_101491 - BLOCK
      ?auto_101490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101484 ?auto_101485 ) ) ( not ( = ?auto_101484 ?auto_101486 ) ) ( not ( = ?auto_101484 ?auto_101487 ) ) ( not ( = ?auto_101484 ?auto_101488 ) ) ( not ( = ?auto_101484 ?auto_101489 ) ) ( not ( = ?auto_101485 ?auto_101486 ) ) ( not ( = ?auto_101485 ?auto_101487 ) ) ( not ( = ?auto_101485 ?auto_101488 ) ) ( not ( = ?auto_101485 ?auto_101489 ) ) ( not ( = ?auto_101486 ?auto_101487 ) ) ( not ( = ?auto_101486 ?auto_101488 ) ) ( not ( = ?auto_101486 ?auto_101489 ) ) ( not ( = ?auto_101487 ?auto_101488 ) ) ( not ( = ?auto_101487 ?auto_101489 ) ) ( not ( = ?auto_101488 ?auto_101489 ) ) ( ON ?auto_101489 ?auto_101491 ) ( not ( = ?auto_101484 ?auto_101491 ) ) ( not ( = ?auto_101485 ?auto_101491 ) ) ( not ( = ?auto_101486 ?auto_101491 ) ) ( not ( = ?auto_101487 ?auto_101491 ) ) ( not ( = ?auto_101488 ?auto_101491 ) ) ( not ( = ?auto_101489 ?auto_101491 ) ) ( ON-TABLE ?auto_101491 ) ( ON ?auto_101484 ?auto_101490 ) ( not ( = ?auto_101484 ?auto_101490 ) ) ( not ( = ?auto_101485 ?auto_101490 ) ) ( not ( = ?auto_101486 ?auto_101490 ) ) ( not ( = ?auto_101487 ?auto_101490 ) ) ( not ( = ?auto_101488 ?auto_101490 ) ) ( not ( = ?auto_101489 ?auto_101490 ) ) ( not ( = ?auto_101491 ?auto_101490 ) ) ( ON ?auto_101485 ?auto_101484 ) ( ON-TABLE ?auto_101490 ) ( ON ?auto_101486 ?auto_101485 ) ( ON ?auto_101487 ?auto_101486 ) ( CLEAR ?auto_101487 ) ( HOLDING ?auto_101488 ) ( CLEAR ?auto_101489 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101491 ?auto_101489 ?auto_101488 )
      ( MAKE-6PILE ?auto_101484 ?auto_101485 ?auto_101486 ?auto_101487 ?auto_101488 ?auto_101489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101492 - BLOCK
      ?auto_101493 - BLOCK
      ?auto_101494 - BLOCK
      ?auto_101495 - BLOCK
      ?auto_101496 - BLOCK
      ?auto_101497 - BLOCK
    )
    :vars
    (
      ?auto_101498 - BLOCK
      ?auto_101499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101492 ?auto_101493 ) ) ( not ( = ?auto_101492 ?auto_101494 ) ) ( not ( = ?auto_101492 ?auto_101495 ) ) ( not ( = ?auto_101492 ?auto_101496 ) ) ( not ( = ?auto_101492 ?auto_101497 ) ) ( not ( = ?auto_101493 ?auto_101494 ) ) ( not ( = ?auto_101493 ?auto_101495 ) ) ( not ( = ?auto_101493 ?auto_101496 ) ) ( not ( = ?auto_101493 ?auto_101497 ) ) ( not ( = ?auto_101494 ?auto_101495 ) ) ( not ( = ?auto_101494 ?auto_101496 ) ) ( not ( = ?auto_101494 ?auto_101497 ) ) ( not ( = ?auto_101495 ?auto_101496 ) ) ( not ( = ?auto_101495 ?auto_101497 ) ) ( not ( = ?auto_101496 ?auto_101497 ) ) ( ON ?auto_101497 ?auto_101498 ) ( not ( = ?auto_101492 ?auto_101498 ) ) ( not ( = ?auto_101493 ?auto_101498 ) ) ( not ( = ?auto_101494 ?auto_101498 ) ) ( not ( = ?auto_101495 ?auto_101498 ) ) ( not ( = ?auto_101496 ?auto_101498 ) ) ( not ( = ?auto_101497 ?auto_101498 ) ) ( ON-TABLE ?auto_101498 ) ( ON ?auto_101492 ?auto_101499 ) ( not ( = ?auto_101492 ?auto_101499 ) ) ( not ( = ?auto_101493 ?auto_101499 ) ) ( not ( = ?auto_101494 ?auto_101499 ) ) ( not ( = ?auto_101495 ?auto_101499 ) ) ( not ( = ?auto_101496 ?auto_101499 ) ) ( not ( = ?auto_101497 ?auto_101499 ) ) ( not ( = ?auto_101498 ?auto_101499 ) ) ( ON ?auto_101493 ?auto_101492 ) ( ON-TABLE ?auto_101499 ) ( ON ?auto_101494 ?auto_101493 ) ( ON ?auto_101495 ?auto_101494 ) ( CLEAR ?auto_101497 ) ( ON ?auto_101496 ?auto_101495 ) ( CLEAR ?auto_101496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101499 ?auto_101492 ?auto_101493 ?auto_101494 ?auto_101495 )
      ( MAKE-6PILE ?auto_101492 ?auto_101493 ?auto_101494 ?auto_101495 ?auto_101496 ?auto_101497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101500 - BLOCK
      ?auto_101501 - BLOCK
      ?auto_101502 - BLOCK
      ?auto_101503 - BLOCK
      ?auto_101504 - BLOCK
      ?auto_101505 - BLOCK
    )
    :vars
    (
      ?auto_101506 - BLOCK
      ?auto_101507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101500 ?auto_101501 ) ) ( not ( = ?auto_101500 ?auto_101502 ) ) ( not ( = ?auto_101500 ?auto_101503 ) ) ( not ( = ?auto_101500 ?auto_101504 ) ) ( not ( = ?auto_101500 ?auto_101505 ) ) ( not ( = ?auto_101501 ?auto_101502 ) ) ( not ( = ?auto_101501 ?auto_101503 ) ) ( not ( = ?auto_101501 ?auto_101504 ) ) ( not ( = ?auto_101501 ?auto_101505 ) ) ( not ( = ?auto_101502 ?auto_101503 ) ) ( not ( = ?auto_101502 ?auto_101504 ) ) ( not ( = ?auto_101502 ?auto_101505 ) ) ( not ( = ?auto_101503 ?auto_101504 ) ) ( not ( = ?auto_101503 ?auto_101505 ) ) ( not ( = ?auto_101504 ?auto_101505 ) ) ( not ( = ?auto_101500 ?auto_101506 ) ) ( not ( = ?auto_101501 ?auto_101506 ) ) ( not ( = ?auto_101502 ?auto_101506 ) ) ( not ( = ?auto_101503 ?auto_101506 ) ) ( not ( = ?auto_101504 ?auto_101506 ) ) ( not ( = ?auto_101505 ?auto_101506 ) ) ( ON-TABLE ?auto_101506 ) ( ON ?auto_101500 ?auto_101507 ) ( not ( = ?auto_101500 ?auto_101507 ) ) ( not ( = ?auto_101501 ?auto_101507 ) ) ( not ( = ?auto_101502 ?auto_101507 ) ) ( not ( = ?auto_101503 ?auto_101507 ) ) ( not ( = ?auto_101504 ?auto_101507 ) ) ( not ( = ?auto_101505 ?auto_101507 ) ) ( not ( = ?auto_101506 ?auto_101507 ) ) ( ON ?auto_101501 ?auto_101500 ) ( ON-TABLE ?auto_101507 ) ( ON ?auto_101502 ?auto_101501 ) ( ON ?auto_101503 ?auto_101502 ) ( ON ?auto_101504 ?auto_101503 ) ( CLEAR ?auto_101504 ) ( HOLDING ?auto_101505 ) ( CLEAR ?auto_101506 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101506 ?auto_101505 )
      ( MAKE-6PILE ?auto_101500 ?auto_101501 ?auto_101502 ?auto_101503 ?auto_101504 ?auto_101505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101508 - BLOCK
      ?auto_101509 - BLOCK
      ?auto_101510 - BLOCK
      ?auto_101511 - BLOCK
      ?auto_101512 - BLOCK
      ?auto_101513 - BLOCK
    )
    :vars
    (
      ?auto_101515 - BLOCK
      ?auto_101514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101508 ?auto_101509 ) ) ( not ( = ?auto_101508 ?auto_101510 ) ) ( not ( = ?auto_101508 ?auto_101511 ) ) ( not ( = ?auto_101508 ?auto_101512 ) ) ( not ( = ?auto_101508 ?auto_101513 ) ) ( not ( = ?auto_101509 ?auto_101510 ) ) ( not ( = ?auto_101509 ?auto_101511 ) ) ( not ( = ?auto_101509 ?auto_101512 ) ) ( not ( = ?auto_101509 ?auto_101513 ) ) ( not ( = ?auto_101510 ?auto_101511 ) ) ( not ( = ?auto_101510 ?auto_101512 ) ) ( not ( = ?auto_101510 ?auto_101513 ) ) ( not ( = ?auto_101511 ?auto_101512 ) ) ( not ( = ?auto_101511 ?auto_101513 ) ) ( not ( = ?auto_101512 ?auto_101513 ) ) ( not ( = ?auto_101508 ?auto_101515 ) ) ( not ( = ?auto_101509 ?auto_101515 ) ) ( not ( = ?auto_101510 ?auto_101515 ) ) ( not ( = ?auto_101511 ?auto_101515 ) ) ( not ( = ?auto_101512 ?auto_101515 ) ) ( not ( = ?auto_101513 ?auto_101515 ) ) ( ON-TABLE ?auto_101515 ) ( ON ?auto_101508 ?auto_101514 ) ( not ( = ?auto_101508 ?auto_101514 ) ) ( not ( = ?auto_101509 ?auto_101514 ) ) ( not ( = ?auto_101510 ?auto_101514 ) ) ( not ( = ?auto_101511 ?auto_101514 ) ) ( not ( = ?auto_101512 ?auto_101514 ) ) ( not ( = ?auto_101513 ?auto_101514 ) ) ( not ( = ?auto_101515 ?auto_101514 ) ) ( ON ?auto_101509 ?auto_101508 ) ( ON-TABLE ?auto_101514 ) ( ON ?auto_101510 ?auto_101509 ) ( ON ?auto_101511 ?auto_101510 ) ( ON ?auto_101512 ?auto_101511 ) ( CLEAR ?auto_101515 ) ( ON ?auto_101513 ?auto_101512 ) ( CLEAR ?auto_101513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101514 ?auto_101508 ?auto_101509 ?auto_101510 ?auto_101511 ?auto_101512 )
      ( MAKE-6PILE ?auto_101508 ?auto_101509 ?auto_101510 ?auto_101511 ?auto_101512 ?auto_101513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101516 - BLOCK
      ?auto_101517 - BLOCK
      ?auto_101518 - BLOCK
      ?auto_101519 - BLOCK
      ?auto_101520 - BLOCK
      ?auto_101521 - BLOCK
    )
    :vars
    (
      ?auto_101522 - BLOCK
      ?auto_101523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101516 ?auto_101517 ) ) ( not ( = ?auto_101516 ?auto_101518 ) ) ( not ( = ?auto_101516 ?auto_101519 ) ) ( not ( = ?auto_101516 ?auto_101520 ) ) ( not ( = ?auto_101516 ?auto_101521 ) ) ( not ( = ?auto_101517 ?auto_101518 ) ) ( not ( = ?auto_101517 ?auto_101519 ) ) ( not ( = ?auto_101517 ?auto_101520 ) ) ( not ( = ?auto_101517 ?auto_101521 ) ) ( not ( = ?auto_101518 ?auto_101519 ) ) ( not ( = ?auto_101518 ?auto_101520 ) ) ( not ( = ?auto_101518 ?auto_101521 ) ) ( not ( = ?auto_101519 ?auto_101520 ) ) ( not ( = ?auto_101519 ?auto_101521 ) ) ( not ( = ?auto_101520 ?auto_101521 ) ) ( not ( = ?auto_101516 ?auto_101522 ) ) ( not ( = ?auto_101517 ?auto_101522 ) ) ( not ( = ?auto_101518 ?auto_101522 ) ) ( not ( = ?auto_101519 ?auto_101522 ) ) ( not ( = ?auto_101520 ?auto_101522 ) ) ( not ( = ?auto_101521 ?auto_101522 ) ) ( ON ?auto_101516 ?auto_101523 ) ( not ( = ?auto_101516 ?auto_101523 ) ) ( not ( = ?auto_101517 ?auto_101523 ) ) ( not ( = ?auto_101518 ?auto_101523 ) ) ( not ( = ?auto_101519 ?auto_101523 ) ) ( not ( = ?auto_101520 ?auto_101523 ) ) ( not ( = ?auto_101521 ?auto_101523 ) ) ( not ( = ?auto_101522 ?auto_101523 ) ) ( ON ?auto_101517 ?auto_101516 ) ( ON-TABLE ?auto_101523 ) ( ON ?auto_101518 ?auto_101517 ) ( ON ?auto_101519 ?auto_101518 ) ( ON ?auto_101520 ?auto_101519 ) ( ON ?auto_101521 ?auto_101520 ) ( CLEAR ?auto_101521 ) ( HOLDING ?auto_101522 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101522 )
      ( MAKE-6PILE ?auto_101516 ?auto_101517 ?auto_101518 ?auto_101519 ?auto_101520 ?auto_101521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101524 - BLOCK
      ?auto_101525 - BLOCK
      ?auto_101526 - BLOCK
      ?auto_101527 - BLOCK
      ?auto_101528 - BLOCK
      ?auto_101529 - BLOCK
    )
    :vars
    (
      ?auto_101531 - BLOCK
      ?auto_101530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101524 ?auto_101525 ) ) ( not ( = ?auto_101524 ?auto_101526 ) ) ( not ( = ?auto_101524 ?auto_101527 ) ) ( not ( = ?auto_101524 ?auto_101528 ) ) ( not ( = ?auto_101524 ?auto_101529 ) ) ( not ( = ?auto_101525 ?auto_101526 ) ) ( not ( = ?auto_101525 ?auto_101527 ) ) ( not ( = ?auto_101525 ?auto_101528 ) ) ( not ( = ?auto_101525 ?auto_101529 ) ) ( not ( = ?auto_101526 ?auto_101527 ) ) ( not ( = ?auto_101526 ?auto_101528 ) ) ( not ( = ?auto_101526 ?auto_101529 ) ) ( not ( = ?auto_101527 ?auto_101528 ) ) ( not ( = ?auto_101527 ?auto_101529 ) ) ( not ( = ?auto_101528 ?auto_101529 ) ) ( not ( = ?auto_101524 ?auto_101531 ) ) ( not ( = ?auto_101525 ?auto_101531 ) ) ( not ( = ?auto_101526 ?auto_101531 ) ) ( not ( = ?auto_101527 ?auto_101531 ) ) ( not ( = ?auto_101528 ?auto_101531 ) ) ( not ( = ?auto_101529 ?auto_101531 ) ) ( ON ?auto_101524 ?auto_101530 ) ( not ( = ?auto_101524 ?auto_101530 ) ) ( not ( = ?auto_101525 ?auto_101530 ) ) ( not ( = ?auto_101526 ?auto_101530 ) ) ( not ( = ?auto_101527 ?auto_101530 ) ) ( not ( = ?auto_101528 ?auto_101530 ) ) ( not ( = ?auto_101529 ?auto_101530 ) ) ( not ( = ?auto_101531 ?auto_101530 ) ) ( ON ?auto_101525 ?auto_101524 ) ( ON-TABLE ?auto_101530 ) ( ON ?auto_101526 ?auto_101525 ) ( ON ?auto_101527 ?auto_101526 ) ( ON ?auto_101528 ?auto_101527 ) ( ON ?auto_101529 ?auto_101528 ) ( ON ?auto_101531 ?auto_101529 ) ( CLEAR ?auto_101531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101530 ?auto_101524 ?auto_101525 ?auto_101526 ?auto_101527 ?auto_101528 ?auto_101529 )
      ( MAKE-6PILE ?auto_101524 ?auto_101525 ?auto_101526 ?auto_101527 ?auto_101528 ?auto_101529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101546 - BLOCK
      ?auto_101547 - BLOCK
      ?auto_101548 - BLOCK
      ?auto_101549 - BLOCK
      ?auto_101550 - BLOCK
      ?auto_101551 - BLOCK
      ?auto_101552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101551 ) ( ON-TABLE ?auto_101546 ) ( ON ?auto_101547 ?auto_101546 ) ( ON ?auto_101548 ?auto_101547 ) ( ON ?auto_101549 ?auto_101548 ) ( ON ?auto_101550 ?auto_101549 ) ( ON ?auto_101551 ?auto_101550 ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101549 ) ) ( not ( = ?auto_101546 ?auto_101550 ) ) ( not ( = ?auto_101546 ?auto_101551 ) ) ( not ( = ?auto_101546 ?auto_101552 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101549 ) ) ( not ( = ?auto_101547 ?auto_101550 ) ) ( not ( = ?auto_101547 ?auto_101551 ) ) ( not ( = ?auto_101547 ?auto_101552 ) ) ( not ( = ?auto_101548 ?auto_101549 ) ) ( not ( = ?auto_101548 ?auto_101550 ) ) ( not ( = ?auto_101548 ?auto_101551 ) ) ( not ( = ?auto_101548 ?auto_101552 ) ) ( not ( = ?auto_101549 ?auto_101550 ) ) ( not ( = ?auto_101549 ?auto_101551 ) ) ( not ( = ?auto_101549 ?auto_101552 ) ) ( not ( = ?auto_101550 ?auto_101551 ) ) ( not ( = ?auto_101550 ?auto_101552 ) ) ( not ( = ?auto_101551 ?auto_101552 ) ) ( ON-TABLE ?auto_101552 ) ( CLEAR ?auto_101552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_101552 )
      ( MAKE-7PILE ?auto_101546 ?auto_101547 ?auto_101548 ?auto_101549 ?auto_101550 ?auto_101551 ?auto_101552 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101553 - BLOCK
      ?auto_101554 - BLOCK
      ?auto_101555 - BLOCK
      ?auto_101556 - BLOCK
      ?auto_101557 - BLOCK
      ?auto_101558 - BLOCK
      ?auto_101559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101553 ) ( ON ?auto_101554 ?auto_101553 ) ( ON ?auto_101555 ?auto_101554 ) ( ON ?auto_101556 ?auto_101555 ) ( ON ?auto_101557 ?auto_101556 ) ( not ( = ?auto_101553 ?auto_101554 ) ) ( not ( = ?auto_101553 ?auto_101555 ) ) ( not ( = ?auto_101553 ?auto_101556 ) ) ( not ( = ?auto_101553 ?auto_101557 ) ) ( not ( = ?auto_101553 ?auto_101558 ) ) ( not ( = ?auto_101553 ?auto_101559 ) ) ( not ( = ?auto_101554 ?auto_101555 ) ) ( not ( = ?auto_101554 ?auto_101556 ) ) ( not ( = ?auto_101554 ?auto_101557 ) ) ( not ( = ?auto_101554 ?auto_101558 ) ) ( not ( = ?auto_101554 ?auto_101559 ) ) ( not ( = ?auto_101555 ?auto_101556 ) ) ( not ( = ?auto_101555 ?auto_101557 ) ) ( not ( = ?auto_101555 ?auto_101558 ) ) ( not ( = ?auto_101555 ?auto_101559 ) ) ( not ( = ?auto_101556 ?auto_101557 ) ) ( not ( = ?auto_101556 ?auto_101558 ) ) ( not ( = ?auto_101556 ?auto_101559 ) ) ( not ( = ?auto_101557 ?auto_101558 ) ) ( not ( = ?auto_101557 ?auto_101559 ) ) ( not ( = ?auto_101558 ?auto_101559 ) ) ( ON-TABLE ?auto_101559 ) ( CLEAR ?auto_101559 ) ( HOLDING ?auto_101558 ) ( CLEAR ?auto_101557 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101553 ?auto_101554 ?auto_101555 ?auto_101556 ?auto_101557 ?auto_101558 )
      ( MAKE-7PILE ?auto_101553 ?auto_101554 ?auto_101555 ?auto_101556 ?auto_101557 ?auto_101558 ?auto_101559 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101560 - BLOCK
      ?auto_101561 - BLOCK
      ?auto_101562 - BLOCK
      ?auto_101563 - BLOCK
      ?auto_101564 - BLOCK
      ?auto_101565 - BLOCK
      ?auto_101566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101560 ) ( ON ?auto_101561 ?auto_101560 ) ( ON ?auto_101562 ?auto_101561 ) ( ON ?auto_101563 ?auto_101562 ) ( ON ?auto_101564 ?auto_101563 ) ( not ( = ?auto_101560 ?auto_101561 ) ) ( not ( = ?auto_101560 ?auto_101562 ) ) ( not ( = ?auto_101560 ?auto_101563 ) ) ( not ( = ?auto_101560 ?auto_101564 ) ) ( not ( = ?auto_101560 ?auto_101565 ) ) ( not ( = ?auto_101560 ?auto_101566 ) ) ( not ( = ?auto_101561 ?auto_101562 ) ) ( not ( = ?auto_101561 ?auto_101563 ) ) ( not ( = ?auto_101561 ?auto_101564 ) ) ( not ( = ?auto_101561 ?auto_101565 ) ) ( not ( = ?auto_101561 ?auto_101566 ) ) ( not ( = ?auto_101562 ?auto_101563 ) ) ( not ( = ?auto_101562 ?auto_101564 ) ) ( not ( = ?auto_101562 ?auto_101565 ) ) ( not ( = ?auto_101562 ?auto_101566 ) ) ( not ( = ?auto_101563 ?auto_101564 ) ) ( not ( = ?auto_101563 ?auto_101565 ) ) ( not ( = ?auto_101563 ?auto_101566 ) ) ( not ( = ?auto_101564 ?auto_101565 ) ) ( not ( = ?auto_101564 ?auto_101566 ) ) ( not ( = ?auto_101565 ?auto_101566 ) ) ( ON-TABLE ?auto_101566 ) ( CLEAR ?auto_101564 ) ( ON ?auto_101565 ?auto_101566 ) ( CLEAR ?auto_101565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101566 )
      ( MAKE-7PILE ?auto_101560 ?auto_101561 ?auto_101562 ?auto_101563 ?auto_101564 ?auto_101565 ?auto_101566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101567 - BLOCK
      ?auto_101568 - BLOCK
      ?auto_101569 - BLOCK
      ?auto_101570 - BLOCK
      ?auto_101571 - BLOCK
      ?auto_101572 - BLOCK
      ?auto_101573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101567 ) ( ON ?auto_101568 ?auto_101567 ) ( ON ?auto_101569 ?auto_101568 ) ( ON ?auto_101570 ?auto_101569 ) ( not ( = ?auto_101567 ?auto_101568 ) ) ( not ( = ?auto_101567 ?auto_101569 ) ) ( not ( = ?auto_101567 ?auto_101570 ) ) ( not ( = ?auto_101567 ?auto_101571 ) ) ( not ( = ?auto_101567 ?auto_101572 ) ) ( not ( = ?auto_101567 ?auto_101573 ) ) ( not ( = ?auto_101568 ?auto_101569 ) ) ( not ( = ?auto_101568 ?auto_101570 ) ) ( not ( = ?auto_101568 ?auto_101571 ) ) ( not ( = ?auto_101568 ?auto_101572 ) ) ( not ( = ?auto_101568 ?auto_101573 ) ) ( not ( = ?auto_101569 ?auto_101570 ) ) ( not ( = ?auto_101569 ?auto_101571 ) ) ( not ( = ?auto_101569 ?auto_101572 ) ) ( not ( = ?auto_101569 ?auto_101573 ) ) ( not ( = ?auto_101570 ?auto_101571 ) ) ( not ( = ?auto_101570 ?auto_101572 ) ) ( not ( = ?auto_101570 ?auto_101573 ) ) ( not ( = ?auto_101571 ?auto_101572 ) ) ( not ( = ?auto_101571 ?auto_101573 ) ) ( not ( = ?auto_101572 ?auto_101573 ) ) ( ON-TABLE ?auto_101573 ) ( ON ?auto_101572 ?auto_101573 ) ( CLEAR ?auto_101572 ) ( HOLDING ?auto_101571 ) ( CLEAR ?auto_101570 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101567 ?auto_101568 ?auto_101569 ?auto_101570 ?auto_101571 )
      ( MAKE-7PILE ?auto_101567 ?auto_101568 ?auto_101569 ?auto_101570 ?auto_101571 ?auto_101572 ?auto_101573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101574 - BLOCK
      ?auto_101575 - BLOCK
      ?auto_101576 - BLOCK
      ?auto_101577 - BLOCK
      ?auto_101578 - BLOCK
      ?auto_101579 - BLOCK
      ?auto_101580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101574 ) ( ON ?auto_101575 ?auto_101574 ) ( ON ?auto_101576 ?auto_101575 ) ( ON ?auto_101577 ?auto_101576 ) ( not ( = ?auto_101574 ?auto_101575 ) ) ( not ( = ?auto_101574 ?auto_101576 ) ) ( not ( = ?auto_101574 ?auto_101577 ) ) ( not ( = ?auto_101574 ?auto_101578 ) ) ( not ( = ?auto_101574 ?auto_101579 ) ) ( not ( = ?auto_101574 ?auto_101580 ) ) ( not ( = ?auto_101575 ?auto_101576 ) ) ( not ( = ?auto_101575 ?auto_101577 ) ) ( not ( = ?auto_101575 ?auto_101578 ) ) ( not ( = ?auto_101575 ?auto_101579 ) ) ( not ( = ?auto_101575 ?auto_101580 ) ) ( not ( = ?auto_101576 ?auto_101577 ) ) ( not ( = ?auto_101576 ?auto_101578 ) ) ( not ( = ?auto_101576 ?auto_101579 ) ) ( not ( = ?auto_101576 ?auto_101580 ) ) ( not ( = ?auto_101577 ?auto_101578 ) ) ( not ( = ?auto_101577 ?auto_101579 ) ) ( not ( = ?auto_101577 ?auto_101580 ) ) ( not ( = ?auto_101578 ?auto_101579 ) ) ( not ( = ?auto_101578 ?auto_101580 ) ) ( not ( = ?auto_101579 ?auto_101580 ) ) ( ON-TABLE ?auto_101580 ) ( ON ?auto_101579 ?auto_101580 ) ( CLEAR ?auto_101577 ) ( ON ?auto_101578 ?auto_101579 ) ( CLEAR ?auto_101578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101580 ?auto_101579 )
      ( MAKE-7PILE ?auto_101574 ?auto_101575 ?auto_101576 ?auto_101577 ?auto_101578 ?auto_101579 ?auto_101580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101581 - BLOCK
      ?auto_101582 - BLOCK
      ?auto_101583 - BLOCK
      ?auto_101584 - BLOCK
      ?auto_101585 - BLOCK
      ?auto_101586 - BLOCK
      ?auto_101587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101581 ) ( ON ?auto_101582 ?auto_101581 ) ( ON ?auto_101583 ?auto_101582 ) ( not ( = ?auto_101581 ?auto_101582 ) ) ( not ( = ?auto_101581 ?auto_101583 ) ) ( not ( = ?auto_101581 ?auto_101584 ) ) ( not ( = ?auto_101581 ?auto_101585 ) ) ( not ( = ?auto_101581 ?auto_101586 ) ) ( not ( = ?auto_101581 ?auto_101587 ) ) ( not ( = ?auto_101582 ?auto_101583 ) ) ( not ( = ?auto_101582 ?auto_101584 ) ) ( not ( = ?auto_101582 ?auto_101585 ) ) ( not ( = ?auto_101582 ?auto_101586 ) ) ( not ( = ?auto_101582 ?auto_101587 ) ) ( not ( = ?auto_101583 ?auto_101584 ) ) ( not ( = ?auto_101583 ?auto_101585 ) ) ( not ( = ?auto_101583 ?auto_101586 ) ) ( not ( = ?auto_101583 ?auto_101587 ) ) ( not ( = ?auto_101584 ?auto_101585 ) ) ( not ( = ?auto_101584 ?auto_101586 ) ) ( not ( = ?auto_101584 ?auto_101587 ) ) ( not ( = ?auto_101585 ?auto_101586 ) ) ( not ( = ?auto_101585 ?auto_101587 ) ) ( not ( = ?auto_101586 ?auto_101587 ) ) ( ON-TABLE ?auto_101587 ) ( ON ?auto_101586 ?auto_101587 ) ( ON ?auto_101585 ?auto_101586 ) ( CLEAR ?auto_101585 ) ( HOLDING ?auto_101584 ) ( CLEAR ?auto_101583 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101581 ?auto_101582 ?auto_101583 ?auto_101584 )
      ( MAKE-7PILE ?auto_101581 ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 ?auto_101586 ?auto_101587 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101588 - BLOCK
      ?auto_101589 - BLOCK
      ?auto_101590 - BLOCK
      ?auto_101591 - BLOCK
      ?auto_101592 - BLOCK
      ?auto_101593 - BLOCK
      ?auto_101594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101588 ) ( ON ?auto_101589 ?auto_101588 ) ( ON ?auto_101590 ?auto_101589 ) ( not ( = ?auto_101588 ?auto_101589 ) ) ( not ( = ?auto_101588 ?auto_101590 ) ) ( not ( = ?auto_101588 ?auto_101591 ) ) ( not ( = ?auto_101588 ?auto_101592 ) ) ( not ( = ?auto_101588 ?auto_101593 ) ) ( not ( = ?auto_101588 ?auto_101594 ) ) ( not ( = ?auto_101589 ?auto_101590 ) ) ( not ( = ?auto_101589 ?auto_101591 ) ) ( not ( = ?auto_101589 ?auto_101592 ) ) ( not ( = ?auto_101589 ?auto_101593 ) ) ( not ( = ?auto_101589 ?auto_101594 ) ) ( not ( = ?auto_101590 ?auto_101591 ) ) ( not ( = ?auto_101590 ?auto_101592 ) ) ( not ( = ?auto_101590 ?auto_101593 ) ) ( not ( = ?auto_101590 ?auto_101594 ) ) ( not ( = ?auto_101591 ?auto_101592 ) ) ( not ( = ?auto_101591 ?auto_101593 ) ) ( not ( = ?auto_101591 ?auto_101594 ) ) ( not ( = ?auto_101592 ?auto_101593 ) ) ( not ( = ?auto_101592 ?auto_101594 ) ) ( not ( = ?auto_101593 ?auto_101594 ) ) ( ON-TABLE ?auto_101594 ) ( ON ?auto_101593 ?auto_101594 ) ( ON ?auto_101592 ?auto_101593 ) ( CLEAR ?auto_101590 ) ( ON ?auto_101591 ?auto_101592 ) ( CLEAR ?auto_101591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101594 ?auto_101593 ?auto_101592 )
      ( MAKE-7PILE ?auto_101588 ?auto_101589 ?auto_101590 ?auto_101591 ?auto_101592 ?auto_101593 ?auto_101594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101595 - BLOCK
      ?auto_101596 - BLOCK
      ?auto_101597 - BLOCK
      ?auto_101598 - BLOCK
      ?auto_101599 - BLOCK
      ?auto_101600 - BLOCK
      ?auto_101601 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101595 ) ( ON ?auto_101596 ?auto_101595 ) ( not ( = ?auto_101595 ?auto_101596 ) ) ( not ( = ?auto_101595 ?auto_101597 ) ) ( not ( = ?auto_101595 ?auto_101598 ) ) ( not ( = ?auto_101595 ?auto_101599 ) ) ( not ( = ?auto_101595 ?auto_101600 ) ) ( not ( = ?auto_101595 ?auto_101601 ) ) ( not ( = ?auto_101596 ?auto_101597 ) ) ( not ( = ?auto_101596 ?auto_101598 ) ) ( not ( = ?auto_101596 ?auto_101599 ) ) ( not ( = ?auto_101596 ?auto_101600 ) ) ( not ( = ?auto_101596 ?auto_101601 ) ) ( not ( = ?auto_101597 ?auto_101598 ) ) ( not ( = ?auto_101597 ?auto_101599 ) ) ( not ( = ?auto_101597 ?auto_101600 ) ) ( not ( = ?auto_101597 ?auto_101601 ) ) ( not ( = ?auto_101598 ?auto_101599 ) ) ( not ( = ?auto_101598 ?auto_101600 ) ) ( not ( = ?auto_101598 ?auto_101601 ) ) ( not ( = ?auto_101599 ?auto_101600 ) ) ( not ( = ?auto_101599 ?auto_101601 ) ) ( not ( = ?auto_101600 ?auto_101601 ) ) ( ON-TABLE ?auto_101601 ) ( ON ?auto_101600 ?auto_101601 ) ( ON ?auto_101599 ?auto_101600 ) ( ON ?auto_101598 ?auto_101599 ) ( CLEAR ?auto_101598 ) ( HOLDING ?auto_101597 ) ( CLEAR ?auto_101596 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101595 ?auto_101596 ?auto_101597 )
      ( MAKE-7PILE ?auto_101595 ?auto_101596 ?auto_101597 ?auto_101598 ?auto_101599 ?auto_101600 ?auto_101601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101602 - BLOCK
      ?auto_101603 - BLOCK
      ?auto_101604 - BLOCK
      ?auto_101605 - BLOCK
      ?auto_101606 - BLOCK
      ?auto_101607 - BLOCK
      ?auto_101608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101602 ) ( ON ?auto_101603 ?auto_101602 ) ( not ( = ?auto_101602 ?auto_101603 ) ) ( not ( = ?auto_101602 ?auto_101604 ) ) ( not ( = ?auto_101602 ?auto_101605 ) ) ( not ( = ?auto_101602 ?auto_101606 ) ) ( not ( = ?auto_101602 ?auto_101607 ) ) ( not ( = ?auto_101602 ?auto_101608 ) ) ( not ( = ?auto_101603 ?auto_101604 ) ) ( not ( = ?auto_101603 ?auto_101605 ) ) ( not ( = ?auto_101603 ?auto_101606 ) ) ( not ( = ?auto_101603 ?auto_101607 ) ) ( not ( = ?auto_101603 ?auto_101608 ) ) ( not ( = ?auto_101604 ?auto_101605 ) ) ( not ( = ?auto_101604 ?auto_101606 ) ) ( not ( = ?auto_101604 ?auto_101607 ) ) ( not ( = ?auto_101604 ?auto_101608 ) ) ( not ( = ?auto_101605 ?auto_101606 ) ) ( not ( = ?auto_101605 ?auto_101607 ) ) ( not ( = ?auto_101605 ?auto_101608 ) ) ( not ( = ?auto_101606 ?auto_101607 ) ) ( not ( = ?auto_101606 ?auto_101608 ) ) ( not ( = ?auto_101607 ?auto_101608 ) ) ( ON-TABLE ?auto_101608 ) ( ON ?auto_101607 ?auto_101608 ) ( ON ?auto_101606 ?auto_101607 ) ( ON ?auto_101605 ?auto_101606 ) ( CLEAR ?auto_101603 ) ( ON ?auto_101604 ?auto_101605 ) ( CLEAR ?auto_101604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101608 ?auto_101607 ?auto_101606 ?auto_101605 )
      ( MAKE-7PILE ?auto_101602 ?auto_101603 ?auto_101604 ?auto_101605 ?auto_101606 ?auto_101607 ?auto_101608 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101609 - BLOCK
      ?auto_101610 - BLOCK
      ?auto_101611 - BLOCK
      ?auto_101612 - BLOCK
      ?auto_101613 - BLOCK
      ?auto_101614 - BLOCK
      ?auto_101615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101609 ) ( not ( = ?auto_101609 ?auto_101610 ) ) ( not ( = ?auto_101609 ?auto_101611 ) ) ( not ( = ?auto_101609 ?auto_101612 ) ) ( not ( = ?auto_101609 ?auto_101613 ) ) ( not ( = ?auto_101609 ?auto_101614 ) ) ( not ( = ?auto_101609 ?auto_101615 ) ) ( not ( = ?auto_101610 ?auto_101611 ) ) ( not ( = ?auto_101610 ?auto_101612 ) ) ( not ( = ?auto_101610 ?auto_101613 ) ) ( not ( = ?auto_101610 ?auto_101614 ) ) ( not ( = ?auto_101610 ?auto_101615 ) ) ( not ( = ?auto_101611 ?auto_101612 ) ) ( not ( = ?auto_101611 ?auto_101613 ) ) ( not ( = ?auto_101611 ?auto_101614 ) ) ( not ( = ?auto_101611 ?auto_101615 ) ) ( not ( = ?auto_101612 ?auto_101613 ) ) ( not ( = ?auto_101612 ?auto_101614 ) ) ( not ( = ?auto_101612 ?auto_101615 ) ) ( not ( = ?auto_101613 ?auto_101614 ) ) ( not ( = ?auto_101613 ?auto_101615 ) ) ( not ( = ?auto_101614 ?auto_101615 ) ) ( ON-TABLE ?auto_101615 ) ( ON ?auto_101614 ?auto_101615 ) ( ON ?auto_101613 ?auto_101614 ) ( ON ?auto_101612 ?auto_101613 ) ( ON ?auto_101611 ?auto_101612 ) ( CLEAR ?auto_101611 ) ( HOLDING ?auto_101610 ) ( CLEAR ?auto_101609 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101609 ?auto_101610 )
      ( MAKE-7PILE ?auto_101609 ?auto_101610 ?auto_101611 ?auto_101612 ?auto_101613 ?auto_101614 ?auto_101615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101616 - BLOCK
      ?auto_101617 - BLOCK
      ?auto_101618 - BLOCK
      ?auto_101619 - BLOCK
      ?auto_101620 - BLOCK
      ?auto_101621 - BLOCK
      ?auto_101622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101616 ) ( not ( = ?auto_101616 ?auto_101617 ) ) ( not ( = ?auto_101616 ?auto_101618 ) ) ( not ( = ?auto_101616 ?auto_101619 ) ) ( not ( = ?auto_101616 ?auto_101620 ) ) ( not ( = ?auto_101616 ?auto_101621 ) ) ( not ( = ?auto_101616 ?auto_101622 ) ) ( not ( = ?auto_101617 ?auto_101618 ) ) ( not ( = ?auto_101617 ?auto_101619 ) ) ( not ( = ?auto_101617 ?auto_101620 ) ) ( not ( = ?auto_101617 ?auto_101621 ) ) ( not ( = ?auto_101617 ?auto_101622 ) ) ( not ( = ?auto_101618 ?auto_101619 ) ) ( not ( = ?auto_101618 ?auto_101620 ) ) ( not ( = ?auto_101618 ?auto_101621 ) ) ( not ( = ?auto_101618 ?auto_101622 ) ) ( not ( = ?auto_101619 ?auto_101620 ) ) ( not ( = ?auto_101619 ?auto_101621 ) ) ( not ( = ?auto_101619 ?auto_101622 ) ) ( not ( = ?auto_101620 ?auto_101621 ) ) ( not ( = ?auto_101620 ?auto_101622 ) ) ( not ( = ?auto_101621 ?auto_101622 ) ) ( ON-TABLE ?auto_101622 ) ( ON ?auto_101621 ?auto_101622 ) ( ON ?auto_101620 ?auto_101621 ) ( ON ?auto_101619 ?auto_101620 ) ( ON ?auto_101618 ?auto_101619 ) ( CLEAR ?auto_101616 ) ( ON ?auto_101617 ?auto_101618 ) ( CLEAR ?auto_101617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101622 ?auto_101621 ?auto_101620 ?auto_101619 ?auto_101618 )
      ( MAKE-7PILE ?auto_101616 ?auto_101617 ?auto_101618 ?auto_101619 ?auto_101620 ?auto_101621 ?auto_101622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101623 - BLOCK
      ?auto_101624 - BLOCK
      ?auto_101625 - BLOCK
      ?auto_101626 - BLOCK
      ?auto_101627 - BLOCK
      ?auto_101628 - BLOCK
      ?auto_101629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101623 ?auto_101624 ) ) ( not ( = ?auto_101623 ?auto_101625 ) ) ( not ( = ?auto_101623 ?auto_101626 ) ) ( not ( = ?auto_101623 ?auto_101627 ) ) ( not ( = ?auto_101623 ?auto_101628 ) ) ( not ( = ?auto_101623 ?auto_101629 ) ) ( not ( = ?auto_101624 ?auto_101625 ) ) ( not ( = ?auto_101624 ?auto_101626 ) ) ( not ( = ?auto_101624 ?auto_101627 ) ) ( not ( = ?auto_101624 ?auto_101628 ) ) ( not ( = ?auto_101624 ?auto_101629 ) ) ( not ( = ?auto_101625 ?auto_101626 ) ) ( not ( = ?auto_101625 ?auto_101627 ) ) ( not ( = ?auto_101625 ?auto_101628 ) ) ( not ( = ?auto_101625 ?auto_101629 ) ) ( not ( = ?auto_101626 ?auto_101627 ) ) ( not ( = ?auto_101626 ?auto_101628 ) ) ( not ( = ?auto_101626 ?auto_101629 ) ) ( not ( = ?auto_101627 ?auto_101628 ) ) ( not ( = ?auto_101627 ?auto_101629 ) ) ( not ( = ?auto_101628 ?auto_101629 ) ) ( ON-TABLE ?auto_101629 ) ( ON ?auto_101628 ?auto_101629 ) ( ON ?auto_101627 ?auto_101628 ) ( ON ?auto_101626 ?auto_101627 ) ( ON ?auto_101625 ?auto_101626 ) ( ON ?auto_101624 ?auto_101625 ) ( CLEAR ?auto_101624 ) ( HOLDING ?auto_101623 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101623 )
      ( MAKE-7PILE ?auto_101623 ?auto_101624 ?auto_101625 ?auto_101626 ?auto_101627 ?auto_101628 ?auto_101629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101630 - BLOCK
      ?auto_101631 - BLOCK
      ?auto_101632 - BLOCK
      ?auto_101633 - BLOCK
      ?auto_101634 - BLOCK
      ?auto_101635 - BLOCK
      ?auto_101636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101630 ?auto_101631 ) ) ( not ( = ?auto_101630 ?auto_101632 ) ) ( not ( = ?auto_101630 ?auto_101633 ) ) ( not ( = ?auto_101630 ?auto_101634 ) ) ( not ( = ?auto_101630 ?auto_101635 ) ) ( not ( = ?auto_101630 ?auto_101636 ) ) ( not ( = ?auto_101631 ?auto_101632 ) ) ( not ( = ?auto_101631 ?auto_101633 ) ) ( not ( = ?auto_101631 ?auto_101634 ) ) ( not ( = ?auto_101631 ?auto_101635 ) ) ( not ( = ?auto_101631 ?auto_101636 ) ) ( not ( = ?auto_101632 ?auto_101633 ) ) ( not ( = ?auto_101632 ?auto_101634 ) ) ( not ( = ?auto_101632 ?auto_101635 ) ) ( not ( = ?auto_101632 ?auto_101636 ) ) ( not ( = ?auto_101633 ?auto_101634 ) ) ( not ( = ?auto_101633 ?auto_101635 ) ) ( not ( = ?auto_101633 ?auto_101636 ) ) ( not ( = ?auto_101634 ?auto_101635 ) ) ( not ( = ?auto_101634 ?auto_101636 ) ) ( not ( = ?auto_101635 ?auto_101636 ) ) ( ON-TABLE ?auto_101636 ) ( ON ?auto_101635 ?auto_101636 ) ( ON ?auto_101634 ?auto_101635 ) ( ON ?auto_101633 ?auto_101634 ) ( ON ?auto_101632 ?auto_101633 ) ( ON ?auto_101631 ?auto_101632 ) ( ON ?auto_101630 ?auto_101631 ) ( CLEAR ?auto_101630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101636 ?auto_101635 ?auto_101634 ?auto_101633 ?auto_101632 ?auto_101631 )
      ( MAKE-7PILE ?auto_101630 ?auto_101631 ?auto_101632 ?auto_101633 ?auto_101634 ?auto_101635 ?auto_101636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101644 - BLOCK
      ?auto_101645 - BLOCK
      ?auto_101646 - BLOCK
      ?auto_101647 - BLOCK
      ?auto_101648 - BLOCK
      ?auto_101649 - BLOCK
      ?auto_101650 - BLOCK
    )
    :vars
    (
      ?auto_101651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101644 ?auto_101645 ) ) ( not ( = ?auto_101644 ?auto_101646 ) ) ( not ( = ?auto_101644 ?auto_101647 ) ) ( not ( = ?auto_101644 ?auto_101648 ) ) ( not ( = ?auto_101644 ?auto_101649 ) ) ( not ( = ?auto_101644 ?auto_101650 ) ) ( not ( = ?auto_101645 ?auto_101646 ) ) ( not ( = ?auto_101645 ?auto_101647 ) ) ( not ( = ?auto_101645 ?auto_101648 ) ) ( not ( = ?auto_101645 ?auto_101649 ) ) ( not ( = ?auto_101645 ?auto_101650 ) ) ( not ( = ?auto_101646 ?auto_101647 ) ) ( not ( = ?auto_101646 ?auto_101648 ) ) ( not ( = ?auto_101646 ?auto_101649 ) ) ( not ( = ?auto_101646 ?auto_101650 ) ) ( not ( = ?auto_101647 ?auto_101648 ) ) ( not ( = ?auto_101647 ?auto_101649 ) ) ( not ( = ?auto_101647 ?auto_101650 ) ) ( not ( = ?auto_101648 ?auto_101649 ) ) ( not ( = ?auto_101648 ?auto_101650 ) ) ( not ( = ?auto_101649 ?auto_101650 ) ) ( ON-TABLE ?auto_101650 ) ( ON ?auto_101649 ?auto_101650 ) ( ON ?auto_101648 ?auto_101649 ) ( ON ?auto_101647 ?auto_101648 ) ( ON ?auto_101646 ?auto_101647 ) ( ON ?auto_101645 ?auto_101646 ) ( CLEAR ?auto_101645 ) ( ON ?auto_101644 ?auto_101651 ) ( CLEAR ?auto_101644 ) ( HAND-EMPTY ) ( not ( = ?auto_101644 ?auto_101651 ) ) ( not ( = ?auto_101645 ?auto_101651 ) ) ( not ( = ?auto_101646 ?auto_101651 ) ) ( not ( = ?auto_101647 ?auto_101651 ) ) ( not ( = ?auto_101648 ?auto_101651 ) ) ( not ( = ?auto_101649 ?auto_101651 ) ) ( not ( = ?auto_101650 ?auto_101651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101644 ?auto_101651 )
      ( MAKE-7PILE ?auto_101644 ?auto_101645 ?auto_101646 ?auto_101647 ?auto_101648 ?auto_101649 ?auto_101650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101652 - BLOCK
      ?auto_101653 - BLOCK
      ?auto_101654 - BLOCK
      ?auto_101655 - BLOCK
      ?auto_101656 - BLOCK
      ?auto_101657 - BLOCK
      ?auto_101658 - BLOCK
    )
    :vars
    (
      ?auto_101659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101652 ?auto_101653 ) ) ( not ( = ?auto_101652 ?auto_101654 ) ) ( not ( = ?auto_101652 ?auto_101655 ) ) ( not ( = ?auto_101652 ?auto_101656 ) ) ( not ( = ?auto_101652 ?auto_101657 ) ) ( not ( = ?auto_101652 ?auto_101658 ) ) ( not ( = ?auto_101653 ?auto_101654 ) ) ( not ( = ?auto_101653 ?auto_101655 ) ) ( not ( = ?auto_101653 ?auto_101656 ) ) ( not ( = ?auto_101653 ?auto_101657 ) ) ( not ( = ?auto_101653 ?auto_101658 ) ) ( not ( = ?auto_101654 ?auto_101655 ) ) ( not ( = ?auto_101654 ?auto_101656 ) ) ( not ( = ?auto_101654 ?auto_101657 ) ) ( not ( = ?auto_101654 ?auto_101658 ) ) ( not ( = ?auto_101655 ?auto_101656 ) ) ( not ( = ?auto_101655 ?auto_101657 ) ) ( not ( = ?auto_101655 ?auto_101658 ) ) ( not ( = ?auto_101656 ?auto_101657 ) ) ( not ( = ?auto_101656 ?auto_101658 ) ) ( not ( = ?auto_101657 ?auto_101658 ) ) ( ON-TABLE ?auto_101658 ) ( ON ?auto_101657 ?auto_101658 ) ( ON ?auto_101656 ?auto_101657 ) ( ON ?auto_101655 ?auto_101656 ) ( ON ?auto_101654 ?auto_101655 ) ( ON ?auto_101652 ?auto_101659 ) ( CLEAR ?auto_101652 ) ( not ( = ?auto_101652 ?auto_101659 ) ) ( not ( = ?auto_101653 ?auto_101659 ) ) ( not ( = ?auto_101654 ?auto_101659 ) ) ( not ( = ?auto_101655 ?auto_101659 ) ) ( not ( = ?auto_101656 ?auto_101659 ) ) ( not ( = ?auto_101657 ?auto_101659 ) ) ( not ( = ?auto_101658 ?auto_101659 ) ) ( HOLDING ?auto_101653 ) ( CLEAR ?auto_101654 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101658 ?auto_101657 ?auto_101656 ?auto_101655 ?auto_101654 ?auto_101653 )
      ( MAKE-7PILE ?auto_101652 ?auto_101653 ?auto_101654 ?auto_101655 ?auto_101656 ?auto_101657 ?auto_101658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101660 - BLOCK
      ?auto_101661 - BLOCK
      ?auto_101662 - BLOCK
      ?auto_101663 - BLOCK
      ?auto_101664 - BLOCK
      ?auto_101665 - BLOCK
      ?auto_101666 - BLOCK
    )
    :vars
    (
      ?auto_101667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101660 ?auto_101661 ) ) ( not ( = ?auto_101660 ?auto_101662 ) ) ( not ( = ?auto_101660 ?auto_101663 ) ) ( not ( = ?auto_101660 ?auto_101664 ) ) ( not ( = ?auto_101660 ?auto_101665 ) ) ( not ( = ?auto_101660 ?auto_101666 ) ) ( not ( = ?auto_101661 ?auto_101662 ) ) ( not ( = ?auto_101661 ?auto_101663 ) ) ( not ( = ?auto_101661 ?auto_101664 ) ) ( not ( = ?auto_101661 ?auto_101665 ) ) ( not ( = ?auto_101661 ?auto_101666 ) ) ( not ( = ?auto_101662 ?auto_101663 ) ) ( not ( = ?auto_101662 ?auto_101664 ) ) ( not ( = ?auto_101662 ?auto_101665 ) ) ( not ( = ?auto_101662 ?auto_101666 ) ) ( not ( = ?auto_101663 ?auto_101664 ) ) ( not ( = ?auto_101663 ?auto_101665 ) ) ( not ( = ?auto_101663 ?auto_101666 ) ) ( not ( = ?auto_101664 ?auto_101665 ) ) ( not ( = ?auto_101664 ?auto_101666 ) ) ( not ( = ?auto_101665 ?auto_101666 ) ) ( ON-TABLE ?auto_101666 ) ( ON ?auto_101665 ?auto_101666 ) ( ON ?auto_101664 ?auto_101665 ) ( ON ?auto_101663 ?auto_101664 ) ( ON ?auto_101662 ?auto_101663 ) ( ON ?auto_101660 ?auto_101667 ) ( not ( = ?auto_101660 ?auto_101667 ) ) ( not ( = ?auto_101661 ?auto_101667 ) ) ( not ( = ?auto_101662 ?auto_101667 ) ) ( not ( = ?auto_101663 ?auto_101667 ) ) ( not ( = ?auto_101664 ?auto_101667 ) ) ( not ( = ?auto_101665 ?auto_101667 ) ) ( not ( = ?auto_101666 ?auto_101667 ) ) ( CLEAR ?auto_101662 ) ( ON ?auto_101661 ?auto_101660 ) ( CLEAR ?auto_101661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101667 ?auto_101660 )
      ( MAKE-7PILE ?auto_101660 ?auto_101661 ?auto_101662 ?auto_101663 ?auto_101664 ?auto_101665 ?auto_101666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101668 - BLOCK
      ?auto_101669 - BLOCK
      ?auto_101670 - BLOCK
      ?auto_101671 - BLOCK
      ?auto_101672 - BLOCK
      ?auto_101673 - BLOCK
      ?auto_101674 - BLOCK
    )
    :vars
    (
      ?auto_101675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101668 ?auto_101669 ) ) ( not ( = ?auto_101668 ?auto_101670 ) ) ( not ( = ?auto_101668 ?auto_101671 ) ) ( not ( = ?auto_101668 ?auto_101672 ) ) ( not ( = ?auto_101668 ?auto_101673 ) ) ( not ( = ?auto_101668 ?auto_101674 ) ) ( not ( = ?auto_101669 ?auto_101670 ) ) ( not ( = ?auto_101669 ?auto_101671 ) ) ( not ( = ?auto_101669 ?auto_101672 ) ) ( not ( = ?auto_101669 ?auto_101673 ) ) ( not ( = ?auto_101669 ?auto_101674 ) ) ( not ( = ?auto_101670 ?auto_101671 ) ) ( not ( = ?auto_101670 ?auto_101672 ) ) ( not ( = ?auto_101670 ?auto_101673 ) ) ( not ( = ?auto_101670 ?auto_101674 ) ) ( not ( = ?auto_101671 ?auto_101672 ) ) ( not ( = ?auto_101671 ?auto_101673 ) ) ( not ( = ?auto_101671 ?auto_101674 ) ) ( not ( = ?auto_101672 ?auto_101673 ) ) ( not ( = ?auto_101672 ?auto_101674 ) ) ( not ( = ?auto_101673 ?auto_101674 ) ) ( ON-TABLE ?auto_101674 ) ( ON ?auto_101673 ?auto_101674 ) ( ON ?auto_101672 ?auto_101673 ) ( ON ?auto_101671 ?auto_101672 ) ( ON ?auto_101668 ?auto_101675 ) ( not ( = ?auto_101668 ?auto_101675 ) ) ( not ( = ?auto_101669 ?auto_101675 ) ) ( not ( = ?auto_101670 ?auto_101675 ) ) ( not ( = ?auto_101671 ?auto_101675 ) ) ( not ( = ?auto_101672 ?auto_101675 ) ) ( not ( = ?auto_101673 ?auto_101675 ) ) ( not ( = ?auto_101674 ?auto_101675 ) ) ( ON ?auto_101669 ?auto_101668 ) ( CLEAR ?auto_101669 ) ( ON-TABLE ?auto_101675 ) ( HOLDING ?auto_101670 ) ( CLEAR ?auto_101671 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101674 ?auto_101673 ?auto_101672 ?auto_101671 ?auto_101670 )
      ( MAKE-7PILE ?auto_101668 ?auto_101669 ?auto_101670 ?auto_101671 ?auto_101672 ?auto_101673 ?auto_101674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101676 - BLOCK
      ?auto_101677 - BLOCK
      ?auto_101678 - BLOCK
      ?auto_101679 - BLOCK
      ?auto_101680 - BLOCK
      ?auto_101681 - BLOCK
      ?auto_101682 - BLOCK
    )
    :vars
    (
      ?auto_101683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101676 ?auto_101677 ) ) ( not ( = ?auto_101676 ?auto_101678 ) ) ( not ( = ?auto_101676 ?auto_101679 ) ) ( not ( = ?auto_101676 ?auto_101680 ) ) ( not ( = ?auto_101676 ?auto_101681 ) ) ( not ( = ?auto_101676 ?auto_101682 ) ) ( not ( = ?auto_101677 ?auto_101678 ) ) ( not ( = ?auto_101677 ?auto_101679 ) ) ( not ( = ?auto_101677 ?auto_101680 ) ) ( not ( = ?auto_101677 ?auto_101681 ) ) ( not ( = ?auto_101677 ?auto_101682 ) ) ( not ( = ?auto_101678 ?auto_101679 ) ) ( not ( = ?auto_101678 ?auto_101680 ) ) ( not ( = ?auto_101678 ?auto_101681 ) ) ( not ( = ?auto_101678 ?auto_101682 ) ) ( not ( = ?auto_101679 ?auto_101680 ) ) ( not ( = ?auto_101679 ?auto_101681 ) ) ( not ( = ?auto_101679 ?auto_101682 ) ) ( not ( = ?auto_101680 ?auto_101681 ) ) ( not ( = ?auto_101680 ?auto_101682 ) ) ( not ( = ?auto_101681 ?auto_101682 ) ) ( ON-TABLE ?auto_101682 ) ( ON ?auto_101681 ?auto_101682 ) ( ON ?auto_101680 ?auto_101681 ) ( ON ?auto_101679 ?auto_101680 ) ( ON ?auto_101676 ?auto_101683 ) ( not ( = ?auto_101676 ?auto_101683 ) ) ( not ( = ?auto_101677 ?auto_101683 ) ) ( not ( = ?auto_101678 ?auto_101683 ) ) ( not ( = ?auto_101679 ?auto_101683 ) ) ( not ( = ?auto_101680 ?auto_101683 ) ) ( not ( = ?auto_101681 ?auto_101683 ) ) ( not ( = ?auto_101682 ?auto_101683 ) ) ( ON ?auto_101677 ?auto_101676 ) ( ON-TABLE ?auto_101683 ) ( CLEAR ?auto_101679 ) ( ON ?auto_101678 ?auto_101677 ) ( CLEAR ?auto_101678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101683 ?auto_101676 ?auto_101677 )
      ( MAKE-7PILE ?auto_101676 ?auto_101677 ?auto_101678 ?auto_101679 ?auto_101680 ?auto_101681 ?auto_101682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101684 - BLOCK
      ?auto_101685 - BLOCK
      ?auto_101686 - BLOCK
      ?auto_101687 - BLOCK
      ?auto_101688 - BLOCK
      ?auto_101689 - BLOCK
      ?auto_101690 - BLOCK
    )
    :vars
    (
      ?auto_101691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101684 ?auto_101685 ) ) ( not ( = ?auto_101684 ?auto_101686 ) ) ( not ( = ?auto_101684 ?auto_101687 ) ) ( not ( = ?auto_101684 ?auto_101688 ) ) ( not ( = ?auto_101684 ?auto_101689 ) ) ( not ( = ?auto_101684 ?auto_101690 ) ) ( not ( = ?auto_101685 ?auto_101686 ) ) ( not ( = ?auto_101685 ?auto_101687 ) ) ( not ( = ?auto_101685 ?auto_101688 ) ) ( not ( = ?auto_101685 ?auto_101689 ) ) ( not ( = ?auto_101685 ?auto_101690 ) ) ( not ( = ?auto_101686 ?auto_101687 ) ) ( not ( = ?auto_101686 ?auto_101688 ) ) ( not ( = ?auto_101686 ?auto_101689 ) ) ( not ( = ?auto_101686 ?auto_101690 ) ) ( not ( = ?auto_101687 ?auto_101688 ) ) ( not ( = ?auto_101687 ?auto_101689 ) ) ( not ( = ?auto_101687 ?auto_101690 ) ) ( not ( = ?auto_101688 ?auto_101689 ) ) ( not ( = ?auto_101688 ?auto_101690 ) ) ( not ( = ?auto_101689 ?auto_101690 ) ) ( ON-TABLE ?auto_101690 ) ( ON ?auto_101689 ?auto_101690 ) ( ON ?auto_101688 ?auto_101689 ) ( ON ?auto_101684 ?auto_101691 ) ( not ( = ?auto_101684 ?auto_101691 ) ) ( not ( = ?auto_101685 ?auto_101691 ) ) ( not ( = ?auto_101686 ?auto_101691 ) ) ( not ( = ?auto_101687 ?auto_101691 ) ) ( not ( = ?auto_101688 ?auto_101691 ) ) ( not ( = ?auto_101689 ?auto_101691 ) ) ( not ( = ?auto_101690 ?auto_101691 ) ) ( ON ?auto_101685 ?auto_101684 ) ( ON-TABLE ?auto_101691 ) ( ON ?auto_101686 ?auto_101685 ) ( CLEAR ?auto_101686 ) ( HOLDING ?auto_101687 ) ( CLEAR ?auto_101688 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101690 ?auto_101689 ?auto_101688 ?auto_101687 )
      ( MAKE-7PILE ?auto_101684 ?auto_101685 ?auto_101686 ?auto_101687 ?auto_101688 ?auto_101689 ?auto_101690 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101692 - BLOCK
      ?auto_101693 - BLOCK
      ?auto_101694 - BLOCK
      ?auto_101695 - BLOCK
      ?auto_101696 - BLOCK
      ?auto_101697 - BLOCK
      ?auto_101698 - BLOCK
    )
    :vars
    (
      ?auto_101699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101692 ?auto_101693 ) ) ( not ( = ?auto_101692 ?auto_101694 ) ) ( not ( = ?auto_101692 ?auto_101695 ) ) ( not ( = ?auto_101692 ?auto_101696 ) ) ( not ( = ?auto_101692 ?auto_101697 ) ) ( not ( = ?auto_101692 ?auto_101698 ) ) ( not ( = ?auto_101693 ?auto_101694 ) ) ( not ( = ?auto_101693 ?auto_101695 ) ) ( not ( = ?auto_101693 ?auto_101696 ) ) ( not ( = ?auto_101693 ?auto_101697 ) ) ( not ( = ?auto_101693 ?auto_101698 ) ) ( not ( = ?auto_101694 ?auto_101695 ) ) ( not ( = ?auto_101694 ?auto_101696 ) ) ( not ( = ?auto_101694 ?auto_101697 ) ) ( not ( = ?auto_101694 ?auto_101698 ) ) ( not ( = ?auto_101695 ?auto_101696 ) ) ( not ( = ?auto_101695 ?auto_101697 ) ) ( not ( = ?auto_101695 ?auto_101698 ) ) ( not ( = ?auto_101696 ?auto_101697 ) ) ( not ( = ?auto_101696 ?auto_101698 ) ) ( not ( = ?auto_101697 ?auto_101698 ) ) ( ON-TABLE ?auto_101698 ) ( ON ?auto_101697 ?auto_101698 ) ( ON ?auto_101696 ?auto_101697 ) ( ON ?auto_101692 ?auto_101699 ) ( not ( = ?auto_101692 ?auto_101699 ) ) ( not ( = ?auto_101693 ?auto_101699 ) ) ( not ( = ?auto_101694 ?auto_101699 ) ) ( not ( = ?auto_101695 ?auto_101699 ) ) ( not ( = ?auto_101696 ?auto_101699 ) ) ( not ( = ?auto_101697 ?auto_101699 ) ) ( not ( = ?auto_101698 ?auto_101699 ) ) ( ON ?auto_101693 ?auto_101692 ) ( ON-TABLE ?auto_101699 ) ( ON ?auto_101694 ?auto_101693 ) ( CLEAR ?auto_101696 ) ( ON ?auto_101695 ?auto_101694 ) ( CLEAR ?auto_101695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101699 ?auto_101692 ?auto_101693 ?auto_101694 )
      ( MAKE-7PILE ?auto_101692 ?auto_101693 ?auto_101694 ?auto_101695 ?auto_101696 ?auto_101697 ?auto_101698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101700 - BLOCK
      ?auto_101701 - BLOCK
      ?auto_101702 - BLOCK
      ?auto_101703 - BLOCK
      ?auto_101704 - BLOCK
      ?auto_101705 - BLOCK
      ?auto_101706 - BLOCK
    )
    :vars
    (
      ?auto_101707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101700 ?auto_101701 ) ) ( not ( = ?auto_101700 ?auto_101702 ) ) ( not ( = ?auto_101700 ?auto_101703 ) ) ( not ( = ?auto_101700 ?auto_101704 ) ) ( not ( = ?auto_101700 ?auto_101705 ) ) ( not ( = ?auto_101700 ?auto_101706 ) ) ( not ( = ?auto_101701 ?auto_101702 ) ) ( not ( = ?auto_101701 ?auto_101703 ) ) ( not ( = ?auto_101701 ?auto_101704 ) ) ( not ( = ?auto_101701 ?auto_101705 ) ) ( not ( = ?auto_101701 ?auto_101706 ) ) ( not ( = ?auto_101702 ?auto_101703 ) ) ( not ( = ?auto_101702 ?auto_101704 ) ) ( not ( = ?auto_101702 ?auto_101705 ) ) ( not ( = ?auto_101702 ?auto_101706 ) ) ( not ( = ?auto_101703 ?auto_101704 ) ) ( not ( = ?auto_101703 ?auto_101705 ) ) ( not ( = ?auto_101703 ?auto_101706 ) ) ( not ( = ?auto_101704 ?auto_101705 ) ) ( not ( = ?auto_101704 ?auto_101706 ) ) ( not ( = ?auto_101705 ?auto_101706 ) ) ( ON-TABLE ?auto_101706 ) ( ON ?auto_101705 ?auto_101706 ) ( ON ?auto_101700 ?auto_101707 ) ( not ( = ?auto_101700 ?auto_101707 ) ) ( not ( = ?auto_101701 ?auto_101707 ) ) ( not ( = ?auto_101702 ?auto_101707 ) ) ( not ( = ?auto_101703 ?auto_101707 ) ) ( not ( = ?auto_101704 ?auto_101707 ) ) ( not ( = ?auto_101705 ?auto_101707 ) ) ( not ( = ?auto_101706 ?auto_101707 ) ) ( ON ?auto_101701 ?auto_101700 ) ( ON-TABLE ?auto_101707 ) ( ON ?auto_101702 ?auto_101701 ) ( ON ?auto_101703 ?auto_101702 ) ( CLEAR ?auto_101703 ) ( HOLDING ?auto_101704 ) ( CLEAR ?auto_101705 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101706 ?auto_101705 ?auto_101704 )
      ( MAKE-7PILE ?auto_101700 ?auto_101701 ?auto_101702 ?auto_101703 ?auto_101704 ?auto_101705 ?auto_101706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101708 - BLOCK
      ?auto_101709 - BLOCK
      ?auto_101710 - BLOCK
      ?auto_101711 - BLOCK
      ?auto_101712 - BLOCK
      ?auto_101713 - BLOCK
      ?auto_101714 - BLOCK
    )
    :vars
    (
      ?auto_101715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101708 ?auto_101709 ) ) ( not ( = ?auto_101708 ?auto_101710 ) ) ( not ( = ?auto_101708 ?auto_101711 ) ) ( not ( = ?auto_101708 ?auto_101712 ) ) ( not ( = ?auto_101708 ?auto_101713 ) ) ( not ( = ?auto_101708 ?auto_101714 ) ) ( not ( = ?auto_101709 ?auto_101710 ) ) ( not ( = ?auto_101709 ?auto_101711 ) ) ( not ( = ?auto_101709 ?auto_101712 ) ) ( not ( = ?auto_101709 ?auto_101713 ) ) ( not ( = ?auto_101709 ?auto_101714 ) ) ( not ( = ?auto_101710 ?auto_101711 ) ) ( not ( = ?auto_101710 ?auto_101712 ) ) ( not ( = ?auto_101710 ?auto_101713 ) ) ( not ( = ?auto_101710 ?auto_101714 ) ) ( not ( = ?auto_101711 ?auto_101712 ) ) ( not ( = ?auto_101711 ?auto_101713 ) ) ( not ( = ?auto_101711 ?auto_101714 ) ) ( not ( = ?auto_101712 ?auto_101713 ) ) ( not ( = ?auto_101712 ?auto_101714 ) ) ( not ( = ?auto_101713 ?auto_101714 ) ) ( ON-TABLE ?auto_101714 ) ( ON ?auto_101713 ?auto_101714 ) ( ON ?auto_101708 ?auto_101715 ) ( not ( = ?auto_101708 ?auto_101715 ) ) ( not ( = ?auto_101709 ?auto_101715 ) ) ( not ( = ?auto_101710 ?auto_101715 ) ) ( not ( = ?auto_101711 ?auto_101715 ) ) ( not ( = ?auto_101712 ?auto_101715 ) ) ( not ( = ?auto_101713 ?auto_101715 ) ) ( not ( = ?auto_101714 ?auto_101715 ) ) ( ON ?auto_101709 ?auto_101708 ) ( ON-TABLE ?auto_101715 ) ( ON ?auto_101710 ?auto_101709 ) ( ON ?auto_101711 ?auto_101710 ) ( CLEAR ?auto_101713 ) ( ON ?auto_101712 ?auto_101711 ) ( CLEAR ?auto_101712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101715 ?auto_101708 ?auto_101709 ?auto_101710 ?auto_101711 )
      ( MAKE-7PILE ?auto_101708 ?auto_101709 ?auto_101710 ?auto_101711 ?auto_101712 ?auto_101713 ?auto_101714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101716 - BLOCK
      ?auto_101717 - BLOCK
      ?auto_101718 - BLOCK
      ?auto_101719 - BLOCK
      ?auto_101720 - BLOCK
      ?auto_101721 - BLOCK
      ?auto_101722 - BLOCK
    )
    :vars
    (
      ?auto_101723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101716 ?auto_101717 ) ) ( not ( = ?auto_101716 ?auto_101718 ) ) ( not ( = ?auto_101716 ?auto_101719 ) ) ( not ( = ?auto_101716 ?auto_101720 ) ) ( not ( = ?auto_101716 ?auto_101721 ) ) ( not ( = ?auto_101716 ?auto_101722 ) ) ( not ( = ?auto_101717 ?auto_101718 ) ) ( not ( = ?auto_101717 ?auto_101719 ) ) ( not ( = ?auto_101717 ?auto_101720 ) ) ( not ( = ?auto_101717 ?auto_101721 ) ) ( not ( = ?auto_101717 ?auto_101722 ) ) ( not ( = ?auto_101718 ?auto_101719 ) ) ( not ( = ?auto_101718 ?auto_101720 ) ) ( not ( = ?auto_101718 ?auto_101721 ) ) ( not ( = ?auto_101718 ?auto_101722 ) ) ( not ( = ?auto_101719 ?auto_101720 ) ) ( not ( = ?auto_101719 ?auto_101721 ) ) ( not ( = ?auto_101719 ?auto_101722 ) ) ( not ( = ?auto_101720 ?auto_101721 ) ) ( not ( = ?auto_101720 ?auto_101722 ) ) ( not ( = ?auto_101721 ?auto_101722 ) ) ( ON-TABLE ?auto_101722 ) ( ON ?auto_101716 ?auto_101723 ) ( not ( = ?auto_101716 ?auto_101723 ) ) ( not ( = ?auto_101717 ?auto_101723 ) ) ( not ( = ?auto_101718 ?auto_101723 ) ) ( not ( = ?auto_101719 ?auto_101723 ) ) ( not ( = ?auto_101720 ?auto_101723 ) ) ( not ( = ?auto_101721 ?auto_101723 ) ) ( not ( = ?auto_101722 ?auto_101723 ) ) ( ON ?auto_101717 ?auto_101716 ) ( ON-TABLE ?auto_101723 ) ( ON ?auto_101718 ?auto_101717 ) ( ON ?auto_101719 ?auto_101718 ) ( ON ?auto_101720 ?auto_101719 ) ( CLEAR ?auto_101720 ) ( HOLDING ?auto_101721 ) ( CLEAR ?auto_101722 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101722 ?auto_101721 )
      ( MAKE-7PILE ?auto_101716 ?auto_101717 ?auto_101718 ?auto_101719 ?auto_101720 ?auto_101721 ?auto_101722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101724 - BLOCK
      ?auto_101725 - BLOCK
      ?auto_101726 - BLOCK
      ?auto_101727 - BLOCK
      ?auto_101728 - BLOCK
      ?auto_101729 - BLOCK
      ?auto_101730 - BLOCK
    )
    :vars
    (
      ?auto_101731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101724 ?auto_101725 ) ) ( not ( = ?auto_101724 ?auto_101726 ) ) ( not ( = ?auto_101724 ?auto_101727 ) ) ( not ( = ?auto_101724 ?auto_101728 ) ) ( not ( = ?auto_101724 ?auto_101729 ) ) ( not ( = ?auto_101724 ?auto_101730 ) ) ( not ( = ?auto_101725 ?auto_101726 ) ) ( not ( = ?auto_101725 ?auto_101727 ) ) ( not ( = ?auto_101725 ?auto_101728 ) ) ( not ( = ?auto_101725 ?auto_101729 ) ) ( not ( = ?auto_101725 ?auto_101730 ) ) ( not ( = ?auto_101726 ?auto_101727 ) ) ( not ( = ?auto_101726 ?auto_101728 ) ) ( not ( = ?auto_101726 ?auto_101729 ) ) ( not ( = ?auto_101726 ?auto_101730 ) ) ( not ( = ?auto_101727 ?auto_101728 ) ) ( not ( = ?auto_101727 ?auto_101729 ) ) ( not ( = ?auto_101727 ?auto_101730 ) ) ( not ( = ?auto_101728 ?auto_101729 ) ) ( not ( = ?auto_101728 ?auto_101730 ) ) ( not ( = ?auto_101729 ?auto_101730 ) ) ( ON-TABLE ?auto_101730 ) ( ON ?auto_101724 ?auto_101731 ) ( not ( = ?auto_101724 ?auto_101731 ) ) ( not ( = ?auto_101725 ?auto_101731 ) ) ( not ( = ?auto_101726 ?auto_101731 ) ) ( not ( = ?auto_101727 ?auto_101731 ) ) ( not ( = ?auto_101728 ?auto_101731 ) ) ( not ( = ?auto_101729 ?auto_101731 ) ) ( not ( = ?auto_101730 ?auto_101731 ) ) ( ON ?auto_101725 ?auto_101724 ) ( ON-TABLE ?auto_101731 ) ( ON ?auto_101726 ?auto_101725 ) ( ON ?auto_101727 ?auto_101726 ) ( ON ?auto_101728 ?auto_101727 ) ( CLEAR ?auto_101730 ) ( ON ?auto_101729 ?auto_101728 ) ( CLEAR ?auto_101729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101731 ?auto_101724 ?auto_101725 ?auto_101726 ?auto_101727 ?auto_101728 )
      ( MAKE-7PILE ?auto_101724 ?auto_101725 ?auto_101726 ?auto_101727 ?auto_101728 ?auto_101729 ?auto_101730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101732 - BLOCK
      ?auto_101733 - BLOCK
      ?auto_101734 - BLOCK
      ?auto_101735 - BLOCK
      ?auto_101736 - BLOCK
      ?auto_101737 - BLOCK
      ?auto_101738 - BLOCK
    )
    :vars
    (
      ?auto_101739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101732 ?auto_101733 ) ) ( not ( = ?auto_101732 ?auto_101734 ) ) ( not ( = ?auto_101732 ?auto_101735 ) ) ( not ( = ?auto_101732 ?auto_101736 ) ) ( not ( = ?auto_101732 ?auto_101737 ) ) ( not ( = ?auto_101732 ?auto_101738 ) ) ( not ( = ?auto_101733 ?auto_101734 ) ) ( not ( = ?auto_101733 ?auto_101735 ) ) ( not ( = ?auto_101733 ?auto_101736 ) ) ( not ( = ?auto_101733 ?auto_101737 ) ) ( not ( = ?auto_101733 ?auto_101738 ) ) ( not ( = ?auto_101734 ?auto_101735 ) ) ( not ( = ?auto_101734 ?auto_101736 ) ) ( not ( = ?auto_101734 ?auto_101737 ) ) ( not ( = ?auto_101734 ?auto_101738 ) ) ( not ( = ?auto_101735 ?auto_101736 ) ) ( not ( = ?auto_101735 ?auto_101737 ) ) ( not ( = ?auto_101735 ?auto_101738 ) ) ( not ( = ?auto_101736 ?auto_101737 ) ) ( not ( = ?auto_101736 ?auto_101738 ) ) ( not ( = ?auto_101737 ?auto_101738 ) ) ( ON ?auto_101732 ?auto_101739 ) ( not ( = ?auto_101732 ?auto_101739 ) ) ( not ( = ?auto_101733 ?auto_101739 ) ) ( not ( = ?auto_101734 ?auto_101739 ) ) ( not ( = ?auto_101735 ?auto_101739 ) ) ( not ( = ?auto_101736 ?auto_101739 ) ) ( not ( = ?auto_101737 ?auto_101739 ) ) ( not ( = ?auto_101738 ?auto_101739 ) ) ( ON ?auto_101733 ?auto_101732 ) ( ON-TABLE ?auto_101739 ) ( ON ?auto_101734 ?auto_101733 ) ( ON ?auto_101735 ?auto_101734 ) ( ON ?auto_101736 ?auto_101735 ) ( ON ?auto_101737 ?auto_101736 ) ( CLEAR ?auto_101737 ) ( HOLDING ?auto_101738 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101738 )
      ( MAKE-7PILE ?auto_101732 ?auto_101733 ?auto_101734 ?auto_101735 ?auto_101736 ?auto_101737 ?auto_101738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_101740 - BLOCK
      ?auto_101741 - BLOCK
      ?auto_101742 - BLOCK
      ?auto_101743 - BLOCK
      ?auto_101744 - BLOCK
      ?auto_101745 - BLOCK
      ?auto_101746 - BLOCK
    )
    :vars
    (
      ?auto_101747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101740 ?auto_101741 ) ) ( not ( = ?auto_101740 ?auto_101742 ) ) ( not ( = ?auto_101740 ?auto_101743 ) ) ( not ( = ?auto_101740 ?auto_101744 ) ) ( not ( = ?auto_101740 ?auto_101745 ) ) ( not ( = ?auto_101740 ?auto_101746 ) ) ( not ( = ?auto_101741 ?auto_101742 ) ) ( not ( = ?auto_101741 ?auto_101743 ) ) ( not ( = ?auto_101741 ?auto_101744 ) ) ( not ( = ?auto_101741 ?auto_101745 ) ) ( not ( = ?auto_101741 ?auto_101746 ) ) ( not ( = ?auto_101742 ?auto_101743 ) ) ( not ( = ?auto_101742 ?auto_101744 ) ) ( not ( = ?auto_101742 ?auto_101745 ) ) ( not ( = ?auto_101742 ?auto_101746 ) ) ( not ( = ?auto_101743 ?auto_101744 ) ) ( not ( = ?auto_101743 ?auto_101745 ) ) ( not ( = ?auto_101743 ?auto_101746 ) ) ( not ( = ?auto_101744 ?auto_101745 ) ) ( not ( = ?auto_101744 ?auto_101746 ) ) ( not ( = ?auto_101745 ?auto_101746 ) ) ( ON ?auto_101740 ?auto_101747 ) ( not ( = ?auto_101740 ?auto_101747 ) ) ( not ( = ?auto_101741 ?auto_101747 ) ) ( not ( = ?auto_101742 ?auto_101747 ) ) ( not ( = ?auto_101743 ?auto_101747 ) ) ( not ( = ?auto_101744 ?auto_101747 ) ) ( not ( = ?auto_101745 ?auto_101747 ) ) ( not ( = ?auto_101746 ?auto_101747 ) ) ( ON ?auto_101741 ?auto_101740 ) ( ON-TABLE ?auto_101747 ) ( ON ?auto_101742 ?auto_101741 ) ( ON ?auto_101743 ?auto_101742 ) ( ON ?auto_101744 ?auto_101743 ) ( ON ?auto_101745 ?auto_101744 ) ( ON ?auto_101746 ?auto_101745 ) ( CLEAR ?auto_101746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101747 ?auto_101740 ?auto_101741 ?auto_101742 ?auto_101743 ?auto_101744 ?auto_101745 )
      ( MAKE-7PILE ?auto_101740 ?auto_101741 ?auto_101742 ?auto_101743 ?auto_101744 ?auto_101745 ?auto_101746 ) )
  )

)

