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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7189 - BLOCK
      ?auto_7190 - BLOCK
      ?auto_7191 - BLOCK
      ?auto_7192 - BLOCK
    )
    :vars
    (
      ?auto_7193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7193 ?auto_7192 ) ( CLEAR ?auto_7193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7189 ) ( ON ?auto_7190 ?auto_7189 ) ( ON ?auto_7191 ?auto_7190 ) ( ON ?auto_7192 ?auto_7191 ) ( not ( = ?auto_7189 ?auto_7190 ) ) ( not ( = ?auto_7189 ?auto_7191 ) ) ( not ( = ?auto_7189 ?auto_7192 ) ) ( not ( = ?auto_7189 ?auto_7193 ) ) ( not ( = ?auto_7190 ?auto_7191 ) ) ( not ( = ?auto_7190 ?auto_7192 ) ) ( not ( = ?auto_7190 ?auto_7193 ) ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( not ( = ?auto_7192 ?auto_7193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7193 ?auto_7192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7195 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7195 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7196 - BLOCK
    )
    :vars
    (
      ?auto_7197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7196 ?auto_7197 ) ( CLEAR ?auto_7196 ) ( HAND-EMPTY ) ( not ( = ?auto_7196 ?auto_7197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7196 ?auto_7197 )
      ( MAKE-1PILE ?auto_7196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7201 - BLOCK
      ?auto_7202 - BLOCK
      ?auto_7203 - BLOCK
    )
    :vars
    (
      ?auto_7204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7204 ?auto_7203 ) ( CLEAR ?auto_7204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7201 ) ( ON ?auto_7202 ?auto_7201 ) ( ON ?auto_7203 ?auto_7202 ) ( not ( = ?auto_7201 ?auto_7202 ) ) ( not ( = ?auto_7201 ?auto_7203 ) ) ( not ( = ?auto_7201 ?auto_7204 ) ) ( not ( = ?auto_7202 ?auto_7203 ) ) ( not ( = ?auto_7202 ?auto_7204 ) ) ( not ( = ?auto_7203 ?auto_7204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7204 ?auto_7203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7205 - BLOCK
      ?auto_7206 - BLOCK
      ?auto_7207 - BLOCK
    )
    :vars
    (
      ?auto_7208 - BLOCK
      ?auto_7209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7208 ?auto_7207 ) ( CLEAR ?auto_7208 ) ( ON-TABLE ?auto_7205 ) ( ON ?auto_7206 ?auto_7205 ) ( ON ?auto_7207 ?auto_7206 ) ( not ( = ?auto_7205 ?auto_7206 ) ) ( not ( = ?auto_7205 ?auto_7207 ) ) ( not ( = ?auto_7205 ?auto_7208 ) ) ( not ( = ?auto_7206 ?auto_7207 ) ) ( not ( = ?auto_7206 ?auto_7208 ) ) ( not ( = ?auto_7207 ?auto_7208 ) ) ( HOLDING ?auto_7209 ) ( not ( = ?auto_7205 ?auto_7209 ) ) ( not ( = ?auto_7206 ?auto_7209 ) ) ( not ( = ?auto_7207 ?auto_7209 ) ) ( not ( = ?auto_7208 ?auto_7209 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7209 )
      ( MAKE-3PILE ?auto_7205 ?auto_7206 ?auto_7207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7210 - BLOCK
      ?auto_7211 - BLOCK
      ?auto_7212 - BLOCK
    )
    :vars
    (
      ?auto_7214 - BLOCK
      ?auto_7213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7214 ?auto_7212 ) ( ON-TABLE ?auto_7210 ) ( ON ?auto_7211 ?auto_7210 ) ( ON ?auto_7212 ?auto_7211 ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7212 ) ) ( not ( = ?auto_7210 ?auto_7214 ) ) ( not ( = ?auto_7211 ?auto_7212 ) ) ( not ( = ?auto_7211 ?auto_7214 ) ) ( not ( = ?auto_7212 ?auto_7214 ) ) ( not ( = ?auto_7210 ?auto_7213 ) ) ( not ( = ?auto_7211 ?auto_7213 ) ) ( not ( = ?auto_7212 ?auto_7213 ) ) ( not ( = ?auto_7214 ?auto_7213 ) ) ( ON ?auto_7213 ?auto_7214 ) ( CLEAR ?auto_7213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7210 ?auto_7211 ?auto_7212 ?auto_7214 )
      ( MAKE-3PILE ?auto_7210 ?auto_7211 ?auto_7212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7217 - BLOCK
      ?auto_7218 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7218 ) ( CLEAR ?auto_7217 ) ( ON-TABLE ?auto_7217 ) ( not ( = ?auto_7217 ?auto_7218 ) ) )
    :subtasks
    ( ( !STACK ?auto_7218 ?auto_7217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7219 - BLOCK
      ?auto_7220 - BLOCK
    )
    :vars
    (
      ?auto_7221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7219 ) ( ON-TABLE ?auto_7219 ) ( not ( = ?auto_7219 ?auto_7220 ) ) ( ON ?auto_7220 ?auto_7221 ) ( CLEAR ?auto_7220 ) ( HAND-EMPTY ) ( not ( = ?auto_7219 ?auto_7221 ) ) ( not ( = ?auto_7220 ?auto_7221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7220 ?auto_7221 )
      ( MAKE-2PILE ?auto_7219 ?auto_7220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7222 - BLOCK
      ?auto_7223 - BLOCK
    )
    :vars
    (
      ?auto_7224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7222 ?auto_7223 ) ) ( ON ?auto_7223 ?auto_7224 ) ( CLEAR ?auto_7223 ) ( not ( = ?auto_7222 ?auto_7224 ) ) ( not ( = ?auto_7223 ?auto_7224 ) ) ( HOLDING ?auto_7222 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7222 )
      ( MAKE-2PILE ?auto_7222 ?auto_7223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7225 - BLOCK
      ?auto_7226 - BLOCK
    )
    :vars
    (
      ?auto_7227 - BLOCK
      ?auto_7228 - BLOCK
      ?auto_7229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7225 ?auto_7226 ) ) ( ON ?auto_7226 ?auto_7227 ) ( not ( = ?auto_7225 ?auto_7227 ) ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( ON ?auto_7225 ?auto_7226 ) ( CLEAR ?auto_7225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7228 ) ( ON ?auto_7229 ?auto_7228 ) ( ON ?auto_7227 ?auto_7229 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7228 ?auto_7227 ) ) ( not ( = ?auto_7228 ?auto_7226 ) ) ( not ( = ?auto_7228 ?auto_7225 ) ) ( not ( = ?auto_7229 ?auto_7227 ) ) ( not ( = ?auto_7229 ?auto_7226 ) ) ( not ( = ?auto_7229 ?auto_7225 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7228 ?auto_7229 ?auto_7227 ?auto_7226 )
      ( MAKE-2PILE ?auto_7225 ?auto_7226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7232 - BLOCK
      ?auto_7233 - BLOCK
    )
    :vars
    (
      ?auto_7234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7234 ?auto_7233 ) ( CLEAR ?auto_7234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7232 ) ( ON ?auto_7233 ?auto_7232 ) ( not ( = ?auto_7232 ?auto_7233 ) ) ( not ( = ?auto_7232 ?auto_7234 ) ) ( not ( = ?auto_7233 ?auto_7234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7234 ?auto_7233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7235 - BLOCK
      ?auto_7236 - BLOCK
    )
    :vars
    (
      ?auto_7237 - BLOCK
      ?auto_7238 - BLOCK
      ?auto_7239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7237 ?auto_7236 ) ( CLEAR ?auto_7237 ) ( ON-TABLE ?auto_7235 ) ( ON ?auto_7236 ?auto_7235 ) ( not ( = ?auto_7235 ?auto_7236 ) ) ( not ( = ?auto_7235 ?auto_7237 ) ) ( not ( = ?auto_7236 ?auto_7237 ) ) ( HOLDING ?auto_7238 ) ( CLEAR ?auto_7239 ) ( not ( = ?auto_7235 ?auto_7238 ) ) ( not ( = ?auto_7235 ?auto_7239 ) ) ( not ( = ?auto_7236 ?auto_7238 ) ) ( not ( = ?auto_7236 ?auto_7239 ) ) ( not ( = ?auto_7237 ?auto_7238 ) ) ( not ( = ?auto_7237 ?auto_7239 ) ) ( not ( = ?auto_7238 ?auto_7239 ) ) )
    :subtasks
    ( ( !STACK ?auto_7238 ?auto_7239 )
      ( MAKE-2PILE ?auto_7235 ?auto_7236 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7240 - BLOCK
      ?auto_7241 - BLOCK
    )
    :vars
    (
      ?auto_7242 - BLOCK
      ?auto_7244 - BLOCK
      ?auto_7243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7242 ?auto_7241 ) ( ON-TABLE ?auto_7240 ) ( ON ?auto_7241 ?auto_7240 ) ( not ( = ?auto_7240 ?auto_7241 ) ) ( not ( = ?auto_7240 ?auto_7242 ) ) ( not ( = ?auto_7241 ?auto_7242 ) ) ( CLEAR ?auto_7244 ) ( not ( = ?auto_7240 ?auto_7243 ) ) ( not ( = ?auto_7240 ?auto_7244 ) ) ( not ( = ?auto_7241 ?auto_7243 ) ) ( not ( = ?auto_7241 ?auto_7244 ) ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) ( ON ?auto_7243 ?auto_7242 ) ( CLEAR ?auto_7243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7240 ?auto_7241 ?auto_7242 )
      ( MAKE-2PILE ?auto_7240 ?auto_7241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7245 - BLOCK
      ?auto_7246 - BLOCK
    )
    :vars
    (
      ?auto_7247 - BLOCK
      ?auto_7249 - BLOCK
      ?auto_7248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7247 ?auto_7246 ) ( ON-TABLE ?auto_7245 ) ( ON ?auto_7246 ?auto_7245 ) ( not ( = ?auto_7245 ?auto_7246 ) ) ( not ( = ?auto_7245 ?auto_7247 ) ) ( not ( = ?auto_7246 ?auto_7247 ) ) ( not ( = ?auto_7245 ?auto_7249 ) ) ( not ( = ?auto_7245 ?auto_7248 ) ) ( not ( = ?auto_7246 ?auto_7249 ) ) ( not ( = ?auto_7246 ?auto_7248 ) ) ( not ( = ?auto_7247 ?auto_7249 ) ) ( not ( = ?auto_7247 ?auto_7248 ) ) ( not ( = ?auto_7249 ?auto_7248 ) ) ( ON ?auto_7249 ?auto_7247 ) ( CLEAR ?auto_7249 ) ( HOLDING ?auto_7248 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7248 )
      ( MAKE-2PILE ?auto_7245 ?auto_7246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7250 - BLOCK
      ?auto_7251 - BLOCK
    )
    :vars
    (
      ?auto_7253 - BLOCK
      ?auto_7254 - BLOCK
      ?auto_7252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7253 ?auto_7251 ) ( ON-TABLE ?auto_7250 ) ( ON ?auto_7251 ?auto_7250 ) ( not ( = ?auto_7250 ?auto_7251 ) ) ( not ( = ?auto_7250 ?auto_7253 ) ) ( not ( = ?auto_7251 ?auto_7253 ) ) ( not ( = ?auto_7250 ?auto_7254 ) ) ( not ( = ?auto_7250 ?auto_7252 ) ) ( not ( = ?auto_7251 ?auto_7254 ) ) ( not ( = ?auto_7251 ?auto_7252 ) ) ( not ( = ?auto_7253 ?auto_7254 ) ) ( not ( = ?auto_7253 ?auto_7252 ) ) ( not ( = ?auto_7254 ?auto_7252 ) ) ( ON ?auto_7254 ?auto_7253 ) ( ON ?auto_7252 ?auto_7254 ) ( CLEAR ?auto_7252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7250 ?auto_7251 ?auto_7253 ?auto_7254 )
      ( MAKE-2PILE ?auto_7250 ?auto_7251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7258 - BLOCK
      ?auto_7259 - BLOCK
      ?auto_7260 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7260 ) ( CLEAR ?auto_7259 ) ( ON-TABLE ?auto_7258 ) ( ON ?auto_7259 ?auto_7258 ) ( not ( = ?auto_7258 ?auto_7259 ) ) ( not ( = ?auto_7258 ?auto_7260 ) ) ( not ( = ?auto_7259 ?auto_7260 ) ) )
    :subtasks
    ( ( !STACK ?auto_7260 ?auto_7259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7261 - BLOCK
      ?auto_7262 - BLOCK
      ?auto_7263 - BLOCK
    )
    :vars
    (
      ?auto_7264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7262 ) ( ON-TABLE ?auto_7261 ) ( ON ?auto_7262 ?auto_7261 ) ( not ( = ?auto_7261 ?auto_7262 ) ) ( not ( = ?auto_7261 ?auto_7263 ) ) ( not ( = ?auto_7262 ?auto_7263 ) ) ( ON ?auto_7263 ?auto_7264 ) ( CLEAR ?auto_7263 ) ( HAND-EMPTY ) ( not ( = ?auto_7261 ?auto_7264 ) ) ( not ( = ?auto_7262 ?auto_7264 ) ) ( not ( = ?auto_7263 ?auto_7264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7263 ?auto_7264 )
      ( MAKE-3PILE ?auto_7261 ?auto_7262 ?auto_7263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7265 - BLOCK
      ?auto_7266 - BLOCK
      ?auto_7267 - BLOCK
    )
    :vars
    (
      ?auto_7268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7265 ) ( not ( = ?auto_7265 ?auto_7266 ) ) ( not ( = ?auto_7265 ?auto_7267 ) ) ( not ( = ?auto_7266 ?auto_7267 ) ) ( ON ?auto_7267 ?auto_7268 ) ( CLEAR ?auto_7267 ) ( not ( = ?auto_7265 ?auto_7268 ) ) ( not ( = ?auto_7266 ?auto_7268 ) ) ( not ( = ?auto_7267 ?auto_7268 ) ) ( HOLDING ?auto_7266 ) ( CLEAR ?auto_7265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7265 ?auto_7266 )
      ( MAKE-3PILE ?auto_7265 ?auto_7266 ?auto_7267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7269 - BLOCK
      ?auto_7270 - BLOCK
      ?auto_7271 - BLOCK
    )
    :vars
    (
      ?auto_7272 - BLOCK
      ?auto_7273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7269 ) ( not ( = ?auto_7269 ?auto_7270 ) ) ( not ( = ?auto_7269 ?auto_7271 ) ) ( not ( = ?auto_7270 ?auto_7271 ) ) ( ON ?auto_7271 ?auto_7272 ) ( not ( = ?auto_7269 ?auto_7272 ) ) ( not ( = ?auto_7270 ?auto_7272 ) ) ( not ( = ?auto_7271 ?auto_7272 ) ) ( CLEAR ?auto_7269 ) ( ON ?auto_7270 ?auto_7271 ) ( CLEAR ?auto_7270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7273 ) ( ON ?auto_7272 ?auto_7273 ) ( not ( = ?auto_7273 ?auto_7272 ) ) ( not ( = ?auto_7273 ?auto_7271 ) ) ( not ( = ?auto_7273 ?auto_7270 ) ) ( not ( = ?auto_7269 ?auto_7273 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7273 ?auto_7272 ?auto_7271 )
      ( MAKE-3PILE ?auto_7269 ?auto_7270 ?auto_7271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7274 - BLOCK
      ?auto_7275 - BLOCK
      ?auto_7276 - BLOCK
    )
    :vars
    (
      ?auto_7277 - BLOCK
      ?auto_7278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7274 ?auto_7275 ) ) ( not ( = ?auto_7274 ?auto_7276 ) ) ( not ( = ?auto_7275 ?auto_7276 ) ) ( ON ?auto_7276 ?auto_7277 ) ( not ( = ?auto_7274 ?auto_7277 ) ) ( not ( = ?auto_7275 ?auto_7277 ) ) ( not ( = ?auto_7276 ?auto_7277 ) ) ( ON ?auto_7275 ?auto_7276 ) ( CLEAR ?auto_7275 ) ( ON-TABLE ?auto_7278 ) ( ON ?auto_7277 ?auto_7278 ) ( not ( = ?auto_7278 ?auto_7277 ) ) ( not ( = ?auto_7278 ?auto_7276 ) ) ( not ( = ?auto_7278 ?auto_7275 ) ) ( not ( = ?auto_7274 ?auto_7278 ) ) ( HOLDING ?auto_7274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7274 )
      ( MAKE-3PILE ?auto_7274 ?auto_7275 ?auto_7276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7279 - BLOCK
      ?auto_7280 - BLOCK
      ?auto_7281 - BLOCK
    )
    :vars
    (
      ?auto_7282 - BLOCK
      ?auto_7283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7279 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7281 ) ) ( not ( = ?auto_7280 ?auto_7281 ) ) ( ON ?auto_7281 ?auto_7282 ) ( not ( = ?auto_7279 ?auto_7282 ) ) ( not ( = ?auto_7280 ?auto_7282 ) ) ( not ( = ?auto_7281 ?auto_7282 ) ) ( ON ?auto_7280 ?auto_7281 ) ( ON-TABLE ?auto_7283 ) ( ON ?auto_7282 ?auto_7283 ) ( not ( = ?auto_7283 ?auto_7282 ) ) ( not ( = ?auto_7283 ?auto_7281 ) ) ( not ( = ?auto_7283 ?auto_7280 ) ) ( not ( = ?auto_7279 ?auto_7283 ) ) ( ON ?auto_7279 ?auto_7280 ) ( CLEAR ?auto_7279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7283 ?auto_7282 ?auto_7281 ?auto_7280 )
      ( MAKE-3PILE ?auto_7279 ?auto_7280 ?auto_7281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7285 - BLOCK
    )
    :vars
    (
      ?auto_7286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7286 ?auto_7285 ) ( CLEAR ?auto_7286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7285 ) ( not ( = ?auto_7285 ?auto_7286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7286 ?auto_7285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7287 - BLOCK
    )
    :vars
    (
      ?auto_7288 - BLOCK
      ?auto_7289 - BLOCK
      ?auto_7290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7288 ?auto_7287 ) ( CLEAR ?auto_7288 ) ( ON-TABLE ?auto_7287 ) ( not ( = ?auto_7287 ?auto_7288 ) ) ( HOLDING ?auto_7289 ) ( CLEAR ?auto_7290 ) ( not ( = ?auto_7287 ?auto_7289 ) ) ( not ( = ?auto_7287 ?auto_7290 ) ) ( not ( = ?auto_7288 ?auto_7289 ) ) ( not ( = ?auto_7288 ?auto_7290 ) ) ( not ( = ?auto_7289 ?auto_7290 ) ) )
    :subtasks
    ( ( !STACK ?auto_7289 ?auto_7290 )
      ( MAKE-1PILE ?auto_7287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7291 - BLOCK
    )
    :vars
    (
      ?auto_7294 - BLOCK
      ?auto_7293 - BLOCK
      ?auto_7292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7294 ?auto_7291 ) ( ON-TABLE ?auto_7291 ) ( not ( = ?auto_7291 ?auto_7294 ) ) ( CLEAR ?auto_7293 ) ( not ( = ?auto_7291 ?auto_7292 ) ) ( not ( = ?auto_7291 ?auto_7293 ) ) ( not ( = ?auto_7294 ?auto_7292 ) ) ( not ( = ?auto_7294 ?auto_7293 ) ) ( not ( = ?auto_7292 ?auto_7293 ) ) ( ON ?auto_7292 ?auto_7294 ) ( CLEAR ?auto_7292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7291 ?auto_7294 )
      ( MAKE-1PILE ?auto_7291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7295 - BLOCK
    )
    :vars
    (
      ?auto_7298 - BLOCK
      ?auto_7296 - BLOCK
      ?auto_7297 - BLOCK
      ?auto_7299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7298 ?auto_7295 ) ( ON-TABLE ?auto_7295 ) ( not ( = ?auto_7295 ?auto_7298 ) ) ( not ( = ?auto_7295 ?auto_7296 ) ) ( not ( = ?auto_7295 ?auto_7297 ) ) ( not ( = ?auto_7298 ?auto_7296 ) ) ( not ( = ?auto_7298 ?auto_7297 ) ) ( not ( = ?auto_7296 ?auto_7297 ) ) ( ON ?auto_7296 ?auto_7298 ) ( CLEAR ?auto_7296 ) ( HOLDING ?auto_7297 ) ( CLEAR ?auto_7299 ) ( ON-TABLE ?auto_7299 ) ( not ( = ?auto_7299 ?auto_7297 ) ) ( not ( = ?auto_7295 ?auto_7299 ) ) ( not ( = ?auto_7298 ?auto_7299 ) ) ( not ( = ?auto_7296 ?auto_7299 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7299 ?auto_7297 )
      ( MAKE-1PILE ?auto_7295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7300 - BLOCK
    )
    :vars
    (
      ?auto_7303 - BLOCK
      ?auto_7304 - BLOCK
      ?auto_7301 - BLOCK
      ?auto_7302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7303 ?auto_7300 ) ( ON-TABLE ?auto_7300 ) ( not ( = ?auto_7300 ?auto_7303 ) ) ( not ( = ?auto_7300 ?auto_7304 ) ) ( not ( = ?auto_7300 ?auto_7301 ) ) ( not ( = ?auto_7303 ?auto_7304 ) ) ( not ( = ?auto_7303 ?auto_7301 ) ) ( not ( = ?auto_7304 ?auto_7301 ) ) ( ON ?auto_7304 ?auto_7303 ) ( CLEAR ?auto_7302 ) ( ON-TABLE ?auto_7302 ) ( not ( = ?auto_7302 ?auto_7301 ) ) ( not ( = ?auto_7300 ?auto_7302 ) ) ( not ( = ?auto_7303 ?auto_7302 ) ) ( not ( = ?auto_7304 ?auto_7302 ) ) ( ON ?auto_7301 ?auto_7304 ) ( CLEAR ?auto_7301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7300 ?auto_7303 ?auto_7304 )
      ( MAKE-1PILE ?auto_7300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7305 - BLOCK
    )
    :vars
    (
      ?auto_7306 - BLOCK
      ?auto_7308 - BLOCK
      ?auto_7307 - BLOCK
      ?auto_7309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7306 ?auto_7305 ) ( ON-TABLE ?auto_7305 ) ( not ( = ?auto_7305 ?auto_7306 ) ) ( not ( = ?auto_7305 ?auto_7308 ) ) ( not ( = ?auto_7305 ?auto_7307 ) ) ( not ( = ?auto_7306 ?auto_7308 ) ) ( not ( = ?auto_7306 ?auto_7307 ) ) ( not ( = ?auto_7308 ?auto_7307 ) ) ( ON ?auto_7308 ?auto_7306 ) ( not ( = ?auto_7309 ?auto_7307 ) ) ( not ( = ?auto_7305 ?auto_7309 ) ) ( not ( = ?auto_7306 ?auto_7309 ) ) ( not ( = ?auto_7308 ?auto_7309 ) ) ( ON ?auto_7307 ?auto_7308 ) ( CLEAR ?auto_7307 ) ( HOLDING ?auto_7309 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7309 )
      ( MAKE-1PILE ?auto_7305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7310 - BLOCK
    )
    :vars
    (
      ?auto_7314 - BLOCK
      ?auto_7312 - BLOCK
      ?auto_7311 - BLOCK
      ?auto_7313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7314 ?auto_7310 ) ( ON-TABLE ?auto_7310 ) ( not ( = ?auto_7310 ?auto_7314 ) ) ( not ( = ?auto_7310 ?auto_7312 ) ) ( not ( = ?auto_7310 ?auto_7311 ) ) ( not ( = ?auto_7314 ?auto_7312 ) ) ( not ( = ?auto_7314 ?auto_7311 ) ) ( not ( = ?auto_7312 ?auto_7311 ) ) ( ON ?auto_7312 ?auto_7314 ) ( not ( = ?auto_7313 ?auto_7311 ) ) ( not ( = ?auto_7310 ?auto_7313 ) ) ( not ( = ?auto_7314 ?auto_7313 ) ) ( not ( = ?auto_7312 ?auto_7313 ) ) ( ON ?auto_7311 ?auto_7312 ) ( ON ?auto_7313 ?auto_7311 ) ( CLEAR ?auto_7313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7310 ?auto_7314 ?auto_7312 ?auto_7311 )
      ( MAKE-1PILE ?auto_7310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7319 - BLOCK
      ?auto_7320 - BLOCK
      ?auto_7321 - BLOCK
      ?auto_7322 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7322 ) ( CLEAR ?auto_7321 ) ( ON-TABLE ?auto_7319 ) ( ON ?auto_7320 ?auto_7319 ) ( ON ?auto_7321 ?auto_7320 ) ( not ( = ?auto_7319 ?auto_7320 ) ) ( not ( = ?auto_7319 ?auto_7321 ) ) ( not ( = ?auto_7319 ?auto_7322 ) ) ( not ( = ?auto_7320 ?auto_7321 ) ) ( not ( = ?auto_7320 ?auto_7322 ) ) ( not ( = ?auto_7321 ?auto_7322 ) ) )
    :subtasks
    ( ( !STACK ?auto_7322 ?auto_7321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7323 - BLOCK
      ?auto_7324 - BLOCK
      ?auto_7325 - BLOCK
      ?auto_7326 - BLOCK
    )
    :vars
    (
      ?auto_7327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7325 ) ( ON-TABLE ?auto_7323 ) ( ON ?auto_7324 ?auto_7323 ) ( ON ?auto_7325 ?auto_7324 ) ( not ( = ?auto_7323 ?auto_7324 ) ) ( not ( = ?auto_7323 ?auto_7325 ) ) ( not ( = ?auto_7323 ?auto_7326 ) ) ( not ( = ?auto_7324 ?auto_7325 ) ) ( not ( = ?auto_7324 ?auto_7326 ) ) ( not ( = ?auto_7325 ?auto_7326 ) ) ( ON ?auto_7326 ?auto_7327 ) ( CLEAR ?auto_7326 ) ( HAND-EMPTY ) ( not ( = ?auto_7323 ?auto_7327 ) ) ( not ( = ?auto_7324 ?auto_7327 ) ) ( not ( = ?auto_7325 ?auto_7327 ) ) ( not ( = ?auto_7326 ?auto_7327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7326 ?auto_7327 )
      ( MAKE-4PILE ?auto_7323 ?auto_7324 ?auto_7325 ?auto_7326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7328 - BLOCK
      ?auto_7329 - BLOCK
      ?auto_7330 - BLOCK
      ?auto_7331 - BLOCK
    )
    :vars
    (
      ?auto_7332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7328 ) ( ON ?auto_7329 ?auto_7328 ) ( not ( = ?auto_7328 ?auto_7329 ) ) ( not ( = ?auto_7328 ?auto_7330 ) ) ( not ( = ?auto_7328 ?auto_7331 ) ) ( not ( = ?auto_7329 ?auto_7330 ) ) ( not ( = ?auto_7329 ?auto_7331 ) ) ( not ( = ?auto_7330 ?auto_7331 ) ) ( ON ?auto_7331 ?auto_7332 ) ( CLEAR ?auto_7331 ) ( not ( = ?auto_7328 ?auto_7332 ) ) ( not ( = ?auto_7329 ?auto_7332 ) ) ( not ( = ?auto_7330 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( HOLDING ?auto_7330 ) ( CLEAR ?auto_7329 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7328 ?auto_7329 ?auto_7330 )
      ( MAKE-4PILE ?auto_7328 ?auto_7329 ?auto_7330 ?auto_7331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7333 - BLOCK
      ?auto_7334 - BLOCK
      ?auto_7335 - BLOCK
      ?auto_7336 - BLOCK
    )
    :vars
    (
      ?auto_7337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7333 ) ( ON ?auto_7334 ?auto_7333 ) ( not ( = ?auto_7333 ?auto_7334 ) ) ( not ( = ?auto_7333 ?auto_7335 ) ) ( not ( = ?auto_7333 ?auto_7336 ) ) ( not ( = ?auto_7334 ?auto_7335 ) ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7335 ?auto_7336 ) ) ( ON ?auto_7336 ?auto_7337 ) ( not ( = ?auto_7333 ?auto_7337 ) ) ( not ( = ?auto_7334 ?auto_7337 ) ) ( not ( = ?auto_7335 ?auto_7337 ) ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( CLEAR ?auto_7334 ) ( ON ?auto_7335 ?auto_7336 ) ( CLEAR ?auto_7335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7337 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7337 ?auto_7336 )
      ( MAKE-4PILE ?auto_7333 ?auto_7334 ?auto_7335 ?auto_7336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7338 - BLOCK
      ?auto_7339 - BLOCK
      ?auto_7340 - BLOCK
      ?auto_7341 - BLOCK
    )
    :vars
    (
      ?auto_7342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7338 ) ( not ( = ?auto_7338 ?auto_7339 ) ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7338 ?auto_7341 ) ) ( not ( = ?auto_7339 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7341 ) ) ( not ( = ?auto_7340 ?auto_7341 ) ) ( ON ?auto_7341 ?auto_7342 ) ( not ( = ?auto_7338 ?auto_7342 ) ) ( not ( = ?auto_7339 ?auto_7342 ) ) ( not ( = ?auto_7340 ?auto_7342 ) ) ( not ( = ?auto_7341 ?auto_7342 ) ) ( ON ?auto_7340 ?auto_7341 ) ( CLEAR ?auto_7340 ) ( ON-TABLE ?auto_7342 ) ( HOLDING ?auto_7339 ) ( CLEAR ?auto_7338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7338 ?auto_7339 )
      ( MAKE-4PILE ?auto_7338 ?auto_7339 ?auto_7340 ?auto_7341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7343 - BLOCK
      ?auto_7344 - BLOCK
      ?auto_7345 - BLOCK
      ?auto_7346 - BLOCK
    )
    :vars
    (
      ?auto_7347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7343 ) ( not ( = ?auto_7343 ?auto_7344 ) ) ( not ( = ?auto_7343 ?auto_7345 ) ) ( not ( = ?auto_7343 ?auto_7346 ) ) ( not ( = ?auto_7344 ?auto_7345 ) ) ( not ( = ?auto_7344 ?auto_7346 ) ) ( not ( = ?auto_7345 ?auto_7346 ) ) ( ON ?auto_7346 ?auto_7347 ) ( not ( = ?auto_7343 ?auto_7347 ) ) ( not ( = ?auto_7344 ?auto_7347 ) ) ( not ( = ?auto_7345 ?auto_7347 ) ) ( not ( = ?auto_7346 ?auto_7347 ) ) ( ON ?auto_7345 ?auto_7346 ) ( ON-TABLE ?auto_7347 ) ( CLEAR ?auto_7343 ) ( ON ?auto_7344 ?auto_7345 ) ( CLEAR ?auto_7344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7347 ?auto_7346 ?auto_7345 )
      ( MAKE-4PILE ?auto_7343 ?auto_7344 ?auto_7345 ?auto_7346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7348 - BLOCK
      ?auto_7349 - BLOCK
      ?auto_7350 - BLOCK
      ?auto_7351 - BLOCK
    )
    :vars
    (
      ?auto_7352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7348 ?auto_7349 ) ) ( not ( = ?auto_7348 ?auto_7350 ) ) ( not ( = ?auto_7348 ?auto_7351 ) ) ( not ( = ?auto_7349 ?auto_7350 ) ) ( not ( = ?auto_7349 ?auto_7351 ) ) ( not ( = ?auto_7350 ?auto_7351 ) ) ( ON ?auto_7351 ?auto_7352 ) ( not ( = ?auto_7348 ?auto_7352 ) ) ( not ( = ?auto_7349 ?auto_7352 ) ) ( not ( = ?auto_7350 ?auto_7352 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( ON ?auto_7350 ?auto_7351 ) ( ON-TABLE ?auto_7352 ) ( ON ?auto_7349 ?auto_7350 ) ( CLEAR ?auto_7349 ) ( HOLDING ?auto_7348 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7348 )
      ( MAKE-4PILE ?auto_7348 ?auto_7349 ?auto_7350 ?auto_7351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7353 - BLOCK
      ?auto_7354 - BLOCK
      ?auto_7355 - BLOCK
      ?auto_7356 - BLOCK
    )
    :vars
    (
      ?auto_7357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7353 ?auto_7354 ) ) ( not ( = ?auto_7353 ?auto_7355 ) ) ( not ( = ?auto_7353 ?auto_7356 ) ) ( not ( = ?auto_7354 ?auto_7355 ) ) ( not ( = ?auto_7354 ?auto_7356 ) ) ( not ( = ?auto_7355 ?auto_7356 ) ) ( ON ?auto_7356 ?auto_7357 ) ( not ( = ?auto_7353 ?auto_7357 ) ) ( not ( = ?auto_7354 ?auto_7357 ) ) ( not ( = ?auto_7355 ?auto_7357 ) ) ( not ( = ?auto_7356 ?auto_7357 ) ) ( ON ?auto_7355 ?auto_7356 ) ( ON-TABLE ?auto_7357 ) ( ON ?auto_7354 ?auto_7355 ) ( ON ?auto_7353 ?auto_7354 ) ( CLEAR ?auto_7353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7357 ?auto_7356 ?auto_7355 ?auto_7354 )
      ( MAKE-4PILE ?auto_7353 ?auto_7354 ?auto_7355 ?auto_7356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7361 - BLOCK
      ?auto_7362 - BLOCK
      ?auto_7363 - BLOCK
    )
    :vars
    (
      ?auto_7364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7364 ?auto_7363 ) ( CLEAR ?auto_7364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7361 ) ( ON ?auto_7362 ?auto_7361 ) ( ON ?auto_7363 ?auto_7362 ) ( not ( = ?auto_7361 ?auto_7362 ) ) ( not ( = ?auto_7361 ?auto_7363 ) ) ( not ( = ?auto_7361 ?auto_7364 ) ) ( not ( = ?auto_7362 ?auto_7363 ) ) ( not ( = ?auto_7362 ?auto_7364 ) ) ( not ( = ?auto_7363 ?auto_7364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7364 ?auto_7363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7374 - BLOCK
      ?auto_7375 - BLOCK
      ?auto_7376 - BLOCK
    )
    :vars
    (
      ?auto_7377 - BLOCK
      ?auto_7378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7374 ) ( ON ?auto_7375 ?auto_7374 ) ( not ( = ?auto_7374 ?auto_7375 ) ) ( not ( = ?auto_7374 ?auto_7376 ) ) ( not ( = ?auto_7374 ?auto_7377 ) ) ( not ( = ?auto_7375 ?auto_7376 ) ) ( not ( = ?auto_7375 ?auto_7377 ) ) ( not ( = ?auto_7376 ?auto_7377 ) ) ( ON ?auto_7377 ?auto_7378 ) ( CLEAR ?auto_7377 ) ( not ( = ?auto_7374 ?auto_7378 ) ) ( not ( = ?auto_7375 ?auto_7378 ) ) ( not ( = ?auto_7376 ?auto_7378 ) ) ( not ( = ?auto_7377 ?auto_7378 ) ) ( HOLDING ?auto_7376 ) ( CLEAR ?auto_7375 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7374 ?auto_7375 ?auto_7376 ?auto_7377 )
      ( MAKE-3PILE ?auto_7374 ?auto_7375 ?auto_7376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7379 - BLOCK
      ?auto_7380 - BLOCK
      ?auto_7381 - BLOCK
    )
    :vars
    (
      ?auto_7383 - BLOCK
      ?auto_7382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7379 ) ( ON ?auto_7380 ?auto_7379 ) ( not ( = ?auto_7379 ?auto_7380 ) ) ( not ( = ?auto_7379 ?auto_7381 ) ) ( not ( = ?auto_7379 ?auto_7383 ) ) ( not ( = ?auto_7380 ?auto_7381 ) ) ( not ( = ?auto_7380 ?auto_7383 ) ) ( not ( = ?auto_7381 ?auto_7383 ) ) ( ON ?auto_7383 ?auto_7382 ) ( not ( = ?auto_7379 ?auto_7382 ) ) ( not ( = ?auto_7380 ?auto_7382 ) ) ( not ( = ?auto_7381 ?auto_7382 ) ) ( not ( = ?auto_7383 ?auto_7382 ) ) ( CLEAR ?auto_7380 ) ( ON ?auto_7381 ?auto_7383 ) ( CLEAR ?auto_7381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7382 ?auto_7383 )
      ( MAKE-3PILE ?auto_7379 ?auto_7380 ?auto_7381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7384 - BLOCK
      ?auto_7385 - BLOCK
      ?auto_7386 - BLOCK
    )
    :vars
    (
      ?auto_7388 - BLOCK
      ?auto_7387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7384 ) ( not ( = ?auto_7384 ?auto_7385 ) ) ( not ( = ?auto_7384 ?auto_7386 ) ) ( not ( = ?auto_7384 ?auto_7388 ) ) ( not ( = ?auto_7385 ?auto_7386 ) ) ( not ( = ?auto_7385 ?auto_7388 ) ) ( not ( = ?auto_7386 ?auto_7388 ) ) ( ON ?auto_7388 ?auto_7387 ) ( not ( = ?auto_7384 ?auto_7387 ) ) ( not ( = ?auto_7385 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7388 ?auto_7387 ) ) ( ON ?auto_7386 ?auto_7388 ) ( CLEAR ?auto_7386 ) ( ON-TABLE ?auto_7387 ) ( HOLDING ?auto_7385 ) ( CLEAR ?auto_7384 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7384 ?auto_7385 )
      ( MAKE-3PILE ?auto_7384 ?auto_7385 ?auto_7386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7389 - BLOCK
      ?auto_7390 - BLOCK
      ?auto_7391 - BLOCK
    )
    :vars
    (
      ?auto_7392 - BLOCK
      ?auto_7393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7389 ) ( not ( = ?auto_7389 ?auto_7390 ) ) ( not ( = ?auto_7389 ?auto_7391 ) ) ( not ( = ?auto_7389 ?auto_7392 ) ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( not ( = ?auto_7390 ?auto_7392 ) ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( ON ?auto_7392 ?auto_7393 ) ( not ( = ?auto_7389 ?auto_7393 ) ) ( not ( = ?auto_7390 ?auto_7393 ) ) ( not ( = ?auto_7391 ?auto_7393 ) ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( ON ?auto_7391 ?auto_7392 ) ( ON-TABLE ?auto_7393 ) ( CLEAR ?auto_7389 ) ( ON ?auto_7390 ?auto_7391 ) ( CLEAR ?auto_7390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7393 ?auto_7392 ?auto_7391 )
      ( MAKE-3PILE ?auto_7389 ?auto_7390 ?auto_7391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7394 - BLOCK
      ?auto_7395 - BLOCK
      ?auto_7396 - BLOCK
    )
    :vars
    (
      ?auto_7397 - BLOCK
      ?auto_7398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7394 ?auto_7395 ) ) ( not ( = ?auto_7394 ?auto_7396 ) ) ( not ( = ?auto_7394 ?auto_7397 ) ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7397 ) ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( ON ?auto_7397 ?auto_7398 ) ( not ( = ?auto_7394 ?auto_7398 ) ) ( not ( = ?auto_7395 ?auto_7398 ) ) ( not ( = ?auto_7396 ?auto_7398 ) ) ( not ( = ?auto_7397 ?auto_7398 ) ) ( ON ?auto_7396 ?auto_7397 ) ( ON-TABLE ?auto_7398 ) ( ON ?auto_7395 ?auto_7396 ) ( CLEAR ?auto_7395 ) ( HOLDING ?auto_7394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7394 )
      ( MAKE-3PILE ?auto_7394 ?auto_7395 ?auto_7396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7399 - BLOCK
      ?auto_7400 - BLOCK
      ?auto_7401 - BLOCK
    )
    :vars
    (
      ?auto_7403 - BLOCK
      ?auto_7402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7399 ?auto_7400 ) ) ( not ( = ?auto_7399 ?auto_7401 ) ) ( not ( = ?auto_7399 ?auto_7403 ) ) ( not ( = ?auto_7400 ?auto_7401 ) ) ( not ( = ?auto_7400 ?auto_7403 ) ) ( not ( = ?auto_7401 ?auto_7403 ) ) ( ON ?auto_7403 ?auto_7402 ) ( not ( = ?auto_7399 ?auto_7402 ) ) ( not ( = ?auto_7400 ?auto_7402 ) ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( not ( = ?auto_7403 ?auto_7402 ) ) ( ON ?auto_7401 ?auto_7403 ) ( ON-TABLE ?auto_7402 ) ( ON ?auto_7400 ?auto_7401 ) ( ON ?auto_7399 ?auto_7400 ) ( CLEAR ?auto_7399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7402 ?auto_7403 ?auto_7401 ?auto_7400 )
      ( MAKE-3PILE ?auto_7399 ?auto_7400 ?auto_7401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7405 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7405 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7406 - BLOCK
    )
    :vars
    (
      ?auto_7407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7406 ?auto_7407 ) ( CLEAR ?auto_7406 ) ( HAND-EMPTY ) ( not ( = ?auto_7406 ?auto_7407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7406 ?auto_7407 )
      ( MAKE-1PILE ?auto_7406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7408 - BLOCK
    )
    :vars
    (
      ?auto_7409 - BLOCK
      ?auto_7410 - BLOCK
      ?auto_7411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7408 ?auto_7409 ) ) ( HOLDING ?auto_7408 ) ( CLEAR ?auto_7409 ) ( ON-TABLE ?auto_7410 ) ( ON ?auto_7411 ?auto_7410 ) ( ON ?auto_7409 ?auto_7411 ) ( not ( = ?auto_7410 ?auto_7411 ) ) ( not ( = ?auto_7410 ?auto_7409 ) ) ( not ( = ?auto_7410 ?auto_7408 ) ) ( not ( = ?auto_7411 ?auto_7409 ) ) ( not ( = ?auto_7411 ?auto_7408 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7410 ?auto_7411 ?auto_7409 ?auto_7408 )
      ( MAKE-1PILE ?auto_7408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7412 - BLOCK
    )
    :vars
    (
      ?auto_7413 - BLOCK
      ?auto_7414 - BLOCK
      ?auto_7415 - BLOCK
      ?auto_7416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7412 ?auto_7413 ) ) ( CLEAR ?auto_7413 ) ( ON-TABLE ?auto_7414 ) ( ON ?auto_7415 ?auto_7414 ) ( ON ?auto_7413 ?auto_7415 ) ( not ( = ?auto_7414 ?auto_7415 ) ) ( not ( = ?auto_7414 ?auto_7413 ) ) ( not ( = ?auto_7414 ?auto_7412 ) ) ( not ( = ?auto_7415 ?auto_7413 ) ) ( not ( = ?auto_7415 ?auto_7412 ) ) ( ON ?auto_7412 ?auto_7416 ) ( CLEAR ?auto_7412 ) ( HAND-EMPTY ) ( not ( = ?auto_7412 ?auto_7416 ) ) ( not ( = ?auto_7413 ?auto_7416 ) ) ( not ( = ?auto_7414 ?auto_7416 ) ) ( not ( = ?auto_7415 ?auto_7416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7412 ?auto_7416 )
      ( MAKE-1PILE ?auto_7412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7417 - BLOCK
    )
    :vars
    (
      ?auto_7418 - BLOCK
      ?auto_7419 - BLOCK
      ?auto_7421 - BLOCK
      ?auto_7420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7417 ?auto_7418 ) ) ( ON-TABLE ?auto_7419 ) ( ON ?auto_7421 ?auto_7419 ) ( not ( = ?auto_7419 ?auto_7421 ) ) ( not ( = ?auto_7419 ?auto_7418 ) ) ( not ( = ?auto_7419 ?auto_7417 ) ) ( not ( = ?auto_7421 ?auto_7418 ) ) ( not ( = ?auto_7421 ?auto_7417 ) ) ( ON ?auto_7417 ?auto_7420 ) ( CLEAR ?auto_7417 ) ( not ( = ?auto_7417 ?auto_7420 ) ) ( not ( = ?auto_7418 ?auto_7420 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( not ( = ?auto_7421 ?auto_7420 ) ) ( HOLDING ?auto_7418 ) ( CLEAR ?auto_7421 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7419 ?auto_7421 ?auto_7418 )
      ( MAKE-1PILE ?auto_7417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7422 - BLOCK
    )
    :vars
    (
      ?auto_7423 - BLOCK
      ?auto_7426 - BLOCK
      ?auto_7424 - BLOCK
      ?auto_7425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7422 ?auto_7423 ) ) ( ON-TABLE ?auto_7426 ) ( ON ?auto_7424 ?auto_7426 ) ( not ( = ?auto_7426 ?auto_7424 ) ) ( not ( = ?auto_7426 ?auto_7423 ) ) ( not ( = ?auto_7426 ?auto_7422 ) ) ( not ( = ?auto_7424 ?auto_7423 ) ) ( not ( = ?auto_7424 ?auto_7422 ) ) ( ON ?auto_7422 ?auto_7425 ) ( not ( = ?auto_7422 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7426 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( CLEAR ?auto_7424 ) ( ON ?auto_7423 ?auto_7422 ) ( CLEAR ?auto_7423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7425 ?auto_7422 )
      ( MAKE-1PILE ?auto_7422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7427 - BLOCK
    )
    :vars
    (
      ?auto_7431 - BLOCK
      ?auto_7428 - BLOCK
      ?auto_7429 - BLOCK
      ?auto_7430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7427 ?auto_7431 ) ) ( ON-TABLE ?auto_7428 ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( not ( = ?auto_7428 ?auto_7431 ) ) ( not ( = ?auto_7428 ?auto_7427 ) ) ( not ( = ?auto_7429 ?auto_7431 ) ) ( not ( = ?auto_7429 ?auto_7427 ) ) ( ON ?auto_7427 ?auto_7430 ) ( not ( = ?auto_7427 ?auto_7430 ) ) ( not ( = ?auto_7431 ?auto_7430 ) ) ( not ( = ?auto_7428 ?auto_7430 ) ) ( not ( = ?auto_7429 ?auto_7430 ) ) ( ON ?auto_7431 ?auto_7427 ) ( CLEAR ?auto_7431 ) ( ON-TABLE ?auto_7430 ) ( HOLDING ?auto_7429 ) ( CLEAR ?auto_7428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7428 ?auto_7429 )
      ( MAKE-1PILE ?auto_7427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7432 - BLOCK
    )
    :vars
    (
      ?auto_7434 - BLOCK
      ?auto_7433 - BLOCK
      ?auto_7435 - BLOCK
      ?auto_7436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7432 ?auto_7434 ) ) ( ON-TABLE ?auto_7433 ) ( not ( = ?auto_7433 ?auto_7435 ) ) ( not ( = ?auto_7433 ?auto_7434 ) ) ( not ( = ?auto_7433 ?auto_7432 ) ) ( not ( = ?auto_7435 ?auto_7434 ) ) ( not ( = ?auto_7435 ?auto_7432 ) ) ( ON ?auto_7432 ?auto_7436 ) ( not ( = ?auto_7432 ?auto_7436 ) ) ( not ( = ?auto_7434 ?auto_7436 ) ) ( not ( = ?auto_7433 ?auto_7436 ) ) ( not ( = ?auto_7435 ?auto_7436 ) ) ( ON ?auto_7434 ?auto_7432 ) ( ON-TABLE ?auto_7436 ) ( CLEAR ?auto_7433 ) ( ON ?auto_7435 ?auto_7434 ) ( CLEAR ?auto_7435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7436 ?auto_7432 ?auto_7434 )
      ( MAKE-1PILE ?auto_7432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7437 - BLOCK
    )
    :vars
    (
      ?auto_7440 - BLOCK
      ?auto_7439 - BLOCK
      ?auto_7438 - BLOCK
      ?auto_7441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7437 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7438 ) ) ( not ( = ?auto_7439 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7437 ) ) ( not ( = ?auto_7438 ?auto_7440 ) ) ( not ( = ?auto_7438 ?auto_7437 ) ) ( ON ?auto_7437 ?auto_7441 ) ( not ( = ?auto_7437 ?auto_7441 ) ) ( not ( = ?auto_7440 ?auto_7441 ) ) ( not ( = ?auto_7439 ?auto_7441 ) ) ( not ( = ?auto_7438 ?auto_7441 ) ) ( ON ?auto_7440 ?auto_7437 ) ( ON-TABLE ?auto_7441 ) ( ON ?auto_7438 ?auto_7440 ) ( CLEAR ?auto_7438 ) ( HOLDING ?auto_7439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7439 )
      ( MAKE-1PILE ?auto_7437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7442 - BLOCK
    )
    :vars
    (
      ?auto_7443 - BLOCK
      ?auto_7445 - BLOCK
      ?auto_7446 - BLOCK
      ?auto_7444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7442 ?auto_7443 ) ) ( not ( = ?auto_7445 ?auto_7446 ) ) ( not ( = ?auto_7445 ?auto_7443 ) ) ( not ( = ?auto_7445 ?auto_7442 ) ) ( not ( = ?auto_7446 ?auto_7443 ) ) ( not ( = ?auto_7446 ?auto_7442 ) ) ( ON ?auto_7442 ?auto_7444 ) ( not ( = ?auto_7442 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( not ( = ?auto_7445 ?auto_7444 ) ) ( not ( = ?auto_7446 ?auto_7444 ) ) ( ON ?auto_7443 ?auto_7442 ) ( ON-TABLE ?auto_7444 ) ( ON ?auto_7446 ?auto_7443 ) ( ON ?auto_7445 ?auto_7446 ) ( CLEAR ?auto_7445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7444 ?auto_7442 ?auto_7443 ?auto_7446 )
      ( MAKE-1PILE ?auto_7442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7449 - BLOCK
      ?auto_7450 - BLOCK
    )
    :vars
    (
      ?auto_7451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7451 ?auto_7450 ) ( CLEAR ?auto_7451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7449 ) ( ON ?auto_7450 ?auto_7449 ) ( not ( = ?auto_7449 ?auto_7450 ) ) ( not ( = ?auto_7449 ?auto_7451 ) ) ( not ( = ?auto_7450 ?auto_7451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7451 ?auto_7450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7452 - BLOCK
      ?auto_7453 - BLOCK
    )
    :vars
    (
      ?auto_7454 - BLOCK
      ?auto_7455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7454 ?auto_7453 ) ( CLEAR ?auto_7454 ) ( ON-TABLE ?auto_7452 ) ( ON ?auto_7453 ?auto_7452 ) ( not ( = ?auto_7452 ?auto_7453 ) ) ( not ( = ?auto_7452 ?auto_7454 ) ) ( not ( = ?auto_7453 ?auto_7454 ) ) ( HOLDING ?auto_7455 ) ( not ( = ?auto_7452 ?auto_7455 ) ) ( not ( = ?auto_7453 ?auto_7455 ) ) ( not ( = ?auto_7454 ?auto_7455 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7455 )
      ( MAKE-2PILE ?auto_7452 ?auto_7453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7456 - BLOCK
      ?auto_7457 - BLOCK
    )
    :vars
    (
      ?auto_7459 - BLOCK
      ?auto_7458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7459 ?auto_7457 ) ( ON-TABLE ?auto_7456 ) ( ON ?auto_7457 ?auto_7456 ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7456 ?auto_7459 ) ) ( not ( = ?auto_7457 ?auto_7459 ) ) ( not ( = ?auto_7456 ?auto_7458 ) ) ( not ( = ?auto_7457 ?auto_7458 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( ON ?auto_7458 ?auto_7459 ) ( CLEAR ?auto_7458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7456 ?auto_7457 ?auto_7459 )
      ( MAKE-2PILE ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7460 - BLOCK
      ?auto_7461 - BLOCK
    )
    :vars
    (
      ?auto_7463 - BLOCK
      ?auto_7462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7463 ?auto_7461 ) ( ON-TABLE ?auto_7460 ) ( ON ?auto_7461 ?auto_7460 ) ( not ( = ?auto_7460 ?auto_7461 ) ) ( not ( = ?auto_7460 ?auto_7463 ) ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( not ( = ?auto_7460 ?auto_7462 ) ) ( not ( = ?auto_7461 ?auto_7462 ) ) ( not ( = ?auto_7463 ?auto_7462 ) ) ( HOLDING ?auto_7462 ) ( CLEAR ?auto_7463 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7460 ?auto_7461 ?auto_7463 ?auto_7462 )
      ( MAKE-2PILE ?auto_7460 ?auto_7461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7464 - BLOCK
      ?auto_7465 - BLOCK
    )
    :vars
    (
      ?auto_7467 - BLOCK
      ?auto_7466 - BLOCK
      ?auto_7468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7467 ?auto_7465 ) ( ON-TABLE ?auto_7464 ) ( ON ?auto_7465 ?auto_7464 ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7467 ) ) ( not ( = ?auto_7465 ?auto_7467 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( not ( = ?auto_7465 ?auto_7466 ) ) ( not ( = ?auto_7467 ?auto_7466 ) ) ( CLEAR ?auto_7467 ) ( ON ?auto_7466 ?auto_7468 ) ( CLEAR ?auto_7466 ) ( HAND-EMPTY ) ( not ( = ?auto_7464 ?auto_7468 ) ) ( not ( = ?auto_7465 ?auto_7468 ) ) ( not ( = ?auto_7467 ?auto_7468 ) ) ( not ( = ?auto_7466 ?auto_7468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7466 ?auto_7468 )
      ( MAKE-2PILE ?auto_7464 ?auto_7465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7479 - BLOCK
      ?auto_7480 - BLOCK
    )
    :vars
    (
      ?auto_7483 - BLOCK
      ?auto_7482 - BLOCK
      ?auto_7481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7479 ) ( not ( = ?auto_7479 ?auto_7480 ) ) ( not ( = ?auto_7479 ?auto_7483 ) ) ( not ( = ?auto_7480 ?auto_7483 ) ) ( not ( = ?auto_7479 ?auto_7482 ) ) ( not ( = ?auto_7480 ?auto_7482 ) ) ( not ( = ?auto_7483 ?auto_7482 ) ) ( ON ?auto_7482 ?auto_7481 ) ( not ( = ?auto_7479 ?auto_7481 ) ) ( not ( = ?auto_7480 ?auto_7481 ) ) ( not ( = ?auto_7483 ?auto_7481 ) ) ( not ( = ?auto_7482 ?auto_7481 ) ) ( ON ?auto_7483 ?auto_7482 ) ( CLEAR ?auto_7483 ) ( HOLDING ?auto_7480 ) ( CLEAR ?auto_7479 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7479 ?auto_7480 ?auto_7483 )
      ( MAKE-2PILE ?auto_7479 ?auto_7480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7484 - BLOCK
      ?auto_7485 - BLOCK
    )
    :vars
    (
      ?auto_7488 - BLOCK
      ?auto_7487 - BLOCK
      ?auto_7486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7484 ) ( not ( = ?auto_7484 ?auto_7485 ) ) ( not ( = ?auto_7484 ?auto_7488 ) ) ( not ( = ?auto_7485 ?auto_7488 ) ) ( not ( = ?auto_7484 ?auto_7487 ) ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( not ( = ?auto_7488 ?auto_7487 ) ) ( ON ?auto_7487 ?auto_7486 ) ( not ( = ?auto_7484 ?auto_7486 ) ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7488 ?auto_7486 ) ) ( not ( = ?auto_7487 ?auto_7486 ) ) ( ON ?auto_7488 ?auto_7487 ) ( CLEAR ?auto_7484 ) ( ON ?auto_7485 ?auto_7488 ) ( CLEAR ?auto_7485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7486 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7486 ?auto_7487 ?auto_7488 )
      ( MAKE-2PILE ?auto_7484 ?auto_7485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7489 - BLOCK
      ?auto_7490 - BLOCK
    )
    :vars
    (
      ?auto_7491 - BLOCK
      ?auto_7492 - BLOCK
      ?auto_7493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7489 ?auto_7490 ) ) ( not ( = ?auto_7489 ?auto_7491 ) ) ( not ( = ?auto_7490 ?auto_7491 ) ) ( not ( = ?auto_7489 ?auto_7492 ) ) ( not ( = ?auto_7490 ?auto_7492 ) ) ( not ( = ?auto_7491 ?auto_7492 ) ) ( ON ?auto_7492 ?auto_7493 ) ( not ( = ?auto_7489 ?auto_7493 ) ) ( not ( = ?auto_7490 ?auto_7493 ) ) ( not ( = ?auto_7491 ?auto_7493 ) ) ( not ( = ?auto_7492 ?auto_7493 ) ) ( ON ?auto_7491 ?auto_7492 ) ( ON ?auto_7490 ?auto_7491 ) ( CLEAR ?auto_7490 ) ( ON-TABLE ?auto_7493 ) ( HOLDING ?auto_7489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7489 )
      ( MAKE-2PILE ?auto_7489 ?auto_7490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7494 - BLOCK
      ?auto_7495 - BLOCK
    )
    :vars
    (
      ?auto_7498 - BLOCK
      ?auto_7496 - BLOCK
      ?auto_7497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7494 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7498 ) ) ( not ( = ?auto_7495 ?auto_7498 ) ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( not ( = ?auto_7495 ?auto_7496 ) ) ( not ( = ?auto_7498 ?auto_7496 ) ) ( ON ?auto_7496 ?auto_7497 ) ( not ( = ?auto_7494 ?auto_7497 ) ) ( not ( = ?auto_7495 ?auto_7497 ) ) ( not ( = ?auto_7498 ?auto_7497 ) ) ( not ( = ?auto_7496 ?auto_7497 ) ) ( ON ?auto_7498 ?auto_7496 ) ( ON ?auto_7495 ?auto_7498 ) ( ON-TABLE ?auto_7497 ) ( ON ?auto_7494 ?auto_7495 ) ( CLEAR ?auto_7494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7497 ?auto_7496 ?auto_7498 ?auto_7495 )
      ( MAKE-2PILE ?auto_7494 ?auto_7495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7501 - BLOCK
      ?auto_7502 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7502 ) ( CLEAR ?auto_7501 ) ( ON-TABLE ?auto_7501 ) ( not ( = ?auto_7501 ?auto_7502 ) ) )
    :subtasks
    ( ( !STACK ?auto_7502 ?auto_7501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7503 - BLOCK
      ?auto_7504 - BLOCK
    )
    :vars
    (
      ?auto_7505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7503 ) ( ON-TABLE ?auto_7503 ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( ON ?auto_7504 ?auto_7505 ) ( CLEAR ?auto_7504 ) ( HAND-EMPTY ) ( not ( = ?auto_7503 ?auto_7505 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7504 ?auto_7505 )
      ( MAKE-2PILE ?auto_7503 ?auto_7504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7506 - BLOCK
      ?auto_7507 - BLOCK
    )
    :vars
    (
      ?auto_7508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7506 ?auto_7507 ) ) ( ON ?auto_7507 ?auto_7508 ) ( CLEAR ?auto_7507 ) ( not ( = ?auto_7506 ?auto_7508 ) ) ( not ( = ?auto_7507 ?auto_7508 ) ) ( HOLDING ?auto_7506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7506 )
      ( MAKE-2PILE ?auto_7506 ?auto_7507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7509 - BLOCK
      ?auto_7510 - BLOCK
    )
    :vars
    (
      ?auto_7511 - BLOCK
      ?auto_7512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7509 ?auto_7510 ) ) ( ON ?auto_7510 ?auto_7511 ) ( not ( = ?auto_7509 ?auto_7511 ) ) ( not ( = ?auto_7510 ?auto_7511 ) ) ( ON ?auto_7509 ?auto_7510 ) ( CLEAR ?auto_7509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7512 ) ( ON ?auto_7511 ?auto_7512 ) ( not ( = ?auto_7512 ?auto_7511 ) ) ( not ( = ?auto_7512 ?auto_7510 ) ) ( not ( = ?auto_7512 ?auto_7509 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7512 ?auto_7511 ?auto_7510 )
      ( MAKE-2PILE ?auto_7509 ?auto_7510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7513 - BLOCK
      ?auto_7514 - BLOCK
    )
    :vars
    (
      ?auto_7516 - BLOCK
      ?auto_7515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7513 ?auto_7514 ) ) ( ON ?auto_7514 ?auto_7516 ) ( not ( = ?auto_7513 ?auto_7516 ) ) ( not ( = ?auto_7514 ?auto_7516 ) ) ( ON-TABLE ?auto_7515 ) ( ON ?auto_7516 ?auto_7515 ) ( not ( = ?auto_7515 ?auto_7516 ) ) ( not ( = ?auto_7515 ?auto_7514 ) ) ( not ( = ?auto_7515 ?auto_7513 ) ) ( HOLDING ?auto_7513 ) ( CLEAR ?auto_7514 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7515 ?auto_7516 ?auto_7514 ?auto_7513 )
      ( MAKE-2PILE ?auto_7513 ?auto_7514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7517 - BLOCK
      ?auto_7518 - BLOCK
    )
    :vars
    (
      ?auto_7519 - BLOCK
      ?auto_7520 - BLOCK
      ?auto_7521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7517 ?auto_7518 ) ) ( ON ?auto_7518 ?auto_7519 ) ( not ( = ?auto_7517 ?auto_7519 ) ) ( not ( = ?auto_7518 ?auto_7519 ) ) ( ON-TABLE ?auto_7520 ) ( ON ?auto_7519 ?auto_7520 ) ( not ( = ?auto_7520 ?auto_7519 ) ) ( not ( = ?auto_7520 ?auto_7518 ) ) ( not ( = ?auto_7520 ?auto_7517 ) ) ( CLEAR ?auto_7518 ) ( ON ?auto_7517 ?auto_7521 ) ( CLEAR ?auto_7517 ) ( HAND-EMPTY ) ( not ( = ?auto_7517 ?auto_7521 ) ) ( not ( = ?auto_7518 ?auto_7521 ) ) ( not ( = ?auto_7519 ?auto_7521 ) ) ( not ( = ?auto_7520 ?auto_7521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7517 ?auto_7521 )
      ( MAKE-2PILE ?auto_7517 ?auto_7518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7522 - BLOCK
      ?auto_7523 - BLOCK
    )
    :vars
    (
      ?auto_7526 - BLOCK
      ?auto_7524 - BLOCK
      ?auto_7525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7522 ?auto_7526 ) ) ( not ( = ?auto_7523 ?auto_7526 ) ) ( ON-TABLE ?auto_7524 ) ( ON ?auto_7526 ?auto_7524 ) ( not ( = ?auto_7524 ?auto_7526 ) ) ( not ( = ?auto_7524 ?auto_7523 ) ) ( not ( = ?auto_7524 ?auto_7522 ) ) ( ON ?auto_7522 ?auto_7525 ) ( CLEAR ?auto_7522 ) ( not ( = ?auto_7522 ?auto_7525 ) ) ( not ( = ?auto_7523 ?auto_7525 ) ) ( not ( = ?auto_7526 ?auto_7525 ) ) ( not ( = ?auto_7524 ?auto_7525 ) ) ( HOLDING ?auto_7523 ) ( CLEAR ?auto_7526 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7524 ?auto_7526 ?auto_7523 )
      ( MAKE-2PILE ?auto_7522 ?auto_7523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7527 - BLOCK
      ?auto_7528 - BLOCK
    )
    :vars
    (
      ?auto_7530 - BLOCK
      ?auto_7531 - BLOCK
      ?auto_7529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7527 ?auto_7528 ) ) ( not ( = ?auto_7527 ?auto_7530 ) ) ( not ( = ?auto_7528 ?auto_7530 ) ) ( ON-TABLE ?auto_7531 ) ( ON ?auto_7530 ?auto_7531 ) ( not ( = ?auto_7531 ?auto_7530 ) ) ( not ( = ?auto_7531 ?auto_7528 ) ) ( not ( = ?auto_7531 ?auto_7527 ) ) ( ON ?auto_7527 ?auto_7529 ) ( not ( = ?auto_7527 ?auto_7529 ) ) ( not ( = ?auto_7528 ?auto_7529 ) ) ( not ( = ?auto_7530 ?auto_7529 ) ) ( not ( = ?auto_7531 ?auto_7529 ) ) ( CLEAR ?auto_7530 ) ( ON ?auto_7528 ?auto_7527 ) ( CLEAR ?auto_7528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7529 ?auto_7527 )
      ( MAKE-2PILE ?auto_7527 ?auto_7528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7532 - BLOCK
      ?auto_7533 - BLOCK
    )
    :vars
    (
      ?auto_7536 - BLOCK
      ?auto_7535 - BLOCK
      ?auto_7534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7532 ?auto_7533 ) ) ( not ( = ?auto_7532 ?auto_7536 ) ) ( not ( = ?auto_7533 ?auto_7536 ) ) ( ON-TABLE ?auto_7535 ) ( not ( = ?auto_7535 ?auto_7536 ) ) ( not ( = ?auto_7535 ?auto_7533 ) ) ( not ( = ?auto_7535 ?auto_7532 ) ) ( ON ?auto_7532 ?auto_7534 ) ( not ( = ?auto_7532 ?auto_7534 ) ) ( not ( = ?auto_7533 ?auto_7534 ) ) ( not ( = ?auto_7536 ?auto_7534 ) ) ( not ( = ?auto_7535 ?auto_7534 ) ) ( ON ?auto_7533 ?auto_7532 ) ( CLEAR ?auto_7533 ) ( ON-TABLE ?auto_7534 ) ( HOLDING ?auto_7536 ) ( CLEAR ?auto_7535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7535 ?auto_7536 )
      ( MAKE-2PILE ?auto_7532 ?auto_7533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7537 - BLOCK
      ?auto_7538 - BLOCK
    )
    :vars
    (
      ?auto_7540 - BLOCK
      ?auto_7539 - BLOCK
      ?auto_7541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7537 ?auto_7538 ) ) ( not ( = ?auto_7537 ?auto_7540 ) ) ( not ( = ?auto_7538 ?auto_7540 ) ) ( ON-TABLE ?auto_7539 ) ( not ( = ?auto_7539 ?auto_7540 ) ) ( not ( = ?auto_7539 ?auto_7538 ) ) ( not ( = ?auto_7539 ?auto_7537 ) ) ( ON ?auto_7537 ?auto_7541 ) ( not ( = ?auto_7537 ?auto_7541 ) ) ( not ( = ?auto_7538 ?auto_7541 ) ) ( not ( = ?auto_7540 ?auto_7541 ) ) ( not ( = ?auto_7539 ?auto_7541 ) ) ( ON ?auto_7538 ?auto_7537 ) ( ON-TABLE ?auto_7541 ) ( CLEAR ?auto_7539 ) ( ON ?auto_7540 ?auto_7538 ) ( CLEAR ?auto_7540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7541 ?auto_7537 ?auto_7538 )
      ( MAKE-2PILE ?auto_7537 ?auto_7538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7542 - BLOCK
      ?auto_7543 - BLOCK
    )
    :vars
    (
      ?auto_7546 - BLOCK
      ?auto_7544 - BLOCK
      ?auto_7545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7542 ?auto_7543 ) ) ( not ( = ?auto_7542 ?auto_7546 ) ) ( not ( = ?auto_7543 ?auto_7546 ) ) ( not ( = ?auto_7544 ?auto_7546 ) ) ( not ( = ?auto_7544 ?auto_7543 ) ) ( not ( = ?auto_7544 ?auto_7542 ) ) ( ON ?auto_7542 ?auto_7545 ) ( not ( = ?auto_7542 ?auto_7545 ) ) ( not ( = ?auto_7543 ?auto_7545 ) ) ( not ( = ?auto_7546 ?auto_7545 ) ) ( not ( = ?auto_7544 ?auto_7545 ) ) ( ON ?auto_7543 ?auto_7542 ) ( ON-TABLE ?auto_7545 ) ( ON ?auto_7546 ?auto_7543 ) ( CLEAR ?auto_7546 ) ( HOLDING ?auto_7544 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7544 )
      ( MAKE-2PILE ?auto_7542 ?auto_7543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7547 - BLOCK
      ?auto_7548 - BLOCK
    )
    :vars
    (
      ?auto_7549 - BLOCK
      ?auto_7550 - BLOCK
      ?auto_7551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7547 ?auto_7548 ) ) ( not ( = ?auto_7547 ?auto_7549 ) ) ( not ( = ?auto_7548 ?auto_7549 ) ) ( not ( = ?auto_7550 ?auto_7549 ) ) ( not ( = ?auto_7550 ?auto_7548 ) ) ( not ( = ?auto_7550 ?auto_7547 ) ) ( ON ?auto_7547 ?auto_7551 ) ( not ( = ?auto_7547 ?auto_7551 ) ) ( not ( = ?auto_7548 ?auto_7551 ) ) ( not ( = ?auto_7549 ?auto_7551 ) ) ( not ( = ?auto_7550 ?auto_7551 ) ) ( ON ?auto_7548 ?auto_7547 ) ( ON-TABLE ?auto_7551 ) ( ON ?auto_7549 ?auto_7548 ) ( ON ?auto_7550 ?auto_7549 ) ( CLEAR ?auto_7550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7551 ?auto_7547 ?auto_7548 ?auto_7549 )
      ( MAKE-2PILE ?auto_7547 ?auto_7548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7553 - BLOCK
    )
    :vars
    (
      ?auto_7554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7554 ?auto_7553 ) ( CLEAR ?auto_7554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7553 ) ( not ( = ?auto_7553 ?auto_7554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7554 ?auto_7553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7555 - BLOCK
    )
    :vars
    (
      ?auto_7556 - BLOCK
      ?auto_7557 - BLOCK
      ?auto_7558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7556 ?auto_7555 ) ( CLEAR ?auto_7556 ) ( ON-TABLE ?auto_7555 ) ( not ( = ?auto_7555 ?auto_7556 ) ) ( HOLDING ?auto_7557 ) ( CLEAR ?auto_7558 ) ( not ( = ?auto_7555 ?auto_7557 ) ) ( not ( = ?auto_7555 ?auto_7558 ) ) ( not ( = ?auto_7556 ?auto_7557 ) ) ( not ( = ?auto_7556 ?auto_7558 ) ) ( not ( = ?auto_7557 ?auto_7558 ) ) )
    :subtasks
    ( ( !STACK ?auto_7557 ?auto_7558 )
      ( MAKE-1PILE ?auto_7555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7559 - BLOCK
    )
    :vars
    (
      ?auto_7561 - BLOCK
      ?auto_7560 - BLOCK
      ?auto_7562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7561 ?auto_7559 ) ( ON-TABLE ?auto_7559 ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( CLEAR ?auto_7560 ) ( not ( = ?auto_7559 ?auto_7562 ) ) ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7560 ) ) ( not ( = ?auto_7562 ?auto_7560 ) ) ( ON ?auto_7562 ?auto_7561 ) ( CLEAR ?auto_7562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7559 ?auto_7561 )
      ( MAKE-1PILE ?auto_7559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7563 - BLOCK
    )
    :vars
    (
      ?auto_7566 - BLOCK
      ?auto_7564 - BLOCK
      ?auto_7565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7566 ?auto_7563 ) ( ON-TABLE ?auto_7563 ) ( not ( = ?auto_7563 ?auto_7566 ) ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7566 ?auto_7564 ) ) ( not ( = ?auto_7566 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7565 ) ) ( ON ?auto_7564 ?auto_7566 ) ( CLEAR ?auto_7564 ) ( HOLDING ?auto_7565 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7565 )
      ( MAKE-1PILE ?auto_7563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7567 - BLOCK
    )
    :vars
    (
      ?auto_7570 - BLOCK
      ?auto_7568 - BLOCK
      ?auto_7569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7570 ?auto_7567 ) ( ON-TABLE ?auto_7567 ) ( not ( = ?auto_7567 ?auto_7570 ) ) ( not ( = ?auto_7567 ?auto_7568 ) ) ( not ( = ?auto_7567 ?auto_7569 ) ) ( not ( = ?auto_7570 ?auto_7568 ) ) ( not ( = ?auto_7570 ?auto_7569 ) ) ( not ( = ?auto_7568 ?auto_7569 ) ) ( ON ?auto_7568 ?auto_7570 ) ( ON ?auto_7569 ?auto_7568 ) ( CLEAR ?auto_7569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7567 ?auto_7570 ?auto_7568 )
      ( MAKE-1PILE ?auto_7567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7571 - BLOCK
    )
    :vars
    (
      ?auto_7573 - BLOCK
      ?auto_7574 - BLOCK
      ?auto_7572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7573 ?auto_7571 ) ( ON-TABLE ?auto_7571 ) ( not ( = ?auto_7571 ?auto_7573 ) ) ( not ( = ?auto_7571 ?auto_7574 ) ) ( not ( = ?auto_7571 ?auto_7572 ) ) ( not ( = ?auto_7573 ?auto_7574 ) ) ( not ( = ?auto_7573 ?auto_7572 ) ) ( not ( = ?auto_7574 ?auto_7572 ) ) ( ON ?auto_7574 ?auto_7573 ) ( HOLDING ?auto_7572 ) ( CLEAR ?auto_7574 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7571 ?auto_7573 ?auto_7574 ?auto_7572 )
      ( MAKE-1PILE ?auto_7571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7575 - BLOCK
    )
    :vars
    (
      ?auto_7577 - BLOCK
      ?auto_7576 - BLOCK
      ?auto_7578 - BLOCK
      ?auto_7579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7577 ?auto_7575 ) ( ON-TABLE ?auto_7575 ) ( not ( = ?auto_7575 ?auto_7577 ) ) ( not ( = ?auto_7575 ?auto_7576 ) ) ( not ( = ?auto_7575 ?auto_7578 ) ) ( not ( = ?auto_7577 ?auto_7576 ) ) ( not ( = ?auto_7577 ?auto_7578 ) ) ( not ( = ?auto_7576 ?auto_7578 ) ) ( ON ?auto_7576 ?auto_7577 ) ( CLEAR ?auto_7576 ) ( ON ?auto_7578 ?auto_7579 ) ( CLEAR ?auto_7578 ) ( HAND-EMPTY ) ( not ( = ?auto_7575 ?auto_7579 ) ) ( not ( = ?auto_7577 ?auto_7579 ) ) ( not ( = ?auto_7576 ?auto_7579 ) ) ( not ( = ?auto_7578 ?auto_7579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7578 ?auto_7579 )
      ( MAKE-1PILE ?auto_7575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7580 - BLOCK
    )
    :vars
    (
      ?auto_7581 - BLOCK
      ?auto_7584 - BLOCK
      ?auto_7582 - BLOCK
      ?auto_7583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7581 ?auto_7580 ) ( ON-TABLE ?auto_7580 ) ( not ( = ?auto_7580 ?auto_7581 ) ) ( not ( = ?auto_7580 ?auto_7584 ) ) ( not ( = ?auto_7580 ?auto_7582 ) ) ( not ( = ?auto_7581 ?auto_7584 ) ) ( not ( = ?auto_7581 ?auto_7582 ) ) ( not ( = ?auto_7584 ?auto_7582 ) ) ( ON ?auto_7582 ?auto_7583 ) ( CLEAR ?auto_7582 ) ( not ( = ?auto_7580 ?auto_7583 ) ) ( not ( = ?auto_7581 ?auto_7583 ) ) ( not ( = ?auto_7584 ?auto_7583 ) ) ( not ( = ?auto_7582 ?auto_7583 ) ) ( HOLDING ?auto_7584 ) ( CLEAR ?auto_7581 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7580 ?auto_7581 ?auto_7584 )
      ( MAKE-1PILE ?auto_7580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7585 - BLOCK
    )
    :vars
    (
      ?auto_7589 - BLOCK
      ?auto_7586 - BLOCK
      ?auto_7587 - BLOCK
      ?auto_7588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7589 ?auto_7585 ) ( ON-TABLE ?auto_7585 ) ( not ( = ?auto_7585 ?auto_7589 ) ) ( not ( = ?auto_7585 ?auto_7586 ) ) ( not ( = ?auto_7585 ?auto_7587 ) ) ( not ( = ?auto_7589 ?auto_7586 ) ) ( not ( = ?auto_7589 ?auto_7587 ) ) ( not ( = ?auto_7586 ?auto_7587 ) ) ( ON ?auto_7587 ?auto_7588 ) ( not ( = ?auto_7585 ?auto_7588 ) ) ( not ( = ?auto_7589 ?auto_7588 ) ) ( not ( = ?auto_7586 ?auto_7588 ) ) ( not ( = ?auto_7587 ?auto_7588 ) ) ( CLEAR ?auto_7589 ) ( ON ?auto_7586 ?auto_7587 ) ( CLEAR ?auto_7586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7588 ?auto_7587 )
      ( MAKE-1PILE ?auto_7585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7600 - BLOCK
    )
    :vars
    (
      ?auto_7603 - BLOCK
      ?auto_7601 - BLOCK
      ?auto_7602 - BLOCK
      ?auto_7604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7600 ?auto_7603 ) ) ( not ( = ?auto_7600 ?auto_7601 ) ) ( not ( = ?auto_7600 ?auto_7602 ) ) ( not ( = ?auto_7603 ?auto_7601 ) ) ( not ( = ?auto_7603 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7602 ) ) ( ON ?auto_7602 ?auto_7604 ) ( not ( = ?auto_7600 ?auto_7604 ) ) ( not ( = ?auto_7603 ?auto_7604 ) ) ( not ( = ?auto_7601 ?auto_7604 ) ) ( not ( = ?auto_7602 ?auto_7604 ) ) ( ON ?auto_7601 ?auto_7602 ) ( ON-TABLE ?auto_7604 ) ( ON ?auto_7603 ?auto_7601 ) ( CLEAR ?auto_7603 ) ( HOLDING ?auto_7600 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7600 ?auto_7603 )
      ( MAKE-1PILE ?auto_7600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7605 - BLOCK
    )
    :vars
    (
      ?auto_7608 - BLOCK
      ?auto_7609 - BLOCK
      ?auto_7606 - BLOCK
      ?auto_7607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7605 ?auto_7608 ) ) ( not ( = ?auto_7605 ?auto_7609 ) ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( not ( = ?auto_7608 ?auto_7609 ) ) ( not ( = ?auto_7608 ?auto_7606 ) ) ( not ( = ?auto_7609 ?auto_7606 ) ) ( ON ?auto_7606 ?auto_7607 ) ( not ( = ?auto_7605 ?auto_7607 ) ) ( not ( = ?auto_7608 ?auto_7607 ) ) ( not ( = ?auto_7609 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( ON ?auto_7609 ?auto_7606 ) ( ON-TABLE ?auto_7607 ) ( ON ?auto_7608 ?auto_7609 ) ( ON ?auto_7605 ?auto_7608 ) ( CLEAR ?auto_7605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7607 ?auto_7606 ?auto_7609 ?auto_7608 )
      ( MAKE-1PILE ?auto_7605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7613 - BLOCK
      ?auto_7614 - BLOCK
      ?auto_7615 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7615 ) ( CLEAR ?auto_7614 ) ( ON-TABLE ?auto_7613 ) ( ON ?auto_7614 ?auto_7613 ) ( not ( = ?auto_7613 ?auto_7614 ) ) ( not ( = ?auto_7613 ?auto_7615 ) ) ( not ( = ?auto_7614 ?auto_7615 ) ) )
    :subtasks
    ( ( !STACK ?auto_7615 ?auto_7614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7616 - BLOCK
      ?auto_7617 - BLOCK
      ?auto_7618 - BLOCK
    )
    :vars
    (
      ?auto_7619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7617 ) ( ON-TABLE ?auto_7616 ) ( ON ?auto_7617 ?auto_7616 ) ( not ( = ?auto_7616 ?auto_7617 ) ) ( not ( = ?auto_7616 ?auto_7618 ) ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( ON ?auto_7618 ?auto_7619 ) ( CLEAR ?auto_7618 ) ( HAND-EMPTY ) ( not ( = ?auto_7616 ?auto_7619 ) ) ( not ( = ?auto_7617 ?auto_7619 ) ) ( not ( = ?auto_7618 ?auto_7619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7618 ?auto_7619 )
      ( MAKE-3PILE ?auto_7616 ?auto_7617 ?auto_7618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7620 - BLOCK
      ?auto_7621 - BLOCK
      ?auto_7622 - BLOCK
    )
    :vars
    (
      ?auto_7623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7620 ) ( not ( = ?auto_7620 ?auto_7621 ) ) ( not ( = ?auto_7620 ?auto_7622 ) ) ( not ( = ?auto_7621 ?auto_7622 ) ) ( ON ?auto_7622 ?auto_7623 ) ( CLEAR ?auto_7622 ) ( not ( = ?auto_7620 ?auto_7623 ) ) ( not ( = ?auto_7621 ?auto_7623 ) ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( HOLDING ?auto_7621 ) ( CLEAR ?auto_7620 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7620 ?auto_7621 )
      ( MAKE-3PILE ?auto_7620 ?auto_7621 ?auto_7622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7624 - BLOCK
      ?auto_7625 - BLOCK
      ?auto_7626 - BLOCK
    )
    :vars
    (
      ?auto_7627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7624 ) ( not ( = ?auto_7624 ?auto_7625 ) ) ( not ( = ?auto_7624 ?auto_7626 ) ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( ON ?auto_7626 ?auto_7627 ) ( not ( = ?auto_7624 ?auto_7627 ) ) ( not ( = ?auto_7625 ?auto_7627 ) ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( CLEAR ?auto_7624 ) ( ON ?auto_7625 ?auto_7626 ) ( CLEAR ?auto_7625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7627 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7627 ?auto_7626 )
      ( MAKE-3PILE ?auto_7624 ?auto_7625 ?auto_7626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7628 - BLOCK
      ?auto_7629 - BLOCK
      ?auto_7630 - BLOCK
    )
    :vars
    (
      ?auto_7631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7628 ?auto_7629 ) ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( not ( = ?auto_7629 ?auto_7630 ) ) ( ON ?auto_7630 ?auto_7631 ) ( not ( = ?auto_7628 ?auto_7631 ) ) ( not ( = ?auto_7629 ?auto_7631 ) ) ( not ( = ?auto_7630 ?auto_7631 ) ) ( ON ?auto_7629 ?auto_7630 ) ( CLEAR ?auto_7629 ) ( ON-TABLE ?auto_7631 ) ( HOLDING ?auto_7628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7628 )
      ( MAKE-3PILE ?auto_7628 ?auto_7629 ?auto_7630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7632 - BLOCK
      ?auto_7633 - BLOCK
      ?auto_7634 - BLOCK
    )
    :vars
    (
      ?auto_7635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7632 ?auto_7633 ) ) ( not ( = ?auto_7632 ?auto_7634 ) ) ( not ( = ?auto_7633 ?auto_7634 ) ) ( ON ?auto_7634 ?auto_7635 ) ( not ( = ?auto_7632 ?auto_7635 ) ) ( not ( = ?auto_7633 ?auto_7635 ) ) ( not ( = ?auto_7634 ?auto_7635 ) ) ( ON ?auto_7633 ?auto_7634 ) ( ON-TABLE ?auto_7635 ) ( ON ?auto_7632 ?auto_7633 ) ( CLEAR ?auto_7632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7635 ?auto_7634 ?auto_7633 )
      ( MAKE-3PILE ?auto_7632 ?auto_7633 ?auto_7634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7636 - BLOCK
      ?auto_7637 - BLOCK
      ?auto_7638 - BLOCK
    )
    :vars
    (
      ?auto_7639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7638 ) ) ( not ( = ?auto_7637 ?auto_7638 ) ) ( ON ?auto_7638 ?auto_7639 ) ( not ( = ?auto_7636 ?auto_7639 ) ) ( not ( = ?auto_7637 ?auto_7639 ) ) ( not ( = ?auto_7638 ?auto_7639 ) ) ( ON ?auto_7637 ?auto_7638 ) ( ON-TABLE ?auto_7639 ) ( HOLDING ?auto_7636 ) ( CLEAR ?auto_7637 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7639 ?auto_7638 ?auto_7637 ?auto_7636 )
      ( MAKE-3PILE ?auto_7636 ?auto_7637 ?auto_7638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7640 - BLOCK
      ?auto_7641 - BLOCK
      ?auto_7642 - BLOCK
    )
    :vars
    (
      ?auto_7643 - BLOCK
      ?auto_7644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7640 ?auto_7641 ) ) ( not ( = ?auto_7640 ?auto_7642 ) ) ( not ( = ?auto_7641 ?auto_7642 ) ) ( ON ?auto_7642 ?auto_7643 ) ( not ( = ?auto_7640 ?auto_7643 ) ) ( not ( = ?auto_7641 ?auto_7643 ) ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( ON ?auto_7641 ?auto_7642 ) ( ON-TABLE ?auto_7643 ) ( CLEAR ?auto_7641 ) ( ON ?auto_7640 ?auto_7644 ) ( CLEAR ?auto_7640 ) ( HAND-EMPTY ) ( not ( = ?auto_7640 ?auto_7644 ) ) ( not ( = ?auto_7641 ?auto_7644 ) ) ( not ( = ?auto_7642 ?auto_7644 ) ) ( not ( = ?auto_7643 ?auto_7644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7640 ?auto_7644 )
      ( MAKE-3PILE ?auto_7640 ?auto_7641 ?auto_7642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7645 - BLOCK
      ?auto_7646 - BLOCK
      ?auto_7647 - BLOCK
    )
    :vars
    (
      ?auto_7649 - BLOCK
      ?auto_7648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7645 ?auto_7646 ) ) ( not ( = ?auto_7645 ?auto_7647 ) ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( ON ?auto_7647 ?auto_7649 ) ( not ( = ?auto_7645 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7647 ?auto_7649 ) ) ( ON-TABLE ?auto_7649 ) ( ON ?auto_7645 ?auto_7648 ) ( CLEAR ?auto_7645 ) ( not ( = ?auto_7645 ?auto_7648 ) ) ( not ( = ?auto_7646 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7648 ) ) ( not ( = ?auto_7649 ?auto_7648 ) ) ( HOLDING ?auto_7646 ) ( CLEAR ?auto_7647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7649 ?auto_7647 ?auto_7646 )
      ( MAKE-3PILE ?auto_7645 ?auto_7646 ?auto_7647 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7650 - BLOCK
      ?auto_7651 - BLOCK
      ?auto_7652 - BLOCK
    )
    :vars
    (
      ?auto_7654 - BLOCK
      ?auto_7653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7652 ) ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( ON ?auto_7652 ?auto_7654 ) ( not ( = ?auto_7650 ?auto_7654 ) ) ( not ( = ?auto_7651 ?auto_7654 ) ) ( not ( = ?auto_7652 ?auto_7654 ) ) ( ON-TABLE ?auto_7654 ) ( ON ?auto_7650 ?auto_7653 ) ( not ( = ?auto_7650 ?auto_7653 ) ) ( not ( = ?auto_7651 ?auto_7653 ) ) ( not ( = ?auto_7652 ?auto_7653 ) ) ( not ( = ?auto_7654 ?auto_7653 ) ) ( CLEAR ?auto_7652 ) ( ON ?auto_7651 ?auto_7650 ) ( CLEAR ?auto_7651 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7653 ?auto_7650 )
      ( MAKE-3PILE ?auto_7650 ?auto_7651 ?auto_7652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7655 - BLOCK
      ?auto_7656 - BLOCK
      ?auto_7657 - BLOCK
    )
    :vars
    (
      ?auto_7659 - BLOCK
      ?auto_7658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7655 ?auto_7656 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( not ( = ?auto_7655 ?auto_7659 ) ) ( not ( = ?auto_7656 ?auto_7659 ) ) ( not ( = ?auto_7657 ?auto_7659 ) ) ( ON-TABLE ?auto_7659 ) ( ON ?auto_7655 ?auto_7658 ) ( not ( = ?auto_7655 ?auto_7658 ) ) ( not ( = ?auto_7656 ?auto_7658 ) ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( not ( = ?auto_7659 ?auto_7658 ) ) ( ON ?auto_7656 ?auto_7655 ) ( CLEAR ?auto_7656 ) ( ON-TABLE ?auto_7658 ) ( HOLDING ?auto_7657 ) ( CLEAR ?auto_7659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7659 ?auto_7657 )
      ( MAKE-3PILE ?auto_7655 ?auto_7656 ?auto_7657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7660 - BLOCK
      ?auto_7661 - BLOCK
      ?auto_7662 - BLOCK
    )
    :vars
    (
      ?auto_7663 - BLOCK
      ?auto_7664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( not ( = ?auto_7661 ?auto_7662 ) ) ( not ( = ?auto_7660 ?auto_7663 ) ) ( not ( = ?auto_7661 ?auto_7663 ) ) ( not ( = ?auto_7662 ?auto_7663 ) ) ( ON-TABLE ?auto_7663 ) ( ON ?auto_7660 ?auto_7664 ) ( not ( = ?auto_7660 ?auto_7664 ) ) ( not ( = ?auto_7661 ?auto_7664 ) ) ( not ( = ?auto_7662 ?auto_7664 ) ) ( not ( = ?auto_7663 ?auto_7664 ) ) ( ON ?auto_7661 ?auto_7660 ) ( ON-TABLE ?auto_7664 ) ( CLEAR ?auto_7663 ) ( ON ?auto_7662 ?auto_7661 ) ( CLEAR ?auto_7662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7664 ?auto_7660 ?auto_7661 )
      ( MAKE-3PILE ?auto_7660 ?auto_7661 ?auto_7662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7665 - BLOCK
      ?auto_7666 - BLOCK
      ?auto_7667 - BLOCK
    )
    :vars
    (
      ?auto_7668 - BLOCK
      ?auto_7669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7665 ?auto_7666 ) ) ( not ( = ?auto_7665 ?auto_7667 ) ) ( not ( = ?auto_7666 ?auto_7667 ) ) ( not ( = ?auto_7665 ?auto_7668 ) ) ( not ( = ?auto_7666 ?auto_7668 ) ) ( not ( = ?auto_7667 ?auto_7668 ) ) ( ON ?auto_7665 ?auto_7669 ) ( not ( = ?auto_7665 ?auto_7669 ) ) ( not ( = ?auto_7666 ?auto_7669 ) ) ( not ( = ?auto_7667 ?auto_7669 ) ) ( not ( = ?auto_7668 ?auto_7669 ) ) ( ON ?auto_7666 ?auto_7665 ) ( ON-TABLE ?auto_7669 ) ( ON ?auto_7667 ?auto_7666 ) ( CLEAR ?auto_7667 ) ( HOLDING ?auto_7668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7668 )
      ( MAKE-3PILE ?auto_7665 ?auto_7666 ?auto_7667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7670 - BLOCK
      ?auto_7671 - BLOCK
      ?auto_7672 - BLOCK
    )
    :vars
    (
      ?auto_7673 - BLOCK
      ?auto_7674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7670 ?auto_7671 ) ) ( not ( = ?auto_7670 ?auto_7672 ) ) ( not ( = ?auto_7671 ?auto_7672 ) ) ( not ( = ?auto_7670 ?auto_7673 ) ) ( not ( = ?auto_7671 ?auto_7673 ) ) ( not ( = ?auto_7672 ?auto_7673 ) ) ( ON ?auto_7670 ?auto_7674 ) ( not ( = ?auto_7670 ?auto_7674 ) ) ( not ( = ?auto_7671 ?auto_7674 ) ) ( not ( = ?auto_7672 ?auto_7674 ) ) ( not ( = ?auto_7673 ?auto_7674 ) ) ( ON ?auto_7671 ?auto_7670 ) ( ON-TABLE ?auto_7674 ) ( ON ?auto_7672 ?auto_7671 ) ( ON ?auto_7673 ?auto_7672 ) ( CLEAR ?auto_7673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7674 ?auto_7670 ?auto_7671 ?auto_7672 )
      ( MAKE-3PILE ?auto_7670 ?auto_7671 ?auto_7672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7679 - BLOCK
      ?auto_7680 - BLOCK
      ?auto_7681 - BLOCK
      ?auto_7682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7682 ) ( CLEAR ?auto_7681 ) ( ON-TABLE ?auto_7679 ) ( ON ?auto_7680 ?auto_7679 ) ( ON ?auto_7681 ?auto_7680 ) ( not ( = ?auto_7679 ?auto_7680 ) ) ( not ( = ?auto_7679 ?auto_7681 ) ) ( not ( = ?auto_7679 ?auto_7682 ) ) ( not ( = ?auto_7680 ?auto_7681 ) ) ( not ( = ?auto_7680 ?auto_7682 ) ) ( not ( = ?auto_7681 ?auto_7682 ) ) )
    :subtasks
    ( ( !STACK ?auto_7682 ?auto_7681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7683 - BLOCK
      ?auto_7684 - BLOCK
      ?auto_7685 - BLOCK
      ?auto_7686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7685 ) ( ON-TABLE ?auto_7683 ) ( ON ?auto_7684 ?auto_7683 ) ( ON ?auto_7685 ?auto_7684 ) ( not ( = ?auto_7683 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7685 ) ) ( not ( = ?auto_7683 ?auto_7686 ) ) ( not ( = ?auto_7684 ?auto_7685 ) ) ( not ( = ?auto_7684 ?auto_7686 ) ) ( not ( = ?auto_7685 ?auto_7686 ) ) ( ON-TABLE ?auto_7686 ) ( CLEAR ?auto_7686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_7686 )
      ( MAKE-4PILE ?auto_7683 ?auto_7684 ?auto_7685 ?auto_7686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7687 - BLOCK
      ?auto_7688 - BLOCK
      ?auto_7689 - BLOCK
      ?auto_7690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7687 ) ( ON ?auto_7688 ?auto_7687 ) ( not ( = ?auto_7687 ?auto_7688 ) ) ( not ( = ?auto_7687 ?auto_7689 ) ) ( not ( = ?auto_7687 ?auto_7690 ) ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7690 ) ) ( ON-TABLE ?auto_7690 ) ( CLEAR ?auto_7690 ) ( HOLDING ?auto_7689 ) ( CLEAR ?auto_7688 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7687 ?auto_7688 ?auto_7689 )
      ( MAKE-4PILE ?auto_7687 ?auto_7688 ?auto_7689 ?auto_7690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7691 - BLOCK
      ?auto_7692 - BLOCK
      ?auto_7693 - BLOCK
      ?auto_7694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7691 ) ( ON ?auto_7692 ?auto_7691 ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7691 ?auto_7693 ) ) ( not ( = ?auto_7691 ?auto_7694 ) ) ( not ( = ?auto_7692 ?auto_7693 ) ) ( not ( = ?auto_7692 ?auto_7694 ) ) ( not ( = ?auto_7693 ?auto_7694 ) ) ( ON-TABLE ?auto_7694 ) ( CLEAR ?auto_7692 ) ( ON ?auto_7693 ?auto_7694 ) ( CLEAR ?auto_7693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7694 )
      ( MAKE-4PILE ?auto_7691 ?auto_7692 ?auto_7693 ?auto_7694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7695 - BLOCK
      ?auto_7696 - BLOCK
      ?auto_7697 - BLOCK
      ?auto_7698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7695 ) ( not ( = ?auto_7695 ?auto_7696 ) ) ( not ( = ?auto_7695 ?auto_7697 ) ) ( not ( = ?auto_7695 ?auto_7698 ) ) ( not ( = ?auto_7696 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7698 ) ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( ON-TABLE ?auto_7698 ) ( ON ?auto_7697 ?auto_7698 ) ( CLEAR ?auto_7697 ) ( HOLDING ?auto_7696 ) ( CLEAR ?auto_7695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7695 ?auto_7696 )
      ( MAKE-4PILE ?auto_7695 ?auto_7696 ?auto_7697 ?auto_7698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7699 - BLOCK
      ?auto_7700 - BLOCK
      ?auto_7701 - BLOCK
      ?auto_7702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7699 ) ( not ( = ?auto_7699 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7701 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( ON-TABLE ?auto_7702 ) ( ON ?auto_7701 ?auto_7702 ) ( CLEAR ?auto_7699 ) ( ON ?auto_7700 ?auto_7701 ) ( CLEAR ?auto_7700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7702 ?auto_7701 )
      ( MAKE-4PILE ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7703 - BLOCK
      ?auto_7704 - BLOCK
      ?auto_7705 - BLOCK
      ?auto_7706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7703 ?auto_7704 ) ) ( not ( = ?auto_7703 ?auto_7705 ) ) ( not ( = ?auto_7703 ?auto_7706 ) ) ( not ( = ?auto_7704 ?auto_7705 ) ) ( not ( = ?auto_7704 ?auto_7706 ) ) ( not ( = ?auto_7705 ?auto_7706 ) ) ( ON-TABLE ?auto_7706 ) ( ON ?auto_7705 ?auto_7706 ) ( ON ?auto_7704 ?auto_7705 ) ( CLEAR ?auto_7704 ) ( HOLDING ?auto_7703 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7703 )
      ( MAKE-4PILE ?auto_7703 ?auto_7704 ?auto_7705 ?auto_7706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7707 - BLOCK
      ?auto_7708 - BLOCK
      ?auto_7709 - BLOCK
      ?auto_7710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7707 ?auto_7708 ) ) ( not ( = ?auto_7707 ?auto_7709 ) ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( not ( = ?auto_7708 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( ON-TABLE ?auto_7710 ) ( ON ?auto_7709 ?auto_7710 ) ( ON ?auto_7708 ?auto_7709 ) ( ON ?auto_7707 ?auto_7708 ) ( CLEAR ?auto_7707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7710 ?auto_7709 ?auto_7708 )
      ( MAKE-4PILE ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7711 - BLOCK
      ?auto_7712 - BLOCK
      ?auto_7713 - BLOCK
      ?auto_7714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7711 ?auto_7712 ) ) ( not ( = ?auto_7711 ?auto_7713 ) ) ( not ( = ?auto_7711 ?auto_7714 ) ) ( not ( = ?auto_7712 ?auto_7713 ) ) ( not ( = ?auto_7712 ?auto_7714 ) ) ( not ( = ?auto_7713 ?auto_7714 ) ) ( ON-TABLE ?auto_7714 ) ( ON ?auto_7713 ?auto_7714 ) ( ON ?auto_7712 ?auto_7713 ) ( HOLDING ?auto_7711 ) ( CLEAR ?auto_7712 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7714 ?auto_7713 ?auto_7712 ?auto_7711 )
      ( MAKE-4PILE ?auto_7711 ?auto_7712 ?auto_7713 ?auto_7714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7715 - BLOCK
      ?auto_7716 - BLOCK
      ?auto_7717 - BLOCK
      ?auto_7718 - BLOCK
    )
    :vars
    (
      ?auto_7719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7715 ?auto_7716 ) ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7718 ) ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7716 ?auto_7718 ) ) ( not ( = ?auto_7717 ?auto_7718 ) ) ( ON-TABLE ?auto_7718 ) ( ON ?auto_7717 ?auto_7718 ) ( ON ?auto_7716 ?auto_7717 ) ( CLEAR ?auto_7716 ) ( ON ?auto_7715 ?auto_7719 ) ( CLEAR ?auto_7715 ) ( HAND-EMPTY ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( not ( = ?auto_7717 ?auto_7719 ) ) ( not ( = ?auto_7718 ?auto_7719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7715 ?auto_7719 )
      ( MAKE-4PILE ?auto_7715 ?auto_7716 ?auto_7717 ?auto_7718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7720 - BLOCK
      ?auto_7721 - BLOCK
      ?auto_7722 - BLOCK
      ?auto_7723 - BLOCK
    )
    :vars
    (
      ?auto_7724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7720 ?auto_7721 ) ) ( not ( = ?auto_7720 ?auto_7722 ) ) ( not ( = ?auto_7720 ?auto_7723 ) ) ( not ( = ?auto_7721 ?auto_7722 ) ) ( not ( = ?auto_7721 ?auto_7723 ) ) ( not ( = ?auto_7722 ?auto_7723 ) ) ( ON-TABLE ?auto_7723 ) ( ON ?auto_7722 ?auto_7723 ) ( ON ?auto_7720 ?auto_7724 ) ( CLEAR ?auto_7720 ) ( not ( = ?auto_7720 ?auto_7724 ) ) ( not ( = ?auto_7721 ?auto_7724 ) ) ( not ( = ?auto_7722 ?auto_7724 ) ) ( not ( = ?auto_7723 ?auto_7724 ) ) ( HOLDING ?auto_7721 ) ( CLEAR ?auto_7722 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7723 ?auto_7722 ?auto_7721 )
      ( MAKE-4PILE ?auto_7720 ?auto_7721 ?auto_7722 ?auto_7723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7725 - BLOCK
      ?auto_7726 - BLOCK
      ?auto_7727 - BLOCK
      ?auto_7728 - BLOCK
    )
    :vars
    (
      ?auto_7729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7725 ?auto_7726 ) ) ( not ( = ?auto_7725 ?auto_7727 ) ) ( not ( = ?auto_7725 ?auto_7728 ) ) ( not ( = ?auto_7726 ?auto_7727 ) ) ( not ( = ?auto_7726 ?auto_7728 ) ) ( not ( = ?auto_7727 ?auto_7728 ) ) ( ON-TABLE ?auto_7728 ) ( ON ?auto_7727 ?auto_7728 ) ( ON ?auto_7725 ?auto_7729 ) ( not ( = ?auto_7725 ?auto_7729 ) ) ( not ( = ?auto_7726 ?auto_7729 ) ) ( not ( = ?auto_7727 ?auto_7729 ) ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( CLEAR ?auto_7727 ) ( ON ?auto_7726 ?auto_7725 ) ( CLEAR ?auto_7726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7729 ?auto_7725 )
      ( MAKE-4PILE ?auto_7725 ?auto_7726 ?auto_7727 ?auto_7728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7730 - BLOCK
      ?auto_7731 - BLOCK
      ?auto_7732 - BLOCK
      ?auto_7733 - BLOCK
    )
    :vars
    (
      ?auto_7734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7732 ) ) ( not ( = ?auto_7730 ?auto_7733 ) ) ( not ( = ?auto_7731 ?auto_7732 ) ) ( not ( = ?auto_7731 ?auto_7733 ) ) ( not ( = ?auto_7732 ?auto_7733 ) ) ( ON-TABLE ?auto_7733 ) ( ON ?auto_7730 ?auto_7734 ) ( not ( = ?auto_7730 ?auto_7734 ) ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( not ( = ?auto_7732 ?auto_7734 ) ) ( not ( = ?auto_7733 ?auto_7734 ) ) ( ON ?auto_7731 ?auto_7730 ) ( CLEAR ?auto_7731 ) ( ON-TABLE ?auto_7734 ) ( HOLDING ?auto_7732 ) ( CLEAR ?auto_7733 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7733 ?auto_7732 )
      ( MAKE-4PILE ?auto_7730 ?auto_7731 ?auto_7732 ?auto_7733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7735 - BLOCK
      ?auto_7736 - BLOCK
      ?auto_7737 - BLOCK
      ?auto_7738 - BLOCK
    )
    :vars
    (
      ?auto_7739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7735 ?auto_7736 ) ) ( not ( = ?auto_7735 ?auto_7737 ) ) ( not ( = ?auto_7735 ?auto_7738 ) ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( not ( = ?auto_7736 ?auto_7738 ) ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( ON-TABLE ?auto_7738 ) ( ON ?auto_7735 ?auto_7739 ) ( not ( = ?auto_7735 ?auto_7739 ) ) ( not ( = ?auto_7736 ?auto_7739 ) ) ( not ( = ?auto_7737 ?auto_7739 ) ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( ON ?auto_7736 ?auto_7735 ) ( ON-TABLE ?auto_7739 ) ( CLEAR ?auto_7738 ) ( ON ?auto_7737 ?auto_7736 ) ( CLEAR ?auto_7737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7739 ?auto_7735 ?auto_7736 )
      ( MAKE-4PILE ?auto_7735 ?auto_7736 ?auto_7737 ?auto_7738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7740 - BLOCK
      ?auto_7741 - BLOCK
      ?auto_7742 - BLOCK
      ?auto_7743 - BLOCK
    )
    :vars
    (
      ?auto_7744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7740 ?auto_7741 ) ) ( not ( = ?auto_7740 ?auto_7742 ) ) ( not ( = ?auto_7740 ?auto_7743 ) ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7743 ) ) ( not ( = ?auto_7742 ?auto_7743 ) ) ( ON ?auto_7740 ?auto_7744 ) ( not ( = ?auto_7740 ?auto_7744 ) ) ( not ( = ?auto_7741 ?auto_7744 ) ) ( not ( = ?auto_7742 ?auto_7744 ) ) ( not ( = ?auto_7743 ?auto_7744 ) ) ( ON ?auto_7741 ?auto_7740 ) ( ON-TABLE ?auto_7744 ) ( ON ?auto_7742 ?auto_7741 ) ( CLEAR ?auto_7742 ) ( HOLDING ?auto_7743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7743 )
      ( MAKE-4PILE ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7745 - BLOCK
      ?auto_7746 - BLOCK
      ?auto_7747 - BLOCK
      ?auto_7748 - BLOCK
    )
    :vars
    (
      ?auto_7749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7745 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7747 ) ) ( not ( = ?auto_7745 ?auto_7748 ) ) ( not ( = ?auto_7746 ?auto_7747 ) ) ( not ( = ?auto_7746 ?auto_7748 ) ) ( not ( = ?auto_7747 ?auto_7748 ) ) ( ON ?auto_7745 ?auto_7749 ) ( not ( = ?auto_7745 ?auto_7749 ) ) ( not ( = ?auto_7746 ?auto_7749 ) ) ( not ( = ?auto_7747 ?auto_7749 ) ) ( not ( = ?auto_7748 ?auto_7749 ) ) ( ON ?auto_7746 ?auto_7745 ) ( ON-TABLE ?auto_7749 ) ( ON ?auto_7747 ?auto_7746 ) ( ON ?auto_7748 ?auto_7747 ) ( CLEAR ?auto_7748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7749 ?auto_7745 ?auto_7746 ?auto_7747 )
      ( MAKE-4PILE ?auto_7745 ?auto_7746 ?auto_7747 ?auto_7748 ) )
  )

)

