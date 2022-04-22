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
      ?auto_25135 - BLOCK
      ?auto_25136 - BLOCK
      ?auto_25137 - BLOCK
      ?auto_25138 - BLOCK
      ?auto_25139 - BLOCK
    )
    :vars
    (
      ?auto_25140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25140 ?auto_25139 ) ( CLEAR ?auto_25140 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25135 ) ( ON ?auto_25136 ?auto_25135 ) ( ON ?auto_25137 ?auto_25136 ) ( ON ?auto_25138 ?auto_25137 ) ( ON ?auto_25139 ?auto_25138 ) ( not ( = ?auto_25135 ?auto_25136 ) ) ( not ( = ?auto_25135 ?auto_25137 ) ) ( not ( = ?auto_25135 ?auto_25138 ) ) ( not ( = ?auto_25135 ?auto_25139 ) ) ( not ( = ?auto_25135 ?auto_25140 ) ) ( not ( = ?auto_25136 ?auto_25137 ) ) ( not ( = ?auto_25136 ?auto_25138 ) ) ( not ( = ?auto_25136 ?auto_25139 ) ) ( not ( = ?auto_25136 ?auto_25140 ) ) ( not ( = ?auto_25137 ?auto_25138 ) ) ( not ( = ?auto_25137 ?auto_25139 ) ) ( not ( = ?auto_25137 ?auto_25140 ) ) ( not ( = ?auto_25138 ?auto_25139 ) ) ( not ( = ?auto_25138 ?auto_25140 ) ) ( not ( = ?auto_25139 ?auto_25140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25140 ?auto_25139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25142 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25142 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25143 - BLOCK
    )
    :vars
    (
      ?auto_25144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25143 ?auto_25144 ) ( CLEAR ?auto_25143 ) ( HAND-EMPTY ) ( not ( = ?auto_25143 ?auto_25144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25143 ?auto_25144 )
      ( MAKE-1PILE ?auto_25143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25149 - BLOCK
      ?auto_25150 - BLOCK
      ?auto_25151 - BLOCK
      ?auto_25152 - BLOCK
    )
    :vars
    (
      ?auto_25153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25153 ?auto_25152 ) ( CLEAR ?auto_25153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25149 ) ( ON ?auto_25150 ?auto_25149 ) ( ON ?auto_25151 ?auto_25150 ) ( ON ?auto_25152 ?auto_25151 ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25149 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25152 ) ) ( not ( = ?auto_25149 ?auto_25153 ) ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25150 ?auto_25152 ) ) ( not ( = ?auto_25150 ?auto_25153 ) ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( not ( = ?auto_25151 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25153 ?auto_25152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25154 - BLOCK
      ?auto_25155 - BLOCK
      ?auto_25156 - BLOCK
      ?auto_25157 - BLOCK
    )
    :vars
    (
      ?auto_25158 - BLOCK
      ?auto_25159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25158 ?auto_25157 ) ( CLEAR ?auto_25158 ) ( ON-TABLE ?auto_25154 ) ( ON ?auto_25155 ?auto_25154 ) ( ON ?auto_25156 ?auto_25155 ) ( ON ?auto_25157 ?auto_25156 ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25154 ?auto_25157 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( HOLDING ?auto_25159 ) ( not ( = ?auto_25154 ?auto_25159 ) ) ( not ( = ?auto_25155 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25159 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25159 )
      ( MAKE-4PILE ?auto_25154 ?auto_25155 ?auto_25156 ?auto_25157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25160 - BLOCK
      ?auto_25161 - BLOCK
      ?auto_25162 - BLOCK
      ?auto_25163 - BLOCK
    )
    :vars
    (
      ?auto_25164 - BLOCK
      ?auto_25165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25164 ?auto_25163 ) ( ON-TABLE ?auto_25160 ) ( ON ?auto_25161 ?auto_25160 ) ( ON ?auto_25162 ?auto_25161 ) ( ON ?auto_25163 ?auto_25162 ) ( not ( = ?auto_25160 ?auto_25161 ) ) ( not ( = ?auto_25160 ?auto_25162 ) ) ( not ( = ?auto_25160 ?auto_25163 ) ) ( not ( = ?auto_25160 ?auto_25164 ) ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( not ( = ?auto_25161 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25163 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25160 ?auto_25165 ) ) ( not ( = ?auto_25161 ?auto_25165 ) ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( not ( = ?auto_25163 ?auto_25165 ) ) ( not ( = ?auto_25164 ?auto_25165 ) ) ( ON ?auto_25165 ?auto_25164 ) ( CLEAR ?auto_25165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25160 ?auto_25161 ?auto_25162 ?auto_25163 ?auto_25164 )
      ( MAKE-4PILE ?auto_25160 ?auto_25161 ?auto_25162 ?auto_25163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25168 - BLOCK
      ?auto_25169 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25169 ) ( CLEAR ?auto_25168 ) ( ON-TABLE ?auto_25168 ) ( not ( = ?auto_25168 ?auto_25169 ) ) )
    :subtasks
    ( ( !STACK ?auto_25169 ?auto_25168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25170 - BLOCK
      ?auto_25171 - BLOCK
    )
    :vars
    (
      ?auto_25172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25170 ) ( ON-TABLE ?auto_25170 ) ( not ( = ?auto_25170 ?auto_25171 ) ) ( ON ?auto_25171 ?auto_25172 ) ( CLEAR ?auto_25171 ) ( HAND-EMPTY ) ( not ( = ?auto_25170 ?auto_25172 ) ) ( not ( = ?auto_25171 ?auto_25172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25171 ?auto_25172 )
      ( MAKE-2PILE ?auto_25170 ?auto_25171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25173 - BLOCK
      ?auto_25174 - BLOCK
    )
    :vars
    (
      ?auto_25175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25173 ?auto_25174 ) ) ( ON ?auto_25174 ?auto_25175 ) ( CLEAR ?auto_25174 ) ( not ( = ?auto_25173 ?auto_25175 ) ) ( not ( = ?auto_25174 ?auto_25175 ) ) ( HOLDING ?auto_25173 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25173 )
      ( MAKE-2PILE ?auto_25173 ?auto_25174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25176 - BLOCK
      ?auto_25177 - BLOCK
    )
    :vars
    (
      ?auto_25178 - BLOCK
      ?auto_25180 - BLOCK
      ?auto_25181 - BLOCK
      ?auto_25179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25176 ?auto_25177 ) ) ( ON ?auto_25177 ?auto_25178 ) ( not ( = ?auto_25176 ?auto_25178 ) ) ( not ( = ?auto_25177 ?auto_25178 ) ) ( ON ?auto_25176 ?auto_25177 ) ( CLEAR ?auto_25176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25180 ) ( ON ?auto_25181 ?auto_25180 ) ( ON ?auto_25179 ?auto_25181 ) ( ON ?auto_25178 ?auto_25179 ) ( not ( = ?auto_25180 ?auto_25181 ) ) ( not ( = ?auto_25180 ?auto_25179 ) ) ( not ( = ?auto_25180 ?auto_25178 ) ) ( not ( = ?auto_25180 ?auto_25177 ) ) ( not ( = ?auto_25180 ?auto_25176 ) ) ( not ( = ?auto_25181 ?auto_25179 ) ) ( not ( = ?auto_25181 ?auto_25178 ) ) ( not ( = ?auto_25181 ?auto_25177 ) ) ( not ( = ?auto_25181 ?auto_25176 ) ) ( not ( = ?auto_25179 ?auto_25178 ) ) ( not ( = ?auto_25179 ?auto_25177 ) ) ( not ( = ?auto_25179 ?auto_25176 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25180 ?auto_25181 ?auto_25179 ?auto_25178 ?auto_25177 )
      ( MAKE-2PILE ?auto_25176 ?auto_25177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25185 - BLOCK
      ?auto_25186 - BLOCK
      ?auto_25187 - BLOCK
    )
    :vars
    (
      ?auto_25188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25188 ?auto_25187 ) ( CLEAR ?auto_25188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25185 ) ( ON ?auto_25186 ?auto_25185 ) ( ON ?auto_25187 ?auto_25186 ) ( not ( = ?auto_25185 ?auto_25186 ) ) ( not ( = ?auto_25185 ?auto_25187 ) ) ( not ( = ?auto_25185 ?auto_25188 ) ) ( not ( = ?auto_25186 ?auto_25187 ) ) ( not ( = ?auto_25186 ?auto_25188 ) ) ( not ( = ?auto_25187 ?auto_25188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25188 ?auto_25187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25189 - BLOCK
      ?auto_25190 - BLOCK
      ?auto_25191 - BLOCK
    )
    :vars
    (
      ?auto_25192 - BLOCK
      ?auto_25193 - BLOCK
      ?auto_25194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25192 ?auto_25191 ) ( CLEAR ?auto_25192 ) ( ON-TABLE ?auto_25189 ) ( ON ?auto_25190 ?auto_25189 ) ( ON ?auto_25191 ?auto_25190 ) ( not ( = ?auto_25189 ?auto_25190 ) ) ( not ( = ?auto_25189 ?auto_25191 ) ) ( not ( = ?auto_25189 ?auto_25192 ) ) ( not ( = ?auto_25190 ?auto_25191 ) ) ( not ( = ?auto_25190 ?auto_25192 ) ) ( not ( = ?auto_25191 ?auto_25192 ) ) ( HOLDING ?auto_25193 ) ( CLEAR ?auto_25194 ) ( not ( = ?auto_25189 ?auto_25193 ) ) ( not ( = ?auto_25189 ?auto_25194 ) ) ( not ( = ?auto_25190 ?auto_25193 ) ) ( not ( = ?auto_25190 ?auto_25194 ) ) ( not ( = ?auto_25191 ?auto_25193 ) ) ( not ( = ?auto_25191 ?auto_25194 ) ) ( not ( = ?auto_25192 ?auto_25193 ) ) ( not ( = ?auto_25192 ?auto_25194 ) ) ( not ( = ?auto_25193 ?auto_25194 ) ) )
    :subtasks
    ( ( !STACK ?auto_25193 ?auto_25194 )
      ( MAKE-3PILE ?auto_25189 ?auto_25190 ?auto_25191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25557 - BLOCK
      ?auto_25558 - BLOCK
      ?auto_25559 - BLOCK
    )
    :vars
    (
      ?auto_25561 - BLOCK
      ?auto_25560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25561 ?auto_25559 ) ( ON-TABLE ?auto_25557 ) ( ON ?auto_25558 ?auto_25557 ) ( ON ?auto_25559 ?auto_25558 ) ( not ( = ?auto_25557 ?auto_25558 ) ) ( not ( = ?auto_25557 ?auto_25559 ) ) ( not ( = ?auto_25557 ?auto_25561 ) ) ( not ( = ?auto_25558 ?auto_25559 ) ) ( not ( = ?auto_25558 ?auto_25561 ) ) ( not ( = ?auto_25559 ?auto_25561 ) ) ( not ( = ?auto_25557 ?auto_25560 ) ) ( not ( = ?auto_25558 ?auto_25560 ) ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25561 ?auto_25560 ) ) ( ON ?auto_25560 ?auto_25561 ) ( CLEAR ?auto_25560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25557 ?auto_25558 ?auto_25559 ?auto_25561 )
      ( MAKE-3PILE ?auto_25557 ?auto_25558 ?auto_25559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25201 - BLOCK
      ?auto_25202 - BLOCK
      ?auto_25203 - BLOCK
    )
    :vars
    (
      ?auto_25206 - BLOCK
      ?auto_25204 - BLOCK
      ?auto_25205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25206 ?auto_25203 ) ( ON-TABLE ?auto_25201 ) ( ON ?auto_25202 ?auto_25201 ) ( ON ?auto_25203 ?auto_25202 ) ( not ( = ?auto_25201 ?auto_25202 ) ) ( not ( = ?auto_25201 ?auto_25203 ) ) ( not ( = ?auto_25201 ?auto_25206 ) ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25202 ?auto_25206 ) ) ( not ( = ?auto_25203 ?auto_25206 ) ) ( not ( = ?auto_25201 ?auto_25204 ) ) ( not ( = ?auto_25201 ?auto_25205 ) ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( not ( = ?auto_25202 ?auto_25205 ) ) ( not ( = ?auto_25203 ?auto_25204 ) ) ( not ( = ?auto_25203 ?auto_25205 ) ) ( not ( = ?auto_25206 ?auto_25204 ) ) ( not ( = ?auto_25206 ?auto_25205 ) ) ( not ( = ?auto_25204 ?auto_25205 ) ) ( ON ?auto_25204 ?auto_25206 ) ( CLEAR ?auto_25204 ) ( HOLDING ?auto_25205 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25205 )
      ( MAKE-3PILE ?auto_25201 ?auto_25202 ?auto_25203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25207 - BLOCK
      ?auto_25208 - BLOCK
      ?auto_25209 - BLOCK
    )
    :vars
    (
      ?auto_25211 - BLOCK
      ?auto_25210 - BLOCK
      ?auto_25212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25211 ?auto_25209 ) ( ON-TABLE ?auto_25207 ) ( ON ?auto_25208 ?auto_25207 ) ( ON ?auto_25209 ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25207 ?auto_25209 ) ) ( not ( = ?auto_25207 ?auto_25211 ) ) ( not ( = ?auto_25208 ?auto_25209 ) ) ( not ( = ?auto_25208 ?auto_25211 ) ) ( not ( = ?auto_25209 ?auto_25211 ) ) ( not ( = ?auto_25207 ?auto_25210 ) ) ( not ( = ?auto_25207 ?auto_25212 ) ) ( not ( = ?auto_25208 ?auto_25210 ) ) ( not ( = ?auto_25208 ?auto_25212 ) ) ( not ( = ?auto_25209 ?auto_25210 ) ) ( not ( = ?auto_25209 ?auto_25212 ) ) ( not ( = ?auto_25211 ?auto_25210 ) ) ( not ( = ?auto_25211 ?auto_25212 ) ) ( not ( = ?auto_25210 ?auto_25212 ) ) ( ON ?auto_25210 ?auto_25211 ) ( ON ?auto_25212 ?auto_25210 ) ( CLEAR ?auto_25212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25207 ?auto_25208 ?auto_25209 ?auto_25211 ?auto_25210 )
      ( MAKE-3PILE ?auto_25207 ?auto_25208 ?auto_25209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25216 - BLOCK
      ?auto_25217 - BLOCK
      ?auto_25218 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25218 ) ( CLEAR ?auto_25217 ) ( ON-TABLE ?auto_25216 ) ( ON ?auto_25217 ?auto_25216 ) ( not ( = ?auto_25216 ?auto_25217 ) ) ( not ( = ?auto_25216 ?auto_25218 ) ) ( not ( = ?auto_25217 ?auto_25218 ) ) )
    :subtasks
    ( ( !STACK ?auto_25218 ?auto_25217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25219 - BLOCK
      ?auto_25220 - BLOCK
      ?auto_25221 - BLOCK
    )
    :vars
    (
      ?auto_25222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25220 ) ( ON-TABLE ?auto_25219 ) ( ON ?auto_25220 ?auto_25219 ) ( not ( = ?auto_25219 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25221 ) ) ( not ( = ?auto_25220 ?auto_25221 ) ) ( ON ?auto_25221 ?auto_25222 ) ( CLEAR ?auto_25221 ) ( HAND-EMPTY ) ( not ( = ?auto_25219 ?auto_25222 ) ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25221 ?auto_25222 )
      ( MAKE-3PILE ?auto_25219 ?auto_25220 ?auto_25221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25223 - BLOCK
      ?auto_25224 - BLOCK
      ?auto_25225 - BLOCK
    )
    :vars
    (
      ?auto_25226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25223 ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( not ( = ?auto_25223 ?auto_25225 ) ) ( not ( = ?auto_25224 ?auto_25225 ) ) ( ON ?auto_25225 ?auto_25226 ) ( CLEAR ?auto_25225 ) ( not ( = ?auto_25223 ?auto_25226 ) ) ( not ( = ?auto_25224 ?auto_25226 ) ) ( not ( = ?auto_25225 ?auto_25226 ) ) ( HOLDING ?auto_25224 ) ( CLEAR ?auto_25223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25223 ?auto_25224 )
      ( MAKE-3PILE ?auto_25223 ?auto_25224 ?auto_25225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25227 - BLOCK
      ?auto_25228 - BLOCK
      ?auto_25229 - BLOCK
    )
    :vars
    (
      ?auto_25230 - BLOCK
      ?auto_25231 - BLOCK
      ?auto_25232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25227 ) ( not ( = ?auto_25227 ?auto_25228 ) ) ( not ( = ?auto_25227 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( ON ?auto_25229 ?auto_25230 ) ( not ( = ?auto_25227 ?auto_25230 ) ) ( not ( = ?auto_25228 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( CLEAR ?auto_25227 ) ( ON ?auto_25228 ?auto_25229 ) ( CLEAR ?auto_25228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25231 ) ( ON ?auto_25232 ?auto_25231 ) ( ON ?auto_25230 ?auto_25232 ) ( not ( = ?auto_25231 ?auto_25232 ) ) ( not ( = ?auto_25231 ?auto_25230 ) ) ( not ( = ?auto_25231 ?auto_25229 ) ) ( not ( = ?auto_25231 ?auto_25228 ) ) ( not ( = ?auto_25232 ?auto_25230 ) ) ( not ( = ?auto_25232 ?auto_25229 ) ) ( not ( = ?auto_25232 ?auto_25228 ) ) ( not ( = ?auto_25227 ?auto_25231 ) ) ( not ( = ?auto_25227 ?auto_25232 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25231 ?auto_25232 ?auto_25230 ?auto_25229 )
      ( MAKE-3PILE ?auto_25227 ?auto_25228 ?auto_25229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25233 - BLOCK
      ?auto_25234 - BLOCK
      ?auto_25235 - BLOCK
    )
    :vars
    (
      ?auto_25237 - BLOCK
      ?auto_25236 - BLOCK
      ?auto_25238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25233 ?auto_25234 ) ) ( not ( = ?auto_25233 ?auto_25235 ) ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( ON ?auto_25235 ?auto_25237 ) ( not ( = ?auto_25233 ?auto_25237 ) ) ( not ( = ?auto_25234 ?auto_25237 ) ) ( not ( = ?auto_25235 ?auto_25237 ) ) ( ON ?auto_25234 ?auto_25235 ) ( CLEAR ?auto_25234 ) ( ON-TABLE ?auto_25236 ) ( ON ?auto_25238 ?auto_25236 ) ( ON ?auto_25237 ?auto_25238 ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( not ( = ?auto_25236 ?auto_25235 ) ) ( not ( = ?auto_25236 ?auto_25234 ) ) ( not ( = ?auto_25238 ?auto_25237 ) ) ( not ( = ?auto_25238 ?auto_25235 ) ) ( not ( = ?auto_25238 ?auto_25234 ) ) ( not ( = ?auto_25233 ?auto_25236 ) ) ( not ( = ?auto_25233 ?auto_25238 ) ) ( HOLDING ?auto_25233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25233 )
      ( MAKE-3PILE ?auto_25233 ?auto_25234 ?auto_25235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25239 - BLOCK
      ?auto_25240 - BLOCK
      ?auto_25241 - BLOCK
    )
    :vars
    (
      ?auto_25242 - BLOCK
      ?auto_25244 - BLOCK
      ?auto_25243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25239 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25241 ) ) ( not ( = ?auto_25240 ?auto_25241 ) ) ( ON ?auto_25241 ?auto_25242 ) ( not ( = ?auto_25239 ?auto_25242 ) ) ( not ( = ?auto_25240 ?auto_25242 ) ) ( not ( = ?auto_25241 ?auto_25242 ) ) ( ON ?auto_25240 ?auto_25241 ) ( ON-TABLE ?auto_25244 ) ( ON ?auto_25243 ?auto_25244 ) ( ON ?auto_25242 ?auto_25243 ) ( not ( = ?auto_25244 ?auto_25243 ) ) ( not ( = ?auto_25244 ?auto_25242 ) ) ( not ( = ?auto_25244 ?auto_25241 ) ) ( not ( = ?auto_25244 ?auto_25240 ) ) ( not ( = ?auto_25243 ?auto_25242 ) ) ( not ( = ?auto_25243 ?auto_25241 ) ) ( not ( = ?auto_25243 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25244 ) ) ( not ( = ?auto_25239 ?auto_25243 ) ) ( ON ?auto_25239 ?auto_25240 ) ( CLEAR ?auto_25239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25244 ?auto_25243 ?auto_25242 ?auto_25241 ?auto_25240 )
      ( MAKE-3PILE ?auto_25239 ?auto_25240 ?auto_25241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25247 - BLOCK
      ?auto_25248 - BLOCK
    )
    :vars
    (
      ?auto_25249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25249 ?auto_25248 ) ( CLEAR ?auto_25249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25247 ) ( ON ?auto_25248 ?auto_25247 ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25247 ?auto_25249 ) ) ( not ( = ?auto_25248 ?auto_25249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25249 ?auto_25248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25250 - BLOCK
      ?auto_25251 - BLOCK
    )
    :vars
    (
      ?auto_25252 - BLOCK
      ?auto_25253 - BLOCK
      ?auto_25254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25252 ?auto_25251 ) ( CLEAR ?auto_25252 ) ( ON-TABLE ?auto_25250 ) ( ON ?auto_25251 ?auto_25250 ) ( not ( = ?auto_25250 ?auto_25251 ) ) ( not ( = ?auto_25250 ?auto_25252 ) ) ( not ( = ?auto_25251 ?auto_25252 ) ) ( HOLDING ?auto_25253 ) ( CLEAR ?auto_25254 ) ( not ( = ?auto_25250 ?auto_25253 ) ) ( not ( = ?auto_25250 ?auto_25254 ) ) ( not ( = ?auto_25251 ?auto_25253 ) ) ( not ( = ?auto_25251 ?auto_25254 ) ) ( not ( = ?auto_25252 ?auto_25253 ) ) ( not ( = ?auto_25252 ?auto_25254 ) ) ( not ( = ?auto_25253 ?auto_25254 ) ) )
    :subtasks
    ( ( !STACK ?auto_25253 ?auto_25254 )
      ( MAKE-2PILE ?auto_25250 ?auto_25251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25255 - BLOCK
      ?auto_25256 - BLOCK
    )
    :vars
    (
      ?auto_25258 - BLOCK
      ?auto_25259 - BLOCK
      ?auto_25257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25258 ?auto_25256 ) ( ON-TABLE ?auto_25255 ) ( ON ?auto_25256 ?auto_25255 ) ( not ( = ?auto_25255 ?auto_25256 ) ) ( not ( = ?auto_25255 ?auto_25258 ) ) ( not ( = ?auto_25256 ?auto_25258 ) ) ( CLEAR ?auto_25259 ) ( not ( = ?auto_25255 ?auto_25257 ) ) ( not ( = ?auto_25255 ?auto_25259 ) ) ( not ( = ?auto_25256 ?auto_25257 ) ) ( not ( = ?auto_25256 ?auto_25259 ) ) ( not ( = ?auto_25258 ?auto_25257 ) ) ( not ( = ?auto_25258 ?auto_25259 ) ) ( not ( = ?auto_25257 ?auto_25259 ) ) ( ON ?auto_25257 ?auto_25258 ) ( CLEAR ?auto_25257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25255 ?auto_25256 ?auto_25258 )
      ( MAKE-2PILE ?auto_25255 ?auto_25256 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25260 - BLOCK
      ?auto_25261 - BLOCK
    )
    :vars
    (
      ?auto_25262 - BLOCK
      ?auto_25263 - BLOCK
      ?auto_25264 - BLOCK
      ?auto_25265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25262 ?auto_25261 ) ( ON-TABLE ?auto_25260 ) ( ON ?auto_25261 ?auto_25260 ) ( not ( = ?auto_25260 ?auto_25261 ) ) ( not ( = ?auto_25260 ?auto_25262 ) ) ( not ( = ?auto_25261 ?auto_25262 ) ) ( not ( = ?auto_25260 ?auto_25263 ) ) ( not ( = ?auto_25260 ?auto_25264 ) ) ( not ( = ?auto_25261 ?auto_25263 ) ) ( not ( = ?auto_25261 ?auto_25264 ) ) ( not ( = ?auto_25262 ?auto_25263 ) ) ( not ( = ?auto_25262 ?auto_25264 ) ) ( not ( = ?auto_25263 ?auto_25264 ) ) ( ON ?auto_25263 ?auto_25262 ) ( CLEAR ?auto_25263 ) ( HOLDING ?auto_25264 ) ( CLEAR ?auto_25265 ) ( ON-TABLE ?auto_25265 ) ( not ( = ?auto_25265 ?auto_25264 ) ) ( not ( = ?auto_25260 ?auto_25265 ) ) ( not ( = ?auto_25261 ?auto_25265 ) ) ( not ( = ?auto_25262 ?auto_25265 ) ) ( not ( = ?auto_25263 ?auto_25265 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25265 ?auto_25264 )
      ( MAKE-2PILE ?auto_25260 ?auto_25261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25684 - BLOCK
      ?auto_25685 - BLOCK
    )
    :vars
    (
      ?auto_25688 - BLOCK
      ?auto_25686 - BLOCK
      ?auto_25687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25688 ?auto_25685 ) ( ON-TABLE ?auto_25684 ) ( ON ?auto_25685 ?auto_25684 ) ( not ( = ?auto_25684 ?auto_25685 ) ) ( not ( = ?auto_25684 ?auto_25688 ) ) ( not ( = ?auto_25685 ?auto_25688 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25685 ?auto_25687 ) ) ( not ( = ?auto_25688 ?auto_25686 ) ) ( not ( = ?auto_25688 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( ON ?auto_25686 ?auto_25688 ) ( ON ?auto_25687 ?auto_25686 ) ( CLEAR ?auto_25687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25684 ?auto_25685 ?auto_25688 ?auto_25686 )
      ( MAKE-2PILE ?auto_25684 ?auto_25685 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25272 - BLOCK
      ?auto_25273 - BLOCK
    )
    :vars
    (
      ?auto_25276 - BLOCK
      ?auto_25274 - BLOCK
      ?auto_25277 - BLOCK
      ?auto_25275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25276 ?auto_25273 ) ( ON-TABLE ?auto_25272 ) ( ON ?auto_25273 ?auto_25272 ) ( not ( = ?auto_25272 ?auto_25273 ) ) ( not ( = ?auto_25272 ?auto_25276 ) ) ( not ( = ?auto_25273 ?auto_25276 ) ) ( not ( = ?auto_25272 ?auto_25274 ) ) ( not ( = ?auto_25272 ?auto_25277 ) ) ( not ( = ?auto_25273 ?auto_25274 ) ) ( not ( = ?auto_25273 ?auto_25277 ) ) ( not ( = ?auto_25276 ?auto_25274 ) ) ( not ( = ?auto_25276 ?auto_25277 ) ) ( not ( = ?auto_25274 ?auto_25277 ) ) ( ON ?auto_25274 ?auto_25276 ) ( not ( = ?auto_25275 ?auto_25277 ) ) ( not ( = ?auto_25272 ?auto_25275 ) ) ( not ( = ?auto_25273 ?auto_25275 ) ) ( not ( = ?auto_25276 ?auto_25275 ) ) ( not ( = ?auto_25274 ?auto_25275 ) ) ( ON ?auto_25277 ?auto_25274 ) ( CLEAR ?auto_25277 ) ( HOLDING ?auto_25275 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25275 )
      ( MAKE-2PILE ?auto_25272 ?auto_25273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25278 - BLOCK
      ?auto_25279 - BLOCK
    )
    :vars
    (
      ?auto_25283 - BLOCK
      ?auto_25281 - BLOCK
      ?auto_25282 - BLOCK
      ?auto_25280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25283 ?auto_25279 ) ( ON-TABLE ?auto_25278 ) ( ON ?auto_25279 ?auto_25278 ) ( not ( = ?auto_25278 ?auto_25279 ) ) ( not ( = ?auto_25278 ?auto_25283 ) ) ( not ( = ?auto_25279 ?auto_25283 ) ) ( not ( = ?auto_25278 ?auto_25281 ) ) ( not ( = ?auto_25278 ?auto_25282 ) ) ( not ( = ?auto_25279 ?auto_25281 ) ) ( not ( = ?auto_25279 ?auto_25282 ) ) ( not ( = ?auto_25283 ?auto_25281 ) ) ( not ( = ?auto_25283 ?auto_25282 ) ) ( not ( = ?auto_25281 ?auto_25282 ) ) ( ON ?auto_25281 ?auto_25283 ) ( not ( = ?auto_25280 ?auto_25282 ) ) ( not ( = ?auto_25278 ?auto_25280 ) ) ( not ( = ?auto_25279 ?auto_25280 ) ) ( not ( = ?auto_25283 ?auto_25280 ) ) ( not ( = ?auto_25281 ?auto_25280 ) ) ( ON ?auto_25282 ?auto_25281 ) ( ON ?auto_25280 ?auto_25282 ) ( CLEAR ?auto_25280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25278 ?auto_25279 ?auto_25283 ?auto_25281 ?auto_25282 )
      ( MAKE-2PILE ?auto_25278 ?auto_25279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25288 - BLOCK
      ?auto_25289 - BLOCK
      ?auto_25290 - BLOCK
      ?auto_25291 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25291 ) ( CLEAR ?auto_25290 ) ( ON-TABLE ?auto_25288 ) ( ON ?auto_25289 ?auto_25288 ) ( ON ?auto_25290 ?auto_25289 ) ( not ( = ?auto_25288 ?auto_25289 ) ) ( not ( = ?auto_25288 ?auto_25290 ) ) ( not ( = ?auto_25288 ?auto_25291 ) ) ( not ( = ?auto_25289 ?auto_25290 ) ) ( not ( = ?auto_25289 ?auto_25291 ) ) ( not ( = ?auto_25290 ?auto_25291 ) ) )
    :subtasks
    ( ( !STACK ?auto_25291 ?auto_25290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25292 - BLOCK
      ?auto_25293 - BLOCK
      ?auto_25294 - BLOCK
      ?auto_25295 - BLOCK
    )
    :vars
    (
      ?auto_25296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25294 ) ( ON-TABLE ?auto_25292 ) ( ON ?auto_25293 ?auto_25292 ) ( ON ?auto_25294 ?auto_25293 ) ( not ( = ?auto_25292 ?auto_25293 ) ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25292 ?auto_25295 ) ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( not ( = ?auto_25293 ?auto_25295 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( ON ?auto_25295 ?auto_25296 ) ( CLEAR ?auto_25295 ) ( HAND-EMPTY ) ( not ( = ?auto_25292 ?auto_25296 ) ) ( not ( = ?auto_25293 ?auto_25296 ) ) ( not ( = ?auto_25294 ?auto_25296 ) ) ( not ( = ?auto_25295 ?auto_25296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25295 ?auto_25296 )
      ( MAKE-4PILE ?auto_25292 ?auto_25293 ?auto_25294 ?auto_25295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25297 - BLOCK
      ?auto_25298 - BLOCK
      ?auto_25299 - BLOCK
      ?auto_25300 - BLOCK
    )
    :vars
    (
      ?auto_25301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25297 ) ( ON ?auto_25298 ?auto_25297 ) ( not ( = ?auto_25297 ?auto_25298 ) ) ( not ( = ?auto_25297 ?auto_25299 ) ) ( not ( = ?auto_25297 ?auto_25300 ) ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( ON ?auto_25300 ?auto_25301 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25297 ?auto_25301 ) ) ( not ( = ?auto_25298 ?auto_25301 ) ) ( not ( = ?auto_25299 ?auto_25301 ) ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( HOLDING ?auto_25299 ) ( CLEAR ?auto_25298 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25297 ?auto_25298 ?auto_25299 )
      ( MAKE-4PILE ?auto_25297 ?auto_25298 ?auto_25299 ?auto_25300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25302 - BLOCK
      ?auto_25303 - BLOCK
      ?auto_25304 - BLOCK
      ?auto_25305 - BLOCK
    )
    :vars
    (
      ?auto_25306 - BLOCK
      ?auto_25307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25302 ) ( ON ?auto_25303 ?auto_25302 ) ( not ( = ?auto_25302 ?auto_25303 ) ) ( not ( = ?auto_25302 ?auto_25304 ) ) ( not ( = ?auto_25302 ?auto_25305 ) ) ( not ( = ?auto_25303 ?auto_25304 ) ) ( not ( = ?auto_25303 ?auto_25305 ) ) ( not ( = ?auto_25304 ?auto_25305 ) ) ( ON ?auto_25305 ?auto_25306 ) ( not ( = ?auto_25302 ?auto_25306 ) ) ( not ( = ?auto_25303 ?auto_25306 ) ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25305 ?auto_25306 ) ) ( CLEAR ?auto_25303 ) ( ON ?auto_25304 ?auto_25305 ) ( CLEAR ?auto_25304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25307 ) ( ON ?auto_25306 ?auto_25307 ) ( not ( = ?auto_25307 ?auto_25306 ) ) ( not ( = ?auto_25307 ?auto_25305 ) ) ( not ( = ?auto_25307 ?auto_25304 ) ) ( not ( = ?auto_25302 ?auto_25307 ) ) ( not ( = ?auto_25303 ?auto_25307 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25307 ?auto_25306 ?auto_25305 )
      ( MAKE-4PILE ?auto_25302 ?auto_25303 ?auto_25304 ?auto_25305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25308 - BLOCK
      ?auto_25309 - BLOCK
      ?auto_25310 - BLOCK
      ?auto_25311 - BLOCK
    )
    :vars
    (
      ?auto_25312 - BLOCK
      ?auto_25313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25308 ) ( not ( = ?auto_25308 ?auto_25309 ) ) ( not ( = ?auto_25308 ?auto_25310 ) ) ( not ( = ?auto_25308 ?auto_25311 ) ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25311 ) ) ( not ( = ?auto_25310 ?auto_25311 ) ) ( ON ?auto_25311 ?auto_25312 ) ( not ( = ?auto_25308 ?auto_25312 ) ) ( not ( = ?auto_25309 ?auto_25312 ) ) ( not ( = ?auto_25310 ?auto_25312 ) ) ( not ( = ?auto_25311 ?auto_25312 ) ) ( ON ?auto_25310 ?auto_25311 ) ( CLEAR ?auto_25310 ) ( ON-TABLE ?auto_25313 ) ( ON ?auto_25312 ?auto_25313 ) ( not ( = ?auto_25313 ?auto_25312 ) ) ( not ( = ?auto_25313 ?auto_25311 ) ) ( not ( = ?auto_25313 ?auto_25310 ) ) ( not ( = ?auto_25308 ?auto_25313 ) ) ( not ( = ?auto_25309 ?auto_25313 ) ) ( HOLDING ?auto_25309 ) ( CLEAR ?auto_25308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25308 ?auto_25309 )
      ( MAKE-4PILE ?auto_25308 ?auto_25309 ?auto_25310 ?auto_25311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25314 - BLOCK
      ?auto_25315 - BLOCK
      ?auto_25316 - BLOCK
      ?auto_25317 - BLOCK
    )
    :vars
    (
      ?auto_25319 - BLOCK
      ?auto_25318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25314 ) ( not ( = ?auto_25314 ?auto_25315 ) ) ( not ( = ?auto_25314 ?auto_25316 ) ) ( not ( = ?auto_25314 ?auto_25317 ) ) ( not ( = ?auto_25315 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25317 ) ) ( not ( = ?auto_25316 ?auto_25317 ) ) ( ON ?auto_25317 ?auto_25319 ) ( not ( = ?auto_25314 ?auto_25319 ) ) ( not ( = ?auto_25315 ?auto_25319 ) ) ( not ( = ?auto_25316 ?auto_25319 ) ) ( not ( = ?auto_25317 ?auto_25319 ) ) ( ON ?auto_25316 ?auto_25317 ) ( ON-TABLE ?auto_25318 ) ( ON ?auto_25319 ?auto_25318 ) ( not ( = ?auto_25318 ?auto_25319 ) ) ( not ( = ?auto_25318 ?auto_25317 ) ) ( not ( = ?auto_25318 ?auto_25316 ) ) ( not ( = ?auto_25314 ?auto_25318 ) ) ( not ( = ?auto_25315 ?auto_25318 ) ) ( CLEAR ?auto_25314 ) ( ON ?auto_25315 ?auto_25316 ) ( CLEAR ?auto_25315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25318 ?auto_25319 ?auto_25317 ?auto_25316 )
      ( MAKE-4PILE ?auto_25314 ?auto_25315 ?auto_25316 ?auto_25317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25320 - BLOCK
      ?auto_25321 - BLOCK
      ?auto_25322 - BLOCK
      ?auto_25323 - BLOCK
    )
    :vars
    (
      ?auto_25324 - BLOCK
      ?auto_25325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25320 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25322 ) ) ( not ( = ?auto_25320 ?auto_25323 ) ) ( not ( = ?auto_25321 ?auto_25322 ) ) ( not ( = ?auto_25321 ?auto_25323 ) ) ( not ( = ?auto_25322 ?auto_25323 ) ) ( ON ?auto_25323 ?auto_25324 ) ( not ( = ?auto_25320 ?auto_25324 ) ) ( not ( = ?auto_25321 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25323 ?auto_25324 ) ) ( ON ?auto_25322 ?auto_25323 ) ( ON-TABLE ?auto_25325 ) ( ON ?auto_25324 ?auto_25325 ) ( not ( = ?auto_25325 ?auto_25324 ) ) ( not ( = ?auto_25325 ?auto_25323 ) ) ( not ( = ?auto_25325 ?auto_25322 ) ) ( not ( = ?auto_25320 ?auto_25325 ) ) ( not ( = ?auto_25321 ?auto_25325 ) ) ( ON ?auto_25321 ?auto_25322 ) ( CLEAR ?auto_25321 ) ( HOLDING ?auto_25320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25320 )
      ( MAKE-4PILE ?auto_25320 ?auto_25321 ?auto_25322 ?auto_25323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25326 - BLOCK
      ?auto_25327 - BLOCK
      ?auto_25328 - BLOCK
      ?auto_25329 - BLOCK
    )
    :vars
    (
      ?auto_25331 - BLOCK
      ?auto_25330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25326 ?auto_25328 ) ) ( not ( = ?auto_25326 ?auto_25329 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25329 ) ) ( not ( = ?auto_25328 ?auto_25329 ) ) ( ON ?auto_25329 ?auto_25331 ) ( not ( = ?auto_25326 ?auto_25331 ) ) ( not ( = ?auto_25327 ?auto_25331 ) ) ( not ( = ?auto_25328 ?auto_25331 ) ) ( not ( = ?auto_25329 ?auto_25331 ) ) ( ON ?auto_25328 ?auto_25329 ) ( ON-TABLE ?auto_25330 ) ( ON ?auto_25331 ?auto_25330 ) ( not ( = ?auto_25330 ?auto_25331 ) ) ( not ( = ?auto_25330 ?auto_25329 ) ) ( not ( = ?auto_25330 ?auto_25328 ) ) ( not ( = ?auto_25326 ?auto_25330 ) ) ( not ( = ?auto_25327 ?auto_25330 ) ) ( ON ?auto_25327 ?auto_25328 ) ( ON ?auto_25326 ?auto_25327 ) ( CLEAR ?auto_25326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25330 ?auto_25331 ?auto_25329 ?auto_25328 ?auto_25327 )
      ( MAKE-4PILE ?auto_25326 ?auto_25327 ?auto_25328 ?auto_25329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25333 - BLOCK
    )
    :vars
    (
      ?auto_25334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25334 ?auto_25333 ) ( CLEAR ?auto_25334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25333 ) ( not ( = ?auto_25333 ?auto_25334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25334 ?auto_25333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25335 - BLOCK
    )
    :vars
    (
      ?auto_25336 - BLOCK
      ?auto_25337 - BLOCK
      ?auto_25338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25336 ?auto_25335 ) ( CLEAR ?auto_25336 ) ( ON-TABLE ?auto_25335 ) ( not ( = ?auto_25335 ?auto_25336 ) ) ( HOLDING ?auto_25337 ) ( CLEAR ?auto_25338 ) ( not ( = ?auto_25335 ?auto_25337 ) ) ( not ( = ?auto_25335 ?auto_25338 ) ) ( not ( = ?auto_25336 ?auto_25337 ) ) ( not ( = ?auto_25336 ?auto_25338 ) ) ( not ( = ?auto_25337 ?auto_25338 ) ) )
    :subtasks
    ( ( !STACK ?auto_25337 ?auto_25338 )
      ( MAKE-1PILE ?auto_25335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25339 - BLOCK
    )
    :vars
    (
      ?auto_25342 - BLOCK
      ?auto_25341 - BLOCK
      ?auto_25340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25342 ?auto_25339 ) ( ON-TABLE ?auto_25339 ) ( not ( = ?auto_25339 ?auto_25342 ) ) ( CLEAR ?auto_25341 ) ( not ( = ?auto_25339 ?auto_25340 ) ) ( not ( = ?auto_25339 ?auto_25341 ) ) ( not ( = ?auto_25342 ?auto_25340 ) ) ( not ( = ?auto_25342 ?auto_25341 ) ) ( not ( = ?auto_25340 ?auto_25341 ) ) ( ON ?auto_25340 ?auto_25342 ) ( CLEAR ?auto_25340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25339 ?auto_25342 )
      ( MAKE-1PILE ?auto_25339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25343 - BLOCK
    )
    :vars
    (
      ?auto_25344 - BLOCK
      ?auto_25345 - BLOCK
      ?auto_25346 - BLOCK
      ?auto_25347 - BLOCK
      ?auto_25348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25344 ?auto_25343 ) ( ON-TABLE ?auto_25343 ) ( not ( = ?auto_25343 ?auto_25344 ) ) ( not ( = ?auto_25343 ?auto_25345 ) ) ( not ( = ?auto_25343 ?auto_25346 ) ) ( not ( = ?auto_25344 ?auto_25345 ) ) ( not ( = ?auto_25344 ?auto_25346 ) ) ( not ( = ?auto_25345 ?auto_25346 ) ) ( ON ?auto_25345 ?auto_25344 ) ( CLEAR ?auto_25345 ) ( HOLDING ?auto_25346 ) ( CLEAR ?auto_25347 ) ( ON-TABLE ?auto_25348 ) ( ON ?auto_25347 ?auto_25348 ) ( not ( = ?auto_25348 ?auto_25347 ) ) ( not ( = ?auto_25348 ?auto_25346 ) ) ( not ( = ?auto_25347 ?auto_25346 ) ) ( not ( = ?auto_25343 ?auto_25347 ) ) ( not ( = ?auto_25343 ?auto_25348 ) ) ( not ( = ?auto_25344 ?auto_25347 ) ) ( not ( = ?auto_25344 ?auto_25348 ) ) ( not ( = ?auto_25345 ?auto_25347 ) ) ( not ( = ?auto_25345 ?auto_25348 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25348 ?auto_25347 ?auto_25346 )
      ( MAKE-1PILE ?auto_25343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25349 - BLOCK
    )
    :vars
    (
      ?auto_25354 - BLOCK
      ?auto_25352 - BLOCK
      ?auto_25351 - BLOCK
      ?auto_25350 - BLOCK
      ?auto_25353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25354 ?auto_25349 ) ( ON-TABLE ?auto_25349 ) ( not ( = ?auto_25349 ?auto_25354 ) ) ( not ( = ?auto_25349 ?auto_25352 ) ) ( not ( = ?auto_25349 ?auto_25351 ) ) ( not ( = ?auto_25354 ?auto_25352 ) ) ( not ( = ?auto_25354 ?auto_25351 ) ) ( not ( = ?auto_25352 ?auto_25351 ) ) ( ON ?auto_25352 ?auto_25354 ) ( CLEAR ?auto_25350 ) ( ON-TABLE ?auto_25353 ) ( ON ?auto_25350 ?auto_25353 ) ( not ( = ?auto_25353 ?auto_25350 ) ) ( not ( = ?auto_25353 ?auto_25351 ) ) ( not ( = ?auto_25350 ?auto_25351 ) ) ( not ( = ?auto_25349 ?auto_25350 ) ) ( not ( = ?auto_25349 ?auto_25353 ) ) ( not ( = ?auto_25354 ?auto_25350 ) ) ( not ( = ?auto_25354 ?auto_25353 ) ) ( not ( = ?auto_25352 ?auto_25350 ) ) ( not ( = ?auto_25352 ?auto_25353 ) ) ( ON ?auto_25351 ?auto_25352 ) ( CLEAR ?auto_25351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25349 ?auto_25354 ?auto_25352 )
      ( MAKE-1PILE ?auto_25349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25355 - BLOCK
    )
    :vars
    (
      ?auto_25358 - BLOCK
      ?auto_25356 - BLOCK
      ?auto_25360 - BLOCK
      ?auto_25359 - BLOCK
      ?auto_25357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25358 ?auto_25355 ) ( ON-TABLE ?auto_25355 ) ( not ( = ?auto_25355 ?auto_25358 ) ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25355 ?auto_25360 ) ) ( not ( = ?auto_25358 ?auto_25356 ) ) ( not ( = ?auto_25358 ?auto_25360 ) ) ( not ( = ?auto_25356 ?auto_25360 ) ) ( ON ?auto_25356 ?auto_25358 ) ( ON-TABLE ?auto_25359 ) ( not ( = ?auto_25359 ?auto_25357 ) ) ( not ( = ?auto_25359 ?auto_25360 ) ) ( not ( = ?auto_25357 ?auto_25360 ) ) ( not ( = ?auto_25355 ?auto_25357 ) ) ( not ( = ?auto_25355 ?auto_25359 ) ) ( not ( = ?auto_25358 ?auto_25357 ) ) ( not ( = ?auto_25358 ?auto_25359 ) ) ( not ( = ?auto_25356 ?auto_25357 ) ) ( not ( = ?auto_25356 ?auto_25359 ) ) ( ON ?auto_25360 ?auto_25356 ) ( CLEAR ?auto_25360 ) ( HOLDING ?auto_25357 ) ( CLEAR ?auto_25359 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25359 ?auto_25357 )
      ( MAKE-1PILE ?auto_25355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25824 - BLOCK
    )
    :vars
    (
      ?auto_25825 - BLOCK
      ?auto_25828 - BLOCK
      ?auto_25827 - BLOCK
      ?auto_25826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25825 ?auto_25824 ) ( ON-TABLE ?auto_25824 ) ( not ( = ?auto_25824 ?auto_25825 ) ) ( not ( = ?auto_25824 ?auto_25828 ) ) ( not ( = ?auto_25824 ?auto_25827 ) ) ( not ( = ?auto_25825 ?auto_25828 ) ) ( not ( = ?auto_25825 ?auto_25827 ) ) ( not ( = ?auto_25828 ?auto_25827 ) ) ( ON ?auto_25828 ?auto_25825 ) ( not ( = ?auto_25826 ?auto_25827 ) ) ( not ( = ?auto_25824 ?auto_25826 ) ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25828 ?auto_25826 ) ) ( ON ?auto_25827 ?auto_25828 ) ( ON ?auto_25826 ?auto_25827 ) ( CLEAR ?auto_25826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25824 ?auto_25825 ?auto_25828 ?auto_25827 )
      ( MAKE-1PILE ?auto_25824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25367 - BLOCK
    )
    :vars
    (
      ?auto_25368 - BLOCK
      ?auto_25371 - BLOCK
      ?auto_25370 - BLOCK
      ?auto_25369 - BLOCK
      ?auto_25372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25368 ?auto_25367 ) ( ON-TABLE ?auto_25367 ) ( not ( = ?auto_25367 ?auto_25368 ) ) ( not ( = ?auto_25367 ?auto_25371 ) ) ( not ( = ?auto_25367 ?auto_25370 ) ) ( not ( = ?auto_25368 ?auto_25371 ) ) ( not ( = ?auto_25368 ?auto_25370 ) ) ( not ( = ?auto_25371 ?auto_25370 ) ) ( ON ?auto_25371 ?auto_25368 ) ( not ( = ?auto_25369 ?auto_25372 ) ) ( not ( = ?auto_25369 ?auto_25370 ) ) ( not ( = ?auto_25372 ?auto_25370 ) ) ( not ( = ?auto_25367 ?auto_25372 ) ) ( not ( = ?auto_25367 ?auto_25369 ) ) ( not ( = ?auto_25368 ?auto_25372 ) ) ( not ( = ?auto_25368 ?auto_25369 ) ) ( not ( = ?auto_25371 ?auto_25372 ) ) ( not ( = ?auto_25371 ?auto_25369 ) ) ( ON ?auto_25370 ?auto_25371 ) ( ON ?auto_25372 ?auto_25370 ) ( CLEAR ?auto_25372 ) ( HOLDING ?auto_25369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25369 )
      ( MAKE-1PILE ?auto_25367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25373 - BLOCK
    )
    :vars
    (
      ?auto_25375 - BLOCK
      ?auto_25378 - BLOCK
      ?auto_25374 - BLOCK
      ?auto_25377 - BLOCK
      ?auto_25376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25375 ?auto_25373 ) ( ON-TABLE ?auto_25373 ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25373 ?auto_25378 ) ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25375 ?auto_25378 ) ) ( not ( = ?auto_25375 ?auto_25374 ) ) ( not ( = ?auto_25378 ?auto_25374 ) ) ( ON ?auto_25378 ?auto_25375 ) ( not ( = ?auto_25377 ?auto_25376 ) ) ( not ( = ?auto_25377 ?auto_25374 ) ) ( not ( = ?auto_25376 ?auto_25374 ) ) ( not ( = ?auto_25373 ?auto_25376 ) ) ( not ( = ?auto_25373 ?auto_25377 ) ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( not ( = ?auto_25375 ?auto_25377 ) ) ( not ( = ?auto_25378 ?auto_25376 ) ) ( not ( = ?auto_25378 ?auto_25377 ) ) ( ON ?auto_25374 ?auto_25378 ) ( ON ?auto_25376 ?auto_25374 ) ( ON ?auto_25377 ?auto_25376 ) ( CLEAR ?auto_25377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25373 ?auto_25375 ?auto_25378 ?auto_25374 ?auto_25376 )
      ( MAKE-1PILE ?auto_25373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25384 - BLOCK
      ?auto_25385 - BLOCK
      ?auto_25386 - BLOCK
      ?auto_25387 - BLOCK
      ?auto_25388 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_25388 ) ( CLEAR ?auto_25387 ) ( ON-TABLE ?auto_25384 ) ( ON ?auto_25385 ?auto_25384 ) ( ON ?auto_25386 ?auto_25385 ) ( ON ?auto_25387 ?auto_25386 ) ( not ( = ?auto_25384 ?auto_25385 ) ) ( not ( = ?auto_25384 ?auto_25386 ) ) ( not ( = ?auto_25384 ?auto_25387 ) ) ( not ( = ?auto_25384 ?auto_25388 ) ) ( not ( = ?auto_25385 ?auto_25386 ) ) ( not ( = ?auto_25385 ?auto_25387 ) ) ( not ( = ?auto_25385 ?auto_25388 ) ) ( not ( = ?auto_25386 ?auto_25387 ) ) ( not ( = ?auto_25386 ?auto_25388 ) ) ( not ( = ?auto_25387 ?auto_25388 ) ) )
    :subtasks
    ( ( !STACK ?auto_25388 ?auto_25387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25389 - BLOCK
      ?auto_25390 - BLOCK
      ?auto_25391 - BLOCK
      ?auto_25392 - BLOCK
      ?auto_25393 - BLOCK
    )
    :vars
    (
      ?auto_25394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25392 ) ( ON-TABLE ?auto_25389 ) ( ON ?auto_25390 ?auto_25389 ) ( ON ?auto_25391 ?auto_25390 ) ( ON ?auto_25392 ?auto_25391 ) ( not ( = ?auto_25389 ?auto_25390 ) ) ( not ( = ?auto_25389 ?auto_25391 ) ) ( not ( = ?auto_25389 ?auto_25392 ) ) ( not ( = ?auto_25389 ?auto_25393 ) ) ( not ( = ?auto_25390 ?auto_25391 ) ) ( not ( = ?auto_25390 ?auto_25392 ) ) ( not ( = ?auto_25390 ?auto_25393 ) ) ( not ( = ?auto_25391 ?auto_25392 ) ) ( not ( = ?auto_25391 ?auto_25393 ) ) ( not ( = ?auto_25392 ?auto_25393 ) ) ( ON ?auto_25393 ?auto_25394 ) ( CLEAR ?auto_25393 ) ( HAND-EMPTY ) ( not ( = ?auto_25389 ?auto_25394 ) ) ( not ( = ?auto_25390 ?auto_25394 ) ) ( not ( = ?auto_25391 ?auto_25394 ) ) ( not ( = ?auto_25392 ?auto_25394 ) ) ( not ( = ?auto_25393 ?auto_25394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25393 ?auto_25394 )
      ( MAKE-5PILE ?auto_25389 ?auto_25390 ?auto_25391 ?auto_25392 ?auto_25393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25395 - BLOCK
      ?auto_25396 - BLOCK
      ?auto_25397 - BLOCK
      ?auto_25398 - BLOCK
      ?auto_25399 - BLOCK
    )
    :vars
    (
      ?auto_25400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25395 ) ( ON ?auto_25396 ?auto_25395 ) ( ON ?auto_25397 ?auto_25396 ) ( not ( = ?auto_25395 ?auto_25396 ) ) ( not ( = ?auto_25395 ?auto_25397 ) ) ( not ( = ?auto_25395 ?auto_25398 ) ) ( not ( = ?auto_25395 ?auto_25399 ) ) ( not ( = ?auto_25396 ?auto_25397 ) ) ( not ( = ?auto_25396 ?auto_25398 ) ) ( not ( = ?auto_25396 ?auto_25399 ) ) ( not ( = ?auto_25397 ?auto_25398 ) ) ( not ( = ?auto_25397 ?auto_25399 ) ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( ON ?auto_25399 ?auto_25400 ) ( CLEAR ?auto_25399 ) ( not ( = ?auto_25395 ?auto_25400 ) ) ( not ( = ?auto_25396 ?auto_25400 ) ) ( not ( = ?auto_25397 ?auto_25400 ) ) ( not ( = ?auto_25398 ?auto_25400 ) ) ( not ( = ?auto_25399 ?auto_25400 ) ) ( HOLDING ?auto_25398 ) ( CLEAR ?auto_25397 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25395 ?auto_25396 ?auto_25397 ?auto_25398 )
      ( MAKE-5PILE ?auto_25395 ?auto_25396 ?auto_25397 ?auto_25398 ?auto_25399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25401 - BLOCK
      ?auto_25402 - BLOCK
      ?auto_25403 - BLOCK
      ?auto_25404 - BLOCK
      ?auto_25405 - BLOCK
    )
    :vars
    (
      ?auto_25406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25401 ) ( ON ?auto_25402 ?auto_25401 ) ( ON ?auto_25403 ?auto_25402 ) ( not ( = ?auto_25401 ?auto_25402 ) ) ( not ( = ?auto_25401 ?auto_25403 ) ) ( not ( = ?auto_25401 ?auto_25404 ) ) ( not ( = ?auto_25401 ?auto_25405 ) ) ( not ( = ?auto_25402 ?auto_25403 ) ) ( not ( = ?auto_25402 ?auto_25404 ) ) ( not ( = ?auto_25402 ?auto_25405 ) ) ( not ( = ?auto_25403 ?auto_25404 ) ) ( not ( = ?auto_25403 ?auto_25405 ) ) ( not ( = ?auto_25404 ?auto_25405 ) ) ( ON ?auto_25405 ?auto_25406 ) ( not ( = ?auto_25401 ?auto_25406 ) ) ( not ( = ?auto_25402 ?auto_25406 ) ) ( not ( = ?auto_25403 ?auto_25406 ) ) ( not ( = ?auto_25404 ?auto_25406 ) ) ( not ( = ?auto_25405 ?auto_25406 ) ) ( CLEAR ?auto_25403 ) ( ON ?auto_25404 ?auto_25405 ) ( CLEAR ?auto_25404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25406 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25406 ?auto_25405 )
      ( MAKE-5PILE ?auto_25401 ?auto_25402 ?auto_25403 ?auto_25404 ?auto_25405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25407 - BLOCK
      ?auto_25408 - BLOCK
      ?auto_25409 - BLOCK
      ?auto_25410 - BLOCK
      ?auto_25411 - BLOCK
    )
    :vars
    (
      ?auto_25412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25407 ) ( ON ?auto_25408 ?auto_25407 ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25410 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25410 ) ) ( not ( = ?auto_25408 ?auto_25411 ) ) ( not ( = ?auto_25409 ?auto_25410 ) ) ( not ( = ?auto_25409 ?auto_25411 ) ) ( not ( = ?auto_25410 ?auto_25411 ) ) ( ON ?auto_25411 ?auto_25412 ) ( not ( = ?auto_25407 ?auto_25412 ) ) ( not ( = ?auto_25408 ?auto_25412 ) ) ( not ( = ?auto_25409 ?auto_25412 ) ) ( not ( = ?auto_25410 ?auto_25412 ) ) ( not ( = ?auto_25411 ?auto_25412 ) ) ( ON ?auto_25410 ?auto_25411 ) ( CLEAR ?auto_25410 ) ( ON-TABLE ?auto_25412 ) ( HOLDING ?auto_25409 ) ( CLEAR ?auto_25408 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25407 ?auto_25408 ?auto_25409 )
      ( MAKE-5PILE ?auto_25407 ?auto_25408 ?auto_25409 ?auto_25410 ?auto_25411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25413 - BLOCK
      ?auto_25414 - BLOCK
      ?auto_25415 - BLOCK
      ?auto_25416 - BLOCK
      ?auto_25417 - BLOCK
    )
    :vars
    (
      ?auto_25418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25413 ) ( ON ?auto_25414 ?auto_25413 ) ( not ( = ?auto_25413 ?auto_25414 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( not ( = ?auto_25413 ?auto_25416 ) ) ( not ( = ?auto_25413 ?auto_25417 ) ) ( not ( = ?auto_25414 ?auto_25415 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) ( not ( = ?auto_25414 ?auto_25417 ) ) ( not ( = ?auto_25415 ?auto_25416 ) ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( ON ?auto_25417 ?auto_25418 ) ( not ( = ?auto_25413 ?auto_25418 ) ) ( not ( = ?auto_25414 ?auto_25418 ) ) ( not ( = ?auto_25415 ?auto_25418 ) ) ( not ( = ?auto_25416 ?auto_25418 ) ) ( not ( = ?auto_25417 ?auto_25418 ) ) ( ON ?auto_25416 ?auto_25417 ) ( ON-TABLE ?auto_25418 ) ( CLEAR ?auto_25414 ) ( ON ?auto_25415 ?auto_25416 ) ( CLEAR ?auto_25415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25418 ?auto_25417 ?auto_25416 )
      ( MAKE-5PILE ?auto_25413 ?auto_25414 ?auto_25415 ?auto_25416 ?auto_25417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25419 - BLOCK
      ?auto_25420 - BLOCK
      ?auto_25421 - BLOCK
      ?auto_25422 - BLOCK
      ?auto_25423 - BLOCK
    )
    :vars
    (
      ?auto_25424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25419 ) ( not ( = ?auto_25419 ?auto_25420 ) ) ( not ( = ?auto_25419 ?auto_25421 ) ) ( not ( = ?auto_25419 ?auto_25422 ) ) ( not ( = ?auto_25419 ?auto_25423 ) ) ( not ( = ?auto_25420 ?auto_25421 ) ) ( not ( = ?auto_25420 ?auto_25422 ) ) ( not ( = ?auto_25420 ?auto_25423 ) ) ( not ( = ?auto_25421 ?auto_25422 ) ) ( not ( = ?auto_25421 ?auto_25423 ) ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( ON ?auto_25423 ?auto_25424 ) ( not ( = ?auto_25419 ?auto_25424 ) ) ( not ( = ?auto_25420 ?auto_25424 ) ) ( not ( = ?auto_25421 ?auto_25424 ) ) ( not ( = ?auto_25422 ?auto_25424 ) ) ( not ( = ?auto_25423 ?auto_25424 ) ) ( ON ?auto_25422 ?auto_25423 ) ( ON-TABLE ?auto_25424 ) ( ON ?auto_25421 ?auto_25422 ) ( CLEAR ?auto_25421 ) ( HOLDING ?auto_25420 ) ( CLEAR ?auto_25419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25419 ?auto_25420 )
      ( MAKE-5PILE ?auto_25419 ?auto_25420 ?auto_25421 ?auto_25422 ?auto_25423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25425 - BLOCK
      ?auto_25426 - BLOCK
      ?auto_25427 - BLOCK
      ?auto_25428 - BLOCK
      ?auto_25429 - BLOCK
    )
    :vars
    (
      ?auto_25430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25425 ) ( not ( = ?auto_25425 ?auto_25426 ) ) ( not ( = ?auto_25425 ?auto_25427 ) ) ( not ( = ?auto_25425 ?auto_25428 ) ) ( not ( = ?auto_25425 ?auto_25429 ) ) ( not ( = ?auto_25426 ?auto_25427 ) ) ( not ( = ?auto_25426 ?auto_25428 ) ) ( not ( = ?auto_25426 ?auto_25429 ) ) ( not ( = ?auto_25427 ?auto_25428 ) ) ( not ( = ?auto_25427 ?auto_25429 ) ) ( not ( = ?auto_25428 ?auto_25429 ) ) ( ON ?auto_25429 ?auto_25430 ) ( not ( = ?auto_25425 ?auto_25430 ) ) ( not ( = ?auto_25426 ?auto_25430 ) ) ( not ( = ?auto_25427 ?auto_25430 ) ) ( not ( = ?auto_25428 ?auto_25430 ) ) ( not ( = ?auto_25429 ?auto_25430 ) ) ( ON ?auto_25428 ?auto_25429 ) ( ON-TABLE ?auto_25430 ) ( ON ?auto_25427 ?auto_25428 ) ( CLEAR ?auto_25425 ) ( ON ?auto_25426 ?auto_25427 ) ( CLEAR ?auto_25426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25430 ?auto_25429 ?auto_25428 ?auto_25427 )
      ( MAKE-5PILE ?auto_25425 ?auto_25426 ?auto_25427 ?auto_25428 ?auto_25429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25431 - BLOCK
      ?auto_25432 - BLOCK
      ?auto_25433 - BLOCK
      ?auto_25434 - BLOCK
      ?auto_25435 - BLOCK
    )
    :vars
    (
      ?auto_25436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25434 ) ) ( not ( = ?auto_25431 ?auto_25435 ) ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25432 ?auto_25434 ) ) ( not ( = ?auto_25432 ?auto_25435 ) ) ( not ( = ?auto_25433 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25435 ) ) ( not ( = ?auto_25434 ?auto_25435 ) ) ( ON ?auto_25435 ?auto_25436 ) ( not ( = ?auto_25431 ?auto_25436 ) ) ( not ( = ?auto_25432 ?auto_25436 ) ) ( not ( = ?auto_25433 ?auto_25436 ) ) ( not ( = ?auto_25434 ?auto_25436 ) ) ( not ( = ?auto_25435 ?auto_25436 ) ) ( ON ?auto_25434 ?auto_25435 ) ( ON-TABLE ?auto_25436 ) ( ON ?auto_25433 ?auto_25434 ) ( ON ?auto_25432 ?auto_25433 ) ( CLEAR ?auto_25432 ) ( HOLDING ?auto_25431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25431 )
      ( MAKE-5PILE ?auto_25431 ?auto_25432 ?auto_25433 ?auto_25434 ?auto_25435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25437 - BLOCK
      ?auto_25438 - BLOCK
      ?auto_25439 - BLOCK
      ?auto_25440 - BLOCK
      ?auto_25441 - BLOCK
    )
    :vars
    (
      ?auto_25442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25437 ?auto_25438 ) ) ( not ( = ?auto_25437 ?auto_25439 ) ) ( not ( = ?auto_25437 ?auto_25440 ) ) ( not ( = ?auto_25437 ?auto_25441 ) ) ( not ( = ?auto_25438 ?auto_25439 ) ) ( not ( = ?auto_25438 ?auto_25440 ) ) ( not ( = ?auto_25438 ?auto_25441 ) ) ( not ( = ?auto_25439 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25441 ) ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( ON ?auto_25441 ?auto_25442 ) ( not ( = ?auto_25437 ?auto_25442 ) ) ( not ( = ?auto_25438 ?auto_25442 ) ) ( not ( = ?auto_25439 ?auto_25442 ) ) ( not ( = ?auto_25440 ?auto_25442 ) ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( ON ?auto_25440 ?auto_25441 ) ( ON-TABLE ?auto_25442 ) ( ON ?auto_25439 ?auto_25440 ) ( ON ?auto_25438 ?auto_25439 ) ( ON ?auto_25437 ?auto_25438 ) ( CLEAR ?auto_25437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25442 ?auto_25441 ?auto_25440 ?auto_25439 ?auto_25438 )
      ( MAKE-5PILE ?auto_25437 ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25501 - BLOCK
    )
    :vars
    (
      ?auto_25502 - BLOCK
      ?auto_25503 - BLOCK
      ?auto_25504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25501 ?auto_25502 ) ( CLEAR ?auto_25501 ) ( not ( = ?auto_25501 ?auto_25502 ) ) ( HOLDING ?auto_25503 ) ( CLEAR ?auto_25504 ) ( not ( = ?auto_25501 ?auto_25503 ) ) ( not ( = ?auto_25501 ?auto_25504 ) ) ( not ( = ?auto_25502 ?auto_25503 ) ) ( not ( = ?auto_25502 ?auto_25504 ) ) ( not ( = ?auto_25503 ?auto_25504 ) ) )
    :subtasks
    ( ( !STACK ?auto_25503 ?auto_25504 )
      ( MAKE-1PILE ?auto_25501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25505 - BLOCK
    )
    :vars
    (
      ?auto_25508 - BLOCK
      ?auto_25506 - BLOCK
      ?auto_25507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25505 ?auto_25508 ) ( not ( = ?auto_25505 ?auto_25508 ) ) ( CLEAR ?auto_25506 ) ( not ( = ?auto_25505 ?auto_25507 ) ) ( not ( = ?auto_25505 ?auto_25506 ) ) ( not ( = ?auto_25508 ?auto_25507 ) ) ( not ( = ?auto_25508 ?auto_25506 ) ) ( not ( = ?auto_25507 ?auto_25506 ) ) ( ON ?auto_25507 ?auto_25505 ) ( CLEAR ?auto_25507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25508 ?auto_25505 )
      ( MAKE-1PILE ?auto_25505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25509 - BLOCK
    )
    :vars
    (
      ?auto_25512 - BLOCK
      ?auto_25511 - BLOCK
      ?auto_25510 - BLOCK
      ?auto_25513 - BLOCK
      ?auto_25514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25509 ?auto_25512 ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25509 ?auto_25511 ) ) ( not ( = ?auto_25509 ?auto_25510 ) ) ( not ( = ?auto_25512 ?auto_25511 ) ) ( not ( = ?auto_25512 ?auto_25510 ) ) ( not ( = ?auto_25511 ?auto_25510 ) ) ( ON ?auto_25511 ?auto_25509 ) ( CLEAR ?auto_25511 ) ( ON-TABLE ?auto_25512 ) ( HOLDING ?auto_25510 ) ( CLEAR ?auto_25513 ) ( ON-TABLE ?auto_25514 ) ( ON ?auto_25513 ?auto_25514 ) ( not ( = ?auto_25514 ?auto_25513 ) ) ( not ( = ?auto_25514 ?auto_25510 ) ) ( not ( = ?auto_25513 ?auto_25510 ) ) ( not ( = ?auto_25509 ?auto_25513 ) ) ( not ( = ?auto_25509 ?auto_25514 ) ) ( not ( = ?auto_25512 ?auto_25513 ) ) ( not ( = ?auto_25512 ?auto_25514 ) ) ( not ( = ?auto_25511 ?auto_25513 ) ) ( not ( = ?auto_25511 ?auto_25514 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25514 ?auto_25513 ?auto_25510 )
      ( MAKE-1PILE ?auto_25509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25515 - BLOCK
    )
    :vars
    (
      ?auto_25518 - BLOCK
      ?auto_25517 - BLOCK
      ?auto_25520 - BLOCK
      ?auto_25516 - BLOCK
      ?auto_25519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25515 ?auto_25518 ) ( not ( = ?auto_25515 ?auto_25518 ) ) ( not ( = ?auto_25515 ?auto_25517 ) ) ( not ( = ?auto_25515 ?auto_25520 ) ) ( not ( = ?auto_25518 ?auto_25517 ) ) ( not ( = ?auto_25518 ?auto_25520 ) ) ( not ( = ?auto_25517 ?auto_25520 ) ) ( ON ?auto_25517 ?auto_25515 ) ( ON-TABLE ?auto_25518 ) ( CLEAR ?auto_25516 ) ( ON-TABLE ?auto_25519 ) ( ON ?auto_25516 ?auto_25519 ) ( not ( = ?auto_25519 ?auto_25516 ) ) ( not ( = ?auto_25519 ?auto_25520 ) ) ( not ( = ?auto_25516 ?auto_25520 ) ) ( not ( = ?auto_25515 ?auto_25516 ) ) ( not ( = ?auto_25515 ?auto_25519 ) ) ( not ( = ?auto_25518 ?auto_25516 ) ) ( not ( = ?auto_25518 ?auto_25519 ) ) ( not ( = ?auto_25517 ?auto_25516 ) ) ( not ( = ?auto_25517 ?auto_25519 ) ) ( ON ?auto_25520 ?auto_25517 ) ( CLEAR ?auto_25520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25518 ?auto_25515 ?auto_25517 )
      ( MAKE-1PILE ?auto_25515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25521 - BLOCK
    )
    :vars
    (
      ?auto_25523 - BLOCK
      ?auto_25522 - BLOCK
      ?auto_25526 - BLOCK
      ?auto_25524 - BLOCK
      ?auto_25525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25521 ?auto_25523 ) ( not ( = ?auto_25521 ?auto_25523 ) ) ( not ( = ?auto_25521 ?auto_25522 ) ) ( not ( = ?auto_25521 ?auto_25526 ) ) ( not ( = ?auto_25523 ?auto_25522 ) ) ( not ( = ?auto_25523 ?auto_25526 ) ) ( not ( = ?auto_25522 ?auto_25526 ) ) ( ON ?auto_25522 ?auto_25521 ) ( ON-TABLE ?auto_25523 ) ( ON-TABLE ?auto_25524 ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25524 ?auto_25526 ) ) ( not ( = ?auto_25525 ?auto_25526 ) ) ( not ( = ?auto_25521 ?auto_25525 ) ) ( not ( = ?auto_25521 ?auto_25524 ) ) ( not ( = ?auto_25523 ?auto_25525 ) ) ( not ( = ?auto_25523 ?auto_25524 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( ON ?auto_25526 ?auto_25522 ) ( CLEAR ?auto_25526 ) ( HOLDING ?auto_25525 ) ( CLEAR ?auto_25524 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25524 ?auto_25525 )
      ( MAKE-1PILE ?auto_25521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25527 - BLOCK
    )
    :vars
    (
      ?auto_25531 - BLOCK
      ?auto_25529 - BLOCK
      ?auto_25528 - BLOCK
      ?auto_25532 - BLOCK
      ?auto_25530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25527 ?auto_25531 ) ( not ( = ?auto_25527 ?auto_25531 ) ) ( not ( = ?auto_25527 ?auto_25529 ) ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25531 ?auto_25529 ) ) ( not ( = ?auto_25531 ?auto_25528 ) ) ( not ( = ?auto_25529 ?auto_25528 ) ) ( ON ?auto_25529 ?auto_25527 ) ( ON-TABLE ?auto_25531 ) ( ON-TABLE ?auto_25532 ) ( not ( = ?auto_25532 ?auto_25530 ) ) ( not ( = ?auto_25532 ?auto_25528 ) ) ( not ( = ?auto_25530 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25530 ) ) ( not ( = ?auto_25527 ?auto_25532 ) ) ( not ( = ?auto_25531 ?auto_25530 ) ) ( not ( = ?auto_25531 ?auto_25532 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25532 ) ) ( ON ?auto_25528 ?auto_25529 ) ( CLEAR ?auto_25532 ) ( ON ?auto_25530 ?auto_25528 ) ( CLEAR ?auto_25530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25531 ?auto_25527 ?auto_25529 ?auto_25528 )
      ( MAKE-1PILE ?auto_25527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25533 - BLOCK
    )
    :vars
    (
      ?auto_25538 - BLOCK
      ?auto_25535 - BLOCK
      ?auto_25537 - BLOCK
      ?auto_25534 - BLOCK
      ?auto_25536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25533 ?auto_25538 ) ( not ( = ?auto_25533 ?auto_25538 ) ) ( not ( = ?auto_25533 ?auto_25535 ) ) ( not ( = ?auto_25533 ?auto_25537 ) ) ( not ( = ?auto_25538 ?auto_25535 ) ) ( not ( = ?auto_25538 ?auto_25537 ) ) ( not ( = ?auto_25535 ?auto_25537 ) ) ( ON ?auto_25535 ?auto_25533 ) ( ON-TABLE ?auto_25538 ) ( not ( = ?auto_25534 ?auto_25536 ) ) ( not ( = ?auto_25534 ?auto_25537 ) ) ( not ( = ?auto_25536 ?auto_25537 ) ) ( not ( = ?auto_25533 ?auto_25536 ) ) ( not ( = ?auto_25533 ?auto_25534 ) ) ( not ( = ?auto_25538 ?auto_25536 ) ) ( not ( = ?auto_25538 ?auto_25534 ) ) ( not ( = ?auto_25535 ?auto_25536 ) ) ( not ( = ?auto_25535 ?auto_25534 ) ) ( ON ?auto_25537 ?auto_25535 ) ( ON ?auto_25536 ?auto_25537 ) ( CLEAR ?auto_25536 ) ( HOLDING ?auto_25534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25534 )
      ( MAKE-1PILE ?auto_25533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25539 - BLOCK
    )
    :vars
    (
      ?auto_25543 - BLOCK
      ?auto_25542 - BLOCK
      ?auto_25544 - BLOCK
      ?auto_25541 - BLOCK
      ?auto_25540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25539 ?auto_25543 ) ( not ( = ?auto_25539 ?auto_25543 ) ) ( not ( = ?auto_25539 ?auto_25542 ) ) ( not ( = ?auto_25539 ?auto_25544 ) ) ( not ( = ?auto_25543 ?auto_25542 ) ) ( not ( = ?auto_25543 ?auto_25544 ) ) ( not ( = ?auto_25542 ?auto_25544 ) ) ( ON ?auto_25542 ?auto_25539 ) ( ON-TABLE ?auto_25543 ) ( not ( = ?auto_25541 ?auto_25540 ) ) ( not ( = ?auto_25541 ?auto_25544 ) ) ( not ( = ?auto_25540 ?auto_25544 ) ) ( not ( = ?auto_25539 ?auto_25540 ) ) ( not ( = ?auto_25539 ?auto_25541 ) ) ( not ( = ?auto_25543 ?auto_25540 ) ) ( not ( = ?auto_25543 ?auto_25541 ) ) ( not ( = ?auto_25542 ?auto_25540 ) ) ( not ( = ?auto_25542 ?auto_25541 ) ) ( ON ?auto_25544 ?auto_25542 ) ( ON ?auto_25540 ?auto_25544 ) ( ON ?auto_25541 ?auto_25540 ) ( CLEAR ?auto_25541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25543 ?auto_25539 ?auto_25542 ?auto_25544 ?auto_25540 )
      ( MAKE-1PILE ?auto_25539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25552 - BLOCK
      ?auto_25553 - BLOCK
      ?auto_25554 - BLOCK
    )
    :vars
    (
      ?auto_25555 - BLOCK
      ?auto_25556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25555 ?auto_25554 ) ( CLEAR ?auto_25555 ) ( ON-TABLE ?auto_25552 ) ( ON ?auto_25553 ?auto_25552 ) ( ON ?auto_25554 ?auto_25553 ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25554 ) ) ( not ( = ?auto_25552 ?auto_25555 ) ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( HOLDING ?auto_25556 ) ( not ( = ?auto_25552 ?auto_25556 ) ) ( not ( = ?auto_25553 ?auto_25556 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( not ( = ?auto_25555 ?auto_25556 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_25556 )
      ( MAKE-3PILE ?auto_25552 ?auto_25553 ?auto_25554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25605 - BLOCK
      ?auto_25606 - BLOCK
    )
    :vars
    (
      ?auto_25607 - BLOCK
      ?auto_25609 - BLOCK
      ?auto_25608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25605 ?auto_25606 ) ) ( ON ?auto_25606 ?auto_25607 ) ( not ( = ?auto_25605 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( ON ?auto_25605 ?auto_25606 ) ( CLEAR ?auto_25605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25609 ) ( ON ?auto_25608 ?auto_25609 ) ( ON ?auto_25607 ?auto_25608 ) ( not ( = ?auto_25609 ?auto_25608 ) ) ( not ( = ?auto_25609 ?auto_25607 ) ) ( not ( = ?auto_25609 ?auto_25606 ) ) ( not ( = ?auto_25609 ?auto_25605 ) ) ( not ( = ?auto_25608 ?auto_25607 ) ) ( not ( = ?auto_25608 ?auto_25606 ) ) ( not ( = ?auto_25608 ?auto_25605 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25609 ?auto_25608 ?auto_25607 ?auto_25606 )
      ( MAKE-2PILE ?auto_25605 ?auto_25606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25612 - BLOCK
      ?auto_25613 - BLOCK
    )
    :vars
    (
      ?auto_25614 - BLOCK
      ?auto_25615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25612 ?auto_25613 ) ) ( ON ?auto_25613 ?auto_25614 ) ( CLEAR ?auto_25613 ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25613 ?auto_25614 ) ) ( ON ?auto_25612 ?auto_25615 ) ( CLEAR ?auto_25612 ) ( HAND-EMPTY ) ( not ( = ?auto_25612 ?auto_25615 ) ) ( not ( = ?auto_25613 ?auto_25615 ) ) ( not ( = ?auto_25614 ?auto_25615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25612 ?auto_25615 )
      ( MAKE-2PILE ?auto_25612 ?auto_25613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25616 - BLOCK
      ?auto_25617 - BLOCK
    )
    :vars
    (
      ?auto_25619 - BLOCK
      ?auto_25618 - BLOCK
      ?auto_25621 - BLOCK
      ?auto_25620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25616 ?auto_25617 ) ) ( not ( = ?auto_25616 ?auto_25619 ) ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( ON ?auto_25616 ?auto_25618 ) ( CLEAR ?auto_25616 ) ( not ( = ?auto_25616 ?auto_25618 ) ) ( not ( = ?auto_25617 ?auto_25618 ) ) ( not ( = ?auto_25619 ?auto_25618 ) ) ( HOLDING ?auto_25617 ) ( CLEAR ?auto_25619 ) ( ON-TABLE ?auto_25621 ) ( ON ?auto_25620 ?auto_25621 ) ( ON ?auto_25619 ?auto_25620 ) ( not ( = ?auto_25621 ?auto_25620 ) ) ( not ( = ?auto_25621 ?auto_25619 ) ) ( not ( = ?auto_25621 ?auto_25617 ) ) ( not ( = ?auto_25620 ?auto_25619 ) ) ( not ( = ?auto_25620 ?auto_25617 ) ) ( not ( = ?auto_25616 ?auto_25621 ) ) ( not ( = ?auto_25616 ?auto_25620 ) ) ( not ( = ?auto_25618 ?auto_25621 ) ) ( not ( = ?auto_25618 ?auto_25620 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25621 ?auto_25620 ?auto_25619 ?auto_25617 )
      ( MAKE-2PILE ?auto_25616 ?auto_25617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25622 - BLOCK
      ?auto_25623 - BLOCK
    )
    :vars
    (
      ?auto_25627 - BLOCK
      ?auto_25626 - BLOCK
      ?auto_25624 - BLOCK
      ?auto_25625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25622 ?auto_25623 ) ) ( not ( = ?auto_25622 ?auto_25627 ) ) ( not ( = ?auto_25623 ?auto_25627 ) ) ( ON ?auto_25622 ?auto_25626 ) ( not ( = ?auto_25622 ?auto_25626 ) ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25627 ?auto_25626 ) ) ( CLEAR ?auto_25627 ) ( ON-TABLE ?auto_25624 ) ( ON ?auto_25625 ?auto_25624 ) ( ON ?auto_25627 ?auto_25625 ) ( not ( = ?auto_25624 ?auto_25625 ) ) ( not ( = ?auto_25624 ?auto_25627 ) ) ( not ( = ?auto_25624 ?auto_25623 ) ) ( not ( = ?auto_25625 ?auto_25627 ) ) ( not ( = ?auto_25625 ?auto_25623 ) ) ( not ( = ?auto_25622 ?auto_25624 ) ) ( not ( = ?auto_25622 ?auto_25625 ) ) ( not ( = ?auto_25626 ?auto_25624 ) ) ( not ( = ?auto_25626 ?auto_25625 ) ) ( ON ?auto_25623 ?auto_25622 ) ( CLEAR ?auto_25623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25626 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25626 ?auto_25622 )
      ( MAKE-2PILE ?auto_25622 ?auto_25623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25628 - BLOCK
      ?auto_25629 - BLOCK
    )
    :vars
    (
      ?auto_25632 - BLOCK
      ?auto_25633 - BLOCK
      ?auto_25630 - BLOCK
      ?auto_25631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25628 ?auto_25629 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( ON ?auto_25628 ?auto_25633 ) ( not ( = ?auto_25628 ?auto_25633 ) ) ( not ( = ?auto_25629 ?auto_25633 ) ) ( not ( = ?auto_25632 ?auto_25633 ) ) ( ON-TABLE ?auto_25630 ) ( ON ?auto_25631 ?auto_25630 ) ( not ( = ?auto_25630 ?auto_25631 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25629 ) ) ( not ( = ?auto_25631 ?auto_25632 ) ) ( not ( = ?auto_25631 ?auto_25629 ) ) ( not ( = ?auto_25628 ?auto_25630 ) ) ( not ( = ?auto_25628 ?auto_25631 ) ) ( not ( = ?auto_25633 ?auto_25630 ) ) ( not ( = ?auto_25633 ?auto_25631 ) ) ( ON ?auto_25629 ?auto_25628 ) ( CLEAR ?auto_25629 ) ( ON-TABLE ?auto_25633 ) ( HOLDING ?auto_25632 ) ( CLEAR ?auto_25631 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25630 ?auto_25631 ?auto_25632 )
      ( MAKE-2PILE ?auto_25628 ?auto_25629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25634 - BLOCK
      ?auto_25635 - BLOCK
    )
    :vars
    (
      ?auto_25636 - BLOCK
      ?auto_25638 - BLOCK
      ?auto_25637 - BLOCK
      ?auto_25639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25634 ?auto_25635 ) ) ( not ( = ?auto_25634 ?auto_25636 ) ) ( not ( = ?auto_25635 ?auto_25636 ) ) ( ON ?auto_25634 ?auto_25638 ) ( not ( = ?auto_25634 ?auto_25638 ) ) ( not ( = ?auto_25635 ?auto_25638 ) ) ( not ( = ?auto_25636 ?auto_25638 ) ) ( ON-TABLE ?auto_25637 ) ( ON ?auto_25639 ?auto_25637 ) ( not ( = ?auto_25637 ?auto_25639 ) ) ( not ( = ?auto_25637 ?auto_25636 ) ) ( not ( = ?auto_25637 ?auto_25635 ) ) ( not ( = ?auto_25639 ?auto_25636 ) ) ( not ( = ?auto_25639 ?auto_25635 ) ) ( not ( = ?auto_25634 ?auto_25637 ) ) ( not ( = ?auto_25634 ?auto_25639 ) ) ( not ( = ?auto_25638 ?auto_25637 ) ) ( not ( = ?auto_25638 ?auto_25639 ) ) ( ON ?auto_25635 ?auto_25634 ) ( ON-TABLE ?auto_25638 ) ( CLEAR ?auto_25639 ) ( ON ?auto_25636 ?auto_25635 ) ( CLEAR ?auto_25636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25638 ?auto_25634 ?auto_25635 )
      ( MAKE-2PILE ?auto_25634 ?auto_25635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25640 - BLOCK
      ?auto_25641 - BLOCK
    )
    :vars
    (
      ?auto_25644 - BLOCK
      ?auto_25645 - BLOCK
      ?auto_25642 - BLOCK
      ?auto_25643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25644 ) ) ( not ( = ?auto_25641 ?auto_25644 ) ) ( ON ?auto_25640 ?auto_25645 ) ( not ( = ?auto_25640 ?auto_25645 ) ) ( not ( = ?auto_25641 ?auto_25645 ) ) ( not ( = ?auto_25644 ?auto_25645 ) ) ( ON-TABLE ?auto_25642 ) ( not ( = ?auto_25642 ?auto_25643 ) ) ( not ( = ?auto_25642 ?auto_25644 ) ) ( not ( = ?auto_25642 ?auto_25641 ) ) ( not ( = ?auto_25643 ?auto_25644 ) ) ( not ( = ?auto_25643 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25642 ) ) ( not ( = ?auto_25640 ?auto_25643 ) ) ( not ( = ?auto_25645 ?auto_25642 ) ) ( not ( = ?auto_25645 ?auto_25643 ) ) ( ON ?auto_25641 ?auto_25640 ) ( ON-TABLE ?auto_25645 ) ( ON ?auto_25644 ?auto_25641 ) ( CLEAR ?auto_25644 ) ( HOLDING ?auto_25643 ) ( CLEAR ?auto_25642 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25642 ?auto_25643 )
      ( MAKE-2PILE ?auto_25640 ?auto_25641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25646 - BLOCK
      ?auto_25647 - BLOCK
    )
    :vars
    (
      ?auto_25650 - BLOCK
      ?auto_25651 - BLOCK
      ?auto_25648 - BLOCK
      ?auto_25649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25646 ?auto_25647 ) ) ( not ( = ?auto_25646 ?auto_25650 ) ) ( not ( = ?auto_25647 ?auto_25650 ) ) ( ON ?auto_25646 ?auto_25651 ) ( not ( = ?auto_25646 ?auto_25651 ) ) ( not ( = ?auto_25647 ?auto_25651 ) ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( ON-TABLE ?auto_25648 ) ( not ( = ?auto_25648 ?auto_25649 ) ) ( not ( = ?auto_25648 ?auto_25650 ) ) ( not ( = ?auto_25648 ?auto_25647 ) ) ( not ( = ?auto_25649 ?auto_25650 ) ) ( not ( = ?auto_25649 ?auto_25647 ) ) ( not ( = ?auto_25646 ?auto_25648 ) ) ( not ( = ?auto_25646 ?auto_25649 ) ) ( not ( = ?auto_25651 ?auto_25648 ) ) ( not ( = ?auto_25651 ?auto_25649 ) ) ( ON ?auto_25647 ?auto_25646 ) ( ON-TABLE ?auto_25651 ) ( ON ?auto_25650 ?auto_25647 ) ( CLEAR ?auto_25648 ) ( ON ?auto_25649 ?auto_25650 ) ( CLEAR ?auto_25649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25651 ?auto_25646 ?auto_25647 ?auto_25650 )
      ( MAKE-2PILE ?auto_25646 ?auto_25647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25652 - BLOCK
      ?auto_25653 - BLOCK
    )
    :vars
    (
      ?auto_25654 - BLOCK
      ?auto_25655 - BLOCK
      ?auto_25656 - BLOCK
      ?auto_25657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25652 ?auto_25653 ) ) ( not ( = ?auto_25652 ?auto_25654 ) ) ( not ( = ?auto_25653 ?auto_25654 ) ) ( ON ?auto_25652 ?auto_25655 ) ( not ( = ?auto_25652 ?auto_25655 ) ) ( not ( = ?auto_25653 ?auto_25655 ) ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25654 ) ) ( not ( = ?auto_25656 ?auto_25653 ) ) ( not ( = ?auto_25657 ?auto_25654 ) ) ( not ( = ?auto_25657 ?auto_25653 ) ) ( not ( = ?auto_25652 ?auto_25656 ) ) ( not ( = ?auto_25652 ?auto_25657 ) ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( ON ?auto_25653 ?auto_25652 ) ( ON-TABLE ?auto_25655 ) ( ON ?auto_25654 ?auto_25653 ) ( ON ?auto_25657 ?auto_25654 ) ( CLEAR ?auto_25657 ) ( HOLDING ?auto_25656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25656 )
      ( MAKE-2PILE ?auto_25652 ?auto_25653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25658 - BLOCK
      ?auto_25659 - BLOCK
    )
    :vars
    (
      ?auto_25660 - BLOCK
      ?auto_25663 - BLOCK
      ?auto_25661 - BLOCK
      ?auto_25662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25658 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25660 ) ) ( not ( = ?auto_25659 ?auto_25660 ) ) ( ON ?auto_25658 ?auto_25663 ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( not ( = ?auto_25659 ?auto_25663 ) ) ( not ( = ?auto_25660 ?auto_25663 ) ) ( not ( = ?auto_25661 ?auto_25662 ) ) ( not ( = ?auto_25661 ?auto_25660 ) ) ( not ( = ?auto_25661 ?auto_25659 ) ) ( not ( = ?auto_25662 ?auto_25660 ) ) ( not ( = ?auto_25662 ?auto_25659 ) ) ( not ( = ?auto_25658 ?auto_25661 ) ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25663 ?auto_25661 ) ) ( not ( = ?auto_25663 ?auto_25662 ) ) ( ON ?auto_25659 ?auto_25658 ) ( ON-TABLE ?auto_25663 ) ( ON ?auto_25660 ?auto_25659 ) ( ON ?auto_25662 ?auto_25660 ) ( ON ?auto_25661 ?auto_25662 ) ( CLEAR ?auto_25661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25663 ?auto_25658 ?auto_25659 ?auto_25660 ?auto_25662 )
      ( MAKE-2PILE ?auto_25658 ?auto_25659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25679 - BLOCK
      ?auto_25680 - BLOCK
    )
    :vars
    (
      ?auto_25683 - BLOCK
      ?auto_25681 - BLOCK
      ?auto_25682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25683 ?auto_25680 ) ( ON-TABLE ?auto_25679 ) ( ON ?auto_25680 ?auto_25679 ) ( not ( = ?auto_25679 ?auto_25680 ) ) ( not ( = ?auto_25679 ?auto_25683 ) ) ( not ( = ?auto_25680 ?auto_25683 ) ) ( not ( = ?auto_25679 ?auto_25681 ) ) ( not ( = ?auto_25679 ?auto_25682 ) ) ( not ( = ?auto_25680 ?auto_25681 ) ) ( not ( = ?auto_25680 ?auto_25682 ) ) ( not ( = ?auto_25683 ?auto_25681 ) ) ( not ( = ?auto_25683 ?auto_25682 ) ) ( not ( = ?auto_25681 ?auto_25682 ) ) ( ON ?auto_25681 ?auto_25683 ) ( CLEAR ?auto_25681 ) ( HOLDING ?auto_25682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25682 )
      ( MAKE-2PILE ?auto_25679 ?auto_25680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25726 - BLOCK
      ?auto_25727 - BLOCK
      ?auto_25728 - BLOCK
    )
    :vars
    (
      ?auto_25729 - BLOCK
      ?auto_25730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25726 ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( ON ?auto_25728 ?auto_25729 ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( CLEAR ?auto_25726 ) ( ON ?auto_25727 ?auto_25728 ) ( CLEAR ?auto_25727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25730 ) ( ON ?auto_25729 ?auto_25730 ) ( not ( = ?auto_25730 ?auto_25729 ) ) ( not ( = ?auto_25730 ?auto_25728 ) ) ( not ( = ?auto_25730 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25730 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25730 ?auto_25729 ?auto_25728 )
      ( MAKE-3PILE ?auto_25726 ?auto_25727 ?auto_25728 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25731 - BLOCK
      ?auto_25732 - BLOCK
      ?auto_25733 - BLOCK
    )
    :vars
    (
      ?auto_25734 - BLOCK
      ?auto_25735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25731 ?auto_25732 ) ) ( not ( = ?auto_25731 ?auto_25733 ) ) ( not ( = ?auto_25732 ?auto_25733 ) ) ( ON ?auto_25733 ?auto_25734 ) ( not ( = ?auto_25731 ?auto_25734 ) ) ( not ( = ?auto_25732 ?auto_25734 ) ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( ON ?auto_25732 ?auto_25733 ) ( CLEAR ?auto_25732 ) ( ON-TABLE ?auto_25735 ) ( ON ?auto_25734 ?auto_25735 ) ( not ( = ?auto_25735 ?auto_25734 ) ) ( not ( = ?auto_25735 ?auto_25733 ) ) ( not ( = ?auto_25735 ?auto_25732 ) ) ( not ( = ?auto_25731 ?auto_25735 ) ) ( HOLDING ?auto_25731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25731 )
      ( MAKE-3PILE ?auto_25731 ?auto_25732 ?auto_25733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25736 - BLOCK
      ?auto_25737 - BLOCK
      ?auto_25738 - BLOCK
    )
    :vars
    (
      ?auto_25740 - BLOCK
      ?auto_25739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25736 ?auto_25737 ) ) ( not ( = ?auto_25736 ?auto_25738 ) ) ( not ( = ?auto_25737 ?auto_25738 ) ) ( ON ?auto_25738 ?auto_25740 ) ( not ( = ?auto_25736 ?auto_25740 ) ) ( not ( = ?auto_25737 ?auto_25740 ) ) ( not ( = ?auto_25738 ?auto_25740 ) ) ( ON ?auto_25737 ?auto_25738 ) ( ON-TABLE ?auto_25739 ) ( ON ?auto_25740 ?auto_25739 ) ( not ( = ?auto_25739 ?auto_25740 ) ) ( not ( = ?auto_25739 ?auto_25738 ) ) ( not ( = ?auto_25739 ?auto_25737 ) ) ( not ( = ?auto_25736 ?auto_25739 ) ) ( ON ?auto_25736 ?auto_25737 ) ( CLEAR ?auto_25736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25739 ?auto_25740 ?auto_25738 ?auto_25737 )
      ( MAKE-3PILE ?auto_25736 ?auto_25737 ?auto_25738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25744 - BLOCK
      ?auto_25745 - BLOCK
      ?auto_25746 - BLOCK
    )
    :vars
    (
      ?auto_25747 - BLOCK
      ?auto_25748 - BLOCK
      ?auto_25749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25744 ?auto_25745 ) ) ( not ( = ?auto_25744 ?auto_25746 ) ) ( not ( = ?auto_25745 ?auto_25746 ) ) ( ON ?auto_25746 ?auto_25747 ) ( not ( = ?auto_25744 ?auto_25747 ) ) ( not ( = ?auto_25745 ?auto_25747 ) ) ( not ( = ?auto_25746 ?auto_25747 ) ) ( ON ?auto_25745 ?auto_25746 ) ( CLEAR ?auto_25745 ) ( ON-TABLE ?auto_25748 ) ( ON ?auto_25747 ?auto_25748 ) ( not ( = ?auto_25748 ?auto_25747 ) ) ( not ( = ?auto_25748 ?auto_25746 ) ) ( not ( = ?auto_25748 ?auto_25745 ) ) ( not ( = ?auto_25744 ?auto_25748 ) ) ( ON ?auto_25744 ?auto_25749 ) ( CLEAR ?auto_25744 ) ( HAND-EMPTY ) ( not ( = ?auto_25744 ?auto_25749 ) ) ( not ( = ?auto_25745 ?auto_25749 ) ) ( not ( = ?auto_25746 ?auto_25749 ) ) ( not ( = ?auto_25747 ?auto_25749 ) ) ( not ( = ?auto_25748 ?auto_25749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25744 ?auto_25749 )
      ( MAKE-3PILE ?auto_25744 ?auto_25745 ?auto_25746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25750 - BLOCK
      ?auto_25751 - BLOCK
      ?auto_25752 - BLOCK
    )
    :vars
    (
      ?auto_25755 - BLOCK
      ?auto_25754 - BLOCK
      ?auto_25753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25750 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25752 ) ) ( not ( = ?auto_25751 ?auto_25752 ) ) ( ON ?auto_25752 ?auto_25755 ) ( not ( = ?auto_25750 ?auto_25755 ) ) ( not ( = ?auto_25751 ?auto_25755 ) ) ( not ( = ?auto_25752 ?auto_25755 ) ) ( ON-TABLE ?auto_25754 ) ( ON ?auto_25755 ?auto_25754 ) ( not ( = ?auto_25754 ?auto_25755 ) ) ( not ( = ?auto_25754 ?auto_25752 ) ) ( not ( = ?auto_25754 ?auto_25751 ) ) ( not ( = ?auto_25750 ?auto_25754 ) ) ( ON ?auto_25750 ?auto_25753 ) ( CLEAR ?auto_25750 ) ( not ( = ?auto_25750 ?auto_25753 ) ) ( not ( = ?auto_25751 ?auto_25753 ) ) ( not ( = ?auto_25752 ?auto_25753 ) ) ( not ( = ?auto_25755 ?auto_25753 ) ) ( not ( = ?auto_25754 ?auto_25753 ) ) ( HOLDING ?auto_25751 ) ( CLEAR ?auto_25752 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25754 ?auto_25755 ?auto_25752 ?auto_25751 )
      ( MAKE-3PILE ?auto_25750 ?auto_25751 ?auto_25752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25756 - BLOCK
      ?auto_25757 - BLOCK
      ?auto_25758 - BLOCK
    )
    :vars
    (
      ?auto_25760 - BLOCK
      ?auto_25761 - BLOCK
      ?auto_25759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( ON ?auto_25758 ?auto_25760 ) ( not ( = ?auto_25756 ?auto_25760 ) ) ( not ( = ?auto_25757 ?auto_25760 ) ) ( not ( = ?auto_25758 ?auto_25760 ) ) ( ON-TABLE ?auto_25761 ) ( ON ?auto_25760 ?auto_25761 ) ( not ( = ?auto_25761 ?auto_25760 ) ) ( not ( = ?auto_25761 ?auto_25758 ) ) ( not ( = ?auto_25761 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25761 ) ) ( ON ?auto_25756 ?auto_25759 ) ( not ( = ?auto_25756 ?auto_25759 ) ) ( not ( = ?auto_25757 ?auto_25759 ) ) ( not ( = ?auto_25758 ?auto_25759 ) ) ( not ( = ?auto_25760 ?auto_25759 ) ) ( not ( = ?auto_25761 ?auto_25759 ) ) ( CLEAR ?auto_25758 ) ( ON ?auto_25757 ?auto_25756 ) ( CLEAR ?auto_25757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25759 ?auto_25756 )
      ( MAKE-3PILE ?auto_25756 ?auto_25757 ?auto_25758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25762 - BLOCK
      ?auto_25763 - BLOCK
      ?auto_25764 - BLOCK
    )
    :vars
    (
      ?auto_25766 - BLOCK
      ?auto_25765 - BLOCK
      ?auto_25767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25762 ?auto_25763 ) ) ( not ( = ?auto_25762 ?auto_25764 ) ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( not ( = ?auto_25762 ?auto_25766 ) ) ( not ( = ?auto_25763 ?auto_25766 ) ) ( not ( = ?auto_25764 ?auto_25766 ) ) ( ON-TABLE ?auto_25765 ) ( ON ?auto_25766 ?auto_25765 ) ( not ( = ?auto_25765 ?auto_25766 ) ) ( not ( = ?auto_25765 ?auto_25764 ) ) ( not ( = ?auto_25765 ?auto_25763 ) ) ( not ( = ?auto_25762 ?auto_25765 ) ) ( ON ?auto_25762 ?auto_25767 ) ( not ( = ?auto_25762 ?auto_25767 ) ) ( not ( = ?auto_25763 ?auto_25767 ) ) ( not ( = ?auto_25764 ?auto_25767 ) ) ( not ( = ?auto_25766 ?auto_25767 ) ) ( not ( = ?auto_25765 ?auto_25767 ) ) ( ON ?auto_25763 ?auto_25762 ) ( CLEAR ?auto_25763 ) ( ON-TABLE ?auto_25767 ) ( HOLDING ?auto_25764 ) ( CLEAR ?auto_25766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25765 ?auto_25766 ?auto_25764 )
      ( MAKE-3PILE ?auto_25762 ?auto_25763 ?auto_25764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25768 - BLOCK
      ?auto_25769 - BLOCK
      ?auto_25770 - BLOCK
    )
    :vars
    (
      ?auto_25772 - BLOCK
      ?auto_25773 - BLOCK
      ?auto_25771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25768 ?auto_25769 ) ) ( not ( = ?auto_25768 ?auto_25770 ) ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( not ( = ?auto_25768 ?auto_25772 ) ) ( not ( = ?auto_25769 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( ON-TABLE ?auto_25773 ) ( ON ?auto_25772 ?auto_25773 ) ( not ( = ?auto_25773 ?auto_25772 ) ) ( not ( = ?auto_25773 ?auto_25770 ) ) ( not ( = ?auto_25773 ?auto_25769 ) ) ( not ( = ?auto_25768 ?auto_25773 ) ) ( ON ?auto_25768 ?auto_25771 ) ( not ( = ?auto_25768 ?auto_25771 ) ) ( not ( = ?auto_25769 ?auto_25771 ) ) ( not ( = ?auto_25770 ?auto_25771 ) ) ( not ( = ?auto_25772 ?auto_25771 ) ) ( not ( = ?auto_25773 ?auto_25771 ) ) ( ON ?auto_25769 ?auto_25768 ) ( ON-TABLE ?auto_25771 ) ( CLEAR ?auto_25772 ) ( ON ?auto_25770 ?auto_25769 ) ( CLEAR ?auto_25770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25771 ?auto_25768 ?auto_25769 )
      ( MAKE-3PILE ?auto_25768 ?auto_25769 ?auto_25770 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25774 - BLOCK
      ?auto_25775 - BLOCK
      ?auto_25776 - BLOCK
    )
    :vars
    (
      ?auto_25778 - BLOCK
      ?auto_25779 - BLOCK
      ?auto_25777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25774 ?auto_25775 ) ) ( not ( = ?auto_25774 ?auto_25776 ) ) ( not ( = ?auto_25775 ?auto_25776 ) ) ( not ( = ?auto_25774 ?auto_25778 ) ) ( not ( = ?auto_25775 ?auto_25778 ) ) ( not ( = ?auto_25776 ?auto_25778 ) ) ( ON-TABLE ?auto_25779 ) ( not ( = ?auto_25779 ?auto_25778 ) ) ( not ( = ?auto_25779 ?auto_25776 ) ) ( not ( = ?auto_25779 ?auto_25775 ) ) ( not ( = ?auto_25774 ?auto_25779 ) ) ( ON ?auto_25774 ?auto_25777 ) ( not ( = ?auto_25774 ?auto_25777 ) ) ( not ( = ?auto_25775 ?auto_25777 ) ) ( not ( = ?auto_25776 ?auto_25777 ) ) ( not ( = ?auto_25778 ?auto_25777 ) ) ( not ( = ?auto_25779 ?auto_25777 ) ) ( ON ?auto_25775 ?auto_25774 ) ( ON-TABLE ?auto_25777 ) ( ON ?auto_25776 ?auto_25775 ) ( CLEAR ?auto_25776 ) ( HOLDING ?auto_25778 ) ( CLEAR ?auto_25779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25779 ?auto_25778 )
      ( MAKE-3PILE ?auto_25774 ?auto_25775 ?auto_25776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25780 - BLOCK
      ?auto_25781 - BLOCK
      ?auto_25782 - BLOCK
    )
    :vars
    (
      ?auto_25784 - BLOCK
      ?auto_25783 - BLOCK
      ?auto_25785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25780 ?auto_25781 ) ) ( not ( = ?auto_25780 ?auto_25782 ) ) ( not ( = ?auto_25781 ?auto_25782 ) ) ( not ( = ?auto_25780 ?auto_25784 ) ) ( not ( = ?auto_25781 ?auto_25784 ) ) ( not ( = ?auto_25782 ?auto_25784 ) ) ( ON-TABLE ?auto_25783 ) ( not ( = ?auto_25783 ?auto_25784 ) ) ( not ( = ?auto_25783 ?auto_25782 ) ) ( not ( = ?auto_25783 ?auto_25781 ) ) ( not ( = ?auto_25780 ?auto_25783 ) ) ( ON ?auto_25780 ?auto_25785 ) ( not ( = ?auto_25780 ?auto_25785 ) ) ( not ( = ?auto_25781 ?auto_25785 ) ) ( not ( = ?auto_25782 ?auto_25785 ) ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25783 ?auto_25785 ) ) ( ON ?auto_25781 ?auto_25780 ) ( ON-TABLE ?auto_25785 ) ( ON ?auto_25782 ?auto_25781 ) ( CLEAR ?auto_25783 ) ( ON ?auto_25784 ?auto_25782 ) ( CLEAR ?auto_25784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25785 ?auto_25780 ?auto_25781 ?auto_25782 )
      ( MAKE-3PILE ?auto_25780 ?auto_25781 ?auto_25782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25786 - BLOCK
      ?auto_25787 - BLOCK
      ?auto_25788 - BLOCK
    )
    :vars
    (
      ?auto_25791 - BLOCK
      ?auto_25790 - BLOCK
      ?auto_25789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25786 ?auto_25787 ) ) ( not ( = ?auto_25786 ?auto_25788 ) ) ( not ( = ?auto_25787 ?auto_25788 ) ) ( not ( = ?auto_25786 ?auto_25791 ) ) ( not ( = ?auto_25787 ?auto_25791 ) ) ( not ( = ?auto_25788 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25791 ) ) ( not ( = ?auto_25790 ?auto_25788 ) ) ( not ( = ?auto_25790 ?auto_25787 ) ) ( not ( = ?auto_25786 ?auto_25790 ) ) ( ON ?auto_25786 ?auto_25789 ) ( not ( = ?auto_25786 ?auto_25789 ) ) ( not ( = ?auto_25787 ?auto_25789 ) ) ( not ( = ?auto_25788 ?auto_25789 ) ) ( not ( = ?auto_25791 ?auto_25789 ) ) ( not ( = ?auto_25790 ?auto_25789 ) ) ( ON ?auto_25787 ?auto_25786 ) ( ON-TABLE ?auto_25789 ) ( ON ?auto_25788 ?auto_25787 ) ( ON ?auto_25791 ?auto_25788 ) ( CLEAR ?auto_25791 ) ( HOLDING ?auto_25790 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25790 )
      ( MAKE-3PILE ?auto_25786 ?auto_25787 ?auto_25788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25792 - BLOCK
      ?auto_25793 - BLOCK
      ?auto_25794 - BLOCK
    )
    :vars
    (
      ?auto_25796 - BLOCK
      ?auto_25795 - BLOCK
      ?auto_25797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25793 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25796 ) ) ( not ( = ?auto_25793 ?auto_25796 ) ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25796 ) ) ( not ( = ?auto_25795 ?auto_25794 ) ) ( not ( = ?auto_25795 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( ON ?auto_25792 ?auto_25797 ) ( not ( = ?auto_25792 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25794 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25795 ?auto_25797 ) ) ( ON ?auto_25793 ?auto_25792 ) ( ON-TABLE ?auto_25797 ) ( ON ?auto_25794 ?auto_25793 ) ( ON ?auto_25796 ?auto_25794 ) ( ON ?auto_25795 ?auto_25796 ) ( CLEAR ?auto_25795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25797 ?auto_25792 ?auto_25793 ?auto_25794 ?auto_25796 )
      ( MAKE-3PILE ?auto_25792 ?auto_25793 ?auto_25794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25809 - BLOCK
    )
    :vars
    (
      ?auto_25811 - BLOCK
      ?auto_25812 - BLOCK
      ?auto_25810 - BLOCK
      ?auto_25813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25811 ?auto_25809 ) ( ON-TABLE ?auto_25809 ) ( not ( = ?auto_25809 ?auto_25811 ) ) ( not ( = ?auto_25809 ?auto_25812 ) ) ( not ( = ?auto_25809 ?auto_25810 ) ) ( not ( = ?auto_25811 ?auto_25812 ) ) ( not ( = ?auto_25811 ?auto_25810 ) ) ( not ( = ?auto_25812 ?auto_25810 ) ) ( ON ?auto_25812 ?auto_25811 ) ( CLEAR ?auto_25812 ) ( HOLDING ?auto_25810 ) ( CLEAR ?auto_25813 ) ( ON-TABLE ?auto_25813 ) ( not ( = ?auto_25813 ?auto_25810 ) ) ( not ( = ?auto_25809 ?auto_25813 ) ) ( not ( = ?auto_25811 ?auto_25813 ) ) ( not ( = ?auto_25812 ?auto_25813 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25813 ?auto_25810 )
      ( MAKE-1PILE ?auto_25809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25814 - BLOCK
    )
    :vars
    (
      ?auto_25816 - BLOCK
      ?auto_25818 - BLOCK
      ?auto_25817 - BLOCK
      ?auto_25815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25816 ?auto_25814 ) ( ON-TABLE ?auto_25814 ) ( not ( = ?auto_25814 ?auto_25816 ) ) ( not ( = ?auto_25814 ?auto_25818 ) ) ( not ( = ?auto_25814 ?auto_25817 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) ( not ( = ?auto_25816 ?auto_25817 ) ) ( not ( = ?auto_25818 ?auto_25817 ) ) ( ON ?auto_25818 ?auto_25816 ) ( CLEAR ?auto_25815 ) ( ON-TABLE ?auto_25815 ) ( not ( = ?auto_25815 ?auto_25817 ) ) ( not ( = ?auto_25814 ?auto_25815 ) ) ( not ( = ?auto_25816 ?auto_25815 ) ) ( not ( = ?auto_25818 ?auto_25815 ) ) ( ON ?auto_25817 ?auto_25818 ) ( CLEAR ?auto_25817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25814 ?auto_25816 ?auto_25818 )
      ( MAKE-1PILE ?auto_25814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25819 - BLOCK
    )
    :vars
    (
      ?auto_25821 - BLOCK
      ?auto_25823 - BLOCK
      ?auto_25822 - BLOCK
      ?auto_25820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25821 ?auto_25819 ) ( ON-TABLE ?auto_25819 ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25823 ) ) ( not ( = ?auto_25819 ?auto_25822 ) ) ( not ( = ?auto_25821 ?auto_25823 ) ) ( not ( = ?auto_25821 ?auto_25822 ) ) ( not ( = ?auto_25823 ?auto_25822 ) ) ( ON ?auto_25823 ?auto_25821 ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( not ( = ?auto_25819 ?auto_25820 ) ) ( not ( = ?auto_25821 ?auto_25820 ) ) ( not ( = ?auto_25823 ?auto_25820 ) ) ( ON ?auto_25822 ?auto_25823 ) ( CLEAR ?auto_25822 ) ( HOLDING ?auto_25820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25820 )
      ( MAKE-1PILE ?auto_25819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25830 - BLOCK
    )
    :vars
    (
      ?auto_25833 - BLOCK
      ?auto_25834 - BLOCK
      ?auto_25832 - BLOCK
      ?auto_25831 - BLOCK
      ?auto_25835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25833 ?auto_25830 ) ( ON-TABLE ?auto_25830 ) ( not ( = ?auto_25830 ?auto_25833 ) ) ( not ( = ?auto_25830 ?auto_25834 ) ) ( not ( = ?auto_25830 ?auto_25832 ) ) ( not ( = ?auto_25833 ?auto_25834 ) ) ( not ( = ?auto_25833 ?auto_25832 ) ) ( not ( = ?auto_25834 ?auto_25832 ) ) ( ON ?auto_25834 ?auto_25833 ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( not ( = ?auto_25830 ?auto_25831 ) ) ( not ( = ?auto_25833 ?auto_25831 ) ) ( not ( = ?auto_25834 ?auto_25831 ) ) ( ON ?auto_25832 ?auto_25834 ) ( CLEAR ?auto_25832 ) ( ON ?auto_25831 ?auto_25835 ) ( CLEAR ?auto_25831 ) ( HAND-EMPTY ) ( not ( = ?auto_25830 ?auto_25835 ) ) ( not ( = ?auto_25833 ?auto_25835 ) ) ( not ( = ?auto_25834 ?auto_25835 ) ) ( not ( = ?auto_25832 ?auto_25835 ) ) ( not ( = ?auto_25831 ?auto_25835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25831 ?auto_25835 )
      ( MAKE-1PILE ?auto_25830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25836 - BLOCK
    )
    :vars
    (
      ?auto_25840 - BLOCK
      ?auto_25838 - BLOCK
      ?auto_25839 - BLOCK
      ?auto_25837 - BLOCK
      ?auto_25841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25840 ?auto_25836 ) ( ON-TABLE ?auto_25836 ) ( not ( = ?auto_25836 ?auto_25840 ) ) ( not ( = ?auto_25836 ?auto_25838 ) ) ( not ( = ?auto_25836 ?auto_25839 ) ) ( not ( = ?auto_25840 ?auto_25838 ) ) ( not ( = ?auto_25840 ?auto_25839 ) ) ( not ( = ?auto_25838 ?auto_25839 ) ) ( ON ?auto_25838 ?auto_25840 ) ( not ( = ?auto_25837 ?auto_25839 ) ) ( not ( = ?auto_25836 ?auto_25837 ) ) ( not ( = ?auto_25840 ?auto_25837 ) ) ( not ( = ?auto_25838 ?auto_25837 ) ) ( ON ?auto_25837 ?auto_25841 ) ( CLEAR ?auto_25837 ) ( not ( = ?auto_25836 ?auto_25841 ) ) ( not ( = ?auto_25840 ?auto_25841 ) ) ( not ( = ?auto_25838 ?auto_25841 ) ) ( not ( = ?auto_25839 ?auto_25841 ) ) ( not ( = ?auto_25837 ?auto_25841 ) ) ( HOLDING ?auto_25839 ) ( CLEAR ?auto_25838 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25836 ?auto_25840 ?auto_25838 ?auto_25839 )
      ( MAKE-1PILE ?auto_25836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25870 - BLOCK
      ?auto_25871 - BLOCK
      ?auto_25872 - BLOCK
      ?auto_25873 - BLOCK
    )
    :vars
    (
      ?auto_25874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25870 ) ( ON ?auto_25871 ?auto_25870 ) ( not ( = ?auto_25870 ?auto_25871 ) ) ( not ( = ?auto_25870 ?auto_25872 ) ) ( not ( = ?auto_25870 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25872 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( ON ?auto_25873 ?auto_25874 ) ( not ( = ?auto_25870 ?auto_25874 ) ) ( not ( = ?auto_25871 ?auto_25874 ) ) ( not ( = ?auto_25872 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( CLEAR ?auto_25871 ) ( ON ?auto_25872 ?auto_25873 ) ( CLEAR ?auto_25872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25874 ?auto_25873 )
      ( MAKE-4PILE ?auto_25870 ?auto_25871 ?auto_25872 ?auto_25873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25875 - BLOCK
      ?auto_25876 - BLOCK
      ?auto_25877 - BLOCK
      ?auto_25878 - BLOCK
    )
    :vars
    (
      ?auto_25879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25875 ) ( not ( = ?auto_25875 ?auto_25876 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25878 ) ) ( not ( = ?auto_25876 ?auto_25877 ) ) ( not ( = ?auto_25876 ?auto_25878 ) ) ( not ( = ?auto_25877 ?auto_25878 ) ) ( ON ?auto_25878 ?auto_25879 ) ( not ( = ?auto_25875 ?auto_25879 ) ) ( not ( = ?auto_25876 ?auto_25879 ) ) ( not ( = ?auto_25877 ?auto_25879 ) ) ( not ( = ?auto_25878 ?auto_25879 ) ) ( ON ?auto_25877 ?auto_25878 ) ( CLEAR ?auto_25877 ) ( ON-TABLE ?auto_25879 ) ( HOLDING ?auto_25876 ) ( CLEAR ?auto_25875 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25875 ?auto_25876 )
      ( MAKE-4PILE ?auto_25875 ?auto_25876 ?auto_25877 ?auto_25878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25880 - BLOCK
      ?auto_25881 - BLOCK
      ?auto_25882 - BLOCK
      ?auto_25883 - BLOCK
    )
    :vars
    (
      ?auto_25884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25880 ) ( not ( = ?auto_25880 ?auto_25881 ) ) ( not ( = ?auto_25880 ?auto_25882 ) ) ( not ( = ?auto_25880 ?auto_25883 ) ) ( not ( = ?auto_25881 ?auto_25882 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( not ( = ?auto_25882 ?auto_25883 ) ) ( ON ?auto_25883 ?auto_25884 ) ( not ( = ?auto_25880 ?auto_25884 ) ) ( not ( = ?auto_25881 ?auto_25884 ) ) ( not ( = ?auto_25882 ?auto_25884 ) ) ( not ( = ?auto_25883 ?auto_25884 ) ) ( ON ?auto_25882 ?auto_25883 ) ( ON-TABLE ?auto_25884 ) ( CLEAR ?auto_25880 ) ( ON ?auto_25881 ?auto_25882 ) ( CLEAR ?auto_25881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25884 ?auto_25883 ?auto_25882 )
      ( MAKE-4PILE ?auto_25880 ?auto_25881 ?auto_25882 ?auto_25883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25885 - BLOCK
      ?auto_25886 - BLOCK
      ?auto_25887 - BLOCK
      ?auto_25888 - BLOCK
    )
    :vars
    (
      ?auto_25889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25885 ?auto_25886 ) ) ( not ( = ?auto_25885 ?auto_25887 ) ) ( not ( = ?auto_25885 ?auto_25888 ) ) ( not ( = ?auto_25886 ?auto_25887 ) ) ( not ( = ?auto_25886 ?auto_25888 ) ) ( not ( = ?auto_25887 ?auto_25888 ) ) ( ON ?auto_25888 ?auto_25889 ) ( not ( = ?auto_25885 ?auto_25889 ) ) ( not ( = ?auto_25886 ?auto_25889 ) ) ( not ( = ?auto_25887 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( ON ?auto_25887 ?auto_25888 ) ( ON-TABLE ?auto_25889 ) ( ON ?auto_25886 ?auto_25887 ) ( CLEAR ?auto_25886 ) ( HOLDING ?auto_25885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25885 )
      ( MAKE-4PILE ?auto_25885 ?auto_25886 ?auto_25887 ?auto_25888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25890 - BLOCK
      ?auto_25891 - BLOCK
      ?auto_25892 - BLOCK
      ?auto_25893 - BLOCK
    )
    :vars
    (
      ?auto_25894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25890 ?auto_25891 ) ) ( not ( = ?auto_25890 ?auto_25892 ) ) ( not ( = ?auto_25890 ?auto_25893 ) ) ( not ( = ?auto_25891 ?auto_25892 ) ) ( not ( = ?auto_25891 ?auto_25893 ) ) ( not ( = ?auto_25892 ?auto_25893 ) ) ( ON ?auto_25893 ?auto_25894 ) ( not ( = ?auto_25890 ?auto_25894 ) ) ( not ( = ?auto_25891 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( ON ?auto_25892 ?auto_25893 ) ( ON-TABLE ?auto_25894 ) ( ON ?auto_25891 ?auto_25892 ) ( ON ?auto_25890 ?auto_25891 ) ( CLEAR ?auto_25890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25894 ?auto_25893 ?auto_25892 ?auto_25891 )
      ( MAKE-4PILE ?auto_25890 ?auto_25891 ?auto_25892 ?auto_25893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25899 - BLOCK
      ?auto_25900 - BLOCK
      ?auto_25901 - BLOCK
      ?auto_25902 - BLOCK
    )
    :vars
    (
      ?auto_25903 - BLOCK
      ?auto_25904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25899 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25901 ) ) ( not ( = ?auto_25899 ?auto_25902 ) ) ( not ( = ?auto_25900 ?auto_25901 ) ) ( not ( = ?auto_25900 ?auto_25902 ) ) ( not ( = ?auto_25901 ?auto_25902 ) ) ( ON ?auto_25902 ?auto_25903 ) ( not ( = ?auto_25899 ?auto_25903 ) ) ( not ( = ?auto_25900 ?auto_25903 ) ) ( not ( = ?auto_25901 ?auto_25903 ) ) ( not ( = ?auto_25902 ?auto_25903 ) ) ( ON ?auto_25901 ?auto_25902 ) ( ON-TABLE ?auto_25903 ) ( ON ?auto_25900 ?auto_25901 ) ( CLEAR ?auto_25900 ) ( ON ?auto_25899 ?auto_25904 ) ( CLEAR ?auto_25899 ) ( HAND-EMPTY ) ( not ( = ?auto_25899 ?auto_25904 ) ) ( not ( = ?auto_25900 ?auto_25904 ) ) ( not ( = ?auto_25901 ?auto_25904 ) ) ( not ( = ?auto_25902 ?auto_25904 ) ) ( not ( = ?auto_25903 ?auto_25904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25899 ?auto_25904 )
      ( MAKE-4PILE ?auto_25899 ?auto_25900 ?auto_25901 ?auto_25902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25905 - BLOCK
      ?auto_25906 - BLOCK
      ?auto_25907 - BLOCK
      ?auto_25908 - BLOCK
    )
    :vars
    (
      ?auto_25909 - BLOCK
      ?auto_25910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25905 ?auto_25906 ) ) ( not ( = ?auto_25905 ?auto_25907 ) ) ( not ( = ?auto_25905 ?auto_25908 ) ) ( not ( = ?auto_25906 ?auto_25907 ) ) ( not ( = ?auto_25906 ?auto_25908 ) ) ( not ( = ?auto_25907 ?auto_25908 ) ) ( ON ?auto_25908 ?auto_25909 ) ( not ( = ?auto_25905 ?auto_25909 ) ) ( not ( = ?auto_25906 ?auto_25909 ) ) ( not ( = ?auto_25907 ?auto_25909 ) ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( ON ?auto_25907 ?auto_25908 ) ( ON-TABLE ?auto_25909 ) ( ON ?auto_25905 ?auto_25910 ) ( CLEAR ?auto_25905 ) ( not ( = ?auto_25905 ?auto_25910 ) ) ( not ( = ?auto_25906 ?auto_25910 ) ) ( not ( = ?auto_25907 ?auto_25910 ) ) ( not ( = ?auto_25908 ?auto_25910 ) ) ( not ( = ?auto_25909 ?auto_25910 ) ) ( HOLDING ?auto_25906 ) ( CLEAR ?auto_25907 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25909 ?auto_25908 ?auto_25907 ?auto_25906 )
      ( MAKE-4PILE ?auto_25905 ?auto_25906 ?auto_25907 ?auto_25908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25911 - BLOCK
      ?auto_25912 - BLOCK
      ?auto_25913 - BLOCK
      ?auto_25914 - BLOCK
    )
    :vars
    (
      ?auto_25916 - BLOCK
      ?auto_25915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25911 ?auto_25912 ) ) ( not ( = ?auto_25911 ?auto_25913 ) ) ( not ( = ?auto_25911 ?auto_25914 ) ) ( not ( = ?auto_25912 ?auto_25913 ) ) ( not ( = ?auto_25912 ?auto_25914 ) ) ( not ( = ?auto_25913 ?auto_25914 ) ) ( ON ?auto_25914 ?auto_25916 ) ( not ( = ?auto_25911 ?auto_25916 ) ) ( not ( = ?auto_25912 ?auto_25916 ) ) ( not ( = ?auto_25913 ?auto_25916 ) ) ( not ( = ?auto_25914 ?auto_25916 ) ) ( ON ?auto_25913 ?auto_25914 ) ( ON-TABLE ?auto_25916 ) ( ON ?auto_25911 ?auto_25915 ) ( not ( = ?auto_25911 ?auto_25915 ) ) ( not ( = ?auto_25912 ?auto_25915 ) ) ( not ( = ?auto_25913 ?auto_25915 ) ) ( not ( = ?auto_25914 ?auto_25915 ) ) ( not ( = ?auto_25916 ?auto_25915 ) ) ( CLEAR ?auto_25913 ) ( ON ?auto_25912 ?auto_25911 ) ( CLEAR ?auto_25912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25915 ?auto_25911 )
      ( MAKE-4PILE ?auto_25911 ?auto_25912 ?auto_25913 ?auto_25914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25917 - BLOCK
      ?auto_25918 - BLOCK
      ?auto_25919 - BLOCK
      ?auto_25920 - BLOCK
    )
    :vars
    (
      ?auto_25922 - BLOCK
      ?auto_25921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25917 ?auto_25918 ) ) ( not ( = ?auto_25917 ?auto_25919 ) ) ( not ( = ?auto_25917 ?auto_25920 ) ) ( not ( = ?auto_25918 ?auto_25919 ) ) ( not ( = ?auto_25918 ?auto_25920 ) ) ( not ( = ?auto_25919 ?auto_25920 ) ) ( ON ?auto_25920 ?auto_25922 ) ( not ( = ?auto_25917 ?auto_25922 ) ) ( not ( = ?auto_25918 ?auto_25922 ) ) ( not ( = ?auto_25919 ?auto_25922 ) ) ( not ( = ?auto_25920 ?auto_25922 ) ) ( ON-TABLE ?auto_25922 ) ( ON ?auto_25917 ?auto_25921 ) ( not ( = ?auto_25917 ?auto_25921 ) ) ( not ( = ?auto_25918 ?auto_25921 ) ) ( not ( = ?auto_25919 ?auto_25921 ) ) ( not ( = ?auto_25920 ?auto_25921 ) ) ( not ( = ?auto_25922 ?auto_25921 ) ) ( ON ?auto_25918 ?auto_25917 ) ( CLEAR ?auto_25918 ) ( ON-TABLE ?auto_25921 ) ( HOLDING ?auto_25919 ) ( CLEAR ?auto_25920 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25922 ?auto_25920 ?auto_25919 )
      ( MAKE-4PILE ?auto_25917 ?auto_25918 ?auto_25919 ?auto_25920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25923 - BLOCK
      ?auto_25924 - BLOCK
      ?auto_25925 - BLOCK
      ?auto_25926 - BLOCK
    )
    :vars
    (
      ?auto_25927 - BLOCK
      ?auto_25928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25923 ?auto_25924 ) ) ( not ( = ?auto_25923 ?auto_25925 ) ) ( not ( = ?auto_25923 ?auto_25926 ) ) ( not ( = ?auto_25924 ?auto_25925 ) ) ( not ( = ?auto_25924 ?auto_25926 ) ) ( not ( = ?auto_25925 ?auto_25926 ) ) ( ON ?auto_25926 ?auto_25927 ) ( not ( = ?auto_25923 ?auto_25927 ) ) ( not ( = ?auto_25924 ?auto_25927 ) ) ( not ( = ?auto_25925 ?auto_25927 ) ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( ON-TABLE ?auto_25927 ) ( ON ?auto_25923 ?auto_25928 ) ( not ( = ?auto_25923 ?auto_25928 ) ) ( not ( = ?auto_25924 ?auto_25928 ) ) ( not ( = ?auto_25925 ?auto_25928 ) ) ( not ( = ?auto_25926 ?auto_25928 ) ) ( not ( = ?auto_25927 ?auto_25928 ) ) ( ON ?auto_25924 ?auto_25923 ) ( ON-TABLE ?auto_25928 ) ( CLEAR ?auto_25926 ) ( ON ?auto_25925 ?auto_25924 ) ( CLEAR ?auto_25925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25928 ?auto_25923 ?auto_25924 )
      ( MAKE-4PILE ?auto_25923 ?auto_25924 ?auto_25925 ?auto_25926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25929 - BLOCK
      ?auto_25930 - BLOCK
      ?auto_25931 - BLOCK
      ?auto_25932 - BLOCK
    )
    :vars
    (
      ?auto_25933 - BLOCK
      ?auto_25934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25929 ?auto_25930 ) ) ( not ( = ?auto_25929 ?auto_25931 ) ) ( not ( = ?auto_25929 ?auto_25932 ) ) ( not ( = ?auto_25930 ?auto_25931 ) ) ( not ( = ?auto_25930 ?auto_25932 ) ) ( not ( = ?auto_25931 ?auto_25932 ) ) ( not ( = ?auto_25929 ?auto_25933 ) ) ( not ( = ?auto_25930 ?auto_25933 ) ) ( not ( = ?auto_25931 ?auto_25933 ) ) ( not ( = ?auto_25932 ?auto_25933 ) ) ( ON-TABLE ?auto_25933 ) ( ON ?auto_25929 ?auto_25934 ) ( not ( = ?auto_25929 ?auto_25934 ) ) ( not ( = ?auto_25930 ?auto_25934 ) ) ( not ( = ?auto_25931 ?auto_25934 ) ) ( not ( = ?auto_25932 ?auto_25934 ) ) ( not ( = ?auto_25933 ?auto_25934 ) ) ( ON ?auto_25930 ?auto_25929 ) ( ON-TABLE ?auto_25934 ) ( ON ?auto_25931 ?auto_25930 ) ( CLEAR ?auto_25931 ) ( HOLDING ?auto_25932 ) ( CLEAR ?auto_25933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25933 ?auto_25932 )
      ( MAKE-4PILE ?auto_25929 ?auto_25930 ?auto_25931 ?auto_25932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25935 - BLOCK
      ?auto_25936 - BLOCK
      ?auto_25937 - BLOCK
      ?auto_25938 - BLOCK
    )
    :vars
    (
      ?auto_25939 - BLOCK
      ?auto_25940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25935 ?auto_25936 ) ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25938 ) ) ( not ( = ?auto_25936 ?auto_25937 ) ) ( not ( = ?auto_25936 ?auto_25938 ) ) ( not ( = ?auto_25937 ?auto_25938 ) ) ( not ( = ?auto_25935 ?auto_25939 ) ) ( not ( = ?auto_25936 ?auto_25939 ) ) ( not ( = ?auto_25937 ?auto_25939 ) ) ( not ( = ?auto_25938 ?auto_25939 ) ) ( ON-TABLE ?auto_25939 ) ( ON ?auto_25935 ?auto_25940 ) ( not ( = ?auto_25935 ?auto_25940 ) ) ( not ( = ?auto_25936 ?auto_25940 ) ) ( not ( = ?auto_25937 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25940 ) ) ( not ( = ?auto_25939 ?auto_25940 ) ) ( ON ?auto_25936 ?auto_25935 ) ( ON-TABLE ?auto_25940 ) ( ON ?auto_25937 ?auto_25936 ) ( CLEAR ?auto_25939 ) ( ON ?auto_25938 ?auto_25937 ) ( CLEAR ?auto_25938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25940 ?auto_25935 ?auto_25936 ?auto_25937 )
      ( MAKE-4PILE ?auto_25935 ?auto_25936 ?auto_25937 ?auto_25938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25941 - BLOCK
      ?auto_25942 - BLOCK
      ?auto_25943 - BLOCK
      ?auto_25944 - BLOCK
    )
    :vars
    (
      ?auto_25945 - BLOCK
      ?auto_25946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25941 ?auto_25942 ) ) ( not ( = ?auto_25941 ?auto_25943 ) ) ( not ( = ?auto_25941 ?auto_25944 ) ) ( not ( = ?auto_25942 ?auto_25943 ) ) ( not ( = ?auto_25942 ?auto_25944 ) ) ( not ( = ?auto_25943 ?auto_25944 ) ) ( not ( = ?auto_25941 ?auto_25945 ) ) ( not ( = ?auto_25942 ?auto_25945 ) ) ( not ( = ?auto_25943 ?auto_25945 ) ) ( not ( = ?auto_25944 ?auto_25945 ) ) ( ON ?auto_25941 ?auto_25946 ) ( not ( = ?auto_25941 ?auto_25946 ) ) ( not ( = ?auto_25942 ?auto_25946 ) ) ( not ( = ?auto_25943 ?auto_25946 ) ) ( not ( = ?auto_25944 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25946 ) ) ( ON ?auto_25942 ?auto_25941 ) ( ON-TABLE ?auto_25946 ) ( ON ?auto_25943 ?auto_25942 ) ( ON ?auto_25944 ?auto_25943 ) ( CLEAR ?auto_25944 ) ( HOLDING ?auto_25945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25945 )
      ( MAKE-4PILE ?auto_25941 ?auto_25942 ?auto_25943 ?auto_25944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25947 - BLOCK
      ?auto_25948 - BLOCK
      ?auto_25949 - BLOCK
      ?auto_25950 - BLOCK
    )
    :vars
    (
      ?auto_25951 - BLOCK
      ?auto_25952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25947 ?auto_25948 ) ) ( not ( = ?auto_25947 ?auto_25949 ) ) ( not ( = ?auto_25947 ?auto_25950 ) ) ( not ( = ?auto_25948 ?auto_25949 ) ) ( not ( = ?auto_25948 ?auto_25950 ) ) ( not ( = ?auto_25949 ?auto_25950 ) ) ( not ( = ?auto_25947 ?auto_25951 ) ) ( not ( = ?auto_25948 ?auto_25951 ) ) ( not ( = ?auto_25949 ?auto_25951 ) ) ( not ( = ?auto_25950 ?auto_25951 ) ) ( ON ?auto_25947 ?auto_25952 ) ( not ( = ?auto_25947 ?auto_25952 ) ) ( not ( = ?auto_25948 ?auto_25952 ) ) ( not ( = ?auto_25949 ?auto_25952 ) ) ( not ( = ?auto_25950 ?auto_25952 ) ) ( not ( = ?auto_25951 ?auto_25952 ) ) ( ON ?auto_25948 ?auto_25947 ) ( ON-TABLE ?auto_25952 ) ( ON ?auto_25949 ?auto_25948 ) ( ON ?auto_25950 ?auto_25949 ) ( ON ?auto_25951 ?auto_25950 ) ( CLEAR ?auto_25951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_25952 ?auto_25947 ?auto_25948 ?auto_25949 ?auto_25950 )
      ( MAKE-4PILE ?auto_25947 ?auto_25948 ?auto_25949 ?auto_25950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25963 - BLOCK
      ?auto_25964 - BLOCK
      ?auto_25965 - BLOCK
      ?auto_25966 - BLOCK
      ?auto_25967 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25966 ) ( ON-TABLE ?auto_25963 ) ( ON ?auto_25964 ?auto_25963 ) ( ON ?auto_25965 ?auto_25964 ) ( ON ?auto_25966 ?auto_25965 ) ( not ( = ?auto_25963 ?auto_25964 ) ) ( not ( = ?auto_25963 ?auto_25965 ) ) ( not ( = ?auto_25963 ?auto_25966 ) ) ( not ( = ?auto_25963 ?auto_25967 ) ) ( not ( = ?auto_25964 ?auto_25965 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) ( not ( = ?auto_25964 ?auto_25967 ) ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( not ( = ?auto_25965 ?auto_25967 ) ) ( not ( = ?auto_25966 ?auto_25967 ) ) ( ON-TABLE ?auto_25967 ) ( CLEAR ?auto_25967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_25967 )
      ( MAKE-5PILE ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ?auto_25967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25968 - BLOCK
      ?auto_25969 - BLOCK
      ?auto_25970 - BLOCK
      ?auto_25971 - BLOCK
      ?auto_25972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25968 ) ( ON ?auto_25969 ?auto_25968 ) ( ON ?auto_25970 ?auto_25969 ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25968 ?auto_25972 ) ) ( not ( = ?auto_25969 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_25971 ) ) ( not ( = ?auto_25969 ?auto_25972 ) ) ( not ( = ?auto_25970 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25971 ?auto_25972 ) ) ( ON-TABLE ?auto_25972 ) ( CLEAR ?auto_25972 ) ( HOLDING ?auto_25971 ) ( CLEAR ?auto_25970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25968 ?auto_25969 ?auto_25970 ?auto_25971 )
      ( MAKE-5PILE ?auto_25968 ?auto_25969 ?auto_25970 ?auto_25971 ?auto_25972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25973 - BLOCK
      ?auto_25974 - BLOCK
      ?auto_25975 - BLOCK
      ?auto_25976 - BLOCK
      ?auto_25977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25973 ) ( ON ?auto_25974 ?auto_25973 ) ( ON ?auto_25975 ?auto_25974 ) ( not ( = ?auto_25973 ?auto_25974 ) ) ( not ( = ?auto_25973 ?auto_25975 ) ) ( not ( = ?auto_25973 ?auto_25976 ) ) ( not ( = ?auto_25973 ?auto_25977 ) ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25974 ?auto_25976 ) ) ( not ( = ?auto_25974 ?auto_25977 ) ) ( not ( = ?auto_25975 ?auto_25976 ) ) ( not ( = ?auto_25975 ?auto_25977 ) ) ( not ( = ?auto_25976 ?auto_25977 ) ) ( ON-TABLE ?auto_25977 ) ( CLEAR ?auto_25975 ) ( ON ?auto_25976 ?auto_25977 ) ( CLEAR ?auto_25976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25977 )
      ( MAKE-5PILE ?auto_25973 ?auto_25974 ?auto_25975 ?auto_25976 ?auto_25977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25978 - BLOCK
      ?auto_25979 - BLOCK
      ?auto_25980 - BLOCK
      ?auto_25981 - BLOCK
      ?auto_25982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25978 ) ( ON ?auto_25979 ?auto_25978 ) ( not ( = ?auto_25978 ?auto_25979 ) ) ( not ( = ?auto_25978 ?auto_25980 ) ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25978 ?auto_25982 ) ) ( not ( = ?auto_25979 ?auto_25980 ) ) ( not ( = ?auto_25979 ?auto_25981 ) ) ( not ( = ?auto_25979 ?auto_25982 ) ) ( not ( = ?auto_25980 ?auto_25981 ) ) ( not ( = ?auto_25980 ?auto_25982 ) ) ( not ( = ?auto_25981 ?auto_25982 ) ) ( ON-TABLE ?auto_25982 ) ( ON ?auto_25981 ?auto_25982 ) ( CLEAR ?auto_25981 ) ( HOLDING ?auto_25980 ) ( CLEAR ?auto_25979 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25978 ?auto_25979 ?auto_25980 )
      ( MAKE-5PILE ?auto_25978 ?auto_25979 ?auto_25980 ?auto_25981 ?auto_25982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25983 - BLOCK
      ?auto_25984 - BLOCK
      ?auto_25985 - BLOCK
      ?auto_25986 - BLOCK
      ?auto_25987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25983 ) ( ON ?auto_25984 ?auto_25983 ) ( not ( = ?auto_25983 ?auto_25984 ) ) ( not ( = ?auto_25983 ?auto_25985 ) ) ( not ( = ?auto_25983 ?auto_25986 ) ) ( not ( = ?auto_25983 ?auto_25987 ) ) ( not ( = ?auto_25984 ?auto_25985 ) ) ( not ( = ?auto_25984 ?auto_25986 ) ) ( not ( = ?auto_25984 ?auto_25987 ) ) ( not ( = ?auto_25985 ?auto_25986 ) ) ( not ( = ?auto_25985 ?auto_25987 ) ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( ON-TABLE ?auto_25987 ) ( ON ?auto_25986 ?auto_25987 ) ( CLEAR ?auto_25984 ) ( ON ?auto_25985 ?auto_25986 ) ( CLEAR ?auto_25985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25987 ?auto_25986 )
      ( MAKE-5PILE ?auto_25983 ?auto_25984 ?auto_25985 ?auto_25986 ?auto_25987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25988 - BLOCK
      ?auto_25989 - BLOCK
      ?auto_25990 - BLOCK
      ?auto_25991 - BLOCK
      ?auto_25992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25988 ) ( not ( = ?auto_25988 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25988 ?auto_25991 ) ) ( not ( = ?auto_25988 ?auto_25992 ) ) ( not ( = ?auto_25989 ?auto_25990 ) ) ( not ( = ?auto_25989 ?auto_25991 ) ) ( not ( = ?auto_25989 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_25991 ) ) ( not ( = ?auto_25990 ?auto_25992 ) ) ( not ( = ?auto_25991 ?auto_25992 ) ) ( ON-TABLE ?auto_25992 ) ( ON ?auto_25991 ?auto_25992 ) ( ON ?auto_25990 ?auto_25991 ) ( CLEAR ?auto_25990 ) ( HOLDING ?auto_25989 ) ( CLEAR ?auto_25988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25988 ?auto_25989 )
      ( MAKE-5PILE ?auto_25988 ?auto_25989 ?auto_25990 ?auto_25991 ?auto_25992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25993 - BLOCK
      ?auto_25994 - BLOCK
      ?auto_25995 - BLOCK
      ?auto_25996 - BLOCK
      ?auto_25997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_25993 ) ( not ( = ?auto_25993 ?auto_25994 ) ) ( not ( = ?auto_25993 ?auto_25995 ) ) ( not ( = ?auto_25993 ?auto_25996 ) ) ( not ( = ?auto_25993 ?auto_25997 ) ) ( not ( = ?auto_25994 ?auto_25995 ) ) ( not ( = ?auto_25994 ?auto_25996 ) ) ( not ( = ?auto_25994 ?auto_25997 ) ) ( not ( = ?auto_25995 ?auto_25996 ) ) ( not ( = ?auto_25995 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( ON-TABLE ?auto_25997 ) ( ON ?auto_25996 ?auto_25997 ) ( ON ?auto_25995 ?auto_25996 ) ( CLEAR ?auto_25993 ) ( ON ?auto_25994 ?auto_25995 ) ( CLEAR ?auto_25994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25997 ?auto_25996 ?auto_25995 )
      ( MAKE-5PILE ?auto_25993 ?auto_25994 ?auto_25995 ?auto_25996 ?auto_25997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25998 - BLOCK
      ?auto_25999 - BLOCK
      ?auto_26000 - BLOCK
      ?auto_26001 - BLOCK
      ?auto_26002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25998 ?auto_25999 ) ) ( not ( = ?auto_25998 ?auto_26000 ) ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_25998 ?auto_26002 ) ) ( not ( = ?auto_25999 ?auto_26000 ) ) ( not ( = ?auto_25999 ?auto_26001 ) ) ( not ( = ?auto_25999 ?auto_26002 ) ) ( not ( = ?auto_26000 ?auto_26001 ) ) ( not ( = ?auto_26000 ?auto_26002 ) ) ( not ( = ?auto_26001 ?auto_26002 ) ) ( ON-TABLE ?auto_26002 ) ( ON ?auto_26001 ?auto_26002 ) ( ON ?auto_26000 ?auto_26001 ) ( ON ?auto_25999 ?auto_26000 ) ( CLEAR ?auto_25999 ) ( HOLDING ?auto_25998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25998 )
      ( MAKE-5PILE ?auto_25998 ?auto_25999 ?auto_26000 ?auto_26001 ?auto_26002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26003 - BLOCK
      ?auto_26004 - BLOCK
      ?auto_26005 - BLOCK
      ?auto_26006 - BLOCK
      ?auto_26007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26005 ) ) ( not ( = ?auto_26003 ?auto_26006 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( not ( = ?auto_26004 ?auto_26005 ) ) ( not ( = ?auto_26004 ?auto_26006 ) ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26005 ?auto_26006 ) ) ( not ( = ?auto_26005 ?auto_26007 ) ) ( not ( = ?auto_26006 ?auto_26007 ) ) ( ON-TABLE ?auto_26007 ) ( ON ?auto_26006 ?auto_26007 ) ( ON ?auto_26005 ?auto_26006 ) ( ON ?auto_26004 ?auto_26005 ) ( ON ?auto_26003 ?auto_26004 ) ( CLEAR ?auto_26003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26007 ?auto_26006 ?auto_26005 ?auto_26004 )
      ( MAKE-5PILE ?auto_26003 ?auto_26004 ?auto_26005 ?auto_26006 ?auto_26007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26013 - BLOCK
      ?auto_26014 - BLOCK
      ?auto_26015 - BLOCK
      ?auto_26016 - BLOCK
      ?auto_26017 - BLOCK
    )
    :vars
    (
      ?auto_26018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26013 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26016 ) ) ( not ( = ?auto_26013 ?auto_26017 ) ) ( not ( = ?auto_26014 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26016 ) ) ( not ( = ?auto_26014 ?auto_26017 ) ) ( not ( = ?auto_26015 ?auto_26016 ) ) ( not ( = ?auto_26015 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( ON-TABLE ?auto_26017 ) ( ON ?auto_26016 ?auto_26017 ) ( ON ?auto_26015 ?auto_26016 ) ( ON ?auto_26014 ?auto_26015 ) ( CLEAR ?auto_26014 ) ( ON ?auto_26013 ?auto_26018 ) ( CLEAR ?auto_26013 ) ( HAND-EMPTY ) ( not ( = ?auto_26013 ?auto_26018 ) ) ( not ( = ?auto_26014 ?auto_26018 ) ) ( not ( = ?auto_26015 ?auto_26018 ) ) ( not ( = ?auto_26016 ?auto_26018 ) ) ( not ( = ?auto_26017 ?auto_26018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26013 ?auto_26018 )
      ( MAKE-5PILE ?auto_26013 ?auto_26014 ?auto_26015 ?auto_26016 ?auto_26017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26019 - BLOCK
      ?auto_26020 - BLOCK
      ?auto_26021 - BLOCK
      ?auto_26022 - BLOCK
      ?auto_26023 - BLOCK
    )
    :vars
    (
      ?auto_26024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26019 ?auto_26020 ) ) ( not ( = ?auto_26019 ?auto_26021 ) ) ( not ( = ?auto_26019 ?auto_26022 ) ) ( not ( = ?auto_26019 ?auto_26023 ) ) ( not ( = ?auto_26020 ?auto_26021 ) ) ( not ( = ?auto_26020 ?auto_26022 ) ) ( not ( = ?auto_26020 ?auto_26023 ) ) ( not ( = ?auto_26021 ?auto_26022 ) ) ( not ( = ?auto_26021 ?auto_26023 ) ) ( not ( = ?auto_26022 ?auto_26023 ) ) ( ON-TABLE ?auto_26023 ) ( ON ?auto_26022 ?auto_26023 ) ( ON ?auto_26021 ?auto_26022 ) ( ON ?auto_26019 ?auto_26024 ) ( CLEAR ?auto_26019 ) ( not ( = ?auto_26019 ?auto_26024 ) ) ( not ( = ?auto_26020 ?auto_26024 ) ) ( not ( = ?auto_26021 ?auto_26024 ) ) ( not ( = ?auto_26022 ?auto_26024 ) ) ( not ( = ?auto_26023 ?auto_26024 ) ) ( HOLDING ?auto_26020 ) ( CLEAR ?auto_26021 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26023 ?auto_26022 ?auto_26021 ?auto_26020 )
      ( MAKE-5PILE ?auto_26019 ?auto_26020 ?auto_26021 ?auto_26022 ?auto_26023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26025 - BLOCK
      ?auto_26026 - BLOCK
      ?auto_26027 - BLOCK
      ?auto_26028 - BLOCK
      ?auto_26029 - BLOCK
    )
    :vars
    (
      ?auto_26030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26025 ?auto_26026 ) ) ( not ( = ?auto_26025 ?auto_26027 ) ) ( not ( = ?auto_26025 ?auto_26028 ) ) ( not ( = ?auto_26025 ?auto_26029 ) ) ( not ( = ?auto_26026 ?auto_26027 ) ) ( not ( = ?auto_26026 ?auto_26028 ) ) ( not ( = ?auto_26026 ?auto_26029 ) ) ( not ( = ?auto_26027 ?auto_26028 ) ) ( not ( = ?auto_26027 ?auto_26029 ) ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( ON-TABLE ?auto_26029 ) ( ON ?auto_26028 ?auto_26029 ) ( ON ?auto_26027 ?auto_26028 ) ( ON ?auto_26025 ?auto_26030 ) ( not ( = ?auto_26025 ?auto_26030 ) ) ( not ( = ?auto_26026 ?auto_26030 ) ) ( not ( = ?auto_26027 ?auto_26030 ) ) ( not ( = ?auto_26028 ?auto_26030 ) ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( CLEAR ?auto_26027 ) ( ON ?auto_26026 ?auto_26025 ) ( CLEAR ?auto_26026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26030 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26030 ?auto_26025 )
      ( MAKE-5PILE ?auto_26025 ?auto_26026 ?auto_26027 ?auto_26028 ?auto_26029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26031 - BLOCK
      ?auto_26032 - BLOCK
      ?auto_26033 - BLOCK
      ?auto_26034 - BLOCK
      ?auto_26035 - BLOCK
    )
    :vars
    (
      ?auto_26036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( not ( = ?auto_26031 ?auto_26034 ) ) ( not ( = ?auto_26031 ?auto_26035 ) ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( not ( = ?auto_26032 ?auto_26034 ) ) ( not ( = ?auto_26032 ?auto_26035 ) ) ( not ( = ?auto_26033 ?auto_26034 ) ) ( not ( = ?auto_26033 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( ON-TABLE ?auto_26035 ) ( ON ?auto_26034 ?auto_26035 ) ( ON ?auto_26031 ?auto_26036 ) ( not ( = ?auto_26031 ?auto_26036 ) ) ( not ( = ?auto_26032 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( ON ?auto_26032 ?auto_26031 ) ( CLEAR ?auto_26032 ) ( ON-TABLE ?auto_26036 ) ( HOLDING ?auto_26033 ) ( CLEAR ?auto_26034 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26035 ?auto_26034 ?auto_26033 )
      ( MAKE-5PILE ?auto_26031 ?auto_26032 ?auto_26033 ?auto_26034 ?auto_26035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26037 - BLOCK
      ?auto_26038 - BLOCK
      ?auto_26039 - BLOCK
      ?auto_26040 - BLOCK
      ?auto_26041 - BLOCK
    )
    :vars
    (
      ?auto_26042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26037 ?auto_26038 ) ) ( not ( = ?auto_26037 ?auto_26039 ) ) ( not ( = ?auto_26037 ?auto_26040 ) ) ( not ( = ?auto_26037 ?auto_26041 ) ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26040 ?auto_26041 ) ) ( ON-TABLE ?auto_26041 ) ( ON ?auto_26040 ?auto_26041 ) ( ON ?auto_26037 ?auto_26042 ) ( not ( = ?auto_26037 ?auto_26042 ) ) ( not ( = ?auto_26038 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( ON ?auto_26038 ?auto_26037 ) ( ON-TABLE ?auto_26042 ) ( CLEAR ?auto_26040 ) ( ON ?auto_26039 ?auto_26038 ) ( CLEAR ?auto_26039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26042 ?auto_26037 ?auto_26038 )
      ( MAKE-5PILE ?auto_26037 ?auto_26038 ?auto_26039 ?auto_26040 ?auto_26041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26043 - BLOCK
      ?auto_26044 - BLOCK
      ?auto_26045 - BLOCK
      ?auto_26046 - BLOCK
      ?auto_26047 - BLOCK
    )
    :vars
    (
      ?auto_26048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( ON-TABLE ?auto_26047 ) ( ON ?auto_26043 ?auto_26048 ) ( not ( = ?auto_26043 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26048 ) ) ( not ( = ?auto_26045 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( ON ?auto_26044 ?auto_26043 ) ( ON-TABLE ?auto_26048 ) ( ON ?auto_26045 ?auto_26044 ) ( CLEAR ?auto_26045 ) ( HOLDING ?auto_26046 ) ( CLEAR ?auto_26047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26047 ?auto_26046 )
      ( MAKE-5PILE ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26049 - BLOCK
      ?auto_26050 - BLOCK
      ?auto_26051 - BLOCK
      ?auto_26052 - BLOCK
      ?auto_26053 - BLOCK
    )
    :vars
    (
      ?auto_26054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26049 ?auto_26050 ) ) ( not ( = ?auto_26049 ?auto_26051 ) ) ( not ( = ?auto_26049 ?auto_26052 ) ) ( not ( = ?auto_26049 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26051 ) ) ( not ( = ?auto_26050 ?auto_26052 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26051 ?auto_26052 ) ) ( not ( = ?auto_26051 ?auto_26053 ) ) ( not ( = ?auto_26052 ?auto_26053 ) ) ( ON-TABLE ?auto_26053 ) ( ON ?auto_26049 ?auto_26054 ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26050 ?auto_26054 ) ) ( not ( = ?auto_26051 ?auto_26054 ) ) ( not ( = ?auto_26052 ?auto_26054 ) ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( ON ?auto_26050 ?auto_26049 ) ( ON-TABLE ?auto_26054 ) ( ON ?auto_26051 ?auto_26050 ) ( CLEAR ?auto_26053 ) ( ON ?auto_26052 ?auto_26051 ) ( CLEAR ?auto_26052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26054 ?auto_26049 ?auto_26050 ?auto_26051 )
      ( MAKE-5PILE ?auto_26049 ?auto_26050 ?auto_26051 ?auto_26052 ?auto_26053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26055 - BLOCK
      ?auto_26056 - BLOCK
      ?auto_26057 - BLOCK
      ?auto_26058 - BLOCK
      ?auto_26059 - BLOCK
    )
    :vars
    (
      ?auto_26060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26055 ?auto_26056 ) ) ( not ( = ?auto_26055 ?auto_26057 ) ) ( not ( = ?auto_26055 ?auto_26058 ) ) ( not ( = ?auto_26055 ?auto_26059 ) ) ( not ( = ?auto_26056 ?auto_26057 ) ) ( not ( = ?auto_26056 ?auto_26058 ) ) ( not ( = ?auto_26056 ?auto_26059 ) ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( not ( = ?auto_26058 ?auto_26059 ) ) ( ON ?auto_26055 ?auto_26060 ) ( not ( = ?auto_26055 ?auto_26060 ) ) ( not ( = ?auto_26056 ?auto_26060 ) ) ( not ( = ?auto_26057 ?auto_26060 ) ) ( not ( = ?auto_26058 ?auto_26060 ) ) ( not ( = ?auto_26059 ?auto_26060 ) ) ( ON ?auto_26056 ?auto_26055 ) ( ON-TABLE ?auto_26060 ) ( ON ?auto_26057 ?auto_26056 ) ( ON ?auto_26058 ?auto_26057 ) ( CLEAR ?auto_26058 ) ( HOLDING ?auto_26059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26059 )
      ( MAKE-5PILE ?auto_26055 ?auto_26056 ?auto_26057 ?auto_26058 ?auto_26059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26061 - BLOCK
      ?auto_26062 - BLOCK
      ?auto_26063 - BLOCK
      ?auto_26064 - BLOCK
      ?auto_26065 - BLOCK
    )
    :vars
    (
      ?auto_26066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26063 ) ) ( not ( = ?auto_26061 ?auto_26064 ) ) ( not ( = ?auto_26061 ?auto_26065 ) ) ( not ( = ?auto_26062 ?auto_26063 ) ) ( not ( = ?auto_26062 ?auto_26064 ) ) ( not ( = ?auto_26062 ?auto_26065 ) ) ( not ( = ?auto_26063 ?auto_26064 ) ) ( not ( = ?auto_26063 ?auto_26065 ) ) ( not ( = ?auto_26064 ?auto_26065 ) ) ( ON ?auto_26061 ?auto_26066 ) ( not ( = ?auto_26061 ?auto_26066 ) ) ( not ( = ?auto_26062 ?auto_26066 ) ) ( not ( = ?auto_26063 ?auto_26066 ) ) ( not ( = ?auto_26064 ?auto_26066 ) ) ( not ( = ?auto_26065 ?auto_26066 ) ) ( ON ?auto_26062 ?auto_26061 ) ( ON-TABLE ?auto_26066 ) ( ON ?auto_26063 ?auto_26062 ) ( ON ?auto_26064 ?auto_26063 ) ( ON ?auto_26065 ?auto_26064 ) ( CLEAR ?auto_26065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26066 ?auto_26061 ?auto_26062 ?auto_26063 ?auto_26064 )
      ( MAKE-5PILE ?auto_26061 ?auto_26062 ?auto_26063 ?auto_26064 ?auto_26065 ) )
  )

)

