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
      ?auto_247145 - BLOCK
    )
    :vars
    (
      ?auto_247146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247145 ?auto_247146 ) ( CLEAR ?auto_247145 ) ( HAND-EMPTY ) ( not ( = ?auto_247145 ?auto_247146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247145 ?auto_247146 )
      ( !PUTDOWN ?auto_247145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_247148 - BLOCK
    )
    :vars
    (
      ?auto_247149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247148 ?auto_247149 ) ( CLEAR ?auto_247148 ) ( HAND-EMPTY ) ( not ( = ?auto_247148 ?auto_247149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247148 ?auto_247149 )
      ( !PUTDOWN ?auto_247148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247152 - BLOCK
      ?auto_247153 - BLOCK
    )
    :vars
    (
      ?auto_247154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247152 ) ( ON ?auto_247153 ?auto_247154 ) ( CLEAR ?auto_247153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247152 ) ( not ( = ?auto_247152 ?auto_247153 ) ) ( not ( = ?auto_247152 ?auto_247154 ) ) ( not ( = ?auto_247153 ?auto_247154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247153 ?auto_247154 )
      ( !STACK ?auto_247153 ?auto_247152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247157 - BLOCK
      ?auto_247158 - BLOCK
    )
    :vars
    (
      ?auto_247159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247157 ) ( ON ?auto_247158 ?auto_247159 ) ( CLEAR ?auto_247158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247157 ) ( not ( = ?auto_247157 ?auto_247158 ) ) ( not ( = ?auto_247157 ?auto_247159 ) ) ( not ( = ?auto_247158 ?auto_247159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247158 ?auto_247159 )
      ( !STACK ?auto_247158 ?auto_247157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247162 - BLOCK
      ?auto_247163 - BLOCK
    )
    :vars
    (
      ?auto_247164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247163 ?auto_247164 ) ( not ( = ?auto_247162 ?auto_247163 ) ) ( not ( = ?auto_247162 ?auto_247164 ) ) ( not ( = ?auto_247163 ?auto_247164 ) ) ( ON ?auto_247162 ?auto_247163 ) ( CLEAR ?auto_247162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247162 )
      ( MAKE-2PILE ?auto_247162 ?auto_247163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247167 - BLOCK
      ?auto_247168 - BLOCK
    )
    :vars
    (
      ?auto_247169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247168 ?auto_247169 ) ( not ( = ?auto_247167 ?auto_247168 ) ) ( not ( = ?auto_247167 ?auto_247169 ) ) ( not ( = ?auto_247168 ?auto_247169 ) ) ( ON ?auto_247167 ?auto_247168 ) ( CLEAR ?auto_247167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247167 )
      ( MAKE-2PILE ?auto_247167 ?auto_247168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247173 - BLOCK
      ?auto_247174 - BLOCK
      ?auto_247175 - BLOCK
    )
    :vars
    (
      ?auto_247176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247174 ) ( ON ?auto_247175 ?auto_247176 ) ( CLEAR ?auto_247175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247173 ) ( ON ?auto_247174 ?auto_247173 ) ( not ( = ?auto_247173 ?auto_247174 ) ) ( not ( = ?auto_247173 ?auto_247175 ) ) ( not ( = ?auto_247173 ?auto_247176 ) ) ( not ( = ?auto_247174 ?auto_247175 ) ) ( not ( = ?auto_247174 ?auto_247176 ) ) ( not ( = ?auto_247175 ?auto_247176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247175 ?auto_247176 )
      ( !STACK ?auto_247175 ?auto_247174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247180 - BLOCK
      ?auto_247181 - BLOCK
      ?auto_247182 - BLOCK
    )
    :vars
    (
      ?auto_247183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247181 ) ( ON ?auto_247182 ?auto_247183 ) ( CLEAR ?auto_247182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247180 ) ( ON ?auto_247181 ?auto_247180 ) ( not ( = ?auto_247180 ?auto_247181 ) ) ( not ( = ?auto_247180 ?auto_247182 ) ) ( not ( = ?auto_247180 ?auto_247183 ) ) ( not ( = ?auto_247181 ?auto_247182 ) ) ( not ( = ?auto_247181 ?auto_247183 ) ) ( not ( = ?auto_247182 ?auto_247183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247182 ?auto_247183 )
      ( !STACK ?auto_247182 ?auto_247181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247187 - BLOCK
      ?auto_247188 - BLOCK
      ?auto_247189 - BLOCK
    )
    :vars
    (
      ?auto_247190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247189 ?auto_247190 ) ( ON-TABLE ?auto_247187 ) ( not ( = ?auto_247187 ?auto_247188 ) ) ( not ( = ?auto_247187 ?auto_247189 ) ) ( not ( = ?auto_247187 ?auto_247190 ) ) ( not ( = ?auto_247188 ?auto_247189 ) ) ( not ( = ?auto_247188 ?auto_247190 ) ) ( not ( = ?auto_247189 ?auto_247190 ) ) ( CLEAR ?auto_247187 ) ( ON ?auto_247188 ?auto_247189 ) ( CLEAR ?auto_247188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247187 ?auto_247188 )
      ( MAKE-3PILE ?auto_247187 ?auto_247188 ?auto_247189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247194 - BLOCK
      ?auto_247195 - BLOCK
      ?auto_247196 - BLOCK
    )
    :vars
    (
      ?auto_247197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247196 ?auto_247197 ) ( ON-TABLE ?auto_247194 ) ( not ( = ?auto_247194 ?auto_247195 ) ) ( not ( = ?auto_247194 ?auto_247196 ) ) ( not ( = ?auto_247194 ?auto_247197 ) ) ( not ( = ?auto_247195 ?auto_247196 ) ) ( not ( = ?auto_247195 ?auto_247197 ) ) ( not ( = ?auto_247196 ?auto_247197 ) ) ( CLEAR ?auto_247194 ) ( ON ?auto_247195 ?auto_247196 ) ( CLEAR ?auto_247195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247194 ?auto_247195 )
      ( MAKE-3PILE ?auto_247194 ?auto_247195 ?auto_247196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247201 - BLOCK
      ?auto_247202 - BLOCK
      ?auto_247203 - BLOCK
    )
    :vars
    (
      ?auto_247204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247203 ?auto_247204 ) ( not ( = ?auto_247201 ?auto_247202 ) ) ( not ( = ?auto_247201 ?auto_247203 ) ) ( not ( = ?auto_247201 ?auto_247204 ) ) ( not ( = ?auto_247202 ?auto_247203 ) ) ( not ( = ?auto_247202 ?auto_247204 ) ) ( not ( = ?auto_247203 ?auto_247204 ) ) ( ON ?auto_247202 ?auto_247203 ) ( ON ?auto_247201 ?auto_247202 ) ( CLEAR ?auto_247201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247201 )
      ( MAKE-3PILE ?auto_247201 ?auto_247202 ?auto_247203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_247208 - BLOCK
      ?auto_247209 - BLOCK
      ?auto_247210 - BLOCK
    )
    :vars
    (
      ?auto_247211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247210 ?auto_247211 ) ( not ( = ?auto_247208 ?auto_247209 ) ) ( not ( = ?auto_247208 ?auto_247210 ) ) ( not ( = ?auto_247208 ?auto_247211 ) ) ( not ( = ?auto_247209 ?auto_247210 ) ) ( not ( = ?auto_247209 ?auto_247211 ) ) ( not ( = ?auto_247210 ?auto_247211 ) ) ( ON ?auto_247209 ?auto_247210 ) ( ON ?auto_247208 ?auto_247209 ) ( CLEAR ?auto_247208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247208 )
      ( MAKE-3PILE ?auto_247208 ?auto_247209 ?auto_247210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247216 - BLOCK
      ?auto_247217 - BLOCK
      ?auto_247218 - BLOCK
      ?auto_247219 - BLOCK
    )
    :vars
    (
      ?auto_247220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247218 ) ( ON ?auto_247219 ?auto_247220 ) ( CLEAR ?auto_247219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247216 ) ( ON ?auto_247217 ?auto_247216 ) ( ON ?auto_247218 ?auto_247217 ) ( not ( = ?auto_247216 ?auto_247217 ) ) ( not ( = ?auto_247216 ?auto_247218 ) ) ( not ( = ?auto_247216 ?auto_247219 ) ) ( not ( = ?auto_247216 ?auto_247220 ) ) ( not ( = ?auto_247217 ?auto_247218 ) ) ( not ( = ?auto_247217 ?auto_247219 ) ) ( not ( = ?auto_247217 ?auto_247220 ) ) ( not ( = ?auto_247218 ?auto_247219 ) ) ( not ( = ?auto_247218 ?auto_247220 ) ) ( not ( = ?auto_247219 ?auto_247220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247219 ?auto_247220 )
      ( !STACK ?auto_247219 ?auto_247218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247225 - BLOCK
      ?auto_247226 - BLOCK
      ?auto_247227 - BLOCK
      ?auto_247228 - BLOCK
    )
    :vars
    (
      ?auto_247229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247227 ) ( ON ?auto_247228 ?auto_247229 ) ( CLEAR ?auto_247228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247225 ) ( ON ?auto_247226 ?auto_247225 ) ( ON ?auto_247227 ?auto_247226 ) ( not ( = ?auto_247225 ?auto_247226 ) ) ( not ( = ?auto_247225 ?auto_247227 ) ) ( not ( = ?auto_247225 ?auto_247228 ) ) ( not ( = ?auto_247225 ?auto_247229 ) ) ( not ( = ?auto_247226 ?auto_247227 ) ) ( not ( = ?auto_247226 ?auto_247228 ) ) ( not ( = ?auto_247226 ?auto_247229 ) ) ( not ( = ?auto_247227 ?auto_247228 ) ) ( not ( = ?auto_247227 ?auto_247229 ) ) ( not ( = ?auto_247228 ?auto_247229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247228 ?auto_247229 )
      ( !STACK ?auto_247228 ?auto_247227 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247234 - BLOCK
      ?auto_247235 - BLOCK
      ?auto_247236 - BLOCK
      ?auto_247237 - BLOCK
    )
    :vars
    (
      ?auto_247238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247237 ?auto_247238 ) ( ON-TABLE ?auto_247234 ) ( ON ?auto_247235 ?auto_247234 ) ( not ( = ?auto_247234 ?auto_247235 ) ) ( not ( = ?auto_247234 ?auto_247236 ) ) ( not ( = ?auto_247234 ?auto_247237 ) ) ( not ( = ?auto_247234 ?auto_247238 ) ) ( not ( = ?auto_247235 ?auto_247236 ) ) ( not ( = ?auto_247235 ?auto_247237 ) ) ( not ( = ?auto_247235 ?auto_247238 ) ) ( not ( = ?auto_247236 ?auto_247237 ) ) ( not ( = ?auto_247236 ?auto_247238 ) ) ( not ( = ?auto_247237 ?auto_247238 ) ) ( CLEAR ?auto_247235 ) ( ON ?auto_247236 ?auto_247237 ) ( CLEAR ?auto_247236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247234 ?auto_247235 ?auto_247236 )
      ( MAKE-4PILE ?auto_247234 ?auto_247235 ?auto_247236 ?auto_247237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247243 - BLOCK
      ?auto_247244 - BLOCK
      ?auto_247245 - BLOCK
      ?auto_247246 - BLOCK
    )
    :vars
    (
      ?auto_247247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247246 ?auto_247247 ) ( ON-TABLE ?auto_247243 ) ( ON ?auto_247244 ?auto_247243 ) ( not ( = ?auto_247243 ?auto_247244 ) ) ( not ( = ?auto_247243 ?auto_247245 ) ) ( not ( = ?auto_247243 ?auto_247246 ) ) ( not ( = ?auto_247243 ?auto_247247 ) ) ( not ( = ?auto_247244 ?auto_247245 ) ) ( not ( = ?auto_247244 ?auto_247246 ) ) ( not ( = ?auto_247244 ?auto_247247 ) ) ( not ( = ?auto_247245 ?auto_247246 ) ) ( not ( = ?auto_247245 ?auto_247247 ) ) ( not ( = ?auto_247246 ?auto_247247 ) ) ( CLEAR ?auto_247244 ) ( ON ?auto_247245 ?auto_247246 ) ( CLEAR ?auto_247245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247243 ?auto_247244 ?auto_247245 )
      ( MAKE-4PILE ?auto_247243 ?auto_247244 ?auto_247245 ?auto_247246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247252 - BLOCK
      ?auto_247253 - BLOCK
      ?auto_247254 - BLOCK
      ?auto_247255 - BLOCK
    )
    :vars
    (
      ?auto_247256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247255 ?auto_247256 ) ( ON-TABLE ?auto_247252 ) ( not ( = ?auto_247252 ?auto_247253 ) ) ( not ( = ?auto_247252 ?auto_247254 ) ) ( not ( = ?auto_247252 ?auto_247255 ) ) ( not ( = ?auto_247252 ?auto_247256 ) ) ( not ( = ?auto_247253 ?auto_247254 ) ) ( not ( = ?auto_247253 ?auto_247255 ) ) ( not ( = ?auto_247253 ?auto_247256 ) ) ( not ( = ?auto_247254 ?auto_247255 ) ) ( not ( = ?auto_247254 ?auto_247256 ) ) ( not ( = ?auto_247255 ?auto_247256 ) ) ( ON ?auto_247254 ?auto_247255 ) ( CLEAR ?auto_247252 ) ( ON ?auto_247253 ?auto_247254 ) ( CLEAR ?auto_247253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247252 ?auto_247253 )
      ( MAKE-4PILE ?auto_247252 ?auto_247253 ?auto_247254 ?auto_247255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247261 - BLOCK
      ?auto_247262 - BLOCK
      ?auto_247263 - BLOCK
      ?auto_247264 - BLOCK
    )
    :vars
    (
      ?auto_247265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247264 ?auto_247265 ) ( ON-TABLE ?auto_247261 ) ( not ( = ?auto_247261 ?auto_247262 ) ) ( not ( = ?auto_247261 ?auto_247263 ) ) ( not ( = ?auto_247261 ?auto_247264 ) ) ( not ( = ?auto_247261 ?auto_247265 ) ) ( not ( = ?auto_247262 ?auto_247263 ) ) ( not ( = ?auto_247262 ?auto_247264 ) ) ( not ( = ?auto_247262 ?auto_247265 ) ) ( not ( = ?auto_247263 ?auto_247264 ) ) ( not ( = ?auto_247263 ?auto_247265 ) ) ( not ( = ?auto_247264 ?auto_247265 ) ) ( ON ?auto_247263 ?auto_247264 ) ( CLEAR ?auto_247261 ) ( ON ?auto_247262 ?auto_247263 ) ( CLEAR ?auto_247262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247261 ?auto_247262 )
      ( MAKE-4PILE ?auto_247261 ?auto_247262 ?auto_247263 ?auto_247264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247270 - BLOCK
      ?auto_247271 - BLOCK
      ?auto_247272 - BLOCK
      ?auto_247273 - BLOCK
    )
    :vars
    (
      ?auto_247274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247273 ?auto_247274 ) ( not ( = ?auto_247270 ?auto_247271 ) ) ( not ( = ?auto_247270 ?auto_247272 ) ) ( not ( = ?auto_247270 ?auto_247273 ) ) ( not ( = ?auto_247270 ?auto_247274 ) ) ( not ( = ?auto_247271 ?auto_247272 ) ) ( not ( = ?auto_247271 ?auto_247273 ) ) ( not ( = ?auto_247271 ?auto_247274 ) ) ( not ( = ?auto_247272 ?auto_247273 ) ) ( not ( = ?auto_247272 ?auto_247274 ) ) ( not ( = ?auto_247273 ?auto_247274 ) ) ( ON ?auto_247272 ?auto_247273 ) ( ON ?auto_247271 ?auto_247272 ) ( ON ?auto_247270 ?auto_247271 ) ( CLEAR ?auto_247270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247270 )
      ( MAKE-4PILE ?auto_247270 ?auto_247271 ?auto_247272 ?auto_247273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_247279 - BLOCK
      ?auto_247280 - BLOCK
      ?auto_247281 - BLOCK
      ?auto_247282 - BLOCK
    )
    :vars
    (
      ?auto_247283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247282 ?auto_247283 ) ( not ( = ?auto_247279 ?auto_247280 ) ) ( not ( = ?auto_247279 ?auto_247281 ) ) ( not ( = ?auto_247279 ?auto_247282 ) ) ( not ( = ?auto_247279 ?auto_247283 ) ) ( not ( = ?auto_247280 ?auto_247281 ) ) ( not ( = ?auto_247280 ?auto_247282 ) ) ( not ( = ?auto_247280 ?auto_247283 ) ) ( not ( = ?auto_247281 ?auto_247282 ) ) ( not ( = ?auto_247281 ?auto_247283 ) ) ( not ( = ?auto_247282 ?auto_247283 ) ) ( ON ?auto_247281 ?auto_247282 ) ( ON ?auto_247280 ?auto_247281 ) ( ON ?auto_247279 ?auto_247280 ) ( CLEAR ?auto_247279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247279 )
      ( MAKE-4PILE ?auto_247279 ?auto_247280 ?auto_247281 ?auto_247282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247289 - BLOCK
      ?auto_247290 - BLOCK
      ?auto_247291 - BLOCK
      ?auto_247292 - BLOCK
      ?auto_247293 - BLOCK
    )
    :vars
    (
      ?auto_247294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247292 ) ( ON ?auto_247293 ?auto_247294 ) ( CLEAR ?auto_247293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247289 ) ( ON ?auto_247290 ?auto_247289 ) ( ON ?auto_247291 ?auto_247290 ) ( ON ?auto_247292 ?auto_247291 ) ( not ( = ?auto_247289 ?auto_247290 ) ) ( not ( = ?auto_247289 ?auto_247291 ) ) ( not ( = ?auto_247289 ?auto_247292 ) ) ( not ( = ?auto_247289 ?auto_247293 ) ) ( not ( = ?auto_247289 ?auto_247294 ) ) ( not ( = ?auto_247290 ?auto_247291 ) ) ( not ( = ?auto_247290 ?auto_247292 ) ) ( not ( = ?auto_247290 ?auto_247293 ) ) ( not ( = ?auto_247290 ?auto_247294 ) ) ( not ( = ?auto_247291 ?auto_247292 ) ) ( not ( = ?auto_247291 ?auto_247293 ) ) ( not ( = ?auto_247291 ?auto_247294 ) ) ( not ( = ?auto_247292 ?auto_247293 ) ) ( not ( = ?auto_247292 ?auto_247294 ) ) ( not ( = ?auto_247293 ?auto_247294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247293 ?auto_247294 )
      ( !STACK ?auto_247293 ?auto_247292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247300 - BLOCK
      ?auto_247301 - BLOCK
      ?auto_247302 - BLOCK
      ?auto_247303 - BLOCK
      ?auto_247304 - BLOCK
    )
    :vars
    (
      ?auto_247305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247303 ) ( ON ?auto_247304 ?auto_247305 ) ( CLEAR ?auto_247304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247300 ) ( ON ?auto_247301 ?auto_247300 ) ( ON ?auto_247302 ?auto_247301 ) ( ON ?auto_247303 ?auto_247302 ) ( not ( = ?auto_247300 ?auto_247301 ) ) ( not ( = ?auto_247300 ?auto_247302 ) ) ( not ( = ?auto_247300 ?auto_247303 ) ) ( not ( = ?auto_247300 ?auto_247304 ) ) ( not ( = ?auto_247300 ?auto_247305 ) ) ( not ( = ?auto_247301 ?auto_247302 ) ) ( not ( = ?auto_247301 ?auto_247303 ) ) ( not ( = ?auto_247301 ?auto_247304 ) ) ( not ( = ?auto_247301 ?auto_247305 ) ) ( not ( = ?auto_247302 ?auto_247303 ) ) ( not ( = ?auto_247302 ?auto_247304 ) ) ( not ( = ?auto_247302 ?auto_247305 ) ) ( not ( = ?auto_247303 ?auto_247304 ) ) ( not ( = ?auto_247303 ?auto_247305 ) ) ( not ( = ?auto_247304 ?auto_247305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247304 ?auto_247305 )
      ( !STACK ?auto_247304 ?auto_247303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247311 - BLOCK
      ?auto_247312 - BLOCK
      ?auto_247313 - BLOCK
      ?auto_247314 - BLOCK
      ?auto_247315 - BLOCK
    )
    :vars
    (
      ?auto_247316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247315 ?auto_247316 ) ( ON-TABLE ?auto_247311 ) ( ON ?auto_247312 ?auto_247311 ) ( ON ?auto_247313 ?auto_247312 ) ( not ( = ?auto_247311 ?auto_247312 ) ) ( not ( = ?auto_247311 ?auto_247313 ) ) ( not ( = ?auto_247311 ?auto_247314 ) ) ( not ( = ?auto_247311 ?auto_247315 ) ) ( not ( = ?auto_247311 ?auto_247316 ) ) ( not ( = ?auto_247312 ?auto_247313 ) ) ( not ( = ?auto_247312 ?auto_247314 ) ) ( not ( = ?auto_247312 ?auto_247315 ) ) ( not ( = ?auto_247312 ?auto_247316 ) ) ( not ( = ?auto_247313 ?auto_247314 ) ) ( not ( = ?auto_247313 ?auto_247315 ) ) ( not ( = ?auto_247313 ?auto_247316 ) ) ( not ( = ?auto_247314 ?auto_247315 ) ) ( not ( = ?auto_247314 ?auto_247316 ) ) ( not ( = ?auto_247315 ?auto_247316 ) ) ( CLEAR ?auto_247313 ) ( ON ?auto_247314 ?auto_247315 ) ( CLEAR ?auto_247314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247311 ?auto_247312 ?auto_247313 ?auto_247314 )
      ( MAKE-5PILE ?auto_247311 ?auto_247312 ?auto_247313 ?auto_247314 ?auto_247315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247322 - BLOCK
      ?auto_247323 - BLOCK
      ?auto_247324 - BLOCK
      ?auto_247325 - BLOCK
      ?auto_247326 - BLOCK
    )
    :vars
    (
      ?auto_247327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247326 ?auto_247327 ) ( ON-TABLE ?auto_247322 ) ( ON ?auto_247323 ?auto_247322 ) ( ON ?auto_247324 ?auto_247323 ) ( not ( = ?auto_247322 ?auto_247323 ) ) ( not ( = ?auto_247322 ?auto_247324 ) ) ( not ( = ?auto_247322 ?auto_247325 ) ) ( not ( = ?auto_247322 ?auto_247326 ) ) ( not ( = ?auto_247322 ?auto_247327 ) ) ( not ( = ?auto_247323 ?auto_247324 ) ) ( not ( = ?auto_247323 ?auto_247325 ) ) ( not ( = ?auto_247323 ?auto_247326 ) ) ( not ( = ?auto_247323 ?auto_247327 ) ) ( not ( = ?auto_247324 ?auto_247325 ) ) ( not ( = ?auto_247324 ?auto_247326 ) ) ( not ( = ?auto_247324 ?auto_247327 ) ) ( not ( = ?auto_247325 ?auto_247326 ) ) ( not ( = ?auto_247325 ?auto_247327 ) ) ( not ( = ?auto_247326 ?auto_247327 ) ) ( CLEAR ?auto_247324 ) ( ON ?auto_247325 ?auto_247326 ) ( CLEAR ?auto_247325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247322 ?auto_247323 ?auto_247324 ?auto_247325 )
      ( MAKE-5PILE ?auto_247322 ?auto_247323 ?auto_247324 ?auto_247325 ?auto_247326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247333 - BLOCK
      ?auto_247334 - BLOCK
      ?auto_247335 - BLOCK
      ?auto_247336 - BLOCK
      ?auto_247337 - BLOCK
    )
    :vars
    (
      ?auto_247338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247337 ?auto_247338 ) ( ON-TABLE ?auto_247333 ) ( ON ?auto_247334 ?auto_247333 ) ( not ( = ?auto_247333 ?auto_247334 ) ) ( not ( = ?auto_247333 ?auto_247335 ) ) ( not ( = ?auto_247333 ?auto_247336 ) ) ( not ( = ?auto_247333 ?auto_247337 ) ) ( not ( = ?auto_247333 ?auto_247338 ) ) ( not ( = ?auto_247334 ?auto_247335 ) ) ( not ( = ?auto_247334 ?auto_247336 ) ) ( not ( = ?auto_247334 ?auto_247337 ) ) ( not ( = ?auto_247334 ?auto_247338 ) ) ( not ( = ?auto_247335 ?auto_247336 ) ) ( not ( = ?auto_247335 ?auto_247337 ) ) ( not ( = ?auto_247335 ?auto_247338 ) ) ( not ( = ?auto_247336 ?auto_247337 ) ) ( not ( = ?auto_247336 ?auto_247338 ) ) ( not ( = ?auto_247337 ?auto_247338 ) ) ( ON ?auto_247336 ?auto_247337 ) ( CLEAR ?auto_247334 ) ( ON ?auto_247335 ?auto_247336 ) ( CLEAR ?auto_247335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247333 ?auto_247334 ?auto_247335 )
      ( MAKE-5PILE ?auto_247333 ?auto_247334 ?auto_247335 ?auto_247336 ?auto_247337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247344 - BLOCK
      ?auto_247345 - BLOCK
      ?auto_247346 - BLOCK
      ?auto_247347 - BLOCK
      ?auto_247348 - BLOCK
    )
    :vars
    (
      ?auto_247349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247348 ?auto_247349 ) ( ON-TABLE ?auto_247344 ) ( ON ?auto_247345 ?auto_247344 ) ( not ( = ?auto_247344 ?auto_247345 ) ) ( not ( = ?auto_247344 ?auto_247346 ) ) ( not ( = ?auto_247344 ?auto_247347 ) ) ( not ( = ?auto_247344 ?auto_247348 ) ) ( not ( = ?auto_247344 ?auto_247349 ) ) ( not ( = ?auto_247345 ?auto_247346 ) ) ( not ( = ?auto_247345 ?auto_247347 ) ) ( not ( = ?auto_247345 ?auto_247348 ) ) ( not ( = ?auto_247345 ?auto_247349 ) ) ( not ( = ?auto_247346 ?auto_247347 ) ) ( not ( = ?auto_247346 ?auto_247348 ) ) ( not ( = ?auto_247346 ?auto_247349 ) ) ( not ( = ?auto_247347 ?auto_247348 ) ) ( not ( = ?auto_247347 ?auto_247349 ) ) ( not ( = ?auto_247348 ?auto_247349 ) ) ( ON ?auto_247347 ?auto_247348 ) ( CLEAR ?auto_247345 ) ( ON ?auto_247346 ?auto_247347 ) ( CLEAR ?auto_247346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247344 ?auto_247345 ?auto_247346 )
      ( MAKE-5PILE ?auto_247344 ?auto_247345 ?auto_247346 ?auto_247347 ?auto_247348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247355 - BLOCK
      ?auto_247356 - BLOCK
      ?auto_247357 - BLOCK
      ?auto_247358 - BLOCK
      ?auto_247359 - BLOCK
    )
    :vars
    (
      ?auto_247360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247359 ?auto_247360 ) ( ON-TABLE ?auto_247355 ) ( not ( = ?auto_247355 ?auto_247356 ) ) ( not ( = ?auto_247355 ?auto_247357 ) ) ( not ( = ?auto_247355 ?auto_247358 ) ) ( not ( = ?auto_247355 ?auto_247359 ) ) ( not ( = ?auto_247355 ?auto_247360 ) ) ( not ( = ?auto_247356 ?auto_247357 ) ) ( not ( = ?auto_247356 ?auto_247358 ) ) ( not ( = ?auto_247356 ?auto_247359 ) ) ( not ( = ?auto_247356 ?auto_247360 ) ) ( not ( = ?auto_247357 ?auto_247358 ) ) ( not ( = ?auto_247357 ?auto_247359 ) ) ( not ( = ?auto_247357 ?auto_247360 ) ) ( not ( = ?auto_247358 ?auto_247359 ) ) ( not ( = ?auto_247358 ?auto_247360 ) ) ( not ( = ?auto_247359 ?auto_247360 ) ) ( ON ?auto_247358 ?auto_247359 ) ( ON ?auto_247357 ?auto_247358 ) ( CLEAR ?auto_247355 ) ( ON ?auto_247356 ?auto_247357 ) ( CLEAR ?auto_247356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247355 ?auto_247356 )
      ( MAKE-5PILE ?auto_247355 ?auto_247356 ?auto_247357 ?auto_247358 ?auto_247359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247366 - BLOCK
      ?auto_247367 - BLOCK
      ?auto_247368 - BLOCK
      ?auto_247369 - BLOCK
      ?auto_247370 - BLOCK
    )
    :vars
    (
      ?auto_247371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247370 ?auto_247371 ) ( ON-TABLE ?auto_247366 ) ( not ( = ?auto_247366 ?auto_247367 ) ) ( not ( = ?auto_247366 ?auto_247368 ) ) ( not ( = ?auto_247366 ?auto_247369 ) ) ( not ( = ?auto_247366 ?auto_247370 ) ) ( not ( = ?auto_247366 ?auto_247371 ) ) ( not ( = ?auto_247367 ?auto_247368 ) ) ( not ( = ?auto_247367 ?auto_247369 ) ) ( not ( = ?auto_247367 ?auto_247370 ) ) ( not ( = ?auto_247367 ?auto_247371 ) ) ( not ( = ?auto_247368 ?auto_247369 ) ) ( not ( = ?auto_247368 ?auto_247370 ) ) ( not ( = ?auto_247368 ?auto_247371 ) ) ( not ( = ?auto_247369 ?auto_247370 ) ) ( not ( = ?auto_247369 ?auto_247371 ) ) ( not ( = ?auto_247370 ?auto_247371 ) ) ( ON ?auto_247369 ?auto_247370 ) ( ON ?auto_247368 ?auto_247369 ) ( CLEAR ?auto_247366 ) ( ON ?auto_247367 ?auto_247368 ) ( CLEAR ?auto_247367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247366 ?auto_247367 )
      ( MAKE-5PILE ?auto_247366 ?auto_247367 ?auto_247368 ?auto_247369 ?auto_247370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247377 - BLOCK
      ?auto_247378 - BLOCK
      ?auto_247379 - BLOCK
      ?auto_247380 - BLOCK
      ?auto_247381 - BLOCK
    )
    :vars
    (
      ?auto_247382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247381 ?auto_247382 ) ( not ( = ?auto_247377 ?auto_247378 ) ) ( not ( = ?auto_247377 ?auto_247379 ) ) ( not ( = ?auto_247377 ?auto_247380 ) ) ( not ( = ?auto_247377 ?auto_247381 ) ) ( not ( = ?auto_247377 ?auto_247382 ) ) ( not ( = ?auto_247378 ?auto_247379 ) ) ( not ( = ?auto_247378 ?auto_247380 ) ) ( not ( = ?auto_247378 ?auto_247381 ) ) ( not ( = ?auto_247378 ?auto_247382 ) ) ( not ( = ?auto_247379 ?auto_247380 ) ) ( not ( = ?auto_247379 ?auto_247381 ) ) ( not ( = ?auto_247379 ?auto_247382 ) ) ( not ( = ?auto_247380 ?auto_247381 ) ) ( not ( = ?auto_247380 ?auto_247382 ) ) ( not ( = ?auto_247381 ?auto_247382 ) ) ( ON ?auto_247380 ?auto_247381 ) ( ON ?auto_247379 ?auto_247380 ) ( ON ?auto_247378 ?auto_247379 ) ( ON ?auto_247377 ?auto_247378 ) ( CLEAR ?auto_247377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247377 )
      ( MAKE-5PILE ?auto_247377 ?auto_247378 ?auto_247379 ?auto_247380 ?auto_247381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_247388 - BLOCK
      ?auto_247389 - BLOCK
      ?auto_247390 - BLOCK
      ?auto_247391 - BLOCK
      ?auto_247392 - BLOCK
    )
    :vars
    (
      ?auto_247393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247392 ?auto_247393 ) ( not ( = ?auto_247388 ?auto_247389 ) ) ( not ( = ?auto_247388 ?auto_247390 ) ) ( not ( = ?auto_247388 ?auto_247391 ) ) ( not ( = ?auto_247388 ?auto_247392 ) ) ( not ( = ?auto_247388 ?auto_247393 ) ) ( not ( = ?auto_247389 ?auto_247390 ) ) ( not ( = ?auto_247389 ?auto_247391 ) ) ( not ( = ?auto_247389 ?auto_247392 ) ) ( not ( = ?auto_247389 ?auto_247393 ) ) ( not ( = ?auto_247390 ?auto_247391 ) ) ( not ( = ?auto_247390 ?auto_247392 ) ) ( not ( = ?auto_247390 ?auto_247393 ) ) ( not ( = ?auto_247391 ?auto_247392 ) ) ( not ( = ?auto_247391 ?auto_247393 ) ) ( not ( = ?auto_247392 ?auto_247393 ) ) ( ON ?auto_247391 ?auto_247392 ) ( ON ?auto_247390 ?auto_247391 ) ( ON ?auto_247389 ?auto_247390 ) ( ON ?auto_247388 ?auto_247389 ) ( CLEAR ?auto_247388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247388 )
      ( MAKE-5PILE ?auto_247388 ?auto_247389 ?auto_247390 ?auto_247391 ?auto_247392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247400 - BLOCK
      ?auto_247401 - BLOCK
      ?auto_247402 - BLOCK
      ?auto_247403 - BLOCK
      ?auto_247404 - BLOCK
      ?auto_247405 - BLOCK
    )
    :vars
    (
      ?auto_247406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247404 ) ( ON ?auto_247405 ?auto_247406 ) ( CLEAR ?auto_247405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247400 ) ( ON ?auto_247401 ?auto_247400 ) ( ON ?auto_247402 ?auto_247401 ) ( ON ?auto_247403 ?auto_247402 ) ( ON ?auto_247404 ?auto_247403 ) ( not ( = ?auto_247400 ?auto_247401 ) ) ( not ( = ?auto_247400 ?auto_247402 ) ) ( not ( = ?auto_247400 ?auto_247403 ) ) ( not ( = ?auto_247400 ?auto_247404 ) ) ( not ( = ?auto_247400 ?auto_247405 ) ) ( not ( = ?auto_247400 ?auto_247406 ) ) ( not ( = ?auto_247401 ?auto_247402 ) ) ( not ( = ?auto_247401 ?auto_247403 ) ) ( not ( = ?auto_247401 ?auto_247404 ) ) ( not ( = ?auto_247401 ?auto_247405 ) ) ( not ( = ?auto_247401 ?auto_247406 ) ) ( not ( = ?auto_247402 ?auto_247403 ) ) ( not ( = ?auto_247402 ?auto_247404 ) ) ( not ( = ?auto_247402 ?auto_247405 ) ) ( not ( = ?auto_247402 ?auto_247406 ) ) ( not ( = ?auto_247403 ?auto_247404 ) ) ( not ( = ?auto_247403 ?auto_247405 ) ) ( not ( = ?auto_247403 ?auto_247406 ) ) ( not ( = ?auto_247404 ?auto_247405 ) ) ( not ( = ?auto_247404 ?auto_247406 ) ) ( not ( = ?auto_247405 ?auto_247406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247405 ?auto_247406 )
      ( !STACK ?auto_247405 ?auto_247404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247413 - BLOCK
      ?auto_247414 - BLOCK
      ?auto_247415 - BLOCK
      ?auto_247416 - BLOCK
      ?auto_247417 - BLOCK
      ?auto_247418 - BLOCK
    )
    :vars
    (
      ?auto_247419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247417 ) ( ON ?auto_247418 ?auto_247419 ) ( CLEAR ?auto_247418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247413 ) ( ON ?auto_247414 ?auto_247413 ) ( ON ?auto_247415 ?auto_247414 ) ( ON ?auto_247416 ?auto_247415 ) ( ON ?auto_247417 ?auto_247416 ) ( not ( = ?auto_247413 ?auto_247414 ) ) ( not ( = ?auto_247413 ?auto_247415 ) ) ( not ( = ?auto_247413 ?auto_247416 ) ) ( not ( = ?auto_247413 ?auto_247417 ) ) ( not ( = ?auto_247413 ?auto_247418 ) ) ( not ( = ?auto_247413 ?auto_247419 ) ) ( not ( = ?auto_247414 ?auto_247415 ) ) ( not ( = ?auto_247414 ?auto_247416 ) ) ( not ( = ?auto_247414 ?auto_247417 ) ) ( not ( = ?auto_247414 ?auto_247418 ) ) ( not ( = ?auto_247414 ?auto_247419 ) ) ( not ( = ?auto_247415 ?auto_247416 ) ) ( not ( = ?auto_247415 ?auto_247417 ) ) ( not ( = ?auto_247415 ?auto_247418 ) ) ( not ( = ?auto_247415 ?auto_247419 ) ) ( not ( = ?auto_247416 ?auto_247417 ) ) ( not ( = ?auto_247416 ?auto_247418 ) ) ( not ( = ?auto_247416 ?auto_247419 ) ) ( not ( = ?auto_247417 ?auto_247418 ) ) ( not ( = ?auto_247417 ?auto_247419 ) ) ( not ( = ?auto_247418 ?auto_247419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247418 ?auto_247419 )
      ( !STACK ?auto_247418 ?auto_247417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247426 - BLOCK
      ?auto_247427 - BLOCK
      ?auto_247428 - BLOCK
      ?auto_247429 - BLOCK
      ?auto_247430 - BLOCK
      ?auto_247431 - BLOCK
    )
    :vars
    (
      ?auto_247432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247431 ?auto_247432 ) ( ON-TABLE ?auto_247426 ) ( ON ?auto_247427 ?auto_247426 ) ( ON ?auto_247428 ?auto_247427 ) ( ON ?auto_247429 ?auto_247428 ) ( not ( = ?auto_247426 ?auto_247427 ) ) ( not ( = ?auto_247426 ?auto_247428 ) ) ( not ( = ?auto_247426 ?auto_247429 ) ) ( not ( = ?auto_247426 ?auto_247430 ) ) ( not ( = ?auto_247426 ?auto_247431 ) ) ( not ( = ?auto_247426 ?auto_247432 ) ) ( not ( = ?auto_247427 ?auto_247428 ) ) ( not ( = ?auto_247427 ?auto_247429 ) ) ( not ( = ?auto_247427 ?auto_247430 ) ) ( not ( = ?auto_247427 ?auto_247431 ) ) ( not ( = ?auto_247427 ?auto_247432 ) ) ( not ( = ?auto_247428 ?auto_247429 ) ) ( not ( = ?auto_247428 ?auto_247430 ) ) ( not ( = ?auto_247428 ?auto_247431 ) ) ( not ( = ?auto_247428 ?auto_247432 ) ) ( not ( = ?auto_247429 ?auto_247430 ) ) ( not ( = ?auto_247429 ?auto_247431 ) ) ( not ( = ?auto_247429 ?auto_247432 ) ) ( not ( = ?auto_247430 ?auto_247431 ) ) ( not ( = ?auto_247430 ?auto_247432 ) ) ( not ( = ?auto_247431 ?auto_247432 ) ) ( CLEAR ?auto_247429 ) ( ON ?auto_247430 ?auto_247431 ) ( CLEAR ?auto_247430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247426 ?auto_247427 ?auto_247428 ?auto_247429 ?auto_247430 )
      ( MAKE-6PILE ?auto_247426 ?auto_247427 ?auto_247428 ?auto_247429 ?auto_247430 ?auto_247431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247439 - BLOCK
      ?auto_247440 - BLOCK
      ?auto_247441 - BLOCK
      ?auto_247442 - BLOCK
      ?auto_247443 - BLOCK
      ?auto_247444 - BLOCK
    )
    :vars
    (
      ?auto_247445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247444 ?auto_247445 ) ( ON-TABLE ?auto_247439 ) ( ON ?auto_247440 ?auto_247439 ) ( ON ?auto_247441 ?auto_247440 ) ( ON ?auto_247442 ?auto_247441 ) ( not ( = ?auto_247439 ?auto_247440 ) ) ( not ( = ?auto_247439 ?auto_247441 ) ) ( not ( = ?auto_247439 ?auto_247442 ) ) ( not ( = ?auto_247439 ?auto_247443 ) ) ( not ( = ?auto_247439 ?auto_247444 ) ) ( not ( = ?auto_247439 ?auto_247445 ) ) ( not ( = ?auto_247440 ?auto_247441 ) ) ( not ( = ?auto_247440 ?auto_247442 ) ) ( not ( = ?auto_247440 ?auto_247443 ) ) ( not ( = ?auto_247440 ?auto_247444 ) ) ( not ( = ?auto_247440 ?auto_247445 ) ) ( not ( = ?auto_247441 ?auto_247442 ) ) ( not ( = ?auto_247441 ?auto_247443 ) ) ( not ( = ?auto_247441 ?auto_247444 ) ) ( not ( = ?auto_247441 ?auto_247445 ) ) ( not ( = ?auto_247442 ?auto_247443 ) ) ( not ( = ?auto_247442 ?auto_247444 ) ) ( not ( = ?auto_247442 ?auto_247445 ) ) ( not ( = ?auto_247443 ?auto_247444 ) ) ( not ( = ?auto_247443 ?auto_247445 ) ) ( not ( = ?auto_247444 ?auto_247445 ) ) ( CLEAR ?auto_247442 ) ( ON ?auto_247443 ?auto_247444 ) ( CLEAR ?auto_247443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247439 ?auto_247440 ?auto_247441 ?auto_247442 ?auto_247443 )
      ( MAKE-6PILE ?auto_247439 ?auto_247440 ?auto_247441 ?auto_247442 ?auto_247443 ?auto_247444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247452 - BLOCK
      ?auto_247453 - BLOCK
      ?auto_247454 - BLOCK
      ?auto_247455 - BLOCK
      ?auto_247456 - BLOCK
      ?auto_247457 - BLOCK
    )
    :vars
    (
      ?auto_247458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247457 ?auto_247458 ) ( ON-TABLE ?auto_247452 ) ( ON ?auto_247453 ?auto_247452 ) ( ON ?auto_247454 ?auto_247453 ) ( not ( = ?auto_247452 ?auto_247453 ) ) ( not ( = ?auto_247452 ?auto_247454 ) ) ( not ( = ?auto_247452 ?auto_247455 ) ) ( not ( = ?auto_247452 ?auto_247456 ) ) ( not ( = ?auto_247452 ?auto_247457 ) ) ( not ( = ?auto_247452 ?auto_247458 ) ) ( not ( = ?auto_247453 ?auto_247454 ) ) ( not ( = ?auto_247453 ?auto_247455 ) ) ( not ( = ?auto_247453 ?auto_247456 ) ) ( not ( = ?auto_247453 ?auto_247457 ) ) ( not ( = ?auto_247453 ?auto_247458 ) ) ( not ( = ?auto_247454 ?auto_247455 ) ) ( not ( = ?auto_247454 ?auto_247456 ) ) ( not ( = ?auto_247454 ?auto_247457 ) ) ( not ( = ?auto_247454 ?auto_247458 ) ) ( not ( = ?auto_247455 ?auto_247456 ) ) ( not ( = ?auto_247455 ?auto_247457 ) ) ( not ( = ?auto_247455 ?auto_247458 ) ) ( not ( = ?auto_247456 ?auto_247457 ) ) ( not ( = ?auto_247456 ?auto_247458 ) ) ( not ( = ?auto_247457 ?auto_247458 ) ) ( ON ?auto_247456 ?auto_247457 ) ( CLEAR ?auto_247454 ) ( ON ?auto_247455 ?auto_247456 ) ( CLEAR ?auto_247455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247452 ?auto_247453 ?auto_247454 ?auto_247455 )
      ( MAKE-6PILE ?auto_247452 ?auto_247453 ?auto_247454 ?auto_247455 ?auto_247456 ?auto_247457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247465 - BLOCK
      ?auto_247466 - BLOCK
      ?auto_247467 - BLOCK
      ?auto_247468 - BLOCK
      ?auto_247469 - BLOCK
      ?auto_247470 - BLOCK
    )
    :vars
    (
      ?auto_247471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247470 ?auto_247471 ) ( ON-TABLE ?auto_247465 ) ( ON ?auto_247466 ?auto_247465 ) ( ON ?auto_247467 ?auto_247466 ) ( not ( = ?auto_247465 ?auto_247466 ) ) ( not ( = ?auto_247465 ?auto_247467 ) ) ( not ( = ?auto_247465 ?auto_247468 ) ) ( not ( = ?auto_247465 ?auto_247469 ) ) ( not ( = ?auto_247465 ?auto_247470 ) ) ( not ( = ?auto_247465 ?auto_247471 ) ) ( not ( = ?auto_247466 ?auto_247467 ) ) ( not ( = ?auto_247466 ?auto_247468 ) ) ( not ( = ?auto_247466 ?auto_247469 ) ) ( not ( = ?auto_247466 ?auto_247470 ) ) ( not ( = ?auto_247466 ?auto_247471 ) ) ( not ( = ?auto_247467 ?auto_247468 ) ) ( not ( = ?auto_247467 ?auto_247469 ) ) ( not ( = ?auto_247467 ?auto_247470 ) ) ( not ( = ?auto_247467 ?auto_247471 ) ) ( not ( = ?auto_247468 ?auto_247469 ) ) ( not ( = ?auto_247468 ?auto_247470 ) ) ( not ( = ?auto_247468 ?auto_247471 ) ) ( not ( = ?auto_247469 ?auto_247470 ) ) ( not ( = ?auto_247469 ?auto_247471 ) ) ( not ( = ?auto_247470 ?auto_247471 ) ) ( ON ?auto_247469 ?auto_247470 ) ( CLEAR ?auto_247467 ) ( ON ?auto_247468 ?auto_247469 ) ( CLEAR ?auto_247468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247465 ?auto_247466 ?auto_247467 ?auto_247468 )
      ( MAKE-6PILE ?auto_247465 ?auto_247466 ?auto_247467 ?auto_247468 ?auto_247469 ?auto_247470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247478 - BLOCK
      ?auto_247479 - BLOCK
      ?auto_247480 - BLOCK
      ?auto_247481 - BLOCK
      ?auto_247482 - BLOCK
      ?auto_247483 - BLOCK
    )
    :vars
    (
      ?auto_247484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247483 ?auto_247484 ) ( ON-TABLE ?auto_247478 ) ( ON ?auto_247479 ?auto_247478 ) ( not ( = ?auto_247478 ?auto_247479 ) ) ( not ( = ?auto_247478 ?auto_247480 ) ) ( not ( = ?auto_247478 ?auto_247481 ) ) ( not ( = ?auto_247478 ?auto_247482 ) ) ( not ( = ?auto_247478 ?auto_247483 ) ) ( not ( = ?auto_247478 ?auto_247484 ) ) ( not ( = ?auto_247479 ?auto_247480 ) ) ( not ( = ?auto_247479 ?auto_247481 ) ) ( not ( = ?auto_247479 ?auto_247482 ) ) ( not ( = ?auto_247479 ?auto_247483 ) ) ( not ( = ?auto_247479 ?auto_247484 ) ) ( not ( = ?auto_247480 ?auto_247481 ) ) ( not ( = ?auto_247480 ?auto_247482 ) ) ( not ( = ?auto_247480 ?auto_247483 ) ) ( not ( = ?auto_247480 ?auto_247484 ) ) ( not ( = ?auto_247481 ?auto_247482 ) ) ( not ( = ?auto_247481 ?auto_247483 ) ) ( not ( = ?auto_247481 ?auto_247484 ) ) ( not ( = ?auto_247482 ?auto_247483 ) ) ( not ( = ?auto_247482 ?auto_247484 ) ) ( not ( = ?auto_247483 ?auto_247484 ) ) ( ON ?auto_247482 ?auto_247483 ) ( ON ?auto_247481 ?auto_247482 ) ( CLEAR ?auto_247479 ) ( ON ?auto_247480 ?auto_247481 ) ( CLEAR ?auto_247480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247478 ?auto_247479 ?auto_247480 )
      ( MAKE-6PILE ?auto_247478 ?auto_247479 ?auto_247480 ?auto_247481 ?auto_247482 ?auto_247483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247491 - BLOCK
      ?auto_247492 - BLOCK
      ?auto_247493 - BLOCK
      ?auto_247494 - BLOCK
      ?auto_247495 - BLOCK
      ?auto_247496 - BLOCK
    )
    :vars
    (
      ?auto_247497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247496 ?auto_247497 ) ( ON-TABLE ?auto_247491 ) ( ON ?auto_247492 ?auto_247491 ) ( not ( = ?auto_247491 ?auto_247492 ) ) ( not ( = ?auto_247491 ?auto_247493 ) ) ( not ( = ?auto_247491 ?auto_247494 ) ) ( not ( = ?auto_247491 ?auto_247495 ) ) ( not ( = ?auto_247491 ?auto_247496 ) ) ( not ( = ?auto_247491 ?auto_247497 ) ) ( not ( = ?auto_247492 ?auto_247493 ) ) ( not ( = ?auto_247492 ?auto_247494 ) ) ( not ( = ?auto_247492 ?auto_247495 ) ) ( not ( = ?auto_247492 ?auto_247496 ) ) ( not ( = ?auto_247492 ?auto_247497 ) ) ( not ( = ?auto_247493 ?auto_247494 ) ) ( not ( = ?auto_247493 ?auto_247495 ) ) ( not ( = ?auto_247493 ?auto_247496 ) ) ( not ( = ?auto_247493 ?auto_247497 ) ) ( not ( = ?auto_247494 ?auto_247495 ) ) ( not ( = ?auto_247494 ?auto_247496 ) ) ( not ( = ?auto_247494 ?auto_247497 ) ) ( not ( = ?auto_247495 ?auto_247496 ) ) ( not ( = ?auto_247495 ?auto_247497 ) ) ( not ( = ?auto_247496 ?auto_247497 ) ) ( ON ?auto_247495 ?auto_247496 ) ( ON ?auto_247494 ?auto_247495 ) ( CLEAR ?auto_247492 ) ( ON ?auto_247493 ?auto_247494 ) ( CLEAR ?auto_247493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247491 ?auto_247492 ?auto_247493 )
      ( MAKE-6PILE ?auto_247491 ?auto_247492 ?auto_247493 ?auto_247494 ?auto_247495 ?auto_247496 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247504 - BLOCK
      ?auto_247505 - BLOCK
      ?auto_247506 - BLOCK
      ?auto_247507 - BLOCK
      ?auto_247508 - BLOCK
      ?auto_247509 - BLOCK
    )
    :vars
    (
      ?auto_247510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247509 ?auto_247510 ) ( ON-TABLE ?auto_247504 ) ( not ( = ?auto_247504 ?auto_247505 ) ) ( not ( = ?auto_247504 ?auto_247506 ) ) ( not ( = ?auto_247504 ?auto_247507 ) ) ( not ( = ?auto_247504 ?auto_247508 ) ) ( not ( = ?auto_247504 ?auto_247509 ) ) ( not ( = ?auto_247504 ?auto_247510 ) ) ( not ( = ?auto_247505 ?auto_247506 ) ) ( not ( = ?auto_247505 ?auto_247507 ) ) ( not ( = ?auto_247505 ?auto_247508 ) ) ( not ( = ?auto_247505 ?auto_247509 ) ) ( not ( = ?auto_247505 ?auto_247510 ) ) ( not ( = ?auto_247506 ?auto_247507 ) ) ( not ( = ?auto_247506 ?auto_247508 ) ) ( not ( = ?auto_247506 ?auto_247509 ) ) ( not ( = ?auto_247506 ?auto_247510 ) ) ( not ( = ?auto_247507 ?auto_247508 ) ) ( not ( = ?auto_247507 ?auto_247509 ) ) ( not ( = ?auto_247507 ?auto_247510 ) ) ( not ( = ?auto_247508 ?auto_247509 ) ) ( not ( = ?auto_247508 ?auto_247510 ) ) ( not ( = ?auto_247509 ?auto_247510 ) ) ( ON ?auto_247508 ?auto_247509 ) ( ON ?auto_247507 ?auto_247508 ) ( ON ?auto_247506 ?auto_247507 ) ( CLEAR ?auto_247504 ) ( ON ?auto_247505 ?auto_247506 ) ( CLEAR ?auto_247505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247504 ?auto_247505 )
      ( MAKE-6PILE ?auto_247504 ?auto_247505 ?auto_247506 ?auto_247507 ?auto_247508 ?auto_247509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247517 - BLOCK
      ?auto_247518 - BLOCK
      ?auto_247519 - BLOCK
      ?auto_247520 - BLOCK
      ?auto_247521 - BLOCK
      ?auto_247522 - BLOCK
    )
    :vars
    (
      ?auto_247523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247522 ?auto_247523 ) ( ON-TABLE ?auto_247517 ) ( not ( = ?auto_247517 ?auto_247518 ) ) ( not ( = ?auto_247517 ?auto_247519 ) ) ( not ( = ?auto_247517 ?auto_247520 ) ) ( not ( = ?auto_247517 ?auto_247521 ) ) ( not ( = ?auto_247517 ?auto_247522 ) ) ( not ( = ?auto_247517 ?auto_247523 ) ) ( not ( = ?auto_247518 ?auto_247519 ) ) ( not ( = ?auto_247518 ?auto_247520 ) ) ( not ( = ?auto_247518 ?auto_247521 ) ) ( not ( = ?auto_247518 ?auto_247522 ) ) ( not ( = ?auto_247518 ?auto_247523 ) ) ( not ( = ?auto_247519 ?auto_247520 ) ) ( not ( = ?auto_247519 ?auto_247521 ) ) ( not ( = ?auto_247519 ?auto_247522 ) ) ( not ( = ?auto_247519 ?auto_247523 ) ) ( not ( = ?auto_247520 ?auto_247521 ) ) ( not ( = ?auto_247520 ?auto_247522 ) ) ( not ( = ?auto_247520 ?auto_247523 ) ) ( not ( = ?auto_247521 ?auto_247522 ) ) ( not ( = ?auto_247521 ?auto_247523 ) ) ( not ( = ?auto_247522 ?auto_247523 ) ) ( ON ?auto_247521 ?auto_247522 ) ( ON ?auto_247520 ?auto_247521 ) ( ON ?auto_247519 ?auto_247520 ) ( CLEAR ?auto_247517 ) ( ON ?auto_247518 ?auto_247519 ) ( CLEAR ?auto_247518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247517 ?auto_247518 )
      ( MAKE-6PILE ?auto_247517 ?auto_247518 ?auto_247519 ?auto_247520 ?auto_247521 ?auto_247522 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247530 - BLOCK
      ?auto_247531 - BLOCK
      ?auto_247532 - BLOCK
      ?auto_247533 - BLOCK
      ?auto_247534 - BLOCK
      ?auto_247535 - BLOCK
    )
    :vars
    (
      ?auto_247536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247535 ?auto_247536 ) ( not ( = ?auto_247530 ?auto_247531 ) ) ( not ( = ?auto_247530 ?auto_247532 ) ) ( not ( = ?auto_247530 ?auto_247533 ) ) ( not ( = ?auto_247530 ?auto_247534 ) ) ( not ( = ?auto_247530 ?auto_247535 ) ) ( not ( = ?auto_247530 ?auto_247536 ) ) ( not ( = ?auto_247531 ?auto_247532 ) ) ( not ( = ?auto_247531 ?auto_247533 ) ) ( not ( = ?auto_247531 ?auto_247534 ) ) ( not ( = ?auto_247531 ?auto_247535 ) ) ( not ( = ?auto_247531 ?auto_247536 ) ) ( not ( = ?auto_247532 ?auto_247533 ) ) ( not ( = ?auto_247532 ?auto_247534 ) ) ( not ( = ?auto_247532 ?auto_247535 ) ) ( not ( = ?auto_247532 ?auto_247536 ) ) ( not ( = ?auto_247533 ?auto_247534 ) ) ( not ( = ?auto_247533 ?auto_247535 ) ) ( not ( = ?auto_247533 ?auto_247536 ) ) ( not ( = ?auto_247534 ?auto_247535 ) ) ( not ( = ?auto_247534 ?auto_247536 ) ) ( not ( = ?auto_247535 ?auto_247536 ) ) ( ON ?auto_247534 ?auto_247535 ) ( ON ?auto_247533 ?auto_247534 ) ( ON ?auto_247532 ?auto_247533 ) ( ON ?auto_247531 ?auto_247532 ) ( ON ?auto_247530 ?auto_247531 ) ( CLEAR ?auto_247530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247530 )
      ( MAKE-6PILE ?auto_247530 ?auto_247531 ?auto_247532 ?auto_247533 ?auto_247534 ?auto_247535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_247543 - BLOCK
      ?auto_247544 - BLOCK
      ?auto_247545 - BLOCK
      ?auto_247546 - BLOCK
      ?auto_247547 - BLOCK
      ?auto_247548 - BLOCK
    )
    :vars
    (
      ?auto_247549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247548 ?auto_247549 ) ( not ( = ?auto_247543 ?auto_247544 ) ) ( not ( = ?auto_247543 ?auto_247545 ) ) ( not ( = ?auto_247543 ?auto_247546 ) ) ( not ( = ?auto_247543 ?auto_247547 ) ) ( not ( = ?auto_247543 ?auto_247548 ) ) ( not ( = ?auto_247543 ?auto_247549 ) ) ( not ( = ?auto_247544 ?auto_247545 ) ) ( not ( = ?auto_247544 ?auto_247546 ) ) ( not ( = ?auto_247544 ?auto_247547 ) ) ( not ( = ?auto_247544 ?auto_247548 ) ) ( not ( = ?auto_247544 ?auto_247549 ) ) ( not ( = ?auto_247545 ?auto_247546 ) ) ( not ( = ?auto_247545 ?auto_247547 ) ) ( not ( = ?auto_247545 ?auto_247548 ) ) ( not ( = ?auto_247545 ?auto_247549 ) ) ( not ( = ?auto_247546 ?auto_247547 ) ) ( not ( = ?auto_247546 ?auto_247548 ) ) ( not ( = ?auto_247546 ?auto_247549 ) ) ( not ( = ?auto_247547 ?auto_247548 ) ) ( not ( = ?auto_247547 ?auto_247549 ) ) ( not ( = ?auto_247548 ?auto_247549 ) ) ( ON ?auto_247547 ?auto_247548 ) ( ON ?auto_247546 ?auto_247547 ) ( ON ?auto_247545 ?auto_247546 ) ( ON ?auto_247544 ?auto_247545 ) ( ON ?auto_247543 ?auto_247544 ) ( CLEAR ?auto_247543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247543 )
      ( MAKE-6PILE ?auto_247543 ?auto_247544 ?auto_247545 ?auto_247546 ?auto_247547 ?auto_247548 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247557 - BLOCK
      ?auto_247558 - BLOCK
      ?auto_247559 - BLOCK
      ?auto_247560 - BLOCK
      ?auto_247561 - BLOCK
      ?auto_247562 - BLOCK
      ?auto_247563 - BLOCK
    )
    :vars
    (
      ?auto_247564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247562 ) ( ON ?auto_247563 ?auto_247564 ) ( CLEAR ?auto_247563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247557 ) ( ON ?auto_247558 ?auto_247557 ) ( ON ?auto_247559 ?auto_247558 ) ( ON ?auto_247560 ?auto_247559 ) ( ON ?auto_247561 ?auto_247560 ) ( ON ?auto_247562 ?auto_247561 ) ( not ( = ?auto_247557 ?auto_247558 ) ) ( not ( = ?auto_247557 ?auto_247559 ) ) ( not ( = ?auto_247557 ?auto_247560 ) ) ( not ( = ?auto_247557 ?auto_247561 ) ) ( not ( = ?auto_247557 ?auto_247562 ) ) ( not ( = ?auto_247557 ?auto_247563 ) ) ( not ( = ?auto_247557 ?auto_247564 ) ) ( not ( = ?auto_247558 ?auto_247559 ) ) ( not ( = ?auto_247558 ?auto_247560 ) ) ( not ( = ?auto_247558 ?auto_247561 ) ) ( not ( = ?auto_247558 ?auto_247562 ) ) ( not ( = ?auto_247558 ?auto_247563 ) ) ( not ( = ?auto_247558 ?auto_247564 ) ) ( not ( = ?auto_247559 ?auto_247560 ) ) ( not ( = ?auto_247559 ?auto_247561 ) ) ( not ( = ?auto_247559 ?auto_247562 ) ) ( not ( = ?auto_247559 ?auto_247563 ) ) ( not ( = ?auto_247559 ?auto_247564 ) ) ( not ( = ?auto_247560 ?auto_247561 ) ) ( not ( = ?auto_247560 ?auto_247562 ) ) ( not ( = ?auto_247560 ?auto_247563 ) ) ( not ( = ?auto_247560 ?auto_247564 ) ) ( not ( = ?auto_247561 ?auto_247562 ) ) ( not ( = ?auto_247561 ?auto_247563 ) ) ( not ( = ?auto_247561 ?auto_247564 ) ) ( not ( = ?auto_247562 ?auto_247563 ) ) ( not ( = ?auto_247562 ?auto_247564 ) ) ( not ( = ?auto_247563 ?auto_247564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247563 ?auto_247564 )
      ( !STACK ?auto_247563 ?auto_247562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247572 - BLOCK
      ?auto_247573 - BLOCK
      ?auto_247574 - BLOCK
      ?auto_247575 - BLOCK
      ?auto_247576 - BLOCK
      ?auto_247577 - BLOCK
      ?auto_247578 - BLOCK
    )
    :vars
    (
      ?auto_247579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247577 ) ( ON ?auto_247578 ?auto_247579 ) ( CLEAR ?auto_247578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247572 ) ( ON ?auto_247573 ?auto_247572 ) ( ON ?auto_247574 ?auto_247573 ) ( ON ?auto_247575 ?auto_247574 ) ( ON ?auto_247576 ?auto_247575 ) ( ON ?auto_247577 ?auto_247576 ) ( not ( = ?auto_247572 ?auto_247573 ) ) ( not ( = ?auto_247572 ?auto_247574 ) ) ( not ( = ?auto_247572 ?auto_247575 ) ) ( not ( = ?auto_247572 ?auto_247576 ) ) ( not ( = ?auto_247572 ?auto_247577 ) ) ( not ( = ?auto_247572 ?auto_247578 ) ) ( not ( = ?auto_247572 ?auto_247579 ) ) ( not ( = ?auto_247573 ?auto_247574 ) ) ( not ( = ?auto_247573 ?auto_247575 ) ) ( not ( = ?auto_247573 ?auto_247576 ) ) ( not ( = ?auto_247573 ?auto_247577 ) ) ( not ( = ?auto_247573 ?auto_247578 ) ) ( not ( = ?auto_247573 ?auto_247579 ) ) ( not ( = ?auto_247574 ?auto_247575 ) ) ( not ( = ?auto_247574 ?auto_247576 ) ) ( not ( = ?auto_247574 ?auto_247577 ) ) ( not ( = ?auto_247574 ?auto_247578 ) ) ( not ( = ?auto_247574 ?auto_247579 ) ) ( not ( = ?auto_247575 ?auto_247576 ) ) ( not ( = ?auto_247575 ?auto_247577 ) ) ( not ( = ?auto_247575 ?auto_247578 ) ) ( not ( = ?auto_247575 ?auto_247579 ) ) ( not ( = ?auto_247576 ?auto_247577 ) ) ( not ( = ?auto_247576 ?auto_247578 ) ) ( not ( = ?auto_247576 ?auto_247579 ) ) ( not ( = ?auto_247577 ?auto_247578 ) ) ( not ( = ?auto_247577 ?auto_247579 ) ) ( not ( = ?auto_247578 ?auto_247579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247578 ?auto_247579 )
      ( !STACK ?auto_247578 ?auto_247577 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247587 - BLOCK
      ?auto_247588 - BLOCK
      ?auto_247589 - BLOCK
      ?auto_247590 - BLOCK
      ?auto_247591 - BLOCK
      ?auto_247592 - BLOCK
      ?auto_247593 - BLOCK
    )
    :vars
    (
      ?auto_247594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247593 ?auto_247594 ) ( ON-TABLE ?auto_247587 ) ( ON ?auto_247588 ?auto_247587 ) ( ON ?auto_247589 ?auto_247588 ) ( ON ?auto_247590 ?auto_247589 ) ( ON ?auto_247591 ?auto_247590 ) ( not ( = ?auto_247587 ?auto_247588 ) ) ( not ( = ?auto_247587 ?auto_247589 ) ) ( not ( = ?auto_247587 ?auto_247590 ) ) ( not ( = ?auto_247587 ?auto_247591 ) ) ( not ( = ?auto_247587 ?auto_247592 ) ) ( not ( = ?auto_247587 ?auto_247593 ) ) ( not ( = ?auto_247587 ?auto_247594 ) ) ( not ( = ?auto_247588 ?auto_247589 ) ) ( not ( = ?auto_247588 ?auto_247590 ) ) ( not ( = ?auto_247588 ?auto_247591 ) ) ( not ( = ?auto_247588 ?auto_247592 ) ) ( not ( = ?auto_247588 ?auto_247593 ) ) ( not ( = ?auto_247588 ?auto_247594 ) ) ( not ( = ?auto_247589 ?auto_247590 ) ) ( not ( = ?auto_247589 ?auto_247591 ) ) ( not ( = ?auto_247589 ?auto_247592 ) ) ( not ( = ?auto_247589 ?auto_247593 ) ) ( not ( = ?auto_247589 ?auto_247594 ) ) ( not ( = ?auto_247590 ?auto_247591 ) ) ( not ( = ?auto_247590 ?auto_247592 ) ) ( not ( = ?auto_247590 ?auto_247593 ) ) ( not ( = ?auto_247590 ?auto_247594 ) ) ( not ( = ?auto_247591 ?auto_247592 ) ) ( not ( = ?auto_247591 ?auto_247593 ) ) ( not ( = ?auto_247591 ?auto_247594 ) ) ( not ( = ?auto_247592 ?auto_247593 ) ) ( not ( = ?auto_247592 ?auto_247594 ) ) ( not ( = ?auto_247593 ?auto_247594 ) ) ( CLEAR ?auto_247591 ) ( ON ?auto_247592 ?auto_247593 ) ( CLEAR ?auto_247592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247587 ?auto_247588 ?auto_247589 ?auto_247590 ?auto_247591 ?auto_247592 )
      ( MAKE-7PILE ?auto_247587 ?auto_247588 ?auto_247589 ?auto_247590 ?auto_247591 ?auto_247592 ?auto_247593 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247602 - BLOCK
      ?auto_247603 - BLOCK
      ?auto_247604 - BLOCK
      ?auto_247605 - BLOCK
      ?auto_247606 - BLOCK
      ?auto_247607 - BLOCK
      ?auto_247608 - BLOCK
    )
    :vars
    (
      ?auto_247609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247608 ?auto_247609 ) ( ON-TABLE ?auto_247602 ) ( ON ?auto_247603 ?auto_247602 ) ( ON ?auto_247604 ?auto_247603 ) ( ON ?auto_247605 ?auto_247604 ) ( ON ?auto_247606 ?auto_247605 ) ( not ( = ?auto_247602 ?auto_247603 ) ) ( not ( = ?auto_247602 ?auto_247604 ) ) ( not ( = ?auto_247602 ?auto_247605 ) ) ( not ( = ?auto_247602 ?auto_247606 ) ) ( not ( = ?auto_247602 ?auto_247607 ) ) ( not ( = ?auto_247602 ?auto_247608 ) ) ( not ( = ?auto_247602 ?auto_247609 ) ) ( not ( = ?auto_247603 ?auto_247604 ) ) ( not ( = ?auto_247603 ?auto_247605 ) ) ( not ( = ?auto_247603 ?auto_247606 ) ) ( not ( = ?auto_247603 ?auto_247607 ) ) ( not ( = ?auto_247603 ?auto_247608 ) ) ( not ( = ?auto_247603 ?auto_247609 ) ) ( not ( = ?auto_247604 ?auto_247605 ) ) ( not ( = ?auto_247604 ?auto_247606 ) ) ( not ( = ?auto_247604 ?auto_247607 ) ) ( not ( = ?auto_247604 ?auto_247608 ) ) ( not ( = ?auto_247604 ?auto_247609 ) ) ( not ( = ?auto_247605 ?auto_247606 ) ) ( not ( = ?auto_247605 ?auto_247607 ) ) ( not ( = ?auto_247605 ?auto_247608 ) ) ( not ( = ?auto_247605 ?auto_247609 ) ) ( not ( = ?auto_247606 ?auto_247607 ) ) ( not ( = ?auto_247606 ?auto_247608 ) ) ( not ( = ?auto_247606 ?auto_247609 ) ) ( not ( = ?auto_247607 ?auto_247608 ) ) ( not ( = ?auto_247607 ?auto_247609 ) ) ( not ( = ?auto_247608 ?auto_247609 ) ) ( CLEAR ?auto_247606 ) ( ON ?auto_247607 ?auto_247608 ) ( CLEAR ?auto_247607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247602 ?auto_247603 ?auto_247604 ?auto_247605 ?auto_247606 ?auto_247607 )
      ( MAKE-7PILE ?auto_247602 ?auto_247603 ?auto_247604 ?auto_247605 ?auto_247606 ?auto_247607 ?auto_247608 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247617 - BLOCK
      ?auto_247618 - BLOCK
      ?auto_247619 - BLOCK
      ?auto_247620 - BLOCK
      ?auto_247621 - BLOCK
      ?auto_247622 - BLOCK
      ?auto_247623 - BLOCK
    )
    :vars
    (
      ?auto_247624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247623 ?auto_247624 ) ( ON-TABLE ?auto_247617 ) ( ON ?auto_247618 ?auto_247617 ) ( ON ?auto_247619 ?auto_247618 ) ( ON ?auto_247620 ?auto_247619 ) ( not ( = ?auto_247617 ?auto_247618 ) ) ( not ( = ?auto_247617 ?auto_247619 ) ) ( not ( = ?auto_247617 ?auto_247620 ) ) ( not ( = ?auto_247617 ?auto_247621 ) ) ( not ( = ?auto_247617 ?auto_247622 ) ) ( not ( = ?auto_247617 ?auto_247623 ) ) ( not ( = ?auto_247617 ?auto_247624 ) ) ( not ( = ?auto_247618 ?auto_247619 ) ) ( not ( = ?auto_247618 ?auto_247620 ) ) ( not ( = ?auto_247618 ?auto_247621 ) ) ( not ( = ?auto_247618 ?auto_247622 ) ) ( not ( = ?auto_247618 ?auto_247623 ) ) ( not ( = ?auto_247618 ?auto_247624 ) ) ( not ( = ?auto_247619 ?auto_247620 ) ) ( not ( = ?auto_247619 ?auto_247621 ) ) ( not ( = ?auto_247619 ?auto_247622 ) ) ( not ( = ?auto_247619 ?auto_247623 ) ) ( not ( = ?auto_247619 ?auto_247624 ) ) ( not ( = ?auto_247620 ?auto_247621 ) ) ( not ( = ?auto_247620 ?auto_247622 ) ) ( not ( = ?auto_247620 ?auto_247623 ) ) ( not ( = ?auto_247620 ?auto_247624 ) ) ( not ( = ?auto_247621 ?auto_247622 ) ) ( not ( = ?auto_247621 ?auto_247623 ) ) ( not ( = ?auto_247621 ?auto_247624 ) ) ( not ( = ?auto_247622 ?auto_247623 ) ) ( not ( = ?auto_247622 ?auto_247624 ) ) ( not ( = ?auto_247623 ?auto_247624 ) ) ( ON ?auto_247622 ?auto_247623 ) ( CLEAR ?auto_247620 ) ( ON ?auto_247621 ?auto_247622 ) ( CLEAR ?auto_247621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247617 ?auto_247618 ?auto_247619 ?auto_247620 ?auto_247621 )
      ( MAKE-7PILE ?auto_247617 ?auto_247618 ?auto_247619 ?auto_247620 ?auto_247621 ?auto_247622 ?auto_247623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247632 - BLOCK
      ?auto_247633 - BLOCK
      ?auto_247634 - BLOCK
      ?auto_247635 - BLOCK
      ?auto_247636 - BLOCK
      ?auto_247637 - BLOCK
      ?auto_247638 - BLOCK
    )
    :vars
    (
      ?auto_247639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247638 ?auto_247639 ) ( ON-TABLE ?auto_247632 ) ( ON ?auto_247633 ?auto_247632 ) ( ON ?auto_247634 ?auto_247633 ) ( ON ?auto_247635 ?auto_247634 ) ( not ( = ?auto_247632 ?auto_247633 ) ) ( not ( = ?auto_247632 ?auto_247634 ) ) ( not ( = ?auto_247632 ?auto_247635 ) ) ( not ( = ?auto_247632 ?auto_247636 ) ) ( not ( = ?auto_247632 ?auto_247637 ) ) ( not ( = ?auto_247632 ?auto_247638 ) ) ( not ( = ?auto_247632 ?auto_247639 ) ) ( not ( = ?auto_247633 ?auto_247634 ) ) ( not ( = ?auto_247633 ?auto_247635 ) ) ( not ( = ?auto_247633 ?auto_247636 ) ) ( not ( = ?auto_247633 ?auto_247637 ) ) ( not ( = ?auto_247633 ?auto_247638 ) ) ( not ( = ?auto_247633 ?auto_247639 ) ) ( not ( = ?auto_247634 ?auto_247635 ) ) ( not ( = ?auto_247634 ?auto_247636 ) ) ( not ( = ?auto_247634 ?auto_247637 ) ) ( not ( = ?auto_247634 ?auto_247638 ) ) ( not ( = ?auto_247634 ?auto_247639 ) ) ( not ( = ?auto_247635 ?auto_247636 ) ) ( not ( = ?auto_247635 ?auto_247637 ) ) ( not ( = ?auto_247635 ?auto_247638 ) ) ( not ( = ?auto_247635 ?auto_247639 ) ) ( not ( = ?auto_247636 ?auto_247637 ) ) ( not ( = ?auto_247636 ?auto_247638 ) ) ( not ( = ?auto_247636 ?auto_247639 ) ) ( not ( = ?auto_247637 ?auto_247638 ) ) ( not ( = ?auto_247637 ?auto_247639 ) ) ( not ( = ?auto_247638 ?auto_247639 ) ) ( ON ?auto_247637 ?auto_247638 ) ( CLEAR ?auto_247635 ) ( ON ?auto_247636 ?auto_247637 ) ( CLEAR ?auto_247636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247632 ?auto_247633 ?auto_247634 ?auto_247635 ?auto_247636 )
      ( MAKE-7PILE ?auto_247632 ?auto_247633 ?auto_247634 ?auto_247635 ?auto_247636 ?auto_247637 ?auto_247638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247647 - BLOCK
      ?auto_247648 - BLOCK
      ?auto_247649 - BLOCK
      ?auto_247650 - BLOCK
      ?auto_247651 - BLOCK
      ?auto_247652 - BLOCK
      ?auto_247653 - BLOCK
    )
    :vars
    (
      ?auto_247654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247653 ?auto_247654 ) ( ON-TABLE ?auto_247647 ) ( ON ?auto_247648 ?auto_247647 ) ( ON ?auto_247649 ?auto_247648 ) ( not ( = ?auto_247647 ?auto_247648 ) ) ( not ( = ?auto_247647 ?auto_247649 ) ) ( not ( = ?auto_247647 ?auto_247650 ) ) ( not ( = ?auto_247647 ?auto_247651 ) ) ( not ( = ?auto_247647 ?auto_247652 ) ) ( not ( = ?auto_247647 ?auto_247653 ) ) ( not ( = ?auto_247647 ?auto_247654 ) ) ( not ( = ?auto_247648 ?auto_247649 ) ) ( not ( = ?auto_247648 ?auto_247650 ) ) ( not ( = ?auto_247648 ?auto_247651 ) ) ( not ( = ?auto_247648 ?auto_247652 ) ) ( not ( = ?auto_247648 ?auto_247653 ) ) ( not ( = ?auto_247648 ?auto_247654 ) ) ( not ( = ?auto_247649 ?auto_247650 ) ) ( not ( = ?auto_247649 ?auto_247651 ) ) ( not ( = ?auto_247649 ?auto_247652 ) ) ( not ( = ?auto_247649 ?auto_247653 ) ) ( not ( = ?auto_247649 ?auto_247654 ) ) ( not ( = ?auto_247650 ?auto_247651 ) ) ( not ( = ?auto_247650 ?auto_247652 ) ) ( not ( = ?auto_247650 ?auto_247653 ) ) ( not ( = ?auto_247650 ?auto_247654 ) ) ( not ( = ?auto_247651 ?auto_247652 ) ) ( not ( = ?auto_247651 ?auto_247653 ) ) ( not ( = ?auto_247651 ?auto_247654 ) ) ( not ( = ?auto_247652 ?auto_247653 ) ) ( not ( = ?auto_247652 ?auto_247654 ) ) ( not ( = ?auto_247653 ?auto_247654 ) ) ( ON ?auto_247652 ?auto_247653 ) ( ON ?auto_247651 ?auto_247652 ) ( CLEAR ?auto_247649 ) ( ON ?auto_247650 ?auto_247651 ) ( CLEAR ?auto_247650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247647 ?auto_247648 ?auto_247649 ?auto_247650 )
      ( MAKE-7PILE ?auto_247647 ?auto_247648 ?auto_247649 ?auto_247650 ?auto_247651 ?auto_247652 ?auto_247653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247662 - BLOCK
      ?auto_247663 - BLOCK
      ?auto_247664 - BLOCK
      ?auto_247665 - BLOCK
      ?auto_247666 - BLOCK
      ?auto_247667 - BLOCK
      ?auto_247668 - BLOCK
    )
    :vars
    (
      ?auto_247669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247668 ?auto_247669 ) ( ON-TABLE ?auto_247662 ) ( ON ?auto_247663 ?auto_247662 ) ( ON ?auto_247664 ?auto_247663 ) ( not ( = ?auto_247662 ?auto_247663 ) ) ( not ( = ?auto_247662 ?auto_247664 ) ) ( not ( = ?auto_247662 ?auto_247665 ) ) ( not ( = ?auto_247662 ?auto_247666 ) ) ( not ( = ?auto_247662 ?auto_247667 ) ) ( not ( = ?auto_247662 ?auto_247668 ) ) ( not ( = ?auto_247662 ?auto_247669 ) ) ( not ( = ?auto_247663 ?auto_247664 ) ) ( not ( = ?auto_247663 ?auto_247665 ) ) ( not ( = ?auto_247663 ?auto_247666 ) ) ( not ( = ?auto_247663 ?auto_247667 ) ) ( not ( = ?auto_247663 ?auto_247668 ) ) ( not ( = ?auto_247663 ?auto_247669 ) ) ( not ( = ?auto_247664 ?auto_247665 ) ) ( not ( = ?auto_247664 ?auto_247666 ) ) ( not ( = ?auto_247664 ?auto_247667 ) ) ( not ( = ?auto_247664 ?auto_247668 ) ) ( not ( = ?auto_247664 ?auto_247669 ) ) ( not ( = ?auto_247665 ?auto_247666 ) ) ( not ( = ?auto_247665 ?auto_247667 ) ) ( not ( = ?auto_247665 ?auto_247668 ) ) ( not ( = ?auto_247665 ?auto_247669 ) ) ( not ( = ?auto_247666 ?auto_247667 ) ) ( not ( = ?auto_247666 ?auto_247668 ) ) ( not ( = ?auto_247666 ?auto_247669 ) ) ( not ( = ?auto_247667 ?auto_247668 ) ) ( not ( = ?auto_247667 ?auto_247669 ) ) ( not ( = ?auto_247668 ?auto_247669 ) ) ( ON ?auto_247667 ?auto_247668 ) ( ON ?auto_247666 ?auto_247667 ) ( CLEAR ?auto_247664 ) ( ON ?auto_247665 ?auto_247666 ) ( CLEAR ?auto_247665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247662 ?auto_247663 ?auto_247664 ?auto_247665 )
      ( MAKE-7PILE ?auto_247662 ?auto_247663 ?auto_247664 ?auto_247665 ?auto_247666 ?auto_247667 ?auto_247668 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247677 - BLOCK
      ?auto_247678 - BLOCK
      ?auto_247679 - BLOCK
      ?auto_247680 - BLOCK
      ?auto_247681 - BLOCK
      ?auto_247682 - BLOCK
      ?auto_247683 - BLOCK
    )
    :vars
    (
      ?auto_247684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247683 ?auto_247684 ) ( ON-TABLE ?auto_247677 ) ( ON ?auto_247678 ?auto_247677 ) ( not ( = ?auto_247677 ?auto_247678 ) ) ( not ( = ?auto_247677 ?auto_247679 ) ) ( not ( = ?auto_247677 ?auto_247680 ) ) ( not ( = ?auto_247677 ?auto_247681 ) ) ( not ( = ?auto_247677 ?auto_247682 ) ) ( not ( = ?auto_247677 ?auto_247683 ) ) ( not ( = ?auto_247677 ?auto_247684 ) ) ( not ( = ?auto_247678 ?auto_247679 ) ) ( not ( = ?auto_247678 ?auto_247680 ) ) ( not ( = ?auto_247678 ?auto_247681 ) ) ( not ( = ?auto_247678 ?auto_247682 ) ) ( not ( = ?auto_247678 ?auto_247683 ) ) ( not ( = ?auto_247678 ?auto_247684 ) ) ( not ( = ?auto_247679 ?auto_247680 ) ) ( not ( = ?auto_247679 ?auto_247681 ) ) ( not ( = ?auto_247679 ?auto_247682 ) ) ( not ( = ?auto_247679 ?auto_247683 ) ) ( not ( = ?auto_247679 ?auto_247684 ) ) ( not ( = ?auto_247680 ?auto_247681 ) ) ( not ( = ?auto_247680 ?auto_247682 ) ) ( not ( = ?auto_247680 ?auto_247683 ) ) ( not ( = ?auto_247680 ?auto_247684 ) ) ( not ( = ?auto_247681 ?auto_247682 ) ) ( not ( = ?auto_247681 ?auto_247683 ) ) ( not ( = ?auto_247681 ?auto_247684 ) ) ( not ( = ?auto_247682 ?auto_247683 ) ) ( not ( = ?auto_247682 ?auto_247684 ) ) ( not ( = ?auto_247683 ?auto_247684 ) ) ( ON ?auto_247682 ?auto_247683 ) ( ON ?auto_247681 ?auto_247682 ) ( ON ?auto_247680 ?auto_247681 ) ( CLEAR ?auto_247678 ) ( ON ?auto_247679 ?auto_247680 ) ( CLEAR ?auto_247679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247677 ?auto_247678 ?auto_247679 )
      ( MAKE-7PILE ?auto_247677 ?auto_247678 ?auto_247679 ?auto_247680 ?auto_247681 ?auto_247682 ?auto_247683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247692 - BLOCK
      ?auto_247693 - BLOCK
      ?auto_247694 - BLOCK
      ?auto_247695 - BLOCK
      ?auto_247696 - BLOCK
      ?auto_247697 - BLOCK
      ?auto_247698 - BLOCK
    )
    :vars
    (
      ?auto_247699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247698 ?auto_247699 ) ( ON-TABLE ?auto_247692 ) ( ON ?auto_247693 ?auto_247692 ) ( not ( = ?auto_247692 ?auto_247693 ) ) ( not ( = ?auto_247692 ?auto_247694 ) ) ( not ( = ?auto_247692 ?auto_247695 ) ) ( not ( = ?auto_247692 ?auto_247696 ) ) ( not ( = ?auto_247692 ?auto_247697 ) ) ( not ( = ?auto_247692 ?auto_247698 ) ) ( not ( = ?auto_247692 ?auto_247699 ) ) ( not ( = ?auto_247693 ?auto_247694 ) ) ( not ( = ?auto_247693 ?auto_247695 ) ) ( not ( = ?auto_247693 ?auto_247696 ) ) ( not ( = ?auto_247693 ?auto_247697 ) ) ( not ( = ?auto_247693 ?auto_247698 ) ) ( not ( = ?auto_247693 ?auto_247699 ) ) ( not ( = ?auto_247694 ?auto_247695 ) ) ( not ( = ?auto_247694 ?auto_247696 ) ) ( not ( = ?auto_247694 ?auto_247697 ) ) ( not ( = ?auto_247694 ?auto_247698 ) ) ( not ( = ?auto_247694 ?auto_247699 ) ) ( not ( = ?auto_247695 ?auto_247696 ) ) ( not ( = ?auto_247695 ?auto_247697 ) ) ( not ( = ?auto_247695 ?auto_247698 ) ) ( not ( = ?auto_247695 ?auto_247699 ) ) ( not ( = ?auto_247696 ?auto_247697 ) ) ( not ( = ?auto_247696 ?auto_247698 ) ) ( not ( = ?auto_247696 ?auto_247699 ) ) ( not ( = ?auto_247697 ?auto_247698 ) ) ( not ( = ?auto_247697 ?auto_247699 ) ) ( not ( = ?auto_247698 ?auto_247699 ) ) ( ON ?auto_247697 ?auto_247698 ) ( ON ?auto_247696 ?auto_247697 ) ( ON ?auto_247695 ?auto_247696 ) ( CLEAR ?auto_247693 ) ( ON ?auto_247694 ?auto_247695 ) ( CLEAR ?auto_247694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247692 ?auto_247693 ?auto_247694 )
      ( MAKE-7PILE ?auto_247692 ?auto_247693 ?auto_247694 ?auto_247695 ?auto_247696 ?auto_247697 ?auto_247698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247707 - BLOCK
      ?auto_247708 - BLOCK
      ?auto_247709 - BLOCK
      ?auto_247710 - BLOCK
      ?auto_247711 - BLOCK
      ?auto_247712 - BLOCK
      ?auto_247713 - BLOCK
    )
    :vars
    (
      ?auto_247714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247713 ?auto_247714 ) ( ON-TABLE ?auto_247707 ) ( not ( = ?auto_247707 ?auto_247708 ) ) ( not ( = ?auto_247707 ?auto_247709 ) ) ( not ( = ?auto_247707 ?auto_247710 ) ) ( not ( = ?auto_247707 ?auto_247711 ) ) ( not ( = ?auto_247707 ?auto_247712 ) ) ( not ( = ?auto_247707 ?auto_247713 ) ) ( not ( = ?auto_247707 ?auto_247714 ) ) ( not ( = ?auto_247708 ?auto_247709 ) ) ( not ( = ?auto_247708 ?auto_247710 ) ) ( not ( = ?auto_247708 ?auto_247711 ) ) ( not ( = ?auto_247708 ?auto_247712 ) ) ( not ( = ?auto_247708 ?auto_247713 ) ) ( not ( = ?auto_247708 ?auto_247714 ) ) ( not ( = ?auto_247709 ?auto_247710 ) ) ( not ( = ?auto_247709 ?auto_247711 ) ) ( not ( = ?auto_247709 ?auto_247712 ) ) ( not ( = ?auto_247709 ?auto_247713 ) ) ( not ( = ?auto_247709 ?auto_247714 ) ) ( not ( = ?auto_247710 ?auto_247711 ) ) ( not ( = ?auto_247710 ?auto_247712 ) ) ( not ( = ?auto_247710 ?auto_247713 ) ) ( not ( = ?auto_247710 ?auto_247714 ) ) ( not ( = ?auto_247711 ?auto_247712 ) ) ( not ( = ?auto_247711 ?auto_247713 ) ) ( not ( = ?auto_247711 ?auto_247714 ) ) ( not ( = ?auto_247712 ?auto_247713 ) ) ( not ( = ?auto_247712 ?auto_247714 ) ) ( not ( = ?auto_247713 ?auto_247714 ) ) ( ON ?auto_247712 ?auto_247713 ) ( ON ?auto_247711 ?auto_247712 ) ( ON ?auto_247710 ?auto_247711 ) ( ON ?auto_247709 ?auto_247710 ) ( CLEAR ?auto_247707 ) ( ON ?auto_247708 ?auto_247709 ) ( CLEAR ?auto_247708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247707 ?auto_247708 )
      ( MAKE-7PILE ?auto_247707 ?auto_247708 ?auto_247709 ?auto_247710 ?auto_247711 ?auto_247712 ?auto_247713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247722 - BLOCK
      ?auto_247723 - BLOCK
      ?auto_247724 - BLOCK
      ?auto_247725 - BLOCK
      ?auto_247726 - BLOCK
      ?auto_247727 - BLOCK
      ?auto_247728 - BLOCK
    )
    :vars
    (
      ?auto_247729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247728 ?auto_247729 ) ( ON-TABLE ?auto_247722 ) ( not ( = ?auto_247722 ?auto_247723 ) ) ( not ( = ?auto_247722 ?auto_247724 ) ) ( not ( = ?auto_247722 ?auto_247725 ) ) ( not ( = ?auto_247722 ?auto_247726 ) ) ( not ( = ?auto_247722 ?auto_247727 ) ) ( not ( = ?auto_247722 ?auto_247728 ) ) ( not ( = ?auto_247722 ?auto_247729 ) ) ( not ( = ?auto_247723 ?auto_247724 ) ) ( not ( = ?auto_247723 ?auto_247725 ) ) ( not ( = ?auto_247723 ?auto_247726 ) ) ( not ( = ?auto_247723 ?auto_247727 ) ) ( not ( = ?auto_247723 ?auto_247728 ) ) ( not ( = ?auto_247723 ?auto_247729 ) ) ( not ( = ?auto_247724 ?auto_247725 ) ) ( not ( = ?auto_247724 ?auto_247726 ) ) ( not ( = ?auto_247724 ?auto_247727 ) ) ( not ( = ?auto_247724 ?auto_247728 ) ) ( not ( = ?auto_247724 ?auto_247729 ) ) ( not ( = ?auto_247725 ?auto_247726 ) ) ( not ( = ?auto_247725 ?auto_247727 ) ) ( not ( = ?auto_247725 ?auto_247728 ) ) ( not ( = ?auto_247725 ?auto_247729 ) ) ( not ( = ?auto_247726 ?auto_247727 ) ) ( not ( = ?auto_247726 ?auto_247728 ) ) ( not ( = ?auto_247726 ?auto_247729 ) ) ( not ( = ?auto_247727 ?auto_247728 ) ) ( not ( = ?auto_247727 ?auto_247729 ) ) ( not ( = ?auto_247728 ?auto_247729 ) ) ( ON ?auto_247727 ?auto_247728 ) ( ON ?auto_247726 ?auto_247727 ) ( ON ?auto_247725 ?auto_247726 ) ( ON ?auto_247724 ?auto_247725 ) ( CLEAR ?auto_247722 ) ( ON ?auto_247723 ?auto_247724 ) ( CLEAR ?auto_247723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247722 ?auto_247723 )
      ( MAKE-7PILE ?auto_247722 ?auto_247723 ?auto_247724 ?auto_247725 ?auto_247726 ?auto_247727 ?auto_247728 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247737 - BLOCK
      ?auto_247738 - BLOCK
      ?auto_247739 - BLOCK
      ?auto_247740 - BLOCK
      ?auto_247741 - BLOCK
      ?auto_247742 - BLOCK
      ?auto_247743 - BLOCK
    )
    :vars
    (
      ?auto_247744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247743 ?auto_247744 ) ( not ( = ?auto_247737 ?auto_247738 ) ) ( not ( = ?auto_247737 ?auto_247739 ) ) ( not ( = ?auto_247737 ?auto_247740 ) ) ( not ( = ?auto_247737 ?auto_247741 ) ) ( not ( = ?auto_247737 ?auto_247742 ) ) ( not ( = ?auto_247737 ?auto_247743 ) ) ( not ( = ?auto_247737 ?auto_247744 ) ) ( not ( = ?auto_247738 ?auto_247739 ) ) ( not ( = ?auto_247738 ?auto_247740 ) ) ( not ( = ?auto_247738 ?auto_247741 ) ) ( not ( = ?auto_247738 ?auto_247742 ) ) ( not ( = ?auto_247738 ?auto_247743 ) ) ( not ( = ?auto_247738 ?auto_247744 ) ) ( not ( = ?auto_247739 ?auto_247740 ) ) ( not ( = ?auto_247739 ?auto_247741 ) ) ( not ( = ?auto_247739 ?auto_247742 ) ) ( not ( = ?auto_247739 ?auto_247743 ) ) ( not ( = ?auto_247739 ?auto_247744 ) ) ( not ( = ?auto_247740 ?auto_247741 ) ) ( not ( = ?auto_247740 ?auto_247742 ) ) ( not ( = ?auto_247740 ?auto_247743 ) ) ( not ( = ?auto_247740 ?auto_247744 ) ) ( not ( = ?auto_247741 ?auto_247742 ) ) ( not ( = ?auto_247741 ?auto_247743 ) ) ( not ( = ?auto_247741 ?auto_247744 ) ) ( not ( = ?auto_247742 ?auto_247743 ) ) ( not ( = ?auto_247742 ?auto_247744 ) ) ( not ( = ?auto_247743 ?auto_247744 ) ) ( ON ?auto_247742 ?auto_247743 ) ( ON ?auto_247741 ?auto_247742 ) ( ON ?auto_247740 ?auto_247741 ) ( ON ?auto_247739 ?auto_247740 ) ( ON ?auto_247738 ?auto_247739 ) ( ON ?auto_247737 ?auto_247738 ) ( CLEAR ?auto_247737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247737 )
      ( MAKE-7PILE ?auto_247737 ?auto_247738 ?auto_247739 ?auto_247740 ?auto_247741 ?auto_247742 ?auto_247743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_247752 - BLOCK
      ?auto_247753 - BLOCK
      ?auto_247754 - BLOCK
      ?auto_247755 - BLOCK
      ?auto_247756 - BLOCK
      ?auto_247757 - BLOCK
      ?auto_247758 - BLOCK
    )
    :vars
    (
      ?auto_247759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247758 ?auto_247759 ) ( not ( = ?auto_247752 ?auto_247753 ) ) ( not ( = ?auto_247752 ?auto_247754 ) ) ( not ( = ?auto_247752 ?auto_247755 ) ) ( not ( = ?auto_247752 ?auto_247756 ) ) ( not ( = ?auto_247752 ?auto_247757 ) ) ( not ( = ?auto_247752 ?auto_247758 ) ) ( not ( = ?auto_247752 ?auto_247759 ) ) ( not ( = ?auto_247753 ?auto_247754 ) ) ( not ( = ?auto_247753 ?auto_247755 ) ) ( not ( = ?auto_247753 ?auto_247756 ) ) ( not ( = ?auto_247753 ?auto_247757 ) ) ( not ( = ?auto_247753 ?auto_247758 ) ) ( not ( = ?auto_247753 ?auto_247759 ) ) ( not ( = ?auto_247754 ?auto_247755 ) ) ( not ( = ?auto_247754 ?auto_247756 ) ) ( not ( = ?auto_247754 ?auto_247757 ) ) ( not ( = ?auto_247754 ?auto_247758 ) ) ( not ( = ?auto_247754 ?auto_247759 ) ) ( not ( = ?auto_247755 ?auto_247756 ) ) ( not ( = ?auto_247755 ?auto_247757 ) ) ( not ( = ?auto_247755 ?auto_247758 ) ) ( not ( = ?auto_247755 ?auto_247759 ) ) ( not ( = ?auto_247756 ?auto_247757 ) ) ( not ( = ?auto_247756 ?auto_247758 ) ) ( not ( = ?auto_247756 ?auto_247759 ) ) ( not ( = ?auto_247757 ?auto_247758 ) ) ( not ( = ?auto_247757 ?auto_247759 ) ) ( not ( = ?auto_247758 ?auto_247759 ) ) ( ON ?auto_247757 ?auto_247758 ) ( ON ?auto_247756 ?auto_247757 ) ( ON ?auto_247755 ?auto_247756 ) ( ON ?auto_247754 ?auto_247755 ) ( ON ?auto_247753 ?auto_247754 ) ( ON ?auto_247752 ?auto_247753 ) ( CLEAR ?auto_247752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247752 )
      ( MAKE-7PILE ?auto_247752 ?auto_247753 ?auto_247754 ?auto_247755 ?auto_247756 ?auto_247757 ?auto_247758 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247768 - BLOCK
      ?auto_247769 - BLOCK
      ?auto_247770 - BLOCK
      ?auto_247771 - BLOCK
      ?auto_247772 - BLOCK
      ?auto_247773 - BLOCK
      ?auto_247774 - BLOCK
      ?auto_247775 - BLOCK
    )
    :vars
    (
      ?auto_247776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247774 ) ( ON ?auto_247775 ?auto_247776 ) ( CLEAR ?auto_247775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247768 ) ( ON ?auto_247769 ?auto_247768 ) ( ON ?auto_247770 ?auto_247769 ) ( ON ?auto_247771 ?auto_247770 ) ( ON ?auto_247772 ?auto_247771 ) ( ON ?auto_247773 ?auto_247772 ) ( ON ?auto_247774 ?auto_247773 ) ( not ( = ?auto_247768 ?auto_247769 ) ) ( not ( = ?auto_247768 ?auto_247770 ) ) ( not ( = ?auto_247768 ?auto_247771 ) ) ( not ( = ?auto_247768 ?auto_247772 ) ) ( not ( = ?auto_247768 ?auto_247773 ) ) ( not ( = ?auto_247768 ?auto_247774 ) ) ( not ( = ?auto_247768 ?auto_247775 ) ) ( not ( = ?auto_247768 ?auto_247776 ) ) ( not ( = ?auto_247769 ?auto_247770 ) ) ( not ( = ?auto_247769 ?auto_247771 ) ) ( not ( = ?auto_247769 ?auto_247772 ) ) ( not ( = ?auto_247769 ?auto_247773 ) ) ( not ( = ?auto_247769 ?auto_247774 ) ) ( not ( = ?auto_247769 ?auto_247775 ) ) ( not ( = ?auto_247769 ?auto_247776 ) ) ( not ( = ?auto_247770 ?auto_247771 ) ) ( not ( = ?auto_247770 ?auto_247772 ) ) ( not ( = ?auto_247770 ?auto_247773 ) ) ( not ( = ?auto_247770 ?auto_247774 ) ) ( not ( = ?auto_247770 ?auto_247775 ) ) ( not ( = ?auto_247770 ?auto_247776 ) ) ( not ( = ?auto_247771 ?auto_247772 ) ) ( not ( = ?auto_247771 ?auto_247773 ) ) ( not ( = ?auto_247771 ?auto_247774 ) ) ( not ( = ?auto_247771 ?auto_247775 ) ) ( not ( = ?auto_247771 ?auto_247776 ) ) ( not ( = ?auto_247772 ?auto_247773 ) ) ( not ( = ?auto_247772 ?auto_247774 ) ) ( not ( = ?auto_247772 ?auto_247775 ) ) ( not ( = ?auto_247772 ?auto_247776 ) ) ( not ( = ?auto_247773 ?auto_247774 ) ) ( not ( = ?auto_247773 ?auto_247775 ) ) ( not ( = ?auto_247773 ?auto_247776 ) ) ( not ( = ?auto_247774 ?auto_247775 ) ) ( not ( = ?auto_247774 ?auto_247776 ) ) ( not ( = ?auto_247775 ?auto_247776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247775 ?auto_247776 )
      ( !STACK ?auto_247775 ?auto_247774 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247785 - BLOCK
      ?auto_247786 - BLOCK
      ?auto_247787 - BLOCK
      ?auto_247788 - BLOCK
      ?auto_247789 - BLOCK
      ?auto_247790 - BLOCK
      ?auto_247791 - BLOCK
      ?auto_247792 - BLOCK
    )
    :vars
    (
      ?auto_247793 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_247791 ) ( ON ?auto_247792 ?auto_247793 ) ( CLEAR ?auto_247792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_247785 ) ( ON ?auto_247786 ?auto_247785 ) ( ON ?auto_247787 ?auto_247786 ) ( ON ?auto_247788 ?auto_247787 ) ( ON ?auto_247789 ?auto_247788 ) ( ON ?auto_247790 ?auto_247789 ) ( ON ?auto_247791 ?auto_247790 ) ( not ( = ?auto_247785 ?auto_247786 ) ) ( not ( = ?auto_247785 ?auto_247787 ) ) ( not ( = ?auto_247785 ?auto_247788 ) ) ( not ( = ?auto_247785 ?auto_247789 ) ) ( not ( = ?auto_247785 ?auto_247790 ) ) ( not ( = ?auto_247785 ?auto_247791 ) ) ( not ( = ?auto_247785 ?auto_247792 ) ) ( not ( = ?auto_247785 ?auto_247793 ) ) ( not ( = ?auto_247786 ?auto_247787 ) ) ( not ( = ?auto_247786 ?auto_247788 ) ) ( not ( = ?auto_247786 ?auto_247789 ) ) ( not ( = ?auto_247786 ?auto_247790 ) ) ( not ( = ?auto_247786 ?auto_247791 ) ) ( not ( = ?auto_247786 ?auto_247792 ) ) ( not ( = ?auto_247786 ?auto_247793 ) ) ( not ( = ?auto_247787 ?auto_247788 ) ) ( not ( = ?auto_247787 ?auto_247789 ) ) ( not ( = ?auto_247787 ?auto_247790 ) ) ( not ( = ?auto_247787 ?auto_247791 ) ) ( not ( = ?auto_247787 ?auto_247792 ) ) ( not ( = ?auto_247787 ?auto_247793 ) ) ( not ( = ?auto_247788 ?auto_247789 ) ) ( not ( = ?auto_247788 ?auto_247790 ) ) ( not ( = ?auto_247788 ?auto_247791 ) ) ( not ( = ?auto_247788 ?auto_247792 ) ) ( not ( = ?auto_247788 ?auto_247793 ) ) ( not ( = ?auto_247789 ?auto_247790 ) ) ( not ( = ?auto_247789 ?auto_247791 ) ) ( not ( = ?auto_247789 ?auto_247792 ) ) ( not ( = ?auto_247789 ?auto_247793 ) ) ( not ( = ?auto_247790 ?auto_247791 ) ) ( not ( = ?auto_247790 ?auto_247792 ) ) ( not ( = ?auto_247790 ?auto_247793 ) ) ( not ( = ?auto_247791 ?auto_247792 ) ) ( not ( = ?auto_247791 ?auto_247793 ) ) ( not ( = ?auto_247792 ?auto_247793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247792 ?auto_247793 )
      ( !STACK ?auto_247792 ?auto_247791 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247802 - BLOCK
      ?auto_247803 - BLOCK
      ?auto_247804 - BLOCK
      ?auto_247805 - BLOCK
      ?auto_247806 - BLOCK
      ?auto_247807 - BLOCK
      ?auto_247808 - BLOCK
      ?auto_247809 - BLOCK
    )
    :vars
    (
      ?auto_247810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247809 ?auto_247810 ) ( ON-TABLE ?auto_247802 ) ( ON ?auto_247803 ?auto_247802 ) ( ON ?auto_247804 ?auto_247803 ) ( ON ?auto_247805 ?auto_247804 ) ( ON ?auto_247806 ?auto_247805 ) ( ON ?auto_247807 ?auto_247806 ) ( not ( = ?auto_247802 ?auto_247803 ) ) ( not ( = ?auto_247802 ?auto_247804 ) ) ( not ( = ?auto_247802 ?auto_247805 ) ) ( not ( = ?auto_247802 ?auto_247806 ) ) ( not ( = ?auto_247802 ?auto_247807 ) ) ( not ( = ?auto_247802 ?auto_247808 ) ) ( not ( = ?auto_247802 ?auto_247809 ) ) ( not ( = ?auto_247802 ?auto_247810 ) ) ( not ( = ?auto_247803 ?auto_247804 ) ) ( not ( = ?auto_247803 ?auto_247805 ) ) ( not ( = ?auto_247803 ?auto_247806 ) ) ( not ( = ?auto_247803 ?auto_247807 ) ) ( not ( = ?auto_247803 ?auto_247808 ) ) ( not ( = ?auto_247803 ?auto_247809 ) ) ( not ( = ?auto_247803 ?auto_247810 ) ) ( not ( = ?auto_247804 ?auto_247805 ) ) ( not ( = ?auto_247804 ?auto_247806 ) ) ( not ( = ?auto_247804 ?auto_247807 ) ) ( not ( = ?auto_247804 ?auto_247808 ) ) ( not ( = ?auto_247804 ?auto_247809 ) ) ( not ( = ?auto_247804 ?auto_247810 ) ) ( not ( = ?auto_247805 ?auto_247806 ) ) ( not ( = ?auto_247805 ?auto_247807 ) ) ( not ( = ?auto_247805 ?auto_247808 ) ) ( not ( = ?auto_247805 ?auto_247809 ) ) ( not ( = ?auto_247805 ?auto_247810 ) ) ( not ( = ?auto_247806 ?auto_247807 ) ) ( not ( = ?auto_247806 ?auto_247808 ) ) ( not ( = ?auto_247806 ?auto_247809 ) ) ( not ( = ?auto_247806 ?auto_247810 ) ) ( not ( = ?auto_247807 ?auto_247808 ) ) ( not ( = ?auto_247807 ?auto_247809 ) ) ( not ( = ?auto_247807 ?auto_247810 ) ) ( not ( = ?auto_247808 ?auto_247809 ) ) ( not ( = ?auto_247808 ?auto_247810 ) ) ( not ( = ?auto_247809 ?auto_247810 ) ) ( CLEAR ?auto_247807 ) ( ON ?auto_247808 ?auto_247809 ) ( CLEAR ?auto_247808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_247802 ?auto_247803 ?auto_247804 ?auto_247805 ?auto_247806 ?auto_247807 ?auto_247808 )
      ( MAKE-8PILE ?auto_247802 ?auto_247803 ?auto_247804 ?auto_247805 ?auto_247806 ?auto_247807 ?auto_247808 ?auto_247809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247819 - BLOCK
      ?auto_247820 - BLOCK
      ?auto_247821 - BLOCK
      ?auto_247822 - BLOCK
      ?auto_247823 - BLOCK
      ?auto_247824 - BLOCK
      ?auto_247825 - BLOCK
      ?auto_247826 - BLOCK
    )
    :vars
    (
      ?auto_247827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247826 ?auto_247827 ) ( ON-TABLE ?auto_247819 ) ( ON ?auto_247820 ?auto_247819 ) ( ON ?auto_247821 ?auto_247820 ) ( ON ?auto_247822 ?auto_247821 ) ( ON ?auto_247823 ?auto_247822 ) ( ON ?auto_247824 ?auto_247823 ) ( not ( = ?auto_247819 ?auto_247820 ) ) ( not ( = ?auto_247819 ?auto_247821 ) ) ( not ( = ?auto_247819 ?auto_247822 ) ) ( not ( = ?auto_247819 ?auto_247823 ) ) ( not ( = ?auto_247819 ?auto_247824 ) ) ( not ( = ?auto_247819 ?auto_247825 ) ) ( not ( = ?auto_247819 ?auto_247826 ) ) ( not ( = ?auto_247819 ?auto_247827 ) ) ( not ( = ?auto_247820 ?auto_247821 ) ) ( not ( = ?auto_247820 ?auto_247822 ) ) ( not ( = ?auto_247820 ?auto_247823 ) ) ( not ( = ?auto_247820 ?auto_247824 ) ) ( not ( = ?auto_247820 ?auto_247825 ) ) ( not ( = ?auto_247820 ?auto_247826 ) ) ( not ( = ?auto_247820 ?auto_247827 ) ) ( not ( = ?auto_247821 ?auto_247822 ) ) ( not ( = ?auto_247821 ?auto_247823 ) ) ( not ( = ?auto_247821 ?auto_247824 ) ) ( not ( = ?auto_247821 ?auto_247825 ) ) ( not ( = ?auto_247821 ?auto_247826 ) ) ( not ( = ?auto_247821 ?auto_247827 ) ) ( not ( = ?auto_247822 ?auto_247823 ) ) ( not ( = ?auto_247822 ?auto_247824 ) ) ( not ( = ?auto_247822 ?auto_247825 ) ) ( not ( = ?auto_247822 ?auto_247826 ) ) ( not ( = ?auto_247822 ?auto_247827 ) ) ( not ( = ?auto_247823 ?auto_247824 ) ) ( not ( = ?auto_247823 ?auto_247825 ) ) ( not ( = ?auto_247823 ?auto_247826 ) ) ( not ( = ?auto_247823 ?auto_247827 ) ) ( not ( = ?auto_247824 ?auto_247825 ) ) ( not ( = ?auto_247824 ?auto_247826 ) ) ( not ( = ?auto_247824 ?auto_247827 ) ) ( not ( = ?auto_247825 ?auto_247826 ) ) ( not ( = ?auto_247825 ?auto_247827 ) ) ( not ( = ?auto_247826 ?auto_247827 ) ) ( CLEAR ?auto_247824 ) ( ON ?auto_247825 ?auto_247826 ) ( CLEAR ?auto_247825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_247819 ?auto_247820 ?auto_247821 ?auto_247822 ?auto_247823 ?auto_247824 ?auto_247825 )
      ( MAKE-8PILE ?auto_247819 ?auto_247820 ?auto_247821 ?auto_247822 ?auto_247823 ?auto_247824 ?auto_247825 ?auto_247826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247836 - BLOCK
      ?auto_247837 - BLOCK
      ?auto_247838 - BLOCK
      ?auto_247839 - BLOCK
      ?auto_247840 - BLOCK
      ?auto_247841 - BLOCK
      ?auto_247842 - BLOCK
      ?auto_247843 - BLOCK
    )
    :vars
    (
      ?auto_247844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247843 ?auto_247844 ) ( ON-TABLE ?auto_247836 ) ( ON ?auto_247837 ?auto_247836 ) ( ON ?auto_247838 ?auto_247837 ) ( ON ?auto_247839 ?auto_247838 ) ( ON ?auto_247840 ?auto_247839 ) ( not ( = ?auto_247836 ?auto_247837 ) ) ( not ( = ?auto_247836 ?auto_247838 ) ) ( not ( = ?auto_247836 ?auto_247839 ) ) ( not ( = ?auto_247836 ?auto_247840 ) ) ( not ( = ?auto_247836 ?auto_247841 ) ) ( not ( = ?auto_247836 ?auto_247842 ) ) ( not ( = ?auto_247836 ?auto_247843 ) ) ( not ( = ?auto_247836 ?auto_247844 ) ) ( not ( = ?auto_247837 ?auto_247838 ) ) ( not ( = ?auto_247837 ?auto_247839 ) ) ( not ( = ?auto_247837 ?auto_247840 ) ) ( not ( = ?auto_247837 ?auto_247841 ) ) ( not ( = ?auto_247837 ?auto_247842 ) ) ( not ( = ?auto_247837 ?auto_247843 ) ) ( not ( = ?auto_247837 ?auto_247844 ) ) ( not ( = ?auto_247838 ?auto_247839 ) ) ( not ( = ?auto_247838 ?auto_247840 ) ) ( not ( = ?auto_247838 ?auto_247841 ) ) ( not ( = ?auto_247838 ?auto_247842 ) ) ( not ( = ?auto_247838 ?auto_247843 ) ) ( not ( = ?auto_247838 ?auto_247844 ) ) ( not ( = ?auto_247839 ?auto_247840 ) ) ( not ( = ?auto_247839 ?auto_247841 ) ) ( not ( = ?auto_247839 ?auto_247842 ) ) ( not ( = ?auto_247839 ?auto_247843 ) ) ( not ( = ?auto_247839 ?auto_247844 ) ) ( not ( = ?auto_247840 ?auto_247841 ) ) ( not ( = ?auto_247840 ?auto_247842 ) ) ( not ( = ?auto_247840 ?auto_247843 ) ) ( not ( = ?auto_247840 ?auto_247844 ) ) ( not ( = ?auto_247841 ?auto_247842 ) ) ( not ( = ?auto_247841 ?auto_247843 ) ) ( not ( = ?auto_247841 ?auto_247844 ) ) ( not ( = ?auto_247842 ?auto_247843 ) ) ( not ( = ?auto_247842 ?auto_247844 ) ) ( not ( = ?auto_247843 ?auto_247844 ) ) ( ON ?auto_247842 ?auto_247843 ) ( CLEAR ?auto_247840 ) ( ON ?auto_247841 ?auto_247842 ) ( CLEAR ?auto_247841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247836 ?auto_247837 ?auto_247838 ?auto_247839 ?auto_247840 ?auto_247841 )
      ( MAKE-8PILE ?auto_247836 ?auto_247837 ?auto_247838 ?auto_247839 ?auto_247840 ?auto_247841 ?auto_247842 ?auto_247843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247853 - BLOCK
      ?auto_247854 - BLOCK
      ?auto_247855 - BLOCK
      ?auto_247856 - BLOCK
      ?auto_247857 - BLOCK
      ?auto_247858 - BLOCK
      ?auto_247859 - BLOCK
      ?auto_247860 - BLOCK
    )
    :vars
    (
      ?auto_247861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247860 ?auto_247861 ) ( ON-TABLE ?auto_247853 ) ( ON ?auto_247854 ?auto_247853 ) ( ON ?auto_247855 ?auto_247854 ) ( ON ?auto_247856 ?auto_247855 ) ( ON ?auto_247857 ?auto_247856 ) ( not ( = ?auto_247853 ?auto_247854 ) ) ( not ( = ?auto_247853 ?auto_247855 ) ) ( not ( = ?auto_247853 ?auto_247856 ) ) ( not ( = ?auto_247853 ?auto_247857 ) ) ( not ( = ?auto_247853 ?auto_247858 ) ) ( not ( = ?auto_247853 ?auto_247859 ) ) ( not ( = ?auto_247853 ?auto_247860 ) ) ( not ( = ?auto_247853 ?auto_247861 ) ) ( not ( = ?auto_247854 ?auto_247855 ) ) ( not ( = ?auto_247854 ?auto_247856 ) ) ( not ( = ?auto_247854 ?auto_247857 ) ) ( not ( = ?auto_247854 ?auto_247858 ) ) ( not ( = ?auto_247854 ?auto_247859 ) ) ( not ( = ?auto_247854 ?auto_247860 ) ) ( not ( = ?auto_247854 ?auto_247861 ) ) ( not ( = ?auto_247855 ?auto_247856 ) ) ( not ( = ?auto_247855 ?auto_247857 ) ) ( not ( = ?auto_247855 ?auto_247858 ) ) ( not ( = ?auto_247855 ?auto_247859 ) ) ( not ( = ?auto_247855 ?auto_247860 ) ) ( not ( = ?auto_247855 ?auto_247861 ) ) ( not ( = ?auto_247856 ?auto_247857 ) ) ( not ( = ?auto_247856 ?auto_247858 ) ) ( not ( = ?auto_247856 ?auto_247859 ) ) ( not ( = ?auto_247856 ?auto_247860 ) ) ( not ( = ?auto_247856 ?auto_247861 ) ) ( not ( = ?auto_247857 ?auto_247858 ) ) ( not ( = ?auto_247857 ?auto_247859 ) ) ( not ( = ?auto_247857 ?auto_247860 ) ) ( not ( = ?auto_247857 ?auto_247861 ) ) ( not ( = ?auto_247858 ?auto_247859 ) ) ( not ( = ?auto_247858 ?auto_247860 ) ) ( not ( = ?auto_247858 ?auto_247861 ) ) ( not ( = ?auto_247859 ?auto_247860 ) ) ( not ( = ?auto_247859 ?auto_247861 ) ) ( not ( = ?auto_247860 ?auto_247861 ) ) ( ON ?auto_247859 ?auto_247860 ) ( CLEAR ?auto_247857 ) ( ON ?auto_247858 ?auto_247859 ) ( CLEAR ?auto_247858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_247853 ?auto_247854 ?auto_247855 ?auto_247856 ?auto_247857 ?auto_247858 )
      ( MAKE-8PILE ?auto_247853 ?auto_247854 ?auto_247855 ?auto_247856 ?auto_247857 ?auto_247858 ?auto_247859 ?auto_247860 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247870 - BLOCK
      ?auto_247871 - BLOCK
      ?auto_247872 - BLOCK
      ?auto_247873 - BLOCK
      ?auto_247874 - BLOCK
      ?auto_247875 - BLOCK
      ?auto_247876 - BLOCK
      ?auto_247877 - BLOCK
    )
    :vars
    (
      ?auto_247878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247877 ?auto_247878 ) ( ON-TABLE ?auto_247870 ) ( ON ?auto_247871 ?auto_247870 ) ( ON ?auto_247872 ?auto_247871 ) ( ON ?auto_247873 ?auto_247872 ) ( not ( = ?auto_247870 ?auto_247871 ) ) ( not ( = ?auto_247870 ?auto_247872 ) ) ( not ( = ?auto_247870 ?auto_247873 ) ) ( not ( = ?auto_247870 ?auto_247874 ) ) ( not ( = ?auto_247870 ?auto_247875 ) ) ( not ( = ?auto_247870 ?auto_247876 ) ) ( not ( = ?auto_247870 ?auto_247877 ) ) ( not ( = ?auto_247870 ?auto_247878 ) ) ( not ( = ?auto_247871 ?auto_247872 ) ) ( not ( = ?auto_247871 ?auto_247873 ) ) ( not ( = ?auto_247871 ?auto_247874 ) ) ( not ( = ?auto_247871 ?auto_247875 ) ) ( not ( = ?auto_247871 ?auto_247876 ) ) ( not ( = ?auto_247871 ?auto_247877 ) ) ( not ( = ?auto_247871 ?auto_247878 ) ) ( not ( = ?auto_247872 ?auto_247873 ) ) ( not ( = ?auto_247872 ?auto_247874 ) ) ( not ( = ?auto_247872 ?auto_247875 ) ) ( not ( = ?auto_247872 ?auto_247876 ) ) ( not ( = ?auto_247872 ?auto_247877 ) ) ( not ( = ?auto_247872 ?auto_247878 ) ) ( not ( = ?auto_247873 ?auto_247874 ) ) ( not ( = ?auto_247873 ?auto_247875 ) ) ( not ( = ?auto_247873 ?auto_247876 ) ) ( not ( = ?auto_247873 ?auto_247877 ) ) ( not ( = ?auto_247873 ?auto_247878 ) ) ( not ( = ?auto_247874 ?auto_247875 ) ) ( not ( = ?auto_247874 ?auto_247876 ) ) ( not ( = ?auto_247874 ?auto_247877 ) ) ( not ( = ?auto_247874 ?auto_247878 ) ) ( not ( = ?auto_247875 ?auto_247876 ) ) ( not ( = ?auto_247875 ?auto_247877 ) ) ( not ( = ?auto_247875 ?auto_247878 ) ) ( not ( = ?auto_247876 ?auto_247877 ) ) ( not ( = ?auto_247876 ?auto_247878 ) ) ( not ( = ?auto_247877 ?auto_247878 ) ) ( ON ?auto_247876 ?auto_247877 ) ( ON ?auto_247875 ?auto_247876 ) ( CLEAR ?auto_247873 ) ( ON ?auto_247874 ?auto_247875 ) ( CLEAR ?auto_247874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247870 ?auto_247871 ?auto_247872 ?auto_247873 ?auto_247874 )
      ( MAKE-8PILE ?auto_247870 ?auto_247871 ?auto_247872 ?auto_247873 ?auto_247874 ?auto_247875 ?auto_247876 ?auto_247877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247887 - BLOCK
      ?auto_247888 - BLOCK
      ?auto_247889 - BLOCK
      ?auto_247890 - BLOCK
      ?auto_247891 - BLOCK
      ?auto_247892 - BLOCK
      ?auto_247893 - BLOCK
      ?auto_247894 - BLOCK
    )
    :vars
    (
      ?auto_247895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247894 ?auto_247895 ) ( ON-TABLE ?auto_247887 ) ( ON ?auto_247888 ?auto_247887 ) ( ON ?auto_247889 ?auto_247888 ) ( ON ?auto_247890 ?auto_247889 ) ( not ( = ?auto_247887 ?auto_247888 ) ) ( not ( = ?auto_247887 ?auto_247889 ) ) ( not ( = ?auto_247887 ?auto_247890 ) ) ( not ( = ?auto_247887 ?auto_247891 ) ) ( not ( = ?auto_247887 ?auto_247892 ) ) ( not ( = ?auto_247887 ?auto_247893 ) ) ( not ( = ?auto_247887 ?auto_247894 ) ) ( not ( = ?auto_247887 ?auto_247895 ) ) ( not ( = ?auto_247888 ?auto_247889 ) ) ( not ( = ?auto_247888 ?auto_247890 ) ) ( not ( = ?auto_247888 ?auto_247891 ) ) ( not ( = ?auto_247888 ?auto_247892 ) ) ( not ( = ?auto_247888 ?auto_247893 ) ) ( not ( = ?auto_247888 ?auto_247894 ) ) ( not ( = ?auto_247888 ?auto_247895 ) ) ( not ( = ?auto_247889 ?auto_247890 ) ) ( not ( = ?auto_247889 ?auto_247891 ) ) ( not ( = ?auto_247889 ?auto_247892 ) ) ( not ( = ?auto_247889 ?auto_247893 ) ) ( not ( = ?auto_247889 ?auto_247894 ) ) ( not ( = ?auto_247889 ?auto_247895 ) ) ( not ( = ?auto_247890 ?auto_247891 ) ) ( not ( = ?auto_247890 ?auto_247892 ) ) ( not ( = ?auto_247890 ?auto_247893 ) ) ( not ( = ?auto_247890 ?auto_247894 ) ) ( not ( = ?auto_247890 ?auto_247895 ) ) ( not ( = ?auto_247891 ?auto_247892 ) ) ( not ( = ?auto_247891 ?auto_247893 ) ) ( not ( = ?auto_247891 ?auto_247894 ) ) ( not ( = ?auto_247891 ?auto_247895 ) ) ( not ( = ?auto_247892 ?auto_247893 ) ) ( not ( = ?auto_247892 ?auto_247894 ) ) ( not ( = ?auto_247892 ?auto_247895 ) ) ( not ( = ?auto_247893 ?auto_247894 ) ) ( not ( = ?auto_247893 ?auto_247895 ) ) ( not ( = ?auto_247894 ?auto_247895 ) ) ( ON ?auto_247893 ?auto_247894 ) ( ON ?auto_247892 ?auto_247893 ) ( CLEAR ?auto_247890 ) ( ON ?auto_247891 ?auto_247892 ) ( CLEAR ?auto_247891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_247887 ?auto_247888 ?auto_247889 ?auto_247890 ?auto_247891 )
      ( MAKE-8PILE ?auto_247887 ?auto_247888 ?auto_247889 ?auto_247890 ?auto_247891 ?auto_247892 ?auto_247893 ?auto_247894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247904 - BLOCK
      ?auto_247905 - BLOCK
      ?auto_247906 - BLOCK
      ?auto_247907 - BLOCK
      ?auto_247908 - BLOCK
      ?auto_247909 - BLOCK
      ?auto_247910 - BLOCK
      ?auto_247911 - BLOCK
    )
    :vars
    (
      ?auto_247912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247911 ?auto_247912 ) ( ON-TABLE ?auto_247904 ) ( ON ?auto_247905 ?auto_247904 ) ( ON ?auto_247906 ?auto_247905 ) ( not ( = ?auto_247904 ?auto_247905 ) ) ( not ( = ?auto_247904 ?auto_247906 ) ) ( not ( = ?auto_247904 ?auto_247907 ) ) ( not ( = ?auto_247904 ?auto_247908 ) ) ( not ( = ?auto_247904 ?auto_247909 ) ) ( not ( = ?auto_247904 ?auto_247910 ) ) ( not ( = ?auto_247904 ?auto_247911 ) ) ( not ( = ?auto_247904 ?auto_247912 ) ) ( not ( = ?auto_247905 ?auto_247906 ) ) ( not ( = ?auto_247905 ?auto_247907 ) ) ( not ( = ?auto_247905 ?auto_247908 ) ) ( not ( = ?auto_247905 ?auto_247909 ) ) ( not ( = ?auto_247905 ?auto_247910 ) ) ( not ( = ?auto_247905 ?auto_247911 ) ) ( not ( = ?auto_247905 ?auto_247912 ) ) ( not ( = ?auto_247906 ?auto_247907 ) ) ( not ( = ?auto_247906 ?auto_247908 ) ) ( not ( = ?auto_247906 ?auto_247909 ) ) ( not ( = ?auto_247906 ?auto_247910 ) ) ( not ( = ?auto_247906 ?auto_247911 ) ) ( not ( = ?auto_247906 ?auto_247912 ) ) ( not ( = ?auto_247907 ?auto_247908 ) ) ( not ( = ?auto_247907 ?auto_247909 ) ) ( not ( = ?auto_247907 ?auto_247910 ) ) ( not ( = ?auto_247907 ?auto_247911 ) ) ( not ( = ?auto_247907 ?auto_247912 ) ) ( not ( = ?auto_247908 ?auto_247909 ) ) ( not ( = ?auto_247908 ?auto_247910 ) ) ( not ( = ?auto_247908 ?auto_247911 ) ) ( not ( = ?auto_247908 ?auto_247912 ) ) ( not ( = ?auto_247909 ?auto_247910 ) ) ( not ( = ?auto_247909 ?auto_247911 ) ) ( not ( = ?auto_247909 ?auto_247912 ) ) ( not ( = ?auto_247910 ?auto_247911 ) ) ( not ( = ?auto_247910 ?auto_247912 ) ) ( not ( = ?auto_247911 ?auto_247912 ) ) ( ON ?auto_247910 ?auto_247911 ) ( ON ?auto_247909 ?auto_247910 ) ( ON ?auto_247908 ?auto_247909 ) ( CLEAR ?auto_247906 ) ( ON ?auto_247907 ?auto_247908 ) ( CLEAR ?auto_247907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247904 ?auto_247905 ?auto_247906 ?auto_247907 )
      ( MAKE-8PILE ?auto_247904 ?auto_247905 ?auto_247906 ?auto_247907 ?auto_247908 ?auto_247909 ?auto_247910 ?auto_247911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247921 - BLOCK
      ?auto_247922 - BLOCK
      ?auto_247923 - BLOCK
      ?auto_247924 - BLOCK
      ?auto_247925 - BLOCK
      ?auto_247926 - BLOCK
      ?auto_247927 - BLOCK
      ?auto_247928 - BLOCK
    )
    :vars
    (
      ?auto_247929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247928 ?auto_247929 ) ( ON-TABLE ?auto_247921 ) ( ON ?auto_247922 ?auto_247921 ) ( ON ?auto_247923 ?auto_247922 ) ( not ( = ?auto_247921 ?auto_247922 ) ) ( not ( = ?auto_247921 ?auto_247923 ) ) ( not ( = ?auto_247921 ?auto_247924 ) ) ( not ( = ?auto_247921 ?auto_247925 ) ) ( not ( = ?auto_247921 ?auto_247926 ) ) ( not ( = ?auto_247921 ?auto_247927 ) ) ( not ( = ?auto_247921 ?auto_247928 ) ) ( not ( = ?auto_247921 ?auto_247929 ) ) ( not ( = ?auto_247922 ?auto_247923 ) ) ( not ( = ?auto_247922 ?auto_247924 ) ) ( not ( = ?auto_247922 ?auto_247925 ) ) ( not ( = ?auto_247922 ?auto_247926 ) ) ( not ( = ?auto_247922 ?auto_247927 ) ) ( not ( = ?auto_247922 ?auto_247928 ) ) ( not ( = ?auto_247922 ?auto_247929 ) ) ( not ( = ?auto_247923 ?auto_247924 ) ) ( not ( = ?auto_247923 ?auto_247925 ) ) ( not ( = ?auto_247923 ?auto_247926 ) ) ( not ( = ?auto_247923 ?auto_247927 ) ) ( not ( = ?auto_247923 ?auto_247928 ) ) ( not ( = ?auto_247923 ?auto_247929 ) ) ( not ( = ?auto_247924 ?auto_247925 ) ) ( not ( = ?auto_247924 ?auto_247926 ) ) ( not ( = ?auto_247924 ?auto_247927 ) ) ( not ( = ?auto_247924 ?auto_247928 ) ) ( not ( = ?auto_247924 ?auto_247929 ) ) ( not ( = ?auto_247925 ?auto_247926 ) ) ( not ( = ?auto_247925 ?auto_247927 ) ) ( not ( = ?auto_247925 ?auto_247928 ) ) ( not ( = ?auto_247925 ?auto_247929 ) ) ( not ( = ?auto_247926 ?auto_247927 ) ) ( not ( = ?auto_247926 ?auto_247928 ) ) ( not ( = ?auto_247926 ?auto_247929 ) ) ( not ( = ?auto_247927 ?auto_247928 ) ) ( not ( = ?auto_247927 ?auto_247929 ) ) ( not ( = ?auto_247928 ?auto_247929 ) ) ( ON ?auto_247927 ?auto_247928 ) ( ON ?auto_247926 ?auto_247927 ) ( ON ?auto_247925 ?auto_247926 ) ( CLEAR ?auto_247923 ) ( ON ?auto_247924 ?auto_247925 ) ( CLEAR ?auto_247924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_247921 ?auto_247922 ?auto_247923 ?auto_247924 )
      ( MAKE-8PILE ?auto_247921 ?auto_247922 ?auto_247923 ?auto_247924 ?auto_247925 ?auto_247926 ?auto_247927 ?auto_247928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247938 - BLOCK
      ?auto_247939 - BLOCK
      ?auto_247940 - BLOCK
      ?auto_247941 - BLOCK
      ?auto_247942 - BLOCK
      ?auto_247943 - BLOCK
      ?auto_247944 - BLOCK
      ?auto_247945 - BLOCK
    )
    :vars
    (
      ?auto_247946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247945 ?auto_247946 ) ( ON-TABLE ?auto_247938 ) ( ON ?auto_247939 ?auto_247938 ) ( not ( = ?auto_247938 ?auto_247939 ) ) ( not ( = ?auto_247938 ?auto_247940 ) ) ( not ( = ?auto_247938 ?auto_247941 ) ) ( not ( = ?auto_247938 ?auto_247942 ) ) ( not ( = ?auto_247938 ?auto_247943 ) ) ( not ( = ?auto_247938 ?auto_247944 ) ) ( not ( = ?auto_247938 ?auto_247945 ) ) ( not ( = ?auto_247938 ?auto_247946 ) ) ( not ( = ?auto_247939 ?auto_247940 ) ) ( not ( = ?auto_247939 ?auto_247941 ) ) ( not ( = ?auto_247939 ?auto_247942 ) ) ( not ( = ?auto_247939 ?auto_247943 ) ) ( not ( = ?auto_247939 ?auto_247944 ) ) ( not ( = ?auto_247939 ?auto_247945 ) ) ( not ( = ?auto_247939 ?auto_247946 ) ) ( not ( = ?auto_247940 ?auto_247941 ) ) ( not ( = ?auto_247940 ?auto_247942 ) ) ( not ( = ?auto_247940 ?auto_247943 ) ) ( not ( = ?auto_247940 ?auto_247944 ) ) ( not ( = ?auto_247940 ?auto_247945 ) ) ( not ( = ?auto_247940 ?auto_247946 ) ) ( not ( = ?auto_247941 ?auto_247942 ) ) ( not ( = ?auto_247941 ?auto_247943 ) ) ( not ( = ?auto_247941 ?auto_247944 ) ) ( not ( = ?auto_247941 ?auto_247945 ) ) ( not ( = ?auto_247941 ?auto_247946 ) ) ( not ( = ?auto_247942 ?auto_247943 ) ) ( not ( = ?auto_247942 ?auto_247944 ) ) ( not ( = ?auto_247942 ?auto_247945 ) ) ( not ( = ?auto_247942 ?auto_247946 ) ) ( not ( = ?auto_247943 ?auto_247944 ) ) ( not ( = ?auto_247943 ?auto_247945 ) ) ( not ( = ?auto_247943 ?auto_247946 ) ) ( not ( = ?auto_247944 ?auto_247945 ) ) ( not ( = ?auto_247944 ?auto_247946 ) ) ( not ( = ?auto_247945 ?auto_247946 ) ) ( ON ?auto_247944 ?auto_247945 ) ( ON ?auto_247943 ?auto_247944 ) ( ON ?auto_247942 ?auto_247943 ) ( ON ?auto_247941 ?auto_247942 ) ( CLEAR ?auto_247939 ) ( ON ?auto_247940 ?auto_247941 ) ( CLEAR ?auto_247940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247938 ?auto_247939 ?auto_247940 )
      ( MAKE-8PILE ?auto_247938 ?auto_247939 ?auto_247940 ?auto_247941 ?auto_247942 ?auto_247943 ?auto_247944 ?auto_247945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247955 - BLOCK
      ?auto_247956 - BLOCK
      ?auto_247957 - BLOCK
      ?auto_247958 - BLOCK
      ?auto_247959 - BLOCK
      ?auto_247960 - BLOCK
      ?auto_247961 - BLOCK
      ?auto_247962 - BLOCK
    )
    :vars
    (
      ?auto_247963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247962 ?auto_247963 ) ( ON-TABLE ?auto_247955 ) ( ON ?auto_247956 ?auto_247955 ) ( not ( = ?auto_247955 ?auto_247956 ) ) ( not ( = ?auto_247955 ?auto_247957 ) ) ( not ( = ?auto_247955 ?auto_247958 ) ) ( not ( = ?auto_247955 ?auto_247959 ) ) ( not ( = ?auto_247955 ?auto_247960 ) ) ( not ( = ?auto_247955 ?auto_247961 ) ) ( not ( = ?auto_247955 ?auto_247962 ) ) ( not ( = ?auto_247955 ?auto_247963 ) ) ( not ( = ?auto_247956 ?auto_247957 ) ) ( not ( = ?auto_247956 ?auto_247958 ) ) ( not ( = ?auto_247956 ?auto_247959 ) ) ( not ( = ?auto_247956 ?auto_247960 ) ) ( not ( = ?auto_247956 ?auto_247961 ) ) ( not ( = ?auto_247956 ?auto_247962 ) ) ( not ( = ?auto_247956 ?auto_247963 ) ) ( not ( = ?auto_247957 ?auto_247958 ) ) ( not ( = ?auto_247957 ?auto_247959 ) ) ( not ( = ?auto_247957 ?auto_247960 ) ) ( not ( = ?auto_247957 ?auto_247961 ) ) ( not ( = ?auto_247957 ?auto_247962 ) ) ( not ( = ?auto_247957 ?auto_247963 ) ) ( not ( = ?auto_247958 ?auto_247959 ) ) ( not ( = ?auto_247958 ?auto_247960 ) ) ( not ( = ?auto_247958 ?auto_247961 ) ) ( not ( = ?auto_247958 ?auto_247962 ) ) ( not ( = ?auto_247958 ?auto_247963 ) ) ( not ( = ?auto_247959 ?auto_247960 ) ) ( not ( = ?auto_247959 ?auto_247961 ) ) ( not ( = ?auto_247959 ?auto_247962 ) ) ( not ( = ?auto_247959 ?auto_247963 ) ) ( not ( = ?auto_247960 ?auto_247961 ) ) ( not ( = ?auto_247960 ?auto_247962 ) ) ( not ( = ?auto_247960 ?auto_247963 ) ) ( not ( = ?auto_247961 ?auto_247962 ) ) ( not ( = ?auto_247961 ?auto_247963 ) ) ( not ( = ?auto_247962 ?auto_247963 ) ) ( ON ?auto_247961 ?auto_247962 ) ( ON ?auto_247960 ?auto_247961 ) ( ON ?auto_247959 ?auto_247960 ) ( ON ?auto_247958 ?auto_247959 ) ( CLEAR ?auto_247956 ) ( ON ?auto_247957 ?auto_247958 ) ( CLEAR ?auto_247957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_247955 ?auto_247956 ?auto_247957 )
      ( MAKE-8PILE ?auto_247955 ?auto_247956 ?auto_247957 ?auto_247958 ?auto_247959 ?auto_247960 ?auto_247961 ?auto_247962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247972 - BLOCK
      ?auto_247973 - BLOCK
      ?auto_247974 - BLOCK
      ?auto_247975 - BLOCK
      ?auto_247976 - BLOCK
      ?auto_247977 - BLOCK
      ?auto_247978 - BLOCK
      ?auto_247979 - BLOCK
    )
    :vars
    (
      ?auto_247980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247979 ?auto_247980 ) ( ON-TABLE ?auto_247972 ) ( not ( = ?auto_247972 ?auto_247973 ) ) ( not ( = ?auto_247972 ?auto_247974 ) ) ( not ( = ?auto_247972 ?auto_247975 ) ) ( not ( = ?auto_247972 ?auto_247976 ) ) ( not ( = ?auto_247972 ?auto_247977 ) ) ( not ( = ?auto_247972 ?auto_247978 ) ) ( not ( = ?auto_247972 ?auto_247979 ) ) ( not ( = ?auto_247972 ?auto_247980 ) ) ( not ( = ?auto_247973 ?auto_247974 ) ) ( not ( = ?auto_247973 ?auto_247975 ) ) ( not ( = ?auto_247973 ?auto_247976 ) ) ( not ( = ?auto_247973 ?auto_247977 ) ) ( not ( = ?auto_247973 ?auto_247978 ) ) ( not ( = ?auto_247973 ?auto_247979 ) ) ( not ( = ?auto_247973 ?auto_247980 ) ) ( not ( = ?auto_247974 ?auto_247975 ) ) ( not ( = ?auto_247974 ?auto_247976 ) ) ( not ( = ?auto_247974 ?auto_247977 ) ) ( not ( = ?auto_247974 ?auto_247978 ) ) ( not ( = ?auto_247974 ?auto_247979 ) ) ( not ( = ?auto_247974 ?auto_247980 ) ) ( not ( = ?auto_247975 ?auto_247976 ) ) ( not ( = ?auto_247975 ?auto_247977 ) ) ( not ( = ?auto_247975 ?auto_247978 ) ) ( not ( = ?auto_247975 ?auto_247979 ) ) ( not ( = ?auto_247975 ?auto_247980 ) ) ( not ( = ?auto_247976 ?auto_247977 ) ) ( not ( = ?auto_247976 ?auto_247978 ) ) ( not ( = ?auto_247976 ?auto_247979 ) ) ( not ( = ?auto_247976 ?auto_247980 ) ) ( not ( = ?auto_247977 ?auto_247978 ) ) ( not ( = ?auto_247977 ?auto_247979 ) ) ( not ( = ?auto_247977 ?auto_247980 ) ) ( not ( = ?auto_247978 ?auto_247979 ) ) ( not ( = ?auto_247978 ?auto_247980 ) ) ( not ( = ?auto_247979 ?auto_247980 ) ) ( ON ?auto_247978 ?auto_247979 ) ( ON ?auto_247977 ?auto_247978 ) ( ON ?auto_247976 ?auto_247977 ) ( ON ?auto_247975 ?auto_247976 ) ( ON ?auto_247974 ?auto_247975 ) ( CLEAR ?auto_247972 ) ( ON ?auto_247973 ?auto_247974 ) ( CLEAR ?auto_247973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247972 ?auto_247973 )
      ( MAKE-8PILE ?auto_247972 ?auto_247973 ?auto_247974 ?auto_247975 ?auto_247976 ?auto_247977 ?auto_247978 ?auto_247979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_247989 - BLOCK
      ?auto_247990 - BLOCK
      ?auto_247991 - BLOCK
      ?auto_247992 - BLOCK
      ?auto_247993 - BLOCK
      ?auto_247994 - BLOCK
      ?auto_247995 - BLOCK
      ?auto_247996 - BLOCK
    )
    :vars
    (
      ?auto_247997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247996 ?auto_247997 ) ( ON-TABLE ?auto_247989 ) ( not ( = ?auto_247989 ?auto_247990 ) ) ( not ( = ?auto_247989 ?auto_247991 ) ) ( not ( = ?auto_247989 ?auto_247992 ) ) ( not ( = ?auto_247989 ?auto_247993 ) ) ( not ( = ?auto_247989 ?auto_247994 ) ) ( not ( = ?auto_247989 ?auto_247995 ) ) ( not ( = ?auto_247989 ?auto_247996 ) ) ( not ( = ?auto_247989 ?auto_247997 ) ) ( not ( = ?auto_247990 ?auto_247991 ) ) ( not ( = ?auto_247990 ?auto_247992 ) ) ( not ( = ?auto_247990 ?auto_247993 ) ) ( not ( = ?auto_247990 ?auto_247994 ) ) ( not ( = ?auto_247990 ?auto_247995 ) ) ( not ( = ?auto_247990 ?auto_247996 ) ) ( not ( = ?auto_247990 ?auto_247997 ) ) ( not ( = ?auto_247991 ?auto_247992 ) ) ( not ( = ?auto_247991 ?auto_247993 ) ) ( not ( = ?auto_247991 ?auto_247994 ) ) ( not ( = ?auto_247991 ?auto_247995 ) ) ( not ( = ?auto_247991 ?auto_247996 ) ) ( not ( = ?auto_247991 ?auto_247997 ) ) ( not ( = ?auto_247992 ?auto_247993 ) ) ( not ( = ?auto_247992 ?auto_247994 ) ) ( not ( = ?auto_247992 ?auto_247995 ) ) ( not ( = ?auto_247992 ?auto_247996 ) ) ( not ( = ?auto_247992 ?auto_247997 ) ) ( not ( = ?auto_247993 ?auto_247994 ) ) ( not ( = ?auto_247993 ?auto_247995 ) ) ( not ( = ?auto_247993 ?auto_247996 ) ) ( not ( = ?auto_247993 ?auto_247997 ) ) ( not ( = ?auto_247994 ?auto_247995 ) ) ( not ( = ?auto_247994 ?auto_247996 ) ) ( not ( = ?auto_247994 ?auto_247997 ) ) ( not ( = ?auto_247995 ?auto_247996 ) ) ( not ( = ?auto_247995 ?auto_247997 ) ) ( not ( = ?auto_247996 ?auto_247997 ) ) ( ON ?auto_247995 ?auto_247996 ) ( ON ?auto_247994 ?auto_247995 ) ( ON ?auto_247993 ?auto_247994 ) ( ON ?auto_247992 ?auto_247993 ) ( ON ?auto_247991 ?auto_247992 ) ( CLEAR ?auto_247989 ) ( ON ?auto_247990 ?auto_247991 ) ( CLEAR ?auto_247990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_247989 ?auto_247990 )
      ( MAKE-8PILE ?auto_247989 ?auto_247990 ?auto_247991 ?auto_247992 ?auto_247993 ?auto_247994 ?auto_247995 ?auto_247996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_248006 - BLOCK
      ?auto_248007 - BLOCK
      ?auto_248008 - BLOCK
      ?auto_248009 - BLOCK
      ?auto_248010 - BLOCK
      ?auto_248011 - BLOCK
      ?auto_248012 - BLOCK
      ?auto_248013 - BLOCK
    )
    :vars
    (
      ?auto_248014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248013 ?auto_248014 ) ( not ( = ?auto_248006 ?auto_248007 ) ) ( not ( = ?auto_248006 ?auto_248008 ) ) ( not ( = ?auto_248006 ?auto_248009 ) ) ( not ( = ?auto_248006 ?auto_248010 ) ) ( not ( = ?auto_248006 ?auto_248011 ) ) ( not ( = ?auto_248006 ?auto_248012 ) ) ( not ( = ?auto_248006 ?auto_248013 ) ) ( not ( = ?auto_248006 ?auto_248014 ) ) ( not ( = ?auto_248007 ?auto_248008 ) ) ( not ( = ?auto_248007 ?auto_248009 ) ) ( not ( = ?auto_248007 ?auto_248010 ) ) ( not ( = ?auto_248007 ?auto_248011 ) ) ( not ( = ?auto_248007 ?auto_248012 ) ) ( not ( = ?auto_248007 ?auto_248013 ) ) ( not ( = ?auto_248007 ?auto_248014 ) ) ( not ( = ?auto_248008 ?auto_248009 ) ) ( not ( = ?auto_248008 ?auto_248010 ) ) ( not ( = ?auto_248008 ?auto_248011 ) ) ( not ( = ?auto_248008 ?auto_248012 ) ) ( not ( = ?auto_248008 ?auto_248013 ) ) ( not ( = ?auto_248008 ?auto_248014 ) ) ( not ( = ?auto_248009 ?auto_248010 ) ) ( not ( = ?auto_248009 ?auto_248011 ) ) ( not ( = ?auto_248009 ?auto_248012 ) ) ( not ( = ?auto_248009 ?auto_248013 ) ) ( not ( = ?auto_248009 ?auto_248014 ) ) ( not ( = ?auto_248010 ?auto_248011 ) ) ( not ( = ?auto_248010 ?auto_248012 ) ) ( not ( = ?auto_248010 ?auto_248013 ) ) ( not ( = ?auto_248010 ?auto_248014 ) ) ( not ( = ?auto_248011 ?auto_248012 ) ) ( not ( = ?auto_248011 ?auto_248013 ) ) ( not ( = ?auto_248011 ?auto_248014 ) ) ( not ( = ?auto_248012 ?auto_248013 ) ) ( not ( = ?auto_248012 ?auto_248014 ) ) ( not ( = ?auto_248013 ?auto_248014 ) ) ( ON ?auto_248012 ?auto_248013 ) ( ON ?auto_248011 ?auto_248012 ) ( ON ?auto_248010 ?auto_248011 ) ( ON ?auto_248009 ?auto_248010 ) ( ON ?auto_248008 ?auto_248009 ) ( ON ?auto_248007 ?auto_248008 ) ( ON ?auto_248006 ?auto_248007 ) ( CLEAR ?auto_248006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248006 )
      ( MAKE-8PILE ?auto_248006 ?auto_248007 ?auto_248008 ?auto_248009 ?auto_248010 ?auto_248011 ?auto_248012 ?auto_248013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_248023 - BLOCK
      ?auto_248024 - BLOCK
      ?auto_248025 - BLOCK
      ?auto_248026 - BLOCK
      ?auto_248027 - BLOCK
      ?auto_248028 - BLOCK
      ?auto_248029 - BLOCK
      ?auto_248030 - BLOCK
    )
    :vars
    (
      ?auto_248031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248030 ?auto_248031 ) ( not ( = ?auto_248023 ?auto_248024 ) ) ( not ( = ?auto_248023 ?auto_248025 ) ) ( not ( = ?auto_248023 ?auto_248026 ) ) ( not ( = ?auto_248023 ?auto_248027 ) ) ( not ( = ?auto_248023 ?auto_248028 ) ) ( not ( = ?auto_248023 ?auto_248029 ) ) ( not ( = ?auto_248023 ?auto_248030 ) ) ( not ( = ?auto_248023 ?auto_248031 ) ) ( not ( = ?auto_248024 ?auto_248025 ) ) ( not ( = ?auto_248024 ?auto_248026 ) ) ( not ( = ?auto_248024 ?auto_248027 ) ) ( not ( = ?auto_248024 ?auto_248028 ) ) ( not ( = ?auto_248024 ?auto_248029 ) ) ( not ( = ?auto_248024 ?auto_248030 ) ) ( not ( = ?auto_248024 ?auto_248031 ) ) ( not ( = ?auto_248025 ?auto_248026 ) ) ( not ( = ?auto_248025 ?auto_248027 ) ) ( not ( = ?auto_248025 ?auto_248028 ) ) ( not ( = ?auto_248025 ?auto_248029 ) ) ( not ( = ?auto_248025 ?auto_248030 ) ) ( not ( = ?auto_248025 ?auto_248031 ) ) ( not ( = ?auto_248026 ?auto_248027 ) ) ( not ( = ?auto_248026 ?auto_248028 ) ) ( not ( = ?auto_248026 ?auto_248029 ) ) ( not ( = ?auto_248026 ?auto_248030 ) ) ( not ( = ?auto_248026 ?auto_248031 ) ) ( not ( = ?auto_248027 ?auto_248028 ) ) ( not ( = ?auto_248027 ?auto_248029 ) ) ( not ( = ?auto_248027 ?auto_248030 ) ) ( not ( = ?auto_248027 ?auto_248031 ) ) ( not ( = ?auto_248028 ?auto_248029 ) ) ( not ( = ?auto_248028 ?auto_248030 ) ) ( not ( = ?auto_248028 ?auto_248031 ) ) ( not ( = ?auto_248029 ?auto_248030 ) ) ( not ( = ?auto_248029 ?auto_248031 ) ) ( not ( = ?auto_248030 ?auto_248031 ) ) ( ON ?auto_248029 ?auto_248030 ) ( ON ?auto_248028 ?auto_248029 ) ( ON ?auto_248027 ?auto_248028 ) ( ON ?auto_248026 ?auto_248027 ) ( ON ?auto_248025 ?auto_248026 ) ( ON ?auto_248024 ?auto_248025 ) ( ON ?auto_248023 ?auto_248024 ) ( CLEAR ?auto_248023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248023 )
      ( MAKE-8PILE ?auto_248023 ?auto_248024 ?auto_248025 ?auto_248026 ?auto_248027 ?auto_248028 ?auto_248029 ?auto_248030 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248041 - BLOCK
      ?auto_248042 - BLOCK
      ?auto_248043 - BLOCK
      ?auto_248044 - BLOCK
      ?auto_248045 - BLOCK
      ?auto_248046 - BLOCK
      ?auto_248047 - BLOCK
      ?auto_248048 - BLOCK
      ?auto_248049 - BLOCK
    )
    :vars
    (
      ?auto_248050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248048 ) ( ON ?auto_248049 ?auto_248050 ) ( CLEAR ?auto_248049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248041 ) ( ON ?auto_248042 ?auto_248041 ) ( ON ?auto_248043 ?auto_248042 ) ( ON ?auto_248044 ?auto_248043 ) ( ON ?auto_248045 ?auto_248044 ) ( ON ?auto_248046 ?auto_248045 ) ( ON ?auto_248047 ?auto_248046 ) ( ON ?auto_248048 ?auto_248047 ) ( not ( = ?auto_248041 ?auto_248042 ) ) ( not ( = ?auto_248041 ?auto_248043 ) ) ( not ( = ?auto_248041 ?auto_248044 ) ) ( not ( = ?auto_248041 ?auto_248045 ) ) ( not ( = ?auto_248041 ?auto_248046 ) ) ( not ( = ?auto_248041 ?auto_248047 ) ) ( not ( = ?auto_248041 ?auto_248048 ) ) ( not ( = ?auto_248041 ?auto_248049 ) ) ( not ( = ?auto_248041 ?auto_248050 ) ) ( not ( = ?auto_248042 ?auto_248043 ) ) ( not ( = ?auto_248042 ?auto_248044 ) ) ( not ( = ?auto_248042 ?auto_248045 ) ) ( not ( = ?auto_248042 ?auto_248046 ) ) ( not ( = ?auto_248042 ?auto_248047 ) ) ( not ( = ?auto_248042 ?auto_248048 ) ) ( not ( = ?auto_248042 ?auto_248049 ) ) ( not ( = ?auto_248042 ?auto_248050 ) ) ( not ( = ?auto_248043 ?auto_248044 ) ) ( not ( = ?auto_248043 ?auto_248045 ) ) ( not ( = ?auto_248043 ?auto_248046 ) ) ( not ( = ?auto_248043 ?auto_248047 ) ) ( not ( = ?auto_248043 ?auto_248048 ) ) ( not ( = ?auto_248043 ?auto_248049 ) ) ( not ( = ?auto_248043 ?auto_248050 ) ) ( not ( = ?auto_248044 ?auto_248045 ) ) ( not ( = ?auto_248044 ?auto_248046 ) ) ( not ( = ?auto_248044 ?auto_248047 ) ) ( not ( = ?auto_248044 ?auto_248048 ) ) ( not ( = ?auto_248044 ?auto_248049 ) ) ( not ( = ?auto_248044 ?auto_248050 ) ) ( not ( = ?auto_248045 ?auto_248046 ) ) ( not ( = ?auto_248045 ?auto_248047 ) ) ( not ( = ?auto_248045 ?auto_248048 ) ) ( not ( = ?auto_248045 ?auto_248049 ) ) ( not ( = ?auto_248045 ?auto_248050 ) ) ( not ( = ?auto_248046 ?auto_248047 ) ) ( not ( = ?auto_248046 ?auto_248048 ) ) ( not ( = ?auto_248046 ?auto_248049 ) ) ( not ( = ?auto_248046 ?auto_248050 ) ) ( not ( = ?auto_248047 ?auto_248048 ) ) ( not ( = ?auto_248047 ?auto_248049 ) ) ( not ( = ?auto_248047 ?auto_248050 ) ) ( not ( = ?auto_248048 ?auto_248049 ) ) ( not ( = ?auto_248048 ?auto_248050 ) ) ( not ( = ?auto_248049 ?auto_248050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248049 ?auto_248050 )
      ( !STACK ?auto_248049 ?auto_248048 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248060 - BLOCK
      ?auto_248061 - BLOCK
      ?auto_248062 - BLOCK
      ?auto_248063 - BLOCK
      ?auto_248064 - BLOCK
      ?auto_248065 - BLOCK
      ?auto_248066 - BLOCK
      ?auto_248067 - BLOCK
      ?auto_248068 - BLOCK
    )
    :vars
    (
      ?auto_248069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248067 ) ( ON ?auto_248068 ?auto_248069 ) ( CLEAR ?auto_248068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248060 ) ( ON ?auto_248061 ?auto_248060 ) ( ON ?auto_248062 ?auto_248061 ) ( ON ?auto_248063 ?auto_248062 ) ( ON ?auto_248064 ?auto_248063 ) ( ON ?auto_248065 ?auto_248064 ) ( ON ?auto_248066 ?auto_248065 ) ( ON ?auto_248067 ?auto_248066 ) ( not ( = ?auto_248060 ?auto_248061 ) ) ( not ( = ?auto_248060 ?auto_248062 ) ) ( not ( = ?auto_248060 ?auto_248063 ) ) ( not ( = ?auto_248060 ?auto_248064 ) ) ( not ( = ?auto_248060 ?auto_248065 ) ) ( not ( = ?auto_248060 ?auto_248066 ) ) ( not ( = ?auto_248060 ?auto_248067 ) ) ( not ( = ?auto_248060 ?auto_248068 ) ) ( not ( = ?auto_248060 ?auto_248069 ) ) ( not ( = ?auto_248061 ?auto_248062 ) ) ( not ( = ?auto_248061 ?auto_248063 ) ) ( not ( = ?auto_248061 ?auto_248064 ) ) ( not ( = ?auto_248061 ?auto_248065 ) ) ( not ( = ?auto_248061 ?auto_248066 ) ) ( not ( = ?auto_248061 ?auto_248067 ) ) ( not ( = ?auto_248061 ?auto_248068 ) ) ( not ( = ?auto_248061 ?auto_248069 ) ) ( not ( = ?auto_248062 ?auto_248063 ) ) ( not ( = ?auto_248062 ?auto_248064 ) ) ( not ( = ?auto_248062 ?auto_248065 ) ) ( not ( = ?auto_248062 ?auto_248066 ) ) ( not ( = ?auto_248062 ?auto_248067 ) ) ( not ( = ?auto_248062 ?auto_248068 ) ) ( not ( = ?auto_248062 ?auto_248069 ) ) ( not ( = ?auto_248063 ?auto_248064 ) ) ( not ( = ?auto_248063 ?auto_248065 ) ) ( not ( = ?auto_248063 ?auto_248066 ) ) ( not ( = ?auto_248063 ?auto_248067 ) ) ( not ( = ?auto_248063 ?auto_248068 ) ) ( not ( = ?auto_248063 ?auto_248069 ) ) ( not ( = ?auto_248064 ?auto_248065 ) ) ( not ( = ?auto_248064 ?auto_248066 ) ) ( not ( = ?auto_248064 ?auto_248067 ) ) ( not ( = ?auto_248064 ?auto_248068 ) ) ( not ( = ?auto_248064 ?auto_248069 ) ) ( not ( = ?auto_248065 ?auto_248066 ) ) ( not ( = ?auto_248065 ?auto_248067 ) ) ( not ( = ?auto_248065 ?auto_248068 ) ) ( not ( = ?auto_248065 ?auto_248069 ) ) ( not ( = ?auto_248066 ?auto_248067 ) ) ( not ( = ?auto_248066 ?auto_248068 ) ) ( not ( = ?auto_248066 ?auto_248069 ) ) ( not ( = ?auto_248067 ?auto_248068 ) ) ( not ( = ?auto_248067 ?auto_248069 ) ) ( not ( = ?auto_248068 ?auto_248069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248068 ?auto_248069 )
      ( !STACK ?auto_248068 ?auto_248067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248079 - BLOCK
      ?auto_248080 - BLOCK
      ?auto_248081 - BLOCK
      ?auto_248082 - BLOCK
      ?auto_248083 - BLOCK
      ?auto_248084 - BLOCK
      ?auto_248085 - BLOCK
      ?auto_248086 - BLOCK
      ?auto_248087 - BLOCK
    )
    :vars
    (
      ?auto_248088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248087 ?auto_248088 ) ( ON-TABLE ?auto_248079 ) ( ON ?auto_248080 ?auto_248079 ) ( ON ?auto_248081 ?auto_248080 ) ( ON ?auto_248082 ?auto_248081 ) ( ON ?auto_248083 ?auto_248082 ) ( ON ?auto_248084 ?auto_248083 ) ( ON ?auto_248085 ?auto_248084 ) ( not ( = ?auto_248079 ?auto_248080 ) ) ( not ( = ?auto_248079 ?auto_248081 ) ) ( not ( = ?auto_248079 ?auto_248082 ) ) ( not ( = ?auto_248079 ?auto_248083 ) ) ( not ( = ?auto_248079 ?auto_248084 ) ) ( not ( = ?auto_248079 ?auto_248085 ) ) ( not ( = ?auto_248079 ?auto_248086 ) ) ( not ( = ?auto_248079 ?auto_248087 ) ) ( not ( = ?auto_248079 ?auto_248088 ) ) ( not ( = ?auto_248080 ?auto_248081 ) ) ( not ( = ?auto_248080 ?auto_248082 ) ) ( not ( = ?auto_248080 ?auto_248083 ) ) ( not ( = ?auto_248080 ?auto_248084 ) ) ( not ( = ?auto_248080 ?auto_248085 ) ) ( not ( = ?auto_248080 ?auto_248086 ) ) ( not ( = ?auto_248080 ?auto_248087 ) ) ( not ( = ?auto_248080 ?auto_248088 ) ) ( not ( = ?auto_248081 ?auto_248082 ) ) ( not ( = ?auto_248081 ?auto_248083 ) ) ( not ( = ?auto_248081 ?auto_248084 ) ) ( not ( = ?auto_248081 ?auto_248085 ) ) ( not ( = ?auto_248081 ?auto_248086 ) ) ( not ( = ?auto_248081 ?auto_248087 ) ) ( not ( = ?auto_248081 ?auto_248088 ) ) ( not ( = ?auto_248082 ?auto_248083 ) ) ( not ( = ?auto_248082 ?auto_248084 ) ) ( not ( = ?auto_248082 ?auto_248085 ) ) ( not ( = ?auto_248082 ?auto_248086 ) ) ( not ( = ?auto_248082 ?auto_248087 ) ) ( not ( = ?auto_248082 ?auto_248088 ) ) ( not ( = ?auto_248083 ?auto_248084 ) ) ( not ( = ?auto_248083 ?auto_248085 ) ) ( not ( = ?auto_248083 ?auto_248086 ) ) ( not ( = ?auto_248083 ?auto_248087 ) ) ( not ( = ?auto_248083 ?auto_248088 ) ) ( not ( = ?auto_248084 ?auto_248085 ) ) ( not ( = ?auto_248084 ?auto_248086 ) ) ( not ( = ?auto_248084 ?auto_248087 ) ) ( not ( = ?auto_248084 ?auto_248088 ) ) ( not ( = ?auto_248085 ?auto_248086 ) ) ( not ( = ?auto_248085 ?auto_248087 ) ) ( not ( = ?auto_248085 ?auto_248088 ) ) ( not ( = ?auto_248086 ?auto_248087 ) ) ( not ( = ?auto_248086 ?auto_248088 ) ) ( not ( = ?auto_248087 ?auto_248088 ) ) ( CLEAR ?auto_248085 ) ( ON ?auto_248086 ?auto_248087 ) ( CLEAR ?auto_248086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248079 ?auto_248080 ?auto_248081 ?auto_248082 ?auto_248083 ?auto_248084 ?auto_248085 ?auto_248086 )
      ( MAKE-9PILE ?auto_248079 ?auto_248080 ?auto_248081 ?auto_248082 ?auto_248083 ?auto_248084 ?auto_248085 ?auto_248086 ?auto_248087 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248098 - BLOCK
      ?auto_248099 - BLOCK
      ?auto_248100 - BLOCK
      ?auto_248101 - BLOCK
      ?auto_248102 - BLOCK
      ?auto_248103 - BLOCK
      ?auto_248104 - BLOCK
      ?auto_248105 - BLOCK
      ?auto_248106 - BLOCK
    )
    :vars
    (
      ?auto_248107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248106 ?auto_248107 ) ( ON-TABLE ?auto_248098 ) ( ON ?auto_248099 ?auto_248098 ) ( ON ?auto_248100 ?auto_248099 ) ( ON ?auto_248101 ?auto_248100 ) ( ON ?auto_248102 ?auto_248101 ) ( ON ?auto_248103 ?auto_248102 ) ( ON ?auto_248104 ?auto_248103 ) ( not ( = ?auto_248098 ?auto_248099 ) ) ( not ( = ?auto_248098 ?auto_248100 ) ) ( not ( = ?auto_248098 ?auto_248101 ) ) ( not ( = ?auto_248098 ?auto_248102 ) ) ( not ( = ?auto_248098 ?auto_248103 ) ) ( not ( = ?auto_248098 ?auto_248104 ) ) ( not ( = ?auto_248098 ?auto_248105 ) ) ( not ( = ?auto_248098 ?auto_248106 ) ) ( not ( = ?auto_248098 ?auto_248107 ) ) ( not ( = ?auto_248099 ?auto_248100 ) ) ( not ( = ?auto_248099 ?auto_248101 ) ) ( not ( = ?auto_248099 ?auto_248102 ) ) ( not ( = ?auto_248099 ?auto_248103 ) ) ( not ( = ?auto_248099 ?auto_248104 ) ) ( not ( = ?auto_248099 ?auto_248105 ) ) ( not ( = ?auto_248099 ?auto_248106 ) ) ( not ( = ?auto_248099 ?auto_248107 ) ) ( not ( = ?auto_248100 ?auto_248101 ) ) ( not ( = ?auto_248100 ?auto_248102 ) ) ( not ( = ?auto_248100 ?auto_248103 ) ) ( not ( = ?auto_248100 ?auto_248104 ) ) ( not ( = ?auto_248100 ?auto_248105 ) ) ( not ( = ?auto_248100 ?auto_248106 ) ) ( not ( = ?auto_248100 ?auto_248107 ) ) ( not ( = ?auto_248101 ?auto_248102 ) ) ( not ( = ?auto_248101 ?auto_248103 ) ) ( not ( = ?auto_248101 ?auto_248104 ) ) ( not ( = ?auto_248101 ?auto_248105 ) ) ( not ( = ?auto_248101 ?auto_248106 ) ) ( not ( = ?auto_248101 ?auto_248107 ) ) ( not ( = ?auto_248102 ?auto_248103 ) ) ( not ( = ?auto_248102 ?auto_248104 ) ) ( not ( = ?auto_248102 ?auto_248105 ) ) ( not ( = ?auto_248102 ?auto_248106 ) ) ( not ( = ?auto_248102 ?auto_248107 ) ) ( not ( = ?auto_248103 ?auto_248104 ) ) ( not ( = ?auto_248103 ?auto_248105 ) ) ( not ( = ?auto_248103 ?auto_248106 ) ) ( not ( = ?auto_248103 ?auto_248107 ) ) ( not ( = ?auto_248104 ?auto_248105 ) ) ( not ( = ?auto_248104 ?auto_248106 ) ) ( not ( = ?auto_248104 ?auto_248107 ) ) ( not ( = ?auto_248105 ?auto_248106 ) ) ( not ( = ?auto_248105 ?auto_248107 ) ) ( not ( = ?auto_248106 ?auto_248107 ) ) ( CLEAR ?auto_248104 ) ( ON ?auto_248105 ?auto_248106 ) ( CLEAR ?auto_248105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248098 ?auto_248099 ?auto_248100 ?auto_248101 ?auto_248102 ?auto_248103 ?auto_248104 ?auto_248105 )
      ( MAKE-9PILE ?auto_248098 ?auto_248099 ?auto_248100 ?auto_248101 ?auto_248102 ?auto_248103 ?auto_248104 ?auto_248105 ?auto_248106 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248117 - BLOCK
      ?auto_248118 - BLOCK
      ?auto_248119 - BLOCK
      ?auto_248120 - BLOCK
      ?auto_248121 - BLOCK
      ?auto_248122 - BLOCK
      ?auto_248123 - BLOCK
      ?auto_248124 - BLOCK
      ?auto_248125 - BLOCK
    )
    :vars
    (
      ?auto_248126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248125 ?auto_248126 ) ( ON-TABLE ?auto_248117 ) ( ON ?auto_248118 ?auto_248117 ) ( ON ?auto_248119 ?auto_248118 ) ( ON ?auto_248120 ?auto_248119 ) ( ON ?auto_248121 ?auto_248120 ) ( ON ?auto_248122 ?auto_248121 ) ( not ( = ?auto_248117 ?auto_248118 ) ) ( not ( = ?auto_248117 ?auto_248119 ) ) ( not ( = ?auto_248117 ?auto_248120 ) ) ( not ( = ?auto_248117 ?auto_248121 ) ) ( not ( = ?auto_248117 ?auto_248122 ) ) ( not ( = ?auto_248117 ?auto_248123 ) ) ( not ( = ?auto_248117 ?auto_248124 ) ) ( not ( = ?auto_248117 ?auto_248125 ) ) ( not ( = ?auto_248117 ?auto_248126 ) ) ( not ( = ?auto_248118 ?auto_248119 ) ) ( not ( = ?auto_248118 ?auto_248120 ) ) ( not ( = ?auto_248118 ?auto_248121 ) ) ( not ( = ?auto_248118 ?auto_248122 ) ) ( not ( = ?auto_248118 ?auto_248123 ) ) ( not ( = ?auto_248118 ?auto_248124 ) ) ( not ( = ?auto_248118 ?auto_248125 ) ) ( not ( = ?auto_248118 ?auto_248126 ) ) ( not ( = ?auto_248119 ?auto_248120 ) ) ( not ( = ?auto_248119 ?auto_248121 ) ) ( not ( = ?auto_248119 ?auto_248122 ) ) ( not ( = ?auto_248119 ?auto_248123 ) ) ( not ( = ?auto_248119 ?auto_248124 ) ) ( not ( = ?auto_248119 ?auto_248125 ) ) ( not ( = ?auto_248119 ?auto_248126 ) ) ( not ( = ?auto_248120 ?auto_248121 ) ) ( not ( = ?auto_248120 ?auto_248122 ) ) ( not ( = ?auto_248120 ?auto_248123 ) ) ( not ( = ?auto_248120 ?auto_248124 ) ) ( not ( = ?auto_248120 ?auto_248125 ) ) ( not ( = ?auto_248120 ?auto_248126 ) ) ( not ( = ?auto_248121 ?auto_248122 ) ) ( not ( = ?auto_248121 ?auto_248123 ) ) ( not ( = ?auto_248121 ?auto_248124 ) ) ( not ( = ?auto_248121 ?auto_248125 ) ) ( not ( = ?auto_248121 ?auto_248126 ) ) ( not ( = ?auto_248122 ?auto_248123 ) ) ( not ( = ?auto_248122 ?auto_248124 ) ) ( not ( = ?auto_248122 ?auto_248125 ) ) ( not ( = ?auto_248122 ?auto_248126 ) ) ( not ( = ?auto_248123 ?auto_248124 ) ) ( not ( = ?auto_248123 ?auto_248125 ) ) ( not ( = ?auto_248123 ?auto_248126 ) ) ( not ( = ?auto_248124 ?auto_248125 ) ) ( not ( = ?auto_248124 ?auto_248126 ) ) ( not ( = ?auto_248125 ?auto_248126 ) ) ( ON ?auto_248124 ?auto_248125 ) ( CLEAR ?auto_248122 ) ( ON ?auto_248123 ?auto_248124 ) ( CLEAR ?auto_248123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248117 ?auto_248118 ?auto_248119 ?auto_248120 ?auto_248121 ?auto_248122 ?auto_248123 )
      ( MAKE-9PILE ?auto_248117 ?auto_248118 ?auto_248119 ?auto_248120 ?auto_248121 ?auto_248122 ?auto_248123 ?auto_248124 ?auto_248125 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248136 - BLOCK
      ?auto_248137 - BLOCK
      ?auto_248138 - BLOCK
      ?auto_248139 - BLOCK
      ?auto_248140 - BLOCK
      ?auto_248141 - BLOCK
      ?auto_248142 - BLOCK
      ?auto_248143 - BLOCK
      ?auto_248144 - BLOCK
    )
    :vars
    (
      ?auto_248145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248144 ?auto_248145 ) ( ON-TABLE ?auto_248136 ) ( ON ?auto_248137 ?auto_248136 ) ( ON ?auto_248138 ?auto_248137 ) ( ON ?auto_248139 ?auto_248138 ) ( ON ?auto_248140 ?auto_248139 ) ( ON ?auto_248141 ?auto_248140 ) ( not ( = ?auto_248136 ?auto_248137 ) ) ( not ( = ?auto_248136 ?auto_248138 ) ) ( not ( = ?auto_248136 ?auto_248139 ) ) ( not ( = ?auto_248136 ?auto_248140 ) ) ( not ( = ?auto_248136 ?auto_248141 ) ) ( not ( = ?auto_248136 ?auto_248142 ) ) ( not ( = ?auto_248136 ?auto_248143 ) ) ( not ( = ?auto_248136 ?auto_248144 ) ) ( not ( = ?auto_248136 ?auto_248145 ) ) ( not ( = ?auto_248137 ?auto_248138 ) ) ( not ( = ?auto_248137 ?auto_248139 ) ) ( not ( = ?auto_248137 ?auto_248140 ) ) ( not ( = ?auto_248137 ?auto_248141 ) ) ( not ( = ?auto_248137 ?auto_248142 ) ) ( not ( = ?auto_248137 ?auto_248143 ) ) ( not ( = ?auto_248137 ?auto_248144 ) ) ( not ( = ?auto_248137 ?auto_248145 ) ) ( not ( = ?auto_248138 ?auto_248139 ) ) ( not ( = ?auto_248138 ?auto_248140 ) ) ( not ( = ?auto_248138 ?auto_248141 ) ) ( not ( = ?auto_248138 ?auto_248142 ) ) ( not ( = ?auto_248138 ?auto_248143 ) ) ( not ( = ?auto_248138 ?auto_248144 ) ) ( not ( = ?auto_248138 ?auto_248145 ) ) ( not ( = ?auto_248139 ?auto_248140 ) ) ( not ( = ?auto_248139 ?auto_248141 ) ) ( not ( = ?auto_248139 ?auto_248142 ) ) ( not ( = ?auto_248139 ?auto_248143 ) ) ( not ( = ?auto_248139 ?auto_248144 ) ) ( not ( = ?auto_248139 ?auto_248145 ) ) ( not ( = ?auto_248140 ?auto_248141 ) ) ( not ( = ?auto_248140 ?auto_248142 ) ) ( not ( = ?auto_248140 ?auto_248143 ) ) ( not ( = ?auto_248140 ?auto_248144 ) ) ( not ( = ?auto_248140 ?auto_248145 ) ) ( not ( = ?auto_248141 ?auto_248142 ) ) ( not ( = ?auto_248141 ?auto_248143 ) ) ( not ( = ?auto_248141 ?auto_248144 ) ) ( not ( = ?auto_248141 ?auto_248145 ) ) ( not ( = ?auto_248142 ?auto_248143 ) ) ( not ( = ?auto_248142 ?auto_248144 ) ) ( not ( = ?auto_248142 ?auto_248145 ) ) ( not ( = ?auto_248143 ?auto_248144 ) ) ( not ( = ?auto_248143 ?auto_248145 ) ) ( not ( = ?auto_248144 ?auto_248145 ) ) ( ON ?auto_248143 ?auto_248144 ) ( CLEAR ?auto_248141 ) ( ON ?auto_248142 ?auto_248143 ) ( CLEAR ?auto_248142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248136 ?auto_248137 ?auto_248138 ?auto_248139 ?auto_248140 ?auto_248141 ?auto_248142 )
      ( MAKE-9PILE ?auto_248136 ?auto_248137 ?auto_248138 ?auto_248139 ?auto_248140 ?auto_248141 ?auto_248142 ?auto_248143 ?auto_248144 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248155 - BLOCK
      ?auto_248156 - BLOCK
      ?auto_248157 - BLOCK
      ?auto_248158 - BLOCK
      ?auto_248159 - BLOCK
      ?auto_248160 - BLOCK
      ?auto_248161 - BLOCK
      ?auto_248162 - BLOCK
      ?auto_248163 - BLOCK
    )
    :vars
    (
      ?auto_248164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248163 ?auto_248164 ) ( ON-TABLE ?auto_248155 ) ( ON ?auto_248156 ?auto_248155 ) ( ON ?auto_248157 ?auto_248156 ) ( ON ?auto_248158 ?auto_248157 ) ( ON ?auto_248159 ?auto_248158 ) ( not ( = ?auto_248155 ?auto_248156 ) ) ( not ( = ?auto_248155 ?auto_248157 ) ) ( not ( = ?auto_248155 ?auto_248158 ) ) ( not ( = ?auto_248155 ?auto_248159 ) ) ( not ( = ?auto_248155 ?auto_248160 ) ) ( not ( = ?auto_248155 ?auto_248161 ) ) ( not ( = ?auto_248155 ?auto_248162 ) ) ( not ( = ?auto_248155 ?auto_248163 ) ) ( not ( = ?auto_248155 ?auto_248164 ) ) ( not ( = ?auto_248156 ?auto_248157 ) ) ( not ( = ?auto_248156 ?auto_248158 ) ) ( not ( = ?auto_248156 ?auto_248159 ) ) ( not ( = ?auto_248156 ?auto_248160 ) ) ( not ( = ?auto_248156 ?auto_248161 ) ) ( not ( = ?auto_248156 ?auto_248162 ) ) ( not ( = ?auto_248156 ?auto_248163 ) ) ( not ( = ?auto_248156 ?auto_248164 ) ) ( not ( = ?auto_248157 ?auto_248158 ) ) ( not ( = ?auto_248157 ?auto_248159 ) ) ( not ( = ?auto_248157 ?auto_248160 ) ) ( not ( = ?auto_248157 ?auto_248161 ) ) ( not ( = ?auto_248157 ?auto_248162 ) ) ( not ( = ?auto_248157 ?auto_248163 ) ) ( not ( = ?auto_248157 ?auto_248164 ) ) ( not ( = ?auto_248158 ?auto_248159 ) ) ( not ( = ?auto_248158 ?auto_248160 ) ) ( not ( = ?auto_248158 ?auto_248161 ) ) ( not ( = ?auto_248158 ?auto_248162 ) ) ( not ( = ?auto_248158 ?auto_248163 ) ) ( not ( = ?auto_248158 ?auto_248164 ) ) ( not ( = ?auto_248159 ?auto_248160 ) ) ( not ( = ?auto_248159 ?auto_248161 ) ) ( not ( = ?auto_248159 ?auto_248162 ) ) ( not ( = ?auto_248159 ?auto_248163 ) ) ( not ( = ?auto_248159 ?auto_248164 ) ) ( not ( = ?auto_248160 ?auto_248161 ) ) ( not ( = ?auto_248160 ?auto_248162 ) ) ( not ( = ?auto_248160 ?auto_248163 ) ) ( not ( = ?auto_248160 ?auto_248164 ) ) ( not ( = ?auto_248161 ?auto_248162 ) ) ( not ( = ?auto_248161 ?auto_248163 ) ) ( not ( = ?auto_248161 ?auto_248164 ) ) ( not ( = ?auto_248162 ?auto_248163 ) ) ( not ( = ?auto_248162 ?auto_248164 ) ) ( not ( = ?auto_248163 ?auto_248164 ) ) ( ON ?auto_248162 ?auto_248163 ) ( ON ?auto_248161 ?auto_248162 ) ( CLEAR ?auto_248159 ) ( ON ?auto_248160 ?auto_248161 ) ( CLEAR ?auto_248160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248155 ?auto_248156 ?auto_248157 ?auto_248158 ?auto_248159 ?auto_248160 )
      ( MAKE-9PILE ?auto_248155 ?auto_248156 ?auto_248157 ?auto_248158 ?auto_248159 ?auto_248160 ?auto_248161 ?auto_248162 ?auto_248163 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248174 - BLOCK
      ?auto_248175 - BLOCK
      ?auto_248176 - BLOCK
      ?auto_248177 - BLOCK
      ?auto_248178 - BLOCK
      ?auto_248179 - BLOCK
      ?auto_248180 - BLOCK
      ?auto_248181 - BLOCK
      ?auto_248182 - BLOCK
    )
    :vars
    (
      ?auto_248183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248182 ?auto_248183 ) ( ON-TABLE ?auto_248174 ) ( ON ?auto_248175 ?auto_248174 ) ( ON ?auto_248176 ?auto_248175 ) ( ON ?auto_248177 ?auto_248176 ) ( ON ?auto_248178 ?auto_248177 ) ( not ( = ?auto_248174 ?auto_248175 ) ) ( not ( = ?auto_248174 ?auto_248176 ) ) ( not ( = ?auto_248174 ?auto_248177 ) ) ( not ( = ?auto_248174 ?auto_248178 ) ) ( not ( = ?auto_248174 ?auto_248179 ) ) ( not ( = ?auto_248174 ?auto_248180 ) ) ( not ( = ?auto_248174 ?auto_248181 ) ) ( not ( = ?auto_248174 ?auto_248182 ) ) ( not ( = ?auto_248174 ?auto_248183 ) ) ( not ( = ?auto_248175 ?auto_248176 ) ) ( not ( = ?auto_248175 ?auto_248177 ) ) ( not ( = ?auto_248175 ?auto_248178 ) ) ( not ( = ?auto_248175 ?auto_248179 ) ) ( not ( = ?auto_248175 ?auto_248180 ) ) ( not ( = ?auto_248175 ?auto_248181 ) ) ( not ( = ?auto_248175 ?auto_248182 ) ) ( not ( = ?auto_248175 ?auto_248183 ) ) ( not ( = ?auto_248176 ?auto_248177 ) ) ( not ( = ?auto_248176 ?auto_248178 ) ) ( not ( = ?auto_248176 ?auto_248179 ) ) ( not ( = ?auto_248176 ?auto_248180 ) ) ( not ( = ?auto_248176 ?auto_248181 ) ) ( not ( = ?auto_248176 ?auto_248182 ) ) ( not ( = ?auto_248176 ?auto_248183 ) ) ( not ( = ?auto_248177 ?auto_248178 ) ) ( not ( = ?auto_248177 ?auto_248179 ) ) ( not ( = ?auto_248177 ?auto_248180 ) ) ( not ( = ?auto_248177 ?auto_248181 ) ) ( not ( = ?auto_248177 ?auto_248182 ) ) ( not ( = ?auto_248177 ?auto_248183 ) ) ( not ( = ?auto_248178 ?auto_248179 ) ) ( not ( = ?auto_248178 ?auto_248180 ) ) ( not ( = ?auto_248178 ?auto_248181 ) ) ( not ( = ?auto_248178 ?auto_248182 ) ) ( not ( = ?auto_248178 ?auto_248183 ) ) ( not ( = ?auto_248179 ?auto_248180 ) ) ( not ( = ?auto_248179 ?auto_248181 ) ) ( not ( = ?auto_248179 ?auto_248182 ) ) ( not ( = ?auto_248179 ?auto_248183 ) ) ( not ( = ?auto_248180 ?auto_248181 ) ) ( not ( = ?auto_248180 ?auto_248182 ) ) ( not ( = ?auto_248180 ?auto_248183 ) ) ( not ( = ?auto_248181 ?auto_248182 ) ) ( not ( = ?auto_248181 ?auto_248183 ) ) ( not ( = ?auto_248182 ?auto_248183 ) ) ( ON ?auto_248181 ?auto_248182 ) ( ON ?auto_248180 ?auto_248181 ) ( CLEAR ?auto_248178 ) ( ON ?auto_248179 ?auto_248180 ) ( CLEAR ?auto_248179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248174 ?auto_248175 ?auto_248176 ?auto_248177 ?auto_248178 ?auto_248179 )
      ( MAKE-9PILE ?auto_248174 ?auto_248175 ?auto_248176 ?auto_248177 ?auto_248178 ?auto_248179 ?auto_248180 ?auto_248181 ?auto_248182 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248193 - BLOCK
      ?auto_248194 - BLOCK
      ?auto_248195 - BLOCK
      ?auto_248196 - BLOCK
      ?auto_248197 - BLOCK
      ?auto_248198 - BLOCK
      ?auto_248199 - BLOCK
      ?auto_248200 - BLOCK
      ?auto_248201 - BLOCK
    )
    :vars
    (
      ?auto_248202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248201 ?auto_248202 ) ( ON-TABLE ?auto_248193 ) ( ON ?auto_248194 ?auto_248193 ) ( ON ?auto_248195 ?auto_248194 ) ( ON ?auto_248196 ?auto_248195 ) ( not ( = ?auto_248193 ?auto_248194 ) ) ( not ( = ?auto_248193 ?auto_248195 ) ) ( not ( = ?auto_248193 ?auto_248196 ) ) ( not ( = ?auto_248193 ?auto_248197 ) ) ( not ( = ?auto_248193 ?auto_248198 ) ) ( not ( = ?auto_248193 ?auto_248199 ) ) ( not ( = ?auto_248193 ?auto_248200 ) ) ( not ( = ?auto_248193 ?auto_248201 ) ) ( not ( = ?auto_248193 ?auto_248202 ) ) ( not ( = ?auto_248194 ?auto_248195 ) ) ( not ( = ?auto_248194 ?auto_248196 ) ) ( not ( = ?auto_248194 ?auto_248197 ) ) ( not ( = ?auto_248194 ?auto_248198 ) ) ( not ( = ?auto_248194 ?auto_248199 ) ) ( not ( = ?auto_248194 ?auto_248200 ) ) ( not ( = ?auto_248194 ?auto_248201 ) ) ( not ( = ?auto_248194 ?auto_248202 ) ) ( not ( = ?auto_248195 ?auto_248196 ) ) ( not ( = ?auto_248195 ?auto_248197 ) ) ( not ( = ?auto_248195 ?auto_248198 ) ) ( not ( = ?auto_248195 ?auto_248199 ) ) ( not ( = ?auto_248195 ?auto_248200 ) ) ( not ( = ?auto_248195 ?auto_248201 ) ) ( not ( = ?auto_248195 ?auto_248202 ) ) ( not ( = ?auto_248196 ?auto_248197 ) ) ( not ( = ?auto_248196 ?auto_248198 ) ) ( not ( = ?auto_248196 ?auto_248199 ) ) ( not ( = ?auto_248196 ?auto_248200 ) ) ( not ( = ?auto_248196 ?auto_248201 ) ) ( not ( = ?auto_248196 ?auto_248202 ) ) ( not ( = ?auto_248197 ?auto_248198 ) ) ( not ( = ?auto_248197 ?auto_248199 ) ) ( not ( = ?auto_248197 ?auto_248200 ) ) ( not ( = ?auto_248197 ?auto_248201 ) ) ( not ( = ?auto_248197 ?auto_248202 ) ) ( not ( = ?auto_248198 ?auto_248199 ) ) ( not ( = ?auto_248198 ?auto_248200 ) ) ( not ( = ?auto_248198 ?auto_248201 ) ) ( not ( = ?auto_248198 ?auto_248202 ) ) ( not ( = ?auto_248199 ?auto_248200 ) ) ( not ( = ?auto_248199 ?auto_248201 ) ) ( not ( = ?auto_248199 ?auto_248202 ) ) ( not ( = ?auto_248200 ?auto_248201 ) ) ( not ( = ?auto_248200 ?auto_248202 ) ) ( not ( = ?auto_248201 ?auto_248202 ) ) ( ON ?auto_248200 ?auto_248201 ) ( ON ?auto_248199 ?auto_248200 ) ( ON ?auto_248198 ?auto_248199 ) ( CLEAR ?auto_248196 ) ( ON ?auto_248197 ?auto_248198 ) ( CLEAR ?auto_248197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248193 ?auto_248194 ?auto_248195 ?auto_248196 ?auto_248197 )
      ( MAKE-9PILE ?auto_248193 ?auto_248194 ?auto_248195 ?auto_248196 ?auto_248197 ?auto_248198 ?auto_248199 ?auto_248200 ?auto_248201 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248212 - BLOCK
      ?auto_248213 - BLOCK
      ?auto_248214 - BLOCK
      ?auto_248215 - BLOCK
      ?auto_248216 - BLOCK
      ?auto_248217 - BLOCK
      ?auto_248218 - BLOCK
      ?auto_248219 - BLOCK
      ?auto_248220 - BLOCK
    )
    :vars
    (
      ?auto_248221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248220 ?auto_248221 ) ( ON-TABLE ?auto_248212 ) ( ON ?auto_248213 ?auto_248212 ) ( ON ?auto_248214 ?auto_248213 ) ( ON ?auto_248215 ?auto_248214 ) ( not ( = ?auto_248212 ?auto_248213 ) ) ( not ( = ?auto_248212 ?auto_248214 ) ) ( not ( = ?auto_248212 ?auto_248215 ) ) ( not ( = ?auto_248212 ?auto_248216 ) ) ( not ( = ?auto_248212 ?auto_248217 ) ) ( not ( = ?auto_248212 ?auto_248218 ) ) ( not ( = ?auto_248212 ?auto_248219 ) ) ( not ( = ?auto_248212 ?auto_248220 ) ) ( not ( = ?auto_248212 ?auto_248221 ) ) ( not ( = ?auto_248213 ?auto_248214 ) ) ( not ( = ?auto_248213 ?auto_248215 ) ) ( not ( = ?auto_248213 ?auto_248216 ) ) ( not ( = ?auto_248213 ?auto_248217 ) ) ( not ( = ?auto_248213 ?auto_248218 ) ) ( not ( = ?auto_248213 ?auto_248219 ) ) ( not ( = ?auto_248213 ?auto_248220 ) ) ( not ( = ?auto_248213 ?auto_248221 ) ) ( not ( = ?auto_248214 ?auto_248215 ) ) ( not ( = ?auto_248214 ?auto_248216 ) ) ( not ( = ?auto_248214 ?auto_248217 ) ) ( not ( = ?auto_248214 ?auto_248218 ) ) ( not ( = ?auto_248214 ?auto_248219 ) ) ( not ( = ?auto_248214 ?auto_248220 ) ) ( not ( = ?auto_248214 ?auto_248221 ) ) ( not ( = ?auto_248215 ?auto_248216 ) ) ( not ( = ?auto_248215 ?auto_248217 ) ) ( not ( = ?auto_248215 ?auto_248218 ) ) ( not ( = ?auto_248215 ?auto_248219 ) ) ( not ( = ?auto_248215 ?auto_248220 ) ) ( not ( = ?auto_248215 ?auto_248221 ) ) ( not ( = ?auto_248216 ?auto_248217 ) ) ( not ( = ?auto_248216 ?auto_248218 ) ) ( not ( = ?auto_248216 ?auto_248219 ) ) ( not ( = ?auto_248216 ?auto_248220 ) ) ( not ( = ?auto_248216 ?auto_248221 ) ) ( not ( = ?auto_248217 ?auto_248218 ) ) ( not ( = ?auto_248217 ?auto_248219 ) ) ( not ( = ?auto_248217 ?auto_248220 ) ) ( not ( = ?auto_248217 ?auto_248221 ) ) ( not ( = ?auto_248218 ?auto_248219 ) ) ( not ( = ?auto_248218 ?auto_248220 ) ) ( not ( = ?auto_248218 ?auto_248221 ) ) ( not ( = ?auto_248219 ?auto_248220 ) ) ( not ( = ?auto_248219 ?auto_248221 ) ) ( not ( = ?auto_248220 ?auto_248221 ) ) ( ON ?auto_248219 ?auto_248220 ) ( ON ?auto_248218 ?auto_248219 ) ( ON ?auto_248217 ?auto_248218 ) ( CLEAR ?auto_248215 ) ( ON ?auto_248216 ?auto_248217 ) ( CLEAR ?auto_248216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248212 ?auto_248213 ?auto_248214 ?auto_248215 ?auto_248216 )
      ( MAKE-9PILE ?auto_248212 ?auto_248213 ?auto_248214 ?auto_248215 ?auto_248216 ?auto_248217 ?auto_248218 ?auto_248219 ?auto_248220 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248231 - BLOCK
      ?auto_248232 - BLOCK
      ?auto_248233 - BLOCK
      ?auto_248234 - BLOCK
      ?auto_248235 - BLOCK
      ?auto_248236 - BLOCK
      ?auto_248237 - BLOCK
      ?auto_248238 - BLOCK
      ?auto_248239 - BLOCK
    )
    :vars
    (
      ?auto_248240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248239 ?auto_248240 ) ( ON-TABLE ?auto_248231 ) ( ON ?auto_248232 ?auto_248231 ) ( ON ?auto_248233 ?auto_248232 ) ( not ( = ?auto_248231 ?auto_248232 ) ) ( not ( = ?auto_248231 ?auto_248233 ) ) ( not ( = ?auto_248231 ?auto_248234 ) ) ( not ( = ?auto_248231 ?auto_248235 ) ) ( not ( = ?auto_248231 ?auto_248236 ) ) ( not ( = ?auto_248231 ?auto_248237 ) ) ( not ( = ?auto_248231 ?auto_248238 ) ) ( not ( = ?auto_248231 ?auto_248239 ) ) ( not ( = ?auto_248231 ?auto_248240 ) ) ( not ( = ?auto_248232 ?auto_248233 ) ) ( not ( = ?auto_248232 ?auto_248234 ) ) ( not ( = ?auto_248232 ?auto_248235 ) ) ( not ( = ?auto_248232 ?auto_248236 ) ) ( not ( = ?auto_248232 ?auto_248237 ) ) ( not ( = ?auto_248232 ?auto_248238 ) ) ( not ( = ?auto_248232 ?auto_248239 ) ) ( not ( = ?auto_248232 ?auto_248240 ) ) ( not ( = ?auto_248233 ?auto_248234 ) ) ( not ( = ?auto_248233 ?auto_248235 ) ) ( not ( = ?auto_248233 ?auto_248236 ) ) ( not ( = ?auto_248233 ?auto_248237 ) ) ( not ( = ?auto_248233 ?auto_248238 ) ) ( not ( = ?auto_248233 ?auto_248239 ) ) ( not ( = ?auto_248233 ?auto_248240 ) ) ( not ( = ?auto_248234 ?auto_248235 ) ) ( not ( = ?auto_248234 ?auto_248236 ) ) ( not ( = ?auto_248234 ?auto_248237 ) ) ( not ( = ?auto_248234 ?auto_248238 ) ) ( not ( = ?auto_248234 ?auto_248239 ) ) ( not ( = ?auto_248234 ?auto_248240 ) ) ( not ( = ?auto_248235 ?auto_248236 ) ) ( not ( = ?auto_248235 ?auto_248237 ) ) ( not ( = ?auto_248235 ?auto_248238 ) ) ( not ( = ?auto_248235 ?auto_248239 ) ) ( not ( = ?auto_248235 ?auto_248240 ) ) ( not ( = ?auto_248236 ?auto_248237 ) ) ( not ( = ?auto_248236 ?auto_248238 ) ) ( not ( = ?auto_248236 ?auto_248239 ) ) ( not ( = ?auto_248236 ?auto_248240 ) ) ( not ( = ?auto_248237 ?auto_248238 ) ) ( not ( = ?auto_248237 ?auto_248239 ) ) ( not ( = ?auto_248237 ?auto_248240 ) ) ( not ( = ?auto_248238 ?auto_248239 ) ) ( not ( = ?auto_248238 ?auto_248240 ) ) ( not ( = ?auto_248239 ?auto_248240 ) ) ( ON ?auto_248238 ?auto_248239 ) ( ON ?auto_248237 ?auto_248238 ) ( ON ?auto_248236 ?auto_248237 ) ( ON ?auto_248235 ?auto_248236 ) ( CLEAR ?auto_248233 ) ( ON ?auto_248234 ?auto_248235 ) ( CLEAR ?auto_248234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248231 ?auto_248232 ?auto_248233 ?auto_248234 )
      ( MAKE-9PILE ?auto_248231 ?auto_248232 ?auto_248233 ?auto_248234 ?auto_248235 ?auto_248236 ?auto_248237 ?auto_248238 ?auto_248239 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248250 - BLOCK
      ?auto_248251 - BLOCK
      ?auto_248252 - BLOCK
      ?auto_248253 - BLOCK
      ?auto_248254 - BLOCK
      ?auto_248255 - BLOCK
      ?auto_248256 - BLOCK
      ?auto_248257 - BLOCK
      ?auto_248258 - BLOCK
    )
    :vars
    (
      ?auto_248259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248258 ?auto_248259 ) ( ON-TABLE ?auto_248250 ) ( ON ?auto_248251 ?auto_248250 ) ( ON ?auto_248252 ?auto_248251 ) ( not ( = ?auto_248250 ?auto_248251 ) ) ( not ( = ?auto_248250 ?auto_248252 ) ) ( not ( = ?auto_248250 ?auto_248253 ) ) ( not ( = ?auto_248250 ?auto_248254 ) ) ( not ( = ?auto_248250 ?auto_248255 ) ) ( not ( = ?auto_248250 ?auto_248256 ) ) ( not ( = ?auto_248250 ?auto_248257 ) ) ( not ( = ?auto_248250 ?auto_248258 ) ) ( not ( = ?auto_248250 ?auto_248259 ) ) ( not ( = ?auto_248251 ?auto_248252 ) ) ( not ( = ?auto_248251 ?auto_248253 ) ) ( not ( = ?auto_248251 ?auto_248254 ) ) ( not ( = ?auto_248251 ?auto_248255 ) ) ( not ( = ?auto_248251 ?auto_248256 ) ) ( not ( = ?auto_248251 ?auto_248257 ) ) ( not ( = ?auto_248251 ?auto_248258 ) ) ( not ( = ?auto_248251 ?auto_248259 ) ) ( not ( = ?auto_248252 ?auto_248253 ) ) ( not ( = ?auto_248252 ?auto_248254 ) ) ( not ( = ?auto_248252 ?auto_248255 ) ) ( not ( = ?auto_248252 ?auto_248256 ) ) ( not ( = ?auto_248252 ?auto_248257 ) ) ( not ( = ?auto_248252 ?auto_248258 ) ) ( not ( = ?auto_248252 ?auto_248259 ) ) ( not ( = ?auto_248253 ?auto_248254 ) ) ( not ( = ?auto_248253 ?auto_248255 ) ) ( not ( = ?auto_248253 ?auto_248256 ) ) ( not ( = ?auto_248253 ?auto_248257 ) ) ( not ( = ?auto_248253 ?auto_248258 ) ) ( not ( = ?auto_248253 ?auto_248259 ) ) ( not ( = ?auto_248254 ?auto_248255 ) ) ( not ( = ?auto_248254 ?auto_248256 ) ) ( not ( = ?auto_248254 ?auto_248257 ) ) ( not ( = ?auto_248254 ?auto_248258 ) ) ( not ( = ?auto_248254 ?auto_248259 ) ) ( not ( = ?auto_248255 ?auto_248256 ) ) ( not ( = ?auto_248255 ?auto_248257 ) ) ( not ( = ?auto_248255 ?auto_248258 ) ) ( not ( = ?auto_248255 ?auto_248259 ) ) ( not ( = ?auto_248256 ?auto_248257 ) ) ( not ( = ?auto_248256 ?auto_248258 ) ) ( not ( = ?auto_248256 ?auto_248259 ) ) ( not ( = ?auto_248257 ?auto_248258 ) ) ( not ( = ?auto_248257 ?auto_248259 ) ) ( not ( = ?auto_248258 ?auto_248259 ) ) ( ON ?auto_248257 ?auto_248258 ) ( ON ?auto_248256 ?auto_248257 ) ( ON ?auto_248255 ?auto_248256 ) ( ON ?auto_248254 ?auto_248255 ) ( CLEAR ?auto_248252 ) ( ON ?auto_248253 ?auto_248254 ) ( CLEAR ?auto_248253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248250 ?auto_248251 ?auto_248252 ?auto_248253 )
      ( MAKE-9PILE ?auto_248250 ?auto_248251 ?auto_248252 ?auto_248253 ?auto_248254 ?auto_248255 ?auto_248256 ?auto_248257 ?auto_248258 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248269 - BLOCK
      ?auto_248270 - BLOCK
      ?auto_248271 - BLOCK
      ?auto_248272 - BLOCK
      ?auto_248273 - BLOCK
      ?auto_248274 - BLOCK
      ?auto_248275 - BLOCK
      ?auto_248276 - BLOCK
      ?auto_248277 - BLOCK
    )
    :vars
    (
      ?auto_248278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248277 ?auto_248278 ) ( ON-TABLE ?auto_248269 ) ( ON ?auto_248270 ?auto_248269 ) ( not ( = ?auto_248269 ?auto_248270 ) ) ( not ( = ?auto_248269 ?auto_248271 ) ) ( not ( = ?auto_248269 ?auto_248272 ) ) ( not ( = ?auto_248269 ?auto_248273 ) ) ( not ( = ?auto_248269 ?auto_248274 ) ) ( not ( = ?auto_248269 ?auto_248275 ) ) ( not ( = ?auto_248269 ?auto_248276 ) ) ( not ( = ?auto_248269 ?auto_248277 ) ) ( not ( = ?auto_248269 ?auto_248278 ) ) ( not ( = ?auto_248270 ?auto_248271 ) ) ( not ( = ?auto_248270 ?auto_248272 ) ) ( not ( = ?auto_248270 ?auto_248273 ) ) ( not ( = ?auto_248270 ?auto_248274 ) ) ( not ( = ?auto_248270 ?auto_248275 ) ) ( not ( = ?auto_248270 ?auto_248276 ) ) ( not ( = ?auto_248270 ?auto_248277 ) ) ( not ( = ?auto_248270 ?auto_248278 ) ) ( not ( = ?auto_248271 ?auto_248272 ) ) ( not ( = ?auto_248271 ?auto_248273 ) ) ( not ( = ?auto_248271 ?auto_248274 ) ) ( not ( = ?auto_248271 ?auto_248275 ) ) ( not ( = ?auto_248271 ?auto_248276 ) ) ( not ( = ?auto_248271 ?auto_248277 ) ) ( not ( = ?auto_248271 ?auto_248278 ) ) ( not ( = ?auto_248272 ?auto_248273 ) ) ( not ( = ?auto_248272 ?auto_248274 ) ) ( not ( = ?auto_248272 ?auto_248275 ) ) ( not ( = ?auto_248272 ?auto_248276 ) ) ( not ( = ?auto_248272 ?auto_248277 ) ) ( not ( = ?auto_248272 ?auto_248278 ) ) ( not ( = ?auto_248273 ?auto_248274 ) ) ( not ( = ?auto_248273 ?auto_248275 ) ) ( not ( = ?auto_248273 ?auto_248276 ) ) ( not ( = ?auto_248273 ?auto_248277 ) ) ( not ( = ?auto_248273 ?auto_248278 ) ) ( not ( = ?auto_248274 ?auto_248275 ) ) ( not ( = ?auto_248274 ?auto_248276 ) ) ( not ( = ?auto_248274 ?auto_248277 ) ) ( not ( = ?auto_248274 ?auto_248278 ) ) ( not ( = ?auto_248275 ?auto_248276 ) ) ( not ( = ?auto_248275 ?auto_248277 ) ) ( not ( = ?auto_248275 ?auto_248278 ) ) ( not ( = ?auto_248276 ?auto_248277 ) ) ( not ( = ?auto_248276 ?auto_248278 ) ) ( not ( = ?auto_248277 ?auto_248278 ) ) ( ON ?auto_248276 ?auto_248277 ) ( ON ?auto_248275 ?auto_248276 ) ( ON ?auto_248274 ?auto_248275 ) ( ON ?auto_248273 ?auto_248274 ) ( ON ?auto_248272 ?auto_248273 ) ( CLEAR ?auto_248270 ) ( ON ?auto_248271 ?auto_248272 ) ( CLEAR ?auto_248271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248269 ?auto_248270 ?auto_248271 )
      ( MAKE-9PILE ?auto_248269 ?auto_248270 ?auto_248271 ?auto_248272 ?auto_248273 ?auto_248274 ?auto_248275 ?auto_248276 ?auto_248277 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248288 - BLOCK
      ?auto_248289 - BLOCK
      ?auto_248290 - BLOCK
      ?auto_248291 - BLOCK
      ?auto_248292 - BLOCK
      ?auto_248293 - BLOCK
      ?auto_248294 - BLOCK
      ?auto_248295 - BLOCK
      ?auto_248296 - BLOCK
    )
    :vars
    (
      ?auto_248297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248296 ?auto_248297 ) ( ON-TABLE ?auto_248288 ) ( ON ?auto_248289 ?auto_248288 ) ( not ( = ?auto_248288 ?auto_248289 ) ) ( not ( = ?auto_248288 ?auto_248290 ) ) ( not ( = ?auto_248288 ?auto_248291 ) ) ( not ( = ?auto_248288 ?auto_248292 ) ) ( not ( = ?auto_248288 ?auto_248293 ) ) ( not ( = ?auto_248288 ?auto_248294 ) ) ( not ( = ?auto_248288 ?auto_248295 ) ) ( not ( = ?auto_248288 ?auto_248296 ) ) ( not ( = ?auto_248288 ?auto_248297 ) ) ( not ( = ?auto_248289 ?auto_248290 ) ) ( not ( = ?auto_248289 ?auto_248291 ) ) ( not ( = ?auto_248289 ?auto_248292 ) ) ( not ( = ?auto_248289 ?auto_248293 ) ) ( not ( = ?auto_248289 ?auto_248294 ) ) ( not ( = ?auto_248289 ?auto_248295 ) ) ( not ( = ?auto_248289 ?auto_248296 ) ) ( not ( = ?auto_248289 ?auto_248297 ) ) ( not ( = ?auto_248290 ?auto_248291 ) ) ( not ( = ?auto_248290 ?auto_248292 ) ) ( not ( = ?auto_248290 ?auto_248293 ) ) ( not ( = ?auto_248290 ?auto_248294 ) ) ( not ( = ?auto_248290 ?auto_248295 ) ) ( not ( = ?auto_248290 ?auto_248296 ) ) ( not ( = ?auto_248290 ?auto_248297 ) ) ( not ( = ?auto_248291 ?auto_248292 ) ) ( not ( = ?auto_248291 ?auto_248293 ) ) ( not ( = ?auto_248291 ?auto_248294 ) ) ( not ( = ?auto_248291 ?auto_248295 ) ) ( not ( = ?auto_248291 ?auto_248296 ) ) ( not ( = ?auto_248291 ?auto_248297 ) ) ( not ( = ?auto_248292 ?auto_248293 ) ) ( not ( = ?auto_248292 ?auto_248294 ) ) ( not ( = ?auto_248292 ?auto_248295 ) ) ( not ( = ?auto_248292 ?auto_248296 ) ) ( not ( = ?auto_248292 ?auto_248297 ) ) ( not ( = ?auto_248293 ?auto_248294 ) ) ( not ( = ?auto_248293 ?auto_248295 ) ) ( not ( = ?auto_248293 ?auto_248296 ) ) ( not ( = ?auto_248293 ?auto_248297 ) ) ( not ( = ?auto_248294 ?auto_248295 ) ) ( not ( = ?auto_248294 ?auto_248296 ) ) ( not ( = ?auto_248294 ?auto_248297 ) ) ( not ( = ?auto_248295 ?auto_248296 ) ) ( not ( = ?auto_248295 ?auto_248297 ) ) ( not ( = ?auto_248296 ?auto_248297 ) ) ( ON ?auto_248295 ?auto_248296 ) ( ON ?auto_248294 ?auto_248295 ) ( ON ?auto_248293 ?auto_248294 ) ( ON ?auto_248292 ?auto_248293 ) ( ON ?auto_248291 ?auto_248292 ) ( CLEAR ?auto_248289 ) ( ON ?auto_248290 ?auto_248291 ) ( CLEAR ?auto_248290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248288 ?auto_248289 ?auto_248290 )
      ( MAKE-9PILE ?auto_248288 ?auto_248289 ?auto_248290 ?auto_248291 ?auto_248292 ?auto_248293 ?auto_248294 ?auto_248295 ?auto_248296 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248307 - BLOCK
      ?auto_248308 - BLOCK
      ?auto_248309 - BLOCK
      ?auto_248310 - BLOCK
      ?auto_248311 - BLOCK
      ?auto_248312 - BLOCK
      ?auto_248313 - BLOCK
      ?auto_248314 - BLOCK
      ?auto_248315 - BLOCK
    )
    :vars
    (
      ?auto_248316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248315 ?auto_248316 ) ( ON-TABLE ?auto_248307 ) ( not ( = ?auto_248307 ?auto_248308 ) ) ( not ( = ?auto_248307 ?auto_248309 ) ) ( not ( = ?auto_248307 ?auto_248310 ) ) ( not ( = ?auto_248307 ?auto_248311 ) ) ( not ( = ?auto_248307 ?auto_248312 ) ) ( not ( = ?auto_248307 ?auto_248313 ) ) ( not ( = ?auto_248307 ?auto_248314 ) ) ( not ( = ?auto_248307 ?auto_248315 ) ) ( not ( = ?auto_248307 ?auto_248316 ) ) ( not ( = ?auto_248308 ?auto_248309 ) ) ( not ( = ?auto_248308 ?auto_248310 ) ) ( not ( = ?auto_248308 ?auto_248311 ) ) ( not ( = ?auto_248308 ?auto_248312 ) ) ( not ( = ?auto_248308 ?auto_248313 ) ) ( not ( = ?auto_248308 ?auto_248314 ) ) ( not ( = ?auto_248308 ?auto_248315 ) ) ( not ( = ?auto_248308 ?auto_248316 ) ) ( not ( = ?auto_248309 ?auto_248310 ) ) ( not ( = ?auto_248309 ?auto_248311 ) ) ( not ( = ?auto_248309 ?auto_248312 ) ) ( not ( = ?auto_248309 ?auto_248313 ) ) ( not ( = ?auto_248309 ?auto_248314 ) ) ( not ( = ?auto_248309 ?auto_248315 ) ) ( not ( = ?auto_248309 ?auto_248316 ) ) ( not ( = ?auto_248310 ?auto_248311 ) ) ( not ( = ?auto_248310 ?auto_248312 ) ) ( not ( = ?auto_248310 ?auto_248313 ) ) ( not ( = ?auto_248310 ?auto_248314 ) ) ( not ( = ?auto_248310 ?auto_248315 ) ) ( not ( = ?auto_248310 ?auto_248316 ) ) ( not ( = ?auto_248311 ?auto_248312 ) ) ( not ( = ?auto_248311 ?auto_248313 ) ) ( not ( = ?auto_248311 ?auto_248314 ) ) ( not ( = ?auto_248311 ?auto_248315 ) ) ( not ( = ?auto_248311 ?auto_248316 ) ) ( not ( = ?auto_248312 ?auto_248313 ) ) ( not ( = ?auto_248312 ?auto_248314 ) ) ( not ( = ?auto_248312 ?auto_248315 ) ) ( not ( = ?auto_248312 ?auto_248316 ) ) ( not ( = ?auto_248313 ?auto_248314 ) ) ( not ( = ?auto_248313 ?auto_248315 ) ) ( not ( = ?auto_248313 ?auto_248316 ) ) ( not ( = ?auto_248314 ?auto_248315 ) ) ( not ( = ?auto_248314 ?auto_248316 ) ) ( not ( = ?auto_248315 ?auto_248316 ) ) ( ON ?auto_248314 ?auto_248315 ) ( ON ?auto_248313 ?auto_248314 ) ( ON ?auto_248312 ?auto_248313 ) ( ON ?auto_248311 ?auto_248312 ) ( ON ?auto_248310 ?auto_248311 ) ( ON ?auto_248309 ?auto_248310 ) ( CLEAR ?auto_248307 ) ( ON ?auto_248308 ?auto_248309 ) ( CLEAR ?auto_248308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248307 ?auto_248308 )
      ( MAKE-9PILE ?auto_248307 ?auto_248308 ?auto_248309 ?auto_248310 ?auto_248311 ?auto_248312 ?auto_248313 ?auto_248314 ?auto_248315 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248326 - BLOCK
      ?auto_248327 - BLOCK
      ?auto_248328 - BLOCK
      ?auto_248329 - BLOCK
      ?auto_248330 - BLOCK
      ?auto_248331 - BLOCK
      ?auto_248332 - BLOCK
      ?auto_248333 - BLOCK
      ?auto_248334 - BLOCK
    )
    :vars
    (
      ?auto_248335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248334 ?auto_248335 ) ( ON-TABLE ?auto_248326 ) ( not ( = ?auto_248326 ?auto_248327 ) ) ( not ( = ?auto_248326 ?auto_248328 ) ) ( not ( = ?auto_248326 ?auto_248329 ) ) ( not ( = ?auto_248326 ?auto_248330 ) ) ( not ( = ?auto_248326 ?auto_248331 ) ) ( not ( = ?auto_248326 ?auto_248332 ) ) ( not ( = ?auto_248326 ?auto_248333 ) ) ( not ( = ?auto_248326 ?auto_248334 ) ) ( not ( = ?auto_248326 ?auto_248335 ) ) ( not ( = ?auto_248327 ?auto_248328 ) ) ( not ( = ?auto_248327 ?auto_248329 ) ) ( not ( = ?auto_248327 ?auto_248330 ) ) ( not ( = ?auto_248327 ?auto_248331 ) ) ( not ( = ?auto_248327 ?auto_248332 ) ) ( not ( = ?auto_248327 ?auto_248333 ) ) ( not ( = ?auto_248327 ?auto_248334 ) ) ( not ( = ?auto_248327 ?auto_248335 ) ) ( not ( = ?auto_248328 ?auto_248329 ) ) ( not ( = ?auto_248328 ?auto_248330 ) ) ( not ( = ?auto_248328 ?auto_248331 ) ) ( not ( = ?auto_248328 ?auto_248332 ) ) ( not ( = ?auto_248328 ?auto_248333 ) ) ( not ( = ?auto_248328 ?auto_248334 ) ) ( not ( = ?auto_248328 ?auto_248335 ) ) ( not ( = ?auto_248329 ?auto_248330 ) ) ( not ( = ?auto_248329 ?auto_248331 ) ) ( not ( = ?auto_248329 ?auto_248332 ) ) ( not ( = ?auto_248329 ?auto_248333 ) ) ( not ( = ?auto_248329 ?auto_248334 ) ) ( not ( = ?auto_248329 ?auto_248335 ) ) ( not ( = ?auto_248330 ?auto_248331 ) ) ( not ( = ?auto_248330 ?auto_248332 ) ) ( not ( = ?auto_248330 ?auto_248333 ) ) ( not ( = ?auto_248330 ?auto_248334 ) ) ( not ( = ?auto_248330 ?auto_248335 ) ) ( not ( = ?auto_248331 ?auto_248332 ) ) ( not ( = ?auto_248331 ?auto_248333 ) ) ( not ( = ?auto_248331 ?auto_248334 ) ) ( not ( = ?auto_248331 ?auto_248335 ) ) ( not ( = ?auto_248332 ?auto_248333 ) ) ( not ( = ?auto_248332 ?auto_248334 ) ) ( not ( = ?auto_248332 ?auto_248335 ) ) ( not ( = ?auto_248333 ?auto_248334 ) ) ( not ( = ?auto_248333 ?auto_248335 ) ) ( not ( = ?auto_248334 ?auto_248335 ) ) ( ON ?auto_248333 ?auto_248334 ) ( ON ?auto_248332 ?auto_248333 ) ( ON ?auto_248331 ?auto_248332 ) ( ON ?auto_248330 ?auto_248331 ) ( ON ?auto_248329 ?auto_248330 ) ( ON ?auto_248328 ?auto_248329 ) ( CLEAR ?auto_248326 ) ( ON ?auto_248327 ?auto_248328 ) ( CLEAR ?auto_248327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248326 ?auto_248327 )
      ( MAKE-9PILE ?auto_248326 ?auto_248327 ?auto_248328 ?auto_248329 ?auto_248330 ?auto_248331 ?auto_248332 ?auto_248333 ?auto_248334 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248345 - BLOCK
      ?auto_248346 - BLOCK
      ?auto_248347 - BLOCK
      ?auto_248348 - BLOCK
      ?auto_248349 - BLOCK
      ?auto_248350 - BLOCK
      ?auto_248351 - BLOCK
      ?auto_248352 - BLOCK
      ?auto_248353 - BLOCK
    )
    :vars
    (
      ?auto_248354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248353 ?auto_248354 ) ( not ( = ?auto_248345 ?auto_248346 ) ) ( not ( = ?auto_248345 ?auto_248347 ) ) ( not ( = ?auto_248345 ?auto_248348 ) ) ( not ( = ?auto_248345 ?auto_248349 ) ) ( not ( = ?auto_248345 ?auto_248350 ) ) ( not ( = ?auto_248345 ?auto_248351 ) ) ( not ( = ?auto_248345 ?auto_248352 ) ) ( not ( = ?auto_248345 ?auto_248353 ) ) ( not ( = ?auto_248345 ?auto_248354 ) ) ( not ( = ?auto_248346 ?auto_248347 ) ) ( not ( = ?auto_248346 ?auto_248348 ) ) ( not ( = ?auto_248346 ?auto_248349 ) ) ( not ( = ?auto_248346 ?auto_248350 ) ) ( not ( = ?auto_248346 ?auto_248351 ) ) ( not ( = ?auto_248346 ?auto_248352 ) ) ( not ( = ?auto_248346 ?auto_248353 ) ) ( not ( = ?auto_248346 ?auto_248354 ) ) ( not ( = ?auto_248347 ?auto_248348 ) ) ( not ( = ?auto_248347 ?auto_248349 ) ) ( not ( = ?auto_248347 ?auto_248350 ) ) ( not ( = ?auto_248347 ?auto_248351 ) ) ( not ( = ?auto_248347 ?auto_248352 ) ) ( not ( = ?auto_248347 ?auto_248353 ) ) ( not ( = ?auto_248347 ?auto_248354 ) ) ( not ( = ?auto_248348 ?auto_248349 ) ) ( not ( = ?auto_248348 ?auto_248350 ) ) ( not ( = ?auto_248348 ?auto_248351 ) ) ( not ( = ?auto_248348 ?auto_248352 ) ) ( not ( = ?auto_248348 ?auto_248353 ) ) ( not ( = ?auto_248348 ?auto_248354 ) ) ( not ( = ?auto_248349 ?auto_248350 ) ) ( not ( = ?auto_248349 ?auto_248351 ) ) ( not ( = ?auto_248349 ?auto_248352 ) ) ( not ( = ?auto_248349 ?auto_248353 ) ) ( not ( = ?auto_248349 ?auto_248354 ) ) ( not ( = ?auto_248350 ?auto_248351 ) ) ( not ( = ?auto_248350 ?auto_248352 ) ) ( not ( = ?auto_248350 ?auto_248353 ) ) ( not ( = ?auto_248350 ?auto_248354 ) ) ( not ( = ?auto_248351 ?auto_248352 ) ) ( not ( = ?auto_248351 ?auto_248353 ) ) ( not ( = ?auto_248351 ?auto_248354 ) ) ( not ( = ?auto_248352 ?auto_248353 ) ) ( not ( = ?auto_248352 ?auto_248354 ) ) ( not ( = ?auto_248353 ?auto_248354 ) ) ( ON ?auto_248352 ?auto_248353 ) ( ON ?auto_248351 ?auto_248352 ) ( ON ?auto_248350 ?auto_248351 ) ( ON ?auto_248349 ?auto_248350 ) ( ON ?auto_248348 ?auto_248349 ) ( ON ?auto_248347 ?auto_248348 ) ( ON ?auto_248346 ?auto_248347 ) ( ON ?auto_248345 ?auto_248346 ) ( CLEAR ?auto_248345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248345 )
      ( MAKE-9PILE ?auto_248345 ?auto_248346 ?auto_248347 ?auto_248348 ?auto_248349 ?auto_248350 ?auto_248351 ?auto_248352 ?auto_248353 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_248364 - BLOCK
      ?auto_248365 - BLOCK
      ?auto_248366 - BLOCK
      ?auto_248367 - BLOCK
      ?auto_248368 - BLOCK
      ?auto_248369 - BLOCK
      ?auto_248370 - BLOCK
      ?auto_248371 - BLOCK
      ?auto_248372 - BLOCK
    )
    :vars
    (
      ?auto_248373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248372 ?auto_248373 ) ( not ( = ?auto_248364 ?auto_248365 ) ) ( not ( = ?auto_248364 ?auto_248366 ) ) ( not ( = ?auto_248364 ?auto_248367 ) ) ( not ( = ?auto_248364 ?auto_248368 ) ) ( not ( = ?auto_248364 ?auto_248369 ) ) ( not ( = ?auto_248364 ?auto_248370 ) ) ( not ( = ?auto_248364 ?auto_248371 ) ) ( not ( = ?auto_248364 ?auto_248372 ) ) ( not ( = ?auto_248364 ?auto_248373 ) ) ( not ( = ?auto_248365 ?auto_248366 ) ) ( not ( = ?auto_248365 ?auto_248367 ) ) ( not ( = ?auto_248365 ?auto_248368 ) ) ( not ( = ?auto_248365 ?auto_248369 ) ) ( not ( = ?auto_248365 ?auto_248370 ) ) ( not ( = ?auto_248365 ?auto_248371 ) ) ( not ( = ?auto_248365 ?auto_248372 ) ) ( not ( = ?auto_248365 ?auto_248373 ) ) ( not ( = ?auto_248366 ?auto_248367 ) ) ( not ( = ?auto_248366 ?auto_248368 ) ) ( not ( = ?auto_248366 ?auto_248369 ) ) ( not ( = ?auto_248366 ?auto_248370 ) ) ( not ( = ?auto_248366 ?auto_248371 ) ) ( not ( = ?auto_248366 ?auto_248372 ) ) ( not ( = ?auto_248366 ?auto_248373 ) ) ( not ( = ?auto_248367 ?auto_248368 ) ) ( not ( = ?auto_248367 ?auto_248369 ) ) ( not ( = ?auto_248367 ?auto_248370 ) ) ( not ( = ?auto_248367 ?auto_248371 ) ) ( not ( = ?auto_248367 ?auto_248372 ) ) ( not ( = ?auto_248367 ?auto_248373 ) ) ( not ( = ?auto_248368 ?auto_248369 ) ) ( not ( = ?auto_248368 ?auto_248370 ) ) ( not ( = ?auto_248368 ?auto_248371 ) ) ( not ( = ?auto_248368 ?auto_248372 ) ) ( not ( = ?auto_248368 ?auto_248373 ) ) ( not ( = ?auto_248369 ?auto_248370 ) ) ( not ( = ?auto_248369 ?auto_248371 ) ) ( not ( = ?auto_248369 ?auto_248372 ) ) ( not ( = ?auto_248369 ?auto_248373 ) ) ( not ( = ?auto_248370 ?auto_248371 ) ) ( not ( = ?auto_248370 ?auto_248372 ) ) ( not ( = ?auto_248370 ?auto_248373 ) ) ( not ( = ?auto_248371 ?auto_248372 ) ) ( not ( = ?auto_248371 ?auto_248373 ) ) ( not ( = ?auto_248372 ?auto_248373 ) ) ( ON ?auto_248371 ?auto_248372 ) ( ON ?auto_248370 ?auto_248371 ) ( ON ?auto_248369 ?auto_248370 ) ( ON ?auto_248368 ?auto_248369 ) ( ON ?auto_248367 ?auto_248368 ) ( ON ?auto_248366 ?auto_248367 ) ( ON ?auto_248365 ?auto_248366 ) ( ON ?auto_248364 ?auto_248365 ) ( CLEAR ?auto_248364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248364 )
      ( MAKE-9PILE ?auto_248364 ?auto_248365 ?auto_248366 ?auto_248367 ?auto_248368 ?auto_248369 ?auto_248370 ?auto_248371 ?auto_248372 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248384 - BLOCK
      ?auto_248385 - BLOCK
      ?auto_248386 - BLOCK
      ?auto_248387 - BLOCK
      ?auto_248388 - BLOCK
      ?auto_248389 - BLOCK
      ?auto_248390 - BLOCK
      ?auto_248391 - BLOCK
      ?auto_248392 - BLOCK
      ?auto_248393 - BLOCK
    )
    :vars
    (
      ?auto_248394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248392 ) ( ON ?auto_248393 ?auto_248394 ) ( CLEAR ?auto_248393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248384 ) ( ON ?auto_248385 ?auto_248384 ) ( ON ?auto_248386 ?auto_248385 ) ( ON ?auto_248387 ?auto_248386 ) ( ON ?auto_248388 ?auto_248387 ) ( ON ?auto_248389 ?auto_248388 ) ( ON ?auto_248390 ?auto_248389 ) ( ON ?auto_248391 ?auto_248390 ) ( ON ?auto_248392 ?auto_248391 ) ( not ( = ?auto_248384 ?auto_248385 ) ) ( not ( = ?auto_248384 ?auto_248386 ) ) ( not ( = ?auto_248384 ?auto_248387 ) ) ( not ( = ?auto_248384 ?auto_248388 ) ) ( not ( = ?auto_248384 ?auto_248389 ) ) ( not ( = ?auto_248384 ?auto_248390 ) ) ( not ( = ?auto_248384 ?auto_248391 ) ) ( not ( = ?auto_248384 ?auto_248392 ) ) ( not ( = ?auto_248384 ?auto_248393 ) ) ( not ( = ?auto_248384 ?auto_248394 ) ) ( not ( = ?auto_248385 ?auto_248386 ) ) ( not ( = ?auto_248385 ?auto_248387 ) ) ( not ( = ?auto_248385 ?auto_248388 ) ) ( not ( = ?auto_248385 ?auto_248389 ) ) ( not ( = ?auto_248385 ?auto_248390 ) ) ( not ( = ?auto_248385 ?auto_248391 ) ) ( not ( = ?auto_248385 ?auto_248392 ) ) ( not ( = ?auto_248385 ?auto_248393 ) ) ( not ( = ?auto_248385 ?auto_248394 ) ) ( not ( = ?auto_248386 ?auto_248387 ) ) ( not ( = ?auto_248386 ?auto_248388 ) ) ( not ( = ?auto_248386 ?auto_248389 ) ) ( not ( = ?auto_248386 ?auto_248390 ) ) ( not ( = ?auto_248386 ?auto_248391 ) ) ( not ( = ?auto_248386 ?auto_248392 ) ) ( not ( = ?auto_248386 ?auto_248393 ) ) ( not ( = ?auto_248386 ?auto_248394 ) ) ( not ( = ?auto_248387 ?auto_248388 ) ) ( not ( = ?auto_248387 ?auto_248389 ) ) ( not ( = ?auto_248387 ?auto_248390 ) ) ( not ( = ?auto_248387 ?auto_248391 ) ) ( not ( = ?auto_248387 ?auto_248392 ) ) ( not ( = ?auto_248387 ?auto_248393 ) ) ( not ( = ?auto_248387 ?auto_248394 ) ) ( not ( = ?auto_248388 ?auto_248389 ) ) ( not ( = ?auto_248388 ?auto_248390 ) ) ( not ( = ?auto_248388 ?auto_248391 ) ) ( not ( = ?auto_248388 ?auto_248392 ) ) ( not ( = ?auto_248388 ?auto_248393 ) ) ( not ( = ?auto_248388 ?auto_248394 ) ) ( not ( = ?auto_248389 ?auto_248390 ) ) ( not ( = ?auto_248389 ?auto_248391 ) ) ( not ( = ?auto_248389 ?auto_248392 ) ) ( not ( = ?auto_248389 ?auto_248393 ) ) ( not ( = ?auto_248389 ?auto_248394 ) ) ( not ( = ?auto_248390 ?auto_248391 ) ) ( not ( = ?auto_248390 ?auto_248392 ) ) ( not ( = ?auto_248390 ?auto_248393 ) ) ( not ( = ?auto_248390 ?auto_248394 ) ) ( not ( = ?auto_248391 ?auto_248392 ) ) ( not ( = ?auto_248391 ?auto_248393 ) ) ( not ( = ?auto_248391 ?auto_248394 ) ) ( not ( = ?auto_248392 ?auto_248393 ) ) ( not ( = ?auto_248392 ?auto_248394 ) ) ( not ( = ?auto_248393 ?auto_248394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248393 ?auto_248394 )
      ( !STACK ?auto_248393 ?auto_248392 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248405 - BLOCK
      ?auto_248406 - BLOCK
      ?auto_248407 - BLOCK
      ?auto_248408 - BLOCK
      ?auto_248409 - BLOCK
      ?auto_248410 - BLOCK
      ?auto_248411 - BLOCK
      ?auto_248412 - BLOCK
      ?auto_248413 - BLOCK
      ?auto_248414 - BLOCK
    )
    :vars
    (
      ?auto_248415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248413 ) ( ON ?auto_248414 ?auto_248415 ) ( CLEAR ?auto_248414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248405 ) ( ON ?auto_248406 ?auto_248405 ) ( ON ?auto_248407 ?auto_248406 ) ( ON ?auto_248408 ?auto_248407 ) ( ON ?auto_248409 ?auto_248408 ) ( ON ?auto_248410 ?auto_248409 ) ( ON ?auto_248411 ?auto_248410 ) ( ON ?auto_248412 ?auto_248411 ) ( ON ?auto_248413 ?auto_248412 ) ( not ( = ?auto_248405 ?auto_248406 ) ) ( not ( = ?auto_248405 ?auto_248407 ) ) ( not ( = ?auto_248405 ?auto_248408 ) ) ( not ( = ?auto_248405 ?auto_248409 ) ) ( not ( = ?auto_248405 ?auto_248410 ) ) ( not ( = ?auto_248405 ?auto_248411 ) ) ( not ( = ?auto_248405 ?auto_248412 ) ) ( not ( = ?auto_248405 ?auto_248413 ) ) ( not ( = ?auto_248405 ?auto_248414 ) ) ( not ( = ?auto_248405 ?auto_248415 ) ) ( not ( = ?auto_248406 ?auto_248407 ) ) ( not ( = ?auto_248406 ?auto_248408 ) ) ( not ( = ?auto_248406 ?auto_248409 ) ) ( not ( = ?auto_248406 ?auto_248410 ) ) ( not ( = ?auto_248406 ?auto_248411 ) ) ( not ( = ?auto_248406 ?auto_248412 ) ) ( not ( = ?auto_248406 ?auto_248413 ) ) ( not ( = ?auto_248406 ?auto_248414 ) ) ( not ( = ?auto_248406 ?auto_248415 ) ) ( not ( = ?auto_248407 ?auto_248408 ) ) ( not ( = ?auto_248407 ?auto_248409 ) ) ( not ( = ?auto_248407 ?auto_248410 ) ) ( not ( = ?auto_248407 ?auto_248411 ) ) ( not ( = ?auto_248407 ?auto_248412 ) ) ( not ( = ?auto_248407 ?auto_248413 ) ) ( not ( = ?auto_248407 ?auto_248414 ) ) ( not ( = ?auto_248407 ?auto_248415 ) ) ( not ( = ?auto_248408 ?auto_248409 ) ) ( not ( = ?auto_248408 ?auto_248410 ) ) ( not ( = ?auto_248408 ?auto_248411 ) ) ( not ( = ?auto_248408 ?auto_248412 ) ) ( not ( = ?auto_248408 ?auto_248413 ) ) ( not ( = ?auto_248408 ?auto_248414 ) ) ( not ( = ?auto_248408 ?auto_248415 ) ) ( not ( = ?auto_248409 ?auto_248410 ) ) ( not ( = ?auto_248409 ?auto_248411 ) ) ( not ( = ?auto_248409 ?auto_248412 ) ) ( not ( = ?auto_248409 ?auto_248413 ) ) ( not ( = ?auto_248409 ?auto_248414 ) ) ( not ( = ?auto_248409 ?auto_248415 ) ) ( not ( = ?auto_248410 ?auto_248411 ) ) ( not ( = ?auto_248410 ?auto_248412 ) ) ( not ( = ?auto_248410 ?auto_248413 ) ) ( not ( = ?auto_248410 ?auto_248414 ) ) ( not ( = ?auto_248410 ?auto_248415 ) ) ( not ( = ?auto_248411 ?auto_248412 ) ) ( not ( = ?auto_248411 ?auto_248413 ) ) ( not ( = ?auto_248411 ?auto_248414 ) ) ( not ( = ?auto_248411 ?auto_248415 ) ) ( not ( = ?auto_248412 ?auto_248413 ) ) ( not ( = ?auto_248412 ?auto_248414 ) ) ( not ( = ?auto_248412 ?auto_248415 ) ) ( not ( = ?auto_248413 ?auto_248414 ) ) ( not ( = ?auto_248413 ?auto_248415 ) ) ( not ( = ?auto_248414 ?auto_248415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248414 ?auto_248415 )
      ( !STACK ?auto_248414 ?auto_248413 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248426 - BLOCK
      ?auto_248427 - BLOCK
      ?auto_248428 - BLOCK
      ?auto_248429 - BLOCK
      ?auto_248430 - BLOCK
      ?auto_248431 - BLOCK
      ?auto_248432 - BLOCK
      ?auto_248433 - BLOCK
      ?auto_248434 - BLOCK
      ?auto_248435 - BLOCK
    )
    :vars
    (
      ?auto_248436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248435 ?auto_248436 ) ( ON-TABLE ?auto_248426 ) ( ON ?auto_248427 ?auto_248426 ) ( ON ?auto_248428 ?auto_248427 ) ( ON ?auto_248429 ?auto_248428 ) ( ON ?auto_248430 ?auto_248429 ) ( ON ?auto_248431 ?auto_248430 ) ( ON ?auto_248432 ?auto_248431 ) ( ON ?auto_248433 ?auto_248432 ) ( not ( = ?auto_248426 ?auto_248427 ) ) ( not ( = ?auto_248426 ?auto_248428 ) ) ( not ( = ?auto_248426 ?auto_248429 ) ) ( not ( = ?auto_248426 ?auto_248430 ) ) ( not ( = ?auto_248426 ?auto_248431 ) ) ( not ( = ?auto_248426 ?auto_248432 ) ) ( not ( = ?auto_248426 ?auto_248433 ) ) ( not ( = ?auto_248426 ?auto_248434 ) ) ( not ( = ?auto_248426 ?auto_248435 ) ) ( not ( = ?auto_248426 ?auto_248436 ) ) ( not ( = ?auto_248427 ?auto_248428 ) ) ( not ( = ?auto_248427 ?auto_248429 ) ) ( not ( = ?auto_248427 ?auto_248430 ) ) ( not ( = ?auto_248427 ?auto_248431 ) ) ( not ( = ?auto_248427 ?auto_248432 ) ) ( not ( = ?auto_248427 ?auto_248433 ) ) ( not ( = ?auto_248427 ?auto_248434 ) ) ( not ( = ?auto_248427 ?auto_248435 ) ) ( not ( = ?auto_248427 ?auto_248436 ) ) ( not ( = ?auto_248428 ?auto_248429 ) ) ( not ( = ?auto_248428 ?auto_248430 ) ) ( not ( = ?auto_248428 ?auto_248431 ) ) ( not ( = ?auto_248428 ?auto_248432 ) ) ( not ( = ?auto_248428 ?auto_248433 ) ) ( not ( = ?auto_248428 ?auto_248434 ) ) ( not ( = ?auto_248428 ?auto_248435 ) ) ( not ( = ?auto_248428 ?auto_248436 ) ) ( not ( = ?auto_248429 ?auto_248430 ) ) ( not ( = ?auto_248429 ?auto_248431 ) ) ( not ( = ?auto_248429 ?auto_248432 ) ) ( not ( = ?auto_248429 ?auto_248433 ) ) ( not ( = ?auto_248429 ?auto_248434 ) ) ( not ( = ?auto_248429 ?auto_248435 ) ) ( not ( = ?auto_248429 ?auto_248436 ) ) ( not ( = ?auto_248430 ?auto_248431 ) ) ( not ( = ?auto_248430 ?auto_248432 ) ) ( not ( = ?auto_248430 ?auto_248433 ) ) ( not ( = ?auto_248430 ?auto_248434 ) ) ( not ( = ?auto_248430 ?auto_248435 ) ) ( not ( = ?auto_248430 ?auto_248436 ) ) ( not ( = ?auto_248431 ?auto_248432 ) ) ( not ( = ?auto_248431 ?auto_248433 ) ) ( not ( = ?auto_248431 ?auto_248434 ) ) ( not ( = ?auto_248431 ?auto_248435 ) ) ( not ( = ?auto_248431 ?auto_248436 ) ) ( not ( = ?auto_248432 ?auto_248433 ) ) ( not ( = ?auto_248432 ?auto_248434 ) ) ( not ( = ?auto_248432 ?auto_248435 ) ) ( not ( = ?auto_248432 ?auto_248436 ) ) ( not ( = ?auto_248433 ?auto_248434 ) ) ( not ( = ?auto_248433 ?auto_248435 ) ) ( not ( = ?auto_248433 ?auto_248436 ) ) ( not ( = ?auto_248434 ?auto_248435 ) ) ( not ( = ?auto_248434 ?auto_248436 ) ) ( not ( = ?auto_248435 ?auto_248436 ) ) ( CLEAR ?auto_248433 ) ( ON ?auto_248434 ?auto_248435 ) ( CLEAR ?auto_248434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248426 ?auto_248427 ?auto_248428 ?auto_248429 ?auto_248430 ?auto_248431 ?auto_248432 ?auto_248433 ?auto_248434 )
      ( MAKE-10PILE ?auto_248426 ?auto_248427 ?auto_248428 ?auto_248429 ?auto_248430 ?auto_248431 ?auto_248432 ?auto_248433 ?auto_248434 ?auto_248435 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248447 - BLOCK
      ?auto_248448 - BLOCK
      ?auto_248449 - BLOCK
      ?auto_248450 - BLOCK
      ?auto_248451 - BLOCK
      ?auto_248452 - BLOCK
      ?auto_248453 - BLOCK
      ?auto_248454 - BLOCK
      ?auto_248455 - BLOCK
      ?auto_248456 - BLOCK
    )
    :vars
    (
      ?auto_248457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248456 ?auto_248457 ) ( ON-TABLE ?auto_248447 ) ( ON ?auto_248448 ?auto_248447 ) ( ON ?auto_248449 ?auto_248448 ) ( ON ?auto_248450 ?auto_248449 ) ( ON ?auto_248451 ?auto_248450 ) ( ON ?auto_248452 ?auto_248451 ) ( ON ?auto_248453 ?auto_248452 ) ( ON ?auto_248454 ?auto_248453 ) ( not ( = ?auto_248447 ?auto_248448 ) ) ( not ( = ?auto_248447 ?auto_248449 ) ) ( not ( = ?auto_248447 ?auto_248450 ) ) ( not ( = ?auto_248447 ?auto_248451 ) ) ( not ( = ?auto_248447 ?auto_248452 ) ) ( not ( = ?auto_248447 ?auto_248453 ) ) ( not ( = ?auto_248447 ?auto_248454 ) ) ( not ( = ?auto_248447 ?auto_248455 ) ) ( not ( = ?auto_248447 ?auto_248456 ) ) ( not ( = ?auto_248447 ?auto_248457 ) ) ( not ( = ?auto_248448 ?auto_248449 ) ) ( not ( = ?auto_248448 ?auto_248450 ) ) ( not ( = ?auto_248448 ?auto_248451 ) ) ( not ( = ?auto_248448 ?auto_248452 ) ) ( not ( = ?auto_248448 ?auto_248453 ) ) ( not ( = ?auto_248448 ?auto_248454 ) ) ( not ( = ?auto_248448 ?auto_248455 ) ) ( not ( = ?auto_248448 ?auto_248456 ) ) ( not ( = ?auto_248448 ?auto_248457 ) ) ( not ( = ?auto_248449 ?auto_248450 ) ) ( not ( = ?auto_248449 ?auto_248451 ) ) ( not ( = ?auto_248449 ?auto_248452 ) ) ( not ( = ?auto_248449 ?auto_248453 ) ) ( not ( = ?auto_248449 ?auto_248454 ) ) ( not ( = ?auto_248449 ?auto_248455 ) ) ( not ( = ?auto_248449 ?auto_248456 ) ) ( not ( = ?auto_248449 ?auto_248457 ) ) ( not ( = ?auto_248450 ?auto_248451 ) ) ( not ( = ?auto_248450 ?auto_248452 ) ) ( not ( = ?auto_248450 ?auto_248453 ) ) ( not ( = ?auto_248450 ?auto_248454 ) ) ( not ( = ?auto_248450 ?auto_248455 ) ) ( not ( = ?auto_248450 ?auto_248456 ) ) ( not ( = ?auto_248450 ?auto_248457 ) ) ( not ( = ?auto_248451 ?auto_248452 ) ) ( not ( = ?auto_248451 ?auto_248453 ) ) ( not ( = ?auto_248451 ?auto_248454 ) ) ( not ( = ?auto_248451 ?auto_248455 ) ) ( not ( = ?auto_248451 ?auto_248456 ) ) ( not ( = ?auto_248451 ?auto_248457 ) ) ( not ( = ?auto_248452 ?auto_248453 ) ) ( not ( = ?auto_248452 ?auto_248454 ) ) ( not ( = ?auto_248452 ?auto_248455 ) ) ( not ( = ?auto_248452 ?auto_248456 ) ) ( not ( = ?auto_248452 ?auto_248457 ) ) ( not ( = ?auto_248453 ?auto_248454 ) ) ( not ( = ?auto_248453 ?auto_248455 ) ) ( not ( = ?auto_248453 ?auto_248456 ) ) ( not ( = ?auto_248453 ?auto_248457 ) ) ( not ( = ?auto_248454 ?auto_248455 ) ) ( not ( = ?auto_248454 ?auto_248456 ) ) ( not ( = ?auto_248454 ?auto_248457 ) ) ( not ( = ?auto_248455 ?auto_248456 ) ) ( not ( = ?auto_248455 ?auto_248457 ) ) ( not ( = ?auto_248456 ?auto_248457 ) ) ( CLEAR ?auto_248454 ) ( ON ?auto_248455 ?auto_248456 ) ( CLEAR ?auto_248455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248447 ?auto_248448 ?auto_248449 ?auto_248450 ?auto_248451 ?auto_248452 ?auto_248453 ?auto_248454 ?auto_248455 )
      ( MAKE-10PILE ?auto_248447 ?auto_248448 ?auto_248449 ?auto_248450 ?auto_248451 ?auto_248452 ?auto_248453 ?auto_248454 ?auto_248455 ?auto_248456 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248468 - BLOCK
      ?auto_248469 - BLOCK
      ?auto_248470 - BLOCK
      ?auto_248471 - BLOCK
      ?auto_248472 - BLOCK
      ?auto_248473 - BLOCK
      ?auto_248474 - BLOCK
      ?auto_248475 - BLOCK
      ?auto_248476 - BLOCK
      ?auto_248477 - BLOCK
    )
    :vars
    (
      ?auto_248478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248477 ?auto_248478 ) ( ON-TABLE ?auto_248468 ) ( ON ?auto_248469 ?auto_248468 ) ( ON ?auto_248470 ?auto_248469 ) ( ON ?auto_248471 ?auto_248470 ) ( ON ?auto_248472 ?auto_248471 ) ( ON ?auto_248473 ?auto_248472 ) ( ON ?auto_248474 ?auto_248473 ) ( not ( = ?auto_248468 ?auto_248469 ) ) ( not ( = ?auto_248468 ?auto_248470 ) ) ( not ( = ?auto_248468 ?auto_248471 ) ) ( not ( = ?auto_248468 ?auto_248472 ) ) ( not ( = ?auto_248468 ?auto_248473 ) ) ( not ( = ?auto_248468 ?auto_248474 ) ) ( not ( = ?auto_248468 ?auto_248475 ) ) ( not ( = ?auto_248468 ?auto_248476 ) ) ( not ( = ?auto_248468 ?auto_248477 ) ) ( not ( = ?auto_248468 ?auto_248478 ) ) ( not ( = ?auto_248469 ?auto_248470 ) ) ( not ( = ?auto_248469 ?auto_248471 ) ) ( not ( = ?auto_248469 ?auto_248472 ) ) ( not ( = ?auto_248469 ?auto_248473 ) ) ( not ( = ?auto_248469 ?auto_248474 ) ) ( not ( = ?auto_248469 ?auto_248475 ) ) ( not ( = ?auto_248469 ?auto_248476 ) ) ( not ( = ?auto_248469 ?auto_248477 ) ) ( not ( = ?auto_248469 ?auto_248478 ) ) ( not ( = ?auto_248470 ?auto_248471 ) ) ( not ( = ?auto_248470 ?auto_248472 ) ) ( not ( = ?auto_248470 ?auto_248473 ) ) ( not ( = ?auto_248470 ?auto_248474 ) ) ( not ( = ?auto_248470 ?auto_248475 ) ) ( not ( = ?auto_248470 ?auto_248476 ) ) ( not ( = ?auto_248470 ?auto_248477 ) ) ( not ( = ?auto_248470 ?auto_248478 ) ) ( not ( = ?auto_248471 ?auto_248472 ) ) ( not ( = ?auto_248471 ?auto_248473 ) ) ( not ( = ?auto_248471 ?auto_248474 ) ) ( not ( = ?auto_248471 ?auto_248475 ) ) ( not ( = ?auto_248471 ?auto_248476 ) ) ( not ( = ?auto_248471 ?auto_248477 ) ) ( not ( = ?auto_248471 ?auto_248478 ) ) ( not ( = ?auto_248472 ?auto_248473 ) ) ( not ( = ?auto_248472 ?auto_248474 ) ) ( not ( = ?auto_248472 ?auto_248475 ) ) ( not ( = ?auto_248472 ?auto_248476 ) ) ( not ( = ?auto_248472 ?auto_248477 ) ) ( not ( = ?auto_248472 ?auto_248478 ) ) ( not ( = ?auto_248473 ?auto_248474 ) ) ( not ( = ?auto_248473 ?auto_248475 ) ) ( not ( = ?auto_248473 ?auto_248476 ) ) ( not ( = ?auto_248473 ?auto_248477 ) ) ( not ( = ?auto_248473 ?auto_248478 ) ) ( not ( = ?auto_248474 ?auto_248475 ) ) ( not ( = ?auto_248474 ?auto_248476 ) ) ( not ( = ?auto_248474 ?auto_248477 ) ) ( not ( = ?auto_248474 ?auto_248478 ) ) ( not ( = ?auto_248475 ?auto_248476 ) ) ( not ( = ?auto_248475 ?auto_248477 ) ) ( not ( = ?auto_248475 ?auto_248478 ) ) ( not ( = ?auto_248476 ?auto_248477 ) ) ( not ( = ?auto_248476 ?auto_248478 ) ) ( not ( = ?auto_248477 ?auto_248478 ) ) ( ON ?auto_248476 ?auto_248477 ) ( CLEAR ?auto_248474 ) ( ON ?auto_248475 ?auto_248476 ) ( CLEAR ?auto_248475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248468 ?auto_248469 ?auto_248470 ?auto_248471 ?auto_248472 ?auto_248473 ?auto_248474 ?auto_248475 )
      ( MAKE-10PILE ?auto_248468 ?auto_248469 ?auto_248470 ?auto_248471 ?auto_248472 ?auto_248473 ?auto_248474 ?auto_248475 ?auto_248476 ?auto_248477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248489 - BLOCK
      ?auto_248490 - BLOCK
      ?auto_248491 - BLOCK
      ?auto_248492 - BLOCK
      ?auto_248493 - BLOCK
      ?auto_248494 - BLOCK
      ?auto_248495 - BLOCK
      ?auto_248496 - BLOCK
      ?auto_248497 - BLOCK
      ?auto_248498 - BLOCK
    )
    :vars
    (
      ?auto_248499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248498 ?auto_248499 ) ( ON-TABLE ?auto_248489 ) ( ON ?auto_248490 ?auto_248489 ) ( ON ?auto_248491 ?auto_248490 ) ( ON ?auto_248492 ?auto_248491 ) ( ON ?auto_248493 ?auto_248492 ) ( ON ?auto_248494 ?auto_248493 ) ( ON ?auto_248495 ?auto_248494 ) ( not ( = ?auto_248489 ?auto_248490 ) ) ( not ( = ?auto_248489 ?auto_248491 ) ) ( not ( = ?auto_248489 ?auto_248492 ) ) ( not ( = ?auto_248489 ?auto_248493 ) ) ( not ( = ?auto_248489 ?auto_248494 ) ) ( not ( = ?auto_248489 ?auto_248495 ) ) ( not ( = ?auto_248489 ?auto_248496 ) ) ( not ( = ?auto_248489 ?auto_248497 ) ) ( not ( = ?auto_248489 ?auto_248498 ) ) ( not ( = ?auto_248489 ?auto_248499 ) ) ( not ( = ?auto_248490 ?auto_248491 ) ) ( not ( = ?auto_248490 ?auto_248492 ) ) ( not ( = ?auto_248490 ?auto_248493 ) ) ( not ( = ?auto_248490 ?auto_248494 ) ) ( not ( = ?auto_248490 ?auto_248495 ) ) ( not ( = ?auto_248490 ?auto_248496 ) ) ( not ( = ?auto_248490 ?auto_248497 ) ) ( not ( = ?auto_248490 ?auto_248498 ) ) ( not ( = ?auto_248490 ?auto_248499 ) ) ( not ( = ?auto_248491 ?auto_248492 ) ) ( not ( = ?auto_248491 ?auto_248493 ) ) ( not ( = ?auto_248491 ?auto_248494 ) ) ( not ( = ?auto_248491 ?auto_248495 ) ) ( not ( = ?auto_248491 ?auto_248496 ) ) ( not ( = ?auto_248491 ?auto_248497 ) ) ( not ( = ?auto_248491 ?auto_248498 ) ) ( not ( = ?auto_248491 ?auto_248499 ) ) ( not ( = ?auto_248492 ?auto_248493 ) ) ( not ( = ?auto_248492 ?auto_248494 ) ) ( not ( = ?auto_248492 ?auto_248495 ) ) ( not ( = ?auto_248492 ?auto_248496 ) ) ( not ( = ?auto_248492 ?auto_248497 ) ) ( not ( = ?auto_248492 ?auto_248498 ) ) ( not ( = ?auto_248492 ?auto_248499 ) ) ( not ( = ?auto_248493 ?auto_248494 ) ) ( not ( = ?auto_248493 ?auto_248495 ) ) ( not ( = ?auto_248493 ?auto_248496 ) ) ( not ( = ?auto_248493 ?auto_248497 ) ) ( not ( = ?auto_248493 ?auto_248498 ) ) ( not ( = ?auto_248493 ?auto_248499 ) ) ( not ( = ?auto_248494 ?auto_248495 ) ) ( not ( = ?auto_248494 ?auto_248496 ) ) ( not ( = ?auto_248494 ?auto_248497 ) ) ( not ( = ?auto_248494 ?auto_248498 ) ) ( not ( = ?auto_248494 ?auto_248499 ) ) ( not ( = ?auto_248495 ?auto_248496 ) ) ( not ( = ?auto_248495 ?auto_248497 ) ) ( not ( = ?auto_248495 ?auto_248498 ) ) ( not ( = ?auto_248495 ?auto_248499 ) ) ( not ( = ?auto_248496 ?auto_248497 ) ) ( not ( = ?auto_248496 ?auto_248498 ) ) ( not ( = ?auto_248496 ?auto_248499 ) ) ( not ( = ?auto_248497 ?auto_248498 ) ) ( not ( = ?auto_248497 ?auto_248499 ) ) ( not ( = ?auto_248498 ?auto_248499 ) ) ( ON ?auto_248497 ?auto_248498 ) ( CLEAR ?auto_248495 ) ( ON ?auto_248496 ?auto_248497 ) ( CLEAR ?auto_248496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248489 ?auto_248490 ?auto_248491 ?auto_248492 ?auto_248493 ?auto_248494 ?auto_248495 ?auto_248496 )
      ( MAKE-10PILE ?auto_248489 ?auto_248490 ?auto_248491 ?auto_248492 ?auto_248493 ?auto_248494 ?auto_248495 ?auto_248496 ?auto_248497 ?auto_248498 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248510 - BLOCK
      ?auto_248511 - BLOCK
      ?auto_248512 - BLOCK
      ?auto_248513 - BLOCK
      ?auto_248514 - BLOCK
      ?auto_248515 - BLOCK
      ?auto_248516 - BLOCK
      ?auto_248517 - BLOCK
      ?auto_248518 - BLOCK
      ?auto_248519 - BLOCK
    )
    :vars
    (
      ?auto_248520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248519 ?auto_248520 ) ( ON-TABLE ?auto_248510 ) ( ON ?auto_248511 ?auto_248510 ) ( ON ?auto_248512 ?auto_248511 ) ( ON ?auto_248513 ?auto_248512 ) ( ON ?auto_248514 ?auto_248513 ) ( ON ?auto_248515 ?auto_248514 ) ( not ( = ?auto_248510 ?auto_248511 ) ) ( not ( = ?auto_248510 ?auto_248512 ) ) ( not ( = ?auto_248510 ?auto_248513 ) ) ( not ( = ?auto_248510 ?auto_248514 ) ) ( not ( = ?auto_248510 ?auto_248515 ) ) ( not ( = ?auto_248510 ?auto_248516 ) ) ( not ( = ?auto_248510 ?auto_248517 ) ) ( not ( = ?auto_248510 ?auto_248518 ) ) ( not ( = ?auto_248510 ?auto_248519 ) ) ( not ( = ?auto_248510 ?auto_248520 ) ) ( not ( = ?auto_248511 ?auto_248512 ) ) ( not ( = ?auto_248511 ?auto_248513 ) ) ( not ( = ?auto_248511 ?auto_248514 ) ) ( not ( = ?auto_248511 ?auto_248515 ) ) ( not ( = ?auto_248511 ?auto_248516 ) ) ( not ( = ?auto_248511 ?auto_248517 ) ) ( not ( = ?auto_248511 ?auto_248518 ) ) ( not ( = ?auto_248511 ?auto_248519 ) ) ( not ( = ?auto_248511 ?auto_248520 ) ) ( not ( = ?auto_248512 ?auto_248513 ) ) ( not ( = ?auto_248512 ?auto_248514 ) ) ( not ( = ?auto_248512 ?auto_248515 ) ) ( not ( = ?auto_248512 ?auto_248516 ) ) ( not ( = ?auto_248512 ?auto_248517 ) ) ( not ( = ?auto_248512 ?auto_248518 ) ) ( not ( = ?auto_248512 ?auto_248519 ) ) ( not ( = ?auto_248512 ?auto_248520 ) ) ( not ( = ?auto_248513 ?auto_248514 ) ) ( not ( = ?auto_248513 ?auto_248515 ) ) ( not ( = ?auto_248513 ?auto_248516 ) ) ( not ( = ?auto_248513 ?auto_248517 ) ) ( not ( = ?auto_248513 ?auto_248518 ) ) ( not ( = ?auto_248513 ?auto_248519 ) ) ( not ( = ?auto_248513 ?auto_248520 ) ) ( not ( = ?auto_248514 ?auto_248515 ) ) ( not ( = ?auto_248514 ?auto_248516 ) ) ( not ( = ?auto_248514 ?auto_248517 ) ) ( not ( = ?auto_248514 ?auto_248518 ) ) ( not ( = ?auto_248514 ?auto_248519 ) ) ( not ( = ?auto_248514 ?auto_248520 ) ) ( not ( = ?auto_248515 ?auto_248516 ) ) ( not ( = ?auto_248515 ?auto_248517 ) ) ( not ( = ?auto_248515 ?auto_248518 ) ) ( not ( = ?auto_248515 ?auto_248519 ) ) ( not ( = ?auto_248515 ?auto_248520 ) ) ( not ( = ?auto_248516 ?auto_248517 ) ) ( not ( = ?auto_248516 ?auto_248518 ) ) ( not ( = ?auto_248516 ?auto_248519 ) ) ( not ( = ?auto_248516 ?auto_248520 ) ) ( not ( = ?auto_248517 ?auto_248518 ) ) ( not ( = ?auto_248517 ?auto_248519 ) ) ( not ( = ?auto_248517 ?auto_248520 ) ) ( not ( = ?auto_248518 ?auto_248519 ) ) ( not ( = ?auto_248518 ?auto_248520 ) ) ( not ( = ?auto_248519 ?auto_248520 ) ) ( ON ?auto_248518 ?auto_248519 ) ( ON ?auto_248517 ?auto_248518 ) ( CLEAR ?auto_248515 ) ( ON ?auto_248516 ?auto_248517 ) ( CLEAR ?auto_248516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248510 ?auto_248511 ?auto_248512 ?auto_248513 ?auto_248514 ?auto_248515 ?auto_248516 )
      ( MAKE-10PILE ?auto_248510 ?auto_248511 ?auto_248512 ?auto_248513 ?auto_248514 ?auto_248515 ?auto_248516 ?auto_248517 ?auto_248518 ?auto_248519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248531 - BLOCK
      ?auto_248532 - BLOCK
      ?auto_248533 - BLOCK
      ?auto_248534 - BLOCK
      ?auto_248535 - BLOCK
      ?auto_248536 - BLOCK
      ?auto_248537 - BLOCK
      ?auto_248538 - BLOCK
      ?auto_248539 - BLOCK
      ?auto_248540 - BLOCK
    )
    :vars
    (
      ?auto_248541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248540 ?auto_248541 ) ( ON-TABLE ?auto_248531 ) ( ON ?auto_248532 ?auto_248531 ) ( ON ?auto_248533 ?auto_248532 ) ( ON ?auto_248534 ?auto_248533 ) ( ON ?auto_248535 ?auto_248534 ) ( ON ?auto_248536 ?auto_248535 ) ( not ( = ?auto_248531 ?auto_248532 ) ) ( not ( = ?auto_248531 ?auto_248533 ) ) ( not ( = ?auto_248531 ?auto_248534 ) ) ( not ( = ?auto_248531 ?auto_248535 ) ) ( not ( = ?auto_248531 ?auto_248536 ) ) ( not ( = ?auto_248531 ?auto_248537 ) ) ( not ( = ?auto_248531 ?auto_248538 ) ) ( not ( = ?auto_248531 ?auto_248539 ) ) ( not ( = ?auto_248531 ?auto_248540 ) ) ( not ( = ?auto_248531 ?auto_248541 ) ) ( not ( = ?auto_248532 ?auto_248533 ) ) ( not ( = ?auto_248532 ?auto_248534 ) ) ( not ( = ?auto_248532 ?auto_248535 ) ) ( not ( = ?auto_248532 ?auto_248536 ) ) ( not ( = ?auto_248532 ?auto_248537 ) ) ( not ( = ?auto_248532 ?auto_248538 ) ) ( not ( = ?auto_248532 ?auto_248539 ) ) ( not ( = ?auto_248532 ?auto_248540 ) ) ( not ( = ?auto_248532 ?auto_248541 ) ) ( not ( = ?auto_248533 ?auto_248534 ) ) ( not ( = ?auto_248533 ?auto_248535 ) ) ( not ( = ?auto_248533 ?auto_248536 ) ) ( not ( = ?auto_248533 ?auto_248537 ) ) ( not ( = ?auto_248533 ?auto_248538 ) ) ( not ( = ?auto_248533 ?auto_248539 ) ) ( not ( = ?auto_248533 ?auto_248540 ) ) ( not ( = ?auto_248533 ?auto_248541 ) ) ( not ( = ?auto_248534 ?auto_248535 ) ) ( not ( = ?auto_248534 ?auto_248536 ) ) ( not ( = ?auto_248534 ?auto_248537 ) ) ( not ( = ?auto_248534 ?auto_248538 ) ) ( not ( = ?auto_248534 ?auto_248539 ) ) ( not ( = ?auto_248534 ?auto_248540 ) ) ( not ( = ?auto_248534 ?auto_248541 ) ) ( not ( = ?auto_248535 ?auto_248536 ) ) ( not ( = ?auto_248535 ?auto_248537 ) ) ( not ( = ?auto_248535 ?auto_248538 ) ) ( not ( = ?auto_248535 ?auto_248539 ) ) ( not ( = ?auto_248535 ?auto_248540 ) ) ( not ( = ?auto_248535 ?auto_248541 ) ) ( not ( = ?auto_248536 ?auto_248537 ) ) ( not ( = ?auto_248536 ?auto_248538 ) ) ( not ( = ?auto_248536 ?auto_248539 ) ) ( not ( = ?auto_248536 ?auto_248540 ) ) ( not ( = ?auto_248536 ?auto_248541 ) ) ( not ( = ?auto_248537 ?auto_248538 ) ) ( not ( = ?auto_248537 ?auto_248539 ) ) ( not ( = ?auto_248537 ?auto_248540 ) ) ( not ( = ?auto_248537 ?auto_248541 ) ) ( not ( = ?auto_248538 ?auto_248539 ) ) ( not ( = ?auto_248538 ?auto_248540 ) ) ( not ( = ?auto_248538 ?auto_248541 ) ) ( not ( = ?auto_248539 ?auto_248540 ) ) ( not ( = ?auto_248539 ?auto_248541 ) ) ( not ( = ?auto_248540 ?auto_248541 ) ) ( ON ?auto_248539 ?auto_248540 ) ( ON ?auto_248538 ?auto_248539 ) ( CLEAR ?auto_248536 ) ( ON ?auto_248537 ?auto_248538 ) ( CLEAR ?auto_248537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248531 ?auto_248532 ?auto_248533 ?auto_248534 ?auto_248535 ?auto_248536 ?auto_248537 )
      ( MAKE-10PILE ?auto_248531 ?auto_248532 ?auto_248533 ?auto_248534 ?auto_248535 ?auto_248536 ?auto_248537 ?auto_248538 ?auto_248539 ?auto_248540 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248552 - BLOCK
      ?auto_248553 - BLOCK
      ?auto_248554 - BLOCK
      ?auto_248555 - BLOCK
      ?auto_248556 - BLOCK
      ?auto_248557 - BLOCK
      ?auto_248558 - BLOCK
      ?auto_248559 - BLOCK
      ?auto_248560 - BLOCK
      ?auto_248561 - BLOCK
    )
    :vars
    (
      ?auto_248562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248561 ?auto_248562 ) ( ON-TABLE ?auto_248552 ) ( ON ?auto_248553 ?auto_248552 ) ( ON ?auto_248554 ?auto_248553 ) ( ON ?auto_248555 ?auto_248554 ) ( ON ?auto_248556 ?auto_248555 ) ( not ( = ?auto_248552 ?auto_248553 ) ) ( not ( = ?auto_248552 ?auto_248554 ) ) ( not ( = ?auto_248552 ?auto_248555 ) ) ( not ( = ?auto_248552 ?auto_248556 ) ) ( not ( = ?auto_248552 ?auto_248557 ) ) ( not ( = ?auto_248552 ?auto_248558 ) ) ( not ( = ?auto_248552 ?auto_248559 ) ) ( not ( = ?auto_248552 ?auto_248560 ) ) ( not ( = ?auto_248552 ?auto_248561 ) ) ( not ( = ?auto_248552 ?auto_248562 ) ) ( not ( = ?auto_248553 ?auto_248554 ) ) ( not ( = ?auto_248553 ?auto_248555 ) ) ( not ( = ?auto_248553 ?auto_248556 ) ) ( not ( = ?auto_248553 ?auto_248557 ) ) ( not ( = ?auto_248553 ?auto_248558 ) ) ( not ( = ?auto_248553 ?auto_248559 ) ) ( not ( = ?auto_248553 ?auto_248560 ) ) ( not ( = ?auto_248553 ?auto_248561 ) ) ( not ( = ?auto_248553 ?auto_248562 ) ) ( not ( = ?auto_248554 ?auto_248555 ) ) ( not ( = ?auto_248554 ?auto_248556 ) ) ( not ( = ?auto_248554 ?auto_248557 ) ) ( not ( = ?auto_248554 ?auto_248558 ) ) ( not ( = ?auto_248554 ?auto_248559 ) ) ( not ( = ?auto_248554 ?auto_248560 ) ) ( not ( = ?auto_248554 ?auto_248561 ) ) ( not ( = ?auto_248554 ?auto_248562 ) ) ( not ( = ?auto_248555 ?auto_248556 ) ) ( not ( = ?auto_248555 ?auto_248557 ) ) ( not ( = ?auto_248555 ?auto_248558 ) ) ( not ( = ?auto_248555 ?auto_248559 ) ) ( not ( = ?auto_248555 ?auto_248560 ) ) ( not ( = ?auto_248555 ?auto_248561 ) ) ( not ( = ?auto_248555 ?auto_248562 ) ) ( not ( = ?auto_248556 ?auto_248557 ) ) ( not ( = ?auto_248556 ?auto_248558 ) ) ( not ( = ?auto_248556 ?auto_248559 ) ) ( not ( = ?auto_248556 ?auto_248560 ) ) ( not ( = ?auto_248556 ?auto_248561 ) ) ( not ( = ?auto_248556 ?auto_248562 ) ) ( not ( = ?auto_248557 ?auto_248558 ) ) ( not ( = ?auto_248557 ?auto_248559 ) ) ( not ( = ?auto_248557 ?auto_248560 ) ) ( not ( = ?auto_248557 ?auto_248561 ) ) ( not ( = ?auto_248557 ?auto_248562 ) ) ( not ( = ?auto_248558 ?auto_248559 ) ) ( not ( = ?auto_248558 ?auto_248560 ) ) ( not ( = ?auto_248558 ?auto_248561 ) ) ( not ( = ?auto_248558 ?auto_248562 ) ) ( not ( = ?auto_248559 ?auto_248560 ) ) ( not ( = ?auto_248559 ?auto_248561 ) ) ( not ( = ?auto_248559 ?auto_248562 ) ) ( not ( = ?auto_248560 ?auto_248561 ) ) ( not ( = ?auto_248560 ?auto_248562 ) ) ( not ( = ?auto_248561 ?auto_248562 ) ) ( ON ?auto_248560 ?auto_248561 ) ( ON ?auto_248559 ?auto_248560 ) ( ON ?auto_248558 ?auto_248559 ) ( CLEAR ?auto_248556 ) ( ON ?auto_248557 ?auto_248558 ) ( CLEAR ?auto_248557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248552 ?auto_248553 ?auto_248554 ?auto_248555 ?auto_248556 ?auto_248557 )
      ( MAKE-10PILE ?auto_248552 ?auto_248553 ?auto_248554 ?auto_248555 ?auto_248556 ?auto_248557 ?auto_248558 ?auto_248559 ?auto_248560 ?auto_248561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248573 - BLOCK
      ?auto_248574 - BLOCK
      ?auto_248575 - BLOCK
      ?auto_248576 - BLOCK
      ?auto_248577 - BLOCK
      ?auto_248578 - BLOCK
      ?auto_248579 - BLOCK
      ?auto_248580 - BLOCK
      ?auto_248581 - BLOCK
      ?auto_248582 - BLOCK
    )
    :vars
    (
      ?auto_248583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248582 ?auto_248583 ) ( ON-TABLE ?auto_248573 ) ( ON ?auto_248574 ?auto_248573 ) ( ON ?auto_248575 ?auto_248574 ) ( ON ?auto_248576 ?auto_248575 ) ( ON ?auto_248577 ?auto_248576 ) ( not ( = ?auto_248573 ?auto_248574 ) ) ( not ( = ?auto_248573 ?auto_248575 ) ) ( not ( = ?auto_248573 ?auto_248576 ) ) ( not ( = ?auto_248573 ?auto_248577 ) ) ( not ( = ?auto_248573 ?auto_248578 ) ) ( not ( = ?auto_248573 ?auto_248579 ) ) ( not ( = ?auto_248573 ?auto_248580 ) ) ( not ( = ?auto_248573 ?auto_248581 ) ) ( not ( = ?auto_248573 ?auto_248582 ) ) ( not ( = ?auto_248573 ?auto_248583 ) ) ( not ( = ?auto_248574 ?auto_248575 ) ) ( not ( = ?auto_248574 ?auto_248576 ) ) ( not ( = ?auto_248574 ?auto_248577 ) ) ( not ( = ?auto_248574 ?auto_248578 ) ) ( not ( = ?auto_248574 ?auto_248579 ) ) ( not ( = ?auto_248574 ?auto_248580 ) ) ( not ( = ?auto_248574 ?auto_248581 ) ) ( not ( = ?auto_248574 ?auto_248582 ) ) ( not ( = ?auto_248574 ?auto_248583 ) ) ( not ( = ?auto_248575 ?auto_248576 ) ) ( not ( = ?auto_248575 ?auto_248577 ) ) ( not ( = ?auto_248575 ?auto_248578 ) ) ( not ( = ?auto_248575 ?auto_248579 ) ) ( not ( = ?auto_248575 ?auto_248580 ) ) ( not ( = ?auto_248575 ?auto_248581 ) ) ( not ( = ?auto_248575 ?auto_248582 ) ) ( not ( = ?auto_248575 ?auto_248583 ) ) ( not ( = ?auto_248576 ?auto_248577 ) ) ( not ( = ?auto_248576 ?auto_248578 ) ) ( not ( = ?auto_248576 ?auto_248579 ) ) ( not ( = ?auto_248576 ?auto_248580 ) ) ( not ( = ?auto_248576 ?auto_248581 ) ) ( not ( = ?auto_248576 ?auto_248582 ) ) ( not ( = ?auto_248576 ?auto_248583 ) ) ( not ( = ?auto_248577 ?auto_248578 ) ) ( not ( = ?auto_248577 ?auto_248579 ) ) ( not ( = ?auto_248577 ?auto_248580 ) ) ( not ( = ?auto_248577 ?auto_248581 ) ) ( not ( = ?auto_248577 ?auto_248582 ) ) ( not ( = ?auto_248577 ?auto_248583 ) ) ( not ( = ?auto_248578 ?auto_248579 ) ) ( not ( = ?auto_248578 ?auto_248580 ) ) ( not ( = ?auto_248578 ?auto_248581 ) ) ( not ( = ?auto_248578 ?auto_248582 ) ) ( not ( = ?auto_248578 ?auto_248583 ) ) ( not ( = ?auto_248579 ?auto_248580 ) ) ( not ( = ?auto_248579 ?auto_248581 ) ) ( not ( = ?auto_248579 ?auto_248582 ) ) ( not ( = ?auto_248579 ?auto_248583 ) ) ( not ( = ?auto_248580 ?auto_248581 ) ) ( not ( = ?auto_248580 ?auto_248582 ) ) ( not ( = ?auto_248580 ?auto_248583 ) ) ( not ( = ?auto_248581 ?auto_248582 ) ) ( not ( = ?auto_248581 ?auto_248583 ) ) ( not ( = ?auto_248582 ?auto_248583 ) ) ( ON ?auto_248581 ?auto_248582 ) ( ON ?auto_248580 ?auto_248581 ) ( ON ?auto_248579 ?auto_248580 ) ( CLEAR ?auto_248577 ) ( ON ?auto_248578 ?auto_248579 ) ( CLEAR ?auto_248578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_248573 ?auto_248574 ?auto_248575 ?auto_248576 ?auto_248577 ?auto_248578 )
      ( MAKE-10PILE ?auto_248573 ?auto_248574 ?auto_248575 ?auto_248576 ?auto_248577 ?auto_248578 ?auto_248579 ?auto_248580 ?auto_248581 ?auto_248582 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248594 - BLOCK
      ?auto_248595 - BLOCK
      ?auto_248596 - BLOCK
      ?auto_248597 - BLOCK
      ?auto_248598 - BLOCK
      ?auto_248599 - BLOCK
      ?auto_248600 - BLOCK
      ?auto_248601 - BLOCK
      ?auto_248602 - BLOCK
      ?auto_248603 - BLOCK
    )
    :vars
    (
      ?auto_248604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248603 ?auto_248604 ) ( ON-TABLE ?auto_248594 ) ( ON ?auto_248595 ?auto_248594 ) ( ON ?auto_248596 ?auto_248595 ) ( ON ?auto_248597 ?auto_248596 ) ( not ( = ?auto_248594 ?auto_248595 ) ) ( not ( = ?auto_248594 ?auto_248596 ) ) ( not ( = ?auto_248594 ?auto_248597 ) ) ( not ( = ?auto_248594 ?auto_248598 ) ) ( not ( = ?auto_248594 ?auto_248599 ) ) ( not ( = ?auto_248594 ?auto_248600 ) ) ( not ( = ?auto_248594 ?auto_248601 ) ) ( not ( = ?auto_248594 ?auto_248602 ) ) ( not ( = ?auto_248594 ?auto_248603 ) ) ( not ( = ?auto_248594 ?auto_248604 ) ) ( not ( = ?auto_248595 ?auto_248596 ) ) ( not ( = ?auto_248595 ?auto_248597 ) ) ( not ( = ?auto_248595 ?auto_248598 ) ) ( not ( = ?auto_248595 ?auto_248599 ) ) ( not ( = ?auto_248595 ?auto_248600 ) ) ( not ( = ?auto_248595 ?auto_248601 ) ) ( not ( = ?auto_248595 ?auto_248602 ) ) ( not ( = ?auto_248595 ?auto_248603 ) ) ( not ( = ?auto_248595 ?auto_248604 ) ) ( not ( = ?auto_248596 ?auto_248597 ) ) ( not ( = ?auto_248596 ?auto_248598 ) ) ( not ( = ?auto_248596 ?auto_248599 ) ) ( not ( = ?auto_248596 ?auto_248600 ) ) ( not ( = ?auto_248596 ?auto_248601 ) ) ( not ( = ?auto_248596 ?auto_248602 ) ) ( not ( = ?auto_248596 ?auto_248603 ) ) ( not ( = ?auto_248596 ?auto_248604 ) ) ( not ( = ?auto_248597 ?auto_248598 ) ) ( not ( = ?auto_248597 ?auto_248599 ) ) ( not ( = ?auto_248597 ?auto_248600 ) ) ( not ( = ?auto_248597 ?auto_248601 ) ) ( not ( = ?auto_248597 ?auto_248602 ) ) ( not ( = ?auto_248597 ?auto_248603 ) ) ( not ( = ?auto_248597 ?auto_248604 ) ) ( not ( = ?auto_248598 ?auto_248599 ) ) ( not ( = ?auto_248598 ?auto_248600 ) ) ( not ( = ?auto_248598 ?auto_248601 ) ) ( not ( = ?auto_248598 ?auto_248602 ) ) ( not ( = ?auto_248598 ?auto_248603 ) ) ( not ( = ?auto_248598 ?auto_248604 ) ) ( not ( = ?auto_248599 ?auto_248600 ) ) ( not ( = ?auto_248599 ?auto_248601 ) ) ( not ( = ?auto_248599 ?auto_248602 ) ) ( not ( = ?auto_248599 ?auto_248603 ) ) ( not ( = ?auto_248599 ?auto_248604 ) ) ( not ( = ?auto_248600 ?auto_248601 ) ) ( not ( = ?auto_248600 ?auto_248602 ) ) ( not ( = ?auto_248600 ?auto_248603 ) ) ( not ( = ?auto_248600 ?auto_248604 ) ) ( not ( = ?auto_248601 ?auto_248602 ) ) ( not ( = ?auto_248601 ?auto_248603 ) ) ( not ( = ?auto_248601 ?auto_248604 ) ) ( not ( = ?auto_248602 ?auto_248603 ) ) ( not ( = ?auto_248602 ?auto_248604 ) ) ( not ( = ?auto_248603 ?auto_248604 ) ) ( ON ?auto_248602 ?auto_248603 ) ( ON ?auto_248601 ?auto_248602 ) ( ON ?auto_248600 ?auto_248601 ) ( ON ?auto_248599 ?auto_248600 ) ( CLEAR ?auto_248597 ) ( ON ?auto_248598 ?auto_248599 ) ( CLEAR ?auto_248598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248594 ?auto_248595 ?auto_248596 ?auto_248597 ?auto_248598 )
      ( MAKE-10PILE ?auto_248594 ?auto_248595 ?auto_248596 ?auto_248597 ?auto_248598 ?auto_248599 ?auto_248600 ?auto_248601 ?auto_248602 ?auto_248603 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248615 - BLOCK
      ?auto_248616 - BLOCK
      ?auto_248617 - BLOCK
      ?auto_248618 - BLOCK
      ?auto_248619 - BLOCK
      ?auto_248620 - BLOCK
      ?auto_248621 - BLOCK
      ?auto_248622 - BLOCK
      ?auto_248623 - BLOCK
      ?auto_248624 - BLOCK
    )
    :vars
    (
      ?auto_248625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248624 ?auto_248625 ) ( ON-TABLE ?auto_248615 ) ( ON ?auto_248616 ?auto_248615 ) ( ON ?auto_248617 ?auto_248616 ) ( ON ?auto_248618 ?auto_248617 ) ( not ( = ?auto_248615 ?auto_248616 ) ) ( not ( = ?auto_248615 ?auto_248617 ) ) ( not ( = ?auto_248615 ?auto_248618 ) ) ( not ( = ?auto_248615 ?auto_248619 ) ) ( not ( = ?auto_248615 ?auto_248620 ) ) ( not ( = ?auto_248615 ?auto_248621 ) ) ( not ( = ?auto_248615 ?auto_248622 ) ) ( not ( = ?auto_248615 ?auto_248623 ) ) ( not ( = ?auto_248615 ?auto_248624 ) ) ( not ( = ?auto_248615 ?auto_248625 ) ) ( not ( = ?auto_248616 ?auto_248617 ) ) ( not ( = ?auto_248616 ?auto_248618 ) ) ( not ( = ?auto_248616 ?auto_248619 ) ) ( not ( = ?auto_248616 ?auto_248620 ) ) ( not ( = ?auto_248616 ?auto_248621 ) ) ( not ( = ?auto_248616 ?auto_248622 ) ) ( not ( = ?auto_248616 ?auto_248623 ) ) ( not ( = ?auto_248616 ?auto_248624 ) ) ( not ( = ?auto_248616 ?auto_248625 ) ) ( not ( = ?auto_248617 ?auto_248618 ) ) ( not ( = ?auto_248617 ?auto_248619 ) ) ( not ( = ?auto_248617 ?auto_248620 ) ) ( not ( = ?auto_248617 ?auto_248621 ) ) ( not ( = ?auto_248617 ?auto_248622 ) ) ( not ( = ?auto_248617 ?auto_248623 ) ) ( not ( = ?auto_248617 ?auto_248624 ) ) ( not ( = ?auto_248617 ?auto_248625 ) ) ( not ( = ?auto_248618 ?auto_248619 ) ) ( not ( = ?auto_248618 ?auto_248620 ) ) ( not ( = ?auto_248618 ?auto_248621 ) ) ( not ( = ?auto_248618 ?auto_248622 ) ) ( not ( = ?auto_248618 ?auto_248623 ) ) ( not ( = ?auto_248618 ?auto_248624 ) ) ( not ( = ?auto_248618 ?auto_248625 ) ) ( not ( = ?auto_248619 ?auto_248620 ) ) ( not ( = ?auto_248619 ?auto_248621 ) ) ( not ( = ?auto_248619 ?auto_248622 ) ) ( not ( = ?auto_248619 ?auto_248623 ) ) ( not ( = ?auto_248619 ?auto_248624 ) ) ( not ( = ?auto_248619 ?auto_248625 ) ) ( not ( = ?auto_248620 ?auto_248621 ) ) ( not ( = ?auto_248620 ?auto_248622 ) ) ( not ( = ?auto_248620 ?auto_248623 ) ) ( not ( = ?auto_248620 ?auto_248624 ) ) ( not ( = ?auto_248620 ?auto_248625 ) ) ( not ( = ?auto_248621 ?auto_248622 ) ) ( not ( = ?auto_248621 ?auto_248623 ) ) ( not ( = ?auto_248621 ?auto_248624 ) ) ( not ( = ?auto_248621 ?auto_248625 ) ) ( not ( = ?auto_248622 ?auto_248623 ) ) ( not ( = ?auto_248622 ?auto_248624 ) ) ( not ( = ?auto_248622 ?auto_248625 ) ) ( not ( = ?auto_248623 ?auto_248624 ) ) ( not ( = ?auto_248623 ?auto_248625 ) ) ( not ( = ?auto_248624 ?auto_248625 ) ) ( ON ?auto_248623 ?auto_248624 ) ( ON ?auto_248622 ?auto_248623 ) ( ON ?auto_248621 ?auto_248622 ) ( ON ?auto_248620 ?auto_248621 ) ( CLEAR ?auto_248618 ) ( ON ?auto_248619 ?auto_248620 ) ( CLEAR ?auto_248619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_248615 ?auto_248616 ?auto_248617 ?auto_248618 ?auto_248619 )
      ( MAKE-10PILE ?auto_248615 ?auto_248616 ?auto_248617 ?auto_248618 ?auto_248619 ?auto_248620 ?auto_248621 ?auto_248622 ?auto_248623 ?auto_248624 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248636 - BLOCK
      ?auto_248637 - BLOCK
      ?auto_248638 - BLOCK
      ?auto_248639 - BLOCK
      ?auto_248640 - BLOCK
      ?auto_248641 - BLOCK
      ?auto_248642 - BLOCK
      ?auto_248643 - BLOCK
      ?auto_248644 - BLOCK
      ?auto_248645 - BLOCK
    )
    :vars
    (
      ?auto_248646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248645 ?auto_248646 ) ( ON-TABLE ?auto_248636 ) ( ON ?auto_248637 ?auto_248636 ) ( ON ?auto_248638 ?auto_248637 ) ( not ( = ?auto_248636 ?auto_248637 ) ) ( not ( = ?auto_248636 ?auto_248638 ) ) ( not ( = ?auto_248636 ?auto_248639 ) ) ( not ( = ?auto_248636 ?auto_248640 ) ) ( not ( = ?auto_248636 ?auto_248641 ) ) ( not ( = ?auto_248636 ?auto_248642 ) ) ( not ( = ?auto_248636 ?auto_248643 ) ) ( not ( = ?auto_248636 ?auto_248644 ) ) ( not ( = ?auto_248636 ?auto_248645 ) ) ( not ( = ?auto_248636 ?auto_248646 ) ) ( not ( = ?auto_248637 ?auto_248638 ) ) ( not ( = ?auto_248637 ?auto_248639 ) ) ( not ( = ?auto_248637 ?auto_248640 ) ) ( not ( = ?auto_248637 ?auto_248641 ) ) ( not ( = ?auto_248637 ?auto_248642 ) ) ( not ( = ?auto_248637 ?auto_248643 ) ) ( not ( = ?auto_248637 ?auto_248644 ) ) ( not ( = ?auto_248637 ?auto_248645 ) ) ( not ( = ?auto_248637 ?auto_248646 ) ) ( not ( = ?auto_248638 ?auto_248639 ) ) ( not ( = ?auto_248638 ?auto_248640 ) ) ( not ( = ?auto_248638 ?auto_248641 ) ) ( not ( = ?auto_248638 ?auto_248642 ) ) ( not ( = ?auto_248638 ?auto_248643 ) ) ( not ( = ?auto_248638 ?auto_248644 ) ) ( not ( = ?auto_248638 ?auto_248645 ) ) ( not ( = ?auto_248638 ?auto_248646 ) ) ( not ( = ?auto_248639 ?auto_248640 ) ) ( not ( = ?auto_248639 ?auto_248641 ) ) ( not ( = ?auto_248639 ?auto_248642 ) ) ( not ( = ?auto_248639 ?auto_248643 ) ) ( not ( = ?auto_248639 ?auto_248644 ) ) ( not ( = ?auto_248639 ?auto_248645 ) ) ( not ( = ?auto_248639 ?auto_248646 ) ) ( not ( = ?auto_248640 ?auto_248641 ) ) ( not ( = ?auto_248640 ?auto_248642 ) ) ( not ( = ?auto_248640 ?auto_248643 ) ) ( not ( = ?auto_248640 ?auto_248644 ) ) ( not ( = ?auto_248640 ?auto_248645 ) ) ( not ( = ?auto_248640 ?auto_248646 ) ) ( not ( = ?auto_248641 ?auto_248642 ) ) ( not ( = ?auto_248641 ?auto_248643 ) ) ( not ( = ?auto_248641 ?auto_248644 ) ) ( not ( = ?auto_248641 ?auto_248645 ) ) ( not ( = ?auto_248641 ?auto_248646 ) ) ( not ( = ?auto_248642 ?auto_248643 ) ) ( not ( = ?auto_248642 ?auto_248644 ) ) ( not ( = ?auto_248642 ?auto_248645 ) ) ( not ( = ?auto_248642 ?auto_248646 ) ) ( not ( = ?auto_248643 ?auto_248644 ) ) ( not ( = ?auto_248643 ?auto_248645 ) ) ( not ( = ?auto_248643 ?auto_248646 ) ) ( not ( = ?auto_248644 ?auto_248645 ) ) ( not ( = ?auto_248644 ?auto_248646 ) ) ( not ( = ?auto_248645 ?auto_248646 ) ) ( ON ?auto_248644 ?auto_248645 ) ( ON ?auto_248643 ?auto_248644 ) ( ON ?auto_248642 ?auto_248643 ) ( ON ?auto_248641 ?auto_248642 ) ( ON ?auto_248640 ?auto_248641 ) ( CLEAR ?auto_248638 ) ( ON ?auto_248639 ?auto_248640 ) ( CLEAR ?auto_248639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248636 ?auto_248637 ?auto_248638 ?auto_248639 )
      ( MAKE-10PILE ?auto_248636 ?auto_248637 ?auto_248638 ?auto_248639 ?auto_248640 ?auto_248641 ?auto_248642 ?auto_248643 ?auto_248644 ?auto_248645 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248657 - BLOCK
      ?auto_248658 - BLOCK
      ?auto_248659 - BLOCK
      ?auto_248660 - BLOCK
      ?auto_248661 - BLOCK
      ?auto_248662 - BLOCK
      ?auto_248663 - BLOCK
      ?auto_248664 - BLOCK
      ?auto_248665 - BLOCK
      ?auto_248666 - BLOCK
    )
    :vars
    (
      ?auto_248667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248666 ?auto_248667 ) ( ON-TABLE ?auto_248657 ) ( ON ?auto_248658 ?auto_248657 ) ( ON ?auto_248659 ?auto_248658 ) ( not ( = ?auto_248657 ?auto_248658 ) ) ( not ( = ?auto_248657 ?auto_248659 ) ) ( not ( = ?auto_248657 ?auto_248660 ) ) ( not ( = ?auto_248657 ?auto_248661 ) ) ( not ( = ?auto_248657 ?auto_248662 ) ) ( not ( = ?auto_248657 ?auto_248663 ) ) ( not ( = ?auto_248657 ?auto_248664 ) ) ( not ( = ?auto_248657 ?auto_248665 ) ) ( not ( = ?auto_248657 ?auto_248666 ) ) ( not ( = ?auto_248657 ?auto_248667 ) ) ( not ( = ?auto_248658 ?auto_248659 ) ) ( not ( = ?auto_248658 ?auto_248660 ) ) ( not ( = ?auto_248658 ?auto_248661 ) ) ( not ( = ?auto_248658 ?auto_248662 ) ) ( not ( = ?auto_248658 ?auto_248663 ) ) ( not ( = ?auto_248658 ?auto_248664 ) ) ( not ( = ?auto_248658 ?auto_248665 ) ) ( not ( = ?auto_248658 ?auto_248666 ) ) ( not ( = ?auto_248658 ?auto_248667 ) ) ( not ( = ?auto_248659 ?auto_248660 ) ) ( not ( = ?auto_248659 ?auto_248661 ) ) ( not ( = ?auto_248659 ?auto_248662 ) ) ( not ( = ?auto_248659 ?auto_248663 ) ) ( not ( = ?auto_248659 ?auto_248664 ) ) ( not ( = ?auto_248659 ?auto_248665 ) ) ( not ( = ?auto_248659 ?auto_248666 ) ) ( not ( = ?auto_248659 ?auto_248667 ) ) ( not ( = ?auto_248660 ?auto_248661 ) ) ( not ( = ?auto_248660 ?auto_248662 ) ) ( not ( = ?auto_248660 ?auto_248663 ) ) ( not ( = ?auto_248660 ?auto_248664 ) ) ( not ( = ?auto_248660 ?auto_248665 ) ) ( not ( = ?auto_248660 ?auto_248666 ) ) ( not ( = ?auto_248660 ?auto_248667 ) ) ( not ( = ?auto_248661 ?auto_248662 ) ) ( not ( = ?auto_248661 ?auto_248663 ) ) ( not ( = ?auto_248661 ?auto_248664 ) ) ( not ( = ?auto_248661 ?auto_248665 ) ) ( not ( = ?auto_248661 ?auto_248666 ) ) ( not ( = ?auto_248661 ?auto_248667 ) ) ( not ( = ?auto_248662 ?auto_248663 ) ) ( not ( = ?auto_248662 ?auto_248664 ) ) ( not ( = ?auto_248662 ?auto_248665 ) ) ( not ( = ?auto_248662 ?auto_248666 ) ) ( not ( = ?auto_248662 ?auto_248667 ) ) ( not ( = ?auto_248663 ?auto_248664 ) ) ( not ( = ?auto_248663 ?auto_248665 ) ) ( not ( = ?auto_248663 ?auto_248666 ) ) ( not ( = ?auto_248663 ?auto_248667 ) ) ( not ( = ?auto_248664 ?auto_248665 ) ) ( not ( = ?auto_248664 ?auto_248666 ) ) ( not ( = ?auto_248664 ?auto_248667 ) ) ( not ( = ?auto_248665 ?auto_248666 ) ) ( not ( = ?auto_248665 ?auto_248667 ) ) ( not ( = ?auto_248666 ?auto_248667 ) ) ( ON ?auto_248665 ?auto_248666 ) ( ON ?auto_248664 ?auto_248665 ) ( ON ?auto_248663 ?auto_248664 ) ( ON ?auto_248662 ?auto_248663 ) ( ON ?auto_248661 ?auto_248662 ) ( CLEAR ?auto_248659 ) ( ON ?auto_248660 ?auto_248661 ) ( CLEAR ?auto_248660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_248657 ?auto_248658 ?auto_248659 ?auto_248660 )
      ( MAKE-10PILE ?auto_248657 ?auto_248658 ?auto_248659 ?auto_248660 ?auto_248661 ?auto_248662 ?auto_248663 ?auto_248664 ?auto_248665 ?auto_248666 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248678 - BLOCK
      ?auto_248679 - BLOCK
      ?auto_248680 - BLOCK
      ?auto_248681 - BLOCK
      ?auto_248682 - BLOCK
      ?auto_248683 - BLOCK
      ?auto_248684 - BLOCK
      ?auto_248685 - BLOCK
      ?auto_248686 - BLOCK
      ?auto_248687 - BLOCK
    )
    :vars
    (
      ?auto_248688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248687 ?auto_248688 ) ( ON-TABLE ?auto_248678 ) ( ON ?auto_248679 ?auto_248678 ) ( not ( = ?auto_248678 ?auto_248679 ) ) ( not ( = ?auto_248678 ?auto_248680 ) ) ( not ( = ?auto_248678 ?auto_248681 ) ) ( not ( = ?auto_248678 ?auto_248682 ) ) ( not ( = ?auto_248678 ?auto_248683 ) ) ( not ( = ?auto_248678 ?auto_248684 ) ) ( not ( = ?auto_248678 ?auto_248685 ) ) ( not ( = ?auto_248678 ?auto_248686 ) ) ( not ( = ?auto_248678 ?auto_248687 ) ) ( not ( = ?auto_248678 ?auto_248688 ) ) ( not ( = ?auto_248679 ?auto_248680 ) ) ( not ( = ?auto_248679 ?auto_248681 ) ) ( not ( = ?auto_248679 ?auto_248682 ) ) ( not ( = ?auto_248679 ?auto_248683 ) ) ( not ( = ?auto_248679 ?auto_248684 ) ) ( not ( = ?auto_248679 ?auto_248685 ) ) ( not ( = ?auto_248679 ?auto_248686 ) ) ( not ( = ?auto_248679 ?auto_248687 ) ) ( not ( = ?auto_248679 ?auto_248688 ) ) ( not ( = ?auto_248680 ?auto_248681 ) ) ( not ( = ?auto_248680 ?auto_248682 ) ) ( not ( = ?auto_248680 ?auto_248683 ) ) ( not ( = ?auto_248680 ?auto_248684 ) ) ( not ( = ?auto_248680 ?auto_248685 ) ) ( not ( = ?auto_248680 ?auto_248686 ) ) ( not ( = ?auto_248680 ?auto_248687 ) ) ( not ( = ?auto_248680 ?auto_248688 ) ) ( not ( = ?auto_248681 ?auto_248682 ) ) ( not ( = ?auto_248681 ?auto_248683 ) ) ( not ( = ?auto_248681 ?auto_248684 ) ) ( not ( = ?auto_248681 ?auto_248685 ) ) ( not ( = ?auto_248681 ?auto_248686 ) ) ( not ( = ?auto_248681 ?auto_248687 ) ) ( not ( = ?auto_248681 ?auto_248688 ) ) ( not ( = ?auto_248682 ?auto_248683 ) ) ( not ( = ?auto_248682 ?auto_248684 ) ) ( not ( = ?auto_248682 ?auto_248685 ) ) ( not ( = ?auto_248682 ?auto_248686 ) ) ( not ( = ?auto_248682 ?auto_248687 ) ) ( not ( = ?auto_248682 ?auto_248688 ) ) ( not ( = ?auto_248683 ?auto_248684 ) ) ( not ( = ?auto_248683 ?auto_248685 ) ) ( not ( = ?auto_248683 ?auto_248686 ) ) ( not ( = ?auto_248683 ?auto_248687 ) ) ( not ( = ?auto_248683 ?auto_248688 ) ) ( not ( = ?auto_248684 ?auto_248685 ) ) ( not ( = ?auto_248684 ?auto_248686 ) ) ( not ( = ?auto_248684 ?auto_248687 ) ) ( not ( = ?auto_248684 ?auto_248688 ) ) ( not ( = ?auto_248685 ?auto_248686 ) ) ( not ( = ?auto_248685 ?auto_248687 ) ) ( not ( = ?auto_248685 ?auto_248688 ) ) ( not ( = ?auto_248686 ?auto_248687 ) ) ( not ( = ?auto_248686 ?auto_248688 ) ) ( not ( = ?auto_248687 ?auto_248688 ) ) ( ON ?auto_248686 ?auto_248687 ) ( ON ?auto_248685 ?auto_248686 ) ( ON ?auto_248684 ?auto_248685 ) ( ON ?auto_248683 ?auto_248684 ) ( ON ?auto_248682 ?auto_248683 ) ( ON ?auto_248681 ?auto_248682 ) ( CLEAR ?auto_248679 ) ( ON ?auto_248680 ?auto_248681 ) ( CLEAR ?auto_248680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248678 ?auto_248679 ?auto_248680 )
      ( MAKE-10PILE ?auto_248678 ?auto_248679 ?auto_248680 ?auto_248681 ?auto_248682 ?auto_248683 ?auto_248684 ?auto_248685 ?auto_248686 ?auto_248687 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248699 - BLOCK
      ?auto_248700 - BLOCK
      ?auto_248701 - BLOCK
      ?auto_248702 - BLOCK
      ?auto_248703 - BLOCK
      ?auto_248704 - BLOCK
      ?auto_248705 - BLOCK
      ?auto_248706 - BLOCK
      ?auto_248707 - BLOCK
      ?auto_248708 - BLOCK
    )
    :vars
    (
      ?auto_248709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248708 ?auto_248709 ) ( ON-TABLE ?auto_248699 ) ( ON ?auto_248700 ?auto_248699 ) ( not ( = ?auto_248699 ?auto_248700 ) ) ( not ( = ?auto_248699 ?auto_248701 ) ) ( not ( = ?auto_248699 ?auto_248702 ) ) ( not ( = ?auto_248699 ?auto_248703 ) ) ( not ( = ?auto_248699 ?auto_248704 ) ) ( not ( = ?auto_248699 ?auto_248705 ) ) ( not ( = ?auto_248699 ?auto_248706 ) ) ( not ( = ?auto_248699 ?auto_248707 ) ) ( not ( = ?auto_248699 ?auto_248708 ) ) ( not ( = ?auto_248699 ?auto_248709 ) ) ( not ( = ?auto_248700 ?auto_248701 ) ) ( not ( = ?auto_248700 ?auto_248702 ) ) ( not ( = ?auto_248700 ?auto_248703 ) ) ( not ( = ?auto_248700 ?auto_248704 ) ) ( not ( = ?auto_248700 ?auto_248705 ) ) ( not ( = ?auto_248700 ?auto_248706 ) ) ( not ( = ?auto_248700 ?auto_248707 ) ) ( not ( = ?auto_248700 ?auto_248708 ) ) ( not ( = ?auto_248700 ?auto_248709 ) ) ( not ( = ?auto_248701 ?auto_248702 ) ) ( not ( = ?auto_248701 ?auto_248703 ) ) ( not ( = ?auto_248701 ?auto_248704 ) ) ( not ( = ?auto_248701 ?auto_248705 ) ) ( not ( = ?auto_248701 ?auto_248706 ) ) ( not ( = ?auto_248701 ?auto_248707 ) ) ( not ( = ?auto_248701 ?auto_248708 ) ) ( not ( = ?auto_248701 ?auto_248709 ) ) ( not ( = ?auto_248702 ?auto_248703 ) ) ( not ( = ?auto_248702 ?auto_248704 ) ) ( not ( = ?auto_248702 ?auto_248705 ) ) ( not ( = ?auto_248702 ?auto_248706 ) ) ( not ( = ?auto_248702 ?auto_248707 ) ) ( not ( = ?auto_248702 ?auto_248708 ) ) ( not ( = ?auto_248702 ?auto_248709 ) ) ( not ( = ?auto_248703 ?auto_248704 ) ) ( not ( = ?auto_248703 ?auto_248705 ) ) ( not ( = ?auto_248703 ?auto_248706 ) ) ( not ( = ?auto_248703 ?auto_248707 ) ) ( not ( = ?auto_248703 ?auto_248708 ) ) ( not ( = ?auto_248703 ?auto_248709 ) ) ( not ( = ?auto_248704 ?auto_248705 ) ) ( not ( = ?auto_248704 ?auto_248706 ) ) ( not ( = ?auto_248704 ?auto_248707 ) ) ( not ( = ?auto_248704 ?auto_248708 ) ) ( not ( = ?auto_248704 ?auto_248709 ) ) ( not ( = ?auto_248705 ?auto_248706 ) ) ( not ( = ?auto_248705 ?auto_248707 ) ) ( not ( = ?auto_248705 ?auto_248708 ) ) ( not ( = ?auto_248705 ?auto_248709 ) ) ( not ( = ?auto_248706 ?auto_248707 ) ) ( not ( = ?auto_248706 ?auto_248708 ) ) ( not ( = ?auto_248706 ?auto_248709 ) ) ( not ( = ?auto_248707 ?auto_248708 ) ) ( not ( = ?auto_248707 ?auto_248709 ) ) ( not ( = ?auto_248708 ?auto_248709 ) ) ( ON ?auto_248707 ?auto_248708 ) ( ON ?auto_248706 ?auto_248707 ) ( ON ?auto_248705 ?auto_248706 ) ( ON ?auto_248704 ?auto_248705 ) ( ON ?auto_248703 ?auto_248704 ) ( ON ?auto_248702 ?auto_248703 ) ( CLEAR ?auto_248700 ) ( ON ?auto_248701 ?auto_248702 ) ( CLEAR ?auto_248701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_248699 ?auto_248700 ?auto_248701 )
      ( MAKE-10PILE ?auto_248699 ?auto_248700 ?auto_248701 ?auto_248702 ?auto_248703 ?auto_248704 ?auto_248705 ?auto_248706 ?auto_248707 ?auto_248708 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248720 - BLOCK
      ?auto_248721 - BLOCK
      ?auto_248722 - BLOCK
      ?auto_248723 - BLOCK
      ?auto_248724 - BLOCK
      ?auto_248725 - BLOCK
      ?auto_248726 - BLOCK
      ?auto_248727 - BLOCK
      ?auto_248728 - BLOCK
      ?auto_248729 - BLOCK
    )
    :vars
    (
      ?auto_248730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248729 ?auto_248730 ) ( ON-TABLE ?auto_248720 ) ( not ( = ?auto_248720 ?auto_248721 ) ) ( not ( = ?auto_248720 ?auto_248722 ) ) ( not ( = ?auto_248720 ?auto_248723 ) ) ( not ( = ?auto_248720 ?auto_248724 ) ) ( not ( = ?auto_248720 ?auto_248725 ) ) ( not ( = ?auto_248720 ?auto_248726 ) ) ( not ( = ?auto_248720 ?auto_248727 ) ) ( not ( = ?auto_248720 ?auto_248728 ) ) ( not ( = ?auto_248720 ?auto_248729 ) ) ( not ( = ?auto_248720 ?auto_248730 ) ) ( not ( = ?auto_248721 ?auto_248722 ) ) ( not ( = ?auto_248721 ?auto_248723 ) ) ( not ( = ?auto_248721 ?auto_248724 ) ) ( not ( = ?auto_248721 ?auto_248725 ) ) ( not ( = ?auto_248721 ?auto_248726 ) ) ( not ( = ?auto_248721 ?auto_248727 ) ) ( not ( = ?auto_248721 ?auto_248728 ) ) ( not ( = ?auto_248721 ?auto_248729 ) ) ( not ( = ?auto_248721 ?auto_248730 ) ) ( not ( = ?auto_248722 ?auto_248723 ) ) ( not ( = ?auto_248722 ?auto_248724 ) ) ( not ( = ?auto_248722 ?auto_248725 ) ) ( not ( = ?auto_248722 ?auto_248726 ) ) ( not ( = ?auto_248722 ?auto_248727 ) ) ( not ( = ?auto_248722 ?auto_248728 ) ) ( not ( = ?auto_248722 ?auto_248729 ) ) ( not ( = ?auto_248722 ?auto_248730 ) ) ( not ( = ?auto_248723 ?auto_248724 ) ) ( not ( = ?auto_248723 ?auto_248725 ) ) ( not ( = ?auto_248723 ?auto_248726 ) ) ( not ( = ?auto_248723 ?auto_248727 ) ) ( not ( = ?auto_248723 ?auto_248728 ) ) ( not ( = ?auto_248723 ?auto_248729 ) ) ( not ( = ?auto_248723 ?auto_248730 ) ) ( not ( = ?auto_248724 ?auto_248725 ) ) ( not ( = ?auto_248724 ?auto_248726 ) ) ( not ( = ?auto_248724 ?auto_248727 ) ) ( not ( = ?auto_248724 ?auto_248728 ) ) ( not ( = ?auto_248724 ?auto_248729 ) ) ( not ( = ?auto_248724 ?auto_248730 ) ) ( not ( = ?auto_248725 ?auto_248726 ) ) ( not ( = ?auto_248725 ?auto_248727 ) ) ( not ( = ?auto_248725 ?auto_248728 ) ) ( not ( = ?auto_248725 ?auto_248729 ) ) ( not ( = ?auto_248725 ?auto_248730 ) ) ( not ( = ?auto_248726 ?auto_248727 ) ) ( not ( = ?auto_248726 ?auto_248728 ) ) ( not ( = ?auto_248726 ?auto_248729 ) ) ( not ( = ?auto_248726 ?auto_248730 ) ) ( not ( = ?auto_248727 ?auto_248728 ) ) ( not ( = ?auto_248727 ?auto_248729 ) ) ( not ( = ?auto_248727 ?auto_248730 ) ) ( not ( = ?auto_248728 ?auto_248729 ) ) ( not ( = ?auto_248728 ?auto_248730 ) ) ( not ( = ?auto_248729 ?auto_248730 ) ) ( ON ?auto_248728 ?auto_248729 ) ( ON ?auto_248727 ?auto_248728 ) ( ON ?auto_248726 ?auto_248727 ) ( ON ?auto_248725 ?auto_248726 ) ( ON ?auto_248724 ?auto_248725 ) ( ON ?auto_248723 ?auto_248724 ) ( ON ?auto_248722 ?auto_248723 ) ( CLEAR ?auto_248720 ) ( ON ?auto_248721 ?auto_248722 ) ( CLEAR ?auto_248721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248720 ?auto_248721 )
      ( MAKE-10PILE ?auto_248720 ?auto_248721 ?auto_248722 ?auto_248723 ?auto_248724 ?auto_248725 ?auto_248726 ?auto_248727 ?auto_248728 ?auto_248729 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248741 - BLOCK
      ?auto_248742 - BLOCK
      ?auto_248743 - BLOCK
      ?auto_248744 - BLOCK
      ?auto_248745 - BLOCK
      ?auto_248746 - BLOCK
      ?auto_248747 - BLOCK
      ?auto_248748 - BLOCK
      ?auto_248749 - BLOCK
      ?auto_248750 - BLOCK
    )
    :vars
    (
      ?auto_248751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248750 ?auto_248751 ) ( ON-TABLE ?auto_248741 ) ( not ( = ?auto_248741 ?auto_248742 ) ) ( not ( = ?auto_248741 ?auto_248743 ) ) ( not ( = ?auto_248741 ?auto_248744 ) ) ( not ( = ?auto_248741 ?auto_248745 ) ) ( not ( = ?auto_248741 ?auto_248746 ) ) ( not ( = ?auto_248741 ?auto_248747 ) ) ( not ( = ?auto_248741 ?auto_248748 ) ) ( not ( = ?auto_248741 ?auto_248749 ) ) ( not ( = ?auto_248741 ?auto_248750 ) ) ( not ( = ?auto_248741 ?auto_248751 ) ) ( not ( = ?auto_248742 ?auto_248743 ) ) ( not ( = ?auto_248742 ?auto_248744 ) ) ( not ( = ?auto_248742 ?auto_248745 ) ) ( not ( = ?auto_248742 ?auto_248746 ) ) ( not ( = ?auto_248742 ?auto_248747 ) ) ( not ( = ?auto_248742 ?auto_248748 ) ) ( not ( = ?auto_248742 ?auto_248749 ) ) ( not ( = ?auto_248742 ?auto_248750 ) ) ( not ( = ?auto_248742 ?auto_248751 ) ) ( not ( = ?auto_248743 ?auto_248744 ) ) ( not ( = ?auto_248743 ?auto_248745 ) ) ( not ( = ?auto_248743 ?auto_248746 ) ) ( not ( = ?auto_248743 ?auto_248747 ) ) ( not ( = ?auto_248743 ?auto_248748 ) ) ( not ( = ?auto_248743 ?auto_248749 ) ) ( not ( = ?auto_248743 ?auto_248750 ) ) ( not ( = ?auto_248743 ?auto_248751 ) ) ( not ( = ?auto_248744 ?auto_248745 ) ) ( not ( = ?auto_248744 ?auto_248746 ) ) ( not ( = ?auto_248744 ?auto_248747 ) ) ( not ( = ?auto_248744 ?auto_248748 ) ) ( not ( = ?auto_248744 ?auto_248749 ) ) ( not ( = ?auto_248744 ?auto_248750 ) ) ( not ( = ?auto_248744 ?auto_248751 ) ) ( not ( = ?auto_248745 ?auto_248746 ) ) ( not ( = ?auto_248745 ?auto_248747 ) ) ( not ( = ?auto_248745 ?auto_248748 ) ) ( not ( = ?auto_248745 ?auto_248749 ) ) ( not ( = ?auto_248745 ?auto_248750 ) ) ( not ( = ?auto_248745 ?auto_248751 ) ) ( not ( = ?auto_248746 ?auto_248747 ) ) ( not ( = ?auto_248746 ?auto_248748 ) ) ( not ( = ?auto_248746 ?auto_248749 ) ) ( not ( = ?auto_248746 ?auto_248750 ) ) ( not ( = ?auto_248746 ?auto_248751 ) ) ( not ( = ?auto_248747 ?auto_248748 ) ) ( not ( = ?auto_248747 ?auto_248749 ) ) ( not ( = ?auto_248747 ?auto_248750 ) ) ( not ( = ?auto_248747 ?auto_248751 ) ) ( not ( = ?auto_248748 ?auto_248749 ) ) ( not ( = ?auto_248748 ?auto_248750 ) ) ( not ( = ?auto_248748 ?auto_248751 ) ) ( not ( = ?auto_248749 ?auto_248750 ) ) ( not ( = ?auto_248749 ?auto_248751 ) ) ( not ( = ?auto_248750 ?auto_248751 ) ) ( ON ?auto_248749 ?auto_248750 ) ( ON ?auto_248748 ?auto_248749 ) ( ON ?auto_248747 ?auto_248748 ) ( ON ?auto_248746 ?auto_248747 ) ( ON ?auto_248745 ?auto_248746 ) ( ON ?auto_248744 ?auto_248745 ) ( ON ?auto_248743 ?auto_248744 ) ( CLEAR ?auto_248741 ) ( ON ?auto_248742 ?auto_248743 ) ( CLEAR ?auto_248742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_248741 ?auto_248742 )
      ( MAKE-10PILE ?auto_248741 ?auto_248742 ?auto_248743 ?auto_248744 ?auto_248745 ?auto_248746 ?auto_248747 ?auto_248748 ?auto_248749 ?auto_248750 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248762 - BLOCK
      ?auto_248763 - BLOCK
      ?auto_248764 - BLOCK
      ?auto_248765 - BLOCK
      ?auto_248766 - BLOCK
      ?auto_248767 - BLOCK
      ?auto_248768 - BLOCK
      ?auto_248769 - BLOCK
      ?auto_248770 - BLOCK
      ?auto_248771 - BLOCK
    )
    :vars
    (
      ?auto_248772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248771 ?auto_248772 ) ( not ( = ?auto_248762 ?auto_248763 ) ) ( not ( = ?auto_248762 ?auto_248764 ) ) ( not ( = ?auto_248762 ?auto_248765 ) ) ( not ( = ?auto_248762 ?auto_248766 ) ) ( not ( = ?auto_248762 ?auto_248767 ) ) ( not ( = ?auto_248762 ?auto_248768 ) ) ( not ( = ?auto_248762 ?auto_248769 ) ) ( not ( = ?auto_248762 ?auto_248770 ) ) ( not ( = ?auto_248762 ?auto_248771 ) ) ( not ( = ?auto_248762 ?auto_248772 ) ) ( not ( = ?auto_248763 ?auto_248764 ) ) ( not ( = ?auto_248763 ?auto_248765 ) ) ( not ( = ?auto_248763 ?auto_248766 ) ) ( not ( = ?auto_248763 ?auto_248767 ) ) ( not ( = ?auto_248763 ?auto_248768 ) ) ( not ( = ?auto_248763 ?auto_248769 ) ) ( not ( = ?auto_248763 ?auto_248770 ) ) ( not ( = ?auto_248763 ?auto_248771 ) ) ( not ( = ?auto_248763 ?auto_248772 ) ) ( not ( = ?auto_248764 ?auto_248765 ) ) ( not ( = ?auto_248764 ?auto_248766 ) ) ( not ( = ?auto_248764 ?auto_248767 ) ) ( not ( = ?auto_248764 ?auto_248768 ) ) ( not ( = ?auto_248764 ?auto_248769 ) ) ( not ( = ?auto_248764 ?auto_248770 ) ) ( not ( = ?auto_248764 ?auto_248771 ) ) ( not ( = ?auto_248764 ?auto_248772 ) ) ( not ( = ?auto_248765 ?auto_248766 ) ) ( not ( = ?auto_248765 ?auto_248767 ) ) ( not ( = ?auto_248765 ?auto_248768 ) ) ( not ( = ?auto_248765 ?auto_248769 ) ) ( not ( = ?auto_248765 ?auto_248770 ) ) ( not ( = ?auto_248765 ?auto_248771 ) ) ( not ( = ?auto_248765 ?auto_248772 ) ) ( not ( = ?auto_248766 ?auto_248767 ) ) ( not ( = ?auto_248766 ?auto_248768 ) ) ( not ( = ?auto_248766 ?auto_248769 ) ) ( not ( = ?auto_248766 ?auto_248770 ) ) ( not ( = ?auto_248766 ?auto_248771 ) ) ( not ( = ?auto_248766 ?auto_248772 ) ) ( not ( = ?auto_248767 ?auto_248768 ) ) ( not ( = ?auto_248767 ?auto_248769 ) ) ( not ( = ?auto_248767 ?auto_248770 ) ) ( not ( = ?auto_248767 ?auto_248771 ) ) ( not ( = ?auto_248767 ?auto_248772 ) ) ( not ( = ?auto_248768 ?auto_248769 ) ) ( not ( = ?auto_248768 ?auto_248770 ) ) ( not ( = ?auto_248768 ?auto_248771 ) ) ( not ( = ?auto_248768 ?auto_248772 ) ) ( not ( = ?auto_248769 ?auto_248770 ) ) ( not ( = ?auto_248769 ?auto_248771 ) ) ( not ( = ?auto_248769 ?auto_248772 ) ) ( not ( = ?auto_248770 ?auto_248771 ) ) ( not ( = ?auto_248770 ?auto_248772 ) ) ( not ( = ?auto_248771 ?auto_248772 ) ) ( ON ?auto_248770 ?auto_248771 ) ( ON ?auto_248769 ?auto_248770 ) ( ON ?auto_248768 ?auto_248769 ) ( ON ?auto_248767 ?auto_248768 ) ( ON ?auto_248766 ?auto_248767 ) ( ON ?auto_248765 ?auto_248766 ) ( ON ?auto_248764 ?auto_248765 ) ( ON ?auto_248763 ?auto_248764 ) ( ON ?auto_248762 ?auto_248763 ) ( CLEAR ?auto_248762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248762 )
      ( MAKE-10PILE ?auto_248762 ?auto_248763 ?auto_248764 ?auto_248765 ?auto_248766 ?auto_248767 ?auto_248768 ?auto_248769 ?auto_248770 ?auto_248771 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_248783 - BLOCK
      ?auto_248784 - BLOCK
      ?auto_248785 - BLOCK
      ?auto_248786 - BLOCK
      ?auto_248787 - BLOCK
      ?auto_248788 - BLOCK
      ?auto_248789 - BLOCK
      ?auto_248790 - BLOCK
      ?auto_248791 - BLOCK
      ?auto_248792 - BLOCK
    )
    :vars
    (
      ?auto_248793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248792 ?auto_248793 ) ( not ( = ?auto_248783 ?auto_248784 ) ) ( not ( = ?auto_248783 ?auto_248785 ) ) ( not ( = ?auto_248783 ?auto_248786 ) ) ( not ( = ?auto_248783 ?auto_248787 ) ) ( not ( = ?auto_248783 ?auto_248788 ) ) ( not ( = ?auto_248783 ?auto_248789 ) ) ( not ( = ?auto_248783 ?auto_248790 ) ) ( not ( = ?auto_248783 ?auto_248791 ) ) ( not ( = ?auto_248783 ?auto_248792 ) ) ( not ( = ?auto_248783 ?auto_248793 ) ) ( not ( = ?auto_248784 ?auto_248785 ) ) ( not ( = ?auto_248784 ?auto_248786 ) ) ( not ( = ?auto_248784 ?auto_248787 ) ) ( not ( = ?auto_248784 ?auto_248788 ) ) ( not ( = ?auto_248784 ?auto_248789 ) ) ( not ( = ?auto_248784 ?auto_248790 ) ) ( not ( = ?auto_248784 ?auto_248791 ) ) ( not ( = ?auto_248784 ?auto_248792 ) ) ( not ( = ?auto_248784 ?auto_248793 ) ) ( not ( = ?auto_248785 ?auto_248786 ) ) ( not ( = ?auto_248785 ?auto_248787 ) ) ( not ( = ?auto_248785 ?auto_248788 ) ) ( not ( = ?auto_248785 ?auto_248789 ) ) ( not ( = ?auto_248785 ?auto_248790 ) ) ( not ( = ?auto_248785 ?auto_248791 ) ) ( not ( = ?auto_248785 ?auto_248792 ) ) ( not ( = ?auto_248785 ?auto_248793 ) ) ( not ( = ?auto_248786 ?auto_248787 ) ) ( not ( = ?auto_248786 ?auto_248788 ) ) ( not ( = ?auto_248786 ?auto_248789 ) ) ( not ( = ?auto_248786 ?auto_248790 ) ) ( not ( = ?auto_248786 ?auto_248791 ) ) ( not ( = ?auto_248786 ?auto_248792 ) ) ( not ( = ?auto_248786 ?auto_248793 ) ) ( not ( = ?auto_248787 ?auto_248788 ) ) ( not ( = ?auto_248787 ?auto_248789 ) ) ( not ( = ?auto_248787 ?auto_248790 ) ) ( not ( = ?auto_248787 ?auto_248791 ) ) ( not ( = ?auto_248787 ?auto_248792 ) ) ( not ( = ?auto_248787 ?auto_248793 ) ) ( not ( = ?auto_248788 ?auto_248789 ) ) ( not ( = ?auto_248788 ?auto_248790 ) ) ( not ( = ?auto_248788 ?auto_248791 ) ) ( not ( = ?auto_248788 ?auto_248792 ) ) ( not ( = ?auto_248788 ?auto_248793 ) ) ( not ( = ?auto_248789 ?auto_248790 ) ) ( not ( = ?auto_248789 ?auto_248791 ) ) ( not ( = ?auto_248789 ?auto_248792 ) ) ( not ( = ?auto_248789 ?auto_248793 ) ) ( not ( = ?auto_248790 ?auto_248791 ) ) ( not ( = ?auto_248790 ?auto_248792 ) ) ( not ( = ?auto_248790 ?auto_248793 ) ) ( not ( = ?auto_248791 ?auto_248792 ) ) ( not ( = ?auto_248791 ?auto_248793 ) ) ( not ( = ?auto_248792 ?auto_248793 ) ) ( ON ?auto_248791 ?auto_248792 ) ( ON ?auto_248790 ?auto_248791 ) ( ON ?auto_248789 ?auto_248790 ) ( ON ?auto_248788 ?auto_248789 ) ( ON ?auto_248787 ?auto_248788 ) ( ON ?auto_248786 ?auto_248787 ) ( ON ?auto_248785 ?auto_248786 ) ( ON ?auto_248784 ?auto_248785 ) ( ON ?auto_248783 ?auto_248784 ) ( CLEAR ?auto_248783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_248783 )
      ( MAKE-10PILE ?auto_248783 ?auto_248784 ?auto_248785 ?auto_248786 ?auto_248787 ?auto_248788 ?auto_248789 ?auto_248790 ?auto_248791 ?auto_248792 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248805 - BLOCK
      ?auto_248806 - BLOCK
      ?auto_248807 - BLOCK
      ?auto_248808 - BLOCK
      ?auto_248809 - BLOCK
      ?auto_248810 - BLOCK
      ?auto_248811 - BLOCK
      ?auto_248812 - BLOCK
      ?auto_248813 - BLOCK
      ?auto_248814 - BLOCK
      ?auto_248815 - BLOCK
    )
    :vars
    (
      ?auto_248816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248814 ) ( ON ?auto_248815 ?auto_248816 ) ( CLEAR ?auto_248815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248805 ) ( ON ?auto_248806 ?auto_248805 ) ( ON ?auto_248807 ?auto_248806 ) ( ON ?auto_248808 ?auto_248807 ) ( ON ?auto_248809 ?auto_248808 ) ( ON ?auto_248810 ?auto_248809 ) ( ON ?auto_248811 ?auto_248810 ) ( ON ?auto_248812 ?auto_248811 ) ( ON ?auto_248813 ?auto_248812 ) ( ON ?auto_248814 ?auto_248813 ) ( not ( = ?auto_248805 ?auto_248806 ) ) ( not ( = ?auto_248805 ?auto_248807 ) ) ( not ( = ?auto_248805 ?auto_248808 ) ) ( not ( = ?auto_248805 ?auto_248809 ) ) ( not ( = ?auto_248805 ?auto_248810 ) ) ( not ( = ?auto_248805 ?auto_248811 ) ) ( not ( = ?auto_248805 ?auto_248812 ) ) ( not ( = ?auto_248805 ?auto_248813 ) ) ( not ( = ?auto_248805 ?auto_248814 ) ) ( not ( = ?auto_248805 ?auto_248815 ) ) ( not ( = ?auto_248805 ?auto_248816 ) ) ( not ( = ?auto_248806 ?auto_248807 ) ) ( not ( = ?auto_248806 ?auto_248808 ) ) ( not ( = ?auto_248806 ?auto_248809 ) ) ( not ( = ?auto_248806 ?auto_248810 ) ) ( not ( = ?auto_248806 ?auto_248811 ) ) ( not ( = ?auto_248806 ?auto_248812 ) ) ( not ( = ?auto_248806 ?auto_248813 ) ) ( not ( = ?auto_248806 ?auto_248814 ) ) ( not ( = ?auto_248806 ?auto_248815 ) ) ( not ( = ?auto_248806 ?auto_248816 ) ) ( not ( = ?auto_248807 ?auto_248808 ) ) ( not ( = ?auto_248807 ?auto_248809 ) ) ( not ( = ?auto_248807 ?auto_248810 ) ) ( not ( = ?auto_248807 ?auto_248811 ) ) ( not ( = ?auto_248807 ?auto_248812 ) ) ( not ( = ?auto_248807 ?auto_248813 ) ) ( not ( = ?auto_248807 ?auto_248814 ) ) ( not ( = ?auto_248807 ?auto_248815 ) ) ( not ( = ?auto_248807 ?auto_248816 ) ) ( not ( = ?auto_248808 ?auto_248809 ) ) ( not ( = ?auto_248808 ?auto_248810 ) ) ( not ( = ?auto_248808 ?auto_248811 ) ) ( not ( = ?auto_248808 ?auto_248812 ) ) ( not ( = ?auto_248808 ?auto_248813 ) ) ( not ( = ?auto_248808 ?auto_248814 ) ) ( not ( = ?auto_248808 ?auto_248815 ) ) ( not ( = ?auto_248808 ?auto_248816 ) ) ( not ( = ?auto_248809 ?auto_248810 ) ) ( not ( = ?auto_248809 ?auto_248811 ) ) ( not ( = ?auto_248809 ?auto_248812 ) ) ( not ( = ?auto_248809 ?auto_248813 ) ) ( not ( = ?auto_248809 ?auto_248814 ) ) ( not ( = ?auto_248809 ?auto_248815 ) ) ( not ( = ?auto_248809 ?auto_248816 ) ) ( not ( = ?auto_248810 ?auto_248811 ) ) ( not ( = ?auto_248810 ?auto_248812 ) ) ( not ( = ?auto_248810 ?auto_248813 ) ) ( not ( = ?auto_248810 ?auto_248814 ) ) ( not ( = ?auto_248810 ?auto_248815 ) ) ( not ( = ?auto_248810 ?auto_248816 ) ) ( not ( = ?auto_248811 ?auto_248812 ) ) ( not ( = ?auto_248811 ?auto_248813 ) ) ( not ( = ?auto_248811 ?auto_248814 ) ) ( not ( = ?auto_248811 ?auto_248815 ) ) ( not ( = ?auto_248811 ?auto_248816 ) ) ( not ( = ?auto_248812 ?auto_248813 ) ) ( not ( = ?auto_248812 ?auto_248814 ) ) ( not ( = ?auto_248812 ?auto_248815 ) ) ( not ( = ?auto_248812 ?auto_248816 ) ) ( not ( = ?auto_248813 ?auto_248814 ) ) ( not ( = ?auto_248813 ?auto_248815 ) ) ( not ( = ?auto_248813 ?auto_248816 ) ) ( not ( = ?auto_248814 ?auto_248815 ) ) ( not ( = ?auto_248814 ?auto_248816 ) ) ( not ( = ?auto_248815 ?auto_248816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248815 ?auto_248816 )
      ( !STACK ?auto_248815 ?auto_248814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248828 - BLOCK
      ?auto_248829 - BLOCK
      ?auto_248830 - BLOCK
      ?auto_248831 - BLOCK
      ?auto_248832 - BLOCK
      ?auto_248833 - BLOCK
      ?auto_248834 - BLOCK
      ?auto_248835 - BLOCK
      ?auto_248836 - BLOCK
      ?auto_248837 - BLOCK
      ?auto_248838 - BLOCK
    )
    :vars
    (
      ?auto_248839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_248837 ) ( ON ?auto_248838 ?auto_248839 ) ( CLEAR ?auto_248838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_248828 ) ( ON ?auto_248829 ?auto_248828 ) ( ON ?auto_248830 ?auto_248829 ) ( ON ?auto_248831 ?auto_248830 ) ( ON ?auto_248832 ?auto_248831 ) ( ON ?auto_248833 ?auto_248832 ) ( ON ?auto_248834 ?auto_248833 ) ( ON ?auto_248835 ?auto_248834 ) ( ON ?auto_248836 ?auto_248835 ) ( ON ?auto_248837 ?auto_248836 ) ( not ( = ?auto_248828 ?auto_248829 ) ) ( not ( = ?auto_248828 ?auto_248830 ) ) ( not ( = ?auto_248828 ?auto_248831 ) ) ( not ( = ?auto_248828 ?auto_248832 ) ) ( not ( = ?auto_248828 ?auto_248833 ) ) ( not ( = ?auto_248828 ?auto_248834 ) ) ( not ( = ?auto_248828 ?auto_248835 ) ) ( not ( = ?auto_248828 ?auto_248836 ) ) ( not ( = ?auto_248828 ?auto_248837 ) ) ( not ( = ?auto_248828 ?auto_248838 ) ) ( not ( = ?auto_248828 ?auto_248839 ) ) ( not ( = ?auto_248829 ?auto_248830 ) ) ( not ( = ?auto_248829 ?auto_248831 ) ) ( not ( = ?auto_248829 ?auto_248832 ) ) ( not ( = ?auto_248829 ?auto_248833 ) ) ( not ( = ?auto_248829 ?auto_248834 ) ) ( not ( = ?auto_248829 ?auto_248835 ) ) ( not ( = ?auto_248829 ?auto_248836 ) ) ( not ( = ?auto_248829 ?auto_248837 ) ) ( not ( = ?auto_248829 ?auto_248838 ) ) ( not ( = ?auto_248829 ?auto_248839 ) ) ( not ( = ?auto_248830 ?auto_248831 ) ) ( not ( = ?auto_248830 ?auto_248832 ) ) ( not ( = ?auto_248830 ?auto_248833 ) ) ( not ( = ?auto_248830 ?auto_248834 ) ) ( not ( = ?auto_248830 ?auto_248835 ) ) ( not ( = ?auto_248830 ?auto_248836 ) ) ( not ( = ?auto_248830 ?auto_248837 ) ) ( not ( = ?auto_248830 ?auto_248838 ) ) ( not ( = ?auto_248830 ?auto_248839 ) ) ( not ( = ?auto_248831 ?auto_248832 ) ) ( not ( = ?auto_248831 ?auto_248833 ) ) ( not ( = ?auto_248831 ?auto_248834 ) ) ( not ( = ?auto_248831 ?auto_248835 ) ) ( not ( = ?auto_248831 ?auto_248836 ) ) ( not ( = ?auto_248831 ?auto_248837 ) ) ( not ( = ?auto_248831 ?auto_248838 ) ) ( not ( = ?auto_248831 ?auto_248839 ) ) ( not ( = ?auto_248832 ?auto_248833 ) ) ( not ( = ?auto_248832 ?auto_248834 ) ) ( not ( = ?auto_248832 ?auto_248835 ) ) ( not ( = ?auto_248832 ?auto_248836 ) ) ( not ( = ?auto_248832 ?auto_248837 ) ) ( not ( = ?auto_248832 ?auto_248838 ) ) ( not ( = ?auto_248832 ?auto_248839 ) ) ( not ( = ?auto_248833 ?auto_248834 ) ) ( not ( = ?auto_248833 ?auto_248835 ) ) ( not ( = ?auto_248833 ?auto_248836 ) ) ( not ( = ?auto_248833 ?auto_248837 ) ) ( not ( = ?auto_248833 ?auto_248838 ) ) ( not ( = ?auto_248833 ?auto_248839 ) ) ( not ( = ?auto_248834 ?auto_248835 ) ) ( not ( = ?auto_248834 ?auto_248836 ) ) ( not ( = ?auto_248834 ?auto_248837 ) ) ( not ( = ?auto_248834 ?auto_248838 ) ) ( not ( = ?auto_248834 ?auto_248839 ) ) ( not ( = ?auto_248835 ?auto_248836 ) ) ( not ( = ?auto_248835 ?auto_248837 ) ) ( not ( = ?auto_248835 ?auto_248838 ) ) ( not ( = ?auto_248835 ?auto_248839 ) ) ( not ( = ?auto_248836 ?auto_248837 ) ) ( not ( = ?auto_248836 ?auto_248838 ) ) ( not ( = ?auto_248836 ?auto_248839 ) ) ( not ( = ?auto_248837 ?auto_248838 ) ) ( not ( = ?auto_248837 ?auto_248839 ) ) ( not ( = ?auto_248838 ?auto_248839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_248838 ?auto_248839 )
      ( !STACK ?auto_248838 ?auto_248837 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248851 - BLOCK
      ?auto_248852 - BLOCK
      ?auto_248853 - BLOCK
      ?auto_248854 - BLOCK
      ?auto_248855 - BLOCK
      ?auto_248856 - BLOCK
      ?auto_248857 - BLOCK
      ?auto_248858 - BLOCK
      ?auto_248859 - BLOCK
      ?auto_248860 - BLOCK
      ?auto_248861 - BLOCK
    )
    :vars
    (
      ?auto_248862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248861 ?auto_248862 ) ( ON-TABLE ?auto_248851 ) ( ON ?auto_248852 ?auto_248851 ) ( ON ?auto_248853 ?auto_248852 ) ( ON ?auto_248854 ?auto_248853 ) ( ON ?auto_248855 ?auto_248854 ) ( ON ?auto_248856 ?auto_248855 ) ( ON ?auto_248857 ?auto_248856 ) ( ON ?auto_248858 ?auto_248857 ) ( ON ?auto_248859 ?auto_248858 ) ( not ( = ?auto_248851 ?auto_248852 ) ) ( not ( = ?auto_248851 ?auto_248853 ) ) ( not ( = ?auto_248851 ?auto_248854 ) ) ( not ( = ?auto_248851 ?auto_248855 ) ) ( not ( = ?auto_248851 ?auto_248856 ) ) ( not ( = ?auto_248851 ?auto_248857 ) ) ( not ( = ?auto_248851 ?auto_248858 ) ) ( not ( = ?auto_248851 ?auto_248859 ) ) ( not ( = ?auto_248851 ?auto_248860 ) ) ( not ( = ?auto_248851 ?auto_248861 ) ) ( not ( = ?auto_248851 ?auto_248862 ) ) ( not ( = ?auto_248852 ?auto_248853 ) ) ( not ( = ?auto_248852 ?auto_248854 ) ) ( not ( = ?auto_248852 ?auto_248855 ) ) ( not ( = ?auto_248852 ?auto_248856 ) ) ( not ( = ?auto_248852 ?auto_248857 ) ) ( not ( = ?auto_248852 ?auto_248858 ) ) ( not ( = ?auto_248852 ?auto_248859 ) ) ( not ( = ?auto_248852 ?auto_248860 ) ) ( not ( = ?auto_248852 ?auto_248861 ) ) ( not ( = ?auto_248852 ?auto_248862 ) ) ( not ( = ?auto_248853 ?auto_248854 ) ) ( not ( = ?auto_248853 ?auto_248855 ) ) ( not ( = ?auto_248853 ?auto_248856 ) ) ( not ( = ?auto_248853 ?auto_248857 ) ) ( not ( = ?auto_248853 ?auto_248858 ) ) ( not ( = ?auto_248853 ?auto_248859 ) ) ( not ( = ?auto_248853 ?auto_248860 ) ) ( not ( = ?auto_248853 ?auto_248861 ) ) ( not ( = ?auto_248853 ?auto_248862 ) ) ( not ( = ?auto_248854 ?auto_248855 ) ) ( not ( = ?auto_248854 ?auto_248856 ) ) ( not ( = ?auto_248854 ?auto_248857 ) ) ( not ( = ?auto_248854 ?auto_248858 ) ) ( not ( = ?auto_248854 ?auto_248859 ) ) ( not ( = ?auto_248854 ?auto_248860 ) ) ( not ( = ?auto_248854 ?auto_248861 ) ) ( not ( = ?auto_248854 ?auto_248862 ) ) ( not ( = ?auto_248855 ?auto_248856 ) ) ( not ( = ?auto_248855 ?auto_248857 ) ) ( not ( = ?auto_248855 ?auto_248858 ) ) ( not ( = ?auto_248855 ?auto_248859 ) ) ( not ( = ?auto_248855 ?auto_248860 ) ) ( not ( = ?auto_248855 ?auto_248861 ) ) ( not ( = ?auto_248855 ?auto_248862 ) ) ( not ( = ?auto_248856 ?auto_248857 ) ) ( not ( = ?auto_248856 ?auto_248858 ) ) ( not ( = ?auto_248856 ?auto_248859 ) ) ( not ( = ?auto_248856 ?auto_248860 ) ) ( not ( = ?auto_248856 ?auto_248861 ) ) ( not ( = ?auto_248856 ?auto_248862 ) ) ( not ( = ?auto_248857 ?auto_248858 ) ) ( not ( = ?auto_248857 ?auto_248859 ) ) ( not ( = ?auto_248857 ?auto_248860 ) ) ( not ( = ?auto_248857 ?auto_248861 ) ) ( not ( = ?auto_248857 ?auto_248862 ) ) ( not ( = ?auto_248858 ?auto_248859 ) ) ( not ( = ?auto_248858 ?auto_248860 ) ) ( not ( = ?auto_248858 ?auto_248861 ) ) ( not ( = ?auto_248858 ?auto_248862 ) ) ( not ( = ?auto_248859 ?auto_248860 ) ) ( not ( = ?auto_248859 ?auto_248861 ) ) ( not ( = ?auto_248859 ?auto_248862 ) ) ( not ( = ?auto_248860 ?auto_248861 ) ) ( not ( = ?auto_248860 ?auto_248862 ) ) ( not ( = ?auto_248861 ?auto_248862 ) ) ( CLEAR ?auto_248859 ) ( ON ?auto_248860 ?auto_248861 ) ( CLEAR ?auto_248860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_248851 ?auto_248852 ?auto_248853 ?auto_248854 ?auto_248855 ?auto_248856 ?auto_248857 ?auto_248858 ?auto_248859 ?auto_248860 )
      ( MAKE-11PILE ?auto_248851 ?auto_248852 ?auto_248853 ?auto_248854 ?auto_248855 ?auto_248856 ?auto_248857 ?auto_248858 ?auto_248859 ?auto_248860 ?auto_248861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248874 - BLOCK
      ?auto_248875 - BLOCK
      ?auto_248876 - BLOCK
      ?auto_248877 - BLOCK
      ?auto_248878 - BLOCK
      ?auto_248879 - BLOCK
      ?auto_248880 - BLOCK
      ?auto_248881 - BLOCK
      ?auto_248882 - BLOCK
      ?auto_248883 - BLOCK
      ?auto_248884 - BLOCK
    )
    :vars
    (
      ?auto_248885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248884 ?auto_248885 ) ( ON-TABLE ?auto_248874 ) ( ON ?auto_248875 ?auto_248874 ) ( ON ?auto_248876 ?auto_248875 ) ( ON ?auto_248877 ?auto_248876 ) ( ON ?auto_248878 ?auto_248877 ) ( ON ?auto_248879 ?auto_248878 ) ( ON ?auto_248880 ?auto_248879 ) ( ON ?auto_248881 ?auto_248880 ) ( ON ?auto_248882 ?auto_248881 ) ( not ( = ?auto_248874 ?auto_248875 ) ) ( not ( = ?auto_248874 ?auto_248876 ) ) ( not ( = ?auto_248874 ?auto_248877 ) ) ( not ( = ?auto_248874 ?auto_248878 ) ) ( not ( = ?auto_248874 ?auto_248879 ) ) ( not ( = ?auto_248874 ?auto_248880 ) ) ( not ( = ?auto_248874 ?auto_248881 ) ) ( not ( = ?auto_248874 ?auto_248882 ) ) ( not ( = ?auto_248874 ?auto_248883 ) ) ( not ( = ?auto_248874 ?auto_248884 ) ) ( not ( = ?auto_248874 ?auto_248885 ) ) ( not ( = ?auto_248875 ?auto_248876 ) ) ( not ( = ?auto_248875 ?auto_248877 ) ) ( not ( = ?auto_248875 ?auto_248878 ) ) ( not ( = ?auto_248875 ?auto_248879 ) ) ( not ( = ?auto_248875 ?auto_248880 ) ) ( not ( = ?auto_248875 ?auto_248881 ) ) ( not ( = ?auto_248875 ?auto_248882 ) ) ( not ( = ?auto_248875 ?auto_248883 ) ) ( not ( = ?auto_248875 ?auto_248884 ) ) ( not ( = ?auto_248875 ?auto_248885 ) ) ( not ( = ?auto_248876 ?auto_248877 ) ) ( not ( = ?auto_248876 ?auto_248878 ) ) ( not ( = ?auto_248876 ?auto_248879 ) ) ( not ( = ?auto_248876 ?auto_248880 ) ) ( not ( = ?auto_248876 ?auto_248881 ) ) ( not ( = ?auto_248876 ?auto_248882 ) ) ( not ( = ?auto_248876 ?auto_248883 ) ) ( not ( = ?auto_248876 ?auto_248884 ) ) ( not ( = ?auto_248876 ?auto_248885 ) ) ( not ( = ?auto_248877 ?auto_248878 ) ) ( not ( = ?auto_248877 ?auto_248879 ) ) ( not ( = ?auto_248877 ?auto_248880 ) ) ( not ( = ?auto_248877 ?auto_248881 ) ) ( not ( = ?auto_248877 ?auto_248882 ) ) ( not ( = ?auto_248877 ?auto_248883 ) ) ( not ( = ?auto_248877 ?auto_248884 ) ) ( not ( = ?auto_248877 ?auto_248885 ) ) ( not ( = ?auto_248878 ?auto_248879 ) ) ( not ( = ?auto_248878 ?auto_248880 ) ) ( not ( = ?auto_248878 ?auto_248881 ) ) ( not ( = ?auto_248878 ?auto_248882 ) ) ( not ( = ?auto_248878 ?auto_248883 ) ) ( not ( = ?auto_248878 ?auto_248884 ) ) ( not ( = ?auto_248878 ?auto_248885 ) ) ( not ( = ?auto_248879 ?auto_248880 ) ) ( not ( = ?auto_248879 ?auto_248881 ) ) ( not ( = ?auto_248879 ?auto_248882 ) ) ( not ( = ?auto_248879 ?auto_248883 ) ) ( not ( = ?auto_248879 ?auto_248884 ) ) ( not ( = ?auto_248879 ?auto_248885 ) ) ( not ( = ?auto_248880 ?auto_248881 ) ) ( not ( = ?auto_248880 ?auto_248882 ) ) ( not ( = ?auto_248880 ?auto_248883 ) ) ( not ( = ?auto_248880 ?auto_248884 ) ) ( not ( = ?auto_248880 ?auto_248885 ) ) ( not ( = ?auto_248881 ?auto_248882 ) ) ( not ( = ?auto_248881 ?auto_248883 ) ) ( not ( = ?auto_248881 ?auto_248884 ) ) ( not ( = ?auto_248881 ?auto_248885 ) ) ( not ( = ?auto_248882 ?auto_248883 ) ) ( not ( = ?auto_248882 ?auto_248884 ) ) ( not ( = ?auto_248882 ?auto_248885 ) ) ( not ( = ?auto_248883 ?auto_248884 ) ) ( not ( = ?auto_248883 ?auto_248885 ) ) ( not ( = ?auto_248884 ?auto_248885 ) ) ( CLEAR ?auto_248882 ) ( ON ?auto_248883 ?auto_248884 ) ( CLEAR ?auto_248883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_248874 ?auto_248875 ?auto_248876 ?auto_248877 ?auto_248878 ?auto_248879 ?auto_248880 ?auto_248881 ?auto_248882 ?auto_248883 )
      ( MAKE-11PILE ?auto_248874 ?auto_248875 ?auto_248876 ?auto_248877 ?auto_248878 ?auto_248879 ?auto_248880 ?auto_248881 ?auto_248882 ?auto_248883 ?auto_248884 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248897 - BLOCK
      ?auto_248898 - BLOCK
      ?auto_248899 - BLOCK
      ?auto_248900 - BLOCK
      ?auto_248901 - BLOCK
      ?auto_248902 - BLOCK
      ?auto_248903 - BLOCK
      ?auto_248904 - BLOCK
      ?auto_248905 - BLOCK
      ?auto_248906 - BLOCK
      ?auto_248907 - BLOCK
    )
    :vars
    (
      ?auto_248908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248907 ?auto_248908 ) ( ON-TABLE ?auto_248897 ) ( ON ?auto_248898 ?auto_248897 ) ( ON ?auto_248899 ?auto_248898 ) ( ON ?auto_248900 ?auto_248899 ) ( ON ?auto_248901 ?auto_248900 ) ( ON ?auto_248902 ?auto_248901 ) ( ON ?auto_248903 ?auto_248902 ) ( ON ?auto_248904 ?auto_248903 ) ( not ( = ?auto_248897 ?auto_248898 ) ) ( not ( = ?auto_248897 ?auto_248899 ) ) ( not ( = ?auto_248897 ?auto_248900 ) ) ( not ( = ?auto_248897 ?auto_248901 ) ) ( not ( = ?auto_248897 ?auto_248902 ) ) ( not ( = ?auto_248897 ?auto_248903 ) ) ( not ( = ?auto_248897 ?auto_248904 ) ) ( not ( = ?auto_248897 ?auto_248905 ) ) ( not ( = ?auto_248897 ?auto_248906 ) ) ( not ( = ?auto_248897 ?auto_248907 ) ) ( not ( = ?auto_248897 ?auto_248908 ) ) ( not ( = ?auto_248898 ?auto_248899 ) ) ( not ( = ?auto_248898 ?auto_248900 ) ) ( not ( = ?auto_248898 ?auto_248901 ) ) ( not ( = ?auto_248898 ?auto_248902 ) ) ( not ( = ?auto_248898 ?auto_248903 ) ) ( not ( = ?auto_248898 ?auto_248904 ) ) ( not ( = ?auto_248898 ?auto_248905 ) ) ( not ( = ?auto_248898 ?auto_248906 ) ) ( not ( = ?auto_248898 ?auto_248907 ) ) ( not ( = ?auto_248898 ?auto_248908 ) ) ( not ( = ?auto_248899 ?auto_248900 ) ) ( not ( = ?auto_248899 ?auto_248901 ) ) ( not ( = ?auto_248899 ?auto_248902 ) ) ( not ( = ?auto_248899 ?auto_248903 ) ) ( not ( = ?auto_248899 ?auto_248904 ) ) ( not ( = ?auto_248899 ?auto_248905 ) ) ( not ( = ?auto_248899 ?auto_248906 ) ) ( not ( = ?auto_248899 ?auto_248907 ) ) ( not ( = ?auto_248899 ?auto_248908 ) ) ( not ( = ?auto_248900 ?auto_248901 ) ) ( not ( = ?auto_248900 ?auto_248902 ) ) ( not ( = ?auto_248900 ?auto_248903 ) ) ( not ( = ?auto_248900 ?auto_248904 ) ) ( not ( = ?auto_248900 ?auto_248905 ) ) ( not ( = ?auto_248900 ?auto_248906 ) ) ( not ( = ?auto_248900 ?auto_248907 ) ) ( not ( = ?auto_248900 ?auto_248908 ) ) ( not ( = ?auto_248901 ?auto_248902 ) ) ( not ( = ?auto_248901 ?auto_248903 ) ) ( not ( = ?auto_248901 ?auto_248904 ) ) ( not ( = ?auto_248901 ?auto_248905 ) ) ( not ( = ?auto_248901 ?auto_248906 ) ) ( not ( = ?auto_248901 ?auto_248907 ) ) ( not ( = ?auto_248901 ?auto_248908 ) ) ( not ( = ?auto_248902 ?auto_248903 ) ) ( not ( = ?auto_248902 ?auto_248904 ) ) ( not ( = ?auto_248902 ?auto_248905 ) ) ( not ( = ?auto_248902 ?auto_248906 ) ) ( not ( = ?auto_248902 ?auto_248907 ) ) ( not ( = ?auto_248902 ?auto_248908 ) ) ( not ( = ?auto_248903 ?auto_248904 ) ) ( not ( = ?auto_248903 ?auto_248905 ) ) ( not ( = ?auto_248903 ?auto_248906 ) ) ( not ( = ?auto_248903 ?auto_248907 ) ) ( not ( = ?auto_248903 ?auto_248908 ) ) ( not ( = ?auto_248904 ?auto_248905 ) ) ( not ( = ?auto_248904 ?auto_248906 ) ) ( not ( = ?auto_248904 ?auto_248907 ) ) ( not ( = ?auto_248904 ?auto_248908 ) ) ( not ( = ?auto_248905 ?auto_248906 ) ) ( not ( = ?auto_248905 ?auto_248907 ) ) ( not ( = ?auto_248905 ?auto_248908 ) ) ( not ( = ?auto_248906 ?auto_248907 ) ) ( not ( = ?auto_248906 ?auto_248908 ) ) ( not ( = ?auto_248907 ?auto_248908 ) ) ( ON ?auto_248906 ?auto_248907 ) ( CLEAR ?auto_248904 ) ( ON ?auto_248905 ?auto_248906 ) ( CLEAR ?auto_248905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248897 ?auto_248898 ?auto_248899 ?auto_248900 ?auto_248901 ?auto_248902 ?auto_248903 ?auto_248904 ?auto_248905 )
      ( MAKE-11PILE ?auto_248897 ?auto_248898 ?auto_248899 ?auto_248900 ?auto_248901 ?auto_248902 ?auto_248903 ?auto_248904 ?auto_248905 ?auto_248906 ?auto_248907 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248920 - BLOCK
      ?auto_248921 - BLOCK
      ?auto_248922 - BLOCK
      ?auto_248923 - BLOCK
      ?auto_248924 - BLOCK
      ?auto_248925 - BLOCK
      ?auto_248926 - BLOCK
      ?auto_248927 - BLOCK
      ?auto_248928 - BLOCK
      ?auto_248929 - BLOCK
      ?auto_248930 - BLOCK
    )
    :vars
    (
      ?auto_248931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248930 ?auto_248931 ) ( ON-TABLE ?auto_248920 ) ( ON ?auto_248921 ?auto_248920 ) ( ON ?auto_248922 ?auto_248921 ) ( ON ?auto_248923 ?auto_248922 ) ( ON ?auto_248924 ?auto_248923 ) ( ON ?auto_248925 ?auto_248924 ) ( ON ?auto_248926 ?auto_248925 ) ( ON ?auto_248927 ?auto_248926 ) ( not ( = ?auto_248920 ?auto_248921 ) ) ( not ( = ?auto_248920 ?auto_248922 ) ) ( not ( = ?auto_248920 ?auto_248923 ) ) ( not ( = ?auto_248920 ?auto_248924 ) ) ( not ( = ?auto_248920 ?auto_248925 ) ) ( not ( = ?auto_248920 ?auto_248926 ) ) ( not ( = ?auto_248920 ?auto_248927 ) ) ( not ( = ?auto_248920 ?auto_248928 ) ) ( not ( = ?auto_248920 ?auto_248929 ) ) ( not ( = ?auto_248920 ?auto_248930 ) ) ( not ( = ?auto_248920 ?auto_248931 ) ) ( not ( = ?auto_248921 ?auto_248922 ) ) ( not ( = ?auto_248921 ?auto_248923 ) ) ( not ( = ?auto_248921 ?auto_248924 ) ) ( not ( = ?auto_248921 ?auto_248925 ) ) ( not ( = ?auto_248921 ?auto_248926 ) ) ( not ( = ?auto_248921 ?auto_248927 ) ) ( not ( = ?auto_248921 ?auto_248928 ) ) ( not ( = ?auto_248921 ?auto_248929 ) ) ( not ( = ?auto_248921 ?auto_248930 ) ) ( not ( = ?auto_248921 ?auto_248931 ) ) ( not ( = ?auto_248922 ?auto_248923 ) ) ( not ( = ?auto_248922 ?auto_248924 ) ) ( not ( = ?auto_248922 ?auto_248925 ) ) ( not ( = ?auto_248922 ?auto_248926 ) ) ( not ( = ?auto_248922 ?auto_248927 ) ) ( not ( = ?auto_248922 ?auto_248928 ) ) ( not ( = ?auto_248922 ?auto_248929 ) ) ( not ( = ?auto_248922 ?auto_248930 ) ) ( not ( = ?auto_248922 ?auto_248931 ) ) ( not ( = ?auto_248923 ?auto_248924 ) ) ( not ( = ?auto_248923 ?auto_248925 ) ) ( not ( = ?auto_248923 ?auto_248926 ) ) ( not ( = ?auto_248923 ?auto_248927 ) ) ( not ( = ?auto_248923 ?auto_248928 ) ) ( not ( = ?auto_248923 ?auto_248929 ) ) ( not ( = ?auto_248923 ?auto_248930 ) ) ( not ( = ?auto_248923 ?auto_248931 ) ) ( not ( = ?auto_248924 ?auto_248925 ) ) ( not ( = ?auto_248924 ?auto_248926 ) ) ( not ( = ?auto_248924 ?auto_248927 ) ) ( not ( = ?auto_248924 ?auto_248928 ) ) ( not ( = ?auto_248924 ?auto_248929 ) ) ( not ( = ?auto_248924 ?auto_248930 ) ) ( not ( = ?auto_248924 ?auto_248931 ) ) ( not ( = ?auto_248925 ?auto_248926 ) ) ( not ( = ?auto_248925 ?auto_248927 ) ) ( not ( = ?auto_248925 ?auto_248928 ) ) ( not ( = ?auto_248925 ?auto_248929 ) ) ( not ( = ?auto_248925 ?auto_248930 ) ) ( not ( = ?auto_248925 ?auto_248931 ) ) ( not ( = ?auto_248926 ?auto_248927 ) ) ( not ( = ?auto_248926 ?auto_248928 ) ) ( not ( = ?auto_248926 ?auto_248929 ) ) ( not ( = ?auto_248926 ?auto_248930 ) ) ( not ( = ?auto_248926 ?auto_248931 ) ) ( not ( = ?auto_248927 ?auto_248928 ) ) ( not ( = ?auto_248927 ?auto_248929 ) ) ( not ( = ?auto_248927 ?auto_248930 ) ) ( not ( = ?auto_248927 ?auto_248931 ) ) ( not ( = ?auto_248928 ?auto_248929 ) ) ( not ( = ?auto_248928 ?auto_248930 ) ) ( not ( = ?auto_248928 ?auto_248931 ) ) ( not ( = ?auto_248929 ?auto_248930 ) ) ( not ( = ?auto_248929 ?auto_248931 ) ) ( not ( = ?auto_248930 ?auto_248931 ) ) ( ON ?auto_248929 ?auto_248930 ) ( CLEAR ?auto_248927 ) ( ON ?auto_248928 ?auto_248929 ) ( CLEAR ?auto_248928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_248920 ?auto_248921 ?auto_248922 ?auto_248923 ?auto_248924 ?auto_248925 ?auto_248926 ?auto_248927 ?auto_248928 )
      ( MAKE-11PILE ?auto_248920 ?auto_248921 ?auto_248922 ?auto_248923 ?auto_248924 ?auto_248925 ?auto_248926 ?auto_248927 ?auto_248928 ?auto_248929 ?auto_248930 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248943 - BLOCK
      ?auto_248944 - BLOCK
      ?auto_248945 - BLOCK
      ?auto_248946 - BLOCK
      ?auto_248947 - BLOCK
      ?auto_248948 - BLOCK
      ?auto_248949 - BLOCK
      ?auto_248950 - BLOCK
      ?auto_248951 - BLOCK
      ?auto_248952 - BLOCK
      ?auto_248953 - BLOCK
    )
    :vars
    (
      ?auto_248954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248953 ?auto_248954 ) ( ON-TABLE ?auto_248943 ) ( ON ?auto_248944 ?auto_248943 ) ( ON ?auto_248945 ?auto_248944 ) ( ON ?auto_248946 ?auto_248945 ) ( ON ?auto_248947 ?auto_248946 ) ( ON ?auto_248948 ?auto_248947 ) ( ON ?auto_248949 ?auto_248948 ) ( not ( = ?auto_248943 ?auto_248944 ) ) ( not ( = ?auto_248943 ?auto_248945 ) ) ( not ( = ?auto_248943 ?auto_248946 ) ) ( not ( = ?auto_248943 ?auto_248947 ) ) ( not ( = ?auto_248943 ?auto_248948 ) ) ( not ( = ?auto_248943 ?auto_248949 ) ) ( not ( = ?auto_248943 ?auto_248950 ) ) ( not ( = ?auto_248943 ?auto_248951 ) ) ( not ( = ?auto_248943 ?auto_248952 ) ) ( not ( = ?auto_248943 ?auto_248953 ) ) ( not ( = ?auto_248943 ?auto_248954 ) ) ( not ( = ?auto_248944 ?auto_248945 ) ) ( not ( = ?auto_248944 ?auto_248946 ) ) ( not ( = ?auto_248944 ?auto_248947 ) ) ( not ( = ?auto_248944 ?auto_248948 ) ) ( not ( = ?auto_248944 ?auto_248949 ) ) ( not ( = ?auto_248944 ?auto_248950 ) ) ( not ( = ?auto_248944 ?auto_248951 ) ) ( not ( = ?auto_248944 ?auto_248952 ) ) ( not ( = ?auto_248944 ?auto_248953 ) ) ( not ( = ?auto_248944 ?auto_248954 ) ) ( not ( = ?auto_248945 ?auto_248946 ) ) ( not ( = ?auto_248945 ?auto_248947 ) ) ( not ( = ?auto_248945 ?auto_248948 ) ) ( not ( = ?auto_248945 ?auto_248949 ) ) ( not ( = ?auto_248945 ?auto_248950 ) ) ( not ( = ?auto_248945 ?auto_248951 ) ) ( not ( = ?auto_248945 ?auto_248952 ) ) ( not ( = ?auto_248945 ?auto_248953 ) ) ( not ( = ?auto_248945 ?auto_248954 ) ) ( not ( = ?auto_248946 ?auto_248947 ) ) ( not ( = ?auto_248946 ?auto_248948 ) ) ( not ( = ?auto_248946 ?auto_248949 ) ) ( not ( = ?auto_248946 ?auto_248950 ) ) ( not ( = ?auto_248946 ?auto_248951 ) ) ( not ( = ?auto_248946 ?auto_248952 ) ) ( not ( = ?auto_248946 ?auto_248953 ) ) ( not ( = ?auto_248946 ?auto_248954 ) ) ( not ( = ?auto_248947 ?auto_248948 ) ) ( not ( = ?auto_248947 ?auto_248949 ) ) ( not ( = ?auto_248947 ?auto_248950 ) ) ( not ( = ?auto_248947 ?auto_248951 ) ) ( not ( = ?auto_248947 ?auto_248952 ) ) ( not ( = ?auto_248947 ?auto_248953 ) ) ( not ( = ?auto_248947 ?auto_248954 ) ) ( not ( = ?auto_248948 ?auto_248949 ) ) ( not ( = ?auto_248948 ?auto_248950 ) ) ( not ( = ?auto_248948 ?auto_248951 ) ) ( not ( = ?auto_248948 ?auto_248952 ) ) ( not ( = ?auto_248948 ?auto_248953 ) ) ( not ( = ?auto_248948 ?auto_248954 ) ) ( not ( = ?auto_248949 ?auto_248950 ) ) ( not ( = ?auto_248949 ?auto_248951 ) ) ( not ( = ?auto_248949 ?auto_248952 ) ) ( not ( = ?auto_248949 ?auto_248953 ) ) ( not ( = ?auto_248949 ?auto_248954 ) ) ( not ( = ?auto_248950 ?auto_248951 ) ) ( not ( = ?auto_248950 ?auto_248952 ) ) ( not ( = ?auto_248950 ?auto_248953 ) ) ( not ( = ?auto_248950 ?auto_248954 ) ) ( not ( = ?auto_248951 ?auto_248952 ) ) ( not ( = ?auto_248951 ?auto_248953 ) ) ( not ( = ?auto_248951 ?auto_248954 ) ) ( not ( = ?auto_248952 ?auto_248953 ) ) ( not ( = ?auto_248952 ?auto_248954 ) ) ( not ( = ?auto_248953 ?auto_248954 ) ) ( ON ?auto_248952 ?auto_248953 ) ( ON ?auto_248951 ?auto_248952 ) ( CLEAR ?auto_248949 ) ( ON ?auto_248950 ?auto_248951 ) ( CLEAR ?auto_248950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248943 ?auto_248944 ?auto_248945 ?auto_248946 ?auto_248947 ?auto_248948 ?auto_248949 ?auto_248950 )
      ( MAKE-11PILE ?auto_248943 ?auto_248944 ?auto_248945 ?auto_248946 ?auto_248947 ?auto_248948 ?auto_248949 ?auto_248950 ?auto_248951 ?auto_248952 ?auto_248953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248966 - BLOCK
      ?auto_248967 - BLOCK
      ?auto_248968 - BLOCK
      ?auto_248969 - BLOCK
      ?auto_248970 - BLOCK
      ?auto_248971 - BLOCK
      ?auto_248972 - BLOCK
      ?auto_248973 - BLOCK
      ?auto_248974 - BLOCK
      ?auto_248975 - BLOCK
      ?auto_248976 - BLOCK
    )
    :vars
    (
      ?auto_248977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248976 ?auto_248977 ) ( ON-TABLE ?auto_248966 ) ( ON ?auto_248967 ?auto_248966 ) ( ON ?auto_248968 ?auto_248967 ) ( ON ?auto_248969 ?auto_248968 ) ( ON ?auto_248970 ?auto_248969 ) ( ON ?auto_248971 ?auto_248970 ) ( ON ?auto_248972 ?auto_248971 ) ( not ( = ?auto_248966 ?auto_248967 ) ) ( not ( = ?auto_248966 ?auto_248968 ) ) ( not ( = ?auto_248966 ?auto_248969 ) ) ( not ( = ?auto_248966 ?auto_248970 ) ) ( not ( = ?auto_248966 ?auto_248971 ) ) ( not ( = ?auto_248966 ?auto_248972 ) ) ( not ( = ?auto_248966 ?auto_248973 ) ) ( not ( = ?auto_248966 ?auto_248974 ) ) ( not ( = ?auto_248966 ?auto_248975 ) ) ( not ( = ?auto_248966 ?auto_248976 ) ) ( not ( = ?auto_248966 ?auto_248977 ) ) ( not ( = ?auto_248967 ?auto_248968 ) ) ( not ( = ?auto_248967 ?auto_248969 ) ) ( not ( = ?auto_248967 ?auto_248970 ) ) ( not ( = ?auto_248967 ?auto_248971 ) ) ( not ( = ?auto_248967 ?auto_248972 ) ) ( not ( = ?auto_248967 ?auto_248973 ) ) ( not ( = ?auto_248967 ?auto_248974 ) ) ( not ( = ?auto_248967 ?auto_248975 ) ) ( not ( = ?auto_248967 ?auto_248976 ) ) ( not ( = ?auto_248967 ?auto_248977 ) ) ( not ( = ?auto_248968 ?auto_248969 ) ) ( not ( = ?auto_248968 ?auto_248970 ) ) ( not ( = ?auto_248968 ?auto_248971 ) ) ( not ( = ?auto_248968 ?auto_248972 ) ) ( not ( = ?auto_248968 ?auto_248973 ) ) ( not ( = ?auto_248968 ?auto_248974 ) ) ( not ( = ?auto_248968 ?auto_248975 ) ) ( not ( = ?auto_248968 ?auto_248976 ) ) ( not ( = ?auto_248968 ?auto_248977 ) ) ( not ( = ?auto_248969 ?auto_248970 ) ) ( not ( = ?auto_248969 ?auto_248971 ) ) ( not ( = ?auto_248969 ?auto_248972 ) ) ( not ( = ?auto_248969 ?auto_248973 ) ) ( not ( = ?auto_248969 ?auto_248974 ) ) ( not ( = ?auto_248969 ?auto_248975 ) ) ( not ( = ?auto_248969 ?auto_248976 ) ) ( not ( = ?auto_248969 ?auto_248977 ) ) ( not ( = ?auto_248970 ?auto_248971 ) ) ( not ( = ?auto_248970 ?auto_248972 ) ) ( not ( = ?auto_248970 ?auto_248973 ) ) ( not ( = ?auto_248970 ?auto_248974 ) ) ( not ( = ?auto_248970 ?auto_248975 ) ) ( not ( = ?auto_248970 ?auto_248976 ) ) ( not ( = ?auto_248970 ?auto_248977 ) ) ( not ( = ?auto_248971 ?auto_248972 ) ) ( not ( = ?auto_248971 ?auto_248973 ) ) ( not ( = ?auto_248971 ?auto_248974 ) ) ( not ( = ?auto_248971 ?auto_248975 ) ) ( not ( = ?auto_248971 ?auto_248976 ) ) ( not ( = ?auto_248971 ?auto_248977 ) ) ( not ( = ?auto_248972 ?auto_248973 ) ) ( not ( = ?auto_248972 ?auto_248974 ) ) ( not ( = ?auto_248972 ?auto_248975 ) ) ( not ( = ?auto_248972 ?auto_248976 ) ) ( not ( = ?auto_248972 ?auto_248977 ) ) ( not ( = ?auto_248973 ?auto_248974 ) ) ( not ( = ?auto_248973 ?auto_248975 ) ) ( not ( = ?auto_248973 ?auto_248976 ) ) ( not ( = ?auto_248973 ?auto_248977 ) ) ( not ( = ?auto_248974 ?auto_248975 ) ) ( not ( = ?auto_248974 ?auto_248976 ) ) ( not ( = ?auto_248974 ?auto_248977 ) ) ( not ( = ?auto_248975 ?auto_248976 ) ) ( not ( = ?auto_248975 ?auto_248977 ) ) ( not ( = ?auto_248976 ?auto_248977 ) ) ( ON ?auto_248975 ?auto_248976 ) ( ON ?auto_248974 ?auto_248975 ) ( CLEAR ?auto_248972 ) ( ON ?auto_248973 ?auto_248974 ) ( CLEAR ?auto_248973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_248966 ?auto_248967 ?auto_248968 ?auto_248969 ?auto_248970 ?auto_248971 ?auto_248972 ?auto_248973 )
      ( MAKE-11PILE ?auto_248966 ?auto_248967 ?auto_248968 ?auto_248969 ?auto_248970 ?auto_248971 ?auto_248972 ?auto_248973 ?auto_248974 ?auto_248975 ?auto_248976 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_248989 - BLOCK
      ?auto_248990 - BLOCK
      ?auto_248991 - BLOCK
      ?auto_248992 - BLOCK
      ?auto_248993 - BLOCK
      ?auto_248994 - BLOCK
      ?auto_248995 - BLOCK
      ?auto_248996 - BLOCK
      ?auto_248997 - BLOCK
      ?auto_248998 - BLOCK
      ?auto_248999 - BLOCK
    )
    :vars
    (
      ?auto_249000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_248999 ?auto_249000 ) ( ON-TABLE ?auto_248989 ) ( ON ?auto_248990 ?auto_248989 ) ( ON ?auto_248991 ?auto_248990 ) ( ON ?auto_248992 ?auto_248991 ) ( ON ?auto_248993 ?auto_248992 ) ( ON ?auto_248994 ?auto_248993 ) ( not ( = ?auto_248989 ?auto_248990 ) ) ( not ( = ?auto_248989 ?auto_248991 ) ) ( not ( = ?auto_248989 ?auto_248992 ) ) ( not ( = ?auto_248989 ?auto_248993 ) ) ( not ( = ?auto_248989 ?auto_248994 ) ) ( not ( = ?auto_248989 ?auto_248995 ) ) ( not ( = ?auto_248989 ?auto_248996 ) ) ( not ( = ?auto_248989 ?auto_248997 ) ) ( not ( = ?auto_248989 ?auto_248998 ) ) ( not ( = ?auto_248989 ?auto_248999 ) ) ( not ( = ?auto_248989 ?auto_249000 ) ) ( not ( = ?auto_248990 ?auto_248991 ) ) ( not ( = ?auto_248990 ?auto_248992 ) ) ( not ( = ?auto_248990 ?auto_248993 ) ) ( not ( = ?auto_248990 ?auto_248994 ) ) ( not ( = ?auto_248990 ?auto_248995 ) ) ( not ( = ?auto_248990 ?auto_248996 ) ) ( not ( = ?auto_248990 ?auto_248997 ) ) ( not ( = ?auto_248990 ?auto_248998 ) ) ( not ( = ?auto_248990 ?auto_248999 ) ) ( not ( = ?auto_248990 ?auto_249000 ) ) ( not ( = ?auto_248991 ?auto_248992 ) ) ( not ( = ?auto_248991 ?auto_248993 ) ) ( not ( = ?auto_248991 ?auto_248994 ) ) ( not ( = ?auto_248991 ?auto_248995 ) ) ( not ( = ?auto_248991 ?auto_248996 ) ) ( not ( = ?auto_248991 ?auto_248997 ) ) ( not ( = ?auto_248991 ?auto_248998 ) ) ( not ( = ?auto_248991 ?auto_248999 ) ) ( not ( = ?auto_248991 ?auto_249000 ) ) ( not ( = ?auto_248992 ?auto_248993 ) ) ( not ( = ?auto_248992 ?auto_248994 ) ) ( not ( = ?auto_248992 ?auto_248995 ) ) ( not ( = ?auto_248992 ?auto_248996 ) ) ( not ( = ?auto_248992 ?auto_248997 ) ) ( not ( = ?auto_248992 ?auto_248998 ) ) ( not ( = ?auto_248992 ?auto_248999 ) ) ( not ( = ?auto_248992 ?auto_249000 ) ) ( not ( = ?auto_248993 ?auto_248994 ) ) ( not ( = ?auto_248993 ?auto_248995 ) ) ( not ( = ?auto_248993 ?auto_248996 ) ) ( not ( = ?auto_248993 ?auto_248997 ) ) ( not ( = ?auto_248993 ?auto_248998 ) ) ( not ( = ?auto_248993 ?auto_248999 ) ) ( not ( = ?auto_248993 ?auto_249000 ) ) ( not ( = ?auto_248994 ?auto_248995 ) ) ( not ( = ?auto_248994 ?auto_248996 ) ) ( not ( = ?auto_248994 ?auto_248997 ) ) ( not ( = ?auto_248994 ?auto_248998 ) ) ( not ( = ?auto_248994 ?auto_248999 ) ) ( not ( = ?auto_248994 ?auto_249000 ) ) ( not ( = ?auto_248995 ?auto_248996 ) ) ( not ( = ?auto_248995 ?auto_248997 ) ) ( not ( = ?auto_248995 ?auto_248998 ) ) ( not ( = ?auto_248995 ?auto_248999 ) ) ( not ( = ?auto_248995 ?auto_249000 ) ) ( not ( = ?auto_248996 ?auto_248997 ) ) ( not ( = ?auto_248996 ?auto_248998 ) ) ( not ( = ?auto_248996 ?auto_248999 ) ) ( not ( = ?auto_248996 ?auto_249000 ) ) ( not ( = ?auto_248997 ?auto_248998 ) ) ( not ( = ?auto_248997 ?auto_248999 ) ) ( not ( = ?auto_248997 ?auto_249000 ) ) ( not ( = ?auto_248998 ?auto_248999 ) ) ( not ( = ?auto_248998 ?auto_249000 ) ) ( not ( = ?auto_248999 ?auto_249000 ) ) ( ON ?auto_248998 ?auto_248999 ) ( ON ?auto_248997 ?auto_248998 ) ( ON ?auto_248996 ?auto_248997 ) ( CLEAR ?auto_248994 ) ( ON ?auto_248995 ?auto_248996 ) ( CLEAR ?auto_248995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_248989 ?auto_248990 ?auto_248991 ?auto_248992 ?auto_248993 ?auto_248994 ?auto_248995 )
      ( MAKE-11PILE ?auto_248989 ?auto_248990 ?auto_248991 ?auto_248992 ?auto_248993 ?auto_248994 ?auto_248995 ?auto_248996 ?auto_248997 ?auto_248998 ?auto_248999 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249012 - BLOCK
      ?auto_249013 - BLOCK
      ?auto_249014 - BLOCK
      ?auto_249015 - BLOCK
      ?auto_249016 - BLOCK
      ?auto_249017 - BLOCK
      ?auto_249018 - BLOCK
      ?auto_249019 - BLOCK
      ?auto_249020 - BLOCK
      ?auto_249021 - BLOCK
      ?auto_249022 - BLOCK
    )
    :vars
    (
      ?auto_249023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249022 ?auto_249023 ) ( ON-TABLE ?auto_249012 ) ( ON ?auto_249013 ?auto_249012 ) ( ON ?auto_249014 ?auto_249013 ) ( ON ?auto_249015 ?auto_249014 ) ( ON ?auto_249016 ?auto_249015 ) ( ON ?auto_249017 ?auto_249016 ) ( not ( = ?auto_249012 ?auto_249013 ) ) ( not ( = ?auto_249012 ?auto_249014 ) ) ( not ( = ?auto_249012 ?auto_249015 ) ) ( not ( = ?auto_249012 ?auto_249016 ) ) ( not ( = ?auto_249012 ?auto_249017 ) ) ( not ( = ?auto_249012 ?auto_249018 ) ) ( not ( = ?auto_249012 ?auto_249019 ) ) ( not ( = ?auto_249012 ?auto_249020 ) ) ( not ( = ?auto_249012 ?auto_249021 ) ) ( not ( = ?auto_249012 ?auto_249022 ) ) ( not ( = ?auto_249012 ?auto_249023 ) ) ( not ( = ?auto_249013 ?auto_249014 ) ) ( not ( = ?auto_249013 ?auto_249015 ) ) ( not ( = ?auto_249013 ?auto_249016 ) ) ( not ( = ?auto_249013 ?auto_249017 ) ) ( not ( = ?auto_249013 ?auto_249018 ) ) ( not ( = ?auto_249013 ?auto_249019 ) ) ( not ( = ?auto_249013 ?auto_249020 ) ) ( not ( = ?auto_249013 ?auto_249021 ) ) ( not ( = ?auto_249013 ?auto_249022 ) ) ( not ( = ?auto_249013 ?auto_249023 ) ) ( not ( = ?auto_249014 ?auto_249015 ) ) ( not ( = ?auto_249014 ?auto_249016 ) ) ( not ( = ?auto_249014 ?auto_249017 ) ) ( not ( = ?auto_249014 ?auto_249018 ) ) ( not ( = ?auto_249014 ?auto_249019 ) ) ( not ( = ?auto_249014 ?auto_249020 ) ) ( not ( = ?auto_249014 ?auto_249021 ) ) ( not ( = ?auto_249014 ?auto_249022 ) ) ( not ( = ?auto_249014 ?auto_249023 ) ) ( not ( = ?auto_249015 ?auto_249016 ) ) ( not ( = ?auto_249015 ?auto_249017 ) ) ( not ( = ?auto_249015 ?auto_249018 ) ) ( not ( = ?auto_249015 ?auto_249019 ) ) ( not ( = ?auto_249015 ?auto_249020 ) ) ( not ( = ?auto_249015 ?auto_249021 ) ) ( not ( = ?auto_249015 ?auto_249022 ) ) ( not ( = ?auto_249015 ?auto_249023 ) ) ( not ( = ?auto_249016 ?auto_249017 ) ) ( not ( = ?auto_249016 ?auto_249018 ) ) ( not ( = ?auto_249016 ?auto_249019 ) ) ( not ( = ?auto_249016 ?auto_249020 ) ) ( not ( = ?auto_249016 ?auto_249021 ) ) ( not ( = ?auto_249016 ?auto_249022 ) ) ( not ( = ?auto_249016 ?auto_249023 ) ) ( not ( = ?auto_249017 ?auto_249018 ) ) ( not ( = ?auto_249017 ?auto_249019 ) ) ( not ( = ?auto_249017 ?auto_249020 ) ) ( not ( = ?auto_249017 ?auto_249021 ) ) ( not ( = ?auto_249017 ?auto_249022 ) ) ( not ( = ?auto_249017 ?auto_249023 ) ) ( not ( = ?auto_249018 ?auto_249019 ) ) ( not ( = ?auto_249018 ?auto_249020 ) ) ( not ( = ?auto_249018 ?auto_249021 ) ) ( not ( = ?auto_249018 ?auto_249022 ) ) ( not ( = ?auto_249018 ?auto_249023 ) ) ( not ( = ?auto_249019 ?auto_249020 ) ) ( not ( = ?auto_249019 ?auto_249021 ) ) ( not ( = ?auto_249019 ?auto_249022 ) ) ( not ( = ?auto_249019 ?auto_249023 ) ) ( not ( = ?auto_249020 ?auto_249021 ) ) ( not ( = ?auto_249020 ?auto_249022 ) ) ( not ( = ?auto_249020 ?auto_249023 ) ) ( not ( = ?auto_249021 ?auto_249022 ) ) ( not ( = ?auto_249021 ?auto_249023 ) ) ( not ( = ?auto_249022 ?auto_249023 ) ) ( ON ?auto_249021 ?auto_249022 ) ( ON ?auto_249020 ?auto_249021 ) ( ON ?auto_249019 ?auto_249020 ) ( CLEAR ?auto_249017 ) ( ON ?auto_249018 ?auto_249019 ) ( CLEAR ?auto_249018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_249012 ?auto_249013 ?auto_249014 ?auto_249015 ?auto_249016 ?auto_249017 ?auto_249018 )
      ( MAKE-11PILE ?auto_249012 ?auto_249013 ?auto_249014 ?auto_249015 ?auto_249016 ?auto_249017 ?auto_249018 ?auto_249019 ?auto_249020 ?auto_249021 ?auto_249022 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249035 - BLOCK
      ?auto_249036 - BLOCK
      ?auto_249037 - BLOCK
      ?auto_249038 - BLOCK
      ?auto_249039 - BLOCK
      ?auto_249040 - BLOCK
      ?auto_249041 - BLOCK
      ?auto_249042 - BLOCK
      ?auto_249043 - BLOCK
      ?auto_249044 - BLOCK
      ?auto_249045 - BLOCK
    )
    :vars
    (
      ?auto_249046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249045 ?auto_249046 ) ( ON-TABLE ?auto_249035 ) ( ON ?auto_249036 ?auto_249035 ) ( ON ?auto_249037 ?auto_249036 ) ( ON ?auto_249038 ?auto_249037 ) ( ON ?auto_249039 ?auto_249038 ) ( not ( = ?auto_249035 ?auto_249036 ) ) ( not ( = ?auto_249035 ?auto_249037 ) ) ( not ( = ?auto_249035 ?auto_249038 ) ) ( not ( = ?auto_249035 ?auto_249039 ) ) ( not ( = ?auto_249035 ?auto_249040 ) ) ( not ( = ?auto_249035 ?auto_249041 ) ) ( not ( = ?auto_249035 ?auto_249042 ) ) ( not ( = ?auto_249035 ?auto_249043 ) ) ( not ( = ?auto_249035 ?auto_249044 ) ) ( not ( = ?auto_249035 ?auto_249045 ) ) ( not ( = ?auto_249035 ?auto_249046 ) ) ( not ( = ?auto_249036 ?auto_249037 ) ) ( not ( = ?auto_249036 ?auto_249038 ) ) ( not ( = ?auto_249036 ?auto_249039 ) ) ( not ( = ?auto_249036 ?auto_249040 ) ) ( not ( = ?auto_249036 ?auto_249041 ) ) ( not ( = ?auto_249036 ?auto_249042 ) ) ( not ( = ?auto_249036 ?auto_249043 ) ) ( not ( = ?auto_249036 ?auto_249044 ) ) ( not ( = ?auto_249036 ?auto_249045 ) ) ( not ( = ?auto_249036 ?auto_249046 ) ) ( not ( = ?auto_249037 ?auto_249038 ) ) ( not ( = ?auto_249037 ?auto_249039 ) ) ( not ( = ?auto_249037 ?auto_249040 ) ) ( not ( = ?auto_249037 ?auto_249041 ) ) ( not ( = ?auto_249037 ?auto_249042 ) ) ( not ( = ?auto_249037 ?auto_249043 ) ) ( not ( = ?auto_249037 ?auto_249044 ) ) ( not ( = ?auto_249037 ?auto_249045 ) ) ( not ( = ?auto_249037 ?auto_249046 ) ) ( not ( = ?auto_249038 ?auto_249039 ) ) ( not ( = ?auto_249038 ?auto_249040 ) ) ( not ( = ?auto_249038 ?auto_249041 ) ) ( not ( = ?auto_249038 ?auto_249042 ) ) ( not ( = ?auto_249038 ?auto_249043 ) ) ( not ( = ?auto_249038 ?auto_249044 ) ) ( not ( = ?auto_249038 ?auto_249045 ) ) ( not ( = ?auto_249038 ?auto_249046 ) ) ( not ( = ?auto_249039 ?auto_249040 ) ) ( not ( = ?auto_249039 ?auto_249041 ) ) ( not ( = ?auto_249039 ?auto_249042 ) ) ( not ( = ?auto_249039 ?auto_249043 ) ) ( not ( = ?auto_249039 ?auto_249044 ) ) ( not ( = ?auto_249039 ?auto_249045 ) ) ( not ( = ?auto_249039 ?auto_249046 ) ) ( not ( = ?auto_249040 ?auto_249041 ) ) ( not ( = ?auto_249040 ?auto_249042 ) ) ( not ( = ?auto_249040 ?auto_249043 ) ) ( not ( = ?auto_249040 ?auto_249044 ) ) ( not ( = ?auto_249040 ?auto_249045 ) ) ( not ( = ?auto_249040 ?auto_249046 ) ) ( not ( = ?auto_249041 ?auto_249042 ) ) ( not ( = ?auto_249041 ?auto_249043 ) ) ( not ( = ?auto_249041 ?auto_249044 ) ) ( not ( = ?auto_249041 ?auto_249045 ) ) ( not ( = ?auto_249041 ?auto_249046 ) ) ( not ( = ?auto_249042 ?auto_249043 ) ) ( not ( = ?auto_249042 ?auto_249044 ) ) ( not ( = ?auto_249042 ?auto_249045 ) ) ( not ( = ?auto_249042 ?auto_249046 ) ) ( not ( = ?auto_249043 ?auto_249044 ) ) ( not ( = ?auto_249043 ?auto_249045 ) ) ( not ( = ?auto_249043 ?auto_249046 ) ) ( not ( = ?auto_249044 ?auto_249045 ) ) ( not ( = ?auto_249044 ?auto_249046 ) ) ( not ( = ?auto_249045 ?auto_249046 ) ) ( ON ?auto_249044 ?auto_249045 ) ( ON ?auto_249043 ?auto_249044 ) ( ON ?auto_249042 ?auto_249043 ) ( ON ?auto_249041 ?auto_249042 ) ( CLEAR ?auto_249039 ) ( ON ?auto_249040 ?auto_249041 ) ( CLEAR ?auto_249040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249035 ?auto_249036 ?auto_249037 ?auto_249038 ?auto_249039 ?auto_249040 )
      ( MAKE-11PILE ?auto_249035 ?auto_249036 ?auto_249037 ?auto_249038 ?auto_249039 ?auto_249040 ?auto_249041 ?auto_249042 ?auto_249043 ?auto_249044 ?auto_249045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249058 - BLOCK
      ?auto_249059 - BLOCK
      ?auto_249060 - BLOCK
      ?auto_249061 - BLOCK
      ?auto_249062 - BLOCK
      ?auto_249063 - BLOCK
      ?auto_249064 - BLOCK
      ?auto_249065 - BLOCK
      ?auto_249066 - BLOCK
      ?auto_249067 - BLOCK
      ?auto_249068 - BLOCK
    )
    :vars
    (
      ?auto_249069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249068 ?auto_249069 ) ( ON-TABLE ?auto_249058 ) ( ON ?auto_249059 ?auto_249058 ) ( ON ?auto_249060 ?auto_249059 ) ( ON ?auto_249061 ?auto_249060 ) ( ON ?auto_249062 ?auto_249061 ) ( not ( = ?auto_249058 ?auto_249059 ) ) ( not ( = ?auto_249058 ?auto_249060 ) ) ( not ( = ?auto_249058 ?auto_249061 ) ) ( not ( = ?auto_249058 ?auto_249062 ) ) ( not ( = ?auto_249058 ?auto_249063 ) ) ( not ( = ?auto_249058 ?auto_249064 ) ) ( not ( = ?auto_249058 ?auto_249065 ) ) ( not ( = ?auto_249058 ?auto_249066 ) ) ( not ( = ?auto_249058 ?auto_249067 ) ) ( not ( = ?auto_249058 ?auto_249068 ) ) ( not ( = ?auto_249058 ?auto_249069 ) ) ( not ( = ?auto_249059 ?auto_249060 ) ) ( not ( = ?auto_249059 ?auto_249061 ) ) ( not ( = ?auto_249059 ?auto_249062 ) ) ( not ( = ?auto_249059 ?auto_249063 ) ) ( not ( = ?auto_249059 ?auto_249064 ) ) ( not ( = ?auto_249059 ?auto_249065 ) ) ( not ( = ?auto_249059 ?auto_249066 ) ) ( not ( = ?auto_249059 ?auto_249067 ) ) ( not ( = ?auto_249059 ?auto_249068 ) ) ( not ( = ?auto_249059 ?auto_249069 ) ) ( not ( = ?auto_249060 ?auto_249061 ) ) ( not ( = ?auto_249060 ?auto_249062 ) ) ( not ( = ?auto_249060 ?auto_249063 ) ) ( not ( = ?auto_249060 ?auto_249064 ) ) ( not ( = ?auto_249060 ?auto_249065 ) ) ( not ( = ?auto_249060 ?auto_249066 ) ) ( not ( = ?auto_249060 ?auto_249067 ) ) ( not ( = ?auto_249060 ?auto_249068 ) ) ( not ( = ?auto_249060 ?auto_249069 ) ) ( not ( = ?auto_249061 ?auto_249062 ) ) ( not ( = ?auto_249061 ?auto_249063 ) ) ( not ( = ?auto_249061 ?auto_249064 ) ) ( not ( = ?auto_249061 ?auto_249065 ) ) ( not ( = ?auto_249061 ?auto_249066 ) ) ( not ( = ?auto_249061 ?auto_249067 ) ) ( not ( = ?auto_249061 ?auto_249068 ) ) ( not ( = ?auto_249061 ?auto_249069 ) ) ( not ( = ?auto_249062 ?auto_249063 ) ) ( not ( = ?auto_249062 ?auto_249064 ) ) ( not ( = ?auto_249062 ?auto_249065 ) ) ( not ( = ?auto_249062 ?auto_249066 ) ) ( not ( = ?auto_249062 ?auto_249067 ) ) ( not ( = ?auto_249062 ?auto_249068 ) ) ( not ( = ?auto_249062 ?auto_249069 ) ) ( not ( = ?auto_249063 ?auto_249064 ) ) ( not ( = ?auto_249063 ?auto_249065 ) ) ( not ( = ?auto_249063 ?auto_249066 ) ) ( not ( = ?auto_249063 ?auto_249067 ) ) ( not ( = ?auto_249063 ?auto_249068 ) ) ( not ( = ?auto_249063 ?auto_249069 ) ) ( not ( = ?auto_249064 ?auto_249065 ) ) ( not ( = ?auto_249064 ?auto_249066 ) ) ( not ( = ?auto_249064 ?auto_249067 ) ) ( not ( = ?auto_249064 ?auto_249068 ) ) ( not ( = ?auto_249064 ?auto_249069 ) ) ( not ( = ?auto_249065 ?auto_249066 ) ) ( not ( = ?auto_249065 ?auto_249067 ) ) ( not ( = ?auto_249065 ?auto_249068 ) ) ( not ( = ?auto_249065 ?auto_249069 ) ) ( not ( = ?auto_249066 ?auto_249067 ) ) ( not ( = ?auto_249066 ?auto_249068 ) ) ( not ( = ?auto_249066 ?auto_249069 ) ) ( not ( = ?auto_249067 ?auto_249068 ) ) ( not ( = ?auto_249067 ?auto_249069 ) ) ( not ( = ?auto_249068 ?auto_249069 ) ) ( ON ?auto_249067 ?auto_249068 ) ( ON ?auto_249066 ?auto_249067 ) ( ON ?auto_249065 ?auto_249066 ) ( ON ?auto_249064 ?auto_249065 ) ( CLEAR ?auto_249062 ) ( ON ?auto_249063 ?auto_249064 ) ( CLEAR ?auto_249063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249058 ?auto_249059 ?auto_249060 ?auto_249061 ?auto_249062 ?auto_249063 )
      ( MAKE-11PILE ?auto_249058 ?auto_249059 ?auto_249060 ?auto_249061 ?auto_249062 ?auto_249063 ?auto_249064 ?auto_249065 ?auto_249066 ?auto_249067 ?auto_249068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249081 - BLOCK
      ?auto_249082 - BLOCK
      ?auto_249083 - BLOCK
      ?auto_249084 - BLOCK
      ?auto_249085 - BLOCK
      ?auto_249086 - BLOCK
      ?auto_249087 - BLOCK
      ?auto_249088 - BLOCK
      ?auto_249089 - BLOCK
      ?auto_249090 - BLOCK
      ?auto_249091 - BLOCK
    )
    :vars
    (
      ?auto_249092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249091 ?auto_249092 ) ( ON-TABLE ?auto_249081 ) ( ON ?auto_249082 ?auto_249081 ) ( ON ?auto_249083 ?auto_249082 ) ( ON ?auto_249084 ?auto_249083 ) ( not ( = ?auto_249081 ?auto_249082 ) ) ( not ( = ?auto_249081 ?auto_249083 ) ) ( not ( = ?auto_249081 ?auto_249084 ) ) ( not ( = ?auto_249081 ?auto_249085 ) ) ( not ( = ?auto_249081 ?auto_249086 ) ) ( not ( = ?auto_249081 ?auto_249087 ) ) ( not ( = ?auto_249081 ?auto_249088 ) ) ( not ( = ?auto_249081 ?auto_249089 ) ) ( not ( = ?auto_249081 ?auto_249090 ) ) ( not ( = ?auto_249081 ?auto_249091 ) ) ( not ( = ?auto_249081 ?auto_249092 ) ) ( not ( = ?auto_249082 ?auto_249083 ) ) ( not ( = ?auto_249082 ?auto_249084 ) ) ( not ( = ?auto_249082 ?auto_249085 ) ) ( not ( = ?auto_249082 ?auto_249086 ) ) ( not ( = ?auto_249082 ?auto_249087 ) ) ( not ( = ?auto_249082 ?auto_249088 ) ) ( not ( = ?auto_249082 ?auto_249089 ) ) ( not ( = ?auto_249082 ?auto_249090 ) ) ( not ( = ?auto_249082 ?auto_249091 ) ) ( not ( = ?auto_249082 ?auto_249092 ) ) ( not ( = ?auto_249083 ?auto_249084 ) ) ( not ( = ?auto_249083 ?auto_249085 ) ) ( not ( = ?auto_249083 ?auto_249086 ) ) ( not ( = ?auto_249083 ?auto_249087 ) ) ( not ( = ?auto_249083 ?auto_249088 ) ) ( not ( = ?auto_249083 ?auto_249089 ) ) ( not ( = ?auto_249083 ?auto_249090 ) ) ( not ( = ?auto_249083 ?auto_249091 ) ) ( not ( = ?auto_249083 ?auto_249092 ) ) ( not ( = ?auto_249084 ?auto_249085 ) ) ( not ( = ?auto_249084 ?auto_249086 ) ) ( not ( = ?auto_249084 ?auto_249087 ) ) ( not ( = ?auto_249084 ?auto_249088 ) ) ( not ( = ?auto_249084 ?auto_249089 ) ) ( not ( = ?auto_249084 ?auto_249090 ) ) ( not ( = ?auto_249084 ?auto_249091 ) ) ( not ( = ?auto_249084 ?auto_249092 ) ) ( not ( = ?auto_249085 ?auto_249086 ) ) ( not ( = ?auto_249085 ?auto_249087 ) ) ( not ( = ?auto_249085 ?auto_249088 ) ) ( not ( = ?auto_249085 ?auto_249089 ) ) ( not ( = ?auto_249085 ?auto_249090 ) ) ( not ( = ?auto_249085 ?auto_249091 ) ) ( not ( = ?auto_249085 ?auto_249092 ) ) ( not ( = ?auto_249086 ?auto_249087 ) ) ( not ( = ?auto_249086 ?auto_249088 ) ) ( not ( = ?auto_249086 ?auto_249089 ) ) ( not ( = ?auto_249086 ?auto_249090 ) ) ( not ( = ?auto_249086 ?auto_249091 ) ) ( not ( = ?auto_249086 ?auto_249092 ) ) ( not ( = ?auto_249087 ?auto_249088 ) ) ( not ( = ?auto_249087 ?auto_249089 ) ) ( not ( = ?auto_249087 ?auto_249090 ) ) ( not ( = ?auto_249087 ?auto_249091 ) ) ( not ( = ?auto_249087 ?auto_249092 ) ) ( not ( = ?auto_249088 ?auto_249089 ) ) ( not ( = ?auto_249088 ?auto_249090 ) ) ( not ( = ?auto_249088 ?auto_249091 ) ) ( not ( = ?auto_249088 ?auto_249092 ) ) ( not ( = ?auto_249089 ?auto_249090 ) ) ( not ( = ?auto_249089 ?auto_249091 ) ) ( not ( = ?auto_249089 ?auto_249092 ) ) ( not ( = ?auto_249090 ?auto_249091 ) ) ( not ( = ?auto_249090 ?auto_249092 ) ) ( not ( = ?auto_249091 ?auto_249092 ) ) ( ON ?auto_249090 ?auto_249091 ) ( ON ?auto_249089 ?auto_249090 ) ( ON ?auto_249088 ?auto_249089 ) ( ON ?auto_249087 ?auto_249088 ) ( ON ?auto_249086 ?auto_249087 ) ( CLEAR ?auto_249084 ) ( ON ?auto_249085 ?auto_249086 ) ( CLEAR ?auto_249085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249081 ?auto_249082 ?auto_249083 ?auto_249084 ?auto_249085 )
      ( MAKE-11PILE ?auto_249081 ?auto_249082 ?auto_249083 ?auto_249084 ?auto_249085 ?auto_249086 ?auto_249087 ?auto_249088 ?auto_249089 ?auto_249090 ?auto_249091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249104 - BLOCK
      ?auto_249105 - BLOCK
      ?auto_249106 - BLOCK
      ?auto_249107 - BLOCK
      ?auto_249108 - BLOCK
      ?auto_249109 - BLOCK
      ?auto_249110 - BLOCK
      ?auto_249111 - BLOCK
      ?auto_249112 - BLOCK
      ?auto_249113 - BLOCK
      ?auto_249114 - BLOCK
    )
    :vars
    (
      ?auto_249115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249114 ?auto_249115 ) ( ON-TABLE ?auto_249104 ) ( ON ?auto_249105 ?auto_249104 ) ( ON ?auto_249106 ?auto_249105 ) ( ON ?auto_249107 ?auto_249106 ) ( not ( = ?auto_249104 ?auto_249105 ) ) ( not ( = ?auto_249104 ?auto_249106 ) ) ( not ( = ?auto_249104 ?auto_249107 ) ) ( not ( = ?auto_249104 ?auto_249108 ) ) ( not ( = ?auto_249104 ?auto_249109 ) ) ( not ( = ?auto_249104 ?auto_249110 ) ) ( not ( = ?auto_249104 ?auto_249111 ) ) ( not ( = ?auto_249104 ?auto_249112 ) ) ( not ( = ?auto_249104 ?auto_249113 ) ) ( not ( = ?auto_249104 ?auto_249114 ) ) ( not ( = ?auto_249104 ?auto_249115 ) ) ( not ( = ?auto_249105 ?auto_249106 ) ) ( not ( = ?auto_249105 ?auto_249107 ) ) ( not ( = ?auto_249105 ?auto_249108 ) ) ( not ( = ?auto_249105 ?auto_249109 ) ) ( not ( = ?auto_249105 ?auto_249110 ) ) ( not ( = ?auto_249105 ?auto_249111 ) ) ( not ( = ?auto_249105 ?auto_249112 ) ) ( not ( = ?auto_249105 ?auto_249113 ) ) ( not ( = ?auto_249105 ?auto_249114 ) ) ( not ( = ?auto_249105 ?auto_249115 ) ) ( not ( = ?auto_249106 ?auto_249107 ) ) ( not ( = ?auto_249106 ?auto_249108 ) ) ( not ( = ?auto_249106 ?auto_249109 ) ) ( not ( = ?auto_249106 ?auto_249110 ) ) ( not ( = ?auto_249106 ?auto_249111 ) ) ( not ( = ?auto_249106 ?auto_249112 ) ) ( not ( = ?auto_249106 ?auto_249113 ) ) ( not ( = ?auto_249106 ?auto_249114 ) ) ( not ( = ?auto_249106 ?auto_249115 ) ) ( not ( = ?auto_249107 ?auto_249108 ) ) ( not ( = ?auto_249107 ?auto_249109 ) ) ( not ( = ?auto_249107 ?auto_249110 ) ) ( not ( = ?auto_249107 ?auto_249111 ) ) ( not ( = ?auto_249107 ?auto_249112 ) ) ( not ( = ?auto_249107 ?auto_249113 ) ) ( not ( = ?auto_249107 ?auto_249114 ) ) ( not ( = ?auto_249107 ?auto_249115 ) ) ( not ( = ?auto_249108 ?auto_249109 ) ) ( not ( = ?auto_249108 ?auto_249110 ) ) ( not ( = ?auto_249108 ?auto_249111 ) ) ( not ( = ?auto_249108 ?auto_249112 ) ) ( not ( = ?auto_249108 ?auto_249113 ) ) ( not ( = ?auto_249108 ?auto_249114 ) ) ( not ( = ?auto_249108 ?auto_249115 ) ) ( not ( = ?auto_249109 ?auto_249110 ) ) ( not ( = ?auto_249109 ?auto_249111 ) ) ( not ( = ?auto_249109 ?auto_249112 ) ) ( not ( = ?auto_249109 ?auto_249113 ) ) ( not ( = ?auto_249109 ?auto_249114 ) ) ( not ( = ?auto_249109 ?auto_249115 ) ) ( not ( = ?auto_249110 ?auto_249111 ) ) ( not ( = ?auto_249110 ?auto_249112 ) ) ( not ( = ?auto_249110 ?auto_249113 ) ) ( not ( = ?auto_249110 ?auto_249114 ) ) ( not ( = ?auto_249110 ?auto_249115 ) ) ( not ( = ?auto_249111 ?auto_249112 ) ) ( not ( = ?auto_249111 ?auto_249113 ) ) ( not ( = ?auto_249111 ?auto_249114 ) ) ( not ( = ?auto_249111 ?auto_249115 ) ) ( not ( = ?auto_249112 ?auto_249113 ) ) ( not ( = ?auto_249112 ?auto_249114 ) ) ( not ( = ?auto_249112 ?auto_249115 ) ) ( not ( = ?auto_249113 ?auto_249114 ) ) ( not ( = ?auto_249113 ?auto_249115 ) ) ( not ( = ?auto_249114 ?auto_249115 ) ) ( ON ?auto_249113 ?auto_249114 ) ( ON ?auto_249112 ?auto_249113 ) ( ON ?auto_249111 ?auto_249112 ) ( ON ?auto_249110 ?auto_249111 ) ( ON ?auto_249109 ?auto_249110 ) ( CLEAR ?auto_249107 ) ( ON ?auto_249108 ?auto_249109 ) ( CLEAR ?auto_249108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249104 ?auto_249105 ?auto_249106 ?auto_249107 ?auto_249108 )
      ( MAKE-11PILE ?auto_249104 ?auto_249105 ?auto_249106 ?auto_249107 ?auto_249108 ?auto_249109 ?auto_249110 ?auto_249111 ?auto_249112 ?auto_249113 ?auto_249114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249127 - BLOCK
      ?auto_249128 - BLOCK
      ?auto_249129 - BLOCK
      ?auto_249130 - BLOCK
      ?auto_249131 - BLOCK
      ?auto_249132 - BLOCK
      ?auto_249133 - BLOCK
      ?auto_249134 - BLOCK
      ?auto_249135 - BLOCK
      ?auto_249136 - BLOCK
      ?auto_249137 - BLOCK
    )
    :vars
    (
      ?auto_249138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249137 ?auto_249138 ) ( ON-TABLE ?auto_249127 ) ( ON ?auto_249128 ?auto_249127 ) ( ON ?auto_249129 ?auto_249128 ) ( not ( = ?auto_249127 ?auto_249128 ) ) ( not ( = ?auto_249127 ?auto_249129 ) ) ( not ( = ?auto_249127 ?auto_249130 ) ) ( not ( = ?auto_249127 ?auto_249131 ) ) ( not ( = ?auto_249127 ?auto_249132 ) ) ( not ( = ?auto_249127 ?auto_249133 ) ) ( not ( = ?auto_249127 ?auto_249134 ) ) ( not ( = ?auto_249127 ?auto_249135 ) ) ( not ( = ?auto_249127 ?auto_249136 ) ) ( not ( = ?auto_249127 ?auto_249137 ) ) ( not ( = ?auto_249127 ?auto_249138 ) ) ( not ( = ?auto_249128 ?auto_249129 ) ) ( not ( = ?auto_249128 ?auto_249130 ) ) ( not ( = ?auto_249128 ?auto_249131 ) ) ( not ( = ?auto_249128 ?auto_249132 ) ) ( not ( = ?auto_249128 ?auto_249133 ) ) ( not ( = ?auto_249128 ?auto_249134 ) ) ( not ( = ?auto_249128 ?auto_249135 ) ) ( not ( = ?auto_249128 ?auto_249136 ) ) ( not ( = ?auto_249128 ?auto_249137 ) ) ( not ( = ?auto_249128 ?auto_249138 ) ) ( not ( = ?auto_249129 ?auto_249130 ) ) ( not ( = ?auto_249129 ?auto_249131 ) ) ( not ( = ?auto_249129 ?auto_249132 ) ) ( not ( = ?auto_249129 ?auto_249133 ) ) ( not ( = ?auto_249129 ?auto_249134 ) ) ( not ( = ?auto_249129 ?auto_249135 ) ) ( not ( = ?auto_249129 ?auto_249136 ) ) ( not ( = ?auto_249129 ?auto_249137 ) ) ( not ( = ?auto_249129 ?auto_249138 ) ) ( not ( = ?auto_249130 ?auto_249131 ) ) ( not ( = ?auto_249130 ?auto_249132 ) ) ( not ( = ?auto_249130 ?auto_249133 ) ) ( not ( = ?auto_249130 ?auto_249134 ) ) ( not ( = ?auto_249130 ?auto_249135 ) ) ( not ( = ?auto_249130 ?auto_249136 ) ) ( not ( = ?auto_249130 ?auto_249137 ) ) ( not ( = ?auto_249130 ?auto_249138 ) ) ( not ( = ?auto_249131 ?auto_249132 ) ) ( not ( = ?auto_249131 ?auto_249133 ) ) ( not ( = ?auto_249131 ?auto_249134 ) ) ( not ( = ?auto_249131 ?auto_249135 ) ) ( not ( = ?auto_249131 ?auto_249136 ) ) ( not ( = ?auto_249131 ?auto_249137 ) ) ( not ( = ?auto_249131 ?auto_249138 ) ) ( not ( = ?auto_249132 ?auto_249133 ) ) ( not ( = ?auto_249132 ?auto_249134 ) ) ( not ( = ?auto_249132 ?auto_249135 ) ) ( not ( = ?auto_249132 ?auto_249136 ) ) ( not ( = ?auto_249132 ?auto_249137 ) ) ( not ( = ?auto_249132 ?auto_249138 ) ) ( not ( = ?auto_249133 ?auto_249134 ) ) ( not ( = ?auto_249133 ?auto_249135 ) ) ( not ( = ?auto_249133 ?auto_249136 ) ) ( not ( = ?auto_249133 ?auto_249137 ) ) ( not ( = ?auto_249133 ?auto_249138 ) ) ( not ( = ?auto_249134 ?auto_249135 ) ) ( not ( = ?auto_249134 ?auto_249136 ) ) ( not ( = ?auto_249134 ?auto_249137 ) ) ( not ( = ?auto_249134 ?auto_249138 ) ) ( not ( = ?auto_249135 ?auto_249136 ) ) ( not ( = ?auto_249135 ?auto_249137 ) ) ( not ( = ?auto_249135 ?auto_249138 ) ) ( not ( = ?auto_249136 ?auto_249137 ) ) ( not ( = ?auto_249136 ?auto_249138 ) ) ( not ( = ?auto_249137 ?auto_249138 ) ) ( ON ?auto_249136 ?auto_249137 ) ( ON ?auto_249135 ?auto_249136 ) ( ON ?auto_249134 ?auto_249135 ) ( ON ?auto_249133 ?auto_249134 ) ( ON ?auto_249132 ?auto_249133 ) ( ON ?auto_249131 ?auto_249132 ) ( CLEAR ?auto_249129 ) ( ON ?auto_249130 ?auto_249131 ) ( CLEAR ?auto_249130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249127 ?auto_249128 ?auto_249129 ?auto_249130 )
      ( MAKE-11PILE ?auto_249127 ?auto_249128 ?auto_249129 ?auto_249130 ?auto_249131 ?auto_249132 ?auto_249133 ?auto_249134 ?auto_249135 ?auto_249136 ?auto_249137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249150 - BLOCK
      ?auto_249151 - BLOCK
      ?auto_249152 - BLOCK
      ?auto_249153 - BLOCK
      ?auto_249154 - BLOCK
      ?auto_249155 - BLOCK
      ?auto_249156 - BLOCK
      ?auto_249157 - BLOCK
      ?auto_249158 - BLOCK
      ?auto_249159 - BLOCK
      ?auto_249160 - BLOCK
    )
    :vars
    (
      ?auto_249161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249160 ?auto_249161 ) ( ON-TABLE ?auto_249150 ) ( ON ?auto_249151 ?auto_249150 ) ( ON ?auto_249152 ?auto_249151 ) ( not ( = ?auto_249150 ?auto_249151 ) ) ( not ( = ?auto_249150 ?auto_249152 ) ) ( not ( = ?auto_249150 ?auto_249153 ) ) ( not ( = ?auto_249150 ?auto_249154 ) ) ( not ( = ?auto_249150 ?auto_249155 ) ) ( not ( = ?auto_249150 ?auto_249156 ) ) ( not ( = ?auto_249150 ?auto_249157 ) ) ( not ( = ?auto_249150 ?auto_249158 ) ) ( not ( = ?auto_249150 ?auto_249159 ) ) ( not ( = ?auto_249150 ?auto_249160 ) ) ( not ( = ?auto_249150 ?auto_249161 ) ) ( not ( = ?auto_249151 ?auto_249152 ) ) ( not ( = ?auto_249151 ?auto_249153 ) ) ( not ( = ?auto_249151 ?auto_249154 ) ) ( not ( = ?auto_249151 ?auto_249155 ) ) ( not ( = ?auto_249151 ?auto_249156 ) ) ( not ( = ?auto_249151 ?auto_249157 ) ) ( not ( = ?auto_249151 ?auto_249158 ) ) ( not ( = ?auto_249151 ?auto_249159 ) ) ( not ( = ?auto_249151 ?auto_249160 ) ) ( not ( = ?auto_249151 ?auto_249161 ) ) ( not ( = ?auto_249152 ?auto_249153 ) ) ( not ( = ?auto_249152 ?auto_249154 ) ) ( not ( = ?auto_249152 ?auto_249155 ) ) ( not ( = ?auto_249152 ?auto_249156 ) ) ( not ( = ?auto_249152 ?auto_249157 ) ) ( not ( = ?auto_249152 ?auto_249158 ) ) ( not ( = ?auto_249152 ?auto_249159 ) ) ( not ( = ?auto_249152 ?auto_249160 ) ) ( not ( = ?auto_249152 ?auto_249161 ) ) ( not ( = ?auto_249153 ?auto_249154 ) ) ( not ( = ?auto_249153 ?auto_249155 ) ) ( not ( = ?auto_249153 ?auto_249156 ) ) ( not ( = ?auto_249153 ?auto_249157 ) ) ( not ( = ?auto_249153 ?auto_249158 ) ) ( not ( = ?auto_249153 ?auto_249159 ) ) ( not ( = ?auto_249153 ?auto_249160 ) ) ( not ( = ?auto_249153 ?auto_249161 ) ) ( not ( = ?auto_249154 ?auto_249155 ) ) ( not ( = ?auto_249154 ?auto_249156 ) ) ( not ( = ?auto_249154 ?auto_249157 ) ) ( not ( = ?auto_249154 ?auto_249158 ) ) ( not ( = ?auto_249154 ?auto_249159 ) ) ( not ( = ?auto_249154 ?auto_249160 ) ) ( not ( = ?auto_249154 ?auto_249161 ) ) ( not ( = ?auto_249155 ?auto_249156 ) ) ( not ( = ?auto_249155 ?auto_249157 ) ) ( not ( = ?auto_249155 ?auto_249158 ) ) ( not ( = ?auto_249155 ?auto_249159 ) ) ( not ( = ?auto_249155 ?auto_249160 ) ) ( not ( = ?auto_249155 ?auto_249161 ) ) ( not ( = ?auto_249156 ?auto_249157 ) ) ( not ( = ?auto_249156 ?auto_249158 ) ) ( not ( = ?auto_249156 ?auto_249159 ) ) ( not ( = ?auto_249156 ?auto_249160 ) ) ( not ( = ?auto_249156 ?auto_249161 ) ) ( not ( = ?auto_249157 ?auto_249158 ) ) ( not ( = ?auto_249157 ?auto_249159 ) ) ( not ( = ?auto_249157 ?auto_249160 ) ) ( not ( = ?auto_249157 ?auto_249161 ) ) ( not ( = ?auto_249158 ?auto_249159 ) ) ( not ( = ?auto_249158 ?auto_249160 ) ) ( not ( = ?auto_249158 ?auto_249161 ) ) ( not ( = ?auto_249159 ?auto_249160 ) ) ( not ( = ?auto_249159 ?auto_249161 ) ) ( not ( = ?auto_249160 ?auto_249161 ) ) ( ON ?auto_249159 ?auto_249160 ) ( ON ?auto_249158 ?auto_249159 ) ( ON ?auto_249157 ?auto_249158 ) ( ON ?auto_249156 ?auto_249157 ) ( ON ?auto_249155 ?auto_249156 ) ( ON ?auto_249154 ?auto_249155 ) ( CLEAR ?auto_249152 ) ( ON ?auto_249153 ?auto_249154 ) ( CLEAR ?auto_249153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249150 ?auto_249151 ?auto_249152 ?auto_249153 )
      ( MAKE-11PILE ?auto_249150 ?auto_249151 ?auto_249152 ?auto_249153 ?auto_249154 ?auto_249155 ?auto_249156 ?auto_249157 ?auto_249158 ?auto_249159 ?auto_249160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249173 - BLOCK
      ?auto_249174 - BLOCK
      ?auto_249175 - BLOCK
      ?auto_249176 - BLOCK
      ?auto_249177 - BLOCK
      ?auto_249178 - BLOCK
      ?auto_249179 - BLOCK
      ?auto_249180 - BLOCK
      ?auto_249181 - BLOCK
      ?auto_249182 - BLOCK
      ?auto_249183 - BLOCK
    )
    :vars
    (
      ?auto_249184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249183 ?auto_249184 ) ( ON-TABLE ?auto_249173 ) ( ON ?auto_249174 ?auto_249173 ) ( not ( = ?auto_249173 ?auto_249174 ) ) ( not ( = ?auto_249173 ?auto_249175 ) ) ( not ( = ?auto_249173 ?auto_249176 ) ) ( not ( = ?auto_249173 ?auto_249177 ) ) ( not ( = ?auto_249173 ?auto_249178 ) ) ( not ( = ?auto_249173 ?auto_249179 ) ) ( not ( = ?auto_249173 ?auto_249180 ) ) ( not ( = ?auto_249173 ?auto_249181 ) ) ( not ( = ?auto_249173 ?auto_249182 ) ) ( not ( = ?auto_249173 ?auto_249183 ) ) ( not ( = ?auto_249173 ?auto_249184 ) ) ( not ( = ?auto_249174 ?auto_249175 ) ) ( not ( = ?auto_249174 ?auto_249176 ) ) ( not ( = ?auto_249174 ?auto_249177 ) ) ( not ( = ?auto_249174 ?auto_249178 ) ) ( not ( = ?auto_249174 ?auto_249179 ) ) ( not ( = ?auto_249174 ?auto_249180 ) ) ( not ( = ?auto_249174 ?auto_249181 ) ) ( not ( = ?auto_249174 ?auto_249182 ) ) ( not ( = ?auto_249174 ?auto_249183 ) ) ( not ( = ?auto_249174 ?auto_249184 ) ) ( not ( = ?auto_249175 ?auto_249176 ) ) ( not ( = ?auto_249175 ?auto_249177 ) ) ( not ( = ?auto_249175 ?auto_249178 ) ) ( not ( = ?auto_249175 ?auto_249179 ) ) ( not ( = ?auto_249175 ?auto_249180 ) ) ( not ( = ?auto_249175 ?auto_249181 ) ) ( not ( = ?auto_249175 ?auto_249182 ) ) ( not ( = ?auto_249175 ?auto_249183 ) ) ( not ( = ?auto_249175 ?auto_249184 ) ) ( not ( = ?auto_249176 ?auto_249177 ) ) ( not ( = ?auto_249176 ?auto_249178 ) ) ( not ( = ?auto_249176 ?auto_249179 ) ) ( not ( = ?auto_249176 ?auto_249180 ) ) ( not ( = ?auto_249176 ?auto_249181 ) ) ( not ( = ?auto_249176 ?auto_249182 ) ) ( not ( = ?auto_249176 ?auto_249183 ) ) ( not ( = ?auto_249176 ?auto_249184 ) ) ( not ( = ?auto_249177 ?auto_249178 ) ) ( not ( = ?auto_249177 ?auto_249179 ) ) ( not ( = ?auto_249177 ?auto_249180 ) ) ( not ( = ?auto_249177 ?auto_249181 ) ) ( not ( = ?auto_249177 ?auto_249182 ) ) ( not ( = ?auto_249177 ?auto_249183 ) ) ( not ( = ?auto_249177 ?auto_249184 ) ) ( not ( = ?auto_249178 ?auto_249179 ) ) ( not ( = ?auto_249178 ?auto_249180 ) ) ( not ( = ?auto_249178 ?auto_249181 ) ) ( not ( = ?auto_249178 ?auto_249182 ) ) ( not ( = ?auto_249178 ?auto_249183 ) ) ( not ( = ?auto_249178 ?auto_249184 ) ) ( not ( = ?auto_249179 ?auto_249180 ) ) ( not ( = ?auto_249179 ?auto_249181 ) ) ( not ( = ?auto_249179 ?auto_249182 ) ) ( not ( = ?auto_249179 ?auto_249183 ) ) ( not ( = ?auto_249179 ?auto_249184 ) ) ( not ( = ?auto_249180 ?auto_249181 ) ) ( not ( = ?auto_249180 ?auto_249182 ) ) ( not ( = ?auto_249180 ?auto_249183 ) ) ( not ( = ?auto_249180 ?auto_249184 ) ) ( not ( = ?auto_249181 ?auto_249182 ) ) ( not ( = ?auto_249181 ?auto_249183 ) ) ( not ( = ?auto_249181 ?auto_249184 ) ) ( not ( = ?auto_249182 ?auto_249183 ) ) ( not ( = ?auto_249182 ?auto_249184 ) ) ( not ( = ?auto_249183 ?auto_249184 ) ) ( ON ?auto_249182 ?auto_249183 ) ( ON ?auto_249181 ?auto_249182 ) ( ON ?auto_249180 ?auto_249181 ) ( ON ?auto_249179 ?auto_249180 ) ( ON ?auto_249178 ?auto_249179 ) ( ON ?auto_249177 ?auto_249178 ) ( ON ?auto_249176 ?auto_249177 ) ( CLEAR ?auto_249174 ) ( ON ?auto_249175 ?auto_249176 ) ( CLEAR ?auto_249175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249173 ?auto_249174 ?auto_249175 )
      ( MAKE-11PILE ?auto_249173 ?auto_249174 ?auto_249175 ?auto_249176 ?auto_249177 ?auto_249178 ?auto_249179 ?auto_249180 ?auto_249181 ?auto_249182 ?auto_249183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249196 - BLOCK
      ?auto_249197 - BLOCK
      ?auto_249198 - BLOCK
      ?auto_249199 - BLOCK
      ?auto_249200 - BLOCK
      ?auto_249201 - BLOCK
      ?auto_249202 - BLOCK
      ?auto_249203 - BLOCK
      ?auto_249204 - BLOCK
      ?auto_249205 - BLOCK
      ?auto_249206 - BLOCK
    )
    :vars
    (
      ?auto_249207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249206 ?auto_249207 ) ( ON-TABLE ?auto_249196 ) ( ON ?auto_249197 ?auto_249196 ) ( not ( = ?auto_249196 ?auto_249197 ) ) ( not ( = ?auto_249196 ?auto_249198 ) ) ( not ( = ?auto_249196 ?auto_249199 ) ) ( not ( = ?auto_249196 ?auto_249200 ) ) ( not ( = ?auto_249196 ?auto_249201 ) ) ( not ( = ?auto_249196 ?auto_249202 ) ) ( not ( = ?auto_249196 ?auto_249203 ) ) ( not ( = ?auto_249196 ?auto_249204 ) ) ( not ( = ?auto_249196 ?auto_249205 ) ) ( not ( = ?auto_249196 ?auto_249206 ) ) ( not ( = ?auto_249196 ?auto_249207 ) ) ( not ( = ?auto_249197 ?auto_249198 ) ) ( not ( = ?auto_249197 ?auto_249199 ) ) ( not ( = ?auto_249197 ?auto_249200 ) ) ( not ( = ?auto_249197 ?auto_249201 ) ) ( not ( = ?auto_249197 ?auto_249202 ) ) ( not ( = ?auto_249197 ?auto_249203 ) ) ( not ( = ?auto_249197 ?auto_249204 ) ) ( not ( = ?auto_249197 ?auto_249205 ) ) ( not ( = ?auto_249197 ?auto_249206 ) ) ( not ( = ?auto_249197 ?auto_249207 ) ) ( not ( = ?auto_249198 ?auto_249199 ) ) ( not ( = ?auto_249198 ?auto_249200 ) ) ( not ( = ?auto_249198 ?auto_249201 ) ) ( not ( = ?auto_249198 ?auto_249202 ) ) ( not ( = ?auto_249198 ?auto_249203 ) ) ( not ( = ?auto_249198 ?auto_249204 ) ) ( not ( = ?auto_249198 ?auto_249205 ) ) ( not ( = ?auto_249198 ?auto_249206 ) ) ( not ( = ?auto_249198 ?auto_249207 ) ) ( not ( = ?auto_249199 ?auto_249200 ) ) ( not ( = ?auto_249199 ?auto_249201 ) ) ( not ( = ?auto_249199 ?auto_249202 ) ) ( not ( = ?auto_249199 ?auto_249203 ) ) ( not ( = ?auto_249199 ?auto_249204 ) ) ( not ( = ?auto_249199 ?auto_249205 ) ) ( not ( = ?auto_249199 ?auto_249206 ) ) ( not ( = ?auto_249199 ?auto_249207 ) ) ( not ( = ?auto_249200 ?auto_249201 ) ) ( not ( = ?auto_249200 ?auto_249202 ) ) ( not ( = ?auto_249200 ?auto_249203 ) ) ( not ( = ?auto_249200 ?auto_249204 ) ) ( not ( = ?auto_249200 ?auto_249205 ) ) ( not ( = ?auto_249200 ?auto_249206 ) ) ( not ( = ?auto_249200 ?auto_249207 ) ) ( not ( = ?auto_249201 ?auto_249202 ) ) ( not ( = ?auto_249201 ?auto_249203 ) ) ( not ( = ?auto_249201 ?auto_249204 ) ) ( not ( = ?auto_249201 ?auto_249205 ) ) ( not ( = ?auto_249201 ?auto_249206 ) ) ( not ( = ?auto_249201 ?auto_249207 ) ) ( not ( = ?auto_249202 ?auto_249203 ) ) ( not ( = ?auto_249202 ?auto_249204 ) ) ( not ( = ?auto_249202 ?auto_249205 ) ) ( not ( = ?auto_249202 ?auto_249206 ) ) ( not ( = ?auto_249202 ?auto_249207 ) ) ( not ( = ?auto_249203 ?auto_249204 ) ) ( not ( = ?auto_249203 ?auto_249205 ) ) ( not ( = ?auto_249203 ?auto_249206 ) ) ( not ( = ?auto_249203 ?auto_249207 ) ) ( not ( = ?auto_249204 ?auto_249205 ) ) ( not ( = ?auto_249204 ?auto_249206 ) ) ( not ( = ?auto_249204 ?auto_249207 ) ) ( not ( = ?auto_249205 ?auto_249206 ) ) ( not ( = ?auto_249205 ?auto_249207 ) ) ( not ( = ?auto_249206 ?auto_249207 ) ) ( ON ?auto_249205 ?auto_249206 ) ( ON ?auto_249204 ?auto_249205 ) ( ON ?auto_249203 ?auto_249204 ) ( ON ?auto_249202 ?auto_249203 ) ( ON ?auto_249201 ?auto_249202 ) ( ON ?auto_249200 ?auto_249201 ) ( ON ?auto_249199 ?auto_249200 ) ( CLEAR ?auto_249197 ) ( ON ?auto_249198 ?auto_249199 ) ( CLEAR ?auto_249198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249196 ?auto_249197 ?auto_249198 )
      ( MAKE-11PILE ?auto_249196 ?auto_249197 ?auto_249198 ?auto_249199 ?auto_249200 ?auto_249201 ?auto_249202 ?auto_249203 ?auto_249204 ?auto_249205 ?auto_249206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249219 - BLOCK
      ?auto_249220 - BLOCK
      ?auto_249221 - BLOCK
      ?auto_249222 - BLOCK
      ?auto_249223 - BLOCK
      ?auto_249224 - BLOCK
      ?auto_249225 - BLOCK
      ?auto_249226 - BLOCK
      ?auto_249227 - BLOCK
      ?auto_249228 - BLOCK
      ?auto_249229 - BLOCK
    )
    :vars
    (
      ?auto_249230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249229 ?auto_249230 ) ( ON-TABLE ?auto_249219 ) ( not ( = ?auto_249219 ?auto_249220 ) ) ( not ( = ?auto_249219 ?auto_249221 ) ) ( not ( = ?auto_249219 ?auto_249222 ) ) ( not ( = ?auto_249219 ?auto_249223 ) ) ( not ( = ?auto_249219 ?auto_249224 ) ) ( not ( = ?auto_249219 ?auto_249225 ) ) ( not ( = ?auto_249219 ?auto_249226 ) ) ( not ( = ?auto_249219 ?auto_249227 ) ) ( not ( = ?auto_249219 ?auto_249228 ) ) ( not ( = ?auto_249219 ?auto_249229 ) ) ( not ( = ?auto_249219 ?auto_249230 ) ) ( not ( = ?auto_249220 ?auto_249221 ) ) ( not ( = ?auto_249220 ?auto_249222 ) ) ( not ( = ?auto_249220 ?auto_249223 ) ) ( not ( = ?auto_249220 ?auto_249224 ) ) ( not ( = ?auto_249220 ?auto_249225 ) ) ( not ( = ?auto_249220 ?auto_249226 ) ) ( not ( = ?auto_249220 ?auto_249227 ) ) ( not ( = ?auto_249220 ?auto_249228 ) ) ( not ( = ?auto_249220 ?auto_249229 ) ) ( not ( = ?auto_249220 ?auto_249230 ) ) ( not ( = ?auto_249221 ?auto_249222 ) ) ( not ( = ?auto_249221 ?auto_249223 ) ) ( not ( = ?auto_249221 ?auto_249224 ) ) ( not ( = ?auto_249221 ?auto_249225 ) ) ( not ( = ?auto_249221 ?auto_249226 ) ) ( not ( = ?auto_249221 ?auto_249227 ) ) ( not ( = ?auto_249221 ?auto_249228 ) ) ( not ( = ?auto_249221 ?auto_249229 ) ) ( not ( = ?auto_249221 ?auto_249230 ) ) ( not ( = ?auto_249222 ?auto_249223 ) ) ( not ( = ?auto_249222 ?auto_249224 ) ) ( not ( = ?auto_249222 ?auto_249225 ) ) ( not ( = ?auto_249222 ?auto_249226 ) ) ( not ( = ?auto_249222 ?auto_249227 ) ) ( not ( = ?auto_249222 ?auto_249228 ) ) ( not ( = ?auto_249222 ?auto_249229 ) ) ( not ( = ?auto_249222 ?auto_249230 ) ) ( not ( = ?auto_249223 ?auto_249224 ) ) ( not ( = ?auto_249223 ?auto_249225 ) ) ( not ( = ?auto_249223 ?auto_249226 ) ) ( not ( = ?auto_249223 ?auto_249227 ) ) ( not ( = ?auto_249223 ?auto_249228 ) ) ( not ( = ?auto_249223 ?auto_249229 ) ) ( not ( = ?auto_249223 ?auto_249230 ) ) ( not ( = ?auto_249224 ?auto_249225 ) ) ( not ( = ?auto_249224 ?auto_249226 ) ) ( not ( = ?auto_249224 ?auto_249227 ) ) ( not ( = ?auto_249224 ?auto_249228 ) ) ( not ( = ?auto_249224 ?auto_249229 ) ) ( not ( = ?auto_249224 ?auto_249230 ) ) ( not ( = ?auto_249225 ?auto_249226 ) ) ( not ( = ?auto_249225 ?auto_249227 ) ) ( not ( = ?auto_249225 ?auto_249228 ) ) ( not ( = ?auto_249225 ?auto_249229 ) ) ( not ( = ?auto_249225 ?auto_249230 ) ) ( not ( = ?auto_249226 ?auto_249227 ) ) ( not ( = ?auto_249226 ?auto_249228 ) ) ( not ( = ?auto_249226 ?auto_249229 ) ) ( not ( = ?auto_249226 ?auto_249230 ) ) ( not ( = ?auto_249227 ?auto_249228 ) ) ( not ( = ?auto_249227 ?auto_249229 ) ) ( not ( = ?auto_249227 ?auto_249230 ) ) ( not ( = ?auto_249228 ?auto_249229 ) ) ( not ( = ?auto_249228 ?auto_249230 ) ) ( not ( = ?auto_249229 ?auto_249230 ) ) ( ON ?auto_249228 ?auto_249229 ) ( ON ?auto_249227 ?auto_249228 ) ( ON ?auto_249226 ?auto_249227 ) ( ON ?auto_249225 ?auto_249226 ) ( ON ?auto_249224 ?auto_249225 ) ( ON ?auto_249223 ?auto_249224 ) ( ON ?auto_249222 ?auto_249223 ) ( ON ?auto_249221 ?auto_249222 ) ( CLEAR ?auto_249219 ) ( ON ?auto_249220 ?auto_249221 ) ( CLEAR ?auto_249220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249219 ?auto_249220 )
      ( MAKE-11PILE ?auto_249219 ?auto_249220 ?auto_249221 ?auto_249222 ?auto_249223 ?auto_249224 ?auto_249225 ?auto_249226 ?auto_249227 ?auto_249228 ?auto_249229 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249242 - BLOCK
      ?auto_249243 - BLOCK
      ?auto_249244 - BLOCK
      ?auto_249245 - BLOCK
      ?auto_249246 - BLOCK
      ?auto_249247 - BLOCK
      ?auto_249248 - BLOCK
      ?auto_249249 - BLOCK
      ?auto_249250 - BLOCK
      ?auto_249251 - BLOCK
      ?auto_249252 - BLOCK
    )
    :vars
    (
      ?auto_249253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249252 ?auto_249253 ) ( ON-TABLE ?auto_249242 ) ( not ( = ?auto_249242 ?auto_249243 ) ) ( not ( = ?auto_249242 ?auto_249244 ) ) ( not ( = ?auto_249242 ?auto_249245 ) ) ( not ( = ?auto_249242 ?auto_249246 ) ) ( not ( = ?auto_249242 ?auto_249247 ) ) ( not ( = ?auto_249242 ?auto_249248 ) ) ( not ( = ?auto_249242 ?auto_249249 ) ) ( not ( = ?auto_249242 ?auto_249250 ) ) ( not ( = ?auto_249242 ?auto_249251 ) ) ( not ( = ?auto_249242 ?auto_249252 ) ) ( not ( = ?auto_249242 ?auto_249253 ) ) ( not ( = ?auto_249243 ?auto_249244 ) ) ( not ( = ?auto_249243 ?auto_249245 ) ) ( not ( = ?auto_249243 ?auto_249246 ) ) ( not ( = ?auto_249243 ?auto_249247 ) ) ( not ( = ?auto_249243 ?auto_249248 ) ) ( not ( = ?auto_249243 ?auto_249249 ) ) ( not ( = ?auto_249243 ?auto_249250 ) ) ( not ( = ?auto_249243 ?auto_249251 ) ) ( not ( = ?auto_249243 ?auto_249252 ) ) ( not ( = ?auto_249243 ?auto_249253 ) ) ( not ( = ?auto_249244 ?auto_249245 ) ) ( not ( = ?auto_249244 ?auto_249246 ) ) ( not ( = ?auto_249244 ?auto_249247 ) ) ( not ( = ?auto_249244 ?auto_249248 ) ) ( not ( = ?auto_249244 ?auto_249249 ) ) ( not ( = ?auto_249244 ?auto_249250 ) ) ( not ( = ?auto_249244 ?auto_249251 ) ) ( not ( = ?auto_249244 ?auto_249252 ) ) ( not ( = ?auto_249244 ?auto_249253 ) ) ( not ( = ?auto_249245 ?auto_249246 ) ) ( not ( = ?auto_249245 ?auto_249247 ) ) ( not ( = ?auto_249245 ?auto_249248 ) ) ( not ( = ?auto_249245 ?auto_249249 ) ) ( not ( = ?auto_249245 ?auto_249250 ) ) ( not ( = ?auto_249245 ?auto_249251 ) ) ( not ( = ?auto_249245 ?auto_249252 ) ) ( not ( = ?auto_249245 ?auto_249253 ) ) ( not ( = ?auto_249246 ?auto_249247 ) ) ( not ( = ?auto_249246 ?auto_249248 ) ) ( not ( = ?auto_249246 ?auto_249249 ) ) ( not ( = ?auto_249246 ?auto_249250 ) ) ( not ( = ?auto_249246 ?auto_249251 ) ) ( not ( = ?auto_249246 ?auto_249252 ) ) ( not ( = ?auto_249246 ?auto_249253 ) ) ( not ( = ?auto_249247 ?auto_249248 ) ) ( not ( = ?auto_249247 ?auto_249249 ) ) ( not ( = ?auto_249247 ?auto_249250 ) ) ( not ( = ?auto_249247 ?auto_249251 ) ) ( not ( = ?auto_249247 ?auto_249252 ) ) ( not ( = ?auto_249247 ?auto_249253 ) ) ( not ( = ?auto_249248 ?auto_249249 ) ) ( not ( = ?auto_249248 ?auto_249250 ) ) ( not ( = ?auto_249248 ?auto_249251 ) ) ( not ( = ?auto_249248 ?auto_249252 ) ) ( not ( = ?auto_249248 ?auto_249253 ) ) ( not ( = ?auto_249249 ?auto_249250 ) ) ( not ( = ?auto_249249 ?auto_249251 ) ) ( not ( = ?auto_249249 ?auto_249252 ) ) ( not ( = ?auto_249249 ?auto_249253 ) ) ( not ( = ?auto_249250 ?auto_249251 ) ) ( not ( = ?auto_249250 ?auto_249252 ) ) ( not ( = ?auto_249250 ?auto_249253 ) ) ( not ( = ?auto_249251 ?auto_249252 ) ) ( not ( = ?auto_249251 ?auto_249253 ) ) ( not ( = ?auto_249252 ?auto_249253 ) ) ( ON ?auto_249251 ?auto_249252 ) ( ON ?auto_249250 ?auto_249251 ) ( ON ?auto_249249 ?auto_249250 ) ( ON ?auto_249248 ?auto_249249 ) ( ON ?auto_249247 ?auto_249248 ) ( ON ?auto_249246 ?auto_249247 ) ( ON ?auto_249245 ?auto_249246 ) ( ON ?auto_249244 ?auto_249245 ) ( CLEAR ?auto_249242 ) ( ON ?auto_249243 ?auto_249244 ) ( CLEAR ?auto_249243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249242 ?auto_249243 )
      ( MAKE-11PILE ?auto_249242 ?auto_249243 ?auto_249244 ?auto_249245 ?auto_249246 ?auto_249247 ?auto_249248 ?auto_249249 ?auto_249250 ?auto_249251 ?auto_249252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249265 - BLOCK
      ?auto_249266 - BLOCK
      ?auto_249267 - BLOCK
      ?auto_249268 - BLOCK
      ?auto_249269 - BLOCK
      ?auto_249270 - BLOCK
      ?auto_249271 - BLOCK
      ?auto_249272 - BLOCK
      ?auto_249273 - BLOCK
      ?auto_249274 - BLOCK
      ?auto_249275 - BLOCK
    )
    :vars
    (
      ?auto_249276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249275 ?auto_249276 ) ( not ( = ?auto_249265 ?auto_249266 ) ) ( not ( = ?auto_249265 ?auto_249267 ) ) ( not ( = ?auto_249265 ?auto_249268 ) ) ( not ( = ?auto_249265 ?auto_249269 ) ) ( not ( = ?auto_249265 ?auto_249270 ) ) ( not ( = ?auto_249265 ?auto_249271 ) ) ( not ( = ?auto_249265 ?auto_249272 ) ) ( not ( = ?auto_249265 ?auto_249273 ) ) ( not ( = ?auto_249265 ?auto_249274 ) ) ( not ( = ?auto_249265 ?auto_249275 ) ) ( not ( = ?auto_249265 ?auto_249276 ) ) ( not ( = ?auto_249266 ?auto_249267 ) ) ( not ( = ?auto_249266 ?auto_249268 ) ) ( not ( = ?auto_249266 ?auto_249269 ) ) ( not ( = ?auto_249266 ?auto_249270 ) ) ( not ( = ?auto_249266 ?auto_249271 ) ) ( not ( = ?auto_249266 ?auto_249272 ) ) ( not ( = ?auto_249266 ?auto_249273 ) ) ( not ( = ?auto_249266 ?auto_249274 ) ) ( not ( = ?auto_249266 ?auto_249275 ) ) ( not ( = ?auto_249266 ?auto_249276 ) ) ( not ( = ?auto_249267 ?auto_249268 ) ) ( not ( = ?auto_249267 ?auto_249269 ) ) ( not ( = ?auto_249267 ?auto_249270 ) ) ( not ( = ?auto_249267 ?auto_249271 ) ) ( not ( = ?auto_249267 ?auto_249272 ) ) ( not ( = ?auto_249267 ?auto_249273 ) ) ( not ( = ?auto_249267 ?auto_249274 ) ) ( not ( = ?auto_249267 ?auto_249275 ) ) ( not ( = ?auto_249267 ?auto_249276 ) ) ( not ( = ?auto_249268 ?auto_249269 ) ) ( not ( = ?auto_249268 ?auto_249270 ) ) ( not ( = ?auto_249268 ?auto_249271 ) ) ( not ( = ?auto_249268 ?auto_249272 ) ) ( not ( = ?auto_249268 ?auto_249273 ) ) ( not ( = ?auto_249268 ?auto_249274 ) ) ( not ( = ?auto_249268 ?auto_249275 ) ) ( not ( = ?auto_249268 ?auto_249276 ) ) ( not ( = ?auto_249269 ?auto_249270 ) ) ( not ( = ?auto_249269 ?auto_249271 ) ) ( not ( = ?auto_249269 ?auto_249272 ) ) ( not ( = ?auto_249269 ?auto_249273 ) ) ( not ( = ?auto_249269 ?auto_249274 ) ) ( not ( = ?auto_249269 ?auto_249275 ) ) ( not ( = ?auto_249269 ?auto_249276 ) ) ( not ( = ?auto_249270 ?auto_249271 ) ) ( not ( = ?auto_249270 ?auto_249272 ) ) ( not ( = ?auto_249270 ?auto_249273 ) ) ( not ( = ?auto_249270 ?auto_249274 ) ) ( not ( = ?auto_249270 ?auto_249275 ) ) ( not ( = ?auto_249270 ?auto_249276 ) ) ( not ( = ?auto_249271 ?auto_249272 ) ) ( not ( = ?auto_249271 ?auto_249273 ) ) ( not ( = ?auto_249271 ?auto_249274 ) ) ( not ( = ?auto_249271 ?auto_249275 ) ) ( not ( = ?auto_249271 ?auto_249276 ) ) ( not ( = ?auto_249272 ?auto_249273 ) ) ( not ( = ?auto_249272 ?auto_249274 ) ) ( not ( = ?auto_249272 ?auto_249275 ) ) ( not ( = ?auto_249272 ?auto_249276 ) ) ( not ( = ?auto_249273 ?auto_249274 ) ) ( not ( = ?auto_249273 ?auto_249275 ) ) ( not ( = ?auto_249273 ?auto_249276 ) ) ( not ( = ?auto_249274 ?auto_249275 ) ) ( not ( = ?auto_249274 ?auto_249276 ) ) ( not ( = ?auto_249275 ?auto_249276 ) ) ( ON ?auto_249274 ?auto_249275 ) ( ON ?auto_249273 ?auto_249274 ) ( ON ?auto_249272 ?auto_249273 ) ( ON ?auto_249271 ?auto_249272 ) ( ON ?auto_249270 ?auto_249271 ) ( ON ?auto_249269 ?auto_249270 ) ( ON ?auto_249268 ?auto_249269 ) ( ON ?auto_249267 ?auto_249268 ) ( ON ?auto_249266 ?auto_249267 ) ( ON ?auto_249265 ?auto_249266 ) ( CLEAR ?auto_249265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249265 )
      ( MAKE-11PILE ?auto_249265 ?auto_249266 ?auto_249267 ?auto_249268 ?auto_249269 ?auto_249270 ?auto_249271 ?auto_249272 ?auto_249273 ?auto_249274 ?auto_249275 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_249288 - BLOCK
      ?auto_249289 - BLOCK
      ?auto_249290 - BLOCK
      ?auto_249291 - BLOCK
      ?auto_249292 - BLOCK
      ?auto_249293 - BLOCK
      ?auto_249294 - BLOCK
      ?auto_249295 - BLOCK
      ?auto_249296 - BLOCK
      ?auto_249297 - BLOCK
      ?auto_249298 - BLOCK
    )
    :vars
    (
      ?auto_249299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249298 ?auto_249299 ) ( not ( = ?auto_249288 ?auto_249289 ) ) ( not ( = ?auto_249288 ?auto_249290 ) ) ( not ( = ?auto_249288 ?auto_249291 ) ) ( not ( = ?auto_249288 ?auto_249292 ) ) ( not ( = ?auto_249288 ?auto_249293 ) ) ( not ( = ?auto_249288 ?auto_249294 ) ) ( not ( = ?auto_249288 ?auto_249295 ) ) ( not ( = ?auto_249288 ?auto_249296 ) ) ( not ( = ?auto_249288 ?auto_249297 ) ) ( not ( = ?auto_249288 ?auto_249298 ) ) ( not ( = ?auto_249288 ?auto_249299 ) ) ( not ( = ?auto_249289 ?auto_249290 ) ) ( not ( = ?auto_249289 ?auto_249291 ) ) ( not ( = ?auto_249289 ?auto_249292 ) ) ( not ( = ?auto_249289 ?auto_249293 ) ) ( not ( = ?auto_249289 ?auto_249294 ) ) ( not ( = ?auto_249289 ?auto_249295 ) ) ( not ( = ?auto_249289 ?auto_249296 ) ) ( not ( = ?auto_249289 ?auto_249297 ) ) ( not ( = ?auto_249289 ?auto_249298 ) ) ( not ( = ?auto_249289 ?auto_249299 ) ) ( not ( = ?auto_249290 ?auto_249291 ) ) ( not ( = ?auto_249290 ?auto_249292 ) ) ( not ( = ?auto_249290 ?auto_249293 ) ) ( not ( = ?auto_249290 ?auto_249294 ) ) ( not ( = ?auto_249290 ?auto_249295 ) ) ( not ( = ?auto_249290 ?auto_249296 ) ) ( not ( = ?auto_249290 ?auto_249297 ) ) ( not ( = ?auto_249290 ?auto_249298 ) ) ( not ( = ?auto_249290 ?auto_249299 ) ) ( not ( = ?auto_249291 ?auto_249292 ) ) ( not ( = ?auto_249291 ?auto_249293 ) ) ( not ( = ?auto_249291 ?auto_249294 ) ) ( not ( = ?auto_249291 ?auto_249295 ) ) ( not ( = ?auto_249291 ?auto_249296 ) ) ( not ( = ?auto_249291 ?auto_249297 ) ) ( not ( = ?auto_249291 ?auto_249298 ) ) ( not ( = ?auto_249291 ?auto_249299 ) ) ( not ( = ?auto_249292 ?auto_249293 ) ) ( not ( = ?auto_249292 ?auto_249294 ) ) ( not ( = ?auto_249292 ?auto_249295 ) ) ( not ( = ?auto_249292 ?auto_249296 ) ) ( not ( = ?auto_249292 ?auto_249297 ) ) ( not ( = ?auto_249292 ?auto_249298 ) ) ( not ( = ?auto_249292 ?auto_249299 ) ) ( not ( = ?auto_249293 ?auto_249294 ) ) ( not ( = ?auto_249293 ?auto_249295 ) ) ( not ( = ?auto_249293 ?auto_249296 ) ) ( not ( = ?auto_249293 ?auto_249297 ) ) ( not ( = ?auto_249293 ?auto_249298 ) ) ( not ( = ?auto_249293 ?auto_249299 ) ) ( not ( = ?auto_249294 ?auto_249295 ) ) ( not ( = ?auto_249294 ?auto_249296 ) ) ( not ( = ?auto_249294 ?auto_249297 ) ) ( not ( = ?auto_249294 ?auto_249298 ) ) ( not ( = ?auto_249294 ?auto_249299 ) ) ( not ( = ?auto_249295 ?auto_249296 ) ) ( not ( = ?auto_249295 ?auto_249297 ) ) ( not ( = ?auto_249295 ?auto_249298 ) ) ( not ( = ?auto_249295 ?auto_249299 ) ) ( not ( = ?auto_249296 ?auto_249297 ) ) ( not ( = ?auto_249296 ?auto_249298 ) ) ( not ( = ?auto_249296 ?auto_249299 ) ) ( not ( = ?auto_249297 ?auto_249298 ) ) ( not ( = ?auto_249297 ?auto_249299 ) ) ( not ( = ?auto_249298 ?auto_249299 ) ) ( ON ?auto_249297 ?auto_249298 ) ( ON ?auto_249296 ?auto_249297 ) ( ON ?auto_249295 ?auto_249296 ) ( ON ?auto_249294 ?auto_249295 ) ( ON ?auto_249293 ?auto_249294 ) ( ON ?auto_249292 ?auto_249293 ) ( ON ?auto_249291 ?auto_249292 ) ( ON ?auto_249290 ?auto_249291 ) ( ON ?auto_249289 ?auto_249290 ) ( ON ?auto_249288 ?auto_249289 ) ( CLEAR ?auto_249288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249288 )
      ( MAKE-11PILE ?auto_249288 ?auto_249289 ?auto_249290 ?auto_249291 ?auto_249292 ?auto_249293 ?auto_249294 ?auto_249295 ?auto_249296 ?auto_249297 ?auto_249298 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249312 - BLOCK
      ?auto_249313 - BLOCK
      ?auto_249314 - BLOCK
      ?auto_249315 - BLOCK
      ?auto_249316 - BLOCK
      ?auto_249317 - BLOCK
      ?auto_249318 - BLOCK
      ?auto_249319 - BLOCK
      ?auto_249320 - BLOCK
      ?auto_249321 - BLOCK
      ?auto_249322 - BLOCK
      ?auto_249323 - BLOCK
    )
    :vars
    (
      ?auto_249324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249322 ) ( ON ?auto_249323 ?auto_249324 ) ( CLEAR ?auto_249323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249312 ) ( ON ?auto_249313 ?auto_249312 ) ( ON ?auto_249314 ?auto_249313 ) ( ON ?auto_249315 ?auto_249314 ) ( ON ?auto_249316 ?auto_249315 ) ( ON ?auto_249317 ?auto_249316 ) ( ON ?auto_249318 ?auto_249317 ) ( ON ?auto_249319 ?auto_249318 ) ( ON ?auto_249320 ?auto_249319 ) ( ON ?auto_249321 ?auto_249320 ) ( ON ?auto_249322 ?auto_249321 ) ( not ( = ?auto_249312 ?auto_249313 ) ) ( not ( = ?auto_249312 ?auto_249314 ) ) ( not ( = ?auto_249312 ?auto_249315 ) ) ( not ( = ?auto_249312 ?auto_249316 ) ) ( not ( = ?auto_249312 ?auto_249317 ) ) ( not ( = ?auto_249312 ?auto_249318 ) ) ( not ( = ?auto_249312 ?auto_249319 ) ) ( not ( = ?auto_249312 ?auto_249320 ) ) ( not ( = ?auto_249312 ?auto_249321 ) ) ( not ( = ?auto_249312 ?auto_249322 ) ) ( not ( = ?auto_249312 ?auto_249323 ) ) ( not ( = ?auto_249312 ?auto_249324 ) ) ( not ( = ?auto_249313 ?auto_249314 ) ) ( not ( = ?auto_249313 ?auto_249315 ) ) ( not ( = ?auto_249313 ?auto_249316 ) ) ( not ( = ?auto_249313 ?auto_249317 ) ) ( not ( = ?auto_249313 ?auto_249318 ) ) ( not ( = ?auto_249313 ?auto_249319 ) ) ( not ( = ?auto_249313 ?auto_249320 ) ) ( not ( = ?auto_249313 ?auto_249321 ) ) ( not ( = ?auto_249313 ?auto_249322 ) ) ( not ( = ?auto_249313 ?auto_249323 ) ) ( not ( = ?auto_249313 ?auto_249324 ) ) ( not ( = ?auto_249314 ?auto_249315 ) ) ( not ( = ?auto_249314 ?auto_249316 ) ) ( not ( = ?auto_249314 ?auto_249317 ) ) ( not ( = ?auto_249314 ?auto_249318 ) ) ( not ( = ?auto_249314 ?auto_249319 ) ) ( not ( = ?auto_249314 ?auto_249320 ) ) ( not ( = ?auto_249314 ?auto_249321 ) ) ( not ( = ?auto_249314 ?auto_249322 ) ) ( not ( = ?auto_249314 ?auto_249323 ) ) ( not ( = ?auto_249314 ?auto_249324 ) ) ( not ( = ?auto_249315 ?auto_249316 ) ) ( not ( = ?auto_249315 ?auto_249317 ) ) ( not ( = ?auto_249315 ?auto_249318 ) ) ( not ( = ?auto_249315 ?auto_249319 ) ) ( not ( = ?auto_249315 ?auto_249320 ) ) ( not ( = ?auto_249315 ?auto_249321 ) ) ( not ( = ?auto_249315 ?auto_249322 ) ) ( not ( = ?auto_249315 ?auto_249323 ) ) ( not ( = ?auto_249315 ?auto_249324 ) ) ( not ( = ?auto_249316 ?auto_249317 ) ) ( not ( = ?auto_249316 ?auto_249318 ) ) ( not ( = ?auto_249316 ?auto_249319 ) ) ( not ( = ?auto_249316 ?auto_249320 ) ) ( not ( = ?auto_249316 ?auto_249321 ) ) ( not ( = ?auto_249316 ?auto_249322 ) ) ( not ( = ?auto_249316 ?auto_249323 ) ) ( not ( = ?auto_249316 ?auto_249324 ) ) ( not ( = ?auto_249317 ?auto_249318 ) ) ( not ( = ?auto_249317 ?auto_249319 ) ) ( not ( = ?auto_249317 ?auto_249320 ) ) ( not ( = ?auto_249317 ?auto_249321 ) ) ( not ( = ?auto_249317 ?auto_249322 ) ) ( not ( = ?auto_249317 ?auto_249323 ) ) ( not ( = ?auto_249317 ?auto_249324 ) ) ( not ( = ?auto_249318 ?auto_249319 ) ) ( not ( = ?auto_249318 ?auto_249320 ) ) ( not ( = ?auto_249318 ?auto_249321 ) ) ( not ( = ?auto_249318 ?auto_249322 ) ) ( not ( = ?auto_249318 ?auto_249323 ) ) ( not ( = ?auto_249318 ?auto_249324 ) ) ( not ( = ?auto_249319 ?auto_249320 ) ) ( not ( = ?auto_249319 ?auto_249321 ) ) ( not ( = ?auto_249319 ?auto_249322 ) ) ( not ( = ?auto_249319 ?auto_249323 ) ) ( not ( = ?auto_249319 ?auto_249324 ) ) ( not ( = ?auto_249320 ?auto_249321 ) ) ( not ( = ?auto_249320 ?auto_249322 ) ) ( not ( = ?auto_249320 ?auto_249323 ) ) ( not ( = ?auto_249320 ?auto_249324 ) ) ( not ( = ?auto_249321 ?auto_249322 ) ) ( not ( = ?auto_249321 ?auto_249323 ) ) ( not ( = ?auto_249321 ?auto_249324 ) ) ( not ( = ?auto_249322 ?auto_249323 ) ) ( not ( = ?auto_249322 ?auto_249324 ) ) ( not ( = ?auto_249323 ?auto_249324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_249323 ?auto_249324 )
      ( !STACK ?auto_249323 ?auto_249322 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249337 - BLOCK
      ?auto_249338 - BLOCK
      ?auto_249339 - BLOCK
      ?auto_249340 - BLOCK
      ?auto_249341 - BLOCK
      ?auto_249342 - BLOCK
      ?auto_249343 - BLOCK
      ?auto_249344 - BLOCK
      ?auto_249345 - BLOCK
      ?auto_249346 - BLOCK
      ?auto_249347 - BLOCK
      ?auto_249348 - BLOCK
    )
    :vars
    (
      ?auto_249349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249347 ) ( ON ?auto_249348 ?auto_249349 ) ( CLEAR ?auto_249348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249337 ) ( ON ?auto_249338 ?auto_249337 ) ( ON ?auto_249339 ?auto_249338 ) ( ON ?auto_249340 ?auto_249339 ) ( ON ?auto_249341 ?auto_249340 ) ( ON ?auto_249342 ?auto_249341 ) ( ON ?auto_249343 ?auto_249342 ) ( ON ?auto_249344 ?auto_249343 ) ( ON ?auto_249345 ?auto_249344 ) ( ON ?auto_249346 ?auto_249345 ) ( ON ?auto_249347 ?auto_249346 ) ( not ( = ?auto_249337 ?auto_249338 ) ) ( not ( = ?auto_249337 ?auto_249339 ) ) ( not ( = ?auto_249337 ?auto_249340 ) ) ( not ( = ?auto_249337 ?auto_249341 ) ) ( not ( = ?auto_249337 ?auto_249342 ) ) ( not ( = ?auto_249337 ?auto_249343 ) ) ( not ( = ?auto_249337 ?auto_249344 ) ) ( not ( = ?auto_249337 ?auto_249345 ) ) ( not ( = ?auto_249337 ?auto_249346 ) ) ( not ( = ?auto_249337 ?auto_249347 ) ) ( not ( = ?auto_249337 ?auto_249348 ) ) ( not ( = ?auto_249337 ?auto_249349 ) ) ( not ( = ?auto_249338 ?auto_249339 ) ) ( not ( = ?auto_249338 ?auto_249340 ) ) ( not ( = ?auto_249338 ?auto_249341 ) ) ( not ( = ?auto_249338 ?auto_249342 ) ) ( not ( = ?auto_249338 ?auto_249343 ) ) ( not ( = ?auto_249338 ?auto_249344 ) ) ( not ( = ?auto_249338 ?auto_249345 ) ) ( not ( = ?auto_249338 ?auto_249346 ) ) ( not ( = ?auto_249338 ?auto_249347 ) ) ( not ( = ?auto_249338 ?auto_249348 ) ) ( not ( = ?auto_249338 ?auto_249349 ) ) ( not ( = ?auto_249339 ?auto_249340 ) ) ( not ( = ?auto_249339 ?auto_249341 ) ) ( not ( = ?auto_249339 ?auto_249342 ) ) ( not ( = ?auto_249339 ?auto_249343 ) ) ( not ( = ?auto_249339 ?auto_249344 ) ) ( not ( = ?auto_249339 ?auto_249345 ) ) ( not ( = ?auto_249339 ?auto_249346 ) ) ( not ( = ?auto_249339 ?auto_249347 ) ) ( not ( = ?auto_249339 ?auto_249348 ) ) ( not ( = ?auto_249339 ?auto_249349 ) ) ( not ( = ?auto_249340 ?auto_249341 ) ) ( not ( = ?auto_249340 ?auto_249342 ) ) ( not ( = ?auto_249340 ?auto_249343 ) ) ( not ( = ?auto_249340 ?auto_249344 ) ) ( not ( = ?auto_249340 ?auto_249345 ) ) ( not ( = ?auto_249340 ?auto_249346 ) ) ( not ( = ?auto_249340 ?auto_249347 ) ) ( not ( = ?auto_249340 ?auto_249348 ) ) ( not ( = ?auto_249340 ?auto_249349 ) ) ( not ( = ?auto_249341 ?auto_249342 ) ) ( not ( = ?auto_249341 ?auto_249343 ) ) ( not ( = ?auto_249341 ?auto_249344 ) ) ( not ( = ?auto_249341 ?auto_249345 ) ) ( not ( = ?auto_249341 ?auto_249346 ) ) ( not ( = ?auto_249341 ?auto_249347 ) ) ( not ( = ?auto_249341 ?auto_249348 ) ) ( not ( = ?auto_249341 ?auto_249349 ) ) ( not ( = ?auto_249342 ?auto_249343 ) ) ( not ( = ?auto_249342 ?auto_249344 ) ) ( not ( = ?auto_249342 ?auto_249345 ) ) ( not ( = ?auto_249342 ?auto_249346 ) ) ( not ( = ?auto_249342 ?auto_249347 ) ) ( not ( = ?auto_249342 ?auto_249348 ) ) ( not ( = ?auto_249342 ?auto_249349 ) ) ( not ( = ?auto_249343 ?auto_249344 ) ) ( not ( = ?auto_249343 ?auto_249345 ) ) ( not ( = ?auto_249343 ?auto_249346 ) ) ( not ( = ?auto_249343 ?auto_249347 ) ) ( not ( = ?auto_249343 ?auto_249348 ) ) ( not ( = ?auto_249343 ?auto_249349 ) ) ( not ( = ?auto_249344 ?auto_249345 ) ) ( not ( = ?auto_249344 ?auto_249346 ) ) ( not ( = ?auto_249344 ?auto_249347 ) ) ( not ( = ?auto_249344 ?auto_249348 ) ) ( not ( = ?auto_249344 ?auto_249349 ) ) ( not ( = ?auto_249345 ?auto_249346 ) ) ( not ( = ?auto_249345 ?auto_249347 ) ) ( not ( = ?auto_249345 ?auto_249348 ) ) ( not ( = ?auto_249345 ?auto_249349 ) ) ( not ( = ?auto_249346 ?auto_249347 ) ) ( not ( = ?auto_249346 ?auto_249348 ) ) ( not ( = ?auto_249346 ?auto_249349 ) ) ( not ( = ?auto_249347 ?auto_249348 ) ) ( not ( = ?auto_249347 ?auto_249349 ) ) ( not ( = ?auto_249348 ?auto_249349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_249348 ?auto_249349 )
      ( !STACK ?auto_249348 ?auto_249347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249362 - BLOCK
      ?auto_249363 - BLOCK
      ?auto_249364 - BLOCK
      ?auto_249365 - BLOCK
      ?auto_249366 - BLOCK
      ?auto_249367 - BLOCK
      ?auto_249368 - BLOCK
      ?auto_249369 - BLOCK
      ?auto_249370 - BLOCK
      ?auto_249371 - BLOCK
      ?auto_249372 - BLOCK
      ?auto_249373 - BLOCK
    )
    :vars
    (
      ?auto_249374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249373 ?auto_249374 ) ( ON-TABLE ?auto_249362 ) ( ON ?auto_249363 ?auto_249362 ) ( ON ?auto_249364 ?auto_249363 ) ( ON ?auto_249365 ?auto_249364 ) ( ON ?auto_249366 ?auto_249365 ) ( ON ?auto_249367 ?auto_249366 ) ( ON ?auto_249368 ?auto_249367 ) ( ON ?auto_249369 ?auto_249368 ) ( ON ?auto_249370 ?auto_249369 ) ( ON ?auto_249371 ?auto_249370 ) ( not ( = ?auto_249362 ?auto_249363 ) ) ( not ( = ?auto_249362 ?auto_249364 ) ) ( not ( = ?auto_249362 ?auto_249365 ) ) ( not ( = ?auto_249362 ?auto_249366 ) ) ( not ( = ?auto_249362 ?auto_249367 ) ) ( not ( = ?auto_249362 ?auto_249368 ) ) ( not ( = ?auto_249362 ?auto_249369 ) ) ( not ( = ?auto_249362 ?auto_249370 ) ) ( not ( = ?auto_249362 ?auto_249371 ) ) ( not ( = ?auto_249362 ?auto_249372 ) ) ( not ( = ?auto_249362 ?auto_249373 ) ) ( not ( = ?auto_249362 ?auto_249374 ) ) ( not ( = ?auto_249363 ?auto_249364 ) ) ( not ( = ?auto_249363 ?auto_249365 ) ) ( not ( = ?auto_249363 ?auto_249366 ) ) ( not ( = ?auto_249363 ?auto_249367 ) ) ( not ( = ?auto_249363 ?auto_249368 ) ) ( not ( = ?auto_249363 ?auto_249369 ) ) ( not ( = ?auto_249363 ?auto_249370 ) ) ( not ( = ?auto_249363 ?auto_249371 ) ) ( not ( = ?auto_249363 ?auto_249372 ) ) ( not ( = ?auto_249363 ?auto_249373 ) ) ( not ( = ?auto_249363 ?auto_249374 ) ) ( not ( = ?auto_249364 ?auto_249365 ) ) ( not ( = ?auto_249364 ?auto_249366 ) ) ( not ( = ?auto_249364 ?auto_249367 ) ) ( not ( = ?auto_249364 ?auto_249368 ) ) ( not ( = ?auto_249364 ?auto_249369 ) ) ( not ( = ?auto_249364 ?auto_249370 ) ) ( not ( = ?auto_249364 ?auto_249371 ) ) ( not ( = ?auto_249364 ?auto_249372 ) ) ( not ( = ?auto_249364 ?auto_249373 ) ) ( not ( = ?auto_249364 ?auto_249374 ) ) ( not ( = ?auto_249365 ?auto_249366 ) ) ( not ( = ?auto_249365 ?auto_249367 ) ) ( not ( = ?auto_249365 ?auto_249368 ) ) ( not ( = ?auto_249365 ?auto_249369 ) ) ( not ( = ?auto_249365 ?auto_249370 ) ) ( not ( = ?auto_249365 ?auto_249371 ) ) ( not ( = ?auto_249365 ?auto_249372 ) ) ( not ( = ?auto_249365 ?auto_249373 ) ) ( not ( = ?auto_249365 ?auto_249374 ) ) ( not ( = ?auto_249366 ?auto_249367 ) ) ( not ( = ?auto_249366 ?auto_249368 ) ) ( not ( = ?auto_249366 ?auto_249369 ) ) ( not ( = ?auto_249366 ?auto_249370 ) ) ( not ( = ?auto_249366 ?auto_249371 ) ) ( not ( = ?auto_249366 ?auto_249372 ) ) ( not ( = ?auto_249366 ?auto_249373 ) ) ( not ( = ?auto_249366 ?auto_249374 ) ) ( not ( = ?auto_249367 ?auto_249368 ) ) ( not ( = ?auto_249367 ?auto_249369 ) ) ( not ( = ?auto_249367 ?auto_249370 ) ) ( not ( = ?auto_249367 ?auto_249371 ) ) ( not ( = ?auto_249367 ?auto_249372 ) ) ( not ( = ?auto_249367 ?auto_249373 ) ) ( not ( = ?auto_249367 ?auto_249374 ) ) ( not ( = ?auto_249368 ?auto_249369 ) ) ( not ( = ?auto_249368 ?auto_249370 ) ) ( not ( = ?auto_249368 ?auto_249371 ) ) ( not ( = ?auto_249368 ?auto_249372 ) ) ( not ( = ?auto_249368 ?auto_249373 ) ) ( not ( = ?auto_249368 ?auto_249374 ) ) ( not ( = ?auto_249369 ?auto_249370 ) ) ( not ( = ?auto_249369 ?auto_249371 ) ) ( not ( = ?auto_249369 ?auto_249372 ) ) ( not ( = ?auto_249369 ?auto_249373 ) ) ( not ( = ?auto_249369 ?auto_249374 ) ) ( not ( = ?auto_249370 ?auto_249371 ) ) ( not ( = ?auto_249370 ?auto_249372 ) ) ( not ( = ?auto_249370 ?auto_249373 ) ) ( not ( = ?auto_249370 ?auto_249374 ) ) ( not ( = ?auto_249371 ?auto_249372 ) ) ( not ( = ?auto_249371 ?auto_249373 ) ) ( not ( = ?auto_249371 ?auto_249374 ) ) ( not ( = ?auto_249372 ?auto_249373 ) ) ( not ( = ?auto_249372 ?auto_249374 ) ) ( not ( = ?auto_249373 ?auto_249374 ) ) ( CLEAR ?auto_249371 ) ( ON ?auto_249372 ?auto_249373 ) ( CLEAR ?auto_249372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_249362 ?auto_249363 ?auto_249364 ?auto_249365 ?auto_249366 ?auto_249367 ?auto_249368 ?auto_249369 ?auto_249370 ?auto_249371 ?auto_249372 )
      ( MAKE-12PILE ?auto_249362 ?auto_249363 ?auto_249364 ?auto_249365 ?auto_249366 ?auto_249367 ?auto_249368 ?auto_249369 ?auto_249370 ?auto_249371 ?auto_249372 ?auto_249373 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249387 - BLOCK
      ?auto_249388 - BLOCK
      ?auto_249389 - BLOCK
      ?auto_249390 - BLOCK
      ?auto_249391 - BLOCK
      ?auto_249392 - BLOCK
      ?auto_249393 - BLOCK
      ?auto_249394 - BLOCK
      ?auto_249395 - BLOCK
      ?auto_249396 - BLOCK
      ?auto_249397 - BLOCK
      ?auto_249398 - BLOCK
    )
    :vars
    (
      ?auto_249399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249398 ?auto_249399 ) ( ON-TABLE ?auto_249387 ) ( ON ?auto_249388 ?auto_249387 ) ( ON ?auto_249389 ?auto_249388 ) ( ON ?auto_249390 ?auto_249389 ) ( ON ?auto_249391 ?auto_249390 ) ( ON ?auto_249392 ?auto_249391 ) ( ON ?auto_249393 ?auto_249392 ) ( ON ?auto_249394 ?auto_249393 ) ( ON ?auto_249395 ?auto_249394 ) ( ON ?auto_249396 ?auto_249395 ) ( not ( = ?auto_249387 ?auto_249388 ) ) ( not ( = ?auto_249387 ?auto_249389 ) ) ( not ( = ?auto_249387 ?auto_249390 ) ) ( not ( = ?auto_249387 ?auto_249391 ) ) ( not ( = ?auto_249387 ?auto_249392 ) ) ( not ( = ?auto_249387 ?auto_249393 ) ) ( not ( = ?auto_249387 ?auto_249394 ) ) ( not ( = ?auto_249387 ?auto_249395 ) ) ( not ( = ?auto_249387 ?auto_249396 ) ) ( not ( = ?auto_249387 ?auto_249397 ) ) ( not ( = ?auto_249387 ?auto_249398 ) ) ( not ( = ?auto_249387 ?auto_249399 ) ) ( not ( = ?auto_249388 ?auto_249389 ) ) ( not ( = ?auto_249388 ?auto_249390 ) ) ( not ( = ?auto_249388 ?auto_249391 ) ) ( not ( = ?auto_249388 ?auto_249392 ) ) ( not ( = ?auto_249388 ?auto_249393 ) ) ( not ( = ?auto_249388 ?auto_249394 ) ) ( not ( = ?auto_249388 ?auto_249395 ) ) ( not ( = ?auto_249388 ?auto_249396 ) ) ( not ( = ?auto_249388 ?auto_249397 ) ) ( not ( = ?auto_249388 ?auto_249398 ) ) ( not ( = ?auto_249388 ?auto_249399 ) ) ( not ( = ?auto_249389 ?auto_249390 ) ) ( not ( = ?auto_249389 ?auto_249391 ) ) ( not ( = ?auto_249389 ?auto_249392 ) ) ( not ( = ?auto_249389 ?auto_249393 ) ) ( not ( = ?auto_249389 ?auto_249394 ) ) ( not ( = ?auto_249389 ?auto_249395 ) ) ( not ( = ?auto_249389 ?auto_249396 ) ) ( not ( = ?auto_249389 ?auto_249397 ) ) ( not ( = ?auto_249389 ?auto_249398 ) ) ( not ( = ?auto_249389 ?auto_249399 ) ) ( not ( = ?auto_249390 ?auto_249391 ) ) ( not ( = ?auto_249390 ?auto_249392 ) ) ( not ( = ?auto_249390 ?auto_249393 ) ) ( not ( = ?auto_249390 ?auto_249394 ) ) ( not ( = ?auto_249390 ?auto_249395 ) ) ( not ( = ?auto_249390 ?auto_249396 ) ) ( not ( = ?auto_249390 ?auto_249397 ) ) ( not ( = ?auto_249390 ?auto_249398 ) ) ( not ( = ?auto_249390 ?auto_249399 ) ) ( not ( = ?auto_249391 ?auto_249392 ) ) ( not ( = ?auto_249391 ?auto_249393 ) ) ( not ( = ?auto_249391 ?auto_249394 ) ) ( not ( = ?auto_249391 ?auto_249395 ) ) ( not ( = ?auto_249391 ?auto_249396 ) ) ( not ( = ?auto_249391 ?auto_249397 ) ) ( not ( = ?auto_249391 ?auto_249398 ) ) ( not ( = ?auto_249391 ?auto_249399 ) ) ( not ( = ?auto_249392 ?auto_249393 ) ) ( not ( = ?auto_249392 ?auto_249394 ) ) ( not ( = ?auto_249392 ?auto_249395 ) ) ( not ( = ?auto_249392 ?auto_249396 ) ) ( not ( = ?auto_249392 ?auto_249397 ) ) ( not ( = ?auto_249392 ?auto_249398 ) ) ( not ( = ?auto_249392 ?auto_249399 ) ) ( not ( = ?auto_249393 ?auto_249394 ) ) ( not ( = ?auto_249393 ?auto_249395 ) ) ( not ( = ?auto_249393 ?auto_249396 ) ) ( not ( = ?auto_249393 ?auto_249397 ) ) ( not ( = ?auto_249393 ?auto_249398 ) ) ( not ( = ?auto_249393 ?auto_249399 ) ) ( not ( = ?auto_249394 ?auto_249395 ) ) ( not ( = ?auto_249394 ?auto_249396 ) ) ( not ( = ?auto_249394 ?auto_249397 ) ) ( not ( = ?auto_249394 ?auto_249398 ) ) ( not ( = ?auto_249394 ?auto_249399 ) ) ( not ( = ?auto_249395 ?auto_249396 ) ) ( not ( = ?auto_249395 ?auto_249397 ) ) ( not ( = ?auto_249395 ?auto_249398 ) ) ( not ( = ?auto_249395 ?auto_249399 ) ) ( not ( = ?auto_249396 ?auto_249397 ) ) ( not ( = ?auto_249396 ?auto_249398 ) ) ( not ( = ?auto_249396 ?auto_249399 ) ) ( not ( = ?auto_249397 ?auto_249398 ) ) ( not ( = ?auto_249397 ?auto_249399 ) ) ( not ( = ?auto_249398 ?auto_249399 ) ) ( CLEAR ?auto_249396 ) ( ON ?auto_249397 ?auto_249398 ) ( CLEAR ?auto_249397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_249387 ?auto_249388 ?auto_249389 ?auto_249390 ?auto_249391 ?auto_249392 ?auto_249393 ?auto_249394 ?auto_249395 ?auto_249396 ?auto_249397 )
      ( MAKE-12PILE ?auto_249387 ?auto_249388 ?auto_249389 ?auto_249390 ?auto_249391 ?auto_249392 ?auto_249393 ?auto_249394 ?auto_249395 ?auto_249396 ?auto_249397 ?auto_249398 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249412 - BLOCK
      ?auto_249413 - BLOCK
      ?auto_249414 - BLOCK
      ?auto_249415 - BLOCK
      ?auto_249416 - BLOCK
      ?auto_249417 - BLOCK
      ?auto_249418 - BLOCK
      ?auto_249419 - BLOCK
      ?auto_249420 - BLOCK
      ?auto_249421 - BLOCK
      ?auto_249422 - BLOCK
      ?auto_249423 - BLOCK
    )
    :vars
    (
      ?auto_249424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249423 ?auto_249424 ) ( ON-TABLE ?auto_249412 ) ( ON ?auto_249413 ?auto_249412 ) ( ON ?auto_249414 ?auto_249413 ) ( ON ?auto_249415 ?auto_249414 ) ( ON ?auto_249416 ?auto_249415 ) ( ON ?auto_249417 ?auto_249416 ) ( ON ?auto_249418 ?auto_249417 ) ( ON ?auto_249419 ?auto_249418 ) ( ON ?auto_249420 ?auto_249419 ) ( not ( = ?auto_249412 ?auto_249413 ) ) ( not ( = ?auto_249412 ?auto_249414 ) ) ( not ( = ?auto_249412 ?auto_249415 ) ) ( not ( = ?auto_249412 ?auto_249416 ) ) ( not ( = ?auto_249412 ?auto_249417 ) ) ( not ( = ?auto_249412 ?auto_249418 ) ) ( not ( = ?auto_249412 ?auto_249419 ) ) ( not ( = ?auto_249412 ?auto_249420 ) ) ( not ( = ?auto_249412 ?auto_249421 ) ) ( not ( = ?auto_249412 ?auto_249422 ) ) ( not ( = ?auto_249412 ?auto_249423 ) ) ( not ( = ?auto_249412 ?auto_249424 ) ) ( not ( = ?auto_249413 ?auto_249414 ) ) ( not ( = ?auto_249413 ?auto_249415 ) ) ( not ( = ?auto_249413 ?auto_249416 ) ) ( not ( = ?auto_249413 ?auto_249417 ) ) ( not ( = ?auto_249413 ?auto_249418 ) ) ( not ( = ?auto_249413 ?auto_249419 ) ) ( not ( = ?auto_249413 ?auto_249420 ) ) ( not ( = ?auto_249413 ?auto_249421 ) ) ( not ( = ?auto_249413 ?auto_249422 ) ) ( not ( = ?auto_249413 ?auto_249423 ) ) ( not ( = ?auto_249413 ?auto_249424 ) ) ( not ( = ?auto_249414 ?auto_249415 ) ) ( not ( = ?auto_249414 ?auto_249416 ) ) ( not ( = ?auto_249414 ?auto_249417 ) ) ( not ( = ?auto_249414 ?auto_249418 ) ) ( not ( = ?auto_249414 ?auto_249419 ) ) ( not ( = ?auto_249414 ?auto_249420 ) ) ( not ( = ?auto_249414 ?auto_249421 ) ) ( not ( = ?auto_249414 ?auto_249422 ) ) ( not ( = ?auto_249414 ?auto_249423 ) ) ( not ( = ?auto_249414 ?auto_249424 ) ) ( not ( = ?auto_249415 ?auto_249416 ) ) ( not ( = ?auto_249415 ?auto_249417 ) ) ( not ( = ?auto_249415 ?auto_249418 ) ) ( not ( = ?auto_249415 ?auto_249419 ) ) ( not ( = ?auto_249415 ?auto_249420 ) ) ( not ( = ?auto_249415 ?auto_249421 ) ) ( not ( = ?auto_249415 ?auto_249422 ) ) ( not ( = ?auto_249415 ?auto_249423 ) ) ( not ( = ?auto_249415 ?auto_249424 ) ) ( not ( = ?auto_249416 ?auto_249417 ) ) ( not ( = ?auto_249416 ?auto_249418 ) ) ( not ( = ?auto_249416 ?auto_249419 ) ) ( not ( = ?auto_249416 ?auto_249420 ) ) ( not ( = ?auto_249416 ?auto_249421 ) ) ( not ( = ?auto_249416 ?auto_249422 ) ) ( not ( = ?auto_249416 ?auto_249423 ) ) ( not ( = ?auto_249416 ?auto_249424 ) ) ( not ( = ?auto_249417 ?auto_249418 ) ) ( not ( = ?auto_249417 ?auto_249419 ) ) ( not ( = ?auto_249417 ?auto_249420 ) ) ( not ( = ?auto_249417 ?auto_249421 ) ) ( not ( = ?auto_249417 ?auto_249422 ) ) ( not ( = ?auto_249417 ?auto_249423 ) ) ( not ( = ?auto_249417 ?auto_249424 ) ) ( not ( = ?auto_249418 ?auto_249419 ) ) ( not ( = ?auto_249418 ?auto_249420 ) ) ( not ( = ?auto_249418 ?auto_249421 ) ) ( not ( = ?auto_249418 ?auto_249422 ) ) ( not ( = ?auto_249418 ?auto_249423 ) ) ( not ( = ?auto_249418 ?auto_249424 ) ) ( not ( = ?auto_249419 ?auto_249420 ) ) ( not ( = ?auto_249419 ?auto_249421 ) ) ( not ( = ?auto_249419 ?auto_249422 ) ) ( not ( = ?auto_249419 ?auto_249423 ) ) ( not ( = ?auto_249419 ?auto_249424 ) ) ( not ( = ?auto_249420 ?auto_249421 ) ) ( not ( = ?auto_249420 ?auto_249422 ) ) ( not ( = ?auto_249420 ?auto_249423 ) ) ( not ( = ?auto_249420 ?auto_249424 ) ) ( not ( = ?auto_249421 ?auto_249422 ) ) ( not ( = ?auto_249421 ?auto_249423 ) ) ( not ( = ?auto_249421 ?auto_249424 ) ) ( not ( = ?auto_249422 ?auto_249423 ) ) ( not ( = ?auto_249422 ?auto_249424 ) ) ( not ( = ?auto_249423 ?auto_249424 ) ) ( ON ?auto_249422 ?auto_249423 ) ( CLEAR ?auto_249420 ) ( ON ?auto_249421 ?auto_249422 ) ( CLEAR ?auto_249421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_249412 ?auto_249413 ?auto_249414 ?auto_249415 ?auto_249416 ?auto_249417 ?auto_249418 ?auto_249419 ?auto_249420 ?auto_249421 )
      ( MAKE-12PILE ?auto_249412 ?auto_249413 ?auto_249414 ?auto_249415 ?auto_249416 ?auto_249417 ?auto_249418 ?auto_249419 ?auto_249420 ?auto_249421 ?auto_249422 ?auto_249423 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249437 - BLOCK
      ?auto_249438 - BLOCK
      ?auto_249439 - BLOCK
      ?auto_249440 - BLOCK
      ?auto_249441 - BLOCK
      ?auto_249442 - BLOCK
      ?auto_249443 - BLOCK
      ?auto_249444 - BLOCK
      ?auto_249445 - BLOCK
      ?auto_249446 - BLOCK
      ?auto_249447 - BLOCK
      ?auto_249448 - BLOCK
    )
    :vars
    (
      ?auto_249449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249448 ?auto_249449 ) ( ON-TABLE ?auto_249437 ) ( ON ?auto_249438 ?auto_249437 ) ( ON ?auto_249439 ?auto_249438 ) ( ON ?auto_249440 ?auto_249439 ) ( ON ?auto_249441 ?auto_249440 ) ( ON ?auto_249442 ?auto_249441 ) ( ON ?auto_249443 ?auto_249442 ) ( ON ?auto_249444 ?auto_249443 ) ( ON ?auto_249445 ?auto_249444 ) ( not ( = ?auto_249437 ?auto_249438 ) ) ( not ( = ?auto_249437 ?auto_249439 ) ) ( not ( = ?auto_249437 ?auto_249440 ) ) ( not ( = ?auto_249437 ?auto_249441 ) ) ( not ( = ?auto_249437 ?auto_249442 ) ) ( not ( = ?auto_249437 ?auto_249443 ) ) ( not ( = ?auto_249437 ?auto_249444 ) ) ( not ( = ?auto_249437 ?auto_249445 ) ) ( not ( = ?auto_249437 ?auto_249446 ) ) ( not ( = ?auto_249437 ?auto_249447 ) ) ( not ( = ?auto_249437 ?auto_249448 ) ) ( not ( = ?auto_249437 ?auto_249449 ) ) ( not ( = ?auto_249438 ?auto_249439 ) ) ( not ( = ?auto_249438 ?auto_249440 ) ) ( not ( = ?auto_249438 ?auto_249441 ) ) ( not ( = ?auto_249438 ?auto_249442 ) ) ( not ( = ?auto_249438 ?auto_249443 ) ) ( not ( = ?auto_249438 ?auto_249444 ) ) ( not ( = ?auto_249438 ?auto_249445 ) ) ( not ( = ?auto_249438 ?auto_249446 ) ) ( not ( = ?auto_249438 ?auto_249447 ) ) ( not ( = ?auto_249438 ?auto_249448 ) ) ( not ( = ?auto_249438 ?auto_249449 ) ) ( not ( = ?auto_249439 ?auto_249440 ) ) ( not ( = ?auto_249439 ?auto_249441 ) ) ( not ( = ?auto_249439 ?auto_249442 ) ) ( not ( = ?auto_249439 ?auto_249443 ) ) ( not ( = ?auto_249439 ?auto_249444 ) ) ( not ( = ?auto_249439 ?auto_249445 ) ) ( not ( = ?auto_249439 ?auto_249446 ) ) ( not ( = ?auto_249439 ?auto_249447 ) ) ( not ( = ?auto_249439 ?auto_249448 ) ) ( not ( = ?auto_249439 ?auto_249449 ) ) ( not ( = ?auto_249440 ?auto_249441 ) ) ( not ( = ?auto_249440 ?auto_249442 ) ) ( not ( = ?auto_249440 ?auto_249443 ) ) ( not ( = ?auto_249440 ?auto_249444 ) ) ( not ( = ?auto_249440 ?auto_249445 ) ) ( not ( = ?auto_249440 ?auto_249446 ) ) ( not ( = ?auto_249440 ?auto_249447 ) ) ( not ( = ?auto_249440 ?auto_249448 ) ) ( not ( = ?auto_249440 ?auto_249449 ) ) ( not ( = ?auto_249441 ?auto_249442 ) ) ( not ( = ?auto_249441 ?auto_249443 ) ) ( not ( = ?auto_249441 ?auto_249444 ) ) ( not ( = ?auto_249441 ?auto_249445 ) ) ( not ( = ?auto_249441 ?auto_249446 ) ) ( not ( = ?auto_249441 ?auto_249447 ) ) ( not ( = ?auto_249441 ?auto_249448 ) ) ( not ( = ?auto_249441 ?auto_249449 ) ) ( not ( = ?auto_249442 ?auto_249443 ) ) ( not ( = ?auto_249442 ?auto_249444 ) ) ( not ( = ?auto_249442 ?auto_249445 ) ) ( not ( = ?auto_249442 ?auto_249446 ) ) ( not ( = ?auto_249442 ?auto_249447 ) ) ( not ( = ?auto_249442 ?auto_249448 ) ) ( not ( = ?auto_249442 ?auto_249449 ) ) ( not ( = ?auto_249443 ?auto_249444 ) ) ( not ( = ?auto_249443 ?auto_249445 ) ) ( not ( = ?auto_249443 ?auto_249446 ) ) ( not ( = ?auto_249443 ?auto_249447 ) ) ( not ( = ?auto_249443 ?auto_249448 ) ) ( not ( = ?auto_249443 ?auto_249449 ) ) ( not ( = ?auto_249444 ?auto_249445 ) ) ( not ( = ?auto_249444 ?auto_249446 ) ) ( not ( = ?auto_249444 ?auto_249447 ) ) ( not ( = ?auto_249444 ?auto_249448 ) ) ( not ( = ?auto_249444 ?auto_249449 ) ) ( not ( = ?auto_249445 ?auto_249446 ) ) ( not ( = ?auto_249445 ?auto_249447 ) ) ( not ( = ?auto_249445 ?auto_249448 ) ) ( not ( = ?auto_249445 ?auto_249449 ) ) ( not ( = ?auto_249446 ?auto_249447 ) ) ( not ( = ?auto_249446 ?auto_249448 ) ) ( not ( = ?auto_249446 ?auto_249449 ) ) ( not ( = ?auto_249447 ?auto_249448 ) ) ( not ( = ?auto_249447 ?auto_249449 ) ) ( not ( = ?auto_249448 ?auto_249449 ) ) ( ON ?auto_249447 ?auto_249448 ) ( CLEAR ?auto_249445 ) ( ON ?auto_249446 ?auto_249447 ) ( CLEAR ?auto_249446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_249437 ?auto_249438 ?auto_249439 ?auto_249440 ?auto_249441 ?auto_249442 ?auto_249443 ?auto_249444 ?auto_249445 ?auto_249446 )
      ( MAKE-12PILE ?auto_249437 ?auto_249438 ?auto_249439 ?auto_249440 ?auto_249441 ?auto_249442 ?auto_249443 ?auto_249444 ?auto_249445 ?auto_249446 ?auto_249447 ?auto_249448 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249462 - BLOCK
      ?auto_249463 - BLOCK
      ?auto_249464 - BLOCK
      ?auto_249465 - BLOCK
      ?auto_249466 - BLOCK
      ?auto_249467 - BLOCK
      ?auto_249468 - BLOCK
      ?auto_249469 - BLOCK
      ?auto_249470 - BLOCK
      ?auto_249471 - BLOCK
      ?auto_249472 - BLOCK
      ?auto_249473 - BLOCK
    )
    :vars
    (
      ?auto_249474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249473 ?auto_249474 ) ( ON-TABLE ?auto_249462 ) ( ON ?auto_249463 ?auto_249462 ) ( ON ?auto_249464 ?auto_249463 ) ( ON ?auto_249465 ?auto_249464 ) ( ON ?auto_249466 ?auto_249465 ) ( ON ?auto_249467 ?auto_249466 ) ( ON ?auto_249468 ?auto_249467 ) ( ON ?auto_249469 ?auto_249468 ) ( not ( = ?auto_249462 ?auto_249463 ) ) ( not ( = ?auto_249462 ?auto_249464 ) ) ( not ( = ?auto_249462 ?auto_249465 ) ) ( not ( = ?auto_249462 ?auto_249466 ) ) ( not ( = ?auto_249462 ?auto_249467 ) ) ( not ( = ?auto_249462 ?auto_249468 ) ) ( not ( = ?auto_249462 ?auto_249469 ) ) ( not ( = ?auto_249462 ?auto_249470 ) ) ( not ( = ?auto_249462 ?auto_249471 ) ) ( not ( = ?auto_249462 ?auto_249472 ) ) ( not ( = ?auto_249462 ?auto_249473 ) ) ( not ( = ?auto_249462 ?auto_249474 ) ) ( not ( = ?auto_249463 ?auto_249464 ) ) ( not ( = ?auto_249463 ?auto_249465 ) ) ( not ( = ?auto_249463 ?auto_249466 ) ) ( not ( = ?auto_249463 ?auto_249467 ) ) ( not ( = ?auto_249463 ?auto_249468 ) ) ( not ( = ?auto_249463 ?auto_249469 ) ) ( not ( = ?auto_249463 ?auto_249470 ) ) ( not ( = ?auto_249463 ?auto_249471 ) ) ( not ( = ?auto_249463 ?auto_249472 ) ) ( not ( = ?auto_249463 ?auto_249473 ) ) ( not ( = ?auto_249463 ?auto_249474 ) ) ( not ( = ?auto_249464 ?auto_249465 ) ) ( not ( = ?auto_249464 ?auto_249466 ) ) ( not ( = ?auto_249464 ?auto_249467 ) ) ( not ( = ?auto_249464 ?auto_249468 ) ) ( not ( = ?auto_249464 ?auto_249469 ) ) ( not ( = ?auto_249464 ?auto_249470 ) ) ( not ( = ?auto_249464 ?auto_249471 ) ) ( not ( = ?auto_249464 ?auto_249472 ) ) ( not ( = ?auto_249464 ?auto_249473 ) ) ( not ( = ?auto_249464 ?auto_249474 ) ) ( not ( = ?auto_249465 ?auto_249466 ) ) ( not ( = ?auto_249465 ?auto_249467 ) ) ( not ( = ?auto_249465 ?auto_249468 ) ) ( not ( = ?auto_249465 ?auto_249469 ) ) ( not ( = ?auto_249465 ?auto_249470 ) ) ( not ( = ?auto_249465 ?auto_249471 ) ) ( not ( = ?auto_249465 ?auto_249472 ) ) ( not ( = ?auto_249465 ?auto_249473 ) ) ( not ( = ?auto_249465 ?auto_249474 ) ) ( not ( = ?auto_249466 ?auto_249467 ) ) ( not ( = ?auto_249466 ?auto_249468 ) ) ( not ( = ?auto_249466 ?auto_249469 ) ) ( not ( = ?auto_249466 ?auto_249470 ) ) ( not ( = ?auto_249466 ?auto_249471 ) ) ( not ( = ?auto_249466 ?auto_249472 ) ) ( not ( = ?auto_249466 ?auto_249473 ) ) ( not ( = ?auto_249466 ?auto_249474 ) ) ( not ( = ?auto_249467 ?auto_249468 ) ) ( not ( = ?auto_249467 ?auto_249469 ) ) ( not ( = ?auto_249467 ?auto_249470 ) ) ( not ( = ?auto_249467 ?auto_249471 ) ) ( not ( = ?auto_249467 ?auto_249472 ) ) ( not ( = ?auto_249467 ?auto_249473 ) ) ( not ( = ?auto_249467 ?auto_249474 ) ) ( not ( = ?auto_249468 ?auto_249469 ) ) ( not ( = ?auto_249468 ?auto_249470 ) ) ( not ( = ?auto_249468 ?auto_249471 ) ) ( not ( = ?auto_249468 ?auto_249472 ) ) ( not ( = ?auto_249468 ?auto_249473 ) ) ( not ( = ?auto_249468 ?auto_249474 ) ) ( not ( = ?auto_249469 ?auto_249470 ) ) ( not ( = ?auto_249469 ?auto_249471 ) ) ( not ( = ?auto_249469 ?auto_249472 ) ) ( not ( = ?auto_249469 ?auto_249473 ) ) ( not ( = ?auto_249469 ?auto_249474 ) ) ( not ( = ?auto_249470 ?auto_249471 ) ) ( not ( = ?auto_249470 ?auto_249472 ) ) ( not ( = ?auto_249470 ?auto_249473 ) ) ( not ( = ?auto_249470 ?auto_249474 ) ) ( not ( = ?auto_249471 ?auto_249472 ) ) ( not ( = ?auto_249471 ?auto_249473 ) ) ( not ( = ?auto_249471 ?auto_249474 ) ) ( not ( = ?auto_249472 ?auto_249473 ) ) ( not ( = ?auto_249472 ?auto_249474 ) ) ( not ( = ?auto_249473 ?auto_249474 ) ) ( ON ?auto_249472 ?auto_249473 ) ( ON ?auto_249471 ?auto_249472 ) ( CLEAR ?auto_249469 ) ( ON ?auto_249470 ?auto_249471 ) ( CLEAR ?auto_249470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_249462 ?auto_249463 ?auto_249464 ?auto_249465 ?auto_249466 ?auto_249467 ?auto_249468 ?auto_249469 ?auto_249470 )
      ( MAKE-12PILE ?auto_249462 ?auto_249463 ?auto_249464 ?auto_249465 ?auto_249466 ?auto_249467 ?auto_249468 ?auto_249469 ?auto_249470 ?auto_249471 ?auto_249472 ?auto_249473 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249487 - BLOCK
      ?auto_249488 - BLOCK
      ?auto_249489 - BLOCK
      ?auto_249490 - BLOCK
      ?auto_249491 - BLOCK
      ?auto_249492 - BLOCK
      ?auto_249493 - BLOCK
      ?auto_249494 - BLOCK
      ?auto_249495 - BLOCK
      ?auto_249496 - BLOCK
      ?auto_249497 - BLOCK
      ?auto_249498 - BLOCK
    )
    :vars
    (
      ?auto_249499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249498 ?auto_249499 ) ( ON-TABLE ?auto_249487 ) ( ON ?auto_249488 ?auto_249487 ) ( ON ?auto_249489 ?auto_249488 ) ( ON ?auto_249490 ?auto_249489 ) ( ON ?auto_249491 ?auto_249490 ) ( ON ?auto_249492 ?auto_249491 ) ( ON ?auto_249493 ?auto_249492 ) ( ON ?auto_249494 ?auto_249493 ) ( not ( = ?auto_249487 ?auto_249488 ) ) ( not ( = ?auto_249487 ?auto_249489 ) ) ( not ( = ?auto_249487 ?auto_249490 ) ) ( not ( = ?auto_249487 ?auto_249491 ) ) ( not ( = ?auto_249487 ?auto_249492 ) ) ( not ( = ?auto_249487 ?auto_249493 ) ) ( not ( = ?auto_249487 ?auto_249494 ) ) ( not ( = ?auto_249487 ?auto_249495 ) ) ( not ( = ?auto_249487 ?auto_249496 ) ) ( not ( = ?auto_249487 ?auto_249497 ) ) ( not ( = ?auto_249487 ?auto_249498 ) ) ( not ( = ?auto_249487 ?auto_249499 ) ) ( not ( = ?auto_249488 ?auto_249489 ) ) ( not ( = ?auto_249488 ?auto_249490 ) ) ( not ( = ?auto_249488 ?auto_249491 ) ) ( not ( = ?auto_249488 ?auto_249492 ) ) ( not ( = ?auto_249488 ?auto_249493 ) ) ( not ( = ?auto_249488 ?auto_249494 ) ) ( not ( = ?auto_249488 ?auto_249495 ) ) ( not ( = ?auto_249488 ?auto_249496 ) ) ( not ( = ?auto_249488 ?auto_249497 ) ) ( not ( = ?auto_249488 ?auto_249498 ) ) ( not ( = ?auto_249488 ?auto_249499 ) ) ( not ( = ?auto_249489 ?auto_249490 ) ) ( not ( = ?auto_249489 ?auto_249491 ) ) ( not ( = ?auto_249489 ?auto_249492 ) ) ( not ( = ?auto_249489 ?auto_249493 ) ) ( not ( = ?auto_249489 ?auto_249494 ) ) ( not ( = ?auto_249489 ?auto_249495 ) ) ( not ( = ?auto_249489 ?auto_249496 ) ) ( not ( = ?auto_249489 ?auto_249497 ) ) ( not ( = ?auto_249489 ?auto_249498 ) ) ( not ( = ?auto_249489 ?auto_249499 ) ) ( not ( = ?auto_249490 ?auto_249491 ) ) ( not ( = ?auto_249490 ?auto_249492 ) ) ( not ( = ?auto_249490 ?auto_249493 ) ) ( not ( = ?auto_249490 ?auto_249494 ) ) ( not ( = ?auto_249490 ?auto_249495 ) ) ( not ( = ?auto_249490 ?auto_249496 ) ) ( not ( = ?auto_249490 ?auto_249497 ) ) ( not ( = ?auto_249490 ?auto_249498 ) ) ( not ( = ?auto_249490 ?auto_249499 ) ) ( not ( = ?auto_249491 ?auto_249492 ) ) ( not ( = ?auto_249491 ?auto_249493 ) ) ( not ( = ?auto_249491 ?auto_249494 ) ) ( not ( = ?auto_249491 ?auto_249495 ) ) ( not ( = ?auto_249491 ?auto_249496 ) ) ( not ( = ?auto_249491 ?auto_249497 ) ) ( not ( = ?auto_249491 ?auto_249498 ) ) ( not ( = ?auto_249491 ?auto_249499 ) ) ( not ( = ?auto_249492 ?auto_249493 ) ) ( not ( = ?auto_249492 ?auto_249494 ) ) ( not ( = ?auto_249492 ?auto_249495 ) ) ( not ( = ?auto_249492 ?auto_249496 ) ) ( not ( = ?auto_249492 ?auto_249497 ) ) ( not ( = ?auto_249492 ?auto_249498 ) ) ( not ( = ?auto_249492 ?auto_249499 ) ) ( not ( = ?auto_249493 ?auto_249494 ) ) ( not ( = ?auto_249493 ?auto_249495 ) ) ( not ( = ?auto_249493 ?auto_249496 ) ) ( not ( = ?auto_249493 ?auto_249497 ) ) ( not ( = ?auto_249493 ?auto_249498 ) ) ( not ( = ?auto_249493 ?auto_249499 ) ) ( not ( = ?auto_249494 ?auto_249495 ) ) ( not ( = ?auto_249494 ?auto_249496 ) ) ( not ( = ?auto_249494 ?auto_249497 ) ) ( not ( = ?auto_249494 ?auto_249498 ) ) ( not ( = ?auto_249494 ?auto_249499 ) ) ( not ( = ?auto_249495 ?auto_249496 ) ) ( not ( = ?auto_249495 ?auto_249497 ) ) ( not ( = ?auto_249495 ?auto_249498 ) ) ( not ( = ?auto_249495 ?auto_249499 ) ) ( not ( = ?auto_249496 ?auto_249497 ) ) ( not ( = ?auto_249496 ?auto_249498 ) ) ( not ( = ?auto_249496 ?auto_249499 ) ) ( not ( = ?auto_249497 ?auto_249498 ) ) ( not ( = ?auto_249497 ?auto_249499 ) ) ( not ( = ?auto_249498 ?auto_249499 ) ) ( ON ?auto_249497 ?auto_249498 ) ( ON ?auto_249496 ?auto_249497 ) ( CLEAR ?auto_249494 ) ( ON ?auto_249495 ?auto_249496 ) ( CLEAR ?auto_249495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_249487 ?auto_249488 ?auto_249489 ?auto_249490 ?auto_249491 ?auto_249492 ?auto_249493 ?auto_249494 ?auto_249495 )
      ( MAKE-12PILE ?auto_249487 ?auto_249488 ?auto_249489 ?auto_249490 ?auto_249491 ?auto_249492 ?auto_249493 ?auto_249494 ?auto_249495 ?auto_249496 ?auto_249497 ?auto_249498 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249512 - BLOCK
      ?auto_249513 - BLOCK
      ?auto_249514 - BLOCK
      ?auto_249515 - BLOCK
      ?auto_249516 - BLOCK
      ?auto_249517 - BLOCK
      ?auto_249518 - BLOCK
      ?auto_249519 - BLOCK
      ?auto_249520 - BLOCK
      ?auto_249521 - BLOCK
      ?auto_249522 - BLOCK
      ?auto_249523 - BLOCK
    )
    :vars
    (
      ?auto_249524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249523 ?auto_249524 ) ( ON-TABLE ?auto_249512 ) ( ON ?auto_249513 ?auto_249512 ) ( ON ?auto_249514 ?auto_249513 ) ( ON ?auto_249515 ?auto_249514 ) ( ON ?auto_249516 ?auto_249515 ) ( ON ?auto_249517 ?auto_249516 ) ( ON ?auto_249518 ?auto_249517 ) ( not ( = ?auto_249512 ?auto_249513 ) ) ( not ( = ?auto_249512 ?auto_249514 ) ) ( not ( = ?auto_249512 ?auto_249515 ) ) ( not ( = ?auto_249512 ?auto_249516 ) ) ( not ( = ?auto_249512 ?auto_249517 ) ) ( not ( = ?auto_249512 ?auto_249518 ) ) ( not ( = ?auto_249512 ?auto_249519 ) ) ( not ( = ?auto_249512 ?auto_249520 ) ) ( not ( = ?auto_249512 ?auto_249521 ) ) ( not ( = ?auto_249512 ?auto_249522 ) ) ( not ( = ?auto_249512 ?auto_249523 ) ) ( not ( = ?auto_249512 ?auto_249524 ) ) ( not ( = ?auto_249513 ?auto_249514 ) ) ( not ( = ?auto_249513 ?auto_249515 ) ) ( not ( = ?auto_249513 ?auto_249516 ) ) ( not ( = ?auto_249513 ?auto_249517 ) ) ( not ( = ?auto_249513 ?auto_249518 ) ) ( not ( = ?auto_249513 ?auto_249519 ) ) ( not ( = ?auto_249513 ?auto_249520 ) ) ( not ( = ?auto_249513 ?auto_249521 ) ) ( not ( = ?auto_249513 ?auto_249522 ) ) ( not ( = ?auto_249513 ?auto_249523 ) ) ( not ( = ?auto_249513 ?auto_249524 ) ) ( not ( = ?auto_249514 ?auto_249515 ) ) ( not ( = ?auto_249514 ?auto_249516 ) ) ( not ( = ?auto_249514 ?auto_249517 ) ) ( not ( = ?auto_249514 ?auto_249518 ) ) ( not ( = ?auto_249514 ?auto_249519 ) ) ( not ( = ?auto_249514 ?auto_249520 ) ) ( not ( = ?auto_249514 ?auto_249521 ) ) ( not ( = ?auto_249514 ?auto_249522 ) ) ( not ( = ?auto_249514 ?auto_249523 ) ) ( not ( = ?auto_249514 ?auto_249524 ) ) ( not ( = ?auto_249515 ?auto_249516 ) ) ( not ( = ?auto_249515 ?auto_249517 ) ) ( not ( = ?auto_249515 ?auto_249518 ) ) ( not ( = ?auto_249515 ?auto_249519 ) ) ( not ( = ?auto_249515 ?auto_249520 ) ) ( not ( = ?auto_249515 ?auto_249521 ) ) ( not ( = ?auto_249515 ?auto_249522 ) ) ( not ( = ?auto_249515 ?auto_249523 ) ) ( not ( = ?auto_249515 ?auto_249524 ) ) ( not ( = ?auto_249516 ?auto_249517 ) ) ( not ( = ?auto_249516 ?auto_249518 ) ) ( not ( = ?auto_249516 ?auto_249519 ) ) ( not ( = ?auto_249516 ?auto_249520 ) ) ( not ( = ?auto_249516 ?auto_249521 ) ) ( not ( = ?auto_249516 ?auto_249522 ) ) ( not ( = ?auto_249516 ?auto_249523 ) ) ( not ( = ?auto_249516 ?auto_249524 ) ) ( not ( = ?auto_249517 ?auto_249518 ) ) ( not ( = ?auto_249517 ?auto_249519 ) ) ( not ( = ?auto_249517 ?auto_249520 ) ) ( not ( = ?auto_249517 ?auto_249521 ) ) ( not ( = ?auto_249517 ?auto_249522 ) ) ( not ( = ?auto_249517 ?auto_249523 ) ) ( not ( = ?auto_249517 ?auto_249524 ) ) ( not ( = ?auto_249518 ?auto_249519 ) ) ( not ( = ?auto_249518 ?auto_249520 ) ) ( not ( = ?auto_249518 ?auto_249521 ) ) ( not ( = ?auto_249518 ?auto_249522 ) ) ( not ( = ?auto_249518 ?auto_249523 ) ) ( not ( = ?auto_249518 ?auto_249524 ) ) ( not ( = ?auto_249519 ?auto_249520 ) ) ( not ( = ?auto_249519 ?auto_249521 ) ) ( not ( = ?auto_249519 ?auto_249522 ) ) ( not ( = ?auto_249519 ?auto_249523 ) ) ( not ( = ?auto_249519 ?auto_249524 ) ) ( not ( = ?auto_249520 ?auto_249521 ) ) ( not ( = ?auto_249520 ?auto_249522 ) ) ( not ( = ?auto_249520 ?auto_249523 ) ) ( not ( = ?auto_249520 ?auto_249524 ) ) ( not ( = ?auto_249521 ?auto_249522 ) ) ( not ( = ?auto_249521 ?auto_249523 ) ) ( not ( = ?auto_249521 ?auto_249524 ) ) ( not ( = ?auto_249522 ?auto_249523 ) ) ( not ( = ?auto_249522 ?auto_249524 ) ) ( not ( = ?auto_249523 ?auto_249524 ) ) ( ON ?auto_249522 ?auto_249523 ) ( ON ?auto_249521 ?auto_249522 ) ( ON ?auto_249520 ?auto_249521 ) ( CLEAR ?auto_249518 ) ( ON ?auto_249519 ?auto_249520 ) ( CLEAR ?auto_249519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_249512 ?auto_249513 ?auto_249514 ?auto_249515 ?auto_249516 ?auto_249517 ?auto_249518 ?auto_249519 )
      ( MAKE-12PILE ?auto_249512 ?auto_249513 ?auto_249514 ?auto_249515 ?auto_249516 ?auto_249517 ?auto_249518 ?auto_249519 ?auto_249520 ?auto_249521 ?auto_249522 ?auto_249523 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249537 - BLOCK
      ?auto_249538 - BLOCK
      ?auto_249539 - BLOCK
      ?auto_249540 - BLOCK
      ?auto_249541 - BLOCK
      ?auto_249542 - BLOCK
      ?auto_249543 - BLOCK
      ?auto_249544 - BLOCK
      ?auto_249545 - BLOCK
      ?auto_249546 - BLOCK
      ?auto_249547 - BLOCK
      ?auto_249548 - BLOCK
    )
    :vars
    (
      ?auto_249549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249548 ?auto_249549 ) ( ON-TABLE ?auto_249537 ) ( ON ?auto_249538 ?auto_249537 ) ( ON ?auto_249539 ?auto_249538 ) ( ON ?auto_249540 ?auto_249539 ) ( ON ?auto_249541 ?auto_249540 ) ( ON ?auto_249542 ?auto_249541 ) ( ON ?auto_249543 ?auto_249542 ) ( not ( = ?auto_249537 ?auto_249538 ) ) ( not ( = ?auto_249537 ?auto_249539 ) ) ( not ( = ?auto_249537 ?auto_249540 ) ) ( not ( = ?auto_249537 ?auto_249541 ) ) ( not ( = ?auto_249537 ?auto_249542 ) ) ( not ( = ?auto_249537 ?auto_249543 ) ) ( not ( = ?auto_249537 ?auto_249544 ) ) ( not ( = ?auto_249537 ?auto_249545 ) ) ( not ( = ?auto_249537 ?auto_249546 ) ) ( not ( = ?auto_249537 ?auto_249547 ) ) ( not ( = ?auto_249537 ?auto_249548 ) ) ( not ( = ?auto_249537 ?auto_249549 ) ) ( not ( = ?auto_249538 ?auto_249539 ) ) ( not ( = ?auto_249538 ?auto_249540 ) ) ( not ( = ?auto_249538 ?auto_249541 ) ) ( not ( = ?auto_249538 ?auto_249542 ) ) ( not ( = ?auto_249538 ?auto_249543 ) ) ( not ( = ?auto_249538 ?auto_249544 ) ) ( not ( = ?auto_249538 ?auto_249545 ) ) ( not ( = ?auto_249538 ?auto_249546 ) ) ( not ( = ?auto_249538 ?auto_249547 ) ) ( not ( = ?auto_249538 ?auto_249548 ) ) ( not ( = ?auto_249538 ?auto_249549 ) ) ( not ( = ?auto_249539 ?auto_249540 ) ) ( not ( = ?auto_249539 ?auto_249541 ) ) ( not ( = ?auto_249539 ?auto_249542 ) ) ( not ( = ?auto_249539 ?auto_249543 ) ) ( not ( = ?auto_249539 ?auto_249544 ) ) ( not ( = ?auto_249539 ?auto_249545 ) ) ( not ( = ?auto_249539 ?auto_249546 ) ) ( not ( = ?auto_249539 ?auto_249547 ) ) ( not ( = ?auto_249539 ?auto_249548 ) ) ( not ( = ?auto_249539 ?auto_249549 ) ) ( not ( = ?auto_249540 ?auto_249541 ) ) ( not ( = ?auto_249540 ?auto_249542 ) ) ( not ( = ?auto_249540 ?auto_249543 ) ) ( not ( = ?auto_249540 ?auto_249544 ) ) ( not ( = ?auto_249540 ?auto_249545 ) ) ( not ( = ?auto_249540 ?auto_249546 ) ) ( not ( = ?auto_249540 ?auto_249547 ) ) ( not ( = ?auto_249540 ?auto_249548 ) ) ( not ( = ?auto_249540 ?auto_249549 ) ) ( not ( = ?auto_249541 ?auto_249542 ) ) ( not ( = ?auto_249541 ?auto_249543 ) ) ( not ( = ?auto_249541 ?auto_249544 ) ) ( not ( = ?auto_249541 ?auto_249545 ) ) ( not ( = ?auto_249541 ?auto_249546 ) ) ( not ( = ?auto_249541 ?auto_249547 ) ) ( not ( = ?auto_249541 ?auto_249548 ) ) ( not ( = ?auto_249541 ?auto_249549 ) ) ( not ( = ?auto_249542 ?auto_249543 ) ) ( not ( = ?auto_249542 ?auto_249544 ) ) ( not ( = ?auto_249542 ?auto_249545 ) ) ( not ( = ?auto_249542 ?auto_249546 ) ) ( not ( = ?auto_249542 ?auto_249547 ) ) ( not ( = ?auto_249542 ?auto_249548 ) ) ( not ( = ?auto_249542 ?auto_249549 ) ) ( not ( = ?auto_249543 ?auto_249544 ) ) ( not ( = ?auto_249543 ?auto_249545 ) ) ( not ( = ?auto_249543 ?auto_249546 ) ) ( not ( = ?auto_249543 ?auto_249547 ) ) ( not ( = ?auto_249543 ?auto_249548 ) ) ( not ( = ?auto_249543 ?auto_249549 ) ) ( not ( = ?auto_249544 ?auto_249545 ) ) ( not ( = ?auto_249544 ?auto_249546 ) ) ( not ( = ?auto_249544 ?auto_249547 ) ) ( not ( = ?auto_249544 ?auto_249548 ) ) ( not ( = ?auto_249544 ?auto_249549 ) ) ( not ( = ?auto_249545 ?auto_249546 ) ) ( not ( = ?auto_249545 ?auto_249547 ) ) ( not ( = ?auto_249545 ?auto_249548 ) ) ( not ( = ?auto_249545 ?auto_249549 ) ) ( not ( = ?auto_249546 ?auto_249547 ) ) ( not ( = ?auto_249546 ?auto_249548 ) ) ( not ( = ?auto_249546 ?auto_249549 ) ) ( not ( = ?auto_249547 ?auto_249548 ) ) ( not ( = ?auto_249547 ?auto_249549 ) ) ( not ( = ?auto_249548 ?auto_249549 ) ) ( ON ?auto_249547 ?auto_249548 ) ( ON ?auto_249546 ?auto_249547 ) ( ON ?auto_249545 ?auto_249546 ) ( CLEAR ?auto_249543 ) ( ON ?auto_249544 ?auto_249545 ) ( CLEAR ?auto_249544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_249537 ?auto_249538 ?auto_249539 ?auto_249540 ?auto_249541 ?auto_249542 ?auto_249543 ?auto_249544 )
      ( MAKE-12PILE ?auto_249537 ?auto_249538 ?auto_249539 ?auto_249540 ?auto_249541 ?auto_249542 ?auto_249543 ?auto_249544 ?auto_249545 ?auto_249546 ?auto_249547 ?auto_249548 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249562 - BLOCK
      ?auto_249563 - BLOCK
      ?auto_249564 - BLOCK
      ?auto_249565 - BLOCK
      ?auto_249566 - BLOCK
      ?auto_249567 - BLOCK
      ?auto_249568 - BLOCK
      ?auto_249569 - BLOCK
      ?auto_249570 - BLOCK
      ?auto_249571 - BLOCK
      ?auto_249572 - BLOCK
      ?auto_249573 - BLOCK
    )
    :vars
    (
      ?auto_249574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249573 ?auto_249574 ) ( ON-TABLE ?auto_249562 ) ( ON ?auto_249563 ?auto_249562 ) ( ON ?auto_249564 ?auto_249563 ) ( ON ?auto_249565 ?auto_249564 ) ( ON ?auto_249566 ?auto_249565 ) ( ON ?auto_249567 ?auto_249566 ) ( not ( = ?auto_249562 ?auto_249563 ) ) ( not ( = ?auto_249562 ?auto_249564 ) ) ( not ( = ?auto_249562 ?auto_249565 ) ) ( not ( = ?auto_249562 ?auto_249566 ) ) ( not ( = ?auto_249562 ?auto_249567 ) ) ( not ( = ?auto_249562 ?auto_249568 ) ) ( not ( = ?auto_249562 ?auto_249569 ) ) ( not ( = ?auto_249562 ?auto_249570 ) ) ( not ( = ?auto_249562 ?auto_249571 ) ) ( not ( = ?auto_249562 ?auto_249572 ) ) ( not ( = ?auto_249562 ?auto_249573 ) ) ( not ( = ?auto_249562 ?auto_249574 ) ) ( not ( = ?auto_249563 ?auto_249564 ) ) ( not ( = ?auto_249563 ?auto_249565 ) ) ( not ( = ?auto_249563 ?auto_249566 ) ) ( not ( = ?auto_249563 ?auto_249567 ) ) ( not ( = ?auto_249563 ?auto_249568 ) ) ( not ( = ?auto_249563 ?auto_249569 ) ) ( not ( = ?auto_249563 ?auto_249570 ) ) ( not ( = ?auto_249563 ?auto_249571 ) ) ( not ( = ?auto_249563 ?auto_249572 ) ) ( not ( = ?auto_249563 ?auto_249573 ) ) ( not ( = ?auto_249563 ?auto_249574 ) ) ( not ( = ?auto_249564 ?auto_249565 ) ) ( not ( = ?auto_249564 ?auto_249566 ) ) ( not ( = ?auto_249564 ?auto_249567 ) ) ( not ( = ?auto_249564 ?auto_249568 ) ) ( not ( = ?auto_249564 ?auto_249569 ) ) ( not ( = ?auto_249564 ?auto_249570 ) ) ( not ( = ?auto_249564 ?auto_249571 ) ) ( not ( = ?auto_249564 ?auto_249572 ) ) ( not ( = ?auto_249564 ?auto_249573 ) ) ( not ( = ?auto_249564 ?auto_249574 ) ) ( not ( = ?auto_249565 ?auto_249566 ) ) ( not ( = ?auto_249565 ?auto_249567 ) ) ( not ( = ?auto_249565 ?auto_249568 ) ) ( not ( = ?auto_249565 ?auto_249569 ) ) ( not ( = ?auto_249565 ?auto_249570 ) ) ( not ( = ?auto_249565 ?auto_249571 ) ) ( not ( = ?auto_249565 ?auto_249572 ) ) ( not ( = ?auto_249565 ?auto_249573 ) ) ( not ( = ?auto_249565 ?auto_249574 ) ) ( not ( = ?auto_249566 ?auto_249567 ) ) ( not ( = ?auto_249566 ?auto_249568 ) ) ( not ( = ?auto_249566 ?auto_249569 ) ) ( not ( = ?auto_249566 ?auto_249570 ) ) ( not ( = ?auto_249566 ?auto_249571 ) ) ( not ( = ?auto_249566 ?auto_249572 ) ) ( not ( = ?auto_249566 ?auto_249573 ) ) ( not ( = ?auto_249566 ?auto_249574 ) ) ( not ( = ?auto_249567 ?auto_249568 ) ) ( not ( = ?auto_249567 ?auto_249569 ) ) ( not ( = ?auto_249567 ?auto_249570 ) ) ( not ( = ?auto_249567 ?auto_249571 ) ) ( not ( = ?auto_249567 ?auto_249572 ) ) ( not ( = ?auto_249567 ?auto_249573 ) ) ( not ( = ?auto_249567 ?auto_249574 ) ) ( not ( = ?auto_249568 ?auto_249569 ) ) ( not ( = ?auto_249568 ?auto_249570 ) ) ( not ( = ?auto_249568 ?auto_249571 ) ) ( not ( = ?auto_249568 ?auto_249572 ) ) ( not ( = ?auto_249568 ?auto_249573 ) ) ( not ( = ?auto_249568 ?auto_249574 ) ) ( not ( = ?auto_249569 ?auto_249570 ) ) ( not ( = ?auto_249569 ?auto_249571 ) ) ( not ( = ?auto_249569 ?auto_249572 ) ) ( not ( = ?auto_249569 ?auto_249573 ) ) ( not ( = ?auto_249569 ?auto_249574 ) ) ( not ( = ?auto_249570 ?auto_249571 ) ) ( not ( = ?auto_249570 ?auto_249572 ) ) ( not ( = ?auto_249570 ?auto_249573 ) ) ( not ( = ?auto_249570 ?auto_249574 ) ) ( not ( = ?auto_249571 ?auto_249572 ) ) ( not ( = ?auto_249571 ?auto_249573 ) ) ( not ( = ?auto_249571 ?auto_249574 ) ) ( not ( = ?auto_249572 ?auto_249573 ) ) ( not ( = ?auto_249572 ?auto_249574 ) ) ( not ( = ?auto_249573 ?auto_249574 ) ) ( ON ?auto_249572 ?auto_249573 ) ( ON ?auto_249571 ?auto_249572 ) ( ON ?auto_249570 ?auto_249571 ) ( ON ?auto_249569 ?auto_249570 ) ( CLEAR ?auto_249567 ) ( ON ?auto_249568 ?auto_249569 ) ( CLEAR ?auto_249568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_249562 ?auto_249563 ?auto_249564 ?auto_249565 ?auto_249566 ?auto_249567 ?auto_249568 )
      ( MAKE-12PILE ?auto_249562 ?auto_249563 ?auto_249564 ?auto_249565 ?auto_249566 ?auto_249567 ?auto_249568 ?auto_249569 ?auto_249570 ?auto_249571 ?auto_249572 ?auto_249573 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249587 - BLOCK
      ?auto_249588 - BLOCK
      ?auto_249589 - BLOCK
      ?auto_249590 - BLOCK
      ?auto_249591 - BLOCK
      ?auto_249592 - BLOCK
      ?auto_249593 - BLOCK
      ?auto_249594 - BLOCK
      ?auto_249595 - BLOCK
      ?auto_249596 - BLOCK
      ?auto_249597 - BLOCK
      ?auto_249598 - BLOCK
    )
    :vars
    (
      ?auto_249599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249598 ?auto_249599 ) ( ON-TABLE ?auto_249587 ) ( ON ?auto_249588 ?auto_249587 ) ( ON ?auto_249589 ?auto_249588 ) ( ON ?auto_249590 ?auto_249589 ) ( ON ?auto_249591 ?auto_249590 ) ( ON ?auto_249592 ?auto_249591 ) ( not ( = ?auto_249587 ?auto_249588 ) ) ( not ( = ?auto_249587 ?auto_249589 ) ) ( not ( = ?auto_249587 ?auto_249590 ) ) ( not ( = ?auto_249587 ?auto_249591 ) ) ( not ( = ?auto_249587 ?auto_249592 ) ) ( not ( = ?auto_249587 ?auto_249593 ) ) ( not ( = ?auto_249587 ?auto_249594 ) ) ( not ( = ?auto_249587 ?auto_249595 ) ) ( not ( = ?auto_249587 ?auto_249596 ) ) ( not ( = ?auto_249587 ?auto_249597 ) ) ( not ( = ?auto_249587 ?auto_249598 ) ) ( not ( = ?auto_249587 ?auto_249599 ) ) ( not ( = ?auto_249588 ?auto_249589 ) ) ( not ( = ?auto_249588 ?auto_249590 ) ) ( not ( = ?auto_249588 ?auto_249591 ) ) ( not ( = ?auto_249588 ?auto_249592 ) ) ( not ( = ?auto_249588 ?auto_249593 ) ) ( not ( = ?auto_249588 ?auto_249594 ) ) ( not ( = ?auto_249588 ?auto_249595 ) ) ( not ( = ?auto_249588 ?auto_249596 ) ) ( not ( = ?auto_249588 ?auto_249597 ) ) ( not ( = ?auto_249588 ?auto_249598 ) ) ( not ( = ?auto_249588 ?auto_249599 ) ) ( not ( = ?auto_249589 ?auto_249590 ) ) ( not ( = ?auto_249589 ?auto_249591 ) ) ( not ( = ?auto_249589 ?auto_249592 ) ) ( not ( = ?auto_249589 ?auto_249593 ) ) ( not ( = ?auto_249589 ?auto_249594 ) ) ( not ( = ?auto_249589 ?auto_249595 ) ) ( not ( = ?auto_249589 ?auto_249596 ) ) ( not ( = ?auto_249589 ?auto_249597 ) ) ( not ( = ?auto_249589 ?auto_249598 ) ) ( not ( = ?auto_249589 ?auto_249599 ) ) ( not ( = ?auto_249590 ?auto_249591 ) ) ( not ( = ?auto_249590 ?auto_249592 ) ) ( not ( = ?auto_249590 ?auto_249593 ) ) ( not ( = ?auto_249590 ?auto_249594 ) ) ( not ( = ?auto_249590 ?auto_249595 ) ) ( not ( = ?auto_249590 ?auto_249596 ) ) ( not ( = ?auto_249590 ?auto_249597 ) ) ( not ( = ?auto_249590 ?auto_249598 ) ) ( not ( = ?auto_249590 ?auto_249599 ) ) ( not ( = ?auto_249591 ?auto_249592 ) ) ( not ( = ?auto_249591 ?auto_249593 ) ) ( not ( = ?auto_249591 ?auto_249594 ) ) ( not ( = ?auto_249591 ?auto_249595 ) ) ( not ( = ?auto_249591 ?auto_249596 ) ) ( not ( = ?auto_249591 ?auto_249597 ) ) ( not ( = ?auto_249591 ?auto_249598 ) ) ( not ( = ?auto_249591 ?auto_249599 ) ) ( not ( = ?auto_249592 ?auto_249593 ) ) ( not ( = ?auto_249592 ?auto_249594 ) ) ( not ( = ?auto_249592 ?auto_249595 ) ) ( not ( = ?auto_249592 ?auto_249596 ) ) ( not ( = ?auto_249592 ?auto_249597 ) ) ( not ( = ?auto_249592 ?auto_249598 ) ) ( not ( = ?auto_249592 ?auto_249599 ) ) ( not ( = ?auto_249593 ?auto_249594 ) ) ( not ( = ?auto_249593 ?auto_249595 ) ) ( not ( = ?auto_249593 ?auto_249596 ) ) ( not ( = ?auto_249593 ?auto_249597 ) ) ( not ( = ?auto_249593 ?auto_249598 ) ) ( not ( = ?auto_249593 ?auto_249599 ) ) ( not ( = ?auto_249594 ?auto_249595 ) ) ( not ( = ?auto_249594 ?auto_249596 ) ) ( not ( = ?auto_249594 ?auto_249597 ) ) ( not ( = ?auto_249594 ?auto_249598 ) ) ( not ( = ?auto_249594 ?auto_249599 ) ) ( not ( = ?auto_249595 ?auto_249596 ) ) ( not ( = ?auto_249595 ?auto_249597 ) ) ( not ( = ?auto_249595 ?auto_249598 ) ) ( not ( = ?auto_249595 ?auto_249599 ) ) ( not ( = ?auto_249596 ?auto_249597 ) ) ( not ( = ?auto_249596 ?auto_249598 ) ) ( not ( = ?auto_249596 ?auto_249599 ) ) ( not ( = ?auto_249597 ?auto_249598 ) ) ( not ( = ?auto_249597 ?auto_249599 ) ) ( not ( = ?auto_249598 ?auto_249599 ) ) ( ON ?auto_249597 ?auto_249598 ) ( ON ?auto_249596 ?auto_249597 ) ( ON ?auto_249595 ?auto_249596 ) ( ON ?auto_249594 ?auto_249595 ) ( CLEAR ?auto_249592 ) ( ON ?auto_249593 ?auto_249594 ) ( CLEAR ?auto_249593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_249587 ?auto_249588 ?auto_249589 ?auto_249590 ?auto_249591 ?auto_249592 ?auto_249593 )
      ( MAKE-12PILE ?auto_249587 ?auto_249588 ?auto_249589 ?auto_249590 ?auto_249591 ?auto_249592 ?auto_249593 ?auto_249594 ?auto_249595 ?auto_249596 ?auto_249597 ?auto_249598 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249612 - BLOCK
      ?auto_249613 - BLOCK
      ?auto_249614 - BLOCK
      ?auto_249615 - BLOCK
      ?auto_249616 - BLOCK
      ?auto_249617 - BLOCK
      ?auto_249618 - BLOCK
      ?auto_249619 - BLOCK
      ?auto_249620 - BLOCK
      ?auto_249621 - BLOCK
      ?auto_249622 - BLOCK
      ?auto_249623 - BLOCK
    )
    :vars
    (
      ?auto_249624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249623 ?auto_249624 ) ( ON-TABLE ?auto_249612 ) ( ON ?auto_249613 ?auto_249612 ) ( ON ?auto_249614 ?auto_249613 ) ( ON ?auto_249615 ?auto_249614 ) ( ON ?auto_249616 ?auto_249615 ) ( not ( = ?auto_249612 ?auto_249613 ) ) ( not ( = ?auto_249612 ?auto_249614 ) ) ( not ( = ?auto_249612 ?auto_249615 ) ) ( not ( = ?auto_249612 ?auto_249616 ) ) ( not ( = ?auto_249612 ?auto_249617 ) ) ( not ( = ?auto_249612 ?auto_249618 ) ) ( not ( = ?auto_249612 ?auto_249619 ) ) ( not ( = ?auto_249612 ?auto_249620 ) ) ( not ( = ?auto_249612 ?auto_249621 ) ) ( not ( = ?auto_249612 ?auto_249622 ) ) ( not ( = ?auto_249612 ?auto_249623 ) ) ( not ( = ?auto_249612 ?auto_249624 ) ) ( not ( = ?auto_249613 ?auto_249614 ) ) ( not ( = ?auto_249613 ?auto_249615 ) ) ( not ( = ?auto_249613 ?auto_249616 ) ) ( not ( = ?auto_249613 ?auto_249617 ) ) ( not ( = ?auto_249613 ?auto_249618 ) ) ( not ( = ?auto_249613 ?auto_249619 ) ) ( not ( = ?auto_249613 ?auto_249620 ) ) ( not ( = ?auto_249613 ?auto_249621 ) ) ( not ( = ?auto_249613 ?auto_249622 ) ) ( not ( = ?auto_249613 ?auto_249623 ) ) ( not ( = ?auto_249613 ?auto_249624 ) ) ( not ( = ?auto_249614 ?auto_249615 ) ) ( not ( = ?auto_249614 ?auto_249616 ) ) ( not ( = ?auto_249614 ?auto_249617 ) ) ( not ( = ?auto_249614 ?auto_249618 ) ) ( not ( = ?auto_249614 ?auto_249619 ) ) ( not ( = ?auto_249614 ?auto_249620 ) ) ( not ( = ?auto_249614 ?auto_249621 ) ) ( not ( = ?auto_249614 ?auto_249622 ) ) ( not ( = ?auto_249614 ?auto_249623 ) ) ( not ( = ?auto_249614 ?auto_249624 ) ) ( not ( = ?auto_249615 ?auto_249616 ) ) ( not ( = ?auto_249615 ?auto_249617 ) ) ( not ( = ?auto_249615 ?auto_249618 ) ) ( not ( = ?auto_249615 ?auto_249619 ) ) ( not ( = ?auto_249615 ?auto_249620 ) ) ( not ( = ?auto_249615 ?auto_249621 ) ) ( not ( = ?auto_249615 ?auto_249622 ) ) ( not ( = ?auto_249615 ?auto_249623 ) ) ( not ( = ?auto_249615 ?auto_249624 ) ) ( not ( = ?auto_249616 ?auto_249617 ) ) ( not ( = ?auto_249616 ?auto_249618 ) ) ( not ( = ?auto_249616 ?auto_249619 ) ) ( not ( = ?auto_249616 ?auto_249620 ) ) ( not ( = ?auto_249616 ?auto_249621 ) ) ( not ( = ?auto_249616 ?auto_249622 ) ) ( not ( = ?auto_249616 ?auto_249623 ) ) ( not ( = ?auto_249616 ?auto_249624 ) ) ( not ( = ?auto_249617 ?auto_249618 ) ) ( not ( = ?auto_249617 ?auto_249619 ) ) ( not ( = ?auto_249617 ?auto_249620 ) ) ( not ( = ?auto_249617 ?auto_249621 ) ) ( not ( = ?auto_249617 ?auto_249622 ) ) ( not ( = ?auto_249617 ?auto_249623 ) ) ( not ( = ?auto_249617 ?auto_249624 ) ) ( not ( = ?auto_249618 ?auto_249619 ) ) ( not ( = ?auto_249618 ?auto_249620 ) ) ( not ( = ?auto_249618 ?auto_249621 ) ) ( not ( = ?auto_249618 ?auto_249622 ) ) ( not ( = ?auto_249618 ?auto_249623 ) ) ( not ( = ?auto_249618 ?auto_249624 ) ) ( not ( = ?auto_249619 ?auto_249620 ) ) ( not ( = ?auto_249619 ?auto_249621 ) ) ( not ( = ?auto_249619 ?auto_249622 ) ) ( not ( = ?auto_249619 ?auto_249623 ) ) ( not ( = ?auto_249619 ?auto_249624 ) ) ( not ( = ?auto_249620 ?auto_249621 ) ) ( not ( = ?auto_249620 ?auto_249622 ) ) ( not ( = ?auto_249620 ?auto_249623 ) ) ( not ( = ?auto_249620 ?auto_249624 ) ) ( not ( = ?auto_249621 ?auto_249622 ) ) ( not ( = ?auto_249621 ?auto_249623 ) ) ( not ( = ?auto_249621 ?auto_249624 ) ) ( not ( = ?auto_249622 ?auto_249623 ) ) ( not ( = ?auto_249622 ?auto_249624 ) ) ( not ( = ?auto_249623 ?auto_249624 ) ) ( ON ?auto_249622 ?auto_249623 ) ( ON ?auto_249621 ?auto_249622 ) ( ON ?auto_249620 ?auto_249621 ) ( ON ?auto_249619 ?auto_249620 ) ( ON ?auto_249618 ?auto_249619 ) ( CLEAR ?auto_249616 ) ( ON ?auto_249617 ?auto_249618 ) ( CLEAR ?auto_249617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249612 ?auto_249613 ?auto_249614 ?auto_249615 ?auto_249616 ?auto_249617 )
      ( MAKE-12PILE ?auto_249612 ?auto_249613 ?auto_249614 ?auto_249615 ?auto_249616 ?auto_249617 ?auto_249618 ?auto_249619 ?auto_249620 ?auto_249621 ?auto_249622 ?auto_249623 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249637 - BLOCK
      ?auto_249638 - BLOCK
      ?auto_249639 - BLOCK
      ?auto_249640 - BLOCK
      ?auto_249641 - BLOCK
      ?auto_249642 - BLOCK
      ?auto_249643 - BLOCK
      ?auto_249644 - BLOCK
      ?auto_249645 - BLOCK
      ?auto_249646 - BLOCK
      ?auto_249647 - BLOCK
      ?auto_249648 - BLOCK
    )
    :vars
    (
      ?auto_249649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249648 ?auto_249649 ) ( ON-TABLE ?auto_249637 ) ( ON ?auto_249638 ?auto_249637 ) ( ON ?auto_249639 ?auto_249638 ) ( ON ?auto_249640 ?auto_249639 ) ( ON ?auto_249641 ?auto_249640 ) ( not ( = ?auto_249637 ?auto_249638 ) ) ( not ( = ?auto_249637 ?auto_249639 ) ) ( not ( = ?auto_249637 ?auto_249640 ) ) ( not ( = ?auto_249637 ?auto_249641 ) ) ( not ( = ?auto_249637 ?auto_249642 ) ) ( not ( = ?auto_249637 ?auto_249643 ) ) ( not ( = ?auto_249637 ?auto_249644 ) ) ( not ( = ?auto_249637 ?auto_249645 ) ) ( not ( = ?auto_249637 ?auto_249646 ) ) ( not ( = ?auto_249637 ?auto_249647 ) ) ( not ( = ?auto_249637 ?auto_249648 ) ) ( not ( = ?auto_249637 ?auto_249649 ) ) ( not ( = ?auto_249638 ?auto_249639 ) ) ( not ( = ?auto_249638 ?auto_249640 ) ) ( not ( = ?auto_249638 ?auto_249641 ) ) ( not ( = ?auto_249638 ?auto_249642 ) ) ( not ( = ?auto_249638 ?auto_249643 ) ) ( not ( = ?auto_249638 ?auto_249644 ) ) ( not ( = ?auto_249638 ?auto_249645 ) ) ( not ( = ?auto_249638 ?auto_249646 ) ) ( not ( = ?auto_249638 ?auto_249647 ) ) ( not ( = ?auto_249638 ?auto_249648 ) ) ( not ( = ?auto_249638 ?auto_249649 ) ) ( not ( = ?auto_249639 ?auto_249640 ) ) ( not ( = ?auto_249639 ?auto_249641 ) ) ( not ( = ?auto_249639 ?auto_249642 ) ) ( not ( = ?auto_249639 ?auto_249643 ) ) ( not ( = ?auto_249639 ?auto_249644 ) ) ( not ( = ?auto_249639 ?auto_249645 ) ) ( not ( = ?auto_249639 ?auto_249646 ) ) ( not ( = ?auto_249639 ?auto_249647 ) ) ( not ( = ?auto_249639 ?auto_249648 ) ) ( not ( = ?auto_249639 ?auto_249649 ) ) ( not ( = ?auto_249640 ?auto_249641 ) ) ( not ( = ?auto_249640 ?auto_249642 ) ) ( not ( = ?auto_249640 ?auto_249643 ) ) ( not ( = ?auto_249640 ?auto_249644 ) ) ( not ( = ?auto_249640 ?auto_249645 ) ) ( not ( = ?auto_249640 ?auto_249646 ) ) ( not ( = ?auto_249640 ?auto_249647 ) ) ( not ( = ?auto_249640 ?auto_249648 ) ) ( not ( = ?auto_249640 ?auto_249649 ) ) ( not ( = ?auto_249641 ?auto_249642 ) ) ( not ( = ?auto_249641 ?auto_249643 ) ) ( not ( = ?auto_249641 ?auto_249644 ) ) ( not ( = ?auto_249641 ?auto_249645 ) ) ( not ( = ?auto_249641 ?auto_249646 ) ) ( not ( = ?auto_249641 ?auto_249647 ) ) ( not ( = ?auto_249641 ?auto_249648 ) ) ( not ( = ?auto_249641 ?auto_249649 ) ) ( not ( = ?auto_249642 ?auto_249643 ) ) ( not ( = ?auto_249642 ?auto_249644 ) ) ( not ( = ?auto_249642 ?auto_249645 ) ) ( not ( = ?auto_249642 ?auto_249646 ) ) ( not ( = ?auto_249642 ?auto_249647 ) ) ( not ( = ?auto_249642 ?auto_249648 ) ) ( not ( = ?auto_249642 ?auto_249649 ) ) ( not ( = ?auto_249643 ?auto_249644 ) ) ( not ( = ?auto_249643 ?auto_249645 ) ) ( not ( = ?auto_249643 ?auto_249646 ) ) ( not ( = ?auto_249643 ?auto_249647 ) ) ( not ( = ?auto_249643 ?auto_249648 ) ) ( not ( = ?auto_249643 ?auto_249649 ) ) ( not ( = ?auto_249644 ?auto_249645 ) ) ( not ( = ?auto_249644 ?auto_249646 ) ) ( not ( = ?auto_249644 ?auto_249647 ) ) ( not ( = ?auto_249644 ?auto_249648 ) ) ( not ( = ?auto_249644 ?auto_249649 ) ) ( not ( = ?auto_249645 ?auto_249646 ) ) ( not ( = ?auto_249645 ?auto_249647 ) ) ( not ( = ?auto_249645 ?auto_249648 ) ) ( not ( = ?auto_249645 ?auto_249649 ) ) ( not ( = ?auto_249646 ?auto_249647 ) ) ( not ( = ?auto_249646 ?auto_249648 ) ) ( not ( = ?auto_249646 ?auto_249649 ) ) ( not ( = ?auto_249647 ?auto_249648 ) ) ( not ( = ?auto_249647 ?auto_249649 ) ) ( not ( = ?auto_249648 ?auto_249649 ) ) ( ON ?auto_249647 ?auto_249648 ) ( ON ?auto_249646 ?auto_249647 ) ( ON ?auto_249645 ?auto_249646 ) ( ON ?auto_249644 ?auto_249645 ) ( ON ?auto_249643 ?auto_249644 ) ( CLEAR ?auto_249641 ) ( ON ?auto_249642 ?auto_249643 ) ( CLEAR ?auto_249642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_249637 ?auto_249638 ?auto_249639 ?auto_249640 ?auto_249641 ?auto_249642 )
      ( MAKE-12PILE ?auto_249637 ?auto_249638 ?auto_249639 ?auto_249640 ?auto_249641 ?auto_249642 ?auto_249643 ?auto_249644 ?auto_249645 ?auto_249646 ?auto_249647 ?auto_249648 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249662 - BLOCK
      ?auto_249663 - BLOCK
      ?auto_249664 - BLOCK
      ?auto_249665 - BLOCK
      ?auto_249666 - BLOCK
      ?auto_249667 - BLOCK
      ?auto_249668 - BLOCK
      ?auto_249669 - BLOCK
      ?auto_249670 - BLOCK
      ?auto_249671 - BLOCK
      ?auto_249672 - BLOCK
      ?auto_249673 - BLOCK
    )
    :vars
    (
      ?auto_249674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249673 ?auto_249674 ) ( ON-TABLE ?auto_249662 ) ( ON ?auto_249663 ?auto_249662 ) ( ON ?auto_249664 ?auto_249663 ) ( ON ?auto_249665 ?auto_249664 ) ( not ( = ?auto_249662 ?auto_249663 ) ) ( not ( = ?auto_249662 ?auto_249664 ) ) ( not ( = ?auto_249662 ?auto_249665 ) ) ( not ( = ?auto_249662 ?auto_249666 ) ) ( not ( = ?auto_249662 ?auto_249667 ) ) ( not ( = ?auto_249662 ?auto_249668 ) ) ( not ( = ?auto_249662 ?auto_249669 ) ) ( not ( = ?auto_249662 ?auto_249670 ) ) ( not ( = ?auto_249662 ?auto_249671 ) ) ( not ( = ?auto_249662 ?auto_249672 ) ) ( not ( = ?auto_249662 ?auto_249673 ) ) ( not ( = ?auto_249662 ?auto_249674 ) ) ( not ( = ?auto_249663 ?auto_249664 ) ) ( not ( = ?auto_249663 ?auto_249665 ) ) ( not ( = ?auto_249663 ?auto_249666 ) ) ( not ( = ?auto_249663 ?auto_249667 ) ) ( not ( = ?auto_249663 ?auto_249668 ) ) ( not ( = ?auto_249663 ?auto_249669 ) ) ( not ( = ?auto_249663 ?auto_249670 ) ) ( not ( = ?auto_249663 ?auto_249671 ) ) ( not ( = ?auto_249663 ?auto_249672 ) ) ( not ( = ?auto_249663 ?auto_249673 ) ) ( not ( = ?auto_249663 ?auto_249674 ) ) ( not ( = ?auto_249664 ?auto_249665 ) ) ( not ( = ?auto_249664 ?auto_249666 ) ) ( not ( = ?auto_249664 ?auto_249667 ) ) ( not ( = ?auto_249664 ?auto_249668 ) ) ( not ( = ?auto_249664 ?auto_249669 ) ) ( not ( = ?auto_249664 ?auto_249670 ) ) ( not ( = ?auto_249664 ?auto_249671 ) ) ( not ( = ?auto_249664 ?auto_249672 ) ) ( not ( = ?auto_249664 ?auto_249673 ) ) ( not ( = ?auto_249664 ?auto_249674 ) ) ( not ( = ?auto_249665 ?auto_249666 ) ) ( not ( = ?auto_249665 ?auto_249667 ) ) ( not ( = ?auto_249665 ?auto_249668 ) ) ( not ( = ?auto_249665 ?auto_249669 ) ) ( not ( = ?auto_249665 ?auto_249670 ) ) ( not ( = ?auto_249665 ?auto_249671 ) ) ( not ( = ?auto_249665 ?auto_249672 ) ) ( not ( = ?auto_249665 ?auto_249673 ) ) ( not ( = ?auto_249665 ?auto_249674 ) ) ( not ( = ?auto_249666 ?auto_249667 ) ) ( not ( = ?auto_249666 ?auto_249668 ) ) ( not ( = ?auto_249666 ?auto_249669 ) ) ( not ( = ?auto_249666 ?auto_249670 ) ) ( not ( = ?auto_249666 ?auto_249671 ) ) ( not ( = ?auto_249666 ?auto_249672 ) ) ( not ( = ?auto_249666 ?auto_249673 ) ) ( not ( = ?auto_249666 ?auto_249674 ) ) ( not ( = ?auto_249667 ?auto_249668 ) ) ( not ( = ?auto_249667 ?auto_249669 ) ) ( not ( = ?auto_249667 ?auto_249670 ) ) ( not ( = ?auto_249667 ?auto_249671 ) ) ( not ( = ?auto_249667 ?auto_249672 ) ) ( not ( = ?auto_249667 ?auto_249673 ) ) ( not ( = ?auto_249667 ?auto_249674 ) ) ( not ( = ?auto_249668 ?auto_249669 ) ) ( not ( = ?auto_249668 ?auto_249670 ) ) ( not ( = ?auto_249668 ?auto_249671 ) ) ( not ( = ?auto_249668 ?auto_249672 ) ) ( not ( = ?auto_249668 ?auto_249673 ) ) ( not ( = ?auto_249668 ?auto_249674 ) ) ( not ( = ?auto_249669 ?auto_249670 ) ) ( not ( = ?auto_249669 ?auto_249671 ) ) ( not ( = ?auto_249669 ?auto_249672 ) ) ( not ( = ?auto_249669 ?auto_249673 ) ) ( not ( = ?auto_249669 ?auto_249674 ) ) ( not ( = ?auto_249670 ?auto_249671 ) ) ( not ( = ?auto_249670 ?auto_249672 ) ) ( not ( = ?auto_249670 ?auto_249673 ) ) ( not ( = ?auto_249670 ?auto_249674 ) ) ( not ( = ?auto_249671 ?auto_249672 ) ) ( not ( = ?auto_249671 ?auto_249673 ) ) ( not ( = ?auto_249671 ?auto_249674 ) ) ( not ( = ?auto_249672 ?auto_249673 ) ) ( not ( = ?auto_249672 ?auto_249674 ) ) ( not ( = ?auto_249673 ?auto_249674 ) ) ( ON ?auto_249672 ?auto_249673 ) ( ON ?auto_249671 ?auto_249672 ) ( ON ?auto_249670 ?auto_249671 ) ( ON ?auto_249669 ?auto_249670 ) ( ON ?auto_249668 ?auto_249669 ) ( ON ?auto_249667 ?auto_249668 ) ( CLEAR ?auto_249665 ) ( ON ?auto_249666 ?auto_249667 ) ( CLEAR ?auto_249666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249662 ?auto_249663 ?auto_249664 ?auto_249665 ?auto_249666 )
      ( MAKE-12PILE ?auto_249662 ?auto_249663 ?auto_249664 ?auto_249665 ?auto_249666 ?auto_249667 ?auto_249668 ?auto_249669 ?auto_249670 ?auto_249671 ?auto_249672 ?auto_249673 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249687 - BLOCK
      ?auto_249688 - BLOCK
      ?auto_249689 - BLOCK
      ?auto_249690 - BLOCK
      ?auto_249691 - BLOCK
      ?auto_249692 - BLOCK
      ?auto_249693 - BLOCK
      ?auto_249694 - BLOCK
      ?auto_249695 - BLOCK
      ?auto_249696 - BLOCK
      ?auto_249697 - BLOCK
      ?auto_249698 - BLOCK
    )
    :vars
    (
      ?auto_249699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249698 ?auto_249699 ) ( ON-TABLE ?auto_249687 ) ( ON ?auto_249688 ?auto_249687 ) ( ON ?auto_249689 ?auto_249688 ) ( ON ?auto_249690 ?auto_249689 ) ( not ( = ?auto_249687 ?auto_249688 ) ) ( not ( = ?auto_249687 ?auto_249689 ) ) ( not ( = ?auto_249687 ?auto_249690 ) ) ( not ( = ?auto_249687 ?auto_249691 ) ) ( not ( = ?auto_249687 ?auto_249692 ) ) ( not ( = ?auto_249687 ?auto_249693 ) ) ( not ( = ?auto_249687 ?auto_249694 ) ) ( not ( = ?auto_249687 ?auto_249695 ) ) ( not ( = ?auto_249687 ?auto_249696 ) ) ( not ( = ?auto_249687 ?auto_249697 ) ) ( not ( = ?auto_249687 ?auto_249698 ) ) ( not ( = ?auto_249687 ?auto_249699 ) ) ( not ( = ?auto_249688 ?auto_249689 ) ) ( not ( = ?auto_249688 ?auto_249690 ) ) ( not ( = ?auto_249688 ?auto_249691 ) ) ( not ( = ?auto_249688 ?auto_249692 ) ) ( not ( = ?auto_249688 ?auto_249693 ) ) ( not ( = ?auto_249688 ?auto_249694 ) ) ( not ( = ?auto_249688 ?auto_249695 ) ) ( not ( = ?auto_249688 ?auto_249696 ) ) ( not ( = ?auto_249688 ?auto_249697 ) ) ( not ( = ?auto_249688 ?auto_249698 ) ) ( not ( = ?auto_249688 ?auto_249699 ) ) ( not ( = ?auto_249689 ?auto_249690 ) ) ( not ( = ?auto_249689 ?auto_249691 ) ) ( not ( = ?auto_249689 ?auto_249692 ) ) ( not ( = ?auto_249689 ?auto_249693 ) ) ( not ( = ?auto_249689 ?auto_249694 ) ) ( not ( = ?auto_249689 ?auto_249695 ) ) ( not ( = ?auto_249689 ?auto_249696 ) ) ( not ( = ?auto_249689 ?auto_249697 ) ) ( not ( = ?auto_249689 ?auto_249698 ) ) ( not ( = ?auto_249689 ?auto_249699 ) ) ( not ( = ?auto_249690 ?auto_249691 ) ) ( not ( = ?auto_249690 ?auto_249692 ) ) ( not ( = ?auto_249690 ?auto_249693 ) ) ( not ( = ?auto_249690 ?auto_249694 ) ) ( not ( = ?auto_249690 ?auto_249695 ) ) ( not ( = ?auto_249690 ?auto_249696 ) ) ( not ( = ?auto_249690 ?auto_249697 ) ) ( not ( = ?auto_249690 ?auto_249698 ) ) ( not ( = ?auto_249690 ?auto_249699 ) ) ( not ( = ?auto_249691 ?auto_249692 ) ) ( not ( = ?auto_249691 ?auto_249693 ) ) ( not ( = ?auto_249691 ?auto_249694 ) ) ( not ( = ?auto_249691 ?auto_249695 ) ) ( not ( = ?auto_249691 ?auto_249696 ) ) ( not ( = ?auto_249691 ?auto_249697 ) ) ( not ( = ?auto_249691 ?auto_249698 ) ) ( not ( = ?auto_249691 ?auto_249699 ) ) ( not ( = ?auto_249692 ?auto_249693 ) ) ( not ( = ?auto_249692 ?auto_249694 ) ) ( not ( = ?auto_249692 ?auto_249695 ) ) ( not ( = ?auto_249692 ?auto_249696 ) ) ( not ( = ?auto_249692 ?auto_249697 ) ) ( not ( = ?auto_249692 ?auto_249698 ) ) ( not ( = ?auto_249692 ?auto_249699 ) ) ( not ( = ?auto_249693 ?auto_249694 ) ) ( not ( = ?auto_249693 ?auto_249695 ) ) ( not ( = ?auto_249693 ?auto_249696 ) ) ( not ( = ?auto_249693 ?auto_249697 ) ) ( not ( = ?auto_249693 ?auto_249698 ) ) ( not ( = ?auto_249693 ?auto_249699 ) ) ( not ( = ?auto_249694 ?auto_249695 ) ) ( not ( = ?auto_249694 ?auto_249696 ) ) ( not ( = ?auto_249694 ?auto_249697 ) ) ( not ( = ?auto_249694 ?auto_249698 ) ) ( not ( = ?auto_249694 ?auto_249699 ) ) ( not ( = ?auto_249695 ?auto_249696 ) ) ( not ( = ?auto_249695 ?auto_249697 ) ) ( not ( = ?auto_249695 ?auto_249698 ) ) ( not ( = ?auto_249695 ?auto_249699 ) ) ( not ( = ?auto_249696 ?auto_249697 ) ) ( not ( = ?auto_249696 ?auto_249698 ) ) ( not ( = ?auto_249696 ?auto_249699 ) ) ( not ( = ?auto_249697 ?auto_249698 ) ) ( not ( = ?auto_249697 ?auto_249699 ) ) ( not ( = ?auto_249698 ?auto_249699 ) ) ( ON ?auto_249697 ?auto_249698 ) ( ON ?auto_249696 ?auto_249697 ) ( ON ?auto_249695 ?auto_249696 ) ( ON ?auto_249694 ?auto_249695 ) ( ON ?auto_249693 ?auto_249694 ) ( ON ?auto_249692 ?auto_249693 ) ( CLEAR ?auto_249690 ) ( ON ?auto_249691 ?auto_249692 ) ( CLEAR ?auto_249691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_249687 ?auto_249688 ?auto_249689 ?auto_249690 ?auto_249691 )
      ( MAKE-12PILE ?auto_249687 ?auto_249688 ?auto_249689 ?auto_249690 ?auto_249691 ?auto_249692 ?auto_249693 ?auto_249694 ?auto_249695 ?auto_249696 ?auto_249697 ?auto_249698 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249712 - BLOCK
      ?auto_249713 - BLOCK
      ?auto_249714 - BLOCK
      ?auto_249715 - BLOCK
      ?auto_249716 - BLOCK
      ?auto_249717 - BLOCK
      ?auto_249718 - BLOCK
      ?auto_249719 - BLOCK
      ?auto_249720 - BLOCK
      ?auto_249721 - BLOCK
      ?auto_249722 - BLOCK
      ?auto_249723 - BLOCK
    )
    :vars
    (
      ?auto_249724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249723 ?auto_249724 ) ( ON-TABLE ?auto_249712 ) ( ON ?auto_249713 ?auto_249712 ) ( ON ?auto_249714 ?auto_249713 ) ( not ( = ?auto_249712 ?auto_249713 ) ) ( not ( = ?auto_249712 ?auto_249714 ) ) ( not ( = ?auto_249712 ?auto_249715 ) ) ( not ( = ?auto_249712 ?auto_249716 ) ) ( not ( = ?auto_249712 ?auto_249717 ) ) ( not ( = ?auto_249712 ?auto_249718 ) ) ( not ( = ?auto_249712 ?auto_249719 ) ) ( not ( = ?auto_249712 ?auto_249720 ) ) ( not ( = ?auto_249712 ?auto_249721 ) ) ( not ( = ?auto_249712 ?auto_249722 ) ) ( not ( = ?auto_249712 ?auto_249723 ) ) ( not ( = ?auto_249712 ?auto_249724 ) ) ( not ( = ?auto_249713 ?auto_249714 ) ) ( not ( = ?auto_249713 ?auto_249715 ) ) ( not ( = ?auto_249713 ?auto_249716 ) ) ( not ( = ?auto_249713 ?auto_249717 ) ) ( not ( = ?auto_249713 ?auto_249718 ) ) ( not ( = ?auto_249713 ?auto_249719 ) ) ( not ( = ?auto_249713 ?auto_249720 ) ) ( not ( = ?auto_249713 ?auto_249721 ) ) ( not ( = ?auto_249713 ?auto_249722 ) ) ( not ( = ?auto_249713 ?auto_249723 ) ) ( not ( = ?auto_249713 ?auto_249724 ) ) ( not ( = ?auto_249714 ?auto_249715 ) ) ( not ( = ?auto_249714 ?auto_249716 ) ) ( not ( = ?auto_249714 ?auto_249717 ) ) ( not ( = ?auto_249714 ?auto_249718 ) ) ( not ( = ?auto_249714 ?auto_249719 ) ) ( not ( = ?auto_249714 ?auto_249720 ) ) ( not ( = ?auto_249714 ?auto_249721 ) ) ( not ( = ?auto_249714 ?auto_249722 ) ) ( not ( = ?auto_249714 ?auto_249723 ) ) ( not ( = ?auto_249714 ?auto_249724 ) ) ( not ( = ?auto_249715 ?auto_249716 ) ) ( not ( = ?auto_249715 ?auto_249717 ) ) ( not ( = ?auto_249715 ?auto_249718 ) ) ( not ( = ?auto_249715 ?auto_249719 ) ) ( not ( = ?auto_249715 ?auto_249720 ) ) ( not ( = ?auto_249715 ?auto_249721 ) ) ( not ( = ?auto_249715 ?auto_249722 ) ) ( not ( = ?auto_249715 ?auto_249723 ) ) ( not ( = ?auto_249715 ?auto_249724 ) ) ( not ( = ?auto_249716 ?auto_249717 ) ) ( not ( = ?auto_249716 ?auto_249718 ) ) ( not ( = ?auto_249716 ?auto_249719 ) ) ( not ( = ?auto_249716 ?auto_249720 ) ) ( not ( = ?auto_249716 ?auto_249721 ) ) ( not ( = ?auto_249716 ?auto_249722 ) ) ( not ( = ?auto_249716 ?auto_249723 ) ) ( not ( = ?auto_249716 ?auto_249724 ) ) ( not ( = ?auto_249717 ?auto_249718 ) ) ( not ( = ?auto_249717 ?auto_249719 ) ) ( not ( = ?auto_249717 ?auto_249720 ) ) ( not ( = ?auto_249717 ?auto_249721 ) ) ( not ( = ?auto_249717 ?auto_249722 ) ) ( not ( = ?auto_249717 ?auto_249723 ) ) ( not ( = ?auto_249717 ?auto_249724 ) ) ( not ( = ?auto_249718 ?auto_249719 ) ) ( not ( = ?auto_249718 ?auto_249720 ) ) ( not ( = ?auto_249718 ?auto_249721 ) ) ( not ( = ?auto_249718 ?auto_249722 ) ) ( not ( = ?auto_249718 ?auto_249723 ) ) ( not ( = ?auto_249718 ?auto_249724 ) ) ( not ( = ?auto_249719 ?auto_249720 ) ) ( not ( = ?auto_249719 ?auto_249721 ) ) ( not ( = ?auto_249719 ?auto_249722 ) ) ( not ( = ?auto_249719 ?auto_249723 ) ) ( not ( = ?auto_249719 ?auto_249724 ) ) ( not ( = ?auto_249720 ?auto_249721 ) ) ( not ( = ?auto_249720 ?auto_249722 ) ) ( not ( = ?auto_249720 ?auto_249723 ) ) ( not ( = ?auto_249720 ?auto_249724 ) ) ( not ( = ?auto_249721 ?auto_249722 ) ) ( not ( = ?auto_249721 ?auto_249723 ) ) ( not ( = ?auto_249721 ?auto_249724 ) ) ( not ( = ?auto_249722 ?auto_249723 ) ) ( not ( = ?auto_249722 ?auto_249724 ) ) ( not ( = ?auto_249723 ?auto_249724 ) ) ( ON ?auto_249722 ?auto_249723 ) ( ON ?auto_249721 ?auto_249722 ) ( ON ?auto_249720 ?auto_249721 ) ( ON ?auto_249719 ?auto_249720 ) ( ON ?auto_249718 ?auto_249719 ) ( ON ?auto_249717 ?auto_249718 ) ( ON ?auto_249716 ?auto_249717 ) ( CLEAR ?auto_249714 ) ( ON ?auto_249715 ?auto_249716 ) ( CLEAR ?auto_249715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249712 ?auto_249713 ?auto_249714 ?auto_249715 )
      ( MAKE-12PILE ?auto_249712 ?auto_249713 ?auto_249714 ?auto_249715 ?auto_249716 ?auto_249717 ?auto_249718 ?auto_249719 ?auto_249720 ?auto_249721 ?auto_249722 ?auto_249723 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249737 - BLOCK
      ?auto_249738 - BLOCK
      ?auto_249739 - BLOCK
      ?auto_249740 - BLOCK
      ?auto_249741 - BLOCK
      ?auto_249742 - BLOCK
      ?auto_249743 - BLOCK
      ?auto_249744 - BLOCK
      ?auto_249745 - BLOCK
      ?auto_249746 - BLOCK
      ?auto_249747 - BLOCK
      ?auto_249748 - BLOCK
    )
    :vars
    (
      ?auto_249749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249748 ?auto_249749 ) ( ON-TABLE ?auto_249737 ) ( ON ?auto_249738 ?auto_249737 ) ( ON ?auto_249739 ?auto_249738 ) ( not ( = ?auto_249737 ?auto_249738 ) ) ( not ( = ?auto_249737 ?auto_249739 ) ) ( not ( = ?auto_249737 ?auto_249740 ) ) ( not ( = ?auto_249737 ?auto_249741 ) ) ( not ( = ?auto_249737 ?auto_249742 ) ) ( not ( = ?auto_249737 ?auto_249743 ) ) ( not ( = ?auto_249737 ?auto_249744 ) ) ( not ( = ?auto_249737 ?auto_249745 ) ) ( not ( = ?auto_249737 ?auto_249746 ) ) ( not ( = ?auto_249737 ?auto_249747 ) ) ( not ( = ?auto_249737 ?auto_249748 ) ) ( not ( = ?auto_249737 ?auto_249749 ) ) ( not ( = ?auto_249738 ?auto_249739 ) ) ( not ( = ?auto_249738 ?auto_249740 ) ) ( not ( = ?auto_249738 ?auto_249741 ) ) ( not ( = ?auto_249738 ?auto_249742 ) ) ( not ( = ?auto_249738 ?auto_249743 ) ) ( not ( = ?auto_249738 ?auto_249744 ) ) ( not ( = ?auto_249738 ?auto_249745 ) ) ( not ( = ?auto_249738 ?auto_249746 ) ) ( not ( = ?auto_249738 ?auto_249747 ) ) ( not ( = ?auto_249738 ?auto_249748 ) ) ( not ( = ?auto_249738 ?auto_249749 ) ) ( not ( = ?auto_249739 ?auto_249740 ) ) ( not ( = ?auto_249739 ?auto_249741 ) ) ( not ( = ?auto_249739 ?auto_249742 ) ) ( not ( = ?auto_249739 ?auto_249743 ) ) ( not ( = ?auto_249739 ?auto_249744 ) ) ( not ( = ?auto_249739 ?auto_249745 ) ) ( not ( = ?auto_249739 ?auto_249746 ) ) ( not ( = ?auto_249739 ?auto_249747 ) ) ( not ( = ?auto_249739 ?auto_249748 ) ) ( not ( = ?auto_249739 ?auto_249749 ) ) ( not ( = ?auto_249740 ?auto_249741 ) ) ( not ( = ?auto_249740 ?auto_249742 ) ) ( not ( = ?auto_249740 ?auto_249743 ) ) ( not ( = ?auto_249740 ?auto_249744 ) ) ( not ( = ?auto_249740 ?auto_249745 ) ) ( not ( = ?auto_249740 ?auto_249746 ) ) ( not ( = ?auto_249740 ?auto_249747 ) ) ( not ( = ?auto_249740 ?auto_249748 ) ) ( not ( = ?auto_249740 ?auto_249749 ) ) ( not ( = ?auto_249741 ?auto_249742 ) ) ( not ( = ?auto_249741 ?auto_249743 ) ) ( not ( = ?auto_249741 ?auto_249744 ) ) ( not ( = ?auto_249741 ?auto_249745 ) ) ( not ( = ?auto_249741 ?auto_249746 ) ) ( not ( = ?auto_249741 ?auto_249747 ) ) ( not ( = ?auto_249741 ?auto_249748 ) ) ( not ( = ?auto_249741 ?auto_249749 ) ) ( not ( = ?auto_249742 ?auto_249743 ) ) ( not ( = ?auto_249742 ?auto_249744 ) ) ( not ( = ?auto_249742 ?auto_249745 ) ) ( not ( = ?auto_249742 ?auto_249746 ) ) ( not ( = ?auto_249742 ?auto_249747 ) ) ( not ( = ?auto_249742 ?auto_249748 ) ) ( not ( = ?auto_249742 ?auto_249749 ) ) ( not ( = ?auto_249743 ?auto_249744 ) ) ( not ( = ?auto_249743 ?auto_249745 ) ) ( not ( = ?auto_249743 ?auto_249746 ) ) ( not ( = ?auto_249743 ?auto_249747 ) ) ( not ( = ?auto_249743 ?auto_249748 ) ) ( not ( = ?auto_249743 ?auto_249749 ) ) ( not ( = ?auto_249744 ?auto_249745 ) ) ( not ( = ?auto_249744 ?auto_249746 ) ) ( not ( = ?auto_249744 ?auto_249747 ) ) ( not ( = ?auto_249744 ?auto_249748 ) ) ( not ( = ?auto_249744 ?auto_249749 ) ) ( not ( = ?auto_249745 ?auto_249746 ) ) ( not ( = ?auto_249745 ?auto_249747 ) ) ( not ( = ?auto_249745 ?auto_249748 ) ) ( not ( = ?auto_249745 ?auto_249749 ) ) ( not ( = ?auto_249746 ?auto_249747 ) ) ( not ( = ?auto_249746 ?auto_249748 ) ) ( not ( = ?auto_249746 ?auto_249749 ) ) ( not ( = ?auto_249747 ?auto_249748 ) ) ( not ( = ?auto_249747 ?auto_249749 ) ) ( not ( = ?auto_249748 ?auto_249749 ) ) ( ON ?auto_249747 ?auto_249748 ) ( ON ?auto_249746 ?auto_249747 ) ( ON ?auto_249745 ?auto_249746 ) ( ON ?auto_249744 ?auto_249745 ) ( ON ?auto_249743 ?auto_249744 ) ( ON ?auto_249742 ?auto_249743 ) ( ON ?auto_249741 ?auto_249742 ) ( CLEAR ?auto_249739 ) ( ON ?auto_249740 ?auto_249741 ) ( CLEAR ?auto_249740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_249737 ?auto_249738 ?auto_249739 ?auto_249740 )
      ( MAKE-12PILE ?auto_249737 ?auto_249738 ?auto_249739 ?auto_249740 ?auto_249741 ?auto_249742 ?auto_249743 ?auto_249744 ?auto_249745 ?auto_249746 ?auto_249747 ?auto_249748 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249762 - BLOCK
      ?auto_249763 - BLOCK
      ?auto_249764 - BLOCK
      ?auto_249765 - BLOCK
      ?auto_249766 - BLOCK
      ?auto_249767 - BLOCK
      ?auto_249768 - BLOCK
      ?auto_249769 - BLOCK
      ?auto_249770 - BLOCK
      ?auto_249771 - BLOCK
      ?auto_249772 - BLOCK
      ?auto_249773 - BLOCK
    )
    :vars
    (
      ?auto_249774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249773 ?auto_249774 ) ( ON-TABLE ?auto_249762 ) ( ON ?auto_249763 ?auto_249762 ) ( not ( = ?auto_249762 ?auto_249763 ) ) ( not ( = ?auto_249762 ?auto_249764 ) ) ( not ( = ?auto_249762 ?auto_249765 ) ) ( not ( = ?auto_249762 ?auto_249766 ) ) ( not ( = ?auto_249762 ?auto_249767 ) ) ( not ( = ?auto_249762 ?auto_249768 ) ) ( not ( = ?auto_249762 ?auto_249769 ) ) ( not ( = ?auto_249762 ?auto_249770 ) ) ( not ( = ?auto_249762 ?auto_249771 ) ) ( not ( = ?auto_249762 ?auto_249772 ) ) ( not ( = ?auto_249762 ?auto_249773 ) ) ( not ( = ?auto_249762 ?auto_249774 ) ) ( not ( = ?auto_249763 ?auto_249764 ) ) ( not ( = ?auto_249763 ?auto_249765 ) ) ( not ( = ?auto_249763 ?auto_249766 ) ) ( not ( = ?auto_249763 ?auto_249767 ) ) ( not ( = ?auto_249763 ?auto_249768 ) ) ( not ( = ?auto_249763 ?auto_249769 ) ) ( not ( = ?auto_249763 ?auto_249770 ) ) ( not ( = ?auto_249763 ?auto_249771 ) ) ( not ( = ?auto_249763 ?auto_249772 ) ) ( not ( = ?auto_249763 ?auto_249773 ) ) ( not ( = ?auto_249763 ?auto_249774 ) ) ( not ( = ?auto_249764 ?auto_249765 ) ) ( not ( = ?auto_249764 ?auto_249766 ) ) ( not ( = ?auto_249764 ?auto_249767 ) ) ( not ( = ?auto_249764 ?auto_249768 ) ) ( not ( = ?auto_249764 ?auto_249769 ) ) ( not ( = ?auto_249764 ?auto_249770 ) ) ( not ( = ?auto_249764 ?auto_249771 ) ) ( not ( = ?auto_249764 ?auto_249772 ) ) ( not ( = ?auto_249764 ?auto_249773 ) ) ( not ( = ?auto_249764 ?auto_249774 ) ) ( not ( = ?auto_249765 ?auto_249766 ) ) ( not ( = ?auto_249765 ?auto_249767 ) ) ( not ( = ?auto_249765 ?auto_249768 ) ) ( not ( = ?auto_249765 ?auto_249769 ) ) ( not ( = ?auto_249765 ?auto_249770 ) ) ( not ( = ?auto_249765 ?auto_249771 ) ) ( not ( = ?auto_249765 ?auto_249772 ) ) ( not ( = ?auto_249765 ?auto_249773 ) ) ( not ( = ?auto_249765 ?auto_249774 ) ) ( not ( = ?auto_249766 ?auto_249767 ) ) ( not ( = ?auto_249766 ?auto_249768 ) ) ( not ( = ?auto_249766 ?auto_249769 ) ) ( not ( = ?auto_249766 ?auto_249770 ) ) ( not ( = ?auto_249766 ?auto_249771 ) ) ( not ( = ?auto_249766 ?auto_249772 ) ) ( not ( = ?auto_249766 ?auto_249773 ) ) ( not ( = ?auto_249766 ?auto_249774 ) ) ( not ( = ?auto_249767 ?auto_249768 ) ) ( not ( = ?auto_249767 ?auto_249769 ) ) ( not ( = ?auto_249767 ?auto_249770 ) ) ( not ( = ?auto_249767 ?auto_249771 ) ) ( not ( = ?auto_249767 ?auto_249772 ) ) ( not ( = ?auto_249767 ?auto_249773 ) ) ( not ( = ?auto_249767 ?auto_249774 ) ) ( not ( = ?auto_249768 ?auto_249769 ) ) ( not ( = ?auto_249768 ?auto_249770 ) ) ( not ( = ?auto_249768 ?auto_249771 ) ) ( not ( = ?auto_249768 ?auto_249772 ) ) ( not ( = ?auto_249768 ?auto_249773 ) ) ( not ( = ?auto_249768 ?auto_249774 ) ) ( not ( = ?auto_249769 ?auto_249770 ) ) ( not ( = ?auto_249769 ?auto_249771 ) ) ( not ( = ?auto_249769 ?auto_249772 ) ) ( not ( = ?auto_249769 ?auto_249773 ) ) ( not ( = ?auto_249769 ?auto_249774 ) ) ( not ( = ?auto_249770 ?auto_249771 ) ) ( not ( = ?auto_249770 ?auto_249772 ) ) ( not ( = ?auto_249770 ?auto_249773 ) ) ( not ( = ?auto_249770 ?auto_249774 ) ) ( not ( = ?auto_249771 ?auto_249772 ) ) ( not ( = ?auto_249771 ?auto_249773 ) ) ( not ( = ?auto_249771 ?auto_249774 ) ) ( not ( = ?auto_249772 ?auto_249773 ) ) ( not ( = ?auto_249772 ?auto_249774 ) ) ( not ( = ?auto_249773 ?auto_249774 ) ) ( ON ?auto_249772 ?auto_249773 ) ( ON ?auto_249771 ?auto_249772 ) ( ON ?auto_249770 ?auto_249771 ) ( ON ?auto_249769 ?auto_249770 ) ( ON ?auto_249768 ?auto_249769 ) ( ON ?auto_249767 ?auto_249768 ) ( ON ?auto_249766 ?auto_249767 ) ( ON ?auto_249765 ?auto_249766 ) ( CLEAR ?auto_249763 ) ( ON ?auto_249764 ?auto_249765 ) ( CLEAR ?auto_249764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249762 ?auto_249763 ?auto_249764 )
      ( MAKE-12PILE ?auto_249762 ?auto_249763 ?auto_249764 ?auto_249765 ?auto_249766 ?auto_249767 ?auto_249768 ?auto_249769 ?auto_249770 ?auto_249771 ?auto_249772 ?auto_249773 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249787 - BLOCK
      ?auto_249788 - BLOCK
      ?auto_249789 - BLOCK
      ?auto_249790 - BLOCK
      ?auto_249791 - BLOCK
      ?auto_249792 - BLOCK
      ?auto_249793 - BLOCK
      ?auto_249794 - BLOCK
      ?auto_249795 - BLOCK
      ?auto_249796 - BLOCK
      ?auto_249797 - BLOCK
      ?auto_249798 - BLOCK
    )
    :vars
    (
      ?auto_249799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249798 ?auto_249799 ) ( ON-TABLE ?auto_249787 ) ( ON ?auto_249788 ?auto_249787 ) ( not ( = ?auto_249787 ?auto_249788 ) ) ( not ( = ?auto_249787 ?auto_249789 ) ) ( not ( = ?auto_249787 ?auto_249790 ) ) ( not ( = ?auto_249787 ?auto_249791 ) ) ( not ( = ?auto_249787 ?auto_249792 ) ) ( not ( = ?auto_249787 ?auto_249793 ) ) ( not ( = ?auto_249787 ?auto_249794 ) ) ( not ( = ?auto_249787 ?auto_249795 ) ) ( not ( = ?auto_249787 ?auto_249796 ) ) ( not ( = ?auto_249787 ?auto_249797 ) ) ( not ( = ?auto_249787 ?auto_249798 ) ) ( not ( = ?auto_249787 ?auto_249799 ) ) ( not ( = ?auto_249788 ?auto_249789 ) ) ( not ( = ?auto_249788 ?auto_249790 ) ) ( not ( = ?auto_249788 ?auto_249791 ) ) ( not ( = ?auto_249788 ?auto_249792 ) ) ( not ( = ?auto_249788 ?auto_249793 ) ) ( not ( = ?auto_249788 ?auto_249794 ) ) ( not ( = ?auto_249788 ?auto_249795 ) ) ( not ( = ?auto_249788 ?auto_249796 ) ) ( not ( = ?auto_249788 ?auto_249797 ) ) ( not ( = ?auto_249788 ?auto_249798 ) ) ( not ( = ?auto_249788 ?auto_249799 ) ) ( not ( = ?auto_249789 ?auto_249790 ) ) ( not ( = ?auto_249789 ?auto_249791 ) ) ( not ( = ?auto_249789 ?auto_249792 ) ) ( not ( = ?auto_249789 ?auto_249793 ) ) ( not ( = ?auto_249789 ?auto_249794 ) ) ( not ( = ?auto_249789 ?auto_249795 ) ) ( not ( = ?auto_249789 ?auto_249796 ) ) ( not ( = ?auto_249789 ?auto_249797 ) ) ( not ( = ?auto_249789 ?auto_249798 ) ) ( not ( = ?auto_249789 ?auto_249799 ) ) ( not ( = ?auto_249790 ?auto_249791 ) ) ( not ( = ?auto_249790 ?auto_249792 ) ) ( not ( = ?auto_249790 ?auto_249793 ) ) ( not ( = ?auto_249790 ?auto_249794 ) ) ( not ( = ?auto_249790 ?auto_249795 ) ) ( not ( = ?auto_249790 ?auto_249796 ) ) ( not ( = ?auto_249790 ?auto_249797 ) ) ( not ( = ?auto_249790 ?auto_249798 ) ) ( not ( = ?auto_249790 ?auto_249799 ) ) ( not ( = ?auto_249791 ?auto_249792 ) ) ( not ( = ?auto_249791 ?auto_249793 ) ) ( not ( = ?auto_249791 ?auto_249794 ) ) ( not ( = ?auto_249791 ?auto_249795 ) ) ( not ( = ?auto_249791 ?auto_249796 ) ) ( not ( = ?auto_249791 ?auto_249797 ) ) ( not ( = ?auto_249791 ?auto_249798 ) ) ( not ( = ?auto_249791 ?auto_249799 ) ) ( not ( = ?auto_249792 ?auto_249793 ) ) ( not ( = ?auto_249792 ?auto_249794 ) ) ( not ( = ?auto_249792 ?auto_249795 ) ) ( not ( = ?auto_249792 ?auto_249796 ) ) ( not ( = ?auto_249792 ?auto_249797 ) ) ( not ( = ?auto_249792 ?auto_249798 ) ) ( not ( = ?auto_249792 ?auto_249799 ) ) ( not ( = ?auto_249793 ?auto_249794 ) ) ( not ( = ?auto_249793 ?auto_249795 ) ) ( not ( = ?auto_249793 ?auto_249796 ) ) ( not ( = ?auto_249793 ?auto_249797 ) ) ( not ( = ?auto_249793 ?auto_249798 ) ) ( not ( = ?auto_249793 ?auto_249799 ) ) ( not ( = ?auto_249794 ?auto_249795 ) ) ( not ( = ?auto_249794 ?auto_249796 ) ) ( not ( = ?auto_249794 ?auto_249797 ) ) ( not ( = ?auto_249794 ?auto_249798 ) ) ( not ( = ?auto_249794 ?auto_249799 ) ) ( not ( = ?auto_249795 ?auto_249796 ) ) ( not ( = ?auto_249795 ?auto_249797 ) ) ( not ( = ?auto_249795 ?auto_249798 ) ) ( not ( = ?auto_249795 ?auto_249799 ) ) ( not ( = ?auto_249796 ?auto_249797 ) ) ( not ( = ?auto_249796 ?auto_249798 ) ) ( not ( = ?auto_249796 ?auto_249799 ) ) ( not ( = ?auto_249797 ?auto_249798 ) ) ( not ( = ?auto_249797 ?auto_249799 ) ) ( not ( = ?auto_249798 ?auto_249799 ) ) ( ON ?auto_249797 ?auto_249798 ) ( ON ?auto_249796 ?auto_249797 ) ( ON ?auto_249795 ?auto_249796 ) ( ON ?auto_249794 ?auto_249795 ) ( ON ?auto_249793 ?auto_249794 ) ( ON ?auto_249792 ?auto_249793 ) ( ON ?auto_249791 ?auto_249792 ) ( ON ?auto_249790 ?auto_249791 ) ( CLEAR ?auto_249788 ) ( ON ?auto_249789 ?auto_249790 ) ( CLEAR ?auto_249789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_249787 ?auto_249788 ?auto_249789 )
      ( MAKE-12PILE ?auto_249787 ?auto_249788 ?auto_249789 ?auto_249790 ?auto_249791 ?auto_249792 ?auto_249793 ?auto_249794 ?auto_249795 ?auto_249796 ?auto_249797 ?auto_249798 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249812 - BLOCK
      ?auto_249813 - BLOCK
      ?auto_249814 - BLOCK
      ?auto_249815 - BLOCK
      ?auto_249816 - BLOCK
      ?auto_249817 - BLOCK
      ?auto_249818 - BLOCK
      ?auto_249819 - BLOCK
      ?auto_249820 - BLOCK
      ?auto_249821 - BLOCK
      ?auto_249822 - BLOCK
      ?auto_249823 - BLOCK
    )
    :vars
    (
      ?auto_249824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249823 ?auto_249824 ) ( ON-TABLE ?auto_249812 ) ( not ( = ?auto_249812 ?auto_249813 ) ) ( not ( = ?auto_249812 ?auto_249814 ) ) ( not ( = ?auto_249812 ?auto_249815 ) ) ( not ( = ?auto_249812 ?auto_249816 ) ) ( not ( = ?auto_249812 ?auto_249817 ) ) ( not ( = ?auto_249812 ?auto_249818 ) ) ( not ( = ?auto_249812 ?auto_249819 ) ) ( not ( = ?auto_249812 ?auto_249820 ) ) ( not ( = ?auto_249812 ?auto_249821 ) ) ( not ( = ?auto_249812 ?auto_249822 ) ) ( not ( = ?auto_249812 ?auto_249823 ) ) ( not ( = ?auto_249812 ?auto_249824 ) ) ( not ( = ?auto_249813 ?auto_249814 ) ) ( not ( = ?auto_249813 ?auto_249815 ) ) ( not ( = ?auto_249813 ?auto_249816 ) ) ( not ( = ?auto_249813 ?auto_249817 ) ) ( not ( = ?auto_249813 ?auto_249818 ) ) ( not ( = ?auto_249813 ?auto_249819 ) ) ( not ( = ?auto_249813 ?auto_249820 ) ) ( not ( = ?auto_249813 ?auto_249821 ) ) ( not ( = ?auto_249813 ?auto_249822 ) ) ( not ( = ?auto_249813 ?auto_249823 ) ) ( not ( = ?auto_249813 ?auto_249824 ) ) ( not ( = ?auto_249814 ?auto_249815 ) ) ( not ( = ?auto_249814 ?auto_249816 ) ) ( not ( = ?auto_249814 ?auto_249817 ) ) ( not ( = ?auto_249814 ?auto_249818 ) ) ( not ( = ?auto_249814 ?auto_249819 ) ) ( not ( = ?auto_249814 ?auto_249820 ) ) ( not ( = ?auto_249814 ?auto_249821 ) ) ( not ( = ?auto_249814 ?auto_249822 ) ) ( not ( = ?auto_249814 ?auto_249823 ) ) ( not ( = ?auto_249814 ?auto_249824 ) ) ( not ( = ?auto_249815 ?auto_249816 ) ) ( not ( = ?auto_249815 ?auto_249817 ) ) ( not ( = ?auto_249815 ?auto_249818 ) ) ( not ( = ?auto_249815 ?auto_249819 ) ) ( not ( = ?auto_249815 ?auto_249820 ) ) ( not ( = ?auto_249815 ?auto_249821 ) ) ( not ( = ?auto_249815 ?auto_249822 ) ) ( not ( = ?auto_249815 ?auto_249823 ) ) ( not ( = ?auto_249815 ?auto_249824 ) ) ( not ( = ?auto_249816 ?auto_249817 ) ) ( not ( = ?auto_249816 ?auto_249818 ) ) ( not ( = ?auto_249816 ?auto_249819 ) ) ( not ( = ?auto_249816 ?auto_249820 ) ) ( not ( = ?auto_249816 ?auto_249821 ) ) ( not ( = ?auto_249816 ?auto_249822 ) ) ( not ( = ?auto_249816 ?auto_249823 ) ) ( not ( = ?auto_249816 ?auto_249824 ) ) ( not ( = ?auto_249817 ?auto_249818 ) ) ( not ( = ?auto_249817 ?auto_249819 ) ) ( not ( = ?auto_249817 ?auto_249820 ) ) ( not ( = ?auto_249817 ?auto_249821 ) ) ( not ( = ?auto_249817 ?auto_249822 ) ) ( not ( = ?auto_249817 ?auto_249823 ) ) ( not ( = ?auto_249817 ?auto_249824 ) ) ( not ( = ?auto_249818 ?auto_249819 ) ) ( not ( = ?auto_249818 ?auto_249820 ) ) ( not ( = ?auto_249818 ?auto_249821 ) ) ( not ( = ?auto_249818 ?auto_249822 ) ) ( not ( = ?auto_249818 ?auto_249823 ) ) ( not ( = ?auto_249818 ?auto_249824 ) ) ( not ( = ?auto_249819 ?auto_249820 ) ) ( not ( = ?auto_249819 ?auto_249821 ) ) ( not ( = ?auto_249819 ?auto_249822 ) ) ( not ( = ?auto_249819 ?auto_249823 ) ) ( not ( = ?auto_249819 ?auto_249824 ) ) ( not ( = ?auto_249820 ?auto_249821 ) ) ( not ( = ?auto_249820 ?auto_249822 ) ) ( not ( = ?auto_249820 ?auto_249823 ) ) ( not ( = ?auto_249820 ?auto_249824 ) ) ( not ( = ?auto_249821 ?auto_249822 ) ) ( not ( = ?auto_249821 ?auto_249823 ) ) ( not ( = ?auto_249821 ?auto_249824 ) ) ( not ( = ?auto_249822 ?auto_249823 ) ) ( not ( = ?auto_249822 ?auto_249824 ) ) ( not ( = ?auto_249823 ?auto_249824 ) ) ( ON ?auto_249822 ?auto_249823 ) ( ON ?auto_249821 ?auto_249822 ) ( ON ?auto_249820 ?auto_249821 ) ( ON ?auto_249819 ?auto_249820 ) ( ON ?auto_249818 ?auto_249819 ) ( ON ?auto_249817 ?auto_249818 ) ( ON ?auto_249816 ?auto_249817 ) ( ON ?auto_249815 ?auto_249816 ) ( ON ?auto_249814 ?auto_249815 ) ( CLEAR ?auto_249812 ) ( ON ?auto_249813 ?auto_249814 ) ( CLEAR ?auto_249813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249812 ?auto_249813 )
      ( MAKE-12PILE ?auto_249812 ?auto_249813 ?auto_249814 ?auto_249815 ?auto_249816 ?auto_249817 ?auto_249818 ?auto_249819 ?auto_249820 ?auto_249821 ?auto_249822 ?auto_249823 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249837 - BLOCK
      ?auto_249838 - BLOCK
      ?auto_249839 - BLOCK
      ?auto_249840 - BLOCK
      ?auto_249841 - BLOCK
      ?auto_249842 - BLOCK
      ?auto_249843 - BLOCK
      ?auto_249844 - BLOCK
      ?auto_249845 - BLOCK
      ?auto_249846 - BLOCK
      ?auto_249847 - BLOCK
      ?auto_249848 - BLOCK
    )
    :vars
    (
      ?auto_249849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249848 ?auto_249849 ) ( ON-TABLE ?auto_249837 ) ( not ( = ?auto_249837 ?auto_249838 ) ) ( not ( = ?auto_249837 ?auto_249839 ) ) ( not ( = ?auto_249837 ?auto_249840 ) ) ( not ( = ?auto_249837 ?auto_249841 ) ) ( not ( = ?auto_249837 ?auto_249842 ) ) ( not ( = ?auto_249837 ?auto_249843 ) ) ( not ( = ?auto_249837 ?auto_249844 ) ) ( not ( = ?auto_249837 ?auto_249845 ) ) ( not ( = ?auto_249837 ?auto_249846 ) ) ( not ( = ?auto_249837 ?auto_249847 ) ) ( not ( = ?auto_249837 ?auto_249848 ) ) ( not ( = ?auto_249837 ?auto_249849 ) ) ( not ( = ?auto_249838 ?auto_249839 ) ) ( not ( = ?auto_249838 ?auto_249840 ) ) ( not ( = ?auto_249838 ?auto_249841 ) ) ( not ( = ?auto_249838 ?auto_249842 ) ) ( not ( = ?auto_249838 ?auto_249843 ) ) ( not ( = ?auto_249838 ?auto_249844 ) ) ( not ( = ?auto_249838 ?auto_249845 ) ) ( not ( = ?auto_249838 ?auto_249846 ) ) ( not ( = ?auto_249838 ?auto_249847 ) ) ( not ( = ?auto_249838 ?auto_249848 ) ) ( not ( = ?auto_249838 ?auto_249849 ) ) ( not ( = ?auto_249839 ?auto_249840 ) ) ( not ( = ?auto_249839 ?auto_249841 ) ) ( not ( = ?auto_249839 ?auto_249842 ) ) ( not ( = ?auto_249839 ?auto_249843 ) ) ( not ( = ?auto_249839 ?auto_249844 ) ) ( not ( = ?auto_249839 ?auto_249845 ) ) ( not ( = ?auto_249839 ?auto_249846 ) ) ( not ( = ?auto_249839 ?auto_249847 ) ) ( not ( = ?auto_249839 ?auto_249848 ) ) ( not ( = ?auto_249839 ?auto_249849 ) ) ( not ( = ?auto_249840 ?auto_249841 ) ) ( not ( = ?auto_249840 ?auto_249842 ) ) ( not ( = ?auto_249840 ?auto_249843 ) ) ( not ( = ?auto_249840 ?auto_249844 ) ) ( not ( = ?auto_249840 ?auto_249845 ) ) ( not ( = ?auto_249840 ?auto_249846 ) ) ( not ( = ?auto_249840 ?auto_249847 ) ) ( not ( = ?auto_249840 ?auto_249848 ) ) ( not ( = ?auto_249840 ?auto_249849 ) ) ( not ( = ?auto_249841 ?auto_249842 ) ) ( not ( = ?auto_249841 ?auto_249843 ) ) ( not ( = ?auto_249841 ?auto_249844 ) ) ( not ( = ?auto_249841 ?auto_249845 ) ) ( not ( = ?auto_249841 ?auto_249846 ) ) ( not ( = ?auto_249841 ?auto_249847 ) ) ( not ( = ?auto_249841 ?auto_249848 ) ) ( not ( = ?auto_249841 ?auto_249849 ) ) ( not ( = ?auto_249842 ?auto_249843 ) ) ( not ( = ?auto_249842 ?auto_249844 ) ) ( not ( = ?auto_249842 ?auto_249845 ) ) ( not ( = ?auto_249842 ?auto_249846 ) ) ( not ( = ?auto_249842 ?auto_249847 ) ) ( not ( = ?auto_249842 ?auto_249848 ) ) ( not ( = ?auto_249842 ?auto_249849 ) ) ( not ( = ?auto_249843 ?auto_249844 ) ) ( not ( = ?auto_249843 ?auto_249845 ) ) ( not ( = ?auto_249843 ?auto_249846 ) ) ( not ( = ?auto_249843 ?auto_249847 ) ) ( not ( = ?auto_249843 ?auto_249848 ) ) ( not ( = ?auto_249843 ?auto_249849 ) ) ( not ( = ?auto_249844 ?auto_249845 ) ) ( not ( = ?auto_249844 ?auto_249846 ) ) ( not ( = ?auto_249844 ?auto_249847 ) ) ( not ( = ?auto_249844 ?auto_249848 ) ) ( not ( = ?auto_249844 ?auto_249849 ) ) ( not ( = ?auto_249845 ?auto_249846 ) ) ( not ( = ?auto_249845 ?auto_249847 ) ) ( not ( = ?auto_249845 ?auto_249848 ) ) ( not ( = ?auto_249845 ?auto_249849 ) ) ( not ( = ?auto_249846 ?auto_249847 ) ) ( not ( = ?auto_249846 ?auto_249848 ) ) ( not ( = ?auto_249846 ?auto_249849 ) ) ( not ( = ?auto_249847 ?auto_249848 ) ) ( not ( = ?auto_249847 ?auto_249849 ) ) ( not ( = ?auto_249848 ?auto_249849 ) ) ( ON ?auto_249847 ?auto_249848 ) ( ON ?auto_249846 ?auto_249847 ) ( ON ?auto_249845 ?auto_249846 ) ( ON ?auto_249844 ?auto_249845 ) ( ON ?auto_249843 ?auto_249844 ) ( ON ?auto_249842 ?auto_249843 ) ( ON ?auto_249841 ?auto_249842 ) ( ON ?auto_249840 ?auto_249841 ) ( ON ?auto_249839 ?auto_249840 ) ( CLEAR ?auto_249837 ) ( ON ?auto_249838 ?auto_249839 ) ( CLEAR ?auto_249838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_249837 ?auto_249838 )
      ( MAKE-12PILE ?auto_249837 ?auto_249838 ?auto_249839 ?auto_249840 ?auto_249841 ?auto_249842 ?auto_249843 ?auto_249844 ?auto_249845 ?auto_249846 ?auto_249847 ?auto_249848 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249862 - BLOCK
      ?auto_249863 - BLOCK
      ?auto_249864 - BLOCK
      ?auto_249865 - BLOCK
      ?auto_249866 - BLOCK
      ?auto_249867 - BLOCK
      ?auto_249868 - BLOCK
      ?auto_249869 - BLOCK
      ?auto_249870 - BLOCK
      ?auto_249871 - BLOCK
      ?auto_249872 - BLOCK
      ?auto_249873 - BLOCK
    )
    :vars
    (
      ?auto_249874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249873 ?auto_249874 ) ( not ( = ?auto_249862 ?auto_249863 ) ) ( not ( = ?auto_249862 ?auto_249864 ) ) ( not ( = ?auto_249862 ?auto_249865 ) ) ( not ( = ?auto_249862 ?auto_249866 ) ) ( not ( = ?auto_249862 ?auto_249867 ) ) ( not ( = ?auto_249862 ?auto_249868 ) ) ( not ( = ?auto_249862 ?auto_249869 ) ) ( not ( = ?auto_249862 ?auto_249870 ) ) ( not ( = ?auto_249862 ?auto_249871 ) ) ( not ( = ?auto_249862 ?auto_249872 ) ) ( not ( = ?auto_249862 ?auto_249873 ) ) ( not ( = ?auto_249862 ?auto_249874 ) ) ( not ( = ?auto_249863 ?auto_249864 ) ) ( not ( = ?auto_249863 ?auto_249865 ) ) ( not ( = ?auto_249863 ?auto_249866 ) ) ( not ( = ?auto_249863 ?auto_249867 ) ) ( not ( = ?auto_249863 ?auto_249868 ) ) ( not ( = ?auto_249863 ?auto_249869 ) ) ( not ( = ?auto_249863 ?auto_249870 ) ) ( not ( = ?auto_249863 ?auto_249871 ) ) ( not ( = ?auto_249863 ?auto_249872 ) ) ( not ( = ?auto_249863 ?auto_249873 ) ) ( not ( = ?auto_249863 ?auto_249874 ) ) ( not ( = ?auto_249864 ?auto_249865 ) ) ( not ( = ?auto_249864 ?auto_249866 ) ) ( not ( = ?auto_249864 ?auto_249867 ) ) ( not ( = ?auto_249864 ?auto_249868 ) ) ( not ( = ?auto_249864 ?auto_249869 ) ) ( not ( = ?auto_249864 ?auto_249870 ) ) ( not ( = ?auto_249864 ?auto_249871 ) ) ( not ( = ?auto_249864 ?auto_249872 ) ) ( not ( = ?auto_249864 ?auto_249873 ) ) ( not ( = ?auto_249864 ?auto_249874 ) ) ( not ( = ?auto_249865 ?auto_249866 ) ) ( not ( = ?auto_249865 ?auto_249867 ) ) ( not ( = ?auto_249865 ?auto_249868 ) ) ( not ( = ?auto_249865 ?auto_249869 ) ) ( not ( = ?auto_249865 ?auto_249870 ) ) ( not ( = ?auto_249865 ?auto_249871 ) ) ( not ( = ?auto_249865 ?auto_249872 ) ) ( not ( = ?auto_249865 ?auto_249873 ) ) ( not ( = ?auto_249865 ?auto_249874 ) ) ( not ( = ?auto_249866 ?auto_249867 ) ) ( not ( = ?auto_249866 ?auto_249868 ) ) ( not ( = ?auto_249866 ?auto_249869 ) ) ( not ( = ?auto_249866 ?auto_249870 ) ) ( not ( = ?auto_249866 ?auto_249871 ) ) ( not ( = ?auto_249866 ?auto_249872 ) ) ( not ( = ?auto_249866 ?auto_249873 ) ) ( not ( = ?auto_249866 ?auto_249874 ) ) ( not ( = ?auto_249867 ?auto_249868 ) ) ( not ( = ?auto_249867 ?auto_249869 ) ) ( not ( = ?auto_249867 ?auto_249870 ) ) ( not ( = ?auto_249867 ?auto_249871 ) ) ( not ( = ?auto_249867 ?auto_249872 ) ) ( not ( = ?auto_249867 ?auto_249873 ) ) ( not ( = ?auto_249867 ?auto_249874 ) ) ( not ( = ?auto_249868 ?auto_249869 ) ) ( not ( = ?auto_249868 ?auto_249870 ) ) ( not ( = ?auto_249868 ?auto_249871 ) ) ( not ( = ?auto_249868 ?auto_249872 ) ) ( not ( = ?auto_249868 ?auto_249873 ) ) ( not ( = ?auto_249868 ?auto_249874 ) ) ( not ( = ?auto_249869 ?auto_249870 ) ) ( not ( = ?auto_249869 ?auto_249871 ) ) ( not ( = ?auto_249869 ?auto_249872 ) ) ( not ( = ?auto_249869 ?auto_249873 ) ) ( not ( = ?auto_249869 ?auto_249874 ) ) ( not ( = ?auto_249870 ?auto_249871 ) ) ( not ( = ?auto_249870 ?auto_249872 ) ) ( not ( = ?auto_249870 ?auto_249873 ) ) ( not ( = ?auto_249870 ?auto_249874 ) ) ( not ( = ?auto_249871 ?auto_249872 ) ) ( not ( = ?auto_249871 ?auto_249873 ) ) ( not ( = ?auto_249871 ?auto_249874 ) ) ( not ( = ?auto_249872 ?auto_249873 ) ) ( not ( = ?auto_249872 ?auto_249874 ) ) ( not ( = ?auto_249873 ?auto_249874 ) ) ( ON ?auto_249872 ?auto_249873 ) ( ON ?auto_249871 ?auto_249872 ) ( ON ?auto_249870 ?auto_249871 ) ( ON ?auto_249869 ?auto_249870 ) ( ON ?auto_249868 ?auto_249869 ) ( ON ?auto_249867 ?auto_249868 ) ( ON ?auto_249866 ?auto_249867 ) ( ON ?auto_249865 ?auto_249866 ) ( ON ?auto_249864 ?auto_249865 ) ( ON ?auto_249863 ?auto_249864 ) ( ON ?auto_249862 ?auto_249863 ) ( CLEAR ?auto_249862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249862 )
      ( MAKE-12PILE ?auto_249862 ?auto_249863 ?auto_249864 ?auto_249865 ?auto_249866 ?auto_249867 ?auto_249868 ?auto_249869 ?auto_249870 ?auto_249871 ?auto_249872 ?auto_249873 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_249887 - BLOCK
      ?auto_249888 - BLOCK
      ?auto_249889 - BLOCK
      ?auto_249890 - BLOCK
      ?auto_249891 - BLOCK
      ?auto_249892 - BLOCK
      ?auto_249893 - BLOCK
      ?auto_249894 - BLOCK
      ?auto_249895 - BLOCK
      ?auto_249896 - BLOCK
      ?auto_249897 - BLOCK
      ?auto_249898 - BLOCK
    )
    :vars
    (
      ?auto_249899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249898 ?auto_249899 ) ( not ( = ?auto_249887 ?auto_249888 ) ) ( not ( = ?auto_249887 ?auto_249889 ) ) ( not ( = ?auto_249887 ?auto_249890 ) ) ( not ( = ?auto_249887 ?auto_249891 ) ) ( not ( = ?auto_249887 ?auto_249892 ) ) ( not ( = ?auto_249887 ?auto_249893 ) ) ( not ( = ?auto_249887 ?auto_249894 ) ) ( not ( = ?auto_249887 ?auto_249895 ) ) ( not ( = ?auto_249887 ?auto_249896 ) ) ( not ( = ?auto_249887 ?auto_249897 ) ) ( not ( = ?auto_249887 ?auto_249898 ) ) ( not ( = ?auto_249887 ?auto_249899 ) ) ( not ( = ?auto_249888 ?auto_249889 ) ) ( not ( = ?auto_249888 ?auto_249890 ) ) ( not ( = ?auto_249888 ?auto_249891 ) ) ( not ( = ?auto_249888 ?auto_249892 ) ) ( not ( = ?auto_249888 ?auto_249893 ) ) ( not ( = ?auto_249888 ?auto_249894 ) ) ( not ( = ?auto_249888 ?auto_249895 ) ) ( not ( = ?auto_249888 ?auto_249896 ) ) ( not ( = ?auto_249888 ?auto_249897 ) ) ( not ( = ?auto_249888 ?auto_249898 ) ) ( not ( = ?auto_249888 ?auto_249899 ) ) ( not ( = ?auto_249889 ?auto_249890 ) ) ( not ( = ?auto_249889 ?auto_249891 ) ) ( not ( = ?auto_249889 ?auto_249892 ) ) ( not ( = ?auto_249889 ?auto_249893 ) ) ( not ( = ?auto_249889 ?auto_249894 ) ) ( not ( = ?auto_249889 ?auto_249895 ) ) ( not ( = ?auto_249889 ?auto_249896 ) ) ( not ( = ?auto_249889 ?auto_249897 ) ) ( not ( = ?auto_249889 ?auto_249898 ) ) ( not ( = ?auto_249889 ?auto_249899 ) ) ( not ( = ?auto_249890 ?auto_249891 ) ) ( not ( = ?auto_249890 ?auto_249892 ) ) ( not ( = ?auto_249890 ?auto_249893 ) ) ( not ( = ?auto_249890 ?auto_249894 ) ) ( not ( = ?auto_249890 ?auto_249895 ) ) ( not ( = ?auto_249890 ?auto_249896 ) ) ( not ( = ?auto_249890 ?auto_249897 ) ) ( not ( = ?auto_249890 ?auto_249898 ) ) ( not ( = ?auto_249890 ?auto_249899 ) ) ( not ( = ?auto_249891 ?auto_249892 ) ) ( not ( = ?auto_249891 ?auto_249893 ) ) ( not ( = ?auto_249891 ?auto_249894 ) ) ( not ( = ?auto_249891 ?auto_249895 ) ) ( not ( = ?auto_249891 ?auto_249896 ) ) ( not ( = ?auto_249891 ?auto_249897 ) ) ( not ( = ?auto_249891 ?auto_249898 ) ) ( not ( = ?auto_249891 ?auto_249899 ) ) ( not ( = ?auto_249892 ?auto_249893 ) ) ( not ( = ?auto_249892 ?auto_249894 ) ) ( not ( = ?auto_249892 ?auto_249895 ) ) ( not ( = ?auto_249892 ?auto_249896 ) ) ( not ( = ?auto_249892 ?auto_249897 ) ) ( not ( = ?auto_249892 ?auto_249898 ) ) ( not ( = ?auto_249892 ?auto_249899 ) ) ( not ( = ?auto_249893 ?auto_249894 ) ) ( not ( = ?auto_249893 ?auto_249895 ) ) ( not ( = ?auto_249893 ?auto_249896 ) ) ( not ( = ?auto_249893 ?auto_249897 ) ) ( not ( = ?auto_249893 ?auto_249898 ) ) ( not ( = ?auto_249893 ?auto_249899 ) ) ( not ( = ?auto_249894 ?auto_249895 ) ) ( not ( = ?auto_249894 ?auto_249896 ) ) ( not ( = ?auto_249894 ?auto_249897 ) ) ( not ( = ?auto_249894 ?auto_249898 ) ) ( not ( = ?auto_249894 ?auto_249899 ) ) ( not ( = ?auto_249895 ?auto_249896 ) ) ( not ( = ?auto_249895 ?auto_249897 ) ) ( not ( = ?auto_249895 ?auto_249898 ) ) ( not ( = ?auto_249895 ?auto_249899 ) ) ( not ( = ?auto_249896 ?auto_249897 ) ) ( not ( = ?auto_249896 ?auto_249898 ) ) ( not ( = ?auto_249896 ?auto_249899 ) ) ( not ( = ?auto_249897 ?auto_249898 ) ) ( not ( = ?auto_249897 ?auto_249899 ) ) ( not ( = ?auto_249898 ?auto_249899 ) ) ( ON ?auto_249897 ?auto_249898 ) ( ON ?auto_249896 ?auto_249897 ) ( ON ?auto_249895 ?auto_249896 ) ( ON ?auto_249894 ?auto_249895 ) ( ON ?auto_249893 ?auto_249894 ) ( ON ?auto_249892 ?auto_249893 ) ( ON ?auto_249891 ?auto_249892 ) ( ON ?auto_249890 ?auto_249891 ) ( ON ?auto_249889 ?auto_249890 ) ( ON ?auto_249888 ?auto_249889 ) ( ON ?auto_249887 ?auto_249888 ) ( CLEAR ?auto_249887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_249887 )
      ( MAKE-12PILE ?auto_249887 ?auto_249888 ?auto_249889 ?auto_249890 ?auto_249891 ?auto_249892 ?auto_249893 ?auto_249894 ?auto_249895 ?auto_249896 ?auto_249897 ?auto_249898 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249913 - BLOCK
      ?auto_249914 - BLOCK
      ?auto_249915 - BLOCK
      ?auto_249916 - BLOCK
      ?auto_249917 - BLOCK
      ?auto_249918 - BLOCK
      ?auto_249919 - BLOCK
      ?auto_249920 - BLOCK
      ?auto_249921 - BLOCK
      ?auto_249922 - BLOCK
      ?auto_249923 - BLOCK
      ?auto_249924 - BLOCK
      ?auto_249925 - BLOCK
    )
    :vars
    (
      ?auto_249926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249924 ) ( ON ?auto_249925 ?auto_249926 ) ( CLEAR ?auto_249925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249913 ) ( ON ?auto_249914 ?auto_249913 ) ( ON ?auto_249915 ?auto_249914 ) ( ON ?auto_249916 ?auto_249915 ) ( ON ?auto_249917 ?auto_249916 ) ( ON ?auto_249918 ?auto_249917 ) ( ON ?auto_249919 ?auto_249918 ) ( ON ?auto_249920 ?auto_249919 ) ( ON ?auto_249921 ?auto_249920 ) ( ON ?auto_249922 ?auto_249921 ) ( ON ?auto_249923 ?auto_249922 ) ( ON ?auto_249924 ?auto_249923 ) ( not ( = ?auto_249913 ?auto_249914 ) ) ( not ( = ?auto_249913 ?auto_249915 ) ) ( not ( = ?auto_249913 ?auto_249916 ) ) ( not ( = ?auto_249913 ?auto_249917 ) ) ( not ( = ?auto_249913 ?auto_249918 ) ) ( not ( = ?auto_249913 ?auto_249919 ) ) ( not ( = ?auto_249913 ?auto_249920 ) ) ( not ( = ?auto_249913 ?auto_249921 ) ) ( not ( = ?auto_249913 ?auto_249922 ) ) ( not ( = ?auto_249913 ?auto_249923 ) ) ( not ( = ?auto_249913 ?auto_249924 ) ) ( not ( = ?auto_249913 ?auto_249925 ) ) ( not ( = ?auto_249913 ?auto_249926 ) ) ( not ( = ?auto_249914 ?auto_249915 ) ) ( not ( = ?auto_249914 ?auto_249916 ) ) ( not ( = ?auto_249914 ?auto_249917 ) ) ( not ( = ?auto_249914 ?auto_249918 ) ) ( not ( = ?auto_249914 ?auto_249919 ) ) ( not ( = ?auto_249914 ?auto_249920 ) ) ( not ( = ?auto_249914 ?auto_249921 ) ) ( not ( = ?auto_249914 ?auto_249922 ) ) ( not ( = ?auto_249914 ?auto_249923 ) ) ( not ( = ?auto_249914 ?auto_249924 ) ) ( not ( = ?auto_249914 ?auto_249925 ) ) ( not ( = ?auto_249914 ?auto_249926 ) ) ( not ( = ?auto_249915 ?auto_249916 ) ) ( not ( = ?auto_249915 ?auto_249917 ) ) ( not ( = ?auto_249915 ?auto_249918 ) ) ( not ( = ?auto_249915 ?auto_249919 ) ) ( not ( = ?auto_249915 ?auto_249920 ) ) ( not ( = ?auto_249915 ?auto_249921 ) ) ( not ( = ?auto_249915 ?auto_249922 ) ) ( not ( = ?auto_249915 ?auto_249923 ) ) ( not ( = ?auto_249915 ?auto_249924 ) ) ( not ( = ?auto_249915 ?auto_249925 ) ) ( not ( = ?auto_249915 ?auto_249926 ) ) ( not ( = ?auto_249916 ?auto_249917 ) ) ( not ( = ?auto_249916 ?auto_249918 ) ) ( not ( = ?auto_249916 ?auto_249919 ) ) ( not ( = ?auto_249916 ?auto_249920 ) ) ( not ( = ?auto_249916 ?auto_249921 ) ) ( not ( = ?auto_249916 ?auto_249922 ) ) ( not ( = ?auto_249916 ?auto_249923 ) ) ( not ( = ?auto_249916 ?auto_249924 ) ) ( not ( = ?auto_249916 ?auto_249925 ) ) ( not ( = ?auto_249916 ?auto_249926 ) ) ( not ( = ?auto_249917 ?auto_249918 ) ) ( not ( = ?auto_249917 ?auto_249919 ) ) ( not ( = ?auto_249917 ?auto_249920 ) ) ( not ( = ?auto_249917 ?auto_249921 ) ) ( not ( = ?auto_249917 ?auto_249922 ) ) ( not ( = ?auto_249917 ?auto_249923 ) ) ( not ( = ?auto_249917 ?auto_249924 ) ) ( not ( = ?auto_249917 ?auto_249925 ) ) ( not ( = ?auto_249917 ?auto_249926 ) ) ( not ( = ?auto_249918 ?auto_249919 ) ) ( not ( = ?auto_249918 ?auto_249920 ) ) ( not ( = ?auto_249918 ?auto_249921 ) ) ( not ( = ?auto_249918 ?auto_249922 ) ) ( not ( = ?auto_249918 ?auto_249923 ) ) ( not ( = ?auto_249918 ?auto_249924 ) ) ( not ( = ?auto_249918 ?auto_249925 ) ) ( not ( = ?auto_249918 ?auto_249926 ) ) ( not ( = ?auto_249919 ?auto_249920 ) ) ( not ( = ?auto_249919 ?auto_249921 ) ) ( not ( = ?auto_249919 ?auto_249922 ) ) ( not ( = ?auto_249919 ?auto_249923 ) ) ( not ( = ?auto_249919 ?auto_249924 ) ) ( not ( = ?auto_249919 ?auto_249925 ) ) ( not ( = ?auto_249919 ?auto_249926 ) ) ( not ( = ?auto_249920 ?auto_249921 ) ) ( not ( = ?auto_249920 ?auto_249922 ) ) ( not ( = ?auto_249920 ?auto_249923 ) ) ( not ( = ?auto_249920 ?auto_249924 ) ) ( not ( = ?auto_249920 ?auto_249925 ) ) ( not ( = ?auto_249920 ?auto_249926 ) ) ( not ( = ?auto_249921 ?auto_249922 ) ) ( not ( = ?auto_249921 ?auto_249923 ) ) ( not ( = ?auto_249921 ?auto_249924 ) ) ( not ( = ?auto_249921 ?auto_249925 ) ) ( not ( = ?auto_249921 ?auto_249926 ) ) ( not ( = ?auto_249922 ?auto_249923 ) ) ( not ( = ?auto_249922 ?auto_249924 ) ) ( not ( = ?auto_249922 ?auto_249925 ) ) ( not ( = ?auto_249922 ?auto_249926 ) ) ( not ( = ?auto_249923 ?auto_249924 ) ) ( not ( = ?auto_249923 ?auto_249925 ) ) ( not ( = ?auto_249923 ?auto_249926 ) ) ( not ( = ?auto_249924 ?auto_249925 ) ) ( not ( = ?auto_249924 ?auto_249926 ) ) ( not ( = ?auto_249925 ?auto_249926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_249925 ?auto_249926 )
      ( !STACK ?auto_249925 ?auto_249924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249940 - BLOCK
      ?auto_249941 - BLOCK
      ?auto_249942 - BLOCK
      ?auto_249943 - BLOCK
      ?auto_249944 - BLOCK
      ?auto_249945 - BLOCK
      ?auto_249946 - BLOCK
      ?auto_249947 - BLOCK
      ?auto_249948 - BLOCK
      ?auto_249949 - BLOCK
      ?auto_249950 - BLOCK
      ?auto_249951 - BLOCK
      ?auto_249952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_249951 ) ( ON-TABLE ?auto_249952 ) ( CLEAR ?auto_249952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_249940 ) ( ON ?auto_249941 ?auto_249940 ) ( ON ?auto_249942 ?auto_249941 ) ( ON ?auto_249943 ?auto_249942 ) ( ON ?auto_249944 ?auto_249943 ) ( ON ?auto_249945 ?auto_249944 ) ( ON ?auto_249946 ?auto_249945 ) ( ON ?auto_249947 ?auto_249946 ) ( ON ?auto_249948 ?auto_249947 ) ( ON ?auto_249949 ?auto_249948 ) ( ON ?auto_249950 ?auto_249949 ) ( ON ?auto_249951 ?auto_249950 ) ( not ( = ?auto_249940 ?auto_249941 ) ) ( not ( = ?auto_249940 ?auto_249942 ) ) ( not ( = ?auto_249940 ?auto_249943 ) ) ( not ( = ?auto_249940 ?auto_249944 ) ) ( not ( = ?auto_249940 ?auto_249945 ) ) ( not ( = ?auto_249940 ?auto_249946 ) ) ( not ( = ?auto_249940 ?auto_249947 ) ) ( not ( = ?auto_249940 ?auto_249948 ) ) ( not ( = ?auto_249940 ?auto_249949 ) ) ( not ( = ?auto_249940 ?auto_249950 ) ) ( not ( = ?auto_249940 ?auto_249951 ) ) ( not ( = ?auto_249940 ?auto_249952 ) ) ( not ( = ?auto_249941 ?auto_249942 ) ) ( not ( = ?auto_249941 ?auto_249943 ) ) ( not ( = ?auto_249941 ?auto_249944 ) ) ( not ( = ?auto_249941 ?auto_249945 ) ) ( not ( = ?auto_249941 ?auto_249946 ) ) ( not ( = ?auto_249941 ?auto_249947 ) ) ( not ( = ?auto_249941 ?auto_249948 ) ) ( not ( = ?auto_249941 ?auto_249949 ) ) ( not ( = ?auto_249941 ?auto_249950 ) ) ( not ( = ?auto_249941 ?auto_249951 ) ) ( not ( = ?auto_249941 ?auto_249952 ) ) ( not ( = ?auto_249942 ?auto_249943 ) ) ( not ( = ?auto_249942 ?auto_249944 ) ) ( not ( = ?auto_249942 ?auto_249945 ) ) ( not ( = ?auto_249942 ?auto_249946 ) ) ( not ( = ?auto_249942 ?auto_249947 ) ) ( not ( = ?auto_249942 ?auto_249948 ) ) ( not ( = ?auto_249942 ?auto_249949 ) ) ( not ( = ?auto_249942 ?auto_249950 ) ) ( not ( = ?auto_249942 ?auto_249951 ) ) ( not ( = ?auto_249942 ?auto_249952 ) ) ( not ( = ?auto_249943 ?auto_249944 ) ) ( not ( = ?auto_249943 ?auto_249945 ) ) ( not ( = ?auto_249943 ?auto_249946 ) ) ( not ( = ?auto_249943 ?auto_249947 ) ) ( not ( = ?auto_249943 ?auto_249948 ) ) ( not ( = ?auto_249943 ?auto_249949 ) ) ( not ( = ?auto_249943 ?auto_249950 ) ) ( not ( = ?auto_249943 ?auto_249951 ) ) ( not ( = ?auto_249943 ?auto_249952 ) ) ( not ( = ?auto_249944 ?auto_249945 ) ) ( not ( = ?auto_249944 ?auto_249946 ) ) ( not ( = ?auto_249944 ?auto_249947 ) ) ( not ( = ?auto_249944 ?auto_249948 ) ) ( not ( = ?auto_249944 ?auto_249949 ) ) ( not ( = ?auto_249944 ?auto_249950 ) ) ( not ( = ?auto_249944 ?auto_249951 ) ) ( not ( = ?auto_249944 ?auto_249952 ) ) ( not ( = ?auto_249945 ?auto_249946 ) ) ( not ( = ?auto_249945 ?auto_249947 ) ) ( not ( = ?auto_249945 ?auto_249948 ) ) ( not ( = ?auto_249945 ?auto_249949 ) ) ( not ( = ?auto_249945 ?auto_249950 ) ) ( not ( = ?auto_249945 ?auto_249951 ) ) ( not ( = ?auto_249945 ?auto_249952 ) ) ( not ( = ?auto_249946 ?auto_249947 ) ) ( not ( = ?auto_249946 ?auto_249948 ) ) ( not ( = ?auto_249946 ?auto_249949 ) ) ( not ( = ?auto_249946 ?auto_249950 ) ) ( not ( = ?auto_249946 ?auto_249951 ) ) ( not ( = ?auto_249946 ?auto_249952 ) ) ( not ( = ?auto_249947 ?auto_249948 ) ) ( not ( = ?auto_249947 ?auto_249949 ) ) ( not ( = ?auto_249947 ?auto_249950 ) ) ( not ( = ?auto_249947 ?auto_249951 ) ) ( not ( = ?auto_249947 ?auto_249952 ) ) ( not ( = ?auto_249948 ?auto_249949 ) ) ( not ( = ?auto_249948 ?auto_249950 ) ) ( not ( = ?auto_249948 ?auto_249951 ) ) ( not ( = ?auto_249948 ?auto_249952 ) ) ( not ( = ?auto_249949 ?auto_249950 ) ) ( not ( = ?auto_249949 ?auto_249951 ) ) ( not ( = ?auto_249949 ?auto_249952 ) ) ( not ( = ?auto_249950 ?auto_249951 ) ) ( not ( = ?auto_249950 ?auto_249952 ) ) ( not ( = ?auto_249951 ?auto_249952 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_249952 )
      ( !STACK ?auto_249952 ?auto_249951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249966 - BLOCK
      ?auto_249967 - BLOCK
      ?auto_249968 - BLOCK
      ?auto_249969 - BLOCK
      ?auto_249970 - BLOCK
      ?auto_249971 - BLOCK
      ?auto_249972 - BLOCK
      ?auto_249973 - BLOCK
      ?auto_249974 - BLOCK
      ?auto_249975 - BLOCK
      ?auto_249976 - BLOCK
      ?auto_249977 - BLOCK
      ?auto_249978 - BLOCK
    )
    :vars
    (
      ?auto_249979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_249978 ?auto_249979 ) ( ON-TABLE ?auto_249966 ) ( ON ?auto_249967 ?auto_249966 ) ( ON ?auto_249968 ?auto_249967 ) ( ON ?auto_249969 ?auto_249968 ) ( ON ?auto_249970 ?auto_249969 ) ( ON ?auto_249971 ?auto_249970 ) ( ON ?auto_249972 ?auto_249971 ) ( ON ?auto_249973 ?auto_249972 ) ( ON ?auto_249974 ?auto_249973 ) ( ON ?auto_249975 ?auto_249974 ) ( ON ?auto_249976 ?auto_249975 ) ( not ( = ?auto_249966 ?auto_249967 ) ) ( not ( = ?auto_249966 ?auto_249968 ) ) ( not ( = ?auto_249966 ?auto_249969 ) ) ( not ( = ?auto_249966 ?auto_249970 ) ) ( not ( = ?auto_249966 ?auto_249971 ) ) ( not ( = ?auto_249966 ?auto_249972 ) ) ( not ( = ?auto_249966 ?auto_249973 ) ) ( not ( = ?auto_249966 ?auto_249974 ) ) ( not ( = ?auto_249966 ?auto_249975 ) ) ( not ( = ?auto_249966 ?auto_249976 ) ) ( not ( = ?auto_249966 ?auto_249977 ) ) ( not ( = ?auto_249966 ?auto_249978 ) ) ( not ( = ?auto_249966 ?auto_249979 ) ) ( not ( = ?auto_249967 ?auto_249968 ) ) ( not ( = ?auto_249967 ?auto_249969 ) ) ( not ( = ?auto_249967 ?auto_249970 ) ) ( not ( = ?auto_249967 ?auto_249971 ) ) ( not ( = ?auto_249967 ?auto_249972 ) ) ( not ( = ?auto_249967 ?auto_249973 ) ) ( not ( = ?auto_249967 ?auto_249974 ) ) ( not ( = ?auto_249967 ?auto_249975 ) ) ( not ( = ?auto_249967 ?auto_249976 ) ) ( not ( = ?auto_249967 ?auto_249977 ) ) ( not ( = ?auto_249967 ?auto_249978 ) ) ( not ( = ?auto_249967 ?auto_249979 ) ) ( not ( = ?auto_249968 ?auto_249969 ) ) ( not ( = ?auto_249968 ?auto_249970 ) ) ( not ( = ?auto_249968 ?auto_249971 ) ) ( not ( = ?auto_249968 ?auto_249972 ) ) ( not ( = ?auto_249968 ?auto_249973 ) ) ( not ( = ?auto_249968 ?auto_249974 ) ) ( not ( = ?auto_249968 ?auto_249975 ) ) ( not ( = ?auto_249968 ?auto_249976 ) ) ( not ( = ?auto_249968 ?auto_249977 ) ) ( not ( = ?auto_249968 ?auto_249978 ) ) ( not ( = ?auto_249968 ?auto_249979 ) ) ( not ( = ?auto_249969 ?auto_249970 ) ) ( not ( = ?auto_249969 ?auto_249971 ) ) ( not ( = ?auto_249969 ?auto_249972 ) ) ( not ( = ?auto_249969 ?auto_249973 ) ) ( not ( = ?auto_249969 ?auto_249974 ) ) ( not ( = ?auto_249969 ?auto_249975 ) ) ( not ( = ?auto_249969 ?auto_249976 ) ) ( not ( = ?auto_249969 ?auto_249977 ) ) ( not ( = ?auto_249969 ?auto_249978 ) ) ( not ( = ?auto_249969 ?auto_249979 ) ) ( not ( = ?auto_249970 ?auto_249971 ) ) ( not ( = ?auto_249970 ?auto_249972 ) ) ( not ( = ?auto_249970 ?auto_249973 ) ) ( not ( = ?auto_249970 ?auto_249974 ) ) ( not ( = ?auto_249970 ?auto_249975 ) ) ( not ( = ?auto_249970 ?auto_249976 ) ) ( not ( = ?auto_249970 ?auto_249977 ) ) ( not ( = ?auto_249970 ?auto_249978 ) ) ( not ( = ?auto_249970 ?auto_249979 ) ) ( not ( = ?auto_249971 ?auto_249972 ) ) ( not ( = ?auto_249971 ?auto_249973 ) ) ( not ( = ?auto_249971 ?auto_249974 ) ) ( not ( = ?auto_249971 ?auto_249975 ) ) ( not ( = ?auto_249971 ?auto_249976 ) ) ( not ( = ?auto_249971 ?auto_249977 ) ) ( not ( = ?auto_249971 ?auto_249978 ) ) ( not ( = ?auto_249971 ?auto_249979 ) ) ( not ( = ?auto_249972 ?auto_249973 ) ) ( not ( = ?auto_249972 ?auto_249974 ) ) ( not ( = ?auto_249972 ?auto_249975 ) ) ( not ( = ?auto_249972 ?auto_249976 ) ) ( not ( = ?auto_249972 ?auto_249977 ) ) ( not ( = ?auto_249972 ?auto_249978 ) ) ( not ( = ?auto_249972 ?auto_249979 ) ) ( not ( = ?auto_249973 ?auto_249974 ) ) ( not ( = ?auto_249973 ?auto_249975 ) ) ( not ( = ?auto_249973 ?auto_249976 ) ) ( not ( = ?auto_249973 ?auto_249977 ) ) ( not ( = ?auto_249973 ?auto_249978 ) ) ( not ( = ?auto_249973 ?auto_249979 ) ) ( not ( = ?auto_249974 ?auto_249975 ) ) ( not ( = ?auto_249974 ?auto_249976 ) ) ( not ( = ?auto_249974 ?auto_249977 ) ) ( not ( = ?auto_249974 ?auto_249978 ) ) ( not ( = ?auto_249974 ?auto_249979 ) ) ( not ( = ?auto_249975 ?auto_249976 ) ) ( not ( = ?auto_249975 ?auto_249977 ) ) ( not ( = ?auto_249975 ?auto_249978 ) ) ( not ( = ?auto_249975 ?auto_249979 ) ) ( not ( = ?auto_249976 ?auto_249977 ) ) ( not ( = ?auto_249976 ?auto_249978 ) ) ( not ( = ?auto_249976 ?auto_249979 ) ) ( not ( = ?auto_249977 ?auto_249978 ) ) ( not ( = ?auto_249977 ?auto_249979 ) ) ( not ( = ?auto_249978 ?auto_249979 ) ) ( CLEAR ?auto_249976 ) ( ON ?auto_249977 ?auto_249978 ) ( CLEAR ?auto_249977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_249966 ?auto_249967 ?auto_249968 ?auto_249969 ?auto_249970 ?auto_249971 ?auto_249972 ?auto_249973 ?auto_249974 ?auto_249975 ?auto_249976 ?auto_249977 )
      ( MAKE-13PILE ?auto_249966 ?auto_249967 ?auto_249968 ?auto_249969 ?auto_249970 ?auto_249971 ?auto_249972 ?auto_249973 ?auto_249974 ?auto_249975 ?auto_249976 ?auto_249977 ?auto_249978 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_249993 - BLOCK
      ?auto_249994 - BLOCK
      ?auto_249995 - BLOCK
      ?auto_249996 - BLOCK
      ?auto_249997 - BLOCK
      ?auto_249998 - BLOCK
      ?auto_249999 - BLOCK
      ?auto_250000 - BLOCK
      ?auto_250001 - BLOCK
      ?auto_250002 - BLOCK
      ?auto_250003 - BLOCK
      ?auto_250004 - BLOCK
      ?auto_250005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250005 ) ( ON-TABLE ?auto_249993 ) ( ON ?auto_249994 ?auto_249993 ) ( ON ?auto_249995 ?auto_249994 ) ( ON ?auto_249996 ?auto_249995 ) ( ON ?auto_249997 ?auto_249996 ) ( ON ?auto_249998 ?auto_249997 ) ( ON ?auto_249999 ?auto_249998 ) ( ON ?auto_250000 ?auto_249999 ) ( ON ?auto_250001 ?auto_250000 ) ( ON ?auto_250002 ?auto_250001 ) ( ON ?auto_250003 ?auto_250002 ) ( not ( = ?auto_249993 ?auto_249994 ) ) ( not ( = ?auto_249993 ?auto_249995 ) ) ( not ( = ?auto_249993 ?auto_249996 ) ) ( not ( = ?auto_249993 ?auto_249997 ) ) ( not ( = ?auto_249993 ?auto_249998 ) ) ( not ( = ?auto_249993 ?auto_249999 ) ) ( not ( = ?auto_249993 ?auto_250000 ) ) ( not ( = ?auto_249993 ?auto_250001 ) ) ( not ( = ?auto_249993 ?auto_250002 ) ) ( not ( = ?auto_249993 ?auto_250003 ) ) ( not ( = ?auto_249993 ?auto_250004 ) ) ( not ( = ?auto_249993 ?auto_250005 ) ) ( not ( = ?auto_249994 ?auto_249995 ) ) ( not ( = ?auto_249994 ?auto_249996 ) ) ( not ( = ?auto_249994 ?auto_249997 ) ) ( not ( = ?auto_249994 ?auto_249998 ) ) ( not ( = ?auto_249994 ?auto_249999 ) ) ( not ( = ?auto_249994 ?auto_250000 ) ) ( not ( = ?auto_249994 ?auto_250001 ) ) ( not ( = ?auto_249994 ?auto_250002 ) ) ( not ( = ?auto_249994 ?auto_250003 ) ) ( not ( = ?auto_249994 ?auto_250004 ) ) ( not ( = ?auto_249994 ?auto_250005 ) ) ( not ( = ?auto_249995 ?auto_249996 ) ) ( not ( = ?auto_249995 ?auto_249997 ) ) ( not ( = ?auto_249995 ?auto_249998 ) ) ( not ( = ?auto_249995 ?auto_249999 ) ) ( not ( = ?auto_249995 ?auto_250000 ) ) ( not ( = ?auto_249995 ?auto_250001 ) ) ( not ( = ?auto_249995 ?auto_250002 ) ) ( not ( = ?auto_249995 ?auto_250003 ) ) ( not ( = ?auto_249995 ?auto_250004 ) ) ( not ( = ?auto_249995 ?auto_250005 ) ) ( not ( = ?auto_249996 ?auto_249997 ) ) ( not ( = ?auto_249996 ?auto_249998 ) ) ( not ( = ?auto_249996 ?auto_249999 ) ) ( not ( = ?auto_249996 ?auto_250000 ) ) ( not ( = ?auto_249996 ?auto_250001 ) ) ( not ( = ?auto_249996 ?auto_250002 ) ) ( not ( = ?auto_249996 ?auto_250003 ) ) ( not ( = ?auto_249996 ?auto_250004 ) ) ( not ( = ?auto_249996 ?auto_250005 ) ) ( not ( = ?auto_249997 ?auto_249998 ) ) ( not ( = ?auto_249997 ?auto_249999 ) ) ( not ( = ?auto_249997 ?auto_250000 ) ) ( not ( = ?auto_249997 ?auto_250001 ) ) ( not ( = ?auto_249997 ?auto_250002 ) ) ( not ( = ?auto_249997 ?auto_250003 ) ) ( not ( = ?auto_249997 ?auto_250004 ) ) ( not ( = ?auto_249997 ?auto_250005 ) ) ( not ( = ?auto_249998 ?auto_249999 ) ) ( not ( = ?auto_249998 ?auto_250000 ) ) ( not ( = ?auto_249998 ?auto_250001 ) ) ( not ( = ?auto_249998 ?auto_250002 ) ) ( not ( = ?auto_249998 ?auto_250003 ) ) ( not ( = ?auto_249998 ?auto_250004 ) ) ( not ( = ?auto_249998 ?auto_250005 ) ) ( not ( = ?auto_249999 ?auto_250000 ) ) ( not ( = ?auto_249999 ?auto_250001 ) ) ( not ( = ?auto_249999 ?auto_250002 ) ) ( not ( = ?auto_249999 ?auto_250003 ) ) ( not ( = ?auto_249999 ?auto_250004 ) ) ( not ( = ?auto_249999 ?auto_250005 ) ) ( not ( = ?auto_250000 ?auto_250001 ) ) ( not ( = ?auto_250000 ?auto_250002 ) ) ( not ( = ?auto_250000 ?auto_250003 ) ) ( not ( = ?auto_250000 ?auto_250004 ) ) ( not ( = ?auto_250000 ?auto_250005 ) ) ( not ( = ?auto_250001 ?auto_250002 ) ) ( not ( = ?auto_250001 ?auto_250003 ) ) ( not ( = ?auto_250001 ?auto_250004 ) ) ( not ( = ?auto_250001 ?auto_250005 ) ) ( not ( = ?auto_250002 ?auto_250003 ) ) ( not ( = ?auto_250002 ?auto_250004 ) ) ( not ( = ?auto_250002 ?auto_250005 ) ) ( not ( = ?auto_250003 ?auto_250004 ) ) ( not ( = ?auto_250003 ?auto_250005 ) ) ( not ( = ?auto_250004 ?auto_250005 ) ) ( CLEAR ?auto_250003 ) ( ON ?auto_250004 ?auto_250005 ) ( CLEAR ?auto_250004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_249993 ?auto_249994 ?auto_249995 ?auto_249996 ?auto_249997 ?auto_249998 ?auto_249999 ?auto_250000 ?auto_250001 ?auto_250002 ?auto_250003 ?auto_250004 )
      ( MAKE-13PILE ?auto_249993 ?auto_249994 ?auto_249995 ?auto_249996 ?auto_249997 ?auto_249998 ?auto_249999 ?auto_250000 ?auto_250001 ?auto_250002 ?auto_250003 ?auto_250004 ?auto_250005 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250019 - BLOCK
      ?auto_250020 - BLOCK
      ?auto_250021 - BLOCK
      ?auto_250022 - BLOCK
      ?auto_250023 - BLOCK
      ?auto_250024 - BLOCK
      ?auto_250025 - BLOCK
      ?auto_250026 - BLOCK
      ?auto_250027 - BLOCK
      ?auto_250028 - BLOCK
      ?auto_250029 - BLOCK
      ?auto_250030 - BLOCK
      ?auto_250031 - BLOCK
    )
    :vars
    (
      ?auto_250032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250031 ?auto_250032 ) ( ON-TABLE ?auto_250019 ) ( ON ?auto_250020 ?auto_250019 ) ( ON ?auto_250021 ?auto_250020 ) ( ON ?auto_250022 ?auto_250021 ) ( ON ?auto_250023 ?auto_250022 ) ( ON ?auto_250024 ?auto_250023 ) ( ON ?auto_250025 ?auto_250024 ) ( ON ?auto_250026 ?auto_250025 ) ( ON ?auto_250027 ?auto_250026 ) ( ON ?auto_250028 ?auto_250027 ) ( not ( = ?auto_250019 ?auto_250020 ) ) ( not ( = ?auto_250019 ?auto_250021 ) ) ( not ( = ?auto_250019 ?auto_250022 ) ) ( not ( = ?auto_250019 ?auto_250023 ) ) ( not ( = ?auto_250019 ?auto_250024 ) ) ( not ( = ?auto_250019 ?auto_250025 ) ) ( not ( = ?auto_250019 ?auto_250026 ) ) ( not ( = ?auto_250019 ?auto_250027 ) ) ( not ( = ?auto_250019 ?auto_250028 ) ) ( not ( = ?auto_250019 ?auto_250029 ) ) ( not ( = ?auto_250019 ?auto_250030 ) ) ( not ( = ?auto_250019 ?auto_250031 ) ) ( not ( = ?auto_250019 ?auto_250032 ) ) ( not ( = ?auto_250020 ?auto_250021 ) ) ( not ( = ?auto_250020 ?auto_250022 ) ) ( not ( = ?auto_250020 ?auto_250023 ) ) ( not ( = ?auto_250020 ?auto_250024 ) ) ( not ( = ?auto_250020 ?auto_250025 ) ) ( not ( = ?auto_250020 ?auto_250026 ) ) ( not ( = ?auto_250020 ?auto_250027 ) ) ( not ( = ?auto_250020 ?auto_250028 ) ) ( not ( = ?auto_250020 ?auto_250029 ) ) ( not ( = ?auto_250020 ?auto_250030 ) ) ( not ( = ?auto_250020 ?auto_250031 ) ) ( not ( = ?auto_250020 ?auto_250032 ) ) ( not ( = ?auto_250021 ?auto_250022 ) ) ( not ( = ?auto_250021 ?auto_250023 ) ) ( not ( = ?auto_250021 ?auto_250024 ) ) ( not ( = ?auto_250021 ?auto_250025 ) ) ( not ( = ?auto_250021 ?auto_250026 ) ) ( not ( = ?auto_250021 ?auto_250027 ) ) ( not ( = ?auto_250021 ?auto_250028 ) ) ( not ( = ?auto_250021 ?auto_250029 ) ) ( not ( = ?auto_250021 ?auto_250030 ) ) ( not ( = ?auto_250021 ?auto_250031 ) ) ( not ( = ?auto_250021 ?auto_250032 ) ) ( not ( = ?auto_250022 ?auto_250023 ) ) ( not ( = ?auto_250022 ?auto_250024 ) ) ( not ( = ?auto_250022 ?auto_250025 ) ) ( not ( = ?auto_250022 ?auto_250026 ) ) ( not ( = ?auto_250022 ?auto_250027 ) ) ( not ( = ?auto_250022 ?auto_250028 ) ) ( not ( = ?auto_250022 ?auto_250029 ) ) ( not ( = ?auto_250022 ?auto_250030 ) ) ( not ( = ?auto_250022 ?auto_250031 ) ) ( not ( = ?auto_250022 ?auto_250032 ) ) ( not ( = ?auto_250023 ?auto_250024 ) ) ( not ( = ?auto_250023 ?auto_250025 ) ) ( not ( = ?auto_250023 ?auto_250026 ) ) ( not ( = ?auto_250023 ?auto_250027 ) ) ( not ( = ?auto_250023 ?auto_250028 ) ) ( not ( = ?auto_250023 ?auto_250029 ) ) ( not ( = ?auto_250023 ?auto_250030 ) ) ( not ( = ?auto_250023 ?auto_250031 ) ) ( not ( = ?auto_250023 ?auto_250032 ) ) ( not ( = ?auto_250024 ?auto_250025 ) ) ( not ( = ?auto_250024 ?auto_250026 ) ) ( not ( = ?auto_250024 ?auto_250027 ) ) ( not ( = ?auto_250024 ?auto_250028 ) ) ( not ( = ?auto_250024 ?auto_250029 ) ) ( not ( = ?auto_250024 ?auto_250030 ) ) ( not ( = ?auto_250024 ?auto_250031 ) ) ( not ( = ?auto_250024 ?auto_250032 ) ) ( not ( = ?auto_250025 ?auto_250026 ) ) ( not ( = ?auto_250025 ?auto_250027 ) ) ( not ( = ?auto_250025 ?auto_250028 ) ) ( not ( = ?auto_250025 ?auto_250029 ) ) ( not ( = ?auto_250025 ?auto_250030 ) ) ( not ( = ?auto_250025 ?auto_250031 ) ) ( not ( = ?auto_250025 ?auto_250032 ) ) ( not ( = ?auto_250026 ?auto_250027 ) ) ( not ( = ?auto_250026 ?auto_250028 ) ) ( not ( = ?auto_250026 ?auto_250029 ) ) ( not ( = ?auto_250026 ?auto_250030 ) ) ( not ( = ?auto_250026 ?auto_250031 ) ) ( not ( = ?auto_250026 ?auto_250032 ) ) ( not ( = ?auto_250027 ?auto_250028 ) ) ( not ( = ?auto_250027 ?auto_250029 ) ) ( not ( = ?auto_250027 ?auto_250030 ) ) ( not ( = ?auto_250027 ?auto_250031 ) ) ( not ( = ?auto_250027 ?auto_250032 ) ) ( not ( = ?auto_250028 ?auto_250029 ) ) ( not ( = ?auto_250028 ?auto_250030 ) ) ( not ( = ?auto_250028 ?auto_250031 ) ) ( not ( = ?auto_250028 ?auto_250032 ) ) ( not ( = ?auto_250029 ?auto_250030 ) ) ( not ( = ?auto_250029 ?auto_250031 ) ) ( not ( = ?auto_250029 ?auto_250032 ) ) ( not ( = ?auto_250030 ?auto_250031 ) ) ( not ( = ?auto_250030 ?auto_250032 ) ) ( not ( = ?auto_250031 ?auto_250032 ) ) ( ON ?auto_250030 ?auto_250031 ) ( CLEAR ?auto_250028 ) ( ON ?auto_250029 ?auto_250030 ) ( CLEAR ?auto_250029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_250019 ?auto_250020 ?auto_250021 ?auto_250022 ?auto_250023 ?auto_250024 ?auto_250025 ?auto_250026 ?auto_250027 ?auto_250028 ?auto_250029 )
      ( MAKE-13PILE ?auto_250019 ?auto_250020 ?auto_250021 ?auto_250022 ?auto_250023 ?auto_250024 ?auto_250025 ?auto_250026 ?auto_250027 ?auto_250028 ?auto_250029 ?auto_250030 ?auto_250031 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250046 - BLOCK
      ?auto_250047 - BLOCK
      ?auto_250048 - BLOCK
      ?auto_250049 - BLOCK
      ?auto_250050 - BLOCK
      ?auto_250051 - BLOCK
      ?auto_250052 - BLOCK
      ?auto_250053 - BLOCK
      ?auto_250054 - BLOCK
      ?auto_250055 - BLOCK
      ?auto_250056 - BLOCK
      ?auto_250057 - BLOCK
      ?auto_250058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250058 ) ( ON-TABLE ?auto_250046 ) ( ON ?auto_250047 ?auto_250046 ) ( ON ?auto_250048 ?auto_250047 ) ( ON ?auto_250049 ?auto_250048 ) ( ON ?auto_250050 ?auto_250049 ) ( ON ?auto_250051 ?auto_250050 ) ( ON ?auto_250052 ?auto_250051 ) ( ON ?auto_250053 ?auto_250052 ) ( ON ?auto_250054 ?auto_250053 ) ( ON ?auto_250055 ?auto_250054 ) ( not ( = ?auto_250046 ?auto_250047 ) ) ( not ( = ?auto_250046 ?auto_250048 ) ) ( not ( = ?auto_250046 ?auto_250049 ) ) ( not ( = ?auto_250046 ?auto_250050 ) ) ( not ( = ?auto_250046 ?auto_250051 ) ) ( not ( = ?auto_250046 ?auto_250052 ) ) ( not ( = ?auto_250046 ?auto_250053 ) ) ( not ( = ?auto_250046 ?auto_250054 ) ) ( not ( = ?auto_250046 ?auto_250055 ) ) ( not ( = ?auto_250046 ?auto_250056 ) ) ( not ( = ?auto_250046 ?auto_250057 ) ) ( not ( = ?auto_250046 ?auto_250058 ) ) ( not ( = ?auto_250047 ?auto_250048 ) ) ( not ( = ?auto_250047 ?auto_250049 ) ) ( not ( = ?auto_250047 ?auto_250050 ) ) ( not ( = ?auto_250047 ?auto_250051 ) ) ( not ( = ?auto_250047 ?auto_250052 ) ) ( not ( = ?auto_250047 ?auto_250053 ) ) ( not ( = ?auto_250047 ?auto_250054 ) ) ( not ( = ?auto_250047 ?auto_250055 ) ) ( not ( = ?auto_250047 ?auto_250056 ) ) ( not ( = ?auto_250047 ?auto_250057 ) ) ( not ( = ?auto_250047 ?auto_250058 ) ) ( not ( = ?auto_250048 ?auto_250049 ) ) ( not ( = ?auto_250048 ?auto_250050 ) ) ( not ( = ?auto_250048 ?auto_250051 ) ) ( not ( = ?auto_250048 ?auto_250052 ) ) ( not ( = ?auto_250048 ?auto_250053 ) ) ( not ( = ?auto_250048 ?auto_250054 ) ) ( not ( = ?auto_250048 ?auto_250055 ) ) ( not ( = ?auto_250048 ?auto_250056 ) ) ( not ( = ?auto_250048 ?auto_250057 ) ) ( not ( = ?auto_250048 ?auto_250058 ) ) ( not ( = ?auto_250049 ?auto_250050 ) ) ( not ( = ?auto_250049 ?auto_250051 ) ) ( not ( = ?auto_250049 ?auto_250052 ) ) ( not ( = ?auto_250049 ?auto_250053 ) ) ( not ( = ?auto_250049 ?auto_250054 ) ) ( not ( = ?auto_250049 ?auto_250055 ) ) ( not ( = ?auto_250049 ?auto_250056 ) ) ( not ( = ?auto_250049 ?auto_250057 ) ) ( not ( = ?auto_250049 ?auto_250058 ) ) ( not ( = ?auto_250050 ?auto_250051 ) ) ( not ( = ?auto_250050 ?auto_250052 ) ) ( not ( = ?auto_250050 ?auto_250053 ) ) ( not ( = ?auto_250050 ?auto_250054 ) ) ( not ( = ?auto_250050 ?auto_250055 ) ) ( not ( = ?auto_250050 ?auto_250056 ) ) ( not ( = ?auto_250050 ?auto_250057 ) ) ( not ( = ?auto_250050 ?auto_250058 ) ) ( not ( = ?auto_250051 ?auto_250052 ) ) ( not ( = ?auto_250051 ?auto_250053 ) ) ( not ( = ?auto_250051 ?auto_250054 ) ) ( not ( = ?auto_250051 ?auto_250055 ) ) ( not ( = ?auto_250051 ?auto_250056 ) ) ( not ( = ?auto_250051 ?auto_250057 ) ) ( not ( = ?auto_250051 ?auto_250058 ) ) ( not ( = ?auto_250052 ?auto_250053 ) ) ( not ( = ?auto_250052 ?auto_250054 ) ) ( not ( = ?auto_250052 ?auto_250055 ) ) ( not ( = ?auto_250052 ?auto_250056 ) ) ( not ( = ?auto_250052 ?auto_250057 ) ) ( not ( = ?auto_250052 ?auto_250058 ) ) ( not ( = ?auto_250053 ?auto_250054 ) ) ( not ( = ?auto_250053 ?auto_250055 ) ) ( not ( = ?auto_250053 ?auto_250056 ) ) ( not ( = ?auto_250053 ?auto_250057 ) ) ( not ( = ?auto_250053 ?auto_250058 ) ) ( not ( = ?auto_250054 ?auto_250055 ) ) ( not ( = ?auto_250054 ?auto_250056 ) ) ( not ( = ?auto_250054 ?auto_250057 ) ) ( not ( = ?auto_250054 ?auto_250058 ) ) ( not ( = ?auto_250055 ?auto_250056 ) ) ( not ( = ?auto_250055 ?auto_250057 ) ) ( not ( = ?auto_250055 ?auto_250058 ) ) ( not ( = ?auto_250056 ?auto_250057 ) ) ( not ( = ?auto_250056 ?auto_250058 ) ) ( not ( = ?auto_250057 ?auto_250058 ) ) ( ON ?auto_250057 ?auto_250058 ) ( CLEAR ?auto_250055 ) ( ON ?auto_250056 ?auto_250057 ) ( CLEAR ?auto_250056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_250046 ?auto_250047 ?auto_250048 ?auto_250049 ?auto_250050 ?auto_250051 ?auto_250052 ?auto_250053 ?auto_250054 ?auto_250055 ?auto_250056 )
      ( MAKE-13PILE ?auto_250046 ?auto_250047 ?auto_250048 ?auto_250049 ?auto_250050 ?auto_250051 ?auto_250052 ?auto_250053 ?auto_250054 ?auto_250055 ?auto_250056 ?auto_250057 ?auto_250058 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250072 - BLOCK
      ?auto_250073 - BLOCK
      ?auto_250074 - BLOCK
      ?auto_250075 - BLOCK
      ?auto_250076 - BLOCK
      ?auto_250077 - BLOCK
      ?auto_250078 - BLOCK
      ?auto_250079 - BLOCK
      ?auto_250080 - BLOCK
      ?auto_250081 - BLOCK
      ?auto_250082 - BLOCK
      ?auto_250083 - BLOCK
      ?auto_250084 - BLOCK
    )
    :vars
    (
      ?auto_250085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250084 ?auto_250085 ) ( ON-TABLE ?auto_250072 ) ( ON ?auto_250073 ?auto_250072 ) ( ON ?auto_250074 ?auto_250073 ) ( ON ?auto_250075 ?auto_250074 ) ( ON ?auto_250076 ?auto_250075 ) ( ON ?auto_250077 ?auto_250076 ) ( ON ?auto_250078 ?auto_250077 ) ( ON ?auto_250079 ?auto_250078 ) ( ON ?auto_250080 ?auto_250079 ) ( not ( = ?auto_250072 ?auto_250073 ) ) ( not ( = ?auto_250072 ?auto_250074 ) ) ( not ( = ?auto_250072 ?auto_250075 ) ) ( not ( = ?auto_250072 ?auto_250076 ) ) ( not ( = ?auto_250072 ?auto_250077 ) ) ( not ( = ?auto_250072 ?auto_250078 ) ) ( not ( = ?auto_250072 ?auto_250079 ) ) ( not ( = ?auto_250072 ?auto_250080 ) ) ( not ( = ?auto_250072 ?auto_250081 ) ) ( not ( = ?auto_250072 ?auto_250082 ) ) ( not ( = ?auto_250072 ?auto_250083 ) ) ( not ( = ?auto_250072 ?auto_250084 ) ) ( not ( = ?auto_250072 ?auto_250085 ) ) ( not ( = ?auto_250073 ?auto_250074 ) ) ( not ( = ?auto_250073 ?auto_250075 ) ) ( not ( = ?auto_250073 ?auto_250076 ) ) ( not ( = ?auto_250073 ?auto_250077 ) ) ( not ( = ?auto_250073 ?auto_250078 ) ) ( not ( = ?auto_250073 ?auto_250079 ) ) ( not ( = ?auto_250073 ?auto_250080 ) ) ( not ( = ?auto_250073 ?auto_250081 ) ) ( not ( = ?auto_250073 ?auto_250082 ) ) ( not ( = ?auto_250073 ?auto_250083 ) ) ( not ( = ?auto_250073 ?auto_250084 ) ) ( not ( = ?auto_250073 ?auto_250085 ) ) ( not ( = ?auto_250074 ?auto_250075 ) ) ( not ( = ?auto_250074 ?auto_250076 ) ) ( not ( = ?auto_250074 ?auto_250077 ) ) ( not ( = ?auto_250074 ?auto_250078 ) ) ( not ( = ?auto_250074 ?auto_250079 ) ) ( not ( = ?auto_250074 ?auto_250080 ) ) ( not ( = ?auto_250074 ?auto_250081 ) ) ( not ( = ?auto_250074 ?auto_250082 ) ) ( not ( = ?auto_250074 ?auto_250083 ) ) ( not ( = ?auto_250074 ?auto_250084 ) ) ( not ( = ?auto_250074 ?auto_250085 ) ) ( not ( = ?auto_250075 ?auto_250076 ) ) ( not ( = ?auto_250075 ?auto_250077 ) ) ( not ( = ?auto_250075 ?auto_250078 ) ) ( not ( = ?auto_250075 ?auto_250079 ) ) ( not ( = ?auto_250075 ?auto_250080 ) ) ( not ( = ?auto_250075 ?auto_250081 ) ) ( not ( = ?auto_250075 ?auto_250082 ) ) ( not ( = ?auto_250075 ?auto_250083 ) ) ( not ( = ?auto_250075 ?auto_250084 ) ) ( not ( = ?auto_250075 ?auto_250085 ) ) ( not ( = ?auto_250076 ?auto_250077 ) ) ( not ( = ?auto_250076 ?auto_250078 ) ) ( not ( = ?auto_250076 ?auto_250079 ) ) ( not ( = ?auto_250076 ?auto_250080 ) ) ( not ( = ?auto_250076 ?auto_250081 ) ) ( not ( = ?auto_250076 ?auto_250082 ) ) ( not ( = ?auto_250076 ?auto_250083 ) ) ( not ( = ?auto_250076 ?auto_250084 ) ) ( not ( = ?auto_250076 ?auto_250085 ) ) ( not ( = ?auto_250077 ?auto_250078 ) ) ( not ( = ?auto_250077 ?auto_250079 ) ) ( not ( = ?auto_250077 ?auto_250080 ) ) ( not ( = ?auto_250077 ?auto_250081 ) ) ( not ( = ?auto_250077 ?auto_250082 ) ) ( not ( = ?auto_250077 ?auto_250083 ) ) ( not ( = ?auto_250077 ?auto_250084 ) ) ( not ( = ?auto_250077 ?auto_250085 ) ) ( not ( = ?auto_250078 ?auto_250079 ) ) ( not ( = ?auto_250078 ?auto_250080 ) ) ( not ( = ?auto_250078 ?auto_250081 ) ) ( not ( = ?auto_250078 ?auto_250082 ) ) ( not ( = ?auto_250078 ?auto_250083 ) ) ( not ( = ?auto_250078 ?auto_250084 ) ) ( not ( = ?auto_250078 ?auto_250085 ) ) ( not ( = ?auto_250079 ?auto_250080 ) ) ( not ( = ?auto_250079 ?auto_250081 ) ) ( not ( = ?auto_250079 ?auto_250082 ) ) ( not ( = ?auto_250079 ?auto_250083 ) ) ( not ( = ?auto_250079 ?auto_250084 ) ) ( not ( = ?auto_250079 ?auto_250085 ) ) ( not ( = ?auto_250080 ?auto_250081 ) ) ( not ( = ?auto_250080 ?auto_250082 ) ) ( not ( = ?auto_250080 ?auto_250083 ) ) ( not ( = ?auto_250080 ?auto_250084 ) ) ( not ( = ?auto_250080 ?auto_250085 ) ) ( not ( = ?auto_250081 ?auto_250082 ) ) ( not ( = ?auto_250081 ?auto_250083 ) ) ( not ( = ?auto_250081 ?auto_250084 ) ) ( not ( = ?auto_250081 ?auto_250085 ) ) ( not ( = ?auto_250082 ?auto_250083 ) ) ( not ( = ?auto_250082 ?auto_250084 ) ) ( not ( = ?auto_250082 ?auto_250085 ) ) ( not ( = ?auto_250083 ?auto_250084 ) ) ( not ( = ?auto_250083 ?auto_250085 ) ) ( not ( = ?auto_250084 ?auto_250085 ) ) ( ON ?auto_250083 ?auto_250084 ) ( ON ?auto_250082 ?auto_250083 ) ( CLEAR ?auto_250080 ) ( ON ?auto_250081 ?auto_250082 ) ( CLEAR ?auto_250081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_250072 ?auto_250073 ?auto_250074 ?auto_250075 ?auto_250076 ?auto_250077 ?auto_250078 ?auto_250079 ?auto_250080 ?auto_250081 )
      ( MAKE-13PILE ?auto_250072 ?auto_250073 ?auto_250074 ?auto_250075 ?auto_250076 ?auto_250077 ?auto_250078 ?auto_250079 ?auto_250080 ?auto_250081 ?auto_250082 ?auto_250083 ?auto_250084 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250099 - BLOCK
      ?auto_250100 - BLOCK
      ?auto_250101 - BLOCK
      ?auto_250102 - BLOCK
      ?auto_250103 - BLOCK
      ?auto_250104 - BLOCK
      ?auto_250105 - BLOCK
      ?auto_250106 - BLOCK
      ?auto_250107 - BLOCK
      ?auto_250108 - BLOCK
      ?auto_250109 - BLOCK
      ?auto_250110 - BLOCK
      ?auto_250111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250111 ) ( ON-TABLE ?auto_250099 ) ( ON ?auto_250100 ?auto_250099 ) ( ON ?auto_250101 ?auto_250100 ) ( ON ?auto_250102 ?auto_250101 ) ( ON ?auto_250103 ?auto_250102 ) ( ON ?auto_250104 ?auto_250103 ) ( ON ?auto_250105 ?auto_250104 ) ( ON ?auto_250106 ?auto_250105 ) ( ON ?auto_250107 ?auto_250106 ) ( not ( = ?auto_250099 ?auto_250100 ) ) ( not ( = ?auto_250099 ?auto_250101 ) ) ( not ( = ?auto_250099 ?auto_250102 ) ) ( not ( = ?auto_250099 ?auto_250103 ) ) ( not ( = ?auto_250099 ?auto_250104 ) ) ( not ( = ?auto_250099 ?auto_250105 ) ) ( not ( = ?auto_250099 ?auto_250106 ) ) ( not ( = ?auto_250099 ?auto_250107 ) ) ( not ( = ?auto_250099 ?auto_250108 ) ) ( not ( = ?auto_250099 ?auto_250109 ) ) ( not ( = ?auto_250099 ?auto_250110 ) ) ( not ( = ?auto_250099 ?auto_250111 ) ) ( not ( = ?auto_250100 ?auto_250101 ) ) ( not ( = ?auto_250100 ?auto_250102 ) ) ( not ( = ?auto_250100 ?auto_250103 ) ) ( not ( = ?auto_250100 ?auto_250104 ) ) ( not ( = ?auto_250100 ?auto_250105 ) ) ( not ( = ?auto_250100 ?auto_250106 ) ) ( not ( = ?auto_250100 ?auto_250107 ) ) ( not ( = ?auto_250100 ?auto_250108 ) ) ( not ( = ?auto_250100 ?auto_250109 ) ) ( not ( = ?auto_250100 ?auto_250110 ) ) ( not ( = ?auto_250100 ?auto_250111 ) ) ( not ( = ?auto_250101 ?auto_250102 ) ) ( not ( = ?auto_250101 ?auto_250103 ) ) ( not ( = ?auto_250101 ?auto_250104 ) ) ( not ( = ?auto_250101 ?auto_250105 ) ) ( not ( = ?auto_250101 ?auto_250106 ) ) ( not ( = ?auto_250101 ?auto_250107 ) ) ( not ( = ?auto_250101 ?auto_250108 ) ) ( not ( = ?auto_250101 ?auto_250109 ) ) ( not ( = ?auto_250101 ?auto_250110 ) ) ( not ( = ?auto_250101 ?auto_250111 ) ) ( not ( = ?auto_250102 ?auto_250103 ) ) ( not ( = ?auto_250102 ?auto_250104 ) ) ( not ( = ?auto_250102 ?auto_250105 ) ) ( not ( = ?auto_250102 ?auto_250106 ) ) ( not ( = ?auto_250102 ?auto_250107 ) ) ( not ( = ?auto_250102 ?auto_250108 ) ) ( not ( = ?auto_250102 ?auto_250109 ) ) ( not ( = ?auto_250102 ?auto_250110 ) ) ( not ( = ?auto_250102 ?auto_250111 ) ) ( not ( = ?auto_250103 ?auto_250104 ) ) ( not ( = ?auto_250103 ?auto_250105 ) ) ( not ( = ?auto_250103 ?auto_250106 ) ) ( not ( = ?auto_250103 ?auto_250107 ) ) ( not ( = ?auto_250103 ?auto_250108 ) ) ( not ( = ?auto_250103 ?auto_250109 ) ) ( not ( = ?auto_250103 ?auto_250110 ) ) ( not ( = ?auto_250103 ?auto_250111 ) ) ( not ( = ?auto_250104 ?auto_250105 ) ) ( not ( = ?auto_250104 ?auto_250106 ) ) ( not ( = ?auto_250104 ?auto_250107 ) ) ( not ( = ?auto_250104 ?auto_250108 ) ) ( not ( = ?auto_250104 ?auto_250109 ) ) ( not ( = ?auto_250104 ?auto_250110 ) ) ( not ( = ?auto_250104 ?auto_250111 ) ) ( not ( = ?auto_250105 ?auto_250106 ) ) ( not ( = ?auto_250105 ?auto_250107 ) ) ( not ( = ?auto_250105 ?auto_250108 ) ) ( not ( = ?auto_250105 ?auto_250109 ) ) ( not ( = ?auto_250105 ?auto_250110 ) ) ( not ( = ?auto_250105 ?auto_250111 ) ) ( not ( = ?auto_250106 ?auto_250107 ) ) ( not ( = ?auto_250106 ?auto_250108 ) ) ( not ( = ?auto_250106 ?auto_250109 ) ) ( not ( = ?auto_250106 ?auto_250110 ) ) ( not ( = ?auto_250106 ?auto_250111 ) ) ( not ( = ?auto_250107 ?auto_250108 ) ) ( not ( = ?auto_250107 ?auto_250109 ) ) ( not ( = ?auto_250107 ?auto_250110 ) ) ( not ( = ?auto_250107 ?auto_250111 ) ) ( not ( = ?auto_250108 ?auto_250109 ) ) ( not ( = ?auto_250108 ?auto_250110 ) ) ( not ( = ?auto_250108 ?auto_250111 ) ) ( not ( = ?auto_250109 ?auto_250110 ) ) ( not ( = ?auto_250109 ?auto_250111 ) ) ( not ( = ?auto_250110 ?auto_250111 ) ) ( ON ?auto_250110 ?auto_250111 ) ( ON ?auto_250109 ?auto_250110 ) ( CLEAR ?auto_250107 ) ( ON ?auto_250108 ?auto_250109 ) ( CLEAR ?auto_250108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_250099 ?auto_250100 ?auto_250101 ?auto_250102 ?auto_250103 ?auto_250104 ?auto_250105 ?auto_250106 ?auto_250107 ?auto_250108 )
      ( MAKE-13PILE ?auto_250099 ?auto_250100 ?auto_250101 ?auto_250102 ?auto_250103 ?auto_250104 ?auto_250105 ?auto_250106 ?auto_250107 ?auto_250108 ?auto_250109 ?auto_250110 ?auto_250111 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250125 - BLOCK
      ?auto_250126 - BLOCK
      ?auto_250127 - BLOCK
      ?auto_250128 - BLOCK
      ?auto_250129 - BLOCK
      ?auto_250130 - BLOCK
      ?auto_250131 - BLOCK
      ?auto_250132 - BLOCK
      ?auto_250133 - BLOCK
      ?auto_250134 - BLOCK
      ?auto_250135 - BLOCK
      ?auto_250136 - BLOCK
      ?auto_250137 - BLOCK
    )
    :vars
    (
      ?auto_250138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250137 ?auto_250138 ) ( ON-TABLE ?auto_250125 ) ( ON ?auto_250126 ?auto_250125 ) ( ON ?auto_250127 ?auto_250126 ) ( ON ?auto_250128 ?auto_250127 ) ( ON ?auto_250129 ?auto_250128 ) ( ON ?auto_250130 ?auto_250129 ) ( ON ?auto_250131 ?auto_250130 ) ( ON ?auto_250132 ?auto_250131 ) ( not ( = ?auto_250125 ?auto_250126 ) ) ( not ( = ?auto_250125 ?auto_250127 ) ) ( not ( = ?auto_250125 ?auto_250128 ) ) ( not ( = ?auto_250125 ?auto_250129 ) ) ( not ( = ?auto_250125 ?auto_250130 ) ) ( not ( = ?auto_250125 ?auto_250131 ) ) ( not ( = ?auto_250125 ?auto_250132 ) ) ( not ( = ?auto_250125 ?auto_250133 ) ) ( not ( = ?auto_250125 ?auto_250134 ) ) ( not ( = ?auto_250125 ?auto_250135 ) ) ( not ( = ?auto_250125 ?auto_250136 ) ) ( not ( = ?auto_250125 ?auto_250137 ) ) ( not ( = ?auto_250125 ?auto_250138 ) ) ( not ( = ?auto_250126 ?auto_250127 ) ) ( not ( = ?auto_250126 ?auto_250128 ) ) ( not ( = ?auto_250126 ?auto_250129 ) ) ( not ( = ?auto_250126 ?auto_250130 ) ) ( not ( = ?auto_250126 ?auto_250131 ) ) ( not ( = ?auto_250126 ?auto_250132 ) ) ( not ( = ?auto_250126 ?auto_250133 ) ) ( not ( = ?auto_250126 ?auto_250134 ) ) ( not ( = ?auto_250126 ?auto_250135 ) ) ( not ( = ?auto_250126 ?auto_250136 ) ) ( not ( = ?auto_250126 ?auto_250137 ) ) ( not ( = ?auto_250126 ?auto_250138 ) ) ( not ( = ?auto_250127 ?auto_250128 ) ) ( not ( = ?auto_250127 ?auto_250129 ) ) ( not ( = ?auto_250127 ?auto_250130 ) ) ( not ( = ?auto_250127 ?auto_250131 ) ) ( not ( = ?auto_250127 ?auto_250132 ) ) ( not ( = ?auto_250127 ?auto_250133 ) ) ( not ( = ?auto_250127 ?auto_250134 ) ) ( not ( = ?auto_250127 ?auto_250135 ) ) ( not ( = ?auto_250127 ?auto_250136 ) ) ( not ( = ?auto_250127 ?auto_250137 ) ) ( not ( = ?auto_250127 ?auto_250138 ) ) ( not ( = ?auto_250128 ?auto_250129 ) ) ( not ( = ?auto_250128 ?auto_250130 ) ) ( not ( = ?auto_250128 ?auto_250131 ) ) ( not ( = ?auto_250128 ?auto_250132 ) ) ( not ( = ?auto_250128 ?auto_250133 ) ) ( not ( = ?auto_250128 ?auto_250134 ) ) ( not ( = ?auto_250128 ?auto_250135 ) ) ( not ( = ?auto_250128 ?auto_250136 ) ) ( not ( = ?auto_250128 ?auto_250137 ) ) ( not ( = ?auto_250128 ?auto_250138 ) ) ( not ( = ?auto_250129 ?auto_250130 ) ) ( not ( = ?auto_250129 ?auto_250131 ) ) ( not ( = ?auto_250129 ?auto_250132 ) ) ( not ( = ?auto_250129 ?auto_250133 ) ) ( not ( = ?auto_250129 ?auto_250134 ) ) ( not ( = ?auto_250129 ?auto_250135 ) ) ( not ( = ?auto_250129 ?auto_250136 ) ) ( not ( = ?auto_250129 ?auto_250137 ) ) ( not ( = ?auto_250129 ?auto_250138 ) ) ( not ( = ?auto_250130 ?auto_250131 ) ) ( not ( = ?auto_250130 ?auto_250132 ) ) ( not ( = ?auto_250130 ?auto_250133 ) ) ( not ( = ?auto_250130 ?auto_250134 ) ) ( not ( = ?auto_250130 ?auto_250135 ) ) ( not ( = ?auto_250130 ?auto_250136 ) ) ( not ( = ?auto_250130 ?auto_250137 ) ) ( not ( = ?auto_250130 ?auto_250138 ) ) ( not ( = ?auto_250131 ?auto_250132 ) ) ( not ( = ?auto_250131 ?auto_250133 ) ) ( not ( = ?auto_250131 ?auto_250134 ) ) ( not ( = ?auto_250131 ?auto_250135 ) ) ( not ( = ?auto_250131 ?auto_250136 ) ) ( not ( = ?auto_250131 ?auto_250137 ) ) ( not ( = ?auto_250131 ?auto_250138 ) ) ( not ( = ?auto_250132 ?auto_250133 ) ) ( not ( = ?auto_250132 ?auto_250134 ) ) ( not ( = ?auto_250132 ?auto_250135 ) ) ( not ( = ?auto_250132 ?auto_250136 ) ) ( not ( = ?auto_250132 ?auto_250137 ) ) ( not ( = ?auto_250132 ?auto_250138 ) ) ( not ( = ?auto_250133 ?auto_250134 ) ) ( not ( = ?auto_250133 ?auto_250135 ) ) ( not ( = ?auto_250133 ?auto_250136 ) ) ( not ( = ?auto_250133 ?auto_250137 ) ) ( not ( = ?auto_250133 ?auto_250138 ) ) ( not ( = ?auto_250134 ?auto_250135 ) ) ( not ( = ?auto_250134 ?auto_250136 ) ) ( not ( = ?auto_250134 ?auto_250137 ) ) ( not ( = ?auto_250134 ?auto_250138 ) ) ( not ( = ?auto_250135 ?auto_250136 ) ) ( not ( = ?auto_250135 ?auto_250137 ) ) ( not ( = ?auto_250135 ?auto_250138 ) ) ( not ( = ?auto_250136 ?auto_250137 ) ) ( not ( = ?auto_250136 ?auto_250138 ) ) ( not ( = ?auto_250137 ?auto_250138 ) ) ( ON ?auto_250136 ?auto_250137 ) ( ON ?auto_250135 ?auto_250136 ) ( ON ?auto_250134 ?auto_250135 ) ( CLEAR ?auto_250132 ) ( ON ?auto_250133 ?auto_250134 ) ( CLEAR ?auto_250133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_250125 ?auto_250126 ?auto_250127 ?auto_250128 ?auto_250129 ?auto_250130 ?auto_250131 ?auto_250132 ?auto_250133 )
      ( MAKE-13PILE ?auto_250125 ?auto_250126 ?auto_250127 ?auto_250128 ?auto_250129 ?auto_250130 ?auto_250131 ?auto_250132 ?auto_250133 ?auto_250134 ?auto_250135 ?auto_250136 ?auto_250137 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250152 - BLOCK
      ?auto_250153 - BLOCK
      ?auto_250154 - BLOCK
      ?auto_250155 - BLOCK
      ?auto_250156 - BLOCK
      ?auto_250157 - BLOCK
      ?auto_250158 - BLOCK
      ?auto_250159 - BLOCK
      ?auto_250160 - BLOCK
      ?auto_250161 - BLOCK
      ?auto_250162 - BLOCK
      ?auto_250163 - BLOCK
      ?auto_250164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250164 ) ( ON-TABLE ?auto_250152 ) ( ON ?auto_250153 ?auto_250152 ) ( ON ?auto_250154 ?auto_250153 ) ( ON ?auto_250155 ?auto_250154 ) ( ON ?auto_250156 ?auto_250155 ) ( ON ?auto_250157 ?auto_250156 ) ( ON ?auto_250158 ?auto_250157 ) ( ON ?auto_250159 ?auto_250158 ) ( not ( = ?auto_250152 ?auto_250153 ) ) ( not ( = ?auto_250152 ?auto_250154 ) ) ( not ( = ?auto_250152 ?auto_250155 ) ) ( not ( = ?auto_250152 ?auto_250156 ) ) ( not ( = ?auto_250152 ?auto_250157 ) ) ( not ( = ?auto_250152 ?auto_250158 ) ) ( not ( = ?auto_250152 ?auto_250159 ) ) ( not ( = ?auto_250152 ?auto_250160 ) ) ( not ( = ?auto_250152 ?auto_250161 ) ) ( not ( = ?auto_250152 ?auto_250162 ) ) ( not ( = ?auto_250152 ?auto_250163 ) ) ( not ( = ?auto_250152 ?auto_250164 ) ) ( not ( = ?auto_250153 ?auto_250154 ) ) ( not ( = ?auto_250153 ?auto_250155 ) ) ( not ( = ?auto_250153 ?auto_250156 ) ) ( not ( = ?auto_250153 ?auto_250157 ) ) ( not ( = ?auto_250153 ?auto_250158 ) ) ( not ( = ?auto_250153 ?auto_250159 ) ) ( not ( = ?auto_250153 ?auto_250160 ) ) ( not ( = ?auto_250153 ?auto_250161 ) ) ( not ( = ?auto_250153 ?auto_250162 ) ) ( not ( = ?auto_250153 ?auto_250163 ) ) ( not ( = ?auto_250153 ?auto_250164 ) ) ( not ( = ?auto_250154 ?auto_250155 ) ) ( not ( = ?auto_250154 ?auto_250156 ) ) ( not ( = ?auto_250154 ?auto_250157 ) ) ( not ( = ?auto_250154 ?auto_250158 ) ) ( not ( = ?auto_250154 ?auto_250159 ) ) ( not ( = ?auto_250154 ?auto_250160 ) ) ( not ( = ?auto_250154 ?auto_250161 ) ) ( not ( = ?auto_250154 ?auto_250162 ) ) ( not ( = ?auto_250154 ?auto_250163 ) ) ( not ( = ?auto_250154 ?auto_250164 ) ) ( not ( = ?auto_250155 ?auto_250156 ) ) ( not ( = ?auto_250155 ?auto_250157 ) ) ( not ( = ?auto_250155 ?auto_250158 ) ) ( not ( = ?auto_250155 ?auto_250159 ) ) ( not ( = ?auto_250155 ?auto_250160 ) ) ( not ( = ?auto_250155 ?auto_250161 ) ) ( not ( = ?auto_250155 ?auto_250162 ) ) ( not ( = ?auto_250155 ?auto_250163 ) ) ( not ( = ?auto_250155 ?auto_250164 ) ) ( not ( = ?auto_250156 ?auto_250157 ) ) ( not ( = ?auto_250156 ?auto_250158 ) ) ( not ( = ?auto_250156 ?auto_250159 ) ) ( not ( = ?auto_250156 ?auto_250160 ) ) ( not ( = ?auto_250156 ?auto_250161 ) ) ( not ( = ?auto_250156 ?auto_250162 ) ) ( not ( = ?auto_250156 ?auto_250163 ) ) ( not ( = ?auto_250156 ?auto_250164 ) ) ( not ( = ?auto_250157 ?auto_250158 ) ) ( not ( = ?auto_250157 ?auto_250159 ) ) ( not ( = ?auto_250157 ?auto_250160 ) ) ( not ( = ?auto_250157 ?auto_250161 ) ) ( not ( = ?auto_250157 ?auto_250162 ) ) ( not ( = ?auto_250157 ?auto_250163 ) ) ( not ( = ?auto_250157 ?auto_250164 ) ) ( not ( = ?auto_250158 ?auto_250159 ) ) ( not ( = ?auto_250158 ?auto_250160 ) ) ( not ( = ?auto_250158 ?auto_250161 ) ) ( not ( = ?auto_250158 ?auto_250162 ) ) ( not ( = ?auto_250158 ?auto_250163 ) ) ( not ( = ?auto_250158 ?auto_250164 ) ) ( not ( = ?auto_250159 ?auto_250160 ) ) ( not ( = ?auto_250159 ?auto_250161 ) ) ( not ( = ?auto_250159 ?auto_250162 ) ) ( not ( = ?auto_250159 ?auto_250163 ) ) ( not ( = ?auto_250159 ?auto_250164 ) ) ( not ( = ?auto_250160 ?auto_250161 ) ) ( not ( = ?auto_250160 ?auto_250162 ) ) ( not ( = ?auto_250160 ?auto_250163 ) ) ( not ( = ?auto_250160 ?auto_250164 ) ) ( not ( = ?auto_250161 ?auto_250162 ) ) ( not ( = ?auto_250161 ?auto_250163 ) ) ( not ( = ?auto_250161 ?auto_250164 ) ) ( not ( = ?auto_250162 ?auto_250163 ) ) ( not ( = ?auto_250162 ?auto_250164 ) ) ( not ( = ?auto_250163 ?auto_250164 ) ) ( ON ?auto_250163 ?auto_250164 ) ( ON ?auto_250162 ?auto_250163 ) ( ON ?auto_250161 ?auto_250162 ) ( CLEAR ?auto_250159 ) ( ON ?auto_250160 ?auto_250161 ) ( CLEAR ?auto_250160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_250152 ?auto_250153 ?auto_250154 ?auto_250155 ?auto_250156 ?auto_250157 ?auto_250158 ?auto_250159 ?auto_250160 )
      ( MAKE-13PILE ?auto_250152 ?auto_250153 ?auto_250154 ?auto_250155 ?auto_250156 ?auto_250157 ?auto_250158 ?auto_250159 ?auto_250160 ?auto_250161 ?auto_250162 ?auto_250163 ?auto_250164 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250178 - BLOCK
      ?auto_250179 - BLOCK
      ?auto_250180 - BLOCK
      ?auto_250181 - BLOCK
      ?auto_250182 - BLOCK
      ?auto_250183 - BLOCK
      ?auto_250184 - BLOCK
      ?auto_250185 - BLOCK
      ?auto_250186 - BLOCK
      ?auto_250187 - BLOCK
      ?auto_250188 - BLOCK
      ?auto_250189 - BLOCK
      ?auto_250190 - BLOCK
    )
    :vars
    (
      ?auto_250191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250190 ?auto_250191 ) ( ON-TABLE ?auto_250178 ) ( ON ?auto_250179 ?auto_250178 ) ( ON ?auto_250180 ?auto_250179 ) ( ON ?auto_250181 ?auto_250180 ) ( ON ?auto_250182 ?auto_250181 ) ( ON ?auto_250183 ?auto_250182 ) ( ON ?auto_250184 ?auto_250183 ) ( not ( = ?auto_250178 ?auto_250179 ) ) ( not ( = ?auto_250178 ?auto_250180 ) ) ( not ( = ?auto_250178 ?auto_250181 ) ) ( not ( = ?auto_250178 ?auto_250182 ) ) ( not ( = ?auto_250178 ?auto_250183 ) ) ( not ( = ?auto_250178 ?auto_250184 ) ) ( not ( = ?auto_250178 ?auto_250185 ) ) ( not ( = ?auto_250178 ?auto_250186 ) ) ( not ( = ?auto_250178 ?auto_250187 ) ) ( not ( = ?auto_250178 ?auto_250188 ) ) ( not ( = ?auto_250178 ?auto_250189 ) ) ( not ( = ?auto_250178 ?auto_250190 ) ) ( not ( = ?auto_250178 ?auto_250191 ) ) ( not ( = ?auto_250179 ?auto_250180 ) ) ( not ( = ?auto_250179 ?auto_250181 ) ) ( not ( = ?auto_250179 ?auto_250182 ) ) ( not ( = ?auto_250179 ?auto_250183 ) ) ( not ( = ?auto_250179 ?auto_250184 ) ) ( not ( = ?auto_250179 ?auto_250185 ) ) ( not ( = ?auto_250179 ?auto_250186 ) ) ( not ( = ?auto_250179 ?auto_250187 ) ) ( not ( = ?auto_250179 ?auto_250188 ) ) ( not ( = ?auto_250179 ?auto_250189 ) ) ( not ( = ?auto_250179 ?auto_250190 ) ) ( not ( = ?auto_250179 ?auto_250191 ) ) ( not ( = ?auto_250180 ?auto_250181 ) ) ( not ( = ?auto_250180 ?auto_250182 ) ) ( not ( = ?auto_250180 ?auto_250183 ) ) ( not ( = ?auto_250180 ?auto_250184 ) ) ( not ( = ?auto_250180 ?auto_250185 ) ) ( not ( = ?auto_250180 ?auto_250186 ) ) ( not ( = ?auto_250180 ?auto_250187 ) ) ( not ( = ?auto_250180 ?auto_250188 ) ) ( not ( = ?auto_250180 ?auto_250189 ) ) ( not ( = ?auto_250180 ?auto_250190 ) ) ( not ( = ?auto_250180 ?auto_250191 ) ) ( not ( = ?auto_250181 ?auto_250182 ) ) ( not ( = ?auto_250181 ?auto_250183 ) ) ( not ( = ?auto_250181 ?auto_250184 ) ) ( not ( = ?auto_250181 ?auto_250185 ) ) ( not ( = ?auto_250181 ?auto_250186 ) ) ( not ( = ?auto_250181 ?auto_250187 ) ) ( not ( = ?auto_250181 ?auto_250188 ) ) ( not ( = ?auto_250181 ?auto_250189 ) ) ( not ( = ?auto_250181 ?auto_250190 ) ) ( not ( = ?auto_250181 ?auto_250191 ) ) ( not ( = ?auto_250182 ?auto_250183 ) ) ( not ( = ?auto_250182 ?auto_250184 ) ) ( not ( = ?auto_250182 ?auto_250185 ) ) ( not ( = ?auto_250182 ?auto_250186 ) ) ( not ( = ?auto_250182 ?auto_250187 ) ) ( not ( = ?auto_250182 ?auto_250188 ) ) ( not ( = ?auto_250182 ?auto_250189 ) ) ( not ( = ?auto_250182 ?auto_250190 ) ) ( not ( = ?auto_250182 ?auto_250191 ) ) ( not ( = ?auto_250183 ?auto_250184 ) ) ( not ( = ?auto_250183 ?auto_250185 ) ) ( not ( = ?auto_250183 ?auto_250186 ) ) ( not ( = ?auto_250183 ?auto_250187 ) ) ( not ( = ?auto_250183 ?auto_250188 ) ) ( not ( = ?auto_250183 ?auto_250189 ) ) ( not ( = ?auto_250183 ?auto_250190 ) ) ( not ( = ?auto_250183 ?auto_250191 ) ) ( not ( = ?auto_250184 ?auto_250185 ) ) ( not ( = ?auto_250184 ?auto_250186 ) ) ( not ( = ?auto_250184 ?auto_250187 ) ) ( not ( = ?auto_250184 ?auto_250188 ) ) ( not ( = ?auto_250184 ?auto_250189 ) ) ( not ( = ?auto_250184 ?auto_250190 ) ) ( not ( = ?auto_250184 ?auto_250191 ) ) ( not ( = ?auto_250185 ?auto_250186 ) ) ( not ( = ?auto_250185 ?auto_250187 ) ) ( not ( = ?auto_250185 ?auto_250188 ) ) ( not ( = ?auto_250185 ?auto_250189 ) ) ( not ( = ?auto_250185 ?auto_250190 ) ) ( not ( = ?auto_250185 ?auto_250191 ) ) ( not ( = ?auto_250186 ?auto_250187 ) ) ( not ( = ?auto_250186 ?auto_250188 ) ) ( not ( = ?auto_250186 ?auto_250189 ) ) ( not ( = ?auto_250186 ?auto_250190 ) ) ( not ( = ?auto_250186 ?auto_250191 ) ) ( not ( = ?auto_250187 ?auto_250188 ) ) ( not ( = ?auto_250187 ?auto_250189 ) ) ( not ( = ?auto_250187 ?auto_250190 ) ) ( not ( = ?auto_250187 ?auto_250191 ) ) ( not ( = ?auto_250188 ?auto_250189 ) ) ( not ( = ?auto_250188 ?auto_250190 ) ) ( not ( = ?auto_250188 ?auto_250191 ) ) ( not ( = ?auto_250189 ?auto_250190 ) ) ( not ( = ?auto_250189 ?auto_250191 ) ) ( not ( = ?auto_250190 ?auto_250191 ) ) ( ON ?auto_250189 ?auto_250190 ) ( ON ?auto_250188 ?auto_250189 ) ( ON ?auto_250187 ?auto_250188 ) ( ON ?auto_250186 ?auto_250187 ) ( CLEAR ?auto_250184 ) ( ON ?auto_250185 ?auto_250186 ) ( CLEAR ?auto_250185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_250178 ?auto_250179 ?auto_250180 ?auto_250181 ?auto_250182 ?auto_250183 ?auto_250184 ?auto_250185 )
      ( MAKE-13PILE ?auto_250178 ?auto_250179 ?auto_250180 ?auto_250181 ?auto_250182 ?auto_250183 ?auto_250184 ?auto_250185 ?auto_250186 ?auto_250187 ?auto_250188 ?auto_250189 ?auto_250190 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250205 - BLOCK
      ?auto_250206 - BLOCK
      ?auto_250207 - BLOCK
      ?auto_250208 - BLOCK
      ?auto_250209 - BLOCK
      ?auto_250210 - BLOCK
      ?auto_250211 - BLOCK
      ?auto_250212 - BLOCK
      ?auto_250213 - BLOCK
      ?auto_250214 - BLOCK
      ?auto_250215 - BLOCK
      ?auto_250216 - BLOCK
      ?auto_250217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250217 ) ( ON-TABLE ?auto_250205 ) ( ON ?auto_250206 ?auto_250205 ) ( ON ?auto_250207 ?auto_250206 ) ( ON ?auto_250208 ?auto_250207 ) ( ON ?auto_250209 ?auto_250208 ) ( ON ?auto_250210 ?auto_250209 ) ( ON ?auto_250211 ?auto_250210 ) ( not ( = ?auto_250205 ?auto_250206 ) ) ( not ( = ?auto_250205 ?auto_250207 ) ) ( not ( = ?auto_250205 ?auto_250208 ) ) ( not ( = ?auto_250205 ?auto_250209 ) ) ( not ( = ?auto_250205 ?auto_250210 ) ) ( not ( = ?auto_250205 ?auto_250211 ) ) ( not ( = ?auto_250205 ?auto_250212 ) ) ( not ( = ?auto_250205 ?auto_250213 ) ) ( not ( = ?auto_250205 ?auto_250214 ) ) ( not ( = ?auto_250205 ?auto_250215 ) ) ( not ( = ?auto_250205 ?auto_250216 ) ) ( not ( = ?auto_250205 ?auto_250217 ) ) ( not ( = ?auto_250206 ?auto_250207 ) ) ( not ( = ?auto_250206 ?auto_250208 ) ) ( not ( = ?auto_250206 ?auto_250209 ) ) ( not ( = ?auto_250206 ?auto_250210 ) ) ( not ( = ?auto_250206 ?auto_250211 ) ) ( not ( = ?auto_250206 ?auto_250212 ) ) ( not ( = ?auto_250206 ?auto_250213 ) ) ( not ( = ?auto_250206 ?auto_250214 ) ) ( not ( = ?auto_250206 ?auto_250215 ) ) ( not ( = ?auto_250206 ?auto_250216 ) ) ( not ( = ?auto_250206 ?auto_250217 ) ) ( not ( = ?auto_250207 ?auto_250208 ) ) ( not ( = ?auto_250207 ?auto_250209 ) ) ( not ( = ?auto_250207 ?auto_250210 ) ) ( not ( = ?auto_250207 ?auto_250211 ) ) ( not ( = ?auto_250207 ?auto_250212 ) ) ( not ( = ?auto_250207 ?auto_250213 ) ) ( not ( = ?auto_250207 ?auto_250214 ) ) ( not ( = ?auto_250207 ?auto_250215 ) ) ( not ( = ?auto_250207 ?auto_250216 ) ) ( not ( = ?auto_250207 ?auto_250217 ) ) ( not ( = ?auto_250208 ?auto_250209 ) ) ( not ( = ?auto_250208 ?auto_250210 ) ) ( not ( = ?auto_250208 ?auto_250211 ) ) ( not ( = ?auto_250208 ?auto_250212 ) ) ( not ( = ?auto_250208 ?auto_250213 ) ) ( not ( = ?auto_250208 ?auto_250214 ) ) ( not ( = ?auto_250208 ?auto_250215 ) ) ( not ( = ?auto_250208 ?auto_250216 ) ) ( not ( = ?auto_250208 ?auto_250217 ) ) ( not ( = ?auto_250209 ?auto_250210 ) ) ( not ( = ?auto_250209 ?auto_250211 ) ) ( not ( = ?auto_250209 ?auto_250212 ) ) ( not ( = ?auto_250209 ?auto_250213 ) ) ( not ( = ?auto_250209 ?auto_250214 ) ) ( not ( = ?auto_250209 ?auto_250215 ) ) ( not ( = ?auto_250209 ?auto_250216 ) ) ( not ( = ?auto_250209 ?auto_250217 ) ) ( not ( = ?auto_250210 ?auto_250211 ) ) ( not ( = ?auto_250210 ?auto_250212 ) ) ( not ( = ?auto_250210 ?auto_250213 ) ) ( not ( = ?auto_250210 ?auto_250214 ) ) ( not ( = ?auto_250210 ?auto_250215 ) ) ( not ( = ?auto_250210 ?auto_250216 ) ) ( not ( = ?auto_250210 ?auto_250217 ) ) ( not ( = ?auto_250211 ?auto_250212 ) ) ( not ( = ?auto_250211 ?auto_250213 ) ) ( not ( = ?auto_250211 ?auto_250214 ) ) ( not ( = ?auto_250211 ?auto_250215 ) ) ( not ( = ?auto_250211 ?auto_250216 ) ) ( not ( = ?auto_250211 ?auto_250217 ) ) ( not ( = ?auto_250212 ?auto_250213 ) ) ( not ( = ?auto_250212 ?auto_250214 ) ) ( not ( = ?auto_250212 ?auto_250215 ) ) ( not ( = ?auto_250212 ?auto_250216 ) ) ( not ( = ?auto_250212 ?auto_250217 ) ) ( not ( = ?auto_250213 ?auto_250214 ) ) ( not ( = ?auto_250213 ?auto_250215 ) ) ( not ( = ?auto_250213 ?auto_250216 ) ) ( not ( = ?auto_250213 ?auto_250217 ) ) ( not ( = ?auto_250214 ?auto_250215 ) ) ( not ( = ?auto_250214 ?auto_250216 ) ) ( not ( = ?auto_250214 ?auto_250217 ) ) ( not ( = ?auto_250215 ?auto_250216 ) ) ( not ( = ?auto_250215 ?auto_250217 ) ) ( not ( = ?auto_250216 ?auto_250217 ) ) ( ON ?auto_250216 ?auto_250217 ) ( ON ?auto_250215 ?auto_250216 ) ( ON ?auto_250214 ?auto_250215 ) ( ON ?auto_250213 ?auto_250214 ) ( CLEAR ?auto_250211 ) ( ON ?auto_250212 ?auto_250213 ) ( CLEAR ?auto_250212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_250205 ?auto_250206 ?auto_250207 ?auto_250208 ?auto_250209 ?auto_250210 ?auto_250211 ?auto_250212 )
      ( MAKE-13PILE ?auto_250205 ?auto_250206 ?auto_250207 ?auto_250208 ?auto_250209 ?auto_250210 ?auto_250211 ?auto_250212 ?auto_250213 ?auto_250214 ?auto_250215 ?auto_250216 ?auto_250217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250231 - BLOCK
      ?auto_250232 - BLOCK
      ?auto_250233 - BLOCK
      ?auto_250234 - BLOCK
      ?auto_250235 - BLOCK
      ?auto_250236 - BLOCK
      ?auto_250237 - BLOCK
      ?auto_250238 - BLOCK
      ?auto_250239 - BLOCK
      ?auto_250240 - BLOCK
      ?auto_250241 - BLOCK
      ?auto_250242 - BLOCK
      ?auto_250243 - BLOCK
    )
    :vars
    (
      ?auto_250244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250243 ?auto_250244 ) ( ON-TABLE ?auto_250231 ) ( ON ?auto_250232 ?auto_250231 ) ( ON ?auto_250233 ?auto_250232 ) ( ON ?auto_250234 ?auto_250233 ) ( ON ?auto_250235 ?auto_250234 ) ( ON ?auto_250236 ?auto_250235 ) ( not ( = ?auto_250231 ?auto_250232 ) ) ( not ( = ?auto_250231 ?auto_250233 ) ) ( not ( = ?auto_250231 ?auto_250234 ) ) ( not ( = ?auto_250231 ?auto_250235 ) ) ( not ( = ?auto_250231 ?auto_250236 ) ) ( not ( = ?auto_250231 ?auto_250237 ) ) ( not ( = ?auto_250231 ?auto_250238 ) ) ( not ( = ?auto_250231 ?auto_250239 ) ) ( not ( = ?auto_250231 ?auto_250240 ) ) ( not ( = ?auto_250231 ?auto_250241 ) ) ( not ( = ?auto_250231 ?auto_250242 ) ) ( not ( = ?auto_250231 ?auto_250243 ) ) ( not ( = ?auto_250231 ?auto_250244 ) ) ( not ( = ?auto_250232 ?auto_250233 ) ) ( not ( = ?auto_250232 ?auto_250234 ) ) ( not ( = ?auto_250232 ?auto_250235 ) ) ( not ( = ?auto_250232 ?auto_250236 ) ) ( not ( = ?auto_250232 ?auto_250237 ) ) ( not ( = ?auto_250232 ?auto_250238 ) ) ( not ( = ?auto_250232 ?auto_250239 ) ) ( not ( = ?auto_250232 ?auto_250240 ) ) ( not ( = ?auto_250232 ?auto_250241 ) ) ( not ( = ?auto_250232 ?auto_250242 ) ) ( not ( = ?auto_250232 ?auto_250243 ) ) ( not ( = ?auto_250232 ?auto_250244 ) ) ( not ( = ?auto_250233 ?auto_250234 ) ) ( not ( = ?auto_250233 ?auto_250235 ) ) ( not ( = ?auto_250233 ?auto_250236 ) ) ( not ( = ?auto_250233 ?auto_250237 ) ) ( not ( = ?auto_250233 ?auto_250238 ) ) ( not ( = ?auto_250233 ?auto_250239 ) ) ( not ( = ?auto_250233 ?auto_250240 ) ) ( not ( = ?auto_250233 ?auto_250241 ) ) ( not ( = ?auto_250233 ?auto_250242 ) ) ( not ( = ?auto_250233 ?auto_250243 ) ) ( not ( = ?auto_250233 ?auto_250244 ) ) ( not ( = ?auto_250234 ?auto_250235 ) ) ( not ( = ?auto_250234 ?auto_250236 ) ) ( not ( = ?auto_250234 ?auto_250237 ) ) ( not ( = ?auto_250234 ?auto_250238 ) ) ( not ( = ?auto_250234 ?auto_250239 ) ) ( not ( = ?auto_250234 ?auto_250240 ) ) ( not ( = ?auto_250234 ?auto_250241 ) ) ( not ( = ?auto_250234 ?auto_250242 ) ) ( not ( = ?auto_250234 ?auto_250243 ) ) ( not ( = ?auto_250234 ?auto_250244 ) ) ( not ( = ?auto_250235 ?auto_250236 ) ) ( not ( = ?auto_250235 ?auto_250237 ) ) ( not ( = ?auto_250235 ?auto_250238 ) ) ( not ( = ?auto_250235 ?auto_250239 ) ) ( not ( = ?auto_250235 ?auto_250240 ) ) ( not ( = ?auto_250235 ?auto_250241 ) ) ( not ( = ?auto_250235 ?auto_250242 ) ) ( not ( = ?auto_250235 ?auto_250243 ) ) ( not ( = ?auto_250235 ?auto_250244 ) ) ( not ( = ?auto_250236 ?auto_250237 ) ) ( not ( = ?auto_250236 ?auto_250238 ) ) ( not ( = ?auto_250236 ?auto_250239 ) ) ( not ( = ?auto_250236 ?auto_250240 ) ) ( not ( = ?auto_250236 ?auto_250241 ) ) ( not ( = ?auto_250236 ?auto_250242 ) ) ( not ( = ?auto_250236 ?auto_250243 ) ) ( not ( = ?auto_250236 ?auto_250244 ) ) ( not ( = ?auto_250237 ?auto_250238 ) ) ( not ( = ?auto_250237 ?auto_250239 ) ) ( not ( = ?auto_250237 ?auto_250240 ) ) ( not ( = ?auto_250237 ?auto_250241 ) ) ( not ( = ?auto_250237 ?auto_250242 ) ) ( not ( = ?auto_250237 ?auto_250243 ) ) ( not ( = ?auto_250237 ?auto_250244 ) ) ( not ( = ?auto_250238 ?auto_250239 ) ) ( not ( = ?auto_250238 ?auto_250240 ) ) ( not ( = ?auto_250238 ?auto_250241 ) ) ( not ( = ?auto_250238 ?auto_250242 ) ) ( not ( = ?auto_250238 ?auto_250243 ) ) ( not ( = ?auto_250238 ?auto_250244 ) ) ( not ( = ?auto_250239 ?auto_250240 ) ) ( not ( = ?auto_250239 ?auto_250241 ) ) ( not ( = ?auto_250239 ?auto_250242 ) ) ( not ( = ?auto_250239 ?auto_250243 ) ) ( not ( = ?auto_250239 ?auto_250244 ) ) ( not ( = ?auto_250240 ?auto_250241 ) ) ( not ( = ?auto_250240 ?auto_250242 ) ) ( not ( = ?auto_250240 ?auto_250243 ) ) ( not ( = ?auto_250240 ?auto_250244 ) ) ( not ( = ?auto_250241 ?auto_250242 ) ) ( not ( = ?auto_250241 ?auto_250243 ) ) ( not ( = ?auto_250241 ?auto_250244 ) ) ( not ( = ?auto_250242 ?auto_250243 ) ) ( not ( = ?auto_250242 ?auto_250244 ) ) ( not ( = ?auto_250243 ?auto_250244 ) ) ( ON ?auto_250242 ?auto_250243 ) ( ON ?auto_250241 ?auto_250242 ) ( ON ?auto_250240 ?auto_250241 ) ( ON ?auto_250239 ?auto_250240 ) ( ON ?auto_250238 ?auto_250239 ) ( CLEAR ?auto_250236 ) ( ON ?auto_250237 ?auto_250238 ) ( CLEAR ?auto_250237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_250231 ?auto_250232 ?auto_250233 ?auto_250234 ?auto_250235 ?auto_250236 ?auto_250237 )
      ( MAKE-13PILE ?auto_250231 ?auto_250232 ?auto_250233 ?auto_250234 ?auto_250235 ?auto_250236 ?auto_250237 ?auto_250238 ?auto_250239 ?auto_250240 ?auto_250241 ?auto_250242 ?auto_250243 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250258 - BLOCK
      ?auto_250259 - BLOCK
      ?auto_250260 - BLOCK
      ?auto_250261 - BLOCK
      ?auto_250262 - BLOCK
      ?auto_250263 - BLOCK
      ?auto_250264 - BLOCK
      ?auto_250265 - BLOCK
      ?auto_250266 - BLOCK
      ?auto_250267 - BLOCK
      ?auto_250268 - BLOCK
      ?auto_250269 - BLOCK
      ?auto_250270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250270 ) ( ON-TABLE ?auto_250258 ) ( ON ?auto_250259 ?auto_250258 ) ( ON ?auto_250260 ?auto_250259 ) ( ON ?auto_250261 ?auto_250260 ) ( ON ?auto_250262 ?auto_250261 ) ( ON ?auto_250263 ?auto_250262 ) ( not ( = ?auto_250258 ?auto_250259 ) ) ( not ( = ?auto_250258 ?auto_250260 ) ) ( not ( = ?auto_250258 ?auto_250261 ) ) ( not ( = ?auto_250258 ?auto_250262 ) ) ( not ( = ?auto_250258 ?auto_250263 ) ) ( not ( = ?auto_250258 ?auto_250264 ) ) ( not ( = ?auto_250258 ?auto_250265 ) ) ( not ( = ?auto_250258 ?auto_250266 ) ) ( not ( = ?auto_250258 ?auto_250267 ) ) ( not ( = ?auto_250258 ?auto_250268 ) ) ( not ( = ?auto_250258 ?auto_250269 ) ) ( not ( = ?auto_250258 ?auto_250270 ) ) ( not ( = ?auto_250259 ?auto_250260 ) ) ( not ( = ?auto_250259 ?auto_250261 ) ) ( not ( = ?auto_250259 ?auto_250262 ) ) ( not ( = ?auto_250259 ?auto_250263 ) ) ( not ( = ?auto_250259 ?auto_250264 ) ) ( not ( = ?auto_250259 ?auto_250265 ) ) ( not ( = ?auto_250259 ?auto_250266 ) ) ( not ( = ?auto_250259 ?auto_250267 ) ) ( not ( = ?auto_250259 ?auto_250268 ) ) ( not ( = ?auto_250259 ?auto_250269 ) ) ( not ( = ?auto_250259 ?auto_250270 ) ) ( not ( = ?auto_250260 ?auto_250261 ) ) ( not ( = ?auto_250260 ?auto_250262 ) ) ( not ( = ?auto_250260 ?auto_250263 ) ) ( not ( = ?auto_250260 ?auto_250264 ) ) ( not ( = ?auto_250260 ?auto_250265 ) ) ( not ( = ?auto_250260 ?auto_250266 ) ) ( not ( = ?auto_250260 ?auto_250267 ) ) ( not ( = ?auto_250260 ?auto_250268 ) ) ( not ( = ?auto_250260 ?auto_250269 ) ) ( not ( = ?auto_250260 ?auto_250270 ) ) ( not ( = ?auto_250261 ?auto_250262 ) ) ( not ( = ?auto_250261 ?auto_250263 ) ) ( not ( = ?auto_250261 ?auto_250264 ) ) ( not ( = ?auto_250261 ?auto_250265 ) ) ( not ( = ?auto_250261 ?auto_250266 ) ) ( not ( = ?auto_250261 ?auto_250267 ) ) ( not ( = ?auto_250261 ?auto_250268 ) ) ( not ( = ?auto_250261 ?auto_250269 ) ) ( not ( = ?auto_250261 ?auto_250270 ) ) ( not ( = ?auto_250262 ?auto_250263 ) ) ( not ( = ?auto_250262 ?auto_250264 ) ) ( not ( = ?auto_250262 ?auto_250265 ) ) ( not ( = ?auto_250262 ?auto_250266 ) ) ( not ( = ?auto_250262 ?auto_250267 ) ) ( not ( = ?auto_250262 ?auto_250268 ) ) ( not ( = ?auto_250262 ?auto_250269 ) ) ( not ( = ?auto_250262 ?auto_250270 ) ) ( not ( = ?auto_250263 ?auto_250264 ) ) ( not ( = ?auto_250263 ?auto_250265 ) ) ( not ( = ?auto_250263 ?auto_250266 ) ) ( not ( = ?auto_250263 ?auto_250267 ) ) ( not ( = ?auto_250263 ?auto_250268 ) ) ( not ( = ?auto_250263 ?auto_250269 ) ) ( not ( = ?auto_250263 ?auto_250270 ) ) ( not ( = ?auto_250264 ?auto_250265 ) ) ( not ( = ?auto_250264 ?auto_250266 ) ) ( not ( = ?auto_250264 ?auto_250267 ) ) ( not ( = ?auto_250264 ?auto_250268 ) ) ( not ( = ?auto_250264 ?auto_250269 ) ) ( not ( = ?auto_250264 ?auto_250270 ) ) ( not ( = ?auto_250265 ?auto_250266 ) ) ( not ( = ?auto_250265 ?auto_250267 ) ) ( not ( = ?auto_250265 ?auto_250268 ) ) ( not ( = ?auto_250265 ?auto_250269 ) ) ( not ( = ?auto_250265 ?auto_250270 ) ) ( not ( = ?auto_250266 ?auto_250267 ) ) ( not ( = ?auto_250266 ?auto_250268 ) ) ( not ( = ?auto_250266 ?auto_250269 ) ) ( not ( = ?auto_250266 ?auto_250270 ) ) ( not ( = ?auto_250267 ?auto_250268 ) ) ( not ( = ?auto_250267 ?auto_250269 ) ) ( not ( = ?auto_250267 ?auto_250270 ) ) ( not ( = ?auto_250268 ?auto_250269 ) ) ( not ( = ?auto_250268 ?auto_250270 ) ) ( not ( = ?auto_250269 ?auto_250270 ) ) ( ON ?auto_250269 ?auto_250270 ) ( ON ?auto_250268 ?auto_250269 ) ( ON ?auto_250267 ?auto_250268 ) ( ON ?auto_250266 ?auto_250267 ) ( ON ?auto_250265 ?auto_250266 ) ( CLEAR ?auto_250263 ) ( ON ?auto_250264 ?auto_250265 ) ( CLEAR ?auto_250264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_250258 ?auto_250259 ?auto_250260 ?auto_250261 ?auto_250262 ?auto_250263 ?auto_250264 )
      ( MAKE-13PILE ?auto_250258 ?auto_250259 ?auto_250260 ?auto_250261 ?auto_250262 ?auto_250263 ?auto_250264 ?auto_250265 ?auto_250266 ?auto_250267 ?auto_250268 ?auto_250269 ?auto_250270 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250284 - BLOCK
      ?auto_250285 - BLOCK
      ?auto_250286 - BLOCK
      ?auto_250287 - BLOCK
      ?auto_250288 - BLOCK
      ?auto_250289 - BLOCK
      ?auto_250290 - BLOCK
      ?auto_250291 - BLOCK
      ?auto_250292 - BLOCK
      ?auto_250293 - BLOCK
      ?auto_250294 - BLOCK
      ?auto_250295 - BLOCK
      ?auto_250296 - BLOCK
    )
    :vars
    (
      ?auto_250297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250296 ?auto_250297 ) ( ON-TABLE ?auto_250284 ) ( ON ?auto_250285 ?auto_250284 ) ( ON ?auto_250286 ?auto_250285 ) ( ON ?auto_250287 ?auto_250286 ) ( ON ?auto_250288 ?auto_250287 ) ( not ( = ?auto_250284 ?auto_250285 ) ) ( not ( = ?auto_250284 ?auto_250286 ) ) ( not ( = ?auto_250284 ?auto_250287 ) ) ( not ( = ?auto_250284 ?auto_250288 ) ) ( not ( = ?auto_250284 ?auto_250289 ) ) ( not ( = ?auto_250284 ?auto_250290 ) ) ( not ( = ?auto_250284 ?auto_250291 ) ) ( not ( = ?auto_250284 ?auto_250292 ) ) ( not ( = ?auto_250284 ?auto_250293 ) ) ( not ( = ?auto_250284 ?auto_250294 ) ) ( not ( = ?auto_250284 ?auto_250295 ) ) ( not ( = ?auto_250284 ?auto_250296 ) ) ( not ( = ?auto_250284 ?auto_250297 ) ) ( not ( = ?auto_250285 ?auto_250286 ) ) ( not ( = ?auto_250285 ?auto_250287 ) ) ( not ( = ?auto_250285 ?auto_250288 ) ) ( not ( = ?auto_250285 ?auto_250289 ) ) ( not ( = ?auto_250285 ?auto_250290 ) ) ( not ( = ?auto_250285 ?auto_250291 ) ) ( not ( = ?auto_250285 ?auto_250292 ) ) ( not ( = ?auto_250285 ?auto_250293 ) ) ( not ( = ?auto_250285 ?auto_250294 ) ) ( not ( = ?auto_250285 ?auto_250295 ) ) ( not ( = ?auto_250285 ?auto_250296 ) ) ( not ( = ?auto_250285 ?auto_250297 ) ) ( not ( = ?auto_250286 ?auto_250287 ) ) ( not ( = ?auto_250286 ?auto_250288 ) ) ( not ( = ?auto_250286 ?auto_250289 ) ) ( not ( = ?auto_250286 ?auto_250290 ) ) ( not ( = ?auto_250286 ?auto_250291 ) ) ( not ( = ?auto_250286 ?auto_250292 ) ) ( not ( = ?auto_250286 ?auto_250293 ) ) ( not ( = ?auto_250286 ?auto_250294 ) ) ( not ( = ?auto_250286 ?auto_250295 ) ) ( not ( = ?auto_250286 ?auto_250296 ) ) ( not ( = ?auto_250286 ?auto_250297 ) ) ( not ( = ?auto_250287 ?auto_250288 ) ) ( not ( = ?auto_250287 ?auto_250289 ) ) ( not ( = ?auto_250287 ?auto_250290 ) ) ( not ( = ?auto_250287 ?auto_250291 ) ) ( not ( = ?auto_250287 ?auto_250292 ) ) ( not ( = ?auto_250287 ?auto_250293 ) ) ( not ( = ?auto_250287 ?auto_250294 ) ) ( not ( = ?auto_250287 ?auto_250295 ) ) ( not ( = ?auto_250287 ?auto_250296 ) ) ( not ( = ?auto_250287 ?auto_250297 ) ) ( not ( = ?auto_250288 ?auto_250289 ) ) ( not ( = ?auto_250288 ?auto_250290 ) ) ( not ( = ?auto_250288 ?auto_250291 ) ) ( not ( = ?auto_250288 ?auto_250292 ) ) ( not ( = ?auto_250288 ?auto_250293 ) ) ( not ( = ?auto_250288 ?auto_250294 ) ) ( not ( = ?auto_250288 ?auto_250295 ) ) ( not ( = ?auto_250288 ?auto_250296 ) ) ( not ( = ?auto_250288 ?auto_250297 ) ) ( not ( = ?auto_250289 ?auto_250290 ) ) ( not ( = ?auto_250289 ?auto_250291 ) ) ( not ( = ?auto_250289 ?auto_250292 ) ) ( not ( = ?auto_250289 ?auto_250293 ) ) ( not ( = ?auto_250289 ?auto_250294 ) ) ( not ( = ?auto_250289 ?auto_250295 ) ) ( not ( = ?auto_250289 ?auto_250296 ) ) ( not ( = ?auto_250289 ?auto_250297 ) ) ( not ( = ?auto_250290 ?auto_250291 ) ) ( not ( = ?auto_250290 ?auto_250292 ) ) ( not ( = ?auto_250290 ?auto_250293 ) ) ( not ( = ?auto_250290 ?auto_250294 ) ) ( not ( = ?auto_250290 ?auto_250295 ) ) ( not ( = ?auto_250290 ?auto_250296 ) ) ( not ( = ?auto_250290 ?auto_250297 ) ) ( not ( = ?auto_250291 ?auto_250292 ) ) ( not ( = ?auto_250291 ?auto_250293 ) ) ( not ( = ?auto_250291 ?auto_250294 ) ) ( not ( = ?auto_250291 ?auto_250295 ) ) ( not ( = ?auto_250291 ?auto_250296 ) ) ( not ( = ?auto_250291 ?auto_250297 ) ) ( not ( = ?auto_250292 ?auto_250293 ) ) ( not ( = ?auto_250292 ?auto_250294 ) ) ( not ( = ?auto_250292 ?auto_250295 ) ) ( not ( = ?auto_250292 ?auto_250296 ) ) ( not ( = ?auto_250292 ?auto_250297 ) ) ( not ( = ?auto_250293 ?auto_250294 ) ) ( not ( = ?auto_250293 ?auto_250295 ) ) ( not ( = ?auto_250293 ?auto_250296 ) ) ( not ( = ?auto_250293 ?auto_250297 ) ) ( not ( = ?auto_250294 ?auto_250295 ) ) ( not ( = ?auto_250294 ?auto_250296 ) ) ( not ( = ?auto_250294 ?auto_250297 ) ) ( not ( = ?auto_250295 ?auto_250296 ) ) ( not ( = ?auto_250295 ?auto_250297 ) ) ( not ( = ?auto_250296 ?auto_250297 ) ) ( ON ?auto_250295 ?auto_250296 ) ( ON ?auto_250294 ?auto_250295 ) ( ON ?auto_250293 ?auto_250294 ) ( ON ?auto_250292 ?auto_250293 ) ( ON ?auto_250291 ?auto_250292 ) ( ON ?auto_250290 ?auto_250291 ) ( CLEAR ?auto_250288 ) ( ON ?auto_250289 ?auto_250290 ) ( CLEAR ?auto_250289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_250284 ?auto_250285 ?auto_250286 ?auto_250287 ?auto_250288 ?auto_250289 )
      ( MAKE-13PILE ?auto_250284 ?auto_250285 ?auto_250286 ?auto_250287 ?auto_250288 ?auto_250289 ?auto_250290 ?auto_250291 ?auto_250292 ?auto_250293 ?auto_250294 ?auto_250295 ?auto_250296 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250311 - BLOCK
      ?auto_250312 - BLOCK
      ?auto_250313 - BLOCK
      ?auto_250314 - BLOCK
      ?auto_250315 - BLOCK
      ?auto_250316 - BLOCK
      ?auto_250317 - BLOCK
      ?auto_250318 - BLOCK
      ?auto_250319 - BLOCK
      ?auto_250320 - BLOCK
      ?auto_250321 - BLOCK
      ?auto_250322 - BLOCK
      ?auto_250323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250323 ) ( ON-TABLE ?auto_250311 ) ( ON ?auto_250312 ?auto_250311 ) ( ON ?auto_250313 ?auto_250312 ) ( ON ?auto_250314 ?auto_250313 ) ( ON ?auto_250315 ?auto_250314 ) ( not ( = ?auto_250311 ?auto_250312 ) ) ( not ( = ?auto_250311 ?auto_250313 ) ) ( not ( = ?auto_250311 ?auto_250314 ) ) ( not ( = ?auto_250311 ?auto_250315 ) ) ( not ( = ?auto_250311 ?auto_250316 ) ) ( not ( = ?auto_250311 ?auto_250317 ) ) ( not ( = ?auto_250311 ?auto_250318 ) ) ( not ( = ?auto_250311 ?auto_250319 ) ) ( not ( = ?auto_250311 ?auto_250320 ) ) ( not ( = ?auto_250311 ?auto_250321 ) ) ( not ( = ?auto_250311 ?auto_250322 ) ) ( not ( = ?auto_250311 ?auto_250323 ) ) ( not ( = ?auto_250312 ?auto_250313 ) ) ( not ( = ?auto_250312 ?auto_250314 ) ) ( not ( = ?auto_250312 ?auto_250315 ) ) ( not ( = ?auto_250312 ?auto_250316 ) ) ( not ( = ?auto_250312 ?auto_250317 ) ) ( not ( = ?auto_250312 ?auto_250318 ) ) ( not ( = ?auto_250312 ?auto_250319 ) ) ( not ( = ?auto_250312 ?auto_250320 ) ) ( not ( = ?auto_250312 ?auto_250321 ) ) ( not ( = ?auto_250312 ?auto_250322 ) ) ( not ( = ?auto_250312 ?auto_250323 ) ) ( not ( = ?auto_250313 ?auto_250314 ) ) ( not ( = ?auto_250313 ?auto_250315 ) ) ( not ( = ?auto_250313 ?auto_250316 ) ) ( not ( = ?auto_250313 ?auto_250317 ) ) ( not ( = ?auto_250313 ?auto_250318 ) ) ( not ( = ?auto_250313 ?auto_250319 ) ) ( not ( = ?auto_250313 ?auto_250320 ) ) ( not ( = ?auto_250313 ?auto_250321 ) ) ( not ( = ?auto_250313 ?auto_250322 ) ) ( not ( = ?auto_250313 ?auto_250323 ) ) ( not ( = ?auto_250314 ?auto_250315 ) ) ( not ( = ?auto_250314 ?auto_250316 ) ) ( not ( = ?auto_250314 ?auto_250317 ) ) ( not ( = ?auto_250314 ?auto_250318 ) ) ( not ( = ?auto_250314 ?auto_250319 ) ) ( not ( = ?auto_250314 ?auto_250320 ) ) ( not ( = ?auto_250314 ?auto_250321 ) ) ( not ( = ?auto_250314 ?auto_250322 ) ) ( not ( = ?auto_250314 ?auto_250323 ) ) ( not ( = ?auto_250315 ?auto_250316 ) ) ( not ( = ?auto_250315 ?auto_250317 ) ) ( not ( = ?auto_250315 ?auto_250318 ) ) ( not ( = ?auto_250315 ?auto_250319 ) ) ( not ( = ?auto_250315 ?auto_250320 ) ) ( not ( = ?auto_250315 ?auto_250321 ) ) ( not ( = ?auto_250315 ?auto_250322 ) ) ( not ( = ?auto_250315 ?auto_250323 ) ) ( not ( = ?auto_250316 ?auto_250317 ) ) ( not ( = ?auto_250316 ?auto_250318 ) ) ( not ( = ?auto_250316 ?auto_250319 ) ) ( not ( = ?auto_250316 ?auto_250320 ) ) ( not ( = ?auto_250316 ?auto_250321 ) ) ( not ( = ?auto_250316 ?auto_250322 ) ) ( not ( = ?auto_250316 ?auto_250323 ) ) ( not ( = ?auto_250317 ?auto_250318 ) ) ( not ( = ?auto_250317 ?auto_250319 ) ) ( not ( = ?auto_250317 ?auto_250320 ) ) ( not ( = ?auto_250317 ?auto_250321 ) ) ( not ( = ?auto_250317 ?auto_250322 ) ) ( not ( = ?auto_250317 ?auto_250323 ) ) ( not ( = ?auto_250318 ?auto_250319 ) ) ( not ( = ?auto_250318 ?auto_250320 ) ) ( not ( = ?auto_250318 ?auto_250321 ) ) ( not ( = ?auto_250318 ?auto_250322 ) ) ( not ( = ?auto_250318 ?auto_250323 ) ) ( not ( = ?auto_250319 ?auto_250320 ) ) ( not ( = ?auto_250319 ?auto_250321 ) ) ( not ( = ?auto_250319 ?auto_250322 ) ) ( not ( = ?auto_250319 ?auto_250323 ) ) ( not ( = ?auto_250320 ?auto_250321 ) ) ( not ( = ?auto_250320 ?auto_250322 ) ) ( not ( = ?auto_250320 ?auto_250323 ) ) ( not ( = ?auto_250321 ?auto_250322 ) ) ( not ( = ?auto_250321 ?auto_250323 ) ) ( not ( = ?auto_250322 ?auto_250323 ) ) ( ON ?auto_250322 ?auto_250323 ) ( ON ?auto_250321 ?auto_250322 ) ( ON ?auto_250320 ?auto_250321 ) ( ON ?auto_250319 ?auto_250320 ) ( ON ?auto_250318 ?auto_250319 ) ( ON ?auto_250317 ?auto_250318 ) ( CLEAR ?auto_250315 ) ( ON ?auto_250316 ?auto_250317 ) ( CLEAR ?auto_250316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_250311 ?auto_250312 ?auto_250313 ?auto_250314 ?auto_250315 ?auto_250316 )
      ( MAKE-13PILE ?auto_250311 ?auto_250312 ?auto_250313 ?auto_250314 ?auto_250315 ?auto_250316 ?auto_250317 ?auto_250318 ?auto_250319 ?auto_250320 ?auto_250321 ?auto_250322 ?auto_250323 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250337 - BLOCK
      ?auto_250338 - BLOCK
      ?auto_250339 - BLOCK
      ?auto_250340 - BLOCK
      ?auto_250341 - BLOCK
      ?auto_250342 - BLOCK
      ?auto_250343 - BLOCK
      ?auto_250344 - BLOCK
      ?auto_250345 - BLOCK
      ?auto_250346 - BLOCK
      ?auto_250347 - BLOCK
      ?auto_250348 - BLOCK
      ?auto_250349 - BLOCK
    )
    :vars
    (
      ?auto_250350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250349 ?auto_250350 ) ( ON-TABLE ?auto_250337 ) ( ON ?auto_250338 ?auto_250337 ) ( ON ?auto_250339 ?auto_250338 ) ( ON ?auto_250340 ?auto_250339 ) ( not ( = ?auto_250337 ?auto_250338 ) ) ( not ( = ?auto_250337 ?auto_250339 ) ) ( not ( = ?auto_250337 ?auto_250340 ) ) ( not ( = ?auto_250337 ?auto_250341 ) ) ( not ( = ?auto_250337 ?auto_250342 ) ) ( not ( = ?auto_250337 ?auto_250343 ) ) ( not ( = ?auto_250337 ?auto_250344 ) ) ( not ( = ?auto_250337 ?auto_250345 ) ) ( not ( = ?auto_250337 ?auto_250346 ) ) ( not ( = ?auto_250337 ?auto_250347 ) ) ( not ( = ?auto_250337 ?auto_250348 ) ) ( not ( = ?auto_250337 ?auto_250349 ) ) ( not ( = ?auto_250337 ?auto_250350 ) ) ( not ( = ?auto_250338 ?auto_250339 ) ) ( not ( = ?auto_250338 ?auto_250340 ) ) ( not ( = ?auto_250338 ?auto_250341 ) ) ( not ( = ?auto_250338 ?auto_250342 ) ) ( not ( = ?auto_250338 ?auto_250343 ) ) ( not ( = ?auto_250338 ?auto_250344 ) ) ( not ( = ?auto_250338 ?auto_250345 ) ) ( not ( = ?auto_250338 ?auto_250346 ) ) ( not ( = ?auto_250338 ?auto_250347 ) ) ( not ( = ?auto_250338 ?auto_250348 ) ) ( not ( = ?auto_250338 ?auto_250349 ) ) ( not ( = ?auto_250338 ?auto_250350 ) ) ( not ( = ?auto_250339 ?auto_250340 ) ) ( not ( = ?auto_250339 ?auto_250341 ) ) ( not ( = ?auto_250339 ?auto_250342 ) ) ( not ( = ?auto_250339 ?auto_250343 ) ) ( not ( = ?auto_250339 ?auto_250344 ) ) ( not ( = ?auto_250339 ?auto_250345 ) ) ( not ( = ?auto_250339 ?auto_250346 ) ) ( not ( = ?auto_250339 ?auto_250347 ) ) ( not ( = ?auto_250339 ?auto_250348 ) ) ( not ( = ?auto_250339 ?auto_250349 ) ) ( not ( = ?auto_250339 ?auto_250350 ) ) ( not ( = ?auto_250340 ?auto_250341 ) ) ( not ( = ?auto_250340 ?auto_250342 ) ) ( not ( = ?auto_250340 ?auto_250343 ) ) ( not ( = ?auto_250340 ?auto_250344 ) ) ( not ( = ?auto_250340 ?auto_250345 ) ) ( not ( = ?auto_250340 ?auto_250346 ) ) ( not ( = ?auto_250340 ?auto_250347 ) ) ( not ( = ?auto_250340 ?auto_250348 ) ) ( not ( = ?auto_250340 ?auto_250349 ) ) ( not ( = ?auto_250340 ?auto_250350 ) ) ( not ( = ?auto_250341 ?auto_250342 ) ) ( not ( = ?auto_250341 ?auto_250343 ) ) ( not ( = ?auto_250341 ?auto_250344 ) ) ( not ( = ?auto_250341 ?auto_250345 ) ) ( not ( = ?auto_250341 ?auto_250346 ) ) ( not ( = ?auto_250341 ?auto_250347 ) ) ( not ( = ?auto_250341 ?auto_250348 ) ) ( not ( = ?auto_250341 ?auto_250349 ) ) ( not ( = ?auto_250341 ?auto_250350 ) ) ( not ( = ?auto_250342 ?auto_250343 ) ) ( not ( = ?auto_250342 ?auto_250344 ) ) ( not ( = ?auto_250342 ?auto_250345 ) ) ( not ( = ?auto_250342 ?auto_250346 ) ) ( not ( = ?auto_250342 ?auto_250347 ) ) ( not ( = ?auto_250342 ?auto_250348 ) ) ( not ( = ?auto_250342 ?auto_250349 ) ) ( not ( = ?auto_250342 ?auto_250350 ) ) ( not ( = ?auto_250343 ?auto_250344 ) ) ( not ( = ?auto_250343 ?auto_250345 ) ) ( not ( = ?auto_250343 ?auto_250346 ) ) ( not ( = ?auto_250343 ?auto_250347 ) ) ( not ( = ?auto_250343 ?auto_250348 ) ) ( not ( = ?auto_250343 ?auto_250349 ) ) ( not ( = ?auto_250343 ?auto_250350 ) ) ( not ( = ?auto_250344 ?auto_250345 ) ) ( not ( = ?auto_250344 ?auto_250346 ) ) ( not ( = ?auto_250344 ?auto_250347 ) ) ( not ( = ?auto_250344 ?auto_250348 ) ) ( not ( = ?auto_250344 ?auto_250349 ) ) ( not ( = ?auto_250344 ?auto_250350 ) ) ( not ( = ?auto_250345 ?auto_250346 ) ) ( not ( = ?auto_250345 ?auto_250347 ) ) ( not ( = ?auto_250345 ?auto_250348 ) ) ( not ( = ?auto_250345 ?auto_250349 ) ) ( not ( = ?auto_250345 ?auto_250350 ) ) ( not ( = ?auto_250346 ?auto_250347 ) ) ( not ( = ?auto_250346 ?auto_250348 ) ) ( not ( = ?auto_250346 ?auto_250349 ) ) ( not ( = ?auto_250346 ?auto_250350 ) ) ( not ( = ?auto_250347 ?auto_250348 ) ) ( not ( = ?auto_250347 ?auto_250349 ) ) ( not ( = ?auto_250347 ?auto_250350 ) ) ( not ( = ?auto_250348 ?auto_250349 ) ) ( not ( = ?auto_250348 ?auto_250350 ) ) ( not ( = ?auto_250349 ?auto_250350 ) ) ( ON ?auto_250348 ?auto_250349 ) ( ON ?auto_250347 ?auto_250348 ) ( ON ?auto_250346 ?auto_250347 ) ( ON ?auto_250345 ?auto_250346 ) ( ON ?auto_250344 ?auto_250345 ) ( ON ?auto_250343 ?auto_250344 ) ( ON ?auto_250342 ?auto_250343 ) ( CLEAR ?auto_250340 ) ( ON ?auto_250341 ?auto_250342 ) ( CLEAR ?auto_250341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_250337 ?auto_250338 ?auto_250339 ?auto_250340 ?auto_250341 )
      ( MAKE-13PILE ?auto_250337 ?auto_250338 ?auto_250339 ?auto_250340 ?auto_250341 ?auto_250342 ?auto_250343 ?auto_250344 ?auto_250345 ?auto_250346 ?auto_250347 ?auto_250348 ?auto_250349 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250364 - BLOCK
      ?auto_250365 - BLOCK
      ?auto_250366 - BLOCK
      ?auto_250367 - BLOCK
      ?auto_250368 - BLOCK
      ?auto_250369 - BLOCK
      ?auto_250370 - BLOCK
      ?auto_250371 - BLOCK
      ?auto_250372 - BLOCK
      ?auto_250373 - BLOCK
      ?auto_250374 - BLOCK
      ?auto_250375 - BLOCK
      ?auto_250376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250376 ) ( ON-TABLE ?auto_250364 ) ( ON ?auto_250365 ?auto_250364 ) ( ON ?auto_250366 ?auto_250365 ) ( ON ?auto_250367 ?auto_250366 ) ( not ( = ?auto_250364 ?auto_250365 ) ) ( not ( = ?auto_250364 ?auto_250366 ) ) ( not ( = ?auto_250364 ?auto_250367 ) ) ( not ( = ?auto_250364 ?auto_250368 ) ) ( not ( = ?auto_250364 ?auto_250369 ) ) ( not ( = ?auto_250364 ?auto_250370 ) ) ( not ( = ?auto_250364 ?auto_250371 ) ) ( not ( = ?auto_250364 ?auto_250372 ) ) ( not ( = ?auto_250364 ?auto_250373 ) ) ( not ( = ?auto_250364 ?auto_250374 ) ) ( not ( = ?auto_250364 ?auto_250375 ) ) ( not ( = ?auto_250364 ?auto_250376 ) ) ( not ( = ?auto_250365 ?auto_250366 ) ) ( not ( = ?auto_250365 ?auto_250367 ) ) ( not ( = ?auto_250365 ?auto_250368 ) ) ( not ( = ?auto_250365 ?auto_250369 ) ) ( not ( = ?auto_250365 ?auto_250370 ) ) ( not ( = ?auto_250365 ?auto_250371 ) ) ( not ( = ?auto_250365 ?auto_250372 ) ) ( not ( = ?auto_250365 ?auto_250373 ) ) ( not ( = ?auto_250365 ?auto_250374 ) ) ( not ( = ?auto_250365 ?auto_250375 ) ) ( not ( = ?auto_250365 ?auto_250376 ) ) ( not ( = ?auto_250366 ?auto_250367 ) ) ( not ( = ?auto_250366 ?auto_250368 ) ) ( not ( = ?auto_250366 ?auto_250369 ) ) ( not ( = ?auto_250366 ?auto_250370 ) ) ( not ( = ?auto_250366 ?auto_250371 ) ) ( not ( = ?auto_250366 ?auto_250372 ) ) ( not ( = ?auto_250366 ?auto_250373 ) ) ( not ( = ?auto_250366 ?auto_250374 ) ) ( not ( = ?auto_250366 ?auto_250375 ) ) ( not ( = ?auto_250366 ?auto_250376 ) ) ( not ( = ?auto_250367 ?auto_250368 ) ) ( not ( = ?auto_250367 ?auto_250369 ) ) ( not ( = ?auto_250367 ?auto_250370 ) ) ( not ( = ?auto_250367 ?auto_250371 ) ) ( not ( = ?auto_250367 ?auto_250372 ) ) ( not ( = ?auto_250367 ?auto_250373 ) ) ( not ( = ?auto_250367 ?auto_250374 ) ) ( not ( = ?auto_250367 ?auto_250375 ) ) ( not ( = ?auto_250367 ?auto_250376 ) ) ( not ( = ?auto_250368 ?auto_250369 ) ) ( not ( = ?auto_250368 ?auto_250370 ) ) ( not ( = ?auto_250368 ?auto_250371 ) ) ( not ( = ?auto_250368 ?auto_250372 ) ) ( not ( = ?auto_250368 ?auto_250373 ) ) ( not ( = ?auto_250368 ?auto_250374 ) ) ( not ( = ?auto_250368 ?auto_250375 ) ) ( not ( = ?auto_250368 ?auto_250376 ) ) ( not ( = ?auto_250369 ?auto_250370 ) ) ( not ( = ?auto_250369 ?auto_250371 ) ) ( not ( = ?auto_250369 ?auto_250372 ) ) ( not ( = ?auto_250369 ?auto_250373 ) ) ( not ( = ?auto_250369 ?auto_250374 ) ) ( not ( = ?auto_250369 ?auto_250375 ) ) ( not ( = ?auto_250369 ?auto_250376 ) ) ( not ( = ?auto_250370 ?auto_250371 ) ) ( not ( = ?auto_250370 ?auto_250372 ) ) ( not ( = ?auto_250370 ?auto_250373 ) ) ( not ( = ?auto_250370 ?auto_250374 ) ) ( not ( = ?auto_250370 ?auto_250375 ) ) ( not ( = ?auto_250370 ?auto_250376 ) ) ( not ( = ?auto_250371 ?auto_250372 ) ) ( not ( = ?auto_250371 ?auto_250373 ) ) ( not ( = ?auto_250371 ?auto_250374 ) ) ( not ( = ?auto_250371 ?auto_250375 ) ) ( not ( = ?auto_250371 ?auto_250376 ) ) ( not ( = ?auto_250372 ?auto_250373 ) ) ( not ( = ?auto_250372 ?auto_250374 ) ) ( not ( = ?auto_250372 ?auto_250375 ) ) ( not ( = ?auto_250372 ?auto_250376 ) ) ( not ( = ?auto_250373 ?auto_250374 ) ) ( not ( = ?auto_250373 ?auto_250375 ) ) ( not ( = ?auto_250373 ?auto_250376 ) ) ( not ( = ?auto_250374 ?auto_250375 ) ) ( not ( = ?auto_250374 ?auto_250376 ) ) ( not ( = ?auto_250375 ?auto_250376 ) ) ( ON ?auto_250375 ?auto_250376 ) ( ON ?auto_250374 ?auto_250375 ) ( ON ?auto_250373 ?auto_250374 ) ( ON ?auto_250372 ?auto_250373 ) ( ON ?auto_250371 ?auto_250372 ) ( ON ?auto_250370 ?auto_250371 ) ( ON ?auto_250369 ?auto_250370 ) ( CLEAR ?auto_250367 ) ( ON ?auto_250368 ?auto_250369 ) ( CLEAR ?auto_250368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_250364 ?auto_250365 ?auto_250366 ?auto_250367 ?auto_250368 )
      ( MAKE-13PILE ?auto_250364 ?auto_250365 ?auto_250366 ?auto_250367 ?auto_250368 ?auto_250369 ?auto_250370 ?auto_250371 ?auto_250372 ?auto_250373 ?auto_250374 ?auto_250375 ?auto_250376 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250390 - BLOCK
      ?auto_250391 - BLOCK
      ?auto_250392 - BLOCK
      ?auto_250393 - BLOCK
      ?auto_250394 - BLOCK
      ?auto_250395 - BLOCK
      ?auto_250396 - BLOCK
      ?auto_250397 - BLOCK
      ?auto_250398 - BLOCK
      ?auto_250399 - BLOCK
      ?auto_250400 - BLOCK
      ?auto_250401 - BLOCK
      ?auto_250402 - BLOCK
    )
    :vars
    (
      ?auto_250403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250402 ?auto_250403 ) ( ON-TABLE ?auto_250390 ) ( ON ?auto_250391 ?auto_250390 ) ( ON ?auto_250392 ?auto_250391 ) ( not ( = ?auto_250390 ?auto_250391 ) ) ( not ( = ?auto_250390 ?auto_250392 ) ) ( not ( = ?auto_250390 ?auto_250393 ) ) ( not ( = ?auto_250390 ?auto_250394 ) ) ( not ( = ?auto_250390 ?auto_250395 ) ) ( not ( = ?auto_250390 ?auto_250396 ) ) ( not ( = ?auto_250390 ?auto_250397 ) ) ( not ( = ?auto_250390 ?auto_250398 ) ) ( not ( = ?auto_250390 ?auto_250399 ) ) ( not ( = ?auto_250390 ?auto_250400 ) ) ( not ( = ?auto_250390 ?auto_250401 ) ) ( not ( = ?auto_250390 ?auto_250402 ) ) ( not ( = ?auto_250390 ?auto_250403 ) ) ( not ( = ?auto_250391 ?auto_250392 ) ) ( not ( = ?auto_250391 ?auto_250393 ) ) ( not ( = ?auto_250391 ?auto_250394 ) ) ( not ( = ?auto_250391 ?auto_250395 ) ) ( not ( = ?auto_250391 ?auto_250396 ) ) ( not ( = ?auto_250391 ?auto_250397 ) ) ( not ( = ?auto_250391 ?auto_250398 ) ) ( not ( = ?auto_250391 ?auto_250399 ) ) ( not ( = ?auto_250391 ?auto_250400 ) ) ( not ( = ?auto_250391 ?auto_250401 ) ) ( not ( = ?auto_250391 ?auto_250402 ) ) ( not ( = ?auto_250391 ?auto_250403 ) ) ( not ( = ?auto_250392 ?auto_250393 ) ) ( not ( = ?auto_250392 ?auto_250394 ) ) ( not ( = ?auto_250392 ?auto_250395 ) ) ( not ( = ?auto_250392 ?auto_250396 ) ) ( not ( = ?auto_250392 ?auto_250397 ) ) ( not ( = ?auto_250392 ?auto_250398 ) ) ( not ( = ?auto_250392 ?auto_250399 ) ) ( not ( = ?auto_250392 ?auto_250400 ) ) ( not ( = ?auto_250392 ?auto_250401 ) ) ( not ( = ?auto_250392 ?auto_250402 ) ) ( not ( = ?auto_250392 ?auto_250403 ) ) ( not ( = ?auto_250393 ?auto_250394 ) ) ( not ( = ?auto_250393 ?auto_250395 ) ) ( not ( = ?auto_250393 ?auto_250396 ) ) ( not ( = ?auto_250393 ?auto_250397 ) ) ( not ( = ?auto_250393 ?auto_250398 ) ) ( not ( = ?auto_250393 ?auto_250399 ) ) ( not ( = ?auto_250393 ?auto_250400 ) ) ( not ( = ?auto_250393 ?auto_250401 ) ) ( not ( = ?auto_250393 ?auto_250402 ) ) ( not ( = ?auto_250393 ?auto_250403 ) ) ( not ( = ?auto_250394 ?auto_250395 ) ) ( not ( = ?auto_250394 ?auto_250396 ) ) ( not ( = ?auto_250394 ?auto_250397 ) ) ( not ( = ?auto_250394 ?auto_250398 ) ) ( not ( = ?auto_250394 ?auto_250399 ) ) ( not ( = ?auto_250394 ?auto_250400 ) ) ( not ( = ?auto_250394 ?auto_250401 ) ) ( not ( = ?auto_250394 ?auto_250402 ) ) ( not ( = ?auto_250394 ?auto_250403 ) ) ( not ( = ?auto_250395 ?auto_250396 ) ) ( not ( = ?auto_250395 ?auto_250397 ) ) ( not ( = ?auto_250395 ?auto_250398 ) ) ( not ( = ?auto_250395 ?auto_250399 ) ) ( not ( = ?auto_250395 ?auto_250400 ) ) ( not ( = ?auto_250395 ?auto_250401 ) ) ( not ( = ?auto_250395 ?auto_250402 ) ) ( not ( = ?auto_250395 ?auto_250403 ) ) ( not ( = ?auto_250396 ?auto_250397 ) ) ( not ( = ?auto_250396 ?auto_250398 ) ) ( not ( = ?auto_250396 ?auto_250399 ) ) ( not ( = ?auto_250396 ?auto_250400 ) ) ( not ( = ?auto_250396 ?auto_250401 ) ) ( not ( = ?auto_250396 ?auto_250402 ) ) ( not ( = ?auto_250396 ?auto_250403 ) ) ( not ( = ?auto_250397 ?auto_250398 ) ) ( not ( = ?auto_250397 ?auto_250399 ) ) ( not ( = ?auto_250397 ?auto_250400 ) ) ( not ( = ?auto_250397 ?auto_250401 ) ) ( not ( = ?auto_250397 ?auto_250402 ) ) ( not ( = ?auto_250397 ?auto_250403 ) ) ( not ( = ?auto_250398 ?auto_250399 ) ) ( not ( = ?auto_250398 ?auto_250400 ) ) ( not ( = ?auto_250398 ?auto_250401 ) ) ( not ( = ?auto_250398 ?auto_250402 ) ) ( not ( = ?auto_250398 ?auto_250403 ) ) ( not ( = ?auto_250399 ?auto_250400 ) ) ( not ( = ?auto_250399 ?auto_250401 ) ) ( not ( = ?auto_250399 ?auto_250402 ) ) ( not ( = ?auto_250399 ?auto_250403 ) ) ( not ( = ?auto_250400 ?auto_250401 ) ) ( not ( = ?auto_250400 ?auto_250402 ) ) ( not ( = ?auto_250400 ?auto_250403 ) ) ( not ( = ?auto_250401 ?auto_250402 ) ) ( not ( = ?auto_250401 ?auto_250403 ) ) ( not ( = ?auto_250402 ?auto_250403 ) ) ( ON ?auto_250401 ?auto_250402 ) ( ON ?auto_250400 ?auto_250401 ) ( ON ?auto_250399 ?auto_250400 ) ( ON ?auto_250398 ?auto_250399 ) ( ON ?auto_250397 ?auto_250398 ) ( ON ?auto_250396 ?auto_250397 ) ( ON ?auto_250395 ?auto_250396 ) ( ON ?auto_250394 ?auto_250395 ) ( CLEAR ?auto_250392 ) ( ON ?auto_250393 ?auto_250394 ) ( CLEAR ?auto_250393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250390 ?auto_250391 ?auto_250392 ?auto_250393 )
      ( MAKE-13PILE ?auto_250390 ?auto_250391 ?auto_250392 ?auto_250393 ?auto_250394 ?auto_250395 ?auto_250396 ?auto_250397 ?auto_250398 ?auto_250399 ?auto_250400 ?auto_250401 ?auto_250402 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250417 - BLOCK
      ?auto_250418 - BLOCK
      ?auto_250419 - BLOCK
      ?auto_250420 - BLOCK
      ?auto_250421 - BLOCK
      ?auto_250422 - BLOCK
      ?auto_250423 - BLOCK
      ?auto_250424 - BLOCK
      ?auto_250425 - BLOCK
      ?auto_250426 - BLOCK
      ?auto_250427 - BLOCK
      ?auto_250428 - BLOCK
      ?auto_250429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250429 ) ( ON-TABLE ?auto_250417 ) ( ON ?auto_250418 ?auto_250417 ) ( ON ?auto_250419 ?auto_250418 ) ( not ( = ?auto_250417 ?auto_250418 ) ) ( not ( = ?auto_250417 ?auto_250419 ) ) ( not ( = ?auto_250417 ?auto_250420 ) ) ( not ( = ?auto_250417 ?auto_250421 ) ) ( not ( = ?auto_250417 ?auto_250422 ) ) ( not ( = ?auto_250417 ?auto_250423 ) ) ( not ( = ?auto_250417 ?auto_250424 ) ) ( not ( = ?auto_250417 ?auto_250425 ) ) ( not ( = ?auto_250417 ?auto_250426 ) ) ( not ( = ?auto_250417 ?auto_250427 ) ) ( not ( = ?auto_250417 ?auto_250428 ) ) ( not ( = ?auto_250417 ?auto_250429 ) ) ( not ( = ?auto_250418 ?auto_250419 ) ) ( not ( = ?auto_250418 ?auto_250420 ) ) ( not ( = ?auto_250418 ?auto_250421 ) ) ( not ( = ?auto_250418 ?auto_250422 ) ) ( not ( = ?auto_250418 ?auto_250423 ) ) ( not ( = ?auto_250418 ?auto_250424 ) ) ( not ( = ?auto_250418 ?auto_250425 ) ) ( not ( = ?auto_250418 ?auto_250426 ) ) ( not ( = ?auto_250418 ?auto_250427 ) ) ( not ( = ?auto_250418 ?auto_250428 ) ) ( not ( = ?auto_250418 ?auto_250429 ) ) ( not ( = ?auto_250419 ?auto_250420 ) ) ( not ( = ?auto_250419 ?auto_250421 ) ) ( not ( = ?auto_250419 ?auto_250422 ) ) ( not ( = ?auto_250419 ?auto_250423 ) ) ( not ( = ?auto_250419 ?auto_250424 ) ) ( not ( = ?auto_250419 ?auto_250425 ) ) ( not ( = ?auto_250419 ?auto_250426 ) ) ( not ( = ?auto_250419 ?auto_250427 ) ) ( not ( = ?auto_250419 ?auto_250428 ) ) ( not ( = ?auto_250419 ?auto_250429 ) ) ( not ( = ?auto_250420 ?auto_250421 ) ) ( not ( = ?auto_250420 ?auto_250422 ) ) ( not ( = ?auto_250420 ?auto_250423 ) ) ( not ( = ?auto_250420 ?auto_250424 ) ) ( not ( = ?auto_250420 ?auto_250425 ) ) ( not ( = ?auto_250420 ?auto_250426 ) ) ( not ( = ?auto_250420 ?auto_250427 ) ) ( not ( = ?auto_250420 ?auto_250428 ) ) ( not ( = ?auto_250420 ?auto_250429 ) ) ( not ( = ?auto_250421 ?auto_250422 ) ) ( not ( = ?auto_250421 ?auto_250423 ) ) ( not ( = ?auto_250421 ?auto_250424 ) ) ( not ( = ?auto_250421 ?auto_250425 ) ) ( not ( = ?auto_250421 ?auto_250426 ) ) ( not ( = ?auto_250421 ?auto_250427 ) ) ( not ( = ?auto_250421 ?auto_250428 ) ) ( not ( = ?auto_250421 ?auto_250429 ) ) ( not ( = ?auto_250422 ?auto_250423 ) ) ( not ( = ?auto_250422 ?auto_250424 ) ) ( not ( = ?auto_250422 ?auto_250425 ) ) ( not ( = ?auto_250422 ?auto_250426 ) ) ( not ( = ?auto_250422 ?auto_250427 ) ) ( not ( = ?auto_250422 ?auto_250428 ) ) ( not ( = ?auto_250422 ?auto_250429 ) ) ( not ( = ?auto_250423 ?auto_250424 ) ) ( not ( = ?auto_250423 ?auto_250425 ) ) ( not ( = ?auto_250423 ?auto_250426 ) ) ( not ( = ?auto_250423 ?auto_250427 ) ) ( not ( = ?auto_250423 ?auto_250428 ) ) ( not ( = ?auto_250423 ?auto_250429 ) ) ( not ( = ?auto_250424 ?auto_250425 ) ) ( not ( = ?auto_250424 ?auto_250426 ) ) ( not ( = ?auto_250424 ?auto_250427 ) ) ( not ( = ?auto_250424 ?auto_250428 ) ) ( not ( = ?auto_250424 ?auto_250429 ) ) ( not ( = ?auto_250425 ?auto_250426 ) ) ( not ( = ?auto_250425 ?auto_250427 ) ) ( not ( = ?auto_250425 ?auto_250428 ) ) ( not ( = ?auto_250425 ?auto_250429 ) ) ( not ( = ?auto_250426 ?auto_250427 ) ) ( not ( = ?auto_250426 ?auto_250428 ) ) ( not ( = ?auto_250426 ?auto_250429 ) ) ( not ( = ?auto_250427 ?auto_250428 ) ) ( not ( = ?auto_250427 ?auto_250429 ) ) ( not ( = ?auto_250428 ?auto_250429 ) ) ( ON ?auto_250428 ?auto_250429 ) ( ON ?auto_250427 ?auto_250428 ) ( ON ?auto_250426 ?auto_250427 ) ( ON ?auto_250425 ?auto_250426 ) ( ON ?auto_250424 ?auto_250425 ) ( ON ?auto_250423 ?auto_250424 ) ( ON ?auto_250422 ?auto_250423 ) ( ON ?auto_250421 ?auto_250422 ) ( CLEAR ?auto_250419 ) ( ON ?auto_250420 ?auto_250421 ) ( CLEAR ?auto_250420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250417 ?auto_250418 ?auto_250419 ?auto_250420 )
      ( MAKE-13PILE ?auto_250417 ?auto_250418 ?auto_250419 ?auto_250420 ?auto_250421 ?auto_250422 ?auto_250423 ?auto_250424 ?auto_250425 ?auto_250426 ?auto_250427 ?auto_250428 ?auto_250429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250443 - BLOCK
      ?auto_250444 - BLOCK
      ?auto_250445 - BLOCK
      ?auto_250446 - BLOCK
      ?auto_250447 - BLOCK
      ?auto_250448 - BLOCK
      ?auto_250449 - BLOCK
      ?auto_250450 - BLOCK
      ?auto_250451 - BLOCK
      ?auto_250452 - BLOCK
      ?auto_250453 - BLOCK
      ?auto_250454 - BLOCK
      ?auto_250455 - BLOCK
    )
    :vars
    (
      ?auto_250456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250455 ?auto_250456 ) ( ON-TABLE ?auto_250443 ) ( ON ?auto_250444 ?auto_250443 ) ( not ( = ?auto_250443 ?auto_250444 ) ) ( not ( = ?auto_250443 ?auto_250445 ) ) ( not ( = ?auto_250443 ?auto_250446 ) ) ( not ( = ?auto_250443 ?auto_250447 ) ) ( not ( = ?auto_250443 ?auto_250448 ) ) ( not ( = ?auto_250443 ?auto_250449 ) ) ( not ( = ?auto_250443 ?auto_250450 ) ) ( not ( = ?auto_250443 ?auto_250451 ) ) ( not ( = ?auto_250443 ?auto_250452 ) ) ( not ( = ?auto_250443 ?auto_250453 ) ) ( not ( = ?auto_250443 ?auto_250454 ) ) ( not ( = ?auto_250443 ?auto_250455 ) ) ( not ( = ?auto_250443 ?auto_250456 ) ) ( not ( = ?auto_250444 ?auto_250445 ) ) ( not ( = ?auto_250444 ?auto_250446 ) ) ( not ( = ?auto_250444 ?auto_250447 ) ) ( not ( = ?auto_250444 ?auto_250448 ) ) ( not ( = ?auto_250444 ?auto_250449 ) ) ( not ( = ?auto_250444 ?auto_250450 ) ) ( not ( = ?auto_250444 ?auto_250451 ) ) ( not ( = ?auto_250444 ?auto_250452 ) ) ( not ( = ?auto_250444 ?auto_250453 ) ) ( not ( = ?auto_250444 ?auto_250454 ) ) ( not ( = ?auto_250444 ?auto_250455 ) ) ( not ( = ?auto_250444 ?auto_250456 ) ) ( not ( = ?auto_250445 ?auto_250446 ) ) ( not ( = ?auto_250445 ?auto_250447 ) ) ( not ( = ?auto_250445 ?auto_250448 ) ) ( not ( = ?auto_250445 ?auto_250449 ) ) ( not ( = ?auto_250445 ?auto_250450 ) ) ( not ( = ?auto_250445 ?auto_250451 ) ) ( not ( = ?auto_250445 ?auto_250452 ) ) ( not ( = ?auto_250445 ?auto_250453 ) ) ( not ( = ?auto_250445 ?auto_250454 ) ) ( not ( = ?auto_250445 ?auto_250455 ) ) ( not ( = ?auto_250445 ?auto_250456 ) ) ( not ( = ?auto_250446 ?auto_250447 ) ) ( not ( = ?auto_250446 ?auto_250448 ) ) ( not ( = ?auto_250446 ?auto_250449 ) ) ( not ( = ?auto_250446 ?auto_250450 ) ) ( not ( = ?auto_250446 ?auto_250451 ) ) ( not ( = ?auto_250446 ?auto_250452 ) ) ( not ( = ?auto_250446 ?auto_250453 ) ) ( not ( = ?auto_250446 ?auto_250454 ) ) ( not ( = ?auto_250446 ?auto_250455 ) ) ( not ( = ?auto_250446 ?auto_250456 ) ) ( not ( = ?auto_250447 ?auto_250448 ) ) ( not ( = ?auto_250447 ?auto_250449 ) ) ( not ( = ?auto_250447 ?auto_250450 ) ) ( not ( = ?auto_250447 ?auto_250451 ) ) ( not ( = ?auto_250447 ?auto_250452 ) ) ( not ( = ?auto_250447 ?auto_250453 ) ) ( not ( = ?auto_250447 ?auto_250454 ) ) ( not ( = ?auto_250447 ?auto_250455 ) ) ( not ( = ?auto_250447 ?auto_250456 ) ) ( not ( = ?auto_250448 ?auto_250449 ) ) ( not ( = ?auto_250448 ?auto_250450 ) ) ( not ( = ?auto_250448 ?auto_250451 ) ) ( not ( = ?auto_250448 ?auto_250452 ) ) ( not ( = ?auto_250448 ?auto_250453 ) ) ( not ( = ?auto_250448 ?auto_250454 ) ) ( not ( = ?auto_250448 ?auto_250455 ) ) ( not ( = ?auto_250448 ?auto_250456 ) ) ( not ( = ?auto_250449 ?auto_250450 ) ) ( not ( = ?auto_250449 ?auto_250451 ) ) ( not ( = ?auto_250449 ?auto_250452 ) ) ( not ( = ?auto_250449 ?auto_250453 ) ) ( not ( = ?auto_250449 ?auto_250454 ) ) ( not ( = ?auto_250449 ?auto_250455 ) ) ( not ( = ?auto_250449 ?auto_250456 ) ) ( not ( = ?auto_250450 ?auto_250451 ) ) ( not ( = ?auto_250450 ?auto_250452 ) ) ( not ( = ?auto_250450 ?auto_250453 ) ) ( not ( = ?auto_250450 ?auto_250454 ) ) ( not ( = ?auto_250450 ?auto_250455 ) ) ( not ( = ?auto_250450 ?auto_250456 ) ) ( not ( = ?auto_250451 ?auto_250452 ) ) ( not ( = ?auto_250451 ?auto_250453 ) ) ( not ( = ?auto_250451 ?auto_250454 ) ) ( not ( = ?auto_250451 ?auto_250455 ) ) ( not ( = ?auto_250451 ?auto_250456 ) ) ( not ( = ?auto_250452 ?auto_250453 ) ) ( not ( = ?auto_250452 ?auto_250454 ) ) ( not ( = ?auto_250452 ?auto_250455 ) ) ( not ( = ?auto_250452 ?auto_250456 ) ) ( not ( = ?auto_250453 ?auto_250454 ) ) ( not ( = ?auto_250453 ?auto_250455 ) ) ( not ( = ?auto_250453 ?auto_250456 ) ) ( not ( = ?auto_250454 ?auto_250455 ) ) ( not ( = ?auto_250454 ?auto_250456 ) ) ( not ( = ?auto_250455 ?auto_250456 ) ) ( ON ?auto_250454 ?auto_250455 ) ( ON ?auto_250453 ?auto_250454 ) ( ON ?auto_250452 ?auto_250453 ) ( ON ?auto_250451 ?auto_250452 ) ( ON ?auto_250450 ?auto_250451 ) ( ON ?auto_250449 ?auto_250450 ) ( ON ?auto_250448 ?auto_250449 ) ( ON ?auto_250447 ?auto_250448 ) ( ON ?auto_250446 ?auto_250447 ) ( CLEAR ?auto_250444 ) ( ON ?auto_250445 ?auto_250446 ) ( CLEAR ?auto_250445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250443 ?auto_250444 ?auto_250445 )
      ( MAKE-13PILE ?auto_250443 ?auto_250444 ?auto_250445 ?auto_250446 ?auto_250447 ?auto_250448 ?auto_250449 ?auto_250450 ?auto_250451 ?auto_250452 ?auto_250453 ?auto_250454 ?auto_250455 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250470 - BLOCK
      ?auto_250471 - BLOCK
      ?auto_250472 - BLOCK
      ?auto_250473 - BLOCK
      ?auto_250474 - BLOCK
      ?auto_250475 - BLOCK
      ?auto_250476 - BLOCK
      ?auto_250477 - BLOCK
      ?auto_250478 - BLOCK
      ?auto_250479 - BLOCK
      ?auto_250480 - BLOCK
      ?auto_250481 - BLOCK
      ?auto_250482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250482 ) ( ON-TABLE ?auto_250470 ) ( ON ?auto_250471 ?auto_250470 ) ( not ( = ?auto_250470 ?auto_250471 ) ) ( not ( = ?auto_250470 ?auto_250472 ) ) ( not ( = ?auto_250470 ?auto_250473 ) ) ( not ( = ?auto_250470 ?auto_250474 ) ) ( not ( = ?auto_250470 ?auto_250475 ) ) ( not ( = ?auto_250470 ?auto_250476 ) ) ( not ( = ?auto_250470 ?auto_250477 ) ) ( not ( = ?auto_250470 ?auto_250478 ) ) ( not ( = ?auto_250470 ?auto_250479 ) ) ( not ( = ?auto_250470 ?auto_250480 ) ) ( not ( = ?auto_250470 ?auto_250481 ) ) ( not ( = ?auto_250470 ?auto_250482 ) ) ( not ( = ?auto_250471 ?auto_250472 ) ) ( not ( = ?auto_250471 ?auto_250473 ) ) ( not ( = ?auto_250471 ?auto_250474 ) ) ( not ( = ?auto_250471 ?auto_250475 ) ) ( not ( = ?auto_250471 ?auto_250476 ) ) ( not ( = ?auto_250471 ?auto_250477 ) ) ( not ( = ?auto_250471 ?auto_250478 ) ) ( not ( = ?auto_250471 ?auto_250479 ) ) ( not ( = ?auto_250471 ?auto_250480 ) ) ( not ( = ?auto_250471 ?auto_250481 ) ) ( not ( = ?auto_250471 ?auto_250482 ) ) ( not ( = ?auto_250472 ?auto_250473 ) ) ( not ( = ?auto_250472 ?auto_250474 ) ) ( not ( = ?auto_250472 ?auto_250475 ) ) ( not ( = ?auto_250472 ?auto_250476 ) ) ( not ( = ?auto_250472 ?auto_250477 ) ) ( not ( = ?auto_250472 ?auto_250478 ) ) ( not ( = ?auto_250472 ?auto_250479 ) ) ( not ( = ?auto_250472 ?auto_250480 ) ) ( not ( = ?auto_250472 ?auto_250481 ) ) ( not ( = ?auto_250472 ?auto_250482 ) ) ( not ( = ?auto_250473 ?auto_250474 ) ) ( not ( = ?auto_250473 ?auto_250475 ) ) ( not ( = ?auto_250473 ?auto_250476 ) ) ( not ( = ?auto_250473 ?auto_250477 ) ) ( not ( = ?auto_250473 ?auto_250478 ) ) ( not ( = ?auto_250473 ?auto_250479 ) ) ( not ( = ?auto_250473 ?auto_250480 ) ) ( not ( = ?auto_250473 ?auto_250481 ) ) ( not ( = ?auto_250473 ?auto_250482 ) ) ( not ( = ?auto_250474 ?auto_250475 ) ) ( not ( = ?auto_250474 ?auto_250476 ) ) ( not ( = ?auto_250474 ?auto_250477 ) ) ( not ( = ?auto_250474 ?auto_250478 ) ) ( not ( = ?auto_250474 ?auto_250479 ) ) ( not ( = ?auto_250474 ?auto_250480 ) ) ( not ( = ?auto_250474 ?auto_250481 ) ) ( not ( = ?auto_250474 ?auto_250482 ) ) ( not ( = ?auto_250475 ?auto_250476 ) ) ( not ( = ?auto_250475 ?auto_250477 ) ) ( not ( = ?auto_250475 ?auto_250478 ) ) ( not ( = ?auto_250475 ?auto_250479 ) ) ( not ( = ?auto_250475 ?auto_250480 ) ) ( not ( = ?auto_250475 ?auto_250481 ) ) ( not ( = ?auto_250475 ?auto_250482 ) ) ( not ( = ?auto_250476 ?auto_250477 ) ) ( not ( = ?auto_250476 ?auto_250478 ) ) ( not ( = ?auto_250476 ?auto_250479 ) ) ( not ( = ?auto_250476 ?auto_250480 ) ) ( not ( = ?auto_250476 ?auto_250481 ) ) ( not ( = ?auto_250476 ?auto_250482 ) ) ( not ( = ?auto_250477 ?auto_250478 ) ) ( not ( = ?auto_250477 ?auto_250479 ) ) ( not ( = ?auto_250477 ?auto_250480 ) ) ( not ( = ?auto_250477 ?auto_250481 ) ) ( not ( = ?auto_250477 ?auto_250482 ) ) ( not ( = ?auto_250478 ?auto_250479 ) ) ( not ( = ?auto_250478 ?auto_250480 ) ) ( not ( = ?auto_250478 ?auto_250481 ) ) ( not ( = ?auto_250478 ?auto_250482 ) ) ( not ( = ?auto_250479 ?auto_250480 ) ) ( not ( = ?auto_250479 ?auto_250481 ) ) ( not ( = ?auto_250479 ?auto_250482 ) ) ( not ( = ?auto_250480 ?auto_250481 ) ) ( not ( = ?auto_250480 ?auto_250482 ) ) ( not ( = ?auto_250481 ?auto_250482 ) ) ( ON ?auto_250481 ?auto_250482 ) ( ON ?auto_250480 ?auto_250481 ) ( ON ?auto_250479 ?auto_250480 ) ( ON ?auto_250478 ?auto_250479 ) ( ON ?auto_250477 ?auto_250478 ) ( ON ?auto_250476 ?auto_250477 ) ( ON ?auto_250475 ?auto_250476 ) ( ON ?auto_250474 ?auto_250475 ) ( ON ?auto_250473 ?auto_250474 ) ( CLEAR ?auto_250471 ) ( ON ?auto_250472 ?auto_250473 ) ( CLEAR ?auto_250472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250470 ?auto_250471 ?auto_250472 )
      ( MAKE-13PILE ?auto_250470 ?auto_250471 ?auto_250472 ?auto_250473 ?auto_250474 ?auto_250475 ?auto_250476 ?auto_250477 ?auto_250478 ?auto_250479 ?auto_250480 ?auto_250481 ?auto_250482 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250496 - BLOCK
      ?auto_250497 - BLOCK
      ?auto_250498 - BLOCK
      ?auto_250499 - BLOCK
      ?auto_250500 - BLOCK
      ?auto_250501 - BLOCK
      ?auto_250502 - BLOCK
      ?auto_250503 - BLOCK
      ?auto_250504 - BLOCK
      ?auto_250505 - BLOCK
      ?auto_250506 - BLOCK
      ?auto_250507 - BLOCK
      ?auto_250508 - BLOCK
    )
    :vars
    (
      ?auto_250509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250508 ?auto_250509 ) ( ON-TABLE ?auto_250496 ) ( not ( = ?auto_250496 ?auto_250497 ) ) ( not ( = ?auto_250496 ?auto_250498 ) ) ( not ( = ?auto_250496 ?auto_250499 ) ) ( not ( = ?auto_250496 ?auto_250500 ) ) ( not ( = ?auto_250496 ?auto_250501 ) ) ( not ( = ?auto_250496 ?auto_250502 ) ) ( not ( = ?auto_250496 ?auto_250503 ) ) ( not ( = ?auto_250496 ?auto_250504 ) ) ( not ( = ?auto_250496 ?auto_250505 ) ) ( not ( = ?auto_250496 ?auto_250506 ) ) ( not ( = ?auto_250496 ?auto_250507 ) ) ( not ( = ?auto_250496 ?auto_250508 ) ) ( not ( = ?auto_250496 ?auto_250509 ) ) ( not ( = ?auto_250497 ?auto_250498 ) ) ( not ( = ?auto_250497 ?auto_250499 ) ) ( not ( = ?auto_250497 ?auto_250500 ) ) ( not ( = ?auto_250497 ?auto_250501 ) ) ( not ( = ?auto_250497 ?auto_250502 ) ) ( not ( = ?auto_250497 ?auto_250503 ) ) ( not ( = ?auto_250497 ?auto_250504 ) ) ( not ( = ?auto_250497 ?auto_250505 ) ) ( not ( = ?auto_250497 ?auto_250506 ) ) ( not ( = ?auto_250497 ?auto_250507 ) ) ( not ( = ?auto_250497 ?auto_250508 ) ) ( not ( = ?auto_250497 ?auto_250509 ) ) ( not ( = ?auto_250498 ?auto_250499 ) ) ( not ( = ?auto_250498 ?auto_250500 ) ) ( not ( = ?auto_250498 ?auto_250501 ) ) ( not ( = ?auto_250498 ?auto_250502 ) ) ( not ( = ?auto_250498 ?auto_250503 ) ) ( not ( = ?auto_250498 ?auto_250504 ) ) ( not ( = ?auto_250498 ?auto_250505 ) ) ( not ( = ?auto_250498 ?auto_250506 ) ) ( not ( = ?auto_250498 ?auto_250507 ) ) ( not ( = ?auto_250498 ?auto_250508 ) ) ( not ( = ?auto_250498 ?auto_250509 ) ) ( not ( = ?auto_250499 ?auto_250500 ) ) ( not ( = ?auto_250499 ?auto_250501 ) ) ( not ( = ?auto_250499 ?auto_250502 ) ) ( not ( = ?auto_250499 ?auto_250503 ) ) ( not ( = ?auto_250499 ?auto_250504 ) ) ( not ( = ?auto_250499 ?auto_250505 ) ) ( not ( = ?auto_250499 ?auto_250506 ) ) ( not ( = ?auto_250499 ?auto_250507 ) ) ( not ( = ?auto_250499 ?auto_250508 ) ) ( not ( = ?auto_250499 ?auto_250509 ) ) ( not ( = ?auto_250500 ?auto_250501 ) ) ( not ( = ?auto_250500 ?auto_250502 ) ) ( not ( = ?auto_250500 ?auto_250503 ) ) ( not ( = ?auto_250500 ?auto_250504 ) ) ( not ( = ?auto_250500 ?auto_250505 ) ) ( not ( = ?auto_250500 ?auto_250506 ) ) ( not ( = ?auto_250500 ?auto_250507 ) ) ( not ( = ?auto_250500 ?auto_250508 ) ) ( not ( = ?auto_250500 ?auto_250509 ) ) ( not ( = ?auto_250501 ?auto_250502 ) ) ( not ( = ?auto_250501 ?auto_250503 ) ) ( not ( = ?auto_250501 ?auto_250504 ) ) ( not ( = ?auto_250501 ?auto_250505 ) ) ( not ( = ?auto_250501 ?auto_250506 ) ) ( not ( = ?auto_250501 ?auto_250507 ) ) ( not ( = ?auto_250501 ?auto_250508 ) ) ( not ( = ?auto_250501 ?auto_250509 ) ) ( not ( = ?auto_250502 ?auto_250503 ) ) ( not ( = ?auto_250502 ?auto_250504 ) ) ( not ( = ?auto_250502 ?auto_250505 ) ) ( not ( = ?auto_250502 ?auto_250506 ) ) ( not ( = ?auto_250502 ?auto_250507 ) ) ( not ( = ?auto_250502 ?auto_250508 ) ) ( not ( = ?auto_250502 ?auto_250509 ) ) ( not ( = ?auto_250503 ?auto_250504 ) ) ( not ( = ?auto_250503 ?auto_250505 ) ) ( not ( = ?auto_250503 ?auto_250506 ) ) ( not ( = ?auto_250503 ?auto_250507 ) ) ( not ( = ?auto_250503 ?auto_250508 ) ) ( not ( = ?auto_250503 ?auto_250509 ) ) ( not ( = ?auto_250504 ?auto_250505 ) ) ( not ( = ?auto_250504 ?auto_250506 ) ) ( not ( = ?auto_250504 ?auto_250507 ) ) ( not ( = ?auto_250504 ?auto_250508 ) ) ( not ( = ?auto_250504 ?auto_250509 ) ) ( not ( = ?auto_250505 ?auto_250506 ) ) ( not ( = ?auto_250505 ?auto_250507 ) ) ( not ( = ?auto_250505 ?auto_250508 ) ) ( not ( = ?auto_250505 ?auto_250509 ) ) ( not ( = ?auto_250506 ?auto_250507 ) ) ( not ( = ?auto_250506 ?auto_250508 ) ) ( not ( = ?auto_250506 ?auto_250509 ) ) ( not ( = ?auto_250507 ?auto_250508 ) ) ( not ( = ?auto_250507 ?auto_250509 ) ) ( not ( = ?auto_250508 ?auto_250509 ) ) ( ON ?auto_250507 ?auto_250508 ) ( ON ?auto_250506 ?auto_250507 ) ( ON ?auto_250505 ?auto_250506 ) ( ON ?auto_250504 ?auto_250505 ) ( ON ?auto_250503 ?auto_250504 ) ( ON ?auto_250502 ?auto_250503 ) ( ON ?auto_250501 ?auto_250502 ) ( ON ?auto_250500 ?auto_250501 ) ( ON ?auto_250499 ?auto_250500 ) ( ON ?auto_250498 ?auto_250499 ) ( CLEAR ?auto_250496 ) ( ON ?auto_250497 ?auto_250498 ) ( CLEAR ?auto_250497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250496 ?auto_250497 )
      ( MAKE-13PILE ?auto_250496 ?auto_250497 ?auto_250498 ?auto_250499 ?auto_250500 ?auto_250501 ?auto_250502 ?auto_250503 ?auto_250504 ?auto_250505 ?auto_250506 ?auto_250507 ?auto_250508 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250523 - BLOCK
      ?auto_250524 - BLOCK
      ?auto_250525 - BLOCK
      ?auto_250526 - BLOCK
      ?auto_250527 - BLOCK
      ?auto_250528 - BLOCK
      ?auto_250529 - BLOCK
      ?auto_250530 - BLOCK
      ?auto_250531 - BLOCK
      ?auto_250532 - BLOCK
      ?auto_250533 - BLOCK
      ?auto_250534 - BLOCK
      ?auto_250535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250535 ) ( ON-TABLE ?auto_250523 ) ( not ( = ?auto_250523 ?auto_250524 ) ) ( not ( = ?auto_250523 ?auto_250525 ) ) ( not ( = ?auto_250523 ?auto_250526 ) ) ( not ( = ?auto_250523 ?auto_250527 ) ) ( not ( = ?auto_250523 ?auto_250528 ) ) ( not ( = ?auto_250523 ?auto_250529 ) ) ( not ( = ?auto_250523 ?auto_250530 ) ) ( not ( = ?auto_250523 ?auto_250531 ) ) ( not ( = ?auto_250523 ?auto_250532 ) ) ( not ( = ?auto_250523 ?auto_250533 ) ) ( not ( = ?auto_250523 ?auto_250534 ) ) ( not ( = ?auto_250523 ?auto_250535 ) ) ( not ( = ?auto_250524 ?auto_250525 ) ) ( not ( = ?auto_250524 ?auto_250526 ) ) ( not ( = ?auto_250524 ?auto_250527 ) ) ( not ( = ?auto_250524 ?auto_250528 ) ) ( not ( = ?auto_250524 ?auto_250529 ) ) ( not ( = ?auto_250524 ?auto_250530 ) ) ( not ( = ?auto_250524 ?auto_250531 ) ) ( not ( = ?auto_250524 ?auto_250532 ) ) ( not ( = ?auto_250524 ?auto_250533 ) ) ( not ( = ?auto_250524 ?auto_250534 ) ) ( not ( = ?auto_250524 ?auto_250535 ) ) ( not ( = ?auto_250525 ?auto_250526 ) ) ( not ( = ?auto_250525 ?auto_250527 ) ) ( not ( = ?auto_250525 ?auto_250528 ) ) ( not ( = ?auto_250525 ?auto_250529 ) ) ( not ( = ?auto_250525 ?auto_250530 ) ) ( not ( = ?auto_250525 ?auto_250531 ) ) ( not ( = ?auto_250525 ?auto_250532 ) ) ( not ( = ?auto_250525 ?auto_250533 ) ) ( not ( = ?auto_250525 ?auto_250534 ) ) ( not ( = ?auto_250525 ?auto_250535 ) ) ( not ( = ?auto_250526 ?auto_250527 ) ) ( not ( = ?auto_250526 ?auto_250528 ) ) ( not ( = ?auto_250526 ?auto_250529 ) ) ( not ( = ?auto_250526 ?auto_250530 ) ) ( not ( = ?auto_250526 ?auto_250531 ) ) ( not ( = ?auto_250526 ?auto_250532 ) ) ( not ( = ?auto_250526 ?auto_250533 ) ) ( not ( = ?auto_250526 ?auto_250534 ) ) ( not ( = ?auto_250526 ?auto_250535 ) ) ( not ( = ?auto_250527 ?auto_250528 ) ) ( not ( = ?auto_250527 ?auto_250529 ) ) ( not ( = ?auto_250527 ?auto_250530 ) ) ( not ( = ?auto_250527 ?auto_250531 ) ) ( not ( = ?auto_250527 ?auto_250532 ) ) ( not ( = ?auto_250527 ?auto_250533 ) ) ( not ( = ?auto_250527 ?auto_250534 ) ) ( not ( = ?auto_250527 ?auto_250535 ) ) ( not ( = ?auto_250528 ?auto_250529 ) ) ( not ( = ?auto_250528 ?auto_250530 ) ) ( not ( = ?auto_250528 ?auto_250531 ) ) ( not ( = ?auto_250528 ?auto_250532 ) ) ( not ( = ?auto_250528 ?auto_250533 ) ) ( not ( = ?auto_250528 ?auto_250534 ) ) ( not ( = ?auto_250528 ?auto_250535 ) ) ( not ( = ?auto_250529 ?auto_250530 ) ) ( not ( = ?auto_250529 ?auto_250531 ) ) ( not ( = ?auto_250529 ?auto_250532 ) ) ( not ( = ?auto_250529 ?auto_250533 ) ) ( not ( = ?auto_250529 ?auto_250534 ) ) ( not ( = ?auto_250529 ?auto_250535 ) ) ( not ( = ?auto_250530 ?auto_250531 ) ) ( not ( = ?auto_250530 ?auto_250532 ) ) ( not ( = ?auto_250530 ?auto_250533 ) ) ( not ( = ?auto_250530 ?auto_250534 ) ) ( not ( = ?auto_250530 ?auto_250535 ) ) ( not ( = ?auto_250531 ?auto_250532 ) ) ( not ( = ?auto_250531 ?auto_250533 ) ) ( not ( = ?auto_250531 ?auto_250534 ) ) ( not ( = ?auto_250531 ?auto_250535 ) ) ( not ( = ?auto_250532 ?auto_250533 ) ) ( not ( = ?auto_250532 ?auto_250534 ) ) ( not ( = ?auto_250532 ?auto_250535 ) ) ( not ( = ?auto_250533 ?auto_250534 ) ) ( not ( = ?auto_250533 ?auto_250535 ) ) ( not ( = ?auto_250534 ?auto_250535 ) ) ( ON ?auto_250534 ?auto_250535 ) ( ON ?auto_250533 ?auto_250534 ) ( ON ?auto_250532 ?auto_250533 ) ( ON ?auto_250531 ?auto_250532 ) ( ON ?auto_250530 ?auto_250531 ) ( ON ?auto_250529 ?auto_250530 ) ( ON ?auto_250528 ?auto_250529 ) ( ON ?auto_250527 ?auto_250528 ) ( ON ?auto_250526 ?auto_250527 ) ( ON ?auto_250525 ?auto_250526 ) ( CLEAR ?auto_250523 ) ( ON ?auto_250524 ?auto_250525 ) ( CLEAR ?auto_250524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250523 ?auto_250524 )
      ( MAKE-13PILE ?auto_250523 ?auto_250524 ?auto_250525 ?auto_250526 ?auto_250527 ?auto_250528 ?auto_250529 ?auto_250530 ?auto_250531 ?auto_250532 ?auto_250533 ?auto_250534 ?auto_250535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250549 - BLOCK
      ?auto_250550 - BLOCK
      ?auto_250551 - BLOCK
      ?auto_250552 - BLOCK
      ?auto_250553 - BLOCK
      ?auto_250554 - BLOCK
      ?auto_250555 - BLOCK
      ?auto_250556 - BLOCK
      ?auto_250557 - BLOCK
      ?auto_250558 - BLOCK
      ?auto_250559 - BLOCK
      ?auto_250560 - BLOCK
      ?auto_250561 - BLOCK
    )
    :vars
    (
      ?auto_250562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250561 ?auto_250562 ) ( not ( = ?auto_250549 ?auto_250550 ) ) ( not ( = ?auto_250549 ?auto_250551 ) ) ( not ( = ?auto_250549 ?auto_250552 ) ) ( not ( = ?auto_250549 ?auto_250553 ) ) ( not ( = ?auto_250549 ?auto_250554 ) ) ( not ( = ?auto_250549 ?auto_250555 ) ) ( not ( = ?auto_250549 ?auto_250556 ) ) ( not ( = ?auto_250549 ?auto_250557 ) ) ( not ( = ?auto_250549 ?auto_250558 ) ) ( not ( = ?auto_250549 ?auto_250559 ) ) ( not ( = ?auto_250549 ?auto_250560 ) ) ( not ( = ?auto_250549 ?auto_250561 ) ) ( not ( = ?auto_250549 ?auto_250562 ) ) ( not ( = ?auto_250550 ?auto_250551 ) ) ( not ( = ?auto_250550 ?auto_250552 ) ) ( not ( = ?auto_250550 ?auto_250553 ) ) ( not ( = ?auto_250550 ?auto_250554 ) ) ( not ( = ?auto_250550 ?auto_250555 ) ) ( not ( = ?auto_250550 ?auto_250556 ) ) ( not ( = ?auto_250550 ?auto_250557 ) ) ( not ( = ?auto_250550 ?auto_250558 ) ) ( not ( = ?auto_250550 ?auto_250559 ) ) ( not ( = ?auto_250550 ?auto_250560 ) ) ( not ( = ?auto_250550 ?auto_250561 ) ) ( not ( = ?auto_250550 ?auto_250562 ) ) ( not ( = ?auto_250551 ?auto_250552 ) ) ( not ( = ?auto_250551 ?auto_250553 ) ) ( not ( = ?auto_250551 ?auto_250554 ) ) ( not ( = ?auto_250551 ?auto_250555 ) ) ( not ( = ?auto_250551 ?auto_250556 ) ) ( not ( = ?auto_250551 ?auto_250557 ) ) ( not ( = ?auto_250551 ?auto_250558 ) ) ( not ( = ?auto_250551 ?auto_250559 ) ) ( not ( = ?auto_250551 ?auto_250560 ) ) ( not ( = ?auto_250551 ?auto_250561 ) ) ( not ( = ?auto_250551 ?auto_250562 ) ) ( not ( = ?auto_250552 ?auto_250553 ) ) ( not ( = ?auto_250552 ?auto_250554 ) ) ( not ( = ?auto_250552 ?auto_250555 ) ) ( not ( = ?auto_250552 ?auto_250556 ) ) ( not ( = ?auto_250552 ?auto_250557 ) ) ( not ( = ?auto_250552 ?auto_250558 ) ) ( not ( = ?auto_250552 ?auto_250559 ) ) ( not ( = ?auto_250552 ?auto_250560 ) ) ( not ( = ?auto_250552 ?auto_250561 ) ) ( not ( = ?auto_250552 ?auto_250562 ) ) ( not ( = ?auto_250553 ?auto_250554 ) ) ( not ( = ?auto_250553 ?auto_250555 ) ) ( not ( = ?auto_250553 ?auto_250556 ) ) ( not ( = ?auto_250553 ?auto_250557 ) ) ( not ( = ?auto_250553 ?auto_250558 ) ) ( not ( = ?auto_250553 ?auto_250559 ) ) ( not ( = ?auto_250553 ?auto_250560 ) ) ( not ( = ?auto_250553 ?auto_250561 ) ) ( not ( = ?auto_250553 ?auto_250562 ) ) ( not ( = ?auto_250554 ?auto_250555 ) ) ( not ( = ?auto_250554 ?auto_250556 ) ) ( not ( = ?auto_250554 ?auto_250557 ) ) ( not ( = ?auto_250554 ?auto_250558 ) ) ( not ( = ?auto_250554 ?auto_250559 ) ) ( not ( = ?auto_250554 ?auto_250560 ) ) ( not ( = ?auto_250554 ?auto_250561 ) ) ( not ( = ?auto_250554 ?auto_250562 ) ) ( not ( = ?auto_250555 ?auto_250556 ) ) ( not ( = ?auto_250555 ?auto_250557 ) ) ( not ( = ?auto_250555 ?auto_250558 ) ) ( not ( = ?auto_250555 ?auto_250559 ) ) ( not ( = ?auto_250555 ?auto_250560 ) ) ( not ( = ?auto_250555 ?auto_250561 ) ) ( not ( = ?auto_250555 ?auto_250562 ) ) ( not ( = ?auto_250556 ?auto_250557 ) ) ( not ( = ?auto_250556 ?auto_250558 ) ) ( not ( = ?auto_250556 ?auto_250559 ) ) ( not ( = ?auto_250556 ?auto_250560 ) ) ( not ( = ?auto_250556 ?auto_250561 ) ) ( not ( = ?auto_250556 ?auto_250562 ) ) ( not ( = ?auto_250557 ?auto_250558 ) ) ( not ( = ?auto_250557 ?auto_250559 ) ) ( not ( = ?auto_250557 ?auto_250560 ) ) ( not ( = ?auto_250557 ?auto_250561 ) ) ( not ( = ?auto_250557 ?auto_250562 ) ) ( not ( = ?auto_250558 ?auto_250559 ) ) ( not ( = ?auto_250558 ?auto_250560 ) ) ( not ( = ?auto_250558 ?auto_250561 ) ) ( not ( = ?auto_250558 ?auto_250562 ) ) ( not ( = ?auto_250559 ?auto_250560 ) ) ( not ( = ?auto_250559 ?auto_250561 ) ) ( not ( = ?auto_250559 ?auto_250562 ) ) ( not ( = ?auto_250560 ?auto_250561 ) ) ( not ( = ?auto_250560 ?auto_250562 ) ) ( not ( = ?auto_250561 ?auto_250562 ) ) ( ON ?auto_250560 ?auto_250561 ) ( ON ?auto_250559 ?auto_250560 ) ( ON ?auto_250558 ?auto_250559 ) ( ON ?auto_250557 ?auto_250558 ) ( ON ?auto_250556 ?auto_250557 ) ( ON ?auto_250555 ?auto_250556 ) ( ON ?auto_250554 ?auto_250555 ) ( ON ?auto_250553 ?auto_250554 ) ( ON ?auto_250552 ?auto_250553 ) ( ON ?auto_250551 ?auto_250552 ) ( ON ?auto_250550 ?auto_250551 ) ( ON ?auto_250549 ?auto_250550 ) ( CLEAR ?auto_250549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250549 )
      ( MAKE-13PILE ?auto_250549 ?auto_250550 ?auto_250551 ?auto_250552 ?auto_250553 ?auto_250554 ?auto_250555 ?auto_250556 ?auto_250557 ?auto_250558 ?auto_250559 ?auto_250560 ?auto_250561 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250576 - BLOCK
      ?auto_250577 - BLOCK
      ?auto_250578 - BLOCK
      ?auto_250579 - BLOCK
      ?auto_250580 - BLOCK
      ?auto_250581 - BLOCK
      ?auto_250582 - BLOCK
      ?auto_250583 - BLOCK
      ?auto_250584 - BLOCK
      ?auto_250585 - BLOCK
      ?auto_250586 - BLOCK
      ?auto_250587 - BLOCK
      ?auto_250588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_250588 ) ( not ( = ?auto_250576 ?auto_250577 ) ) ( not ( = ?auto_250576 ?auto_250578 ) ) ( not ( = ?auto_250576 ?auto_250579 ) ) ( not ( = ?auto_250576 ?auto_250580 ) ) ( not ( = ?auto_250576 ?auto_250581 ) ) ( not ( = ?auto_250576 ?auto_250582 ) ) ( not ( = ?auto_250576 ?auto_250583 ) ) ( not ( = ?auto_250576 ?auto_250584 ) ) ( not ( = ?auto_250576 ?auto_250585 ) ) ( not ( = ?auto_250576 ?auto_250586 ) ) ( not ( = ?auto_250576 ?auto_250587 ) ) ( not ( = ?auto_250576 ?auto_250588 ) ) ( not ( = ?auto_250577 ?auto_250578 ) ) ( not ( = ?auto_250577 ?auto_250579 ) ) ( not ( = ?auto_250577 ?auto_250580 ) ) ( not ( = ?auto_250577 ?auto_250581 ) ) ( not ( = ?auto_250577 ?auto_250582 ) ) ( not ( = ?auto_250577 ?auto_250583 ) ) ( not ( = ?auto_250577 ?auto_250584 ) ) ( not ( = ?auto_250577 ?auto_250585 ) ) ( not ( = ?auto_250577 ?auto_250586 ) ) ( not ( = ?auto_250577 ?auto_250587 ) ) ( not ( = ?auto_250577 ?auto_250588 ) ) ( not ( = ?auto_250578 ?auto_250579 ) ) ( not ( = ?auto_250578 ?auto_250580 ) ) ( not ( = ?auto_250578 ?auto_250581 ) ) ( not ( = ?auto_250578 ?auto_250582 ) ) ( not ( = ?auto_250578 ?auto_250583 ) ) ( not ( = ?auto_250578 ?auto_250584 ) ) ( not ( = ?auto_250578 ?auto_250585 ) ) ( not ( = ?auto_250578 ?auto_250586 ) ) ( not ( = ?auto_250578 ?auto_250587 ) ) ( not ( = ?auto_250578 ?auto_250588 ) ) ( not ( = ?auto_250579 ?auto_250580 ) ) ( not ( = ?auto_250579 ?auto_250581 ) ) ( not ( = ?auto_250579 ?auto_250582 ) ) ( not ( = ?auto_250579 ?auto_250583 ) ) ( not ( = ?auto_250579 ?auto_250584 ) ) ( not ( = ?auto_250579 ?auto_250585 ) ) ( not ( = ?auto_250579 ?auto_250586 ) ) ( not ( = ?auto_250579 ?auto_250587 ) ) ( not ( = ?auto_250579 ?auto_250588 ) ) ( not ( = ?auto_250580 ?auto_250581 ) ) ( not ( = ?auto_250580 ?auto_250582 ) ) ( not ( = ?auto_250580 ?auto_250583 ) ) ( not ( = ?auto_250580 ?auto_250584 ) ) ( not ( = ?auto_250580 ?auto_250585 ) ) ( not ( = ?auto_250580 ?auto_250586 ) ) ( not ( = ?auto_250580 ?auto_250587 ) ) ( not ( = ?auto_250580 ?auto_250588 ) ) ( not ( = ?auto_250581 ?auto_250582 ) ) ( not ( = ?auto_250581 ?auto_250583 ) ) ( not ( = ?auto_250581 ?auto_250584 ) ) ( not ( = ?auto_250581 ?auto_250585 ) ) ( not ( = ?auto_250581 ?auto_250586 ) ) ( not ( = ?auto_250581 ?auto_250587 ) ) ( not ( = ?auto_250581 ?auto_250588 ) ) ( not ( = ?auto_250582 ?auto_250583 ) ) ( not ( = ?auto_250582 ?auto_250584 ) ) ( not ( = ?auto_250582 ?auto_250585 ) ) ( not ( = ?auto_250582 ?auto_250586 ) ) ( not ( = ?auto_250582 ?auto_250587 ) ) ( not ( = ?auto_250582 ?auto_250588 ) ) ( not ( = ?auto_250583 ?auto_250584 ) ) ( not ( = ?auto_250583 ?auto_250585 ) ) ( not ( = ?auto_250583 ?auto_250586 ) ) ( not ( = ?auto_250583 ?auto_250587 ) ) ( not ( = ?auto_250583 ?auto_250588 ) ) ( not ( = ?auto_250584 ?auto_250585 ) ) ( not ( = ?auto_250584 ?auto_250586 ) ) ( not ( = ?auto_250584 ?auto_250587 ) ) ( not ( = ?auto_250584 ?auto_250588 ) ) ( not ( = ?auto_250585 ?auto_250586 ) ) ( not ( = ?auto_250585 ?auto_250587 ) ) ( not ( = ?auto_250585 ?auto_250588 ) ) ( not ( = ?auto_250586 ?auto_250587 ) ) ( not ( = ?auto_250586 ?auto_250588 ) ) ( not ( = ?auto_250587 ?auto_250588 ) ) ( ON ?auto_250587 ?auto_250588 ) ( ON ?auto_250586 ?auto_250587 ) ( ON ?auto_250585 ?auto_250586 ) ( ON ?auto_250584 ?auto_250585 ) ( ON ?auto_250583 ?auto_250584 ) ( ON ?auto_250582 ?auto_250583 ) ( ON ?auto_250581 ?auto_250582 ) ( ON ?auto_250580 ?auto_250581 ) ( ON ?auto_250579 ?auto_250580 ) ( ON ?auto_250578 ?auto_250579 ) ( ON ?auto_250577 ?auto_250578 ) ( ON ?auto_250576 ?auto_250577 ) ( CLEAR ?auto_250576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250576 )
      ( MAKE-13PILE ?auto_250576 ?auto_250577 ?auto_250578 ?auto_250579 ?auto_250580 ?auto_250581 ?auto_250582 ?auto_250583 ?auto_250584 ?auto_250585 ?auto_250586 ?auto_250587 ?auto_250588 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_250602 - BLOCK
      ?auto_250603 - BLOCK
      ?auto_250604 - BLOCK
      ?auto_250605 - BLOCK
      ?auto_250606 - BLOCK
      ?auto_250607 - BLOCK
      ?auto_250608 - BLOCK
      ?auto_250609 - BLOCK
      ?auto_250610 - BLOCK
      ?auto_250611 - BLOCK
      ?auto_250612 - BLOCK
      ?auto_250613 - BLOCK
      ?auto_250614 - BLOCK
    )
    :vars
    (
      ?auto_250615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_250602 ?auto_250603 ) ) ( not ( = ?auto_250602 ?auto_250604 ) ) ( not ( = ?auto_250602 ?auto_250605 ) ) ( not ( = ?auto_250602 ?auto_250606 ) ) ( not ( = ?auto_250602 ?auto_250607 ) ) ( not ( = ?auto_250602 ?auto_250608 ) ) ( not ( = ?auto_250602 ?auto_250609 ) ) ( not ( = ?auto_250602 ?auto_250610 ) ) ( not ( = ?auto_250602 ?auto_250611 ) ) ( not ( = ?auto_250602 ?auto_250612 ) ) ( not ( = ?auto_250602 ?auto_250613 ) ) ( not ( = ?auto_250602 ?auto_250614 ) ) ( not ( = ?auto_250603 ?auto_250604 ) ) ( not ( = ?auto_250603 ?auto_250605 ) ) ( not ( = ?auto_250603 ?auto_250606 ) ) ( not ( = ?auto_250603 ?auto_250607 ) ) ( not ( = ?auto_250603 ?auto_250608 ) ) ( not ( = ?auto_250603 ?auto_250609 ) ) ( not ( = ?auto_250603 ?auto_250610 ) ) ( not ( = ?auto_250603 ?auto_250611 ) ) ( not ( = ?auto_250603 ?auto_250612 ) ) ( not ( = ?auto_250603 ?auto_250613 ) ) ( not ( = ?auto_250603 ?auto_250614 ) ) ( not ( = ?auto_250604 ?auto_250605 ) ) ( not ( = ?auto_250604 ?auto_250606 ) ) ( not ( = ?auto_250604 ?auto_250607 ) ) ( not ( = ?auto_250604 ?auto_250608 ) ) ( not ( = ?auto_250604 ?auto_250609 ) ) ( not ( = ?auto_250604 ?auto_250610 ) ) ( not ( = ?auto_250604 ?auto_250611 ) ) ( not ( = ?auto_250604 ?auto_250612 ) ) ( not ( = ?auto_250604 ?auto_250613 ) ) ( not ( = ?auto_250604 ?auto_250614 ) ) ( not ( = ?auto_250605 ?auto_250606 ) ) ( not ( = ?auto_250605 ?auto_250607 ) ) ( not ( = ?auto_250605 ?auto_250608 ) ) ( not ( = ?auto_250605 ?auto_250609 ) ) ( not ( = ?auto_250605 ?auto_250610 ) ) ( not ( = ?auto_250605 ?auto_250611 ) ) ( not ( = ?auto_250605 ?auto_250612 ) ) ( not ( = ?auto_250605 ?auto_250613 ) ) ( not ( = ?auto_250605 ?auto_250614 ) ) ( not ( = ?auto_250606 ?auto_250607 ) ) ( not ( = ?auto_250606 ?auto_250608 ) ) ( not ( = ?auto_250606 ?auto_250609 ) ) ( not ( = ?auto_250606 ?auto_250610 ) ) ( not ( = ?auto_250606 ?auto_250611 ) ) ( not ( = ?auto_250606 ?auto_250612 ) ) ( not ( = ?auto_250606 ?auto_250613 ) ) ( not ( = ?auto_250606 ?auto_250614 ) ) ( not ( = ?auto_250607 ?auto_250608 ) ) ( not ( = ?auto_250607 ?auto_250609 ) ) ( not ( = ?auto_250607 ?auto_250610 ) ) ( not ( = ?auto_250607 ?auto_250611 ) ) ( not ( = ?auto_250607 ?auto_250612 ) ) ( not ( = ?auto_250607 ?auto_250613 ) ) ( not ( = ?auto_250607 ?auto_250614 ) ) ( not ( = ?auto_250608 ?auto_250609 ) ) ( not ( = ?auto_250608 ?auto_250610 ) ) ( not ( = ?auto_250608 ?auto_250611 ) ) ( not ( = ?auto_250608 ?auto_250612 ) ) ( not ( = ?auto_250608 ?auto_250613 ) ) ( not ( = ?auto_250608 ?auto_250614 ) ) ( not ( = ?auto_250609 ?auto_250610 ) ) ( not ( = ?auto_250609 ?auto_250611 ) ) ( not ( = ?auto_250609 ?auto_250612 ) ) ( not ( = ?auto_250609 ?auto_250613 ) ) ( not ( = ?auto_250609 ?auto_250614 ) ) ( not ( = ?auto_250610 ?auto_250611 ) ) ( not ( = ?auto_250610 ?auto_250612 ) ) ( not ( = ?auto_250610 ?auto_250613 ) ) ( not ( = ?auto_250610 ?auto_250614 ) ) ( not ( = ?auto_250611 ?auto_250612 ) ) ( not ( = ?auto_250611 ?auto_250613 ) ) ( not ( = ?auto_250611 ?auto_250614 ) ) ( not ( = ?auto_250612 ?auto_250613 ) ) ( not ( = ?auto_250612 ?auto_250614 ) ) ( not ( = ?auto_250613 ?auto_250614 ) ) ( ON ?auto_250602 ?auto_250615 ) ( not ( = ?auto_250614 ?auto_250615 ) ) ( not ( = ?auto_250613 ?auto_250615 ) ) ( not ( = ?auto_250612 ?auto_250615 ) ) ( not ( = ?auto_250611 ?auto_250615 ) ) ( not ( = ?auto_250610 ?auto_250615 ) ) ( not ( = ?auto_250609 ?auto_250615 ) ) ( not ( = ?auto_250608 ?auto_250615 ) ) ( not ( = ?auto_250607 ?auto_250615 ) ) ( not ( = ?auto_250606 ?auto_250615 ) ) ( not ( = ?auto_250605 ?auto_250615 ) ) ( not ( = ?auto_250604 ?auto_250615 ) ) ( not ( = ?auto_250603 ?auto_250615 ) ) ( not ( = ?auto_250602 ?auto_250615 ) ) ( ON ?auto_250603 ?auto_250602 ) ( ON ?auto_250604 ?auto_250603 ) ( ON ?auto_250605 ?auto_250604 ) ( ON ?auto_250606 ?auto_250605 ) ( ON ?auto_250607 ?auto_250606 ) ( ON ?auto_250608 ?auto_250607 ) ( ON ?auto_250609 ?auto_250608 ) ( ON ?auto_250610 ?auto_250609 ) ( ON ?auto_250611 ?auto_250610 ) ( ON ?auto_250612 ?auto_250611 ) ( ON ?auto_250613 ?auto_250612 ) ( ON ?auto_250614 ?auto_250613 ) ( CLEAR ?auto_250614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_250614 ?auto_250613 ?auto_250612 ?auto_250611 ?auto_250610 ?auto_250609 ?auto_250608 ?auto_250607 ?auto_250606 ?auto_250605 ?auto_250604 ?auto_250603 ?auto_250602 )
      ( MAKE-13PILE ?auto_250602 ?auto_250603 ?auto_250604 ?auto_250605 ?auto_250606 ?auto_250607 ?auto_250608 ?auto_250609 ?auto_250610 ?auto_250611 ?auto_250612 ?auto_250613 ?auto_250614 ) )
  )

)

