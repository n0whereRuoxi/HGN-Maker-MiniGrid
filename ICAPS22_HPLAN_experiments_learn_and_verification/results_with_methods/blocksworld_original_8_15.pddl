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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196203 - BLOCK
      ?auto_196204 - BLOCK
      ?auto_196205 - BLOCK
      ?auto_196206 - BLOCK
      ?auto_196207 - BLOCK
      ?auto_196208 - BLOCK
      ?auto_196209 - BLOCK
      ?auto_196210 - BLOCK
    )
    :vars
    (
      ?auto_196211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196211 ?auto_196210 ) ( CLEAR ?auto_196211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196203 ) ( ON ?auto_196204 ?auto_196203 ) ( ON ?auto_196205 ?auto_196204 ) ( ON ?auto_196206 ?auto_196205 ) ( ON ?auto_196207 ?auto_196206 ) ( ON ?auto_196208 ?auto_196207 ) ( ON ?auto_196209 ?auto_196208 ) ( ON ?auto_196210 ?auto_196209 ) ( not ( = ?auto_196203 ?auto_196204 ) ) ( not ( = ?auto_196203 ?auto_196205 ) ) ( not ( = ?auto_196203 ?auto_196206 ) ) ( not ( = ?auto_196203 ?auto_196207 ) ) ( not ( = ?auto_196203 ?auto_196208 ) ) ( not ( = ?auto_196203 ?auto_196209 ) ) ( not ( = ?auto_196203 ?auto_196210 ) ) ( not ( = ?auto_196203 ?auto_196211 ) ) ( not ( = ?auto_196204 ?auto_196205 ) ) ( not ( = ?auto_196204 ?auto_196206 ) ) ( not ( = ?auto_196204 ?auto_196207 ) ) ( not ( = ?auto_196204 ?auto_196208 ) ) ( not ( = ?auto_196204 ?auto_196209 ) ) ( not ( = ?auto_196204 ?auto_196210 ) ) ( not ( = ?auto_196204 ?auto_196211 ) ) ( not ( = ?auto_196205 ?auto_196206 ) ) ( not ( = ?auto_196205 ?auto_196207 ) ) ( not ( = ?auto_196205 ?auto_196208 ) ) ( not ( = ?auto_196205 ?auto_196209 ) ) ( not ( = ?auto_196205 ?auto_196210 ) ) ( not ( = ?auto_196205 ?auto_196211 ) ) ( not ( = ?auto_196206 ?auto_196207 ) ) ( not ( = ?auto_196206 ?auto_196208 ) ) ( not ( = ?auto_196206 ?auto_196209 ) ) ( not ( = ?auto_196206 ?auto_196210 ) ) ( not ( = ?auto_196206 ?auto_196211 ) ) ( not ( = ?auto_196207 ?auto_196208 ) ) ( not ( = ?auto_196207 ?auto_196209 ) ) ( not ( = ?auto_196207 ?auto_196210 ) ) ( not ( = ?auto_196207 ?auto_196211 ) ) ( not ( = ?auto_196208 ?auto_196209 ) ) ( not ( = ?auto_196208 ?auto_196210 ) ) ( not ( = ?auto_196208 ?auto_196211 ) ) ( not ( = ?auto_196209 ?auto_196210 ) ) ( not ( = ?auto_196209 ?auto_196211 ) ) ( not ( = ?auto_196210 ?auto_196211 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196211 ?auto_196210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_196213 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196213 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_196213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_196214 - BLOCK
    )
    :vars
    (
      ?auto_196215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196214 ?auto_196215 ) ( CLEAR ?auto_196214 ) ( HAND-EMPTY ) ( not ( = ?auto_196214 ?auto_196215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196214 ?auto_196215 )
      ( MAKE-1PILE ?auto_196214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196223 - BLOCK
      ?auto_196224 - BLOCK
      ?auto_196225 - BLOCK
      ?auto_196226 - BLOCK
      ?auto_196227 - BLOCK
      ?auto_196228 - BLOCK
      ?auto_196229 - BLOCK
    )
    :vars
    (
      ?auto_196230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196230 ?auto_196229 ) ( CLEAR ?auto_196230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196223 ) ( ON ?auto_196224 ?auto_196223 ) ( ON ?auto_196225 ?auto_196224 ) ( ON ?auto_196226 ?auto_196225 ) ( ON ?auto_196227 ?auto_196226 ) ( ON ?auto_196228 ?auto_196227 ) ( ON ?auto_196229 ?auto_196228 ) ( not ( = ?auto_196223 ?auto_196224 ) ) ( not ( = ?auto_196223 ?auto_196225 ) ) ( not ( = ?auto_196223 ?auto_196226 ) ) ( not ( = ?auto_196223 ?auto_196227 ) ) ( not ( = ?auto_196223 ?auto_196228 ) ) ( not ( = ?auto_196223 ?auto_196229 ) ) ( not ( = ?auto_196223 ?auto_196230 ) ) ( not ( = ?auto_196224 ?auto_196225 ) ) ( not ( = ?auto_196224 ?auto_196226 ) ) ( not ( = ?auto_196224 ?auto_196227 ) ) ( not ( = ?auto_196224 ?auto_196228 ) ) ( not ( = ?auto_196224 ?auto_196229 ) ) ( not ( = ?auto_196224 ?auto_196230 ) ) ( not ( = ?auto_196225 ?auto_196226 ) ) ( not ( = ?auto_196225 ?auto_196227 ) ) ( not ( = ?auto_196225 ?auto_196228 ) ) ( not ( = ?auto_196225 ?auto_196229 ) ) ( not ( = ?auto_196225 ?auto_196230 ) ) ( not ( = ?auto_196226 ?auto_196227 ) ) ( not ( = ?auto_196226 ?auto_196228 ) ) ( not ( = ?auto_196226 ?auto_196229 ) ) ( not ( = ?auto_196226 ?auto_196230 ) ) ( not ( = ?auto_196227 ?auto_196228 ) ) ( not ( = ?auto_196227 ?auto_196229 ) ) ( not ( = ?auto_196227 ?auto_196230 ) ) ( not ( = ?auto_196228 ?auto_196229 ) ) ( not ( = ?auto_196228 ?auto_196230 ) ) ( not ( = ?auto_196229 ?auto_196230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196230 ?auto_196229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196231 - BLOCK
      ?auto_196232 - BLOCK
      ?auto_196233 - BLOCK
      ?auto_196234 - BLOCK
      ?auto_196235 - BLOCK
      ?auto_196236 - BLOCK
      ?auto_196237 - BLOCK
    )
    :vars
    (
      ?auto_196238 - BLOCK
      ?auto_196239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196238 ?auto_196237 ) ( CLEAR ?auto_196238 ) ( ON-TABLE ?auto_196231 ) ( ON ?auto_196232 ?auto_196231 ) ( ON ?auto_196233 ?auto_196232 ) ( ON ?auto_196234 ?auto_196233 ) ( ON ?auto_196235 ?auto_196234 ) ( ON ?auto_196236 ?auto_196235 ) ( ON ?auto_196237 ?auto_196236 ) ( not ( = ?auto_196231 ?auto_196232 ) ) ( not ( = ?auto_196231 ?auto_196233 ) ) ( not ( = ?auto_196231 ?auto_196234 ) ) ( not ( = ?auto_196231 ?auto_196235 ) ) ( not ( = ?auto_196231 ?auto_196236 ) ) ( not ( = ?auto_196231 ?auto_196237 ) ) ( not ( = ?auto_196231 ?auto_196238 ) ) ( not ( = ?auto_196232 ?auto_196233 ) ) ( not ( = ?auto_196232 ?auto_196234 ) ) ( not ( = ?auto_196232 ?auto_196235 ) ) ( not ( = ?auto_196232 ?auto_196236 ) ) ( not ( = ?auto_196232 ?auto_196237 ) ) ( not ( = ?auto_196232 ?auto_196238 ) ) ( not ( = ?auto_196233 ?auto_196234 ) ) ( not ( = ?auto_196233 ?auto_196235 ) ) ( not ( = ?auto_196233 ?auto_196236 ) ) ( not ( = ?auto_196233 ?auto_196237 ) ) ( not ( = ?auto_196233 ?auto_196238 ) ) ( not ( = ?auto_196234 ?auto_196235 ) ) ( not ( = ?auto_196234 ?auto_196236 ) ) ( not ( = ?auto_196234 ?auto_196237 ) ) ( not ( = ?auto_196234 ?auto_196238 ) ) ( not ( = ?auto_196235 ?auto_196236 ) ) ( not ( = ?auto_196235 ?auto_196237 ) ) ( not ( = ?auto_196235 ?auto_196238 ) ) ( not ( = ?auto_196236 ?auto_196237 ) ) ( not ( = ?auto_196236 ?auto_196238 ) ) ( not ( = ?auto_196237 ?auto_196238 ) ) ( HOLDING ?auto_196239 ) ( not ( = ?auto_196231 ?auto_196239 ) ) ( not ( = ?auto_196232 ?auto_196239 ) ) ( not ( = ?auto_196233 ?auto_196239 ) ) ( not ( = ?auto_196234 ?auto_196239 ) ) ( not ( = ?auto_196235 ?auto_196239 ) ) ( not ( = ?auto_196236 ?auto_196239 ) ) ( not ( = ?auto_196237 ?auto_196239 ) ) ( not ( = ?auto_196238 ?auto_196239 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_196239 )
      ( MAKE-7PILE ?auto_196231 ?auto_196232 ?auto_196233 ?auto_196234 ?auto_196235 ?auto_196236 ?auto_196237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196240 - BLOCK
      ?auto_196241 - BLOCK
      ?auto_196242 - BLOCK
      ?auto_196243 - BLOCK
      ?auto_196244 - BLOCK
      ?auto_196245 - BLOCK
      ?auto_196246 - BLOCK
    )
    :vars
    (
      ?auto_196247 - BLOCK
      ?auto_196248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196247 ?auto_196246 ) ( ON-TABLE ?auto_196240 ) ( ON ?auto_196241 ?auto_196240 ) ( ON ?auto_196242 ?auto_196241 ) ( ON ?auto_196243 ?auto_196242 ) ( ON ?auto_196244 ?auto_196243 ) ( ON ?auto_196245 ?auto_196244 ) ( ON ?auto_196246 ?auto_196245 ) ( not ( = ?auto_196240 ?auto_196241 ) ) ( not ( = ?auto_196240 ?auto_196242 ) ) ( not ( = ?auto_196240 ?auto_196243 ) ) ( not ( = ?auto_196240 ?auto_196244 ) ) ( not ( = ?auto_196240 ?auto_196245 ) ) ( not ( = ?auto_196240 ?auto_196246 ) ) ( not ( = ?auto_196240 ?auto_196247 ) ) ( not ( = ?auto_196241 ?auto_196242 ) ) ( not ( = ?auto_196241 ?auto_196243 ) ) ( not ( = ?auto_196241 ?auto_196244 ) ) ( not ( = ?auto_196241 ?auto_196245 ) ) ( not ( = ?auto_196241 ?auto_196246 ) ) ( not ( = ?auto_196241 ?auto_196247 ) ) ( not ( = ?auto_196242 ?auto_196243 ) ) ( not ( = ?auto_196242 ?auto_196244 ) ) ( not ( = ?auto_196242 ?auto_196245 ) ) ( not ( = ?auto_196242 ?auto_196246 ) ) ( not ( = ?auto_196242 ?auto_196247 ) ) ( not ( = ?auto_196243 ?auto_196244 ) ) ( not ( = ?auto_196243 ?auto_196245 ) ) ( not ( = ?auto_196243 ?auto_196246 ) ) ( not ( = ?auto_196243 ?auto_196247 ) ) ( not ( = ?auto_196244 ?auto_196245 ) ) ( not ( = ?auto_196244 ?auto_196246 ) ) ( not ( = ?auto_196244 ?auto_196247 ) ) ( not ( = ?auto_196245 ?auto_196246 ) ) ( not ( = ?auto_196245 ?auto_196247 ) ) ( not ( = ?auto_196246 ?auto_196247 ) ) ( not ( = ?auto_196240 ?auto_196248 ) ) ( not ( = ?auto_196241 ?auto_196248 ) ) ( not ( = ?auto_196242 ?auto_196248 ) ) ( not ( = ?auto_196243 ?auto_196248 ) ) ( not ( = ?auto_196244 ?auto_196248 ) ) ( not ( = ?auto_196245 ?auto_196248 ) ) ( not ( = ?auto_196246 ?auto_196248 ) ) ( not ( = ?auto_196247 ?auto_196248 ) ) ( ON ?auto_196248 ?auto_196247 ) ( CLEAR ?auto_196248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196240 ?auto_196241 ?auto_196242 ?auto_196243 ?auto_196244 ?auto_196245 ?auto_196246 ?auto_196247 )
      ( MAKE-7PILE ?auto_196240 ?auto_196241 ?auto_196242 ?auto_196243 ?auto_196244 ?auto_196245 ?auto_196246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196251 - BLOCK
      ?auto_196252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196252 ) ( CLEAR ?auto_196251 ) ( ON-TABLE ?auto_196251 ) ( not ( = ?auto_196251 ?auto_196252 ) ) )
    :subtasks
    ( ( !STACK ?auto_196252 ?auto_196251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196253 - BLOCK
      ?auto_196254 - BLOCK
    )
    :vars
    (
      ?auto_196255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196253 ) ( ON-TABLE ?auto_196253 ) ( not ( = ?auto_196253 ?auto_196254 ) ) ( ON ?auto_196254 ?auto_196255 ) ( CLEAR ?auto_196254 ) ( HAND-EMPTY ) ( not ( = ?auto_196253 ?auto_196255 ) ) ( not ( = ?auto_196254 ?auto_196255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196254 ?auto_196255 )
      ( MAKE-2PILE ?auto_196253 ?auto_196254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196256 - BLOCK
      ?auto_196257 - BLOCK
    )
    :vars
    (
      ?auto_196258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196256 ?auto_196257 ) ) ( ON ?auto_196257 ?auto_196258 ) ( CLEAR ?auto_196257 ) ( not ( = ?auto_196256 ?auto_196258 ) ) ( not ( = ?auto_196257 ?auto_196258 ) ) ( HOLDING ?auto_196256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196256 )
      ( MAKE-2PILE ?auto_196256 ?auto_196257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196259 - BLOCK
      ?auto_196260 - BLOCK
    )
    :vars
    (
      ?auto_196261 - BLOCK
      ?auto_196263 - BLOCK
      ?auto_196265 - BLOCK
      ?auto_196266 - BLOCK
      ?auto_196267 - BLOCK
      ?auto_196264 - BLOCK
      ?auto_196262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196259 ?auto_196260 ) ) ( ON ?auto_196260 ?auto_196261 ) ( not ( = ?auto_196259 ?auto_196261 ) ) ( not ( = ?auto_196260 ?auto_196261 ) ) ( ON ?auto_196259 ?auto_196260 ) ( CLEAR ?auto_196259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196263 ) ( ON ?auto_196265 ?auto_196263 ) ( ON ?auto_196266 ?auto_196265 ) ( ON ?auto_196267 ?auto_196266 ) ( ON ?auto_196264 ?auto_196267 ) ( ON ?auto_196262 ?auto_196264 ) ( ON ?auto_196261 ?auto_196262 ) ( not ( = ?auto_196263 ?auto_196265 ) ) ( not ( = ?auto_196263 ?auto_196266 ) ) ( not ( = ?auto_196263 ?auto_196267 ) ) ( not ( = ?auto_196263 ?auto_196264 ) ) ( not ( = ?auto_196263 ?auto_196262 ) ) ( not ( = ?auto_196263 ?auto_196261 ) ) ( not ( = ?auto_196263 ?auto_196260 ) ) ( not ( = ?auto_196263 ?auto_196259 ) ) ( not ( = ?auto_196265 ?auto_196266 ) ) ( not ( = ?auto_196265 ?auto_196267 ) ) ( not ( = ?auto_196265 ?auto_196264 ) ) ( not ( = ?auto_196265 ?auto_196262 ) ) ( not ( = ?auto_196265 ?auto_196261 ) ) ( not ( = ?auto_196265 ?auto_196260 ) ) ( not ( = ?auto_196265 ?auto_196259 ) ) ( not ( = ?auto_196266 ?auto_196267 ) ) ( not ( = ?auto_196266 ?auto_196264 ) ) ( not ( = ?auto_196266 ?auto_196262 ) ) ( not ( = ?auto_196266 ?auto_196261 ) ) ( not ( = ?auto_196266 ?auto_196260 ) ) ( not ( = ?auto_196266 ?auto_196259 ) ) ( not ( = ?auto_196267 ?auto_196264 ) ) ( not ( = ?auto_196267 ?auto_196262 ) ) ( not ( = ?auto_196267 ?auto_196261 ) ) ( not ( = ?auto_196267 ?auto_196260 ) ) ( not ( = ?auto_196267 ?auto_196259 ) ) ( not ( = ?auto_196264 ?auto_196262 ) ) ( not ( = ?auto_196264 ?auto_196261 ) ) ( not ( = ?auto_196264 ?auto_196260 ) ) ( not ( = ?auto_196264 ?auto_196259 ) ) ( not ( = ?auto_196262 ?auto_196261 ) ) ( not ( = ?auto_196262 ?auto_196260 ) ) ( not ( = ?auto_196262 ?auto_196259 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196263 ?auto_196265 ?auto_196266 ?auto_196267 ?auto_196264 ?auto_196262 ?auto_196261 ?auto_196260 )
      ( MAKE-2PILE ?auto_196259 ?auto_196260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196274 - BLOCK
      ?auto_196275 - BLOCK
      ?auto_196276 - BLOCK
      ?auto_196277 - BLOCK
      ?auto_196278 - BLOCK
      ?auto_196279 - BLOCK
    )
    :vars
    (
      ?auto_196280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196280 ?auto_196279 ) ( CLEAR ?auto_196280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196274 ) ( ON ?auto_196275 ?auto_196274 ) ( ON ?auto_196276 ?auto_196275 ) ( ON ?auto_196277 ?auto_196276 ) ( ON ?auto_196278 ?auto_196277 ) ( ON ?auto_196279 ?auto_196278 ) ( not ( = ?auto_196274 ?auto_196275 ) ) ( not ( = ?auto_196274 ?auto_196276 ) ) ( not ( = ?auto_196274 ?auto_196277 ) ) ( not ( = ?auto_196274 ?auto_196278 ) ) ( not ( = ?auto_196274 ?auto_196279 ) ) ( not ( = ?auto_196274 ?auto_196280 ) ) ( not ( = ?auto_196275 ?auto_196276 ) ) ( not ( = ?auto_196275 ?auto_196277 ) ) ( not ( = ?auto_196275 ?auto_196278 ) ) ( not ( = ?auto_196275 ?auto_196279 ) ) ( not ( = ?auto_196275 ?auto_196280 ) ) ( not ( = ?auto_196276 ?auto_196277 ) ) ( not ( = ?auto_196276 ?auto_196278 ) ) ( not ( = ?auto_196276 ?auto_196279 ) ) ( not ( = ?auto_196276 ?auto_196280 ) ) ( not ( = ?auto_196277 ?auto_196278 ) ) ( not ( = ?auto_196277 ?auto_196279 ) ) ( not ( = ?auto_196277 ?auto_196280 ) ) ( not ( = ?auto_196278 ?auto_196279 ) ) ( not ( = ?auto_196278 ?auto_196280 ) ) ( not ( = ?auto_196279 ?auto_196280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196280 ?auto_196279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196281 - BLOCK
      ?auto_196282 - BLOCK
      ?auto_196283 - BLOCK
      ?auto_196284 - BLOCK
      ?auto_196285 - BLOCK
      ?auto_196286 - BLOCK
    )
    :vars
    (
      ?auto_196287 - BLOCK
      ?auto_196288 - BLOCK
      ?auto_196289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196287 ?auto_196286 ) ( CLEAR ?auto_196287 ) ( ON-TABLE ?auto_196281 ) ( ON ?auto_196282 ?auto_196281 ) ( ON ?auto_196283 ?auto_196282 ) ( ON ?auto_196284 ?auto_196283 ) ( ON ?auto_196285 ?auto_196284 ) ( ON ?auto_196286 ?auto_196285 ) ( not ( = ?auto_196281 ?auto_196282 ) ) ( not ( = ?auto_196281 ?auto_196283 ) ) ( not ( = ?auto_196281 ?auto_196284 ) ) ( not ( = ?auto_196281 ?auto_196285 ) ) ( not ( = ?auto_196281 ?auto_196286 ) ) ( not ( = ?auto_196281 ?auto_196287 ) ) ( not ( = ?auto_196282 ?auto_196283 ) ) ( not ( = ?auto_196282 ?auto_196284 ) ) ( not ( = ?auto_196282 ?auto_196285 ) ) ( not ( = ?auto_196282 ?auto_196286 ) ) ( not ( = ?auto_196282 ?auto_196287 ) ) ( not ( = ?auto_196283 ?auto_196284 ) ) ( not ( = ?auto_196283 ?auto_196285 ) ) ( not ( = ?auto_196283 ?auto_196286 ) ) ( not ( = ?auto_196283 ?auto_196287 ) ) ( not ( = ?auto_196284 ?auto_196285 ) ) ( not ( = ?auto_196284 ?auto_196286 ) ) ( not ( = ?auto_196284 ?auto_196287 ) ) ( not ( = ?auto_196285 ?auto_196286 ) ) ( not ( = ?auto_196285 ?auto_196287 ) ) ( not ( = ?auto_196286 ?auto_196287 ) ) ( HOLDING ?auto_196288 ) ( CLEAR ?auto_196289 ) ( not ( = ?auto_196281 ?auto_196288 ) ) ( not ( = ?auto_196281 ?auto_196289 ) ) ( not ( = ?auto_196282 ?auto_196288 ) ) ( not ( = ?auto_196282 ?auto_196289 ) ) ( not ( = ?auto_196283 ?auto_196288 ) ) ( not ( = ?auto_196283 ?auto_196289 ) ) ( not ( = ?auto_196284 ?auto_196288 ) ) ( not ( = ?auto_196284 ?auto_196289 ) ) ( not ( = ?auto_196285 ?auto_196288 ) ) ( not ( = ?auto_196285 ?auto_196289 ) ) ( not ( = ?auto_196286 ?auto_196288 ) ) ( not ( = ?auto_196286 ?auto_196289 ) ) ( not ( = ?auto_196287 ?auto_196288 ) ) ( not ( = ?auto_196287 ?auto_196289 ) ) ( not ( = ?auto_196288 ?auto_196289 ) ) )
    :subtasks
    ( ( !STACK ?auto_196288 ?auto_196289 )
      ( MAKE-6PILE ?auto_196281 ?auto_196282 ?auto_196283 ?auto_196284 ?auto_196285 ?auto_196286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196290 - BLOCK
      ?auto_196291 - BLOCK
      ?auto_196292 - BLOCK
      ?auto_196293 - BLOCK
      ?auto_196294 - BLOCK
      ?auto_196295 - BLOCK
    )
    :vars
    (
      ?auto_196297 - BLOCK
      ?auto_196298 - BLOCK
      ?auto_196296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196297 ?auto_196295 ) ( ON-TABLE ?auto_196290 ) ( ON ?auto_196291 ?auto_196290 ) ( ON ?auto_196292 ?auto_196291 ) ( ON ?auto_196293 ?auto_196292 ) ( ON ?auto_196294 ?auto_196293 ) ( ON ?auto_196295 ?auto_196294 ) ( not ( = ?auto_196290 ?auto_196291 ) ) ( not ( = ?auto_196290 ?auto_196292 ) ) ( not ( = ?auto_196290 ?auto_196293 ) ) ( not ( = ?auto_196290 ?auto_196294 ) ) ( not ( = ?auto_196290 ?auto_196295 ) ) ( not ( = ?auto_196290 ?auto_196297 ) ) ( not ( = ?auto_196291 ?auto_196292 ) ) ( not ( = ?auto_196291 ?auto_196293 ) ) ( not ( = ?auto_196291 ?auto_196294 ) ) ( not ( = ?auto_196291 ?auto_196295 ) ) ( not ( = ?auto_196291 ?auto_196297 ) ) ( not ( = ?auto_196292 ?auto_196293 ) ) ( not ( = ?auto_196292 ?auto_196294 ) ) ( not ( = ?auto_196292 ?auto_196295 ) ) ( not ( = ?auto_196292 ?auto_196297 ) ) ( not ( = ?auto_196293 ?auto_196294 ) ) ( not ( = ?auto_196293 ?auto_196295 ) ) ( not ( = ?auto_196293 ?auto_196297 ) ) ( not ( = ?auto_196294 ?auto_196295 ) ) ( not ( = ?auto_196294 ?auto_196297 ) ) ( not ( = ?auto_196295 ?auto_196297 ) ) ( CLEAR ?auto_196298 ) ( not ( = ?auto_196290 ?auto_196296 ) ) ( not ( = ?auto_196290 ?auto_196298 ) ) ( not ( = ?auto_196291 ?auto_196296 ) ) ( not ( = ?auto_196291 ?auto_196298 ) ) ( not ( = ?auto_196292 ?auto_196296 ) ) ( not ( = ?auto_196292 ?auto_196298 ) ) ( not ( = ?auto_196293 ?auto_196296 ) ) ( not ( = ?auto_196293 ?auto_196298 ) ) ( not ( = ?auto_196294 ?auto_196296 ) ) ( not ( = ?auto_196294 ?auto_196298 ) ) ( not ( = ?auto_196295 ?auto_196296 ) ) ( not ( = ?auto_196295 ?auto_196298 ) ) ( not ( = ?auto_196297 ?auto_196296 ) ) ( not ( = ?auto_196297 ?auto_196298 ) ) ( not ( = ?auto_196296 ?auto_196298 ) ) ( ON ?auto_196296 ?auto_196297 ) ( CLEAR ?auto_196296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196290 ?auto_196291 ?auto_196292 ?auto_196293 ?auto_196294 ?auto_196295 ?auto_196297 )
      ( MAKE-6PILE ?auto_196290 ?auto_196291 ?auto_196292 ?auto_196293 ?auto_196294 ?auto_196295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196299 - BLOCK
      ?auto_196300 - BLOCK
      ?auto_196301 - BLOCK
      ?auto_196302 - BLOCK
      ?auto_196303 - BLOCK
      ?auto_196304 - BLOCK
    )
    :vars
    (
      ?auto_196306 - BLOCK
      ?auto_196305 - BLOCK
      ?auto_196307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196306 ?auto_196304 ) ( ON-TABLE ?auto_196299 ) ( ON ?auto_196300 ?auto_196299 ) ( ON ?auto_196301 ?auto_196300 ) ( ON ?auto_196302 ?auto_196301 ) ( ON ?auto_196303 ?auto_196302 ) ( ON ?auto_196304 ?auto_196303 ) ( not ( = ?auto_196299 ?auto_196300 ) ) ( not ( = ?auto_196299 ?auto_196301 ) ) ( not ( = ?auto_196299 ?auto_196302 ) ) ( not ( = ?auto_196299 ?auto_196303 ) ) ( not ( = ?auto_196299 ?auto_196304 ) ) ( not ( = ?auto_196299 ?auto_196306 ) ) ( not ( = ?auto_196300 ?auto_196301 ) ) ( not ( = ?auto_196300 ?auto_196302 ) ) ( not ( = ?auto_196300 ?auto_196303 ) ) ( not ( = ?auto_196300 ?auto_196304 ) ) ( not ( = ?auto_196300 ?auto_196306 ) ) ( not ( = ?auto_196301 ?auto_196302 ) ) ( not ( = ?auto_196301 ?auto_196303 ) ) ( not ( = ?auto_196301 ?auto_196304 ) ) ( not ( = ?auto_196301 ?auto_196306 ) ) ( not ( = ?auto_196302 ?auto_196303 ) ) ( not ( = ?auto_196302 ?auto_196304 ) ) ( not ( = ?auto_196302 ?auto_196306 ) ) ( not ( = ?auto_196303 ?auto_196304 ) ) ( not ( = ?auto_196303 ?auto_196306 ) ) ( not ( = ?auto_196304 ?auto_196306 ) ) ( not ( = ?auto_196299 ?auto_196305 ) ) ( not ( = ?auto_196299 ?auto_196307 ) ) ( not ( = ?auto_196300 ?auto_196305 ) ) ( not ( = ?auto_196300 ?auto_196307 ) ) ( not ( = ?auto_196301 ?auto_196305 ) ) ( not ( = ?auto_196301 ?auto_196307 ) ) ( not ( = ?auto_196302 ?auto_196305 ) ) ( not ( = ?auto_196302 ?auto_196307 ) ) ( not ( = ?auto_196303 ?auto_196305 ) ) ( not ( = ?auto_196303 ?auto_196307 ) ) ( not ( = ?auto_196304 ?auto_196305 ) ) ( not ( = ?auto_196304 ?auto_196307 ) ) ( not ( = ?auto_196306 ?auto_196305 ) ) ( not ( = ?auto_196306 ?auto_196307 ) ) ( not ( = ?auto_196305 ?auto_196307 ) ) ( ON ?auto_196305 ?auto_196306 ) ( CLEAR ?auto_196305 ) ( HOLDING ?auto_196307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196307 )
      ( MAKE-6PILE ?auto_196299 ?auto_196300 ?auto_196301 ?auto_196302 ?auto_196303 ?auto_196304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196308 - BLOCK
      ?auto_196309 - BLOCK
      ?auto_196310 - BLOCK
      ?auto_196311 - BLOCK
      ?auto_196312 - BLOCK
      ?auto_196313 - BLOCK
    )
    :vars
    (
      ?auto_196315 - BLOCK
      ?auto_196314 - BLOCK
      ?auto_196316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196315 ?auto_196313 ) ( ON-TABLE ?auto_196308 ) ( ON ?auto_196309 ?auto_196308 ) ( ON ?auto_196310 ?auto_196309 ) ( ON ?auto_196311 ?auto_196310 ) ( ON ?auto_196312 ?auto_196311 ) ( ON ?auto_196313 ?auto_196312 ) ( not ( = ?auto_196308 ?auto_196309 ) ) ( not ( = ?auto_196308 ?auto_196310 ) ) ( not ( = ?auto_196308 ?auto_196311 ) ) ( not ( = ?auto_196308 ?auto_196312 ) ) ( not ( = ?auto_196308 ?auto_196313 ) ) ( not ( = ?auto_196308 ?auto_196315 ) ) ( not ( = ?auto_196309 ?auto_196310 ) ) ( not ( = ?auto_196309 ?auto_196311 ) ) ( not ( = ?auto_196309 ?auto_196312 ) ) ( not ( = ?auto_196309 ?auto_196313 ) ) ( not ( = ?auto_196309 ?auto_196315 ) ) ( not ( = ?auto_196310 ?auto_196311 ) ) ( not ( = ?auto_196310 ?auto_196312 ) ) ( not ( = ?auto_196310 ?auto_196313 ) ) ( not ( = ?auto_196310 ?auto_196315 ) ) ( not ( = ?auto_196311 ?auto_196312 ) ) ( not ( = ?auto_196311 ?auto_196313 ) ) ( not ( = ?auto_196311 ?auto_196315 ) ) ( not ( = ?auto_196312 ?auto_196313 ) ) ( not ( = ?auto_196312 ?auto_196315 ) ) ( not ( = ?auto_196313 ?auto_196315 ) ) ( not ( = ?auto_196308 ?auto_196314 ) ) ( not ( = ?auto_196308 ?auto_196316 ) ) ( not ( = ?auto_196309 ?auto_196314 ) ) ( not ( = ?auto_196309 ?auto_196316 ) ) ( not ( = ?auto_196310 ?auto_196314 ) ) ( not ( = ?auto_196310 ?auto_196316 ) ) ( not ( = ?auto_196311 ?auto_196314 ) ) ( not ( = ?auto_196311 ?auto_196316 ) ) ( not ( = ?auto_196312 ?auto_196314 ) ) ( not ( = ?auto_196312 ?auto_196316 ) ) ( not ( = ?auto_196313 ?auto_196314 ) ) ( not ( = ?auto_196313 ?auto_196316 ) ) ( not ( = ?auto_196315 ?auto_196314 ) ) ( not ( = ?auto_196315 ?auto_196316 ) ) ( not ( = ?auto_196314 ?auto_196316 ) ) ( ON ?auto_196314 ?auto_196315 ) ( ON ?auto_196316 ?auto_196314 ) ( CLEAR ?auto_196316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196308 ?auto_196309 ?auto_196310 ?auto_196311 ?auto_196312 ?auto_196313 ?auto_196315 ?auto_196314 )
      ( MAKE-6PILE ?auto_196308 ?auto_196309 ?auto_196310 ?auto_196311 ?auto_196312 ?auto_196313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196320 - BLOCK
      ?auto_196321 - BLOCK
      ?auto_196322 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196322 ) ( CLEAR ?auto_196321 ) ( ON-TABLE ?auto_196320 ) ( ON ?auto_196321 ?auto_196320 ) ( not ( = ?auto_196320 ?auto_196321 ) ) ( not ( = ?auto_196320 ?auto_196322 ) ) ( not ( = ?auto_196321 ?auto_196322 ) ) )
    :subtasks
    ( ( !STACK ?auto_196322 ?auto_196321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196323 - BLOCK
      ?auto_196324 - BLOCK
      ?auto_196325 - BLOCK
    )
    :vars
    (
      ?auto_196326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196324 ) ( ON-TABLE ?auto_196323 ) ( ON ?auto_196324 ?auto_196323 ) ( not ( = ?auto_196323 ?auto_196324 ) ) ( not ( = ?auto_196323 ?auto_196325 ) ) ( not ( = ?auto_196324 ?auto_196325 ) ) ( ON ?auto_196325 ?auto_196326 ) ( CLEAR ?auto_196325 ) ( HAND-EMPTY ) ( not ( = ?auto_196323 ?auto_196326 ) ) ( not ( = ?auto_196324 ?auto_196326 ) ) ( not ( = ?auto_196325 ?auto_196326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196325 ?auto_196326 )
      ( MAKE-3PILE ?auto_196323 ?auto_196324 ?auto_196325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196327 - BLOCK
      ?auto_196328 - BLOCK
      ?auto_196329 - BLOCK
    )
    :vars
    (
      ?auto_196330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196327 ) ( not ( = ?auto_196327 ?auto_196328 ) ) ( not ( = ?auto_196327 ?auto_196329 ) ) ( not ( = ?auto_196328 ?auto_196329 ) ) ( ON ?auto_196329 ?auto_196330 ) ( CLEAR ?auto_196329 ) ( not ( = ?auto_196327 ?auto_196330 ) ) ( not ( = ?auto_196328 ?auto_196330 ) ) ( not ( = ?auto_196329 ?auto_196330 ) ) ( HOLDING ?auto_196328 ) ( CLEAR ?auto_196327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196327 ?auto_196328 )
      ( MAKE-3PILE ?auto_196327 ?auto_196328 ?auto_196329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196331 - BLOCK
      ?auto_196332 - BLOCK
      ?auto_196333 - BLOCK
    )
    :vars
    (
      ?auto_196334 - BLOCK
      ?auto_196335 - BLOCK
      ?auto_196339 - BLOCK
      ?auto_196338 - BLOCK
      ?auto_196336 - BLOCK
      ?auto_196337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196331 ) ( not ( = ?auto_196331 ?auto_196332 ) ) ( not ( = ?auto_196331 ?auto_196333 ) ) ( not ( = ?auto_196332 ?auto_196333 ) ) ( ON ?auto_196333 ?auto_196334 ) ( not ( = ?auto_196331 ?auto_196334 ) ) ( not ( = ?auto_196332 ?auto_196334 ) ) ( not ( = ?auto_196333 ?auto_196334 ) ) ( CLEAR ?auto_196331 ) ( ON ?auto_196332 ?auto_196333 ) ( CLEAR ?auto_196332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196335 ) ( ON ?auto_196339 ?auto_196335 ) ( ON ?auto_196338 ?auto_196339 ) ( ON ?auto_196336 ?auto_196338 ) ( ON ?auto_196337 ?auto_196336 ) ( ON ?auto_196334 ?auto_196337 ) ( not ( = ?auto_196335 ?auto_196339 ) ) ( not ( = ?auto_196335 ?auto_196338 ) ) ( not ( = ?auto_196335 ?auto_196336 ) ) ( not ( = ?auto_196335 ?auto_196337 ) ) ( not ( = ?auto_196335 ?auto_196334 ) ) ( not ( = ?auto_196335 ?auto_196333 ) ) ( not ( = ?auto_196335 ?auto_196332 ) ) ( not ( = ?auto_196339 ?auto_196338 ) ) ( not ( = ?auto_196339 ?auto_196336 ) ) ( not ( = ?auto_196339 ?auto_196337 ) ) ( not ( = ?auto_196339 ?auto_196334 ) ) ( not ( = ?auto_196339 ?auto_196333 ) ) ( not ( = ?auto_196339 ?auto_196332 ) ) ( not ( = ?auto_196338 ?auto_196336 ) ) ( not ( = ?auto_196338 ?auto_196337 ) ) ( not ( = ?auto_196338 ?auto_196334 ) ) ( not ( = ?auto_196338 ?auto_196333 ) ) ( not ( = ?auto_196338 ?auto_196332 ) ) ( not ( = ?auto_196336 ?auto_196337 ) ) ( not ( = ?auto_196336 ?auto_196334 ) ) ( not ( = ?auto_196336 ?auto_196333 ) ) ( not ( = ?auto_196336 ?auto_196332 ) ) ( not ( = ?auto_196337 ?auto_196334 ) ) ( not ( = ?auto_196337 ?auto_196333 ) ) ( not ( = ?auto_196337 ?auto_196332 ) ) ( not ( = ?auto_196331 ?auto_196335 ) ) ( not ( = ?auto_196331 ?auto_196339 ) ) ( not ( = ?auto_196331 ?auto_196338 ) ) ( not ( = ?auto_196331 ?auto_196336 ) ) ( not ( = ?auto_196331 ?auto_196337 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196335 ?auto_196339 ?auto_196338 ?auto_196336 ?auto_196337 ?auto_196334 ?auto_196333 )
      ( MAKE-3PILE ?auto_196331 ?auto_196332 ?auto_196333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196340 - BLOCK
      ?auto_196341 - BLOCK
      ?auto_196342 - BLOCK
    )
    :vars
    (
      ?auto_196343 - BLOCK
      ?auto_196346 - BLOCK
      ?auto_196347 - BLOCK
      ?auto_196345 - BLOCK
      ?auto_196348 - BLOCK
      ?auto_196344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196340 ?auto_196341 ) ) ( not ( = ?auto_196340 ?auto_196342 ) ) ( not ( = ?auto_196341 ?auto_196342 ) ) ( ON ?auto_196342 ?auto_196343 ) ( not ( = ?auto_196340 ?auto_196343 ) ) ( not ( = ?auto_196341 ?auto_196343 ) ) ( not ( = ?auto_196342 ?auto_196343 ) ) ( ON ?auto_196341 ?auto_196342 ) ( CLEAR ?auto_196341 ) ( ON-TABLE ?auto_196346 ) ( ON ?auto_196347 ?auto_196346 ) ( ON ?auto_196345 ?auto_196347 ) ( ON ?auto_196348 ?auto_196345 ) ( ON ?auto_196344 ?auto_196348 ) ( ON ?auto_196343 ?auto_196344 ) ( not ( = ?auto_196346 ?auto_196347 ) ) ( not ( = ?auto_196346 ?auto_196345 ) ) ( not ( = ?auto_196346 ?auto_196348 ) ) ( not ( = ?auto_196346 ?auto_196344 ) ) ( not ( = ?auto_196346 ?auto_196343 ) ) ( not ( = ?auto_196346 ?auto_196342 ) ) ( not ( = ?auto_196346 ?auto_196341 ) ) ( not ( = ?auto_196347 ?auto_196345 ) ) ( not ( = ?auto_196347 ?auto_196348 ) ) ( not ( = ?auto_196347 ?auto_196344 ) ) ( not ( = ?auto_196347 ?auto_196343 ) ) ( not ( = ?auto_196347 ?auto_196342 ) ) ( not ( = ?auto_196347 ?auto_196341 ) ) ( not ( = ?auto_196345 ?auto_196348 ) ) ( not ( = ?auto_196345 ?auto_196344 ) ) ( not ( = ?auto_196345 ?auto_196343 ) ) ( not ( = ?auto_196345 ?auto_196342 ) ) ( not ( = ?auto_196345 ?auto_196341 ) ) ( not ( = ?auto_196348 ?auto_196344 ) ) ( not ( = ?auto_196348 ?auto_196343 ) ) ( not ( = ?auto_196348 ?auto_196342 ) ) ( not ( = ?auto_196348 ?auto_196341 ) ) ( not ( = ?auto_196344 ?auto_196343 ) ) ( not ( = ?auto_196344 ?auto_196342 ) ) ( not ( = ?auto_196344 ?auto_196341 ) ) ( not ( = ?auto_196340 ?auto_196346 ) ) ( not ( = ?auto_196340 ?auto_196347 ) ) ( not ( = ?auto_196340 ?auto_196345 ) ) ( not ( = ?auto_196340 ?auto_196348 ) ) ( not ( = ?auto_196340 ?auto_196344 ) ) ( HOLDING ?auto_196340 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196340 )
      ( MAKE-3PILE ?auto_196340 ?auto_196341 ?auto_196342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196349 - BLOCK
      ?auto_196350 - BLOCK
      ?auto_196351 - BLOCK
    )
    :vars
    (
      ?auto_196352 - BLOCK
      ?auto_196356 - BLOCK
      ?auto_196353 - BLOCK
      ?auto_196354 - BLOCK
      ?auto_196355 - BLOCK
      ?auto_196357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196349 ?auto_196350 ) ) ( not ( = ?auto_196349 ?auto_196351 ) ) ( not ( = ?auto_196350 ?auto_196351 ) ) ( ON ?auto_196351 ?auto_196352 ) ( not ( = ?auto_196349 ?auto_196352 ) ) ( not ( = ?auto_196350 ?auto_196352 ) ) ( not ( = ?auto_196351 ?auto_196352 ) ) ( ON ?auto_196350 ?auto_196351 ) ( ON-TABLE ?auto_196356 ) ( ON ?auto_196353 ?auto_196356 ) ( ON ?auto_196354 ?auto_196353 ) ( ON ?auto_196355 ?auto_196354 ) ( ON ?auto_196357 ?auto_196355 ) ( ON ?auto_196352 ?auto_196357 ) ( not ( = ?auto_196356 ?auto_196353 ) ) ( not ( = ?auto_196356 ?auto_196354 ) ) ( not ( = ?auto_196356 ?auto_196355 ) ) ( not ( = ?auto_196356 ?auto_196357 ) ) ( not ( = ?auto_196356 ?auto_196352 ) ) ( not ( = ?auto_196356 ?auto_196351 ) ) ( not ( = ?auto_196356 ?auto_196350 ) ) ( not ( = ?auto_196353 ?auto_196354 ) ) ( not ( = ?auto_196353 ?auto_196355 ) ) ( not ( = ?auto_196353 ?auto_196357 ) ) ( not ( = ?auto_196353 ?auto_196352 ) ) ( not ( = ?auto_196353 ?auto_196351 ) ) ( not ( = ?auto_196353 ?auto_196350 ) ) ( not ( = ?auto_196354 ?auto_196355 ) ) ( not ( = ?auto_196354 ?auto_196357 ) ) ( not ( = ?auto_196354 ?auto_196352 ) ) ( not ( = ?auto_196354 ?auto_196351 ) ) ( not ( = ?auto_196354 ?auto_196350 ) ) ( not ( = ?auto_196355 ?auto_196357 ) ) ( not ( = ?auto_196355 ?auto_196352 ) ) ( not ( = ?auto_196355 ?auto_196351 ) ) ( not ( = ?auto_196355 ?auto_196350 ) ) ( not ( = ?auto_196357 ?auto_196352 ) ) ( not ( = ?auto_196357 ?auto_196351 ) ) ( not ( = ?auto_196357 ?auto_196350 ) ) ( not ( = ?auto_196349 ?auto_196356 ) ) ( not ( = ?auto_196349 ?auto_196353 ) ) ( not ( = ?auto_196349 ?auto_196354 ) ) ( not ( = ?auto_196349 ?auto_196355 ) ) ( not ( = ?auto_196349 ?auto_196357 ) ) ( ON ?auto_196349 ?auto_196350 ) ( CLEAR ?auto_196349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196356 ?auto_196353 ?auto_196354 ?auto_196355 ?auto_196357 ?auto_196352 ?auto_196351 ?auto_196350 )
      ( MAKE-3PILE ?auto_196349 ?auto_196350 ?auto_196351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196363 - BLOCK
      ?auto_196364 - BLOCK
      ?auto_196365 - BLOCK
      ?auto_196366 - BLOCK
      ?auto_196367 - BLOCK
    )
    :vars
    (
      ?auto_196368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196368 ?auto_196367 ) ( CLEAR ?auto_196368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196363 ) ( ON ?auto_196364 ?auto_196363 ) ( ON ?auto_196365 ?auto_196364 ) ( ON ?auto_196366 ?auto_196365 ) ( ON ?auto_196367 ?auto_196366 ) ( not ( = ?auto_196363 ?auto_196364 ) ) ( not ( = ?auto_196363 ?auto_196365 ) ) ( not ( = ?auto_196363 ?auto_196366 ) ) ( not ( = ?auto_196363 ?auto_196367 ) ) ( not ( = ?auto_196363 ?auto_196368 ) ) ( not ( = ?auto_196364 ?auto_196365 ) ) ( not ( = ?auto_196364 ?auto_196366 ) ) ( not ( = ?auto_196364 ?auto_196367 ) ) ( not ( = ?auto_196364 ?auto_196368 ) ) ( not ( = ?auto_196365 ?auto_196366 ) ) ( not ( = ?auto_196365 ?auto_196367 ) ) ( not ( = ?auto_196365 ?auto_196368 ) ) ( not ( = ?auto_196366 ?auto_196367 ) ) ( not ( = ?auto_196366 ?auto_196368 ) ) ( not ( = ?auto_196367 ?auto_196368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196368 ?auto_196367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196369 - BLOCK
      ?auto_196370 - BLOCK
      ?auto_196371 - BLOCK
      ?auto_196372 - BLOCK
      ?auto_196373 - BLOCK
    )
    :vars
    (
      ?auto_196374 - BLOCK
      ?auto_196375 - BLOCK
      ?auto_196376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196374 ?auto_196373 ) ( CLEAR ?auto_196374 ) ( ON-TABLE ?auto_196369 ) ( ON ?auto_196370 ?auto_196369 ) ( ON ?auto_196371 ?auto_196370 ) ( ON ?auto_196372 ?auto_196371 ) ( ON ?auto_196373 ?auto_196372 ) ( not ( = ?auto_196369 ?auto_196370 ) ) ( not ( = ?auto_196369 ?auto_196371 ) ) ( not ( = ?auto_196369 ?auto_196372 ) ) ( not ( = ?auto_196369 ?auto_196373 ) ) ( not ( = ?auto_196369 ?auto_196374 ) ) ( not ( = ?auto_196370 ?auto_196371 ) ) ( not ( = ?auto_196370 ?auto_196372 ) ) ( not ( = ?auto_196370 ?auto_196373 ) ) ( not ( = ?auto_196370 ?auto_196374 ) ) ( not ( = ?auto_196371 ?auto_196372 ) ) ( not ( = ?auto_196371 ?auto_196373 ) ) ( not ( = ?auto_196371 ?auto_196374 ) ) ( not ( = ?auto_196372 ?auto_196373 ) ) ( not ( = ?auto_196372 ?auto_196374 ) ) ( not ( = ?auto_196373 ?auto_196374 ) ) ( HOLDING ?auto_196375 ) ( CLEAR ?auto_196376 ) ( not ( = ?auto_196369 ?auto_196375 ) ) ( not ( = ?auto_196369 ?auto_196376 ) ) ( not ( = ?auto_196370 ?auto_196375 ) ) ( not ( = ?auto_196370 ?auto_196376 ) ) ( not ( = ?auto_196371 ?auto_196375 ) ) ( not ( = ?auto_196371 ?auto_196376 ) ) ( not ( = ?auto_196372 ?auto_196375 ) ) ( not ( = ?auto_196372 ?auto_196376 ) ) ( not ( = ?auto_196373 ?auto_196375 ) ) ( not ( = ?auto_196373 ?auto_196376 ) ) ( not ( = ?auto_196374 ?auto_196375 ) ) ( not ( = ?auto_196374 ?auto_196376 ) ) ( not ( = ?auto_196375 ?auto_196376 ) ) )
    :subtasks
    ( ( !STACK ?auto_196375 ?auto_196376 )
      ( MAKE-5PILE ?auto_196369 ?auto_196370 ?auto_196371 ?auto_196372 ?auto_196373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196377 - BLOCK
      ?auto_196378 - BLOCK
      ?auto_196379 - BLOCK
      ?auto_196380 - BLOCK
      ?auto_196381 - BLOCK
    )
    :vars
    (
      ?auto_196383 - BLOCK
      ?auto_196384 - BLOCK
      ?auto_196382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196383 ?auto_196381 ) ( ON-TABLE ?auto_196377 ) ( ON ?auto_196378 ?auto_196377 ) ( ON ?auto_196379 ?auto_196378 ) ( ON ?auto_196380 ?auto_196379 ) ( ON ?auto_196381 ?auto_196380 ) ( not ( = ?auto_196377 ?auto_196378 ) ) ( not ( = ?auto_196377 ?auto_196379 ) ) ( not ( = ?auto_196377 ?auto_196380 ) ) ( not ( = ?auto_196377 ?auto_196381 ) ) ( not ( = ?auto_196377 ?auto_196383 ) ) ( not ( = ?auto_196378 ?auto_196379 ) ) ( not ( = ?auto_196378 ?auto_196380 ) ) ( not ( = ?auto_196378 ?auto_196381 ) ) ( not ( = ?auto_196378 ?auto_196383 ) ) ( not ( = ?auto_196379 ?auto_196380 ) ) ( not ( = ?auto_196379 ?auto_196381 ) ) ( not ( = ?auto_196379 ?auto_196383 ) ) ( not ( = ?auto_196380 ?auto_196381 ) ) ( not ( = ?auto_196380 ?auto_196383 ) ) ( not ( = ?auto_196381 ?auto_196383 ) ) ( CLEAR ?auto_196384 ) ( not ( = ?auto_196377 ?auto_196382 ) ) ( not ( = ?auto_196377 ?auto_196384 ) ) ( not ( = ?auto_196378 ?auto_196382 ) ) ( not ( = ?auto_196378 ?auto_196384 ) ) ( not ( = ?auto_196379 ?auto_196382 ) ) ( not ( = ?auto_196379 ?auto_196384 ) ) ( not ( = ?auto_196380 ?auto_196382 ) ) ( not ( = ?auto_196380 ?auto_196384 ) ) ( not ( = ?auto_196381 ?auto_196382 ) ) ( not ( = ?auto_196381 ?auto_196384 ) ) ( not ( = ?auto_196383 ?auto_196382 ) ) ( not ( = ?auto_196383 ?auto_196384 ) ) ( not ( = ?auto_196382 ?auto_196384 ) ) ( ON ?auto_196382 ?auto_196383 ) ( CLEAR ?auto_196382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196377 ?auto_196378 ?auto_196379 ?auto_196380 ?auto_196381 ?auto_196383 )
      ( MAKE-5PILE ?auto_196377 ?auto_196378 ?auto_196379 ?auto_196380 ?auto_196381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196385 - BLOCK
      ?auto_196386 - BLOCK
      ?auto_196387 - BLOCK
      ?auto_196388 - BLOCK
      ?auto_196389 - BLOCK
    )
    :vars
    (
      ?auto_196391 - BLOCK
      ?auto_196392 - BLOCK
      ?auto_196390 - BLOCK
      ?auto_196393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196391 ?auto_196389 ) ( ON-TABLE ?auto_196385 ) ( ON ?auto_196386 ?auto_196385 ) ( ON ?auto_196387 ?auto_196386 ) ( ON ?auto_196388 ?auto_196387 ) ( ON ?auto_196389 ?auto_196388 ) ( not ( = ?auto_196385 ?auto_196386 ) ) ( not ( = ?auto_196385 ?auto_196387 ) ) ( not ( = ?auto_196385 ?auto_196388 ) ) ( not ( = ?auto_196385 ?auto_196389 ) ) ( not ( = ?auto_196385 ?auto_196391 ) ) ( not ( = ?auto_196386 ?auto_196387 ) ) ( not ( = ?auto_196386 ?auto_196388 ) ) ( not ( = ?auto_196386 ?auto_196389 ) ) ( not ( = ?auto_196386 ?auto_196391 ) ) ( not ( = ?auto_196387 ?auto_196388 ) ) ( not ( = ?auto_196387 ?auto_196389 ) ) ( not ( = ?auto_196387 ?auto_196391 ) ) ( not ( = ?auto_196388 ?auto_196389 ) ) ( not ( = ?auto_196388 ?auto_196391 ) ) ( not ( = ?auto_196389 ?auto_196391 ) ) ( not ( = ?auto_196385 ?auto_196392 ) ) ( not ( = ?auto_196385 ?auto_196390 ) ) ( not ( = ?auto_196386 ?auto_196392 ) ) ( not ( = ?auto_196386 ?auto_196390 ) ) ( not ( = ?auto_196387 ?auto_196392 ) ) ( not ( = ?auto_196387 ?auto_196390 ) ) ( not ( = ?auto_196388 ?auto_196392 ) ) ( not ( = ?auto_196388 ?auto_196390 ) ) ( not ( = ?auto_196389 ?auto_196392 ) ) ( not ( = ?auto_196389 ?auto_196390 ) ) ( not ( = ?auto_196391 ?auto_196392 ) ) ( not ( = ?auto_196391 ?auto_196390 ) ) ( not ( = ?auto_196392 ?auto_196390 ) ) ( ON ?auto_196392 ?auto_196391 ) ( CLEAR ?auto_196392 ) ( HOLDING ?auto_196390 ) ( CLEAR ?auto_196393 ) ( ON-TABLE ?auto_196393 ) ( not ( = ?auto_196393 ?auto_196390 ) ) ( not ( = ?auto_196385 ?auto_196393 ) ) ( not ( = ?auto_196386 ?auto_196393 ) ) ( not ( = ?auto_196387 ?auto_196393 ) ) ( not ( = ?auto_196388 ?auto_196393 ) ) ( not ( = ?auto_196389 ?auto_196393 ) ) ( not ( = ?auto_196391 ?auto_196393 ) ) ( not ( = ?auto_196392 ?auto_196393 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196393 ?auto_196390 )
      ( MAKE-5PILE ?auto_196385 ?auto_196386 ?auto_196387 ?auto_196388 ?auto_196389 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196394 - BLOCK
      ?auto_196395 - BLOCK
      ?auto_196396 - BLOCK
      ?auto_196397 - BLOCK
      ?auto_196398 - BLOCK
    )
    :vars
    (
      ?auto_196399 - BLOCK
      ?auto_196401 - BLOCK
      ?auto_196402 - BLOCK
      ?auto_196400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196399 ?auto_196398 ) ( ON-TABLE ?auto_196394 ) ( ON ?auto_196395 ?auto_196394 ) ( ON ?auto_196396 ?auto_196395 ) ( ON ?auto_196397 ?auto_196396 ) ( ON ?auto_196398 ?auto_196397 ) ( not ( = ?auto_196394 ?auto_196395 ) ) ( not ( = ?auto_196394 ?auto_196396 ) ) ( not ( = ?auto_196394 ?auto_196397 ) ) ( not ( = ?auto_196394 ?auto_196398 ) ) ( not ( = ?auto_196394 ?auto_196399 ) ) ( not ( = ?auto_196395 ?auto_196396 ) ) ( not ( = ?auto_196395 ?auto_196397 ) ) ( not ( = ?auto_196395 ?auto_196398 ) ) ( not ( = ?auto_196395 ?auto_196399 ) ) ( not ( = ?auto_196396 ?auto_196397 ) ) ( not ( = ?auto_196396 ?auto_196398 ) ) ( not ( = ?auto_196396 ?auto_196399 ) ) ( not ( = ?auto_196397 ?auto_196398 ) ) ( not ( = ?auto_196397 ?auto_196399 ) ) ( not ( = ?auto_196398 ?auto_196399 ) ) ( not ( = ?auto_196394 ?auto_196401 ) ) ( not ( = ?auto_196394 ?auto_196402 ) ) ( not ( = ?auto_196395 ?auto_196401 ) ) ( not ( = ?auto_196395 ?auto_196402 ) ) ( not ( = ?auto_196396 ?auto_196401 ) ) ( not ( = ?auto_196396 ?auto_196402 ) ) ( not ( = ?auto_196397 ?auto_196401 ) ) ( not ( = ?auto_196397 ?auto_196402 ) ) ( not ( = ?auto_196398 ?auto_196401 ) ) ( not ( = ?auto_196398 ?auto_196402 ) ) ( not ( = ?auto_196399 ?auto_196401 ) ) ( not ( = ?auto_196399 ?auto_196402 ) ) ( not ( = ?auto_196401 ?auto_196402 ) ) ( ON ?auto_196401 ?auto_196399 ) ( CLEAR ?auto_196400 ) ( ON-TABLE ?auto_196400 ) ( not ( = ?auto_196400 ?auto_196402 ) ) ( not ( = ?auto_196394 ?auto_196400 ) ) ( not ( = ?auto_196395 ?auto_196400 ) ) ( not ( = ?auto_196396 ?auto_196400 ) ) ( not ( = ?auto_196397 ?auto_196400 ) ) ( not ( = ?auto_196398 ?auto_196400 ) ) ( not ( = ?auto_196399 ?auto_196400 ) ) ( not ( = ?auto_196401 ?auto_196400 ) ) ( ON ?auto_196402 ?auto_196401 ) ( CLEAR ?auto_196402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196394 ?auto_196395 ?auto_196396 ?auto_196397 ?auto_196398 ?auto_196399 ?auto_196401 )
      ( MAKE-5PILE ?auto_196394 ?auto_196395 ?auto_196396 ?auto_196397 ?auto_196398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196403 - BLOCK
      ?auto_196404 - BLOCK
      ?auto_196405 - BLOCK
      ?auto_196406 - BLOCK
      ?auto_196407 - BLOCK
    )
    :vars
    (
      ?auto_196411 - BLOCK
      ?auto_196409 - BLOCK
      ?auto_196408 - BLOCK
      ?auto_196410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196411 ?auto_196407 ) ( ON-TABLE ?auto_196403 ) ( ON ?auto_196404 ?auto_196403 ) ( ON ?auto_196405 ?auto_196404 ) ( ON ?auto_196406 ?auto_196405 ) ( ON ?auto_196407 ?auto_196406 ) ( not ( = ?auto_196403 ?auto_196404 ) ) ( not ( = ?auto_196403 ?auto_196405 ) ) ( not ( = ?auto_196403 ?auto_196406 ) ) ( not ( = ?auto_196403 ?auto_196407 ) ) ( not ( = ?auto_196403 ?auto_196411 ) ) ( not ( = ?auto_196404 ?auto_196405 ) ) ( not ( = ?auto_196404 ?auto_196406 ) ) ( not ( = ?auto_196404 ?auto_196407 ) ) ( not ( = ?auto_196404 ?auto_196411 ) ) ( not ( = ?auto_196405 ?auto_196406 ) ) ( not ( = ?auto_196405 ?auto_196407 ) ) ( not ( = ?auto_196405 ?auto_196411 ) ) ( not ( = ?auto_196406 ?auto_196407 ) ) ( not ( = ?auto_196406 ?auto_196411 ) ) ( not ( = ?auto_196407 ?auto_196411 ) ) ( not ( = ?auto_196403 ?auto_196409 ) ) ( not ( = ?auto_196403 ?auto_196408 ) ) ( not ( = ?auto_196404 ?auto_196409 ) ) ( not ( = ?auto_196404 ?auto_196408 ) ) ( not ( = ?auto_196405 ?auto_196409 ) ) ( not ( = ?auto_196405 ?auto_196408 ) ) ( not ( = ?auto_196406 ?auto_196409 ) ) ( not ( = ?auto_196406 ?auto_196408 ) ) ( not ( = ?auto_196407 ?auto_196409 ) ) ( not ( = ?auto_196407 ?auto_196408 ) ) ( not ( = ?auto_196411 ?auto_196409 ) ) ( not ( = ?auto_196411 ?auto_196408 ) ) ( not ( = ?auto_196409 ?auto_196408 ) ) ( ON ?auto_196409 ?auto_196411 ) ( not ( = ?auto_196410 ?auto_196408 ) ) ( not ( = ?auto_196403 ?auto_196410 ) ) ( not ( = ?auto_196404 ?auto_196410 ) ) ( not ( = ?auto_196405 ?auto_196410 ) ) ( not ( = ?auto_196406 ?auto_196410 ) ) ( not ( = ?auto_196407 ?auto_196410 ) ) ( not ( = ?auto_196411 ?auto_196410 ) ) ( not ( = ?auto_196409 ?auto_196410 ) ) ( ON ?auto_196408 ?auto_196409 ) ( CLEAR ?auto_196408 ) ( HOLDING ?auto_196410 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196410 )
      ( MAKE-5PILE ?auto_196403 ?auto_196404 ?auto_196405 ?auto_196406 ?auto_196407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196412 - BLOCK
      ?auto_196413 - BLOCK
      ?auto_196414 - BLOCK
      ?auto_196415 - BLOCK
      ?auto_196416 - BLOCK
    )
    :vars
    (
      ?auto_196417 - BLOCK
      ?auto_196419 - BLOCK
      ?auto_196420 - BLOCK
      ?auto_196418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196417 ?auto_196416 ) ( ON-TABLE ?auto_196412 ) ( ON ?auto_196413 ?auto_196412 ) ( ON ?auto_196414 ?auto_196413 ) ( ON ?auto_196415 ?auto_196414 ) ( ON ?auto_196416 ?auto_196415 ) ( not ( = ?auto_196412 ?auto_196413 ) ) ( not ( = ?auto_196412 ?auto_196414 ) ) ( not ( = ?auto_196412 ?auto_196415 ) ) ( not ( = ?auto_196412 ?auto_196416 ) ) ( not ( = ?auto_196412 ?auto_196417 ) ) ( not ( = ?auto_196413 ?auto_196414 ) ) ( not ( = ?auto_196413 ?auto_196415 ) ) ( not ( = ?auto_196413 ?auto_196416 ) ) ( not ( = ?auto_196413 ?auto_196417 ) ) ( not ( = ?auto_196414 ?auto_196415 ) ) ( not ( = ?auto_196414 ?auto_196416 ) ) ( not ( = ?auto_196414 ?auto_196417 ) ) ( not ( = ?auto_196415 ?auto_196416 ) ) ( not ( = ?auto_196415 ?auto_196417 ) ) ( not ( = ?auto_196416 ?auto_196417 ) ) ( not ( = ?auto_196412 ?auto_196419 ) ) ( not ( = ?auto_196412 ?auto_196420 ) ) ( not ( = ?auto_196413 ?auto_196419 ) ) ( not ( = ?auto_196413 ?auto_196420 ) ) ( not ( = ?auto_196414 ?auto_196419 ) ) ( not ( = ?auto_196414 ?auto_196420 ) ) ( not ( = ?auto_196415 ?auto_196419 ) ) ( not ( = ?auto_196415 ?auto_196420 ) ) ( not ( = ?auto_196416 ?auto_196419 ) ) ( not ( = ?auto_196416 ?auto_196420 ) ) ( not ( = ?auto_196417 ?auto_196419 ) ) ( not ( = ?auto_196417 ?auto_196420 ) ) ( not ( = ?auto_196419 ?auto_196420 ) ) ( ON ?auto_196419 ?auto_196417 ) ( not ( = ?auto_196418 ?auto_196420 ) ) ( not ( = ?auto_196412 ?auto_196418 ) ) ( not ( = ?auto_196413 ?auto_196418 ) ) ( not ( = ?auto_196414 ?auto_196418 ) ) ( not ( = ?auto_196415 ?auto_196418 ) ) ( not ( = ?auto_196416 ?auto_196418 ) ) ( not ( = ?auto_196417 ?auto_196418 ) ) ( not ( = ?auto_196419 ?auto_196418 ) ) ( ON ?auto_196420 ?auto_196419 ) ( ON ?auto_196418 ?auto_196420 ) ( CLEAR ?auto_196418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196412 ?auto_196413 ?auto_196414 ?auto_196415 ?auto_196416 ?auto_196417 ?auto_196419 ?auto_196420 )
      ( MAKE-5PILE ?auto_196412 ?auto_196413 ?auto_196414 ?auto_196415 ?auto_196416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196425 - BLOCK
      ?auto_196426 - BLOCK
      ?auto_196427 - BLOCK
      ?auto_196428 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196428 ) ( CLEAR ?auto_196427 ) ( ON-TABLE ?auto_196425 ) ( ON ?auto_196426 ?auto_196425 ) ( ON ?auto_196427 ?auto_196426 ) ( not ( = ?auto_196425 ?auto_196426 ) ) ( not ( = ?auto_196425 ?auto_196427 ) ) ( not ( = ?auto_196425 ?auto_196428 ) ) ( not ( = ?auto_196426 ?auto_196427 ) ) ( not ( = ?auto_196426 ?auto_196428 ) ) ( not ( = ?auto_196427 ?auto_196428 ) ) )
    :subtasks
    ( ( !STACK ?auto_196428 ?auto_196427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196429 - BLOCK
      ?auto_196430 - BLOCK
      ?auto_196431 - BLOCK
      ?auto_196432 - BLOCK
    )
    :vars
    (
      ?auto_196433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196431 ) ( ON-TABLE ?auto_196429 ) ( ON ?auto_196430 ?auto_196429 ) ( ON ?auto_196431 ?auto_196430 ) ( not ( = ?auto_196429 ?auto_196430 ) ) ( not ( = ?auto_196429 ?auto_196431 ) ) ( not ( = ?auto_196429 ?auto_196432 ) ) ( not ( = ?auto_196430 ?auto_196431 ) ) ( not ( = ?auto_196430 ?auto_196432 ) ) ( not ( = ?auto_196431 ?auto_196432 ) ) ( ON ?auto_196432 ?auto_196433 ) ( CLEAR ?auto_196432 ) ( HAND-EMPTY ) ( not ( = ?auto_196429 ?auto_196433 ) ) ( not ( = ?auto_196430 ?auto_196433 ) ) ( not ( = ?auto_196431 ?auto_196433 ) ) ( not ( = ?auto_196432 ?auto_196433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196432 ?auto_196433 )
      ( MAKE-4PILE ?auto_196429 ?auto_196430 ?auto_196431 ?auto_196432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196434 - BLOCK
      ?auto_196435 - BLOCK
      ?auto_196436 - BLOCK
      ?auto_196437 - BLOCK
    )
    :vars
    (
      ?auto_196438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196434 ) ( ON ?auto_196435 ?auto_196434 ) ( not ( = ?auto_196434 ?auto_196435 ) ) ( not ( = ?auto_196434 ?auto_196436 ) ) ( not ( = ?auto_196434 ?auto_196437 ) ) ( not ( = ?auto_196435 ?auto_196436 ) ) ( not ( = ?auto_196435 ?auto_196437 ) ) ( not ( = ?auto_196436 ?auto_196437 ) ) ( ON ?auto_196437 ?auto_196438 ) ( CLEAR ?auto_196437 ) ( not ( = ?auto_196434 ?auto_196438 ) ) ( not ( = ?auto_196435 ?auto_196438 ) ) ( not ( = ?auto_196436 ?auto_196438 ) ) ( not ( = ?auto_196437 ?auto_196438 ) ) ( HOLDING ?auto_196436 ) ( CLEAR ?auto_196435 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196434 ?auto_196435 ?auto_196436 )
      ( MAKE-4PILE ?auto_196434 ?auto_196435 ?auto_196436 ?auto_196437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196439 - BLOCK
      ?auto_196440 - BLOCK
      ?auto_196441 - BLOCK
      ?auto_196442 - BLOCK
    )
    :vars
    (
      ?auto_196443 - BLOCK
      ?auto_196444 - BLOCK
      ?auto_196445 - BLOCK
      ?auto_196446 - BLOCK
      ?auto_196447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196439 ) ( ON ?auto_196440 ?auto_196439 ) ( not ( = ?auto_196439 ?auto_196440 ) ) ( not ( = ?auto_196439 ?auto_196441 ) ) ( not ( = ?auto_196439 ?auto_196442 ) ) ( not ( = ?auto_196440 ?auto_196441 ) ) ( not ( = ?auto_196440 ?auto_196442 ) ) ( not ( = ?auto_196441 ?auto_196442 ) ) ( ON ?auto_196442 ?auto_196443 ) ( not ( = ?auto_196439 ?auto_196443 ) ) ( not ( = ?auto_196440 ?auto_196443 ) ) ( not ( = ?auto_196441 ?auto_196443 ) ) ( not ( = ?auto_196442 ?auto_196443 ) ) ( CLEAR ?auto_196440 ) ( ON ?auto_196441 ?auto_196442 ) ( CLEAR ?auto_196441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196444 ) ( ON ?auto_196445 ?auto_196444 ) ( ON ?auto_196446 ?auto_196445 ) ( ON ?auto_196447 ?auto_196446 ) ( ON ?auto_196443 ?auto_196447 ) ( not ( = ?auto_196444 ?auto_196445 ) ) ( not ( = ?auto_196444 ?auto_196446 ) ) ( not ( = ?auto_196444 ?auto_196447 ) ) ( not ( = ?auto_196444 ?auto_196443 ) ) ( not ( = ?auto_196444 ?auto_196442 ) ) ( not ( = ?auto_196444 ?auto_196441 ) ) ( not ( = ?auto_196445 ?auto_196446 ) ) ( not ( = ?auto_196445 ?auto_196447 ) ) ( not ( = ?auto_196445 ?auto_196443 ) ) ( not ( = ?auto_196445 ?auto_196442 ) ) ( not ( = ?auto_196445 ?auto_196441 ) ) ( not ( = ?auto_196446 ?auto_196447 ) ) ( not ( = ?auto_196446 ?auto_196443 ) ) ( not ( = ?auto_196446 ?auto_196442 ) ) ( not ( = ?auto_196446 ?auto_196441 ) ) ( not ( = ?auto_196447 ?auto_196443 ) ) ( not ( = ?auto_196447 ?auto_196442 ) ) ( not ( = ?auto_196447 ?auto_196441 ) ) ( not ( = ?auto_196439 ?auto_196444 ) ) ( not ( = ?auto_196439 ?auto_196445 ) ) ( not ( = ?auto_196439 ?auto_196446 ) ) ( not ( = ?auto_196439 ?auto_196447 ) ) ( not ( = ?auto_196440 ?auto_196444 ) ) ( not ( = ?auto_196440 ?auto_196445 ) ) ( not ( = ?auto_196440 ?auto_196446 ) ) ( not ( = ?auto_196440 ?auto_196447 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196444 ?auto_196445 ?auto_196446 ?auto_196447 ?auto_196443 ?auto_196442 )
      ( MAKE-4PILE ?auto_196439 ?auto_196440 ?auto_196441 ?auto_196442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196448 - BLOCK
      ?auto_196449 - BLOCK
      ?auto_196450 - BLOCK
      ?auto_196451 - BLOCK
    )
    :vars
    (
      ?auto_196456 - BLOCK
      ?auto_196453 - BLOCK
      ?auto_196455 - BLOCK
      ?auto_196452 - BLOCK
      ?auto_196454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196448 ) ( not ( = ?auto_196448 ?auto_196449 ) ) ( not ( = ?auto_196448 ?auto_196450 ) ) ( not ( = ?auto_196448 ?auto_196451 ) ) ( not ( = ?auto_196449 ?auto_196450 ) ) ( not ( = ?auto_196449 ?auto_196451 ) ) ( not ( = ?auto_196450 ?auto_196451 ) ) ( ON ?auto_196451 ?auto_196456 ) ( not ( = ?auto_196448 ?auto_196456 ) ) ( not ( = ?auto_196449 ?auto_196456 ) ) ( not ( = ?auto_196450 ?auto_196456 ) ) ( not ( = ?auto_196451 ?auto_196456 ) ) ( ON ?auto_196450 ?auto_196451 ) ( CLEAR ?auto_196450 ) ( ON-TABLE ?auto_196453 ) ( ON ?auto_196455 ?auto_196453 ) ( ON ?auto_196452 ?auto_196455 ) ( ON ?auto_196454 ?auto_196452 ) ( ON ?auto_196456 ?auto_196454 ) ( not ( = ?auto_196453 ?auto_196455 ) ) ( not ( = ?auto_196453 ?auto_196452 ) ) ( not ( = ?auto_196453 ?auto_196454 ) ) ( not ( = ?auto_196453 ?auto_196456 ) ) ( not ( = ?auto_196453 ?auto_196451 ) ) ( not ( = ?auto_196453 ?auto_196450 ) ) ( not ( = ?auto_196455 ?auto_196452 ) ) ( not ( = ?auto_196455 ?auto_196454 ) ) ( not ( = ?auto_196455 ?auto_196456 ) ) ( not ( = ?auto_196455 ?auto_196451 ) ) ( not ( = ?auto_196455 ?auto_196450 ) ) ( not ( = ?auto_196452 ?auto_196454 ) ) ( not ( = ?auto_196452 ?auto_196456 ) ) ( not ( = ?auto_196452 ?auto_196451 ) ) ( not ( = ?auto_196452 ?auto_196450 ) ) ( not ( = ?auto_196454 ?auto_196456 ) ) ( not ( = ?auto_196454 ?auto_196451 ) ) ( not ( = ?auto_196454 ?auto_196450 ) ) ( not ( = ?auto_196448 ?auto_196453 ) ) ( not ( = ?auto_196448 ?auto_196455 ) ) ( not ( = ?auto_196448 ?auto_196452 ) ) ( not ( = ?auto_196448 ?auto_196454 ) ) ( not ( = ?auto_196449 ?auto_196453 ) ) ( not ( = ?auto_196449 ?auto_196455 ) ) ( not ( = ?auto_196449 ?auto_196452 ) ) ( not ( = ?auto_196449 ?auto_196454 ) ) ( HOLDING ?auto_196449 ) ( CLEAR ?auto_196448 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196448 ?auto_196449 )
      ( MAKE-4PILE ?auto_196448 ?auto_196449 ?auto_196450 ?auto_196451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196457 - BLOCK
      ?auto_196458 - BLOCK
      ?auto_196459 - BLOCK
      ?auto_196460 - BLOCK
    )
    :vars
    (
      ?auto_196462 - BLOCK
      ?auto_196465 - BLOCK
      ?auto_196461 - BLOCK
      ?auto_196463 - BLOCK
      ?auto_196464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196457 ) ( not ( = ?auto_196457 ?auto_196458 ) ) ( not ( = ?auto_196457 ?auto_196459 ) ) ( not ( = ?auto_196457 ?auto_196460 ) ) ( not ( = ?auto_196458 ?auto_196459 ) ) ( not ( = ?auto_196458 ?auto_196460 ) ) ( not ( = ?auto_196459 ?auto_196460 ) ) ( ON ?auto_196460 ?auto_196462 ) ( not ( = ?auto_196457 ?auto_196462 ) ) ( not ( = ?auto_196458 ?auto_196462 ) ) ( not ( = ?auto_196459 ?auto_196462 ) ) ( not ( = ?auto_196460 ?auto_196462 ) ) ( ON ?auto_196459 ?auto_196460 ) ( ON-TABLE ?auto_196465 ) ( ON ?auto_196461 ?auto_196465 ) ( ON ?auto_196463 ?auto_196461 ) ( ON ?auto_196464 ?auto_196463 ) ( ON ?auto_196462 ?auto_196464 ) ( not ( = ?auto_196465 ?auto_196461 ) ) ( not ( = ?auto_196465 ?auto_196463 ) ) ( not ( = ?auto_196465 ?auto_196464 ) ) ( not ( = ?auto_196465 ?auto_196462 ) ) ( not ( = ?auto_196465 ?auto_196460 ) ) ( not ( = ?auto_196465 ?auto_196459 ) ) ( not ( = ?auto_196461 ?auto_196463 ) ) ( not ( = ?auto_196461 ?auto_196464 ) ) ( not ( = ?auto_196461 ?auto_196462 ) ) ( not ( = ?auto_196461 ?auto_196460 ) ) ( not ( = ?auto_196461 ?auto_196459 ) ) ( not ( = ?auto_196463 ?auto_196464 ) ) ( not ( = ?auto_196463 ?auto_196462 ) ) ( not ( = ?auto_196463 ?auto_196460 ) ) ( not ( = ?auto_196463 ?auto_196459 ) ) ( not ( = ?auto_196464 ?auto_196462 ) ) ( not ( = ?auto_196464 ?auto_196460 ) ) ( not ( = ?auto_196464 ?auto_196459 ) ) ( not ( = ?auto_196457 ?auto_196465 ) ) ( not ( = ?auto_196457 ?auto_196461 ) ) ( not ( = ?auto_196457 ?auto_196463 ) ) ( not ( = ?auto_196457 ?auto_196464 ) ) ( not ( = ?auto_196458 ?auto_196465 ) ) ( not ( = ?auto_196458 ?auto_196461 ) ) ( not ( = ?auto_196458 ?auto_196463 ) ) ( not ( = ?auto_196458 ?auto_196464 ) ) ( CLEAR ?auto_196457 ) ( ON ?auto_196458 ?auto_196459 ) ( CLEAR ?auto_196458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196465 ?auto_196461 ?auto_196463 ?auto_196464 ?auto_196462 ?auto_196460 ?auto_196459 )
      ( MAKE-4PILE ?auto_196457 ?auto_196458 ?auto_196459 ?auto_196460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196466 - BLOCK
      ?auto_196467 - BLOCK
      ?auto_196468 - BLOCK
      ?auto_196469 - BLOCK
    )
    :vars
    (
      ?auto_196474 - BLOCK
      ?auto_196472 - BLOCK
      ?auto_196471 - BLOCK
      ?auto_196470 - BLOCK
      ?auto_196473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196466 ?auto_196467 ) ) ( not ( = ?auto_196466 ?auto_196468 ) ) ( not ( = ?auto_196466 ?auto_196469 ) ) ( not ( = ?auto_196467 ?auto_196468 ) ) ( not ( = ?auto_196467 ?auto_196469 ) ) ( not ( = ?auto_196468 ?auto_196469 ) ) ( ON ?auto_196469 ?auto_196474 ) ( not ( = ?auto_196466 ?auto_196474 ) ) ( not ( = ?auto_196467 ?auto_196474 ) ) ( not ( = ?auto_196468 ?auto_196474 ) ) ( not ( = ?auto_196469 ?auto_196474 ) ) ( ON ?auto_196468 ?auto_196469 ) ( ON-TABLE ?auto_196472 ) ( ON ?auto_196471 ?auto_196472 ) ( ON ?auto_196470 ?auto_196471 ) ( ON ?auto_196473 ?auto_196470 ) ( ON ?auto_196474 ?auto_196473 ) ( not ( = ?auto_196472 ?auto_196471 ) ) ( not ( = ?auto_196472 ?auto_196470 ) ) ( not ( = ?auto_196472 ?auto_196473 ) ) ( not ( = ?auto_196472 ?auto_196474 ) ) ( not ( = ?auto_196472 ?auto_196469 ) ) ( not ( = ?auto_196472 ?auto_196468 ) ) ( not ( = ?auto_196471 ?auto_196470 ) ) ( not ( = ?auto_196471 ?auto_196473 ) ) ( not ( = ?auto_196471 ?auto_196474 ) ) ( not ( = ?auto_196471 ?auto_196469 ) ) ( not ( = ?auto_196471 ?auto_196468 ) ) ( not ( = ?auto_196470 ?auto_196473 ) ) ( not ( = ?auto_196470 ?auto_196474 ) ) ( not ( = ?auto_196470 ?auto_196469 ) ) ( not ( = ?auto_196470 ?auto_196468 ) ) ( not ( = ?auto_196473 ?auto_196474 ) ) ( not ( = ?auto_196473 ?auto_196469 ) ) ( not ( = ?auto_196473 ?auto_196468 ) ) ( not ( = ?auto_196466 ?auto_196472 ) ) ( not ( = ?auto_196466 ?auto_196471 ) ) ( not ( = ?auto_196466 ?auto_196470 ) ) ( not ( = ?auto_196466 ?auto_196473 ) ) ( not ( = ?auto_196467 ?auto_196472 ) ) ( not ( = ?auto_196467 ?auto_196471 ) ) ( not ( = ?auto_196467 ?auto_196470 ) ) ( not ( = ?auto_196467 ?auto_196473 ) ) ( ON ?auto_196467 ?auto_196468 ) ( CLEAR ?auto_196467 ) ( HOLDING ?auto_196466 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196466 )
      ( MAKE-4PILE ?auto_196466 ?auto_196467 ?auto_196468 ?auto_196469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196475 - BLOCK
      ?auto_196476 - BLOCK
      ?auto_196477 - BLOCK
      ?auto_196478 - BLOCK
    )
    :vars
    (
      ?auto_196483 - BLOCK
      ?auto_196480 - BLOCK
      ?auto_196479 - BLOCK
      ?auto_196481 - BLOCK
      ?auto_196482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196475 ?auto_196476 ) ) ( not ( = ?auto_196475 ?auto_196477 ) ) ( not ( = ?auto_196475 ?auto_196478 ) ) ( not ( = ?auto_196476 ?auto_196477 ) ) ( not ( = ?auto_196476 ?auto_196478 ) ) ( not ( = ?auto_196477 ?auto_196478 ) ) ( ON ?auto_196478 ?auto_196483 ) ( not ( = ?auto_196475 ?auto_196483 ) ) ( not ( = ?auto_196476 ?auto_196483 ) ) ( not ( = ?auto_196477 ?auto_196483 ) ) ( not ( = ?auto_196478 ?auto_196483 ) ) ( ON ?auto_196477 ?auto_196478 ) ( ON-TABLE ?auto_196480 ) ( ON ?auto_196479 ?auto_196480 ) ( ON ?auto_196481 ?auto_196479 ) ( ON ?auto_196482 ?auto_196481 ) ( ON ?auto_196483 ?auto_196482 ) ( not ( = ?auto_196480 ?auto_196479 ) ) ( not ( = ?auto_196480 ?auto_196481 ) ) ( not ( = ?auto_196480 ?auto_196482 ) ) ( not ( = ?auto_196480 ?auto_196483 ) ) ( not ( = ?auto_196480 ?auto_196478 ) ) ( not ( = ?auto_196480 ?auto_196477 ) ) ( not ( = ?auto_196479 ?auto_196481 ) ) ( not ( = ?auto_196479 ?auto_196482 ) ) ( not ( = ?auto_196479 ?auto_196483 ) ) ( not ( = ?auto_196479 ?auto_196478 ) ) ( not ( = ?auto_196479 ?auto_196477 ) ) ( not ( = ?auto_196481 ?auto_196482 ) ) ( not ( = ?auto_196481 ?auto_196483 ) ) ( not ( = ?auto_196481 ?auto_196478 ) ) ( not ( = ?auto_196481 ?auto_196477 ) ) ( not ( = ?auto_196482 ?auto_196483 ) ) ( not ( = ?auto_196482 ?auto_196478 ) ) ( not ( = ?auto_196482 ?auto_196477 ) ) ( not ( = ?auto_196475 ?auto_196480 ) ) ( not ( = ?auto_196475 ?auto_196479 ) ) ( not ( = ?auto_196475 ?auto_196481 ) ) ( not ( = ?auto_196475 ?auto_196482 ) ) ( not ( = ?auto_196476 ?auto_196480 ) ) ( not ( = ?auto_196476 ?auto_196479 ) ) ( not ( = ?auto_196476 ?auto_196481 ) ) ( not ( = ?auto_196476 ?auto_196482 ) ) ( ON ?auto_196476 ?auto_196477 ) ( ON ?auto_196475 ?auto_196476 ) ( CLEAR ?auto_196475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196480 ?auto_196479 ?auto_196481 ?auto_196482 ?auto_196483 ?auto_196478 ?auto_196477 ?auto_196476 )
      ( MAKE-4PILE ?auto_196475 ?auto_196476 ?auto_196477 ?auto_196478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196488 - BLOCK
      ?auto_196489 - BLOCK
      ?auto_196490 - BLOCK
      ?auto_196491 - BLOCK
    )
    :vars
    (
      ?auto_196492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196492 ?auto_196491 ) ( CLEAR ?auto_196492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196488 ) ( ON ?auto_196489 ?auto_196488 ) ( ON ?auto_196490 ?auto_196489 ) ( ON ?auto_196491 ?auto_196490 ) ( not ( = ?auto_196488 ?auto_196489 ) ) ( not ( = ?auto_196488 ?auto_196490 ) ) ( not ( = ?auto_196488 ?auto_196491 ) ) ( not ( = ?auto_196488 ?auto_196492 ) ) ( not ( = ?auto_196489 ?auto_196490 ) ) ( not ( = ?auto_196489 ?auto_196491 ) ) ( not ( = ?auto_196489 ?auto_196492 ) ) ( not ( = ?auto_196490 ?auto_196491 ) ) ( not ( = ?auto_196490 ?auto_196492 ) ) ( not ( = ?auto_196491 ?auto_196492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196492 ?auto_196491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196493 - BLOCK
      ?auto_196494 - BLOCK
      ?auto_196495 - BLOCK
      ?auto_196496 - BLOCK
    )
    :vars
    (
      ?auto_196497 - BLOCK
      ?auto_196498 - BLOCK
      ?auto_196499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196497 ?auto_196496 ) ( CLEAR ?auto_196497 ) ( ON-TABLE ?auto_196493 ) ( ON ?auto_196494 ?auto_196493 ) ( ON ?auto_196495 ?auto_196494 ) ( ON ?auto_196496 ?auto_196495 ) ( not ( = ?auto_196493 ?auto_196494 ) ) ( not ( = ?auto_196493 ?auto_196495 ) ) ( not ( = ?auto_196493 ?auto_196496 ) ) ( not ( = ?auto_196493 ?auto_196497 ) ) ( not ( = ?auto_196494 ?auto_196495 ) ) ( not ( = ?auto_196494 ?auto_196496 ) ) ( not ( = ?auto_196494 ?auto_196497 ) ) ( not ( = ?auto_196495 ?auto_196496 ) ) ( not ( = ?auto_196495 ?auto_196497 ) ) ( not ( = ?auto_196496 ?auto_196497 ) ) ( HOLDING ?auto_196498 ) ( CLEAR ?auto_196499 ) ( not ( = ?auto_196493 ?auto_196498 ) ) ( not ( = ?auto_196493 ?auto_196499 ) ) ( not ( = ?auto_196494 ?auto_196498 ) ) ( not ( = ?auto_196494 ?auto_196499 ) ) ( not ( = ?auto_196495 ?auto_196498 ) ) ( not ( = ?auto_196495 ?auto_196499 ) ) ( not ( = ?auto_196496 ?auto_196498 ) ) ( not ( = ?auto_196496 ?auto_196499 ) ) ( not ( = ?auto_196497 ?auto_196498 ) ) ( not ( = ?auto_196497 ?auto_196499 ) ) ( not ( = ?auto_196498 ?auto_196499 ) ) )
    :subtasks
    ( ( !STACK ?auto_196498 ?auto_196499 )
      ( MAKE-4PILE ?auto_196493 ?auto_196494 ?auto_196495 ?auto_196496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196500 - BLOCK
      ?auto_196501 - BLOCK
      ?auto_196502 - BLOCK
      ?auto_196503 - BLOCK
    )
    :vars
    (
      ?auto_196504 - BLOCK
      ?auto_196505 - BLOCK
      ?auto_196506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196504 ?auto_196503 ) ( ON-TABLE ?auto_196500 ) ( ON ?auto_196501 ?auto_196500 ) ( ON ?auto_196502 ?auto_196501 ) ( ON ?auto_196503 ?auto_196502 ) ( not ( = ?auto_196500 ?auto_196501 ) ) ( not ( = ?auto_196500 ?auto_196502 ) ) ( not ( = ?auto_196500 ?auto_196503 ) ) ( not ( = ?auto_196500 ?auto_196504 ) ) ( not ( = ?auto_196501 ?auto_196502 ) ) ( not ( = ?auto_196501 ?auto_196503 ) ) ( not ( = ?auto_196501 ?auto_196504 ) ) ( not ( = ?auto_196502 ?auto_196503 ) ) ( not ( = ?auto_196502 ?auto_196504 ) ) ( not ( = ?auto_196503 ?auto_196504 ) ) ( CLEAR ?auto_196505 ) ( not ( = ?auto_196500 ?auto_196506 ) ) ( not ( = ?auto_196500 ?auto_196505 ) ) ( not ( = ?auto_196501 ?auto_196506 ) ) ( not ( = ?auto_196501 ?auto_196505 ) ) ( not ( = ?auto_196502 ?auto_196506 ) ) ( not ( = ?auto_196502 ?auto_196505 ) ) ( not ( = ?auto_196503 ?auto_196506 ) ) ( not ( = ?auto_196503 ?auto_196505 ) ) ( not ( = ?auto_196504 ?auto_196506 ) ) ( not ( = ?auto_196504 ?auto_196505 ) ) ( not ( = ?auto_196506 ?auto_196505 ) ) ( ON ?auto_196506 ?auto_196504 ) ( CLEAR ?auto_196506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196500 ?auto_196501 ?auto_196502 ?auto_196503 ?auto_196504 )
      ( MAKE-4PILE ?auto_196500 ?auto_196501 ?auto_196502 ?auto_196503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196507 - BLOCK
      ?auto_196508 - BLOCK
      ?auto_196509 - BLOCK
      ?auto_196510 - BLOCK
    )
    :vars
    (
      ?auto_196513 - BLOCK
      ?auto_196511 - BLOCK
      ?auto_196512 - BLOCK
      ?auto_196515 - BLOCK
      ?auto_196514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196513 ?auto_196510 ) ( ON-TABLE ?auto_196507 ) ( ON ?auto_196508 ?auto_196507 ) ( ON ?auto_196509 ?auto_196508 ) ( ON ?auto_196510 ?auto_196509 ) ( not ( = ?auto_196507 ?auto_196508 ) ) ( not ( = ?auto_196507 ?auto_196509 ) ) ( not ( = ?auto_196507 ?auto_196510 ) ) ( not ( = ?auto_196507 ?auto_196513 ) ) ( not ( = ?auto_196508 ?auto_196509 ) ) ( not ( = ?auto_196508 ?auto_196510 ) ) ( not ( = ?auto_196508 ?auto_196513 ) ) ( not ( = ?auto_196509 ?auto_196510 ) ) ( not ( = ?auto_196509 ?auto_196513 ) ) ( not ( = ?auto_196510 ?auto_196513 ) ) ( not ( = ?auto_196507 ?auto_196511 ) ) ( not ( = ?auto_196507 ?auto_196512 ) ) ( not ( = ?auto_196508 ?auto_196511 ) ) ( not ( = ?auto_196508 ?auto_196512 ) ) ( not ( = ?auto_196509 ?auto_196511 ) ) ( not ( = ?auto_196509 ?auto_196512 ) ) ( not ( = ?auto_196510 ?auto_196511 ) ) ( not ( = ?auto_196510 ?auto_196512 ) ) ( not ( = ?auto_196513 ?auto_196511 ) ) ( not ( = ?auto_196513 ?auto_196512 ) ) ( not ( = ?auto_196511 ?auto_196512 ) ) ( ON ?auto_196511 ?auto_196513 ) ( CLEAR ?auto_196511 ) ( HOLDING ?auto_196512 ) ( CLEAR ?auto_196515 ) ( ON-TABLE ?auto_196514 ) ( ON ?auto_196515 ?auto_196514 ) ( not ( = ?auto_196514 ?auto_196515 ) ) ( not ( = ?auto_196514 ?auto_196512 ) ) ( not ( = ?auto_196515 ?auto_196512 ) ) ( not ( = ?auto_196507 ?auto_196515 ) ) ( not ( = ?auto_196507 ?auto_196514 ) ) ( not ( = ?auto_196508 ?auto_196515 ) ) ( not ( = ?auto_196508 ?auto_196514 ) ) ( not ( = ?auto_196509 ?auto_196515 ) ) ( not ( = ?auto_196509 ?auto_196514 ) ) ( not ( = ?auto_196510 ?auto_196515 ) ) ( not ( = ?auto_196510 ?auto_196514 ) ) ( not ( = ?auto_196513 ?auto_196515 ) ) ( not ( = ?auto_196513 ?auto_196514 ) ) ( not ( = ?auto_196511 ?auto_196515 ) ) ( not ( = ?auto_196511 ?auto_196514 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196514 ?auto_196515 ?auto_196512 )
      ( MAKE-4PILE ?auto_196507 ?auto_196508 ?auto_196509 ?auto_196510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196516 - BLOCK
      ?auto_196517 - BLOCK
      ?auto_196518 - BLOCK
      ?auto_196519 - BLOCK
    )
    :vars
    (
      ?auto_196524 - BLOCK
      ?auto_196521 - BLOCK
      ?auto_196522 - BLOCK
      ?auto_196520 - BLOCK
      ?auto_196523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196524 ?auto_196519 ) ( ON-TABLE ?auto_196516 ) ( ON ?auto_196517 ?auto_196516 ) ( ON ?auto_196518 ?auto_196517 ) ( ON ?auto_196519 ?auto_196518 ) ( not ( = ?auto_196516 ?auto_196517 ) ) ( not ( = ?auto_196516 ?auto_196518 ) ) ( not ( = ?auto_196516 ?auto_196519 ) ) ( not ( = ?auto_196516 ?auto_196524 ) ) ( not ( = ?auto_196517 ?auto_196518 ) ) ( not ( = ?auto_196517 ?auto_196519 ) ) ( not ( = ?auto_196517 ?auto_196524 ) ) ( not ( = ?auto_196518 ?auto_196519 ) ) ( not ( = ?auto_196518 ?auto_196524 ) ) ( not ( = ?auto_196519 ?auto_196524 ) ) ( not ( = ?auto_196516 ?auto_196521 ) ) ( not ( = ?auto_196516 ?auto_196522 ) ) ( not ( = ?auto_196517 ?auto_196521 ) ) ( not ( = ?auto_196517 ?auto_196522 ) ) ( not ( = ?auto_196518 ?auto_196521 ) ) ( not ( = ?auto_196518 ?auto_196522 ) ) ( not ( = ?auto_196519 ?auto_196521 ) ) ( not ( = ?auto_196519 ?auto_196522 ) ) ( not ( = ?auto_196524 ?auto_196521 ) ) ( not ( = ?auto_196524 ?auto_196522 ) ) ( not ( = ?auto_196521 ?auto_196522 ) ) ( ON ?auto_196521 ?auto_196524 ) ( CLEAR ?auto_196520 ) ( ON-TABLE ?auto_196523 ) ( ON ?auto_196520 ?auto_196523 ) ( not ( = ?auto_196523 ?auto_196520 ) ) ( not ( = ?auto_196523 ?auto_196522 ) ) ( not ( = ?auto_196520 ?auto_196522 ) ) ( not ( = ?auto_196516 ?auto_196520 ) ) ( not ( = ?auto_196516 ?auto_196523 ) ) ( not ( = ?auto_196517 ?auto_196520 ) ) ( not ( = ?auto_196517 ?auto_196523 ) ) ( not ( = ?auto_196518 ?auto_196520 ) ) ( not ( = ?auto_196518 ?auto_196523 ) ) ( not ( = ?auto_196519 ?auto_196520 ) ) ( not ( = ?auto_196519 ?auto_196523 ) ) ( not ( = ?auto_196524 ?auto_196520 ) ) ( not ( = ?auto_196524 ?auto_196523 ) ) ( not ( = ?auto_196521 ?auto_196520 ) ) ( not ( = ?auto_196521 ?auto_196523 ) ) ( ON ?auto_196522 ?auto_196521 ) ( CLEAR ?auto_196522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196516 ?auto_196517 ?auto_196518 ?auto_196519 ?auto_196524 ?auto_196521 )
      ( MAKE-4PILE ?auto_196516 ?auto_196517 ?auto_196518 ?auto_196519 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196525 - BLOCK
      ?auto_196526 - BLOCK
      ?auto_196527 - BLOCK
      ?auto_196528 - BLOCK
    )
    :vars
    (
      ?auto_196532 - BLOCK
      ?auto_196529 - BLOCK
      ?auto_196531 - BLOCK
      ?auto_196530 - BLOCK
      ?auto_196533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196532 ?auto_196528 ) ( ON-TABLE ?auto_196525 ) ( ON ?auto_196526 ?auto_196525 ) ( ON ?auto_196527 ?auto_196526 ) ( ON ?auto_196528 ?auto_196527 ) ( not ( = ?auto_196525 ?auto_196526 ) ) ( not ( = ?auto_196525 ?auto_196527 ) ) ( not ( = ?auto_196525 ?auto_196528 ) ) ( not ( = ?auto_196525 ?auto_196532 ) ) ( not ( = ?auto_196526 ?auto_196527 ) ) ( not ( = ?auto_196526 ?auto_196528 ) ) ( not ( = ?auto_196526 ?auto_196532 ) ) ( not ( = ?auto_196527 ?auto_196528 ) ) ( not ( = ?auto_196527 ?auto_196532 ) ) ( not ( = ?auto_196528 ?auto_196532 ) ) ( not ( = ?auto_196525 ?auto_196529 ) ) ( not ( = ?auto_196525 ?auto_196531 ) ) ( not ( = ?auto_196526 ?auto_196529 ) ) ( not ( = ?auto_196526 ?auto_196531 ) ) ( not ( = ?auto_196527 ?auto_196529 ) ) ( not ( = ?auto_196527 ?auto_196531 ) ) ( not ( = ?auto_196528 ?auto_196529 ) ) ( not ( = ?auto_196528 ?auto_196531 ) ) ( not ( = ?auto_196532 ?auto_196529 ) ) ( not ( = ?auto_196532 ?auto_196531 ) ) ( not ( = ?auto_196529 ?auto_196531 ) ) ( ON ?auto_196529 ?auto_196532 ) ( ON-TABLE ?auto_196530 ) ( not ( = ?auto_196530 ?auto_196533 ) ) ( not ( = ?auto_196530 ?auto_196531 ) ) ( not ( = ?auto_196533 ?auto_196531 ) ) ( not ( = ?auto_196525 ?auto_196533 ) ) ( not ( = ?auto_196525 ?auto_196530 ) ) ( not ( = ?auto_196526 ?auto_196533 ) ) ( not ( = ?auto_196526 ?auto_196530 ) ) ( not ( = ?auto_196527 ?auto_196533 ) ) ( not ( = ?auto_196527 ?auto_196530 ) ) ( not ( = ?auto_196528 ?auto_196533 ) ) ( not ( = ?auto_196528 ?auto_196530 ) ) ( not ( = ?auto_196532 ?auto_196533 ) ) ( not ( = ?auto_196532 ?auto_196530 ) ) ( not ( = ?auto_196529 ?auto_196533 ) ) ( not ( = ?auto_196529 ?auto_196530 ) ) ( ON ?auto_196531 ?auto_196529 ) ( CLEAR ?auto_196531 ) ( HOLDING ?auto_196533 ) ( CLEAR ?auto_196530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196530 ?auto_196533 )
      ( MAKE-4PILE ?auto_196525 ?auto_196526 ?auto_196527 ?auto_196528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196534 - BLOCK
      ?auto_196535 - BLOCK
      ?auto_196536 - BLOCK
      ?auto_196537 - BLOCK
    )
    :vars
    (
      ?auto_196538 - BLOCK
      ?auto_196539 - BLOCK
      ?auto_196541 - BLOCK
      ?auto_196540 - BLOCK
      ?auto_196542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196538 ?auto_196537 ) ( ON-TABLE ?auto_196534 ) ( ON ?auto_196535 ?auto_196534 ) ( ON ?auto_196536 ?auto_196535 ) ( ON ?auto_196537 ?auto_196536 ) ( not ( = ?auto_196534 ?auto_196535 ) ) ( not ( = ?auto_196534 ?auto_196536 ) ) ( not ( = ?auto_196534 ?auto_196537 ) ) ( not ( = ?auto_196534 ?auto_196538 ) ) ( not ( = ?auto_196535 ?auto_196536 ) ) ( not ( = ?auto_196535 ?auto_196537 ) ) ( not ( = ?auto_196535 ?auto_196538 ) ) ( not ( = ?auto_196536 ?auto_196537 ) ) ( not ( = ?auto_196536 ?auto_196538 ) ) ( not ( = ?auto_196537 ?auto_196538 ) ) ( not ( = ?auto_196534 ?auto_196539 ) ) ( not ( = ?auto_196534 ?auto_196541 ) ) ( not ( = ?auto_196535 ?auto_196539 ) ) ( not ( = ?auto_196535 ?auto_196541 ) ) ( not ( = ?auto_196536 ?auto_196539 ) ) ( not ( = ?auto_196536 ?auto_196541 ) ) ( not ( = ?auto_196537 ?auto_196539 ) ) ( not ( = ?auto_196537 ?auto_196541 ) ) ( not ( = ?auto_196538 ?auto_196539 ) ) ( not ( = ?auto_196538 ?auto_196541 ) ) ( not ( = ?auto_196539 ?auto_196541 ) ) ( ON ?auto_196539 ?auto_196538 ) ( ON-TABLE ?auto_196540 ) ( not ( = ?auto_196540 ?auto_196542 ) ) ( not ( = ?auto_196540 ?auto_196541 ) ) ( not ( = ?auto_196542 ?auto_196541 ) ) ( not ( = ?auto_196534 ?auto_196542 ) ) ( not ( = ?auto_196534 ?auto_196540 ) ) ( not ( = ?auto_196535 ?auto_196542 ) ) ( not ( = ?auto_196535 ?auto_196540 ) ) ( not ( = ?auto_196536 ?auto_196542 ) ) ( not ( = ?auto_196536 ?auto_196540 ) ) ( not ( = ?auto_196537 ?auto_196542 ) ) ( not ( = ?auto_196537 ?auto_196540 ) ) ( not ( = ?auto_196538 ?auto_196542 ) ) ( not ( = ?auto_196538 ?auto_196540 ) ) ( not ( = ?auto_196539 ?auto_196542 ) ) ( not ( = ?auto_196539 ?auto_196540 ) ) ( ON ?auto_196541 ?auto_196539 ) ( CLEAR ?auto_196540 ) ( ON ?auto_196542 ?auto_196541 ) ( CLEAR ?auto_196542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196534 ?auto_196535 ?auto_196536 ?auto_196537 ?auto_196538 ?auto_196539 ?auto_196541 )
      ( MAKE-4PILE ?auto_196534 ?auto_196535 ?auto_196536 ?auto_196537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196543 - BLOCK
      ?auto_196544 - BLOCK
      ?auto_196545 - BLOCK
      ?auto_196546 - BLOCK
    )
    :vars
    (
      ?auto_196547 - BLOCK
      ?auto_196548 - BLOCK
      ?auto_196549 - BLOCK
      ?auto_196550 - BLOCK
      ?auto_196551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196547 ?auto_196546 ) ( ON-TABLE ?auto_196543 ) ( ON ?auto_196544 ?auto_196543 ) ( ON ?auto_196545 ?auto_196544 ) ( ON ?auto_196546 ?auto_196545 ) ( not ( = ?auto_196543 ?auto_196544 ) ) ( not ( = ?auto_196543 ?auto_196545 ) ) ( not ( = ?auto_196543 ?auto_196546 ) ) ( not ( = ?auto_196543 ?auto_196547 ) ) ( not ( = ?auto_196544 ?auto_196545 ) ) ( not ( = ?auto_196544 ?auto_196546 ) ) ( not ( = ?auto_196544 ?auto_196547 ) ) ( not ( = ?auto_196545 ?auto_196546 ) ) ( not ( = ?auto_196545 ?auto_196547 ) ) ( not ( = ?auto_196546 ?auto_196547 ) ) ( not ( = ?auto_196543 ?auto_196548 ) ) ( not ( = ?auto_196543 ?auto_196549 ) ) ( not ( = ?auto_196544 ?auto_196548 ) ) ( not ( = ?auto_196544 ?auto_196549 ) ) ( not ( = ?auto_196545 ?auto_196548 ) ) ( not ( = ?auto_196545 ?auto_196549 ) ) ( not ( = ?auto_196546 ?auto_196548 ) ) ( not ( = ?auto_196546 ?auto_196549 ) ) ( not ( = ?auto_196547 ?auto_196548 ) ) ( not ( = ?auto_196547 ?auto_196549 ) ) ( not ( = ?auto_196548 ?auto_196549 ) ) ( ON ?auto_196548 ?auto_196547 ) ( not ( = ?auto_196550 ?auto_196551 ) ) ( not ( = ?auto_196550 ?auto_196549 ) ) ( not ( = ?auto_196551 ?auto_196549 ) ) ( not ( = ?auto_196543 ?auto_196551 ) ) ( not ( = ?auto_196543 ?auto_196550 ) ) ( not ( = ?auto_196544 ?auto_196551 ) ) ( not ( = ?auto_196544 ?auto_196550 ) ) ( not ( = ?auto_196545 ?auto_196551 ) ) ( not ( = ?auto_196545 ?auto_196550 ) ) ( not ( = ?auto_196546 ?auto_196551 ) ) ( not ( = ?auto_196546 ?auto_196550 ) ) ( not ( = ?auto_196547 ?auto_196551 ) ) ( not ( = ?auto_196547 ?auto_196550 ) ) ( not ( = ?auto_196548 ?auto_196551 ) ) ( not ( = ?auto_196548 ?auto_196550 ) ) ( ON ?auto_196549 ?auto_196548 ) ( ON ?auto_196551 ?auto_196549 ) ( CLEAR ?auto_196551 ) ( HOLDING ?auto_196550 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196550 )
      ( MAKE-4PILE ?auto_196543 ?auto_196544 ?auto_196545 ?auto_196546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_196552 - BLOCK
      ?auto_196553 - BLOCK
      ?auto_196554 - BLOCK
      ?auto_196555 - BLOCK
    )
    :vars
    (
      ?auto_196558 - BLOCK
      ?auto_196559 - BLOCK
      ?auto_196556 - BLOCK
      ?auto_196560 - BLOCK
      ?auto_196557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196558 ?auto_196555 ) ( ON-TABLE ?auto_196552 ) ( ON ?auto_196553 ?auto_196552 ) ( ON ?auto_196554 ?auto_196553 ) ( ON ?auto_196555 ?auto_196554 ) ( not ( = ?auto_196552 ?auto_196553 ) ) ( not ( = ?auto_196552 ?auto_196554 ) ) ( not ( = ?auto_196552 ?auto_196555 ) ) ( not ( = ?auto_196552 ?auto_196558 ) ) ( not ( = ?auto_196553 ?auto_196554 ) ) ( not ( = ?auto_196553 ?auto_196555 ) ) ( not ( = ?auto_196553 ?auto_196558 ) ) ( not ( = ?auto_196554 ?auto_196555 ) ) ( not ( = ?auto_196554 ?auto_196558 ) ) ( not ( = ?auto_196555 ?auto_196558 ) ) ( not ( = ?auto_196552 ?auto_196559 ) ) ( not ( = ?auto_196552 ?auto_196556 ) ) ( not ( = ?auto_196553 ?auto_196559 ) ) ( not ( = ?auto_196553 ?auto_196556 ) ) ( not ( = ?auto_196554 ?auto_196559 ) ) ( not ( = ?auto_196554 ?auto_196556 ) ) ( not ( = ?auto_196555 ?auto_196559 ) ) ( not ( = ?auto_196555 ?auto_196556 ) ) ( not ( = ?auto_196558 ?auto_196559 ) ) ( not ( = ?auto_196558 ?auto_196556 ) ) ( not ( = ?auto_196559 ?auto_196556 ) ) ( ON ?auto_196559 ?auto_196558 ) ( not ( = ?auto_196560 ?auto_196557 ) ) ( not ( = ?auto_196560 ?auto_196556 ) ) ( not ( = ?auto_196557 ?auto_196556 ) ) ( not ( = ?auto_196552 ?auto_196557 ) ) ( not ( = ?auto_196552 ?auto_196560 ) ) ( not ( = ?auto_196553 ?auto_196557 ) ) ( not ( = ?auto_196553 ?auto_196560 ) ) ( not ( = ?auto_196554 ?auto_196557 ) ) ( not ( = ?auto_196554 ?auto_196560 ) ) ( not ( = ?auto_196555 ?auto_196557 ) ) ( not ( = ?auto_196555 ?auto_196560 ) ) ( not ( = ?auto_196558 ?auto_196557 ) ) ( not ( = ?auto_196558 ?auto_196560 ) ) ( not ( = ?auto_196559 ?auto_196557 ) ) ( not ( = ?auto_196559 ?auto_196560 ) ) ( ON ?auto_196556 ?auto_196559 ) ( ON ?auto_196557 ?auto_196556 ) ( ON ?auto_196560 ?auto_196557 ) ( CLEAR ?auto_196560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196552 ?auto_196553 ?auto_196554 ?auto_196555 ?auto_196558 ?auto_196559 ?auto_196556 ?auto_196557 )
      ( MAKE-4PILE ?auto_196552 ?auto_196553 ?auto_196554 ?auto_196555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196566 - BLOCK
      ?auto_196567 - BLOCK
      ?auto_196568 - BLOCK
      ?auto_196569 - BLOCK
      ?auto_196570 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196570 ) ( CLEAR ?auto_196569 ) ( ON-TABLE ?auto_196566 ) ( ON ?auto_196567 ?auto_196566 ) ( ON ?auto_196568 ?auto_196567 ) ( ON ?auto_196569 ?auto_196568 ) ( not ( = ?auto_196566 ?auto_196567 ) ) ( not ( = ?auto_196566 ?auto_196568 ) ) ( not ( = ?auto_196566 ?auto_196569 ) ) ( not ( = ?auto_196566 ?auto_196570 ) ) ( not ( = ?auto_196567 ?auto_196568 ) ) ( not ( = ?auto_196567 ?auto_196569 ) ) ( not ( = ?auto_196567 ?auto_196570 ) ) ( not ( = ?auto_196568 ?auto_196569 ) ) ( not ( = ?auto_196568 ?auto_196570 ) ) ( not ( = ?auto_196569 ?auto_196570 ) ) )
    :subtasks
    ( ( !STACK ?auto_196570 ?auto_196569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196571 - BLOCK
      ?auto_196572 - BLOCK
      ?auto_196573 - BLOCK
      ?auto_196574 - BLOCK
      ?auto_196575 - BLOCK
    )
    :vars
    (
      ?auto_196576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196574 ) ( ON-TABLE ?auto_196571 ) ( ON ?auto_196572 ?auto_196571 ) ( ON ?auto_196573 ?auto_196572 ) ( ON ?auto_196574 ?auto_196573 ) ( not ( = ?auto_196571 ?auto_196572 ) ) ( not ( = ?auto_196571 ?auto_196573 ) ) ( not ( = ?auto_196571 ?auto_196574 ) ) ( not ( = ?auto_196571 ?auto_196575 ) ) ( not ( = ?auto_196572 ?auto_196573 ) ) ( not ( = ?auto_196572 ?auto_196574 ) ) ( not ( = ?auto_196572 ?auto_196575 ) ) ( not ( = ?auto_196573 ?auto_196574 ) ) ( not ( = ?auto_196573 ?auto_196575 ) ) ( not ( = ?auto_196574 ?auto_196575 ) ) ( ON ?auto_196575 ?auto_196576 ) ( CLEAR ?auto_196575 ) ( HAND-EMPTY ) ( not ( = ?auto_196571 ?auto_196576 ) ) ( not ( = ?auto_196572 ?auto_196576 ) ) ( not ( = ?auto_196573 ?auto_196576 ) ) ( not ( = ?auto_196574 ?auto_196576 ) ) ( not ( = ?auto_196575 ?auto_196576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196575 ?auto_196576 )
      ( MAKE-5PILE ?auto_196571 ?auto_196572 ?auto_196573 ?auto_196574 ?auto_196575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196577 - BLOCK
      ?auto_196578 - BLOCK
      ?auto_196579 - BLOCK
      ?auto_196580 - BLOCK
      ?auto_196581 - BLOCK
    )
    :vars
    (
      ?auto_196582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196577 ) ( ON ?auto_196578 ?auto_196577 ) ( ON ?auto_196579 ?auto_196578 ) ( not ( = ?auto_196577 ?auto_196578 ) ) ( not ( = ?auto_196577 ?auto_196579 ) ) ( not ( = ?auto_196577 ?auto_196580 ) ) ( not ( = ?auto_196577 ?auto_196581 ) ) ( not ( = ?auto_196578 ?auto_196579 ) ) ( not ( = ?auto_196578 ?auto_196580 ) ) ( not ( = ?auto_196578 ?auto_196581 ) ) ( not ( = ?auto_196579 ?auto_196580 ) ) ( not ( = ?auto_196579 ?auto_196581 ) ) ( not ( = ?auto_196580 ?auto_196581 ) ) ( ON ?auto_196581 ?auto_196582 ) ( CLEAR ?auto_196581 ) ( not ( = ?auto_196577 ?auto_196582 ) ) ( not ( = ?auto_196578 ?auto_196582 ) ) ( not ( = ?auto_196579 ?auto_196582 ) ) ( not ( = ?auto_196580 ?auto_196582 ) ) ( not ( = ?auto_196581 ?auto_196582 ) ) ( HOLDING ?auto_196580 ) ( CLEAR ?auto_196579 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196577 ?auto_196578 ?auto_196579 ?auto_196580 )
      ( MAKE-5PILE ?auto_196577 ?auto_196578 ?auto_196579 ?auto_196580 ?auto_196581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196583 - BLOCK
      ?auto_196584 - BLOCK
      ?auto_196585 - BLOCK
      ?auto_196586 - BLOCK
      ?auto_196587 - BLOCK
    )
    :vars
    (
      ?auto_196588 - BLOCK
      ?auto_196589 - BLOCK
      ?auto_196591 - BLOCK
      ?auto_196590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196583 ) ( ON ?auto_196584 ?auto_196583 ) ( ON ?auto_196585 ?auto_196584 ) ( not ( = ?auto_196583 ?auto_196584 ) ) ( not ( = ?auto_196583 ?auto_196585 ) ) ( not ( = ?auto_196583 ?auto_196586 ) ) ( not ( = ?auto_196583 ?auto_196587 ) ) ( not ( = ?auto_196584 ?auto_196585 ) ) ( not ( = ?auto_196584 ?auto_196586 ) ) ( not ( = ?auto_196584 ?auto_196587 ) ) ( not ( = ?auto_196585 ?auto_196586 ) ) ( not ( = ?auto_196585 ?auto_196587 ) ) ( not ( = ?auto_196586 ?auto_196587 ) ) ( ON ?auto_196587 ?auto_196588 ) ( not ( = ?auto_196583 ?auto_196588 ) ) ( not ( = ?auto_196584 ?auto_196588 ) ) ( not ( = ?auto_196585 ?auto_196588 ) ) ( not ( = ?auto_196586 ?auto_196588 ) ) ( not ( = ?auto_196587 ?auto_196588 ) ) ( CLEAR ?auto_196585 ) ( ON ?auto_196586 ?auto_196587 ) ( CLEAR ?auto_196586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196589 ) ( ON ?auto_196591 ?auto_196589 ) ( ON ?auto_196590 ?auto_196591 ) ( ON ?auto_196588 ?auto_196590 ) ( not ( = ?auto_196589 ?auto_196591 ) ) ( not ( = ?auto_196589 ?auto_196590 ) ) ( not ( = ?auto_196589 ?auto_196588 ) ) ( not ( = ?auto_196589 ?auto_196587 ) ) ( not ( = ?auto_196589 ?auto_196586 ) ) ( not ( = ?auto_196591 ?auto_196590 ) ) ( not ( = ?auto_196591 ?auto_196588 ) ) ( not ( = ?auto_196591 ?auto_196587 ) ) ( not ( = ?auto_196591 ?auto_196586 ) ) ( not ( = ?auto_196590 ?auto_196588 ) ) ( not ( = ?auto_196590 ?auto_196587 ) ) ( not ( = ?auto_196590 ?auto_196586 ) ) ( not ( = ?auto_196583 ?auto_196589 ) ) ( not ( = ?auto_196583 ?auto_196591 ) ) ( not ( = ?auto_196583 ?auto_196590 ) ) ( not ( = ?auto_196584 ?auto_196589 ) ) ( not ( = ?auto_196584 ?auto_196591 ) ) ( not ( = ?auto_196584 ?auto_196590 ) ) ( not ( = ?auto_196585 ?auto_196589 ) ) ( not ( = ?auto_196585 ?auto_196591 ) ) ( not ( = ?auto_196585 ?auto_196590 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196589 ?auto_196591 ?auto_196590 ?auto_196588 ?auto_196587 )
      ( MAKE-5PILE ?auto_196583 ?auto_196584 ?auto_196585 ?auto_196586 ?auto_196587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196592 - BLOCK
      ?auto_196593 - BLOCK
      ?auto_196594 - BLOCK
      ?auto_196595 - BLOCK
      ?auto_196596 - BLOCK
    )
    :vars
    (
      ?auto_196600 - BLOCK
      ?auto_196598 - BLOCK
      ?auto_196597 - BLOCK
      ?auto_196599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196592 ) ( ON ?auto_196593 ?auto_196592 ) ( not ( = ?auto_196592 ?auto_196593 ) ) ( not ( = ?auto_196592 ?auto_196594 ) ) ( not ( = ?auto_196592 ?auto_196595 ) ) ( not ( = ?auto_196592 ?auto_196596 ) ) ( not ( = ?auto_196593 ?auto_196594 ) ) ( not ( = ?auto_196593 ?auto_196595 ) ) ( not ( = ?auto_196593 ?auto_196596 ) ) ( not ( = ?auto_196594 ?auto_196595 ) ) ( not ( = ?auto_196594 ?auto_196596 ) ) ( not ( = ?auto_196595 ?auto_196596 ) ) ( ON ?auto_196596 ?auto_196600 ) ( not ( = ?auto_196592 ?auto_196600 ) ) ( not ( = ?auto_196593 ?auto_196600 ) ) ( not ( = ?auto_196594 ?auto_196600 ) ) ( not ( = ?auto_196595 ?auto_196600 ) ) ( not ( = ?auto_196596 ?auto_196600 ) ) ( ON ?auto_196595 ?auto_196596 ) ( CLEAR ?auto_196595 ) ( ON-TABLE ?auto_196598 ) ( ON ?auto_196597 ?auto_196598 ) ( ON ?auto_196599 ?auto_196597 ) ( ON ?auto_196600 ?auto_196599 ) ( not ( = ?auto_196598 ?auto_196597 ) ) ( not ( = ?auto_196598 ?auto_196599 ) ) ( not ( = ?auto_196598 ?auto_196600 ) ) ( not ( = ?auto_196598 ?auto_196596 ) ) ( not ( = ?auto_196598 ?auto_196595 ) ) ( not ( = ?auto_196597 ?auto_196599 ) ) ( not ( = ?auto_196597 ?auto_196600 ) ) ( not ( = ?auto_196597 ?auto_196596 ) ) ( not ( = ?auto_196597 ?auto_196595 ) ) ( not ( = ?auto_196599 ?auto_196600 ) ) ( not ( = ?auto_196599 ?auto_196596 ) ) ( not ( = ?auto_196599 ?auto_196595 ) ) ( not ( = ?auto_196592 ?auto_196598 ) ) ( not ( = ?auto_196592 ?auto_196597 ) ) ( not ( = ?auto_196592 ?auto_196599 ) ) ( not ( = ?auto_196593 ?auto_196598 ) ) ( not ( = ?auto_196593 ?auto_196597 ) ) ( not ( = ?auto_196593 ?auto_196599 ) ) ( not ( = ?auto_196594 ?auto_196598 ) ) ( not ( = ?auto_196594 ?auto_196597 ) ) ( not ( = ?auto_196594 ?auto_196599 ) ) ( HOLDING ?auto_196594 ) ( CLEAR ?auto_196593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196592 ?auto_196593 ?auto_196594 )
      ( MAKE-5PILE ?auto_196592 ?auto_196593 ?auto_196594 ?auto_196595 ?auto_196596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196601 - BLOCK
      ?auto_196602 - BLOCK
      ?auto_196603 - BLOCK
      ?auto_196604 - BLOCK
      ?auto_196605 - BLOCK
    )
    :vars
    (
      ?auto_196608 - BLOCK
      ?auto_196609 - BLOCK
      ?auto_196607 - BLOCK
      ?auto_196606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196601 ) ( ON ?auto_196602 ?auto_196601 ) ( not ( = ?auto_196601 ?auto_196602 ) ) ( not ( = ?auto_196601 ?auto_196603 ) ) ( not ( = ?auto_196601 ?auto_196604 ) ) ( not ( = ?auto_196601 ?auto_196605 ) ) ( not ( = ?auto_196602 ?auto_196603 ) ) ( not ( = ?auto_196602 ?auto_196604 ) ) ( not ( = ?auto_196602 ?auto_196605 ) ) ( not ( = ?auto_196603 ?auto_196604 ) ) ( not ( = ?auto_196603 ?auto_196605 ) ) ( not ( = ?auto_196604 ?auto_196605 ) ) ( ON ?auto_196605 ?auto_196608 ) ( not ( = ?auto_196601 ?auto_196608 ) ) ( not ( = ?auto_196602 ?auto_196608 ) ) ( not ( = ?auto_196603 ?auto_196608 ) ) ( not ( = ?auto_196604 ?auto_196608 ) ) ( not ( = ?auto_196605 ?auto_196608 ) ) ( ON ?auto_196604 ?auto_196605 ) ( ON-TABLE ?auto_196609 ) ( ON ?auto_196607 ?auto_196609 ) ( ON ?auto_196606 ?auto_196607 ) ( ON ?auto_196608 ?auto_196606 ) ( not ( = ?auto_196609 ?auto_196607 ) ) ( not ( = ?auto_196609 ?auto_196606 ) ) ( not ( = ?auto_196609 ?auto_196608 ) ) ( not ( = ?auto_196609 ?auto_196605 ) ) ( not ( = ?auto_196609 ?auto_196604 ) ) ( not ( = ?auto_196607 ?auto_196606 ) ) ( not ( = ?auto_196607 ?auto_196608 ) ) ( not ( = ?auto_196607 ?auto_196605 ) ) ( not ( = ?auto_196607 ?auto_196604 ) ) ( not ( = ?auto_196606 ?auto_196608 ) ) ( not ( = ?auto_196606 ?auto_196605 ) ) ( not ( = ?auto_196606 ?auto_196604 ) ) ( not ( = ?auto_196601 ?auto_196609 ) ) ( not ( = ?auto_196601 ?auto_196607 ) ) ( not ( = ?auto_196601 ?auto_196606 ) ) ( not ( = ?auto_196602 ?auto_196609 ) ) ( not ( = ?auto_196602 ?auto_196607 ) ) ( not ( = ?auto_196602 ?auto_196606 ) ) ( not ( = ?auto_196603 ?auto_196609 ) ) ( not ( = ?auto_196603 ?auto_196607 ) ) ( not ( = ?auto_196603 ?auto_196606 ) ) ( CLEAR ?auto_196602 ) ( ON ?auto_196603 ?auto_196604 ) ( CLEAR ?auto_196603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196609 ?auto_196607 ?auto_196606 ?auto_196608 ?auto_196605 ?auto_196604 )
      ( MAKE-5PILE ?auto_196601 ?auto_196602 ?auto_196603 ?auto_196604 ?auto_196605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196610 - BLOCK
      ?auto_196611 - BLOCK
      ?auto_196612 - BLOCK
      ?auto_196613 - BLOCK
      ?auto_196614 - BLOCK
    )
    :vars
    (
      ?auto_196617 - BLOCK
      ?auto_196615 - BLOCK
      ?auto_196616 - BLOCK
      ?auto_196618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196610 ) ( not ( = ?auto_196610 ?auto_196611 ) ) ( not ( = ?auto_196610 ?auto_196612 ) ) ( not ( = ?auto_196610 ?auto_196613 ) ) ( not ( = ?auto_196610 ?auto_196614 ) ) ( not ( = ?auto_196611 ?auto_196612 ) ) ( not ( = ?auto_196611 ?auto_196613 ) ) ( not ( = ?auto_196611 ?auto_196614 ) ) ( not ( = ?auto_196612 ?auto_196613 ) ) ( not ( = ?auto_196612 ?auto_196614 ) ) ( not ( = ?auto_196613 ?auto_196614 ) ) ( ON ?auto_196614 ?auto_196617 ) ( not ( = ?auto_196610 ?auto_196617 ) ) ( not ( = ?auto_196611 ?auto_196617 ) ) ( not ( = ?auto_196612 ?auto_196617 ) ) ( not ( = ?auto_196613 ?auto_196617 ) ) ( not ( = ?auto_196614 ?auto_196617 ) ) ( ON ?auto_196613 ?auto_196614 ) ( ON-TABLE ?auto_196615 ) ( ON ?auto_196616 ?auto_196615 ) ( ON ?auto_196618 ?auto_196616 ) ( ON ?auto_196617 ?auto_196618 ) ( not ( = ?auto_196615 ?auto_196616 ) ) ( not ( = ?auto_196615 ?auto_196618 ) ) ( not ( = ?auto_196615 ?auto_196617 ) ) ( not ( = ?auto_196615 ?auto_196614 ) ) ( not ( = ?auto_196615 ?auto_196613 ) ) ( not ( = ?auto_196616 ?auto_196618 ) ) ( not ( = ?auto_196616 ?auto_196617 ) ) ( not ( = ?auto_196616 ?auto_196614 ) ) ( not ( = ?auto_196616 ?auto_196613 ) ) ( not ( = ?auto_196618 ?auto_196617 ) ) ( not ( = ?auto_196618 ?auto_196614 ) ) ( not ( = ?auto_196618 ?auto_196613 ) ) ( not ( = ?auto_196610 ?auto_196615 ) ) ( not ( = ?auto_196610 ?auto_196616 ) ) ( not ( = ?auto_196610 ?auto_196618 ) ) ( not ( = ?auto_196611 ?auto_196615 ) ) ( not ( = ?auto_196611 ?auto_196616 ) ) ( not ( = ?auto_196611 ?auto_196618 ) ) ( not ( = ?auto_196612 ?auto_196615 ) ) ( not ( = ?auto_196612 ?auto_196616 ) ) ( not ( = ?auto_196612 ?auto_196618 ) ) ( ON ?auto_196612 ?auto_196613 ) ( CLEAR ?auto_196612 ) ( HOLDING ?auto_196611 ) ( CLEAR ?auto_196610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196610 ?auto_196611 )
      ( MAKE-5PILE ?auto_196610 ?auto_196611 ?auto_196612 ?auto_196613 ?auto_196614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196619 - BLOCK
      ?auto_196620 - BLOCK
      ?auto_196621 - BLOCK
      ?auto_196622 - BLOCK
      ?auto_196623 - BLOCK
    )
    :vars
    (
      ?auto_196627 - BLOCK
      ?auto_196624 - BLOCK
      ?auto_196625 - BLOCK
      ?auto_196626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196619 ) ( not ( = ?auto_196619 ?auto_196620 ) ) ( not ( = ?auto_196619 ?auto_196621 ) ) ( not ( = ?auto_196619 ?auto_196622 ) ) ( not ( = ?auto_196619 ?auto_196623 ) ) ( not ( = ?auto_196620 ?auto_196621 ) ) ( not ( = ?auto_196620 ?auto_196622 ) ) ( not ( = ?auto_196620 ?auto_196623 ) ) ( not ( = ?auto_196621 ?auto_196622 ) ) ( not ( = ?auto_196621 ?auto_196623 ) ) ( not ( = ?auto_196622 ?auto_196623 ) ) ( ON ?auto_196623 ?auto_196627 ) ( not ( = ?auto_196619 ?auto_196627 ) ) ( not ( = ?auto_196620 ?auto_196627 ) ) ( not ( = ?auto_196621 ?auto_196627 ) ) ( not ( = ?auto_196622 ?auto_196627 ) ) ( not ( = ?auto_196623 ?auto_196627 ) ) ( ON ?auto_196622 ?auto_196623 ) ( ON-TABLE ?auto_196624 ) ( ON ?auto_196625 ?auto_196624 ) ( ON ?auto_196626 ?auto_196625 ) ( ON ?auto_196627 ?auto_196626 ) ( not ( = ?auto_196624 ?auto_196625 ) ) ( not ( = ?auto_196624 ?auto_196626 ) ) ( not ( = ?auto_196624 ?auto_196627 ) ) ( not ( = ?auto_196624 ?auto_196623 ) ) ( not ( = ?auto_196624 ?auto_196622 ) ) ( not ( = ?auto_196625 ?auto_196626 ) ) ( not ( = ?auto_196625 ?auto_196627 ) ) ( not ( = ?auto_196625 ?auto_196623 ) ) ( not ( = ?auto_196625 ?auto_196622 ) ) ( not ( = ?auto_196626 ?auto_196627 ) ) ( not ( = ?auto_196626 ?auto_196623 ) ) ( not ( = ?auto_196626 ?auto_196622 ) ) ( not ( = ?auto_196619 ?auto_196624 ) ) ( not ( = ?auto_196619 ?auto_196625 ) ) ( not ( = ?auto_196619 ?auto_196626 ) ) ( not ( = ?auto_196620 ?auto_196624 ) ) ( not ( = ?auto_196620 ?auto_196625 ) ) ( not ( = ?auto_196620 ?auto_196626 ) ) ( not ( = ?auto_196621 ?auto_196624 ) ) ( not ( = ?auto_196621 ?auto_196625 ) ) ( not ( = ?auto_196621 ?auto_196626 ) ) ( ON ?auto_196621 ?auto_196622 ) ( CLEAR ?auto_196619 ) ( ON ?auto_196620 ?auto_196621 ) ( CLEAR ?auto_196620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196624 ?auto_196625 ?auto_196626 ?auto_196627 ?auto_196623 ?auto_196622 ?auto_196621 )
      ( MAKE-5PILE ?auto_196619 ?auto_196620 ?auto_196621 ?auto_196622 ?auto_196623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196628 - BLOCK
      ?auto_196629 - BLOCK
      ?auto_196630 - BLOCK
      ?auto_196631 - BLOCK
      ?auto_196632 - BLOCK
    )
    :vars
    (
      ?auto_196635 - BLOCK
      ?auto_196636 - BLOCK
      ?auto_196634 - BLOCK
      ?auto_196633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196628 ?auto_196629 ) ) ( not ( = ?auto_196628 ?auto_196630 ) ) ( not ( = ?auto_196628 ?auto_196631 ) ) ( not ( = ?auto_196628 ?auto_196632 ) ) ( not ( = ?auto_196629 ?auto_196630 ) ) ( not ( = ?auto_196629 ?auto_196631 ) ) ( not ( = ?auto_196629 ?auto_196632 ) ) ( not ( = ?auto_196630 ?auto_196631 ) ) ( not ( = ?auto_196630 ?auto_196632 ) ) ( not ( = ?auto_196631 ?auto_196632 ) ) ( ON ?auto_196632 ?auto_196635 ) ( not ( = ?auto_196628 ?auto_196635 ) ) ( not ( = ?auto_196629 ?auto_196635 ) ) ( not ( = ?auto_196630 ?auto_196635 ) ) ( not ( = ?auto_196631 ?auto_196635 ) ) ( not ( = ?auto_196632 ?auto_196635 ) ) ( ON ?auto_196631 ?auto_196632 ) ( ON-TABLE ?auto_196636 ) ( ON ?auto_196634 ?auto_196636 ) ( ON ?auto_196633 ?auto_196634 ) ( ON ?auto_196635 ?auto_196633 ) ( not ( = ?auto_196636 ?auto_196634 ) ) ( not ( = ?auto_196636 ?auto_196633 ) ) ( not ( = ?auto_196636 ?auto_196635 ) ) ( not ( = ?auto_196636 ?auto_196632 ) ) ( not ( = ?auto_196636 ?auto_196631 ) ) ( not ( = ?auto_196634 ?auto_196633 ) ) ( not ( = ?auto_196634 ?auto_196635 ) ) ( not ( = ?auto_196634 ?auto_196632 ) ) ( not ( = ?auto_196634 ?auto_196631 ) ) ( not ( = ?auto_196633 ?auto_196635 ) ) ( not ( = ?auto_196633 ?auto_196632 ) ) ( not ( = ?auto_196633 ?auto_196631 ) ) ( not ( = ?auto_196628 ?auto_196636 ) ) ( not ( = ?auto_196628 ?auto_196634 ) ) ( not ( = ?auto_196628 ?auto_196633 ) ) ( not ( = ?auto_196629 ?auto_196636 ) ) ( not ( = ?auto_196629 ?auto_196634 ) ) ( not ( = ?auto_196629 ?auto_196633 ) ) ( not ( = ?auto_196630 ?auto_196636 ) ) ( not ( = ?auto_196630 ?auto_196634 ) ) ( not ( = ?auto_196630 ?auto_196633 ) ) ( ON ?auto_196630 ?auto_196631 ) ( ON ?auto_196629 ?auto_196630 ) ( CLEAR ?auto_196629 ) ( HOLDING ?auto_196628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196628 )
      ( MAKE-5PILE ?auto_196628 ?auto_196629 ?auto_196630 ?auto_196631 ?auto_196632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_196637 - BLOCK
      ?auto_196638 - BLOCK
      ?auto_196639 - BLOCK
      ?auto_196640 - BLOCK
      ?auto_196641 - BLOCK
    )
    :vars
    (
      ?auto_196645 - BLOCK
      ?auto_196642 - BLOCK
      ?auto_196644 - BLOCK
      ?auto_196643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196637 ?auto_196638 ) ) ( not ( = ?auto_196637 ?auto_196639 ) ) ( not ( = ?auto_196637 ?auto_196640 ) ) ( not ( = ?auto_196637 ?auto_196641 ) ) ( not ( = ?auto_196638 ?auto_196639 ) ) ( not ( = ?auto_196638 ?auto_196640 ) ) ( not ( = ?auto_196638 ?auto_196641 ) ) ( not ( = ?auto_196639 ?auto_196640 ) ) ( not ( = ?auto_196639 ?auto_196641 ) ) ( not ( = ?auto_196640 ?auto_196641 ) ) ( ON ?auto_196641 ?auto_196645 ) ( not ( = ?auto_196637 ?auto_196645 ) ) ( not ( = ?auto_196638 ?auto_196645 ) ) ( not ( = ?auto_196639 ?auto_196645 ) ) ( not ( = ?auto_196640 ?auto_196645 ) ) ( not ( = ?auto_196641 ?auto_196645 ) ) ( ON ?auto_196640 ?auto_196641 ) ( ON-TABLE ?auto_196642 ) ( ON ?auto_196644 ?auto_196642 ) ( ON ?auto_196643 ?auto_196644 ) ( ON ?auto_196645 ?auto_196643 ) ( not ( = ?auto_196642 ?auto_196644 ) ) ( not ( = ?auto_196642 ?auto_196643 ) ) ( not ( = ?auto_196642 ?auto_196645 ) ) ( not ( = ?auto_196642 ?auto_196641 ) ) ( not ( = ?auto_196642 ?auto_196640 ) ) ( not ( = ?auto_196644 ?auto_196643 ) ) ( not ( = ?auto_196644 ?auto_196645 ) ) ( not ( = ?auto_196644 ?auto_196641 ) ) ( not ( = ?auto_196644 ?auto_196640 ) ) ( not ( = ?auto_196643 ?auto_196645 ) ) ( not ( = ?auto_196643 ?auto_196641 ) ) ( not ( = ?auto_196643 ?auto_196640 ) ) ( not ( = ?auto_196637 ?auto_196642 ) ) ( not ( = ?auto_196637 ?auto_196644 ) ) ( not ( = ?auto_196637 ?auto_196643 ) ) ( not ( = ?auto_196638 ?auto_196642 ) ) ( not ( = ?auto_196638 ?auto_196644 ) ) ( not ( = ?auto_196638 ?auto_196643 ) ) ( not ( = ?auto_196639 ?auto_196642 ) ) ( not ( = ?auto_196639 ?auto_196644 ) ) ( not ( = ?auto_196639 ?auto_196643 ) ) ( ON ?auto_196639 ?auto_196640 ) ( ON ?auto_196638 ?auto_196639 ) ( ON ?auto_196637 ?auto_196638 ) ( CLEAR ?auto_196637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196642 ?auto_196644 ?auto_196643 ?auto_196645 ?auto_196641 ?auto_196640 ?auto_196639 ?auto_196638 )
      ( MAKE-5PILE ?auto_196637 ?auto_196638 ?auto_196639 ?auto_196640 ?auto_196641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196649 - BLOCK
      ?auto_196650 - BLOCK
      ?auto_196651 - BLOCK
    )
    :vars
    (
      ?auto_196652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196652 ?auto_196651 ) ( CLEAR ?auto_196652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196649 ) ( ON ?auto_196650 ?auto_196649 ) ( ON ?auto_196651 ?auto_196650 ) ( not ( = ?auto_196649 ?auto_196650 ) ) ( not ( = ?auto_196649 ?auto_196651 ) ) ( not ( = ?auto_196649 ?auto_196652 ) ) ( not ( = ?auto_196650 ?auto_196651 ) ) ( not ( = ?auto_196650 ?auto_196652 ) ) ( not ( = ?auto_196651 ?auto_196652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196652 ?auto_196651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196653 - BLOCK
      ?auto_196654 - BLOCK
      ?auto_196655 - BLOCK
    )
    :vars
    (
      ?auto_196656 - BLOCK
      ?auto_196657 - BLOCK
      ?auto_196658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196656 ?auto_196655 ) ( CLEAR ?auto_196656 ) ( ON-TABLE ?auto_196653 ) ( ON ?auto_196654 ?auto_196653 ) ( ON ?auto_196655 ?auto_196654 ) ( not ( = ?auto_196653 ?auto_196654 ) ) ( not ( = ?auto_196653 ?auto_196655 ) ) ( not ( = ?auto_196653 ?auto_196656 ) ) ( not ( = ?auto_196654 ?auto_196655 ) ) ( not ( = ?auto_196654 ?auto_196656 ) ) ( not ( = ?auto_196655 ?auto_196656 ) ) ( HOLDING ?auto_196657 ) ( CLEAR ?auto_196658 ) ( not ( = ?auto_196653 ?auto_196657 ) ) ( not ( = ?auto_196653 ?auto_196658 ) ) ( not ( = ?auto_196654 ?auto_196657 ) ) ( not ( = ?auto_196654 ?auto_196658 ) ) ( not ( = ?auto_196655 ?auto_196657 ) ) ( not ( = ?auto_196655 ?auto_196658 ) ) ( not ( = ?auto_196656 ?auto_196657 ) ) ( not ( = ?auto_196656 ?auto_196658 ) ) ( not ( = ?auto_196657 ?auto_196658 ) ) )
    :subtasks
    ( ( !STACK ?auto_196657 ?auto_196658 )
      ( MAKE-3PILE ?auto_196653 ?auto_196654 ?auto_196655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196659 - BLOCK
      ?auto_196660 - BLOCK
      ?auto_196661 - BLOCK
    )
    :vars
    (
      ?auto_196664 - BLOCK
      ?auto_196662 - BLOCK
      ?auto_196663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196664 ?auto_196661 ) ( ON-TABLE ?auto_196659 ) ( ON ?auto_196660 ?auto_196659 ) ( ON ?auto_196661 ?auto_196660 ) ( not ( = ?auto_196659 ?auto_196660 ) ) ( not ( = ?auto_196659 ?auto_196661 ) ) ( not ( = ?auto_196659 ?auto_196664 ) ) ( not ( = ?auto_196660 ?auto_196661 ) ) ( not ( = ?auto_196660 ?auto_196664 ) ) ( not ( = ?auto_196661 ?auto_196664 ) ) ( CLEAR ?auto_196662 ) ( not ( = ?auto_196659 ?auto_196663 ) ) ( not ( = ?auto_196659 ?auto_196662 ) ) ( not ( = ?auto_196660 ?auto_196663 ) ) ( not ( = ?auto_196660 ?auto_196662 ) ) ( not ( = ?auto_196661 ?auto_196663 ) ) ( not ( = ?auto_196661 ?auto_196662 ) ) ( not ( = ?auto_196664 ?auto_196663 ) ) ( not ( = ?auto_196664 ?auto_196662 ) ) ( not ( = ?auto_196663 ?auto_196662 ) ) ( ON ?auto_196663 ?auto_196664 ) ( CLEAR ?auto_196663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196659 ?auto_196660 ?auto_196661 ?auto_196664 )
      ( MAKE-3PILE ?auto_196659 ?auto_196660 ?auto_196661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196665 - BLOCK
      ?auto_196666 - BLOCK
      ?auto_196667 - BLOCK
    )
    :vars
    (
      ?auto_196668 - BLOCK
      ?auto_196669 - BLOCK
      ?auto_196670 - BLOCK
      ?auto_196673 - BLOCK
      ?auto_196671 - BLOCK
      ?auto_196672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196668 ?auto_196667 ) ( ON-TABLE ?auto_196665 ) ( ON ?auto_196666 ?auto_196665 ) ( ON ?auto_196667 ?auto_196666 ) ( not ( = ?auto_196665 ?auto_196666 ) ) ( not ( = ?auto_196665 ?auto_196667 ) ) ( not ( = ?auto_196665 ?auto_196668 ) ) ( not ( = ?auto_196666 ?auto_196667 ) ) ( not ( = ?auto_196666 ?auto_196668 ) ) ( not ( = ?auto_196667 ?auto_196668 ) ) ( not ( = ?auto_196665 ?auto_196669 ) ) ( not ( = ?auto_196665 ?auto_196670 ) ) ( not ( = ?auto_196666 ?auto_196669 ) ) ( not ( = ?auto_196666 ?auto_196670 ) ) ( not ( = ?auto_196667 ?auto_196669 ) ) ( not ( = ?auto_196667 ?auto_196670 ) ) ( not ( = ?auto_196668 ?auto_196669 ) ) ( not ( = ?auto_196668 ?auto_196670 ) ) ( not ( = ?auto_196669 ?auto_196670 ) ) ( ON ?auto_196669 ?auto_196668 ) ( CLEAR ?auto_196669 ) ( HOLDING ?auto_196670 ) ( CLEAR ?auto_196673 ) ( ON-TABLE ?auto_196671 ) ( ON ?auto_196672 ?auto_196671 ) ( ON ?auto_196673 ?auto_196672 ) ( not ( = ?auto_196671 ?auto_196672 ) ) ( not ( = ?auto_196671 ?auto_196673 ) ) ( not ( = ?auto_196671 ?auto_196670 ) ) ( not ( = ?auto_196672 ?auto_196673 ) ) ( not ( = ?auto_196672 ?auto_196670 ) ) ( not ( = ?auto_196673 ?auto_196670 ) ) ( not ( = ?auto_196665 ?auto_196673 ) ) ( not ( = ?auto_196665 ?auto_196671 ) ) ( not ( = ?auto_196665 ?auto_196672 ) ) ( not ( = ?auto_196666 ?auto_196673 ) ) ( not ( = ?auto_196666 ?auto_196671 ) ) ( not ( = ?auto_196666 ?auto_196672 ) ) ( not ( = ?auto_196667 ?auto_196673 ) ) ( not ( = ?auto_196667 ?auto_196671 ) ) ( not ( = ?auto_196667 ?auto_196672 ) ) ( not ( = ?auto_196668 ?auto_196673 ) ) ( not ( = ?auto_196668 ?auto_196671 ) ) ( not ( = ?auto_196668 ?auto_196672 ) ) ( not ( = ?auto_196669 ?auto_196673 ) ) ( not ( = ?auto_196669 ?auto_196671 ) ) ( not ( = ?auto_196669 ?auto_196672 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196671 ?auto_196672 ?auto_196673 ?auto_196670 )
      ( MAKE-3PILE ?auto_196665 ?auto_196666 ?auto_196667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196674 - BLOCK
      ?auto_196675 - BLOCK
      ?auto_196676 - BLOCK
    )
    :vars
    (
      ?auto_196681 - BLOCK
      ?auto_196677 - BLOCK
      ?auto_196680 - BLOCK
      ?auto_196678 - BLOCK
      ?auto_196682 - BLOCK
      ?auto_196679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196681 ?auto_196676 ) ( ON-TABLE ?auto_196674 ) ( ON ?auto_196675 ?auto_196674 ) ( ON ?auto_196676 ?auto_196675 ) ( not ( = ?auto_196674 ?auto_196675 ) ) ( not ( = ?auto_196674 ?auto_196676 ) ) ( not ( = ?auto_196674 ?auto_196681 ) ) ( not ( = ?auto_196675 ?auto_196676 ) ) ( not ( = ?auto_196675 ?auto_196681 ) ) ( not ( = ?auto_196676 ?auto_196681 ) ) ( not ( = ?auto_196674 ?auto_196677 ) ) ( not ( = ?auto_196674 ?auto_196680 ) ) ( not ( = ?auto_196675 ?auto_196677 ) ) ( not ( = ?auto_196675 ?auto_196680 ) ) ( not ( = ?auto_196676 ?auto_196677 ) ) ( not ( = ?auto_196676 ?auto_196680 ) ) ( not ( = ?auto_196681 ?auto_196677 ) ) ( not ( = ?auto_196681 ?auto_196680 ) ) ( not ( = ?auto_196677 ?auto_196680 ) ) ( ON ?auto_196677 ?auto_196681 ) ( CLEAR ?auto_196678 ) ( ON-TABLE ?auto_196682 ) ( ON ?auto_196679 ?auto_196682 ) ( ON ?auto_196678 ?auto_196679 ) ( not ( = ?auto_196682 ?auto_196679 ) ) ( not ( = ?auto_196682 ?auto_196678 ) ) ( not ( = ?auto_196682 ?auto_196680 ) ) ( not ( = ?auto_196679 ?auto_196678 ) ) ( not ( = ?auto_196679 ?auto_196680 ) ) ( not ( = ?auto_196678 ?auto_196680 ) ) ( not ( = ?auto_196674 ?auto_196678 ) ) ( not ( = ?auto_196674 ?auto_196682 ) ) ( not ( = ?auto_196674 ?auto_196679 ) ) ( not ( = ?auto_196675 ?auto_196678 ) ) ( not ( = ?auto_196675 ?auto_196682 ) ) ( not ( = ?auto_196675 ?auto_196679 ) ) ( not ( = ?auto_196676 ?auto_196678 ) ) ( not ( = ?auto_196676 ?auto_196682 ) ) ( not ( = ?auto_196676 ?auto_196679 ) ) ( not ( = ?auto_196681 ?auto_196678 ) ) ( not ( = ?auto_196681 ?auto_196682 ) ) ( not ( = ?auto_196681 ?auto_196679 ) ) ( not ( = ?auto_196677 ?auto_196678 ) ) ( not ( = ?auto_196677 ?auto_196682 ) ) ( not ( = ?auto_196677 ?auto_196679 ) ) ( ON ?auto_196680 ?auto_196677 ) ( CLEAR ?auto_196680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196674 ?auto_196675 ?auto_196676 ?auto_196681 ?auto_196677 )
      ( MAKE-3PILE ?auto_196674 ?auto_196675 ?auto_196676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196683 - BLOCK
      ?auto_196684 - BLOCK
      ?auto_196685 - BLOCK
    )
    :vars
    (
      ?auto_196686 - BLOCK
      ?auto_196688 - BLOCK
      ?auto_196687 - BLOCK
      ?auto_196690 - BLOCK
      ?auto_196691 - BLOCK
      ?auto_196689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196686 ?auto_196685 ) ( ON-TABLE ?auto_196683 ) ( ON ?auto_196684 ?auto_196683 ) ( ON ?auto_196685 ?auto_196684 ) ( not ( = ?auto_196683 ?auto_196684 ) ) ( not ( = ?auto_196683 ?auto_196685 ) ) ( not ( = ?auto_196683 ?auto_196686 ) ) ( not ( = ?auto_196684 ?auto_196685 ) ) ( not ( = ?auto_196684 ?auto_196686 ) ) ( not ( = ?auto_196685 ?auto_196686 ) ) ( not ( = ?auto_196683 ?auto_196688 ) ) ( not ( = ?auto_196683 ?auto_196687 ) ) ( not ( = ?auto_196684 ?auto_196688 ) ) ( not ( = ?auto_196684 ?auto_196687 ) ) ( not ( = ?auto_196685 ?auto_196688 ) ) ( not ( = ?auto_196685 ?auto_196687 ) ) ( not ( = ?auto_196686 ?auto_196688 ) ) ( not ( = ?auto_196686 ?auto_196687 ) ) ( not ( = ?auto_196688 ?auto_196687 ) ) ( ON ?auto_196688 ?auto_196686 ) ( ON-TABLE ?auto_196690 ) ( ON ?auto_196691 ?auto_196690 ) ( not ( = ?auto_196690 ?auto_196691 ) ) ( not ( = ?auto_196690 ?auto_196689 ) ) ( not ( = ?auto_196690 ?auto_196687 ) ) ( not ( = ?auto_196691 ?auto_196689 ) ) ( not ( = ?auto_196691 ?auto_196687 ) ) ( not ( = ?auto_196689 ?auto_196687 ) ) ( not ( = ?auto_196683 ?auto_196689 ) ) ( not ( = ?auto_196683 ?auto_196690 ) ) ( not ( = ?auto_196683 ?auto_196691 ) ) ( not ( = ?auto_196684 ?auto_196689 ) ) ( not ( = ?auto_196684 ?auto_196690 ) ) ( not ( = ?auto_196684 ?auto_196691 ) ) ( not ( = ?auto_196685 ?auto_196689 ) ) ( not ( = ?auto_196685 ?auto_196690 ) ) ( not ( = ?auto_196685 ?auto_196691 ) ) ( not ( = ?auto_196686 ?auto_196689 ) ) ( not ( = ?auto_196686 ?auto_196690 ) ) ( not ( = ?auto_196686 ?auto_196691 ) ) ( not ( = ?auto_196688 ?auto_196689 ) ) ( not ( = ?auto_196688 ?auto_196690 ) ) ( not ( = ?auto_196688 ?auto_196691 ) ) ( ON ?auto_196687 ?auto_196688 ) ( CLEAR ?auto_196687 ) ( HOLDING ?auto_196689 ) ( CLEAR ?auto_196691 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196690 ?auto_196691 ?auto_196689 )
      ( MAKE-3PILE ?auto_196683 ?auto_196684 ?auto_196685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196692 - BLOCK
      ?auto_196693 - BLOCK
      ?auto_196694 - BLOCK
    )
    :vars
    (
      ?auto_196699 - BLOCK
      ?auto_196696 - BLOCK
      ?auto_196700 - BLOCK
      ?auto_196698 - BLOCK
      ?auto_196695 - BLOCK
      ?auto_196697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196699 ?auto_196694 ) ( ON-TABLE ?auto_196692 ) ( ON ?auto_196693 ?auto_196692 ) ( ON ?auto_196694 ?auto_196693 ) ( not ( = ?auto_196692 ?auto_196693 ) ) ( not ( = ?auto_196692 ?auto_196694 ) ) ( not ( = ?auto_196692 ?auto_196699 ) ) ( not ( = ?auto_196693 ?auto_196694 ) ) ( not ( = ?auto_196693 ?auto_196699 ) ) ( not ( = ?auto_196694 ?auto_196699 ) ) ( not ( = ?auto_196692 ?auto_196696 ) ) ( not ( = ?auto_196692 ?auto_196700 ) ) ( not ( = ?auto_196693 ?auto_196696 ) ) ( not ( = ?auto_196693 ?auto_196700 ) ) ( not ( = ?auto_196694 ?auto_196696 ) ) ( not ( = ?auto_196694 ?auto_196700 ) ) ( not ( = ?auto_196699 ?auto_196696 ) ) ( not ( = ?auto_196699 ?auto_196700 ) ) ( not ( = ?auto_196696 ?auto_196700 ) ) ( ON ?auto_196696 ?auto_196699 ) ( ON-TABLE ?auto_196698 ) ( ON ?auto_196695 ?auto_196698 ) ( not ( = ?auto_196698 ?auto_196695 ) ) ( not ( = ?auto_196698 ?auto_196697 ) ) ( not ( = ?auto_196698 ?auto_196700 ) ) ( not ( = ?auto_196695 ?auto_196697 ) ) ( not ( = ?auto_196695 ?auto_196700 ) ) ( not ( = ?auto_196697 ?auto_196700 ) ) ( not ( = ?auto_196692 ?auto_196697 ) ) ( not ( = ?auto_196692 ?auto_196698 ) ) ( not ( = ?auto_196692 ?auto_196695 ) ) ( not ( = ?auto_196693 ?auto_196697 ) ) ( not ( = ?auto_196693 ?auto_196698 ) ) ( not ( = ?auto_196693 ?auto_196695 ) ) ( not ( = ?auto_196694 ?auto_196697 ) ) ( not ( = ?auto_196694 ?auto_196698 ) ) ( not ( = ?auto_196694 ?auto_196695 ) ) ( not ( = ?auto_196699 ?auto_196697 ) ) ( not ( = ?auto_196699 ?auto_196698 ) ) ( not ( = ?auto_196699 ?auto_196695 ) ) ( not ( = ?auto_196696 ?auto_196697 ) ) ( not ( = ?auto_196696 ?auto_196698 ) ) ( not ( = ?auto_196696 ?auto_196695 ) ) ( ON ?auto_196700 ?auto_196696 ) ( CLEAR ?auto_196695 ) ( ON ?auto_196697 ?auto_196700 ) ( CLEAR ?auto_196697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196692 ?auto_196693 ?auto_196694 ?auto_196699 ?auto_196696 ?auto_196700 )
      ( MAKE-3PILE ?auto_196692 ?auto_196693 ?auto_196694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196701 - BLOCK
      ?auto_196702 - BLOCK
      ?auto_196703 - BLOCK
    )
    :vars
    (
      ?auto_196708 - BLOCK
      ?auto_196707 - BLOCK
      ?auto_196709 - BLOCK
      ?auto_196706 - BLOCK
      ?auto_196704 - BLOCK
      ?auto_196705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196708 ?auto_196703 ) ( ON-TABLE ?auto_196701 ) ( ON ?auto_196702 ?auto_196701 ) ( ON ?auto_196703 ?auto_196702 ) ( not ( = ?auto_196701 ?auto_196702 ) ) ( not ( = ?auto_196701 ?auto_196703 ) ) ( not ( = ?auto_196701 ?auto_196708 ) ) ( not ( = ?auto_196702 ?auto_196703 ) ) ( not ( = ?auto_196702 ?auto_196708 ) ) ( not ( = ?auto_196703 ?auto_196708 ) ) ( not ( = ?auto_196701 ?auto_196707 ) ) ( not ( = ?auto_196701 ?auto_196709 ) ) ( not ( = ?auto_196702 ?auto_196707 ) ) ( not ( = ?auto_196702 ?auto_196709 ) ) ( not ( = ?auto_196703 ?auto_196707 ) ) ( not ( = ?auto_196703 ?auto_196709 ) ) ( not ( = ?auto_196708 ?auto_196707 ) ) ( not ( = ?auto_196708 ?auto_196709 ) ) ( not ( = ?auto_196707 ?auto_196709 ) ) ( ON ?auto_196707 ?auto_196708 ) ( ON-TABLE ?auto_196706 ) ( not ( = ?auto_196706 ?auto_196704 ) ) ( not ( = ?auto_196706 ?auto_196705 ) ) ( not ( = ?auto_196706 ?auto_196709 ) ) ( not ( = ?auto_196704 ?auto_196705 ) ) ( not ( = ?auto_196704 ?auto_196709 ) ) ( not ( = ?auto_196705 ?auto_196709 ) ) ( not ( = ?auto_196701 ?auto_196705 ) ) ( not ( = ?auto_196701 ?auto_196706 ) ) ( not ( = ?auto_196701 ?auto_196704 ) ) ( not ( = ?auto_196702 ?auto_196705 ) ) ( not ( = ?auto_196702 ?auto_196706 ) ) ( not ( = ?auto_196702 ?auto_196704 ) ) ( not ( = ?auto_196703 ?auto_196705 ) ) ( not ( = ?auto_196703 ?auto_196706 ) ) ( not ( = ?auto_196703 ?auto_196704 ) ) ( not ( = ?auto_196708 ?auto_196705 ) ) ( not ( = ?auto_196708 ?auto_196706 ) ) ( not ( = ?auto_196708 ?auto_196704 ) ) ( not ( = ?auto_196707 ?auto_196705 ) ) ( not ( = ?auto_196707 ?auto_196706 ) ) ( not ( = ?auto_196707 ?auto_196704 ) ) ( ON ?auto_196709 ?auto_196707 ) ( ON ?auto_196705 ?auto_196709 ) ( CLEAR ?auto_196705 ) ( HOLDING ?auto_196704 ) ( CLEAR ?auto_196706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196706 ?auto_196704 )
      ( MAKE-3PILE ?auto_196701 ?auto_196702 ?auto_196703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196710 - BLOCK
      ?auto_196711 - BLOCK
      ?auto_196712 - BLOCK
    )
    :vars
    (
      ?auto_196713 - BLOCK
      ?auto_196714 - BLOCK
      ?auto_196715 - BLOCK
      ?auto_196716 - BLOCK
      ?auto_196718 - BLOCK
      ?auto_196717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196713 ?auto_196712 ) ( ON-TABLE ?auto_196710 ) ( ON ?auto_196711 ?auto_196710 ) ( ON ?auto_196712 ?auto_196711 ) ( not ( = ?auto_196710 ?auto_196711 ) ) ( not ( = ?auto_196710 ?auto_196712 ) ) ( not ( = ?auto_196710 ?auto_196713 ) ) ( not ( = ?auto_196711 ?auto_196712 ) ) ( not ( = ?auto_196711 ?auto_196713 ) ) ( not ( = ?auto_196712 ?auto_196713 ) ) ( not ( = ?auto_196710 ?auto_196714 ) ) ( not ( = ?auto_196710 ?auto_196715 ) ) ( not ( = ?auto_196711 ?auto_196714 ) ) ( not ( = ?auto_196711 ?auto_196715 ) ) ( not ( = ?auto_196712 ?auto_196714 ) ) ( not ( = ?auto_196712 ?auto_196715 ) ) ( not ( = ?auto_196713 ?auto_196714 ) ) ( not ( = ?auto_196713 ?auto_196715 ) ) ( not ( = ?auto_196714 ?auto_196715 ) ) ( ON ?auto_196714 ?auto_196713 ) ( ON-TABLE ?auto_196716 ) ( not ( = ?auto_196716 ?auto_196718 ) ) ( not ( = ?auto_196716 ?auto_196717 ) ) ( not ( = ?auto_196716 ?auto_196715 ) ) ( not ( = ?auto_196718 ?auto_196717 ) ) ( not ( = ?auto_196718 ?auto_196715 ) ) ( not ( = ?auto_196717 ?auto_196715 ) ) ( not ( = ?auto_196710 ?auto_196717 ) ) ( not ( = ?auto_196710 ?auto_196716 ) ) ( not ( = ?auto_196710 ?auto_196718 ) ) ( not ( = ?auto_196711 ?auto_196717 ) ) ( not ( = ?auto_196711 ?auto_196716 ) ) ( not ( = ?auto_196711 ?auto_196718 ) ) ( not ( = ?auto_196712 ?auto_196717 ) ) ( not ( = ?auto_196712 ?auto_196716 ) ) ( not ( = ?auto_196712 ?auto_196718 ) ) ( not ( = ?auto_196713 ?auto_196717 ) ) ( not ( = ?auto_196713 ?auto_196716 ) ) ( not ( = ?auto_196713 ?auto_196718 ) ) ( not ( = ?auto_196714 ?auto_196717 ) ) ( not ( = ?auto_196714 ?auto_196716 ) ) ( not ( = ?auto_196714 ?auto_196718 ) ) ( ON ?auto_196715 ?auto_196714 ) ( ON ?auto_196717 ?auto_196715 ) ( CLEAR ?auto_196716 ) ( ON ?auto_196718 ?auto_196717 ) ( CLEAR ?auto_196718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196710 ?auto_196711 ?auto_196712 ?auto_196713 ?auto_196714 ?auto_196715 ?auto_196717 )
      ( MAKE-3PILE ?auto_196710 ?auto_196711 ?auto_196712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196719 - BLOCK
      ?auto_196720 - BLOCK
      ?auto_196721 - BLOCK
    )
    :vars
    (
      ?auto_196722 - BLOCK
      ?auto_196727 - BLOCK
      ?auto_196723 - BLOCK
      ?auto_196724 - BLOCK
      ?auto_196726 - BLOCK
      ?auto_196725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196722 ?auto_196721 ) ( ON-TABLE ?auto_196719 ) ( ON ?auto_196720 ?auto_196719 ) ( ON ?auto_196721 ?auto_196720 ) ( not ( = ?auto_196719 ?auto_196720 ) ) ( not ( = ?auto_196719 ?auto_196721 ) ) ( not ( = ?auto_196719 ?auto_196722 ) ) ( not ( = ?auto_196720 ?auto_196721 ) ) ( not ( = ?auto_196720 ?auto_196722 ) ) ( not ( = ?auto_196721 ?auto_196722 ) ) ( not ( = ?auto_196719 ?auto_196727 ) ) ( not ( = ?auto_196719 ?auto_196723 ) ) ( not ( = ?auto_196720 ?auto_196727 ) ) ( not ( = ?auto_196720 ?auto_196723 ) ) ( not ( = ?auto_196721 ?auto_196727 ) ) ( not ( = ?auto_196721 ?auto_196723 ) ) ( not ( = ?auto_196722 ?auto_196727 ) ) ( not ( = ?auto_196722 ?auto_196723 ) ) ( not ( = ?auto_196727 ?auto_196723 ) ) ( ON ?auto_196727 ?auto_196722 ) ( not ( = ?auto_196724 ?auto_196726 ) ) ( not ( = ?auto_196724 ?auto_196725 ) ) ( not ( = ?auto_196724 ?auto_196723 ) ) ( not ( = ?auto_196726 ?auto_196725 ) ) ( not ( = ?auto_196726 ?auto_196723 ) ) ( not ( = ?auto_196725 ?auto_196723 ) ) ( not ( = ?auto_196719 ?auto_196725 ) ) ( not ( = ?auto_196719 ?auto_196724 ) ) ( not ( = ?auto_196719 ?auto_196726 ) ) ( not ( = ?auto_196720 ?auto_196725 ) ) ( not ( = ?auto_196720 ?auto_196724 ) ) ( not ( = ?auto_196720 ?auto_196726 ) ) ( not ( = ?auto_196721 ?auto_196725 ) ) ( not ( = ?auto_196721 ?auto_196724 ) ) ( not ( = ?auto_196721 ?auto_196726 ) ) ( not ( = ?auto_196722 ?auto_196725 ) ) ( not ( = ?auto_196722 ?auto_196724 ) ) ( not ( = ?auto_196722 ?auto_196726 ) ) ( not ( = ?auto_196727 ?auto_196725 ) ) ( not ( = ?auto_196727 ?auto_196724 ) ) ( not ( = ?auto_196727 ?auto_196726 ) ) ( ON ?auto_196723 ?auto_196727 ) ( ON ?auto_196725 ?auto_196723 ) ( ON ?auto_196726 ?auto_196725 ) ( CLEAR ?auto_196726 ) ( HOLDING ?auto_196724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196724 )
      ( MAKE-3PILE ?auto_196719 ?auto_196720 ?auto_196721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_196728 - BLOCK
      ?auto_196729 - BLOCK
      ?auto_196730 - BLOCK
    )
    :vars
    (
      ?auto_196731 - BLOCK
      ?auto_196734 - BLOCK
      ?auto_196735 - BLOCK
      ?auto_196733 - BLOCK
      ?auto_196736 - BLOCK
      ?auto_196732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196731 ?auto_196730 ) ( ON-TABLE ?auto_196728 ) ( ON ?auto_196729 ?auto_196728 ) ( ON ?auto_196730 ?auto_196729 ) ( not ( = ?auto_196728 ?auto_196729 ) ) ( not ( = ?auto_196728 ?auto_196730 ) ) ( not ( = ?auto_196728 ?auto_196731 ) ) ( not ( = ?auto_196729 ?auto_196730 ) ) ( not ( = ?auto_196729 ?auto_196731 ) ) ( not ( = ?auto_196730 ?auto_196731 ) ) ( not ( = ?auto_196728 ?auto_196734 ) ) ( not ( = ?auto_196728 ?auto_196735 ) ) ( not ( = ?auto_196729 ?auto_196734 ) ) ( not ( = ?auto_196729 ?auto_196735 ) ) ( not ( = ?auto_196730 ?auto_196734 ) ) ( not ( = ?auto_196730 ?auto_196735 ) ) ( not ( = ?auto_196731 ?auto_196734 ) ) ( not ( = ?auto_196731 ?auto_196735 ) ) ( not ( = ?auto_196734 ?auto_196735 ) ) ( ON ?auto_196734 ?auto_196731 ) ( not ( = ?auto_196733 ?auto_196736 ) ) ( not ( = ?auto_196733 ?auto_196732 ) ) ( not ( = ?auto_196733 ?auto_196735 ) ) ( not ( = ?auto_196736 ?auto_196732 ) ) ( not ( = ?auto_196736 ?auto_196735 ) ) ( not ( = ?auto_196732 ?auto_196735 ) ) ( not ( = ?auto_196728 ?auto_196732 ) ) ( not ( = ?auto_196728 ?auto_196733 ) ) ( not ( = ?auto_196728 ?auto_196736 ) ) ( not ( = ?auto_196729 ?auto_196732 ) ) ( not ( = ?auto_196729 ?auto_196733 ) ) ( not ( = ?auto_196729 ?auto_196736 ) ) ( not ( = ?auto_196730 ?auto_196732 ) ) ( not ( = ?auto_196730 ?auto_196733 ) ) ( not ( = ?auto_196730 ?auto_196736 ) ) ( not ( = ?auto_196731 ?auto_196732 ) ) ( not ( = ?auto_196731 ?auto_196733 ) ) ( not ( = ?auto_196731 ?auto_196736 ) ) ( not ( = ?auto_196734 ?auto_196732 ) ) ( not ( = ?auto_196734 ?auto_196733 ) ) ( not ( = ?auto_196734 ?auto_196736 ) ) ( ON ?auto_196735 ?auto_196734 ) ( ON ?auto_196732 ?auto_196735 ) ( ON ?auto_196736 ?auto_196732 ) ( ON ?auto_196733 ?auto_196736 ) ( CLEAR ?auto_196733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196728 ?auto_196729 ?auto_196730 ?auto_196731 ?auto_196734 ?auto_196735 ?auto_196732 ?auto_196736 )
      ( MAKE-3PILE ?auto_196728 ?auto_196729 ?auto_196730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196743 - BLOCK
      ?auto_196744 - BLOCK
      ?auto_196745 - BLOCK
      ?auto_196746 - BLOCK
      ?auto_196747 - BLOCK
      ?auto_196748 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196748 ) ( CLEAR ?auto_196747 ) ( ON-TABLE ?auto_196743 ) ( ON ?auto_196744 ?auto_196743 ) ( ON ?auto_196745 ?auto_196744 ) ( ON ?auto_196746 ?auto_196745 ) ( ON ?auto_196747 ?auto_196746 ) ( not ( = ?auto_196743 ?auto_196744 ) ) ( not ( = ?auto_196743 ?auto_196745 ) ) ( not ( = ?auto_196743 ?auto_196746 ) ) ( not ( = ?auto_196743 ?auto_196747 ) ) ( not ( = ?auto_196743 ?auto_196748 ) ) ( not ( = ?auto_196744 ?auto_196745 ) ) ( not ( = ?auto_196744 ?auto_196746 ) ) ( not ( = ?auto_196744 ?auto_196747 ) ) ( not ( = ?auto_196744 ?auto_196748 ) ) ( not ( = ?auto_196745 ?auto_196746 ) ) ( not ( = ?auto_196745 ?auto_196747 ) ) ( not ( = ?auto_196745 ?auto_196748 ) ) ( not ( = ?auto_196746 ?auto_196747 ) ) ( not ( = ?auto_196746 ?auto_196748 ) ) ( not ( = ?auto_196747 ?auto_196748 ) ) )
    :subtasks
    ( ( !STACK ?auto_196748 ?auto_196747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196749 - BLOCK
      ?auto_196750 - BLOCK
      ?auto_196751 - BLOCK
      ?auto_196752 - BLOCK
      ?auto_196753 - BLOCK
      ?auto_196754 - BLOCK
    )
    :vars
    (
      ?auto_196755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196753 ) ( ON-TABLE ?auto_196749 ) ( ON ?auto_196750 ?auto_196749 ) ( ON ?auto_196751 ?auto_196750 ) ( ON ?auto_196752 ?auto_196751 ) ( ON ?auto_196753 ?auto_196752 ) ( not ( = ?auto_196749 ?auto_196750 ) ) ( not ( = ?auto_196749 ?auto_196751 ) ) ( not ( = ?auto_196749 ?auto_196752 ) ) ( not ( = ?auto_196749 ?auto_196753 ) ) ( not ( = ?auto_196749 ?auto_196754 ) ) ( not ( = ?auto_196750 ?auto_196751 ) ) ( not ( = ?auto_196750 ?auto_196752 ) ) ( not ( = ?auto_196750 ?auto_196753 ) ) ( not ( = ?auto_196750 ?auto_196754 ) ) ( not ( = ?auto_196751 ?auto_196752 ) ) ( not ( = ?auto_196751 ?auto_196753 ) ) ( not ( = ?auto_196751 ?auto_196754 ) ) ( not ( = ?auto_196752 ?auto_196753 ) ) ( not ( = ?auto_196752 ?auto_196754 ) ) ( not ( = ?auto_196753 ?auto_196754 ) ) ( ON ?auto_196754 ?auto_196755 ) ( CLEAR ?auto_196754 ) ( HAND-EMPTY ) ( not ( = ?auto_196749 ?auto_196755 ) ) ( not ( = ?auto_196750 ?auto_196755 ) ) ( not ( = ?auto_196751 ?auto_196755 ) ) ( not ( = ?auto_196752 ?auto_196755 ) ) ( not ( = ?auto_196753 ?auto_196755 ) ) ( not ( = ?auto_196754 ?auto_196755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196754 ?auto_196755 )
      ( MAKE-6PILE ?auto_196749 ?auto_196750 ?auto_196751 ?auto_196752 ?auto_196753 ?auto_196754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196756 - BLOCK
      ?auto_196757 - BLOCK
      ?auto_196758 - BLOCK
      ?auto_196759 - BLOCK
      ?auto_196760 - BLOCK
      ?auto_196761 - BLOCK
    )
    :vars
    (
      ?auto_196762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196756 ) ( ON ?auto_196757 ?auto_196756 ) ( ON ?auto_196758 ?auto_196757 ) ( ON ?auto_196759 ?auto_196758 ) ( not ( = ?auto_196756 ?auto_196757 ) ) ( not ( = ?auto_196756 ?auto_196758 ) ) ( not ( = ?auto_196756 ?auto_196759 ) ) ( not ( = ?auto_196756 ?auto_196760 ) ) ( not ( = ?auto_196756 ?auto_196761 ) ) ( not ( = ?auto_196757 ?auto_196758 ) ) ( not ( = ?auto_196757 ?auto_196759 ) ) ( not ( = ?auto_196757 ?auto_196760 ) ) ( not ( = ?auto_196757 ?auto_196761 ) ) ( not ( = ?auto_196758 ?auto_196759 ) ) ( not ( = ?auto_196758 ?auto_196760 ) ) ( not ( = ?auto_196758 ?auto_196761 ) ) ( not ( = ?auto_196759 ?auto_196760 ) ) ( not ( = ?auto_196759 ?auto_196761 ) ) ( not ( = ?auto_196760 ?auto_196761 ) ) ( ON ?auto_196761 ?auto_196762 ) ( CLEAR ?auto_196761 ) ( not ( = ?auto_196756 ?auto_196762 ) ) ( not ( = ?auto_196757 ?auto_196762 ) ) ( not ( = ?auto_196758 ?auto_196762 ) ) ( not ( = ?auto_196759 ?auto_196762 ) ) ( not ( = ?auto_196760 ?auto_196762 ) ) ( not ( = ?auto_196761 ?auto_196762 ) ) ( HOLDING ?auto_196760 ) ( CLEAR ?auto_196759 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196756 ?auto_196757 ?auto_196758 ?auto_196759 ?auto_196760 )
      ( MAKE-6PILE ?auto_196756 ?auto_196757 ?auto_196758 ?auto_196759 ?auto_196760 ?auto_196761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196763 - BLOCK
      ?auto_196764 - BLOCK
      ?auto_196765 - BLOCK
      ?auto_196766 - BLOCK
      ?auto_196767 - BLOCK
      ?auto_196768 - BLOCK
    )
    :vars
    (
      ?auto_196769 - BLOCK
      ?auto_196770 - BLOCK
      ?auto_196771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196763 ) ( ON ?auto_196764 ?auto_196763 ) ( ON ?auto_196765 ?auto_196764 ) ( ON ?auto_196766 ?auto_196765 ) ( not ( = ?auto_196763 ?auto_196764 ) ) ( not ( = ?auto_196763 ?auto_196765 ) ) ( not ( = ?auto_196763 ?auto_196766 ) ) ( not ( = ?auto_196763 ?auto_196767 ) ) ( not ( = ?auto_196763 ?auto_196768 ) ) ( not ( = ?auto_196764 ?auto_196765 ) ) ( not ( = ?auto_196764 ?auto_196766 ) ) ( not ( = ?auto_196764 ?auto_196767 ) ) ( not ( = ?auto_196764 ?auto_196768 ) ) ( not ( = ?auto_196765 ?auto_196766 ) ) ( not ( = ?auto_196765 ?auto_196767 ) ) ( not ( = ?auto_196765 ?auto_196768 ) ) ( not ( = ?auto_196766 ?auto_196767 ) ) ( not ( = ?auto_196766 ?auto_196768 ) ) ( not ( = ?auto_196767 ?auto_196768 ) ) ( ON ?auto_196768 ?auto_196769 ) ( not ( = ?auto_196763 ?auto_196769 ) ) ( not ( = ?auto_196764 ?auto_196769 ) ) ( not ( = ?auto_196765 ?auto_196769 ) ) ( not ( = ?auto_196766 ?auto_196769 ) ) ( not ( = ?auto_196767 ?auto_196769 ) ) ( not ( = ?auto_196768 ?auto_196769 ) ) ( CLEAR ?auto_196766 ) ( ON ?auto_196767 ?auto_196768 ) ( CLEAR ?auto_196767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196770 ) ( ON ?auto_196771 ?auto_196770 ) ( ON ?auto_196769 ?auto_196771 ) ( not ( = ?auto_196770 ?auto_196771 ) ) ( not ( = ?auto_196770 ?auto_196769 ) ) ( not ( = ?auto_196770 ?auto_196768 ) ) ( not ( = ?auto_196770 ?auto_196767 ) ) ( not ( = ?auto_196771 ?auto_196769 ) ) ( not ( = ?auto_196771 ?auto_196768 ) ) ( not ( = ?auto_196771 ?auto_196767 ) ) ( not ( = ?auto_196763 ?auto_196770 ) ) ( not ( = ?auto_196763 ?auto_196771 ) ) ( not ( = ?auto_196764 ?auto_196770 ) ) ( not ( = ?auto_196764 ?auto_196771 ) ) ( not ( = ?auto_196765 ?auto_196770 ) ) ( not ( = ?auto_196765 ?auto_196771 ) ) ( not ( = ?auto_196766 ?auto_196770 ) ) ( not ( = ?auto_196766 ?auto_196771 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196770 ?auto_196771 ?auto_196769 ?auto_196768 )
      ( MAKE-6PILE ?auto_196763 ?auto_196764 ?auto_196765 ?auto_196766 ?auto_196767 ?auto_196768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196772 - BLOCK
      ?auto_196773 - BLOCK
      ?auto_196774 - BLOCK
      ?auto_196775 - BLOCK
      ?auto_196776 - BLOCK
      ?auto_196777 - BLOCK
    )
    :vars
    (
      ?auto_196780 - BLOCK
      ?auto_196778 - BLOCK
      ?auto_196779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196772 ) ( ON ?auto_196773 ?auto_196772 ) ( ON ?auto_196774 ?auto_196773 ) ( not ( = ?auto_196772 ?auto_196773 ) ) ( not ( = ?auto_196772 ?auto_196774 ) ) ( not ( = ?auto_196772 ?auto_196775 ) ) ( not ( = ?auto_196772 ?auto_196776 ) ) ( not ( = ?auto_196772 ?auto_196777 ) ) ( not ( = ?auto_196773 ?auto_196774 ) ) ( not ( = ?auto_196773 ?auto_196775 ) ) ( not ( = ?auto_196773 ?auto_196776 ) ) ( not ( = ?auto_196773 ?auto_196777 ) ) ( not ( = ?auto_196774 ?auto_196775 ) ) ( not ( = ?auto_196774 ?auto_196776 ) ) ( not ( = ?auto_196774 ?auto_196777 ) ) ( not ( = ?auto_196775 ?auto_196776 ) ) ( not ( = ?auto_196775 ?auto_196777 ) ) ( not ( = ?auto_196776 ?auto_196777 ) ) ( ON ?auto_196777 ?auto_196780 ) ( not ( = ?auto_196772 ?auto_196780 ) ) ( not ( = ?auto_196773 ?auto_196780 ) ) ( not ( = ?auto_196774 ?auto_196780 ) ) ( not ( = ?auto_196775 ?auto_196780 ) ) ( not ( = ?auto_196776 ?auto_196780 ) ) ( not ( = ?auto_196777 ?auto_196780 ) ) ( ON ?auto_196776 ?auto_196777 ) ( CLEAR ?auto_196776 ) ( ON-TABLE ?auto_196778 ) ( ON ?auto_196779 ?auto_196778 ) ( ON ?auto_196780 ?auto_196779 ) ( not ( = ?auto_196778 ?auto_196779 ) ) ( not ( = ?auto_196778 ?auto_196780 ) ) ( not ( = ?auto_196778 ?auto_196777 ) ) ( not ( = ?auto_196778 ?auto_196776 ) ) ( not ( = ?auto_196779 ?auto_196780 ) ) ( not ( = ?auto_196779 ?auto_196777 ) ) ( not ( = ?auto_196779 ?auto_196776 ) ) ( not ( = ?auto_196772 ?auto_196778 ) ) ( not ( = ?auto_196772 ?auto_196779 ) ) ( not ( = ?auto_196773 ?auto_196778 ) ) ( not ( = ?auto_196773 ?auto_196779 ) ) ( not ( = ?auto_196774 ?auto_196778 ) ) ( not ( = ?auto_196774 ?auto_196779 ) ) ( not ( = ?auto_196775 ?auto_196778 ) ) ( not ( = ?auto_196775 ?auto_196779 ) ) ( HOLDING ?auto_196775 ) ( CLEAR ?auto_196774 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196772 ?auto_196773 ?auto_196774 ?auto_196775 )
      ( MAKE-6PILE ?auto_196772 ?auto_196773 ?auto_196774 ?auto_196775 ?auto_196776 ?auto_196777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196781 - BLOCK
      ?auto_196782 - BLOCK
      ?auto_196783 - BLOCK
      ?auto_196784 - BLOCK
      ?auto_196785 - BLOCK
      ?auto_196786 - BLOCK
    )
    :vars
    (
      ?auto_196789 - BLOCK
      ?auto_196787 - BLOCK
      ?auto_196788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196781 ) ( ON ?auto_196782 ?auto_196781 ) ( ON ?auto_196783 ?auto_196782 ) ( not ( = ?auto_196781 ?auto_196782 ) ) ( not ( = ?auto_196781 ?auto_196783 ) ) ( not ( = ?auto_196781 ?auto_196784 ) ) ( not ( = ?auto_196781 ?auto_196785 ) ) ( not ( = ?auto_196781 ?auto_196786 ) ) ( not ( = ?auto_196782 ?auto_196783 ) ) ( not ( = ?auto_196782 ?auto_196784 ) ) ( not ( = ?auto_196782 ?auto_196785 ) ) ( not ( = ?auto_196782 ?auto_196786 ) ) ( not ( = ?auto_196783 ?auto_196784 ) ) ( not ( = ?auto_196783 ?auto_196785 ) ) ( not ( = ?auto_196783 ?auto_196786 ) ) ( not ( = ?auto_196784 ?auto_196785 ) ) ( not ( = ?auto_196784 ?auto_196786 ) ) ( not ( = ?auto_196785 ?auto_196786 ) ) ( ON ?auto_196786 ?auto_196789 ) ( not ( = ?auto_196781 ?auto_196789 ) ) ( not ( = ?auto_196782 ?auto_196789 ) ) ( not ( = ?auto_196783 ?auto_196789 ) ) ( not ( = ?auto_196784 ?auto_196789 ) ) ( not ( = ?auto_196785 ?auto_196789 ) ) ( not ( = ?auto_196786 ?auto_196789 ) ) ( ON ?auto_196785 ?auto_196786 ) ( ON-TABLE ?auto_196787 ) ( ON ?auto_196788 ?auto_196787 ) ( ON ?auto_196789 ?auto_196788 ) ( not ( = ?auto_196787 ?auto_196788 ) ) ( not ( = ?auto_196787 ?auto_196789 ) ) ( not ( = ?auto_196787 ?auto_196786 ) ) ( not ( = ?auto_196787 ?auto_196785 ) ) ( not ( = ?auto_196788 ?auto_196789 ) ) ( not ( = ?auto_196788 ?auto_196786 ) ) ( not ( = ?auto_196788 ?auto_196785 ) ) ( not ( = ?auto_196781 ?auto_196787 ) ) ( not ( = ?auto_196781 ?auto_196788 ) ) ( not ( = ?auto_196782 ?auto_196787 ) ) ( not ( = ?auto_196782 ?auto_196788 ) ) ( not ( = ?auto_196783 ?auto_196787 ) ) ( not ( = ?auto_196783 ?auto_196788 ) ) ( not ( = ?auto_196784 ?auto_196787 ) ) ( not ( = ?auto_196784 ?auto_196788 ) ) ( CLEAR ?auto_196783 ) ( ON ?auto_196784 ?auto_196785 ) ( CLEAR ?auto_196784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196787 ?auto_196788 ?auto_196789 ?auto_196786 ?auto_196785 )
      ( MAKE-6PILE ?auto_196781 ?auto_196782 ?auto_196783 ?auto_196784 ?auto_196785 ?auto_196786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196790 - BLOCK
      ?auto_196791 - BLOCK
      ?auto_196792 - BLOCK
      ?auto_196793 - BLOCK
      ?auto_196794 - BLOCK
      ?auto_196795 - BLOCK
    )
    :vars
    (
      ?auto_196796 - BLOCK
      ?auto_196797 - BLOCK
      ?auto_196798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196790 ) ( ON ?auto_196791 ?auto_196790 ) ( not ( = ?auto_196790 ?auto_196791 ) ) ( not ( = ?auto_196790 ?auto_196792 ) ) ( not ( = ?auto_196790 ?auto_196793 ) ) ( not ( = ?auto_196790 ?auto_196794 ) ) ( not ( = ?auto_196790 ?auto_196795 ) ) ( not ( = ?auto_196791 ?auto_196792 ) ) ( not ( = ?auto_196791 ?auto_196793 ) ) ( not ( = ?auto_196791 ?auto_196794 ) ) ( not ( = ?auto_196791 ?auto_196795 ) ) ( not ( = ?auto_196792 ?auto_196793 ) ) ( not ( = ?auto_196792 ?auto_196794 ) ) ( not ( = ?auto_196792 ?auto_196795 ) ) ( not ( = ?auto_196793 ?auto_196794 ) ) ( not ( = ?auto_196793 ?auto_196795 ) ) ( not ( = ?auto_196794 ?auto_196795 ) ) ( ON ?auto_196795 ?auto_196796 ) ( not ( = ?auto_196790 ?auto_196796 ) ) ( not ( = ?auto_196791 ?auto_196796 ) ) ( not ( = ?auto_196792 ?auto_196796 ) ) ( not ( = ?auto_196793 ?auto_196796 ) ) ( not ( = ?auto_196794 ?auto_196796 ) ) ( not ( = ?auto_196795 ?auto_196796 ) ) ( ON ?auto_196794 ?auto_196795 ) ( ON-TABLE ?auto_196797 ) ( ON ?auto_196798 ?auto_196797 ) ( ON ?auto_196796 ?auto_196798 ) ( not ( = ?auto_196797 ?auto_196798 ) ) ( not ( = ?auto_196797 ?auto_196796 ) ) ( not ( = ?auto_196797 ?auto_196795 ) ) ( not ( = ?auto_196797 ?auto_196794 ) ) ( not ( = ?auto_196798 ?auto_196796 ) ) ( not ( = ?auto_196798 ?auto_196795 ) ) ( not ( = ?auto_196798 ?auto_196794 ) ) ( not ( = ?auto_196790 ?auto_196797 ) ) ( not ( = ?auto_196790 ?auto_196798 ) ) ( not ( = ?auto_196791 ?auto_196797 ) ) ( not ( = ?auto_196791 ?auto_196798 ) ) ( not ( = ?auto_196792 ?auto_196797 ) ) ( not ( = ?auto_196792 ?auto_196798 ) ) ( not ( = ?auto_196793 ?auto_196797 ) ) ( not ( = ?auto_196793 ?auto_196798 ) ) ( ON ?auto_196793 ?auto_196794 ) ( CLEAR ?auto_196793 ) ( HOLDING ?auto_196792 ) ( CLEAR ?auto_196791 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196790 ?auto_196791 ?auto_196792 )
      ( MAKE-6PILE ?auto_196790 ?auto_196791 ?auto_196792 ?auto_196793 ?auto_196794 ?auto_196795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196799 - BLOCK
      ?auto_196800 - BLOCK
      ?auto_196801 - BLOCK
      ?auto_196802 - BLOCK
      ?auto_196803 - BLOCK
      ?auto_196804 - BLOCK
    )
    :vars
    (
      ?auto_196807 - BLOCK
      ?auto_196806 - BLOCK
      ?auto_196805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196799 ) ( ON ?auto_196800 ?auto_196799 ) ( not ( = ?auto_196799 ?auto_196800 ) ) ( not ( = ?auto_196799 ?auto_196801 ) ) ( not ( = ?auto_196799 ?auto_196802 ) ) ( not ( = ?auto_196799 ?auto_196803 ) ) ( not ( = ?auto_196799 ?auto_196804 ) ) ( not ( = ?auto_196800 ?auto_196801 ) ) ( not ( = ?auto_196800 ?auto_196802 ) ) ( not ( = ?auto_196800 ?auto_196803 ) ) ( not ( = ?auto_196800 ?auto_196804 ) ) ( not ( = ?auto_196801 ?auto_196802 ) ) ( not ( = ?auto_196801 ?auto_196803 ) ) ( not ( = ?auto_196801 ?auto_196804 ) ) ( not ( = ?auto_196802 ?auto_196803 ) ) ( not ( = ?auto_196802 ?auto_196804 ) ) ( not ( = ?auto_196803 ?auto_196804 ) ) ( ON ?auto_196804 ?auto_196807 ) ( not ( = ?auto_196799 ?auto_196807 ) ) ( not ( = ?auto_196800 ?auto_196807 ) ) ( not ( = ?auto_196801 ?auto_196807 ) ) ( not ( = ?auto_196802 ?auto_196807 ) ) ( not ( = ?auto_196803 ?auto_196807 ) ) ( not ( = ?auto_196804 ?auto_196807 ) ) ( ON ?auto_196803 ?auto_196804 ) ( ON-TABLE ?auto_196806 ) ( ON ?auto_196805 ?auto_196806 ) ( ON ?auto_196807 ?auto_196805 ) ( not ( = ?auto_196806 ?auto_196805 ) ) ( not ( = ?auto_196806 ?auto_196807 ) ) ( not ( = ?auto_196806 ?auto_196804 ) ) ( not ( = ?auto_196806 ?auto_196803 ) ) ( not ( = ?auto_196805 ?auto_196807 ) ) ( not ( = ?auto_196805 ?auto_196804 ) ) ( not ( = ?auto_196805 ?auto_196803 ) ) ( not ( = ?auto_196799 ?auto_196806 ) ) ( not ( = ?auto_196799 ?auto_196805 ) ) ( not ( = ?auto_196800 ?auto_196806 ) ) ( not ( = ?auto_196800 ?auto_196805 ) ) ( not ( = ?auto_196801 ?auto_196806 ) ) ( not ( = ?auto_196801 ?auto_196805 ) ) ( not ( = ?auto_196802 ?auto_196806 ) ) ( not ( = ?auto_196802 ?auto_196805 ) ) ( ON ?auto_196802 ?auto_196803 ) ( CLEAR ?auto_196800 ) ( ON ?auto_196801 ?auto_196802 ) ( CLEAR ?auto_196801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196806 ?auto_196805 ?auto_196807 ?auto_196804 ?auto_196803 ?auto_196802 )
      ( MAKE-6PILE ?auto_196799 ?auto_196800 ?auto_196801 ?auto_196802 ?auto_196803 ?auto_196804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196808 - BLOCK
      ?auto_196809 - BLOCK
      ?auto_196810 - BLOCK
      ?auto_196811 - BLOCK
      ?auto_196812 - BLOCK
      ?auto_196813 - BLOCK
    )
    :vars
    (
      ?auto_196815 - BLOCK
      ?auto_196814 - BLOCK
      ?auto_196816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196808 ) ( not ( = ?auto_196808 ?auto_196809 ) ) ( not ( = ?auto_196808 ?auto_196810 ) ) ( not ( = ?auto_196808 ?auto_196811 ) ) ( not ( = ?auto_196808 ?auto_196812 ) ) ( not ( = ?auto_196808 ?auto_196813 ) ) ( not ( = ?auto_196809 ?auto_196810 ) ) ( not ( = ?auto_196809 ?auto_196811 ) ) ( not ( = ?auto_196809 ?auto_196812 ) ) ( not ( = ?auto_196809 ?auto_196813 ) ) ( not ( = ?auto_196810 ?auto_196811 ) ) ( not ( = ?auto_196810 ?auto_196812 ) ) ( not ( = ?auto_196810 ?auto_196813 ) ) ( not ( = ?auto_196811 ?auto_196812 ) ) ( not ( = ?auto_196811 ?auto_196813 ) ) ( not ( = ?auto_196812 ?auto_196813 ) ) ( ON ?auto_196813 ?auto_196815 ) ( not ( = ?auto_196808 ?auto_196815 ) ) ( not ( = ?auto_196809 ?auto_196815 ) ) ( not ( = ?auto_196810 ?auto_196815 ) ) ( not ( = ?auto_196811 ?auto_196815 ) ) ( not ( = ?auto_196812 ?auto_196815 ) ) ( not ( = ?auto_196813 ?auto_196815 ) ) ( ON ?auto_196812 ?auto_196813 ) ( ON-TABLE ?auto_196814 ) ( ON ?auto_196816 ?auto_196814 ) ( ON ?auto_196815 ?auto_196816 ) ( not ( = ?auto_196814 ?auto_196816 ) ) ( not ( = ?auto_196814 ?auto_196815 ) ) ( not ( = ?auto_196814 ?auto_196813 ) ) ( not ( = ?auto_196814 ?auto_196812 ) ) ( not ( = ?auto_196816 ?auto_196815 ) ) ( not ( = ?auto_196816 ?auto_196813 ) ) ( not ( = ?auto_196816 ?auto_196812 ) ) ( not ( = ?auto_196808 ?auto_196814 ) ) ( not ( = ?auto_196808 ?auto_196816 ) ) ( not ( = ?auto_196809 ?auto_196814 ) ) ( not ( = ?auto_196809 ?auto_196816 ) ) ( not ( = ?auto_196810 ?auto_196814 ) ) ( not ( = ?auto_196810 ?auto_196816 ) ) ( not ( = ?auto_196811 ?auto_196814 ) ) ( not ( = ?auto_196811 ?auto_196816 ) ) ( ON ?auto_196811 ?auto_196812 ) ( ON ?auto_196810 ?auto_196811 ) ( CLEAR ?auto_196810 ) ( HOLDING ?auto_196809 ) ( CLEAR ?auto_196808 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196808 ?auto_196809 )
      ( MAKE-6PILE ?auto_196808 ?auto_196809 ?auto_196810 ?auto_196811 ?auto_196812 ?auto_196813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196817 - BLOCK
      ?auto_196818 - BLOCK
      ?auto_196819 - BLOCK
      ?auto_196820 - BLOCK
      ?auto_196821 - BLOCK
      ?auto_196822 - BLOCK
    )
    :vars
    (
      ?auto_196825 - BLOCK
      ?auto_196824 - BLOCK
      ?auto_196823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196817 ) ( not ( = ?auto_196817 ?auto_196818 ) ) ( not ( = ?auto_196817 ?auto_196819 ) ) ( not ( = ?auto_196817 ?auto_196820 ) ) ( not ( = ?auto_196817 ?auto_196821 ) ) ( not ( = ?auto_196817 ?auto_196822 ) ) ( not ( = ?auto_196818 ?auto_196819 ) ) ( not ( = ?auto_196818 ?auto_196820 ) ) ( not ( = ?auto_196818 ?auto_196821 ) ) ( not ( = ?auto_196818 ?auto_196822 ) ) ( not ( = ?auto_196819 ?auto_196820 ) ) ( not ( = ?auto_196819 ?auto_196821 ) ) ( not ( = ?auto_196819 ?auto_196822 ) ) ( not ( = ?auto_196820 ?auto_196821 ) ) ( not ( = ?auto_196820 ?auto_196822 ) ) ( not ( = ?auto_196821 ?auto_196822 ) ) ( ON ?auto_196822 ?auto_196825 ) ( not ( = ?auto_196817 ?auto_196825 ) ) ( not ( = ?auto_196818 ?auto_196825 ) ) ( not ( = ?auto_196819 ?auto_196825 ) ) ( not ( = ?auto_196820 ?auto_196825 ) ) ( not ( = ?auto_196821 ?auto_196825 ) ) ( not ( = ?auto_196822 ?auto_196825 ) ) ( ON ?auto_196821 ?auto_196822 ) ( ON-TABLE ?auto_196824 ) ( ON ?auto_196823 ?auto_196824 ) ( ON ?auto_196825 ?auto_196823 ) ( not ( = ?auto_196824 ?auto_196823 ) ) ( not ( = ?auto_196824 ?auto_196825 ) ) ( not ( = ?auto_196824 ?auto_196822 ) ) ( not ( = ?auto_196824 ?auto_196821 ) ) ( not ( = ?auto_196823 ?auto_196825 ) ) ( not ( = ?auto_196823 ?auto_196822 ) ) ( not ( = ?auto_196823 ?auto_196821 ) ) ( not ( = ?auto_196817 ?auto_196824 ) ) ( not ( = ?auto_196817 ?auto_196823 ) ) ( not ( = ?auto_196818 ?auto_196824 ) ) ( not ( = ?auto_196818 ?auto_196823 ) ) ( not ( = ?auto_196819 ?auto_196824 ) ) ( not ( = ?auto_196819 ?auto_196823 ) ) ( not ( = ?auto_196820 ?auto_196824 ) ) ( not ( = ?auto_196820 ?auto_196823 ) ) ( ON ?auto_196820 ?auto_196821 ) ( ON ?auto_196819 ?auto_196820 ) ( CLEAR ?auto_196817 ) ( ON ?auto_196818 ?auto_196819 ) ( CLEAR ?auto_196818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196824 ?auto_196823 ?auto_196825 ?auto_196822 ?auto_196821 ?auto_196820 ?auto_196819 )
      ( MAKE-6PILE ?auto_196817 ?auto_196818 ?auto_196819 ?auto_196820 ?auto_196821 ?auto_196822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196826 - BLOCK
      ?auto_196827 - BLOCK
      ?auto_196828 - BLOCK
      ?auto_196829 - BLOCK
      ?auto_196830 - BLOCK
      ?auto_196831 - BLOCK
    )
    :vars
    (
      ?auto_196832 - BLOCK
      ?auto_196833 - BLOCK
      ?auto_196834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196826 ?auto_196827 ) ) ( not ( = ?auto_196826 ?auto_196828 ) ) ( not ( = ?auto_196826 ?auto_196829 ) ) ( not ( = ?auto_196826 ?auto_196830 ) ) ( not ( = ?auto_196826 ?auto_196831 ) ) ( not ( = ?auto_196827 ?auto_196828 ) ) ( not ( = ?auto_196827 ?auto_196829 ) ) ( not ( = ?auto_196827 ?auto_196830 ) ) ( not ( = ?auto_196827 ?auto_196831 ) ) ( not ( = ?auto_196828 ?auto_196829 ) ) ( not ( = ?auto_196828 ?auto_196830 ) ) ( not ( = ?auto_196828 ?auto_196831 ) ) ( not ( = ?auto_196829 ?auto_196830 ) ) ( not ( = ?auto_196829 ?auto_196831 ) ) ( not ( = ?auto_196830 ?auto_196831 ) ) ( ON ?auto_196831 ?auto_196832 ) ( not ( = ?auto_196826 ?auto_196832 ) ) ( not ( = ?auto_196827 ?auto_196832 ) ) ( not ( = ?auto_196828 ?auto_196832 ) ) ( not ( = ?auto_196829 ?auto_196832 ) ) ( not ( = ?auto_196830 ?auto_196832 ) ) ( not ( = ?auto_196831 ?auto_196832 ) ) ( ON ?auto_196830 ?auto_196831 ) ( ON-TABLE ?auto_196833 ) ( ON ?auto_196834 ?auto_196833 ) ( ON ?auto_196832 ?auto_196834 ) ( not ( = ?auto_196833 ?auto_196834 ) ) ( not ( = ?auto_196833 ?auto_196832 ) ) ( not ( = ?auto_196833 ?auto_196831 ) ) ( not ( = ?auto_196833 ?auto_196830 ) ) ( not ( = ?auto_196834 ?auto_196832 ) ) ( not ( = ?auto_196834 ?auto_196831 ) ) ( not ( = ?auto_196834 ?auto_196830 ) ) ( not ( = ?auto_196826 ?auto_196833 ) ) ( not ( = ?auto_196826 ?auto_196834 ) ) ( not ( = ?auto_196827 ?auto_196833 ) ) ( not ( = ?auto_196827 ?auto_196834 ) ) ( not ( = ?auto_196828 ?auto_196833 ) ) ( not ( = ?auto_196828 ?auto_196834 ) ) ( not ( = ?auto_196829 ?auto_196833 ) ) ( not ( = ?auto_196829 ?auto_196834 ) ) ( ON ?auto_196829 ?auto_196830 ) ( ON ?auto_196828 ?auto_196829 ) ( ON ?auto_196827 ?auto_196828 ) ( CLEAR ?auto_196827 ) ( HOLDING ?auto_196826 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196826 )
      ( MAKE-6PILE ?auto_196826 ?auto_196827 ?auto_196828 ?auto_196829 ?auto_196830 ?auto_196831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_196835 - BLOCK
      ?auto_196836 - BLOCK
      ?auto_196837 - BLOCK
      ?auto_196838 - BLOCK
      ?auto_196839 - BLOCK
      ?auto_196840 - BLOCK
    )
    :vars
    (
      ?auto_196842 - BLOCK
      ?auto_196843 - BLOCK
      ?auto_196841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196835 ?auto_196836 ) ) ( not ( = ?auto_196835 ?auto_196837 ) ) ( not ( = ?auto_196835 ?auto_196838 ) ) ( not ( = ?auto_196835 ?auto_196839 ) ) ( not ( = ?auto_196835 ?auto_196840 ) ) ( not ( = ?auto_196836 ?auto_196837 ) ) ( not ( = ?auto_196836 ?auto_196838 ) ) ( not ( = ?auto_196836 ?auto_196839 ) ) ( not ( = ?auto_196836 ?auto_196840 ) ) ( not ( = ?auto_196837 ?auto_196838 ) ) ( not ( = ?auto_196837 ?auto_196839 ) ) ( not ( = ?auto_196837 ?auto_196840 ) ) ( not ( = ?auto_196838 ?auto_196839 ) ) ( not ( = ?auto_196838 ?auto_196840 ) ) ( not ( = ?auto_196839 ?auto_196840 ) ) ( ON ?auto_196840 ?auto_196842 ) ( not ( = ?auto_196835 ?auto_196842 ) ) ( not ( = ?auto_196836 ?auto_196842 ) ) ( not ( = ?auto_196837 ?auto_196842 ) ) ( not ( = ?auto_196838 ?auto_196842 ) ) ( not ( = ?auto_196839 ?auto_196842 ) ) ( not ( = ?auto_196840 ?auto_196842 ) ) ( ON ?auto_196839 ?auto_196840 ) ( ON-TABLE ?auto_196843 ) ( ON ?auto_196841 ?auto_196843 ) ( ON ?auto_196842 ?auto_196841 ) ( not ( = ?auto_196843 ?auto_196841 ) ) ( not ( = ?auto_196843 ?auto_196842 ) ) ( not ( = ?auto_196843 ?auto_196840 ) ) ( not ( = ?auto_196843 ?auto_196839 ) ) ( not ( = ?auto_196841 ?auto_196842 ) ) ( not ( = ?auto_196841 ?auto_196840 ) ) ( not ( = ?auto_196841 ?auto_196839 ) ) ( not ( = ?auto_196835 ?auto_196843 ) ) ( not ( = ?auto_196835 ?auto_196841 ) ) ( not ( = ?auto_196836 ?auto_196843 ) ) ( not ( = ?auto_196836 ?auto_196841 ) ) ( not ( = ?auto_196837 ?auto_196843 ) ) ( not ( = ?auto_196837 ?auto_196841 ) ) ( not ( = ?auto_196838 ?auto_196843 ) ) ( not ( = ?auto_196838 ?auto_196841 ) ) ( ON ?auto_196838 ?auto_196839 ) ( ON ?auto_196837 ?auto_196838 ) ( ON ?auto_196836 ?auto_196837 ) ( ON ?auto_196835 ?auto_196836 ) ( CLEAR ?auto_196835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196843 ?auto_196841 ?auto_196842 ?auto_196840 ?auto_196839 ?auto_196838 ?auto_196837 ?auto_196836 )
      ( MAKE-6PILE ?auto_196835 ?auto_196836 ?auto_196837 ?auto_196838 ?auto_196839 ?auto_196840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196846 - BLOCK
      ?auto_196847 - BLOCK
    )
    :vars
    (
      ?auto_196848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196848 ?auto_196847 ) ( CLEAR ?auto_196848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196846 ) ( ON ?auto_196847 ?auto_196846 ) ( not ( = ?auto_196846 ?auto_196847 ) ) ( not ( = ?auto_196846 ?auto_196848 ) ) ( not ( = ?auto_196847 ?auto_196848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196848 ?auto_196847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196849 - BLOCK
      ?auto_196850 - BLOCK
    )
    :vars
    (
      ?auto_196851 - BLOCK
      ?auto_196852 - BLOCK
      ?auto_196853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196851 ?auto_196850 ) ( CLEAR ?auto_196851 ) ( ON-TABLE ?auto_196849 ) ( ON ?auto_196850 ?auto_196849 ) ( not ( = ?auto_196849 ?auto_196850 ) ) ( not ( = ?auto_196849 ?auto_196851 ) ) ( not ( = ?auto_196850 ?auto_196851 ) ) ( HOLDING ?auto_196852 ) ( CLEAR ?auto_196853 ) ( not ( = ?auto_196849 ?auto_196852 ) ) ( not ( = ?auto_196849 ?auto_196853 ) ) ( not ( = ?auto_196850 ?auto_196852 ) ) ( not ( = ?auto_196850 ?auto_196853 ) ) ( not ( = ?auto_196851 ?auto_196852 ) ) ( not ( = ?auto_196851 ?auto_196853 ) ) ( not ( = ?auto_196852 ?auto_196853 ) ) )
    :subtasks
    ( ( !STACK ?auto_196852 ?auto_196853 )
      ( MAKE-2PILE ?auto_196849 ?auto_196850 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196854 - BLOCK
      ?auto_196855 - BLOCK
    )
    :vars
    (
      ?auto_196856 - BLOCK
      ?auto_196857 - BLOCK
      ?auto_196858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196856 ?auto_196855 ) ( ON-TABLE ?auto_196854 ) ( ON ?auto_196855 ?auto_196854 ) ( not ( = ?auto_196854 ?auto_196855 ) ) ( not ( = ?auto_196854 ?auto_196856 ) ) ( not ( = ?auto_196855 ?auto_196856 ) ) ( CLEAR ?auto_196857 ) ( not ( = ?auto_196854 ?auto_196858 ) ) ( not ( = ?auto_196854 ?auto_196857 ) ) ( not ( = ?auto_196855 ?auto_196858 ) ) ( not ( = ?auto_196855 ?auto_196857 ) ) ( not ( = ?auto_196856 ?auto_196858 ) ) ( not ( = ?auto_196856 ?auto_196857 ) ) ( not ( = ?auto_196858 ?auto_196857 ) ) ( ON ?auto_196858 ?auto_196856 ) ( CLEAR ?auto_196858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196854 ?auto_196855 ?auto_196856 )
      ( MAKE-2PILE ?auto_196854 ?auto_196855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196859 - BLOCK
      ?auto_196860 - BLOCK
    )
    :vars
    (
      ?auto_196861 - BLOCK
      ?auto_196862 - BLOCK
      ?auto_196863 - BLOCK
      ?auto_196865 - BLOCK
      ?auto_196867 - BLOCK
      ?auto_196866 - BLOCK
      ?auto_196864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196861 ?auto_196860 ) ( ON-TABLE ?auto_196859 ) ( ON ?auto_196860 ?auto_196859 ) ( not ( = ?auto_196859 ?auto_196860 ) ) ( not ( = ?auto_196859 ?auto_196861 ) ) ( not ( = ?auto_196860 ?auto_196861 ) ) ( not ( = ?auto_196859 ?auto_196862 ) ) ( not ( = ?auto_196859 ?auto_196863 ) ) ( not ( = ?auto_196860 ?auto_196862 ) ) ( not ( = ?auto_196860 ?auto_196863 ) ) ( not ( = ?auto_196861 ?auto_196862 ) ) ( not ( = ?auto_196861 ?auto_196863 ) ) ( not ( = ?auto_196862 ?auto_196863 ) ) ( ON ?auto_196862 ?auto_196861 ) ( CLEAR ?auto_196862 ) ( HOLDING ?auto_196863 ) ( CLEAR ?auto_196865 ) ( ON-TABLE ?auto_196867 ) ( ON ?auto_196866 ?auto_196867 ) ( ON ?auto_196864 ?auto_196866 ) ( ON ?auto_196865 ?auto_196864 ) ( not ( = ?auto_196867 ?auto_196866 ) ) ( not ( = ?auto_196867 ?auto_196864 ) ) ( not ( = ?auto_196867 ?auto_196865 ) ) ( not ( = ?auto_196867 ?auto_196863 ) ) ( not ( = ?auto_196866 ?auto_196864 ) ) ( not ( = ?auto_196866 ?auto_196865 ) ) ( not ( = ?auto_196866 ?auto_196863 ) ) ( not ( = ?auto_196864 ?auto_196865 ) ) ( not ( = ?auto_196864 ?auto_196863 ) ) ( not ( = ?auto_196865 ?auto_196863 ) ) ( not ( = ?auto_196859 ?auto_196865 ) ) ( not ( = ?auto_196859 ?auto_196867 ) ) ( not ( = ?auto_196859 ?auto_196866 ) ) ( not ( = ?auto_196859 ?auto_196864 ) ) ( not ( = ?auto_196860 ?auto_196865 ) ) ( not ( = ?auto_196860 ?auto_196867 ) ) ( not ( = ?auto_196860 ?auto_196866 ) ) ( not ( = ?auto_196860 ?auto_196864 ) ) ( not ( = ?auto_196861 ?auto_196865 ) ) ( not ( = ?auto_196861 ?auto_196867 ) ) ( not ( = ?auto_196861 ?auto_196866 ) ) ( not ( = ?auto_196861 ?auto_196864 ) ) ( not ( = ?auto_196862 ?auto_196865 ) ) ( not ( = ?auto_196862 ?auto_196867 ) ) ( not ( = ?auto_196862 ?auto_196866 ) ) ( not ( = ?auto_196862 ?auto_196864 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196867 ?auto_196866 ?auto_196864 ?auto_196865 ?auto_196863 )
      ( MAKE-2PILE ?auto_196859 ?auto_196860 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196868 - BLOCK
      ?auto_196869 - BLOCK
    )
    :vars
    (
      ?auto_196876 - BLOCK
      ?auto_196874 - BLOCK
      ?auto_196873 - BLOCK
      ?auto_196870 - BLOCK
      ?auto_196875 - BLOCK
      ?auto_196871 - BLOCK
      ?auto_196872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196876 ?auto_196869 ) ( ON-TABLE ?auto_196868 ) ( ON ?auto_196869 ?auto_196868 ) ( not ( = ?auto_196868 ?auto_196869 ) ) ( not ( = ?auto_196868 ?auto_196876 ) ) ( not ( = ?auto_196869 ?auto_196876 ) ) ( not ( = ?auto_196868 ?auto_196874 ) ) ( not ( = ?auto_196868 ?auto_196873 ) ) ( not ( = ?auto_196869 ?auto_196874 ) ) ( not ( = ?auto_196869 ?auto_196873 ) ) ( not ( = ?auto_196876 ?auto_196874 ) ) ( not ( = ?auto_196876 ?auto_196873 ) ) ( not ( = ?auto_196874 ?auto_196873 ) ) ( ON ?auto_196874 ?auto_196876 ) ( CLEAR ?auto_196870 ) ( ON-TABLE ?auto_196875 ) ( ON ?auto_196871 ?auto_196875 ) ( ON ?auto_196872 ?auto_196871 ) ( ON ?auto_196870 ?auto_196872 ) ( not ( = ?auto_196875 ?auto_196871 ) ) ( not ( = ?auto_196875 ?auto_196872 ) ) ( not ( = ?auto_196875 ?auto_196870 ) ) ( not ( = ?auto_196875 ?auto_196873 ) ) ( not ( = ?auto_196871 ?auto_196872 ) ) ( not ( = ?auto_196871 ?auto_196870 ) ) ( not ( = ?auto_196871 ?auto_196873 ) ) ( not ( = ?auto_196872 ?auto_196870 ) ) ( not ( = ?auto_196872 ?auto_196873 ) ) ( not ( = ?auto_196870 ?auto_196873 ) ) ( not ( = ?auto_196868 ?auto_196870 ) ) ( not ( = ?auto_196868 ?auto_196875 ) ) ( not ( = ?auto_196868 ?auto_196871 ) ) ( not ( = ?auto_196868 ?auto_196872 ) ) ( not ( = ?auto_196869 ?auto_196870 ) ) ( not ( = ?auto_196869 ?auto_196875 ) ) ( not ( = ?auto_196869 ?auto_196871 ) ) ( not ( = ?auto_196869 ?auto_196872 ) ) ( not ( = ?auto_196876 ?auto_196870 ) ) ( not ( = ?auto_196876 ?auto_196875 ) ) ( not ( = ?auto_196876 ?auto_196871 ) ) ( not ( = ?auto_196876 ?auto_196872 ) ) ( not ( = ?auto_196874 ?auto_196870 ) ) ( not ( = ?auto_196874 ?auto_196875 ) ) ( not ( = ?auto_196874 ?auto_196871 ) ) ( not ( = ?auto_196874 ?auto_196872 ) ) ( ON ?auto_196873 ?auto_196874 ) ( CLEAR ?auto_196873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196868 ?auto_196869 ?auto_196876 ?auto_196874 )
      ( MAKE-2PILE ?auto_196868 ?auto_196869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196877 - BLOCK
      ?auto_196878 - BLOCK
    )
    :vars
    (
      ?auto_196879 - BLOCK
      ?auto_196883 - BLOCK
      ?auto_196885 - BLOCK
      ?auto_196882 - BLOCK
      ?auto_196884 - BLOCK
      ?auto_196880 - BLOCK
      ?auto_196881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196879 ?auto_196878 ) ( ON-TABLE ?auto_196877 ) ( ON ?auto_196878 ?auto_196877 ) ( not ( = ?auto_196877 ?auto_196878 ) ) ( not ( = ?auto_196877 ?auto_196879 ) ) ( not ( = ?auto_196878 ?auto_196879 ) ) ( not ( = ?auto_196877 ?auto_196883 ) ) ( not ( = ?auto_196877 ?auto_196885 ) ) ( not ( = ?auto_196878 ?auto_196883 ) ) ( not ( = ?auto_196878 ?auto_196885 ) ) ( not ( = ?auto_196879 ?auto_196883 ) ) ( not ( = ?auto_196879 ?auto_196885 ) ) ( not ( = ?auto_196883 ?auto_196885 ) ) ( ON ?auto_196883 ?auto_196879 ) ( ON-TABLE ?auto_196882 ) ( ON ?auto_196884 ?auto_196882 ) ( ON ?auto_196880 ?auto_196884 ) ( not ( = ?auto_196882 ?auto_196884 ) ) ( not ( = ?auto_196882 ?auto_196880 ) ) ( not ( = ?auto_196882 ?auto_196881 ) ) ( not ( = ?auto_196882 ?auto_196885 ) ) ( not ( = ?auto_196884 ?auto_196880 ) ) ( not ( = ?auto_196884 ?auto_196881 ) ) ( not ( = ?auto_196884 ?auto_196885 ) ) ( not ( = ?auto_196880 ?auto_196881 ) ) ( not ( = ?auto_196880 ?auto_196885 ) ) ( not ( = ?auto_196881 ?auto_196885 ) ) ( not ( = ?auto_196877 ?auto_196881 ) ) ( not ( = ?auto_196877 ?auto_196882 ) ) ( not ( = ?auto_196877 ?auto_196884 ) ) ( not ( = ?auto_196877 ?auto_196880 ) ) ( not ( = ?auto_196878 ?auto_196881 ) ) ( not ( = ?auto_196878 ?auto_196882 ) ) ( not ( = ?auto_196878 ?auto_196884 ) ) ( not ( = ?auto_196878 ?auto_196880 ) ) ( not ( = ?auto_196879 ?auto_196881 ) ) ( not ( = ?auto_196879 ?auto_196882 ) ) ( not ( = ?auto_196879 ?auto_196884 ) ) ( not ( = ?auto_196879 ?auto_196880 ) ) ( not ( = ?auto_196883 ?auto_196881 ) ) ( not ( = ?auto_196883 ?auto_196882 ) ) ( not ( = ?auto_196883 ?auto_196884 ) ) ( not ( = ?auto_196883 ?auto_196880 ) ) ( ON ?auto_196885 ?auto_196883 ) ( CLEAR ?auto_196885 ) ( HOLDING ?auto_196881 ) ( CLEAR ?auto_196880 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196882 ?auto_196884 ?auto_196880 ?auto_196881 )
      ( MAKE-2PILE ?auto_196877 ?auto_196878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196886 - BLOCK
      ?auto_196887 - BLOCK
    )
    :vars
    (
      ?auto_196891 - BLOCK
      ?auto_196889 - BLOCK
      ?auto_196893 - BLOCK
      ?auto_196888 - BLOCK
      ?auto_196892 - BLOCK
      ?auto_196890 - BLOCK
      ?auto_196894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196891 ?auto_196887 ) ( ON-TABLE ?auto_196886 ) ( ON ?auto_196887 ?auto_196886 ) ( not ( = ?auto_196886 ?auto_196887 ) ) ( not ( = ?auto_196886 ?auto_196891 ) ) ( not ( = ?auto_196887 ?auto_196891 ) ) ( not ( = ?auto_196886 ?auto_196889 ) ) ( not ( = ?auto_196886 ?auto_196893 ) ) ( not ( = ?auto_196887 ?auto_196889 ) ) ( not ( = ?auto_196887 ?auto_196893 ) ) ( not ( = ?auto_196891 ?auto_196889 ) ) ( not ( = ?auto_196891 ?auto_196893 ) ) ( not ( = ?auto_196889 ?auto_196893 ) ) ( ON ?auto_196889 ?auto_196891 ) ( ON-TABLE ?auto_196888 ) ( ON ?auto_196892 ?auto_196888 ) ( ON ?auto_196890 ?auto_196892 ) ( not ( = ?auto_196888 ?auto_196892 ) ) ( not ( = ?auto_196888 ?auto_196890 ) ) ( not ( = ?auto_196888 ?auto_196894 ) ) ( not ( = ?auto_196888 ?auto_196893 ) ) ( not ( = ?auto_196892 ?auto_196890 ) ) ( not ( = ?auto_196892 ?auto_196894 ) ) ( not ( = ?auto_196892 ?auto_196893 ) ) ( not ( = ?auto_196890 ?auto_196894 ) ) ( not ( = ?auto_196890 ?auto_196893 ) ) ( not ( = ?auto_196894 ?auto_196893 ) ) ( not ( = ?auto_196886 ?auto_196894 ) ) ( not ( = ?auto_196886 ?auto_196888 ) ) ( not ( = ?auto_196886 ?auto_196892 ) ) ( not ( = ?auto_196886 ?auto_196890 ) ) ( not ( = ?auto_196887 ?auto_196894 ) ) ( not ( = ?auto_196887 ?auto_196888 ) ) ( not ( = ?auto_196887 ?auto_196892 ) ) ( not ( = ?auto_196887 ?auto_196890 ) ) ( not ( = ?auto_196891 ?auto_196894 ) ) ( not ( = ?auto_196891 ?auto_196888 ) ) ( not ( = ?auto_196891 ?auto_196892 ) ) ( not ( = ?auto_196891 ?auto_196890 ) ) ( not ( = ?auto_196889 ?auto_196894 ) ) ( not ( = ?auto_196889 ?auto_196888 ) ) ( not ( = ?auto_196889 ?auto_196892 ) ) ( not ( = ?auto_196889 ?auto_196890 ) ) ( ON ?auto_196893 ?auto_196889 ) ( CLEAR ?auto_196890 ) ( ON ?auto_196894 ?auto_196893 ) ( CLEAR ?auto_196894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196886 ?auto_196887 ?auto_196891 ?auto_196889 ?auto_196893 )
      ( MAKE-2PILE ?auto_196886 ?auto_196887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196895 - BLOCK
      ?auto_196896 - BLOCK
    )
    :vars
    (
      ?auto_196901 - BLOCK
      ?auto_196897 - BLOCK
      ?auto_196903 - BLOCK
      ?auto_196900 - BLOCK
      ?auto_196899 - BLOCK
      ?auto_196902 - BLOCK
      ?auto_196898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196901 ?auto_196896 ) ( ON-TABLE ?auto_196895 ) ( ON ?auto_196896 ?auto_196895 ) ( not ( = ?auto_196895 ?auto_196896 ) ) ( not ( = ?auto_196895 ?auto_196901 ) ) ( not ( = ?auto_196896 ?auto_196901 ) ) ( not ( = ?auto_196895 ?auto_196897 ) ) ( not ( = ?auto_196895 ?auto_196903 ) ) ( not ( = ?auto_196896 ?auto_196897 ) ) ( not ( = ?auto_196896 ?auto_196903 ) ) ( not ( = ?auto_196901 ?auto_196897 ) ) ( not ( = ?auto_196901 ?auto_196903 ) ) ( not ( = ?auto_196897 ?auto_196903 ) ) ( ON ?auto_196897 ?auto_196901 ) ( ON-TABLE ?auto_196900 ) ( ON ?auto_196899 ?auto_196900 ) ( not ( = ?auto_196900 ?auto_196899 ) ) ( not ( = ?auto_196900 ?auto_196902 ) ) ( not ( = ?auto_196900 ?auto_196898 ) ) ( not ( = ?auto_196900 ?auto_196903 ) ) ( not ( = ?auto_196899 ?auto_196902 ) ) ( not ( = ?auto_196899 ?auto_196898 ) ) ( not ( = ?auto_196899 ?auto_196903 ) ) ( not ( = ?auto_196902 ?auto_196898 ) ) ( not ( = ?auto_196902 ?auto_196903 ) ) ( not ( = ?auto_196898 ?auto_196903 ) ) ( not ( = ?auto_196895 ?auto_196898 ) ) ( not ( = ?auto_196895 ?auto_196900 ) ) ( not ( = ?auto_196895 ?auto_196899 ) ) ( not ( = ?auto_196895 ?auto_196902 ) ) ( not ( = ?auto_196896 ?auto_196898 ) ) ( not ( = ?auto_196896 ?auto_196900 ) ) ( not ( = ?auto_196896 ?auto_196899 ) ) ( not ( = ?auto_196896 ?auto_196902 ) ) ( not ( = ?auto_196901 ?auto_196898 ) ) ( not ( = ?auto_196901 ?auto_196900 ) ) ( not ( = ?auto_196901 ?auto_196899 ) ) ( not ( = ?auto_196901 ?auto_196902 ) ) ( not ( = ?auto_196897 ?auto_196898 ) ) ( not ( = ?auto_196897 ?auto_196900 ) ) ( not ( = ?auto_196897 ?auto_196899 ) ) ( not ( = ?auto_196897 ?auto_196902 ) ) ( ON ?auto_196903 ?auto_196897 ) ( ON ?auto_196898 ?auto_196903 ) ( CLEAR ?auto_196898 ) ( HOLDING ?auto_196902 ) ( CLEAR ?auto_196899 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196900 ?auto_196899 ?auto_196902 )
      ( MAKE-2PILE ?auto_196895 ?auto_196896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196904 - BLOCK
      ?auto_196905 - BLOCK
    )
    :vars
    (
      ?auto_196909 - BLOCK
      ?auto_196907 - BLOCK
      ?auto_196910 - BLOCK
      ?auto_196911 - BLOCK
      ?auto_196912 - BLOCK
      ?auto_196908 - BLOCK
      ?auto_196906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196909 ?auto_196905 ) ( ON-TABLE ?auto_196904 ) ( ON ?auto_196905 ?auto_196904 ) ( not ( = ?auto_196904 ?auto_196905 ) ) ( not ( = ?auto_196904 ?auto_196909 ) ) ( not ( = ?auto_196905 ?auto_196909 ) ) ( not ( = ?auto_196904 ?auto_196907 ) ) ( not ( = ?auto_196904 ?auto_196910 ) ) ( not ( = ?auto_196905 ?auto_196907 ) ) ( not ( = ?auto_196905 ?auto_196910 ) ) ( not ( = ?auto_196909 ?auto_196907 ) ) ( not ( = ?auto_196909 ?auto_196910 ) ) ( not ( = ?auto_196907 ?auto_196910 ) ) ( ON ?auto_196907 ?auto_196909 ) ( ON-TABLE ?auto_196911 ) ( ON ?auto_196912 ?auto_196911 ) ( not ( = ?auto_196911 ?auto_196912 ) ) ( not ( = ?auto_196911 ?auto_196908 ) ) ( not ( = ?auto_196911 ?auto_196906 ) ) ( not ( = ?auto_196911 ?auto_196910 ) ) ( not ( = ?auto_196912 ?auto_196908 ) ) ( not ( = ?auto_196912 ?auto_196906 ) ) ( not ( = ?auto_196912 ?auto_196910 ) ) ( not ( = ?auto_196908 ?auto_196906 ) ) ( not ( = ?auto_196908 ?auto_196910 ) ) ( not ( = ?auto_196906 ?auto_196910 ) ) ( not ( = ?auto_196904 ?auto_196906 ) ) ( not ( = ?auto_196904 ?auto_196911 ) ) ( not ( = ?auto_196904 ?auto_196912 ) ) ( not ( = ?auto_196904 ?auto_196908 ) ) ( not ( = ?auto_196905 ?auto_196906 ) ) ( not ( = ?auto_196905 ?auto_196911 ) ) ( not ( = ?auto_196905 ?auto_196912 ) ) ( not ( = ?auto_196905 ?auto_196908 ) ) ( not ( = ?auto_196909 ?auto_196906 ) ) ( not ( = ?auto_196909 ?auto_196911 ) ) ( not ( = ?auto_196909 ?auto_196912 ) ) ( not ( = ?auto_196909 ?auto_196908 ) ) ( not ( = ?auto_196907 ?auto_196906 ) ) ( not ( = ?auto_196907 ?auto_196911 ) ) ( not ( = ?auto_196907 ?auto_196912 ) ) ( not ( = ?auto_196907 ?auto_196908 ) ) ( ON ?auto_196910 ?auto_196907 ) ( ON ?auto_196906 ?auto_196910 ) ( CLEAR ?auto_196912 ) ( ON ?auto_196908 ?auto_196906 ) ( CLEAR ?auto_196908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196904 ?auto_196905 ?auto_196909 ?auto_196907 ?auto_196910 ?auto_196906 )
      ( MAKE-2PILE ?auto_196904 ?auto_196905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196913 - BLOCK
      ?auto_196914 - BLOCK
    )
    :vars
    (
      ?auto_196916 - BLOCK
      ?auto_196921 - BLOCK
      ?auto_196919 - BLOCK
      ?auto_196918 - BLOCK
      ?auto_196917 - BLOCK
      ?auto_196920 - BLOCK
      ?auto_196915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196916 ?auto_196914 ) ( ON-TABLE ?auto_196913 ) ( ON ?auto_196914 ?auto_196913 ) ( not ( = ?auto_196913 ?auto_196914 ) ) ( not ( = ?auto_196913 ?auto_196916 ) ) ( not ( = ?auto_196914 ?auto_196916 ) ) ( not ( = ?auto_196913 ?auto_196921 ) ) ( not ( = ?auto_196913 ?auto_196919 ) ) ( not ( = ?auto_196914 ?auto_196921 ) ) ( not ( = ?auto_196914 ?auto_196919 ) ) ( not ( = ?auto_196916 ?auto_196921 ) ) ( not ( = ?auto_196916 ?auto_196919 ) ) ( not ( = ?auto_196921 ?auto_196919 ) ) ( ON ?auto_196921 ?auto_196916 ) ( ON-TABLE ?auto_196918 ) ( not ( = ?auto_196918 ?auto_196917 ) ) ( not ( = ?auto_196918 ?auto_196920 ) ) ( not ( = ?auto_196918 ?auto_196915 ) ) ( not ( = ?auto_196918 ?auto_196919 ) ) ( not ( = ?auto_196917 ?auto_196920 ) ) ( not ( = ?auto_196917 ?auto_196915 ) ) ( not ( = ?auto_196917 ?auto_196919 ) ) ( not ( = ?auto_196920 ?auto_196915 ) ) ( not ( = ?auto_196920 ?auto_196919 ) ) ( not ( = ?auto_196915 ?auto_196919 ) ) ( not ( = ?auto_196913 ?auto_196915 ) ) ( not ( = ?auto_196913 ?auto_196918 ) ) ( not ( = ?auto_196913 ?auto_196917 ) ) ( not ( = ?auto_196913 ?auto_196920 ) ) ( not ( = ?auto_196914 ?auto_196915 ) ) ( not ( = ?auto_196914 ?auto_196918 ) ) ( not ( = ?auto_196914 ?auto_196917 ) ) ( not ( = ?auto_196914 ?auto_196920 ) ) ( not ( = ?auto_196916 ?auto_196915 ) ) ( not ( = ?auto_196916 ?auto_196918 ) ) ( not ( = ?auto_196916 ?auto_196917 ) ) ( not ( = ?auto_196916 ?auto_196920 ) ) ( not ( = ?auto_196921 ?auto_196915 ) ) ( not ( = ?auto_196921 ?auto_196918 ) ) ( not ( = ?auto_196921 ?auto_196917 ) ) ( not ( = ?auto_196921 ?auto_196920 ) ) ( ON ?auto_196919 ?auto_196921 ) ( ON ?auto_196915 ?auto_196919 ) ( ON ?auto_196920 ?auto_196915 ) ( CLEAR ?auto_196920 ) ( HOLDING ?auto_196917 ) ( CLEAR ?auto_196918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196918 ?auto_196917 )
      ( MAKE-2PILE ?auto_196913 ?auto_196914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196922 - BLOCK
      ?auto_196923 - BLOCK
    )
    :vars
    (
      ?auto_196924 - BLOCK
      ?auto_196928 - BLOCK
      ?auto_196930 - BLOCK
      ?auto_196925 - BLOCK
      ?auto_196926 - BLOCK
      ?auto_196929 - BLOCK
      ?auto_196927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196924 ?auto_196923 ) ( ON-TABLE ?auto_196922 ) ( ON ?auto_196923 ?auto_196922 ) ( not ( = ?auto_196922 ?auto_196923 ) ) ( not ( = ?auto_196922 ?auto_196924 ) ) ( not ( = ?auto_196923 ?auto_196924 ) ) ( not ( = ?auto_196922 ?auto_196928 ) ) ( not ( = ?auto_196922 ?auto_196930 ) ) ( not ( = ?auto_196923 ?auto_196928 ) ) ( not ( = ?auto_196923 ?auto_196930 ) ) ( not ( = ?auto_196924 ?auto_196928 ) ) ( not ( = ?auto_196924 ?auto_196930 ) ) ( not ( = ?auto_196928 ?auto_196930 ) ) ( ON ?auto_196928 ?auto_196924 ) ( ON-TABLE ?auto_196925 ) ( not ( = ?auto_196925 ?auto_196926 ) ) ( not ( = ?auto_196925 ?auto_196929 ) ) ( not ( = ?auto_196925 ?auto_196927 ) ) ( not ( = ?auto_196925 ?auto_196930 ) ) ( not ( = ?auto_196926 ?auto_196929 ) ) ( not ( = ?auto_196926 ?auto_196927 ) ) ( not ( = ?auto_196926 ?auto_196930 ) ) ( not ( = ?auto_196929 ?auto_196927 ) ) ( not ( = ?auto_196929 ?auto_196930 ) ) ( not ( = ?auto_196927 ?auto_196930 ) ) ( not ( = ?auto_196922 ?auto_196927 ) ) ( not ( = ?auto_196922 ?auto_196925 ) ) ( not ( = ?auto_196922 ?auto_196926 ) ) ( not ( = ?auto_196922 ?auto_196929 ) ) ( not ( = ?auto_196923 ?auto_196927 ) ) ( not ( = ?auto_196923 ?auto_196925 ) ) ( not ( = ?auto_196923 ?auto_196926 ) ) ( not ( = ?auto_196923 ?auto_196929 ) ) ( not ( = ?auto_196924 ?auto_196927 ) ) ( not ( = ?auto_196924 ?auto_196925 ) ) ( not ( = ?auto_196924 ?auto_196926 ) ) ( not ( = ?auto_196924 ?auto_196929 ) ) ( not ( = ?auto_196928 ?auto_196927 ) ) ( not ( = ?auto_196928 ?auto_196925 ) ) ( not ( = ?auto_196928 ?auto_196926 ) ) ( not ( = ?auto_196928 ?auto_196929 ) ) ( ON ?auto_196930 ?auto_196928 ) ( ON ?auto_196927 ?auto_196930 ) ( ON ?auto_196929 ?auto_196927 ) ( CLEAR ?auto_196925 ) ( ON ?auto_196926 ?auto_196929 ) ( CLEAR ?auto_196926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196922 ?auto_196923 ?auto_196924 ?auto_196928 ?auto_196930 ?auto_196927 ?auto_196929 )
      ( MAKE-2PILE ?auto_196922 ?auto_196923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196931 - BLOCK
      ?auto_196932 - BLOCK
    )
    :vars
    (
      ?auto_196937 - BLOCK
      ?auto_196934 - BLOCK
      ?auto_196936 - BLOCK
      ?auto_196939 - BLOCK
      ?auto_196935 - BLOCK
      ?auto_196938 - BLOCK
      ?auto_196933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196937 ?auto_196932 ) ( ON-TABLE ?auto_196931 ) ( ON ?auto_196932 ?auto_196931 ) ( not ( = ?auto_196931 ?auto_196932 ) ) ( not ( = ?auto_196931 ?auto_196937 ) ) ( not ( = ?auto_196932 ?auto_196937 ) ) ( not ( = ?auto_196931 ?auto_196934 ) ) ( not ( = ?auto_196931 ?auto_196936 ) ) ( not ( = ?auto_196932 ?auto_196934 ) ) ( not ( = ?auto_196932 ?auto_196936 ) ) ( not ( = ?auto_196937 ?auto_196934 ) ) ( not ( = ?auto_196937 ?auto_196936 ) ) ( not ( = ?auto_196934 ?auto_196936 ) ) ( ON ?auto_196934 ?auto_196937 ) ( not ( = ?auto_196939 ?auto_196935 ) ) ( not ( = ?auto_196939 ?auto_196938 ) ) ( not ( = ?auto_196939 ?auto_196933 ) ) ( not ( = ?auto_196939 ?auto_196936 ) ) ( not ( = ?auto_196935 ?auto_196938 ) ) ( not ( = ?auto_196935 ?auto_196933 ) ) ( not ( = ?auto_196935 ?auto_196936 ) ) ( not ( = ?auto_196938 ?auto_196933 ) ) ( not ( = ?auto_196938 ?auto_196936 ) ) ( not ( = ?auto_196933 ?auto_196936 ) ) ( not ( = ?auto_196931 ?auto_196933 ) ) ( not ( = ?auto_196931 ?auto_196939 ) ) ( not ( = ?auto_196931 ?auto_196935 ) ) ( not ( = ?auto_196931 ?auto_196938 ) ) ( not ( = ?auto_196932 ?auto_196933 ) ) ( not ( = ?auto_196932 ?auto_196939 ) ) ( not ( = ?auto_196932 ?auto_196935 ) ) ( not ( = ?auto_196932 ?auto_196938 ) ) ( not ( = ?auto_196937 ?auto_196933 ) ) ( not ( = ?auto_196937 ?auto_196939 ) ) ( not ( = ?auto_196937 ?auto_196935 ) ) ( not ( = ?auto_196937 ?auto_196938 ) ) ( not ( = ?auto_196934 ?auto_196933 ) ) ( not ( = ?auto_196934 ?auto_196939 ) ) ( not ( = ?auto_196934 ?auto_196935 ) ) ( not ( = ?auto_196934 ?auto_196938 ) ) ( ON ?auto_196936 ?auto_196934 ) ( ON ?auto_196933 ?auto_196936 ) ( ON ?auto_196938 ?auto_196933 ) ( ON ?auto_196935 ?auto_196938 ) ( CLEAR ?auto_196935 ) ( HOLDING ?auto_196939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196939 )
      ( MAKE-2PILE ?auto_196931 ?auto_196932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_196940 - BLOCK
      ?auto_196941 - BLOCK
    )
    :vars
    (
      ?auto_196947 - BLOCK
      ?auto_196944 - BLOCK
      ?auto_196948 - BLOCK
      ?auto_196943 - BLOCK
      ?auto_196942 - BLOCK
      ?auto_196945 - BLOCK
      ?auto_196946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_196947 ?auto_196941 ) ( ON-TABLE ?auto_196940 ) ( ON ?auto_196941 ?auto_196940 ) ( not ( = ?auto_196940 ?auto_196941 ) ) ( not ( = ?auto_196940 ?auto_196947 ) ) ( not ( = ?auto_196941 ?auto_196947 ) ) ( not ( = ?auto_196940 ?auto_196944 ) ) ( not ( = ?auto_196940 ?auto_196948 ) ) ( not ( = ?auto_196941 ?auto_196944 ) ) ( not ( = ?auto_196941 ?auto_196948 ) ) ( not ( = ?auto_196947 ?auto_196944 ) ) ( not ( = ?auto_196947 ?auto_196948 ) ) ( not ( = ?auto_196944 ?auto_196948 ) ) ( ON ?auto_196944 ?auto_196947 ) ( not ( = ?auto_196943 ?auto_196942 ) ) ( not ( = ?auto_196943 ?auto_196945 ) ) ( not ( = ?auto_196943 ?auto_196946 ) ) ( not ( = ?auto_196943 ?auto_196948 ) ) ( not ( = ?auto_196942 ?auto_196945 ) ) ( not ( = ?auto_196942 ?auto_196946 ) ) ( not ( = ?auto_196942 ?auto_196948 ) ) ( not ( = ?auto_196945 ?auto_196946 ) ) ( not ( = ?auto_196945 ?auto_196948 ) ) ( not ( = ?auto_196946 ?auto_196948 ) ) ( not ( = ?auto_196940 ?auto_196946 ) ) ( not ( = ?auto_196940 ?auto_196943 ) ) ( not ( = ?auto_196940 ?auto_196942 ) ) ( not ( = ?auto_196940 ?auto_196945 ) ) ( not ( = ?auto_196941 ?auto_196946 ) ) ( not ( = ?auto_196941 ?auto_196943 ) ) ( not ( = ?auto_196941 ?auto_196942 ) ) ( not ( = ?auto_196941 ?auto_196945 ) ) ( not ( = ?auto_196947 ?auto_196946 ) ) ( not ( = ?auto_196947 ?auto_196943 ) ) ( not ( = ?auto_196947 ?auto_196942 ) ) ( not ( = ?auto_196947 ?auto_196945 ) ) ( not ( = ?auto_196944 ?auto_196946 ) ) ( not ( = ?auto_196944 ?auto_196943 ) ) ( not ( = ?auto_196944 ?auto_196942 ) ) ( not ( = ?auto_196944 ?auto_196945 ) ) ( ON ?auto_196948 ?auto_196944 ) ( ON ?auto_196946 ?auto_196948 ) ( ON ?auto_196945 ?auto_196946 ) ( ON ?auto_196942 ?auto_196945 ) ( ON ?auto_196943 ?auto_196942 ) ( CLEAR ?auto_196943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196940 ?auto_196941 ?auto_196947 ?auto_196944 ?auto_196948 ?auto_196946 ?auto_196945 ?auto_196942 )
      ( MAKE-2PILE ?auto_196940 ?auto_196941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196956 - BLOCK
      ?auto_196957 - BLOCK
      ?auto_196958 - BLOCK
      ?auto_196959 - BLOCK
      ?auto_196960 - BLOCK
      ?auto_196961 - BLOCK
      ?auto_196962 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_196962 ) ( CLEAR ?auto_196961 ) ( ON-TABLE ?auto_196956 ) ( ON ?auto_196957 ?auto_196956 ) ( ON ?auto_196958 ?auto_196957 ) ( ON ?auto_196959 ?auto_196958 ) ( ON ?auto_196960 ?auto_196959 ) ( ON ?auto_196961 ?auto_196960 ) ( not ( = ?auto_196956 ?auto_196957 ) ) ( not ( = ?auto_196956 ?auto_196958 ) ) ( not ( = ?auto_196956 ?auto_196959 ) ) ( not ( = ?auto_196956 ?auto_196960 ) ) ( not ( = ?auto_196956 ?auto_196961 ) ) ( not ( = ?auto_196956 ?auto_196962 ) ) ( not ( = ?auto_196957 ?auto_196958 ) ) ( not ( = ?auto_196957 ?auto_196959 ) ) ( not ( = ?auto_196957 ?auto_196960 ) ) ( not ( = ?auto_196957 ?auto_196961 ) ) ( not ( = ?auto_196957 ?auto_196962 ) ) ( not ( = ?auto_196958 ?auto_196959 ) ) ( not ( = ?auto_196958 ?auto_196960 ) ) ( not ( = ?auto_196958 ?auto_196961 ) ) ( not ( = ?auto_196958 ?auto_196962 ) ) ( not ( = ?auto_196959 ?auto_196960 ) ) ( not ( = ?auto_196959 ?auto_196961 ) ) ( not ( = ?auto_196959 ?auto_196962 ) ) ( not ( = ?auto_196960 ?auto_196961 ) ) ( not ( = ?auto_196960 ?auto_196962 ) ) ( not ( = ?auto_196961 ?auto_196962 ) ) )
    :subtasks
    ( ( !STACK ?auto_196962 ?auto_196961 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196963 - BLOCK
      ?auto_196964 - BLOCK
      ?auto_196965 - BLOCK
      ?auto_196966 - BLOCK
      ?auto_196967 - BLOCK
      ?auto_196968 - BLOCK
      ?auto_196969 - BLOCK
    )
    :vars
    (
      ?auto_196970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_196968 ) ( ON-TABLE ?auto_196963 ) ( ON ?auto_196964 ?auto_196963 ) ( ON ?auto_196965 ?auto_196964 ) ( ON ?auto_196966 ?auto_196965 ) ( ON ?auto_196967 ?auto_196966 ) ( ON ?auto_196968 ?auto_196967 ) ( not ( = ?auto_196963 ?auto_196964 ) ) ( not ( = ?auto_196963 ?auto_196965 ) ) ( not ( = ?auto_196963 ?auto_196966 ) ) ( not ( = ?auto_196963 ?auto_196967 ) ) ( not ( = ?auto_196963 ?auto_196968 ) ) ( not ( = ?auto_196963 ?auto_196969 ) ) ( not ( = ?auto_196964 ?auto_196965 ) ) ( not ( = ?auto_196964 ?auto_196966 ) ) ( not ( = ?auto_196964 ?auto_196967 ) ) ( not ( = ?auto_196964 ?auto_196968 ) ) ( not ( = ?auto_196964 ?auto_196969 ) ) ( not ( = ?auto_196965 ?auto_196966 ) ) ( not ( = ?auto_196965 ?auto_196967 ) ) ( not ( = ?auto_196965 ?auto_196968 ) ) ( not ( = ?auto_196965 ?auto_196969 ) ) ( not ( = ?auto_196966 ?auto_196967 ) ) ( not ( = ?auto_196966 ?auto_196968 ) ) ( not ( = ?auto_196966 ?auto_196969 ) ) ( not ( = ?auto_196967 ?auto_196968 ) ) ( not ( = ?auto_196967 ?auto_196969 ) ) ( not ( = ?auto_196968 ?auto_196969 ) ) ( ON ?auto_196969 ?auto_196970 ) ( CLEAR ?auto_196969 ) ( HAND-EMPTY ) ( not ( = ?auto_196963 ?auto_196970 ) ) ( not ( = ?auto_196964 ?auto_196970 ) ) ( not ( = ?auto_196965 ?auto_196970 ) ) ( not ( = ?auto_196966 ?auto_196970 ) ) ( not ( = ?auto_196967 ?auto_196970 ) ) ( not ( = ?auto_196968 ?auto_196970 ) ) ( not ( = ?auto_196969 ?auto_196970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196969 ?auto_196970 )
      ( MAKE-7PILE ?auto_196963 ?auto_196964 ?auto_196965 ?auto_196966 ?auto_196967 ?auto_196968 ?auto_196969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196971 - BLOCK
      ?auto_196972 - BLOCK
      ?auto_196973 - BLOCK
      ?auto_196974 - BLOCK
      ?auto_196975 - BLOCK
      ?auto_196976 - BLOCK
      ?auto_196977 - BLOCK
    )
    :vars
    (
      ?auto_196978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196971 ) ( ON ?auto_196972 ?auto_196971 ) ( ON ?auto_196973 ?auto_196972 ) ( ON ?auto_196974 ?auto_196973 ) ( ON ?auto_196975 ?auto_196974 ) ( not ( = ?auto_196971 ?auto_196972 ) ) ( not ( = ?auto_196971 ?auto_196973 ) ) ( not ( = ?auto_196971 ?auto_196974 ) ) ( not ( = ?auto_196971 ?auto_196975 ) ) ( not ( = ?auto_196971 ?auto_196976 ) ) ( not ( = ?auto_196971 ?auto_196977 ) ) ( not ( = ?auto_196972 ?auto_196973 ) ) ( not ( = ?auto_196972 ?auto_196974 ) ) ( not ( = ?auto_196972 ?auto_196975 ) ) ( not ( = ?auto_196972 ?auto_196976 ) ) ( not ( = ?auto_196972 ?auto_196977 ) ) ( not ( = ?auto_196973 ?auto_196974 ) ) ( not ( = ?auto_196973 ?auto_196975 ) ) ( not ( = ?auto_196973 ?auto_196976 ) ) ( not ( = ?auto_196973 ?auto_196977 ) ) ( not ( = ?auto_196974 ?auto_196975 ) ) ( not ( = ?auto_196974 ?auto_196976 ) ) ( not ( = ?auto_196974 ?auto_196977 ) ) ( not ( = ?auto_196975 ?auto_196976 ) ) ( not ( = ?auto_196975 ?auto_196977 ) ) ( not ( = ?auto_196976 ?auto_196977 ) ) ( ON ?auto_196977 ?auto_196978 ) ( CLEAR ?auto_196977 ) ( not ( = ?auto_196971 ?auto_196978 ) ) ( not ( = ?auto_196972 ?auto_196978 ) ) ( not ( = ?auto_196973 ?auto_196978 ) ) ( not ( = ?auto_196974 ?auto_196978 ) ) ( not ( = ?auto_196975 ?auto_196978 ) ) ( not ( = ?auto_196976 ?auto_196978 ) ) ( not ( = ?auto_196977 ?auto_196978 ) ) ( HOLDING ?auto_196976 ) ( CLEAR ?auto_196975 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196971 ?auto_196972 ?auto_196973 ?auto_196974 ?auto_196975 ?auto_196976 )
      ( MAKE-7PILE ?auto_196971 ?auto_196972 ?auto_196973 ?auto_196974 ?auto_196975 ?auto_196976 ?auto_196977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196979 - BLOCK
      ?auto_196980 - BLOCK
      ?auto_196981 - BLOCK
      ?auto_196982 - BLOCK
      ?auto_196983 - BLOCK
      ?auto_196984 - BLOCK
      ?auto_196985 - BLOCK
    )
    :vars
    (
      ?auto_196986 - BLOCK
      ?auto_196987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196979 ) ( ON ?auto_196980 ?auto_196979 ) ( ON ?auto_196981 ?auto_196980 ) ( ON ?auto_196982 ?auto_196981 ) ( ON ?auto_196983 ?auto_196982 ) ( not ( = ?auto_196979 ?auto_196980 ) ) ( not ( = ?auto_196979 ?auto_196981 ) ) ( not ( = ?auto_196979 ?auto_196982 ) ) ( not ( = ?auto_196979 ?auto_196983 ) ) ( not ( = ?auto_196979 ?auto_196984 ) ) ( not ( = ?auto_196979 ?auto_196985 ) ) ( not ( = ?auto_196980 ?auto_196981 ) ) ( not ( = ?auto_196980 ?auto_196982 ) ) ( not ( = ?auto_196980 ?auto_196983 ) ) ( not ( = ?auto_196980 ?auto_196984 ) ) ( not ( = ?auto_196980 ?auto_196985 ) ) ( not ( = ?auto_196981 ?auto_196982 ) ) ( not ( = ?auto_196981 ?auto_196983 ) ) ( not ( = ?auto_196981 ?auto_196984 ) ) ( not ( = ?auto_196981 ?auto_196985 ) ) ( not ( = ?auto_196982 ?auto_196983 ) ) ( not ( = ?auto_196982 ?auto_196984 ) ) ( not ( = ?auto_196982 ?auto_196985 ) ) ( not ( = ?auto_196983 ?auto_196984 ) ) ( not ( = ?auto_196983 ?auto_196985 ) ) ( not ( = ?auto_196984 ?auto_196985 ) ) ( ON ?auto_196985 ?auto_196986 ) ( not ( = ?auto_196979 ?auto_196986 ) ) ( not ( = ?auto_196980 ?auto_196986 ) ) ( not ( = ?auto_196981 ?auto_196986 ) ) ( not ( = ?auto_196982 ?auto_196986 ) ) ( not ( = ?auto_196983 ?auto_196986 ) ) ( not ( = ?auto_196984 ?auto_196986 ) ) ( not ( = ?auto_196985 ?auto_196986 ) ) ( CLEAR ?auto_196983 ) ( ON ?auto_196984 ?auto_196985 ) ( CLEAR ?auto_196984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196987 ) ( ON ?auto_196986 ?auto_196987 ) ( not ( = ?auto_196987 ?auto_196986 ) ) ( not ( = ?auto_196987 ?auto_196985 ) ) ( not ( = ?auto_196987 ?auto_196984 ) ) ( not ( = ?auto_196979 ?auto_196987 ) ) ( not ( = ?auto_196980 ?auto_196987 ) ) ( not ( = ?auto_196981 ?auto_196987 ) ) ( not ( = ?auto_196982 ?auto_196987 ) ) ( not ( = ?auto_196983 ?auto_196987 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196987 ?auto_196986 ?auto_196985 )
      ( MAKE-7PILE ?auto_196979 ?auto_196980 ?auto_196981 ?auto_196982 ?auto_196983 ?auto_196984 ?auto_196985 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196988 - BLOCK
      ?auto_196989 - BLOCK
      ?auto_196990 - BLOCK
      ?auto_196991 - BLOCK
      ?auto_196992 - BLOCK
      ?auto_196993 - BLOCK
      ?auto_196994 - BLOCK
    )
    :vars
    (
      ?auto_196995 - BLOCK
      ?auto_196996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196988 ) ( ON ?auto_196989 ?auto_196988 ) ( ON ?auto_196990 ?auto_196989 ) ( ON ?auto_196991 ?auto_196990 ) ( not ( = ?auto_196988 ?auto_196989 ) ) ( not ( = ?auto_196988 ?auto_196990 ) ) ( not ( = ?auto_196988 ?auto_196991 ) ) ( not ( = ?auto_196988 ?auto_196992 ) ) ( not ( = ?auto_196988 ?auto_196993 ) ) ( not ( = ?auto_196988 ?auto_196994 ) ) ( not ( = ?auto_196989 ?auto_196990 ) ) ( not ( = ?auto_196989 ?auto_196991 ) ) ( not ( = ?auto_196989 ?auto_196992 ) ) ( not ( = ?auto_196989 ?auto_196993 ) ) ( not ( = ?auto_196989 ?auto_196994 ) ) ( not ( = ?auto_196990 ?auto_196991 ) ) ( not ( = ?auto_196990 ?auto_196992 ) ) ( not ( = ?auto_196990 ?auto_196993 ) ) ( not ( = ?auto_196990 ?auto_196994 ) ) ( not ( = ?auto_196991 ?auto_196992 ) ) ( not ( = ?auto_196991 ?auto_196993 ) ) ( not ( = ?auto_196991 ?auto_196994 ) ) ( not ( = ?auto_196992 ?auto_196993 ) ) ( not ( = ?auto_196992 ?auto_196994 ) ) ( not ( = ?auto_196993 ?auto_196994 ) ) ( ON ?auto_196994 ?auto_196995 ) ( not ( = ?auto_196988 ?auto_196995 ) ) ( not ( = ?auto_196989 ?auto_196995 ) ) ( not ( = ?auto_196990 ?auto_196995 ) ) ( not ( = ?auto_196991 ?auto_196995 ) ) ( not ( = ?auto_196992 ?auto_196995 ) ) ( not ( = ?auto_196993 ?auto_196995 ) ) ( not ( = ?auto_196994 ?auto_196995 ) ) ( ON ?auto_196993 ?auto_196994 ) ( CLEAR ?auto_196993 ) ( ON-TABLE ?auto_196996 ) ( ON ?auto_196995 ?auto_196996 ) ( not ( = ?auto_196996 ?auto_196995 ) ) ( not ( = ?auto_196996 ?auto_196994 ) ) ( not ( = ?auto_196996 ?auto_196993 ) ) ( not ( = ?auto_196988 ?auto_196996 ) ) ( not ( = ?auto_196989 ?auto_196996 ) ) ( not ( = ?auto_196990 ?auto_196996 ) ) ( not ( = ?auto_196991 ?auto_196996 ) ) ( not ( = ?auto_196992 ?auto_196996 ) ) ( HOLDING ?auto_196992 ) ( CLEAR ?auto_196991 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196988 ?auto_196989 ?auto_196990 ?auto_196991 ?auto_196992 )
      ( MAKE-7PILE ?auto_196988 ?auto_196989 ?auto_196990 ?auto_196991 ?auto_196992 ?auto_196993 ?auto_196994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_196997 - BLOCK
      ?auto_196998 - BLOCK
      ?auto_196999 - BLOCK
      ?auto_197000 - BLOCK
      ?auto_197001 - BLOCK
      ?auto_197002 - BLOCK
      ?auto_197003 - BLOCK
    )
    :vars
    (
      ?auto_197004 - BLOCK
      ?auto_197005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196997 ) ( ON ?auto_196998 ?auto_196997 ) ( ON ?auto_196999 ?auto_196998 ) ( ON ?auto_197000 ?auto_196999 ) ( not ( = ?auto_196997 ?auto_196998 ) ) ( not ( = ?auto_196997 ?auto_196999 ) ) ( not ( = ?auto_196997 ?auto_197000 ) ) ( not ( = ?auto_196997 ?auto_197001 ) ) ( not ( = ?auto_196997 ?auto_197002 ) ) ( not ( = ?auto_196997 ?auto_197003 ) ) ( not ( = ?auto_196998 ?auto_196999 ) ) ( not ( = ?auto_196998 ?auto_197000 ) ) ( not ( = ?auto_196998 ?auto_197001 ) ) ( not ( = ?auto_196998 ?auto_197002 ) ) ( not ( = ?auto_196998 ?auto_197003 ) ) ( not ( = ?auto_196999 ?auto_197000 ) ) ( not ( = ?auto_196999 ?auto_197001 ) ) ( not ( = ?auto_196999 ?auto_197002 ) ) ( not ( = ?auto_196999 ?auto_197003 ) ) ( not ( = ?auto_197000 ?auto_197001 ) ) ( not ( = ?auto_197000 ?auto_197002 ) ) ( not ( = ?auto_197000 ?auto_197003 ) ) ( not ( = ?auto_197001 ?auto_197002 ) ) ( not ( = ?auto_197001 ?auto_197003 ) ) ( not ( = ?auto_197002 ?auto_197003 ) ) ( ON ?auto_197003 ?auto_197004 ) ( not ( = ?auto_196997 ?auto_197004 ) ) ( not ( = ?auto_196998 ?auto_197004 ) ) ( not ( = ?auto_196999 ?auto_197004 ) ) ( not ( = ?auto_197000 ?auto_197004 ) ) ( not ( = ?auto_197001 ?auto_197004 ) ) ( not ( = ?auto_197002 ?auto_197004 ) ) ( not ( = ?auto_197003 ?auto_197004 ) ) ( ON ?auto_197002 ?auto_197003 ) ( ON-TABLE ?auto_197005 ) ( ON ?auto_197004 ?auto_197005 ) ( not ( = ?auto_197005 ?auto_197004 ) ) ( not ( = ?auto_197005 ?auto_197003 ) ) ( not ( = ?auto_197005 ?auto_197002 ) ) ( not ( = ?auto_196997 ?auto_197005 ) ) ( not ( = ?auto_196998 ?auto_197005 ) ) ( not ( = ?auto_196999 ?auto_197005 ) ) ( not ( = ?auto_197000 ?auto_197005 ) ) ( not ( = ?auto_197001 ?auto_197005 ) ) ( CLEAR ?auto_197000 ) ( ON ?auto_197001 ?auto_197002 ) ( CLEAR ?auto_197001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197005 ?auto_197004 ?auto_197003 ?auto_197002 )
      ( MAKE-7PILE ?auto_196997 ?auto_196998 ?auto_196999 ?auto_197000 ?auto_197001 ?auto_197002 ?auto_197003 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197006 - BLOCK
      ?auto_197007 - BLOCK
      ?auto_197008 - BLOCK
      ?auto_197009 - BLOCK
      ?auto_197010 - BLOCK
      ?auto_197011 - BLOCK
      ?auto_197012 - BLOCK
    )
    :vars
    (
      ?auto_197014 - BLOCK
      ?auto_197013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197006 ) ( ON ?auto_197007 ?auto_197006 ) ( ON ?auto_197008 ?auto_197007 ) ( not ( = ?auto_197006 ?auto_197007 ) ) ( not ( = ?auto_197006 ?auto_197008 ) ) ( not ( = ?auto_197006 ?auto_197009 ) ) ( not ( = ?auto_197006 ?auto_197010 ) ) ( not ( = ?auto_197006 ?auto_197011 ) ) ( not ( = ?auto_197006 ?auto_197012 ) ) ( not ( = ?auto_197007 ?auto_197008 ) ) ( not ( = ?auto_197007 ?auto_197009 ) ) ( not ( = ?auto_197007 ?auto_197010 ) ) ( not ( = ?auto_197007 ?auto_197011 ) ) ( not ( = ?auto_197007 ?auto_197012 ) ) ( not ( = ?auto_197008 ?auto_197009 ) ) ( not ( = ?auto_197008 ?auto_197010 ) ) ( not ( = ?auto_197008 ?auto_197011 ) ) ( not ( = ?auto_197008 ?auto_197012 ) ) ( not ( = ?auto_197009 ?auto_197010 ) ) ( not ( = ?auto_197009 ?auto_197011 ) ) ( not ( = ?auto_197009 ?auto_197012 ) ) ( not ( = ?auto_197010 ?auto_197011 ) ) ( not ( = ?auto_197010 ?auto_197012 ) ) ( not ( = ?auto_197011 ?auto_197012 ) ) ( ON ?auto_197012 ?auto_197014 ) ( not ( = ?auto_197006 ?auto_197014 ) ) ( not ( = ?auto_197007 ?auto_197014 ) ) ( not ( = ?auto_197008 ?auto_197014 ) ) ( not ( = ?auto_197009 ?auto_197014 ) ) ( not ( = ?auto_197010 ?auto_197014 ) ) ( not ( = ?auto_197011 ?auto_197014 ) ) ( not ( = ?auto_197012 ?auto_197014 ) ) ( ON ?auto_197011 ?auto_197012 ) ( ON-TABLE ?auto_197013 ) ( ON ?auto_197014 ?auto_197013 ) ( not ( = ?auto_197013 ?auto_197014 ) ) ( not ( = ?auto_197013 ?auto_197012 ) ) ( not ( = ?auto_197013 ?auto_197011 ) ) ( not ( = ?auto_197006 ?auto_197013 ) ) ( not ( = ?auto_197007 ?auto_197013 ) ) ( not ( = ?auto_197008 ?auto_197013 ) ) ( not ( = ?auto_197009 ?auto_197013 ) ) ( not ( = ?auto_197010 ?auto_197013 ) ) ( ON ?auto_197010 ?auto_197011 ) ( CLEAR ?auto_197010 ) ( HOLDING ?auto_197009 ) ( CLEAR ?auto_197008 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197006 ?auto_197007 ?auto_197008 ?auto_197009 )
      ( MAKE-7PILE ?auto_197006 ?auto_197007 ?auto_197008 ?auto_197009 ?auto_197010 ?auto_197011 ?auto_197012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197015 - BLOCK
      ?auto_197016 - BLOCK
      ?auto_197017 - BLOCK
      ?auto_197018 - BLOCK
      ?auto_197019 - BLOCK
      ?auto_197020 - BLOCK
      ?auto_197021 - BLOCK
    )
    :vars
    (
      ?auto_197023 - BLOCK
      ?auto_197022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197015 ) ( ON ?auto_197016 ?auto_197015 ) ( ON ?auto_197017 ?auto_197016 ) ( not ( = ?auto_197015 ?auto_197016 ) ) ( not ( = ?auto_197015 ?auto_197017 ) ) ( not ( = ?auto_197015 ?auto_197018 ) ) ( not ( = ?auto_197015 ?auto_197019 ) ) ( not ( = ?auto_197015 ?auto_197020 ) ) ( not ( = ?auto_197015 ?auto_197021 ) ) ( not ( = ?auto_197016 ?auto_197017 ) ) ( not ( = ?auto_197016 ?auto_197018 ) ) ( not ( = ?auto_197016 ?auto_197019 ) ) ( not ( = ?auto_197016 ?auto_197020 ) ) ( not ( = ?auto_197016 ?auto_197021 ) ) ( not ( = ?auto_197017 ?auto_197018 ) ) ( not ( = ?auto_197017 ?auto_197019 ) ) ( not ( = ?auto_197017 ?auto_197020 ) ) ( not ( = ?auto_197017 ?auto_197021 ) ) ( not ( = ?auto_197018 ?auto_197019 ) ) ( not ( = ?auto_197018 ?auto_197020 ) ) ( not ( = ?auto_197018 ?auto_197021 ) ) ( not ( = ?auto_197019 ?auto_197020 ) ) ( not ( = ?auto_197019 ?auto_197021 ) ) ( not ( = ?auto_197020 ?auto_197021 ) ) ( ON ?auto_197021 ?auto_197023 ) ( not ( = ?auto_197015 ?auto_197023 ) ) ( not ( = ?auto_197016 ?auto_197023 ) ) ( not ( = ?auto_197017 ?auto_197023 ) ) ( not ( = ?auto_197018 ?auto_197023 ) ) ( not ( = ?auto_197019 ?auto_197023 ) ) ( not ( = ?auto_197020 ?auto_197023 ) ) ( not ( = ?auto_197021 ?auto_197023 ) ) ( ON ?auto_197020 ?auto_197021 ) ( ON-TABLE ?auto_197022 ) ( ON ?auto_197023 ?auto_197022 ) ( not ( = ?auto_197022 ?auto_197023 ) ) ( not ( = ?auto_197022 ?auto_197021 ) ) ( not ( = ?auto_197022 ?auto_197020 ) ) ( not ( = ?auto_197015 ?auto_197022 ) ) ( not ( = ?auto_197016 ?auto_197022 ) ) ( not ( = ?auto_197017 ?auto_197022 ) ) ( not ( = ?auto_197018 ?auto_197022 ) ) ( not ( = ?auto_197019 ?auto_197022 ) ) ( ON ?auto_197019 ?auto_197020 ) ( CLEAR ?auto_197017 ) ( ON ?auto_197018 ?auto_197019 ) ( CLEAR ?auto_197018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197022 ?auto_197023 ?auto_197021 ?auto_197020 ?auto_197019 )
      ( MAKE-7PILE ?auto_197015 ?auto_197016 ?auto_197017 ?auto_197018 ?auto_197019 ?auto_197020 ?auto_197021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197024 - BLOCK
      ?auto_197025 - BLOCK
      ?auto_197026 - BLOCK
      ?auto_197027 - BLOCK
      ?auto_197028 - BLOCK
      ?auto_197029 - BLOCK
      ?auto_197030 - BLOCK
    )
    :vars
    (
      ?auto_197031 - BLOCK
      ?auto_197032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197024 ) ( ON ?auto_197025 ?auto_197024 ) ( not ( = ?auto_197024 ?auto_197025 ) ) ( not ( = ?auto_197024 ?auto_197026 ) ) ( not ( = ?auto_197024 ?auto_197027 ) ) ( not ( = ?auto_197024 ?auto_197028 ) ) ( not ( = ?auto_197024 ?auto_197029 ) ) ( not ( = ?auto_197024 ?auto_197030 ) ) ( not ( = ?auto_197025 ?auto_197026 ) ) ( not ( = ?auto_197025 ?auto_197027 ) ) ( not ( = ?auto_197025 ?auto_197028 ) ) ( not ( = ?auto_197025 ?auto_197029 ) ) ( not ( = ?auto_197025 ?auto_197030 ) ) ( not ( = ?auto_197026 ?auto_197027 ) ) ( not ( = ?auto_197026 ?auto_197028 ) ) ( not ( = ?auto_197026 ?auto_197029 ) ) ( not ( = ?auto_197026 ?auto_197030 ) ) ( not ( = ?auto_197027 ?auto_197028 ) ) ( not ( = ?auto_197027 ?auto_197029 ) ) ( not ( = ?auto_197027 ?auto_197030 ) ) ( not ( = ?auto_197028 ?auto_197029 ) ) ( not ( = ?auto_197028 ?auto_197030 ) ) ( not ( = ?auto_197029 ?auto_197030 ) ) ( ON ?auto_197030 ?auto_197031 ) ( not ( = ?auto_197024 ?auto_197031 ) ) ( not ( = ?auto_197025 ?auto_197031 ) ) ( not ( = ?auto_197026 ?auto_197031 ) ) ( not ( = ?auto_197027 ?auto_197031 ) ) ( not ( = ?auto_197028 ?auto_197031 ) ) ( not ( = ?auto_197029 ?auto_197031 ) ) ( not ( = ?auto_197030 ?auto_197031 ) ) ( ON ?auto_197029 ?auto_197030 ) ( ON-TABLE ?auto_197032 ) ( ON ?auto_197031 ?auto_197032 ) ( not ( = ?auto_197032 ?auto_197031 ) ) ( not ( = ?auto_197032 ?auto_197030 ) ) ( not ( = ?auto_197032 ?auto_197029 ) ) ( not ( = ?auto_197024 ?auto_197032 ) ) ( not ( = ?auto_197025 ?auto_197032 ) ) ( not ( = ?auto_197026 ?auto_197032 ) ) ( not ( = ?auto_197027 ?auto_197032 ) ) ( not ( = ?auto_197028 ?auto_197032 ) ) ( ON ?auto_197028 ?auto_197029 ) ( ON ?auto_197027 ?auto_197028 ) ( CLEAR ?auto_197027 ) ( HOLDING ?auto_197026 ) ( CLEAR ?auto_197025 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197024 ?auto_197025 ?auto_197026 )
      ( MAKE-7PILE ?auto_197024 ?auto_197025 ?auto_197026 ?auto_197027 ?auto_197028 ?auto_197029 ?auto_197030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197033 - BLOCK
      ?auto_197034 - BLOCK
      ?auto_197035 - BLOCK
      ?auto_197036 - BLOCK
      ?auto_197037 - BLOCK
      ?auto_197038 - BLOCK
      ?auto_197039 - BLOCK
    )
    :vars
    (
      ?auto_197041 - BLOCK
      ?auto_197040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197033 ) ( ON ?auto_197034 ?auto_197033 ) ( not ( = ?auto_197033 ?auto_197034 ) ) ( not ( = ?auto_197033 ?auto_197035 ) ) ( not ( = ?auto_197033 ?auto_197036 ) ) ( not ( = ?auto_197033 ?auto_197037 ) ) ( not ( = ?auto_197033 ?auto_197038 ) ) ( not ( = ?auto_197033 ?auto_197039 ) ) ( not ( = ?auto_197034 ?auto_197035 ) ) ( not ( = ?auto_197034 ?auto_197036 ) ) ( not ( = ?auto_197034 ?auto_197037 ) ) ( not ( = ?auto_197034 ?auto_197038 ) ) ( not ( = ?auto_197034 ?auto_197039 ) ) ( not ( = ?auto_197035 ?auto_197036 ) ) ( not ( = ?auto_197035 ?auto_197037 ) ) ( not ( = ?auto_197035 ?auto_197038 ) ) ( not ( = ?auto_197035 ?auto_197039 ) ) ( not ( = ?auto_197036 ?auto_197037 ) ) ( not ( = ?auto_197036 ?auto_197038 ) ) ( not ( = ?auto_197036 ?auto_197039 ) ) ( not ( = ?auto_197037 ?auto_197038 ) ) ( not ( = ?auto_197037 ?auto_197039 ) ) ( not ( = ?auto_197038 ?auto_197039 ) ) ( ON ?auto_197039 ?auto_197041 ) ( not ( = ?auto_197033 ?auto_197041 ) ) ( not ( = ?auto_197034 ?auto_197041 ) ) ( not ( = ?auto_197035 ?auto_197041 ) ) ( not ( = ?auto_197036 ?auto_197041 ) ) ( not ( = ?auto_197037 ?auto_197041 ) ) ( not ( = ?auto_197038 ?auto_197041 ) ) ( not ( = ?auto_197039 ?auto_197041 ) ) ( ON ?auto_197038 ?auto_197039 ) ( ON-TABLE ?auto_197040 ) ( ON ?auto_197041 ?auto_197040 ) ( not ( = ?auto_197040 ?auto_197041 ) ) ( not ( = ?auto_197040 ?auto_197039 ) ) ( not ( = ?auto_197040 ?auto_197038 ) ) ( not ( = ?auto_197033 ?auto_197040 ) ) ( not ( = ?auto_197034 ?auto_197040 ) ) ( not ( = ?auto_197035 ?auto_197040 ) ) ( not ( = ?auto_197036 ?auto_197040 ) ) ( not ( = ?auto_197037 ?auto_197040 ) ) ( ON ?auto_197037 ?auto_197038 ) ( ON ?auto_197036 ?auto_197037 ) ( CLEAR ?auto_197034 ) ( ON ?auto_197035 ?auto_197036 ) ( CLEAR ?auto_197035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197040 ?auto_197041 ?auto_197039 ?auto_197038 ?auto_197037 ?auto_197036 )
      ( MAKE-7PILE ?auto_197033 ?auto_197034 ?auto_197035 ?auto_197036 ?auto_197037 ?auto_197038 ?auto_197039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197042 - BLOCK
      ?auto_197043 - BLOCK
      ?auto_197044 - BLOCK
      ?auto_197045 - BLOCK
      ?auto_197046 - BLOCK
      ?auto_197047 - BLOCK
      ?auto_197048 - BLOCK
    )
    :vars
    (
      ?auto_197050 - BLOCK
      ?auto_197049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197042 ) ( not ( = ?auto_197042 ?auto_197043 ) ) ( not ( = ?auto_197042 ?auto_197044 ) ) ( not ( = ?auto_197042 ?auto_197045 ) ) ( not ( = ?auto_197042 ?auto_197046 ) ) ( not ( = ?auto_197042 ?auto_197047 ) ) ( not ( = ?auto_197042 ?auto_197048 ) ) ( not ( = ?auto_197043 ?auto_197044 ) ) ( not ( = ?auto_197043 ?auto_197045 ) ) ( not ( = ?auto_197043 ?auto_197046 ) ) ( not ( = ?auto_197043 ?auto_197047 ) ) ( not ( = ?auto_197043 ?auto_197048 ) ) ( not ( = ?auto_197044 ?auto_197045 ) ) ( not ( = ?auto_197044 ?auto_197046 ) ) ( not ( = ?auto_197044 ?auto_197047 ) ) ( not ( = ?auto_197044 ?auto_197048 ) ) ( not ( = ?auto_197045 ?auto_197046 ) ) ( not ( = ?auto_197045 ?auto_197047 ) ) ( not ( = ?auto_197045 ?auto_197048 ) ) ( not ( = ?auto_197046 ?auto_197047 ) ) ( not ( = ?auto_197046 ?auto_197048 ) ) ( not ( = ?auto_197047 ?auto_197048 ) ) ( ON ?auto_197048 ?auto_197050 ) ( not ( = ?auto_197042 ?auto_197050 ) ) ( not ( = ?auto_197043 ?auto_197050 ) ) ( not ( = ?auto_197044 ?auto_197050 ) ) ( not ( = ?auto_197045 ?auto_197050 ) ) ( not ( = ?auto_197046 ?auto_197050 ) ) ( not ( = ?auto_197047 ?auto_197050 ) ) ( not ( = ?auto_197048 ?auto_197050 ) ) ( ON ?auto_197047 ?auto_197048 ) ( ON-TABLE ?auto_197049 ) ( ON ?auto_197050 ?auto_197049 ) ( not ( = ?auto_197049 ?auto_197050 ) ) ( not ( = ?auto_197049 ?auto_197048 ) ) ( not ( = ?auto_197049 ?auto_197047 ) ) ( not ( = ?auto_197042 ?auto_197049 ) ) ( not ( = ?auto_197043 ?auto_197049 ) ) ( not ( = ?auto_197044 ?auto_197049 ) ) ( not ( = ?auto_197045 ?auto_197049 ) ) ( not ( = ?auto_197046 ?auto_197049 ) ) ( ON ?auto_197046 ?auto_197047 ) ( ON ?auto_197045 ?auto_197046 ) ( ON ?auto_197044 ?auto_197045 ) ( CLEAR ?auto_197044 ) ( HOLDING ?auto_197043 ) ( CLEAR ?auto_197042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197042 ?auto_197043 )
      ( MAKE-7PILE ?auto_197042 ?auto_197043 ?auto_197044 ?auto_197045 ?auto_197046 ?auto_197047 ?auto_197048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197051 - BLOCK
      ?auto_197052 - BLOCK
      ?auto_197053 - BLOCK
      ?auto_197054 - BLOCK
      ?auto_197055 - BLOCK
      ?auto_197056 - BLOCK
      ?auto_197057 - BLOCK
    )
    :vars
    (
      ?auto_197058 - BLOCK
      ?auto_197059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197051 ) ( not ( = ?auto_197051 ?auto_197052 ) ) ( not ( = ?auto_197051 ?auto_197053 ) ) ( not ( = ?auto_197051 ?auto_197054 ) ) ( not ( = ?auto_197051 ?auto_197055 ) ) ( not ( = ?auto_197051 ?auto_197056 ) ) ( not ( = ?auto_197051 ?auto_197057 ) ) ( not ( = ?auto_197052 ?auto_197053 ) ) ( not ( = ?auto_197052 ?auto_197054 ) ) ( not ( = ?auto_197052 ?auto_197055 ) ) ( not ( = ?auto_197052 ?auto_197056 ) ) ( not ( = ?auto_197052 ?auto_197057 ) ) ( not ( = ?auto_197053 ?auto_197054 ) ) ( not ( = ?auto_197053 ?auto_197055 ) ) ( not ( = ?auto_197053 ?auto_197056 ) ) ( not ( = ?auto_197053 ?auto_197057 ) ) ( not ( = ?auto_197054 ?auto_197055 ) ) ( not ( = ?auto_197054 ?auto_197056 ) ) ( not ( = ?auto_197054 ?auto_197057 ) ) ( not ( = ?auto_197055 ?auto_197056 ) ) ( not ( = ?auto_197055 ?auto_197057 ) ) ( not ( = ?auto_197056 ?auto_197057 ) ) ( ON ?auto_197057 ?auto_197058 ) ( not ( = ?auto_197051 ?auto_197058 ) ) ( not ( = ?auto_197052 ?auto_197058 ) ) ( not ( = ?auto_197053 ?auto_197058 ) ) ( not ( = ?auto_197054 ?auto_197058 ) ) ( not ( = ?auto_197055 ?auto_197058 ) ) ( not ( = ?auto_197056 ?auto_197058 ) ) ( not ( = ?auto_197057 ?auto_197058 ) ) ( ON ?auto_197056 ?auto_197057 ) ( ON-TABLE ?auto_197059 ) ( ON ?auto_197058 ?auto_197059 ) ( not ( = ?auto_197059 ?auto_197058 ) ) ( not ( = ?auto_197059 ?auto_197057 ) ) ( not ( = ?auto_197059 ?auto_197056 ) ) ( not ( = ?auto_197051 ?auto_197059 ) ) ( not ( = ?auto_197052 ?auto_197059 ) ) ( not ( = ?auto_197053 ?auto_197059 ) ) ( not ( = ?auto_197054 ?auto_197059 ) ) ( not ( = ?auto_197055 ?auto_197059 ) ) ( ON ?auto_197055 ?auto_197056 ) ( ON ?auto_197054 ?auto_197055 ) ( ON ?auto_197053 ?auto_197054 ) ( CLEAR ?auto_197051 ) ( ON ?auto_197052 ?auto_197053 ) ( CLEAR ?auto_197052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197059 ?auto_197058 ?auto_197057 ?auto_197056 ?auto_197055 ?auto_197054 ?auto_197053 )
      ( MAKE-7PILE ?auto_197051 ?auto_197052 ?auto_197053 ?auto_197054 ?auto_197055 ?auto_197056 ?auto_197057 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197060 - BLOCK
      ?auto_197061 - BLOCK
      ?auto_197062 - BLOCK
      ?auto_197063 - BLOCK
      ?auto_197064 - BLOCK
      ?auto_197065 - BLOCK
      ?auto_197066 - BLOCK
    )
    :vars
    (
      ?auto_197067 - BLOCK
      ?auto_197068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197060 ?auto_197061 ) ) ( not ( = ?auto_197060 ?auto_197062 ) ) ( not ( = ?auto_197060 ?auto_197063 ) ) ( not ( = ?auto_197060 ?auto_197064 ) ) ( not ( = ?auto_197060 ?auto_197065 ) ) ( not ( = ?auto_197060 ?auto_197066 ) ) ( not ( = ?auto_197061 ?auto_197062 ) ) ( not ( = ?auto_197061 ?auto_197063 ) ) ( not ( = ?auto_197061 ?auto_197064 ) ) ( not ( = ?auto_197061 ?auto_197065 ) ) ( not ( = ?auto_197061 ?auto_197066 ) ) ( not ( = ?auto_197062 ?auto_197063 ) ) ( not ( = ?auto_197062 ?auto_197064 ) ) ( not ( = ?auto_197062 ?auto_197065 ) ) ( not ( = ?auto_197062 ?auto_197066 ) ) ( not ( = ?auto_197063 ?auto_197064 ) ) ( not ( = ?auto_197063 ?auto_197065 ) ) ( not ( = ?auto_197063 ?auto_197066 ) ) ( not ( = ?auto_197064 ?auto_197065 ) ) ( not ( = ?auto_197064 ?auto_197066 ) ) ( not ( = ?auto_197065 ?auto_197066 ) ) ( ON ?auto_197066 ?auto_197067 ) ( not ( = ?auto_197060 ?auto_197067 ) ) ( not ( = ?auto_197061 ?auto_197067 ) ) ( not ( = ?auto_197062 ?auto_197067 ) ) ( not ( = ?auto_197063 ?auto_197067 ) ) ( not ( = ?auto_197064 ?auto_197067 ) ) ( not ( = ?auto_197065 ?auto_197067 ) ) ( not ( = ?auto_197066 ?auto_197067 ) ) ( ON ?auto_197065 ?auto_197066 ) ( ON-TABLE ?auto_197068 ) ( ON ?auto_197067 ?auto_197068 ) ( not ( = ?auto_197068 ?auto_197067 ) ) ( not ( = ?auto_197068 ?auto_197066 ) ) ( not ( = ?auto_197068 ?auto_197065 ) ) ( not ( = ?auto_197060 ?auto_197068 ) ) ( not ( = ?auto_197061 ?auto_197068 ) ) ( not ( = ?auto_197062 ?auto_197068 ) ) ( not ( = ?auto_197063 ?auto_197068 ) ) ( not ( = ?auto_197064 ?auto_197068 ) ) ( ON ?auto_197064 ?auto_197065 ) ( ON ?auto_197063 ?auto_197064 ) ( ON ?auto_197062 ?auto_197063 ) ( ON ?auto_197061 ?auto_197062 ) ( CLEAR ?auto_197061 ) ( HOLDING ?auto_197060 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197060 )
      ( MAKE-7PILE ?auto_197060 ?auto_197061 ?auto_197062 ?auto_197063 ?auto_197064 ?auto_197065 ?auto_197066 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197069 - BLOCK
      ?auto_197070 - BLOCK
      ?auto_197071 - BLOCK
      ?auto_197072 - BLOCK
      ?auto_197073 - BLOCK
      ?auto_197074 - BLOCK
      ?auto_197075 - BLOCK
    )
    :vars
    (
      ?auto_197077 - BLOCK
      ?auto_197076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197069 ?auto_197070 ) ) ( not ( = ?auto_197069 ?auto_197071 ) ) ( not ( = ?auto_197069 ?auto_197072 ) ) ( not ( = ?auto_197069 ?auto_197073 ) ) ( not ( = ?auto_197069 ?auto_197074 ) ) ( not ( = ?auto_197069 ?auto_197075 ) ) ( not ( = ?auto_197070 ?auto_197071 ) ) ( not ( = ?auto_197070 ?auto_197072 ) ) ( not ( = ?auto_197070 ?auto_197073 ) ) ( not ( = ?auto_197070 ?auto_197074 ) ) ( not ( = ?auto_197070 ?auto_197075 ) ) ( not ( = ?auto_197071 ?auto_197072 ) ) ( not ( = ?auto_197071 ?auto_197073 ) ) ( not ( = ?auto_197071 ?auto_197074 ) ) ( not ( = ?auto_197071 ?auto_197075 ) ) ( not ( = ?auto_197072 ?auto_197073 ) ) ( not ( = ?auto_197072 ?auto_197074 ) ) ( not ( = ?auto_197072 ?auto_197075 ) ) ( not ( = ?auto_197073 ?auto_197074 ) ) ( not ( = ?auto_197073 ?auto_197075 ) ) ( not ( = ?auto_197074 ?auto_197075 ) ) ( ON ?auto_197075 ?auto_197077 ) ( not ( = ?auto_197069 ?auto_197077 ) ) ( not ( = ?auto_197070 ?auto_197077 ) ) ( not ( = ?auto_197071 ?auto_197077 ) ) ( not ( = ?auto_197072 ?auto_197077 ) ) ( not ( = ?auto_197073 ?auto_197077 ) ) ( not ( = ?auto_197074 ?auto_197077 ) ) ( not ( = ?auto_197075 ?auto_197077 ) ) ( ON ?auto_197074 ?auto_197075 ) ( ON-TABLE ?auto_197076 ) ( ON ?auto_197077 ?auto_197076 ) ( not ( = ?auto_197076 ?auto_197077 ) ) ( not ( = ?auto_197076 ?auto_197075 ) ) ( not ( = ?auto_197076 ?auto_197074 ) ) ( not ( = ?auto_197069 ?auto_197076 ) ) ( not ( = ?auto_197070 ?auto_197076 ) ) ( not ( = ?auto_197071 ?auto_197076 ) ) ( not ( = ?auto_197072 ?auto_197076 ) ) ( not ( = ?auto_197073 ?auto_197076 ) ) ( ON ?auto_197073 ?auto_197074 ) ( ON ?auto_197072 ?auto_197073 ) ( ON ?auto_197071 ?auto_197072 ) ( ON ?auto_197070 ?auto_197071 ) ( ON ?auto_197069 ?auto_197070 ) ( CLEAR ?auto_197069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197076 ?auto_197077 ?auto_197075 ?auto_197074 ?auto_197073 ?auto_197072 ?auto_197071 ?auto_197070 )
      ( MAKE-7PILE ?auto_197069 ?auto_197070 ?auto_197071 ?auto_197072 ?auto_197073 ?auto_197074 ?auto_197075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197079 - BLOCK
    )
    :vars
    (
      ?auto_197080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197080 ?auto_197079 ) ( CLEAR ?auto_197080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197079 ) ( not ( = ?auto_197079 ?auto_197080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197080 ?auto_197079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197081 - BLOCK
    )
    :vars
    (
      ?auto_197082 - BLOCK
      ?auto_197083 - BLOCK
      ?auto_197084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197082 ?auto_197081 ) ( CLEAR ?auto_197082 ) ( ON-TABLE ?auto_197081 ) ( not ( = ?auto_197081 ?auto_197082 ) ) ( HOLDING ?auto_197083 ) ( CLEAR ?auto_197084 ) ( not ( = ?auto_197081 ?auto_197083 ) ) ( not ( = ?auto_197081 ?auto_197084 ) ) ( not ( = ?auto_197082 ?auto_197083 ) ) ( not ( = ?auto_197082 ?auto_197084 ) ) ( not ( = ?auto_197083 ?auto_197084 ) ) )
    :subtasks
    ( ( !STACK ?auto_197083 ?auto_197084 )
      ( MAKE-1PILE ?auto_197081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197085 - BLOCK
    )
    :vars
    (
      ?auto_197086 - BLOCK
      ?auto_197087 - BLOCK
      ?auto_197088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197086 ?auto_197085 ) ( ON-TABLE ?auto_197085 ) ( not ( = ?auto_197085 ?auto_197086 ) ) ( CLEAR ?auto_197087 ) ( not ( = ?auto_197085 ?auto_197088 ) ) ( not ( = ?auto_197085 ?auto_197087 ) ) ( not ( = ?auto_197086 ?auto_197088 ) ) ( not ( = ?auto_197086 ?auto_197087 ) ) ( not ( = ?auto_197088 ?auto_197087 ) ) ( ON ?auto_197088 ?auto_197086 ) ( CLEAR ?auto_197088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197085 ?auto_197086 )
      ( MAKE-1PILE ?auto_197085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197089 - BLOCK
    )
    :vars
    (
      ?auto_197091 - BLOCK
      ?auto_197090 - BLOCK
      ?auto_197092 - BLOCK
      ?auto_197093 - BLOCK
      ?auto_197097 - BLOCK
      ?auto_197095 - BLOCK
      ?auto_197094 - BLOCK
      ?auto_197096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197091 ?auto_197089 ) ( ON-TABLE ?auto_197089 ) ( not ( = ?auto_197089 ?auto_197091 ) ) ( not ( = ?auto_197089 ?auto_197090 ) ) ( not ( = ?auto_197089 ?auto_197092 ) ) ( not ( = ?auto_197091 ?auto_197090 ) ) ( not ( = ?auto_197091 ?auto_197092 ) ) ( not ( = ?auto_197090 ?auto_197092 ) ) ( ON ?auto_197090 ?auto_197091 ) ( CLEAR ?auto_197090 ) ( HOLDING ?auto_197092 ) ( CLEAR ?auto_197093 ) ( ON-TABLE ?auto_197097 ) ( ON ?auto_197095 ?auto_197097 ) ( ON ?auto_197094 ?auto_197095 ) ( ON ?auto_197096 ?auto_197094 ) ( ON ?auto_197093 ?auto_197096 ) ( not ( = ?auto_197097 ?auto_197095 ) ) ( not ( = ?auto_197097 ?auto_197094 ) ) ( not ( = ?auto_197097 ?auto_197096 ) ) ( not ( = ?auto_197097 ?auto_197093 ) ) ( not ( = ?auto_197097 ?auto_197092 ) ) ( not ( = ?auto_197095 ?auto_197094 ) ) ( not ( = ?auto_197095 ?auto_197096 ) ) ( not ( = ?auto_197095 ?auto_197093 ) ) ( not ( = ?auto_197095 ?auto_197092 ) ) ( not ( = ?auto_197094 ?auto_197096 ) ) ( not ( = ?auto_197094 ?auto_197093 ) ) ( not ( = ?auto_197094 ?auto_197092 ) ) ( not ( = ?auto_197096 ?auto_197093 ) ) ( not ( = ?auto_197096 ?auto_197092 ) ) ( not ( = ?auto_197093 ?auto_197092 ) ) ( not ( = ?auto_197089 ?auto_197093 ) ) ( not ( = ?auto_197089 ?auto_197097 ) ) ( not ( = ?auto_197089 ?auto_197095 ) ) ( not ( = ?auto_197089 ?auto_197094 ) ) ( not ( = ?auto_197089 ?auto_197096 ) ) ( not ( = ?auto_197091 ?auto_197093 ) ) ( not ( = ?auto_197091 ?auto_197097 ) ) ( not ( = ?auto_197091 ?auto_197095 ) ) ( not ( = ?auto_197091 ?auto_197094 ) ) ( not ( = ?auto_197091 ?auto_197096 ) ) ( not ( = ?auto_197090 ?auto_197093 ) ) ( not ( = ?auto_197090 ?auto_197097 ) ) ( not ( = ?auto_197090 ?auto_197095 ) ) ( not ( = ?auto_197090 ?auto_197094 ) ) ( not ( = ?auto_197090 ?auto_197096 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197097 ?auto_197095 ?auto_197094 ?auto_197096 ?auto_197093 ?auto_197092 )
      ( MAKE-1PILE ?auto_197089 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197098 - BLOCK
    )
    :vars
    (
      ?auto_197105 - BLOCK
      ?auto_197102 - BLOCK
      ?auto_197099 - BLOCK
      ?auto_197106 - BLOCK
      ?auto_197103 - BLOCK
      ?auto_197100 - BLOCK
      ?auto_197104 - BLOCK
      ?auto_197101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197105 ?auto_197098 ) ( ON-TABLE ?auto_197098 ) ( not ( = ?auto_197098 ?auto_197105 ) ) ( not ( = ?auto_197098 ?auto_197102 ) ) ( not ( = ?auto_197098 ?auto_197099 ) ) ( not ( = ?auto_197105 ?auto_197102 ) ) ( not ( = ?auto_197105 ?auto_197099 ) ) ( not ( = ?auto_197102 ?auto_197099 ) ) ( ON ?auto_197102 ?auto_197105 ) ( CLEAR ?auto_197106 ) ( ON-TABLE ?auto_197103 ) ( ON ?auto_197100 ?auto_197103 ) ( ON ?auto_197104 ?auto_197100 ) ( ON ?auto_197101 ?auto_197104 ) ( ON ?auto_197106 ?auto_197101 ) ( not ( = ?auto_197103 ?auto_197100 ) ) ( not ( = ?auto_197103 ?auto_197104 ) ) ( not ( = ?auto_197103 ?auto_197101 ) ) ( not ( = ?auto_197103 ?auto_197106 ) ) ( not ( = ?auto_197103 ?auto_197099 ) ) ( not ( = ?auto_197100 ?auto_197104 ) ) ( not ( = ?auto_197100 ?auto_197101 ) ) ( not ( = ?auto_197100 ?auto_197106 ) ) ( not ( = ?auto_197100 ?auto_197099 ) ) ( not ( = ?auto_197104 ?auto_197101 ) ) ( not ( = ?auto_197104 ?auto_197106 ) ) ( not ( = ?auto_197104 ?auto_197099 ) ) ( not ( = ?auto_197101 ?auto_197106 ) ) ( not ( = ?auto_197101 ?auto_197099 ) ) ( not ( = ?auto_197106 ?auto_197099 ) ) ( not ( = ?auto_197098 ?auto_197106 ) ) ( not ( = ?auto_197098 ?auto_197103 ) ) ( not ( = ?auto_197098 ?auto_197100 ) ) ( not ( = ?auto_197098 ?auto_197104 ) ) ( not ( = ?auto_197098 ?auto_197101 ) ) ( not ( = ?auto_197105 ?auto_197106 ) ) ( not ( = ?auto_197105 ?auto_197103 ) ) ( not ( = ?auto_197105 ?auto_197100 ) ) ( not ( = ?auto_197105 ?auto_197104 ) ) ( not ( = ?auto_197105 ?auto_197101 ) ) ( not ( = ?auto_197102 ?auto_197106 ) ) ( not ( = ?auto_197102 ?auto_197103 ) ) ( not ( = ?auto_197102 ?auto_197100 ) ) ( not ( = ?auto_197102 ?auto_197104 ) ) ( not ( = ?auto_197102 ?auto_197101 ) ) ( ON ?auto_197099 ?auto_197102 ) ( CLEAR ?auto_197099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197098 ?auto_197105 ?auto_197102 )
      ( MAKE-1PILE ?auto_197098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197107 - BLOCK
    )
    :vars
    (
      ?auto_197111 - BLOCK
      ?auto_197108 - BLOCK
      ?auto_197114 - BLOCK
      ?auto_197109 - BLOCK
      ?auto_197115 - BLOCK
      ?auto_197110 - BLOCK
      ?auto_197112 - BLOCK
      ?auto_197113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197111 ?auto_197107 ) ( ON-TABLE ?auto_197107 ) ( not ( = ?auto_197107 ?auto_197111 ) ) ( not ( = ?auto_197107 ?auto_197108 ) ) ( not ( = ?auto_197107 ?auto_197114 ) ) ( not ( = ?auto_197111 ?auto_197108 ) ) ( not ( = ?auto_197111 ?auto_197114 ) ) ( not ( = ?auto_197108 ?auto_197114 ) ) ( ON ?auto_197108 ?auto_197111 ) ( ON-TABLE ?auto_197109 ) ( ON ?auto_197115 ?auto_197109 ) ( ON ?auto_197110 ?auto_197115 ) ( ON ?auto_197112 ?auto_197110 ) ( not ( = ?auto_197109 ?auto_197115 ) ) ( not ( = ?auto_197109 ?auto_197110 ) ) ( not ( = ?auto_197109 ?auto_197112 ) ) ( not ( = ?auto_197109 ?auto_197113 ) ) ( not ( = ?auto_197109 ?auto_197114 ) ) ( not ( = ?auto_197115 ?auto_197110 ) ) ( not ( = ?auto_197115 ?auto_197112 ) ) ( not ( = ?auto_197115 ?auto_197113 ) ) ( not ( = ?auto_197115 ?auto_197114 ) ) ( not ( = ?auto_197110 ?auto_197112 ) ) ( not ( = ?auto_197110 ?auto_197113 ) ) ( not ( = ?auto_197110 ?auto_197114 ) ) ( not ( = ?auto_197112 ?auto_197113 ) ) ( not ( = ?auto_197112 ?auto_197114 ) ) ( not ( = ?auto_197113 ?auto_197114 ) ) ( not ( = ?auto_197107 ?auto_197113 ) ) ( not ( = ?auto_197107 ?auto_197109 ) ) ( not ( = ?auto_197107 ?auto_197115 ) ) ( not ( = ?auto_197107 ?auto_197110 ) ) ( not ( = ?auto_197107 ?auto_197112 ) ) ( not ( = ?auto_197111 ?auto_197113 ) ) ( not ( = ?auto_197111 ?auto_197109 ) ) ( not ( = ?auto_197111 ?auto_197115 ) ) ( not ( = ?auto_197111 ?auto_197110 ) ) ( not ( = ?auto_197111 ?auto_197112 ) ) ( not ( = ?auto_197108 ?auto_197113 ) ) ( not ( = ?auto_197108 ?auto_197109 ) ) ( not ( = ?auto_197108 ?auto_197115 ) ) ( not ( = ?auto_197108 ?auto_197110 ) ) ( not ( = ?auto_197108 ?auto_197112 ) ) ( ON ?auto_197114 ?auto_197108 ) ( CLEAR ?auto_197114 ) ( HOLDING ?auto_197113 ) ( CLEAR ?auto_197112 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197109 ?auto_197115 ?auto_197110 ?auto_197112 ?auto_197113 )
      ( MAKE-1PILE ?auto_197107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197116 - BLOCK
    )
    :vars
    (
      ?auto_197120 - BLOCK
      ?auto_197123 - BLOCK
      ?auto_197121 - BLOCK
      ?auto_197124 - BLOCK
      ?auto_197122 - BLOCK
      ?auto_197118 - BLOCK
      ?auto_197119 - BLOCK
      ?auto_197117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197120 ?auto_197116 ) ( ON-TABLE ?auto_197116 ) ( not ( = ?auto_197116 ?auto_197120 ) ) ( not ( = ?auto_197116 ?auto_197123 ) ) ( not ( = ?auto_197116 ?auto_197121 ) ) ( not ( = ?auto_197120 ?auto_197123 ) ) ( not ( = ?auto_197120 ?auto_197121 ) ) ( not ( = ?auto_197123 ?auto_197121 ) ) ( ON ?auto_197123 ?auto_197120 ) ( ON-TABLE ?auto_197124 ) ( ON ?auto_197122 ?auto_197124 ) ( ON ?auto_197118 ?auto_197122 ) ( ON ?auto_197119 ?auto_197118 ) ( not ( = ?auto_197124 ?auto_197122 ) ) ( not ( = ?auto_197124 ?auto_197118 ) ) ( not ( = ?auto_197124 ?auto_197119 ) ) ( not ( = ?auto_197124 ?auto_197117 ) ) ( not ( = ?auto_197124 ?auto_197121 ) ) ( not ( = ?auto_197122 ?auto_197118 ) ) ( not ( = ?auto_197122 ?auto_197119 ) ) ( not ( = ?auto_197122 ?auto_197117 ) ) ( not ( = ?auto_197122 ?auto_197121 ) ) ( not ( = ?auto_197118 ?auto_197119 ) ) ( not ( = ?auto_197118 ?auto_197117 ) ) ( not ( = ?auto_197118 ?auto_197121 ) ) ( not ( = ?auto_197119 ?auto_197117 ) ) ( not ( = ?auto_197119 ?auto_197121 ) ) ( not ( = ?auto_197117 ?auto_197121 ) ) ( not ( = ?auto_197116 ?auto_197117 ) ) ( not ( = ?auto_197116 ?auto_197124 ) ) ( not ( = ?auto_197116 ?auto_197122 ) ) ( not ( = ?auto_197116 ?auto_197118 ) ) ( not ( = ?auto_197116 ?auto_197119 ) ) ( not ( = ?auto_197120 ?auto_197117 ) ) ( not ( = ?auto_197120 ?auto_197124 ) ) ( not ( = ?auto_197120 ?auto_197122 ) ) ( not ( = ?auto_197120 ?auto_197118 ) ) ( not ( = ?auto_197120 ?auto_197119 ) ) ( not ( = ?auto_197123 ?auto_197117 ) ) ( not ( = ?auto_197123 ?auto_197124 ) ) ( not ( = ?auto_197123 ?auto_197122 ) ) ( not ( = ?auto_197123 ?auto_197118 ) ) ( not ( = ?auto_197123 ?auto_197119 ) ) ( ON ?auto_197121 ?auto_197123 ) ( CLEAR ?auto_197119 ) ( ON ?auto_197117 ?auto_197121 ) ( CLEAR ?auto_197117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197116 ?auto_197120 ?auto_197123 ?auto_197121 )
      ( MAKE-1PILE ?auto_197116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197125 - BLOCK
    )
    :vars
    (
      ?auto_197133 - BLOCK
      ?auto_197129 - BLOCK
      ?auto_197130 - BLOCK
      ?auto_197132 - BLOCK
      ?auto_197126 - BLOCK
      ?auto_197128 - BLOCK
      ?auto_197127 - BLOCK
      ?auto_197131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197133 ?auto_197125 ) ( ON-TABLE ?auto_197125 ) ( not ( = ?auto_197125 ?auto_197133 ) ) ( not ( = ?auto_197125 ?auto_197129 ) ) ( not ( = ?auto_197125 ?auto_197130 ) ) ( not ( = ?auto_197133 ?auto_197129 ) ) ( not ( = ?auto_197133 ?auto_197130 ) ) ( not ( = ?auto_197129 ?auto_197130 ) ) ( ON ?auto_197129 ?auto_197133 ) ( ON-TABLE ?auto_197132 ) ( ON ?auto_197126 ?auto_197132 ) ( ON ?auto_197128 ?auto_197126 ) ( not ( = ?auto_197132 ?auto_197126 ) ) ( not ( = ?auto_197132 ?auto_197128 ) ) ( not ( = ?auto_197132 ?auto_197127 ) ) ( not ( = ?auto_197132 ?auto_197131 ) ) ( not ( = ?auto_197132 ?auto_197130 ) ) ( not ( = ?auto_197126 ?auto_197128 ) ) ( not ( = ?auto_197126 ?auto_197127 ) ) ( not ( = ?auto_197126 ?auto_197131 ) ) ( not ( = ?auto_197126 ?auto_197130 ) ) ( not ( = ?auto_197128 ?auto_197127 ) ) ( not ( = ?auto_197128 ?auto_197131 ) ) ( not ( = ?auto_197128 ?auto_197130 ) ) ( not ( = ?auto_197127 ?auto_197131 ) ) ( not ( = ?auto_197127 ?auto_197130 ) ) ( not ( = ?auto_197131 ?auto_197130 ) ) ( not ( = ?auto_197125 ?auto_197131 ) ) ( not ( = ?auto_197125 ?auto_197132 ) ) ( not ( = ?auto_197125 ?auto_197126 ) ) ( not ( = ?auto_197125 ?auto_197128 ) ) ( not ( = ?auto_197125 ?auto_197127 ) ) ( not ( = ?auto_197133 ?auto_197131 ) ) ( not ( = ?auto_197133 ?auto_197132 ) ) ( not ( = ?auto_197133 ?auto_197126 ) ) ( not ( = ?auto_197133 ?auto_197128 ) ) ( not ( = ?auto_197133 ?auto_197127 ) ) ( not ( = ?auto_197129 ?auto_197131 ) ) ( not ( = ?auto_197129 ?auto_197132 ) ) ( not ( = ?auto_197129 ?auto_197126 ) ) ( not ( = ?auto_197129 ?auto_197128 ) ) ( not ( = ?auto_197129 ?auto_197127 ) ) ( ON ?auto_197130 ?auto_197129 ) ( ON ?auto_197131 ?auto_197130 ) ( CLEAR ?auto_197131 ) ( HOLDING ?auto_197127 ) ( CLEAR ?auto_197128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197132 ?auto_197126 ?auto_197128 ?auto_197127 )
      ( MAKE-1PILE ?auto_197125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197134 - BLOCK
    )
    :vars
    (
      ?auto_197137 - BLOCK
      ?auto_197140 - BLOCK
      ?auto_197135 - BLOCK
      ?auto_197138 - BLOCK
      ?auto_197141 - BLOCK
      ?auto_197139 - BLOCK
      ?auto_197142 - BLOCK
      ?auto_197136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197137 ?auto_197134 ) ( ON-TABLE ?auto_197134 ) ( not ( = ?auto_197134 ?auto_197137 ) ) ( not ( = ?auto_197134 ?auto_197140 ) ) ( not ( = ?auto_197134 ?auto_197135 ) ) ( not ( = ?auto_197137 ?auto_197140 ) ) ( not ( = ?auto_197137 ?auto_197135 ) ) ( not ( = ?auto_197140 ?auto_197135 ) ) ( ON ?auto_197140 ?auto_197137 ) ( ON-TABLE ?auto_197138 ) ( ON ?auto_197141 ?auto_197138 ) ( ON ?auto_197139 ?auto_197141 ) ( not ( = ?auto_197138 ?auto_197141 ) ) ( not ( = ?auto_197138 ?auto_197139 ) ) ( not ( = ?auto_197138 ?auto_197142 ) ) ( not ( = ?auto_197138 ?auto_197136 ) ) ( not ( = ?auto_197138 ?auto_197135 ) ) ( not ( = ?auto_197141 ?auto_197139 ) ) ( not ( = ?auto_197141 ?auto_197142 ) ) ( not ( = ?auto_197141 ?auto_197136 ) ) ( not ( = ?auto_197141 ?auto_197135 ) ) ( not ( = ?auto_197139 ?auto_197142 ) ) ( not ( = ?auto_197139 ?auto_197136 ) ) ( not ( = ?auto_197139 ?auto_197135 ) ) ( not ( = ?auto_197142 ?auto_197136 ) ) ( not ( = ?auto_197142 ?auto_197135 ) ) ( not ( = ?auto_197136 ?auto_197135 ) ) ( not ( = ?auto_197134 ?auto_197136 ) ) ( not ( = ?auto_197134 ?auto_197138 ) ) ( not ( = ?auto_197134 ?auto_197141 ) ) ( not ( = ?auto_197134 ?auto_197139 ) ) ( not ( = ?auto_197134 ?auto_197142 ) ) ( not ( = ?auto_197137 ?auto_197136 ) ) ( not ( = ?auto_197137 ?auto_197138 ) ) ( not ( = ?auto_197137 ?auto_197141 ) ) ( not ( = ?auto_197137 ?auto_197139 ) ) ( not ( = ?auto_197137 ?auto_197142 ) ) ( not ( = ?auto_197140 ?auto_197136 ) ) ( not ( = ?auto_197140 ?auto_197138 ) ) ( not ( = ?auto_197140 ?auto_197141 ) ) ( not ( = ?auto_197140 ?auto_197139 ) ) ( not ( = ?auto_197140 ?auto_197142 ) ) ( ON ?auto_197135 ?auto_197140 ) ( ON ?auto_197136 ?auto_197135 ) ( CLEAR ?auto_197139 ) ( ON ?auto_197142 ?auto_197136 ) ( CLEAR ?auto_197142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197134 ?auto_197137 ?auto_197140 ?auto_197135 ?auto_197136 )
      ( MAKE-1PILE ?auto_197134 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197143 - BLOCK
    )
    :vars
    (
      ?auto_197151 - BLOCK
      ?auto_197144 - BLOCK
      ?auto_197146 - BLOCK
      ?auto_197145 - BLOCK
      ?auto_197150 - BLOCK
      ?auto_197148 - BLOCK
      ?auto_197149 - BLOCK
      ?auto_197147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197151 ?auto_197143 ) ( ON-TABLE ?auto_197143 ) ( not ( = ?auto_197143 ?auto_197151 ) ) ( not ( = ?auto_197143 ?auto_197144 ) ) ( not ( = ?auto_197143 ?auto_197146 ) ) ( not ( = ?auto_197151 ?auto_197144 ) ) ( not ( = ?auto_197151 ?auto_197146 ) ) ( not ( = ?auto_197144 ?auto_197146 ) ) ( ON ?auto_197144 ?auto_197151 ) ( ON-TABLE ?auto_197145 ) ( ON ?auto_197150 ?auto_197145 ) ( not ( = ?auto_197145 ?auto_197150 ) ) ( not ( = ?auto_197145 ?auto_197148 ) ) ( not ( = ?auto_197145 ?auto_197149 ) ) ( not ( = ?auto_197145 ?auto_197147 ) ) ( not ( = ?auto_197145 ?auto_197146 ) ) ( not ( = ?auto_197150 ?auto_197148 ) ) ( not ( = ?auto_197150 ?auto_197149 ) ) ( not ( = ?auto_197150 ?auto_197147 ) ) ( not ( = ?auto_197150 ?auto_197146 ) ) ( not ( = ?auto_197148 ?auto_197149 ) ) ( not ( = ?auto_197148 ?auto_197147 ) ) ( not ( = ?auto_197148 ?auto_197146 ) ) ( not ( = ?auto_197149 ?auto_197147 ) ) ( not ( = ?auto_197149 ?auto_197146 ) ) ( not ( = ?auto_197147 ?auto_197146 ) ) ( not ( = ?auto_197143 ?auto_197147 ) ) ( not ( = ?auto_197143 ?auto_197145 ) ) ( not ( = ?auto_197143 ?auto_197150 ) ) ( not ( = ?auto_197143 ?auto_197148 ) ) ( not ( = ?auto_197143 ?auto_197149 ) ) ( not ( = ?auto_197151 ?auto_197147 ) ) ( not ( = ?auto_197151 ?auto_197145 ) ) ( not ( = ?auto_197151 ?auto_197150 ) ) ( not ( = ?auto_197151 ?auto_197148 ) ) ( not ( = ?auto_197151 ?auto_197149 ) ) ( not ( = ?auto_197144 ?auto_197147 ) ) ( not ( = ?auto_197144 ?auto_197145 ) ) ( not ( = ?auto_197144 ?auto_197150 ) ) ( not ( = ?auto_197144 ?auto_197148 ) ) ( not ( = ?auto_197144 ?auto_197149 ) ) ( ON ?auto_197146 ?auto_197144 ) ( ON ?auto_197147 ?auto_197146 ) ( ON ?auto_197149 ?auto_197147 ) ( CLEAR ?auto_197149 ) ( HOLDING ?auto_197148 ) ( CLEAR ?auto_197150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197145 ?auto_197150 ?auto_197148 )
      ( MAKE-1PILE ?auto_197143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197152 - BLOCK
    )
    :vars
    (
      ?auto_197154 - BLOCK
      ?auto_197155 - BLOCK
      ?auto_197153 - BLOCK
      ?auto_197156 - BLOCK
      ?auto_197157 - BLOCK
      ?auto_197159 - BLOCK
      ?auto_197158 - BLOCK
      ?auto_197160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197154 ?auto_197152 ) ( ON-TABLE ?auto_197152 ) ( not ( = ?auto_197152 ?auto_197154 ) ) ( not ( = ?auto_197152 ?auto_197155 ) ) ( not ( = ?auto_197152 ?auto_197153 ) ) ( not ( = ?auto_197154 ?auto_197155 ) ) ( not ( = ?auto_197154 ?auto_197153 ) ) ( not ( = ?auto_197155 ?auto_197153 ) ) ( ON ?auto_197155 ?auto_197154 ) ( ON-TABLE ?auto_197156 ) ( ON ?auto_197157 ?auto_197156 ) ( not ( = ?auto_197156 ?auto_197157 ) ) ( not ( = ?auto_197156 ?auto_197159 ) ) ( not ( = ?auto_197156 ?auto_197158 ) ) ( not ( = ?auto_197156 ?auto_197160 ) ) ( not ( = ?auto_197156 ?auto_197153 ) ) ( not ( = ?auto_197157 ?auto_197159 ) ) ( not ( = ?auto_197157 ?auto_197158 ) ) ( not ( = ?auto_197157 ?auto_197160 ) ) ( not ( = ?auto_197157 ?auto_197153 ) ) ( not ( = ?auto_197159 ?auto_197158 ) ) ( not ( = ?auto_197159 ?auto_197160 ) ) ( not ( = ?auto_197159 ?auto_197153 ) ) ( not ( = ?auto_197158 ?auto_197160 ) ) ( not ( = ?auto_197158 ?auto_197153 ) ) ( not ( = ?auto_197160 ?auto_197153 ) ) ( not ( = ?auto_197152 ?auto_197160 ) ) ( not ( = ?auto_197152 ?auto_197156 ) ) ( not ( = ?auto_197152 ?auto_197157 ) ) ( not ( = ?auto_197152 ?auto_197159 ) ) ( not ( = ?auto_197152 ?auto_197158 ) ) ( not ( = ?auto_197154 ?auto_197160 ) ) ( not ( = ?auto_197154 ?auto_197156 ) ) ( not ( = ?auto_197154 ?auto_197157 ) ) ( not ( = ?auto_197154 ?auto_197159 ) ) ( not ( = ?auto_197154 ?auto_197158 ) ) ( not ( = ?auto_197155 ?auto_197160 ) ) ( not ( = ?auto_197155 ?auto_197156 ) ) ( not ( = ?auto_197155 ?auto_197157 ) ) ( not ( = ?auto_197155 ?auto_197159 ) ) ( not ( = ?auto_197155 ?auto_197158 ) ) ( ON ?auto_197153 ?auto_197155 ) ( ON ?auto_197160 ?auto_197153 ) ( ON ?auto_197158 ?auto_197160 ) ( CLEAR ?auto_197157 ) ( ON ?auto_197159 ?auto_197158 ) ( CLEAR ?auto_197159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197152 ?auto_197154 ?auto_197155 ?auto_197153 ?auto_197160 ?auto_197158 )
      ( MAKE-1PILE ?auto_197152 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197161 - BLOCK
    )
    :vars
    (
      ?auto_197163 - BLOCK
      ?auto_197168 - BLOCK
      ?auto_197164 - BLOCK
      ?auto_197166 - BLOCK
      ?auto_197167 - BLOCK
      ?auto_197162 - BLOCK
      ?auto_197169 - BLOCK
      ?auto_197165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197163 ?auto_197161 ) ( ON-TABLE ?auto_197161 ) ( not ( = ?auto_197161 ?auto_197163 ) ) ( not ( = ?auto_197161 ?auto_197168 ) ) ( not ( = ?auto_197161 ?auto_197164 ) ) ( not ( = ?auto_197163 ?auto_197168 ) ) ( not ( = ?auto_197163 ?auto_197164 ) ) ( not ( = ?auto_197168 ?auto_197164 ) ) ( ON ?auto_197168 ?auto_197163 ) ( ON-TABLE ?auto_197166 ) ( not ( = ?auto_197166 ?auto_197167 ) ) ( not ( = ?auto_197166 ?auto_197162 ) ) ( not ( = ?auto_197166 ?auto_197169 ) ) ( not ( = ?auto_197166 ?auto_197165 ) ) ( not ( = ?auto_197166 ?auto_197164 ) ) ( not ( = ?auto_197167 ?auto_197162 ) ) ( not ( = ?auto_197167 ?auto_197169 ) ) ( not ( = ?auto_197167 ?auto_197165 ) ) ( not ( = ?auto_197167 ?auto_197164 ) ) ( not ( = ?auto_197162 ?auto_197169 ) ) ( not ( = ?auto_197162 ?auto_197165 ) ) ( not ( = ?auto_197162 ?auto_197164 ) ) ( not ( = ?auto_197169 ?auto_197165 ) ) ( not ( = ?auto_197169 ?auto_197164 ) ) ( not ( = ?auto_197165 ?auto_197164 ) ) ( not ( = ?auto_197161 ?auto_197165 ) ) ( not ( = ?auto_197161 ?auto_197166 ) ) ( not ( = ?auto_197161 ?auto_197167 ) ) ( not ( = ?auto_197161 ?auto_197162 ) ) ( not ( = ?auto_197161 ?auto_197169 ) ) ( not ( = ?auto_197163 ?auto_197165 ) ) ( not ( = ?auto_197163 ?auto_197166 ) ) ( not ( = ?auto_197163 ?auto_197167 ) ) ( not ( = ?auto_197163 ?auto_197162 ) ) ( not ( = ?auto_197163 ?auto_197169 ) ) ( not ( = ?auto_197168 ?auto_197165 ) ) ( not ( = ?auto_197168 ?auto_197166 ) ) ( not ( = ?auto_197168 ?auto_197167 ) ) ( not ( = ?auto_197168 ?auto_197162 ) ) ( not ( = ?auto_197168 ?auto_197169 ) ) ( ON ?auto_197164 ?auto_197168 ) ( ON ?auto_197165 ?auto_197164 ) ( ON ?auto_197169 ?auto_197165 ) ( ON ?auto_197162 ?auto_197169 ) ( CLEAR ?auto_197162 ) ( HOLDING ?auto_197167 ) ( CLEAR ?auto_197166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197166 ?auto_197167 )
      ( MAKE-1PILE ?auto_197161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197170 - BLOCK
    )
    :vars
    (
      ?auto_197174 - BLOCK
      ?auto_197172 - BLOCK
      ?auto_197173 - BLOCK
      ?auto_197171 - BLOCK
      ?auto_197176 - BLOCK
      ?auto_197175 - BLOCK
      ?auto_197178 - BLOCK
      ?auto_197177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197174 ?auto_197170 ) ( ON-TABLE ?auto_197170 ) ( not ( = ?auto_197170 ?auto_197174 ) ) ( not ( = ?auto_197170 ?auto_197172 ) ) ( not ( = ?auto_197170 ?auto_197173 ) ) ( not ( = ?auto_197174 ?auto_197172 ) ) ( not ( = ?auto_197174 ?auto_197173 ) ) ( not ( = ?auto_197172 ?auto_197173 ) ) ( ON ?auto_197172 ?auto_197174 ) ( ON-TABLE ?auto_197171 ) ( not ( = ?auto_197171 ?auto_197176 ) ) ( not ( = ?auto_197171 ?auto_197175 ) ) ( not ( = ?auto_197171 ?auto_197178 ) ) ( not ( = ?auto_197171 ?auto_197177 ) ) ( not ( = ?auto_197171 ?auto_197173 ) ) ( not ( = ?auto_197176 ?auto_197175 ) ) ( not ( = ?auto_197176 ?auto_197178 ) ) ( not ( = ?auto_197176 ?auto_197177 ) ) ( not ( = ?auto_197176 ?auto_197173 ) ) ( not ( = ?auto_197175 ?auto_197178 ) ) ( not ( = ?auto_197175 ?auto_197177 ) ) ( not ( = ?auto_197175 ?auto_197173 ) ) ( not ( = ?auto_197178 ?auto_197177 ) ) ( not ( = ?auto_197178 ?auto_197173 ) ) ( not ( = ?auto_197177 ?auto_197173 ) ) ( not ( = ?auto_197170 ?auto_197177 ) ) ( not ( = ?auto_197170 ?auto_197171 ) ) ( not ( = ?auto_197170 ?auto_197176 ) ) ( not ( = ?auto_197170 ?auto_197175 ) ) ( not ( = ?auto_197170 ?auto_197178 ) ) ( not ( = ?auto_197174 ?auto_197177 ) ) ( not ( = ?auto_197174 ?auto_197171 ) ) ( not ( = ?auto_197174 ?auto_197176 ) ) ( not ( = ?auto_197174 ?auto_197175 ) ) ( not ( = ?auto_197174 ?auto_197178 ) ) ( not ( = ?auto_197172 ?auto_197177 ) ) ( not ( = ?auto_197172 ?auto_197171 ) ) ( not ( = ?auto_197172 ?auto_197176 ) ) ( not ( = ?auto_197172 ?auto_197175 ) ) ( not ( = ?auto_197172 ?auto_197178 ) ) ( ON ?auto_197173 ?auto_197172 ) ( ON ?auto_197177 ?auto_197173 ) ( ON ?auto_197178 ?auto_197177 ) ( ON ?auto_197175 ?auto_197178 ) ( CLEAR ?auto_197171 ) ( ON ?auto_197176 ?auto_197175 ) ( CLEAR ?auto_197176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197170 ?auto_197174 ?auto_197172 ?auto_197173 ?auto_197177 ?auto_197178 ?auto_197175 )
      ( MAKE-1PILE ?auto_197170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197179 - BLOCK
    )
    :vars
    (
      ?auto_197182 - BLOCK
      ?auto_197187 - BLOCK
      ?auto_197184 - BLOCK
      ?auto_197183 - BLOCK
      ?auto_197181 - BLOCK
      ?auto_197185 - BLOCK
      ?auto_197186 - BLOCK
      ?auto_197180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197182 ?auto_197179 ) ( ON-TABLE ?auto_197179 ) ( not ( = ?auto_197179 ?auto_197182 ) ) ( not ( = ?auto_197179 ?auto_197187 ) ) ( not ( = ?auto_197179 ?auto_197184 ) ) ( not ( = ?auto_197182 ?auto_197187 ) ) ( not ( = ?auto_197182 ?auto_197184 ) ) ( not ( = ?auto_197187 ?auto_197184 ) ) ( ON ?auto_197187 ?auto_197182 ) ( not ( = ?auto_197183 ?auto_197181 ) ) ( not ( = ?auto_197183 ?auto_197185 ) ) ( not ( = ?auto_197183 ?auto_197186 ) ) ( not ( = ?auto_197183 ?auto_197180 ) ) ( not ( = ?auto_197183 ?auto_197184 ) ) ( not ( = ?auto_197181 ?auto_197185 ) ) ( not ( = ?auto_197181 ?auto_197186 ) ) ( not ( = ?auto_197181 ?auto_197180 ) ) ( not ( = ?auto_197181 ?auto_197184 ) ) ( not ( = ?auto_197185 ?auto_197186 ) ) ( not ( = ?auto_197185 ?auto_197180 ) ) ( not ( = ?auto_197185 ?auto_197184 ) ) ( not ( = ?auto_197186 ?auto_197180 ) ) ( not ( = ?auto_197186 ?auto_197184 ) ) ( not ( = ?auto_197180 ?auto_197184 ) ) ( not ( = ?auto_197179 ?auto_197180 ) ) ( not ( = ?auto_197179 ?auto_197183 ) ) ( not ( = ?auto_197179 ?auto_197181 ) ) ( not ( = ?auto_197179 ?auto_197185 ) ) ( not ( = ?auto_197179 ?auto_197186 ) ) ( not ( = ?auto_197182 ?auto_197180 ) ) ( not ( = ?auto_197182 ?auto_197183 ) ) ( not ( = ?auto_197182 ?auto_197181 ) ) ( not ( = ?auto_197182 ?auto_197185 ) ) ( not ( = ?auto_197182 ?auto_197186 ) ) ( not ( = ?auto_197187 ?auto_197180 ) ) ( not ( = ?auto_197187 ?auto_197183 ) ) ( not ( = ?auto_197187 ?auto_197181 ) ) ( not ( = ?auto_197187 ?auto_197185 ) ) ( not ( = ?auto_197187 ?auto_197186 ) ) ( ON ?auto_197184 ?auto_197187 ) ( ON ?auto_197180 ?auto_197184 ) ( ON ?auto_197186 ?auto_197180 ) ( ON ?auto_197185 ?auto_197186 ) ( ON ?auto_197181 ?auto_197185 ) ( CLEAR ?auto_197181 ) ( HOLDING ?auto_197183 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197183 )
      ( MAKE-1PILE ?auto_197179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197188 - BLOCK
    )
    :vars
    (
      ?auto_197195 - BLOCK
      ?auto_197189 - BLOCK
      ?auto_197192 - BLOCK
      ?auto_197196 - BLOCK
      ?auto_197194 - BLOCK
      ?auto_197191 - BLOCK
      ?auto_197193 - BLOCK
      ?auto_197190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197195 ?auto_197188 ) ( ON-TABLE ?auto_197188 ) ( not ( = ?auto_197188 ?auto_197195 ) ) ( not ( = ?auto_197188 ?auto_197189 ) ) ( not ( = ?auto_197188 ?auto_197192 ) ) ( not ( = ?auto_197195 ?auto_197189 ) ) ( not ( = ?auto_197195 ?auto_197192 ) ) ( not ( = ?auto_197189 ?auto_197192 ) ) ( ON ?auto_197189 ?auto_197195 ) ( not ( = ?auto_197196 ?auto_197194 ) ) ( not ( = ?auto_197196 ?auto_197191 ) ) ( not ( = ?auto_197196 ?auto_197193 ) ) ( not ( = ?auto_197196 ?auto_197190 ) ) ( not ( = ?auto_197196 ?auto_197192 ) ) ( not ( = ?auto_197194 ?auto_197191 ) ) ( not ( = ?auto_197194 ?auto_197193 ) ) ( not ( = ?auto_197194 ?auto_197190 ) ) ( not ( = ?auto_197194 ?auto_197192 ) ) ( not ( = ?auto_197191 ?auto_197193 ) ) ( not ( = ?auto_197191 ?auto_197190 ) ) ( not ( = ?auto_197191 ?auto_197192 ) ) ( not ( = ?auto_197193 ?auto_197190 ) ) ( not ( = ?auto_197193 ?auto_197192 ) ) ( not ( = ?auto_197190 ?auto_197192 ) ) ( not ( = ?auto_197188 ?auto_197190 ) ) ( not ( = ?auto_197188 ?auto_197196 ) ) ( not ( = ?auto_197188 ?auto_197194 ) ) ( not ( = ?auto_197188 ?auto_197191 ) ) ( not ( = ?auto_197188 ?auto_197193 ) ) ( not ( = ?auto_197195 ?auto_197190 ) ) ( not ( = ?auto_197195 ?auto_197196 ) ) ( not ( = ?auto_197195 ?auto_197194 ) ) ( not ( = ?auto_197195 ?auto_197191 ) ) ( not ( = ?auto_197195 ?auto_197193 ) ) ( not ( = ?auto_197189 ?auto_197190 ) ) ( not ( = ?auto_197189 ?auto_197196 ) ) ( not ( = ?auto_197189 ?auto_197194 ) ) ( not ( = ?auto_197189 ?auto_197191 ) ) ( not ( = ?auto_197189 ?auto_197193 ) ) ( ON ?auto_197192 ?auto_197189 ) ( ON ?auto_197190 ?auto_197192 ) ( ON ?auto_197193 ?auto_197190 ) ( ON ?auto_197191 ?auto_197193 ) ( ON ?auto_197194 ?auto_197191 ) ( ON ?auto_197196 ?auto_197194 ) ( CLEAR ?auto_197196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197188 ?auto_197195 ?auto_197189 ?auto_197192 ?auto_197190 ?auto_197193 ?auto_197191 ?auto_197194 )
      ( MAKE-1PILE ?auto_197188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197205 - BLOCK
      ?auto_197206 - BLOCK
      ?auto_197207 - BLOCK
      ?auto_197208 - BLOCK
      ?auto_197209 - BLOCK
      ?auto_197210 - BLOCK
      ?auto_197211 - BLOCK
      ?auto_197212 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_197212 ) ( CLEAR ?auto_197211 ) ( ON-TABLE ?auto_197205 ) ( ON ?auto_197206 ?auto_197205 ) ( ON ?auto_197207 ?auto_197206 ) ( ON ?auto_197208 ?auto_197207 ) ( ON ?auto_197209 ?auto_197208 ) ( ON ?auto_197210 ?auto_197209 ) ( ON ?auto_197211 ?auto_197210 ) ( not ( = ?auto_197205 ?auto_197206 ) ) ( not ( = ?auto_197205 ?auto_197207 ) ) ( not ( = ?auto_197205 ?auto_197208 ) ) ( not ( = ?auto_197205 ?auto_197209 ) ) ( not ( = ?auto_197205 ?auto_197210 ) ) ( not ( = ?auto_197205 ?auto_197211 ) ) ( not ( = ?auto_197205 ?auto_197212 ) ) ( not ( = ?auto_197206 ?auto_197207 ) ) ( not ( = ?auto_197206 ?auto_197208 ) ) ( not ( = ?auto_197206 ?auto_197209 ) ) ( not ( = ?auto_197206 ?auto_197210 ) ) ( not ( = ?auto_197206 ?auto_197211 ) ) ( not ( = ?auto_197206 ?auto_197212 ) ) ( not ( = ?auto_197207 ?auto_197208 ) ) ( not ( = ?auto_197207 ?auto_197209 ) ) ( not ( = ?auto_197207 ?auto_197210 ) ) ( not ( = ?auto_197207 ?auto_197211 ) ) ( not ( = ?auto_197207 ?auto_197212 ) ) ( not ( = ?auto_197208 ?auto_197209 ) ) ( not ( = ?auto_197208 ?auto_197210 ) ) ( not ( = ?auto_197208 ?auto_197211 ) ) ( not ( = ?auto_197208 ?auto_197212 ) ) ( not ( = ?auto_197209 ?auto_197210 ) ) ( not ( = ?auto_197209 ?auto_197211 ) ) ( not ( = ?auto_197209 ?auto_197212 ) ) ( not ( = ?auto_197210 ?auto_197211 ) ) ( not ( = ?auto_197210 ?auto_197212 ) ) ( not ( = ?auto_197211 ?auto_197212 ) ) )
    :subtasks
    ( ( !STACK ?auto_197212 ?auto_197211 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197213 - BLOCK
      ?auto_197214 - BLOCK
      ?auto_197215 - BLOCK
      ?auto_197216 - BLOCK
      ?auto_197217 - BLOCK
      ?auto_197218 - BLOCK
      ?auto_197219 - BLOCK
      ?auto_197220 - BLOCK
    )
    :vars
    (
      ?auto_197221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197219 ) ( ON-TABLE ?auto_197213 ) ( ON ?auto_197214 ?auto_197213 ) ( ON ?auto_197215 ?auto_197214 ) ( ON ?auto_197216 ?auto_197215 ) ( ON ?auto_197217 ?auto_197216 ) ( ON ?auto_197218 ?auto_197217 ) ( ON ?auto_197219 ?auto_197218 ) ( not ( = ?auto_197213 ?auto_197214 ) ) ( not ( = ?auto_197213 ?auto_197215 ) ) ( not ( = ?auto_197213 ?auto_197216 ) ) ( not ( = ?auto_197213 ?auto_197217 ) ) ( not ( = ?auto_197213 ?auto_197218 ) ) ( not ( = ?auto_197213 ?auto_197219 ) ) ( not ( = ?auto_197213 ?auto_197220 ) ) ( not ( = ?auto_197214 ?auto_197215 ) ) ( not ( = ?auto_197214 ?auto_197216 ) ) ( not ( = ?auto_197214 ?auto_197217 ) ) ( not ( = ?auto_197214 ?auto_197218 ) ) ( not ( = ?auto_197214 ?auto_197219 ) ) ( not ( = ?auto_197214 ?auto_197220 ) ) ( not ( = ?auto_197215 ?auto_197216 ) ) ( not ( = ?auto_197215 ?auto_197217 ) ) ( not ( = ?auto_197215 ?auto_197218 ) ) ( not ( = ?auto_197215 ?auto_197219 ) ) ( not ( = ?auto_197215 ?auto_197220 ) ) ( not ( = ?auto_197216 ?auto_197217 ) ) ( not ( = ?auto_197216 ?auto_197218 ) ) ( not ( = ?auto_197216 ?auto_197219 ) ) ( not ( = ?auto_197216 ?auto_197220 ) ) ( not ( = ?auto_197217 ?auto_197218 ) ) ( not ( = ?auto_197217 ?auto_197219 ) ) ( not ( = ?auto_197217 ?auto_197220 ) ) ( not ( = ?auto_197218 ?auto_197219 ) ) ( not ( = ?auto_197218 ?auto_197220 ) ) ( not ( = ?auto_197219 ?auto_197220 ) ) ( ON ?auto_197220 ?auto_197221 ) ( CLEAR ?auto_197220 ) ( HAND-EMPTY ) ( not ( = ?auto_197213 ?auto_197221 ) ) ( not ( = ?auto_197214 ?auto_197221 ) ) ( not ( = ?auto_197215 ?auto_197221 ) ) ( not ( = ?auto_197216 ?auto_197221 ) ) ( not ( = ?auto_197217 ?auto_197221 ) ) ( not ( = ?auto_197218 ?auto_197221 ) ) ( not ( = ?auto_197219 ?auto_197221 ) ) ( not ( = ?auto_197220 ?auto_197221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197220 ?auto_197221 )
      ( MAKE-8PILE ?auto_197213 ?auto_197214 ?auto_197215 ?auto_197216 ?auto_197217 ?auto_197218 ?auto_197219 ?auto_197220 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197222 - BLOCK
      ?auto_197223 - BLOCK
      ?auto_197224 - BLOCK
      ?auto_197225 - BLOCK
      ?auto_197226 - BLOCK
      ?auto_197227 - BLOCK
      ?auto_197228 - BLOCK
      ?auto_197229 - BLOCK
    )
    :vars
    (
      ?auto_197230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197222 ) ( ON ?auto_197223 ?auto_197222 ) ( ON ?auto_197224 ?auto_197223 ) ( ON ?auto_197225 ?auto_197224 ) ( ON ?auto_197226 ?auto_197225 ) ( ON ?auto_197227 ?auto_197226 ) ( not ( = ?auto_197222 ?auto_197223 ) ) ( not ( = ?auto_197222 ?auto_197224 ) ) ( not ( = ?auto_197222 ?auto_197225 ) ) ( not ( = ?auto_197222 ?auto_197226 ) ) ( not ( = ?auto_197222 ?auto_197227 ) ) ( not ( = ?auto_197222 ?auto_197228 ) ) ( not ( = ?auto_197222 ?auto_197229 ) ) ( not ( = ?auto_197223 ?auto_197224 ) ) ( not ( = ?auto_197223 ?auto_197225 ) ) ( not ( = ?auto_197223 ?auto_197226 ) ) ( not ( = ?auto_197223 ?auto_197227 ) ) ( not ( = ?auto_197223 ?auto_197228 ) ) ( not ( = ?auto_197223 ?auto_197229 ) ) ( not ( = ?auto_197224 ?auto_197225 ) ) ( not ( = ?auto_197224 ?auto_197226 ) ) ( not ( = ?auto_197224 ?auto_197227 ) ) ( not ( = ?auto_197224 ?auto_197228 ) ) ( not ( = ?auto_197224 ?auto_197229 ) ) ( not ( = ?auto_197225 ?auto_197226 ) ) ( not ( = ?auto_197225 ?auto_197227 ) ) ( not ( = ?auto_197225 ?auto_197228 ) ) ( not ( = ?auto_197225 ?auto_197229 ) ) ( not ( = ?auto_197226 ?auto_197227 ) ) ( not ( = ?auto_197226 ?auto_197228 ) ) ( not ( = ?auto_197226 ?auto_197229 ) ) ( not ( = ?auto_197227 ?auto_197228 ) ) ( not ( = ?auto_197227 ?auto_197229 ) ) ( not ( = ?auto_197228 ?auto_197229 ) ) ( ON ?auto_197229 ?auto_197230 ) ( CLEAR ?auto_197229 ) ( not ( = ?auto_197222 ?auto_197230 ) ) ( not ( = ?auto_197223 ?auto_197230 ) ) ( not ( = ?auto_197224 ?auto_197230 ) ) ( not ( = ?auto_197225 ?auto_197230 ) ) ( not ( = ?auto_197226 ?auto_197230 ) ) ( not ( = ?auto_197227 ?auto_197230 ) ) ( not ( = ?auto_197228 ?auto_197230 ) ) ( not ( = ?auto_197229 ?auto_197230 ) ) ( HOLDING ?auto_197228 ) ( CLEAR ?auto_197227 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197222 ?auto_197223 ?auto_197224 ?auto_197225 ?auto_197226 ?auto_197227 ?auto_197228 )
      ( MAKE-8PILE ?auto_197222 ?auto_197223 ?auto_197224 ?auto_197225 ?auto_197226 ?auto_197227 ?auto_197228 ?auto_197229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197231 - BLOCK
      ?auto_197232 - BLOCK
      ?auto_197233 - BLOCK
      ?auto_197234 - BLOCK
      ?auto_197235 - BLOCK
      ?auto_197236 - BLOCK
      ?auto_197237 - BLOCK
      ?auto_197238 - BLOCK
    )
    :vars
    (
      ?auto_197239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197231 ) ( ON ?auto_197232 ?auto_197231 ) ( ON ?auto_197233 ?auto_197232 ) ( ON ?auto_197234 ?auto_197233 ) ( ON ?auto_197235 ?auto_197234 ) ( ON ?auto_197236 ?auto_197235 ) ( not ( = ?auto_197231 ?auto_197232 ) ) ( not ( = ?auto_197231 ?auto_197233 ) ) ( not ( = ?auto_197231 ?auto_197234 ) ) ( not ( = ?auto_197231 ?auto_197235 ) ) ( not ( = ?auto_197231 ?auto_197236 ) ) ( not ( = ?auto_197231 ?auto_197237 ) ) ( not ( = ?auto_197231 ?auto_197238 ) ) ( not ( = ?auto_197232 ?auto_197233 ) ) ( not ( = ?auto_197232 ?auto_197234 ) ) ( not ( = ?auto_197232 ?auto_197235 ) ) ( not ( = ?auto_197232 ?auto_197236 ) ) ( not ( = ?auto_197232 ?auto_197237 ) ) ( not ( = ?auto_197232 ?auto_197238 ) ) ( not ( = ?auto_197233 ?auto_197234 ) ) ( not ( = ?auto_197233 ?auto_197235 ) ) ( not ( = ?auto_197233 ?auto_197236 ) ) ( not ( = ?auto_197233 ?auto_197237 ) ) ( not ( = ?auto_197233 ?auto_197238 ) ) ( not ( = ?auto_197234 ?auto_197235 ) ) ( not ( = ?auto_197234 ?auto_197236 ) ) ( not ( = ?auto_197234 ?auto_197237 ) ) ( not ( = ?auto_197234 ?auto_197238 ) ) ( not ( = ?auto_197235 ?auto_197236 ) ) ( not ( = ?auto_197235 ?auto_197237 ) ) ( not ( = ?auto_197235 ?auto_197238 ) ) ( not ( = ?auto_197236 ?auto_197237 ) ) ( not ( = ?auto_197236 ?auto_197238 ) ) ( not ( = ?auto_197237 ?auto_197238 ) ) ( ON ?auto_197238 ?auto_197239 ) ( not ( = ?auto_197231 ?auto_197239 ) ) ( not ( = ?auto_197232 ?auto_197239 ) ) ( not ( = ?auto_197233 ?auto_197239 ) ) ( not ( = ?auto_197234 ?auto_197239 ) ) ( not ( = ?auto_197235 ?auto_197239 ) ) ( not ( = ?auto_197236 ?auto_197239 ) ) ( not ( = ?auto_197237 ?auto_197239 ) ) ( not ( = ?auto_197238 ?auto_197239 ) ) ( CLEAR ?auto_197236 ) ( ON ?auto_197237 ?auto_197238 ) ( CLEAR ?auto_197237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197239 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197239 ?auto_197238 )
      ( MAKE-8PILE ?auto_197231 ?auto_197232 ?auto_197233 ?auto_197234 ?auto_197235 ?auto_197236 ?auto_197237 ?auto_197238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197240 - BLOCK
      ?auto_197241 - BLOCK
      ?auto_197242 - BLOCK
      ?auto_197243 - BLOCK
      ?auto_197244 - BLOCK
      ?auto_197245 - BLOCK
      ?auto_197246 - BLOCK
      ?auto_197247 - BLOCK
    )
    :vars
    (
      ?auto_197248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197240 ) ( ON ?auto_197241 ?auto_197240 ) ( ON ?auto_197242 ?auto_197241 ) ( ON ?auto_197243 ?auto_197242 ) ( ON ?auto_197244 ?auto_197243 ) ( not ( = ?auto_197240 ?auto_197241 ) ) ( not ( = ?auto_197240 ?auto_197242 ) ) ( not ( = ?auto_197240 ?auto_197243 ) ) ( not ( = ?auto_197240 ?auto_197244 ) ) ( not ( = ?auto_197240 ?auto_197245 ) ) ( not ( = ?auto_197240 ?auto_197246 ) ) ( not ( = ?auto_197240 ?auto_197247 ) ) ( not ( = ?auto_197241 ?auto_197242 ) ) ( not ( = ?auto_197241 ?auto_197243 ) ) ( not ( = ?auto_197241 ?auto_197244 ) ) ( not ( = ?auto_197241 ?auto_197245 ) ) ( not ( = ?auto_197241 ?auto_197246 ) ) ( not ( = ?auto_197241 ?auto_197247 ) ) ( not ( = ?auto_197242 ?auto_197243 ) ) ( not ( = ?auto_197242 ?auto_197244 ) ) ( not ( = ?auto_197242 ?auto_197245 ) ) ( not ( = ?auto_197242 ?auto_197246 ) ) ( not ( = ?auto_197242 ?auto_197247 ) ) ( not ( = ?auto_197243 ?auto_197244 ) ) ( not ( = ?auto_197243 ?auto_197245 ) ) ( not ( = ?auto_197243 ?auto_197246 ) ) ( not ( = ?auto_197243 ?auto_197247 ) ) ( not ( = ?auto_197244 ?auto_197245 ) ) ( not ( = ?auto_197244 ?auto_197246 ) ) ( not ( = ?auto_197244 ?auto_197247 ) ) ( not ( = ?auto_197245 ?auto_197246 ) ) ( not ( = ?auto_197245 ?auto_197247 ) ) ( not ( = ?auto_197246 ?auto_197247 ) ) ( ON ?auto_197247 ?auto_197248 ) ( not ( = ?auto_197240 ?auto_197248 ) ) ( not ( = ?auto_197241 ?auto_197248 ) ) ( not ( = ?auto_197242 ?auto_197248 ) ) ( not ( = ?auto_197243 ?auto_197248 ) ) ( not ( = ?auto_197244 ?auto_197248 ) ) ( not ( = ?auto_197245 ?auto_197248 ) ) ( not ( = ?auto_197246 ?auto_197248 ) ) ( not ( = ?auto_197247 ?auto_197248 ) ) ( ON ?auto_197246 ?auto_197247 ) ( CLEAR ?auto_197246 ) ( ON-TABLE ?auto_197248 ) ( HOLDING ?auto_197245 ) ( CLEAR ?auto_197244 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197240 ?auto_197241 ?auto_197242 ?auto_197243 ?auto_197244 ?auto_197245 )
      ( MAKE-8PILE ?auto_197240 ?auto_197241 ?auto_197242 ?auto_197243 ?auto_197244 ?auto_197245 ?auto_197246 ?auto_197247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197249 - BLOCK
      ?auto_197250 - BLOCK
      ?auto_197251 - BLOCK
      ?auto_197252 - BLOCK
      ?auto_197253 - BLOCK
      ?auto_197254 - BLOCK
      ?auto_197255 - BLOCK
      ?auto_197256 - BLOCK
    )
    :vars
    (
      ?auto_197257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197249 ) ( ON ?auto_197250 ?auto_197249 ) ( ON ?auto_197251 ?auto_197250 ) ( ON ?auto_197252 ?auto_197251 ) ( ON ?auto_197253 ?auto_197252 ) ( not ( = ?auto_197249 ?auto_197250 ) ) ( not ( = ?auto_197249 ?auto_197251 ) ) ( not ( = ?auto_197249 ?auto_197252 ) ) ( not ( = ?auto_197249 ?auto_197253 ) ) ( not ( = ?auto_197249 ?auto_197254 ) ) ( not ( = ?auto_197249 ?auto_197255 ) ) ( not ( = ?auto_197249 ?auto_197256 ) ) ( not ( = ?auto_197250 ?auto_197251 ) ) ( not ( = ?auto_197250 ?auto_197252 ) ) ( not ( = ?auto_197250 ?auto_197253 ) ) ( not ( = ?auto_197250 ?auto_197254 ) ) ( not ( = ?auto_197250 ?auto_197255 ) ) ( not ( = ?auto_197250 ?auto_197256 ) ) ( not ( = ?auto_197251 ?auto_197252 ) ) ( not ( = ?auto_197251 ?auto_197253 ) ) ( not ( = ?auto_197251 ?auto_197254 ) ) ( not ( = ?auto_197251 ?auto_197255 ) ) ( not ( = ?auto_197251 ?auto_197256 ) ) ( not ( = ?auto_197252 ?auto_197253 ) ) ( not ( = ?auto_197252 ?auto_197254 ) ) ( not ( = ?auto_197252 ?auto_197255 ) ) ( not ( = ?auto_197252 ?auto_197256 ) ) ( not ( = ?auto_197253 ?auto_197254 ) ) ( not ( = ?auto_197253 ?auto_197255 ) ) ( not ( = ?auto_197253 ?auto_197256 ) ) ( not ( = ?auto_197254 ?auto_197255 ) ) ( not ( = ?auto_197254 ?auto_197256 ) ) ( not ( = ?auto_197255 ?auto_197256 ) ) ( ON ?auto_197256 ?auto_197257 ) ( not ( = ?auto_197249 ?auto_197257 ) ) ( not ( = ?auto_197250 ?auto_197257 ) ) ( not ( = ?auto_197251 ?auto_197257 ) ) ( not ( = ?auto_197252 ?auto_197257 ) ) ( not ( = ?auto_197253 ?auto_197257 ) ) ( not ( = ?auto_197254 ?auto_197257 ) ) ( not ( = ?auto_197255 ?auto_197257 ) ) ( not ( = ?auto_197256 ?auto_197257 ) ) ( ON ?auto_197255 ?auto_197256 ) ( ON-TABLE ?auto_197257 ) ( CLEAR ?auto_197253 ) ( ON ?auto_197254 ?auto_197255 ) ( CLEAR ?auto_197254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197257 ?auto_197256 ?auto_197255 )
      ( MAKE-8PILE ?auto_197249 ?auto_197250 ?auto_197251 ?auto_197252 ?auto_197253 ?auto_197254 ?auto_197255 ?auto_197256 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197258 - BLOCK
      ?auto_197259 - BLOCK
      ?auto_197260 - BLOCK
      ?auto_197261 - BLOCK
      ?auto_197262 - BLOCK
      ?auto_197263 - BLOCK
      ?auto_197264 - BLOCK
      ?auto_197265 - BLOCK
    )
    :vars
    (
      ?auto_197266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197258 ) ( ON ?auto_197259 ?auto_197258 ) ( ON ?auto_197260 ?auto_197259 ) ( ON ?auto_197261 ?auto_197260 ) ( not ( = ?auto_197258 ?auto_197259 ) ) ( not ( = ?auto_197258 ?auto_197260 ) ) ( not ( = ?auto_197258 ?auto_197261 ) ) ( not ( = ?auto_197258 ?auto_197262 ) ) ( not ( = ?auto_197258 ?auto_197263 ) ) ( not ( = ?auto_197258 ?auto_197264 ) ) ( not ( = ?auto_197258 ?auto_197265 ) ) ( not ( = ?auto_197259 ?auto_197260 ) ) ( not ( = ?auto_197259 ?auto_197261 ) ) ( not ( = ?auto_197259 ?auto_197262 ) ) ( not ( = ?auto_197259 ?auto_197263 ) ) ( not ( = ?auto_197259 ?auto_197264 ) ) ( not ( = ?auto_197259 ?auto_197265 ) ) ( not ( = ?auto_197260 ?auto_197261 ) ) ( not ( = ?auto_197260 ?auto_197262 ) ) ( not ( = ?auto_197260 ?auto_197263 ) ) ( not ( = ?auto_197260 ?auto_197264 ) ) ( not ( = ?auto_197260 ?auto_197265 ) ) ( not ( = ?auto_197261 ?auto_197262 ) ) ( not ( = ?auto_197261 ?auto_197263 ) ) ( not ( = ?auto_197261 ?auto_197264 ) ) ( not ( = ?auto_197261 ?auto_197265 ) ) ( not ( = ?auto_197262 ?auto_197263 ) ) ( not ( = ?auto_197262 ?auto_197264 ) ) ( not ( = ?auto_197262 ?auto_197265 ) ) ( not ( = ?auto_197263 ?auto_197264 ) ) ( not ( = ?auto_197263 ?auto_197265 ) ) ( not ( = ?auto_197264 ?auto_197265 ) ) ( ON ?auto_197265 ?auto_197266 ) ( not ( = ?auto_197258 ?auto_197266 ) ) ( not ( = ?auto_197259 ?auto_197266 ) ) ( not ( = ?auto_197260 ?auto_197266 ) ) ( not ( = ?auto_197261 ?auto_197266 ) ) ( not ( = ?auto_197262 ?auto_197266 ) ) ( not ( = ?auto_197263 ?auto_197266 ) ) ( not ( = ?auto_197264 ?auto_197266 ) ) ( not ( = ?auto_197265 ?auto_197266 ) ) ( ON ?auto_197264 ?auto_197265 ) ( ON-TABLE ?auto_197266 ) ( ON ?auto_197263 ?auto_197264 ) ( CLEAR ?auto_197263 ) ( HOLDING ?auto_197262 ) ( CLEAR ?auto_197261 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197258 ?auto_197259 ?auto_197260 ?auto_197261 ?auto_197262 )
      ( MAKE-8PILE ?auto_197258 ?auto_197259 ?auto_197260 ?auto_197261 ?auto_197262 ?auto_197263 ?auto_197264 ?auto_197265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197267 - BLOCK
      ?auto_197268 - BLOCK
      ?auto_197269 - BLOCK
      ?auto_197270 - BLOCK
      ?auto_197271 - BLOCK
      ?auto_197272 - BLOCK
      ?auto_197273 - BLOCK
      ?auto_197274 - BLOCK
    )
    :vars
    (
      ?auto_197275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197267 ) ( ON ?auto_197268 ?auto_197267 ) ( ON ?auto_197269 ?auto_197268 ) ( ON ?auto_197270 ?auto_197269 ) ( not ( = ?auto_197267 ?auto_197268 ) ) ( not ( = ?auto_197267 ?auto_197269 ) ) ( not ( = ?auto_197267 ?auto_197270 ) ) ( not ( = ?auto_197267 ?auto_197271 ) ) ( not ( = ?auto_197267 ?auto_197272 ) ) ( not ( = ?auto_197267 ?auto_197273 ) ) ( not ( = ?auto_197267 ?auto_197274 ) ) ( not ( = ?auto_197268 ?auto_197269 ) ) ( not ( = ?auto_197268 ?auto_197270 ) ) ( not ( = ?auto_197268 ?auto_197271 ) ) ( not ( = ?auto_197268 ?auto_197272 ) ) ( not ( = ?auto_197268 ?auto_197273 ) ) ( not ( = ?auto_197268 ?auto_197274 ) ) ( not ( = ?auto_197269 ?auto_197270 ) ) ( not ( = ?auto_197269 ?auto_197271 ) ) ( not ( = ?auto_197269 ?auto_197272 ) ) ( not ( = ?auto_197269 ?auto_197273 ) ) ( not ( = ?auto_197269 ?auto_197274 ) ) ( not ( = ?auto_197270 ?auto_197271 ) ) ( not ( = ?auto_197270 ?auto_197272 ) ) ( not ( = ?auto_197270 ?auto_197273 ) ) ( not ( = ?auto_197270 ?auto_197274 ) ) ( not ( = ?auto_197271 ?auto_197272 ) ) ( not ( = ?auto_197271 ?auto_197273 ) ) ( not ( = ?auto_197271 ?auto_197274 ) ) ( not ( = ?auto_197272 ?auto_197273 ) ) ( not ( = ?auto_197272 ?auto_197274 ) ) ( not ( = ?auto_197273 ?auto_197274 ) ) ( ON ?auto_197274 ?auto_197275 ) ( not ( = ?auto_197267 ?auto_197275 ) ) ( not ( = ?auto_197268 ?auto_197275 ) ) ( not ( = ?auto_197269 ?auto_197275 ) ) ( not ( = ?auto_197270 ?auto_197275 ) ) ( not ( = ?auto_197271 ?auto_197275 ) ) ( not ( = ?auto_197272 ?auto_197275 ) ) ( not ( = ?auto_197273 ?auto_197275 ) ) ( not ( = ?auto_197274 ?auto_197275 ) ) ( ON ?auto_197273 ?auto_197274 ) ( ON-TABLE ?auto_197275 ) ( ON ?auto_197272 ?auto_197273 ) ( CLEAR ?auto_197270 ) ( ON ?auto_197271 ?auto_197272 ) ( CLEAR ?auto_197271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197275 ?auto_197274 ?auto_197273 ?auto_197272 )
      ( MAKE-8PILE ?auto_197267 ?auto_197268 ?auto_197269 ?auto_197270 ?auto_197271 ?auto_197272 ?auto_197273 ?auto_197274 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197276 - BLOCK
      ?auto_197277 - BLOCK
      ?auto_197278 - BLOCK
      ?auto_197279 - BLOCK
      ?auto_197280 - BLOCK
      ?auto_197281 - BLOCK
      ?auto_197282 - BLOCK
      ?auto_197283 - BLOCK
    )
    :vars
    (
      ?auto_197284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197276 ) ( ON ?auto_197277 ?auto_197276 ) ( ON ?auto_197278 ?auto_197277 ) ( not ( = ?auto_197276 ?auto_197277 ) ) ( not ( = ?auto_197276 ?auto_197278 ) ) ( not ( = ?auto_197276 ?auto_197279 ) ) ( not ( = ?auto_197276 ?auto_197280 ) ) ( not ( = ?auto_197276 ?auto_197281 ) ) ( not ( = ?auto_197276 ?auto_197282 ) ) ( not ( = ?auto_197276 ?auto_197283 ) ) ( not ( = ?auto_197277 ?auto_197278 ) ) ( not ( = ?auto_197277 ?auto_197279 ) ) ( not ( = ?auto_197277 ?auto_197280 ) ) ( not ( = ?auto_197277 ?auto_197281 ) ) ( not ( = ?auto_197277 ?auto_197282 ) ) ( not ( = ?auto_197277 ?auto_197283 ) ) ( not ( = ?auto_197278 ?auto_197279 ) ) ( not ( = ?auto_197278 ?auto_197280 ) ) ( not ( = ?auto_197278 ?auto_197281 ) ) ( not ( = ?auto_197278 ?auto_197282 ) ) ( not ( = ?auto_197278 ?auto_197283 ) ) ( not ( = ?auto_197279 ?auto_197280 ) ) ( not ( = ?auto_197279 ?auto_197281 ) ) ( not ( = ?auto_197279 ?auto_197282 ) ) ( not ( = ?auto_197279 ?auto_197283 ) ) ( not ( = ?auto_197280 ?auto_197281 ) ) ( not ( = ?auto_197280 ?auto_197282 ) ) ( not ( = ?auto_197280 ?auto_197283 ) ) ( not ( = ?auto_197281 ?auto_197282 ) ) ( not ( = ?auto_197281 ?auto_197283 ) ) ( not ( = ?auto_197282 ?auto_197283 ) ) ( ON ?auto_197283 ?auto_197284 ) ( not ( = ?auto_197276 ?auto_197284 ) ) ( not ( = ?auto_197277 ?auto_197284 ) ) ( not ( = ?auto_197278 ?auto_197284 ) ) ( not ( = ?auto_197279 ?auto_197284 ) ) ( not ( = ?auto_197280 ?auto_197284 ) ) ( not ( = ?auto_197281 ?auto_197284 ) ) ( not ( = ?auto_197282 ?auto_197284 ) ) ( not ( = ?auto_197283 ?auto_197284 ) ) ( ON ?auto_197282 ?auto_197283 ) ( ON-TABLE ?auto_197284 ) ( ON ?auto_197281 ?auto_197282 ) ( ON ?auto_197280 ?auto_197281 ) ( CLEAR ?auto_197280 ) ( HOLDING ?auto_197279 ) ( CLEAR ?auto_197278 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197276 ?auto_197277 ?auto_197278 ?auto_197279 )
      ( MAKE-8PILE ?auto_197276 ?auto_197277 ?auto_197278 ?auto_197279 ?auto_197280 ?auto_197281 ?auto_197282 ?auto_197283 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197285 - BLOCK
      ?auto_197286 - BLOCK
      ?auto_197287 - BLOCK
      ?auto_197288 - BLOCK
      ?auto_197289 - BLOCK
      ?auto_197290 - BLOCK
      ?auto_197291 - BLOCK
      ?auto_197292 - BLOCK
    )
    :vars
    (
      ?auto_197293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197285 ) ( ON ?auto_197286 ?auto_197285 ) ( ON ?auto_197287 ?auto_197286 ) ( not ( = ?auto_197285 ?auto_197286 ) ) ( not ( = ?auto_197285 ?auto_197287 ) ) ( not ( = ?auto_197285 ?auto_197288 ) ) ( not ( = ?auto_197285 ?auto_197289 ) ) ( not ( = ?auto_197285 ?auto_197290 ) ) ( not ( = ?auto_197285 ?auto_197291 ) ) ( not ( = ?auto_197285 ?auto_197292 ) ) ( not ( = ?auto_197286 ?auto_197287 ) ) ( not ( = ?auto_197286 ?auto_197288 ) ) ( not ( = ?auto_197286 ?auto_197289 ) ) ( not ( = ?auto_197286 ?auto_197290 ) ) ( not ( = ?auto_197286 ?auto_197291 ) ) ( not ( = ?auto_197286 ?auto_197292 ) ) ( not ( = ?auto_197287 ?auto_197288 ) ) ( not ( = ?auto_197287 ?auto_197289 ) ) ( not ( = ?auto_197287 ?auto_197290 ) ) ( not ( = ?auto_197287 ?auto_197291 ) ) ( not ( = ?auto_197287 ?auto_197292 ) ) ( not ( = ?auto_197288 ?auto_197289 ) ) ( not ( = ?auto_197288 ?auto_197290 ) ) ( not ( = ?auto_197288 ?auto_197291 ) ) ( not ( = ?auto_197288 ?auto_197292 ) ) ( not ( = ?auto_197289 ?auto_197290 ) ) ( not ( = ?auto_197289 ?auto_197291 ) ) ( not ( = ?auto_197289 ?auto_197292 ) ) ( not ( = ?auto_197290 ?auto_197291 ) ) ( not ( = ?auto_197290 ?auto_197292 ) ) ( not ( = ?auto_197291 ?auto_197292 ) ) ( ON ?auto_197292 ?auto_197293 ) ( not ( = ?auto_197285 ?auto_197293 ) ) ( not ( = ?auto_197286 ?auto_197293 ) ) ( not ( = ?auto_197287 ?auto_197293 ) ) ( not ( = ?auto_197288 ?auto_197293 ) ) ( not ( = ?auto_197289 ?auto_197293 ) ) ( not ( = ?auto_197290 ?auto_197293 ) ) ( not ( = ?auto_197291 ?auto_197293 ) ) ( not ( = ?auto_197292 ?auto_197293 ) ) ( ON ?auto_197291 ?auto_197292 ) ( ON-TABLE ?auto_197293 ) ( ON ?auto_197290 ?auto_197291 ) ( ON ?auto_197289 ?auto_197290 ) ( CLEAR ?auto_197287 ) ( ON ?auto_197288 ?auto_197289 ) ( CLEAR ?auto_197288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197293 ?auto_197292 ?auto_197291 ?auto_197290 ?auto_197289 )
      ( MAKE-8PILE ?auto_197285 ?auto_197286 ?auto_197287 ?auto_197288 ?auto_197289 ?auto_197290 ?auto_197291 ?auto_197292 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197294 - BLOCK
      ?auto_197295 - BLOCK
      ?auto_197296 - BLOCK
      ?auto_197297 - BLOCK
      ?auto_197298 - BLOCK
      ?auto_197299 - BLOCK
      ?auto_197300 - BLOCK
      ?auto_197301 - BLOCK
    )
    :vars
    (
      ?auto_197302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197294 ) ( ON ?auto_197295 ?auto_197294 ) ( not ( = ?auto_197294 ?auto_197295 ) ) ( not ( = ?auto_197294 ?auto_197296 ) ) ( not ( = ?auto_197294 ?auto_197297 ) ) ( not ( = ?auto_197294 ?auto_197298 ) ) ( not ( = ?auto_197294 ?auto_197299 ) ) ( not ( = ?auto_197294 ?auto_197300 ) ) ( not ( = ?auto_197294 ?auto_197301 ) ) ( not ( = ?auto_197295 ?auto_197296 ) ) ( not ( = ?auto_197295 ?auto_197297 ) ) ( not ( = ?auto_197295 ?auto_197298 ) ) ( not ( = ?auto_197295 ?auto_197299 ) ) ( not ( = ?auto_197295 ?auto_197300 ) ) ( not ( = ?auto_197295 ?auto_197301 ) ) ( not ( = ?auto_197296 ?auto_197297 ) ) ( not ( = ?auto_197296 ?auto_197298 ) ) ( not ( = ?auto_197296 ?auto_197299 ) ) ( not ( = ?auto_197296 ?auto_197300 ) ) ( not ( = ?auto_197296 ?auto_197301 ) ) ( not ( = ?auto_197297 ?auto_197298 ) ) ( not ( = ?auto_197297 ?auto_197299 ) ) ( not ( = ?auto_197297 ?auto_197300 ) ) ( not ( = ?auto_197297 ?auto_197301 ) ) ( not ( = ?auto_197298 ?auto_197299 ) ) ( not ( = ?auto_197298 ?auto_197300 ) ) ( not ( = ?auto_197298 ?auto_197301 ) ) ( not ( = ?auto_197299 ?auto_197300 ) ) ( not ( = ?auto_197299 ?auto_197301 ) ) ( not ( = ?auto_197300 ?auto_197301 ) ) ( ON ?auto_197301 ?auto_197302 ) ( not ( = ?auto_197294 ?auto_197302 ) ) ( not ( = ?auto_197295 ?auto_197302 ) ) ( not ( = ?auto_197296 ?auto_197302 ) ) ( not ( = ?auto_197297 ?auto_197302 ) ) ( not ( = ?auto_197298 ?auto_197302 ) ) ( not ( = ?auto_197299 ?auto_197302 ) ) ( not ( = ?auto_197300 ?auto_197302 ) ) ( not ( = ?auto_197301 ?auto_197302 ) ) ( ON ?auto_197300 ?auto_197301 ) ( ON-TABLE ?auto_197302 ) ( ON ?auto_197299 ?auto_197300 ) ( ON ?auto_197298 ?auto_197299 ) ( ON ?auto_197297 ?auto_197298 ) ( CLEAR ?auto_197297 ) ( HOLDING ?auto_197296 ) ( CLEAR ?auto_197295 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197294 ?auto_197295 ?auto_197296 )
      ( MAKE-8PILE ?auto_197294 ?auto_197295 ?auto_197296 ?auto_197297 ?auto_197298 ?auto_197299 ?auto_197300 ?auto_197301 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197303 - BLOCK
      ?auto_197304 - BLOCK
      ?auto_197305 - BLOCK
      ?auto_197306 - BLOCK
      ?auto_197307 - BLOCK
      ?auto_197308 - BLOCK
      ?auto_197309 - BLOCK
      ?auto_197310 - BLOCK
    )
    :vars
    (
      ?auto_197311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197303 ) ( ON ?auto_197304 ?auto_197303 ) ( not ( = ?auto_197303 ?auto_197304 ) ) ( not ( = ?auto_197303 ?auto_197305 ) ) ( not ( = ?auto_197303 ?auto_197306 ) ) ( not ( = ?auto_197303 ?auto_197307 ) ) ( not ( = ?auto_197303 ?auto_197308 ) ) ( not ( = ?auto_197303 ?auto_197309 ) ) ( not ( = ?auto_197303 ?auto_197310 ) ) ( not ( = ?auto_197304 ?auto_197305 ) ) ( not ( = ?auto_197304 ?auto_197306 ) ) ( not ( = ?auto_197304 ?auto_197307 ) ) ( not ( = ?auto_197304 ?auto_197308 ) ) ( not ( = ?auto_197304 ?auto_197309 ) ) ( not ( = ?auto_197304 ?auto_197310 ) ) ( not ( = ?auto_197305 ?auto_197306 ) ) ( not ( = ?auto_197305 ?auto_197307 ) ) ( not ( = ?auto_197305 ?auto_197308 ) ) ( not ( = ?auto_197305 ?auto_197309 ) ) ( not ( = ?auto_197305 ?auto_197310 ) ) ( not ( = ?auto_197306 ?auto_197307 ) ) ( not ( = ?auto_197306 ?auto_197308 ) ) ( not ( = ?auto_197306 ?auto_197309 ) ) ( not ( = ?auto_197306 ?auto_197310 ) ) ( not ( = ?auto_197307 ?auto_197308 ) ) ( not ( = ?auto_197307 ?auto_197309 ) ) ( not ( = ?auto_197307 ?auto_197310 ) ) ( not ( = ?auto_197308 ?auto_197309 ) ) ( not ( = ?auto_197308 ?auto_197310 ) ) ( not ( = ?auto_197309 ?auto_197310 ) ) ( ON ?auto_197310 ?auto_197311 ) ( not ( = ?auto_197303 ?auto_197311 ) ) ( not ( = ?auto_197304 ?auto_197311 ) ) ( not ( = ?auto_197305 ?auto_197311 ) ) ( not ( = ?auto_197306 ?auto_197311 ) ) ( not ( = ?auto_197307 ?auto_197311 ) ) ( not ( = ?auto_197308 ?auto_197311 ) ) ( not ( = ?auto_197309 ?auto_197311 ) ) ( not ( = ?auto_197310 ?auto_197311 ) ) ( ON ?auto_197309 ?auto_197310 ) ( ON-TABLE ?auto_197311 ) ( ON ?auto_197308 ?auto_197309 ) ( ON ?auto_197307 ?auto_197308 ) ( ON ?auto_197306 ?auto_197307 ) ( CLEAR ?auto_197304 ) ( ON ?auto_197305 ?auto_197306 ) ( CLEAR ?auto_197305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197311 ?auto_197310 ?auto_197309 ?auto_197308 ?auto_197307 ?auto_197306 )
      ( MAKE-8PILE ?auto_197303 ?auto_197304 ?auto_197305 ?auto_197306 ?auto_197307 ?auto_197308 ?auto_197309 ?auto_197310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197312 - BLOCK
      ?auto_197313 - BLOCK
      ?auto_197314 - BLOCK
      ?auto_197315 - BLOCK
      ?auto_197316 - BLOCK
      ?auto_197317 - BLOCK
      ?auto_197318 - BLOCK
      ?auto_197319 - BLOCK
    )
    :vars
    (
      ?auto_197320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197312 ) ( not ( = ?auto_197312 ?auto_197313 ) ) ( not ( = ?auto_197312 ?auto_197314 ) ) ( not ( = ?auto_197312 ?auto_197315 ) ) ( not ( = ?auto_197312 ?auto_197316 ) ) ( not ( = ?auto_197312 ?auto_197317 ) ) ( not ( = ?auto_197312 ?auto_197318 ) ) ( not ( = ?auto_197312 ?auto_197319 ) ) ( not ( = ?auto_197313 ?auto_197314 ) ) ( not ( = ?auto_197313 ?auto_197315 ) ) ( not ( = ?auto_197313 ?auto_197316 ) ) ( not ( = ?auto_197313 ?auto_197317 ) ) ( not ( = ?auto_197313 ?auto_197318 ) ) ( not ( = ?auto_197313 ?auto_197319 ) ) ( not ( = ?auto_197314 ?auto_197315 ) ) ( not ( = ?auto_197314 ?auto_197316 ) ) ( not ( = ?auto_197314 ?auto_197317 ) ) ( not ( = ?auto_197314 ?auto_197318 ) ) ( not ( = ?auto_197314 ?auto_197319 ) ) ( not ( = ?auto_197315 ?auto_197316 ) ) ( not ( = ?auto_197315 ?auto_197317 ) ) ( not ( = ?auto_197315 ?auto_197318 ) ) ( not ( = ?auto_197315 ?auto_197319 ) ) ( not ( = ?auto_197316 ?auto_197317 ) ) ( not ( = ?auto_197316 ?auto_197318 ) ) ( not ( = ?auto_197316 ?auto_197319 ) ) ( not ( = ?auto_197317 ?auto_197318 ) ) ( not ( = ?auto_197317 ?auto_197319 ) ) ( not ( = ?auto_197318 ?auto_197319 ) ) ( ON ?auto_197319 ?auto_197320 ) ( not ( = ?auto_197312 ?auto_197320 ) ) ( not ( = ?auto_197313 ?auto_197320 ) ) ( not ( = ?auto_197314 ?auto_197320 ) ) ( not ( = ?auto_197315 ?auto_197320 ) ) ( not ( = ?auto_197316 ?auto_197320 ) ) ( not ( = ?auto_197317 ?auto_197320 ) ) ( not ( = ?auto_197318 ?auto_197320 ) ) ( not ( = ?auto_197319 ?auto_197320 ) ) ( ON ?auto_197318 ?auto_197319 ) ( ON-TABLE ?auto_197320 ) ( ON ?auto_197317 ?auto_197318 ) ( ON ?auto_197316 ?auto_197317 ) ( ON ?auto_197315 ?auto_197316 ) ( ON ?auto_197314 ?auto_197315 ) ( CLEAR ?auto_197314 ) ( HOLDING ?auto_197313 ) ( CLEAR ?auto_197312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197312 ?auto_197313 )
      ( MAKE-8PILE ?auto_197312 ?auto_197313 ?auto_197314 ?auto_197315 ?auto_197316 ?auto_197317 ?auto_197318 ?auto_197319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197321 - BLOCK
      ?auto_197322 - BLOCK
      ?auto_197323 - BLOCK
      ?auto_197324 - BLOCK
      ?auto_197325 - BLOCK
      ?auto_197326 - BLOCK
      ?auto_197327 - BLOCK
      ?auto_197328 - BLOCK
    )
    :vars
    (
      ?auto_197329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197321 ) ( not ( = ?auto_197321 ?auto_197322 ) ) ( not ( = ?auto_197321 ?auto_197323 ) ) ( not ( = ?auto_197321 ?auto_197324 ) ) ( not ( = ?auto_197321 ?auto_197325 ) ) ( not ( = ?auto_197321 ?auto_197326 ) ) ( not ( = ?auto_197321 ?auto_197327 ) ) ( not ( = ?auto_197321 ?auto_197328 ) ) ( not ( = ?auto_197322 ?auto_197323 ) ) ( not ( = ?auto_197322 ?auto_197324 ) ) ( not ( = ?auto_197322 ?auto_197325 ) ) ( not ( = ?auto_197322 ?auto_197326 ) ) ( not ( = ?auto_197322 ?auto_197327 ) ) ( not ( = ?auto_197322 ?auto_197328 ) ) ( not ( = ?auto_197323 ?auto_197324 ) ) ( not ( = ?auto_197323 ?auto_197325 ) ) ( not ( = ?auto_197323 ?auto_197326 ) ) ( not ( = ?auto_197323 ?auto_197327 ) ) ( not ( = ?auto_197323 ?auto_197328 ) ) ( not ( = ?auto_197324 ?auto_197325 ) ) ( not ( = ?auto_197324 ?auto_197326 ) ) ( not ( = ?auto_197324 ?auto_197327 ) ) ( not ( = ?auto_197324 ?auto_197328 ) ) ( not ( = ?auto_197325 ?auto_197326 ) ) ( not ( = ?auto_197325 ?auto_197327 ) ) ( not ( = ?auto_197325 ?auto_197328 ) ) ( not ( = ?auto_197326 ?auto_197327 ) ) ( not ( = ?auto_197326 ?auto_197328 ) ) ( not ( = ?auto_197327 ?auto_197328 ) ) ( ON ?auto_197328 ?auto_197329 ) ( not ( = ?auto_197321 ?auto_197329 ) ) ( not ( = ?auto_197322 ?auto_197329 ) ) ( not ( = ?auto_197323 ?auto_197329 ) ) ( not ( = ?auto_197324 ?auto_197329 ) ) ( not ( = ?auto_197325 ?auto_197329 ) ) ( not ( = ?auto_197326 ?auto_197329 ) ) ( not ( = ?auto_197327 ?auto_197329 ) ) ( not ( = ?auto_197328 ?auto_197329 ) ) ( ON ?auto_197327 ?auto_197328 ) ( ON-TABLE ?auto_197329 ) ( ON ?auto_197326 ?auto_197327 ) ( ON ?auto_197325 ?auto_197326 ) ( ON ?auto_197324 ?auto_197325 ) ( ON ?auto_197323 ?auto_197324 ) ( CLEAR ?auto_197321 ) ( ON ?auto_197322 ?auto_197323 ) ( CLEAR ?auto_197322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197329 ?auto_197328 ?auto_197327 ?auto_197326 ?auto_197325 ?auto_197324 ?auto_197323 )
      ( MAKE-8PILE ?auto_197321 ?auto_197322 ?auto_197323 ?auto_197324 ?auto_197325 ?auto_197326 ?auto_197327 ?auto_197328 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197330 - BLOCK
      ?auto_197331 - BLOCK
      ?auto_197332 - BLOCK
      ?auto_197333 - BLOCK
      ?auto_197334 - BLOCK
      ?auto_197335 - BLOCK
      ?auto_197336 - BLOCK
      ?auto_197337 - BLOCK
    )
    :vars
    (
      ?auto_197338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197330 ?auto_197331 ) ) ( not ( = ?auto_197330 ?auto_197332 ) ) ( not ( = ?auto_197330 ?auto_197333 ) ) ( not ( = ?auto_197330 ?auto_197334 ) ) ( not ( = ?auto_197330 ?auto_197335 ) ) ( not ( = ?auto_197330 ?auto_197336 ) ) ( not ( = ?auto_197330 ?auto_197337 ) ) ( not ( = ?auto_197331 ?auto_197332 ) ) ( not ( = ?auto_197331 ?auto_197333 ) ) ( not ( = ?auto_197331 ?auto_197334 ) ) ( not ( = ?auto_197331 ?auto_197335 ) ) ( not ( = ?auto_197331 ?auto_197336 ) ) ( not ( = ?auto_197331 ?auto_197337 ) ) ( not ( = ?auto_197332 ?auto_197333 ) ) ( not ( = ?auto_197332 ?auto_197334 ) ) ( not ( = ?auto_197332 ?auto_197335 ) ) ( not ( = ?auto_197332 ?auto_197336 ) ) ( not ( = ?auto_197332 ?auto_197337 ) ) ( not ( = ?auto_197333 ?auto_197334 ) ) ( not ( = ?auto_197333 ?auto_197335 ) ) ( not ( = ?auto_197333 ?auto_197336 ) ) ( not ( = ?auto_197333 ?auto_197337 ) ) ( not ( = ?auto_197334 ?auto_197335 ) ) ( not ( = ?auto_197334 ?auto_197336 ) ) ( not ( = ?auto_197334 ?auto_197337 ) ) ( not ( = ?auto_197335 ?auto_197336 ) ) ( not ( = ?auto_197335 ?auto_197337 ) ) ( not ( = ?auto_197336 ?auto_197337 ) ) ( ON ?auto_197337 ?auto_197338 ) ( not ( = ?auto_197330 ?auto_197338 ) ) ( not ( = ?auto_197331 ?auto_197338 ) ) ( not ( = ?auto_197332 ?auto_197338 ) ) ( not ( = ?auto_197333 ?auto_197338 ) ) ( not ( = ?auto_197334 ?auto_197338 ) ) ( not ( = ?auto_197335 ?auto_197338 ) ) ( not ( = ?auto_197336 ?auto_197338 ) ) ( not ( = ?auto_197337 ?auto_197338 ) ) ( ON ?auto_197336 ?auto_197337 ) ( ON-TABLE ?auto_197338 ) ( ON ?auto_197335 ?auto_197336 ) ( ON ?auto_197334 ?auto_197335 ) ( ON ?auto_197333 ?auto_197334 ) ( ON ?auto_197332 ?auto_197333 ) ( ON ?auto_197331 ?auto_197332 ) ( CLEAR ?auto_197331 ) ( HOLDING ?auto_197330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197330 )
      ( MAKE-8PILE ?auto_197330 ?auto_197331 ?auto_197332 ?auto_197333 ?auto_197334 ?auto_197335 ?auto_197336 ?auto_197337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_197339 - BLOCK
      ?auto_197340 - BLOCK
      ?auto_197341 - BLOCK
      ?auto_197342 - BLOCK
      ?auto_197343 - BLOCK
      ?auto_197344 - BLOCK
      ?auto_197345 - BLOCK
      ?auto_197346 - BLOCK
    )
    :vars
    (
      ?auto_197347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197339 ?auto_197340 ) ) ( not ( = ?auto_197339 ?auto_197341 ) ) ( not ( = ?auto_197339 ?auto_197342 ) ) ( not ( = ?auto_197339 ?auto_197343 ) ) ( not ( = ?auto_197339 ?auto_197344 ) ) ( not ( = ?auto_197339 ?auto_197345 ) ) ( not ( = ?auto_197339 ?auto_197346 ) ) ( not ( = ?auto_197340 ?auto_197341 ) ) ( not ( = ?auto_197340 ?auto_197342 ) ) ( not ( = ?auto_197340 ?auto_197343 ) ) ( not ( = ?auto_197340 ?auto_197344 ) ) ( not ( = ?auto_197340 ?auto_197345 ) ) ( not ( = ?auto_197340 ?auto_197346 ) ) ( not ( = ?auto_197341 ?auto_197342 ) ) ( not ( = ?auto_197341 ?auto_197343 ) ) ( not ( = ?auto_197341 ?auto_197344 ) ) ( not ( = ?auto_197341 ?auto_197345 ) ) ( not ( = ?auto_197341 ?auto_197346 ) ) ( not ( = ?auto_197342 ?auto_197343 ) ) ( not ( = ?auto_197342 ?auto_197344 ) ) ( not ( = ?auto_197342 ?auto_197345 ) ) ( not ( = ?auto_197342 ?auto_197346 ) ) ( not ( = ?auto_197343 ?auto_197344 ) ) ( not ( = ?auto_197343 ?auto_197345 ) ) ( not ( = ?auto_197343 ?auto_197346 ) ) ( not ( = ?auto_197344 ?auto_197345 ) ) ( not ( = ?auto_197344 ?auto_197346 ) ) ( not ( = ?auto_197345 ?auto_197346 ) ) ( ON ?auto_197346 ?auto_197347 ) ( not ( = ?auto_197339 ?auto_197347 ) ) ( not ( = ?auto_197340 ?auto_197347 ) ) ( not ( = ?auto_197341 ?auto_197347 ) ) ( not ( = ?auto_197342 ?auto_197347 ) ) ( not ( = ?auto_197343 ?auto_197347 ) ) ( not ( = ?auto_197344 ?auto_197347 ) ) ( not ( = ?auto_197345 ?auto_197347 ) ) ( not ( = ?auto_197346 ?auto_197347 ) ) ( ON ?auto_197345 ?auto_197346 ) ( ON-TABLE ?auto_197347 ) ( ON ?auto_197344 ?auto_197345 ) ( ON ?auto_197343 ?auto_197344 ) ( ON ?auto_197342 ?auto_197343 ) ( ON ?auto_197341 ?auto_197342 ) ( ON ?auto_197340 ?auto_197341 ) ( ON ?auto_197339 ?auto_197340 ) ( CLEAR ?auto_197339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197347 ?auto_197346 ?auto_197345 ?auto_197344 ?auto_197343 ?auto_197342 ?auto_197341 ?auto_197340 )
      ( MAKE-8PILE ?auto_197339 ?auto_197340 ?auto_197341 ?auto_197342 ?auto_197343 ?auto_197344 ?auto_197345 ?auto_197346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197355 - BLOCK
      ?auto_197356 - BLOCK
      ?auto_197357 - BLOCK
      ?auto_197358 - BLOCK
      ?auto_197359 - BLOCK
      ?auto_197360 - BLOCK
      ?auto_197361 - BLOCK
    )
    :vars
    (
      ?auto_197362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197362 ?auto_197361 ) ( CLEAR ?auto_197362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197355 ) ( ON ?auto_197356 ?auto_197355 ) ( ON ?auto_197357 ?auto_197356 ) ( ON ?auto_197358 ?auto_197357 ) ( ON ?auto_197359 ?auto_197358 ) ( ON ?auto_197360 ?auto_197359 ) ( ON ?auto_197361 ?auto_197360 ) ( not ( = ?auto_197355 ?auto_197356 ) ) ( not ( = ?auto_197355 ?auto_197357 ) ) ( not ( = ?auto_197355 ?auto_197358 ) ) ( not ( = ?auto_197355 ?auto_197359 ) ) ( not ( = ?auto_197355 ?auto_197360 ) ) ( not ( = ?auto_197355 ?auto_197361 ) ) ( not ( = ?auto_197355 ?auto_197362 ) ) ( not ( = ?auto_197356 ?auto_197357 ) ) ( not ( = ?auto_197356 ?auto_197358 ) ) ( not ( = ?auto_197356 ?auto_197359 ) ) ( not ( = ?auto_197356 ?auto_197360 ) ) ( not ( = ?auto_197356 ?auto_197361 ) ) ( not ( = ?auto_197356 ?auto_197362 ) ) ( not ( = ?auto_197357 ?auto_197358 ) ) ( not ( = ?auto_197357 ?auto_197359 ) ) ( not ( = ?auto_197357 ?auto_197360 ) ) ( not ( = ?auto_197357 ?auto_197361 ) ) ( not ( = ?auto_197357 ?auto_197362 ) ) ( not ( = ?auto_197358 ?auto_197359 ) ) ( not ( = ?auto_197358 ?auto_197360 ) ) ( not ( = ?auto_197358 ?auto_197361 ) ) ( not ( = ?auto_197358 ?auto_197362 ) ) ( not ( = ?auto_197359 ?auto_197360 ) ) ( not ( = ?auto_197359 ?auto_197361 ) ) ( not ( = ?auto_197359 ?auto_197362 ) ) ( not ( = ?auto_197360 ?auto_197361 ) ) ( not ( = ?auto_197360 ?auto_197362 ) ) ( not ( = ?auto_197361 ?auto_197362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197362 ?auto_197361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197380 - BLOCK
      ?auto_197381 - BLOCK
      ?auto_197382 - BLOCK
      ?auto_197383 - BLOCK
      ?auto_197384 - BLOCK
      ?auto_197385 - BLOCK
      ?auto_197386 - BLOCK
    )
    :vars
    (
      ?auto_197387 - BLOCK
      ?auto_197388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197380 ) ( ON ?auto_197381 ?auto_197380 ) ( ON ?auto_197382 ?auto_197381 ) ( ON ?auto_197383 ?auto_197382 ) ( ON ?auto_197384 ?auto_197383 ) ( ON ?auto_197385 ?auto_197384 ) ( not ( = ?auto_197380 ?auto_197381 ) ) ( not ( = ?auto_197380 ?auto_197382 ) ) ( not ( = ?auto_197380 ?auto_197383 ) ) ( not ( = ?auto_197380 ?auto_197384 ) ) ( not ( = ?auto_197380 ?auto_197385 ) ) ( not ( = ?auto_197380 ?auto_197386 ) ) ( not ( = ?auto_197380 ?auto_197387 ) ) ( not ( = ?auto_197381 ?auto_197382 ) ) ( not ( = ?auto_197381 ?auto_197383 ) ) ( not ( = ?auto_197381 ?auto_197384 ) ) ( not ( = ?auto_197381 ?auto_197385 ) ) ( not ( = ?auto_197381 ?auto_197386 ) ) ( not ( = ?auto_197381 ?auto_197387 ) ) ( not ( = ?auto_197382 ?auto_197383 ) ) ( not ( = ?auto_197382 ?auto_197384 ) ) ( not ( = ?auto_197382 ?auto_197385 ) ) ( not ( = ?auto_197382 ?auto_197386 ) ) ( not ( = ?auto_197382 ?auto_197387 ) ) ( not ( = ?auto_197383 ?auto_197384 ) ) ( not ( = ?auto_197383 ?auto_197385 ) ) ( not ( = ?auto_197383 ?auto_197386 ) ) ( not ( = ?auto_197383 ?auto_197387 ) ) ( not ( = ?auto_197384 ?auto_197385 ) ) ( not ( = ?auto_197384 ?auto_197386 ) ) ( not ( = ?auto_197384 ?auto_197387 ) ) ( not ( = ?auto_197385 ?auto_197386 ) ) ( not ( = ?auto_197385 ?auto_197387 ) ) ( not ( = ?auto_197386 ?auto_197387 ) ) ( ON ?auto_197387 ?auto_197388 ) ( CLEAR ?auto_197387 ) ( not ( = ?auto_197380 ?auto_197388 ) ) ( not ( = ?auto_197381 ?auto_197388 ) ) ( not ( = ?auto_197382 ?auto_197388 ) ) ( not ( = ?auto_197383 ?auto_197388 ) ) ( not ( = ?auto_197384 ?auto_197388 ) ) ( not ( = ?auto_197385 ?auto_197388 ) ) ( not ( = ?auto_197386 ?auto_197388 ) ) ( not ( = ?auto_197387 ?auto_197388 ) ) ( HOLDING ?auto_197386 ) ( CLEAR ?auto_197385 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197380 ?auto_197381 ?auto_197382 ?auto_197383 ?auto_197384 ?auto_197385 ?auto_197386 ?auto_197387 )
      ( MAKE-7PILE ?auto_197380 ?auto_197381 ?auto_197382 ?auto_197383 ?auto_197384 ?auto_197385 ?auto_197386 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197389 - BLOCK
      ?auto_197390 - BLOCK
      ?auto_197391 - BLOCK
      ?auto_197392 - BLOCK
      ?auto_197393 - BLOCK
      ?auto_197394 - BLOCK
      ?auto_197395 - BLOCK
    )
    :vars
    (
      ?auto_197397 - BLOCK
      ?auto_197396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197389 ) ( ON ?auto_197390 ?auto_197389 ) ( ON ?auto_197391 ?auto_197390 ) ( ON ?auto_197392 ?auto_197391 ) ( ON ?auto_197393 ?auto_197392 ) ( ON ?auto_197394 ?auto_197393 ) ( not ( = ?auto_197389 ?auto_197390 ) ) ( not ( = ?auto_197389 ?auto_197391 ) ) ( not ( = ?auto_197389 ?auto_197392 ) ) ( not ( = ?auto_197389 ?auto_197393 ) ) ( not ( = ?auto_197389 ?auto_197394 ) ) ( not ( = ?auto_197389 ?auto_197395 ) ) ( not ( = ?auto_197389 ?auto_197397 ) ) ( not ( = ?auto_197390 ?auto_197391 ) ) ( not ( = ?auto_197390 ?auto_197392 ) ) ( not ( = ?auto_197390 ?auto_197393 ) ) ( not ( = ?auto_197390 ?auto_197394 ) ) ( not ( = ?auto_197390 ?auto_197395 ) ) ( not ( = ?auto_197390 ?auto_197397 ) ) ( not ( = ?auto_197391 ?auto_197392 ) ) ( not ( = ?auto_197391 ?auto_197393 ) ) ( not ( = ?auto_197391 ?auto_197394 ) ) ( not ( = ?auto_197391 ?auto_197395 ) ) ( not ( = ?auto_197391 ?auto_197397 ) ) ( not ( = ?auto_197392 ?auto_197393 ) ) ( not ( = ?auto_197392 ?auto_197394 ) ) ( not ( = ?auto_197392 ?auto_197395 ) ) ( not ( = ?auto_197392 ?auto_197397 ) ) ( not ( = ?auto_197393 ?auto_197394 ) ) ( not ( = ?auto_197393 ?auto_197395 ) ) ( not ( = ?auto_197393 ?auto_197397 ) ) ( not ( = ?auto_197394 ?auto_197395 ) ) ( not ( = ?auto_197394 ?auto_197397 ) ) ( not ( = ?auto_197395 ?auto_197397 ) ) ( ON ?auto_197397 ?auto_197396 ) ( not ( = ?auto_197389 ?auto_197396 ) ) ( not ( = ?auto_197390 ?auto_197396 ) ) ( not ( = ?auto_197391 ?auto_197396 ) ) ( not ( = ?auto_197392 ?auto_197396 ) ) ( not ( = ?auto_197393 ?auto_197396 ) ) ( not ( = ?auto_197394 ?auto_197396 ) ) ( not ( = ?auto_197395 ?auto_197396 ) ) ( not ( = ?auto_197397 ?auto_197396 ) ) ( CLEAR ?auto_197394 ) ( ON ?auto_197395 ?auto_197397 ) ( CLEAR ?auto_197395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197396 ?auto_197397 )
      ( MAKE-7PILE ?auto_197389 ?auto_197390 ?auto_197391 ?auto_197392 ?auto_197393 ?auto_197394 ?auto_197395 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197398 - BLOCK
      ?auto_197399 - BLOCK
      ?auto_197400 - BLOCK
      ?auto_197401 - BLOCK
      ?auto_197402 - BLOCK
      ?auto_197403 - BLOCK
      ?auto_197404 - BLOCK
    )
    :vars
    (
      ?auto_197406 - BLOCK
      ?auto_197405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197398 ) ( ON ?auto_197399 ?auto_197398 ) ( ON ?auto_197400 ?auto_197399 ) ( ON ?auto_197401 ?auto_197400 ) ( ON ?auto_197402 ?auto_197401 ) ( not ( = ?auto_197398 ?auto_197399 ) ) ( not ( = ?auto_197398 ?auto_197400 ) ) ( not ( = ?auto_197398 ?auto_197401 ) ) ( not ( = ?auto_197398 ?auto_197402 ) ) ( not ( = ?auto_197398 ?auto_197403 ) ) ( not ( = ?auto_197398 ?auto_197404 ) ) ( not ( = ?auto_197398 ?auto_197406 ) ) ( not ( = ?auto_197399 ?auto_197400 ) ) ( not ( = ?auto_197399 ?auto_197401 ) ) ( not ( = ?auto_197399 ?auto_197402 ) ) ( not ( = ?auto_197399 ?auto_197403 ) ) ( not ( = ?auto_197399 ?auto_197404 ) ) ( not ( = ?auto_197399 ?auto_197406 ) ) ( not ( = ?auto_197400 ?auto_197401 ) ) ( not ( = ?auto_197400 ?auto_197402 ) ) ( not ( = ?auto_197400 ?auto_197403 ) ) ( not ( = ?auto_197400 ?auto_197404 ) ) ( not ( = ?auto_197400 ?auto_197406 ) ) ( not ( = ?auto_197401 ?auto_197402 ) ) ( not ( = ?auto_197401 ?auto_197403 ) ) ( not ( = ?auto_197401 ?auto_197404 ) ) ( not ( = ?auto_197401 ?auto_197406 ) ) ( not ( = ?auto_197402 ?auto_197403 ) ) ( not ( = ?auto_197402 ?auto_197404 ) ) ( not ( = ?auto_197402 ?auto_197406 ) ) ( not ( = ?auto_197403 ?auto_197404 ) ) ( not ( = ?auto_197403 ?auto_197406 ) ) ( not ( = ?auto_197404 ?auto_197406 ) ) ( ON ?auto_197406 ?auto_197405 ) ( not ( = ?auto_197398 ?auto_197405 ) ) ( not ( = ?auto_197399 ?auto_197405 ) ) ( not ( = ?auto_197400 ?auto_197405 ) ) ( not ( = ?auto_197401 ?auto_197405 ) ) ( not ( = ?auto_197402 ?auto_197405 ) ) ( not ( = ?auto_197403 ?auto_197405 ) ) ( not ( = ?auto_197404 ?auto_197405 ) ) ( not ( = ?auto_197406 ?auto_197405 ) ) ( ON ?auto_197404 ?auto_197406 ) ( CLEAR ?auto_197404 ) ( ON-TABLE ?auto_197405 ) ( HOLDING ?auto_197403 ) ( CLEAR ?auto_197402 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197398 ?auto_197399 ?auto_197400 ?auto_197401 ?auto_197402 ?auto_197403 )
      ( MAKE-7PILE ?auto_197398 ?auto_197399 ?auto_197400 ?auto_197401 ?auto_197402 ?auto_197403 ?auto_197404 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197407 - BLOCK
      ?auto_197408 - BLOCK
      ?auto_197409 - BLOCK
      ?auto_197410 - BLOCK
      ?auto_197411 - BLOCK
      ?auto_197412 - BLOCK
      ?auto_197413 - BLOCK
    )
    :vars
    (
      ?auto_197414 - BLOCK
      ?auto_197415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197407 ) ( ON ?auto_197408 ?auto_197407 ) ( ON ?auto_197409 ?auto_197408 ) ( ON ?auto_197410 ?auto_197409 ) ( ON ?auto_197411 ?auto_197410 ) ( not ( = ?auto_197407 ?auto_197408 ) ) ( not ( = ?auto_197407 ?auto_197409 ) ) ( not ( = ?auto_197407 ?auto_197410 ) ) ( not ( = ?auto_197407 ?auto_197411 ) ) ( not ( = ?auto_197407 ?auto_197412 ) ) ( not ( = ?auto_197407 ?auto_197413 ) ) ( not ( = ?auto_197407 ?auto_197414 ) ) ( not ( = ?auto_197408 ?auto_197409 ) ) ( not ( = ?auto_197408 ?auto_197410 ) ) ( not ( = ?auto_197408 ?auto_197411 ) ) ( not ( = ?auto_197408 ?auto_197412 ) ) ( not ( = ?auto_197408 ?auto_197413 ) ) ( not ( = ?auto_197408 ?auto_197414 ) ) ( not ( = ?auto_197409 ?auto_197410 ) ) ( not ( = ?auto_197409 ?auto_197411 ) ) ( not ( = ?auto_197409 ?auto_197412 ) ) ( not ( = ?auto_197409 ?auto_197413 ) ) ( not ( = ?auto_197409 ?auto_197414 ) ) ( not ( = ?auto_197410 ?auto_197411 ) ) ( not ( = ?auto_197410 ?auto_197412 ) ) ( not ( = ?auto_197410 ?auto_197413 ) ) ( not ( = ?auto_197410 ?auto_197414 ) ) ( not ( = ?auto_197411 ?auto_197412 ) ) ( not ( = ?auto_197411 ?auto_197413 ) ) ( not ( = ?auto_197411 ?auto_197414 ) ) ( not ( = ?auto_197412 ?auto_197413 ) ) ( not ( = ?auto_197412 ?auto_197414 ) ) ( not ( = ?auto_197413 ?auto_197414 ) ) ( ON ?auto_197414 ?auto_197415 ) ( not ( = ?auto_197407 ?auto_197415 ) ) ( not ( = ?auto_197408 ?auto_197415 ) ) ( not ( = ?auto_197409 ?auto_197415 ) ) ( not ( = ?auto_197410 ?auto_197415 ) ) ( not ( = ?auto_197411 ?auto_197415 ) ) ( not ( = ?auto_197412 ?auto_197415 ) ) ( not ( = ?auto_197413 ?auto_197415 ) ) ( not ( = ?auto_197414 ?auto_197415 ) ) ( ON ?auto_197413 ?auto_197414 ) ( ON-TABLE ?auto_197415 ) ( CLEAR ?auto_197411 ) ( ON ?auto_197412 ?auto_197413 ) ( CLEAR ?auto_197412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197415 ?auto_197414 ?auto_197413 )
      ( MAKE-7PILE ?auto_197407 ?auto_197408 ?auto_197409 ?auto_197410 ?auto_197411 ?auto_197412 ?auto_197413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197416 - BLOCK
      ?auto_197417 - BLOCK
      ?auto_197418 - BLOCK
      ?auto_197419 - BLOCK
      ?auto_197420 - BLOCK
      ?auto_197421 - BLOCK
      ?auto_197422 - BLOCK
    )
    :vars
    (
      ?auto_197423 - BLOCK
      ?auto_197424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197416 ) ( ON ?auto_197417 ?auto_197416 ) ( ON ?auto_197418 ?auto_197417 ) ( ON ?auto_197419 ?auto_197418 ) ( not ( = ?auto_197416 ?auto_197417 ) ) ( not ( = ?auto_197416 ?auto_197418 ) ) ( not ( = ?auto_197416 ?auto_197419 ) ) ( not ( = ?auto_197416 ?auto_197420 ) ) ( not ( = ?auto_197416 ?auto_197421 ) ) ( not ( = ?auto_197416 ?auto_197422 ) ) ( not ( = ?auto_197416 ?auto_197423 ) ) ( not ( = ?auto_197417 ?auto_197418 ) ) ( not ( = ?auto_197417 ?auto_197419 ) ) ( not ( = ?auto_197417 ?auto_197420 ) ) ( not ( = ?auto_197417 ?auto_197421 ) ) ( not ( = ?auto_197417 ?auto_197422 ) ) ( not ( = ?auto_197417 ?auto_197423 ) ) ( not ( = ?auto_197418 ?auto_197419 ) ) ( not ( = ?auto_197418 ?auto_197420 ) ) ( not ( = ?auto_197418 ?auto_197421 ) ) ( not ( = ?auto_197418 ?auto_197422 ) ) ( not ( = ?auto_197418 ?auto_197423 ) ) ( not ( = ?auto_197419 ?auto_197420 ) ) ( not ( = ?auto_197419 ?auto_197421 ) ) ( not ( = ?auto_197419 ?auto_197422 ) ) ( not ( = ?auto_197419 ?auto_197423 ) ) ( not ( = ?auto_197420 ?auto_197421 ) ) ( not ( = ?auto_197420 ?auto_197422 ) ) ( not ( = ?auto_197420 ?auto_197423 ) ) ( not ( = ?auto_197421 ?auto_197422 ) ) ( not ( = ?auto_197421 ?auto_197423 ) ) ( not ( = ?auto_197422 ?auto_197423 ) ) ( ON ?auto_197423 ?auto_197424 ) ( not ( = ?auto_197416 ?auto_197424 ) ) ( not ( = ?auto_197417 ?auto_197424 ) ) ( not ( = ?auto_197418 ?auto_197424 ) ) ( not ( = ?auto_197419 ?auto_197424 ) ) ( not ( = ?auto_197420 ?auto_197424 ) ) ( not ( = ?auto_197421 ?auto_197424 ) ) ( not ( = ?auto_197422 ?auto_197424 ) ) ( not ( = ?auto_197423 ?auto_197424 ) ) ( ON ?auto_197422 ?auto_197423 ) ( ON-TABLE ?auto_197424 ) ( ON ?auto_197421 ?auto_197422 ) ( CLEAR ?auto_197421 ) ( HOLDING ?auto_197420 ) ( CLEAR ?auto_197419 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197416 ?auto_197417 ?auto_197418 ?auto_197419 ?auto_197420 )
      ( MAKE-7PILE ?auto_197416 ?auto_197417 ?auto_197418 ?auto_197419 ?auto_197420 ?auto_197421 ?auto_197422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197425 - BLOCK
      ?auto_197426 - BLOCK
      ?auto_197427 - BLOCK
      ?auto_197428 - BLOCK
      ?auto_197429 - BLOCK
      ?auto_197430 - BLOCK
      ?auto_197431 - BLOCK
    )
    :vars
    (
      ?auto_197433 - BLOCK
      ?auto_197432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197425 ) ( ON ?auto_197426 ?auto_197425 ) ( ON ?auto_197427 ?auto_197426 ) ( ON ?auto_197428 ?auto_197427 ) ( not ( = ?auto_197425 ?auto_197426 ) ) ( not ( = ?auto_197425 ?auto_197427 ) ) ( not ( = ?auto_197425 ?auto_197428 ) ) ( not ( = ?auto_197425 ?auto_197429 ) ) ( not ( = ?auto_197425 ?auto_197430 ) ) ( not ( = ?auto_197425 ?auto_197431 ) ) ( not ( = ?auto_197425 ?auto_197433 ) ) ( not ( = ?auto_197426 ?auto_197427 ) ) ( not ( = ?auto_197426 ?auto_197428 ) ) ( not ( = ?auto_197426 ?auto_197429 ) ) ( not ( = ?auto_197426 ?auto_197430 ) ) ( not ( = ?auto_197426 ?auto_197431 ) ) ( not ( = ?auto_197426 ?auto_197433 ) ) ( not ( = ?auto_197427 ?auto_197428 ) ) ( not ( = ?auto_197427 ?auto_197429 ) ) ( not ( = ?auto_197427 ?auto_197430 ) ) ( not ( = ?auto_197427 ?auto_197431 ) ) ( not ( = ?auto_197427 ?auto_197433 ) ) ( not ( = ?auto_197428 ?auto_197429 ) ) ( not ( = ?auto_197428 ?auto_197430 ) ) ( not ( = ?auto_197428 ?auto_197431 ) ) ( not ( = ?auto_197428 ?auto_197433 ) ) ( not ( = ?auto_197429 ?auto_197430 ) ) ( not ( = ?auto_197429 ?auto_197431 ) ) ( not ( = ?auto_197429 ?auto_197433 ) ) ( not ( = ?auto_197430 ?auto_197431 ) ) ( not ( = ?auto_197430 ?auto_197433 ) ) ( not ( = ?auto_197431 ?auto_197433 ) ) ( ON ?auto_197433 ?auto_197432 ) ( not ( = ?auto_197425 ?auto_197432 ) ) ( not ( = ?auto_197426 ?auto_197432 ) ) ( not ( = ?auto_197427 ?auto_197432 ) ) ( not ( = ?auto_197428 ?auto_197432 ) ) ( not ( = ?auto_197429 ?auto_197432 ) ) ( not ( = ?auto_197430 ?auto_197432 ) ) ( not ( = ?auto_197431 ?auto_197432 ) ) ( not ( = ?auto_197433 ?auto_197432 ) ) ( ON ?auto_197431 ?auto_197433 ) ( ON-TABLE ?auto_197432 ) ( ON ?auto_197430 ?auto_197431 ) ( CLEAR ?auto_197428 ) ( ON ?auto_197429 ?auto_197430 ) ( CLEAR ?auto_197429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197432 ?auto_197433 ?auto_197431 ?auto_197430 )
      ( MAKE-7PILE ?auto_197425 ?auto_197426 ?auto_197427 ?auto_197428 ?auto_197429 ?auto_197430 ?auto_197431 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197434 - BLOCK
      ?auto_197435 - BLOCK
      ?auto_197436 - BLOCK
      ?auto_197437 - BLOCK
      ?auto_197438 - BLOCK
      ?auto_197439 - BLOCK
      ?auto_197440 - BLOCK
    )
    :vars
    (
      ?auto_197441 - BLOCK
      ?auto_197442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197434 ) ( ON ?auto_197435 ?auto_197434 ) ( ON ?auto_197436 ?auto_197435 ) ( not ( = ?auto_197434 ?auto_197435 ) ) ( not ( = ?auto_197434 ?auto_197436 ) ) ( not ( = ?auto_197434 ?auto_197437 ) ) ( not ( = ?auto_197434 ?auto_197438 ) ) ( not ( = ?auto_197434 ?auto_197439 ) ) ( not ( = ?auto_197434 ?auto_197440 ) ) ( not ( = ?auto_197434 ?auto_197441 ) ) ( not ( = ?auto_197435 ?auto_197436 ) ) ( not ( = ?auto_197435 ?auto_197437 ) ) ( not ( = ?auto_197435 ?auto_197438 ) ) ( not ( = ?auto_197435 ?auto_197439 ) ) ( not ( = ?auto_197435 ?auto_197440 ) ) ( not ( = ?auto_197435 ?auto_197441 ) ) ( not ( = ?auto_197436 ?auto_197437 ) ) ( not ( = ?auto_197436 ?auto_197438 ) ) ( not ( = ?auto_197436 ?auto_197439 ) ) ( not ( = ?auto_197436 ?auto_197440 ) ) ( not ( = ?auto_197436 ?auto_197441 ) ) ( not ( = ?auto_197437 ?auto_197438 ) ) ( not ( = ?auto_197437 ?auto_197439 ) ) ( not ( = ?auto_197437 ?auto_197440 ) ) ( not ( = ?auto_197437 ?auto_197441 ) ) ( not ( = ?auto_197438 ?auto_197439 ) ) ( not ( = ?auto_197438 ?auto_197440 ) ) ( not ( = ?auto_197438 ?auto_197441 ) ) ( not ( = ?auto_197439 ?auto_197440 ) ) ( not ( = ?auto_197439 ?auto_197441 ) ) ( not ( = ?auto_197440 ?auto_197441 ) ) ( ON ?auto_197441 ?auto_197442 ) ( not ( = ?auto_197434 ?auto_197442 ) ) ( not ( = ?auto_197435 ?auto_197442 ) ) ( not ( = ?auto_197436 ?auto_197442 ) ) ( not ( = ?auto_197437 ?auto_197442 ) ) ( not ( = ?auto_197438 ?auto_197442 ) ) ( not ( = ?auto_197439 ?auto_197442 ) ) ( not ( = ?auto_197440 ?auto_197442 ) ) ( not ( = ?auto_197441 ?auto_197442 ) ) ( ON ?auto_197440 ?auto_197441 ) ( ON-TABLE ?auto_197442 ) ( ON ?auto_197439 ?auto_197440 ) ( ON ?auto_197438 ?auto_197439 ) ( CLEAR ?auto_197438 ) ( HOLDING ?auto_197437 ) ( CLEAR ?auto_197436 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197434 ?auto_197435 ?auto_197436 ?auto_197437 )
      ( MAKE-7PILE ?auto_197434 ?auto_197435 ?auto_197436 ?auto_197437 ?auto_197438 ?auto_197439 ?auto_197440 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197443 - BLOCK
      ?auto_197444 - BLOCK
      ?auto_197445 - BLOCK
      ?auto_197446 - BLOCK
      ?auto_197447 - BLOCK
      ?auto_197448 - BLOCK
      ?auto_197449 - BLOCK
    )
    :vars
    (
      ?auto_197451 - BLOCK
      ?auto_197450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197443 ) ( ON ?auto_197444 ?auto_197443 ) ( ON ?auto_197445 ?auto_197444 ) ( not ( = ?auto_197443 ?auto_197444 ) ) ( not ( = ?auto_197443 ?auto_197445 ) ) ( not ( = ?auto_197443 ?auto_197446 ) ) ( not ( = ?auto_197443 ?auto_197447 ) ) ( not ( = ?auto_197443 ?auto_197448 ) ) ( not ( = ?auto_197443 ?auto_197449 ) ) ( not ( = ?auto_197443 ?auto_197451 ) ) ( not ( = ?auto_197444 ?auto_197445 ) ) ( not ( = ?auto_197444 ?auto_197446 ) ) ( not ( = ?auto_197444 ?auto_197447 ) ) ( not ( = ?auto_197444 ?auto_197448 ) ) ( not ( = ?auto_197444 ?auto_197449 ) ) ( not ( = ?auto_197444 ?auto_197451 ) ) ( not ( = ?auto_197445 ?auto_197446 ) ) ( not ( = ?auto_197445 ?auto_197447 ) ) ( not ( = ?auto_197445 ?auto_197448 ) ) ( not ( = ?auto_197445 ?auto_197449 ) ) ( not ( = ?auto_197445 ?auto_197451 ) ) ( not ( = ?auto_197446 ?auto_197447 ) ) ( not ( = ?auto_197446 ?auto_197448 ) ) ( not ( = ?auto_197446 ?auto_197449 ) ) ( not ( = ?auto_197446 ?auto_197451 ) ) ( not ( = ?auto_197447 ?auto_197448 ) ) ( not ( = ?auto_197447 ?auto_197449 ) ) ( not ( = ?auto_197447 ?auto_197451 ) ) ( not ( = ?auto_197448 ?auto_197449 ) ) ( not ( = ?auto_197448 ?auto_197451 ) ) ( not ( = ?auto_197449 ?auto_197451 ) ) ( ON ?auto_197451 ?auto_197450 ) ( not ( = ?auto_197443 ?auto_197450 ) ) ( not ( = ?auto_197444 ?auto_197450 ) ) ( not ( = ?auto_197445 ?auto_197450 ) ) ( not ( = ?auto_197446 ?auto_197450 ) ) ( not ( = ?auto_197447 ?auto_197450 ) ) ( not ( = ?auto_197448 ?auto_197450 ) ) ( not ( = ?auto_197449 ?auto_197450 ) ) ( not ( = ?auto_197451 ?auto_197450 ) ) ( ON ?auto_197449 ?auto_197451 ) ( ON-TABLE ?auto_197450 ) ( ON ?auto_197448 ?auto_197449 ) ( ON ?auto_197447 ?auto_197448 ) ( CLEAR ?auto_197445 ) ( ON ?auto_197446 ?auto_197447 ) ( CLEAR ?auto_197446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197450 ?auto_197451 ?auto_197449 ?auto_197448 ?auto_197447 )
      ( MAKE-7PILE ?auto_197443 ?auto_197444 ?auto_197445 ?auto_197446 ?auto_197447 ?auto_197448 ?auto_197449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197452 - BLOCK
      ?auto_197453 - BLOCK
      ?auto_197454 - BLOCK
      ?auto_197455 - BLOCK
      ?auto_197456 - BLOCK
      ?auto_197457 - BLOCK
      ?auto_197458 - BLOCK
    )
    :vars
    (
      ?auto_197459 - BLOCK
      ?auto_197460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197452 ) ( ON ?auto_197453 ?auto_197452 ) ( not ( = ?auto_197452 ?auto_197453 ) ) ( not ( = ?auto_197452 ?auto_197454 ) ) ( not ( = ?auto_197452 ?auto_197455 ) ) ( not ( = ?auto_197452 ?auto_197456 ) ) ( not ( = ?auto_197452 ?auto_197457 ) ) ( not ( = ?auto_197452 ?auto_197458 ) ) ( not ( = ?auto_197452 ?auto_197459 ) ) ( not ( = ?auto_197453 ?auto_197454 ) ) ( not ( = ?auto_197453 ?auto_197455 ) ) ( not ( = ?auto_197453 ?auto_197456 ) ) ( not ( = ?auto_197453 ?auto_197457 ) ) ( not ( = ?auto_197453 ?auto_197458 ) ) ( not ( = ?auto_197453 ?auto_197459 ) ) ( not ( = ?auto_197454 ?auto_197455 ) ) ( not ( = ?auto_197454 ?auto_197456 ) ) ( not ( = ?auto_197454 ?auto_197457 ) ) ( not ( = ?auto_197454 ?auto_197458 ) ) ( not ( = ?auto_197454 ?auto_197459 ) ) ( not ( = ?auto_197455 ?auto_197456 ) ) ( not ( = ?auto_197455 ?auto_197457 ) ) ( not ( = ?auto_197455 ?auto_197458 ) ) ( not ( = ?auto_197455 ?auto_197459 ) ) ( not ( = ?auto_197456 ?auto_197457 ) ) ( not ( = ?auto_197456 ?auto_197458 ) ) ( not ( = ?auto_197456 ?auto_197459 ) ) ( not ( = ?auto_197457 ?auto_197458 ) ) ( not ( = ?auto_197457 ?auto_197459 ) ) ( not ( = ?auto_197458 ?auto_197459 ) ) ( ON ?auto_197459 ?auto_197460 ) ( not ( = ?auto_197452 ?auto_197460 ) ) ( not ( = ?auto_197453 ?auto_197460 ) ) ( not ( = ?auto_197454 ?auto_197460 ) ) ( not ( = ?auto_197455 ?auto_197460 ) ) ( not ( = ?auto_197456 ?auto_197460 ) ) ( not ( = ?auto_197457 ?auto_197460 ) ) ( not ( = ?auto_197458 ?auto_197460 ) ) ( not ( = ?auto_197459 ?auto_197460 ) ) ( ON ?auto_197458 ?auto_197459 ) ( ON-TABLE ?auto_197460 ) ( ON ?auto_197457 ?auto_197458 ) ( ON ?auto_197456 ?auto_197457 ) ( ON ?auto_197455 ?auto_197456 ) ( CLEAR ?auto_197455 ) ( HOLDING ?auto_197454 ) ( CLEAR ?auto_197453 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197452 ?auto_197453 ?auto_197454 )
      ( MAKE-7PILE ?auto_197452 ?auto_197453 ?auto_197454 ?auto_197455 ?auto_197456 ?auto_197457 ?auto_197458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197461 - BLOCK
      ?auto_197462 - BLOCK
      ?auto_197463 - BLOCK
      ?auto_197464 - BLOCK
      ?auto_197465 - BLOCK
      ?auto_197466 - BLOCK
      ?auto_197467 - BLOCK
    )
    :vars
    (
      ?auto_197469 - BLOCK
      ?auto_197468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197461 ) ( ON ?auto_197462 ?auto_197461 ) ( not ( = ?auto_197461 ?auto_197462 ) ) ( not ( = ?auto_197461 ?auto_197463 ) ) ( not ( = ?auto_197461 ?auto_197464 ) ) ( not ( = ?auto_197461 ?auto_197465 ) ) ( not ( = ?auto_197461 ?auto_197466 ) ) ( not ( = ?auto_197461 ?auto_197467 ) ) ( not ( = ?auto_197461 ?auto_197469 ) ) ( not ( = ?auto_197462 ?auto_197463 ) ) ( not ( = ?auto_197462 ?auto_197464 ) ) ( not ( = ?auto_197462 ?auto_197465 ) ) ( not ( = ?auto_197462 ?auto_197466 ) ) ( not ( = ?auto_197462 ?auto_197467 ) ) ( not ( = ?auto_197462 ?auto_197469 ) ) ( not ( = ?auto_197463 ?auto_197464 ) ) ( not ( = ?auto_197463 ?auto_197465 ) ) ( not ( = ?auto_197463 ?auto_197466 ) ) ( not ( = ?auto_197463 ?auto_197467 ) ) ( not ( = ?auto_197463 ?auto_197469 ) ) ( not ( = ?auto_197464 ?auto_197465 ) ) ( not ( = ?auto_197464 ?auto_197466 ) ) ( not ( = ?auto_197464 ?auto_197467 ) ) ( not ( = ?auto_197464 ?auto_197469 ) ) ( not ( = ?auto_197465 ?auto_197466 ) ) ( not ( = ?auto_197465 ?auto_197467 ) ) ( not ( = ?auto_197465 ?auto_197469 ) ) ( not ( = ?auto_197466 ?auto_197467 ) ) ( not ( = ?auto_197466 ?auto_197469 ) ) ( not ( = ?auto_197467 ?auto_197469 ) ) ( ON ?auto_197469 ?auto_197468 ) ( not ( = ?auto_197461 ?auto_197468 ) ) ( not ( = ?auto_197462 ?auto_197468 ) ) ( not ( = ?auto_197463 ?auto_197468 ) ) ( not ( = ?auto_197464 ?auto_197468 ) ) ( not ( = ?auto_197465 ?auto_197468 ) ) ( not ( = ?auto_197466 ?auto_197468 ) ) ( not ( = ?auto_197467 ?auto_197468 ) ) ( not ( = ?auto_197469 ?auto_197468 ) ) ( ON ?auto_197467 ?auto_197469 ) ( ON-TABLE ?auto_197468 ) ( ON ?auto_197466 ?auto_197467 ) ( ON ?auto_197465 ?auto_197466 ) ( ON ?auto_197464 ?auto_197465 ) ( CLEAR ?auto_197462 ) ( ON ?auto_197463 ?auto_197464 ) ( CLEAR ?auto_197463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197468 ?auto_197469 ?auto_197467 ?auto_197466 ?auto_197465 ?auto_197464 )
      ( MAKE-7PILE ?auto_197461 ?auto_197462 ?auto_197463 ?auto_197464 ?auto_197465 ?auto_197466 ?auto_197467 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197470 - BLOCK
      ?auto_197471 - BLOCK
      ?auto_197472 - BLOCK
      ?auto_197473 - BLOCK
      ?auto_197474 - BLOCK
      ?auto_197475 - BLOCK
      ?auto_197476 - BLOCK
    )
    :vars
    (
      ?auto_197477 - BLOCK
      ?auto_197478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197470 ) ( not ( = ?auto_197470 ?auto_197471 ) ) ( not ( = ?auto_197470 ?auto_197472 ) ) ( not ( = ?auto_197470 ?auto_197473 ) ) ( not ( = ?auto_197470 ?auto_197474 ) ) ( not ( = ?auto_197470 ?auto_197475 ) ) ( not ( = ?auto_197470 ?auto_197476 ) ) ( not ( = ?auto_197470 ?auto_197477 ) ) ( not ( = ?auto_197471 ?auto_197472 ) ) ( not ( = ?auto_197471 ?auto_197473 ) ) ( not ( = ?auto_197471 ?auto_197474 ) ) ( not ( = ?auto_197471 ?auto_197475 ) ) ( not ( = ?auto_197471 ?auto_197476 ) ) ( not ( = ?auto_197471 ?auto_197477 ) ) ( not ( = ?auto_197472 ?auto_197473 ) ) ( not ( = ?auto_197472 ?auto_197474 ) ) ( not ( = ?auto_197472 ?auto_197475 ) ) ( not ( = ?auto_197472 ?auto_197476 ) ) ( not ( = ?auto_197472 ?auto_197477 ) ) ( not ( = ?auto_197473 ?auto_197474 ) ) ( not ( = ?auto_197473 ?auto_197475 ) ) ( not ( = ?auto_197473 ?auto_197476 ) ) ( not ( = ?auto_197473 ?auto_197477 ) ) ( not ( = ?auto_197474 ?auto_197475 ) ) ( not ( = ?auto_197474 ?auto_197476 ) ) ( not ( = ?auto_197474 ?auto_197477 ) ) ( not ( = ?auto_197475 ?auto_197476 ) ) ( not ( = ?auto_197475 ?auto_197477 ) ) ( not ( = ?auto_197476 ?auto_197477 ) ) ( ON ?auto_197477 ?auto_197478 ) ( not ( = ?auto_197470 ?auto_197478 ) ) ( not ( = ?auto_197471 ?auto_197478 ) ) ( not ( = ?auto_197472 ?auto_197478 ) ) ( not ( = ?auto_197473 ?auto_197478 ) ) ( not ( = ?auto_197474 ?auto_197478 ) ) ( not ( = ?auto_197475 ?auto_197478 ) ) ( not ( = ?auto_197476 ?auto_197478 ) ) ( not ( = ?auto_197477 ?auto_197478 ) ) ( ON ?auto_197476 ?auto_197477 ) ( ON-TABLE ?auto_197478 ) ( ON ?auto_197475 ?auto_197476 ) ( ON ?auto_197474 ?auto_197475 ) ( ON ?auto_197473 ?auto_197474 ) ( ON ?auto_197472 ?auto_197473 ) ( CLEAR ?auto_197472 ) ( HOLDING ?auto_197471 ) ( CLEAR ?auto_197470 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197470 ?auto_197471 )
      ( MAKE-7PILE ?auto_197470 ?auto_197471 ?auto_197472 ?auto_197473 ?auto_197474 ?auto_197475 ?auto_197476 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197479 - BLOCK
      ?auto_197480 - BLOCK
      ?auto_197481 - BLOCK
      ?auto_197482 - BLOCK
      ?auto_197483 - BLOCK
      ?auto_197484 - BLOCK
      ?auto_197485 - BLOCK
    )
    :vars
    (
      ?auto_197487 - BLOCK
      ?auto_197486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197479 ) ( not ( = ?auto_197479 ?auto_197480 ) ) ( not ( = ?auto_197479 ?auto_197481 ) ) ( not ( = ?auto_197479 ?auto_197482 ) ) ( not ( = ?auto_197479 ?auto_197483 ) ) ( not ( = ?auto_197479 ?auto_197484 ) ) ( not ( = ?auto_197479 ?auto_197485 ) ) ( not ( = ?auto_197479 ?auto_197487 ) ) ( not ( = ?auto_197480 ?auto_197481 ) ) ( not ( = ?auto_197480 ?auto_197482 ) ) ( not ( = ?auto_197480 ?auto_197483 ) ) ( not ( = ?auto_197480 ?auto_197484 ) ) ( not ( = ?auto_197480 ?auto_197485 ) ) ( not ( = ?auto_197480 ?auto_197487 ) ) ( not ( = ?auto_197481 ?auto_197482 ) ) ( not ( = ?auto_197481 ?auto_197483 ) ) ( not ( = ?auto_197481 ?auto_197484 ) ) ( not ( = ?auto_197481 ?auto_197485 ) ) ( not ( = ?auto_197481 ?auto_197487 ) ) ( not ( = ?auto_197482 ?auto_197483 ) ) ( not ( = ?auto_197482 ?auto_197484 ) ) ( not ( = ?auto_197482 ?auto_197485 ) ) ( not ( = ?auto_197482 ?auto_197487 ) ) ( not ( = ?auto_197483 ?auto_197484 ) ) ( not ( = ?auto_197483 ?auto_197485 ) ) ( not ( = ?auto_197483 ?auto_197487 ) ) ( not ( = ?auto_197484 ?auto_197485 ) ) ( not ( = ?auto_197484 ?auto_197487 ) ) ( not ( = ?auto_197485 ?auto_197487 ) ) ( ON ?auto_197487 ?auto_197486 ) ( not ( = ?auto_197479 ?auto_197486 ) ) ( not ( = ?auto_197480 ?auto_197486 ) ) ( not ( = ?auto_197481 ?auto_197486 ) ) ( not ( = ?auto_197482 ?auto_197486 ) ) ( not ( = ?auto_197483 ?auto_197486 ) ) ( not ( = ?auto_197484 ?auto_197486 ) ) ( not ( = ?auto_197485 ?auto_197486 ) ) ( not ( = ?auto_197487 ?auto_197486 ) ) ( ON ?auto_197485 ?auto_197487 ) ( ON-TABLE ?auto_197486 ) ( ON ?auto_197484 ?auto_197485 ) ( ON ?auto_197483 ?auto_197484 ) ( ON ?auto_197482 ?auto_197483 ) ( ON ?auto_197481 ?auto_197482 ) ( CLEAR ?auto_197479 ) ( ON ?auto_197480 ?auto_197481 ) ( CLEAR ?auto_197480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197486 ?auto_197487 ?auto_197485 ?auto_197484 ?auto_197483 ?auto_197482 ?auto_197481 )
      ( MAKE-7PILE ?auto_197479 ?auto_197480 ?auto_197481 ?auto_197482 ?auto_197483 ?auto_197484 ?auto_197485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197488 - BLOCK
      ?auto_197489 - BLOCK
      ?auto_197490 - BLOCK
      ?auto_197491 - BLOCK
      ?auto_197492 - BLOCK
      ?auto_197493 - BLOCK
      ?auto_197494 - BLOCK
    )
    :vars
    (
      ?auto_197495 - BLOCK
      ?auto_197496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197488 ?auto_197489 ) ) ( not ( = ?auto_197488 ?auto_197490 ) ) ( not ( = ?auto_197488 ?auto_197491 ) ) ( not ( = ?auto_197488 ?auto_197492 ) ) ( not ( = ?auto_197488 ?auto_197493 ) ) ( not ( = ?auto_197488 ?auto_197494 ) ) ( not ( = ?auto_197488 ?auto_197495 ) ) ( not ( = ?auto_197489 ?auto_197490 ) ) ( not ( = ?auto_197489 ?auto_197491 ) ) ( not ( = ?auto_197489 ?auto_197492 ) ) ( not ( = ?auto_197489 ?auto_197493 ) ) ( not ( = ?auto_197489 ?auto_197494 ) ) ( not ( = ?auto_197489 ?auto_197495 ) ) ( not ( = ?auto_197490 ?auto_197491 ) ) ( not ( = ?auto_197490 ?auto_197492 ) ) ( not ( = ?auto_197490 ?auto_197493 ) ) ( not ( = ?auto_197490 ?auto_197494 ) ) ( not ( = ?auto_197490 ?auto_197495 ) ) ( not ( = ?auto_197491 ?auto_197492 ) ) ( not ( = ?auto_197491 ?auto_197493 ) ) ( not ( = ?auto_197491 ?auto_197494 ) ) ( not ( = ?auto_197491 ?auto_197495 ) ) ( not ( = ?auto_197492 ?auto_197493 ) ) ( not ( = ?auto_197492 ?auto_197494 ) ) ( not ( = ?auto_197492 ?auto_197495 ) ) ( not ( = ?auto_197493 ?auto_197494 ) ) ( not ( = ?auto_197493 ?auto_197495 ) ) ( not ( = ?auto_197494 ?auto_197495 ) ) ( ON ?auto_197495 ?auto_197496 ) ( not ( = ?auto_197488 ?auto_197496 ) ) ( not ( = ?auto_197489 ?auto_197496 ) ) ( not ( = ?auto_197490 ?auto_197496 ) ) ( not ( = ?auto_197491 ?auto_197496 ) ) ( not ( = ?auto_197492 ?auto_197496 ) ) ( not ( = ?auto_197493 ?auto_197496 ) ) ( not ( = ?auto_197494 ?auto_197496 ) ) ( not ( = ?auto_197495 ?auto_197496 ) ) ( ON ?auto_197494 ?auto_197495 ) ( ON-TABLE ?auto_197496 ) ( ON ?auto_197493 ?auto_197494 ) ( ON ?auto_197492 ?auto_197493 ) ( ON ?auto_197491 ?auto_197492 ) ( ON ?auto_197490 ?auto_197491 ) ( ON ?auto_197489 ?auto_197490 ) ( CLEAR ?auto_197489 ) ( HOLDING ?auto_197488 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197488 )
      ( MAKE-7PILE ?auto_197488 ?auto_197489 ?auto_197490 ?auto_197491 ?auto_197492 ?auto_197493 ?auto_197494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_197497 - BLOCK
      ?auto_197498 - BLOCK
      ?auto_197499 - BLOCK
      ?auto_197500 - BLOCK
      ?auto_197501 - BLOCK
      ?auto_197502 - BLOCK
      ?auto_197503 - BLOCK
    )
    :vars
    (
      ?auto_197504 - BLOCK
      ?auto_197505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197497 ?auto_197498 ) ) ( not ( = ?auto_197497 ?auto_197499 ) ) ( not ( = ?auto_197497 ?auto_197500 ) ) ( not ( = ?auto_197497 ?auto_197501 ) ) ( not ( = ?auto_197497 ?auto_197502 ) ) ( not ( = ?auto_197497 ?auto_197503 ) ) ( not ( = ?auto_197497 ?auto_197504 ) ) ( not ( = ?auto_197498 ?auto_197499 ) ) ( not ( = ?auto_197498 ?auto_197500 ) ) ( not ( = ?auto_197498 ?auto_197501 ) ) ( not ( = ?auto_197498 ?auto_197502 ) ) ( not ( = ?auto_197498 ?auto_197503 ) ) ( not ( = ?auto_197498 ?auto_197504 ) ) ( not ( = ?auto_197499 ?auto_197500 ) ) ( not ( = ?auto_197499 ?auto_197501 ) ) ( not ( = ?auto_197499 ?auto_197502 ) ) ( not ( = ?auto_197499 ?auto_197503 ) ) ( not ( = ?auto_197499 ?auto_197504 ) ) ( not ( = ?auto_197500 ?auto_197501 ) ) ( not ( = ?auto_197500 ?auto_197502 ) ) ( not ( = ?auto_197500 ?auto_197503 ) ) ( not ( = ?auto_197500 ?auto_197504 ) ) ( not ( = ?auto_197501 ?auto_197502 ) ) ( not ( = ?auto_197501 ?auto_197503 ) ) ( not ( = ?auto_197501 ?auto_197504 ) ) ( not ( = ?auto_197502 ?auto_197503 ) ) ( not ( = ?auto_197502 ?auto_197504 ) ) ( not ( = ?auto_197503 ?auto_197504 ) ) ( ON ?auto_197504 ?auto_197505 ) ( not ( = ?auto_197497 ?auto_197505 ) ) ( not ( = ?auto_197498 ?auto_197505 ) ) ( not ( = ?auto_197499 ?auto_197505 ) ) ( not ( = ?auto_197500 ?auto_197505 ) ) ( not ( = ?auto_197501 ?auto_197505 ) ) ( not ( = ?auto_197502 ?auto_197505 ) ) ( not ( = ?auto_197503 ?auto_197505 ) ) ( not ( = ?auto_197504 ?auto_197505 ) ) ( ON ?auto_197503 ?auto_197504 ) ( ON-TABLE ?auto_197505 ) ( ON ?auto_197502 ?auto_197503 ) ( ON ?auto_197501 ?auto_197502 ) ( ON ?auto_197500 ?auto_197501 ) ( ON ?auto_197499 ?auto_197500 ) ( ON ?auto_197498 ?auto_197499 ) ( ON ?auto_197497 ?auto_197498 ) ( CLEAR ?auto_197497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197505 ?auto_197504 ?auto_197503 ?auto_197502 ?auto_197501 ?auto_197500 ?auto_197499 ?auto_197498 )
      ( MAKE-7PILE ?auto_197497 ?auto_197498 ?auto_197499 ?auto_197500 ?auto_197501 ?auto_197502 ?auto_197503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_197507 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_197507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197508 - BLOCK
    )
    :vars
    (
      ?auto_197509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197508 ?auto_197509 ) ( CLEAR ?auto_197508 ) ( HAND-EMPTY ) ( not ( = ?auto_197508 ?auto_197509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197508 ?auto_197509 )
      ( MAKE-1PILE ?auto_197508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197510 - BLOCK
    )
    :vars
    (
      ?auto_197511 - BLOCK
      ?auto_197517 - BLOCK
      ?auto_197512 - BLOCK
      ?auto_197514 - BLOCK
      ?auto_197515 - BLOCK
      ?auto_197516 - BLOCK
      ?auto_197513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197510 ?auto_197511 ) ) ( HOLDING ?auto_197510 ) ( CLEAR ?auto_197511 ) ( ON-TABLE ?auto_197517 ) ( ON ?auto_197512 ?auto_197517 ) ( ON ?auto_197514 ?auto_197512 ) ( ON ?auto_197515 ?auto_197514 ) ( ON ?auto_197516 ?auto_197515 ) ( ON ?auto_197513 ?auto_197516 ) ( ON ?auto_197511 ?auto_197513 ) ( not ( = ?auto_197517 ?auto_197512 ) ) ( not ( = ?auto_197517 ?auto_197514 ) ) ( not ( = ?auto_197517 ?auto_197515 ) ) ( not ( = ?auto_197517 ?auto_197516 ) ) ( not ( = ?auto_197517 ?auto_197513 ) ) ( not ( = ?auto_197517 ?auto_197511 ) ) ( not ( = ?auto_197517 ?auto_197510 ) ) ( not ( = ?auto_197512 ?auto_197514 ) ) ( not ( = ?auto_197512 ?auto_197515 ) ) ( not ( = ?auto_197512 ?auto_197516 ) ) ( not ( = ?auto_197512 ?auto_197513 ) ) ( not ( = ?auto_197512 ?auto_197511 ) ) ( not ( = ?auto_197512 ?auto_197510 ) ) ( not ( = ?auto_197514 ?auto_197515 ) ) ( not ( = ?auto_197514 ?auto_197516 ) ) ( not ( = ?auto_197514 ?auto_197513 ) ) ( not ( = ?auto_197514 ?auto_197511 ) ) ( not ( = ?auto_197514 ?auto_197510 ) ) ( not ( = ?auto_197515 ?auto_197516 ) ) ( not ( = ?auto_197515 ?auto_197513 ) ) ( not ( = ?auto_197515 ?auto_197511 ) ) ( not ( = ?auto_197515 ?auto_197510 ) ) ( not ( = ?auto_197516 ?auto_197513 ) ) ( not ( = ?auto_197516 ?auto_197511 ) ) ( not ( = ?auto_197516 ?auto_197510 ) ) ( not ( = ?auto_197513 ?auto_197511 ) ) ( not ( = ?auto_197513 ?auto_197510 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197517 ?auto_197512 ?auto_197514 ?auto_197515 ?auto_197516 ?auto_197513 ?auto_197511 ?auto_197510 )
      ( MAKE-1PILE ?auto_197510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197518 - BLOCK
    )
    :vars
    (
      ?auto_197524 - BLOCK
      ?auto_197521 - BLOCK
      ?auto_197522 - BLOCK
      ?auto_197520 - BLOCK
      ?auto_197523 - BLOCK
      ?auto_197519 - BLOCK
      ?auto_197525 - BLOCK
      ?auto_197526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197518 ?auto_197524 ) ) ( CLEAR ?auto_197524 ) ( ON-TABLE ?auto_197521 ) ( ON ?auto_197522 ?auto_197521 ) ( ON ?auto_197520 ?auto_197522 ) ( ON ?auto_197523 ?auto_197520 ) ( ON ?auto_197519 ?auto_197523 ) ( ON ?auto_197525 ?auto_197519 ) ( ON ?auto_197524 ?auto_197525 ) ( not ( = ?auto_197521 ?auto_197522 ) ) ( not ( = ?auto_197521 ?auto_197520 ) ) ( not ( = ?auto_197521 ?auto_197523 ) ) ( not ( = ?auto_197521 ?auto_197519 ) ) ( not ( = ?auto_197521 ?auto_197525 ) ) ( not ( = ?auto_197521 ?auto_197524 ) ) ( not ( = ?auto_197521 ?auto_197518 ) ) ( not ( = ?auto_197522 ?auto_197520 ) ) ( not ( = ?auto_197522 ?auto_197523 ) ) ( not ( = ?auto_197522 ?auto_197519 ) ) ( not ( = ?auto_197522 ?auto_197525 ) ) ( not ( = ?auto_197522 ?auto_197524 ) ) ( not ( = ?auto_197522 ?auto_197518 ) ) ( not ( = ?auto_197520 ?auto_197523 ) ) ( not ( = ?auto_197520 ?auto_197519 ) ) ( not ( = ?auto_197520 ?auto_197525 ) ) ( not ( = ?auto_197520 ?auto_197524 ) ) ( not ( = ?auto_197520 ?auto_197518 ) ) ( not ( = ?auto_197523 ?auto_197519 ) ) ( not ( = ?auto_197523 ?auto_197525 ) ) ( not ( = ?auto_197523 ?auto_197524 ) ) ( not ( = ?auto_197523 ?auto_197518 ) ) ( not ( = ?auto_197519 ?auto_197525 ) ) ( not ( = ?auto_197519 ?auto_197524 ) ) ( not ( = ?auto_197519 ?auto_197518 ) ) ( not ( = ?auto_197525 ?auto_197524 ) ) ( not ( = ?auto_197525 ?auto_197518 ) ) ( ON ?auto_197518 ?auto_197526 ) ( CLEAR ?auto_197518 ) ( HAND-EMPTY ) ( not ( = ?auto_197518 ?auto_197526 ) ) ( not ( = ?auto_197524 ?auto_197526 ) ) ( not ( = ?auto_197521 ?auto_197526 ) ) ( not ( = ?auto_197522 ?auto_197526 ) ) ( not ( = ?auto_197520 ?auto_197526 ) ) ( not ( = ?auto_197523 ?auto_197526 ) ) ( not ( = ?auto_197519 ?auto_197526 ) ) ( not ( = ?auto_197525 ?auto_197526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197518 ?auto_197526 )
      ( MAKE-1PILE ?auto_197518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197527 - BLOCK
    )
    :vars
    (
      ?auto_197533 - BLOCK
      ?auto_197530 - BLOCK
      ?auto_197531 - BLOCK
      ?auto_197532 - BLOCK
      ?auto_197529 - BLOCK
      ?auto_197534 - BLOCK
      ?auto_197535 - BLOCK
      ?auto_197528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197527 ?auto_197533 ) ) ( ON-TABLE ?auto_197530 ) ( ON ?auto_197531 ?auto_197530 ) ( ON ?auto_197532 ?auto_197531 ) ( ON ?auto_197529 ?auto_197532 ) ( ON ?auto_197534 ?auto_197529 ) ( ON ?auto_197535 ?auto_197534 ) ( not ( = ?auto_197530 ?auto_197531 ) ) ( not ( = ?auto_197530 ?auto_197532 ) ) ( not ( = ?auto_197530 ?auto_197529 ) ) ( not ( = ?auto_197530 ?auto_197534 ) ) ( not ( = ?auto_197530 ?auto_197535 ) ) ( not ( = ?auto_197530 ?auto_197533 ) ) ( not ( = ?auto_197530 ?auto_197527 ) ) ( not ( = ?auto_197531 ?auto_197532 ) ) ( not ( = ?auto_197531 ?auto_197529 ) ) ( not ( = ?auto_197531 ?auto_197534 ) ) ( not ( = ?auto_197531 ?auto_197535 ) ) ( not ( = ?auto_197531 ?auto_197533 ) ) ( not ( = ?auto_197531 ?auto_197527 ) ) ( not ( = ?auto_197532 ?auto_197529 ) ) ( not ( = ?auto_197532 ?auto_197534 ) ) ( not ( = ?auto_197532 ?auto_197535 ) ) ( not ( = ?auto_197532 ?auto_197533 ) ) ( not ( = ?auto_197532 ?auto_197527 ) ) ( not ( = ?auto_197529 ?auto_197534 ) ) ( not ( = ?auto_197529 ?auto_197535 ) ) ( not ( = ?auto_197529 ?auto_197533 ) ) ( not ( = ?auto_197529 ?auto_197527 ) ) ( not ( = ?auto_197534 ?auto_197535 ) ) ( not ( = ?auto_197534 ?auto_197533 ) ) ( not ( = ?auto_197534 ?auto_197527 ) ) ( not ( = ?auto_197535 ?auto_197533 ) ) ( not ( = ?auto_197535 ?auto_197527 ) ) ( ON ?auto_197527 ?auto_197528 ) ( CLEAR ?auto_197527 ) ( not ( = ?auto_197527 ?auto_197528 ) ) ( not ( = ?auto_197533 ?auto_197528 ) ) ( not ( = ?auto_197530 ?auto_197528 ) ) ( not ( = ?auto_197531 ?auto_197528 ) ) ( not ( = ?auto_197532 ?auto_197528 ) ) ( not ( = ?auto_197529 ?auto_197528 ) ) ( not ( = ?auto_197534 ?auto_197528 ) ) ( not ( = ?auto_197535 ?auto_197528 ) ) ( HOLDING ?auto_197533 ) ( CLEAR ?auto_197535 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197530 ?auto_197531 ?auto_197532 ?auto_197529 ?auto_197534 ?auto_197535 ?auto_197533 )
      ( MAKE-1PILE ?auto_197527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197536 - BLOCK
    )
    :vars
    (
      ?auto_197540 - BLOCK
      ?auto_197543 - BLOCK
      ?auto_197544 - BLOCK
      ?auto_197542 - BLOCK
      ?auto_197541 - BLOCK
      ?auto_197537 - BLOCK
      ?auto_197539 - BLOCK
      ?auto_197538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197536 ?auto_197540 ) ) ( ON-TABLE ?auto_197543 ) ( ON ?auto_197544 ?auto_197543 ) ( ON ?auto_197542 ?auto_197544 ) ( ON ?auto_197541 ?auto_197542 ) ( ON ?auto_197537 ?auto_197541 ) ( ON ?auto_197539 ?auto_197537 ) ( not ( = ?auto_197543 ?auto_197544 ) ) ( not ( = ?auto_197543 ?auto_197542 ) ) ( not ( = ?auto_197543 ?auto_197541 ) ) ( not ( = ?auto_197543 ?auto_197537 ) ) ( not ( = ?auto_197543 ?auto_197539 ) ) ( not ( = ?auto_197543 ?auto_197540 ) ) ( not ( = ?auto_197543 ?auto_197536 ) ) ( not ( = ?auto_197544 ?auto_197542 ) ) ( not ( = ?auto_197544 ?auto_197541 ) ) ( not ( = ?auto_197544 ?auto_197537 ) ) ( not ( = ?auto_197544 ?auto_197539 ) ) ( not ( = ?auto_197544 ?auto_197540 ) ) ( not ( = ?auto_197544 ?auto_197536 ) ) ( not ( = ?auto_197542 ?auto_197541 ) ) ( not ( = ?auto_197542 ?auto_197537 ) ) ( not ( = ?auto_197542 ?auto_197539 ) ) ( not ( = ?auto_197542 ?auto_197540 ) ) ( not ( = ?auto_197542 ?auto_197536 ) ) ( not ( = ?auto_197541 ?auto_197537 ) ) ( not ( = ?auto_197541 ?auto_197539 ) ) ( not ( = ?auto_197541 ?auto_197540 ) ) ( not ( = ?auto_197541 ?auto_197536 ) ) ( not ( = ?auto_197537 ?auto_197539 ) ) ( not ( = ?auto_197537 ?auto_197540 ) ) ( not ( = ?auto_197537 ?auto_197536 ) ) ( not ( = ?auto_197539 ?auto_197540 ) ) ( not ( = ?auto_197539 ?auto_197536 ) ) ( ON ?auto_197536 ?auto_197538 ) ( not ( = ?auto_197536 ?auto_197538 ) ) ( not ( = ?auto_197540 ?auto_197538 ) ) ( not ( = ?auto_197543 ?auto_197538 ) ) ( not ( = ?auto_197544 ?auto_197538 ) ) ( not ( = ?auto_197542 ?auto_197538 ) ) ( not ( = ?auto_197541 ?auto_197538 ) ) ( not ( = ?auto_197537 ?auto_197538 ) ) ( not ( = ?auto_197539 ?auto_197538 ) ) ( CLEAR ?auto_197539 ) ( ON ?auto_197540 ?auto_197536 ) ( CLEAR ?auto_197540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197538 ?auto_197536 )
      ( MAKE-1PILE ?auto_197536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197545 - BLOCK
    )
    :vars
    (
      ?auto_197547 - BLOCK
      ?auto_197550 - BLOCK
      ?auto_197552 - BLOCK
      ?auto_197546 - BLOCK
      ?auto_197551 - BLOCK
      ?auto_197553 - BLOCK
      ?auto_197548 - BLOCK
      ?auto_197549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197545 ?auto_197547 ) ) ( ON-TABLE ?auto_197550 ) ( ON ?auto_197552 ?auto_197550 ) ( ON ?auto_197546 ?auto_197552 ) ( ON ?auto_197551 ?auto_197546 ) ( ON ?auto_197553 ?auto_197551 ) ( not ( = ?auto_197550 ?auto_197552 ) ) ( not ( = ?auto_197550 ?auto_197546 ) ) ( not ( = ?auto_197550 ?auto_197551 ) ) ( not ( = ?auto_197550 ?auto_197553 ) ) ( not ( = ?auto_197550 ?auto_197548 ) ) ( not ( = ?auto_197550 ?auto_197547 ) ) ( not ( = ?auto_197550 ?auto_197545 ) ) ( not ( = ?auto_197552 ?auto_197546 ) ) ( not ( = ?auto_197552 ?auto_197551 ) ) ( not ( = ?auto_197552 ?auto_197553 ) ) ( not ( = ?auto_197552 ?auto_197548 ) ) ( not ( = ?auto_197552 ?auto_197547 ) ) ( not ( = ?auto_197552 ?auto_197545 ) ) ( not ( = ?auto_197546 ?auto_197551 ) ) ( not ( = ?auto_197546 ?auto_197553 ) ) ( not ( = ?auto_197546 ?auto_197548 ) ) ( not ( = ?auto_197546 ?auto_197547 ) ) ( not ( = ?auto_197546 ?auto_197545 ) ) ( not ( = ?auto_197551 ?auto_197553 ) ) ( not ( = ?auto_197551 ?auto_197548 ) ) ( not ( = ?auto_197551 ?auto_197547 ) ) ( not ( = ?auto_197551 ?auto_197545 ) ) ( not ( = ?auto_197553 ?auto_197548 ) ) ( not ( = ?auto_197553 ?auto_197547 ) ) ( not ( = ?auto_197553 ?auto_197545 ) ) ( not ( = ?auto_197548 ?auto_197547 ) ) ( not ( = ?auto_197548 ?auto_197545 ) ) ( ON ?auto_197545 ?auto_197549 ) ( not ( = ?auto_197545 ?auto_197549 ) ) ( not ( = ?auto_197547 ?auto_197549 ) ) ( not ( = ?auto_197550 ?auto_197549 ) ) ( not ( = ?auto_197552 ?auto_197549 ) ) ( not ( = ?auto_197546 ?auto_197549 ) ) ( not ( = ?auto_197551 ?auto_197549 ) ) ( not ( = ?auto_197553 ?auto_197549 ) ) ( not ( = ?auto_197548 ?auto_197549 ) ) ( ON ?auto_197547 ?auto_197545 ) ( CLEAR ?auto_197547 ) ( ON-TABLE ?auto_197549 ) ( HOLDING ?auto_197548 ) ( CLEAR ?auto_197553 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197550 ?auto_197552 ?auto_197546 ?auto_197551 ?auto_197553 ?auto_197548 )
      ( MAKE-1PILE ?auto_197545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197554 - BLOCK
    )
    :vars
    (
      ?auto_197556 - BLOCK
      ?auto_197559 - BLOCK
      ?auto_197558 - BLOCK
      ?auto_197555 - BLOCK
      ?auto_197562 - BLOCK
      ?auto_197557 - BLOCK
      ?auto_197560 - BLOCK
      ?auto_197561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197554 ?auto_197556 ) ) ( ON-TABLE ?auto_197559 ) ( ON ?auto_197558 ?auto_197559 ) ( ON ?auto_197555 ?auto_197558 ) ( ON ?auto_197562 ?auto_197555 ) ( ON ?auto_197557 ?auto_197562 ) ( not ( = ?auto_197559 ?auto_197558 ) ) ( not ( = ?auto_197559 ?auto_197555 ) ) ( not ( = ?auto_197559 ?auto_197562 ) ) ( not ( = ?auto_197559 ?auto_197557 ) ) ( not ( = ?auto_197559 ?auto_197560 ) ) ( not ( = ?auto_197559 ?auto_197556 ) ) ( not ( = ?auto_197559 ?auto_197554 ) ) ( not ( = ?auto_197558 ?auto_197555 ) ) ( not ( = ?auto_197558 ?auto_197562 ) ) ( not ( = ?auto_197558 ?auto_197557 ) ) ( not ( = ?auto_197558 ?auto_197560 ) ) ( not ( = ?auto_197558 ?auto_197556 ) ) ( not ( = ?auto_197558 ?auto_197554 ) ) ( not ( = ?auto_197555 ?auto_197562 ) ) ( not ( = ?auto_197555 ?auto_197557 ) ) ( not ( = ?auto_197555 ?auto_197560 ) ) ( not ( = ?auto_197555 ?auto_197556 ) ) ( not ( = ?auto_197555 ?auto_197554 ) ) ( not ( = ?auto_197562 ?auto_197557 ) ) ( not ( = ?auto_197562 ?auto_197560 ) ) ( not ( = ?auto_197562 ?auto_197556 ) ) ( not ( = ?auto_197562 ?auto_197554 ) ) ( not ( = ?auto_197557 ?auto_197560 ) ) ( not ( = ?auto_197557 ?auto_197556 ) ) ( not ( = ?auto_197557 ?auto_197554 ) ) ( not ( = ?auto_197560 ?auto_197556 ) ) ( not ( = ?auto_197560 ?auto_197554 ) ) ( ON ?auto_197554 ?auto_197561 ) ( not ( = ?auto_197554 ?auto_197561 ) ) ( not ( = ?auto_197556 ?auto_197561 ) ) ( not ( = ?auto_197559 ?auto_197561 ) ) ( not ( = ?auto_197558 ?auto_197561 ) ) ( not ( = ?auto_197555 ?auto_197561 ) ) ( not ( = ?auto_197562 ?auto_197561 ) ) ( not ( = ?auto_197557 ?auto_197561 ) ) ( not ( = ?auto_197560 ?auto_197561 ) ) ( ON ?auto_197556 ?auto_197554 ) ( ON-TABLE ?auto_197561 ) ( CLEAR ?auto_197557 ) ( ON ?auto_197560 ?auto_197556 ) ( CLEAR ?auto_197560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197561 ?auto_197554 ?auto_197556 )
      ( MAKE-1PILE ?auto_197554 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197563 - BLOCK
    )
    :vars
    (
      ?auto_197565 - BLOCK
      ?auto_197570 - BLOCK
      ?auto_197568 - BLOCK
      ?auto_197569 - BLOCK
      ?auto_197564 - BLOCK
      ?auto_197567 - BLOCK
      ?auto_197566 - BLOCK
      ?auto_197571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197563 ?auto_197565 ) ) ( ON-TABLE ?auto_197570 ) ( ON ?auto_197568 ?auto_197570 ) ( ON ?auto_197569 ?auto_197568 ) ( ON ?auto_197564 ?auto_197569 ) ( not ( = ?auto_197570 ?auto_197568 ) ) ( not ( = ?auto_197570 ?auto_197569 ) ) ( not ( = ?auto_197570 ?auto_197564 ) ) ( not ( = ?auto_197570 ?auto_197567 ) ) ( not ( = ?auto_197570 ?auto_197566 ) ) ( not ( = ?auto_197570 ?auto_197565 ) ) ( not ( = ?auto_197570 ?auto_197563 ) ) ( not ( = ?auto_197568 ?auto_197569 ) ) ( not ( = ?auto_197568 ?auto_197564 ) ) ( not ( = ?auto_197568 ?auto_197567 ) ) ( not ( = ?auto_197568 ?auto_197566 ) ) ( not ( = ?auto_197568 ?auto_197565 ) ) ( not ( = ?auto_197568 ?auto_197563 ) ) ( not ( = ?auto_197569 ?auto_197564 ) ) ( not ( = ?auto_197569 ?auto_197567 ) ) ( not ( = ?auto_197569 ?auto_197566 ) ) ( not ( = ?auto_197569 ?auto_197565 ) ) ( not ( = ?auto_197569 ?auto_197563 ) ) ( not ( = ?auto_197564 ?auto_197567 ) ) ( not ( = ?auto_197564 ?auto_197566 ) ) ( not ( = ?auto_197564 ?auto_197565 ) ) ( not ( = ?auto_197564 ?auto_197563 ) ) ( not ( = ?auto_197567 ?auto_197566 ) ) ( not ( = ?auto_197567 ?auto_197565 ) ) ( not ( = ?auto_197567 ?auto_197563 ) ) ( not ( = ?auto_197566 ?auto_197565 ) ) ( not ( = ?auto_197566 ?auto_197563 ) ) ( ON ?auto_197563 ?auto_197571 ) ( not ( = ?auto_197563 ?auto_197571 ) ) ( not ( = ?auto_197565 ?auto_197571 ) ) ( not ( = ?auto_197570 ?auto_197571 ) ) ( not ( = ?auto_197568 ?auto_197571 ) ) ( not ( = ?auto_197569 ?auto_197571 ) ) ( not ( = ?auto_197564 ?auto_197571 ) ) ( not ( = ?auto_197567 ?auto_197571 ) ) ( not ( = ?auto_197566 ?auto_197571 ) ) ( ON ?auto_197565 ?auto_197563 ) ( ON-TABLE ?auto_197571 ) ( ON ?auto_197566 ?auto_197565 ) ( CLEAR ?auto_197566 ) ( HOLDING ?auto_197567 ) ( CLEAR ?auto_197564 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197570 ?auto_197568 ?auto_197569 ?auto_197564 ?auto_197567 )
      ( MAKE-1PILE ?auto_197563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197572 - BLOCK
    )
    :vars
    (
      ?auto_197576 - BLOCK
      ?auto_197575 - BLOCK
      ?auto_197578 - BLOCK
      ?auto_197574 - BLOCK
      ?auto_197573 - BLOCK
      ?auto_197577 - BLOCK
      ?auto_197580 - BLOCK
      ?auto_197579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197572 ?auto_197576 ) ) ( ON-TABLE ?auto_197575 ) ( ON ?auto_197578 ?auto_197575 ) ( ON ?auto_197574 ?auto_197578 ) ( ON ?auto_197573 ?auto_197574 ) ( not ( = ?auto_197575 ?auto_197578 ) ) ( not ( = ?auto_197575 ?auto_197574 ) ) ( not ( = ?auto_197575 ?auto_197573 ) ) ( not ( = ?auto_197575 ?auto_197577 ) ) ( not ( = ?auto_197575 ?auto_197580 ) ) ( not ( = ?auto_197575 ?auto_197576 ) ) ( not ( = ?auto_197575 ?auto_197572 ) ) ( not ( = ?auto_197578 ?auto_197574 ) ) ( not ( = ?auto_197578 ?auto_197573 ) ) ( not ( = ?auto_197578 ?auto_197577 ) ) ( not ( = ?auto_197578 ?auto_197580 ) ) ( not ( = ?auto_197578 ?auto_197576 ) ) ( not ( = ?auto_197578 ?auto_197572 ) ) ( not ( = ?auto_197574 ?auto_197573 ) ) ( not ( = ?auto_197574 ?auto_197577 ) ) ( not ( = ?auto_197574 ?auto_197580 ) ) ( not ( = ?auto_197574 ?auto_197576 ) ) ( not ( = ?auto_197574 ?auto_197572 ) ) ( not ( = ?auto_197573 ?auto_197577 ) ) ( not ( = ?auto_197573 ?auto_197580 ) ) ( not ( = ?auto_197573 ?auto_197576 ) ) ( not ( = ?auto_197573 ?auto_197572 ) ) ( not ( = ?auto_197577 ?auto_197580 ) ) ( not ( = ?auto_197577 ?auto_197576 ) ) ( not ( = ?auto_197577 ?auto_197572 ) ) ( not ( = ?auto_197580 ?auto_197576 ) ) ( not ( = ?auto_197580 ?auto_197572 ) ) ( ON ?auto_197572 ?auto_197579 ) ( not ( = ?auto_197572 ?auto_197579 ) ) ( not ( = ?auto_197576 ?auto_197579 ) ) ( not ( = ?auto_197575 ?auto_197579 ) ) ( not ( = ?auto_197578 ?auto_197579 ) ) ( not ( = ?auto_197574 ?auto_197579 ) ) ( not ( = ?auto_197573 ?auto_197579 ) ) ( not ( = ?auto_197577 ?auto_197579 ) ) ( not ( = ?auto_197580 ?auto_197579 ) ) ( ON ?auto_197576 ?auto_197572 ) ( ON-TABLE ?auto_197579 ) ( ON ?auto_197580 ?auto_197576 ) ( CLEAR ?auto_197573 ) ( ON ?auto_197577 ?auto_197580 ) ( CLEAR ?auto_197577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197579 ?auto_197572 ?auto_197576 ?auto_197580 )
      ( MAKE-1PILE ?auto_197572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197581 - BLOCK
    )
    :vars
    (
      ?auto_197583 - BLOCK
      ?auto_197586 - BLOCK
      ?auto_197589 - BLOCK
      ?auto_197588 - BLOCK
      ?auto_197587 - BLOCK
      ?auto_197584 - BLOCK
      ?auto_197585 - BLOCK
      ?auto_197582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197581 ?auto_197583 ) ) ( ON-TABLE ?auto_197586 ) ( ON ?auto_197589 ?auto_197586 ) ( ON ?auto_197588 ?auto_197589 ) ( not ( = ?auto_197586 ?auto_197589 ) ) ( not ( = ?auto_197586 ?auto_197588 ) ) ( not ( = ?auto_197586 ?auto_197587 ) ) ( not ( = ?auto_197586 ?auto_197584 ) ) ( not ( = ?auto_197586 ?auto_197585 ) ) ( not ( = ?auto_197586 ?auto_197583 ) ) ( not ( = ?auto_197586 ?auto_197581 ) ) ( not ( = ?auto_197589 ?auto_197588 ) ) ( not ( = ?auto_197589 ?auto_197587 ) ) ( not ( = ?auto_197589 ?auto_197584 ) ) ( not ( = ?auto_197589 ?auto_197585 ) ) ( not ( = ?auto_197589 ?auto_197583 ) ) ( not ( = ?auto_197589 ?auto_197581 ) ) ( not ( = ?auto_197588 ?auto_197587 ) ) ( not ( = ?auto_197588 ?auto_197584 ) ) ( not ( = ?auto_197588 ?auto_197585 ) ) ( not ( = ?auto_197588 ?auto_197583 ) ) ( not ( = ?auto_197588 ?auto_197581 ) ) ( not ( = ?auto_197587 ?auto_197584 ) ) ( not ( = ?auto_197587 ?auto_197585 ) ) ( not ( = ?auto_197587 ?auto_197583 ) ) ( not ( = ?auto_197587 ?auto_197581 ) ) ( not ( = ?auto_197584 ?auto_197585 ) ) ( not ( = ?auto_197584 ?auto_197583 ) ) ( not ( = ?auto_197584 ?auto_197581 ) ) ( not ( = ?auto_197585 ?auto_197583 ) ) ( not ( = ?auto_197585 ?auto_197581 ) ) ( ON ?auto_197581 ?auto_197582 ) ( not ( = ?auto_197581 ?auto_197582 ) ) ( not ( = ?auto_197583 ?auto_197582 ) ) ( not ( = ?auto_197586 ?auto_197582 ) ) ( not ( = ?auto_197589 ?auto_197582 ) ) ( not ( = ?auto_197588 ?auto_197582 ) ) ( not ( = ?auto_197587 ?auto_197582 ) ) ( not ( = ?auto_197584 ?auto_197582 ) ) ( not ( = ?auto_197585 ?auto_197582 ) ) ( ON ?auto_197583 ?auto_197581 ) ( ON-TABLE ?auto_197582 ) ( ON ?auto_197585 ?auto_197583 ) ( ON ?auto_197584 ?auto_197585 ) ( CLEAR ?auto_197584 ) ( HOLDING ?auto_197587 ) ( CLEAR ?auto_197588 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197586 ?auto_197589 ?auto_197588 ?auto_197587 )
      ( MAKE-1PILE ?auto_197581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197590 - BLOCK
    )
    :vars
    (
      ?auto_197596 - BLOCK
      ?auto_197598 - BLOCK
      ?auto_197591 - BLOCK
      ?auto_197594 - BLOCK
      ?auto_197595 - BLOCK
      ?auto_197592 - BLOCK
      ?auto_197597 - BLOCK
      ?auto_197593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197590 ?auto_197596 ) ) ( ON-TABLE ?auto_197598 ) ( ON ?auto_197591 ?auto_197598 ) ( ON ?auto_197594 ?auto_197591 ) ( not ( = ?auto_197598 ?auto_197591 ) ) ( not ( = ?auto_197598 ?auto_197594 ) ) ( not ( = ?auto_197598 ?auto_197595 ) ) ( not ( = ?auto_197598 ?auto_197592 ) ) ( not ( = ?auto_197598 ?auto_197597 ) ) ( not ( = ?auto_197598 ?auto_197596 ) ) ( not ( = ?auto_197598 ?auto_197590 ) ) ( not ( = ?auto_197591 ?auto_197594 ) ) ( not ( = ?auto_197591 ?auto_197595 ) ) ( not ( = ?auto_197591 ?auto_197592 ) ) ( not ( = ?auto_197591 ?auto_197597 ) ) ( not ( = ?auto_197591 ?auto_197596 ) ) ( not ( = ?auto_197591 ?auto_197590 ) ) ( not ( = ?auto_197594 ?auto_197595 ) ) ( not ( = ?auto_197594 ?auto_197592 ) ) ( not ( = ?auto_197594 ?auto_197597 ) ) ( not ( = ?auto_197594 ?auto_197596 ) ) ( not ( = ?auto_197594 ?auto_197590 ) ) ( not ( = ?auto_197595 ?auto_197592 ) ) ( not ( = ?auto_197595 ?auto_197597 ) ) ( not ( = ?auto_197595 ?auto_197596 ) ) ( not ( = ?auto_197595 ?auto_197590 ) ) ( not ( = ?auto_197592 ?auto_197597 ) ) ( not ( = ?auto_197592 ?auto_197596 ) ) ( not ( = ?auto_197592 ?auto_197590 ) ) ( not ( = ?auto_197597 ?auto_197596 ) ) ( not ( = ?auto_197597 ?auto_197590 ) ) ( ON ?auto_197590 ?auto_197593 ) ( not ( = ?auto_197590 ?auto_197593 ) ) ( not ( = ?auto_197596 ?auto_197593 ) ) ( not ( = ?auto_197598 ?auto_197593 ) ) ( not ( = ?auto_197591 ?auto_197593 ) ) ( not ( = ?auto_197594 ?auto_197593 ) ) ( not ( = ?auto_197595 ?auto_197593 ) ) ( not ( = ?auto_197592 ?auto_197593 ) ) ( not ( = ?auto_197597 ?auto_197593 ) ) ( ON ?auto_197596 ?auto_197590 ) ( ON-TABLE ?auto_197593 ) ( ON ?auto_197597 ?auto_197596 ) ( ON ?auto_197592 ?auto_197597 ) ( CLEAR ?auto_197594 ) ( ON ?auto_197595 ?auto_197592 ) ( CLEAR ?auto_197595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197593 ?auto_197590 ?auto_197596 ?auto_197597 ?auto_197592 )
      ( MAKE-1PILE ?auto_197590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197599 - BLOCK
    )
    :vars
    (
      ?auto_197603 - BLOCK
      ?auto_197606 - BLOCK
      ?auto_197604 - BLOCK
      ?auto_197605 - BLOCK
      ?auto_197601 - BLOCK
      ?auto_197602 - BLOCK
      ?auto_197607 - BLOCK
      ?auto_197600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197599 ?auto_197603 ) ) ( ON-TABLE ?auto_197606 ) ( ON ?auto_197604 ?auto_197606 ) ( not ( = ?auto_197606 ?auto_197604 ) ) ( not ( = ?auto_197606 ?auto_197605 ) ) ( not ( = ?auto_197606 ?auto_197601 ) ) ( not ( = ?auto_197606 ?auto_197602 ) ) ( not ( = ?auto_197606 ?auto_197607 ) ) ( not ( = ?auto_197606 ?auto_197603 ) ) ( not ( = ?auto_197606 ?auto_197599 ) ) ( not ( = ?auto_197604 ?auto_197605 ) ) ( not ( = ?auto_197604 ?auto_197601 ) ) ( not ( = ?auto_197604 ?auto_197602 ) ) ( not ( = ?auto_197604 ?auto_197607 ) ) ( not ( = ?auto_197604 ?auto_197603 ) ) ( not ( = ?auto_197604 ?auto_197599 ) ) ( not ( = ?auto_197605 ?auto_197601 ) ) ( not ( = ?auto_197605 ?auto_197602 ) ) ( not ( = ?auto_197605 ?auto_197607 ) ) ( not ( = ?auto_197605 ?auto_197603 ) ) ( not ( = ?auto_197605 ?auto_197599 ) ) ( not ( = ?auto_197601 ?auto_197602 ) ) ( not ( = ?auto_197601 ?auto_197607 ) ) ( not ( = ?auto_197601 ?auto_197603 ) ) ( not ( = ?auto_197601 ?auto_197599 ) ) ( not ( = ?auto_197602 ?auto_197607 ) ) ( not ( = ?auto_197602 ?auto_197603 ) ) ( not ( = ?auto_197602 ?auto_197599 ) ) ( not ( = ?auto_197607 ?auto_197603 ) ) ( not ( = ?auto_197607 ?auto_197599 ) ) ( ON ?auto_197599 ?auto_197600 ) ( not ( = ?auto_197599 ?auto_197600 ) ) ( not ( = ?auto_197603 ?auto_197600 ) ) ( not ( = ?auto_197606 ?auto_197600 ) ) ( not ( = ?auto_197604 ?auto_197600 ) ) ( not ( = ?auto_197605 ?auto_197600 ) ) ( not ( = ?auto_197601 ?auto_197600 ) ) ( not ( = ?auto_197602 ?auto_197600 ) ) ( not ( = ?auto_197607 ?auto_197600 ) ) ( ON ?auto_197603 ?auto_197599 ) ( ON-TABLE ?auto_197600 ) ( ON ?auto_197607 ?auto_197603 ) ( ON ?auto_197602 ?auto_197607 ) ( ON ?auto_197601 ?auto_197602 ) ( CLEAR ?auto_197601 ) ( HOLDING ?auto_197605 ) ( CLEAR ?auto_197604 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197606 ?auto_197604 ?auto_197605 )
      ( MAKE-1PILE ?auto_197599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197608 - BLOCK
    )
    :vars
    (
      ?auto_197612 - BLOCK
      ?auto_197610 - BLOCK
      ?auto_197616 - BLOCK
      ?auto_197611 - BLOCK
      ?auto_197615 - BLOCK
      ?auto_197613 - BLOCK
      ?auto_197609 - BLOCK
      ?auto_197614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197608 ?auto_197612 ) ) ( ON-TABLE ?auto_197610 ) ( ON ?auto_197616 ?auto_197610 ) ( not ( = ?auto_197610 ?auto_197616 ) ) ( not ( = ?auto_197610 ?auto_197611 ) ) ( not ( = ?auto_197610 ?auto_197615 ) ) ( not ( = ?auto_197610 ?auto_197613 ) ) ( not ( = ?auto_197610 ?auto_197609 ) ) ( not ( = ?auto_197610 ?auto_197612 ) ) ( not ( = ?auto_197610 ?auto_197608 ) ) ( not ( = ?auto_197616 ?auto_197611 ) ) ( not ( = ?auto_197616 ?auto_197615 ) ) ( not ( = ?auto_197616 ?auto_197613 ) ) ( not ( = ?auto_197616 ?auto_197609 ) ) ( not ( = ?auto_197616 ?auto_197612 ) ) ( not ( = ?auto_197616 ?auto_197608 ) ) ( not ( = ?auto_197611 ?auto_197615 ) ) ( not ( = ?auto_197611 ?auto_197613 ) ) ( not ( = ?auto_197611 ?auto_197609 ) ) ( not ( = ?auto_197611 ?auto_197612 ) ) ( not ( = ?auto_197611 ?auto_197608 ) ) ( not ( = ?auto_197615 ?auto_197613 ) ) ( not ( = ?auto_197615 ?auto_197609 ) ) ( not ( = ?auto_197615 ?auto_197612 ) ) ( not ( = ?auto_197615 ?auto_197608 ) ) ( not ( = ?auto_197613 ?auto_197609 ) ) ( not ( = ?auto_197613 ?auto_197612 ) ) ( not ( = ?auto_197613 ?auto_197608 ) ) ( not ( = ?auto_197609 ?auto_197612 ) ) ( not ( = ?auto_197609 ?auto_197608 ) ) ( ON ?auto_197608 ?auto_197614 ) ( not ( = ?auto_197608 ?auto_197614 ) ) ( not ( = ?auto_197612 ?auto_197614 ) ) ( not ( = ?auto_197610 ?auto_197614 ) ) ( not ( = ?auto_197616 ?auto_197614 ) ) ( not ( = ?auto_197611 ?auto_197614 ) ) ( not ( = ?auto_197615 ?auto_197614 ) ) ( not ( = ?auto_197613 ?auto_197614 ) ) ( not ( = ?auto_197609 ?auto_197614 ) ) ( ON ?auto_197612 ?auto_197608 ) ( ON-TABLE ?auto_197614 ) ( ON ?auto_197609 ?auto_197612 ) ( ON ?auto_197613 ?auto_197609 ) ( ON ?auto_197615 ?auto_197613 ) ( CLEAR ?auto_197616 ) ( ON ?auto_197611 ?auto_197615 ) ( CLEAR ?auto_197611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197614 ?auto_197608 ?auto_197612 ?auto_197609 ?auto_197613 ?auto_197615 )
      ( MAKE-1PILE ?auto_197608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197617 - BLOCK
    )
    :vars
    (
      ?auto_197620 - BLOCK
      ?auto_197619 - BLOCK
      ?auto_197618 - BLOCK
      ?auto_197625 - BLOCK
      ?auto_197624 - BLOCK
      ?auto_197623 - BLOCK
      ?auto_197622 - BLOCK
      ?auto_197621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197617 ?auto_197620 ) ) ( ON-TABLE ?auto_197619 ) ( not ( = ?auto_197619 ?auto_197618 ) ) ( not ( = ?auto_197619 ?auto_197625 ) ) ( not ( = ?auto_197619 ?auto_197624 ) ) ( not ( = ?auto_197619 ?auto_197623 ) ) ( not ( = ?auto_197619 ?auto_197622 ) ) ( not ( = ?auto_197619 ?auto_197620 ) ) ( not ( = ?auto_197619 ?auto_197617 ) ) ( not ( = ?auto_197618 ?auto_197625 ) ) ( not ( = ?auto_197618 ?auto_197624 ) ) ( not ( = ?auto_197618 ?auto_197623 ) ) ( not ( = ?auto_197618 ?auto_197622 ) ) ( not ( = ?auto_197618 ?auto_197620 ) ) ( not ( = ?auto_197618 ?auto_197617 ) ) ( not ( = ?auto_197625 ?auto_197624 ) ) ( not ( = ?auto_197625 ?auto_197623 ) ) ( not ( = ?auto_197625 ?auto_197622 ) ) ( not ( = ?auto_197625 ?auto_197620 ) ) ( not ( = ?auto_197625 ?auto_197617 ) ) ( not ( = ?auto_197624 ?auto_197623 ) ) ( not ( = ?auto_197624 ?auto_197622 ) ) ( not ( = ?auto_197624 ?auto_197620 ) ) ( not ( = ?auto_197624 ?auto_197617 ) ) ( not ( = ?auto_197623 ?auto_197622 ) ) ( not ( = ?auto_197623 ?auto_197620 ) ) ( not ( = ?auto_197623 ?auto_197617 ) ) ( not ( = ?auto_197622 ?auto_197620 ) ) ( not ( = ?auto_197622 ?auto_197617 ) ) ( ON ?auto_197617 ?auto_197621 ) ( not ( = ?auto_197617 ?auto_197621 ) ) ( not ( = ?auto_197620 ?auto_197621 ) ) ( not ( = ?auto_197619 ?auto_197621 ) ) ( not ( = ?auto_197618 ?auto_197621 ) ) ( not ( = ?auto_197625 ?auto_197621 ) ) ( not ( = ?auto_197624 ?auto_197621 ) ) ( not ( = ?auto_197623 ?auto_197621 ) ) ( not ( = ?auto_197622 ?auto_197621 ) ) ( ON ?auto_197620 ?auto_197617 ) ( ON-TABLE ?auto_197621 ) ( ON ?auto_197622 ?auto_197620 ) ( ON ?auto_197623 ?auto_197622 ) ( ON ?auto_197624 ?auto_197623 ) ( ON ?auto_197625 ?auto_197624 ) ( CLEAR ?auto_197625 ) ( HOLDING ?auto_197618 ) ( CLEAR ?auto_197619 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197619 ?auto_197618 )
      ( MAKE-1PILE ?auto_197617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197626 - BLOCK
    )
    :vars
    (
      ?auto_197633 - BLOCK
      ?auto_197632 - BLOCK
      ?auto_197629 - BLOCK
      ?auto_197630 - BLOCK
      ?auto_197627 - BLOCK
      ?auto_197631 - BLOCK
      ?auto_197634 - BLOCK
      ?auto_197628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197626 ?auto_197633 ) ) ( ON-TABLE ?auto_197632 ) ( not ( = ?auto_197632 ?auto_197629 ) ) ( not ( = ?auto_197632 ?auto_197630 ) ) ( not ( = ?auto_197632 ?auto_197627 ) ) ( not ( = ?auto_197632 ?auto_197631 ) ) ( not ( = ?auto_197632 ?auto_197634 ) ) ( not ( = ?auto_197632 ?auto_197633 ) ) ( not ( = ?auto_197632 ?auto_197626 ) ) ( not ( = ?auto_197629 ?auto_197630 ) ) ( not ( = ?auto_197629 ?auto_197627 ) ) ( not ( = ?auto_197629 ?auto_197631 ) ) ( not ( = ?auto_197629 ?auto_197634 ) ) ( not ( = ?auto_197629 ?auto_197633 ) ) ( not ( = ?auto_197629 ?auto_197626 ) ) ( not ( = ?auto_197630 ?auto_197627 ) ) ( not ( = ?auto_197630 ?auto_197631 ) ) ( not ( = ?auto_197630 ?auto_197634 ) ) ( not ( = ?auto_197630 ?auto_197633 ) ) ( not ( = ?auto_197630 ?auto_197626 ) ) ( not ( = ?auto_197627 ?auto_197631 ) ) ( not ( = ?auto_197627 ?auto_197634 ) ) ( not ( = ?auto_197627 ?auto_197633 ) ) ( not ( = ?auto_197627 ?auto_197626 ) ) ( not ( = ?auto_197631 ?auto_197634 ) ) ( not ( = ?auto_197631 ?auto_197633 ) ) ( not ( = ?auto_197631 ?auto_197626 ) ) ( not ( = ?auto_197634 ?auto_197633 ) ) ( not ( = ?auto_197634 ?auto_197626 ) ) ( ON ?auto_197626 ?auto_197628 ) ( not ( = ?auto_197626 ?auto_197628 ) ) ( not ( = ?auto_197633 ?auto_197628 ) ) ( not ( = ?auto_197632 ?auto_197628 ) ) ( not ( = ?auto_197629 ?auto_197628 ) ) ( not ( = ?auto_197630 ?auto_197628 ) ) ( not ( = ?auto_197627 ?auto_197628 ) ) ( not ( = ?auto_197631 ?auto_197628 ) ) ( not ( = ?auto_197634 ?auto_197628 ) ) ( ON ?auto_197633 ?auto_197626 ) ( ON-TABLE ?auto_197628 ) ( ON ?auto_197634 ?auto_197633 ) ( ON ?auto_197631 ?auto_197634 ) ( ON ?auto_197627 ?auto_197631 ) ( ON ?auto_197630 ?auto_197627 ) ( CLEAR ?auto_197632 ) ( ON ?auto_197629 ?auto_197630 ) ( CLEAR ?auto_197629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197628 ?auto_197626 ?auto_197633 ?auto_197634 ?auto_197631 ?auto_197627 ?auto_197630 )
      ( MAKE-1PILE ?auto_197626 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197635 - BLOCK
    )
    :vars
    (
      ?auto_197636 - BLOCK
      ?auto_197642 - BLOCK
      ?auto_197640 - BLOCK
      ?auto_197643 - BLOCK
      ?auto_197639 - BLOCK
      ?auto_197637 - BLOCK
      ?auto_197638 - BLOCK
      ?auto_197641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197635 ?auto_197636 ) ) ( not ( = ?auto_197642 ?auto_197640 ) ) ( not ( = ?auto_197642 ?auto_197643 ) ) ( not ( = ?auto_197642 ?auto_197639 ) ) ( not ( = ?auto_197642 ?auto_197637 ) ) ( not ( = ?auto_197642 ?auto_197638 ) ) ( not ( = ?auto_197642 ?auto_197636 ) ) ( not ( = ?auto_197642 ?auto_197635 ) ) ( not ( = ?auto_197640 ?auto_197643 ) ) ( not ( = ?auto_197640 ?auto_197639 ) ) ( not ( = ?auto_197640 ?auto_197637 ) ) ( not ( = ?auto_197640 ?auto_197638 ) ) ( not ( = ?auto_197640 ?auto_197636 ) ) ( not ( = ?auto_197640 ?auto_197635 ) ) ( not ( = ?auto_197643 ?auto_197639 ) ) ( not ( = ?auto_197643 ?auto_197637 ) ) ( not ( = ?auto_197643 ?auto_197638 ) ) ( not ( = ?auto_197643 ?auto_197636 ) ) ( not ( = ?auto_197643 ?auto_197635 ) ) ( not ( = ?auto_197639 ?auto_197637 ) ) ( not ( = ?auto_197639 ?auto_197638 ) ) ( not ( = ?auto_197639 ?auto_197636 ) ) ( not ( = ?auto_197639 ?auto_197635 ) ) ( not ( = ?auto_197637 ?auto_197638 ) ) ( not ( = ?auto_197637 ?auto_197636 ) ) ( not ( = ?auto_197637 ?auto_197635 ) ) ( not ( = ?auto_197638 ?auto_197636 ) ) ( not ( = ?auto_197638 ?auto_197635 ) ) ( ON ?auto_197635 ?auto_197641 ) ( not ( = ?auto_197635 ?auto_197641 ) ) ( not ( = ?auto_197636 ?auto_197641 ) ) ( not ( = ?auto_197642 ?auto_197641 ) ) ( not ( = ?auto_197640 ?auto_197641 ) ) ( not ( = ?auto_197643 ?auto_197641 ) ) ( not ( = ?auto_197639 ?auto_197641 ) ) ( not ( = ?auto_197637 ?auto_197641 ) ) ( not ( = ?auto_197638 ?auto_197641 ) ) ( ON ?auto_197636 ?auto_197635 ) ( ON-TABLE ?auto_197641 ) ( ON ?auto_197638 ?auto_197636 ) ( ON ?auto_197637 ?auto_197638 ) ( ON ?auto_197639 ?auto_197637 ) ( ON ?auto_197643 ?auto_197639 ) ( ON ?auto_197640 ?auto_197643 ) ( CLEAR ?auto_197640 ) ( HOLDING ?auto_197642 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197642 )
      ( MAKE-1PILE ?auto_197635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_197644 - BLOCK
    )
    :vars
    (
      ?auto_197649 - BLOCK
      ?auto_197646 - BLOCK
      ?auto_197651 - BLOCK
      ?auto_197645 - BLOCK
      ?auto_197648 - BLOCK
      ?auto_197650 - BLOCK
      ?auto_197647 - BLOCK
      ?auto_197652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197644 ?auto_197649 ) ) ( not ( = ?auto_197646 ?auto_197651 ) ) ( not ( = ?auto_197646 ?auto_197645 ) ) ( not ( = ?auto_197646 ?auto_197648 ) ) ( not ( = ?auto_197646 ?auto_197650 ) ) ( not ( = ?auto_197646 ?auto_197647 ) ) ( not ( = ?auto_197646 ?auto_197649 ) ) ( not ( = ?auto_197646 ?auto_197644 ) ) ( not ( = ?auto_197651 ?auto_197645 ) ) ( not ( = ?auto_197651 ?auto_197648 ) ) ( not ( = ?auto_197651 ?auto_197650 ) ) ( not ( = ?auto_197651 ?auto_197647 ) ) ( not ( = ?auto_197651 ?auto_197649 ) ) ( not ( = ?auto_197651 ?auto_197644 ) ) ( not ( = ?auto_197645 ?auto_197648 ) ) ( not ( = ?auto_197645 ?auto_197650 ) ) ( not ( = ?auto_197645 ?auto_197647 ) ) ( not ( = ?auto_197645 ?auto_197649 ) ) ( not ( = ?auto_197645 ?auto_197644 ) ) ( not ( = ?auto_197648 ?auto_197650 ) ) ( not ( = ?auto_197648 ?auto_197647 ) ) ( not ( = ?auto_197648 ?auto_197649 ) ) ( not ( = ?auto_197648 ?auto_197644 ) ) ( not ( = ?auto_197650 ?auto_197647 ) ) ( not ( = ?auto_197650 ?auto_197649 ) ) ( not ( = ?auto_197650 ?auto_197644 ) ) ( not ( = ?auto_197647 ?auto_197649 ) ) ( not ( = ?auto_197647 ?auto_197644 ) ) ( ON ?auto_197644 ?auto_197652 ) ( not ( = ?auto_197644 ?auto_197652 ) ) ( not ( = ?auto_197649 ?auto_197652 ) ) ( not ( = ?auto_197646 ?auto_197652 ) ) ( not ( = ?auto_197651 ?auto_197652 ) ) ( not ( = ?auto_197645 ?auto_197652 ) ) ( not ( = ?auto_197648 ?auto_197652 ) ) ( not ( = ?auto_197650 ?auto_197652 ) ) ( not ( = ?auto_197647 ?auto_197652 ) ) ( ON ?auto_197649 ?auto_197644 ) ( ON-TABLE ?auto_197652 ) ( ON ?auto_197647 ?auto_197649 ) ( ON ?auto_197650 ?auto_197647 ) ( ON ?auto_197648 ?auto_197650 ) ( ON ?auto_197645 ?auto_197648 ) ( ON ?auto_197651 ?auto_197645 ) ( ON ?auto_197646 ?auto_197651 ) ( CLEAR ?auto_197646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197652 ?auto_197644 ?auto_197649 ?auto_197647 ?auto_197650 ?auto_197648 ?auto_197645 ?auto_197651 )
      ( MAKE-1PILE ?auto_197644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197659 - BLOCK
      ?auto_197660 - BLOCK
      ?auto_197661 - BLOCK
      ?auto_197662 - BLOCK
      ?auto_197663 - BLOCK
      ?auto_197664 - BLOCK
    )
    :vars
    (
      ?auto_197665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197665 ?auto_197664 ) ( CLEAR ?auto_197665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197659 ) ( ON ?auto_197660 ?auto_197659 ) ( ON ?auto_197661 ?auto_197660 ) ( ON ?auto_197662 ?auto_197661 ) ( ON ?auto_197663 ?auto_197662 ) ( ON ?auto_197664 ?auto_197663 ) ( not ( = ?auto_197659 ?auto_197660 ) ) ( not ( = ?auto_197659 ?auto_197661 ) ) ( not ( = ?auto_197659 ?auto_197662 ) ) ( not ( = ?auto_197659 ?auto_197663 ) ) ( not ( = ?auto_197659 ?auto_197664 ) ) ( not ( = ?auto_197659 ?auto_197665 ) ) ( not ( = ?auto_197660 ?auto_197661 ) ) ( not ( = ?auto_197660 ?auto_197662 ) ) ( not ( = ?auto_197660 ?auto_197663 ) ) ( not ( = ?auto_197660 ?auto_197664 ) ) ( not ( = ?auto_197660 ?auto_197665 ) ) ( not ( = ?auto_197661 ?auto_197662 ) ) ( not ( = ?auto_197661 ?auto_197663 ) ) ( not ( = ?auto_197661 ?auto_197664 ) ) ( not ( = ?auto_197661 ?auto_197665 ) ) ( not ( = ?auto_197662 ?auto_197663 ) ) ( not ( = ?auto_197662 ?auto_197664 ) ) ( not ( = ?auto_197662 ?auto_197665 ) ) ( not ( = ?auto_197663 ?auto_197664 ) ) ( not ( = ?auto_197663 ?auto_197665 ) ) ( not ( = ?auto_197664 ?auto_197665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197665 ?auto_197664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197666 - BLOCK
      ?auto_197667 - BLOCK
      ?auto_197668 - BLOCK
      ?auto_197669 - BLOCK
      ?auto_197670 - BLOCK
      ?auto_197671 - BLOCK
    )
    :vars
    (
      ?auto_197672 - BLOCK
      ?auto_197673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197672 ?auto_197671 ) ( CLEAR ?auto_197672 ) ( ON-TABLE ?auto_197666 ) ( ON ?auto_197667 ?auto_197666 ) ( ON ?auto_197668 ?auto_197667 ) ( ON ?auto_197669 ?auto_197668 ) ( ON ?auto_197670 ?auto_197669 ) ( ON ?auto_197671 ?auto_197670 ) ( not ( = ?auto_197666 ?auto_197667 ) ) ( not ( = ?auto_197666 ?auto_197668 ) ) ( not ( = ?auto_197666 ?auto_197669 ) ) ( not ( = ?auto_197666 ?auto_197670 ) ) ( not ( = ?auto_197666 ?auto_197671 ) ) ( not ( = ?auto_197666 ?auto_197672 ) ) ( not ( = ?auto_197667 ?auto_197668 ) ) ( not ( = ?auto_197667 ?auto_197669 ) ) ( not ( = ?auto_197667 ?auto_197670 ) ) ( not ( = ?auto_197667 ?auto_197671 ) ) ( not ( = ?auto_197667 ?auto_197672 ) ) ( not ( = ?auto_197668 ?auto_197669 ) ) ( not ( = ?auto_197668 ?auto_197670 ) ) ( not ( = ?auto_197668 ?auto_197671 ) ) ( not ( = ?auto_197668 ?auto_197672 ) ) ( not ( = ?auto_197669 ?auto_197670 ) ) ( not ( = ?auto_197669 ?auto_197671 ) ) ( not ( = ?auto_197669 ?auto_197672 ) ) ( not ( = ?auto_197670 ?auto_197671 ) ) ( not ( = ?auto_197670 ?auto_197672 ) ) ( not ( = ?auto_197671 ?auto_197672 ) ) ( HOLDING ?auto_197673 ) ( not ( = ?auto_197666 ?auto_197673 ) ) ( not ( = ?auto_197667 ?auto_197673 ) ) ( not ( = ?auto_197668 ?auto_197673 ) ) ( not ( = ?auto_197669 ?auto_197673 ) ) ( not ( = ?auto_197670 ?auto_197673 ) ) ( not ( = ?auto_197671 ?auto_197673 ) ) ( not ( = ?auto_197672 ?auto_197673 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_197673 )
      ( MAKE-6PILE ?auto_197666 ?auto_197667 ?auto_197668 ?auto_197669 ?auto_197670 ?auto_197671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197674 - BLOCK
      ?auto_197675 - BLOCK
      ?auto_197676 - BLOCK
      ?auto_197677 - BLOCK
      ?auto_197678 - BLOCK
      ?auto_197679 - BLOCK
    )
    :vars
    (
      ?auto_197680 - BLOCK
      ?auto_197681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197680 ?auto_197679 ) ( ON-TABLE ?auto_197674 ) ( ON ?auto_197675 ?auto_197674 ) ( ON ?auto_197676 ?auto_197675 ) ( ON ?auto_197677 ?auto_197676 ) ( ON ?auto_197678 ?auto_197677 ) ( ON ?auto_197679 ?auto_197678 ) ( not ( = ?auto_197674 ?auto_197675 ) ) ( not ( = ?auto_197674 ?auto_197676 ) ) ( not ( = ?auto_197674 ?auto_197677 ) ) ( not ( = ?auto_197674 ?auto_197678 ) ) ( not ( = ?auto_197674 ?auto_197679 ) ) ( not ( = ?auto_197674 ?auto_197680 ) ) ( not ( = ?auto_197675 ?auto_197676 ) ) ( not ( = ?auto_197675 ?auto_197677 ) ) ( not ( = ?auto_197675 ?auto_197678 ) ) ( not ( = ?auto_197675 ?auto_197679 ) ) ( not ( = ?auto_197675 ?auto_197680 ) ) ( not ( = ?auto_197676 ?auto_197677 ) ) ( not ( = ?auto_197676 ?auto_197678 ) ) ( not ( = ?auto_197676 ?auto_197679 ) ) ( not ( = ?auto_197676 ?auto_197680 ) ) ( not ( = ?auto_197677 ?auto_197678 ) ) ( not ( = ?auto_197677 ?auto_197679 ) ) ( not ( = ?auto_197677 ?auto_197680 ) ) ( not ( = ?auto_197678 ?auto_197679 ) ) ( not ( = ?auto_197678 ?auto_197680 ) ) ( not ( = ?auto_197679 ?auto_197680 ) ) ( not ( = ?auto_197674 ?auto_197681 ) ) ( not ( = ?auto_197675 ?auto_197681 ) ) ( not ( = ?auto_197676 ?auto_197681 ) ) ( not ( = ?auto_197677 ?auto_197681 ) ) ( not ( = ?auto_197678 ?auto_197681 ) ) ( not ( = ?auto_197679 ?auto_197681 ) ) ( not ( = ?auto_197680 ?auto_197681 ) ) ( ON ?auto_197681 ?auto_197680 ) ( CLEAR ?auto_197681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197674 ?auto_197675 ?auto_197676 ?auto_197677 ?auto_197678 ?auto_197679 ?auto_197680 )
      ( MAKE-6PILE ?auto_197674 ?auto_197675 ?auto_197676 ?auto_197677 ?auto_197678 ?auto_197679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197682 - BLOCK
      ?auto_197683 - BLOCK
      ?auto_197684 - BLOCK
      ?auto_197685 - BLOCK
      ?auto_197686 - BLOCK
      ?auto_197687 - BLOCK
    )
    :vars
    (
      ?auto_197688 - BLOCK
      ?auto_197689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197688 ?auto_197687 ) ( ON-TABLE ?auto_197682 ) ( ON ?auto_197683 ?auto_197682 ) ( ON ?auto_197684 ?auto_197683 ) ( ON ?auto_197685 ?auto_197684 ) ( ON ?auto_197686 ?auto_197685 ) ( ON ?auto_197687 ?auto_197686 ) ( not ( = ?auto_197682 ?auto_197683 ) ) ( not ( = ?auto_197682 ?auto_197684 ) ) ( not ( = ?auto_197682 ?auto_197685 ) ) ( not ( = ?auto_197682 ?auto_197686 ) ) ( not ( = ?auto_197682 ?auto_197687 ) ) ( not ( = ?auto_197682 ?auto_197688 ) ) ( not ( = ?auto_197683 ?auto_197684 ) ) ( not ( = ?auto_197683 ?auto_197685 ) ) ( not ( = ?auto_197683 ?auto_197686 ) ) ( not ( = ?auto_197683 ?auto_197687 ) ) ( not ( = ?auto_197683 ?auto_197688 ) ) ( not ( = ?auto_197684 ?auto_197685 ) ) ( not ( = ?auto_197684 ?auto_197686 ) ) ( not ( = ?auto_197684 ?auto_197687 ) ) ( not ( = ?auto_197684 ?auto_197688 ) ) ( not ( = ?auto_197685 ?auto_197686 ) ) ( not ( = ?auto_197685 ?auto_197687 ) ) ( not ( = ?auto_197685 ?auto_197688 ) ) ( not ( = ?auto_197686 ?auto_197687 ) ) ( not ( = ?auto_197686 ?auto_197688 ) ) ( not ( = ?auto_197687 ?auto_197688 ) ) ( not ( = ?auto_197682 ?auto_197689 ) ) ( not ( = ?auto_197683 ?auto_197689 ) ) ( not ( = ?auto_197684 ?auto_197689 ) ) ( not ( = ?auto_197685 ?auto_197689 ) ) ( not ( = ?auto_197686 ?auto_197689 ) ) ( not ( = ?auto_197687 ?auto_197689 ) ) ( not ( = ?auto_197688 ?auto_197689 ) ) ( HOLDING ?auto_197689 ) ( CLEAR ?auto_197688 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197682 ?auto_197683 ?auto_197684 ?auto_197685 ?auto_197686 ?auto_197687 ?auto_197688 ?auto_197689 )
      ( MAKE-6PILE ?auto_197682 ?auto_197683 ?auto_197684 ?auto_197685 ?auto_197686 ?auto_197687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197690 - BLOCK
      ?auto_197691 - BLOCK
      ?auto_197692 - BLOCK
      ?auto_197693 - BLOCK
      ?auto_197694 - BLOCK
      ?auto_197695 - BLOCK
    )
    :vars
    (
      ?auto_197696 - BLOCK
      ?auto_197697 - BLOCK
      ?auto_197698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197696 ?auto_197695 ) ( ON-TABLE ?auto_197690 ) ( ON ?auto_197691 ?auto_197690 ) ( ON ?auto_197692 ?auto_197691 ) ( ON ?auto_197693 ?auto_197692 ) ( ON ?auto_197694 ?auto_197693 ) ( ON ?auto_197695 ?auto_197694 ) ( not ( = ?auto_197690 ?auto_197691 ) ) ( not ( = ?auto_197690 ?auto_197692 ) ) ( not ( = ?auto_197690 ?auto_197693 ) ) ( not ( = ?auto_197690 ?auto_197694 ) ) ( not ( = ?auto_197690 ?auto_197695 ) ) ( not ( = ?auto_197690 ?auto_197696 ) ) ( not ( = ?auto_197691 ?auto_197692 ) ) ( not ( = ?auto_197691 ?auto_197693 ) ) ( not ( = ?auto_197691 ?auto_197694 ) ) ( not ( = ?auto_197691 ?auto_197695 ) ) ( not ( = ?auto_197691 ?auto_197696 ) ) ( not ( = ?auto_197692 ?auto_197693 ) ) ( not ( = ?auto_197692 ?auto_197694 ) ) ( not ( = ?auto_197692 ?auto_197695 ) ) ( not ( = ?auto_197692 ?auto_197696 ) ) ( not ( = ?auto_197693 ?auto_197694 ) ) ( not ( = ?auto_197693 ?auto_197695 ) ) ( not ( = ?auto_197693 ?auto_197696 ) ) ( not ( = ?auto_197694 ?auto_197695 ) ) ( not ( = ?auto_197694 ?auto_197696 ) ) ( not ( = ?auto_197695 ?auto_197696 ) ) ( not ( = ?auto_197690 ?auto_197697 ) ) ( not ( = ?auto_197691 ?auto_197697 ) ) ( not ( = ?auto_197692 ?auto_197697 ) ) ( not ( = ?auto_197693 ?auto_197697 ) ) ( not ( = ?auto_197694 ?auto_197697 ) ) ( not ( = ?auto_197695 ?auto_197697 ) ) ( not ( = ?auto_197696 ?auto_197697 ) ) ( CLEAR ?auto_197696 ) ( ON ?auto_197697 ?auto_197698 ) ( CLEAR ?auto_197697 ) ( HAND-EMPTY ) ( not ( = ?auto_197690 ?auto_197698 ) ) ( not ( = ?auto_197691 ?auto_197698 ) ) ( not ( = ?auto_197692 ?auto_197698 ) ) ( not ( = ?auto_197693 ?auto_197698 ) ) ( not ( = ?auto_197694 ?auto_197698 ) ) ( not ( = ?auto_197695 ?auto_197698 ) ) ( not ( = ?auto_197696 ?auto_197698 ) ) ( not ( = ?auto_197697 ?auto_197698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197697 ?auto_197698 )
      ( MAKE-6PILE ?auto_197690 ?auto_197691 ?auto_197692 ?auto_197693 ?auto_197694 ?auto_197695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197717 - BLOCK
      ?auto_197718 - BLOCK
      ?auto_197719 - BLOCK
      ?auto_197720 - BLOCK
      ?auto_197721 - BLOCK
      ?auto_197722 - BLOCK
    )
    :vars
    (
      ?auto_197723 - BLOCK
      ?auto_197724 - BLOCK
      ?auto_197725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197717 ) ( ON ?auto_197718 ?auto_197717 ) ( ON ?auto_197719 ?auto_197718 ) ( ON ?auto_197720 ?auto_197719 ) ( ON ?auto_197721 ?auto_197720 ) ( not ( = ?auto_197717 ?auto_197718 ) ) ( not ( = ?auto_197717 ?auto_197719 ) ) ( not ( = ?auto_197717 ?auto_197720 ) ) ( not ( = ?auto_197717 ?auto_197721 ) ) ( not ( = ?auto_197717 ?auto_197722 ) ) ( not ( = ?auto_197717 ?auto_197723 ) ) ( not ( = ?auto_197718 ?auto_197719 ) ) ( not ( = ?auto_197718 ?auto_197720 ) ) ( not ( = ?auto_197718 ?auto_197721 ) ) ( not ( = ?auto_197718 ?auto_197722 ) ) ( not ( = ?auto_197718 ?auto_197723 ) ) ( not ( = ?auto_197719 ?auto_197720 ) ) ( not ( = ?auto_197719 ?auto_197721 ) ) ( not ( = ?auto_197719 ?auto_197722 ) ) ( not ( = ?auto_197719 ?auto_197723 ) ) ( not ( = ?auto_197720 ?auto_197721 ) ) ( not ( = ?auto_197720 ?auto_197722 ) ) ( not ( = ?auto_197720 ?auto_197723 ) ) ( not ( = ?auto_197721 ?auto_197722 ) ) ( not ( = ?auto_197721 ?auto_197723 ) ) ( not ( = ?auto_197722 ?auto_197723 ) ) ( not ( = ?auto_197717 ?auto_197724 ) ) ( not ( = ?auto_197718 ?auto_197724 ) ) ( not ( = ?auto_197719 ?auto_197724 ) ) ( not ( = ?auto_197720 ?auto_197724 ) ) ( not ( = ?auto_197721 ?auto_197724 ) ) ( not ( = ?auto_197722 ?auto_197724 ) ) ( not ( = ?auto_197723 ?auto_197724 ) ) ( ON ?auto_197724 ?auto_197725 ) ( not ( = ?auto_197717 ?auto_197725 ) ) ( not ( = ?auto_197718 ?auto_197725 ) ) ( not ( = ?auto_197719 ?auto_197725 ) ) ( not ( = ?auto_197720 ?auto_197725 ) ) ( not ( = ?auto_197721 ?auto_197725 ) ) ( not ( = ?auto_197722 ?auto_197725 ) ) ( not ( = ?auto_197723 ?auto_197725 ) ) ( not ( = ?auto_197724 ?auto_197725 ) ) ( ON ?auto_197723 ?auto_197724 ) ( CLEAR ?auto_197723 ) ( HOLDING ?auto_197722 ) ( CLEAR ?auto_197721 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197717 ?auto_197718 ?auto_197719 ?auto_197720 ?auto_197721 ?auto_197722 ?auto_197723 )
      ( MAKE-6PILE ?auto_197717 ?auto_197718 ?auto_197719 ?auto_197720 ?auto_197721 ?auto_197722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197726 - BLOCK
      ?auto_197727 - BLOCK
      ?auto_197728 - BLOCK
      ?auto_197729 - BLOCK
      ?auto_197730 - BLOCK
      ?auto_197731 - BLOCK
    )
    :vars
    (
      ?auto_197734 - BLOCK
      ?auto_197732 - BLOCK
      ?auto_197733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197726 ) ( ON ?auto_197727 ?auto_197726 ) ( ON ?auto_197728 ?auto_197727 ) ( ON ?auto_197729 ?auto_197728 ) ( ON ?auto_197730 ?auto_197729 ) ( not ( = ?auto_197726 ?auto_197727 ) ) ( not ( = ?auto_197726 ?auto_197728 ) ) ( not ( = ?auto_197726 ?auto_197729 ) ) ( not ( = ?auto_197726 ?auto_197730 ) ) ( not ( = ?auto_197726 ?auto_197731 ) ) ( not ( = ?auto_197726 ?auto_197734 ) ) ( not ( = ?auto_197727 ?auto_197728 ) ) ( not ( = ?auto_197727 ?auto_197729 ) ) ( not ( = ?auto_197727 ?auto_197730 ) ) ( not ( = ?auto_197727 ?auto_197731 ) ) ( not ( = ?auto_197727 ?auto_197734 ) ) ( not ( = ?auto_197728 ?auto_197729 ) ) ( not ( = ?auto_197728 ?auto_197730 ) ) ( not ( = ?auto_197728 ?auto_197731 ) ) ( not ( = ?auto_197728 ?auto_197734 ) ) ( not ( = ?auto_197729 ?auto_197730 ) ) ( not ( = ?auto_197729 ?auto_197731 ) ) ( not ( = ?auto_197729 ?auto_197734 ) ) ( not ( = ?auto_197730 ?auto_197731 ) ) ( not ( = ?auto_197730 ?auto_197734 ) ) ( not ( = ?auto_197731 ?auto_197734 ) ) ( not ( = ?auto_197726 ?auto_197732 ) ) ( not ( = ?auto_197727 ?auto_197732 ) ) ( not ( = ?auto_197728 ?auto_197732 ) ) ( not ( = ?auto_197729 ?auto_197732 ) ) ( not ( = ?auto_197730 ?auto_197732 ) ) ( not ( = ?auto_197731 ?auto_197732 ) ) ( not ( = ?auto_197734 ?auto_197732 ) ) ( ON ?auto_197732 ?auto_197733 ) ( not ( = ?auto_197726 ?auto_197733 ) ) ( not ( = ?auto_197727 ?auto_197733 ) ) ( not ( = ?auto_197728 ?auto_197733 ) ) ( not ( = ?auto_197729 ?auto_197733 ) ) ( not ( = ?auto_197730 ?auto_197733 ) ) ( not ( = ?auto_197731 ?auto_197733 ) ) ( not ( = ?auto_197734 ?auto_197733 ) ) ( not ( = ?auto_197732 ?auto_197733 ) ) ( ON ?auto_197734 ?auto_197732 ) ( CLEAR ?auto_197730 ) ( ON ?auto_197731 ?auto_197734 ) ( CLEAR ?auto_197731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197733 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197733 ?auto_197732 ?auto_197734 )
      ( MAKE-6PILE ?auto_197726 ?auto_197727 ?auto_197728 ?auto_197729 ?auto_197730 ?auto_197731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197735 - BLOCK
      ?auto_197736 - BLOCK
      ?auto_197737 - BLOCK
      ?auto_197738 - BLOCK
      ?auto_197739 - BLOCK
      ?auto_197740 - BLOCK
    )
    :vars
    (
      ?auto_197741 - BLOCK
      ?auto_197743 - BLOCK
      ?auto_197742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197735 ) ( ON ?auto_197736 ?auto_197735 ) ( ON ?auto_197737 ?auto_197736 ) ( ON ?auto_197738 ?auto_197737 ) ( not ( = ?auto_197735 ?auto_197736 ) ) ( not ( = ?auto_197735 ?auto_197737 ) ) ( not ( = ?auto_197735 ?auto_197738 ) ) ( not ( = ?auto_197735 ?auto_197739 ) ) ( not ( = ?auto_197735 ?auto_197740 ) ) ( not ( = ?auto_197735 ?auto_197741 ) ) ( not ( = ?auto_197736 ?auto_197737 ) ) ( not ( = ?auto_197736 ?auto_197738 ) ) ( not ( = ?auto_197736 ?auto_197739 ) ) ( not ( = ?auto_197736 ?auto_197740 ) ) ( not ( = ?auto_197736 ?auto_197741 ) ) ( not ( = ?auto_197737 ?auto_197738 ) ) ( not ( = ?auto_197737 ?auto_197739 ) ) ( not ( = ?auto_197737 ?auto_197740 ) ) ( not ( = ?auto_197737 ?auto_197741 ) ) ( not ( = ?auto_197738 ?auto_197739 ) ) ( not ( = ?auto_197738 ?auto_197740 ) ) ( not ( = ?auto_197738 ?auto_197741 ) ) ( not ( = ?auto_197739 ?auto_197740 ) ) ( not ( = ?auto_197739 ?auto_197741 ) ) ( not ( = ?auto_197740 ?auto_197741 ) ) ( not ( = ?auto_197735 ?auto_197743 ) ) ( not ( = ?auto_197736 ?auto_197743 ) ) ( not ( = ?auto_197737 ?auto_197743 ) ) ( not ( = ?auto_197738 ?auto_197743 ) ) ( not ( = ?auto_197739 ?auto_197743 ) ) ( not ( = ?auto_197740 ?auto_197743 ) ) ( not ( = ?auto_197741 ?auto_197743 ) ) ( ON ?auto_197743 ?auto_197742 ) ( not ( = ?auto_197735 ?auto_197742 ) ) ( not ( = ?auto_197736 ?auto_197742 ) ) ( not ( = ?auto_197737 ?auto_197742 ) ) ( not ( = ?auto_197738 ?auto_197742 ) ) ( not ( = ?auto_197739 ?auto_197742 ) ) ( not ( = ?auto_197740 ?auto_197742 ) ) ( not ( = ?auto_197741 ?auto_197742 ) ) ( not ( = ?auto_197743 ?auto_197742 ) ) ( ON ?auto_197741 ?auto_197743 ) ( ON ?auto_197740 ?auto_197741 ) ( CLEAR ?auto_197740 ) ( ON-TABLE ?auto_197742 ) ( HOLDING ?auto_197739 ) ( CLEAR ?auto_197738 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197735 ?auto_197736 ?auto_197737 ?auto_197738 ?auto_197739 )
      ( MAKE-6PILE ?auto_197735 ?auto_197736 ?auto_197737 ?auto_197738 ?auto_197739 ?auto_197740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197744 - BLOCK
      ?auto_197745 - BLOCK
      ?auto_197746 - BLOCK
      ?auto_197747 - BLOCK
      ?auto_197748 - BLOCK
      ?auto_197749 - BLOCK
    )
    :vars
    (
      ?auto_197752 - BLOCK
      ?auto_197750 - BLOCK
      ?auto_197751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197744 ) ( ON ?auto_197745 ?auto_197744 ) ( ON ?auto_197746 ?auto_197745 ) ( ON ?auto_197747 ?auto_197746 ) ( not ( = ?auto_197744 ?auto_197745 ) ) ( not ( = ?auto_197744 ?auto_197746 ) ) ( not ( = ?auto_197744 ?auto_197747 ) ) ( not ( = ?auto_197744 ?auto_197748 ) ) ( not ( = ?auto_197744 ?auto_197749 ) ) ( not ( = ?auto_197744 ?auto_197752 ) ) ( not ( = ?auto_197745 ?auto_197746 ) ) ( not ( = ?auto_197745 ?auto_197747 ) ) ( not ( = ?auto_197745 ?auto_197748 ) ) ( not ( = ?auto_197745 ?auto_197749 ) ) ( not ( = ?auto_197745 ?auto_197752 ) ) ( not ( = ?auto_197746 ?auto_197747 ) ) ( not ( = ?auto_197746 ?auto_197748 ) ) ( not ( = ?auto_197746 ?auto_197749 ) ) ( not ( = ?auto_197746 ?auto_197752 ) ) ( not ( = ?auto_197747 ?auto_197748 ) ) ( not ( = ?auto_197747 ?auto_197749 ) ) ( not ( = ?auto_197747 ?auto_197752 ) ) ( not ( = ?auto_197748 ?auto_197749 ) ) ( not ( = ?auto_197748 ?auto_197752 ) ) ( not ( = ?auto_197749 ?auto_197752 ) ) ( not ( = ?auto_197744 ?auto_197750 ) ) ( not ( = ?auto_197745 ?auto_197750 ) ) ( not ( = ?auto_197746 ?auto_197750 ) ) ( not ( = ?auto_197747 ?auto_197750 ) ) ( not ( = ?auto_197748 ?auto_197750 ) ) ( not ( = ?auto_197749 ?auto_197750 ) ) ( not ( = ?auto_197752 ?auto_197750 ) ) ( ON ?auto_197750 ?auto_197751 ) ( not ( = ?auto_197744 ?auto_197751 ) ) ( not ( = ?auto_197745 ?auto_197751 ) ) ( not ( = ?auto_197746 ?auto_197751 ) ) ( not ( = ?auto_197747 ?auto_197751 ) ) ( not ( = ?auto_197748 ?auto_197751 ) ) ( not ( = ?auto_197749 ?auto_197751 ) ) ( not ( = ?auto_197752 ?auto_197751 ) ) ( not ( = ?auto_197750 ?auto_197751 ) ) ( ON ?auto_197752 ?auto_197750 ) ( ON ?auto_197749 ?auto_197752 ) ( ON-TABLE ?auto_197751 ) ( CLEAR ?auto_197747 ) ( ON ?auto_197748 ?auto_197749 ) ( CLEAR ?auto_197748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197751 ?auto_197750 ?auto_197752 ?auto_197749 )
      ( MAKE-6PILE ?auto_197744 ?auto_197745 ?auto_197746 ?auto_197747 ?auto_197748 ?auto_197749 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197753 - BLOCK
      ?auto_197754 - BLOCK
      ?auto_197755 - BLOCK
      ?auto_197756 - BLOCK
      ?auto_197757 - BLOCK
      ?auto_197758 - BLOCK
    )
    :vars
    (
      ?auto_197759 - BLOCK
      ?auto_197761 - BLOCK
      ?auto_197760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197753 ) ( ON ?auto_197754 ?auto_197753 ) ( ON ?auto_197755 ?auto_197754 ) ( not ( = ?auto_197753 ?auto_197754 ) ) ( not ( = ?auto_197753 ?auto_197755 ) ) ( not ( = ?auto_197753 ?auto_197756 ) ) ( not ( = ?auto_197753 ?auto_197757 ) ) ( not ( = ?auto_197753 ?auto_197758 ) ) ( not ( = ?auto_197753 ?auto_197759 ) ) ( not ( = ?auto_197754 ?auto_197755 ) ) ( not ( = ?auto_197754 ?auto_197756 ) ) ( not ( = ?auto_197754 ?auto_197757 ) ) ( not ( = ?auto_197754 ?auto_197758 ) ) ( not ( = ?auto_197754 ?auto_197759 ) ) ( not ( = ?auto_197755 ?auto_197756 ) ) ( not ( = ?auto_197755 ?auto_197757 ) ) ( not ( = ?auto_197755 ?auto_197758 ) ) ( not ( = ?auto_197755 ?auto_197759 ) ) ( not ( = ?auto_197756 ?auto_197757 ) ) ( not ( = ?auto_197756 ?auto_197758 ) ) ( not ( = ?auto_197756 ?auto_197759 ) ) ( not ( = ?auto_197757 ?auto_197758 ) ) ( not ( = ?auto_197757 ?auto_197759 ) ) ( not ( = ?auto_197758 ?auto_197759 ) ) ( not ( = ?auto_197753 ?auto_197761 ) ) ( not ( = ?auto_197754 ?auto_197761 ) ) ( not ( = ?auto_197755 ?auto_197761 ) ) ( not ( = ?auto_197756 ?auto_197761 ) ) ( not ( = ?auto_197757 ?auto_197761 ) ) ( not ( = ?auto_197758 ?auto_197761 ) ) ( not ( = ?auto_197759 ?auto_197761 ) ) ( ON ?auto_197761 ?auto_197760 ) ( not ( = ?auto_197753 ?auto_197760 ) ) ( not ( = ?auto_197754 ?auto_197760 ) ) ( not ( = ?auto_197755 ?auto_197760 ) ) ( not ( = ?auto_197756 ?auto_197760 ) ) ( not ( = ?auto_197757 ?auto_197760 ) ) ( not ( = ?auto_197758 ?auto_197760 ) ) ( not ( = ?auto_197759 ?auto_197760 ) ) ( not ( = ?auto_197761 ?auto_197760 ) ) ( ON ?auto_197759 ?auto_197761 ) ( ON ?auto_197758 ?auto_197759 ) ( ON-TABLE ?auto_197760 ) ( ON ?auto_197757 ?auto_197758 ) ( CLEAR ?auto_197757 ) ( HOLDING ?auto_197756 ) ( CLEAR ?auto_197755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197753 ?auto_197754 ?auto_197755 ?auto_197756 )
      ( MAKE-6PILE ?auto_197753 ?auto_197754 ?auto_197755 ?auto_197756 ?auto_197757 ?auto_197758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197762 - BLOCK
      ?auto_197763 - BLOCK
      ?auto_197764 - BLOCK
      ?auto_197765 - BLOCK
      ?auto_197766 - BLOCK
      ?auto_197767 - BLOCK
    )
    :vars
    (
      ?auto_197769 - BLOCK
      ?auto_197770 - BLOCK
      ?auto_197768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197762 ) ( ON ?auto_197763 ?auto_197762 ) ( ON ?auto_197764 ?auto_197763 ) ( not ( = ?auto_197762 ?auto_197763 ) ) ( not ( = ?auto_197762 ?auto_197764 ) ) ( not ( = ?auto_197762 ?auto_197765 ) ) ( not ( = ?auto_197762 ?auto_197766 ) ) ( not ( = ?auto_197762 ?auto_197767 ) ) ( not ( = ?auto_197762 ?auto_197769 ) ) ( not ( = ?auto_197763 ?auto_197764 ) ) ( not ( = ?auto_197763 ?auto_197765 ) ) ( not ( = ?auto_197763 ?auto_197766 ) ) ( not ( = ?auto_197763 ?auto_197767 ) ) ( not ( = ?auto_197763 ?auto_197769 ) ) ( not ( = ?auto_197764 ?auto_197765 ) ) ( not ( = ?auto_197764 ?auto_197766 ) ) ( not ( = ?auto_197764 ?auto_197767 ) ) ( not ( = ?auto_197764 ?auto_197769 ) ) ( not ( = ?auto_197765 ?auto_197766 ) ) ( not ( = ?auto_197765 ?auto_197767 ) ) ( not ( = ?auto_197765 ?auto_197769 ) ) ( not ( = ?auto_197766 ?auto_197767 ) ) ( not ( = ?auto_197766 ?auto_197769 ) ) ( not ( = ?auto_197767 ?auto_197769 ) ) ( not ( = ?auto_197762 ?auto_197770 ) ) ( not ( = ?auto_197763 ?auto_197770 ) ) ( not ( = ?auto_197764 ?auto_197770 ) ) ( not ( = ?auto_197765 ?auto_197770 ) ) ( not ( = ?auto_197766 ?auto_197770 ) ) ( not ( = ?auto_197767 ?auto_197770 ) ) ( not ( = ?auto_197769 ?auto_197770 ) ) ( ON ?auto_197770 ?auto_197768 ) ( not ( = ?auto_197762 ?auto_197768 ) ) ( not ( = ?auto_197763 ?auto_197768 ) ) ( not ( = ?auto_197764 ?auto_197768 ) ) ( not ( = ?auto_197765 ?auto_197768 ) ) ( not ( = ?auto_197766 ?auto_197768 ) ) ( not ( = ?auto_197767 ?auto_197768 ) ) ( not ( = ?auto_197769 ?auto_197768 ) ) ( not ( = ?auto_197770 ?auto_197768 ) ) ( ON ?auto_197769 ?auto_197770 ) ( ON ?auto_197767 ?auto_197769 ) ( ON-TABLE ?auto_197768 ) ( ON ?auto_197766 ?auto_197767 ) ( CLEAR ?auto_197764 ) ( ON ?auto_197765 ?auto_197766 ) ( CLEAR ?auto_197765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197768 ?auto_197770 ?auto_197769 ?auto_197767 ?auto_197766 )
      ( MAKE-6PILE ?auto_197762 ?auto_197763 ?auto_197764 ?auto_197765 ?auto_197766 ?auto_197767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197771 - BLOCK
      ?auto_197772 - BLOCK
      ?auto_197773 - BLOCK
      ?auto_197774 - BLOCK
      ?auto_197775 - BLOCK
      ?auto_197776 - BLOCK
    )
    :vars
    (
      ?auto_197778 - BLOCK
      ?auto_197777 - BLOCK
      ?auto_197779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197771 ) ( ON ?auto_197772 ?auto_197771 ) ( not ( = ?auto_197771 ?auto_197772 ) ) ( not ( = ?auto_197771 ?auto_197773 ) ) ( not ( = ?auto_197771 ?auto_197774 ) ) ( not ( = ?auto_197771 ?auto_197775 ) ) ( not ( = ?auto_197771 ?auto_197776 ) ) ( not ( = ?auto_197771 ?auto_197778 ) ) ( not ( = ?auto_197772 ?auto_197773 ) ) ( not ( = ?auto_197772 ?auto_197774 ) ) ( not ( = ?auto_197772 ?auto_197775 ) ) ( not ( = ?auto_197772 ?auto_197776 ) ) ( not ( = ?auto_197772 ?auto_197778 ) ) ( not ( = ?auto_197773 ?auto_197774 ) ) ( not ( = ?auto_197773 ?auto_197775 ) ) ( not ( = ?auto_197773 ?auto_197776 ) ) ( not ( = ?auto_197773 ?auto_197778 ) ) ( not ( = ?auto_197774 ?auto_197775 ) ) ( not ( = ?auto_197774 ?auto_197776 ) ) ( not ( = ?auto_197774 ?auto_197778 ) ) ( not ( = ?auto_197775 ?auto_197776 ) ) ( not ( = ?auto_197775 ?auto_197778 ) ) ( not ( = ?auto_197776 ?auto_197778 ) ) ( not ( = ?auto_197771 ?auto_197777 ) ) ( not ( = ?auto_197772 ?auto_197777 ) ) ( not ( = ?auto_197773 ?auto_197777 ) ) ( not ( = ?auto_197774 ?auto_197777 ) ) ( not ( = ?auto_197775 ?auto_197777 ) ) ( not ( = ?auto_197776 ?auto_197777 ) ) ( not ( = ?auto_197778 ?auto_197777 ) ) ( ON ?auto_197777 ?auto_197779 ) ( not ( = ?auto_197771 ?auto_197779 ) ) ( not ( = ?auto_197772 ?auto_197779 ) ) ( not ( = ?auto_197773 ?auto_197779 ) ) ( not ( = ?auto_197774 ?auto_197779 ) ) ( not ( = ?auto_197775 ?auto_197779 ) ) ( not ( = ?auto_197776 ?auto_197779 ) ) ( not ( = ?auto_197778 ?auto_197779 ) ) ( not ( = ?auto_197777 ?auto_197779 ) ) ( ON ?auto_197778 ?auto_197777 ) ( ON ?auto_197776 ?auto_197778 ) ( ON-TABLE ?auto_197779 ) ( ON ?auto_197775 ?auto_197776 ) ( ON ?auto_197774 ?auto_197775 ) ( CLEAR ?auto_197774 ) ( HOLDING ?auto_197773 ) ( CLEAR ?auto_197772 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197771 ?auto_197772 ?auto_197773 )
      ( MAKE-6PILE ?auto_197771 ?auto_197772 ?auto_197773 ?auto_197774 ?auto_197775 ?auto_197776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197780 - BLOCK
      ?auto_197781 - BLOCK
      ?auto_197782 - BLOCK
      ?auto_197783 - BLOCK
      ?auto_197784 - BLOCK
      ?auto_197785 - BLOCK
    )
    :vars
    (
      ?auto_197786 - BLOCK
      ?auto_197787 - BLOCK
      ?auto_197788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197780 ) ( ON ?auto_197781 ?auto_197780 ) ( not ( = ?auto_197780 ?auto_197781 ) ) ( not ( = ?auto_197780 ?auto_197782 ) ) ( not ( = ?auto_197780 ?auto_197783 ) ) ( not ( = ?auto_197780 ?auto_197784 ) ) ( not ( = ?auto_197780 ?auto_197785 ) ) ( not ( = ?auto_197780 ?auto_197786 ) ) ( not ( = ?auto_197781 ?auto_197782 ) ) ( not ( = ?auto_197781 ?auto_197783 ) ) ( not ( = ?auto_197781 ?auto_197784 ) ) ( not ( = ?auto_197781 ?auto_197785 ) ) ( not ( = ?auto_197781 ?auto_197786 ) ) ( not ( = ?auto_197782 ?auto_197783 ) ) ( not ( = ?auto_197782 ?auto_197784 ) ) ( not ( = ?auto_197782 ?auto_197785 ) ) ( not ( = ?auto_197782 ?auto_197786 ) ) ( not ( = ?auto_197783 ?auto_197784 ) ) ( not ( = ?auto_197783 ?auto_197785 ) ) ( not ( = ?auto_197783 ?auto_197786 ) ) ( not ( = ?auto_197784 ?auto_197785 ) ) ( not ( = ?auto_197784 ?auto_197786 ) ) ( not ( = ?auto_197785 ?auto_197786 ) ) ( not ( = ?auto_197780 ?auto_197787 ) ) ( not ( = ?auto_197781 ?auto_197787 ) ) ( not ( = ?auto_197782 ?auto_197787 ) ) ( not ( = ?auto_197783 ?auto_197787 ) ) ( not ( = ?auto_197784 ?auto_197787 ) ) ( not ( = ?auto_197785 ?auto_197787 ) ) ( not ( = ?auto_197786 ?auto_197787 ) ) ( ON ?auto_197787 ?auto_197788 ) ( not ( = ?auto_197780 ?auto_197788 ) ) ( not ( = ?auto_197781 ?auto_197788 ) ) ( not ( = ?auto_197782 ?auto_197788 ) ) ( not ( = ?auto_197783 ?auto_197788 ) ) ( not ( = ?auto_197784 ?auto_197788 ) ) ( not ( = ?auto_197785 ?auto_197788 ) ) ( not ( = ?auto_197786 ?auto_197788 ) ) ( not ( = ?auto_197787 ?auto_197788 ) ) ( ON ?auto_197786 ?auto_197787 ) ( ON ?auto_197785 ?auto_197786 ) ( ON-TABLE ?auto_197788 ) ( ON ?auto_197784 ?auto_197785 ) ( ON ?auto_197783 ?auto_197784 ) ( CLEAR ?auto_197781 ) ( ON ?auto_197782 ?auto_197783 ) ( CLEAR ?auto_197782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197788 ?auto_197787 ?auto_197786 ?auto_197785 ?auto_197784 ?auto_197783 )
      ( MAKE-6PILE ?auto_197780 ?auto_197781 ?auto_197782 ?auto_197783 ?auto_197784 ?auto_197785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197789 - BLOCK
      ?auto_197790 - BLOCK
      ?auto_197791 - BLOCK
      ?auto_197792 - BLOCK
      ?auto_197793 - BLOCK
      ?auto_197794 - BLOCK
    )
    :vars
    (
      ?auto_197796 - BLOCK
      ?auto_197795 - BLOCK
      ?auto_197797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197789 ) ( not ( = ?auto_197789 ?auto_197790 ) ) ( not ( = ?auto_197789 ?auto_197791 ) ) ( not ( = ?auto_197789 ?auto_197792 ) ) ( not ( = ?auto_197789 ?auto_197793 ) ) ( not ( = ?auto_197789 ?auto_197794 ) ) ( not ( = ?auto_197789 ?auto_197796 ) ) ( not ( = ?auto_197790 ?auto_197791 ) ) ( not ( = ?auto_197790 ?auto_197792 ) ) ( not ( = ?auto_197790 ?auto_197793 ) ) ( not ( = ?auto_197790 ?auto_197794 ) ) ( not ( = ?auto_197790 ?auto_197796 ) ) ( not ( = ?auto_197791 ?auto_197792 ) ) ( not ( = ?auto_197791 ?auto_197793 ) ) ( not ( = ?auto_197791 ?auto_197794 ) ) ( not ( = ?auto_197791 ?auto_197796 ) ) ( not ( = ?auto_197792 ?auto_197793 ) ) ( not ( = ?auto_197792 ?auto_197794 ) ) ( not ( = ?auto_197792 ?auto_197796 ) ) ( not ( = ?auto_197793 ?auto_197794 ) ) ( not ( = ?auto_197793 ?auto_197796 ) ) ( not ( = ?auto_197794 ?auto_197796 ) ) ( not ( = ?auto_197789 ?auto_197795 ) ) ( not ( = ?auto_197790 ?auto_197795 ) ) ( not ( = ?auto_197791 ?auto_197795 ) ) ( not ( = ?auto_197792 ?auto_197795 ) ) ( not ( = ?auto_197793 ?auto_197795 ) ) ( not ( = ?auto_197794 ?auto_197795 ) ) ( not ( = ?auto_197796 ?auto_197795 ) ) ( ON ?auto_197795 ?auto_197797 ) ( not ( = ?auto_197789 ?auto_197797 ) ) ( not ( = ?auto_197790 ?auto_197797 ) ) ( not ( = ?auto_197791 ?auto_197797 ) ) ( not ( = ?auto_197792 ?auto_197797 ) ) ( not ( = ?auto_197793 ?auto_197797 ) ) ( not ( = ?auto_197794 ?auto_197797 ) ) ( not ( = ?auto_197796 ?auto_197797 ) ) ( not ( = ?auto_197795 ?auto_197797 ) ) ( ON ?auto_197796 ?auto_197795 ) ( ON ?auto_197794 ?auto_197796 ) ( ON-TABLE ?auto_197797 ) ( ON ?auto_197793 ?auto_197794 ) ( ON ?auto_197792 ?auto_197793 ) ( ON ?auto_197791 ?auto_197792 ) ( CLEAR ?auto_197791 ) ( HOLDING ?auto_197790 ) ( CLEAR ?auto_197789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197789 ?auto_197790 )
      ( MAKE-6PILE ?auto_197789 ?auto_197790 ?auto_197791 ?auto_197792 ?auto_197793 ?auto_197794 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197798 - BLOCK
      ?auto_197799 - BLOCK
      ?auto_197800 - BLOCK
      ?auto_197801 - BLOCK
      ?auto_197802 - BLOCK
      ?auto_197803 - BLOCK
    )
    :vars
    (
      ?auto_197806 - BLOCK
      ?auto_197804 - BLOCK
      ?auto_197805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_197798 ) ( not ( = ?auto_197798 ?auto_197799 ) ) ( not ( = ?auto_197798 ?auto_197800 ) ) ( not ( = ?auto_197798 ?auto_197801 ) ) ( not ( = ?auto_197798 ?auto_197802 ) ) ( not ( = ?auto_197798 ?auto_197803 ) ) ( not ( = ?auto_197798 ?auto_197806 ) ) ( not ( = ?auto_197799 ?auto_197800 ) ) ( not ( = ?auto_197799 ?auto_197801 ) ) ( not ( = ?auto_197799 ?auto_197802 ) ) ( not ( = ?auto_197799 ?auto_197803 ) ) ( not ( = ?auto_197799 ?auto_197806 ) ) ( not ( = ?auto_197800 ?auto_197801 ) ) ( not ( = ?auto_197800 ?auto_197802 ) ) ( not ( = ?auto_197800 ?auto_197803 ) ) ( not ( = ?auto_197800 ?auto_197806 ) ) ( not ( = ?auto_197801 ?auto_197802 ) ) ( not ( = ?auto_197801 ?auto_197803 ) ) ( not ( = ?auto_197801 ?auto_197806 ) ) ( not ( = ?auto_197802 ?auto_197803 ) ) ( not ( = ?auto_197802 ?auto_197806 ) ) ( not ( = ?auto_197803 ?auto_197806 ) ) ( not ( = ?auto_197798 ?auto_197804 ) ) ( not ( = ?auto_197799 ?auto_197804 ) ) ( not ( = ?auto_197800 ?auto_197804 ) ) ( not ( = ?auto_197801 ?auto_197804 ) ) ( not ( = ?auto_197802 ?auto_197804 ) ) ( not ( = ?auto_197803 ?auto_197804 ) ) ( not ( = ?auto_197806 ?auto_197804 ) ) ( ON ?auto_197804 ?auto_197805 ) ( not ( = ?auto_197798 ?auto_197805 ) ) ( not ( = ?auto_197799 ?auto_197805 ) ) ( not ( = ?auto_197800 ?auto_197805 ) ) ( not ( = ?auto_197801 ?auto_197805 ) ) ( not ( = ?auto_197802 ?auto_197805 ) ) ( not ( = ?auto_197803 ?auto_197805 ) ) ( not ( = ?auto_197806 ?auto_197805 ) ) ( not ( = ?auto_197804 ?auto_197805 ) ) ( ON ?auto_197806 ?auto_197804 ) ( ON ?auto_197803 ?auto_197806 ) ( ON-TABLE ?auto_197805 ) ( ON ?auto_197802 ?auto_197803 ) ( ON ?auto_197801 ?auto_197802 ) ( ON ?auto_197800 ?auto_197801 ) ( CLEAR ?auto_197798 ) ( ON ?auto_197799 ?auto_197800 ) ( CLEAR ?auto_197799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197805 ?auto_197804 ?auto_197806 ?auto_197803 ?auto_197802 ?auto_197801 ?auto_197800 )
      ( MAKE-6PILE ?auto_197798 ?auto_197799 ?auto_197800 ?auto_197801 ?auto_197802 ?auto_197803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197807 - BLOCK
      ?auto_197808 - BLOCK
      ?auto_197809 - BLOCK
      ?auto_197810 - BLOCK
      ?auto_197811 - BLOCK
      ?auto_197812 - BLOCK
    )
    :vars
    (
      ?auto_197815 - BLOCK
      ?auto_197813 - BLOCK
      ?auto_197814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197807 ?auto_197808 ) ) ( not ( = ?auto_197807 ?auto_197809 ) ) ( not ( = ?auto_197807 ?auto_197810 ) ) ( not ( = ?auto_197807 ?auto_197811 ) ) ( not ( = ?auto_197807 ?auto_197812 ) ) ( not ( = ?auto_197807 ?auto_197815 ) ) ( not ( = ?auto_197808 ?auto_197809 ) ) ( not ( = ?auto_197808 ?auto_197810 ) ) ( not ( = ?auto_197808 ?auto_197811 ) ) ( not ( = ?auto_197808 ?auto_197812 ) ) ( not ( = ?auto_197808 ?auto_197815 ) ) ( not ( = ?auto_197809 ?auto_197810 ) ) ( not ( = ?auto_197809 ?auto_197811 ) ) ( not ( = ?auto_197809 ?auto_197812 ) ) ( not ( = ?auto_197809 ?auto_197815 ) ) ( not ( = ?auto_197810 ?auto_197811 ) ) ( not ( = ?auto_197810 ?auto_197812 ) ) ( not ( = ?auto_197810 ?auto_197815 ) ) ( not ( = ?auto_197811 ?auto_197812 ) ) ( not ( = ?auto_197811 ?auto_197815 ) ) ( not ( = ?auto_197812 ?auto_197815 ) ) ( not ( = ?auto_197807 ?auto_197813 ) ) ( not ( = ?auto_197808 ?auto_197813 ) ) ( not ( = ?auto_197809 ?auto_197813 ) ) ( not ( = ?auto_197810 ?auto_197813 ) ) ( not ( = ?auto_197811 ?auto_197813 ) ) ( not ( = ?auto_197812 ?auto_197813 ) ) ( not ( = ?auto_197815 ?auto_197813 ) ) ( ON ?auto_197813 ?auto_197814 ) ( not ( = ?auto_197807 ?auto_197814 ) ) ( not ( = ?auto_197808 ?auto_197814 ) ) ( not ( = ?auto_197809 ?auto_197814 ) ) ( not ( = ?auto_197810 ?auto_197814 ) ) ( not ( = ?auto_197811 ?auto_197814 ) ) ( not ( = ?auto_197812 ?auto_197814 ) ) ( not ( = ?auto_197815 ?auto_197814 ) ) ( not ( = ?auto_197813 ?auto_197814 ) ) ( ON ?auto_197815 ?auto_197813 ) ( ON ?auto_197812 ?auto_197815 ) ( ON-TABLE ?auto_197814 ) ( ON ?auto_197811 ?auto_197812 ) ( ON ?auto_197810 ?auto_197811 ) ( ON ?auto_197809 ?auto_197810 ) ( ON ?auto_197808 ?auto_197809 ) ( CLEAR ?auto_197808 ) ( HOLDING ?auto_197807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197807 )
      ( MAKE-6PILE ?auto_197807 ?auto_197808 ?auto_197809 ?auto_197810 ?auto_197811 ?auto_197812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_197816 - BLOCK
      ?auto_197817 - BLOCK
      ?auto_197818 - BLOCK
      ?auto_197819 - BLOCK
      ?auto_197820 - BLOCK
      ?auto_197821 - BLOCK
    )
    :vars
    (
      ?auto_197824 - BLOCK
      ?auto_197823 - BLOCK
      ?auto_197822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197816 ?auto_197817 ) ) ( not ( = ?auto_197816 ?auto_197818 ) ) ( not ( = ?auto_197816 ?auto_197819 ) ) ( not ( = ?auto_197816 ?auto_197820 ) ) ( not ( = ?auto_197816 ?auto_197821 ) ) ( not ( = ?auto_197816 ?auto_197824 ) ) ( not ( = ?auto_197817 ?auto_197818 ) ) ( not ( = ?auto_197817 ?auto_197819 ) ) ( not ( = ?auto_197817 ?auto_197820 ) ) ( not ( = ?auto_197817 ?auto_197821 ) ) ( not ( = ?auto_197817 ?auto_197824 ) ) ( not ( = ?auto_197818 ?auto_197819 ) ) ( not ( = ?auto_197818 ?auto_197820 ) ) ( not ( = ?auto_197818 ?auto_197821 ) ) ( not ( = ?auto_197818 ?auto_197824 ) ) ( not ( = ?auto_197819 ?auto_197820 ) ) ( not ( = ?auto_197819 ?auto_197821 ) ) ( not ( = ?auto_197819 ?auto_197824 ) ) ( not ( = ?auto_197820 ?auto_197821 ) ) ( not ( = ?auto_197820 ?auto_197824 ) ) ( not ( = ?auto_197821 ?auto_197824 ) ) ( not ( = ?auto_197816 ?auto_197823 ) ) ( not ( = ?auto_197817 ?auto_197823 ) ) ( not ( = ?auto_197818 ?auto_197823 ) ) ( not ( = ?auto_197819 ?auto_197823 ) ) ( not ( = ?auto_197820 ?auto_197823 ) ) ( not ( = ?auto_197821 ?auto_197823 ) ) ( not ( = ?auto_197824 ?auto_197823 ) ) ( ON ?auto_197823 ?auto_197822 ) ( not ( = ?auto_197816 ?auto_197822 ) ) ( not ( = ?auto_197817 ?auto_197822 ) ) ( not ( = ?auto_197818 ?auto_197822 ) ) ( not ( = ?auto_197819 ?auto_197822 ) ) ( not ( = ?auto_197820 ?auto_197822 ) ) ( not ( = ?auto_197821 ?auto_197822 ) ) ( not ( = ?auto_197824 ?auto_197822 ) ) ( not ( = ?auto_197823 ?auto_197822 ) ) ( ON ?auto_197824 ?auto_197823 ) ( ON ?auto_197821 ?auto_197824 ) ( ON-TABLE ?auto_197822 ) ( ON ?auto_197820 ?auto_197821 ) ( ON ?auto_197819 ?auto_197820 ) ( ON ?auto_197818 ?auto_197819 ) ( ON ?auto_197817 ?auto_197818 ) ( ON ?auto_197816 ?auto_197817 ) ( CLEAR ?auto_197816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197822 ?auto_197823 ?auto_197824 ?auto_197821 ?auto_197820 ?auto_197819 ?auto_197818 ?auto_197817 )
      ( MAKE-6PILE ?auto_197816 ?auto_197817 ?auto_197818 ?auto_197819 ?auto_197820 ?auto_197821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197827 - BLOCK
      ?auto_197828 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_197828 ) ( CLEAR ?auto_197827 ) ( ON-TABLE ?auto_197827 ) ( not ( = ?auto_197827 ?auto_197828 ) ) )
    :subtasks
    ( ( !STACK ?auto_197828 ?auto_197827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197829 - BLOCK
      ?auto_197830 - BLOCK
    )
    :vars
    (
      ?auto_197831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_197829 ) ( ON-TABLE ?auto_197829 ) ( not ( = ?auto_197829 ?auto_197830 ) ) ( ON ?auto_197830 ?auto_197831 ) ( CLEAR ?auto_197830 ) ( HAND-EMPTY ) ( not ( = ?auto_197829 ?auto_197831 ) ) ( not ( = ?auto_197830 ?auto_197831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197830 ?auto_197831 )
      ( MAKE-2PILE ?auto_197829 ?auto_197830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197832 - BLOCK
      ?auto_197833 - BLOCK
    )
    :vars
    (
      ?auto_197834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197832 ?auto_197833 ) ) ( ON ?auto_197833 ?auto_197834 ) ( CLEAR ?auto_197833 ) ( not ( = ?auto_197832 ?auto_197834 ) ) ( not ( = ?auto_197833 ?auto_197834 ) ) ( HOLDING ?auto_197832 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197832 )
      ( MAKE-2PILE ?auto_197832 ?auto_197833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197835 - BLOCK
      ?auto_197836 - BLOCK
    )
    :vars
    (
      ?auto_197837 - BLOCK
      ?auto_197838 - BLOCK
      ?auto_197841 - BLOCK
      ?auto_197839 - BLOCK
      ?auto_197842 - BLOCK
      ?auto_197840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197835 ?auto_197836 ) ) ( ON ?auto_197836 ?auto_197837 ) ( not ( = ?auto_197835 ?auto_197837 ) ) ( not ( = ?auto_197836 ?auto_197837 ) ) ( ON ?auto_197835 ?auto_197836 ) ( CLEAR ?auto_197835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197838 ) ( ON ?auto_197841 ?auto_197838 ) ( ON ?auto_197839 ?auto_197841 ) ( ON ?auto_197842 ?auto_197839 ) ( ON ?auto_197840 ?auto_197842 ) ( ON ?auto_197837 ?auto_197840 ) ( not ( = ?auto_197838 ?auto_197841 ) ) ( not ( = ?auto_197838 ?auto_197839 ) ) ( not ( = ?auto_197838 ?auto_197842 ) ) ( not ( = ?auto_197838 ?auto_197840 ) ) ( not ( = ?auto_197838 ?auto_197837 ) ) ( not ( = ?auto_197838 ?auto_197836 ) ) ( not ( = ?auto_197838 ?auto_197835 ) ) ( not ( = ?auto_197841 ?auto_197839 ) ) ( not ( = ?auto_197841 ?auto_197842 ) ) ( not ( = ?auto_197841 ?auto_197840 ) ) ( not ( = ?auto_197841 ?auto_197837 ) ) ( not ( = ?auto_197841 ?auto_197836 ) ) ( not ( = ?auto_197841 ?auto_197835 ) ) ( not ( = ?auto_197839 ?auto_197842 ) ) ( not ( = ?auto_197839 ?auto_197840 ) ) ( not ( = ?auto_197839 ?auto_197837 ) ) ( not ( = ?auto_197839 ?auto_197836 ) ) ( not ( = ?auto_197839 ?auto_197835 ) ) ( not ( = ?auto_197842 ?auto_197840 ) ) ( not ( = ?auto_197842 ?auto_197837 ) ) ( not ( = ?auto_197842 ?auto_197836 ) ) ( not ( = ?auto_197842 ?auto_197835 ) ) ( not ( = ?auto_197840 ?auto_197837 ) ) ( not ( = ?auto_197840 ?auto_197836 ) ) ( not ( = ?auto_197840 ?auto_197835 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197838 ?auto_197841 ?auto_197839 ?auto_197842 ?auto_197840 ?auto_197837 ?auto_197836 )
      ( MAKE-2PILE ?auto_197835 ?auto_197836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197843 - BLOCK
      ?auto_197844 - BLOCK
    )
    :vars
    (
      ?auto_197850 - BLOCK
      ?auto_197846 - BLOCK
      ?auto_197849 - BLOCK
      ?auto_197848 - BLOCK
      ?auto_197845 - BLOCK
      ?auto_197847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197843 ?auto_197844 ) ) ( ON ?auto_197844 ?auto_197850 ) ( not ( = ?auto_197843 ?auto_197850 ) ) ( not ( = ?auto_197844 ?auto_197850 ) ) ( ON-TABLE ?auto_197846 ) ( ON ?auto_197849 ?auto_197846 ) ( ON ?auto_197848 ?auto_197849 ) ( ON ?auto_197845 ?auto_197848 ) ( ON ?auto_197847 ?auto_197845 ) ( ON ?auto_197850 ?auto_197847 ) ( not ( = ?auto_197846 ?auto_197849 ) ) ( not ( = ?auto_197846 ?auto_197848 ) ) ( not ( = ?auto_197846 ?auto_197845 ) ) ( not ( = ?auto_197846 ?auto_197847 ) ) ( not ( = ?auto_197846 ?auto_197850 ) ) ( not ( = ?auto_197846 ?auto_197844 ) ) ( not ( = ?auto_197846 ?auto_197843 ) ) ( not ( = ?auto_197849 ?auto_197848 ) ) ( not ( = ?auto_197849 ?auto_197845 ) ) ( not ( = ?auto_197849 ?auto_197847 ) ) ( not ( = ?auto_197849 ?auto_197850 ) ) ( not ( = ?auto_197849 ?auto_197844 ) ) ( not ( = ?auto_197849 ?auto_197843 ) ) ( not ( = ?auto_197848 ?auto_197845 ) ) ( not ( = ?auto_197848 ?auto_197847 ) ) ( not ( = ?auto_197848 ?auto_197850 ) ) ( not ( = ?auto_197848 ?auto_197844 ) ) ( not ( = ?auto_197848 ?auto_197843 ) ) ( not ( = ?auto_197845 ?auto_197847 ) ) ( not ( = ?auto_197845 ?auto_197850 ) ) ( not ( = ?auto_197845 ?auto_197844 ) ) ( not ( = ?auto_197845 ?auto_197843 ) ) ( not ( = ?auto_197847 ?auto_197850 ) ) ( not ( = ?auto_197847 ?auto_197844 ) ) ( not ( = ?auto_197847 ?auto_197843 ) ) ( HOLDING ?auto_197843 ) ( CLEAR ?auto_197844 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197846 ?auto_197849 ?auto_197848 ?auto_197845 ?auto_197847 ?auto_197850 ?auto_197844 ?auto_197843 )
      ( MAKE-2PILE ?auto_197843 ?auto_197844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197851 - BLOCK
      ?auto_197852 - BLOCK
    )
    :vars
    (
      ?auto_197854 - BLOCK
      ?auto_197857 - BLOCK
      ?auto_197855 - BLOCK
      ?auto_197858 - BLOCK
      ?auto_197856 - BLOCK
      ?auto_197853 - BLOCK
      ?auto_197859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197851 ?auto_197852 ) ) ( ON ?auto_197852 ?auto_197854 ) ( not ( = ?auto_197851 ?auto_197854 ) ) ( not ( = ?auto_197852 ?auto_197854 ) ) ( ON-TABLE ?auto_197857 ) ( ON ?auto_197855 ?auto_197857 ) ( ON ?auto_197858 ?auto_197855 ) ( ON ?auto_197856 ?auto_197858 ) ( ON ?auto_197853 ?auto_197856 ) ( ON ?auto_197854 ?auto_197853 ) ( not ( = ?auto_197857 ?auto_197855 ) ) ( not ( = ?auto_197857 ?auto_197858 ) ) ( not ( = ?auto_197857 ?auto_197856 ) ) ( not ( = ?auto_197857 ?auto_197853 ) ) ( not ( = ?auto_197857 ?auto_197854 ) ) ( not ( = ?auto_197857 ?auto_197852 ) ) ( not ( = ?auto_197857 ?auto_197851 ) ) ( not ( = ?auto_197855 ?auto_197858 ) ) ( not ( = ?auto_197855 ?auto_197856 ) ) ( not ( = ?auto_197855 ?auto_197853 ) ) ( not ( = ?auto_197855 ?auto_197854 ) ) ( not ( = ?auto_197855 ?auto_197852 ) ) ( not ( = ?auto_197855 ?auto_197851 ) ) ( not ( = ?auto_197858 ?auto_197856 ) ) ( not ( = ?auto_197858 ?auto_197853 ) ) ( not ( = ?auto_197858 ?auto_197854 ) ) ( not ( = ?auto_197858 ?auto_197852 ) ) ( not ( = ?auto_197858 ?auto_197851 ) ) ( not ( = ?auto_197856 ?auto_197853 ) ) ( not ( = ?auto_197856 ?auto_197854 ) ) ( not ( = ?auto_197856 ?auto_197852 ) ) ( not ( = ?auto_197856 ?auto_197851 ) ) ( not ( = ?auto_197853 ?auto_197854 ) ) ( not ( = ?auto_197853 ?auto_197852 ) ) ( not ( = ?auto_197853 ?auto_197851 ) ) ( CLEAR ?auto_197852 ) ( ON ?auto_197851 ?auto_197859 ) ( CLEAR ?auto_197851 ) ( HAND-EMPTY ) ( not ( = ?auto_197851 ?auto_197859 ) ) ( not ( = ?auto_197852 ?auto_197859 ) ) ( not ( = ?auto_197854 ?auto_197859 ) ) ( not ( = ?auto_197857 ?auto_197859 ) ) ( not ( = ?auto_197855 ?auto_197859 ) ) ( not ( = ?auto_197858 ?auto_197859 ) ) ( not ( = ?auto_197856 ?auto_197859 ) ) ( not ( = ?auto_197853 ?auto_197859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197851 ?auto_197859 )
      ( MAKE-2PILE ?auto_197851 ?auto_197852 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197860 - BLOCK
      ?auto_197861 - BLOCK
    )
    :vars
    (
      ?auto_197866 - BLOCK
      ?auto_197864 - BLOCK
      ?auto_197865 - BLOCK
      ?auto_197863 - BLOCK
      ?auto_197867 - BLOCK
      ?auto_197868 - BLOCK
      ?auto_197862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197860 ?auto_197861 ) ) ( not ( = ?auto_197860 ?auto_197866 ) ) ( not ( = ?auto_197861 ?auto_197866 ) ) ( ON-TABLE ?auto_197864 ) ( ON ?auto_197865 ?auto_197864 ) ( ON ?auto_197863 ?auto_197865 ) ( ON ?auto_197867 ?auto_197863 ) ( ON ?auto_197868 ?auto_197867 ) ( ON ?auto_197866 ?auto_197868 ) ( not ( = ?auto_197864 ?auto_197865 ) ) ( not ( = ?auto_197864 ?auto_197863 ) ) ( not ( = ?auto_197864 ?auto_197867 ) ) ( not ( = ?auto_197864 ?auto_197868 ) ) ( not ( = ?auto_197864 ?auto_197866 ) ) ( not ( = ?auto_197864 ?auto_197861 ) ) ( not ( = ?auto_197864 ?auto_197860 ) ) ( not ( = ?auto_197865 ?auto_197863 ) ) ( not ( = ?auto_197865 ?auto_197867 ) ) ( not ( = ?auto_197865 ?auto_197868 ) ) ( not ( = ?auto_197865 ?auto_197866 ) ) ( not ( = ?auto_197865 ?auto_197861 ) ) ( not ( = ?auto_197865 ?auto_197860 ) ) ( not ( = ?auto_197863 ?auto_197867 ) ) ( not ( = ?auto_197863 ?auto_197868 ) ) ( not ( = ?auto_197863 ?auto_197866 ) ) ( not ( = ?auto_197863 ?auto_197861 ) ) ( not ( = ?auto_197863 ?auto_197860 ) ) ( not ( = ?auto_197867 ?auto_197868 ) ) ( not ( = ?auto_197867 ?auto_197866 ) ) ( not ( = ?auto_197867 ?auto_197861 ) ) ( not ( = ?auto_197867 ?auto_197860 ) ) ( not ( = ?auto_197868 ?auto_197866 ) ) ( not ( = ?auto_197868 ?auto_197861 ) ) ( not ( = ?auto_197868 ?auto_197860 ) ) ( ON ?auto_197860 ?auto_197862 ) ( CLEAR ?auto_197860 ) ( not ( = ?auto_197860 ?auto_197862 ) ) ( not ( = ?auto_197861 ?auto_197862 ) ) ( not ( = ?auto_197866 ?auto_197862 ) ) ( not ( = ?auto_197864 ?auto_197862 ) ) ( not ( = ?auto_197865 ?auto_197862 ) ) ( not ( = ?auto_197863 ?auto_197862 ) ) ( not ( = ?auto_197867 ?auto_197862 ) ) ( not ( = ?auto_197868 ?auto_197862 ) ) ( HOLDING ?auto_197861 ) ( CLEAR ?auto_197866 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197864 ?auto_197865 ?auto_197863 ?auto_197867 ?auto_197868 ?auto_197866 ?auto_197861 )
      ( MAKE-2PILE ?auto_197860 ?auto_197861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197869 - BLOCK
      ?auto_197870 - BLOCK
    )
    :vars
    (
      ?auto_197876 - BLOCK
      ?auto_197874 - BLOCK
      ?auto_197871 - BLOCK
      ?auto_197872 - BLOCK
      ?auto_197873 - BLOCK
      ?auto_197875 - BLOCK
      ?auto_197877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197869 ?auto_197870 ) ) ( not ( = ?auto_197869 ?auto_197876 ) ) ( not ( = ?auto_197870 ?auto_197876 ) ) ( ON-TABLE ?auto_197874 ) ( ON ?auto_197871 ?auto_197874 ) ( ON ?auto_197872 ?auto_197871 ) ( ON ?auto_197873 ?auto_197872 ) ( ON ?auto_197875 ?auto_197873 ) ( ON ?auto_197876 ?auto_197875 ) ( not ( = ?auto_197874 ?auto_197871 ) ) ( not ( = ?auto_197874 ?auto_197872 ) ) ( not ( = ?auto_197874 ?auto_197873 ) ) ( not ( = ?auto_197874 ?auto_197875 ) ) ( not ( = ?auto_197874 ?auto_197876 ) ) ( not ( = ?auto_197874 ?auto_197870 ) ) ( not ( = ?auto_197874 ?auto_197869 ) ) ( not ( = ?auto_197871 ?auto_197872 ) ) ( not ( = ?auto_197871 ?auto_197873 ) ) ( not ( = ?auto_197871 ?auto_197875 ) ) ( not ( = ?auto_197871 ?auto_197876 ) ) ( not ( = ?auto_197871 ?auto_197870 ) ) ( not ( = ?auto_197871 ?auto_197869 ) ) ( not ( = ?auto_197872 ?auto_197873 ) ) ( not ( = ?auto_197872 ?auto_197875 ) ) ( not ( = ?auto_197872 ?auto_197876 ) ) ( not ( = ?auto_197872 ?auto_197870 ) ) ( not ( = ?auto_197872 ?auto_197869 ) ) ( not ( = ?auto_197873 ?auto_197875 ) ) ( not ( = ?auto_197873 ?auto_197876 ) ) ( not ( = ?auto_197873 ?auto_197870 ) ) ( not ( = ?auto_197873 ?auto_197869 ) ) ( not ( = ?auto_197875 ?auto_197876 ) ) ( not ( = ?auto_197875 ?auto_197870 ) ) ( not ( = ?auto_197875 ?auto_197869 ) ) ( ON ?auto_197869 ?auto_197877 ) ( not ( = ?auto_197869 ?auto_197877 ) ) ( not ( = ?auto_197870 ?auto_197877 ) ) ( not ( = ?auto_197876 ?auto_197877 ) ) ( not ( = ?auto_197874 ?auto_197877 ) ) ( not ( = ?auto_197871 ?auto_197877 ) ) ( not ( = ?auto_197872 ?auto_197877 ) ) ( not ( = ?auto_197873 ?auto_197877 ) ) ( not ( = ?auto_197875 ?auto_197877 ) ) ( CLEAR ?auto_197876 ) ( ON ?auto_197870 ?auto_197869 ) ( CLEAR ?auto_197870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197877 ?auto_197869 )
      ( MAKE-2PILE ?auto_197869 ?auto_197870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197878 - BLOCK
      ?auto_197879 - BLOCK
    )
    :vars
    (
      ?auto_197885 - BLOCK
      ?auto_197882 - BLOCK
      ?auto_197884 - BLOCK
      ?auto_197880 - BLOCK
      ?auto_197886 - BLOCK
      ?auto_197881 - BLOCK
      ?auto_197883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197878 ?auto_197879 ) ) ( not ( = ?auto_197878 ?auto_197885 ) ) ( not ( = ?auto_197879 ?auto_197885 ) ) ( ON-TABLE ?auto_197882 ) ( ON ?auto_197884 ?auto_197882 ) ( ON ?auto_197880 ?auto_197884 ) ( ON ?auto_197886 ?auto_197880 ) ( ON ?auto_197881 ?auto_197886 ) ( not ( = ?auto_197882 ?auto_197884 ) ) ( not ( = ?auto_197882 ?auto_197880 ) ) ( not ( = ?auto_197882 ?auto_197886 ) ) ( not ( = ?auto_197882 ?auto_197881 ) ) ( not ( = ?auto_197882 ?auto_197885 ) ) ( not ( = ?auto_197882 ?auto_197879 ) ) ( not ( = ?auto_197882 ?auto_197878 ) ) ( not ( = ?auto_197884 ?auto_197880 ) ) ( not ( = ?auto_197884 ?auto_197886 ) ) ( not ( = ?auto_197884 ?auto_197881 ) ) ( not ( = ?auto_197884 ?auto_197885 ) ) ( not ( = ?auto_197884 ?auto_197879 ) ) ( not ( = ?auto_197884 ?auto_197878 ) ) ( not ( = ?auto_197880 ?auto_197886 ) ) ( not ( = ?auto_197880 ?auto_197881 ) ) ( not ( = ?auto_197880 ?auto_197885 ) ) ( not ( = ?auto_197880 ?auto_197879 ) ) ( not ( = ?auto_197880 ?auto_197878 ) ) ( not ( = ?auto_197886 ?auto_197881 ) ) ( not ( = ?auto_197886 ?auto_197885 ) ) ( not ( = ?auto_197886 ?auto_197879 ) ) ( not ( = ?auto_197886 ?auto_197878 ) ) ( not ( = ?auto_197881 ?auto_197885 ) ) ( not ( = ?auto_197881 ?auto_197879 ) ) ( not ( = ?auto_197881 ?auto_197878 ) ) ( ON ?auto_197878 ?auto_197883 ) ( not ( = ?auto_197878 ?auto_197883 ) ) ( not ( = ?auto_197879 ?auto_197883 ) ) ( not ( = ?auto_197885 ?auto_197883 ) ) ( not ( = ?auto_197882 ?auto_197883 ) ) ( not ( = ?auto_197884 ?auto_197883 ) ) ( not ( = ?auto_197880 ?auto_197883 ) ) ( not ( = ?auto_197886 ?auto_197883 ) ) ( not ( = ?auto_197881 ?auto_197883 ) ) ( ON ?auto_197879 ?auto_197878 ) ( CLEAR ?auto_197879 ) ( ON-TABLE ?auto_197883 ) ( HOLDING ?auto_197885 ) ( CLEAR ?auto_197881 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197882 ?auto_197884 ?auto_197880 ?auto_197886 ?auto_197881 ?auto_197885 )
      ( MAKE-2PILE ?auto_197878 ?auto_197879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197887 - BLOCK
      ?auto_197888 - BLOCK
    )
    :vars
    (
      ?auto_197889 - BLOCK
      ?auto_197894 - BLOCK
      ?auto_197892 - BLOCK
      ?auto_197890 - BLOCK
      ?auto_197895 - BLOCK
      ?auto_197891 - BLOCK
      ?auto_197893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197887 ?auto_197888 ) ) ( not ( = ?auto_197887 ?auto_197889 ) ) ( not ( = ?auto_197888 ?auto_197889 ) ) ( ON-TABLE ?auto_197894 ) ( ON ?auto_197892 ?auto_197894 ) ( ON ?auto_197890 ?auto_197892 ) ( ON ?auto_197895 ?auto_197890 ) ( ON ?auto_197891 ?auto_197895 ) ( not ( = ?auto_197894 ?auto_197892 ) ) ( not ( = ?auto_197894 ?auto_197890 ) ) ( not ( = ?auto_197894 ?auto_197895 ) ) ( not ( = ?auto_197894 ?auto_197891 ) ) ( not ( = ?auto_197894 ?auto_197889 ) ) ( not ( = ?auto_197894 ?auto_197888 ) ) ( not ( = ?auto_197894 ?auto_197887 ) ) ( not ( = ?auto_197892 ?auto_197890 ) ) ( not ( = ?auto_197892 ?auto_197895 ) ) ( not ( = ?auto_197892 ?auto_197891 ) ) ( not ( = ?auto_197892 ?auto_197889 ) ) ( not ( = ?auto_197892 ?auto_197888 ) ) ( not ( = ?auto_197892 ?auto_197887 ) ) ( not ( = ?auto_197890 ?auto_197895 ) ) ( not ( = ?auto_197890 ?auto_197891 ) ) ( not ( = ?auto_197890 ?auto_197889 ) ) ( not ( = ?auto_197890 ?auto_197888 ) ) ( not ( = ?auto_197890 ?auto_197887 ) ) ( not ( = ?auto_197895 ?auto_197891 ) ) ( not ( = ?auto_197895 ?auto_197889 ) ) ( not ( = ?auto_197895 ?auto_197888 ) ) ( not ( = ?auto_197895 ?auto_197887 ) ) ( not ( = ?auto_197891 ?auto_197889 ) ) ( not ( = ?auto_197891 ?auto_197888 ) ) ( not ( = ?auto_197891 ?auto_197887 ) ) ( ON ?auto_197887 ?auto_197893 ) ( not ( = ?auto_197887 ?auto_197893 ) ) ( not ( = ?auto_197888 ?auto_197893 ) ) ( not ( = ?auto_197889 ?auto_197893 ) ) ( not ( = ?auto_197894 ?auto_197893 ) ) ( not ( = ?auto_197892 ?auto_197893 ) ) ( not ( = ?auto_197890 ?auto_197893 ) ) ( not ( = ?auto_197895 ?auto_197893 ) ) ( not ( = ?auto_197891 ?auto_197893 ) ) ( ON ?auto_197888 ?auto_197887 ) ( ON-TABLE ?auto_197893 ) ( CLEAR ?auto_197891 ) ( ON ?auto_197889 ?auto_197888 ) ( CLEAR ?auto_197889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197893 ?auto_197887 ?auto_197888 )
      ( MAKE-2PILE ?auto_197887 ?auto_197888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197896 - BLOCK
      ?auto_197897 - BLOCK
    )
    :vars
    (
      ?auto_197902 - BLOCK
      ?auto_197899 - BLOCK
      ?auto_197904 - BLOCK
      ?auto_197903 - BLOCK
      ?auto_197898 - BLOCK
      ?auto_197901 - BLOCK
      ?auto_197900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197896 ?auto_197897 ) ) ( not ( = ?auto_197896 ?auto_197902 ) ) ( not ( = ?auto_197897 ?auto_197902 ) ) ( ON-TABLE ?auto_197899 ) ( ON ?auto_197904 ?auto_197899 ) ( ON ?auto_197903 ?auto_197904 ) ( ON ?auto_197898 ?auto_197903 ) ( not ( = ?auto_197899 ?auto_197904 ) ) ( not ( = ?auto_197899 ?auto_197903 ) ) ( not ( = ?auto_197899 ?auto_197898 ) ) ( not ( = ?auto_197899 ?auto_197901 ) ) ( not ( = ?auto_197899 ?auto_197902 ) ) ( not ( = ?auto_197899 ?auto_197897 ) ) ( not ( = ?auto_197899 ?auto_197896 ) ) ( not ( = ?auto_197904 ?auto_197903 ) ) ( not ( = ?auto_197904 ?auto_197898 ) ) ( not ( = ?auto_197904 ?auto_197901 ) ) ( not ( = ?auto_197904 ?auto_197902 ) ) ( not ( = ?auto_197904 ?auto_197897 ) ) ( not ( = ?auto_197904 ?auto_197896 ) ) ( not ( = ?auto_197903 ?auto_197898 ) ) ( not ( = ?auto_197903 ?auto_197901 ) ) ( not ( = ?auto_197903 ?auto_197902 ) ) ( not ( = ?auto_197903 ?auto_197897 ) ) ( not ( = ?auto_197903 ?auto_197896 ) ) ( not ( = ?auto_197898 ?auto_197901 ) ) ( not ( = ?auto_197898 ?auto_197902 ) ) ( not ( = ?auto_197898 ?auto_197897 ) ) ( not ( = ?auto_197898 ?auto_197896 ) ) ( not ( = ?auto_197901 ?auto_197902 ) ) ( not ( = ?auto_197901 ?auto_197897 ) ) ( not ( = ?auto_197901 ?auto_197896 ) ) ( ON ?auto_197896 ?auto_197900 ) ( not ( = ?auto_197896 ?auto_197900 ) ) ( not ( = ?auto_197897 ?auto_197900 ) ) ( not ( = ?auto_197902 ?auto_197900 ) ) ( not ( = ?auto_197899 ?auto_197900 ) ) ( not ( = ?auto_197904 ?auto_197900 ) ) ( not ( = ?auto_197903 ?auto_197900 ) ) ( not ( = ?auto_197898 ?auto_197900 ) ) ( not ( = ?auto_197901 ?auto_197900 ) ) ( ON ?auto_197897 ?auto_197896 ) ( ON-TABLE ?auto_197900 ) ( ON ?auto_197902 ?auto_197897 ) ( CLEAR ?auto_197902 ) ( HOLDING ?auto_197901 ) ( CLEAR ?auto_197898 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197899 ?auto_197904 ?auto_197903 ?auto_197898 ?auto_197901 )
      ( MAKE-2PILE ?auto_197896 ?auto_197897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197905 - BLOCK
      ?auto_197906 - BLOCK
    )
    :vars
    (
      ?auto_197910 - BLOCK
      ?auto_197909 - BLOCK
      ?auto_197908 - BLOCK
      ?auto_197911 - BLOCK
      ?auto_197912 - BLOCK
      ?auto_197907 - BLOCK
      ?auto_197913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197905 ?auto_197906 ) ) ( not ( = ?auto_197905 ?auto_197910 ) ) ( not ( = ?auto_197906 ?auto_197910 ) ) ( ON-TABLE ?auto_197909 ) ( ON ?auto_197908 ?auto_197909 ) ( ON ?auto_197911 ?auto_197908 ) ( ON ?auto_197912 ?auto_197911 ) ( not ( = ?auto_197909 ?auto_197908 ) ) ( not ( = ?auto_197909 ?auto_197911 ) ) ( not ( = ?auto_197909 ?auto_197912 ) ) ( not ( = ?auto_197909 ?auto_197907 ) ) ( not ( = ?auto_197909 ?auto_197910 ) ) ( not ( = ?auto_197909 ?auto_197906 ) ) ( not ( = ?auto_197909 ?auto_197905 ) ) ( not ( = ?auto_197908 ?auto_197911 ) ) ( not ( = ?auto_197908 ?auto_197912 ) ) ( not ( = ?auto_197908 ?auto_197907 ) ) ( not ( = ?auto_197908 ?auto_197910 ) ) ( not ( = ?auto_197908 ?auto_197906 ) ) ( not ( = ?auto_197908 ?auto_197905 ) ) ( not ( = ?auto_197911 ?auto_197912 ) ) ( not ( = ?auto_197911 ?auto_197907 ) ) ( not ( = ?auto_197911 ?auto_197910 ) ) ( not ( = ?auto_197911 ?auto_197906 ) ) ( not ( = ?auto_197911 ?auto_197905 ) ) ( not ( = ?auto_197912 ?auto_197907 ) ) ( not ( = ?auto_197912 ?auto_197910 ) ) ( not ( = ?auto_197912 ?auto_197906 ) ) ( not ( = ?auto_197912 ?auto_197905 ) ) ( not ( = ?auto_197907 ?auto_197910 ) ) ( not ( = ?auto_197907 ?auto_197906 ) ) ( not ( = ?auto_197907 ?auto_197905 ) ) ( ON ?auto_197905 ?auto_197913 ) ( not ( = ?auto_197905 ?auto_197913 ) ) ( not ( = ?auto_197906 ?auto_197913 ) ) ( not ( = ?auto_197910 ?auto_197913 ) ) ( not ( = ?auto_197909 ?auto_197913 ) ) ( not ( = ?auto_197908 ?auto_197913 ) ) ( not ( = ?auto_197911 ?auto_197913 ) ) ( not ( = ?auto_197912 ?auto_197913 ) ) ( not ( = ?auto_197907 ?auto_197913 ) ) ( ON ?auto_197906 ?auto_197905 ) ( ON-TABLE ?auto_197913 ) ( ON ?auto_197910 ?auto_197906 ) ( CLEAR ?auto_197912 ) ( ON ?auto_197907 ?auto_197910 ) ( CLEAR ?auto_197907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197913 ?auto_197905 ?auto_197906 ?auto_197910 )
      ( MAKE-2PILE ?auto_197905 ?auto_197906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197914 - BLOCK
      ?auto_197915 - BLOCK
    )
    :vars
    (
      ?auto_197922 - BLOCK
      ?auto_197921 - BLOCK
      ?auto_197916 - BLOCK
      ?auto_197920 - BLOCK
      ?auto_197919 - BLOCK
      ?auto_197917 - BLOCK
      ?auto_197918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197914 ?auto_197915 ) ) ( not ( = ?auto_197914 ?auto_197922 ) ) ( not ( = ?auto_197915 ?auto_197922 ) ) ( ON-TABLE ?auto_197921 ) ( ON ?auto_197916 ?auto_197921 ) ( ON ?auto_197920 ?auto_197916 ) ( not ( = ?auto_197921 ?auto_197916 ) ) ( not ( = ?auto_197921 ?auto_197920 ) ) ( not ( = ?auto_197921 ?auto_197919 ) ) ( not ( = ?auto_197921 ?auto_197917 ) ) ( not ( = ?auto_197921 ?auto_197922 ) ) ( not ( = ?auto_197921 ?auto_197915 ) ) ( not ( = ?auto_197921 ?auto_197914 ) ) ( not ( = ?auto_197916 ?auto_197920 ) ) ( not ( = ?auto_197916 ?auto_197919 ) ) ( not ( = ?auto_197916 ?auto_197917 ) ) ( not ( = ?auto_197916 ?auto_197922 ) ) ( not ( = ?auto_197916 ?auto_197915 ) ) ( not ( = ?auto_197916 ?auto_197914 ) ) ( not ( = ?auto_197920 ?auto_197919 ) ) ( not ( = ?auto_197920 ?auto_197917 ) ) ( not ( = ?auto_197920 ?auto_197922 ) ) ( not ( = ?auto_197920 ?auto_197915 ) ) ( not ( = ?auto_197920 ?auto_197914 ) ) ( not ( = ?auto_197919 ?auto_197917 ) ) ( not ( = ?auto_197919 ?auto_197922 ) ) ( not ( = ?auto_197919 ?auto_197915 ) ) ( not ( = ?auto_197919 ?auto_197914 ) ) ( not ( = ?auto_197917 ?auto_197922 ) ) ( not ( = ?auto_197917 ?auto_197915 ) ) ( not ( = ?auto_197917 ?auto_197914 ) ) ( ON ?auto_197914 ?auto_197918 ) ( not ( = ?auto_197914 ?auto_197918 ) ) ( not ( = ?auto_197915 ?auto_197918 ) ) ( not ( = ?auto_197922 ?auto_197918 ) ) ( not ( = ?auto_197921 ?auto_197918 ) ) ( not ( = ?auto_197916 ?auto_197918 ) ) ( not ( = ?auto_197920 ?auto_197918 ) ) ( not ( = ?auto_197919 ?auto_197918 ) ) ( not ( = ?auto_197917 ?auto_197918 ) ) ( ON ?auto_197915 ?auto_197914 ) ( ON-TABLE ?auto_197918 ) ( ON ?auto_197922 ?auto_197915 ) ( ON ?auto_197917 ?auto_197922 ) ( CLEAR ?auto_197917 ) ( HOLDING ?auto_197919 ) ( CLEAR ?auto_197920 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_197921 ?auto_197916 ?auto_197920 ?auto_197919 )
      ( MAKE-2PILE ?auto_197914 ?auto_197915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197923 - BLOCK
      ?auto_197924 - BLOCK
    )
    :vars
    (
      ?auto_197928 - BLOCK
      ?auto_197925 - BLOCK
      ?auto_197929 - BLOCK
      ?auto_197927 - BLOCK
      ?auto_197930 - BLOCK
      ?auto_197926 - BLOCK
      ?auto_197931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197923 ?auto_197924 ) ) ( not ( = ?auto_197923 ?auto_197928 ) ) ( not ( = ?auto_197924 ?auto_197928 ) ) ( ON-TABLE ?auto_197925 ) ( ON ?auto_197929 ?auto_197925 ) ( ON ?auto_197927 ?auto_197929 ) ( not ( = ?auto_197925 ?auto_197929 ) ) ( not ( = ?auto_197925 ?auto_197927 ) ) ( not ( = ?auto_197925 ?auto_197930 ) ) ( not ( = ?auto_197925 ?auto_197926 ) ) ( not ( = ?auto_197925 ?auto_197928 ) ) ( not ( = ?auto_197925 ?auto_197924 ) ) ( not ( = ?auto_197925 ?auto_197923 ) ) ( not ( = ?auto_197929 ?auto_197927 ) ) ( not ( = ?auto_197929 ?auto_197930 ) ) ( not ( = ?auto_197929 ?auto_197926 ) ) ( not ( = ?auto_197929 ?auto_197928 ) ) ( not ( = ?auto_197929 ?auto_197924 ) ) ( not ( = ?auto_197929 ?auto_197923 ) ) ( not ( = ?auto_197927 ?auto_197930 ) ) ( not ( = ?auto_197927 ?auto_197926 ) ) ( not ( = ?auto_197927 ?auto_197928 ) ) ( not ( = ?auto_197927 ?auto_197924 ) ) ( not ( = ?auto_197927 ?auto_197923 ) ) ( not ( = ?auto_197930 ?auto_197926 ) ) ( not ( = ?auto_197930 ?auto_197928 ) ) ( not ( = ?auto_197930 ?auto_197924 ) ) ( not ( = ?auto_197930 ?auto_197923 ) ) ( not ( = ?auto_197926 ?auto_197928 ) ) ( not ( = ?auto_197926 ?auto_197924 ) ) ( not ( = ?auto_197926 ?auto_197923 ) ) ( ON ?auto_197923 ?auto_197931 ) ( not ( = ?auto_197923 ?auto_197931 ) ) ( not ( = ?auto_197924 ?auto_197931 ) ) ( not ( = ?auto_197928 ?auto_197931 ) ) ( not ( = ?auto_197925 ?auto_197931 ) ) ( not ( = ?auto_197929 ?auto_197931 ) ) ( not ( = ?auto_197927 ?auto_197931 ) ) ( not ( = ?auto_197930 ?auto_197931 ) ) ( not ( = ?auto_197926 ?auto_197931 ) ) ( ON ?auto_197924 ?auto_197923 ) ( ON-TABLE ?auto_197931 ) ( ON ?auto_197928 ?auto_197924 ) ( ON ?auto_197926 ?auto_197928 ) ( CLEAR ?auto_197927 ) ( ON ?auto_197930 ?auto_197926 ) ( CLEAR ?auto_197930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_197931 ?auto_197923 ?auto_197924 ?auto_197928 ?auto_197926 )
      ( MAKE-2PILE ?auto_197923 ?auto_197924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197932 - BLOCK
      ?auto_197933 - BLOCK
    )
    :vars
    (
      ?auto_197937 - BLOCK
      ?auto_197935 - BLOCK
      ?auto_197934 - BLOCK
      ?auto_197940 - BLOCK
      ?auto_197938 - BLOCK
      ?auto_197939 - BLOCK
      ?auto_197936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197932 ?auto_197933 ) ) ( not ( = ?auto_197932 ?auto_197937 ) ) ( not ( = ?auto_197933 ?auto_197937 ) ) ( ON-TABLE ?auto_197935 ) ( ON ?auto_197934 ?auto_197935 ) ( not ( = ?auto_197935 ?auto_197934 ) ) ( not ( = ?auto_197935 ?auto_197940 ) ) ( not ( = ?auto_197935 ?auto_197938 ) ) ( not ( = ?auto_197935 ?auto_197939 ) ) ( not ( = ?auto_197935 ?auto_197937 ) ) ( not ( = ?auto_197935 ?auto_197933 ) ) ( not ( = ?auto_197935 ?auto_197932 ) ) ( not ( = ?auto_197934 ?auto_197940 ) ) ( not ( = ?auto_197934 ?auto_197938 ) ) ( not ( = ?auto_197934 ?auto_197939 ) ) ( not ( = ?auto_197934 ?auto_197937 ) ) ( not ( = ?auto_197934 ?auto_197933 ) ) ( not ( = ?auto_197934 ?auto_197932 ) ) ( not ( = ?auto_197940 ?auto_197938 ) ) ( not ( = ?auto_197940 ?auto_197939 ) ) ( not ( = ?auto_197940 ?auto_197937 ) ) ( not ( = ?auto_197940 ?auto_197933 ) ) ( not ( = ?auto_197940 ?auto_197932 ) ) ( not ( = ?auto_197938 ?auto_197939 ) ) ( not ( = ?auto_197938 ?auto_197937 ) ) ( not ( = ?auto_197938 ?auto_197933 ) ) ( not ( = ?auto_197938 ?auto_197932 ) ) ( not ( = ?auto_197939 ?auto_197937 ) ) ( not ( = ?auto_197939 ?auto_197933 ) ) ( not ( = ?auto_197939 ?auto_197932 ) ) ( ON ?auto_197932 ?auto_197936 ) ( not ( = ?auto_197932 ?auto_197936 ) ) ( not ( = ?auto_197933 ?auto_197936 ) ) ( not ( = ?auto_197937 ?auto_197936 ) ) ( not ( = ?auto_197935 ?auto_197936 ) ) ( not ( = ?auto_197934 ?auto_197936 ) ) ( not ( = ?auto_197940 ?auto_197936 ) ) ( not ( = ?auto_197938 ?auto_197936 ) ) ( not ( = ?auto_197939 ?auto_197936 ) ) ( ON ?auto_197933 ?auto_197932 ) ( ON-TABLE ?auto_197936 ) ( ON ?auto_197937 ?auto_197933 ) ( ON ?auto_197939 ?auto_197937 ) ( ON ?auto_197938 ?auto_197939 ) ( CLEAR ?auto_197938 ) ( HOLDING ?auto_197940 ) ( CLEAR ?auto_197934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_197935 ?auto_197934 ?auto_197940 )
      ( MAKE-2PILE ?auto_197932 ?auto_197933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197941 - BLOCK
      ?auto_197942 - BLOCK
    )
    :vars
    (
      ?auto_197948 - BLOCK
      ?auto_197944 - BLOCK
      ?auto_197949 - BLOCK
      ?auto_197946 - BLOCK
      ?auto_197943 - BLOCK
      ?auto_197945 - BLOCK
      ?auto_197947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197941 ?auto_197942 ) ) ( not ( = ?auto_197941 ?auto_197948 ) ) ( not ( = ?auto_197942 ?auto_197948 ) ) ( ON-TABLE ?auto_197944 ) ( ON ?auto_197949 ?auto_197944 ) ( not ( = ?auto_197944 ?auto_197949 ) ) ( not ( = ?auto_197944 ?auto_197946 ) ) ( not ( = ?auto_197944 ?auto_197943 ) ) ( not ( = ?auto_197944 ?auto_197945 ) ) ( not ( = ?auto_197944 ?auto_197948 ) ) ( not ( = ?auto_197944 ?auto_197942 ) ) ( not ( = ?auto_197944 ?auto_197941 ) ) ( not ( = ?auto_197949 ?auto_197946 ) ) ( not ( = ?auto_197949 ?auto_197943 ) ) ( not ( = ?auto_197949 ?auto_197945 ) ) ( not ( = ?auto_197949 ?auto_197948 ) ) ( not ( = ?auto_197949 ?auto_197942 ) ) ( not ( = ?auto_197949 ?auto_197941 ) ) ( not ( = ?auto_197946 ?auto_197943 ) ) ( not ( = ?auto_197946 ?auto_197945 ) ) ( not ( = ?auto_197946 ?auto_197948 ) ) ( not ( = ?auto_197946 ?auto_197942 ) ) ( not ( = ?auto_197946 ?auto_197941 ) ) ( not ( = ?auto_197943 ?auto_197945 ) ) ( not ( = ?auto_197943 ?auto_197948 ) ) ( not ( = ?auto_197943 ?auto_197942 ) ) ( not ( = ?auto_197943 ?auto_197941 ) ) ( not ( = ?auto_197945 ?auto_197948 ) ) ( not ( = ?auto_197945 ?auto_197942 ) ) ( not ( = ?auto_197945 ?auto_197941 ) ) ( ON ?auto_197941 ?auto_197947 ) ( not ( = ?auto_197941 ?auto_197947 ) ) ( not ( = ?auto_197942 ?auto_197947 ) ) ( not ( = ?auto_197948 ?auto_197947 ) ) ( not ( = ?auto_197944 ?auto_197947 ) ) ( not ( = ?auto_197949 ?auto_197947 ) ) ( not ( = ?auto_197946 ?auto_197947 ) ) ( not ( = ?auto_197943 ?auto_197947 ) ) ( not ( = ?auto_197945 ?auto_197947 ) ) ( ON ?auto_197942 ?auto_197941 ) ( ON-TABLE ?auto_197947 ) ( ON ?auto_197948 ?auto_197942 ) ( ON ?auto_197945 ?auto_197948 ) ( ON ?auto_197943 ?auto_197945 ) ( CLEAR ?auto_197949 ) ( ON ?auto_197946 ?auto_197943 ) ( CLEAR ?auto_197946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_197947 ?auto_197941 ?auto_197942 ?auto_197948 ?auto_197945 ?auto_197943 )
      ( MAKE-2PILE ?auto_197941 ?auto_197942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197950 - BLOCK
      ?auto_197951 - BLOCK
    )
    :vars
    (
      ?auto_197953 - BLOCK
      ?auto_197952 - BLOCK
      ?auto_197954 - BLOCK
      ?auto_197956 - BLOCK
      ?auto_197958 - BLOCK
      ?auto_197957 - BLOCK
      ?auto_197955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197950 ?auto_197951 ) ) ( not ( = ?auto_197950 ?auto_197953 ) ) ( not ( = ?auto_197951 ?auto_197953 ) ) ( ON-TABLE ?auto_197952 ) ( not ( = ?auto_197952 ?auto_197954 ) ) ( not ( = ?auto_197952 ?auto_197956 ) ) ( not ( = ?auto_197952 ?auto_197958 ) ) ( not ( = ?auto_197952 ?auto_197957 ) ) ( not ( = ?auto_197952 ?auto_197953 ) ) ( not ( = ?auto_197952 ?auto_197951 ) ) ( not ( = ?auto_197952 ?auto_197950 ) ) ( not ( = ?auto_197954 ?auto_197956 ) ) ( not ( = ?auto_197954 ?auto_197958 ) ) ( not ( = ?auto_197954 ?auto_197957 ) ) ( not ( = ?auto_197954 ?auto_197953 ) ) ( not ( = ?auto_197954 ?auto_197951 ) ) ( not ( = ?auto_197954 ?auto_197950 ) ) ( not ( = ?auto_197956 ?auto_197958 ) ) ( not ( = ?auto_197956 ?auto_197957 ) ) ( not ( = ?auto_197956 ?auto_197953 ) ) ( not ( = ?auto_197956 ?auto_197951 ) ) ( not ( = ?auto_197956 ?auto_197950 ) ) ( not ( = ?auto_197958 ?auto_197957 ) ) ( not ( = ?auto_197958 ?auto_197953 ) ) ( not ( = ?auto_197958 ?auto_197951 ) ) ( not ( = ?auto_197958 ?auto_197950 ) ) ( not ( = ?auto_197957 ?auto_197953 ) ) ( not ( = ?auto_197957 ?auto_197951 ) ) ( not ( = ?auto_197957 ?auto_197950 ) ) ( ON ?auto_197950 ?auto_197955 ) ( not ( = ?auto_197950 ?auto_197955 ) ) ( not ( = ?auto_197951 ?auto_197955 ) ) ( not ( = ?auto_197953 ?auto_197955 ) ) ( not ( = ?auto_197952 ?auto_197955 ) ) ( not ( = ?auto_197954 ?auto_197955 ) ) ( not ( = ?auto_197956 ?auto_197955 ) ) ( not ( = ?auto_197958 ?auto_197955 ) ) ( not ( = ?auto_197957 ?auto_197955 ) ) ( ON ?auto_197951 ?auto_197950 ) ( ON-TABLE ?auto_197955 ) ( ON ?auto_197953 ?auto_197951 ) ( ON ?auto_197957 ?auto_197953 ) ( ON ?auto_197958 ?auto_197957 ) ( ON ?auto_197956 ?auto_197958 ) ( CLEAR ?auto_197956 ) ( HOLDING ?auto_197954 ) ( CLEAR ?auto_197952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_197952 ?auto_197954 )
      ( MAKE-2PILE ?auto_197950 ?auto_197951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197959 - BLOCK
      ?auto_197960 - BLOCK
    )
    :vars
    (
      ?auto_197962 - BLOCK
      ?auto_197965 - BLOCK
      ?auto_197961 - BLOCK
      ?auto_197963 - BLOCK
      ?auto_197967 - BLOCK
      ?auto_197966 - BLOCK
      ?auto_197964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197959 ?auto_197960 ) ) ( not ( = ?auto_197959 ?auto_197962 ) ) ( not ( = ?auto_197960 ?auto_197962 ) ) ( ON-TABLE ?auto_197965 ) ( not ( = ?auto_197965 ?auto_197961 ) ) ( not ( = ?auto_197965 ?auto_197963 ) ) ( not ( = ?auto_197965 ?auto_197967 ) ) ( not ( = ?auto_197965 ?auto_197966 ) ) ( not ( = ?auto_197965 ?auto_197962 ) ) ( not ( = ?auto_197965 ?auto_197960 ) ) ( not ( = ?auto_197965 ?auto_197959 ) ) ( not ( = ?auto_197961 ?auto_197963 ) ) ( not ( = ?auto_197961 ?auto_197967 ) ) ( not ( = ?auto_197961 ?auto_197966 ) ) ( not ( = ?auto_197961 ?auto_197962 ) ) ( not ( = ?auto_197961 ?auto_197960 ) ) ( not ( = ?auto_197961 ?auto_197959 ) ) ( not ( = ?auto_197963 ?auto_197967 ) ) ( not ( = ?auto_197963 ?auto_197966 ) ) ( not ( = ?auto_197963 ?auto_197962 ) ) ( not ( = ?auto_197963 ?auto_197960 ) ) ( not ( = ?auto_197963 ?auto_197959 ) ) ( not ( = ?auto_197967 ?auto_197966 ) ) ( not ( = ?auto_197967 ?auto_197962 ) ) ( not ( = ?auto_197967 ?auto_197960 ) ) ( not ( = ?auto_197967 ?auto_197959 ) ) ( not ( = ?auto_197966 ?auto_197962 ) ) ( not ( = ?auto_197966 ?auto_197960 ) ) ( not ( = ?auto_197966 ?auto_197959 ) ) ( ON ?auto_197959 ?auto_197964 ) ( not ( = ?auto_197959 ?auto_197964 ) ) ( not ( = ?auto_197960 ?auto_197964 ) ) ( not ( = ?auto_197962 ?auto_197964 ) ) ( not ( = ?auto_197965 ?auto_197964 ) ) ( not ( = ?auto_197961 ?auto_197964 ) ) ( not ( = ?auto_197963 ?auto_197964 ) ) ( not ( = ?auto_197967 ?auto_197964 ) ) ( not ( = ?auto_197966 ?auto_197964 ) ) ( ON ?auto_197960 ?auto_197959 ) ( ON-TABLE ?auto_197964 ) ( ON ?auto_197962 ?auto_197960 ) ( ON ?auto_197966 ?auto_197962 ) ( ON ?auto_197967 ?auto_197966 ) ( ON ?auto_197963 ?auto_197967 ) ( CLEAR ?auto_197965 ) ( ON ?auto_197961 ?auto_197963 ) ( CLEAR ?auto_197961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_197964 ?auto_197959 ?auto_197960 ?auto_197962 ?auto_197966 ?auto_197967 ?auto_197963 )
      ( MAKE-2PILE ?auto_197959 ?auto_197960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197968 - BLOCK
      ?auto_197969 - BLOCK
    )
    :vars
    (
      ?auto_197976 - BLOCK
      ?auto_197973 - BLOCK
      ?auto_197972 - BLOCK
      ?auto_197974 - BLOCK
      ?auto_197975 - BLOCK
      ?auto_197971 - BLOCK
      ?auto_197970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197968 ?auto_197969 ) ) ( not ( = ?auto_197968 ?auto_197976 ) ) ( not ( = ?auto_197969 ?auto_197976 ) ) ( not ( = ?auto_197973 ?auto_197972 ) ) ( not ( = ?auto_197973 ?auto_197974 ) ) ( not ( = ?auto_197973 ?auto_197975 ) ) ( not ( = ?auto_197973 ?auto_197971 ) ) ( not ( = ?auto_197973 ?auto_197976 ) ) ( not ( = ?auto_197973 ?auto_197969 ) ) ( not ( = ?auto_197973 ?auto_197968 ) ) ( not ( = ?auto_197972 ?auto_197974 ) ) ( not ( = ?auto_197972 ?auto_197975 ) ) ( not ( = ?auto_197972 ?auto_197971 ) ) ( not ( = ?auto_197972 ?auto_197976 ) ) ( not ( = ?auto_197972 ?auto_197969 ) ) ( not ( = ?auto_197972 ?auto_197968 ) ) ( not ( = ?auto_197974 ?auto_197975 ) ) ( not ( = ?auto_197974 ?auto_197971 ) ) ( not ( = ?auto_197974 ?auto_197976 ) ) ( not ( = ?auto_197974 ?auto_197969 ) ) ( not ( = ?auto_197974 ?auto_197968 ) ) ( not ( = ?auto_197975 ?auto_197971 ) ) ( not ( = ?auto_197975 ?auto_197976 ) ) ( not ( = ?auto_197975 ?auto_197969 ) ) ( not ( = ?auto_197975 ?auto_197968 ) ) ( not ( = ?auto_197971 ?auto_197976 ) ) ( not ( = ?auto_197971 ?auto_197969 ) ) ( not ( = ?auto_197971 ?auto_197968 ) ) ( ON ?auto_197968 ?auto_197970 ) ( not ( = ?auto_197968 ?auto_197970 ) ) ( not ( = ?auto_197969 ?auto_197970 ) ) ( not ( = ?auto_197976 ?auto_197970 ) ) ( not ( = ?auto_197973 ?auto_197970 ) ) ( not ( = ?auto_197972 ?auto_197970 ) ) ( not ( = ?auto_197974 ?auto_197970 ) ) ( not ( = ?auto_197975 ?auto_197970 ) ) ( not ( = ?auto_197971 ?auto_197970 ) ) ( ON ?auto_197969 ?auto_197968 ) ( ON-TABLE ?auto_197970 ) ( ON ?auto_197976 ?auto_197969 ) ( ON ?auto_197971 ?auto_197976 ) ( ON ?auto_197975 ?auto_197971 ) ( ON ?auto_197974 ?auto_197975 ) ( ON ?auto_197972 ?auto_197974 ) ( CLEAR ?auto_197972 ) ( HOLDING ?auto_197973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_197973 )
      ( MAKE-2PILE ?auto_197968 ?auto_197969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_197977 - BLOCK
      ?auto_197978 - BLOCK
    )
    :vars
    (
      ?auto_197979 - BLOCK
      ?auto_197980 - BLOCK
      ?auto_197982 - BLOCK
      ?auto_197983 - BLOCK
      ?auto_197985 - BLOCK
      ?auto_197984 - BLOCK
      ?auto_197981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_197977 ?auto_197978 ) ) ( not ( = ?auto_197977 ?auto_197979 ) ) ( not ( = ?auto_197978 ?auto_197979 ) ) ( not ( = ?auto_197980 ?auto_197982 ) ) ( not ( = ?auto_197980 ?auto_197983 ) ) ( not ( = ?auto_197980 ?auto_197985 ) ) ( not ( = ?auto_197980 ?auto_197984 ) ) ( not ( = ?auto_197980 ?auto_197979 ) ) ( not ( = ?auto_197980 ?auto_197978 ) ) ( not ( = ?auto_197980 ?auto_197977 ) ) ( not ( = ?auto_197982 ?auto_197983 ) ) ( not ( = ?auto_197982 ?auto_197985 ) ) ( not ( = ?auto_197982 ?auto_197984 ) ) ( not ( = ?auto_197982 ?auto_197979 ) ) ( not ( = ?auto_197982 ?auto_197978 ) ) ( not ( = ?auto_197982 ?auto_197977 ) ) ( not ( = ?auto_197983 ?auto_197985 ) ) ( not ( = ?auto_197983 ?auto_197984 ) ) ( not ( = ?auto_197983 ?auto_197979 ) ) ( not ( = ?auto_197983 ?auto_197978 ) ) ( not ( = ?auto_197983 ?auto_197977 ) ) ( not ( = ?auto_197985 ?auto_197984 ) ) ( not ( = ?auto_197985 ?auto_197979 ) ) ( not ( = ?auto_197985 ?auto_197978 ) ) ( not ( = ?auto_197985 ?auto_197977 ) ) ( not ( = ?auto_197984 ?auto_197979 ) ) ( not ( = ?auto_197984 ?auto_197978 ) ) ( not ( = ?auto_197984 ?auto_197977 ) ) ( ON ?auto_197977 ?auto_197981 ) ( not ( = ?auto_197977 ?auto_197981 ) ) ( not ( = ?auto_197978 ?auto_197981 ) ) ( not ( = ?auto_197979 ?auto_197981 ) ) ( not ( = ?auto_197980 ?auto_197981 ) ) ( not ( = ?auto_197982 ?auto_197981 ) ) ( not ( = ?auto_197983 ?auto_197981 ) ) ( not ( = ?auto_197985 ?auto_197981 ) ) ( not ( = ?auto_197984 ?auto_197981 ) ) ( ON ?auto_197978 ?auto_197977 ) ( ON-TABLE ?auto_197981 ) ( ON ?auto_197979 ?auto_197978 ) ( ON ?auto_197984 ?auto_197979 ) ( ON ?auto_197985 ?auto_197984 ) ( ON ?auto_197983 ?auto_197985 ) ( ON ?auto_197982 ?auto_197983 ) ( ON ?auto_197980 ?auto_197982 ) ( CLEAR ?auto_197980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_197981 ?auto_197977 ?auto_197978 ?auto_197979 ?auto_197984 ?auto_197985 ?auto_197983 ?auto_197982 )
      ( MAKE-2PILE ?auto_197977 ?auto_197978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197991 - BLOCK
      ?auto_197992 - BLOCK
      ?auto_197993 - BLOCK
      ?auto_197994 - BLOCK
      ?auto_197995 - BLOCK
    )
    :vars
    (
      ?auto_197996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_197996 ?auto_197995 ) ( CLEAR ?auto_197996 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_197991 ) ( ON ?auto_197992 ?auto_197991 ) ( ON ?auto_197993 ?auto_197992 ) ( ON ?auto_197994 ?auto_197993 ) ( ON ?auto_197995 ?auto_197994 ) ( not ( = ?auto_197991 ?auto_197992 ) ) ( not ( = ?auto_197991 ?auto_197993 ) ) ( not ( = ?auto_197991 ?auto_197994 ) ) ( not ( = ?auto_197991 ?auto_197995 ) ) ( not ( = ?auto_197991 ?auto_197996 ) ) ( not ( = ?auto_197992 ?auto_197993 ) ) ( not ( = ?auto_197992 ?auto_197994 ) ) ( not ( = ?auto_197992 ?auto_197995 ) ) ( not ( = ?auto_197992 ?auto_197996 ) ) ( not ( = ?auto_197993 ?auto_197994 ) ) ( not ( = ?auto_197993 ?auto_197995 ) ) ( not ( = ?auto_197993 ?auto_197996 ) ) ( not ( = ?auto_197994 ?auto_197995 ) ) ( not ( = ?auto_197994 ?auto_197996 ) ) ( not ( = ?auto_197995 ?auto_197996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_197996 ?auto_197995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_197997 - BLOCK
      ?auto_197998 - BLOCK
      ?auto_197999 - BLOCK
      ?auto_198000 - BLOCK
      ?auto_198001 - BLOCK
    )
    :vars
    (
      ?auto_198002 - BLOCK
      ?auto_198003 - BLOCK
      ?auto_198004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198002 ?auto_198001 ) ( CLEAR ?auto_198002 ) ( ON-TABLE ?auto_197997 ) ( ON ?auto_197998 ?auto_197997 ) ( ON ?auto_197999 ?auto_197998 ) ( ON ?auto_198000 ?auto_197999 ) ( ON ?auto_198001 ?auto_198000 ) ( not ( = ?auto_197997 ?auto_197998 ) ) ( not ( = ?auto_197997 ?auto_197999 ) ) ( not ( = ?auto_197997 ?auto_198000 ) ) ( not ( = ?auto_197997 ?auto_198001 ) ) ( not ( = ?auto_197997 ?auto_198002 ) ) ( not ( = ?auto_197998 ?auto_197999 ) ) ( not ( = ?auto_197998 ?auto_198000 ) ) ( not ( = ?auto_197998 ?auto_198001 ) ) ( not ( = ?auto_197998 ?auto_198002 ) ) ( not ( = ?auto_197999 ?auto_198000 ) ) ( not ( = ?auto_197999 ?auto_198001 ) ) ( not ( = ?auto_197999 ?auto_198002 ) ) ( not ( = ?auto_198000 ?auto_198001 ) ) ( not ( = ?auto_198000 ?auto_198002 ) ) ( not ( = ?auto_198001 ?auto_198002 ) ) ( HOLDING ?auto_198003 ) ( CLEAR ?auto_198004 ) ( not ( = ?auto_197997 ?auto_198003 ) ) ( not ( = ?auto_197997 ?auto_198004 ) ) ( not ( = ?auto_197998 ?auto_198003 ) ) ( not ( = ?auto_197998 ?auto_198004 ) ) ( not ( = ?auto_197999 ?auto_198003 ) ) ( not ( = ?auto_197999 ?auto_198004 ) ) ( not ( = ?auto_198000 ?auto_198003 ) ) ( not ( = ?auto_198000 ?auto_198004 ) ) ( not ( = ?auto_198001 ?auto_198003 ) ) ( not ( = ?auto_198001 ?auto_198004 ) ) ( not ( = ?auto_198002 ?auto_198003 ) ) ( not ( = ?auto_198002 ?auto_198004 ) ) ( not ( = ?auto_198003 ?auto_198004 ) ) )
    :subtasks
    ( ( !STACK ?auto_198003 ?auto_198004 )
      ( MAKE-5PILE ?auto_197997 ?auto_197998 ?auto_197999 ?auto_198000 ?auto_198001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198005 - BLOCK
      ?auto_198006 - BLOCK
      ?auto_198007 - BLOCK
      ?auto_198008 - BLOCK
      ?auto_198009 - BLOCK
    )
    :vars
    (
      ?auto_198012 - BLOCK
      ?auto_198010 - BLOCK
      ?auto_198011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198012 ?auto_198009 ) ( ON-TABLE ?auto_198005 ) ( ON ?auto_198006 ?auto_198005 ) ( ON ?auto_198007 ?auto_198006 ) ( ON ?auto_198008 ?auto_198007 ) ( ON ?auto_198009 ?auto_198008 ) ( not ( = ?auto_198005 ?auto_198006 ) ) ( not ( = ?auto_198005 ?auto_198007 ) ) ( not ( = ?auto_198005 ?auto_198008 ) ) ( not ( = ?auto_198005 ?auto_198009 ) ) ( not ( = ?auto_198005 ?auto_198012 ) ) ( not ( = ?auto_198006 ?auto_198007 ) ) ( not ( = ?auto_198006 ?auto_198008 ) ) ( not ( = ?auto_198006 ?auto_198009 ) ) ( not ( = ?auto_198006 ?auto_198012 ) ) ( not ( = ?auto_198007 ?auto_198008 ) ) ( not ( = ?auto_198007 ?auto_198009 ) ) ( not ( = ?auto_198007 ?auto_198012 ) ) ( not ( = ?auto_198008 ?auto_198009 ) ) ( not ( = ?auto_198008 ?auto_198012 ) ) ( not ( = ?auto_198009 ?auto_198012 ) ) ( CLEAR ?auto_198010 ) ( not ( = ?auto_198005 ?auto_198011 ) ) ( not ( = ?auto_198005 ?auto_198010 ) ) ( not ( = ?auto_198006 ?auto_198011 ) ) ( not ( = ?auto_198006 ?auto_198010 ) ) ( not ( = ?auto_198007 ?auto_198011 ) ) ( not ( = ?auto_198007 ?auto_198010 ) ) ( not ( = ?auto_198008 ?auto_198011 ) ) ( not ( = ?auto_198008 ?auto_198010 ) ) ( not ( = ?auto_198009 ?auto_198011 ) ) ( not ( = ?auto_198009 ?auto_198010 ) ) ( not ( = ?auto_198012 ?auto_198011 ) ) ( not ( = ?auto_198012 ?auto_198010 ) ) ( not ( = ?auto_198011 ?auto_198010 ) ) ( ON ?auto_198011 ?auto_198012 ) ( CLEAR ?auto_198011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198005 ?auto_198006 ?auto_198007 ?auto_198008 ?auto_198009 ?auto_198012 )
      ( MAKE-5PILE ?auto_198005 ?auto_198006 ?auto_198007 ?auto_198008 ?auto_198009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198013 - BLOCK
      ?auto_198014 - BLOCK
      ?auto_198015 - BLOCK
      ?auto_198016 - BLOCK
      ?auto_198017 - BLOCK
    )
    :vars
    (
      ?auto_198020 - BLOCK
      ?auto_198018 - BLOCK
      ?auto_198019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198020 ?auto_198017 ) ( ON-TABLE ?auto_198013 ) ( ON ?auto_198014 ?auto_198013 ) ( ON ?auto_198015 ?auto_198014 ) ( ON ?auto_198016 ?auto_198015 ) ( ON ?auto_198017 ?auto_198016 ) ( not ( = ?auto_198013 ?auto_198014 ) ) ( not ( = ?auto_198013 ?auto_198015 ) ) ( not ( = ?auto_198013 ?auto_198016 ) ) ( not ( = ?auto_198013 ?auto_198017 ) ) ( not ( = ?auto_198013 ?auto_198020 ) ) ( not ( = ?auto_198014 ?auto_198015 ) ) ( not ( = ?auto_198014 ?auto_198016 ) ) ( not ( = ?auto_198014 ?auto_198017 ) ) ( not ( = ?auto_198014 ?auto_198020 ) ) ( not ( = ?auto_198015 ?auto_198016 ) ) ( not ( = ?auto_198015 ?auto_198017 ) ) ( not ( = ?auto_198015 ?auto_198020 ) ) ( not ( = ?auto_198016 ?auto_198017 ) ) ( not ( = ?auto_198016 ?auto_198020 ) ) ( not ( = ?auto_198017 ?auto_198020 ) ) ( not ( = ?auto_198013 ?auto_198018 ) ) ( not ( = ?auto_198013 ?auto_198019 ) ) ( not ( = ?auto_198014 ?auto_198018 ) ) ( not ( = ?auto_198014 ?auto_198019 ) ) ( not ( = ?auto_198015 ?auto_198018 ) ) ( not ( = ?auto_198015 ?auto_198019 ) ) ( not ( = ?auto_198016 ?auto_198018 ) ) ( not ( = ?auto_198016 ?auto_198019 ) ) ( not ( = ?auto_198017 ?auto_198018 ) ) ( not ( = ?auto_198017 ?auto_198019 ) ) ( not ( = ?auto_198020 ?auto_198018 ) ) ( not ( = ?auto_198020 ?auto_198019 ) ) ( not ( = ?auto_198018 ?auto_198019 ) ) ( ON ?auto_198018 ?auto_198020 ) ( CLEAR ?auto_198018 ) ( HOLDING ?auto_198019 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198019 )
      ( MAKE-5PILE ?auto_198013 ?auto_198014 ?auto_198015 ?auto_198016 ?auto_198017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198021 - BLOCK
      ?auto_198022 - BLOCK
      ?auto_198023 - BLOCK
      ?auto_198024 - BLOCK
      ?auto_198025 - BLOCK
    )
    :vars
    (
      ?auto_198028 - BLOCK
      ?auto_198026 - BLOCK
      ?auto_198027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198028 ?auto_198025 ) ( ON-TABLE ?auto_198021 ) ( ON ?auto_198022 ?auto_198021 ) ( ON ?auto_198023 ?auto_198022 ) ( ON ?auto_198024 ?auto_198023 ) ( ON ?auto_198025 ?auto_198024 ) ( not ( = ?auto_198021 ?auto_198022 ) ) ( not ( = ?auto_198021 ?auto_198023 ) ) ( not ( = ?auto_198021 ?auto_198024 ) ) ( not ( = ?auto_198021 ?auto_198025 ) ) ( not ( = ?auto_198021 ?auto_198028 ) ) ( not ( = ?auto_198022 ?auto_198023 ) ) ( not ( = ?auto_198022 ?auto_198024 ) ) ( not ( = ?auto_198022 ?auto_198025 ) ) ( not ( = ?auto_198022 ?auto_198028 ) ) ( not ( = ?auto_198023 ?auto_198024 ) ) ( not ( = ?auto_198023 ?auto_198025 ) ) ( not ( = ?auto_198023 ?auto_198028 ) ) ( not ( = ?auto_198024 ?auto_198025 ) ) ( not ( = ?auto_198024 ?auto_198028 ) ) ( not ( = ?auto_198025 ?auto_198028 ) ) ( not ( = ?auto_198021 ?auto_198026 ) ) ( not ( = ?auto_198021 ?auto_198027 ) ) ( not ( = ?auto_198022 ?auto_198026 ) ) ( not ( = ?auto_198022 ?auto_198027 ) ) ( not ( = ?auto_198023 ?auto_198026 ) ) ( not ( = ?auto_198023 ?auto_198027 ) ) ( not ( = ?auto_198024 ?auto_198026 ) ) ( not ( = ?auto_198024 ?auto_198027 ) ) ( not ( = ?auto_198025 ?auto_198026 ) ) ( not ( = ?auto_198025 ?auto_198027 ) ) ( not ( = ?auto_198028 ?auto_198026 ) ) ( not ( = ?auto_198028 ?auto_198027 ) ) ( not ( = ?auto_198026 ?auto_198027 ) ) ( ON ?auto_198026 ?auto_198028 ) ( ON ?auto_198027 ?auto_198026 ) ( CLEAR ?auto_198027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198021 ?auto_198022 ?auto_198023 ?auto_198024 ?auto_198025 ?auto_198028 ?auto_198026 )
      ( MAKE-5PILE ?auto_198021 ?auto_198022 ?auto_198023 ?auto_198024 ?auto_198025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198029 - BLOCK
      ?auto_198030 - BLOCK
      ?auto_198031 - BLOCK
      ?auto_198032 - BLOCK
      ?auto_198033 - BLOCK
    )
    :vars
    (
      ?auto_198036 - BLOCK
      ?auto_198034 - BLOCK
      ?auto_198035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198036 ?auto_198033 ) ( ON-TABLE ?auto_198029 ) ( ON ?auto_198030 ?auto_198029 ) ( ON ?auto_198031 ?auto_198030 ) ( ON ?auto_198032 ?auto_198031 ) ( ON ?auto_198033 ?auto_198032 ) ( not ( = ?auto_198029 ?auto_198030 ) ) ( not ( = ?auto_198029 ?auto_198031 ) ) ( not ( = ?auto_198029 ?auto_198032 ) ) ( not ( = ?auto_198029 ?auto_198033 ) ) ( not ( = ?auto_198029 ?auto_198036 ) ) ( not ( = ?auto_198030 ?auto_198031 ) ) ( not ( = ?auto_198030 ?auto_198032 ) ) ( not ( = ?auto_198030 ?auto_198033 ) ) ( not ( = ?auto_198030 ?auto_198036 ) ) ( not ( = ?auto_198031 ?auto_198032 ) ) ( not ( = ?auto_198031 ?auto_198033 ) ) ( not ( = ?auto_198031 ?auto_198036 ) ) ( not ( = ?auto_198032 ?auto_198033 ) ) ( not ( = ?auto_198032 ?auto_198036 ) ) ( not ( = ?auto_198033 ?auto_198036 ) ) ( not ( = ?auto_198029 ?auto_198034 ) ) ( not ( = ?auto_198029 ?auto_198035 ) ) ( not ( = ?auto_198030 ?auto_198034 ) ) ( not ( = ?auto_198030 ?auto_198035 ) ) ( not ( = ?auto_198031 ?auto_198034 ) ) ( not ( = ?auto_198031 ?auto_198035 ) ) ( not ( = ?auto_198032 ?auto_198034 ) ) ( not ( = ?auto_198032 ?auto_198035 ) ) ( not ( = ?auto_198033 ?auto_198034 ) ) ( not ( = ?auto_198033 ?auto_198035 ) ) ( not ( = ?auto_198036 ?auto_198034 ) ) ( not ( = ?auto_198036 ?auto_198035 ) ) ( not ( = ?auto_198034 ?auto_198035 ) ) ( ON ?auto_198034 ?auto_198036 ) ( HOLDING ?auto_198035 ) ( CLEAR ?auto_198034 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198029 ?auto_198030 ?auto_198031 ?auto_198032 ?auto_198033 ?auto_198036 ?auto_198034 ?auto_198035 )
      ( MAKE-5PILE ?auto_198029 ?auto_198030 ?auto_198031 ?auto_198032 ?auto_198033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198037 - BLOCK
      ?auto_198038 - BLOCK
      ?auto_198039 - BLOCK
      ?auto_198040 - BLOCK
      ?auto_198041 - BLOCK
    )
    :vars
    (
      ?auto_198044 - BLOCK
      ?auto_198042 - BLOCK
      ?auto_198043 - BLOCK
      ?auto_198045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198044 ?auto_198041 ) ( ON-TABLE ?auto_198037 ) ( ON ?auto_198038 ?auto_198037 ) ( ON ?auto_198039 ?auto_198038 ) ( ON ?auto_198040 ?auto_198039 ) ( ON ?auto_198041 ?auto_198040 ) ( not ( = ?auto_198037 ?auto_198038 ) ) ( not ( = ?auto_198037 ?auto_198039 ) ) ( not ( = ?auto_198037 ?auto_198040 ) ) ( not ( = ?auto_198037 ?auto_198041 ) ) ( not ( = ?auto_198037 ?auto_198044 ) ) ( not ( = ?auto_198038 ?auto_198039 ) ) ( not ( = ?auto_198038 ?auto_198040 ) ) ( not ( = ?auto_198038 ?auto_198041 ) ) ( not ( = ?auto_198038 ?auto_198044 ) ) ( not ( = ?auto_198039 ?auto_198040 ) ) ( not ( = ?auto_198039 ?auto_198041 ) ) ( not ( = ?auto_198039 ?auto_198044 ) ) ( not ( = ?auto_198040 ?auto_198041 ) ) ( not ( = ?auto_198040 ?auto_198044 ) ) ( not ( = ?auto_198041 ?auto_198044 ) ) ( not ( = ?auto_198037 ?auto_198042 ) ) ( not ( = ?auto_198037 ?auto_198043 ) ) ( not ( = ?auto_198038 ?auto_198042 ) ) ( not ( = ?auto_198038 ?auto_198043 ) ) ( not ( = ?auto_198039 ?auto_198042 ) ) ( not ( = ?auto_198039 ?auto_198043 ) ) ( not ( = ?auto_198040 ?auto_198042 ) ) ( not ( = ?auto_198040 ?auto_198043 ) ) ( not ( = ?auto_198041 ?auto_198042 ) ) ( not ( = ?auto_198041 ?auto_198043 ) ) ( not ( = ?auto_198044 ?auto_198042 ) ) ( not ( = ?auto_198044 ?auto_198043 ) ) ( not ( = ?auto_198042 ?auto_198043 ) ) ( ON ?auto_198042 ?auto_198044 ) ( CLEAR ?auto_198042 ) ( ON ?auto_198043 ?auto_198045 ) ( CLEAR ?auto_198043 ) ( HAND-EMPTY ) ( not ( = ?auto_198037 ?auto_198045 ) ) ( not ( = ?auto_198038 ?auto_198045 ) ) ( not ( = ?auto_198039 ?auto_198045 ) ) ( not ( = ?auto_198040 ?auto_198045 ) ) ( not ( = ?auto_198041 ?auto_198045 ) ) ( not ( = ?auto_198044 ?auto_198045 ) ) ( not ( = ?auto_198042 ?auto_198045 ) ) ( not ( = ?auto_198043 ?auto_198045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198043 ?auto_198045 )
      ( MAKE-5PILE ?auto_198037 ?auto_198038 ?auto_198039 ?auto_198040 ?auto_198041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198046 - BLOCK
      ?auto_198047 - BLOCK
      ?auto_198048 - BLOCK
      ?auto_198049 - BLOCK
      ?auto_198050 - BLOCK
    )
    :vars
    (
      ?auto_198053 - BLOCK
      ?auto_198052 - BLOCK
      ?auto_198054 - BLOCK
      ?auto_198051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198053 ?auto_198050 ) ( ON-TABLE ?auto_198046 ) ( ON ?auto_198047 ?auto_198046 ) ( ON ?auto_198048 ?auto_198047 ) ( ON ?auto_198049 ?auto_198048 ) ( ON ?auto_198050 ?auto_198049 ) ( not ( = ?auto_198046 ?auto_198047 ) ) ( not ( = ?auto_198046 ?auto_198048 ) ) ( not ( = ?auto_198046 ?auto_198049 ) ) ( not ( = ?auto_198046 ?auto_198050 ) ) ( not ( = ?auto_198046 ?auto_198053 ) ) ( not ( = ?auto_198047 ?auto_198048 ) ) ( not ( = ?auto_198047 ?auto_198049 ) ) ( not ( = ?auto_198047 ?auto_198050 ) ) ( not ( = ?auto_198047 ?auto_198053 ) ) ( not ( = ?auto_198048 ?auto_198049 ) ) ( not ( = ?auto_198048 ?auto_198050 ) ) ( not ( = ?auto_198048 ?auto_198053 ) ) ( not ( = ?auto_198049 ?auto_198050 ) ) ( not ( = ?auto_198049 ?auto_198053 ) ) ( not ( = ?auto_198050 ?auto_198053 ) ) ( not ( = ?auto_198046 ?auto_198052 ) ) ( not ( = ?auto_198046 ?auto_198054 ) ) ( not ( = ?auto_198047 ?auto_198052 ) ) ( not ( = ?auto_198047 ?auto_198054 ) ) ( not ( = ?auto_198048 ?auto_198052 ) ) ( not ( = ?auto_198048 ?auto_198054 ) ) ( not ( = ?auto_198049 ?auto_198052 ) ) ( not ( = ?auto_198049 ?auto_198054 ) ) ( not ( = ?auto_198050 ?auto_198052 ) ) ( not ( = ?auto_198050 ?auto_198054 ) ) ( not ( = ?auto_198053 ?auto_198052 ) ) ( not ( = ?auto_198053 ?auto_198054 ) ) ( not ( = ?auto_198052 ?auto_198054 ) ) ( ON ?auto_198054 ?auto_198051 ) ( CLEAR ?auto_198054 ) ( not ( = ?auto_198046 ?auto_198051 ) ) ( not ( = ?auto_198047 ?auto_198051 ) ) ( not ( = ?auto_198048 ?auto_198051 ) ) ( not ( = ?auto_198049 ?auto_198051 ) ) ( not ( = ?auto_198050 ?auto_198051 ) ) ( not ( = ?auto_198053 ?auto_198051 ) ) ( not ( = ?auto_198052 ?auto_198051 ) ) ( not ( = ?auto_198054 ?auto_198051 ) ) ( HOLDING ?auto_198052 ) ( CLEAR ?auto_198053 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198046 ?auto_198047 ?auto_198048 ?auto_198049 ?auto_198050 ?auto_198053 ?auto_198052 )
      ( MAKE-5PILE ?auto_198046 ?auto_198047 ?auto_198048 ?auto_198049 ?auto_198050 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198055 - BLOCK
      ?auto_198056 - BLOCK
      ?auto_198057 - BLOCK
      ?auto_198058 - BLOCK
      ?auto_198059 - BLOCK
    )
    :vars
    (
      ?auto_198061 - BLOCK
      ?auto_198062 - BLOCK
      ?auto_198060 - BLOCK
      ?auto_198063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198061 ?auto_198059 ) ( ON-TABLE ?auto_198055 ) ( ON ?auto_198056 ?auto_198055 ) ( ON ?auto_198057 ?auto_198056 ) ( ON ?auto_198058 ?auto_198057 ) ( ON ?auto_198059 ?auto_198058 ) ( not ( = ?auto_198055 ?auto_198056 ) ) ( not ( = ?auto_198055 ?auto_198057 ) ) ( not ( = ?auto_198055 ?auto_198058 ) ) ( not ( = ?auto_198055 ?auto_198059 ) ) ( not ( = ?auto_198055 ?auto_198061 ) ) ( not ( = ?auto_198056 ?auto_198057 ) ) ( not ( = ?auto_198056 ?auto_198058 ) ) ( not ( = ?auto_198056 ?auto_198059 ) ) ( not ( = ?auto_198056 ?auto_198061 ) ) ( not ( = ?auto_198057 ?auto_198058 ) ) ( not ( = ?auto_198057 ?auto_198059 ) ) ( not ( = ?auto_198057 ?auto_198061 ) ) ( not ( = ?auto_198058 ?auto_198059 ) ) ( not ( = ?auto_198058 ?auto_198061 ) ) ( not ( = ?auto_198059 ?auto_198061 ) ) ( not ( = ?auto_198055 ?auto_198062 ) ) ( not ( = ?auto_198055 ?auto_198060 ) ) ( not ( = ?auto_198056 ?auto_198062 ) ) ( not ( = ?auto_198056 ?auto_198060 ) ) ( not ( = ?auto_198057 ?auto_198062 ) ) ( not ( = ?auto_198057 ?auto_198060 ) ) ( not ( = ?auto_198058 ?auto_198062 ) ) ( not ( = ?auto_198058 ?auto_198060 ) ) ( not ( = ?auto_198059 ?auto_198062 ) ) ( not ( = ?auto_198059 ?auto_198060 ) ) ( not ( = ?auto_198061 ?auto_198062 ) ) ( not ( = ?auto_198061 ?auto_198060 ) ) ( not ( = ?auto_198062 ?auto_198060 ) ) ( ON ?auto_198060 ?auto_198063 ) ( not ( = ?auto_198055 ?auto_198063 ) ) ( not ( = ?auto_198056 ?auto_198063 ) ) ( not ( = ?auto_198057 ?auto_198063 ) ) ( not ( = ?auto_198058 ?auto_198063 ) ) ( not ( = ?auto_198059 ?auto_198063 ) ) ( not ( = ?auto_198061 ?auto_198063 ) ) ( not ( = ?auto_198062 ?auto_198063 ) ) ( not ( = ?auto_198060 ?auto_198063 ) ) ( CLEAR ?auto_198061 ) ( ON ?auto_198062 ?auto_198060 ) ( CLEAR ?auto_198062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198063 ?auto_198060 )
      ( MAKE-5PILE ?auto_198055 ?auto_198056 ?auto_198057 ?auto_198058 ?auto_198059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198082 - BLOCK
      ?auto_198083 - BLOCK
      ?auto_198084 - BLOCK
      ?auto_198085 - BLOCK
      ?auto_198086 - BLOCK
    )
    :vars
    (
      ?auto_198089 - BLOCK
      ?auto_198088 - BLOCK
      ?auto_198090 - BLOCK
      ?auto_198087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198082 ) ( ON ?auto_198083 ?auto_198082 ) ( ON ?auto_198084 ?auto_198083 ) ( ON ?auto_198085 ?auto_198084 ) ( not ( = ?auto_198082 ?auto_198083 ) ) ( not ( = ?auto_198082 ?auto_198084 ) ) ( not ( = ?auto_198082 ?auto_198085 ) ) ( not ( = ?auto_198082 ?auto_198086 ) ) ( not ( = ?auto_198082 ?auto_198089 ) ) ( not ( = ?auto_198083 ?auto_198084 ) ) ( not ( = ?auto_198083 ?auto_198085 ) ) ( not ( = ?auto_198083 ?auto_198086 ) ) ( not ( = ?auto_198083 ?auto_198089 ) ) ( not ( = ?auto_198084 ?auto_198085 ) ) ( not ( = ?auto_198084 ?auto_198086 ) ) ( not ( = ?auto_198084 ?auto_198089 ) ) ( not ( = ?auto_198085 ?auto_198086 ) ) ( not ( = ?auto_198085 ?auto_198089 ) ) ( not ( = ?auto_198086 ?auto_198089 ) ) ( not ( = ?auto_198082 ?auto_198088 ) ) ( not ( = ?auto_198082 ?auto_198090 ) ) ( not ( = ?auto_198083 ?auto_198088 ) ) ( not ( = ?auto_198083 ?auto_198090 ) ) ( not ( = ?auto_198084 ?auto_198088 ) ) ( not ( = ?auto_198084 ?auto_198090 ) ) ( not ( = ?auto_198085 ?auto_198088 ) ) ( not ( = ?auto_198085 ?auto_198090 ) ) ( not ( = ?auto_198086 ?auto_198088 ) ) ( not ( = ?auto_198086 ?auto_198090 ) ) ( not ( = ?auto_198089 ?auto_198088 ) ) ( not ( = ?auto_198089 ?auto_198090 ) ) ( not ( = ?auto_198088 ?auto_198090 ) ) ( ON ?auto_198090 ?auto_198087 ) ( not ( = ?auto_198082 ?auto_198087 ) ) ( not ( = ?auto_198083 ?auto_198087 ) ) ( not ( = ?auto_198084 ?auto_198087 ) ) ( not ( = ?auto_198085 ?auto_198087 ) ) ( not ( = ?auto_198086 ?auto_198087 ) ) ( not ( = ?auto_198089 ?auto_198087 ) ) ( not ( = ?auto_198088 ?auto_198087 ) ) ( not ( = ?auto_198090 ?auto_198087 ) ) ( ON ?auto_198088 ?auto_198090 ) ( ON-TABLE ?auto_198087 ) ( ON ?auto_198089 ?auto_198088 ) ( CLEAR ?auto_198089 ) ( HOLDING ?auto_198086 ) ( CLEAR ?auto_198085 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198082 ?auto_198083 ?auto_198084 ?auto_198085 ?auto_198086 ?auto_198089 )
      ( MAKE-5PILE ?auto_198082 ?auto_198083 ?auto_198084 ?auto_198085 ?auto_198086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198091 - BLOCK
      ?auto_198092 - BLOCK
      ?auto_198093 - BLOCK
      ?auto_198094 - BLOCK
      ?auto_198095 - BLOCK
    )
    :vars
    (
      ?auto_198097 - BLOCK
      ?auto_198096 - BLOCK
      ?auto_198099 - BLOCK
      ?auto_198098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198091 ) ( ON ?auto_198092 ?auto_198091 ) ( ON ?auto_198093 ?auto_198092 ) ( ON ?auto_198094 ?auto_198093 ) ( not ( = ?auto_198091 ?auto_198092 ) ) ( not ( = ?auto_198091 ?auto_198093 ) ) ( not ( = ?auto_198091 ?auto_198094 ) ) ( not ( = ?auto_198091 ?auto_198095 ) ) ( not ( = ?auto_198091 ?auto_198097 ) ) ( not ( = ?auto_198092 ?auto_198093 ) ) ( not ( = ?auto_198092 ?auto_198094 ) ) ( not ( = ?auto_198092 ?auto_198095 ) ) ( not ( = ?auto_198092 ?auto_198097 ) ) ( not ( = ?auto_198093 ?auto_198094 ) ) ( not ( = ?auto_198093 ?auto_198095 ) ) ( not ( = ?auto_198093 ?auto_198097 ) ) ( not ( = ?auto_198094 ?auto_198095 ) ) ( not ( = ?auto_198094 ?auto_198097 ) ) ( not ( = ?auto_198095 ?auto_198097 ) ) ( not ( = ?auto_198091 ?auto_198096 ) ) ( not ( = ?auto_198091 ?auto_198099 ) ) ( not ( = ?auto_198092 ?auto_198096 ) ) ( not ( = ?auto_198092 ?auto_198099 ) ) ( not ( = ?auto_198093 ?auto_198096 ) ) ( not ( = ?auto_198093 ?auto_198099 ) ) ( not ( = ?auto_198094 ?auto_198096 ) ) ( not ( = ?auto_198094 ?auto_198099 ) ) ( not ( = ?auto_198095 ?auto_198096 ) ) ( not ( = ?auto_198095 ?auto_198099 ) ) ( not ( = ?auto_198097 ?auto_198096 ) ) ( not ( = ?auto_198097 ?auto_198099 ) ) ( not ( = ?auto_198096 ?auto_198099 ) ) ( ON ?auto_198099 ?auto_198098 ) ( not ( = ?auto_198091 ?auto_198098 ) ) ( not ( = ?auto_198092 ?auto_198098 ) ) ( not ( = ?auto_198093 ?auto_198098 ) ) ( not ( = ?auto_198094 ?auto_198098 ) ) ( not ( = ?auto_198095 ?auto_198098 ) ) ( not ( = ?auto_198097 ?auto_198098 ) ) ( not ( = ?auto_198096 ?auto_198098 ) ) ( not ( = ?auto_198099 ?auto_198098 ) ) ( ON ?auto_198096 ?auto_198099 ) ( ON-TABLE ?auto_198098 ) ( ON ?auto_198097 ?auto_198096 ) ( CLEAR ?auto_198094 ) ( ON ?auto_198095 ?auto_198097 ) ( CLEAR ?auto_198095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198098 ?auto_198099 ?auto_198096 ?auto_198097 )
      ( MAKE-5PILE ?auto_198091 ?auto_198092 ?auto_198093 ?auto_198094 ?auto_198095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198100 - BLOCK
      ?auto_198101 - BLOCK
      ?auto_198102 - BLOCK
      ?auto_198103 - BLOCK
      ?auto_198104 - BLOCK
    )
    :vars
    (
      ?auto_198108 - BLOCK
      ?auto_198105 - BLOCK
      ?auto_198106 - BLOCK
      ?auto_198107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198100 ) ( ON ?auto_198101 ?auto_198100 ) ( ON ?auto_198102 ?auto_198101 ) ( not ( = ?auto_198100 ?auto_198101 ) ) ( not ( = ?auto_198100 ?auto_198102 ) ) ( not ( = ?auto_198100 ?auto_198103 ) ) ( not ( = ?auto_198100 ?auto_198104 ) ) ( not ( = ?auto_198100 ?auto_198108 ) ) ( not ( = ?auto_198101 ?auto_198102 ) ) ( not ( = ?auto_198101 ?auto_198103 ) ) ( not ( = ?auto_198101 ?auto_198104 ) ) ( not ( = ?auto_198101 ?auto_198108 ) ) ( not ( = ?auto_198102 ?auto_198103 ) ) ( not ( = ?auto_198102 ?auto_198104 ) ) ( not ( = ?auto_198102 ?auto_198108 ) ) ( not ( = ?auto_198103 ?auto_198104 ) ) ( not ( = ?auto_198103 ?auto_198108 ) ) ( not ( = ?auto_198104 ?auto_198108 ) ) ( not ( = ?auto_198100 ?auto_198105 ) ) ( not ( = ?auto_198100 ?auto_198106 ) ) ( not ( = ?auto_198101 ?auto_198105 ) ) ( not ( = ?auto_198101 ?auto_198106 ) ) ( not ( = ?auto_198102 ?auto_198105 ) ) ( not ( = ?auto_198102 ?auto_198106 ) ) ( not ( = ?auto_198103 ?auto_198105 ) ) ( not ( = ?auto_198103 ?auto_198106 ) ) ( not ( = ?auto_198104 ?auto_198105 ) ) ( not ( = ?auto_198104 ?auto_198106 ) ) ( not ( = ?auto_198108 ?auto_198105 ) ) ( not ( = ?auto_198108 ?auto_198106 ) ) ( not ( = ?auto_198105 ?auto_198106 ) ) ( ON ?auto_198106 ?auto_198107 ) ( not ( = ?auto_198100 ?auto_198107 ) ) ( not ( = ?auto_198101 ?auto_198107 ) ) ( not ( = ?auto_198102 ?auto_198107 ) ) ( not ( = ?auto_198103 ?auto_198107 ) ) ( not ( = ?auto_198104 ?auto_198107 ) ) ( not ( = ?auto_198108 ?auto_198107 ) ) ( not ( = ?auto_198105 ?auto_198107 ) ) ( not ( = ?auto_198106 ?auto_198107 ) ) ( ON ?auto_198105 ?auto_198106 ) ( ON-TABLE ?auto_198107 ) ( ON ?auto_198108 ?auto_198105 ) ( ON ?auto_198104 ?auto_198108 ) ( CLEAR ?auto_198104 ) ( HOLDING ?auto_198103 ) ( CLEAR ?auto_198102 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198100 ?auto_198101 ?auto_198102 ?auto_198103 )
      ( MAKE-5PILE ?auto_198100 ?auto_198101 ?auto_198102 ?auto_198103 ?auto_198104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198109 - BLOCK
      ?auto_198110 - BLOCK
      ?auto_198111 - BLOCK
      ?auto_198112 - BLOCK
      ?auto_198113 - BLOCK
    )
    :vars
    (
      ?auto_198117 - BLOCK
      ?auto_198115 - BLOCK
      ?auto_198116 - BLOCK
      ?auto_198114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198109 ) ( ON ?auto_198110 ?auto_198109 ) ( ON ?auto_198111 ?auto_198110 ) ( not ( = ?auto_198109 ?auto_198110 ) ) ( not ( = ?auto_198109 ?auto_198111 ) ) ( not ( = ?auto_198109 ?auto_198112 ) ) ( not ( = ?auto_198109 ?auto_198113 ) ) ( not ( = ?auto_198109 ?auto_198117 ) ) ( not ( = ?auto_198110 ?auto_198111 ) ) ( not ( = ?auto_198110 ?auto_198112 ) ) ( not ( = ?auto_198110 ?auto_198113 ) ) ( not ( = ?auto_198110 ?auto_198117 ) ) ( not ( = ?auto_198111 ?auto_198112 ) ) ( not ( = ?auto_198111 ?auto_198113 ) ) ( not ( = ?auto_198111 ?auto_198117 ) ) ( not ( = ?auto_198112 ?auto_198113 ) ) ( not ( = ?auto_198112 ?auto_198117 ) ) ( not ( = ?auto_198113 ?auto_198117 ) ) ( not ( = ?auto_198109 ?auto_198115 ) ) ( not ( = ?auto_198109 ?auto_198116 ) ) ( not ( = ?auto_198110 ?auto_198115 ) ) ( not ( = ?auto_198110 ?auto_198116 ) ) ( not ( = ?auto_198111 ?auto_198115 ) ) ( not ( = ?auto_198111 ?auto_198116 ) ) ( not ( = ?auto_198112 ?auto_198115 ) ) ( not ( = ?auto_198112 ?auto_198116 ) ) ( not ( = ?auto_198113 ?auto_198115 ) ) ( not ( = ?auto_198113 ?auto_198116 ) ) ( not ( = ?auto_198117 ?auto_198115 ) ) ( not ( = ?auto_198117 ?auto_198116 ) ) ( not ( = ?auto_198115 ?auto_198116 ) ) ( ON ?auto_198116 ?auto_198114 ) ( not ( = ?auto_198109 ?auto_198114 ) ) ( not ( = ?auto_198110 ?auto_198114 ) ) ( not ( = ?auto_198111 ?auto_198114 ) ) ( not ( = ?auto_198112 ?auto_198114 ) ) ( not ( = ?auto_198113 ?auto_198114 ) ) ( not ( = ?auto_198117 ?auto_198114 ) ) ( not ( = ?auto_198115 ?auto_198114 ) ) ( not ( = ?auto_198116 ?auto_198114 ) ) ( ON ?auto_198115 ?auto_198116 ) ( ON-TABLE ?auto_198114 ) ( ON ?auto_198117 ?auto_198115 ) ( ON ?auto_198113 ?auto_198117 ) ( CLEAR ?auto_198111 ) ( ON ?auto_198112 ?auto_198113 ) ( CLEAR ?auto_198112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198114 ?auto_198116 ?auto_198115 ?auto_198117 ?auto_198113 )
      ( MAKE-5PILE ?auto_198109 ?auto_198110 ?auto_198111 ?auto_198112 ?auto_198113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198118 - BLOCK
      ?auto_198119 - BLOCK
      ?auto_198120 - BLOCK
      ?auto_198121 - BLOCK
      ?auto_198122 - BLOCK
    )
    :vars
    (
      ?auto_198125 - BLOCK
      ?auto_198123 - BLOCK
      ?auto_198124 - BLOCK
      ?auto_198126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198118 ) ( ON ?auto_198119 ?auto_198118 ) ( not ( = ?auto_198118 ?auto_198119 ) ) ( not ( = ?auto_198118 ?auto_198120 ) ) ( not ( = ?auto_198118 ?auto_198121 ) ) ( not ( = ?auto_198118 ?auto_198122 ) ) ( not ( = ?auto_198118 ?auto_198125 ) ) ( not ( = ?auto_198119 ?auto_198120 ) ) ( not ( = ?auto_198119 ?auto_198121 ) ) ( not ( = ?auto_198119 ?auto_198122 ) ) ( not ( = ?auto_198119 ?auto_198125 ) ) ( not ( = ?auto_198120 ?auto_198121 ) ) ( not ( = ?auto_198120 ?auto_198122 ) ) ( not ( = ?auto_198120 ?auto_198125 ) ) ( not ( = ?auto_198121 ?auto_198122 ) ) ( not ( = ?auto_198121 ?auto_198125 ) ) ( not ( = ?auto_198122 ?auto_198125 ) ) ( not ( = ?auto_198118 ?auto_198123 ) ) ( not ( = ?auto_198118 ?auto_198124 ) ) ( not ( = ?auto_198119 ?auto_198123 ) ) ( not ( = ?auto_198119 ?auto_198124 ) ) ( not ( = ?auto_198120 ?auto_198123 ) ) ( not ( = ?auto_198120 ?auto_198124 ) ) ( not ( = ?auto_198121 ?auto_198123 ) ) ( not ( = ?auto_198121 ?auto_198124 ) ) ( not ( = ?auto_198122 ?auto_198123 ) ) ( not ( = ?auto_198122 ?auto_198124 ) ) ( not ( = ?auto_198125 ?auto_198123 ) ) ( not ( = ?auto_198125 ?auto_198124 ) ) ( not ( = ?auto_198123 ?auto_198124 ) ) ( ON ?auto_198124 ?auto_198126 ) ( not ( = ?auto_198118 ?auto_198126 ) ) ( not ( = ?auto_198119 ?auto_198126 ) ) ( not ( = ?auto_198120 ?auto_198126 ) ) ( not ( = ?auto_198121 ?auto_198126 ) ) ( not ( = ?auto_198122 ?auto_198126 ) ) ( not ( = ?auto_198125 ?auto_198126 ) ) ( not ( = ?auto_198123 ?auto_198126 ) ) ( not ( = ?auto_198124 ?auto_198126 ) ) ( ON ?auto_198123 ?auto_198124 ) ( ON-TABLE ?auto_198126 ) ( ON ?auto_198125 ?auto_198123 ) ( ON ?auto_198122 ?auto_198125 ) ( ON ?auto_198121 ?auto_198122 ) ( CLEAR ?auto_198121 ) ( HOLDING ?auto_198120 ) ( CLEAR ?auto_198119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198118 ?auto_198119 ?auto_198120 )
      ( MAKE-5PILE ?auto_198118 ?auto_198119 ?auto_198120 ?auto_198121 ?auto_198122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198127 - BLOCK
      ?auto_198128 - BLOCK
      ?auto_198129 - BLOCK
      ?auto_198130 - BLOCK
      ?auto_198131 - BLOCK
    )
    :vars
    (
      ?auto_198133 - BLOCK
      ?auto_198135 - BLOCK
      ?auto_198132 - BLOCK
      ?auto_198134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198127 ) ( ON ?auto_198128 ?auto_198127 ) ( not ( = ?auto_198127 ?auto_198128 ) ) ( not ( = ?auto_198127 ?auto_198129 ) ) ( not ( = ?auto_198127 ?auto_198130 ) ) ( not ( = ?auto_198127 ?auto_198131 ) ) ( not ( = ?auto_198127 ?auto_198133 ) ) ( not ( = ?auto_198128 ?auto_198129 ) ) ( not ( = ?auto_198128 ?auto_198130 ) ) ( not ( = ?auto_198128 ?auto_198131 ) ) ( not ( = ?auto_198128 ?auto_198133 ) ) ( not ( = ?auto_198129 ?auto_198130 ) ) ( not ( = ?auto_198129 ?auto_198131 ) ) ( not ( = ?auto_198129 ?auto_198133 ) ) ( not ( = ?auto_198130 ?auto_198131 ) ) ( not ( = ?auto_198130 ?auto_198133 ) ) ( not ( = ?auto_198131 ?auto_198133 ) ) ( not ( = ?auto_198127 ?auto_198135 ) ) ( not ( = ?auto_198127 ?auto_198132 ) ) ( not ( = ?auto_198128 ?auto_198135 ) ) ( not ( = ?auto_198128 ?auto_198132 ) ) ( not ( = ?auto_198129 ?auto_198135 ) ) ( not ( = ?auto_198129 ?auto_198132 ) ) ( not ( = ?auto_198130 ?auto_198135 ) ) ( not ( = ?auto_198130 ?auto_198132 ) ) ( not ( = ?auto_198131 ?auto_198135 ) ) ( not ( = ?auto_198131 ?auto_198132 ) ) ( not ( = ?auto_198133 ?auto_198135 ) ) ( not ( = ?auto_198133 ?auto_198132 ) ) ( not ( = ?auto_198135 ?auto_198132 ) ) ( ON ?auto_198132 ?auto_198134 ) ( not ( = ?auto_198127 ?auto_198134 ) ) ( not ( = ?auto_198128 ?auto_198134 ) ) ( not ( = ?auto_198129 ?auto_198134 ) ) ( not ( = ?auto_198130 ?auto_198134 ) ) ( not ( = ?auto_198131 ?auto_198134 ) ) ( not ( = ?auto_198133 ?auto_198134 ) ) ( not ( = ?auto_198135 ?auto_198134 ) ) ( not ( = ?auto_198132 ?auto_198134 ) ) ( ON ?auto_198135 ?auto_198132 ) ( ON-TABLE ?auto_198134 ) ( ON ?auto_198133 ?auto_198135 ) ( ON ?auto_198131 ?auto_198133 ) ( ON ?auto_198130 ?auto_198131 ) ( CLEAR ?auto_198128 ) ( ON ?auto_198129 ?auto_198130 ) ( CLEAR ?auto_198129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198134 ?auto_198132 ?auto_198135 ?auto_198133 ?auto_198131 ?auto_198130 )
      ( MAKE-5PILE ?auto_198127 ?auto_198128 ?auto_198129 ?auto_198130 ?auto_198131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198136 - BLOCK
      ?auto_198137 - BLOCK
      ?auto_198138 - BLOCK
      ?auto_198139 - BLOCK
      ?auto_198140 - BLOCK
    )
    :vars
    (
      ?auto_198143 - BLOCK
      ?auto_198144 - BLOCK
      ?auto_198141 - BLOCK
      ?auto_198142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198136 ) ( not ( = ?auto_198136 ?auto_198137 ) ) ( not ( = ?auto_198136 ?auto_198138 ) ) ( not ( = ?auto_198136 ?auto_198139 ) ) ( not ( = ?auto_198136 ?auto_198140 ) ) ( not ( = ?auto_198136 ?auto_198143 ) ) ( not ( = ?auto_198137 ?auto_198138 ) ) ( not ( = ?auto_198137 ?auto_198139 ) ) ( not ( = ?auto_198137 ?auto_198140 ) ) ( not ( = ?auto_198137 ?auto_198143 ) ) ( not ( = ?auto_198138 ?auto_198139 ) ) ( not ( = ?auto_198138 ?auto_198140 ) ) ( not ( = ?auto_198138 ?auto_198143 ) ) ( not ( = ?auto_198139 ?auto_198140 ) ) ( not ( = ?auto_198139 ?auto_198143 ) ) ( not ( = ?auto_198140 ?auto_198143 ) ) ( not ( = ?auto_198136 ?auto_198144 ) ) ( not ( = ?auto_198136 ?auto_198141 ) ) ( not ( = ?auto_198137 ?auto_198144 ) ) ( not ( = ?auto_198137 ?auto_198141 ) ) ( not ( = ?auto_198138 ?auto_198144 ) ) ( not ( = ?auto_198138 ?auto_198141 ) ) ( not ( = ?auto_198139 ?auto_198144 ) ) ( not ( = ?auto_198139 ?auto_198141 ) ) ( not ( = ?auto_198140 ?auto_198144 ) ) ( not ( = ?auto_198140 ?auto_198141 ) ) ( not ( = ?auto_198143 ?auto_198144 ) ) ( not ( = ?auto_198143 ?auto_198141 ) ) ( not ( = ?auto_198144 ?auto_198141 ) ) ( ON ?auto_198141 ?auto_198142 ) ( not ( = ?auto_198136 ?auto_198142 ) ) ( not ( = ?auto_198137 ?auto_198142 ) ) ( not ( = ?auto_198138 ?auto_198142 ) ) ( not ( = ?auto_198139 ?auto_198142 ) ) ( not ( = ?auto_198140 ?auto_198142 ) ) ( not ( = ?auto_198143 ?auto_198142 ) ) ( not ( = ?auto_198144 ?auto_198142 ) ) ( not ( = ?auto_198141 ?auto_198142 ) ) ( ON ?auto_198144 ?auto_198141 ) ( ON-TABLE ?auto_198142 ) ( ON ?auto_198143 ?auto_198144 ) ( ON ?auto_198140 ?auto_198143 ) ( ON ?auto_198139 ?auto_198140 ) ( ON ?auto_198138 ?auto_198139 ) ( CLEAR ?auto_198138 ) ( HOLDING ?auto_198137 ) ( CLEAR ?auto_198136 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198136 ?auto_198137 )
      ( MAKE-5PILE ?auto_198136 ?auto_198137 ?auto_198138 ?auto_198139 ?auto_198140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198145 - BLOCK
      ?auto_198146 - BLOCK
      ?auto_198147 - BLOCK
      ?auto_198148 - BLOCK
      ?auto_198149 - BLOCK
    )
    :vars
    (
      ?auto_198153 - BLOCK
      ?auto_198151 - BLOCK
      ?auto_198152 - BLOCK
      ?auto_198150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198145 ) ( not ( = ?auto_198145 ?auto_198146 ) ) ( not ( = ?auto_198145 ?auto_198147 ) ) ( not ( = ?auto_198145 ?auto_198148 ) ) ( not ( = ?auto_198145 ?auto_198149 ) ) ( not ( = ?auto_198145 ?auto_198153 ) ) ( not ( = ?auto_198146 ?auto_198147 ) ) ( not ( = ?auto_198146 ?auto_198148 ) ) ( not ( = ?auto_198146 ?auto_198149 ) ) ( not ( = ?auto_198146 ?auto_198153 ) ) ( not ( = ?auto_198147 ?auto_198148 ) ) ( not ( = ?auto_198147 ?auto_198149 ) ) ( not ( = ?auto_198147 ?auto_198153 ) ) ( not ( = ?auto_198148 ?auto_198149 ) ) ( not ( = ?auto_198148 ?auto_198153 ) ) ( not ( = ?auto_198149 ?auto_198153 ) ) ( not ( = ?auto_198145 ?auto_198151 ) ) ( not ( = ?auto_198145 ?auto_198152 ) ) ( not ( = ?auto_198146 ?auto_198151 ) ) ( not ( = ?auto_198146 ?auto_198152 ) ) ( not ( = ?auto_198147 ?auto_198151 ) ) ( not ( = ?auto_198147 ?auto_198152 ) ) ( not ( = ?auto_198148 ?auto_198151 ) ) ( not ( = ?auto_198148 ?auto_198152 ) ) ( not ( = ?auto_198149 ?auto_198151 ) ) ( not ( = ?auto_198149 ?auto_198152 ) ) ( not ( = ?auto_198153 ?auto_198151 ) ) ( not ( = ?auto_198153 ?auto_198152 ) ) ( not ( = ?auto_198151 ?auto_198152 ) ) ( ON ?auto_198152 ?auto_198150 ) ( not ( = ?auto_198145 ?auto_198150 ) ) ( not ( = ?auto_198146 ?auto_198150 ) ) ( not ( = ?auto_198147 ?auto_198150 ) ) ( not ( = ?auto_198148 ?auto_198150 ) ) ( not ( = ?auto_198149 ?auto_198150 ) ) ( not ( = ?auto_198153 ?auto_198150 ) ) ( not ( = ?auto_198151 ?auto_198150 ) ) ( not ( = ?auto_198152 ?auto_198150 ) ) ( ON ?auto_198151 ?auto_198152 ) ( ON-TABLE ?auto_198150 ) ( ON ?auto_198153 ?auto_198151 ) ( ON ?auto_198149 ?auto_198153 ) ( ON ?auto_198148 ?auto_198149 ) ( ON ?auto_198147 ?auto_198148 ) ( CLEAR ?auto_198145 ) ( ON ?auto_198146 ?auto_198147 ) ( CLEAR ?auto_198146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198150 ?auto_198152 ?auto_198151 ?auto_198153 ?auto_198149 ?auto_198148 ?auto_198147 )
      ( MAKE-5PILE ?auto_198145 ?auto_198146 ?auto_198147 ?auto_198148 ?auto_198149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198154 - BLOCK
      ?auto_198155 - BLOCK
      ?auto_198156 - BLOCK
      ?auto_198157 - BLOCK
      ?auto_198158 - BLOCK
    )
    :vars
    (
      ?auto_198161 - BLOCK
      ?auto_198159 - BLOCK
      ?auto_198160 - BLOCK
      ?auto_198162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198154 ?auto_198155 ) ) ( not ( = ?auto_198154 ?auto_198156 ) ) ( not ( = ?auto_198154 ?auto_198157 ) ) ( not ( = ?auto_198154 ?auto_198158 ) ) ( not ( = ?auto_198154 ?auto_198161 ) ) ( not ( = ?auto_198155 ?auto_198156 ) ) ( not ( = ?auto_198155 ?auto_198157 ) ) ( not ( = ?auto_198155 ?auto_198158 ) ) ( not ( = ?auto_198155 ?auto_198161 ) ) ( not ( = ?auto_198156 ?auto_198157 ) ) ( not ( = ?auto_198156 ?auto_198158 ) ) ( not ( = ?auto_198156 ?auto_198161 ) ) ( not ( = ?auto_198157 ?auto_198158 ) ) ( not ( = ?auto_198157 ?auto_198161 ) ) ( not ( = ?auto_198158 ?auto_198161 ) ) ( not ( = ?auto_198154 ?auto_198159 ) ) ( not ( = ?auto_198154 ?auto_198160 ) ) ( not ( = ?auto_198155 ?auto_198159 ) ) ( not ( = ?auto_198155 ?auto_198160 ) ) ( not ( = ?auto_198156 ?auto_198159 ) ) ( not ( = ?auto_198156 ?auto_198160 ) ) ( not ( = ?auto_198157 ?auto_198159 ) ) ( not ( = ?auto_198157 ?auto_198160 ) ) ( not ( = ?auto_198158 ?auto_198159 ) ) ( not ( = ?auto_198158 ?auto_198160 ) ) ( not ( = ?auto_198161 ?auto_198159 ) ) ( not ( = ?auto_198161 ?auto_198160 ) ) ( not ( = ?auto_198159 ?auto_198160 ) ) ( ON ?auto_198160 ?auto_198162 ) ( not ( = ?auto_198154 ?auto_198162 ) ) ( not ( = ?auto_198155 ?auto_198162 ) ) ( not ( = ?auto_198156 ?auto_198162 ) ) ( not ( = ?auto_198157 ?auto_198162 ) ) ( not ( = ?auto_198158 ?auto_198162 ) ) ( not ( = ?auto_198161 ?auto_198162 ) ) ( not ( = ?auto_198159 ?auto_198162 ) ) ( not ( = ?auto_198160 ?auto_198162 ) ) ( ON ?auto_198159 ?auto_198160 ) ( ON-TABLE ?auto_198162 ) ( ON ?auto_198161 ?auto_198159 ) ( ON ?auto_198158 ?auto_198161 ) ( ON ?auto_198157 ?auto_198158 ) ( ON ?auto_198156 ?auto_198157 ) ( ON ?auto_198155 ?auto_198156 ) ( CLEAR ?auto_198155 ) ( HOLDING ?auto_198154 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198154 )
      ( MAKE-5PILE ?auto_198154 ?auto_198155 ?auto_198156 ?auto_198157 ?auto_198158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198163 - BLOCK
      ?auto_198164 - BLOCK
      ?auto_198165 - BLOCK
      ?auto_198166 - BLOCK
      ?auto_198167 - BLOCK
    )
    :vars
    (
      ?auto_198170 - BLOCK
      ?auto_198168 - BLOCK
      ?auto_198169 - BLOCK
      ?auto_198171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198163 ?auto_198164 ) ) ( not ( = ?auto_198163 ?auto_198165 ) ) ( not ( = ?auto_198163 ?auto_198166 ) ) ( not ( = ?auto_198163 ?auto_198167 ) ) ( not ( = ?auto_198163 ?auto_198170 ) ) ( not ( = ?auto_198164 ?auto_198165 ) ) ( not ( = ?auto_198164 ?auto_198166 ) ) ( not ( = ?auto_198164 ?auto_198167 ) ) ( not ( = ?auto_198164 ?auto_198170 ) ) ( not ( = ?auto_198165 ?auto_198166 ) ) ( not ( = ?auto_198165 ?auto_198167 ) ) ( not ( = ?auto_198165 ?auto_198170 ) ) ( not ( = ?auto_198166 ?auto_198167 ) ) ( not ( = ?auto_198166 ?auto_198170 ) ) ( not ( = ?auto_198167 ?auto_198170 ) ) ( not ( = ?auto_198163 ?auto_198168 ) ) ( not ( = ?auto_198163 ?auto_198169 ) ) ( not ( = ?auto_198164 ?auto_198168 ) ) ( not ( = ?auto_198164 ?auto_198169 ) ) ( not ( = ?auto_198165 ?auto_198168 ) ) ( not ( = ?auto_198165 ?auto_198169 ) ) ( not ( = ?auto_198166 ?auto_198168 ) ) ( not ( = ?auto_198166 ?auto_198169 ) ) ( not ( = ?auto_198167 ?auto_198168 ) ) ( not ( = ?auto_198167 ?auto_198169 ) ) ( not ( = ?auto_198170 ?auto_198168 ) ) ( not ( = ?auto_198170 ?auto_198169 ) ) ( not ( = ?auto_198168 ?auto_198169 ) ) ( ON ?auto_198169 ?auto_198171 ) ( not ( = ?auto_198163 ?auto_198171 ) ) ( not ( = ?auto_198164 ?auto_198171 ) ) ( not ( = ?auto_198165 ?auto_198171 ) ) ( not ( = ?auto_198166 ?auto_198171 ) ) ( not ( = ?auto_198167 ?auto_198171 ) ) ( not ( = ?auto_198170 ?auto_198171 ) ) ( not ( = ?auto_198168 ?auto_198171 ) ) ( not ( = ?auto_198169 ?auto_198171 ) ) ( ON ?auto_198168 ?auto_198169 ) ( ON-TABLE ?auto_198171 ) ( ON ?auto_198170 ?auto_198168 ) ( ON ?auto_198167 ?auto_198170 ) ( ON ?auto_198166 ?auto_198167 ) ( ON ?auto_198165 ?auto_198166 ) ( ON ?auto_198164 ?auto_198165 ) ( ON ?auto_198163 ?auto_198164 ) ( CLEAR ?auto_198163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198171 ?auto_198169 ?auto_198168 ?auto_198170 ?auto_198167 ?auto_198166 ?auto_198165 ?auto_198164 )
      ( MAKE-5PILE ?auto_198163 ?auto_198164 ?auto_198165 ?auto_198166 ?auto_198167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198175 - BLOCK
      ?auto_198176 - BLOCK
      ?auto_198177 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_198177 ) ( CLEAR ?auto_198176 ) ( ON-TABLE ?auto_198175 ) ( ON ?auto_198176 ?auto_198175 ) ( not ( = ?auto_198175 ?auto_198176 ) ) ( not ( = ?auto_198175 ?auto_198177 ) ) ( not ( = ?auto_198176 ?auto_198177 ) ) )
    :subtasks
    ( ( !STACK ?auto_198177 ?auto_198176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198178 - BLOCK
      ?auto_198179 - BLOCK
      ?auto_198180 - BLOCK
    )
    :vars
    (
      ?auto_198181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198179 ) ( ON-TABLE ?auto_198178 ) ( ON ?auto_198179 ?auto_198178 ) ( not ( = ?auto_198178 ?auto_198179 ) ) ( not ( = ?auto_198178 ?auto_198180 ) ) ( not ( = ?auto_198179 ?auto_198180 ) ) ( ON ?auto_198180 ?auto_198181 ) ( CLEAR ?auto_198180 ) ( HAND-EMPTY ) ( not ( = ?auto_198178 ?auto_198181 ) ) ( not ( = ?auto_198179 ?auto_198181 ) ) ( not ( = ?auto_198180 ?auto_198181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198180 ?auto_198181 )
      ( MAKE-3PILE ?auto_198178 ?auto_198179 ?auto_198180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198182 - BLOCK
      ?auto_198183 - BLOCK
      ?auto_198184 - BLOCK
    )
    :vars
    (
      ?auto_198185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198182 ) ( not ( = ?auto_198182 ?auto_198183 ) ) ( not ( = ?auto_198182 ?auto_198184 ) ) ( not ( = ?auto_198183 ?auto_198184 ) ) ( ON ?auto_198184 ?auto_198185 ) ( CLEAR ?auto_198184 ) ( not ( = ?auto_198182 ?auto_198185 ) ) ( not ( = ?auto_198183 ?auto_198185 ) ) ( not ( = ?auto_198184 ?auto_198185 ) ) ( HOLDING ?auto_198183 ) ( CLEAR ?auto_198182 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198182 ?auto_198183 )
      ( MAKE-3PILE ?auto_198182 ?auto_198183 ?auto_198184 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198186 - BLOCK
      ?auto_198187 - BLOCK
      ?auto_198188 - BLOCK
    )
    :vars
    (
      ?auto_198189 - BLOCK
      ?auto_198191 - BLOCK
      ?auto_198192 - BLOCK
      ?auto_198190 - BLOCK
      ?auto_198193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198186 ) ( not ( = ?auto_198186 ?auto_198187 ) ) ( not ( = ?auto_198186 ?auto_198188 ) ) ( not ( = ?auto_198187 ?auto_198188 ) ) ( ON ?auto_198188 ?auto_198189 ) ( not ( = ?auto_198186 ?auto_198189 ) ) ( not ( = ?auto_198187 ?auto_198189 ) ) ( not ( = ?auto_198188 ?auto_198189 ) ) ( CLEAR ?auto_198186 ) ( ON ?auto_198187 ?auto_198188 ) ( CLEAR ?auto_198187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198191 ) ( ON ?auto_198192 ?auto_198191 ) ( ON ?auto_198190 ?auto_198192 ) ( ON ?auto_198193 ?auto_198190 ) ( ON ?auto_198189 ?auto_198193 ) ( not ( = ?auto_198191 ?auto_198192 ) ) ( not ( = ?auto_198191 ?auto_198190 ) ) ( not ( = ?auto_198191 ?auto_198193 ) ) ( not ( = ?auto_198191 ?auto_198189 ) ) ( not ( = ?auto_198191 ?auto_198188 ) ) ( not ( = ?auto_198191 ?auto_198187 ) ) ( not ( = ?auto_198192 ?auto_198190 ) ) ( not ( = ?auto_198192 ?auto_198193 ) ) ( not ( = ?auto_198192 ?auto_198189 ) ) ( not ( = ?auto_198192 ?auto_198188 ) ) ( not ( = ?auto_198192 ?auto_198187 ) ) ( not ( = ?auto_198190 ?auto_198193 ) ) ( not ( = ?auto_198190 ?auto_198189 ) ) ( not ( = ?auto_198190 ?auto_198188 ) ) ( not ( = ?auto_198190 ?auto_198187 ) ) ( not ( = ?auto_198193 ?auto_198189 ) ) ( not ( = ?auto_198193 ?auto_198188 ) ) ( not ( = ?auto_198193 ?auto_198187 ) ) ( not ( = ?auto_198186 ?auto_198191 ) ) ( not ( = ?auto_198186 ?auto_198192 ) ) ( not ( = ?auto_198186 ?auto_198190 ) ) ( not ( = ?auto_198186 ?auto_198193 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198191 ?auto_198192 ?auto_198190 ?auto_198193 ?auto_198189 ?auto_198188 )
      ( MAKE-3PILE ?auto_198186 ?auto_198187 ?auto_198188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198194 - BLOCK
      ?auto_198195 - BLOCK
      ?auto_198196 - BLOCK
    )
    :vars
    (
      ?auto_198201 - BLOCK
      ?auto_198198 - BLOCK
      ?auto_198197 - BLOCK
      ?auto_198200 - BLOCK
      ?auto_198199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198194 ?auto_198195 ) ) ( not ( = ?auto_198194 ?auto_198196 ) ) ( not ( = ?auto_198195 ?auto_198196 ) ) ( ON ?auto_198196 ?auto_198201 ) ( not ( = ?auto_198194 ?auto_198201 ) ) ( not ( = ?auto_198195 ?auto_198201 ) ) ( not ( = ?auto_198196 ?auto_198201 ) ) ( ON ?auto_198195 ?auto_198196 ) ( CLEAR ?auto_198195 ) ( ON-TABLE ?auto_198198 ) ( ON ?auto_198197 ?auto_198198 ) ( ON ?auto_198200 ?auto_198197 ) ( ON ?auto_198199 ?auto_198200 ) ( ON ?auto_198201 ?auto_198199 ) ( not ( = ?auto_198198 ?auto_198197 ) ) ( not ( = ?auto_198198 ?auto_198200 ) ) ( not ( = ?auto_198198 ?auto_198199 ) ) ( not ( = ?auto_198198 ?auto_198201 ) ) ( not ( = ?auto_198198 ?auto_198196 ) ) ( not ( = ?auto_198198 ?auto_198195 ) ) ( not ( = ?auto_198197 ?auto_198200 ) ) ( not ( = ?auto_198197 ?auto_198199 ) ) ( not ( = ?auto_198197 ?auto_198201 ) ) ( not ( = ?auto_198197 ?auto_198196 ) ) ( not ( = ?auto_198197 ?auto_198195 ) ) ( not ( = ?auto_198200 ?auto_198199 ) ) ( not ( = ?auto_198200 ?auto_198201 ) ) ( not ( = ?auto_198200 ?auto_198196 ) ) ( not ( = ?auto_198200 ?auto_198195 ) ) ( not ( = ?auto_198199 ?auto_198201 ) ) ( not ( = ?auto_198199 ?auto_198196 ) ) ( not ( = ?auto_198199 ?auto_198195 ) ) ( not ( = ?auto_198194 ?auto_198198 ) ) ( not ( = ?auto_198194 ?auto_198197 ) ) ( not ( = ?auto_198194 ?auto_198200 ) ) ( not ( = ?auto_198194 ?auto_198199 ) ) ( HOLDING ?auto_198194 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198194 )
      ( MAKE-3PILE ?auto_198194 ?auto_198195 ?auto_198196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198202 - BLOCK
      ?auto_198203 - BLOCK
      ?auto_198204 - BLOCK
    )
    :vars
    (
      ?auto_198205 - BLOCK
      ?auto_198206 - BLOCK
      ?auto_198208 - BLOCK
      ?auto_198207 - BLOCK
      ?auto_198209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198202 ?auto_198203 ) ) ( not ( = ?auto_198202 ?auto_198204 ) ) ( not ( = ?auto_198203 ?auto_198204 ) ) ( ON ?auto_198204 ?auto_198205 ) ( not ( = ?auto_198202 ?auto_198205 ) ) ( not ( = ?auto_198203 ?auto_198205 ) ) ( not ( = ?auto_198204 ?auto_198205 ) ) ( ON ?auto_198203 ?auto_198204 ) ( ON-TABLE ?auto_198206 ) ( ON ?auto_198208 ?auto_198206 ) ( ON ?auto_198207 ?auto_198208 ) ( ON ?auto_198209 ?auto_198207 ) ( ON ?auto_198205 ?auto_198209 ) ( not ( = ?auto_198206 ?auto_198208 ) ) ( not ( = ?auto_198206 ?auto_198207 ) ) ( not ( = ?auto_198206 ?auto_198209 ) ) ( not ( = ?auto_198206 ?auto_198205 ) ) ( not ( = ?auto_198206 ?auto_198204 ) ) ( not ( = ?auto_198206 ?auto_198203 ) ) ( not ( = ?auto_198208 ?auto_198207 ) ) ( not ( = ?auto_198208 ?auto_198209 ) ) ( not ( = ?auto_198208 ?auto_198205 ) ) ( not ( = ?auto_198208 ?auto_198204 ) ) ( not ( = ?auto_198208 ?auto_198203 ) ) ( not ( = ?auto_198207 ?auto_198209 ) ) ( not ( = ?auto_198207 ?auto_198205 ) ) ( not ( = ?auto_198207 ?auto_198204 ) ) ( not ( = ?auto_198207 ?auto_198203 ) ) ( not ( = ?auto_198209 ?auto_198205 ) ) ( not ( = ?auto_198209 ?auto_198204 ) ) ( not ( = ?auto_198209 ?auto_198203 ) ) ( not ( = ?auto_198202 ?auto_198206 ) ) ( not ( = ?auto_198202 ?auto_198208 ) ) ( not ( = ?auto_198202 ?auto_198207 ) ) ( not ( = ?auto_198202 ?auto_198209 ) ) ( ON ?auto_198202 ?auto_198203 ) ( CLEAR ?auto_198202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198206 ?auto_198208 ?auto_198207 ?auto_198209 ?auto_198205 ?auto_198204 ?auto_198203 )
      ( MAKE-3PILE ?auto_198202 ?auto_198203 ?auto_198204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198210 - BLOCK
      ?auto_198211 - BLOCK
      ?auto_198212 - BLOCK
    )
    :vars
    (
      ?auto_198214 - BLOCK
      ?auto_198213 - BLOCK
      ?auto_198217 - BLOCK
      ?auto_198215 - BLOCK
      ?auto_198216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198210 ?auto_198211 ) ) ( not ( = ?auto_198210 ?auto_198212 ) ) ( not ( = ?auto_198211 ?auto_198212 ) ) ( ON ?auto_198212 ?auto_198214 ) ( not ( = ?auto_198210 ?auto_198214 ) ) ( not ( = ?auto_198211 ?auto_198214 ) ) ( not ( = ?auto_198212 ?auto_198214 ) ) ( ON ?auto_198211 ?auto_198212 ) ( ON-TABLE ?auto_198213 ) ( ON ?auto_198217 ?auto_198213 ) ( ON ?auto_198215 ?auto_198217 ) ( ON ?auto_198216 ?auto_198215 ) ( ON ?auto_198214 ?auto_198216 ) ( not ( = ?auto_198213 ?auto_198217 ) ) ( not ( = ?auto_198213 ?auto_198215 ) ) ( not ( = ?auto_198213 ?auto_198216 ) ) ( not ( = ?auto_198213 ?auto_198214 ) ) ( not ( = ?auto_198213 ?auto_198212 ) ) ( not ( = ?auto_198213 ?auto_198211 ) ) ( not ( = ?auto_198217 ?auto_198215 ) ) ( not ( = ?auto_198217 ?auto_198216 ) ) ( not ( = ?auto_198217 ?auto_198214 ) ) ( not ( = ?auto_198217 ?auto_198212 ) ) ( not ( = ?auto_198217 ?auto_198211 ) ) ( not ( = ?auto_198215 ?auto_198216 ) ) ( not ( = ?auto_198215 ?auto_198214 ) ) ( not ( = ?auto_198215 ?auto_198212 ) ) ( not ( = ?auto_198215 ?auto_198211 ) ) ( not ( = ?auto_198216 ?auto_198214 ) ) ( not ( = ?auto_198216 ?auto_198212 ) ) ( not ( = ?auto_198216 ?auto_198211 ) ) ( not ( = ?auto_198210 ?auto_198213 ) ) ( not ( = ?auto_198210 ?auto_198217 ) ) ( not ( = ?auto_198210 ?auto_198215 ) ) ( not ( = ?auto_198210 ?auto_198216 ) ) ( HOLDING ?auto_198210 ) ( CLEAR ?auto_198211 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198213 ?auto_198217 ?auto_198215 ?auto_198216 ?auto_198214 ?auto_198212 ?auto_198211 ?auto_198210 )
      ( MAKE-3PILE ?auto_198210 ?auto_198211 ?auto_198212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198218 - BLOCK
      ?auto_198219 - BLOCK
      ?auto_198220 - BLOCK
    )
    :vars
    (
      ?auto_198225 - BLOCK
      ?auto_198224 - BLOCK
      ?auto_198223 - BLOCK
      ?auto_198221 - BLOCK
      ?auto_198222 - BLOCK
      ?auto_198226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198218 ?auto_198219 ) ) ( not ( = ?auto_198218 ?auto_198220 ) ) ( not ( = ?auto_198219 ?auto_198220 ) ) ( ON ?auto_198220 ?auto_198225 ) ( not ( = ?auto_198218 ?auto_198225 ) ) ( not ( = ?auto_198219 ?auto_198225 ) ) ( not ( = ?auto_198220 ?auto_198225 ) ) ( ON ?auto_198219 ?auto_198220 ) ( ON-TABLE ?auto_198224 ) ( ON ?auto_198223 ?auto_198224 ) ( ON ?auto_198221 ?auto_198223 ) ( ON ?auto_198222 ?auto_198221 ) ( ON ?auto_198225 ?auto_198222 ) ( not ( = ?auto_198224 ?auto_198223 ) ) ( not ( = ?auto_198224 ?auto_198221 ) ) ( not ( = ?auto_198224 ?auto_198222 ) ) ( not ( = ?auto_198224 ?auto_198225 ) ) ( not ( = ?auto_198224 ?auto_198220 ) ) ( not ( = ?auto_198224 ?auto_198219 ) ) ( not ( = ?auto_198223 ?auto_198221 ) ) ( not ( = ?auto_198223 ?auto_198222 ) ) ( not ( = ?auto_198223 ?auto_198225 ) ) ( not ( = ?auto_198223 ?auto_198220 ) ) ( not ( = ?auto_198223 ?auto_198219 ) ) ( not ( = ?auto_198221 ?auto_198222 ) ) ( not ( = ?auto_198221 ?auto_198225 ) ) ( not ( = ?auto_198221 ?auto_198220 ) ) ( not ( = ?auto_198221 ?auto_198219 ) ) ( not ( = ?auto_198222 ?auto_198225 ) ) ( not ( = ?auto_198222 ?auto_198220 ) ) ( not ( = ?auto_198222 ?auto_198219 ) ) ( not ( = ?auto_198218 ?auto_198224 ) ) ( not ( = ?auto_198218 ?auto_198223 ) ) ( not ( = ?auto_198218 ?auto_198221 ) ) ( not ( = ?auto_198218 ?auto_198222 ) ) ( CLEAR ?auto_198219 ) ( ON ?auto_198218 ?auto_198226 ) ( CLEAR ?auto_198218 ) ( HAND-EMPTY ) ( not ( = ?auto_198218 ?auto_198226 ) ) ( not ( = ?auto_198219 ?auto_198226 ) ) ( not ( = ?auto_198220 ?auto_198226 ) ) ( not ( = ?auto_198225 ?auto_198226 ) ) ( not ( = ?auto_198224 ?auto_198226 ) ) ( not ( = ?auto_198223 ?auto_198226 ) ) ( not ( = ?auto_198221 ?auto_198226 ) ) ( not ( = ?auto_198222 ?auto_198226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198218 ?auto_198226 )
      ( MAKE-3PILE ?auto_198218 ?auto_198219 ?auto_198220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198227 - BLOCK
      ?auto_198228 - BLOCK
      ?auto_198229 - BLOCK
    )
    :vars
    (
      ?auto_198234 - BLOCK
      ?auto_198235 - BLOCK
      ?auto_198231 - BLOCK
      ?auto_198233 - BLOCK
      ?auto_198232 - BLOCK
      ?auto_198230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198227 ?auto_198228 ) ) ( not ( = ?auto_198227 ?auto_198229 ) ) ( not ( = ?auto_198228 ?auto_198229 ) ) ( ON ?auto_198229 ?auto_198234 ) ( not ( = ?auto_198227 ?auto_198234 ) ) ( not ( = ?auto_198228 ?auto_198234 ) ) ( not ( = ?auto_198229 ?auto_198234 ) ) ( ON-TABLE ?auto_198235 ) ( ON ?auto_198231 ?auto_198235 ) ( ON ?auto_198233 ?auto_198231 ) ( ON ?auto_198232 ?auto_198233 ) ( ON ?auto_198234 ?auto_198232 ) ( not ( = ?auto_198235 ?auto_198231 ) ) ( not ( = ?auto_198235 ?auto_198233 ) ) ( not ( = ?auto_198235 ?auto_198232 ) ) ( not ( = ?auto_198235 ?auto_198234 ) ) ( not ( = ?auto_198235 ?auto_198229 ) ) ( not ( = ?auto_198235 ?auto_198228 ) ) ( not ( = ?auto_198231 ?auto_198233 ) ) ( not ( = ?auto_198231 ?auto_198232 ) ) ( not ( = ?auto_198231 ?auto_198234 ) ) ( not ( = ?auto_198231 ?auto_198229 ) ) ( not ( = ?auto_198231 ?auto_198228 ) ) ( not ( = ?auto_198233 ?auto_198232 ) ) ( not ( = ?auto_198233 ?auto_198234 ) ) ( not ( = ?auto_198233 ?auto_198229 ) ) ( not ( = ?auto_198233 ?auto_198228 ) ) ( not ( = ?auto_198232 ?auto_198234 ) ) ( not ( = ?auto_198232 ?auto_198229 ) ) ( not ( = ?auto_198232 ?auto_198228 ) ) ( not ( = ?auto_198227 ?auto_198235 ) ) ( not ( = ?auto_198227 ?auto_198231 ) ) ( not ( = ?auto_198227 ?auto_198233 ) ) ( not ( = ?auto_198227 ?auto_198232 ) ) ( ON ?auto_198227 ?auto_198230 ) ( CLEAR ?auto_198227 ) ( not ( = ?auto_198227 ?auto_198230 ) ) ( not ( = ?auto_198228 ?auto_198230 ) ) ( not ( = ?auto_198229 ?auto_198230 ) ) ( not ( = ?auto_198234 ?auto_198230 ) ) ( not ( = ?auto_198235 ?auto_198230 ) ) ( not ( = ?auto_198231 ?auto_198230 ) ) ( not ( = ?auto_198233 ?auto_198230 ) ) ( not ( = ?auto_198232 ?auto_198230 ) ) ( HOLDING ?auto_198228 ) ( CLEAR ?auto_198229 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198235 ?auto_198231 ?auto_198233 ?auto_198232 ?auto_198234 ?auto_198229 ?auto_198228 )
      ( MAKE-3PILE ?auto_198227 ?auto_198228 ?auto_198229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198236 - BLOCK
      ?auto_198237 - BLOCK
      ?auto_198238 - BLOCK
    )
    :vars
    (
      ?auto_198240 - BLOCK
      ?auto_198243 - BLOCK
      ?auto_198241 - BLOCK
      ?auto_198239 - BLOCK
      ?auto_198244 - BLOCK
      ?auto_198242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198236 ?auto_198237 ) ) ( not ( = ?auto_198236 ?auto_198238 ) ) ( not ( = ?auto_198237 ?auto_198238 ) ) ( ON ?auto_198238 ?auto_198240 ) ( not ( = ?auto_198236 ?auto_198240 ) ) ( not ( = ?auto_198237 ?auto_198240 ) ) ( not ( = ?auto_198238 ?auto_198240 ) ) ( ON-TABLE ?auto_198243 ) ( ON ?auto_198241 ?auto_198243 ) ( ON ?auto_198239 ?auto_198241 ) ( ON ?auto_198244 ?auto_198239 ) ( ON ?auto_198240 ?auto_198244 ) ( not ( = ?auto_198243 ?auto_198241 ) ) ( not ( = ?auto_198243 ?auto_198239 ) ) ( not ( = ?auto_198243 ?auto_198244 ) ) ( not ( = ?auto_198243 ?auto_198240 ) ) ( not ( = ?auto_198243 ?auto_198238 ) ) ( not ( = ?auto_198243 ?auto_198237 ) ) ( not ( = ?auto_198241 ?auto_198239 ) ) ( not ( = ?auto_198241 ?auto_198244 ) ) ( not ( = ?auto_198241 ?auto_198240 ) ) ( not ( = ?auto_198241 ?auto_198238 ) ) ( not ( = ?auto_198241 ?auto_198237 ) ) ( not ( = ?auto_198239 ?auto_198244 ) ) ( not ( = ?auto_198239 ?auto_198240 ) ) ( not ( = ?auto_198239 ?auto_198238 ) ) ( not ( = ?auto_198239 ?auto_198237 ) ) ( not ( = ?auto_198244 ?auto_198240 ) ) ( not ( = ?auto_198244 ?auto_198238 ) ) ( not ( = ?auto_198244 ?auto_198237 ) ) ( not ( = ?auto_198236 ?auto_198243 ) ) ( not ( = ?auto_198236 ?auto_198241 ) ) ( not ( = ?auto_198236 ?auto_198239 ) ) ( not ( = ?auto_198236 ?auto_198244 ) ) ( ON ?auto_198236 ?auto_198242 ) ( not ( = ?auto_198236 ?auto_198242 ) ) ( not ( = ?auto_198237 ?auto_198242 ) ) ( not ( = ?auto_198238 ?auto_198242 ) ) ( not ( = ?auto_198240 ?auto_198242 ) ) ( not ( = ?auto_198243 ?auto_198242 ) ) ( not ( = ?auto_198241 ?auto_198242 ) ) ( not ( = ?auto_198239 ?auto_198242 ) ) ( not ( = ?auto_198244 ?auto_198242 ) ) ( CLEAR ?auto_198238 ) ( ON ?auto_198237 ?auto_198236 ) ( CLEAR ?auto_198237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198242 ?auto_198236 )
      ( MAKE-3PILE ?auto_198236 ?auto_198237 ?auto_198238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198245 - BLOCK
      ?auto_198246 - BLOCK
      ?auto_198247 - BLOCK
    )
    :vars
    (
      ?auto_198252 - BLOCK
      ?auto_198253 - BLOCK
      ?auto_198250 - BLOCK
      ?auto_198251 - BLOCK
      ?auto_198249 - BLOCK
      ?auto_198248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198245 ?auto_198246 ) ) ( not ( = ?auto_198245 ?auto_198247 ) ) ( not ( = ?auto_198246 ?auto_198247 ) ) ( not ( = ?auto_198245 ?auto_198252 ) ) ( not ( = ?auto_198246 ?auto_198252 ) ) ( not ( = ?auto_198247 ?auto_198252 ) ) ( ON-TABLE ?auto_198253 ) ( ON ?auto_198250 ?auto_198253 ) ( ON ?auto_198251 ?auto_198250 ) ( ON ?auto_198249 ?auto_198251 ) ( ON ?auto_198252 ?auto_198249 ) ( not ( = ?auto_198253 ?auto_198250 ) ) ( not ( = ?auto_198253 ?auto_198251 ) ) ( not ( = ?auto_198253 ?auto_198249 ) ) ( not ( = ?auto_198253 ?auto_198252 ) ) ( not ( = ?auto_198253 ?auto_198247 ) ) ( not ( = ?auto_198253 ?auto_198246 ) ) ( not ( = ?auto_198250 ?auto_198251 ) ) ( not ( = ?auto_198250 ?auto_198249 ) ) ( not ( = ?auto_198250 ?auto_198252 ) ) ( not ( = ?auto_198250 ?auto_198247 ) ) ( not ( = ?auto_198250 ?auto_198246 ) ) ( not ( = ?auto_198251 ?auto_198249 ) ) ( not ( = ?auto_198251 ?auto_198252 ) ) ( not ( = ?auto_198251 ?auto_198247 ) ) ( not ( = ?auto_198251 ?auto_198246 ) ) ( not ( = ?auto_198249 ?auto_198252 ) ) ( not ( = ?auto_198249 ?auto_198247 ) ) ( not ( = ?auto_198249 ?auto_198246 ) ) ( not ( = ?auto_198245 ?auto_198253 ) ) ( not ( = ?auto_198245 ?auto_198250 ) ) ( not ( = ?auto_198245 ?auto_198251 ) ) ( not ( = ?auto_198245 ?auto_198249 ) ) ( ON ?auto_198245 ?auto_198248 ) ( not ( = ?auto_198245 ?auto_198248 ) ) ( not ( = ?auto_198246 ?auto_198248 ) ) ( not ( = ?auto_198247 ?auto_198248 ) ) ( not ( = ?auto_198252 ?auto_198248 ) ) ( not ( = ?auto_198253 ?auto_198248 ) ) ( not ( = ?auto_198250 ?auto_198248 ) ) ( not ( = ?auto_198251 ?auto_198248 ) ) ( not ( = ?auto_198249 ?auto_198248 ) ) ( ON ?auto_198246 ?auto_198245 ) ( CLEAR ?auto_198246 ) ( ON-TABLE ?auto_198248 ) ( HOLDING ?auto_198247 ) ( CLEAR ?auto_198252 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198253 ?auto_198250 ?auto_198251 ?auto_198249 ?auto_198252 ?auto_198247 )
      ( MAKE-3PILE ?auto_198245 ?auto_198246 ?auto_198247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198254 - BLOCK
      ?auto_198255 - BLOCK
      ?auto_198256 - BLOCK
    )
    :vars
    (
      ?auto_198260 - BLOCK
      ?auto_198262 - BLOCK
      ?auto_198257 - BLOCK
      ?auto_198259 - BLOCK
      ?auto_198261 - BLOCK
      ?auto_198258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198254 ?auto_198255 ) ) ( not ( = ?auto_198254 ?auto_198256 ) ) ( not ( = ?auto_198255 ?auto_198256 ) ) ( not ( = ?auto_198254 ?auto_198260 ) ) ( not ( = ?auto_198255 ?auto_198260 ) ) ( not ( = ?auto_198256 ?auto_198260 ) ) ( ON-TABLE ?auto_198262 ) ( ON ?auto_198257 ?auto_198262 ) ( ON ?auto_198259 ?auto_198257 ) ( ON ?auto_198261 ?auto_198259 ) ( ON ?auto_198260 ?auto_198261 ) ( not ( = ?auto_198262 ?auto_198257 ) ) ( not ( = ?auto_198262 ?auto_198259 ) ) ( not ( = ?auto_198262 ?auto_198261 ) ) ( not ( = ?auto_198262 ?auto_198260 ) ) ( not ( = ?auto_198262 ?auto_198256 ) ) ( not ( = ?auto_198262 ?auto_198255 ) ) ( not ( = ?auto_198257 ?auto_198259 ) ) ( not ( = ?auto_198257 ?auto_198261 ) ) ( not ( = ?auto_198257 ?auto_198260 ) ) ( not ( = ?auto_198257 ?auto_198256 ) ) ( not ( = ?auto_198257 ?auto_198255 ) ) ( not ( = ?auto_198259 ?auto_198261 ) ) ( not ( = ?auto_198259 ?auto_198260 ) ) ( not ( = ?auto_198259 ?auto_198256 ) ) ( not ( = ?auto_198259 ?auto_198255 ) ) ( not ( = ?auto_198261 ?auto_198260 ) ) ( not ( = ?auto_198261 ?auto_198256 ) ) ( not ( = ?auto_198261 ?auto_198255 ) ) ( not ( = ?auto_198254 ?auto_198262 ) ) ( not ( = ?auto_198254 ?auto_198257 ) ) ( not ( = ?auto_198254 ?auto_198259 ) ) ( not ( = ?auto_198254 ?auto_198261 ) ) ( ON ?auto_198254 ?auto_198258 ) ( not ( = ?auto_198254 ?auto_198258 ) ) ( not ( = ?auto_198255 ?auto_198258 ) ) ( not ( = ?auto_198256 ?auto_198258 ) ) ( not ( = ?auto_198260 ?auto_198258 ) ) ( not ( = ?auto_198262 ?auto_198258 ) ) ( not ( = ?auto_198257 ?auto_198258 ) ) ( not ( = ?auto_198259 ?auto_198258 ) ) ( not ( = ?auto_198261 ?auto_198258 ) ) ( ON ?auto_198255 ?auto_198254 ) ( ON-TABLE ?auto_198258 ) ( CLEAR ?auto_198260 ) ( ON ?auto_198256 ?auto_198255 ) ( CLEAR ?auto_198256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198258 ?auto_198254 ?auto_198255 )
      ( MAKE-3PILE ?auto_198254 ?auto_198255 ?auto_198256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198263 - BLOCK
      ?auto_198264 - BLOCK
      ?auto_198265 - BLOCK
    )
    :vars
    (
      ?auto_198270 - BLOCK
      ?auto_198269 - BLOCK
      ?auto_198267 - BLOCK
      ?auto_198271 - BLOCK
      ?auto_198266 - BLOCK
      ?auto_198268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198263 ?auto_198264 ) ) ( not ( = ?auto_198263 ?auto_198265 ) ) ( not ( = ?auto_198264 ?auto_198265 ) ) ( not ( = ?auto_198263 ?auto_198270 ) ) ( not ( = ?auto_198264 ?auto_198270 ) ) ( not ( = ?auto_198265 ?auto_198270 ) ) ( ON-TABLE ?auto_198269 ) ( ON ?auto_198267 ?auto_198269 ) ( ON ?auto_198271 ?auto_198267 ) ( ON ?auto_198266 ?auto_198271 ) ( not ( = ?auto_198269 ?auto_198267 ) ) ( not ( = ?auto_198269 ?auto_198271 ) ) ( not ( = ?auto_198269 ?auto_198266 ) ) ( not ( = ?auto_198269 ?auto_198270 ) ) ( not ( = ?auto_198269 ?auto_198265 ) ) ( not ( = ?auto_198269 ?auto_198264 ) ) ( not ( = ?auto_198267 ?auto_198271 ) ) ( not ( = ?auto_198267 ?auto_198266 ) ) ( not ( = ?auto_198267 ?auto_198270 ) ) ( not ( = ?auto_198267 ?auto_198265 ) ) ( not ( = ?auto_198267 ?auto_198264 ) ) ( not ( = ?auto_198271 ?auto_198266 ) ) ( not ( = ?auto_198271 ?auto_198270 ) ) ( not ( = ?auto_198271 ?auto_198265 ) ) ( not ( = ?auto_198271 ?auto_198264 ) ) ( not ( = ?auto_198266 ?auto_198270 ) ) ( not ( = ?auto_198266 ?auto_198265 ) ) ( not ( = ?auto_198266 ?auto_198264 ) ) ( not ( = ?auto_198263 ?auto_198269 ) ) ( not ( = ?auto_198263 ?auto_198267 ) ) ( not ( = ?auto_198263 ?auto_198271 ) ) ( not ( = ?auto_198263 ?auto_198266 ) ) ( ON ?auto_198263 ?auto_198268 ) ( not ( = ?auto_198263 ?auto_198268 ) ) ( not ( = ?auto_198264 ?auto_198268 ) ) ( not ( = ?auto_198265 ?auto_198268 ) ) ( not ( = ?auto_198270 ?auto_198268 ) ) ( not ( = ?auto_198269 ?auto_198268 ) ) ( not ( = ?auto_198267 ?auto_198268 ) ) ( not ( = ?auto_198271 ?auto_198268 ) ) ( not ( = ?auto_198266 ?auto_198268 ) ) ( ON ?auto_198264 ?auto_198263 ) ( ON-TABLE ?auto_198268 ) ( ON ?auto_198265 ?auto_198264 ) ( CLEAR ?auto_198265 ) ( HOLDING ?auto_198270 ) ( CLEAR ?auto_198266 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198269 ?auto_198267 ?auto_198271 ?auto_198266 ?auto_198270 )
      ( MAKE-3PILE ?auto_198263 ?auto_198264 ?auto_198265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198272 - BLOCK
      ?auto_198273 - BLOCK
      ?auto_198274 - BLOCK
    )
    :vars
    (
      ?auto_198275 - BLOCK
      ?auto_198276 - BLOCK
      ?auto_198277 - BLOCK
      ?auto_198280 - BLOCK
      ?auto_198279 - BLOCK
      ?auto_198278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198272 ?auto_198273 ) ) ( not ( = ?auto_198272 ?auto_198274 ) ) ( not ( = ?auto_198273 ?auto_198274 ) ) ( not ( = ?auto_198272 ?auto_198275 ) ) ( not ( = ?auto_198273 ?auto_198275 ) ) ( not ( = ?auto_198274 ?auto_198275 ) ) ( ON-TABLE ?auto_198276 ) ( ON ?auto_198277 ?auto_198276 ) ( ON ?auto_198280 ?auto_198277 ) ( ON ?auto_198279 ?auto_198280 ) ( not ( = ?auto_198276 ?auto_198277 ) ) ( not ( = ?auto_198276 ?auto_198280 ) ) ( not ( = ?auto_198276 ?auto_198279 ) ) ( not ( = ?auto_198276 ?auto_198275 ) ) ( not ( = ?auto_198276 ?auto_198274 ) ) ( not ( = ?auto_198276 ?auto_198273 ) ) ( not ( = ?auto_198277 ?auto_198280 ) ) ( not ( = ?auto_198277 ?auto_198279 ) ) ( not ( = ?auto_198277 ?auto_198275 ) ) ( not ( = ?auto_198277 ?auto_198274 ) ) ( not ( = ?auto_198277 ?auto_198273 ) ) ( not ( = ?auto_198280 ?auto_198279 ) ) ( not ( = ?auto_198280 ?auto_198275 ) ) ( not ( = ?auto_198280 ?auto_198274 ) ) ( not ( = ?auto_198280 ?auto_198273 ) ) ( not ( = ?auto_198279 ?auto_198275 ) ) ( not ( = ?auto_198279 ?auto_198274 ) ) ( not ( = ?auto_198279 ?auto_198273 ) ) ( not ( = ?auto_198272 ?auto_198276 ) ) ( not ( = ?auto_198272 ?auto_198277 ) ) ( not ( = ?auto_198272 ?auto_198280 ) ) ( not ( = ?auto_198272 ?auto_198279 ) ) ( ON ?auto_198272 ?auto_198278 ) ( not ( = ?auto_198272 ?auto_198278 ) ) ( not ( = ?auto_198273 ?auto_198278 ) ) ( not ( = ?auto_198274 ?auto_198278 ) ) ( not ( = ?auto_198275 ?auto_198278 ) ) ( not ( = ?auto_198276 ?auto_198278 ) ) ( not ( = ?auto_198277 ?auto_198278 ) ) ( not ( = ?auto_198280 ?auto_198278 ) ) ( not ( = ?auto_198279 ?auto_198278 ) ) ( ON ?auto_198273 ?auto_198272 ) ( ON-TABLE ?auto_198278 ) ( ON ?auto_198274 ?auto_198273 ) ( CLEAR ?auto_198279 ) ( ON ?auto_198275 ?auto_198274 ) ( CLEAR ?auto_198275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198278 ?auto_198272 ?auto_198273 ?auto_198274 )
      ( MAKE-3PILE ?auto_198272 ?auto_198273 ?auto_198274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198281 - BLOCK
      ?auto_198282 - BLOCK
      ?auto_198283 - BLOCK
    )
    :vars
    (
      ?auto_198285 - BLOCK
      ?auto_198284 - BLOCK
      ?auto_198289 - BLOCK
      ?auto_198288 - BLOCK
      ?auto_198287 - BLOCK
      ?auto_198286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198281 ?auto_198282 ) ) ( not ( = ?auto_198281 ?auto_198283 ) ) ( not ( = ?auto_198282 ?auto_198283 ) ) ( not ( = ?auto_198281 ?auto_198285 ) ) ( not ( = ?auto_198282 ?auto_198285 ) ) ( not ( = ?auto_198283 ?auto_198285 ) ) ( ON-TABLE ?auto_198284 ) ( ON ?auto_198289 ?auto_198284 ) ( ON ?auto_198288 ?auto_198289 ) ( not ( = ?auto_198284 ?auto_198289 ) ) ( not ( = ?auto_198284 ?auto_198288 ) ) ( not ( = ?auto_198284 ?auto_198287 ) ) ( not ( = ?auto_198284 ?auto_198285 ) ) ( not ( = ?auto_198284 ?auto_198283 ) ) ( not ( = ?auto_198284 ?auto_198282 ) ) ( not ( = ?auto_198289 ?auto_198288 ) ) ( not ( = ?auto_198289 ?auto_198287 ) ) ( not ( = ?auto_198289 ?auto_198285 ) ) ( not ( = ?auto_198289 ?auto_198283 ) ) ( not ( = ?auto_198289 ?auto_198282 ) ) ( not ( = ?auto_198288 ?auto_198287 ) ) ( not ( = ?auto_198288 ?auto_198285 ) ) ( not ( = ?auto_198288 ?auto_198283 ) ) ( not ( = ?auto_198288 ?auto_198282 ) ) ( not ( = ?auto_198287 ?auto_198285 ) ) ( not ( = ?auto_198287 ?auto_198283 ) ) ( not ( = ?auto_198287 ?auto_198282 ) ) ( not ( = ?auto_198281 ?auto_198284 ) ) ( not ( = ?auto_198281 ?auto_198289 ) ) ( not ( = ?auto_198281 ?auto_198288 ) ) ( not ( = ?auto_198281 ?auto_198287 ) ) ( ON ?auto_198281 ?auto_198286 ) ( not ( = ?auto_198281 ?auto_198286 ) ) ( not ( = ?auto_198282 ?auto_198286 ) ) ( not ( = ?auto_198283 ?auto_198286 ) ) ( not ( = ?auto_198285 ?auto_198286 ) ) ( not ( = ?auto_198284 ?auto_198286 ) ) ( not ( = ?auto_198289 ?auto_198286 ) ) ( not ( = ?auto_198288 ?auto_198286 ) ) ( not ( = ?auto_198287 ?auto_198286 ) ) ( ON ?auto_198282 ?auto_198281 ) ( ON-TABLE ?auto_198286 ) ( ON ?auto_198283 ?auto_198282 ) ( ON ?auto_198285 ?auto_198283 ) ( CLEAR ?auto_198285 ) ( HOLDING ?auto_198287 ) ( CLEAR ?auto_198288 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198284 ?auto_198289 ?auto_198288 ?auto_198287 )
      ( MAKE-3PILE ?auto_198281 ?auto_198282 ?auto_198283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198290 - BLOCK
      ?auto_198291 - BLOCK
      ?auto_198292 - BLOCK
    )
    :vars
    (
      ?auto_198296 - BLOCK
      ?auto_198294 - BLOCK
      ?auto_198298 - BLOCK
      ?auto_198295 - BLOCK
      ?auto_198293 - BLOCK
      ?auto_198297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198290 ?auto_198291 ) ) ( not ( = ?auto_198290 ?auto_198292 ) ) ( not ( = ?auto_198291 ?auto_198292 ) ) ( not ( = ?auto_198290 ?auto_198296 ) ) ( not ( = ?auto_198291 ?auto_198296 ) ) ( not ( = ?auto_198292 ?auto_198296 ) ) ( ON-TABLE ?auto_198294 ) ( ON ?auto_198298 ?auto_198294 ) ( ON ?auto_198295 ?auto_198298 ) ( not ( = ?auto_198294 ?auto_198298 ) ) ( not ( = ?auto_198294 ?auto_198295 ) ) ( not ( = ?auto_198294 ?auto_198293 ) ) ( not ( = ?auto_198294 ?auto_198296 ) ) ( not ( = ?auto_198294 ?auto_198292 ) ) ( not ( = ?auto_198294 ?auto_198291 ) ) ( not ( = ?auto_198298 ?auto_198295 ) ) ( not ( = ?auto_198298 ?auto_198293 ) ) ( not ( = ?auto_198298 ?auto_198296 ) ) ( not ( = ?auto_198298 ?auto_198292 ) ) ( not ( = ?auto_198298 ?auto_198291 ) ) ( not ( = ?auto_198295 ?auto_198293 ) ) ( not ( = ?auto_198295 ?auto_198296 ) ) ( not ( = ?auto_198295 ?auto_198292 ) ) ( not ( = ?auto_198295 ?auto_198291 ) ) ( not ( = ?auto_198293 ?auto_198296 ) ) ( not ( = ?auto_198293 ?auto_198292 ) ) ( not ( = ?auto_198293 ?auto_198291 ) ) ( not ( = ?auto_198290 ?auto_198294 ) ) ( not ( = ?auto_198290 ?auto_198298 ) ) ( not ( = ?auto_198290 ?auto_198295 ) ) ( not ( = ?auto_198290 ?auto_198293 ) ) ( ON ?auto_198290 ?auto_198297 ) ( not ( = ?auto_198290 ?auto_198297 ) ) ( not ( = ?auto_198291 ?auto_198297 ) ) ( not ( = ?auto_198292 ?auto_198297 ) ) ( not ( = ?auto_198296 ?auto_198297 ) ) ( not ( = ?auto_198294 ?auto_198297 ) ) ( not ( = ?auto_198298 ?auto_198297 ) ) ( not ( = ?auto_198295 ?auto_198297 ) ) ( not ( = ?auto_198293 ?auto_198297 ) ) ( ON ?auto_198291 ?auto_198290 ) ( ON-TABLE ?auto_198297 ) ( ON ?auto_198292 ?auto_198291 ) ( ON ?auto_198296 ?auto_198292 ) ( CLEAR ?auto_198295 ) ( ON ?auto_198293 ?auto_198296 ) ( CLEAR ?auto_198293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198297 ?auto_198290 ?auto_198291 ?auto_198292 ?auto_198296 )
      ( MAKE-3PILE ?auto_198290 ?auto_198291 ?auto_198292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198299 - BLOCK
      ?auto_198300 - BLOCK
      ?auto_198301 - BLOCK
    )
    :vars
    (
      ?auto_198306 - BLOCK
      ?auto_198302 - BLOCK
      ?auto_198304 - BLOCK
      ?auto_198303 - BLOCK
      ?auto_198307 - BLOCK
      ?auto_198305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198299 ?auto_198300 ) ) ( not ( = ?auto_198299 ?auto_198301 ) ) ( not ( = ?auto_198300 ?auto_198301 ) ) ( not ( = ?auto_198299 ?auto_198306 ) ) ( not ( = ?auto_198300 ?auto_198306 ) ) ( not ( = ?auto_198301 ?auto_198306 ) ) ( ON-TABLE ?auto_198302 ) ( ON ?auto_198304 ?auto_198302 ) ( not ( = ?auto_198302 ?auto_198304 ) ) ( not ( = ?auto_198302 ?auto_198303 ) ) ( not ( = ?auto_198302 ?auto_198307 ) ) ( not ( = ?auto_198302 ?auto_198306 ) ) ( not ( = ?auto_198302 ?auto_198301 ) ) ( not ( = ?auto_198302 ?auto_198300 ) ) ( not ( = ?auto_198304 ?auto_198303 ) ) ( not ( = ?auto_198304 ?auto_198307 ) ) ( not ( = ?auto_198304 ?auto_198306 ) ) ( not ( = ?auto_198304 ?auto_198301 ) ) ( not ( = ?auto_198304 ?auto_198300 ) ) ( not ( = ?auto_198303 ?auto_198307 ) ) ( not ( = ?auto_198303 ?auto_198306 ) ) ( not ( = ?auto_198303 ?auto_198301 ) ) ( not ( = ?auto_198303 ?auto_198300 ) ) ( not ( = ?auto_198307 ?auto_198306 ) ) ( not ( = ?auto_198307 ?auto_198301 ) ) ( not ( = ?auto_198307 ?auto_198300 ) ) ( not ( = ?auto_198299 ?auto_198302 ) ) ( not ( = ?auto_198299 ?auto_198304 ) ) ( not ( = ?auto_198299 ?auto_198303 ) ) ( not ( = ?auto_198299 ?auto_198307 ) ) ( ON ?auto_198299 ?auto_198305 ) ( not ( = ?auto_198299 ?auto_198305 ) ) ( not ( = ?auto_198300 ?auto_198305 ) ) ( not ( = ?auto_198301 ?auto_198305 ) ) ( not ( = ?auto_198306 ?auto_198305 ) ) ( not ( = ?auto_198302 ?auto_198305 ) ) ( not ( = ?auto_198304 ?auto_198305 ) ) ( not ( = ?auto_198303 ?auto_198305 ) ) ( not ( = ?auto_198307 ?auto_198305 ) ) ( ON ?auto_198300 ?auto_198299 ) ( ON-TABLE ?auto_198305 ) ( ON ?auto_198301 ?auto_198300 ) ( ON ?auto_198306 ?auto_198301 ) ( ON ?auto_198307 ?auto_198306 ) ( CLEAR ?auto_198307 ) ( HOLDING ?auto_198303 ) ( CLEAR ?auto_198304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198302 ?auto_198304 ?auto_198303 )
      ( MAKE-3PILE ?auto_198299 ?auto_198300 ?auto_198301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198308 - BLOCK
      ?auto_198309 - BLOCK
      ?auto_198310 - BLOCK
    )
    :vars
    (
      ?auto_198311 - BLOCK
      ?auto_198313 - BLOCK
      ?auto_198314 - BLOCK
      ?auto_198316 - BLOCK
      ?auto_198312 - BLOCK
      ?auto_198315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198308 ?auto_198309 ) ) ( not ( = ?auto_198308 ?auto_198310 ) ) ( not ( = ?auto_198309 ?auto_198310 ) ) ( not ( = ?auto_198308 ?auto_198311 ) ) ( not ( = ?auto_198309 ?auto_198311 ) ) ( not ( = ?auto_198310 ?auto_198311 ) ) ( ON-TABLE ?auto_198313 ) ( ON ?auto_198314 ?auto_198313 ) ( not ( = ?auto_198313 ?auto_198314 ) ) ( not ( = ?auto_198313 ?auto_198316 ) ) ( not ( = ?auto_198313 ?auto_198312 ) ) ( not ( = ?auto_198313 ?auto_198311 ) ) ( not ( = ?auto_198313 ?auto_198310 ) ) ( not ( = ?auto_198313 ?auto_198309 ) ) ( not ( = ?auto_198314 ?auto_198316 ) ) ( not ( = ?auto_198314 ?auto_198312 ) ) ( not ( = ?auto_198314 ?auto_198311 ) ) ( not ( = ?auto_198314 ?auto_198310 ) ) ( not ( = ?auto_198314 ?auto_198309 ) ) ( not ( = ?auto_198316 ?auto_198312 ) ) ( not ( = ?auto_198316 ?auto_198311 ) ) ( not ( = ?auto_198316 ?auto_198310 ) ) ( not ( = ?auto_198316 ?auto_198309 ) ) ( not ( = ?auto_198312 ?auto_198311 ) ) ( not ( = ?auto_198312 ?auto_198310 ) ) ( not ( = ?auto_198312 ?auto_198309 ) ) ( not ( = ?auto_198308 ?auto_198313 ) ) ( not ( = ?auto_198308 ?auto_198314 ) ) ( not ( = ?auto_198308 ?auto_198316 ) ) ( not ( = ?auto_198308 ?auto_198312 ) ) ( ON ?auto_198308 ?auto_198315 ) ( not ( = ?auto_198308 ?auto_198315 ) ) ( not ( = ?auto_198309 ?auto_198315 ) ) ( not ( = ?auto_198310 ?auto_198315 ) ) ( not ( = ?auto_198311 ?auto_198315 ) ) ( not ( = ?auto_198313 ?auto_198315 ) ) ( not ( = ?auto_198314 ?auto_198315 ) ) ( not ( = ?auto_198316 ?auto_198315 ) ) ( not ( = ?auto_198312 ?auto_198315 ) ) ( ON ?auto_198309 ?auto_198308 ) ( ON-TABLE ?auto_198315 ) ( ON ?auto_198310 ?auto_198309 ) ( ON ?auto_198311 ?auto_198310 ) ( ON ?auto_198312 ?auto_198311 ) ( CLEAR ?auto_198314 ) ( ON ?auto_198316 ?auto_198312 ) ( CLEAR ?auto_198316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198315 ?auto_198308 ?auto_198309 ?auto_198310 ?auto_198311 ?auto_198312 )
      ( MAKE-3PILE ?auto_198308 ?auto_198309 ?auto_198310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198317 - BLOCK
      ?auto_198318 - BLOCK
      ?auto_198319 - BLOCK
    )
    :vars
    (
      ?auto_198320 - BLOCK
      ?auto_198325 - BLOCK
      ?auto_198321 - BLOCK
      ?auto_198323 - BLOCK
      ?auto_198322 - BLOCK
      ?auto_198324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198317 ?auto_198318 ) ) ( not ( = ?auto_198317 ?auto_198319 ) ) ( not ( = ?auto_198318 ?auto_198319 ) ) ( not ( = ?auto_198317 ?auto_198320 ) ) ( not ( = ?auto_198318 ?auto_198320 ) ) ( not ( = ?auto_198319 ?auto_198320 ) ) ( ON-TABLE ?auto_198325 ) ( not ( = ?auto_198325 ?auto_198321 ) ) ( not ( = ?auto_198325 ?auto_198323 ) ) ( not ( = ?auto_198325 ?auto_198322 ) ) ( not ( = ?auto_198325 ?auto_198320 ) ) ( not ( = ?auto_198325 ?auto_198319 ) ) ( not ( = ?auto_198325 ?auto_198318 ) ) ( not ( = ?auto_198321 ?auto_198323 ) ) ( not ( = ?auto_198321 ?auto_198322 ) ) ( not ( = ?auto_198321 ?auto_198320 ) ) ( not ( = ?auto_198321 ?auto_198319 ) ) ( not ( = ?auto_198321 ?auto_198318 ) ) ( not ( = ?auto_198323 ?auto_198322 ) ) ( not ( = ?auto_198323 ?auto_198320 ) ) ( not ( = ?auto_198323 ?auto_198319 ) ) ( not ( = ?auto_198323 ?auto_198318 ) ) ( not ( = ?auto_198322 ?auto_198320 ) ) ( not ( = ?auto_198322 ?auto_198319 ) ) ( not ( = ?auto_198322 ?auto_198318 ) ) ( not ( = ?auto_198317 ?auto_198325 ) ) ( not ( = ?auto_198317 ?auto_198321 ) ) ( not ( = ?auto_198317 ?auto_198323 ) ) ( not ( = ?auto_198317 ?auto_198322 ) ) ( ON ?auto_198317 ?auto_198324 ) ( not ( = ?auto_198317 ?auto_198324 ) ) ( not ( = ?auto_198318 ?auto_198324 ) ) ( not ( = ?auto_198319 ?auto_198324 ) ) ( not ( = ?auto_198320 ?auto_198324 ) ) ( not ( = ?auto_198325 ?auto_198324 ) ) ( not ( = ?auto_198321 ?auto_198324 ) ) ( not ( = ?auto_198323 ?auto_198324 ) ) ( not ( = ?auto_198322 ?auto_198324 ) ) ( ON ?auto_198318 ?auto_198317 ) ( ON-TABLE ?auto_198324 ) ( ON ?auto_198319 ?auto_198318 ) ( ON ?auto_198320 ?auto_198319 ) ( ON ?auto_198322 ?auto_198320 ) ( ON ?auto_198323 ?auto_198322 ) ( CLEAR ?auto_198323 ) ( HOLDING ?auto_198321 ) ( CLEAR ?auto_198325 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198325 ?auto_198321 )
      ( MAKE-3PILE ?auto_198317 ?auto_198318 ?auto_198319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198326 - BLOCK
      ?auto_198327 - BLOCK
      ?auto_198328 - BLOCK
    )
    :vars
    (
      ?auto_198329 - BLOCK
      ?auto_198330 - BLOCK
      ?auto_198331 - BLOCK
      ?auto_198334 - BLOCK
      ?auto_198333 - BLOCK
      ?auto_198332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198326 ?auto_198327 ) ) ( not ( = ?auto_198326 ?auto_198328 ) ) ( not ( = ?auto_198327 ?auto_198328 ) ) ( not ( = ?auto_198326 ?auto_198329 ) ) ( not ( = ?auto_198327 ?auto_198329 ) ) ( not ( = ?auto_198328 ?auto_198329 ) ) ( ON-TABLE ?auto_198330 ) ( not ( = ?auto_198330 ?auto_198331 ) ) ( not ( = ?auto_198330 ?auto_198334 ) ) ( not ( = ?auto_198330 ?auto_198333 ) ) ( not ( = ?auto_198330 ?auto_198329 ) ) ( not ( = ?auto_198330 ?auto_198328 ) ) ( not ( = ?auto_198330 ?auto_198327 ) ) ( not ( = ?auto_198331 ?auto_198334 ) ) ( not ( = ?auto_198331 ?auto_198333 ) ) ( not ( = ?auto_198331 ?auto_198329 ) ) ( not ( = ?auto_198331 ?auto_198328 ) ) ( not ( = ?auto_198331 ?auto_198327 ) ) ( not ( = ?auto_198334 ?auto_198333 ) ) ( not ( = ?auto_198334 ?auto_198329 ) ) ( not ( = ?auto_198334 ?auto_198328 ) ) ( not ( = ?auto_198334 ?auto_198327 ) ) ( not ( = ?auto_198333 ?auto_198329 ) ) ( not ( = ?auto_198333 ?auto_198328 ) ) ( not ( = ?auto_198333 ?auto_198327 ) ) ( not ( = ?auto_198326 ?auto_198330 ) ) ( not ( = ?auto_198326 ?auto_198331 ) ) ( not ( = ?auto_198326 ?auto_198334 ) ) ( not ( = ?auto_198326 ?auto_198333 ) ) ( ON ?auto_198326 ?auto_198332 ) ( not ( = ?auto_198326 ?auto_198332 ) ) ( not ( = ?auto_198327 ?auto_198332 ) ) ( not ( = ?auto_198328 ?auto_198332 ) ) ( not ( = ?auto_198329 ?auto_198332 ) ) ( not ( = ?auto_198330 ?auto_198332 ) ) ( not ( = ?auto_198331 ?auto_198332 ) ) ( not ( = ?auto_198334 ?auto_198332 ) ) ( not ( = ?auto_198333 ?auto_198332 ) ) ( ON ?auto_198327 ?auto_198326 ) ( ON-TABLE ?auto_198332 ) ( ON ?auto_198328 ?auto_198327 ) ( ON ?auto_198329 ?auto_198328 ) ( ON ?auto_198333 ?auto_198329 ) ( ON ?auto_198334 ?auto_198333 ) ( CLEAR ?auto_198330 ) ( ON ?auto_198331 ?auto_198334 ) ( CLEAR ?auto_198331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198332 ?auto_198326 ?auto_198327 ?auto_198328 ?auto_198329 ?auto_198333 ?auto_198334 )
      ( MAKE-3PILE ?auto_198326 ?auto_198327 ?auto_198328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198335 - BLOCK
      ?auto_198336 - BLOCK
      ?auto_198337 - BLOCK
    )
    :vars
    (
      ?auto_198341 - BLOCK
      ?auto_198342 - BLOCK
      ?auto_198339 - BLOCK
      ?auto_198343 - BLOCK
      ?auto_198338 - BLOCK
      ?auto_198340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198335 ?auto_198336 ) ) ( not ( = ?auto_198335 ?auto_198337 ) ) ( not ( = ?auto_198336 ?auto_198337 ) ) ( not ( = ?auto_198335 ?auto_198341 ) ) ( not ( = ?auto_198336 ?auto_198341 ) ) ( not ( = ?auto_198337 ?auto_198341 ) ) ( not ( = ?auto_198342 ?auto_198339 ) ) ( not ( = ?auto_198342 ?auto_198343 ) ) ( not ( = ?auto_198342 ?auto_198338 ) ) ( not ( = ?auto_198342 ?auto_198341 ) ) ( not ( = ?auto_198342 ?auto_198337 ) ) ( not ( = ?auto_198342 ?auto_198336 ) ) ( not ( = ?auto_198339 ?auto_198343 ) ) ( not ( = ?auto_198339 ?auto_198338 ) ) ( not ( = ?auto_198339 ?auto_198341 ) ) ( not ( = ?auto_198339 ?auto_198337 ) ) ( not ( = ?auto_198339 ?auto_198336 ) ) ( not ( = ?auto_198343 ?auto_198338 ) ) ( not ( = ?auto_198343 ?auto_198341 ) ) ( not ( = ?auto_198343 ?auto_198337 ) ) ( not ( = ?auto_198343 ?auto_198336 ) ) ( not ( = ?auto_198338 ?auto_198341 ) ) ( not ( = ?auto_198338 ?auto_198337 ) ) ( not ( = ?auto_198338 ?auto_198336 ) ) ( not ( = ?auto_198335 ?auto_198342 ) ) ( not ( = ?auto_198335 ?auto_198339 ) ) ( not ( = ?auto_198335 ?auto_198343 ) ) ( not ( = ?auto_198335 ?auto_198338 ) ) ( ON ?auto_198335 ?auto_198340 ) ( not ( = ?auto_198335 ?auto_198340 ) ) ( not ( = ?auto_198336 ?auto_198340 ) ) ( not ( = ?auto_198337 ?auto_198340 ) ) ( not ( = ?auto_198341 ?auto_198340 ) ) ( not ( = ?auto_198342 ?auto_198340 ) ) ( not ( = ?auto_198339 ?auto_198340 ) ) ( not ( = ?auto_198343 ?auto_198340 ) ) ( not ( = ?auto_198338 ?auto_198340 ) ) ( ON ?auto_198336 ?auto_198335 ) ( ON-TABLE ?auto_198340 ) ( ON ?auto_198337 ?auto_198336 ) ( ON ?auto_198341 ?auto_198337 ) ( ON ?auto_198338 ?auto_198341 ) ( ON ?auto_198343 ?auto_198338 ) ( ON ?auto_198339 ?auto_198343 ) ( CLEAR ?auto_198339 ) ( HOLDING ?auto_198342 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198342 )
      ( MAKE-3PILE ?auto_198335 ?auto_198336 ?auto_198337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198344 - BLOCK
      ?auto_198345 - BLOCK
      ?auto_198346 - BLOCK
    )
    :vars
    (
      ?auto_198352 - BLOCK
      ?auto_198348 - BLOCK
      ?auto_198351 - BLOCK
      ?auto_198349 - BLOCK
      ?auto_198350 - BLOCK
      ?auto_198347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198344 ?auto_198345 ) ) ( not ( = ?auto_198344 ?auto_198346 ) ) ( not ( = ?auto_198345 ?auto_198346 ) ) ( not ( = ?auto_198344 ?auto_198352 ) ) ( not ( = ?auto_198345 ?auto_198352 ) ) ( not ( = ?auto_198346 ?auto_198352 ) ) ( not ( = ?auto_198348 ?auto_198351 ) ) ( not ( = ?auto_198348 ?auto_198349 ) ) ( not ( = ?auto_198348 ?auto_198350 ) ) ( not ( = ?auto_198348 ?auto_198352 ) ) ( not ( = ?auto_198348 ?auto_198346 ) ) ( not ( = ?auto_198348 ?auto_198345 ) ) ( not ( = ?auto_198351 ?auto_198349 ) ) ( not ( = ?auto_198351 ?auto_198350 ) ) ( not ( = ?auto_198351 ?auto_198352 ) ) ( not ( = ?auto_198351 ?auto_198346 ) ) ( not ( = ?auto_198351 ?auto_198345 ) ) ( not ( = ?auto_198349 ?auto_198350 ) ) ( not ( = ?auto_198349 ?auto_198352 ) ) ( not ( = ?auto_198349 ?auto_198346 ) ) ( not ( = ?auto_198349 ?auto_198345 ) ) ( not ( = ?auto_198350 ?auto_198352 ) ) ( not ( = ?auto_198350 ?auto_198346 ) ) ( not ( = ?auto_198350 ?auto_198345 ) ) ( not ( = ?auto_198344 ?auto_198348 ) ) ( not ( = ?auto_198344 ?auto_198351 ) ) ( not ( = ?auto_198344 ?auto_198349 ) ) ( not ( = ?auto_198344 ?auto_198350 ) ) ( ON ?auto_198344 ?auto_198347 ) ( not ( = ?auto_198344 ?auto_198347 ) ) ( not ( = ?auto_198345 ?auto_198347 ) ) ( not ( = ?auto_198346 ?auto_198347 ) ) ( not ( = ?auto_198352 ?auto_198347 ) ) ( not ( = ?auto_198348 ?auto_198347 ) ) ( not ( = ?auto_198351 ?auto_198347 ) ) ( not ( = ?auto_198349 ?auto_198347 ) ) ( not ( = ?auto_198350 ?auto_198347 ) ) ( ON ?auto_198345 ?auto_198344 ) ( ON-TABLE ?auto_198347 ) ( ON ?auto_198346 ?auto_198345 ) ( ON ?auto_198352 ?auto_198346 ) ( ON ?auto_198350 ?auto_198352 ) ( ON ?auto_198349 ?auto_198350 ) ( ON ?auto_198351 ?auto_198349 ) ( ON ?auto_198348 ?auto_198351 ) ( CLEAR ?auto_198348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198347 ?auto_198344 ?auto_198345 ?auto_198346 ?auto_198352 ?auto_198350 ?auto_198349 ?auto_198351 )
      ( MAKE-3PILE ?auto_198344 ?auto_198345 ?auto_198346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198357 - BLOCK
      ?auto_198358 - BLOCK
      ?auto_198359 - BLOCK
      ?auto_198360 - BLOCK
    )
    :vars
    (
      ?auto_198361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198361 ?auto_198360 ) ( CLEAR ?auto_198361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198357 ) ( ON ?auto_198358 ?auto_198357 ) ( ON ?auto_198359 ?auto_198358 ) ( ON ?auto_198360 ?auto_198359 ) ( not ( = ?auto_198357 ?auto_198358 ) ) ( not ( = ?auto_198357 ?auto_198359 ) ) ( not ( = ?auto_198357 ?auto_198360 ) ) ( not ( = ?auto_198357 ?auto_198361 ) ) ( not ( = ?auto_198358 ?auto_198359 ) ) ( not ( = ?auto_198358 ?auto_198360 ) ) ( not ( = ?auto_198358 ?auto_198361 ) ) ( not ( = ?auto_198359 ?auto_198360 ) ) ( not ( = ?auto_198359 ?auto_198361 ) ) ( not ( = ?auto_198360 ?auto_198361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198361 ?auto_198360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198362 - BLOCK
      ?auto_198363 - BLOCK
      ?auto_198364 - BLOCK
      ?auto_198365 - BLOCK
    )
    :vars
    (
      ?auto_198366 - BLOCK
      ?auto_198367 - BLOCK
      ?auto_198368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198366 ?auto_198365 ) ( CLEAR ?auto_198366 ) ( ON-TABLE ?auto_198362 ) ( ON ?auto_198363 ?auto_198362 ) ( ON ?auto_198364 ?auto_198363 ) ( ON ?auto_198365 ?auto_198364 ) ( not ( = ?auto_198362 ?auto_198363 ) ) ( not ( = ?auto_198362 ?auto_198364 ) ) ( not ( = ?auto_198362 ?auto_198365 ) ) ( not ( = ?auto_198362 ?auto_198366 ) ) ( not ( = ?auto_198363 ?auto_198364 ) ) ( not ( = ?auto_198363 ?auto_198365 ) ) ( not ( = ?auto_198363 ?auto_198366 ) ) ( not ( = ?auto_198364 ?auto_198365 ) ) ( not ( = ?auto_198364 ?auto_198366 ) ) ( not ( = ?auto_198365 ?auto_198366 ) ) ( HOLDING ?auto_198367 ) ( CLEAR ?auto_198368 ) ( not ( = ?auto_198362 ?auto_198367 ) ) ( not ( = ?auto_198362 ?auto_198368 ) ) ( not ( = ?auto_198363 ?auto_198367 ) ) ( not ( = ?auto_198363 ?auto_198368 ) ) ( not ( = ?auto_198364 ?auto_198367 ) ) ( not ( = ?auto_198364 ?auto_198368 ) ) ( not ( = ?auto_198365 ?auto_198367 ) ) ( not ( = ?auto_198365 ?auto_198368 ) ) ( not ( = ?auto_198366 ?auto_198367 ) ) ( not ( = ?auto_198366 ?auto_198368 ) ) ( not ( = ?auto_198367 ?auto_198368 ) ) )
    :subtasks
    ( ( !STACK ?auto_198367 ?auto_198368 )
      ( MAKE-4PILE ?auto_198362 ?auto_198363 ?auto_198364 ?auto_198365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198369 - BLOCK
      ?auto_198370 - BLOCK
      ?auto_198371 - BLOCK
      ?auto_198372 - BLOCK
    )
    :vars
    (
      ?auto_198373 - BLOCK
      ?auto_198375 - BLOCK
      ?auto_198374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198373 ?auto_198372 ) ( ON-TABLE ?auto_198369 ) ( ON ?auto_198370 ?auto_198369 ) ( ON ?auto_198371 ?auto_198370 ) ( ON ?auto_198372 ?auto_198371 ) ( not ( = ?auto_198369 ?auto_198370 ) ) ( not ( = ?auto_198369 ?auto_198371 ) ) ( not ( = ?auto_198369 ?auto_198372 ) ) ( not ( = ?auto_198369 ?auto_198373 ) ) ( not ( = ?auto_198370 ?auto_198371 ) ) ( not ( = ?auto_198370 ?auto_198372 ) ) ( not ( = ?auto_198370 ?auto_198373 ) ) ( not ( = ?auto_198371 ?auto_198372 ) ) ( not ( = ?auto_198371 ?auto_198373 ) ) ( not ( = ?auto_198372 ?auto_198373 ) ) ( CLEAR ?auto_198375 ) ( not ( = ?auto_198369 ?auto_198374 ) ) ( not ( = ?auto_198369 ?auto_198375 ) ) ( not ( = ?auto_198370 ?auto_198374 ) ) ( not ( = ?auto_198370 ?auto_198375 ) ) ( not ( = ?auto_198371 ?auto_198374 ) ) ( not ( = ?auto_198371 ?auto_198375 ) ) ( not ( = ?auto_198372 ?auto_198374 ) ) ( not ( = ?auto_198372 ?auto_198375 ) ) ( not ( = ?auto_198373 ?auto_198374 ) ) ( not ( = ?auto_198373 ?auto_198375 ) ) ( not ( = ?auto_198374 ?auto_198375 ) ) ( ON ?auto_198374 ?auto_198373 ) ( CLEAR ?auto_198374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198369 ?auto_198370 ?auto_198371 ?auto_198372 ?auto_198373 )
      ( MAKE-4PILE ?auto_198369 ?auto_198370 ?auto_198371 ?auto_198372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198376 - BLOCK
      ?auto_198377 - BLOCK
      ?auto_198378 - BLOCK
      ?auto_198379 - BLOCK
    )
    :vars
    (
      ?auto_198381 - BLOCK
      ?auto_198382 - BLOCK
      ?auto_198380 - BLOCK
      ?auto_198383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198381 ?auto_198379 ) ( ON-TABLE ?auto_198376 ) ( ON ?auto_198377 ?auto_198376 ) ( ON ?auto_198378 ?auto_198377 ) ( ON ?auto_198379 ?auto_198378 ) ( not ( = ?auto_198376 ?auto_198377 ) ) ( not ( = ?auto_198376 ?auto_198378 ) ) ( not ( = ?auto_198376 ?auto_198379 ) ) ( not ( = ?auto_198376 ?auto_198381 ) ) ( not ( = ?auto_198377 ?auto_198378 ) ) ( not ( = ?auto_198377 ?auto_198379 ) ) ( not ( = ?auto_198377 ?auto_198381 ) ) ( not ( = ?auto_198378 ?auto_198379 ) ) ( not ( = ?auto_198378 ?auto_198381 ) ) ( not ( = ?auto_198379 ?auto_198381 ) ) ( not ( = ?auto_198376 ?auto_198382 ) ) ( not ( = ?auto_198376 ?auto_198380 ) ) ( not ( = ?auto_198377 ?auto_198382 ) ) ( not ( = ?auto_198377 ?auto_198380 ) ) ( not ( = ?auto_198378 ?auto_198382 ) ) ( not ( = ?auto_198378 ?auto_198380 ) ) ( not ( = ?auto_198379 ?auto_198382 ) ) ( not ( = ?auto_198379 ?auto_198380 ) ) ( not ( = ?auto_198381 ?auto_198382 ) ) ( not ( = ?auto_198381 ?auto_198380 ) ) ( not ( = ?auto_198382 ?auto_198380 ) ) ( ON ?auto_198382 ?auto_198381 ) ( CLEAR ?auto_198382 ) ( HOLDING ?auto_198380 ) ( CLEAR ?auto_198383 ) ( ON-TABLE ?auto_198383 ) ( not ( = ?auto_198383 ?auto_198380 ) ) ( not ( = ?auto_198376 ?auto_198383 ) ) ( not ( = ?auto_198377 ?auto_198383 ) ) ( not ( = ?auto_198378 ?auto_198383 ) ) ( not ( = ?auto_198379 ?auto_198383 ) ) ( not ( = ?auto_198381 ?auto_198383 ) ) ( not ( = ?auto_198382 ?auto_198383 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198383 ?auto_198380 )
      ( MAKE-4PILE ?auto_198376 ?auto_198377 ?auto_198378 ?auto_198379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198384 - BLOCK
      ?auto_198385 - BLOCK
      ?auto_198386 - BLOCK
      ?auto_198387 - BLOCK
    )
    :vars
    (
      ?auto_198389 - BLOCK
      ?auto_198391 - BLOCK
      ?auto_198388 - BLOCK
      ?auto_198390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198389 ?auto_198387 ) ( ON-TABLE ?auto_198384 ) ( ON ?auto_198385 ?auto_198384 ) ( ON ?auto_198386 ?auto_198385 ) ( ON ?auto_198387 ?auto_198386 ) ( not ( = ?auto_198384 ?auto_198385 ) ) ( not ( = ?auto_198384 ?auto_198386 ) ) ( not ( = ?auto_198384 ?auto_198387 ) ) ( not ( = ?auto_198384 ?auto_198389 ) ) ( not ( = ?auto_198385 ?auto_198386 ) ) ( not ( = ?auto_198385 ?auto_198387 ) ) ( not ( = ?auto_198385 ?auto_198389 ) ) ( not ( = ?auto_198386 ?auto_198387 ) ) ( not ( = ?auto_198386 ?auto_198389 ) ) ( not ( = ?auto_198387 ?auto_198389 ) ) ( not ( = ?auto_198384 ?auto_198391 ) ) ( not ( = ?auto_198384 ?auto_198388 ) ) ( not ( = ?auto_198385 ?auto_198391 ) ) ( not ( = ?auto_198385 ?auto_198388 ) ) ( not ( = ?auto_198386 ?auto_198391 ) ) ( not ( = ?auto_198386 ?auto_198388 ) ) ( not ( = ?auto_198387 ?auto_198391 ) ) ( not ( = ?auto_198387 ?auto_198388 ) ) ( not ( = ?auto_198389 ?auto_198391 ) ) ( not ( = ?auto_198389 ?auto_198388 ) ) ( not ( = ?auto_198391 ?auto_198388 ) ) ( ON ?auto_198391 ?auto_198389 ) ( CLEAR ?auto_198390 ) ( ON-TABLE ?auto_198390 ) ( not ( = ?auto_198390 ?auto_198388 ) ) ( not ( = ?auto_198384 ?auto_198390 ) ) ( not ( = ?auto_198385 ?auto_198390 ) ) ( not ( = ?auto_198386 ?auto_198390 ) ) ( not ( = ?auto_198387 ?auto_198390 ) ) ( not ( = ?auto_198389 ?auto_198390 ) ) ( not ( = ?auto_198391 ?auto_198390 ) ) ( ON ?auto_198388 ?auto_198391 ) ( CLEAR ?auto_198388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198384 ?auto_198385 ?auto_198386 ?auto_198387 ?auto_198389 ?auto_198391 )
      ( MAKE-4PILE ?auto_198384 ?auto_198385 ?auto_198386 ?auto_198387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198392 - BLOCK
      ?auto_198393 - BLOCK
      ?auto_198394 - BLOCK
      ?auto_198395 - BLOCK
    )
    :vars
    (
      ?auto_198397 - BLOCK
      ?auto_198398 - BLOCK
      ?auto_198399 - BLOCK
      ?auto_198396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198397 ?auto_198395 ) ( ON-TABLE ?auto_198392 ) ( ON ?auto_198393 ?auto_198392 ) ( ON ?auto_198394 ?auto_198393 ) ( ON ?auto_198395 ?auto_198394 ) ( not ( = ?auto_198392 ?auto_198393 ) ) ( not ( = ?auto_198392 ?auto_198394 ) ) ( not ( = ?auto_198392 ?auto_198395 ) ) ( not ( = ?auto_198392 ?auto_198397 ) ) ( not ( = ?auto_198393 ?auto_198394 ) ) ( not ( = ?auto_198393 ?auto_198395 ) ) ( not ( = ?auto_198393 ?auto_198397 ) ) ( not ( = ?auto_198394 ?auto_198395 ) ) ( not ( = ?auto_198394 ?auto_198397 ) ) ( not ( = ?auto_198395 ?auto_198397 ) ) ( not ( = ?auto_198392 ?auto_198398 ) ) ( not ( = ?auto_198392 ?auto_198399 ) ) ( not ( = ?auto_198393 ?auto_198398 ) ) ( not ( = ?auto_198393 ?auto_198399 ) ) ( not ( = ?auto_198394 ?auto_198398 ) ) ( not ( = ?auto_198394 ?auto_198399 ) ) ( not ( = ?auto_198395 ?auto_198398 ) ) ( not ( = ?auto_198395 ?auto_198399 ) ) ( not ( = ?auto_198397 ?auto_198398 ) ) ( not ( = ?auto_198397 ?auto_198399 ) ) ( not ( = ?auto_198398 ?auto_198399 ) ) ( ON ?auto_198398 ?auto_198397 ) ( not ( = ?auto_198396 ?auto_198399 ) ) ( not ( = ?auto_198392 ?auto_198396 ) ) ( not ( = ?auto_198393 ?auto_198396 ) ) ( not ( = ?auto_198394 ?auto_198396 ) ) ( not ( = ?auto_198395 ?auto_198396 ) ) ( not ( = ?auto_198397 ?auto_198396 ) ) ( not ( = ?auto_198398 ?auto_198396 ) ) ( ON ?auto_198399 ?auto_198398 ) ( CLEAR ?auto_198399 ) ( HOLDING ?auto_198396 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198396 )
      ( MAKE-4PILE ?auto_198392 ?auto_198393 ?auto_198394 ?auto_198395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198400 - BLOCK
      ?auto_198401 - BLOCK
      ?auto_198402 - BLOCK
      ?auto_198403 - BLOCK
    )
    :vars
    (
      ?auto_198405 - BLOCK
      ?auto_198407 - BLOCK
      ?auto_198404 - BLOCK
      ?auto_198406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198405 ?auto_198403 ) ( ON-TABLE ?auto_198400 ) ( ON ?auto_198401 ?auto_198400 ) ( ON ?auto_198402 ?auto_198401 ) ( ON ?auto_198403 ?auto_198402 ) ( not ( = ?auto_198400 ?auto_198401 ) ) ( not ( = ?auto_198400 ?auto_198402 ) ) ( not ( = ?auto_198400 ?auto_198403 ) ) ( not ( = ?auto_198400 ?auto_198405 ) ) ( not ( = ?auto_198401 ?auto_198402 ) ) ( not ( = ?auto_198401 ?auto_198403 ) ) ( not ( = ?auto_198401 ?auto_198405 ) ) ( not ( = ?auto_198402 ?auto_198403 ) ) ( not ( = ?auto_198402 ?auto_198405 ) ) ( not ( = ?auto_198403 ?auto_198405 ) ) ( not ( = ?auto_198400 ?auto_198407 ) ) ( not ( = ?auto_198400 ?auto_198404 ) ) ( not ( = ?auto_198401 ?auto_198407 ) ) ( not ( = ?auto_198401 ?auto_198404 ) ) ( not ( = ?auto_198402 ?auto_198407 ) ) ( not ( = ?auto_198402 ?auto_198404 ) ) ( not ( = ?auto_198403 ?auto_198407 ) ) ( not ( = ?auto_198403 ?auto_198404 ) ) ( not ( = ?auto_198405 ?auto_198407 ) ) ( not ( = ?auto_198405 ?auto_198404 ) ) ( not ( = ?auto_198407 ?auto_198404 ) ) ( ON ?auto_198407 ?auto_198405 ) ( not ( = ?auto_198406 ?auto_198404 ) ) ( not ( = ?auto_198400 ?auto_198406 ) ) ( not ( = ?auto_198401 ?auto_198406 ) ) ( not ( = ?auto_198402 ?auto_198406 ) ) ( not ( = ?auto_198403 ?auto_198406 ) ) ( not ( = ?auto_198405 ?auto_198406 ) ) ( not ( = ?auto_198407 ?auto_198406 ) ) ( ON ?auto_198404 ?auto_198407 ) ( ON ?auto_198406 ?auto_198404 ) ( CLEAR ?auto_198406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198400 ?auto_198401 ?auto_198402 ?auto_198403 ?auto_198405 ?auto_198407 ?auto_198404 )
      ( MAKE-4PILE ?auto_198400 ?auto_198401 ?auto_198402 ?auto_198403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198408 - BLOCK
      ?auto_198409 - BLOCK
      ?auto_198410 - BLOCK
      ?auto_198411 - BLOCK
    )
    :vars
    (
      ?auto_198415 - BLOCK
      ?auto_198412 - BLOCK
      ?auto_198413 - BLOCK
      ?auto_198414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198415 ?auto_198411 ) ( ON-TABLE ?auto_198408 ) ( ON ?auto_198409 ?auto_198408 ) ( ON ?auto_198410 ?auto_198409 ) ( ON ?auto_198411 ?auto_198410 ) ( not ( = ?auto_198408 ?auto_198409 ) ) ( not ( = ?auto_198408 ?auto_198410 ) ) ( not ( = ?auto_198408 ?auto_198411 ) ) ( not ( = ?auto_198408 ?auto_198415 ) ) ( not ( = ?auto_198409 ?auto_198410 ) ) ( not ( = ?auto_198409 ?auto_198411 ) ) ( not ( = ?auto_198409 ?auto_198415 ) ) ( not ( = ?auto_198410 ?auto_198411 ) ) ( not ( = ?auto_198410 ?auto_198415 ) ) ( not ( = ?auto_198411 ?auto_198415 ) ) ( not ( = ?auto_198408 ?auto_198412 ) ) ( not ( = ?auto_198408 ?auto_198413 ) ) ( not ( = ?auto_198409 ?auto_198412 ) ) ( not ( = ?auto_198409 ?auto_198413 ) ) ( not ( = ?auto_198410 ?auto_198412 ) ) ( not ( = ?auto_198410 ?auto_198413 ) ) ( not ( = ?auto_198411 ?auto_198412 ) ) ( not ( = ?auto_198411 ?auto_198413 ) ) ( not ( = ?auto_198415 ?auto_198412 ) ) ( not ( = ?auto_198415 ?auto_198413 ) ) ( not ( = ?auto_198412 ?auto_198413 ) ) ( ON ?auto_198412 ?auto_198415 ) ( not ( = ?auto_198414 ?auto_198413 ) ) ( not ( = ?auto_198408 ?auto_198414 ) ) ( not ( = ?auto_198409 ?auto_198414 ) ) ( not ( = ?auto_198410 ?auto_198414 ) ) ( not ( = ?auto_198411 ?auto_198414 ) ) ( not ( = ?auto_198415 ?auto_198414 ) ) ( not ( = ?auto_198412 ?auto_198414 ) ) ( ON ?auto_198413 ?auto_198412 ) ( HOLDING ?auto_198414 ) ( CLEAR ?auto_198413 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198408 ?auto_198409 ?auto_198410 ?auto_198411 ?auto_198415 ?auto_198412 ?auto_198413 ?auto_198414 )
      ( MAKE-4PILE ?auto_198408 ?auto_198409 ?auto_198410 ?auto_198411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198416 - BLOCK
      ?auto_198417 - BLOCK
      ?auto_198418 - BLOCK
      ?auto_198419 - BLOCK
    )
    :vars
    (
      ?auto_198420 - BLOCK
      ?auto_198421 - BLOCK
      ?auto_198423 - BLOCK
      ?auto_198422 - BLOCK
      ?auto_198424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198420 ?auto_198419 ) ( ON-TABLE ?auto_198416 ) ( ON ?auto_198417 ?auto_198416 ) ( ON ?auto_198418 ?auto_198417 ) ( ON ?auto_198419 ?auto_198418 ) ( not ( = ?auto_198416 ?auto_198417 ) ) ( not ( = ?auto_198416 ?auto_198418 ) ) ( not ( = ?auto_198416 ?auto_198419 ) ) ( not ( = ?auto_198416 ?auto_198420 ) ) ( not ( = ?auto_198417 ?auto_198418 ) ) ( not ( = ?auto_198417 ?auto_198419 ) ) ( not ( = ?auto_198417 ?auto_198420 ) ) ( not ( = ?auto_198418 ?auto_198419 ) ) ( not ( = ?auto_198418 ?auto_198420 ) ) ( not ( = ?auto_198419 ?auto_198420 ) ) ( not ( = ?auto_198416 ?auto_198421 ) ) ( not ( = ?auto_198416 ?auto_198423 ) ) ( not ( = ?auto_198417 ?auto_198421 ) ) ( not ( = ?auto_198417 ?auto_198423 ) ) ( not ( = ?auto_198418 ?auto_198421 ) ) ( not ( = ?auto_198418 ?auto_198423 ) ) ( not ( = ?auto_198419 ?auto_198421 ) ) ( not ( = ?auto_198419 ?auto_198423 ) ) ( not ( = ?auto_198420 ?auto_198421 ) ) ( not ( = ?auto_198420 ?auto_198423 ) ) ( not ( = ?auto_198421 ?auto_198423 ) ) ( ON ?auto_198421 ?auto_198420 ) ( not ( = ?auto_198422 ?auto_198423 ) ) ( not ( = ?auto_198416 ?auto_198422 ) ) ( not ( = ?auto_198417 ?auto_198422 ) ) ( not ( = ?auto_198418 ?auto_198422 ) ) ( not ( = ?auto_198419 ?auto_198422 ) ) ( not ( = ?auto_198420 ?auto_198422 ) ) ( not ( = ?auto_198421 ?auto_198422 ) ) ( ON ?auto_198423 ?auto_198421 ) ( CLEAR ?auto_198423 ) ( ON ?auto_198422 ?auto_198424 ) ( CLEAR ?auto_198422 ) ( HAND-EMPTY ) ( not ( = ?auto_198416 ?auto_198424 ) ) ( not ( = ?auto_198417 ?auto_198424 ) ) ( not ( = ?auto_198418 ?auto_198424 ) ) ( not ( = ?auto_198419 ?auto_198424 ) ) ( not ( = ?auto_198420 ?auto_198424 ) ) ( not ( = ?auto_198421 ?auto_198424 ) ) ( not ( = ?auto_198423 ?auto_198424 ) ) ( not ( = ?auto_198422 ?auto_198424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198422 ?auto_198424 )
      ( MAKE-4PILE ?auto_198416 ?auto_198417 ?auto_198418 ?auto_198419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198425 - BLOCK
      ?auto_198426 - BLOCK
      ?auto_198427 - BLOCK
      ?auto_198428 - BLOCK
    )
    :vars
    (
      ?auto_198431 - BLOCK
      ?auto_198432 - BLOCK
      ?auto_198430 - BLOCK
      ?auto_198433 - BLOCK
      ?auto_198429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198431 ?auto_198428 ) ( ON-TABLE ?auto_198425 ) ( ON ?auto_198426 ?auto_198425 ) ( ON ?auto_198427 ?auto_198426 ) ( ON ?auto_198428 ?auto_198427 ) ( not ( = ?auto_198425 ?auto_198426 ) ) ( not ( = ?auto_198425 ?auto_198427 ) ) ( not ( = ?auto_198425 ?auto_198428 ) ) ( not ( = ?auto_198425 ?auto_198431 ) ) ( not ( = ?auto_198426 ?auto_198427 ) ) ( not ( = ?auto_198426 ?auto_198428 ) ) ( not ( = ?auto_198426 ?auto_198431 ) ) ( not ( = ?auto_198427 ?auto_198428 ) ) ( not ( = ?auto_198427 ?auto_198431 ) ) ( not ( = ?auto_198428 ?auto_198431 ) ) ( not ( = ?auto_198425 ?auto_198432 ) ) ( not ( = ?auto_198425 ?auto_198430 ) ) ( not ( = ?auto_198426 ?auto_198432 ) ) ( not ( = ?auto_198426 ?auto_198430 ) ) ( not ( = ?auto_198427 ?auto_198432 ) ) ( not ( = ?auto_198427 ?auto_198430 ) ) ( not ( = ?auto_198428 ?auto_198432 ) ) ( not ( = ?auto_198428 ?auto_198430 ) ) ( not ( = ?auto_198431 ?auto_198432 ) ) ( not ( = ?auto_198431 ?auto_198430 ) ) ( not ( = ?auto_198432 ?auto_198430 ) ) ( ON ?auto_198432 ?auto_198431 ) ( not ( = ?auto_198433 ?auto_198430 ) ) ( not ( = ?auto_198425 ?auto_198433 ) ) ( not ( = ?auto_198426 ?auto_198433 ) ) ( not ( = ?auto_198427 ?auto_198433 ) ) ( not ( = ?auto_198428 ?auto_198433 ) ) ( not ( = ?auto_198431 ?auto_198433 ) ) ( not ( = ?auto_198432 ?auto_198433 ) ) ( ON ?auto_198433 ?auto_198429 ) ( CLEAR ?auto_198433 ) ( not ( = ?auto_198425 ?auto_198429 ) ) ( not ( = ?auto_198426 ?auto_198429 ) ) ( not ( = ?auto_198427 ?auto_198429 ) ) ( not ( = ?auto_198428 ?auto_198429 ) ) ( not ( = ?auto_198431 ?auto_198429 ) ) ( not ( = ?auto_198432 ?auto_198429 ) ) ( not ( = ?auto_198430 ?auto_198429 ) ) ( not ( = ?auto_198433 ?auto_198429 ) ) ( HOLDING ?auto_198430 ) ( CLEAR ?auto_198432 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198425 ?auto_198426 ?auto_198427 ?auto_198428 ?auto_198431 ?auto_198432 ?auto_198430 )
      ( MAKE-4PILE ?auto_198425 ?auto_198426 ?auto_198427 ?auto_198428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198434 - BLOCK
      ?auto_198435 - BLOCK
      ?auto_198436 - BLOCK
      ?auto_198437 - BLOCK
    )
    :vars
    (
      ?auto_198441 - BLOCK
      ?auto_198438 - BLOCK
      ?auto_198439 - BLOCK
      ?auto_198440 - BLOCK
      ?auto_198442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198441 ?auto_198437 ) ( ON-TABLE ?auto_198434 ) ( ON ?auto_198435 ?auto_198434 ) ( ON ?auto_198436 ?auto_198435 ) ( ON ?auto_198437 ?auto_198436 ) ( not ( = ?auto_198434 ?auto_198435 ) ) ( not ( = ?auto_198434 ?auto_198436 ) ) ( not ( = ?auto_198434 ?auto_198437 ) ) ( not ( = ?auto_198434 ?auto_198441 ) ) ( not ( = ?auto_198435 ?auto_198436 ) ) ( not ( = ?auto_198435 ?auto_198437 ) ) ( not ( = ?auto_198435 ?auto_198441 ) ) ( not ( = ?auto_198436 ?auto_198437 ) ) ( not ( = ?auto_198436 ?auto_198441 ) ) ( not ( = ?auto_198437 ?auto_198441 ) ) ( not ( = ?auto_198434 ?auto_198438 ) ) ( not ( = ?auto_198434 ?auto_198439 ) ) ( not ( = ?auto_198435 ?auto_198438 ) ) ( not ( = ?auto_198435 ?auto_198439 ) ) ( not ( = ?auto_198436 ?auto_198438 ) ) ( not ( = ?auto_198436 ?auto_198439 ) ) ( not ( = ?auto_198437 ?auto_198438 ) ) ( not ( = ?auto_198437 ?auto_198439 ) ) ( not ( = ?auto_198441 ?auto_198438 ) ) ( not ( = ?auto_198441 ?auto_198439 ) ) ( not ( = ?auto_198438 ?auto_198439 ) ) ( ON ?auto_198438 ?auto_198441 ) ( not ( = ?auto_198440 ?auto_198439 ) ) ( not ( = ?auto_198434 ?auto_198440 ) ) ( not ( = ?auto_198435 ?auto_198440 ) ) ( not ( = ?auto_198436 ?auto_198440 ) ) ( not ( = ?auto_198437 ?auto_198440 ) ) ( not ( = ?auto_198441 ?auto_198440 ) ) ( not ( = ?auto_198438 ?auto_198440 ) ) ( ON ?auto_198440 ?auto_198442 ) ( not ( = ?auto_198434 ?auto_198442 ) ) ( not ( = ?auto_198435 ?auto_198442 ) ) ( not ( = ?auto_198436 ?auto_198442 ) ) ( not ( = ?auto_198437 ?auto_198442 ) ) ( not ( = ?auto_198441 ?auto_198442 ) ) ( not ( = ?auto_198438 ?auto_198442 ) ) ( not ( = ?auto_198439 ?auto_198442 ) ) ( not ( = ?auto_198440 ?auto_198442 ) ) ( CLEAR ?auto_198438 ) ( ON ?auto_198439 ?auto_198440 ) ( CLEAR ?auto_198439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198442 ?auto_198440 )
      ( MAKE-4PILE ?auto_198434 ?auto_198435 ?auto_198436 ?auto_198437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198443 - BLOCK
      ?auto_198444 - BLOCK
      ?auto_198445 - BLOCK
      ?auto_198446 - BLOCK
    )
    :vars
    (
      ?auto_198447 - BLOCK
      ?auto_198450 - BLOCK
      ?auto_198451 - BLOCK
      ?auto_198448 - BLOCK
      ?auto_198449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198447 ?auto_198446 ) ( ON-TABLE ?auto_198443 ) ( ON ?auto_198444 ?auto_198443 ) ( ON ?auto_198445 ?auto_198444 ) ( ON ?auto_198446 ?auto_198445 ) ( not ( = ?auto_198443 ?auto_198444 ) ) ( not ( = ?auto_198443 ?auto_198445 ) ) ( not ( = ?auto_198443 ?auto_198446 ) ) ( not ( = ?auto_198443 ?auto_198447 ) ) ( not ( = ?auto_198444 ?auto_198445 ) ) ( not ( = ?auto_198444 ?auto_198446 ) ) ( not ( = ?auto_198444 ?auto_198447 ) ) ( not ( = ?auto_198445 ?auto_198446 ) ) ( not ( = ?auto_198445 ?auto_198447 ) ) ( not ( = ?auto_198446 ?auto_198447 ) ) ( not ( = ?auto_198443 ?auto_198450 ) ) ( not ( = ?auto_198443 ?auto_198451 ) ) ( not ( = ?auto_198444 ?auto_198450 ) ) ( not ( = ?auto_198444 ?auto_198451 ) ) ( not ( = ?auto_198445 ?auto_198450 ) ) ( not ( = ?auto_198445 ?auto_198451 ) ) ( not ( = ?auto_198446 ?auto_198450 ) ) ( not ( = ?auto_198446 ?auto_198451 ) ) ( not ( = ?auto_198447 ?auto_198450 ) ) ( not ( = ?auto_198447 ?auto_198451 ) ) ( not ( = ?auto_198450 ?auto_198451 ) ) ( not ( = ?auto_198448 ?auto_198451 ) ) ( not ( = ?auto_198443 ?auto_198448 ) ) ( not ( = ?auto_198444 ?auto_198448 ) ) ( not ( = ?auto_198445 ?auto_198448 ) ) ( not ( = ?auto_198446 ?auto_198448 ) ) ( not ( = ?auto_198447 ?auto_198448 ) ) ( not ( = ?auto_198450 ?auto_198448 ) ) ( ON ?auto_198448 ?auto_198449 ) ( not ( = ?auto_198443 ?auto_198449 ) ) ( not ( = ?auto_198444 ?auto_198449 ) ) ( not ( = ?auto_198445 ?auto_198449 ) ) ( not ( = ?auto_198446 ?auto_198449 ) ) ( not ( = ?auto_198447 ?auto_198449 ) ) ( not ( = ?auto_198450 ?auto_198449 ) ) ( not ( = ?auto_198451 ?auto_198449 ) ) ( not ( = ?auto_198448 ?auto_198449 ) ) ( ON ?auto_198451 ?auto_198448 ) ( CLEAR ?auto_198451 ) ( ON-TABLE ?auto_198449 ) ( HOLDING ?auto_198450 ) ( CLEAR ?auto_198447 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198443 ?auto_198444 ?auto_198445 ?auto_198446 ?auto_198447 ?auto_198450 )
      ( MAKE-4PILE ?auto_198443 ?auto_198444 ?auto_198445 ?auto_198446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198452 - BLOCK
      ?auto_198453 - BLOCK
      ?auto_198454 - BLOCK
      ?auto_198455 - BLOCK
    )
    :vars
    (
      ?auto_198460 - BLOCK
      ?auto_198459 - BLOCK
      ?auto_198457 - BLOCK
      ?auto_198458 - BLOCK
      ?auto_198456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198460 ?auto_198455 ) ( ON-TABLE ?auto_198452 ) ( ON ?auto_198453 ?auto_198452 ) ( ON ?auto_198454 ?auto_198453 ) ( ON ?auto_198455 ?auto_198454 ) ( not ( = ?auto_198452 ?auto_198453 ) ) ( not ( = ?auto_198452 ?auto_198454 ) ) ( not ( = ?auto_198452 ?auto_198455 ) ) ( not ( = ?auto_198452 ?auto_198460 ) ) ( not ( = ?auto_198453 ?auto_198454 ) ) ( not ( = ?auto_198453 ?auto_198455 ) ) ( not ( = ?auto_198453 ?auto_198460 ) ) ( not ( = ?auto_198454 ?auto_198455 ) ) ( not ( = ?auto_198454 ?auto_198460 ) ) ( not ( = ?auto_198455 ?auto_198460 ) ) ( not ( = ?auto_198452 ?auto_198459 ) ) ( not ( = ?auto_198452 ?auto_198457 ) ) ( not ( = ?auto_198453 ?auto_198459 ) ) ( not ( = ?auto_198453 ?auto_198457 ) ) ( not ( = ?auto_198454 ?auto_198459 ) ) ( not ( = ?auto_198454 ?auto_198457 ) ) ( not ( = ?auto_198455 ?auto_198459 ) ) ( not ( = ?auto_198455 ?auto_198457 ) ) ( not ( = ?auto_198460 ?auto_198459 ) ) ( not ( = ?auto_198460 ?auto_198457 ) ) ( not ( = ?auto_198459 ?auto_198457 ) ) ( not ( = ?auto_198458 ?auto_198457 ) ) ( not ( = ?auto_198452 ?auto_198458 ) ) ( not ( = ?auto_198453 ?auto_198458 ) ) ( not ( = ?auto_198454 ?auto_198458 ) ) ( not ( = ?auto_198455 ?auto_198458 ) ) ( not ( = ?auto_198460 ?auto_198458 ) ) ( not ( = ?auto_198459 ?auto_198458 ) ) ( ON ?auto_198458 ?auto_198456 ) ( not ( = ?auto_198452 ?auto_198456 ) ) ( not ( = ?auto_198453 ?auto_198456 ) ) ( not ( = ?auto_198454 ?auto_198456 ) ) ( not ( = ?auto_198455 ?auto_198456 ) ) ( not ( = ?auto_198460 ?auto_198456 ) ) ( not ( = ?auto_198459 ?auto_198456 ) ) ( not ( = ?auto_198457 ?auto_198456 ) ) ( not ( = ?auto_198458 ?auto_198456 ) ) ( ON ?auto_198457 ?auto_198458 ) ( ON-TABLE ?auto_198456 ) ( CLEAR ?auto_198460 ) ( ON ?auto_198459 ?auto_198457 ) ( CLEAR ?auto_198459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198456 ?auto_198458 ?auto_198457 )
      ( MAKE-4PILE ?auto_198452 ?auto_198453 ?auto_198454 ?auto_198455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198479 - BLOCK
      ?auto_198480 - BLOCK
      ?auto_198481 - BLOCK
      ?auto_198482 - BLOCK
    )
    :vars
    (
      ?auto_198485 - BLOCK
      ?auto_198484 - BLOCK
      ?auto_198487 - BLOCK
      ?auto_198483 - BLOCK
      ?auto_198486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198479 ) ( ON ?auto_198480 ?auto_198479 ) ( ON ?auto_198481 ?auto_198480 ) ( not ( = ?auto_198479 ?auto_198480 ) ) ( not ( = ?auto_198479 ?auto_198481 ) ) ( not ( = ?auto_198479 ?auto_198482 ) ) ( not ( = ?auto_198479 ?auto_198485 ) ) ( not ( = ?auto_198480 ?auto_198481 ) ) ( not ( = ?auto_198480 ?auto_198482 ) ) ( not ( = ?auto_198480 ?auto_198485 ) ) ( not ( = ?auto_198481 ?auto_198482 ) ) ( not ( = ?auto_198481 ?auto_198485 ) ) ( not ( = ?auto_198482 ?auto_198485 ) ) ( not ( = ?auto_198479 ?auto_198484 ) ) ( not ( = ?auto_198479 ?auto_198487 ) ) ( not ( = ?auto_198480 ?auto_198484 ) ) ( not ( = ?auto_198480 ?auto_198487 ) ) ( not ( = ?auto_198481 ?auto_198484 ) ) ( not ( = ?auto_198481 ?auto_198487 ) ) ( not ( = ?auto_198482 ?auto_198484 ) ) ( not ( = ?auto_198482 ?auto_198487 ) ) ( not ( = ?auto_198485 ?auto_198484 ) ) ( not ( = ?auto_198485 ?auto_198487 ) ) ( not ( = ?auto_198484 ?auto_198487 ) ) ( not ( = ?auto_198483 ?auto_198487 ) ) ( not ( = ?auto_198479 ?auto_198483 ) ) ( not ( = ?auto_198480 ?auto_198483 ) ) ( not ( = ?auto_198481 ?auto_198483 ) ) ( not ( = ?auto_198482 ?auto_198483 ) ) ( not ( = ?auto_198485 ?auto_198483 ) ) ( not ( = ?auto_198484 ?auto_198483 ) ) ( ON ?auto_198483 ?auto_198486 ) ( not ( = ?auto_198479 ?auto_198486 ) ) ( not ( = ?auto_198480 ?auto_198486 ) ) ( not ( = ?auto_198481 ?auto_198486 ) ) ( not ( = ?auto_198482 ?auto_198486 ) ) ( not ( = ?auto_198485 ?auto_198486 ) ) ( not ( = ?auto_198484 ?auto_198486 ) ) ( not ( = ?auto_198487 ?auto_198486 ) ) ( not ( = ?auto_198483 ?auto_198486 ) ) ( ON ?auto_198487 ?auto_198483 ) ( ON-TABLE ?auto_198486 ) ( ON ?auto_198484 ?auto_198487 ) ( ON ?auto_198485 ?auto_198484 ) ( CLEAR ?auto_198485 ) ( HOLDING ?auto_198482 ) ( CLEAR ?auto_198481 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198479 ?auto_198480 ?auto_198481 ?auto_198482 ?auto_198485 )
      ( MAKE-4PILE ?auto_198479 ?auto_198480 ?auto_198481 ?auto_198482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198488 - BLOCK
      ?auto_198489 - BLOCK
      ?auto_198490 - BLOCK
      ?auto_198491 - BLOCK
    )
    :vars
    (
      ?auto_198496 - BLOCK
      ?auto_198494 - BLOCK
      ?auto_198493 - BLOCK
      ?auto_198492 - BLOCK
      ?auto_198495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198488 ) ( ON ?auto_198489 ?auto_198488 ) ( ON ?auto_198490 ?auto_198489 ) ( not ( = ?auto_198488 ?auto_198489 ) ) ( not ( = ?auto_198488 ?auto_198490 ) ) ( not ( = ?auto_198488 ?auto_198491 ) ) ( not ( = ?auto_198488 ?auto_198496 ) ) ( not ( = ?auto_198489 ?auto_198490 ) ) ( not ( = ?auto_198489 ?auto_198491 ) ) ( not ( = ?auto_198489 ?auto_198496 ) ) ( not ( = ?auto_198490 ?auto_198491 ) ) ( not ( = ?auto_198490 ?auto_198496 ) ) ( not ( = ?auto_198491 ?auto_198496 ) ) ( not ( = ?auto_198488 ?auto_198494 ) ) ( not ( = ?auto_198488 ?auto_198493 ) ) ( not ( = ?auto_198489 ?auto_198494 ) ) ( not ( = ?auto_198489 ?auto_198493 ) ) ( not ( = ?auto_198490 ?auto_198494 ) ) ( not ( = ?auto_198490 ?auto_198493 ) ) ( not ( = ?auto_198491 ?auto_198494 ) ) ( not ( = ?auto_198491 ?auto_198493 ) ) ( not ( = ?auto_198496 ?auto_198494 ) ) ( not ( = ?auto_198496 ?auto_198493 ) ) ( not ( = ?auto_198494 ?auto_198493 ) ) ( not ( = ?auto_198492 ?auto_198493 ) ) ( not ( = ?auto_198488 ?auto_198492 ) ) ( not ( = ?auto_198489 ?auto_198492 ) ) ( not ( = ?auto_198490 ?auto_198492 ) ) ( not ( = ?auto_198491 ?auto_198492 ) ) ( not ( = ?auto_198496 ?auto_198492 ) ) ( not ( = ?auto_198494 ?auto_198492 ) ) ( ON ?auto_198492 ?auto_198495 ) ( not ( = ?auto_198488 ?auto_198495 ) ) ( not ( = ?auto_198489 ?auto_198495 ) ) ( not ( = ?auto_198490 ?auto_198495 ) ) ( not ( = ?auto_198491 ?auto_198495 ) ) ( not ( = ?auto_198496 ?auto_198495 ) ) ( not ( = ?auto_198494 ?auto_198495 ) ) ( not ( = ?auto_198493 ?auto_198495 ) ) ( not ( = ?auto_198492 ?auto_198495 ) ) ( ON ?auto_198493 ?auto_198492 ) ( ON-TABLE ?auto_198495 ) ( ON ?auto_198494 ?auto_198493 ) ( ON ?auto_198496 ?auto_198494 ) ( CLEAR ?auto_198490 ) ( ON ?auto_198491 ?auto_198496 ) ( CLEAR ?auto_198491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198495 ?auto_198492 ?auto_198493 ?auto_198494 ?auto_198496 )
      ( MAKE-4PILE ?auto_198488 ?auto_198489 ?auto_198490 ?auto_198491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198497 - BLOCK
      ?auto_198498 - BLOCK
      ?auto_198499 - BLOCK
      ?auto_198500 - BLOCK
    )
    :vars
    (
      ?auto_198502 - BLOCK
      ?auto_198503 - BLOCK
      ?auto_198501 - BLOCK
      ?auto_198505 - BLOCK
      ?auto_198504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198497 ) ( ON ?auto_198498 ?auto_198497 ) ( not ( = ?auto_198497 ?auto_198498 ) ) ( not ( = ?auto_198497 ?auto_198499 ) ) ( not ( = ?auto_198497 ?auto_198500 ) ) ( not ( = ?auto_198497 ?auto_198502 ) ) ( not ( = ?auto_198498 ?auto_198499 ) ) ( not ( = ?auto_198498 ?auto_198500 ) ) ( not ( = ?auto_198498 ?auto_198502 ) ) ( not ( = ?auto_198499 ?auto_198500 ) ) ( not ( = ?auto_198499 ?auto_198502 ) ) ( not ( = ?auto_198500 ?auto_198502 ) ) ( not ( = ?auto_198497 ?auto_198503 ) ) ( not ( = ?auto_198497 ?auto_198501 ) ) ( not ( = ?auto_198498 ?auto_198503 ) ) ( not ( = ?auto_198498 ?auto_198501 ) ) ( not ( = ?auto_198499 ?auto_198503 ) ) ( not ( = ?auto_198499 ?auto_198501 ) ) ( not ( = ?auto_198500 ?auto_198503 ) ) ( not ( = ?auto_198500 ?auto_198501 ) ) ( not ( = ?auto_198502 ?auto_198503 ) ) ( not ( = ?auto_198502 ?auto_198501 ) ) ( not ( = ?auto_198503 ?auto_198501 ) ) ( not ( = ?auto_198505 ?auto_198501 ) ) ( not ( = ?auto_198497 ?auto_198505 ) ) ( not ( = ?auto_198498 ?auto_198505 ) ) ( not ( = ?auto_198499 ?auto_198505 ) ) ( not ( = ?auto_198500 ?auto_198505 ) ) ( not ( = ?auto_198502 ?auto_198505 ) ) ( not ( = ?auto_198503 ?auto_198505 ) ) ( ON ?auto_198505 ?auto_198504 ) ( not ( = ?auto_198497 ?auto_198504 ) ) ( not ( = ?auto_198498 ?auto_198504 ) ) ( not ( = ?auto_198499 ?auto_198504 ) ) ( not ( = ?auto_198500 ?auto_198504 ) ) ( not ( = ?auto_198502 ?auto_198504 ) ) ( not ( = ?auto_198503 ?auto_198504 ) ) ( not ( = ?auto_198501 ?auto_198504 ) ) ( not ( = ?auto_198505 ?auto_198504 ) ) ( ON ?auto_198501 ?auto_198505 ) ( ON-TABLE ?auto_198504 ) ( ON ?auto_198503 ?auto_198501 ) ( ON ?auto_198502 ?auto_198503 ) ( ON ?auto_198500 ?auto_198502 ) ( CLEAR ?auto_198500 ) ( HOLDING ?auto_198499 ) ( CLEAR ?auto_198498 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198497 ?auto_198498 ?auto_198499 )
      ( MAKE-4PILE ?auto_198497 ?auto_198498 ?auto_198499 ?auto_198500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198506 - BLOCK
      ?auto_198507 - BLOCK
      ?auto_198508 - BLOCK
      ?auto_198509 - BLOCK
    )
    :vars
    (
      ?auto_198510 - BLOCK
      ?auto_198512 - BLOCK
      ?auto_198511 - BLOCK
      ?auto_198514 - BLOCK
      ?auto_198513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198506 ) ( ON ?auto_198507 ?auto_198506 ) ( not ( = ?auto_198506 ?auto_198507 ) ) ( not ( = ?auto_198506 ?auto_198508 ) ) ( not ( = ?auto_198506 ?auto_198509 ) ) ( not ( = ?auto_198506 ?auto_198510 ) ) ( not ( = ?auto_198507 ?auto_198508 ) ) ( not ( = ?auto_198507 ?auto_198509 ) ) ( not ( = ?auto_198507 ?auto_198510 ) ) ( not ( = ?auto_198508 ?auto_198509 ) ) ( not ( = ?auto_198508 ?auto_198510 ) ) ( not ( = ?auto_198509 ?auto_198510 ) ) ( not ( = ?auto_198506 ?auto_198512 ) ) ( not ( = ?auto_198506 ?auto_198511 ) ) ( not ( = ?auto_198507 ?auto_198512 ) ) ( not ( = ?auto_198507 ?auto_198511 ) ) ( not ( = ?auto_198508 ?auto_198512 ) ) ( not ( = ?auto_198508 ?auto_198511 ) ) ( not ( = ?auto_198509 ?auto_198512 ) ) ( not ( = ?auto_198509 ?auto_198511 ) ) ( not ( = ?auto_198510 ?auto_198512 ) ) ( not ( = ?auto_198510 ?auto_198511 ) ) ( not ( = ?auto_198512 ?auto_198511 ) ) ( not ( = ?auto_198514 ?auto_198511 ) ) ( not ( = ?auto_198506 ?auto_198514 ) ) ( not ( = ?auto_198507 ?auto_198514 ) ) ( not ( = ?auto_198508 ?auto_198514 ) ) ( not ( = ?auto_198509 ?auto_198514 ) ) ( not ( = ?auto_198510 ?auto_198514 ) ) ( not ( = ?auto_198512 ?auto_198514 ) ) ( ON ?auto_198514 ?auto_198513 ) ( not ( = ?auto_198506 ?auto_198513 ) ) ( not ( = ?auto_198507 ?auto_198513 ) ) ( not ( = ?auto_198508 ?auto_198513 ) ) ( not ( = ?auto_198509 ?auto_198513 ) ) ( not ( = ?auto_198510 ?auto_198513 ) ) ( not ( = ?auto_198512 ?auto_198513 ) ) ( not ( = ?auto_198511 ?auto_198513 ) ) ( not ( = ?auto_198514 ?auto_198513 ) ) ( ON ?auto_198511 ?auto_198514 ) ( ON-TABLE ?auto_198513 ) ( ON ?auto_198512 ?auto_198511 ) ( ON ?auto_198510 ?auto_198512 ) ( ON ?auto_198509 ?auto_198510 ) ( CLEAR ?auto_198507 ) ( ON ?auto_198508 ?auto_198509 ) ( CLEAR ?auto_198508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198513 ?auto_198514 ?auto_198511 ?auto_198512 ?auto_198510 ?auto_198509 )
      ( MAKE-4PILE ?auto_198506 ?auto_198507 ?auto_198508 ?auto_198509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198515 - BLOCK
      ?auto_198516 - BLOCK
      ?auto_198517 - BLOCK
      ?auto_198518 - BLOCK
    )
    :vars
    (
      ?auto_198521 - BLOCK
      ?auto_198519 - BLOCK
      ?auto_198522 - BLOCK
      ?auto_198520 - BLOCK
      ?auto_198523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198515 ) ( not ( = ?auto_198515 ?auto_198516 ) ) ( not ( = ?auto_198515 ?auto_198517 ) ) ( not ( = ?auto_198515 ?auto_198518 ) ) ( not ( = ?auto_198515 ?auto_198521 ) ) ( not ( = ?auto_198516 ?auto_198517 ) ) ( not ( = ?auto_198516 ?auto_198518 ) ) ( not ( = ?auto_198516 ?auto_198521 ) ) ( not ( = ?auto_198517 ?auto_198518 ) ) ( not ( = ?auto_198517 ?auto_198521 ) ) ( not ( = ?auto_198518 ?auto_198521 ) ) ( not ( = ?auto_198515 ?auto_198519 ) ) ( not ( = ?auto_198515 ?auto_198522 ) ) ( not ( = ?auto_198516 ?auto_198519 ) ) ( not ( = ?auto_198516 ?auto_198522 ) ) ( not ( = ?auto_198517 ?auto_198519 ) ) ( not ( = ?auto_198517 ?auto_198522 ) ) ( not ( = ?auto_198518 ?auto_198519 ) ) ( not ( = ?auto_198518 ?auto_198522 ) ) ( not ( = ?auto_198521 ?auto_198519 ) ) ( not ( = ?auto_198521 ?auto_198522 ) ) ( not ( = ?auto_198519 ?auto_198522 ) ) ( not ( = ?auto_198520 ?auto_198522 ) ) ( not ( = ?auto_198515 ?auto_198520 ) ) ( not ( = ?auto_198516 ?auto_198520 ) ) ( not ( = ?auto_198517 ?auto_198520 ) ) ( not ( = ?auto_198518 ?auto_198520 ) ) ( not ( = ?auto_198521 ?auto_198520 ) ) ( not ( = ?auto_198519 ?auto_198520 ) ) ( ON ?auto_198520 ?auto_198523 ) ( not ( = ?auto_198515 ?auto_198523 ) ) ( not ( = ?auto_198516 ?auto_198523 ) ) ( not ( = ?auto_198517 ?auto_198523 ) ) ( not ( = ?auto_198518 ?auto_198523 ) ) ( not ( = ?auto_198521 ?auto_198523 ) ) ( not ( = ?auto_198519 ?auto_198523 ) ) ( not ( = ?auto_198522 ?auto_198523 ) ) ( not ( = ?auto_198520 ?auto_198523 ) ) ( ON ?auto_198522 ?auto_198520 ) ( ON-TABLE ?auto_198523 ) ( ON ?auto_198519 ?auto_198522 ) ( ON ?auto_198521 ?auto_198519 ) ( ON ?auto_198518 ?auto_198521 ) ( ON ?auto_198517 ?auto_198518 ) ( CLEAR ?auto_198517 ) ( HOLDING ?auto_198516 ) ( CLEAR ?auto_198515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198515 ?auto_198516 )
      ( MAKE-4PILE ?auto_198515 ?auto_198516 ?auto_198517 ?auto_198518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198524 - BLOCK
      ?auto_198525 - BLOCK
      ?auto_198526 - BLOCK
      ?auto_198527 - BLOCK
    )
    :vars
    (
      ?auto_198532 - BLOCK
      ?auto_198528 - BLOCK
      ?auto_198529 - BLOCK
      ?auto_198530 - BLOCK
      ?auto_198531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198524 ) ( not ( = ?auto_198524 ?auto_198525 ) ) ( not ( = ?auto_198524 ?auto_198526 ) ) ( not ( = ?auto_198524 ?auto_198527 ) ) ( not ( = ?auto_198524 ?auto_198532 ) ) ( not ( = ?auto_198525 ?auto_198526 ) ) ( not ( = ?auto_198525 ?auto_198527 ) ) ( not ( = ?auto_198525 ?auto_198532 ) ) ( not ( = ?auto_198526 ?auto_198527 ) ) ( not ( = ?auto_198526 ?auto_198532 ) ) ( not ( = ?auto_198527 ?auto_198532 ) ) ( not ( = ?auto_198524 ?auto_198528 ) ) ( not ( = ?auto_198524 ?auto_198529 ) ) ( not ( = ?auto_198525 ?auto_198528 ) ) ( not ( = ?auto_198525 ?auto_198529 ) ) ( not ( = ?auto_198526 ?auto_198528 ) ) ( not ( = ?auto_198526 ?auto_198529 ) ) ( not ( = ?auto_198527 ?auto_198528 ) ) ( not ( = ?auto_198527 ?auto_198529 ) ) ( not ( = ?auto_198532 ?auto_198528 ) ) ( not ( = ?auto_198532 ?auto_198529 ) ) ( not ( = ?auto_198528 ?auto_198529 ) ) ( not ( = ?auto_198530 ?auto_198529 ) ) ( not ( = ?auto_198524 ?auto_198530 ) ) ( not ( = ?auto_198525 ?auto_198530 ) ) ( not ( = ?auto_198526 ?auto_198530 ) ) ( not ( = ?auto_198527 ?auto_198530 ) ) ( not ( = ?auto_198532 ?auto_198530 ) ) ( not ( = ?auto_198528 ?auto_198530 ) ) ( ON ?auto_198530 ?auto_198531 ) ( not ( = ?auto_198524 ?auto_198531 ) ) ( not ( = ?auto_198525 ?auto_198531 ) ) ( not ( = ?auto_198526 ?auto_198531 ) ) ( not ( = ?auto_198527 ?auto_198531 ) ) ( not ( = ?auto_198532 ?auto_198531 ) ) ( not ( = ?auto_198528 ?auto_198531 ) ) ( not ( = ?auto_198529 ?auto_198531 ) ) ( not ( = ?auto_198530 ?auto_198531 ) ) ( ON ?auto_198529 ?auto_198530 ) ( ON-TABLE ?auto_198531 ) ( ON ?auto_198528 ?auto_198529 ) ( ON ?auto_198532 ?auto_198528 ) ( ON ?auto_198527 ?auto_198532 ) ( ON ?auto_198526 ?auto_198527 ) ( CLEAR ?auto_198524 ) ( ON ?auto_198525 ?auto_198526 ) ( CLEAR ?auto_198525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198531 ?auto_198530 ?auto_198529 ?auto_198528 ?auto_198532 ?auto_198527 ?auto_198526 )
      ( MAKE-4PILE ?auto_198524 ?auto_198525 ?auto_198526 ?auto_198527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198533 - BLOCK
      ?auto_198534 - BLOCK
      ?auto_198535 - BLOCK
      ?auto_198536 - BLOCK
    )
    :vars
    (
      ?auto_198537 - BLOCK
      ?auto_198539 - BLOCK
      ?auto_198540 - BLOCK
      ?auto_198541 - BLOCK
      ?auto_198538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198533 ?auto_198534 ) ) ( not ( = ?auto_198533 ?auto_198535 ) ) ( not ( = ?auto_198533 ?auto_198536 ) ) ( not ( = ?auto_198533 ?auto_198537 ) ) ( not ( = ?auto_198534 ?auto_198535 ) ) ( not ( = ?auto_198534 ?auto_198536 ) ) ( not ( = ?auto_198534 ?auto_198537 ) ) ( not ( = ?auto_198535 ?auto_198536 ) ) ( not ( = ?auto_198535 ?auto_198537 ) ) ( not ( = ?auto_198536 ?auto_198537 ) ) ( not ( = ?auto_198533 ?auto_198539 ) ) ( not ( = ?auto_198533 ?auto_198540 ) ) ( not ( = ?auto_198534 ?auto_198539 ) ) ( not ( = ?auto_198534 ?auto_198540 ) ) ( not ( = ?auto_198535 ?auto_198539 ) ) ( not ( = ?auto_198535 ?auto_198540 ) ) ( not ( = ?auto_198536 ?auto_198539 ) ) ( not ( = ?auto_198536 ?auto_198540 ) ) ( not ( = ?auto_198537 ?auto_198539 ) ) ( not ( = ?auto_198537 ?auto_198540 ) ) ( not ( = ?auto_198539 ?auto_198540 ) ) ( not ( = ?auto_198541 ?auto_198540 ) ) ( not ( = ?auto_198533 ?auto_198541 ) ) ( not ( = ?auto_198534 ?auto_198541 ) ) ( not ( = ?auto_198535 ?auto_198541 ) ) ( not ( = ?auto_198536 ?auto_198541 ) ) ( not ( = ?auto_198537 ?auto_198541 ) ) ( not ( = ?auto_198539 ?auto_198541 ) ) ( ON ?auto_198541 ?auto_198538 ) ( not ( = ?auto_198533 ?auto_198538 ) ) ( not ( = ?auto_198534 ?auto_198538 ) ) ( not ( = ?auto_198535 ?auto_198538 ) ) ( not ( = ?auto_198536 ?auto_198538 ) ) ( not ( = ?auto_198537 ?auto_198538 ) ) ( not ( = ?auto_198539 ?auto_198538 ) ) ( not ( = ?auto_198540 ?auto_198538 ) ) ( not ( = ?auto_198541 ?auto_198538 ) ) ( ON ?auto_198540 ?auto_198541 ) ( ON-TABLE ?auto_198538 ) ( ON ?auto_198539 ?auto_198540 ) ( ON ?auto_198537 ?auto_198539 ) ( ON ?auto_198536 ?auto_198537 ) ( ON ?auto_198535 ?auto_198536 ) ( ON ?auto_198534 ?auto_198535 ) ( CLEAR ?auto_198534 ) ( HOLDING ?auto_198533 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198533 )
      ( MAKE-4PILE ?auto_198533 ?auto_198534 ?auto_198535 ?auto_198536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198542 - BLOCK
      ?auto_198543 - BLOCK
      ?auto_198544 - BLOCK
      ?auto_198545 - BLOCK
    )
    :vars
    (
      ?auto_198549 - BLOCK
      ?auto_198550 - BLOCK
      ?auto_198548 - BLOCK
      ?auto_198547 - BLOCK
      ?auto_198546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198542 ?auto_198543 ) ) ( not ( = ?auto_198542 ?auto_198544 ) ) ( not ( = ?auto_198542 ?auto_198545 ) ) ( not ( = ?auto_198542 ?auto_198549 ) ) ( not ( = ?auto_198543 ?auto_198544 ) ) ( not ( = ?auto_198543 ?auto_198545 ) ) ( not ( = ?auto_198543 ?auto_198549 ) ) ( not ( = ?auto_198544 ?auto_198545 ) ) ( not ( = ?auto_198544 ?auto_198549 ) ) ( not ( = ?auto_198545 ?auto_198549 ) ) ( not ( = ?auto_198542 ?auto_198550 ) ) ( not ( = ?auto_198542 ?auto_198548 ) ) ( not ( = ?auto_198543 ?auto_198550 ) ) ( not ( = ?auto_198543 ?auto_198548 ) ) ( not ( = ?auto_198544 ?auto_198550 ) ) ( not ( = ?auto_198544 ?auto_198548 ) ) ( not ( = ?auto_198545 ?auto_198550 ) ) ( not ( = ?auto_198545 ?auto_198548 ) ) ( not ( = ?auto_198549 ?auto_198550 ) ) ( not ( = ?auto_198549 ?auto_198548 ) ) ( not ( = ?auto_198550 ?auto_198548 ) ) ( not ( = ?auto_198547 ?auto_198548 ) ) ( not ( = ?auto_198542 ?auto_198547 ) ) ( not ( = ?auto_198543 ?auto_198547 ) ) ( not ( = ?auto_198544 ?auto_198547 ) ) ( not ( = ?auto_198545 ?auto_198547 ) ) ( not ( = ?auto_198549 ?auto_198547 ) ) ( not ( = ?auto_198550 ?auto_198547 ) ) ( ON ?auto_198547 ?auto_198546 ) ( not ( = ?auto_198542 ?auto_198546 ) ) ( not ( = ?auto_198543 ?auto_198546 ) ) ( not ( = ?auto_198544 ?auto_198546 ) ) ( not ( = ?auto_198545 ?auto_198546 ) ) ( not ( = ?auto_198549 ?auto_198546 ) ) ( not ( = ?auto_198550 ?auto_198546 ) ) ( not ( = ?auto_198548 ?auto_198546 ) ) ( not ( = ?auto_198547 ?auto_198546 ) ) ( ON ?auto_198548 ?auto_198547 ) ( ON-TABLE ?auto_198546 ) ( ON ?auto_198550 ?auto_198548 ) ( ON ?auto_198549 ?auto_198550 ) ( ON ?auto_198545 ?auto_198549 ) ( ON ?auto_198544 ?auto_198545 ) ( ON ?auto_198543 ?auto_198544 ) ( ON ?auto_198542 ?auto_198543 ) ( CLEAR ?auto_198542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198546 ?auto_198547 ?auto_198548 ?auto_198550 ?auto_198549 ?auto_198545 ?auto_198544 ?auto_198543 )
      ( MAKE-4PILE ?auto_198542 ?auto_198543 ?auto_198544 ?auto_198545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198555 - BLOCK
      ?auto_198556 - BLOCK
      ?auto_198557 - BLOCK
      ?auto_198558 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_198558 ) ( CLEAR ?auto_198557 ) ( ON-TABLE ?auto_198555 ) ( ON ?auto_198556 ?auto_198555 ) ( ON ?auto_198557 ?auto_198556 ) ( not ( = ?auto_198555 ?auto_198556 ) ) ( not ( = ?auto_198555 ?auto_198557 ) ) ( not ( = ?auto_198555 ?auto_198558 ) ) ( not ( = ?auto_198556 ?auto_198557 ) ) ( not ( = ?auto_198556 ?auto_198558 ) ) ( not ( = ?auto_198557 ?auto_198558 ) ) )
    :subtasks
    ( ( !STACK ?auto_198558 ?auto_198557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198559 - BLOCK
      ?auto_198560 - BLOCK
      ?auto_198561 - BLOCK
      ?auto_198562 - BLOCK
    )
    :vars
    (
      ?auto_198563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198561 ) ( ON-TABLE ?auto_198559 ) ( ON ?auto_198560 ?auto_198559 ) ( ON ?auto_198561 ?auto_198560 ) ( not ( = ?auto_198559 ?auto_198560 ) ) ( not ( = ?auto_198559 ?auto_198561 ) ) ( not ( = ?auto_198559 ?auto_198562 ) ) ( not ( = ?auto_198560 ?auto_198561 ) ) ( not ( = ?auto_198560 ?auto_198562 ) ) ( not ( = ?auto_198561 ?auto_198562 ) ) ( ON ?auto_198562 ?auto_198563 ) ( CLEAR ?auto_198562 ) ( HAND-EMPTY ) ( not ( = ?auto_198559 ?auto_198563 ) ) ( not ( = ?auto_198560 ?auto_198563 ) ) ( not ( = ?auto_198561 ?auto_198563 ) ) ( not ( = ?auto_198562 ?auto_198563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198562 ?auto_198563 )
      ( MAKE-4PILE ?auto_198559 ?auto_198560 ?auto_198561 ?auto_198562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198564 - BLOCK
      ?auto_198565 - BLOCK
      ?auto_198566 - BLOCK
      ?auto_198567 - BLOCK
    )
    :vars
    (
      ?auto_198568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198564 ) ( ON ?auto_198565 ?auto_198564 ) ( not ( = ?auto_198564 ?auto_198565 ) ) ( not ( = ?auto_198564 ?auto_198566 ) ) ( not ( = ?auto_198564 ?auto_198567 ) ) ( not ( = ?auto_198565 ?auto_198566 ) ) ( not ( = ?auto_198565 ?auto_198567 ) ) ( not ( = ?auto_198566 ?auto_198567 ) ) ( ON ?auto_198567 ?auto_198568 ) ( CLEAR ?auto_198567 ) ( not ( = ?auto_198564 ?auto_198568 ) ) ( not ( = ?auto_198565 ?auto_198568 ) ) ( not ( = ?auto_198566 ?auto_198568 ) ) ( not ( = ?auto_198567 ?auto_198568 ) ) ( HOLDING ?auto_198566 ) ( CLEAR ?auto_198565 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198564 ?auto_198565 ?auto_198566 )
      ( MAKE-4PILE ?auto_198564 ?auto_198565 ?auto_198566 ?auto_198567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198569 - BLOCK
      ?auto_198570 - BLOCK
      ?auto_198571 - BLOCK
      ?auto_198572 - BLOCK
    )
    :vars
    (
      ?auto_198573 - BLOCK
      ?auto_198574 - BLOCK
      ?auto_198576 - BLOCK
      ?auto_198575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198569 ) ( ON ?auto_198570 ?auto_198569 ) ( not ( = ?auto_198569 ?auto_198570 ) ) ( not ( = ?auto_198569 ?auto_198571 ) ) ( not ( = ?auto_198569 ?auto_198572 ) ) ( not ( = ?auto_198570 ?auto_198571 ) ) ( not ( = ?auto_198570 ?auto_198572 ) ) ( not ( = ?auto_198571 ?auto_198572 ) ) ( ON ?auto_198572 ?auto_198573 ) ( not ( = ?auto_198569 ?auto_198573 ) ) ( not ( = ?auto_198570 ?auto_198573 ) ) ( not ( = ?auto_198571 ?auto_198573 ) ) ( not ( = ?auto_198572 ?auto_198573 ) ) ( CLEAR ?auto_198570 ) ( ON ?auto_198571 ?auto_198572 ) ( CLEAR ?auto_198571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198574 ) ( ON ?auto_198576 ?auto_198574 ) ( ON ?auto_198575 ?auto_198576 ) ( ON ?auto_198573 ?auto_198575 ) ( not ( = ?auto_198574 ?auto_198576 ) ) ( not ( = ?auto_198574 ?auto_198575 ) ) ( not ( = ?auto_198574 ?auto_198573 ) ) ( not ( = ?auto_198574 ?auto_198572 ) ) ( not ( = ?auto_198574 ?auto_198571 ) ) ( not ( = ?auto_198576 ?auto_198575 ) ) ( not ( = ?auto_198576 ?auto_198573 ) ) ( not ( = ?auto_198576 ?auto_198572 ) ) ( not ( = ?auto_198576 ?auto_198571 ) ) ( not ( = ?auto_198575 ?auto_198573 ) ) ( not ( = ?auto_198575 ?auto_198572 ) ) ( not ( = ?auto_198575 ?auto_198571 ) ) ( not ( = ?auto_198569 ?auto_198574 ) ) ( not ( = ?auto_198569 ?auto_198576 ) ) ( not ( = ?auto_198569 ?auto_198575 ) ) ( not ( = ?auto_198570 ?auto_198574 ) ) ( not ( = ?auto_198570 ?auto_198576 ) ) ( not ( = ?auto_198570 ?auto_198575 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198574 ?auto_198576 ?auto_198575 ?auto_198573 ?auto_198572 )
      ( MAKE-4PILE ?auto_198569 ?auto_198570 ?auto_198571 ?auto_198572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198577 - BLOCK
      ?auto_198578 - BLOCK
      ?auto_198579 - BLOCK
      ?auto_198580 - BLOCK
    )
    :vars
    (
      ?auto_198581 - BLOCK
      ?auto_198582 - BLOCK
      ?auto_198583 - BLOCK
      ?auto_198584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198577 ) ( not ( = ?auto_198577 ?auto_198578 ) ) ( not ( = ?auto_198577 ?auto_198579 ) ) ( not ( = ?auto_198577 ?auto_198580 ) ) ( not ( = ?auto_198578 ?auto_198579 ) ) ( not ( = ?auto_198578 ?auto_198580 ) ) ( not ( = ?auto_198579 ?auto_198580 ) ) ( ON ?auto_198580 ?auto_198581 ) ( not ( = ?auto_198577 ?auto_198581 ) ) ( not ( = ?auto_198578 ?auto_198581 ) ) ( not ( = ?auto_198579 ?auto_198581 ) ) ( not ( = ?auto_198580 ?auto_198581 ) ) ( ON ?auto_198579 ?auto_198580 ) ( CLEAR ?auto_198579 ) ( ON-TABLE ?auto_198582 ) ( ON ?auto_198583 ?auto_198582 ) ( ON ?auto_198584 ?auto_198583 ) ( ON ?auto_198581 ?auto_198584 ) ( not ( = ?auto_198582 ?auto_198583 ) ) ( not ( = ?auto_198582 ?auto_198584 ) ) ( not ( = ?auto_198582 ?auto_198581 ) ) ( not ( = ?auto_198582 ?auto_198580 ) ) ( not ( = ?auto_198582 ?auto_198579 ) ) ( not ( = ?auto_198583 ?auto_198584 ) ) ( not ( = ?auto_198583 ?auto_198581 ) ) ( not ( = ?auto_198583 ?auto_198580 ) ) ( not ( = ?auto_198583 ?auto_198579 ) ) ( not ( = ?auto_198584 ?auto_198581 ) ) ( not ( = ?auto_198584 ?auto_198580 ) ) ( not ( = ?auto_198584 ?auto_198579 ) ) ( not ( = ?auto_198577 ?auto_198582 ) ) ( not ( = ?auto_198577 ?auto_198583 ) ) ( not ( = ?auto_198577 ?auto_198584 ) ) ( not ( = ?auto_198578 ?auto_198582 ) ) ( not ( = ?auto_198578 ?auto_198583 ) ) ( not ( = ?auto_198578 ?auto_198584 ) ) ( HOLDING ?auto_198578 ) ( CLEAR ?auto_198577 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198577 ?auto_198578 )
      ( MAKE-4PILE ?auto_198577 ?auto_198578 ?auto_198579 ?auto_198580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198585 - BLOCK
      ?auto_198586 - BLOCK
      ?auto_198587 - BLOCK
      ?auto_198588 - BLOCK
    )
    :vars
    (
      ?auto_198589 - BLOCK
      ?auto_198591 - BLOCK
      ?auto_198592 - BLOCK
      ?auto_198590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198585 ) ( not ( = ?auto_198585 ?auto_198586 ) ) ( not ( = ?auto_198585 ?auto_198587 ) ) ( not ( = ?auto_198585 ?auto_198588 ) ) ( not ( = ?auto_198586 ?auto_198587 ) ) ( not ( = ?auto_198586 ?auto_198588 ) ) ( not ( = ?auto_198587 ?auto_198588 ) ) ( ON ?auto_198588 ?auto_198589 ) ( not ( = ?auto_198585 ?auto_198589 ) ) ( not ( = ?auto_198586 ?auto_198589 ) ) ( not ( = ?auto_198587 ?auto_198589 ) ) ( not ( = ?auto_198588 ?auto_198589 ) ) ( ON ?auto_198587 ?auto_198588 ) ( ON-TABLE ?auto_198591 ) ( ON ?auto_198592 ?auto_198591 ) ( ON ?auto_198590 ?auto_198592 ) ( ON ?auto_198589 ?auto_198590 ) ( not ( = ?auto_198591 ?auto_198592 ) ) ( not ( = ?auto_198591 ?auto_198590 ) ) ( not ( = ?auto_198591 ?auto_198589 ) ) ( not ( = ?auto_198591 ?auto_198588 ) ) ( not ( = ?auto_198591 ?auto_198587 ) ) ( not ( = ?auto_198592 ?auto_198590 ) ) ( not ( = ?auto_198592 ?auto_198589 ) ) ( not ( = ?auto_198592 ?auto_198588 ) ) ( not ( = ?auto_198592 ?auto_198587 ) ) ( not ( = ?auto_198590 ?auto_198589 ) ) ( not ( = ?auto_198590 ?auto_198588 ) ) ( not ( = ?auto_198590 ?auto_198587 ) ) ( not ( = ?auto_198585 ?auto_198591 ) ) ( not ( = ?auto_198585 ?auto_198592 ) ) ( not ( = ?auto_198585 ?auto_198590 ) ) ( not ( = ?auto_198586 ?auto_198591 ) ) ( not ( = ?auto_198586 ?auto_198592 ) ) ( not ( = ?auto_198586 ?auto_198590 ) ) ( CLEAR ?auto_198585 ) ( ON ?auto_198586 ?auto_198587 ) ( CLEAR ?auto_198586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198591 ?auto_198592 ?auto_198590 ?auto_198589 ?auto_198588 ?auto_198587 )
      ( MAKE-4PILE ?auto_198585 ?auto_198586 ?auto_198587 ?auto_198588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198593 - BLOCK
      ?auto_198594 - BLOCK
      ?auto_198595 - BLOCK
      ?auto_198596 - BLOCK
    )
    :vars
    (
      ?auto_198597 - BLOCK
      ?auto_198600 - BLOCK
      ?auto_198598 - BLOCK
      ?auto_198599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198593 ?auto_198594 ) ) ( not ( = ?auto_198593 ?auto_198595 ) ) ( not ( = ?auto_198593 ?auto_198596 ) ) ( not ( = ?auto_198594 ?auto_198595 ) ) ( not ( = ?auto_198594 ?auto_198596 ) ) ( not ( = ?auto_198595 ?auto_198596 ) ) ( ON ?auto_198596 ?auto_198597 ) ( not ( = ?auto_198593 ?auto_198597 ) ) ( not ( = ?auto_198594 ?auto_198597 ) ) ( not ( = ?auto_198595 ?auto_198597 ) ) ( not ( = ?auto_198596 ?auto_198597 ) ) ( ON ?auto_198595 ?auto_198596 ) ( ON-TABLE ?auto_198600 ) ( ON ?auto_198598 ?auto_198600 ) ( ON ?auto_198599 ?auto_198598 ) ( ON ?auto_198597 ?auto_198599 ) ( not ( = ?auto_198600 ?auto_198598 ) ) ( not ( = ?auto_198600 ?auto_198599 ) ) ( not ( = ?auto_198600 ?auto_198597 ) ) ( not ( = ?auto_198600 ?auto_198596 ) ) ( not ( = ?auto_198600 ?auto_198595 ) ) ( not ( = ?auto_198598 ?auto_198599 ) ) ( not ( = ?auto_198598 ?auto_198597 ) ) ( not ( = ?auto_198598 ?auto_198596 ) ) ( not ( = ?auto_198598 ?auto_198595 ) ) ( not ( = ?auto_198599 ?auto_198597 ) ) ( not ( = ?auto_198599 ?auto_198596 ) ) ( not ( = ?auto_198599 ?auto_198595 ) ) ( not ( = ?auto_198593 ?auto_198600 ) ) ( not ( = ?auto_198593 ?auto_198598 ) ) ( not ( = ?auto_198593 ?auto_198599 ) ) ( not ( = ?auto_198594 ?auto_198600 ) ) ( not ( = ?auto_198594 ?auto_198598 ) ) ( not ( = ?auto_198594 ?auto_198599 ) ) ( ON ?auto_198594 ?auto_198595 ) ( CLEAR ?auto_198594 ) ( HOLDING ?auto_198593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198593 )
      ( MAKE-4PILE ?auto_198593 ?auto_198594 ?auto_198595 ?auto_198596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198601 - BLOCK
      ?auto_198602 - BLOCK
      ?auto_198603 - BLOCK
      ?auto_198604 - BLOCK
    )
    :vars
    (
      ?auto_198605 - BLOCK
      ?auto_198608 - BLOCK
      ?auto_198607 - BLOCK
      ?auto_198606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198601 ?auto_198602 ) ) ( not ( = ?auto_198601 ?auto_198603 ) ) ( not ( = ?auto_198601 ?auto_198604 ) ) ( not ( = ?auto_198602 ?auto_198603 ) ) ( not ( = ?auto_198602 ?auto_198604 ) ) ( not ( = ?auto_198603 ?auto_198604 ) ) ( ON ?auto_198604 ?auto_198605 ) ( not ( = ?auto_198601 ?auto_198605 ) ) ( not ( = ?auto_198602 ?auto_198605 ) ) ( not ( = ?auto_198603 ?auto_198605 ) ) ( not ( = ?auto_198604 ?auto_198605 ) ) ( ON ?auto_198603 ?auto_198604 ) ( ON-TABLE ?auto_198608 ) ( ON ?auto_198607 ?auto_198608 ) ( ON ?auto_198606 ?auto_198607 ) ( ON ?auto_198605 ?auto_198606 ) ( not ( = ?auto_198608 ?auto_198607 ) ) ( not ( = ?auto_198608 ?auto_198606 ) ) ( not ( = ?auto_198608 ?auto_198605 ) ) ( not ( = ?auto_198608 ?auto_198604 ) ) ( not ( = ?auto_198608 ?auto_198603 ) ) ( not ( = ?auto_198607 ?auto_198606 ) ) ( not ( = ?auto_198607 ?auto_198605 ) ) ( not ( = ?auto_198607 ?auto_198604 ) ) ( not ( = ?auto_198607 ?auto_198603 ) ) ( not ( = ?auto_198606 ?auto_198605 ) ) ( not ( = ?auto_198606 ?auto_198604 ) ) ( not ( = ?auto_198606 ?auto_198603 ) ) ( not ( = ?auto_198601 ?auto_198608 ) ) ( not ( = ?auto_198601 ?auto_198607 ) ) ( not ( = ?auto_198601 ?auto_198606 ) ) ( not ( = ?auto_198602 ?auto_198608 ) ) ( not ( = ?auto_198602 ?auto_198607 ) ) ( not ( = ?auto_198602 ?auto_198606 ) ) ( ON ?auto_198602 ?auto_198603 ) ( ON ?auto_198601 ?auto_198602 ) ( CLEAR ?auto_198601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198608 ?auto_198607 ?auto_198606 ?auto_198605 ?auto_198604 ?auto_198603 ?auto_198602 )
      ( MAKE-4PILE ?auto_198601 ?auto_198602 ?auto_198603 ?auto_198604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198609 - BLOCK
      ?auto_198610 - BLOCK
      ?auto_198611 - BLOCK
      ?auto_198612 - BLOCK
    )
    :vars
    (
      ?auto_198615 - BLOCK
      ?auto_198616 - BLOCK
      ?auto_198614 - BLOCK
      ?auto_198613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198609 ?auto_198610 ) ) ( not ( = ?auto_198609 ?auto_198611 ) ) ( not ( = ?auto_198609 ?auto_198612 ) ) ( not ( = ?auto_198610 ?auto_198611 ) ) ( not ( = ?auto_198610 ?auto_198612 ) ) ( not ( = ?auto_198611 ?auto_198612 ) ) ( ON ?auto_198612 ?auto_198615 ) ( not ( = ?auto_198609 ?auto_198615 ) ) ( not ( = ?auto_198610 ?auto_198615 ) ) ( not ( = ?auto_198611 ?auto_198615 ) ) ( not ( = ?auto_198612 ?auto_198615 ) ) ( ON ?auto_198611 ?auto_198612 ) ( ON-TABLE ?auto_198616 ) ( ON ?auto_198614 ?auto_198616 ) ( ON ?auto_198613 ?auto_198614 ) ( ON ?auto_198615 ?auto_198613 ) ( not ( = ?auto_198616 ?auto_198614 ) ) ( not ( = ?auto_198616 ?auto_198613 ) ) ( not ( = ?auto_198616 ?auto_198615 ) ) ( not ( = ?auto_198616 ?auto_198612 ) ) ( not ( = ?auto_198616 ?auto_198611 ) ) ( not ( = ?auto_198614 ?auto_198613 ) ) ( not ( = ?auto_198614 ?auto_198615 ) ) ( not ( = ?auto_198614 ?auto_198612 ) ) ( not ( = ?auto_198614 ?auto_198611 ) ) ( not ( = ?auto_198613 ?auto_198615 ) ) ( not ( = ?auto_198613 ?auto_198612 ) ) ( not ( = ?auto_198613 ?auto_198611 ) ) ( not ( = ?auto_198609 ?auto_198616 ) ) ( not ( = ?auto_198609 ?auto_198614 ) ) ( not ( = ?auto_198609 ?auto_198613 ) ) ( not ( = ?auto_198610 ?auto_198616 ) ) ( not ( = ?auto_198610 ?auto_198614 ) ) ( not ( = ?auto_198610 ?auto_198613 ) ) ( ON ?auto_198610 ?auto_198611 ) ( HOLDING ?auto_198609 ) ( CLEAR ?auto_198610 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198616 ?auto_198614 ?auto_198613 ?auto_198615 ?auto_198612 ?auto_198611 ?auto_198610 ?auto_198609 )
      ( MAKE-4PILE ?auto_198609 ?auto_198610 ?auto_198611 ?auto_198612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198617 - BLOCK
      ?auto_198618 - BLOCK
      ?auto_198619 - BLOCK
      ?auto_198620 - BLOCK
    )
    :vars
    (
      ?auto_198624 - BLOCK
      ?auto_198622 - BLOCK
      ?auto_198621 - BLOCK
      ?auto_198623 - BLOCK
      ?auto_198625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198617 ?auto_198618 ) ) ( not ( = ?auto_198617 ?auto_198619 ) ) ( not ( = ?auto_198617 ?auto_198620 ) ) ( not ( = ?auto_198618 ?auto_198619 ) ) ( not ( = ?auto_198618 ?auto_198620 ) ) ( not ( = ?auto_198619 ?auto_198620 ) ) ( ON ?auto_198620 ?auto_198624 ) ( not ( = ?auto_198617 ?auto_198624 ) ) ( not ( = ?auto_198618 ?auto_198624 ) ) ( not ( = ?auto_198619 ?auto_198624 ) ) ( not ( = ?auto_198620 ?auto_198624 ) ) ( ON ?auto_198619 ?auto_198620 ) ( ON-TABLE ?auto_198622 ) ( ON ?auto_198621 ?auto_198622 ) ( ON ?auto_198623 ?auto_198621 ) ( ON ?auto_198624 ?auto_198623 ) ( not ( = ?auto_198622 ?auto_198621 ) ) ( not ( = ?auto_198622 ?auto_198623 ) ) ( not ( = ?auto_198622 ?auto_198624 ) ) ( not ( = ?auto_198622 ?auto_198620 ) ) ( not ( = ?auto_198622 ?auto_198619 ) ) ( not ( = ?auto_198621 ?auto_198623 ) ) ( not ( = ?auto_198621 ?auto_198624 ) ) ( not ( = ?auto_198621 ?auto_198620 ) ) ( not ( = ?auto_198621 ?auto_198619 ) ) ( not ( = ?auto_198623 ?auto_198624 ) ) ( not ( = ?auto_198623 ?auto_198620 ) ) ( not ( = ?auto_198623 ?auto_198619 ) ) ( not ( = ?auto_198617 ?auto_198622 ) ) ( not ( = ?auto_198617 ?auto_198621 ) ) ( not ( = ?auto_198617 ?auto_198623 ) ) ( not ( = ?auto_198618 ?auto_198622 ) ) ( not ( = ?auto_198618 ?auto_198621 ) ) ( not ( = ?auto_198618 ?auto_198623 ) ) ( ON ?auto_198618 ?auto_198619 ) ( CLEAR ?auto_198618 ) ( ON ?auto_198617 ?auto_198625 ) ( CLEAR ?auto_198617 ) ( HAND-EMPTY ) ( not ( = ?auto_198617 ?auto_198625 ) ) ( not ( = ?auto_198618 ?auto_198625 ) ) ( not ( = ?auto_198619 ?auto_198625 ) ) ( not ( = ?auto_198620 ?auto_198625 ) ) ( not ( = ?auto_198624 ?auto_198625 ) ) ( not ( = ?auto_198622 ?auto_198625 ) ) ( not ( = ?auto_198621 ?auto_198625 ) ) ( not ( = ?auto_198623 ?auto_198625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198617 ?auto_198625 )
      ( MAKE-4PILE ?auto_198617 ?auto_198618 ?auto_198619 ?auto_198620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198626 - BLOCK
      ?auto_198627 - BLOCK
      ?auto_198628 - BLOCK
      ?auto_198629 - BLOCK
    )
    :vars
    (
      ?auto_198632 - BLOCK
      ?auto_198631 - BLOCK
      ?auto_198634 - BLOCK
      ?auto_198630 - BLOCK
      ?auto_198633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198626 ?auto_198627 ) ) ( not ( = ?auto_198626 ?auto_198628 ) ) ( not ( = ?auto_198626 ?auto_198629 ) ) ( not ( = ?auto_198627 ?auto_198628 ) ) ( not ( = ?auto_198627 ?auto_198629 ) ) ( not ( = ?auto_198628 ?auto_198629 ) ) ( ON ?auto_198629 ?auto_198632 ) ( not ( = ?auto_198626 ?auto_198632 ) ) ( not ( = ?auto_198627 ?auto_198632 ) ) ( not ( = ?auto_198628 ?auto_198632 ) ) ( not ( = ?auto_198629 ?auto_198632 ) ) ( ON ?auto_198628 ?auto_198629 ) ( ON-TABLE ?auto_198631 ) ( ON ?auto_198634 ?auto_198631 ) ( ON ?auto_198630 ?auto_198634 ) ( ON ?auto_198632 ?auto_198630 ) ( not ( = ?auto_198631 ?auto_198634 ) ) ( not ( = ?auto_198631 ?auto_198630 ) ) ( not ( = ?auto_198631 ?auto_198632 ) ) ( not ( = ?auto_198631 ?auto_198629 ) ) ( not ( = ?auto_198631 ?auto_198628 ) ) ( not ( = ?auto_198634 ?auto_198630 ) ) ( not ( = ?auto_198634 ?auto_198632 ) ) ( not ( = ?auto_198634 ?auto_198629 ) ) ( not ( = ?auto_198634 ?auto_198628 ) ) ( not ( = ?auto_198630 ?auto_198632 ) ) ( not ( = ?auto_198630 ?auto_198629 ) ) ( not ( = ?auto_198630 ?auto_198628 ) ) ( not ( = ?auto_198626 ?auto_198631 ) ) ( not ( = ?auto_198626 ?auto_198634 ) ) ( not ( = ?auto_198626 ?auto_198630 ) ) ( not ( = ?auto_198627 ?auto_198631 ) ) ( not ( = ?auto_198627 ?auto_198634 ) ) ( not ( = ?auto_198627 ?auto_198630 ) ) ( ON ?auto_198626 ?auto_198633 ) ( CLEAR ?auto_198626 ) ( not ( = ?auto_198626 ?auto_198633 ) ) ( not ( = ?auto_198627 ?auto_198633 ) ) ( not ( = ?auto_198628 ?auto_198633 ) ) ( not ( = ?auto_198629 ?auto_198633 ) ) ( not ( = ?auto_198632 ?auto_198633 ) ) ( not ( = ?auto_198631 ?auto_198633 ) ) ( not ( = ?auto_198634 ?auto_198633 ) ) ( not ( = ?auto_198630 ?auto_198633 ) ) ( HOLDING ?auto_198627 ) ( CLEAR ?auto_198628 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198631 ?auto_198634 ?auto_198630 ?auto_198632 ?auto_198629 ?auto_198628 ?auto_198627 )
      ( MAKE-4PILE ?auto_198626 ?auto_198627 ?auto_198628 ?auto_198629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198635 - BLOCK
      ?auto_198636 - BLOCK
      ?auto_198637 - BLOCK
      ?auto_198638 - BLOCK
    )
    :vars
    (
      ?auto_198639 - BLOCK
      ?auto_198643 - BLOCK
      ?auto_198641 - BLOCK
      ?auto_198640 - BLOCK
      ?auto_198642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198635 ?auto_198636 ) ) ( not ( = ?auto_198635 ?auto_198637 ) ) ( not ( = ?auto_198635 ?auto_198638 ) ) ( not ( = ?auto_198636 ?auto_198637 ) ) ( not ( = ?auto_198636 ?auto_198638 ) ) ( not ( = ?auto_198637 ?auto_198638 ) ) ( ON ?auto_198638 ?auto_198639 ) ( not ( = ?auto_198635 ?auto_198639 ) ) ( not ( = ?auto_198636 ?auto_198639 ) ) ( not ( = ?auto_198637 ?auto_198639 ) ) ( not ( = ?auto_198638 ?auto_198639 ) ) ( ON ?auto_198637 ?auto_198638 ) ( ON-TABLE ?auto_198643 ) ( ON ?auto_198641 ?auto_198643 ) ( ON ?auto_198640 ?auto_198641 ) ( ON ?auto_198639 ?auto_198640 ) ( not ( = ?auto_198643 ?auto_198641 ) ) ( not ( = ?auto_198643 ?auto_198640 ) ) ( not ( = ?auto_198643 ?auto_198639 ) ) ( not ( = ?auto_198643 ?auto_198638 ) ) ( not ( = ?auto_198643 ?auto_198637 ) ) ( not ( = ?auto_198641 ?auto_198640 ) ) ( not ( = ?auto_198641 ?auto_198639 ) ) ( not ( = ?auto_198641 ?auto_198638 ) ) ( not ( = ?auto_198641 ?auto_198637 ) ) ( not ( = ?auto_198640 ?auto_198639 ) ) ( not ( = ?auto_198640 ?auto_198638 ) ) ( not ( = ?auto_198640 ?auto_198637 ) ) ( not ( = ?auto_198635 ?auto_198643 ) ) ( not ( = ?auto_198635 ?auto_198641 ) ) ( not ( = ?auto_198635 ?auto_198640 ) ) ( not ( = ?auto_198636 ?auto_198643 ) ) ( not ( = ?auto_198636 ?auto_198641 ) ) ( not ( = ?auto_198636 ?auto_198640 ) ) ( ON ?auto_198635 ?auto_198642 ) ( not ( = ?auto_198635 ?auto_198642 ) ) ( not ( = ?auto_198636 ?auto_198642 ) ) ( not ( = ?auto_198637 ?auto_198642 ) ) ( not ( = ?auto_198638 ?auto_198642 ) ) ( not ( = ?auto_198639 ?auto_198642 ) ) ( not ( = ?auto_198643 ?auto_198642 ) ) ( not ( = ?auto_198641 ?auto_198642 ) ) ( not ( = ?auto_198640 ?auto_198642 ) ) ( CLEAR ?auto_198637 ) ( ON ?auto_198636 ?auto_198635 ) ( CLEAR ?auto_198636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198642 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198642 ?auto_198635 )
      ( MAKE-4PILE ?auto_198635 ?auto_198636 ?auto_198637 ?auto_198638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198644 - BLOCK
      ?auto_198645 - BLOCK
      ?auto_198646 - BLOCK
      ?auto_198647 - BLOCK
    )
    :vars
    (
      ?auto_198652 - BLOCK
      ?auto_198650 - BLOCK
      ?auto_198649 - BLOCK
      ?auto_198648 - BLOCK
      ?auto_198651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198644 ?auto_198645 ) ) ( not ( = ?auto_198644 ?auto_198646 ) ) ( not ( = ?auto_198644 ?auto_198647 ) ) ( not ( = ?auto_198645 ?auto_198646 ) ) ( not ( = ?auto_198645 ?auto_198647 ) ) ( not ( = ?auto_198646 ?auto_198647 ) ) ( ON ?auto_198647 ?auto_198652 ) ( not ( = ?auto_198644 ?auto_198652 ) ) ( not ( = ?auto_198645 ?auto_198652 ) ) ( not ( = ?auto_198646 ?auto_198652 ) ) ( not ( = ?auto_198647 ?auto_198652 ) ) ( ON-TABLE ?auto_198650 ) ( ON ?auto_198649 ?auto_198650 ) ( ON ?auto_198648 ?auto_198649 ) ( ON ?auto_198652 ?auto_198648 ) ( not ( = ?auto_198650 ?auto_198649 ) ) ( not ( = ?auto_198650 ?auto_198648 ) ) ( not ( = ?auto_198650 ?auto_198652 ) ) ( not ( = ?auto_198650 ?auto_198647 ) ) ( not ( = ?auto_198650 ?auto_198646 ) ) ( not ( = ?auto_198649 ?auto_198648 ) ) ( not ( = ?auto_198649 ?auto_198652 ) ) ( not ( = ?auto_198649 ?auto_198647 ) ) ( not ( = ?auto_198649 ?auto_198646 ) ) ( not ( = ?auto_198648 ?auto_198652 ) ) ( not ( = ?auto_198648 ?auto_198647 ) ) ( not ( = ?auto_198648 ?auto_198646 ) ) ( not ( = ?auto_198644 ?auto_198650 ) ) ( not ( = ?auto_198644 ?auto_198649 ) ) ( not ( = ?auto_198644 ?auto_198648 ) ) ( not ( = ?auto_198645 ?auto_198650 ) ) ( not ( = ?auto_198645 ?auto_198649 ) ) ( not ( = ?auto_198645 ?auto_198648 ) ) ( ON ?auto_198644 ?auto_198651 ) ( not ( = ?auto_198644 ?auto_198651 ) ) ( not ( = ?auto_198645 ?auto_198651 ) ) ( not ( = ?auto_198646 ?auto_198651 ) ) ( not ( = ?auto_198647 ?auto_198651 ) ) ( not ( = ?auto_198652 ?auto_198651 ) ) ( not ( = ?auto_198650 ?auto_198651 ) ) ( not ( = ?auto_198649 ?auto_198651 ) ) ( not ( = ?auto_198648 ?auto_198651 ) ) ( ON ?auto_198645 ?auto_198644 ) ( CLEAR ?auto_198645 ) ( ON-TABLE ?auto_198651 ) ( HOLDING ?auto_198646 ) ( CLEAR ?auto_198647 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198650 ?auto_198649 ?auto_198648 ?auto_198652 ?auto_198647 ?auto_198646 )
      ( MAKE-4PILE ?auto_198644 ?auto_198645 ?auto_198646 ?auto_198647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198653 - BLOCK
      ?auto_198654 - BLOCK
      ?auto_198655 - BLOCK
      ?auto_198656 - BLOCK
    )
    :vars
    (
      ?auto_198658 - BLOCK
      ?auto_198659 - BLOCK
      ?auto_198660 - BLOCK
      ?auto_198661 - BLOCK
      ?auto_198657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198653 ?auto_198654 ) ) ( not ( = ?auto_198653 ?auto_198655 ) ) ( not ( = ?auto_198653 ?auto_198656 ) ) ( not ( = ?auto_198654 ?auto_198655 ) ) ( not ( = ?auto_198654 ?auto_198656 ) ) ( not ( = ?auto_198655 ?auto_198656 ) ) ( ON ?auto_198656 ?auto_198658 ) ( not ( = ?auto_198653 ?auto_198658 ) ) ( not ( = ?auto_198654 ?auto_198658 ) ) ( not ( = ?auto_198655 ?auto_198658 ) ) ( not ( = ?auto_198656 ?auto_198658 ) ) ( ON-TABLE ?auto_198659 ) ( ON ?auto_198660 ?auto_198659 ) ( ON ?auto_198661 ?auto_198660 ) ( ON ?auto_198658 ?auto_198661 ) ( not ( = ?auto_198659 ?auto_198660 ) ) ( not ( = ?auto_198659 ?auto_198661 ) ) ( not ( = ?auto_198659 ?auto_198658 ) ) ( not ( = ?auto_198659 ?auto_198656 ) ) ( not ( = ?auto_198659 ?auto_198655 ) ) ( not ( = ?auto_198660 ?auto_198661 ) ) ( not ( = ?auto_198660 ?auto_198658 ) ) ( not ( = ?auto_198660 ?auto_198656 ) ) ( not ( = ?auto_198660 ?auto_198655 ) ) ( not ( = ?auto_198661 ?auto_198658 ) ) ( not ( = ?auto_198661 ?auto_198656 ) ) ( not ( = ?auto_198661 ?auto_198655 ) ) ( not ( = ?auto_198653 ?auto_198659 ) ) ( not ( = ?auto_198653 ?auto_198660 ) ) ( not ( = ?auto_198653 ?auto_198661 ) ) ( not ( = ?auto_198654 ?auto_198659 ) ) ( not ( = ?auto_198654 ?auto_198660 ) ) ( not ( = ?auto_198654 ?auto_198661 ) ) ( ON ?auto_198653 ?auto_198657 ) ( not ( = ?auto_198653 ?auto_198657 ) ) ( not ( = ?auto_198654 ?auto_198657 ) ) ( not ( = ?auto_198655 ?auto_198657 ) ) ( not ( = ?auto_198656 ?auto_198657 ) ) ( not ( = ?auto_198658 ?auto_198657 ) ) ( not ( = ?auto_198659 ?auto_198657 ) ) ( not ( = ?auto_198660 ?auto_198657 ) ) ( not ( = ?auto_198661 ?auto_198657 ) ) ( ON ?auto_198654 ?auto_198653 ) ( ON-TABLE ?auto_198657 ) ( CLEAR ?auto_198656 ) ( ON ?auto_198655 ?auto_198654 ) ( CLEAR ?auto_198655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198657 ?auto_198653 ?auto_198654 )
      ( MAKE-4PILE ?auto_198653 ?auto_198654 ?auto_198655 ?auto_198656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198662 - BLOCK
      ?auto_198663 - BLOCK
      ?auto_198664 - BLOCK
      ?auto_198665 - BLOCK
    )
    :vars
    (
      ?auto_198670 - BLOCK
      ?auto_198668 - BLOCK
      ?auto_198666 - BLOCK
      ?auto_198669 - BLOCK
      ?auto_198667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198662 ?auto_198663 ) ) ( not ( = ?auto_198662 ?auto_198664 ) ) ( not ( = ?auto_198662 ?auto_198665 ) ) ( not ( = ?auto_198663 ?auto_198664 ) ) ( not ( = ?auto_198663 ?auto_198665 ) ) ( not ( = ?auto_198664 ?auto_198665 ) ) ( not ( = ?auto_198662 ?auto_198670 ) ) ( not ( = ?auto_198663 ?auto_198670 ) ) ( not ( = ?auto_198664 ?auto_198670 ) ) ( not ( = ?auto_198665 ?auto_198670 ) ) ( ON-TABLE ?auto_198668 ) ( ON ?auto_198666 ?auto_198668 ) ( ON ?auto_198669 ?auto_198666 ) ( ON ?auto_198670 ?auto_198669 ) ( not ( = ?auto_198668 ?auto_198666 ) ) ( not ( = ?auto_198668 ?auto_198669 ) ) ( not ( = ?auto_198668 ?auto_198670 ) ) ( not ( = ?auto_198668 ?auto_198665 ) ) ( not ( = ?auto_198668 ?auto_198664 ) ) ( not ( = ?auto_198666 ?auto_198669 ) ) ( not ( = ?auto_198666 ?auto_198670 ) ) ( not ( = ?auto_198666 ?auto_198665 ) ) ( not ( = ?auto_198666 ?auto_198664 ) ) ( not ( = ?auto_198669 ?auto_198670 ) ) ( not ( = ?auto_198669 ?auto_198665 ) ) ( not ( = ?auto_198669 ?auto_198664 ) ) ( not ( = ?auto_198662 ?auto_198668 ) ) ( not ( = ?auto_198662 ?auto_198666 ) ) ( not ( = ?auto_198662 ?auto_198669 ) ) ( not ( = ?auto_198663 ?auto_198668 ) ) ( not ( = ?auto_198663 ?auto_198666 ) ) ( not ( = ?auto_198663 ?auto_198669 ) ) ( ON ?auto_198662 ?auto_198667 ) ( not ( = ?auto_198662 ?auto_198667 ) ) ( not ( = ?auto_198663 ?auto_198667 ) ) ( not ( = ?auto_198664 ?auto_198667 ) ) ( not ( = ?auto_198665 ?auto_198667 ) ) ( not ( = ?auto_198670 ?auto_198667 ) ) ( not ( = ?auto_198668 ?auto_198667 ) ) ( not ( = ?auto_198666 ?auto_198667 ) ) ( not ( = ?auto_198669 ?auto_198667 ) ) ( ON ?auto_198663 ?auto_198662 ) ( ON-TABLE ?auto_198667 ) ( ON ?auto_198664 ?auto_198663 ) ( CLEAR ?auto_198664 ) ( HOLDING ?auto_198665 ) ( CLEAR ?auto_198670 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198668 ?auto_198666 ?auto_198669 ?auto_198670 ?auto_198665 )
      ( MAKE-4PILE ?auto_198662 ?auto_198663 ?auto_198664 ?auto_198665 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198671 - BLOCK
      ?auto_198672 - BLOCK
      ?auto_198673 - BLOCK
      ?auto_198674 - BLOCK
    )
    :vars
    (
      ?auto_198679 - BLOCK
      ?auto_198675 - BLOCK
      ?auto_198678 - BLOCK
      ?auto_198677 - BLOCK
      ?auto_198676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198671 ?auto_198672 ) ) ( not ( = ?auto_198671 ?auto_198673 ) ) ( not ( = ?auto_198671 ?auto_198674 ) ) ( not ( = ?auto_198672 ?auto_198673 ) ) ( not ( = ?auto_198672 ?auto_198674 ) ) ( not ( = ?auto_198673 ?auto_198674 ) ) ( not ( = ?auto_198671 ?auto_198679 ) ) ( not ( = ?auto_198672 ?auto_198679 ) ) ( not ( = ?auto_198673 ?auto_198679 ) ) ( not ( = ?auto_198674 ?auto_198679 ) ) ( ON-TABLE ?auto_198675 ) ( ON ?auto_198678 ?auto_198675 ) ( ON ?auto_198677 ?auto_198678 ) ( ON ?auto_198679 ?auto_198677 ) ( not ( = ?auto_198675 ?auto_198678 ) ) ( not ( = ?auto_198675 ?auto_198677 ) ) ( not ( = ?auto_198675 ?auto_198679 ) ) ( not ( = ?auto_198675 ?auto_198674 ) ) ( not ( = ?auto_198675 ?auto_198673 ) ) ( not ( = ?auto_198678 ?auto_198677 ) ) ( not ( = ?auto_198678 ?auto_198679 ) ) ( not ( = ?auto_198678 ?auto_198674 ) ) ( not ( = ?auto_198678 ?auto_198673 ) ) ( not ( = ?auto_198677 ?auto_198679 ) ) ( not ( = ?auto_198677 ?auto_198674 ) ) ( not ( = ?auto_198677 ?auto_198673 ) ) ( not ( = ?auto_198671 ?auto_198675 ) ) ( not ( = ?auto_198671 ?auto_198678 ) ) ( not ( = ?auto_198671 ?auto_198677 ) ) ( not ( = ?auto_198672 ?auto_198675 ) ) ( not ( = ?auto_198672 ?auto_198678 ) ) ( not ( = ?auto_198672 ?auto_198677 ) ) ( ON ?auto_198671 ?auto_198676 ) ( not ( = ?auto_198671 ?auto_198676 ) ) ( not ( = ?auto_198672 ?auto_198676 ) ) ( not ( = ?auto_198673 ?auto_198676 ) ) ( not ( = ?auto_198674 ?auto_198676 ) ) ( not ( = ?auto_198679 ?auto_198676 ) ) ( not ( = ?auto_198675 ?auto_198676 ) ) ( not ( = ?auto_198678 ?auto_198676 ) ) ( not ( = ?auto_198677 ?auto_198676 ) ) ( ON ?auto_198672 ?auto_198671 ) ( ON-TABLE ?auto_198676 ) ( ON ?auto_198673 ?auto_198672 ) ( CLEAR ?auto_198679 ) ( ON ?auto_198674 ?auto_198673 ) ( CLEAR ?auto_198674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198676 ?auto_198671 ?auto_198672 ?auto_198673 )
      ( MAKE-4PILE ?auto_198671 ?auto_198672 ?auto_198673 ?auto_198674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198680 - BLOCK
      ?auto_198681 - BLOCK
      ?auto_198682 - BLOCK
      ?auto_198683 - BLOCK
    )
    :vars
    (
      ?auto_198684 - BLOCK
      ?auto_198686 - BLOCK
      ?auto_198688 - BLOCK
      ?auto_198687 - BLOCK
      ?auto_198685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198680 ?auto_198681 ) ) ( not ( = ?auto_198680 ?auto_198682 ) ) ( not ( = ?auto_198680 ?auto_198683 ) ) ( not ( = ?auto_198681 ?auto_198682 ) ) ( not ( = ?auto_198681 ?auto_198683 ) ) ( not ( = ?auto_198682 ?auto_198683 ) ) ( not ( = ?auto_198680 ?auto_198684 ) ) ( not ( = ?auto_198681 ?auto_198684 ) ) ( not ( = ?auto_198682 ?auto_198684 ) ) ( not ( = ?auto_198683 ?auto_198684 ) ) ( ON-TABLE ?auto_198686 ) ( ON ?auto_198688 ?auto_198686 ) ( ON ?auto_198687 ?auto_198688 ) ( not ( = ?auto_198686 ?auto_198688 ) ) ( not ( = ?auto_198686 ?auto_198687 ) ) ( not ( = ?auto_198686 ?auto_198684 ) ) ( not ( = ?auto_198686 ?auto_198683 ) ) ( not ( = ?auto_198686 ?auto_198682 ) ) ( not ( = ?auto_198688 ?auto_198687 ) ) ( not ( = ?auto_198688 ?auto_198684 ) ) ( not ( = ?auto_198688 ?auto_198683 ) ) ( not ( = ?auto_198688 ?auto_198682 ) ) ( not ( = ?auto_198687 ?auto_198684 ) ) ( not ( = ?auto_198687 ?auto_198683 ) ) ( not ( = ?auto_198687 ?auto_198682 ) ) ( not ( = ?auto_198680 ?auto_198686 ) ) ( not ( = ?auto_198680 ?auto_198688 ) ) ( not ( = ?auto_198680 ?auto_198687 ) ) ( not ( = ?auto_198681 ?auto_198686 ) ) ( not ( = ?auto_198681 ?auto_198688 ) ) ( not ( = ?auto_198681 ?auto_198687 ) ) ( ON ?auto_198680 ?auto_198685 ) ( not ( = ?auto_198680 ?auto_198685 ) ) ( not ( = ?auto_198681 ?auto_198685 ) ) ( not ( = ?auto_198682 ?auto_198685 ) ) ( not ( = ?auto_198683 ?auto_198685 ) ) ( not ( = ?auto_198684 ?auto_198685 ) ) ( not ( = ?auto_198686 ?auto_198685 ) ) ( not ( = ?auto_198688 ?auto_198685 ) ) ( not ( = ?auto_198687 ?auto_198685 ) ) ( ON ?auto_198681 ?auto_198680 ) ( ON-TABLE ?auto_198685 ) ( ON ?auto_198682 ?auto_198681 ) ( ON ?auto_198683 ?auto_198682 ) ( CLEAR ?auto_198683 ) ( HOLDING ?auto_198684 ) ( CLEAR ?auto_198687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198686 ?auto_198688 ?auto_198687 ?auto_198684 )
      ( MAKE-4PILE ?auto_198680 ?auto_198681 ?auto_198682 ?auto_198683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198689 - BLOCK
      ?auto_198690 - BLOCK
      ?auto_198691 - BLOCK
      ?auto_198692 - BLOCK
    )
    :vars
    (
      ?auto_198693 - BLOCK
      ?auto_198697 - BLOCK
      ?auto_198695 - BLOCK
      ?auto_198694 - BLOCK
      ?auto_198696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198689 ?auto_198690 ) ) ( not ( = ?auto_198689 ?auto_198691 ) ) ( not ( = ?auto_198689 ?auto_198692 ) ) ( not ( = ?auto_198690 ?auto_198691 ) ) ( not ( = ?auto_198690 ?auto_198692 ) ) ( not ( = ?auto_198691 ?auto_198692 ) ) ( not ( = ?auto_198689 ?auto_198693 ) ) ( not ( = ?auto_198690 ?auto_198693 ) ) ( not ( = ?auto_198691 ?auto_198693 ) ) ( not ( = ?auto_198692 ?auto_198693 ) ) ( ON-TABLE ?auto_198697 ) ( ON ?auto_198695 ?auto_198697 ) ( ON ?auto_198694 ?auto_198695 ) ( not ( = ?auto_198697 ?auto_198695 ) ) ( not ( = ?auto_198697 ?auto_198694 ) ) ( not ( = ?auto_198697 ?auto_198693 ) ) ( not ( = ?auto_198697 ?auto_198692 ) ) ( not ( = ?auto_198697 ?auto_198691 ) ) ( not ( = ?auto_198695 ?auto_198694 ) ) ( not ( = ?auto_198695 ?auto_198693 ) ) ( not ( = ?auto_198695 ?auto_198692 ) ) ( not ( = ?auto_198695 ?auto_198691 ) ) ( not ( = ?auto_198694 ?auto_198693 ) ) ( not ( = ?auto_198694 ?auto_198692 ) ) ( not ( = ?auto_198694 ?auto_198691 ) ) ( not ( = ?auto_198689 ?auto_198697 ) ) ( not ( = ?auto_198689 ?auto_198695 ) ) ( not ( = ?auto_198689 ?auto_198694 ) ) ( not ( = ?auto_198690 ?auto_198697 ) ) ( not ( = ?auto_198690 ?auto_198695 ) ) ( not ( = ?auto_198690 ?auto_198694 ) ) ( ON ?auto_198689 ?auto_198696 ) ( not ( = ?auto_198689 ?auto_198696 ) ) ( not ( = ?auto_198690 ?auto_198696 ) ) ( not ( = ?auto_198691 ?auto_198696 ) ) ( not ( = ?auto_198692 ?auto_198696 ) ) ( not ( = ?auto_198693 ?auto_198696 ) ) ( not ( = ?auto_198697 ?auto_198696 ) ) ( not ( = ?auto_198695 ?auto_198696 ) ) ( not ( = ?auto_198694 ?auto_198696 ) ) ( ON ?auto_198690 ?auto_198689 ) ( ON-TABLE ?auto_198696 ) ( ON ?auto_198691 ?auto_198690 ) ( ON ?auto_198692 ?auto_198691 ) ( CLEAR ?auto_198694 ) ( ON ?auto_198693 ?auto_198692 ) ( CLEAR ?auto_198693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198696 ?auto_198689 ?auto_198690 ?auto_198691 ?auto_198692 )
      ( MAKE-4PILE ?auto_198689 ?auto_198690 ?auto_198691 ?auto_198692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198698 - BLOCK
      ?auto_198699 - BLOCK
      ?auto_198700 - BLOCK
      ?auto_198701 - BLOCK
    )
    :vars
    (
      ?auto_198703 - BLOCK
      ?auto_198705 - BLOCK
      ?auto_198706 - BLOCK
      ?auto_198702 - BLOCK
      ?auto_198704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198698 ?auto_198699 ) ) ( not ( = ?auto_198698 ?auto_198700 ) ) ( not ( = ?auto_198698 ?auto_198701 ) ) ( not ( = ?auto_198699 ?auto_198700 ) ) ( not ( = ?auto_198699 ?auto_198701 ) ) ( not ( = ?auto_198700 ?auto_198701 ) ) ( not ( = ?auto_198698 ?auto_198703 ) ) ( not ( = ?auto_198699 ?auto_198703 ) ) ( not ( = ?auto_198700 ?auto_198703 ) ) ( not ( = ?auto_198701 ?auto_198703 ) ) ( ON-TABLE ?auto_198705 ) ( ON ?auto_198706 ?auto_198705 ) ( not ( = ?auto_198705 ?auto_198706 ) ) ( not ( = ?auto_198705 ?auto_198702 ) ) ( not ( = ?auto_198705 ?auto_198703 ) ) ( not ( = ?auto_198705 ?auto_198701 ) ) ( not ( = ?auto_198705 ?auto_198700 ) ) ( not ( = ?auto_198706 ?auto_198702 ) ) ( not ( = ?auto_198706 ?auto_198703 ) ) ( not ( = ?auto_198706 ?auto_198701 ) ) ( not ( = ?auto_198706 ?auto_198700 ) ) ( not ( = ?auto_198702 ?auto_198703 ) ) ( not ( = ?auto_198702 ?auto_198701 ) ) ( not ( = ?auto_198702 ?auto_198700 ) ) ( not ( = ?auto_198698 ?auto_198705 ) ) ( not ( = ?auto_198698 ?auto_198706 ) ) ( not ( = ?auto_198698 ?auto_198702 ) ) ( not ( = ?auto_198699 ?auto_198705 ) ) ( not ( = ?auto_198699 ?auto_198706 ) ) ( not ( = ?auto_198699 ?auto_198702 ) ) ( ON ?auto_198698 ?auto_198704 ) ( not ( = ?auto_198698 ?auto_198704 ) ) ( not ( = ?auto_198699 ?auto_198704 ) ) ( not ( = ?auto_198700 ?auto_198704 ) ) ( not ( = ?auto_198701 ?auto_198704 ) ) ( not ( = ?auto_198703 ?auto_198704 ) ) ( not ( = ?auto_198705 ?auto_198704 ) ) ( not ( = ?auto_198706 ?auto_198704 ) ) ( not ( = ?auto_198702 ?auto_198704 ) ) ( ON ?auto_198699 ?auto_198698 ) ( ON-TABLE ?auto_198704 ) ( ON ?auto_198700 ?auto_198699 ) ( ON ?auto_198701 ?auto_198700 ) ( ON ?auto_198703 ?auto_198701 ) ( CLEAR ?auto_198703 ) ( HOLDING ?auto_198702 ) ( CLEAR ?auto_198706 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198705 ?auto_198706 ?auto_198702 )
      ( MAKE-4PILE ?auto_198698 ?auto_198699 ?auto_198700 ?auto_198701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198707 - BLOCK
      ?auto_198708 - BLOCK
      ?auto_198709 - BLOCK
      ?auto_198710 - BLOCK
    )
    :vars
    (
      ?auto_198711 - BLOCK
      ?auto_198714 - BLOCK
      ?auto_198713 - BLOCK
      ?auto_198715 - BLOCK
      ?auto_198712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198707 ?auto_198708 ) ) ( not ( = ?auto_198707 ?auto_198709 ) ) ( not ( = ?auto_198707 ?auto_198710 ) ) ( not ( = ?auto_198708 ?auto_198709 ) ) ( not ( = ?auto_198708 ?auto_198710 ) ) ( not ( = ?auto_198709 ?auto_198710 ) ) ( not ( = ?auto_198707 ?auto_198711 ) ) ( not ( = ?auto_198708 ?auto_198711 ) ) ( not ( = ?auto_198709 ?auto_198711 ) ) ( not ( = ?auto_198710 ?auto_198711 ) ) ( ON-TABLE ?auto_198714 ) ( ON ?auto_198713 ?auto_198714 ) ( not ( = ?auto_198714 ?auto_198713 ) ) ( not ( = ?auto_198714 ?auto_198715 ) ) ( not ( = ?auto_198714 ?auto_198711 ) ) ( not ( = ?auto_198714 ?auto_198710 ) ) ( not ( = ?auto_198714 ?auto_198709 ) ) ( not ( = ?auto_198713 ?auto_198715 ) ) ( not ( = ?auto_198713 ?auto_198711 ) ) ( not ( = ?auto_198713 ?auto_198710 ) ) ( not ( = ?auto_198713 ?auto_198709 ) ) ( not ( = ?auto_198715 ?auto_198711 ) ) ( not ( = ?auto_198715 ?auto_198710 ) ) ( not ( = ?auto_198715 ?auto_198709 ) ) ( not ( = ?auto_198707 ?auto_198714 ) ) ( not ( = ?auto_198707 ?auto_198713 ) ) ( not ( = ?auto_198707 ?auto_198715 ) ) ( not ( = ?auto_198708 ?auto_198714 ) ) ( not ( = ?auto_198708 ?auto_198713 ) ) ( not ( = ?auto_198708 ?auto_198715 ) ) ( ON ?auto_198707 ?auto_198712 ) ( not ( = ?auto_198707 ?auto_198712 ) ) ( not ( = ?auto_198708 ?auto_198712 ) ) ( not ( = ?auto_198709 ?auto_198712 ) ) ( not ( = ?auto_198710 ?auto_198712 ) ) ( not ( = ?auto_198711 ?auto_198712 ) ) ( not ( = ?auto_198714 ?auto_198712 ) ) ( not ( = ?auto_198713 ?auto_198712 ) ) ( not ( = ?auto_198715 ?auto_198712 ) ) ( ON ?auto_198708 ?auto_198707 ) ( ON-TABLE ?auto_198712 ) ( ON ?auto_198709 ?auto_198708 ) ( ON ?auto_198710 ?auto_198709 ) ( ON ?auto_198711 ?auto_198710 ) ( CLEAR ?auto_198713 ) ( ON ?auto_198715 ?auto_198711 ) ( CLEAR ?auto_198715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198712 ?auto_198707 ?auto_198708 ?auto_198709 ?auto_198710 ?auto_198711 )
      ( MAKE-4PILE ?auto_198707 ?auto_198708 ?auto_198709 ?auto_198710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198716 - BLOCK
      ?auto_198717 - BLOCK
      ?auto_198718 - BLOCK
      ?auto_198719 - BLOCK
    )
    :vars
    (
      ?auto_198722 - BLOCK
      ?auto_198721 - BLOCK
      ?auto_198723 - BLOCK
      ?auto_198720 - BLOCK
      ?auto_198724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198716 ?auto_198717 ) ) ( not ( = ?auto_198716 ?auto_198718 ) ) ( not ( = ?auto_198716 ?auto_198719 ) ) ( not ( = ?auto_198717 ?auto_198718 ) ) ( not ( = ?auto_198717 ?auto_198719 ) ) ( not ( = ?auto_198718 ?auto_198719 ) ) ( not ( = ?auto_198716 ?auto_198722 ) ) ( not ( = ?auto_198717 ?auto_198722 ) ) ( not ( = ?auto_198718 ?auto_198722 ) ) ( not ( = ?auto_198719 ?auto_198722 ) ) ( ON-TABLE ?auto_198721 ) ( not ( = ?auto_198721 ?auto_198723 ) ) ( not ( = ?auto_198721 ?auto_198720 ) ) ( not ( = ?auto_198721 ?auto_198722 ) ) ( not ( = ?auto_198721 ?auto_198719 ) ) ( not ( = ?auto_198721 ?auto_198718 ) ) ( not ( = ?auto_198723 ?auto_198720 ) ) ( not ( = ?auto_198723 ?auto_198722 ) ) ( not ( = ?auto_198723 ?auto_198719 ) ) ( not ( = ?auto_198723 ?auto_198718 ) ) ( not ( = ?auto_198720 ?auto_198722 ) ) ( not ( = ?auto_198720 ?auto_198719 ) ) ( not ( = ?auto_198720 ?auto_198718 ) ) ( not ( = ?auto_198716 ?auto_198721 ) ) ( not ( = ?auto_198716 ?auto_198723 ) ) ( not ( = ?auto_198716 ?auto_198720 ) ) ( not ( = ?auto_198717 ?auto_198721 ) ) ( not ( = ?auto_198717 ?auto_198723 ) ) ( not ( = ?auto_198717 ?auto_198720 ) ) ( ON ?auto_198716 ?auto_198724 ) ( not ( = ?auto_198716 ?auto_198724 ) ) ( not ( = ?auto_198717 ?auto_198724 ) ) ( not ( = ?auto_198718 ?auto_198724 ) ) ( not ( = ?auto_198719 ?auto_198724 ) ) ( not ( = ?auto_198722 ?auto_198724 ) ) ( not ( = ?auto_198721 ?auto_198724 ) ) ( not ( = ?auto_198723 ?auto_198724 ) ) ( not ( = ?auto_198720 ?auto_198724 ) ) ( ON ?auto_198717 ?auto_198716 ) ( ON-TABLE ?auto_198724 ) ( ON ?auto_198718 ?auto_198717 ) ( ON ?auto_198719 ?auto_198718 ) ( ON ?auto_198722 ?auto_198719 ) ( ON ?auto_198720 ?auto_198722 ) ( CLEAR ?auto_198720 ) ( HOLDING ?auto_198723 ) ( CLEAR ?auto_198721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198721 ?auto_198723 )
      ( MAKE-4PILE ?auto_198716 ?auto_198717 ?auto_198718 ?auto_198719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198725 - BLOCK
      ?auto_198726 - BLOCK
      ?auto_198727 - BLOCK
      ?auto_198728 - BLOCK
    )
    :vars
    (
      ?auto_198732 - BLOCK
      ?auto_198729 - BLOCK
      ?auto_198730 - BLOCK
      ?auto_198731 - BLOCK
      ?auto_198733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198725 ?auto_198726 ) ) ( not ( = ?auto_198725 ?auto_198727 ) ) ( not ( = ?auto_198725 ?auto_198728 ) ) ( not ( = ?auto_198726 ?auto_198727 ) ) ( not ( = ?auto_198726 ?auto_198728 ) ) ( not ( = ?auto_198727 ?auto_198728 ) ) ( not ( = ?auto_198725 ?auto_198732 ) ) ( not ( = ?auto_198726 ?auto_198732 ) ) ( not ( = ?auto_198727 ?auto_198732 ) ) ( not ( = ?auto_198728 ?auto_198732 ) ) ( ON-TABLE ?auto_198729 ) ( not ( = ?auto_198729 ?auto_198730 ) ) ( not ( = ?auto_198729 ?auto_198731 ) ) ( not ( = ?auto_198729 ?auto_198732 ) ) ( not ( = ?auto_198729 ?auto_198728 ) ) ( not ( = ?auto_198729 ?auto_198727 ) ) ( not ( = ?auto_198730 ?auto_198731 ) ) ( not ( = ?auto_198730 ?auto_198732 ) ) ( not ( = ?auto_198730 ?auto_198728 ) ) ( not ( = ?auto_198730 ?auto_198727 ) ) ( not ( = ?auto_198731 ?auto_198732 ) ) ( not ( = ?auto_198731 ?auto_198728 ) ) ( not ( = ?auto_198731 ?auto_198727 ) ) ( not ( = ?auto_198725 ?auto_198729 ) ) ( not ( = ?auto_198725 ?auto_198730 ) ) ( not ( = ?auto_198725 ?auto_198731 ) ) ( not ( = ?auto_198726 ?auto_198729 ) ) ( not ( = ?auto_198726 ?auto_198730 ) ) ( not ( = ?auto_198726 ?auto_198731 ) ) ( ON ?auto_198725 ?auto_198733 ) ( not ( = ?auto_198725 ?auto_198733 ) ) ( not ( = ?auto_198726 ?auto_198733 ) ) ( not ( = ?auto_198727 ?auto_198733 ) ) ( not ( = ?auto_198728 ?auto_198733 ) ) ( not ( = ?auto_198732 ?auto_198733 ) ) ( not ( = ?auto_198729 ?auto_198733 ) ) ( not ( = ?auto_198730 ?auto_198733 ) ) ( not ( = ?auto_198731 ?auto_198733 ) ) ( ON ?auto_198726 ?auto_198725 ) ( ON-TABLE ?auto_198733 ) ( ON ?auto_198727 ?auto_198726 ) ( ON ?auto_198728 ?auto_198727 ) ( ON ?auto_198732 ?auto_198728 ) ( ON ?auto_198731 ?auto_198732 ) ( CLEAR ?auto_198729 ) ( ON ?auto_198730 ?auto_198731 ) ( CLEAR ?auto_198730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198733 ?auto_198725 ?auto_198726 ?auto_198727 ?auto_198728 ?auto_198732 ?auto_198731 )
      ( MAKE-4PILE ?auto_198725 ?auto_198726 ?auto_198727 ?auto_198728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198734 - BLOCK
      ?auto_198735 - BLOCK
      ?auto_198736 - BLOCK
      ?auto_198737 - BLOCK
    )
    :vars
    (
      ?auto_198742 - BLOCK
      ?auto_198741 - BLOCK
      ?auto_198738 - BLOCK
      ?auto_198739 - BLOCK
      ?auto_198740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198734 ?auto_198735 ) ) ( not ( = ?auto_198734 ?auto_198736 ) ) ( not ( = ?auto_198734 ?auto_198737 ) ) ( not ( = ?auto_198735 ?auto_198736 ) ) ( not ( = ?auto_198735 ?auto_198737 ) ) ( not ( = ?auto_198736 ?auto_198737 ) ) ( not ( = ?auto_198734 ?auto_198742 ) ) ( not ( = ?auto_198735 ?auto_198742 ) ) ( not ( = ?auto_198736 ?auto_198742 ) ) ( not ( = ?auto_198737 ?auto_198742 ) ) ( not ( = ?auto_198741 ?auto_198738 ) ) ( not ( = ?auto_198741 ?auto_198739 ) ) ( not ( = ?auto_198741 ?auto_198742 ) ) ( not ( = ?auto_198741 ?auto_198737 ) ) ( not ( = ?auto_198741 ?auto_198736 ) ) ( not ( = ?auto_198738 ?auto_198739 ) ) ( not ( = ?auto_198738 ?auto_198742 ) ) ( not ( = ?auto_198738 ?auto_198737 ) ) ( not ( = ?auto_198738 ?auto_198736 ) ) ( not ( = ?auto_198739 ?auto_198742 ) ) ( not ( = ?auto_198739 ?auto_198737 ) ) ( not ( = ?auto_198739 ?auto_198736 ) ) ( not ( = ?auto_198734 ?auto_198741 ) ) ( not ( = ?auto_198734 ?auto_198738 ) ) ( not ( = ?auto_198734 ?auto_198739 ) ) ( not ( = ?auto_198735 ?auto_198741 ) ) ( not ( = ?auto_198735 ?auto_198738 ) ) ( not ( = ?auto_198735 ?auto_198739 ) ) ( ON ?auto_198734 ?auto_198740 ) ( not ( = ?auto_198734 ?auto_198740 ) ) ( not ( = ?auto_198735 ?auto_198740 ) ) ( not ( = ?auto_198736 ?auto_198740 ) ) ( not ( = ?auto_198737 ?auto_198740 ) ) ( not ( = ?auto_198742 ?auto_198740 ) ) ( not ( = ?auto_198741 ?auto_198740 ) ) ( not ( = ?auto_198738 ?auto_198740 ) ) ( not ( = ?auto_198739 ?auto_198740 ) ) ( ON ?auto_198735 ?auto_198734 ) ( ON-TABLE ?auto_198740 ) ( ON ?auto_198736 ?auto_198735 ) ( ON ?auto_198737 ?auto_198736 ) ( ON ?auto_198742 ?auto_198737 ) ( ON ?auto_198739 ?auto_198742 ) ( ON ?auto_198738 ?auto_198739 ) ( CLEAR ?auto_198738 ) ( HOLDING ?auto_198741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198741 )
      ( MAKE-4PILE ?auto_198734 ?auto_198735 ?auto_198736 ?auto_198737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_198743 - BLOCK
      ?auto_198744 - BLOCK
      ?auto_198745 - BLOCK
      ?auto_198746 - BLOCK
    )
    :vars
    (
      ?auto_198751 - BLOCK
      ?auto_198749 - BLOCK
      ?auto_198750 - BLOCK
      ?auto_198748 - BLOCK
      ?auto_198747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198743 ?auto_198744 ) ) ( not ( = ?auto_198743 ?auto_198745 ) ) ( not ( = ?auto_198743 ?auto_198746 ) ) ( not ( = ?auto_198744 ?auto_198745 ) ) ( not ( = ?auto_198744 ?auto_198746 ) ) ( not ( = ?auto_198745 ?auto_198746 ) ) ( not ( = ?auto_198743 ?auto_198751 ) ) ( not ( = ?auto_198744 ?auto_198751 ) ) ( not ( = ?auto_198745 ?auto_198751 ) ) ( not ( = ?auto_198746 ?auto_198751 ) ) ( not ( = ?auto_198749 ?auto_198750 ) ) ( not ( = ?auto_198749 ?auto_198748 ) ) ( not ( = ?auto_198749 ?auto_198751 ) ) ( not ( = ?auto_198749 ?auto_198746 ) ) ( not ( = ?auto_198749 ?auto_198745 ) ) ( not ( = ?auto_198750 ?auto_198748 ) ) ( not ( = ?auto_198750 ?auto_198751 ) ) ( not ( = ?auto_198750 ?auto_198746 ) ) ( not ( = ?auto_198750 ?auto_198745 ) ) ( not ( = ?auto_198748 ?auto_198751 ) ) ( not ( = ?auto_198748 ?auto_198746 ) ) ( not ( = ?auto_198748 ?auto_198745 ) ) ( not ( = ?auto_198743 ?auto_198749 ) ) ( not ( = ?auto_198743 ?auto_198750 ) ) ( not ( = ?auto_198743 ?auto_198748 ) ) ( not ( = ?auto_198744 ?auto_198749 ) ) ( not ( = ?auto_198744 ?auto_198750 ) ) ( not ( = ?auto_198744 ?auto_198748 ) ) ( ON ?auto_198743 ?auto_198747 ) ( not ( = ?auto_198743 ?auto_198747 ) ) ( not ( = ?auto_198744 ?auto_198747 ) ) ( not ( = ?auto_198745 ?auto_198747 ) ) ( not ( = ?auto_198746 ?auto_198747 ) ) ( not ( = ?auto_198751 ?auto_198747 ) ) ( not ( = ?auto_198749 ?auto_198747 ) ) ( not ( = ?auto_198750 ?auto_198747 ) ) ( not ( = ?auto_198748 ?auto_198747 ) ) ( ON ?auto_198744 ?auto_198743 ) ( ON-TABLE ?auto_198747 ) ( ON ?auto_198745 ?auto_198744 ) ( ON ?auto_198746 ?auto_198745 ) ( ON ?auto_198751 ?auto_198746 ) ( ON ?auto_198748 ?auto_198751 ) ( ON ?auto_198750 ?auto_198748 ) ( ON ?auto_198749 ?auto_198750 ) ( CLEAR ?auto_198749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198747 ?auto_198743 ?auto_198744 ?auto_198745 ?auto_198746 ?auto_198751 ?auto_198748 ?auto_198750 )
      ( MAKE-4PILE ?auto_198743 ?auto_198744 ?auto_198745 ?auto_198746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198755 - BLOCK
      ?auto_198756 - BLOCK
      ?auto_198757 - BLOCK
    )
    :vars
    (
      ?auto_198758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198758 ?auto_198757 ) ( CLEAR ?auto_198758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198755 ) ( ON ?auto_198756 ?auto_198755 ) ( ON ?auto_198757 ?auto_198756 ) ( not ( = ?auto_198755 ?auto_198756 ) ) ( not ( = ?auto_198755 ?auto_198757 ) ) ( not ( = ?auto_198755 ?auto_198758 ) ) ( not ( = ?auto_198756 ?auto_198757 ) ) ( not ( = ?auto_198756 ?auto_198758 ) ) ( not ( = ?auto_198757 ?auto_198758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198758 ?auto_198757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198759 - BLOCK
      ?auto_198760 - BLOCK
      ?auto_198761 - BLOCK
    )
    :vars
    (
      ?auto_198762 - BLOCK
      ?auto_198763 - BLOCK
      ?auto_198764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198762 ?auto_198761 ) ( CLEAR ?auto_198762 ) ( ON-TABLE ?auto_198759 ) ( ON ?auto_198760 ?auto_198759 ) ( ON ?auto_198761 ?auto_198760 ) ( not ( = ?auto_198759 ?auto_198760 ) ) ( not ( = ?auto_198759 ?auto_198761 ) ) ( not ( = ?auto_198759 ?auto_198762 ) ) ( not ( = ?auto_198760 ?auto_198761 ) ) ( not ( = ?auto_198760 ?auto_198762 ) ) ( not ( = ?auto_198761 ?auto_198762 ) ) ( HOLDING ?auto_198763 ) ( CLEAR ?auto_198764 ) ( not ( = ?auto_198759 ?auto_198763 ) ) ( not ( = ?auto_198759 ?auto_198764 ) ) ( not ( = ?auto_198760 ?auto_198763 ) ) ( not ( = ?auto_198760 ?auto_198764 ) ) ( not ( = ?auto_198761 ?auto_198763 ) ) ( not ( = ?auto_198761 ?auto_198764 ) ) ( not ( = ?auto_198762 ?auto_198763 ) ) ( not ( = ?auto_198762 ?auto_198764 ) ) ( not ( = ?auto_198763 ?auto_198764 ) ) )
    :subtasks
    ( ( !STACK ?auto_198763 ?auto_198764 )
      ( MAKE-3PILE ?auto_198759 ?auto_198760 ?auto_198761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198765 - BLOCK
      ?auto_198766 - BLOCK
      ?auto_198767 - BLOCK
    )
    :vars
    (
      ?auto_198770 - BLOCK
      ?auto_198769 - BLOCK
      ?auto_198768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198770 ?auto_198767 ) ( ON-TABLE ?auto_198765 ) ( ON ?auto_198766 ?auto_198765 ) ( ON ?auto_198767 ?auto_198766 ) ( not ( = ?auto_198765 ?auto_198766 ) ) ( not ( = ?auto_198765 ?auto_198767 ) ) ( not ( = ?auto_198765 ?auto_198770 ) ) ( not ( = ?auto_198766 ?auto_198767 ) ) ( not ( = ?auto_198766 ?auto_198770 ) ) ( not ( = ?auto_198767 ?auto_198770 ) ) ( CLEAR ?auto_198769 ) ( not ( = ?auto_198765 ?auto_198768 ) ) ( not ( = ?auto_198765 ?auto_198769 ) ) ( not ( = ?auto_198766 ?auto_198768 ) ) ( not ( = ?auto_198766 ?auto_198769 ) ) ( not ( = ?auto_198767 ?auto_198768 ) ) ( not ( = ?auto_198767 ?auto_198769 ) ) ( not ( = ?auto_198770 ?auto_198768 ) ) ( not ( = ?auto_198770 ?auto_198769 ) ) ( not ( = ?auto_198768 ?auto_198769 ) ) ( ON ?auto_198768 ?auto_198770 ) ( CLEAR ?auto_198768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198765 ?auto_198766 ?auto_198767 ?auto_198770 )
      ( MAKE-3PILE ?auto_198765 ?auto_198766 ?auto_198767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198771 - BLOCK
      ?auto_198772 - BLOCK
      ?auto_198773 - BLOCK
    )
    :vars
    (
      ?auto_198774 - BLOCK
      ?auto_198776 - BLOCK
      ?auto_198775 - BLOCK
      ?auto_198777 - BLOCK
      ?auto_198778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198774 ?auto_198773 ) ( ON-TABLE ?auto_198771 ) ( ON ?auto_198772 ?auto_198771 ) ( ON ?auto_198773 ?auto_198772 ) ( not ( = ?auto_198771 ?auto_198772 ) ) ( not ( = ?auto_198771 ?auto_198773 ) ) ( not ( = ?auto_198771 ?auto_198774 ) ) ( not ( = ?auto_198772 ?auto_198773 ) ) ( not ( = ?auto_198772 ?auto_198774 ) ) ( not ( = ?auto_198773 ?auto_198774 ) ) ( not ( = ?auto_198771 ?auto_198776 ) ) ( not ( = ?auto_198771 ?auto_198775 ) ) ( not ( = ?auto_198772 ?auto_198776 ) ) ( not ( = ?auto_198772 ?auto_198775 ) ) ( not ( = ?auto_198773 ?auto_198776 ) ) ( not ( = ?auto_198773 ?auto_198775 ) ) ( not ( = ?auto_198774 ?auto_198776 ) ) ( not ( = ?auto_198774 ?auto_198775 ) ) ( not ( = ?auto_198776 ?auto_198775 ) ) ( ON ?auto_198776 ?auto_198774 ) ( CLEAR ?auto_198776 ) ( HOLDING ?auto_198775 ) ( CLEAR ?auto_198777 ) ( ON-TABLE ?auto_198778 ) ( ON ?auto_198777 ?auto_198778 ) ( not ( = ?auto_198778 ?auto_198777 ) ) ( not ( = ?auto_198778 ?auto_198775 ) ) ( not ( = ?auto_198777 ?auto_198775 ) ) ( not ( = ?auto_198771 ?auto_198777 ) ) ( not ( = ?auto_198771 ?auto_198778 ) ) ( not ( = ?auto_198772 ?auto_198777 ) ) ( not ( = ?auto_198772 ?auto_198778 ) ) ( not ( = ?auto_198773 ?auto_198777 ) ) ( not ( = ?auto_198773 ?auto_198778 ) ) ( not ( = ?auto_198774 ?auto_198777 ) ) ( not ( = ?auto_198774 ?auto_198778 ) ) ( not ( = ?auto_198776 ?auto_198777 ) ) ( not ( = ?auto_198776 ?auto_198778 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198778 ?auto_198777 ?auto_198775 )
      ( MAKE-3PILE ?auto_198771 ?auto_198772 ?auto_198773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198779 - BLOCK
      ?auto_198780 - BLOCK
      ?auto_198781 - BLOCK
    )
    :vars
    (
      ?auto_198782 - BLOCK
      ?auto_198786 - BLOCK
      ?auto_198785 - BLOCK
      ?auto_198784 - BLOCK
      ?auto_198783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198782 ?auto_198781 ) ( ON-TABLE ?auto_198779 ) ( ON ?auto_198780 ?auto_198779 ) ( ON ?auto_198781 ?auto_198780 ) ( not ( = ?auto_198779 ?auto_198780 ) ) ( not ( = ?auto_198779 ?auto_198781 ) ) ( not ( = ?auto_198779 ?auto_198782 ) ) ( not ( = ?auto_198780 ?auto_198781 ) ) ( not ( = ?auto_198780 ?auto_198782 ) ) ( not ( = ?auto_198781 ?auto_198782 ) ) ( not ( = ?auto_198779 ?auto_198786 ) ) ( not ( = ?auto_198779 ?auto_198785 ) ) ( not ( = ?auto_198780 ?auto_198786 ) ) ( not ( = ?auto_198780 ?auto_198785 ) ) ( not ( = ?auto_198781 ?auto_198786 ) ) ( not ( = ?auto_198781 ?auto_198785 ) ) ( not ( = ?auto_198782 ?auto_198786 ) ) ( not ( = ?auto_198782 ?auto_198785 ) ) ( not ( = ?auto_198786 ?auto_198785 ) ) ( ON ?auto_198786 ?auto_198782 ) ( CLEAR ?auto_198784 ) ( ON-TABLE ?auto_198783 ) ( ON ?auto_198784 ?auto_198783 ) ( not ( = ?auto_198783 ?auto_198784 ) ) ( not ( = ?auto_198783 ?auto_198785 ) ) ( not ( = ?auto_198784 ?auto_198785 ) ) ( not ( = ?auto_198779 ?auto_198784 ) ) ( not ( = ?auto_198779 ?auto_198783 ) ) ( not ( = ?auto_198780 ?auto_198784 ) ) ( not ( = ?auto_198780 ?auto_198783 ) ) ( not ( = ?auto_198781 ?auto_198784 ) ) ( not ( = ?auto_198781 ?auto_198783 ) ) ( not ( = ?auto_198782 ?auto_198784 ) ) ( not ( = ?auto_198782 ?auto_198783 ) ) ( not ( = ?auto_198786 ?auto_198784 ) ) ( not ( = ?auto_198786 ?auto_198783 ) ) ( ON ?auto_198785 ?auto_198786 ) ( CLEAR ?auto_198785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198779 ?auto_198780 ?auto_198781 ?auto_198782 ?auto_198786 )
      ( MAKE-3PILE ?auto_198779 ?auto_198780 ?auto_198781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198787 - BLOCK
      ?auto_198788 - BLOCK
      ?auto_198789 - BLOCK
    )
    :vars
    (
      ?auto_198794 - BLOCK
      ?auto_198793 - BLOCK
      ?auto_198790 - BLOCK
      ?auto_198791 - BLOCK
      ?auto_198792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198794 ?auto_198789 ) ( ON-TABLE ?auto_198787 ) ( ON ?auto_198788 ?auto_198787 ) ( ON ?auto_198789 ?auto_198788 ) ( not ( = ?auto_198787 ?auto_198788 ) ) ( not ( = ?auto_198787 ?auto_198789 ) ) ( not ( = ?auto_198787 ?auto_198794 ) ) ( not ( = ?auto_198788 ?auto_198789 ) ) ( not ( = ?auto_198788 ?auto_198794 ) ) ( not ( = ?auto_198789 ?auto_198794 ) ) ( not ( = ?auto_198787 ?auto_198793 ) ) ( not ( = ?auto_198787 ?auto_198790 ) ) ( not ( = ?auto_198788 ?auto_198793 ) ) ( not ( = ?auto_198788 ?auto_198790 ) ) ( not ( = ?auto_198789 ?auto_198793 ) ) ( not ( = ?auto_198789 ?auto_198790 ) ) ( not ( = ?auto_198794 ?auto_198793 ) ) ( not ( = ?auto_198794 ?auto_198790 ) ) ( not ( = ?auto_198793 ?auto_198790 ) ) ( ON ?auto_198793 ?auto_198794 ) ( ON-TABLE ?auto_198791 ) ( not ( = ?auto_198791 ?auto_198792 ) ) ( not ( = ?auto_198791 ?auto_198790 ) ) ( not ( = ?auto_198792 ?auto_198790 ) ) ( not ( = ?auto_198787 ?auto_198792 ) ) ( not ( = ?auto_198787 ?auto_198791 ) ) ( not ( = ?auto_198788 ?auto_198792 ) ) ( not ( = ?auto_198788 ?auto_198791 ) ) ( not ( = ?auto_198789 ?auto_198792 ) ) ( not ( = ?auto_198789 ?auto_198791 ) ) ( not ( = ?auto_198794 ?auto_198792 ) ) ( not ( = ?auto_198794 ?auto_198791 ) ) ( not ( = ?auto_198793 ?auto_198792 ) ) ( not ( = ?auto_198793 ?auto_198791 ) ) ( ON ?auto_198790 ?auto_198793 ) ( CLEAR ?auto_198790 ) ( HOLDING ?auto_198792 ) ( CLEAR ?auto_198791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198791 ?auto_198792 )
      ( MAKE-3PILE ?auto_198787 ?auto_198788 ?auto_198789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198795 - BLOCK
      ?auto_198796 - BLOCK
      ?auto_198797 - BLOCK
    )
    :vars
    (
      ?auto_198800 - BLOCK
      ?auto_198798 - BLOCK
      ?auto_198799 - BLOCK
      ?auto_198801 - BLOCK
      ?auto_198802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198800 ?auto_198797 ) ( ON-TABLE ?auto_198795 ) ( ON ?auto_198796 ?auto_198795 ) ( ON ?auto_198797 ?auto_198796 ) ( not ( = ?auto_198795 ?auto_198796 ) ) ( not ( = ?auto_198795 ?auto_198797 ) ) ( not ( = ?auto_198795 ?auto_198800 ) ) ( not ( = ?auto_198796 ?auto_198797 ) ) ( not ( = ?auto_198796 ?auto_198800 ) ) ( not ( = ?auto_198797 ?auto_198800 ) ) ( not ( = ?auto_198795 ?auto_198798 ) ) ( not ( = ?auto_198795 ?auto_198799 ) ) ( not ( = ?auto_198796 ?auto_198798 ) ) ( not ( = ?auto_198796 ?auto_198799 ) ) ( not ( = ?auto_198797 ?auto_198798 ) ) ( not ( = ?auto_198797 ?auto_198799 ) ) ( not ( = ?auto_198800 ?auto_198798 ) ) ( not ( = ?auto_198800 ?auto_198799 ) ) ( not ( = ?auto_198798 ?auto_198799 ) ) ( ON ?auto_198798 ?auto_198800 ) ( ON-TABLE ?auto_198801 ) ( not ( = ?auto_198801 ?auto_198802 ) ) ( not ( = ?auto_198801 ?auto_198799 ) ) ( not ( = ?auto_198802 ?auto_198799 ) ) ( not ( = ?auto_198795 ?auto_198802 ) ) ( not ( = ?auto_198795 ?auto_198801 ) ) ( not ( = ?auto_198796 ?auto_198802 ) ) ( not ( = ?auto_198796 ?auto_198801 ) ) ( not ( = ?auto_198797 ?auto_198802 ) ) ( not ( = ?auto_198797 ?auto_198801 ) ) ( not ( = ?auto_198800 ?auto_198802 ) ) ( not ( = ?auto_198800 ?auto_198801 ) ) ( not ( = ?auto_198798 ?auto_198802 ) ) ( not ( = ?auto_198798 ?auto_198801 ) ) ( ON ?auto_198799 ?auto_198798 ) ( CLEAR ?auto_198801 ) ( ON ?auto_198802 ?auto_198799 ) ( CLEAR ?auto_198802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198795 ?auto_198796 ?auto_198797 ?auto_198800 ?auto_198798 ?auto_198799 )
      ( MAKE-3PILE ?auto_198795 ?auto_198796 ?auto_198797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198803 - BLOCK
      ?auto_198804 - BLOCK
      ?auto_198805 - BLOCK
    )
    :vars
    (
      ?auto_198810 - BLOCK
      ?auto_198807 - BLOCK
      ?auto_198808 - BLOCK
      ?auto_198809 - BLOCK
      ?auto_198806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198810 ?auto_198805 ) ( ON-TABLE ?auto_198803 ) ( ON ?auto_198804 ?auto_198803 ) ( ON ?auto_198805 ?auto_198804 ) ( not ( = ?auto_198803 ?auto_198804 ) ) ( not ( = ?auto_198803 ?auto_198805 ) ) ( not ( = ?auto_198803 ?auto_198810 ) ) ( not ( = ?auto_198804 ?auto_198805 ) ) ( not ( = ?auto_198804 ?auto_198810 ) ) ( not ( = ?auto_198805 ?auto_198810 ) ) ( not ( = ?auto_198803 ?auto_198807 ) ) ( not ( = ?auto_198803 ?auto_198808 ) ) ( not ( = ?auto_198804 ?auto_198807 ) ) ( not ( = ?auto_198804 ?auto_198808 ) ) ( not ( = ?auto_198805 ?auto_198807 ) ) ( not ( = ?auto_198805 ?auto_198808 ) ) ( not ( = ?auto_198810 ?auto_198807 ) ) ( not ( = ?auto_198810 ?auto_198808 ) ) ( not ( = ?auto_198807 ?auto_198808 ) ) ( ON ?auto_198807 ?auto_198810 ) ( not ( = ?auto_198809 ?auto_198806 ) ) ( not ( = ?auto_198809 ?auto_198808 ) ) ( not ( = ?auto_198806 ?auto_198808 ) ) ( not ( = ?auto_198803 ?auto_198806 ) ) ( not ( = ?auto_198803 ?auto_198809 ) ) ( not ( = ?auto_198804 ?auto_198806 ) ) ( not ( = ?auto_198804 ?auto_198809 ) ) ( not ( = ?auto_198805 ?auto_198806 ) ) ( not ( = ?auto_198805 ?auto_198809 ) ) ( not ( = ?auto_198810 ?auto_198806 ) ) ( not ( = ?auto_198810 ?auto_198809 ) ) ( not ( = ?auto_198807 ?auto_198806 ) ) ( not ( = ?auto_198807 ?auto_198809 ) ) ( ON ?auto_198808 ?auto_198807 ) ( ON ?auto_198806 ?auto_198808 ) ( CLEAR ?auto_198806 ) ( HOLDING ?auto_198809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198809 )
      ( MAKE-3PILE ?auto_198803 ?auto_198804 ?auto_198805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198811 - BLOCK
      ?auto_198812 - BLOCK
      ?auto_198813 - BLOCK
    )
    :vars
    (
      ?auto_198816 - BLOCK
      ?auto_198818 - BLOCK
      ?auto_198814 - BLOCK
      ?auto_198817 - BLOCK
      ?auto_198815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198816 ?auto_198813 ) ( ON-TABLE ?auto_198811 ) ( ON ?auto_198812 ?auto_198811 ) ( ON ?auto_198813 ?auto_198812 ) ( not ( = ?auto_198811 ?auto_198812 ) ) ( not ( = ?auto_198811 ?auto_198813 ) ) ( not ( = ?auto_198811 ?auto_198816 ) ) ( not ( = ?auto_198812 ?auto_198813 ) ) ( not ( = ?auto_198812 ?auto_198816 ) ) ( not ( = ?auto_198813 ?auto_198816 ) ) ( not ( = ?auto_198811 ?auto_198818 ) ) ( not ( = ?auto_198811 ?auto_198814 ) ) ( not ( = ?auto_198812 ?auto_198818 ) ) ( not ( = ?auto_198812 ?auto_198814 ) ) ( not ( = ?auto_198813 ?auto_198818 ) ) ( not ( = ?auto_198813 ?auto_198814 ) ) ( not ( = ?auto_198816 ?auto_198818 ) ) ( not ( = ?auto_198816 ?auto_198814 ) ) ( not ( = ?auto_198818 ?auto_198814 ) ) ( ON ?auto_198818 ?auto_198816 ) ( not ( = ?auto_198817 ?auto_198815 ) ) ( not ( = ?auto_198817 ?auto_198814 ) ) ( not ( = ?auto_198815 ?auto_198814 ) ) ( not ( = ?auto_198811 ?auto_198815 ) ) ( not ( = ?auto_198811 ?auto_198817 ) ) ( not ( = ?auto_198812 ?auto_198815 ) ) ( not ( = ?auto_198812 ?auto_198817 ) ) ( not ( = ?auto_198813 ?auto_198815 ) ) ( not ( = ?auto_198813 ?auto_198817 ) ) ( not ( = ?auto_198816 ?auto_198815 ) ) ( not ( = ?auto_198816 ?auto_198817 ) ) ( not ( = ?auto_198818 ?auto_198815 ) ) ( not ( = ?auto_198818 ?auto_198817 ) ) ( ON ?auto_198814 ?auto_198818 ) ( ON ?auto_198815 ?auto_198814 ) ( ON ?auto_198817 ?auto_198815 ) ( CLEAR ?auto_198817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198811 ?auto_198812 ?auto_198813 ?auto_198816 ?auto_198818 ?auto_198814 ?auto_198815 )
      ( MAKE-3PILE ?auto_198811 ?auto_198812 ?auto_198813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198819 - BLOCK
      ?auto_198820 - BLOCK
      ?auto_198821 - BLOCK
    )
    :vars
    (
      ?auto_198825 - BLOCK
      ?auto_198826 - BLOCK
      ?auto_198824 - BLOCK
      ?auto_198822 - BLOCK
      ?auto_198823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198825 ?auto_198821 ) ( ON-TABLE ?auto_198819 ) ( ON ?auto_198820 ?auto_198819 ) ( ON ?auto_198821 ?auto_198820 ) ( not ( = ?auto_198819 ?auto_198820 ) ) ( not ( = ?auto_198819 ?auto_198821 ) ) ( not ( = ?auto_198819 ?auto_198825 ) ) ( not ( = ?auto_198820 ?auto_198821 ) ) ( not ( = ?auto_198820 ?auto_198825 ) ) ( not ( = ?auto_198821 ?auto_198825 ) ) ( not ( = ?auto_198819 ?auto_198826 ) ) ( not ( = ?auto_198819 ?auto_198824 ) ) ( not ( = ?auto_198820 ?auto_198826 ) ) ( not ( = ?auto_198820 ?auto_198824 ) ) ( not ( = ?auto_198821 ?auto_198826 ) ) ( not ( = ?auto_198821 ?auto_198824 ) ) ( not ( = ?auto_198825 ?auto_198826 ) ) ( not ( = ?auto_198825 ?auto_198824 ) ) ( not ( = ?auto_198826 ?auto_198824 ) ) ( ON ?auto_198826 ?auto_198825 ) ( not ( = ?auto_198822 ?auto_198823 ) ) ( not ( = ?auto_198822 ?auto_198824 ) ) ( not ( = ?auto_198823 ?auto_198824 ) ) ( not ( = ?auto_198819 ?auto_198823 ) ) ( not ( = ?auto_198819 ?auto_198822 ) ) ( not ( = ?auto_198820 ?auto_198823 ) ) ( not ( = ?auto_198820 ?auto_198822 ) ) ( not ( = ?auto_198821 ?auto_198823 ) ) ( not ( = ?auto_198821 ?auto_198822 ) ) ( not ( = ?auto_198825 ?auto_198823 ) ) ( not ( = ?auto_198825 ?auto_198822 ) ) ( not ( = ?auto_198826 ?auto_198823 ) ) ( not ( = ?auto_198826 ?auto_198822 ) ) ( ON ?auto_198824 ?auto_198826 ) ( ON ?auto_198823 ?auto_198824 ) ( HOLDING ?auto_198822 ) ( CLEAR ?auto_198823 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198819 ?auto_198820 ?auto_198821 ?auto_198825 ?auto_198826 ?auto_198824 ?auto_198823 ?auto_198822 )
      ( MAKE-3PILE ?auto_198819 ?auto_198820 ?auto_198821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198827 - BLOCK
      ?auto_198828 - BLOCK
      ?auto_198829 - BLOCK
    )
    :vars
    (
      ?auto_198830 - BLOCK
      ?auto_198833 - BLOCK
      ?auto_198834 - BLOCK
      ?auto_198831 - BLOCK
      ?auto_198832 - BLOCK
      ?auto_198835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198830 ?auto_198829 ) ( ON-TABLE ?auto_198827 ) ( ON ?auto_198828 ?auto_198827 ) ( ON ?auto_198829 ?auto_198828 ) ( not ( = ?auto_198827 ?auto_198828 ) ) ( not ( = ?auto_198827 ?auto_198829 ) ) ( not ( = ?auto_198827 ?auto_198830 ) ) ( not ( = ?auto_198828 ?auto_198829 ) ) ( not ( = ?auto_198828 ?auto_198830 ) ) ( not ( = ?auto_198829 ?auto_198830 ) ) ( not ( = ?auto_198827 ?auto_198833 ) ) ( not ( = ?auto_198827 ?auto_198834 ) ) ( not ( = ?auto_198828 ?auto_198833 ) ) ( not ( = ?auto_198828 ?auto_198834 ) ) ( not ( = ?auto_198829 ?auto_198833 ) ) ( not ( = ?auto_198829 ?auto_198834 ) ) ( not ( = ?auto_198830 ?auto_198833 ) ) ( not ( = ?auto_198830 ?auto_198834 ) ) ( not ( = ?auto_198833 ?auto_198834 ) ) ( ON ?auto_198833 ?auto_198830 ) ( not ( = ?auto_198831 ?auto_198832 ) ) ( not ( = ?auto_198831 ?auto_198834 ) ) ( not ( = ?auto_198832 ?auto_198834 ) ) ( not ( = ?auto_198827 ?auto_198832 ) ) ( not ( = ?auto_198827 ?auto_198831 ) ) ( not ( = ?auto_198828 ?auto_198832 ) ) ( not ( = ?auto_198828 ?auto_198831 ) ) ( not ( = ?auto_198829 ?auto_198832 ) ) ( not ( = ?auto_198829 ?auto_198831 ) ) ( not ( = ?auto_198830 ?auto_198832 ) ) ( not ( = ?auto_198830 ?auto_198831 ) ) ( not ( = ?auto_198833 ?auto_198832 ) ) ( not ( = ?auto_198833 ?auto_198831 ) ) ( ON ?auto_198834 ?auto_198833 ) ( ON ?auto_198832 ?auto_198834 ) ( CLEAR ?auto_198832 ) ( ON ?auto_198831 ?auto_198835 ) ( CLEAR ?auto_198831 ) ( HAND-EMPTY ) ( not ( = ?auto_198827 ?auto_198835 ) ) ( not ( = ?auto_198828 ?auto_198835 ) ) ( not ( = ?auto_198829 ?auto_198835 ) ) ( not ( = ?auto_198830 ?auto_198835 ) ) ( not ( = ?auto_198833 ?auto_198835 ) ) ( not ( = ?auto_198834 ?auto_198835 ) ) ( not ( = ?auto_198831 ?auto_198835 ) ) ( not ( = ?auto_198832 ?auto_198835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198831 ?auto_198835 )
      ( MAKE-3PILE ?auto_198827 ?auto_198828 ?auto_198829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198836 - BLOCK
      ?auto_198837 - BLOCK
      ?auto_198838 - BLOCK
    )
    :vars
    (
      ?auto_198843 - BLOCK
      ?auto_198839 - BLOCK
      ?auto_198842 - BLOCK
      ?auto_198840 - BLOCK
      ?auto_198844 - BLOCK
      ?auto_198841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198843 ?auto_198838 ) ( ON-TABLE ?auto_198836 ) ( ON ?auto_198837 ?auto_198836 ) ( ON ?auto_198838 ?auto_198837 ) ( not ( = ?auto_198836 ?auto_198837 ) ) ( not ( = ?auto_198836 ?auto_198838 ) ) ( not ( = ?auto_198836 ?auto_198843 ) ) ( not ( = ?auto_198837 ?auto_198838 ) ) ( not ( = ?auto_198837 ?auto_198843 ) ) ( not ( = ?auto_198838 ?auto_198843 ) ) ( not ( = ?auto_198836 ?auto_198839 ) ) ( not ( = ?auto_198836 ?auto_198842 ) ) ( not ( = ?auto_198837 ?auto_198839 ) ) ( not ( = ?auto_198837 ?auto_198842 ) ) ( not ( = ?auto_198838 ?auto_198839 ) ) ( not ( = ?auto_198838 ?auto_198842 ) ) ( not ( = ?auto_198843 ?auto_198839 ) ) ( not ( = ?auto_198843 ?auto_198842 ) ) ( not ( = ?auto_198839 ?auto_198842 ) ) ( ON ?auto_198839 ?auto_198843 ) ( not ( = ?auto_198840 ?auto_198844 ) ) ( not ( = ?auto_198840 ?auto_198842 ) ) ( not ( = ?auto_198844 ?auto_198842 ) ) ( not ( = ?auto_198836 ?auto_198844 ) ) ( not ( = ?auto_198836 ?auto_198840 ) ) ( not ( = ?auto_198837 ?auto_198844 ) ) ( not ( = ?auto_198837 ?auto_198840 ) ) ( not ( = ?auto_198838 ?auto_198844 ) ) ( not ( = ?auto_198838 ?auto_198840 ) ) ( not ( = ?auto_198843 ?auto_198844 ) ) ( not ( = ?auto_198843 ?auto_198840 ) ) ( not ( = ?auto_198839 ?auto_198844 ) ) ( not ( = ?auto_198839 ?auto_198840 ) ) ( ON ?auto_198842 ?auto_198839 ) ( ON ?auto_198840 ?auto_198841 ) ( CLEAR ?auto_198840 ) ( not ( = ?auto_198836 ?auto_198841 ) ) ( not ( = ?auto_198837 ?auto_198841 ) ) ( not ( = ?auto_198838 ?auto_198841 ) ) ( not ( = ?auto_198843 ?auto_198841 ) ) ( not ( = ?auto_198839 ?auto_198841 ) ) ( not ( = ?auto_198842 ?auto_198841 ) ) ( not ( = ?auto_198840 ?auto_198841 ) ) ( not ( = ?auto_198844 ?auto_198841 ) ) ( HOLDING ?auto_198844 ) ( CLEAR ?auto_198842 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198836 ?auto_198837 ?auto_198838 ?auto_198843 ?auto_198839 ?auto_198842 ?auto_198844 )
      ( MAKE-3PILE ?auto_198836 ?auto_198837 ?auto_198838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198845 - BLOCK
      ?auto_198846 - BLOCK
      ?auto_198847 - BLOCK
    )
    :vars
    (
      ?auto_198851 - BLOCK
      ?auto_198850 - BLOCK
      ?auto_198852 - BLOCK
      ?auto_198848 - BLOCK
      ?auto_198853 - BLOCK
      ?auto_198849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198851 ?auto_198847 ) ( ON-TABLE ?auto_198845 ) ( ON ?auto_198846 ?auto_198845 ) ( ON ?auto_198847 ?auto_198846 ) ( not ( = ?auto_198845 ?auto_198846 ) ) ( not ( = ?auto_198845 ?auto_198847 ) ) ( not ( = ?auto_198845 ?auto_198851 ) ) ( not ( = ?auto_198846 ?auto_198847 ) ) ( not ( = ?auto_198846 ?auto_198851 ) ) ( not ( = ?auto_198847 ?auto_198851 ) ) ( not ( = ?auto_198845 ?auto_198850 ) ) ( not ( = ?auto_198845 ?auto_198852 ) ) ( not ( = ?auto_198846 ?auto_198850 ) ) ( not ( = ?auto_198846 ?auto_198852 ) ) ( not ( = ?auto_198847 ?auto_198850 ) ) ( not ( = ?auto_198847 ?auto_198852 ) ) ( not ( = ?auto_198851 ?auto_198850 ) ) ( not ( = ?auto_198851 ?auto_198852 ) ) ( not ( = ?auto_198850 ?auto_198852 ) ) ( ON ?auto_198850 ?auto_198851 ) ( not ( = ?auto_198848 ?auto_198853 ) ) ( not ( = ?auto_198848 ?auto_198852 ) ) ( not ( = ?auto_198853 ?auto_198852 ) ) ( not ( = ?auto_198845 ?auto_198853 ) ) ( not ( = ?auto_198845 ?auto_198848 ) ) ( not ( = ?auto_198846 ?auto_198853 ) ) ( not ( = ?auto_198846 ?auto_198848 ) ) ( not ( = ?auto_198847 ?auto_198853 ) ) ( not ( = ?auto_198847 ?auto_198848 ) ) ( not ( = ?auto_198851 ?auto_198853 ) ) ( not ( = ?auto_198851 ?auto_198848 ) ) ( not ( = ?auto_198850 ?auto_198853 ) ) ( not ( = ?auto_198850 ?auto_198848 ) ) ( ON ?auto_198852 ?auto_198850 ) ( ON ?auto_198848 ?auto_198849 ) ( not ( = ?auto_198845 ?auto_198849 ) ) ( not ( = ?auto_198846 ?auto_198849 ) ) ( not ( = ?auto_198847 ?auto_198849 ) ) ( not ( = ?auto_198851 ?auto_198849 ) ) ( not ( = ?auto_198850 ?auto_198849 ) ) ( not ( = ?auto_198852 ?auto_198849 ) ) ( not ( = ?auto_198848 ?auto_198849 ) ) ( not ( = ?auto_198853 ?auto_198849 ) ) ( CLEAR ?auto_198852 ) ( ON ?auto_198853 ?auto_198848 ) ( CLEAR ?auto_198853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198849 ?auto_198848 )
      ( MAKE-3PILE ?auto_198845 ?auto_198846 ?auto_198847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198854 - BLOCK
      ?auto_198855 - BLOCK
      ?auto_198856 - BLOCK
    )
    :vars
    (
      ?auto_198862 - BLOCK
      ?auto_198860 - BLOCK
      ?auto_198861 - BLOCK
      ?auto_198859 - BLOCK
      ?auto_198858 - BLOCK
      ?auto_198857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198862 ?auto_198856 ) ( ON-TABLE ?auto_198854 ) ( ON ?auto_198855 ?auto_198854 ) ( ON ?auto_198856 ?auto_198855 ) ( not ( = ?auto_198854 ?auto_198855 ) ) ( not ( = ?auto_198854 ?auto_198856 ) ) ( not ( = ?auto_198854 ?auto_198862 ) ) ( not ( = ?auto_198855 ?auto_198856 ) ) ( not ( = ?auto_198855 ?auto_198862 ) ) ( not ( = ?auto_198856 ?auto_198862 ) ) ( not ( = ?auto_198854 ?auto_198860 ) ) ( not ( = ?auto_198854 ?auto_198861 ) ) ( not ( = ?auto_198855 ?auto_198860 ) ) ( not ( = ?auto_198855 ?auto_198861 ) ) ( not ( = ?auto_198856 ?auto_198860 ) ) ( not ( = ?auto_198856 ?auto_198861 ) ) ( not ( = ?auto_198862 ?auto_198860 ) ) ( not ( = ?auto_198862 ?auto_198861 ) ) ( not ( = ?auto_198860 ?auto_198861 ) ) ( ON ?auto_198860 ?auto_198862 ) ( not ( = ?auto_198859 ?auto_198858 ) ) ( not ( = ?auto_198859 ?auto_198861 ) ) ( not ( = ?auto_198858 ?auto_198861 ) ) ( not ( = ?auto_198854 ?auto_198858 ) ) ( not ( = ?auto_198854 ?auto_198859 ) ) ( not ( = ?auto_198855 ?auto_198858 ) ) ( not ( = ?auto_198855 ?auto_198859 ) ) ( not ( = ?auto_198856 ?auto_198858 ) ) ( not ( = ?auto_198856 ?auto_198859 ) ) ( not ( = ?auto_198862 ?auto_198858 ) ) ( not ( = ?auto_198862 ?auto_198859 ) ) ( not ( = ?auto_198860 ?auto_198858 ) ) ( not ( = ?auto_198860 ?auto_198859 ) ) ( ON ?auto_198859 ?auto_198857 ) ( not ( = ?auto_198854 ?auto_198857 ) ) ( not ( = ?auto_198855 ?auto_198857 ) ) ( not ( = ?auto_198856 ?auto_198857 ) ) ( not ( = ?auto_198862 ?auto_198857 ) ) ( not ( = ?auto_198860 ?auto_198857 ) ) ( not ( = ?auto_198861 ?auto_198857 ) ) ( not ( = ?auto_198859 ?auto_198857 ) ) ( not ( = ?auto_198858 ?auto_198857 ) ) ( ON ?auto_198858 ?auto_198859 ) ( CLEAR ?auto_198858 ) ( ON-TABLE ?auto_198857 ) ( HOLDING ?auto_198861 ) ( CLEAR ?auto_198860 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198854 ?auto_198855 ?auto_198856 ?auto_198862 ?auto_198860 ?auto_198861 )
      ( MAKE-3PILE ?auto_198854 ?auto_198855 ?auto_198856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198863 - BLOCK
      ?auto_198864 - BLOCK
      ?auto_198865 - BLOCK
    )
    :vars
    (
      ?auto_198870 - BLOCK
      ?auto_198866 - BLOCK
      ?auto_198869 - BLOCK
      ?auto_198867 - BLOCK
      ?auto_198871 - BLOCK
      ?auto_198868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198870 ?auto_198865 ) ( ON-TABLE ?auto_198863 ) ( ON ?auto_198864 ?auto_198863 ) ( ON ?auto_198865 ?auto_198864 ) ( not ( = ?auto_198863 ?auto_198864 ) ) ( not ( = ?auto_198863 ?auto_198865 ) ) ( not ( = ?auto_198863 ?auto_198870 ) ) ( not ( = ?auto_198864 ?auto_198865 ) ) ( not ( = ?auto_198864 ?auto_198870 ) ) ( not ( = ?auto_198865 ?auto_198870 ) ) ( not ( = ?auto_198863 ?auto_198866 ) ) ( not ( = ?auto_198863 ?auto_198869 ) ) ( not ( = ?auto_198864 ?auto_198866 ) ) ( not ( = ?auto_198864 ?auto_198869 ) ) ( not ( = ?auto_198865 ?auto_198866 ) ) ( not ( = ?auto_198865 ?auto_198869 ) ) ( not ( = ?auto_198870 ?auto_198866 ) ) ( not ( = ?auto_198870 ?auto_198869 ) ) ( not ( = ?auto_198866 ?auto_198869 ) ) ( ON ?auto_198866 ?auto_198870 ) ( not ( = ?auto_198867 ?auto_198871 ) ) ( not ( = ?auto_198867 ?auto_198869 ) ) ( not ( = ?auto_198871 ?auto_198869 ) ) ( not ( = ?auto_198863 ?auto_198871 ) ) ( not ( = ?auto_198863 ?auto_198867 ) ) ( not ( = ?auto_198864 ?auto_198871 ) ) ( not ( = ?auto_198864 ?auto_198867 ) ) ( not ( = ?auto_198865 ?auto_198871 ) ) ( not ( = ?auto_198865 ?auto_198867 ) ) ( not ( = ?auto_198870 ?auto_198871 ) ) ( not ( = ?auto_198870 ?auto_198867 ) ) ( not ( = ?auto_198866 ?auto_198871 ) ) ( not ( = ?auto_198866 ?auto_198867 ) ) ( ON ?auto_198867 ?auto_198868 ) ( not ( = ?auto_198863 ?auto_198868 ) ) ( not ( = ?auto_198864 ?auto_198868 ) ) ( not ( = ?auto_198865 ?auto_198868 ) ) ( not ( = ?auto_198870 ?auto_198868 ) ) ( not ( = ?auto_198866 ?auto_198868 ) ) ( not ( = ?auto_198869 ?auto_198868 ) ) ( not ( = ?auto_198867 ?auto_198868 ) ) ( not ( = ?auto_198871 ?auto_198868 ) ) ( ON ?auto_198871 ?auto_198867 ) ( ON-TABLE ?auto_198868 ) ( CLEAR ?auto_198866 ) ( ON ?auto_198869 ?auto_198871 ) ( CLEAR ?auto_198869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198868 ?auto_198867 ?auto_198871 )
      ( MAKE-3PILE ?auto_198863 ?auto_198864 ?auto_198865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198872 - BLOCK
      ?auto_198873 - BLOCK
      ?auto_198874 - BLOCK
    )
    :vars
    (
      ?auto_198876 - BLOCK
      ?auto_198877 - BLOCK
      ?auto_198878 - BLOCK
      ?auto_198875 - BLOCK
      ?auto_198879 - BLOCK
      ?auto_198880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198876 ?auto_198874 ) ( ON-TABLE ?auto_198872 ) ( ON ?auto_198873 ?auto_198872 ) ( ON ?auto_198874 ?auto_198873 ) ( not ( = ?auto_198872 ?auto_198873 ) ) ( not ( = ?auto_198872 ?auto_198874 ) ) ( not ( = ?auto_198872 ?auto_198876 ) ) ( not ( = ?auto_198873 ?auto_198874 ) ) ( not ( = ?auto_198873 ?auto_198876 ) ) ( not ( = ?auto_198874 ?auto_198876 ) ) ( not ( = ?auto_198872 ?auto_198877 ) ) ( not ( = ?auto_198872 ?auto_198878 ) ) ( not ( = ?auto_198873 ?auto_198877 ) ) ( not ( = ?auto_198873 ?auto_198878 ) ) ( not ( = ?auto_198874 ?auto_198877 ) ) ( not ( = ?auto_198874 ?auto_198878 ) ) ( not ( = ?auto_198876 ?auto_198877 ) ) ( not ( = ?auto_198876 ?auto_198878 ) ) ( not ( = ?auto_198877 ?auto_198878 ) ) ( not ( = ?auto_198875 ?auto_198879 ) ) ( not ( = ?auto_198875 ?auto_198878 ) ) ( not ( = ?auto_198879 ?auto_198878 ) ) ( not ( = ?auto_198872 ?auto_198879 ) ) ( not ( = ?auto_198872 ?auto_198875 ) ) ( not ( = ?auto_198873 ?auto_198879 ) ) ( not ( = ?auto_198873 ?auto_198875 ) ) ( not ( = ?auto_198874 ?auto_198879 ) ) ( not ( = ?auto_198874 ?auto_198875 ) ) ( not ( = ?auto_198876 ?auto_198879 ) ) ( not ( = ?auto_198876 ?auto_198875 ) ) ( not ( = ?auto_198877 ?auto_198879 ) ) ( not ( = ?auto_198877 ?auto_198875 ) ) ( ON ?auto_198875 ?auto_198880 ) ( not ( = ?auto_198872 ?auto_198880 ) ) ( not ( = ?auto_198873 ?auto_198880 ) ) ( not ( = ?auto_198874 ?auto_198880 ) ) ( not ( = ?auto_198876 ?auto_198880 ) ) ( not ( = ?auto_198877 ?auto_198880 ) ) ( not ( = ?auto_198878 ?auto_198880 ) ) ( not ( = ?auto_198875 ?auto_198880 ) ) ( not ( = ?auto_198879 ?auto_198880 ) ) ( ON ?auto_198879 ?auto_198875 ) ( ON-TABLE ?auto_198880 ) ( ON ?auto_198878 ?auto_198879 ) ( CLEAR ?auto_198878 ) ( HOLDING ?auto_198877 ) ( CLEAR ?auto_198876 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_198872 ?auto_198873 ?auto_198874 ?auto_198876 ?auto_198877 )
      ( MAKE-3PILE ?auto_198872 ?auto_198873 ?auto_198874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198881 - BLOCK
      ?auto_198882 - BLOCK
      ?auto_198883 - BLOCK
    )
    :vars
    (
      ?auto_198885 - BLOCK
      ?auto_198887 - BLOCK
      ?auto_198888 - BLOCK
      ?auto_198889 - BLOCK
      ?auto_198884 - BLOCK
      ?auto_198886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_198885 ?auto_198883 ) ( ON-TABLE ?auto_198881 ) ( ON ?auto_198882 ?auto_198881 ) ( ON ?auto_198883 ?auto_198882 ) ( not ( = ?auto_198881 ?auto_198882 ) ) ( not ( = ?auto_198881 ?auto_198883 ) ) ( not ( = ?auto_198881 ?auto_198885 ) ) ( not ( = ?auto_198882 ?auto_198883 ) ) ( not ( = ?auto_198882 ?auto_198885 ) ) ( not ( = ?auto_198883 ?auto_198885 ) ) ( not ( = ?auto_198881 ?auto_198887 ) ) ( not ( = ?auto_198881 ?auto_198888 ) ) ( not ( = ?auto_198882 ?auto_198887 ) ) ( not ( = ?auto_198882 ?auto_198888 ) ) ( not ( = ?auto_198883 ?auto_198887 ) ) ( not ( = ?auto_198883 ?auto_198888 ) ) ( not ( = ?auto_198885 ?auto_198887 ) ) ( not ( = ?auto_198885 ?auto_198888 ) ) ( not ( = ?auto_198887 ?auto_198888 ) ) ( not ( = ?auto_198889 ?auto_198884 ) ) ( not ( = ?auto_198889 ?auto_198888 ) ) ( not ( = ?auto_198884 ?auto_198888 ) ) ( not ( = ?auto_198881 ?auto_198884 ) ) ( not ( = ?auto_198881 ?auto_198889 ) ) ( not ( = ?auto_198882 ?auto_198884 ) ) ( not ( = ?auto_198882 ?auto_198889 ) ) ( not ( = ?auto_198883 ?auto_198884 ) ) ( not ( = ?auto_198883 ?auto_198889 ) ) ( not ( = ?auto_198885 ?auto_198884 ) ) ( not ( = ?auto_198885 ?auto_198889 ) ) ( not ( = ?auto_198887 ?auto_198884 ) ) ( not ( = ?auto_198887 ?auto_198889 ) ) ( ON ?auto_198889 ?auto_198886 ) ( not ( = ?auto_198881 ?auto_198886 ) ) ( not ( = ?auto_198882 ?auto_198886 ) ) ( not ( = ?auto_198883 ?auto_198886 ) ) ( not ( = ?auto_198885 ?auto_198886 ) ) ( not ( = ?auto_198887 ?auto_198886 ) ) ( not ( = ?auto_198888 ?auto_198886 ) ) ( not ( = ?auto_198889 ?auto_198886 ) ) ( not ( = ?auto_198884 ?auto_198886 ) ) ( ON ?auto_198884 ?auto_198889 ) ( ON-TABLE ?auto_198886 ) ( ON ?auto_198888 ?auto_198884 ) ( CLEAR ?auto_198885 ) ( ON ?auto_198887 ?auto_198888 ) ( CLEAR ?auto_198887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198886 ?auto_198889 ?auto_198884 ?auto_198888 )
      ( MAKE-3PILE ?auto_198881 ?auto_198882 ?auto_198883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198908 - BLOCK
      ?auto_198909 - BLOCK
      ?auto_198910 - BLOCK
    )
    :vars
    (
      ?auto_198915 - BLOCK
      ?auto_198911 - BLOCK
      ?auto_198913 - BLOCK
      ?auto_198912 - BLOCK
      ?auto_198916 - BLOCK
      ?auto_198914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198908 ) ( ON ?auto_198909 ?auto_198908 ) ( not ( = ?auto_198908 ?auto_198909 ) ) ( not ( = ?auto_198908 ?auto_198910 ) ) ( not ( = ?auto_198908 ?auto_198915 ) ) ( not ( = ?auto_198909 ?auto_198910 ) ) ( not ( = ?auto_198909 ?auto_198915 ) ) ( not ( = ?auto_198910 ?auto_198915 ) ) ( not ( = ?auto_198908 ?auto_198911 ) ) ( not ( = ?auto_198908 ?auto_198913 ) ) ( not ( = ?auto_198909 ?auto_198911 ) ) ( not ( = ?auto_198909 ?auto_198913 ) ) ( not ( = ?auto_198910 ?auto_198911 ) ) ( not ( = ?auto_198910 ?auto_198913 ) ) ( not ( = ?auto_198915 ?auto_198911 ) ) ( not ( = ?auto_198915 ?auto_198913 ) ) ( not ( = ?auto_198911 ?auto_198913 ) ) ( not ( = ?auto_198912 ?auto_198916 ) ) ( not ( = ?auto_198912 ?auto_198913 ) ) ( not ( = ?auto_198916 ?auto_198913 ) ) ( not ( = ?auto_198908 ?auto_198916 ) ) ( not ( = ?auto_198908 ?auto_198912 ) ) ( not ( = ?auto_198909 ?auto_198916 ) ) ( not ( = ?auto_198909 ?auto_198912 ) ) ( not ( = ?auto_198910 ?auto_198916 ) ) ( not ( = ?auto_198910 ?auto_198912 ) ) ( not ( = ?auto_198915 ?auto_198916 ) ) ( not ( = ?auto_198915 ?auto_198912 ) ) ( not ( = ?auto_198911 ?auto_198916 ) ) ( not ( = ?auto_198911 ?auto_198912 ) ) ( ON ?auto_198912 ?auto_198914 ) ( not ( = ?auto_198908 ?auto_198914 ) ) ( not ( = ?auto_198909 ?auto_198914 ) ) ( not ( = ?auto_198910 ?auto_198914 ) ) ( not ( = ?auto_198915 ?auto_198914 ) ) ( not ( = ?auto_198911 ?auto_198914 ) ) ( not ( = ?auto_198913 ?auto_198914 ) ) ( not ( = ?auto_198912 ?auto_198914 ) ) ( not ( = ?auto_198916 ?auto_198914 ) ) ( ON ?auto_198916 ?auto_198912 ) ( ON-TABLE ?auto_198914 ) ( ON ?auto_198913 ?auto_198916 ) ( ON ?auto_198911 ?auto_198913 ) ( ON ?auto_198915 ?auto_198911 ) ( CLEAR ?auto_198915 ) ( HOLDING ?auto_198910 ) ( CLEAR ?auto_198909 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198908 ?auto_198909 ?auto_198910 ?auto_198915 )
      ( MAKE-3PILE ?auto_198908 ?auto_198909 ?auto_198910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198917 - BLOCK
      ?auto_198918 - BLOCK
      ?auto_198919 - BLOCK
    )
    :vars
    (
      ?auto_198922 - BLOCK
      ?auto_198925 - BLOCK
      ?auto_198921 - BLOCK
      ?auto_198920 - BLOCK
      ?auto_198923 - BLOCK
      ?auto_198924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198917 ) ( ON ?auto_198918 ?auto_198917 ) ( not ( = ?auto_198917 ?auto_198918 ) ) ( not ( = ?auto_198917 ?auto_198919 ) ) ( not ( = ?auto_198917 ?auto_198922 ) ) ( not ( = ?auto_198918 ?auto_198919 ) ) ( not ( = ?auto_198918 ?auto_198922 ) ) ( not ( = ?auto_198919 ?auto_198922 ) ) ( not ( = ?auto_198917 ?auto_198925 ) ) ( not ( = ?auto_198917 ?auto_198921 ) ) ( not ( = ?auto_198918 ?auto_198925 ) ) ( not ( = ?auto_198918 ?auto_198921 ) ) ( not ( = ?auto_198919 ?auto_198925 ) ) ( not ( = ?auto_198919 ?auto_198921 ) ) ( not ( = ?auto_198922 ?auto_198925 ) ) ( not ( = ?auto_198922 ?auto_198921 ) ) ( not ( = ?auto_198925 ?auto_198921 ) ) ( not ( = ?auto_198920 ?auto_198923 ) ) ( not ( = ?auto_198920 ?auto_198921 ) ) ( not ( = ?auto_198923 ?auto_198921 ) ) ( not ( = ?auto_198917 ?auto_198923 ) ) ( not ( = ?auto_198917 ?auto_198920 ) ) ( not ( = ?auto_198918 ?auto_198923 ) ) ( not ( = ?auto_198918 ?auto_198920 ) ) ( not ( = ?auto_198919 ?auto_198923 ) ) ( not ( = ?auto_198919 ?auto_198920 ) ) ( not ( = ?auto_198922 ?auto_198923 ) ) ( not ( = ?auto_198922 ?auto_198920 ) ) ( not ( = ?auto_198925 ?auto_198923 ) ) ( not ( = ?auto_198925 ?auto_198920 ) ) ( ON ?auto_198920 ?auto_198924 ) ( not ( = ?auto_198917 ?auto_198924 ) ) ( not ( = ?auto_198918 ?auto_198924 ) ) ( not ( = ?auto_198919 ?auto_198924 ) ) ( not ( = ?auto_198922 ?auto_198924 ) ) ( not ( = ?auto_198925 ?auto_198924 ) ) ( not ( = ?auto_198921 ?auto_198924 ) ) ( not ( = ?auto_198920 ?auto_198924 ) ) ( not ( = ?auto_198923 ?auto_198924 ) ) ( ON ?auto_198923 ?auto_198920 ) ( ON-TABLE ?auto_198924 ) ( ON ?auto_198921 ?auto_198923 ) ( ON ?auto_198925 ?auto_198921 ) ( ON ?auto_198922 ?auto_198925 ) ( CLEAR ?auto_198918 ) ( ON ?auto_198919 ?auto_198922 ) ( CLEAR ?auto_198919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_198924 ?auto_198920 ?auto_198923 ?auto_198921 ?auto_198925 ?auto_198922 )
      ( MAKE-3PILE ?auto_198917 ?auto_198918 ?auto_198919 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198926 - BLOCK
      ?auto_198927 - BLOCK
      ?auto_198928 - BLOCK
    )
    :vars
    (
      ?auto_198934 - BLOCK
      ?auto_198931 - BLOCK
      ?auto_198932 - BLOCK
      ?auto_198930 - BLOCK
      ?auto_198933 - BLOCK
      ?auto_198929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198926 ) ( not ( = ?auto_198926 ?auto_198927 ) ) ( not ( = ?auto_198926 ?auto_198928 ) ) ( not ( = ?auto_198926 ?auto_198934 ) ) ( not ( = ?auto_198927 ?auto_198928 ) ) ( not ( = ?auto_198927 ?auto_198934 ) ) ( not ( = ?auto_198928 ?auto_198934 ) ) ( not ( = ?auto_198926 ?auto_198931 ) ) ( not ( = ?auto_198926 ?auto_198932 ) ) ( not ( = ?auto_198927 ?auto_198931 ) ) ( not ( = ?auto_198927 ?auto_198932 ) ) ( not ( = ?auto_198928 ?auto_198931 ) ) ( not ( = ?auto_198928 ?auto_198932 ) ) ( not ( = ?auto_198934 ?auto_198931 ) ) ( not ( = ?auto_198934 ?auto_198932 ) ) ( not ( = ?auto_198931 ?auto_198932 ) ) ( not ( = ?auto_198930 ?auto_198933 ) ) ( not ( = ?auto_198930 ?auto_198932 ) ) ( not ( = ?auto_198933 ?auto_198932 ) ) ( not ( = ?auto_198926 ?auto_198933 ) ) ( not ( = ?auto_198926 ?auto_198930 ) ) ( not ( = ?auto_198927 ?auto_198933 ) ) ( not ( = ?auto_198927 ?auto_198930 ) ) ( not ( = ?auto_198928 ?auto_198933 ) ) ( not ( = ?auto_198928 ?auto_198930 ) ) ( not ( = ?auto_198934 ?auto_198933 ) ) ( not ( = ?auto_198934 ?auto_198930 ) ) ( not ( = ?auto_198931 ?auto_198933 ) ) ( not ( = ?auto_198931 ?auto_198930 ) ) ( ON ?auto_198930 ?auto_198929 ) ( not ( = ?auto_198926 ?auto_198929 ) ) ( not ( = ?auto_198927 ?auto_198929 ) ) ( not ( = ?auto_198928 ?auto_198929 ) ) ( not ( = ?auto_198934 ?auto_198929 ) ) ( not ( = ?auto_198931 ?auto_198929 ) ) ( not ( = ?auto_198932 ?auto_198929 ) ) ( not ( = ?auto_198930 ?auto_198929 ) ) ( not ( = ?auto_198933 ?auto_198929 ) ) ( ON ?auto_198933 ?auto_198930 ) ( ON-TABLE ?auto_198929 ) ( ON ?auto_198932 ?auto_198933 ) ( ON ?auto_198931 ?auto_198932 ) ( ON ?auto_198934 ?auto_198931 ) ( ON ?auto_198928 ?auto_198934 ) ( CLEAR ?auto_198928 ) ( HOLDING ?auto_198927 ) ( CLEAR ?auto_198926 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_198926 ?auto_198927 )
      ( MAKE-3PILE ?auto_198926 ?auto_198927 ?auto_198928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198935 - BLOCK
      ?auto_198936 - BLOCK
      ?auto_198937 - BLOCK
    )
    :vars
    (
      ?auto_198939 - BLOCK
      ?auto_198941 - BLOCK
      ?auto_198940 - BLOCK
      ?auto_198938 - BLOCK
      ?auto_198942 - BLOCK
      ?auto_198943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198935 ) ( not ( = ?auto_198935 ?auto_198936 ) ) ( not ( = ?auto_198935 ?auto_198937 ) ) ( not ( = ?auto_198935 ?auto_198939 ) ) ( not ( = ?auto_198936 ?auto_198937 ) ) ( not ( = ?auto_198936 ?auto_198939 ) ) ( not ( = ?auto_198937 ?auto_198939 ) ) ( not ( = ?auto_198935 ?auto_198941 ) ) ( not ( = ?auto_198935 ?auto_198940 ) ) ( not ( = ?auto_198936 ?auto_198941 ) ) ( not ( = ?auto_198936 ?auto_198940 ) ) ( not ( = ?auto_198937 ?auto_198941 ) ) ( not ( = ?auto_198937 ?auto_198940 ) ) ( not ( = ?auto_198939 ?auto_198941 ) ) ( not ( = ?auto_198939 ?auto_198940 ) ) ( not ( = ?auto_198941 ?auto_198940 ) ) ( not ( = ?auto_198938 ?auto_198942 ) ) ( not ( = ?auto_198938 ?auto_198940 ) ) ( not ( = ?auto_198942 ?auto_198940 ) ) ( not ( = ?auto_198935 ?auto_198942 ) ) ( not ( = ?auto_198935 ?auto_198938 ) ) ( not ( = ?auto_198936 ?auto_198942 ) ) ( not ( = ?auto_198936 ?auto_198938 ) ) ( not ( = ?auto_198937 ?auto_198942 ) ) ( not ( = ?auto_198937 ?auto_198938 ) ) ( not ( = ?auto_198939 ?auto_198942 ) ) ( not ( = ?auto_198939 ?auto_198938 ) ) ( not ( = ?auto_198941 ?auto_198942 ) ) ( not ( = ?auto_198941 ?auto_198938 ) ) ( ON ?auto_198938 ?auto_198943 ) ( not ( = ?auto_198935 ?auto_198943 ) ) ( not ( = ?auto_198936 ?auto_198943 ) ) ( not ( = ?auto_198937 ?auto_198943 ) ) ( not ( = ?auto_198939 ?auto_198943 ) ) ( not ( = ?auto_198941 ?auto_198943 ) ) ( not ( = ?auto_198940 ?auto_198943 ) ) ( not ( = ?auto_198938 ?auto_198943 ) ) ( not ( = ?auto_198942 ?auto_198943 ) ) ( ON ?auto_198942 ?auto_198938 ) ( ON-TABLE ?auto_198943 ) ( ON ?auto_198940 ?auto_198942 ) ( ON ?auto_198941 ?auto_198940 ) ( ON ?auto_198939 ?auto_198941 ) ( ON ?auto_198937 ?auto_198939 ) ( CLEAR ?auto_198935 ) ( ON ?auto_198936 ?auto_198937 ) ( CLEAR ?auto_198936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_198943 ?auto_198938 ?auto_198942 ?auto_198940 ?auto_198941 ?auto_198939 ?auto_198937 )
      ( MAKE-3PILE ?auto_198935 ?auto_198936 ?auto_198937 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198944 - BLOCK
      ?auto_198945 - BLOCK
      ?auto_198946 - BLOCK
    )
    :vars
    (
      ?auto_198951 - BLOCK
      ?auto_198950 - BLOCK
      ?auto_198948 - BLOCK
      ?auto_198952 - BLOCK
      ?auto_198947 - BLOCK
      ?auto_198949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198944 ?auto_198945 ) ) ( not ( = ?auto_198944 ?auto_198946 ) ) ( not ( = ?auto_198944 ?auto_198951 ) ) ( not ( = ?auto_198945 ?auto_198946 ) ) ( not ( = ?auto_198945 ?auto_198951 ) ) ( not ( = ?auto_198946 ?auto_198951 ) ) ( not ( = ?auto_198944 ?auto_198950 ) ) ( not ( = ?auto_198944 ?auto_198948 ) ) ( not ( = ?auto_198945 ?auto_198950 ) ) ( not ( = ?auto_198945 ?auto_198948 ) ) ( not ( = ?auto_198946 ?auto_198950 ) ) ( not ( = ?auto_198946 ?auto_198948 ) ) ( not ( = ?auto_198951 ?auto_198950 ) ) ( not ( = ?auto_198951 ?auto_198948 ) ) ( not ( = ?auto_198950 ?auto_198948 ) ) ( not ( = ?auto_198952 ?auto_198947 ) ) ( not ( = ?auto_198952 ?auto_198948 ) ) ( not ( = ?auto_198947 ?auto_198948 ) ) ( not ( = ?auto_198944 ?auto_198947 ) ) ( not ( = ?auto_198944 ?auto_198952 ) ) ( not ( = ?auto_198945 ?auto_198947 ) ) ( not ( = ?auto_198945 ?auto_198952 ) ) ( not ( = ?auto_198946 ?auto_198947 ) ) ( not ( = ?auto_198946 ?auto_198952 ) ) ( not ( = ?auto_198951 ?auto_198947 ) ) ( not ( = ?auto_198951 ?auto_198952 ) ) ( not ( = ?auto_198950 ?auto_198947 ) ) ( not ( = ?auto_198950 ?auto_198952 ) ) ( ON ?auto_198952 ?auto_198949 ) ( not ( = ?auto_198944 ?auto_198949 ) ) ( not ( = ?auto_198945 ?auto_198949 ) ) ( not ( = ?auto_198946 ?auto_198949 ) ) ( not ( = ?auto_198951 ?auto_198949 ) ) ( not ( = ?auto_198950 ?auto_198949 ) ) ( not ( = ?auto_198948 ?auto_198949 ) ) ( not ( = ?auto_198952 ?auto_198949 ) ) ( not ( = ?auto_198947 ?auto_198949 ) ) ( ON ?auto_198947 ?auto_198952 ) ( ON-TABLE ?auto_198949 ) ( ON ?auto_198948 ?auto_198947 ) ( ON ?auto_198950 ?auto_198948 ) ( ON ?auto_198951 ?auto_198950 ) ( ON ?auto_198946 ?auto_198951 ) ( ON ?auto_198945 ?auto_198946 ) ( CLEAR ?auto_198945 ) ( HOLDING ?auto_198944 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_198944 )
      ( MAKE-3PILE ?auto_198944 ?auto_198945 ?auto_198946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_198953 - BLOCK
      ?auto_198954 - BLOCK
      ?auto_198955 - BLOCK
    )
    :vars
    (
      ?auto_198958 - BLOCK
      ?auto_198959 - BLOCK
      ?auto_198960 - BLOCK
      ?auto_198961 - BLOCK
      ?auto_198956 - BLOCK
      ?auto_198957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_198953 ?auto_198954 ) ) ( not ( = ?auto_198953 ?auto_198955 ) ) ( not ( = ?auto_198953 ?auto_198958 ) ) ( not ( = ?auto_198954 ?auto_198955 ) ) ( not ( = ?auto_198954 ?auto_198958 ) ) ( not ( = ?auto_198955 ?auto_198958 ) ) ( not ( = ?auto_198953 ?auto_198959 ) ) ( not ( = ?auto_198953 ?auto_198960 ) ) ( not ( = ?auto_198954 ?auto_198959 ) ) ( not ( = ?auto_198954 ?auto_198960 ) ) ( not ( = ?auto_198955 ?auto_198959 ) ) ( not ( = ?auto_198955 ?auto_198960 ) ) ( not ( = ?auto_198958 ?auto_198959 ) ) ( not ( = ?auto_198958 ?auto_198960 ) ) ( not ( = ?auto_198959 ?auto_198960 ) ) ( not ( = ?auto_198961 ?auto_198956 ) ) ( not ( = ?auto_198961 ?auto_198960 ) ) ( not ( = ?auto_198956 ?auto_198960 ) ) ( not ( = ?auto_198953 ?auto_198956 ) ) ( not ( = ?auto_198953 ?auto_198961 ) ) ( not ( = ?auto_198954 ?auto_198956 ) ) ( not ( = ?auto_198954 ?auto_198961 ) ) ( not ( = ?auto_198955 ?auto_198956 ) ) ( not ( = ?auto_198955 ?auto_198961 ) ) ( not ( = ?auto_198958 ?auto_198956 ) ) ( not ( = ?auto_198958 ?auto_198961 ) ) ( not ( = ?auto_198959 ?auto_198956 ) ) ( not ( = ?auto_198959 ?auto_198961 ) ) ( ON ?auto_198961 ?auto_198957 ) ( not ( = ?auto_198953 ?auto_198957 ) ) ( not ( = ?auto_198954 ?auto_198957 ) ) ( not ( = ?auto_198955 ?auto_198957 ) ) ( not ( = ?auto_198958 ?auto_198957 ) ) ( not ( = ?auto_198959 ?auto_198957 ) ) ( not ( = ?auto_198960 ?auto_198957 ) ) ( not ( = ?auto_198961 ?auto_198957 ) ) ( not ( = ?auto_198956 ?auto_198957 ) ) ( ON ?auto_198956 ?auto_198961 ) ( ON-TABLE ?auto_198957 ) ( ON ?auto_198960 ?auto_198956 ) ( ON ?auto_198959 ?auto_198960 ) ( ON ?auto_198958 ?auto_198959 ) ( ON ?auto_198955 ?auto_198958 ) ( ON ?auto_198954 ?auto_198955 ) ( ON ?auto_198953 ?auto_198954 ) ( CLEAR ?auto_198953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_198957 ?auto_198961 ?auto_198956 ?auto_198960 ?auto_198959 ?auto_198958 ?auto_198955 ?auto_198954 )
      ( MAKE-3PILE ?auto_198953 ?auto_198954 ?auto_198955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198967 - BLOCK
      ?auto_198968 - BLOCK
      ?auto_198969 - BLOCK
      ?auto_198970 - BLOCK
      ?auto_198971 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_198971 ) ( CLEAR ?auto_198970 ) ( ON-TABLE ?auto_198967 ) ( ON ?auto_198968 ?auto_198967 ) ( ON ?auto_198969 ?auto_198968 ) ( ON ?auto_198970 ?auto_198969 ) ( not ( = ?auto_198967 ?auto_198968 ) ) ( not ( = ?auto_198967 ?auto_198969 ) ) ( not ( = ?auto_198967 ?auto_198970 ) ) ( not ( = ?auto_198967 ?auto_198971 ) ) ( not ( = ?auto_198968 ?auto_198969 ) ) ( not ( = ?auto_198968 ?auto_198970 ) ) ( not ( = ?auto_198968 ?auto_198971 ) ) ( not ( = ?auto_198969 ?auto_198970 ) ) ( not ( = ?auto_198969 ?auto_198971 ) ) ( not ( = ?auto_198970 ?auto_198971 ) ) )
    :subtasks
    ( ( !STACK ?auto_198971 ?auto_198970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198972 - BLOCK
      ?auto_198973 - BLOCK
      ?auto_198974 - BLOCK
      ?auto_198975 - BLOCK
      ?auto_198976 - BLOCK
    )
    :vars
    (
      ?auto_198977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_198975 ) ( ON-TABLE ?auto_198972 ) ( ON ?auto_198973 ?auto_198972 ) ( ON ?auto_198974 ?auto_198973 ) ( ON ?auto_198975 ?auto_198974 ) ( not ( = ?auto_198972 ?auto_198973 ) ) ( not ( = ?auto_198972 ?auto_198974 ) ) ( not ( = ?auto_198972 ?auto_198975 ) ) ( not ( = ?auto_198972 ?auto_198976 ) ) ( not ( = ?auto_198973 ?auto_198974 ) ) ( not ( = ?auto_198973 ?auto_198975 ) ) ( not ( = ?auto_198973 ?auto_198976 ) ) ( not ( = ?auto_198974 ?auto_198975 ) ) ( not ( = ?auto_198974 ?auto_198976 ) ) ( not ( = ?auto_198975 ?auto_198976 ) ) ( ON ?auto_198976 ?auto_198977 ) ( CLEAR ?auto_198976 ) ( HAND-EMPTY ) ( not ( = ?auto_198972 ?auto_198977 ) ) ( not ( = ?auto_198973 ?auto_198977 ) ) ( not ( = ?auto_198974 ?auto_198977 ) ) ( not ( = ?auto_198975 ?auto_198977 ) ) ( not ( = ?auto_198976 ?auto_198977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_198976 ?auto_198977 )
      ( MAKE-5PILE ?auto_198972 ?auto_198973 ?auto_198974 ?auto_198975 ?auto_198976 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198978 - BLOCK
      ?auto_198979 - BLOCK
      ?auto_198980 - BLOCK
      ?auto_198981 - BLOCK
      ?auto_198982 - BLOCK
    )
    :vars
    (
      ?auto_198983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198978 ) ( ON ?auto_198979 ?auto_198978 ) ( ON ?auto_198980 ?auto_198979 ) ( not ( = ?auto_198978 ?auto_198979 ) ) ( not ( = ?auto_198978 ?auto_198980 ) ) ( not ( = ?auto_198978 ?auto_198981 ) ) ( not ( = ?auto_198978 ?auto_198982 ) ) ( not ( = ?auto_198979 ?auto_198980 ) ) ( not ( = ?auto_198979 ?auto_198981 ) ) ( not ( = ?auto_198979 ?auto_198982 ) ) ( not ( = ?auto_198980 ?auto_198981 ) ) ( not ( = ?auto_198980 ?auto_198982 ) ) ( not ( = ?auto_198981 ?auto_198982 ) ) ( ON ?auto_198982 ?auto_198983 ) ( CLEAR ?auto_198982 ) ( not ( = ?auto_198978 ?auto_198983 ) ) ( not ( = ?auto_198979 ?auto_198983 ) ) ( not ( = ?auto_198980 ?auto_198983 ) ) ( not ( = ?auto_198981 ?auto_198983 ) ) ( not ( = ?auto_198982 ?auto_198983 ) ) ( HOLDING ?auto_198981 ) ( CLEAR ?auto_198980 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198978 ?auto_198979 ?auto_198980 ?auto_198981 )
      ( MAKE-5PILE ?auto_198978 ?auto_198979 ?auto_198980 ?auto_198981 ?auto_198982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198984 - BLOCK
      ?auto_198985 - BLOCK
      ?auto_198986 - BLOCK
      ?auto_198987 - BLOCK
      ?auto_198988 - BLOCK
    )
    :vars
    (
      ?auto_198989 - BLOCK
      ?auto_198990 - BLOCK
      ?auto_198991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198984 ) ( ON ?auto_198985 ?auto_198984 ) ( ON ?auto_198986 ?auto_198985 ) ( not ( = ?auto_198984 ?auto_198985 ) ) ( not ( = ?auto_198984 ?auto_198986 ) ) ( not ( = ?auto_198984 ?auto_198987 ) ) ( not ( = ?auto_198984 ?auto_198988 ) ) ( not ( = ?auto_198985 ?auto_198986 ) ) ( not ( = ?auto_198985 ?auto_198987 ) ) ( not ( = ?auto_198985 ?auto_198988 ) ) ( not ( = ?auto_198986 ?auto_198987 ) ) ( not ( = ?auto_198986 ?auto_198988 ) ) ( not ( = ?auto_198987 ?auto_198988 ) ) ( ON ?auto_198988 ?auto_198989 ) ( not ( = ?auto_198984 ?auto_198989 ) ) ( not ( = ?auto_198985 ?auto_198989 ) ) ( not ( = ?auto_198986 ?auto_198989 ) ) ( not ( = ?auto_198987 ?auto_198989 ) ) ( not ( = ?auto_198988 ?auto_198989 ) ) ( CLEAR ?auto_198986 ) ( ON ?auto_198987 ?auto_198988 ) ( CLEAR ?auto_198987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_198990 ) ( ON ?auto_198991 ?auto_198990 ) ( ON ?auto_198989 ?auto_198991 ) ( not ( = ?auto_198990 ?auto_198991 ) ) ( not ( = ?auto_198990 ?auto_198989 ) ) ( not ( = ?auto_198990 ?auto_198988 ) ) ( not ( = ?auto_198990 ?auto_198987 ) ) ( not ( = ?auto_198991 ?auto_198989 ) ) ( not ( = ?auto_198991 ?auto_198988 ) ) ( not ( = ?auto_198991 ?auto_198987 ) ) ( not ( = ?auto_198984 ?auto_198990 ) ) ( not ( = ?auto_198984 ?auto_198991 ) ) ( not ( = ?auto_198985 ?auto_198990 ) ) ( not ( = ?auto_198985 ?auto_198991 ) ) ( not ( = ?auto_198986 ?auto_198990 ) ) ( not ( = ?auto_198986 ?auto_198991 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_198990 ?auto_198991 ?auto_198989 ?auto_198988 )
      ( MAKE-5PILE ?auto_198984 ?auto_198985 ?auto_198986 ?auto_198987 ?auto_198988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_198992 - BLOCK
      ?auto_198993 - BLOCK
      ?auto_198994 - BLOCK
      ?auto_198995 - BLOCK
      ?auto_198996 - BLOCK
    )
    :vars
    (
      ?auto_198997 - BLOCK
      ?auto_198999 - BLOCK
      ?auto_198998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_198992 ) ( ON ?auto_198993 ?auto_198992 ) ( not ( = ?auto_198992 ?auto_198993 ) ) ( not ( = ?auto_198992 ?auto_198994 ) ) ( not ( = ?auto_198992 ?auto_198995 ) ) ( not ( = ?auto_198992 ?auto_198996 ) ) ( not ( = ?auto_198993 ?auto_198994 ) ) ( not ( = ?auto_198993 ?auto_198995 ) ) ( not ( = ?auto_198993 ?auto_198996 ) ) ( not ( = ?auto_198994 ?auto_198995 ) ) ( not ( = ?auto_198994 ?auto_198996 ) ) ( not ( = ?auto_198995 ?auto_198996 ) ) ( ON ?auto_198996 ?auto_198997 ) ( not ( = ?auto_198992 ?auto_198997 ) ) ( not ( = ?auto_198993 ?auto_198997 ) ) ( not ( = ?auto_198994 ?auto_198997 ) ) ( not ( = ?auto_198995 ?auto_198997 ) ) ( not ( = ?auto_198996 ?auto_198997 ) ) ( ON ?auto_198995 ?auto_198996 ) ( CLEAR ?auto_198995 ) ( ON-TABLE ?auto_198999 ) ( ON ?auto_198998 ?auto_198999 ) ( ON ?auto_198997 ?auto_198998 ) ( not ( = ?auto_198999 ?auto_198998 ) ) ( not ( = ?auto_198999 ?auto_198997 ) ) ( not ( = ?auto_198999 ?auto_198996 ) ) ( not ( = ?auto_198999 ?auto_198995 ) ) ( not ( = ?auto_198998 ?auto_198997 ) ) ( not ( = ?auto_198998 ?auto_198996 ) ) ( not ( = ?auto_198998 ?auto_198995 ) ) ( not ( = ?auto_198992 ?auto_198999 ) ) ( not ( = ?auto_198992 ?auto_198998 ) ) ( not ( = ?auto_198993 ?auto_198999 ) ) ( not ( = ?auto_198993 ?auto_198998 ) ) ( not ( = ?auto_198994 ?auto_198999 ) ) ( not ( = ?auto_198994 ?auto_198998 ) ) ( HOLDING ?auto_198994 ) ( CLEAR ?auto_198993 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_198992 ?auto_198993 ?auto_198994 )
      ( MAKE-5PILE ?auto_198992 ?auto_198993 ?auto_198994 ?auto_198995 ?auto_198996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199000 - BLOCK
      ?auto_199001 - BLOCK
      ?auto_199002 - BLOCK
      ?auto_199003 - BLOCK
      ?auto_199004 - BLOCK
    )
    :vars
    (
      ?auto_199006 - BLOCK
      ?auto_199007 - BLOCK
      ?auto_199005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199000 ) ( ON ?auto_199001 ?auto_199000 ) ( not ( = ?auto_199000 ?auto_199001 ) ) ( not ( = ?auto_199000 ?auto_199002 ) ) ( not ( = ?auto_199000 ?auto_199003 ) ) ( not ( = ?auto_199000 ?auto_199004 ) ) ( not ( = ?auto_199001 ?auto_199002 ) ) ( not ( = ?auto_199001 ?auto_199003 ) ) ( not ( = ?auto_199001 ?auto_199004 ) ) ( not ( = ?auto_199002 ?auto_199003 ) ) ( not ( = ?auto_199002 ?auto_199004 ) ) ( not ( = ?auto_199003 ?auto_199004 ) ) ( ON ?auto_199004 ?auto_199006 ) ( not ( = ?auto_199000 ?auto_199006 ) ) ( not ( = ?auto_199001 ?auto_199006 ) ) ( not ( = ?auto_199002 ?auto_199006 ) ) ( not ( = ?auto_199003 ?auto_199006 ) ) ( not ( = ?auto_199004 ?auto_199006 ) ) ( ON ?auto_199003 ?auto_199004 ) ( ON-TABLE ?auto_199007 ) ( ON ?auto_199005 ?auto_199007 ) ( ON ?auto_199006 ?auto_199005 ) ( not ( = ?auto_199007 ?auto_199005 ) ) ( not ( = ?auto_199007 ?auto_199006 ) ) ( not ( = ?auto_199007 ?auto_199004 ) ) ( not ( = ?auto_199007 ?auto_199003 ) ) ( not ( = ?auto_199005 ?auto_199006 ) ) ( not ( = ?auto_199005 ?auto_199004 ) ) ( not ( = ?auto_199005 ?auto_199003 ) ) ( not ( = ?auto_199000 ?auto_199007 ) ) ( not ( = ?auto_199000 ?auto_199005 ) ) ( not ( = ?auto_199001 ?auto_199007 ) ) ( not ( = ?auto_199001 ?auto_199005 ) ) ( not ( = ?auto_199002 ?auto_199007 ) ) ( not ( = ?auto_199002 ?auto_199005 ) ) ( CLEAR ?auto_199001 ) ( ON ?auto_199002 ?auto_199003 ) ( CLEAR ?auto_199002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199007 ?auto_199005 ?auto_199006 ?auto_199004 ?auto_199003 )
      ( MAKE-5PILE ?auto_199000 ?auto_199001 ?auto_199002 ?auto_199003 ?auto_199004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199008 - BLOCK
      ?auto_199009 - BLOCK
      ?auto_199010 - BLOCK
      ?auto_199011 - BLOCK
      ?auto_199012 - BLOCK
    )
    :vars
    (
      ?auto_199014 - BLOCK
      ?auto_199013 - BLOCK
      ?auto_199015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199008 ) ( not ( = ?auto_199008 ?auto_199009 ) ) ( not ( = ?auto_199008 ?auto_199010 ) ) ( not ( = ?auto_199008 ?auto_199011 ) ) ( not ( = ?auto_199008 ?auto_199012 ) ) ( not ( = ?auto_199009 ?auto_199010 ) ) ( not ( = ?auto_199009 ?auto_199011 ) ) ( not ( = ?auto_199009 ?auto_199012 ) ) ( not ( = ?auto_199010 ?auto_199011 ) ) ( not ( = ?auto_199010 ?auto_199012 ) ) ( not ( = ?auto_199011 ?auto_199012 ) ) ( ON ?auto_199012 ?auto_199014 ) ( not ( = ?auto_199008 ?auto_199014 ) ) ( not ( = ?auto_199009 ?auto_199014 ) ) ( not ( = ?auto_199010 ?auto_199014 ) ) ( not ( = ?auto_199011 ?auto_199014 ) ) ( not ( = ?auto_199012 ?auto_199014 ) ) ( ON ?auto_199011 ?auto_199012 ) ( ON-TABLE ?auto_199013 ) ( ON ?auto_199015 ?auto_199013 ) ( ON ?auto_199014 ?auto_199015 ) ( not ( = ?auto_199013 ?auto_199015 ) ) ( not ( = ?auto_199013 ?auto_199014 ) ) ( not ( = ?auto_199013 ?auto_199012 ) ) ( not ( = ?auto_199013 ?auto_199011 ) ) ( not ( = ?auto_199015 ?auto_199014 ) ) ( not ( = ?auto_199015 ?auto_199012 ) ) ( not ( = ?auto_199015 ?auto_199011 ) ) ( not ( = ?auto_199008 ?auto_199013 ) ) ( not ( = ?auto_199008 ?auto_199015 ) ) ( not ( = ?auto_199009 ?auto_199013 ) ) ( not ( = ?auto_199009 ?auto_199015 ) ) ( not ( = ?auto_199010 ?auto_199013 ) ) ( not ( = ?auto_199010 ?auto_199015 ) ) ( ON ?auto_199010 ?auto_199011 ) ( CLEAR ?auto_199010 ) ( HOLDING ?auto_199009 ) ( CLEAR ?auto_199008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199008 ?auto_199009 )
      ( MAKE-5PILE ?auto_199008 ?auto_199009 ?auto_199010 ?auto_199011 ?auto_199012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199016 - BLOCK
      ?auto_199017 - BLOCK
      ?auto_199018 - BLOCK
      ?auto_199019 - BLOCK
      ?auto_199020 - BLOCK
    )
    :vars
    (
      ?auto_199023 - BLOCK
      ?auto_199021 - BLOCK
      ?auto_199022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199016 ) ( not ( = ?auto_199016 ?auto_199017 ) ) ( not ( = ?auto_199016 ?auto_199018 ) ) ( not ( = ?auto_199016 ?auto_199019 ) ) ( not ( = ?auto_199016 ?auto_199020 ) ) ( not ( = ?auto_199017 ?auto_199018 ) ) ( not ( = ?auto_199017 ?auto_199019 ) ) ( not ( = ?auto_199017 ?auto_199020 ) ) ( not ( = ?auto_199018 ?auto_199019 ) ) ( not ( = ?auto_199018 ?auto_199020 ) ) ( not ( = ?auto_199019 ?auto_199020 ) ) ( ON ?auto_199020 ?auto_199023 ) ( not ( = ?auto_199016 ?auto_199023 ) ) ( not ( = ?auto_199017 ?auto_199023 ) ) ( not ( = ?auto_199018 ?auto_199023 ) ) ( not ( = ?auto_199019 ?auto_199023 ) ) ( not ( = ?auto_199020 ?auto_199023 ) ) ( ON ?auto_199019 ?auto_199020 ) ( ON-TABLE ?auto_199021 ) ( ON ?auto_199022 ?auto_199021 ) ( ON ?auto_199023 ?auto_199022 ) ( not ( = ?auto_199021 ?auto_199022 ) ) ( not ( = ?auto_199021 ?auto_199023 ) ) ( not ( = ?auto_199021 ?auto_199020 ) ) ( not ( = ?auto_199021 ?auto_199019 ) ) ( not ( = ?auto_199022 ?auto_199023 ) ) ( not ( = ?auto_199022 ?auto_199020 ) ) ( not ( = ?auto_199022 ?auto_199019 ) ) ( not ( = ?auto_199016 ?auto_199021 ) ) ( not ( = ?auto_199016 ?auto_199022 ) ) ( not ( = ?auto_199017 ?auto_199021 ) ) ( not ( = ?auto_199017 ?auto_199022 ) ) ( not ( = ?auto_199018 ?auto_199021 ) ) ( not ( = ?auto_199018 ?auto_199022 ) ) ( ON ?auto_199018 ?auto_199019 ) ( CLEAR ?auto_199016 ) ( ON ?auto_199017 ?auto_199018 ) ( CLEAR ?auto_199017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199021 ?auto_199022 ?auto_199023 ?auto_199020 ?auto_199019 ?auto_199018 )
      ( MAKE-5PILE ?auto_199016 ?auto_199017 ?auto_199018 ?auto_199019 ?auto_199020 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199024 - BLOCK
      ?auto_199025 - BLOCK
      ?auto_199026 - BLOCK
      ?auto_199027 - BLOCK
      ?auto_199028 - BLOCK
    )
    :vars
    (
      ?auto_199030 - BLOCK
      ?auto_199029 - BLOCK
      ?auto_199031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199024 ?auto_199025 ) ) ( not ( = ?auto_199024 ?auto_199026 ) ) ( not ( = ?auto_199024 ?auto_199027 ) ) ( not ( = ?auto_199024 ?auto_199028 ) ) ( not ( = ?auto_199025 ?auto_199026 ) ) ( not ( = ?auto_199025 ?auto_199027 ) ) ( not ( = ?auto_199025 ?auto_199028 ) ) ( not ( = ?auto_199026 ?auto_199027 ) ) ( not ( = ?auto_199026 ?auto_199028 ) ) ( not ( = ?auto_199027 ?auto_199028 ) ) ( ON ?auto_199028 ?auto_199030 ) ( not ( = ?auto_199024 ?auto_199030 ) ) ( not ( = ?auto_199025 ?auto_199030 ) ) ( not ( = ?auto_199026 ?auto_199030 ) ) ( not ( = ?auto_199027 ?auto_199030 ) ) ( not ( = ?auto_199028 ?auto_199030 ) ) ( ON ?auto_199027 ?auto_199028 ) ( ON-TABLE ?auto_199029 ) ( ON ?auto_199031 ?auto_199029 ) ( ON ?auto_199030 ?auto_199031 ) ( not ( = ?auto_199029 ?auto_199031 ) ) ( not ( = ?auto_199029 ?auto_199030 ) ) ( not ( = ?auto_199029 ?auto_199028 ) ) ( not ( = ?auto_199029 ?auto_199027 ) ) ( not ( = ?auto_199031 ?auto_199030 ) ) ( not ( = ?auto_199031 ?auto_199028 ) ) ( not ( = ?auto_199031 ?auto_199027 ) ) ( not ( = ?auto_199024 ?auto_199029 ) ) ( not ( = ?auto_199024 ?auto_199031 ) ) ( not ( = ?auto_199025 ?auto_199029 ) ) ( not ( = ?auto_199025 ?auto_199031 ) ) ( not ( = ?auto_199026 ?auto_199029 ) ) ( not ( = ?auto_199026 ?auto_199031 ) ) ( ON ?auto_199026 ?auto_199027 ) ( ON ?auto_199025 ?auto_199026 ) ( CLEAR ?auto_199025 ) ( HOLDING ?auto_199024 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199024 )
      ( MAKE-5PILE ?auto_199024 ?auto_199025 ?auto_199026 ?auto_199027 ?auto_199028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199032 - BLOCK
      ?auto_199033 - BLOCK
      ?auto_199034 - BLOCK
      ?auto_199035 - BLOCK
      ?auto_199036 - BLOCK
    )
    :vars
    (
      ?auto_199037 - BLOCK
      ?auto_199038 - BLOCK
      ?auto_199039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199032 ?auto_199033 ) ) ( not ( = ?auto_199032 ?auto_199034 ) ) ( not ( = ?auto_199032 ?auto_199035 ) ) ( not ( = ?auto_199032 ?auto_199036 ) ) ( not ( = ?auto_199033 ?auto_199034 ) ) ( not ( = ?auto_199033 ?auto_199035 ) ) ( not ( = ?auto_199033 ?auto_199036 ) ) ( not ( = ?auto_199034 ?auto_199035 ) ) ( not ( = ?auto_199034 ?auto_199036 ) ) ( not ( = ?auto_199035 ?auto_199036 ) ) ( ON ?auto_199036 ?auto_199037 ) ( not ( = ?auto_199032 ?auto_199037 ) ) ( not ( = ?auto_199033 ?auto_199037 ) ) ( not ( = ?auto_199034 ?auto_199037 ) ) ( not ( = ?auto_199035 ?auto_199037 ) ) ( not ( = ?auto_199036 ?auto_199037 ) ) ( ON ?auto_199035 ?auto_199036 ) ( ON-TABLE ?auto_199038 ) ( ON ?auto_199039 ?auto_199038 ) ( ON ?auto_199037 ?auto_199039 ) ( not ( = ?auto_199038 ?auto_199039 ) ) ( not ( = ?auto_199038 ?auto_199037 ) ) ( not ( = ?auto_199038 ?auto_199036 ) ) ( not ( = ?auto_199038 ?auto_199035 ) ) ( not ( = ?auto_199039 ?auto_199037 ) ) ( not ( = ?auto_199039 ?auto_199036 ) ) ( not ( = ?auto_199039 ?auto_199035 ) ) ( not ( = ?auto_199032 ?auto_199038 ) ) ( not ( = ?auto_199032 ?auto_199039 ) ) ( not ( = ?auto_199033 ?auto_199038 ) ) ( not ( = ?auto_199033 ?auto_199039 ) ) ( not ( = ?auto_199034 ?auto_199038 ) ) ( not ( = ?auto_199034 ?auto_199039 ) ) ( ON ?auto_199034 ?auto_199035 ) ( ON ?auto_199033 ?auto_199034 ) ( ON ?auto_199032 ?auto_199033 ) ( CLEAR ?auto_199032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199038 ?auto_199039 ?auto_199037 ?auto_199036 ?auto_199035 ?auto_199034 ?auto_199033 )
      ( MAKE-5PILE ?auto_199032 ?auto_199033 ?auto_199034 ?auto_199035 ?auto_199036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199040 - BLOCK
      ?auto_199041 - BLOCK
      ?auto_199042 - BLOCK
      ?auto_199043 - BLOCK
      ?auto_199044 - BLOCK
    )
    :vars
    (
      ?auto_199045 - BLOCK
      ?auto_199047 - BLOCK
      ?auto_199046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199040 ?auto_199041 ) ) ( not ( = ?auto_199040 ?auto_199042 ) ) ( not ( = ?auto_199040 ?auto_199043 ) ) ( not ( = ?auto_199040 ?auto_199044 ) ) ( not ( = ?auto_199041 ?auto_199042 ) ) ( not ( = ?auto_199041 ?auto_199043 ) ) ( not ( = ?auto_199041 ?auto_199044 ) ) ( not ( = ?auto_199042 ?auto_199043 ) ) ( not ( = ?auto_199042 ?auto_199044 ) ) ( not ( = ?auto_199043 ?auto_199044 ) ) ( ON ?auto_199044 ?auto_199045 ) ( not ( = ?auto_199040 ?auto_199045 ) ) ( not ( = ?auto_199041 ?auto_199045 ) ) ( not ( = ?auto_199042 ?auto_199045 ) ) ( not ( = ?auto_199043 ?auto_199045 ) ) ( not ( = ?auto_199044 ?auto_199045 ) ) ( ON ?auto_199043 ?auto_199044 ) ( ON-TABLE ?auto_199047 ) ( ON ?auto_199046 ?auto_199047 ) ( ON ?auto_199045 ?auto_199046 ) ( not ( = ?auto_199047 ?auto_199046 ) ) ( not ( = ?auto_199047 ?auto_199045 ) ) ( not ( = ?auto_199047 ?auto_199044 ) ) ( not ( = ?auto_199047 ?auto_199043 ) ) ( not ( = ?auto_199046 ?auto_199045 ) ) ( not ( = ?auto_199046 ?auto_199044 ) ) ( not ( = ?auto_199046 ?auto_199043 ) ) ( not ( = ?auto_199040 ?auto_199047 ) ) ( not ( = ?auto_199040 ?auto_199046 ) ) ( not ( = ?auto_199041 ?auto_199047 ) ) ( not ( = ?auto_199041 ?auto_199046 ) ) ( not ( = ?auto_199042 ?auto_199047 ) ) ( not ( = ?auto_199042 ?auto_199046 ) ) ( ON ?auto_199042 ?auto_199043 ) ( ON ?auto_199041 ?auto_199042 ) ( HOLDING ?auto_199040 ) ( CLEAR ?auto_199041 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199047 ?auto_199046 ?auto_199045 ?auto_199044 ?auto_199043 ?auto_199042 ?auto_199041 ?auto_199040 )
      ( MAKE-5PILE ?auto_199040 ?auto_199041 ?auto_199042 ?auto_199043 ?auto_199044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199048 - BLOCK
      ?auto_199049 - BLOCK
      ?auto_199050 - BLOCK
      ?auto_199051 - BLOCK
      ?auto_199052 - BLOCK
    )
    :vars
    (
      ?auto_199053 - BLOCK
      ?auto_199054 - BLOCK
      ?auto_199055 - BLOCK
      ?auto_199056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199048 ?auto_199049 ) ) ( not ( = ?auto_199048 ?auto_199050 ) ) ( not ( = ?auto_199048 ?auto_199051 ) ) ( not ( = ?auto_199048 ?auto_199052 ) ) ( not ( = ?auto_199049 ?auto_199050 ) ) ( not ( = ?auto_199049 ?auto_199051 ) ) ( not ( = ?auto_199049 ?auto_199052 ) ) ( not ( = ?auto_199050 ?auto_199051 ) ) ( not ( = ?auto_199050 ?auto_199052 ) ) ( not ( = ?auto_199051 ?auto_199052 ) ) ( ON ?auto_199052 ?auto_199053 ) ( not ( = ?auto_199048 ?auto_199053 ) ) ( not ( = ?auto_199049 ?auto_199053 ) ) ( not ( = ?auto_199050 ?auto_199053 ) ) ( not ( = ?auto_199051 ?auto_199053 ) ) ( not ( = ?auto_199052 ?auto_199053 ) ) ( ON ?auto_199051 ?auto_199052 ) ( ON-TABLE ?auto_199054 ) ( ON ?auto_199055 ?auto_199054 ) ( ON ?auto_199053 ?auto_199055 ) ( not ( = ?auto_199054 ?auto_199055 ) ) ( not ( = ?auto_199054 ?auto_199053 ) ) ( not ( = ?auto_199054 ?auto_199052 ) ) ( not ( = ?auto_199054 ?auto_199051 ) ) ( not ( = ?auto_199055 ?auto_199053 ) ) ( not ( = ?auto_199055 ?auto_199052 ) ) ( not ( = ?auto_199055 ?auto_199051 ) ) ( not ( = ?auto_199048 ?auto_199054 ) ) ( not ( = ?auto_199048 ?auto_199055 ) ) ( not ( = ?auto_199049 ?auto_199054 ) ) ( not ( = ?auto_199049 ?auto_199055 ) ) ( not ( = ?auto_199050 ?auto_199054 ) ) ( not ( = ?auto_199050 ?auto_199055 ) ) ( ON ?auto_199050 ?auto_199051 ) ( ON ?auto_199049 ?auto_199050 ) ( CLEAR ?auto_199049 ) ( ON ?auto_199048 ?auto_199056 ) ( CLEAR ?auto_199048 ) ( HAND-EMPTY ) ( not ( = ?auto_199048 ?auto_199056 ) ) ( not ( = ?auto_199049 ?auto_199056 ) ) ( not ( = ?auto_199050 ?auto_199056 ) ) ( not ( = ?auto_199051 ?auto_199056 ) ) ( not ( = ?auto_199052 ?auto_199056 ) ) ( not ( = ?auto_199053 ?auto_199056 ) ) ( not ( = ?auto_199054 ?auto_199056 ) ) ( not ( = ?auto_199055 ?auto_199056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199048 ?auto_199056 )
      ( MAKE-5PILE ?auto_199048 ?auto_199049 ?auto_199050 ?auto_199051 ?auto_199052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199057 - BLOCK
      ?auto_199058 - BLOCK
      ?auto_199059 - BLOCK
      ?auto_199060 - BLOCK
      ?auto_199061 - BLOCK
    )
    :vars
    (
      ?auto_199062 - BLOCK
      ?auto_199063 - BLOCK
      ?auto_199064 - BLOCK
      ?auto_199065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199057 ?auto_199058 ) ) ( not ( = ?auto_199057 ?auto_199059 ) ) ( not ( = ?auto_199057 ?auto_199060 ) ) ( not ( = ?auto_199057 ?auto_199061 ) ) ( not ( = ?auto_199058 ?auto_199059 ) ) ( not ( = ?auto_199058 ?auto_199060 ) ) ( not ( = ?auto_199058 ?auto_199061 ) ) ( not ( = ?auto_199059 ?auto_199060 ) ) ( not ( = ?auto_199059 ?auto_199061 ) ) ( not ( = ?auto_199060 ?auto_199061 ) ) ( ON ?auto_199061 ?auto_199062 ) ( not ( = ?auto_199057 ?auto_199062 ) ) ( not ( = ?auto_199058 ?auto_199062 ) ) ( not ( = ?auto_199059 ?auto_199062 ) ) ( not ( = ?auto_199060 ?auto_199062 ) ) ( not ( = ?auto_199061 ?auto_199062 ) ) ( ON ?auto_199060 ?auto_199061 ) ( ON-TABLE ?auto_199063 ) ( ON ?auto_199064 ?auto_199063 ) ( ON ?auto_199062 ?auto_199064 ) ( not ( = ?auto_199063 ?auto_199064 ) ) ( not ( = ?auto_199063 ?auto_199062 ) ) ( not ( = ?auto_199063 ?auto_199061 ) ) ( not ( = ?auto_199063 ?auto_199060 ) ) ( not ( = ?auto_199064 ?auto_199062 ) ) ( not ( = ?auto_199064 ?auto_199061 ) ) ( not ( = ?auto_199064 ?auto_199060 ) ) ( not ( = ?auto_199057 ?auto_199063 ) ) ( not ( = ?auto_199057 ?auto_199064 ) ) ( not ( = ?auto_199058 ?auto_199063 ) ) ( not ( = ?auto_199058 ?auto_199064 ) ) ( not ( = ?auto_199059 ?auto_199063 ) ) ( not ( = ?auto_199059 ?auto_199064 ) ) ( ON ?auto_199059 ?auto_199060 ) ( ON ?auto_199057 ?auto_199065 ) ( CLEAR ?auto_199057 ) ( not ( = ?auto_199057 ?auto_199065 ) ) ( not ( = ?auto_199058 ?auto_199065 ) ) ( not ( = ?auto_199059 ?auto_199065 ) ) ( not ( = ?auto_199060 ?auto_199065 ) ) ( not ( = ?auto_199061 ?auto_199065 ) ) ( not ( = ?auto_199062 ?auto_199065 ) ) ( not ( = ?auto_199063 ?auto_199065 ) ) ( not ( = ?auto_199064 ?auto_199065 ) ) ( HOLDING ?auto_199058 ) ( CLEAR ?auto_199059 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199063 ?auto_199064 ?auto_199062 ?auto_199061 ?auto_199060 ?auto_199059 ?auto_199058 )
      ( MAKE-5PILE ?auto_199057 ?auto_199058 ?auto_199059 ?auto_199060 ?auto_199061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199066 - BLOCK
      ?auto_199067 - BLOCK
      ?auto_199068 - BLOCK
      ?auto_199069 - BLOCK
      ?auto_199070 - BLOCK
    )
    :vars
    (
      ?auto_199071 - BLOCK
      ?auto_199074 - BLOCK
      ?auto_199072 - BLOCK
      ?auto_199073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199066 ?auto_199067 ) ) ( not ( = ?auto_199066 ?auto_199068 ) ) ( not ( = ?auto_199066 ?auto_199069 ) ) ( not ( = ?auto_199066 ?auto_199070 ) ) ( not ( = ?auto_199067 ?auto_199068 ) ) ( not ( = ?auto_199067 ?auto_199069 ) ) ( not ( = ?auto_199067 ?auto_199070 ) ) ( not ( = ?auto_199068 ?auto_199069 ) ) ( not ( = ?auto_199068 ?auto_199070 ) ) ( not ( = ?auto_199069 ?auto_199070 ) ) ( ON ?auto_199070 ?auto_199071 ) ( not ( = ?auto_199066 ?auto_199071 ) ) ( not ( = ?auto_199067 ?auto_199071 ) ) ( not ( = ?auto_199068 ?auto_199071 ) ) ( not ( = ?auto_199069 ?auto_199071 ) ) ( not ( = ?auto_199070 ?auto_199071 ) ) ( ON ?auto_199069 ?auto_199070 ) ( ON-TABLE ?auto_199074 ) ( ON ?auto_199072 ?auto_199074 ) ( ON ?auto_199071 ?auto_199072 ) ( not ( = ?auto_199074 ?auto_199072 ) ) ( not ( = ?auto_199074 ?auto_199071 ) ) ( not ( = ?auto_199074 ?auto_199070 ) ) ( not ( = ?auto_199074 ?auto_199069 ) ) ( not ( = ?auto_199072 ?auto_199071 ) ) ( not ( = ?auto_199072 ?auto_199070 ) ) ( not ( = ?auto_199072 ?auto_199069 ) ) ( not ( = ?auto_199066 ?auto_199074 ) ) ( not ( = ?auto_199066 ?auto_199072 ) ) ( not ( = ?auto_199067 ?auto_199074 ) ) ( not ( = ?auto_199067 ?auto_199072 ) ) ( not ( = ?auto_199068 ?auto_199074 ) ) ( not ( = ?auto_199068 ?auto_199072 ) ) ( ON ?auto_199068 ?auto_199069 ) ( ON ?auto_199066 ?auto_199073 ) ( not ( = ?auto_199066 ?auto_199073 ) ) ( not ( = ?auto_199067 ?auto_199073 ) ) ( not ( = ?auto_199068 ?auto_199073 ) ) ( not ( = ?auto_199069 ?auto_199073 ) ) ( not ( = ?auto_199070 ?auto_199073 ) ) ( not ( = ?auto_199071 ?auto_199073 ) ) ( not ( = ?auto_199074 ?auto_199073 ) ) ( not ( = ?auto_199072 ?auto_199073 ) ) ( CLEAR ?auto_199068 ) ( ON ?auto_199067 ?auto_199066 ) ( CLEAR ?auto_199067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199073 ?auto_199066 )
      ( MAKE-5PILE ?auto_199066 ?auto_199067 ?auto_199068 ?auto_199069 ?auto_199070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199075 - BLOCK
      ?auto_199076 - BLOCK
      ?auto_199077 - BLOCK
      ?auto_199078 - BLOCK
      ?auto_199079 - BLOCK
    )
    :vars
    (
      ?auto_199082 - BLOCK
      ?auto_199083 - BLOCK
      ?auto_199080 - BLOCK
      ?auto_199081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199075 ?auto_199076 ) ) ( not ( = ?auto_199075 ?auto_199077 ) ) ( not ( = ?auto_199075 ?auto_199078 ) ) ( not ( = ?auto_199075 ?auto_199079 ) ) ( not ( = ?auto_199076 ?auto_199077 ) ) ( not ( = ?auto_199076 ?auto_199078 ) ) ( not ( = ?auto_199076 ?auto_199079 ) ) ( not ( = ?auto_199077 ?auto_199078 ) ) ( not ( = ?auto_199077 ?auto_199079 ) ) ( not ( = ?auto_199078 ?auto_199079 ) ) ( ON ?auto_199079 ?auto_199082 ) ( not ( = ?auto_199075 ?auto_199082 ) ) ( not ( = ?auto_199076 ?auto_199082 ) ) ( not ( = ?auto_199077 ?auto_199082 ) ) ( not ( = ?auto_199078 ?auto_199082 ) ) ( not ( = ?auto_199079 ?auto_199082 ) ) ( ON ?auto_199078 ?auto_199079 ) ( ON-TABLE ?auto_199083 ) ( ON ?auto_199080 ?auto_199083 ) ( ON ?auto_199082 ?auto_199080 ) ( not ( = ?auto_199083 ?auto_199080 ) ) ( not ( = ?auto_199083 ?auto_199082 ) ) ( not ( = ?auto_199083 ?auto_199079 ) ) ( not ( = ?auto_199083 ?auto_199078 ) ) ( not ( = ?auto_199080 ?auto_199082 ) ) ( not ( = ?auto_199080 ?auto_199079 ) ) ( not ( = ?auto_199080 ?auto_199078 ) ) ( not ( = ?auto_199075 ?auto_199083 ) ) ( not ( = ?auto_199075 ?auto_199080 ) ) ( not ( = ?auto_199076 ?auto_199083 ) ) ( not ( = ?auto_199076 ?auto_199080 ) ) ( not ( = ?auto_199077 ?auto_199083 ) ) ( not ( = ?auto_199077 ?auto_199080 ) ) ( ON ?auto_199075 ?auto_199081 ) ( not ( = ?auto_199075 ?auto_199081 ) ) ( not ( = ?auto_199076 ?auto_199081 ) ) ( not ( = ?auto_199077 ?auto_199081 ) ) ( not ( = ?auto_199078 ?auto_199081 ) ) ( not ( = ?auto_199079 ?auto_199081 ) ) ( not ( = ?auto_199082 ?auto_199081 ) ) ( not ( = ?auto_199083 ?auto_199081 ) ) ( not ( = ?auto_199080 ?auto_199081 ) ) ( ON ?auto_199076 ?auto_199075 ) ( CLEAR ?auto_199076 ) ( ON-TABLE ?auto_199081 ) ( HOLDING ?auto_199077 ) ( CLEAR ?auto_199078 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199083 ?auto_199080 ?auto_199082 ?auto_199079 ?auto_199078 ?auto_199077 )
      ( MAKE-5PILE ?auto_199075 ?auto_199076 ?auto_199077 ?auto_199078 ?auto_199079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199084 - BLOCK
      ?auto_199085 - BLOCK
      ?auto_199086 - BLOCK
      ?auto_199087 - BLOCK
      ?auto_199088 - BLOCK
    )
    :vars
    (
      ?auto_199089 - BLOCK
      ?auto_199092 - BLOCK
      ?auto_199091 - BLOCK
      ?auto_199090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199084 ?auto_199085 ) ) ( not ( = ?auto_199084 ?auto_199086 ) ) ( not ( = ?auto_199084 ?auto_199087 ) ) ( not ( = ?auto_199084 ?auto_199088 ) ) ( not ( = ?auto_199085 ?auto_199086 ) ) ( not ( = ?auto_199085 ?auto_199087 ) ) ( not ( = ?auto_199085 ?auto_199088 ) ) ( not ( = ?auto_199086 ?auto_199087 ) ) ( not ( = ?auto_199086 ?auto_199088 ) ) ( not ( = ?auto_199087 ?auto_199088 ) ) ( ON ?auto_199088 ?auto_199089 ) ( not ( = ?auto_199084 ?auto_199089 ) ) ( not ( = ?auto_199085 ?auto_199089 ) ) ( not ( = ?auto_199086 ?auto_199089 ) ) ( not ( = ?auto_199087 ?auto_199089 ) ) ( not ( = ?auto_199088 ?auto_199089 ) ) ( ON ?auto_199087 ?auto_199088 ) ( ON-TABLE ?auto_199092 ) ( ON ?auto_199091 ?auto_199092 ) ( ON ?auto_199089 ?auto_199091 ) ( not ( = ?auto_199092 ?auto_199091 ) ) ( not ( = ?auto_199092 ?auto_199089 ) ) ( not ( = ?auto_199092 ?auto_199088 ) ) ( not ( = ?auto_199092 ?auto_199087 ) ) ( not ( = ?auto_199091 ?auto_199089 ) ) ( not ( = ?auto_199091 ?auto_199088 ) ) ( not ( = ?auto_199091 ?auto_199087 ) ) ( not ( = ?auto_199084 ?auto_199092 ) ) ( not ( = ?auto_199084 ?auto_199091 ) ) ( not ( = ?auto_199085 ?auto_199092 ) ) ( not ( = ?auto_199085 ?auto_199091 ) ) ( not ( = ?auto_199086 ?auto_199092 ) ) ( not ( = ?auto_199086 ?auto_199091 ) ) ( ON ?auto_199084 ?auto_199090 ) ( not ( = ?auto_199084 ?auto_199090 ) ) ( not ( = ?auto_199085 ?auto_199090 ) ) ( not ( = ?auto_199086 ?auto_199090 ) ) ( not ( = ?auto_199087 ?auto_199090 ) ) ( not ( = ?auto_199088 ?auto_199090 ) ) ( not ( = ?auto_199089 ?auto_199090 ) ) ( not ( = ?auto_199092 ?auto_199090 ) ) ( not ( = ?auto_199091 ?auto_199090 ) ) ( ON ?auto_199085 ?auto_199084 ) ( ON-TABLE ?auto_199090 ) ( CLEAR ?auto_199087 ) ( ON ?auto_199086 ?auto_199085 ) ( CLEAR ?auto_199086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199090 ?auto_199084 ?auto_199085 )
      ( MAKE-5PILE ?auto_199084 ?auto_199085 ?auto_199086 ?auto_199087 ?auto_199088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199093 - BLOCK
      ?auto_199094 - BLOCK
      ?auto_199095 - BLOCK
      ?auto_199096 - BLOCK
      ?auto_199097 - BLOCK
    )
    :vars
    (
      ?auto_199100 - BLOCK
      ?auto_199101 - BLOCK
      ?auto_199098 - BLOCK
      ?auto_199099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199093 ?auto_199094 ) ) ( not ( = ?auto_199093 ?auto_199095 ) ) ( not ( = ?auto_199093 ?auto_199096 ) ) ( not ( = ?auto_199093 ?auto_199097 ) ) ( not ( = ?auto_199094 ?auto_199095 ) ) ( not ( = ?auto_199094 ?auto_199096 ) ) ( not ( = ?auto_199094 ?auto_199097 ) ) ( not ( = ?auto_199095 ?auto_199096 ) ) ( not ( = ?auto_199095 ?auto_199097 ) ) ( not ( = ?auto_199096 ?auto_199097 ) ) ( ON ?auto_199097 ?auto_199100 ) ( not ( = ?auto_199093 ?auto_199100 ) ) ( not ( = ?auto_199094 ?auto_199100 ) ) ( not ( = ?auto_199095 ?auto_199100 ) ) ( not ( = ?auto_199096 ?auto_199100 ) ) ( not ( = ?auto_199097 ?auto_199100 ) ) ( ON-TABLE ?auto_199101 ) ( ON ?auto_199098 ?auto_199101 ) ( ON ?auto_199100 ?auto_199098 ) ( not ( = ?auto_199101 ?auto_199098 ) ) ( not ( = ?auto_199101 ?auto_199100 ) ) ( not ( = ?auto_199101 ?auto_199097 ) ) ( not ( = ?auto_199101 ?auto_199096 ) ) ( not ( = ?auto_199098 ?auto_199100 ) ) ( not ( = ?auto_199098 ?auto_199097 ) ) ( not ( = ?auto_199098 ?auto_199096 ) ) ( not ( = ?auto_199093 ?auto_199101 ) ) ( not ( = ?auto_199093 ?auto_199098 ) ) ( not ( = ?auto_199094 ?auto_199101 ) ) ( not ( = ?auto_199094 ?auto_199098 ) ) ( not ( = ?auto_199095 ?auto_199101 ) ) ( not ( = ?auto_199095 ?auto_199098 ) ) ( ON ?auto_199093 ?auto_199099 ) ( not ( = ?auto_199093 ?auto_199099 ) ) ( not ( = ?auto_199094 ?auto_199099 ) ) ( not ( = ?auto_199095 ?auto_199099 ) ) ( not ( = ?auto_199096 ?auto_199099 ) ) ( not ( = ?auto_199097 ?auto_199099 ) ) ( not ( = ?auto_199100 ?auto_199099 ) ) ( not ( = ?auto_199101 ?auto_199099 ) ) ( not ( = ?auto_199098 ?auto_199099 ) ) ( ON ?auto_199094 ?auto_199093 ) ( ON-TABLE ?auto_199099 ) ( ON ?auto_199095 ?auto_199094 ) ( CLEAR ?auto_199095 ) ( HOLDING ?auto_199096 ) ( CLEAR ?auto_199097 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199101 ?auto_199098 ?auto_199100 ?auto_199097 ?auto_199096 )
      ( MAKE-5PILE ?auto_199093 ?auto_199094 ?auto_199095 ?auto_199096 ?auto_199097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199102 - BLOCK
      ?auto_199103 - BLOCK
      ?auto_199104 - BLOCK
      ?auto_199105 - BLOCK
      ?auto_199106 - BLOCK
    )
    :vars
    (
      ?auto_199109 - BLOCK
      ?auto_199107 - BLOCK
      ?auto_199110 - BLOCK
      ?auto_199108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199102 ?auto_199103 ) ) ( not ( = ?auto_199102 ?auto_199104 ) ) ( not ( = ?auto_199102 ?auto_199105 ) ) ( not ( = ?auto_199102 ?auto_199106 ) ) ( not ( = ?auto_199103 ?auto_199104 ) ) ( not ( = ?auto_199103 ?auto_199105 ) ) ( not ( = ?auto_199103 ?auto_199106 ) ) ( not ( = ?auto_199104 ?auto_199105 ) ) ( not ( = ?auto_199104 ?auto_199106 ) ) ( not ( = ?auto_199105 ?auto_199106 ) ) ( ON ?auto_199106 ?auto_199109 ) ( not ( = ?auto_199102 ?auto_199109 ) ) ( not ( = ?auto_199103 ?auto_199109 ) ) ( not ( = ?auto_199104 ?auto_199109 ) ) ( not ( = ?auto_199105 ?auto_199109 ) ) ( not ( = ?auto_199106 ?auto_199109 ) ) ( ON-TABLE ?auto_199107 ) ( ON ?auto_199110 ?auto_199107 ) ( ON ?auto_199109 ?auto_199110 ) ( not ( = ?auto_199107 ?auto_199110 ) ) ( not ( = ?auto_199107 ?auto_199109 ) ) ( not ( = ?auto_199107 ?auto_199106 ) ) ( not ( = ?auto_199107 ?auto_199105 ) ) ( not ( = ?auto_199110 ?auto_199109 ) ) ( not ( = ?auto_199110 ?auto_199106 ) ) ( not ( = ?auto_199110 ?auto_199105 ) ) ( not ( = ?auto_199102 ?auto_199107 ) ) ( not ( = ?auto_199102 ?auto_199110 ) ) ( not ( = ?auto_199103 ?auto_199107 ) ) ( not ( = ?auto_199103 ?auto_199110 ) ) ( not ( = ?auto_199104 ?auto_199107 ) ) ( not ( = ?auto_199104 ?auto_199110 ) ) ( ON ?auto_199102 ?auto_199108 ) ( not ( = ?auto_199102 ?auto_199108 ) ) ( not ( = ?auto_199103 ?auto_199108 ) ) ( not ( = ?auto_199104 ?auto_199108 ) ) ( not ( = ?auto_199105 ?auto_199108 ) ) ( not ( = ?auto_199106 ?auto_199108 ) ) ( not ( = ?auto_199109 ?auto_199108 ) ) ( not ( = ?auto_199107 ?auto_199108 ) ) ( not ( = ?auto_199110 ?auto_199108 ) ) ( ON ?auto_199103 ?auto_199102 ) ( ON-TABLE ?auto_199108 ) ( ON ?auto_199104 ?auto_199103 ) ( CLEAR ?auto_199106 ) ( ON ?auto_199105 ?auto_199104 ) ( CLEAR ?auto_199105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199108 ?auto_199102 ?auto_199103 ?auto_199104 )
      ( MAKE-5PILE ?auto_199102 ?auto_199103 ?auto_199104 ?auto_199105 ?auto_199106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199111 - BLOCK
      ?auto_199112 - BLOCK
      ?auto_199113 - BLOCK
      ?auto_199114 - BLOCK
      ?auto_199115 - BLOCK
    )
    :vars
    (
      ?auto_199117 - BLOCK
      ?auto_199118 - BLOCK
      ?auto_199119 - BLOCK
      ?auto_199116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199111 ?auto_199112 ) ) ( not ( = ?auto_199111 ?auto_199113 ) ) ( not ( = ?auto_199111 ?auto_199114 ) ) ( not ( = ?auto_199111 ?auto_199115 ) ) ( not ( = ?auto_199112 ?auto_199113 ) ) ( not ( = ?auto_199112 ?auto_199114 ) ) ( not ( = ?auto_199112 ?auto_199115 ) ) ( not ( = ?auto_199113 ?auto_199114 ) ) ( not ( = ?auto_199113 ?auto_199115 ) ) ( not ( = ?auto_199114 ?auto_199115 ) ) ( not ( = ?auto_199111 ?auto_199117 ) ) ( not ( = ?auto_199112 ?auto_199117 ) ) ( not ( = ?auto_199113 ?auto_199117 ) ) ( not ( = ?auto_199114 ?auto_199117 ) ) ( not ( = ?auto_199115 ?auto_199117 ) ) ( ON-TABLE ?auto_199118 ) ( ON ?auto_199119 ?auto_199118 ) ( ON ?auto_199117 ?auto_199119 ) ( not ( = ?auto_199118 ?auto_199119 ) ) ( not ( = ?auto_199118 ?auto_199117 ) ) ( not ( = ?auto_199118 ?auto_199115 ) ) ( not ( = ?auto_199118 ?auto_199114 ) ) ( not ( = ?auto_199119 ?auto_199117 ) ) ( not ( = ?auto_199119 ?auto_199115 ) ) ( not ( = ?auto_199119 ?auto_199114 ) ) ( not ( = ?auto_199111 ?auto_199118 ) ) ( not ( = ?auto_199111 ?auto_199119 ) ) ( not ( = ?auto_199112 ?auto_199118 ) ) ( not ( = ?auto_199112 ?auto_199119 ) ) ( not ( = ?auto_199113 ?auto_199118 ) ) ( not ( = ?auto_199113 ?auto_199119 ) ) ( ON ?auto_199111 ?auto_199116 ) ( not ( = ?auto_199111 ?auto_199116 ) ) ( not ( = ?auto_199112 ?auto_199116 ) ) ( not ( = ?auto_199113 ?auto_199116 ) ) ( not ( = ?auto_199114 ?auto_199116 ) ) ( not ( = ?auto_199115 ?auto_199116 ) ) ( not ( = ?auto_199117 ?auto_199116 ) ) ( not ( = ?auto_199118 ?auto_199116 ) ) ( not ( = ?auto_199119 ?auto_199116 ) ) ( ON ?auto_199112 ?auto_199111 ) ( ON-TABLE ?auto_199116 ) ( ON ?auto_199113 ?auto_199112 ) ( ON ?auto_199114 ?auto_199113 ) ( CLEAR ?auto_199114 ) ( HOLDING ?auto_199115 ) ( CLEAR ?auto_199117 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199118 ?auto_199119 ?auto_199117 ?auto_199115 )
      ( MAKE-5PILE ?auto_199111 ?auto_199112 ?auto_199113 ?auto_199114 ?auto_199115 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199120 - BLOCK
      ?auto_199121 - BLOCK
      ?auto_199122 - BLOCK
      ?auto_199123 - BLOCK
      ?auto_199124 - BLOCK
    )
    :vars
    (
      ?auto_199127 - BLOCK
      ?auto_199125 - BLOCK
      ?auto_199128 - BLOCK
      ?auto_199126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199120 ?auto_199121 ) ) ( not ( = ?auto_199120 ?auto_199122 ) ) ( not ( = ?auto_199120 ?auto_199123 ) ) ( not ( = ?auto_199120 ?auto_199124 ) ) ( not ( = ?auto_199121 ?auto_199122 ) ) ( not ( = ?auto_199121 ?auto_199123 ) ) ( not ( = ?auto_199121 ?auto_199124 ) ) ( not ( = ?auto_199122 ?auto_199123 ) ) ( not ( = ?auto_199122 ?auto_199124 ) ) ( not ( = ?auto_199123 ?auto_199124 ) ) ( not ( = ?auto_199120 ?auto_199127 ) ) ( not ( = ?auto_199121 ?auto_199127 ) ) ( not ( = ?auto_199122 ?auto_199127 ) ) ( not ( = ?auto_199123 ?auto_199127 ) ) ( not ( = ?auto_199124 ?auto_199127 ) ) ( ON-TABLE ?auto_199125 ) ( ON ?auto_199128 ?auto_199125 ) ( ON ?auto_199127 ?auto_199128 ) ( not ( = ?auto_199125 ?auto_199128 ) ) ( not ( = ?auto_199125 ?auto_199127 ) ) ( not ( = ?auto_199125 ?auto_199124 ) ) ( not ( = ?auto_199125 ?auto_199123 ) ) ( not ( = ?auto_199128 ?auto_199127 ) ) ( not ( = ?auto_199128 ?auto_199124 ) ) ( not ( = ?auto_199128 ?auto_199123 ) ) ( not ( = ?auto_199120 ?auto_199125 ) ) ( not ( = ?auto_199120 ?auto_199128 ) ) ( not ( = ?auto_199121 ?auto_199125 ) ) ( not ( = ?auto_199121 ?auto_199128 ) ) ( not ( = ?auto_199122 ?auto_199125 ) ) ( not ( = ?auto_199122 ?auto_199128 ) ) ( ON ?auto_199120 ?auto_199126 ) ( not ( = ?auto_199120 ?auto_199126 ) ) ( not ( = ?auto_199121 ?auto_199126 ) ) ( not ( = ?auto_199122 ?auto_199126 ) ) ( not ( = ?auto_199123 ?auto_199126 ) ) ( not ( = ?auto_199124 ?auto_199126 ) ) ( not ( = ?auto_199127 ?auto_199126 ) ) ( not ( = ?auto_199125 ?auto_199126 ) ) ( not ( = ?auto_199128 ?auto_199126 ) ) ( ON ?auto_199121 ?auto_199120 ) ( ON-TABLE ?auto_199126 ) ( ON ?auto_199122 ?auto_199121 ) ( ON ?auto_199123 ?auto_199122 ) ( CLEAR ?auto_199127 ) ( ON ?auto_199124 ?auto_199123 ) ( CLEAR ?auto_199124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199126 ?auto_199120 ?auto_199121 ?auto_199122 ?auto_199123 )
      ( MAKE-5PILE ?auto_199120 ?auto_199121 ?auto_199122 ?auto_199123 ?auto_199124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199129 - BLOCK
      ?auto_199130 - BLOCK
      ?auto_199131 - BLOCK
      ?auto_199132 - BLOCK
      ?auto_199133 - BLOCK
    )
    :vars
    (
      ?auto_199134 - BLOCK
      ?auto_199136 - BLOCK
      ?auto_199135 - BLOCK
      ?auto_199137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199129 ?auto_199130 ) ) ( not ( = ?auto_199129 ?auto_199131 ) ) ( not ( = ?auto_199129 ?auto_199132 ) ) ( not ( = ?auto_199129 ?auto_199133 ) ) ( not ( = ?auto_199130 ?auto_199131 ) ) ( not ( = ?auto_199130 ?auto_199132 ) ) ( not ( = ?auto_199130 ?auto_199133 ) ) ( not ( = ?auto_199131 ?auto_199132 ) ) ( not ( = ?auto_199131 ?auto_199133 ) ) ( not ( = ?auto_199132 ?auto_199133 ) ) ( not ( = ?auto_199129 ?auto_199134 ) ) ( not ( = ?auto_199130 ?auto_199134 ) ) ( not ( = ?auto_199131 ?auto_199134 ) ) ( not ( = ?auto_199132 ?auto_199134 ) ) ( not ( = ?auto_199133 ?auto_199134 ) ) ( ON-TABLE ?auto_199136 ) ( ON ?auto_199135 ?auto_199136 ) ( not ( = ?auto_199136 ?auto_199135 ) ) ( not ( = ?auto_199136 ?auto_199134 ) ) ( not ( = ?auto_199136 ?auto_199133 ) ) ( not ( = ?auto_199136 ?auto_199132 ) ) ( not ( = ?auto_199135 ?auto_199134 ) ) ( not ( = ?auto_199135 ?auto_199133 ) ) ( not ( = ?auto_199135 ?auto_199132 ) ) ( not ( = ?auto_199129 ?auto_199136 ) ) ( not ( = ?auto_199129 ?auto_199135 ) ) ( not ( = ?auto_199130 ?auto_199136 ) ) ( not ( = ?auto_199130 ?auto_199135 ) ) ( not ( = ?auto_199131 ?auto_199136 ) ) ( not ( = ?auto_199131 ?auto_199135 ) ) ( ON ?auto_199129 ?auto_199137 ) ( not ( = ?auto_199129 ?auto_199137 ) ) ( not ( = ?auto_199130 ?auto_199137 ) ) ( not ( = ?auto_199131 ?auto_199137 ) ) ( not ( = ?auto_199132 ?auto_199137 ) ) ( not ( = ?auto_199133 ?auto_199137 ) ) ( not ( = ?auto_199134 ?auto_199137 ) ) ( not ( = ?auto_199136 ?auto_199137 ) ) ( not ( = ?auto_199135 ?auto_199137 ) ) ( ON ?auto_199130 ?auto_199129 ) ( ON-TABLE ?auto_199137 ) ( ON ?auto_199131 ?auto_199130 ) ( ON ?auto_199132 ?auto_199131 ) ( ON ?auto_199133 ?auto_199132 ) ( CLEAR ?auto_199133 ) ( HOLDING ?auto_199134 ) ( CLEAR ?auto_199135 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199136 ?auto_199135 ?auto_199134 )
      ( MAKE-5PILE ?auto_199129 ?auto_199130 ?auto_199131 ?auto_199132 ?auto_199133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199138 - BLOCK
      ?auto_199139 - BLOCK
      ?auto_199140 - BLOCK
      ?auto_199141 - BLOCK
      ?auto_199142 - BLOCK
    )
    :vars
    (
      ?auto_199146 - BLOCK
      ?auto_199143 - BLOCK
      ?auto_199144 - BLOCK
      ?auto_199145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199138 ?auto_199139 ) ) ( not ( = ?auto_199138 ?auto_199140 ) ) ( not ( = ?auto_199138 ?auto_199141 ) ) ( not ( = ?auto_199138 ?auto_199142 ) ) ( not ( = ?auto_199139 ?auto_199140 ) ) ( not ( = ?auto_199139 ?auto_199141 ) ) ( not ( = ?auto_199139 ?auto_199142 ) ) ( not ( = ?auto_199140 ?auto_199141 ) ) ( not ( = ?auto_199140 ?auto_199142 ) ) ( not ( = ?auto_199141 ?auto_199142 ) ) ( not ( = ?auto_199138 ?auto_199146 ) ) ( not ( = ?auto_199139 ?auto_199146 ) ) ( not ( = ?auto_199140 ?auto_199146 ) ) ( not ( = ?auto_199141 ?auto_199146 ) ) ( not ( = ?auto_199142 ?auto_199146 ) ) ( ON-TABLE ?auto_199143 ) ( ON ?auto_199144 ?auto_199143 ) ( not ( = ?auto_199143 ?auto_199144 ) ) ( not ( = ?auto_199143 ?auto_199146 ) ) ( not ( = ?auto_199143 ?auto_199142 ) ) ( not ( = ?auto_199143 ?auto_199141 ) ) ( not ( = ?auto_199144 ?auto_199146 ) ) ( not ( = ?auto_199144 ?auto_199142 ) ) ( not ( = ?auto_199144 ?auto_199141 ) ) ( not ( = ?auto_199138 ?auto_199143 ) ) ( not ( = ?auto_199138 ?auto_199144 ) ) ( not ( = ?auto_199139 ?auto_199143 ) ) ( not ( = ?auto_199139 ?auto_199144 ) ) ( not ( = ?auto_199140 ?auto_199143 ) ) ( not ( = ?auto_199140 ?auto_199144 ) ) ( ON ?auto_199138 ?auto_199145 ) ( not ( = ?auto_199138 ?auto_199145 ) ) ( not ( = ?auto_199139 ?auto_199145 ) ) ( not ( = ?auto_199140 ?auto_199145 ) ) ( not ( = ?auto_199141 ?auto_199145 ) ) ( not ( = ?auto_199142 ?auto_199145 ) ) ( not ( = ?auto_199146 ?auto_199145 ) ) ( not ( = ?auto_199143 ?auto_199145 ) ) ( not ( = ?auto_199144 ?auto_199145 ) ) ( ON ?auto_199139 ?auto_199138 ) ( ON-TABLE ?auto_199145 ) ( ON ?auto_199140 ?auto_199139 ) ( ON ?auto_199141 ?auto_199140 ) ( ON ?auto_199142 ?auto_199141 ) ( CLEAR ?auto_199144 ) ( ON ?auto_199146 ?auto_199142 ) ( CLEAR ?auto_199146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199145 ?auto_199138 ?auto_199139 ?auto_199140 ?auto_199141 ?auto_199142 )
      ( MAKE-5PILE ?auto_199138 ?auto_199139 ?auto_199140 ?auto_199141 ?auto_199142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199147 - BLOCK
      ?auto_199148 - BLOCK
      ?auto_199149 - BLOCK
      ?auto_199150 - BLOCK
      ?auto_199151 - BLOCK
    )
    :vars
    (
      ?auto_199153 - BLOCK
      ?auto_199152 - BLOCK
      ?auto_199155 - BLOCK
      ?auto_199154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199147 ?auto_199148 ) ) ( not ( = ?auto_199147 ?auto_199149 ) ) ( not ( = ?auto_199147 ?auto_199150 ) ) ( not ( = ?auto_199147 ?auto_199151 ) ) ( not ( = ?auto_199148 ?auto_199149 ) ) ( not ( = ?auto_199148 ?auto_199150 ) ) ( not ( = ?auto_199148 ?auto_199151 ) ) ( not ( = ?auto_199149 ?auto_199150 ) ) ( not ( = ?auto_199149 ?auto_199151 ) ) ( not ( = ?auto_199150 ?auto_199151 ) ) ( not ( = ?auto_199147 ?auto_199153 ) ) ( not ( = ?auto_199148 ?auto_199153 ) ) ( not ( = ?auto_199149 ?auto_199153 ) ) ( not ( = ?auto_199150 ?auto_199153 ) ) ( not ( = ?auto_199151 ?auto_199153 ) ) ( ON-TABLE ?auto_199152 ) ( not ( = ?auto_199152 ?auto_199155 ) ) ( not ( = ?auto_199152 ?auto_199153 ) ) ( not ( = ?auto_199152 ?auto_199151 ) ) ( not ( = ?auto_199152 ?auto_199150 ) ) ( not ( = ?auto_199155 ?auto_199153 ) ) ( not ( = ?auto_199155 ?auto_199151 ) ) ( not ( = ?auto_199155 ?auto_199150 ) ) ( not ( = ?auto_199147 ?auto_199152 ) ) ( not ( = ?auto_199147 ?auto_199155 ) ) ( not ( = ?auto_199148 ?auto_199152 ) ) ( not ( = ?auto_199148 ?auto_199155 ) ) ( not ( = ?auto_199149 ?auto_199152 ) ) ( not ( = ?auto_199149 ?auto_199155 ) ) ( ON ?auto_199147 ?auto_199154 ) ( not ( = ?auto_199147 ?auto_199154 ) ) ( not ( = ?auto_199148 ?auto_199154 ) ) ( not ( = ?auto_199149 ?auto_199154 ) ) ( not ( = ?auto_199150 ?auto_199154 ) ) ( not ( = ?auto_199151 ?auto_199154 ) ) ( not ( = ?auto_199153 ?auto_199154 ) ) ( not ( = ?auto_199152 ?auto_199154 ) ) ( not ( = ?auto_199155 ?auto_199154 ) ) ( ON ?auto_199148 ?auto_199147 ) ( ON-TABLE ?auto_199154 ) ( ON ?auto_199149 ?auto_199148 ) ( ON ?auto_199150 ?auto_199149 ) ( ON ?auto_199151 ?auto_199150 ) ( ON ?auto_199153 ?auto_199151 ) ( CLEAR ?auto_199153 ) ( HOLDING ?auto_199155 ) ( CLEAR ?auto_199152 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199152 ?auto_199155 )
      ( MAKE-5PILE ?auto_199147 ?auto_199148 ?auto_199149 ?auto_199150 ?auto_199151 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199156 - BLOCK
      ?auto_199157 - BLOCK
      ?auto_199158 - BLOCK
      ?auto_199159 - BLOCK
      ?auto_199160 - BLOCK
    )
    :vars
    (
      ?auto_199162 - BLOCK
      ?auto_199164 - BLOCK
      ?auto_199163 - BLOCK
      ?auto_199161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199156 ?auto_199157 ) ) ( not ( = ?auto_199156 ?auto_199158 ) ) ( not ( = ?auto_199156 ?auto_199159 ) ) ( not ( = ?auto_199156 ?auto_199160 ) ) ( not ( = ?auto_199157 ?auto_199158 ) ) ( not ( = ?auto_199157 ?auto_199159 ) ) ( not ( = ?auto_199157 ?auto_199160 ) ) ( not ( = ?auto_199158 ?auto_199159 ) ) ( not ( = ?auto_199158 ?auto_199160 ) ) ( not ( = ?auto_199159 ?auto_199160 ) ) ( not ( = ?auto_199156 ?auto_199162 ) ) ( not ( = ?auto_199157 ?auto_199162 ) ) ( not ( = ?auto_199158 ?auto_199162 ) ) ( not ( = ?auto_199159 ?auto_199162 ) ) ( not ( = ?auto_199160 ?auto_199162 ) ) ( ON-TABLE ?auto_199164 ) ( not ( = ?auto_199164 ?auto_199163 ) ) ( not ( = ?auto_199164 ?auto_199162 ) ) ( not ( = ?auto_199164 ?auto_199160 ) ) ( not ( = ?auto_199164 ?auto_199159 ) ) ( not ( = ?auto_199163 ?auto_199162 ) ) ( not ( = ?auto_199163 ?auto_199160 ) ) ( not ( = ?auto_199163 ?auto_199159 ) ) ( not ( = ?auto_199156 ?auto_199164 ) ) ( not ( = ?auto_199156 ?auto_199163 ) ) ( not ( = ?auto_199157 ?auto_199164 ) ) ( not ( = ?auto_199157 ?auto_199163 ) ) ( not ( = ?auto_199158 ?auto_199164 ) ) ( not ( = ?auto_199158 ?auto_199163 ) ) ( ON ?auto_199156 ?auto_199161 ) ( not ( = ?auto_199156 ?auto_199161 ) ) ( not ( = ?auto_199157 ?auto_199161 ) ) ( not ( = ?auto_199158 ?auto_199161 ) ) ( not ( = ?auto_199159 ?auto_199161 ) ) ( not ( = ?auto_199160 ?auto_199161 ) ) ( not ( = ?auto_199162 ?auto_199161 ) ) ( not ( = ?auto_199164 ?auto_199161 ) ) ( not ( = ?auto_199163 ?auto_199161 ) ) ( ON ?auto_199157 ?auto_199156 ) ( ON-TABLE ?auto_199161 ) ( ON ?auto_199158 ?auto_199157 ) ( ON ?auto_199159 ?auto_199158 ) ( ON ?auto_199160 ?auto_199159 ) ( ON ?auto_199162 ?auto_199160 ) ( CLEAR ?auto_199164 ) ( ON ?auto_199163 ?auto_199162 ) ( CLEAR ?auto_199163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199161 ?auto_199156 ?auto_199157 ?auto_199158 ?auto_199159 ?auto_199160 ?auto_199162 )
      ( MAKE-5PILE ?auto_199156 ?auto_199157 ?auto_199158 ?auto_199159 ?auto_199160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199165 - BLOCK
      ?auto_199166 - BLOCK
      ?auto_199167 - BLOCK
      ?auto_199168 - BLOCK
      ?auto_199169 - BLOCK
    )
    :vars
    (
      ?auto_199172 - BLOCK
      ?auto_199171 - BLOCK
      ?auto_199173 - BLOCK
      ?auto_199170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199165 ?auto_199166 ) ) ( not ( = ?auto_199165 ?auto_199167 ) ) ( not ( = ?auto_199165 ?auto_199168 ) ) ( not ( = ?auto_199165 ?auto_199169 ) ) ( not ( = ?auto_199166 ?auto_199167 ) ) ( not ( = ?auto_199166 ?auto_199168 ) ) ( not ( = ?auto_199166 ?auto_199169 ) ) ( not ( = ?auto_199167 ?auto_199168 ) ) ( not ( = ?auto_199167 ?auto_199169 ) ) ( not ( = ?auto_199168 ?auto_199169 ) ) ( not ( = ?auto_199165 ?auto_199172 ) ) ( not ( = ?auto_199166 ?auto_199172 ) ) ( not ( = ?auto_199167 ?auto_199172 ) ) ( not ( = ?auto_199168 ?auto_199172 ) ) ( not ( = ?auto_199169 ?auto_199172 ) ) ( not ( = ?auto_199171 ?auto_199173 ) ) ( not ( = ?auto_199171 ?auto_199172 ) ) ( not ( = ?auto_199171 ?auto_199169 ) ) ( not ( = ?auto_199171 ?auto_199168 ) ) ( not ( = ?auto_199173 ?auto_199172 ) ) ( not ( = ?auto_199173 ?auto_199169 ) ) ( not ( = ?auto_199173 ?auto_199168 ) ) ( not ( = ?auto_199165 ?auto_199171 ) ) ( not ( = ?auto_199165 ?auto_199173 ) ) ( not ( = ?auto_199166 ?auto_199171 ) ) ( not ( = ?auto_199166 ?auto_199173 ) ) ( not ( = ?auto_199167 ?auto_199171 ) ) ( not ( = ?auto_199167 ?auto_199173 ) ) ( ON ?auto_199165 ?auto_199170 ) ( not ( = ?auto_199165 ?auto_199170 ) ) ( not ( = ?auto_199166 ?auto_199170 ) ) ( not ( = ?auto_199167 ?auto_199170 ) ) ( not ( = ?auto_199168 ?auto_199170 ) ) ( not ( = ?auto_199169 ?auto_199170 ) ) ( not ( = ?auto_199172 ?auto_199170 ) ) ( not ( = ?auto_199171 ?auto_199170 ) ) ( not ( = ?auto_199173 ?auto_199170 ) ) ( ON ?auto_199166 ?auto_199165 ) ( ON-TABLE ?auto_199170 ) ( ON ?auto_199167 ?auto_199166 ) ( ON ?auto_199168 ?auto_199167 ) ( ON ?auto_199169 ?auto_199168 ) ( ON ?auto_199172 ?auto_199169 ) ( ON ?auto_199173 ?auto_199172 ) ( CLEAR ?auto_199173 ) ( HOLDING ?auto_199171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199171 )
      ( MAKE-5PILE ?auto_199165 ?auto_199166 ?auto_199167 ?auto_199168 ?auto_199169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_199174 - BLOCK
      ?auto_199175 - BLOCK
      ?auto_199176 - BLOCK
      ?auto_199177 - BLOCK
      ?auto_199178 - BLOCK
    )
    :vars
    (
      ?auto_199179 - BLOCK
      ?auto_199180 - BLOCK
      ?auto_199181 - BLOCK
      ?auto_199182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199174 ?auto_199175 ) ) ( not ( = ?auto_199174 ?auto_199176 ) ) ( not ( = ?auto_199174 ?auto_199177 ) ) ( not ( = ?auto_199174 ?auto_199178 ) ) ( not ( = ?auto_199175 ?auto_199176 ) ) ( not ( = ?auto_199175 ?auto_199177 ) ) ( not ( = ?auto_199175 ?auto_199178 ) ) ( not ( = ?auto_199176 ?auto_199177 ) ) ( not ( = ?auto_199176 ?auto_199178 ) ) ( not ( = ?auto_199177 ?auto_199178 ) ) ( not ( = ?auto_199174 ?auto_199179 ) ) ( not ( = ?auto_199175 ?auto_199179 ) ) ( not ( = ?auto_199176 ?auto_199179 ) ) ( not ( = ?auto_199177 ?auto_199179 ) ) ( not ( = ?auto_199178 ?auto_199179 ) ) ( not ( = ?auto_199180 ?auto_199181 ) ) ( not ( = ?auto_199180 ?auto_199179 ) ) ( not ( = ?auto_199180 ?auto_199178 ) ) ( not ( = ?auto_199180 ?auto_199177 ) ) ( not ( = ?auto_199181 ?auto_199179 ) ) ( not ( = ?auto_199181 ?auto_199178 ) ) ( not ( = ?auto_199181 ?auto_199177 ) ) ( not ( = ?auto_199174 ?auto_199180 ) ) ( not ( = ?auto_199174 ?auto_199181 ) ) ( not ( = ?auto_199175 ?auto_199180 ) ) ( not ( = ?auto_199175 ?auto_199181 ) ) ( not ( = ?auto_199176 ?auto_199180 ) ) ( not ( = ?auto_199176 ?auto_199181 ) ) ( ON ?auto_199174 ?auto_199182 ) ( not ( = ?auto_199174 ?auto_199182 ) ) ( not ( = ?auto_199175 ?auto_199182 ) ) ( not ( = ?auto_199176 ?auto_199182 ) ) ( not ( = ?auto_199177 ?auto_199182 ) ) ( not ( = ?auto_199178 ?auto_199182 ) ) ( not ( = ?auto_199179 ?auto_199182 ) ) ( not ( = ?auto_199180 ?auto_199182 ) ) ( not ( = ?auto_199181 ?auto_199182 ) ) ( ON ?auto_199175 ?auto_199174 ) ( ON-TABLE ?auto_199182 ) ( ON ?auto_199176 ?auto_199175 ) ( ON ?auto_199177 ?auto_199176 ) ( ON ?auto_199178 ?auto_199177 ) ( ON ?auto_199179 ?auto_199178 ) ( ON ?auto_199181 ?auto_199179 ) ( ON ?auto_199180 ?auto_199181 ) ( CLEAR ?auto_199180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199182 ?auto_199174 ?auto_199175 ?auto_199176 ?auto_199177 ?auto_199178 ?auto_199179 ?auto_199181 )
      ( MAKE-5PILE ?auto_199174 ?auto_199175 ?auto_199176 ?auto_199177 ?auto_199178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199185 - BLOCK
      ?auto_199186 - BLOCK
    )
    :vars
    (
      ?auto_199187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199187 ?auto_199186 ) ( CLEAR ?auto_199187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199185 ) ( ON ?auto_199186 ?auto_199185 ) ( not ( = ?auto_199185 ?auto_199186 ) ) ( not ( = ?auto_199185 ?auto_199187 ) ) ( not ( = ?auto_199186 ?auto_199187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199187 ?auto_199186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199188 - BLOCK
      ?auto_199189 - BLOCK
    )
    :vars
    (
      ?auto_199190 - BLOCK
      ?auto_199191 - BLOCK
      ?auto_199192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199190 ?auto_199189 ) ( CLEAR ?auto_199190 ) ( ON-TABLE ?auto_199188 ) ( ON ?auto_199189 ?auto_199188 ) ( not ( = ?auto_199188 ?auto_199189 ) ) ( not ( = ?auto_199188 ?auto_199190 ) ) ( not ( = ?auto_199189 ?auto_199190 ) ) ( HOLDING ?auto_199191 ) ( CLEAR ?auto_199192 ) ( not ( = ?auto_199188 ?auto_199191 ) ) ( not ( = ?auto_199188 ?auto_199192 ) ) ( not ( = ?auto_199189 ?auto_199191 ) ) ( not ( = ?auto_199189 ?auto_199192 ) ) ( not ( = ?auto_199190 ?auto_199191 ) ) ( not ( = ?auto_199190 ?auto_199192 ) ) ( not ( = ?auto_199191 ?auto_199192 ) ) )
    :subtasks
    ( ( !STACK ?auto_199191 ?auto_199192 )
      ( MAKE-2PILE ?auto_199188 ?auto_199189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199193 - BLOCK
      ?auto_199194 - BLOCK
    )
    :vars
    (
      ?auto_199195 - BLOCK
      ?auto_199197 - BLOCK
      ?auto_199196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199195 ?auto_199194 ) ( ON-TABLE ?auto_199193 ) ( ON ?auto_199194 ?auto_199193 ) ( not ( = ?auto_199193 ?auto_199194 ) ) ( not ( = ?auto_199193 ?auto_199195 ) ) ( not ( = ?auto_199194 ?auto_199195 ) ) ( CLEAR ?auto_199197 ) ( not ( = ?auto_199193 ?auto_199196 ) ) ( not ( = ?auto_199193 ?auto_199197 ) ) ( not ( = ?auto_199194 ?auto_199196 ) ) ( not ( = ?auto_199194 ?auto_199197 ) ) ( not ( = ?auto_199195 ?auto_199196 ) ) ( not ( = ?auto_199195 ?auto_199197 ) ) ( not ( = ?auto_199196 ?auto_199197 ) ) ( ON ?auto_199196 ?auto_199195 ) ( CLEAR ?auto_199196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199193 ?auto_199194 ?auto_199195 )
      ( MAKE-2PILE ?auto_199193 ?auto_199194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199198 - BLOCK
      ?auto_199199 - BLOCK
    )
    :vars
    (
      ?auto_199202 - BLOCK
      ?auto_199200 - BLOCK
      ?auto_199201 - BLOCK
      ?auto_199205 - BLOCK
      ?auto_199203 - BLOCK
      ?auto_199204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199202 ?auto_199199 ) ( ON-TABLE ?auto_199198 ) ( ON ?auto_199199 ?auto_199198 ) ( not ( = ?auto_199198 ?auto_199199 ) ) ( not ( = ?auto_199198 ?auto_199202 ) ) ( not ( = ?auto_199199 ?auto_199202 ) ) ( not ( = ?auto_199198 ?auto_199200 ) ) ( not ( = ?auto_199198 ?auto_199201 ) ) ( not ( = ?auto_199199 ?auto_199200 ) ) ( not ( = ?auto_199199 ?auto_199201 ) ) ( not ( = ?auto_199202 ?auto_199200 ) ) ( not ( = ?auto_199202 ?auto_199201 ) ) ( not ( = ?auto_199200 ?auto_199201 ) ) ( ON ?auto_199200 ?auto_199202 ) ( CLEAR ?auto_199200 ) ( HOLDING ?auto_199201 ) ( CLEAR ?auto_199205 ) ( ON-TABLE ?auto_199203 ) ( ON ?auto_199204 ?auto_199203 ) ( ON ?auto_199205 ?auto_199204 ) ( not ( = ?auto_199203 ?auto_199204 ) ) ( not ( = ?auto_199203 ?auto_199205 ) ) ( not ( = ?auto_199203 ?auto_199201 ) ) ( not ( = ?auto_199204 ?auto_199205 ) ) ( not ( = ?auto_199204 ?auto_199201 ) ) ( not ( = ?auto_199205 ?auto_199201 ) ) ( not ( = ?auto_199198 ?auto_199205 ) ) ( not ( = ?auto_199198 ?auto_199203 ) ) ( not ( = ?auto_199198 ?auto_199204 ) ) ( not ( = ?auto_199199 ?auto_199205 ) ) ( not ( = ?auto_199199 ?auto_199203 ) ) ( not ( = ?auto_199199 ?auto_199204 ) ) ( not ( = ?auto_199202 ?auto_199205 ) ) ( not ( = ?auto_199202 ?auto_199203 ) ) ( not ( = ?auto_199202 ?auto_199204 ) ) ( not ( = ?auto_199200 ?auto_199205 ) ) ( not ( = ?auto_199200 ?auto_199203 ) ) ( not ( = ?auto_199200 ?auto_199204 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199203 ?auto_199204 ?auto_199205 ?auto_199201 )
      ( MAKE-2PILE ?auto_199198 ?auto_199199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199206 - BLOCK
      ?auto_199207 - BLOCK
    )
    :vars
    (
      ?auto_199210 - BLOCK
      ?auto_199209 - BLOCK
      ?auto_199208 - BLOCK
      ?auto_199212 - BLOCK
      ?auto_199213 - BLOCK
      ?auto_199211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199210 ?auto_199207 ) ( ON-TABLE ?auto_199206 ) ( ON ?auto_199207 ?auto_199206 ) ( not ( = ?auto_199206 ?auto_199207 ) ) ( not ( = ?auto_199206 ?auto_199210 ) ) ( not ( = ?auto_199207 ?auto_199210 ) ) ( not ( = ?auto_199206 ?auto_199209 ) ) ( not ( = ?auto_199206 ?auto_199208 ) ) ( not ( = ?auto_199207 ?auto_199209 ) ) ( not ( = ?auto_199207 ?auto_199208 ) ) ( not ( = ?auto_199210 ?auto_199209 ) ) ( not ( = ?auto_199210 ?auto_199208 ) ) ( not ( = ?auto_199209 ?auto_199208 ) ) ( ON ?auto_199209 ?auto_199210 ) ( CLEAR ?auto_199212 ) ( ON-TABLE ?auto_199213 ) ( ON ?auto_199211 ?auto_199213 ) ( ON ?auto_199212 ?auto_199211 ) ( not ( = ?auto_199213 ?auto_199211 ) ) ( not ( = ?auto_199213 ?auto_199212 ) ) ( not ( = ?auto_199213 ?auto_199208 ) ) ( not ( = ?auto_199211 ?auto_199212 ) ) ( not ( = ?auto_199211 ?auto_199208 ) ) ( not ( = ?auto_199212 ?auto_199208 ) ) ( not ( = ?auto_199206 ?auto_199212 ) ) ( not ( = ?auto_199206 ?auto_199213 ) ) ( not ( = ?auto_199206 ?auto_199211 ) ) ( not ( = ?auto_199207 ?auto_199212 ) ) ( not ( = ?auto_199207 ?auto_199213 ) ) ( not ( = ?auto_199207 ?auto_199211 ) ) ( not ( = ?auto_199210 ?auto_199212 ) ) ( not ( = ?auto_199210 ?auto_199213 ) ) ( not ( = ?auto_199210 ?auto_199211 ) ) ( not ( = ?auto_199209 ?auto_199212 ) ) ( not ( = ?auto_199209 ?auto_199213 ) ) ( not ( = ?auto_199209 ?auto_199211 ) ) ( ON ?auto_199208 ?auto_199209 ) ( CLEAR ?auto_199208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199206 ?auto_199207 ?auto_199210 ?auto_199209 )
      ( MAKE-2PILE ?auto_199206 ?auto_199207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199214 - BLOCK
      ?auto_199215 - BLOCK
    )
    :vars
    (
      ?auto_199221 - BLOCK
      ?auto_199216 - BLOCK
      ?auto_199219 - BLOCK
      ?auto_199220 - BLOCK
      ?auto_199218 - BLOCK
      ?auto_199217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199221 ?auto_199215 ) ( ON-TABLE ?auto_199214 ) ( ON ?auto_199215 ?auto_199214 ) ( not ( = ?auto_199214 ?auto_199215 ) ) ( not ( = ?auto_199214 ?auto_199221 ) ) ( not ( = ?auto_199215 ?auto_199221 ) ) ( not ( = ?auto_199214 ?auto_199216 ) ) ( not ( = ?auto_199214 ?auto_199219 ) ) ( not ( = ?auto_199215 ?auto_199216 ) ) ( not ( = ?auto_199215 ?auto_199219 ) ) ( not ( = ?auto_199221 ?auto_199216 ) ) ( not ( = ?auto_199221 ?auto_199219 ) ) ( not ( = ?auto_199216 ?auto_199219 ) ) ( ON ?auto_199216 ?auto_199221 ) ( ON-TABLE ?auto_199220 ) ( ON ?auto_199218 ?auto_199220 ) ( not ( = ?auto_199220 ?auto_199218 ) ) ( not ( = ?auto_199220 ?auto_199217 ) ) ( not ( = ?auto_199220 ?auto_199219 ) ) ( not ( = ?auto_199218 ?auto_199217 ) ) ( not ( = ?auto_199218 ?auto_199219 ) ) ( not ( = ?auto_199217 ?auto_199219 ) ) ( not ( = ?auto_199214 ?auto_199217 ) ) ( not ( = ?auto_199214 ?auto_199220 ) ) ( not ( = ?auto_199214 ?auto_199218 ) ) ( not ( = ?auto_199215 ?auto_199217 ) ) ( not ( = ?auto_199215 ?auto_199220 ) ) ( not ( = ?auto_199215 ?auto_199218 ) ) ( not ( = ?auto_199221 ?auto_199217 ) ) ( not ( = ?auto_199221 ?auto_199220 ) ) ( not ( = ?auto_199221 ?auto_199218 ) ) ( not ( = ?auto_199216 ?auto_199217 ) ) ( not ( = ?auto_199216 ?auto_199220 ) ) ( not ( = ?auto_199216 ?auto_199218 ) ) ( ON ?auto_199219 ?auto_199216 ) ( CLEAR ?auto_199219 ) ( HOLDING ?auto_199217 ) ( CLEAR ?auto_199218 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199220 ?auto_199218 ?auto_199217 )
      ( MAKE-2PILE ?auto_199214 ?auto_199215 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199222 - BLOCK
      ?auto_199223 - BLOCK
    )
    :vars
    (
      ?auto_199228 - BLOCK
      ?auto_199229 - BLOCK
      ?auto_199227 - BLOCK
      ?auto_199226 - BLOCK
      ?auto_199225 - BLOCK
      ?auto_199224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199228 ?auto_199223 ) ( ON-TABLE ?auto_199222 ) ( ON ?auto_199223 ?auto_199222 ) ( not ( = ?auto_199222 ?auto_199223 ) ) ( not ( = ?auto_199222 ?auto_199228 ) ) ( not ( = ?auto_199223 ?auto_199228 ) ) ( not ( = ?auto_199222 ?auto_199229 ) ) ( not ( = ?auto_199222 ?auto_199227 ) ) ( not ( = ?auto_199223 ?auto_199229 ) ) ( not ( = ?auto_199223 ?auto_199227 ) ) ( not ( = ?auto_199228 ?auto_199229 ) ) ( not ( = ?auto_199228 ?auto_199227 ) ) ( not ( = ?auto_199229 ?auto_199227 ) ) ( ON ?auto_199229 ?auto_199228 ) ( ON-TABLE ?auto_199226 ) ( ON ?auto_199225 ?auto_199226 ) ( not ( = ?auto_199226 ?auto_199225 ) ) ( not ( = ?auto_199226 ?auto_199224 ) ) ( not ( = ?auto_199226 ?auto_199227 ) ) ( not ( = ?auto_199225 ?auto_199224 ) ) ( not ( = ?auto_199225 ?auto_199227 ) ) ( not ( = ?auto_199224 ?auto_199227 ) ) ( not ( = ?auto_199222 ?auto_199224 ) ) ( not ( = ?auto_199222 ?auto_199226 ) ) ( not ( = ?auto_199222 ?auto_199225 ) ) ( not ( = ?auto_199223 ?auto_199224 ) ) ( not ( = ?auto_199223 ?auto_199226 ) ) ( not ( = ?auto_199223 ?auto_199225 ) ) ( not ( = ?auto_199228 ?auto_199224 ) ) ( not ( = ?auto_199228 ?auto_199226 ) ) ( not ( = ?auto_199228 ?auto_199225 ) ) ( not ( = ?auto_199229 ?auto_199224 ) ) ( not ( = ?auto_199229 ?auto_199226 ) ) ( not ( = ?auto_199229 ?auto_199225 ) ) ( ON ?auto_199227 ?auto_199229 ) ( CLEAR ?auto_199225 ) ( ON ?auto_199224 ?auto_199227 ) ( CLEAR ?auto_199224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199222 ?auto_199223 ?auto_199228 ?auto_199229 ?auto_199227 )
      ( MAKE-2PILE ?auto_199222 ?auto_199223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199230 - BLOCK
      ?auto_199231 - BLOCK
    )
    :vars
    (
      ?auto_199232 - BLOCK
      ?auto_199233 - BLOCK
      ?auto_199236 - BLOCK
      ?auto_199234 - BLOCK
      ?auto_199237 - BLOCK
      ?auto_199235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199232 ?auto_199231 ) ( ON-TABLE ?auto_199230 ) ( ON ?auto_199231 ?auto_199230 ) ( not ( = ?auto_199230 ?auto_199231 ) ) ( not ( = ?auto_199230 ?auto_199232 ) ) ( not ( = ?auto_199231 ?auto_199232 ) ) ( not ( = ?auto_199230 ?auto_199233 ) ) ( not ( = ?auto_199230 ?auto_199236 ) ) ( not ( = ?auto_199231 ?auto_199233 ) ) ( not ( = ?auto_199231 ?auto_199236 ) ) ( not ( = ?auto_199232 ?auto_199233 ) ) ( not ( = ?auto_199232 ?auto_199236 ) ) ( not ( = ?auto_199233 ?auto_199236 ) ) ( ON ?auto_199233 ?auto_199232 ) ( ON-TABLE ?auto_199234 ) ( not ( = ?auto_199234 ?auto_199237 ) ) ( not ( = ?auto_199234 ?auto_199235 ) ) ( not ( = ?auto_199234 ?auto_199236 ) ) ( not ( = ?auto_199237 ?auto_199235 ) ) ( not ( = ?auto_199237 ?auto_199236 ) ) ( not ( = ?auto_199235 ?auto_199236 ) ) ( not ( = ?auto_199230 ?auto_199235 ) ) ( not ( = ?auto_199230 ?auto_199234 ) ) ( not ( = ?auto_199230 ?auto_199237 ) ) ( not ( = ?auto_199231 ?auto_199235 ) ) ( not ( = ?auto_199231 ?auto_199234 ) ) ( not ( = ?auto_199231 ?auto_199237 ) ) ( not ( = ?auto_199232 ?auto_199235 ) ) ( not ( = ?auto_199232 ?auto_199234 ) ) ( not ( = ?auto_199232 ?auto_199237 ) ) ( not ( = ?auto_199233 ?auto_199235 ) ) ( not ( = ?auto_199233 ?auto_199234 ) ) ( not ( = ?auto_199233 ?auto_199237 ) ) ( ON ?auto_199236 ?auto_199233 ) ( ON ?auto_199235 ?auto_199236 ) ( CLEAR ?auto_199235 ) ( HOLDING ?auto_199237 ) ( CLEAR ?auto_199234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199234 ?auto_199237 )
      ( MAKE-2PILE ?auto_199230 ?auto_199231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199238 - BLOCK
      ?auto_199239 - BLOCK
    )
    :vars
    (
      ?auto_199243 - BLOCK
      ?auto_199241 - BLOCK
      ?auto_199245 - BLOCK
      ?auto_199240 - BLOCK
      ?auto_199242 - BLOCK
      ?auto_199244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199243 ?auto_199239 ) ( ON-TABLE ?auto_199238 ) ( ON ?auto_199239 ?auto_199238 ) ( not ( = ?auto_199238 ?auto_199239 ) ) ( not ( = ?auto_199238 ?auto_199243 ) ) ( not ( = ?auto_199239 ?auto_199243 ) ) ( not ( = ?auto_199238 ?auto_199241 ) ) ( not ( = ?auto_199238 ?auto_199245 ) ) ( not ( = ?auto_199239 ?auto_199241 ) ) ( not ( = ?auto_199239 ?auto_199245 ) ) ( not ( = ?auto_199243 ?auto_199241 ) ) ( not ( = ?auto_199243 ?auto_199245 ) ) ( not ( = ?auto_199241 ?auto_199245 ) ) ( ON ?auto_199241 ?auto_199243 ) ( ON-TABLE ?auto_199240 ) ( not ( = ?auto_199240 ?auto_199242 ) ) ( not ( = ?auto_199240 ?auto_199244 ) ) ( not ( = ?auto_199240 ?auto_199245 ) ) ( not ( = ?auto_199242 ?auto_199244 ) ) ( not ( = ?auto_199242 ?auto_199245 ) ) ( not ( = ?auto_199244 ?auto_199245 ) ) ( not ( = ?auto_199238 ?auto_199244 ) ) ( not ( = ?auto_199238 ?auto_199240 ) ) ( not ( = ?auto_199238 ?auto_199242 ) ) ( not ( = ?auto_199239 ?auto_199244 ) ) ( not ( = ?auto_199239 ?auto_199240 ) ) ( not ( = ?auto_199239 ?auto_199242 ) ) ( not ( = ?auto_199243 ?auto_199244 ) ) ( not ( = ?auto_199243 ?auto_199240 ) ) ( not ( = ?auto_199243 ?auto_199242 ) ) ( not ( = ?auto_199241 ?auto_199244 ) ) ( not ( = ?auto_199241 ?auto_199240 ) ) ( not ( = ?auto_199241 ?auto_199242 ) ) ( ON ?auto_199245 ?auto_199241 ) ( ON ?auto_199244 ?auto_199245 ) ( CLEAR ?auto_199240 ) ( ON ?auto_199242 ?auto_199244 ) ( CLEAR ?auto_199242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199238 ?auto_199239 ?auto_199243 ?auto_199241 ?auto_199245 ?auto_199244 )
      ( MAKE-2PILE ?auto_199238 ?auto_199239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199246 - BLOCK
      ?auto_199247 - BLOCK
    )
    :vars
    (
      ?auto_199253 - BLOCK
      ?auto_199251 - BLOCK
      ?auto_199248 - BLOCK
      ?auto_199249 - BLOCK
      ?auto_199250 - BLOCK
      ?auto_199252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199253 ?auto_199247 ) ( ON-TABLE ?auto_199246 ) ( ON ?auto_199247 ?auto_199246 ) ( not ( = ?auto_199246 ?auto_199247 ) ) ( not ( = ?auto_199246 ?auto_199253 ) ) ( not ( = ?auto_199247 ?auto_199253 ) ) ( not ( = ?auto_199246 ?auto_199251 ) ) ( not ( = ?auto_199246 ?auto_199248 ) ) ( not ( = ?auto_199247 ?auto_199251 ) ) ( not ( = ?auto_199247 ?auto_199248 ) ) ( not ( = ?auto_199253 ?auto_199251 ) ) ( not ( = ?auto_199253 ?auto_199248 ) ) ( not ( = ?auto_199251 ?auto_199248 ) ) ( ON ?auto_199251 ?auto_199253 ) ( not ( = ?auto_199249 ?auto_199250 ) ) ( not ( = ?auto_199249 ?auto_199252 ) ) ( not ( = ?auto_199249 ?auto_199248 ) ) ( not ( = ?auto_199250 ?auto_199252 ) ) ( not ( = ?auto_199250 ?auto_199248 ) ) ( not ( = ?auto_199252 ?auto_199248 ) ) ( not ( = ?auto_199246 ?auto_199252 ) ) ( not ( = ?auto_199246 ?auto_199249 ) ) ( not ( = ?auto_199246 ?auto_199250 ) ) ( not ( = ?auto_199247 ?auto_199252 ) ) ( not ( = ?auto_199247 ?auto_199249 ) ) ( not ( = ?auto_199247 ?auto_199250 ) ) ( not ( = ?auto_199253 ?auto_199252 ) ) ( not ( = ?auto_199253 ?auto_199249 ) ) ( not ( = ?auto_199253 ?auto_199250 ) ) ( not ( = ?auto_199251 ?auto_199252 ) ) ( not ( = ?auto_199251 ?auto_199249 ) ) ( not ( = ?auto_199251 ?auto_199250 ) ) ( ON ?auto_199248 ?auto_199251 ) ( ON ?auto_199252 ?auto_199248 ) ( ON ?auto_199250 ?auto_199252 ) ( CLEAR ?auto_199250 ) ( HOLDING ?auto_199249 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199249 )
      ( MAKE-2PILE ?auto_199246 ?auto_199247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199254 - BLOCK
      ?auto_199255 - BLOCK
    )
    :vars
    (
      ?auto_199261 - BLOCK
      ?auto_199258 - BLOCK
      ?auto_199257 - BLOCK
      ?auto_199259 - BLOCK
      ?auto_199260 - BLOCK
      ?auto_199256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199261 ?auto_199255 ) ( ON-TABLE ?auto_199254 ) ( ON ?auto_199255 ?auto_199254 ) ( not ( = ?auto_199254 ?auto_199255 ) ) ( not ( = ?auto_199254 ?auto_199261 ) ) ( not ( = ?auto_199255 ?auto_199261 ) ) ( not ( = ?auto_199254 ?auto_199258 ) ) ( not ( = ?auto_199254 ?auto_199257 ) ) ( not ( = ?auto_199255 ?auto_199258 ) ) ( not ( = ?auto_199255 ?auto_199257 ) ) ( not ( = ?auto_199261 ?auto_199258 ) ) ( not ( = ?auto_199261 ?auto_199257 ) ) ( not ( = ?auto_199258 ?auto_199257 ) ) ( ON ?auto_199258 ?auto_199261 ) ( not ( = ?auto_199259 ?auto_199260 ) ) ( not ( = ?auto_199259 ?auto_199256 ) ) ( not ( = ?auto_199259 ?auto_199257 ) ) ( not ( = ?auto_199260 ?auto_199256 ) ) ( not ( = ?auto_199260 ?auto_199257 ) ) ( not ( = ?auto_199256 ?auto_199257 ) ) ( not ( = ?auto_199254 ?auto_199256 ) ) ( not ( = ?auto_199254 ?auto_199259 ) ) ( not ( = ?auto_199254 ?auto_199260 ) ) ( not ( = ?auto_199255 ?auto_199256 ) ) ( not ( = ?auto_199255 ?auto_199259 ) ) ( not ( = ?auto_199255 ?auto_199260 ) ) ( not ( = ?auto_199261 ?auto_199256 ) ) ( not ( = ?auto_199261 ?auto_199259 ) ) ( not ( = ?auto_199261 ?auto_199260 ) ) ( not ( = ?auto_199258 ?auto_199256 ) ) ( not ( = ?auto_199258 ?auto_199259 ) ) ( not ( = ?auto_199258 ?auto_199260 ) ) ( ON ?auto_199257 ?auto_199258 ) ( ON ?auto_199256 ?auto_199257 ) ( ON ?auto_199260 ?auto_199256 ) ( ON ?auto_199259 ?auto_199260 ) ( CLEAR ?auto_199259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199254 ?auto_199255 ?auto_199261 ?auto_199258 ?auto_199257 ?auto_199256 ?auto_199260 )
      ( MAKE-2PILE ?auto_199254 ?auto_199255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199262 - BLOCK
      ?auto_199263 - BLOCK
    )
    :vars
    (
      ?auto_199265 - BLOCK
      ?auto_199268 - BLOCK
      ?auto_199266 - BLOCK
      ?auto_199264 - BLOCK
      ?auto_199267 - BLOCK
      ?auto_199269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199265 ?auto_199263 ) ( ON-TABLE ?auto_199262 ) ( ON ?auto_199263 ?auto_199262 ) ( not ( = ?auto_199262 ?auto_199263 ) ) ( not ( = ?auto_199262 ?auto_199265 ) ) ( not ( = ?auto_199263 ?auto_199265 ) ) ( not ( = ?auto_199262 ?auto_199268 ) ) ( not ( = ?auto_199262 ?auto_199266 ) ) ( not ( = ?auto_199263 ?auto_199268 ) ) ( not ( = ?auto_199263 ?auto_199266 ) ) ( not ( = ?auto_199265 ?auto_199268 ) ) ( not ( = ?auto_199265 ?auto_199266 ) ) ( not ( = ?auto_199268 ?auto_199266 ) ) ( ON ?auto_199268 ?auto_199265 ) ( not ( = ?auto_199264 ?auto_199267 ) ) ( not ( = ?auto_199264 ?auto_199269 ) ) ( not ( = ?auto_199264 ?auto_199266 ) ) ( not ( = ?auto_199267 ?auto_199269 ) ) ( not ( = ?auto_199267 ?auto_199266 ) ) ( not ( = ?auto_199269 ?auto_199266 ) ) ( not ( = ?auto_199262 ?auto_199269 ) ) ( not ( = ?auto_199262 ?auto_199264 ) ) ( not ( = ?auto_199262 ?auto_199267 ) ) ( not ( = ?auto_199263 ?auto_199269 ) ) ( not ( = ?auto_199263 ?auto_199264 ) ) ( not ( = ?auto_199263 ?auto_199267 ) ) ( not ( = ?auto_199265 ?auto_199269 ) ) ( not ( = ?auto_199265 ?auto_199264 ) ) ( not ( = ?auto_199265 ?auto_199267 ) ) ( not ( = ?auto_199268 ?auto_199269 ) ) ( not ( = ?auto_199268 ?auto_199264 ) ) ( not ( = ?auto_199268 ?auto_199267 ) ) ( ON ?auto_199266 ?auto_199268 ) ( ON ?auto_199269 ?auto_199266 ) ( ON ?auto_199267 ?auto_199269 ) ( HOLDING ?auto_199264 ) ( CLEAR ?auto_199267 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199262 ?auto_199263 ?auto_199265 ?auto_199268 ?auto_199266 ?auto_199269 ?auto_199267 ?auto_199264 )
      ( MAKE-2PILE ?auto_199262 ?auto_199263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199270 - BLOCK
      ?auto_199271 - BLOCK
    )
    :vars
    (
      ?auto_199275 - BLOCK
      ?auto_199274 - BLOCK
      ?auto_199272 - BLOCK
      ?auto_199276 - BLOCK
      ?auto_199277 - BLOCK
      ?auto_199273 - BLOCK
      ?auto_199278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199275 ?auto_199271 ) ( ON-TABLE ?auto_199270 ) ( ON ?auto_199271 ?auto_199270 ) ( not ( = ?auto_199270 ?auto_199271 ) ) ( not ( = ?auto_199270 ?auto_199275 ) ) ( not ( = ?auto_199271 ?auto_199275 ) ) ( not ( = ?auto_199270 ?auto_199274 ) ) ( not ( = ?auto_199270 ?auto_199272 ) ) ( not ( = ?auto_199271 ?auto_199274 ) ) ( not ( = ?auto_199271 ?auto_199272 ) ) ( not ( = ?auto_199275 ?auto_199274 ) ) ( not ( = ?auto_199275 ?auto_199272 ) ) ( not ( = ?auto_199274 ?auto_199272 ) ) ( ON ?auto_199274 ?auto_199275 ) ( not ( = ?auto_199276 ?auto_199277 ) ) ( not ( = ?auto_199276 ?auto_199273 ) ) ( not ( = ?auto_199276 ?auto_199272 ) ) ( not ( = ?auto_199277 ?auto_199273 ) ) ( not ( = ?auto_199277 ?auto_199272 ) ) ( not ( = ?auto_199273 ?auto_199272 ) ) ( not ( = ?auto_199270 ?auto_199273 ) ) ( not ( = ?auto_199270 ?auto_199276 ) ) ( not ( = ?auto_199270 ?auto_199277 ) ) ( not ( = ?auto_199271 ?auto_199273 ) ) ( not ( = ?auto_199271 ?auto_199276 ) ) ( not ( = ?auto_199271 ?auto_199277 ) ) ( not ( = ?auto_199275 ?auto_199273 ) ) ( not ( = ?auto_199275 ?auto_199276 ) ) ( not ( = ?auto_199275 ?auto_199277 ) ) ( not ( = ?auto_199274 ?auto_199273 ) ) ( not ( = ?auto_199274 ?auto_199276 ) ) ( not ( = ?auto_199274 ?auto_199277 ) ) ( ON ?auto_199272 ?auto_199274 ) ( ON ?auto_199273 ?auto_199272 ) ( ON ?auto_199277 ?auto_199273 ) ( CLEAR ?auto_199277 ) ( ON ?auto_199276 ?auto_199278 ) ( CLEAR ?auto_199276 ) ( HAND-EMPTY ) ( not ( = ?auto_199270 ?auto_199278 ) ) ( not ( = ?auto_199271 ?auto_199278 ) ) ( not ( = ?auto_199275 ?auto_199278 ) ) ( not ( = ?auto_199274 ?auto_199278 ) ) ( not ( = ?auto_199272 ?auto_199278 ) ) ( not ( = ?auto_199276 ?auto_199278 ) ) ( not ( = ?auto_199277 ?auto_199278 ) ) ( not ( = ?auto_199273 ?auto_199278 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199276 ?auto_199278 )
      ( MAKE-2PILE ?auto_199270 ?auto_199271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199279 - BLOCK
      ?auto_199280 - BLOCK
    )
    :vars
    (
      ?auto_199286 - BLOCK
      ?auto_199284 - BLOCK
      ?auto_199287 - BLOCK
      ?auto_199283 - BLOCK
      ?auto_199285 - BLOCK
      ?auto_199281 - BLOCK
      ?auto_199282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199286 ?auto_199280 ) ( ON-TABLE ?auto_199279 ) ( ON ?auto_199280 ?auto_199279 ) ( not ( = ?auto_199279 ?auto_199280 ) ) ( not ( = ?auto_199279 ?auto_199286 ) ) ( not ( = ?auto_199280 ?auto_199286 ) ) ( not ( = ?auto_199279 ?auto_199284 ) ) ( not ( = ?auto_199279 ?auto_199287 ) ) ( not ( = ?auto_199280 ?auto_199284 ) ) ( not ( = ?auto_199280 ?auto_199287 ) ) ( not ( = ?auto_199286 ?auto_199284 ) ) ( not ( = ?auto_199286 ?auto_199287 ) ) ( not ( = ?auto_199284 ?auto_199287 ) ) ( ON ?auto_199284 ?auto_199286 ) ( not ( = ?auto_199283 ?auto_199285 ) ) ( not ( = ?auto_199283 ?auto_199281 ) ) ( not ( = ?auto_199283 ?auto_199287 ) ) ( not ( = ?auto_199285 ?auto_199281 ) ) ( not ( = ?auto_199285 ?auto_199287 ) ) ( not ( = ?auto_199281 ?auto_199287 ) ) ( not ( = ?auto_199279 ?auto_199281 ) ) ( not ( = ?auto_199279 ?auto_199283 ) ) ( not ( = ?auto_199279 ?auto_199285 ) ) ( not ( = ?auto_199280 ?auto_199281 ) ) ( not ( = ?auto_199280 ?auto_199283 ) ) ( not ( = ?auto_199280 ?auto_199285 ) ) ( not ( = ?auto_199286 ?auto_199281 ) ) ( not ( = ?auto_199286 ?auto_199283 ) ) ( not ( = ?auto_199286 ?auto_199285 ) ) ( not ( = ?auto_199284 ?auto_199281 ) ) ( not ( = ?auto_199284 ?auto_199283 ) ) ( not ( = ?auto_199284 ?auto_199285 ) ) ( ON ?auto_199287 ?auto_199284 ) ( ON ?auto_199281 ?auto_199287 ) ( ON ?auto_199283 ?auto_199282 ) ( CLEAR ?auto_199283 ) ( not ( = ?auto_199279 ?auto_199282 ) ) ( not ( = ?auto_199280 ?auto_199282 ) ) ( not ( = ?auto_199286 ?auto_199282 ) ) ( not ( = ?auto_199284 ?auto_199282 ) ) ( not ( = ?auto_199287 ?auto_199282 ) ) ( not ( = ?auto_199283 ?auto_199282 ) ) ( not ( = ?auto_199285 ?auto_199282 ) ) ( not ( = ?auto_199281 ?auto_199282 ) ) ( HOLDING ?auto_199285 ) ( CLEAR ?auto_199281 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199279 ?auto_199280 ?auto_199286 ?auto_199284 ?auto_199287 ?auto_199281 ?auto_199285 )
      ( MAKE-2PILE ?auto_199279 ?auto_199280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199288 - BLOCK
      ?auto_199289 - BLOCK
    )
    :vars
    (
      ?auto_199291 - BLOCK
      ?auto_199290 - BLOCK
      ?auto_199294 - BLOCK
      ?auto_199292 - BLOCK
      ?auto_199295 - BLOCK
      ?auto_199293 - BLOCK
      ?auto_199296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199291 ?auto_199289 ) ( ON-TABLE ?auto_199288 ) ( ON ?auto_199289 ?auto_199288 ) ( not ( = ?auto_199288 ?auto_199289 ) ) ( not ( = ?auto_199288 ?auto_199291 ) ) ( not ( = ?auto_199289 ?auto_199291 ) ) ( not ( = ?auto_199288 ?auto_199290 ) ) ( not ( = ?auto_199288 ?auto_199294 ) ) ( not ( = ?auto_199289 ?auto_199290 ) ) ( not ( = ?auto_199289 ?auto_199294 ) ) ( not ( = ?auto_199291 ?auto_199290 ) ) ( not ( = ?auto_199291 ?auto_199294 ) ) ( not ( = ?auto_199290 ?auto_199294 ) ) ( ON ?auto_199290 ?auto_199291 ) ( not ( = ?auto_199292 ?auto_199295 ) ) ( not ( = ?auto_199292 ?auto_199293 ) ) ( not ( = ?auto_199292 ?auto_199294 ) ) ( not ( = ?auto_199295 ?auto_199293 ) ) ( not ( = ?auto_199295 ?auto_199294 ) ) ( not ( = ?auto_199293 ?auto_199294 ) ) ( not ( = ?auto_199288 ?auto_199293 ) ) ( not ( = ?auto_199288 ?auto_199292 ) ) ( not ( = ?auto_199288 ?auto_199295 ) ) ( not ( = ?auto_199289 ?auto_199293 ) ) ( not ( = ?auto_199289 ?auto_199292 ) ) ( not ( = ?auto_199289 ?auto_199295 ) ) ( not ( = ?auto_199291 ?auto_199293 ) ) ( not ( = ?auto_199291 ?auto_199292 ) ) ( not ( = ?auto_199291 ?auto_199295 ) ) ( not ( = ?auto_199290 ?auto_199293 ) ) ( not ( = ?auto_199290 ?auto_199292 ) ) ( not ( = ?auto_199290 ?auto_199295 ) ) ( ON ?auto_199294 ?auto_199290 ) ( ON ?auto_199293 ?auto_199294 ) ( ON ?auto_199292 ?auto_199296 ) ( not ( = ?auto_199288 ?auto_199296 ) ) ( not ( = ?auto_199289 ?auto_199296 ) ) ( not ( = ?auto_199291 ?auto_199296 ) ) ( not ( = ?auto_199290 ?auto_199296 ) ) ( not ( = ?auto_199294 ?auto_199296 ) ) ( not ( = ?auto_199292 ?auto_199296 ) ) ( not ( = ?auto_199295 ?auto_199296 ) ) ( not ( = ?auto_199293 ?auto_199296 ) ) ( CLEAR ?auto_199293 ) ( ON ?auto_199295 ?auto_199292 ) ( CLEAR ?auto_199295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199296 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199296 ?auto_199292 )
      ( MAKE-2PILE ?auto_199288 ?auto_199289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199297 - BLOCK
      ?auto_199298 - BLOCK
    )
    :vars
    (
      ?auto_199304 - BLOCK
      ?auto_199300 - BLOCK
      ?auto_199301 - BLOCK
      ?auto_199299 - BLOCK
      ?auto_199302 - BLOCK
      ?auto_199303 - BLOCK
      ?auto_199305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199304 ?auto_199298 ) ( ON-TABLE ?auto_199297 ) ( ON ?auto_199298 ?auto_199297 ) ( not ( = ?auto_199297 ?auto_199298 ) ) ( not ( = ?auto_199297 ?auto_199304 ) ) ( not ( = ?auto_199298 ?auto_199304 ) ) ( not ( = ?auto_199297 ?auto_199300 ) ) ( not ( = ?auto_199297 ?auto_199301 ) ) ( not ( = ?auto_199298 ?auto_199300 ) ) ( not ( = ?auto_199298 ?auto_199301 ) ) ( not ( = ?auto_199304 ?auto_199300 ) ) ( not ( = ?auto_199304 ?auto_199301 ) ) ( not ( = ?auto_199300 ?auto_199301 ) ) ( ON ?auto_199300 ?auto_199304 ) ( not ( = ?auto_199299 ?auto_199302 ) ) ( not ( = ?auto_199299 ?auto_199303 ) ) ( not ( = ?auto_199299 ?auto_199301 ) ) ( not ( = ?auto_199302 ?auto_199303 ) ) ( not ( = ?auto_199302 ?auto_199301 ) ) ( not ( = ?auto_199303 ?auto_199301 ) ) ( not ( = ?auto_199297 ?auto_199303 ) ) ( not ( = ?auto_199297 ?auto_199299 ) ) ( not ( = ?auto_199297 ?auto_199302 ) ) ( not ( = ?auto_199298 ?auto_199303 ) ) ( not ( = ?auto_199298 ?auto_199299 ) ) ( not ( = ?auto_199298 ?auto_199302 ) ) ( not ( = ?auto_199304 ?auto_199303 ) ) ( not ( = ?auto_199304 ?auto_199299 ) ) ( not ( = ?auto_199304 ?auto_199302 ) ) ( not ( = ?auto_199300 ?auto_199303 ) ) ( not ( = ?auto_199300 ?auto_199299 ) ) ( not ( = ?auto_199300 ?auto_199302 ) ) ( ON ?auto_199301 ?auto_199300 ) ( ON ?auto_199299 ?auto_199305 ) ( not ( = ?auto_199297 ?auto_199305 ) ) ( not ( = ?auto_199298 ?auto_199305 ) ) ( not ( = ?auto_199304 ?auto_199305 ) ) ( not ( = ?auto_199300 ?auto_199305 ) ) ( not ( = ?auto_199301 ?auto_199305 ) ) ( not ( = ?auto_199299 ?auto_199305 ) ) ( not ( = ?auto_199302 ?auto_199305 ) ) ( not ( = ?auto_199303 ?auto_199305 ) ) ( ON ?auto_199302 ?auto_199299 ) ( CLEAR ?auto_199302 ) ( ON-TABLE ?auto_199305 ) ( HOLDING ?auto_199303 ) ( CLEAR ?auto_199301 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199297 ?auto_199298 ?auto_199304 ?auto_199300 ?auto_199301 ?auto_199303 )
      ( MAKE-2PILE ?auto_199297 ?auto_199298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199306 - BLOCK
      ?auto_199307 - BLOCK
    )
    :vars
    (
      ?auto_199310 - BLOCK
      ?auto_199314 - BLOCK
      ?auto_199313 - BLOCK
      ?auto_199312 - BLOCK
      ?auto_199308 - BLOCK
      ?auto_199309 - BLOCK
      ?auto_199311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199310 ?auto_199307 ) ( ON-TABLE ?auto_199306 ) ( ON ?auto_199307 ?auto_199306 ) ( not ( = ?auto_199306 ?auto_199307 ) ) ( not ( = ?auto_199306 ?auto_199310 ) ) ( not ( = ?auto_199307 ?auto_199310 ) ) ( not ( = ?auto_199306 ?auto_199314 ) ) ( not ( = ?auto_199306 ?auto_199313 ) ) ( not ( = ?auto_199307 ?auto_199314 ) ) ( not ( = ?auto_199307 ?auto_199313 ) ) ( not ( = ?auto_199310 ?auto_199314 ) ) ( not ( = ?auto_199310 ?auto_199313 ) ) ( not ( = ?auto_199314 ?auto_199313 ) ) ( ON ?auto_199314 ?auto_199310 ) ( not ( = ?auto_199312 ?auto_199308 ) ) ( not ( = ?auto_199312 ?auto_199309 ) ) ( not ( = ?auto_199312 ?auto_199313 ) ) ( not ( = ?auto_199308 ?auto_199309 ) ) ( not ( = ?auto_199308 ?auto_199313 ) ) ( not ( = ?auto_199309 ?auto_199313 ) ) ( not ( = ?auto_199306 ?auto_199309 ) ) ( not ( = ?auto_199306 ?auto_199312 ) ) ( not ( = ?auto_199306 ?auto_199308 ) ) ( not ( = ?auto_199307 ?auto_199309 ) ) ( not ( = ?auto_199307 ?auto_199312 ) ) ( not ( = ?auto_199307 ?auto_199308 ) ) ( not ( = ?auto_199310 ?auto_199309 ) ) ( not ( = ?auto_199310 ?auto_199312 ) ) ( not ( = ?auto_199310 ?auto_199308 ) ) ( not ( = ?auto_199314 ?auto_199309 ) ) ( not ( = ?auto_199314 ?auto_199312 ) ) ( not ( = ?auto_199314 ?auto_199308 ) ) ( ON ?auto_199313 ?auto_199314 ) ( ON ?auto_199312 ?auto_199311 ) ( not ( = ?auto_199306 ?auto_199311 ) ) ( not ( = ?auto_199307 ?auto_199311 ) ) ( not ( = ?auto_199310 ?auto_199311 ) ) ( not ( = ?auto_199314 ?auto_199311 ) ) ( not ( = ?auto_199313 ?auto_199311 ) ) ( not ( = ?auto_199312 ?auto_199311 ) ) ( not ( = ?auto_199308 ?auto_199311 ) ) ( not ( = ?auto_199309 ?auto_199311 ) ) ( ON ?auto_199308 ?auto_199312 ) ( ON-TABLE ?auto_199311 ) ( CLEAR ?auto_199313 ) ( ON ?auto_199309 ?auto_199308 ) ( CLEAR ?auto_199309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199311 ?auto_199312 ?auto_199308 )
      ( MAKE-2PILE ?auto_199306 ?auto_199307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199315 - BLOCK
      ?auto_199316 - BLOCK
    )
    :vars
    (
      ?auto_199320 - BLOCK
      ?auto_199321 - BLOCK
      ?auto_199318 - BLOCK
      ?auto_199319 - BLOCK
      ?auto_199323 - BLOCK
      ?auto_199317 - BLOCK
      ?auto_199322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199320 ?auto_199316 ) ( ON-TABLE ?auto_199315 ) ( ON ?auto_199316 ?auto_199315 ) ( not ( = ?auto_199315 ?auto_199316 ) ) ( not ( = ?auto_199315 ?auto_199320 ) ) ( not ( = ?auto_199316 ?auto_199320 ) ) ( not ( = ?auto_199315 ?auto_199321 ) ) ( not ( = ?auto_199315 ?auto_199318 ) ) ( not ( = ?auto_199316 ?auto_199321 ) ) ( not ( = ?auto_199316 ?auto_199318 ) ) ( not ( = ?auto_199320 ?auto_199321 ) ) ( not ( = ?auto_199320 ?auto_199318 ) ) ( not ( = ?auto_199321 ?auto_199318 ) ) ( ON ?auto_199321 ?auto_199320 ) ( not ( = ?auto_199319 ?auto_199323 ) ) ( not ( = ?auto_199319 ?auto_199317 ) ) ( not ( = ?auto_199319 ?auto_199318 ) ) ( not ( = ?auto_199323 ?auto_199317 ) ) ( not ( = ?auto_199323 ?auto_199318 ) ) ( not ( = ?auto_199317 ?auto_199318 ) ) ( not ( = ?auto_199315 ?auto_199317 ) ) ( not ( = ?auto_199315 ?auto_199319 ) ) ( not ( = ?auto_199315 ?auto_199323 ) ) ( not ( = ?auto_199316 ?auto_199317 ) ) ( not ( = ?auto_199316 ?auto_199319 ) ) ( not ( = ?auto_199316 ?auto_199323 ) ) ( not ( = ?auto_199320 ?auto_199317 ) ) ( not ( = ?auto_199320 ?auto_199319 ) ) ( not ( = ?auto_199320 ?auto_199323 ) ) ( not ( = ?auto_199321 ?auto_199317 ) ) ( not ( = ?auto_199321 ?auto_199319 ) ) ( not ( = ?auto_199321 ?auto_199323 ) ) ( ON ?auto_199319 ?auto_199322 ) ( not ( = ?auto_199315 ?auto_199322 ) ) ( not ( = ?auto_199316 ?auto_199322 ) ) ( not ( = ?auto_199320 ?auto_199322 ) ) ( not ( = ?auto_199321 ?auto_199322 ) ) ( not ( = ?auto_199318 ?auto_199322 ) ) ( not ( = ?auto_199319 ?auto_199322 ) ) ( not ( = ?auto_199323 ?auto_199322 ) ) ( not ( = ?auto_199317 ?auto_199322 ) ) ( ON ?auto_199323 ?auto_199319 ) ( ON-TABLE ?auto_199322 ) ( ON ?auto_199317 ?auto_199323 ) ( CLEAR ?auto_199317 ) ( HOLDING ?auto_199318 ) ( CLEAR ?auto_199321 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199315 ?auto_199316 ?auto_199320 ?auto_199321 ?auto_199318 )
      ( MAKE-2PILE ?auto_199315 ?auto_199316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199324 - BLOCK
      ?auto_199325 - BLOCK
    )
    :vars
    (
      ?auto_199329 - BLOCK
      ?auto_199332 - BLOCK
      ?auto_199330 - BLOCK
      ?auto_199328 - BLOCK
      ?auto_199331 - BLOCK
      ?auto_199326 - BLOCK
      ?auto_199327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199329 ?auto_199325 ) ( ON-TABLE ?auto_199324 ) ( ON ?auto_199325 ?auto_199324 ) ( not ( = ?auto_199324 ?auto_199325 ) ) ( not ( = ?auto_199324 ?auto_199329 ) ) ( not ( = ?auto_199325 ?auto_199329 ) ) ( not ( = ?auto_199324 ?auto_199332 ) ) ( not ( = ?auto_199324 ?auto_199330 ) ) ( not ( = ?auto_199325 ?auto_199332 ) ) ( not ( = ?auto_199325 ?auto_199330 ) ) ( not ( = ?auto_199329 ?auto_199332 ) ) ( not ( = ?auto_199329 ?auto_199330 ) ) ( not ( = ?auto_199332 ?auto_199330 ) ) ( ON ?auto_199332 ?auto_199329 ) ( not ( = ?auto_199328 ?auto_199331 ) ) ( not ( = ?auto_199328 ?auto_199326 ) ) ( not ( = ?auto_199328 ?auto_199330 ) ) ( not ( = ?auto_199331 ?auto_199326 ) ) ( not ( = ?auto_199331 ?auto_199330 ) ) ( not ( = ?auto_199326 ?auto_199330 ) ) ( not ( = ?auto_199324 ?auto_199326 ) ) ( not ( = ?auto_199324 ?auto_199328 ) ) ( not ( = ?auto_199324 ?auto_199331 ) ) ( not ( = ?auto_199325 ?auto_199326 ) ) ( not ( = ?auto_199325 ?auto_199328 ) ) ( not ( = ?auto_199325 ?auto_199331 ) ) ( not ( = ?auto_199329 ?auto_199326 ) ) ( not ( = ?auto_199329 ?auto_199328 ) ) ( not ( = ?auto_199329 ?auto_199331 ) ) ( not ( = ?auto_199332 ?auto_199326 ) ) ( not ( = ?auto_199332 ?auto_199328 ) ) ( not ( = ?auto_199332 ?auto_199331 ) ) ( ON ?auto_199328 ?auto_199327 ) ( not ( = ?auto_199324 ?auto_199327 ) ) ( not ( = ?auto_199325 ?auto_199327 ) ) ( not ( = ?auto_199329 ?auto_199327 ) ) ( not ( = ?auto_199332 ?auto_199327 ) ) ( not ( = ?auto_199330 ?auto_199327 ) ) ( not ( = ?auto_199328 ?auto_199327 ) ) ( not ( = ?auto_199331 ?auto_199327 ) ) ( not ( = ?auto_199326 ?auto_199327 ) ) ( ON ?auto_199331 ?auto_199328 ) ( ON-TABLE ?auto_199327 ) ( ON ?auto_199326 ?auto_199331 ) ( CLEAR ?auto_199332 ) ( ON ?auto_199330 ?auto_199326 ) ( CLEAR ?auto_199330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199327 ?auto_199328 ?auto_199331 ?auto_199326 )
      ( MAKE-2PILE ?auto_199324 ?auto_199325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199333 - BLOCK
      ?auto_199334 - BLOCK
    )
    :vars
    (
      ?auto_199340 - BLOCK
      ?auto_199335 - BLOCK
      ?auto_199341 - BLOCK
      ?auto_199339 - BLOCK
      ?auto_199338 - BLOCK
      ?auto_199336 - BLOCK
      ?auto_199337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199340 ?auto_199334 ) ( ON-TABLE ?auto_199333 ) ( ON ?auto_199334 ?auto_199333 ) ( not ( = ?auto_199333 ?auto_199334 ) ) ( not ( = ?auto_199333 ?auto_199340 ) ) ( not ( = ?auto_199334 ?auto_199340 ) ) ( not ( = ?auto_199333 ?auto_199335 ) ) ( not ( = ?auto_199333 ?auto_199341 ) ) ( not ( = ?auto_199334 ?auto_199335 ) ) ( not ( = ?auto_199334 ?auto_199341 ) ) ( not ( = ?auto_199340 ?auto_199335 ) ) ( not ( = ?auto_199340 ?auto_199341 ) ) ( not ( = ?auto_199335 ?auto_199341 ) ) ( not ( = ?auto_199339 ?auto_199338 ) ) ( not ( = ?auto_199339 ?auto_199336 ) ) ( not ( = ?auto_199339 ?auto_199341 ) ) ( not ( = ?auto_199338 ?auto_199336 ) ) ( not ( = ?auto_199338 ?auto_199341 ) ) ( not ( = ?auto_199336 ?auto_199341 ) ) ( not ( = ?auto_199333 ?auto_199336 ) ) ( not ( = ?auto_199333 ?auto_199339 ) ) ( not ( = ?auto_199333 ?auto_199338 ) ) ( not ( = ?auto_199334 ?auto_199336 ) ) ( not ( = ?auto_199334 ?auto_199339 ) ) ( not ( = ?auto_199334 ?auto_199338 ) ) ( not ( = ?auto_199340 ?auto_199336 ) ) ( not ( = ?auto_199340 ?auto_199339 ) ) ( not ( = ?auto_199340 ?auto_199338 ) ) ( not ( = ?auto_199335 ?auto_199336 ) ) ( not ( = ?auto_199335 ?auto_199339 ) ) ( not ( = ?auto_199335 ?auto_199338 ) ) ( ON ?auto_199339 ?auto_199337 ) ( not ( = ?auto_199333 ?auto_199337 ) ) ( not ( = ?auto_199334 ?auto_199337 ) ) ( not ( = ?auto_199340 ?auto_199337 ) ) ( not ( = ?auto_199335 ?auto_199337 ) ) ( not ( = ?auto_199341 ?auto_199337 ) ) ( not ( = ?auto_199339 ?auto_199337 ) ) ( not ( = ?auto_199338 ?auto_199337 ) ) ( not ( = ?auto_199336 ?auto_199337 ) ) ( ON ?auto_199338 ?auto_199339 ) ( ON-TABLE ?auto_199337 ) ( ON ?auto_199336 ?auto_199338 ) ( ON ?auto_199341 ?auto_199336 ) ( CLEAR ?auto_199341 ) ( HOLDING ?auto_199335 ) ( CLEAR ?auto_199340 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199333 ?auto_199334 ?auto_199340 ?auto_199335 )
      ( MAKE-2PILE ?auto_199333 ?auto_199334 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199342 - BLOCK
      ?auto_199343 - BLOCK
    )
    :vars
    (
      ?auto_199347 - BLOCK
      ?auto_199345 - BLOCK
      ?auto_199350 - BLOCK
      ?auto_199349 - BLOCK
      ?auto_199346 - BLOCK
      ?auto_199344 - BLOCK
      ?auto_199348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199347 ?auto_199343 ) ( ON-TABLE ?auto_199342 ) ( ON ?auto_199343 ?auto_199342 ) ( not ( = ?auto_199342 ?auto_199343 ) ) ( not ( = ?auto_199342 ?auto_199347 ) ) ( not ( = ?auto_199343 ?auto_199347 ) ) ( not ( = ?auto_199342 ?auto_199345 ) ) ( not ( = ?auto_199342 ?auto_199350 ) ) ( not ( = ?auto_199343 ?auto_199345 ) ) ( not ( = ?auto_199343 ?auto_199350 ) ) ( not ( = ?auto_199347 ?auto_199345 ) ) ( not ( = ?auto_199347 ?auto_199350 ) ) ( not ( = ?auto_199345 ?auto_199350 ) ) ( not ( = ?auto_199349 ?auto_199346 ) ) ( not ( = ?auto_199349 ?auto_199344 ) ) ( not ( = ?auto_199349 ?auto_199350 ) ) ( not ( = ?auto_199346 ?auto_199344 ) ) ( not ( = ?auto_199346 ?auto_199350 ) ) ( not ( = ?auto_199344 ?auto_199350 ) ) ( not ( = ?auto_199342 ?auto_199344 ) ) ( not ( = ?auto_199342 ?auto_199349 ) ) ( not ( = ?auto_199342 ?auto_199346 ) ) ( not ( = ?auto_199343 ?auto_199344 ) ) ( not ( = ?auto_199343 ?auto_199349 ) ) ( not ( = ?auto_199343 ?auto_199346 ) ) ( not ( = ?auto_199347 ?auto_199344 ) ) ( not ( = ?auto_199347 ?auto_199349 ) ) ( not ( = ?auto_199347 ?auto_199346 ) ) ( not ( = ?auto_199345 ?auto_199344 ) ) ( not ( = ?auto_199345 ?auto_199349 ) ) ( not ( = ?auto_199345 ?auto_199346 ) ) ( ON ?auto_199349 ?auto_199348 ) ( not ( = ?auto_199342 ?auto_199348 ) ) ( not ( = ?auto_199343 ?auto_199348 ) ) ( not ( = ?auto_199347 ?auto_199348 ) ) ( not ( = ?auto_199345 ?auto_199348 ) ) ( not ( = ?auto_199350 ?auto_199348 ) ) ( not ( = ?auto_199349 ?auto_199348 ) ) ( not ( = ?auto_199346 ?auto_199348 ) ) ( not ( = ?auto_199344 ?auto_199348 ) ) ( ON ?auto_199346 ?auto_199349 ) ( ON-TABLE ?auto_199348 ) ( ON ?auto_199344 ?auto_199346 ) ( ON ?auto_199350 ?auto_199344 ) ( CLEAR ?auto_199347 ) ( ON ?auto_199345 ?auto_199350 ) ( CLEAR ?auto_199345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199348 ?auto_199349 ?auto_199346 ?auto_199344 ?auto_199350 )
      ( MAKE-2PILE ?auto_199342 ?auto_199343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199369 - BLOCK
      ?auto_199370 - BLOCK
    )
    :vars
    (
      ?auto_199371 - BLOCK
      ?auto_199377 - BLOCK
      ?auto_199373 - BLOCK
      ?auto_199375 - BLOCK
      ?auto_199372 - BLOCK
      ?auto_199374 - BLOCK
      ?auto_199376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199369 ) ( not ( = ?auto_199369 ?auto_199370 ) ) ( not ( = ?auto_199369 ?auto_199371 ) ) ( not ( = ?auto_199370 ?auto_199371 ) ) ( not ( = ?auto_199369 ?auto_199377 ) ) ( not ( = ?auto_199369 ?auto_199373 ) ) ( not ( = ?auto_199370 ?auto_199377 ) ) ( not ( = ?auto_199370 ?auto_199373 ) ) ( not ( = ?auto_199371 ?auto_199377 ) ) ( not ( = ?auto_199371 ?auto_199373 ) ) ( not ( = ?auto_199377 ?auto_199373 ) ) ( not ( = ?auto_199375 ?auto_199372 ) ) ( not ( = ?auto_199375 ?auto_199374 ) ) ( not ( = ?auto_199375 ?auto_199373 ) ) ( not ( = ?auto_199372 ?auto_199374 ) ) ( not ( = ?auto_199372 ?auto_199373 ) ) ( not ( = ?auto_199374 ?auto_199373 ) ) ( not ( = ?auto_199369 ?auto_199374 ) ) ( not ( = ?auto_199369 ?auto_199375 ) ) ( not ( = ?auto_199369 ?auto_199372 ) ) ( not ( = ?auto_199370 ?auto_199374 ) ) ( not ( = ?auto_199370 ?auto_199375 ) ) ( not ( = ?auto_199370 ?auto_199372 ) ) ( not ( = ?auto_199371 ?auto_199374 ) ) ( not ( = ?auto_199371 ?auto_199375 ) ) ( not ( = ?auto_199371 ?auto_199372 ) ) ( not ( = ?auto_199377 ?auto_199374 ) ) ( not ( = ?auto_199377 ?auto_199375 ) ) ( not ( = ?auto_199377 ?auto_199372 ) ) ( ON ?auto_199375 ?auto_199376 ) ( not ( = ?auto_199369 ?auto_199376 ) ) ( not ( = ?auto_199370 ?auto_199376 ) ) ( not ( = ?auto_199371 ?auto_199376 ) ) ( not ( = ?auto_199377 ?auto_199376 ) ) ( not ( = ?auto_199373 ?auto_199376 ) ) ( not ( = ?auto_199375 ?auto_199376 ) ) ( not ( = ?auto_199372 ?auto_199376 ) ) ( not ( = ?auto_199374 ?auto_199376 ) ) ( ON ?auto_199372 ?auto_199375 ) ( ON-TABLE ?auto_199376 ) ( ON ?auto_199374 ?auto_199372 ) ( ON ?auto_199373 ?auto_199374 ) ( ON ?auto_199377 ?auto_199373 ) ( ON ?auto_199371 ?auto_199377 ) ( CLEAR ?auto_199371 ) ( HOLDING ?auto_199370 ) ( CLEAR ?auto_199369 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199369 ?auto_199370 ?auto_199371 )
      ( MAKE-2PILE ?auto_199369 ?auto_199370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199378 - BLOCK
      ?auto_199379 - BLOCK
    )
    :vars
    (
      ?auto_199384 - BLOCK
      ?auto_199386 - BLOCK
      ?auto_199385 - BLOCK
      ?auto_199381 - BLOCK
      ?auto_199382 - BLOCK
      ?auto_199380 - BLOCK
      ?auto_199383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199378 ) ( not ( = ?auto_199378 ?auto_199379 ) ) ( not ( = ?auto_199378 ?auto_199384 ) ) ( not ( = ?auto_199379 ?auto_199384 ) ) ( not ( = ?auto_199378 ?auto_199386 ) ) ( not ( = ?auto_199378 ?auto_199385 ) ) ( not ( = ?auto_199379 ?auto_199386 ) ) ( not ( = ?auto_199379 ?auto_199385 ) ) ( not ( = ?auto_199384 ?auto_199386 ) ) ( not ( = ?auto_199384 ?auto_199385 ) ) ( not ( = ?auto_199386 ?auto_199385 ) ) ( not ( = ?auto_199381 ?auto_199382 ) ) ( not ( = ?auto_199381 ?auto_199380 ) ) ( not ( = ?auto_199381 ?auto_199385 ) ) ( not ( = ?auto_199382 ?auto_199380 ) ) ( not ( = ?auto_199382 ?auto_199385 ) ) ( not ( = ?auto_199380 ?auto_199385 ) ) ( not ( = ?auto_199378 ?auto_199380 ) ) ( not ( = ?auto_199378 ?auto_199381 ) ) ( not ( = ?auto_199378 ?auto_199382 ) ) ( not ( = ?auto_199379 ?auto_199380 ) ) ( not ( = ?auto_199379 ?auto_199381 ) ) ( not ( = ?auto_199379 ?auto_199382 ) ) ( not ( = ?auto_199384 ?auto_199380 ) ) ( not ( = ?auto_199384 ?auto_199381 ) ) ( not ( = ?auto_199384 ?auto_199382 ) ) ( not ( = ?auto_199386 ?auto_199380 ) ) ( not ( = ?auto_199386 ?auto_199381 ) ) ( not ( = ?auto_199386 ?auto_199382 ) ) ( ON ?auto_199381 ?auto_199383 ) ( not ( = ?auto_199378 ?auto_199383 ) ) ( not ( = ?auto_199379 ?auto_199383 ) ) ( not ( = ?auto_199384 ?auto_199383 ) ) ( not ( = ?auto_199386 ?auto_199383 ) ) ( not ( = ?auto_199385 ?auto_199383 ) ) ( not ( = ?auto_199381 ?auto_199383 ) ) ( not ( = ?auto_199382 ?auto_199383 ) ) ( not ( = ?auto_199380 ?auto_199383 ) ) ( ON ?auto_199382 ?auto_199381 ) ( ON-TABLE ?auto_199383 ) ( ON ?auto_199380 ?auto_199382 ) ( ON ?auto_199385 ?auto_199380 ) ( ON ?auto_199386 ?auto_199385 ) ( ON ?auto_199384 ?auto_199386 ) ( CLEAR ?auto_199378 ) ( ON ?auto_199379 ?auto_199384 ) ( CLEAR ?auto_199379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199383 ?auto_199381 ?auto_199382 ?auto_199380 ?auto_199385 ?auto_199386 ?auto_199384 )
      ( MAKE-2PILE ?auto_199378 ?auto_199379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199387 - BLOCK
      ?auto_199388 - BLOCK
    )
    :vars
    (
      ?auto_199395 - BLOCK
      ?auto_199393 - BLOCK
      ?auto_199394 - BLOCK
      ?auto_199391 - BLOCK
      ?auto_199389 - BLOCK
      ?auto_199392 - BLOCK
      ?auto_199390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199387 ?auto_199388 ) ) ( not ( = ?auto_199387 ?auto_199395 ) ) ( not ( = ?auto_199388 ?auto_199395 ) ) ( not ( = ?auto_199387 ?auto_199393 ) ) ( not ( = ?auto_199387 ?auto_199394 ) ) ( not ( = ?auto_199388 ?auto_199393 ) ) ( not ( = ?auto_199388 ?auto_199394 ) ) ( not ( = ?auto_199395 ?auto_199393 ) ) ( not ( = ?auto_199395 ?auto_199394 ) ) ( not ( = ?auto_199393 ?auto_199394 ) ) ( not ( = ?auto_199391 ?auto_199389 ) ) ( not ( = ?auto_199391 ?auto_199392 ) ) ( not ( = ?auto_199391 ?auto_199394 ) ) ( not ( = ?auto_199389 ?auto_199392 ) ) ( not ( = ?auto_199389 ?auto_199394 ) ) ( not ( = ?auto_199392 ?auto_199394 ) ) ( not ( = ?auto_199387 ?auto_199392 ) ) ( not ( = ?auto_199387 ?auto_199391 ) ) ( not ( = ?auto_199387 ?auto_199389 ) ) ( not ( = ?auto_199388 ?auto_199392 ) ) ( not ( = ?auto_199388 ?auto_199391 ) ) ( not ( = ?auto_199388 ?auto_199389 ) ) ( not ( = ?auto_199395 ?auto_199392 ) ) ( not ( = ?auto_199395 ?auto_199391 ) ) ( not ( = ?auto_199395 ?auto_199389 ) ) ( not ( = ?auto_199393 ?auto_199392 ) ) ( not ( = ?auto_199393 ?auto_199391 ) ) ( not ( = ?auto_199393 ?auto_199389 ) ) ( ON ?auto_199391 ?auto_199390 ) ( not ( = ?auto_199387 ?auto_199390 ) ) ( not ( = ?auto_199388 ?auto_199390 ) ) ( not ( = ?auto_199395 ?auto_199390 ) ) ( not ( = ?auto_199393 ?auto_199390 ) ) ( not ( = ?auto_199394 ?auto_199390 ) ) ( not ( = ?auto_199391 ?auto_199390 ) ) ( not ( = ?auto_199389 ?auto_199390 ) ) ( not ( = ?auto_199392 ?auto_199390 ) ) ( ON ?auto_199389 ?auto_199391 ) ( ON-TABLE ?auto_199390 ) ( ON ?auto_199392 ?auto_199389 ) ( ON ?auto_199394 ?auto_199392 ) ( ON ?auto_199393 ?auto_199394 ) ( ON ?auto_199395 ?auto_199393 ) ( ON ?auto_199388 ?auto_199395 ) ( CLEAR ?auto_199388 ) ( HOLDING ?auto_199387 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199387 )
      ( MAKE-2PILE ?auto_199387 ?auto_199388 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_199396 - BLOCK
      ?auto_199397 - BLOCK
    )
    :vars
    (
      ?auto_199400 - BLOCK
      ?auto_199404 - BLOCK
      ?auto_199403 - BLOCK
      ?auto_199398 - BLOCK
      ?auto_199402 - BLOCK
      ?auto_199399 - BLOCK
      ?auto_199401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199396 ?auto_199397 ) ) ( not ( = ?auto_199396 ?auto_199400 ) ) ( not ( = ?auto_199397 ?auto_199400 ) ) ( not ( = ?auto_199396 ?auto_199404 ) ) ( not ( = ?auto_199396 ?auto_199403 ) ) ( not ( = ?auto_199397 ?auto_199404 ) ) ( not ( = ?auto_199397 ?auto_199403 ) ) ( not ( = ?auto_199400 ?auto_199404 ) ) ( not ( = ?auto_199400 ?auto_199403 ) ) ( not ( = ?auto_199404 ?auto_199403 ) ) ( not ( = ?auto_199398 ?auto_199402 ) ) ( not ( = ?auto_199398 ?auto_199399 ) ) ( not ( = ?auto_199398 ?auto_199403 ) ) ( not ( = ?auto_199402 ?auto_199399 ) ) ( not ( = ?auto_199402 ?auto_199403 ) ) ( not ( = ?auto_199399 ?auto_199403 ) ) ( not ( = ?auto_199396 ?auto_199399 ) ) ( not ( = ?auto_199396 ?auto_199398 ) ) ( not ( = ?auto_199396 ?auto_199402 ) ) ( not ( = ?auto_199397 ?auto_199399 ) ) ( not ( = ?auto_199397 ?auto_199398 ) ) ( not ( = ?auto_199397 ?auto_199402 ) ) ( not ( = ?auto_199400 ?auto_199399 ) ) ( not ( = ?auto_199400 ?auto_199398 ) ) ( not ( = ?auto_199400 ?auto_199402 ) ) ( not ( = ?auto_199404 ?auto_199399 ) ) ( not ( = ?auto_199404 ?auto_199398 ) ) ( not ( = ?auto_199404 ?auto_199402 ) ) ( ON ?auto_199398 ?auto_199401 ) ( not ( = ?auto_199396 ?auto_199401 ) ) ( not ( = ?auto_199397 ?auto_199401 ) ) ( not ( = ?auto_199400 ?auto_199401 ) ) ( not ( = ?auto_199404 ?auto_199401 ) ) ( not ( = ?auto_199403 ?auto_199401 ) ) ( not ( = ?auto_199398 ?auto_199401 ) ) ( not ( = ?auto_199402 ?auto_199401 ) ) ( not ( = ?auto_199399 ?auto_199401 ) ) ( ON ?auto_199402 ?auto_199398 ) ( ON-TABLE ?auto_199401 ) ( ON ?auto_199399 ?auto_199402 ) ( ON ?auto_199403 ?auto_199399 ) ( ON ?auto_199404 ?auto_199403 ) ( ON ?auto_199400 ?auto_199404 ) ( ON ?auto_199397 ?auto_199400 ) ( ON ?auto_199396 ?auto_199397 ) ( CLEAR ?auto_199396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199401 ?auto_199398 ?auto_199402 ?auto_199399 ?auto_199403 ?auto_199404 ?auto_199400 ?auto_199397 )
      ( MAKE-2PILE ?auto_199396 ?auto_199397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199411 - BLOCK
      ?auto_199412 - BLOCK
      ?auto_199413 - BLOCK
      ?auto_199414 - BLOCK
      ?auto_199415 - BLOCK
      ?auto_199416 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_199416 ) ( CLEAR ?auto_199415 ) ( ON-TABLE ?auto_199411 ) ( ON ?auto_199412 ?auto_199411 ) ( ON ?auto_199413 ?auto_199412 ) ( ON ?auto_199414 ?auto_199413 ) ( ON ?auto_199415 ?auto_199414 ) ( not ( = ?auto_199411 ?auto_199412 ) ) ( not ( = ?auto_199411 ?auto_199413 ) ) ( not ( = ?auto_199411 ?auto_199414 ) ) ( not ( = ?auto_199411 ?auto_199415 ) ) ( not ( = ?auto_199411 ?auto_199416 ) ) ( not ( = ?auto_199412 ?auto_199413 ) ) ( not ( = ?auto_199412 ?auto_199414 ) ) ( not ( = ?auto_199412 ?auto_199415 ) ) ( not ( = ?auto_199412 ?auto_199416 ) ) ( not ( = ?auto_199413 ?auto_199414 ) ) ( not ( = ?auto_199413 ?auto_199415 ) ) ( not ( = ?auto_199413 ?auto_199416 ) ) ( not ( = ?auto_199414 ?auto_199415 ) ) ( not ( = ?auto_199414 ?auto_199416 ) ) ( not ( = ?auto_199415 ?auto_199416 ) ) )
    :subtasks
    ( ( !STACK ?auto_199416 ?auto_199415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199417 - BLOCK
      ?auto_199418 - BLOCK
      ?auto_199419 - BLOCK
      ?auto_199420 - BLOCK
      ?auto_199421 - BLOCK
      ?auto_199422 - BLOCK
    )
    :vars
    (
      ?auto_199423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199421 ) ( ON-TABLE ?auto_199417 ) ( ON ?auto_199418 ?auto_199417 ) ( ON ?auto_199419 ?auto_199418 ) ( ON ?auto_199420 ?auto_199419 ) ( ON ?auto_199421 ?auto_199420 ) ( not ( = ?auto_199417 ?auto_199418 ) ) ( not ( = ?auto_199417 ?auto_199419 ) ) ( not ( = ?auto_199417 ?auto_199420 ) ) ( not ( = ?auto_199417 ?auto_199421 ) ) ( not ( = ?auto_199417 ?auto_199422 ) ) ( not ( = ?auto_199418 ?auto_199419 ) ) ( not ( = ?auto_199418 ?auto_199420 ) ) ( not ( = ?auto_199418 ?auto_199421 ) ) ( not ( = ?auto_199418 ?auto_199422 ) ) ( not ( = ?auto_199419 ?auto_199420 ) ) ( not ( = ?auto_199419 ?auto_199421 ) ) ( not ( = ?auto_199419 ?auto_199422 ) ) ( not ( = ?auto_199420 ?auto_199421 ) ) ( not ( = ?auto_199420 ?auto_199422 ) ) ( not ( = ?auto_199421 ?auto_199422 ) ) ( ON ?auto_199422 ?auto_199423 ) ( CLEAR ?auto_199422 ) ( HAND-EMPTY ) ( not ( = ?auto_199417 ?auto_199423 ) ) ( not ( = ?auto_199418 ?auto_199423 ) ) ( not ( = ?auto_199419 ?auto_199423 ) ) ( not ( = ?auto_199420 ?auto_199423 ) ) ( not ( = ?auto_199421 ?auto_199423 ) ) ( not ( = ?auto_199422 ?auto_199423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199422 ?auto_199423 )
      ( MAKE-6PILE ?auto_199417 ?auto_199418 ?auto_199419 ?auto_199420 ?auto_199421 ?auto_199422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199424 - BLOCK
      ?auto_199425 - BLOCK
      ?auto_199426 - BLOCK
      ?auto_199427 - BLOCK
      ?auto_199428 - BLOCK
      ?auto_199429 - BLOCK
    )
    :vars
    (
      ?auto_199430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199424 ) ( ON ?auto_199425 ?auto_199424 ) ( ON ?auto_199426 ?auto_199425 ) ( ON ?auto_199427 ?auto_199426 ) ( not ( = ?auto_199424 ?auto_199425 ) ) ( not ( = ?auto_199424 ?auto_199426 ) ) ( not ( = ?auto_199424 ?auto_199427 ) ) ( not ( = ?auto_199424 ?auto_199428 ) ) ( not ( = ?auto_199424 ?auto_199429 ) ) ( not ( = ?auto_199425 ?auto_199426 ) ) ( not ( = ?auto_199425 ?auto_199427 ) ) ( not ( = ?auto_199425 ?auto_199428 ) ) ( not ( = ?auto_199425 ?auto_199429 ) ) ( not ( = ?auto_199426 ?auto_199427 ) ) ( not ( = ?auto_199426 ?auto_199428 ) ) ( not ( = ?auto_199426 ?auto_199429 ) ) ( not ( = ?auto_199427 ?auto_199428 ) ) ( not ( = ?auto_199427 ?auto_199429 ) ) ( not ( = ?auto_199428 ?auto_199429 ) ) ( ON ?auto_199429 ?auto_199430 ) ( CLEAR ?auto_199429 ) ( not ( = ?auto_199424 ?auto_199430 ) ) ( not ( = ?auto_199425 ?auto_199430 ) ) ( not ( = ?auto_199426 ?auto_199430 ) ) ( not ( = ?auto_199427 ?auto_199430 ) ) ( not ( = ?auto_199428 ?auto_199430 ) ) ( not ( = ?auto_199429 ?auto_199430 ) ) ( HOLDING ?auto_199428 ) ( CLEAR ?auto_199427 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199424 ?auto_199425 ?auto_199426 ?auto_199427 ?auto_199428 )
      ( MAKE-6PILE ?auto_199424 ?auto_199425 ?auto_199426 ?auto_199427 ?auto_199428 ?auto_199429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199431 - BLOCK
      ?auto_199432 - BLOCK
      ?auto_199433 - BLOCK
      ?auto_199434 - BLOCK
      ?auto_199435 - BLOCK
      ?auto_199436 - BLOCK
    )
    :vars
    (
      ?auto_199437 - BLOCK
      ?auto_199438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199431 ) ( ON ?auto_199432 ?auto_199431 ) ( ON ?auto_199433 ?auto_199432 ) ( ON ?auto_199434 ?auto_199433 ) ( not ( = ?auto_199431 ?auto_199432 ) ) ( not ( = ?auto_199431 ?auto_199433 ) ) ( not ( = ?auto_199431 ?auto_199434 ) ) ( not ( = ?auto_199431 ?auto_199435 ) ) ( not ( = ?auto_199431 ?auto_199436 ) ) ( not ( = ?auto_199432 ?auto_199433 ) ) ( not ( = ?auto_199432 ?auto_199434 ) ) ( not ( = ?auto_199432 ?auto_199435 ) ) ( not ( = ?auto_199432 ?auto_199436 ) ) ( not ( = ?auto_199433 ?auto_199434 ) ) ( not ( = ?auto_199433 ?auto_199435 ) ) ( not ( = ?auto_199433 ?auto_199436 ) ) ( not ( = ?auto_199434 ?auto_199435 ) ) ( not ( = ?auto_199434 ?auto_199436 ) ) ( not ( = ?auto_199435 ?auto_199436 ) ) ( ON ?auto_199436 ?auto_199437 ) ( not ( = ?auto_199431 ?auto_199437 ) ) ( not ( = ?auto_199432 ?auto_199437 ) ) ( not ( = ?auto_199433 ?auto_199437 ) ) ( not ( = ?auto_199434 ?auto_199437 ) ) ( not ( = ?auto_199435 ?auto_199437 ) ) ( not ( = ?auto_199436 ?auto_199437 ) ) ( CLEAR ?auto_199434 ) ( ON ?auto_199435 ?auto_199436 ) ( CLEAR ?auto_199435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199438 ) ( ON ?auto_199437 ?auto_199438 ) ( not ( = ?auto_199438 ?auto_199437 ) ) ( not ( = ?auto_199438 ?auto_199436 ) ) ( not ( = ?auto_199438 ?auto_199435 ) ) ( not ( = ?auto_199431 ?auto_199438 ) ) ( not ( = ?auto_199432 ?auto_199438 ) ) ( not ( = ?auto_199433 ?auto_199438 ) ) ( not ( = ?auto_199434 ?auto_199438 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199438 ?auto_199437 ?auto_199436 )
      ( MAKE-6PILE ?auto_199431 ?auto_199432 ?auto_199433 ?auto_199434 ?auto_199435 ?auto_199436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199439 - BLOCK
      ?auto_199440 - BLOCK
      ?auto_199441 - BLOCK
      ?auto_199442 - BLOCK
      ?auto_199443 - BLOCK
      ?auto_199444 - BLOCK
    )
    :vars
    (
      ?auto_199446 - BLOCK
      ?auto_199445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199439 ) ( ON ?auto_199440 ?auto_199439 ) ( ON ?auto_199441 ?auto_199440 ) ( not ( = ?auto_199439 ?auto_199440 ) ) ( not ( = ?auto_199439 ?auto_199441 ) ) ( not ( = ?auto_199439 ?auto_199442 ) ) ( not ( = ?auto_199439 ?auto_199443 ) ) ( not ( = ?auto_199439 ?auto_199444 ) ) ( not ( = ?auto_199440 ?auto_199441 ) ) ( not ( = ?auto_199440 ?auto_199442 ) ) ( not ( = ?auto_199440 ?auto_199443 ) ) ( not ( = ?auto_199440 ?auto_199444 ) ) ( not ( = ?auto_199441 ?auto_199442 ) ) ( not ( = ?auto_199441 ?auto_199443 ) ) ( not ( = ?auto_199441 ?auto_199444 ) ) ( not ( = ?auto_199442 ?auto_199443 ) ) ( not ( = ?auto_199442 ?auto_199444 ) ) ( not ( = ?auto_199443 ?auto_199444 ) ) ( ON ?auto_199444 ?auto_199446 ) ( not ( = ?auto_199439 ?auto_199446 ) ) ( not ( = ?auto_199440 ?auto_199446 ) ) ( not ( = ?auto_199441 ?auto_199446 ) ) ( not ( = ?auto_199442 ?auto_199446 ) ) ( not ( = ?auto_199443 ?auto_199446 ) ) ( not ( = ?auto_199444 ?auto_199446 ) ) ( ON ?auto_199443 ?auto_199444 ) ( CLEAR ?auto_199443 ) ( ON-TABLE ?auto_199445 ) ( ON ?auto_199446 ?auto_199445 ) ( not ( = ?auto_199445 ?auto_199446 ) ) ( not ( = ?auto_199445 ?auto_199444 ) ) ( not ( = ?auto_199445 ?auto_199443 ) ) ( not ( = ?auto_199439 ?auto_199445 ) ) ( not ( = ?auto_199440 ?auto_199445 ) ) ( not ( = ?auto_199441 ?auto_199445 ) ) ( not ( = ?auto_199442 ?auto_199445 ) ) ( HOLDING ?auto_199442 ) ( CLEAR ?auto_199441 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199439 ?auto_199440 ?auto_199441 ?auto_199442 )
      ( MAKE-6PILE ?auto_199439 ?auto_199440 ?auto_199441 ?auto_199442 ?auto_199443 ?auto_199444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199447 - BLOCK
      ?auto_199448 - BLOCK
      ?auto_199449 - BLOCK
      ?auto_199450 - BLOCK
      ?auto_199451 - BLOCK
      ?auto_199452 - BLOCK
    )
    :vars
    (
      ?auto_199454 - BLOCK
      ?auto_199453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199447 ) ( ON ?auto_199448 ?auto_199447 ) ( ON ?auto_199449 ?auto_199448 ) ( not ( = ?auto_199447 ?auto_199448 ) ) ( not ( = ?auto_199447 ?auto_199449 ) ) ( not ( = ?auto_199447 ?auto_199450 ) ) ( not ( = ?auto_199447 ?auto_199451 ) ) ( not ( = ?auto_199447 ?auto_199452 ) ) ( not ( = ?auto_199448 ?auto_199449 ) ) ( not ( = ?auto_199448 ?auto_199450 ) ) ( not ( = ?auto_199448 ?auto_199451 ) ) ( not ( = ?auto_199448 ?auto_199452 ) ) ( not ( = ?auto_199449 ?auto_199450 ) ) ( not ( = ?auto_199449 ?auto_199451 ) ) ( not ( = ?auto_199449 ?auto_199452 ) ) ( not ( = ?auto_199450 ?auto_199451 ) ) ( not ( = ?auto_199450 ?auto_199452 ) ) ( not ( = ?auto_199451 ?auto_199452 ) ) ( ON ?auto_199452 ?auto_199454 ) ( not ( = ?auto_199447 ?auto_199454 ) ) ( not ( = ?auto_199448 ?auto_199454 ) ) ( not ( = ?auto_199449 ?auto_199454 ) ) ( not ( = ?auto_199450 ?auto_199454 ) ) ( not ( = ?auto_199451 ?auto_199454 ) ) ( not ( = ?auto_199452 ?auto_199454 ) ) ( ON ?auto_199451 ?auto_199452 ) ( ON-TABLE ?auto_199453 ) ( ON ?auto_199454 ?auto_199453 ) ( not ( = ?auto_199453 ?auto_199454 ) ) ( not ( = ?auto_199453 ?auto_199452 ) ) ( not ( = ?auto_199453 ?auto_199451 ) ) ( not ( = ?auto_199447 ?auto_199453 ) ) ( not ( = ?auto_199448 ?auto_199453 ) ) ( not ( = ?auto_199449 ?auto_199453 ) ) ( not ( = ?auto_199450 ?auto_199453 ) ) ( CLEAR ?auto_199449 ) ( ON ?auto_199450 ?auto_199451 ) ( CLEAR ?auto_199450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199453 ?auto_199454 ?auto_199452 ?auto_199451 )
      ( MAKE-6PILE ?auto_199447 ?auto_199448 ?auto_199449 ?auto_199450 ?auto_199451 ?auto_199452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199455 - BLOCK
      ?auto_199456 - BLOCK
      ?auto_199457 - BLOCK
      ?auto_199458 - BLOCK
      ?auto_199459 - BLOCK
      ?auto_199460 - BLOCK
    )
    :vars
    (
      ?auto_199462 - BLOCK
      ?auto_199461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199455 ) ( ON ?auto_199456 ?auto_199455 ) ( not ( = ?auto_199455 ?auto_199456 ) ) ( not ( = ?auto_199455 ?auto_199457 ) ) ( not ( = ?auto_199455 ?auto_199458 ) ) ( not ( = ?auto_199455 ?auto_199459 ) ) ( not ( = ?auto_199455 ?auto_199460 ) ) ( not ( = ?auto_199456 ?auto_199457 ) ) ( not ( = ?auto_199456 ?auto_199458 ) ) ( not ( = ?auto_199456 ?auto_199459 ) ) ( not ( = ?auto_199456 ?auto_199460 ) ) ( not ( = ?auto_199457 ?auto_199458 ) ) ( not ( = ?auto_199457 ?auto_199459 ) ) ( not ( = ?auto_199457 ?auto_199460 ) ) ( not ( = ?auto_199458 ?auto_199459 ) ) ( not ( = ?auto_199458 ?auto_199460 ) ) ( not ( = ?auto_199459 ?auto_199460 ) ) ( ON ?auto_199460 ?auto_199462 ) ( not ( = ?auto_199455 ?auto_199462 ) ) ( not ( = ?auto_199456 ?auto_199462 ) ) ( not ( = ?auto_199457 ?auto_199462 ) ) ( not ( = ?auto_199458 ?auto_199462 ) ) ( not ( = ?auto_199459 ?auto_199462 ) ) ( not ( = ?auto_199460 ?auto_199462 ) ) ( ON ?auto_199459 ?auto_199460 ) ( ON-TABLE ?auto_199461 ) ( ON ?auto_199462 ?auto_199461 ) ( not ( = ?auto_199461 ?auto_199462 ) ) ( not ( = ?auto_199461 ?auto_199460 ) ) ( not ( = ?auto_199461 ?auto_199459 ) ) ( not ( = ?auto_199455 ?auto_199461 ) ) ( not ( = ?auto_199456 ?auto_199461 ) ) ( not ( = ?auto_199457 ?auto_199461 ) ) ( not ( = ?auto_199458 ?auto_199461 ) ) ( ON ?auto_199458 ?auto_199459 ) ( CLEAR ?auto_199458 ) ( HOLDING ?auto_199457 ) ( CLEAR ?auto_199456 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199455 ?auto_199456 ?auto_199457 )
      ( MAKE-6PILE ?auto_199455 ?auto_199456 ?auto_199457 ?auto_199458 ?auto_199459 ?auto_199460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199463 - BLOCK
      ?auto_199464 - BLOCK
      ?auto_199465 - BLOCK
      ?auto_199466 - BLOCK
      ?auto_199467 - BLOCK
      ?auto_199468 - BLOCK
    )
    :vars
    (
      ?auto_199470 - BLOCK
      ?auto_199469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199463 ) ( ON ?auto_199464 ?auto_199463 ) ( not ( = ?auto_199463 ?auto_199464 ) ) ( not ( = ?auto_199463 ?auto_199465 ) ) ( not ( = ?auto_199463 ?auto_199466 ) ) ( not ( = ?auto_199463 ?auto_199467 ) ) ( not ( = ?auto_199463 ?auto_199468 ) ) ( not ( = ?auto_199464 ?auto_199465 ) ) ( not ( = ?auto_199464 ?auto_199466 ) ) ( not ( = ?auto_199464 ?auto_199467 ) ) ( not ( = ?auto_199464 ?auto_199468 ) ) ( not ( = ?auto_199465 ?auto_199466 ) ) ( not ( = ?auto_199465 ?auto_199467 ) ) ( not ( = ?auto_199465 ?auto_199468 ) ) ( not ( = ?auto_199466 ?auto_199467 ) ) ( not ( = ?auto_199466 ?auto_199468 ) ) ( not ( = ?auto_199467 ?auto_199468 ) ) ( ON ?auto_199468 ?auto_199470 ) ( not ( = ?auto_199463 ?auto_199470 ) ) ( not ( = ?auto_199464 ?auto_199470 ) ) ( not ( = ?auto_199465 ?auto_199470 ) ) ( not ( = ?auto_199466 ?auto_199470 ) ) ( not ( = ?auto_199467 ?auto_199470 ) ) ( not ( = ?auto_199468 ?auto_199470 ) ) ( ON ?auto_199467 ?auto_199468 ) ( ON-TABLE ?auto_199469 ) ( ON ?auto_199470 ?auto_199469 ) ( not ( = ?auto_199469 ?auto_199470 ) ) ( not ( = ?auto_199469 ?auto_199468 ) ) ( not ( = ?auto_199469 ?auto_199467 ) ) ( not ( = ?auto_199463 ?auto_199469 ) ) ( not ( = ?auto_199464 ?auto_199469 ) ) ( not ( = ?auto_199465 ?auto_199469 ) ) ( not ( = ?auto_199466 ?auto_199469 ) ) ( ON ?auto_199466 ?auto_199467 ) ( CLEAR ?auto_199464 ) ( ON ?auto_199465 ?auto_199466 ) ( CLEAR ?auto_199465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199469 ?auto_199470 ?auto_199468 ?auto_199467 ?auto_199466 )
      ( MAKE-6PILE ?auto_199463 ?auto_199464 ?auto_199465 ?auto_199466 ?auto_199467 ?auto_199468 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199471 - BLOCK
      ?auto_199472 - BLOCK
      ?auto_199473 - BLOCK
      ?auto_199474 - BLOCK
      ?auto_199475 - BLOCK
      ?auto_199476 - BLOCK
    )
    :vars
    (
      ?auto_199478 - BLOCK
      ?auto_199477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199471 ) ( not ( = ?auto_199471 ?auto_199472 ) ) ( not ( = ?auto_199471 ?auto_199473 ) ) ( not ( = ?auto_199471 ?auto_199474 ) ) ( not ( = ?auto_199471 ?auto_199475 ) ) ( not ( = ?auto_199471 ?auto_199476 ) ) ( not ( = ?auto_199472 ?auto_199473 ) ) ( not ( = ?auto_199472 ?auto_199474 ) ) ( not ( = ?auto_199472 ?auto_199475 ) ) ( not ( = ?auto_199472 ?auto_199476 ) ) ( not ( = ?auto_199473 ?auto_199474 ) ) ( not ( = ?auto_199473 ?auto_199475 ) ) ( not ( = ?auto_199473 ?auto_199476 ) ) ( not ( = ?auto_199474 ?auto_199475 ) ) ( not ( = ?auto_199474 ?auto_199476 ) ) ( not ( = ?auto_199475 ?auto_199476 ) ) ( ON ?auto_199476 ?auto_199478 ) ( not ( = ?auto_199471 ?auto_199478 ) ) ( not ( = ?auto_199472 ?auto_199478 ) ) ( not ( = ?auto_199473 ?auto_199478 ) ) ( not ( = ?auto_199474 ?auto_199478 ) ) ( not ( = ?auto_199475 ?auto_199478 ) ) ( not ( = ?auto_199476 ?auto_199478 ) ) ( ON ?auto_199475 ?auto_199476 ) ( ON-TABLE ?auto_199477 ) ( ON ?auto_199478 ?auto_199477 ) ( not ( = ?auto_199477 ?auto_199478 ) ) ( not ( = ?auto_199477 ?auto_199476 ) ) ( not ( = ?auto_199477 ?auto_199475 ) ) ( not ( = ?auto_199471 ?auto_199477 ) ) ( not ( = ?auto_199472 ?auto_199477 ) ) ( not ( = ?auto_199473 ?auto_199477 ) ) ( not ( = ?auto_199474 ?auto_199477 ) ) ( ON ?auto_199474 ?auto_199475 ) ( ON ?auto_199473 ?auto_199474 ) ( CLEAR ?auto_199473 ) ( HOLDING ?auto_199472 ) ( CLEAR ?auto_199471 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199471 ?auto_199472 )
      ( MAKE-6PILE ?auto_199471 ?auto_199472 ?auto_199473 ?auto_199474 ?auto_199475 ?auto_199476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199479 - BLOCK
      ?auto_199480 - BLOCK
      ?auto_199481 - BLOCK
      ?auto_199482 - BLOCK
      ?auto_199483 - BLOCK
      ?auto_199484 - BLOCK
    )
    :vars
    (
      ?auto_199486 - BLOCK
      ?auto_199485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199479 ) ( not ( = ?auto_199479 ?auto_199480 ) ) ( not ( = ?auto_199479 ?auto_199481 ) ) ( not ( = ?auto_199479 ?auto_199482 ) ) ( not ( = ?auto_199479 ?auto_199483 ) ) ( not ( = ?auto_199479 ?auto_199484 ) ) ( not ( = ?auto_199480 ?auto_199481 ) ) ( not ( = ?auto_199480 ?auto_199482 ) ) ( not ( = ?auto_199480 ?auto_199483 ) ) ( not ( = ?auto_199480 ?auto_199484 ) ) ( not ( = ?auto_199481 ?auto_199482 ) ) ( not ( = ?auto_199481 ?auto_199483 ) ) ( not ( = ?auto_199481 ?auto_199484 ) ) ( not ( = ?auto_199482 ?auto_199483 ) ) ( not ( = ?auto_199482 ?auto_199484 ) ) ( not ( = ?auto_199483 ?auto_199484 ) ) ( ON ?auto_199484 ?auto_199486 ) ( not ( = ?auto_199479 ?auto_199486 ) ) ( not ( = ?auto_199480 ?auto_199486 ) ) ( not ( = ?auto_199481 ?auto_199486 ) ) ( not ( = ?auto_199482 ?auto_199486 ) ) ( not ( = ?auto_199483 ?auto_199486 ) ) ( not ( = ?auto_199484 ?auto_199486 ) ) ( ON ?auto_199483 ?auto_199484 ) ( ON-TABLE ?auto_199485 ) ( ON ?auto_199486 ?auto_199485 ) ( not ( = ?auto_199485 ?auto_199486 ) ) ( not ( = ?auto_199485 ?auto_199484 ) ) ( not ( = ?auto_199485 ?auto_199483 ) ) ( not ( = ?auto_199479 ?auto_199485 ) ) ( not ( = ?auto_199480 ?auto_199485 ) ) ( not ( = ?auto_199481 ?auto_199485 ) ) ( not ( = ?auto_199482 ?auto_199485 ) ) ( ON ?auto_199482 ?auto_199483 ) ( ON ?auto_199481 ?auto_199482 ) ( CLEAR ?auto_199479 ) ( ON ?auto_199480 ?auto_199481 ) ( CLEAR ?auto_199480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199485 ?auto_199486 ?auto_199484 ?auto_199483 ?auto_199482 ?auto_199481 )
      ( MAKE-6PILE ?auto_199479 ?auto_199480 ?auto_199481 ?auto_199482 ?auto_199483 ?auto_199484 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199487 - BLOCK
      ?auto_199488 - BLOCK
      ?auto_199489 - BLOCK
      ?auto_199490 - BLOCK
      ?auto_199491 - BLOCK
      ?auto_199492 - BLOCK
    )
    :vars
    (
      ?auto_199494 - BLOCK
      ?auto_199493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199487 ?auto_199488 ) ) ( not ( = ?auto_199487 ?auto_199489 ) ) ( not ( = ?auto_199487 ?auto_199490 ) ) ( not ( = ?auto_199487 ?auto_199491 ) ) ( not ( = ?auto_199487 ?auto_199492 ) ) ( not ( = ?auto_199488 ?auto_199489 ) ) ( not ( = ?auto_199488 ?auto_199490 ) ) ( not ( = ?auto_199488 ?auto_199491 ) ) ( not ( = ?auto_199488 ?auto_199492 ) ) ( not ( = ?auto_199489 ?auto_199490 ) ) ( not ( = ?auto_199489 ?auto_199491 ) ) ( not ( = ?auto_199489 ?auto_199492 ) ) ( not ( = ?auto_199490 ?auto_199491 ) ) ( not ( = ?auto_199490 ?auto_199492 ) ) ( not ( = ?auto_199491 ?auto_199492 ) ) ( ON ?auto_199492 ?auto_199494 ) ( not ( = ?auto_199487 ?auto_199494 ) ) ( not ( = ?auto_199488 ?auto_199494 ) ) ( not ( = ?auto_199489 ?auto_199494 ) ) ( not ( = ?auto_199490 ?auto_199494 ) ) ( not ( = ?auto_199491 ?auto_199494 ) ) ( not ( = ?auto_199492 ?auto_199494 ) ) ( ON ?auto_199491 ?auto_199492 ) ( ON-TABLE ?auto_199493 ) ( ON ?auto_199494 ?auto_199493 ) ( not ( = ?auto_199493 ?auto_199494 ) ) ( not ( = ?auto_199493 ?auto_199492 ) ) ( not ( = ?auto_199493 ?auto_199491 ) ) ( not ( = ?auto_199487 ?auto_199493 ) ) ( not ( = ?auto_199488 ?auto_199493 ) ) ( not ( = ?auto_199489 ?auto_199493 ) ) ( not ( = ?auto_199490 ?auto_199493 ) ) ( ON ?auto_199490 ?auto_199491 ) ( ON ?auto_199489 ?auto_199490 ) ( ON ?auto_199488 ?auto_199489 ) ( CLEAR ?auto_199488 ) ( HOLDING ?auto_199487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199487 )
      ( MAKE-6PILE ?auto_199487 ?auto_199488 ?auto_199489 ?auto_199490 ?auto_199491 ?auto_199492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199495 - BLOCK
      ?auto_199496 - BLOCK
      ?auto_199497 - BLOCK
      ?auto_199498 - BLOCK
      ?auto_199499 - BLOCK
      ?auto_199500 - BLOCK
    )
    :vars
    (
      ?auto_199502 - BLOCK
      ?auto_199501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199495 ?auto_199496 ) ) ( not ( = ?auto_199495 ?auto_199497 ) ) ( not ( = ?auto_199495 ?auto_199498 ) ) ( not ( = ?auto_199495 ?auto_199499 ) ) ( not ( = ?auto_199495 ?auto_199500 ) ) ( not ( = ?auto_199496 ?auto_199497 ) ) ( not ( = ?auto_199496 ?auto_199498 ) ) ( not ( = ?auto_199496 ?auto_199499 ) ) ( not ( = ?auto_199496 ?auto_199500 ) ) ( not ( = ?auto_199497 ?auto_199498 ) ) ( not ( = ?auto_199497 ?auto_199499 ) ) ( not ( = ?auto_199497 ?auto_199500 ) ) ( not ( = ?auto_199498 ?auto_199499 ) ) ( not ( = ?auto_199498 ?auto_199500 ) ) ( not ( = ?auto_199499 ?auto_199500 ) ) ( ON ?auto_199500 ?auto_199502 ) ( not ( = ?auto_199495 ?auto_199502 ) ) ( not ( = ?auto_199496 ?auto_199502 ) ) ( not ( = ?auto_199497 ?auto_199502 ) ) ( not ( = ?auto_199498 ?auto_199502 ) ) ( not ( = ?auto_199499 ?auto_199502 ) ) ( not ( = ?auto_199500 ?auto_199502 ) ) ( ON ?auto_199499 ?auto_199500 ) ( ON-TABLE ?auto_199501 ) ( ON ?auto_199502 ?auto_199501 ) ( not ( = ?auto_199501 ?auto_199502 ) ) ( not ( = ?auto_199501 ?auto_199500 ) ) ( not ( = ?auto_199501 ?auto_199499 ) ) ( not ( = ?auto_199495 ?auto_199501 ) ) ( not ( = ?auto_199496 ?auto_199501 ) ) ( not ( = ?auto_199497 ?auto_199501 ) ) ( not ( = ?auto_199498 ?auto_199501 ) ) ( ON ?auto_199498 ?auto_199499 ) ( ON ?auto_199497 ?auto_199498 ) ( ON ?auto_199496 ?auto_199497 ) ( ON ?auto_199495 ?auto_199496 ) ( CLEAR ?auto_199495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199501 ?auto_199502 ?auto_199500 ?auto_199499 ?auto_199498 ?auto_199497 ?auto_199496 )
      ( MAKE-6PILE ?auto_199495 ?auto_199496 ?auto_199497 ?auto_199498 ?auto_199499 ?auto_199500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199503 - BLOCK
      ?auto_199504 - BLOCK
      ?auto_199505 - BLOCK
      ?auto_199506 - BLOCK
      ?auto_199507 - BLOCK
      ?auto_199508 - BLOCK
    )
    :vars
    (
      ?auto_199509 - BLOCK
      ?auto_199510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199503 ?auto_199504 ) ) ( not ( = ?auto_199503 ?auto_199505 ) ) ( not ( = ?auto_199503 ?auto_199506 ) ) ( not ( = ?auto_199503 ?auto_199507 ) ) ( not ( = ?auto_199503 ?auto_199508 ) ) ( not ( = ?auto_199504 ?auto_199505 ) ) ( not ( = ?auto_199504 ?auto_199506 ) ) ( not ( = ?auto_199504 ?auto_199507 ) ) ( not ( = ?auto_199504 ?auto_199508 ) ) ( not ( = ?auto_199505 ?auto_199506 ) ) ( not ( = ?auto_199505 ?auto_199507 ) ) ( not ( = ?auto_199505 ?auto_199508 ) ) ( not ( = ?auto_199506 ?auto_199507 ) ) ( not ( = ?auto_199506 ?auto_199508 ) ) ( not ( = ?auto_199507 ?auto_199508 ) ) ( ON ?auto_199508 ?auto_199509 ) ( not ( = ?auto_199503 ?auto_199509 ) ) ( not ( = ?auto_199504 ?auto_199509 ) ) ( not ( = ?auto_199505 ?auto_199509 ) ) ( not ( = ?auto_199506 ?auto_199509 ) ) ( not ( = ?auto_199507 ?auto_199509 ) ) ( not ( = ?auto_199508 ?auto_199509 ) ) ( ON ?auto_199507 ?auto_199508 ) ( ON-TABLE ?auto_199510 ) ( ON ?auto_199509 ?auto_199510 ) ( not ( = ?auto_199510 ?auto_199509 ) ) ( not ( = ?auto_199510 ?auto_199508 ) ) ( not ( = ?auto_199510 ?auto_199507 ) ) ( not ( = ?auto_199503 ?auto_199510 ) ) ( not ( = ?auto_199504 ?auto_199510 ) ) ( not ( = ?auto_199505 ?auto_199510 ) ) ( not ( = ?auto_199506 ?auto_199510 ) ) ( ON ?auto_199506 ?auto_199507 ) ( ON ?auto_199505 ?auto_199506 ) ( ON ?auto_199504 ?auto_199505 ) ( HOLDING ?auto_199503 ) ( CLEAR ?auto_199504 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199510 ?auto_199509 ?auto_199508 ?auto_199507 ?auto_199506 ?auto_199505 ?auto_199504 ?auto_199503 )
      ( MAKE-6PILE ?auto_199503 ?auto_199504 ?auto_199505 ?auto_199506 ?auto_199507 ?auto_199508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199511 - BLOCK
      ?auto_199512 - BLOCK
      ?auto_199513 - BLOCK
      ?auto_199514 - BLOCK
      ?auto_199515 - BLOCK
      ?auto_199516 - BLOCK
    )
    :vars
    (
      ?auto_199517 - BLOCK
      ?auto_199518 - BLOCK
      ?auto_199519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199511 ?auto_199512 ) ) ( not ( = ?auto_199511 ?auto_199513 ) ) ( not ( = ?auto_199511 ?auto_199514 ) ) ( not ( = ?auto_199511 ?auto_199515 ) ) ( not ( = ?auto_199511 ?auto_199516 ) ) ( not ( = ?auto_199512 ?auto_199513 ) ) ( not ( = ?auto_199512 ?auto_199514 ) ) ( not ( = ?auto_199512 ?auto_199515 ) ) ( not ( = ?auto_199512 ?auto_199516 ) ) ( not ( = ?auto_199513 ?auto_199514 ) ) ( not ( = ?auto_199513 ?auto_199515 ) ) ( not ( = ?auto_199513 ?auto_199516 ) ) ( not ( = ?auto_199514 ?auto_199515 ) ) ( not ( = ?auto_199514 ?auto_199516 ) ) ( not ( = ?auto_199515 ?auto_199516 ) ) ( ON ?auto_199516 ?auto_199517 ) ( not ( = ?auto_199511 ?auto_199517 ) ) ( not ( = ?auto_199512 ?auto_199517 ) ) ( not ( = ?auto_199513 ?auto_199517 ) ) ( not ( = ?auto_199514 ?auto_199517 ) ) ( not ( = ?auto_199515 ?auto_199517 ) ) ( not ( = ?auto_199516 ?auto_199517 ) ) ( ON ?auto_199515 ?auto_199516 ) ( ON-TABLE ?auto_199518 ) ( ON ?auto_199517 ?auto_199518 ) ( not ( = ?auto_199518 ?auto_199517 ) ) ( not ( = ?auto_199518 ?auto_199516 ) ) ( not ( = ?auto_199518 ?auto_199515 ) ) ( not ( = ?auto_199511 ?auto_199518 ) ) ( not ( = ?auto_199512 ?auto_199518 ) ) ( not ( = ?auto_199513 ?auto_199518 ) ) ( not ( = ?auto_199514 ?auto_199518 ) ) ( ON ?auto_199514 ?auto_199515 ) ( ON ?auto_199513 ?auto_199514 ) ( ON ?auto_199512 ?auto_199513 ) ( CLEAR ?auto_199512 ) ( ON ?auto_199511 ?auto_199519 ) ( CLEAR ?auto_199511 ) ( HAND-EMPTY ) ( not ( = ?auto_199511 ?auto_199519 ) ) ( not ( = ?auto_199512 ?auto_199519 ) ) ( not ( = ?auto_199513 ?auto_199519 ) ) ( not ( = ?auto_199514 ?auto_199519 ) ) ( not ( = ?auto_199515 ?auto_199519 ) ) ( not ( = ?auto_199516 ?auto_199519 ) ) ( not ( = ?auto_199517 ?auto_199519 ) ) ( not ( = ?auto_199518 ?auto_199519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199511 ?auto_199519 )
      ( MAKE-6PILE ?auto_199511 ?auto_199512 ?auto_199513 ?auto_199514 ?auto_199515 ?auto_199516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199520 - BLOCK
      ?auto_199521 - BLOCK
      ?auto_199522 - BLOCK
      ?auto_199523 - BLOCK
      ?auto_199524 - BLOCK
      ?auto_199525 - BLOCK
    )
    :vars
    (
      ?auto_199526 - BLOCK
      ?auto_199527 - BLOCK
      ?auto_199528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199520 ?auto_199521 ) ) ( not ( = ?auto_199520 ?auto_199522 ) ) ( not ( = ?auto_199520 ?auto_199523 ) ) ( not ( = ?auto_199520 ?auto_199524 ) ) ( not ( = ?auto_199520 ?auto_199525 ) ) ( not ( = ?auto_199521 ?auto_199522 ) ) ( not ( = ?auto_199521 ?auto_199523 ) ) ( not ( = ?auto_199521 ?auto_199524 ) ) ( not ( = ?auto_199521 ?auto_199525 ) ) ( not ( = ?auto_199522 ?auto_199523 ) ) ( not ( = ?auto_199522 ?auto_199524 ) ) ( not ( = ?auto_199522 ?auto_199525 ) ) ( not ( = ?auto_199523 ?auto_199524 ) ) ( not ( = ?auto_199523 ?auto_199525 ) ) ( not ( = ?auto_199524 ?auto_199525 ) ) ( ON ?auto_199525 ?auto_199526 ) ( not ( = ?auto_199520 ?auto_199526 ) ) ( not ( = ?auto_199521 ?auto_199526 ) ) ( not ( = ?auto_199522 ?auto_199526 ) ) ( not ( = ?auto_199523 ?auto_199526 ) ) ( not ( = ?auto_199524 ?auto_199526 ) ) ( not ( = ?auto_199525 ?auto_199526 ) ) ( ON ?auto_199524 ?auto_199525 ) ( ON-TABLE ?auto_199527 ) ( ON ?auto_199526 ?auto_199527 ) ( not ( = ?auto_199527 ?auto_199526 ) ) ( not ( = ?auto_199527 ?auto_199525 ) ) ( not ( = ?auto_199527 ?auto_199524 ) ) ( not ( = ?auto_199520 ?auto_199527 ) ) ( not ( = ?auto_199521 ?auto_199527 ) ) ( not ( = ?auto_199522 ?auto_199527 ) ) ( not ( = ?auto_199523 ?auto_199527 ) ) ( ON ?auto_199523 ?auto_199524 ) ( ON ?auto_199522 ?auto_199523 ) ( ON ?auto_199520 ?auto_199528 ) ( CLEAR ?auto_199520 ) ( not ( = ?auto_199520 ?auto_199528 ) ) ( not ( = ?auto_199521 ?auto_199528 ) ) ( not ( = ?auto_199522 ?auto_199528 ) ) ( not ( = ?auto_199523 ?auto_199528 ) ) ( not ( = ?auto_199524 ?auto_199528 ) ) ( not ( = ?auto_199525 ?auto_199528 ) ) ( not ( = ?auto_199526 ?auto_199528 ) ) ( not ( = ?auto_199527 ?auto_199528 ) ) ( HOLDING ?auto_199521 ) ( CLEAR ?auto_199522 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199527 ?auto_199526 ?auto_199525 ?auto_199524 ?auto_199523 ?auto_199522 ?auto_199521 )
      ( MAKE-6PILE ?auto_199520 ?auto_199521 ?auto_199522 ?auto_199523 ?auto_199524 ?auto_199525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199529 - BLOCK
      ?auto_199530 - BLOCK
      ?auto_199531 - BLOCK
      ?auto_199532 - BLOCK
      ?auto_199533 - BLOCK
      ?auto_199534 - BLOCK
    )
    :vars
    (
      ?auto_199535 - BLOCK
      ?auto_199536 - BLOCK
      ?auto_199537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199529 ?auto_199530 ) ) ( not ( = ?auto_199529 ?auto_199531 ) ) ( not ( = ?auto_199529 ?auto_199532 ) ) ( not ( = ?auto_199529 ?auto_199533 ) ) ( not ( = ?auto_199529 ?auto_199534 ) ) ( not ( = ?auto_199530 ?auto_199531 ) ) ( not ( = ?auto_199530 ?auto_199532 ) ) ( not ( = ?auto_199530 ?auto_199533 ) ) ( not ( = ?auto_199530 ?auto_199534 ) ) ( not ( = ?auto_199531 ?auto_199532 ) ) ( not ( = ?auto_199531 ?auto_199533 ) ) ( not ( = ?auto_199531 ?auto_199534 ) ) ( not ( = ?auto_199532 ?auto_199533 ) ) ( not ( = ?auto_199532 ?auto_199534 ) ) ( not ( = ?auto_199533 ?auto_199534 ) ) ( ON ?auto_199534 ?auto_199535 ) ( not ( = ?auto_199529 ?auto_199535 ) ) ( not ( = ?auto_199530 ?auto_199535 ) ) ( not ( = ?auto_199531 ?auto_199535 ) ) ( not ( = ?auto_199532 ?auto_199535 ) ) ( not ( = ?auto_199533 ?auto_199535 ) ) ( not ( = ?auto_199534 ?auto_199535 ) ) ( ON ?auto_199533 ?auto_199534 ) ( ON-TABLE ?auto_199536 ) ( ON ?auto_199535 ?auto_199536 ) ( not ( = ?auto_199536 ?auto_199535 ) ) ( not ( = ?auto_199536 ?auto_199534 ) ) ( not ( = ?auto_199536 ?auto_199533 ) ) ( not ( = ?auto_199529 ?auto_199536 ) ) ( not ( = ?auto_199530 ?auto_199536 ) ) ( not ( = ?auto_199531 ?auto_199536 ) ) ( not ( = ?auto_199532 ?auto_199536 ) ) ( ON ?auto_199532 ?auto_199533 ) ( ON ?auto_199531 ?auto_199532 ) ( ON ?auto_199529 ?auto_199537 ) ( not ( = ?auto_199529 ?auto_199537 ) ) ( not ( = ?auto_199530 ?auto_199537 ) ) ( not ( = ?auto_199531 ?auto_199537 ) ) ( not ( = ?auto_199532 ?auto_199537 ) ) ( not ( = ?auto_199533 ?auto_199537 ) ) ( not ( = ?auto_199534 ?auto_199537 ) ) ( not ( = ?auto_199535 ?auto_199537 ) ) ( not ( = ?auto_199536 ?auto_199537 ) ) ( CLEAR ?auto_199531 ) ( ON ?auto_199530 ?auto_199529 ) ( CLEAR ?auto_199530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199537 ?auto_199529 )
      ( MAKE-6PILE ?auto_199529 ?auto_199530 ?auto_199531 ?auto_199532 ?auto_199533 ?auto_199534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199538 - BLOCK
      ?auto_199539 - BLOCK
      ?auto_199540 - BLOCK
      ?auto_199541 - BLOCK
      ?auto_199542 - BLOCK
      ?auto_199543 - BLOCK
    )
    :vars
    (
      ?auto_199544 - BLOCK
      ?auto_199545 - BLOCK
      ?auto_199546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199538 ?auto_199539 ) ) ( not ( = ?auto_199538 ?auto_199540 ) ) ( not ( = ?auto_199538 ?auto_199541 ) ) ( not ( = ?auto_199538 ?auto_199542 ) ) ( not ( = ?auto_199538 ?auto_199543 ) ) ( not ( = ?auto_199539 ?auto_199540 ) ) ( not ( = ?auto_199539 ?auto_199541 ) ) ( not ( = ?auto_199539 ?auto_199542 ) ) ( not ( = ?auto_199539 ?auto_199543 ) ) ( not ( = ?auto_199540 ?auto_199541 ) ) ( not ( = ?auto_199540 ?auto_199542 ) ) ( not ( = ?auto_199540 ?auto_199543 ) ) ( not ( = ?auto_199541 ?auto_199542 ) ) ( not ( = ?auto_199541 ?auto_199543 ) ) ( not ( = ?auto_199542 ?auto_199543 ) ) ( ON ?auto_199543 ?auto_199544 ) ( not ( = ?auto_199538 ?auto_199544 ) ) ( not ( = ?auto_199539 ?auto_199544 ) ) ( not ( = ?auto_199540 ?auto_199544 ) ) ( not ( = ?auto_199541 ?auto_199544 ) ) ( not ( = ?auto_199542 ?auto_199544 ) ) ( not ( = ?auto_199543 ?auto_199544 ) ) ( ON ?auto_199542 ?auto_199543 ) ( ON-TABLE ?auto_199545 ) ( ON ?auto_199544 ?auto_199545 ) ( not ( = ?auto_199545 ?auto_199544 ) ) ( not ( = ?auto_199545 ?auto_199543 ) ) ( not ( = ?auto_199545 ?auto_199542 ) ) ( not ( = ?auto_199538 ?auto_199545 ) ) ( not ( = ?auto_199539 ?auto_199545 ) ) ( not ( = ?auto_199540 ?auto_199545 ) ) ( not ( = ?auto_199541 ?auto_199545 ) ) ( ON ?auto_199541 ?auto_199542 ) ( ON ?auto_199538 ?auto_199546 ) ( not ( = ?auto_199538 ?auto_199546 ) ) ( not ( = ?auto_199539 ?auto_199546 ) ) ( not ( = ?auto_199540 ?auto_199546 ) ) ( not ( = ?auto_199541 ?auto_199546 ) ) ( not ( = ?auto_199542 ?auto_199546 ) ) ( not ( = ?auto_199543 ?auto_199546 ) ) ( not ( = ?auto_199544 ?auto_199546 ) ) ( not ( = ?auto_199545 ?auto_199546 ) ) ( ON ?auto_199539 ?auto_199538 ) ( CLEAR ?auto_199539 ) ( ON-TABLE ?auto_199546 ) ( HOLDING ?auto_199540 ) ( CLEAR ?auto_199541 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199545 ?auto_199544 ?auto_199543 ?auto_199542 ?auto_199541 ?auto_199540 )
      ( MAKE-6PILE ?auto_199538 ?auto_199539 ?auto_199540 ?auto_199541 ?auto_199542 ?auto_199543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199547 - BLOCK
      ?auto_199548 - BLOCK
      ?auto_199549 - BLOCK
      ?auto_199550 - BLOCK
      ?auto_199551 - BLOCK
      ?auto_199552 - BLOCK
    )
    :vars
    (
      ?auto_199554 - BLOCK
      ?auto_199555 - BLOCK
      ?auto_199553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199547 ?auto_199548 ) ) ( not ( = ?auto_199547 ?auto_199549 ) ) ( not ( = ?auto_199547 ?auto_199550 ) ) ( not ( = ?auto_199547 ?auto_199551 ) ) ( not ( = ?auto_199547 ?auto_199552 ) ) ( not ( = ?auto_199548 ?auto_199549 ) ) ( not ( = ?auto_199548 ?auto_199550 ) ) ( not ( = ?auto_199548 ?auto_199551 ) ) ( not ( = ?auto_199548 ?auto_199552 ) ) ( not ( = ?auto_199549 ?auto_199550 ) ) ( not ( = ?auto_199549 ?auto_199551 ) ) ( not ( = ?auto_199549 ?auto_199552 ) ) ( not ( = ?auto_199550 ?auto_199551 ) ) ( not ( = ?auto_199550 ?auto_199552 ) ) ( not ( = ?auto_199551 ?auto_199552 ) ) ( ON ?auto_199552 ?auto_199554 ) ( not ( = ?auto_199547 ?auto_199554 ) ) ( not ( = ?auto_199548 ?auto_199554 ) ) ( not ( = ?auto_199549 ?auto_199554 ) ) ( not ( = ?auto_199550 ?auto_199554 ) ) ( not ( = ?auto_199551 ?auto_199554 ) ) ( not ( = ?auto_199552 ?auto_199554 ) ) ( ON ?auto_199551 ?auto_199552 ) ( ON-TABLE ?auto_199555 ) ( ON ?auto_199554 ?auto_199555 ) ( not ( = ?auto_199555 ?auto_199554 ) ) ( not ( = ?auto_199555 ?auto_199552 ) ) ( not ( = ?auto_199555 ?auto_199551 ) ) ( not ( = ?auto_199547 ?auto_199555 ) ) ( not ( = ?auto_199548 ?auto_199555 ) ) ( not ( = ?auto_199549 ?auto_199555 ) ) ( not ( = ?auto_199550 ?auto_199555 ) ) ( ON ?auto_199550 ?auto_199551 ) ( ON ?auto_199547 ?auto_199553 ) ( not ( = ?auto_199547 ?auto_199553 ) ) ( not ( = ?auto_199548 ?auto_199553 ) ) ( not ( = ?auto_199549 ?auto_199553 ) ) ( not ( = ?auto_199550 ?auto_199553 ) ) ( not ( = ?auto_199551 ?auto_199553 ) ) ( not ( = ?auto_199552 ?auto_199553 ) ) ( not ( = ?auto_199554 ?auto_199553 ) ) ( not ( = ?auto_199555 ?auto_199553 ) ) ( ON ?auto_199548 ?auto_199547 ) ( ON-TABLE ?auto_199553 ) ( CLEAR ?auto_199550 ) ( ON ?auto_199549 ?auto_199548 ) ( CLEAR ?auto_199549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199553 ?auto_199547 ?auto_199548 )
      ( MAKE-6PILE ?auto_199547 ?auto_199548 ?auto_199549 ?auto_199550 ?auto_199551 ?auto_199552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199556 - BLOCK
      ?auto_199557 - BLOCK
      ?auto_199558 - BLOCK
      ?auto_199559 - BLOCK
      ?auto_199560 - BLOCK
      ?auto_199561 - BLOCK
    )
    :vars
    (
      ?auto_199563 - BLOCK
      ?auto_199564 - BLOCK
      ?auto_199562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199556 ?auto_199557 ) ) ( not ( = ?auto_199556 ?auto_199558 ) ) ( not ( = ?auto_199556 ?auto_199559 ) ) ( not ( = ?auto_199556 ?auto_199560 ) ) ( not ( = ?auto_199556 ?auto_199561 ) ) ( not ( = ?auto_199557 ?auto_199558 ) ) ( not ( = ?auto_199557 ?auto_199559 ) ) ( not ( = ?auto_199557 ?auto_199560 ) ) ( not ( = ?auto_199557 ?auto_199561 ) ) ( not ( = ?auto_199558 ?auto_199559 ) ) ( not ( = ?auto_199558 ?auto_199560 ) ) ( not ( = ?auto_199558 ?auto_199561 ) ) ( not ( = ?auto_199559 ?auto_199560 ) ) ( not ( = ?auto_199559 ?auto_199561 ) ) ( not ( = ?auto_199560 ?auto_199561 ) ) ( ON ?auto_199561 ?auto_199563 ) ( not ( = ?auto_199556 ?auto_199563 ) ) ( not ( = ?auto_199557 ?auto_199563 ) ) ( not ( = ?auto_199558 ?auto_199563 ) ) ( not ( = ?auto_199559 ?auto_199563 ) ) ( not ( = ?auto_199560 ?auto_199563 ) ) ( not ( = ?auto_199561 ?auto_199563 ) ) ( ON ?auto_199560 ?auto_199561 ) ( ON-TABLE ?auto_199564 ) ( ON ?auto_199563 ?auto_199564 ) ( not ( = ?auto_199564 ?auto_199563 ) ) ( not ( = ?auto_199564 ?auto_199561 ) ) ( not ( = ?auto_199564 ?auto_199560 ) ) ( not ( = ?auto_199556 ?auto_199564 ) ) ( not ( = ?auto_199557 ?auto_199564 ) ) ( not ( = ?auto_199558 ?auto_199564 ) ) ( not ( = ?auto_199559 ?auto_199564 ) ) ( ON ?auto_199556 ?auto_199562 ) ( not ( = ?auto_199556 ?auto_199562 ) ) ( not ( = ?auto_199557 ?auto_199562 ) ) ( not ( = ?auto_199558 ?auto_199562 ) ) ( not ( = ?auto_199559 ?auto_199562 ) ) ( not ( = ?auto_199560 ?auto_199562 ) ) ( not ( = ?auto_199561 ?auto_199562 ) ) ( not ( = ?auto_199563 ?auto_199562 ) ) ( not ( = ?auto_199564 ?auto_199562 ) ) ( ON ?auto_199557 ?auto_199556 ) ( ON-TABLE ?auto_199562 ) ( ON ?auto_199558 ?auto_199557 ) ( CLEAR ?auto_199558 ) ( HOLDING ?auto_199559 ) ( CLEAR ?auto_199560 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199564 ?auto_199563 ?auto_199561 ?auto_199560 ?auto_199559 )
      ( MAKE-6PILE ?auto_199556 ?auto_199557 ?auto_199558 ?auto_199559 ?auto_199560 ?auto_199561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199565 - BLOCK
      ?auto_199566 - BLOCK
      ?auto_199567 - BLOCK
      ?auto_199568 - BLOCK
      ?auto_199569 - BLOCK
      ?auto_199570 - BLOCK
    )
    :vars
    (
      ?auto_199573 - BLOCK
      ?auto_199572 - BLOCK
      ?auto_199571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199565 ?auto_199566 ) ) ( not ( = ?auto_199565 ?auto_199567 ) ) ( not ( = ?auto_199565 ?auto_199568 ) ) ( not ( = ?auto_199565 ?auto_199569 ) ) ( not ( = ?auto_199565 ?auto_199570 ) ) ( not ( = ?auto_199566 ?auto_199567 ) ) ( not ( = ?auto_199566 ?auto_199568 ) ) ( not ( = ?auto_199566 ?auto_199569 ) ) ( not ( = ?auto_199566 ?auto_199570 ) ) ( not ( = ?auto_199567 ?auto_199568 ) ) ( not ( = ?auto_199567 ?auto_199569 ) ) ( not ( = ?auto_199567 ?auto_199570 ) ) ( not ( = ?auto_199568 ?auto_199569 ) ) ( not ( = ?auto_199568 ?auto_199570 ) ) ( not ( = ?auto_199569 ?auto_199570 ) ) ( ON ?auto_199570 ?auto_199573 ) ( not ( = ?auto_199565 ?auto_199573 ) ) ( not ( = ?auto_199566 ?auto_199573 ) ) ( not ( = ?auto_199567 ?auto_199573 ) ) ( not ( = ?auto_199568 ?auto_199573 ) ) ( not ( = ?auto_199569 ?auto_199573 ) ) ( not ( = ?auto_199570 ?auto_199573 ) ) ( ON ?auto_199569 ?auto_199570 ) ( ON-TABLE ?auto_199572 ) ( ON ?auto_199573 ?auto_199572 ) ( not ( = ?auto_199572 ?auto_199573 ) ) ( not ( = ?auto_199572 ?auto_199570 ) ) ( not ( = ?auto_199572 ?auto_199569 ) ) ( not ( = ?auto_199565 ?auto_199572 ) ) ( not ( = ?auto_199566 ?auto_199572 ) ) ( not ( = ?auto_199567 ?auto_199572 ) ) ( not ( = ?auto_199568 ?auto_199572 ) ) ( ON ?auto_199565 ?auto_199571 ) ( not ( = ?auto_199565 ?auto_199571 ) ) ( not ( = ?auto_199566 ?auto_199571 ) ) ( not ( = ?auto_199567 ?auto_199571 ) ) ( not ( = ?auto_199568 ?auto_199571 ) ) ( not ( = ?auto_199569 ?auto_199571 ) ) ( not ( = ?auto_199570 ?auto_199571 ) ) ( not ( = ?auto_199573 ?auto_199571 ) ) ( not ( = ?auto_199572 ?auto_199571 ) ) ( ON ?auto_199566 ?auto_199565 ) ( ON-TABLE ?auto_199571 ) ( ON ?auto_199567 ?auto_199566 ) ( CLEAR ?auto_199569 ) ( ON ?auto_199568 ?auto_199567 ) ( CLEAR ?auto_199568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199571 ?auto_199565 ?auto_199566 ?auto_199567 )
      ( MAKE-6PILE ?auto_199565 ?auto_199566 ?auto_199567 ?auto_199568 ?auto_199569 ?auto_199570 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199574 - BLOCK
      ?auto_199575 - BLOCK
      ?auto_199576 - BLOCK
      ?auto_199577 - BLOCK
      ?auto_199578 - BLOCK
      ?auto_199579 - BLOCK
    )
    :vars
    (
      ?auto_199582 - BLOCK
      ?auto_199580 - BLOCK
      ?auto_199581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199574 ?auto_199575 ) ) ( not ( = ?auto_199574 ?auto_199576 ) ) ( not ( = ?auto_199574 ?auto_199577 ) ) ( not ( = ?auto_199574 ?auto_199578 ) ) ( not ( = ?auto_199574 ?auto_199579 ) ) ( not ( = ?auto_199575 ?auto_199576 ) ) ( not ( = ?auto_199575 ?auto_199577 ) ) ( not ( = ?auto_199575 ?auto_199578 ) ) ( not ( = ?auto_199575 ?auto_199579 ) ) ( not ( = ?auto_199576 ?auto_199577 ) ) ( not ( = ?auto_199576 ?auto_199578 ) ) ( not ( = ?auto_199576 ?auto_199579 ) ) ( not ( = ?auto_199577 ?auto_199578 ) ) ( not ( = ?auto_199577 ?auto_199579 ) ) ( not ( = ?auto_199578 ?auto_199579 ) ) ( ON ?auto_199579 ?auto_199582 ) ( not ( = ?auto_199574 ?auto_199582 ) ) ( not ( = ?auto_199575 ?auto_199582 ) ) ( not ( = ?auto_199576 ?auto_199582 ) ) ( not ( = ?auto_199577 ?auto_199582 ) ) ( not ( = ?auto_199578 ?auto_199582 ) ) ( not ( = ?auto_199579 ?auto_199582 ) ) ( ON-TABLE ?auto_199580 ) ( ON ?auto_199582 ?auto_199580 ) ( not ( = ?auto_199580 ?auto_199582 ) ) ( not ( = ?auto_199580 ?auto_199579 ) ) ( not ( = ?auto_199580 ?auto_199578 ) ) ( not ( = ?auto_199574 ?auto_199580 ) ) ( not ( = ?auto_199575 ?auto_199580 ) ) ( not ( = ?auto_199576 ?auto_199580 ) ) ( not ( = ?auto_199577 ?auto_199580 ) ) ( ON ?auto_199574 ?auto_199581 ) ( not ( = ?auto_199574 ?auto_199581 ) ) ( not ( = ?auto_199575 ?auto_199581 ) ) ( not ( = ?auto_199576 ?auto_199581 ) ) ( not ( = ?auto_199577 ?auto_199581 ) ) ( not ( = ?auto_199578 ?auto_199581 ) ) ( not ( = ?auto_199579 ?auto_199581 ) ) ( not ( = ?auto_199582 ?auto_199581 ) ) ( not ( = ?auto_199580 ?auto_199581 ) ) ( ON ?auto_199575 ?auto_199574 ) ( ON-TABLE ?auto_199581 ) ( ON ?auto_199576 ?auto_199575 ) ( ON ?auto_199577 ?auto_199576 ) ( CLEAR ?auto_199577 ) ( HOLDING ?auto_199578 ) ( CLEAR ?auto_199579 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199580 ?auto_199582 ?auto_199579 ?auto_199578 )
      ( MAKE-6PILE ?auto_199574 ?auto_199575 ?auto_199576 ?auto_199577 ?auto_199578 ?auto_199579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199583 - BLOCK
      ?auto_199584 - BLOCK
      ?auto_199585 - BLOCK
      ?auto_199586 - BLOCK
      ?auto_199587 - BLOCK
      ?auto_199588 - BLOCK
    )
    :vars
    (
      ?auto_199589 - BLOCK
      ?auto_199590 - BLOCK
      ?auto_199591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199583 ?auto_199584 ) ) ( not ( = ?auto_199583 ?auto_199585 ) ) ( not ( = ?auto_199583 ?auto_199586 ) ) ( not ( = ?auto_199583 ?auto_199587 ) ) ( not ( = ?auto_199583 ?auto_199588 ) ) ( not ( = ?auto_199584 ?auto_199585 ) ) ( not ( = ?auto_199584 ?auto_199586 ) ) ( not ( = ?auto_199584 ?auto_199587 ) ) ( not ( = ?auto_199584 ?auto_199588 ) ) ( not ( = ?auto_199585 ?auto_199586 ) ) ( not ( = ?auto_199585 ?auto_199587 ) ) ( not ( = ?auto_199585 ?auto_199588 ) ) ( not ( = ?auto_199586 ?auto_199587 ) ) ( not ( = ?auto_199586 ?auto_199588 ) ) ( not ( = ?auto_199587 ?auto_199588 ) ) ( ON ?auto_199588 ?auto_199589 ) ( not ( = ?auto_199583 ?auto_199589 ) ) ( not ( = ?auto_199584 ?auto_199589 ) ) ( not ( = ?auto_199585 ?auto_199589 ) ) ( not ( = ?auto_199586 ?auto_199589 ) ) ( not ( = ?auto_199587 ?auto_199589 ) ) ( not ( = ?auto_199588 ?auto_199589 ) ) ( ON-TABLE ?auto_199590 ) ( ON ?auto_199589 ?auto_199590 ) ( not ( = ?auto_199590 ?auto_199589 ) ) ( not ( = ?auto_199590 ?auto_199588 ) ) ( not ( = ?auto_199590 ?auto_199587 ) ) ( not ( = ?auto_199583 ?auto_199590 ) ) ( not ( = ?auto_199584 ?auto_199590 ) ) ( not ( = ?auto_199585 ?auto_199590 ) ) ( not ( = ?auto_199586 ?auto_199590 ) ) ( ON ?auto_199583 ?auto_199591 ) ( not ( = ?auto_199583 ?auto_199591 ) ) ( not ( = ?auto_199584 ?auto_199591 ) ) ( not ( = ?auto_199585 ?auto_199591 ) ) ( not ( = ?auto_199586 ?auto_199591 ) ) ( not ( = ?auto_199587 ?auto_199591 ) ) ( not ( = ?auto_199588 ?auto_199591 ) ) ( not ( = ?auto_199589 ?auto_199591 ) ) ( not ( = ?auto_199590 ?auto_199591 ) ) ( ON ?auto_199584 ?auto_199583 ) ( ON-TABLE ?auto_199591 ) ( ON ?auto_199585 ?auto_199584 ) ( ON ?auto_199586 ?auto_199585 ) ( CLEAR ?auto_199588 ) ( ON ?auto_199587 ?auto_199586 ) ( CLEAR ?auto_199587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199591 ?auto_199583 ?auto_199584 ?auto_199585 ?auto_199586 )
      ( MAKE-6PILE ?auto_199583 ?auto_199584 ?auto_199585 ?auto_199586 ?auto_199587 ?auto_199588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199592 - BLOCK
      ?auto_199593 - BLOCK
      ?auto_199594 - BLOCK
      ?auto_199595 - BLOCK
      ?auto_199596 - BLOCK
      ?auto_199597 - BLOCK
    )
    :vars
    (
      ?auto_199598 - BLOCK
      ?auto_199600 - BLOCK
      ?auto_199599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199592 ?auto_199593 ) ) ( not ( = ?auto_199592 ?auto_199594 ) ) ( not ( = ?auto_199592 ?auto_199595 ) ) ( not ( = ?auto_199592 ?auto_199596 ) ) ( not ( = ?auto_199592 ?auto_199597 ) ) ( not ( = ?auto_199593 ?auto_199594 ) ) ( not ( = ?auto_199593 ?auto_199595 ) ) ( not ( = ?auto_199593 ?auto_199596 ) ) ( not ( = ?auto_199593 ?auto_199597 ) ) ( not ( = ?auto_199594 ?auto_199595 ) ) ( not ( = ?auto_199594 ?auto_199596 ) ) ( not ( = ?auto_199594 ?auto_199597 ) ) ( not ( = ?auto_199595 ?auto_199596 ) ) ( not ( = ?auto_199595 ?auto_199597 ) ) ( not ( = ?auto_199596 ?auto_199597 ) ) ( not ( = ?auto_199592 ?auto_199598 ) ) ( not ( = ?auto_199593 ?auto_199598 ) ) ( not ( = ?auto_199594 ?auto_199598 ) ) ( not ( = ?auto_199595 ?auto_199598 ) ) ( not ( = ?auto_199596 ?auto_199598 ) ) ( not ( = ?auto_199597 ?auto_199598 ) ) ( ON-TABLE ?auto_199600 ) ( ON ?auto_199598 ?auto_199600 ) ( not ( = ?auto_199600 ?auto_199598 ) ) ( not ( = ?auto_199600 ?auto_199597 ) ) ( not ( = ?auto_199600 ?auto_199596 ) ) ( not ( = ?auto_199592 ?auto_199600 ) ) ( not ( = ?auto_199593 ?auto_199600 ) ) ( not ( = ?auto_199594 ?auto_199600 ) ) ( not ( = ?auto_199595 ?auto_199600 ) ) ( ON ?auto_199592 ?auto_199599 ) ( not ( = ?auto_199592 ?auto_199599 ) ) ( not ( = ?auto_199593 ?auto_199599 ) ) ( not ( = ?auto_199594 ?auto_199599 ) ) ( not ( = ?auto_199595 ?auto_199599 ) ) ( not ( = ?auto_199596 ?auto_199599 ) ) ( not ( = ?auto_199597 ?auto_199599 ) ) ( not ( = ?auto_199598 ?auto_199599 ) ) ( not ( = ?auto_199600 ?auto_199599 ) ) ( ON ?auto_199593 ?auto_199592 ) ( ON-TABLE ?auto_199599 ) ( ON ?auto_199594 ?auto_199593 ) ( ON ?auto_199595 ?auto_199594 ) ( ON ?auto_199596 ?auto_199595 ) ( CLEAR ?auto_199596 ) ( HOLDING ?auto_199597 ) ( CLEAR ?auto_199598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199600 ?auto_199598 ?auto_199597 )
      ( MAKE-6PILE ?auto_199592 ?auto_199593 ?auto_199594 ?auto_199595 ?auto_199596 ?auto_199597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199601 - BLOCK
      ?auto_199602 - BLOCK
      ?auto_199603 - BLOCK
      ?auto_199604 - BLOCK
      ?auto_199605 - BLOCK
      ?auto_199606 - BLOCK
    )
    :vars
    (
      ?auto_199607 - BLOCK
      ?auto_199609 - BLOCK
      ?auto_199608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199601 ?auto_199602 ) ) ( not ( = ?auto_199601 ?auto_199603 ) ) ( not ( = ?auto_199601 ?auto_199604 ) ) ( not ( = ?auto_199601 ?auto_199605 ) ) ( not ( = ?auto_199601 ?auto_199606 ) ) ( not ( = ?auto_199602 ?auto_199603 ) ) ( not ( = ?auto_199602 ?auto_199604 ) ) ( not ( = ?auto_199602 ?auto_199605 ) ) ( not ( = ?auto_199602 ?auto_199606 ) ) ( not ( = ?auto_199603 ?auto_199604 ) ) ( not ( = ?auto_199603 ?auto_199605 ) ) ( not ( = ?auto_199603 ?auto_199606 ) ) ( not ( = ?auto_199604 ?auto_199605 ) ) ( not ( = ?auto_199604 ?auto_199606 ) ) ( not ( = ?auto_199605 ?auto_199606 ) ) ( not ( = ?auto_199601 ?auto_199607 ) ) ( not ( = ?auto_199602 ?auto_199607 ) ) ( not ( = ?auto_199603 ?auto_199607 ) ) ( not ( = ?auto_199604 ?auto_199607 ) ) ( not ( = ?auto_199605 ?auto_199607 ) ) ( not ( = ?auto_199606 ?auto_199607 ) ) ( ON-TABLE ?auto_199609 ) ( ON ?auto_199607 ?auto_199609 ) ( not ( = ?auto_199609 ?auto_199607 ) ) ( not ( = ?auto_199609 ?auto_199606 ) ) ( not ( = ?auto_199609 ?auto_199605 ) ) ( not ( = ?auto_199601 ?auto_199609 ) ) ( not ( = ?auto_199602 ?auto_199609 ) ) ( not ( = ?auto_199603 ?auto_199609 ) ) ( not ( = ?auto_199604 ?auto_199609 ) ) ( ON ?auto_199601 ?auto_199608 ) ( not ( = ?auto_199601 ?auto_199608 ) ) ( not ( = ?auto_199602 ?auto_199608 ) ) ( not ( = ?auto_199603 ?auto_199608 ) ) ( not ( = ?auto_199604 ?auto_199608 ) ) ( not ( = ?auto_199605 ?auto_199608 ) ) ( not ( = ?auto_199606 ?auto_199608 ) ) ( not ( = ?auto_199607 ?auto_199608 ) ) ( not ( = ?auto_199609 ?auto_199608 ) ) ( ON ?auto_199602 ?auto_199601 ) ( ON-TABLE ?auto_199608 ) ( ON ?auto_199603 ?auto_199602 ) ( ON ?auto_199604 ?auto_199603 ) ( ON ?auto_199605 ?auto_199604 ) ( CLEAR ?auto_199607 ) ( ON ?auto_199606 ?auto_199605 ) ( CLEAR ?auto_199606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199608 ?auto_199601 ?auto_199602 ?auto_199603 ?auto_199604 ?auto_199605 )
      ( MAKE-6PILE ?auto_199601 ?auto_199602 ?auto_199603 ?auto_199604 ?auto_199605 ?auto_199606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199610 - BLOCK
      ?auto_199611 - BLOCK
      ?auto_199612 - BLOCK
      ?auto_199613 - BLOCK
      ?auto_199614 - BLOCK
      ?auto_199615 - BLOCK
    )
    :vars
    (
      ?auto_199617 - BLOCK
      ?auto_199618 - BLOCK
      ?auto_199616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199610 ?auto_199611 ) ) ( not ( = ?auto_199610 ?auto_199612 ) ) ( not ( = ?auto_199610 ?auto_199613 ) ) ( not ( = ?auto_199610 ?auto_199614 ) ) ( not ( = ?auto_199610 ?auto_199615 ) ) ( not ( = ?auto_199611 ?auto_199612 ) ) ( not ( = ?auto_199611 ?auto_199613 ) ) ( not ( = ?auto_199611 ?auto_199614 ) ) ( not ( = ?auto_199611 ?auto_199615 ) ) ( not ( = ?auto_199612 ?auto_199613 ) ) ( not ( = ?auto_199612 ?auto_199614 ) ) ( not ( = ?auto_199612 ?auto_199615 ) ) ( not ( = ?auto_199613 ?auto_199614 ) ) ( not ( = ?auto_199613 ?auto_199615 ) ) ( not ( = ?auto_199614 ?auto_199615 ) ) ( not ( = ?auto_199610 ?auto_199617 ) ) ( not ( = ?auto_199611 ?auto_199617 ) ) ( not ( = ?auto_199612 ?auto_199617 ) ) ( not ( = ?auto_199613 ?auto_199617 ) ) ( not ( = ?auto_199614 ?auto_199617 ) ) ( not ( = ?auto_199615 ?auto_199617 ) ) ( ON-TABLE ?auto_199618 ) ( not ( = ?auto_199618 ?auto_199617 ) ) ( not ( = ?auto_199618 ?auto_199615 ) ) ( not ( = ?auto_199618 ?auto_199614 ) ) ( not ( = ?auto_199610 ?auto_199618 ) ) ( not ( = ?auto_199611 ?auto_199618 ) ) ( not ( = ?auto_199612 ?auto_199618 ) ) ( not ( = ?auto_199613 ?auto_199618 ) ) ( ON ?auto_199610 ?auto_199616 ) ( not ( = ?auto_199610 ?auto_199616 ) ) ( not ( = ?auto_199611 ?auto_199616 ) ) ( not ( = ?auto_199612 ?auto_199616 ) ) ( not ( = ?auto_199613 ?auto_199616 ) ) ( not ( = ?auto_199614 ?auto_199616 ) ) ( not ( = ?auto_199615 ?auto_199616 ) ) ( not ( = ?auto_199617 ?auto_199616 ) ) ( not ( = ?auto_199618 ?auto_199616 ) ) ( ON ?auto_199611 ?auto_199610 ) ( ON-TABLE ?auto_199616 ) ( ON ?auto_199612 ?auto_199611 ) ( ON ?auto_199613 ?auto_199612 ) ( ON ?auto_199614 ?auto_199613 ) ( ON ?auto_199615 ?auto_199614 ) ( CLEAR ?auto_199615 ) ( HOLDING ?auto_199617 ) ( CLEAR ?auto_199618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199618 ?auto_199617 )
      ( MAKE-6PILE ?auto_199610 ?auto_199611 ?auto_199612 ?auto_199613 ?auto_199614 ?auto_199615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199619 - BLOCK
      ?auto_199620 - BLOCK
      ?auto_199621 - BLOCK
      ?auto_199622 - BLOCK
      ?auto_199623 - BLOCK
      ?auto_199624 - BLOCK
    )
    :vars
    (
      ?auto_199626 - BLOCK
      ?auto_199627 - BLOCK
      ?auto_199625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199619 ?auto_199620 ) ) ( not ( = ?auto_199619 ?auto_199621 ) ) ( not ( = ?auto_199619 ?auto_199622 ) ) ( not ( = ?auto_199619 ?auto_199623 ) ) ( not ( = ?auto_199619 ?auto_199624 ) ) ( not ( = ?auto_199620 ?auto_199621 ) ) ( not ( = ?auto_199620 ?auto_199622 ) ) ( not ( = ?auto_199620 ?auto_199623 ) ) ( not ( = ?auto_199620 ?auto_199624 ) ) ( not ( = ?auto_199621 ?auto_199622 ) ) ( not ( = ?auto_199621 ?auto_199623 ) ) ( not ( = ?auto_199621 ?auto_199624 ) ) ( not ( = ?auto_199622 ?auto_199623 ) ) ( not ( = ?auto_199622 ?auto_199624 ) ) ( not ( = ?auto_199623 ?auto_199624 ) ) ( not ( = ?auto_199619 ?auto_199626 ) ) ( not ( = ?auto_199620 ?auto_199626 ) ) ( not ( = ?auto_199621 ?auto_199626 ) ) ( not ( = ?auto_199622 ?auto_199626 ) ) ( not ( = ?auto_199623 ?auto_199626 ) ) ( not ( = ?auto_199624 ?auto_199626 ) ) ( ON-TABLE ?auto_199627 ) ( not ( = ?auto_199627 ?auto_199626 ) ) ( not ( = ?auto_199627 ?auto_199624 ) ) ( not ( = ?auto_199627 ?auto_199623 ) ) ( not ( = ?auto_199619 ?auto_199627 ) ) ( not ( = ?auto_199620 ?auto_199627 ) ) ( not ( = ?auto_199621 ?auto_199627 ) ) ( not ( = ?auto_199622 ?auto_199627 ) ) ( ON ?auto_199619 ?auto_199625 ) ( not ( = ?auto_199619 ?auto_199625 ) ) ( not ( = ?auto_199620 ?auto_199625 ) ) ( not ( = ?auto_199621 ?auto_199625 ) ) ( not ( = ?auto_199622 ?auto_199625 ) ) ( not ( = ?auto_199623 ?auto_199625 ) ) ( not ( = ?auto_199624 ?auto_199625 ) ) ( not ( = ?auto_199626 ?auto_199625 ) ) ( not ( = ?auto_199627 ?auto_199625 ) ) ( ON ?auto_199620 ?auto_199619 ) ( ON-TABLE ?auto_199625 ) ( ON ?auto_199621 ?auto_199620 ) ( ON ?auto_199622 ?auto_199621 ) ( ON ?auto_199623 ?auto_199622 ) ( ON ?auto_199624 ?auto_199623 ) ( CLEAR ?auto_199627 ) ( ON ?auto_199626 ?auto_199624 ) ( CLEAR ?auto_199626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199625 ?auto_199619 ?auto_199620 ?auto_199621 ?auto_199622 ?auto_199623 ?auto_199624 )
      ( MAKE-6PILE ?auto_199619 ?auto_199620 ?auto_199621 ?auto_199622 ?auto_199623 ?auto_199624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199628 - BLOCK
      ?auto_199629 - BLOCK
      ?auto_199630 - BLOCK
      ?auto_199631 - BLOCK
      ?auto_199632 - BLOCK
      ?auto_199633 - BLOCK
    )
    :vars
    (
      ?auto_199634 - BLOCK
      ?auto_199635 - BLOCK
      ?auto_199636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199628 ?auto_199629 ) ) ( not ( = ?auto_199628 ?auto_199630 ) ) ( not ( = ?auto_199628 ?auto_199631 ) ) ( not ( = ?auto_199628 ?auto_199632 ) ) ( not ( = ?auto_199628 ?auto_199633 ) ) ( not ( = ?auto_199629 ?auto_199630 ) ) ( not ( = ?auto_199629 ?auto_199631 ) ) ( not ( = ?auto_199629 ?auto_199632 ) ) ( not ( = ?auto_199629 ?auto_199633 ) ) ( not ( = ?auto_199630 ?auto_199631 ) ) ( not ( = ?auto_199630 ?auto_199632 ) ) ( not ( = ?auto_199630 ?auto_199633 ) ) ( not ( = ?auto_199631 ?auto_199632 ) ) ( not ( = ?auto_199631 ?auto_199633 ) ) ( not ( = ?auto_199632 ?auto_199633 ) ) ( not ( = ?auto_199628 ?auto_199634 ) ) ( not ( = ?auto_199629 ?auto_199634 ) ) ( not ( = ?auto_199630 ?auto_199634 ) ) ( not ( = ?auto_199631 ?auto_199634 ) ) ( not ( = ?auto_199632 ?auto_199634 ) ) ( not ( = ?auto_199633 ?auto_199634 ) ) ( not ( = ?auto_199635 ?auto_199634 ) ) ( not ( = ?auto_199635 ?auto_199633 ) ) ( not ( = ?auto_199635 ?auto_199632 ) ) ( not ( = ?auto_199628 ?auto_199635 ) ) ( not ( = ?auto_199629 ?auto_199635 ) ) ( not ( = ?auto_199630 ?auto_199635 ) ) ( not ( = ?auto_199631 ?auto_199635 ) ) ( ON ?auto_199628 ?auto_199636 ) ( not ( = ?auto_199628 ?auto_199636 ) ) ( not ( = ?auto_199629 ?auto_199636 ) ) ( not ( = ?auto_199630 ?auto_199636 ) ) ( not ( = ?auto_199631 ?auto_199636 ) ) ( not ( = ?auto_199632 ?auto_199636 ) ) ( not ( = ?auto_199633 ?auto_199636 ) ) ( not ( = ?auto_199634 ?auto_199636 ) ) ( not ( = ?auto_199635 ?auto_199636 ) ) ( ON ?auto_199629 ?auto_199628 ) ( ON-TABLE ?auto_199636 ) ( ON ?auto_199630 ?auto_199629 ) ( ON ?auto_199631 ?auto_199630 ) ( ON ?auto_199632 ?auto_199631 ) ( ON ?auto_199633 ?auto_199632 ) ( ON ?auto_199634 ?auto_199633 ) ( CLEAR ?auto_199634 ) ( HOLDING ?auto_199635 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199635 )
      ( MAKE-6PILE ?auto_199628 ?auto_199629 ?auto_199630 ?auto_199631 ?auto_199632 ?auto_199633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_199637 - BLOCK
      ?auto_199638 - BLOCK
      ?auto_199639 - BLOCK
      ?auto_199640 - BLOCK
      ?auto_199641 - BLOCK
      ?auto_199642 - BLOCK
    )
    :vars
    (
      ?auto_199643 - BLOCK
      ?auto_199645 - BLOCK
      ?auto_199644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199637 ?auto_199638 ) ) ( not ( = ?auto_199637 ?auto_199639 ) ) ( not ( = ?auto_199637 ?auto_199640 ) ) ( not ( = ?auto_199637 ?auto_199641 ) ) ( not ( = ?auto_199637 ?auto_199642 ) ) ( not ( = ?auto_199638 ?auto_199639 ) ) ( not ( = ?auto_199638 ?auto_199640 ) ) ( not ( = ?auto_199638 ?auto_199641 ) ) ( not ( = ?auto_199638 ?auto_199642 ) ) ( not ( = ?auto_199639 ?auto_199640 ) ) ( not ( = ?auto_199639 ?auto_199641 ) ) ( not ( = ?auto_199639 ?auto_199642 ) ) ( not ( = ?auto_199640 ?auto_199641 ) ) ( not ( = ?auto_199640 ?auto_199642 ) ) ( not ( = ?auto_199641 ?auto_199642 ) ) ( not ( = ?auto_199637 ?auto_199643 ) ) ( not ( = ?auto_199638 ?auto_199643 ) ) ( not ( = ?auto_199639 ?auto_199643 ) ) ( not ( = ?auto_199640 ?auto_199643 ) ) ( not ( = ?auto_199641 ?auto_199643 ) ) ( not ( = ?auto_199642 ?auto_199643 ) ) ( not ( = ?auto_199645 ?auto_199643 ) ) ( not ( = ?auto_199645 ?auto_199642 ) ) ( not ( = ?auto_199645 ?auto_199641 ) ) ( not ( = ?auto_199637 ?auto_199645 ) ) ( not ( = ?auto_199638 ?auto_199645 ) ) ( not ( = ?auto_199639 ?auto_199645 ) ) ( not ( = ?auto_199640 ?auto_199645 ) ) ( ON ?auto_199637 ?auto_199644 ) ( not ( = ?auto_199637 ?auto_199644 ) ) ( not ( = ?auto_199638 ?auto_199644 ) ) ( not ( = ?auto_199639 ?auto_199644 ) ) ( not ( = ?auto_199640 ?auto_199644 ) ) ( not ( = ?auto_199641 ?auto_199644 ) ) ( not ( = ?auto_199642 ?auto_199644 ) ) ( not ( = ?auto_199643 ?auto_199644 ) ) ( not ( = ?auto_199645 ?auto_199644 ) ) ( ON ?auto_199638 ?auto_199637 ) ( ON-TABLE ?auto_199644 ) ( ON ?auto_199639 ?auto_199638 ) ( ON ?auto_199640 ?auto_199639 ) ( ON ?auto_199641 ?auto_199640 ) ( ON ?auto_199642 ?auto_199641 ) ( ON ?auto_199643 ?auto_199642 ) ( ON ?auto_199645 ?auto_199643 ) ( CLEAR ?auto_199645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199644 ?auto_199637 ?auto_199638 ?auto_199639 ?auto_199640 ?auto_199641 ?auto_199642 ?auto_199643 )
      ( MAKE-6PILE ?auto_199637 ?auto_199638 ?auto_199639 ?auto_199640 ?auto_199641 ?auto_199642 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199647 - BLOCK
    )
    :vars
    (
      ?auto_199648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199648 ?auto_199647 ) ( CLEAR ?auto_199648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199647 ) ( not ( = ?auto_199647 ?auto_199648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199648 ?auto_199647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199649 - BLOCK
    )
    :vars
    (
      ?auto_199650 - BLOCK
      ?auto_199651 - BLOCK
      ?auto_199652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199650 ?auto_199649 ) ( CLEAR ?auto_199650 ) ( ON-TABLE ?auto_199649 ) ( not ( = ?auto_199649 ?auto_199650 ) ) ( HOLDING ?auto_199651 ) ( CLEAR ?auto_199652 ) ( not ( = ?auto_199649 ?auto_199651 ) ) ( not ( = ?auto_199649 ?auto_199652 ) ) ( not ( = ?auto_199650 ?auto_199651 ) ) ( not ( = ?auto_199650 ?auto_199652 ) ) ( not ( = ?auto_199651 ?auto_199652 ) ) )
    :subtasks
    ( ( !STACK ?auto_199651 ?auto_199652 )
      ( MAKE-1PILE ?auto_199649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199653 - BLOCK
    )
    :vars
    (
      ?auto_199655 - BLOCK
      ?auto_199656 - BLOCK
      ?auto_199654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199655 ?auto_199653 ) ( ON-TABLE ?auto_199653 ) ( not ( = ?auto_199653 ?auto_199655 ) ) ( CLEAR ?auto_199656 ) ( not ( = ?auto_199653 ?auto_199654 ) ) ( not ( = ?auto_199653 ?auto_199656 ) ) ( not ( = ?auto_199655 ?auto_199654 ) ) ( not ( = ?auto_199655 ?auto_199656 ) ) ( not ( = ?auto_199654 ?auto_199656 ) ) ( ON ?auto_199654 ?auto_199655 ) ( CLEAR ?auto_199654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199653 ?auto_199655 )
      ( MAKE-1PILE ?auto_199653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199657 - BLOCK
    )
    :vars
    (
      ?auto_199658 - BLOCK
      ?auto_199659 - BLOCK
      ?auto_199660 - BLOCK
      ?auto_199662 - BLOCK
      ?auto_199663 - BLOCK
      ?auto_199664 - BLOCK
      ?auto_199661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199658 ?auto_199657 ) ( ON-TABLE ?auto_199657 ) ( not ( = ?auto_199657 ?auto_199658 ) ) ( not ( = ?auto_199657 ?auto_199659 ) ) ( not ( = ?auto_199657 ?auto_199660 ) ) ( not ( = ?auto_199658 ?auto_199659 ) ) ( not ( = ?auto_199658 ?auto_199660 ) ) ( not ( = ?auto_199659 ?auto_199660 ) ) ( ON ?auto_199659 ?auto_199658 ) ( CLEAR ?auto_199659 ) ( HOLDING ?auto_199660 ) ( CLEAR ?auto_199662 ) ( ON-TABLE ?auto_199663 ) ( ON ?auto_199664 ?auto_199663 ) ( ON ?auto_199661 ?auto_199664 ) ( ON ?auto_199662 ?auto_199661 ) ( not ( = ?auto_199663 ?auto_199664 ) ) ( not ( = ?auto_199663 ?auto_199661 ) ) ( not ( = ?auto_199663 ?auto_199662 ) ) ( not ( = ?auto_199663 ?auto_199660 ) ) ( not ( = ?auto_199664 ?auto_199661 ) ) ( not ( = ?auto_199664 ?auto_199662 ) ) ( not ( = ?auto_199664 ?auto_199660 ) ) ( not ( = ?auto_199661 ?auto_199662 ) ) ( not ( = ?auto_199661 ?auto_199660 ) ) ( not ( = ?auto_199662 ?auto_199660 ) ) ( not ( = ?auto_199657 ?auto_199662 ) ) ( not ( = ?auto_199657 ?auto_199663 ) ) ( not ( = ?auto_199657 ?auto_199664 ) ) ( not ( = ?auto_199657 ?auto_199661 ) ) ( not ( = ?auto_199658 ?auto_199662 ) ) ( not ( = ?auto_199658 ?auto_199663 ) ) ( not ( = ?auto_199658 ?auto_199664 ) ) ( not ( = ?auto_199658 ?auto_199661 ) ) ( not ( = ?auto_199659 ?auto_199662 ) ) ( not ( = ?auto_199659 ?auto_199663 ) ) ( not ( = ?auto_199659 ?auto_199664 ) ) ( not ( = ?auto_199659 ?auto_199661 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199663 ?auto_199664 ?auto_199661 ?auto_199662 ?auto_199660 )
      ( MAKE-1PILE ?auto_199657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199665 - BLOCK
    )
    :vars
    (
      ?auto_199670 - BLOCK
      ?auto_199672 - BLOCK
      ?auto_199671 - BLOCK
      ?auto_199667 - BLOCK
      ?auto_199669 - BLOCK
      ?auto_199666 - BLOCK
      ?auto_199668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199670 ?auto_199665 ) ( ON-TABLE ?auto_199665 ) ( not ( = ?auto_199665 ?auto_199670 ) ) ( not ( = ?auto_199665 ?auto_199672 ) ) ( not ( = ?auto_199665 ?auto_199671 ) ) ( not ( = ?auto_199670 ?auto_199672 ) ) ( not ( = ?auto_199670 ?auto_199671 ) ) ( not ( = ?auto_199672 ?auto_199671 ) ) ( ON ?auto_199672 ?auto_199670 ) ( CLEAR ?auto_199667 ) ( ON-TABLE ?auto_199669 ) ( ON ?auto_199666 ?auto_199669 ) ( ON ?auto_199668 ?auto_199666 ) ( ON ?auto_199667 ?auto_199668 ) ( not ( = ?auto_199669 ?auto_199666 ) ) ( not ( = ?auto_199669 ?auto_199668 ) ) ( not ( = ?auto_199669 ?auto_199667 ) ) ( not ( = ?auto_199669 ?auto_199671 ) ) ( not ( = ?auto_199666 ?auto_199668 ) ) ( not ( = ?auto_199666 ?auto_199667 ) ) ( not ( = ?auto_199666 ?auto_199671 ) ) ( not ( = ?auto_199668 ?auto_199667 ) ) ( not ( = ?auto_199668 ?auto_199671 ) ) ( not ( = ?auto_199667 ?auto_199671 ) ) ( not ( = ?auto_199665 ?auto_199667 ) ) ( not ( = ?auto_199665 ?auto_199669 ) ) ( not ( = ?auto_199665 ?auto_199666 ) ) ( not ( = ?auto_199665 ?auto_199668 ) ) ( not ( = ?auto_199670 ?auto_199667 ) ) ( not ( = ?auto_199670 ?auto_199669 ) ) ( not ( = ?auto_199670 ?auto_199666 ) ) ( not ( = ?auto_199670 ?auto_199668 ) ) ( not ( = ?auto_199672 ?auto_199667 ) ) ( not ( = ?auto_199672 ?auto_199669 ) ) ( not ( = ?auto_199672 ?auto_199666 ) ) ( not ( = ?auto_199672 ?auto_199668 ) ) ( ON ?auto_199671 ?auto_199672 ) ( CLEAR ?auto_199671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199665 ?auto_199670 ?auto_199672 )
      ( MAKE-1PILE ?auto_199665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199673 - BLOCK
    )
    :vars
    (
      ?auto_199679 - BLOCK
      ?auto_199676 - BLOCK
      ?auto_199675 - BLOCK
      ?auto_199678 - BLOCK
      ?auto_199677 - BLOCK
      ?auto_199680 - BLOCK
      ?auto_199674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199679 ?auto_199673 ) ( ON-TABLE ?auto_199673 ) ( not ( = ?auto_199673 ?auto_199679 ) ) ( not ( = ?auto_199673 ?auto_199676 ) ) ( not ( = ?auto_199673 ?auto_199675 ) ) ( not ( = ?auto_199679 ?auto_199676 ) ) ( not ( = ?auto_199679 ?auto_199675 ) ) ( not ( = ?auto_199676 ?auto_199675 ) ) ( ON ?auto_199676 ?auto_199679 ) ( ON-TABLE ?auto_199678 ) ( ON ?auto_199677 ?auto_199678 ) ( ON ?auto_199680 ?auto_199677 ) ( not ( = ?auto_199678 ?auto_199677 ) ) ( not ( = ?auto_199678 ?auto_199680 ) ) ( not ( = ?auto_199678 ?auto_199674 ) ) ( not ( = ?auto_199678 ?auto_199675 ) ) ( not ( = ?auto_199677 ?auto_199680 ) ) ( not ( = ?auto_199677 ?auto_199674 ) ) ( not ( = ?auto_199677 ?auto_199675 ) ) ( not ( = ?auto_199680 ?auto_199674 ) ) ( not ( = ?auto_199680 ?auto_199675 ) ) ( not ( = ?auto_199674 ?auto_199675 ) ) ( not ( = ?auto_199673 ?auto_199674 ) ) ( not ( = ?auto_199673 ?auto_199678 ) ) ( not ( = ?auto_199673 ?auto_199677 ) ) ( not ( = ?auto_199673 ?auto_199680 ) ) ( not ( = ?auto_199679 ?auto_199674 ) ) ( not ( = ?auto_199679 ?auto_199678 ) ) ( not ( = ?auto_199679 ?auto_199677 ) ) ( not ( = ?auto_199679 ?auto_199680 ) ) ( not ( = ?auto_199676 ?auto_199674 ) ) ( not ( = ?auto_199676 ?auto_199678 ) ) ( not ( = ?auto_199676 ?auto_199677 ) ) ( not ( = ?auto_199676 ?auto_199680 ) ) ( ON ?auto_199675 ?auto_199676 ) ( CLEAR ?auto_199675 ) ( HOLDING ?auto_199674 ) ( CLEAR ?auto_199680 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199678 ?auto_199677 ?auto_199680 ?auto_199674 )
      ( MAKE-1PILE ?auto_199673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199681 - BLOCK
    )
    :vars
    (
      ?auto_199685 - BLOCK
      ?auto_199682 - BLOCK
      ?auto_199688 - BLOCK
      ?auto_199683 - BLOCK
      ?auto_199686 - BLOCK
      ?auto_199684 - BLOCK
      ?auto_199687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199685 ?auto_199681 ) ( ON-TABLE ?auto_199681 ) ( not ( = ?auto_199681 ?auto_199685 ) ) ( not ( = ?auto_199681 ?auto_199682 ) ) ( not ( = ?auto_199681 ?auto_199688 ) ) ( not ( = ?auto_199685 ?auto_199682 ) ) ( not ( = ?auto_199685 ?auto_199688 ) ) ( not ( = ?auto_199682 ?auto_199688 ) ) ( ON ?auto_199682 ?auto_199685 ) ( ON-TABLE ?auto_199683 ) ( ON ?auto_199686 ?auto_199683 ) ( ON ?auto_199684 ?auto_199686 ) ( not ( = ?auto_199683 ?auto_199686 ) ) ( not ( = ?auto_199683 ?auto_199684 ) ) ( not ( = ?auto_199683 ?auto_199687 ) ) ( not ( = ?auto_199683 ?auto_199688 ) ) ( not ( = ?auto_199686 ?auto_199684 ) ) ( not ( = ?auto_199686 ?auto_199687 ) ) ( not ( = ?auto_199686 ?auto_199688 ) ) ( not ( = ?auto_199684 ?auto_199687 ) ) ( not ( = ?auto_199684 ?auto_199688 ) ) ( not ( = ?auto_199687 ?auto_199688 ) ) ( not ( = ?auto_199681 ?auto_199687 ) ) ( not ( = ?auto_199681 ?auto_199683 ) ) ( not ( = ?auto_199681 ?auto_199686 ) ) ( not ( = ?auto_199681 ?auto_199684 ) ) ( not ( = ?auto_199685 ?auto_199687 ) ) ( not ( = ?auto_199685 ?auto_199683 ) ) ( not ( = ?auto_199685 ?auto_199686 ) ) ( not ( = ?auto_199685 ?auto_199684 ) ) ( not ( = ?auto_199682 ?auto_199687 ) ) ( not ( = ?auto_199682 ?auto_199683 ) ) ( not ( = ?auto_199682 ?auto_199686 ) ) ( not ( = ?auto_199682 ?auto_199684 ) ) ( ON ?auto_199688 ?auto_199682 ) ( CLEAR ?auto_199684 ) ( ON ?auto_199687 ?auto_199688 ) ( CLEAR ?auto_199687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199681 ?auto_199685 ?auto_199682 ?auto_199688 )
      ( MAKE-1PILE ?auto_199681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199689 - BLOCK
    )
    :vars
    (
      ?auto_199691 - BLOCK
      ?auto_199694 - BLOCK
      ?auto_199692 - BLOCK
      ?auto_199693 - BLOCK
      ?auto_199690 - BLOCK
      ?auto_199696 - BLOCK
      ?auto_199695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199691 ?auto_199689 ) ( ON-TABLE ?auto_199689 ) ( not ( = ?auto_199689 ?auto_199691 ) ) ( not ( = ?auto_199689 ?auto_199694 ) ) ( not ( = ?auto_199689 ?auto_199692 ) ) ( not ( = ?auto_199691 ?auto_199694 ) ) ( not ( = ?auto_199691 ?auto_199692 ) ) ( not ( = ?auto_199694 ?auto_199692 ) ) ( ON ?auto_199694 ?auto_199691 ) ( ON-TABLE ?auto_199693 ) ( ON ?auto_199690 ?auto_199693 ) ( not ( = ?auto_199693 ?auto_199690 ) ) ( not ( = ?auto_199693 ?auto_199696 ) ) ( not ( = ?auto_199693 ?auto_199695 ) ) ( not ( = ?auto_199693 ?auto_199692 ) ) ( not ( = ?auto_199690 ?auto_199696 ) ) ( not ( = ?auto_199690 ?auto_199695 ) ) ( not ( = ?auto_199690 ?auto_199692 ) ) ( not ( = ?auto_199696 ?auto_199695 ) ) ( not ( = ?auto_199696 ?auto_199692 ) ) ( not ( = ?auto_199695 ?auto_199692 ) ) ( not ( = ?auto_199689 ?auto_199695 ) ) ( not ( = ?auto_199689 ?auto_199693 ) ) ( not ( = ?auto_199689 ?auto_199690 ) ) ( not ( = ?auto_199689 ?auto_199696 ) ) ( not ( = ?auto_199691 ?auto_199695 ) ) ( not ( = ?auto_199691 ?auto_199693 ) ) ( not ( = ?auto_199691 ?auto_199690 ) ) ( not ( = ?auto_199691 ?auto_199696 ) ) ( not ( = ?auto_199694 ?auto_199695 ) ) ( not ( = ?auto_199694 ?auto_199693 ) ) ( not ( = ?auto_199694 ?auto_199690 ) ) ( not ( = ?auto_199694 ?auto_199696 ) ) ( ON ?auto_199692 ?auto_199694 ) ( ON ?auto_199695 ?auto_199692 ) ( CLEAR ?auto_199695 ) ( HOLDING ?auto_199696 ) ( CLEAR ?auto_199690 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199693 ?auto_199690 ?auto_199696 )
      ( MAKE-1PILE ?auto_199689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199697 - BLOCK
    )
    :vars
    (
      ?auto_199699 - BLOCK
      ?auto_199702 - BLOCK
      ?auto_199700 - BLOCK
      ?auto_199704 - BLOCK
      ?auto_199701 - BLOCK
      ?auto_199698 - BLOCK
      ?auto_199703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199699 ?auto_199697 ) ( ON-TABLE ?auto_199697 ) ( not ( = ?auto_199697 ?auto_199699 ) ) ( not ( = ?auto_199697 ?auto_199702 ) ) ( not ( = ?auto_199697 ?auto_199700 ) ) ( not ( = ?auto_199699 ?auto_199702 ) ) ( not ( = ?auto_199699 ?auto_199700 ) ) ( not ( = ?auto_199702 ?auto_199700 ) ) ( ON ?auto_199702 ?auto_199699 ) ( ON-TABLE ?auto_199704 ) ( ON ?auto_199701 ?auto_199704 ) ( not ( = ?auto_199704 ?auto_199701 ) ) ( not ( = ?auto_199704 ?auto_199698 ) ) ( not ( = ?auto_199704 ?auto_199703 ) ) ( not ( = ?auto_199704 ?auto_199700 ) ) ( not ( = ?auto_199701 ?auto_199698 ) ) ( not ( = ?auto_199701 ?auto_199703 ) ) ( not ( = ?auto_199701 ?auto_199700 ) ) ( not ( = ?auto_199698 ?auto_199703 ) ) ( not ( = ?auto_199698 ?auto_199700 ) ) ( not ( = ?auto_199703 ?auto_199700 ) ) ( not ( = ?auto_199697 ?auto_199703 ) ) ( not ( = ?auto_199697 ?auto_199704 ) ) ( not ( = ?auto_199697 ?auto_199701 ) ) ( not ( = ?auto_199697 ?auto_199698 ) ) ( not ( = ?auto_199699 ?auto_199703 ) ) ( not ( = ?auto_199699 ?auto_199704 ) ) ( not ( = ?auto_199699 ?auto_199701 ) ) ( not ( = ?auto_199699 ?auto_199698 ) ) ( not ( = ?auto_199702 ?auto_199703 ) ) ( not ( = ?auto_199702 ?auto_199704 ) ) ( not ( = ?auto_199702 ?auto_199701 ) ) ( not ( = ?auto_199702 ?auto_199698 ) ) ( ON ?auto_199700 ?auto_199702 ) ( ON ?auto_199703 ?auto_199700 ) ( CLEAR ?auto_199701 ) ( ON ?auto_199698 ?auto_199703 ) ( CLEAR ?auto_199698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199697 ?auto_199699 ?auto_199702 ?auto_199700 ?auto_199703 )
      ( MAKE-1PILE ?auto_199697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199705 - BLOCK
    )
    :vars
    (
      ?auto_199711 - BLOCK
      ?auto_199706 - BLOCK
      ?auto_199712 - BLOCK
      ?auto_199710 - BLOCK
      ?auto_199708 - BLOCK
      ?auto_199707 - BLOCK
      ?auto_199709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199711 ?auto_199705 ) ( ON-TABLE ?auto_199705 ) ( not ( = ?auto_199705 ?auto_199711 ) ) ( not ( = ?auto_199705 ?auto_199706 ) ) ( not ( = ?auto_199705 ?auto_199712 ) ) ( not ( = ?auto_199711 ?auto_199706 ) ) ( not ( = ?auto_199711 ?auto_199712 ) ) ( not ( = ?auto_199706 ?auto_199712 ) ) ( ON ?auto_199706 ?auto_199711 ) ( ON-TABLE ?auto_199710 ) ( not ( = ?auto_199710 ?auto_199708 ) ) ( not ( = ?auto_199710 ?auto_199707 ) ) ( not ( = ?auto_199710 ?auto_199709 ) ) ( not ( = ?auto_199710 ?auto_199712 ) ) ( not ( = ?auto_199708 ?auto_199707 ) ) ( not ( = ?auto_199708 ?auto_199709 ) ) ( not ( = ?auto_199708 ?auto_199712 ) ) ( not ( = ?auto_199707 ?auto_199709 ) ) ( not ( = ?auto_199707 ?auto_199712 ) ) ( not ( = ?auto_199709 ?auto_199712 ) ) ( not ( = ?auto_199705 ?auto_199709 ) ) ( not ( = ?auto_199705 ?auto_199710 ) ) ( not ( = ?auto_199705 ?auto_199708 ) ) ( not ( = ?auto_199705 ?auto_199707 ) ) ( not ( = ?auto_199711 ?auto_199709 ) ) ( not ( = ?auto_199711 ?auto_199710 ) ) ( not ( = ?auto_199711 ?auto_199708 ) ) ( not ( = ?auto_199711 ?auto_199707 ) ) ( not ( = ?auto_199706 ?auto_199709 ) ) ( not ( = ?auto_199706 ?auto_199710 ) ) ( not ( = ?auto_199706 ?auto_199708 ) ) ( not ( = ?auto_199706 ?auto_199707 ) ) ( ON ?auto_199712 ?auto_199706 ) ( ON ?auto_199709 ?auto_199712 ) ( ON ?auto_199707 ?auto_199709 ) ( CLEAR ?auto_199707 ) ( HOLDING ?auto_199708 ) ( CLEAR ?auto_199710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199710 ?auto_199708 )
      ( MAKE-1PILE ?auto_199705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199713 - BLOCK
    )
    :vars
    (
      ?auto_199718 - BLOCK
      ?auto_199714 - BLOCK
      ?auto_199719 - BLOCK
      ?auto_199720 - BLOCK
      ?auto_199717 - BLOCK
      ?auto_199715 - BLOCK
      ?auto_199716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199718 ?auto_199713 ) ( ON-TABLE ?auto_199713 ) ( not ( = ?auto_199713 ?auto_199718 ) ) ( not ( = ?auto_199713 ?auto_199714 ) ) ( not ( = ?auto_199713 ?auto_199719 ) ) ( not ( = ?auto_199718 ?auto_199714 ) ) ( not ( = ?auto_199718 ?auto_199719 ) ) ( not ( = ?auto_199714 ?auto_199719 ) ) ( ON ?auto_199714 ?auto_199718 ) ( ON-TABLE ?auto_199720 ) ( not ( = ?auto_199720 ?auto_199717 ) ) ( not ( = ?auto_199720 ?auto_199715 ) ) ( not ( = ?auto_199720 ?auto_199716 ) ) ( not ( = ?auto_199720 ?auto_199719 ) ) ( not ( = ?auto_199717 ?auto_199715 ) ) ( not ( = ?auto_199717 ?auto_199716 ) ) ( not ( = ?auto_199717 ?auto_199719 ) ) ( not ( = ?auto_199715 ?auto_199716 ) ) ( not ( = ?auto_199715 ?auto_199719 ) ) ( not ( = ?auto_199716 ?auto_199719 ) ) ( not ( = ?auto_199713 ?auto_199716 ) ) ( not ( = ?auto_199713 ?auto_199720 ) ) ( not ( = ?auto_199713 ?auto_199717 ) ) ( not ( = ?auto_199713 ?auto_199715 ) ) ( not ( = ?auto_199718 ?auto_199716 ) ) ( not ( = ?auto_199718 ?auto_199720 ) ) ( not ( = ?auto_199718 ?auto_199717 ) ) ( not ( = ?auto_199718 ?auto_199715 ) ) ( not ( = ?auto_199714 ?auto_199716 ) ) ( not ( = ?auto_199714 ?auto_199720 ) ) ( not ( = ?auto_199714 ?auto_199717 ) ) ( not ( = ?auto_199714 ?auto_199715 ) ) ( ON ?auto_199719 ?auto_199714 ) ( ON ?auto_199716 ?auto_199719 ) ( ON ?auto_199715 ?auto_199716 ) ( CLEAR ?auto_199720 ) ( ON ?auto_199717 ?auto_199715 ) ( CLEAR ?auto_199717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199713 ?auto_199718 ?auto_199714 ?auto_199719 ?auto_199716 ?auto_199715 )
      ( MAKE-1PILE ?auto_199713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199721 - BLOCK
    )
    :vars
    (
      ?auto_199724 - BLOCK
      ?auto_199726 - BLOCK
      ?auto_199725 - BLOCK
      ?auto_199728 - BLOCK
      ?auto_199727 - BLOCK
      ?auto_199723 - BLOCK
      ?auto_199722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199724 ?auto_199721 ) ( ON-TABLE ?auto_199721 ) ( not ( = ?auto_199721 ?auto_199724 ) ) ( not ( = ?auto_199721 ?auto_199726 ) ) ( not ( = ?auto_199721 ?auto_199725 ) ) ( not ( = ?auto_199724 ?auto_199726 ) ) ( not ( = ?auto_199724 ?auto_199725 ) ) ( not ( = ?auto_199726 ?auto_199725 ) ) ( ON ?auto_199726 ?auto_199724 ) ( not ( = ?auto_199728 ?auto_199727 ) ) ( not ( = ?auto_199728 ?auto_199723 ) ) ( not ( = ?auto_199728 ?auto_199722 ) ) ( not ( = ?auto_199728 ?auto_199725 ) ) ( not ( = ?auto_199727 ?auto_199723 ) ) ( not ( = ?auto_199727 ?auto_199722 ) ) ( not ( = ?auto_199727 ?auto_199725 ) ) ( not ( = ?auto_199723 ?auto_199722 ) ) ( not ( = ?auto_199723 ?auto_199725 ) ) ( not ( = ?auto_199722 ?auto_199725 ) ) ( not ( = ?auto_199721 ?auto_199722 ) ) ( not ( = ?auto_199721 ?auto_199728 ) ) ( not ( = ?auto_199721 ?auto_199727 ) ) ( not ( = ?auto_199721 ?auto_199723 ) ) ( not ( = ?auto_199724 ?auto_199722 ) ) ( not ( = ?auto_199724 ?auto_199728 ) ) ( not ( = ?auto_199724 ?auto_199727 ) ) ( not ( = ?auto_199724 ?auto_199723 ) ) ( not ( = ?auto_199726 ?auto_199722 ) ) ( not ( = ?auto_199726 ?auto_199728 ) ) ( not ( = ?auto_199726 ?auto_199727 ) ) ( not ( = ?auto_199726 ?auto_199723 ) ) ( ON ?auto_199725 ?auto_199726 ) ( ON ?auto_199722 ?auto_199725 ) ( ON ?auto_199723 ?auto_199722 ) ( ON ?auto_199727 ?auto_199723 ) ( CLEAR ?auto_199727 ) ( HOLDING ?auto_199728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199728 )
      ( MAKE-1PILE ?auto_199721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199729 - BLOCK
    )
    :vars
    (
      ?auto_199735 - BLOCK
      ?auto_199733 - BLOCK
      ?auto_199734 - BLOCK
      ?auto_199732 - BLOCK
      ?auto_199730 - BLOCK
      ?auto_199731 - BLOCK
      ?auto_199736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199735 ?auto_199729 ) ( ON-TABLE ?auto_199729 ) ( not ( = ?auto_199729 ?auto_199735 ) ) ( not ( = ?auto_199729 ?auto_199733 ) ) ( not ( = ?auto_199729 ?auto_199734 ) ) ( not ( = ?auto_199735 ?auto_199733 ) ) ( not ( = ?auto_199735 ?auto_199734 ) ) ( not ( = ?auto_199733 ?auto_199734 ) ) ( ON ?auto_199733 ?auto_199735 ) ( not ( = ?auto_199732 ?auto_199730 ) ) ( not ( = ?auto_199732 ?auto_199731 ) ) ( not ( = ?auto_199732 ?auto_199736 ) ) ( not ( = ?auto_199732 ?auto_199734 ) ) ( not ( = ?auto_199730 ?auto_199731 ) ) ( not ( = ?auto_199730 ?auto_199736 ) ) ( not ( = ?auto_199730 ?auto_199734 ) ) ( not ( = ?auto_199731 ?auto_199736 ) ) ( not ( = ?auto_199731 ?auto_199734 ) ) ( not ( = ?auto_199736 ?auto_199734 ) ) ( not ( = ?auto_199729 ?auto_199736 ) ) ( not ( = ?auto_199729 ?auto_199732 ) ) ( not ( = ?auto_199729 ?auto_199730 ) ) ( not ( = ?auto_199729 ?auto_199731 ) ) ( not ( = ?auto_199735 ?auto_199736 ) ) ( not ( = ?auto_199735 ?auto_199732 ) ) ( not ( = ?auto_199735 ?auto_199730 ) ) ( not ( = ?auto_199735 ?auto_199731 ) ) ( not ( = ?auto_199733 ?auto_199736 ) ) ( not ( = ?auto_199733 ?auto_199732 ) ) ( not ( = ?auto_199733 ?auto_199730 ) ) ( not ( = ?auto_199733 ?auto_199731 ) ) ( ON ?auto_199734 ?auto_199733 ) ( ON ?auto_199736 ?auto_199734 ) ( ON ?auto_199731 ?auto_199736 ) ( ON ?auto_199730 ?auto_199731 ) ( ON ?auto_199732 ?auto_199730 ) ( CLEAR ?auto_199732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199729 ?auto_199735 ?auto_199733 ?auto_199734 ?auto_199736 ?auto_199731 ?auto_199730 )
      ( MAKE-1PILE ?auto_199729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199737 - BLOCK
    )
    :vars
    (
      ?auto_199738 - BLOCK
      ?auto_199743 - BLOCK
      ?auto_199741 - BLOCK
      ?auto_199740 - BLOCK
      ?auto_199744 - BLOCK
      ?auto_199739 - BLOCK
      ?auto_199742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199738 ?auto_199737 ) ( ON-TABLE ?auto_199737 ) ( not ( = ?auto_199737 ?auto_199738 ) ) ( not ( = ?auto_199737 ?auto_199743 ) ) ( not ( = ?auto_199737 ?auto_199741 ) ) ( not ( = ?auto_199738 ?auto_199743 ) ) ( not ( = ?auto_199738 ?auto_199741 ) ) ( not ( = ?auto_199743 ?auto_199741 ) ) ( ON ?auto_199743 ?auto_199738 ) ( not ( = ?auto_199740 ?auto_199744 ) ) ( not ( = ?auto_199740 ?auto_199739 ) ) ( not ( = ?auto_199740 ?auto_199742 ) ) ( not ( = ?auto_199740 ?auto_199741 ) ) ( not ( = ?auto_199744 ?auto_199739 ) ) ( not ( = ?auto_199744 ?auto_199742 ) ) ( not ( = ?auto_199744 ?auto_199741 ) ) ( not ( = ?auto_199739 ?auto_199742 ) ) ( not ( = ?auto_199739 ?auto_199741 ) ) ( not ( = ?auto_199742 ?auto_199741 ) ) ( not ( = ?auto_199737 ?auto_199742 ) ) ( not ( = ?auto_199737 ?auto_199740 ) ) ( not ( = ?auto_199737 ?auto_199744 ) ) ( not ( = ?auto_199737 ?auto_199739 ) ) ( not ( = ?auto_199738 ?auto_199742 ) ) ( not ( = ?auto_199738 ?auto_199740 ) ) ( not ( = ?auto_199738 ?auto_199744 ) ) ( not ( = ?auto_199738 ?auto_199739 ) ) ( not ( = ?auto_199743 ?auto_199742 ) ) ( not ( = ?auto_199743 ?auto_199740 ) ) ( not ( = ?auto_199743 ?auto_199744 ) ) ( not ( = ?auto_199743 ?auto_199739 ) ) ( ON ?auto_199741 ?auto_199743 ) ( ON ?auto_199742 ?auto_199741 ) ( ON ?auto_199739 ?auto_199742 ) ( ON ?auto_199744 ?auto_199739 ) ( HOLDING ?auto_199740 ) ( CLEAR ?auto_199744 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199737 ?auto_199738 ?auto_199743 ?auto_199741 ?auto_199742 ?auto_199739 ?auto_199744 ?auto_199740 )
      ( MAKE-1PILE ?auto_199737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199745 - BLOCK
    )
    :vars
    (
      ?auto_199749 - BLOCK
      ?auto_199746 - BLOCK
      ?auto_199750 - BLOCK
      ?auto_199748 - BLOCK
      ?auto_199752 - BLOCK
      ?auto_199747 - BLOCK
      ?auto_199751 - BLOCK
      ?auto_199753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199749 ?auto_199745 ) ( ON-TABLE ?auto_199745 ) ( not ( = ?auto_199745 ?auto_199749 ) ) ( not ( = ?auto_199745 ?auto_199746 ) ) ( not ( = ?auto_199745 ?auto_199750 ) ) ( not ( = ?auto_199749 ?auto_199746 ) ) ( not ( = ?auto_199749 ?auto_199750 ) ) ( not ( = ?auto_199746 ?auto_199750 ) ) ( ON ?auto_199746 ?auto_199749 ) ( not ( = ?auto_199748 ?auto_199752 ) ) ( not ( = ?auto_199748 ?auto_199747 ) ) ( not ( = ?auto_199748 ?auto_199751 ) ) ( not ( = ?auto_199748 ?auto_199750 ) ) ( not ( = ?auto_199752 ?auto_199747 ) ) ( not ( = ?auto_199752 ?auto_199751 ) ) ( not ( = ?auto_199752 ?auto_199750 ) ) ( not ( = ?auto_199747 ?auto_199751 ) ) ( not ( = ?auto_199747 ?auto_199750 ) ) ( not ( = ?auto_199751 ?auto_199750 ) ) ( not ( = ?auto_199745 ?auto_199751 ) ) ( not ( = ?auto_199745 ?auto_199748 ) ) ( not ( = ?auto_199745 ?auto_199752 ) ) ( not ( = ?auto_199745 ?auto_199747 ) ) ( not ( = ?auto_199749 ?auto_199751 ) ) ( not ( = ?auto_199749 ?auto_199748 ) ) ( not ( = ?auto_199749 ?auto_199752 ) ) ( not ( = ?auto_199749 ?auto_199747 ) ) ( not ( = ?auto_199746 ?auto_199751 ) ) ( not ( = ?auto_199746 ?auto_199748 ) ) ( not ( = ?auto_199746 ?auto_199752 ) ) ( not ( = ?auto_199746 ?auto_199747 ) ) ( ON ?auto_199750 ?auto_199746 ) ( ON ?auto_199751 ?auto_199750 ) ( ON ?auto_199747 ?auto_199751 ) ( ON ?auto_199752 ?auto_199747 ) ( CLEAR ?auto_199752 ) ( ON ?auto_199748 ?auto_199753 ) ( CLEAR ?auto_199748 ) ( HAND-EMPTY ) ( not ( = ?auto_199745 ?auto_199753 ) ) ( not ( = ?auto_199749 ?auto_199753 ) ) ( not ( = ?auto_199746 ?auto_199753 ) ) ( not ( = ?auto_199750 ?auto_199753 ) ) ( not ( = ?auto_199748 ?auto_199753 ) ) ( not ( = ?auto_199752 ?auto_199753 ) ) ( not ( = ?auto_199747 ?auto_199753 ) ) ( not ( = ?auto_199751 ?auto_199753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199748 ?auto_199753 )
      ( MAKE-1PILE ?auto_199745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199754 - BLOCK
    )
    :vars
    (
      ?auto_199756 - BLOCK
      ?auto_199755 - BLOCK
      ?auto_199758 - BLOCK
      ?auto_199757 - BLOCK
      ?auto_199759 - BLOCK
      ?auto_199760 - BLOCK
      ?auto_199761 - BLOCK
      ?auto_199762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199756 ?auto_199754 ) ( ON-TABLE ?auto_199754 ) ( not ( = ?auto_199754 ?auto_199756 ) ) ( not ( = ?auto_199754 ?auto_199755 ) ) ( not ( = ?auto_199754 ?auto_199758 ) ) ( not ( = ?auto_199756 ?auto_199755 ) ) ( not ( = ?auto_199756 ?auto_199758 ) ) ( not ( = ?auto_199755 ?auto_199758 ) ) ( ON ?auto_199755 ?auto_199756 ) ( not ( = ?auto_199757 ?auto_199759 ) ) ( not ( = ?auto_199757 ?auto_199760 ) ) ( not ( = ?auto_199757 ?auto_199761 ) ) ( not ( = ?auto_199757 ?auto_199758 ) ) ( not ( = ?auto_199759 ?auto_199760 ) ) ( not ( = ?auto_199759 ?auto_199761 ) ) ( not ( = ?auto_199759 ?auto_199758 ) ) ( not ( = ?auto_199760 ?auto_199761 ) ) ( not ( = ?auto_199760 ?auto_199758 ) ) ( not ( = ?auto_199761 ?auto_199758 ) ) ( not ( = ?auto_199754 ?auto_199761 ) ) ( not ( = ?auto_199754 ?auto_199757 ) ) ( not ( = ?auto_199754 ?auto_199759 ) ) ( not ( = ?auto_199754 ?auto_199760 ) ) ( not ( = ?auto_199756 ?auto_199761 ) ) ( not ( = ?auto_199756 ?auto_199757 ) ) ( not ( = ?auto_199756 ?auto_199759 ) ) ( not ( = ?auto_199756 ?auto_199760 ) ) ( not ( = ?auto_199755 ?auto_199761 ) ) ( not ( = ?auto_199755 ?auto_199757 ) ) ( not ( = ?auto_199755 ?auto_199759 ) ) ( not ( = ?auto_199755 ?auto_199760 ) ) ( ON ?auto_199758 ?auto_199755 ) ( ON ?auto_199761 ?auto_199758 ) ( ON ?auto_199760 ?auto_199761 ) ( ON ?auto_199757 ?auto_199762 ) ( CLEAR ?auto_199757 ) ( not ( = ?auto_199754 ?auto_199762 ) ) ( not ( = ?auto_199756 ?auto_199762 ) ) ( not ( = ?auto_199755 ?auto_199762 ) ) ( not ( = ?auto_199758 ?auto_199762 ) ) ( not ( = ?auto_199757 ?auto_199762 ) ) ( not ( = ?auto_199759 ?auto_199762 ) ) ( not ( = ?auto_199760 ?auto_199762 ) ) ( not ( = ?auto_199761 ?auto_199762 ) ) ( HOLDING ?auto_199759 ) ( CLEAR ?auto_199760 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199754 ?auto_199756 ?auto_199755 ?auto_199758 ?auto_199761 ?auto_199760 ?auto_199759 )
      ( MAKE-1PILE ?auto_199754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199763 - BLOCK
    )
    :vars
    (
      ?auto_199768 - BLOCK
      ?auto_199764 - BLOCK
      ?auto_199765 - BLOCK
      ?auto_199770 - BLOCK
      ?auto_199766 - BLOCK
      ?auto_199767 - BLOCK
      ?auto_199769 - BLOCK
      ?auto_199771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199768 ?auto_199763 ) ( ON-TABLE ?auto_199763 ) ( not ( = ?auto_199763 ?auto_199768 ) ) ( not ( = ?auto_199763 ?auto_199764 ) ) ( not ( = ?auto_199763 ?auto_199765 ) ) ( not ( = ?auto_199768 ?auto_199764 ) ) ( not ( = ?auto_199768 ?auto_199765 ) ) ( not ( = ?auto_199764 ?auto_199765 ) ) ( ON ?auto_199764 ?auto_199768 ) ( not ( = ?auto_199770 ?auto_199766 ) ) ( not ( = ?auto_199770 ?auto_199767 ) ) ( not ( = ?auto_199770 ?auto_199769 ) ) ( not ( = ?auto_199770 ?auto_199765 ) ) ( not ( = ?auto_199766 ?auto_199767 ) ) ( not ( = ?auto_199766 ?auto_199769 ) ) ( not ( = ?auto_199766 ?auto_199765 ) ) ( not ( = ?auto_199767 ?auto_199769 ) ) ( not ( = ?auto_199767 ?auto_199765 ) ) ( not ( = ?auto_199769 ?auto_199765 ) ) ( not ( = ?auto_199763 ?auto_199769 ) ) ( not ( = ?auto_199763 ?auto_199770 ) ) ( not ( = ?auto_199763 ?auto_199766 ) ) ( not ( = ?auto_199763 ?auto_199767 ) ) ( not ( = ?auto_199768 ?auto_199769 ) ) ( not ( = ?auto_199768 ?auto_199770 ) ) ( not ( = ?auto_199768 ?auto_199766 ) ) ( not ( = ?auto_199768 ?auto_199767 ) ) ( not ( = ?auto_199764 ?auto_199769 ) ) ( not ( = ?auto_199764 ?auto_199770 ) ) ( not ( = ?auto_199764 ?auto_199766 ) ) ( not ( = ?auto_199764 ?auto_199767 ) ) ( ON ?auto_199765 ?auto_199764 ) ( ON ?auto_199769 ?auto_199765 ) ( ON ?auto_199767 ?auto_199769 ) ( ON ?auto_199770 ?auto_199771 ) ( not ( = ?auto_199763 ?auto_199771 ) ) ( not ( = ?auto_199768 ?auto_199771 ) ) ( not ( = ?auto_199764 ?auto_199771 ) ) ( not ( = ?auto_199765 ?auto_199771 ) ) ( not ( = ?auto_199770 ?auto_199771 ) ) ( not ( = ?auto_199766 ?auto_199771 ) ) ( not ( = ?auto_199767 ?auto_199771 ) ) ( not ( = ?auto_199769 ?auto_199771 ) ) ( CLEAR ?auto_199767 ) ( ON ?auto_199766 ?auto_199770 ) ( CLEAR ?auto_199766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199771 ?auto_199770 )
      ( MAKE-1PILE ?auto_199763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199772 - BLOCK
    )
    :vars
    (
      ?auto_199775 - BLOCK
      ?auto_199779 - BLOCK
      ?auto_199778 - BLOCK
      ?auto_199780 - BLOCK
      ?auto_199777 - BLOCK
      ?auto_199776 - BLOCK
      ?auto_199773 - BLOCK
      ?auto_199774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199775 ?auto_199772 ) ( ON-TABLE ?auto_199772 ) ( not ( = ?auto_199772 ?auto_199775 ) ) ( not ( = ?auto_199772 ?auto_199779 ) ) ( not ( = ?auto_199772 ?auto_199778 ) ) ( not ( = ?auto_199775 ?auto_199779 ) ) ( not ( = ?auto_199775 ?auto_199778 ) ) ( not ( = ?auto_199779 ?auto_199778 ) ) ( ON ?auto_199779 ?auto_199775 ) ( not ( = ?auto_199780 ?auto_199777 ) ) ( not ( = ?auto_199780 ?auto_199776 ) ) ( not ( = ?auto_199780 ?auto_199773 ) ) ( not ( = ?auto_199780 ?auto_199778 ) ) ( not ( = ?auto_199777 ?auto_199776 ) ) ( not ( = ?auto_199777 ?auto_199773 ) ) ( not ( = ?auto_199777 ?auto_199778 ) ) ( not ( = ?auto_199776 ?auto_199773 ) ) ( not ( = ?auto_199776 ?auto_199778 ) ) ( not ( = ?auto_199773 ?auto_199778 ) ) ( not ( = ?auto_199772 ?auto_199773 ) ) ( not ( = ?auto_199772 ?auto_199780 ) ) ( not ( = ?auto_199772 ?auto_199777 ) ) ( not ( = ?auto_199772 ?auto_199776 ) ) ( not ( = ?auto_199775 ?auto_199773 ) ) ( not ( = ?auto_199775 ?auto_199780 ) ) ( not ( = ?auto_199775 ?auto_199777 ) ) ( not ( = ?auto_199775 ?auto_199776 ) ) ( not ( = ?auto_199779 ?auto_199773 ) ) ( not ( = ?auto_199779 ?auto_199780 ) ) ( not ( = ?auto_199779 ?auto_199777 ) ) ( not ( = ?auto_199779 ?auto_199776 ) ) ( ON ?auto_199778 ?auto_199779 ) ( ON ?auto_199773 ?auto_199778 ) ( ON ?auto_199780 ?auto_199774 ) ( not ( = ?auto_199772 ?auto_199774 ) ) ( not ( = ?auto_199775 ?auto_199774 ) ) ( not ( = ?auto_199779 ?auto_199774 ) ) ( not ( = ?auto_199778 ?auto_199774 ) ) ( not ( = ?auto_199780 ?auto_199774 ) ) ( not ( = ?auto_199777 ?auto_199774 ) ) ( not ( = ?auto_199776 ?auto_199774 ) ) ( not ( = ?auto_199773 ?auto_199774 ) ) ( ON ?auto_199777 ?auto_199780 ) ( CLEAR ?auto_199777 ) ( ON-TABLE ?auto_199774 ) ( HOLDING ?auto_199776 ) ( CLEAR ?auto_199773 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199772 ?auto_199775 ?auto_199779 ?auto_199778 ?auto_199773 ?auto_199776 )
      ( MAKE-1PILE ?auto_199772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199781 - BLOCK
    )
    :vars
    (
      ?auto_199786 - BLOCK
      ?auto_199782 - BLOCK
      ?auto_199783 - BLOCK
      ?auto_199787 - BLOCK
      ?auto_199788 - BLOCK
      ?auto_199785 - BLOCK
      ?auto_199789 - BLOCK
      ?auto_199784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199786 ?auto_199781 ) ( ON-TABLE ?auto_199781 ) ( not ( = ?auto_199781 ?auto_199786 ) ) ( not ( = ?auto_199781 ?auto_199782 ) ) ( not ( = ?auto_199781 ?auto_199783 ) ) ( not ( = ?auto_199786 ?auto_199782 ) ) ( not ( = ?auto_199786 ?auto_199783 ) ) ( not ( = ?auto_199782 ?auto_199783 ) ) ( ON ?auto_199782 ?auto_199786 ) ( not ( = ?auto_199787 ?auto_199788 ) ) ( not ( = ?auto_199787 ?auto_199785 ) ) ( not ( = ?auto_199787 ?auto_199789 ) ) ( not ( = ?auto_199787 ?auto_199783 ) ) ( not ( = ?auto_199788 ?auto_199785 ) ) ( not ( = ?auto_199788 ?auto_199789 ) ) ( not ( = ?auto_199788 ?auto_199783 ) ) ( not ( = ?auto_199785 ?auto_199789 ) ) ( not ( = ?auto_199785 ?auto_199783 ) ) ( not ( = ?auto_199789 ?auto_199783 ) ) ( not ( = ?auto_199781 ?auto_199789 ) ) ( not ( = ?auto_199781 ?auto_199787 ) ) ( not ( = ?auto_199781 ?auto_199788 ) ) ( not ( = ?auto_199781 ?auto_199785 ) ) ( not ( = ?auto_199786 ?auto_199789 ) ) ( not ( = ?auto_199786 ?auto_199787 ) ) ( not ( = ?auto_199786 ?auto_199788 ) ) ( not ( = ?auto_199786 ?auto_199785 ) ) ( not ( = ?auto_199782 ?auto_199789 ) ) ( not ( = ?auto_199782 ?auto_199787 ) ) ( not ( = ?auto_199782 ?auto_199788 ) ) ( not ( = ?auto_199782 ?auto_199785 ) ) ( ON ?auto_199783 ?auto_199782 ) ( ON ?auto_199789 ?auto_199783 ) ( ON ?auto_199787 ?auto_199784 ) ( not ( = ?auto_199781 ?auto_199784 ) ) ( not ( = ?auto_199786 ?auto_199784 ) ) ( not ( = ?auto_199782 ?auto_199784 ) ) ( not ( = ?auto_199783 ?auto_199784 ) ) ( not ( = ?auto_199787 ?auto_199784 ) ) ( not ( = ?auto_199788 ?auto_199784 ) ) ( not ( = ?auto_199785 ?auto_199784 ) ) ( not ( = ?auto_199789 ?auto_199784 ) ) ( ON ?auto_199788 ?auto_199787 ) ( ON-TABLE ?auto_199784 ) ( CLEAR ?auto_199789 ) ( ON ?auto_199785 ?auto_199788 ) ( CLEAR ?auto_199785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199784 ?auto_199787 ?auto_199788 )
      ( MAKE-1PILE ?auto_199781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199790 - BLOCK
    )
    :vars
    (
      ?auto_199793 - BLOCK
      ?auto_199795 - BLOCK
      ?auto_199792 - BLOCK
      ?auto_199791 - BLOCK
      ?auto_199797 - BLOCK
      ?auto_199794 - BLOCK
      ?auto_199798 - BLOCK
      ?auto_199796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199793 ?auto_199790 ) ( ON-TABLE ?auto_199790 ) ( not ( = ?auto_199790 ?auto_199793 ) ) ( not ( = ?auto_199790 ?auto_199795 ) ) ( not ( = ?auto_199790 ?auto_199792 ) ) ( not ( = ?auto_199793 ?auto_199795 ) ) ( not ( = ?auto_199793 ?auto_199792 ) ) ( not ( = ?auto_199795 ?auto_199792 ) ) ( ON ?auto_199795 ?auto_199793 ) ( not ( = ?auto_199791 ?auto_199797 ) ) ( not ( = ?auto_199791 ?auto_199794 ) ) ( not ( = ?auto_199791 ?auto_199798 ) ) ( not ( = ?auto_199791 ?auto_199792 ) ) ( not ( = ?auto_199797 ?auto_199794 ) ) ( not ( = ?auto_199797 ?auto_199798 ) ) ( not ( = ?auto_199797 ?auto_199792 ) ) ( not ( = ?auto_199794 ?auto_199798 ) ) ( not ( = ?auto_199794 ?auto_199792 ) ) ( not ( = ?auto_199798 ?auto_199792 ) ) ( not ( = ?auto_199790 ?auto_199798 ) ) ( not ( = ?auto_199790 ?auto_199791 ) ) ( not ( = ?auto_199790 ?auto_199797 ) ) ( not ( = ?auto_199790 ?auto_199794 ) ) ( not ( = ?auto_199793 ?auto_199798 ) ) ( not ( = ?auto_199793 ?auto_199791 ) ) ( not ( = ?auto_199793 ?auto_199797 ) ) ( not ( = ?auto_199793 ?auto_199794 ) ) ( not ( = ?auto_199795 ?auto_199798 ) ) ( not ( = ?auto_199795 ?auto_199791 ) ) ( not ( = ?auto_199795 ?auto_199797 ) ) ( not ( = ?auto_199795 ?auto_199794 ) ) ( ON ?auto_199792 ?auto_199795 ) ( ON ?auto_199791 ?auto_199796 ) ( not ( = ?auto_199790 ?auto_199796 ) ) ( not ( = ?auto_199793 ?auto_199796 ) ) ( not ( = ?auto_199795 ?auto_199796 ) ) ( not ( = ?auto_199792 ?auto_199796 ) ) ( not ( = ?auto_199791 ?auto_199796 ) ) ( not ( = ?auto_199797 ?auto_199796 ) ) ( not ( = ?auto_199794 ?auto_199796 ) ) ( not ( = ?auto_199798 ?auto_199796 ) ) ( ON ?auto_199797 ?auto_199791 ) ( ON-TABLE ?auto_199796 ) ( ON ?auto_199794 ?auto_199797 ) ( CLEAR ?auto_199794 ) ( HOLDING ?auto_199798 ) ( CLEAR ?auto_199792 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199790 ?auto_199793 ?auto_199795 ?auto_199792 ?auto_199798 )
      ( MAKE-1PILE ?auto_199790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199799 - BLOCK
    )
    :vars
    (
      ?auto_199803 - BLOCK
      ?auto_199805 - BLOCK
      ?auto_199801 - BLOCK
      ?auto_199804 - BLOCK
      ?auto_199800 - BLOCK
      ?auto_199806 - BLOCK
      ?auto_199802 - BLOCK
      ?auto_199807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199803 ?auto_199799 ) ( ON-TABLE ?auto_199799 ) ( not ( = ?auto_199799 ?auto_199803 ) ) ( not ( = ?auto_199799 ?auto_199805 ) ) ( not ( = ?auto_199799 ?auto_199801 ) ) ( not ( = ?auto_199803 ?auto_199805 ) ) ( not ( = ?auto_199803 ?auto_199801 ) ) ( not ( = ?auto_199805 ?auto_199801 ) ) ( ON ?auto_199805 ?auto_199803 ) ( not ( = ?auto_199804 ?auto_199800 ) ) ( not ( = ?auto_199804 ?auto_199806 ) ) ( not ( = ?auto_199804 ?auto_199802 ) ) ( not ( = ?auto_199804 ?auto_199801 ) ) ( not ( = ?auto_199800 ?auto_199806 ) ) ( not ( = ?auto_199800 ?auto_199802 ) ) ( not ( = ?auto_199800 ?auto_199801 ) ) ( not ( = ?auto_199806 ?auto_199802 ) ) ( not ( = ?auto_199806 ?auto_199801 ) ) ( not ( = ?auto_199802 ?auto_199801 ) ) ( not ( = ?auto_199799 ?auto_199802 ) ) ( not ( = ?auto_199799 ?auto_199804 ) ) ( not ( = ?auto_199799 ?auto_199800 ) ) ( not ( = ?auto_199799 ?auto_199806 ) ) ( not ( = ?auto_199803 ?auto_199802 ) ) ( not ( = ?auto_199803 ?auto_199804 ) ) ( not ( = ?auto_199803 ?auto_199800 ) ) ( not ( = ?auto_199803 ?auto_199806 ) ) ( not ( = ?auto_199805 ?auto_199802 ) ) ( not ( = ?auto_199805 ?auto_199804 ) ) ( not ( = ?auto_199805 ?auto_199800 ) ) ( not ( = ?auto_199805 ?auto_199806 ) ) ( ON ?auto_199801 ?auto_199805 ) ( ON ?auto_199804 ?auto_199807 ) ( not ( = ?auto_199799 ?auto_199807 ) ) ( not ( = ?auto_199803 ?auto_199807 ) ) ( not ( = ?auto_199805 ?auto_199807 ) ) ( not ( = ?auto_199801 ?auto_199807 ) ) ( not ( = ?auto_199804 ?auto_199807 ) ) ( not ( = ?auto_199800 ?auto_199807 ) ) ( not ( = ?auto_199806 ?auto_199807 ) ) ( not ( = ?auto_199802 ?auto_199807 ) ) ( ON ?auto_199800 ?auto_199804 ) ( ON-TABLE ?auto_199807 ) ( ON ?auto_199806 ?auto_199800 ) ( CLEAR ?auto_199801 ) ( ON ?auto_199802 ?auto_199806 ) ( CLEAR ?auto_199802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199807 ?auto_199804 ?auto_199800 ?auto_199806 )
      ( MAKE-1PILE ?auto_199799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199808 - BLOCK
    )
    :vars
    (
      ?auto_199811 - BLOCK
      ?auto_199815 - BLOCK
      ?auto_199812 - BLOCK
      ?auto_199809 - BLOCK
      ?auto_199814 - BLOCK
      ?auto_199816 - BLOCK
      ?auto_199810 - BLOCK
      ?auto_199813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199811 ?auto_199808 ) ( ON-TABLE ?auto_199808 ) ( not ( = ?auto_199808 ?auto_199811 ) ) ( not ( = ?auto_199808 ?auto_199815 ) ) ( not ( = ?auto_199808 ?auto_199812 ) ) ( not ( = ?auto_199811 ?auto_199815 ) ) ( not ( = ?auto_199811 ?auto_199812 ) ) ( not ( = ?auto_199815 ?auto_199812 ) ) ( ON ?auto_199815 ?auto_199811 ) ( not ( = ?auto_199809 ?auto_199814 ) ) ( not ( = ?auto_199809 ?auto_199816 ) ) ( not ( = ?auto_199809 ?auto_199810 ) ) ( not ( = ?auto_199809 ?auto_199812 ) ) ( not ( = ?auto_199814 ?auto_199816 ) ) ( not ( = ?auto_199814 ?auto_199810 ) ) ( not ( = ?auto_199814 ?auto_199812 ) ) ( not ( = ?auto_199816 ?auto_199810 ) ) ( not ( = ?auto_199816 ?auto_199812 ) ) ( not ( = ?auto_199810 ?auto_199812 ) ) ( not ( = ?auto_199808 ?auto_199810 ) ) ( not ( = ?auto_199808 ?auto_199809 ) ) ( not ( = ?auto_199808 ?auto_199814 ) ) ( not ( = ?auto_199808 ?auto_199816 ) ) ( not ( = ?auto_199811 ?auto_199810 ) ) ( not ( = ?auto_199811 ?auto_199809 ) ) ( not ( = ?auto_199811 ?auto_199814 ) ) ( not ( = ?auto_199811 ?auto_199816 ) ) ( not ( = ?auto_199815 ?auto_199810 ) ) ( not ( = ?auto_199815 ?auto_199809 ) ) ( not ( = ?auto_199815 ?auto_199814 ) ) ( not ( = ?auto_199815 ?auto_199816 ) ) ( ON ?auto_199809 ?auto_199813 ) ( not ( = ?auto_199808 ?auto_199813 ) ) ( not ( = ?auto_199811 ?auto_199813 ) ) ( not ( = ?auto_199815 ?auto_199813 ) ) ( not ( = ?auto_199812 ?auto_199813 ) ) ( not ( = ?auto_199809 ?auto_199813 ) ) ( not ( = ?auto_199814 ?auto_199813 ) ) ( not ( = ?auto_199816 ?auto_199813 ) ) ( not ( = ?auto_199810 ?auto_199813 ) ) ( ON ?auto_199814 ?auto_199809 ) ( ON-TABLE ?auto_199813 ) ( ON ?auto_199816 ?auto_199814 ) ( ON ?auto_199810 ?auto_199816 ) ( CLEAR ?auto_199810 ) ( HOLDING ?auto_199812 ) ( CLEAR ?auto_199815 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199808 ?auto_199811 ?auto_199815 ?auto_199812 )
      ( MAKE-1PILE ?auto_199808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199817 - BLOCK
    )
    :vars
    (
      ?auto_199822 - BLOCK
      ?auto_199825 - BLOCK
      ?auto_199824 - BLOCK
      ?auto_199821 - BLOCK
      ?auto_199818 - BLOCK
      ?auto_199819 - BLOCK
      ?auto_199820 - BLOCK
      ?auto_199823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199822 ?auto_199817 ) ( ON-TABLE ?auto_199817 ) ( not ( = ?auto_199817 ?auto_199822 ) ) ( not ( = ?auto_199817 ?auto_199825 ) ) ( not ( = ?auto_199817 ?auto_199824 ) ) ( not ( = ?auto_199822 ?auto_199825 ) ) ( not ( = ?auto_199822 ?auto_199824 ) ) ( not ( = ?auto_199825 ?auto_199824 ) ) ( ON ?auto_199825 ?auto_199822 ) ( not ( = ?auto_199821 ?auto_199818 ) ) ( not ( = ?auto_199821 ?auto_199819 ) ) ( not ( = ?auto_199821 ?auto_199820 ) ) ( not ( = ?auto_199821 ?auto_199824 ) ) ( not ( = ?auto_199818 ?auto_199819 ) ) ( not ( = ?auto_199818 ?auto_199820 ) ) ( not ( = ?auto_199818 ?auto_199824 ) ) ( not ( = ?auto_199819 ?auto_199820 ) ) ( not ( = ?auto_199819 ?auto_199824 ) ) ( not ( = ?auto_199820 ?auto_199824 ) ) ( not ( = ?auto_199817 ?auto_199820 ) ) ( not ( = ?auto_199817 ?auto_199821 ) ) ( not ( = ?auto_199817 ?auto_199818 ) ) ( not ( = ?auto_199817 ?auto_199819 ) ) ( not ( = ?auto_199822 ?auto_199820 ) ) ( not ( = ?auto_199822 ?auto_199821 ) ) ( not ( = ?auto_199822 ?auto_199818 ) ) ( not ( = ?auto_199822 ?auto_199819 ) ) ( not ( = ?auto_199825 ?auto_199820 ) ) ( not ( = ?auto_199825 ?auto_199821 ) ) ( not ( = ?auto_199825 ?auto_199818 ) ) ( not ( = ?auto_199825 ?auto_199819 ) ) ( ON ?auto_199821 ?auto_199823 ) ( not ( = ?auto_199817 ?auto_199823 ) ) ( not ( = ?auto_199822 ?auto_199823 ) ) ( not ( = ?auto_199825 ?auto_199823 ) ) ( not ( = ?auto_199824 ?auto_199823 ) ) ( not ( = ?auto_199821 ?auto_199823 ) ) ( not ( = ?auto_199818 ?auto_199823 ) ) ( not ( = ?auto_199819 ?auto_199823 ) ) ( not ( = ?auto_199820 ?auto_199823 ) ) ( ON ?auto_199818 ?auto_199821 ) ( ON-TABLE ?auto_199823 ) ( ON ?auto_199819 ?auto_199818 ) ( ON ?auto_199820 ?auto_199819 ) ( CLEAR ?auto_199825 ) ( ON ?auto_199824 ?auto_199820 ) ( CLEAR ?auto_199824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199823 ?auto_199821 ?auto_199818 ?auto_199819 ?auto_199820 )
      ( MAKE-1PILE ?auto_199817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199826 - BLOCK
    )
    :vars
    (
      ?auto_199834 - BLOCK
      ?auto_199831 - BLOCK
      ?auto_199828 - BLOCK
      ?auto_199827 - BLOCK
      ?auto_199829 - BLOCK
      ?auto_199832 - BLOCK
      ?auto_199830 - BLOCK
      ?auto_199833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199834 ?auto_199826 ) ( ON-TABLE ?auto_199826 ) ( not ( = ?auto_199826 ?auto_199834 ) ) ( not ( = ?auto_199826 ?auto_199831 ) ) ( not ( = ?auto_199826 ?auto_199828 ) ) ( not ( = ?auto_199834 ?auto_199831 ) ) ( not ( = ?auto_199834 ?auto_199828 ) ) ( not ( = ?auto_199831 ?auto_199828 ) ) ( not ( = ?auto_199827 ?auto_199829 ) ) ( not ( = ?auto_199827 ?auto_199832 ) ) ( not ( = ?auto_199827 ?auto_199830 ) ) ( not ( = ?auto_199827 ?auto_199828 ) ) ( not ( = ?auto_199829 ?auto_199832 ) ) ( not ( = ?auto_199829 ?auto_199830 ) ) ( not ( = ?auto_199829 ?auto_199828 ) ) ( not ( = ?auto_199832 ?auto_199830 ) ) ( not ( = ?auto_199832 ?auto_199828 ) ) ( not ( = ?auto_199830 ?auto_199828 ) ) ( not ( = ?auto_199826 ?auto_199830 ) ) ( not ( = ?auto_199826 ?auto_199827 ) ) ( not ( = ?auto_199826 ?auto_199829 ) ) ( not ( = ?auto_199826 ?auto_199832 ) ) ( not ( = ?auto_199834 ?auto_199830 ) ) ( not ( = ?auto_199834 ?auto_199827 ) ) ( not ( = ?auto_199834 ?auto_199829 ) ) ( not ( = ?auto_199834 ?auto_199832 ) ) ( not ( = ?auto_199831 ?auto_199830 ) ) ( not ( = ?auto_199831 ?auto_199827 ) ) ( not ( = ?auto_199831 ?auto_199829 ) ) ( not ( = ?auto_199831 ?auto_199832 ) ) ( ON ?auto_199827 ?auto_199833 ) ( not ( = ?auto_199826 ?auto_199833 ) ) ( not ( = ?auto_199834 ?auto_199833 ) ) ( not ( = ?auto_199831 ?auto_199833 ) ) ( not ( = ?auto_199828 ?auto_199833 ) ) ( not ( = ?auto_199827 ?auto_199833 ) ) ( not ( = ?auto_199829 ?auto_199833 ) ) ( not ( = ?auto_199832 ?auto_199833 ) ) ( not ( = ?auto_199830 ?auto_199833 ) ) ( ON ?auto_199829 ?auto_199827 ) ( ON-TABLE ?auto_199833 ) ( ON ?auto_199832 ?auto_199829 ) ( ON ?auto_199830 ?auto_199832 ) ( ON ?auto_199828 ?auto_199830 ) ( CLEAR ?auto_199828 ) ( HOLDING ?auto_199831 ) ( CLEAR ?auto_199834 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199826 ?auto_199834 ?auto_199831 )
      ( MAKE-1PILE ?auto_199826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199835 - BLOCK
    )
    :vars
    (
      ?auto_199841 - BLOCK
      ?auto_199840 - BLOCK
      ?auto_199838 - BLOCK
      ?auto_199842 - BLOCK
      ?auto_199836 - BLOCK
      ?auto_199843 - BLOCK
      ?auto_199839 - BLOCK
      ?auto_199837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_199841 ?auto_199835 ) ( ON-TABLE ?auto_199835 ) ( not ( = ?auto_199835 ?auto_199841 ) ) ( not ( = ?auto_199835 ?auto_199840 ) ) ( not ( = ?auto_199835 ?auto_199838 ) ) ( not ( = ?auto_199841 ?auto_199840 ) ) ( not ( = ?auto_199841 ?auto_199838 ) ) ( not ( = ?auto_199840 ?auto_199838 ) ) ( not ( = ?auto_199842 ?auto_199836 ) ) ( not ( = ?auto_199842 ?auto_199843 ) ) ( not ( = ?auto_199842 ?auto_199839 ) ) ( not ( = ?auto_199842 ?auto_199838 ) ) ( not ( = ?auto_199836 ?auto_199843 ) ) ( not ( = ?auto_199836 ?auto_199839 ) ) ( not ( = ?auto_199836 ?auto_199838 ) ) ( not ( = ?auto_199843 ?auto_199839 ) ) ( not ( = ?auto_199843 ?auto_199838 ) ) ( not ( = ?auto_199839 ?auto_199838 ) ) ( not ( = ?auto_199835 ?auto_199839 ) ) ( not ( = ?auto_199835 ?auto_199842 ) ) ( not ( = ?auto_199835 ?auto_199836 ) ) ( not ( = ?auto_199835 ?auto_199843 ) ) ( not ( = ?auto_199841 ?auto_199839 ) ) ( not ( = ?auto_199841 ?auto_199842 ) ) ( not ( = ?auto_199841 ?auto_199836 ) ) ( not ( = ?auto_199841 ?auto_199843 ) ) ( not ( = ?auto_199840 ?auto_199839 ) ) ( not ( = ?auto_199840 ?auto_199842 ) ) ( not ( = ?auto_199840 ?auto_199836 ) ) ( not ( = ?auto_199840 ?auto_199843 ) ) ( ON ?auto_199842 ?auto_199837 ) ( not ( = ?auto_199835 ?auto_199837 ) ) ( not ( = ?auto_199841 ?auto_199837 ) ) ( not ( = ?auto_199840 ?auto_199837 ) ) ( not ( = ?auto_199838 ?auto_199837 ) ) ( not ( = ?auto_199842 ?auto_199837 ) ) ( not ( = ?auto_199836 ?auto_199837 ) ) ( not ( = ?auto_199843 ?auto_199837 ) ) ( not ( = ?auto_199839 ?auto_199837 ) ) ( ON ?auto_199836 ?auto_199842 ) ( ON-TABLE ?auto_199837 ) ( ON ?auto_199843 ?auto_199836 ) ( ON ?auto_199839 ?auto_199843 ) ( ON ?auto_199838 ?auto_199839 ) ( CLEAR ?auto_199841 ) ( ON ?auto_199840 ?auto_199838 ) ( CLEAR ?auto_199840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199837 ?auto_199842 ?auto_199836 ?auto_199843 ?auto_199839 ?auto_199838 )
      ( MAKE-1PILE ?auto_199835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199862 - BLOCK
    )
    :vars
    (
      ?auto_199865 - BLOCK
      ?auto_199863 - BLOCK
      ?auto_199866 - BLOCK
      ?auto_199869 - BLOCK
      ?auto_199867 - BLOCK
      ?auto_199868 - BLOCK
      ?auto_199864 - BLOCK
      ?auto_199870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199862 ?auto_199865 ) ) ( not ( = ?auto_199862 ?auto_199863 ) ) ( not ( = ?auto_199862 ?auto_199866 ) ) ( not ( = ?auto_199865 ?auto_199863 ) ) ( not ( = ?auto_199865 ?auto_199866 ) ) ( not ( = ?auto_199863 ?auto_199866 ) ) ( not ( = ?auto_199869 ?auto_199867 ) ) ( not ( = ?auto_199869 ?auto_199868 ) ) ( not ( = ?auto_199869 ?auto_199864 ) ) ( not ( = ?auto_199869 ?auto_199866 ) ) ( not ( = ?auto_199867 ?auto_199868 ) ) ( not ( = ?auto_199867 ?auto_199864 ) ) ( not ( = ?auto_199867 ?auto_199866 ) ) ( not ( = ?auto_199868 ?auto_199864 ) ) ( not ( = ?auto_199868 ?auto_199866 ) ) ( not ( = ?auto_199864 ?auto_199866 ) ) ( not ( = ?auto_199862 ?auto_199864 ) ) ( not ( = ?auto_199862 ?auto_199869 ) ) ( not ( = ?auto_199862 ?auto_199867 ) ) ( not ( = ?auto_199862 ?auto_199868 ) ) ( not ( = ?auto_199865 ?auto_199864 ) ) ( not ( = ?auto_199865 ?auto_199869 ) ) ( not ( = ?auto_199865 ?auto_199867 ) ) ( not ( = ?auto_199865 ?auto_199868 ) ) ( not ( = ?auto_199863 ?auto_199864 ) ) ( not ( = ?auto_199863 ?auto_199869 ) ) ( not ( = ?auto_199863 ?auto_199867 ) ) ( not ( = ?auto_199863 ?auto_199868 ) ) ( ON ?auto_199869 ?auto_199870 ) ( not ( = ?auto_199862 ?auto_199870 ) ) ( not ( = ?auto_199865 ?auto_199870 ) ) ( not ( = ?auto_199863 ?auto_199870 ) ) ( not ( = ?auto_199866 ?auto_199870 ) ) ( not ( = ?auto_199869 ?auto_199870 ) ) ( not ( = ?auto_199867 ?auto_199870 ) ) ( not ( = ?auto_199868 ?auto_199870 ) ) ( not ( = ?auto_199864 ?auto_199870 ) ) ( ON ?auto_199867 ?auto_199869 ) ( ON-TABLE ?auto_199870 ) ( ON ?auto_199868 ?auto_199867 ) ( ON ?auto_199864 ?auto_199868 ) ( ON ?auto_199866 ?auto_199864 ) ( ON ?auto_199863 ?auto_199866 ) ( ON ?auto_199865 ?auto_199863 ) ( CLEAR ?auto_199865 ) ( HOLDING ?auto_199862 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199862 ?auto_199865 )
      ( MAKE-1PILE ?auto_199862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_199871 - BLOCK
    )
    :vars
    (
      ?auto_199876 - BLOCK
      ?auto_199874 - BLOCK
      ?auto_199873 - BLOCK
      ?auto_199875 - BLOCK
      ?auto_199872 - BLOCK
      ?auto_199878 - BLOCK
      ?auto_199877 - BLOCK
      ?auto_199879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199871 ?auto_199876 ) ) ( not ( = ?auto_199871 ?auto_199874 ) ) ( not ( = ?auto_199871 ?auto_199873 ) ) ( not ( = ?auto_199876 ?auto_199874 ) ) ( not ( = ?auto_199876 ?auto_199873 ) ) ( not ( = ?auto_199874 ?auto_199873 ) ) ( not ( = ?auto_199875 ?auto_199872 ) ) ( not ( = ?auto_199875 ?auto_199878 ) ) ( not ( = ?auto_199875 ?auto_199877 ) ) ( not ( = ?auto_199875 ?auto_199873 ) ) ( not ( = ?auto_199872 ?auto_199878 ) ) ( not ( = ?auto_199872 ?auto_199877 ) ) ( not ( = ?auto_199872 ?auto_199873 ) ) ( not ( = ?auto_199878 ?auto_199877 ) ) ( not ( = ?auto_199878 ?auto_199873 ) ) ( not ( = ?auto_199877 ?auto_199873 ) ) ( not ( = ?auto_199871 ?auto_199877 ) ) ( not ( = ?auto_199871 ?auto_199875 ) ) ( not ( = ?auto_199871 ?auto_199872 ) ) ( not ( = ?auto_199871 ?auto_199878 ) ) ( not ( = ?auto_199876 ?auto_199877 ) ) ( not ( = ?auto_199876 ?auto_199875 ) ) ( not ( = ?auto_199876 ?auto_199872 ) ) ( not ( = ?auto_199876 ?auto_199878 ) ) ( not ( = ?auto_199874 ?auto_199877 ) ) ( not ( = ?auto_199874 ?auto_199875 ) ) ( not ( = ?auto_199874 ?auto_199872 ) ) ( not ( = ?auto_199874 ?auto_199878 ) ) ( ON ?auto_199875 ?auto_199879 ) ( not ( = ?auto_199871 ?auto_199879 ) ) ( not ( = ?auto_199876 ?auto_199879 ) ) ( not ( = ?auto_199874 ?auto_199879 ) ) ( not ( = ?auto_199873 ?auto_199879 ) ) ( not ( = ?auto_199875 ?auto_199879 ) ) ( not ( = ?auto_199872 ?auto_199879 ) ) ( not ( = ?auto_199878 ?auto_199879 ) ) ( not ( = ?auto_199877 ?auto_199879 ) ) ( ON ?auto_199872 ?auto_199875 ) ( ON-TABLE ?auto_199879 ) ( ON ?auto_199878 ?auto_199872 ) ( ON ?auto_199877 ?auto_199878 ) ( ON ?auto_199873 ?auto_199877 ) ( ON ?auto_199874 ?auto_199873 ) ( ON ?auto_199876 ?auto_199874 ) ( ON ?auto_199871 ?auto_199876 ) ( CLEAR ?auto_199871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_199879 ?auto_199875 ?auto_199872 ?auto_199878 ?auto_199877 ?auto_199873 ?auto_199874 ?auto_199876 )
      ( MAKE-1PILE ?auto_199871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199887 - BLOCK
      ?auto_199888 - BLOCK
      ?auto_199889 - BLOCK
      ?auto_199890 - BLOCK
      ?auto_199891 - BLOCK
      ?auto_199892 - BLOCK
      ?auto_199893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_199893 ) ( CLEAR ?auto_199892 ) ( ON-TABLE ?auto_199887 ) ( ON ?auto_199888 ?auto_199887 ) ( ON ?auto_199889 ?auto_199888 ) ( ON ?auto_199890 ?auto_199889 ) ( ON ?auto_199891 ?auto_199890 ) ( ON ?auto_199892 ?auto_199891 ) ( not ( = ?auto_199887 ?auto_199888 ) ) ( not ( = ?auto_199887 ?auto_199889 ) ) ( not ( = ?auto_199887 ?auto_199890 ) ) ( not ( = ?auto_199887 ?auto_199891 ) ) ( not ( = ?auto_199887 ?auto_199892 ) ) ( not ( = ?auto_199887 ?auto_199893 ) ) ( not ( = ?auto_199888 ?auto_199889 ) ) ( not ( = ?auto_199888 ?auto_199890 ) ) ( not ( = ?auto_199888 ?auto_199891 ) ) ( not ( = ?auto_199888 ?auto_199892 ) ) ( not ( = ?auto_199888 ?auto_199893 ) ) ( not ( = ?auto_199889 ?auto_199890 ) ) ( not ( = ?auto_199889 ?auto_199891 ) ) ( not ( = ?auto_199889 ?auto_199892 ) ) ( not ( = ?auto_199889 ?auto_199893 ) ) ( not ( = ?auto_199890 ?auto_199891 ) ) ( not ( = ?auto_199890 ?auto_199892 ) ) ( not ( = ?auto_199890 ?auto_199893 ) ) ( not ( = ?auto_199891 ?auto_199892 ) ) ( not ( = ?auto_199891 ?auto_199893 ) ) ( not ( = ?auto_199892 ?auto_199893 ) ) )
    :subtasks
    ( ( !STACK ?auto_199893 ?auto_199892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199894 - BLOCK
      ?auto_199895 - BLOCK
      ?auto_199896 - BLOCK
      ?auto_199897 - BLOCK
      ?auto_199898 - BLOCK
      ?auto_199899 - BLOCK
      ?auto_199900 - BLOCK
    )
    :vars
    (
      ?auto_199901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_199899 ) ( ON-TABLE ?auto_199894 ) ( ON ?auto_199895 ?auto_199894 ) ( ON ?auto_199896 ?auto_199895 ) ( ON ?auto_199897 ?auto_199896 ) ( ON ?auto_199898 ?auto_199897 ) ( ON ?auto_199899 ?auto_199898 ) ( not ( = ?auto_199894 ?auto_199895 ) ) ( not ( = ?auto_199894 ?auto_199896 ) ) ( not ( = ?auto_199894 ?auto_199897 ) ) ( not ( = ?auto_199894 ?auto_199898 ) ) ( not ( = ?auto_199894 ?auto_199899 ) ) ( not ( = ?auto_199894 ?auto_199900 ) ) ( not ( = ?auto_199895 ?auto_199896 ) ) ( not ( = ?auto_199895 ?auto_199897 ) ) ( not ( = ?auto_199895 ?auto_199898 ) ) ( not ( = ?auto_199895 ?auto_199899 ) ) ( not ( = ?auto_199895 ?auto_199900 ) ) ( not ( = ?auto_199896 ?auto_199897 ) ) ( not ( = ?auto_199896 ?auto_199898 ) ) ( not ( = ?auto_199896 ?auto_199899 ) ) ( not ( = ?auto_199896 ?auto_199900 ) ) ( not ( = ?auto_199897 ?auto_199898 ) ) ( not ( = ?auto_199897 ?auto_199899 ) ) ( not ( = ?auto_199897 ?auto_199900 ) ) ( not ( = ?auto_199898 ?auto_199899 ) ) ( not ( = ?auto_199898 ?auto_199900 ) ) ( not ( = ?auto_199899 ?auto_199900 ) ) ( ON ?auto_199900 ?auto_199901 ) ( CLEAR ?auto_199900 ) ( HAND-EMPTY ) ( not ( = ?auto_199894 ?auto_199901 ) ) ( not ( = ?auto_199895 ?auto_199901 ) ) ( not ( = ?auto_199896 ?auto_199901 ) ) ( not ( = ?auto_199897 ?auto_199901 ) ) ( not ( = ?auto_199898 ?auto_199901 ) ) ( not ( = ?auto_199899 ?auto_199901 ) ) ( not ( = ?auto_199900 ?auto_199901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_199900 ?auto_199901 )
      ( MAKE-7PILE ?auto_199894 ?auto_199895 ?auto_199896 ?auto_199897 ?auto_199898 ?auto_199899 ?auto_199900 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199902 - BLOCK
      ?auto_199903 - BLOCK
      ?auto_199904 - BLOCK
      ?auto_199905 - BLOCK
      ?auto_199906 - BLOCK
      ?auto_199907 - BLOCK
      ?auto_199908 - BLOCK
    )
    :vars
    (
      ?auto_199909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199902 ) ( ON ?auto_199903 ?auto_199902 ) ( ON ?auto_199904 ?auto_199903 ) ( ON ?auto_199905 ?auto_199904 ) ( ON ?auto_199906 ?auto_199905 ) ( not ( = ?auto_199902 ?auto_199903 ) ) ( not ( = ?auto_199902 ?auto_199904 ) ) ( not ( = ?auto_199902 ?auto_199905 ) ) ( not ( = ?auto_199902 ?auto_199906 ) ) ( not ( = ?auto_199902 ?auto_199907 ) ) ( not ( = ?auto_199902 ?auto_199908 ) ) ( not ( = ?auto_199903 ?auto_199904 ) ) ( not ( = ?auto_199903 ?auto_199905 ) ) ( not ( = ?auto_199903 ?auto_199906 ) ) ( not ( = ?auto_199903 ?auto_199907 ) ) ( not ( = ?auto_199903 ?auto_199908 ) ) ( not ( = ?auto_199904 ?auto_199905 ) ) ( not ( = ?auto_199904 ?auto_199906 ) ) ( not ( = ?auto_199904 ?auto_199907 ) ) ( not ( = ?auto_199904 ?auto_199908 ) ) ( not ( = ?auto_199905 ?auto_199906 ) ) ( not ( = ?auto_199905 ?auto_199907 ) ) ( not ( = ?auto_199905 ?auto_199908 ) ) ( not ( = ?auto_199906 ?auto_199907 ) ) ( not ( = ?auto_199906 ?auto_199908 ) ) ( not ( = ?auto_199907 ?auto_199908 ) ) ( ON ?auto_199908 ?auto_199909 ) ( CLEAR ?auto_199908 ) ( not ( = ?auto_199902 ?auto_199909 ) ) ( not ( = ?auto_199903 ?auto_199909 ) ) ( not ( = ?auto_199904 ?auto_199909 ) ) ( not ( = ?auto_199905 ?auto_199909 ) ) ( not ( = ?auto_199906 ?auto_199909 ) ) ( not ( = ?auto_199907 ?auto_199909 ) ) ( not ( = ?auto_199908 ?auto_199909 ) ) ( HOLDING ?auto_199907 ) ( CLEAR ?auto_199906 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199902 ?auto_199903 ?auto_199904 ?auto_199905 ?auto_199906 ?auto_199907 )
      ( MAKE-7PILE ?auto_199902 ?auto_199903 ?auto_199904 ?auto_199905 ?auto_199906 ?auto_199907 ?auto_199908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199910 - BLOCK
      ?auto_199911 - BLOCK
      ?auto_199912 - BLOCK
      ?auto_199913 - BLOCK
      ?auto_199914 - BLOCK
      ?auto_199915 - BLOCK
      ?auto_199916 - BLOCK
    )
    :vars
    (
      ?auto_199917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199910 ) ( ON ?auto_199911 ?auto_199910 ) ( ON ?auto_199912 ?auto_199911 ) ( ON ?auto_199913 ?auto_199912 ) ( ON ?auto_199914 ?auto_199913 ) ( not ( = ?auto_199910 ?auto_199911 ) ) ( not ( = ?auto_199910 ?auto_199912 ) ) ( not ( = ?auto_199910 ?auto_199913 ) ) ( not ( = ?auto_199910 ?auto_199914 ) ) ( not ( = ?auto_199910 ?auto_199915 ) ) ( not ( = ?auto_199910 ?auto_199916 ) ) ( not ( = ?auto_199911 ?auto_199912 ) ) ( not ( = ?auto_199911 ?auto_199913 ) ) ( not ( = ?auto_199911 ?auto_199914 ) ) ( not ( = ?auto_199911 ?auto_199915 ) ) ( not ( = ?auto_199911 ?auto_199916 ) ) ( not ( = ?auto_199912 ?auto_199913 ) ) ( not ( = ?auto_199912 ?auto_199914 ) ) ( not ( = ?auto_199912 ?auto_199915 ) ) ( not ( = ?auto_199912 ?auto_199916 ) ) ( not ( = ?auto_199913 ?auto_199914 ) ) ( not ( = ?auto_199913 ?auto_199915 ) ) ( not ( = ?auto_199913 ?auto_199916 ) ) ( not ( = ?auto_199914 ?auto_199915 ) ) ( not ( = ?auto_199914 ?auto_199916 ) ) ( not ( = ?auto_199915 ?auto_199916 ) ) ( ON ?auto_199916 ?auto_199917 ) ( not ( = ?auto_199910 ?auto_199917 ) ) ( not ( = ?auto_199911 ?auto_199917 ) ) ( not ( = ?auto_199912 ?auto_199917 ) ) ( not ( = ?auto_199913 ?auto_199917 ) ) ( not ( = ?auto_199914 ?auto_199917 ) ) ( not ( = ?auto_199915 ?auto_199917 ) ) ( not ( = ?auto_199916 ?auto_199917 ) ) ( CLEAR ?auto_199914 ) ( ON ?auto_199915 ?auto_199916 ) ( CLEAR ?auto_199915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_199917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199917 ?auto_199916 )
      ( MAKE-7PILE ?auto_199910 ?auto_199911 ?auto_199912 ?auto_199913 ?auto_199914 ?auto_199915 ?auto_199916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199918 - BLOCK
      ?auto_199919 - BLOCK
      ?auto_199920 - BLOCK
      ?auto_199921 - BLOCK
      ?auto_199922 - BLOCK
      ?auto_199923 - BLOCK
      ?auto_199924 - BLOCK
    )
    :vars
    (
      ?auto_199925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199918 ) ( ON ?auto_199919 ?auto_199918 ) ( ON ?auto_199920 ?auto_199919 ) ( ON ?auto_199921 ?auto_199920 ) ( not ( = ?auto_199918 ?auto_199919 ) ) ( not ( = ?auto_199918 ?auto_199920 ) ) ( not ( = ?auto_199918 ?auto_199921 ) ) ( not ( = ?auto_199918 ?auto_199922 ) ) ( not ( = ?auto_199918 ?auto_199923 ) ) ( not ( = ?auto_199918 ?auto_199924 ) ) ( not ( = ?auto_199919 ?auto_199920 ) ) ( not ( = ?auto_199919 ?auto_199921 ) ) ( not ( = ?auto_199919 ?auto_199922 ) ) ( not ( = ?auto_199919 ?auto_199923 ) ) ( not ( = ?auto_199919 ?auto_199924 ) ) ( not ( = ?auto_199920 ?auto_199921 ) ) ( not ( = ?auto_199920 ?auto_199922 ) ) ( not ( = ?auto_199920 ?auto_199923 ) ) ( not ( = ?auto_199920 ?auto_199924 ) ) ( not ( = ?auto_199921 ?auto_199922 ) ) ( not ( = ?auto_199921 ?auto_199923 ) ) ( not ( = ?auto_199921 ?auto_199924 ) ) ( not ( = ?auto_199922 ?auto_199923 ) ) ( not ( = ?auto_199922 ?auto_199924 ) ) ( not ( = ?auto_199923 ?auto_199924 ) ) ( ON ?auto_199924 ?auto_199925 ) ( not ( = ?auto_199918 ?auto_199925 ) ) ( not ( = ?auto_199919 ?auto_199925 ) ) ( not ( = ?auto_199920 ?auto_199925 ) ) ( not ( = ?auto_199921 ?auto_199925 ) ) ( not ( = ?auto_199922 ?auto_199925 ) ) ( not ( = ?auto_199923 ?auto_199925 ) ) ( not ( = ?auto_199924 ?auto_199925 ) ) ( ON ?auto_199923 ?auto_199924 ) ( CLEAR ?auto_199923 ) ( ON-TABLE ?auto_199925 ) ( HOLDING ?auto_199922 ) ( CLEAR ?auto_199921 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199918 ?auto_199919 ?auto_199920 ?auto_199921 ?auto_199922 )
      ( MAKE-7PILE ?auto_199918 ?auto_199919 ?auto_199920 ?auto_199921 ?auto_199922 ?auto_199923 ?auto_199924 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199926 - BLOCK
      ?auto_199927 - BLOCK
      ?auto_199928 - BLOCK
      ?auto_199929 - BLOCK
      ?auto_199930 - BLOCK
      ?auto_199931 - BLOCK
      ?auto_199932 - BLOCK
    )
    :vars
    (
      ?auto_199933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199926 ) ( ON ?auto_199927 ?auto_199926 ) ( ON ?auto_199928 ?auto_199927 ) ( ON ?auto_199929 ?auto_199928 ) ( not ( = ?auto_199926 ?auto_199927 ) ) ( not ( = ?auto_199926 ?auto_199928 ) ) ( not ( = ?auto_199926 ?auto_199929 ) ) ( not ( = ?auto_199926 ?auto_199930 ) ) ( not ( = ?auto_199926 ?auto_199931 ) ) ( not ( = ?auto_199926 ?auto_199932 ) ) ( not ( = ?auto_199927 ?auto_199928 ) ) ( not ( = ?auto_199927 ?auto_199929 ) ) ( not ( = ?auto_199927 ?auto_199930 ) ) ( not ( = ?auto_199927 ?auto_199931 ) ) ( not ( = ?auto_199927 ?auto_199932 ) ) ( not ( = ?auto_199928 ?auto_199929 ) ) ( not ( = ?auto_199928 ?auto_199930 ) ) ( not ( = ?auto_199928 ?auto_199931 ) ) ( not ( = ?auto_199928 ?auto_199932 ) ) ( not ( = ?auto_199929 ?auto_199930 ) ) ( not ( = ?auto_199929 ?auto_199931 ) ) ( not ( = ?auto_199929 ?auto_199932 ) ) ( not ( = ?auto_199930 ?auto_199931 ) ) ( not ( = ?auto_199930 ?auto_199932 ) ) ( not ( = ?auto_199931 ?auto_199932 ) ) ( ON ?auto_199932 ?auto_199933 ) ( not ( = ?auto_199926 ?auto_199933 ) ) ( not ( = ?auto_199927 ?auto_199933 ) ) ( not ( = ?auto_199928 ?auto_199933 ) ) ( not ( = ?auto_199929 ?auto_199933 ) ) ( not ( = ?auto_199930 ?auto_199933 ) ) ( not ( = ?auto_199931 ?auto_199933 ) ) ( not ( = ?auto_199932 ?auto_199933 ) ) ( ON ?auto_199931 ?auto_199932 ) ( ON-TABLE ?auto_199933 ) ( CLEAR ?auto_199929 ) ( ON ?auto_199930 ?auto_199931 ) ( CLEAR ?auto_199930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199933 ?auto_199932 ?auto_199931 )
      ( MAKE-7PILE ?auto_199926 ?auto_199927 ?auto_199928 ?auto_199929 ?auto_199930 ?auto_199931 ?auto_199932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199934 - BLOCK
      ?auto_199935 - BLOCK
      ?auto_199936 - BLOCK
      ?auto_199937 - BLOCK
      ?auto_199938 - BLOCK
      ?auto_199939 - BLOCK
      ?auto_199940 - BLOCK
    )
    :vars
    (
      ?auto_199941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199934 ) ( ON ?auto_199935 ?auto_199934 ) ( ON ?auto_199936 ?auto_199935 ) ( not ( = ?auto_199934 ?auto_199935 ) ) ( not ( = ?auto_199934 ?auto_199936 ) ) ( not ( = ?auto_199934 ?auto_199937 ) ) ( not ( = ?auto_199934 ?auto_199938 ) ) ( not ( = ?auto_199934 ?auto_199939 ) ) ( not ( = ?auto_199934 ?auto_199940 ) ) ( not ( = ?auto_199935 ?auto_199936 ) ) ( not ( = ?auto_199935 ?auto_199937 ) ) ( not ( = ?auto_199935 ?auto_199938 ) ) ( not ( = ?auto_199935 ?auto_199939 ) ) ( not ( = ?auto_199935 ?auto_199940 ) ) ( not ( = ?auto_199936 ?auto_199937 ) ) ( not ( = ?auto_199936 ?auto_199938 ) ) ( not ( = ?auto_199936 ?auto_199939 ) ) ( not ( = ?auto_199936 ?auto_199940 ) ) ( not ( = ?auto_199937 ?auto_199938 ) ) ( not ( = ?auto_199937 ?auto_199939 ) ) ( not ( = ?auto_199937 ?auto_199940 ) ) ( not ( = ?auto_199938 ?auto_199939 ) ) ( not ( = ?auto_199938 ?auto_199940 ) ) ( not ( = ?auto_199939 ?auto_199940 ) ) ( ON ?auto_199940 ?auto_199941 ) ( not ( = ?auto_199934 ?auto_199941 ) ) ( not ( = ?auto_199935 ?auto_199941 ) ) ( not ( = ?auto_199936 ?auto_199941 ) ) ( not ( = ?auto_199937 ?auto_199941 ) ) ( not ( = ?auto_199938 ?auto_199941 ) ) ( not ( = ?auto_199939 ?auto_199941 ) ) ( not ( = ?auto_199940 ?auto_199941 ) ) ( ON ?auto_199939 ?auto_199940 ) ( ON-TABLE ?auto_199941 ) ( ON ?auto_199938 ?auto_199939 ) ( CLEAR ?auto_199938 ) ( HOLDING ?auto_199937 ) ( CLEAR ?auto_199936 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199934 ?auto_199935 ?auto_199936 ?auto_199937 )
      ( MAKE-7PILE ?auto_199934 ?auto_199935 ?auto_199936 ?auto_199937 ?auto_199938 ?auto_199939 ?auto_199940 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199942 - BLOCK
      ?auto_199943 - BLOCK
      ?auto_199944 - BLOCK
      ?auto_199945 - BLOCK
      ?auto_199946 - BLOCK
      ?auto_199947 - BLOCK
      ?auto_199948 - BLOCK
    )
    :vars
    (
      ?auto_199949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199942 ) ( ON ?auto_199943 ?auto_199942 ) ( ON ?auto_199944 ?auto_199943 ) ( not ( = ?auto_199942 ?auto_199943 ) ) ( not ( = ?auto_199942 ?auto_199944 ) ) ( not ( = ?auto_199942 ?auto_199945 ) ) ( not ( = ?auto_199942 ?auto_199946 ) ) ( not ( = ?auto_199942 ?auto_199947 ) ) ( not ( = ?auto_199942 ?auto_199948 ) ) ( not ( = ?auto_199943 ?auto_199944 ) ) ( not ( = ?auto_199943 ?auto_199945 ) ) ( not ( = ?auto_199943 ?auto_199946 ) ) ( not ( = ?auto_199943 ?auto_199947 ) ) ( not ( = ?auto_199943 ?auto_199948 ) ) ( not ( = ?auto_199944 ?auto_199945 ) ) ( not ( = ?auto_199944 ?auto_199946 ) ) ( not ( = ?auto_199944 ?auto_199947 ) ) ( not ( = ?auto_199944 ?auto_199948 ) ) ( not ( = ?auto_199945 ?auto_199946 ) ) ( not ( = ?auto_199945 ?auto_199947 ) ) ( not ( = ?auto_199945 ?auto_199948 ) ) ( not ( = ?auto_199946 ?auto_199947 ) ) ( not ( = ?auto_199946 ?auto_199948 ) ) ( not ( = ?auto_199947 ?auto_199948 ) ) ( ON ?auto_199948 ?auto_199949 ) ( not ( = ?auto_199942 ?auto_199949 ) ) ( not ( = ?auto_199943 ?auto_199949 ) ) ( not ( = ?auto_199944 ?auto_199949 ) ) ( not ( = ?auto_199945 ?auto_199949 ) ) ( not ( = ?auto_199946 ?auto_199949 ) ) ( not ( = ?auto_199947 ?auto_199949 ) ) ( not ( = ?auto_199948 ?auto_199949 ) ) ( ON ?auto_199947 ?auto_199948 ) ( ON-TABLE ?auto_199949 ) ( ON ?auto_199946 ?auto_199947 ) ( CLEAR ?auto_199944 ) ( ON ?auto_199945 ?auto_199946 ) ( CLEAR ?auto_199945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_199949 ?auto_199948 ?auto_199947 ?auto_199946 )
      ( MAKE-7PILE ?auto_199942 ?auto_199943 ?auto_199944 ?auto_199945 ?auto_199946 ?auto_199947 ?auto_199948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199950 - BLOCK
      ?auto_199951 - BLOCK
      ?auto_199952 - BLOCK
      ?auto_199953 - BLOCK
      ?auto_199954 - BLOCK
      ?auto_199955 - BLOCK
      ?auto_199956 - BLOCK
    )
    :vars
    (
      ?auto_199957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199950 ) ( ON ?auto_199951 ?auto_199950 ) ( not ( = ?auto_199950 ?auto_199951 ) ) ( not ( = ?auto_199950 ?auto_199952 ) ) ( not ( = ?auto_199950 ?auto_199953 ) ) ( not ( = ?auto_199950 ?auto_199954 ) ) ( not ( = ?auto_199950 ?auto_199955 ) ) ( not ( = ?auto_199950 ?auto_199956 ) ) ( not ( = ?auto_199951 ?auto_199952 ) ) ( not ( = ?auto_199951 ?auto_199953 ) ) ( not ( = ?auto_199951 ?auto_199954 ) ) ( not ( = ?auto_199951 ?auto_199955 ) ) ( not ( = ?auto_199951 ?auto_199956 ) ) ( not ( = ?auto_199952 ?auto_199953 ) ) ( not ( = ?auto_199952 ?auto_199954 ) ) ( not ( = ?auto_199952 ?auto_199955 ) ) ( not ( = ?auto_199952 ?auto_199956 ) ) ( not ( = ?auto_199953 ?auto_199954 ) ) ( not ( = ?auto_199953 ?auto_199955 ) ) ( not ( = ?auto_199953 ?auto_199956 ) ) ( not ( = ?auto_199954 ?auto_199955 ) ) ( not ( = ?auto_199954 ?auto_199956 ) ) ( not ( = ?auto_199955 ?auto_199956 ) ) ( ON ?auto_199956 ?auto_199957 ) ( not ( = ?auto_199950 ?auto_199957 ) ) ( not ( = ?auto_199951 ?auto_199957 ) ) ( not ( = ?auto_199952 ?auto_199957 ) ) ( not ( = ?auto_199953 ?auto_199957 ) ) ( not ( = ?auto_199954 ?auto_199957 ) ) ( not ( = ?auto_199955 ?auto_199957 ) ) ( not ( = ?auto_199956 ?auto_199957 ) ) ( ON ?auto_199955 ?auto_199956 ) ( ON-TABLE ?auto_199957 ) ( ON ?auto_199954 ?auto_199955 ) ( ON ?auto_199953 ?auto_199954 ) ( CLEAR ?auto_199953 ) ( HOLDING ?auto_199952 ) ( CLEAR ?auto_199951 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_199950 ?auto_199951 ?auto_199952 )
      ( MAKE-7PILE ?auto_199950 ?auto_199951 ?auto_199952 ?auto_199953 ?auto_199954 ?auto_199955 ?auto_199956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199958 - BLOCK
      ?auto_199959 - BLOCK
      ?auto_199960 - BLOCK
      ?auto_199961 - BLOCK
      ?auto_199962 - BLOCK
      ?auto_199963 - BLOCK
      ?auto_199964 - BLOCK
    )
    :vars
    (
      ?auto_199965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199958 ) ( ON ?auto_199959 ?auto_199958 ) ( not ( = ?auto_199958 ?auto_199959 ) ) ( not ( = ?auto_199958 ?auto_199960 ) ) ( not ( = ?auto_199958 ?auto_199961 ) ) ( not ( = ?auto_199958 ?auto_199962 ) ) ( not ( = ?auto_199958 ?auto_199963 ) ) ( not ( = ?auto_199958 ?auto_199964 ) ) ( not ( = ?auto_199959 ?auto_199960 ) ) ( not ( = ?auto_199959 ?auto_199961 ) ) ( not ( = ?auto_199959 ?auto_199962 ) ) ( not ( = ?auto_199959 ?auto_199963 ) ) ( not ( = ?auto_199959 ?auto_199964 ) ) ( not ( = ?auto_199960 ?auto_199961 ) ) ( not ( = ?auto_199960 ?auto_199962 ) ) ( not ( = ?auto_199960 ?auto_199963 ) ) ( not ( = ?auto_199960 ?auto_199964 ) ) ( not ( = ?auto_199961 ?auto_199962 ) ) ( not ( = ?auto_199961 ?auto_199963 ) ) ( not ( = ?auto_199961 ?auto_199964 ) ) ( not ( = ?auto_199962 ?auto_199963 ) ) ( not ( = ?auto_199962 ?auto_199964 ) ) ( not ( = ?auto_199963 ?auto_199964 ) ) ( ON ?auto_199964 ?auto_199965 ) ( not ( = ?auto_199958 ?auto_199965 ) ) ( not ( = ?auto_199959 ?auto_199965 ) ) ( not ( = ?auto_199960 ?auto_199965 ) ) ( not ( = ?auto_199961 ?auto_199965 ) ) ( not ( = ?auto_199962 ?auto_199965 ) ) ( not ( = ?auto_199963 ?auto_199965 ) ) ( not ( = ?auto_199964 ?auto_199965 ) ) ( ON ?auto_199963 ?auto_199964 ) ( ON-TABLE ?auto_199965 ) ( ON ?auto_199962 ?auto_199963 ) ( ON ?auto_199961 ?auto_199962 ) ( CLEAR ?auto_199959 ) ( ON ?auto_199960 ?auto_199961 ) ( CLEAR ?auto_199960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_199965 ?auto_199964 ?auto_199963 ?auto_199962 ?auto_199961 )
      ( MAKE-7PILE ?auto_199958 ?auto_199959 ?auto_199960 ?auto_199961 ?auto_199962 ?auto_199963 ?auto_199964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199966 - BLOCK
      ?auto_199967 - BLOCK
      ?auto_199968 - BLOCK
      ?auto_199969 - BLOCK
      ?auto_199970 - BLOCK
      ?auto_199971 - BLOCK
      ?auto_199972 - BLOCK
    )
    :vars
    (
      ?auto_199973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199966 ) ( not ( = ?auto_199966 ?auto_199967 ) ) ( not ( = ?auto_199966 ?auto_199968 ) ) ( not ( = ?auto_199966 ?auto_199969 ) ) ( not ( = ?auto_199966 ?auto_199970 ) ) ( not ( = ?auto_199966 ?auto_199971 ) ) ( not ( = ?auto_199966 ?auto_199972 ) ) ( not ( = ?auto_199967 ?auto_199968 ) ) ( not ( = ?auto_199967 ?auto_199969 ) ) ( not ( = ?auto_199967 ?auto_199970 ) ) ( not ( = ?auto_199967 ?auto_199971 ) ) ( not ( = ?auto_199967 ?auto_199972 ) ) ( not ( = ?auto_199968 ?auto_199969 ) ) ( not ( = ?auto_199968 ?auto_199970 ) ) ( not ( = ?auto_199968 ?auto_199971 ) ) ( not ( = ?auto_199968 ?auto_199972 ) ) ( not ( = ?auto_199969 ?auto_199970 ) ) ( not ( = ?auto_199969 ?auto_199971 ) ) ( not ( = ?auto_199969 ?auto_199972 ) ) ( not ( = ?auto_199970 ?auto_199971 ) ) ( not ( = ?auto_199970 ?auto_199972 ) ) ( not ( = ?auto_199971 ?auto_199972 ) ) ( ON ?auto_199972 ?auto_199973 ) ( not ( = ?auto_199966 ?auto_199973 ) ) ( not ( = ?auto_199967 ?auto_199973 ) ) ( not ( = ?auto_199968 ?auto_199973 ) ) ( not ( = ?auto_199969 ?auto_199973 ) ) ( not ( = ?auto_199970 ?auto_199973 ) ) ( not ( = ?auto_199971 ?auto_199973 ) ) ( not ( = ?auto_199972 ?auto_199973 ) ) ( ON ?auto_199971 ?auto_199972 ) ( ON-TABLE ?auto_199973 ) ( ON ?auto_199970 ?auto_199971 ) ( ON ?auto_199969 ?auto_199970 ) ( ON ?auto_199968 ?auto_199969 ) ( CLEAR ?auto_199968 ) ( HOLDING ?auto_199967 ) ( CLEAR ?auto_199966 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_199966 ?auto_199967 )
      ( MAKE-7PILE ?auto_199966 ?auto_199967 ?auto_199968 ?auto_199969 ?auto_199970 ?auto_199971 ?auto_199972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199974 - BLOCK
      ?auto_199975 - BLOCK
      ?auto_199976 - BLOCK
      ?auto_199977 - BLOCK
      ?auto_199978 - BLOCK
      ?auto_199979 - BLOCK
      ?auto_199980 - BLOCK
    )
    :vars
    (
      ?auto_199981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_199974 ) ( not ( = ?auto_199974 ?auto_199975 ) ) ( not ( = ?auto_199974 ?auto_199976 ) ) ( not ( = ?auto_199974 ?auto_199977 ) ) ( not ( = ?auto_199974 ?auto_199978 ) ) ( not ( = ?auto_199974 ?auto_199979 ) ) ( not ( = ?auto_199974 ?auto_199980 ) ) ( not ( = ?auto_199975 ?auto_199976 ) ) ( not ( = ?auto_199975 ?auto_199977 ) ) ( not ( = ?auto_199975 ?auto_199978 ) ) ( not ( = ?auto_199975 ?auto_199979 ) ) ( not ( = ?auto_199975 ?auto_199980 ) ) ( not ( = ?auto_199976 ?auto_199977 ) ) ( not ( = ?auto_199976 ?auto_199978 ) ) ( not ( = ?auto_199976 ?auto_199979 ) ) ( not ( = ?auto_199976 ?auto_199980 ) ) ( not ( = ?auto_199977 ?auto_199978 ) ) ( not ( = ?auto_199977 ?auto_199979 ) ) ( not ( = ?auto_199977 ?auto_199980 ) ) ( not ( = ?auto_199978 ?auto_199979 ) ) ( not ( = ?auto_199978 ?auto_199980 ) ) ( not ( = ?auto_199979 ?auto_199980 ) ) ( ON ?auto_199980 ?auto_199981 ) ( not ( = ?auto_199974 ?auto_199981 ) ) ( not ( = ?auto_199975 ?auto_199981 ) ) ( not ( = ?auto_199976 ?auto_199981 ) ) ( not ( = ?auto_199977 ?auto_199981 ) ) ( not ( = ?auto_199978 ?auto_199981 ) ) ( not ( = ?auto_199979 ?auto_199981 ) ) ( not ( = ?auto_199980 ?auto_199981 ) ) ( ON ?auto_199979 ?auto_199980 ) ( ON-TABLE ?auto_199981 ) ( ON ?auto_199978 ?auto_199979 ) ( ON ?auto_199977 ?auto_199978 ) ( ON ?auto_199976 ?auto_199977 ) ( CLEAR ?auto_199974 ) ( ON ?auto_199975 ?auto_199976 ) ( CLEAR ?auto_199975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_199981 ?auto_199980 ?auto_199979 ?auto_199978 ?auto_199977 ?auto_199976 )
      ( MAKE-7PILE ?auto_199974 ?auto_199975 ?auto_199976 ?auto_199977 ?auto_199978 ?auto_199979 ?auto_199980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199982 - BLOCK
      ?auto_199983 - BLOCK
      ?auto_199984 - BLOCK
      ?auto_199985 - BLOCK
      ?auto_199986 - BLOCK
      ?auto_199987 - BLOCK
      ?auto_199988 - BLOCK
    )
    :vars
    (
      ?auto_199989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199982 ?auto_199983 ) ) ( not ( = ?auto_199982 ?auto_199984 ) ) ( not ( = ?auto_199982 ?auto_199985 ) ) ( not ( = ?auto_199982 ?auto_199986 ) ) ( not ( = ?auto_199982 ?auto_199987 ) ) ( not ( = ?auto_199982 ?auto_199988 ) ) ( not ( = ?auto_199983 ?auto_199984 ) ) ( not ( = ?auto_199983 ?auto_199985 ) ) ( not ( = ?auto_199983 ?auto_199986 ) ) ( not ( = ?auto_199983 ?auto_199987 ) ) ( not ( = ?auto_199983 ?auto_199988 ) ) ( not ( = ?auto_199984 ?auto_199985 ) ) ( not ( = ?auto_199984 ?auto_199986 ) ) ( not ( = ?auto_199984 ?auto_199987 ) ) ( not ( = ?auto_199984 ?auto_199988 ) ) ( not ( = ?auto_199985 ?auto_199986 ) ) ( not ( = ?auto_199985 ?auto_199987 ) ) ( not ( = ?auto_199985 ?auto_199988 ) ) ( not ( = ?auto_199986 ?auto_199987 ) ) ( not ( = ?auto_199986 ?auto_199988 ) ) ( not ( = ?auto_199987 ?auto_199988 ) ) ( ON ?auto_199988 ?auto_199989 ) ( not ( = ?auto_199982 ?auto_199989 ) ) ( not ( = ?auto_199983 ?auto_199989 ) ) ( not ( = ?auto_199984 ?auto_199989 ) ) ( not ( = ?auto_199985 ?auto_199989 ) ) ( not ( = ?auto_199986 ?auto_199989 ) ) ( not ( = ?auto_199987 ?auto_199989 ) ) ( not ( = ?auto_199988 ?auto_199989 ) ) ( ON ?auto_199987 ?auto_199988 ) ( ON-TABLE ?auto_199989 ) ( ON ?auto_199986 ?auto_199987 ) ( ON ?auto_199985 ?auto_199986 ) ( ON ?auto_199984 ?auto_199985 ) ( ON ?auto_199983 ?auto_199984 ) ( CLEAR ?auto_199983 ) ( HOLDING ?auto_199982 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_199982 )
      ( MAKE-7PILE ?auto_199982 ?auto_199983 ?auto_199984 ?auto_199985 ?auto_199986 ?auto_199987 ?auto_199988 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199990 - BLOCK
      ?auto_199991 - BLOCK
      ?auto_199992 - BLOCK
      ?auto_199993 - BLOCK
      ?auto_199994 - BLOCK
      ?auto_199995 - BLOCK
      ?auto_199996 - BLOCK
    )
    :vars
    (
      ?auto_199997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199990 ?auto_199991 ) ) ( not ( = ?auto_199990 ?auto_199992 ) ) ( not ( = ?auto_199990 ?auto_199993 ) ) ( not ( = ?auto_199990 ?auto_199994 ) ) ( not ( = ?auto_199990 ?auto_199995 ) ) ( not ( = ?auto_199990 ?auto_199996 ) ) ( not ( = ?auto_199991 ?auto_199992 ) ) ( not ( = ?auto_199991 ?auto_199993 ) ) ( not ( = ?auto_199991 ?auto_199994 ) ) ( not ( = ?auto_199991 ?auto_199995 ) ) ( not ( = ?auto_199991 ?auto_199996 ) ) ( not ( = ?auto_199992 ?auto_199993 ) ) ( not ( = ?auto_199992 ?auto_199994 ) ) ( not ( = ?auto_199992 ?auto_199995 ) ) ( not ( = ?auto_199992 ?auto_199996 ) ) ( not ( = ?auto_199993 ?auto_199994 ) ) ( not ( = ?auto_199993 ?auto_199995 ) ) ( not ( = ?auto_199993 ?auto_199996 ) ) ( not ( = ?auto_199994 ?auto_199995 ) ) ( not ( = ?auto_199994 ?auto_199996 ) ) ( not ( = ?auto_199995 ?auto_199996 ) ) ( ON ?auto_199996 ?auto_199997 ) ( not ( = ?auto_199990 ?auto_199997 ) ) ( not ( = ?auto_199991 ?auto_199997 ) ) ( not ( = ?auto_199992 ?auto_199997 ) ) ( not ( = ?auto_199993 ?auto_199997 ) ) ( not ( = ?auto_199994 ?auto_199997 ) ) ( not ( = ?auto_199995 ?auto_199997 ) ) ( not ( = ?auto_199996 ?auto_199997 ) ) ( ON ?auto_199995 ?auto_199996 ) ( ON-TABLE ?auto_199997 ) ( ON ?auto_199994 ?auto_199995 ) ( ON ?auto_199993 ?auto_199994 ) ( ON ?auto_199992 ?auto_199993 ) ( ON ?auto_199991 ?auto_199992 ) ( ON ?auto_199990 ?auto_199991 ) ( CLEAR ?auto_199990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_199997 ?auto_199996 ?auto_199995 ?auto_199994 ?auto_199993 ?auto_199992 ?auto_199991 )
      ( MAKE-7PILE ?auto_199990 ?auto_199991 ?auto_199992 ?auto_199993 ?auto_199994 ?auto_199995 ?auto_199996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_199998 - BLOCK
      ?auto_199999 - BLOCK
      ?auto_200000 - BLOCK
      ?auto_200001 - BLOCK
      ?auto_200002 - BLOCK
      ?auto_200003 - BLOCK
      ?auto_200004 - BLOCK
    )
    :vars
    (
      ?auto_200005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_199998 ?auto_199999 ) ) ( not ( = ?auto_199998 ?auto_200000 ) ) ( not ( = ?auto_199998 ?auto_200001 ) ) ( not ( = ?auto_199998 ?auto_200002 ) ) ( not ( = ?auto_199998 ?auto_200003 ) ) ( not ( = ?auto_199998 ?auto_200004 ) ) ( not ( = ?auto_199999 ?auto_200000 ) ) ( not ( = ?auto_199999 ?auto_200001 ) ) ( not ( = ?auto_199999 ?auto_200002 ) ) ( not ( = ?auto_199999 ?auto_200003 ) ) ( not ( = ?auto_199999 ?auto_200004 ) ) ( not ( = ?auto_200000 ?auto_200001 ) ) ( not ( = ?auto_200000 ?auto_200002 ) ) ( not ( = ?auto_200000 ?auto_200003 ) ) ( not ( = ?auto_200000 ?auto_200004 ) ) ( not ( = ?auto_200001 ?auto_200002 ) ) ( not ( = ?auto_200001 ?auto_200003 ) ) ( not ( = ?auto_200001 ?auto_200004 ) ) ( not ( = ?auto_200002 ?auto_200003 ) ) ( not ( = ?auto_200002 ?auto_200004 ) ) ( not ( = ?auto_200003 ?auto_200004 ) ) ( ON ?auto_200004 ?auto_200005 ) ( not ( = ?auto_199998 ?auto_200005 ) ) ( not ( = ?auto_199999 ?auto_200005 ) ) ( not ( = ?auto_200000 ?auto_200005 ) ) ( not ( = ?auto_200001 ?auto_200005 ) ) ( not ( = ?auto_200002 ?auto_200005 ) ) ( not ( = ?auto_200003 ?auto_200005 ) ) ( not ( = ?auto_200004 ?auto_200005 ) ) ( ON ?auto_200003 ?auto_200004 ) ( ON-TABLE ?auto_200005 ) ( ON ?auto_200002 ?auto_200003 ) ( ON ?auto_200001 ?auto_200002 ) ( ON ?auto_200000 ?auto_200001 ) ( ON ?auto_199999 ?auto_200000 ) ( HOLDING ?auto_199998 ) ( CLEAR ?auto_199999 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200005 ?auto_200004 ?auto_200003 ?auto_200002 ?auto_200001 ?auto_200000 ?auto_199999 ?auto_199998 )
      ( MAKE-7PILE ?auto_199998 ?auto_199999 ?auto_200000 ?auto_200001 ?auto_200002 ?auto_200003 ?auto_200004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200006 - BLOCK
      ?auto_200007 - BLOCK
      ?auto_200008 - BLOCK
      ?auto_200009 - BLOCK
      ?auto_200010 - BLOCK
      ?auto_200011 - BLOCK
      ?auto_200012 - BLOCK
    )
    :vars
    (
      ?auto_200013 - BLOCK
      ?auto_200014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200006 ?auto_200007 ) ) ( not ( = ?auto_200006 ?auto_200008 ) ) ( not ( = ?auto_200006 ?auto_200009 ) ) ( not ( = ?auto_200006 ?auto_200010 ) ) ( not ( = ?auto_200006 ?auto_200011 ) ) ( not ( = ?auto_200006 ?auto_200012 ) ) ( not ( = ?auto_200007 ?auto_200008 ) ) ( not ( = ?auto_200007 ?auto_200009 ) ) ( not ( = ?auto_200007 ?auto_200010 ) ) ( not ( = ?auto_200007 ?auto_200011 ) ) ( not ( = ?auto_200007 ?auto_200012 ) ) ( not ( = ?auto_200008 ?auto_200009 ) ) ( not ( = ?auto_200008 ?auto_200010 ) ) ( not ( = ?auto_200008 ?auto_200011 ) ) ( not ( = ?auto_200008 ?auto_200012 ) ) ( not ( = ?auto_200009 ?auto_200010 ) ) ( not ( = ?auto_200009 ?auto_200011 ) ) ( not ( = ?auto_200009 ?auto_200012 ) ) ( not ( = ?auto_200010 ?auto_200011 ) ) ( not ( = ?auto_200010 ?auto_200012 ) ) ( not ( = ?auto_200011 ?auto_200012 ) ) ( ON ?auto_200012 ?auto_200013 ) ( not ( = ?auto_200006 ?auto_200013 ) ) ( not ( = ?auto_200007 ?auto_200013 ) ) ( not ( = ?auto_200008 ?auto_200013 ) ) ( not ( = ?auto_200009 ?auto_200013 ) ) ( not ( = ?auto_200010 ?auto_200013 ) ) ( not ( = ?auto_200011 ?auto_200013 ) ) ( not ( = ?auto_200012 ?auto_200013 ) ) ( ON ?auto_200011 ?auto_200012 ) ( ON-TABLE ?auto_200013 ) ( ON ?auto_200010 ?auto_200011 ) ( ON ?auto_200009 ?auto_200010 ) ( ON ?auto_200008 ?auto_200009 ) ( ON ?auto_200007 ?auto_200008 ) ( CLEAR ?auto_200007 ) ( ON ?auto_200006 ?auto_200014 ) ( CLEAR ?auto_200006 ) ( HAND-EMPTY ) ( not ( = ?auto_200006 ?auto_200014 ) ) ( not ( = ?auto_200007 ?auto_200014 ) ) ( not ( = ?auto_200008 ?auto_200014 ) ) ( not ( = ?auto_200009 ?auto_200014 ) ) ( not ( = ?auto_200010 ?auto_200014 ) ) ( not ( = ?auto_200011 ?auto_200014 ) ) ( not ( = ?auto_200012 ?auto_200014 ) ) ( not ( = ?auto_200013 ?auto_200014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200006 ?auto_200014 )
      ( MAKE-7PILE ?auto_200006 ?auto_200007 ?auto_200008 ?auto_200009 ?auto_200010 ?auto_200011 ?auto_200012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200015 - BLOCK
      ?auto_200016 - BLOCK
      ?auto_200017 - BLOCK
      ?auto_200018 - BLOCK
      ?auto_200019 - BLOCK
      ?auto_200020 - BLOCK
      ?auto_200021 - BLOCK
    )
    :vars
    (
      ?auto_200023 - BLOCK
      ?auto_200022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200015 ?auto_200016 ) ) ( not ( = ?auto_200015 ?auto_200017 ) ) ( not ( = ?auto_200015 ?auto_200018 ) ) ( not ( = ?auto_200015 ?auto_200019 ) ) ( not ( = ?auto_200015 ?auto_200020 ) ) ( not ( = ?auto_200015 ?auto_200021 ) ) ( not ( = ?auto_200016 ?auto_200017 ) ) ( not ( = ?auto_200016 ?auto_200018 ) ) ( not ( = ?auto_200016 ?auto_200019 ) ) ( not ( = ?auto_200016 ?auto_200020 ) ) ( not ( = ?auto_200016 ?auto_200021 ) ) ( not ( = ?auto_200017 ?auto_200018 ) ) ( not ( = ?auto_200017 ?auto_200019 ) ) ( not ( = ?auto_200017 ?auto_200020 ) ) ( not ( = ?auto_200017 ?auto_200021 ) ) ( not ( = ?auto_200018 ?auto_200019 ) ) ( not ( = ?auto_200018 ?auto_200020 ) ) ( not ( = ?auto_200018 ?auto_200021 ) ) ( not ( = ?auto_200019 ?auto_200020 ) ) ( not ( = ?auto_200019 ?auto_200021 ) ) ( not ( = ?auto_200020 ?auto_200021 ) ) ( ON ?auto_200021 ?auto_200023 ) ( not ( = ?auto_200015 ?auto_200023 ) ) ( not ( = ?auto_200016 ?auto_200023 ) ) ( not ( = ?auto_200017 ?auto_200023 ) ) ( not ( = ?auto_200018 ?auto_200023 ) ) ( not ( = ?auto_200019 ?auto_200023 ) ) ( not ( = ?auto_200020 ?auto_200023 ) ) ( not ( = ?auto_200021 ?auto_200023 ) ) ( ON ?auto_200020 ?auto_200021 ) ( ON-TABLE ?auto_200023 ) ( ON ?auto_200019 ?auto_200020 ) ( ON ?auto_200018 ?auto_200019 ) ( ON ?auto_200017 ?auto_200018 ) ( ON ?auto_200015 ?auto_200022 ) ( CLEAR ?auto_200015 ) ( not ( = ?auto_200015 ?auto_200022 ) ) ( not ( = ?auto_200016 ?auto_200022 ) ) ( not ( = ?auto_200017 ?auto_200022 ) ) ( not ( = ?auto_200018 ?auto_200022 ) ) ( not ( = ?auto_200019 ?auto_200022 ) ) ( not ( = ?auto_200020 ?auto_200022 ) ) ( not ( = ?auto_200021 ?auto_200022 ) ) ( not ( = ?auto_200023 ?auto_200022 ) ) ( HOLDING ?auto_200016 ) ( CLEAR ?auto_200017 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200023 ?auto_200021 ?auto_200020 ?auto_200019 ?auto_200018 ?auto_200017 ?auto_200016 )
      ( MAKE-7PILE ?auto_200015 ?auto_200016 ?auto_200017 ?auto_200018 ?auto_200019 ?auto_200020 ?auto_200021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200024 - BLOCK
      ?auto_200025 - BLOCK
      ?auto_200026 - BLOCK
      ?auto_200027 - BLOCK
      ?auto_200028 - BLOCK
      ?auto_200029 - BLOCK
      ?auto_200030 - BLOCK
    )
    :vars
    (
      ?auto_200031 - BLOCK
      ?auto_200032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200024 ?auto_200025 ) ) ( not ( = ?auto_200024 ?auto_200026 ) ) ( not ( = ?auto_200024 ?auto_200027 ) ) ( not ( = ?auto_200024 ?auto_200028 ) ) ( not ( = ?auto_200024 ?auto_200029 ) ) ( not ( = ?auto_200024 ?auto_200030 ) ) ( not ( = ?auto_200025 ?auto_200026 ) ) ( not ( = ?auto_200025 ?auto_200027 ) ) ( not ( = ?auto_200025 ?auto_200028 ) ) ( not ( = ?auto_200025 ?auto_200029 ) ) ( not ( = ?auto_200025 ?auto_200030 ) ) ( not ( = ?auto_200026 ?auto_200027 ) ) ( not ( = ?auto_200026 ?auto_200028 ) ) ( not ( = ?auto_200026 ?auto_200029 ) ) ( not ( = ?auto_200026 ?auto_200030 ) ) ( not ( = ?auto_200027 ?auto_200028 ) ) ( not ( = ?auto_200027 ?auto_200029 ) ) ( not ( = ?auto_200027 ?auto_200030 ) ) ( not ( = ?auto_200028 ?auto_200029 ) ) ( not ( = ?auto_200028 ?auto_200030 ) ) ( not ( = ?auto_200029 ?auto_200030 ) ) ( ON ?auto_200030 ?auto_200031 ) ( not ( = ?auto_200024 ?auto_200031 ) ) ( not ( = ?auto_200025 ?auto_200031 ) ) ( not ( = ?auto_200026 ?auto_200031 ) ) ( not ( = ?auto_200027 ?auto_200031 ) ) ( not ( = ?auto_200028 ?auto_200031 ) ) ( not ( = ?auto_200029 ?auto_200031 ) ) ( not ( = ?auto_200030 ?auto_200031 ) ) ( ON ?auto_200029 ?auto_200030 ) ( ON-TABLE ?auto_200031 ) ( ON ?auto_200028 ?auto_200029 ) ( ON ?auto_200027 ?auto_200028 ) ( ON ?auto_200026 ?auto_200027 ) ( ON ?auto_200024 ?auto_200032 ) ( not ( = ?auto_200024 ?auto_200032 ) ) ( not ( = ?auto_200025 ?auto_200032 ) ) ( not ( = ?auto_200026 ?auto_200032 ) ) ( not ( = ?auto_200027 ?auto_200032 ) ) ( not ( = ?auto_200028 ?auto_200032 ) ) ( not ( = ?auto_200029 ?auto_200032 ) ) ( not ( = ?auto_200030 ?auto_200032 ) ) ( not ( = ?auto_200031 ?auto_200032 ) ) ( CLEAR ?auto_200026 ) ( ON ?auto_200025 ?auto_200024 ) ( CLEAR ?auto_200025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200032 ?auto_200024 )
      ( MAKE-7PILE ?auto_200024 ?auto_200025 ?auto_200026 ?auto_200027 ?auto_200028 ?auto_200029 ?auto_200030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200033 - BLOCK
      ?auto_200034 - BLOCK
      ?auto_200035 - BLOCK
      ?auto_200036 - BLOCK
      ?auto_200037 - BLOCK
      ?auto_200038 - BLOCK
      ?auto_200039 - BLOCK
    )
    :vars
    (
      ?auto_200041 - BLOCK
      ?auto_200040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200033 ?auto_200034 ) ) ( not ( = ?auto_200033 ?auto_200035 ) ) ( not ( = ?auto_200033 ?auto_200036 ) ) ( not ( = ?auto_200033 ?auto_200037 ) ) ( not ( = ?auto_200033 ?auto_200038 ) ) ( not ( = ?auto_200033 ?auto_200039 ) ) ( not ( = ?auto_200034 ?auto_200035 ) ) ( not ( = ?auto_200034 ?auto_200036 ) ) ( not ( = ?auto_200034 ?auto_200037 ) ) ( not ( = ?auto_200034 ?auto_200038 ) ) ( not ( = ?auto_200034 ?auto_200039 ) ) ( not ( = ?auto_200035 ?auto_200036 ) ) ( not ( = ?auto_200035 ?auto_200037 ) ) ( not ( = ?auto_200035 ?auto_200038 ) ) ( not ( = ?auto_200035 ?auto_200039 ) ) ( not ( = ?auto_200036 ?auto_200037 ) ) ( not ( = ?auto_200036 ?auto_200038 ) ) ( not ( = ?auto_200036 ?auto_200039 ) ) ( not ( = ?auto_200037 ?auto_200038 ) ) ( not ( = ?auto_200037 ?auto_200039 ) ) ( not ( = ?auto_200038 ?auto_200039 ) ) ( ON ?auto_200039 ?auto_200041 ) ( not ( = ?auto_200033 ?auto_200041 ) ) ( not ( = ?auto_200034 ?auto_200041 ) ) ( not ( = ?auto_200035 ?auto_200041 ) ) ( not ( = ?auto_200036 ?auto_200041 ) ) ( not ( = ?auto_200037 ?auto_200041 ) ) ( not ( = ?auto_200038 ?auto_200041 ) ) ( not ( = ?auto_200039 ?auto_200041 ) ) ( ON ?auto_200038 ?auto_200039 ) ( ON-TABLE ?auto_200041 ) ( ON ?auto_200037 ?auto_200038 ) ( ON ?auto_200036 ?auto_200037 ) ( ON ?auto_200033 ?auto_200040 ) ( not ( = ?auto_200033 ?auto_200040 ) ) ( not ( = ?auto_200034 ?auto_200040 ) ) ( not ( = ?auto_200035 ?auto_200040 ) ) ( not ( = ?auto_200036 ?auto_200040 ) ) ( not ( = ?auto_200037 ?auto_200040 ) ) ( not ( = ?auto_200038 ?auto_200040 ) ) ( not ( = ?auto_200039 ?auto_200040 ) ) ( not ( = ?auto_200041 ?auto_200040 ) ) ( ON ?auto_200034 ?auto_200033 ) ( CLEAR ?auto_200034 ) ( ON-TABLE ?auto_200040 ) ( HOLDING ?auto_200035 ) ( CLEAR ?auto_200036 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200041 ?auto_200039 ?auto_200038 ?auto_200037 ?auto_200036 ?auto_200035 )
      ( MAKE-7PILE ?auto_200033 ?auto_200034 ?auto_200035 ?auto_200036 ?auto_200037 ?auto_200038 ?auto_200039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200042 - BLOCK
      ?auto_200043 - BLOCK
      ?auto_200044 - BLOCK
      ?auto_200045 - BLOCK
      ?auto_200046 - BLOCK
      ?auto_200047 - BLOCK
      ?auto_200048 - BLOCK
    )
    :vars
    (
      ?auto_200049 - BLOCK
      ?auto_200050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200042 ?auto_200043 ) ) ( not ( = ?auto_200042 ?auto_200044 ) ) ( not ( = ?auto_200042 ?auto_200045 ) ) ( not ( = ?auto_200042 ?auto_200046 ) ) ( not ( = ?auto_200042 ?auto_200047 ) ) ( not ( = ?auto_200042 ?auto_200048 ) ) ( not ( = ?auto_200043 ?auto_200044 ) ) ( not ( = ?auto_200043 ?auto_200045 ) ) ( not ( = ?auto_200043 ?auto_200046 ) ) ( not ( = ?auto_200043 ?auto_200047 ) ) ( not ( = ?auto_200043 ?auto_200048 ) ) ( not ( = ?auto_200044 ?auto_200045 ) ) ( not ( = ?auto_200044 ?auto_200046 ) ) ( not ( = ?auto_200044 ?auto_200047 ) ) ( not ( = ?auto_200044 ?auto_200048 ) ) ( not ( = ?auto_200045 ?auto_200046 ) ) ( not ( = ?auto_200045 ?auto_200047 ) ) ( not ( = ?auto_200045 ?auto_200048 ) ) ( not ( = ?auto_200046 ?auto_200047 ) ) ( not ( = ?auto_200046 ?auto_200048 ) ) ( not ( = ?auto_200047 ?auto_200048 ) ) ( ON ?auto_200048 ?auto_200049 ) ( not ( = ?auto_200042 ?auto_200049 ) ) ( not ( = ?auto_200043 ?auto_200049 ) ) ( not ( = ?auto_200044 ?auto_200049 ) ) ( not ( = ?auto_200045 ?auto_200049 ) ) ( not ( = ?auto_200046 ?auto_200049 ) ) ( not ( = ?auto_200047 ?auto_200049 ) ) ( not ( = ?auto_200048 ?auto_200049 ) ) ( ON ?auto_200047 ?auto_200048 ) ( ON-TABLE ?auto_200049 ) ( ON ?auto_200046 ?auto_200047 ) ( ON ?auto_200045 ?auto_200046 ) ( ON ?auto_200042 ?auto_200050 ) ( not ( = ?auto_200042 ?auto_200050 ) ) ( not ( = ?auto_200043 ?auto_200050 ) ) ( not ( = ?auto_200044 ?auto_200050 ) ) ( not ( = ?auto_200045 ?auto_200050 ) ) ( not ( = ?auto_200046 ?auto_200050 ) ) ( not ( = ?auto_200047 ?auto_200050 ) ) ( not ( = ?auto_200048 ?auto_200050 ) ) ( not ( = ?auto_200049 ?auto_200050 ) ) ( ON ?auto_200043 ?auto_200042 ) ( ON-TABLE ?auto_200050 ) ( CLEAR ?auto_200045 ) ( ON ?auto_200044 ?auto_200043 ) ( CLEAR ?auto_200044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200050 ?auto_200042 ?auto_200043 )
      ( MAKE-7PILE ?auto_200042 ?auto_200043 ?auto_200044 ?auto_200045 ?auto_200046 ?auto_200047 ?auto_200048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200051 - BLOCK
      ?auto_200052 - BLOCK
      ?auto_200053 - BLOCK
      ?auto_200054 - BLOCK
      ?auto_200055 - BLOCK
      ?auto_200056 - BLOCK
      ?auto_200057 - BLOCK
    )
    :vars
    (
      ?auto_200059 - BLOCK
      ?auto_200058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200051 ?auto_200052 ) ) ( not ( = ?auto_200051 ?auto_200053 ) ) ( not ( = ?auto_200051 ?auto_200054 ) ) ( not ( = ?auto_200051 ?auto_200055 ) ) ( not ( = ?auto_200051 ?auto_200056 ) ) ( not ( = ?auto_200051 ?auto_200057 ) ) ( not ( = ?auto_200052 ?auto_200053 ) ) ( not ( = ?auto_200052 ?auto_200054 ) ) ( not ( = ?auto_200052 ?auto_200055 ) ) ( not ( = ?auto_200052 ?auto_200056 ) ) ( not ( = ?auto_200052 ?auto_200057 ) ) ( not ( = ?auto_200053 ?auto_200054 ) ) ( not ( = ?auto_200053 ?auto_200055 ) ) ( not ( = ?auto_200053 ?auto_200056 ) ) ( not ( = ?auto_200053 ?auto_200057 ) ) ( not ( = ?auto_200054 ?auto_200055 ) ) ( not ( = ?auto_200054 ?auto_200056 ) ) ( not ( = ?auto_200054 ?auto_200057 ) ) ( not ( = ?auto_200055 ?auto_200056 ) ) ( not ( = ?auto_200055 ?auto_200057 ) ) ( not ( = ?auto_200056 ?auto_200057 ) ) ( ON ?auto_200057 ?auto_200059 ) ( not ( = ?auto_200051 ?auto_200059 ) ) ( not ( = ?auto_200052 ?auto_200059 ) ) ( not ( = ?auto_200053 ?auto_200059 ) ) ( not ( = ?auto_200054 ?auto_200059 ) ) ( not ( = ?auto_200055 ?auto_200059 ) ) ( not ( = ?auto_200056 ?auto_200059 ) ) ( not ( = ?auto_200057 ?auto_200059 ) ) ( ON ?auto_200056 ?auto_200057 ) ( ON-TABLE ?auto_200059 ) ( ON ?auto_200055 ?auto_200056 ) ( ON ?auto_200051 ?auto_200058 ) ( not ( = ?auto_200051 ?auto_200058 ) ) ( not ( = ?auto_200052 ?auto_200058 ) ) ( not ( = ?auto_200053 ?auto_200058 ) ) ( not ( = ?auto_200054 ?auto_200058 ) ) ( not ( = ?auto_200055 ?auto_200058 ) ) ( not ( = ?auto_200056 ?auto_200058 ) ) ( not ( = ?auto_200057 ?auto_200058 ) ) ( not ( = ?auto_200059 ?auto_200058 ) ) ( ON ?auto_200052 ?auto_200051 ) ( ON-TABLE ?auto_200058 ) ( ON ?auto_200053 ?auto_200052 ) ( CLEAR ?auto_200053 ) ( HOLDING ?auto_200054 ) ( CLEAR ?auto_200055 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200059 ?auto_200057 ?auto_200056 ?auto_200055 ?auto_200054 )
      ( MAKE-7PILE ?auto_200051 ?auto_200052 ?auto_200053 ?auto_200054 ?auto_200055 ?auto_200056 ?auto_200057 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200060 - BLOCK
      ?auto_200061 - BLOCK
      ?auto_200062 - BLOCK
      ?auto_200063 - BLOCK
      ?auto_200064 - BLOCK
      ?auto_200065 - BLOCK
      ?auto_200066 - BLOCK
    )
    :vars
    (
      ?auto_200067 - BLOCK
      ?auto_200068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200060 ?auto_200061 ) ) ( not ( = ?auto_200060 ?auto_200062 ) ) ( not ( = ?auto_200060 ?auto_200063 ) ) ( not ( = ?auto_200060 ?auto_200064 ) ) ( not ( = ?auto_200060 ?auto_200065 ) ) ( not ( = ?auto_200060 ?auto_200066 ) ) ( not ( = ?auto_200061 ?auto_200062 ) ) ( not ( = ?auto_200061 ?auto_200063 ) ) ( not ( = ?auto_200061 ?auto_200064 ) ) ( not ( = ?auto_200061 ?auto_200065 ) ) ( not ( = ?auto_200061 ?auto_200066 ) ) ( not ( = ?auto_200062 ?auto_200063 ) ) ( not ( = ?auto_200062 ?auto_200064 ) ) ( not ( = ?auto_200062 ?auto_200065 ) ) ( not ( = ?auto_200062 ?auto_200066 ) ) ( not ( = ?auto_200063 ?auto_200064 ) ) ( not ( = ?auto_200063 ?auto_200065 ) ) ( not ( = ?auto_200063 ?auto_200066 ) ) ( not ( = ?auto_200064 ?auto_200065 ) ) ( not ( = ?auto_200064 ?auto_200066 ) ) ( not ( = ?auto_200065 ?auto_200066 ) ) ( ON ?auto_200066 ?auto_200067 ) ( not ( = ?auto_200060 ?auto_200067 ) ) ( not ( = ?auto_200061 ?auto_200067 ) ) ( not ( = ?auto_200062 ?auto_200067 ) ) ( not ( = ?auto_200063 ?auto_200067 ) ) ( not ( = ?auto_200064 ?auto_200067 ) ) ( not ( = ?auto_200065 ?auto_200067 ) ) ( not ( = ?auto_200066 ?auto_200067 ) ) ( ON ?auto_200065 ?auto_200066 ) ( ON-TABLE ?auto_200067 ) ( ON ?auto_200064 ?auto_200065 ) ( ON ?auto_200060 ?auto_200068 ) ( not ( = ?auto_200060 ?auto_200068 ) ) ( not ( = ?auto_200061 ?auto_200068 ) ) ( not ( = ?auto_200062 ?auto_200068 ) ) ( not ( = ?auto_200063 ?auto_200068 ) ) ( not ( = ?auto_200064 ?auto_200068 ) ) ( not ( = ?auto_200065 ?auto_200068 ) ) ( not ( = ?auto_200066 ?auto_200068 ) ) ( not ( = ?auto_200067 ?auto_200068 ) ) ( ON ?auto_200061 ?auto_200060 ) ( ON-TABLE ?auto_200068 ) ( ON ?auto_200062 ?auto_200061 ) ( CLEAR ?auto_200064 ) ( ON ?auto_200063 ?auto_200062 ) ( CLEAR ?auto_200063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200068 ?auto_200060 ?auto_200061 ?auto_200062 )
      ( MAKE-7PILE ?auto_200060 ?auto_200061 ?auto_200062 ?auto_200063 ?auto_200064 ?auto_200065 ?auto_200066 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200069 - BLOCK
      ?auto_200070 - BLOCK
      ?auto_200071 - BLOCK
      ?auto_200072 - BLOCK
      ?auto_200073 - BLOCK
      ?auto_200074 - BLOCK
      ?auto_200075 - BLOCK
    )
    :vars
    (
      ?auto_200077 - BLOCK
      ?auto_200076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200069 ?auto_200070 ) ) ( not ( = ?auto_200069 ?auto_200071 ) ) ( not ( = ?auto_200069 ?auto_200072 ) ) ( not ( = ?auto_200069 ?auto_200073 ) ) ( not ( = ?auto_200069 ?auto_200074 ) ) ( not ( = ?auto_200069 ?auto_200075 ) ) ( not ( = ?auto_200070 ?auto_200071 ) ) ( not ( = ?auto_200070 ?auto_200072 ) ) ( not ( = ?auto_200070 ?auto_200073 ) ) ( not ( = ?auto_200070 ?auto_200074 ) ) ( not ( = ?auto_200070 ?auto_200075 ) ) ( not ( = ?auto_200071 ?auto_200072 ) ) ( not ( = ?auto_200071 ?auto_200073 ) ) ( not ( = ?auto_200071 ?auto_200074 ) ) ( not ( = ?auto_200071 ?auto_200075 ) ) ( not ( = ?auto_200072 ?auto_200073 ) ) ( not ( = ?auto_200072 ?auto_200074 ) ) ( not ( = ?auto_200072 ?auto_200075 ) ) ( not ( = ?auto_200073 ?auto_200074 ) ) ( not ( = ?auto_200073 ?auto_200075 ) ) ( not ( = ?auto_200074 ?auto_200075 ) ) ( ON ?auto_200075 ?auto_200077 ) ( not ( = ?auto_200069 ?auto_200077 ) ) ( not ( = ?auto_200070 ?auto_200077 ) ) ( not ( = ?auto_200071 ?auto_200077 ) ) ( not ( = ?auto_200072 ?auto_200077 ) ) ( not ( = ?auto_200073 ?auto_200077 ) ) ( not ( = ?auto_200074 ?auto_200077 ) ) ( not ( = ?auto_200075 ?auto_200077 ) ) ( ON ?auto_200074 ?auto_200075 ) ( ON-TABLE ?auto_200077 ) ( ON ?auto_200069 ?auto_200076 ) ( not ( = ?auto_200069 ?auto_200076 ) ) ( not ( = ?auto_200070 ?auto_200076 ) ) ( not ( = ?auto_200071 ?auto_200076 ) ) ( not ( = ?auto_200072 ?auto_200076 ) ) ( not ( = ?auto_200073 ?auto_200076 ) ) ( not ( = ?auto_200074 ?auto_200076 ) ) ( not ( = ?auto_200075 ?auto_200076 ) ) ( not ( = ?auto_200077 ?auto_200076 ) ) ( ON ?auto_200070 ?auto_200069 ) ( ON-TABLE ?auto_200076 ) ( ON ?auto_200071 ?auto_200070 ) ( ON ?auto_200072 ?auto_200071 ) ( CLEAR ?auto_200072 ) ( HOLDING ?auto_200073 ) ( CLEAR ?auto_200074 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200077 ?auto_200075 ?auto_200074 ?auto_200073 )
      ( MAKE-7PILE ?auto_200069 ?auto_200070 ?auto_200071 ?auto_200072 ?auto_200073 ?auto_200074 ?auto_200075 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200078 - BLOCK
      ?auto_200079 - BLOCK
      ?auto_200080 - BLOCK
      ?auto_200081 - BLOCK
      ?auto_200082 - BLOCK
      ?auto_200083 - BLOCK
      ?auto_200084 - BLOCK
    )
    :vars
    (
      ?auto_200085 - BLOCK
      ?auto_200086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200078 ?auto_200079 ) ) ( not ( = ?auto_200078 ?auto_200080 ) ) ( not ( = ?auto_200078 ?auto_200081 ) ) ( not ( = ?auto_200078 ?auto_200082 ) ) ( not ( = ?auto_200078 ?auto_200083 ) ) ( not ( = ?auto_200078 ?auto_200084 ) ) ( not ( = ?auto_200079 ?auto_200080 ) ) ( not ( = ?auto_200079 ?auto_200081 ) ) ( not ( = ?auto_200079 ?auto_200082 ) ) ( not ( = ?auto_200079 ?auto_200083 ) ) ( not ( = ?auto_200079 ?auto_200084 ) ) ( not ( = ?auto_200080 ?auto_200081 ) ) ( not ( = ?auto_200080 ?auto_200082 ) ) ( not ( = ?auto_200080 ?auto_200083 ) ) ( not ( = ?auto_200080 ?auto_200084 ) ) ( not ( = ?auto_200081 ?auto_200082 ) ) ( not ( = ?auto_200081 ?auto_200083 ) ) ( not ( = ?auto_200081 ?auto_200084 ) ) ( not ( = ?auto_200082 ?auto_200083 ) ) ( not ( = ?auto_200082 ?auto_200084 ) ) ( not ( = ?auto_200083 ?auto_200084 ) ) ( ON ?auto_200084 ?auto_200085 ) ( not ( = ?auto_200078 ?auto_200085 ) ) ( not ( = ?auto_200079 ?auto_200085 ) ) ( not ( = ?auto_200080 ?auto_200085 ) ) ( not ( = ?auto_200081 ?auto_200085 ) ) ( not ( = ?auto_200082 ?auto_200085 ) ) ( not ( = ?auto_200083 ?auto_200085 ) ) ( not ( = ?auto_200084 ?auto_200085 ) ) ( ON ?auto_200083 ?auto_200084 ) ( ON-TABLE ?auto_200085 ) ( ON ?auto_200078 ?auto_200086 ) ( not ( = ?auto_200078 ?auto_200086 ) ) ( not ( = ?auto_200079 ?auto_200086 ) ) ( not ( = ?auto_200080 ?auto_200086 ) ) ( not ( = ?auto_200081 ?auto_200086 ) ) ( not ( = ?auto_200082 ?auto_200086 ) ) ( not ( = ?auto_200083 ?auto_200086 ) ) ( not ( = ?auto_200084 ?auto_200086 ) ) ( not ( = ?auto_200085 ?auto_200086 ) ) ( ON ?auto_200079 ?auto_200078 ) ( ON-TABLE ?auto_200086 ) ( ON ?auto_200080 ?auto_200079 ) ( ON ?auto_200081 ?auto_200080 ) ( CLEAR ?auto_200083 ) ( ON ?auto_200082 ?auto_200081 ) ( CLEAR ?auto_200082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200086 ?auto_200078 ?auto_200079 ?auto_200080 ?auto_200081 )
      ( MAKE-7PILE ?auto_200078 ?auto_200079 ?auto_200080 ?auto_200081 ?auto_200082 ?auto_200083 ?auto_200084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200087 - BLOCK
      ?auto_200088 - BLOCK
      ?auto_200089 - BLOCK
      ?auto_200090 - BLOCK
      ?auto_200091 - BLOCK
      ?auto_200092 - BLOCK
      ?auto_200093 - BLOCK
    )
    :vars
    (
      ?auto_200094 - BLOCK
      ?auto_200095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200087 ?auto_200088 ) ) ( not ( = ?auto_200087 ?auto_200089 ) ) ( not ( = ?auto_200087 ?auto_200090 ) ) ( not ( = ?auto_200087 ?auto_200091 ) ) ( not ( = ?auto_200087 ?auto_200092 ) ) ( not ( = ?auto_200087 ?auto_200093 ) ) ( not ( = ?auto_200088 ?auto_200089 ) ) ( not ( = ?auto_200088 ?auto_200090 ) ) ( not ( = ?auto_200088 ?auto_200091 ) ) ( not ( = ?auto_200088 ?auto_200092 ) ) ( not ( = ?auto_200088 ?auto_200093 ) ) ( not ( = ?auto_200089 ?auto_200090 ) ) ( not ( = ?auto_200089 ?auto_200091 ) ) ( not ( = ?auto_200089 ?auto_200092 ) ) ( not ( = ?auto_200089 ?auto_200093 ) ) ( not ( = ?auto_200090 ?auto_200091 ) ) ( not ( = ?auto_200090 ?auto_200092 ) ) ( not ( = ?auto_200090 ?auto_200093 ) ) ( not ( = ?auto_200091 ?auto_200092 ) ) ( not ( = ?auto_200091 ?auto_200093 ) ) ( not ( = ?auto_200092 ?auto_200093 ) ) ( ON ?auto_200093 ?auto_200094 ) ( not ( = ?auto_200087 ?auto_200094 ) ) ( not ( = ?auto_200088 ?auto_200094 ) ) ( not ( = ?auto_200089 ?auto_200094 ) ) ( not ( = ?auto_200090 ?auto_200094 ) ) ( not ( = ?auto_200091 ?auto_200094 ) ) ( not ( = ?auto_200092 ?auto_200094 ) ) ( not ( = ?auto_200093 ?auto_200094 ) ) ( ON-TABLE ?auto_200094 ) ( ON ?auto_200087 ?auto_200095 ) ( not ( = ?auto_200087 ?auto_200095 ) ) ( not ( = ?auto_200088 ?auto_200095 ) ) ( not ( = ?auto_200089 ?auto_200095 ) ) ( not ( = ?auto_200090 ?auto_200095 ) ) ( not ( = ?auto_200091 ?auto_200095 ) ) ( not ( = ?auto_200092 ?auto_200095 ) ) ( not ( = ?auto_200093 ?auto_200095 ) ) ( not ( = ?auto_200094 ?auto_200095 ) ) ( ON ?auto_200088 ?auto_200087 ) ( ON-TABLE ?auto_200095 ) ( ON ?auto_200089 ?auto_200088 ) ( ON ?auto_200090 ?auto_200089 ) ( ON ?auto_200091 ?auto_200090 ) ( CLEAR ?auto_200091 ) ( HOLDING ?auto_200092 ) ( CLEAR ?auto_200093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200094 ?auto_200093 ?auto_200092 )
      ( MAKE-7PILE ?auto_200087 ?auto_200088 ?auto_200089 ?auto_200090 ?auto_200091 ?auto_200092 ?auto_200093 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200096 - BLOCK
      ?auto_200097 - BLOCK
      ?auto_200098 - BLOCK
      ?auto_200099 - BLOCK
      ?auto_200100 - BLOCK
      ?auto_200101 - BLOCK
      ?auto_200102 - BLOCK
    )
    :vars
    (
      ?auto_200103 - BLOCK
      ?auto_200104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200096 ?auto_200097 ) ) ( not ( = ?auto_200096 ?auto_200098 ) ) ( not ( = ?auto_200096 ?auto_200099 ) ) ( not ( = ?auto_200096 ?auto_200100 ) ) ( not ( = ?auto_200096 ?auto_200101 ) ) ( not ( = ?auto_200096 ?auto_200102 ) ) ( not ( = ?auto_200097 ?auto_200098 ) ) ( not ( = ?auto_200097 ?auto_200099 ) ) ( not ( = ?auto_200097 ?auto_200100 ) ) ( not ( = ?auto_200097 ?auto_200101 ) ) ( not ( = ?auto_200097 ?auto_200102 ) ) ( not ( = ?auto_200098 ?auto_200099 ) ) ( not ( = ?auto_200098 ?auto_200100 ) ) ( not ( = ?auto_200098 ?auto_200101 ) ) ( not ( = ?auto_200098 ?auto_200102 ) ) ( not ( = ?auto_200099 ?auto_200100 ) ) ( not ( = ?auto_200099 ?auto_200101 ) ) ( not ( = ?auto_200099 ?auto_200102 ) ) ( not ( = ?auto_200100 ?auto_200101 ) ) ( not ( = ?auto_200100 ?auto_200102 ) ) ( not ( = ?auto_200101 ?auto_200102 ) ) ( ON ?auto_200102 ?auto_200103 ) ( not ( = ?auto_200096 ?auto_200103 ) ) ( not ( = ?auto_200097 ?auto_200103 ) ) ( not ( = ?auto_200098 ?auto_200103 ) ) ( not ( = ?auto_200099 ?auto_200103 ) ) ( not ( = ?auto_200100 ?auto_200103 ) ) ( not ( = ?auto_200101 ?auto_200103 ) ) ( not ( = ?auto_200102 ?auto_200103 ) ) ( ON-TABLE ?auto_200103 ) ( ON ?auto_200096 ?auto_200104 ) ( not ( = ?auto_200096 ?auto_200104 ) ) ( not ( = ?auto_200097 ?auto_200104 ) ) ( not ( = ?auto_200098 ?auto_200104 ) ) ( not ( = ?auto_200099 ?auto_200104 ) ) ( not ( = ?auto_200100 ?auto_200104 ) ) ( not ( = ?auto_200101 ?auto_200104 ) ) ( not ( = ?auto_200102 ?auto_200104 ) ) ( not ( = ?auto_200103 ?auto_200104 ) ) ( ON ?auto_200097 ?auto_200096 ) ( ON-TABLE ?auto_200104 ) ( ON ?auto_200098 ?auto_200097 ) ( ON ?auto_200099 ?auto_200098 ) ( ON ?auto_200100 ?auto_200099 ) ( CLEAR ?auto_200102 ) ( ON ?auto_200101 ?auto_200100 ) ( CLEAR ?auto_200101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200104 ?auto_200096 ?auto_200097 ?auto_200098 ?auto_200099 ?auto_200100 )
      ( MAKE-7PILE ?auto_200096 ?auto_200097 ?auto_200098 ?auto_200099 ?auto_200100 ?auto_200101 ?auto_200102 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200105 - BLOCK
      ?auto_200106 - BLOCK
      ?auto_200107 - BLOCK
      ?auto_200108 - BLOCK
      ?auto_200109 - BLOCK
      ?auto_200110 - BLOCK
      ?auto_200111 - BLOCK
    )
    :vars
    (
      ?auto_200113 - BLOCK
      ?auto_200112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200105 ?auto_200106 ) ) ( not ( = ?auto_200105 ?auto_200107 ) ) ( not ( = ?auto_200105 ?auto_200108 ) ) ( not ( = ?auto_200105 ?auto_200109 ) ) ( not ( = ?auto_200105 ?auto_200110 ) ) ( not ( = ?auto_200105 ?auto_200111 ) ) ( not ( = ?auto_200106 ?auto_200107 ) ) ( not ( = ?auto_200106 ?auto_200108 ) ) ( not ( = ?auto_200106 ?auto_200109 ) ) ( not ( = ?auto_200106 ?auto_200110 ) ) ( not ( = ?auto_200106 ?auto_200111 ) ) ( not ( = ?auto_200107 ?auto_200108 ) ) ( not ( = ?auto_200107 ?auto_200109 ) ) ( not ( = ?auto_200107 ?auto_200110 ) ) ( not ( = ?auto_200107 ?auto_200111 ) ) ( not ( = ?auto_200108 ?auto_200109 ) ) ( not ( = ?auto_200108 ?auto_200110 ) ) ( not ( = ?auto_200108 ?auto_200111 ) ) ( not ( = ?auto_200109 ?auto_200110 ) ) ( not ( = ?auto_200109 ?auto_200111 ) ) ( not ( = ?auto_200110 ?auto_200111 ) ) ( not ( = ?auto_200105 ?auto_200113 ) ) ( not ( = ?auto_200106 ?auto_200113 ) ) ( not ( = ?auto_200107 ?auto_200113 ) ) ( not ( = ?auto_200108 ?auto_200113 ) ) ( not ( = ?auto_200109 ?auto_200113 ) ) ( not ( = ?auto_200110 ?auto_200113 ) ) ( not ( = ?auto_200111 ?auto_200113 ) ) ( ON-TABLE ?auto_200113 ) ( ON ?auto_200105 ?auto_200112 ) ( not ( = ?auto_200105 ?auto_200112 ) ) ( not ( = ?auto_200106 ?auto_200112 ) ) ( not ( = ?auto_200107 ?auto_200112 ) ) ( not ( = ?auto_200108 ?auto_200112 ) ) ( not ( = ?auto_200109 ?auto_200112 ) ) ( not ( = ?auto_200110 ?auto_200112 ) ) ( not ( = ?auto_200111 ?auto_200112 ) ) ( not ( = ?auto_200113 ?auto_200112 ) ) ( ON ?auto_200106 ?auto_200105 ) ( ON-TABLE ?auto_200112 ) ( ON ?auto_200107 ?auto_200106 ) ( ON ?auto_200108 ?auto_200107 ) ( ON ?auto_200109 ?auto_200108 ) ( ON ?auto_200110 ?auto_200109 ) ( CLEAR ?auto_200110 ) ( HOLDING ?auto_200111 ) ( CLEAR ?auto_200113 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200113 ?auto_200111 )
      ( MAKE-7PILE ?auto_200105 ?auto_200106 ?auto_200107 ?auto_200108 ?auto_200109 ?auto_200110 ?auto_200111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200114 - BLOCK
      ?auto_200115 - BLOCK
      ?auto_200116 - BLOCK
      ?auto_200117 - BLOCK
      ?auto_200118 - BLOCK
      ?auto_200119 - BLOCK
      ?auto_200120 - BLOCK
    )
    :vars
    (
      ?auto_200122 - BLOCK
      ?auto_200121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200114 ?auto_200115 ) ) ( not ( = ?auto_200114 ?auto_200116 ) ) ( not ( = ?auto_200114 ?auto_200117 ) ) ( not ( = ?auto_200114 ?auto_200118 ) ) ( not ( = ?auto_200114 ?auto_200119 ) ) ( not ( = ?auto_200114 ?auto_200120 ) ) ( not ( = ?auto_200115 ?auto_200116 ) ) ( not ( = ?auto_200115 ?auto_200117 ) ) ( not ( = ?auto_200115 ?auto_200118 ) ) ( not ( = ?auto_200115 ?auto_200119 ) ) ( not ( = ?auto_200115 ?auto_200120 ) ) ( not ( = ?auto_200116 ?auto_200117 ) ) ( not ( = ?auto_200116 ?auto_200118 ) ) ( not ( = ?auto_200116 ?auto_200119 ) ) ( not ( = ?auto_200116 ?auto_200120 ) ) ( not ( = ?auto_200117 ?auto_200118 ) ) ( not ( = ?auto_200117 ?auto_200119 ) ) ( not ( = ?auto_200117 ?auto_200120 ) ) ( not ( = ?auto_200118 ?auto_200119 ) ) ( not ( = ?auto_200118 ?auto_200120 ) ) ( not ( = ?auto_200119 ?auto_200120 ) ) ( not ( = ?auto_200114 ?auto_200122 ) ) ( not ( = ?auto_200115 ?auto_200122 ) ) ( not ( = ?auto_200116 ?auto_200122 ) ) ( not ( = ?auto_200117 ?auto_200122 ) ) ( not ( = ?auto_200118 ?auto_200122 ) ) ( not ( = ?auto_200119 ?auto_200122 ) ) ( not ( = ?auto_200120 ?auto_200122 ) ) ( ON-TABLE ?auto_200122 ) ( ON ?auto_200114 ?auto_200121 ) ( not ( = ?auto_200114 ?auto_200121 ) ) ( not ( = ?auto_200115 ?auto_200121 ) ) ( not ( = ?auto_200116 ?auto_200121 ) ) ( not ( = ?auto_200117 ?auto_200121 ) ) ( not ( = ?auto_200118 ?auto_200121 ) ) ( not ( = ?auto_200119 ?auto_200121 ) ) ( not ( = ?auto_200120 ?auto_200121 ) ) ( not ( = ?auto_200122 ?auto_200121 ) ) ( ON ?auto_200115 ?auto_200114 ) ( ON-TABLE ?auto_200121 ) ( ON ?auto_200116 ?auto_200115 ) ( ON ?auto_200117 ?auto_200116 ) ( ON ?auto_200118 ?auto_200117 ) ( ON ?auto_200119 ?auto_200118 ) ( CLEAR ?auto_200122 ) ( ON ?auto_200120 ?auto_200119 ) ( CLEAR ?auto_200120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200121 ?auto_200114 ?auto_200115 ?auto_200116 ?auto_200117 ?auto_200118 ?auto_200119 )
      ( MAKE-7PILE ?auto_200114 ?auto_200115 ?auto_200116 ?auto_200117 ?auto_200118 ?auto_200119 ?auto_200120 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200123 - BLOCK
      ?auto_200124 - BLOCK
      ?auto_200125 - BLOCK
      ?auto_200126 - BLOCK
      ?auto_200127 - BLOCK
      ?auto_200128 - BLOCK
      ?auto_200129 - BLOCK
    )
    :vars
    (
      ?auto_200131 - BLOCK
      ?auto_200130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200123 ?auto_200124 ) ) ( not ( = ?auto_200123 ?auto_200125 ) ) ( not ( = ?auto_200123 ?auto_200126 ) ) ( not ( = ?auto_200123 ?auto_200127 ) ) ( not ( = ?auto_200123 ?auto_200128 ) ) ( not ( = ?auto_200123 ?auto_200129 ) ) ( not ( = ?auto_200124 ?auto_200125 ) ) ( not ( = ?auto_200124 ?auto_200126 ) ) ( not ( = ?auto_200124 ?auto_200127 ) ) ( not ( = ?auto_200124 ?auto_200128 ) ) ( not ( = ?auto_200124 ?auto_200129 ) ) ( not ( = ?auto_200125 ?auto_200126 ) ) ( not ( = ?auto_200125 ?auto_200127 ) ) ( not ( = ?auto_200125 ?auto_200128 ) ) ( not ( = ?auto_200125 ?auto_200129 ) ) ( not ( = ?auto_200126 ?auto_200127 ) ) ( not ( = ?auto_200126 ?auto_200128 ) ) ( not ( = ?auto_200126 ?auto_200129 ) ) ( not ( = ?auto_200127 ?auto_200128 ) ) ( not ( = ?auto_200127 ?auto_200129 ) ) ( not ( = ?auto_200128 ?auto_200129 ) ) ( not ( = ?auto_200123 ?auto_200131 ) ) ( not ( = ?auto_200124 ?auto_200131 ) ) ( not ( = ?auto_200125 ?auto_200131 ) ) ( not ( = ?auto_200126 ?auto_200131 ) ) ( not ( = ?auto_200127 ?auto_200131 ) ) ( not ( = ?auto_200128 ?auto_200131 ) ) ( not ( = ?auto_200129 ?auto_200131 ) ) ( ON ?auto_200123 ?auto_200130 ) ( not ( = ?auto_200123 ?auto_200130 ) ) ( not ( = ?auto_200124 ?auto_200130 ) ) ( not ( = ?auto_200125 ?auto_200130 ) ) ( not ( = ?auto_200126 ?auto_200130 ) ) ( not ( = ?auto_200127 ?auto_200130 ) ) ( not ( = ?auto_200128 ?auto_200130 ) ) ( not ( = ?auto_200129 ?auto_200130 ) ) ( not ( = ?auto_200131 ?auto_200130 ) ) ( ON ?auto_200124 ?auto_200123 ) ( ON-TABLE ?auto_200130 ) ( ON ?auto_200125 ?auto_200124 ) ( ON ?auto_200126 ?auto_200125 ) ( ON ?auto_200127 ?auto_200126 ) ( ON ?auto_200128 ?auto_200127 ) ( ON ?auto_200129 ?auto_200128 ) ( CLEAR ?auto_200129 ) ( HOLDING ?auto_200131 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200131 )
      ( MAKE-7PILE ?auto_200123 ?auto_200124 ?auto_200125 ?auto_200126 ?auto_200127 ?auto_200128 ?auto_200129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_200132 - BLOCK
      ?auto_200133 - BLOCK
      ?auto_200134 - BLOCK
      ?auto_200135 - BLOCK
      ?auto_200136 - BLOCK
      ?auto_200137 - BLOCK
      ?auto_200138 - BLOCK
    )
    :vars
    (
      ?auto_200140 - BLOCK
      ?auto_200139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200132 ?auto_200133 ) ) ( not ( = ?auto_200132 ?auto_200134 ) ) ( not ( = ?auto_200132 ?auto_200135 ) ) ( not ( = ?auto_200132 ?auto_200136 ) ) ( not ( = ?auto_200132 ?auto_200137 ) ) ( not ( = ?auto_200132 ?auto_200138 ) ) ( not ( = ?auto_200133 ?auto_200134 ) ) ( not ( = ?auto_200133 ?auto_200135 ) ) ( not ( = ?auto_200133 ?auto_200136 ) ) ( not ( = ?auto_200133 ?auto_200137 ) ) ( not ( = ?auto_200133 ?auto_200138 ) ) ( not ( = ?auto_200134 ?auto_200135 ) ) ( not ( = ?auto_200134 ?auto_200136 ) ) ( not ( = ?auto_200134 ?auto_200137 ) ) ( not ( = ?auto_200134 ?auto_200138 ) ) ( not ( = ?auto_200135 ?auto_200136 ) ) ( not ( = ?auto_200135 ?auto_200137 ) ) ( not ( = ?auto_200135 ?auto_200138 ) ) ( not ( = ?auto_200136 ?auto_200137 ) ) ( not ( = ?auto_200136 ?auto_200138 ) ) ( not ( = ?auto_200137 ?auto_200138 ) ) ( not ( = ?auto_200132 ?auto_200140 ) ) ( not ( = ?auto_200133 ?auto_200140 ) ) ( not ( = ?auto_200134 ?auto_200140 ) ) ( not ( = ?auto_200135 ?auto_200140 ) ) ( not ( = ?auto_200136 ?auto_200140 ) ) ( not ( = ?auto_200137 ?auto_200140 ) ) ( not ( = ?auto_200138 ?auto_200140 ) ) ( ON ?auto_200132 ?auto_200139 ) ( not ( = ?auto_200132 ?auto_200139 ) ) ( not ( = ?auto_200133 ?auto_200139 ) ) ( not ( = ?auto_200134 ?auto_200139 ) ) ( not ( = ?auto_200135 ?auto_200139 ) ) ( not ( = ?auto_200136 ?auto_200139 ) ) ( not ( = ?auto_200137 ?auto_200139 ) ) ( not ( = ?auto_200138 ?auto_200139 ) ) ( not ( = ?auto_200140 ?auto_200139 ) ) ( ON ?auto_200133 ?auto_200132 ) ( ON-TABLE ?auto_200139 ) ( ON ?auto_200134 ?auto_200133 ) ( ON ?auto_200135 ?auto_200134 ) ( ON ?auto_200136 ?auto_200135 ) ( ON ?auto_200137 ?auto_200136 ) ( ON ?auto_200138 ?auto_200137 ) ( ON ?auto_200140 ?auto_200138 ) ( CLEAR ?auto_200140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200139 ?auto_200132 ?auto_200133 ?auto_200134 ?auto_200135 ?auto_200136 ?auto_200137 ?auto_200138 )
      ( MAKE-7PILE ?auto_200132 ?auto_200133 ?auto_200134 ?auto_200135 ?auto_200136 ?auto_200137 ?auto_200138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200149 - BLOCK
      ?auto_200150 - BLOCK
      ?auto_200151 - BLOCK
      ?auto_200152 - BLOCK
      ?auto_200153 - BLOCK
      ?auto_200154 - BLOCK
      ?auto_200155 - BLOCK
      ?auto_200156 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_200156 ) ( CLEAR ?auto_200155 ) ( ON-TABLE ?auto_200149 ) ( ON ?auto_200150 ?auto_200149 ) ( ON ?auto_200151 ?auto_200150 ) ( ON ?auto_200152 ?auto_200151 ) ( ON ?auto_200153 ?auto_200152 ) ( ON ?auto_200154 ?auto_200153 ) ( ON ?auto_200155 ?auto_200154 ) ( not ( = ?auto_200149 ?auto_200150 ) ) ( not ( = ?auto_200149 ?auto_200151 ) ) ( not ( = ?auto_200149 ?auto_200152 ) ) ( not ( = ?auto_200149 ?auto_200153 ) ) ( not ( = ?auto_200149 ?auto_200154 ) ) ( not ( = ?auto_200149 ?auto_200155 ) ) ( not ( = ?auto_200149 ?auto_200156 ) ) ( not ( = ?auto_200150 ?auto_200151 ) ) ( not ( = ?auto_200150 ?auto_200152 ) ) ( not ( = ?auto_200150 ?auto_200153 ) ) ( not ( = ?auto_200150 ?auto_200154 ) ) ( not ( = ?auto_200150 ?auto_200155 ) ) ( not ( = ?auto_200150 ?auto_200156 ) ) ( not ( = ?auto_200151 ?auto_200152 ) ) ( not ( = ?auto_200151 ?auto_200153 ) ) ( not ( = ?auto_200151 ?auto_200154 ) ) ( not ( = ?auto_200151 ?auto_200155 ) ) ( not ( = ?auto_200151 ?auto_200156 ) ) ( not ( = ?auto_200152 ?auto_200153 ) ) ( not ( = ?auto_200152 ?auto_200154 ) ) ( not ( = ?auto_200152 ?auto_200155 ) ) ( not ( = ?auto_200152 ?auto_200156 ) ) ( not ( = ?auto_200153 ?auto_200154 ) ) ( not ( = ?auto_200153 ?auto_200155 ) ) ( not ( = ?auto_200153 ?auto_200156 ) ) ( not ( = ?auto_200154 ?auto_200155 ) ) ( not ( = ?auto_200154 ?auto_200156 ) ) ( not ( = ?auto_200155 ?auto_200156 ) ) )
    :subtasks
    ( ( !STACK ?auto_200156 ?auto_200155 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200157 - BLOCK
      ?auto_200158 - BLOCK
      ?auto_200159 - BLOCK
      ?auto_200160 - BLOCK
      ?auto_200161 - BLOCK
      ?auto_200162 - BLOCK
      ?auto_200163 - BLOCK
      ?auto_200164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_200163 ) ( ON-TABLE ?auto_200157 ) ( ON ?auto_200158 ?auto_200157 ) ( ON ?auto_200159 ?auto_200158 ) ( ON ?auto_200160 ?auto_200159 ) ( ON ?auto_200161 ?auto_200160 ) ( ON ?auto_200162 ?auto_200161 ) ( ON ?auto_200163 ?auto_200162 ) ( not ( = ?auto_200157 ?auto_200158 ) ) ( not ( = ?auto_200157 ?auto_200159 ) ) ( not ( = ?auto_200157 ?auto_200160 ) ) ( not ( = ?auto_200157 ?auto_200161 ) ) ( not ( = ?auto_200157 ?auto_200162 ) ) ( not ( = ?auto_200157 ?auto_200163 ) ) ( not ( = ?auto_200157 ?auto_200164 ) ) ( not ( = ?auto_200158 ?auto_200159 ) ) ( not ( = ?auto_200158 ?auto_200160 ) ) ( not ( = ?auto_200158 ?auto_200161 ) ) ( not ( = ?auto_200158 ?auto_200162 ) ) ( not ( = ?auto_200158 ?auto_200163 ) ) ( not ( = ?auto_200158 ?auto_200164 ) ) ( not ( = ?auto_200159 ?auto_200160 ) ) ( not ( = ?auto_200159 ?auto_200161 ) ) ( not ( = ?auto_200159 ?auto_200162 ) ) ( not ( = ?auto_200159 ?auto_200163 ) ) ( not ( = ?auto_200159 ?auto_200164 ) ) ( not ( = ?auto_200160 ?auto_200161 ) ) ( not ( = ?auto_200160 ?auto_200162 ) ) ( not ( = ?auto_200160 ?auto_200163 ) ) ( not ( = ?auto_200160 ?auto_200164 ) ) ( not ( = ?auto_200161 ?auto_200162 ) ) ( not ( = ?auto_200161 ?auto_200163 ) ) ( not ( = ?auto_200161 ?auto_200164 ) ) ( not ( = ?auto_200162 ?auto_200163 ) ) ( not ( = ?auto_200162 ?auto_200164 ) ) ( not ( = ?auto_200163 ?auto_200164 ) ) ( ON-TABLE ?auto_200164 ) ( CLEAR ?auto_200164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_200164 )
      ( MAKE-8PILE ?auto_200157 ?auto_200158 ?auto_200159 ?auto_200160 ?auto_200161 ?auto_200162 ?auto_200163 ?auto_200164 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200165 - BLOCK
      ?auto_200166 - BLOCK
      ?auto_200167 - BLOCK
      ?auto_200168 - BLOCK
      ?auto_200169 - BLOCK
      ?auto_200170 - BLOCK
      ?auto_200171 - BLOCK
      ?auto_200172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200165 ) ( ON ?auto_200166 ?auto_200165 ) ( ON ?auto_200167 ?auto_200166 ) ( ON ?auto_200168 ?auto_200167 ) ( ON ?auto_200169 ?auto_200168 ) ( ON ?auto_200170 ?auto_200169 ) ( not ( = ?auto_200165 ?auto_200166 ) ) ( not ( = ?auto_200165 ?auto_200167 ) ) ( not ( = ?auto_200165 ?auto_200168 ) ) ( not ( = ?auto_200165 ?auto_200169 ) ) ( not ( = ?auto_200165 ?auto_200170 ) ) ( not ( = ?auto_200165 ?auto_200171 ) ) ( not ( = ?auto_200165 ?auto_200172 ) ) ( not ( = ?auto_200166 ?auto_200167 ) ) ( not ( = ?auto_200166 ?auto_200168 ) ) ( not ( = ?auto_200166 ?auto_200169 ) ) ( not ( = ?auto_200166 ?auto_200170 ) ) ( not ( = ?auto_200166 ?auto_200171 ) ) ( not ( = ?auto_200166 ?auto_200172 ) ) ( not ( = ?auto_200167 ?auto_200168 ) ) ( not ( = ?auto_200167 ?auto_200169 ) ) ( not ( = ?auto_200167 ?auto_200170 ) ) ( not ( = ?auto_200167 ?auto_200171 ) ) ( not ( = ?auto_200167 ?auto_200172 ) ) ( not ( = ?auto_200168 ?auto_200169 ) ) ( not ( = ?auto_200168 ?auto_200170 ) ) ( not ( = ?auto_200168 ?auto_200171 ) ) ( not ( = ?auto_200168 ?auto_200172 ) ) ( not ( = ?auto_200169 ?auto_200170 ) ) ( not ( = ?auto_200169 ?auto_200171 ) ) ( not ( = ?auto_200169 ?auto_200172 ) ) ( not ( = ?auto_200170 ?auto_200171 ) ) ( not ( = ?auto_200170 ?auto_200172 ) ) ( not ( = ?auto_200171 ?auto_200172 ) ) ( ON-TABLE ?auto_200172 ) ( CLEAR ?auto_200172 ) ( HOLDING ?auto_200171 ) ( CLEAR ?auto_200170 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200165 ?auto_200166 ?auto_200167 ?auto_200168 ?auto_200169 ?auto_200170 ?auto_200171 )
      ( MAKE-8PILE ?auto_200165 ?auto_200166 ?auto_200167 ?auto_200168 ?auto_200169 ?auto_200170 ?auto_200171 ?auto_200172 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200173 - BLOCK
      ?auto_200174 - BLOCK
      ?auto_200175 - BLOCK
      ?auto_200176 - BLOCK
      ?auto_200177 - BLOCK
      ?auto_200178 - BLOCK
      ?auto_200179 - BLOCK
      ?auto_200180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200173 ) ( ON ?auto_200174 ?auto_200173 ) ( ON ?auto_200175 ?auto_200174 ) ( ON ?auto_200176 ?auto_200175 ) ( ON ?auto_200177 ?auto_200176 ) ( ON ?auto_200178 ?auto_200177 ) ( not ( = ?auto_200173 ?auto_200174 ) ) ( not ( = ?auto_200173 ?auto_200175 ) ) ( not ( = ?auto_200173 ?auto_200176 ) ) ( not ( = ?auto_200173 ?auto_200177 ) ) ( not ( = ?auto_200173 ?auto_200178 ) ) ( not ( = ?auto_200173 ?auto_200179 ) ) ( not ( = ?auto_200173 ?auto_200180 ) ) ( not ( = ?auto_200174 ?auto_200175 ) ) ( not ( = ?auto_200174 ?auto_200176 ) ) ( not ( = ?auto_200174 ?auto_200177 ) ) ( not ( = ?auto_200174 ?auto_200178 ) ) ( not ( = ?auto_200174 ?auto_200179 ) ) ( not ( = ?auto_200174 ?auto_200180 ) ) ( not ( = ?auto_200175 ?auto_200176 ) ) ( not ( = ?auto_200175 ?auto_200177 ) ) ( not ( = ?auto_200175 ?auto_200178 ) ) ( not ( = ?auto_200175 ?auto_200179 ) ) ( not ( = ?auto_200175 ?auto_200180 ) ) ( not ( = ?auto_200176 ?auto_200177 ) ) ( not ( = ?auto_200176 ?auto_200178 ) ) ( not ( = ?auto_200176 ?auto_200179 ) ) ( not ( = ?auto_200176 ?auto_200180 ) ) ( not ( = ?auto_200177 ?auto_200178 ) ) ( not ( = ?auto_200177 ?auto_200179 ) ) ( not ( = ?auto_200177 ?auto_200180 ) ) ( not ( = ?auto_200178 ?auto_200179 ) ) ( not ( = ?auto_200178 ?auto_200180 ) ) ( not ( = ?auto_200179 ?auto_200180 ) ) ( ON-TABLE ?auto_200180 ) ( CLEAR ?auto_200178 ) ( ON ?auto_200179 ?auto_200180 ) ( CLEAR ?auto_200179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200180 )
      ( MAKE-8PILE ?auto_200173 ?auto_200174 ?auto_200175 ?auto_200176 ?auto_200177 ?auto_200178 ?auto_200179 ?auto_200180 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200181 - BLOCK
      ?auto_200182 - BLOCK
      ?auto_200183 - BLOCK
      ?auto_200184 - BLOCK
      ?auto_200185 - BLOCK
      ?auto_200186 - BLOCK
      ?auto_200187 - BLOCK
      ?auto_200188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200181 ) ( ON ?auto_200182 ?auto_200181 ) ( ON ?auto_200183 ?auto_200182 ) ( ON ?auto_200184 ?auto_200183 ) ( ON ?auto_200185 ?auto_200184 ) ( not ( = ?auto_200181 ?auto_200182 ) ) ( not ( = ?auto_200181 ?auto_200183 ) ) ( not ( = ?auto_200181 ?auto_200184 ) ) ( not ( = ?auto_200181 ?auto_200185 ) ) ( not ( = ?auto_200181 ?auto_200186 ) ) ( not ( = ?auto_200181 ?auto_200187 ) ) ( not ( = ?auto_200181 ?auto_200188 ) ) ( not ( = ?auto_200182 ?auto_200183 ) ) ( not ( = ?auto_200182 ?auto_200184 ) ) ( not ( = ?auto_200182 ?auto_200185 ) ) ( not ( = ?auto_200182 ?auto_200186 ) ) ( not ( = ?auto_200182 ?auto_200187 ) ) ( not ( = ?auto_200182 ?auto_200188 ) ) ( not ( = ?auto_200183 ?auto_200184 ) ) ( not ( = ?auto_200183 ?auto_200185 ) ) ( not ( = ?auto_200183 ?auto_200186 ) ) ( not ( = ?auto_200183 ?auto_200187 ) ) ( not ( = ?auto_200183 ?auto_200188 ) ) ( not ( = ?auto_200184 ?auto_200185 ) ) ( not ( = ?auto_200184 ?auto_200186 ) ) ( not ( = ?auto_200184 ?auto_200187 ) ) ( not ( = ?auto_200184 ?auto_200188 ) ) ( not ( = ?auto_200185 ?auto_200186 ) ) ( not ( = ?auto_200185 ?auto_200187 ) ) ( not ( = ?auto_200185 ?auto_200188 ) ) ( not ( = ?auto_200186 ?auto_200187 ) ) ( not ( = ?auto_200186 ?auto_200188 ) ) ( not ( = ?auto_200187 ?auto_200188 ) ) ( ON-TABLE ?auto_200188 ) ( ON ?auto_200187 ?auto_200188 ) ( CLEAR ?auto_200187 ) ( HOLDING ?auto_200186 ) ( CLEAR ?auto_200185 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200181 ?auto_200182 ?auto_200183 ?auto_200184 ?auto_200185 ?auto_200186 )
      ( MAKE-8PILE ?auto_200181 ?auto_200182 ?auto_200183 ?auto_200184 ?auto_200185 ?auto_200186 ?auto_200187 ?auto_200188 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200189 - BLOCK
      ?auto_200190 - BLOCK
      ?auto_200191 - BLOCK
      ?auto_200192 - BLOCK
      ?auto_200193 - BLOCK
      ?auto_200194 - BLOCK
      ?auto_200195 - BLOCK
      ?auto_200196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200189 ) ( ON ?auto_200190 ?auto_200189 ) ( ON ?auto_200191 ?auto_200190 ) ( ON ?auto_200192 ?auto_200191 ) ( ON ?auto_200193 ?auto_200192 ) ( not ( = ?auto_200189 ?auto_200190 ) ) ( not ( = ?auto_200189 ?auto_200191 ) ) ( not ( = ?auto_200189 ?auto_200192 ) ) ( not ( = ?auto_200189 ?auto_200193 ) ) ( not ( = ?auto_200189 ?auto_200194 ) ) ( not ( = ?auto_200189 ?auto_200195 ) ) ( not ( = ?auto_200189 ?auto_200196 ) ) ( not ( = ?auto_200190 ?auto_200191 ) ) ( not ( = ?auto_200190 ?auto_200192 ) ) ( not ( = ?auto_200190 ?auto_200193 ) ) ( not ( = ?auto_200190 ?auto_200194 ) ) ( not ( = ?auto_200190 ?auto_200195 ) ) ( not ( = ?auto_200190 ?auto_200196 ) ) ( not ( = ?auto_200191 ?auto_200192 ) ) ( not ( = ?auto_200191 ?auto_200193 ) ) ( not ( = ?auto_200191 ?auto_200194 ) ) ( not ( = ?auto_200191 ?auto_200195 ) ) ( not ( = ?auto_200191 ?auto_200196 ) ) ( not ( = ?auto_200192 ?auto_200193 ) ) ( not ( = ?auto_200192 ?auto_200194 ) ) ( not ( = ?auto_200192 ?auto_200195 ) ) ( not ( = ?auto_200192 ?auto_200196 ) ) ( not ( = ?auto_200193 ?auto_200194 ) ) ( not ( = ?auto_200193 ?auto_200195 ) ) ( not ( = ?auto_200193 ?auto_200196 ) ) ( not ( = ?auto_200194 ?auto_200195 ) ) ( not ( = ?auto_200194 ?auto_200196 ) ) ( not ( = ?auto_200195 ?auto_200196 ) ) ( ON-TABLE ?auto_200196 ) ( ON ?auto_200195 ?auto_200196 ) ( CLEAR ?auto_200193 ) ( ON ?auto_200194 ?auto_200195 ) ( CLEAR ?auto_200194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200196 ?auto_200195 )
      ( MAKE-8PILE ?auto_200189 ?auto_200190 ?auto_200191 ?auto_200192 ?auto_200193 ?auto_200194 ?auto_200195 ?auto_200196 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200197 - BLOCK
      ?auto_200198 - BLOCK
      ?auto_200199 - BLOCK
      ?auto_200200 - BLOCK
      ?auto_200201 - BLOCK
      ?auto_200202 - BLOCK
      ?auto_200203 - BLOCK
      ?auto_200204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200197 ) ( ON ?auto_200198 ?auto_200197 ) ( ON ?auto_200199 ?auto_200198 ) ( ON ?auto_200200 ?auto_200199 ) ( not ( = ?auto_200197 ?auto_200198 ) ) ( not ( = ?auto_200197 ?auto_200199 ) ) ( not ( = ?auto_200197 ?auto_200200 ) ) ( not ( = ?auto_200197 ?auto_200201 ) ) ( not ( = ?auto_200197 ?auto_200202 ) ) ( not ( = ?auto_200197 ?auto_200203 ) ) ( not ( = ?auto_200197 ?auto_200204 ) ) ( not ( = ?auto_200198 ?auto_200199 ) ) ( not ( = ?auto_200198 ?auto_200200 ) ) ( not ( = ?auto_200198 ?auto_200201 ) ) ( not ( = ?auto_200198 ?auto_200202 ) ) ( not ( = ?auto_200198 ?auto_200203 ) ) ( not ( = ?auto_200198 ?auto_200204 ) ) ( not ( = ?auto_200199 ?auto_200200 ) ) ( not ( = ?auto_200199 ?auto_200201 ) ) ( not ( = ?auto_200199 ?auto_200202 ) ) ( not ( = ?auto_200199 ?auto_200203 ) ) ( not ( = ?auto_200199 ?auto_200204 ) ) ( not ( = ?auto_200200 ?auto_200201 ) ) ( not ( = ?auto_200200 ?auto_200202 ) ) ( not ( = ?auto_200200 ?auto_200203 ) ) ( not ( = ?auto_200200 ?auto_200204 ) ) ( not ( = ?auto_200201 ?auto_200202 ) ) ( not ( = ?auto_200201 ?auto_200203 ) ) ( not ( = ?auto_200201 ?auto_200204 ) ) ( not ( = ?auto_200202 ?auto_200203 ) ) ( not ( = ?auto_200202 ?auto_200204 ) ) ( not ( = ?auto_200203 ?auto_200204 ) ) ( ON-TABLE ?auto_200204 ) ( ON ?auto_200203 ?auto_200204 ) ( ON ?auto_200202 ?auto_200203 ) ( CLEAR ?auto_200202 ) ( HOLDING ?auto_200201 ) ( CLEAR ?auto_200200 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200197 ?auto_200198 ?auto_200199 ?auto_200200 ?auto_200201 )
      ( MAKE-8PILE ?auto_200197 ?auto_200198 ?auto_200199 ?auto_200200 ?auto_200201 ?auto_200202 ?auto_200203 ?auto_200204 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200205 - BLOCK
      ?auto_200206 - BLOCK
      ?auto_200207 - BLOCK
      ?auto_200208 - BLOCK
      ?auto_200209 - BLOCK
      ?auto_200210 - BLOCK
      ?auto_200211 - BLOCK
      ?auto_200212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200205 ) ( ON ?auto_200206 ?auto_200205 ) ( ON ?auto_200207 ?auto_200206 ) ( ON ?auto_200208 ?auto_200207 ) ( not ( = ?auto_200205 ?auto_200206 ) ) ( not ( = ?auto_200205 ?auto_200207 ) ) ( not ( = ?auto_200205 ?auto_200208 ) ) ( not ( = ?auto_200205 ?auto_200209 ) ) ( not ( = ?auto_200205 ?auto_200210 ) ) ( not ( = ?auto_200205 ?auto_200211 ) ) ( not ( = ?auto_200205 ?auto_200212 ) ) ( not ( = ?auto_200206 ?auto_200207 ) ) ( not ( = ?auto_200206 ?auto_200208 ) ) ( not ( = ?auto_200206 ?auto_200209 ) ) ( not ( = ?auto_200206 ?auto_200210 ) ) ( not ( = ?auto_200206 ?auto_200211 ) ) ( not ( = ?auto_200206 ?auto_200212 ) ) ( not ( = ?auto_200207 ?auto_200208 ) ) ( not ( = ?auto_200207 ?auto_200209 ) ) ( not ( = ?auto_200207 ?auto_200210 ) ) ( not ( = ?auto_200207 ?auto_200211 ) ) ( not ( = ?auto_200207 ?auto_200212 ) ) ( not ( = ?auto_200208 ?auto_200209 ) ) ( not ( = ?auto_200208 ?auto_200210 ) ) ( not ( = ?auto_200208 ?auto_200211 ) ) ( not ( = ?auto_200208 ?auto_200212 ) ) ( not ( = ?auto_200209 ?auto_200210 ) ) ( not ( = ?auto_200209 ?auto_200211 ) ) ( not ( = ?auto_200209 ?auto_200212 ) ) ( not ( = ?auto_200210 ?auto_200211 ) ) ( not ( = ?auto_200210 ?auto_200212 ) ) ( not ( = ?auto_200211 ?auto_200212 ) ) ( ON-TABLE ?auto_200212 ) ( ON ?auto_200211 ?auto_200212 ) ( ON ?auto_200210 ?auto_200211 ) ( CLEAR ?auto_200208 ) ( ON ?auto_200209 ?auto_200210 ) ( CLEAR ?auto_200209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200212 ?auto_200211 ?auto_200210 )
      ( MAKE-8PILE ?auto_200205 ?auto_200206 ?auto_200207 ?auto_200208 ?auto_200209 ?auto_200210 ?auto_200211 ?auto_200212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200213 - BLOCK
      ?auto_200214 - BLOCK
      ?auto_200215 - BLOCK
      ?auto_200216 - BLOCK
      ?auto_200217 - BLOCK
      ?auto_200218 - BLOCK
      ?auto_200219 - BLOCK
      ?auto_200220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200213 ) ( ON ?auto_200214 ?auto_200213 ) ( ON ?auto_200215 ?auto_200214 ) ( not ( = ?auto_200213 ?auto_200214 ) ) ( not ( = ?auto_200213 ?auto_200215 ) ) ( not ( = ?auto_200213 ?auto_200216 ) ) ( not ( = ?auto_200213 ?auto_200217 ) ) ( not ( = ?auto_200213 ?auto_200218 ) ) ( not ( = ?auto_200213 ?auto_200219 ) ) ( not ( = ?auto_200213 ?auto_200220 ) ) ( not ( = ?auto_200214 ?auto_200215 ) ) ( not ( = ?auto_200214 ?auto_200216 ) ) ( not ( = ?auto_200214 ?auto_200217 ) ) ( not ( = ?auto_200214 ?auto_200218 ) ) ( not ( = ?auto_200214 ?auto_200219 ) ) ( not ( = ?auto_200214 ?auto_200220 ) ) ( not ( = ?auto_200215 ?auto_200216 ) ) ( not ( = ?auto_200215 ?auto_200217 ) ) ( not ( = ?auto_200215 ?auto_200218 ) ) ( not ( = ?auto_200215 ?auto_200219 ) ) ( not ( = ?auto_200215 ?auto_200220 ) ) ( not ( = ?auto_200216 ?auto_200217 ) ) ( not ( = ?auto_200216 ?auto_200218 ) ) ( not ( = ?auto_200216 ?auto_200219 ) ) ( not ( = ?auto_200216 ?auto_200220 ) ) ( not ( = ?auto_200217 ?auto_200218 ) ) ( not ( = ?auto_200217 ?auto_200219 ) ) ( not ( = ?auto_200217 ?auto_200220 ) ) ( not ( = ?auto_200218 ?auto_200219 ) ) ( not ( = ?auto_200218 ?auto_200220 ) ) ( not ( = ?auto_200219 ?auto_200220 ) ) ( ON-TABLE ?auto_200220 ) ( ON ?auto_200219 ?auto_200220 ) ( ON ?auto_200218 ?auto_200219 ) ( ON ?auto_200217 ?auto_200218 ) ( CLEAR ?auto_200217 ) ( HOLDING ?auto_200216 ) ( CLEAR ?auto_200215 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200213 ?auto_200214 ?auto_200215 ?auto_200216 )
      ( MAKE-8PILE ?auto_200213 ?auto_200214 ?auto_200215 ?auto_200216 ?auto_200217 ?auto_200218 ?auto_200219 ?auto_200220 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200221 - BLOCK
      ?auto_200222 - BLOCK
      ?auto_200223 - BLOCK
      ?auto_200224 - BLOCK
      ?auto_200225 - BLOCK
      ?auto_200226 - BLOCK
      ?auto_200227 - BLOCK
      ?auto_200228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200221 ) ( ON ?auto_200222 ?auto_200221 ) ( ON ?auto_200223 ?auto_200222 ) ( not ( = ?auto_200221 ?auto_200222 ) ) ( not ( = ?auto_200221 ?auto_200223 ) ) ( not ( = ?auto_200221 ?auto_200224 ) ) ( not ( = ?auto_200221 ?auto_200225 ) ) ( not ( = ?auto_200221 ?auto_200226 ) ) ( not ( = ?auto_200221 ?auto_200227 ) ) ( not ( = ?auto_200221 ?auto_200228 ) ) ( not ( = ?auto_200222 ?auto_200223 ) ) ( not ( = ?auto_200222 ?auto_200224 ) ) ( not ( = ?auto_200222 ?auto_200225 ) ) ( not ( = ?auto_200222 ?auto_200226 ) ) ( not ( = ?auto_200222 ?auto_200227 ) ) ( not ( = ?auto_200222 ?auto_200228 ) ) ( not ( = ?auto_200223 ?auto_200224 ) ) ( not ( = ?auto_200223 ?auto_200225 ) ) ( not ( = ?auto_200223 ?auto_200226 ) ) ( not ( = ?auto_200223 ?auto_200227 ) ) ( not ( = ?auto_200223 ?auto_200228 ) ) ( not ( = ?auto_200224 ?auto_200225 ) ) ( not ( = ?auto_200224 ?auto_200226 ) ) ( not ( = ?auto_200224 ?auto_200227 ) ) ( not ( = ?auto_200224 ?auto_200228 ) ) ( not ( = ?auto_200225 ?auto_200226 ) ) ( not ( = ?auto_200225 ?auto_200227 ) ) ( not ( = ?auto_200225 ?auto_200228 ) ) ( not ( = ?auto_200226 ?auto_200227 ) ) ( not ( = ?auto_200226 ?auto_200228 ) ) ( not ( = ?auto_200227 ?auto_200228 ) ) ( ON-TABLE ?auto_200228 ) ( ON ?auto_200227 ?auto_200228 ) ( ON ?auto_200226 ?auto_200227 ) ( ON ?auto_200225 ?auto_200226 ) ( CLEAR ?auto_200223 ) ( ON ?auto_200224 ?auto_200225 ) ( CLEAR ?auto_200224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200228 ?auto_200227 ?auto_200226 ?auto_200225 )
      ( MAKE-8PILE ?auto_200221 ?auto_200222 ?auto_200223 ?auto_200224 ?auto_200225 ?auto_200226 ?auto_200227 ?auto_200228 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200229 - BLOCK
      ?auto_200230 - BLOCK
      ?auto_200231 - BLOCK
      ?auto_200232 - BLOCK
      ?auto_200233 - BLOCK
      ?auto_200234 - BLOCK
      ?auto_200235 - BLOCK
      ?auto_200236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200229 ) ( ON ?auto_200230 ?auto_200229 ) ( not ( = ?auto_200229 ?auto_200230 ) ) ( not ( = ?auto_200229 ?auto_200231 ) ) ( not ( = ?auto_200229 ?auto_200232 ) ) ( not ( = ?auto_200229 ?auto_200233 ) ) ( not ( = ?auto_200229 ?auto_200234 ) ) ( not ( = ?auto_200229 ?auto_200235 ) ) ( not ( = ?auto_200229 ?auto_200236 ) ) ( not ( = ?auto_200230 ?auto_200231 ) ) ( not ( = ?auto_200230 ?auto_200232 ) ) ( not ( = ?auto_200230 ?auto_200233 ) ) ( not ( = ?auto_200230 ?auto_200234 ) ) ( not ( = ?auto_200230 ?auto_200235 ) ) ( not ( = ?auto_200230 ?auto_200236 ) ) ( not ( = ?auto_200231 ?auto_200232 ) ) ( not ( = ?auto_200231 ?auto_200233 ) ) ( not ( = ?auto_200231 ?auto_200234 ) ) ( not ( = ?auto_200231 ?auto_200235 ) ) ( not ( = ?auto_200231 ?auto_200236 ) ) ( not ( = ?auto_200232 ?auto_200233 ) ) ( not ( = ?auto_200232 ?auto_200234 ) ) ( not ( = ?auto_200232 ?auto_200235 ) ) ( not ( = ?auto_200232 ?auto_200236 ) ) ( not ( = ?auto_200233 ?auto_200234 ) ) ( not ( = ?auto_200233 ?auto_200235 ) ) ( not ( = ?auto_200233 ?auto_200236 ) ) ( not ( = ?auto_200234 ?auto_200235 ) ) ( not ( = ?auto_200234 ?auto_200236 ) ) ( not ( = ?auto_200235 ?auto_200236 ) ) ( ON-TABLE ?auto_200236 ) ( ON ?auto_200235 ?auto_200236 ) ( ON ?auto_200234 ?auto_200235 ) ( ON ?auto_200233 ?auto_200234 ) ( ON ?auto_200232 ?auto_200233 ) ( CLEAR ?auto_200232 ) ( HOLDING ?auto_200231 ) ( CLEAR ?auto_200230 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200229 ?auto_200230 ?auto_200231 )
      ( MAKE-8PILE ?auto_200229 ?auto_200230 ?auto_200231 ?auto_200232 ?auto_200233 ?auto_200234 ?auto_200235 ?auto_200236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200237 - BLOCK
      ?auto_200238 - BLOCK
      ?auto_200239 - BLOCK
      ?auto_200240 - BLOCK
      ?auto_200241 - BLOCK
      ?auto_200242 - BLOCK
      ?auto_200243 - BLOCK
      ?auto_200244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200237 ) ( ON ?auto_200238 ?auto_200237 ) ( not ( = ?auto_200237 ?auto_200238 ) ) ( not ( = ?auto_200237 ?auto_200239 ) ) ( not ( = ?auto_200237 ?auto_200240 ) ) ( not ( = ?auto_200237 ?auto_200241 ) ) ( not ( = ?auto_200237 ?auto_200242 ) ) ( not ( = ?auto_200237 ?auto_200243 ) ) ( not ( = ?auto_200237 ?auto_200244 ) ) ( not ( = ?auto_200238 ?auto_200239 ) ) ( not ( = ?auto_200238 ?auto_200240 ) ) ( not ( = ?auto_200238 ?auto_200241 ) ) ( not ( = ?auto_200238 ?auto_200242 ) ) ( not ( = ?auto_200238 ?auto_200243 ) ) ( not ( = ?auto_200238 ?auto_200244 ) ) ( not ( = ?auto_200239 ?auto_200240 ) ) ( not ( = ?auto_200239 ?auto_200241 ) ) ( not ( = ?auto_200239 ?auto_200242 ) ) ( not ( = ?auto_200239 ?auto_200243 ) ) ( not ( = ?auto_200239 ?auto_200244 ) ) ( not ( = ?auto_200240 ?auto_200241 ) ) ( not ( = ?auto_200240 ?auto_200242 ) ) ( not ( = ?auto_200240 ?auto_200243 ) ) ( not ( = ?auto_200240 ?auto_200244 ) ) ( not ( = ?auto_200241 ?auto_200242 ) ) ( not ( = ?auto_200241 ?auto_200243 ) ) ( not ( = ?auto_200241 ?auto_200244 ) ) ( not ( = ?auto_200242 ?auto_200243 ) ) ( not ( = ?auto_200242 ?auto_200244 ) ) ( not ( = ?auto_200243 ?auto_200244 ) ) ( ON-TABLE ?auto_200244 ) ( ON ?auto_200243 ?auto_200244 ) ( ON ?auto_200242 ?auto_200243 ) ( ON ?auto_200241 ?auto_200242 ) ( ON ?auto_200240 ?auto_200241 ) ( CLEAR ?auto_200238 ) ( ON ?auto_200239 ?auto_200240 ) ( CLEAR ?auto_200239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200244 ?auto_200243 ?auto_200242 ?auto_200241 ?auto_200240 )
      ( MAKE-8PILE ?auto_200237 ?auto_200238 ?auto_200239 ?auto_200240 ?auto_200241 ?auto_200242 ?auto_200243 ?auto_200244 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200245 - BLOCK
      ?auto_200246 - BLOCK
      ?auto_200247 - BLOCK
      ?auto_200248 - BLOCK
      ?auto_200249 - BLOCK
      ?auto_200250 - BLOCK
      ?auto_200251 - BLOCK
      ?auto_200252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200245 ) ( not ( = ?auto_200245 ?auto_200246 ) ) ( not ( = ?auto_200245 ?auto_200247 ) ) ( not ( = ?auto_200245 ?auto_200248 ) ) ( not ( = ?auto_200245 ?auto_200249 ) ) ( not ( = ?auto_200245 ?auto_200250 ) ) ( not ( = ?auto_200245 ?auto_200251 ) ) ( not ( = ?auto_200245 ?auto_200252 ) ) ( not ( = ?auto_200246 ?auto_200247 ) ) ( not ( = ?auto_200246 ?auto_200248 ) ) ( not ( = ?auto_200246 ?auto_200249 ) ) ( not ( = ?auto_200246 ?auto_200250 ) ) ( not ( = ?auto_200246 ?auto_200251 ) ) ( not ( = ?auto_200246 ?auto_200252 ) ) ( not ( = ?auto_200247 ?auto_200248 ) ) ( not ( = ?auto_200247 ?auto_200249 ) ) ( not ( = ?auto_200247 ?auto_200250 ) ) ( not ( = ?auto_200247 ?auto_200251 ) ) ( not ( = ?auto_200247 ?auto_200252 ) ) ( not ( = ?auto_200248 ?auto_200249 ) ) ( not ( = ?auto_200248 ?auto_200250 ) ) ( not ( = ?auto_200248 ?auto_200251 ) ) ( not ( = ?auto_200248 ?auto_200252 ) ) ( not ( = ?auto_200249 ?auto_200250 ) ) ( not ( = ?auto_200249 ?auto_200251 ) ) ( not ( = ?auto_200249 ?auto_200252 ) ) ( not ( = ?auto_200250 ?auto_200251 ) ) ( not ( = ?auto_200250 ?auto_200252 ) ) ( not ( = ?auto_200251 ?auto_200252 ) ) ( ON-TABLE ?auto_200252 ) ( ON ?auto_200251 ?auto_200252 ) ( ON ?auto_200250 ?auto_200251 ) ( ON ?auto_200249 ?auto_200250 ) ( ON ?auto_200248 ?auto_200249 ) ( ON ?auto_200247 ?auto_200248 ) ( CLEAR ?auto_200247 ) ( HOLDING ?auto_200246 ) ( CLEAR ?auto_200245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200245 ?auto_200246 )
      ( MAKE-8PILE ?auto_200245 ?auto_200246 ?auto_200247 ?auto_200248 ?auto_200249 ?auto_200250 ?auto_200251 ?auto_200252 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200253 - BLOCK
      ?auto_200254 - BLOCK
      ?auto_200255 - BLOCK
      ?auto_200256 - BLOCK
      ?auto_200257 - BLOCK
      ?auto_200258 - BLOCK
      ?auto_200259 - BLOCK
      ?auto_200260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_200253 ) ( not ( = ?auto_200253 ?auto_200254 ) ) ( not ( = ?auto_200253 ?auto_200255 ) ) ( not ( = ?auto_200253 ?auto_200256 ) ) ( not ( = ?auto_200253 ?auto_200257 ) ) ( not ( = ?auto_200253 ?auto_200258 ) ) ( not ( = ?auto_200253 ?auto_200259 ) ) ( not ( = ?auto_200253 ?auto_200260 ) ) ( not ( = ?auto_200254 ?auto_200255 ) ) ( not ( = ?auto_200254 ?auto_200256 ) ) ( not ( = ?auto_200254 ?auto_200257 ) ) ( not ( = ?auto_200254 ?auto_200258 ) ) ( not ( = ?auto_200254 ?auto_200259 ) ) ( not ( = ?auto_200254 ?auto_200260 ) ) ( not ( = ?auto_200255 ?auto_200256 ) ) ( not ( = ?auto_200255 ?auto_200257 ) ) ( not ( = ?auto_200255 ?auto_200258 ) ) ( not ( = ?auto_200255 ?auto_200259 ) ) ( not ( = ?auto_200255 ?auto_200260 ) ) ( not ( = ?auto_200256 ?auto_200257 ) ) ( not ( = ?auto_200256 ?auto_200258 ) ) ( not ( = ?auto_200256 ?auto_200259 ) ) ( not ( = ?auto_200256 ?auto_200260 ) ) ( not ( = ?auto_200257 ?auto_200258 ) ) ( not ( = ?auto_200257 ?auto_200259 ) ) ( not ( = ?auto_200257 ?auto_200260 ) ) ( not ( = ?auto_200258 ?auto_200259 ) ) ( not ( = ?auto_200258 ?auto_200260 ) ) ( not ( = ?auto_200259 ?auto_200260 ) ) ( ON-TABLE ?auto_200260 ) ( ON ?auto_200259 ?auto_200260 ) ( ON ?auto_200258 ?auto_200259 ) ( ON ?auto_200257 ?auto_200258 ) ( ON ?auto_200256 ?auto_200257 ) ( ON ?auto_200255 ?auto_200256 ) ( CLEAR ?auto_200253 ) ( ON ?auto_200254 ?auto_200255 ) ( CLEAR ?auto_200254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200260 ?auto_200259 ?auto_200258 ?auto_200257 ?auto_200256 ?auto_200255 )
      ( MAKE-8PILE ?auto_200253 ?auto_200254 ?auto_200255 ?auto_200256 ?auto_200257 ?auto_200258 ?auto_200259 ?auto_200260 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200261 - BLOCK
      ?auto_200262 - BLOCK
      ?auto_200263 - BLOCK
      ?auto_200264 - BLOCK
      ?auto_200265 - BLOCK
      ?auto_200266 - BLOCK
      ?auto_200267 - BLOCK
      ?auto_200268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200261 ?auto_200262 ) ) ( not ( = ?auto_200261 ?auto_200263 ) ) ( not ( = ?auto_200261 ?auto_200264 ) ) ( not ( = ?auto_200261 ?auto_200265 ) ) ( not ( = ?auto_200261 ?auto_200266 ) ) ( not ( = ?auto_200261 ?auto_200267 ) ) ( not ( = ?auto_200261 ?auto_200268 ) ) ( not ( = ?auto_200262 ?auto_200263 ) ) ( not ( = ?auto_200262 ?auto_200264 ) ) ( not ( = ?auto_200262 ?auto_200265 ) ) ( not ( = ?auto_200262 ?auto_200266 ) ) ( not ( = ?auto_200262 ?auto_200267 ) ) ( not ( = ?auto_200262 ?auto_200268 ) ) ( not ( = ?auto_200263 ?auto_200264 ) ) ( not ( = ?auto_200263 ?auto_200265 ) ) ( not ( = ?auto_200263 ?auto_200266 ) ) ( not ( = ?auto_200263 ?auto_200267 ) ) ( not ( = ?auto_200263 ?auto_200268 ) ) ( not ( = ?auto_200264 ?auto_200265 ) ) ( not ( = ?auto_200264 ?auto_200266 ) ) ( not ( = ?auto_200264 ?auto_200267 ) ) ( not ( = ?auto_200264 ?auto_200268 ) ) ( not ( = ?auto_200265 ?auto_200266 ) ) ( not ( = ?auto_200265 ?auto_200267 ) ) ( not ( = ?auto_200265 ?auto_200268 ) ) ( not ( = ?auto_200266 ?auto_200267 ) ) ( not ( = ?auto_200266 ?auto_200268 ) ) ( not ( = ?auto_200267 ?auto_200268 ) ) ( ON-TABLE ?auto_200268 ) ( ON ?auto_200267 ?auto_200268 ) ( ON ?auto_200266 ?auto_200267 ) ( ON ?auto_200265 ?auto_200266 ) ( ON ?auto_200264 ?auto_200265 ) ( ON ?auto_200263 ?auto_200264 ) ( ON ?auto_200262 ?auto_200263 ) ( CLEAR ?auto_200262 ) ( HOLDING ?auto_200261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200261 )
      ( MAKE-8PILE ?auto_200261 ?auto_200262 ?auto_200263 ?auto_200264 ?auto_200265 ?auto_200266 ?auto_200267 ?auto_200268 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200269 - BLOCK
      ?auto_200270 - BLOCK
      ?auto_200271 - BLOCK
      ?auto_200272 - BLOCK
      ?auto_200273 - BLOCK
      ?auto_200274 - BLOCK
      ?auto_200275 - BLOCK
      ?auto_200276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200269 ?auto_200270 ) ) ( not ( = ?auto_200269 ?auto_200271 ) ) ( not ( = ?auto_200269 ?auto_200272 ) ) ( not ( = ?auto_200269 ?auto_200273 ) ) ( not ( = ?auto_200269 ?auto_200274 ) ) ( not ( = ?auto_200269 ?auto_200275 ) ) ( not ( = ?auto_200269 ?auto_200276 ) ) ( not ( = ?auto_200270 ?auto_200271 ) ) ( not ( = ?auto_200270 ?auto_200272 ) ) ( not ( = ?auto_200270 ?auto_200273 ) ) ( not ( = ?auto_200270 ?auto_200274 ) ) ( not ( = ?auto_200270 ?auto_200275 ) ) ( not ( = ?auto_200270 ?auto_200276 ) ) ( not ( = ?auto_200271 ?auto_200272 ) ) ( not ( = ?auto_200271 ?auto_200273 ) ) ( not ( = ?auto_200271 ?auto_200274 ) ) ( not ( = ?auto_200271 ?auto_200275 ) ) ( not ( = ?auto_200271 ?auto_200276 ) ) ( not ( = ?auto_200272 ?auto_200273 ) ) ( not ( = ?auto_200272 ?auto_200274 ) ) ( not ( = ?auto_200272 ?auto_200275 ) ) ( not ( = ?auto_200272 ?auto_200276 ) ) ( not ( = ?auto_200273 ?auto_200274 ) ) ( not ( = ?auto_200273 ?auto_200275 ) ) ( not ( = ?auto_200273 ?auto_200276 ) ) ( not ( = ?auto_200274 ?auto_200275 ) ) ( not ( = ?auto_200274 ?auto_200276 ) ) ( not ( = ?auto_200275 ?auto_200276 ) ) ( ON-TABLE ?auto_200276 ) ( ON ?auto_200275 ?auto_200276 ) ( ON ?auto_200274 ?auto_200275 ) ( ON ?auto_200273 ?auto_200274 ) ( ON ?auto_200272 ?auto_200273 ) ( ON ?auto_200271 ?auto_200272 ) ( ON ?auto_200270 ?auto_200271 ) ( ON ?auto_200269 ?auto_200270 ) ( CLEAR ?auto_200269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200276 ?auto_200275 ?auto_200274 ?auto_200273 ?auto_200272 ?auto_200271 ?auto_200270 )
      ( MAKE-8PILE ?auto_200269 ?auto_200270 ?auto_200271 ?auto_200272 ?auto_200273 ?auto_200274 ?auto_200275 ?auto_200276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200277 - BLOCK
      ?auto_200278 - BLOCK
      ?auto_200279 - BLOCK
      ?auto_200280 - BLOCK
      ?auto_200281 - BLOCK
      ?auto_200282 - BLOCK
      ?auto_200283 - BLOCK
      ?auto_200284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200277 ?auto_200278 ) ) ( not ( = ?auto_200277 ?auto_200279 ) ) ( not ( = ?auto_200277 ?auto_200280 ) ) ( not ( = ?auto_200277 ?auto_200281 ) ) ( not ( = ?auto_200277 ?auto_200282 ) ) ( not ( = ?auto_200277 ?auto_200283 ) ) ( not ( = ?auto_200277 ?auto_200284 ) ) ( not ( = ?auto_200278 ?auto_200279 ) ) ( not ( = ?auto_200278 ?auto_200280 ) ) ( not ( = ?auto_200278 ?auto_200281 ) ) ( not ( = ?auto_200278 ?auto_200282 ) ) ( not ( = ?auto_200278 ?auto_200283 ) ) ( not ( = ?auto_200278 ?auto_200284 ) ) ( not ( = ?auto_200279 ?auto_200280 ) ) ( not ( = ?auto_200279 ?auto_200281 ) ) ( not ( = ?auto_200279 ?auto_200282 ) ) ( not ( = ?auto_200279 ?auto_200283 ) ) ( not ( = ?auto_200279 ?auto_200284 ) ) ( not ( = ?auto_200280 ?auto_200281 ) ) ( not ( = ?auto_200280 ?auto_200282 ) ) ( not ( = ?auto_200280 ?auto_200283 ) ) ( not ( = ?auto_200280 ?auto_200284 ) ) ( not ( = ?auto_200281 ?auto_200282 ) ) ( not ( = ?auto_200281 ?auto_200283 ) ) ( not ( = ?auto_200281 ?auto_200284 ) ) ( not ( = ?auto_200282 ?auto_200283 ) ) ( not ( = ?auto_200282 ?auto_200284 ) ) ( not ( = ?auto_200283 ?auto_200284 ) ) ( ON-TABLE ?auto_200284 ) ( ON ?auto_200283 ?auto_200284 ) ( ON ?auto_200282 ?auto_200283 ) ( ON ?auto_200281 ?auto_200282 ) ( ON ?auto_200280 ?auto_200281 ) ( ON ?auto_200279 ?auto_200280 ) ( ON ?auto_200278 ?auto_200279 ) ( HOLDING ?auto_200277 ) ( CLEAR ?auto_200278 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200284 ?auto_200283 ?auto_200282 ?auto_200281 ?auto_200280 ?auto_200279 ?auto_200278 ?auto_200277 )
      ( MAKE-8PILE ?auto_200277 ?auto_200278 ?auto_200279 ?auto_200280 ?auto_200281 ?auto_200282 ?auto_200283 ?auto_200284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200285 - BLOCK
      ?auto_200286 - BLOCK
      ?auto_200287 - BLOCK
      ?auto_200288 - BLOCK
      ?auto_200289 - BLOCK
      ?auto_200290 - BLOCK
      ?auto_200291 - BLOCK
      ?auto_200292 - BLOCK
    )
    :vars
    (
      ?auto_200293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200285 ?auto_200286 ) ) ( not ( = ?auto_200285 ?auto_200287 ) ) ( not ( = ?auto_200285 ?auto_200288 ) ) ( not ( = ?auto_200285 ?auto_200289 ) ) ( not ( = ?auto_200285 ?auto_200290 ) ) ( not ( = ?auto_200285 ?auto_200291 ) ) ( not ( = ?auto_200285 ?auto_200292 ) ) ( not ( = ?auto_200286 ?auto_200287 ) ) ( not ( = ?auto_200286 ?auto_200288 ) ) ( not ( = ?auto_200286 ?auto_200289 ) ) ( not ( = ?auto_200286 ?auto_200290 ) ) ( not ( = ?auto_200286 ?auto_200291 ) ) ( not ( = ?auto_200286 ?auto_200292 ) ) ( not ( = ?auto_200287 ?auto_200288 ) ) ( not ( = ?auto_200287 ?auto_200289 ) ) ( not ( = ?auto_200287 ?auto_200290 ) ) ( not ( = ?auto_200287 ?auto_200291 ) ) ( not ( = ?auto_200287 ?auto_200292 ) ) ( not ( = ?auto_200288 ?auto_200289 ) ) ( not ( = ?auto_200288 ?auto_200290 ) ) ( not ( = ?auto_200288 ?auto_200291 ) ) ( not ( = ?auto_200288 ?auto_200292 ) ) ( not ( = ?auto_200289 ?auto_200290 ) ) ( not ( = ?auto_200289 ?auto_200291 ) ) ( not ( = ?auto_200289 ?auto_200292 ) ) ( not ( = ?auto_200290 ?auto_200291 ) ) ( not ( = ?auto_200290 ?auto_200292 ) ) ( not ( = ?auto_200291 ?auto_200292 ) ) ( ON-TABLE ?auto_200292 ) ( ON ?auto_200291 ?auto_200292 ) ( ON ?auto_200290 ?auto_200291 ) ( ON ?auto_200289 ?auto_200290 ) ( ON ?auto_200288 ?auto_200289 ) ( ON ?auto_200287 ?auto_200288 ) ( ON ?auto_200286 ?auto_200287 ) ( CLEAR ?auto_200286 ) ( ON ?auto_200285 ?auto_200293 ) ( CLEAR ?auto_200285 ) ( HAND-EMPTY ) ( not ( = ?auto_200285 ?auto_200293 ) ) ( not ( = ?auto_200286 ?auto_200293 ) ) ( not ( = ?auto_200287 ?auto_200293 ) ) ( not ( = ?auto_200288 ?auto_200293 ) ) ( not ( = ?auto_200289 ?auto_200293 ) ) ( not ( = ?auto_200290 ?auto_200293 ) ) ( not ( = ?auto_200291 ?auto_200293 ) ) ( not ( = ?auto_200292 ?auto_200293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_200285 ?auto_200293 )
      ( MAKE-8PILE ?auto_200285 ?auto_200286 ?auto_200287 ?auto_200288 ?auto_200289 ?auto_200290 ?auto_200291 ?auto_200292 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200294 - BLOCK
      ?auto_200295 - BLOCK
      ?auto_200296 - BLOCK
      ?auto_200297 - BLOCK
      ?auto_200298 - BLOCK
      ?auto_200299 - BLOCK
      ?auto_200300 - BLOCK
      ?auto_200301 - BLOCK
    )
    :vars
    (
      ?auto_200302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200294 ?auto_200295 ) ) ( not ( = ?auto_200294 ?auto_200296 ) ) ( not ( = ?auto_200294 ?auto_200297 ) ) ( not ( = ?auto_200294 ?auto_200298 ) ) ( not ( = ?auto_200294 ?auto_200299 ) ) ( not ( = ?auto_200294 ?auto_200300 ) ) ( not ( = ?auto_200294 ?auto_200301 ) ) ( not ( = ?auto_200295 ?auto_200296 ) ) ( not ( = ?auto_200295 ?auto_200297 ) ) ( not ( = ?auto_200295 ?auto_200298 ) ) ( not ( = ?auto_200295 ?auto_200299 ) ) ( not ( = ?auto_200295 ?auto_200300 ) ) ( not ( = ?auto_200295 ?auto_200301 ) ) ( not ( = ?auto_200296 ?auto_200297 ) ) ( not ( = ?auto_200296 ?auto_200298 ) ) ( not ( = ?auto_200296 ?auto_200299 ) ) ( not ( = ?auto_200296 ?auto_200300 ) ) ( not ( = ?auto_200296 ?auto_200301 ) ) ( not ( = ?auto_200297 ?auto_200298 ) ) ( not ( = ?auto_200297 ?auto_200299 ) ) ( not ( = ?auto_200297 ?auto_200300 ) ) ( not ( = ?auto_200297 ?auto_200301 ) ) ( not ( = ?auto_200298 ?auto_200299 ) ) ( not ( = ?auto_200298 ?auto_200300 ) ) ( not ( = ?auto_200298 ?auto_200301 ) ) ( not ( = ?auto_200299 ?auto_200300 ) ) ( not ( = ?auto_200299 ?auto_200301 ) ) ( not ( = ?auto_200300 ?auto_200301 ) ) ( ON-TABLE ?auto_200301 ) ( ON ?auto_200300 ?auto_200301 ) ( ON ?auto_200299 ?auto_200300 ) ( ON ?auto_200298 ?auto_200299 ) ( ON ?auto_200297 ?auto_200298 ) ( ON ?auto_200296 ?auto_200297 ) ( ON ?auto_200294 ?auto_200302 ) ( CLEAR ?auto_200294 ) ( not ( = ?auto_200294 ?auto_200302 ) ) ( not ( = ?auto_200295 ?auto_200302 ) ) ( not ( = ?auto_200296 ?auto_200302 ) ) ( not ( = ?auto_200297 ?auto_200302 ) ) ( not ( = ?auto_200298 ?auto_200302 ) ) ( not ( = ?auto_200299 ?auto_200302 ) ) ( not ( = ?auto_200300 ?auto_200302 ) ) ( not ( = ?auto_200301 ?auto_200302 ) ) ( HOLDING ?auto_200295 ) ( CLEAR ?auto_200296 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200301 ?auto_200300 ?auto_200299 ?auto_200298 ?auto_200297 ?auto_200296 ?auto_200295 )
      ( MAKE-8PILE ?auto_200294 ?auto_200295 ?auto_200296 ?auto_200297 ?auto_200298 ?auto_200299 ?auto_200300 ?auto_200301 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200303 - BLOCK
      ?auto_200304 - BLOCK
      ?auto_200305 - BLOCK
      ?auto_200306 - BLOCK
      ?auto_200307 - BLOCK
      ?auto_200308 - BLOCK
      ?auto_200309 - BLOCK
      ?auto_200310 - BLOCK
    )
    :vars
    (
      ?auto_200311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200303 ?auto_200304 ) ) ( not ( = ?auto_200303 ?auto_200305 ) ) ( not ( = ?auto_200303 ?auto_200306 ) ) ( not ( = ?auto_200303 ?auto_200307 ) ) ( not ( = ?auto_200303 ?auto_200308 ) ) ( not ( = ?auto_200303 ?auto_200309 ) ) ( not ( = ?auto_200303 ?auto_200310 ) ) ( not ( = ?auto_200304 ?auto_200305 ) ) ( not ( = ?auto_200304 ?auto_200306 ) ) ( not ( = ?auto_200304 ?auto_200307 ) ) ( not ( = ?auto_200304 ?auto_200308 ) ) ( not ( = ?auto_200304 ?auto_200309 ) ) ( not ( = ?auto_200304 ?auto_200310 ) ) ( not ( = ?auto_200305 ?auto_200306 ) ) ( not ( = ?auto_200305 ?auto_200307 ) ) ( not ( = ?auto_200305 ?auto_200308 ) ) ( not ( = ?auto_200305 ?auto_200309 ) ) ( not ( = ?auto_200305 ?auto_200310 ) ) ( not ( = ?auto_200306 ?auto_200307 ) ) ( not ( = ?auto_200306 ?auto_200308 ) ) ( not ( = ?auto_200306 ?auto_200309 ) ) ( not ( = ?auto_200306 ?auto_200310 ) ) ( not ( = ?auto_200307 ?auto_200308 ) ) ( not ( = ?auto_200307 ?auto_200309 ) ) ( not ( = ?auto_200307 ?auto_200310 ) ) ( not ( = ?auto_200308 ?auto_200309 ) ) ( not ( = ?auto_200308 ?auto_200310 ) ) ( not ( = ?auto_200309 ?auto_200310 ) ) ( ON-TABLE ?auto_200310 ) ( ON ?auto_200309 ?auto_200310 ) ( ON ?auto_200308 ?auto_200309 ) ( ON ?auto_200307 ?auto_200308 ) ( ON ?auto_200306 ?auto_200307 ) ( ON ?auto_200305 ?auto_200306 ) ( ON ?auto_200303 ?auto_200311 ) ( not ( = ?auto_200303 ?auto_200311 ) ) ( not ( = ?auto_200304 ?auto_200311 ) ) ( not ( = ?auto_200305 ?auto_200311 ) ) ( not ( = ?auto_200306 ?auto_200311 ) ) ( not ( = ?auto_200307 ?auto_200311 ) ) ( not ( = ?auto_200308 ?auto_200311 ) ) ( not ( = ?auto_200309 ?auto_200311 ) ) ( not ( = ?auto_200310 ?auto_200311 ) ) ( CLEAR ?auto_200305 ) ( ON ?auto_200304 ?auto_200303 ) ( CLEAR ?auto_200304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_200311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200311 ?auto_200303 )
      ( MAKE-8PILE ?auto_200303 ?auto_200304 ?auto_200305 ?auto_200306 ?auto_200307 ?auto_200308 ?auto_200309 ?auto_200310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200312 - BLOCK
      ?auto_200313 - BLOCK
      ?auto_200314 - BLOCK
      ?auto_200315 - BLOCK
      ?auto_200316 - BLOCK
      ?auto_200317 - BLOCK
      ?auto_200318 - BLOCK
      ?auto_200319 - BLOCK
    )
    :vars
    (
      ?auto_200320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200312 ?auto_200313 ) ) ( not ( = ?auto_200312 ?auto_200314 ) ) ( not ( = ?auto_200312 ?auto_200315 ) ) ( not ( = ?auto_200312 ?auto_200316 ) ) ( not ( = ?auto_200312 ?auto_200317 ) ) ( not ( = ?auto_200312 ?auto_200318 ) ) ( not ( = ?auto_200312 ?auto_200319 ) ) ( not ( = ?auto_200313 ?auto_200314 ) ) ( not ( = ?auto_200313 ?auto_200315 ) ) ( not ( = ?auto_200313 ?auto_200316 ) ) ( not ( = ?auto_200313 ?auto_200317 ) ) ( not ( = ?auto_200313 ?auto_200318 ) ) ( not ( = ?auto_200313 ?auto_200319 ) ) ( not ( = ?auto_200314 ?auto_200315 ) ) ( not ( = ?auto_200314 ?auto_200316 ) ) ( not ( = ?auto_200314 ?auto_200317 ) ) ( not ( = ?auto_200314 ?auto_200318 ) ) ( not ( = ?auto_200314 ?auto_200319 ) ) ( not ( = ?auto_200315 ?auto_200316 ) ) ( not ( = ?auto_200315 ?auto_200317 ) ) ( not ( = ?auto_200315 ?auto_200318 ) ) ( not ( = ?auto_200315 ?auto_200319 ) ) ( not ( = ?auto_200316 ?auto_200317 ) ) ( not ( = ?auto_200316 ?auto_200318 ) ) ( not ( = ?auto_200316 ?auto_200319 ) ) ( not ( = ?auto_200317 ?auto_200318 ) ) ( not ( = ?auto_200317 ?auto_200319 ) ) ( not ( = ?auto_200318 ?auto_200319 ) ) ( ON-TABLE ?auto_200319 ) ( ON ?auto_200318 ?auto_200319 ) ( ON ?auto_200317 ?auto_200318 ) ( ON ?auto_200316 ?auto_200317 ) ( ON ?auto_200315 ?auto_200316 ) ( ON ?auto_200312 ?auto_200320 ) ( not ( = ?auto_200312 ?auto_200320 ) ) ( not ( = ?auto_200313 ?auto_200320 ) ) ( not ( = ?auto_200314 ?auto_200320 ) ) ( not ( = ?auto_200315 ?auto_200320 ) ) ( not ( = ?auto_200316 ?auto_200320 ) ) ( not ( = ?auto_200317 ?auto_200320 ) ) ( not ( = ?auto_200318 ?auto_200320 ) ) ( not ( = ?auto_200319 ?auto_200320 ) ) ( ON ?auto_200313 ?auto_200312 ) ( CLEAR ?auto_200313 ) ( ON-TABLE ?auto_200320 ) ( HOLDING ?auto_200314 ) ( CLEAR ?auto_200315 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200319 ?auto_200318 ?auto_200317 ?auto_200316 ?auto_200315 ?auto_200314 )
      ( MAKE-8PILE ?auto_200312 ?auto_200313 ?auto_200314 ?auto_200315 ?auto_200316 ?auto_200317 ?auto_200318 ?auto_200319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200321 - BLOCK
      ?auto_200322 - BLOCK
      ?auto_200323 - BLOCK
      ?auto_200324 - BLOCK
      ?auto_200325 - BLOCK
      ?auto_200326 - BLOCK
      ?auto_200327 - BLOCK
      ?auto_200328 - BLOCK
    )
    :vars
    (
      ?auto_200329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200321 ?auto_200322 ) ) ( not ( = ?auto_200321 ?auto_200323 ) ) ( not ( = ?auto_200321 ?auto_200324 ) ) ( not ( = ?auto_200321 ?auto_200325 ) ) ( not ( = ?auto_200321 ?auto_200326 ) ) ( not ( = ?auto_200321 ?auto_200327 ) ) ( not ( = ?auto_200321 ?auto_200328 ) ) ( not ( = ?auto_200322 ?auto_200323 ) ) ( not ( = ?auto_200322 ?auto_200324 ) ) ( not ( = ?auto_200322 ?auto_200325 ) ) ( not ( = ?auto_200322 ?auto_200326 ) ) ( not ( = ?auto_200322 ?auto_200327 ) ) ( not ( = ?auto_200322 ?auto_200328 ) ) ( not ( = ?auto_200323 ?auto_200324 ) ) ( not ( = ?auto_200323 ?auto_200325 ) ) ( not ( = ?auto_200323 ?auto_200326 ) ) ( not ( = ?auto_200323 ?auto_200327 ) ) ( not ( = ?auto_200323 ?auto_200328 ) ) ( not ( = ?auto_200324 ?auto_200325 ) ) ( not ( = ?auto_200324 ?auto_200326 ) ) ( not ( = ?auto_200324 ?auto_200327 ) ) ( not ( = ?auto_200324 ?auto_200328 ) ) ( not ( = ?auto_200325 ?auto_200326 ) ) ( not ( = ?auto_200325 ?auto_200327 ) ) ( not ( = ?auto_200325 ?auto_200328 ) ) ( not ( = ?auto_200326 ?auto_200327 ) ) ( not ( = ?auto_200326 ?auto_200328 ) ) ( not ( = ?auto_200327 ?auto_200328 ) ) ( ON-TABLE ?auto_200328 ) ( ON ?auto_200327 ?auto_200328 ) ( ON ?auto_200326 ?auto_200327 ) ( ON ?auto_200325 ?auto_200326 ) ( ON ?auto_200324 ?auto_200325 ) ( ON ?auto_200321 ?auto_200329 ) ( not ( = ?auto_200321 ?auto_200329 ) ) ( not ( = ?auto_200322 ?auto_200329 ) ) ( not ( = ?auto_200323 ?auto_200329 ) ) ( not ( = ?auto_200324 ?auto_200329 ) ) ( not ( = ?auto_200325 ?auto_200329 ) ) ( not ( = ?auto_200326 ?auto_200329 ) ) ( not ( = ?auto_200327 ?auto_200329 ) ) ( not ( = ?auto_200328 ?auto_200329 ) ) ( ON ?auto_200322 ?auto_200321 ) ( ON-TABLE ?auto_200329 ) ( CLEAR ?auto_200324 ) ( ON ?auto_200323 ?auto_200322 ) ( CLEAR ?auto_200323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200329 ?auto_200321 ?auto_200322 )
      ( MAKE-8PILE ?auto_200321 ?auto_200322 ?auto_200323 ?auto_200324 ?auto_200325 ?auto_200326 ?auto_200327 ?auto_200328 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200330 - BLOCK
      ?auto_200331 - BLOCK
      ?auto_200332 - BLOCK
      ?auto_200333 - BLOCK
      ?auto_200334 - BLOCK
      ?auto_200335 - BLOCK
      ?auto_200336 - BLOCK
      ?auto_200337 - BLOCK
    )
    :vars
    (
      ?auto_200338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200330 ?auto_200331 ) ) ( not ( = ?auto_200330 ?auto_200332 ) ) ( not ( = ?auto_200330 ?auto_200333 ) ) ( not ( = ?auto_200330 ?auto_200334 ) ) ( not ( = ?auto_200330 ?auto_200335 ) ) ( not ( = ?auto_200330 ?auto_200336 ) ) ( not ( = ?auto_200330 ?auto_200337 ) ) ( not ( = ?auto_200331 ?auto_200332 ) ) ( not ( = ?auto_200331 ?auto_200333 ) ) ( not ( = ?auto_200331 ?auto_200334 ) ) ( not ( = ?auto_200331 ?auto_200335 ) ) ( not ( = ?auto_200331 ?auto_200336 ) ) ( not ( = ?auto_200331 ?auto_200337 ) ) ( not ( = ?auto_200332 ?auto_200333 ) ) ( not ( = ?auto_200332 ?auto_200334 ) ) ( not ( = ?auto_200332 ?auto_200335 ) ) ( not ( = ?auto_200332 ?auto_200336 ) ) ( not ( = ?auto_200332 ?auto_200337 ) ) ( not ( = ?auto_200333 ?auto_200334 ) ) ( not ( = ?auto_200333 ?auto_200335 ) ) ( not ( = ?auto_200333 ?auto_200336 ) ) ( not ( = ?auto_200333 ?auto_200337 ) ) ( not ( = ?auto_200334 ?auto_200335 ) ) ( not ( = ?auto_200334 ?auto_200336 ) ) ( not ( = ?auto_200334 ?auto_200337 ) ) ( not ( = ?auto_200335 ?auto_200336 ) ) ( not ( = ?auto_200335 ?auto_200337 ) ) ( not ( = ?auto_200336 ?auto_200337 ) ) ( ON-TABLE ?auto_200337 ) ( ON ?auto_200336 ?auto_200337 ) ( ON ?auto_200335 ?auto_200336 ) ( ON ?auto_200334 ?auto_200335 ) ( ON ?auto_200330 ?auto_200338 ) ( not ( = ?auto_200330 ?auto_200338 ) ) ( not ( = ?auto_200331 ?auto_200338 ) ) ( not ( = ?auto_200332 ?auto_200338 ) ) ( not ( = ?auto_200333 ?auto_200338 ) ) ( not ( = ?auto_200334 ?auto_200338 ) ) ( not ( = ?auto_200335 ?auto_200338 ) ) ( not ( = ?auto_200336 ?auto_200338 ) ) ( not ( = ?auto_200337 ?auto_200338 ) ) ( ON ?auto_200331 ?auto_200330 ) ( ON-TABLE ?auto_200338 ) ( ON ?auto_200332 ?auto_200331 ) ( CLEAR ?auto_200332 ) ( HOLDING ?auto_200333 ) ( CLEAR ?auto_200334 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200337 ?auto_200336 ?auto_200335 ?auto_200334 ?auto_200333 )
      ( MAKE-8PILE ?auto_200330 ?auto_200331 ?auto_200332 ?auto_200333 ?auto_200334 ?auto_200335 ?auto_200336 ?auto_200337 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200339 - BLOCK
      ?auto_200340 - BLOCK
      ?auto_200341 - BLOCK
      ?auto_200342 - BLOCK
      ?auto_200343 - BLOCK
      ?auto_200344 - BLOCK
      ?auto_200345 - BLOCK
      ?auto_200346 - BLOCK
    )
    :vars
    (
      ?auto_200347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200339 ?auto_200340 ) ) ( not ( = ?auto_200339 ?auto_200341 ) ) ( not ( = ?auto_200339 ?auto_200342 ) ) ( not ( = ?auto_200339 ?auto_200343 ) ) ( not ( = ?auto_200339 ?auto_200344 ) ) ( not ( = ?auto_200339 ?auto_200345 ) ) ( not ( = ?auto_200339 ?auto_200346 ) ) ( not ( = ?auto_200340 ?auto_200341 ) ) ( not ( = ?auto_200340 ?auto_200342 ) ) ( not ( = ?auto_200340 ?auto_200343 ) ) ( not ( = ?auto_200340 ?auto_200344 ) ) ( not ( = ?auto_200340 ?auto_200345 ) ) ( not ( = ?auto_200340 ?auto_200346 ) ) ( not ( = ?auto_200341 ?auto_200342 ) ) ( not ( = ?auto_200341 ?auto_200343 ) ) ( not ( = ?auto_200341 ?auto_200344 ) ) ( not ( = ?auto_200341 ?auto_200345 ) ) ( not ( = ?auto_200341 ?auto_200346 ) ) ( not ( = ?auto_200342 ?auto_200343 ) ) ( not ( = ?auto_200342 ?auto_200344 ) ) ( not ( = ?auto_200342 ?auto_200345 ) ) ( not ( = ?auto_200342 ?auto_200346 ) ) ( not ( = ?auto_200343 ?auto_200344 ) ) ( not ( = ?auto_200343 ?auto_200345 ) ) ( not ( = ?auto_200343 ?auto_200346 ) ) ( not ( = ?auto_200344 ?auto_200345 ) ) ( not ( = ?auto_200344 ?auto_200346 ) ) ( not ( = ?auto_200345 ?auto_200346 ) ) ( ON-TABLE ?auto_200346 ) ( ON ?auto_200345 ?auto_200346 ) ( ON ?auto_200344 ?auto_200345 ) ( ON ?auto_200343 ?auto_200344 ) ( ON ?auto_200339 ?auto_200347 ) ( not ( = ?auto_200339 ?auto_200347 ) ) ( not ( = ?auto_200340 ?auto_200347 ) ) ( not ( = ?auto_200341 ?auto_200347 ) ) ( not ( = ?auto_200342 ?auto_200347 ) ) ( not ( = ?auto_200343 ?auto_200347 ) ) ( not ( = ?auto_200344 ?auto_200347 ) ) ( not ( = ?auto_200345 ?auto_200347 ) ) ( not ( = ?auto_200346 ?auto_200347 ) ) ( ON ?auto_200340 ?auto_200339 ) ( ON-TABLE ?auto_200347 ) ( ON ?auto_200341 ?auto_200340 ) ( CLEAR ?auto_200343 ) ( ON ?auto_200342 ?auto_200341 ) ( CLEAR ?auto_200342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200347 ?auto_200339 ?auto_200340 ?auto_200341 )
      ( MAKE-8PILE ?auto_200339 ?auto_200340 ?auto_200341 ?auto_200342 ?auto_200343 ?auto_200344 ?auto_200345 ?auto_200346 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200348 - BLOCK
      ?auto_200349 - BLOCK
      ?auto_200350 - BLOCK
      ?auto_200351 - BLOCK
      ?auto_200352 - BLOCK
      ?auto_200353 - BLOCK
      ?auto_200354 - BLOCK
      ?auto_200355 - BLOCK
    )
    :vars
    (
      ?auto_200356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200348 ?auto_200349 ) ) ( not ( = ?auto_200348 ?auto_200350 ) ) ( not ( = ?auto_200348 ?auto_200351 ) ) ( not ( = ?auto_200348 ?auto_200352 ) ) ( not ( = ?auto_200348 ?auto_200353 ) ) ( not ( = ?auto_200348 ?auto_200354 ) ) ( not ( = ?auto_200348 ?auto_200355 ) ) ( not ( = ?auto_200349 ?auto_200350 ) ) ( not ( = ?auto_200349 ?auto_200351 ) ) ( not ( = ?auto_200349 ?auto_200352 ) ) ( not ( = ?auto_200349 ?auto_200353 ) ) ( not ( = ?auto_200349 ?auto_200354 ) ) ( not ( = ?auto_200349 ?auto_200355 ) ) ( not ( = ?auto_200350 ?auto_200351 ) ) ( not ( = ?auto_200350 ?auto_200352 ) ) ( not ( = ?auto_200350 ?auto_200353 ) ) ( not ( = ?auto_200350 ?auto_200354 ) ) ( not ( = ?auto_200350 ?auto_200355 ) ) ( not ( = ?auto_200351 ?auto_200352 ) ) ( not ( = ?auto_200351 ?auto_200353 ) ) ( not ( = ?auto_200351 ?auto_200354 ) ) ( not ( = ?auto_200351 ?auto_200355 ) ) ( not ( = ?auto_200352 ?auto_200353 ) ) ( not ( = ?auto_200352 ?auto_200354 ) ) ( not ( = ?auto_200352 ?auto_200355 ) ) ( not ( = ?auto_200353 ?auto_200354 ) ) ( not ( = ?auto_200353 ?auto_200355 ) ) ( not ( = ?auto_200354 ?auto_200355 ) ) ( ON-TABLE ?auto_200355 ) ( ON ?auto_200354 ?auto_200355 ) ( ON ?auto_200353 ?auto_200354 ) ( ON ?auto_200348 ?auto_200356 ) ( not ( = ?auto_200348 ?auto_200356 ) ) ( not ( = ?auto_200349 ?auto_200356 ) ) ( not ( = ?auto_200350 ?auto_200356 ) ) ( not ( = ?auto_200351 ?auto_200356 ) ) ( not ( = ?auto_200352 ?auto_200356 ) ) ( not ( = ?auto_200353 ?auto_200356 ) ) ( not ( = ?auto_200354 ?auto_200356 ) ) ( not ( = ?auto_200355 ?auto_200356 ) ) ( ON ?auto_200349 ?auto_200348 ) ( ON-TABLE ?auto_200356 ) ( ON ?auto_200350 ?auto_200349 ) ( ON ?auto_200351 ?auto_200350 ) ( CLEAR ?auto_200351 ) ( HOLDING ?auto_200352 ) ( CLEAR ?auto_200353 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_200355 ?auto_200354 ?auto_200353 ?auto_200352 )
      ( MAKE-8PILE ?auto_200348 ?auto_200349 ?auto_200350 ?auto_200351 ?auto_200352 ?auto_200353 ?auto_200354 ?auto_200355 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200357 - BLOCK
      ?auto_200358 - BLOCK
      ?auto_200359 - BLOCK
      ?auto_200360 - BLOCK
      ?auto_200361 - BLOCK
      ?auto_200362 - BLOCK
      ?auto_200363 - BLOCK
      ?auto_200364 - BLOCK
    )
    :vars
    (
      ?auto_200365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200357 ?auto_200358 ) ) ( not ( = ?auto_200357 ?auto_200359 ) ) ( not ( = ?auto_200357 ?auto_200360 ) ) ( not ( = ?auto_200357 ?auto_200361 ) ) ( not ( = ?auto_200357 ?auto_200362 ) ) ( not ( = ?auto_200357 ?auto_200363 ) ) ( not ( = ?auto_200357 ?auto_200364 ) ) ( not ( = ?auto_200358 ?auto_200359 ) ) ( not ( = ?auto_200358 ?auto_200360 ) ) ( not ( = ?auto_200358 ?auto_200361 ) ) ( not ( = ?auto_200358 ?auto_200362 ) ) ( not ( = ?auto_200358 ?auto_200363 ) ) ( not ( = ?auto_200358 ?auto_200364 ) ) ( not ( = ?auto_200359 ?auto_200360 ) ) ( not ( = ?auto_200359 ?auto_200361 ) ) ( not ( = ?auto_200359 ?auto_200362 ) ) ( not ( = ?auto_200359 ?auto_200363 ) ) ( not ( = ?auto_200359 ?auto_200364 ) ) ( not ( = ?auto_200360 ?auto_200361 ) ) ( not ( = ?auto_200360 ?auto_200362 ) ) ( not ( = ?auto_200360 ?auto_200363 ) ) ( not ( = ?auto_200360 ?auto_200364 ) ) ( not ( = ?auto_200361 ?auto_200362 ) ) ( not ( = ?auto_200361 ?auto_200363 ) ) ( not ( = ?auto_200361 ?auto_200364 ) ) ( not ( = ?auto_200362 ?auto_200363 ) ) ( not ( = ?auto_200362 ?auto_200364 ) ) ( not ( = ?auto_200363 ?auto_200364 ) ) ( ON-TABLE ?auto_200364 ) ( ON ?auto_200363 ?auto_200364 ) ( ON ?auto_200362 ?auto_200363 ) ( ON ?auto_200357 ?auto_200365 ) ( not ( = ?auto_200357 ?auto_200365 ) ) ( not ( = ?auto_200358 ?auto_200365 ) ) ( not ( = ?auto_200359 ?auto_200365 ) ) ( not ( = ?auto_200360 ?auto_200365 ) ) ( not ( = ?auto_200361 ?auto_200365 ) ) ( not ( = ?auto_200362 ?auto_200365 ) ) ( not ( = ?auto_200363 ?auto_200365 ) ) ( not ( = ?auto_200364 ?auto_200365 ) ) ( ON ?auto_200358 ?auto_200357 ) ( ON-TABLE ?auto_200365 ) ( ON ?auto_200359 ?auto_200358 ) ( ON ?auto_200360 ?auto_200359 ) ( CLEAR ?auto_200362 ) ( ON ?auto_200361 ?auto_200360 ) ( CLEAR ?auto_200361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_200365 ?auto_200357 ?auto_200358 ?auto_200359 ?auto_200360 )
      ( MAKE-8PILE ?auto_200357 ?auto_200358 ?auto_200359 ?auto_200360 ?auto_200361 ?auto_200362 ?auto_200363 ?auto_200364 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200366 - BLOCK
      ?auto_200367 - BLOCK
      ?auto_200368 - BLOCK
      ?auto_200369 - BLOCK
      ?auto_200370 - BLOCK
      ?auto_200371 - BLOCK
      ?auto_200372 - BLOCK
      ?auto_200373 - BLOCK
    )
    :vars
    (
      ?auto_200374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200366 ?auto_200367 ) ) ( not ( = ?auto_200366 ?auto_200368 ) ) ( not ( = ?auto_200366 ?auto_200369 ) ) ( not ( = ?auto_200366 ?auto_200370 ) ) ( not ( = ?auto_200366 ?auto_200371 ) ) ( not ( = ?auto_200366 ?auto_200372 ) ) ( not ( = ?auto_200366 ?auto_200373 ) ) ( not ( = ?auto_200367 ?auto_200368 ) ) ( not ( = ?auto_200367 ?auto_200369 ) ) ( not ( = ?auto_200367 ?auto_200370 ) ) ( not ( = ?auto_200367 ?auto_200371 ) ) ( not ( = ?auto_200367 ?auto_200372 ) ) ( not ( = ?auto_200367 ?auto_200373 ) ) ( not ( = ?auto_200368 ?auto_200369 ) ) ( not ( = ?auto_200368 ?auto_200370 ) ) ( not ( = ?auto_200368 ?auto_200371 ) ) ( not ( = ?auto_200368 ?auto_200372 ) ) ( not ( = ?auto_200368 ?auto_200373 ) ) ( not ( = ?auto_200369 ?auto_200370 ) ) ( not ( = ?auto_200369 ?auto_200371 ) ) ( not ( = ?auto_200369 ?auto_200372 ) ) ( not ( = ?auto_200369 ?auto_200373 ) ) ( not ( = ?auto_200370 ?auto_200371 ) ) ( not ( = ?auto_200370 ?auto_200372 ) ) ( not ( = ?auto_200370 ?auto_200373 ) ) ( not ( = ?auto_200371 ?auto_200372 ) ) ( not ( = ?auto_200371 ?auto_200373 ) ) ( not ( = ?auto_200372 ?auto_200373 ) ) ( ON-TABLE ?auto_200373 ) ( ON ?auto_200372 ?auto_200373 ) ( ON ?auto_200366 ?auto_200374 ) ( not ( = ?auto_200366 ?auto_200374 ) ) ( not ( = ?auto_200367 ?auto_200374 ) ) ( not ( = ?auto_200368 ?auto_200374 ) ) ( not ( = ?auto_200369 ?auto_200374 ) ) ( not ( = ?auto_200370 ?auto_200374 ) ) ( not ( = ?auto_200371 ?auto_200374 ) ) ( not ( = ?auto_200372 ?auto_200374 ) ) ( not ( = ?auto_200373 ?auto_200374 ) ) ( ON ?auto_200367 ?auto_200366 ) ( ON-TABLE ?auto_200374 ) ( ON ?auto_200368 ?auto_200367 ) ( ON ?auto_200369 ?auto_200368 ) ( ON ?auto_200370 ?auto_200369 ) ( CLEAR ?auto_200370 ) ( HOLDING ?auto_200371 ) ( CLEAR ?auto_200372 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_200373 ?auto_200372 ?auto_200371 )
      ( MAKE-8PILE ?auto_200366 ?auto_200367 ?auto_200368 ?auto_200369 ?auto_200370 ?auto_200371 ?auto_200372 ?auto_200373 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200375 - BLOCK
      ?auto_200376 - BLOCK
      ?auto_200377 - BLOCK
      ?auto_200378 - BLOCK
      ?auto_200379 - BLOCK
      ?auto_200380 - BLOCK
      ?auto_200381 - BLOCK
      ?auto_200382 - BLOCK
    )
    :vars
    (
      ?auto_200383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200375 ?auto_200376 ) ) ( not ( = ?auto_200375 ?auto_200377 ) ) ( not ( = ?auto_200375 ?auto_200378 ) ) ( not ( = ?auto_200375 ?auto_200379 ) ) ( not ( = ?auto_200375 ?auto_200380 ) ) ( not ( = ?auto_200375 ?auto_200381 ) ) ( not ( = ?auto_200375 ?auto_200382 ) ) ( not ( = ?auto_200376 ?auto_200377 ) ) ( not ( = ?auto_200376 ?auto_200378 ) ) ( not ( = ?auto_200376 ?auto_200379 ) ) ( not ( = ?auto_200376 ?auto_200380 ) ) ( not ( = ?auto_200376 ?auto_200381 ) ) ( not ( = ?auto_200376 ?auto_200382 ) ) ( not ( = ?auto_200377 ?auto_200378 ) ) ( not ( = ?auto_200377 ?auto_200379 ) ) ( not ( = ?auto_200377 ?auto_200380 ) ) ( not ( = ?auto_200377 ?auto_200381 ) ) ( not ( = ?auto_200377 ?auto_200382 ) ) ( not ( = ?auto_200378 ?auto_200379 ) ) ( not ( = ?auto_200378 ?auto_200380 ) ) ( not ( = ?auto_200378 ?auto_200381 ) ) ( not ( = ?auto_200378 ?auto_200382 ) ) ( not ( = ?auto_200379 ?auto_200380 ) ) ( not ( = ?auto_200379 ?auto_200381 ) ) ( not ( = ?auto_200379 ?auto_200382 ) ) ( not ( = ?auto_200380 ?auto_200381 ) ) ( not ( = ?auto_200380 ?auto_200382 ) ) ( not ( = ?auto_200381 ?auto_200382 ) ) ( ON-TABLE ?auto_200382 ) ( ON ?auto_200381 ?auto_200382 ) ( ON ?auto_200375 ?auto_200383 ) ( not ( = ?auto_200375 ?auto_200383 ) ) ( not ( = ?auto_200376 ?auto_200383 ) ) ( not ( = ?auto_200377 ?auto_200383 ) ) ( not ( = ?auto_200378 ?auto_200383 ) ) ( not ( = ?auto_200379 ?auto_200383 ) ) ( not ( = ?auto_200380 ?auto_200383 ) ) ( not ( = ?auto_200381 ?auto_200383 ) ) ( not ( = ?auto_200382 ?auto_200383 ) ) ( ON ?auto_200376 ?auto_200375 ) ( ON-TABLE ?auto_200383 ) ( ON ?auto_200377 ?auto_200376 ) ( ON ?auto_200378 ?auto_200377 ) ( ON ?auto_200379 ?auto_200378 ) ( CLEAR ?auto_200381 ) ( ON ?auto_200380 ?auto_200379 ) ( CLEAR ?auto_200380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_200383 ?auto_200375 ?auto_200376 ?auto_200377 ?auto_200378 ?auto_200379 )
      ( MAKE-8PILE ?auto_200375 ?auto_200376 ?auto_200377 ?auto_200378 ?auto_200379 ?auto_200380 ?auto_200381 ?auto_200382 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200384 - BLOCK
      ?auto_200385 - BLOCK
      ?auto_200386 - BLOCK
      ?auto_200387 - BLOCK
      ?auto_200388 - BLOCK
      ?auto_200389 - BLOCK
      ?auto_200390 - BLOCK
      ?auto_200391 - BLOCK
    )
    :vars
    (
      ?auto_200392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200384 ?auto_200385 ) ) ( not ( = ?auto_200384 ?auto_200386 ) ) ( not ( = ?auto_200384 ?auto_200387 ) ) ( not ( = ?auto_200384 ?auto_200388 ) ) ( not ( = ?auto_200384 ?auto_200389 ) ) ( not ( = ?auto_200384 ?auto_200390 ) ) ( not ( = ?auto_200384 ?auto_200391 ) ) ( not ( = ?auto_200385 ?auto_200386 ) ) ( not ( = ?auto_200385 ?auto_200387 ) ) ( not ( = ?auto_200385 ?auto_200388 ) ) ( not ( = ?auto_200385 ?auto_200389 ) ) ( not ( = ?auto_200385 ?auto_200390 ) ) ( not ( = ?auto_200385 ?auto_200391 ) ) ( not ( = ?auto_200386 ?auto_200387 ) ) ( not ( = ?auto_200386 ?auto_200388 ) ) ( not ( = ?auto_200386 ?auto_200389 ) ) ( not ( = ?auto_200386 ?auto_200390 ) ) ( not ( = ?auto_200386 ?auto_200391 ) ) ( not ( = ?auto_200387 ?auto_200388 ) ) ( not ( = ?auto_200387 ?auto_200389 ) ) ( not ( = ?auto_200387 ?auto_200390 ) ) ( not ( = ?auto_200387 ?auto_200391 ) ) ( not ( = ?auto_200388 ?auto_200389 ) ) ( not ( = ?auto_200388 ?auto_200390 ) ) ( not ( = ?auto_200388 ?auto_200391 ) ) ( not ( = ?auto_200389 ?auto_200390 ) ) ( not ( = ?auto_200389 ?auto_200391 ) ) ( not ( = ?auto_200390 ?auto_200391 ) ) ( ON-TABLE ?auto_200391 ) ( ON ?auto_200384 ?auto_200392 ) ( not ( = ?auto_200384 ?auto_200392 ) ) ( not ( = ?auto_200385 ?auto_200392 ) ) ( not ( = ?auto_200386 ?auto_200392 ) ) ( not ( = ?auto_200387 ?auto_200392 ) ) ( not ( = ?auto_200388 ?auto_200392 ) ) ( not ( = ?auto_200389 ?auto_200392 ) ) ( not ( = ?auto_200390 ?auto_200392 ) ) ( not ( = ?auto_200391 ?auto_200392 ) ) ( ON ?auto_200385 ?auto_200384 ) ( ON-TABLE ?auto_200392 ) ( ON ?auto_200386 ?auto_200385 ) ( ON ?auto_200387 ?auto_200386 ) ( ON ?auto_200388 ?auto_200387 ) ( ON ?auto_200389 ?auto_200388 ) ( CLEAR ?auto_200389 ) ( HOLDING ?auto_200390 ) ( CLEAR ?auto_200391 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_200391 ?auto_200390 )
      ( MAKE-8PILE ?auto_200384 ?auto_200385 ?auto_200386 ?auto_200387 ?auto_200388 ?auto_200389 ?auto_200390 ?auto_200391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200393 - BLOCK
      ?auto_200394 - BLOCK
      ?auto_200395 - BLOCK
      ?auto_200396 - BLOCK
      ?auto_200397 - BLOCK
      ?auto_200398 - BLOCK
      ?auto_200399 - BLOCK
      ?auto_200400 - BLOCK
    )
    :vars
    (
      ?auto_200401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200393 ?auto_200394 ) ) ( not ( = ?auto_200393 ?auto_200395 ) ) ( not ( = ?auto_200393 ?auto_200396 ) ) ( not ( = ?auto_200393 ?auto_200397 ) ) ( not ( = ?auto_200393 ?auto_200398 ) ) ( not ( = ?auto_200393 ?auto_200399 ) ) ( not ( = ?auto_200393 ?auto_200400 ) ) ( not ( = ?auto_200394 ?auto_200395 ) ) ( not ( = ?auto_200394 ?auto_200396 ) ) ( not ( = ?auto_200394 ?auto_200397 ) ) ( not ( = ?auto_200394 ?auto_200398 ) ) ( not ( = ?auto_200394 ?auto_200399 ) ) ( not ( = ?auto_200394 ?auto_200400 ) ) ( not ( = ?auto_200395 ?auto_200396 ) ) ( not ( = ?auto_200395 ?auto_200397 ) ) ( not ( = ?auto_200395 ?auto_200398 ) ) ( not ( = ?auto_200395 ?auto_200399 ) ) ( not ( = ?auto_200395 ?auto_200400 ) ) ( not ( = ?auto_200396 ?auto_200397 ) ) ( not ( = ?auto_200396 ?auto_200398 ) ) ( not ( = ?auto_200396 ?auto_200399 ) ) ( not ( = ?auto_200396 ?auto_200400 ) ) ( not ( = ?auto_200397 ?auto_200398 ) ) ( not ( = ?auto_200397 ?auto_200399 ) ) ( not ( = ?auto_200397 ?auto_200400 ) ) ( not ( = ?auto_200398 ?auto_200399 ) ) ( not ( = ?auto_200398 ?auto_200400 ) ) ( not ( = ?auto_200399 ?auto_200400 ) ) ( ON-TABLE ?auto_200400 ) ( ON ?auto_200393 ?auto_200401 ) ( not ( = ?auto_200393 ?auto_200401 ) ) ( not ( = ?auto_200394 ?auto_200401 ) ) ( not ( = ?auto_200395 ?auto_200401 ) ) ( not ( = ?auto_200396 ?auto_200401 ) ) ( not ( = ?auto_200397 ?auto_200401 ) ) ( not ( = ?auto_200398 ?auto_200401 ) ) ( not ( = ?auto_200399 ?auto_200401 ) ) ( not ( = ?auto_200400 ?auto_200401 ) ) ( ON ?auto_200394 ?auto_200393 ) ( ON-TABLE ?auto_200401 ) ( ON ?auto_200395 ?auto_200394 ) ( ON ?auto_200396 ?auto_200395 ) ( ON ?auto_200397 ?auto_200396 ) ( ON ?auto_200398 ?auto_200397 ) ( CLEAR ?auto_200400 ) ( ON ?auto_200399 ?auto_200398 ) ( CLEAR ?auto_200399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_200401 ?auto_200393 ?auto_200394 ?auto_200395 ?auto_200396 ?auto_200397 ?auto_200398 )
      ( MAKE-8PILE ?auto_200393 ?auto_200394 ?auto_200395 ?auto_200396 ?auto_200397 ?auto_200398 ?auto_200399 ?auto_200400 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200402 - BLOCK
      ?auto_200403 - BLOCK
      ?auto_200404 - BLOCK
      ?auto_200405 - BLOCK
      ?auto_200406 - BLOCK
      ?auto_200407 - BLOCK
      ?auto_200408 - BLOCK
      ?auto_200409 - BLOCK
    )
    :vars
    (
      ?auto_200410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200402 ?auto_200403 ) ) ( not ( = ?auto_200402 ?auto_200404 ) ) ( not ( = ?auto_200402 ?auto_200405 ) ) ( not ( = ?auto_200402 ?auto_200406 ) ) ( not ( = ?auto_200402 ?auto_200407 ) ) ( not ( = ?auto_200402 ?auto_200408 ) ) ( not ( = ?auto_200402 ?auto_200409 ) ) ( not ( = ?auto_200403 ?auto_200404 ) ) ( not ( = ?auto_200403 ?auto_200405 ) ) ( not ( = ?auto_200403 ?auto_200406 ) ) ( not ( = ?auto_200403 ?auto_200407 ) ) ( not ( = ?auto_200403 ?auto_200408 ) ) ( not ( = ?auto_200403 ?auto_200409 ) ) ( not ( = ?auto_200404 ?auto_200405 ) ) ( not ( = ?auto_200404 ?auto_200406 ) ) ( not ( = ?auto_200404 ?auto_200407 ) ) ( not ( = ?auto_200404 ?auto_200408 ) ) ( not ( = ?auto_200404 ?auto_200409 ) ) ( not ( = ?auto_200405 ?auto_200406 ) ) ( not ( = ?auto_200405 ?auto_200407 ) ) ( not ( = ?auto_200405 ?auto_200408 ) ) ( not ( = ?auto_200405 ?auto_200409 ) ) ( not ( = ?auto_200406 ?auto_200407 ) ) ( not ( = ?auto_200406 ?auto_200408 ) ) ( not ( = ?auto_200406 ?auto_200409 ) ) ( not ( = ?auto_200407 ?auto_200408 ) ) ( not ( = ?auto_200407 ?auto_200409 ) ) ( not ( = ?auto_200408 ?auto_200409 ) ) ( ON ?auto_200402 ?auto_200410 ) ( not ( = ?auto_200402 ?auto_200410 ) ) ( not ( = ?auto_200403 ?auto_200410 ) ) ( not ( = ?auto_200404 ?auto_200410 ) ) ( not ( = ?auto_200405 ?auto_200410 ) ) ( not ( = ?auto_200406 ?auto_200410 ) ) ( not ( = ?auto_200407 ?auto_200410 ) ) ( not ( = ?auto_200408 ?auto_200410 ) ) ( not ( = ?auto_200409 ?auto_200410 ) ) ( ON ?auto_200403 ?auto_200402 ) ( ON-TABLE ?auto_200410 ) ( ON ?auto_200404 ?auto_200403 ) ( ON ?auto_200405 ?auto_200404 ) ( ON ?auto_200406 ?auto_200405 ) ( ON ?auto_200407 ?auto_200406 ) ( ON ?auto_200408 ?auto_200407 ) ( CLEAR ?auto_200408 ) ( HOLDING ?auto_200409 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_200409 )
      ( MAKE-8PILE ?auto_200402 ?auto_200403 ?auto_200404 ?auto_200405 ?auto_200406 ?auto_200407 ?auto_200408 ?auto_200409 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_200411 - BLOCK
      ?auto_200412 - BLOCK
      ?auto_200413 - BLOCK
      ?auto_200414 - BLOCK
      ?auto_200415 - BLOCK
      ?auto_200416 - BLOCK
      ?auto_200417 - BLOCK
      ?auto_200418 - BLOCK
    )
    :vars
    (
      ?auto_200419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_200411 ?auto_200412 ) ) ( not ( = ?auto_200411 ?auto_200413 ) ) ( not ( = ?auto_200411 ?auto_200414 ) ) ( not ( = ?auto_200411 ?auto_200415 ) ) ( not ( = ?auto_200411 ?auto_200416 ) ) ( not ( = ?auto_200411 ?auto_200417 ) ) ( not ( = ?auto_200411 ?auto_200418 ) ) ( not ( = ?auto_200412 ?auto_200413 ) ) ( not ( = ?auto_200412 ?auto_200414 ) ) ( not ( = ?auto_200412 ?auto_200415 ) ) ( not ( = ?auto_200412 ?auto_200416 ) ) ( not ( = ?auto_200412 ?auto_200417 ) ) ( not ( = ?auto_200412 ?auto_200418 ) ) ( not ( = ?auto_200413 ?auto_200414 ) ) ( not ( = ?auto_200413 ?auto_200415 ) ) ( not ( = ?auto_200413 ?auto_200416 ) ) ( not ( = ?auto_200413 ?auto_200417 ) ) ( not ( = ?auto_200413 ?auto_200418 ) ) ( not ( = ?auto_200414 ?auto_200415 ) ) ( not ( = ?auto_200414 ?auto_200416 ) ) ( not ( = ?auto_200414 ?auto_200417 ) ) ( not ( = ?auto_200414 ?auto_200418 ) ) ( not ( = ?auto_200415 ?auto_200416 ) ) ( not ( = ?auto_200415 ?auto_200417 ) ) ( not ( = ?auto_200415 ?auto_200418 ) ) ( not ( = ?auto_200416 ?auto_200417 ) ) ( not ( = ?auto_200416 ?auto_200418 ) ) ( not ( = ?auto_200417 ?auto_200418 ) ) ( ON ?auto_200411 ?auto_200419 ) ( not ( = ?auto_200411 ?auto_200419 ) ) ( not ( = ?auto_200412 ?auto_200419 ) ) ( not ( = ?auto_200413 ?auto_200419 ) ) ( not ( = ?auto_200414 ?auto_200419 ) ) ( not ( = ?auto_200415 ?auto_200419 ) ) ( not ( = ?auto_200416 ?auto_200419 ) ) ( not ( = ?auto_200417 ?auto_200419 ) ) ( not ( = ?auto_200418 ?auto_200419 ) ) ( ON ?auto_200412 ?auto_200411 ) ( ON-TABLE ?auto_200419 ) ( ON ?auto_200413 ?auto_200412 ) ( ON ?auto_200414 ?auto_200413 ) ( ON ?auto_200415 ?auto_200414 ) ( ON ?auto_200416 ?auto_200415 ) ( ON ?auto_200417 ?auto_200416 ) ( ON ?auto_200418 ?auto_200417 ) ( CLEAR ?auto_200418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_200419 ?auto_200411 ?auto_200412 ?auto_200413 ?auto_200414 ?auto_200415 ?auto_200416 ?auto_200417 )
      ( MAKE-8PILE ?auto_200411 ?auto_200412 ?auto_200413 ?auto_200414 ?auto_200415 ?auto_200416 ?auto_200417 ?auto_200418 ) )
  )

)

