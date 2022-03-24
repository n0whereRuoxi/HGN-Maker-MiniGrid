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
      ?auto_17062 - BLOCK
    )
    :vars
    (
      ?auto_17063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17062 ?auto_17063 ) ( CLEAR ?auto_17062 ) ( HAND-EMPTY ) ( not ( = ?auto_17062 ?auto_17063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17062 ?auto_17063 )
      ( !PUTDOWN ?auto_17062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17065 - BLOCK
    )
    :vars
    (
      ?auto_17066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17065 ?auto_17066 ) ( CLEAR ?auto_17065 ) ( HAND-EMPTY ) ( not ( = ?auto_17065 ?auto_17066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17065 ?auto_17066 )
      ( !PUTDOWN ?auto_17065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17069 - BLOCK
      ?auto_17070 - BLOCK
    )
    :vars
    (
      ?auto_17071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17069 ) ( ON ?auto_17070 ?auto_17071 ) ( CLEAR ?auto_17070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17069 ) ( not ( = ?auto_17069 ?auto_17070 ) ) ( not ( = ?auto_17069 ?auto_17071 ) ) ( not ( = ?auto_17070 ?auto_17071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17070 ?auto_17071 )
      ( !STACK ?auto_17070 ?auto_17069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17074 - BLOCK
      ?auto_17075 - BLOCK
    )
    :vars
    (
      ?auto_17076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17074 ) ( ON ?auto_17075 ?auto_17076 ) ( CLEAR ?auto_17075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17074 ) ( not ( = ?auto_17074 ?auto_17075 ) ) ( not ( = ?auto_17074 ?auto_17076 ) ) ( not ( = ?auto_17075 ?auto_17076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17075 ?auto_17076 )
      ( !STACK ?auto_17075 ?auto_17074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17079 - BLOCK
      ?auto_17080 - BLOCK
    )
    :vars
    (
      ?auto_17081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17080 ?auto_17081 ) ( not ( = ?auto_17079 ?auto_17080 ) ) ( not ( = ?auto_17079 ?auto_17081 ) ) ( not ( = ?auto_17080 ?auto_17081 ) ) ( ON ?auto_17079 ?auto_17080 ) ( CLEAR ?auto_17079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17079 )
      ( MAKE-2PILE ?auto_17079 ?auto_17080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17084 - BLOCK
      ?auto_17085 - BLOCK
    )
    :vars
    (
      ?auto_17086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17085 ?auto_17086 ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17084 ?auto_17086 ) ) ( not ( = ?auto_17085 ?auto_17086 ) ) ( ON ?auto_17084 ?auto_17085 ) ( CLEAR ?auto_17084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17084 )
      ( MAKE-2PILE ?auto_17084 ?auto_17085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17090 - BLOCK
      ?auto_17091 - BLOCK
      ?auto_17092 - BLOCK
    )
    :vars
    (
      ?auto_17093 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17091 ) ( ON ?auto_17092 ?auto_17093 ) ( CLEAR ?auto_17092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17090 ) ( ON ?auto_17091 ?auto_17090 ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17093 ) ) ( not ( = ?auto_17091 ?auto_17092 ) ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17092 ?auto_17093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17092 ?auto_17093 )
      ( !STACK ?auto_17092 ?auto_17091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17097 - BLOCK
      ?auto_17098 - BLOCK
      ?auto_17099 - BLOCK
    )
    :vars
    (
      ?auto_17100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17098 ) ( ON ?auto_17099 ?auto_17100 ) ( CLEAR ?auto_17099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17097 ) ( ON ?auto_17098 ?auto_17097 ) ( not ( = ?auto_17097 ?auto_17098 ) ) ( not ( = ?auto_17097 ?auto_17099 ) ) ( not ( = ?auto_17097 ?auto_17100 ) ) ( not ( = ?auto_17098 ?auto_17099 ) ) ( not ( = ?auto_17098 ?auto_17100 ) ) ( not ( = ?auto_17099 ?auto_17100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17099 ?auto_17100 )
      ( !STACK ?auto_17099 ?auto_17098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17104 - BLOCK
      ?auto_17105 - BLOCK
      ?auto_17106 - BLOCK
    )
    :vars
    (
      ?auto_17107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17106 ?auto_17107 ) ( ON-TABLE ?auto_17104 ) ( not ( = ?auto_17104 ?auto_17105 ) ) ( not ( = ?auto_17104 ?auto_17106 ) ) ( not ( = ?auto_17104 ?auto_17107 ) ) ( not ( = ?auto_17105 ?auto_17106 ) ) ( not ( = ?auto_17105 ?auto_17107 ) ) ( not ( = ?auto_17106 ?auto_17107 ) ) ( CLEAR ?auto_17104 ) ( ON ?auto_17105 ?auto_17106 ) ( CLEAR ?auto_17105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17104 ?auto_17105 )
      ( MAKE-3PILE ?auto_17104 ?auto_17105 ?auto_17106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17111 - BLOCK
      ?auto_17112 - BLOCK
      ?auto_17113 - BLOCK
    )
    :vars
    (
      ?auto_17114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17113 ?auto_17114 ) ( ON-TABLE ?auto_17111 ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17113 ) ) ( not ( = ?auto_17111 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17114 ) ) ( not ( = ?auto_17113 ?auto_17114 ) ) ( CLEAR ?auto_17111 ) ( ON ?auto_17112 ?auto_17113 ) ( CLEAR ?auto_17112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17111 ?auto_17112 )
      ( MAKE-3PILE ?auto_17111 ?auto_17112 ?auto_17113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17118 - BLOCK
      ?auto_17119 - BLOCK
      ?auto_17120 - BLOCK
    )
    :vars
    (
      ?auto_17121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17120 ?auto_17121 ) ( not ( = ?auto_17118 ?auto_17119 ) ) ( not ( = ?auto_17118 ?auto_17120 ) ) ( not ( = ?auto_17118 ?auto_17121 ) ) ( not ( = ?auto_17119 ?auto_17120 ) ) ( not ( = ?auto_17119 ?auto_17121 ) ) ( not ( = ?auto_17120 ?auto_17121 ) ) ( ON ?auto_17119 ?auto_17120 ) ( ON ?auto_17118 ?auto_17119 ) ( CLEAR ?auto_17118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17118 )
      ( MAKE-3PILE ?auto_17118 ?auto_17119 ?auto_17120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17125 - BLOCK
      ?auto_17126 - BLOCK
      ?auto_17127 - BLOCK
    )
    :vars
    (
      ?auto_17128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17127 ?auto_17128 ) ( not ( = ?auto_17125 ?auto_17126 ) ) ( not ( = ?auto_17125 ?auto_17127 ) ) ( not ( = ?auto_17125 ?auto_17128 ) ) ( not ( = ?auto_17126 ?auto_17127 ) ) ( not ( = ?auto_17126 ?auto_17128 ) ) ( not ( = ?auto_17127 ?auto_17128 ) ) ( ON ?auto_17126 ?auto_17127 ) ( ON ?auto_17125 ?auto_17126 ) ( CLEAR ?auto_17125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17125 )
      ( MAKE-3PILE ?auto_17125 ?auto_17126 ?auto_17127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17133 - BLOCK
      ?auto_17134 - BLOCK
      ?auto_17135 - BLOCK
      ?auto_17136 - BLOCK
    )
    :vars
    (
      ?auto_17137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17135 ) ( ON ?auto_17136 ?auto_17137 ) ( CLEAR ?auto_17136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17133 ) ( ON ?auto_17134 ?auto_17133 ) ( ON ?auto_17135 ?auto_17134 ) ( not ( = ?auto_17133 ?auto_17134 ) ) ( not ( = ?auto_17133 ?auto_17135 ) ) ( not ( = ?auto_17133 ?auto_17136 ) ) ( not ( = ?auto_17133 ?auto_17137 ) ) ( not ( = ?auto_17134 ?auto_17135 ) ) ( not ( = ?auto_17134 ?auto_17136 ) ) ( not ( = ?auto_17134 ?auto_17137 ) ) ( not ( = ?auto_17135 ?auto_17136 ) ) ( not ( = ?auto_17135 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17136 ?auto_17137 )
      ( !STACK ?auto_17136 ?auto_17135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17142 - BLOCK
      ?auto_17143 - BLOCK
      ?auto_17144 - BLOCK
      ?auto_17145 - BLOCK
    )
    :vars
    (
      ?auto_17146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17144 ) ( ON ?auto_17145 ?auto_17146 ) ( CLEAR ?auto_17145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17142 ) ( ON ?auto_17143 ?auto_17142 ) ( ON ?auto_17144 ?auto_17143 ) ( not ( = ?auto_17142 ?auto_17143 ) ) ( not ( = ?auto_17142 ?auto_17144 ) ) ( not ( = ?auto_17142 ?auto_17145 ) ) ( not ( = ?auto_17142 ?auto_17146 ) ) ( not ( = ?auto_17143 ?auto_17144 ) ) ( not ( = ?auto_17143 ?auto_17145 ) ) ( not ( = ?auto_17143 ?auto_17146 ) ) ( not ( = ?auto_17144 ?auto_17145 ) ) ( not ( = ?auto_17144 ?auto_17146 ) ) ( not ( = ?auto_17145 ?auto_17146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17145 ?auto_17146 )
      ( !STACK ?auto_17145 ?auto_17144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17151 - BLOCK
      ?auto_17152 - BLOCK
      ?auto_17153 - BLOCK
      ?auto_17154 - BLOCK
    )
    :vars
    (
      ?auto_17155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17154 ?auto_17155 ) ( ON-TABLE ?auto_17151 ) ( ON ?auto_17152 ?auto_17151 ) ( not ( = ?auto_17151 ?auto_17152 ) ) ( not ( = ?auto_17151 ?auto_17153 ) ) ( not ( = ?auto_17151 ?auto_17154 ) ) ( not ( = ?auto_17151 ?auto_17155 ) ) ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17154 ) ) ( not ( = ?auto_17152 ?auto_17155 ) ) ( not ( = ?auto_17153 ?auto_17154 ) ) ( not ( = ?auto_17153 ?auto_17155 ) ) ( not ( = ?auto_17154 ?auto_17155 ) ) ( CLEAR ?auto_17152 ) ( ON ?auto_17153 ?auto_17154 ) ( CLEAR ?auto_17153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17151 ?auto_17152 ?auto_17153 )
      ( MAKE-4PILE ?auto_17151 ?auto_17152 ?auto_17153 ?auto_17154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17160 - BLOCK
      ?auto_17161 - BLOCK
      ?auto_17162 - BLOCK
      ?auto_17163 - BLOCK
    )
    :vars
    (
      ?auto_17164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17163 ?auto_17164 ) ( ON-TABLE ?auto_17160 ) ( ON ?auto_17161 ?auto_17160 ) ( not ( = ?auto_17160 ?auto_17161 ) ) ( not ( = ?auto_17160 ?auto_17162 ) ) ( not ( = ?auto_17160 ?auto_17163 ) ) ( not ( = ?auto_17160 ?auto_17164 ) ) ( not ( = ?auto_17161 ?auto_17162 ) ) ( not ( = ?auto_17161 ?auto_17163 ) ) ( not ( = ?auto_17161 ?auto_17164 ) ) ( not ( = ?auto_17162 ?auto_17163 ) ) ( not ( = ?auto_17162 ?auto_17164 ) ) ( not ( = ?auto_17163 ?auto_17164 ) ) ( CLEAR ?auto_17161 ) ( ON ?auto_17162 ?auto_17163 ) ( CLEAR ?auto_17162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17160 ?auto_17161 ?auto_17162 )
      ( MAKE-4PILE ?auto_17160 ?auto_17161 ?auto_17162 ?auto_17163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17169 - BLOCK
      ?auto_17170 - BLOCK
      ?auto_17171 - BLOCK
      ?auto_17172 - BLOCK
    )
    :vars
    (
      ?auto_17173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17172 ?auto_17173 ) ( ON-TABLE ?auto_17169 ) ( not ( = ?auto_17169 ?auto_17170 ) ) ( not ( = ?auto_17169 ?auto_17171 ) ) ( not ( = ?auto_17169 ?auto_17172 ) ) ( not ( = ?auto_17169 ?auto_17173 ) ) ( not ( = ?auto_17170 ?auto_17171 ) ) ( not ( = ?auto_17170 ?auto_17172 ) ) ( not ( = ?auto_17170 ?auto_17173 ) ) ( not ( = ?auto_17171 ?auto_17172 ) ) ( not ( = ?auto_17171 ?auto_17173 ) ) ( not ( = ?auto_17172 ?auto_17173 ) ) ( ON ?auto_17171 ?auto_17172 ) ( CLEAR ?auto_17169 ) ( ON ?auto_17170 ?auto_17171 ) ( CLEAR ?auto_17170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17169 ?auto_17170 )
      ( MAKE-4PILE ?auto_17169 ?auto_17170 ?auto_17171 ?auto_17172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17178 - BLOCK
      ?auto_17179 - BLOCK
      ?auto_17180 - BLOCK
      ?auto_17181 - BLOCK
    )
    :vars
    (
      ?auto_17182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17181 ?auto_17182 ) ( ON-TABLE ?auto_17178 ) ( not ( = ?auto_17178 ?auto_17179 ) ) ( not ( = ?auto_17178 ?auto_17180 ) ) ( not ( = ?auto_17178 ?auto_17181 ) ) ( not ( = ?auto_17178 ?auto_17182 ) ) ( not ( = ?auto_17179 ?auto_17180 ) ) ( not ( = ?auto_17179 ?auto_17181 ) ) ( not ( = ?auto_17179 ?auto_17182 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17181 ?auto_17182 ) ) ( ON ?auto_17180 ?auto_17181 ) ( CLEAR ?auto_17178 ) ( ON ?auto_17179 ?auto_17180 ) ( CLEAR ?auto_17179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17178 ?auto_17179 )
      ( MAKE-4PILE ?auto_17178 ?auto_17179 ?auto_17180 ?auto_17181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17187 - BLOCK
      ?auto_17188 - BLOCK
      ?auto_17189 - BLOCK
      ?auto_17190 - BLOCK
    )
    :vars
    (
      ?auto_17191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17190 ?auto_17191 ) ( not ( = ?auto_17187 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17189 ) ) ( not ( = ?auto_17187 ?auto_17190 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) ( not ( = ?auto_17188 ?auto_17189 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17188 ?auto_17191 ) ) ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17191 ) ) ( not ( = ?auto_17190 ?auto_17191 ) ) ( ON ?auto_17189 ?auto_17190 ) ( ON ?auto_17188 ?auto_17189 ) ( ON ?auto_17187 ?auto_17188 ) ( CLEAR ?auto_17187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17187 )
      ( MAKE-4PILE ?auto_17187 ?auto_17188 ?auto_17189 ?auto_17190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17196 - BLOCK
      ?auto_17197 - BLOCK
      ?auto_17198 - BLOCK
      ?auto_17199 - BLOCK
    )
    :vars
    (
      ?auto_17200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17199 ?auto_17200 ) ( not ( = ?auto_17196 ?auto_17197 ) ) ( not ( = ?auto_17196 ?auto_17198 ) ) ( not ( = ?auto_17196 ?auto_17199 ) ) ( not ( = ?auto_17196 ?auto_17200 ) ) ( not ( = ?auto_17197 ?auto_17198 ) ) ( not ( = ?auto_17197 ?auto_17199 ) ) ( not ( = ?auto_17197 ?auto_17200 ) ) ( not ( = ?auto_17198 ?auto_17199 ) ) ( not ( = ?auto_17198 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( ON ?auto_17198 ?auto_17199 ) ( ON ?auto_17197 ?auto_17198 ) ( ON ?auto_17196 ?auto_17197 ) ( CLEAR ?auto_17196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17196 )
      ( MAKE-4PILE ?auto_17196 ?auto_17197 ?auto_17198 ?auto_17199 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17206 - BLOCK
      ?auto_17207 - BLOCK
      ?auto_17208 - BLOCK
      ?auto_17209 - BLOCK
      ?auto_17210 - BLOCK
    )
    :vars
    (
      ?auto_17211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17209 ) ( ON ?auto_17210 ?auto_17211 ) ( CLEAR ?auto_17210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17206 ) ( ON ?auto_17207 ?auto_17206 ) ( ON ?auto_17208 ?auto_17207 ) ( ON ?auto_17209 ?auto_17208 ) ( not ( = ?auto_17206 ?auto_17207 ) ) ( not ( = ?auto_17206 ?auto_17208 ) ) ( not ( = ?auto_17206 ?auto_17209 ) ) ( not ( = ?auto_17206 ?auto_17210 ) ) ( not ( = ?auto_17206 ?auto_17211 ) ) ( not ( = ?auto_17207 ?auto_17208 ) ) ( not ( = ?auto_17207 ?auto_17209 ) ) ( not ( = ?auto_17207 ?auto_17210 ) ) ( not ( = ?auto_17207 ?auto_17211 ) ) ( not ( = ?auto_17208 ?auto_17209 ) ) ( not ( = ?auto_17208 ?auto_17210 ) ) ( not ( = ?auto_17208 ?auto_17211 ) ) ( not ( = ?auto_17209 ?auto_17210 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( not ( = ?auto_17210 ?auto_17211 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17210 ?auto_17211 )
      ( !STACK ?auto_17210 ?auto_17209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17217 - BLOCK
      ?auto_17218 - BLOCK
      ?auto_17219 - BLOCK
      ?auto_17220 - BLOCK
      ?auto_17221 - BLOCK
    )
    :vars
    (
      ?auto_17222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17220 ) ( ON ?auto_17221 ?auto_17222 ) ( CLEAR ?auto_17221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17217 ) ( ON ?auto_17218 ?auto_17217 ) ( ON ?auto_17219 ?auto_17218 ) ( ON ?auto_17220 ?auto_17219 ) ( not ( = ?auto_17217 ?auto_17218 ) ) ( not ( = ?auto_17217 ?auto_17219 ) ) ( not ( = ?auto_17217 ?auto_17220 ) ) ( not ( = ?auto_17217 ?auto_17221 ) ) ( not ( = ?auto_17217 ?auto_17222 ) ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( not ( = ?auto_17218 ?auto_17220 ) ) ( not ( = ?auto_17218 ?auto_17221 ) ) ( not ( = ?auto_17218 ?auto_17222 ) ) ( not ( = ?auto_17219 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17221 ) ) ( not ( = ?auto_17219 ?auto_17222 ) ) ( not ( = ?auto_17220 ?auto_17221 ) ) ( not ( = ?auto_17220 ?auto_17222 ) ) ( not ( = ?auto_17221 ?auto_17222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17221 ?auto_17222 )
      ( !STACK ?auto_17221 ?auto_17220 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17228 - BLOCK
      ?auto_17229 - BLOCK
      ?auto_17230 - BLOCK
      ?auto_17231 - BLOCK
      ?auto_17232 - BLOCK
    )
    :vars
    (
      ?auto_17233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17232 ?auto_17233 ) ( ON-TABLE ?auto_17228 ) ( ON ?auto_17229 ?auto_17228 ) ( ON ?auto_17230 ?auto_17229 ) ( not ( = ?auto_17228 ?auto_17229 ) ) ( not ( = ?auto_17228 ?auto_17230 ) ) ( not ( = ?auto_17228 ?auto_17231 ) ) ( not ( = ?auto_17228 ?auto_17232 ) ) ( not ( = ?auto_17228 ?auto_17233 ) ) ( not ( = ?auto_17229 ?auto_17230 ) ) ( not ( = ?auto_17229 ?auto_17231 ) ) ( not ( = ?auto_17229 ?auto_17232 ) ) ( not ( = ?auto_17229 ?auto_17233 ) ) ( not ( = ?auto_17230 ?auto_17231 ) ) ( not ( = ?auto_17230 ?auto_17232 ) ) ( not ( = ?auto_17230 ?auto_17233 ) ) ( not ( = ?auto_17231 ?auto_17232 ) ) ( not ( = ?auto_17231 ?auto_17233 ) ) ( not ( = ?auto_17232 ?auto_17233 ) ) ( CLEAR ?auto_17230 ) ( ON ?auto_17231 ?auto_17232 ) ( CLEAR ?auto_17231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17228 ?auto_17229 ?auto_17230 ?auto_17231 )
      ( MAKE-5PILE ?auto_17228 ?auto_17229 ?auto_17230 ?auto_17231 ?auto_17232 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17239 - BLOCK
      ?auto_17240 - BLOCK
      ?auto_17241 - BLOCK
      ?auto_17242 - BLOCK
      ?auto_17243 - BLOCK
    )
    :vars
    (
      ?auto_17244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17243 ?auto_17244 ) ( ON-TABLE ?auto_17239 ) ( ON ?auto_17240 ?auto_17239 ) ( ON ?auto_17241 ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17241 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17241 ) ) ( not ( = ?auto_17240 ?auto_17242 ) ) ( not ( = ?auto_17240 ?auto_17243 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( CLEAR ?auto_17241 ) ( ON ?auto_17242 ?auto_17243 ) ( CLEAR ?auto_17242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 )
      ( MAKE-5PILE ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17250 - BLOCK
      ?auto_17251 - BLOCK
      ?auto_17252 - BLOCK
      ?auto_17253 - BLOCK
      ?auto_17254 - BLOCK
    )
    :vars
    (
      ?auto_17255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17254 ?auto_17255 ) ( ON-TABLE ?auto_17250 ) ( ON ?auto_17251 ?auto_17250 ) ( not ( = ?auto_17250 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17252 ) ) ( not ( = ?auto_17250 ?auto_17253 ) ) ( not ( = ?auto_17250 ?auto_17254 ) ) ( not ( = ?auto_17250 ?auto_17255 ) ) ( not ( = ?auto_17251 ?auto_17252 ) ) ( not ( = ?auto_17251 ?auto_17253 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17251 ?auto_17255 ) ) ( not ( = ?auto_17252 ?auto_17253 ) ) ( not ( = ?auto_17252 ?auto_17254 ) ) ( not ( = ?auto_17252 ?auto_17255 ) ) ( not ( = ?auto_17253 ?auto_17254 ) ) ( not ( = ?auto_17253 ?auto_17255 ) ) ( not ( = ?auto_17254 ?auto_17255 ) ) ( ON ?auto_17253 ?auto_17254 ) ( CLEAR ?auto_17251 ) ( ON ?auto_17252 ?auto_17253 ) ( CLEAR ?auto_17252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17250 ?auto_17251 ?auto_17252 )
      ( MAKE-5PILE ?auto_17250 ?auto_17251 ?auto_17252 ?auto_17253 ?auto_17254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17261 - BLOCK
      ?auto_17262 - BLOCK
      ?auto_17263 - BLOCK
      ?auto_17264 - BLOCK
      ?auto_17265 - BLOCK
    )
    :vars
    (
      ?auto_17266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17265 ?auto_17266 ) ( ON-TABLE ?auto_17261 ) ( ON ?auto_17262 ?auto_17261 ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17263 ) ) ( not ( = ?auto_17261 ?auto_17264 ) ) ( not ( = ?auto_17261 ?auto_17265 ) ) ( not ( = ?auto_17261 ?auto_17266 ) ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17264 ) ) ( not ( = ?auto_17262 ?auto_17265 ) ) ( not ( = ?auto_17262 ?auto_17266 ) ) ( not ( = ?auto_17263 ?auto_17264 ) ) ( not ( = ?auto_17263 ?auto_17265 ) ) ( not ( = ?auto_17263 ?auto_17266 ) ) ( not ( = ?auto_17264 ?auto_17265 ) ) ( not ( = ?auto_17264 ?auto_17266 ) ) ( not ( = ?auto_17265 ?auto_17266 ) ) ( ON ?auto_17264 ?auto_17265 ) ( CLEAR ?auto_17262 ) ( ON ?auto_17263 ?auto_17264 ) ( CLEAR ?auto_17263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17261 ?auto_17262 ?auto_17263 )
      ( MAKE-5PILE ?auto_17261 ?auto_17262 ?auto_17263 ?auto_17264 ?auto_17265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17272 - BLOCK
      ?auto_17273 - BLOCK
      ?auto_17274 - BLOCK
      ?auto_17275 - BLOCK
      ?auto_17276 - BLOCK
    )
    :vars
    (
      ?auto_17277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17276 ?auto_17277 ) ( ON-TABLE ?auto_17272 ) ( not ( = ?auto_17272 ?auto_17273 ) ) ( not ( = ?auto_17272 ?auto_17274 ) ) ( not ( = ?auto_17272 ?auto_17275 ) ) ( not ( = ?auto_17272 ?auto_17276 ) ) ( not ( = ?auto_17272 ?auto_17277 ) ) ( not ( = ?auto_17273 ?auto_17274 ) ) ( not ( = ?auto_17273 ?auto_17275 ) ) ( not ( = ?auto_17273 ?auto_17276 ) ) ( not ( = ?auto_17273 ?auto_17277 ) ) ( not ( = ?auto_17274 ?auto_17275 ) ) ( not ( = ?auto_17274 ?auto_17276 ) ) ( not ( = ?auto_17274 ?auto_17277 ) ) ( not ( = ?auto_17275 ?auto_17276 ) ) ( not ( = ?auto_17275 ?auto_17277 ) ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( ON ?auto_17275 ?auto_17276 ) ( ON ?auto_17274 ?auto_17275 ) ( CLEAR ?auto_17272 ) ( ON ?auto_17273 ?auto_17274 ) ( CLEAR ?auto_17273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17272 ?auto_17273 )
      ( MAKE-5PILE ?auto_17272 ?auto_17273 ?auto_17274 ?auto_17275 ?auto_17276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17283 - BLOCK
      ?auto_17284 - BLOCK
      ?auto_17285 - BLOCK
      ?auto_17286 - BLOCK
      ?auto_17287 - BLOCK
    )
    :vars
    (
      ?auto_17288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17287 ?auto_17288 ) ( ON-TABLE ?auto_17283 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17288 ) ) ( not ( = ?auto_17287 ?auto_17288 ) ) ( ON ?auto_17286 ?auto_17287 ) ( ON ?auto_17285 ?auto_17286 ) ( CLEAR ?auto_17283 ) ( ON ?auto_17284 ?auto_17285 ) ( CLEAR ?auto_17284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17283 ?auto_17284 )
      ( MAKE-5PILE ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17294 - BLOCK
      ?auto_17295 - BLOCK
      ?auto_17296 - BLOCK
      ?auto_17297 - BLOCK
      ?auto_17298 - BLOCK
    )
    :vars
    (
      ?auto_17299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17298 ?auto_17299 ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( not ( = ?auto_17294 ?auto_17296 ) ) ( not ( = ?auto_17294 ?auto_17297 ) ) ( not ( = ?auto_17294 ?auto_17298 ) ) ( not ( = ?auto_17294 ?auto_17299 ) ) ( not ( = ?auto_17295 ?auto_17296 ) ) ( not ( = ?auto_17295 ?auto_17297 ) ) ( not ( = ?auto_17295 ?auto_17298 ) ) ( not ( = ?auto_17295 ?auto_17299 ) ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17296 ?auto_17298 ) ) ( not ( = ?auto_17296 ?auto_17299 ) ) ( not ( = ?auto_17297 ?auto_17298 ) ) ( not ( = ?auto_17297 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17299 ) ) ( ON ?auto_17297 ?auto_17298 ) ( ON ?auto_17296 ?auto_17297 ) ( ON ?auto_17295 ?auto_17296 ) ( ON ?auto_17294 ?auto_17295 ) ( CLEAR ?auto_17294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17294 )
      ( MAKE-5PILE ?auto_17294 ?auto_17295 ?auto_17296 ?auto_17297 ?auto_17298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17305 - BLOCK
      ?auto_17306 - BLOCK
      ?auto_17307 - BLOCK
      ?auto_17308 - BLOCK
      ?auto_17309 - BLOCK
    )
    :vars
    (
      ?auto_17310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17309 ?auto_17310 ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17308 ) ) ( not ( = ?auto_17305 ?auto_17309 ) ) ( not ( = ?auto_17305 ?auto_17310 ) ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17308 ) ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17306 ?auto_17310 ) ) ( not ( = ?auto_17307 ?auto_17308 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17310 ) ) ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17308 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( ON ?auto_17308 ?auto_17309 ) ( ON ?auto_17307 ?auto_17308 ) ( ON ?auto_17306 ?auto_17307 ) ( ON ?auto_17305 ?auto_17306 ) ( CLEAR ?auto_17305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17305 )
      ( MAKE-5PILE ?auto_17305 ?auto_17306 ?auto_17307 ?auto_17308 ?auto_17309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17317 - BLOCK
      ?auto_17318 - BLOCK
      ?auto_17319 - BLOCK
      ?auto_17320 - BLOCK
      ?auto_17321 - BLOCK
      ?auto_17322 - BLOCK
    )
    :vars
    (
      ?auto_17323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17321 ) ( ON ?auto_17322 ?auto_17323 ) ( CLEAR ?auto_17322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17317 ) ( ON ?auto_17318 ?auto_17317 ) ( ON ?auto_17319 ?auto_17318 ) ( ON ?auto_17320 ?auto_17319 ) ( ON ?auto_17321 ?auto_17320 ) ( not ( = ?auto_17317 ?auto_17318 ) ) ( not ( = ?auto_17317 ?auto_17319 ) ) ( not ( = ?auto_17317 ?auto_17320 ) ) ( not ( = ?auto_17317 ?auto_17321 ) ) ( not ( = ?auto_17317 ?auto_17322 ) ) ( not ( = ?auto_17317 ?auto_17323 ) ) ( not ( = ?auto_17318 ?auto_17319 ) ) ( not ( = ?auto_17318 ?auto_17320 ) ) ( not ( = ?auto_17318 ?auto_17321 ) ) ( not ( = ?auto_17318 ?auto_17322 ) ) ( not ( = ?auto_17318 ?auto_17323 ) ) ( not ( = ?auto_17319 ?auto_17320 ) ) ( not ( = ?auto_17319 ?auto_17321 ) ) ( not ( = ?auto_17319 ?auto_17322 ) ) ( not ( = ?auto_17319 ?auto_17323 ) ) ( not ( = ?auto_17320 ?auto_17321 ) ) ( not ( = ?auto_17320 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17323 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( not ( = ?auto_17321 ?auto_17323 ) ) ( not ( = ?auto_17322 ?auto_17323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17322 ?auto_17323 )
      ( !STACK ?auto_17322 ?auto_17321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17330 - BLOCK
      ?auto_17331 - BLOCK
      ?auto_17332 - BLOCK
      ?auto_17333 - BLOCK
      ?auto_17334 - BLOCK
      ?auto_17335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17334 ) ( ON-TABLE ?auto_17335 ) ( CLEAR ?auto_17335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17330 ) ( ON ?auto_17331 ?auto_17330 ) ( ON ?auto_17332 ?auto_17331 ) ( ON ?auto_17333 ?auto_17332 ) ( ON ?auto_17334 ?auto_17333 ) ( not ( = ?auto_17330 ?auto_17331 ) ) ( not ( = ?auto_17330 ?auto_17332 ) ) ( not ( = ?auto_17330 ?auto_17333 ) ) ( not ( = ?auto_17330 ?auto_17334 ) ) ( not ( = ?auto_17330 ?auto_17335 ) ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17335 ) ) ( not ( = ?auto_17334 ?auto_17335 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_17335 )
      ( !STACK ?auto_17335 ?auto_17334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17342 - BLOCK
      ?auto_17343 - BLOCK
      ?auto_17344 - BLOCK
      ?auto_17345 - BLOCK
      ?auto_17346 - BLOCK
      ?auto_17347 - BLOCK
    )
    :vars
    (
      ?auto_17348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17347 ?auto_17348 ) ( ON-TABLE ?auto_17342 ) ( ON ?auto_17343 ?auto_17342 ) ( ON ?auto_17344 ?auto_17343 ) ( ON ?auto_17345 ?auto_17344 ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( not ( = ?auto_17342 ?auto_17344 ) ) ( not ( = ?auto_17342 ?auto_17345 ) ) ( not ( = ?auto_17342 ?auto_17346 ) ) ( not ( = ?auto_17342 ?auto_17347 ) ) ( not ( = ?auto_17342 ?auto_17348 ) ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( not ( = ?auto_17343 ?auto_17345 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17347 ) ) ( not ( = ?auto_17343 ?auto_17348 ) ) ( not ( = ?auto_17344 ?auto_17345 ) ) ( not ( = ?auto_17344 ?auto_17346 ) ) ( not ( = ?auto_17344 ?auto_17347 ) ) ( not ( = ?auto_17344 ?auto_17348 ) ) ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17347 ) ) ( not ( = ?auto_17345 ?auto_17348 ) ) ( not ( = ?auto_17346 ?auto_17347 ) ) ( not ( = ?auto_17346 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17348 ) ) ( CLEAR ?auto_17345 ) ( ON ?auto_17346 ?auto_17347 ) ( CLEAR ?auto_17346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 ?auto_17346 )
      ( MAKE-6PILE ?auto_17342 ?auto_17343 ?auto_17344 ?auto_17345 ?auto_17346 ?auto_17347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17355 - BLOCK
      ?auto_17356 - BLOCK
      ?auto_17357 - BLOCK
      ?auto_17358 - BLOCK
      ?auto_17359 - BLOCK
      ?auto_17360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17360 ) ( ON-TABLE ?auto_17355 ) ( ON ?auto_17356 ?auto_17355 ) ( ON ?auto_17357 ?auto_17356 ) ( ON ?auto_17358 ?auto_17357 ) ( not ( = ?auto_17355 ?auto_17356 ) ) ( not ( = ?auto_17355 ?auto_17357 ) ) ( not ( = ?auto_17355 ?auto_17358 ) ) ( not ( = ?auto_17355 ?auto_17359 ) ) ( not ( = ?auto_17355 ?auto_17360 ) ) ( not ( = ?auto_17356 ?auto_17357 ) ) ( not ( = ?auto_17356 ?auto_17358 ) ) ( not ( = ?auto_17356 ?auto_17359 ) ) ( not ( = ?auto_17356 ?auto_17360 ) ) ( not ( = ?auto_17357 ?auto_17358 ) ) ( not ( = ?auto_17357 ?auto_17359 ) ) ( not ( = ?auto_17357 ?auto_17360 ) ) ( not ( = ?auto_17358 ?auto_17359 ) ) ( not ( = ?auto_17358 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( CLEAR ?auto_17358 ) ( ON ?auto_17359 ?auto_17360 ) ( CLEAR ?auto_17359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17355 ?auto_17356 ?auto_17357 ?auto_17358 ?auto_17359 )
      ( MAKE-6PILE ?auto_17355 ?auto_17356 ?auto_17357 ?auto_17358 ?auto_17359 ?auto_17360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17367 - BLOCK
      ?auto_17368 - BLOCK
      ?auto_17369 - BLOCK
      ?auto_17370 - BLOCK
      ?auto_17371 - BLOCK
      ?auto_17372 - BLOCK
    )
    :vars
    (
      ?auto_17373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17372 ?auto_17373 ) ( ON-TABLE ?auto_17367 ) ( ON ?auto_17368 ?auto_17367 ) ( ON ?auto_17369 ?auto_17368 ) ( not ( = ?auto_17367 ?auto_17368 ) ) ( not ( = ?auto_17367 ?auto_17369 ) ) ( not ( = ?auto_17367 ?auto_17370 ) ) ( not ( = ?auto_17367 ?auto_17371 ) ) ( not ( = ?auto_17367 ?auto_17372 ) ) ( not ( = ?auto_17367 ?auto_17373 ) ) ( not ( = ?auto_17368 ?auto_17369 ) ) ( not ( = ?auto_17368 ?auto_17370 ) ) ( not ( = ?auto_17368 ?auto_17371 ) ) ( not ( = ?auto_17368 ?auto_17372 ) ) ( not ( = ?auto_17368 ?auto_17373 ) ) ( not ( = ?auto_17369 ?auto_17370 ) ) ( not ( = ?auto_17369 ?auto_17371 ) ) ( not ( = ?auto_17369 ?auto_17372 ) ) ( not ( = ?auto_17369 ?auto_17373 ) ) ( not ( = ?auto_17370 ?auto_17371 ) ) ( not ( = ?auto_17370 ?auto_17372 ) ) ( not ( = ?auto_17370 ?auto_17373 ) ) ( not ( = ?auto_17371 ?auto_17372 ) ) ( not ( = ?auto_17371 ?auto_17373 ) ) ( not ( = ?auto_17372 ?auto_17373 ) ) ( ON ?auto_17371 ?auto_17372 ) ( CLEAR ?auto_17369 ) ( ON ?auto_17370 ?auto_17371 ) ( CLEAR ?auto_17370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17367 ?auto_17368 ?auto_17369 ?auto_17370 )
      ( MAKE-6PILE ?auto_17367 ?auto_17368 ?auto_17369 ?auto_17370 ?auto_17371 ?auto_17372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17380 - BLOCK
      ?auto_17381 - BLOCK
      ?auto_17382 - BLOCK
      ?auto_17383 - BLOCK
      ?auto_17384 - BLOCK
      ?auto_17385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17385 ) ( ON-TABLE ?auto_17380 ) ( ON ?auto_17381 ?auto_17380 ) ( ON ?auto_17382 ?auto_17381 ) ( not ( = ?auto_17380 ?auto_17381 ) ) ( not ( = ?auto_17380 ?auto_17382 ) ) ( not ( = ?auto_17380 ?auto_17383 ) ) ( not ( = ?auto_17380 ?auto_17384 ) ) ( not ( = ?auto_17380 ?auto_17385 ) ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17384 ) ) ( not ( = ?auto_17381 ?auto_17385 ) ) ( not ( = ?auto_17382 ?auto_17383 ) ) ( not ( = ?auto_17382 ?auto_17384 ) ) ( not ( = ?auto_17382 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17384 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( ON ?auto_17384 ?auto_17385 ) ( CLEAR ?auto_17382 ) ( ON ?auto_17383 ?auto_17384 ) ( CLEAR ?auto_17383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 )
      ( MAKE-6PILE ?auto_17380 ?auto_17381 ?auto_17382 ?auto_17383 ?auto_17384 ?auto_17385 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17392 - BLOCK
      ?auto_17393 - BLOCK
      ?auto_17394 - BLOCK
      ?auto_17395 - BLOCK
      ?auto_17396 - BLOCK
      ?auto_17397 - BLOCK
    )
    :vars
    (
      ?auto_17398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17397 ?auto_17398 ) ( ON-TABLE ?auto_17392 ) ( ON ?auto_17393 ?auto_17392 ) ( not ( = ?auto_17392 ?auto_17393 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17395 ) ) ( not ( = ?auto_17392 ?auto_17396 ) ) ( not ( = ?auto_17392 ?auto_17397 ) ) ( not ( = ?auto_17392 ?auto_17398 ) ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17395 ) ) ( not ( = ?auto_17393 ?auto_17396 ) ) ( not ( = ?auto_17393 ?auto_17397 ) ) ( not ( = ?auto_17393 ?auto_17398 ) ) ( not ( = ?auto_17394 ?auto_17395 ) ) ( not ( = ?auto_17394 ?auto_17396 ) ) ( not ( = ?auto_17394 ?auto_17397 ) ) ( not ( = ?auto_17394 ?auto_17398 ) ) ( not ( = ?auto_17395 ?auto_17396 ) ) ( not ( = ?auto_17395 ?auto_17397 ) ) ( not ( = ?auto_17395 ?auto_17398 ) ) ( not ( = ?auto_17396 ?auto_17397 ) ) ( not ( = ?auto_17396 ?auto_17398 ) ) ( not ( = ?auto_17397 ?auto_17398 ) ) ( ON ?auto_17396 ?auto_17397 ) ( ON ?auto_17395 ?auto_17396 ) ( CLEAR ?auto_17393 ) ( ON ?auto_17394 ?auto_17395 ) ( CLEAR ?auto_17394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17392 ?auto_17393 ?auto_17394 )
      ( MAKE-6PILE ?auto_17392 ?auto_17393 ?auto_17394 ?auto_17395 ?auto_17396 ?auto_17397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17405 - BLOCK
      ?auto_17406 - BLOCK
      ?auto_17407 - BLOCK
      ?auto_17408 - BLOCK
      ?auto_17409 - BLOCK
      ?auto_17410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17410 ) ( ON-TABLE ?auto_17405 ) ( ON ?auto_17406 ?auto_17405 ) ( not ( = ?auto_17405 ?auto_17406 ) ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17405 ?auto_17408 ) ) ( not ( = ?auto_17405 ?auto_17409 ) ) ( not ( = ?auto_17405 ?auto_17410 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17406 ?auto_17409 ) ) ( not ( = ?auto_17406 ?auto_17410 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17407 ?auto_17409 ) ) ( not ( = ?auto_17407 ?auto_17410 ) ) ( not ( = ?auto_17408 ?auto_17409 ) ) ( not ( = ?auto_17408 ?auto_17410 ) ) ( not ( = ?auto_17409 ?auto_17410 ) ) ( ON ?auto_17409 ?auto_17410 ) ( ON ?auto_17408 ?auto_17409 ) ( CLEAR ?auto_17406 ) ( ON ?auto_17407 ?auto_17408 ) ( CLEAR ?auto_17407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17405 ?auto_17406 ?auto_17407 )
      ( MAKE-6PILE ?auto_17405 ?auto_17406 ?auto_17407 ?auto_17408 ?auto_17409 ?auto_17410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17417 - BLOCK
      ?auto_17418 - BLOCK
      ?auto_17419 - BLOCK
      ?auto_17420 - BLOCK
      ?auto_17421 - BLOCK
      ?auto_17422 - BLOCK
    )
    :vars
    (
      ?auto_17423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17422 ?auto_17423 ) ( ON-TABLE ?auto_17417 ) ( not ( = ?auto_17417 ?auto_17418 ) ) ( not ( = ?auto_17417 ?auto_17419 ) ) ( not ( = ?auto_17417 ?auto_17420 ) ) ( not ( = ?auto_17417 ?auto_17421 ) ) ( not ( = ?auto_17417 ?auto_17422 ) ) ( not ( = ?auto_17417 ?auto_17423 ) ) ( not ( = ?auto_17418 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17420 ) ) ( not ( = ?auto_17418 ?auto_17421 ) ) ( not ( = ?auto_17418 ?auto_17422 ) ) ( not ( = ?auto_17418 ?auto_17423 ) ) ( not ( = ?auto_17419 ?auto_17420 ) ) ( not ( = ?auto_17419 ?auto_17421 ) ) ( not ( = ?auto_17419 ?auto_17422 ) ) ( not ( = ?auto_17419 ?auto_17423 ) ) ( not ( = ?auto_17420 ?auto_17421 ) ) ( not ( = ?auto_17420 ?auto_17422 ) ) ( not ( = ?auto_17420 ?auto_17423 ) ) ( not ( = ?auto_17421 ?auto_17422 ) ) ( not ( = ?auto_17421 ?auto_17423 ) ) ( not ( = ?auto_17422 ?auto_17423 ) ) ( ON ?auto_17421 ?auto_17422 ) ( ON ?auto_17420 ?auto_17421 ) ( ON ?auto_17419 ?auto_17420 ) ( CLEAR ?auto_17417 ) ( ON ?auto_17418 ?auto_17419 ) ( CLEAR ?auto_17418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17417 ?auto_17418 )
      ( MAKE-6PILE ?auto_17417 ?auto_17418 ?auto_17419 ?auto_17420 ?auto_17421 ?auto_17422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17430 - BLOCK
      ?auto_17431 - BLOCK
      ?auto_17432 - BLOCK
      ?auto_17433 - BLOCK
      ?auto_17434 - BLOCK
      ?auto_17435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17435 ) ( ON-TABLE ?auto_17430 ) ( not ( = ?auto_17430 ?auto_17431 ) ) ( not ( = ?auto_17430 ?auto_17432 ) ) ( not ( = ?auto_17430 ?auto_17433 ) ) ( not ( = ?auto_17430 ?auto_17434 ) ) ( not ( = ?auto_17430 ?auto_17435 ) ) ( not ( = ?auto_17431 ?auto_17432 ) ) ( not ( = ?auto_17431 ?auto_17433 ) ) ( not ( = ?auto_17431 ?auto_17434 ) ) ( not ( = ?auto_17431 ?auto_17435 ) ) ( not ( = ?auto_17432 ?auto_17433 ) ) ( not ( = ?auto_17432 ?auto_17434 ) ) ( not ( = ?auto_17432 ?auto_17435 ) ) ( not ( = ?auto_17433 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17435 ) ) ( not ( = ?auto_17434 ?auto_17435 ) ) ( ON ?auto_17434 ?auto_17435 ) ( ON ?auto_17433 ?auto_17434 ) ( ON ?auto_17432 ?auto_17433 ) ( CLEAR ?auto_17430 ) ( ON ?auto_17431 ?auto_17432 ) ( CLEAR ?auto_17431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17430 ?auto_17431 )
      ( MAKE-6PILE ?auto_17430 ?auto_17431 ?auto_17432 ?auto_17433 ?auto_17434 ?auto_17435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17442 - BLOCK
      ?auto_17443 - BLOCK
      ?auto_17444 - BLOCK
      ?auto_17445 - BLOCK
      ?auto_17446 - BLOCK
      ?auto_17447 - BLOCK
    )
    :vars
    (
      ?auto_17448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17447 ?auto_17448 ) ( not ( = ?auto_17442 ?auto_17443 ) ) ( not ( = ?auto_17442 ?auto_17444 ) ) ( not ( = ?auto_17442 ?auto_17445 ) ) ( not ( = ?auto_17442 ?auto_17446 ) ) ( not ( = ?auto_17442 ?auto_17447 ) ) ( not ( = ?auto_17442 ?auto_17448 ) ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17443 ?auto_17445 ) ) ( not ( = ?auto_17443 ?auto_17446 ) ) ( not ( = ?auto_17443 ?auto_17447 ) ) ( not ( = ?auto_17443 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( ON ?auto_17446 ?auto_17447 ) ( ON ?auto_17445 ?auto_17446 ) ( ON ?auto_17444 ?auto_17445 ) ( ON ?auto_17443 ?auto_17444 ) ( ON ?auto_17442 ?auto_17443 ) ( CLEAR ?auto_17442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17442 )
      ( MAKE-6PILE ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17455 - BLOCK
      ?auto_17456 - BLOCK
      ?auto_17457 - BLOCK
      ?auto_17458 - BLOCK
      ?auto_17459 - BLOCK
      ?auto_17460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17460 ) ( not ( = ?auto_17455 ?auto_17456 ) ) ( not ( = ?auto_17455 ?auto_17457 ) ) ( not ( = ?auto_17455 ?auto_17458 ) ) ( not ( = ?auto_17455 ?auto_17459 ) ) ( not ( = ?auto_17455 ?auto_17460 ) ) ( not ( = ?auto_17456 ?auto_17457 ) ) ( not ( = ?auto_17456 ?auto_17458 ) ) ( not ( = ?auto_17456 ?auto_17459 ) ) ( not ( = ?auto_17456 ?auto_17460 ) ) ( not ( = ?auto_17457 ?auto_17458 ) ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( not ( = ?auto_17458 ?auto_17459 ) ) ( not ( = ?auto_17458 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( ON ?auto_17459 ?auto_17460 ) ( ON ?auto_17458 ?auto_17459 ) ( ON ?auto_17457 ?auto_17458 ) ( ON ?auto_17456 ?auto_17457 ) ( ON ?auto_17455 ?auto_17456 ) ( CLEAR ?auto_17455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17455 )
      ( MAKE-6PILE ?auto_17455 ?auto_17456 ?auto_17457 ?auto_17458 ?auto_17459 ?auto_17460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17467 - BLOCK
      ?auto_17468 - BLOCK
      ?auto_17469 - BLOCK
      ?auto_17470 - BLOCK
      ?auto_17471 - BLOCK
      ?auto_17472 - BLOCK
    )
    :vars
    (
      ?auto_17473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17467 ?auto_17468 ) ) ( not ( = ?auto_17467 ?auto_17469 ) ) ( not ( = ?auto_17467 ?auto_17470 ) ) ( not ( = ?auto_17467 ?auto_17471 ) ) ( not ( = ?auto_17467 ?auto_17472 ) ) ( not ( = ?auto_17468 ?auto_17469 ) ) ( not ( = ?auto_17468 ?auto_17470 ) ) ( not ( = ?auto_17468 ?auto_17471 ) ) ( not ( = ?auto_17468 ?auto_17472 ) ) ( not ( = ?auto_17469 ?auto_17470 ) ) ( not ( = ?auto_17469 ?auto_17471 ) ) ( not ( = ?auto_17469 ?auto_17472 ) ) ( not ( = ?auto_17470 ?auto_17471 ) ) ( not ( = ?auto_17470 ?auto_17472 ) ) ( not ( = ?auto_17471 ?auto_17472 ) ) ( ON ?auto_17467 ?auto_17473 ) ( not ( = ?auto_17472 ?auto_17473 ) ) ( not ( = ?auto_17471 ?auto_17473 ) ) ( not ( = ?auto_17470 ?auto_17473 ) ) ( not ( = ?auto_17469 ?auto_17473 ) ) ( not ( = ?auto_17468 ?auto_17473 ) ) ( not ( = ?auto_17467 ?auto_17473 ) ) ( ON ?auto_17468 ?auto_17467 ) ( ON ?auto_17469 ?auto_17468 ) ( ON ?auto_17470 ?auto_17469 ) ( ON ?auto_17471 ?auto_17470 ) ( ON ?auto_17472 ?auto_17471 ) ( CLEAR ?auto_17472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_17472 ?auto_17471 ?auto_17470 ?auto_17469 ?auto_17468 ?auto_17467 )
      ( MAKE-6PILE ?auto_17467 ?auto_17468 ?auto_17469 ?auto_17470 ?auto_17471 ?auto_17472 ) )
  )

)

