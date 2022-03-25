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
      ?auto_21141 - BLOCK
      ?auto_21142 - BLOCK
      ?auto_21143 - BLOCK
      ?auto_21144 - BLOCK
      ?auto_21145 - BLOCK
    )
    :vars
    (
      ?auto_21146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21146 ?auto_21145 ) ( CLEAR ?auto_21146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21141 ) ( ON ?auto_21142 ?auto_21141 ) ( ON ?auto_21143 ?auto_21142 ) ( ON ?auto_21144 ?auto_21143 ) ( ON ?auto_21145 ?auto_21144 ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21144 ) ) ( not ( = ?auto_21141 ?auto_21145 ) ) ( not ( = ?auto_21141 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21146 ?auto_21145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21148 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21148 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21148 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21149 - BLOCK
    )
    :vars
    (
      ?auto_21150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21149 ?auto_21150 ) ( CLEAR ?auto_21149 ) ( HAND-EMPTY ) ( not ( = ?auto_21149 ?auto_21150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21149 ?auto_21150 )
      ( MAKE-1PILE ?auto_21149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21155 - BLOCK
      ?auto_21156 - BLOCK
      ?auto_21157 - BLOCK
      ?auto_21158 - BLOCK
    )
    :vars
    (
      ?auto_21159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21159 ?auto_21158 ) ( CLEAR ?auto_21159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21155 ) ( ON ?auto_21156 ?auto_21155 ) ( ON ?auto_21157 ?auto_21156 ) ( ON ?auto_21158 ?auto_21157 ) ( not ( = ?auto_21155 ?auto_21156 ) ) ( not ( = ?auto_21155 ?auto_21157 ) ) ( not ( = ?auto_21155 ?auto_21158 ) ) ( not ( = ?auto_21155 ?auto_21159 ) ) ( not ( = ?auto_21156 ?auto_21157 ) ) ( not ( = ?auto_21156 ?auto_21158 ) ) ( not ( = ?auto_21156 ?auto_21159 ) ) ( not ( = ?auto_21157 ?auto_21158 ) ) ( not ( = ?auto_21157 ?auto_21159 ) ) ( not ( = ?auto_21158 ?auto_21159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21159 ?auto_21158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21160 - BLOCK
      ?auto_21161 - BLOCK
      ?auto_21162 - BLOCK
      ?auto_21163 - BLOCK
    )
    :vars
    (
      ?auto_21164 - BLOCK
      ?auto_21165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21164 ?auto_21163 ) ( CLEAR ?auto_21164 ) ( ON-TABLE ?auto_21160 ) ( ON ?auto_21161 ?auto_21160 ) ( ON ?auto_21162 ?auto_21161 ) ( ON ?auto_21163 ?auto_21162 ) ( not ( = ?auto_21160 ?auto_21161 ) ) ( not ( = ?auto_21160 ?auto_21162 ) ) ( not ( = ?auto_21160 ?auto_21163 ) ) ( not ( = ?auto_21160 ?auto_21164 ) ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( not ( = ?auto_21161 ?auto_21163 ) ) ( not ( = ?auto_21161 ?auto_21164 ) ) ( not ( = ?auto_21162 ?auto_21163 ) ) ( not ( = ?auto_21162 ?auto_21164 ) ) ( not ( = ?auto_21163 ?auto_21164 ) ) ( HOLDING ?auto_21165 ) ( not ( = ?auto_21160 ?auto_21165 ) ) ( not ( = ?auto_21161 ?auto_21165 ) ) ( not ( = ?auto_21162 ?auto_21165 ) ) ( not ( = ?auto_21163 ?auto_21165 ) ) ( not ( = ?auto_21164 ?auto_21165 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21165 )
      ( MAKE-4PILE ?auto_21160 ?auto_21161 ?auto_21162 ?auto_21163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21166 - BLOCK
      ?auto_21167 - BLOCK
      ?auto_21168 - BLOCK
      ?auto_21169 - BLOCK
    )
    :vars
    (
      ?auto_21171 - BLOCK
      ?auto_21170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21171 ?auto_21169 ) ( ON-TABLE ?auto_21166 ) ( ON ?auto_21167 ?auto_21166 ) ( ON ?auto_21168 ?auto_21167 ) ( ON ?auto_21169 ?auto_21168 ) ( not ( = ?auto_21166 ?auto_21167 ) ) ( not ( = ?auto_21166 ?auto_21168 ) ) ( not ( = ?auto_21166 ?auto_21169 ) ) ( not ( = ?auto_21166 ?auto_21171 ) ) ( not ( = ?auto_21167 ?auto_21168 ) ) ( not ( = ?auto_21167 ?auto_21169 ) ) ( not ( = ?auto_21167 ?auto_21171 ) ) ( not ( = ?auto_21168 ?auto_21169 ) ) ( not ( = ?auto_21168 ?auto_21171 ) ) ( not ( = ?auto_21169 ?auto_21171 ) ) ( not ( = ?auto_21166 ?auto_21170 ) ) ( not ( = ?auto_21167 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21170 ) ) ( not ( = ?auto_21171 ?auto_21170 ) ) ( ON ?auto_21170 ?auto_21171 ) ( CLEAR ?auto_21170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21166 ?auto_21167 ?auto_21168 ?auto_21169 ?auto_21171 )
      ( MAKE-4PILE ?auto_21166 ?auto_21167 ?auto_21168 ?auto_21169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21174 - BLOCK
      ?auto_21175 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21175 ) ( CLEAR ?auto_21174 ) ( ON-TABLE ?auto_21174 ) ( not ( = ?auto_21174 ?auto_21175 ) ) )
    :subtasks
    ( ( !STACK ?auto_21175 ?auto_21174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21176 - BLOCK
      ?auto_21177 - BLOCK
    )
    :vars
    (
      ?auto_21178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21176 ) ( ON-TABLE ?auto_21176 ) ( not ( = ?auto_21176 ?auto_21177 ) ) ( ON ?auto_21177 ?auto_21178 ) ( CLEAR ?auto_21177 ) ( HAND-EMPTY ) ( not ( = ?auto_21176 ?auto_21178 ) ) ( not ( = ?auto_21177 ?auto_21178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21177 ?auto_21178 )
      ( MAKE-2PILE ?auto_21176 ?auto_21177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21179 - BLOCK
      ?auto_21180 - BLOCK
    )
    :vars
    (
      ?auto_21181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21179 ?auto_21180 ) ) ( ON ?auto_21180 ?auto_21181 ) ( CLEAR ?auto_21180 ) ( not ( = ?auto_21179 ?auto_21181 ) ) ( not ( = ?auto_21180 ?auto_21181 ) ) ( HOLDING ?auto_21179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21179 )
      ( MAKE-2PILE ?auto_21179 ?auto_21180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21182 - BLOCK
      ?auto_21183 - BLOCK
    )
    :vars
    (
      ?auto_21184 - BLOCK
      ?auto_21187 - BLOCK
      ?auto_21185 - BLOCK
      ?auto_21186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21182 ?auto_21183 ) ) ( ON ?auto_21183 ?auto_21184 ) ( not ( = ?auto_21182 ?auto_21184 ) ) ( not ( = ?auto_21183 ?auto_21184 ) ) ( ON ?auto_21182 ?auto_21183 ) ( CLEAR ?auto_21182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21187 ) ( ON ?auto_21185 ?auto_21187 ) ( ON ?auto_21186 ?auto_21185 ) ( ON ?auto_21184 ?auto_21186 ) ( not ( = ?auto_21187 ?auto_21185 ) ) ( not ( = ?auto_21187 ?auto_21186 ) ) ( not ( = ?auto_21187 ?auto_21184 ) ) ( not ( = ?auto_21187 ?auto_21183 ) ) ( not ( = ?auto_21187 ?auto_21182 ) ) ( not ( = ?auto_21185 ?auto_21186 ) ) ( not ( = ?auto_21185 ?auto_21184 ) ) ( not ( = ?auto_21185 ?auto_21183 ) ) ( not ( = ?auto_21185 ?auto_21182 ) ) ( not ( = ?auto_21186 ?auto_21184 ) ) ( not ( = ?auto_21186 ?auto_21183 ) ) ( not ( = ?auto_21186 ?auto_21182 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21187 ?auto_21185 ?auto_21186 ?auto_21184 ?auto_21183 )
      ( MAKE-2PILE ?auto_21182 ?auto_21183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21191 - BLOCK
      ?auto_21192 - BLOCK
      ?auto_21193 - BLOCK
    )
    :vars
    (
      ?auto_21194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21194 ?auto_21193 ) ( CLEAR ?auto_21194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21191 ) ( ON ?auto_21192 ?auto_21191 ) ( ON ?auto_21193 ?auto_21192 ) ( not ( = ?auto_21191 ?auto_21192 ) ) ( not ( = ?auto_21191 ?auto_21193 ) ) ( not ( = ?auto_21191 ?auto_21194 ) ) ( not ( = ?auto_21192 ?auto_21193 ) ) ( not ( = ?auto_21192 ?auto_21194 ) ) ( not ( = ?auto_21193 ?auto_21194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21194 ?auto_21193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21195 - BLOCK
      ?auto_21196 - BLOCK
      ?auto_21197 - BLOCK
    )
    :vars
    (
      ?auto_21198 - BLOCK
      ?auto_21199 - BLOCK
      ?auto_21200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21198 ?auto_21197 ) ( CLEAR ?auto_21198 ) ( ON-TABLE ?auto_21195 ) ( ON ?auto_21196 ?auto_21195 ) ( ON ?auto_21197 ?auto_21196 ) ( not ( = ?auto_21195 ?auto_21196 ) ) ( not ( = ?auto_21195 ?auto_21197 ) ) ( not ( = ?auto_21195 ?auto_21198 ) ) ( not ( = ?auto_21196 ?auto_21197 ) ) ( not ( = ?auto_21196 ?auto_21198 ) ) ( not ( = ?auto_21197 ?auto_21198 ) ) ( HOLDING ?auto_21199 ) ( CLEAR ?auto_21200 ) ( not ( = ?auto_21195 ?auto_21199 ) ) ( not ( = ?auto_21195 ?auto_21200 ) ) ( not ( = ?auto_21196 ?auto_21199 ) ) ( not ( = ?auto_21196 ?auto_21200 ) ) ( not ( = ?auto_21197 ?auto_21199 ) ) ( not ( = ?auto_21197 ?auto_21200 ) ) ( not ( = ?auto_21198 ?auto_21199 ) ) ( not ( = ?auto_21198 ?auto_21200 ) ) ( not ( = ?auto_21199 ?auto_21200 ) ) )
    :subtasks
    ( ( !STACK ?auto_21199 ?auto_21200 )
      ( MAKE-3PILE ?auto_21195 ?auto_21196 ?auto_21197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21201 - BLOCK
      ?auto_21202 - BLOCK
      ?auto_21203 - BLOCK
    )
    :vars
    (
      ?auto_21206 - BLOCK
      ?auto_21205 - BLOCK
      ?auto_21204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21206 ?auto_21203 ) ( ON-TABLE ?auto_21201 ) ( ON ?auto_21202 ?auto_21201 ) ( ON ?auto_21203 ?auto_21202 ) ( not ( = ?auto_21201 ?auto_21202 ) ) ( not ( = ?auto_21201 ?auto_21203 ) ) ( not ( = ?auto_21201 ?auto_21206 ) ) ( not ( = ?auto_21202 ?auto_21203 ) ) ( not ( = ?auto_21202 ?auto_21206 ) ) ( not ( = ?auto_21203 ?auto_21206 ) ) ( CLEAR ?auto_21205 ) ( not ( = ?auto_21201 ?auto_21204 ) ) ( not ( = ?auto_21201 ?auto_21205 ) ) ( not ( = ?auto_21202 ?auto_21204 ) ) ( not ( = ?auto_21202 ?auto_21205 ) ) ( not ( = ?auto_21203 ?auto_21204 ) ) ( not ( = ?auto_21203 ?auto_21205 ) ) ( not ( = ?auto_21206 ?auto_21204 ) ) ( not ( = ?auto_21206 ?auto_21205 ) ) ( not ( = ?auto_21204 ?auto_21205 ) ) ( ON ?auto_21204 ?auto_21206 ) ( CLEAR ?auto_21204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21201 ?auto_21202 ?auto_21203 ?auto_21206 )
      ( MAKE-3PILE ?auto_21201 ?auto_21202 ?auto_21203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21207 - BLOCK
      ?auto_21208 - BLOCK
      ?auto_21209 - BLOCK
    )
    :vars
    (
      ?auto_21210 - BLOCK
      ?auto_21212 - BLOCK
      ?auto_21211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21210 ?auto_21209 ) ( ON-TABLE ?auto_21207 ) ( ON ?auto_21208 ?auto_21207 ) ( ON ?auto_21209 ?auto_21208 ) ( not ( = ?auto_21207 ?auto_21208 ) ) ( not ( = ?auto_21207 ?auto_21209 ) ) ( not ( = ?auto_21207 ?auto_21210 ) ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( not ( = ?auto_21208 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21207 ?auto_21212 ) ) ( not ( = ?auto_21207 ?auto_21211 ) ) ( not ( = ?auto_21208 ?auto_21212 ) ) ( not ( = ?auto_21208 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21212 ?auto_21211 ) ) ( ON ?auto_21212 ?auto_21210 ) ( CLEAR ?auto_21212 ) ( HOLDING ?auto_21211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21211 )
      ( MAKE-3PILE ?auto_21207 ?auto_21208 ?auto_21209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21213 - BLOCK
      ?auto_21214 - BLOCK
      ?auto_21215 - BLOCK
    )
    :vars
    (
      ?auto_21218 - BLOCK
      ?auto_21216 - BLOCK
      ?auto_21217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21218 ?auto_21215 ) ( ON-TABLE ?auto_21213 ) ( ON ?auto_21214 ?auto_21213 ) ( ON ?auto_21215 ?auto_21214 ) ( not ( = ?auto_21213 ?auto_21214 ) ) ( not ( = ?auto_21213 ?auto_21215 ) ) ( not ( = ?auto_21213 ?auto_21218 ) ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( not ( = ?auto_21213 ?auto_21217 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21218 ?auto_21216 ) ) ( not ( = ?auto_21218 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( ON ?auto_21216 ?auto_21218 ) ( ON ?auto_21217 ?auto_21216 ) ( CLEAR ?auto_21217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21218 ?auto_21216 )
      ( MAKE-3PILE ?auto_21213 ?auto_21214 ?auto_21215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21222 - BLOCK
      ?auto_21223 - BLOCK
      ?auto_21224 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21224 ) ( CLEAR ?auto_21223 ) ( ON-TABLE ?auto_21222 ) ( ON ?auto_21223 ?auto_21222 ) ( not ( = ?auto_21222 ?auto_21223 ) ) ( not ( = ?auto_21222 ?auto_21224 ) ) ( not ( = ?auto_21223 ?auto_21224 ) ) )
    :subtasks
    ( ( !STACK ?auto_21224 ?auto_21223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21225 - BLOCK
      ?auto_21226 - BLOCK
      ?auto_21227 - BLOCK
    )
    :vars
    (
      ?auto_21228 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21226 ) ( ON-TABLE ?auto_21225 ) ( ON ?auto_21226 ?auto_21225 ) ( not ( = ?auto_21225 ?auto_21226 ) ) ( not ( = ?auto_21225 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21227 ) ) ( ON ?auto_21227 ?auto_21228 ) ( CLEAR ?auto_21227 ) ( HAND-EMPTY ) ( not ( = ?auto_21225 ?auto_21228 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( not ( = ?auto_21227 ?auto_21228 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21227 ?auto_21228 )
      ( MAKE-3PILE ?auto_21225 ?auto_21226 ?auto_21227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21229 - BLOCK
      ?auto_21230 - BLOCK
      ?auto_21231 - BLOCK
    )
    :vars
    (
      ?auto_21232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21229 ) ( not ( = ?auto_21229 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21231 ) ) ( not ( = ?auto_21230 ?auto_21231 ) ) ( ON ?auto_21231 ?auto_21232 ) ( CLEAR ?auto_21231 ) ( not ( = ?auto_21229 ?auto_21232 ) ) ( not ( = ?auto_21230 ?auto_21232 ) ) ( not ( = ?auto_21231 ?auto_21232 ) ) ( HOLDING ?auto_21230 ) ( CLEAR ?auto_21229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21229 ?auto_21230 )
      ( MAKE-3PILE ?auto_21229 ?auto_21230 ?auto_21231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21233 - BLOCK
      ?auto_21234 - BLOCK
      ?auto_21235 - BLOCK
    )
    :vars
    (
      ?auto_21236 - BLOCK
      ?auto_21237 - BLOCK
      ?auto_21238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21233 ) ( not ( = ?auto_21233 ?auto_21234 ) ) ( not ( = ?auto_21233 ?auto_21235 ) ) ( not ( = ?auto_21234 ?auto_21235 ) ) ( ON ?auto_21235 ?auto_21236 ) ( not ( = ?auto_21233 ?auto_21236 ) ) ( not ( = ?auto_21234 ?auto_21236 ) ) ( not ( = ?auto_21235 ?auto_21236 ) ) ( CLEAR ?auto_21233 ) ( ON ?auto_21234 ?auto_21235 ) ( CLEAR ?auto_21234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21237 ) ( ON ?auto_21238 ?auto_21237 ) ( ON ?auto_21236 ?auto_21238 ) ( not ( = ?auto_21237 ?auto_21238 ) ) ( not ( = ?auto_21237 ?auto_21236 ) ) ( not ( = ?auto_21237 ?auto_21235 ) ) ( not ( = ?auto_21237 ?auto_21234 ) ) ( not ( = ?auto_21238 ?auto_21236 ) ) ( not ( = ?auto_21238 ?auto_21235 ) ) ( not ( = ?auto_21238 ?auto_21234 ) ) ( not ( = ?auto_21233 ?auto_21237 ) ) ( not ( = ?auto_21233 ?auto_21238 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21237 ?auto_21238 ?auto_21236 ?auto_21235 )
      ( MAKE-3PILE ?auto_21233 ?auto_21234 ?auto_21235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21239 - BLOCK
      ?auto_21240 - BLOCK
      ?auto_21241 - BLOCK
    )
    :vars
    (
      ?auto_21242 - BLOCK
      ?auto_21243 - BLOCK
      ?auto_21244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21239 ?auto_21240 ) ) ( not ( = ?auto_21239 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( ON ?auto_21241 ?auto_21242 ) ( not ( = ?auto_21239 ?auto_21242 ) ) ( not ( = ?auto_21240 ?auto_21242 ) ) ( not ( = ?auto_21241 ?auto_21242 ) ) ( ON ?auto_21240 ?auto_21241 ) ( CLEAR ?auto_21240 ) ( ON-TABLE ?auto_21243 ) ( ON ?auto_21244 ?auto_21243 ) ( ON ?auto_21242 ?auto_21244 ) ( not ( = ?auto_21243 ?auto_21244 ) ) ( not ( = ?auto_21243 ?auto_21242 ) ) ( not ( = ?auto_21243 ?auto_21241 ) ) ( not ( = ?auto_21243 ?auto_21240 ) ) ( not ( = ?auto_21244 ?auto_21242 ) ) ( not ( = ?auto_21244 ?auto_21241 ) ) ( not ( = ?auto_21244 ?auto_21240 ) ) ( not ( = ?auto_21239 ?auto_21243 ) ) ( not ( = ?auto_21239 ?auto_21244 ) ) ( HOLDING ?auto_21239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21239 )
      ( MAKE-3PILE ?auto_21239 ?auto_21240 ?auto_21241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21245 - BLOCK
      ?auto_21246 - BLOCK
      ?auto_21247 - BLOCK
    )
    :vars
    (
      ?auto_21249 - BLOCK
      ?auto_21250 - BLOCK
      ?auto_21248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21245 ?auto_21246 ) ) ( not ( = ?auto_21245 ?auto_21247 ) ) ( not ( = ?auto_21246 ?auto_21247 ) ) ( ON ?auto_21247 ?auto_21249 ) ( not ( = ?auto_21245 ?auto_21249 ) ) ( not ( = ?auto_21246 ?auto_21249 ) ) ( not ( = ?auto_21247 ?auto_21249 ) ) ( ON ?auto_21246 ?auto_21247 ) ( ON-TABLE ?auto_21250 ) ( ON ?auto_21248 ?auto_21250 ) ( ON ?auto_21249 ?auto_21248 ) ( not ( = ?auto_21250 ?auto_21248 ) ) ( not ( = ?auto_21250 ?auto_21249 ) ) ( not ( = ?auto_21250 ?auto_21247 ) ) ( not ( = ?auto_21250 ?auto_21246 ) ) ( not ( = ?auto_21248 ?auto_21249 ) ) ( not ( = ?auto_21248 ?auto_21247 ) ) ( not ( = ?auto_21248 ?auto_21246 ) ) ( not ( = ?auto_21245 ?auto_21250 ) ) ( not ( = ?auto_21245 ?auto_21248 ) ) ( ON ?auto_21245 ?auto_21246 ) ( CLEAR ?auto_21245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21250 ?auto_21248 ?auto_21249 ?auto_21247 ?auto_21246 )
      ( MAKE-3PILE ?auto_21245 ?auto_21246 ?auto_21247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21253 - BLOCK
      ?auto_21254 - BLOCK
    )
    :vars
    (
      ?auto_21255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21255 ?auto_21254 ) ( CLEAR ?auto_21255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21253 ) ( ON ?auto_21254 ?auto_21253 ) ( not ( = ?auto_21253 ?auto_21254 ) ) ( not ( = ?auto_21253 ?auto_21255 ) ) ( not ( = ?auto_21254 ?auto_21255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21255 ?auto_21254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21256 - BLOCK
      ?auto_21257 - BLOCK
    )
    :vars
    (
      ?auto_21258 - BLOCK
      ?auto_21259 - BLOCK
      ?auto_21260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21258 ?auto_21257 ) ( CLEAR ?auto_21258 ) ( ON-TABLE ?auto_21256 ) ( ON ?auto_21257 ?auto_21256 ) ( not ( = ?auto_21256 ?auto_21257 ) ) ( not ( = ?auto_21256 ?auto_21258 ) ) ( not ( = ?auto_21257 ?auto_21258 ) ) ( HOLDING ?auto_21259 ) ( CLEAR ?auto_21260 ) ( not ( = ?auto_21256 ?auto_21259 ) ) ( not ( = ?auto_21256 ?auto_21260 ) ) ( not ( = ?auto_21257 ?auto_21259 ) ) ( not ( = ?auto_21257 ?auto_21260 ) ) ( not ( = ?auto_21258 ?auto_21259 ) ) ( not ( = ?auto_21258 ?auto_21260 ) ) ( not ( = ?auto_21259 ?auto_21260 ) ) )
    :subtasks
    ( ( !STACK ?auto_21259 ?auto_21260 )
      ( MAKE-2PILE ?auto_21256 ?auto_21257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21261 - BLOCK
      ?auto_21262 - BLOCK
    )
    :vars
    (
      ?auto_21265 - BLOCK
      ?auto_21264 - BLOCK
      ?auto_21263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21265 ?auto_21262 ) ( ON-TABLE ?auto_21261 ) ( ON ?auto_21262 ?auto_21261 ) ( not ( = ?auto_21261 ?auto_21262 ) ) ( not ( = ?auto_21261 ?auto_21265 ) ) ( not ( = ?auto_21262 ?auto_21265 ) ) ( CLEAR ?auto_21264 ) ( not ( = ?auto_21261 ?auto_21263 ) ) ( not ( = ?auto_21261 ?auto_21264 ) ) ( not ( = ?auto_21262 ?auto_21263 ) ) ( not ( = ?auto_21262 ?auto_21264 ) ) ( not ( = ?auto_21265 ?auto_21263 ) ) ( not ( = ?auto_21265 ?auto_21264 ) ) ( not ( = ?auto_21263 ?auto_21264 ) ) ( ON ?auto_21263 ?auto_21265 ) ( CLEAR ?auto_21263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21261 ?auto_21262 ?auto_21265 )
      ( MAKE-2PILE ?auto_21261 ?auto_21262 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21266 - BLOCK
      ?auto_21267 - BLOCK
    )
    :vars
    (
      ?auto_21269 - BLOCK
      ?auto_21268 - BLOCK
      ?auto_21270 - BLOCK
      ?auto_21271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21269 ?auto_21267 ) ( ON-TABLE ?auto_21266 ) ( ON ?auto_21267 ?auto_21266 ) ( not ( = ?auto_21266 ?auto_21267 ) ) ( not ( = ?auto_21266 ?auto_21269 ) ) ( not ( = ?auto_21267 ?auto_21269 ) ) ( not ( = ?auto_21266 ?auto_21268 ) ) ( not ( = ?auto_21266 ?auto_21270 ) ) ( not ( = ?auto_21267 ?auto_21268 ) ) ( not ( = ?auto_21267 ?auto_21270 ) ) ( not ( = ?auto_21269 ?auto_21268 ) ) ( not ( = ?auto_21269 ?auto_21270 ) ) ( not ( = ?auto_21268 ?auto_21270 ) ) ( ON ?auto_21268 ?auto_21269 ) ( CLEAR ?auto_21268 ) ( HOLDING ?auto_21270 ) ( CLEAR ?auto_21271 ) ( ON-TABLE ?auto_21271 ) ( not ( = ?auto_21271 ?auto_21270 ) ) ( not ( = ?auto_21266 ?auto_21271 ) ) ( not ( = ?auto_21267 ?auto_21271 ) ) ( not ( = ?auto_21269 ?auto_21271 ) ) ( not ( = ?auto_21268 ?auto_21271 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21271 ?auto_21270 )
      ( MAKE-2PILE ?auto_21266 ?auto_21267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21272 - BLOCK
      ?auto_21273 - BLOCK
    )
    :vars
    (
      ?auto_21277 - BLOCK
      ?auto_21275 - BLOCK
      ?auto_21276 - BLOCK
      ?auto_21274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21277 ?auto_21273 ) ( ON-TABLE ?auto_21272 ) ( ON ?auto_21273 ?auto_21272 ) ( not ( = ?auto_21272 ?auto_21273 ) ) ( not ( = ?auto_21272 ?auto_21277 ) ) ( not ( = ?auto_21273 ?auto_21277 ) ) ( not ( = ?auto_21272 ?auto_21275 ) ) ( not ( = ?auto_21272 ?auto_21276 ) ) ( not ( = ?auto_21273 ?auto_21275 ) ) ( not ( = ?auto_21273 ?auto_21276 ) ) ( not ( = ?auto_21277 ?auto_21275 ) ) ( not ( = ?auto_21277 ?auto_21276 ) ) ( not ( = ?auto_21275 ?auto_21276 ) ) ( ON ?auto_21275 ?auto_21277 ) ( CLEAR ?auto_21274 ) ( ON-TABLE ?auto_21274 ) ( not ( = ?auto_21274 ?auto_21276 ) ) ( not ( = ?auto_21272 ?auto_21274 ) ) ( not ( = ?auto_21273 ?auto_21274 ) ) ( not ( = ?auto_21277 ?auto_21274 ) ) ( not ( = ?auto_21275 ?auto_21274 ) ) ( ON ?auto_21276 ?auto_21275 ) ( CLEAR ?auto_21276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21272 ?auto_21273 ?auto_21277 ?auto_21275 )
      ( MAKE-2PILE ?auto_21272 ?auto_21273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21278 - BLOCK
      ?auto_21279 - BLOCK
    )
    :vars
    (
      ?auto_21281 - BLOCK
      ?auto_21280 - BLOCK
      ?auto_21283 - BLOCK
      ?auto_21282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21281 ?auto_21279 ) ( ON-TABLE ?auto_21278 ) ( ON ?auto_21279 ?auto_21278 ) ( not ( = ?auto_21278 ?auto_21279 ) ) ( not ( = ?auto_21278 ?auto_21281 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) ( not ( = ?auto_21278 ?auto_21280 ) ) ( not ( = ?auto_21278 ?auto_21283 ) ) ( not ( = ?auto_21279 ?auto_21280 ) ) ( not ( = ?auto_21279 ?auto_21283 ) ) ( not ( = ?auto_21281 ?auto_21280 ) ) ( not ( = ?auto_21281 ?auto_21283 ) ) ( not ( = ?auto_21280 ?auto_21283 ) ) ( ON ?auto_21280 ?auto_21281 ) ( not ( = ?auto_21282 ?auto_21283 ) ) ( not ( = ?auto_21278 ?auto_21282 ) ) ( not ( = ?auto_21279 ?auto_21282 ) ) ( not ( = ?auto_21281 ?auto_21282 ) ) ( not ( = ?auto_21280 ?auto_21282 ) ) ( ON ?auto_21283 ?auto_21280 ) ( CLEAR ?auto_21283 ) ( HOLDING ?auto_21282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21282 )
      ( MAKE-2PILE ?auto_21278 ?auto_21279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21284 - BLOCK
      ?auto_21285 - BLOCK
    )
    :vars
    (
      ?auto_21286 - BLOCK
      ?auto_21288 - BLOCK
      ?auto_21287 - BLOCK
      ?auto_21289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21286 ?auto_21285 ) ( ON-TABLE ?auto_21284 ) ( ON ?auto_21285 ?auto_21284 ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21286 ) ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( not ( = ?auto_21284 ?auto_21288 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21285 ?auto_21288 ) ) ( not ( = ?auto_21285 ?auto_21287 ) ) ( not ( = ?auto_21286 ?auto_21288 ) ) ( not ( = ?auto_21286 ?auto_21287 ) ) ( not ( = ?auto_21288 ?auto_21287 ) ) ( ON ?auto_21288 ?auto_21286 ) ( not ( = ?auto_21289 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21289 ) ) ( not ( = ?auto_21285 ?auto_21289 ) ) ( not ( = ?auto_21286 ?auto_21289 ) ) ( not ( = ?auto_21288 ?auto_21289 ) ) ( ON ?auto_21287 ?auto_21288 ) ( ON ?auto_21289 ?auto_21287 ) ( CLEAR ?auto_21289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21284 ?auto_21285 ?auto_21286 ?auto_21288 ?auto_21287 )
      ( MAKE-2PILE ?auto_21284 ?auto_21285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21294 - BLOCK
      ?auto_21295 - BLOCK
      ?auto_21296 - BLOCK
      ?auto_21297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21297 ) ( CLEAR ?auto_21296 ) ( ON-TABLE ?auto_21294 ) ( ON ?auto_21295 ?auto_21294 ) ( ON ?auto_21296 ?auto_21295 ) ( not ( = ?auto_21294 ?auto_21295 ) ) ( not ( = ?auto_21294 ?auto_21296 ) ) ( not ( = ?auto_21294 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21296 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21297 ) ) )
    :subtasks
    ( ( !STACK ?auto_21297 ?auto_21296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21298 - BLOCK
      ?auto_21299 - BLOCK
      ?auto_21300 - BLOCK
      ?auto_21301 - BLOCK
    )
    :vars
    (
      ?auto_21302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21300 ) ( ON-TABLE ?auto_21298 ) ( ON ?auto_21299 ?auto_21298 ) ( ON ?auto_21300 ?auto_21299 ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( ON ?auto_21301 ?auto_21302 ) ( CLEAR ?auto_21301 ) ( HAND-EMPTY ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21301 ?auto_21302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21301 ?auto_21302 )
      ( MAKE-4PILE ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21303 - BLOCK
      ?auto_21304 - BLOCK
      ?auto_21305 - BLOCK
      ?auto_21306 - BLOCK
    )
    :vars
    (
      ?auto_21307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21303 ) ( ON ?auto_21304 ?auto_21303 ) ( not ( = ?auto_21303 ?auto_21304 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21306 ) ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21304 ?auto_21306 ) ) ( not ( = ?auto_21305 ?auto_21306 ) ) ( ON ?auto_21306 ?auto_21307 ) ( CLEAR ?auto_21306 ) ( not ( = ?auto_21303 ?auto_21307 ) ) ( not ( = ?auto_21304 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21306 ?auto_21307 ) ) ( HOLDING ?auto_21305 ) ( CLEAR ?auto_21304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21303 ?auto_21304 ?auto_21305 )
      ( MAKE-4PILE ?auto_21303 ?auto_21304 ?auto_21305 ?auto_21306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21308 - BLOCK
      ?auto_21309 - BLOCK
      ?auto_21310 - BLOCK
      ?auto_21311 - BLOCK
    )
    :vars
    (
      ?auto_21312 - BLOCK
      ?auto_21313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21308 ) ( ON ?auto_21309 ?auto_21308 ) ( not ( = ?auto_21308 ?auto_21309 ) ) ( not ( = ?auto_21308 ?auto_21310 ) ) ( not ( = ?auto_21308 ?auto_21311 ) ) ( not ( = ?auto_21309 ?auto_21310 ) ) ( not ( = ?auto_21309 ?auto_21311 ) ) ( not ( = ?auto_21310 ?auto_21311 ) ) ( ON ?auto_21311 ?auto_21312 ) ( not ( = ?auto_21308 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21312 ) ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( CLEAR ?auto_21309 ) ( ON ?auto_21310 ?auto_21311 ) ( CLEAR ?auto_21310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21313 ) ( ON ?auto_21312 ?auto_21313 ) ( not ( = ?auto_21313 ?auto_21312 ) ) ( not ( = ?auto_21313 ?auto_21311 ) ) ( not ( = ?auto_21313 ?auto_21310 ) ) ( not ( = ?auto_21308 ?auto_21313 ) ) ( not ( = ?auto_21309 ?auto_21313 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21313 ?auto_21312 ?auto_21311 )
      ( MAKE-4PILE ?auto_21308 ?auto_21309 ?auto_21310 ?auto_21311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21314 - BLOCK
      ?auto_21315 - BLOCK
      ?auto_21316 - BLOCK
      ?auto_21317 - BLOCK
    )
    :vars
    (
      ?auto_21318 - BLOCK
      ?auto_21319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21314 ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( not ( = ?auto_21314 ?auto_21316 ) ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( ON ?auto_21317 ?auto_21318 ) ( not ( = ?auto_21314 ?auto_21318 ) ) ( not ( = ?auto_21315 ?auto_21318 ) ) ( not ( = ?auto_21316 ?auto_21318 ) ) ( not ( = ?auto_21317 ?auto_21318 ) ) ( ON ?auto_21316 ?auto_21317 ) ( CLEAR ?auto_21316 ) ( ON-TABLE ?auto_21319 ) ( ON ?auto_21318 ?auto_21319 ) ( not ( = ?auto_21319 ?auto_21318 ) ) ( not ( = ?auto_21319 ?auto_21317 ) ) ( not ( = ?auto_21319 ?auto_21316 ) ) ( not ( = ?auto_21314 ?auto_21319 ) ) ( not ( = ?auto_21315 ?auto_21319 ) ) ( HOLDING ?auto_21315 ) ( CLEAR ?auto_21314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21314 ?auto_21315 )
      ( MAKE-4PILE ?auto_21314 ?auto_21315 ?auto_21316 ?auto_21317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21320 - BLOCK
      ?auto_21321 - BLOCK
      ?auto_21322 - BLOCK
      ?auto_21323 - BLOCK
    )
    :vars
    (
      ?auto_21325 - BLOCK
      ?auto_21324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21320 ) ( not ( = ?auto_21320 ?auto_21321 ) ) ( not ( = ?auto_21320 ?auto_21322 ) ) ( not ( = ?auto_21320 ?auto_21323 ) ) ( not ( = ?auto_21321 ?auto_21322 ) ) ( not ( = ?auto_21321 ?auto_21323 ) ) ( not ( = ?auto_21322 ?auto_21323 ) ) ( ON ?auto_21323 ?auto_21325 ) ( not ( = ?auto_21320 ?auto_21325 ) ) ( not ( = ?auto_21321 ?auto_21325 ) ) ( not ( = ?auto_21322 ?auto_21325 ) ) ( not ( = ?auto_21323 ?auto_21325 ) ) ( ON ?auto_21322 ?auto_21323 ) ( ON-TABLE ?auto_21324 ) ( ON ?auto_21325 ?auto_21324 ) ( not ( = ?auto_21324 ?auto_21325 ) ) ( not ( = ?auto_21324 ?auto_21323 ) ) ( not ( = ?auto_21324 ?auto_21322 ) ) ( not ( = ?auto_21320 ?auto_21324 ) ) ( not ( = ?auto_21321 ?auto_21324 ) ) ( CLEAR ?auto_21320 ) ( ON ?auto_21321 ?auto_21322 ) ( CLEAR ?auto_21321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21324 ?auto_21325 ?auto_21323 ?auto_21322 )
      ( MAKE-4PILE ?auto_21320 ?auto_21321 ?auto_21322 ?auto_21323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21326 - BLOCK
      ?auto_21327 - BLOCK
      ?auto_21328 - BLOCK
      ?auto_21329 - BLOCK
    )
    :vars
    (
      ?auto_21331 - BLOCK
      ?auto_21330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21326 ?auto_21327 ) ) ( not ( = ?auto_21326 ?auto_21328 ) ) ( not ( = ?auto_21326 ?auto_21329 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21329 ) ) ( not ( = ?auto_21328 ?auto_21329 ) ) ( ON ?auto_21329 ?auto_21331 ) ( not ( = ?auto_21326 ?auto_21331 ) ) ( not ( = ?auto_21327 ?auto_21331 ) ) ( not ( = ?auto_21328 ?auto_21331 ) ) ( not ( = ?auto_21329 ?auto_21331 ) ) ( ON ?auto_21328 ?auto_21329 ) ( ON-TABLE ?auto_21330 ) ( ON ?auto_21331 ?auto_21330 ) ( not ( = ?auto_21330 ?auto_21331 ) ) ( not ( = ?auto_21330 ?auto_21329 ) ) ( not ( = ?auto_21330 ?auto_21328 ) ) ( not ( = ?auto_21326 ?auto_21330 ) ) ( not ( = ?auto_21327 ?auto_21330 ) ) ( ON ?auto_21327 ?auto_21328 ) ( CLEAR ?auto_21327 ) ( HOLDING ?auto_21326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21326 )
      ( MAKE-4PILE ?auto_21326 ?auto_21327 ?auto_21328 ?auto_21329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21332 - BLOCK
      ?auto_21333 - BLOCK
      ?auto_21334 - BLOCK
      ?auto_21335 - BLOCK
    )
    :vars
    (
      ?auto_21336 - BLOCK
      ?auto_21337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21332 ?auto_21333 ) ) ( not ( = ?auto_21332 ?auto_21334 ) ) ( not ( = ?auto_21332 ?auto_21335 ) ) ( not ( = ?auto_21333 ?auto_21334 ) ) ( not ( = ?auto_21333 ?auto_21335 ) ) ( not ( = ?auto_21334 ?auto_21335 ) ) ( ON ?auto_21335 ?auto_21336 ) ( not ( = ?auto_21332 ?auto_21336 ) ) ( not ( = ?auto_21333 ?auto_21336 ) ) ( not ( = ?auto_21334 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( ON ?auto_21334 ?auto_21335 ) ( ON-TABLE ?auto_21337 ) ( ON ?auto_21336 ?auto_21337 ) ( not ( = ?auto_21337 ?auto_21336 ) ) ( not ( = ?auto_21337 ?auto_21335 ) ) ( not ( = ?auto_21337 ?auto_21334 ) ) ( not ( = ?auto_21332 ?auto_21337 ) ) ( not ( = ?auto_21333 ?auto_21337 ) ) ( ON ?auto_21333 ?auto_21334 ) ( ON ?auto_21332 ?auto_21333 ) ( CLEAR ?auto_21332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21337 ?auto_21336 ?auto_21335 ?auto_21334 ?auto_21333 )
      ( MAKE-4PILE ?auto_21332 ?auto_21333 ?auto_21334 ?auto_21335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21339 - BLOCK
    )
    :vars
    (
      ?auto_21340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21340 ?auto_21339 ) ( CLEAR ?auto_21340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21339 ) ( not ( = ?auto_21339 ?auto_21340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21340 ?auto_21339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21341 - BLOCK
    )
    :vars
    (
      ?auto_21342 - BLOCK
      ?auto_21343 - BLOCK
      ?auto_21344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21342 ?auto_21341 ) ( CLEAR ?auto_21342 ) ( ON-TABLE ?auto_21341 ) ( not ( = ?auto_21341 ?auto_21342 ) ) ( HOLDING ?auto_21343 ) ( CLEAR ?auto_21344 ) ( not ( = ?auto_21341 ?auto_21343 ) ) ( not ( = ?auto_21341 ?auto_21344 ) ) ( not ( = ?auto_21342 ?auto_21343 ) ) ( not ( = ?auto_21342 ?auto_21344 ) ) ( not ( = ?auto_21343 ?auto_21344 ) ) )
    :subtasks
    ( ( !STACK ?auto_21343 ?auto_21344 )
      ( MAKE-1PILE ?auto_21341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21345 - BLOCK
    )
    :vars
    (
      ?auto_21348 - BLOCK
      ?auto_21346 - BLOCK
      ?auto_21347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21348 ?auto_21345 ) ( ON-TABLE ?auto_21345 ) ( not ( = ?auto_21345 ?auto_21348 ) ) ( CLEAR ?auto_21346 ) ( not ( = ?auto_21345 ?auto_21347 ) ) ( not ( = ?auto_21345 ?auto_21346 ) ) ( not ( = ?auto_21348 ?auto_21347 ) ) ( not ( = ?auto_21348 ?auto_21346 ) ) ( not ( = ?auto_21347 ?auto_21346 ) ) ( ON ?auto_21347 ?auto_21348 ) ( CLEAR ?auto_21347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21345 ?auto_21348 )
      ( MAKE-1PILE ?auto_21345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21349 - BLOCK
    )
    :vars
    (
      ?auto_21350 - BLOCK
      ?auto_21352 - BLOCK
      ?auto_21351 - BLOCK
      ?auto_21353 - BLOCK
      ?auto_21354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21350 ?auto_21349 ) ( ON-TABLE ?auto_21349 ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( not ( = ?auto_21349 ?auto_21352 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( not ( = ?auto_21350 ?auto_21352 ) ) ( not ( = ?auto_21350 ?auto_21351 ) ) ( not ( = ?auto_21352 ?auto_21351 ) ) ( ON ?auto_21352 ?auto_21350 ) ( CLEAR ?auto_21352 ) ( HOLDING ?auto_21351 ) ( CLEAR ?auto_21353 ) ( ON-TABLE ?auto_21354 ) ( ON ?auto_21353 ?auto_21354 ) ( not ( = ?auto_21354 ?auto_21353 ) ) ( not ( = ?auto_21354 ?auto_21351 ) ) ( not ( = ?auto_21353 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21353 ) ) ( not ( = ?auto_21349 ?auto_21354 ) ) ( not ( = ?auto_21350 ?auto_21353 ) ) ( not ( = ?auto_21350 ?auto_21354 ) ) ( not ( = ?auto_21352 ?auto_21353 ) ) ( not ( = ?auto_21352 ?auto_21354 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21354 ?auto_21353 ?auto_21351 )
      ( MAKE-1PILE ?auto_21349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21355 - BLOCK
    )
    :vars
    (
      ?auto_21360 - BLOCK
      ?auto_21358 - BLOCK
      ?auto_21357 - BLOCK
      ?auto_21359 - BLOCK
      ?auto_21356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21360 ?auto_21355 ) ( ON-TABLE ?auto_21355 ) ( not ( = ?auto_21355 ?auto_21360 ) ) ( not ( = ?auto_21355 ?auto_21358 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21360 ?auto_21358 ) ) ( not ( = ?auto_21360 ?auto_21357 ) ) ( not ( = ?auto_21358 ?auto_21357 ) ) ( ON ?auto_21358 ?auto_21360 ) ( CLEAR ?auto_21359 ) ( ON-TABLE ?auto_21356 ) ( ON ?auto_21359 ?auto_21356 ) ( not ( = ?auto_21356 ?auto_21359 ) ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21359 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( not ( = ?auto_21360 ?auto_21359 ) ) ( not ( = ?auto_21360 ?auto_21356 ) ) ( not ( = ?auto_21358 ?auto_21359 ) ) ( not ( = ?auto_21358 ?auto_21356 ) ) ( ON ?auto_21357 ?auto_21358 ) ( CLEAR ?auto_21357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21355 ?auto_21360 ?auto_21358 )
      ( MAKE-1PILE ?auto_21355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21361 - BLOCK
    )
    :vars
    (
      ?auto_21363 - BLOCK
      ?auto_21364 - BLOCK
      ?auto_21362 - BLOCK
      ?auto_21366 - BLOCK
      ?auto_21365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21363 ?auto_21361 ) ( ON-TABLE ?auto_21361 ) ( not ( = ?auto_21361 ?auto_21363 ) ) ( not ( = ?auto_21361 ?auto_21364 ) ) ( not ( = ?auto_21361 ?auto_21362 ) ) ( not ( = ?auto_21363 ?auto_21364 ) ) ( not ( = ?auto_21363 ?auto_21362 ) ) ( not ( = ?auto_21364 ?auto_21362 ) ) ( ON ?auto_21364 ?auto_21363 ) ( ON-TABLE ?auto_21366 ) ( not ( = ?auto_21366 ?auto_21365 ) ) ( not ( = ?auto_21366 ?auto_21362 ) ) ( not ( = ?auto_21365 ?auto_21362 ) ) ( not ( = ?auto_21361 ?auto_21365 ) ) ( not ( = ?auto_21361 ?auto_21366 ) ) ( not ( = ?auto_21363 ?auto_21365 ) ) ( not ( = ?auto_21363 ?auto_21366 ) ) ( not ( = ?auto_21364 ?auto_21365 ) ) ( not ( = ?auto_21364 ?auto_21366 ) ) ( ON ?auto_21362 ?auto_21364 ) ( CLEAR ?auto_21362 ) ( HOLDING ?auto_21365 ) ( CLEAR ?auto_21366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21366 ?auto_21365 )
      ( MAKE-1PILE ?auto_21361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21367 - BLOCK
    )
    :vars
    (
      ?auto_21371 - BLOCK
      ?auto_21369 - BLOCK
      ?auto_21372 - BLOCK
      ?auto_21370 - BLOCK
      ?auto_21368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21371 ?auto_21367 ) ( ON-TABLE ?auto_21367 ) ( not ( = ?auto_21367 ?auto_21371 ) ) ( not ( = ?auto_21367 ?auto_21369 ) ) ( not ( = ?auto_21367 ?auto_21372 ) ) ( not ( = ?auto_21371 ?auto_21369 ) ) ( not ( = ?auto_21371 ?auto_21372 ) ) ( not ( = ?auto_21369 ?auto_21372 ) ) ( ON ?auto_21369 ?auto_21371 ) ( ON-TABLE ?auto_21370 ) ( not ( = ?auto_21370 ?auto_21368 ) ) ( not ( = ?auto_21370 ?auto_21372 ) ) ( not ( = ?auto_21368 ?auto_21372 ) ) ( not ( = ?auto_21367 ?auto_21368 ) ) ( not ( = ?auto_21367 ?auto_21370 ) ) ( not ( = ?auto_21371 ?auto_21368 ) ) ( not ( = ?auto_21371 ?auto_21370 ) ) ( not ( = ?auto_21369 ?auto_21368 ) ) ( not ( = ?auto_21369 ?auto_21370 ) ) ( ON ?auto_21372 ?auto_21369 ) ( CLEAR ?auto_21370 ) ( ON ?auto_21368 ?auto_21372 ) ( CLEAR ?auto_21368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21367 ?auto_21371 ?auto_21369 ?auto_21372 )
      ( MAKE-1PILE ?auto_21367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21373 - BLOCK
    )
    :vars
    (
      ?auto_21377 - BLOCK
      ?auto_21378 - BLOCK
      ?auto_21374 - BLOCK
      ?auto_21375 - BLOCK
      ?auto_21376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21377 ?auto_21373 ) ( ON-TABLE ?auto_21373 ) ( not ( = ?auto_21373 ?auto_21377 ) ) ( not ( = ?auto_21373 ?auto_21378 ) ) ( not ( = ?auto_21373 ?auto_21374 ) ) ( not ( = ?auto_21377 ?auto_21378 ) ) ( not ( = ?auto_21377 ?auto_21374 ) ) ( not ( = ?auto_21378 ?auto_21374 ) ) ( ON ?auto_21378 ?auto_21377 ) ( not ( = ?auto_21375 ?auto_21376 ) ) ( not ( = ?auto_21375 ?auto_21374 ) ) ( not ( = ?auto_21376 ?auto_21374 ) ) ( not ( = ?auto_21373 ?auto_21376 ) ) ( not ( = ?auto_21373 ?auto_21375 ) ) ( not ( = ?auto_21377 ?auto_21376 ) ) ( not ( = ?auto_21377 ?auto_21375 ) ) ( not ( = ?auto_21378 ?auto_21376 ) ) ( not ( = ?auto_21378 ?auto_21375 ) ) ( ON ?auto_21374 ?auto_21378 ) ( ON ?auto_21376 ?auto_21374 ) ( CLEAR ?auto_21376 ) ( HOLDING ?auto_21375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21375 )
      ( MAKE-1PILE ?auto_21373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21379 - BLOCK
    )
    :vars
    (
      ?auto_21380 - BLOCK
      ?auto_21384 - BLOCK
      ?auto_21383 - BLOCK
      ?auto_21381 - BLOCK
      ?auto_21382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21380 ?auto_21379 ) ( ON-TABLE ?auto_21379 ) ( not ( = ?auto_21379 ?auto_21380 ) ) ( not ( = ?auto_21379 ?auto_21384 ) ) ( not ( = ?auto_21379 ?auto_21383 ) ) ( not ( = ?auto_21380 ?auto_21384 ) ) ( not ( = ?auto_21380 ?auto_21383 ) ) ( not ( = ?auto_21384 ?auto_21383 ) ) ( ON ?auto_21384 ?auto_21380 ) ( not ( = ?auto_21381 ?auto_21382 ) ) ( not ( = ?auto_21381 ?auto_21383 ) ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21379 ?auto_21382 ) ) ( not ( = ?auto_21379 ?auto_21381 ) ) ( not ( = ?auto_21380 ?auto_21382 ) ) ( not ( = ?auto_21380 ?auto_21381 ) ) ( not ( = ?auto_21384 ?auto_21382 ) ) ( not ( = ?auto_21384 ?auto_21381 ) ) ( ON ?auto_21383 ?auto_21384 ) ( ON ?auto_21382 ?auto_21383 ) ( ON ?auto_21381 ?auto_21382 ) ( CLEAR ?auto_21381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21379 ?auto_21380 ?auto_21384 ?auto_21383 ?auto_21382 )
      ( MAKE-1PILE ?auto_21379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21390 - BLOCK
      ?auto_21391 - BLOCK
      ?auto_21392 - BLOCK
      ?auto_21393 - BLOCK
      ?auto_21394 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21394 ) ( CLEAR ?auto_21393 ) ( ON-TABLE ?auto_21390 ) ( ON ?auto_21391 ?auto_21390 ) ( ON ?auto_21392 ?auto_21391 ) ( ON ?auto_21393 ?auto_21392 ) ( not ( = ?auto_21390 ?auto_21391 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( not ( = ?auto_21390 ?auto_21393 ) ) ( not ( = ?auto_21390 ?auto_21394 ) ) ( not ( = ?auto_21391 ?auto_21392 ) ) ( not ( = ?auto_21391 ?auto_21393 ) ) ( not ( = ?auto_21391 ?auto_21394 ) ) ( not ( = ?auto_21392 ?auto_21393 ) ) ( not ( = ?auto_21392 ?auto_21394 ) ) ( not ( = ?auto_21393 ?auto_21394 ) ) )
    :subtasks
    ( ( !STACK ?auto_21394 ?auto_21393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21395 - BLOCK
      ?auto_21396 - BLOCK
      ?auto_21397 - BLOCK
      ?auto_21398 - BLOCK
      ?auto_21399 - BLOCK
    )
    :vars
    (
      ?auto_21400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21398 ) ( ON-TABLE ?auto_21395 ) ( ON ?auto_21396 ?auto_21395 ) ( ON ?auto_21397 ?auto_21396 ) ( ON ?auto_21398 ?auto_21397 ) ( not ( = ?auto_21395 ?auto_21396 ) ) ( not ( = ?auto_21395 ?auto_21397 ) ) ( not ( = ?auto_21395 ?auto_21398 ) ) ( not ( = ?auto_21395 ?auto_21399 ) ) ( not ( = ?auto_21396 ?auto_21397 ) ) ( not ( = ?auto_21396 ?auto_21398 ) ) ( not ( = ?auto_21396 ?auto_21399 ) ) ( not ( = ?auto_21397 ?auto_21398 ) ) ( not ( = ?auto_21397 ?auto_21399 ) ) ( not ( = ?auto_21398 ?auto_21399 ) ) ( ON ?auto_21399 ?auto_21400 ) ( CLEAR ?auto_21399 ) ( HAND-EMPTY ) ( not ( = ?auto_21395 ?auto_21400 ) ) ( not ( = ?auto_21396 ?auto_21400 ) ) ( not ( = ?auto_21397 ?auto_21400 ) ) ( not ( = ?auto_21398 ?auto_21400 ) ) ( not ( = ?auto_21399 ?auto_21400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21399 ?auto_21400 )
      ( MAKE-5PILE ?auto_21395 ?auto_21396 ?auto_21397 ?auto_21398 ?auto_21399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21401 - BLOCK
      ?auto_21402 - BLOCK
      ?auto_21403 - BLOCK
      ?auto_21404 - BLOCK
      ?auto_21405 - BLOCK
    )
    :vars
    (
      ?auto_21406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21401 ) ( ON ?auto_21402 ?auto_21401 ) ( ON ?auto_21403 ?auto_21402 ) ( not ( = ?auto_21401 ?auto_21402 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21404 ) ) ( not ( = ?auto_21401 ?auto_21405 ) ) ( not ( = ?auto_21402 ?auto_21403 ) ) ( not ( = ?auto_21402 ?auto_21404 ) ) ( not ( = ?auto_21402 ?auto_21405 ) ) ( not ( = ?auto_21403 ?auto_21404 ) ) ( not ( = ?auto_21403 ?auto_21405 ) ) ( not ( = ?auto_21404 ?auto_21405 ) ) ( ON ?auto_21405 ?auto_21406 ) ( CLEAR ?auto_21405 ) ( not ( = ?auto_21401 ?auto_21406 ) ) ( not ( = ?auto_21402 ?auto_21406 ) ) ( not ( = ?auto_21403 ?auto_21406 ) ) ( not ( = ?auto_21404 ?auto_21406 ) ) ( not ( = ?auto_21405 ?auto_21406 ) ) ( HOLDING ?auto_21404 ) ( CLEAR ?auto_21403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21401 ?auto_21402 ?auto_21403 ?auto_21404 )
      ( MAKE-5PILE ?auto_21401 ?auto_21402 ?auto_21403 ?auto_21404 ?auto_21405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21407 - BLOCK
      ?auto_21408 - BLOCK
      ?auto_21409 - BLOCK
      ?auto_21410 - BLOCK
      ?auto_21411 - BLOCK
    )
    :vars
    (
      ?auto_21412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21407 ) ( ON ?auto_21408 ?auto_21407 ) ( ON ?auto_21409 ?auto_21408 ) ( not ( = ?auto_21407 ?auto_21408 ) ) ( not ( = ?auto_21407 ?auto_21409 ) ) ( not ( = ?auto_21407 ?auto_21410 ) ) ( not ( = ?auto_21407 ?auto_21411 ) ) ( not ( = ?auto_21408 ?auto_21409 ) ) ( not ( = ?auto_21408 ?auto_21410 ) ) ( not ( = ?auto_21408 ?auto_21411 ) ) ( not ( = ?auto_21409 ?auto_21410 ) ) ( not ( = ?auto_21409 ?auto_21411 ) ) ( not ( = ?auto_21410 ?auto_21411 ) ) ( ON ?auto_21411 ?auto_21412 ) ( not ( = ?auto_21407 ?auto_21412 ) ) ( not ( = ?auto_21408 ?auto_21412 ) ) ( not ( = ?auto_21409 ?auto_21412 ) ) ( not ( = ?auto_21410 ?auto_21412 ) ) ( not ( = ?auto_21411 ?auto_21412 ) ) ( CLEAR ?auto_21409 ) ( ON ?auto_21410 ?auto_21411 ) ( CLEAR ?auto_21410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21412 ?auto_21411 )
      ( MAKE-5PILE ?auto_21407 ?auto_21408 ?auto_21409 ?auto_21410 ?auto_21411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21413 - BLOCK
      ?auto_21414 - BLOCK
      ?auto_21415 - BLOCK
      ?auto_21416 - BLOCK
      ?auto_21417 - BLOCK
    )
    :vars
    (
      ?auto_21418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21413 ) ( ON ?auto_21414 ?auto_21413 ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21416 ) ) ( not ( = ?auto_21413 ?auto_21417 ) ) ( not ( = ?auto_21414 ?auto_21415 ) ) ( not ( = ?auto_21414 ?auto_21416 ) ) ( not ( = ?auto_21414 ?auto_21417 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21417 ) ) ( not ( = ?auto_21416 ?auto_21417 ) ) ( ON ?auto_21417 ?auto_21418 ) ( not ( = ?auto_21413 ?auto_21418 ) ) ( not ( = ?auto_21414 ?auto_21418 ) ) ( not ( = ?auto_21415 ?auto_21418 ) ) ( not ( = ?auto_21416 ?auto_21418 ) ) ( not ( = ?auto_21417 ?auto_21418 ) ) ( ON ?auto_21416 ?auto_21417 ) ( CLEAR ?auto_21416 ) ( ON-TABLE ?auto_21418 ) ( HOLDING ?auto_21415 ) ( CLEAR ?auto_21414 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21413 ?auto_21414 ?auto_21415 )
      ( MAKE-5PILE ?auto_21413 ?auto_21414 ?auto_21415 ?auto_21416 ?auto_21417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21419 - BLOCK
      ?auto_21420 - BLOCK
      ?auto_21421 - BLOCK
      ?auto_21422 - BLOCK
      ?auto_21423 - BLOCK
    )
    :vars
    (
      ?auto_21424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21419 ) ( ON ?auto_21420 ?auto_21419 ) ( not ( = ?auto_21419 ?auto_21420 ) ) ( not ( = ?auto_21419 ?auto_21421 ) ) ( not ( = ?auto_21419 ?auto_21422 ) ) ( not ( = ?auto_21419 ?auto_21423 ) ) ( not ( = ?auto_21420 ?auto_21421 ) ) ( not ( = ?auto_21420 ?auto_21422 ) ) ( not ( = ?auto_21420 ?auto_21423 ) ) ( not ( = ?auto_21421 ?auto_21422 ) ) ( not ( = ?auto_21421 ?auto_21423 ) ) ( not ( = ?auto_21422 ?auto_21423 ) ) ( ON ?auto_21423 ?auto_21424 ) ( not ( = ?auto_21419 ?auto_21424 ) ) ( not ( = ?auto_21420 ?auto_21424 ) ) ( not ( = ?auto_21421 ?auto_21424 ) ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( not ( = ?auto_21423 ?auto_21424 ) ) ( ON ?auto_21422 ?auto_21423 ) ( ON-TABLE ?auto_21424 ) ( CLEAR ?auto_21420 ) ( ON ?auto_21421 ?auto_21422 ) ( CLEAR ?auto_21421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21424 ?auto_21423 ?auto_21422 )
      ( MAKE-5PILE ?auto_21419 ?auto_21420 ?auto_21421 ?auto_21422 ?auto_21423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21425 - BLOCK
      ?auto_21426 - BLOCK
      ?auto_21427 - BLOCK
      ?auto_21428 - BLOCK
      ?auto_21429 - BLOCK
    )
    :vars
    (
      ?auto_21430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21425 ) ( not ( = ?auto_21425 ?auto_21426 ) ) ( not ( = ?auto_21425 ?auto_21427 ) ) ( not ( = ?auto_21425 ?auto_21428 ) ) ( not ( = ?auto_21425 ?auto_21429 ) ) ( not ( = ?auto_21426 ?auto_21427 ) ) ( not ( = ?auto_21426 ?auto_21428 ) ) ( not ( = ?auto_21426 ?auto_21429 ) ) ( not ( = ?auto_21427 ?auto_21428 ) ) ( not ( = ?auto_21427 ?auto_21429 ) ) ( not ( = ?auto_21428 ?auto_21429 ) ) ( ON ?auto_21429 ?auto_21430 ) ( not ( = ?auto_21425 ?auto_21430 ) ) ( not ( = ?auto_21426 ?auto_21430 ) ) ( not ( = ?auto_21427 ?auto_21430 ) ) ( not ( = ?auto_21428 ?auto_21430 ) ) ( not ( = ?auto_21429 ?auto_21430 ) ) ( ON ?auto_21428 ?auto_21429 ) ( ON-TABLE ?auto_21430 ) ( ON ?auto_21427 ?auto_21428 ) ( CLEAR ?auto_21427 ) ( HOLDING ?auto_21426 ) ( CLEAR ?auto_21425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21425 ?auto_21426 )
      ( MAKE-5PILE ?auto_21425 ?auto_21426 ?auto_21427 ?auto_21428 ?auto_21429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21431 - BLOCK
      ?auto_21432 - BLOCK
      ?auto_21433 - BLOCK
      ?auto_21434 - BLOCK
      ?auto_21435 - BLOCK
    )
    :vars
    (
      ?auto_21436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21431 ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21434 ) ) ( not ( = ?auto_21431 ?auto_21435 ) ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21432 ?auto_21434 ) ) ( not ( = ?auto_21432 ?auto_21435 ) ) ( not ( = ?auto_21433 ?auto_21434 ) ) ( not ( = ?auto_21433 ?auto_21435 ) ) ( not ( = ?auto_21434 ?auto_21435 ) ) ( ON ?auto_21435 ?auto_21436 ) ( not ( = ?auto_21431 ?auto_21436 ) ) ( not ( = ?auto_21432 ?auto_21436 ) ) ( not ( = ?auto_21433 ?auto_21436 ) ) ( not ( = ?auto_21434 ?auto_21436 ) ) ( not ( = ?auto_21435 ?auto_21436 ) ) ( ON ?auto_21434 ?auto_21435 ) ( ON-TABLE ?auto_21436 ) ( ON ?auto_21433 ?auto_21434 ) ( CLEAR ?auto_21431 ) ( ON ?auto_21432 ?auto_21433 ) ( CLEAR ?auto_21432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21436 ?auto_21435 ?auto_21434 ?auto_21433 )
      ( MAKE-5PILE ?auto_21431 ?auto_21432 ?auto_21433 ?auto_21434 ?auto_21435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21437 - BLOCK
      ?auto_21438 - BLOCK
      ?auto_21439 - BLOCK
      ?auto_21440 - BLOCK
      ?auto_21441 - BLOCK
    )
    :vars
    (
      ?auto_21442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21437 ?auto_21438 ) ) ( not ( = ?auto_21437 ?auto_21439 ) ) ( not ( = ?auto_21437 ?auto_21440 ) ) ( not ( = ?auto_21437 ?auto_21441 ) ) ( not ( = ?auto_21438 ?auto_21439 ) ) ( not ( = ?auto_21438 ?auto_21440 ) ) ( not ( = ?auto_21438 ?auto_21441 ) ) ( not ( = ?auto_21439 ?auto_21440 ) ) ( not ( = ?auto_21439 ?auto_21441 ) ) ( not ( = ?auto_21440 ?auto_21441 ) ) ( ON ?auto_21441 ?auto_21442 ) ( not ( = ?auto_21437 ?auto_21442 ) ) ( not ( = ?auto_21438 ?auto_21442 ) ) ( not ( = ?auto_21439 ?auto_21442 ) ) ( not ( = ?auto_21440 ?auto_21442 ) ) ( not ( = ?auto_21441 ?auto_21442 ) ) ( ON ?auto_21440 ?auto_21441 ) ( ON-TABLE ?auto_21442 ) ( ON ?auto_21439 ?auto_21440 ) ( ON ?auto_21438 ?auto_21439 ) ( CLEAR ?auto_21438 ) ( HOLDING ?auto_21437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21437 )
      ( MAKE-5PILE ?auto_21437 ?auto_21438 ?auto_21439 ?auto_21440 ?auto_21441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21443 - BLOCK
      ?auto_21444 - BLOCK
      ?auto_21445 - BLOCK
      ?auto_21446 - BLOCK
      ?auto_21447 - BLOCK
    )
    :vars
    (
      ?auto_21448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21443 ?auto_21444 ) ) ( not ( = ?auto_21443 ?auto_21445 ) ) ( not ( = ?auto_21443 ?auto_21446 ) ) ( not ( = ?auto_21443 ?auto_21447 ) ) ( not ( = ?auto_21444 ?auto_21445 ) ) ( not ( = ?auto_21444 ?auto_21446 ) ) ( not ( = ?auto_21444 ?auto_21447 ) ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21445 ?auto_21447 ) ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( ON ?auto_21447 ?auto_21448 ) ( not ( = ?auto_21443 ?auto_21448 ) ) ( not ( = ?auto_21444 ?auto_21448 ) ) ( not ( = ?auto_21445 ?auto_21448 ) ) ( not ( = ?auto_21446 ?auto_21448 ) ) ( not ( = ?auto_21447 ?auto_21448 ) ) ( ON ?auto_21446 ?auto_21447 ) ( ON-TABLE ?auto_21448 ) ( ON ?auto_21445 ?auto_21446 ) ( ON ?auto_21444 ?auto_21445 ) ( ON ?auto_21443 ?auto_21444 ) ( CLEAR ?auto_21443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21448 ?auto_21447 ?auto_21446 ?auto_21445 ?auto_21444 )
      ( MAKE-5PILE ?auto_21443 ?auto_21444 ?auto_21445 ?auto_21446 ?auto_21447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21453 - BLOCK
      ?auto_21454 - BLOCK
      ?auto_21455 - BLOCK
      ?auto_21456 - BLOCK
    )
    :vars
    (
      ?auto_21457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21457 ?auto_21456 ) ( CLEAR ?auto_21457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21453 ) ( ON ?auto_21454 ?auto_21453 ) ( ON ?auto_21455 ?auto_21454 ) ( ON ?auto_21456 ?auto_21455 ) ( not ( = ?auto_21453 ?auto_21454 ) ) ( not ( = ?auto_21453 ?auto_21455 ) ) ( not ( = ?auto_21453 ?auto_21456 ) ) ( not ( = ?auto_21453 ?auto_21457 ) ) ( not ( = ?auto_21454 ?auto_21455 ) ) ( not ( = ?auto_21454 ?auto_21456 ) ) ( not ( = ?auto_21454 ?auto_21457 ) ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21457 ) ) ( not ( = ?auto_21456 ?auto_21457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21457 ?auto_21456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21469 - BLOCK
      ?auto_21470 - BLOCK
      ?auto_21471 - BLOCK
      ?auto_21472 - BLOCK
    )
    :vars
    (
      ?auto_21473 - BLOCK
      ?auto_21474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21469 ) ( ON ?auto_21470 ?auto_21469 ) ( ON ?auto_21471 ?auto_21470 ) ( not ( = ?auto_21469 ?auto_21470 ) ) ( not ( = ?auto_21469 ?auto_21471 ) ) ( not ( = ?auto_21469 ?auto_21472 ) ) ( not ( = ?auto_21469 ?auto_21473 ) ) ( not ( = ?auto_21470 ?auto_21471 ) ) ( not ( = ?auto_21470 ?auto_21472 ) ) ( not ( = ?auto_21470 ?auto_21473 ) ) ( not ( = ?auto_21471 ?auto_21472 ) ) ( not ( = ?auto_21471 ?auto_21473 ) ) ( not ( = ?auto_21472 ?auto_21473 ) ) ( ON ?auto_21473 ?auto_21474 ) ( CLEAR ?auto_21473 ) ( not ( = ?auto_21469 ?auto_21474 ) ) ( not ( = ?auto_21470 ?auto_21474 ) ) ( not ( = ?auto_21471 ?auto_21474 ) ) ( not ( = ?auto_21472 ?auto_21474 ) ) ( not ( = ?auto_21473 ?auto_21474 ) ) ( HOLDING ?auto_21472 ) ( CLEAR ?auto_21471 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21469 ?auto_21470 ?auto_21471 ?auto_21472 ?auto_21473 )
      ( MAKE-4PILE ?auto_21469 ?auto_21470 ?auto_21471 ?auto_21472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21475 - BLOCK
      ?auto_21476 - BLOCK
      ?auto_21477 - BLOCK
      ?auto_21478 - BLOCK
    )
    :vars
    (
      ?auto_21480 - BLOCK
      ?auto_21479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21475 ) ( ON ?auto_21476 ?auto_21475 ) ( ON ?auto_21477 ?auto_21476 ) ( not ( = ?auto_21475 ?auto_21476 ) ) ( not ( = ?auto_21475 ?auto_21477 ) ) ( not ( = ?auto_21475 ?auto_21478 ) ) ( not ( = ?auto_21475 ?auto_21480 ) ) ( not ( = ?auto_21476 ?auto_21477 ) ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21476 ?auto_21480 ) ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21480 ) ) ( not ( = ?auto_21478 ?auto_21480 ) ) ( ON ?auto_21480 ?auto_21479 ) ( not ( = ?auto_21475 ?auto_21479 ) ) ( not ( = ?auto_21476 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21480 ?auto_21479 ) ) ( CLEAR ?auto_21477 ) ( ON ?auto_21478 ?auto_21480 ) ( CLEAR ?auto_21478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21479 ?auto_21480 )
      ( MAKE-4PILE ?auto_21475 ?auto_21476 ?auto_21477 ?auto_21478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21481 - BLOCK
      ?auto_21482 - BLOCK
      ?auto_21483 - BLOCK
      ?auto_21484 - BLOCK
    )
    :vars
    (
      ?auto_21486 - BLOCK
      ?auto_21485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21481 ) ( ON ?auto_21482 ?auto_21481 ) ( not ( = ?auto_21481 ?auto_21482 ) ) ( not ( = ?auto_21481 ?auto_21483 ) ) ( not ( = ?auto_21481 ?auto_21484 ) ) ( not ( = ?auto_21481 ?auto_21486 ) ) ( not ( = ?auto_21482 ?auto_21483 ) ) ( not ( = ?auto_21482 ?auto_21484 ) ) ( not ( = ?auto_21482 ?auto_21486 ) ) ( not ( = ?auto_21483 ?auto_21484 ) ) ( not ( = ?auto_21483 ?auto_21486 ) ) ( not ( = ?auto_21484 ?auto_21486 ) ) ( ON ?auto_21486 ?auto_21485 ) ( not ( = ?auto_21481 ?auto_21485 ) ) ( not ( = ?auto_21482 ?auto_21485 ) ) ( not ( = ?auto_21483 ?auto_21485 ) ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( not ( = ?auto_21486 ?auto_21485 ) ) ( ON ?auto_21484 ?auto_21486 ) ( CLEAR ?auto_21484 ) ( ON-TABLE ?auto_21485 ) ( HOLDING ?auto_21483 ) ( CLEAR ?auto_21482 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21481 ?auto_21482 ?auto_21483 )
      ( MAKE-4PILE ?auto_21481 ?auto_21482 ?auto_21483 ?auto_21484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21487 - BLOCK
      ?auto_21488 - BLOCK
      ?auto_21489 - BLOCK
      ?auto_21490 - BLOCK
    )
    :vars
    (
      ?auto_21492 - BLOCK
      ?auto_21491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21487 ) ( ON ?auto_21488 ?auto_21487 ) ( not ( = ?auto_21487 ?auto_21488 ) ) ( not ( = ?auto_21487 ?auto_21489 ) ) ( not ( = ?auto_21487 ?auto_21490 ) ) ( not ( = ?auto_21487 ?auto_21492 ) ) ( not ( = ?auto_21488 ?auto_21489 ) ) ( not ( = ?auto_21488 ?auto_21490 ) ) ( not ( = ?auto_21488 ?auto_21492 ) ) ( not ( = ?auto_21489 ?auto_21490 ) ) ( not ( = ?auto_21489 ?auto_21492 ) ) ( not ( = ?auto_21490 ?auto_21492 ) ) ( ON ?auto_21492 ?auto_21491 ) ( not ( = ?auto_21487 ?auto_21491 ) ) ( not ( = ?auto_21488 ?auto_21491 ) ) ( not ( = ?auto_21489 ?auto_21491 ) ) ( not ( = ?auto_21490 ?auto_21491 ) ) ( not ( = ?auto_21492 ?auto_21491 ) ) ( ON ?auto_21490 ?auto_21492 ) ( ON-TABLE ?auto_21491 ) ( CLEAR ?auto_21488 ) ( ON ?auto_21489 ?auto_21490 ) ( CLEAR ?auto_21489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21491 ?auto_21492 ?auto_21490 )
      ( MAKE-4PILE ?auto_21487 ?auto_21488 ?auto_21489 ?auto_21490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21493 - BLOCK
      ?auto_21494 - BLOCK
      ?auto_21495 - BLOCK
      ?auto_21496 - BLOCK
    )
    :vars
    (
      ?auto_21497 - BLOCK
      ?auto_21498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21493 ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21495 ) ) ( not ( = ?auto_21493 ?auto_21496 ) ) ( not ( = ?auto_21493 ?auto_21497 ) ) ( not ( = ?auto_21494 ?auto_21495 ) ) ( not ( = ?auto_21494 ?auto_21496 ) ) ( not ( = ?auto_21494 ?auto_21497 ) ) ( not ( = ?auto_21495 ?auto_21496 ) ) ( not ( = ?auto_21495 ?auto_21497 ) ) ( not ( = ?auto_21496 ?auto_21497 ) ) ( ON ?auto_21497 ?auto_21498 ) ( not ( = ?auto_21493 ?auto_21498 ) ) ( not ( = ?auto_21494 ?auto_21498 ) ) ( not ( = ?auto_21495 ?auto_21498 ) ) ( not ( = ?auto_21496 ?auto_21498 ) ) ( not ( = ?auto_21497 ?auto_21498 ) ) ( ON ?auto_21496 ?auto_21497 ) ( ON-TABLE ?auto_21498 ) ( ON ?auto_21495 ?auto_21496 ) ( CLEAR ?auto_21495 ) ( HOLDING ?auto_21494 ) ( CLEAR ?auto_21493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21493 ?auto_21494 )
      ( MAKE-4PILE ?auto_21493 ?auto_21494 ?auto_21495 ?auto_21496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21499 - BLOCK
      ?auto_21500 - BLOCK
      ?auto_21501 - BLOCK
      ?auto_21502 - BLOCK
    )
    :vars
    (
      ?auto_21503 - BLOCK
      ?auto_21504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21499 ) ( not ( = ?auto_21499 ?auto_21500 ) ) ( not ( = ?auto_21499 ?auto_21501 ) ) ( not ( = ?auto_21499 ?auto_21502 ) ) ( not ( = ?auto_21499 ?auto_21503 ) ) ( not ( = ?auto_21500 ?auto_21501 ) ) ( not ( = ?auto_21500 ?auto_21502 ) ) ( not ( = ?auto_21500 ?auto_21503 ) ) ( not ( = ?auto_21501 ?auto_21502 ) ) ( not ( = ?auto_21501 ?auto_21503 ) ) ( not ( = ?auto_21502 ?auto_21503 ) ) ( ON ?auto_21503 ?auto_21504 ) ( not ( = ?auto_21499 ?auto_21504 ) ) ( not ( = ?auto_21500 ?auto_21504 ) ) ( not ( = ?auto_21501 ?auto_21504 ) ) ( not ( = ?auto_21502 ?auto_21504 ) ) ( not ( = ?auto_21503 ?auto_21504 ) ) ( ON ?auto_21502 ?auto_21503 ) ( ON-TABLE ?auto_21504 ) ( ON ?auto_21501 ?auto_21502 ) ( CLEAR ?auto_21499 ) ( ON ?auto_21500 ?auto_21501 ) ( CLEAR ?auto_21500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21504 ?auto_21503 ?auto_21502 ?auto_21501 )
      ( MAKE-4PILE ?auto_21499 ?auto_21500 ?auto_21501 ?auto_21502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21505 - BLOCK
      ?auto_21506 - BLOCK
      ?auto_21507 - BLOCK
      ?auto_21508 - BLOCK
    )
    :vars
    (
      ?auto_21510 - BLOCK
      ?auto_21509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21505 ?auto_21506 ) ) ( not ( = ?auto_21505 ?auto_21507 ) ) ( not ( = ?auto_21505 ?auto_21508 ) ) ( not ( = ?auto_21505 ?auto_21510 ) ) ( not ( = ?auto_21506 ?auto_21507 ) ) ( not ( = ?auto_21506 ?auto_21508 ) ) ( not ( = ?auto_21506 ?auto_21510 ) ) ( not ( = ?auto_21507 ?auto_21508 ) ) ( not ( = ?auto_21507 ?auto_21510 ) ) ( not ( = ?auto_21508 ?auto_21510 ) ) ( ON ?auto_21510 ?auto_21509 ) ( not ( = ?auto_21505 ?auto_21509 ) ) ( not ( = ?auto_21506 ?auto_21509 ) ) ( not ( = ?auto_21507 ?auto_21509 ) ) ( not ( = ?auto_21508 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21509 ) ) ( ON ?auto_21508 ?auto_21510 ) ( ON-TABLE ?auto_21509 ) ( ON ?auto_21507 ?auto_21508 ) ( ON ?auto_21506 ?auto_21507 ) ( CLEAR ?auto_21506 ) ( HOLDING ?auto_21505 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21505 )
      ( MAKE-4PILE ?auto_21505 ?auto_21506 ?auto_21507 ?auto_21508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21511 - BLOCK
      ?auto_21512 - BLOCK
      ?auto_21513 - BLOCK
      ?auto_21514 - BLOCK
    )
    :vars
    (
      ?auto_21516 - BLOCK
      ?auto_21515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21516 ) ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21516 ) ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21516 ) ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( ON ?auto_21516 ?auto_21515 ) ( not ( = ?auto_21511 ?auto_21515 ) ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21513 ?auto_21515 ) ) ( not ( = ?auto_21514 ?auto_21515 ) ) ( not ( = ?auto_21516 ?auto_21515 ) ) ( ON ?auto_21514 ?auto_21516 ) ( ON-TABLE ?auto_21515 ) ( ON ?auto_21513 ?auto_21514 ) ( ON ?auto_21512 ?auto_21513 ) ( ON ?auto_21511 ?auto_21512 ) ( CLEAR ?auto_21511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21515 ?auto_21516 ?auto_21514 ?auto_21513 ?auto_21512 )
      ( MAKE-4PILE ?auto_21511 ?auto_21512 ?auto_21513 ?auto_21514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21518 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21519 - BLOCK
    )
    :vars
    (
      ?auto_21520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21519 ?auto_21520 ) ( CLEAR ?auto_21519 ) ( HAND-EMPTY ) ( not ( = ?auto_21519 ?auto_21520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21519 ?auto_21520 )
      ( MAKE-1PILE ?auto_21519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21521 - BLOCK
    )
    :vars
    (
      ?auto_21522 - BLOCK
      ?auto_21525 - BLOCK
      ?auto_21523 - BLOCK
      ?auto_21524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21521 ?auto_21522 ) ) ( HOLDING ?auto_21521 ) ( CLEAR ?auto_21522 ) ( ON-TABLE ?auto_21525 ) ( ON ?auto_21523 ?auto_21525 ) ( ON ?auto_21524 ?auto_21523 ) ( ON ?auto_21522 ?auto_21524 ) ( not ( = ?auto_21525 ?auto_21523 ) ) ( not ( = ?auto_21525 ?auto_21524 ) ) ( not ( = ?auto_21525 ?auto_21522 ) ) ( not ( = ?auto_21525 ?auto_21521 ) ) ( not ( = ?auto_21523 ?auto_21524 ) ) ( not ( = ?auto_21523 ?auto_21522 ) ) ( not ( = ?auto_21523 ?auto_21521 ) ) ( not ( = ?auto_21524 ?auto_21522 ) ) ( not ( = ?auto_21524 ?auto_21521 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21525 ?auto_21523 ?auto_21524 ?auto_21522 ?auto_21521 )
      ( MAKE-1PILE ?auto_21521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21526 - BLOCK
    )
    :vars
    (
      ?auto_21529 - BLOCK
      ?auto_21528 - BLOCK
      ?auto_21527 - BLOCK
      ?auto_21530 - BLOCK
      ?auto_21531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21526 ?auto_21529 ) ) ( CLEAR ?auto_21529 ) ( ON-TABLE ?auto_21528 ) ( ON ?auto_21527 ?auto_21528 ) ( ON ?auto_21530 ?auto_21527 ) ( ON ?auto_21529 ?auto_21530 ) ( not ( = ?auto_21528 ?auto_21527 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21526 ) ) ( not ( = ?auto_21527 ?auto_21530 ) ) ( not ( = ?auto_21527 ?auto_21529 ) ) ( not ( = ?auto_21527 ?auto_21526 ) ) ( not ( = ?auto_21530 ?auto_21529 ) ) ( not ( = ?auto_21530 ?auto_21526 ) ) ( ON ?auto_21526 ?auto_21531 ) ( CLEAR ?auto_21526 ) ( HAND-EMPTY ) ( not ( = ?auto_21526 ?auto_21531 ) ) ( not ( = ?auto_21529 ?auto_21531 ) ) ( not ( = ?auto_21528 ?auto_21531 ) ) ( not ( = ?auto_21527 ?auto_21531 ) ) ( not ( = ?auto_21530 ?auto_21531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21526 ?auto_21531 )
      ( MAKE-1PILE ?auto_21526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21532 - BLOCK
    )
    :vars
    (
      ?auto_21537 - BLOCK
      ?auto_21534 - BLOCK
      ?auto_21535 - BLOCK
      ?auto_21536 - BLOCK
      ?auto_21533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21532 ?auto_21537 ) ) ( ON-TABLE ?auto_21534 ) ( ON ?auto_21535 ?auto_21534 ) ( ON ?auto_21536 ?auto_21535 ) ( not ( = ?auto_21534 ?auto_21535 ) ) ( not ( = ?auto_21534 ?auto_21536 ) ) ( not ( = ?auto_21534 ?auto_21537 ) ) ( not ( = ?auto_21534 ?auto_21532 ) ) ( not ( = ?auto_21535 ?auto_21536 ) ) ( not ( = ?auto_21535 ?auto_21537 ) ) ( not ( = ?auto_21535 ?auto_21532 ) ) ( not ( = ?auto_21536 ?auto_21537 ) ) ( not ( = ?auto_21536 ?auto_21532 ) ) ( ON ?auto_21532 ?auto_21533 ) ( CLEAR ?auto_21532 ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21537 ?auto_21533 ) ) ( not ( = ?auto_21534 ?auto_21533 ) ) ( not ( = ?auto_21535 ?auto_21533 ) ) ( not ( = ?auto_21536 ?auto_21533 ) ) ( HOLDING ?auto_21537 ) ( CLEAR ?auto_21536 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21534 ?auto_21535 ?auto_21536 ?auto_21537 )
      ( MAKE-1PILE ?auto_21532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21538 - BLOCK
    )
    :vars
    (
      ?auto_21539 - BLOCK
      ?auto_21541 - BLOCK
      ?auto_21542 - BLOCK
      ?auto_21543 - BLOCK
      ?auto_21540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21538 ?auto_21539 ) ) ( ON-TABLE ?auto_21541 ) ( ON ?auto_21542 ?auto_21541 ) ( ON ?auto_21543 ?auto_21542 ) ( not ( = ?auto_21541 ?auto_21542 ) ) ( not ( = ?auto_21541 ?auto_21543 ) ) ( not ( = ?auto_21541 ?auto_21539 ) ) ( not ( = ?auto_21541 ?auto_21538 ) ) ( not ( = ?auto_21542 ?auto_21543 ) ) ( not ( = ?auto_21542 ?auto_21539 ) ) ( not ( = ?auto_21542 ?auto_21538 ) ) ( not ( = ?auto_21543 ?auto_21539 ) ) ( not ( = ?auto_21543 ?auto_21538 ) ) ( ON ?auto_21538 ?auto_21540 ) ( not ( = ?auto_21538 ?auto_21540 ) ) ( not ( = ?auto_21539 ?auto_21540 ) ) ( not ( = ?auto_21541 ?auto_21540 ) ) ( not ( = ?auto_21542 ?auto_21540 ) ) ( not ( = ?auto_21543 ?auto_21540 ) ) ( CLEAR ?auto_21543 ) ( ON ?auto_21539 ?auto_21538 ) ( CLEAR ?auto_21539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21540 ?auto_21538 )
      ( MAKE-1PILE ?auto_21538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21544 - BLOCK
    )
    :vars
    (
      ?auto_21545 - BLOCK
      ?auto_21547 - BLOCK
      ?auto_21548 - BLOCK
      ?auto_21549 - BLOCK
      ?auto_21546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21544 ?auto_21545 ) ) ( ON-TABLE ?auto_21547 ) ( ON ?auto_21548 ?auto_21547 ) ( not ( = ?auto_21547 ?auto_21548 ) ) ( not ( = ?auto_21547 ?auto_21549 ) ) ( not ( = ?auto_21547 ?auto_21545 ) ) ( not ( = ?auto_21547 ?auto_21544 ) ) ( not ( = ?auto_21548 ?auto_21549 ) ) ( not ( = ?auto_21548 ?auto_21545 ) ) ( not ( = ?auto_21548 ?auto_21544 ) ) ( not ( = ?auto_21549 ?auto_21545 ) ) ( not ( = ?auto_21549 ?auto_21544 ) ) ( ON ?auto_21544 ?auto_21546 ) ( not ( = ?auto_21544 ?auto_21546 ) ) ( not ( = ?auto_21545 ?auto_21546 ) ) ( not ( = ?auto_21547 ?auto_21546 ) ) ( not ( = ?auto_21548 ?auto_21546 ) ) ( not ( = ?auto_21549 ?auto_21546 ) ) ( ON ?auto_21545 ?auto_21544 ) ( CLEAR ?auto_21545 ) ( ON-TABLE ?auto_21546 ) ( HOLDING ?auto_21549 ) ( CLEAR ?auto_21548 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21547 ?auto_21548 ?auto_21549 )
      ( MAKE-1PILE ?auto_21544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21550 - BLOCK
    )
    :vars
    (
      ?auto_21553 - BLOCK
      ?auto_21551 - BLOCK
      ?auto_21555 - BLOCK
      ?auto_21554 - BLOCK
      ?auto_21552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21550 ?auto_21553 ) ) ( ON-TABLE ?auto_21551 ) ( ON ?auto_21555 ?auto_21551 ) ( not ( = ?auto_21551 ?auto_21555 ) ) ( not ( = ?auto_21551 ?auto_21554 ) ) ( not ( = ?auto_21551 ?auto_21553 ) ) ( not ( = ?auto_21551 ?auto_21550 ) ) ( not ( = ?auto_21555 ?auto_21554 ) ) ( not ( = ?auto_21555 ?auto_21553 ) ) ( not ( = ?auto_21555 ?auto_21550 ) ) ( not ( = ?auto_21554 ?auto_21553 ) ) ( not ( = ?auto_21554 ?auto_21550 ) ) ( ON ?auto_21550 ?auto_21552 ) ( not ( = ?auto_21550 ?auto_21552 ) ) ( not ( = ?auto_21553 ?auto_21552 ) ) ( not ( = ?auto_21551 ?auto_21552 ) ) ( not ( = ?auto_21555 ?auto_21552 ) ) ( not ( = ?auto_21554 ?auto_21552 ) ) ( ON ?auto_21553 ?auto_21550 ) ( ON-TABLE ?auto_21552 ) ( CLEAR ?auto_21555 ) ( ON ?auto_21554 ?auto_21553 ) ( CLEAR ?auto_21554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21552 ?auto_21550 ?auto_21553 )
      ( MAKE-1PILE ?auto_21550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21556 - BLOCK
    )
    :vars
    (
      ?auto_21558 - BLOCK
      ?auto_21559 - BLOCK
      ?auto_21560 - BLOCK
      ?auto_21561 - BLOCK
      ?auto_21557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21556 ?auto_21558 ) ) ( ON-TABLE ?auto_21559 ) ( not ( = ?auto_21559 ?auto_21560 ) ) ( not ( = ?auto_21559 ?auto_21561 ) ) ( not ( = ?auto_21559 ?auto_21558 ) ) ( not ( = ?auto_21559 ?auto_21556 ) ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( not ( = ?auto_21560 ?auto_21558 ) ) ( not ( = ?auto_21560 ?auto_21556 ) ) ( not ( = ?auto_21561 ?auto_21558 ) ) ( not ( = ?auto_21561 ?auto_21556 ) ) ( ON ?auto_21556 ?auto_21557 ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21558 ?auto_21557 ) ) ( not ( = ?auto_21559 ?auto_21557 ) ) ( not ( = ?auto_21560 ?auto_21557 ) ) ( not ( = ?auto_21561 ?auto_21557 ) ) ( ON ?auto_21558 ?auto_21556 ) ( ON-TABLE ?auto_21557 ) ( ON ?auto_21561 ?auto_21558 ) ( CLEAR ?auto_21561 ) ( HOLDING ?auto_21560 ) ( CLEAR ?auto_21559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21559 ?auto_21560 )
      ( MAKE-1PILE ?auto_21556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21562 - BLOCK
    )
    :vars
    (
      ?auto_21565 - BLOCK
      ?auto_21564 - BLOCK
      ?auto_21567 - BLOCK
      ?auto_21566 - BLOCK
      ?auto_21563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21562 ?auto_21565 ) ) ( ON-TABLE ?auto_21564 ) ( not ( = ?auto_21564 ?auto_21567 ) ) ( not ( = ?auto_21564 ?auto_21566 ) ) ( not ( = ?auto_21564 ?auto_21565 ) ) ( not ( = ?auto_21564 ?auto_21562 ) ) ( not ( = ?auto_21567 ?auto_21566 ) ) ( not ( = ?auto_21567 ?auto_21565 ) ) ( not ( = ?auto_21567 ?auto_21562 ) ) ( not ( = ?auto_21566 ?auto_21565 ) ) ( not ( = ?auto_21566 ?auto_21562 ) ) ( ON ?auto_21562 ?auto_21563 ) ( not ( = ?auto_21562 ?auto_21563 ) ) ( not ( = ?auto_21565 ?auto_21563 ) ) ( not ( = ?auto_21564 ?auto_21563 ) ) ( not ( = ?auto_21567 ?auto_21563 ) ) ( not ( = ?auto_21566 ?auto_21563 ) ) ( ON ?auto_21565 ?auto_21562 ) ( ON-TABLE ?auto_21563 ) ( ON ?auto_21566 ?auto_21565 ) ( CLEAR ?auto_21564 ) ( ON ?auto_21567 ?auto_21566 ) ( CLEAR ?auto_21567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21563 ?auto_21562 ?auto_21565 ?auto_21566 )
      ( MAKE-1PILE ?auto_21562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21568 - BLOCK
    )
    :vars
    (
      ?auto_21571 - BLOCK
      ?auto_21572 - BLOCK
      ?auto_21573 - BLOCK
      ?auto_21569 - BLOCK
      ?auto_21570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21568 ?auto_21571 ) ) ( not ( = ?auto_21572 ?auto_21573 ) ) ( not ( = ?auto_21572 ?auto_21569 ) ) ( not ( = ?auto_21572 ?auto_21571 ) ) ( not ( = ?auto_21572 ?auto_21568 ) ) ( not ( = ?auto_21573 ?auto_21569 ) ) ( not ( = ?auto_21573 ?auto_21571 ) ) ( not ( = ?auto_21573 ?auto_21568 ) ) ( not ( = ?auto_21569 ?auto_21571 ) ) ( not ( = ?auto_21569 ?auto_21568 ) ) ( ON ?auto_21568 ?auto_21570 ) ( not ( = ?auto_21568 ?auto_21570 ) ) ( not ( = ?auto_21571 ?auto_21570 ) ) ( not ( = ?auto_21572 ?auto_21570 ) ) ( not ( = ?auto_21573 ?auto_21570 ) ) ( not ( = ?auto_21569 ?auto_21570 ) ) ( ON ?auto_21571 ?auto_21568 ) ( ON-TABLE ?auto_21570 ) ( ON ?auto_21569 ?auto_21571 ) ( ON ?auto_21573 ?auto_21569 ) ( CLEAR ?auto_21573 ) ( HOLDING ?auto_21572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21572 )
      ( MAKE-1PILE ?auto_21568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21574 - BLOCK
    )
    :vars
    (
      ?auto_21575 - BLOCK
      ?auto_21579 - BLOCK
      ?auto_21577 - BLOCK
      ?auto_21576 - BLOCK
      ?auto_21578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21574 ?auto_21575 ) ) ( not ( = ?auto_21579 ?auto_21577 ) ) ( not ( = ?auto_21579 ?auto_21576 ) ) ( not ( = ?auto_21579 ?auto_21575 ) ) ( not ( = ?auto_21579 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21576 ) ) ( not ( = ?auto_21577 ?auto_21575 ) ) ( not ( = ?auto_21577 ?auto_21574 ) ) ( not ( = ?auto_21576 ?auto_21575 ) ) ( not ( = ?auto_21576 ?auto_21574 ) ) ( ON ?auto_21574 ?auto_21578 ) ( not ( = ?auto_21574 ?auto_21578 ) ) ( not ( = ?auto_21575 ?auto_21578 ) ) ( not ( = ?auto_21579 ?auto_21578 ) ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( not ( = ?auto_21576 ?auto_21578 ) ) ( ON ?auto_21575 ?auto_21574 ) ( ON-TABLE ?auto_21578 ) ( ON ?auto_21576 ?auto_21575 ) ( ON ?auto_21577 ?auto_21576 ) ( ON ?auto_21579 ?auto_21577 ) ( CLEAR ?auto_21579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21578 ?auto_21574 ?auto_21575 ?auto_21576 ?auto_21577 )
      ( MAKE-1PILE ?auto_21574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21583 - BLOCK
      ?auto_21584 - BLOCK
      ?auto_21585 - BLOCK
    )
    :vars
    (
      ?auto_21586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21586 ?auto_21585 ) ( CLEAR ?auto_21586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21583 ) ( ON ?auto_21584 ?auto_21583 ) ( ON ?auto_21585 ?auto_21584 ) ( not ( = ?auto_21583 ?auto_21584 ) ) ( not ( = ?auto_21583 ?auto_21585 ) ) ( not ( = ?auto_21583 ?auto_21586 ) ) ( not ( = ?auto_21584 ?auto_21585 ) ) ( not ( = ?auto_21584 ?auto_21586 ) ) ( not ( = ?auto_21585 ?auto_21586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21586 ?auto_21585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21587 - BLOCK
      ?auto_21588 - BLOCK
      ?auto_21589 - BLOCK
    )
    :vars
    (
      ?auto_21590 - BLOCK
      ?auto_21591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21590 ?auto_21589 ) ( CLEAR ?auto_21590 ) ( ON-TABLE ?auto_21587 ) ( ON ?auto_21588 ?auto_21587 ) ( ON ?auto_21589 ?auto_21588 ) ( not ( = ?auto_21587 ?auto_21588 ) ) ( not ( = ?auto_21587 ?auto_21589 ) ) ( not ( = ?auto_21587 ?auto_21590 ) ) ( not ( = ?auto_21588 ?auto_21589 ) ) ( not ( = ?auto_21588 ?auto_21590 ) ) ( not ( = ?auto_21589 ?auto_21590 ) ) ( HOLDING ?auto_21591 ) ( not ( = ?auto_21587 ?auto_21591 ) ) ( not ( = ?auto_21588 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21590 ?auto_21591 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_21591 )
      ( MAKE-3PILE ?auto_21587 ?auto_21588 ?auto_21589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21592 - BLOCK
      ?auto_21593 - BLOCK
      ?auto_21594 - BLOCK
    )
    :vars
    (
      ?auto_21595 - BLOCK
      ?auto_21596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21595 ?auto_21594 ) ( ON-TABLE ?auto_21592 ) ( ON ?auto_21593 ?auto_21592 ) ( ON ?auto_21594 ?auto_21593 ) ( not ( = ?auto_21592 ?auto_21593 ) ) ( not ( = ?auto_21592 ?auto_21594 ) ) ( not ( = ?auto_21592 ?auto_21595 ) ) ( not ( = ?auto_21593 ?auto_21594 ) ) ( not ( = ?auto_21593 ?auto_21595 ) ) ( not ( = ?auto_21594 ?auto_21595 ) ) ( not ( = ?auto_21592 ?auto_21596 ) ) ( not ( = ?auto_21593 ?auto_21596 ) ) ( not ( = ?auto_21594 ?auto_21596 ) ) ( not ( = ?auto_21595 ?auto_21596 ) ) ( ON ?auto_21596 ?auto_21595 ) ( CLEAR ?auto_21596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21592 ?auto_21593 ?auto_21594 ?auto_21595 )
      ( MAKE-3PILE ?auto_21592 ?auto_21593 ?auto_21594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21597 - BLOCK
      ?auto_21598 - BLOCK
      ?auto_21599 - BLOCK
    )
    :vars
    (
      ?auto_21601 - BLOCK
      ?auto_21600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21601 ?auto_21599 ) ( ON-TABLE ?auto_21597 ) ( ON ?auto_21598 ?auto_21597 ) ( ON ?auto_21599 ?auto_21598 ) ( not ( = ?auto_21597 ?auto_21598 ) ) ( not ( = ?auto_21597 ?auto_21599 ) ) ( not ( = ?auto_21597 ?auto_21601 ) ) ( not ( = ?auto_21598 ?auto_21599 ) ) ( not ( = ?auto_21598 ?auto_21601 ) ) ( not ( = ?auto_21599 ?auto_21601 ) ) ( not ( = ?auto_21597 ?auto_21600 ) ) ( not ( = ?auto_21598 ?auto_21600 ) ) ( not ( = ?auto_21599 ?auto_21600 ) ) ( not ( = ?auto_21601 ?auto_21600 ) ) ( HOLDING ?auto_21600 ) ( CLEAR ?auto_21601 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21597 ?auto_21598 ?auto_21599 ?auto_21601 ?auto_21600 )
      ( MAKE-3PILE ?auto_21597 ?auto_21598 ?auto_21599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21602 - BLOCK
      ?auto_21603 - BLOCK
      ?auto_21604 - BLOCK
    )
    :vars
    (
      ?auto_21605 - BLOCK
      ?auto_21606 - BLOCK
      ?auto_21607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21605 ?auto_21604 ) ( ON-TABLE ?auto_21602 ) ( ON ?auto_21603 ?auto_21602 ) ( ON ?auto_21604 ?auto_21603 ) ( not ( = ?auto_21602 ?auto_21603 ) ) ( not ( = ?auto_21602 ?auto_21604 ) ) ( not ( = ?auto_21602 ?auto_21605 ) ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( not ( = ?auto_21603 ?auto_21605 ) ) ( not ( = ?auto_21604 ?auto_21605 ) ) ( not ( = ?auto_21602 ?auto_21606 ) ) ( not ( = ?auto_21603 ?auto_21606 ) ) ( not ( = ?auto_21604 ?auto_21606 ) ) ( not ( = ?auto_21605 ?auto_21606 ) ) ( CLEAR ?auto_21605 ) ( ON ?auto_21606 ?auto_21607 ) ( CLEAR ?auto_21606 ) ( HAND-EMPTY ) ( not ( = ?auto_21602 ?auto_21607 ) ) ( not ( = ?auto_21603 ?auto_21607 ) ) ( not ( = ?auto_21604 ?auto_21607 ) ) ( not ( = ?auto_21605 ?auto_21607 ) ) ( not ( = ?auto_21606 ?auto_21607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21606 ?auto_21607 )
      ( MAKE-3PILE ?auto_21602 ?auto_21603 ?auto_21604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21620 - BLOCK
      ?auto_21621 - BLOCK
      ?auto_21622 - BLOCK
    )
    :vars
    (
      ?auto_21624 - BLOCK
      ?auto_21625 - BLOCK
      ?auto_21623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21620 ) ( ON ?auto_21621 ?auto_21620 ) ( not ( = ?auto_21620 ?auto_21621 ) ) ( not ( = ?auto_21620 ?auto_21622 ) ) ( not ( = ?auto_21620 ?auto_21624 ) ) ( not ( = ?auto_21621 ?auto_21622 ) ) ( not ( = ?auto_21621 ?auto_21624 ) ) ( not ( = ?auto_21622 ?auto_21624 ) ) ( not ( = ?auto_21620 ?auto_21625 ) ) ( not ( = ?auto_21621 ?auto_21625 ) ) ( not ( = ?auto_21622 ?auto_21625 ) ) ( not ( = ?auto_21624 ?auto_21625 ) ) ( ON ?auto_21625 ?auto_21623 ) ( not ( = ?auto_21620 ?auto_21623 ) ) ( not ( = ?auto_21621 ?auto_21623 ) ) ( not ( = ?auto_21622 ?auto_21623 ) ) ( not ( = ?auto_21624 ?auto_21623 ) ) ( not ( = ?auto_21625 ?auto_21623 ) ) ( ON ?auto_21624 ?auto_21625 ) ( CLEAR ?auto_21624 ) ( HOLDING ?auto_21622 ) ( CLEAR ?auto_21621 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21620 ?auto_21621 ?auto_21622 ?auto_21624 )
      ( MAKE-3PILE ?auto_21620 ?auto_21621 ?auto_21622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21626 - BLOCK
      ?auto_21627 - BLOCK
      ?auto_21628 - BLOCK
    )
    :vars
    (
      ?auto_21631 - BLOCK
      ?auto_21630 - BLOCK
      ?auto_21629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21626 ) ( ON ?auto_21627 ?auto_21626 ) ( not ( = ?auto_21626 ?auto_21627 ) ) ( not ( = ?auto_21626 ?auto_21628 ) ) ( not ( = ?auto_21626 ?auto_21631 ) ) ( not ( = ?auto_21627 ?auto_21628 ) ) ( not ( = ?auto_21627 ?auto_21631 ) ) ( not ( = ?auto_21628 ?auto_21631 ) ) ( not ( = ?auto_21626 ?auto_21630 ) ) ( not ( = ?auto_21627 ?auto_21630 ) ) ( not ( = ?auto_21628 ?auto_21630 ) ) ( not ( = ?auto_21631 ?auto_21630 ) ) ( ON ?auto_21630 ?auto_21629 ) ( not ( = ?auto_21626 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21629 ) ) ( not ( = ?auto_21628 ?auto_21629 ) ) ( not ( = ?auto_21631 ?auto_21629 ) ) ( not ( = ?auto_21630 ?auto_21629 ) ) ( ON ?auto_21631 ?auto_21630 ) ( CLEAR ?auto_21627 ) ( ON ?auto_21628 ?auto_21631 ) ( CLEAR ?auto_21628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21629 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21629 ?auto_21630 ?auto_21631 )
      ( MAKE-3PILE ?auto_21626 ?auto_21627 ?auto_21628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21632 - BLOCK
      ?auto_21633 - BLOCK
      ?auto_21634 - BLOCK
    )
    :vars
    (
      ?auto_21635 - BLOCK
      ?auto_21636 - BLOCK
      ?auto_21637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21632 ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21635 ) ) ( not ( = ?auto_21633 ?auto_21634 ) ) ( not ( = ?auto_21633 ?auto_21635 ) ) ( not ( = ?auto_21634 ?auto_21635 ) ) ( not ( = ?auto_21632 ?auto_21636 ) ) ( not ( = ?auto_21633 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21636 ) ) ( not ( = ?auto_21635 ?auto_21636 ) ) ( ON ?auto_21636 ?auto_21637 ) ( not ( = ?auto_21632 ?auto_21637 ) ) ( not ( = ?auto_21633 ?auto_21637 ) ) ( not ( = ?auto_21634 ?auto_21637 ) ) ( not ( = ?auto_21635 ?auto_21637 ) ) ( not ( = ?auto_21636 ?auto_21637 ) ) ( ON ?auto_21635 ?auto_21636 ) ( ON ?auto_21634 ?auto_21635 ) ( CLEAR ?auto_21634 ) ( ON-TABLE ?auto_21637 ) ( HOLDING ?auto_21633 ) ( CLEAR ?auto_21632 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21632 ?auto_21633 )
      ( MAKE-3PILE ?auto_21632 ?auto_21633 ?auto_21634 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21638 - BLOCK
      ?auto_21639 - BLOCK
      ?auto_21640 - BLOCK
    )
    :vars
    (
      ?auto_21641 - BLOCK
      ?auto_21642 - BLOCK
      ?auto_21643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21638 ) ( not ( = ?auto_21638 ?auto_21639 ) ) ( not ( = ?auto_21638 ?auto_21640 ) ) ( not ( = ?auto_21638 ?auto_21641 ) ) ( not ( = ?auto_21639 ?auto_21640 ) ) ( not ( = ?auto_21639 ?auto_21641 ) ) ( not ( = ?auto_21640 ?auto_21641 ) ) ( not ( = ?auto_21638 ?auto_21642 ) ) ( not ( = ?auto_21639 ?auto_21642 ) ) ( not ( = ?auto_21640 ?auto_21642 ) ) ( not ( = ?auto_21641 ?auto_21642 ) ) ( ON ?auto_21642 ?auto_21643 ) ( not ( = ?auto_21638 ?auto_21643 ) ) ( not ( = ?auto_21639 ?auto_21643 ) ) ( not ( = ?auto_21640 ?auto_21643 ) ) ( not ( = ?auto_21641 ?auto_21643 ) ) ( not ( = ?auto_21642 ?auto_21643 ) ) ( ON ?auto_21641 ?auto_21642 ) ( ON ?auto_21640 ?auto_21641 ) ( ON-TABLE ?auto_21643 ) ( CLEAR ?auto_21638 ) ( ON ?auto_21639 ?auto_21640 ) ( CLEAR ?auto_21639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21643 ?auto_21642 ?auto_21641 ?auto_21640 )
      ( MAKE-3PILE ?auto_21638 ?auto_21639 ?auto_21640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21644 - BLOCK
      ?auto_21645 - BLOCK
      ?auto_21646 - BLOCK
    )
    :vars
    (
      ?auto_21647 - BLOCK
      ?auto_21649 - BLOCK
      ?auto_21648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21644 ?auto_21645 ) ) ( not ( = ?auto_21644 ?auto_21646 ) ) ( not ( = ?auto_21644 ?auto_21647 ) ) ( not ( = ?auto_21645 ?auto_21646 ) ) ( not ( = ?auto_21645 ?auto_21647 ) ) ( not ( = ?auto_21646 ?auto_21647 ) ) ( not ( = ?auto_21644 ?auto_21649 ) ) ( not ( = ?auto_21645 ?auto_21649 ) ) ( not ( = ?auto_21646 ?auto_21649 ) ) ( not ( = ?auto_21647 ?auto_21649 ) ) ( ON ?auto_21649 ?auto_21648 ) ( not ( = ?auto_21644 ?auto_21648 ) ) ( not ( = ?auto_21645 ?auto_21648 ) ) ( not ( = ?auto_21646 ?auto_21648 ) ) ( not ( = ?auto_21647 ?auto_21648 ) ) ( not ( = ?auto_21649 ?auto_21648 ) ) ( ON ?auto_21647 ?auto_21649 ) ( ON ?auto_21646 ?auto_21647 ) ( ON-TABLE ?auto_21648 ) ( ON ?auto_21645 ?auto_21646 ) ( CLEAR ?auto_21645 ) ( HOLDING ?auto_21644 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21644 )
      ( MAKE-3PILE ?auto_21644 ?auto_21645 ?auto_21646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21650 - BLOCK
      ?auto_21651 - BLOCK
      ?auto_21652 - BLOCK
    )
    :vars
    (
      ?auto_21653 - BLOCK
      ?auto_21655 - BLOCK
      ?auto_21654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21650 ?auto_21651 ) ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21650 ?auto_21653 ) ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( not ( = ?auto_21651 ?auto_21653 ) ) ( not ( = ?auto_21652 ?auto_21653 ) ) ( not ( = ?auto_21650 ?auto_21655 ) ) ( not ( = ?auto_21651 ?auto_21655 ) ) ( not ( = ?auto_21652 ?auto_21655 ) ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( ON ?auto_21655 ?auto_21654 ) ( not ( = ?auto_21650 ?auto_21654 ) ) ( not ( = ?auto_21651 ?auto_21654 ) ) ( not ( = ?auto_21652 ?auto_21654 ) ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21655 ?auto_21654 ) ) ( ON ?auto_21653 ?auto_21655 ) ( ON ?auto_21652 ?auto_21653 ) ( ON-TABLE ?auto_21654 ) ( ON ?auto_21651 ?auto_21652 ) ( ON ?auto_21650 ?auto_21651 ) ( CLEAR ?auto_21650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21654 ?auto_21655 ?auto_21653 ?auto_21652 ?auto_21651 )
      ( MAKE-3PILE ?auto_21650 ?auto_21651 ?auto_21652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21658 - BLOCK
      ?auto_21659 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21659 ) ( CLEAR ?auto_21658 ) ( ON-TABLE ?auto_21658 ) ( not ( = ?auto_21658 ?auto_21659 ) ) )
    :subtasks
    ( ( !STACK ?auto_21659 ?auto_21658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21660 - BLOCK
      ?auto_21661 - BLOCK
    )
    :vars
    (
      ?auto_21662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21660 ) ( ON-TABLE ?auto_21660 ) ( not ( = ?auto_21660 ?auto_21661 ) ) ( ON ?auto_21661 ?auto_21662 ) ( CLEAR ?auto_21661 ) ( HAND-EMPTY ) ( not ( = ?auto_21660 ?auto_21662 ) ) ( not ( = ?auto_21661 ?auto_21662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21661 ?auto_21662 )
      ( MAKE-2PILE ?auto_21660 ?auto_21661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21663 - BLOCK
      ?auto_21664 - BLOCK
    )
    :vars
    (
      ?auto_21665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21663 ?auto_21664 ) ) ( ON ?auto_21664 ?auto_21665 ) ( CLEAR ?auto_21664 ) ( not ( = ?auto_21663 ?auto_21665 ) ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( HOLDING ?auto_21663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21663 )
      ( MAKE-2PILE ?auto_21663 ?auto_21664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21666 - BLOCK
      ?auto_21667 - BLOCK
    )
    :vars
    (
      ?auto_21668 - BLOCK
      ?auto_21670 - BLOCK
      ?auto_21669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21666 ?auto_21667 ) ) ( ON ?auto_21667 ?auto_21668 ) ( not ( = ?auto_21666 ?auto_21668 ) ) ( not ( = ?auto_21667 ?auto_21668 ) ) ( ON ?auto_21666 ?auto_21667 ) ( CLEAR ?auto_21666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21670 ) ( ON ?auto_21669 ?auto_21670 ) ( ON ?auto_21668 ?auto_21669 ) ( not ( = ?auto_21670 ?auto_21669 ) ) ( not ( = ?auto_21670 ?auto_21668 ) ) ( not ( = ?auto_21670 ?auto_21667 ) ) ( not ( = ?auto_21670 ?auto_21666 ) ) ( not ( = ?auto_21669 ?auto_21668 ) ) ( not ( = ?auto_21669 ?auto_21667 ) ) ( not ( = ?auto_21669 ?auto_21666 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21670 ?auto_21669 ?auto_21668 ?auto_21667 )
      ( MAKE-2PILE ?auto_21666 ?auto_21667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21671 - BLOCK
      ?auto_21672 - BLOCK
    )
    :vars
    (
      ?auto_21673 - BLOCK
      ?auto_21675 - BLOCK
      ?auto_21674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21671 ?auto_21672 ) ) ( ON ?auto_21672 ?auto_21673 ) ( not ( = ?auto_21671 ?auto_21673 ) ) ( not ( = ?auto_21672 ?auto_21673 ) ) ( ON-TABLE ?auto_21675 ) ( ON ?auto_21674 ?auto_21675 ) ( ON ?auto_21673 ?auto_21674 ) ( not ( = ?auto_21675 ?auto_21674 ) ) ( not ( = ?auto_21675 ?auto_21673 ) ) ( not ( = ?auto_21675 ?auto_21672 ) ) ( not ( = ?auto_21675 ?auto_21671 ) ) ( not ( = ?auto_21674 ?auto_21673 ) ) ( not ( = ?auto_21674 ?auto_21672 ) ) ( not ( = ?auto_21674 ?auto_21671 ) ) ( HOLDING ?auto_21671 ) ( CLEAR ?auto_21672 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21675 ?auto_21674 ?auto_21673 ?auto_21672 ?auto_21671 )
      ( MAKE-2PILE ?auto_21671 ?auto_21672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21676 - BLOCK
      ?auto_21677 - BLOCK
    )
    :vars
    (
      ?auto_21680 - BLOCK
      ?auto_21678 - BLOCK
      ?auto_21679 - BLOCK
      ?auto_21681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21676 ?auto_21677 ) ) ( ON ?auto_21677 ?auto_21680 ) ( not ( = ?auto_21676 ?auto_21680 ) ) ( not ( = ?auto_21677 ?auto_21680 ) ) ( ON-TABLE ?auto_21678 ) ( ON ?auto_21679 ?auto_21678 ) ( ON ?auto_21680 ?auto_21679 ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) ( not ( = ?auto_21678 ?auto_21677 ) ) ( not ( = ?auto_21678 ?auto_21676 ) ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( not ( = ?auto_21679 ?auto_21677 ) ) ( not ( = ?auto_21679 ?auto_21676 ) ) ( CLEAR ?auto_21677 ) ( ON ?auto_21676 ?auto_21681 ) ( CLEAR ?auto_21676 ) ( HAND-EMPTY ) ( not ( = ?auto_21676 ?auto_21681 ) ) ( not ( = ?auto_21677 ?auto_21681 ) ) ( not ( = ?auto_21680 ?auto_21681 ) ) ( not ( = ?auto_21678 ?auto_21681 ) ) ( not ( = ?auto_21679 ?auto_21681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21676 ?auto_21681 )
      ( MAKE-2PILE ?auto_21676 ?auto_21677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21682 - BLOCK
      ?auto_21683 - BLOCK
    )
    :vars
    (
      ?auto_21687 - BLOCK
      ?auto_21685 - BLOCK
      ?auto_21684 - BLOCK
      ?auto_21686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21682 ?auto_21683 ) ) ( not ( = ?auto_21682 ?auto_21687 ) ) ( not ( = ?auto_21683 ?auto_21687 ) ) ( ON-TABLE ?auto_21685 ) ( ON ?auto_21684 ?auto_21685 ) ( ON ?auto_21687 ?auto_21684 ) ( not ( = ?auto_21685 ?auto_21684 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21683 ) ) ( not ( = ?auto_21685 ?auto_21682 ) ) ( not ( = ?auto_21684 ?auto_21687 ) ) ( not ( = ?auto_21684 ?auto_21683 ) ) ( not ( = ?auto_21684 ?auto_21682 ) ) ( ON ?auto_21682 ?auto_21686 ) ( CLEAR ?auto_21682 ) ( not ( = ?auto_21682 ?auto_21686 ) ) ( not ( = ?auto_21683 ?auto_21686 ) ) ( not ( = ?auto_21687 ?auto_21686 ) ) ( not ( = ?auto_21685 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( HOLDING ?auto_21683 ) ( CLEAR ?auto_21687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21685 ?auto_21684 ?auto_21687 ?auto_21683 )
      ( MAKE-2PILE ?auto_21682 ?auto_21683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21688 - BLOCK
      ?auto_21689 - BLOCK
    )
    :vars
    (
      ?auto_21692 - BLOCK
      ?auto_21691 - BLOCK
      ?auto_21693 - BLOCK
      ?auto_21690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21688 ?auto_21689 ) ) ( not ( = ?auto_21688 ?auto_21692 ) ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( ON-TABLE ?auto_21691 ) ( ON ?auto_21693 ?auto_21691 ) ( ON ?auto_21692 ?auto_21693 ) ( not ( = ?auto_21691 ?auto_21693 ) ) ( not ( = ?auto_21691 ?auto_21692 ) ) ( not ( = ?auto_21691 ?auto_21689 ) ) ( not ( = ?auto_21691 ?auto_21688 ) ) ( not ( = ?auto_21693 ?auto_21692 ) ) ( not ( = ?auto_21693 ?auto_21689 ) ) ( not ( = ?auto_21693 ?auto_21688 ) ) ( ON ?auto_21688 ?auto_21690 ) ( not ( = ?auto_21688 ?auto_21690 ) ) ( not ( = ?auto_21689 ?auto_21690 ) ) ( not ( = ?auto_21692 ?auto_21690 ) ) ( not ( = ?auto_21691 ?auto_21690 ) ) ( not ( = ?auto_21693 ?auto_21690 ) ) ( CLEAR ?auto_21692 ) ( ON ?auto_21689 ?auto_21688 ) ( CLEAR ?auto_21689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21690 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21690 ?auto_21688 )
      ( MAKE-2PILE ?auto_21688 ?auto_21689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21694 - BLOCK
      ?auto_21695 - BLOCK
    )
    :vars
    (
      ?auto_21699 - BLOCK
      ?auto_21696 - BLOCK
      ?auto_21697 - BLOCK
      ?auto_21698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21694 ?auto_21695 ) ) ( not ( = ?auto_21694 ?auto_21699 ) ) ( not ( = ?auto_21695 ?auto_21699 ) ) ( ON-TABLE ?auto_21696 ) ( ON ?auto_21697 ?auto_21696 ) ( not ( = ?auto_21696 ?auto_21697 ) ) ( not ( = ?auto_21696 ?auto_21699 ) ) ( not ( = ?auto_21696 ?auto_21695 ) ) ( not ( = ?auto_21696 ?auto_21694 ) ) ( not ( = ?auto_21697 ?auto_21699 ) ) ( not ( = ?auto_21697 ?auto_21695 ) ) ( not ( = ?auto_21697 ?auto_21694 ) ) ( ON ?auto_21694 ?auto_21698 ) ( not ( = ?auto_21694 ?auto_21698 ) ) ( not ( = ?auto_21695 ?auto_21698 ) ) ( not ( = ?auto_21699 ?auto_21698 ) ) ( not ( = ?auto_21696 ?auto_21698 ) ) ( not ( = ?auto_21697 ?auto_21698 ) ) ( ON ?auto_21695 ?auto_21694 ) ( CLEAR ?auto_21695 ) ( ON-TABLE ?auto_21698 ) ( HOLDING ?auto_21699 ) ( CLEAR ?auto_21697 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21696 ?auto_21697 ?auto_21699 )
      ( MAKE-2PILE ?auto_21694 ?auto_21695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21700 - BLOCK
      ?auto_21701 - BLOCK
    )
    :vars
    (
      ?auto_21703 - BLOCK
      ?auto_21705 - BLOCK
      ?auto_21704 - BLOCK
      ?auto_21702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21700 ?auto_21701 ) ) ( not ( = ?auto_21700 ?auto_21703 ) ) ( not ( = ?auto_21701 ?auto_21703 ) ) ( ON-TABLE ?auto_21705 ) ( ON ?auto_21704 ?auto_21705 ) ( not ( = ?auto_21705 ?auto_21704 ) ) ( not ( = ?auto_21705 ?auto_21703 ) ) ( not ( = ?auto_21705 ?auto_21701 ) ) ( not ( = ?auto_21705 ?auto_21700 ) ) ( not ( = ?auto_21704 ?auto_21703 ) ) ( not ( = ?auto_21704 ?auto_21701 ) ) ( not ( = ?auto_21704 ?auto_21700 ) ) ( ON ?auto_21700 ?auto_21702 ) ( not ( = ?auto_21700 ?auto_21702 ) ) ( not ( = ?auto_21701 ?auto_21702 ) ) ( not ( = ?auto_21703 ?auto_21702 ) ) ( not ( = ?auto_21705 ?auto_21702 ) ) ( not ( = ?auto_21704 ?auto_21702 ) ) ( ON ?auto_21701 ?auto_21700 ) ( ON-TABLE ?auto_21702 ) ( CLEAR ?auto_21704 ) ( ON ?auto_21703 ?auto_21701 ) ( CLEAR ?auto_21703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21702 ?auto_21700 ?auto_21701 )
      ( MAKE-2PILE ?auto_21700 ?auto_21701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21706 - BLOCK
      ?auto_21707 - BLOCK
    )
    :vars
    (
      ?auto_21711 - BLOCK
      ?auto_21710 - BLOCK
      ?auto_21709 - BLOCK
      ?auto_21708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21711 ) ) ( not ( = ?auto_21707 ?auto_21711 ) ) ( ON-TABLE ?auto_21710 ) ( not ( = ?auto_21710 ?auto_21709 ) ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21710 ?auto_21707 ) ) ( not ( = ?auto_21710 ?auto_21706 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21707 ) ) ( not ( = ?auto_21709 ?auto_21706 ) ) ( ON ?auto_21706 ?auto_21708 ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( not ( = ?auto_21711 ?auto_21708 ) ) ( not ( = ?auto_21710 ?auto_21708 ) ) ( not ( = ?auto_21709 ?auto_21708 ) ) ( ON ?auto_21707 ?auto_21706 ) ( ON-TABLE ?auto_21708 ) ( ON ?auto_21711 ?auto_21707 ) ( CLEAR ?auto_21711 ) ( HOLDING ?auto_21709 ) ( CLEAR ?auto_21710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21710 ?auto_21709 )
      ( MAKE-2PILE ?auto_21706 ?auto_21707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21712 - BLOCK
      ?auto_21713 - BLOCK
    )
    :vars
    (
      ?auto_21716 - BLOCK
      ?auto_21715 - BLOCK
      ?auto_21717 - BLOCK
      ?auto_21714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21712 ?auto_21713 ) ) ( not ( = ?auto_21712 ?auto_21716 ) ) ( not ( = ?auto_21713 ?auto_21716 ) ) ( ON-TABLE ?auto_21715 ) ( not ( = ?auto_21715 ?auto_21717 ) ) ( not ( = ?auto_21715 ?auto_21716 ) ) ( not ( = ?auto_21715 ?auto_21713 ) ) ( not ( = ?auto_21715 ?auto_21712 ) ) ( not ( = ?auto_21717 ?auto_21716 ) ) ( not ( = ?auto_21717 ?auto_21713 ) ) ( not ( = ?auto_21717 ?auto_21712 ) ) ( ON ?auto_21712 ?auto_21714 ) ( not ( = ?auto_21712 ?auto_21714 ) ) ( not ( = ?auto_21713 ?auto_21714 ) ) ( not ( = ?auto_21716 ?auto_21714 ) ) ( not ( = ?auto_21715 ?auto_21714 ) ) ( not ( = ?auto_21717 ?auto_21714 ) ) ( ON ?auto_21713 ?auto_21712 ) ( ON-TABLE ?auto_21714 ) ( ON ?auto_21716 ?auto_21713 ) ( CLEAR ?auto_21715 ) ( ON ?auto_21717 ?auto_21716 ) ( CLEAR ?auto_21717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21714 ?auto_21712 ?auto_21713 ?auto_21716 )
      ( MAKE-2PILE ?auto_21712 ?auto_21713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21718 - BLOCK
      ?auto_21719 - BLOCK
    )
    :vars
    (
      ?auto_21723 - BLOCK
      ?auto_21720 - BLOCK
      ?auto_21721 - BLOCK
      ?auto_21722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21718 ?auto_21719 ) ) ( not ( = ?auto_21718 ?auto_21723 ) ) ( not ( = ?auto_21719 ?auto_21723 ) ) ( not ( = ?auto_21720 ?auto_21721 ) ) ( not ( = ?auto_21720 ?auto_21723 ) ) ( not ( = ?auto_21720 ?auto_21719 ) ) ( not ( = ?auto_21720 ?auto_21718 ) ) ( not ( = ?auto_21721 ?auto_21723 ) ) ( not ( = ?auto_21721 ?auto_21719 ) ) ( not ( = ?auto_21721 ?auto_21718 ) ) ( ON ?auto_21718 ?auto_21722 ) ( not ( = ?auto_21718 ?auto_21722 ) ) ( not ( = ?auto_21719 ?auto_21722 ) ) ( not ( = ?auto_21723 ?auto_21722 ) ) ( not ( = ?auto_21720 ?auto_21722 ) ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( ON ?auto_21719 ?auto_21718 ) ( ON-TABLE ?auto_21722 ) ( ON ?auto_21723 ?auto_21719 ) ( ON ?auto_21721 ?auto_21723 ) ( CLEAR ?auto_21721 ) ( HOLDING ?auto_21720 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21720 )
      ( MAKE-2PILE ?auto_21718 ?auto_21719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21724 - BLOCK
      ?auto_21725 - BLOCK
    )
    :vars
    (
      ?auto_21728 - BLOCK
      ?auto_21726 - BLOCK
      ?auto_21727 - BLOCK
      ?auto_21729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21724 ?auto_21725 ) ) ( not ( = ?auto_21724 ?auto_21728 ) ) ( not ( = ?auto_21725 ?auto_21728 ) ) ( not ( = ?auto_21726 ?auto_21727 ) ) ( not ( = ?auto_21726 ?auto_21728 ) ) ( not ( = ?auto_21726 ?auto_21725 ) ) ( not ( = ?auto_21726 ?auto_21724 ) ) ( not ( = ?auto_21727 ?auto_21728 ) ) ( not ( = ?auto_21727 ?auto_21725 ) ) ( not ( = ?auto_21727 ?auto_21724 ) ) ( ON ?auto_21724 ?auto_21729 ) ( not ( = ?auto_21724 ?auto_21729 ) ) ( not ( = ?auto_21725 ?auto_21729 ) ) ( not ( = ?auto_21728 ?auto_21729 ) ) ( not ( = ?auto_21726 ?auto_21729 ) ) ( not ( = ?auto_21727 ?auto_21729 ) ) ( ON ?auto_21725 ?auto_21724 ) ( ON-TABLE ?auto_21729 ) ( ON ?auto_21728 ?auto_21725 ) ( ON ?auto_21727 ?auto_21728 ) ( ON ?auto_21726 ?auto_21727 ) ( CLEAR ?auto_21726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21729 ?auto_21724 ?auto_21725 ?auto_21728 ?auto_21727 )
      ( MAKE-2PILE ?auto_21724 ?auto_21725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21732 - BLOCK
      ?auto_21733 - BLOCK
    )
    :vars
    (
      ?auto_21734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21734 ?auto_21733 ) ( CLEAR ?auto_21734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21732 ) ( ON ?auto_21733 ?auto_21732 ) ( not ( = ?auto_21732 ?auto_21733 ) ) ( not ( = ?auto_21732 ?auto_21734 ) ) ( not ( = ?auto_21733 ?auto_21734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21734 ?auto_21733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21735 - BLOCK
      ?auto_21736 - BLOCK
    )
    :vars
    (
      ?auto_21737 - BLOCK
      ?auto_21738 - BLOCK
      ?auto_21739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21737 ?auto_21736 ) ( CLEAR ?auto_21737 ) ( ON-TABLE ?auto_21735 ) ( ON ?auto_21736 ?auto_21735 ) ( not ( = ?auto_21735 ?auto_21736 ) ) ( not ( = ?auto_21735 ?auto_21737 ) ) ( not ( = ?auto_21736 ?auto_21737 ) ) ( HOLDING ?auto_21738 ) ( CLEAR ?auto_21739 ) ( not ( = ?auto_21735 ?auto_21738 ) ) ( not ( = ?auto_21735 ?auto_21739 ) ) ( not ( = ?auto_21736 ?auto_21738 ) ) ( not ( = ?auto_21736 ?auto_21739 ) ) ( not ( = ?auto_21737 ?auto_21738 ) ) ( not ( = ?auto_21737 ?auto_21739 ) ) ( not ( = ?auto_21738 ?auto_21739 ) ) )
    :subtasks
    ( ( !STACK ?auto_21738 ?auto_21739 )
      ( MAKE-2PILE ?auto_21735 ?auto_21736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21740 - BLOCK
      ?auto_21741 - BLOCK
    )
    :vars
    (
      ?auto_21744 - BLOCK
      ?auto_21743 - BLOCK
      ?auto_21742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21744 ?auto_21741 ) ( ON-TABLE ?auto_21740 ) ( ON ?auto_21741 ?auto_21740 ) ( not ( = ?auto_21740 ?auto_21741 ) ) ( not ( = ?auto_21740 ?auto_21744 ) ) ( not ( = ?auto_21741 ?auto_21744 ) ) ( CLEAR ?auto_21743 ) ( not ( = ?auto_21740 ?auto_21742 ) ) ( not ( = ?auto_21740 ?auto_21743 ) ) ( not ( = ?auto_21741 ?auto_21742 ) ) ( not ( = ?auto_21741 ?auto_21743 ) ) ( not ( = ?auto_21744 ?auto_21742 ) ) ( not ( = ?auto_21744 ?auto_21743 ) ) ( not ( = ?auto_21742 ?auto_21743 ) ) ( ON ?auto_21742 ?auto_21744 ) ( CLEAR ?auto_21742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21740 ?auto_21741 ?auto_21744 )
      ( MAKE-2PILE ?auto_21740 ?auto_21741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21745 - BLOCK
      ?auto_21746 - BLOCK
    )
    :vars
    (
      ?auto_21747 - BLOCK
      ?auto_21748 - BLOCK
      ?auto_21749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21747 ?auto_21746 ) ( ON-TABLE ?auto_21745 ) ( ON ?auto_21746 ?auto_21745 ) ( not ( = ?auto_21745 ?auto_21746 ) ) ( not ( = ?auto_21745 ?auto_21747 ) ) ( not ( = ?auto_21746 ?auto_21747 ) ) ( not ( = ?auto_21745 ?auto_21748 ) ) ( not ( = ?auto_21745 ?auto_21749 ) ) ( not ( = ?auto_21746 ?auto_21748 ) ) ( not ( = ?auto_21746 ?auto_21749 ) ) ( not ( = ?auto_21747 ?auto_21748 ) ) ( not ( = ?auto_21747 ?auto_21749 ) ) ( not ( = ?auto_21748 ?auto_21749 ) ) ( ON ?auto_21748 ?auto_21747 ) ( CLEAR ?auto_21748 ) ( HOLDING ?auto_21749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21749 )
      ( MAKE-2PILE ?auto_21745 ?auto_21746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21750 - BLOCK
      ?auto_21751 - BLOCK
    )
    :vars
    (
      ?auto_21754 - BLOCK
      ?auto_21753 - BLOCK
      ?auto_21752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21754 ?auto_21751 ) ( ON-TABLE ?auto_21750 ) ( ON ?auto_21751 ?auto_21750 ) ( not ( = ?auto_21750 ?auto_21751 ) ) ( not ( = ?auto_21750 ?auto_21754 ) ) ( not ( = ?auto_21751 ?auto_21754 ) ) ( not ( = ?auto_21750 ?auto_21753 ) ) ( not ( = ?auto_21750 ?auto_21752 ) ) ( not ( = ?auto_21751 ?auto_21753 ) ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( not ( = ?auto_21754 ?auto_21753 ) ) ( not ( = ?auto_21754 ?auto_21752 ) ) ( not ( = ?auto_21753 ?auto_21752 ) ) ( ON ?auto_21753 ?auto_21754 ) ( ON ?auto_21752 ?auto_21753 ) ( CLEAR ?auto_21752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21750 ?auto_21751 ?auto_21754 ?auto_21753 )
      ( MAKE-2PILE ?auto_21750 ?auto_21751 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21755 - BLOCK
      ?auto_21756 - BLOCK
    )
    :vars
    (
      ?auto_21757 - BLOCK
      ?auto_21758 - BLOCK
      ?auto_21759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21757 ?auto_21756 ) ( ON-TABLE ?auto_21755 ) ( ON ?auto_21756 ?auto_21755 ) ( not ( = ?auto_21755 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21757 ) ) ( not ( = ?auto_21756 ?auto_21757 ) ) ( not ( = ?auto_21755 ?auto_21758 ) ) ( not ( = ?auto_21755 ?auto_21759 ) ) ( not ( = ?auto_21756 ?auto_21758 ) ) ( not ( = ?auto_21756 ?auto_21759 ) ) ( not ( = ?auto_21757 ?auto_21758 ) ) ( not ( = ?auto_21757 ?auto_21759 ) ) ( not ( = ?auto_21758 ?auto_21759 ) ) ( ON ?auto_21758 ?auto_21757 ) ( HOLDING ?auto_21759 ) ( CLEAR ?auto_21758 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21755 ?auto_21756 ?auto_21757 ?auto_21758 ?auto_21759 )
      ( MAKE-2PILE ?auto_21755 ?auto_21756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21760 - BLOCK
      ?auto_21761 - BLOCK
    )
    :vars
    (
      ?auto_21764 - BLOCK
      ?auto_21763 - BLOCK
      ?auto_21762 - BLOCK
      ?auto_21765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21764 ?auto_21761 ) ( ON-TABLE ?auto_21760 ) ( ON ?auto_21761 ?auto_21760 ) ( not ( = ?auto_21760 ?auto_21761 ) ) ( not ( = ?auto_21760 ?auto_21764 ) ) ( not ( = ?auto_21761 ?auto_21764 ) ) ( not ( = ?auto_21760 ?auto_21763 ) ) ( not ( = ?auto_21760 ?auto_21762 ) ) ( not ( = ?auto_21761 ?auto_21763 ) ) ( not ( = ?auto_21761 ?auto_21762 ) ) ( not ( = ?auto_21764 ?auto_21763 ) ) ( not ( = ?auto_21764 ?auto_21762 ) ) ( not ( = ?auto_21763 ?auto_21762 ) ) ( ON ?auto_21763 ?auto_21764 ) ( CLEAR ?auto_21763 ) ( ON ?auto_21762 ?auto_21765 ) ( CLEAR ?auto_21762 ) ( HAND-EMPTY ) ( not ( = ?auto_21760 ?auto_21765 ) ) ( not ( = ?auto_21761 ?auto_21765 ) ) ( not ( = ?auto_21764 ?auto_21765 ) ) ( not ( = ?auto_21763 ?auto_21765 ) ) ( not ( = ?auto_21762 ?auto_21765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21762 ?auto_21765 )
      ( MAKE-2PILE ?auto_21760 ?auto_21761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21766 - BLOCK
      ?auto_21767 - BLOCK
    )
    :vars
    (
      ?auto_21769 - BLOCK
      ?auto_21770 - BLOCK
      ?auto_21771 - BLOCK
      ?auto_21768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21769 ?auto_21767 ) ( ON-TABLE ?auto_21766 ) ( ON ?auto_21767 ?auto_21766 ) ( not ( = ?auto_21766 ?auto_21767 ) ) ( not ( = ?auto_21766 ?auto_21769 ) ) ( not ( = ?auto_21767 ?auto_21769 ) ) ( not ( = ?auto_21766 ?auto_21770 ) ) ( not ( = ?auto_21766 ?auto_21771 ) ) ( not ( = ?auto_21767 ?auto_21770 ) ) ( not ( = ?auto_21767 ?auto_21771 ) ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( not ( = ?auto_21769 ?auto_21771 ) ) ( not ( = ?auto_21770 ?auto_21771 ) ) ( ON ?auto_21771 ?auto_21768 ) ( CLEAR ?auto_21771 ) ( not ( = ?auto_21766 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21769 ?auto_21768 ) ) ( not ( = ?auto_21770 ?auto_21768 ) ) ( not ( = ?auto_21771 ?auto_21768 ) ) ( HOLDING ?auto_21770 ) ( CLEAR ?auto_21769 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21766 ?auto_21767 ?auto_21769 ?auto_21770 )
      ( MAKE-2PILE ?auto_21766 ?auto_21767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21772 - BLOCK
      ?auto_21773 - BLOCK
    )
    :vars
    (
      ?auto_21777 - BLOCK
      ?auto_21775 - BLOCK
      ?auto_21774 - BLOCK
      ?auto_21776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21777 ?auto_21773 ) ( ON-TABLE ?auto_21772 ) ( ON ?auto_21773 ?auto_21772 ) ( not ( = ?auto_21772 ?auto_21773 ) ) ( not ( = ?auto_21772 ?auto_21777 ) ) ( not ( = ?auto_21773 ?auto_21777 ) ) ( not ( = ?auto_21772 ?auto_21775 ) ) ( not ( = ?auto_21772 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21775 ) ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( not ( = ?auto_21777 ?auto_21775 ) ) ( not ( = ?auto_21777 ?auto_21774 ) ) ( not ( = ?auto_21775 ?auto_21774 ) ) ( ON ?auto_21774 ?auto_21776 ) ( not ( = ?auto_21772 ?auto_21776 ) ) ( not ( = ?auto_21773 ?auto_21776 ) ) ( not ( = ?auto_21777 ?auto_21776 ) ) ( not ( = ?auto_21775 ?auto_21776 ) ) ( not ( = ?auto_21774 ?auto_21776 ) ) ( CLEAR ?auto_21777 ) ( ON ?auto_21775 ?auto_21774 ) ( CLEAR ?auto_21775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21776 ?auto_21774 )
      ( MAKE-2PILE ?auto_21772 ?auto_21773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21790 - BLOCK
      ?auto_21791 - BLOCK
    )
    :vars
    (
      ?auto_21792 - BLOCK
      ?auto_21795 - BLOCK
      ?auto_21793 - BLOCK
      ?auto_21794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21790 ) ( not ( = ?auto_21790 ?auto_21791 ) ) ( not ( = ?auto_21790 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21790 ?auto_21795 ) ) ( not ( = ?auto_21790 ?auto_21793 ) ) ( not ( = ?auto_21791 ?auto_21795 ) ) ( not ( = ?auto_21791 ?auto_21793 ) ) ( not ( = ?auto_21792 ?auto_21795 ) ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( not ( = ?auto_21795 ?auto_21793 ) ) ( ON ?auto_21793 ?auto_21794 ) ( not ( = ?auto_21790 ?auto_21794 ) ) ( not ( = ?auto_21791 ?auto_21794 ) ) ( not ( = ?auto_21792 ?auto_21794 ) ) ( not ( = ?auto_21795 ?auto_21794 ) ) ( not ( = ?auto_21793 ?auto_21794 ) ) ( ON ?auto_21795 ?auto_21793 ) ( ON-TABLE ?auto_21794 ) ( ON ?auto_21792 ?auto_21795 ) ( CLEAR ?auto_21792 ) ( HOLDING ?auto_21791 ) ( CLEAR ?auto_21790 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21790 ?auto_21791 ?auto_21792 )
      ( MAKE-2PILE ?auto_21790 ?auto_21791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21796 - BLOCK
      ?auto_21797 - BLOCK
    )
    :vars
    (
      ?auto_21800 - BLOCK
      ?auto_21799 - BLOCK
      ?auto_21801 - BLOCK
      ?auto_21798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21796 ) ( not ( = ?auto_21796 ?auto_21797 ) ) ( not ( = ?auto_21796 ?auto_21800 ) ) ( not ( = ?auto_21797 ?auto_21800 ) ) ( not ( = ?auto_21796 ?auto_21799 ) ) ( not ( = ?auto_21796 ?auto_21801 ) ) ( not ( = ?auto_21797 ?auto_21799 ) ) ( not ( = ?auto_21797 ?auto_21801 ) ) ( not ( = ?auto_21800 ?auto_21799 ) ) ( not ( = ?auto_21800 ?auto_21801 ) ) ( not ( = ?auto_21799 ?auto_21801 ) ) ( ON ?auto_21801 ?auto_21798 ) ( not ( = ?auto_21796 ?auto_21798 ) ) ( not ( = ?auto_21797 ?auto_21798 ) ) ( not ( = ?auto_21800 ?auto_21798 ) ) ( not ( = ?auto_21799 ?auto_21798 ) ) ( not ( = ?auto_21801 ?auto_21798 ) ) ( ON ?auto_21799 ?auto_21801 ) ( ON-TABLE ?auto_21798 ) ( ON ?auto_21800 ?auto_21799 ) ( CLEAR ?auto_21796 ) ( ON ?auto_21797 ?auto_21800 ) ( CLEAR ?auto_21797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21798 ?auto_21801 ?auto_21799 ?auto_21800 )
      ( MAKE-2PILE ?auto_21796 ?auto_21797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21802 - BLOCK
      ?auto_21803 - BLOCK
    )
    :vars
    (
      ?auto_21805 - BLOCK
      ?auto_21804 - BLOCK
      ?auto_21807 - BLOCK
      ?auto_21806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21802 ?auto_21803 ) ) ( not ( = ?auto_21802 ?auto_21805 ) ) ( not ( = ?auto_21803 ?auto_21805 ) ) ( not ( = ?auto_21802 ?auto_21804 ) ) ( not ( = ?auto_21802 ?auto_21807 ) ) ( not ( = ?auto_21803 ?auto_21804 ) ) ( not ( = ?auto_21803 ?auto_21807 ) ) ( not ( = ?auto_21805 ?auto_21804 ) ) ( not ( = ?auto_21805 ?auto_21807 ) ) ( not ( = ?auto_21804 ?auto_21807 ) ) ( ON ?auto_21807 ?auto_21806 ) ( not ( = ?auto_21802 ?auto_21806 ) ) ( not ( = ?auto_21803 ?auto_21806 ) ) ( not ( = ?auto_21805 ?auto_21806 ) ) ( not ( = ?auto_21804 ?auto_21806 ) ) ( not ( = ?auto_21807 ?auto_21806 ) ) ( ON ?auto_21804 ?auto_21807 ) ( ON-TABLE ?auto_21806 ) ( ON ?auto_21805 ?auto_21804 ) ( ON ?auto_21803 ?auto_21805 ) ( CLEAR ?auto_21803 ) ( HOLDING ?auto_21802 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21802 )
      ( MAKE-2PILE ?auto_21802 ?auto_21803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21808 - BLOCK
      ?auto_21809 - BLOCK
    )
    :vars
    (
      ?auto_21812 - BLOCK
      ?auto_21810 - BLOCK
      ?auto_21811 - BLOCK
      ?auto_21813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21808 ?auto_21809 ) ) ( not ( = ?auto_21808 ?auto_21812 ) ) ( not ( = ?auto_21809 ?auto_21812 ) ) ( not ( = ?auto_21808 ?auto_21810 ) ) ( not ( = ?auto_21808 ?auto_21811 ) ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( not ( = ?auto_21809 ?auto_21811 ) ) ( not ( = ?auto_21812 ?auto_21810 ) ) ( not ( = ?auto_21812 ?auto_21811 ) ) ( not ( = ?auto_21810 ?auto_21811 ) ) ( ON ?auto_21811 ?auto_21813 ) ( not ( = ?auto_21808 ?auto_21813 ) ) ( not ( = ?auto_21809 ?auto_21813 ) ) ( not ( = ?auto_21812 ?auto_21813 ) ) ( not ( = ?auto_21810 ?auto_21813 ) ) ( not ( = ?auto_21811 ?auto_21813 ) ) ( ON ?auto_21810 ?auto_21811 ) ( ON-TABLE ?auto_21813 ) ( ON ?auto_21812 ?auto_21810 ) ( ON ?auto_21809 ?auto_21812 ) ( ON ?auto_21808 ?auto_21809 ) ( CLEAR ?auto_21808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21813 ?auto_21811 ?auto_21810 ?auto_21812 ?auto_21809 )
      ( MAKE-2PILE ?auto_21808 ?auto_21809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21817 - BLOCK
      ?auto_21818 - BLOCK
      ?auto_21819 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21819 ) ( CLEAR ?auto_21818 ) ( ON-TABLE ?auto_21817 ) ( ON ?auto_21818 ?auto_21817 ) ( not ( = ?auto_21817 ?auto_21818 ) ) ( not ( = ?auto_21817 ?auto_21819 ) ) ( not ( = ?auto_21818 ?auto_21819 ) ) )
    :subtasks
    ( ( !STACK ?auto_21819 ?auto_21818 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21820 - BLOCK
      ?auto_21821 - BLOCK
      ?auto_21822 - BLOCK
    )
    :vars
    (
      ?auto_21823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21821 ) ( ON-TABLE ?auto_21820 ) ( ON ?auto_21821 ?auto_21820 ) ( not ( = ?auto_21820 ?auto_21821 ) ) ( not ( = ?auto_21820 ?auto_21822 ) ) ( not ( = ?auto_21821 ?auto_21822 ) ) ( ON ?auto_21822 ?auto_21823 ) ( CLEAR ?auto_21822 ) ( HAND-EMPTY ) ( not ( = ?auto_21820 ?auto_21823 ) ) ( not ( = ?auto_21821 ?auto_21823 ) ) ( not ( = ?auto_21822 ?auto_21823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21822 ?auto_21823 )
      ( MAKE-3PILE ?auto_21820 ?auto_21821 ?auto_21822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21824 - BLOCK
      ?auto_21825 - BLOCK
      ?auto_21826 - BLOCK
    )
    :vars
    (
      ?auto_21827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21824 ) ( not ( = ?auto_21824 ?auto_21825 ) ) ( not ( = ?auto_21824 ?auto_21826 ) ) ( not ( = ?auto_21825 ?auto_21826 ) ) ( ON ?auto_21826 ?auto_21827 ) ( CLEAR ?auto_21826 ) ( not ( = ?auto_21824 ?auto_21827 ) ) ( not ( = ?auto_21825 ?auto_21827 ) ) ( not ( = ?auto_21826 ?auto_21827 ) ) ( HOLDING ?auto_21825 ) ( CLEAR ?auto_21824 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21824 ?auto_21825 )
      ( MAKE-3PILE ?auto_21824 ?auto_21825 ?auto_21826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21828 - BLOCK
      ?auto_21829 - BLOCK
      ?auto_21830 - BLOCK
    )
    :vars
    (
      ?auto_21831 - BLOCK
      ?auto_21832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21828 ) ( not ( = ?auto_21828 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21830 ) ) ( not ( = ?auto_21829 ?auto_21830 ) ) ( ON ?auto_21830 ?auto_21831 ) ( not ( = ?auto_21828 ?auto_21831 ) ) ( not ( = ?auto_21829 ?auto_21831 ) ) ( not ( = ?auto_21830 ?auto_21831 ) ) ( CLEAR ?auto_21828 ) ( ON ?auto_21829 ?auto_21830 ) ( CLEAR ?auto_21829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21832 ) ( ON ?auto_21831 ?auto_21832 ) ( not ( = ?auto_21832 ?auto_21831 ) ) ( not ( = ?auto_21832 ?auto_21830 ) ) ( not ( = ?auto_21832 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21832 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21832 ?auto_21831 ?auto_21830 )
      ( MAKE-3PILE ?auto_21828 ?auto_21829 ?auto_21830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21833 - BLOCK
      ?auto_21834 - BLOCK
      ?auto_21835 - BLOCK
    )
    :vars
    (
      ?auto_21837 - BLOCK
      ?auto_21836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21833 ?auto_21834 ) ) ( not ( = ?auto_21833 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( ON ?auto_21835 ?auto_21837 ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( ON ?auto_21834 ?auto_21835 ) ( CLEAR ?auto_21834 ) ( ON-TABLE ?auto_21836 ) ( ON ?auto_21837 ?auto_21836 ) ( not ( = ?auto_21836 ?auto_21837 ) ) ( not ( = ?auto_21836 ?auto_21835 ) ) ( not ( = ?auto_21836 ?auto_21834 ) ) ( not ( = ?auto_21833 ?auto_21836 ) ) ( HOLDING ?auto_21833 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21833 )
      ( MAKE-3PILE ?auto_21833 ?auto_21834 ?auto_21835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21838 - BLOCK
      ?auto_21839 - BLOCK
      ?auto_21840 - BLOCK
    )
    :vars
    (
      ?auto_21841 - BLOCK
      ?auto_21842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21838 ?auto_21839 ) ) ( not ( = ?auto_21838 ?auto_21840 ) ) ( not ( = ?auto_21839 ?auto_21840 ) ) ( ON ?auto_21840 ?auto_21841 ) ( not ( = ?auto_21838 ?auto_21841 ) ) ( not ( = ?auto_21839 ?auto_21841 ) ) ( not ( = ?auto_21840 ?auto_21841 ) ) ( ON ?auto_21839 ?auto_21840 ) ( ON-TABLE ?auto_21842 ) ( ON ?auto_21841 ?auto_21842 ) ( not ( = ?auto_21842 ?auto_21841 ) ) ( not ( = ?auto_21842 ?auto_21840 ) ) ( not ( = ?auto_21842 ?auto_21839 ) ) ( not ( = ?auto_21838 ?auto_21842 ) ) ( ON ?auto_21838 ?auto_21839 ) ( CLEAR ?auto_21838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21842 ?auto_21841 ?auto_21840 ?auto_21839 )
      ( MAKE-3PILE ?auto_21838 ?auto_21839 ?auto_21840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21843 - BLOCK
      ?auto_21844 - BLOCK
      ?auto_21845 - BLOCK
    )
    :vars
    (
      ?auto_21847 - BLOCK
      ?auto_21846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21843 ?auto_21844 ) ) ( not ( = ?auto_21843 ?auto_21845 ) ) ( not ( = ?auto_21844 ?auto_21845 ) ) ( ON ?auto_21845 ?auto_21847 ) ( not ( = ?auto_21843 ?auto_21847 ) ) ( not ( = ?auto_21844 ?auto_21847 ) ) ( not ( = ?auto_21845 ?auto_21847 ) ) ( ON ?auto_21844 ?auto_21845 ) ( ON-TABLE ?auto_21846 ) ( ON ?auto_21847 ?auto_21846 ) ( not ( = ?auto_21846 ?auto_21847 ) ) ( not ( = ?auto_21846 ?auto_21845 ) ) ( not ( = ?auto_21846 ?auto_21844 ) ) ( not ( = ?auto_21843 ?auto_21846 ) ) ( HOLDING ?auto_21843 ) ( CLEAR ?auto_21844 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21846 ?auto_21847 ?auto_21845 ?auto_21844 ?auto_21843 )
      ( MAKE-3PILE ?auto_21843 ?auto_21844 ?auto_21845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21848 - BLOCK
      ?auto_21849 - BLOCK
      ?auto_21850 - BLOCK
    )
    :vars
    (
      ?auto_21851 - BLOCK
      ?auto_21852 - BLOCK
      ?auto_21853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21848 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21850 ) ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( ON ?auto_21850 ?auto_21851 ) ( not ( = ?auto_21848 ?auto_21851 ) ) ( not ( = ?auto_21849 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( ON ?auto_21849 ?auto_21850 ) ( ON-TABLE ?auto_21852 ) ( ON ?auto_21851 ?auto_21852 ) ( not ( = ?auto_21852 ?auto_21851 ) ) ( not ( = ?auto_21852 ?auto_21850 ) ) ( not ( = ?auto_21852 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21852 ) ) ( CLEAR ?auto_21849 ) ( ON ?auto_21848 ?auto_21853 ) ( CLEAR ?auto_21848 ) ( HAND-EMPTY ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21850 ?auto_21853 ) ) ( not ( = ?auto_21851 ?auto_21853 ) ) ( not ( = ?auto_21852 ?auto_21853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21848 ?auto_21853 )
      ( MAKE-3PILE ?auto_21848 ?auto_21849 ?auto_21850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21854 - BLOCK
      ?auto_21855 - BLOCK
      ?auto_21856 - BLOCK
    )
    :vars
    (
      ?auto_21858 - BLOCK
      ?auto_21857 - BLOCK
      ?auto_21859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21854 ?auto_21855 ) ) ( not ( = ?auto_21854 ?auto_21856 ) ) ( not ( = ?auto_21855 ?auto_21856 ) ) ( ON ?auto_21856 ?auto_21858 ) ( not ( = ?auto_21854 ?auto_21858 ) ) ( not ( = ?auto_21855 ?auto_21858 ) ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( ON-TABLE ?auto_21857 ) ( ON ?auto_21858 ?auto_21857 ) ( not ( = ?auto_21857 ?auto_21858 ) ) ( not ( = ?auto_21857 ?auto_21856 ) ) ( not ( = ?auto_21857 ?auto_21855 ) ) ( not ( = ?auto_21854 ?auto_21857 ) ) ( ON ?auto_21854 ?auto_21859 ) ( CLEAR ?auto_21854 ) ( not ( = ?auto_21854 ?auto_21859 ) ) ( not ( = ?auto_21855 ?auto_21859 ) ) ( not ( = ?auto_21856 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( not ( = ?auto_21857 ?auto_21859 ) ) ( HOLDING ?auto_21855 ) ( CLEAR ?auto_21856 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21857 ?auto_21858 ?auto_21856 ?auto_21855 )
      ( MAKE-3PILE ?auto_21854 ?auto_21855 ?auto_21856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21860 - BLOCK
      ?auto_21861 - BLOCK
      ?auto_21862 - BLOCK
    )
    :vars
    (
      ?auto_21865 - BLOCK
      ?auto_21864 - BLOCK
      ?auto_21863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21860 ?auto_21861 ) ) ( not ( = ?auto_21860 ?auto_21862 ) ) ( not ( = ?auto_21861 ?auto_21862 ) ) ( ON ?auto_21862 ?auto_21865 ) ( not ( = ?auto_21860 ?auto_21865 ) ) ( not ( = ?auto_21861 ?auto_21865 ) ) ( not ( = ?auto_21862 ?auto_21865 ) ) ( ON-TABLE ?auto_21864 ) ( ON ?auto_21865 ?auto_21864 ) ( not ( = ?auto_21864 ?auto_21865 ) ) ( not ( = ?auto_21864 ?auto_21862 ) ) ( not ( = ?auto_21864 ?auto_21861 ) ) ( not ( = ?auto_21860 ?auto_21864 ) ) ( ON ?auto_21860 ?auto_21863 ) ( not ( = ?auto_21860 ?auto_21863 ) ) ( not ( = ?auto_21861 ?auto_21863 ) ) ( not ( = ?auto_21862 ?auto_21863 ) ) ( not ( = ?auto_21865 ?auto_21863 ) ) ( not ( = ?auto_21864 ?auto_21863 ) ) ( CLEAR ?auto_21862 ) ( ON ?auto_21861 ?auto_21860 ) ( CLEAR ?auto_21861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21863 ?auto_21860 )
      ( MAKE-3PILE ?auto_21860 ?auto_21861 ?auto_21862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21866 - BLOCK
      ?auto_21867 - BLOCK
      ?auto_21868 - BLOCK
    )
    :vars
    (
      ?auto_21870 - BLOCK
      ?auto_21869 - BLOCK
      ?auto_21871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21868 ) ) ( not ( = ?auto_21867 ?auto_21868 ) ) ( not ( = ?auto_21866 ?auto_21870 ) ) ( not ( = ?auto_21867 ?auto_21870 ) ) ( not ( = ?auto_21868 ?auto_21870 ) ) ( ON-TABLE ?auto_21869 ) ( ON ?auto_21870 ?auto_21869 ) ( not ( = ?auto_21869 ?auto_21870 ) ) ( not ( = ?auto_21869 ?auto_21868 ) ) ( not ( = ?auto_21869 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21869 ) ) ( ON ?auto_21866 ?auto_21871 ) ( not ( = ?auto_21866 ?auto_21871 ) ) ( not ( = ?auto_21867 ?auto_21871 ) ) ( not ( = ?auto_21868 ?auto_21871 ) ) ( not ( = ?auto_21870 ?auto_21871 ) ) ( not ( = ?auto_21869 ?auto_21871 ) ) ( ON ?auto_21867 ?auto_21866 ) ( CLEAR ?auto_21867 ) ( ON-TABLE ?auto_21871 ) ( HOLDING ?auto_21868 ) ( CLEAR ?auto_21870 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21869 ?auto_21870 ?auto_21868 )
      ( MAKE-3PILE ?auto_21866 ?auto_21867 ?auto_21868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21872 - BLOCK
      ?auto_21873 - BLOCK
      ?auto_21874 - BLOCK
    )
    :vars
    (
      ?auto_21877 - BLOCK
      ?auto_21875 - BLOCK
      ?auto_21876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21872 ?auto_21873 ) ) ( not ( = ?auto_21872 ?auto_21874 ) ) ( not ( = ?auto_21873 ?auto_21874 ) ) ( not ( = ?auto_21872 ?auto_21877 ) ) ( not ( = ?auto_21873 ?auto_21877 ) ) ( not ( = ?auto_21874 ?auto_21877 ) ) ( ON-TABLE ?auto_21875 ) ( ON ?auto_21877 ?auto_21875 ) ( not ( = ?auto_21875 ?auto_21877 ) ) ( not ( = ?auto_21875 ?auto_21874 ) ) ( not ( = ?auto_21875 ?auto_21873 ) ) ( not ( = ?auto_21872 ?auto_21875 ) ) ( ON ?auto_21872 ?auto_21876 ) ( not ( = ?auto_21872 ?auto_21876 ) ) ( not ( = ?auto_21873 ?auto_21876 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( not ( = ?auto_21877 ?auto_21876 ) ) ( not ( = ?auto_21875 ?auto_21876 ) ) ( ON ?auto_21873 ?auto_21872 ) ( ON-TABLE ?auto_21876 ) ( CLEAR ?auto_21877 ) ( ON ?auto_21874 ?auto_21873 ) ( CLEAR ?auto_21874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21876 ?auto_21872 ?auto_21873 )
      ( MAKE-3PILE ?auto_21872 ?auto_21873 ?auto_21874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21878 - BLOCK
      ?auto_21879 - BLOCK
      ?auto_21880 - BLOCK
    )
    :vars
    (
      ?auto_21883 - BLOCK
      ?auto_21882 - BLOCK
      ?auto_21881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21880 ) ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21878 ?auto_21883 ) ) ( not ( = ?auto_21879 ?auto_21883 ) ) ( not ( = ?auto_21880 ?auto_21883 ) ) ( ON-TABLE ?auto_21882 ) ( not ( = ?auto_21882 ?auto_21883 ) ) ( not ( = ?auto_21882 ?auto_21880 ) ) ( not ( = ?auto_21882 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21882 ) ) ( ON ?auto_21878 ?auto_21881 ) ( not ( = ?auto_21878 ?auto_21881 ) ) ( not ( = ?auto_21879 ?auto_21881 ) ) ( not ( = ?auto_21880 ?auto_21881 ) ) ( not ( = ?auto_21883 ?auto_21881 ) ) ( not ( = ?auto_21882 ?auto_21881 ) ) ( ON ?auto_21879 ?auto_21878 ) ( ON-TABLE ?auto_21881 ) ( ON ?auto_21880 ?auto_21879 ) ( CLEAR ?auto_21880 ) ( HOLDING ?auto_21883 ) ( CLEAR ?auto_21882 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21882 ?auto_21883 )
      ( MAKE-3PILE ?auto_21878 ?auto_21879 ?auto_21880 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21884 - BLOCK
      ?auto_21885 - BLOCK
      ?auto_21886 - BLOCK
    )
    :vars
    (
      ?auto_21887 - BLOCK
      ?auto_21888 - BLOCK
      ?auto_21889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21884 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21886 ) ) ( not ( = ?auto_21885 ?auto_21886 ) ) ( not ( = ?auto_21884 ?auto_21887 ) ) ( not ( = ?auto_21885 ?auto_21887 ) ) ( not ( = ?auto_21886 ?auto_21887 ) ) ( ON-TABLE ?auto_21888 ) ( not ( = ?auto_21888 ?auto_21887 ) ) ( not ( = ?auto_21888 ?auto_21886 ) ) ( not ( = ?auto_21888 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21888 ) ) ( ON ?auto_21884 ?auto_21889 ) ( not ( = ?auto_21884 ?auto_21889 ) ) ( not ( = ?auto_21885 ?auto_21889 ) ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21887 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( ON ?auto_21885 ?auto_21884 ) ( ON-TABLE ?auto_21889 ) ( ON ?auto_21886 ?auto_21885 ) ( CLEAR ?auto_21888 ) ( ON ?auto_21887 ?auto_21886 ) ( CLEAR ?auto_21887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21889 ?auto_21884 ?auto_21885 ?auto_21886 )
      ( MAKE-3PILE ?auto_21884 ?auto_21885 ?auto_21886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21890 - BLOCK
      ?auto_21891 - BLOCK
      ?auto_21892 - BLOCK
    )
    :vars
    (
      ?auto_21895 - BLOCK
      ?auto_21894 - BLOCK
      ?auto_21893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21890 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21892 ) ) ( not ( = ?auto_21891 ?auto_21892 ) ) ( not ( = ?auto_21890 ?auto_21895 ) ) ( not ( = ?auto_21891 ?auto_21895 ) ) ( not ( = ?auto_21892 ?auto_21895 ) ) ( not ( = ?auto_21894 ?auto_21895 ) ) ( not ( = ?auto_21894 ?auto_21892 ) ) ( not ( = ?auto_21894 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21894 ) ) ( ON ?auto_21890 ?auto_21893 ) ( not ( = ?auto_21890 ?auto_21893 ) ) ( not ( = ?auto_21891 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21893 ) ) ( not ( = ?auto_21895 ?auto_21893 ) ) ( not ( = ?auto_21894 ?auto_21893 ) ) ( ON ?auto_21891 ?auto_21890 ) ( ON-TABLE ?auto_21893 ) ( ON ?auto_21892 ?auto_21891 ) ( ON ?auto_21895 ?auto_21892 ) ( CLEAR ?auto_21895 ) ( HOLDING ?auto_21894 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21894 )
      ( MAKE-3PILE ?auto_21890 ?auto_21891 ?auto_21892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21896 - BLOCK
      ?auto_21897 - BLOCK
      ?auto_21898 - BLOCK
    )
    :vars
    (
      ?auto_21899 - BLOCK
      ?auto_21901 - BLOCK
      ?auto_21900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21896 ?auto_21897 ) ) ( not ( = ?auto_21896 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( not ( = ?auto_21896 ?auto_21899 ) ) ( not ( = ?auto_21897 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21901 ?auto_21899 ) ) ( not ( = ?auto_21901 ?auto_21898 ) ) ( not ( = ?auto_21901 ?auto_21897 ) ) ( not ( = ?auto_21896 ?auto_21901 ) ) ( ON ?auto_21896 ?auto_21900 ) ( not ( = ?auto_21896 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21901 ?auto_21900 ) ) ( ON ?auto_21897 ?auto_21896 ) ( ON-TABLE ?auto_21900 ) ( ON ?auto_21898 ?auto_21897 ) ( ON ?auto_21899 ?auto_21898 ) ( ON ?auto_21901 ?auto_21899 ) ( CLEAR ?auto_21901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21900 ?auto_21896 ?auto_21897 ?auto_21898 ?auto_21899 )
      ( MAKE-3PILE ?auto_21896 ?auto_21897 ?auto_21898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21903 - BLOCK
    )
    :vars
    (
      ?auto_21904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21904 ?auto_21903 ) ( CLEAR ?auto_21904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21903 ) ( not ( = ?auto_21903 ?auto_21904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21904 ?auto_21903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21905 - BLOCK
    )
    :vars
    (
      ?auto_21906 - BLOCK
      ?auto_21907 - BLOCK
      ?auto_21908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21906 ?auto_21905 ) ( CLEAR ?auto_21906 ) ( ON-TABLE ?auto_21905 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( HOLDING ?auto_21907 ) ( CLEAR ?auto_21908 ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21908 ) ) )
    :subtasks
    ( ( !STACK ?auto_21907 ?auto_21908 )
      ( MAKE-1PILE ?auto_21905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21909 - BLOCK
    )
    :vars
    (
      ?auto_21911 - BLOCK
      ?auto_21912 - BLOCK
      ?auto_21910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21911 ?auto_21909 ) ( ON-TABLE ?auto_21909 ) ( not ( = ?auto_21909 ?auto_21911 ) ) ( CLEAR ?auto_21912 ) ( not ( = ?auto_21909 ?auto_21910 ) ) ( not ( = ?auto_21909 ?auto_21912 ) ) ( not ( = ?auto_21911 ?auto_21910 ) ) ( not ( = ?auto_21911 ?auto_21912 ) ) ( not ( = ?auto_21910 ?auto_21912 ) ) ( ON ?auto_21910 ?auto_21911 ) ( CLEAR ?auto_21910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21909 ?auto_21911 )
      ( MAKE-1PILE ?auto_21909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21913 - BLOCK
    )
    :vars
    (
      ?auto_21914 - BLOCK
      ?auto_21916 - BLOCK
      ?auto_21915 - BLOCK
      ?auto_21917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21914 ?auto_21913 ) ( ON-TABLE ?auto_21913 ) ( not ( = ?auto_21913 ?auto_21914 ) ) ( not ( = ?auto_21913 ?auto_21916 ) ) ( not ( = ?auto_21913 ?auto_21915 ) ) ( not ( = ?auto_21914 ?auto_21916 ) ) ( not ( = ?auto_21914 ?auto_21915 ) ) ( not ( = ?auto_21916 ?auto_21915 ) ) ( ON ?auto_21916 ?auto_21914 ) ( CLEAR ?auto_21916 ) ( HOLDING ?auto_21915 ) ( CLEAR ?auto_21917 ) ( ON-TABLE ?auto_21917 ) ( not ( = ?auto_21917 ?auto_21915 ) ) ( not ( = ?auto_21913 ?auto_21917 ) ) ( not ( = ?auto_21914 ?auto_21917 ) ) ( not ( = ?auto_21916 ?auto_21917 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21917 ?auto_21915 )
      ( MAKE-1PILE ?auto_21913 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21918 - BLOCK
    )
    :vars
    (
      ?auto_21922 - BLOCK
      ?auto_21921 - BLOCK
      ?auto_21920 - BLOCK
      ?auto_21919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21922 ?auto_21918 ) ( ON-TABLE ?auto_21918 ) ( not ( = ?auto_21918 ?auto_21922 ) ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21920 ) ) ( not ( = ?auto_21922 ?auto_21921 ) ) ( not ( = ?auto_21922 ?auto_21920 ) ) ( not ( = ?auto_21921 ?auto_21920 ) ) ( ON ?auto_21921 ?auto_21922 ) ( CLEAR ?auto_21919 ) ( ON-TABLE ?auto_21919 ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( not ( = ?auto_21922 ?auto_21919 ) ) ( not ( = ?auto_21921 ?auto_21919 ) ) ( ON ?auto_21920 ?auto_21921 ) ( CLEAR ?auto_21920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21918 ?auto_21922 ?auto_21921 )
      ( MAKE-1PILE ?auto_21918 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21923 - BLOCK
    )
    :vars
    (
      ?auto_21925 - BLOCK
      ?auto_21927 - BLOCK
      ?auto_21926 - BLOCK
      ?auto_21924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21925 ?auto_21923 ) ( ON-TABLE ?auto_21923 ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21927 ) ) ( not ( = ?auto_21923 ?auto_21926 ) ) ( not ( = ?auto_21925 ?auto_21927 ) ) ( not ( = ?auto_21925 ?auto_21926 ) ) ( not ( = ?auto_21927 ?auto_21926 ) ) ( ON ?auto_21927 ?auto_21925 ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( not ( = ?auto_21923 ?auto_21924 ) ) ( not ( = ?auto_21925 ?auto_21924 ) ) ( not ( = ?auto_21927 ?auto_21924 ) ) ( ON ?auto_21926 ?auto_21927 ) ( CLEAR ?auto_21926 ) ( HOLDING ?auto_21924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21924 )
      ( MAKE-1PILE ?auto_21923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21928 - BLOCK
    )
    :vars
    (
      ?auto_21929 - BLOCK
      ?auto_21931 - BLOCK
      ?auto_21930 - BLOCK
      ?auto_21932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21929 ?auto_21928 ) ( ON-TABLE ?auto_21928 ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( not ( = ?auto_21928 ?auto_21931 ) ) ( not ( = ?auto_21928 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21931 ) ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( not ( = ?auto_21931 ?auto_21930 ) ) ( ON ?auto_21931 ?auto_21929 ) ( not ( = ?auto_21932 ?auto_21930 ) ) ( not ( = ?auto_21928 ?auto_21932 ) ) ( not ( = ?auto_21929 ?auto_21932 ) ) ( not ( = ?auto_21931 ?auto_21932 ) ) ( ON ?auto_21930 ?auto_21931 ) ( ON ?auto_21932 ?auto_21930 ) ( CLEAR ?auto_21932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21928 ?auto_21929 ?auto_21931 ?auto_21930 )
      ( MAKE-1PILE ?auto_21928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21933 - BLOCK
    )
    :vars
    (
      ?auto_21936 - BLOCK
      ?auto_21935 - BLOCK
      ?auto_21937 - BLOCK
      ?auto_21934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21936 ?auto_21933 ) ( ON-TABLE ?auto_21933 ) ( not ( = ?auto_21933 ?auto_21936 ) ) ( not ( = ?auto_21933 ?auto_21935 ) ) ( not ( = ?auto_21933 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21935 ) ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21935 ?auto_21937 ) ) ( ON ?auto_21935 ?auto_21936 ) ( not ( = ?auto_21934 ?auto_21937 ) ) ( not ( = ?auto_21933 ?auto_21934 ) ) ( not ( = ?auto_21936 ?auto_21934 ) ) ( not ( = ?auto_21935 ?auto_21934 ) ) ( ON ?auto_21937 ?auto_21935 ) ( HOLDING ?auto_21934 ) ( CLEAR ?auto_21937 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21933 ?auto_21936 ?auto_21935 ?auto_21937 ?auto_21934 )
      ( MAKE-1PILE ?auto_21933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21938 - BLOCK
    )
    :vars
    (
      ?auto_21940 - BLOCK
      ?auto_21941 - BLOCK
      ?auto_21942 - BLOCK
      ?auto_21939 - BLOCK
      ?auto_21943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21940 ?auto_21938 ) ( ON-TABLE ?auto_21938 ) ( not ( = ?auto_21938 ?auto_21940 ) ) ( not ( = ?auto_21938 ?auto_21941 ) ) ( not ( = ?auto_21938 ?auto_21942 ) ) ( not ( = ?auto_21940 ?auto_21941 ) ) ( not ( = ?auto_21940 ?auto_21942 ) ) ( not ( = ?auto_21941 ?auto_21942 ) ) ( ON ?auto_21941 ?auto_21940 ) ( not ( = ?auto_21939 ?auto_21942 ) ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21940 ?auto_21939 ) ) ( not ( = ?auto_21941 ?auto_21939 ) ) ( ON ?auto_21942 ?auto_21941 ) ( CLEAR ?auto_21942 ) ( ON ?auto_21939 ?auto_21943 ) ( CLEAR ?auto_21939 ) ( HAND-EMPTY ) ( not ( = ?auto_21938 ?auto_21943 ) ) ( not ( = ?auto_21940 ?auto_21943 ) ) ( not ( = ?auto_21941 ?auto_21943 ) ) ( not ( = ?auto_21942 ?auto_21943 ) ) ( not ( = ?auto_21939 ?auto_21943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21939 ?auto_21943 )
      ( MAKE-1PILE ?auto_21938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21944 - BLOCK
    )
    :vars
    (
      ?auto_21946 - BLOCK
      ?auto_21949 - BLOCK
      ?auto_21945 - BLOCK
      ?auto_21947 - BLOCK
      ?auto_21948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21946 ?auto_21944 ) ( ON-TABLE ?auto_21944 ) ( not ( = ?auto_21944 ?auto_21946 ) ) ( not ( = ?auto_21944 ?auto_21949 ) ) ( not ( = ?auto_21944 ?auto_21945 ) ) ( not ( = ?auto_21946 ?auto_21949 ) ) ( not ( = ?auto_21946 ?auto_21945 ) ) ( not ( = ?auto_21949 ?auto_21945 ) ) ( ON ?auto_21949 ?auto_21946 ) ( not ( = ?auto_21947 ?auto_21945 ) ) ( not ( = ?auto_21944 ?auto_21947 ) ) ( not ( = ?auto_21946 ?auto_21947 ) ) ( not ( = ?auto_21949 ?auto_21947 ) ) ( ON ?auto_21947 ?auto_21948 ) ( CLEAR ?auto_21947 ) ( not ( = ?auto_21944 ?auto_21948 ) ) ( not ( = ?auto_21946 ?auto_21948 ) ) ( not ( = ?auto_21949 ?auto_21948 ) ) ( not ( = ?auto_21945 ?auto_21948 ) ) ( not ( = ?auto_21947 ?auto_21948 ) ) ( HOLDING ?auto_21945 ) ( CLEAR ?auto_21949 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21944 ?auto_21946 ?auto_21949 ?auto_21945 )
      ( MAKE-1PILE ?auto_21944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21950 - BLOCK
    )
    :vars
    (
      ?auto_21954 - BLOCK
      ?auto_21951 - BLOCK
      ?auto_21953 - BLOCK
      ?auto_21952 - BLOCK
      ?auto_21955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21954 ?auto_21950 ) ( ON-TABLE ?auto_21950 ) ( not ( = ?auto_21950 ?auto_21954 ) ) ( not ( = ?auto_21950 ?auto_21951 ) ) ( not ( = ?auto_21950 ?auto_21953 ) ) ( not ( = ?auto_21954 ?auto_21951 ) ) ( not ( = ?auto_21954 ?auto_21953 ) ) ( not ( = ?auto_21951 ?auto_21953 ) ) ( ON ?auto_21951 ?auto_21954 ) ( not ( = ?auto_21952 ?auto_21953 ) ) ( not ( = ?auto_21950 ?auto_21952 ) ) ( not ( = ?auto_21954 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( ON ?auto_21952 ?auto_21955 ) ( not ( = ?auto_21950 ?auto_21955 ) ) ( not ( = ?auto_21954 ?auto_21955 ) ) ( not ( = ?auto_21951 ?auto_21955 ) ) ( not ( = ?auto_21953 ?auto_21955 ) ) ( not ( = ?auto_21952 ?auto_21955 ) ) ( CLEAR ?auto_21951 ) ( ON ?auto_21953 ?auto_21952 ) ( CLEAR ?auto_21953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21955 ?auto_21952 )
      ( MAKE-1PILE ?auto_21950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21956 - BLOCK
    )
    :vars
    (
      ?auto_21960 - BLOCK
      ?auto_21958 - BLOCK
      ?auto_21957 - BLOCK
      ?auto_21961 - BLOCK
      ?auto_21959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21960 ?auto_21956 ) ( ON-TABLE ?auto_21956 ) ( not ( = ?auto_21956 ?auto_21960 ) ) ( not ( = ?auto_21956 ?auto_21958 ) ) ( not ( = ?auto_21956 ?auto_21957 ) ) ( not ( = ?auto_21960 ?auto_21958 ) ) ( not ( = ?auto_21960 ?auto_21957 ) ) ( not ( = ?auto_21958 ?auto_21957 ) ) ( not ( = ?auto_21961 ?auto_21957 ) ) ( not ( = ?auto_21956 ?auto_21961 ) ) ( not ( = ?auto_21960 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( ON ?auto_21961 ?auto_21959 ) ( not ( = ?auto_21956 ?auto_21959 ) ) ( not ( = ?auto_21960 ?auto_21959 ) ) ( not ( = ?auto_21958 ?auto_21959 ) ) ( not ( = ?auto_21957 ?auto_21959 ) ) ( not ( = ?auto_21961 ?auto_21959 ) ) ( ON ?auto_21957 ?auto_21961 ) ( CLEAR ?auto_21957 ) ( ON-TABLE ?auto_21959 ) ( HOLDING ?auto_21958 ) ( CLEAR ?auto_21960 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21956 ?auto_21960 ?auto_21958 )
      ( MAKE-1PILE ?auto_21956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21962 - BLOCK
    )
    :vars
    (
      ?auto_21967 - BLOCK
      ?auto_21966 - BLOCK
      ?auto_21964 - BLOCK
      ?auto_21963 - BLOCK
      ?auto_21965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21967 ?auto_21962 ) ( ON-TABLE ?auto_21962 ) ( not ( = ?auto_21962 ?auto_21967 ) ) ( not ( = ?auto_21962 ?auto_21966 ) ) ( not ( = ?auto_21962 ?auto_21964 ) ) ( not ( = ?auto_21967 ?auto_21966 ) ) ( not ( = ?auto_21967 ?auto_21964 ) ) ( not ( = ?auto_21966 ?auto_21964 ) ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( not ( = ?auto_21962 ?auto_21963 ) ) ( not ( = ?auto_21967 ?auto_21963 ) ) ( not ( = ?auto_21966 ?auto_21963 ) ) ( ON ?auto_21963 ?auto_21965 ) ( not ( = ?auto_21962 ?auto_21965 ) ) ( not ( = ?auto_21967 ?auto_21965 ) ) ( not ( = ?auto_21966 ?auto_21965 ) ) ( not ( = ?auto_21964 ?auto_21965 ) ) ( not ( = ?auto_21963 ?auto_21965 ) ) ( ON ?auto_21964 ?auto_21963 ) ( ON-TABLE ?auto_21965 ) ( CLEAR ?auto_21967 ) ( ON ?auto_21966 ?auto_21964 ) ( CLEAR ?auto_21966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21965 ?auto_21963 ?auto_21964 )
      ( MAKE-1PILE ?auto_21962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21980 - BLOCK
    )
    :vars
    (
      ?auto_21981 - BLOCK
      ?auto_21982 - BLOCK
      ?auto_21984 - BLOCK
      ?auto_21985 - BLOCK
      ?auto_21983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21980 ?auto_21981 ) ) ( not ( = ?auto_21980 ?auto_21982 ) ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21981 ?auto_21982 ) ) ( not ( = ?auto_21981 ?auto_21984 ) ) ( not ( = ?auto_21982 ?auto_21984 ) ) ( not ( = ?auto_21985 ?auto_21984 ) ) ( not ( = ?auto_21980 ?auto_21985 ) ) ( not ( = ?auto_21981 ?auto_21985 ) ) ( not ( = ?auto_21982 ?auto_21985 ) ) ( ON ?auto_21985 ?auto_21983 ) ( not ( = ?auto_21980 ?auto_21983 ) ) ( not ( = ?auto_21981 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21984 ?auto_21983 ) ) ( not ( = ?auto_21985 ?auto_21983 ) ) ( ON ?auto_21984 ?auto_21985 ) ( ON-TABLE ?auto_21983 ) ( ON ?auto_21982 ?auto_21984 ) ( ON ?auto_21981 ?auto_21982 ) ( CLEAR ?auto_21981 ) ( HOLDING ?auto_21980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21980 ?auto_21981 )
      ( MAKE-1PILE ?auto_21980 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_21986 - BLOCK
    )
    :vars
    (
      ?auto_21991 - BLOCK
      ?auto_21988 - BLOCK
      ?auto_21989 - BLOCK
      ?auto_21987 - BLOCK
      ?auto_21990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21986 ?auto_21991 ) ) ( not ( = ?auto_21986 ?auto_21988 ) ) ( not ( = ?auto_21986 ?auto_21989 ) ) ( not ( = ?auto_21991 ?auto_21988 ) ) ( not ( = ?auto_21991 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( not ( = ?auto_21986 ?auto_21987 ) ) ( not ( = ?auto_21991 ?auto_21987 ) ) ( not ( = ?auto_21988 ?auto_21987 ) ) ( ON ?auto_21987 ?auto_21990 ) ( not ( = ?auto_21986 ?auto_21990 ) ) ( not ( = ?auto_21991 ?auto_21990 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21987 ?auto_21990 ) ) ( ON ?auto_21989 ?auto_21987 ) ( ON-TABLE ?auto_21990 ) ( ON ?auto_21988 ?auto_21989 ) ( ON ?auto_21991 ?auto_21988 ) ( ON ?auto_21986 ?auto_21991 ) ( CLEAR ?auto_21986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21990 ?auto_21987 ?auto_21989 ?auto_21988 ?auto_21991 )
      ( MAKE-1PILE ?auto_21986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21996 - BLOCK
      ?auto_21997 - BLOCK
      ?auto_21998 - BLOCK
      ?auto_21999 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21999 ) ( CLEAR ?auto_21998 ) ( ON-TABLE ?auto_21996 ) ( ON ?auto_21997 ?auto_21996 ) ( ON ?auto_21998 ?auto_21997 ) ( not ( = ?auto_21996 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_21999 ) ) ( not ( = ?auto_21998 ?auto_21999 ) ) )
    :subtasks
    ( ( !STACK ?auto_21999 ?auto_21998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22000 - BLOCK
      ?auto_22001 - BLOCK
      ?auto_22002 - BLOCK
      ?auto_22003 - BLOCK
    )
    :vars
    (
      ?auto_22004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22002 ) ( ON-TABLE ?auto_22000 ) ( ON ?auto_22001 ?auto_22000 ) ( ON ?auto_22002 ?auto_22001 ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22003 ) ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( not ( = ?auto_22002 ?auto_22003 ) ) ( ON ?auto_22003 ?auto_22004 ) ( CLEAR ?auto_22003 ) ( HAND-EMPTY ) ( not ( = ?auto_22000 ?auto_22004 ) ) ( not ( = ?auto_22001 ?auto_22004 ) ) ( not ( = ?auto_22002 ?auto_22004 ) ) ( not ( = ?auto_22003 ?auto_22004 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22003 ?auto_22004 )
      ( MAKE-4PILE ?auto_22000 ?auto_22001 ?auto_22002 ?auto_22003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22005 - BLOCK
      ?auto_22006 - BLOCK
      ?auto_22007 - BLOCK
      ?auto_22008 - BLOCK
    )
    :vars
    (
      ?auto_22009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22005 ) ( ON ?auto_22006 ?auto_22005 ) ( not ( = ?auto_22005 ?auto_22006 ) ) ( not ( = ?auto_22005 ?auto_22007 ) ) ( not ( = ?auto_22005 ?auto_22008 ) ) ( not ( = ?auto_22006 ?auto_22007 ) ) ( not ( = ?auto_22006 ?auto_22008 ) ) ( not ( = ?auto_22007 ?auto_22008 ) ) ( ON ?auto_22008 ?auto_22009 ) ( CLEAR ?auto_22008 ) ( not ( = ?auto_22005 ?auto_22009 ) ) ( not ( = ?auto_22006 ?auto_22009 ) ) ( not ( = ?auto_22007 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22009 ) ) ( HOLDING ?auto_22007 ) ( CLEAR ?auto_22006 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22005 ?auto_22006 ?auto_22007 )
      ( MAKE-4PILE ?auto_22005 ?auto_22006 ?auto_22007 ?auto_22008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22010 - BLOCK
      ?auto_22011 - BLOCK
      ?auto_22012 - BLOCK
      ?auto_22013 - BLOCK
    )
    :vars
    (
      ?auto_22014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22010 ) ( ON ?auto_22011 ?auto_22010 ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22012 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( ON ?auto_22013 ?auto_22014 ) ( not ( = ?auto_22010 ?auto_22014 ) ) ( not ( = ?auto_22011 ?auto_22014 ) ) ( not ( = ?auto_22012 ?auto_22014 ) ) ( not ( = ?auto_22013 ?auto_22014 ) ) ( CLEAR ?auto_22011 ) ( ON ?auto_22012 ?auto_22013 ) ( CLEAR ?auto_22012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22014 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22014 ?auto_22013 )
      ( MAKE-4PILE ?auto_22010 ?auto_22011 ?auto_22012 ?auto_22013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22015 - BLOCK
      ?auto_22016 - BLOCK
      ?auto_22017 - BLOCK
      ?auto_22018 - BLOCK
    )
    :vars
    (
      ?auto_22019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22015 ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22015 ?auto_22017 ) ) ( not ( = ?auto_22015 ?auto_22018 ) ) ( not ( = ?auto_22016 ?auto_22017 ) ) ( not ( = ?auto_22016 ?auto_22018 ) ) ( not ( = ?auto_22017 ?auto_22018 ) ) ( ON ?auto_22018 ?auto_22019 ) ( not ( = ?auto_22015 ?auto_22019 ) ) ( not ( = ?auto_22016 ?auto_22019 ) ) ( not ( = ?auto_22017 ?auto_22019 ) ) ( not ( = ?auto_22018 ?auto_22019 ) ) ( ON ?auto_22017 ?auto_22018 ) ( CLEAR ?auto_22017 ) ( ON-TABLE ?auto_22019 ) ( HOLDING ?auto_22016 ) ( CLEAR ?auto_22015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22015 ?auto_22016 )
      ( MAKE-4PILE ?auto_22015 ?auto_22016 ?auto_22017 ?auto_22018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22020 - BLOCK
      ?auto_22021 - BLOCK
      ?auto_22022 - BLOCK
      ?auto_22023 - BLOCK
    )
    :vars
    (
      ?auto_22024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22020 ) ( not ( = ?auto_22020 ?auto_22021 ) ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( not ( = ?auto_22020 ?auto_22023 ) ) ( not ( = ?auto_22021 ?auto_22022 ) ) ( not ( = ?auto_22021 ?auto_22023 ) ) ( not ( = ?auto_22022 ?auto_22023 ) ) ( ON ?auto_22023 ?auto_22024 ) ( not ( = ?auto_22020 ?auto_22024 ) ) ( not ( = ?auto_22021 ?auto_22024 ) ) ( not ( = ?auto_22022 ?auto_22024 ) ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( ON ?auto_22022 ?auto_22023 ) ( ON-TABLE ?auto_22024 ) ( CLEAR ?auto_22020 ) ( ON ?auto_22021 ?auto_22022 ) ( CLEAR ?auto_22021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22024 ?auto_22023 ?auto_22022 )
      ( MAKE-4PILE ?auto_22020 ?auto_22021 ?auto_22022 ?auto_22023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22025 - BLOCK
      ?auto_22026 - BLOCK
      ?auto_22027 - BLOCK
      ?auto_22028 - BLOCK
    )
    :vars
    (
      ?auto_22029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22025 ?auto_22026 ) ) ( not ( = ?auto_22025 ?auto_22027 ) ) ( not ( = ?auto_22025 ?auto_22028 ) ) ( not ( = ?auto_22026 ?auto_22027 ) ) ( not ( = ?auto_22026 ?auto_22028 ) ) ( not ( = ?auto_22027 ?auto_22028 ) ) ( ON ?auto_22028 ?auto_22029 ) ( not ( = ?auto_22025 ?auto_22029 ) ) ( not ( = ?auto_22026 ?auto_22029 ) ) ( not ( = ?auto_22027 ?auto_22029 ) ) ( not ( = ?auto_22028 ?auto_22029 ) ) ( ON ?auto_22027 ?auto_22028 ) ( ON-TABLE ?auto_22029 ) ( ON ?auto_22026 ?auto_22027 ) ( CLEAR ?auto_22026 ) ( HOLDING ?auto_22025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22025 )
      ( MAKE-4PILE ?auto_22025 ?auto_22026 ?auto_22027 ?auto_22028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22030 - BLOCK
      ?auto_22031 - BLOCK
      ?auto_22032 - BLOCK
      ?auto_22033 - BLOCK
    )
    :vars
    (
      ?auto_22034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22030 ?auto_22031 ) ) ( not ( = ?auto_22030 ?auto_22032 ) ) ( not ( = ?auto_22030 ?auto_22033 ) ) ( not ( = ?auto_22031 ?auto_22032 ) ) ( not ( = ?auto_22031 ?auto_22033 ) ) ( not ( = ?auto_22032 ?auto_22033 ) ) ( ON ?auto_22033 ?auto_22034 ) ( not ( = ?auto_22030 ?auto_22034 ) ) ( not ( = ?auto_22031 ?auto_22034 ) ) ( not ( = ?auto_22032 ?auto_22034 ) ) ( not ( = ?auto_22033 ?auto_22034 ) ) ( ON ?auto_22032 ?auto_22033 ) ( ON-TABLE ?auto_22034 ) ( ON ?auto_22031 ?auto_22032 ) ( ON ?auto_22030 ?auto_22031 ) ( CLEAR ?auto_22030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22034 ?auto_22033 ?auto_22032 ?auto_22031 )
      ( MAKE-4PILE ?auto_22030 ?auto_22031 ?auto_22032 ?auto_22033 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22035 - BLOCK
      ?auto_22036 - BLOCK
      ?auto_22037 - BLOCK
      ?auto_22038 - BLOCK
    )
    :vars
    (
      ?auto_22039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22035 ?auto_22036 ) ) ( not ( = ?auto_22035 ?auto_22037 ) ) ( not ( = ?auto_22035 ?auto_22038 ) ) ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22038 ) ) ( not ( = ?auto_22037 ?auto_22038 ) ) ( ON ?auto_22038 ?auto_22039 ) ( not ( = ?auto_22035 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_22037 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( ON ?auto_22037 ?auto_22038 ) ( ON-TABLE ?auto_22039 ) ( ON ?auto_22036 ?auto_22037 ) ( HOLDING ?auto_22035 ) ( CLEAR ?auto_22036 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22039 ?auto_22038 ?auto_22037 ?auto_22036 ?auto_22035 )
      ( MAKE-4PILE ?auto_22035 ?auto_22036 ?auto_22037 ?auto_22038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22040 - BLOCK
      ?auto_22041 - BLOCK
      ?auto_22042 - BLOCK
      ?auto_22043 - BLOCK
    )
    :vars
    (
      ?auto_22044 - BLOCK
      ?auto_22045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( ON ?auto_22043 ?auto_22044 ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( ON ?auto_22042 ?auto_22043 ) ( ON-TABLE ?auto_22044 ) ( ON ?auto_22041 ?auto_22042 ) ( CLEAR ?auto_22041 ) ( ON ?auto_22040 ?auto_22045 ) ( CLEAR ?auto_22040 ) ( HAND-EMPTY ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( not ( = ?auto_22044 ?auto_22045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22040 ?auto_22045 )
      ( MAKE-4PILE ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22046 - BLOCK
      ?auto_22047 - BLOCK
      ?auto_22048 - BLOCK
      ?auto_22049 - BLOCK
    )
    :vars
    (
      ?auto_22050 - BLOCK
      ?auto_22051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22046 ?auto_22047 ) ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( not ( = ?auto_22046 ?auto_22049 ) ) ( not ( = ?auto_22047 ?auto_22048 ) ) ( not ( = ?auto_22047 ?auto_22049 ) ) ( not ( = ?auto_22048 ?auto_22049 ) ) ( ON ?auto_22049 ?auto_22050 ) ( not ( = ?auto_22046 ?auto_22050 ) ) ( not ( = ?auto_22047 ?auto_22050 ) ) ( not ( = ?auto_22048 ?auto_22050 ) ) ( not ( = ?auto_22049 ?auto_22050 ) ) ( ON ?auto_22048 ?auto_22049 ) ( ON-TABLE ?auto_22050 ) ( ON ?auto_22046 ?auto_22051 ) ( CLEAR ?auto_22046 ) ( not ( = ?auto_22046 ?auto_22051 ) ) ( not ( = ?auto_22047 ?auto_22051 ) ) ( not ( = ?auto_22048 ?auto_22051 ) ) ( not ( = ?auto_22049 ?auto_22051 ) ) ( not ( = ?auto_22050 ?auto_22051 ) ) ( HOLDING ?auto_22047 ) ( CLEAR ?auto_22048 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22050 ?auto_22049 ?auto_22048 ?auto_22047 )
      ( MAKE-4PILE ?auto_22046 ?auto_22047 ?auto_22048 ?auto_22049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22052 - BLOCK
      ?auto_22053 - BLOCK
      ?auto_22054 - BLOCK
      ?auto_22055 - BLOCK
    )
    :vars
    (
      ?auto_22056 - BLOCK
      ?auto_22057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22052 ?auto_22053 ) ) ( not ( = ?auto_22052 ?auto_22054 ) ) ( not ( = ?auto_22052 ?auto_22055 ) ) ( not ( = ?auto_22053 ?auto_22054 ) ) ( not ( = ?auto_22053 ?auto_22055 ) ) ( not ( = ?auto_22054 ?auto_22055 ) ) ( ON ?auto_22055 ?auto_22056 ) ( not ( = ?auto_22052 ?auto_22056 ) ) ( not ( = ?auto_22053 ?auto_22056 ) ) ( not ( = ?auto_22054 ?auto_22056 ) ) ( not ( = ?auto_22055 ?auto_22056 ) ) ( ON ?auto_22054 ?auto_22055 ) ( ON-TABLE ?auto_22056 ) ( ON ?auto_22052 ?auto_22057 ) ( not ( = ?auto_22052 ?auto_22057 ) ) ( not ( = ?auto_22053 ?auto_22057 ) ) ( not ( = ?auto_22054 ?auto_22057 ) ) ( not ( = ?auto_22055 ?auto_22057 ) ) ( not ( = ?auto_22056 ?auto_22057 ) ) ( CLEAR ?auto_22054 ) ( ON ?auto_22053 ?auto_22052 ) ( CLEAR ?auto_22053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22057 ?auto_22052 )
      ( MAKE-4PILE ?auto_22052 ?auto_22053 ?auto_22054 ?auto_22055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22058 - BLOCK
      ?auto_22059 - BLOCK
      ?auto_22060 - BLOCK
      ?auto_22061 - BLOCK
    )
    :vars
    (
      ?auto_22062 - BLOCK
      ?auto_22063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22058 ?auto_22059 ) ) ( not ( = ?auto_22058 ?auto_22060 ) ) ( not ( = ?auto_22058 ?auto_22061 ) ) ( not ( = ?auto_22059 ?auto_22060 ) ) ( not ( = ?auto_22059 ?auto_22061 ) ) ( not ( = ?auto_22060 ?auto_22061 ) ) ( ON ?auto_22061 ?auto_22062 ) ( not ( = ?auto_22058 ?auto_22062 ) ) ( not ( = ?auto_22059 ?auto_22062 ) ) ( not ( = ?auto_22060 ?auto_22062 ) ) ( not ( = ?auto_22061 ?auto_22062 ) ) ( ON-TABLE ?auto_22062 ) ( ON ?auto_22058 ?auto_22063 ) ( not ( = ?auto_22058 ?auto_22063 ) ) ( not ( = ?auto_22059 ?auto_22063 ) ) ( not ( = ?auto_22060 ?auto_22063 ) ) ( not ( = ?auto_22061 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( ON ?auto_22059 ?auto_22058 ) ( CLEAR ?auto_22059 ) ( ON-TABLE ?auto_22063 ) ( HOLDING ?auto_22060 ) ( CLEAR ?auto_22061 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22062 ?auto_22061 ?auto_22060 )
      ( MAKE-4PILE ?auto_22058 ?auto_22059 ?auto_22060 ?auto_22061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22064 - BLOCK
      ?auto_22065 - BLOCK
      ?auto_22066 - BLOCK
      ?auto_22067 - BLOCK
    )
    :vars
    (
      ?auto_22068 - BLOCK
      ?auto_22069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22064 ?auto_22065 ) ) ( not ( = ?auto_22064 ?auto_22066 ) ) ( not ( = ?auto_22064 ?auto_22067 ) ) ( not ( = ?auto_22065 ?auto_22066 ) ) ( not ( = ?auto_22065 ?auto_22067 ) ) ( not ( = ?auto_22066 ?auto_22067 ) ) ( ON ?auto_22067 ?auto_22068 ) ( not ( = ?auto_22064 ?auto_22068 ) ) ( not ( = ?auto_22065 ?auto_22068 ) ) ( not ( = ?auto_22066 ?auto_22068 ) ) ( not ( = ?auto_22067 ?auto_22068 ) ) ( ON-TABLE ?auto_22068 ) ( ON ?auto_22064 ?auto_22069 ) ( not ( = ?auto_22064 ?auto_22069 ) ) ( not ( = ?auto_22065 ?auto_22069 ) ) ( not ( = ?auto_22066 ?auto_22069 ) ) ( not ( = ?auto_22067 ?auto_22069 ) ) ( not ( = ?auto_22068 ?auto_22069 ) ) ( ON ?auto_22065 ?auto_22064 ) ( ON-TABLE ?auto_22069 ) ( CLEAR ?auto_22067 ) ( ON ?auto_22066 ?auto_22065 ) ( CLEAR ?auto_22066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22069 ?auto_22064 ?auto_22065 )
      ( MAKE-4PILE ?auto_22064 ?auto_22065 ?auto_22066 ?auto_22067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22070 - BLOCK
      ?auto_22071 - BLOCK
      ?auto_22072 - BLOCK
      ?auto_22073 - BLOCK
    )
    :vars
    (
      ?auto_22075 - BLOCK
      ?auto_22074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22072 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22075 ) ) ( not ( = ?auto_22071 ?auto_22075 ) ) ( not ( = ?auto_22072 ?auto_22075 ) ) ( not ( = ?auto_22073 ?auto_22075 ) ) ( ON-TABLE ?auto_22075 ) ( ON ?auto_22070 ?auto_22074 ) ( not ( = ?auto_22070 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( not ( = ?auto_22072 ?auto_22074 ) ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( not ( = ?auto_22075 ?auto_22074 ) ) ( ON ?auto_22071 ?auto_22070 ) ( ON-TABLE ?auto_22074 ) ( ON ?auto_22072 ?auto_22071 ) ( CLEAR ?auto_22072 ) ( HOLDING ?auto_22073 ) ( CLEAR ?auto_22075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22075 ?auto_22073 )
      ( MAKE-4PILE ?auto_22070 ?auto_22071 ?auto_22072 ?auto_22073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22076 - BLOCK
      ?auto_22077 - BLOCK
      ?auto_22078 - BLOCK
      ?auto_22079 - BLOCK
    )
    :vars
    (
      ?auto_22080 - BLOCK
      ?auto_22081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22076 ?auto_22077 ) ) ( not ( = ?auto_22076 ?auto_22078 ) ) ( not ( = ?auto_22076 ?auto_22079 ) ) ( not ( = ?auto_22077 ?auto_22078 ) ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22076 ?auto_22080 ) ) ( not ( = ?auto_22077 ?auto_22080 ) ) ( not ( = ?auto_22078 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( ON-TABLE ?auto_22080 ) ( ON ?auto_22076 ?auto_22081 ) ( not ( = ?auto_22076 ?auto_22081 ) ) ( not ( = ?auto_22077 ?auto_22081 ) ) ( not ( = ?auto_22078 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( ON ?auto_22077 ?auto_22076 ) ( ON-TABLE ?auto_22081 ) ( ON ?auto_22078 ?auto_22077 ) ( CLEAR ?auto_22080 ) ( ON ?auto_22079 ?auto_22078 ) ( CLEAR ?auto_22079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22081 ?auto_22076 ?auto_22077 ?auto_22078 )
      ( MAKE-4PILE ?auto_22076 ?auto_22077 ?auto_22078 ?auto_22079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22082 - BLOCK
      ?auto_22083 - BLOCK
      ?auto_22084 - BLOCK
      ?auto_22085 - BLOCK
    )
    :vars
    (
      ?auto_22086 - BLOCK
      ?auto_22087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22082 ?auto_22083 ) ) ( not ( = ?auto_22082 ?auto_22084 ) ) ( not ( = ?auto_22082 ?auto_22085 ) ) ( not ( = ?auto_22083 ?auto_22084 ) ) ( not ( = ?auto_22083 ?auto_22085 ) ) ( not ( = ?auto_22084 ?auto_22085 ) ) ( not ( = ?auto_22082 ?auto_22086 ) ) ( not ( = ?auto_22083 ?auto_22086 ) ) ( not ( = ?auto_22084 ?auto_22086 ) ) ( not ( = ?auto_22085 ?auto_22086 ) ) ( ON ?auto_22082 ?auto_22087 ) ( not ( = ?auto_22082 ?auto_22087 ) ) ( not ( = ?auto_22083 ?auto_22087 ) ) ( not ( = ?auto_22084 ?auto_22087 ) ) ( not ( = ?auto_22085 ?auto_22087 ) ) ( not ( = ?auto_22086 ?auto_22087 ) ) ( ON ?auto_22083 ?auto_22082 ) ( ON-TABLE ?auto_22087 ) ( ON ?auto_22084 ?auto_22083 ) ( ON ?auto_22085 ?auto_22084 ) ( CLEAR ?auto_22085 ) ( HOLDING ?auto_22086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22086 )
      ( MAKE-4PILE ?auto_22082 ?auto_22083 ?auto_22084 ?auto_22085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22088 - BLOCK
      ?auto_22089 - BLOCK
      ?auto_22090 - BLOCK
      ?auto_22091 - BLOCK
    )
    :vars
    (
      ?auto_22092 - BLOCK
      ?auto_22093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22088 ?auto_22090 ) ) ( not ( = ?auto_22088 ?auto_22091 ) ) ( not ( = ?auto_22089 ?auto_22090 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22088 ?auto_22092 ) ) ( not ( = ?auto_22089 ?auto_22092 ) ) ( not ( = ?auto_22090 ?auto_22092 ) ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( ON ?auto_22088 ?auto_22093 ) ( not ( = ?auto_22088 ?auto_22093 ) ) ( not ( = ?auto_22089 ?auto_22093 ) ) ( not ( = ?auto_22090 ?auto_22093 ) ) ( not ( = ?auto_22091 ?auto_22093 ) ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( ON ?auto_22089 ?auto_22088 ) ( ON-TABLE ?auto_22093 ) ( ON ?auto_22090 ?auto_22089 ) ( ON ?auto_22091 ?auto_22090 ) ( ON ?auto_22092 ?auto_22091 ) ( CLEAR ?auto_22092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22093 ?auto_22088 ?auto_22089 ?auto_22090 ?auto_22091 )
      ( MAKE-4PILE ?auto_22088 ?auto_22089 ?auto_22090 ?auto_22091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22099 - BLOCK
      ?auto_22100 - BLOCK
      ?auto_22101 - BLOCK
      ?auto_22102 - BLOCK
      ?auto_22103 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_22103 ) ( CLEAR ?auto_22102 ) ( ON-TABLE ?auto_22099 ) ( ON ?auto_22100 ?auto_22099 ) ( ON ?auto_22101 ?auto_22100 ) ( ON ?auto_22102 ?auto_22101 ) ( not ( = ?auto_22099 ?auto_22100 ) ) ( not ( = ?auto_22099 ?auto_22101 ) ) ( not ( = ?auto_22099 ?auto_22102 ) ) ( not ( = ?auto_22099 ?auto_22103 ) ) ( not ( = ?auto_22100 ?auto_22101 ) ) ( not ( = ?auto_22100 ?auto_22102 ) ) ( not ( = ?auto_22100 ?auto_22103 ) ) ( not ( = ?auto_22101 ?auto_22102 ) ) ( not ( = ?auto_22101 ?auto_22103 ) ) ( not ( = ?auto_22102 ?auto_22103 ) ) )
    :subtasks
    ( ( !STACK ?auto_22103 ?auto_22102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22104 - BLOCK
      ?auto_22105 - BLOCK
      ?auto_22106 - BLOCK
      ?auto_22107 - BLOCK
      ?auto_22108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22107 ) ( ON-TABLE ?auto_22104 ) ( ON ?auto_22105 ?auto_22104 ) ( ON ?auto_22106 ?auto_22105 ) ( ON ?auto_22107 ?auto_22106 ) ( not ( = ?auto_22104 ?auto_22105 ) ) ( not ( = ?auto_22104 ?auto_22106 ) ) ( not ( = ?auto_22104 ?auto_22107 ) ) ( not ( = ?auto_22104 ?auto_22108 ) ) ( not ( = ?auto_22105 ?auto_22106 ) ) ( not ( = ?auto_22105 ?auto_22107 ) ) ( not ( = ?auto_22105 ?auto_22108 ) ) ( not ( = ?auto_22106 ?auto_22107 ) ) ( not ( = ?auto_22106 ?auto_22108 ) ) ( not ( = ?auto_22107 ?auto_22108 ) ) ( ON-TABLE ?auto_22108 ) ( CLEAR ?auto_22108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_22108 )
      ( MAKE-5PILE ?auto_22104 ?auto_22105 ?auto_22106 ?auto_22107 ?auto_22108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22109 - BLOCK
      ?auto_22110 - BLOCK
      ?auto_22111 - BLOCK
      ?auto_22112 - BLOCK
      ?auto_22113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22109 ) ( ON ?auto_22110 ?auto_22109 ) ( ON ?auto_22111 ?auto_22110 ) ( not ( = ?auto_22109 ?auto_22110 ) ) ( not ( = ?auto_22109 ?auto_22111 ) ) ( not ( = ?auto_22109 ?auto_22112 ) ) ( not ( = ?auto_22109 ?auto_22113 ) ) ( not ( = ?auto_22110 ?auto_22111 ) ) ( not ( = ?auto_22110 ?auto_22112 ) ) ( not ( = ?auto_22110 ?auto_22113 ) ) ( not ( = ?auto_22111 ?auto_22112 ) ) ( not ( = ?auto_22111 ?auto_22113 ) ) ( not ( = ?auto_22112 ?auto_22113 ) ) ( ON-TABLE ?auto_22113 ) ( CLEAR ?auto_22113 ) ( HOLDING ?auto_22112 ) ( CLEAR ?auto_22111 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22109 ?auto_22110 ?auto_22111 ?auto_22112 )
      ( MAKE-5PILE ?auto_22109 ?auto_22110 ?auto_22111 ?auto_22112 ?auto_22113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22114 - BLOCK
      ?auto_22115 - BLOCK
      ?auto_22116 - BLOCK
      ?auto_22117 - BLOCK
      ?auto_22118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22114 ) ( ON ?auto_22115 ?auto_22114 ) ( ON ?auto_22116 ?auto_22115 ) ( not ( = ?auto_22114 ?auto_22115 ) ) ( not ( = ?auto_22114 ?auto_22116 ) ) ( not ( = ?auto_22114 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22118 ) ) ( not ( = ?auto_22115 ?auto_22116 ) ) ( not ( = ?auto_22115 ?auto_22117 ) ) ( not ( = ?auto_22115 ?auto_22118 ) ) ( not ( = ?auto_22116 ?auto_22117 ) ) ( not ( = ?auto_22116 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( ON-TABLE ?auto_22118 ) ( CLEAR ?auto_22116 ) ( ON ?auto_22117 ?auto_22118 ) ( CLEAR ?auto_22117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22118 )
      ( MAKE-5PILE ?auto_22114 ?auto_22115 ?auto_22116 ?auto_22117 ?auto_22118 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22119 - BLOCK
      ?auto_22120 - BLOCK
      ?auto_22121 - BLOCK
      ?auto_22122 - BLOCK
      ?auto_22123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22119 ) ( ON ?auto_22120 ?auto_22119 ) ( not ( = ?auto_22119 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) ( not ( = ?auto_22119 ?auto_22122 ) ) ( not ( = ?auto_22119 ?auto_22123 ) ) ( not ( = ?auto_22120 ?auto_22121 ) ) ( not ( = ?auto_22120 ?auto_22122 ) ) ( not ( = ?auto_22120 ?auto_22123 ) ) ( not ( = ?auto_22121 ?auto_22122 ) ) ( not ( = ?auto_22121 ?auto_22123 ) ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( ON-TABLE ?auto_22123 ) ( ON ?auto_22122 ?auto_22123 ) ( CLEAR ?auto_22122 ) ( HOLDING ?auto_22121 ) ( CLEAR ?auto_22120 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22119 ?auto_22120 ?auto_22121 )
      ( MAKE-5PILE ?auto_22119 ?auto_22120 ?auto_22121 ?auto_22122 ?auto_22123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22124 - BLOCK
      ?auto_22125 - BLOCK
      ?auto_22126 - BLOCK
      ?auto_22127 - BLOCK
      ?auto_22128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22124 ) ( ON ?auto_22125 ?auto_22124 ) ( not ( = ?auto_22124 ?auto_22125 ) ) ( not ( = ?auto_22124 ?auto_22126 ) ) ( not ( = ?auto_22124 ?auto_22127 ) ) ( not ( = ?auto_22124 ?auto_22128 ) ) ( not ( = ?auto_22125 ?auto_22126 ) ) ( not ( = ?auto_22125 ?auto_22127 ) ) ( not ( = ?auto_22125 ?auto_22128 ) ) ( not ( = ?auto_22126 ?auto_22127 ) ) ( not ( = ?auto_22126 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( ON-TABLE ?auto_22128 ) ( ON ?auto_22127 ?auto_22128 ) ( CLEAR ?auto_22125 ) ( ON ?auto_22126 ?auto_22127 ) ( CLEAR ?auto_22126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22128 ?auto_22127 )
      ( MAKE-5PILE ?auto_22124 ?auto_22125 ?auto_22126 ?auto_22127 ?auto_22128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22129 - BLOCK
      ?auto_22130 - BLOCK
      ?auto_22131 - BLOCK
      ?auto_22132 - BLOCK
      ?auto_22133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22129 ) ( not ( = ?auto_22129 ?auto_22130 ) ) ( not ( = ?auto_22129 ?auto_22131 ) ) ( not ( = ?auto_22129 ?auto_22132 ) ) ( not ( = ?auto_22129 ?auto_22133 ) ) ( not ( = ?auto_22130 ?auto_22131 ) ) ( not ( = ?auto_22130 ?auto_22132 ) ) ( not ( = ?auto_22130 ?auto_22133 ) ) ( not ( = ?auto_22131 ?auto_22132 ) ) ( not ( = ?auto_22131 ?auto_22133 ) ) ( not ( = ?auto_22132 ?auto_22133 ) ) ( ON-TABLE ?auto_22133 ) ( ON ?auto_22132 ?auto_22133 ) ( ON ?auto_22131 ?auto_22132 ) ( CLEAR ?auto_22131 ) ( HOLDING ?auto_22130 ) ( CLEAR ?auto_22129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22129 ?auto_22130 )
      ( MAKE-5PILE ?auto_22129 ?auto_22130 ?auto_22131 ?auto_22132 ?auto_22133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22134 - BLOCK
      ?auto_22135 - BLOCK
      ?auto_22136 - BLOCK
      ?auto_22137 - BLOCK
      ?auto_22138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22134 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22136 ) ) ( not ( = ?auto_22134 ?auto_22137 ) ) ( not ( = ?auto_22134 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( ON-TABLE ?auto_22138 ) ( ON ?auto_22137 ?auto_22138 ) ( ON ?auto_22136 ?auto_22137 ) ( CLEAR ?auto_22134 ) ( ON ?auto_22135 ?auto_22136 ) ( CLEAR ?auto_22135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22138 ?auto_22137 ?auto_22136 )
      ( MAKE-5PILE ?auto_22134 ?auto_22135 ?auto_22136 ?auto_22137 ?auto_22138 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22139 - BLOCK
      ?auto_22140 - BLOCK
      ?auto_22141 - BLOCK
      ?auto_22142 - BLOCK
      ?auto_22143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22139 ?auto_22140 ) ) ( not ( = ?auto_22139 ?auto_22141 ) ) ( not ( = ?auto_22139 ?auto_22142 ) ) ( not ( = ?auto_22139 ?auto_22143 ) ) ( not ( = ?auto_22140 ?auto_22141 ) ) ( not ( = ?auto_22140 ?auto_22142 ) ) ( not ( = ?auto_22140 ?auto_22143 ) ) ( not ( = ?auto_22141 ?auto_22142 ) ) ( not ( = ?auto_22141 ?auto_22143 ) ) ( not ( = ?auto_22142 ?auto_22143 ) ) ( ON-TABLE ?auto_22143 ) ( ON ?auto_22142 ?auto_22143 ) ( ON ?auto_22141 ?auto_22142 ) ( ON ?auto_22140 ?auto_22141 ) ( CLEAR ?auto_22140 ) ( HOLDING ?auto_22139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22139 )
      ( MAKE-5PILE ?auto_22139 ?auto_22140 ?auto_22141 ?auto_22142 ?auto_22143 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22144 - BLOCK
      ?auto_22145 - BLOCK
      ?auto_22146 - BLOCK
      ?auto_22147 - BLOCK
      ?auto_22148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22144 ?auto_22145 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22147 ) ) ( not ( = ?auto_22144 ?auto_22148 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22148 ) ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22146 ?auto_22148 ) ) ( not ( = ?auto_22147 ?auto_22148 ) ) ( ON-TABLE ?auto_22148 ) ( ON ?auto_22147 ?auto_22148 ) ( ON ?auto_22146 ?auto_22147 ) ( ON ?auto_22145 ?auto_22146 ) ( ON ?auto_22144 ?auto_22145 ) ( CLEAR ?auto_22144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22148 ?auto_22147 ?auto_22146 ?auto_22145 )
      ( MAKE-5PILE ?auto_22144 ?auto_22145 ?auto_22146 ?auto_22147 ?auto_22148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22149 - BLOCK
      ?auto_22150 - BLOCK
      ?auto_22151 - BLOCK
      ?auto_22152 - BLOCK
      ?auto_22153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22149 ?auto_22150 ) ) ( not ( = ?auto_22149 ?auto_22151 ) ) ( not ( = ?auto_22149 ?auto_22152 ) ) ( not ( = ?auto_22149 ?auto_22153 ) ) ( not ( = ?auto_22150 ?auto_22151 ) ) ( not ( = ?auto_22150 ?auto_22152 ) ) ( not ( = ?auto_22150 ?auto_22153 ) ) ( not ( = ?auto_22151 ?auto_22152 ) ) ( not ( = ?auto_22151 ?auto_22153 ) ) ( not ( = ?auto_22152 ?auto_22153 ) ) ( ON-TABLE ?auto_22153 ) ( ON ?auto_22152 ?auto_22153 ) ( ON ?auto_22151 ?auto_22152 ) ( ON ?auto_22150 ?auto_22151 ) ( HOLDING ?auto_22149 ) ( CLEAR ?auto_22150 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22153 ?auto_22152 ?auto_22151 ?auto_22150 ?auto_22149 )
      ( MAKE-5PILE ?auto_22149 ?auto_22150 ?auto_22151 ?auto_22152 ?auto_22153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22154 - BLOCK
      ?auto_22155 - BLOCK
      ?auto_22156 - BLOCK
      ?auto_22157 - BLOCK
      ?auto_22158 - BLOCK
    )
    :vars
    (
      ?auto_22159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22154 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22156 ) ) ( not ( = ?auto_22154 ?auto_22157 ) ) ( not ( = ?auto_22154 ?auto_22158 ) ) ( not ( = ?auto_22155 ?auto_22156 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( not ( = ?auto_22155 ?auto_22158 ) ) ( not ( = ?auto_22156 ?auto_22157 ) ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( not ( = ?auto_22157 ?auto_22158 ) ) ( ON-TABLE ?auto_22158 ) ( ON ?auto_22157 ?auto_22158 ) ( ON ?auto_22156 ?auto_22157 ) ( ON ?auto_22155 ?auto_22156 ) ( CLEAR ?auto_22155 ) ( ON ?auto_22154 ?auto_22159 ) ( CLEAR ?auto_22154 ) ( HAND-EMPTY ) ( not ( = ?auto_22154 ?auto_22159 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22157 ?auto_22159 ) ) ( not ( = ?auto_22158 ?auto_22159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22154 ?auto_22159 )
      ( MAKE-5PILE ?auto_22154 ?auto_22155 ?auto_22156 ?auto_22157 ?auto_22158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22160 - BLOCK
      ?auto_22161 - BLOCK
      ?auto_22162 - BLOCK
      ?auto_22163 - BLOCK
      ?auto_22164 - BLOCK
    )
    :vars
    (
      ?auto_22165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22160 ?auto_22161 ) ) ( not ( = ?auto_22160 ?auto_22162 ) ) ( not ( = ?auto_22160 ?auto_22163 ) ) ( not ( = ?auto_22160 ?auto_22164 ) ) ( not ( = ?auto_22161 ?auto_22162 ) ) ( not ( = ?auto_22161 ?auto_22163 ) ) ( not ( = ?auto_22161 ?auto_22164 ) ) ( not ( = ?auto_22162 ?auto_22163 ) ) ( not ( = ?auto_22162 ?auto_22164 ) ) ( not ( = ?auto_22163 ?auto_22164 ) ) ( ON-TABLE ?auto_22164 ) ( ON ?auto_22163 ?auto_22164 ) ( ON ?auto_22162 ?auto_22163 ) ( ON ?auto_22160 ?auto_22165 ) ( CLEAR ?auto_22160 ) ( not ( = ?auto_22160 ?auto_22165 ) ) ( not ( = ?auto_22161 ?auto_22165 ) ) ( not ( = ?auto_22162 ?auto_22165 ) ) ( not ( = ?auto_22163 ?auto_22165 ) ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( HOLDING ?auto_22161 ) ( CLEAR ?auto_22162 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22164 ?auto_22163 ?auto_22162 ?auto_22161 )
      ( MAKE-5PILE ?auto_22160 ?auto_22161 ?auto_22162 ?auto_22163 ?auto_22164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22166 - BLOCK
      ?auto_22167 - BLOCK
      ?auto_22168 - BLOCK
      ?auto_22169 - BLOCK
      ?auto_22170 - BLOCK
    )
    :vars
    (
      ?auto_22171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22166 ?auto_22167 ) ) ( not ( = ?auto_22166 ?auto_22168 ) ) ( not ( = ?auto_22166 ?auto_22169 ) ) ( not ( = ?auto_22166 ?auto_22170 ) ) ( not ( = ?auto_22167 ?auto_22168 ) ) ( not ( = ?auto_22167 ?auto_22169 ) ) ( not ( = ?auto_22167 ?auto_22170 ) ) ( not ( = ?auto_22168 ?auto_22169 ) ) ( not ( = ?auto_22168 ?auto_22170 ) ) ( not ( = ?auto_22169 ?auto_22170 ) ) ( ON-TABLE ?auto_22170 ) ( ON ?auto_22169 ?auto_22170 ) ( ON ?auto_22168 ?auto_22169 ) ( ON ?auto_22166 ?auto_22171 ) ( not ( = ?auto_22166 ?auto_22171 ) ) ( not ( = ?auto_22167 ?auto_22171 ) ) ( not ( = ?auto_22168 ?auto_22171 ) ) ( not ( = ?auto_22169 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( CLEAR ?auto_22168 ) ( ON ?auto_22167 ?auto_22166 ) ( CLEAR ?auto_22167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22171 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22171 ?auto_22166 )
      ( MAKE-5PILE ?auto_22166 ?auto_22167 ?auto_22168 ?auto_22169 ?auto_22170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22172 - BLOCK
      ?auto_22173 - BLOCK
      ?auto_22174 - BLOCK
      ?auto_22175 - BLOCK
      ?auto_22176 - BLOCK
    )
    :vars
    (
      ?auto_22177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22175 ) ) ( not ( = ?auto_22172 ?auto_22176 ) ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( not ( = ?auto_22173 ?auto_22175 ) ) ( not ( = ?auto_22173 ?auto_22176 ) ) ( not ( = ?auto_22174 ?auto_22175 ) ) ( not ( = ?auto_22174 ?auto_22176 ) ) ( not ( = ?auto_22175 ?auto_22176 ) ) ( ON-TABLE ?auto_22176 ) ( ON ?auto_22175 ?auto_22176 ) ( ON ?auto_22172 ?auto_22177 ) ( not ( = ?auto_22172 ?auto_22177 ) ) ( not ( = ?auto_22173 ?auto_22177 ) ) ( not ( = ?auto_22174 ?auto_22177 ) ) ( not ( = ?auto_22175 ?auto_22177 ) ) ( not ( = ?auto_22176 ?auto_22177 ) ) ( ON ?auto_22173 ?auto_22172 ) ( CLEAR ?auto_22173 ) ( ON-TABLE ?auto_22177 ) ( HOLDING ?auto_22174 ) ( CLEAR ?auto_22175 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22176 ?auto_22175 ?auto_22174 )
      ( MAKE-5PILE ?auto_22172 ?auto_22173 ?auto_22174 ?auto_22175 ?auto_22176 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22178 - BLOCK
      ?auto_22179 - BLOCK
      ?auto_22180 - BLOCK
      ?auto_22181 - BLOCK
      ?auto_22182 - BLOCK
    )
    :vars
    (
      ?auto_22183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22178 ?auto_22179 ) ) ( not ( = ?auto_22178 ?auto_22180 ) ) ( not ( = ?auto_22178 ?auto_22181 ) ) ( not ( = ?auto_22178 ?auto_22182 ) ) ( not ( = ?auto_22179 ?auto_22180 ) ) ( not ( = ?auto_22179 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22182 ) ) ( not ( = ?auto_22180 ?auto_22181 ) ) ( not ( = ?auto_22180 ?auto_22182 ) ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( ON-TABLE ?auto_22182 ) ( ON ?auto_22181 ?auto_22182 ) ( ON ?auto_22178 ?auto_22183 ) ( not ( = ?auto_22178 ?auto_22183 ) ) ( not ( = ?auto_22179 ?auto_22183 ) ) ( not ( = ?auto_22180 ?auto_22183 ) ) ( not ( = ?auto_22181 ?auto_22183 ) ) ( not ( = ?auto_22182 ?auto_22183 ) ) ( ON ?auto_22179 ?auto_22178 ) ( ON-TABLE ?auto_22183 ) ( CLEAR ?auto_22181 ) ( ON ?auto_22180 ?auto_22179 ) ( CLEAR ?auto_22180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22183 ?auto_22178 ?auto_22179 )
      ( MAKE-5PILE ?auto_22178 ?auto_22179 ?auto_22180 ?auto_22181 ?auto_22182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22184 - BLOCK
      ?auto_22185 - BLOCK
      ?auto_22186 - BLOCK
      ?auto_22187 - BLOCK
      ?auto_22188 - BLOCK
    )
    :vars
    (
      ?auto_22189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22184 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( not ( = ?auto_22184 ?auto_22187 ) ) ( not ( = ?auto_22184 ?auto_22188 ) ) ( not ( = ?auto_22185 ?auto_22186 ) ) ( not ( = ?auto_22185 ?auto_22187 ) ) ( not ( = ?auto_22185 ?auto_22188 ) ) ( not ( = ?auto_22186 ?auto_22187 ) ) ( not ( = ?auto_22186 ?auto_22188 ) ) ( not ( = ?auto_22187 ?auto_22188 ) ) ( ON-TABLE ?auto_22188 ) ( ON ?auto_22184 ?auto_22189 ) ( not ( = ?auto_22184 ?auto_22189 ) ) ( not ( = ?auto_22185 ?auto_22189 ) ) ( not ( = ?auto_22186 ?auto_22189 ) ) ( not ( = ?auto_22187 ?auto_22189 ) ) ( not ( = ?auto_22188 ?auto_22189 ) ) ( ON ?auto_22185 ?auto_22184 ) ( ON-TABLE ?auto_22189 ) ( ON ?auto_22186 ?auto_22185 ) ( CLEAR ?auto_22186 ) ( HOLDING ?auto_22187 ) ( CLEAR ?auto_22188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22188 ?auto_22187 )
      ( MAKE-5PILE ?auto_22184 ?auto_22185 ?auto_22186 ?auto_22187 ?auto_22188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22190 - BLOCK
      ?auto_22191 - BLOCK
      ?auto_22192 - BLOCK
      ?auto_22193 - BLOCK
      ?auto_22194 - BLOCK
    )
    :vars
    (
      ?auto_22195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22190 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( not ( = ?auto_22190 ?auto_22193 ) ) ( not ( = ?auto_22190 ?auto_22194 ) ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22193 ) ) ( not ( = ?auto_22191 ?auto_22194 ) ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( not ( = ?auto_22192 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22194 ) ) ( ON-TABLE ?auto_22194 ) ( ON ?auto_22190 ?auto_22195 ) ( not ( = ?auto_22190 ?auto_22195 ) ) ( not ( = ?auto_22191 ?auto_22195 ) ) ( not ( = ?auto_22192 ?auto_22195 ) ) ( not ( = ?auto_22193 ?auto_22195 ) ) ( not ( = ?auto_22194 ?auto_22195 ) ) ( ON ?auto_22191 ?auto_22190 ) ( ON-TABLE ?auto_22195 ) ( ON ?auto_22192 ?auto_22191 ) ( CLEAR ?auto_22194 ) ( ON ?auto_22193 ?auto_22192 ) ( CLEAR ?auto_22193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22195 ?auto_22190 ?auto_22191 ?auto_22192 )
      ( MAKE-5PILE ?auto_22190 ?auto_22191 ?auto_22192 ?auto_22193 ?auto_22194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22196 - BLOCK
      ?auto_22197 - BLOCK
      ?auto_22198 - BLOCK
      ?auto_22199 - BLOCK
      ?auto_22200 - BLOCK
    )
    :vars
    (
      ?auto_22201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22196 ?auto_22197 ) ) ( not ( = ?auto_22196 ?auto_22198 ) ) ( not ( = ?auto_22196 ?auto_22199 ) ) ( not ( = ?auto_22196 ?auto_22200 ) ) ( not ( = ?auto_22197 ?auto_22198 ) ) ( not ( = ?auto_22197 ?auto_22199 ) ) ( not ( = ?auto_22197 ?auto_22200 ) ) ( not ( = ?auto_22198 ?auto_22199 ) ) ( not ( = ?auto_22198 ?auto_22200 ) ) ( not ( = ?auto_22199 ?auto_22200 ) ) ( ON ?auto_22196 ?auto_22201 ) ( not ( = ?auto_22196 ?auto_22201 ) ) ( not ( = ?auto_22197 ?auto_22201 ) ) ( not ( = ?auto_22198 ?auto_22201 ) ) ( not ( = ?auto_22199 ?auto_22201 ) ) ( not ( = ?auto_22200 ?auto_22201 ) ) ( ON ?auto_22197 ?auto_22196 ) ( ON-TABLE ?auto_22201 ) ( ON ?auto_22198 ?auto_22197 ) ( ON ?auto_22199 ?auto_22198 ) ( CLEAR ?auto_22199 ) ( HOLDING ?auto_22200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22200 )
      ( MAKE-5PILE ?auto_22196 ?auto_22197 ?auto_22198 ?auto_22199 ?auto_22200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22202 - BLOCK
      ?auto_22203 - BLOCK
      ?auto_22204 - BLOCK
      ?auto_22205 - BLOCK
      ?auto_22206 - BLOCK
    )
    :vars
    (
      ?auto_22207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( ON ?auto_22202 ?auto_22207 ) ( not ( = ?auto_22202 ?auto_22207 ) ) ( not ( = ?auto_22203 ?auto_22207 ) ) ( not ( = ?auto_22204 ?auto_22207 ) ) ( not ( = ?auto_22205 ?auto_22207 ) ) ( not ( = ?auto_22206 ?auto_22207 ) ) ( ON ?auto_22203 ?auto_22202 ) ( ON-TABLE ?auto_22207 ) ( ON ?auto_22204 ?auto_22203 ) ( ON ?auto_22205 ?auto_22204 ) ( ON ?auto_22206 ?auto_22205 ) ( CLEAR ?auto_22206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22207 ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 )
      ( MAKE-5PILE ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ) )
  )

)

