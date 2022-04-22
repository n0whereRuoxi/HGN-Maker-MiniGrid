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
      ?auto_128141 - BLOCK
      ?auto_128142 - BLOCK
      ?auto_128143 - BLOCK
      ?auto_128144 - BLOCK
      ?auto_128145 - BLOCK
      ?auto_128146 - BLOCK
      ?auto_128147 - BLOCK
      ?auto_128148 - BLOCK
    )
    :vars
    (
      ?auto_128149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128149 ?auto_128148 ) ( CLEAR ?auto_128149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128141 ) ( ON ?auto_128142 ?auto_128141 ) ( ON ?auto_128143 ?auto_128142 ) ( ON ?auto_128144 ?auto_128143 ) ( ON ?auto_128145 ?auto_128144 ) ( ON ?auto_128146 ?auto_128145 ) ( ON ?auto_128147 ?auto_128146 ) ( ON ?auto_128148 ?auto_128147 ) ( not ( = ?auto_128141 ?auto_128142 ) ) ( not ( = ?auto_128141 ?auto_128143 ) ) ( not ( = ?auto_128141 ?auto_128144 ) ) ( not ( = ?auto_128141 ?auto_128145 ) ) ( not ( = ?auto_128141 ?auto_128146 ) ) ( not ( = ?auto_128141 ?auto_128147 ) ) ( not ( = ?auto_128141 ?auto_128148 ) ) ( not ( = ?auto_128141 ?auto_128149 ) ) ( not ( = ?auto_128142 ?auto_128143 ) ) ( not ( = ?auto_128142 ?auto_128144 ) ) ( not ( = ?auto_128142 ?auto_128145 ) ) ( not ( = ?auto_128142 ?auto_128146 ) ) ( not ( = ?auto_128142 ?auto_128147 ) ) ( not ( = ?auto_128142 ?auto_128148 ) ) ( not ( = ?auto_128142 ?auto_128149 ) ) ( not ( = ?auto_128143 ?auto_128144 ) ) ( not ( = ?auto_128143 ?auto_128145 ) ) ( not ( = ?auto_128143 ?auto_128146 ) ) ( not ( = ?auto_128143 ?auto_128147 ) ) ( not ( = ?auto_128143 ?auto_128148 ) ) ( not ( = ?auto_128143 ?auto_128149 ) ) ( not ( = ?auto_128144 ?auto_128145 ) ) ( not ( = ?auto_128144 ?auto_128146 ) ) ( not ( = ?auto_128144 ?auto_128147 ) ) ( not ( = ?auto_128144 ?auto_128148 ) ) ( not ( = ?auto_128144 ?auto_128149 ) ) ( not ( = ?auto_128145 ?auto_128146 ) ) ( not ( = ?auto_128145 ?auto_128147 ) ) ( not ( = ?auto_128145 ?auto_128148 ) ) ( not ( = ?auto_128145 ?auto_128149 ) ) ( not ( = ?auto_128146 ?auto_128147 ) ) ( not ( = ?auto_128146 ?auto_128148 ) ) ( not ( = ?auto_128146 ?auto_128149 ) ) ( not ( = ?auto_128147 ?auto_128148 ) ) ( not ( = ?auto_128147 ?auto_128149 ) ) ( not ( = ?auto_128148 ?auto_128149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128149 ?auto_128148 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128151 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128151 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_128151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128152 - BLOCK
    )
    :vars
    (
      ?auto_128153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128152 ?auto_128153 ) ( CLEAR ?auto_128152 ) ( HAND-EMPTY ) ( not ( = ?auto_128152 ?auto_128153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128152 ?auto_128153 )
      ( MAKE-1PILE ?auto_128152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128161 - BLOCK
      ?auto_128162 - BLOCK
      ?auto_128163 - BLOCK
      ?auto_128164 - BLOCK
      ?auto_128165 - BLOCK
      ?auto_128166 - BLOCK
      ?auto_128167 - BLOCK
    )
    :vars
    (
      ?auto_128168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128168 ?auto_128167 ) ( CLEAR ?auto_128168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128161 ) ( ON ?auto_128162 ?auto_128161 ) ( ON ?auto_128163 ?auto_128162 ) ( ON ?auto_128164 ?auto_128163 ) ( ON ?auto_128165 ?auto_128164 ) ( ON ?auto_128166 ?auto_128165 ) ( ON ?auto_128167 ?auto_128166 ) ( not ( = ?auto_128161 ?auto_128162 ) ) ( not ( = ?auto_128161 ?auto_128163 ) ) ( not ( = ?auto_128161 ?auto_128164 ) ) ( not ( = ?auto_128161 ?auto_128165 ) ) ( not ( = ?auto_128161 ?auto_128166 ) ) ( not ( = ?auto_128161 ?auto_128167 ) ) ( not ( = ?auto_128161 ?auto_128168 ) ) ( not ( = ?auto_128162 ?auto_128163 ) ) ( not ( = ?auto_128162 ?auto_128164 ) ) ( not ( = ?auto_128162 ?auto_128165 ) ) ( not ( = ?auto_128162 ?auto_128166 ) ) ( not ( = ?auto_128162 ?auto_128167 ) ) ( not ( = ?auto_128162 ?auto_128168 ) ) ( not ( = ?auto_128163 ?auto_128164 ) ) ( not ( = ?auto_128163 ?auto_128165 ) ) ( not ( = ?auto_128163 ?auto_128166 ) ) ( not ( = ?auto_128163 ?auto_128167 ) ) ( not ( = ?auto_128163 ?auto_128168 ) ) ( not ( = ?auto_128164 ?auto_128165 ) ) ( not ( = ?auto_128164 ?auto_128166 ) ) ( not ( = ?auto_128164 ?auto_128167 ) ) ( not ( = ?auto_128164 ?auto_128168 ) ) ( not ( = ?auto_128165 ?auto_128166 ) ) ( not ( = ?auto_128165 ?auto_128167 ) ) ( not ( = ?auto_128165 ?auto_128168 ) ) ( not ( = ?auto_128166 ?auto_128167 ) ) ( not ( = ?auto_128166 ?auto_128168 ) ) ( not ( = ?auto_128167 ?auto_128168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128168 ?auto_128167 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128169 - BLOCK
      ?auto_128170 - BLOCK
      ?auto_128171 - BLOCK
      ?auto_128172 - BLOCK
      ?auto_128173 - BLOCK
      ?auto_128174 - BLOCK
      ?auto_128175 - BLOCK
    )
    :vars
    (
      ?auto_128176 - BLOCK
      ?auto_128177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128176 ?auto_128175 ) ( CLEAR ?auto_128176 ) ( ON-TABLE ?auto_128169 ) ( ON ?auto_128170 ?auto_128169 ) ( ON ?auto_128171 ?auto_128170 ) ( ON ?auto_128172 ?auto_128171 ) ( ON ?auto_128173 ?auto_128172 ) ( ON ?auto_128174 ?auto_128173 ) ( ON ?auto_128175 ?auto_128174 ) ( not ( = ?auto_128169 ?auto_128170 ) ) ( not ( = ?auto_128169 ?auto_128171 ) ) ( not ( = ?auto_128169 ?auto_128172 ) ) ( not ( = ?auto_128169 ?auto_128173 ) ) ( not ( = ?auto_128169 ?auto_128174 ) ) ( not ( = ?auto_128169 ?auto_128175 ) ) ( not ( = ?auto_128169 ?auto_128176 ) ) ( not ( = ?auto_128170 ?auto_128171 ) ) ( not ( = ?auto_128170 ?auto_128172 ) ) ( not ( = ?auto_128170 ?auto_128173 ) ) ( not ( = ?auto_128170 ?auto_128174 ) ) ( not ( = ?auto_128170 ?auto_128175 ) ) ( not ( = ?auto_128170 ?auto_128176 ) ) ( not ( = ?auto_128171 ?auto_128172 ) ) ( not ( = ?auto_128171 ?auto_128173 ) ) ( not ( = ?auto_128171 ?auto_128174 ) ) ( not ( = ?auto_128171 ?auto_128175 ) ) ( not ( = ?auto_128171 ?auto_128176 ) ) ( not ( = ?auto_128172 ?auto_128173 ) ) ( not ( = ?auto_128172 ?auto_128174 ) ) ( not ( = ?auto_128172 ?auto_128175 ) ) ( not ( = ?auto_128172 ?auto_128176 ) ) ( not ( = ?auto_128173 ?auto_128174 ) ) ( not ( = ?auto_128173 ?auto_128175 ) ) ( not ( = ?auto_128173 ?auto_128176 ) ) ( not ( = ?auto_128174 ?auto_128175 ) ) ( not ( = ?auto_128174 ?auto_128176 ) ) ( not ( = ?auto_128175 ?auto_128176 ) ) ( HOLDING ?auto_128177 ) ( not ( = ?auto_128169 ?auto_128177 ) ) ( not ( = ?auto_128170 ?auto_128177 ) ) ( not ( = ?auto_128171 ?auto_128177 ) ) ( not ( = ?auto_128172 ?auto_128177 ) ) ( not ( = ?auto_128173 ?auto_128177 ) ) ( not ( = ?auto_128174 ?auto_128177 ) ) ( not ( = ?auto_128175 ?auto_128177 ) ) ( not ( = ?auto_128176 ?auto_128177 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_128177 )
      ( MAKE-7PILE ?auto_128169 ?auto_128170 ?auto_128171 ?auto_128172 ?auto_128173 ?auto_128174 ?auto_128175 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128178 - BLOCK
      ?auto_128179 - BLOCK
      ?auto_128180 - BLOCK
      ?auto_128181 - BLOCK
      ?auto_128182 - BLOCK
      ?auto_128183 - BLOCK
      ?auto_128184 - BLOCK
    )
    :vars
    (
      ?auto_128185 - BLOCK
      ?auto_128186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128185 ?auto_128184 ) ( ON-TABLE ?auto_128178 ) ( ON ?auto_128179 ?auto_128178 ) ( ON ?auto_128180 ?auto_128179 ) ( ON ?auto_128181 ?auto_128180 ) ( ON ?auto_128182 ?auto_128181 ) ( ON ?auto_128183 ?auto_128182 ) ( ON ?auto_128184 ?auto_128183 ) ( not ( = ?auto_128178 ?auto_128179 ) ) ( not ( = ?auto_128178 ?auto_128180 ) ) ( not ( = ?auto_128178 ?auto_128181 ) ) ( not ( = ?auto_128178 ?auto_128182 ) ) ( not ( = ?auto_128178 ?auto_128183 ) ) ( not ( = ?auto_128178 ?auto_128184 ) ) ( not ( = ?auto_128178 ?auto_128185 ) ) ( not ( = ?auto_128179 ?auto_128180 ) ) ( not ( = ?auto_128179 ?auto_128181 ) ) ( not ( = ?auto_128179 ?auto_128182 ) ) ( not ( = ?auto_128179 ?auto_128183 ) ) ( not ( = ?auto_128179 ?auto_128184 ) ) ( not ( = ?auto_128179 ?auto_128185 ) ) ( not ( = ?auto_128180 ?auto_128181 ) ) ( not ( = ?auto_128180 ?auto_128182 ) ) ( not ( = ?auto_128180 ?auto_128183 ) ) ( not ( = ?auto_128180 ?auto_128184 ) ) ( not ( = ?auto_128180 ?auto_128185 ) ) ( not ( = ?auto_128181 ?auto_128182 ) ) ( not ( = ?auto_128181 ?auto_128183 ) ) ( not ( = ?auto_128181 ?auto_128184 ) ) ( not ( = ?auto_128181 ?auto_128185 ) ) ( not ( = ?auto_128182 ?auto_128183 ) ) ( not ( = ?auto_128182 ?auto_128184 ) ) ( not ( = ?auto_128182 ?auto_128185 ) ) ( not ( = ?auto_128183 ?auto_128184 ) ) ( not ( = ?auto_128183 ?auto_128185 ) ) ( not ( = ?auto_128184 ?auto_128185 ) ) ( not ( = ?auto_128178 ?auto_128186 ) ) ( not ( = ?auto_128179 ?auto_128186 ) ) ( not ( = ?auto_128180 ?auto_128186 ) ) ( not ( = ?auto_128181 ?auto_128186 ) ) ( not ( = ?auto_128182 ?auto_128186 ) ) ( not ( = ?auto_128183 ?auto_128186 ) ) ( not ( = ?auto_128184 ?auto_128186 ) ) ( not ( = ?auto_128185 ?auto_128186 ) ) ( ON ?auto_128186 ?auto_128185 ) ( CLEAR ?auto_128186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128178 ?auto_128179 ?auto_128180 ?auto_128181 ?auto_128182 ?auto_128183 ?auto_128184 ?auto_128185 )
      ( MAKE-7PILE ?auto_128178 ?auto_128179 ?auto_128180 ?auto_128181 ?auto_128182 ?auto_128183 ?auto_128184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128189 - BLOCK
      ?auto_128190 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128190 ) ( CLEAR ?auto_128189 ) ( ON-TABLE ?auto_128189 ) ( not ( = ?auto_128189 ?auto_128190 ) ) )
    :subtasks
    ( ( !STACK ?auto_128190 ?auto_128189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128191 - BLOCK
      ?auto_128192 - BLOCK
    )
    :vars
    (
      ?auto_128193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128191 ) ( ON-TABLE ?auto_128191 ) ( not ( = ?auto_128191 ?auto_128192 ) ) ( ON ?auto_128192 ?auto_128193 ) ( CLEAR ?auto_128192 ) ( HAND-EMPTY ) ( not ( = ?auto_128191 ?auto_128193 ) ) ( not ( = ?auto_128192 ?auto_128193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128192 ?auto_128193 )
      ( MAKE-2PILE ?auto_128191 ?auto_128192 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128194 - BLOCK
      ?auto_128195 - BLOCK
    )
    :vars
    (
      ?auto_128196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128194 ?auto_128195 ) ) ( ON ?auto_128195 ?auto_128196 ) ( CLEAR ?auto_128195 ) ( not ( = ?auto_128194 ?auto_128196 ) ) ( not ( = ?auto_128195 ?auto_128196 ) ) ( HOLDING ?auto_128194 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128194 )
      ( MAKE-2PILE ?auto_128194 ?auto_128195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128197 - BLOCK
      ?auto_128198 - BLOCK
    )
    :vars
    (
      ?auto_128199 - BLOCK
      ?auto_128201 - BLOCK
      ?auto_128200 - BLOCK
      ?auto_128204 - BLOCK
      ?auto_128205 - BLOCK
      ?auto_128202 - BLOCK
      ?auto_128203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128197 ?auto_128198 ) ) ( ON ?auto_128198 ?auto_128199 ) ( not ( = ?auto_128197 ?auto_128199 ) ) ( not ( = ?auto_128198 ?auto_128199 ) ) ( ON ?auto_128197 ?auto_128198 ) ( CLEAR ?auto_128197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128201 ) ( ON ?auto_128200 ?auto_128201 ) ( ON ?auto_128204 ?auto_128200 ) ( ON ?auto_128205 ?auto_128204 ) ( ON ?auto_128202 ?auto_128205 ) ( ON ?auto_128203 ?auto_128202 ) ( ON ?auto_128199 ?auto_128203 ) ( not ( = ?auto_128201 ?auto_128200 ) ) ( not ( = ?auto_128201 ?auto_128204 ) ) ( not ( = ?auto_128201 ?auto_128205 ) ) ( not ( = ?auto_128201 ?auto_128202 ) ) ( not ( = ?auto_128201 ?auto_128203 ) ) ( not ( = ?auto_128201 ?auto_128199 ) ) ( not ( = ?auto_128201 ?auto_128198 ) ) ( not ( = ?auto_128201 ?auto_128197 ) ) ( not ( = ?auto_128200 ?auto_128204 ) ) ( not ( = ?auto_128200 ?auto_128205 ) ) ( not ( = ?auto_128200 ?auto_128202 ) ) ( not ( = ?auto_128200 ?auto_128203 ) ) ( not ( = ?auto_128200 ?auto_128199 ) ) ( not ( = ?auto_128200 ?auto_128198 ) ) ( not ( = ?auto_128200 ?auto_128197 ) ) ( not ( = ?auto_128204 ?auto_128205 ) ) ( not ( = ?auto_128204 ?auto_128202 ) ) ( not ( = ?auto_128204 ?auto_128203 ) ) ( not ( = ?auto_128204 ?auto_128199 ) ) ( not ( = ?auto_128204 ?auto_128198 ) ) ( not ( = ?auto_128204 ?auto_128197 ) ) ( not ( = ?auto_128205 ?auto_128202 ) ) ( not ( = ?auto_128205 ?auto_128203 ) ) ( not ( = ?auto_128205 ?auto_128199 ) ) ( not ( = ?auto_128205 ?auto_128198 ) ) ( not ( = ?auto_128205 ?auto_128197 ) ) ( not ( = ?auto_128202 ?auto_128203 ) ) ( not ( = ?auto_128202 ?auto_128199 ) ) ( not ( = ?auto_128202 ?auto_128198 ) ) ( not ( = ?auto_128202 ?auto_128197 ) ) ( not ( = ?auto_128203 ?auto_128199 ) ) ( not ( = ?auto_128203 ?auto_128198 ) ) ( not ( = ?auto_128203 ?auto_128197 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128201 ?auto_128200 ?auto_128204 ?auto_128205 ?auto_128202 ?auto_128203 ?auto_128199 ?auto_128198 )
      ( MAKE-2PILE ?auto_128197 ?auto_128198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128212 - BLOCK
      ?auto_128213 - BLOCK
      ?auto_128214 - BLOCK
      ?auto_128215 - BLOCK
      ?auto_128216 - BLOCK
      ?auto_128217 - BLOCK
    )
    :vars
    (
      ?auto_128218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128218 ?auto_128217 ) ( CLEAR ?auto_128218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128212 ) ( ON ?auto_128213 ?auto_128212 ) ( ON ?auto_128214 ?auto_128213 ) ( ON ?auto_128215 ?auto_128214 ) ( ON ?auto_128216 ?auto_128215 ) ( ON ?auto_128217 ?auto_128216 ) ( not ( = ?auto_128212 ?auto_128213 ) ) ( not ( = ?auto_128212 ?auto_128214 ) ) ( not ( = ?auto_128212 ?auto_128215 ) ) ( not ( = ?auto_128212 ?auto_128216 ) ) ( not ( = ?auto_128212 ?auto_128217 ) ) ( not ( = ?auto_128212 ?auto_128218 ) ) ( not ( = ?auto_128213 ?auto_128214 ) ) ( not ( = ?auto_128213 ?auto_128215 ) ) ( not ( = ?auto_128213 ?auto_128216 ) ) ( not ( = ?auto_128213 ?auto_128217 ) ) ( not ( = ?auto_128213 ?auto_128218 ) ) ( not ( = ?auto_128214 ?auto_128215 ) ) ( not ( = ?auto_128214 ?auto_128216 ) ) ( not ( = ?auto_128214 ?auto_128217 ) ) ( not ( = ?auto_128214 ?auto_128218 ) ) ( not ( = ?auto_128215 ?auto_128216 ) ) ( not ( = ?auto_128215 ?auto_128217 ) ) ( not ( = ?auto_128215 ?auto_128218 ) ) ( not ( = ?auto_128216 ?auto_128217 ) ) ( not ( = ?auto_128216 ?auto_128218 ) ) ( not ( = ?auto_128217 ?auto_128218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128218 ?auto_128217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128219 - BLOCK
      ?auto_128220 - BLOCK
      ?auto_128221 - BLOCK
      ?auto_128222 - BLOCK
      ?auto_128223 - BLOCK
      ?auto_128224 - BLOCK
    )
    :vars
    (
      ?auto_128225 - BLOCK
      ?auto_128226 - BLOCK
      ?auto_128227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128225 ?auto_128224 ) ( CLEAR ?auto_128225 ) ( ON-TABLE ?auto_128219 ) ( ON ?auto_128220 ?auto_128219 ) ( ON ?auto_128221 ?auto_128220 ) ( ON ?auto_128222 ?auto_128221 ) ( ON ?auto_128223 ?auto_128222 ) ( ON ?auto_128224 ?auto_128223 ) ( not ( = ?auto_128219 ?auto_128220 ) ) ( not ( = ?auto_128219 ?auto_128221 ) ) ( not ( = ?auto_128219 ?auto_128222 ) ) ( not ( = ?auto_128219 ?auto_128223 ) ) ( not ( = ?auto_128219 ?auto_128224 ) ) ( not ( = ?auto_128219 ?auto_128225 ) ) ( not ( = ?auto_128220 ?auto_128221 ) ) ( not ( = ?auto_128220 ?auto_128222 ) ) ( not ( = ?auto_128220 ?auto_128223 ) ) ( not ( = ?auto_128220 ?auto_128224 ) ) ( not ( = ?auto_128220 ?auto_128225 ) ) ( not ( = ?auto_128221 ?auto_128222 ) ) ( not ( = ?auto_128221 ?auto_128223 ) ) ( not ( = ?auto_128221 ?auto_128224 ) ) ( not ( = ?auto_128221 ?auto_128225 ) ) ( not ( = ?auto_128222 ?auto_128223 ) ) ( not ( = ?auto_128222 ?auto_128224 ) ) ( not ( = ?auto_128222 ?auto_128225 ) ) ( not ( = ?auto_128223 ?auto_128224 ) ) ( not ( = ?auto_128223 ?auto_128225 ) ) ( not ( = ?auto_128224 ?auto_128225 ) ) ( HOLDING ?auto_128226 ) ( CLEAR ?auto_128227 ) ( not ( = ?auto_128219 ?auto_128226 ) ) ( not ( = ?auto_128219 ?auto_128227 ) ) ( not ( = ?auto_128220 ?auto_128226 ) ) ( not ( = ?auto_128220 ?auto_128227 ) ) ( not ( = ?auto_128221 ?auto_128226 ) ) ( not ( = ?auto_128221 ?auto_128227 ) ) ( not ( = ?auto_128222 ?auto_128226 ) ) ( not ( = ?auto_128222 ?auto_128227 ) ) ( not ( = ?auto_128223 ?auto_128226 ) ) ( not ( = ?auto_128223 ?auto_128227 ) ) ( not ( = ?auto_128224 ?auto_128226 ) ) ( not ( = ?auto_128224 ?auto_128227 ) ) ( not ( = ?auto_128225 ?auto_128226 ) ) ( not ( = ?auto_128225 ?auto_128227 ) ) ( not ( = ?auto_128226 ?auto_128227 ) ) )
    :subtasks
    ( ( !STACK ?auto_128226 ?auto_128227 )
      ( MAKE-6PILE ?auto_128219 ?auto_128220 ?auto_128221 ?auto_128222 ?auto_128223 ?auto_128224 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129559 - BLOCK
      ?auto_129560 - BLOCK
      ?auto_129561 - BLOCK
      ?auto_129562 - BLOCK
      ?auto_129563 - BLOCK
      ?auto_129564 - BLOCK
    )
    :vars
    (
      ?auto_129565 - BLOCK
      ?auto_129566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129565 ?auto_129564 ) ( ON-TABLE ?auto_129559 ) ( ON ?auto_129560 ?auto_129559 ) ( ON ?auto_129561 ?auto_129560 ) ( ON ?auto_129562 ?auto_129561 ) ( ON ?auto_129563 ?auto_129562 ) ( ON ?auto_129564 ?auto_129563 ) ( not ( = ?auto_129559 ?auto_129560 ) ) ( not ( = ?auto_129559 ?auto_129561 ) ) ( not ( = ?auto_129559 ?auto_129562 ) ) ( not ( = ?auto_129559 ?auto_129563 ) ) ( not ( = ?auto_129559 ?auto_129564 ) ) ( not ( = ?auto_129559 ?auto_129565 ) ) ( not ( = ?auto_129560 ?auto_129561 ) ) ( not ( = ?auto_129560 ?auto_129562 ) ) ( not ( = ?auto_129560 ?auto_129563 ) ) ( not ( = ?auto_129560 ?auto_129564 ) ) ( not ( = ?auto_129560 ?auto_129565 ) ) ( not ( = ?auto_129561 ?auto_129562 ) ) ( not ( = ?auto_129561 ?auto_129563 ) ) ( not ( = ?auto_129561 ?auto_129564 ) ) ( not ( = ?auto_129561 ?auto_129565 ) ) ( not ( = ?auto_129562 ?auto_129563 ) ) ( not ( = ?auto_129562 ?auto_129564 ) ) ( not ( = ?auto_129562 ?auto_129565 ) ) ( not ( = ?auto_129563 ?auto_129564 ) ) ( not ( = ?auto_129563 ?auto_129565 ) ) ( not ( = ?auto_129564 ?auto_129565 ) ) ( not ( = ?auto_129559 ?auto_129566 ) ) ( not ( = ?auto_129560 ?auto_129566 ) ) ( not ( = ?auto_129561 ?auto_129566 ) ) ( not ( = ?auto_129562 ?auto_129566 ) ) ( not ( = ?auto_129563 ?auto_129566 ) ) ( not ( = ?auto_129564 ?auto_129566 ) ) ( not ( = ?auto_129565 ?auto_129566 ) ) ( ON ?auto_129566 ?auto_129565 ) ( CLEAR ?auto_129566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129559 ?auto_129560 ?auto_129561 ?auto_129562 ?auto_129563 ?auto_129564 ?auto_129565 )
      ( MAKE-6PILE ?auto_129559 ?auto_129560 ?auto_129561 ?auto_129562 ?auto_129563 ?auto_129564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128237 - BLOCK
      ?auto_128238 - BLOCK
      ?auto_128239 - BLOCK
      ?auto_128240 - BLOCK
      ?auto_128241 - BLOCK
      ?auto_128242 - BLOCK
    )
    :vars
    (
      ?auto_128243 - BLOCK
      ?auto_128245 - BLOCK
      ?auto_128244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128243 ?auto_128242 ) ( ON-TABLE ?auto_128237 ) ( ON ?auto_128238 ?auto_128237 ) ( ON ?auto_128239 ?auto_128238 ) ( ON ?auto_128240 ?auto_128239 ) ( ON ?auto_128241 ?auto_128240 ) ( ON ?auto_128242 ?auto_128241 ) ( not ( = ?auto_128237 ?auto_128238 ) ) ( not ( = ?auto_128237 ?auto_128239 ) ) ( not ( = ?auto_128237 ?auto_128240 ) ) ( not ( = ?auto_128237 ?auto_128241 ) ) ( not ( = ?auto_128237 ?auto_128242 ) ) ( not ( = ?auto_128237 ?auto_128243 ) ) ( not ( = ?auto_128238 ?auto_128239 ) ) ( not ( = ?auto_128238 ?auto_128240 ) ) ( not ( = ?auto_128238 ?auto_128241 ) ) ( not ( = ?auto_128238 ?auto_128242 ) ) ( not ( = ?auto_128238 ?auto_128243 ) ) ( not ( = ?auto_128239 ?auto_128240 ) ) ( not ( = ?auto_128239 ?auto_128241 ) ) ( not ( = ?auto_128239 ?auto_128242 ) ) ( not ( = ?auto_128239 ?auto_128243 ) ) ( not ( = ?auto_128240 ?auto_128241 ) ) ( not ( = ?auto_128240 ?auto_128242 ) ) ( not ( = ?auto_128240 ?auto_128243 ) ) ( not ( = ?auto_128241 ?auto_128242 ) ) ( not ( = ?auto_128241 ?auto_128243 ) ) ( not ( = ?auto_128242 ?auto_128243 ) ) ( not ( = ?auto_128237 ?auto_128245 ) ) ( not ( = ?auto_128237 ?auto_128244 ) ) ( not ( = ?auto_128238 ?auto_128245 ) ) ( not ( = ?auto_128238 ?auto_128244 ) ) ( not ( = ?auto_128239 ?auto_128245 ) ) ( not ( = ?auto_128239 ?auto_128244 ) ) ( not ( = ?auto_128240 ?auto_128245 ) ) ( not ( = ?auto_128240 ?auto_128244 ) ) ( not ( = ?auto_128241 ?auto_128245 ) ) ( not ( = ?auto_128241 ?auto_128244 ) ) ( not ( = ?auto_128242 ?auto_128245 ) ) ( not ( = ?auto_128242 ?auto_128244 ) ) ( not ( = ?auto_128243 ?auto_128245 ) ) ( not ( = ?auto_128243 ?auto_128244 ) ) ( not ( = ?auto_128245 ?auto_128244 ) ) ( ON ?auto_128245 ?auto_128243 ) ( CLEAR ?auto_128245 ) ( HOLDING ?auto_128244 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128244 )
      ( MAKE-6PILE ?auto_128237 ?auto_128238 ?auto_128239 ?auto_128240 ?auto_128241 ?auto_128242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128246 - BLOCK
      ?auto_128247 - BLOCK
      ?auto_128248 - BLOCK
      ?auto_128249 - BLOCK
      ?auto_128250 - BLOCK
      ?auto_128251 - BLOCK
    )
    :vars
    (
      ?auto_128253 - BLOCK
      ?auto_128252 - BLOCK
      ?auto_128254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128253 ?auto_128251 ) ( ON-TABLE ?auto_128246 ) ( ON ?auto_128247 ?auto_128246 ) ( ON ?auto_128248 ?auto_128247 ) ( ON ?auto_128249 ?auto_128248 ) ( ON ?auto_128250 ?auto_128249 ) ( ON ?auto_128251 ?auto_128250 ) ( not ( = ?auto_128246 ?auto_128247 ) ) ( not ( = ?auto_128246 ?auto_128248 ) ) ( not ( = ?auto_128246 ?auto_128249 ) ) ( not ( = ?auto_128246 ?auto_128250 ) ) ( not ( = ?auto_128246 ?auto_128251 ) ) ( not ( = ?auto_128246 ?auto_128253 ) ) ( not ( = ?auto_128247 ?auto_128248 ) ) ( not ( = ?auto_128247 ?auto_128249 ) ) ( not ( = ?auto_128247 ?auto_128250 ) ) ( not ( = ?auto_128247 ?auto_128251 ) ) ( not ( = ?auto_128247 ?auto_128253 ) ) ( not ( = ?auto_128248 ?auto_128249 ) ) ( not ( = ?auto_128248 ?auto_128250 ) ) ( not ( = ?auto_128248 ?auto_128251 ) ) ( not ( = ?auto_128248 ?auto_128253 ) ) ( not ( = ?auto_128249 ?auto_128250 ) ) ( not ( = ?auto_128249 ?auto_128251 ) ) ( not ( = ?auto_128249 ?auto_128253 ) ) ( not ( = ?auto_128250 ?auto_128251 ) ) ( not ( = ?auto_128250 ?auto_128253 ) ) ( not ( = ?auto_128251 ?auto_128253 ) ) ( not ( = ?auto_128246 ?auto_128252 ) ) ( not ( = ?auto_128246 ?auto_128254 ) ) ( not ( = ?auto_128247 ?auto_128252 ) ) ( not ( = ?auto_128247 ?auto_128254 ) ) ( not ( = ?auto_128248 ?auto_128252 ) ) ( not ( = ?auto_128248 ?auto_128254 ) ) ( not ( = ?auto_128249 ?auto_128252 ) ) ( not ( = ?auto_128249 ?auto_128254 ) ) ( not ( = ?auto_128250 ?auto_128252 ) ) ( not ( = ?auto_128250 ?auto_128254 ) ) ( not ( = ?auto_128251 ?auto_128252 ) ) ( not ( = ?auto_128251 ?auto_128254 ) ) ( not ( = ?auto_128253 ?auto_128252 ) ) ( not ( = ?auto_128253 ?auto_128254 ) ) ( not ( = ?auto_128252 ?auto_128254 ) ) ( ON ?auto_128252 ?auto_128253 ) ( ON ?auto_128254 ?auto_128252 ) ( CLEAR ?auto_128254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128246 ?auto_128247 ?auto_128248 ?auto_128249 ?auto_128250 ?auto_128251 ?auto_128253 ?auto_128252 )
      ( MAKE-6PILE ?auto_128246 ?auto_128247 ?auto_128248 ?auto_128249 ?auto_128250 ?auto_128251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128258 - BLOCK
      ?auto_128259 - BLOCK
      ?auto_128260 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128260 ) ( CLEAR ?auto_128259 ) ( ON-TABLE ?auto_128258 ) ( ON ?auto_128259 ?auto_128258 ) ( not ( = ?auto_128258 ?auto_128259 ) ) ( not ( = ?auto_128258 ?auto_128260 ) ) ( not ( = ?auto_128259 ?auto_128260 ) ) )
    :subtasks
    ( ( !STACK ?auto_128260 ?auto_128259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128261 - BLOCK
      ?auto_128262 - BLOCK
      ?auto_128263 - BLOCK
    )
    :vars
    (
      ?auto_128264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128262 ) ( ON-TABLE ?auto_128261 ) ( ON ?auto_128262 ?auto_128261 ) ( not ( = ?auto_128261 ?auto_128262 ) ) ( not ( = ?auto_128261 ?auto_128263 ) ) ( not ( = ?auto_128262 ?auto_128263 ) ) ( ON ?auto_128263 ?auto_128264 ) ( CLEAR ?auto_128263 ) ( HAND-EMPTY ) ( not ( = ?auto_128261 ?auto_128264 ) ) ( not ( = ?auto_128262 ?auto_128264 ) ) ( not ( = ?auto_128263 ?auto_128264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128263 ?auto_128264 )
      ( MAKE-3PILE ?auto_128261 ?auto_128262 ?auto_128263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128265 - BLOCK
      ?auto_128266 - BLOCK
      ?auto_128267 - BLOCK
    )
    :vars
    (
      ?auto_128268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128265 ) ( not ( = ?auto_128265 ?auto_128266 ) ) ( not ( = ?auto_128265 ?auto_128267 ) ) ( not ( = ?auto_128266 ?auto_128267 ) ) ( ON ?auto_128267 ?auto_128268 ) ( CLEAR ?auto_128267 ) ( not ( = ?auto_128265 ?auto_128268 ) ) ( not ( = ?auto_128266 ?auto_128268 ) ) ( not ( = ?auto_128267 ?auto_128268 ) ) ( HOLDING ?auto_128266 ) ( CLEAR ?auto_128265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128265 ?auto_128266 )
      ( MAKE-3PILE ?auto_128265 ?auto_128266 ?auto_128267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128269 - BLOCK
      ?auto_128270 - BLOCK
      ?auto_128271 - BLOCK
    )
    :vars
    (
      ?auto_128272 - BLOCK
      ?auto_128275 - BLOCK
      ?auto_128273 - BLOCK
      ?auto_128276 - BLOCK
      ?auto_128274 - BLOCK
      ?auto_128277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128269 ) ( not ( = ?auto_128269 ?auto_128270 ) ) ( not ( = ?auto_128269 ?auto_128271 ) ) ( not ( = ?auto_128270 ?auto_128271 ) ) ( ON ?auto_128271 ?auto_128272 ) ( not ( = ?auto_128269 ?auto_128272 ) ) ( not ( = ?auto_128270 ?auto_128272 ) ) ( not ( = ?auto_128271 ?auto_128272 ) ) ( CLEAR ?auto_128269 ) ( ON ?auto_128270 ?auto_128271 ) ( CLEAR ?auto_128270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128275 ) ( ON ?auto_128273 ?auto_128275 ) ( ON ?auto_128276 ?auto_128273 ) ( ON ?auto_128274 ?auto_128276 ) ( ON ?auto_128277 ?auto_128274 ) ( ON ?auto_128272 ?auto_128277 ) ( not ( = ?auto_128275 ?auto_128273 ) ) ( not ( = ?auto_128275 ?auto_128276 ) ) ( not ( = ?auto_128275 ?auto_128274 ) ) ( not ( = ?auto_128275 ?auto_128277 ) ) ( not ( = ?auto_128275 ?auto_128272 ) ) ( not ( = ?auto_128275 ?auto_128271 ) ) ( not ( = ?auto_128275 ?auto_128270 ) ) ( not ( = ?auto_128273 ?auto_128276 ) ) ( not ( = ?auto_128273 ?auto_128274 ) ) ( not ( = ?auto_128273 ?auto_128277 ) ) ( not ( = ?auto_128273 ?auto_128272 ) ) ( not ( = ?auto_128273 ?auto_128271 ) ) ( not ( = ?auto_128273 ?auto_128270 ) ) ( not ( = ?auto_128276 ?auto_128274 ) ) ( not ( = ?auto_128276 ?auto_128277 ) ) ( not ( = ?auto_128276 ?auto_128272 ) ) ( not ( = ?auto_128276 ?auto_128271 ) ) ( not ( = ?auto_128276 ?auto_128270 ) ) ( not ( = ?auto_128274 ?auto_128277 ) ) ( not ( = ?auto_128274 ?auto_128272 ) ) ( not ( = ?auto_128274 ?auto_128271 ) ) ( not ( = ?auto_128274 ?auto_128270 ) ) ( not ( = ?auto_128277 ?auto_128272 ) ) ( not ( = ?auto_128277 ?auto_128271 ) ) ( not ( = ?auto_128277 ?auto_128270 ) ) ( not ( = ?auto_128269 ?auto_128275 ) ) ( not ( = ?auto_128269 ?auto_128273 ) ) ( not ( = ?auto_128269 ?auto_128276 ) ) ( not ( = ?auto_128269 ?auto_128274 ) ) ( not ( = ?auto_128269 ?auto_128277 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128275 ?auto_128273 ?auto_128276 ?auto_128274 ?auto_128277 ?auto_128272 ?auto_128271 )
      ( MAKE-3PILE ?auto_128269 ?auto_128270 ?auto_128271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128278 - BLOCK
      ?auto_128279 - BLOCK
      ?auto_128280 - BLOCK
    )
    :vars
    (
      ?auto_128284 - BLOCK
      ?auto_128285 - BLOCK
      ?auto_128281 - BLOCK
      ?auto_128282 - BLOCK
      ?auto_128283 - BLOCK
      ?auto_128286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128278 ?auto_128279 ) ) ( not ( = ?auto_128278 ?auto_128280 ) ) ( not ( = ?auto_128279 ?auto_128280 ) ) ( ON ?auto_128280 ?auto_128284 ) ( not ( = ?auto_128278 ?auto_128284 ) ) ( not ( = ?auto_128279 ?auto_128284 ) ) ( not ( = ?auto_128280 ?auto_128284 ) ) ( ON ?auto_128279 ?auto_128280 ) ( CLEAR ?auto_128279 ) ( ON-TABLE ?auto_128285 ) ( ON ?auto_128281 ?auto_128285 ) ( ON ?auto_128282 ?auto_128281 ) ( ON ?auto_128283 ?auto_128282 ) ( ON ?auto_128286 ?auto_128283 ) ( ON ?auto_128284 ?auto_128286 ) ( not ( = ?auto_128285 ?auto_128281 ) ) ( not ( = ?auto_128285 ?auto_128282 ) ) ( not ( = ?auto_128285 ?auto_128283 ) ) ( not ( = ?auto_128285 ?auto_128286 ) ) ( not ( = ?auto_128285 ?auto_128284 ) ) ( not ( = ?auto_128285 ?auto_128280 ) ) ( not ( = ?auto_128285 ?auto_128279 ) ) ( not ( = ?auto_128281 ?auto_128282 ) ) ( not ( = ?auto_128281 ?auto_128283 ) ) ( not ( = ?auto_128281 ?auto_128286 ) ) ( not ( = ?auto_128281 ?auto_128284 ) ) ( not ( = ?auto_128281 ?auto_128280 ) ) ( not ( = ?auto_128281 ?auto_128279 ) ) ( not ( = ?auto_128282 ?auto_128283 ) ) ( not ( = ?auto_128282 ?auto_128286 ) ) ( not ( = ?auto_128282 ?auto_128284 ) ) ( not ( = ?auto_128282 ?auto_128280 ) ) ( not ( = ?auto_128282 ?auto_128279 ) ) ( not ( = ?auto_128283 ?auto_128286 ) ) ( not ( = ?auto_128283 ?auto_128284 ) ) ( not ( = ?auto_128283 ?auto_128280 ) ) ( not ( = ?auto_128283 ?auto_128279 ) ) ( not ( = ?auto_128286 ?auto_128284 ) ) ( not ( = ?auto_128286 ?auto_128280 ) ) ( not ( = ?auto_128286 ?auto_128279 ) ) ( not ( = ?auto_128278 ?auto_128285 ) ) ( not ( = ?auto_128278 ?auto_128281 ) ) ( not ( = ?auto_128278 ?auto_128282 ) ) ( not ( = ?auto_128278 ?auto_128283 ) ) ( not ( = ?auto_128278 ?auto_128286 ) ) ( HOLDING ?auto_128278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128278 )
      ( MAKE-3PILE ?auto_128278 ?auto_128279 ?auto_128280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128287 - BLOCK
      ?auto_128288 - BLOCK
      ?auto_128289 - BLOCK
    )
    :vars
    (
      ?auto_128293 - BLOCK
      ?auto_128291 - BLOCK
      ?auto_128294 - BLOCK
      ?auto_128295 - BLOCK
      ?auto_128290 - BLOCK
      ?auto_128292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128287 ?auto_128288 ) ) ( not ( = ?auto_128287 ?auto_128289 ) ) ( not ( = ?auto_128288 ?auto_128289 ) ) ( ON ?auto_128289 ?auto_128293 ) ( not ( = ?auto_128287 ?auto_128293 ) ) ( not ( = ?auto_128288 ?auto_128293 ) ) ( not ( = ?auto_128289 ?auto_128293 ) ) ( ON ?auto_128288 ?auto_128289 ) ( ON-TABLE ?auto_128291 ) ( ON ?auto_128294 ?auto_128291 ) ( ON ?auto_128295 ?auto_128294 ) ( ON ?auto_128290 ?auto_128295 ) ( ON ?auto_128292 ?auto_128290 ) ( ON ?auto_128293 ?auto_128292 ) ( not ( = ?auto_128291 ?auto_128294 ) ) ( not ( = ?auto_128291 ?auto_128295 ) ) ( not ( = ?auto_128291 ?auto_128290 ) ) ( not ( = ?auto_128291 ?auto_128292 ) ) ( not ( = ?auto_128291 ?auto_128293 ) ) ( not ( = ?auto_128291 ?auto_128289 ) ) ( not ( = ?auto_128291 ?auto_128288 ) ) ( not ( = ?auto_128294 ?auto_128295 ) ) ( not ( = ?auto_128294 ?auto_128290 ) ) ( not ( = ?auto_128294 ?auto_128292 ) ) ( not ( = ?auto_128294 ?auto_128293 ) ) ( not ( = ?auto_128294 ?auto_128289 ) ) ( not ( = ?auto_128294 ?auto_128288 ) ) ( not ( = ?auto_128295 ?auto_128290 ) ) ( not ( = ?auto_128295 ?auto_128292 ) ) ( not ( = ?auto_128295 ?auto_128293 ) ) ( not ( = ?auto_128295 ?auto_128289 ) ) ( not ( = ?auto_128295 ?auto_128288 ) ) ( not ( = ?auto_128290 ?auto_128292 ) ) ( not ( = ?auto_128290 ?auto_128293 ) ) ( not ( = ?auto_128290 ?auto_128289 ) ) ( not ( = ?auto_128290 ?auto_128288 ) ) ( not ( = ?auto_128292 ?auto_128293 ) ) ( not ( = ?auto_128292 ?auto_128289 ) ) ( not ( = ?auto_128292 ?auto_128288 ) ) ( not ( = ?auto_128287 ?auto_128291 ) ) ( not ( = ?auto_128287 ?auto_128294 ) ) ( not ( = ?auto_128287 ?auto_128295 ) ) ( not ( = ?auto_128287 ?auto_128290 ) ) ( not ( = ?auto_128287 ?auto_128292 ) ) ( ON ?auto_128287 ?auto_128288 ) ( CLEAR ?auto_128287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128291 ?auto_128294 ?auto_128295 ?auto_128290 ?auto_128292 ?auto_128293 ?auto_128289 ?auto_128288 )
      ( MAKE-3PILE ?auto_128287 ?auto_128288 ?auto_128289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128301 - BLOCK
      ?auto_128302 - BLOCK
      ?auto_128303 - BLOCK
      ?auto_128304 - BLOCK
      ?auto_128305 - BLOCK
    )
    :vars
    (
      ?auto_128306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128306 ?auto_128305 ) ( CLEAR ?auto_128306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128301 ) ( ON ?auto_128302 ?auto_128301 ) ( ON ?auto_128303 ?auto_128302 ) ( ON ?auto_128304 ?auto_128303 ) ( ON ?auto_128305 ?auto_128304 ) ( not ( = ?auto_128301 ?auto_128302 ) ) ( not ( = ?auto_128301 ?auto_128303 ) ) ( not ( = ?auto_128301 ?auto_128304 ) ) ( not ( = ?auto_128301 ?auto_128305 ) ) ( not ( = ?auto_128301 ?auto_128306 ) ) ( not ( = ?auto_128302 ?auto_128303 ) ) ( not ( = ?auto_128302 ?auto_128304 ) ) ( not ( = ?auto_128302 ?auto_128305 ) ) ( not ( = ?auto_128302 ?auto_128306 ) ) ( not ( = ?auto_128303 ?auto_128304 ) ) ( not ( = ?auto_128303 ?auto_128305 ) ) ( not ( = ?auto_128303 ?auto_128306 ) ) ( not ( = ?auto_128304 ?auto_128305 ) ) ( not ( = ?auto_128304 ?auto_128306 ) ) ( not ( = ?auto_128305 ?auto_128306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128306 ?auto_128305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128307 - BLOCK
      ?auto_128308 - BLOCK
      ?auto_128309 - BLOCK
      ?auto_128310 - BLOCK
      ?auto_128311 - BLOCK
    )
    :vars
    (
      ?auto_128312 - BLOCK
      ?auto_128313 - BLOCK
      ?auto_128314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128312 ?auto_128311 ) ( CLEAR ?auto_128312 ) ( ON-TABLE ?auto_128307 ) ( ON ?auto_128308 ?auto_128307 ) ( ON ?auto_128309 ?auto_128308 ) ( ON ?auto_128310 ?auto_128309 ) ( ON ?auto_128311 ?auto_128310 ) ( not ( = ?auto_128307 ?auto_128308 ) ) ( not ( = ?auto_128307 ?auto_128309 ) ) ( not ( = ?auto_128307 ?auto_128310 ) ) ( not ( = ?auto_128307 ?auto_128311 ) ) ( not ( = ?auto_128307 ?auto_128312 ) ) ( not ( = ?auto_128308 ?auto_128309 ) ) ( not ( = ?auto_128308 ?auto_128310 ) ) ( not ( = ?auto_128308 ?auto_128311 ) ) ( not ( = ?auto_128308 ?auto_128312 ) ) ( not ( = ?auto_128309 ?auto_128310 ) ) ( not ( = ?auto_128309 ?auto_128311 ) ) ( not ( = ?auto_128309 ?auto_128312 ) ) ( not ( = ?auto_128310 ?auto_128311 ) ) ( not ( = ?auto_128310 ?auto_128312 ) ) ( not ( = ?auto_128311 ?auto_128312 ) ) ( HOLDING ?auto_128313 ) ( CLEAR ?auto_128314 ) ( not ( = ?auto_128307 ?auto_128313 ) ) ( not ( = ?auto_128307 ?auto_128314 ) ) ( not ( = ?auto_128308 ?auto_128313 ) ) ( not ( = ?auto_128308 ?auto_128314 ) ) ( not ( = ?auto_128309 ?auto_128313 ) ) ( not ( = ?auto_128309 ?auto_128314 ) ) ( not ( = ?auto_128310 ?auto_128313 ) ) ( not ( = ?auto_128310 ?auto_128314 ) ) ( not ( = ?auto_128311 ?auto_128313 ) ) ( not ( = ?auto_128311 ?auto_128314 ) ) ( not ( = ?auto_128312 ?auto_128313 ) ) ( not ( = ?auto_128312 ?auto_128314 ) ) ( not ( = ?auto_128313 ?auto_128314 ) ) )
    :subtasks
    ( ( !STACK ?auto_128313 ?auto_128314 )
      ( MAKE-5PILE ?auto_128307 ?auto_128308 ?auto_128309 ?auto_128310 ?auto_128311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128315 - BLOCK
      ?auto_128316 - BLOCK
      ?auto_128317 - BLOCK
      ?auto_128318 - BLOCK
      ?auto_128319 - BLOCK
    )
    :vars
    (
      ?auto_128322 - BLOCK
      ?auto_128321 - BLOCK
      ?auto_128320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128322 ?auto_128319 ) ( ON-TABLE ?auto_128315 ) ( ON ?auto_128316 ?auto_128315 ) ( ON ?auto_128317 ?auto_128316 ) ( ON ?auto_128318 ?auto_128317 ) ( ON ?auto_128319 ?auto_128318 ) ( not ( = ?auto_128315 ?auto_128316 ) ) ( not ( = ?auto_128315 ?auto_128317 ) ) ( not ( = ?auto_128315 ?auto_128318 ) ) ( not ( = ?auto_128315 ?auto_128319 ) ) ( not ( = ?auto_128315 ?auto_128322 ) ) ( not ( = ?auto_128316 ?auto_128317 ) ) ( not ( = ?auto_128316 ?auto_128318 ) ) ( not ( = ?auto_128316 ?auto_128319 ) ) ( not ( = ?auto_128316 ?auto_128322 ) ) ( not ( = ?auto_128317 ?auto_128318 ) ) ( not ( = ?auto_128317 ?auto_128319 ) ) ( not ( = ?auto_128317 ?auto_128322 ) ) ( not ( = ?auto_128318 ?auto_128319 ) ) ( not ( = ?auto_128318 ?auto_128322 ) ) ( not ( = ?auto_128319 ?auto_128322 ) ) ( CLEAR ?auto_128321 ) ( not ( = ?auto_128315 ?auto_128320 ) ) ( not ( = ?auto_128315 ?auto_128321 ) ) ( not ( = ?auto_128316 ?auto_128320 ) ) ( not ( = ?auto_128316 ?auto_128321 ) ) ( not ( = ?auto_128317 ?auto_128320 ) ) ( not ( = ?auto_128317 ?auto_128321 ) ) ( not ( = ?auto_128318 ?auto_128320 ) ) ( not ( = ?auto_128318 ?auto_128321 ) ) ( not ( = ?auto_128319 ?auto_128320 ) ) ( not ( = ?auto_128319 ?auto_128321 ) ) ( not ( = ?auto_128322 ?auto_128320 ) ) ( not ( = ?auto_128322 ?auto_128321 ) ) ( not ( = ?auto_128320 ?auto_128321 ) ) ( ON ?auto_128320 ?auto_128322 ) ( CLEAR ?auto_128320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128315 ?auto_128316 ?auto_128317 ?auto_128318 ?auto_128319 ?auto_128322 )
      ( MAKE-5PILE ?auto_128315 ?auto_128316 ?auto_128317 ?auto_128318 ?auto_128319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128323 - BLOCK
      ?auto_128324 - BLOCK
      ?auto_128325 - BLOCK
      ?auto_128326 - BLOCK
      ?auto_128327 - BLOCK
    )
    :vars
    (
      ?auto_128328 - BLOCK
      ?auto_128330 - BLOCK
      ?auto_128329 - BLOCK
      ?auto_128331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128328 ?auto_128327 ) ( ON-TABLE ?auto_128323 ) ( ON ?auto_128324 ?auto_128323 ) ( ON ?auto_128325 ?auto_128324 ) ( ON ?auto_128326 ?auto_128325 ) ( ON ?auto_128327 ?auto_128326 ) ( not ( = ?auto_128323 ?auto_128324 ) ) ( not ( = ?auto_128323 ?auto_128325 ) ) ( not ( = ?auto_128323 ?auto_128326 ) ) ( not ( = ?auto_128323 ?auto_128327 ) ) ( not ( = ?auto_128323 ?auto_128328 ) ) ( not ( = ?auto_128324 ?auto_128325 ) ) ( not ( = ?auto_128324 ?auto_128326 ) ) ( not ( = ?auto_128324 ?auto_128327 ) ) ( not ( = ?auto_128324 ?auto_128328 ) ) ( not ( = ?auto_128325 ?auto_128326 ) ) ( not ( = ?auto_128325 ?auto_128327 ) ) ( not ( = ?auto_128325 ?auto_128328 ) ) ( not ( = ?auto_128326 ?auto_128327 ) ) ( not ( = ?auto_128326 ?auto_128328 ) ) ( not ( = ?auto_128327 ?auto_128328 ) ) ( not ( = ?auto_128323 ?auto_128330 ) ) ( not ( = ?auto_128323 ?auto_128329 ) ) ( not ( = ?auto_128324 ?auto_128330 ) ) ( not ( = ?auto_128324 ?auto_128329 ) ) ( not ( = ?auto_128325 ?auto_128330 ) ) ( not ( = ?auto_128325 ?auto_128329 ) ) ( not ( = ?auto_128326 ?auto_128330 ) ) ( not ( = ?auto_128326 ?auto_128329 ) ) ( not ( = ?auto_128327 ?auto_128330 ) ) ( not ( = ?auto_128327 ?auto_128329 ) ) ( not ( = ?auto_128328 ?auto_128330 ) ) ( not ( = ?auto_128328 ?auto_128329 ) ) ( not ( = ?auto_128330 ?auto_128329 ) ) ( ON ?auto_128330 ?auto_128328 ) ( CLEAR ?auto_128330 ) ( HOLDING ?auto_128329 ) ( CLEAR ?auto_128331 ) ( ON-TABLE ?auto_128331 ) ( not ( = ?auto_128331 ?auto_128329 ) ) ( not ( = ?auto_128323 ?auto_128331 ) ) ( not ( = ?auto_128324 ?auto_128331 ) ) ( not ( = ?auto_128325 ?auto_128331 ) ) ( not ( = ?auto_128326 ?auto_128331 ) ) ( not ( = ?auto_128327 ?auto_128331 ) ) ( not ( = ?auto_128328 ?auto_128331 ) ) ( not ( = ?auto_128330 ?auto_128331 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128331 ?auto_128329 )
      ( MAKE-5PILE ?auto_128323 ?auto_128324 ?auto_128325 ?auto_128326 ?auto_128327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129851 - BLOCK
      ?auto_129852 - BLOCK
      ?auto_129853 - BLOCK
      ?auto_129854 - BLOCK
      ?auto_129855 - BLOCK
    )
    :vars
    (
      ?auto_129856 - BLOCK
      ?auto_129858 - BLOCK
      ?auto_129857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129856 ?auto_129855 ) ( ON-TABLE ?auto_129851 ) ( ON ?auto_129852 ?auto_129851 ) ( ON ?auto_129853 ?auto_129852 ) ( ON ?auto_129854 ?auto_129853 ) ( ON ?auto_129855 ?auto_129854 ) ( not ( = ?auto_129851 ?auto_129852 ) ) ( not ( = ?auto_129851 ?auto_129853 ) ) ( not ( = ?auto_129851 ?auto_129854 ) ) ( not ( = ?auto_129851 ?auto_129855 ) ) ( not ( = ?auto_129851 ?auto_129856 ) ) ( not ( = ?auto_129852 ?auto_129853 ) ) ( not ( = ?auto_129852 ?auto_129854 ) ) ( not ( = ?auto_129852 ?auto_129855 ) ) ( not ( = ?auto_129852 ?auto_129856 ) ) ( not ( = ?auto_129853 ?auto_129854 ) ) ( not ( = ?auto_129853 ?auto_129855 ) ) ( not ( = ?auto_129853 ?auto_129856 ) ) ( not ( = ?auto_129854 ?auto_129855 ) ) ( not ( = ?auto_129854 ?auto_129856 ) ) ( not ( = ?auto_129855 ?auto_129856 ) ) ( not ( = ?auto_129851 ?auto_129858 ) ) ( not ( = ?auto_129851 ?auto_129857 ) ) ( not ( = ?auto_129852 ?auto_129858 ) ) ( not ( = ?auto_129852 ?auto_129857 ) ) ( not ( = ?auto_129853 ?auto_129858 ) ) ( not ( = ?auto_129853 ?auto_129857 ) ) ( not ( = ?auto_129854 ?auto_129858 ) ) ( not ( = ?auto_129854 ?auto_129857 ) ) ( not ( = ?auto_129855 ?auto_129858 ) ) ( not ( = ?auto_129855 ?auto_129857 ) ) ( not ( = ?auto_129856 ?auto_129858 ) ) ( not ( = ?auto_129856 ?auto_129857 ) ) ( not ( = ?auto_129858 ?auto_129857 ) ) ( ON ?auto_129858 ?auto_129856 ) ( ON ?auto_129857 ?auto_129858 ) ( CLEAR ?auto_129857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129851 ?auto_129852 ?auto_129853 ?auto_129854 ?auto_129855 ?auto_129856 ?auto_129858 )
      ( MAKE-5PILE ?auto_129851 ?auto_129852 ?auto_129853 ?auto_129854 ?auto_129855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128341 - BLOCK
      ?auto_128342 - BLOCK
      ?auto_128343 - BLOCK
      ?auto_128344 - BLOCK
      ?auto_128345 - BLOCK
    )
    :vars
    (
      ?auto_128346 - BLOCK
      ?auto_128349 - BLOCK
      ?auto_128348 - BLOCK
      ?auto_128347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128346 ?auto_128345 ) ( ON-TABLE ?auto_128341 ) ( ON ?auto_128342 ?auto_128341 ) ( ON ?auto_128343 ?auto_128342 ) ( ON ?auto_128344 ?auto_128343 ) ( ON ?auto_128345 ?auto_128344 ) ( not ( = ?auto_128341 ?auto_128342 ) ) ( not ( = ?auto_128341 ?auto_128343 ) ) ( not ( = ?auto_128341 ?auto_128344 ) ) ( not ( = ?auto_128341 ?auto_128345 ) ) ( not ( = ?auto_128341 ?auto_128346 ) ) ( not ( = ?auto_128342 ?auto_128343 ) ) ( not ( = ?auto_128342 ?auto_128344 ) ) ( not ( = ?auto_128342 ?auto_128345 ) ) ( not ( = ?auto_128342 ?auto_128346 ) ) ( not ( = ?auto_128343 ?auto_128344 ) ) ( not ( = ?auto_128343 ?auto_128345 ) ) ( not ( = ?auto_128343 ?auto_128346 ) ) ( not ( = ?auto_128344 ?auto_128345 ) ) ( not ( = ?auto_128344 ?auto_128346 ) ) ( not ( = ?auto_128345 ?auto_128346 ) ) ( not ( = ?auto_128341 ?auto_128349 ) ) ( not ( = ?auto_128341 ?auto_128348 ) ) ( not ( = ?auto_128342 ?auto_128349 ) ) ( not ( = ?auto_128342 ?auto_128348 ) ) ( not ( = ?auto_128343 ?auto_128349 ) ) ( not ( = ?auto_128343 ?auto_128348 ) ) ( not ( = ?auto_128344 ?auto_128349 ) ) ( not ( = ?auto_128344 ?auto_128348 ) ) ( not ( = ?auto_128345 ?auto_128349 ) ) ( not ( = ?auto_128345 ?auto_128348 ) ) ( not ( = ?auto_128346 ?auto_128349 ) ) ( not ( = ?auto_128346 ?auto_128348 ) ) ( not ( = ?auto_128349 ?auto_128348 ) ) ( ON ?auto_128349 ?auto_128346 ) ( not ( = ?auto_128347 ?auto_128348 ) ) ( not ( = ?auto_128341 ?auto_128347 ) ) ( not ( = ?auto_128342 ?auto_128347 ) ) ( not ( = ?auto_128343 ?auto_128347 ) ) ( not ( = ?auto_128344 ?auto_128347 ) ) ( not ( = ?auto_128345 ?auto_128347 ) ) ( not ( = ?auto_128346 ?auto_128347 ) ) ( not ( = ?auto_128349 ?auto_128347 ) ) ( ON ?auto_128348 ?auto_128349 ) ( CLEAR ?auto_128348 ) ( HOLDING ?auto_128347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128347 )
      ( MAKE-5PILE ?auto_128341 ?auto_128342 ?auto_128343 ?auto_128344 ?auto_128345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128350 - BLOCK
      ?auto_128351 - BLOCK
      ?auto_128352 - BLOCK
      ?auto_128353 - BLOCK
      ?auto_128354 - BLOCK
    )
    :vars
    (
      ?auto_128355 - BLOCK
      ?auto_128358 - BLOCK
      ?auto_128357 - BLOCK
      ?auto_128356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128355 ?auto_128354 ) ( ON-TABLE ?auto_128350 ) ( ON ?auto_128351 ?auto_128350 ) ( ON ?auto_128352 ?auto_128351 ) ( ON ?auto_128353 ?auto_128352 ) ( ON ?auto_128354 ?auto_128353 ) ( not ( = ?auto_128350 ?auto_128351 ) ) ( not ( = ?auto_128350 ?auto_128352 ) ) ( not ( = ?auto_128350 ?auto_128353 ) ) ( not ( = ?auto_128350 ?auto_128354 ) ) ( not ( = ?auto_128350 ?auto_128355 ) ) ( not ( = ?auto_128351 ?auto_128352 ) ) ( not ( = ?auto_128351 ?auto_128353 ) ) ( not ( = ?auto_128351 ?auto_128354 ) ) ( not ( = ?auto_128351 ?auto_128355 ) ) ( not ( = ?auto_128352 ?auto_128353 ) ) ( not ( = ?auto_128352 ?auto_128354 ) ) ( not ( = ?auto_128352 ?auto_128355 ) ) ( not ( = ?auto_128353 ?auto_128354 ) ) ( not ( = ?auto_128353 ?auto_128355 ) ) ( not ( = ?auto_128354 ?auto_128355 ) ) ( not ( = ?auto_128350 ?auto_128358 ) ) ( not ( = ?auto_128350 ?auto_128357 ) ) ( not ( = ?auto_128351 ?auto_128358 ) ) ( not ( = ?auto_128351 ?auto_128357 ) ) ( not ( = ?auto_128352 ?auto_128358 ) ) ( not ( = ?auto_128352 ?auto_128357 ) ) ( not ( = ?auto_128353 ?auto_128358 ) ) ( not ( = ?auto_128353 ?auto_128357 ) ) ( not ( = ?auto_128354 ?auto_128358 ) ) ( not ( = ?auto_128354 ?auto_128357 ) ) ( not ( = ?auto_128355 ?auto_128358 ) ) ( not ( = ?auto_128355 ?auto_128357 ) ) ( not ( = ?auto_128358 ?auto_128357 ) ) ( ON ?auto_128358 ?auto_128355 ) ( not ( = ?auto_128356 ?auto_128357 ) ) ( not ( = ?auto_128350 ?auto_128356 ) ) ( not ( = ?auto_128351 ?auto_128356 ) ) ( not ( = ?auto_128352 ?auto_128356 ) ) ( not ( = ?auto_128353 ?auto_128356 ) ) ( not ( = ?auto_128354 ?auto_128356 ) ) ( not ( = ?auto_128355 ?auto_128356 ) ) ( not ( = ?auto_128358 ?auto_128356 ) ) ( ON ?auto_128357 ?auto_128358 ) ( ON ?auto_128356 ?auto_128357 ) ( CLEAR ?auto_128356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128350 ?auto_128351 ?auto_128352 ?auto_128353 ?auto_128354 ?auto_128355 ?auto_128358 ?auto_128357 )
      ( MAKE-5PILE ?auto_128350 ?auto_128351 ?auto_128352 ?auto_128353 ?auto_128354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128363 - BLOCK
      ?auto_128364 - BLOCK
      ?auto_128365 - BLOCK
      ?auto_128366 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128366 ) ( CLEAR ?auto_128365 ) ( ON-TABLE ?auto_128363 ) ( ON ?auto_128364 ?auto_128363 ) ( ON ?auto_128365 ?auto_128364 ) ( not ( = ?auto_128363 ?auto_128364 ) ) ( not ( = ?auto_128363 ?auto_128365 ) ) ( not ( = ?auto_128363 ?auto_128366 ) ) ( not ( = ?auto_128364 ?auto_128365 ) ) ( not ( = ?auto_128364 ?auto_128366 ) ) ( not ( = ?auto_128365 ?auto_128366 ) ) )
    :subtasks
    ( ( !STACK ?auto_128366 ?auto_128365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128367 - BLOCK
      ?auto_128368 - BLOCK
      ?auto_128369 - BLOCK
      ?auto_128370 - BLOCK
    )
    :vars
    (
      ?auto_128371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128369 ) ( ON-TABLE ?auto_128367 ) ( ON ?auto_128368 ?auto_128367 ) ( ON ?auto_128369 ?auto_128368 ) ( not ( = ?auto_128367 ?auto_128368 ) ) ( not ( = ?auto_128367 ?auto_128369 ) ) ( not ( = ?auto_128367 ?auto_128370 ) ) ( not ( = ?auto_128368 ?auto_128369 ) ) ( not ( = ?auto_128368 ?auto_128370 ) ) ( not ( = ?auto_128369 ?auto_128370 ) ) ( ON ?auto_128370 ?auto_128371 ) ( CLEAR ?auto_128370 ) ( HAND-EMPTY ) ( not ( = ?auto_128367 ?auto_128371 ) ) ( not ( = ?auto_128368 ?auto_128371 ) ) ( not ( = ?auto_128369 ?auto_128371 ) ) ( not ( = ?auto_128370 ?auto_128371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128370 ?auto_128371 )
      ( MAKE-4PILE ?auto_128367 ?auto_128368 ?auto_128369 ?auto_128370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128372 - BLOCK
      ?auto_128373 - BLOCK
      ?auto_128374 - BLOCK
      ?auto_128375 - BLOCK
    )
    :vars
    (
      ?auto_128376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128372 ) ( ON ?auto_128373 ?auto_128372 ) ( not ( = ?auto_128372 ?auto_128373 ) ) ( not ( = ?auto_128372 ?auto_128374 ) ) ( not ( = ?auto_128372 ?auto_128375 ) ) ( not ( = ?auto_128373 ?auto_128374 ) ) ( not ( = ?auto_128373 ?auto_128375 ) ) ( not ( = ?auto_128374 ?auto_128375 ) ) ( ON ?auto_128375 ?auto_128376 ) ( CLEAR ?auto_128375 ) ( not ( = ?auto_128372 ?auto_128376 ) ) ( not ( = ?auto_128373 ?auto_128376 ) ) ( not ( = ?auto_128374 ?auto_128376 ) ) ( not ( = ?auto_128375 ?auto_128376 ) ) ( HOLDING ?auto_128374 ) ( CLEAR ?auto_128373 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128372 ?auto_128373 ?auto_128374 )
      ( MAKE-4PILE ?auto_128372 ?auto_128373 ?auto_128374 ?auto_128375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128377 - BLOCK
      ?auto_128378 - BLOCK
      ?auto_128379 - BLOCK
      ?auto_128380 - BLOCK
    )
    :vars
    (
      ?auto_128381 - BLOCK
      ?auto_128385 - BLOCK
      ?auto_128382 - BLOCK
      ?auto_128383 - BLOCK
      ?auto_128384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128377 ) ( ON ?auto_128378 ?auto_128377 ) ( not ( = ?auto_128377 ?auto_128378 ) ) ( not ( = ?auto_128377 ?auto_128379 ) ) ( not ( = ?auto_128377 ?auto_128380 ) ) ( not ( = ?auto_128378 ?auto_128379 ) ) ( not ( = ?auto_128378 ?auto_128380 ) ) ( not ( = ?auto_128379 ?auto_128380 ) ) ( ON ?auto_128380 ?auto_128381 ) ( not ( = ?auto_128377 ?auto_128381 ) ) ( not ( = ?auto_128378 ?auto_128381 ) ) ( not ( = ?auto_128379 ?auto_128381 ) ) ( not ( = ?auto_128380 ?auto_128381 ) ) ( CLEAR ?auto_128378 ) ( ON ?auto_128379 ?auto_128380 ) ( CLEAR ?auto_128379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128385 ) ( ON ?auto_128382 ?auto_128385 ) ( ON ?auto_128383 ?auto_128382 ) ( ON ?auto_128384 ?auto_128383 ) ( ON ?auto_128381 ?auto_128384 ) ( not ( = ?auto_128385 ?auto_128382 ) ) ( not ( = ?auto_128385 ?auto_128383 ) ) ( not ( = ?auto_128385 ?auto_128384 ) ) ( not ( = ?auto_128385 ?auto_128381 ) ) ( not ( = ?auto_128385 ?auto_128380 ) ) ( not ( = ?auto_128385 ?auto_128379 ) ) ( not ( = ?auto_128382 ?auto_128383 ) ) ( not ( = ?auto_128382 ?auto_128384 ) ) ( not ( = ?auto_128382 ?auto_128381 ) ) ( not ( = ?auto_128382 ?auto_128380 ) ) ( not ( = ?auto_128382 ?auto_128379 ) ) ( not ( = ?auto_128383 ?auto_128384 ) ) ( not ( = ?auto_128383 ?auto_128381 ) ) ( not ( = ?auto_128383 ?auto_128380 ) ) ( not ( = ?auto_128383 ?auto_128379 ) ) ( not ( = ?auto_128384 ?auto_128381 ) ) ( not ( = ?auto_128384 ?auto_128380 ) ) ( not ( = ?auto_128384 ?auto_128379 ) ) ( not ( = ?auto_128377 ?auto_128385 ) ) ( not ( = ?auto_128377 ?auto_128382 ) ) ( not ( = ?auto_128377 ?auto_128383 ) ) ( not ( = ?auto_128377 ?auto_128384 ) ) ( not ( = ?auto_128378 ?auto_128385 ) ) ( not ( = ?auto_128378 ?auto_128382 ) ) ( not ( = ?auto_128378 ?auto_128383 ) ) ( not ( = ?auto_128378 ?auto_128384 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128385 ?auto_128382 ?auto_128383 ?auto_128384 ?auto_128381 ?auto_128380 )
      ( MAKE-4PILE ?auto_128377 ?auto_128378 ?auto_128379 ?auto_128380 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128386 - BLOCK
      ?auto_128387 - BLOCK
      ?auto_128388 - BLOCK
      ?auto_128389 - BLOCK
    )
    :vars
    (
      ?auto_128393 - BLOCK
      ?auto_128394 - BLOCK
      ?auto_128392 - BLOCK
      ?auto_128391 - BLOCK
      ?auto_128390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128386 ) ( not ( = ?auto_128386 ?auto_128387 ) ) ( not ( = ?auto_128386 ?auto_128388 ) ) ( not ( = ?auto_128386 ?auto_128389 ) ) ( not ( = ?auto_128387 ?auto_128388 ) ) ( not ( = ?auto_128387 ?auto_128389 ) ) ( not ( = ?auto_128388 ?auto_128389 ) ) ( ON ?auto_128389 ?auto_128393 ) ( not ( = ?auto_128386 ?auto_128393 ) ) ( not ( = ?auto_128387 ?auto_128393 ) ) ( not ( = ?auto_128388 ?auto_128393 ) ) ( not ( = ?auto_128389 ?auto_128393 ) ) ( ON ?auto_128388 ?auto_128389 ) ( CLEAR ?auto_128388 ) ( ON-TABLE ?auto_128394 ) ( ON ?auto_128392 ?auto_128394 ) ( ON ?auto_128391 ?auto_128392 ) ( ON ?auto_128390 ?auto_128391 ) ( ON ?auto_128393 ?auto_128390 ) ( not ( = ?auto_128394 ?auto_128392 ) ) ( not ( = ?auto_128394 ?auto_128391 ) ) ( not ( = ?auto_128394 ?auto_128390 ) ) ( not ( = ?auto_128394 ?auto_128393 ) ) ( not ( = ?auto_128394 ?auto_128389 ) ) ( not ( = ?auto_128394 ?auto_128388 ) ) ( not ( = ?auto_128392 ?auto_128391 ) ) ( not ( = ?auto_128392 ?auto_128390 ) ) ( not ( = ?auto_128392 ?auto_128393 ) ) ( not ( = ?auto_128392 ?auto_128389 ) ) ( not ( = ?auto_128392 ?auto_128388 ) ) ( not ( = ?auto_128391 ?auto_128390 ) ) ( not ( = ?auto_128391 ?auto_128393 ) ) ( not ( = ?auto_128391 ?auto_128389 ) ) ( not ( = ?auto_128391 ?auto_128388 ) ) ( not ( = ?auto_128390 ?auto_128393 ) ) ( not ( = ?auto_128390 ?auto_128389 ) ) ( not ( = ?auto_128390 ?auto_128388 ) ) ( not ( = ?auto_128386 ?auto_128394 ) ) ( not ( = ?auto_128386 ?auto_128392 ) ) ( not ( = ?auto_128386 ?auto_128391 ) ) ( not ( = ?auto_128386 ?auto_128390 ) ) ( not ( = ?auto_128387 ?auto_128394 ) ) ( not ( = ?auto_128387 ?auto_128392 ) ) ( not ( = ?auto_128387 ?auto_128391 ) ) ( not ( = ?auto_128387 ?auto_128390 ) ) ( HOLDING ?auto_128387 ) ( CLEAR ?auto_128386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128386 ?auto_128387 )
      ( MAKE-4PILE ?auto_128386 ?auto_128387 ?auto_128388 ?auto_128389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128395 - BLOCK
      ?auto_128396 - BLOCK
      ?auto_128397 - BLOCK
      ?auto_128398 - BLOCK
    )
    :vars
    (
      ?auto_128401 - BLOCK
      ?auto_128402 - BLOCK
      ?auto_128403 - BLOCK
      ?auto_128400 - BLOCK
      ?auto_128399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128395 ) ( not ( = ?auto_128395 ?auto_128396 ) ) ( not ( = ?auto_128395 ?auto_128397 ) ) ( not ( = ?auto_128395 ?auto_128398 ) ) ( not ( = ?auto_128396 ?auto_128397 ) ) ( not ( = ?auto_128396 ?auto_128398 ) ) ( not ( = ?auto_128397 ?auto_128398 ) ) ( ON ?auto_128398 ?auto_128401 ) ( not ( = ?auto_128395 ?auto_128401 ) ) ( not ( = ?auto_128396 ?auto_128401 ) ) ( not ( = ?auto_128397 ?auto_128401 ) ) ( not ( = ?auto_128398 ?auto_128401 ) ) ( ON ?auto_128397 ?auto_128398 ) ( ON-TABLE ?auto_128402 ) ( ON ?auto_128403 ?auto_128402 ) ( ON ?auto_128400 ?auto_128403 ) ( ON ?auto_128399 ?auto_128400 ) ( ON ?auto_128401 ?auto_128399 ) ( not ( = ?auto_128402 ?auto_128403 ) ) ( not ( = ?auto_128402 ?auto_128400 ) ) ( not ( = ?auto_128402 ?auto_128399 ) ) ( not ( = ?auto_128402 ?auto_128401 ) ) ( not ( = ?auto_128402 ?auto_128398 ) ) ( not ( = ?auto_128402 ?auto_128397 ) ) ( not ( = ?auto_128403 ?auto_128400 ) ) ( not ( = ?auto_128403 ?auto_128399 ) ) ( not ( = ?auto_128403 ?auto_128401 ) ) ( not ( = ?auto_128403 ?auto_128398 ) ) ( not ( = ?auto_128403 ?auto_128397 ) ) ( not ( = ?auto_128400 ?auto_128399 ) ) ( not ( = ?auto_128400 ?auto_128401 ) ) ( not ( = ?auto_128400 ?auto_128398 ) ) ( not ( = ?auto_128400 ?auto_128397 ) ) ( not ( = ?auto_128399 ?auto_128401 ) ) ( not ( = ?auto_128399 ?auto_128398 ) ) ( not ( = ?auto_128399 ?auto_128397 ) ) ( not ( = ?auto_128395 ?auto_128402 ) ) ( not ( = ?auto_128395 ?auto_128403 ) ) ( not ( = ?auto_128395 ?auto_128400 ) ) ( not ( = ?auto_128395 ?auto_128399 ) ) ( not ( = ?auto_128396 ?auto_128402 ) ) ( not ( = ?auto_128396 ?auto_128403 ) ) ( not ( = ?auto_128396 ?auto_128400 ) ) ( not ( = ?auto_128396 ?auto_128399 ) ) ( CLEAR ?auto_128395 ) ( ON ?auto_128396 ?auto_128397 ) ( CLEAR ?auto_128396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128402 ?auto_128403 ?auto_128400 ?auto_128399 ?auto_128401 ?auto_128398 ?auto_128397 )
      ( MAKE-4PILE ?auto_128395 ?auto_128396 ?auto_128397 ?auto_128398 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128404 - BLOCK
      ?auto_128405 - BLOCK
      ?auto_128406 - BLOCK
      ?auto_128407 - BLOCK
    )
    :vars
    (
      ?auto_128409 - BLOCK
      ?auto_128412 - BLOCK
      ?auto_128410 - BLOCK
      ?auto_128411 - BLOCK
      ?auto_128408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128404 ?auto_128405 ) ) ( not ( = ?auto_128404 ?auto_128406 ) ) ( not ( = ?auto_128404 ?auto_128407 ) ) ( not ( = ?auto_128405 ?auto_128406 ) ) ( not ( = ?auto_128405 ?auto_128407 ) ) ( not ( = ?auto_128406 ?auto_128407 ) ) ( ON ?auto_128407 ?auto_128409 ) ( not ( = ?auto_128404 ?auto_128409 ) ) ( not ( = ?auto_128405 ?auto_128409 ) ) ( not ( = ?auto_128406 ?auto_128409 ) ) ( not ( = ?auto_128407 ?auto_128409 ) ) ( ON ?auto_128406 ?auto_128407 ) ( ON-TABLE ?auto_128412 ) ( ON ?auto_128410 ?auto_128412 ) ( ON ?auto_128411 ?auto_128410 ) ( ON ?auto_128408 ?auto_128411 ) ( ON ?auto_128409 ?auto_128408 ) ( not ( = ?auto_128412 ?auto_128410 ) ) ( not ( = ?auto_128412 ?auto_128411 ) ) ( not ( = ?auto_128412 ?auto_128408 ) ) ( not ( = ?auto_128412 ?auto_128409 ) ) ( not ( = ?auto_128412 ?auto_128407 ) ) ( not ( = ?auto_128412 ?auto_128406 ) ) ( not ( = ?auto_128410 ?auto_128411 ) ) ( not ( = ?auto_128410 ?auto_128408 ) ) ( not ( = ?auto_128410 ?auto_128409 ) ) ( not ( = ?auto_128410 ?auto_128407 ) ) ( not ( = ?auto_128410 ?auto_128406 ) ) ( not ( = ?auto_128411 ?auto_128408 ) ) ( not ( = ?auto_128411 ?auto_128409 ) ) ( not ( = ?auto_128411 ?auto_128407 ) ) ( not ( = ?auto_128411 ?auto_128406 ) ) ( not ( = ?auto_128408 ?auto_128409 ) ) ( not ( = ?auto_128408 ?auto_128407 ) ) ( not ( = ?auto_128408 ?auto_128406 ) ) ( not ( = ?auto_128404 ?auto_128412 ) ) ( not ( = ?auto_128404 ?auto_128410 ) ) ( not ( = ?auto_128404 ?auto_128411 ) ) ( not ( = ?auto_128404 ?auto_128408 ) ) ( not ( = ?auto_128405 ?auto_128412 ) ) ( not ( = ?auto_128405 ?auto_128410 ) ) ( not ( = ?auto_128405 ?auto_128411 ) ) ( not ( = ?auto_128405 ?auto_128408 ) ) ( ON ?auto_128405 ?auto_128406 ) ( CLEAR ?auto_128405 ) ( HOLDING ?auto_128404 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128404 )
      ( MAKE-4PILE ?auto_128404 ?auto_128405 ?auto_128406 ?auto_128407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128413 - BLOCK
      ?auto_128414 - BLOCK
      ?auto_128415 - BLOCK
      ?auto_128416 - BLOCK
    )
    :vars
    (
      ?auto_128419 - BLOCK
      ?auto_128418 - BLOCK
      ?auto_128417 - BLOCK
      ?auto_128421 - BLOCK
      ?auto_128420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128413 ?auto_128414 ) ) ( not ( = ?auto_128413 ?auto_128415 ) ) ( not ( = ?auto_128413 ?auto_128416 ) ) ( not ( = ?auto_128414 ?auto_128415 ) ) ( not ( = ?auto_128414 ?auto_128416 ) ) ( not ( = ?auto_128415 ?auto_128416 ) ) ( ON ?auto_128416 ?auto_128419 ) ( not ( = ?auto_128413 ?auto_128419 ) ) ( not ( = ?auto_128414 ?auto_128419 ) ) ( not ( = ?auto_128415 ?auto_128419 ) ) ( not ( = ?auto_128416 ?auto_128419 ) ) ( ON ?auto_128415 ?auto_128416 ) ( ON-TABLE ?auto_128418 ) ( ON ?auto_128417 ?auto_128418 ) ( ON ?auto_128421 ?auto_128417 ) ( ON ?auto_128420 ?auto_128421 ) ( ON ?auto_128419 ?auto_128420 ) ( not ( = ?auto_128418 ?auto_128417 ) ) ( not ( = ?auto_128418 ?auto_128421 ) ) ( not ( = ?auto_128418 ?auto_128420 ) ) ( not ( = ?auto_128418 ?auto_128419 ) ) ( not ( = ?auto_128418 ?auto_128416 ) ) ( not ( = ?auto_128418 ?auto_128415 ) ) ( not ( = ?auto_128417 ?auto_128421 ) ) ( not ( = ?auto_128417 ?auto_128420 ) ) ( not ( = ?auto_128417 ?auto_128419 ) ) ( not ( = ?auto_128417 ?auto_128416 ) ) ( not ( = ?auto_128417 ?auto_128415 ) ) ( not ( = ?auto_128421 ?auto_128420 ) ) ( not ( = ?auto_128421 ?auto_128419 ) ) ( not ( = ?auto_128421 ?auto_128416 ) ) ( not ( = ?auto_128421 ?auto_128415 ) ) ( not ( = ?auto_128420 ?auto_128419 ) ) ( not ( = ?auto_128420 ?auto_128416 ) ) ( not ( = ?auto_128420 ?auto_128415 ) ) ( not ( = ?auto_128413 ?auto_128418 ) ) ( not ( = ?auto_128413 ?auto_128417 ) ) ( not ( = ?auto_128413 ?auto_128421 ) ) ( not ( = ?auto_128413 ?auto_128420 ) ) ( not ( = ?auto_128414 ?auto_128418 ) ) ( not ( = ?auto_128414 ?auto_128417 ) ) ( not ( = ?auto_128414 ?auto_128421 ) ) ( not ( = ?auto_128414 ?auto_128420 ) ) ( ON ?auto_128414 ?auto_128415 ) ( ON ?auto_128413 ?auto_128414 ) ( CLEAR ?auto_128413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128418 ?auto_128417 ?auto_128421 ?auto_128420 ?auto_128419 ?auto_128416 ?auto_128415 ?auto_128414 )
      ( MAKE-4PILE ?auto_128413 ?auto_128414 ?auto_128415 ?auto_128416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128426 - BLOCK
      ?auto_128427 - BLOCK
      ?auto_128428 - BLOCK
      ?auto_128429 - BLOCK
    )
    :vars
    (
      ?auto_128430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128430 ?auto_128429 ) ( CLEAR ?auto_128430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128426 ) ( ON ?auto_128427 ?auto_128426 ) ( ON ?auto_128428 ?auto_128427 ) ( ON ?auto_128429 ?auto_128428 ) ( not ( = ?auto_128426 ?auto_128427 ) ) ( not ( = ?auto_128426 ?auto_128428 ) ) ( not ( = ?auto_128426 ?auto_128429 ) ) ( not ( = ?auto_128426 ?auto_128430 ) ) ( not ( = ?auto_128427 ?auto_128428 ) ) ( not ( = ?auto_128427 ?auto_128429 ) ) ( not ( = ?auto_128427 ?auto_128430 ) ) ( not ( = ?auto_128428 ?auto_128429 ) ) ( not ( = ?auto_128428 ?auto_128430 ) ) ( not ( = ?auto_128429 ?auto_128430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128430 ?auto_128429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128431 - BLOCK
      ?auto_128432 - BLOCK
      ?auto_128433 - BLOCK
      ?auto_128434 - BLOCK
    )
    :vars
    (
      ?auto_128435 - BLOCK
      ?auto_128436 - BLOCK
      ?auto_128437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128435 ?auto_128434 ) ( CLEAR ?auto_128435 ) ( ON-TABLE ?auto_128431 ) ( ON ?auto_128432 ?auto_128431 ) ( ON ?auto_128433 ?auto_128432 ) ( ON ?auto_128434 ?auto_128433 ) ( not ( = ?auto_128431 ?auto_128432 ) ) ( not ( = ?auto_128431 ?auto_128433 ) ) ( not ( = ?auto_128431 ?auto_128434 ) ) ( not ( = ?auto_128431 ?auto_128435 ) ) ( not ( = ?auto_128432 ?auto_128433 ) ) ( not ( = ?auto_128432 ?auto_128434 ) ) ( not ( = ?auto_128432 ?auto_128435 ) ) ( not ( = ?auto_128433 ?auto_128434 ) ) ( not ( = ?auto_128433 ?auto_128435 ) ) ( not ( = ?auto_128434 ?auto_128435 ) ) ( HOLDING ?auto_128436 ) ( CLEAR ?auto_128437 ) ( not ( = ?auto_128431 ?auto_128436 ) ) ( not ( = ?auto_128431 ?auto_128437 ) ) ( not ( = ?auto_128432 ?auto_128436 ) ) ( not ( = ?auto_128432 ?auto_128437 ) ) ( not ( = ?auto_128433 ?auto_128436 ) ) ( not ( = ?auto_128433 ?auto_128437 ) ) ( not ( = ?auto_128434 ?auto_128436 ) ) ( not ( = ?auto_128434 ?auto_128437 ) ) ( not ( = ?auto_128435 ?auto_128436 ) ) ( not ( = ?auto_128435 ?auto_128437 ) ) ( not ( = ?auto_128436 ?auto_128437 ) ) )
    :subtasks
    ( ( !STACK ?auto_128436 ?auto_128437 )
      ( MAKE-4PILE ?auto_128431 ?auto_128432 ?auto_128433 ?auto_128434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128438 - BLOCK
      ?auto_128439 - BLOCK
      ?auto_128440 - BLOCK
      ?auto_128441 - BLOCK
    )
    :vars
    (
      ?auto_128442 - BLOCK
      ?auto_128443 - BLOCK
      ?auto_128444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128442 ?auto_128441 ) ( ON-TABLE ?auto_128438 ) ( ON ?auto_128439 ?auto_128438 ) ( ON ?auto_128440 ?auto_128439 ) ( ON ?auto_128441 ?auto_128440 ) ( not ( = ?auto_128438 ?auto_128439 ) ) ( not ( = ?auto_128438 ?auto_128440 ) ) ( not ( = ?auto_128438 ?auto_128441 ) ) ( not ( = ?auto_128438 ?auto_128442 ) ) ( not ( = ?auto_128439 ?auto_128440 ) ) ( not ( = ?auto_128439 ?auto_128441 ) ) ( not ( = ?auto_128439 ?auto_128442 ) ) ( not ( = ?auto_128440 ?auto_128441 ) ) ( not ( = ?auto_128440 ?auto_128442 ) ) ( not ( = ?auto_128441 ?auto_128442 ) ) ( CLEAR ?auto_128443 ) ( not ( = ?auto_128438 ?auto_128444 ) ) ( not ( = ?auto_128438 ?auto_128443 ) ) ( not ( = ?auto_128439 ?auto_128444 ) ) ( not ( = ?auto_128439 ?auto_128443 ) ) ( not ( = ?auto_128440 ?auto_128444 ) ) ( not ( = ?auto_128440 ?auto_128443 ) ) ( not ( = ?auto_128441 ?auto_128444 ) ) ( not ( = ?auto_128441 ?auto_128443 ) ) ( not ( = ?auto_128442 ?auto_128444 ) ) ( not ( = ?auto_128442 ?auto_128443 ) ) ( not ( = ?auto_128444 ?auto_128443 ) ) ( ON ?auto_128444 ?auto_128442 ) ( CLEAR ?auto_128444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128438 ?auto_128439 ?auto_128440 ?auto_128441 ?auto_128442 )
      ( MAKE-4PILE ?auto_128438 ?auto_128439 ?auto_128440 ?auto_128441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128445 - BLOCK
      ?auto_128446 - BLOCK
      ?auto_128447 - BLOCK
      ?auto_128448 - BLOCK
    )
    :vars
    (
      ?auto_128451 - BLOCK
      ?auto_128449 - BLOCK
      ?auto_128450 - BLOCK
      ?auto_128452 - BLOCK
      ?auto_128453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128451 ?auto_128448 ) ( ON-TABLE ?auto_128445 ) ( ON ?auto_128446 ?auto_128445 ) ( ON ?auto_128447 ?auto_128446 ) ( ON ?auto_128448 ?auto_128447 ) ( not ( = ?auto_128445 ?auto_128446 ) ) ( not ( = ?auto_128445 ?auto_128447 ) ) ( not ( = ?auto_128445 ?auto_128448 ) ) ( not ( = ?auto_128445 ?auto_128451 ) ) ( not ( = ?auto_128446 ?auto_128447 ) ) ( not ( = ?auto_128446 ?auto_128448 ) ) ( not ( = ?auto_128446 ?auto_128451 ) ) ( not ( = ?auto_128447 ?auto_128448 ) ) ( not ( = ?auto_128447 ?auto_128451 ) ) ( not ( = ?auto_128448 ?auto_128451 ) ) ( not ( = ?auto_128445 ?auto_128449 ) ) ( not ( = ?auto_128445 ?auto_128450 ) ) ( not ( = ?auto_128446 ?auto_128449 ) ) ( not ( = ?auto_128446 ?auto_128450 ) ) ( not ( = ?auto_128447 ?auto_128449 ) ) ( not ( = ?auto_128447 ?auto_128450 ) ) ( not ( = ?auto_128448 ?auto_128449 ) ) ( not ( = ?auto_128448 ?auto_128450 ) ) ( not ( = ?auto_128451 ?auto_128449 ) ) ( not ( = ?auto_128451 ?auto_128450 ) ) ( not ( = ?auto_128449 ?auto_128450 ) ) ( ON ?auto_128449 ?auto_128451 ) ( CLEAR ?auto_128449 ) ( HOLDING ?auto_128450 ) ( CLEAR ?auto_128452 ) ( ON-TABLE ?auto_128453 ) ( ON ?auto_128452 ?auto_128453 ) ( not ( = ?auto_128453 ?auto_128452 ) ) ( not ( = ?auto_128453 ?auto_128450 ) ) ( not ( = ?auto_128452 ?auto_128450 ) ) ( not ( = ?auto_128445 ?auto_128452 ) ) ( not ( = ?auto_128445 ?auto_128453 ) ) ( not ( = ?auto_128446 ?auto_128452 ) ) ( not ( = ?auto_128446 ?auto_128453 ) ) ( not ( = ?auto_128447 ?auto_128452 ) ) ( not ( = ?auto_128447 ?auto_128453 ) ) ( not ( = ?auto_128448 ?auto_128452 ) ) ( not ( = ?auto_128448 ?auto_128453 ) ) ( not ( = ?auto_128451 ?auto_128452 ) ) ( not ( = ?auto_128451 ?auto_128453 ) ) ( not ( = ?auto_128449 ?auto_128452 ) ) ( not ( = ?auto_128449 ?auto_128453 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128453 ?auto_128452 ?auto_128450 )
      ( MAKE-4PILE ?auto_128445 ?auto_128446 ?auto_128447 ?auto_128448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128454 - BLOCK
      ?auto_128455 - BLOCK
      ?auto_128456 - BLOCK
      ?auto_128457 - BLOCK
    )
    :vars
    (
      ?auto_128462 - BLOCK
      ?auto_128459 - BLOCK
      ?auto_128461 - BLOCK
      ?auto_128460 - BLOCK
      ?auto_128458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128462 ?auto_128457 ) ( ON-TABLE ?auto_128454 ) ( ON ?auto_128455 ?auto_128454 ) ( ON ?auto_128456 ?auto_128455 ) ( ON ?auto_128457 ?auto_128456 ) ( not ( = ?auto_128454 ?auto_128455 ) ) ( not ( = ?auto_128454 ?auto_128456 ) ) ( not ( = ?auto_128454 ?auto_128457 ) ) ( not ( = ?auto_128454 ?auto_128462 ) ) ( not ( = ?auto_128455 ?auto_128456 ) ) ( not ( = ?auto_128455 ?auto_128457 ) ) ( not ( = ?auto_128455 ?auto_128462 ) ) ( not ( = ?auto_128456 ?auto_128457 ) ) ( not ( = ?auto_128456 ?auto_128462 ) ) ( not ( = ?auto_128457 ?auto_128462 ) ) ( not ( = ?auto_128454 ?auto_128459 ) ) ( not ( = ?auto_128454 ?auto_128461 ) ) ( not ( = ?auto_128455 ?auto_128459 ) ) ( not ( = ?auto_128455 ?auto_128461 ) ) ( not ( = ?auto_128456 ?auto_128459 ) ) ( not ( = ?auto_128456 ?auto_128461 ) ) ( not ( = ?auto_128457 ?auto_128459 ) ) ( not ( = ?auto_128457 ?auto_128461 ) ) ( not ( = ?auto_128462 ?auto_128459 ) ) ( not ( = ?auto_128462 ?auto_128461 ) ) ( not ( = ?auto_128459 ?auto_128461 ) ) ( ON ?auto_128459 ?auto_128462 ) ( CLEAR ?auto_128460 ) ( ON-TABLE ?auto_128458 ) ( ON ?auto_128460 ?auto_128458 ) ( not ( = ?auto_128458 ?auto_128460 ) ) ( not ( = ?auto_128458 ?auto_128461 ) ) ( not ( = ?auto_128460 ?auto_128461 ) ) ( not ( = ?auto_128454 ?auto_128460 ) ) ( not ( = ?auto_128454 ?auto_128458 ) ) ( not ( = ?auto_128455 ?auto_128460 ) ) ( not ( = ?auto_128455 ?auto_128458 ) ) ( not ( = ?auto_128456 ?auto_128460 ) ) ( not ( = ?auto_128456 ?auto_128458 ) ) ( not ( = ?auto_128457 ?auto_128460 ) ) ( not ( = ?auto_128457 ?auto_128458 ) ) ( not ( = ?auto_128462 ?auto_128460 ) ) ( not ( = ?auto_128462 ?auto_128458 ) ) ( not ( = ?auto_128459 ?auto_128460 ) ) ( not ( = ?auto_128459 ?auto_128458 ) ) ( ON ?auto_128461 ?auto_128459 ) ( CLEAR ?auto_128461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128454 ?auto_128455 ?auto_128456 ?auto_128457 ?auto_128462 ?auto_128459 )
      ( MAKE-4PILE ?auto_128454 ?auto_128455 ?auto_128456 ?auto_128457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128463 - BLOCK
      ?auto_128464 - BLOCK
      ?auto_128465 - BLOCK
      ?auto_128466 - BLOCK
    )
    :vars
    (
      ?auto_128471 - BLOCK
      ?auto_128467 - BLOCK
      ?auto_128470 - BLOCK
      ?auto_128469 - BLOCK
      ?auto_128468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128471 ?auto_128466 ) ( ON-TABLE ?auto_128463 ) ( ON ?auto_128464 ?auto_128463 ) ( ON ?auto_128465 ?auto_128464 ) ( ON ?auto_128466 ?auto_128465 ) ( not ( = ?auto_128463 ?auto_128464 ) ) ( not ( = ?auto_128463 ?auto_128465 ) ) ( not ( = ?auto_128463 ?auto_128466 ) ) ( not ( = ?auto_128463 ?auto_128471 ) ) ( not ( = ?auto_128464 ?auto_128465 ) ) ( not ( = ?auto_128464 ?auto_128466 ) ) ( not ( = ?auto_128464 ?auto_128471 ) ) ( not ( = ?auto_128465 ?auto_128466 ) ) ( not ( = ?auto_128465 ?auto_128471 ) ) ( not ( = ?auto_128466 ?auto_128471 ) ) ( not ( = ?auto_128463 ?auto_128467 ) ) ( not ( = ?auto_128463 ?auto_128470 ) ) ( not ( = ?auto_128464 ?auto_128467 ) ) ( not ( = ?auto_128464 ?auto_128470 ) ) ( not ( = ?auto_128465 ?auto_128467 ) ) ( not ( = ?auto_128465 ?auto_128470 ) ) ( not ( = ?auto_128466 ?auto_128467 ) ) ( not ( = ?auto_128466 ?auto_128470 ) ) ( not ( = ?auto_128471 ?auto_128467 ) ) ( not ( = ?auto_128471 ?auto_128470 ) ) ( not ( = ?auto_128467 ?auto_128470 ) ) ( ON ?auto_128467 ?auto_128471 ) ( ON-TABLE ?auto_128469 ) ( not ( = ?auto_128469 ?auto_128468 ) ) ( not ( = ?auto_128469 ?auto_128470 ) ) ( not ( = ?auto_128468 ?auto_128470 ) ) ( not ( = ?auto_128463 ?auto_128468 ) ) ( not ( = ?auto_128463 ?auto_128469 ) ) ( not ( = ?auto_128464 ?auto_128468 ) ) ( not ( = ?auto_128464 ?auto_128469 ) ) ( not ( = ?auto_128465 ?auto_128468 ) ) ( not ( = ?auto_128465 ?auto_128469 ) ) ( not ( = ?auto_128466 ?auto_128468 ) ) ( not ( = ?auto_128466 ?auto_128469 ) ) ( not ( = ?auto_128471 ?auto_128468 ) ) ( not ( = ?auto_128471 ?auto_128469 ) ) ( not ( = ?auto_128467 ?auto_128468 ) ) ( not ( = ?auto_128467 ?auto_128469 ) ) ( ON ?auto_128470 ?auto_128467 ) ( CLEAR ?auto_128470 ) ( HOLDING ?auto_128468 ) ( CLEAR ?auto_128469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128469 ?auto_128468 )
      ( MAKE-4PILE ?auto_128463 ?auto_128464 ?auto_128465 ?auto_128466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130165 - BLOCK
      ?auto_130166 - BLOCK
      ?auto_130167 - BLOCK
      ?auto_130168 - BLOCK
    )
    :vars
    (
      ?auto_130169 - BLOCK
      ?auto_130172 - BLOCK
      ?auto_130171 - BLOCK
      ?auto_130170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130169 ?auto_130168 ) ( ON-TABLE ?auto_130165 ) ( ON ?auto_130166 ?auto_130165 ) ( ON ?auto_130167 ?auto_130166 ) ( ON ?auto_130168 ?auto_130167 ) ( not ( = ?auto_130165 ?auto_130166 ) ) ( not ( = ?auto_130165 ?auto_130167 ) ) ( not ( = ?auto_130165 ?auto_130168 ) ) ( not ( = ?auto_130165 ?auto_130169 ) ) ( not ( = ?auto_130166 ?auto_130167 ) ) ( not ( = ?auto_130166 ?auto_130168 ) ) ( not ( = ?auto_130166 ?auto_130169 ) ) ( not ( = ?auto_130167 ?auto_130168 ) ) ( not ( = ?auto_130167 ?auto_130169 ) ) ( not ( = ?auto_130168 ?auto_130169 ) ) ( not ( = ?auto_130165 ?auto_130172 ) ) ( not ( = ?auto_130165 ?auto_130171 ) ) ( not ( = ?auto_130166 ?auto_130172 ) ) ( not ( = ?auto_130166 ?auto_130171 ) ) ( not ( = ?auto_130167 ?auto_130172 ) ) ( not ( = ?auto_130167 ?auto_130171 ) ) ( not ( = ?auto_130168 ?auto_130172 ) ) ( not ( = ?auto_130168 ?auto_130171 ) ) ( not ( = ?auto_130169 ?auto_130172 ) ) ( not ( = ?auto_130169 ?auto_130171 ) ) ( not ( = ?auto_130172 ?auto_130171 ) ) ( ON ?auto_130172 ?auto_130169 ) ( not ( = ?auto_130170 ?auto_130171 ) ) ( not ( = ?auto_130165 ?auto_130170 ) ) ( not ( = ?auto_130166 ?auto_130170 ) ) ( not ( = ?auto_130167 ?auto_130170 ) ) ( not ( = ?auto_130168 ?auto_130170 ) ) ( not ( = ?auto_130169 ?auto_130170 ) ) ( not ( = ?auto_130172 ?auto_130170 ) ) ( ON ?auto_130171 ?auto_130172 ) ( ON ?auto_130170 ?auto_130171 ) ( CLEAR ?auto_130170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130165 ?auto_130166 ?auto_130167 ?auto_130168 ?auto_130169 ?auto_130172 ?auto_130171 )
      ( MAKE-4PILE ?auto_130165 ?auto_130166 ?auto_130167 ?auto_130168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128481 - BLOCK
      ?auto_128482 - BLOCK
      ?auto_128483 - BLOCK
      ?auto_128484 - BLOCK
    )
    :vars
    (
      ?auto_128488 - BLOCK
      ?auto_128486 - BLOCK
      ?auto_128485 - BLOCK
      ?auto_128489 - BLOCK
      ?auto_128487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128488 ?auto_128484 ) ( ON-TABLE ?auto_128481 ) ( ON ?auto_128482 ?auto_128481 ) ( ON ?auto_128483 ?auto_128482 ) ( ON ?auto_128484 ?auto_128483 ) ( not ( = ?auto_128481 ?auto_128482 ) ) ( not ( = ?auto_128481 ?auto_128483 ) ) ( not ( = ?auto_128481 ?auto_128484 ) ) ( not ( = ?auto_128481 ?auto_128488 ) ) ( not ( = ?auto_128482 ?auto_128483 ) ) ( not ( = ?auto_128482 ?auto_128484 ) ) ( not ( = ?auto_128482 ?auto_128488 ) ) ( not ( = ?auto_128483 ?auto_128484 ) ) ( not ( = ?auto_128483 ?auto_128488 ) ) ( not ( = ?auto_128484 ?auto_128488 ) ) ( not ( = ?auto_128481 ?auto_128486 ) ) ( not ( = ?auto_128481 ?auto_128485 ) ) ( not ( = ?auto_128482 ?auto_128486 ) ) ( not ( = ?auto_128482 ?auto_128485 ) ) ( not ( = ?auto_128483 ?auto_128486 ) ) ( not ( = ?auto_128483 ?auto_128485 ) ) ( not ( = ?auto_128484 ?auto_128486 ) ) ( not ( = ?auto_128484 ?auto_128485 ) ) ( not ( = ?auto_128488 ?auto_128486 ) ) ( not ( = ?auto_128488 ?auto_128485 ) ) ( not ( = ?auto_128486 ?auto_128485 ) ) ( ON ?auto_128486 ?auto_128488 ) ( not ( = ?auto_128489 ?auto_128487 ) ) ( not ( = ?auto_128489 ?auto_128485 ) ) ( not ( = ?auto_128487 ?auto_128485 ) ) ( not ( = ?auto_128481 ?auto_128487 ) ) ( not ( = ?auto_128481 ?auto_128489 ) ) ( not ( = ?auto_128482 ?auto_128487 ) ) ( not ( = ?auto_128482 ?auto_128489 ) ) ( not ( = ?auto_128483 ?auto_128487 ) ) ( not ( = ?auto_128483 ?auto_128489 ) ) ( not ( = ?auto_128484 ?auto_128487 ) ) ( not ( = ?auto_128484 ?auto_128489 ) ) ( not ( = ?auto_128488 ?auto_128487 ) ) ( not ( = ?auto_128488 ?auto_128489 ) ) ( not ( = ?auto_128486 ?auto_128487 ) ) ( not ( = ?auto_128486 ?auto_128489 ) ) ( ON ?auto_128485 ?auto_128486 ) ( ON ?auto_128487 ?auto_128485 ) ( CLEAR ?auto_128487 ) ( HOLDING ?auto_128489 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128489 )
      ( MAKE-4PILE ?auto_128481 ?auto_128482 ?auto_128483 ?auto_128484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128490 - BLOCK
      ?auto_128491 - BLOCK
      ?auto_128492 - BLOCK
      ?auto_128493 - BLOCK
    )
    :vars
    (
      ?auto_128494 - BLOCK
      ?auto_128498 - BLOCK
      ?auto_128495 - BLOCK
      ?auto_128497 - BLOCK
      ?auto_128496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128494 ?auto_128493 ) ( ON-TABLE ?auto_128490 ) ( ON ?auto_128491 ?auto_128490 ) ( ON ?auto_128492 ?auto_128491 ) ( ON ?auto_128493 ?auto_128492 ) ( not ( = ?auto_128490 ?auto_128491 ) ) ( not ( = ?auto_128490 ?auto_128492 ) ) ( not ( = ?auto_128490 ?auto_128493 ) ) ( not ( = ?auto_128490 ?auto_128494 ) ) ( not ( = ?auto_128491 ?auto_128492 ) ) ( not ( = ?auto_128491 ?auto_128493 ) ) ( not ( = ?auto_128491 ?auto_128494 ) ) ( not ( = ?auto_128492 ?auto_128493 ) ) ( not ( = ?auto_128492 ?auto_128494 ) ) ( not ( = ?auto_128493 ?auto_128494 ) ) ( not ( = ?auto_128490 ?auto_128498 ) ) ( not ( = ?auto_128490 ?auto_128495 ) ) ( not ( = ?auto_128491 ?auto_128498 ) ) ( not ( = ?auto_128491 ?auto_128495 ) ) ( not ( = ?auto_128492 ?auto_128498 ) ) ( not ( = ?auto_128492 ?auto_128495 ) ) ( not ( = ?auto_128493 ?auto_128498 ) ) ( not ( = ?auto_128493 ?auto_128495 ) ) ( not ( = ?auto_128494 ?auto_128498 ) ) ( not ( = ?auto_128494 ?auto_128495 ) ) ( not ( = ?auto_128498 ?auto_128495 ) ) ( ON ?auto_128498 ?auto_128494 ) ( not ( = ?auto_128497 ?auto_128496 ) ) ( not ( = ?auto_128497 ?auto_128495 ) ) ( not ( = ?auto_128496 ?auto_128495 ) ) ( not ( = ?auto_128490 ?auto_128496 ) ) ( not ( = ?auto_128490 ?auto_128497 ) ) ( not ( = ?auto_128491 ?auto_128496 ) ) ( not ( = ?auto_128491 ?auto_128497 ) ) ( not ( = ?auto_128492 ?auto_128496 ) ) ( not ( = ?auto_128492 ?auto_128497 ) ) ( not ( = ?auto_128493 ?auto_128496 ) ) ( not ( = ?auto_128493 ?auto_128497 ) ) ( not ( = ?auto_128494 ?auto_128496 ) ) ( not ( = ?auto_128494 ?auto_128497 ) ) ( not ( = ?auto_128498 ?auto_128496 ) ) ( not ( = ?auto_128498 ?auto_128497 ) ) ( ON ?auto_128495 ?auto_128498 ) ( ON ?auto_128496 ?auto_128495 ) ( ON ?auto_128497 ?auto_128496 ) ( CLEAR ?auto_128497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128490 ?auto_128491 ?auto_128492 ?auto_128493 ?auto_128494 ?auto_128498 ?auto_128495 ?auto_128496 )
      ( MAKE-4PILE ?auto_128490 ?auto_128491 ?auto_128492 ?auto_128493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128504 - BLOCK
      ?auto_128505 - BLOCK
      ?auto_128506 - BLOCK
      ?auto_128507 - BLOCK
      ?auto_128508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128508 ) ( CLEAR ?auto_128507 ) ( ON-TABLE ?auto_128504 ) ( ON ?auto_128505 ?auto_128504 ) ( ON ?auto_128506 ?auto_128505 ) ( ON ?auto_128507 ?auto_128506 ) ( not ( = ?auto_128504 ?auto_128505 ) ) ( not ( = ?auto_128504 ?auto_128506 ) ) ( not ( = ?auto_128504 ?auto_128507 ) ) ( not ( = ?auto_128504 ?auto_128508 ) ) ( not ( = ?auto_128505 ?auto_128506 ) ) ( not ( = ?auto_128505 ?auto_128507 ) ) ( not ( = ?auto_128505 ?auto_128508 ) ) ( not ( = ?auto_128506 ?auto_128507 ) ) ( not ( = ?auto_128506 ?auto_128508 ) ) ( not ( = ?auto_128507 ?auto_128508 ) ) )
    :subtasks
    ( ( !STACK ?auto_128508 ?auto_128507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128509 - BLOCK
      ?auto_128510 - BLOCK
      ?auto_128511 - BLOCK
      ?auto_128512 - BLOCK
      ?auto_128513 - BLOCK
    )
    :vars
    (
      ?auto_128514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128512 ) ( ON-TABLE ?auto_128509 ) ( ON ?auto_128510 ?auto_128509 ) ( ON ?auto_128511 ?auto_128510 ) ( ON ?auto_128512 ?auto_128511 ) ( not ( = ?auto_128509 ?auto_128510 ) ) ( not ( = ?auto_128509 ?auto_128511 ) ) ( not ( = ?auto_128509 ?auto_128512 ) ) ( not ( = ?auto_128509 ?auto_128513 ) ) ( not ( = ?auto_128510 ?auto_128511 ) ) ( not ( = ?auto_128510 ?auto_128512 ) ) ( not ( = ?auto_128510 ?auto_128513 ) ) ( not ( = ?auto_128511 ?auto_128512 ) ) ( not ( = ?auto_128511 ?auto_128513 ) ) ( not ( = ?auto_128512 ?auto_128513 ) ) ( ON ?auto_128513 ?auto_128514 ) ( CLEAR ?auto_128513 ) ( HAND-EMPTY ) ( not ( = ?auto_128509 ?auto_128514 ) ) ( not ( = ?auto_128510 ?auto_128514 ) ) ( not ( = ?auto_128511 ?auto_128514 ) ) ( not ( = ?auto_128512 ?auto_128514 ) ) ( not ( = ?auto_128513 ?auto_128514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128513 ?auto_128514 )
      ( MAKE-5PILE ?auto_128509 ?auto_128510 ?auto_128511 ?auto_128512 ?auto_128513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128515 - BLOCK
      ?auto_128516 - BLOCK
      ?auto_128517 - BLOCK
      ?auto_128518 - BLOCK
      ?auto_128519 - BLOCK
    )
    :vars
    (
      ?auto_128520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128515 ) ( ON ?auto_128516 ?auto_128515 ) ( ON ?auto_128517 ?auto_128516 ) ( not ( = ?auto_128515 ?auto_128516 ) ) ( not ( = ?auto_128515 ?auto_128517 ) ) ( not ( = ?auto_128515 ?auto_128518 ) ) ( not ( = ?auto_128515 ?auto_128519 ) ) ( not ( = ?auto_128516 ?auto_128517 ) ) ( not ( = ?auto_128516 ?auto_128518 ) ) ( not ( = ?auto_128516 ?auto_128519 ) ) ( not ( = ?auto_128517 ?auto_128518 ) ) ( not ( = ?auto_128517 ?auto_128519 ) ) ( not ( = ?auto_128518 ?auto_128519 ) ) ( ON ?auto_128519 ?auto_128520 ) ( CLEAR ?auto_128519 ) ( not ( = ?auto_128515 ?auto_128520 ) ) ( not ( = ?auto_128516 ?auto_128520 ) ) ( not ( = ?auto_128517 ?auto_128520 ) ) ( not ( = ?auto_128518 ?auto_128520 ) ) ( not ( = ?auto_128519 ?auto_128520 ) ) ( HOLDING ?auto_128518 ) ( CLEAR ?auto_128517 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128515 ?auto_128516 ?auto_128517 ?auto_128518 )
      ( MAKE-5PILE ?auto_128515 ?auto_128516 ?auto_128517 ?auto_128518 ?auto_128519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128521 - BLOCK
      ?auto_128522 - BLOCK
      ?auto_128523 - BLOCK
      ?auto_128524 - BLOCK
      ?auto_128525 - BLOCK
    )
    :vars
    (
      ?auto_128526 - BLOCK
      ?auto_128527 - BLOCK
      ?auto_128528 - BLOCK
      ?auto_128529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128521 ) ( ON ?auto_128522 ?auto_128521 ) ( ON ?auto_128523 ?auto_128522 ) ( not ( = ?auto_128521 ?auto_128522 ) ) ( not ( = ?auto_128521 ?auto_128523 ) ) ( not ( = ?auto_128521 ?auto_128524 ) ) ( not ( = ?auto_128521 ?auto_128525 ) ) ( not ( = ?auto_128522 ?auto_128523 ) ) ( not ( = ?auto_128522 ?auto_128524 ) ) ( not ( = ?auto_128522 ?auto_128525 ) ) ( not ( = ?auto_128523 ?auto_128524 ) ) ( not ( = ?auto_128523 ?auto_128525 ) ) ( not ( = ?auto_128524 ?auto_128525 ) ) ( ON ?auto_128525 ?auto_128526 ) ( not ( = ?auto_128521 ?auto_128526 ) ) ( not ( = ?auto_128522 ?auto_128526 ) ) ( not ( = ?auto_128523 ?auto_128526 ) ) ( not ( = ?auto_128524 ?auto_128526 ) ) ( not ( = ?auto_128525 ?auto_128526 ) ) ( CLEAR ?auto_128523 ) ( ON ?auto_128524 ?auto_128525 ) ( CLEAR ?auto_128524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128527 ) ( ON ?auto_128528 ?auto_128527 ) ( ON ?auto_128529 ?auto_128528 ) ( ON ?auto_128526 ?auto_128529 ) ( not ( = ?auto_128527 ?auto_128528 ) ) ( not ( = ?auto_128527 ?auto_128529 ) ) ( not ( = ?auto_128527 ?auto_128526 ) ) ( not ( = ?auto_128527 ?auto_128525 ) ) ( not ( = ?auto_128527 ?auto_128524 ) ) ( not ( = ?auto_128528 ?auto_128529 ) ) ( not ( = ?auto_128528 ?auto_128526 ) ) ( not ( = ?auto_128528 ?auto_128525 ) ) ( not ( = ?auto_128528 ?auto_128524 ) ) ( not ( = ?auto_128529 ?auto_128526 ) ) ( not ( = ?auto_128529 ?auto_128525 ) ) ( not ( = ?auto_128529 ?auto_128524 ) ) ( not ( = ?auto_128521 ?auto_128527 ) ) ( not ( = ?auto_128521 ?auto_128528 ) ) ( not ( = ?auto_128521 ?auto_128529 ) ) ( not ( = ?auto_128522 ?auto_128527 ) ) ( not ( = ?auto_128522 ?auto_128528 ) ) ( not ( = ?auto_128522 ?auto_128529 ) ) ( not ( = ?auto_128523 ?auto_128527 ) ) ( not ( = ?auto_128523 ?auto_128528 ) ) ( not ( = ?auto_128523 ?auto_128529 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128527 ?auto_128528 ?auto_128529 ?auto_128526 ?auto_128525 )
      ( MAKE-5PILE ?auto_128521 ?auto_128522 ?auto_128523 ?auto_128524 ?auto_128525 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128530 - BLOCK
      ?auto_128531 - BLOCK
      ?auto_128532 - BLOCK
      ?auto_128533 - BLOCK
      ?auto_128534 - BLOCK
    )
    :vars
    (
      ?auto_128535 - BLOCK
      ?auto_128538 - BLOCK
      ?auto_128536 - BLOCK
      ?auto_128537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128530 ) ( ON ?auto_128531 ?auto_128530 ) ( not ( = ?auto_128530 ?auto_128531 ) ) ( not ( = ?auto_128530 ?auto_128532 ) ) ( not ( = ?auto_128530 ?auto_128533 ) ) ( not ( = ?auto_128530 ?auto_128534 ) ) ( not ( = ?auto_128531 ?auto_128532 ) ) ( not ( = ?auto_128531 ?auto_128533 ) ) ( not ( = ?auto_128531 ?auto_128534 ) ) ( not ( = ?auto_128532 ?auto_128533 ) ) ( not ( = ?auto_128532 ?auto_128534 ) ) ( not ( = ?auto_128533 ?auto_128534 ) ) ( ON ?auto_128534 ?auto_128535 ) ( not ( = ?auto_128530 ?auto_128535 ) ) ( not ( = ?auto_128531 ?auto_128535 ) ) ( not ( = ?auto_128532 ?auto_128535 ) ) ( not ( = ?auto_128533 ?auto_128535 ) ) ( not ( = ?auto_128534 ?auto_128535 ) ) ( ON ?auto_128533 ?auto_128534 ) ( CLEAR ?auto_128533 ) ( ON-TABLE ?auto_128538 ) ( ON ?auto_128536 ?auto_128538 ) ( ON ?auto_128537 ?auto_128536 ) ( ON ?auto_128535 ?auto_128537 ) ( not ( = ?auto_128538 ?auto_128536 ) ) ( not ( = ?auto_128538 ?auto_128537 ) ) ( not ( = ?auto_128538 ?auto_128535 ) ) ( not ( = ?auto_128538 ?auto_128534 ) ) ( not ( = ?auto_128538 ?auto_128533 ) ) ( not ( = ?auto_128536 ?auto_128537 ) ) ( not ( = ?auto_128536 ?auto_128535 ) ) ( not ( = ?auto_128536 ?auto_128534 ) ) ( not ( = ?auto_128536 ?auto_128533 ) ) ( not ( = ?auto_128537 ?auto_128535 ) ) ( not ( = ?auto_128537 ?auto_128534 ) ) ( not ( = ?auto_128537 ?auto_128533 ) ) ( not ( = ?auto_128530 ?auto_128538 ) ) ( not ( = ?auto_128530 ?auto_128536 ) ) ( not ( = ?auto_128530 ?auto_128537 ) ) ( not ( = ?auto_128531 ?auto_128538 ) ) ( not ( = ?auto_128531 ?auto_128536 ) ) ( not ( = ?auto_128531 ?auto_128537 ) ) ( not ( = ?auto_128532 ?auto_128538 ) ) ( not ( = ?auto_128532 ?auto_128536 ) ) ( not ( = ?auto_128532 ?auto_128537 ) ) ( HOLDING ?auto_128532 ) ( CLEAR ?auto_128531 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128530 ?auto_128531 ?auto_128532 )
      ( MAKE-5PILE ?auto_128530 ?auto_128531 ?auto_128532 ?auto_128533 ?auto_128534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128539 - BLOCK
      ?auto_128540 - BLOCK
      ?auto_128541 - BLOCK
      ?auto_128542 - BLOCK
      ?auto_128543 - BLOCK
    )
    :vars
    (
      ?auto_128545 - BLOCK
      ?auto_128547 - BLOCK
      ?auto_128546 - BLOCK
      ?auto_128544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128539 ) ( ON ?auto_128540 ?auto_128539 ) ( not ( = ?auto_128539 ?auto_128540 ) ) ( not ( = ?auto_128539 ?auto_128541 ) ) ( not ( = ?auto_128539 ?auto_128542 ) ) ( not ( = ?auto_128539 ?auto_128543 ) ) ( not ( = ?auto_128540 ?auto_128541 ) ) ( not ( = ?auto_128540 ?auto_128542 ) ) ( not ( = ?auto_128540 ?auto_128543 ) ) ( not ( = ?auto_128541 ?auto_128542 ) ) ( not ( = ?auto_128541 ?auto_128543 ) ) ( not ( = ?auto_128542 ?auto_128543 ) ) ( ON ?auto_128543 ?auto_128545 ) ( not ( = ?auto_128539 ?auto_128545 ) ) ( not ( = ?auto_128540 ?auto_128545 ) ) ( not ( = ?auto_128541 ?auto_128545 ) ) ( not ( = ?auto_128542 ?auto_128545 ) ) ( not ( = ?auto_128543 ?auto_128545 ) ) ( ON ?auto_128542 ?auto_128543 ) ( ON-TABLE ?auto_128547 ) ( ON ?auto_128546 ?auto_128547 ) ( ON ?auto_128544 ?auto_128546 ) ( ON ?auto_128545 ?auto_128544 ) ( not ( = ?auto_128547 ?auto_128546 ) ) ( not ( = ?auto_128547 ?auto_128544 ) ) ( not ( = ?auto_128547 ?auto_128545 ) ) ( not ( = ?auto_128547 ?auto_128543 ) ) ( not ( = ?auto_128547 ?auto_128542 ) ) ( not ( = ?auto_128546 ?auto_128544 ) ) ( not ( = ?auto_128546 ?auto_128545 ) ) ( not ( = ?auto_128546 ?auto_128543 ) ) ( not ( = ?auto_128546 ?auto_128542 ) ) ( not ( = ?auto_128544 ?auto_128545 ) ) ( not ( = ?auto_128544 ?auto_128543 ) ) ( not ( = ?auto_128544 ?auto_128542 ) ) ( not ( = ?auto_128539 ?auto_128547 ) ) ( not ( = ?auto_128539 ?auto_128546 ) ) ( not ( = ?auto_128539 ?auto_128544 ) ) ( not ( = ?auto_128540 ?auto_128547 ) ) ( not ( = ?auto_128540 ?auto_128546 ) ) ( not ( = ?auto_128540 ?auto_128544 ) ) ( not ( = ?auto_128541 ?auto_128547 ) ) ( not ( = ?auto_128541 ?auto_128546 ) ) ( not ( = ?auto_128541 ?auto_128544 ) ) ( CLEAR ?auto_128540 ) ( ON ?auto_128541 ?auto_128542 ) ( CLEAR ?auto_128541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128547 ?auto_128546 ?auto_128544 ?auto_128545 ?auto_128543 ?auto_128542 )
      ( MAKE-5PILE ?auto_128539 ?auto_128540 ?auto_128541 ?auto_128542 ?auto_128543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128548 - BLOCK
      ?auto_128549 - BLOCK
      ?auto_128550 - BLOCK
      ?auto_128551 - BLOCK
      ?auto_128552 - BLOCK
    )
    :vars
    (
      ?auto_128555 - BLOCK
      ?auto_128553 - BLOCK
      ?auto_128556 - BLOCK
      ?auto_128554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128548 ) ( not ( = ?auto_128548 ?auto_128549 ) ) ( not ( = ?auto_128548 ?auto_128550 ) ) ( not ( = ?auto_128548 ?auto_128551 ) ) ( not ( = ?auto_128548 ?auto_128552 ) ) ( not ( = ?auto_128549 ?auto_128550 ) ) ( not ( = ?auto_128549 ?auto_128551 ) ) ( not ( = ?auto_128549 ?auto_128552 ) ) ( not ( = ?auto_128550 ?auto_128551 ) ) ( not ( = ?auto_128550 ?auto_128552 ) ) ( not ( = ?auto_128551 ?auto_128552 ) ) ( ON ?auto_128552 ?auto_128555 ) ( not ( = ?auto_128548 ?auto_128555 ) ) ( not ( = ?auto_128549 ?auto_128555 ) ) ( not ( = ?auto_128550 ?auto_128555 ) ) ( not ( = ?auto_128551 ?auto_128555 ) ) ( not ( = ?auto_128552 ?auto_128555 ) ) ( ON ?auto_128551 ?auto_128552 ) ( ON-TABLE ?auto_128553 ) ( ON ?auto_128556 ?auto_128553 ) ( ON ?auto_128554 ?auto_128556 ) ( ON ?auto_128555 ?auto_128554 ) ( not ( = ?auto_128553 ?auto_128556 ) ) ( not ( = ?auto_128553 ?auto_128554 ) ) ( not ( = ?auto_128553 ?auto_128555 ) ) ( not ( = ?auto_128553 ?auto_128552 ) ) ( not ( = ?auto_128553 ?auto_128551 ) ) ( not ( = ?auto_128556 ?auto_128554 ) ) ( not ( = ?auto_128556 ?auto_128555 ) ) ( not ( = ?auto_128556 ?auto_128552 ) ) ( not ( = ?auto_128556 ?auto_128551 ) ) ( not ( = ?auto_128554 ?auto_128555 ) ) ( not ( = ?auto_128554 ?auto_128552 ) ) ( not ( = ?auto_128554 ?auto_128551 ) ) ( not ( = ?auto_128548 ?auto_128553 ) ) ( not ( = ?auto_128548 ?auto_128556 ) ) ( not ( = ?auto_128548 ?auto_128554 ) ) ( not ( = ?auto_128549 ?auto_128553 ) ) ( not ( = ?auto_128549 ?auto_128556 ) ) ( not ( = ?auto_128549 ?auto_128554 ) ) ( not ( = ?auto_128550 ?auto_128553 ) ) ( not ( = ?auto_128550 ?auto_128556 ) ) ( not ( = ?auto_128550 ?auto_128554 ) ) ( ON ?auto_128550 ?auto_128551 ) ( CLEAR ?auto_128550 ) ( HOLDING ?auto_128549 ) ( CLEAR ?auto_128548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128548 ?auto_128549 )
      ( MAKE-5PILE ?auto_128548 ?auto_128549 ?auto_128550 ?auto_128551 ?auto_128552 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128557 - BLOCK
      ?auto_128558 - BLOCK
      ?auto_128559 - BLOCK
      ?auto_128560 - BLOCK
      ?auto_128561 - BLOCK
    )
    :vars
    (
      ?auto_128565 - BLOCK
      ?auto_128562 - BLOCK
      ?auto_128563 - BLOCK
      ?auto_128564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128557 ) ( not ( = ?auto_128557 ?auto_128558 ) ) ( not ( = ?auto_128557 ?auto_128559 ) ) ( not ( = ?auto_128557 ?auto_128560 ) ) ( not ( = ?auto_128557 ?auto_128561 ) ) ( not ( = ?auto_128558 ?auto_128559 ) ) ( not ( = ?auto_128558 ?auto_128560 ) ) ( not ( = ?auto_128558 ?auto_128561 ) ) ( not ( = ?auto_128559 ?auto_128560 ) ) ( not ( = ?auto_128559 ?auto_128561 ) ) ( not ( = ?auto_128560 ?auto_128561 ) ) ( ON ?auto_128561 ?auto_128565 ) ( not ( = ?auto_128557 ?auto_128565 ) ) ( not ( = ?auto_128558 ?auto_128565 ) ) ( not ( = ?auto_128559 ?auto_128565 ) ) ( not ( = ?auto_128560 ?auto_128565 ) ) ( not ( = ?auto_128561 ?auto_128565 ) ) ( ON ?auto_128560 ?auto_128561 ) ( ON-TABLE ?auto_128562 ) ( ON ?auto_128563 ?auto_128562 ) ( ON ?auto_128564 ?auto_128563 ) ( ON ?auto_128565 ?auto_128564 ) ( not ( = ?auto_128562 ?auto_128563 ) ) ( not ( = ?auto_128562 ?auto_128564 ) ) ( not ( = ?auto_128562 ?auto_128565 ) ) ( not ( = ?auto_128562 ?auto_128561 ) ) ( not ( = ?auto_128562 ?auto_128560 ) ) ( not ( = ?auto_128563 ?auto_128564 ) ) ( not ( = ?auto_128563 ?auto_128565 ) ) ( not ( = ?auto_128563 ?auto_128561 ) ) ( not ( = ?auto_128563 ?auto_128560 ) ) ( not ( = ?auto_128564 ?auto_128565 ) ) ( not ( = ?auto_128564 ?auto_128561 ) ) ( not ( = ?auto_128564 ?auto_128560 ) ) ( not ( = ?auto_128557 ?auto_128562 ) ) ( not ( = ?auto_128557 ?auto_128563 ) ) ( not ( = ?auto_128557 ?auto_128564 ) ) ( not ( = ?auto_128558 ?auto_128562 ) ) ( not ( = ?auto_128558 ?auto_128563 ) ) ( not ( = ?auto_128558 ?auto_128564 ) ) ( not ( = ?auto_128559 ?auto_128562 ) ) ( not ( = ?auto_128559 ?auto_128563 ) ) ( not ( = ?auto_128559 ?auto_128564 ) ) ( ON ?auto_128559 ?auto_128560 ) ( CLEAR ?auto_128557 ) ( ON ?auto_128558 ?auto_128559 ) ( CLEAR ?auto_128558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128562 ?auto_128563 ?auto_128564 ?auto_128565 ?auto_128561 ?auto_128560 ?auto_128559 )
      ( MAKE-5PILE ?auto_128557 ?auto_128558 ?auto_128559 ?auto_128560 ?auto_128561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128566 - BLOCK
      ?auto_128567 - BLOCK
      ?auto_128568 - BLOCK
      ?auto_128569 - BLOCK
      ?auto_128570 - BLOCK
    )
    :vars
    (
      ?auto_128572 - BLOCK
      ?auto_128574 - BLOCK
      ?auto_128571 - BLOCK
      ?auto_128573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128566 ?auto_128567 ) ) ( not ( = ?auto_128566 ?auto_128568 ) ) ( not ( = ?auto_128566 ?auto_128569 ) ) ( not ( = ?auto_128566 ?auto_128570 ) ) ( not ( = ?auto_128567 ?auto_128568 ) ) ( not ( = ?auto_128567 ?auto_128569 ) ) ( not ( = ?auto_128567 ?auto_128570 ) ) ( not ( = ?auto_128568 ?auto_128569 ) ) ( not ( = ?auto_128568 ?auto_128570 ) ) ( not ( = ?auto_128569 ?auto_128570 ) ) ( ON ?auto_128570 ?auto_128572 ) ( not ( = ?auto_128566 ?auto_128572 ) ) ( not ( = ?auto_128567 ?auto_128572 ) ) ( not ( = ?auto_128568 ?auto_128572 ) ) ( not ( = ?auto_128569 ?auto_128572 ) ) ( not ( = ?auto_128570 ?auto_128572 ) ) ( ON ?auto_128569 ?auto_128570 ) ( ON-TABLE ?auto_128574 ) ( ON ?auto_128571 ?auto_128574 ) ( ON ?auto_128573 ?auto_128571 ) ( ON ?auto_128572 ?auto_128573 ) ( not ( = ?auto_128574 ?auto_128571 ) ) ( not ( = ?auto_128574 ?auto_128573 ) ) ( not ( = ?auto_128574 ?auto_128572 ) ) ( not ( = ?auto_128574 ?auto_128570 ) ) ( not ( = ?auto_128574 ?auto_128569 ) ) ( not ( = ?auto_128571 ?auto_128573 ) ) ( not ( = ?auto_128571 ?auto_128572 ) ) ( not ( = ?auto_128571 ?auto_128570 ) ) ( not ( = ?auto_128571 ?auto_128569 ) ) ( not ( = ?auto_128573 ?auto_128572 ) ) ( not ( = ?auto_128573 ?auto_128570 ) ) ( not ( = ?auto_128573 ?auto_128569 ) ) ( not ( = ?auto_128566 ?auto_128574 ) ) ( not ( = ?auto_128566 ?auto_128571 ) ) ( not ( = ?auto_128566 ?auto_128573 ) ) ( not ( = ?auto_128567 ?auto_128574 ) ) ( not ( = ?auto_128567 ?auto_128571 ) ) ( not ( = ?auto_128567 ?auto_128573 ) ) ( not ( = ?auto_128568 ?auto_128574 ) ) ( not ( = ?auto_128568 ?auto_128571 ) ) ( not ( = ?auto_128568 ?auto_128573 ) ) ( ON ?auto_128568 ?auto_128569 ) ( ON ?auto_128567 ?auto_128568 ) ( CLEAR ?auto_128567 ) ( HOLDING ?auto_128566 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128566 )
      ( MAKE-5PILE ?auto_128566 ?auto_128567 ?auto_128568 ?auto_128569 ?auto_128570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128575 - BLOCK
      ?auto_128576 - BLOCK
      ?auto_128577 - BLOCK
      ?auto_128578 - BLOCK
      ?auto_128579 - BLOCK
    )
    :vars
    (
      ?auto_128583 - BLOCK
      ?auto_128580 - BLOCK
      ?auto_128582 - BLOCK
      ?auto_128581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128575 ?auto_128576 ) ) ( not ( = ?auto_128575 ?auto_128577 ) ) ( not ( = ?auto_128575 ?auto_128578 ) ) ( not ( = ?auto_128575 ?auto_128579 ) ) ( not ( = ?auto_128576 ?auto_128577 ) ) ( not ( = ?auto_128576 ?auto_128578 ) ) ( not ( = ?auto_128576 ?auto_128579 ) ) ( not ( = ?auto_128577 ?auto_128578 ) ) ( not ( = ?auto_128577 ?auto_128579 ) ) ( not ( = ?auto_128578 ?auto_128579 ) ) ( ON ?auto_128579 ?auto_128583 ) ( not ( = ?auto_128575 ?auto_128583 ) ) ( not ( = ?auto_128576 ?auto_128583 ) ) ( not ( = ?auto_128577 ?auto_128583 ) ) ( not ( = ?auto_128578 ?auto_128583 ) ) ( not ( = ?auto_128579 ?auto_128583 ) ) ( ON ?auto_128578 ?auto_128579 ) ( ON-TABLE ?auto_128580 ) ( ON ?auto_128582 ?auto_128580 ) ( ON ?auto_128581 ?auto_128582 ) ( ON ?auto_128583 ?auto_128581 ) ( not ( = ?auto_128580 ?auto_128582 ) ) ( not ( = ?auto_128580 ?auto_128581 ) ) ( not ( = ?auto_128580 ?auto_128583 ) ) ( not ( = ?auto_128580 ?auto_128579 ) ) ( not ( = ?auto_128580 ?auto_128578 ) ) ( not ( = ?auto_128582 ?auto_128581 ) ) ( not ( = ?auto_128582 ?auto_128583 ) ) ( not ( = ?auto_128582 ?auto_128579 ) ) ( not ( = ?auto_128582 ?auto_128578 ) ) ( not ( = ?auto_128581 ?auto_128583 ) ) ( not ( = ?auto_128581 ?auto_128579 ) ) ( not ( = ?auto_128581 ?auto_128578 ) ) ( not ( = ?auto_128575 ?auto_128580 ) ) ( not ( = ?auto_128575 ?auto_128582 ) ) ( not ( = ?auto_128575 ?auto_128581 ) ) ( not ( = ?auto_128576 ?auto_128580 ) ) ( not ( = ?auto_128576 ?auto_128582 ) ) ( not ( = ?auto_128576 ?auto_128581 ) ) ( not ( = ?auto_128577 ?auto_128580 ) ) ( not ( = ?auto_128577 ?auto_128582 ) ) ( not ( = ?auto_128577 ?auto_128581 ) ) ( ON ?auto_128577 ?auto_128578 ) ( ON ?auto_128576 ?auto_128577 ) ( ON ?auto_128575 ?auto_128576 ) ( CLEAR ?auto_128575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128580 ?auto_128582 ?auto_128581 ?auto_128583 ?auto_128579 ?auto_128578 ?auto_128577 ?auto_128576 )
      ( MAKE-5PILE ?auto_128575 ?auto_128576 ?auto_128577 ?auto_128578 ?auto_128579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128587 - BLOCK
      ?auto_128588 - BLOCK
      ?auto_128589 - BLOCK
    )
    :vars
    (
      ?auto_128590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128590 ?auto_128589 ) ( CLEAR ?auto_128590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128587 ) ( ON ?auto_128588 ?auto_128587 ) ( ON ?auto_128589 ?auto_128588 ) ( not ( = ?auto_128587 ?auto_128588 ) ) ( not ( = ?auto_128587 ?auto_128589 ) ) ( not ( = ?auto_128587 ?auto_128590 ) ) ( not ( = ?auto_128588 ?auto_128589 ) ) ( not ( = ?auto_128588 ?auto_128590 ) ) ( not ( = ?auto_128589 ?auto_128590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128590 ?auto_128589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128591 - BLOCK
      ?auto_128592 - BLOCK
      ?auto_128593 - BLOCK
    )
    :vars
    (
      ?auto_128594 - BLOCK
      ?auto_128595 - BLOCK
      ?auto_128596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128594 ?auto_128593 ) ( CLEAR ?auto_128594 ) ( ON-TABLE ?auto_128591 ) ( ON ?auto_128592 ?auto_128591 ) ( ON ?auto_128593 ?auto_128592 ) ( not ( = ?auto_128591 ?auto_128592 ) ) ( not ( = ?auto_128591 ?auto_128593 ) ) ( not ( = ?auto_128591 ?auto_128594 ) ) ( not ( = ?auto_128592 ?auto_128593 ) ) ( not ( = ?auto_128592 ?auto_128594 ) ) ( not ( = ?auto_128593 ?auto_128594 ) ) ( HOLDING ?auto_128595 ) ( CLEAR ?auto_128596 ) ( not ( = ?auto_128591 ?auto_128595 ) ) ( not ( = ?auto_128591 ?auto_128596 ) ) ( not ( = ?auto_128592 ?auto_128595 ) ) ( not ( = ?auto_128592 ?auto_128596 ) ) ( not ( = ?auto_128593 ?auto_128595 ) ) ( not ( = ?auto_128593 ?auto_128596 ) ) ( not ( = ?auto_128594 ?auto_128595 ) ) ( not ( = ?auto_128594 ?auto_128596 ) ) ( not ( = ?auto_128595 ?auto_128596 ) ) )
    :subtasks
    ( ( !STACK ?auto_128595 ?auto_128596 )
      ( MAKE-3PILE ?auto_128591 ?auto_128592 ?auto_128593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128597 - BLOCK
      ?auto_128598 - BLOCK
      ?auto_128599 - BLOCK
    )
    :vars
    (
      ?auto_128601 - BLOCK
      ?auto_128602 - BLOCK
      ?auto_128600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128601 ?auto_128599 ) ( ON-TABLE ?auto_128597 ) ( ON ?auto_128598 ?auto_128597 ) ( ON ?auto_128599 ?auto_128598 ) ( not ( = ?auto_128597 ?auto_128598 ) ) ( not ( = ?auto_128597 ?auto_128599 ) ) ( not ( = ?auto_128597 ?auto_128601 ) ) ( not ( = ?auto_128598 ?auto_128599 ) ) ( not ( = ?auto_128598 ?auto_128601 ) ) ( not ( = ?auto_128599 ?auto_128601 ) ) ( CLEAR ?auto_128602 ) ( not ( = ?auto_128597 ?auto_128600 ) ) ( not ( = ?auto_128597 ?auto_128602 ) ) ( not ( = ?auto_128598 ?auto_128600 ) ) ( not ( = ?auto_128598 ?auto_128602 ) ) ( not ( = ?auto_128599 ?auto_128600 ) ) ( not ( = ?auto_128599 ?auto_128602 ) ) ( not ( = ?auto_128601 ?auto_128600 ) ) ( not ( = ?auto_128601 ?auto_128602 ) ) ( not ( = ?auto_128600 ?auto_128602 ) ) ( ON ?auto_128600 ?auto_128601 ) ( CLEAR ?auto_128600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128597 ?auto_128598 ?auto_128599 ?auto_128601 )
      ( MAKE-3PILE ?auto_128597 ?auto_128598 ?auto_128599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128603 - BLOCK
      ?auto_128604 - BLOCK
      ?auto_128605 - BLOCK
    )
    :vars
    (
      ?auto_128607 - BLOCK
      ?auto_128608 - BLOCK
      ?auto_128606 - BLOCK
      ?auto_128609 - BLOCK
      ?auto_128610 - BLOCK
      ?auto_128611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128607 ?auto_128605 ) ( ON-TABLE ?auto_128603 ) ( ON ?auto_128604 ?auto_128603 ) ( ON ?auto_128605 ?auto_128604 ) ( not ( = ?auto_128603 ?auto_128604 ) ) ( not ( = ?auto_128603 ?auto_128605 ) ) ( not ( = ?auto_128603 ?auto_128607 ) ) ( not ( = ?auto_128604 ?auto_128605 ) ) ( not ( = ?auto_128604 ?auto_128607 ) ) ( not ( = ?auto_128605 ?auto_128607 ) ) ( not ( = ?auto_128603 ?auto_128608 ) ) ( not ( = ?auto_128603 ?auto_128606 ) ) ( not ( = ?auto_128604 ?auto_128608 ) ) ( not ( = ?auto_128604 ?auto_128606 ) ) ( not ( = ?auto_128605 ?auto_128608 ) ) ( not ( = ?auto_128605 ?auto_128606 ) ) ( not ( = ?auto_128607 ?auto_128608 ) ) ( not ( = ?auto_128607 ?auto_128606 ) ) ( not ( = ?auto_128608 ?auto_128606 ) ) ( ON ?auto_128608 ?auto_128607 ) ( CLEAR ?auto_128608 ) ( HOLDING ?auto_128606 ) ( CLEAR ?auto_128609 ) ( ON-TABLE ?auto_128610 ) ( ON ?auto_128611 ?auto_128610 ) ( ON ?auto_128609 ?auto_128611 ) ( not ( = ?auto_128610 ?auto_128611 ) ) ( not ( = ?auto_128610 ?auto_128609 ) ) ( not ( = ?auto_128610 ?auto_128606 ) ) ( not ( = ?auto_128611 ?auto_128609 ) ) ( not ( = ?auto_128611 ?auto_128606 ) ) ( not ( = ?auto_128609 ?auto_128606 ) ) ( not ( = ?auto_128603 ?auto_128609 ) ) ( not ( = ?auto_128603 ?auto_128610 ) ) ( not ( = ?auto_128603 ?auto_128611 ) ) ( not ( = ?auto_128604 ?auto_128609 ) ) ( not ( = ?auto_128604 ?auto_128610 ) ) ( not ( = ?auto_128604 ?auto_128611 ) ) ( not ( = ?auto_128605 ?auto_128609 ) ) ( not ( = ?auto_128605 ?auto_128610 ) ) ( not ( = ?auto_128605 ?auto_128611 ) ) ( not ( = ?auto_128607 ?auto_128609 ) ) ( not ( = ?auto_128607 ?auto_128610 ) ) ( not ( = ?auto_128607 ?auto_128611 ) ) ( not ( = ?auto_128608 ?auto_128609 ) ) ( not ( = ?auto_128608 ?auto_128610 ) ) ( not ( = ?auto_128608 ?auto_128611 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128610 ?auto_128611 ?auto_128609 ?auto_128606 )
      ( MAKE-3PILE ?auto_128603 ?auto_128604 ?auto_128605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128612 - BLOCK
      ?auto_128613 - BLOCK
      ?auto_128614 - BLOCK
    )
    :vars
    (
      ?auto_128619 - BLOCK
      ?auto_128615 - BLOCK
      ?auto_128620 - BLOCK
      ?auto_128617 - BLOCK
      ?auto_128616 - BLOCK
      ?auto_128618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128619 ?auto_128614 ) ( ON-TABLE ?auto_128612 ) ( ON ?auto_128613 ?auto_128612 ) ( ON ?auto_128614 ?auto_128613 ) ( not ( = ?auto_128612 ?auto_128613 ) ) ( not ( = ?auto_128612 ?auto_128614 ) ) ( not ( = ?auto_128612 ?auto_128619 ) ) ( not ( = ?auto_128613 ?auto_128614 ) ) ( not ( = ?auto_128613 ?auto_128619 ) ) ( not ( = ?auto_128614 ?auto_128619 ) ) ( not ( = ?auto_128612 ?auto_128615 ) ) ( not ( = ?auto_128612 ?auto_128620 ) ) ( not ( = ?auto_128613 ?auto_128615 ) ) ( not ( = ?auto_128613 ?auto_128620 ) ) ( not ( = ?auto_128614 ?auto_128615 ) ) ( not ( = ?auto_128614 ?auto_128620 ) ) ( not ( = ?auto_128619 ?auto_128615 ) ) ( not ( = ?auto_128619 ?auto_128620 ) ) ( not ( = ?auto_128615 ?auto_128620 ) ) ( ON ?auto_128615 ?auto_128619 ) ( CLEAR ?auto_128617 ) ( ON-TABLE ?auto_128616 ) ( ON ?auto_128618 ?auto_128616 ) ( ON ?auto_128617 ?auto_128618 ) ( not ( = ?auto_128616 ?auto_128618 ) ) ( not ( = ?auto_128616 ?auto_128617 ) ) ( not ( = ?auto_128616 ?auto_128620 ) ) ( not ( = ?auto_128618 ?auto_128617 ) ) ( not ( = ?auto_128618 ?auto_128620 ) ) ( not ( = ?auto_128617 ?auto_128620 ) ) ( not ( = ?auto_128612 ?auto_128617 ) ) ( not ( = ?auto_128612 ?auto_128616 ) ) ( not ( = ?auto_128612 ?auto_128618 ) ) ( not ( = ?auto_128613 ?auto_128617 ) ) ( not ( = ?auto_128613 ?auto_128616 ) ) ( not ( = ?auto_128613 ?auto_128618 ) ) ( not ( = ?auto_128614 ?auto_128617 ) ) ( not ( = ?auto_128614 ?auto_128616 ) ) ( not ( = ?auto_128614 ?auto_128618 ) ) ( not ( = ?auto_128619 ?auto_128617 ) ) ( not ( = ?auto_128619 ?auto_128616 ) ) ( not ( = ?auto_128619 ?auto_128618 ) ) ( not ( = ?auto_128615 ?auto_128617 ) ) ( not ( = ?auto_128615 ?auto_128616 ) ) ( not ( = ?auto_128615 ?auto_128618 ) ) ( ON ?auto_128620 ?auto_128615 ) ( CLEAR ?auto_128620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128612 ?auto_128613 ?auto_128614 ?auto_128619 ?auto_128615 )
      ( MAKE-3PILE ?auto_128612 ?auto_128613 ?auto_128614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128621 - BLOCK
      ?auto_128622 - BLOCK
      ?auto_128623 - BLOCK
    )
    :vars
    (
      ?auto_128626 - BLOCK
      ?auto_128624 - BLOCK
      ?auto_128627 - BLOCK
      ?auto_128629 - BLOCK
      ?auto_128625 - BLOCK
      ?auto_128628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128626 ?auto_128623 ) ( ON-TABLE ?auto_128621 ) ( ON ?auto_128622 ?auto_128621 ) ( ON ?auto_128623 ?auto_128622 ) ( not ( = ?auto_128621 ?auto_128622 ) ) ( not ( = ?auto_128621 ?auto_128623 ) ) ( not ( = ?auto_128621 ?auto_128626 ) ) ( not ( = ?auto_128622 ?auto_128623 ) ) ( not ( = ?auto_128622 ?auto_128626 ) ) ( not ( = ?auto_128623 ?auto_128626 ) ) ( not ( = ?auto_128621 ?auto_128624 ) ) ( not ( = ?auto_128621 ?auto_128627 ) ) ( not ( = ?auto_128622 ?auto_128624 ) ) ( not ( = ?auto_128622 ?auto_128627 ) ) ( not ( = ?auto_128623 ?auto_128624 ) ) ( not ( = ?auto_128623 ?auto_128627 ) ) ( not ( = ?auto_128626 ?auto_128624 ) ) ( not ( = ?auto_128626 ?auto_128627 ) ) ( not ( = ?auto_128624 ?auto_128627 ) ) ( ON ?auto_128624 ?auto_128626 ) ( ON-TABLE ?auto_128629 ) ( ON ?auto_128625 ?auto_128629 ) ( not ( = ?auto_128629 ?auto_128625 ) ) ( not ( = ?auto_128629 ?auto_128628 ) ) ( not ( = ?auto_128629 ?auto_128627 ) ) ( not ( = ?auto_128625 ?auto_128628 ) ) ( not ( = ?auto_128625 ?auto_128627 ) ) ( not ( = ?auto_128628 ?auto_128627 ) ) ( not ( = ?auto_128621 ?auto_128628 ) ) ( not ( = ?auto_128621 ?auto_128629 ) ) ( not ( = ?auto_128621 ?auto_128625 ) ) ( not ( = ?auto_128622 ?auto_128628 ) ) ( not ( = ?auto_128622 ?auto_128629 ) ) ( not ( = ?auto_128622 ?auto_128625 ) ) ( not ( = ?auto_128623 ?auto_128628 ) ) ( not ( = ?auto_128623 ?auto_128629 ) ) ( not ( = ?auto_128623 ?auto_128625 ) ) ( not ( = ?auto_128626 ?auto_128628 ) ) ( not ( = ?auto_128626 ?auto_128629 ) ) ( not ( = ?auto_128626 ?auto_128625 ) ) ( not ( = ?auto_128624 ?auto_128628 ) ) ( not ( = ?auto_128624 ?auto_128629 ) ) ( not ( = ?auto_128624 ?auto_128625 ) ) ( ON ?auto_128627 ?auto_128624 ) ( CLEAR ?auto_128627 ) ( HOLDING ?auto_128628 ) ( CLEAR ?auto_128625 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128629 ?auto_128625 ?auto_128628 )
      ( MAKE-3PILE ?auto_128621 ?auto_128622 ?auto_128623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128630 - BLOCK
      ?auto_128631 - BLOCK
      ?auto_128632 - BLOCK
    )
    :vars
    (
      ?auto_128638 - BLOCK
      ?auto_128636 - BLOCK
      ?auto_128635 - BLOCK
      ?auto_128637 - BLOCK
      ?auto_128634 - BLOCK
      ?auto_128633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128638 ?auto_128632 ) ( ON-TABLE ?auto_128630 ) ( ON ?auto_128631 ?auto_128630 ) ( ON ?auto_128632 ?auto_128631 ) ( not ( = ?auto_128630 ?auto_128631 ) ) ( not ( = ?auto_128630 ?auto_128632 ) ) ( not ( = ?auto_128630 ?auto_128638 ) ) ( not ( = ?auto_128631 ?auto_128632 ) ) ( not ( = ?auto_128631 ?auto_128638 ) ) ( not ( = ?auto_128632 ?auto_128638 ) ) ( not ( = ?auto_128630 ?auto_128636 ) ) ( not ( = ?auto_128630 ?auto_128635 ) ) ( not ( = ?auto_128631 ?auto_128636 ) ) ( not ( = ?auto_128631 ?auto_128635 ) ) ( not ( = ?auto_128632 ?auto_128636 ) ) ( not ( = ?auto_128632 ?auto_128635 ) ) ( not ( = ?auto_128638 ?auto_128636 ) ) ( not ( = ?auto_128638 ?auto_128635 ) ) ( not ( = ?auto_128636 ?auto_128635 ) ) ( ON ?auto_128636 ?auto_128638 ) ( ON-TABLE ?auto_128637 ) ( ON ?auto_128634 ?auto_128637 ) ( not ( = ?auto_128637 ?auto_128634 ) ) ( not ( = ?auto_128637 ?auto_128633 ) ) ( not ( = ?auto_128637 ?auto_128635 ) ) ( not ( = ?auto_128634 ?auto_128633 ) ) ( not ( = ?auto_128634 ?auto_128635 ) ) ( not ( = ?auto_128633 ?auto_128635 ) ) ( not ( = ?auto_128630 ?auto_128633 ) ) ( not ( = ?auto_128630 ?auto_128637 ) ) ( not ( = ?auto_128630 ?auto_128634 ) ) ( not ( = ?auto_128631 ?auto_128633 ) ) ( not ( = ?auto_128631 ?auto_128637 ) ) ( not ( = ?auto_128631 ?auto_128634 ) ) ( not ( = ?auto_128632 ?auto_128633 ) ) ( not ( = ?auto_128632 ?auto_128637 ) ) ( not ( = ?auto_128632 ?auto_128634 ) ) ( not ( = ?auto_128638 ?auto_128633 ) ) ( not ( = ?auto_128638 ?auto_128637 ) ) ( not ( = ?auto_128638 ?auto_128634 ) ) ( not ( = ?auto_128636 ?auto_128633 ) ) ( not ( = ?auto_128636 ?auto_128637 ) ) ( not ( = ?auto_128636 ?auto_128634 ) ) ( ON ?auto_128635 ?auto_128636 ) ( CLEAR ?auto_128634 ) ( ON ?auto_128633 ?auto_128635 ) ( CLEAR ?auto_128633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128630 ?auto_128631 ?auto_128632 ?auto_128638 ?auto_128636 ?auto_128635 )
      ( MAKE-3PILE ?auto_128630 ?auto_128631 ?auto_128632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128639 - BLOCK
      ?auto_128640 - BLOCK
      ?auto_128641 - BLOCK
    )
    :vars
    (
      ?auto_128647 - BLOCK
      ?auto_128645 - BLOCK
      ?auto_128642 - BLOCK
      ?auto_128646 - BLOCK
      ?auto_128643 - BLOCK
      ?auto_128644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128647 ?auto_128641 ) ( ON-TABLE ?auto_128639 ) ( ON ?auto_128640 ?auto_128639 ) ( ON ?auto_128641 ?auto_128640 ) ( not ( = ?auto_128639 ?auto_128640 ) ) ( not ( = ?auto_128639 ?auto_128641 ) ) ( not ( = ?auto_128639 ?auto_128647 ) ) ( not ( = ?auto_128640 ?auto_128641 ) ) ( not ( = ?auto_128640 ?auto_128647 ) ) ( not ( = ?auto_128641 ?auto_128647 ) ) ( not ( = ?auto_128639 ?auto_128645 ) ) ( not ( = ?auto_128639 ?auto_128642 ) ) ( not ( = ?auto_128640 ?auto_128645 ) ) ( not ( = ?auto_128640 ?auto_128642 ) ) ( not ( = ?auto_128641 ?auto_128645 ) ) ( not ( = ?auto_128641 ?auto_128642 ) ) ( not ( = ?auto_128647 ?auto_128645 ) ) ( not ( = ?auto_128647 ?auto_128642 ) ) ( not ( = ?auto_128645 ?auto_128642 ) ) ( ON ?auto_128645 ?auto_128647 ) ( ON-TABLE ?auto_128646 ) ( not ( = ?auto_128646 ?auto_128643 ) ) ( not ( = ?auto_128646 ?auto_128644 ) ) ( not ( = ?auto_128646 ?auto_128642 ) ) ( not ( = ?auto_128643 ?auto_128644 ) ) ( not ( = ?auto_128643 ?auto_128642 ) ) ( not ( = ?auto_128644 ?auto_128642 ) ) ( not ( = ?auto_128639 ?auto_128644 ) ) ( not ( = ?auto_128639 ?auto_128646 ) ) ( not ( = ?auto_128639 ?auto_128643 ) ) ( not ( = ?auto_128640 ?auto_128644 ) ) ( not ( = ?auto_128640 ?auto_128646 ) ) ( not ( = ?auto_128640 ?auto_128643 ) ) ( not ( = ?auto_128641 ?auto_128644 ) ) ( not ( = ?auto_128641 ?auto_128646 ) ) ( not ( = ?auto_128641 ?auto_128643 ) ) ( not ( = ?auto_128647 ?auto_128644 ) ) ( not ( = ?auto_128647 ?auto_128646 ) ) ( not ( = ?auto_128647 ?auto_128643 ) ) ( not ( = ?auto_128645 ?auto_128644 ) ) ( not ( = ?auto_128645 ?auto_128646 ) ) ( not ( = ?auto_128645 ?auto_128643 ) ) ( ON ?auto_128642 ?auto_128645 ) ( ON ?auto_128644 ?auto_128642 ) ( CLEAR ?auto_128644 ) ( HOLDING ?auto_128643 ) ( CLEAR ?auto_128646 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128646 ?auto_128643 )
      ( MAKE-3PILE ?auto_128639 ?auto_128640 ?auto_128641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130506 - BLOCK
      ?auto_130507 - BLOCK
      ?auto_130508 - BLOCK
    )
    :vars
    (
      ?auto_130511 - BLOCK
      ?auto_130510 - BLOCK
      ?auto_130513 - BLOCK
      ?auto_130512 - BLOCK
      ?auto_130509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130511 ?auto_130508 ) ( ON-TABLE ?auto_130506 ) ( ON ?auto_130507 ?auto_130506 ) ( ON ?auto_130508 ?auto_130507 ) ( not ( = ?auto_130506 ?auto_130507 ) ) ( not ( = ?auto_130506 ?auto_130508 ) ) ( not ( = ?auto_130506 ?auto_130511 ) ) ( not ( = ?auto_130507 ?auto_130508 ) ) ( not ( = ?auto_130507 ?auto_130511 ) ) ( not ( = ?auto_130508 ?auto_130511 ) ) ( not ( = ?auto_130506 ?auto_130510 ) ) ( not ( = ?auto_130506 ?auto_130513 ) ) ( not ( = ?auto_130507 ?auto_130510 ) ) ( not ( = ?auto_130507 ?auto_130513 ) ) ( not ( = ?auto_130508 ?auto_130510 ) ) ( not ( = ?auto_130508 ?auto_130513 ) ) ( not ( = ?auto_130511 ?auto_130510 ) ) ( not ( = ?auto_130511 ?auto_130513 ) ) ( not ( = ?auto_130510 ?auto_130513 ) ) ( ON ?auto_130510 ?auto_130511 ) ( not ( = ?auto_130512 ?auto_130509 ) ) ( not ( = ?auto_130512 ?auto_130513 ) ) ( not ( = ?auto_130509 ?auto_130513 ) ) ( not ( = ?auto_130506 ?auto_130509 ) ) ( not ( = ?auto_130506 ?auto_130512 ) ) ( not ( = ?auto_130507 ?auto_130509 ) ) ( not ( = ?auto_130507 ?auto_130512 ) ) ( not ( = ?auto_130508 ?auto_130509 ) ) ( not ( = ?auto_130508 ?auto_130512 ) ) ( not ( = ?auto_130511 ?auto_130509 ) ) ( not ( = ?auto_130511 ?auto_130512 ) ) ( not ( = ?auto_130510 ?auto_130509 ) ) ( not ( = ?auto_130510 ?auto_130512 ) ) ( ON ?auto_130513 ?auto_130510 ) ( ON ?auto_130509 ?auto_130513 ) ( ON ?auto_130512 ?auto_130509 ) ( CLEAR ?auto_130512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130506 ?auto_130507 ?auto_130508 ?auto_130511 ?auto_130510 ?auto_130513 ?auto_130509 )
      ( MAKE-3PILE ?auto_130506 ?auto_130507 ?auto_130508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128657 - BLOCK
      ?auto_128658 - BLOCK
      ?auto_128659 - BLOCK
    )
    :vars
    (
      ?auto_128660 - BLOCK
      ?auto_128661 - BLOCK
      ?auto_128662 - BLOCK
      ?auto_128664 - BLOCK
      ?auto_128665 - BLOCK
      ?auto_128663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128660 ?auto_128659 ) ( ON-TABLE ?auto_128657 ) ( ON ?auto_128658 ?auto_128657 ) ( ON ?auto_128659 ?auto_128658 ) ( not ( = ?auto_128657 ?auto_128658 ) ) ( not ( = ?auto_128657 ?auto_128659 ) ) ( not ( = ?auto_128657 ?auto_128660 ) ) ( not ( = ?auto_128658 ?auto_128659 ) ) ( not ( = ?auto_128658 ?auto_128660 ) ) ( not ( = ?auto_128659 ?auto_128660 ) ) ( not ( = ?auto_128657 ?auto_128661 ) ) ( not ( = ?auto_128657 ?auto_128662 ) ) ( not ( = ?auto_128658 ?auto_128661 ) ) ( not ( = ?auto_128658 ?auto_128662 ) ) ( not ( = ?auto_128659 ?auto_128661 ) ) ( not ( = ?auto_128659 ?auto_128662 ) ) ( not ( = ?auto_128660 ?auto_128661 ) ) ( not ( = ?auto_128660 ?auto_128662 ) ) ( not ( = ?auto_128661 ?auto_128662 ) ) ( ON ?auto_128661 ?auto_128660 ) ( not ( = ?auto_128664 ?auto_128665 ) ) ( not ( = ?auto_128664 ?auto_128663 ) ) ( not ( = ?auto_128664 ?auto_128662 ) ) ( not ( = ?auto_128665 ?auto_128663 ) ) ( not ( = ?auto_128665 ?auto_128662 ) ) ( not ( = ?auto_128663 ?auto_128662 ) ) ( not ( = ?auto_128657 ?auto_128663 ) ) ( not ( = ?auto_128657 ?auto_128664 ) ) ( not ( = ?auto_128657 ?auto_128665 ) ) ( not ( = ?auto_128658 ?auto_128663 ) ) ( not ( = ?auto_128658 ?auto_128664 ) ) ( not ( = ?auto_128658 ?auto_128665 ) ) ( not ( = ?auto_128659 ?auto_128663 ) ) ( not ( = ?auto_128659 ?auto_128664 ) ) ( not ( = ?auto_128659 ?auto_128665 ) ) ( not ( = ?auto_128660 ?auto_128663 ) ) ( not ( = ?auto_128660 ?auto_128664 ) ) ( not ( = ?auto_128660 ?auto_128665 ) ) ( not ( = ?auto_128661 ?auto_128663 ) ) ( not ( = ?auto_128661 ?auto_128664 ) ) ( not ( = ?auto_128661 ?auto_128665 ) ) ( ON ?auto_128662 ?auto_128661 ) ( ON ?auto_128663 ?auto_128662 ) ( ON ?auto_128665 ?auto_128663 ) ( CLEAR ?auto_128665 ) ( HOLDING ?auto_128664 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128664 )
      ( MAKE-3PILE ?auto_128657 ?auto_128658 ?auto_128659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128666 - BLOCK
      ?auto_128667 - BLOCK
      ?auto_128668 - BLOCK
    )
    :vars
    (
      ?auto_128674 - BLOCK
      ?auto_128672 - BLOCK
      ?auto_128671 - BLOCK
      ?auto_128669 - BLOCK
      ?auto_128673 - BLOCK
      ?auto_128670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128674 ?auto_128668 ) ( ON-TABLE ?auto_128666 ) ( ON ?auto_128667 ?auto_128666 ) ( ON ?auto_128668 ?auto_128667 ) ( not ( = ?auto_128666 ?auto_128667 ) ) ( not ( = ?auto_128666 ?auto_128668 ) ) ( not ( = ?auto_128666 ?auto_128674 ) ) ( not ( = ?auto_128667 ?auto_128668 ) ) ( not ( = ?auto_128667 ?auto_128674 ) ) ( not ( = ?auto_128668 ?auto_128674 ) ) ( not ( = ?auto_128666 ?auto_128672 ) ) ( not ( = ?auto_128666 ?auto_128671 ) ) ( not ( = ?auto_128667 ?auto_128672 ) ) ( not ( = ?auto_128667 ?auto_128671 ) ) ( not ( = ?auto_128668 ?auto_128672 ) ) ( not ( = ?auto_128668 ?auto_128671 ) ) ( not ( = ?auto_128674 ?auto_128672 ) ) ( not ( = ?auto_128674 ?auto_128671 ) ) ( not ( = ?auto_128672 ?auto_128671 ) ) ( ON ?auto_128672 ?auto_128674 ) ( not ( = ?auto_128669 ?auto_128673 ) ) ( not ( = ?auto_128669 ?auto_128670 ) ) ( not ( = ?auto_128669 ?auto_128671 ) ) ( not ( = ?auto_128673 ?auto_128670 ) ) ( not ( = ?auto_128673 ?auto_128671 ) ) ( not ( = ?auto_128670 ?auto_128671 ) ) ( not ( = ?auto_128666 ?auto_128670 ) ) ( not ( = ?auto_128666 ?auto_128669 ) ) ( not ( = ?auto_128666 ?auto_128673 ) ) ( not ( = ?auto_128667 ?auto_128670 ) ) ( not ( = ?auto_128667 ?auto_128669 ) ) ( not ( = ?auto_128667 ?auto_128673 ) ) ( not ( = ?auto_128668 ?auto_128670 ) ) ( not ( = ?auto_128668 ?auto_128669 ) ) ( not ( = ?auto_128668 ?auto_128673 ) ) ( not ( = ?auto_128674 ?auto_128670 ) ) ( not ( = ?auto_128674 ?auto_128669 ) ) ( not ( = ?auto_128674 ?auto_128673 ) ) ( not ( = ?auto_128672 ?auto_128670 ) ) ( not ( = ?auto_128672 ?auto_128669 ) ) ( not ( = ?auto_128672 ?auto_128673 ) ) ( ON ?auto_128671 ?auto_128672 ) ( ON ?auto_128670 ?auto_128671 ) ( ON ?auto_128673 ?auto_128670 ) ( ON ?auto_128669 ?auto_128673 ) ( CLEAR ?auto_128669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128666 ?auto_128667 ?auto_128668 ?auto_128674 ?auto_128672 ?auto_128671 ?auto_128670 ?auto_128673 )
      ( MAKE-3PILE ?auto_128666 ?auto_128667 ?auto_128668 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128681 - BLOCK
      ?auto_128682 - BLOCK
      ?auto_128683 - BLOCK
      ?auto_128684 - BLOCK
      ?auto_128685 - BLOCK
      ?auto_128686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128686 ) ( CLEAR ?auto_128685 ) ( ON-TABLE ?auto_128681 ) ( ON ?auto_128682 ?auto_128681 ) ( ON ?auto_128683 ?auto_128682 ) ( ON ?auto_128684 ?auto_128683 ) ( ON ?auto_128685 ?auto_128684 ) ( not ( = ?auto_128681 ?auto_128682 ) ) ( not ( = ?auto_128681 ?auto_128683 ) ) ( not ( = ?auto_128681 ?auto_128684 ) ) ( not ( = ?auto_128681 ?auto_128685 ) ) ( not ( = ?auto_128681 ?auto_128686 ) ) ( not ( = ?auto_128682 ?auto_128683 ) ) ( not ( = ?auto_128682 ?auto_128684 ) ) ( not ( = ?auto_128682 ?auto_128685 ) ) ( not ( = ?auto_128682 ?auto_128686 ) ) ( not ( = ?auto_128683 ?auto_128684 ) ) ( not ( = ?auto_128683 ?auto_128685 ) ) ( not ( = ?auto_128683 ?auto_128686 ) ) ( not ( = ?auto_128684 ?auto_128685 ) ) ( not ( = ?auto_128684 ?auto_128686 ) ) ( not ( = ?auto_128685 ?auto_128686 ) ) )
    :subtasks
    ( ( !STACK ?auto_128686 ?auto_128685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128687 - BLOCK
      ?auto_128688 - BLOCK
      ?auto_128689 - BLOCK
      ?auto_128690 - BLOCK
      ?auto_128691 - BLOCK
      ?auto_128692 - BLOCK
    )
    :vars
    (
      ?auto_128693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128691 ) ( ON-TABLE ?auto_128687 ) ( ON ?auto_128688 ?auto_128687 ) ( ON ?auto_128689 ?auto_128688 ) ( ON ?auto_128690 ?auto_128689 ) ( ON ?auto_128691 ?auto_128690 ) ( not ( = ?auto_128687 ?auto_128688 ) ) ( not ( = ?auto_128687 ?auto_128689 ) ) ( not ( = ?auto_128687 ?auto_128690 ) ) ( not ( = ?auto_128687 ?auto_128691 ) ) ( not ( = ?auto_128687 ?auto_128692 ) ) ( not ( = ?auto_128688 ?auto_128689 ) ) ( not ( = ?auto_128688 ?auto_128690 ) ) ( not ( = ?auto_128688 ?auto_128691 ) ) ( not ( = ?auto_128688 ?auto_128692 ) ) ( not ( = ?auto_128689 ?auto_128690 ) ) ( not ( = ?auto_128689 ?auto_128691 ) ) ( not ( = ?auto_128689 ?auto_128692 ) ) ( not ( = ?auto_128690 ?auto_128691 ) ) ( not ( = ?auto_128690 ?auto_128692 ) ) ( not ( = ?auto_128691 ?auto_128692 ) ) ( ON ?auto_128692 ?auto_128693 ) ( CLEAR ?auto_128692 ) ( HAND-EMPTY ) ( not ( = ?auto_128687 ?auto_128693 ) ) ( not ( = ?auto_128688 ?auto_128693 ) ) ( not ( = ?auto_128689 ?auto_128693 ) ) ( not ( = ?auto_128690 ?auto_128693 ) ) ( not ( = ?auto_128691 ?auto_128693 ) ) ( not ( = ?auto_128692 ?auto_128693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128692 ?auto_128693 )
      ( MAKE-6PILE ?auto_128687 ?auto_128688 ?auto_128689 ?auto_128690 ?auto_128691 ?auto_128692 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128694 - BLOCK
      ?auto_128695 - BLOCK
      ?auto_128696 - BLOCK
      ?auto_128697 - BLOCK
      ?auto_128698 - BLOCK
      ?auto_128699 - BLOCK
    )
    :vars
    (
      ?auto_128700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128694 ) ( ON ?auto_128695 ?auto_128694 ) ( ON ?auto_128696 ?auto_128695 ) ( ON ?auto_128697 ?auto_128696 ) ( not ( = ?auto_128694 ?auto_128695 ) ) ( not ( = ?auto_128694 ?auto_128696 ) ) ( not ( = ?auto_128694 ?auto_128697 ) ) ( not ( = ?auto_128694 ?auto_128698 ) ) ( not ( = ?auto_128694 ?auto_128699 ) ) ( not ( = ?auto_128695 ?auto_128696 ) ) ( not ( = ?auto_128695 ?auto_128697 ) ) ( not ( = ?auto_128695 ?auto_128698 ) ) ( not ( = ?auto_128695 ?auto_128699 ) ) ( not ( = ?auto_128696 ?auto_128697 ) ) ( not ( = ?auto_128696 ?auto_128698 ) ) ( not ( = ?auto_128696 ?auto_128699 ) ) ( not ( = ?auto_128697 ?auto_128698 ) ) ( not ( = ?auto_128697 ?auto_128699 ) ) ( not ( = ?auto_128698 ?auto_128699 ) ) ( ON ?auto_128699 ?auto_128700 ) ( CLEAR ?auto_128699 ) ( not ( = ?auto_128694 ?auto_128700 ) ) ( not ( = ?auto_128695 ?auto_128700 ) ) ( not ( = ?auto_128696 ?auto_128700 ) ) ( not ( = ?auto_128697 ?auto_128700 ) ) ( not ( = ?auto_128698 ?auto_128700 ) ) ( not ( = ?auto_128699 ?auto_128700 ) ) ( HOLDING ?auto_128698 ) ( CLEAR ?auto_128697 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128694 ?auto_128695 ?auto_128696 ?auto_128697 ?auto_128698 )
      ( MAKE-6PILE ?auto_128694 ?auto_128695 ?auto_128696 ?auto_128697 ?auto_128698 ?auto_128699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128701 - BLOCK
      ?auto_128702 - BLOCK
      ?auto_128703 - BLOCK
      ?auto_128704 - BLOCK
      ?auto_128705 - BLOCK
      ?auto_128706 - BLOCK
    )
    :vars
    (
      ?auto_128707 - BLOCK
      ?auto_128708 - BLOCK
      ?auto_128709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128701 ) ( ON ?auto_128702 ?auto_128701 ) ( ON ?auto_128703 ?auto_128702 ) ( ON ?auto_128704 ?auto_128703 ) ( not ( = ?auto_128701 ?auto_128702 ) ) ( not ( = ?auto_128701 ?auto_128703 ) ) ( not ( = ?auto_128701 ?auto_128704 ) ) ( not ( = ?auto_128701 ?auto_128705 ) ) ( not ( = ?auto_128701 ?auto_128706 ) ) ( not ( = ?auto_128702 ?auto_128703 ) ) ( not ( = ?auto_128702 ?auto_128704 ) ) ( not ( = ?auto_128702 ?auto_128705 ) ) ( not ( = ?auto_128702 ?auto_128706 ) ) ( not ( = ?auto_128703 ?auto_128704 ) ) ( not ( = ?auto_128703 ?auto_128705 ) ) ( not ( = ?auto_128703 ?auto_128706 ) ) ( not ( = ?auto_128704 ?auto_128705 ) ) ( not ( = ?auto_128704 ?auto_128706 ) ) ( not ( = ?auto_128705 ?auto_128706 ) ) ( ON ?auto_128706 ?auto_128707 ) ( not ( = ?auto_128701 ?auto_128707 ) ) ( not ( = ?auto_128702 ?auto_128707 ) ) ( not ( = ?auto_128703 ?auto_128707 ) ) ( not ( = ?auto_128704 ?auto_128707 ) ) ( not ( = ?auto_128705 ?auto_128707 ) ) ( not ( = ?auto_128706 ?auto_128707 ) ) ( CLEAR ?auto_128704 ) ( ON ?auto_128705 ?auto_128706 ) ( CLEAR ?auto_128705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128708 ) ( ON ?auto_128709 ?auto_128708 ) ( ON ?auto_128707 ?auto_128709 ) ( not ( = ?auto_128708 ?auto_128709 ) ) ( not ( = ?auto_128708 ?auto_128707 ) ) ( not ( = ?auto_128708 ?auto_128706 ) ) ( not ( = ?auto_128708 ?auto_128705 ) ) ( not ( = ?auto_128709 ?auto_128707 ) ) ( not ( = ?auto_128709 ?auto_128706 ) ) ( not ( = ?auto_128709 ?auto_128705 ) ) ( not ( = ?auto_128701 ?auto_128708 ) ) ( not ( = ?auto_128701 ?auto_128709 ) ) ( not ( = ?auto_128702 ?auto_128708 ) ) ( not ( = ?auto_128702 ?auto_128709 ) ) ( not ( = ?auto_128703 ?auto_128708 ) ) ( not ( = ?auto_128703 ?auto_128709 ) ) ( not ( = ?auto_128704 ?auto_128708 ) ) ( not ( = ?auto_128704 ?auto_128709 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128708 ?auto_128709 ?auto_128707 ?auto_128706 )
      ( MAKE-6PILE ?auto_128701 ?auto_128702 ?auto_128703 ?auto_128704 ?auto_128705 ?auto_128706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128710 - BLOCK
      ?auto_128711 - BLOCK
      ?auto_128712 - BLOCK
      ?auto_128713 - BLOCK
      ?auto_128714 - BLOCK
      ?auto_128715 - BLOCK
    )
    :vars
    (
      ?auto_128716 - BLOCK
      ?auto_128717 - BLOCK
      ?auto_128718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128710 ) ( ON ?auto_128711 ?auto_128710 ) ( ON ?auto_128712 ?auto_128711 ) ( not ( = ?auto_128710 ?auto_128711 ) ) ( not ( = ?auto_128710 ?auto_128712 ) ) ( not ( = ?auto_128710 ?auto_128713 ) ) ( not ( = ?auto_128710 ?auto_128714 ) ) ( not ( = ?auto_128710 ?auto_128715 ) ) ( not ( = ?auto_128711 ?auto_128712 ) ) ( not ( = ?auto_128711 ?auto_128713 ) ) ( not ( = ?auto_128711 ?auto_128714 ) ) ( not ( = ?auto_128711 ?auto_128715 ) ) ( not ( = ?auto_128712 ?auto_128713 ) ) ( not ( = ?auto_128712 ?auto_128714 ) ) ( not ( = ?auto_128712 ?auto_128715 ) ) ( not ( = ?auto_128713 ?auto_128714 ) ) ( not ( = ?auto_128713 ?auto_128715 ) ) ( not ( = ?auto_128714 ?auto_128715 ) ) ( ON ?auto_128715 ?auto_128716 ) ( not ( = ?auto_128710 ?auto_128716 ) ) ( not ( = ?auto_128711 ?auto_128716 ) ) ( not ( = ?auto_128712 ?auto_128716 ) ) ( not ( = ?auto_128713 ?auto_128716 ) ) ( not ( = ?auto_128714 ?auto_128716 ) ) ( not ( = ?auto_128715 ?auto_128716 ) ) ( ON ?auto_128714 ?auto_128715 ) ( CLEAR ?auto_128714 ) ( ON-TABLE ?auto_128717 ) ( ON ?auto_128718 ?auto_128717 ) ( ON ?auto_128716 ?auto_128718 ) ( not ( = ?auto_128717 ?auto_128718 ) ) ( not ( = ?auto_128717 ?auto_128716 ) ) ( not ( = ?auto_128717 ?auto_128715 ) ) ( not ( = ?auto_128717 ?auto_128714 ) ) ( not ( = ?auto_128718 ?auto_128716 ) ) ( not ( = ?auto_128718 ?auto_128715 ) ) ( not ( = ?auto_128718 ?auto_128714 ) ) ( not ( = ?auto_128710 ?auto_128717 ) ) ( not ( = ?auto_128710 ?auto_128718 ) ) ( not ( = ?auto_128711 ?auto_128717 ) ) ( not ( = ?auto_128711 ?auto_128718 ) ) ( not ( = ?auto_128712 ?auto_128717 ) ) ( not ( = ?auto_128712 ?auto_128718 ) ) ( not ( = ?auto_128713 ?auto_128717 ) ) ( not ( = ?auto_128713 ?auto_128718 ) ) ( HOLDING ?auto_128713 ) ( CLEAR ?auto_128712 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128710 ?auto_128711 ?auto_128712 ?auto_128713 )
      ( MAKE-6PILE ?auto_128710 ?auto_128711 ?auto_128712 ?auto_128713 ?auto_128714 ?auto_128715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128719 - BLOCK
      ?auto_128720 - BLOCK
      ?auto_128721 - BLOCK
      ?auto_128722 - BLOCK
      ?auto_128723 - BLOCK
      ?auto_128724 - BLOCK
    )
    :vars
    (
      ?auto_128727 - BLOCK
      ?auto_128725 - BLOCK
      ?auto_128726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128719 ) ( ON ?auto_128720 ?auto_128719 ) ( ON ?auto_128721 ?auto_128720 ) ( not ( = ?auto_128719 ?auto_128720 ) ) ( not ( = ?auto_128719 ?auto_128721 ) ) ( not ( = ?auto_128719 ?auto_128722 ) ) ( not ( = ?auto_128719 ?auto_128723 ) ) ( not ( = ?auto_128719 ?auto_128724 ) ) ( not ( = ?auto_128720 ?auto_128721 ) ) ( not ( = ?auto_128720 ?auto_128722 ) ) ( not ( = ?auto_128720 ?auto_128723 ) ) ( not ( = ?auto_128720 ?auto_128724 ) ) ( not ( = ?auto_128721 ?auto_128722 ) ) ( not ( = ?auto_128721 ?auto_128723 ) ) ( not ( = ?auto_128721 ?auto_128724 ) ) ( not ( = ?auto_128722 ?auto_128723 ) ) ( not ( = ?auto_128722 ?auto_128724 ) ) ( not ( = ?auto_128723 ?auto_128724 ) ) ( ON ?auto_128724 ?auto_128727 ) ( not ( = ?auto_128719 ?auto_128727 ) ) ( not ( = ?auto_128720 ?auto_128727 ) ) ( not ( = ?auto_128721 ?auto_128727 ) ) ( not ( = ?auto_128722 ?auto_128727 ) ) ( not ( = ?auto_128723 ?auto_128727 ) ) ( not ( = ?auto_128724 ?auto_128727 ) ) ( ON ?auto_128723 ?auto_128724 ) ( ON-TABLE ?auto_128725 ) ( ON ?auto_128726 ?auto_128725 ) ( ON ?auto_128727 ?auto_128726 ) ( not ( = ?auto_128725 ?auto_128726 ) ) ( not ( = ?auto_128725 ?auto_128727 ) ) ( not ( = ?auto_128725 ?auto_128724 ) ) ( not ( = ?auto_128725 ?auto_128723 ) ) ( not ( = ?auto_128726 ?auto_128727 ) ) ( not ( = ?auto_128726 ?auto_128724 ) ) ( not ( = ?auto_128726 ?auto_128723 ) ) ( not ( = ?auto_128719 ?auto_128725 ) ) ( not ( = ?auto_128719 ?auto_128726 ) ) ( not ( = ?auto_128720 ?auto_128725 ) ) ( not ( = ?auto_128720 ?auto_128726 ) ) ( not ( = ?auto_128721 ?auto_128725 ) ) ( not ( = ?auto_128721 ?auto_128726 ) ) ( not ( = ?auto_128722 ?auto_128725 ) ) ( not ( = ?auto_128722 ?auto_128726 ) ) ( CLEAR ?auto_128721 ) ( ON ?auto_128722 ?auto_128723 ) ( CLEAR ?auto_128722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128725 ?auto_128726 ?auto_128727 ?auto_128724 ?auto_128723 )
      ( MAKE-6PILE ?auto_128719 ?auto_128720 ?auto_128721 ?auto_128722 ?auto_128723 ?auto_128724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128728 - BLOCK
      ?auto_128729 - BLOCK
      ?auto_128730 - BLOCK
      ?auto_128731 - BLOCK
      ?auto_128732 - BLOCK
      ?auto_128733 - BLOCK
    )
    :vars
    (
      ?auto_128735 - BLOCK
      ?auto_128736 - BLOCK
      ?auto_128734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128728 ) ( ON ?auto_128729 ?auto_128728 ) ( not ( = ?auto_128728 ?auto_128729 ) ) ( not ( = ?auto_128728 ?auto_128730 ) ) ( not ( = ?auto_128728 ?auto_128731 ) ) ( not ( = ?auto_128728 ?auto_128732 ) ) ( not ( = ?auto_128728 ?auto_128733 ) ) ( not ( = ?auto_128729 ?auto_128730 ) ) ( not ( = ?auto_128729 ?auto_128731 ) ) ( not ( = ?auto_128729 ?auto_128732 ) ) ( not ( = ?auto_128729 ?auto_128733 ) ) ( not ( = ?auto_128730 ?auto_128731 ) ) ( not ( = ?auto_128730 ?auto_128732 ) ) ( not ( = ?auto_128730 ?auto_128733 ) ) ( not ( = ?auto_128731 ?auto_128732 ) ) ( not ( = ?auto_128731 ?auto_128733 ) ) ( not ( = ?auto_128732 ?auto_128733 ) ) ( ON ?auto_128733 ?auto_128735 ) ( not ( = ?auto_128728 ?auto_128735 ) ) ( not ( = ?auto_128729 ?auto_128735 ) ) ( not ( = ?auto_128730 ?auto_128735 ) ) ( not ( = ?auto_128731 ?auto_128735 ) ) ( not ( = ?auto_128732 ?auto_128735 ) ) ( not ( = ?auto_128733 ?auto_128735 ) ) ( ON ?auto_128732 ?auto_128733 ) ( ON-TABLE ?auto_128736 ) ( ON ?auto_128734 ?auto_128736 ) ( ON ?auto_128735 ?auto_128734 ) ( not ( = ?auto_128736 ?auto_128734 ) ) ( not ( = ?auto_128736 ?auto_128735 ) ) ( not ( = ?auto_128736 ?auto_128733 ) ) ( not ( = ?auto_128736 ?auto_128732 ) ) ( not ( = ?auto_128734 ?auto_128735 ) ) ( not ( = ?auto_128734 ?auto_128733 ) ) ( not ( = ?auto_128734 ?auto_128732 ) ) ( not ( = ?auto_128728 ?auto_128736 ) ) ( not ( = ?auto_128728 ?auto_128734 ) ) ( not ( = ?auto_128729 ?auto_128736 ) ) ( not ( = ?auto_128729 ?auto_128734 ) ) ( not ( = ?auto_128730 ?auto_128736 ) ) ( not ( = ?auto_128730 ?auto_128734 ) ) ( not ( = ?auto_128731 ?auto_128736 ) ) ( not ( = ?auto_128731 ?auto_128734 ) ) ( ON ?auto_128731 ?auto_128732 ) ( CLEAR ?auto_128731 ) ( HOLDING ?auto_128730 ) ( CLEAR ?auto_128729 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128728 ?auto_128729 ?auto_128730 )
      ( MAKE-6PILE ?auto_128728 ?auto_128729 ?auto_128730 ?auto_128731 ?auto_128732 ?auto_128733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128737 - BLOCK
      ?auto_128738 - BLOCK
      ?auto_128739 - BLOCK
      ?auto_128740 - BLOCK
      ?auto_128741 - BLOCK
      ?auto_128742 - BLOCK
    )
    :vars
    (
      ?auto_128744 - BLOCK
      ?auto_128743 - BLOCK
      ?auto_128745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128737 ) ( ON ?auto_128738 ?auto_128737 ) ( not ( = ?auto_128737 ?auto_128738 ) ) ( not ( = ?auto_128737 ?auto_128739 ) ) ( not ( = ?auto_128737 ?auto_128740 ) ) ( not ( = ?auto_128737 ?auto_128741 ) ) ( not ( = ?auto_128737 ?auto_128742 ) ) ( not ( = ?auto_128738 ?auto_128739 ) ) ( not ( = ?auto_128738 ?auto_128740 ) ) ( not ( = ?auto_128738 ?auto_128741 ) ) ( not ( = ?auto_128738 ?auto_128742 ) ) ( not ( = ?auto_128739 ?auto_128740 ) ) ( not ( = ?auto_128739 ?auto_128741 ) ) ( not ( = ?auto_128739 ?auto_128742 ) ) ( not ( = ?auto_128740 ?auto_128741 ) ) ( not ( = ?auto_128740 ?auto_128742 ) ) ( not ( = ?auto_128741 ?auto_128742 ) ) ( ON ?auto_128742 ?auto_128744 ) ( not ( = ?auto_128737 ?auto_128744 ) ) ( not ( = ?auto_128738 ?auto_128744 ) ) ( not ( = ?auto_128739 ?auto_128744 ) ) ( not ( = ?auto_128740 ?auto_128744 ) ) ( not ( = ?auto_128741 ?auto_128744 ) ) ( not ( = ?auto_128742 ?auto_128744 ) ) ( ON ?auto_128741 ?auto_128742 ) ( ON-TABLE ?auto_128743 ) ( ON ?auto_128745 ?auto_128743 ) ( ON ?auto_128744 ?auto_128745 ) ( not ( = ?auto_128743 ?auto_128745 ) ) ( not ( = ?auto_128743 ?auto_128744 ) ) ( not ( = ?auto_128743 ?auto_128742 ) ) ( not ( = ?auto_128743 ?auto_128741 ) ) ( not ( = ?auto_128745 ?auto_128744 ) ) ( not ( = ?auto_128745 ?auto_128742 ) ) ( not ( = ?auto_128745 ?auto_128741 ) ) ( not ( = ?auto_128737 ?auto_128743 ) ) ( not ( = ?auto_128737 ?auto_128745 ) ) ( not ( = ?auto_128738 ?auto_128743 ) ) ( not ( = ?auto_128738 ?auto_128745 ) ) ( not ( = ?auto_128739 ?auto_128743 ) ) ( not ( = ?auto_128739 ?auto_128745 ) ) ( not ( = ?auto_128740 ?auto_128743 ) ) ( not ( = ?auto_128740 ?auto_128745 ) ) ( ON ?auto_128740 ?auto_128741 ) ( CLEAR ?auto_128738 ) ( ON ?auto_128739 ?auto_128740 ) ( CLEAR ?auto_128739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128743 ?auto_128745 ?auto_128744 ?auto_128742 ?auto_128741 ?auto_128740 )
      ( MAKE-6PILE ?auto_128737 ?auto_128738 ?auto_128739 ?auto_128740 ?auto_128741 ?auto_128742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128746 - BLOCK
      ?auto_128747 - BLOCK
      ?auto_128748 - BLOCK
      ?auto_128749 - BLOCK
      ?auto_128750 - BLOCK
      ?auto_128751 - BLOCK
    )
    :vars
    (
      ?auto_128754 - BLOCK
      ?auto_128752 - BLOCK
      ?auto_128753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128746 ) ( not ( = ?auto_128746 ?auto_128747 ) ) ( not ( = ?auto_128746 ?auto_128748 ) ) ( not ( = ?auto_128746 ?auto_128749 ) ) ( not ( = ?auto_128746 ?auto_128750 ) ) ( not ( = ?auto_128746 ?auto_128751 ) ) ( not ( = ?auto_128747 ?auto_128748 ) ) ( not ( = ?auto_128747 ?auto_128749 ) ) ( not ( = ?auto_128747 ?auto_128750 ) ) ( not ( = ?auto_128747 ?auto_128751 ) ) ( not ( = ?auto_128748 ?auto_128749 ) ) ( not ( = ?auto_128748 ?auto_128750 ) ) ( not ( = ?auto_128748 ?auto_128751 ) ) ( not ( = ?auto_128749 ?auto_128750 ) ) ( not ( = ?auto_128749 ?auto_128751 ) ) ( not ( = ?auto_128750 ?auto_128751 ) ) ( ON ?auto_128751 ?auto_128754 ) ( not ( = ?auto_128746 ?auto_128754 ) ) ( not ( = ?auto_128747 ?auto_128754 ) ) ( not ( = ?auto_128748 ?auto_128754 ) ) ( not ( = ?auto_128749 ?auto_128754 ) ) ( not ( = ?auto_128750 ?auto_128754 ) ) ( not ( = ?auto_128751 ?auto_128754 ) ) ( ON ?auto_128750 ?auto_128751 ) ( ON-TABLE ?auto_128752 ) ( ON ?auto_128753 ?auto_128752 ) ( ON ?auto_128754 ?auto_128753 ) ( not ( = ?auto_128752 ?auto_128753 ) ) ( not ( = ?auto_128752 ?auto_128754 ) ) ( not ( = ?auto_128752 ?auto_128751 ) ) ( not ( = ?auto_128752 ?auto_128750 ) ) ( not ( = ?auto_128753 ?auto_128754 ) ) ( not ( = ?auto_128753 ?auto_128751 ) ) ( not ( = ?auto_128753 ?auto_128750 ) ) ( not ( = ?auto_128746 ?auto_128752 ) ) ( not ( = ?auto_128746 ?auto_128753 ) ) ( not ( = ?auto_128747 ?auto_128752 ) ) ( not ( = ?auto_128747 ?auto_128753 ) ) ( not ( = ?auto_128748 ?auto_128752 ) ) ( not ( = ?auto_128748 ?auto_128753 ) ) ( not ( = ?auto_128749 ?auto_128752 ) ) ( not ( = ?auto_128749 ?auto_128753 ) ) ( ON ?auto_128749 ?auto_128750 ) ( ON ?auto_128748 ?auto_128749 ) ( CLEAR ?auto_128748 ) ( HOLDING ?auto_128747 ) ( CLEAR ?auto_128746 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128746 ?auto_128747 )
      ( MAKE-6PILE ?auto_128746 ?auto_128747 ?auto_128748 ?auto_128749 ?auto_128750 ?auto_128751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128755 - BLOCK
      ?auto_128756 - BLOCK
      ?auto_128757 - BLOCK
      ?auto_128758 - BLOCK
      ?auto_128759 - BLOCK
      ?auto_128760 - BLOCK
    )
    :vars
    (
      ?auto_128762 - BLOCK
      ?auto_128761 - BLOCK
      ?auto_128763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128755 ) ( not ( = ?auto_128755 ?auto_128756 ) ) ( not ( = ?auto_128755 ?auto_128757 ) ) ( not ( = ?auto_128755 ?auto_128758 ) ) ( not ( = ?auto_128755 ?auto_128759 ) ) ( not ( = ?auto_128755 ?auto_128760 ) ) ( not ( = ?auto_128756 ?auto_128757 ) ) ( not ( = ?auto_128756 ?auto_128758 ) ) ( not ( = ?auto_128756 ?auto_128759 ) ) ( not ( = ?auto_128756 ?auto_128760 ) ) ( not ( = ?auto_128757 ?auto_128758 ) ) ( not ( = ?auto_128757 ?auto_128759 ) ) ( not ( = ?auto_128757 ?auto_128760 ) ) ( not ( = ?auto_128758 ?auto_128759 ) ) ( not ( = ?auto_128758 ?auto_128760 ) ) ( not ( = ?auto_128759 ?auto_128760 ) ) ( ON ?auto_128760 ?auto_128762 ) ( not ( = ?auto_128755 ?auto_128762 ) ) ( not ( = ?auto_128756 ?auto_128762 ) ) ( not ( = ?auto_128757 ?auto_128762 ) ) ( not ( = ?auto_128758 ?auto_128762 ) ) ( not ( = ?auto_128759 ?auto_128762 ) ) ( not ( = ?auto_128760 ?auto_128762 ) ) ( ON ?auto_128759 ?auto_128760 ) ( ON-TABLE ?auto_128761 ) ( ON ?auto_128763 ?auto_128761 ) ( ON ?auto_128762 ?auto_128763 ) ( not ( = ?auto_128761 ?auto_128763 ) ) ( not ( = ?auto_128761 ?auto_128762 ) ) ( not ( = ?auto_128761 ?auto_128760 ) ) ( not ( = ?auto_128761 ?auto_128759 ) ) ( not ( = ?auto_128763 ?auto_128762 ) ) ( not ( = ?auto_128763 ?auto_128760 ) ) ( not ( = ?auto_128763 ?auto_128759 ) ) ( not ( = ?auto_128755 ?auto_128761 ) ) ( not ( = ?auto_128755 ?auto_128763 ) ) ( not ( = ?auto_128756 ?auto_128761 ) ) ( not ( = ?auto_128756 ?auto_128763 ) ) ( not ( = ?auto_128757 ?auto_128761 ) ) ( not ( = ?auto_128757 ?auto_128763 ) ) ( not ( = ?auto_128758 ?auto_128761 ) ) ( not ( = ?auto_128758 ?auto_128763 ) ) ( ON ?auto_128758 ?auto_128759 ) ( ON ?auto_128757 ?auto_128758 ) ( CLEAR ?auto_128755 ) ( ON ?auto_128756 ?auto_128757 ) ( CLEAR ?auto_128756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128761 ?auto_128763 ?auto_128762 ?auto_128760 ?auto_128759 ?auto_128758 ?auto_128757 )
      ( MAKE-6PILE ?auto_128755 ?auto_128756 ?auto_128757 ?auto_128758 ?auto_128759 ?auto_128760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128764 - BLOCK
      ?auto_128765 - BLOCK
      ?auto_128766 - BLOCK
      ?auto_128767 - BLOCK
      ?auto_128768 - BLOCK
      ?auto_128769 - BLOCK
    )
    :vars
    (
      ?auto_128771 - BLOCK
      ?auto_128772 - BLOCK
      ?auto_128770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128764 ?auto_128765 ) ) ( not ( = ?auto_128764 ?auto_128766 ) ) ( not ( = ?auto_128764 ?auto_128767 ) ) ( not ( = ?auto_128764 ?auto_128768 ) ) ( not ( = ?auto_128764 ?auto_128769 ) ) ( not ( = ?auto_128765 ?auto_128766 ) ) ( not ( = ?auto_128765 ?auto_128767 ) ) ( not ( = ?auto_128765 ?auto_128768 ) ) ( not ( = ?auto_128765 ?auto_128769 ) ) ( not ( = ?auto_128766 ?auto_128767 ) ) ( not ( = ?auto_128766 ?auto_128768 ) ) ( not ( = ?auto_128766 ?auto_128769 ) ) ( not ( = ?auto_128767 ?auto_128768 ) ) ( not ( = ?auto_128767 ?auto_128769 ) ) ( not ( = ?auto_128768 ?auto_128769 ) ) ( ON ?auto_128769 ?auto_128771 ) ( not ( = ?auto_128764 ?auto_128771 ) ) ( not ( = ?auto_128765 ?auto_128771 ) ) ( not ( = ?auto_128766 ?auto_128771 ) ) ( not ( = ?auto_128767 ?auto_128771 ) ) ( not ( = ?auto_128768 ?auto_128771 ) ) ( not ( = ?auto_128769 ?auto_128771 ) ) ( ON ?auto_128768 ?auto_128769 ) ( ON-TABLE ?auto_128772 ) ( ON ?auto_128770 ?auto_128772 ) ( ON ?auto_128771 ?auto_128770 ) ( not ( = ?auto_128772 ?auto_128770 ) ) ( not ( = ?auto_128772 ?auto_128771 ) ) ( not ( = ?auto_128772 ?auto_128769 ) ) ( not ( = ?auto_128772 ?auto_128768 ) ) ( not ( = ?auto_128770 ?auto_128771 ) ) ( not ( = ?auto_128770 ?auto_128769 ) ) ( not ( = ?auto_128770 ?auto_128768 ) ) ( not ( = ?auto_128764 ?auto_128772 ) ) ( not ( = ?auto_128764 ?auto_128770 ) ) ( not ( = ?auto_128765 ?auto_128772 ) ) ( not ( = ?auto_128765 ?auto_128770 ) ) ( not ( = ?auto_128766 ?auto_128772 ) ) ( not ( = ?auto_128766 ?auto_128770 ) ) ( not ( = ?auto_128767 ?auto_128772 ) ) ( not ( = ?auto_128767 ?auto_128770 ) ) ( ON ?auto_128767 ?auto_128768 ) ( ON ?auto_128766 ?auto_128767 ) ( ON ?auto_128765 ?auto_128766 ) ( CLEAR ?auto_128765 ) ( HOLDING ?auto_128764 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128764 )
      ( MAKE-6PILE ?auto_128764 ?auto_128765 ?auto_128766 ?auto_128767 ?auto_128768 ?auto_128769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128773 - BLOCK
      ?auto_128774 - BLOCK
      ?auto_128775 - BLOCK
      ?auto_128776 - BLOCK
      ?auto_128777 - BLOCK
      ?auto_128778 - BLOCK
    )
    :vars
    (
      ?auto_128779 - BLOCK
      ?auto_128780 - BLOCK
      ?auto_128781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128773 ?auto_128774 ) ) ( not ( = ?auto_128773 ?auto_128775 ) ) ( not ( = ?auto_128773 ?auto_128776 ) ) ( not ( = ?auto_128773 ?auto_128777 ) ) ( not ( = ?auto_128773 ?auto_128778 ) ) ( not ( = ?auto_128774 ?auto_128775 ) ) ( not ( = ?auto_128774 ?auto_128776 ) ) ( not ( = ?auto_128774 ?auto_128777 ) ) ( not ( = ?auto_128774 ?auto_128778 ) ) ( not ( = ?auto_128775 ?auto_128776 ) ) ( not ( = ?auto_128775 ?auto_128777 ) ) ( not ( = ?auto_128775 ?auto_128778 ) ) ( not ( = ?auto_128776 ?auto_128777 ) ) ( not ( = ?auto_128776 ?auto_128778 ) ) ( not ( = ?auto_128777 ?auto_128778 ) ) ( ON ?auto_128778 ?auto_128779 ) ( not ( = ?auto_128773 ?auto_128779 ) ) ( not ( = ?auto_128774 ?auto_128779 ) ) ( not ( = ?auto_128775 ?auto_128779 ) ) ( not ( = ?auto_128776 ?auto_128779 ) ) ( not ( = ?auto_128777 ?auto_128779 ) ) ( not ( = ?auto_128778 ?auto_128779 ) ) ( ON ?auto_128777 ?auto_128778 ) ( ON-TABLE ?auto_128780 ) ( ON ?auto_128781 ?auto_128780 ) ( ON ?auto_128779 ?auto_128781 ) ( not ( = ?auto_128780 ?auto_128781 ) ) ( not ( = ?auto_128780 ?auto_128779 ) ) ( not ( = ?auto_128780 ?auto_128778 ) ) ( not ( = ?auto_128780 ?auto_128777 ) ) ( not ( = ?auto_128781 ?auto_128779 ) ) ( not ( = ?auto_128781 ?auto_128778 ) ) ( not ( = ?auto_128781 ?auto_128777 ) ) ( not ( = ?auto_128773 ?auto_128780 ) ) ( not ( = ?auto_128773 ?auto_128781 ) ) ( not ( = ?auto_128774 ?auto_128780 ) ) ( not ( = ?auto_128774 ?auto_128781 ) ) ( not ( = ?auto_128775 ?auto_128780 ) ) ( not ( = ?auto_128775 ?auto_128781 ) ) ( not ( = ?auto_128776 ?auto_128780 ) ) ( not ( = ?auto_128776 ?auto_128781 ) ) ( ON ?auto_128776 ?auto_128777 ) ( ON ?auto_128775 ?auto_128776 ) ( ON ?auto_128774 ?auto_128775 ) ( ON ?auto_128773 ?auto_128774 ) ( CLEAR ?auto_128773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128780 ?auto_128781 ?auto_128779 ?auto_128778 ?auto_128777 ?auto_128776 ?auto_128775 ?auto_128774 )
      ( MAKE-6PILE ?auto_128773 ?auto_128774 ?auto_128775 ?auto_128776 ?auto_128777 ?auto_128778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128784 - BLOCK
      ?auto_128785 - BLOCK
    )
    :vars
    (
      ?auto_128786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128786 ?auto_128785 ) ( CLEAR ?auto_128786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128784 ) ( ON ?auto_128785 ?auto_128784 ) ( not ( = ?auto_128784 ?auto_128785 ) ) ( not ( = ?auto_128784 ?auto_128786 ) ) ( not ( = ?auto_128785 ?auto_128786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128786 ?auto_128785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128787 - BLOCK
      ?auto_128788 - BLOCK
    )
    :vars
    (
      ?auto_128789 - BLOCK
      ?auto_128790 - BLOCK
      ?auto_128791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128789 ?auto_128788 ) ( CLEAR ?auto_128789 ) ( ON-TABLE ?auto_128787 ) ( ON ?auto_128788 ?auto_128787 ) ( not ( = ?auto_128787 ?auto_128788 ) ) ( not ( = ?auto_128787 ?auto_128789 ) ) ( not ( = ?auto_128788 ?auto_128789 ) ) ( HOLDING ?auto_128790 ) ( CLEAR ?auto_128791 ) ( not ( = ?auto_128787 ?auto_128790 ) ) ( not ( = ?auto_128787 ?auto_128791 ) ) ( not ( = ?auto_128788 ?auto_128790 ) ) ( not ( = ?auto_128788 ?auto_128791 ) ) ( not ( = ?auto_128789 ?auto_128790 ) ) ( not ( = ?auto_128789 ?auto_128791 ) ) ( not ( = ?auto_128790 ?auto_128791 ) ) )
    :subtasks
    ( ( !STACK ?auto_128790 ?auto_128791 )
      ( MAKE-2PILE ?auto_128787 ?auto_128788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128792 - BLOCK
      ?auto_128793 - BLOCK
    )
    :vars
    (
      ?auto_128796 - BLOCK
      ?auto_128794 - BLOCK
      ?auto_128795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128796 ?auto_128793 ) ( ON-TABLE ?auto_128792 ) ( ON ?auto_128793 ?auto_128792 ) ( not ( = ?auto_128792 ?auto_128793 ) ) ( not ( = ?auto_128792 ?auto_128796 ) ) ( not ( = ?auto_128793 ?auto_128796 ) ) ( CLEAR ?auto_128794 ) ( not ( = ?auto_128792 ?auto_128795 ) ) ( not ( = ?auto_128792 ?auto_128794 ) ) ( not ( = ?auto_128793 ?auto_128795 ) ) ( not ( = ?auto_128793 ?auto_128794 ) ) ( not ( = ?auto_128796 ?auto_128795 ) ) ( not ( = ?auto_128796 ?auto_128794 ) ) ( not ( = ?auto_128795 ?auto_128794 ) ) ( ON ?auto_128795 ?auto_128796 ) ( CLEAR ?auto_128795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128792 ?auto_128793 ?auto_128796 )
      ( MAKE-2PILE ?auto_128792 ?auto_128793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128797 - BLOCK
      ?auto_128798 - BLOCK
    )
    :vars
    (
      ?auto_128799 - BLOCK
      ?auto_128800 - BLOCK
      ?auto_128801 - BLOCK
      ?auto_128802 - BLOCK
      ?auto_128804 - BLOCK
      ?auto_128805 - BLOCK
      ?auto_128803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128799 ?auto_128798 ) ( ON-TABLE ?auto_128797 ) ( ON ?auto_128798 ?auto_128797 ) ( not ( = ?auto_128797 ?auto_128798 ) ) ( not ( = ?auto_128797 ?auto_128799 ) ) ( not ( = ?auto_128798 ?auto_128799 ) ) ( not ( = ?auto_128797 ?auto_128800 ) ) ( not ( = ?auto_128797 ?auto_128801 ) ) ( not ( = ?auto_128798 ?auto_128800 ) ) ( not ( = ?auto_128798 ?auto_128801 ) ) ( not ( = ?auto_128799 ?auto_128800 ) ) ( not ( = ?auto_128799 ?auto_128801 ) ) ( not ( = ?auto_128800 ?auto_128801 ) ) ( ON ?auto_128800 ?auto_128799 ) ( CLEAR ?auto_128800 ) ( HOLDING ?auto_128801 ) ( CLEAR ?auto_128802 ) ( ON-TABLE ?auto_128804 ) ( ON ?auto_128805 ?auto_128804 ) ( ON ?auto_128803 ?auto_128805 ) ( ON ?auto_128802 ?auto_128803 ) ( not ( = ?auto_128804 ?auto_128805 ) ) ( not ( = ?auto_128804 ?auto_128803 ) ) ( not ( = ?auto_128804 ?auto_128802 ) ) ( not ( = ?auto_128804 ?auto_128801 ) ) ( not ( = ?auto_128805 ?auto_128803 ) ) ( not ( = ?auto_128805 ?auto_128802 ) ) ( not ( = ?auto_128805 ?auto_128801 ) ) ( not ( = ?auto_128803 ?auto_128802 ) ) ( not ( = ?auto_128803 ?auto_128801 ) ) ( not ( = ?auto_128802 ?auto_128801 ) ) ( not ( = ?auto_128797 ?auto_128802 ) ) ( not ( = ?auto_128797 ?auto_128804 ) ) ( not ( = ?auto_128797 ?auto_128805 ) ) ( not ( = ?auto_128797 ?auto_128803 ) ) ( not ( = ?auto_128798 ?auto_128802 ) ) ( not ( = ?auto_128798 ?auto_128804 ) ) ( not ( = ?auto_128798 ?auto_128805 ) ) ( not ( = ?auto_128798 ?auto_128803 ) ) ( not ( = ?auto_128799 ?auto_128802 ) ) ( not ( = ?auto_128799 ?auto_128804 ) ) ( not ( = ?auto_128799 ?auto_128805 ) ) ( not ( = ?auto_128799 ?auto_128803 ) ) ( not ( = ?auto_128800 ?auto_128802 ) ) ( not ( = ?auto_128800 ?auto_128804 ) ) ( not ( = ?auto_128800 ?auto_128805 ) ) ( not ( = ?auto_128800 ?auto_128803 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128804 ?auto_128805 ?auto_128803 ?auto_128802 ?auto_128801 )
      ( MAKE-2PILE ?auto_128797 ?auto_128798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128806 - BLOCK
      ?auto_128807 - BLOCK
    )
    :vars
    (
      ?auto_128808 - BLOCK
      ?auto_128814 - BLOCK
      ?auto_128813 - BLOCK
      ?auto_128810 - BLOCK
      ?auto_128809 - BLOCK
      ?auto_128812 - BLOCK
      ?auto_128811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128808 ?auto_128807 ) ( ON-TABLE ?auto_128806 ) ( ON ?auto_128807 ?auto_128806 ) ( not ( = ?auto_128806 ?auto_128807 ) ) ( not ( = ?auto_128806 ?auto_128808 ) ) ( not ( = ?auto_128807 ?auto_128808 ) ) ( not ( = ?auto_128806 ?auto_128814 ) ) ( not ( = ?auto_128806 ?auto_128813 ) ) ( not ( = ?auto_128807 ?auto_128814 ) ) ( not ( = ?auto_128807 ?auto_128813 ) ) ( not ( = ?auto_128808 ?auto_128814 ) ) ( not ( = ?auto_128808 ?auto_128813 ) ) ( not ( = ?auto_128814 ?auto_128813 ) ) ( ON ?auto_128814 ?auto_128808 ) ( CLEAR ?auto_128810 ) ( ON-TABLE ?auto_128809 ) ( ON ?auto_128812 ?auto_128809 ) ( ON ?auto_128811 ?auto_128812 ) ( ON ?auto_128810 ?auto_128811 ) ( not ( = ?auto_128809 ?auto_128812 ) ) ( not ( = ?auto_128809 ?auto_128811 ) ) ( not ( = ?auto_128809 ?auto_128810 ) ) ( not ( = ?auto_128809 ?auto_128813 ) ) ( not ( = ?auto_128812 ?auto_128811 ) ) ( not ( = ?auto_128812 ?auto_128810 ) ) ( not ( = ?auto_128812 ?auto_128813 ) ) ( not ( = ?auto_128811 ?auto_128810 ) ) ( not ( = ?auto_128811 ?auto_128813 ) ) ( not ( = ?auto_128810 ?auto_128813 ) ) ( not ( = ?auto_128806 ?auto_128810 ) ) ( not ( = ?auto_128806 ?auto_128809 ) ) ( not ( = ?auto_128806 ?auto_128812 ) ) ( not ( = ?auto_128806 ?auto_128811 ) ) ( not ( = ?auto_128807 ?auto_128810 ) ) ( not ( = ?auto_128807 ?auto_128809 ) ) ( not ( = ?auto_128807 ?auto_128812 ) ) ( not ( = ?auto_128807 ?auto_128811 ) ) ( not ( = ?auto_128808 ?auto_128810 ) ) ( not ( = ?auto_128808 ?auto_128809 ) ) ( not ( = ?auto_128808 ?auto_128812 ) ) ( not ( = ?auto_128808 ?auto_128811 ) ) ( not ( = ?auto_128814 ?auto_128810 ) ) ( not ( = ?auto_128814 ?auto_128809 ) ) ( not ( = ?auto_128814 ?auto_128812 ) ) ( not ( = ?auto_128814 ?auto_128811 ) ) ( ON ?auto_128813 ?auto_128814 ) ( CLEAR ?auto_128813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128806 ?auto_128807 ?auto_128808 ?auto_128814 )
      ( MAKE-2PILE ?auto_128806 ?auto_128807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128815 - BLOCK
      ?auto_128816 - BLOCK
    )
    :vars
    (
      ?auto_128817 - BLOCK
      ?auto_128818 - BLOCK
      ?auto_128819 - BLOCK
      ?auto_128823 - BLOCK
      ?auto_128821 - BLOCK
      ?auto_128820 - BLOCK
      ?auto_128822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128817 ?auto_128816 ) ( ON-TABLE ?auto_128815 ) ( ON ?auto_128816 ?auto_128815 ) ( not ( = ?auto_128815 ?auto_128816 ) ) ( not ( = ?auto_128815 ?auto_128817 ) ) ( not ( = ?auto_128816 ?auto_128817 ) ) ( not ( = ?auto_128815 ?auto_128818 ) ) ( not ( = ?auto_128815 ?auto_128819 ) ) ( not ( = ?auto_128816 ?auto_128818 ) ) ( not ( = ?auto_128816 ?auto_128819 ) ) ( not ( = ?auto_128817 ?auto_128818 ) ) ( not ( = ?auto_128817 ?auto_128819 ) ) ( not ( = ?auto_128818 ?auto_128819 ) ) ( ON ?auto_128818 ?auto_128817 ) ( ON-TABLE ?auto_128823 ) ( ON ?auto_128821 ?auto_128823 ) ( ON ?auto_128820 ?auto_128821 ) ( not ( = ?auto_128823 ?auto_128821 ) ) ( not ( = ?auto_128823 ?auto_128820 ) ) ( not ( = ?auto_128823 ?auto_128822 ) ) ( not ( = ?auto_128823 ?auto_128819 ) ) ( not ( = ?auto_128821 ?auto_128820 ) ) ( not ( = ?auto_128821 ?auto_128822 ) ) ( not ( = ?auto_128821 ?auto_128819 ) ) ( not ( = ?auto_128820 ?auto_128822 ) ) ( not ( = ?auto_128820 ?auto_128819 ) ) ( not ( = ?auto_128822 ?auto_128819 ) ) ( not ( = ?auto_128815 ?auto_128822 ) ) ( not ( = ?auto_128815 ?auto_128823 ) ) ( not ( = ?auto_128815 ?auto_128821 ) ) ( not ( = ?auto_128815 ?auto_128820 ) ) ( not ( = ?auto_128816 ?auto_128822 ) ) ( not ( = ?auto_128816 ?auto_128823 ) ) ( not ( = ?auto_128816 ?auto_128821 ) ) ( not ( = ?auto_128816 ?auto_128820 ) ) ( not ( = ?auto_128817 ?auto_128822 ) ) ( not ( = ?auto_128817 ?auto_128823 ) ) ( not ( = ?auto_128817 ?auto_128821 ) ) ( not ( = ?auto_128817 ?auto_128820 ) ) ( not ( = ?auto_128818 ?auto_128822 ) ) ( not ( = ?auto_128818 ?auto_128823 ) ) ( not ( = ?auto_128818 ?auto_128821 ) ) ( not ( = ?auto_128818 ?auto_128820 ) ) ( ON ?auto_128819 ?auto_128818 ) ( CLEAR ?auto_128819 ) ( HOLDING ?auto_128822 ) ( CLEAR ?auto_128820 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128823 ?auto_128821 ?auto_128820 ?auto_128822 )
      ( MAKE-2PILE ?auto_128815 ?auto_128816 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128824 - BLOCK
      ?auto_128825 - BLOCK
    )
    :vars
    (
      ?auto_128829 - BLOCK
      ?auto_128828 - BLOCK
      ?auto_128831 - BLOCK
      ?auto_128832 - BLOCK
      ?auto_128830 - BLOCK
      ?auto_128826 - BLOCK
      ?auto_128827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128829 ?auto_128825 ) ( ON-TABLE ?auto_128824 ) ( ON ?auto_128825 ?auto_128824 ) ( not ( = ?auto_128824 ?auto_128825 ) ) ( not ( = ?auto_128824 ?auto_128829 ) ) ( not ( = ?auto_128825 ?auto_128829 ) ) ( not ( = ?auto_128824 ?auto_128828 ) ) ( not ( = ?auto_128824 ?auto_128831 ) ) ( not ( = ?auto_128825 ?auto_128828 ) ) ( not ( = ?auto_128825 ?auto_128831 ) ) ( not ( = ?auto_128829 ?auto_128828 ) ) ( not ( = ?auto_128829 ?auto_128831 ) ) ( not ( = ?auto_128828 ?auto_128831 ) ) ( ON ?auto_128828 ?auto_128829 ) ( ON-TABLE ?auto_128832 ) ( ON ?auto_128830 ?auto_128832 ) ( ON ?auto_128826 ?auto_128830 ) ( not ( = ?auto_128832 ?auto_128830 ) ) ( not ( = ?auto_128832 ?auto_128826 ) ) ( not ( = ?auto_128832 ?auto_128827 ) ) ( not ( = ?auto_128832 ?auto_128831 ) ) ( not ( = ?auto_128830 ?auto_128826 ) ) ( not ( = ?auto_128830 ?auto_128827 ) ) ( not ( = ?auto_128830 ?auto_128831 ) ) ( not ( = ?auto_128826 ?auto_128827 ) ) ( not ( = ?auto_128826 ?auto_128831 ) ) ( not ( = ?auto_128827 ?auto_128831 ) ) ( not ( = ?auto_128824 ?auto_128827 ) ) ( not ( = ?auto_128824 ?auto_128832 ) ) ( not ( = ?auto_128824 ?auto_128830 ) ) ( not ( = ?auto_128824 ?auto_128826 ) ) ( not ( = ?auto_128825 ?auto_128827 ) ) ( not ( = ?auto_128825 ?auto_128832 ) ) ( not ( = ?auto_128825 ?auto_128830 ) ) ( not ( = ?auto_128825 ?auto_128826 ) ) ( not ( = ?auto_128829 ?auto_128827 ) ) ( not ( = ?auto_128829 ?auto_128832 ) ) ( not ( = ?auto_128829 ?auto_128830 ) ) ( not ( = ?auto_128829 ?auto_128826 ) ) ( not ( = ?auto_128828 ?auto_128827 ) ) ( not ( = ?auto_128828 ?auto_128832 ) ) ( not ( = ?auto_128828 ?auto_128830 ) ) ( not ( = ?auto_128828 ?auto_128826 ) ) ( ON ?auto_128831 ?auto_128828 ) ( CLEAR ?auto_128826 ) ( ON ?auto_128827 ?auto_128831 ) ( CLEAR ?auto_128827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128824 ?auto_128825 ?auto_128829 ?auto_128828 ?auto_128831 )
      ( MAKE-2PILE ?auto_128824 ?auto_128825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128833 - BLOCK
      ?auto_128834 - BLOCK
    )
    :vars
    (
      ?auto_128841 - BLOCK
      ?auto_128839 - BLOCK
      ?auto_128835 - BLOCK
      ?auto_128836 - BLOCK
      ?auto_128837 - BLOCK
      ?auto_128838 - BLOCK
      ?auto_128840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128841 ?auto_128834 ) ( ON-TABLE ?auto_128833 ) ( ON ?auto_128834 ?auto_128833 ) ( not ( = ?auto_128833 ?auto_128834 ) ) ( not ( = ?auto_128833 ?auto_128841 ) ) ( not ( = ?auto_128834 ?auto_128841 ) ) ( not ( = ?auto_128833 ?auto_128839 ) ) ( not ( = ?auto_128833 ?auto_128835 ) ) ( not ( = ?auto_128834 ?auto_128839 ) ) ( not ( = ?auto_128834 ?auto_128835 ) ) ( not ( = ?auto_128841 ?auto_128839 ) ) ( not ( = ?auto_128841 ?auto_128835 ) ) ( not ( = ?auto_128839 ?auto_128835 ) ) ( ON ?auto_128839 ?auto_128841 ) ( ON-TABLE ?auto_128836 ) ( ON ?auto_128837 ?auto_128836 ) ( not ( = ?auto_128836 ?auto_128837 ) ) ( not ( = ?auto_128836 ?auto_128838 ) ) ( not ( = ?auto_128836 ?auto_128840 ) ) ( not ( = ?auto_128836 ?auto_128835 ) ) ( not ( = ?auto_128837 ?auto_128838 ) ) ( not ( = ?auto_128837 ?auto_128840 ) ) ( not ( = ?auto_128837 ?auto_128835 ) ) ( not ( = ?auto_128838 ?auto_128840 ) ) ( not ( = ?auto_128838 ?auto_128835 ) ) ( not ( = ?auto_128840 ?auto_128835 ) ) ( not ( = ?auto_128833 ?auto_128840 ) ) ( not ( = ?auto_128833 ?auto_128836 ) ) ( not ( = ?auto_128833 ?auto_128837 ) ) ( not ( = ?auto_128833 ?auto_128838 ) ) ( not ( = ?auto_128834 ?auto_128840 ) ) ( not ( = ?auto_128834 ?auto_128836 ) ) ( not ( = ?auto_128834 ?auto_128837 ) ) ( not ( = ?auto_128834 ?auto_128838 ) ) ( not ( = ?auto_128841 ?auto_128840 ) ) ( not ( = ?auto_128841 ?auto_128836 ) ) ( not ( = ?auto_128841 ?auto_128837 ) ) ( not ( = ?auto_128841 ?auto_128838 ) ) ( not ( = ?auto_128839 ?auto_128840 ) ) ( not ( = ?auto_128839 ?auto_128836 ) ) ( not ( = ?auto_128839 ?auto_128837 ) ) ( not ( = ?auto_128839 ?auto_128838 ) ) ( ON ?auto_128835 ?auto_128839 ) ( ON ?auto_128840 ?auto_128835 ) ( CLEAR ?auto_128840 ) ( HOLDING ?auto_128838 ) ( CLEAR ?auto_128837 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128836 ?auto_128837 ?auto_128838 )
      ( MAKE-2PILE ?auto_128833 ?auto_128834 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128842 - BLOCK
      ?auto_128843 - BLOCK
    )
    :vars
    (
      ?auto_128844 - BLOCK
      ?auto_128847 - BLOCK
      ?auto_128849 - BLOCK
      ?auto_128850 - BLOCK
      ?auto_128845 - BLOCK
      ?auto_128846 - BLOCK
      ?auto_128848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128844 ?auto_128843 ) ( ON-TABLE ?auto_128842 ) ( ON ?auto_128843 ?auto_128842 ) ( not ( = ?auto_128842 ?auto_128843 ) ) ( not ( = ?auto_128842 ?auto_128844 ) ) ( not ( = ?auto_128843 ?auto_128844 ) ) ( not ( = ?auto_128842 ?auto_128847 ) ) ( not ( = ?auto_128842 ?auto_128849 ) ) ( not ( = ?auto_128843 ?auto_128847 ) ) ( not ( = ?auto_128843 ?auto_128849 ) ) ( not ( = ?auto_128844 ?auto_128847 ) ) ( not ( = ?auto_128844 ?auto_128849 ) ) ( not ( = ?auto_128847 ?auto_128849 ) ) ( ON ?auto_128847 ?auto_128844 ) ( ON-TABLE ?auto_128850 ) ( ON ?auto_128845 ?auto_128850 ) ( not ( = ?auto_128850 ?auto_128845 ) ) ( not ( = ?auto_128850 ?auto_128846 ) ) ( not ( = ?auto_128850 ?auto_128848 ) ) ( not ( = ?auto_128850 ?auto_128849 ) ) ( not ( = ?auto_128845 ?auto_128846 ) ) ( not ( = ?auto_128845 ?auto_128848 ) ) ( not ( = ?auto_128845 ?auto_128849 ) ) ( not ( = ?auto_128846 ?auto_128848 ) ) ( not ( = ?auto_128846 ?auto_128849 ) ) ( not ( = ?auto_128848 ?auto_128849 ) ) ( not ( = ?auto_128842 ?auto_128848 ) ) ( not ( = ?auto_128842 ?auto_128850 ) ) ( not ( = ?auto_128842 ?auto_128845 ) ) ( not ( = ?auto_128842 ?auto_128846 ) ) ( not ( = ?auto_128843 ?auto_128848 ) ) ( not ( = ?auto_128843 ?auto_128850 ) ) ( not ( = ?auto_128843 ?auto_128845 ) ) ( not ( = ?auto_128843 ?auto_128846 ) ) ( not ( = ?auto_128844 ?auto_128848 ) ) ( not ( = ?auto_128844 ?auto_128850 ) ) ( not ( = ?auto_128844 ?auto_128845 ) ) ( not ( = ?auto_128844 ?auto_128846 ) ) ( not ( = ?auto_128847 ?auto_128848 ) ) ( not ( = ?auto_128847 ?auto_128850 ) ) ( not ( = ?auto_128847 ?auto_128845 ) ) ( not ( = ?auto_128847 ?auto_128846 ) ) ( ON ?auto_128849 ?auto_128847 ) ( ON ?auto_128848 ?auto_128849 ) ( CLEAR ?auto_128845 ) ( ON ?auto_128846 ?auto_128848 ) ( CLEAR ?auto_128846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128842 ?auto_128843 ?auto_128844 ?auto_128847 ?auto_128849 ?auto_128848 )
      ( MAKE-2PILE ?auto_128842 ?auto_128843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128851 - BLOCK
      ?auto_128852 - BLOCK
    )
    :vars
    (
      ?auto_128854 - BLOCK
      ?auto_128859 - BLOCK
      ?auto_128858 - BLOCK
      ?auto_128853 - BLOCK
      ?auto_128857 - BLOCK
      ?auto_128855 - BLOCK
      ?auto_128856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128854 ?auto_128852 ) ( ON-TABLE ?auto_128851 ) ( ON ?auto_128852 ?auto_128851 ) ( not ( = ?auto_128851 ?auto_128852 ) ) ( not ( = ?auto_128851 ?auto_128854 ) ) ( not ( = ?auto_128852 ?auto_128854 ) ) ( not ( = ?auto_128851 ?auto_128859 ) ) ( not ( = ?auto_128851 ?auto_128858 ) ) ( not ( = ?auto_128852 ?auto_128859 ) ) ( not ( = ?auto_128852 ?auto_128858 ) ) ( not ( = ?auto_128854 ?auto_128859 ) ) ( not ( = ?auto_128854 ?auto_128858 ) ) ( not ( = ?auto_128859 ?auto_128858 ) ) ( ON ?auto_128859 ?auto_128854 ) ( ON-TABLE ?auto_128853 ) ( not ( = ?auto_128853 ?auto_128857 ) ) ( not ( = ?auto_128853 ?auto_128855 ) ) ( not ( = ?auto_128853 ?auto_128856 ) ) ( not ( = ?auto_128853 ?auto_128858 ) ) ( not ( = ?auto_128857 ?auto_128855 ) ) ( not ( = ?auto_128857 ?auto_128856 ) ) ( not ( = ?auto_128857 ?auto_128858 ) ) ( not ( = ?auto_128855 ?auto_128856 ) ) ( not ( = ?auto_128855 ?auto_128858 ) ) ( not ( = ?auto_128856 ?auto_128858 ) ) ( not ( = ?auto_128851 ?auto_128856 ) ) ( not ( = ?auto_128851 ?auto_128853 ) ) ( not ( = ?auto_128851 ?auto_128857 ) ) ( not ( = ?auto_128851 ?auto_128855 ) ) ( not ( = ?auto_128852 ?auto_128856 ) ) ( not ( = ?auto_128852 ?auto_128853 ) ) ( not ( = ?auto_128852 ?auto_128857 ) ) ( not ( = ?auto_128852 ?auto_128855 ) ) ( not ( = ?auto_128854 ?auto_128856 ) ) ( not ( = ?auto_128854 ?auto_128853 ) ) ( not ( = ?auto_128854 ?auto_128857 ) ) ( not ( = ?auto_128854 ?auto_128855 ) ) ( not ( = ?auto_128859 ?auto_128856 ) ) ( not ( = ?auto_128859 ?auto_128853 ) ) ( not ( = ?auto_128859 ?auto_128857 ) ) ( not ( = ?auto_128859 ?auto_128855 ) ) ( ON ?auto_128858 ?auto_128859 ) ( ON ?auto_128856 ?auto_128858 ) ( ON ?auto_128855 ?auto_128856 ) ( CLEAR ?auto_128855 ) ( HOLDING ?auto_128857 ) ( CLEAR ?auto_128853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128853 ?auto_128857 )
      ( MAKE-2PILE ?auto_128851 ?auto_128852 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130878 - BLOCK
      ?auto_130879 - BLOCK
    )
    :vars
    (
      ?auto_130882 - BLOCK
      ?auto_130881 - BLOCK
      ?auto_130885 - BLOCK
      ?auto_130884 - BLOCK
      ?auto_130880 - BLOCK
      ?auto_130883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130882 ?auto_130879 ) ( ON-TABLE ?auto_130878 ) ( ON ?auto_130879 ?auto_130878 ) ( not ( = ?auto_130878 ?auto_130879 ) ) ( not ( = ?auto_130878 ?auto_130882 ) ) ( not ( = ?auto_130879 ?auto_130882 ) ) ( not ( = ?auto_130878 ?auto_130881 ) ) ( not ( = ?auto_130878 ?auto_130885 ) ) ( not ( = ?auto_130879 ?auto_130881 ) ) ( not ( = ?auto_130879 ?auto_130885 ) ) ( not ( = ?auto_130882 ?auto_130881 ) ) ( not ( = ?auto_130882 ?auto_130885 ) ) ( not ( = ?auto_130881 ?auto_130885 ) ) ( ON ?auto_130881 ?auto_130882 ) ( not ( = ?auto_130884 ?auto_130880 ) ) ( not ( = ?auto_130884 ?auto_130883 ) ) ( not ( = ?auto_130884 ?auto_130885 ) ) ( not ( = ?auto_130880 ?auto_130883 ) ) ( not ( = ?auto_130880 ?auto_130885 ) ) ( not ( = ?auto_130883 ?auto_130885 ) ) ( not ( = ?auto_130878 ?auto_130883 ) ) ( not ( = ?auto_130878 ?auto_130884 ) ) ( not ( = ?auto_130878 ?auto_130880 ) ) ( not ( = ?auto_130879 ?auto_130883 ) ) ( not ( = ?auto_130879 ?auto_130884 ) ) ( not ( = ?auto_130879 ?auto_130880 ) ) ( not ( = ?auto_130882 ?auto_130883 ) ) ( not ( = ?auto_130882 ?auto_130884 ) ) ( not ( = ?auto_130882 ?auto_130880 ) ) ( not ( = ?auto_130881 ?auto_130883 ) ) ( not ( = ?auto_130881 ?auto_130884 ) ) ( not ( = ?auto_130881 ?auto_130880 ) ) ( ON ?auto_130885 ?auto_130881 ) ( ON ?auto_130883 ?auto_130885 ) ( ON ?auto_130880 ?auto_130883 ) ( ON ?auto_130884 ?auto_130880 ) ( CLEAR ?auto_130884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130878 ?auto_130879 ?auto_130882 ?auto_130881 ?auto_130885 ?auto_130883 ?auto_130880 )
      ( MAKE-2PILE ?auto_130878 ?auto_130879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128869 - BLOCK
      ?auto_128870 - BLOCK
    )
    :vars
    (
      ?auto_128875 - BLOCK
      ?auto_128871 - BLOCK
      ?auto_128874 - BLOCK
      ?auto_128876 - BLOCK
      ?auto_128872 - BLOCK
      ?auto_128873 - BLOCK
      ?auto_128877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128875 ?auto_128870 ) ( ON-TABLE ?auto_128869 ) ( ON ?auto_128870 ?auto_128869 ) ( not ( = ?auto_128869 ?auto_128870 ) ) ( not ( = ?auto_128869 ?auto_128875 ) ) ( not ( = ?auto_128870 ?auto_128875 ) ) ( not ( = ?auto_128869 ?auto_128871 ) ) ( not ( = ?auto_128869 ?auto_128874 ) ) ( not ( = ?auto_128870 ?auto_128871 ) ) ( not ( = ?auto_128870 ?auto_128874 ) ) ( not ( = ?auto_128875 ?auto_128871 ) ) ( not ( = ?auto_128875 ?auto_128874 ) ) ( not ( = ?auto_128871 ?auto_128874 ) ) ( ON ?auto_128871 ?auto_128875 ) ( not ( = ?auto_128876 ?auto_128872 ) ) ( not ( = ?auto_128876 ?auto_128873 ) ) ( not ( = ?auto_128876 ?auto_128877 ) ) ( not ( = ?auto_128876 ?auto_128874 ) ) ( not ( = ?auto_128872 ?auto_128873 ) ) ( not ( = ?auto_128872 ?auto_128877 ) ) ( not ( = ?auto_128872 ?auto_128874 ) ) ( not ( = ?auto_128873 ?auto_128877 ) ) ( not ( = ?auto_128873 ?auto_128874 ) ) ( not ( = ?auto_128877 ?auto_128874 ) ) ( not ( = ?auto_128869 ?auto_128877 ) ) ( not ( = ?auto_128869 ?auto_128876 ) ) ( not ( = ?auto_128869 ?auto_128872 ) ) ( not ( = ?auto_128869 ?auto_128873 ) ) ( not ( = ?auto_128870 ?auto_128877 ) ) ( not ( = ?auto_128870 ?auto_128876 ) ) ( not ( = ?auto_128870 ?auto_128872 ) ) ( not ( = ?auto_128870 ?auto_128873 ) ) ( not ( = ?auto_128875 ?auto_128877 ) ) ( not ( = ?auto_128875 ?auto_128876 ) ) ( not ( = ?auto_128875 ?auto_128872 ) ) ( not ( = ?auto_128875 ?auto_128873 ) ) ( not ( = ?auto_128871 ?auto_128877 ) ) ( not ( = ?auto_128871 ?auto_128876 ) ) ( not ( = ?auto_128871 ?auto_128872 ) ) ( not ( = ?auto_128871 ?auto_128873 ) ) ( ON ?auto_128874 ?auto_128871 ) ( ON ?auto_128877 ?auto_128874 ) ( ON ?auto_128873 ?auto_128877 ) ( ON ?auto_128872 ?auto_128873 ) ( CLEAR ?auto_128872 ) ( HOLDING ?auto_128876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128876 )
      ( MAKE-2PILE ?auto_128869 ?auto_128870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128878 - BLOCK
      ?auto_128879 - BLOCK
    )
    :vars
    (
      ?auto_128886 - BLOCK
      ?auto_128882 - BLOCK
      ?auto_128885 - BLOCK
      ?auto_128880 - BLOCK
      ?auto_128881 - BLOCK
      ?auto_128884 - BLOCK
      ?auto_128883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128886 ?auto_128879 ) ( ON-TABLE ?auto_128878 ) ( ON ?auto_128879 ?auto_128878 ) ( not ( = ?auto_128878 ?auto_128879 ) ) ( not ( = ?auto_128878 ?auto_128886 ) ) ( not ( = ?auto_128879 ?auto_128886 ) ) ( not ( = ?auto_128878 ?auto_128882 ) ) ( not ( = ?auto_128878 ?auto_128885 ) ) ( not ( = ?auto_128879 ?auto_128882 ) ) ( not ( = ?auto_128879 ?auto_128885 ) ) ( not ( = ?auto_128886 ?auto_128882 ) ) ( not ( = ?auto_128886 ?auto_128885 ) ) ( not ( = ?auto_128882 ?auto_128885 ) ) ( ON ?auto_128882 ?auto_128886 ) ( not ( = ?auto_128880 ?auto_128881 ) ) ( not ( = ?auto_128880 ?auto_128884 ) ) ( not ( = ?auto_128880 ?auto_128883 ) ) ( not ( = ?auto_128880 ?auto_128885 ) ) ( not ( = ?auto_128881 ?auto_128884 ) ) ( not ( = ?auto_128881 ?auto_128883 ) ) ( not ( = ?auto_128881 ?auto_128885 ) ) ( not ( = ?auto_128884 ?auto_128883 ) ) ( not ( = ?auto_128884 ?auto_128885 ) ) ( not ( = ?auto_128883 ?auto_128885 ) ) ( not ( = ?auto_128878 ?auto_128883 ) ) ( not ( = ?auto_128878 ?auto_128880 ) ) ( not ( = ?auto_128878 ?auto_128881 ) ) ( not ( = ?auto_128878 ?auto_128884 ) ) ( not ( = ?auto_128879 ?auto_128883 ) ) ( not ( = ?auto_128879 ?auto_128880 ) ) ( not ( = ?auto_128879 ?auto_128881 ) ) ( not ( = ?auto_128879 ?auto_128884 ) ) ( not ( = ?auto_128886 ?auto_128883 ) ) ( not ( = ?auto_128886 ?auto_128880 ) ) ( not ( = ?auto_128886 ?auto_128881 ) ) ( not ( = ?auto_128886 ?auto_128884 ) ) ( not ( = ?auto_128882 ?auto_128883 ) ) ( not ( = ?auto_128882 ?auto_128880 ) ) ( not ( = ?auto_128882 ?auto_128881 ) ) ( not ( = ?auto_128882 ?auto_128884 ) ) ( ON ?auto_128885 ?auto_128882 ) ( ON ?auto_128883 ?auto_128885 ) ( ON ?auto_128884 ?auto_128883 ) ( ON ?auto_128881 ?auto_128884 ) ( ON ?auto_128880 ?auto_128881 ) ( CLEAR ?auto_128880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_128878 ?auto_128879 ?auto_128886 ?auto_128882 ?auto_128885 ?auto_128883 ?auto_128884 ?auto_128881 )
      ( MAKE-2PILE ?auto_128878 ?auto_128879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128894 - BLOCK
      ?auto_128895 - BLOCK
      ?auto_128896 - BLOCK
      ?auto_128897 - BLOCK
      ?auto_128898 - BLOCK
      ?auto_128899 - BLOCK
      ?auto_128900 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128900 ) ( CLEAR ?auto_128899 ) ( ON-TABLE ?auto_128894 ) ( ON ?auto_128895 ?auto_128894 ) ( ON ?auto_128896 ?auto_128895 ) ( ON ?auto_128897 ?auto_128896 ) ( ON ?auto_128898 ?auto_128897 ) ( ON ?auto_128899 ?auto_128898 ) ( not ( = ?auto_128894 ?auto_128895 ) ) ( not ( = ?auto_128894 ?auto_128896 ) ) ( not ( = ?auto_128894 ?auto_128897 ) ) ( not ( = ?auto_128894 ?auto_128898 ) ) ( not ( = ?auto_128894 ?auto_128899 ) ) ( not ( = ?auto_128894 ?auto_128900 ) ) ( not ( = ?auto_128895 ?auto_128896 ) ) ( not ( = ?auto_128895 ?auto_128897 ) ) ( not ( = ?auto_128895 ?auto_128898 ) ) ( not ( = ?auto_128895 ?auto_128899 ) ) ( not ( = ?auto_128895 ?auto_128900 ) ) ( not ( = ?auto_128896 ?auto_128897 ) ) ( not ( = ?auto_128896 ?auto_128898 ) ) ( not ( = ?auto_128896 ?auto_128899 ) ) ( not ( = ?auto_128896 ?auto_128900 ) ) ( not ( = ?auto_128897 ?auto_128898 ) ) ( not ( = ?auto_128897 ?auto_128899 ) ) ( not ( = ?auto_128897 ?auto_128900 ) ) ( not ( = ?auto_128898 ?auto_128899 ) ) ( not ( = ?auto_128898 ?auto_128900 ) ) ( not ( = ?auto_128899 ?auto_128900 ) ) )
    :subtasks
    ( ( !STACK ?auto_128900 ?auto_128899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128901 - BLOCK
      ?auto_128902 - BLOCK
      ?auto_128903 - BLOCK
      ?auto_128904 - BLOCK
      ?auto_128905 - BLOCK
      ?auto_128906 - BLOCK
      ?auto_128907 - BLOCK
    )
    :vars
    (
      ?auto_128908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128906 ) ( ON-TABLE ?auto_128901 ) ( ON ?auto_128902 ?auto_128901 ) ( ON ?auto_128903 ?auto_128902 ) ( ON ?auto_128904 ?auto_128903 ) ( ON ?auto_128905 ?auto_128904 ) ( ON ?auto_128906 ?auto_128905 ) ( not ( = ?auto_128901 ?auto_128902 ) ) ( not ( = ?auto_128901 ?auto_128903 ) ) ( not ( = ?auto_128901 ?auto_128904 ) ) ( not ( = ?auto_128901 ?auto_128905 ) ) ( not ( = ?auto_128901 ?auto_128906 ) ) ( not ( = ?auto_128901 ?auto_128907 ) ) ( not ( = ?auto_128902 ?auto_128903 ) ) ( not ( = ?auto_128902 ?auto_128904 ) ) ( not ( = ?auto_128902 ?auto_128905 ) ) ( not ( = ?auto_128902 ?auto_128906 ) ) ( not ( = ?auto_128902 ?auto_128907 ) ) ( not ( = ?auto_128903 ?auto_128904 ) ) ( not ( = ?auto_128903 ?auto_128905 ) ) ( not ( = ?auto_128903 ?auto_128906 ) ) ( not ( = ?auto_128903 ?auto_128907 ) ) ( not ( = ?auto_128904 ?auto_128905 ) ) ( not ( = ?auto_128904 ?auto_128906 ) ) ( not ( = ?auto_128904 ?auto_128907 ) ) ( not ( = ?auto_128905 ?auto_128906 ) ) ( not ( = ?auto_128905 ?auto_128907 ) ) ( not ( = ?auto_128906 ?auto_128907 ) ) ( ON ?auto_128907 ?auto_128908 ) ( CLEAR ?auto_128907 ) ( HAND-EMPTY ) ( not ( = ?auto_128901 ?auto_128908 ) ) ( not ( = ?auto_128902 ?auto_128908 ) ) ( not ( = ?auto_128903 ?auto_128908 ) ) ( not ( = ?auto_128904 ?auto_128908 ) ) ( not ( = ?auto_128905 ?auto_128908 ) ) ( not ( = ?auto_128906 ?auto_128908 ) ) ( not ( = ?auto_128907 ?auto_128908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128907 ?auto_128908 )
      ( MAKE-7PILE ?auto_128901 ?auto_128902 ?auto_128903 ?auto_128904 ?auto_128905 ?auto_128906 ?auto_128907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128909 - BLOCK
      ?auto_128910 - BLOCK
      ?auto_128911 - BLOCK
      ?auto_128912 - BLOCK
      ?auto_128913 - BLOCK
      ?auto_128914 - BLOCK
      ?auto_128915 - BLOCK
    )
    :vars
    (
      ?auto_128916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128909 ) ( ON ?auto_128910 ?auto_128909 ) ( ON ?auto_128911 ?auto_128910 ) ( ON ?auto_128912 ?auto_128911 ) ( ON ?auto_128913 ?auto_128912 ) ( not ( = ?auto_128909 ?auto_128910 ) ) ( not ( = ?auto_128909 ?auto_128911 ) ) ( not ( = ?auto_128909 ?auto_128912 ) ) ( not ( = ?auto_128909 ?auto_128913 ) ) ( not ( = ?auto_128909 ?auto_128914 ) ) ( not ( = ?auto_128909 ?auto_128915 ) ) ( not ( = ?auto_128910 ?auto_128911 ) ) ( not ( = ?auto_128910 ?auto_128912 ) ) ( not ( = ?auto_128910 ?auto_128913 ) ) ( not ( = ?auto_128910 ?auto_128914 ) ) ( not ( = ?auto_128910 ?auto_128915 ) ) ( not ( = ?auto_128911 ?auto_128912 ) ) ( not ( = ?auto_128911 ?auto_128913 ) ) ( not ( = ?auto_128911 ?auto_128914 ) ) ( not ( = ?auto_128911 ?auto_128915 ) ) ( not ( = ?auto_128912 ?auto_128913 ) ) ( not ( = ?auto_128912 ?auto_128914 ) ) ( not ( = ?auto_128912 ?auto_128915 ) ) ( not ( = ?auto_128913 ?auto_128914 ) ) ( not ( = ?auto_128913 ?auto_128915 ) ) ( not ( = ?auto_128914 ?auto_128915 ) ) ( ON ?auto_128915 ?auto_128916 ) ( CLEAR ?auto_128915 ) ( not ( = ?auto_128909 ?auto_128916 ) ) ( not ( = ?auto_128910 ?auto_128916 ) ) ( not ( = ?auto_128911 ?auto_128916 ) ) ( not ( = ?auto_128912 ?auto_128916 ) ) ( not ( = ?auto_128913 ?auto_128916 ) ) ( not ( = ?auto_128914 ?auto_128916 ) ) ( not ( = ?auto_128915 ?auto_128916 ) ) ( HOLDING ?auto_128914 ) ( CLEAR ?auto_128913 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128909 ?auto_128910 ?auto_128911 ?auto_128912 ?auto_128913 ?auto_128914 )
      ( MAKE-7PILE ?auto_128909 ?auto_128910 ?auto_128911 ?auto_128912 ?auto_128913 ?auto_128914 ?auto_128915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128917 - BLOCK
      ?auto_128918 - BLOCK
      ?auto_128919 - BLOCK
      ?auto_128920 - BLOCK
      ?auto_128921 - BLOCK
      ?auto_128922 - BLOCK
      ?auto_128923 - BLOCK
    )
    :vars
    (
      ?auto_128924 - BLOCK
      ?auto_128925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128917 ) ( ON ?auto_128918 ?auto_128917 ) ( ON ?auto_128919 ?auto_128918 ) ( ON ?auto_128920 ?auto_128919 ) ( ON ?auto_128921 ?auto_128920 ) ( not ( = ?auto_128917 ?auto_128918 ) ) ( not ( = ?auto_128917 ?auto_128919 ) ) ( not ( = ?auto_128917 ?auto_128920 ) ) ( not ( = ?auto_128917 ?auto_128921 ) ) ( not ( = ?auto_128917 ?auto_128922 ) ) ( not ( = ?auto_128917 ?auto_128923 ) ) ( not ( = ?auto_128918 ?auto_128919 ) ) ( not ( = ?auto_128918 ?auto_128920 ) ) ( not ( = ?auto_128918 ?auto_128921 ) ) ( not ( = ?auto_128918 ?auto_128922 ) ) ( not ( = ?auto_128918 ?auto_128923 ) ) ( not ( = ?auto_128919 ?auto_128920 ) ) ( not ( = ?auto_128919 ?auto_128921 ) ) ( not ( = ?auto_128919 ?auto_128922 ) ) ( not ( = ?auto_128919 ?auto_128923 ) ) ( not ( = ?auto_128920 ?auto_128921 ) ) ( not ( = ?auto_128920 ?auto_128922 ) ) ( not ( = ?auto_128920 ?auto_128923 ) ) ( not ( = ?auto_128921 ?auto_128922 ) ) ( not ( = ?auto_128921 ?auto_128923 ) ) ( not ( = ?auto_128922 ?auto_128923 ) ) ( ON ?auto_128923 ?auto_128924 ) ( not ( = ?auto_128917 ?auto_128924 ) ) ( not ( = ?auto_128918 ?auto_128924 ) ) ( not ( = ?auto_128919 ?auto_128924 ) ) ( not ( = ?auto_128920 ?auto_128924 ) ) ( not ( = ?auto_128921 ?auto_128924 ) ) ( not ( = ?auto_128922 ?auto_128924 ) ) ( not ( = ?auto_128923 ?auto_128924 ) ) ( CLEAR ?auto_128921 ) ( ON ?auto_128922 ?auto_128923 ) ( CLEAR ?auto_128922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128925 ) ( ON ?auto_128924 ?auto_128925 ) ( not ( = ?auto_128925 ?auto_128924 ) ) ( not ( = ?auto_128925 ?auto_128923 ) ) ( not ( = ?auto_128925 ?auto_128922 ) ) ( not ( = ?auto_128917 ?auto_128925 ) ) ( not ( = ?auto_128918 ?auto_128925 ) ) ( not ( = ?auto_128919 ?auto_128925 ) ) ( not ( = ?auto_128920 ?auto_128925 ) ) ( not ( = ?auto_128921 ?auto_128925 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128925 ?auto_128924 ?auto_128923 )
      ( MAKE-7PILE ?auto_128917 ?auto_128918 ?auto_128919 ?auto_128920 ?auto_128921 ?auto_128922 ?auto_128923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128926 - BLOCK
      ?auto_128927 - BLOCK
      ?auto_128928 - BLOCK
      ?auto_128929 - BLOCK
      ?auto_128930 - BLOCK
      ?auto_128931 - BLOCK
      ?auto_128932 - BLOCK
    )
    :vars
    (
      ?auto_128934 - BLOCK
      ?auto_128933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128926 ) ( ON ?auto_128927 ?auto_128926 ) ( ON ?auto_128928 ?auto_128927 ) ( ON ?auto_128929 ?auto_128928 ) ( not ( = ?auto_128926 ?auto_128927 ) ) ( not ( = ?auto_128926 ?auto_128928 ) ) ( not ( = ?auto_128926 ?auto_128929 ) ) ( not ( = ?auto_128926 ?auto_128930 ) ) ( not ( = ?auto_128926 ?auto_128931 ) ) ( not ( = ?auto_128926 ?auto_128932 ) ) ( not ( = ?auto_128927 ?auto_128928 ) ) ( not ( = ?auto_128927 ?auto_128929 ) ) ( not ( = ?auto_128927 ?auto_128930 ) ) ( not ( = ?auto_128927 ?auto_128931 ) ) ( not ( = ?auto_128927 ?auto_128932 ) ) ( not ( = ?auto_128928 ?auto_128929 ) ) ( not ( = ?auto_128928 ?auto_128930 ) ) ( not ( = ?auto_128928 ?auto_128931 ) ) ( not ( = ?auto_128928 ?auto_128932 ) ) ( not ( = ?auto_128929 ?auto_128930 ) ) ( not ( = ?auto_128929 ?auto_128931 ) ) ( not ( = ?auto_128929 ?auto_128932 ) ) ( not ( = ?auto_128930 ?auto_128931 ) ) ( not ( = ?auto_128930 ?auto_128932 ) ) ( not ( = ?auto_128931 ?auto_128932 ) ) ( ON ?auto_128932 ?auto_128934 ) ( not ( = ?auto_128926 ?auto_128934 ) ) ( not ( = ?auto_128927 ?auto_128934 ) ) ( not ( = ?auto_128928 ?auto_128934 ) ) ( not ( = ?auto_128929 ?auto_128934 ) ) ( not ( = ?auto_128930 ?auto_128934 ) ) ( not ( = ?auto_128931 ?auto_128934 ) ) ( not ( = ?auto_128932 ?auto_128934 ) ) ( ON ?auto_128931 ?auto_128932 ) ( CLEAR ?auto_128931 ) ( ON-TABLE ?auto_128933 ) ( ON ?auto_128934 ?auto_128933 ) ( not ( = ?auto_128933 ?auto_128934 ) ) ( not ( = ?auto_128933 ?auto_128932 ) ) ( not ( = ?auto_128933 ?auto_128931 ) ) ( not ( = ?auto_128926 ?auto_128933 ) ) ( not ( = ?auto_128927 ?auto_128933 ) ) ( not ( = ?auto_128928 ?auto_128933 ) ) ( not ( = ?auto_128929 ?auto_128933 ) ) ( not ( = ?auto_128930 ?auto_128933 ) ) ( HOLDING ?auto_128930 ) ( CLEAR ?auto_128929 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128926 ?auto_128927 ?auto_128928 ?auto_128929 ?auto_128930 )
      ( MAKE-7PILE ?auto_128926 ?auto_128927 ?auto_128928 ?auto_128929 ?auto_128930 ?auto_128931 ?auto_128932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128935 - BLOCK
      ?auto_128936 - BLOCK
      ?auto_128937 - BLOCK
      ?auto_128938 - BLOCK
      ?auto_128939 - BLOCK
      ?auto_128940 - BLOCK
      ?auto_128941 - BLOCK
    )
    :vars
    (
      ?auto_128943 - BLOCK
      ?auto_128942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128935 ) ( ON ?auto_128936 ?auto_128935 ) ( ON ?auto_128937 ?auto_128936 ) ( ON ?auto_128938 ?auto_128937 ) ( not ( = ?auto_128935 ?auto_128936 ) ) ( not ( = ?auto_128935 ?auto_128937 ) ) ( not ( = ?auto_128935 ?auto_128938 ) ) ( not ( = ?auto_128935 ?auto_128939 ) ) ( not ( = ?auto_128935 ?auto_128940 ) ) ( not ( = ?auto_128935 ?auto_128941 ) ) ( not ( = ?auto_128936 ?auto_128937 ) ) ( not ( = ?auto_128936 ?auto_128938 ) ) ( not ( = ?auto_128936 ?auto_128939 ) ) ( not ( = ?auto_128936 ?auto_128940 ) ) ( not ( = ?auto_128936 ?auto_128941 ) ) ( not ( = ?auto_128937 ?auto_128938 ) ) ( not ( = ?auto_128937 ?auto_128939 ) ) ( not ( = ?auto_128937 ?auto_128940 ) ) ( not ( = ?auto_128937 ?auto_128941 ) ) ( not ( = ?auto_128938 ?auto_128939 ) ) ( not ( = ?auto_128938 ?auto_128940 ) ) ( not ( = ?auto_128938 ?auto_128941 ) ) ( not ( = ?auto_128939 ?auto_128940 ) ) ( not ( = ?auto_128939 ?auto_128941 ) ) ( not ( = ?auto_128940 ?auto_128941 ) ) ( ON ?auto_128941 ?auto_128943 ) ( not ( = ?auto_128935 ?auto_128943 ) ) ( not ( = ?auto_128936 ?auto_128943 ) ) ( not ( = ?auto_128937 ?auto_128943 ) ) ( not ( = ?auto_128938 ?auto_128943 ) ) ( not ( = ?auto_128939 ?auto_128943 ) ) ( not ( = ?auto_128940 ?auto_128943 ) ) ( not ( = ?auto_128941 ?auto_128943 ) ) ( ON ?auto_128940 ?auto_128941 ) ( ON-TABLE ?auto_128942 ) ( ON ?auto_128943 ?auto_128942 ) ( not ( = ?auto_128942 ?auto_128943 ) ) ( not ( = ?auto_128942 ?auto_128941 ) ) ( not ( = ?auto_128942 ?auto_128940 ) ) ( not ( = ?auto_128935 ?auto_128942 ) ) ( not ( = ?auto_128936 ?auto_128942 ) ) ( not ( = ?auto_128937 ?auto_128942 ) ) ( not ( = ?auto_128938 ?auto_128942 ) ) ( not ( = ?auto_128939 ?auto_128942 ) ) ( CLEAR ?auto_128938 ) ( ON ?auto_128939 ?auto_128940 ) ( CLEAR ?auto_128939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128942 ?auto_128943 ?auto_128941 ?auto_128940 )
      ( MAKE-7PILE ?auto_128935 ?auto_128936 ?auto_128937 ?auto_128938 ?auto_128939 ?auto_128940 ?auto_128941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128944 - BLOCK
      ?auto_128945 - BLOCK
      ?auto_128946 - BLOCK
      ?auto_128947 - BLOCK
      ?auto_128948 - BLOCK
      ?auto_128949 - BLOCK
      ?auto_128950 - BLOCK
    )
    :vars
    (
      ?auto_128951 - BLOCK
      ?auto_128952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128944 ) ( ON ?auto_128945 ?auto_128944 ) ( ON ?auto_128946 ?auto_128945 ) ( not ( = ?auto_128944 ?auto_128945 ) ) ( not ( = ?auto_128944 ?auto_128946 ) ) ( not ( = ?auto_128944 ?auto_128947 ) ) ( not ( = ?auto_128944 ?auto_128948 ) ) ( not ( = ?auto_128944 ?auto_128949 ) ) ( not ( = ?auto_128944 ?auto_128950 ) ) ( not ( = ?auto_128945 ?auto_128946 ) ) ( not ( = ?auto_128945 ?auto_128947 ) ) ( not ( = ?auto_128945 ?auto_128948 ) ) ( not ( = ?auto_128945 ?auto_128949 ) ) ( not ( = ?auto_128945 ?auto_128950 ) ) ( not ( = ?auto_128946 ?auto_128947 ) ) ( not ( = ?auto_128946 ?auto_128948 ) ) ( not ( = ?auto_128946 ?auto_128949 ) ) ( not ( = ?auto_128946 ?auto_128950 ) ) ( not ( = ?auto_128947 ?auto_128948 ) ) ( not ( = ?auto_128947 ?auto_128949 ) ) ( not ( = ?auto_128947 ?auto_128950 ) ) ( not ( = ?auto_128948 ?auto_128949 ) ) ( not ( = ?auto_128948 ?auto_128950 ) ) ( not ( = ?auto_128949 ?auto_128950 ) ) ( ON ?auto_128950 ?auto_128951 ) ( not ( = ?auto_128944 ?auto_128951 ) ) ( not ( = ?auto_128945 ?auto_128951 ) ) ( not ( = ?auto_128946 ?auto_128951 ) ) ( not ( = ?auto_128947 ?auto_128951 ) ) ( not ( = ?auto_128948 ?auto_128951 ) ) ( not ( = ?auto_128949 ?auto_128951 ) ) ( not ( = ?auto_128950 ?auto_128951 ) ) ( ON ?auto_128949 ?auto_128950 ) ( ON-TABLE ?auto_128952 ) ( ON ?auto_128951 ?auto_128952 ) ( not ( = ?auto_128952 ?auto_128951 ) ) ( not ( = ?auto_128952 ?auto_128950 ) ) ( not ( = ?auto_128952 ?auto_128949 ) ) ( not ( = ?auto_128944 ?auto_128952 ) ) ( not ( = ?auto_128945 ?auto_128952 ) ) ( not ( = ?auto_128946 ?auto_128952 ) ) ( not ( = ?auto_128947 ?auto_128952 ) ) ( not ( = ?auto_128948 ?auto_128952 ) ) ( ON ?auto_128948 ?auto_128949 ) ( CLEAR ?auto_128948 ) ( HOLDING ?auto_128947 ) ( CLEAR ?auto_128946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128944 ?auto_128945 ?auto_128946 ?auto_128947 )
      ( MAKE-7PILE ?auto_128944 ?auto_128945 ?auto_128946 ?auto_128947 ?auto_128948 ?auto_128949 ?auto_128950 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128953 - BLOCK
      ?auto_128954 - BLOCK
      ?auto_128955 - BLOCK
      ?auto_128956 - BLOCK
      ?auto_128957 - BLOCK
      ?auto_128958 - BLOCK
      ?auto_128959 - BLOCK
    )
    :vars
    (
      ?auto_128960 - BLOCK
      ?auto_128961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128953 ) ( ON ?auto_128954 ?auto_128953 ) ( ON ?auto_128955 ?auto_128954 ) ( not ( = ?auto_128953 ?auto_128954 ) ) ( not ( = ?auto_128953 ?auto_128955 ) ) ( not ( = ?auto_128953 ?auto_128956 ) ) ( not ( = ?auto_128953 ?auto_128957 ) ) ( not ( = ?auto_128953 ?auto_128958 ) ) ( not ( = ?auto_128953 ?auto_128959 ) ) ( not ( = ?auto_128954 ?auto_128955 ) ) ( not ( = ?auto_128954 ?auto_128956 ) ) ( not ( = ?auto_128954 ?auto_128957 ) ) ( not ( = ?auto_128954 ?auto_128958 ) ) ( not ( = ?auto_128954 ?auto_128959 ) ) ( not ( = ?auto_128955 ?auto_128956 ) ) ( not ( = ?auto_128955 ?auto_128957 ) ) ( not ( = ?auto_128955 ?auto_128958 ) ) ( not ( = ?auto_128955 ?auto_128959 ) ) ( not ( = ?auto_128956 ?auto_128957 ) ) ( not ( = ?auto_128956 ?auto_128958 ) ) ( not ( = ?auto_128956 ?auto_128959 ) ) ( not ( = ?auto_128957 ?auto_128958 ) ) ( not ( = ?auto_128957 ?auto_128959 ) ) ( not ( = ?auto_128958 ?auto_128959 ) ) ( ON ?auto_128959 ?auto_128960 ) ( not ( = ?auto_128953 ?auto_128960 ) ) ( not ( = ?auto_128954 ?auto_128960 ) ) ( not ( = ?auto_128955 ?auto_128960 ) ) ( not ( = ?auto_128956 ?auto_128960 ) ) ( not ( = ?auto_128957 ?auto_128960 ) ) ( not ( = ?auto_128958 ?auto_128960 ) ) ( not ( = ?auto_128959 ?auto_128960 ) ) ( ON ?auto_128958 ?auto_128959 ) ( ON-TABLE ?auto_128961 ) ( ON ?auto_128960 ?auto_128961 ) ( not ( = ?auto_128961 ?auto_128960 ) ) ( not ( = ?auto_128961 ?auto_128959 ) ) ( not ( = ?auto_128961 ?auto_128958 ) ) ( not ( = ?auto_128953 ?auto_128961 ) ) ( not ( = ?auto_128954 ?auto_128961 ) ) ( not ( = ?auto_128955 ?auto_128961 ) ) ( not ( = ?auto_128956 ?auto_128961 ) ) ( not ( = ?auto_128957 ?auto_128961 ) ) ( ON ?auto_128957 ?auto_128958 ) ( CLEAR ?auto_128955 ) ( ON ?auto_128956 ?auto_128957 ) ( CLEAR ?auto_128956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128961 ?auto_128960 ?auto_128959 ?auto_128958 ?auto_128957 )
      ( MAKE-7PILE ?auto_128953 ?auto_128954 ?auto_128955 ?auto_128956 ?auto_128957 ?auto_128958 ?auto_128959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128962 - BLOCK
      ?auto_128963 - BLOCK
      ?auto_128964 - BLOCK
      ?auto_128965 - BLOCK
      ?auto_128966 - BLOCK
      ?auto_128967 - BLOCK
      ?auto_128968 - BLOCK
    )
    :vars
    (
      ?auto_128969 - BLOCK
      ?auto_128970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128962 ) ( ON ?auto_128963 ?auto_128962 ) ( not ( = ?auto_128962 ?auto_128963 ) ) ( not ( = ?auto_128962 ?auto_128964 ) ) ( not ( = ?auto_128962 ?auto_128965 ) ) ( not ( = ?auto_128962 ?auto_128966 ) ) ( not ( = ?auto_128962 ?auto_128967 ) ) ( not ( = ?auto_128962 ?auto_128968 ) ) ( not ( = ?auto_128963 ?auto_128964 ) ) ( not ( = ?auto_128963 ?auto_128965 ) ) ( not ( = ?auto_128963 ?auto_128966 ) ) ( not ( = ?auto_128963 ?auto_128967 ) ) ( not ( = ?auto_128963 ?auto_128968 ) ) ( not ( = ?auto_128964 ?auto_128965 ) ) ( not ( = ?auto_128964 ?auto_128966 ) ) ( not ( = ?auto_128964 ?auto_128967 ) ) ( not ( = ?auto_128964 ?auto_128968 ) ) ( not ( = ?auto_128965 ?auto_128966 ) ) ( not ( = ?auto_128965 ?auto_128967 ) ) ( not ( = ?auto_128965 ?auto_128968 ) ) ( not ( = ?auto_128966 ?auto_128967 ) ) ( not ( = ?auto_128966 ?auto_128968 ) ) ( not ( = ?auto_128967 ?auto_128968 ) ) ( ON ?auto_128968 ?auto_128969 ) ( not ( = ?auto_128962 ?auto_128969 ) ) ( not ( = ?auto_128963 ?auto_128969 ) ) ( not ( = ?auto_128964 ?auto_128969 ) ) ( not ( = ?auto_128965 ?auto_128969 ) ) ( not ( = ?auto_128966 ?auto_128969 ) ) ( not ( = ?auto_128967 ?auto_128969 ) ) ( not ( = ?auto_128968 ?auto_128969 ) ) ( ON ?auto_128967 ?auto_128968 ) ( ON-TABLE ?auto_128970 ) ( ON ?auto_128969 ?auto_128970 ) ( not ( = ?auto_128970 ?auto_128969 ) ) ( not ( = ?auto_128970 ?auto_128968 ) ) ( not ( = ?auto_128970 ?auto_128967 ) ) ( not ( = ?auto_128962 ?auto_128970 ) ) ( not ( = ?auto_128963 ?auto_128970 ) ) ( not ( = ?auto_128964 ?auto_128970 ) ) ( not ( = ?auto_128965 ?auto_128970 ) ) ( not ( = ?auto_128966 ?auto_128970 ) ) ( ON ?auto_128966 ?auto_128967 ) ( ON ?auto_128965 ?auto_128966 ) ( CLEAR ?auto_128965 ) ( HOLDING ?auto_128964 ) ( CLEAR ?auto_128963 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128962 ?auto_128963 ?auto_128964 )
      ( MAKE-7PILE ?auto_128962 ?auto_128963 ?auto_128964 ?auto_128965 ?auto_128966 ?auto_128967 ?auto_128968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128971 - BLOCK
      ?auto_128972 - BLOCK
      ?auto_128973 - BLOCK
      ?auto_128974 - BLOCK
      ?auto_128975 - BLOCK
      ?auto_128976 - BLOCK
      ?auto_128977 - BLOCK
    )
    :vars
    (
      ?auto_128978 - BLOCK
      ?auto_128979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128971 ) ( ON ?auto_128972 ?auto_128971 ) ( not ( = ?auto_128971 ?auto_128972 ) ) ( not ( = ?auto_128971 ?auto_128973 ) ) ( not ( = ?auto_128971 ?auto_128974 ) ) ( not ( = ?auto_128971 ?auto_128975 ) ) ( not ( = ?auto_128971 ?auto_128976 ) ) ( not ( = ?auto_128971 ?auto_128977 ) ) ( not ( = ?auto_128972 ?auto_128973 ) ) ( not ( = ?auto_128972 ?auto_128974 ) ) ( not ( = ?auto_128972 ?auto_128975 ) ) ( not ( = ?auto_128972 ?auto_128976 ) ) ( not ( = ?auto_128972 ?auto_128977 ) ) ( not ( = ?auto_128973 ?auto_128974 ) ) ( not ( = ?auto_128973 ?auto_128975 ) ) ( not ( = ?auto_128973 ?auto_128976 ) ) ( not ( = ?auto_128973 ?auto_128977 ) ) ( not ( = ?auto_128974 ?auto_128975 ) ) ( not ( = ?auto_128974 ?auto_128976 ) ) ( not ( = ?auto_128974 ?auto_128977 ) ) ( not ( = ?auto_128975 ?auto_128976 ) ) ( not ( = ?auto_128975 ?auto_128977 ) ) ( not ( = ?auto_128976 ?auto_128977 ) ) ( ON ?auto_128977 ?auto_128978 ) ( not ( = ?auto_128971 ?auto_128978 ) ) ( not ( = ?auto_128972 ?auto_128978 ) ) ( not ( = ?auto_128973 ?auto_128978 ) ) ( not ( = ?auto_128974 ?auto_128978 ) ) ( not ( = ?auto_128975 ?auto_128978 ) ) ( not ( = ?auto_128976 ?auto_128978 ) ) ( not ( = ?auto_128977 ?auto_128978 ) ) ( ON ?auto_128976 ?auto_128977 ) ( ON-TABLE ?auto_128979 ) ( ON ?auto_128978 ?auto_128979 ) ( not ( = ?auto_128979 ?auto_128978 ) ) ( not ( = ?auto_128979 ?auto_128977 ) ) ( not ( = ?auto_128979 ?auto_128976 ) ) ( not ( = ?auto_128971 ?auto_128979 ) ) ( not ( = ?auto_128972 ?auto_128979 ) ) ( not ( = ?auto_128973 ?auto_128979 ) ) ( not ( = ?auto_128974 ?auto_128979 ) ) ( not ( = ?auto_128975 ?auto_128979 ) ) ( ON ?auto_128975 ?auto_128976 ) ( ON ?auto_128974 ?auto_128975 ) ( CLEAR ?auto_128972 ) ( ON ?auto_128973 ?auto_128974 ) ( CLEAR ?auto_128973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128979 ?auto_128978 ?auto_128977 ?auto_128976 ?auto_128975 ?auto_128974 )
      ( MAKE-7PILE ?auto_128971 ?auto_128972 ?auto_128973 ?auto_128974 ?auto_128975 ?auto_128976 ?auto_128977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128980 - BLOCK
      ?auto_128981 - BLOCK
      ?auto_128982 - BLOCK
      ?auto_128983 - BLOCK
      ?auto_128984 - BLOCK
      ?auto_128985 - BLOCK
      ?auto_128986 - BLOCK
    )
    :vars
    (
      ?auto_128988 - BLOCK
      ?auto_128987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128980 ) ( not ( = ?auto_128980 ?auto_128981 ) ) ( not ( = ?auto_128980 ?auto_128982 ) ) ( not ( = ?auto_128980 ?auto_128983 ) ) ( not ( = ?auto_128980 ?auto_128984 ) ) ( not ( = ?auto_128980 ?auto_128985 ) ) ( not ( = ?auto_128980 ?auto_128986 ) ) ( not ( = ?auto_128981 ?auto_128982 ) ) ( not ( = ?auto_128981 ?auto_128983 ) ) ( not ( = ?auto_128981 ?auto_128984 ) ) ( not ( = ?auto_128981 ?auto_128985 ) ) ( not ( = ?auto_128981 ?auto_128986 ) ) ( not ( = ?auto_128982 ?auto_128983 ) ) ( not ( = ?auto_128982 ?auto_128984 ) ) ( not ( = ?auto_128982 ?auto_128985 ) ) ( not ( = ?auto_128982 ?auto_128986 ) ) ( not ( = ?auto_128983 ?auto_128984 ) ) ( not ( = ?auto_128983 ?auto_128985 ) ) ( not ( = ?auto_128983 ?auto_128986 ) ) ( not ( = ?auto_128984 ?auto_128985 ) ) ( not ( = ?auto_128984 ?auto_128986 ) ) ( not ( = ?auto_128985 ?auto_128986 ) ) ( ON ?auto_128986 ?auto_128988 ) ( not ( = ?auto_128980 ?auto_128988 ) ) ( not ( = ?auto_128981 ?auto_128988 ) ) ( not ( = ?auto_128982 ?auto_128988 ) ) ( not ( = ?auto_128983 ?auto_128988 ) ) ( not ( = ?auto_128984 ?auto_128988 ) ) ( not ( = ?auto_128985 ?auto_128988 ) ) ( not ( = ?auto_128986 ?auto_128988 ) ) ( ON ?auto_128985 ?auto_128986 ) ( ON-TABLE ?auto_128987 ) ( ON ?auto_128988 ?auto_128987 ) ( not ( = ?auto_128987 ?auto_128988 ) ) ( not ( = ?auto_128987 ?auto_128986 ) ) ( not ( = ?auto_128987 ?auto_128985 ) ) ( not ( = ?auto_128980 ?auto_128987 ) ) ( not ( = ?auto_128981 ?auto_128987 ) ) ( not ( = ?auto_128982 ?auto_128987 ) ) ( not ( = ?auto_128983 ?auto_128987 ) ) ( not ( = ?auto_128984 ?auto_128987 ) ) ( ON ?auto_128984 ?auto_128985 ) ( ON ?auto_128983 ?auto_128984 ) ( ON ?auto_128982 ?auto_128983 ) ( CLEAR ?auto_128982 ) ( HOLDING ?auto_128981 ) ( CLEAR ?auto_128980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128980 ?auto_128981 )
      ( MAKE-7PILE ?auto_128980 ?auto_128981 ?auto_128982 ?auto_128983 ?auto_128984 ?auto_128985 ?auto_128986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128989 - BLOCK
      ?auto_128990 - BLOCK
      ?auto_128991 - BLOCK
      ?auto_128992 - BLOCK
      ?auto_128993 - BLOCK
      ?auto_128994 - BLOCK
      ?auto_128995 - BLOCK
    )
    :vars
    (
      ?auto_128996 - BLOCK
      ?auto_128997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128989 ) ( not ( = ?auto_128989 ?auto_128990 ) ) ( not ( = ?auto_128989 ?auto_128991 ) ) ( not ( = ?auto_128989 ?auto_128992 ) ) ( not ( = ?auto_128989 ?auto_128993 ) ) ( not ( = ?auto_128989 ?auto_128994 ) ) ( not ( = ?auto_128989 ?auto_128995 ) ) ( not ( = ?auto_128990 ?auto_128991 ) ) ( not ( = ?auto_128990 ?auto_128992 ) ) ( not ( = ?auto_128990 ?auto_128993 ) ) ( not ( = ?auto_128990 ?auto_128994 ) ) ( not ( = ?auto_128990 ?auto_128995 ) ) ( not ( = ?auto_128991 ?auto_128992 ) ) ( not ( = ?auto_128991 ?auto_128993 ) ) ( not ( = ?auto_128991 ?auto_128994 ) ) ( not ( = ?auto_128991 ?auto_128995 ) ) ( not ( = ?auto_128992 ?auto_128993 ) ) ( not ( = ?auto_128992 ?auto_128994 ) ) ( not ( = ?auto_128992 ?auto_128995 ) ) ( not ( = ?auto_128993 ?auto_128994 ) ) ( not ( = ?auto_128993 ?auto_128995 ) ) ( not ( = ?auto_128994 ?auto_128995 ) ) ( ON ?auto_128995 ?auto_128996 ) ( not ( = ?auto_128989 ?auto_128996 ) ) ( not ( = ?auto_128990 ?auto_128996 ) ) ( not ( = ?auto_128991 ?auto_128996 ) ) ( not ( = ?auto_128992 ?auto_128996 ) ) ( not ( = ?auto_128993 ?auto_128996 ) ) ( not ( = ?auto_128994 ?auto_128996 ) ) ( not ( = ?auto_128995 ?auto_128996 ) ) ( ON ?auto_128994 ?auto_128995 ) ( ON-TABLE ?auto_128997 ) ( ON ?auto_128996 ?auto_128997 ) ( not ( = ?auto_128997 ?auto_128996 ) ) ( not ( = ?auto_128997 ?auto_128995 ) ) ( not ( = ?auto_128997 ?auto_128994 ) ) ( not ( = ?auto_128989 ?auto_128997 ) ) ( not ( = ?auto_128990 ?auto_128997 ) ) ( not ( = ?auto_128991 ?auto_128997 ) ) ( not ( = ?auto_128992 ?auto_128997 ) ) ( not ( = ?auto_128993 ?auto_128997 ) ) ( ON ?auto_128993 ?auto_128994 ) ( ON ?auto_128992 ?auto_128993 ) ( ON ?auto_128991 ?auto_128992 ) ( CLEAR ?auto_128989 ) ( ON ?auto_128990 ?auto_128991 ) ( CLEAR ?auto_128990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128997 ?auto_128996 ?auto_128995 ?auto_128994 ?auto_128993 ?auto_128992 ?auto_128991 )
      ( MAKE-7PILE ?auto_128989 ?auto_128990 ?auto_128991 ?auto_128992 ?auto_128993 ?auto_128994 ?auto_128995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_128998 - BLOCK
      ?auto_128999 - BLOCK
      ?auto_129000 - BLOCK
      ?auto_129001 - BLOCK
      ?auto_129002 - BLOCK
      ?auto_129003 - BLOCK
      ?auto_129004 - BLOCK
    )
    :vars
    (
      ?auto_129006 - BLOCK
      ?auto_129005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128998 ?auto_128999 ) ) ( not ( = ?auto_128998 ?auto_129000 ) ) ( not ( = ?auto_128998 ?auto_129001 ) ) ( not ( = ?auto_128998 ?auto_129002 ) ) ( not ( = ?auto_128998 ?auto_129003 ) ) ( not ( = ?auto_128998 ?auto_129004 ) ) ( not ( = ?auto_128999 ?auto_129000 ) ) ( not ( = ?auto_128999 ?auto_129001 ) ) ( not ( = ?auto_128999 ?auto_129002 ) ) ( not ( = ?auto_128999 ?auto_129003 ) ) ( not ( = ?auto_128999 ?auto_129004 ) ) ( not ( = ?auto_129000 ?auto_129001 ) ) ( not ( = ?auto_129000 ?auto_129002 ) ) ( not ( = ?auto_129000 ?auto_129003 ) ) ( not ( = ?auto_129000 ?auto_129004 ) ) ( not ( = ?auto_129001 ?auto_129002 ) ) ( not ( = ?auto_129001 ?auto_129003 ) ) ( not ( = ?auto_129001 ?auto_129004 ) ) ( not ( = ?auto_129002 ?auto_129003 ) ) ( not ( = ?auto_129002 ?auto_129004 ) ) ( not ( = ?auto_129003 ?auto_129004 ) ) ( ON ?auto_129004 ?auto_129006 ) ( not ( = ?auto_128998 ?auto_129006 ) ) ( not ( = ?auto_128999 ?auto_129006 ) ) ( not ( = ?auto_129000 ?auto_129006 ) ) ( not ( = ?auto_129001 ?auto_129006 ) ) ( not ( = ?auto_129002 ?auto_129006 ) ) ( not ( = ?auto_129003 ?auto_129006 ) ) ( not ( = ?auto_129004 ?auto_129006 ) ) ( ON ?auto_129003 ?auto_129004 ) ( ON-TABLE ?auto_129005 ) ( ON ?auto_129006 ?auto_129005 ) ( not ( = ?auto_129005 ?auto_129006 ) ) ( not ( = ?auto_129005 ?auto_129004 ) ) ( not ( = ?auto_129005 ?auto_129003 ) ) ( not ( = ?auto_128998 ?auto_129005 ) ) ( not ( = ?auto_128999 ?auto_129005 ) ) ( not ( = ?auto_129000 ?auto_129005 ) ) ( not ( = ?auto_129001 ?auto_129005 ) ) ( not ( = ?auto_129002 ?auto_129005 ) ) ( ON ?auto_129002 ?auto_129003 ) ( ON ?auto_129001 ?auto_129002 ) ( ON ?auto_129000 ?auto_129001 ) ( ON ?auto_128999 ?auto_129000 ) ( CLEAR ?auto_128999 ) ( HOLDING ?auto_128998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128998 )
      ( MAKE-7PILE ?auto_128998 ?auto_128999 ?auto_129000 ?auto_129001 ?auto_129002 ?auto_129003 ?auto_129004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129007 - BLOCK
      ?auto_129008 - BLOCK
      ?auto_129009 - BLOCK
      ?auto_129010 - BLOCK
      ?auto_129011 - BLOCK
      ?auto_129012 - BLOCK
      ?auto_129013 - BLOCK
    )
    :vars
    (
      ?auto_129015 - BLOCK
      ?auto_129014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129007 ?auto_129008 ) ) ( not ( = ?auto_129007 ?auto_129009 ) ) ( not ( = ?auto_129007 ?auto_129010 ) ) ( not ( = ?auto_129007 ?auto_129011 ) ) ( not ( = ?auto_129007 ?auto_129012 ) ) ( not ( = ?auto_129007 ?auto_129013 ) ) ( not ( = ?auto_129008 ?auto_129009 ) ) ( not ( = ?auto_129008 ?auto_129010 ) ) ( not ( = ?auto_129008 ?auto_129011 ) ) ( not ( = ?auto_129008 ?auto_129012 ) ) ( not ( = ?auto_129008 ?auto_129013 ) ) ( not ( = ?auto_129009 ?auto_129010 ) ) ( not ( = ?auto_129009 ?auto_129011 ) ) ( not ( = ?auto_129009 ?auto_129012 ) ) ( not ( = ?auto_129009 ?auto_129013 ) ) ( not ( = ?auto_129010 ?auto_129011 ) ) ( not ( = ?auto_129010 ?auto_129012 ) ) ( not ( = ?auto_129010 ?auto_129013 ) ) ( not ( = ?auto_129011 ?auto_129012 ) ) ( not ( = ?auto_129011 ?auto_129013 ) ) ( not ( = ?auto_129012 ?auto_129013 ) ) ( ON ?auto_129013 ?auto_129015 ) ( not ( = ?auto_129007 ?auto_129015 ) ) ( not ( = ?auto_129008 ?auto_129015 ) ) ( not ( = ?auto_129009 ?auto_129015 ) ) ( not ( = ?auto_129010 ?auto_129015 ) ) ( not ( = ?auto_129011 ?auto_129015 ) ) ( not ( = ?auto_129012 ?auto_129015 ) ) ( not ( = ?auto_129013 ?auto_129015 ) ) ( ON ?auto_129012 ?auto_129013 ) ( ON-TABLE ?auto_129014 ) ( ON ?auto_129015 ?auto_129014 ) ( not ( = ?auto_129014 ?auto_129015 ) ) ( not ( = ?auto_129014 ?auto_129013 ) ) ( not ( = ?auto_129014 ?auto_129012 ) ) ( not ( = ?auto_129007 ?auto_129014 ) ) ( not ( = ?auto_129008 ?auto_129014 ) ) ( not ( = ?auto_129009 ?auto_129014 ) ) ( not ( = ?auto_129010 ?auto_129014 ) ) ( not ( = ?auto_129011 ?auto_129014 ) ) ( ON ?auto_129011 ?auto_129012 ) ( ON ?auto_129010 ?auto_129011 ) ( ON ?auto_129009 ?auto_129010 ) ( ON ?auto_129008 ?auto_129009 ) ( ON ?auto_129007 ?auto_129008 ) ( CLEAR ?auto_129007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129014 ?auto_129015 ?auto_129013 ?auto_129012 ?auto_129011 ?auto_129010 ?auto_129009 ?auto_129008 )
      ( MAKE-7PILE ?auto_129007 ?auto_129008 ?auto_129009 ?auto_129010 ?auto_129011 ?auto_129012 ?auto_129013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129017 - BLOCK
    )
    :vars
    (
      ?auto_129018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129018 ?auto_129017 ) ( CLEAR ?auto_129018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129017 ) ( not ( = ?auto_129017 ?auto_129018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129018 ?auto_129017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129019 - BLOCK
    )
    :vars
    (
      ?auto_129020 - BLOCK
      ?auto_129021 - BLOCK
      ?auto_129022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129020 ?auto_129019 ) ( CLEAR ?auto_129020 ) ( ON-TABLE ?auto_129019 ) ( not ( = ?auto_129019 ?auto_129020 ) ) ( HOLDING ?auto_129021 ) ( CLEAR ?auto_129022 ) ( not ( = ?auto_129019 ?auto_129021 ) ) ( not ( = ?auto_129019 ?auto_129022 ) ) ( not ( = ?auto_129020 ?auto_129021 ) ) ( not ( = ?auto_129020 ?auto_129022 ) ) ( not ( = ?auto_129021 ?auto_129022 ) ) )
    :subtasks
    ( ( !STACK ?auto_129021 ?auto_129022 )
      ( MAKE-1PILE ?auto_129019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129023 - BLOCK
    )
    :vars
    (
      ?auto_129025 - BLOCK
      ?auto_129024 - BLOCK
      ?auto_129026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129025 ?auto_129023 ) ( ON-TABLE ?auto_129023 ) ( not ( = ?auto_129023 ?auto_129025 ) ) ( CLEAR ?auto_129024 ) ( not ( = ?auto_129023 ?auto_129026 ) ) ( not ( = ?auto_129023 ?auto_129024 ) ) ( not ( = ?auto_129025 ?auto_129026 ) ) ( not ( = ?auto_129025 ?auto_129024 ) ) ( not ( = ?auto_129026 ?auto_129024 ) ) ( ON ?auto_129026 ?auto_129025 ) ( CLEAR ?auto_129026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129023 ?auto_129025 )
      ( MAKE-1PILE ?auto_129023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129027 - BLOCK
    )
    :vars
    (
      ?auto_129028 - BLOCK
      ?auto_129029 - BLOCK
      ?auto_129030 - BLOCK
      ?auto_129035 - BLOCK
      ?auto_129033 - BLOCK
      ?auto_129034 - BLOCK
      ?auto_129031 - BLOCK
      ?auto_129032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129028 ?auto_129027 ) ( ON-TABLE ?auto_129027 ) ( not ( = ?auto_129027 ?auto_129028 ) ) ( not ( = ?auto_129027 ?auto_129029 ) ) ( not ( = ?auto_129027 ?auto_129030 ) ) ( not ( = ?auto_129028 ?auto_129029 ) ) ( not ( = ?auto_129028 ?auto_129030 ) ) ( not ( = ?auto_129029 ?auto_129030 ) ) ( ON ?auto_129029 ?auto_129028 ) ( CLEAR ?auto_129029 ) ( HOLDING ?auto_129030 ) ( CLEAR ?auto_129035 ) ( ON-TABLE ?auto_129033 ) ( ON ?auto_129034 ?auto_129033 ) ( ON ?auto_129031 ?auto_129034 ) ( ON ?auto_129032 ?auto_129031 ) ( ON ?auto_129035 ?auto_129032 ) ( not ( = ?auto_129033 ?auto_129034 ) ) ( not ( = ?auto_129033 ?auto_129031 ) ) ( not ( = ?auto_129033 ?auto_129032 ) ) ( not ( = ?auto_129033 ?auto_129035 ) ) ( not ( = ?auto_129033 ?auto_129030 ) ) ( not ( = ?auto_129034 ?auto_129031 ) ) ( not ( = ?auto_129034 ?auto_129032 ) ) ( not ( = ?auto_129034 ?auto_129035 ) ) ( not ( = ?auto_129034 ?auto_129030 ) ) ( not ( = ?auto_129031 ?auto_129032 ) ) ( not ( = ?auto_129031 ?auto_129035 ) ) ( not ( = ?auto_129031 ?auto_129030 ) ) ( not ( = ?auto_129032 ?auto_129035 ) ) ( not ( = ?auto_129032 ?auto_129030 ) ) ( not ( = ?auto_129035 ?auto_129030 ) ) ( not ( = ?auto_129027 ?auto_129035 ) ) ( not ( = ?auto_129027 ?auto_129033 ) ) ( not ( = ?auto_129027 ?auto_129034 ) ) ( not ( = ?auto_129027 ?auto_129031 ) ) ( not ( = ?auto_129027 ?auto_129032 ) ) ( not ( = ?auto_129028 ?auto_129035 ) ) ( not ( = ?auto_129028 ?auto_129033 ) ) ( not ( = ?auto_129028 ?auto_129034 ) ) ( not ( = ?auto_129028 ?auto_129031 ) ) ( not ( = ?auto_129028 ?auto_129032 ) ) ( not ( = ?auto_129029 ?auto_129035 ) ) ( not ( = ?auto_129029 ?auto_129033 ) ) ( not ( = ?auto_129029 ?auto_129034 ) ) ( not ( = ?auto_129029 ?auto_129031 ) ) ( not ( = ?auto_129029 ?auto_129032 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129033 ?auto_129034 ?auto_129031 ?auto_129032 ?auto_129035 ?auto_129030 )
      ( MAKE-1PILE ?auto_129027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129036 - BLOCK
    )
    :vars
    (
      ?auto_129038 - BLOCK
      ?auto_129039 - BLOCK
      ?auto_129037 - BLOCK
      ?auto_129041 - BLOCK
      ?auto_129043 - BLOCK
      ?auto_129042 - BLOCK
      ?auto_129040 - BLOCK
      ?auto_129044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129038 ?auto_129036 ) ( ON-TABLE ?auto_129036 ) ( not ( = ?auto_129036 ?auto_129038 ) ) ( not ( = ?auto_129036 ?auto_129039 ) ) ( not ( = ?auto_129036 ?auto_129037 ) ) ( not ( = ?auto_129038 ?auto_129039 ) ) ( not ( = ?auto_129038 ?auto_129037 ) ) ( not ( = ?auto_129039 ?auto_129037 ) ) ( ON ?auto_129039 ?auto_129038 ) ( CLEAR ?auto_129041 ) ( ON-TABLE ?auto_129043 ) ( ON ?auto_129042 ?auto_129043 ) ( ON ?auto_129040 ?auto_129042 ) ( ON ?auto_129044 ?auto_129040 ) ( ON ?auto_129041 ?auto_129044 ) ( not ( = ?auto_129043 ?auto_129042 ) ) ( not ( = ?auto_129043 ?auto_129040 ) ) ( not ( = ?auto_129043 ?auto_129044 ) ) ( not ( = ?auto_129043 ?auto_129041 ) ) ( not ( = ?auto_129043 ?auto_129037 ) ) ( not ( = ?auto_129042 ?auto_129040 ) ) ( not ( = ?auto_129042 ?auto_129044 ) ) ( not ( = ?auto_129042 ?auto_129041 ) ) ( not ( = ?auto_129042 ?auto_129037 ) ) ( not ( = ?auto_129040 ?auto_129044 ) ) ( not ( = ?auto_129040 ?auto_129041 ) ) ( not ( = ?auto_129040 ?auto_129037 ) ) ( not ( = ?auto_129044 ?auto_129041 ) ) ( not ( = ?auto_129044 ?auto_129037 ) ) ( not ( = ?auto_129041 ?auto_129037 ) ) ( not ( = ?auto_129036 ?auto_129041 ) ) ( not ( = ?auto_129036 ?auto_129043 ) ) ( not ( = ?auto_129036 ?auto_129042 ) ) ( not ( = ?auto_129036 ?auto_129040 ) ) ( not ( = ?auto_129036 ?auto_129044 ) ) ( not ( = ?auto_129038 ?auto_129041 ) ) ( not ( = ?auto_129038 ?auto_129043 ) ) ( not ( = ?auto_129038 ?auto_129042 ) ) ( not ( = ?auto_129038 ?auto_129040 ) ) ( not ( = ?auto_129038 ?auto_129044 ) ) ( not ( = ?auto_129039 ?auto_129041 ) ) ( not ( = ?auto_129039 ?auto_129043 ) ) ( not ( = ?auto_129039 ?auto_129042 ) ) ( not ( = ?auto_129039 ?auto_129040 ) ) ( not ( = ?auto_129039 ?auto_129044 ) ) ( ON ?auto_129037 ?auto_129039 ) ( CLEAR ?auto_129037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129036 ?auto_129038 ?auto_129039 )
      ( MAKE-1PILE ?auto_129036 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129045 - BLOCK
    )
    :vars
    (
      ?auto_129050 - BLOCK
      ?auto_129047 - BLOCK
      ?auto_129048 - BLOCK
      ?auto_129051 - BLOCK
      ?auto_129049 - BLOCK
      ?auto_129052 - BLOCK
      ?auto_129053 - BLOCK
      ?auto_129046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129050 ?auto_129045 ) ( ON-TABLE ?auto_129045 ) ( not ( = ?auto_129045 ?auto_129050 ) ) ( not ( = ?auto_129045 ?auto_129047 ) ) ( not ( = ?auto_129045 ?auto_129048 ) ) ( not ( = ?auto_129050 ?auto_129047 ) ) ( not ( = ?auto_129050 ?auto_129048 ) ) ( not ( = ?auto_129047 ?auto_129048 ) ) ( ON ?auto_129047 ?auto_129050 ) ( ON-TABLE ?auto_129051 ) ( ON ?auto_129049 ?auto_129051 ) ( ON ?auto_129052 ?auto_129049 ) ( ON ?auto_129053 ?auto_129052 ) ( not ( = ?auto_129051 ?auto_129049 ) ) ( not ( = ?auto_129051 ?auto_129052 ) ) ( not ( = ?auto_129051 ?auto_129053 ) ) ( not ( = ?auto_129051 ?auto_129046 ) ) ( not ( = ?auto_129051 ?auto_129048 ) ) ( not ( = ?auto_129049 ?auto_129052 ) ) ( not ( = ?auto_129049 ?auto_129053 ) ) ( not ( = ?auto_129049 ?auto_129046 ) ) ( not ( = ?auto_129049 ?auto_129048 ) ) ( not ( = ?auto_129052 ?auto_129053 ) ) ( not ( = ?auto_129052 ?auto_129046 ) ) ( not ( = ?auto_129052 ?auto_129048 ) ) ( not ( = ?auto_129053 ?auto_129046 ) ) ( not ( = ?auto_129053 ?auto_129048 ) ) ( not ( = ?auto_129046 ?auto_129048 ) ) ( not ( = ?auto_129045 ?auto_129046 ) ) ( not ( = ?auto_129045 ?auto_129051 ) ) ( not ( = ?auto_129045 ?auto_129049 ) ) ( not ( = ?auto_129045 ?auto_129052 ) ) ( not ( = ?auto_129045 ?auto_129053 ) ) ( not ( = ?auto_129050 ?auto_129046 ) ) ( not ( = ?auto_129050 ?auto_129051 ) ) ( not ( = ?auto_129050 ?auto_129049 ) ) ( not ( = ?auto_129050 ?auto_129052 ) ) ( not ( = ?auto_129050 ?auto_129053 ) ) ( not ( = ?auto_129047 ?auto_129046 ) ) ( not ( = ?auto_129047 ?auto_129051 ) ) ( not ( = ?auto_129047 ?auto_129049 ) ) ( not ( = ?auto_129047 ?auto_129052 ) ) ( not ( = ?auto_129047 ?auto_129053 ) ) ( ON ?auto_129048 ?auto_129047 ) ( CLEAR ?auto_129048 ) ( HOLDING ?auto_129046 ) ( CLEAR ?auto_129053 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129051 ?auto_129049 ?auto_129052 ?auto_129053 ?auto_129046 )
      ( MAKE-1PILE ?auto_129045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129054 - BLOCK
    )
    :vars
    (
      ?auto_129057 - BLOCK
      ?auto_129060 - BLOCK
      ?auto_129061 - BLOCK
      ?auto_129055 - BLOCK
      ?auto_129059 - BLOCK
      ?auto_129056 - BLOCK
      ?auto_129058 - BLOCK
      ?auto_129062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129057 ?auto_129054 ) ( ON-TABLE ?auto_129054 ) ( not ( = ?auto_129054 ?auto_129057 ) ) ( not ( = ?auto_129054 ?auto_129060 ) ) ( not ( = ?auto_129054 ?auto_129061 ) ) ( not ( = ?auto_129057 ?auto_129060 ) ) ( not ( = ?auto_129057 ?auto_129061 ) ) ( not ( = ?auto_129060 ?auto_129061 ) ) ( ON ?auto_129060 ?auto_129057 ) ( ON-TABLE ?auto_129055 ) ( ON ?auto_129059 ?auto_129055 ) ( ON ?auto_129056 ?auto_129059 ) ( ON ?auto_129058 ?auto_129056 ) ( not ( = ?auto_129055 ?auto_129059 ) ) ( not ( = ?auto_129055 ?auto_129056 ) ) ( not ( = ?auto_129055 ?auto_129058 ) ) ( not ( = ?auto_129055 ?auto_129062 ) ) ( not ( = ?auto_129055 ?auto_129061 ) ) ( not ( = ?auto_129059 ?auto_129056 ) ) ( not ( = ?auto_129059 ?auto_129058 ) ) ( not ( = ?auto_129059 ?auto_129062 ) ) ( not ( = ?auto_129059 ?auto_129061 ) ) ( not ( = ?auto_129056 ?auto_129058 ) ) ( not ( = ?auto_129056 ?auto_129062 ) ) ( not ( = ?auto_129056 ?auto_129061 ) ) ( not ( = ?auto_129058 ?auto_129062 ) ) ( not ( = ?auto_129058 ?auto_129061 ) ) ( not ( = ?auto_129062 ?auto_129061 ) ) ( not ( = ?auto_129054 ?auto_129062 ) ) ( not ( = ?auto_129054 ?auto_129055 ) ) ( not ( = ?auto_129054 ?auto_129059 ) ) ( not ( = ?auto_129054 ?auto_129056 ) ) ( not ( = ?auto_129054 ?auto_129058 ) ) ( not ( = ?auto_129057 ?auto_129062 ) ) ( not ( = ?auto_129057 ?auto_129055 ) ) ( not ( = ?auto_129057 ?auto_129059 ) ) ( not ( = ?auto_129057 ?auto_129056 ) ) ( not ( = ?auto_129057 ?auto_129058 ) ) ( not ( = ?auto_129060 ?auto_129062 ) ) ( not ( = ?auto_129060 ?auto_129055 ) ) ( not ( = ?auto_129060 ?auto_129059 ) ) ( not ( = ?auto_129060 ?auto_129056 ) ) ( not ( = ?auto_129060 ?auto_129058 ) ) ( ON ?auto_129061 ?auto_129060 ) ( CLEAR ?auto_129058 ) ( ON ?auto_129062 ?auto_129061 ) ( CLEAR ?auto_129062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129054 ?auto_129057 ?auto_129060 ?auto_129061 )
      ( MAKE-1PILE ?auto_129054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129063 - BLOCK
    )
    :vars
    (
      ?auto_129071 - BLOCK
      ?auto_129067 - BLOCK
      ?auto_129066 - BLOCK
      ?auto_129070 - BLOCK
      ?auto_129064 - BLOCK
      ?auto_129065 - BLOCK
      ?auto_129069 - BLOCK
      ?auto_129068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129071 ?auto_129063 ) ( ON-TABLE ?auto_129063 ) ( not ( = ?auto_129063 ?auto_129071 ) ) ( not ( = ?auto_129063 ?auto_129067 ) ) ( not ( = ?auto_129063 ?auto_129066 ) ) ( not ( = ?auto_129071 ?auto_129067 ) ) ( not ( = ?auto_129071 ?auto_129066 ) ) ( not ( = ?auto_129067 ?auto_129066 ) ) ( ON ?auto_129067 ?auto_129071 ) ( ON-TABLE ?auto_129070 ) ( ON ?auto_129064 ?auto_129070 ) ( ON ?auto_129065 ?auto_129064 ) ( not ( = ?auto_129070 ?auto_129064 ) ) ( not ( = ?auto_129070 ?auto_129065 ) ) ( not ( = ?auto_129070 ?auto_129069 ) ) ( not ( = ?auto_129070 ?auto_129068 ) ) ( not ( = ?auto_129070 ?auto_129066 ) ) ( not ( = ?auto_129064 ?auto_129065 ) ) ( not ( = ?auto_129064 ?auto_129069 ) ) ( not ( = ?auto_129064 ?auto_129068 ) ) ( not ( = ?auto_129064 ?auto_129066 ) ) ( not ( = ?auto_129065 ?auto_129069 ) ) ( not ( = ?auto_129065 ?auto_129068 ) ) ( not ( = ?auto_129065 ?auto_129066 ) ) ( not ( = ?auto_129069 ?auto_129068 ) ) ( not ( = ?auto_129069 ?auto_129066 ) ) ( not ( = ?auto_129068 ?auto_129066 ) ) ( not ( = ?auto_129063 ?auto_129068 ) ) ( not ( = ?auto_129063 ?auto_129070 ) ) ( not ( = ?auto_129063 ?auto_129064 ) ) ( not ( = ?auto_129063 ?auto_129065 ) ) ( not ( = ?auto_129063 ?auto_129069 ) ) ( not ( = ?auto_129071 ?auto_129068 ) ) ( not ( = ?auto_129071 ?auto_129070 ) ) ( not ( = ?auto_129071 ?auto_129064 ) ) ( not ( = ?auto_129071 ?auto_129065 ) ) ( not ( = ?auto_129071 ?auto_129069 ) ) ( not ( = ?auto_129067 ?auto_129068 ) ) ( not ( = ?auto_129067 ?auto_129070 ) ) ( not ( = ?auto_129067 ?auto_129064 ) ) ( not ( = ?auto_129067 ?auto_129065 ) ) ( not ( = ?auto_129067 ?auto_129069 ) ) ( ON ?auto_129066 ?auto_129067 ) ( ON ?auto_129068 ?auto_129066 ) ( CLEAR ?auto_129068 ) ( HOLDING ?auto_129069 ) ( CLEAR ?auto_129065 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129070 ?auto_129064 ?auto_129065 ?auto_129069 )
      ( MAKE-1PILE ?auto_129063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129072 - BLOCK
    )
    :vars
    (
      ?auto_129076 - BLOCK
      ?auto_129079 - BLOCK
      ?auto_129074 - BLOCK
      ?auto_129077 - BLOCK
      ?auto_129073 - BLOCK
      ?auto_129078 - BLOCK
      ?auto_129080 - BLOCK
      ?auto_129075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129076 ?auto_129072 ) ( ON-TABLE ?auto_129072 ) ( not ( = ?auto_129072 ?auto_129076 ) ) ( not ( = ?auto_129072 ?auto_129079 ) ) ( not ( = ?auto_129072 ?auto_129074 ) ) ( not ( = ?auto_129076 ?auto_129079 ) ) ( not ( = ?auto_129076 ?auto_129074 ) ) ( not ( = ?auto_129079 ?auto_129074 ) ) ( ON ?auto_129079 ?auto_129076 ) ( ON-TABLE ?auto_129077 ) ( ON ?auto_129073 ?auto_129077 ) ( ON ?auto_129078 ?auto_129073 ) ( not ( = ?auto_129077 ?auto_129073 ) ) ( not ( = ?auto_129077 ?auto_129078 ) ) ( not ( = ?auto_129077 ?auto_129080 ) ) ( not ( = ?auto_129077 ?auto_129075 ) ) ( not ( = ?auto_129077 ?auto_129074 ) ) ( not ( = ?auto_129073 ?auto_129078 ) ) ( not ( = ?auto_129073 ?auto_129080 ) ) ( not ( = ?auto_129073 ?auto_129075 ) ) ( not ( = ?auto_129073 ?auto_129074 ) ) ( not ( = ?auto_129078 ?auto_129080 ) ) ( not ( = ?auto_129078 ?auto_129075 ) ) ( not ( = ?auto_129078 ?auto_129074 ) ) ( not ( = ?auto_129080 ?auto_129075 ) ) ( not ( = ?auto_129080 ?auto_129074 ) ) ( not ( = ?auto_129075 ?auto_129074 ) ) ( not ( = ?auto_129072 ?auto_129075 ) ) ( not ( = ?auto_129072 ?auto_129077 ) ) ( not ( = ?auto_129072 ?auto_129073 ) ) ( not ( = ?auto_129072 ?auto_129078 ) ) ( not ( = ?auto_129072 ?auto_129080 ) ) ( not ( = ?auto_129076 ?auto_129075 ) ) ( not ( = ?auto_129076 ?auto_129077 ) ) ( not ( = ?auto_129076 ?auto_129073 ) ) ( not ( = ?auto_129076 ?auto_129078 ) ) ( not ( = ?auto_129076 ?auto_129080 ) ) ( not ( = ?auto_129079 ?auto_129075 ) ) ( not ( = ?auto_129079 ?auto_129077 ) ) ( not ( = ?auto_129079 ?auto_129073 ) ) ( not ( = ?auto_129079 ?auto_129078 ) ) ( not ( = ?auto_129079 ?auto_129080 ) ) ( ON ?auto_129074 ?auto_129079 ) ( ON ?auto_129075 ?auto_129074 ) ( CLEAR ?auto_129078 ) ( ON ?auto_129080 ?auto_129075 ) ( CLEAR ?auto_129080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129072 ?auto_129076 ?auto_129079 ?auto_129074 ?auto_129075 )
      ( MAKE-1PILE ?auto_129072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129081 - BLOCK
    )
    :vars
    (
      ?auto_129082 - BLOCK
      ?auto_129089 - BLOCK
      ?auto_129085 - BLOCK
      ?auto_129086 - BLOCK
      ?auto_129083 - BLOCK
      ?auto_129084 - BLOCK
      ?auto_129087 - BLOCK
      ?auto_129088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129082 ?auto_129081 ) ( ON-TABLE ?auto_129081 ) ( not ( = ?auto_129081 ?auto_129082 ) ) ( not ( = ?auto_129081 ?auto_129089 ) ) ( not ( = ?auto_129081 ?auto_129085 ) ) ( not ( = ?auto_129082 ?auto_129089 ) ) ( not ( = ?auto_129082 ?auto_129085 ) ) ( not ( = ?auto_129089 ?auto_129085 ) ) ( ON ?auto_129089 ?auto_129082 ) ( ON-TABLE ?auto_129086 ) ( ON ?auto_129083 ?auto_129086 ) ( not ( = ?auto_129086 ?auto_129083 ) ) ( not ( = ?auto_129086 ?auto_129084 ) ) ( not ( = ?auto_129086 ?auto_129087 ) ) ( not ( = ?auto_129086 ?auto_129088 ) ) ( not ( = ?auto_129086 ?auto_129085 ) ) ( not ( = ?auto_129083 ?auto_129084 ) ) ( not ( = ?auto_129083 ?auto_129087 ) ) ( not ( = ?auto_129083 ?auto_129088 ) ) ( not ( = ?auto_129083 ?auto_129085 ) ) ( not ( = ?auto_129084 ?auto_129087 ) ) ( not ( = ?auto_129084 ?auto_129088 ) ) ( not ( = ?auto_129084 ?auto_129085 ) ) ( not ( = ?auto_129087 ?auto_129088 ) ) ( not ( = ?auto_129087 ?auto_129085 ) ) ( not ( = ?auto_129088 ?auto_129085 ) ) ( not ( = ?auto_129081 ?auto_129088 ) ) ( not ( = ?auto_129081 ?auto_129086 ) ) ( not ( = ?auto_129081 ?auto_129083 ) ) ( not ( = ?auto_129081 ?auto_129084 ) ) ( not ( = ?auto_129081 ?auto_129087 ) ) ( not ( = ?auto_129082 ?auto_129088 ) ) ( not ( = ?auto_129082 ?auto_129086 ) ) ( not ( = ?auto_129082 ?auto_129083 ) ) ( not ( = ?auto_129082 ?auto_129084 ) ) ( not ( = ?auto_129082 ?auto_129087 ) ) ( not ( = ?auto_129089 ?auto_129088 ) ) ( not ( = ?auto_129089 ?auto_129086 ) ) ( not ( = ?auto_129089 ?auto_129083 ) ) ( not ( = ?auto_129089 ?auto_129084 ) ) ( not ( = ?auto_129089 ?auto_129087 ) ) ( ON ?auto_129085 ?auto_129089 ) ( ON ?auto_129088 ?auto_129085 ) ( ON ?auto_129087 ?auto_129088 ) ( CLEAR ?auto_129087 ) ( HOLDING ?auto_129084 ) ( CLEAR ?auto_129083 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129086 ?auto_129083 ?auto_129084 )
      ( MAKE-1PILE ?auto_129081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129090 - BLOCK
    )
    :vars
    (
      ?auto_129091 - BLOCK
      ?auto_129093 - BLOCK
      ?auto_129098 - BLOCK
      ?auto_129096 - BLOCK
      ?auto_129095 - BLOCK
      ?auto_129092 - BLOCK
      ?auto_129094 - BLOCK
      ?auto_129097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129091 ?auto_129090 ) ( ON-TABLE ?auto_129090 ) ( not ( = ?auto_129090 ?auto_129091 ) ) ( not ( = ?auto_129090 ?auto_129093 ) ) ( not ( = ?auto_129090 ?auto_129098 ) ) ( not ( = ?auto_129091 ?auto_129093 ) ) ( not ( = ?auto_129091 ?auto_129098 ) ) ( not ( = ?auto_129093 ?auto_129098 ) ) ( ON ?auto_129093 ?auto_129091 ) ( ON-TABLE ?auto_129096 ) ( ON ?auto_129095 ?auto_129096 ) ( not ( = ?auto_129096 ?auto_129095 ) ) ( not ( = ?auto_129096 ?auto_129092 ) ) ( not ( = ?auto_129096 ?auto_129094 ) ) ( not ( = ?auto_129096 ?auto_129097 ) ) ( not ( = ?auto_129096 ?auto_129098 ) ) ( not ( = ?auto_129095 ?auto_129092 ) ) ( not ( = ?auto_129095 ?auto_129094 ) ) ( not ( = ?auto_129095 ?auto_129097 ) ) ( not ( = ?auto_129095 ?auto_129098 ) ) ( not ( = ?auto_129092 ?auto_129094 ) ) ( not ( = ?auto_129092 ?auto_129097 ) ) ( not ( = ?auto_129092 ?auto_129098 ) ) ( not ( = ?auto_129094 ?auto_129097 ) ) ( not ( = ?auto_129094 ?auto_129098 ) ) ( not ( = ?auto_129097 ?auto_129098 ) ) ( not ( = ?auto_129090 ?auto_129097 ) ) ( not ( = ?auto_129090 ?auto_129096 ) ) ( not ( = ?auto_129090 ?auto_129095 ) ) ( not ( = ?auto_129090 ?auto_129092 ) ) ( not ( = ?auto_129090 ?auto_129094 ) ) ( not ( = ?auto_129091 ?auto_129097 ) ) ( not ( = ?auto_129091 ?auto_129096 ) ) ( not ( = ?auto_129091 ?auto_129095 ) ) ( not ( = ?auto_129091 ?auto_129092 ) ) ( not ( = ?auto_129091 ?auto_129094 ) ) ( not ( = ?auto_129093 ?auto_129097 ) ) ( not ( = ?auto_129093 ?auto_129096 ) ) ( not ( = ?auto_129093 ?auto_129095 ) ) ( not ( = ?auto_129093 ?auto_129092 ) ) ( not ( = ?auto_129093 ?auto_129094 ) ) ( ON ?auto_129098 ?auto_129093 ) ( ON ?auto_129097 ?auto_129098 ) ( ON ?auto_129094 ?auto_129097 ) ( CLEAR ?auto_129095 ) ( ON ?auto_129092 ?auto_129094 ) ( CLEAR ?auto_129092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129090 ?auto_129091 ?auto_129093 ?auto_129098 ?auto_129097 ?auto_129094 )
      ( MAKE-1PILE ?auto_129090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129099 - BLOCK
    )
    :vars
    (
      ?auto_129100 - BLOCK
      ?auto_129101 - BLOCK
      ?auto_129104 - BLOCK
      ?auto_129102 - BLOCK
      ?auto_129107 - BLOCK
      ?auto_129105 - BLOCK
      ?auto_129106 - BLOCK
      ?auto_129103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129100 ?auto_129099 ) ( ON-TABLE ?auto_129099 ) ( not ( = ?auto_129099 ?auto_129100 ) ) ( not ( = ?auto_129099 ?auto_129101 ) ) ( not ( = ?auto_129099 ?auto_129104 ) ) ( not ( = ?auto_129100 ?auto_129101 ) ) ( not ( = ?auto_129100 ?auto_129104 ) ) ( not ( = ?auto_129101 ?auto_129104 ) ) ( ON ?auto_129101 ?auto_129100 ) ( ON-TABLE ?auto_129102 ) ( not ( = ?auto_129102 ?auto_129107 ) ) ( not ( = ?auto_129102 ?auto_129105 ) ) ( not ( = ?auto_129102 ?auto_129106 ) ) ( not ( = ?auto_129102 ?auto_129103 ) ) ( not ( = ?auto_129102 ?auto_129104 ) ) ( not ( = ?auto_129107 ?auto_129105 ) ) ( not ( = ?auto_129107 ?auto_129106 ) ) ( not ( = ?auto_129107 ?auto_129103 ) ) ( not ( = ?auto_129107 ?auto_129104 ) ) ( not ( = ?auto_129105 ?auto_129106 ) ) ( not ( = ?auto_129105 ?auto_129103 ) ) ( not ( = ?auto_129105 ?auto_129104 ) ) ( not ( = ?auto_129106 ?auto_129103 ) ) ( not ( = ?auto_129106 ?auto_129104 ) ) ( not ( = ?auto_129103 ?auto_129104 ) ) ( not ( = ?auto_129099 ?auto_129103 ) ) ( not ( = ?auto_129099 ?auto_129102 ) ) ( not ( = ?auto_129099 ?auto_129107 ) ) ( not ( = ?auto_129099 ?auto_129105 ) ) ( not ( = ?auto_129099 ?auto_129106 ) ) ( not ( = ?auto_129100 ?auto_129103 ) ) ( not ( = ?auto_129100 ?auto_129102 ) ) ( not ( = ?auto_129100 ?auto_129107 ) ) ( not ( = ?auto_129100 ?auto_129105 ) ) ( not ( = ?auto_129100 ?auto_129106 ) ) ( not ( = ?auto_129101 ?auto_129103 ) ) ( not ( = ?auto_129101 ?auto_129102 ) ) ( not ( = ?auto_129101 ?auto_129107 ) ) ( not ( = ?auto_129101 ?auto_129105 ) ) ( not ( = ?auto_129101 ?auto_129106 ) ) ( ON ?auto_129104 ?auto_129101 ) ( ON ?auto_129103 ?auto_129104 ) ( ON ?auto_129106 ?auto_129103 ) ( ON ?auto_129105 ?auto_129106 ) ( CLEAR ?auto_129105 ) ( HOLDING ?auto_129107 ) ( CLEAR ?auto_129102 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129102 ?auto_129107 )
      ( MAKE-1PILE ?auto_129099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131278 - BLOCK
    )
    :vars
    (
      ?auto_131285 - BLOCK
      ?auto_131282 - BLOCK
      ?auto_131279 - BLOCK
      ?auto_131281 - BLOCK
      ?auto_131280 - BLOCK
      ?auto_131284 - BLOCK
      ?auto_131283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131285 ?auto_131278 ) ( ON-TABLE ?auto_131278 ) ( not ( = ?auto_131278 ?auto_131285 ) ) ( not ( = ?auto_131278 ?auto_131282 ) ) ( not ( = ?auto_131278 ?auto_131279 ) ) ( not ( = ?auto_131285 ?auto_131282 ) ) ( not ( = ?auto_131285 ?auto_131279 ) ) ( not ( = ?auto_131282 ?auto_131279 ) ) ( ON ?auto_131282 ?auto_131285 ) ( not ( = ?auto_131281 ?auto_131280 ) ) ( not ( = ?auto_131281 ?auto_131284 ) ) ( not ( = ?auto_131281 ?auto_131283 ) ) ( not ( = ?auto_131281 ?auto_131279 ) ) ( not ( = ?auto_131280 ?auto_131284 ) ) ( not ( = ?auto_131280 ?auto_131283 ) ) ( not ( = ?auto_131280 ?auto_131279 ) ) ( not ( = ?auto_131284 ?auto_131283 ) ) ( not ( = ?auto_131284 ?auto_131279 ) ) ( not ( = ?auto_131283 ?auto_131279 ) ) ( not ( = ?auto_131278 ?auto_131283 ) ) ( not ( = ?auto_131278 ?auto_131281 ) ) ( not ( = ?auto_131278 ?auto_131280 ) ) ( not ( = ?auto_131278 ?auto_131284 ) ) ( not ( = ?auto_131285 ?auto_131283 ) ) ( not ( = ?auto_131285 ?auto_131281 ) ) ( not ( = ?auto_131285 ?auto_131280 ) ) ( not ( = ?auto_131285 ?auto_131284 ) ) ( not ( = ?auto_131282 ?auto_131283 ) ) ( not ( = ?auto_131282 ?auto_131281 ) ) ( not ( = ?auto_131282 ?auto_131280 ) ) ( not ( = ?auto_131282 ?auto_131284 ) ) ( ON ?auto_131279 ?auto_131282 ) ( ON ?auto_131283 ?auto_131279 ) ( ON ?auto_131284 ?auto_131283 ) ( ON ?auto_131280 ?auto_131284 ) ( ON ?auto_131281 ?auto_131280 ) ( CLEAR ?auto_131281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131278 ?auto_131285 ?auto_131282 ?auto_131279 ?auto_131283 ?auto_131284 ?auto_131280 )
      ( MAKE-1PILE ?auto_131278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129117 - BLOCK
    )
    :vars
    (
      ?auto_129124 - BLOCK
      ?auto_129123 - BLOCK
      ?auto_129125 - BLOCK
      ?auto_129121 - BLOCK
      ?auto_129120 - BLOCK
      ?auto_129118 - BLOCK
      ?auto_129119 - BLOCK
      ?auto_129122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129124 ?auto_129117 ) ( ON-TABLE ?auto_129117 ) ( not ( = ?auto_129117 ?auto_129124 ) ) ( not ( = ?auto_129117 ?auto_129123 ) ) ( not ( = ?auto_129117 ?auto_129125 ) ) ( not ( = ?auto_129124 ?auto_129123 ) ) ( not ( = ?auto_129124 ?auto_129125 ) ) ( not ( = ?auto_129123 ?auto_129125 ) ) ( ON ?auto_129123 ?auto_129124 ) ( not ( = ?auto_129121 ?auto_129120 ) ) ( not ( = ?auto_129121 ?auto_129118 ) ) ( not ( = ?auto_129121 ?auto_129119 ) ) ( not ( = ?auto_129121 ?auto_129122 ) ) ( not ( = ?auto_129121 ?auto_129125 ) ) ( not ( = ?auto_129120 ?auto_129118 ) ) ( not ( = ?auto_129120 ?auto_129119 ) ) ( not ( = ?auto_129120 ?auto_129122 ) ) ( not ( = ?auto_129120 ?auto_129125 ) ) ( not ( = ?auto_129118 ?auto_129119 ) ) ( not ( = ?auto_129118 ?auto_129122 ) ) ( not ( = ?auto_129118 ?auto_129125 ) ) ( not ( = ?auto_129119 ?auto_129122 ) ) ( not ( = ?auto_129119 ?auto_129125 ) ) ( not ( = ?auto_129122 ?auto_129125 ) ) ( not ( = ?auto_129117 ?auto_129122 ) ) ( not ( = ?auto_129117 ?auto_129121 ) ) ( not ( = ?auto_129117 ?auto_129120 ) ) ( not ( = ?auto_129117 ?auto_129118 ) ) ( not ( = ?auto_129117 ?auto_129119 ) ) ( not ( = ?auto_129124 ?auto_129122 ) ) ( not ( = ?auto_129124 ?auto_129121 ) ) ( not ( = ?auto_129124 ?auto_129120 ) ) ( not ( = ?auto_129124 ?auto_129118 ) ) ( not ( = ?auto_129124 ?auto_129119 ) ) ( not ( = ?auto_129123 ?auto_129122 ) ) ( not ( = ?auto_129123 ?auto_129121 ) ) ( not ( = ?auto_129123 ?auto_129120 ) ) ( not ( = ?auto_129123 ?auto_129118 ) ) ( not ( = ?auto_129123 ?auto_129119 ) ) ( ON ?auto_129125 ?auto_129123 ) ( ON ?auto_129122 ?auto_129125 ) ( ON ?auto_129119 ?auto_129122 ) ( ON ?auto_129118 ?auto_129119 ) ( ON ?auto_129120 ?auto_129118 ) ( CLEAR ?auto_129120 ) ( HOLDING ?auto_129121 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129121 )
      ( MAKE-1PILE ?auto_129117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129126 - BLOCK
    )
    :vars
    (
      ?auto_129134 - BLOCK
      ?auto_129131 - BLOCK
      ?auto_129129 - BLOCK
      ?auto_129128 - BLOCK
      ?auto_129127 - BLOCK
      ?auto_129133 - BLOCK
      ?auto_129130 - BLOCK
      ?auto_129132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129134 ?auto_129126 ) ( ON-TABLE ?auto_129126 ) ( not ( = ?auto_129126 ?auto_129134 ) ) ( not ( = ?auto_129126 ?auto_129131 ) ) ( not ( = ?auto_129126 ?auto_129129 ) ) ( not ( = ?auto_129134 ?auto_129131 ) ) ( not ( = ?auto_129134 ?auto_129129 ) ) ( not ( = ?auto_129131 ?auto_129129 ) ) ( ON ?auto_129131 ?auto_129134 ) ( not ( = ?auto_129128 ?auto_129127 ) ) ( not ( = ?auto_129128 ?auto_129133 ) ) ( not ( = ?auto_129128 ?auto_129130 ) ) ( not ( = ?auto_129128 ?auto_129132 ) ) ( not ( = ?auto_129128 ?auto_129129 ) ) ( not ( = ?auto_129127 ?auto_129133 ) ) ( not ( = ?auto_129127 ?auto_129130 ) ) ( not ( = ?auto_129127 ?auto_129132 ) ) ( not ( = ?auto_129127 ?auto_129129 ) ) ( not ( = ?auto_129133 ?auto_129130 ) ) ( not ( = ?auto_129133 ?auto_129132 ) ) ( not ( = ?auto_129133 ?auto_129129 ) ) ( not ( = ?auto_129130 ?auto_129132 ) ) ( not ( = ?auto_129130 ?auto_129129 ) ) ( not ( = ?auto_129132 ?auto_129129 ) ) ( not ( = ?auto_129126 ?auto_129132 ) ) ( not ( = ?auto_129126 ?auto_129128 ) ) ( not ( = ?auto_129126 ?auto_129127 ) ) ( not ( = ?auto_129126 ?auto_129133 ) ) ( not ( = ?auto_129126 ?auto_129130 ) ) ( not ( = ?auto_129134 ?auto_129132 ) ) ( not ( = ?auto_129134 ?auto_129128 ) ) ( not ( = ?auto_129134 ?auto_129127 ) ) ( not ( = ?auto_129134 ?auto_129133 ) ) ( not ( = ?auto_129134 ?auto_129130 ) ) ( not ( = ?auto_129131 ?auto_129132 ) ) ( not ( = ?auto_129131 ?auto_129128 ) ) ( not ( = ?auto_129131 ?auto_129127 ) ) ( not ( = ?auto_129131 ?auto_129133 ) ) ( not ( = ?auto_129131 ?auto_129130 ) ) ( ON ?auto_129129 ?auto_129131 ) ( ON ?auto_129132 ?auto_129129 ) ( ON ?auto_129130 ?auto_129132 ) ( ON ?auto_129133 ?auto_129130 ) ( ON ?auto_129127 ?auto_129133 ) ( ON ?auto_129128 ?auto_129127 ) ( CLEAR ?auto_129128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129126 ?auto_129134 ?auto_129131 ?auto_129129 ?auto_129132 ?auto_129130 ?auto_129133 ?auto_129127 )
      ( MAKE-1PILE ?auto_129126 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129143 - BLOCK
      ?auto_129144 - BLOCK
      ?auto_129145 - BLOCK
      ?auto_129146 - BLOCK
      ?auto_129147 - BLOCK
      ?auto_129148 - BLOCK
      ?auto_129149 - BLOCK
      ?auto_129150 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_129150 ) ( CLEAR ?auto_129149 ) ( ON-TABLE ?auto_129143 ) ( ON ?auto_129144 ?auto_129143 ) ( ON ?auto_129145 ?auto_129144 ) ( ON ?auto_129146 ?auto_129145 ) ( ON ?auto_129147 ?auto_129146 ) ( ON ?auto_129148 ?auto_129147 ) ( ON ?auto_129149 ?auto_129148 ) ( not ( = ?auto_129143 ?auto_129144 ) ) ( not ( = ?auto_129143 ?auto_129145 ) ) ( not ( = ?auto_129143 ?auto_129146 ) ) ( not ( = ?auto_129143 ?auto_129147 ) ) ( not ( = ?auto_129143 ?auto_129148 ) ) ( not ( = ?auto_129143 ?auto_129149 ) ) ( not ( = ?auto_129143 ?auto_129150 ) ) ( not ( = ?auto_129144 ?auto_129145 ) ) ( not ( = ?auto_129144 ?auto_129146 ) ) ( not ( = ?auto_129144 ?auto_129147 ) ) ( not ( = ?auto_129144 ?auto_129148 ) ) ( not ( = ?auto_129144 ?auto_129149 ) ) ( not ( = ?auto_129144 ?auto_129150 ) ) ( not ( = ?auto_129145 ?auto_129146 ) ) ( not ( = ?auto_129145 ?auto_129147 ) ) ( not ( = ?auto_129145 ?auto_129148 ) ) ( not ( = ?auto_129145 ?auto_129149 ) ) ( not ( = ?auto_129145 ?auto_129150 ) ) ( not ( = ?auto_129146 ?auto_129147 ) ) ( not ( = ?auto_129146 ?auto_129148 ) ) ( not ( = ?auto_129146 ?auto_129149 ) ) ( not ( = ?auto_129146 ?auto_129150 ) ) ( not ( = ?auto_129147 ?auto_129148 ) ) ( not ( = ?auto_129147 ?auto_129149 ) ) ( not ( = ?auto_129147 ?auto_129150 ) ) ( not ( = ?auto_129148 ?auto_129149 ) ) ( not ( = ?auto_129148 ?auto_129150 ) ) ( not ( = ?auto_129149 ?auto_129150 ) ) )
    :subtasks
    ( ( !STACK ?auto_129150 ?auto_129149 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129151 - BLOCK
      ?auto_129152 - BLOCK
      ?auto_129153 - BLOCK
      ?auto_129154 - BLOCK
      ?auto_129155 - BLOCK
      ?auto_129156 - BLOCK
      ?auto_129157 - BLOCK
      ?auto_129158 - BLOCK
    )
    :vars
    (
      ?auto_129159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129157 ) ( ON-TABLE ?auto_129151 ) ( ON ?auto_129152 ?auto_129151 ) ( ON ?auto_129153 ?auto_129152 ) ( ON ?auto_129154 ?auto_129153 ) ( ON ?auto_129155 ?auto_129154 ) ( ON ?auto_129156 ?auto_129155 ) ( ON ?auto_129157 ?auto_129156 ) ( not ( = ?auto_129151 ?auto_129152 ) ) ( not ( = ?auto_129151 ?auto_129153 ) ) ( not ( = ?auto_129151 ?auto_129154 ) ) ( not ( = ?auto_129151 ?auto_129155 ) ) ( not ( = ?auto_129151 ?auto_129156 ) ) ( not ( = ?auto_129151 ?auto_129157 ) ) ( not ( = ?auto_129151 ?auto_129158 ) ) ( not ( = ?auto_129152 ?auto_129153 ) ) ( not ( = ?auto_129152 ?auto_129154 ) ) ( not ( = ?auto_129152 ?auto_129155 ) ) ( not ( = ?auto_129152 ?auto_129156 ) ) ( not ( = ?auto_129152 ?auto_129157 ) ) ( not ( = ?auto_129152 ?auto_129158 ) ) ( not ( = ?auto_129153 ?auto_129154 ) ) ( not ( = ?auto_129153 ?auto_129155 ) ) ( not ( = ?auto_129153 ?auto_129156 ) ) ( not ( = ?auto_129153 ?auto_129157 ) ) ( not ( = ?auto_129153 ?auto_129158 ) ) ( not ( = ?auto_129154 ?auto_129155 ) ) ( not ( = ?auto_129154 ?auto_129156 ) ) ( not ( = ?auto_129154 ?auto_129157 ) ) ( not ( = ?auto_129154 ?auto_129158 ) ) ( not ( = ?auto_129155 ?auto_129156 ) ) ( not ( = ?auto_129155 ?auto_129157 ) ) ( not ( = ?auto_129155 ?auto_129158 ) ) ( not ( = ?auto_129156 ?auto_129157 ) ) ( not ( = ?auto_129156 ?auto_129158 ) ) ( not ( = ?auto_129157 ?auto_129158 ) ) ( ON ?auto_129158 ?auto_129159 ) ( CLEAR ?auto_129158 ) ( HAND-EMPTY ) ( not ( = ?auto_129151 ?auto_129159 ) ) ( not ( = ?auto_129152 ?auto_129159 ) ) ( not ( = ?auto_129153 ?auto_129159 ) ) ( not ( = ?auto_129154 ?auto_129159 ) ) ( not ( = ?auto_129155 ?auto_129159 ) ) ( not ( = ?auto_129156 ?auto_129159 ) ) ( not ( = ?auto_129157 ?auto_129159 ) ) ( not ( = ?auto_129158 ?auto_129159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129158 ?auto_129159 )
      ( MAKE-8PILE ?auto_129151 ?auto_129152 ?auto_129153 ?auto_129154 ?auto_129155 ?auto_129156 ?auto_129157 ?auto_129158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129160 - BLOCK
      ?auto_129161 - BLOCK
      ?auto_129162 - BLOCK
      ?auto_129163 - BLOCK
      ?auto_129164 - BLOCK
      ?auto_129165 - BLOCK
      ?auto_129166 - BLOCK
      ?auto_129167 - BLOCK
    )
    :vars
    (
      ?auto_129168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129160 ) ( ON ?auto_129161 ?auto_129160 ) ( ON ?auto_129162 ?auto_129161 ) ( ON ?auto_129163 ?auto_129162 ) ( ON ?auto_129164 ?auto_129163 ) ( ON ?auto_129165 ?auto_129164 ) ( not ( = ?auto_129160 ?auto_129161 ) ) ( not ( = ?auto_129160 ?auto_129162 ) ) ( not ( = ?auto_129160 ?auto_129163 ) ) ( not ( = ?auto_129160 ?auto_129164 ) ) ( not ( = ?auto_129160 ?auto_129165 ) ) ( not ( = ?auto_129160 ?auto_129166 ) ) ( not ( = ?auto_129160 ?auto_129167 ) ) ( not ( = ?auto_129161 ?auto_129162 ) ) ( not ( = ?auto_129161 ?auto_129163 ) ) ( not ( = ?auto_129161 ?auto_129164 ) ) ( not ( = ?auto_129161 ?auto_129165 ) ) ( not ( = ?auto_129161 ?auto_129166 ) ) ( not ( = ?auto_129161 ?auto_129167 ) ) ( not ( = ?auto_129162 ?auto_129163 ) ) ( not ( = ?auto_129162 ?auto_129164 ) ) ( not ( = ?auto_129162 ?auto_129165 ) ) ( not ( = ?auto_129162 ?auto_129166 ) ) ( not ( = ?auto_129162 ?auto_129167 ) ) ( not ( = ?auto_129163 ?auto_129164 ) ) ( not ( = ?auto_129163 ?auto_129165 ) ) ( not ( = ?auto_129163 ?auto_129166 ) ) ( not ( = ?auto_129163 ?auto_129167 ) ) ( not ( = ?auto_129164 ?auto_129165 ) ) ( not ( = ?auto_129164 ?auto_129166 ) ) ( not ( = ?auto_129164 ?auto_129167 ) ) ( not ( = ?auto_129165 ?auto_129166 ) ) ( not ( = ?auto_129165 ?auto_129167 ) ) ( not ( = ?auto_129166 ?auto_129167 ) ) ( ON ?auto_129167 ?auto_129168 ) ( CLEAR ?auto_129167 ) ( not ( = ?auto_129160 ?auto_129168 ) ) ( not ( = ?auto_129161 ?auto_129168 ) ) ( not ( = ?auto_129162 ?auto_129168 ) ) ( not ( = ?auto_129163 ?auto_129168 ) ) ( not ( = ?auto_129164 ?auto_129168 ) ) ( not ( = ?auto_129165 ?auto_129168 ) ) ( not ( = ?auto_129166 ?auto_129168 ) ) ( not ( = ?auto_129167 ?auto_129168 ) ) ( HOLDING ?auto_129166 ) ( CLEAR ?auto_129165 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129160 ?auto_129161 ?auto_129162 ?auto_129163 ?auto_129164 ?auto_129165 ?auto_129166 )
      ( MAKE-8PILE ?auto_129160 ?auto_129161 ?auto_129162 ?auto_129163 ?auto_129164 ?auto_129165 ?auto_129166 ?auto_129167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129169 - BLOCK
      ?auto_129170 - BLOCK
      ?auto_129171 - BLOCK
      ?auto_129172 - BLOCK
      ?auto_129173 - BLOCK
      ?auto_129174 - BLOCK
      ?auto_129175 - BLOCK
      ?auto_129176 - BLOCK
    )
    :vars
    (
      ?auto_129177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129169 ) ( ON ?auto_129170 ?auto_129169 ) ( ON ?auto_129171 ?auto_129170 ) ( ON ?auto_129172 ?auto_129171 ) ( ON ?auto_129173 ?auto_129172 ) ( ON ?auto_129174 ?auto_129173 ) ( not ( = ?auto_129169 ?auto_129170 ) ) ( not ( = ?auto_129169 ?auto_129171 ) ) ( not ( = ?auto_129169 ?auto_129172 ) ) ( not ( = ?auto_129169 ?auto_129173 ) ) ( not ( = ?auto_129169 ?auto_129174 ) ) ( not ( = ?auto_129169 ?auto_129175 ) ) ( not ( = ?auto_129169 ?auto_129176 ) ) ( not ( = ?auto_129170 ?auto_129171 ) ) ( not ( = ?auto_129170 ?auto_129172 ) ) ( not ( = ?auto_129170 ?auto_129173 ) ) ( not ( = ?auto_129170 ?auto_129174 ) ) ( not ( = ?auto_129170 ?auto_129175 ) ) ( not ( = ?auto_129170 ?auto_129176 ) ) ( not ( = ?auto_129171 ?auto_129172 ) ) ( not ( = ?auto_129171 ?auto_129173 ) ) ( not ( = ?auto_129171 ?auto_129174 ) ) ( not ( = ?auto_129171 ?auto_129175 ) ) ( not ( = ?auto_129171 ?auto_129176 ) ) ( not ( = ?auto_129172 ?auto_129173 ) ) ( not ( = ?auto_129172 ?auto_129174 ) ) ( not ( = ?auto_129172 ?auto_129175 ) ) ( not ( = ?auto_129172 ?auto_129176 ) ) ( not ( = ?auto_129173 ?auto_129174 ) ) ( not ( = ?auto_129173 ?auto_129175 ) ) ( not ( = ?auto_129173 ?auto_129176 ) ) ( not ( = ?auto_129174 ?auto_129175 ) ) ( not ( = ?auto_129174 ?auto_129176 ) ) ( not ( = ?auto_129175 ?auto_129176 ) ) ( ON ?auto_129176 ?auto_129177 ) ( not ( = ?auto_129169 ?auto_129177 ) ) ( not ( = ?auto_129170 ?auto_129177 ) ) ( not ( = ?auto_129171 ?auto_129177 ) ) ( not ( = ?auto_129172 ?auto_129177 ) ) ( not ( = ?auto_129173 ?auto_129177 ) ) ( not ( = ?auto_129174 ?auto_129177 ) ) ( not ( = ?auto_129175 ?auto_129177 ) ) ( not ( = ?auto_129176 ?auto_129177 ) ) ( CLEAR ?auto_129174 ) ( ON ?auto_129175 ?auto_129176 ) ( CLEAR ?auto_129175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129177 ?auto_129176 )
      ( MAKE-8PILE ?auto_129169 ?auto_129170 ?auto_129171 ?auto_129172 ?auto_129173 ?auto_129174 ?auto_129175 ?auto_129176 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129178 - BLOCK
      ?auto_129179 - BLOCK
      ?auto_129180 - BLOCK
      ?auto_129181 - BLOCK
      ?auto_129182 - BLOCK
      ?auto_129183 - BLOCK
      ?auto_129184 - BLOCK
      ?auto_129185 - BLOCK
    )
    :vars
    (
      ?auto_129186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129178 ) ( ON ?auto_129179 ?auto_129178 ) ( ON ?auto_129180 ?auto_129179 ) ( ON ?auto_129181 ?auto_129180 ) ( ON ?auto_129182 ?auto_129181 ) ( not ( = ?auto_129178 ?auto_129179 ) ) ( not ( = ?auto_129178 ?auto_129180 ) ) ( not ( = ?auto_129178 ?auto_129181 ) ) ( not ( = ?auto_129178 ?auto_129182 ) ) ( not ( = ?auto_129178 ?auto_129183 ) ) ( not ( = ?auto_129178 ?auto_129184 ) ) ( not ( = ?auto_129178 ?auto_129185 ) ) ( not ( = ?auto_129179 ?auto_129180 ) ) ( not ( = ?auto_129179 ?auto_129181 ) ) ( not ( = ?auto_129179 ?auto_129182 ) ) ( not ( = ?auto_129179 ?auto_129183 ) ) ( not ( = ?auto_129179 ?auto_129184 ) ) ( not ( = ?auto_129179 ?auto_129185 ) ) ( not ( = ?auto_129180 ?auto_129181 ) ) ( not ( = ?auto_129180 ?auto_129182 ) ) ( not ( = ?auto_129180 ?auto_129183 ) ) ( not ( = ?auto_129180 ?auto_129184 ) ) ( not ( = ?auto_129180 ?auto_129185 ) ) ( not ( = ?auto_129181 ?auto_129182 ) ) ( not ( = ?auto_129181 ?auto_129183 ) ) ( not ( = ?auto_129181 ?auto_129184 ) ) ( not ( = ?auto_129181 ?auto_129185 ) ) ( not ( = ?auto_129182 ?auto_129183 ) ) ( not ( = ?auto_129182 ?auto_129184 ) ) ( not ( = ?auto_129182 ?auto_129185 ) ) ( not ( = ?auto_129183 ?auto_129184 ) ) ( not ( = ?auto_129183 ?auto_129185 ) ) ( not ( = ?auto_129184 ?auto_129185 ) ) ( ON ?auto_129185 ?auto_129186 ) ( not ( = ?auto_129178 ?auto_129186 ) ) ( not ( = ?auto_129179 ?auto_129186 ) ) ( not ( = ?auto_129180 ?auto_129186 ) ) ( not ( = ?auto_129181 ?auto_129186 ) ) ( not ( = ?auto_129182 ?auto_129186 ) ) ( not ( = ?auto_129183 ?auto_129186 ) ) ( not ( = ?auto_129184 ?auto_129186 ) ) ( not ( = ?auto_129185 ?auto_129186 ) ) ( ON ?auto_129184 ?auto_129185 ) ( CLEAR ?auto_129184 ) ( ON-TABLE ?auto_129186 ) ( HOLDING ?auto_129183 ) ( CLEAR ?auto_129182 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129178 ?auto_129179 ?auto_129180 ?auto_129181 ?auto_129182 ?auto_129183 )
      ( MAKE-8PILE ?auto_129178 ?auto_129179 ?auto_129180 ?auto_129181 ?auto_129182 ?auto_129183 ?auto_129184 ?auto_129185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129187 - BLOCK
      ?auto_129188 - BLOCK
      ?auto_129189 - BLOCK
      ?auto_129190 - BLOCK
      ?auto_129191 - BLOCK
      ?auto_129192 - BLOCK
      ?auto_129193 - BLOCK
      ?auto_129194 - BLOCK
    )
    :vars
    (
      ?auto_129195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129187 ) ( ON ?auto_129188 ?auto_129187 ) ( ON ?auto_129189 ?auto_129188 ) ( ON ?auto_129190 ?auto_129189 ) ( ON ?auto_129191 ?auto_129190 ) ( not ( = ?auto_129187 ?auto_129188 ) ) ( not ( = ?auto_129187 ?auto_129189 ) ) ( not ( = ?auto_129187 ?auto_129190 ) ) ( not ( = ?auto_129187 ?auto_129191 ) ) ( not ( = ?auto_129187 ?auto_129192 ) ) ( not ( = ?auto_129187 ?auto_129193 ) ) ( not ( = ?auto_129187 ?auto_129194 ) ) ( not ( = ?auto_129188 ?auto_129189 ) ) ( not ( = ?auto_129188 ?auto_129190 ) ) ( not ( = ?auto_129188 ?auto_129191 ) ) ( not ( = ?auto_129188 ?auto_129192 ) ) ( not ( = ?auto_129188 ?auto_129193 ) ) ( not ( = ?auto_129188 ?auto_129194 ) ) ( not ( = ?auto_129189 ?auto_129190 ) ) ( not ( = ?auto_129189 ?auto_129191 ) ) ( not ( = ?auto_129189 ?auto_129192 ) ) ( not ( = ?auto_129189 ?auto_129193 ) ) ( not ( = ?auto_129189 ?auto_129194 ) ) ( not ( = ?auto_129190 ?auto_129191 ) ) ( not ( = ?auto_129190 ?auto_129192 ) ) ( not ( = ?auto_129190 ?auto_129193 ) ) ( not ( = ?auto_129190 ?auto_129194 ) ) ( not ( = ?auto_129191 ?auto_129192 ) ) ( not ( = ?auto_129191 ?auto_129193 ) ) ( not ( = ?auto_129191 ?auto_129194 ) ) ( not ( = ?auto_129192 ?auto_129193 ) ) ( not ( = ?auto_129192 ?auto_129194 ) ) ( not ( = ?auto_129193 ?auto_129194 ) ) ( ON ?auto_129194 ?auto_129195 ) ( not ( = ?auto_129187 ?auto_129195 ) ) ( not ( = ?auto_129188 ?auto_129195 ) ) ( not ( = ?auto_129189 ?auto_129195 ) ) ( not ( = ?auto_129190 ?auto_129195 ) ) ( not ( = ?auto_129191 ?auto_129195 ) ) ( not ( = ?auto_129192 ?auto_129195 ) ) ( not ( = ?auto_129193 ?auto_129195 ) ) ( not ( = ?auto_129194 ?auto_129195 ) ) ( ON ?auto_129193 ?auto_129194 ) ( ON-TABLE ?auto_129195 ) ( CLEAR ?auto_129191 ) ( ON ?auto_129192 ?auto_129193 ) ( CLEAR ?auto_129192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129195 ?auto_129194 ?auto_129193 )
      ( MAKE-8PILE ?auto_129187 ?auto_129188 ?auto_129189 ?auto_129190 ?auto_129191 ?auto_129192 ?auto_129193 ?auto_129194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129196 - BLOCK
      ?auto_129197 - BLOCK
      ?auto_129198 - BLOCK
      ?auto_129199 - BLOCK
      ?auto_129200 - BLOCK
      ?auto_129201 - BLOCK
      ?auto_129202 - BLOCK
      ?auto_129203 - BLOCK
    )
    :vars
    (
      ?auto_129204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129196 ) ( ON ?auto_129197 ?auto_129196 ) ( ON ?auto_129198 ?auto_129197 ) ( ON ?auto_129199 ?auto_129198 ) ( not ( = ?auto_129196 ?auto_129197 ) ) ( not ( = ?auto_129196 ?auto_129198 ) ) ( not ( = ?auto_129196 ?auto_129199 ) ) ( not ( = ?auto_129196 ?auto_129200 ) ) ( not ( = ?auto_129196 ?auto_129201 ) ) ( not ( = ?auto_129196 ?auto_129202 ) ) ( not ( = ?auto_129196 ?auto_129203 ) ) ( not ( = ?auto_129197 ?auto_129198 ) ) ( not ( = ?auto_129197 ?auto_129199 ) ) ( not ( = ?auto_129197 ?auto_129200 ) ) ( not ( = ?auto_129197 ?auto_129201 ) ) ( not ( = ?auto_129197 ?auto_129202 ) ) ( not ( = ?auto_129197 ?auto_129203 ) ) ( not ( = ?auto_129198 ?auto_129199 ) ) ( not ( = ?auto_129198 ?auto_129200 ) ) ( not ( = ?auto_129198 ?auto_129201 ) ) ( not ( = ?auto_129198 ?auto_129202 ) ) ( not ( = ?auto_129198 ?auto_129203 ) ) ( not ( = ?auto_129199 ?auto_129200 ) ) ( not ( = ?auto_129199 ?auto_129201 ) ) ( not ( = ?auto_129199 ?auto_129202 ) ) ( not ( = ?auto_129199 ?auto_129203 ) ) ( not ( = ?auto_129200 ?auto_129201 ) ) ( not ( = ?auto_129200 ?auto_129202 ) ) ( not ( = ?auto_129200 ?auto_129203 ) ) ( not ( = ?auto_129201 ?auto_129202 ) ) ( not ( = ?auto_129201 ?auto_129203 ) ) ( not ( = ?auto_129202 ?auto_129203 ) ) ( ON ?auto_129203 ?auto_129204 ) ( not ( = ?auto_129196 ?auto_129204 ) ) ( not ( = ?auto_129197 ?auto_129204 ) ) ( not ( = ?auto_129198 ?auto_129204 ) ) ( not ( = ?auto_129199 ?auto_129204 ) ) ( not ( = ?auto_129200 ?auto_129204 ) ) ( not ( = ?auto_129201 ?auto_129204 ) ) ( not ( = ?auto_129202 ?auto_129204 ) ) ( not ( = ?auto_129203 ?auto_129204 ) ) ( ON ?auto_129202 ?auto_129203 ) ( ON-TABLE ?auto_129204 ) ( ON ?auto_129201 ?auto_129202 ) ( CLEAR ?auto_129201 ) ( HOLDING ?auto_129200 ) ( CLEAR ?auto_129199 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129196 ?auto_129197 ?auto_129198 ?auto_129199 ?auto_129200 )
      ( MAKE-8PILE ?auto_129196 ?auto_129197 ?auto_129198 ?auto_129199 ?auto_129200 ?auto_129201 ?auto_129202 ?auto_129203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129205 - BLOCK
      ?auto_129206 - BLOCK
      ?auto_129207 - BLOCK
      ?auto_129208 - BLOCK
      ?auto_129209 - BLOCK
      ?auto_129210 - BLOCK
      ?auto_129211 - BLOCK
      ?auto_129212 - BLOCK
    )
    :vars
    (
      ?auto_129213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129205 ) ( ON ?auto_129206 ?auto_129205 ) ( ON ?auto_129207 ?auto_129206 ) ( ON ?auto_129208 ?auto_129207 ) ( not ( = ?auto_129205 ?auto_129206 ) ) ( not ( = ?auto_129205 ?auto_129207 ) ) ( not ( = ?auto_129205 ?auto_129208 ) ) ( not ( = ?auto_129205 ?auto_129209 ) ) ( not ( = ?auto_129205 ?auto_129210 ) ) ( not ( = ?auto_129205 ?auto_129211 ) ) ( not ( = ?auto_129205 ?auto_129212 ) ) ( not ( = ?auto_129206 ?auto_129207 ) ) ( not ( = ?auto_129206 ?auto_129208 ) ) ( not ( = ?auto_129206 ?auto_129209 ) ) ( not ( = ?auto_129206 ?auto_129210 ) ) ( not ( = ?auto_129206 ?auto_129211 ) ) ( not ( = ?auto_129206 ?auto_129212 ) ) ( not ( = ?auto_129207 ?auto_129208 ) ) ( not ( = ?auto_129207 ?auto_129209 ) ) ( not ( = ?auto_129207 ?auto_129210 ) ) ( not ( = ?auto_129207 ?auto_129211 ) ) ( not ( = ?auto_129207 ?auto_129212 ) ) ( not ( = ?auto_129208 ?auto_129209 ) ) ( not ( = ?auto_129208 ?auto_129210 ) ) ( not ( = ?auto_129208 ?auto_129211 ) ) ( not ( = ?auto_129208 ?auto_129212 ) ) ( not ( = ?auto_129209 ?auto_129210 ) ) ( not ( = ?auto_129209 ?auto_129211 ) ) ( not ( = ?auto_129209 ?auto_129212 ) ) ( not ( = ?auto_129210 ?auto_129211 ) ) ( not ( = ?auto_129210 ?auto_129212 ) ) ( not ( = ?auto_129211 ?auto_129212 ) ) ( ON ?auto_129212 ?auto_129213 ) ( not ( = ?auto_129205 ?auto_129213 ) ) ( not ( = ?auto_129206 ?auto_129213 ) ) ( not ( = ?auto_129207 ?auto_129213 ) ) ( not ( = ?auto_129208 ?auto_129213 ) ) ( not ( = ?auto_129209 ?auto_129213 ) ) ( not ( = ?auto_129210 ?auto_129213 ) ) ( not ( = ?auto_129211 ?auto_129213 ) ) ( not ( = ?auto_129212 ?auto_129213 ) ) ( ON ?auto_129211 ?auto_129212 ) ( ON-TABLE ?auto_129213 ) ( ON ?auto_129210 ?auto_129211 ) ( CLEAR ?auto_129208 ) ( ON ?auto_129209 ?auto_129210 ) ( CLEAR ?auto_129209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129213 ?auto_129212 ?auto_129211 ?auto_129210 )
      ( MAKE-8PILE ?auto_129205 ?auto_129206 ?auto_129207 ?auto_129208 ?auto_129209 ?auto_129210 ?auto_129211 ?auto_129212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129214 - BLOCK
      ?auto_129215 - BLOCK
      ?auto_129216 - BLOCK
      ?auto_129217 - BLOCK
      ?auto_129218 - BLOCK
      ?auto_129219 - BLOCK
      ?auto_129220 - BLOCK
      ?auto_129221 - BLOCK
    )
    :vars
    (
      ?auto_129222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129214 ) ( ON ?auto_129215 ?auto_129214 ) ( ON ?auto_129216 ?auto_129215 ) ( not ( = ?auto_129214 ?auto_129215 ) ) ( not ( = ?auto_129214 ?auto_129216 ) ) ( not ( = ?auto_129214 ?auto_129217 ) ) ( not ( = ?auto_129214 ?auto_129218 ) ) ( not ( = ?auto_129214 ?auto_129219 ) ) ( not ( = ?auto_129214 ?auto_129220 ) ) ( not ( = ?auto_129214 ?auto_129221 ) ) ( not ( = ?auto_129215 ?auto_129216 ) ) ( not ( = ?auto_129215 ?auto_129217 ) ) ( not ( = ?auto_129215 ?auto_129218 ) ) ( not ( = ?auto_129215 ?auto_129219 ) ) ( not ( = ?auto_129215 ?auto_129220 ) ) ( not ( = ?auto_129215 ?auto_129221 ) ) ( not ( = ?auto_129216 ?auto_129217 ) ) ( not ( = ?auto_129216 ?auto_129218 ) ) ( not ( = ?auto_129216 ?auto_129219 ) ) ( not ( = ?auto_129216 ?auto_129220 ) ) ( not ( = ?auto_129216 ?auto_129221 ) ) ( not ( = ?auto_129217 ?auto_129218 ) ) ( not ( = ?auto_129217 ?auto_129219 ) ) ( not ( = ?auto_129217 ?auto_129220 ) ) ( not ( = ?auto_129217 ?auto_129221 ) ) ( not ( = ?auto_129218 ?auto_129219 ) ) ( not ( = ?auto_129218 ?auto_129220 ) ) ( not ( = ?auto_129218 ?auto_129221 ) ) ( not ( = ?auto_129219 ?auto_129220 ) ) ( not ( = ?auto_129219 ?auto_129221 ) ) ( not ( = ?auto_129220 ?auto_129221 ) ) ( ON ?auto_129221 ?auto_129222 ) ( not ( = ?auto_129214 ?auto_129222 ) ) ( not ( = ?auto_129215 ?auto_129222 ) ) ( not ( = ?auto_129216 ?auto_129222 ) ) ( not ( = ?auto_129217 ?auto_129222 ) ) ( not ( = ?auto_129218 ?auto_129222 ) ) ( not ( = ?auto_129219 ?auto_129222 ) ) ( not ( = ?auto_129220 ?auto_129222 ) ) ( not ( = ?auto_129221 ?auto_129222 ) ) ( ON ?auto_129220 ?auto_129221 ) ( ON-TABLE ?auto_129222 ) ( ON ?auto_129219 ?auto_129220 ) ( ON ?auto_129218 ?auto_129219 ) ( CLEAR ?auto_129218 ) ( HOLDING ?auto_129217 ) ( CLEAR ?auto_129216 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129214 ?auto_129215 ?auto_129216 ?auto_129217 )
      ( MAKE-8PILE ?auto_129214 ?auto_129215 ?auto_129216 ?auto_129217 ?auto_129218 ?auto_129219 ?auto_129220 ?auto_129221 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129223 - BLOCK
      ?auto_129224 - BLOCK
      ?auto_129225 - BLOCK
      ?auto_129226 - BLOCK
      ?auto_129227 - BLOCK
      ?auto_129228 - BLOCK
      ?auto_129229 - BLOCK
      ?auto_129230 - BLOCK
    )
    :vars
    (
      ?auto_129231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129223 ) ( ON ?auto_129224 ?auto_129223 ) ( ON ?auto_129225 ?auto_129224 ) ( not ( = ?auto_129223 ?auto_129224 ) ) ( not ( = ?auto_129223 ?auto_129225 ) ) ( not ( = ?auto_129223 ?auto_129226 ) ) ( not ( = ?auto_129223 ?auto_129227 ) ) ( not ( = ?auto_129223 ?auto_129228 ) ) ( not ( = ?auto_129223 ?auto_129229 ) ) ( not ( = ?auto_129223 ?auto_129230 ) ) ( not ( = ?auto_129224 ?auto_129225 ) ) ( not ( = ?auto_129224 ?auto_129226 ) ) ( not ( = ?auto_129224 ?auto_129227 ) ) ( not ( = ?auto_129224 ?auto_129228 ) ) ( not ( = ?auto_129224 ?auto_129229 ) ) ( not ( = ?auto_129224 ?auto_129230 ) ) ( not ( = ?auto_129225 ?auto_129226 ) ) ( not ( = ?auto_129225 ?auto_129227 ) ) ( not ( = ?auto_129225 ?auto_129228 ) ) ( not ( = ?auto_129225 ?auto_129229 ) ) ( not ( = ?auto_129225 ?auto_129230 ) ) ( not ( = ?auto_129226 ?auto_129227 ) ) ( not ( = ?auto_129226 ?auto_129228 ) ) ( not ( = ?auto_129226 ?auto_129229 ) ) ( not ( = ?auto_129226 ?auto_129230 ) ) ( not ( = ?auto_129227 ?auto_129228 ) ) ( not ( = ?auto_129227 ?auto_129229 ) ) ( not ( = ?auto_129227 ?auto_129230 ) ) ( not ( = ?auto_129228 ?auto_129229 ) ) ( not ( = ?auto_129228 ?auto_129230 ) ) ( not ( = ?auto_129229 ?auto_129230 ) ) ( ON ?auto_129230 ?auto_129231 ) ( not ( = ?auto_129223 ?auto_129231 ) ) ( not ( = ?auto_129224 ?auto_129231 ) ) ( not ( = ?auto_129225 ?auto_129231 ) ) ( not ( = ?auto_129226 ?auto_129231 ) ) ( not ( = ?auto_129227 ?auto_129231 ) ) ( not ( = ?auto_129228 ?auto_129231 ) ) ( not ( = ?auto_129229 ?auto_129231 ) ) ( not ( = ?auto_129230 ?auto_129231 ) ) ( ON ?auto_129229 ?auto_129230 ) ( ON-TABLE ?auto_129231 ) ( ON ?auto_129228 ?auto_129229 ) ( ON ?auto_129227 ?auto_129228 ) ( CLEAR ?auto_129225 ) ( ON ?auto_129226 ?auto_129227 ) ( CLEAR ?auto_129226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129231 ?auto_129230 ?auto_129229 ?auto_129228 ?auto_129227 )
      ( MAKE-8PILE ?auto_129223 ?auto_129224 ?auto_129225 ?auto_129226 ?auto_129227 ?auto_129228 ?auto_129229 ?auto_129230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129232 - BLOCK
      ?auto_129233 - BLOCK
      ?auto_129234 - BLOCK
      ?auto_129235 - BLOCK
      ?auto_129236 - BLOCK
      ?auto_129237 - BLOCK
      ?auto_129238 - BLOCK
      ?auto_129239 - BLOCK
    )
    :vars
    (
      ?auto_129240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129232 ) ( ON ?auto_129233 ?auto_129232 ) ( not ( = ?auto_129232 ?auto_129233 ) ) ( not ( = ?auto_129232 ?auto_129234 ) ) ( not ( = ?auto_129232 ?auto_129235 ) ) ( not ( = ?auto_129232 ?auto_129236 ) ) ( not ( = ?auto_129232 ?auto_129237 ) ) ( not ( = ?auto_129232 ?auto_129238 ) ) ( not ( = ?auto_129232 ?auto_129239 ) ) ( not ( = ?auto_129233 ?auto_129234 ) ) ( not ( = ?auto_129233 ?auto_129235 ) ) ( not ( = ?auto_129233 ?auto_129236 ) ) ( not ( = ?auto_129233 ?auto_129237 ) ) ( not ( = ?auto_129233 ?auto_129238 ) ) ( not ( = ?auto_129233 ?auto_129239 ) ) ( not ( = ?auto_129234 ?auto_129235 ) ) ( not ( = ?auto_129234 ?auto_129236 ) ) ( not ( = ?auto_129234 ?auto_129237 ) ) ( not ( = ?auto_129234 ?auto_129238 ) ) ( not ( = ?auto_129234 ?auto_129239 ) ) ( not ( = ?auto_129235 ?auto_129236 ) ) ( not ( = ?auto_129235 ?auto_129237 ) ) ( not ( = ?auto_129235 ?auto_129238 ) ) ( not ( = ?auto_129235 ?auto_129239 ) ) ( not ( = ?auto_129236 ?auto_129237 ) ) ( not ( = ?auto_129236 ?auto_129238 ) ) ( not ( = ?auto_129236 ?auto_129239 ) ) ( not ( = ?auto_129237 ?auto_129238 ) ) ( not ( = ?auto_129237 ?auto_129239 ) ) ( not ( = ?auto_129238 ?auto_129239 ) ) ( ON ?auto_129239 ?auto_129240 ) ( not ( = ?auto_129232 ?auto_129240 ) ) ( not ( = ?auto_129233 ?auto_129240 ) ) ( not ( = ?auto_129234 ?auto_129240 ) ) ( not ( = ?auto_129235 ?auto_129240 ) ) ( not ( = ?auto_129236 ?auto_129240 ) ) ( not ( = ?auto_129237 ?auto_129240 ) ) ( not ( = ?auto_129238 ?auto_129240 ) ) ( not ( = ?auto_129239 ?auto_129240 ) ) ( ON ?auto_129238 ?auto_129239 ) ( ON-TABLE ?auto_129240 ) ( ON ?auto_129237 ?auto_129238 ) ( ON ?auto_129236 ?auto_129237 ) ( ON ?auto_129235 ?auto_129236 ) ( CLEAR ?auto_129235 ) ( HOLDING ?auto_129234 ) ( CLEAR ?auto_129233 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129232 ?auto_129233 ?auto_129234 )
      ( MAKE-8PILE ?auto_129232 ?auto_129233 ?auto_129234 ?auto_129235 ?auto_129236 ?auto_129237 ?auto_129238 ?auto_129239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129241 - BLOCK
      ?auto_129242 - BLOCK
      ?auto_129243 - BLOCK
      ?auto_129244 - BLOCK
      ?auto_129245 - BLOCK
      ?auto_129246 - BLOCK
      ?auto_129247 - BLOCK
      ?auto_129248 - BLOCK
    )
    :vars
    (
      ?auto_129249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129241 ) ( ON ?auto_129242 ?auto_129241 ) ( not ( = ?auto_129241 ?auto_129242 ) ) ( not ( = ?auto_129241 ?auto_129243 ) ) ( not ( = ?auto_129241 ?auto_129244 ) ) ( not ( = ?auto_129241 ?auto_129245 ) ) ( not ( = ?auto_129241 ?auto_129246 ) ) ( not ( = ?auto_129241 ?auto_129247 ) ) ( not ( = ?auto_129241 ?auto_129248 ) ) ( not ( = ?auto_129242 ?auto_129243 ) ) ( not ( = ?auto_129242 ?auto_129244 ) ) ( not ( = ?auto_129242 ?auto_129245 ) ) ( not ( = ?auto_129242 ?auto_129246 ) ) ( not ( = ?auto_129242 ?auto_129247 ) ) ( not ( = ?auto_129242 ?auto_129248 ) ) ( not ( = ?auto_129243 ?auto_129244 ) ) ( not ( = ?auto_129243 ?auto_129245 ) ) ( not ( = ?auto_129243 ?auto_129246 ) ) ( not ( = ?auto_129243 ?auto_129247 ) ) ( not ( = ?auto_129243 ?auto_129248 ) ) ( not ( = ?auto_129244 ?auto_129245 ) ) ( not ( = ?auto_129244 ?auto_129246 ) ) ( not ( = ?auto_129244 ?auto_129247 ) ) ( not ( = ?auto_129244 ?auto_129248 ) ) ( not ( = ?auto_129245 ?auto_129246 ) ) ( not ( = ?auto_129245 ?auto_129247 ) ) ( not ( = ?auto_129245 ?auto_129248 ) ) ( not ( = ?auto_129246 ?auto_129247 ) ) ( not ( = ?auto_129246 ?auto_129248 ) ) ( not ( = ?auto_129247 ?auto_129248 ) ) ( ON ?auto_129248 ?auto_129249 ) ( not ( = ?auto_129241 ?auto_129249 ) ) ( not ( = ?auto_129242 ?auto_129249 ) ) ( not ( = ?auto_129243 ?auto_129249 ) ) ( not ( = ?auto_129244 ?auto_129249 ) ) ( not ( = ?auto_129245 ?auto_129249 ) ) ( not ( = ?auto_129246 ?auto_129249 ) ) ( not ( = ?auto_129247 ?auto_129249 ) ) ( not ( = ?auto_129248 ?auto_129249 ) ) ( ON ?auto_129247 ?auto_129248 ) ( ON-TABLE ?auto_129249 ) ( ON ?auto_129246 ?auto_129247 ) ( ON ?auto_129245 ?auto_129246 ) ( ON ?auto_129244 ?auto_129245 ) ( CLEAR ?auto_129242 ) ( ON ?auto_129243 ?auto_129244 ) ( CLEAR ?auto_129243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129249 ?auto_129248 ?auto_129247 ?auto_129246 ?auto_129245 ?auto_129244 )
      ( MAKE-8PILE ?auto_129241 ?auto_129242 ?auto_129243 ?auto_129244 ?auto_129245 ?auto_129246 ?auto_129247 ?auto_129248 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129250 - BLOCK
      ?auto_129251 - BLOCK
      ?auto_129252 - BLOCK
      ?auto_129253 - BLOCK
      ?auto_129254 - BLOCK
      ?auto_129255 - BLOCK
      ?auto_129256 - BLOCK
      ?auto_129257 - BLOCK
    )
    :vars
    (
      ?auto_129258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129250 ) ( not ( = ?auto_129250 ?auto_129251 ) ) ( not ( = ?auto_129250 ?auto_129252 ) ) ( not ( = ?auto_129250 ?auto_129253 ) ) ( not ( = ?auto_129250 ?auto_129254 ) ) ( not ( = ?auto_129250 ?auto_129255 ) ) ( not ( = ?auto_129250 ?auto_129256 ) ) ( not ( = ?auto_129250 ?auto_129257 ) ) ( not ( = ?auto_129251 ?auto_129252 ) ) ( not ( = ?auto_129251 ?auto_129253 ) ) ( not ( = ?auto_129251 ?auto_129254 ) ) ( not ( = ?auto_129251 ?auto_129255 ) ) ( not ( = ?auto_129251 ?auto_129256 ) ) ( not ( = ?auto_129251 ?auto_129257 ) ) ( not ( = ?auto_129252 ?auto_129253 ) ) ( not ( = ?auto_129252 ?auto_129254 ) ) ( not ( = ?auto_129252 ?auto_129255 ) ) ( not ( = ?auto_129252 ?auto_129256 ) ) ( not ( = ?auto_129252 ?auto_129257 ) ) ( not ( = ?auto_129253 ?auto_129254 ) ) ( not ( = ?auto_129253 ?auto_129255 ) ) ( not ( = ?auto_129253 ?auto_129256 ) ) ( not ( = ?auto_129253 ?auto_129257 ) ) ( not ( = ?auto_129254 ?auto_129255 ) ) ( not ( = ?auto_129254 ?auto_129256 ) ) ( not ( = ?auto_129254 ?auto_129257 ) ) ( not ( = ?auto_129255 ?auto_129256 ) ) ( not ( = ?auto_129255 ?auto_129257 ) ) ( not ( = ?auto_129256 ?auto_129257 ) ) ( ON ?auto_129257 ?auto_129258 ) ( not ( = ?auto_129250 ?auto_129258 ) ) ( not ( = ?auto_129251 ?auto_129258 ) ) ( not ( = ?auto_129252 ?auto_129258 ) ) ( not ( = ?auto_129253 ?auto_129258 ) ) ( not ( = ?auto_129254 ?auto_129258 ) ) ( not ( = ?auto_129255 ?auto_129258 ) ) ( not ( = ?auto_129256 ?auto_129258 ) ) ( not ( = ?auto_129257 ?auto_129258 ) ) ( ON ?auto_129256 ?auto_129257 ) ( ON-TABLE ?auto_129258 ) ( ON ?auto_129255 ?auto_129256 ) ( ON ?auto_129254 ?auto_129255 ) ( ON ?auto_129253 ?auto_129254 ) ( ON ?auto_129252 ?auto_129253 ) ( CLEAR ?auto_129252 ) ( HOLDING ?auto_129251 ) ( CLEAR ?auto_129250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129250 ?auto_129251 )
      ( MAKE-8PILE ?auto_129250 ?auto_129251 ?auto_129252 ?auto_129253 ?auto_129254 ?auto_129255 ?auto_129256 ?auto_129257 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129259 - BLOCK
      ?auto_129260 - BLOCK
      ?auto_129261 - BLOCK
      ?auto_129262 - BLOCK
      ?auto_129263 - BLOCK
      ?auto_129264 - BLOCK
      ?auto_129265 - BLOCK
      ?auto_129266 - BLOCK
    )
    :vars
    (
      ?auto_129267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129259 ) ( not ( = ?auto_129259 ?auto_129260 ) ) ( not ( = ?auto_129259 ?auto_129261 ) ) ( not ( = ?auto_129259 ?auto_129262 ) ) ( not ( = ?auto_129259 ?auto_129263 ) ) ( not ( = ?auto_129259 ?auto_129264 ) ) ( not ( = ?auto_129259 ?auto_129265 ) ) ( not ( = ?auto_129259 ?auto_129266 ) ) ( not ( = ?auto_129260 ?auto_129261 ) ) ( not ( = ?auto_129260 ?auto_129262 ) ) ( not ( = ?auto_129260 ?auto_129263 ) ) ( not ( = ?auto_129260 ?auto_129264 ) ) ( not ( = ?auto_129260 ?auto_129265 ) ) ( not ( = ?auto_129260 ?auto_129266 ) ) ( not ( = ?auto_129261 ?auto_129262 ) ) ( not ( = ?auto_129261 ?auto_129263 ) ) ( not ( = ?auto_129261 ?auto_129264 ) ) ( not ( = ?auto_129261 ?auto_129265 ) ) ( not ( = ?auto_129261 ?auto_129266 ) ) ( not ( = ?auto_129262 ?auto_129263 ) ) ( not ( = ?auto_129262 ?auto_129264 ) ) ( not ( = ?auto_129262 ?auto_129265 ) ) ( not ( = ?auto_129262 ?auto_129266 ) ) ( not ( = ?auto_129263 ?auto_129264 ) ) ( not ( = ?auto_129263 ?auto_129265 ) ) ( not ( = ?auto_129263 ?auto_129266 ) ) ( not ( = ?auto_129264 ?auto_129265 ) ) ( not ( = ?auto_129264 ?auto_129266 ) ) ( not ( = ?auto_129265 ?auto_129266 ) ) ( ON ?auto_129266 ?auto_129267 ) ( not ( = ?auto_129259 ?auto_129267 ) ) ( not ( = ?auto_129260 ?auto_129267 ) ) ( not ( = ?auto_129261 ?auto_129267 ) ) ( not ( = ?auto_129262 ?auto_129267 ) ) ( not ( = ?auto_129263 ?auto_129267 ) ) ( not ( = ?auto_129264 ?auto_129267 ) ) ( not ( = ?auto_129265 ?auto_129267 ) ) ( not ( = ?auto_129266 ?auto_129267 ) ) ( ON ?auto_129265 ?auto_129266 ) ( ON-TABLE ?auto_129267 ) ( ON ?auto_129264 ?auto_129265 ) ( ON ?auto_129263 ?auto_129264 ) ( ON ?auto_129262 ?auto_129263 ) ( ON ?auto_129261 ?auto_129262 ) ( CLEAR ?auto_129259 ) ( ON ?auto_129260 ?auto_129261 ) ( CLEAR ?auto_129260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129267 ?auto_129266 ?auto_129265 ?auto_129264 ?auto_129263 ?auto_129262 ?auto_129261 )
      ( MAKE-8PILE ?auto_129259 ?auto_129260 ?auto_129261 ?auto_129262 ?auto_129263 ?auto_129264 ?auto_129265 ?auto_129266 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129268 - BLOCK
      ?auto_129269 - BLOCK
      ?auto_129270 - BLOCK
      ?auto_129271 - BLOCK
      ?auto_129272 - BLOCK
      ?auto_129273 - BLOCK
      ?auto_129274 - BLOCK
      ?auto_129275 - BLOCK
    )
    :vars
    (
      ?auto_129276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129268 ?auto_129269 ) ) ( not ( = ?auto_129268 ?auto_129270 ) ) ( not ( = ?auto_129268 ?auto_129271 ) ) ( not ( = ?auto_129268 ?auto_129272 ) ) ( not ( = ?auto_129268 ?auto_129273 ) ) ( not ( = ?auto_129268 ?auto_129274 ) ) ( not ( = ?auto_129268 ?auto_129275 ) ) ( not ( = ?auto_129269 ?auto_129270 ) ) ( not ( = ?auto_129269 ?auto_129271 ) ) ( not ( = ?auto_129269 ?auto_129272 ) ) ( not ( = ?auto_129269 ?auto_129273 ) ) ( not ( = ?auto_129269 ?auto_129274 ) ) ( not ( = ?auto_129269 ?auto_129275 ) ) ( not ( = ?auto_129270 ?auto_129271 ) ) ( not ( = ?auto_129270 ?auto_129272 ) ) ( not ( = ?auto_129270 ?auto_129273 ) ) ( not ( = ?auto_129270 ?auto_129274 ) ) ( not ( = ?auto_129270 ?auto_129275 ) ) ( not ( = ?auto_129271 ?auto_129272 ) ) ( not ( = ?auto_129271 ?auto_129273 ) ) ( not ( = ?auto_129271 ?auto_129274 ) ) ( not ( = ?auto_129271 ?auto_129275 ) ) ( not ( = ?auto_129272 ?auto_129273 ) ) ( not ( = ?auto_129272 ?auto_129274 ) ) ( not ( = ?auto_129272 ?auto_129275 ) ) ( not ( = ?auto_129273 ?auto_129274 ) ) ( not ( = ?auto_129273 ?auto_129275 ) ) ( not ( = ?auto_129274 ?auto_129275 ) ) ( ON ?auto_129275 ?auto_129276 ) ( not ( = ?auto_129268 ?auto_129276 ) ) ( not ( = ?auto_129269 ?auto_129276 ) ) ( not ( = ?auto_129270 ?auto_129276 ) ) ( not ( = ?auto_129271 ?auto_129276 ) ) ( not ( = ?auto_129272 ?auto_129276 ) ) ( not ( = ?auto_129273 ?auto_129276 ) ) ( not ( = ?auto_129274 ?auto_129276 ) ) ( not ( = ?auto_129275 ?auto_129276 ) ) ( ON ?auto_129274 ?auto_129275 ) ( ON-TABLE ?auto_129276 ) ( ON ?auto_129273 ?auto_129274 ) ( ON ?auto_129272 ?auto_129273 ) ( ON ?auto_129271 ?auto_129272 ) ( ON ?auto_129270 ?auto_129271 ) ( ON ?auto_129269 ?auto_129270 ) ( CLEAR ?auto_129269 ) ( HOLDING ?auto_129268 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129268 )
      ( MAKE-8PILE ?auto_129268 ?auto_129269 ?auto_129270 ?auto_129271 ?auto_129272 ?auto_129273 ?auto_129274 ?auto_129275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_129277 - BLOCK
      ?auto_129278 - BLOCK
      ?auto_129279 - BLOCK
      ?auto_129280 - BLOCK
      ?auto_129281 - BLOCK
      ?auto_129282 - BLOCK
      ?auto_129283 - BLOCK
      ?auto_129284 - BLOCK
    )
    :vars
    (
      ?auto_129285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129277 ?auto_129278 ) ) ( not ( = ?auto_129277 ?auto_129279 ) ) ( not ( = ?auto_129277 ?auto_129280 ) ) ( not ( = ?auto_129277 ?auto_129281 ) ) ( not ( = ?auto_129277 ?auto_129282 ) ) ( not ( = ?auto_129277 ?auto_129283 ) ) ( not ( = ?auto_129277 ?auto_129284 ) ) ( not ( = ?auto_129278 ?auto_129279 ) ) ( not ( = ?auto_129278 ?auto_129280 ) ) ( not ( = ?auto_129278 ?auto_129281 ) ) ( not ( = ?auto_129278 ?auto_129282 ) ) ( not ( = ?auto_129278 ?auto_129283 ) ) ( not ( = ?auto_129278 ?auto_129284 ) ) ( not ( = ?auto_129279 ?auto_129280 ) ) ( not ( = ?auto_129279 ?auto_129281 ) ) ( not ( = ?auto_129279 ?auto_129282 ) ) ( not ( = ?auto_129279 ?auto_129283 ) ) ( not ( = ?auto_129279 ?auto_129284 ) ) ( not ( = ?auto_129280 ?auto_129281 ) ) ( not ( = ?auto_129280 ?auto_129282 ) ) ( not ( = ?auto_129280 ?auto_129283 ) ) ( not ( = ?auto_129280 ?auto_129284 ) ) ( not ( = ?auto_129281 ?auto_129282 ) ) ( not ( = ?auto_129281 ?auto_129283 ) ) ( not ( = ?auto_129281 ?auto_129284 ) ) ( not ( = ?auto_129282 ?auto_129283 ) ) ( not ( = ?auto_129282 ?auto_129284 ) ) ( not ( = ?auto_129283 ?auto_129284 ) ) ( ON ?auto_129284 ?auto_129285 ) ( not ( = ?auto_129277 ?auto_129285 ) ) ( not ( = ?auto_129278 ?auto_129285 ) ) ( not ( = ?auto_129279 ?auto_129285 ) ) ( not ( = ?auto_129280 ?auto_129285 ) ) ( not ( = ?auto_129281 ?auto_129285 ) ) ( not ( = ?auto_129282 ?auto_129285 ) ) ( not ( = ?auto_129283 ?auto_129285 ) ) ( not ( = ?auto_129284 ?auto_129285 ) ) ( ON ?auto_129283 ?auto_129284 ) ( ON-TABLE ?auto_129285 ) ( ON ?auto_129282 ?auto_129283 ) ( ON ?auto_129281 ?auto_129282 ) ( ON ?auto_129280 ?auto_129281 ) ( ON ?auto_129279 ?auto_129280 ) ( ON ?auto_129278 ?auto_129279 ) ( ON ?auto_129277 ?auto_129278 ) ( CLEAR ?auto_129277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129285 ?auto_129284 ?auto_129283 ?auto_129282 ?auto_129281 ?auto_129280 ?auto_129279 ?auto_129278 )
      ( MAKE-8PILE ?auto_129277 ?auto_129278 ?auto_129279 ?auto_129280 ?auto_129281 ?auto_129282 ?auto_129283 ?auto_129284 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129422 - BLOCK
    )
    :vars
    (
      ?auto_129423 - BLOCK
      ?auto_129424 - BLOCK
      ?auto_129425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129422 ?auto_129423 ) ( CLEAR ?auto_129422 ) ( not ( = ?auto_129422 ?auto_129423 ) ) ( HOLDING ?auto_129424 ) ( CLEAR ?auto_129425 ) ( not ( = ?auto_129422 ?auto_129424 ) ) ( not ( = ?auto_129422 ?auto_129425 ) ) ( not ( = ?auto_129423 ?auto_129424 ) ) ( not ( = ?auto_129423 ?auto_129425 ) ) ( not ( = ?auto_129424 ?auto_129425 ) ) )
    :subtasks
    ( ( !STACK ?auto_129424 ?auto_129425 )
      ( MAKE-1PILE ?auto_129422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129426 - BLOCK
    )
    :vars
    (
      ?auto_129429 - BLOCK
      ?auto_129427 - BLOCK
      ?auto_129428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129426 ?auto_129429 ) ( not ( = ?auto_129426 ?auto_129429 ) ) ( CLEAR ?auto_129427 ) ( not ( = ?auto_129426 ?auto_129428 ) ) ( not ( = ?auto_129426 ?auto_129427 ) ) ( not ( = ?auto_129429 ?auto_129428 ) ) ( not ( = ?auto_129429 ?auto_129427 ) ) ( not ( = ?auto_129428 ?auto_129427 ) ) ( ON ?auto_129428 ?auto_129426 ) ( CLEAR ?auto_129428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129429 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129429 ?auto_129426 )
      ( MAKE-1PILE ?auto_129426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129430 - BLOCK
    )
    :vars
    (
      ?auto_129431 - BLOCK
      ?auto_129432 - BLOCK
      ?auto_129433 - BLOCK
      ?auto_129438 - BLOCK
      ?auto_129436 - BLOCK
      ?auto_129437 - BLOCK
      ?auto_129434 - BLOCK
      ?auto_129435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129430 ?auto_129431 ) ( not ( = ?auto_129430 ?auto_129431 ) ) ( not ( = ?auto_129430 ?auto_129432 ) ) ( not ( = ?auto_129430 ?auto_129433 ) ) ( not ( = ?auto_129431 ?auto_129432 ) ) ( not ( = ?auto_129431 ?auto_129433 ) ) ( not ( = ?auto_129432 ?auto_129433 ) ) ( ON ?auto_129432 ?auto_129430 ) ( CLEAR ?auto_129432 ) ( ON-TABLE ?auto_129431 ) ( HOLDING ?auto_129433 ) ( CLEAR ?auto_129438 ) ( ON-TABLE ?auto_129436 ) ( ON ?auto_129437 ?auto_129436 ) ( ON ?auto_129434 ?auto_129437 ) ( ON ?auto_129435 ?auto_129434 ) ( ON ?auto_129438 ?auto_129435 ) ( not ( = ?auto_129436 ?auto_129437 ) ) ( not ( = ?auto_129436 ?auto_129434 ) ) ( not ( = ?auto_129436 ?auto_129435 ) ) ( not ( = ?auto_129436 ?auto_129438 ) ) ( not ( = ?auto_129436 ?auto_129433 ) ) ( not ( = ?auto_129437 ?auto_129434 ) ) ( not ( = ?auto_129437 ?auto_129435 ) ) ( not ( = ?auto_129437 ?auto_129438 ) ) ( not ( = ?auto_129437 ?auto_129433 ) ) ( not ( = ?auto_129434 ?auto_129435 ) ) ( not ( = ?auto_129434 ?auto_129438 ) ) ( not ( = ?auto_129434 ?auto_129433 ) ) ( not ( = ?auto_129435 ?auto_129438 ) ) ( not ( = ?auto_129435 ?auto_129433 ) ) ( not ( = ?auto_129438 ?auto_129433 ) ) ( not ( = ?auto_129430 ?auto_129438 ) ) ( not ( = ?auto_129430 ?auto_129436 ) ) ( not ( = ?auto_129430 ?auto_129437 ) ) ( not ( = ?auto_129430 ?auto_129434 ) ) ( not ( = ?auto_129430 ?auto_129435 ) ) ( not ( = ?auto_129431 ?auto_129438 ) ) ( not ( = ?auto_129431 ?auto_129436 ) ) ( not ( = ?auto_129431 ?auto_129437 ) ) ( not ( = ?auto_129431 ?auto_129434 ) ) ( not ( = ?auto_129431 ?auto_129435 ) ) ( not ( = ?auto_129432 ?auto_129438 ) ) ( not ( = ?auto_129432 ?auto_129436 ) ) ( not ( = ?auto_129432 ?auto_129437 ) ) ( not ( = ?auto_129432 ?auto_129434 ) ) ( not ( = ?auto_129432 ?auto_129435 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129436 ?auto_129437 ?auto_129434 ?auto_129435 ?auto_129438 ?auto_129433 )
      ( MAKE-1PILE ?auto_129430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129439 - BLOCK
    )
    :vars
    (
      ?auto_129446 - BLOCK
      ?auto_129447 - BLOCK
      ?auto_129443 - BLOCK
      ?auto_129441 - BLOCK
      ?auto_129440 - BLOCK
      ?auto_129445 - BLOCK
      ?auto_129444 - BLOCK
      ?auto_129442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129439 ?auto_129446 ) ( not ( = ?auto_129439 ?auto_129446 ) ) ( not ( = ?auto_129439 ?auto_129447 ) ) ( not ( = ?auto_129439 ?auto_129443 ) ) ( not ( = ?auto_129446 ?auto_129447 ) ) ( not ( = ?auto_129446 ?auto_129443 ) ) ( not ( = ?auto_129447 ?auto_129443 ) ) ( ON ?auto_129447 ?auto_129439 ) ( ON-TABLE ?auto_129446 ) ( CLEAR ?auto_129441 ) ( ON-TABLE ?auto_129440 ) ( ON ?auto_129445 ?auto_129440 ) ( ON ?auto_129444 ?auto_129445 ) ( ON ?auto_129442 ?auto_129444 ) ( ON ?auto_129441 ?auto_129442 ) ( not ( = ?auto_129440 ?auto_129445 ) ) ( not ( = ?auto_129440 ?auto_129444 ) ) ( not ( = ?auto_129440 ?auto_129442 ) ) ( not ( = ?auto_129440 ?auto_129441 ) ) ( not ( = ?auto_129440 ?auto_129443 ) ) ( not ( = ?auto_129445 ?auto_129444 ) ) ( not ( = ?auto_129445 ?auto_129442 ) ) ( not ( = ?auto_129445 ?auto_129441 ) ) ( not ( = ?auto_129445 ?auto_129443 ) ) ( not ( = ?auto_129444 ?auto_129442 ) ) ( not ( = ?auto_129444 ?auto_129441 ) ) ( not ( = ?auto_129444 ?auto_129443 ) ) ( not ( = ?auto_129442 ?auto_129441 ) ) ( not ( = ?auto_129442 ?auto_129443 ) ) ( not ( = ?auto_129441 ?auto_129443 ) ) ( not ( = ?auto_129439 ?auto_129441 ) ) ( not ( = ?auto_129439 ?auto_129440 ) ) ( not ( = ?auto_129439 ?auto_129445 ) ) ( not ( = ?auto_129439 ?auto_129444 ) ) ( not ( = ?auto_129439 ?auto_129442 ) ) ( not ( = ?auto_129446 ?auto_129441 ) ) ( not ( = ?auto_129446 ?auto_129440 ) ) ( not ( = ?auto_129446 ?auto_129445 ) ) ( not ( = ?auto_129446 ?auto_129444 ) ) ( not ( = ?auto_129446 ?auto_129442 ) ) ( not ( = ?auto_129447 ?auto_129441 ) ) ( not ( = ?auto_129447 ?auto_129440 ) ) ( not ( = ?auto_129447 ?auto_129445 ) ) ( not ( = ?auto_129447 ?auto_129444 ) ) ( not ( = ?auto_129447 ?auto_129442 ) ) ( ON ?auto_129443 ?auto_129447 ) ( CLEAR ?auto_129443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129446 ?auto_129439 ?auto_129447 )
      ( MAKE-1PILE ?auto_129439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129448 - BLOCK
    )
    :vars
    (
      ?auto_129451 - BLOCK
      ?auto_129455 - BLOCK
      ?auto_129452 - BLOCK
      ?auto_129450 - BLOCK
      ?auto_129453 - BLOCK
      ?auto_129456 - BLOCK
      ?auto_129454 - BLOCK
      ?auto_129449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129448 ?auto_129451 ) ( not ( = ?auto_129448 ?auto_129451 ) ) ( not ( = ?auto_129448 ?auto_129455 ) ) ( not ( = ?auto_129448 ?auto_129452 ) ) ( not ( = ?auto_129451 ?auto_129455 ) ) ( not ( = ?auto_129451 ?auto_129452 ) ) ( not ( = ?auto_129455 ?auto_129452 ) ) ( ON ?auto_129455 ?auto_129448 ) ( ON-TABLE ?auto_129451 ) ( ON-TABLE ?auto_129450 ) ( ON ?auto_129453 ?auto_129450 ) ( ON ?auto_129456 ?auto_129453 ) ( ON ?auto_129454 ?auto_129456 ) ( not ( = ?auto_129450 ?auto_129453 ) ) ( not ( = ?auto_129450 ?auto_129456 ) ) ( not ( = ?auto_129450 ?auto_129454 ) ) ( not ( = ?auto_129450 ?auto_129449 ) ) ( not ( = ?auto_129450 ?auto_129452 ) ) ( not ( = ?auto_129453 ?auto_129456 ) ) ( not ( = ?auto_129453 ?auto_129454 ) ) ( not ( = ?auto_129453 ?auto_129449 ) ) ( not ( = ?auto_129453 ?auto_129452 ) ) ( not ( = ?auto_129456 ?auto_129454 ) ) ( not ( = ?auto_129456 ?auto_129449 ) ) ( not ( = ?auto_129456 ?auto_129452 ) ) ( not ( = ?auto_129454 ?auto_129449 ) ) ( not ( = ?auto_129454 ?auto_129452 ) ) ( not ( = ?auto_129449 ?auto_129452 ) ) ( not ( = ?auto_129448 ?auto_129449 ) ) ( not ( = ?auto_129448 ?auto_129450 ) ) ( not ( = ?auto_129448 ?auto_129453 ) ) ( not ( = ?auto_129448 ?auto_129456 ) ) ( not ( = ?auto_129448 ?auto_129454 ) ) ( not ( = ?auto_129451 ?auto_129449 ) ) ( not ( = ?auto_129451 ?auto_129450 ) ) ( not ( = ?auto_129451 ?auto_129453 ) ) ( not ( = ?auto_129451 ?auto_129456 ) ) ( not ( = ?auto_129451 ?auto_129454 ) ) ( not ( = ?auto_129455 ?auto_129449 ) ) ( not ( = ?auto_129455 ?auto_129450 ) ) ( not ( = ?auto_129455 ?auto_129453 ) ) ( not ( = ?auto_129455 ?auto_129456 ) ) ( not ( = ?auto_129455 ?auto_129454 ) ) ( ON ?auto_129452 ?auto_129455 ) ( CLEAR ?auto_129452 ) ( HOLDING ?auto_129449 ) ( CLEAR ?auto_129454 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129450 ?auto_129453 ?auto_129456 ?auto_129454 ?auto_129449 )
      ( MAKE-1PILE ?auto_129448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129457 - BLOCK
    )
    :vars
    (
      ?auto_129463 - BLOCK
      ?auto_129461 - BLOCK
      ?auto_129460 - BLOCK
      ?auto_129458 - BLOCK
      ?auto_129462 - BLOCK
      ?auto_129459 - BLOCK
      ?auto_129465 - BLOCK
      ?auto_129464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129457 ?auto_129463 ) ( not ( = ?auto_129457 ?auto_129463 ) ) ( not ( = ?auto_129457 ?auto_129461 ) ) ( not ( = ?auto_129457 ?auto_129460 ) ) ( not ( = ?auto_129463 ?auto_129461 ) ) ( not ( = ?auto_129463 ?auto_129460 ) ) ( not ( = ?auto_129461 ?auto_129460 ) ) ( ON ?auto_129461 ?auto_129457 ) ( ON-TABLE ?auto_129463 ) ( ON-TABLE ?auto_129458 ) ( ON ?auto_129462 ?auto_129458 ) ( ON ?auto_129459 ?auto_129462 ) ( ON ?auto_129465 ?auto_129459 ) ( not ( = ?auto_129458 ?auto_129462 ) ) ( not ( = ?auto_129458 ?auto_129459 ) ) ( not ( = ?auto_129458 ?auto_129465 ) ) ( not ( = ?auto_129458 ?auto_129464 ) ) ( not ( = ?auto_129458 ?auto_129460 ) ) ( not ( = ?auto_129462 ?auto_129459 ) ) ( not ( = ?auto_129462 ?auto_129465 ) ) ( not ( = ?auto_129462 ?auto_129464 ) ) ( not ( = ?auto_129462 ?auto_129460 ) ) ( not ( = ?auto_129459 ?auto_129465 ) ) ( not ( = ?auto_129459 ?auto_129464 ) ) ( not ( = ?auto_129459 ?auto_129460 ) ) ( not ( = ?auto_129465 ?auto_129464 ) ) ( not ( = ?auto_129465 ?auto_129460 ) ) ( not ( = ?auto_129464 ?auto_129460 ) ) ( not ( = ?auto_129457 ?auto_129464 ) ) ( not ( = ?auto_129457 ?auto_129458 ) ) ( not ( = ?auto_129457 ?auto_129462 ) ) ( not ( = ?auto_129457 ?auto_129459 ) ) ( not ( = ?auto_129457 ?auto_129465 ) ) ( not ( = ?auto_129463 ?auto_129464 ) ) ( not ( = ?auto_129463 ?auto_129458 ) ) ( not ( = ?auto_129463 ?auto_129462 ) ) ( not ( = ?auto_129463 ?auto_129459 ) ) ( not ( = ?auto_129463 ?auto_129465 ) ) ( not ( = ?auto_129461 ?auto_129464 ) ) ( not ( = ?auto_129461 ?auto_129458 ) ) ( not ( = ?auto_129461 ?auto_129462 ) ) ( not ( = ?auto_129461 ?auto_129459 ) ) ( not ( = ?auto_129461 ?auto_129465 ) ) ( ON ?auto_129460 ?auto_129461 ) ( CLEAR ?auto_129465 ) ( ON ?auto_129464 ?auto_129460 ) ( CLEAR ?auto_129464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129463 ?auto_129457 ?auto_129461 ?auto_129460 )
      ( MAKE-1PILE ?auto_129457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129466 - BLOCK
    )
    :vars
    (
      ?auto_129470 - BLOCK
      ?auto_129474 - BLOCK
      ?auto_129471 - BLOCK
      ?auto_129467 - BLOCK
      ?auto_129473 - BLOCK
      ?auto_129469 - BLOCK
      ?auto_129468 - BLOCK
      ?auto_129472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129466 ?auto_129470 ) ( not ( = ?auto_129466 ?auto_129470 ) ) ( not ( = ?auto_129466 ?auto_129474 ) ) ( not ( = ?auto_129466 ?auto_129471 ) ) ( not ( = ?auto_129470 ?auto_129474 ) ) ( not ( = ?auto_129470 ?auto_129471 ) ) ( not ( = ?auto_129474 ?auto_129471 ) ) ( ON ?auto_129474 ?auto_129466 ) ( ON-TABLE ?auto_129470 ) ( ON-TABLE ?auto_129467 ) ( ON ?auto_129473 ?auto_129467 ) ( ON ?auto_129469 ?auto_129473 ) ( not ( = ?auto_129467 ?auto_129473 ) ) ( not ( = ?auto_129467 ?auto_129469 ) ) ( not ( = ?auto_129467 ?auto_129468 ) ) ( not ( = ?auto_129467 ?auto_129472 ) ) ( not ( = ?auto_129467 ?auto_129471 ) ) ( not ( = ?auto_129473 ?auto_129469 ) ) ( not ( = ?auto_129473 ?auto_129468 ) ) ( not ( = ?auto_129473 ?auto_129472 ) ) ( not ( = ?auto_129473 ?auto_129471 ) ) ( not ( = ?auto_129469 ?auto_129468 ) ) ( not ( = ?auto_129469 ?auto_129472 ) ) ( not ( = ?auto_129469 ?auto_129471 ) ) ( not ( = ?auto_129468 ?auto_129472 ) ) ( not ( = ?auto_129468 ?auto_129471 ) ) ( not ( = ?auto_129472 ?auto_129471 ) ) ( not ( = ?auto_129466 ?auto_129472 ) ) ( not ( = ?auto_129466 ?auto_129467 ) ) ( not ( = ?auto_129466 ?auto_129473 ) ) ( not ( = ?auto_129466 ?auto_129469 ) ) ( not ( = ?auto_129466 ?auto_129468 ) ) ( not ( = ?auto_129470 ?auto_129472 ) ) ( not ( = ?auto_129470 ?auto_129467 ) ) ( not ( = ?auto_129470 ?auto_129473 ) ) ( not ( = ?auto_129470 ?auto_129469 ) ) ( not ( = ?auto_129470 ?auto_129468 ) ) ( not ( = ?auto_129474 ?auto_129472 ) ) ( not ( = ?auto_129474 ?auto_129467 ) ) ( not ( = ?auto_129474 ?auto_129473 ) ) ( not ( = ?auto_129474 ?auto_129469 ) ) ( not ( = ?auto_129474 ?auto_129468 ) ) ( ON ?auto_129471 ?auto_129474 ) ( ON ?auto_129472 ?auto_129471 ) ( CLEAR ?auto_129472 ) ( HOLDING ?auto_129468 ) ( CLEAR ?auto_129469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129467 ?auto_129473 ?auto_129469 ?auto_129468 )
      ( MAKE-1PILE ?auto_129466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129475 - BLOCK
    )
    :vars
    (
      ?auto_129476 - BLOCK
      ?auto_129479 - BLOCK
      ?auto_129477 - BLOCK
      ?auto_129478 - BLOCK
      ?auto_129481 - BLOCK
      ?auto_129480 - BLOCK
      ?auto_129482 - BLOCK
      ?auto_129483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129475 ?auto_129476 ) ( not ( = ?auto_129475 ?auto_129476 ) ) ( not ( = ?auto_129475 ?auto_129479 ) ) ( not ( = ?auto_129475 ?auto_129477 ) ) ( not ( = ?auto_129476 ?auto_129479 ) ) ( not ( = ?auto_129476 ?auto_129477 ) ) ( not ( = ?auto_129479 ?auto_129477 ) ) ( ON ?auto_129479 ?auto_129475 ) ( ON-TABLE ?auto_129476 ) ( ON-TABLE ?auto_129478 ) ( ON ?auto_129481 ?auto_129478 ) ( ON ?auto_129480 ?auto_129481 ) ( not ( = ?auto_129478 ?auto_129481 ) ) ( not ( = ?auto_129478 ?auto_129480 ) ) ( not ( = ?auto_129478 ?auto_129482 ) ) ( not ( = ?auto_129478 ?auto_129483 ) ) ( not ( = ?auto_129478 ?auto_129477 ) ) ( not ( = ?auto_129481 ?auto_129480 ) ) ( not ( = ?auto_129481 ?auto_129482 ) ) ( not ( = ?auto_129481 ?auto_129483 ) ) ( not ( = ?auto_129481 ?auto_129477 ) ) ( not ( = ?auto_129480 ?auto_129482 ) ) ( not ( = ?auto_129480 ?auto_129483 ) ) ( not ( = ?auto_129480 ?auto_129477 ) ) ( not ( = ?auto_129482 ?auto_129483 ) ) ( not ( = ?auto_129482 ?auto_129477 ) ) ( not ( = ?auto_129483 ?auto_129477 ) ) ( not ( = ?auto_129475 ?auto_129483 ) ) ( not ( = ?auto_129475 ?auto_129478 ) ) ( not ( = ?auto_129475 ?auto_129481 ) ) ( not ( = ?auto_129475 ?auto_129480 ) ) ( not ( = ?auto_129475 ?auto_129482 ) ) ( not ( = ?auto_129476 ?auto_129483 ) ) ( not ( = ?auto_129476 ?auto_129478 ) ) ( not ( = ?auto_129476 ?auto_129481 ) ) ( not ( = ?auto_129476 ?auto_129480 ) ) ( not ( = ?auto_129476 ?auto_129482 ) ) ( not ( = ?auto_129479 ?auto_129483 ) ) ( not ( = ?auto_129479 ?auto_129478 ) ) ( not ( = ?auto_129479 ?auto_129481 ) ) ( not ( = ?auto_129479 ?auto_129480 ) ) ( not ( = ?auto_129479 ?auto_129482 ) ) ( ON ?auto_129477 ?auto_129479 ) ( ON ?auto_129483 ?auto_129477 ) ( CLEAR ?auto_129480 ) ( ON ?auto_129482 ?auto_129483 ) ( CLEAR ?auto_129482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129476 ?auto_129475 ?auto_129479 ?auto_129477 ?auto_129483 )
      ( MAKE-1PILE ?auto_129475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129484 - BLOCK
    )
    :vars
    (
      ?auto_129487 - BLOCK
      ?auto_129485 - BLOCK
      ?auto_129492 - BLOCK
      ?auto_129488 - BLOCK
      ?auto_129490 - BLOCK
      ?auto_129491 - BLOCK
      ?auto_129486 - BLOCK
      ?auto_129489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129484 ?auto_129487 ) ( not ( = ?auto_129484 ?auto_129487 ) ) ( not ( = ?auto_129484 ?auto_129485 ) ) ( not ( = ?auto_129484 ?auto_129492 ) ) ( not ( = ?auto_129487 ?auto_129485 ) ) ( not ( = ?auto_129487 ?auto_129492 ) ) ( not ( = ?auto_129485 ?auto_129492 ) ) ( ON ?auto_129485 ?auto_129484 ) ( ON-TABLE ?auto_129487 ) ( ON-TABLE ?auto_129488 ) ( ON ?auto_129490 ?auto_129488 ) ( not ( = ?auto_129488 ?auto_129490 ) ) ( not ( = ?auto_129488 ?auto_129491 ) ) ( not ( = ?auto_129488 ?auto_129486 ) ) ( not ( = ?auto_129488 ?auto_129489 ) ) ( not ( = ?auto_129488 ?auto_129492 ) ) ( not ( = ?auto_129490 ?auto_129491 ) ) ( not ( = ?auto_129490 ?auto_129486 ) ) ( not ( = ?auto_129490 ?auto_129489 ) ) ( not ( = ?auto_129490 ?auto_129492 ) ) ( not ( = ?auto_129491 ?auto_129486 ) ) ( not ( = ?auto_129491 ?auto_129489 ) ) ( not ( = ?auto_129491 ?auto_129492 ) ) ( not ( = ?auto_129486 ?auto_129489 ) ) ( not ( = ?auto_129486 ?auto_129492 ) ) ( not ( = ?auto_129489 ?auto_129492 ) ) ( not ( = ?auto_129484 ?auto_129489 ) ) ( not ( = ?auto_129484 ?auto_129488 ) ) ( not ( = ?auto_129484 ?auto_129490 ) ) ( not ( = ?auto_129484 ?auto_129491 ) ) ( not ( = ?auto_129484 ?auto_129486 ) ) ( not ( = ?auto_129487 ?auto_129489 ) ) ( not ( = ?auto_129487 ?auto_129488 ) ) ( not ( = ?auto_129487 ?auto_129490 ) ) ( not ( = ?auto_129487 ?auto_129491 ) ) ( not ( = ?auto_129487 ?auto_129486 ) ) ( not ( = ?auto_129485 ?auto_129489 ) ) ( not ( = ?auto_129485 ?auto_129488 ) ) ( not ( = ?auto_129485 ?auto_129490 ) ) ( not ( = ?auto_129485 ?auto_129491 ) ) ( not ( = ?auto_129485 ?auto_129486 ) ) ( ON ?auto_129492 ?auto_129485 ) ( ON ?auto_129489 ?auto_129492 ) ( ON ?auto_129486 ?auto_129489 ) ( CLEAR ?auto_129486 ) ( HOLDING ?auto_129491 ) ( CLEAR ?auto_129490 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129488 ?auto_129490 ?auto_129491 )
      ( MAKE-1PILE ?auto_129484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129493 - BLOCK
    )
    :vars
    (
      ?auto_129495 - BLOCK
      ?auto_129494 - BLOCK
      ?auto_129498 - BLOCK
      ?auto_129499 - BLOCK
      ?auto_129496 - BLOCK
      ?auto_129497 - BLOCK
      ?auto_129501 - BLOCK
      ?auto_129500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129493 ?auto_129495 ) ( not ( = ?auto_129493 ?auto_129495 ) ) ( not ( = ?auto_129493 ?auto_129494 ) ) ( not ( = ?auto_129493 ?auto_129498 ) ) ( not ( = ?auto_129495 ?auto_129494 ) ) ( not ( = ?auto_129495 ?auto_129498 ) ) ( not ( = ?auto_129494 ?auto_129498 ) ) ( ON ?auto_129494 ?auto_129493 ) ( ON-TABLE ?auto_129495 ) ( ON-TABLE ?auto_129499 ) ( ON ?auto_129496 ?auto_129499 ) ( not ( = ?auto_129499 ?auto_129496 ) ) ( not ( = ?auto_129499 ?auto_129497 ) ) ( not ( = ?auto_129499 ?auto_129501 ) ) ( not ( = ?auto_129499 ?auto_129500 ) ) ( not ( = ?auto_129499 ?auto_129498 ) ) ( not ( = ?auto_129496 ?auto_129497 ) ) ( not ( = ?auto_129496 ?auto_129501 ) ) ( not ( = ?auto_129496 ?auto_129500 ) ) ( not ( = ?auto_129496 ?auto_129498 ) ) ( not ( = ?auto_129497 ?auto_129501 ) ) ( not ( = ?auto_129497 ?auto_129500 ) ) ( not ( = ?auto_129497 ?auto_129498 ) ) ( not ( = ?auto_129501 ?auto_129500 ) ) ( not ( = ?auto_129501 ?auto_129498 ) ) ( not ( = ?auto_129500 ?auto_129498 ) ) ( not ( = ?auto_129493 ?auto_129500 ) ) ( not ( = ?auto_129493 ?auto_129499 ) ) ( not ( = ?auto_129493 ?auto_129496 ) ) ( not ( = ?auto_129493 ?auto_129497 ) ) ( not ( = ?auto_129493 ?auto_129501 ) ) ( not ( = ?auto_129495 ?auto_129500 ) ) ( not ( = ?auto_129495 ?auto_129499 ) ) ( not ( = ?auto_129495 ?auto_129496 ) ) ( not ( = ?auto_129495 ?auto_129497 ) ) ( not ( = ?auto_129495 ?auto_129501 ) ) ( not ( = ?auto_129494 ?auto_129500 ) ) ( not ( = ?auto_129494 ?auto_129499 ) ) ( not ( = ?auto_129494 ?auto_129496 ) ) ( not ( = ?auto_129494 ?auto_129497 ) ) ( not ( = ?auto_129494 ?auto_129501 ) ) ( ON ?auto_129498 ?auto_129494 ) ( ON ?auto_129500 ?auto_129498 ) ( ON ?auto_129501 ?auto_129500 ) ( CLEAR ?auto_129496 ) ( ON ?auto_129497 ?auto_129501 ) ( CLEAR ?auto_129497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129495 ?auto_129493 ?auto_129494 ?auto_129498 ?auto_129500 ?auto_129501 )
      ( MAKE-1PILE ?auto_129493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129502 - BLOCK
    )
    :vars
    (
      ?auto_129507 - BLOCK
      ?auto_129510 - BLOCK
      ?auto_129503 - BLOCK
      ?auto_129506 - BLOCK
      ?auto_129509 - BLOCK
      ?auto_129504 - BLOCK
      ?auto_129508 - BLOCK
      ?auto_129505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129502 ?auto_129507 ) ( not ( = ?auto_129502 ?auto_129507 ) ) ( not ( = ?auto_129502 ?auto_129510 ) ) ( not ( = ?auto_129502 ?auto_129503 ) ) ( not ( = ?auto_129507 ?auto_129510 ) ) ( not ( = ?auto_129507 ?auto_129503 ) ) ( not ( = ?auto_129510 ?auto_129503 ) ) ( ON ?auto_129510 ?auto_129502 ) ( ON-TABLE ?auto_129507 ) ( ON-TABLE ?auto_129506 ) ( not ( = ?auto_129506 ?auto_129509 ) ) ( not ( = ?auto_129506 ?auto_129504 ) ) ( not ( = ?auto_129506 ?auto_129508 ) ) ( not ( = ?auto_129506 ?auto_129505 ) ) ( not ( = ?auto_129506 ?auto_129503 ) ) ( not ( = ?auto_129509 ?auto_129504 ) ) ( not ( = ?auto_129509 ?auto_129508 ) ) ( not ( = ?auto_129509 ?auto_129505 ) ) ( not ( = ?auto_129509 ?auto_129503 ) ) ( not ( = ?auto_129504 ?auto_129508 ) ) ( not ( = ?auto_129504 ?auto_129505 ) ) ( not ( = ?auto_129504 ?auto_129503 ) ) ( not ( = ?auto_129508 ?auto_129505 ) ) ( not ( = ?auto_129508 ?auto_129503 ) ) ( not ( = ?auto_129505 ?auto_129503 ) ) ( not ( = ?auto_129502 ?auto_129505 ) ) ( not ( = ?auto_129502 ?auto_129506 ) ) ( not ( = ?auto_129502 ?auto_129509 ) ) ( not ( = ?auto_129502 ?auto_129504 ) ) ( not ( = ?auto_129502 ?auto_129508 ) ) ( not ( = ?auto_129507 ?auto_129505 ) ) ( not ( = ?auto_129507 ?auto_129506 ) ) ( not ( = ?auto_129507 ?auto_129509 ) ) ( not ( = ?auto_129507 ?auto_129504 ) ) ( not ( = ?auto_129507 ?auto_129508 ) ) ( not ( = ?auto_129510 ?auto_129505 ) ) ( not ( = ?auto_129510 ?auto_129506 ) ) ( not ( = ?auto_129510 ?auto_129509 ) ) ( not ( = ?auto_129510 ?auto_129504 ) ) ( not ( = ?auto_129510 ?auto_129508 ) ) ( ON ?auto_129503 ?auto_129510 ) ( ON ?auto_129505 ?auto_129503 ) ( ON ?auto_129508 ?auto_129505 ) ( ON ?auto_129504 ?auto_129508 ) ( CLEAR ?auto_129504 ) ( HOLDING ?auto_129509 ) ( CLEAR ?auto_129506 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129506 ?auto_129509 )
      ( MAKE-1PILE ?auto_129502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129511 - BLOCK
    )
    :vars
    (
      ?auto_129513 - BLOCK
      ?auto_129518 - BLOCK
      ?auto_129514 - BLOCK
      ?auto_129516 - BLOCK
      ?auto_129517 - BLOCK
      ?auto_129515 - BLOCK
      ?auto_129512 - BLOCK
      ?auto_129519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129511 ?auto_129513 ) ( not ( = ?auto_129511 ?auto_129513 ) ) ( not ( = ?auto_129511 ?auto_129518 ) ) ( not ( = ?auto_129511 ?auto_129514 ) ) ( not ( = ?auto_129513 ?auto_129518 ) ) ( not ( = ?auto_129513 ?auto_129514 ) ) ( not ( = ?auto_129518 ?auto_129514 ) ) ( ON ?auto_129518 ?auto_129511 ) ( ON-TABLE ?auto_129513 ) ( ON-TABLE ?auto_129516 ) ( not ( = ?auto_129516 ?auto_129517 ) ) ( not ( = ?auto_129516 ?auto_129515 ) ) ( not ( = ?auto_129516 ?auto_129512 ) ) ( not ( = ?auto_129516 ?auto_129519 ) ) ( not ( = ?auto_129516 ?auto_129514 ) ) ( not ( = ?auto_129517 ?auto_129515 ) ) ( not ( = ?auto_129517 ?auto_129512 ) ) ( not ( = ?auto_129517 ?auto_129519 ) ) ( not ( = ?auto_129517 ?auto_129514 ) ) ( not ( = ?auto_129515 ?auto_129512 ) ) ( not ( = ?auto_129515 ?auto_129519 ) ) ( not ( = ?auto_129515 ?auto_129514 ) ) ( not ( = ?auto_129512 ?auto_129519 ) ) ( not ( = ?auto_129512 ?auto_129514 ) ) ( not ( = ?auto_129519 ?auto_129514 ) ) ( not ( = ?auto_129511 ?auto_129519 ) ) ( not ( = ?auto_129511 ?auto_129516 ) ) ( not ( = ?auto_129511 ?auto_129517 ) ) ( not ( = ?auto_129511 ?auto_129515 ) ) ( not ( = ?auto_129511 ?auto_129512 ) ) ( not ( = ?auto_129513 ?auto_129519 ) ) ( not ( = ?auto_129513 ?auto_129516 ) ) ( not ( = ?auto_129513 ?auto_129517 ) ) ( not ( = ?auto_129513 ?auto_129515 ) ) ( not ( = ?auto_129513 ?auto_129512 ) ) ( not ( = ?auto_129518 ?auto_129519 ) ) ( not ( = ?auto_129518 ?auto_129516 ) ) ( not ( = ?auto_129518 ?auto_129517 ) ) ( not ( = ?auto_129518 ?auto_129515 ) ) ( not ( = ?auto_129518 ?auto_129512 ) ) ( ON ?auto_129514 ?auto_129518 ) ( ON ?auto_129519 ?auto_129514 ) ( ON ?auto_129512 ?auto_129519 ) ( ON ?auto_129515 ?auto_129512 ) ( CLEAR ?auto_129516 ) ( ON ?auto_129517 ?auto_129515 ) ( CLEAR ?auto_129517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129513 ?auto_129511 ?auto_129518 ?auto_129514 ?auto_129519 ?auto_129512 ?auto_129515 )
      ( MAKE-1PILE ?auto_129511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129520 - BLOCK
    )
    :vars
    (
      ?auto_129525 - BLOCK
      ?auto_129522 - BLOCK
      ?auto_129528 - BLOCK
      ?auto_129527 - BLOCK
      ?auto_129523 - BLOCK
      ?auto_129526 - BLOCK
      ?auto_129524 - BLOCK
      ?auto_129521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129520 ?auto_129525 ) ( not ( = ?auto_129520 ?auto_129525 ) ) ( not ( = ?auto_129520 ?auto_129522 ) ) ( not ( = ?auto_129520 ?auto_129528 ) ) ( not ( = ?auto_129525 ?auto_129522 ) ) ( not ( = ?auto_129525 ?auto_129528 ) ) ( not ( = ?auto_129522 ?auto_129528 ) ) ( ON ?auto_129522 ?auto_129520 ) ( ON-TABLE ?auto_129525 ) ( not ( = ?auto_129527 ?auto_129523 ) ) ( not ( = ?auto_129527 ?auto_129526 ) ) ( not ( = ?auto_129527 ?auto_129524 ) ) ( not ( = ?auto_129527 ?auto_129521 ) ) ( not ( = ?auto_129527 ?auto_129528 ) ) ( not ( = ?auto_129523 ?auto_129526 ) ) ( not ( = ?auto_129523 ?auto_129524 ) ) ( not ( = ?auto_129523 ?auto_129521 ) ) ( not ( = ?auto_129523 ?auto_129528 ) ) ( not ( = ?auto_129526 ?auto_129524 ) ) ( not ( = ?auto_129526 ?auto_129521 ) ) ( not ( = ?auto_129526 ?auto_129528 ) ) ( not ( = ?auto_129524 ?auto_129521 ) ) ( not ( = ?auto_129524 ?auto_129528 ) ) ( not ( = ?auto_129521 ?auto_129528 ) ) ( not ( = ?auto_129520 ?auto_129521 ) ) ( not ( = ?auto_129520 ?auto_129527 ) ) ( not ( = ?auto_129520 ?auto_129523 ) ) ( not ( = ?auto_129520 ?auto_129526 ) ) ( not ( = ?auto_129520 ?auto_129524 ) ) ( not ( = ?auto_129525 ?auto_129521 ) ) ( not ( = ?auto_129525 ?auto_129527 ) ) ( not ( = ?auto_129525 ?auto_129523 ) ) ( not ( = ?auto_129525 ?auto_129526 ) ) ( not ( = ?auto_129525 ?auto_129524 ) ) ( not ( = ?auto_129522 ?auto_129521 ) ) ( not ( = ?auto_129522 ?auto_129527 ) ) ( not ( = ?auto_129522 ?auto_129523 ) ) ( not ( = ?auto_129522 ?auto_129526 ) ) ( not ( = ?auto_129522 ?auto_129524 ) ) ( ON ?auto_129528 ?auto_129522 ) ( ON ?auto_129521 ?auto_129528 ) ( ON ?auto_129524 ?auto_129521 ) ( ON ?auto_129526 ?auto_129524 ) ( ON ?auto_129523 ?auto_129526 ) ( CLEAR ?auto_129523 ) ( HOLDING ?auto_129527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129527 )
      ( MAKE-1PILE ?auto_129520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129529 - BLOCK
    )
    :vars
    (
      ?auto_129531 - BLOCK
      ?auto_129536 - BLOCK
      ?auto_129535 - BLOCK
      ?auto_129532 - BLOCK
      ?auto_129534 - BLOCK
      ?auto_129530 - BLOCK
      ?auto_129533 - BLOCK
      ?auto_129537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129529 ?auto_129531 ) ( not ( = ?auto_129529 ?auto_129531 ) ) ( not ( = ?auto_129529 ?auto_129536 ) ) ( not ( = ?auto_129529 ?auto_129535 ) ) ( not ( = ?auto_129531 ?auto_129536 ) ) ( not ( = ?auto_129531 ?auto_129535 ) ) ( not ( = ?auto_129536 ?auto_129535 ) ) ( ON ?auto_129536 ?auto_129529 ) ( ON-TABLE ?auto_129531 ) ( not ( = ?auto_129532 ?auto_129534 ) ) ( not ( = ?auto_129532 ?auto_129530 ) ) ( not ( = ?auto_129532 ?auto_129533 ) ) ( not ( = ?auto_129532 ?auto_129537 ) ) ( not ( = ?auto_129532 ?auto_129535 ) ) ( not ( = ?auto_129534 ?auto_129530 ) ) ( not ( = ?auto_129534 ?auto_129533 ) ) ( not ( = ?auto_129534 ?auto_129537 ) ) ( not ( = ?auto_129534 ?auto_129535 ) ) ( not ( = ?auto_129530 ?auto_129533 ) ) ( not ( = ?auto_129530 ?auto_129537 ) ) ( not ( = ?auto_129530 ?auto_129535 ) ) ( not ( = ?auto_129533 ?auto_129537 ) ) ( not ( = ?auto_129533 ?auto_129535 ) ) ( not ( = ?auto_129537 ?auto_129535 ) ) ( not ( = ?auto_129529 ?auto_129537 ) ) ( not ( = ?auto_129529 ?auto_129532 ) ) ( not ( = ?auto_129529 ?auto_129534 ) ) ( not ( = ?auto_129529 ?auto_129530 ) ) ( not ( = ?auto_129529 ?auto_129533 ) ) ( not ( = ?auto_129531 ?auto_129537 ) ) ( not ( = ?auto_129531 ?auto_129532 ) ) ( not ( = ?auto_129531 ?auto_129534 ) ) ( not ( = ?auto_129531 ?auto_129530 ) ) ( not ( = ?auto_129531 ?auto_129533 ) ) ( not ( = ?auto_129536 ?auto_129537 ) ) ( not ( = ?auto_129536 ?auto_129532 ) ) ( not ( = ?auto_129536 ?auto_129534 ) ) ( not ( = ?auto_129536 ?auto_129530 ) ) ( not ( = ?auto_129536 ?auto_129533 ) ) ( ON ?auto_129535 ?auto_129536 ) ( ON ?auto_129537 ?auto_129535 ) ( ON ?auto_129533 ?auto_129537 ) ( ON ?auto_129530 ?auto_129533 ) ( ON ?auto_129534 ?auto_129530 ) ( ON ?auto_129532 ?auto_129534 ) ( CLEAR ?auto_129532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129531 ?auto_129529 ?auto_129536 ?auto_129535 ?auto_129537 ?auto_129533 ?auto_129530 ?auto_129534 )
      ( MAKE-1PILE ?auto_129529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129551 - BLOCK
      ?auto_129552 - BLOCK
      ?auto_129553 - BLOCK
      ?auto_129554 - BLOCK
      ?auto_129555 - BLOCK
      ?auto_129556 - BLOCK
    )
    :vars
    (
      ?auto_129557 - BLOCK
      ?auto_129558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129557 ?auto_129556 ) ( CLEAR ?auto_129557 ) ( ON-TABLE ?auto_129551 ) ( ON ?auto_129552 ?auto_129551 ) ( ON ?auto_129553 ?auto_129552 ) ( ON ?auto_129554 ?auto_129553 ) ( ON ?auto_129555 ?auto_129554 ) ( ON ?auto_129556 ?auto_129555 ) ( not ( = ?auto_129551 ?auto_129552 ) ) ( not ( = ?auto_129551 ?auto_129553 ) ) ( not ( = ?auto_129551 ?auto_129554 ) ) ( not ( = ?auto_129551 ?auto_129555 ) ) ( not ( = ?auto_129551 ?auto_129556 ) ) ( not ( = ?auto_129551 ?auto_129557 ) ) ( not ( = ?auto_129552 ?auto_129553 ) ) ( not ( = ?auto_129552 ?auto_129554 ) ) ( not ( = ?auto_129552 ?auto_129555 ) ) ( not ( = ?auto_129552 ?auto_129556 ) ) ( not ( = ?auto_129552 ?auto_129557 ) ) ( not ( = ?auto_129553 ?auto_129554 ) ) ( not ( = ?auto_129553 ?auto_129555 ) ) ( not ( = ?auto_129553 ?auto_129556 ) ) ( not ( = ?auto_129553 ?auto_129557 ) ) ( not ( = ?auto_129554 ?auto_129555 ) ) ( not ( = ?auto_129554 ?auto_129556 ) ) ( not ( = ?auto_129554 ?auto_129557 ) ) ( not ( = ?auto_129555 ?auto_129556 ) ) ( not ( = ?auto_129555 ?auto_129557 ) ) ( not ( = ?auto_129556 ?auto_129557 ) ) ( HOLDING ?auto_129558 ) ( not ( = ?auto_129551 ?auto_129558 ) ) ( not ( = ?auto_129552 ?auto_129558 ) ) ( not ( = ?auto_129553 ?auto_129558 ) ) ( not ( = ?auto_129554 ?auto_129558 ) ) ( not ( = ?auto_129555 ?auto_129558 ) ) ( not ( = ?auto_129556 ?auto_129558 ) ) ( not ( = ?auto_129557 ?auto_129558 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_129558 )
      ( MAKE-6PILE ?auto_129551 ?auto_129552 ?auto_129553 ?auto_129554 ?auto_129555 ?auto_129556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129676 - BLOCK
      ?auto_129677 - BLOCK
    )
    :vars
    (
      ?auto_129678 - BLOCK
      ?auto_129680 - BLOCK
      ?auto_129682 - BLOCK
      ?auto_129679 - BLOCK
      ?auto_129683 - BLOCK
      ?auto_129681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129676 ?auto_129677 ) ) ( ON ?auto_129677 ?auto_129678 ) ( not ( = ?auto_129676 ?auto_129678 ) ) ( not ( = ?auto_129677 ?auto_129678 ) ) ( ON ?auto_129676 ?auto_129677 ) ( CLEAR ?auto_129676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129680 ) ( ON ?auto_129682 ?auto_129680 ) ( ON ?auto_129679 ?auto_129682 ) ( ON ?auto_129683 ?auto_129679 ) ( ON ?auto_129681 ?auto_129683 ) ( ON ?auto_129678 ?auto_129681 ) ( not ( = ?auto_129680 ?auto_129682 ) ) ( not ( = ?auto_129680 ?auto_129679 ) ) ( not ( = ?auto_129680 ?auto_129683 ) ) ( not ( = ?auto_129680 ?auto_129681 ) ) ( not ( = ?auto_129680 ?auto_129678 ) ) ( not ( = ?auto_129680 ?auto_129677 ) ) ( not ( = ?auto_129680 ?auto_129676 ) ) ( not ( = ?auto_129682 ?auto_129679 ) ) ( not ( = ?auto_129682 ?auto_129683 ) ) ( not ( = ?auto_129682 ?auto_129681 ) ) ( not ( = ?auto_129682 ?auto_129678 ) ) ( not ( = ?auto_129682 ?auto_129677 ) ) ( not ( = ?auto_129682 ?auto_129676 ) ) ( not ( = ?auto_129679 ?auto_129683 ) ) ( not ( = ?auto_129679 ?auto_129681 ) ) ( not ( = ?auto_129679 ?auto_129678 ) ) ( not ( = ?auto_129679 ?auto_129677 ) ) ( not ( = ?auto_129679 ?auto_129676 ) ) ( not ( = ?auto_129683 ?auto_129681 ) ) ( not ( = ?auto_129683 ?auto_129678 ) ) ( not ( = ?auto_129683 ?auto_129677 ) ) ( not ( = ?auto_129683 ?auto_129676 ) ) ( not ( = ?auto_129681 ?auto_129678 ) ) ( not ( = ?auto_129681 ?auto_129677 ) ) ( not ( = ?auto_129681 ?auto_129676 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129680 ?auto_129682 ?auto_129679 ?auto_129683 ?auto_129681 ?auto_129678 ?auto_129677 )
      ( MAKE-2PILE ?auto_129676 ?auto_129677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129686 - BLOCK
      ?auto_129687 - BLOCK
    )
    :vars
    (
      ?auto_129688 - BLOCK
      ?auto_129689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129686 ?auto_129687 ) ) ( ON ?auto_129687 ?auto_129688 ) ( CLEAR ?auto_129687 ) ( not ( = ?auto_129686 ?auto_129688 ) ) ( not ( = ?auto_129687 ?auto_129688 ) ) ( ON ?auto_129686 ?auto_129689 ) ( CLEAR ?auto_129686 ) ( HAND-EMPTY ) ( not ( = ?auto_129686 ?auto_129689 ) ) ( not ( = ?auto_129687 ?auto_129689 ) ) ( not ( = ?auto_129688 ?auto_129689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129686 ?auto_129689 )
      ( MAKE-2PILE ?auto_129686 ?auto_129687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129690 - BLOCK
      ?auto_129691 - BLOCK
    )
    :vars
    (
      ?auto_129692 - BLOCK
      ?auto_129693 - BLOCK
      ?auto_129696 - BLOCK
      ?auto_129698 - BLOCK
      ?auto_129694 - BLOCK
      ?auto_129695 - BLOCK
      ?auto_129697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129690 ?auto_129691 ) ) ( not ( = ?auto_129690 ?auto_129692 ) ) ( not ( = ?auto_129691 ?auto_129692 ) ) ( ON ?auto_129690 ?auto_129693 ) ( CLEAR ?auto_129690 ) ( not ( = ?auto_129690 ?auto_129693 ) ) ( not ( = ?auto_129691 ?auto_129693 ) ) ( not ( = ?auto_129692 ?auto_129693 ) ) ( HOLDING ?auto_129691 ) ( CLEAR ?auto_129692 ) ( ON-TABLE ?auto_129696 ) ( ON ?auto_129698 ?auto_129696 ) ( ON ?auto_129694 ?auto_129698 ) ( ON ?auto_129695 ?auto_129694 ) ( ON ?auto_129697 ?auto_129695 ) ( ON ?auto_129692 ?auto_129697 ) ( not ( = ?auto_129696 ?auto_129698 ) ) ( not ( = ?auto_129696 ?auto_129694 ) ) ( not ( = ?auto_129696 ?auto_129695 ) ) ( not ( = ?auto_129696 ?auto_129697 ) ) ( not ( = ?auto_129696 ?auto_129692 ) ) ( not ( = ?auto_129696 ?auto_129691 ) ) ( not ( = ?auto_129698 ?auto_129694 ) ) ( not ( = ?auto_129698 ?auto_129695 ) ) ( not ( = ?auto_129698 ?auto_129697 ) ) ( not ( = ?auto_129698 ?auto_129692 ) ) ( not ( = ?auto_129698 ?auto_129691 ) ) ( not ( = ?auto_129694 ?auto_129695 ) ) ( not ( = ?auto_129694 ?auto_129697 ) ) ( not ( = ?auto_129694 ?auto_129692 ) ) ( not ( = ?auto_129694 ?auto_129691 ) ) ( not ( = ?auto_129695 ?auto_129697 ) ) ( not ( = ?auto_129695 ?auto_129692 ) ) ( not ( = ?auto_129695 ?auto_129691 ) ) ( not ( = ?auto_129697 ?auto_129692 ) ) ( not ( = ?auto_129697 ?auto_129691 ) ) ( not ( = ?auto_129690 ?auto_129696 ) ) ( not ( = ?auto_129690 ?auto_129698 ) ) ( not ( = ?auto_129690 ?auto_129694 ) ) ( not ( = ?auto_129690 ?auto_129695 ) ) ( not ( = ?auto_129690 ?auto_129697 ) ) ( not ( = ?auto_129693 ?auto_129696 ) ) ( not ( = ?auto_129693 ?auto_129698 ) ) ( not ( = ?auto_129693 ?auto_129694 ) ) ( not ( = ?auto_129693 ?auto_129695 ) ) ( not ( = ?auto_129693 ?auto_129697 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129696 ?auto_129698 ?auto_129694 ?auto_129695 ?auto_129697 ?auto_129692 ?auto_129691 )
      ( MAKE-2PILE ?auto_129690 ?auto_129691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129699 - BLOCK
      ?auto_129700 - BLOCK
    )
    :vars
    (
      ?auto_129701 - BLOCK
      ?auto_129706 - BLOCK
      ?auto_129702 - BLOCK
      ?auto_129704 - BLOCK
      ?auto_129705 - BLOCK
      ?auto_129707 - BLOCK
      ?auto_129703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129699 ?auto_129700 ) ) ( not ( = ?auto_129699 ?auto_129701 ) ) ( not ( = ?auto_129700 ?auto_129701 ) ) ( ON ?auto_129699 ?auto_129706 ) ( not ( = ?auto_129699 ?auto_129706 ) ) ( not ( = ?auto_129700 ?auto_129706 ) ) ( not ( = ?auto_129701 ?auto_129706 ) ) ( CLEAR ?auto_129701 ) ( ON-TABLE ?auto_129702 ) ( ON ?auto_129704 ?auto_129702 ) ( ON ?auto_129705 ?auto_129704 ) ( ON ?auto_129707 ?auto_129705 ) ( ON ?auto_129703 ?auto_129707 ) ( ON ?auto_129701 ?auto_129703 ) ( not ( = ?auto_129702 ?auto_129704 ) ) ( not ( = ?auto_129702 ?auto_129705 ) ) ( not ( = ?auto_129702 ?auto_129707 ) ) ( not ( = ?auto_129702 ?auto_129703 ) ) ( not ( = ?auto_129702 ?auto_129701 ) ) ( not ( = ?auto_129702 ?auto_129700 ) ) ( not ( = ?auto_129704 ?auto_129705 ) ) ( not ( = ?auto_129704 ?auto_129707 ) ) ( not ( = ?auto_129704 ?auto_129703 ) ) ( not ( = ?auto_129704 ?auto_129701 ) ) ( not ( = ?auto_129704 ?auto_129700 ) ) ( not ( = ?auto_129705 ?auto_129707 ) ) ( not ( = ?auto_129705 ?auto_129703 ) ) ( not ( = ?auto_129705 ?auto_129701 ) ) ( not ( = ?auto_129705 ?auto_129700 ) ) ( not ( = ?auto_129707 ?auto_129703 ) ) ( not ( = ?auto_129707 ?auto_129701 ) ) ( not ( = ?auto_129707 ?auto_129700 ) ) ( not ( = ?auto_129703 ?auto_129701 ) ) ( not ( = ?auto_129703 ?auto_129700 ) ) ( not ( = ?auto_129699 ?auto_129702 ) ) ( not ( = ?auto_129699 ?auto_129704 ) ) ( not ( = ?auto_129699 ?auto_129705 ) ) ( not ( = ?auto_129699 ?auto_129707 ) ) ( not ( = ?auto_129699 ?auto_129703 ) ) ( not ( = ?auto_129706 ?auto_129702 ) ) ( not ( = ?auto_129706 ?auto_129704 ) ) ( not ( = ?auto_129706 ?auto_129705 ) ) ( not ( = ?auto_129706 ?auto_129707 ) ) ( not ( = ?auto_129706 ?auto_129703 ) ) ( ON ?auto_129700 ?auto_129699 ) ( CLEAR ?auto_129700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129706 ?auto_129699 )
      ( MAKE-2PILE ?auto_129699 ?auto_129700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129708 - BLOCK
      ?auto_129709 - BLOCK
    )
    :vars
    (
      ?auto_129712 - BLOCK
      ?auto_129714 - BLOCK
      ?auto_129716 - BLOCK
      ?auto_129715 - BLOCK
      ?auto_129710 - BLOCK
      ?auto_129711 - BLOCK
      ?auto_129713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129708 ?auto_129709 ) ) ( not ( = ?auto_129708 ?auto_129712 ) ) ( not ( = ?auto_129709 ?auto_129712 ) ) ( ON ?auto_129708 ?auto_129714 ) ( not ( = ?auto_129708 ?auto_129714 ) ) ( not ( = ?auto_129709 ?auto_129714 ) ) ( not ( = ?auto_129712 ?auto_129714 ) ) ( ON-TABLE ?auto_129716 ) ( ON ?auto_129715 ?auto_129716 ) ( ON ?auto_129710 ?auto_129715 ) ( ON ?auto_129711 ?auto_129710 ) ( ON ?auto_129713 ?auto_129711 ) ( not ( = ?auto_129716 ?auto_129715 ) ) ( not ( = ?auto_129716 ?auto_129710 ) ) ( not ( = ?auto_129716 ?auto_129711 ) ) ( not ( = ?auto_129716 ?auto_129713 ) ) ( not ( = ?auto_129716 ?auto_129712 ) ) ( not ( = ?auto_129716 ?auto_129709 ) ) ( not ( = ?auto_129715 ?auto_129710 ) ) ( not ( = ?auto_129715 ?auto_129711 ) ) ( not ( = ?auto_129715 ?auto_129713 ) ) ( not ( = ?auto_129715 ?auto_129712 ) ) ( not ( = ?auto_129715 ?auto_129709 ) ) ( not ( = ?auto_129710 ?auto_129711 ) ) ( not ( = ?auto_129710 ?auto_129713 ) ) ( not ( = ?auto_129710 ?auto_129712 ) ) ( not ( = ?auto_129710 ?auto_129709 ) ) ( not ( = ?auto_129711 ?auto_129713 ) ) ( not ( = ?auto_129711 ?auto_129712 ) ) ( not ( = ?auto_129711 ?auto_129709 ) ) ( not ( = ?auto_129713 ?auto_129712 ) ) ( not ( = ?auto_129713 ?auto_129709 ) ) ( not ( = ?auto_129708 ?auto_129716 ) ) ( not ( = ?auto_129708 ?auto_129715 ) ) ( not ( = ?auto_129708 ?auto_129710 ) ) ( not ( = ?auto_129708 ?auto_129711 ) ) ( not ( = ?auto_129708 ?auto_129713 ) ) ( not ( = ?auto_129714 ?auto_129716 ) ) ( not ( = ?auto_129714 ?auto_129715 ) ) ( not ( = ?auto_129714 ?auto_129710 ) ) ( not ( = ?auto_129714 ?auto_129711 ) ) ( not ( = ?auto_129714 ?auto_129713 ) ) ( ON ?auto_129709 ?auto_129708 ) ( CLEAR ?auto_129709 ) ( ON-TABLE ?auto_129714 ) ( HOLDING ?auto_129712 ) ( CLEAR ?auto_129713 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129716 ?auto_129715 ?auto_129710 ?auto_129711 ?auto_129713 ?auto_129712 )
      ( MAKE-2PILE ?auto_129708 ?auto_129709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129717 - BLOCK
      ?auto_129718 - BLOCK
    )
    :vars
    (
      ?auto_129719 - BLOCK
      ?auto_129725 - BLOCK
      ?auto_129723 - BLOCK
      ?auto_129722 - BLOCK
      ?auto_129721 - BLOCK
      ?auto_129724 - BLOCK
      ?auto_129720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129717 ?auto_129718 ) ) ( not ( = ?auto_129717 ?auto_129719 ) ) ( not ( = ?auto_129718 ?auto_129719 ) ) ( ON ?auto_129717 ?auto_129725 ) ( not ( = ?auto_129717 ?auto_129725 ) ) ( not ( = ?auto_129718 ?auto_129725 ) ) ( not ( = ?auto_129719 ?auto_129725 ) ) ( ON-TABLE ?auto_129723 ) ( ON ?auto_129722 ?auto_129723 ) ( ON ?auto_129721 ?auto_129722 ) ( ON ?auto_129724 ?auto_129721 ) ( ON ?auto_129720 ?auto_129724 ) ( not ( = ?auto_129723 ?auto_129722 ) ) ( not ( = ?auto_129723 ?auto_129721 ) ) ( not ( = ?auto_129723 ?auto_129724 ) ) ( not ( = ?auto_129723 ?auto_129720 ) ) ( not ( = ?auto_129723 ?auto_129719 ) ) ( not ( = ?auto_129723 ?auto_129718 ) ) ( not ( = ?auto_129722 ?auto_129721 ) ) ( not ( = ?auto_129722 ?auto_129724 ) ) ( not ( = ?auto_129722 ?auto_129720 ) ) ( not ( = ?auto_129722 ?auto_129719 ) ) ( not ( = ?auto_129722 ?auto_129718 ) ) ( not ( = ?auto_129721 ?auto_129724 ) ) ( not ( = ?auto_129721 ?auto_129720 ) ) ( not ( = ?auto_129721 ?auto_129719 ) ) ( not ( = ?auto_129721 ?auto_129718 ) ) ( not ( = ?auto_129724 ?auto_129720 ) ) ( not ( = ?auto_129724 ?auto_129719 ) ) ( not ( = ?auto_129724 ?auto_129718 ) ) ( not ( = ?auto_129720 ?auto_129719 ) ) ( not ( = ?auto_129720 ?auto_129718 ) ) ( not ( = ?auto_129717 ?auto_129723 ) ) ( not ( = ?auto_129717 ?auto_129722 ) ) ( not ( = ?auto_129717 ?auto_129721 ) ) ( not ( = ?auto_129717 ?auto_129724 ) ) ( not ( = ?auto_129717 ?auto_129720 ) ) ( not ( = ?auto_129725 ?auto_129723 ) ) ( not ( = ?auto_129725 ?auto_129722 ) ) ( not ( = ?auto_129725 ?auto_129721 ) ) ( not ( = ?auto_129725 ?auto_129724 ) ) ( not ( = ?auto_129725 ?auto_129720 ) ) ( ON ?auto_129718 ?auto_129717 ) ( ON-TABLE ?auto_129725 ) ( CLEAR ?auto_129720 ) ( ON ?auto_129719 ?auto_129718 ) ( CLEAR ?auto_129719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129725 ?auto_129717 ?auto_129718 )
      ( MAKE-2PILE ?auto_129717 ?auto_129718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129726 - BLOCK
      ?auto_129727 - BLOCK
    )
    :vars
    (
      ?auto_129734 - BLOCK
      ?auto_129728 - BLOCK
      ?auto_129732 - BLOCK
      ?auto_129731 - BLOCK
      ?auto_129733 - BLOCK
      ?auto_129730 - BLOCK
      ?auto_129729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129726 ?auto_129727 ) ) ( not ( = ?auto_129726 ?auto_129734 ) ) ( not ( = ?auto_129727 ?auto_129734 ) ) ( ON ?auto_129726 ?auto_129728 ) ( not ( = ?auto_129726 ?auto_129728 ) ) ( not ( = ?auto_129727 ?auto_129728 ) ) ( not ( = ?auto_129734 ?auto_129728 ) ) ( ON-TABLE ?auto_129732 ) ( ON ?auto_129731 ?auto_129732 ) ( ON ?auto_129733 ?auto_129731 ) ( ON ?auto_129730 ?auto_129733 ) ( not ( = ?auto_129732 ?auto_129731 ) ) ( not ( = ?auto_129732 ?auto_129733 ) ) ( not ( = ?auto_129732 ?auto_129730 ) ) ( not ( = ?auto_129732 ?auto_129729 ) ) ( not ( = ?auto_129732 ?auto_129734 ) ) ( not ( = ?auto_129732 ?auto_129727 ) ) ( not ( = ?auto_129731 ?auto_129733 ) ) ( not ( = ?auto_129731 ?auto_129730 ) ) ( not ( = ?auto_129731 ?auto_129729 ) ) ( not ( = ?auto_129731 ?auto_129734 ) ) ( not ( = ?auto_129731 ?auto_129727 ) ) ( not ( = ?auto_129733 ?auto_129730 ) ) ( not ( = ?auto_129733 ?auto_129729 ) ) ( not ( = ?auto_129733 ?auto_129734 ) ) ( not ( = ?auto_129733 ?auto_129727 ) ) ( not ( = ?auto_129730 ?auto_129729 ) ) ( not ( = ?auto_129730 ?auto_129734 ) ) ( not ( = ?auto_129730 ?auto_129727 ) ) ( not ( = ?auto_129729 ?auto_129734 ) ) ( not ( = ?auto_129729 ?auto_129727 ) ) ( not ( = ?auto_129726 ?auto_129732 ) ) ( not ( = ?auto_129726 ?auto_129731 ) ) ( not ( = ?auto_129726 ?auto_129733 ) ) ( not ( = ?auto_129726 ?auto_129730 ) ) ( not ( = ?auto_129726 ?auto_129729 ) ) ( not ( = ?auto_129728 ?auto_129732 ) ) ( not ( = ?auto_129728 ?auto_129731 ) ) ( not ( = ?auto_129728 ?auto_129733 ) ) ( not ( = ?auto_129728 ?auto_129730 ) ) ( not ( = ?auto_129728 ?auto_129729 ) ) ( ON ?auto_129727 ?auto_129726 ) ( ON-TABLE ?auto_129728 ) ( ON ?auto_129734 ?auto_129727 ) ( CLEAR ?auto_129734 ) ( HOLDING ?auto_129729 ) ( CLEAR ?auto_129730 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129732 ?auto_129731 ?auto_129733 ?auto_129730 ?auto_129729 )
      ( MAKE-2PILE ?auto_129726 ?auto_129727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129735 - BLOCK
      ?auto_129736 - BLOCK
    )
    :vars
    (
      ?auto_129739 - BLOCK
      ?auto_129741 - BLOCK
      ?auto_129738 - BLOCK
      ?auto_129742 - BLOCK
      ?auto_129740 - BLOCK
      ?auto_129737 - BLOCK
      ?auto_129743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129735 ?auto_129736 ) ) ( not ( = ?auto_129735 ?auto_129739 ) ) ( not ( = ?auto_129736 ?auto_129739 ) ) ( ON ?auto_129735 ?auto_129741 ) ( not ( = ?auto_129735 ?auto_129741 ) ) ( not ( = ?auto_129736 ?auto_129741 ) ) ( not ( = ?auto_129739 ?auto_129741 ) ) ( ON-TABLE ?auto_129738 ) ( ON ?auto_129742 ?auto_129738 ) ( ON ?auto_129740 ?auto_129742 ) ( ON ?auto_129737 ?auto_129740 ) ( not ( = ?auto_129738 ?auto_129742 ) ) ( not ( = ?auto_129738 ?auto_129740 ) ) ( not ( = ?auto_129738 ?auto_129737 ) ) ( not ( = ?auto_129738 ?auto_129743 ) ) ( not ( = ?auto_129738 ?auto_129739 ) ) ( not ( = ?auto_129738 ?auto_129736 ) ) ( not ( = ?auto_129742 ?auto_129740 ) ) ( not ( = ?auto_129742 ?auto_129737 ) ) ( not ( = ?auto_129742 ?auto_129743 ) ) ( not ( = ?auto_129742 ?auto_129739 ) ) ( not ( = ?auto_129742 ?auto_129736 ) ) ( not ( = ?auto_129740 ?auto_129737 ) ) ( not ( = ?auto_129740 ?auto_129743 ) ) ( not ( = ?auto_129740 ?auto_129739 ) ) ( not ( = ?auto_129740 ?auto_129736 ) ) ( not ( = ?auto_129737 ?auto_129743 ) ) ( not ( = ?auto_129737 ?auto_129739 ) ) ( not ( = ?auto_129737 ?auto_129736 ) ) ( not ( = ?auto_129743 ?auto_129739 ) ) ( not ( = ?auto_129743 ?auto_129736 ) ) ( not ( = ?auto_129735 ?auto_129738 ) ) ( not ( = ?auto_129735 ?auto_129742 ) ) ( not ( = ?auto_129735 ?auto_129740 ) ) ( not ( = ?auto_129735 ?auto_129737 ) ) ( not ( = ?auto_129735 ?auto_129743 ) ) ( not ( = ?auto_129741 ?auto_129738 ) ) ( not ( = ?auto_129741 ?auto_129742 ) ) ( not ( = ?auto_129741 ?auto_129740 ) ) ( not ( = ?auto_129741 ?auto_129737 ) ) ( not ( = ?auto_129741 ?auto_129743 ) ) ( ON ?auto_129736 ?auto_129735 ) ( ON-TABLE ?auto_129741 ) ( ON ?auto_129739 ?auto_129736 ) ( CLEAR ?auto_129737 ) ( ON ?auto_129743 ?auto_129739 ) ( CLEAR ?auto_129743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129741 ?auto_129735 ?auto_129736 ?auto_129739 )
      ( MAKE-2PILE ?auto_129735 ?auto_129736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129744 - BLOCK
      ?auto_129745 - BLOCK
    )
    :vars
    (
      ?auto_129751 - BLOCK
      ?auto_129746 - BLOCK
      ?auto_129748 - BLOCK
      ?auto_129752 - BLOCK
      ?auto_129750 - BLOCK
      ?auto_129749 - BLOCK
      ?auto_129747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129744 ?auto_129745 ) ) ( not ( = ?auto_129744 ?auto_129751 ) ) ( not ( = ?auto_129745 ?auto_129751 ) ) ( ON ?auto_129744 ?auto_129746 ) ( not ( = ?auto_129744 ?auto_129746 ) ) ( not ( = ?auto_129745 ?auto_129746 ) ) ( not ( = ?auto_129751 ?auto_129746 ) ) ( ON-TABLE ?auto_129748 ) ( ON ?auto_129752 ?auto_129748 ) ( ON ?auto_129750 ?auto_129752 ) ( not ( = ?auto_129748 ?auto_129752 ) ) ( not ( = ?auto_129748 ?auto_129750 ) ) ( not ( = ?auto_129748 ?auto_129749 ) ) ( not ( = ?auto_129748 ?auto_129747 ) ) ( not ( = ?auto_129748 ?auto_129751 ) ) ( not ( = ?auto_129748 ?auto_129745 ) ) ( not ( = ?auto_129752 ?auto_129750 ) ) ( not ( = ?auto_129752 ?auto_129749 ) ) ( not ( = ?auto_129752 ?auto_129747 ) ) ( not ( = ?auto_129752 ?auto_129751 ) ) ( not ( = ?auto_129752 ?auto_129745 ) ) ( not ( = ?auto_129750 ?auto_129749 ) ) ( not ( = ?auto_129750 ?auto_129747 ) ) ( not ( = ?auto_129750 ?auto_129751 ) ) ( not ( = ?auto_129750 ?auto_129745 ) ) ( not ( = ?auto_129749 ?auto_129747 ) ) ( not ( = ?auto_129749 ?auto_129751 ) ) ( not ( = ?auto_129749 ?auto_129745 ) ) ( not ( = ?auto_129747 ?auto_129751 ) ) ( not ( = ?auto_129747 ?auto_129745 ) ) ( not ( = ?auto_129744 ?auto_129748 ) ) ( not ( = ?auto_129744 ?auto_129752 ) ) ( not ( = ?auto_129744 ?auto_129750 ) ) ( not ( = ?auto_129744 ?auto_129749 ) ) ( not ( = ?auto_129744 ?auto_129747 ) ) ( not ( = ?auto_129746 ?auto_129748 ) ) ( not ( = ?auto_129746 ?auto_129752 ) ) ( not ( = ?auto_129746 ?auto_129750 ) ) ( not ( = ?auto_129746 ?auto_129749 ) ) ( not ( = ?auto_129746 ?auto_129747 ) ) ( ON ?auto_129745 ?auto_129744 ) ( ON-TABLE ?auto_129746 ) ( ON ?auto_129751 ?auto_129745 ) ( ON ?auto_129747 ?auto_129751 ) ( CLEAR ?auto_129747 ) ( HOLDING ?auto_129749 ) ( CLEAR ?auto_129750 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129748 ?auto_129752 ?auto_129750 ?auto_129749 )
      ( MAKE-2PILE ?auto_129744 ?auto_129745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129753 - BLOCK
      ?auto_129754 - BLOCK
    )
    :vars
    (
      ?auto_129757 - BLOCK
      ?auto_129756 - BLOCK
      ?auto_129760 - BLOCK
      ?auto_129755 - BLOCK
      ?auto_129759 - BLOCK
      ?auto_129758 - BLOCK
      ?auto_129761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129753 ?auto_129754 ) ) ( not ( = ?auto_129753 ?auto_129757 ) ) ( not ( = ?auto_129754 ?auto_129757 ) ) ( ON ?auto_129753 ?auto_129756 ) ( not ( = ?auto_129753 ?auto_129756 ) ) ( not ( = ?auto_129754 ?auto_129756 ) ) ( not ( = ?auto_129757 ?auto_129756 ) ) ( ON-TABLE ?auto_129760 ) ( ON ?auto_129755 ?auto_129760 ) ( ON ?auto_129759 ?auto_129755 ) ( not ( = ?auto_129760 ?auto_129755 ) ) ( not ( = ?auto_129760 ?auto_129759 ) ) ( not ( = ?auto_129760 ?auto_129758 ) ) ( not ( = ?auto_129760 ?auto_129761 ) ) ( not ( = ?auto_129760 ?auto_129757 ) ) ( not ( = ?auto_129760 ?auto_129754 ) ) ( not ( = ?auto_129755 ?auto_129759 ) ) ( not ( = ?auto_129755 ?auto_129758 ) ) ( not ( = ?auto_129755 ?auto_129761 ) ) ( not ( = ?auto_129755 ?auto_129757 ) ) ( not ( = ?auto_129755 ?auto_129754 ) ) ( not ( = ?auto_129759 ?auto_129758 ) ) ( not ( = ?auto_129759 ?auto_129761 ) ) ( not ( = ?auto_129759 ?auto_129757 ) ) ( not ( = ?auto_129759 ?auto_129754 ) ) ( not ( = ?auto_129758 ?auto_129761 ) ) ( not ( = ?auto_129758 ?auto_129757 ) ) ( not ( = ?auto_129758 ?auto_129754 ) ) ( not ( = ?auto_129761 ?auto_129757 ) ) ( not ( = ?auto_129761 ?auto_129754 ) ) ( not ( = ?auto_129753 ?auto_129760 ) ) ( not ( = ?auto_129753 ?auto_129755 ) ) ( not ( = ?auto_129753 ?auto_129759 ) ) ( not ( = ?auto_129753 ?auto_129758 ) ) ( not ( = ?auto_129753 ?auto_129761 ) ) ( not ( = ?auto_129756 ?auto_129760 ) ) ( not ( = ?auto_129756 ?auto_129755 ) ) ( not ( = ?auto_129756 ?auto_129759 ) ) ( not ( = ?auto_129756 ?auto_129758 ) ) ( not ( = ?auto_129756 ?auto_129761 ) ) ( ON ?auto_129754 ?auto_129753 ) ( ON-TABLE ?auto_129756 ) ( ON ?auto_129757 ?auto_129754 ) ( ON ?auto_129761 ?auto_129757 ) ( CLEAR ?auto_129759 ) ( ON ?auto_129758 ?auto_129761 ) ( CLEAR ?auto_129758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129756 ?auto_129753 ?auto_129754 ?auto_129757 ?auto_129761 )
      ( MAKE-2PILE ?auto_129753 ?auto_129754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129762 - BLOCK
      ?auto_129763 - BLOCK
    )
    :vars
    (
      ?auto_129766 - BLOCK
      ?auto_129767 - BLOCK
      ?auto_129769 - BLOCK
      ?auto_129770 - BLOCK
      ?auto_129765 - BLOCK
      ?auto_129764 - BLOCK
      ?auto_129768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129762 ?auto_129763 ) ) ( not ( = ?auto_129762 ?auto_129766 ) ) ( not ( = ?auto_129763 ?auto_129766 ) ) ( ON ?auto_129762 ?auto_129767 ) ( not ( = ?auto_129762 ?auto_129767 ) ) ( not ( = ?auto_129763 ?auto_129767 ) ) ( not ( = ?auto_129766 ?auto_129767 ) ) ( ON-TABLE ?auto_129769 ) ( ON ?auto_129770 ?auto_129769 ) ( not ( = ?auto_129769 ?auto_129770 ) ) ( not ( = ?auto_129769 ?auto_129765 ) ) ( not ( = ?auto_129769 ?auto_129764 ) ) ( not ( = ?auto_129769 ?auto_129768 ) ) ( not ( = ?auto_129769 ?auto_129766 ) ) ( not ( = ?auto_129769 ?auto_129763 ) ) ( not ( = ?auto_129770 ?auto_129765 ) ) ( not ( = ?auto_129770 ?auto_129764 ) ) ( not ( = ?auto_129770 ?auto_129768 ) ) ( not ( = ?auto_129770 ?auto_129766 ) ) ( not ( = ?auto_129770 ?auto_129763 ) ) ( not ( = ?auto_129765 ?auto_129764 ) ) ( not ( = ?auto_129765 ?auto_129768 ) ) ( not ( = ?auto_129765 ?auto_129766 ) ) ( not ( = ?auto_129765 ?auto_129763 ) ) ( not ( = ?auto_129764 ?auto_129768 ) ) ( not ( = ?auto_129764 ?auto_129766 ) ) ( not ( = ?auto_129764 ?auto_129763 ) ) ( not ( = ?auto_129768 ?auto_129766 ) ) ( not ( = ?auto_129768 ?auto_129763 ) ) ( not ( = ?auto_129762 ?auto_129769 ) ) ( not ( = ?auto_129762 ?auto_129770 ) ) ( not ( = ?auto_129762 ?auto_129765 ) ) ( not ( = ?auto_129762 ?auto_129764 ) ) ( not ( = ?auto_129762 ?auto_129768 ) ) ( not ( = ?auto_129767 ?auto_129769 ) ) ( not ( = ?auto_129767 ?auto_129770 ) ) ( not ( = ?auto_129767 ?auto_129765 ) ) ( not ( = ?auto_129767 ?auto_129764 ) ) ( not ( = ?auto_129767 ?auto_129768 ) ) ( ON ?auto_129763 ?auto_129762 ) ( ON-TABLE ?auto_129767 ) ( ON ?auto_129766 ?auto_129763 ) ( ON ?auto_129768 ?auto_129766 ) ( ON ?auto_129764 ?auto_129768 ) ( CLEAR ?auto_129764 ) ( HOLDING ?auto_129765 ) ( CLEAR ?auto_129770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129769 ?auto_129770 ?auto_129765 )
      ( MAKE-2PILE ?auto_129762 ?auto_129763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129771 - BLOCK
      ?auto_129772 - BLOCK
    )
    :vars
    (
      ?auto_129774 - BLOCK
      ?auto_129779 - BLOCK
      ?auto_129778 - BLOCK
      ?auto_129776 - BLOCK
      ?auto_129773 - BLOCK
      ?auto_129775 - BLOCK
      ?auto_129777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129771 ?auto_129772 ) ) ( not ( = ?auto_129771 ?auto_129774 ) ) ( not ( = ?auto_129772 ?auto_129774 ) ) ( ON ?auto_129771 ?auto_129779 ) ( not ( = ?auto_129771 ?auto_129779 ) ) ( not ( = ?auto_129772 ?auto_129779 ) ) ( not ( = ?auto_129774 ?auto_129779 ) ) ( ON-TABLE ?auto_129778 ) ( ON ?auto_129776 ?auto_129778 ) ( not ( = ?auto_129778 ?auto_129776 ) ) ( not ( = ?auto_129778 ?auto_129773 ) ) ( not ( = ?auto_129778 ?auto_129775 ) ) ( not ( = ?auto_129778 ?auto_129777 ) ) ( not ( = ?auto_129778 ?auto_129774 ) ) ( not ( = ?auto_129778 ?auto_129772 ) ) ( not ( = ?auto_129776 ?auto_129773 ) ) ( not ( = ?auto_129776 ?auto_129775 ) ) ( not ( = ?auto_129776 ?auto_129777 ) ) ( not ( = ?auto_129776 ?auto_129774 ) ) ( not ( = ?auto_129776 ?auto_129772 ) ) ( not ( = ?auto_129773 ?auto_129775 ) ) ( not ( = ?auto_129773 ?auto_129777 ) ) ( not ( = ?auto_129773 ?auto_129774 ) ) ( not ( = ?auto_129773 ?auto_129772 ) ) ( not ( = ?auto_129775 ?auto_129777 ) ) ( not ( = ?auto_129775 ?auto_129774 ) ) ( not ( = ?auto_129775 ?auto_129772 ) ) ( not ( = ?auto_129777 ?auto_129774 ) ) ( not ( = ?auto_129777 ?auto_129772 ) ) ( not ( = ?auto_129771 ?auto_129778 ) ) ( not ( = ?auto_129771 ?auto_129776 ) ) ( not ( = ?auto_129771 ?auto_129773 ) ) ( not ( = ?auto_129771 ?auto_129775 ) ) ( not ( = ?auto_129771 ?auto_129777 ) ) ( not ( = ?auto_129779 ?auto_129778 ) ) ( not ( = ?auto_129779 ?auto_129776 ) ) ( not ( = ?auto_129779 ?auto_129773 ) ) ( not ( = ?auto_129779 ?auto_129775 ) ) ( not ( = ?auto_129779 ?auto_129777 ) ) ( ON ?auto_129772 ?auto_129771 ) ( ON-TABLE ?auto_129779 ) ( ON ?auto_129774 ?auto_129772 ) ( ON ?auto_129777 ?auto_129774 ) ( ON ?auto_129775 ?auto_129777 ) ( CLEAR ?auto_129776 ) ( ON ?auto_129773 ?auto_129775 ) ( CLEAR ?auto_129773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129779 ?auto_129771 ?auto_129772 ?auto_129774 ?auto_129777 ?auto_129775 )
      ( MAKE-2PILE ?auto_129771 ?auto_129772 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129780 - BLOCK
      ?auto_129781 - BLOCK
    )
    :vars
    (
      ?auto_129782 - BLOCK
      ?auto_129785 - BLOCK
      ?auto_129786 - BLOCK
      ?auto_129788 - BLOCK
      ?auto_129783 - BLOCK
      ?auto_129784 - BLOCK
      ?auto_129787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129780 ?auto_129781 ) ) ( not ( = ?auto_129780 ?auto_129782 ) ) ( not ( = ?auto_129781 ?auto_129782 ) ) ( ON ?auto_129780 ?auto_129785 ) ( not ( = ?auto_129780 ?auto_129785 ) ) ( not ( = ?auto_129781 ?auto_129785 ) ) ( not ( = ?auto_129782 ?auto_129785 ) ) ( ON-TABLE ?auto_129786 ) ( not ( = ?auto_129786 ?auto_129788 ) ) ( not ( = ?auto_129786 ?auto_129783 ) ) ( not ( = ?auto_129786 ?auto_129784 ) ) ( not ( = ?auto_129786 ?auto_129787 ) ) ( not ( = ?auto_129786 ?auto_129782 ) ) ( not ( = ?auto_129786 ?auto_129781 ) ) ( not ( = ?auto_129788 ?auto_129783 ) ) ( not ( = ?auto_129788 ?auto_129784 ) ) ( not ( = ?auto_129788 ?auto_129787 ) ) ( not ( = ?auto_129788 ?auto_129782 ) ) ( not ( = ?auto_129788 ?auto_129781 ) ) ( not ( = ?auto_129783 ?auto_129784 ) ) ( not ( = ?auto_129783 ?auto_129787 ) ) ( not ( = ?auto_129783 ?auto_129782 ) ) ( not ( = ?auto_129783 ?auto_129781 ) ) ( not ( = ?auto_129784 ?auto_129787 ) ) ( not ( = ?auto_129784 ?auto_129782 ) ) ( not ( = ?auto_129784 ?auto_129781 ) ) ( not ( = ?auto_129787 ?auto_129782 ) ) ( not ( = ?auto_129787 ?auto_129781 ) ) ( not ( = ?auto_129780 ?auto_129786 ) ) ( not ( = ?auto_129780 ?auto_129788 ) ) ( not ( = ?auto_129780 ?auto_129783 ) ) ( not ( = ?auto_129780 ?auto_129784 ) ) ( not ( = ?auto_129780 ?auto_129787 ) ) ( not ( = ?auto_129785 ?auto_129786 ) ) ( not ( = ?auto_129785 ?auto_129788 ) ) ( not ( = ?auto_129785 ?auto_129783 ) ) ( not ( = ?auto_129785 ?auto_129784 ) ) ( not ( = ?auto_129785 ?auto_129787 ) ) ( ON ?auto_129781 ?auto_129780 ) ( ON-TABLE ?auto_129785 ) ( ON ?auto_129782 ?auto_129781 ) ( ON ?auto_129787 ?auto_129782 ) ( ON ?auto_129784 ?auto_129787 ) ( ON ?auto_129783 ?auto_129784 ) ( CLEAR ?auto_129783 ) ( HOLDING ?auto_129788 ) ( CLEAR ?auto_129786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129786 ?auto_129788 )
      ( MAKE-2PILE ?auto_129780 ?auto_129781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129789 - BLOCK
      ?auto_129790 - BLOCK
    )
    :vars
    (
      ?auto_129793 - BLOCK
      ?auto_129796 - BLOCK
      ?auto_129797 - BLOCK
      ?auto_129794 - BLOCK
      ?auto_129791 - BLOCK
      ?auto_129792 - BLOCK
      ?auto_129795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129789 ?auto_129790 ) ) ( not ( = ?auto_129789 ?auto_129793 ) ) ( not ( = ?auto_129790 ?auto_129793 ) ) ( ON ?auto_129789 ?auto_129796 ) ( not ( = ?auto_129789 ?auto_129796 ) ) ( not ( = ?auto_129790 ?auto_129796 ) ) ( not ( = ?auto_129793 ?auto_129796 ) ) ( ON-TABLE ?auto_129797 ) ( not ( = ?auto_129797 ?auto_129794 ) ) ( not ( = ?auto_129797 ?auto_129791 ) ) ( not ( = ?auto_129797 ?auto_129792 ) ) ( not ( = ?auto_129797 ?auto_129795 ) ) ( not ( = ?auto_129797 ?auto_129793 ) ) ( not ( = ?auto_129797 ?auto_129790 ) ) ( not ( = ?auto_129794 ?auto_129791 ) ) ( not ( = ?auto_129794 ?auto_129792 ) ) ( not ( = ?auto_129794 ?auto_129795 ) ) ( not ( = ?auto_129794 ?auto_129793 ) ) ( not ( = ?auto_129794 ?auto_129790 ) ) ( not ( = ?auto_129791 ?auto_129792 ) ) ( not ( = ?auto_129791 ?auto_129795 ) ) ( not ( = ?auto_129791 ?auto_129793 ) ) ( not ( = ?auto_129791 ?auto_129790 ) ) ( not ( = ?auto_129792 ?auto_129795 ) ) ( not ( = ?auto_129792 ?auto_129793 ) ) ( not ( = ?auto_129792 ?auto_129790 ) ) ( not ( = ?auto_129795 ?auto_129793 ) ) ( not ( = ?auto_129795 ?auto_129790 ) ) ( not ( = ?auto_129789 ?auto_129797 ) ) ( not ( = ?auto_129789 ?auto_129794 ) ) ( not ( = ?auto_129789 ?auto_129791 ) ) ( not ( = ?auto_129789 ?auto_129792 ) ) ( not ( = ?auto_129789 ?auto_129795 ) ) ( not ( = ?auto_129796 ?auto_129797 ) ) ( not ( = ?auto_129796 ?auto_129794 ) ) ( not ( = ?auto_129796 ?auto_129791 ) ) ( not ( = ?auto_129796 ?auto_129792 ) ) ( not ( = ?auto_129796 ?auto_129795 ) ) ( ON ?auto_129790 ?auto_129789 ) ( ON-TABLE ?auto_129796 ) ( ON ?auto_129793 ?auto_129790 ) ( ON ?auto_129795 ?auto_129793 ) ( ON ?auto_129792 ?auto_129795 ) ( ON ?auto_129791 ?auto_129792 ) ( CLEAR ?auto_129797 ) ( ON ?auto_129794 ?auto_129791 ) ( CLEAR ?auto_129794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129796 ?auto_129789 ?auto_129790 ?auto_129793 ?auto_129795 ?auto_129792 ?auto_129791 )
      ( MAKE-2PILE ?auto_129789 ?auto_129790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129798 - BLOCK
      ?auto_129799 - BLOCK
    )
    :vars
    (
      ?auto_129801 - BLOCK
      ?auto_129805 - BLOCK
      ?auto_129800 - BLOCK
      ?auto_129802 - BLOCK
      ?auto_129803 - BLOCK
      ?auto_129806 - BLOCK
      ?auto_129804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129798 ?auto_129799 ) ) ( not ( = ?auto_129798 ?auto_129801 ) ) ( not ( = ?auto_129799 ?auto_129801 ) ) ( ON ?auto_129798 ?auto_129805 ) ( not ( = ?auto_129798 ?auto_129805 ) ) ( not ( = ?auto_129799 ?auto_129805 ) ) ( not ( = ?auto_129801 ?auto_129805 ) ) ( not ( = ?auto_129800 ?auto_129802 ) ) ( not ( = ?auto_129800 ?auto_129803 ) ) ( not ( = ?auto_129800 ?auto_129806 ) ) ( not ( = ?auto_129800 ?auto_129804 ) ) ( not ( = ?auto_129800 ?auto_129801 ) ) ( not ( = ?auto_129800 ?auto_129799 ) ) ( not ( = ?auto_129802 ?auto_129803 ) ) ( not ( = ?auto_129802 ?auto_129806 ) ) ( not ( = ?auto_129802 ?auto_129804 ) ) ( not ( = ?auto_129802 ?auto_129801 ) ) ( not ( = ?auto_129802 ?auto_129799 ) ) ( not ( = ?auto_129803 ?auto_129806 ) ) ( not ( = ?auto_129803 ?auto_129804 ) ) ( not ( = ?auto_129803 ?auto_129801 ) ) ( not ( = ?auto_129803 ?auto_129799 ) ) ( not ( = ?auto_129806 ?auto_129804 ) ) ( not ( = ?auto_129806 ?auto_129801 ) ) ( not ( = ?auto_129806 ?auto_129799 ) ) ( not ( = ?auto_129804 ?auto_129801 ) ) ( not ( = ?auto_129804 ?auto_129799 ) ) ( not ( = ?auto_129798 ?auto_129800 ) ) ( not ( = ?auto_129798 ?auto_129802 ) ) ( not ( = ?auto_129798 ?auto_129803 ) ) ( not ( = ?auto_129798 ?auto_129806 ) ) ( not ( = ?auto_129798 ?auto_129804 ) ) ( not ( = ?auto_129805 ?auto_129800 ) ) ( not ( = ?auto_129805 ?auto_129802 ) ) ( not ( = ?auto_129805 ?auto_129803 ) ) ( not ( = ?auto_129805 ?auto_129806 ) ) ( not ( = ?auto_129805 ?auto_129804 ) ) ( ON ?auto_129799 ?auto_129798 ) ( ON-TABLE ?auto_129805 ) ( ON ?auto_129801 ?auto_129799 ) ( ON ?auto_129804 ?auto_129801 ) ( ON ?auto_129806 ?auto_129804 ) ( ON ?auto_129803 ?auto_129806 ) ( ON ?auto_129802 ?auto_129803 ) ( CLEAR ?auto_129802 ) ( HOLDING ?auto_129800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129800 )
      ( MAKE-2PILE ?auto_129798 ?auto_129799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129807 - BLOCK
      ?auto_129808 - BLOCK
    )
    :vars
    (
      ?auto_129810 - BLOCK
      ?auto_129811 - BLOCK
      ?auto_129814 - BLOCK
      ?auto_129815 - BLOCK
      ?auto_129813 - BLOCK
      ?auto_129809 - BLOCK
      ?auto_129812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129807 ?auto_129808 ) ) ( not ( = ?auto_129807 ?auto_129810 ) ) ( not ( = ?auto_129808 ?auto_129810 ) ) ( ON ?auto_129807 ?auto_129811 ) ( not ( = ?auto_129807 ?auto_129811 ) ) ( not ( = ?auto_129808 ?auto_129811 ) ) ( not ( = ?auto_129810 ?auto_129811 ) ) ( not ( = ?auto_129814 ?auto_129815 ) ) ( not ( = ?auto_129814 ?auto_129813 ) ) ( not ( = ?auto_129814 ?auto_129809 ) ) ( not ( = ?auto_129814 ?auto_129812 ) ) ( not ( = ?auto_129814 ?auto_129810 ) ) ( not ( = ?auto_129814 ?auto_129808 ) ) ( not ( = ?auto_129815 ?auto_129813 ) ) ( not ( = ?auto_129815 ?auto_129809 ) ) ( not ( = ?auto_129815 ?auto_129812 ) ) ( not ( = ?auto_129815 ?auto_129810 ) ) ( not ( = ?auto_129815 ?auto_129808 ) ) ( not ( = ?auto_129813 ?auto_129809 ) ) ( not ( = ?auto_129813 ?auto_129812 ) ) ( not ( = ?auto_129813 ?auto_129810 ) ) ( not ( = ?auto_129813 ?auto_129808 ) ) ( not ( = ?auto_129809 ?auto_129812 ) ) ( not ( = ?auto_129809 ?auto_129810 ) ) ( not ( = ?auto_129809 ?auto_129808 ) ) ( not ( = ?auto_129812 ?auto_129810 ) ) ( not ( = ?auto_129812 ?auto_129808 ) ) ( not ( = ?auto_129807 ?auto_129814 ) ) ( not ( = ?auto_129807 ?auto_129815 ) ) ( not ( = ?auto_129807 ?auto_129813 ) ) ( not ( = ?auto_129807 ?auto_129809 ) ) ( not ( = ?auto_129807 ?auto_129812 ) ) ( not ( = ?auto_129811 ?auto_129814 ) ) ( not ( = ?auto_129811 ?auto_129815 ) ) ( not ( = ?auto_129811 ?auto_129813 ) ) ( not ( = ?auto_129811 ?auto_129809 ) ) ( not ( = ?auto_129811 ?auto_129812 ) ) ( ON ?auto_129808 ?auto_129807 ) ( ON-TABLE ?auto_129811 ) ( ON ?auto_129810 ?auto_129808 ) ( ON ?auto_129812 ?auto_129810 ) ( ON ?auto_129809 ?auto_129812 ) ( ON ?auto_129813 ?auto_129809 ) ( ON ?auto_129815 ?auto_129813 ) ( ON ?auto_129814 ?auto_129815 ) ( CLEAR ?auto_129814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_129811 ?auto_129807 ?auto_129808 ?auto_129810 ?auto_129812 ?auto_129809 ?auto_129813 ?auto_129815 )
      ( MAKE-2PILE ?auto_129807 ?auto_129808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129843 - BLOCK
      ?auto_129844 - BLOCK
      ?auto_129845 - BLOCK
      ?auto_129846 - BLOCK
      ?auto_129847 - BLOCK
    )
    :vars
    (
      ?auto_129850 - BLOCK
      ?auto_129849 - BLOCK
      ?auto_129848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129850 ?auto_129847 ) ( ON-TABLE ?auto_129843 ) ( ON ?auto_129844 ?auto_129843 ) ( ON ?auto_129845 ?auto_129844 ) ( ON ?auto_129846 ?auto_129845 ) ( ON ?auto_129847 ?auto_129846 ) ( not ( = ?auto_129843 ?auto_129844 ) ) ( not ( = ?auto_129843 ?auto_129845 ) ) ( not ( = ?auto_129843 ?auto_129846 ) ) ( not ( = ?auto_129843 ?auto_129847 ) ) ( not ( = ?auto_129843 ?auto_129850 ) ) ( not ( = ?auto_129844 ?auto_129845 ) ) ( not ( = ?auto_129844 ?auto_129846 ) ) ( not ( = ?auto_129844 ?auto_129847 ) ) ( not ( = ?auto_129844 ?auto_129850 ) ) ( not ( = ?auto_129845 ?auto_129846 ) ) ( not ( = ?auto_129845 ?auto_129847 ) ) ( not ( = ?auto_129845 ?auto_129850 ) ) ( not ( = ?auto_129846 ?auto_129847 ) ) ( not ( = ?auto_129846 ?auto_129850 ) ) ( not ( = ?auto_129847 ?auto_129850 ) ) ( not ( = ?auto_129843 ?auto_129849 ) ) ( not ( = ?auto_129843 ?auto_129848 ) ) ( not ( = ?auto_129844 ?auto_129849 ) ) ( not ( = ?auto_129844 ?auto_129848 ) ) ( not ( = ?auto_129845 ?auto_129849 ) ) ( not ( = ?auto_129845 ?auto_129848 ) ) ( not ( = ?auto_129846 ?auto_129849 ) ) ( not ( = ?auto_129846 ?auto_129848 ) ) ( not ( = ?auto_129847 ?auto_129849 ) ) ( not ( = ?auto_129847 ?auto_129848 ) ) ( not ( = ?auto_129850 ?auto_129849 ) ) ( not ( = ?auto_129850 ?auto_129848 ) ) ( not ( = ?auto_129849 ?auto_129848 ) ) ( ON ?auto_129849 ?auto_129850 ) ( CLEAR ?auto_129849 ) ( HOLDING ?auto_129848 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129848 )
      ( MAKE-5PILE ?auto_129843 ?auto_129844 ?auto_129845 ?auto_129846 ?auto_129847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_129956 - BLOCK
      ?auto_129957 - BLOCK
      ?auto_129958 - BLOCK
    )
    :vars
    (
      ?auto_129959 - BLOCK
      ?auto_129960 - BLOCK
      ?auto_129963 - BLOCK
      ?auto_129962 - BLOCK
      ?auto_129961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129956 ) ( not ( = ?auto_129956 ?auto_129957 ) ) ( not ( = ?auto_129956 ?auto_129958 ) ) ( not ( = ?auto_129957 ?auto_129958 ) ) ( ON ?auto_129958 ?auto_129959 ) ( not ( = ?auto_129956 ?auto_129959 ) ) ( not ( = ?auto_129957 ?auto_129959 ) ) ( not ( = ?auto_129958 ?auto_129959 ) ) ( CLEAR ?auto_129956 ) ( ON ?auto_129957 ?auto_129958 ) ( CLEAR ?auto_129957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129960 ) ( ON ?auto_129963 ?auto_129960 ) ( ON ?auto_129962 ?auto_129963 ) ( ON ?auto_129961 ?auto_129962 ) ( ON ?auto_129959 ?auto_129961 ) ( not ( = ?auto_129960 ?auto_129963 ) ) ( not ( = ?auto_129960 ?auto_129962 ) ) ( not ( = ?auto_129960 ?auto_129961 ) ) ( not ( = ?auto_129960 ?auto_129959 ) ) ( not ( = ?auto_129960 ?auto_129958 ) ) ( not ( = ?auto_129960 ?auto_129957 ) ) ( not ( = ?auto_129963 ?auto_129962 ) ) ( not ( = ?auto_129963 ?auto_129961 ) ) ( not ( = ?auto_129963 ?auto_129959 ) ) ( not ( = ?auto_129963 ?auto_129958 ) ) ( not ( = ?auto_129963 ?auto_129957 ) ) ( not ( = ?auto_129962 ?auto_129961 ) ) ( not ( = ?auto_129962 ?auto_129959 ) ) ( not ( = ?auto_129962 ?auto_129958 ) ) ( not ( = ?auto_129962 ?auto_129957 ) ) ( not ( = ?auto_129961 ?auto_129959 ) ) ( not ( = ?auto_129961 ?auto_129958 ) ) ( not ( = ?auto_129961 ?auto_129957 ) ) ( not ( = ?auto_129956 ?auto_129960 ) ) ( not ( = ?auto_129956 ?auto_129963 ) ) ( not ( = ?auto_129956 ?auto_129962 ) ) ( not ( = ?auto_129956 ?auto_129961 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129960 ?auto_129963 ?auto_129962 ?auto_129961 ?auto_129959 ?auto_129958 )
      ( MAKE-3PILE ?auto_129956 ?auto_129957 ?auto_129958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_129964 - BLOCK
      ?auto_129965 - BLOCK
      ?auto_129966 - BLOCK
    )
    :vars
    (
      ?auto_129967 - BLOCK
      ?auto_129968 - BLOCK
      ?auto_129970 - BLOCK
      ?auto_129971 - BLOCK
      ?auto_129969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129964 ?auto_129965 ) ) ( not ( = ?auto_129964 ?auto_129966 ) ) ( not ( = ?auto_129965 ?auto_129966 ) ) ( ON ?auto_129966 ?auto_129967 ) ( not ( = ?auto_129964 ?auto_129967 ) ) ( not ( = ?auto_129965 ?auto_129967 ) ) ( not ( = ?auto_129966 ?auto_129967 ) ) ( ON ?auto_129965 ?auto_129966 ) ( CLEAR ?auto_129965 ) ( ON-TABLE ?auto_129968 ) ( ON ?auto_129970 ?auto_129968 ) ( ON ?auto_129971 ?auto_129970 ) ( ON ?auto_129969 ?auto_129971 ) ( ON ?auto_129967 ?auto_129969 ) ( not ( = ?auto_129968 ?auto_129970 ) ) ( not ( = ?auto_129968 ?auto_129971 ) ) ( not ( = ?auto_129968 ?auto_129969 ) ) ( not ( = ?auto_129968 ?auto_129967 ) ) ( not ( = ?auto_129968 ?auto_129966 ) ) ( not ( = ?auto_129968 ?auto_129965 ) ) ( not ( = ?auto_129970 ?auto_129971 ) ) ( not ( = ?auto_129970 ?auto_129969 ) ) ( not ( = ?auto_129970 ?auto_129967 ) ) ( not ( = ?auto_129970 ?auto_129966 ) ) ( not ( = ?auto_129970 ?auto_129965 ) ) ( not ( = ?auto_129971 ?auto_129969 ) ) ( not ( = ?auto_129971 ?auto_129967 ) ) ( not ( = ?auto_129971 ?auto_129966 ) ) ( not ( = ?auto_129971 ?auto_129965 ) ) ( not ( = ?auto_129969 ?auto_129967 ) ) ( not ( = ?auto_129969 ?auto_129966 ) ) ( not ( = ?auto_129969 ?auto_129965 ) ) ( not ( = ?auto_129964 ?auto_129968 ) ) ( not ( = ?auto_129964 ?auto_129970 ) ) ( not ( = ?auto_129964 ?auto_129971 ) ) ( not ( = ?auto_129964 ?auto_129969 ) ) ( HOLDING ?auto_129964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129964 )
      ( MAKE-3PILE ?auto_129964 ?auto_129965 ?auto_129966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_129972 - BLOCK
      ?auto_129973 - BLOCK
      ?auto_129974 - BLOCK
    )
    :vars
    (
      ?auto_129979 - BLOCK
      ?auto_129976 - BLOCK
      ?auto_129977 - BLOCK
      ?auto_129975 - BLOCK
      ?auto_129978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129972 ?auto_129973 ) ) ( not ( = ?auto_129972 ?auto_129974 ) ) ( not ( = ?auto_129973 ?auto_129974 ) ) ( ON ?auto_129974 ?auto_129979 ) ( not ( = ?auto_129972 ?auto_129979 ) ) ( not ( = ?auto_129973 ?auto_129979 ) ) ( not ( = ?auto_129974 ?auto_129979 ) ) ( ON ?auto_129973 ?auto_129974 ) ( ON-TABLE ?auto_129976 ) ( ON ?auto_129977 ?auto_129976 ) ( ON ?auto_129975 ?auto_129977 ) ( ON ?auto_129978 ?auto_129975 ) ( ON ?auto_129979 ?auto_129978 ) ( not ( = ?auto_129976 ?auto_129977 ) ) ( not ( = ?auto_129976 ?auto_129975 ) ) ( not ( = ?auto_129976 ?auto_129978 ) ) ( not ( = ?auto_129976 ?auto_129979 ) ) ( not ( = ?auto_129976 ?auto_129974 ) ) ( not ( = ?auto_129976 ?auto_129973 ) ) ( not ( = ?auto_129977 ?auto_129975 ) ) ( not ( = ?auto_129977 ?auto_129978 ) ) ( not ( = ?auto_129977 ?auto_129979 ) ) ( not ( = ?auto_129977 ?auto_129974 ) ) ( not ( = ?auto_129977 ?auto_129973 ) ) ( not ( = ?auto_129975 ?auto_129978 ) ) ( not ( = ?auto_129975 ?auto_129979 ) ) ( not ( = ?auto_129975 ?auto_129974 ) ) ( not ( = ?auto_129975 ?auto_129973 ) ) ( not ( = ?auto_129978 ?auto_129979 ) ) ( not ( = ?auto_129978 ?auto_129974 ) ) ( not ( = ?auto_129978 ?auto_129973 ) ) ( not ( = ?auto_129972 ?auto_129976 ) ) ( not ( = ?auto_129972 ?auto_129977 ) ) ( not ( = ?auto_129972 ?auto_129975 ) ) ( not ( = ?auto_129972 ?auto_129978 ) ) ( ON ?auto_129972 ?auto_129973 ) ( CLEAR ?auto_129972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129976 ?auto_129977 ?auto_129975 ?auto_129978 ?auto_129979 ?auto_129974 ?auto_129973 )
      ( MAKE-3PILE ?auto_129972 ?auto_129973 ?auto_129974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_129983 - BLOCK
      ?auto_129984 - BLOCK
      ?auto_129985 - BLOCK
    )
    :vars
    (
      ?auto_129990 - BLOCK
      ?auto_129989 - BLOCK
      ?auto_129986 - BLOCK
      ?auto_129987 - BLOCK
      ?auto_129988 - BLOCK
      ?auto_129991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129983 ?auto_129984 ) ) ( not ( = ?auto_129983 ?auto_129985 ) ) ( not ( = ?auto_129984 ?auto_129985 ) ) ( ON ?auto_129985 ?auto_129990 ) ( not ( = ?auto_129983 ?auto_129990 ) ) ( not ( = ?auto_129984 ?auto_129990 ) ) ( not ( = ?auto_129985 ?auto_129990 ) ) ( ON ?auto_129984 ?auto_129985 ) ( CLEAR ?auto_129984 ) ( ON-TABLE ?auto_129989 ) ( ON ?auto_129986 ?auto_129989 ) ( ON ?auto_129987 ?auto_129986 ) ( ON ?auto_129988 ?auto_129987 ) ( ON ?auto_129990 ?auto_129988 ) ( not ( = ?auto_129989 ?auto_129986 ) ) ( not ( = ?auto_129989 ?auto_129987 ) ) ( not ( = ?auto_129989 ?auto_129988 ) ) ( not ( = ?auto_129989 ?auto_129990 ) ) ( not ( = ?auto_129989 ?auto_129985 ) ) ( not ( = ?auto_129989 ?auto_129984 ) ) ( not ( = ?auto_129986 ?auto_129987 ) ) ( not ( = ?auto_129986 ?auto_129988 ) ) ( not ( = ?auto_129986 ?auto_129990 ) ) ( not ( = ?auto_129986 ?auto_129985 ) ) ( not ( = ?auto_129986 ?auto_129984 ) ) ( not ( = ?auto_129987 ?auto_129988 ) ) ( not ( = ?auto_129987 ?auto_129990 ) ) ( not ( = ?auto_129987 ?auto_129985 ) ) ( not ( = ?auto_129987 ?auto_129984 ) ) ( not ( = ?auto_129988 ?auto_129990 ) ) ( not ( = ?auto_129988 ?auto_129985 ) ) ( not ( = ?auto_129988 ?auto_129984 ) ) ( not ( = ?auto_129983 ?auto_129989 ) ) ( not ( = ?auto_129983 ?auto_129986 ) ) ( not ( = ?auto_129983 ?auto_129987 ) ) ( not ( = ?auto_129983 ?auto_129988 ) ) ( ON ?auto_129983 ?auto_129991 ) ( CLEAR ?auto_129983 ) ( HAND-EMPTY ) ( not ( = ?auto_129983 ?auto_129991 ) ) ( not ( = ?auto_129984 ?auto_129991 ) ) ( not ( = ?auto_129985 ?auto_129991 ) ) ( not ( = ?auto_129990 ?auto_129991 ) ) ( not ( = ?auto_129989 ?auto_129991 ) ) ( not ( = ?auto_129986 ?auto_129991 ) ) ( not ( = ?auto_129987 ?auto_129991 ) ) ( not ( = ?auto_129988 ?auto_129991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129983 ?auto_129991 )
      ( MAKE-3PILE ?auto_129983 ?auto_129984 ?auto_129985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_129992 - BLOCK
      ?auto_129993 - BLOCK
      ?auto_129994 - BLOCK
    )
    :vars
    (
      ?auto_129997 - BLOCK
      ?auto_129996 - BLOCK
      ?auto_129999 - BLOCK
      ?auto_129995 - BLOCK
      ?auto_130000 - BLOCK
      ?auto_129998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129992 ?auto_129993 ) ) ( not ( = ?auto_129992 ?auto_129994 ) ) ( not ( = ?auto_129993 ?auto_129994 ) ) ( ON ?auto_129994 ?auto_129997 ) ( not ( = ?auto_129992 ?auto_129997 ) ) ( not ( = ?auto_129993 ?auto_129997 ) ) ( not ( = ?auto_129994 ?auto_129997 ) ) ( ON-TABLE ?auto_129996 ) ( ON ?auto_129999 ?auto_129996 ) ( ON ?auto_129995 ?auto_129999 ) ( ON ?auto_130000 ?auto_129995 ) ( ON ?auto_129997 ?auto_130000 ) ( not ( = ?auto_129996 ?auto_129999 ) ) ( not ( = ?auto_129996 ?auto_129995 ) ) ( not ( = ?auto_129996 ?auto_130000 ) ) ( not ( = ?auto_129996 ?auto_129997 ) ) ( not ( = ?auto_129996 ?auto_129994 ) ) ( not ( = ?auto_129996 ?auto_129993 ) ) ( not ( = ?auto_129999 ?auto_129995 ) ) ( not ( = ?auto_129999 ?auto_130000 ) ) ( not ( = ?auto_129999 ?auto_129997 ) ) ( not ( = ?auto_129999 ?auto_129994 ) ) ( not ( = ?auto_129999 ?auto_129993 ) ) ( not ( = ?auto_129995 ?auto_130000 ) ) ( not ( = ?auto_129995 ?auto_129997 ) ) ( not ( = ?auto_129995 ?auto_129994 ) ) ( not ( = ?auto_129995 ?auto_129993 ) ) ( not ( = ?auto_130000 ?auto_129997 ) ) ( not ( = ?auto_130000 ?auto_129994 ) ) ( not ( = ?auto_130000 ?auto_129993 ) ) ( not ( = ?auto_129992 ?auto_129996 ) ) ( not ( = ?auto_129992 ?auto_129999 ) ) ( not ( = ?auto_129992 ?auto_129995 ) ) ( not ( = ?auto_129992 ?auto_130000 ) ) ( ON ?auto_129992 ?auto_129998 ) ( CLEAR ?auto_129992 ) ( not ( = ?auto_129992 ?auto_129998 ) ) ( not ( = ?auto_129993 ?auto_129998 ) ) ( not ( = ?auto_129994 ?auto_129998 ) ) ( not ( = ?auto_129997 ?auto_129998 ) ) ( not ( = ?auto_129996 ?auto_129998 ) ) ( not ( = ?auto_129999 ?auto_129998 ) ) ( not ( = ?auto_129995 ?auto_129998 ) ) ( not ( = ?auto_130000 ?auto_129998 ) ) ( HOLDING ?auto_129993 ) ( CLEAR ?auto_129994 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129996 ?auto_129999 ?auto_129995 ?auto_130000 ?auto_129997 ?auto_129994 ?auto_129993 )
      ( MAKE-3PILE ?auto_129992 ?auto_129993 ?auto_129994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130001 - BLOCK
      ?auto_130002 - BLOCK
      ?auto_130003 - BLOCK
    )
    :vars
    (
      ?auto_130006 - BLOCK
      ?auto_130007 - BLOCK
      ?auto_130009 - BLOCK
      ?auto_130008 - BLOCK
      ?auto_130004 - BLOCK
      ?auto_130005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130001 ?auto_130002 ) ) ( not ( = ?auto_130001 ?auto_130003 ) ) ( not ( = ?auto_130002 ?auto_130003 ) ) ( ON ?auto_130003 ?auto_130006 ) ( not ( = ?auto_130001 ?auto_130006 ) ) ( not ( = ?auto_130002 ?auto_130006 ) ) ( not ( = ?auto_130003 ?auto_130006 ) ) ( ON-TABLE ?auto_130007 ) ( ON ?auto_130009 ?auto_130007 ) ( ON ?auto_130008 ?auto_130009 ) ( ON ?auto_130004 ?auto_130008 ) ( ON ?auto_130006 ?auto_130004 ) ( not ( = ?auto_130007 ?auto_130009 ) ) ( not ( = ?auto_130007 ?auto_130008 ) ) ( not ( = ?auto_130007 ?auto_130004 ) ) ( not ( = ?auto_130007 ?auto_130006 ) ) ( not ( = ?auto_130007 ?auto_130003 ) ) ( not ( = ?auto_130007 ?auto_130002 ) ) ( not ( = ?auto_130009 ?auto_130008 ) ) ( not ( = ?auto_130009 ?auto_130004 ) ) ( not ( = ?auto_130009 ?auto_130006 ) ) ( not ( = ?auto_130009 ?auto_130003 ) ) ( not ( = ?auto_130009 ?auto_130002 ) ) ( not ( = ?auto_130008 ?auto_130004 ) ) ( not ( = ?auto_130008 ?auto_130006 ) ) ( not ( = ?auto_130008 ?auto_130003 ) ) ( not ( = ?auto_130008 ?auto_130002 ) ) ( not ( = ?auto_130004 ?auto_130006 ) ) ( not ( = ?auto_130004 ?auto_130003 ) ) ( not ( = ?auto_130004 ?auto_130002 ) ) ( not ( = ?auto_130001 ?auto_130007 ) ) ( not ( = ?auto_130001 ?auto_130009 ) ) ( not ( = ?auto_130001 ?auto_130008 ) ) ( not ( = ?auto_130001 ?auto_130004 ) ) ( ON ?auto_130001 ?auto_130005 ) ( not ( = ?auto_130001 ?auto_130005 ) ) ( not ( = ?auto_130002 ?auto_130005 ) ) ( not ( = ?auto_130003 ?auto_130005 ) ) ( not ( = ?auto_130006 ?auto_130005 ) ) ( not ( = ?auto_130007 ?auto_130005 ) ) ( not ( = ?auto_130009 ?auto_130005 ) ) ( not ( = ?auto_130008 ?auto_130005 ) ) ( not ( = ?auto_130004 ?auto_130005 ) ) ( CLEAR ?auto_130003 ) ( ON ?auto_130002 ?auto_130001 ) ( CLEAR ?auto_130002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130005 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130005 ?auto_130001 )
      ( MAKE-3PILE ?auto_130001 ?auto_130002 ?auto_130003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130010 - BLOCK
      ?auto_130011 - BLOCK
      ?auto_130012 - BLOCK
    )
    :vars
    (
      ?auto_130018 - BLOCK
      ?auto_130013 - BLOCK
      ?auto_130016 - BLOCK
      ?auto_130015 - BLOCK
      ?auto_130014 - BLOCK
      ?auto_130017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130010 ?auto_130011 ) ) ( not ( = ?auto_130010 ?auto_130012 ) ) ( not ( = ?auto_130011 ?auto_130012 ) ) ( not ( = ?auto_130010 ?auto_130018 ) ) ( not ( = ?auto_130011 ?auto_130018 ) ) ( not ( = ?auto_130012 ?auto_130018 ) ) ( ON-TABLE ?auto_130013 ) ( ON ?auto_130016 ?auto_130013 ) ( ON ?auto_130015 ?auto_130016 ) ( ON ?auto_130014 ?auto_130015 ) ( ON ?auto_130018 ?auto_130014 ) ( not ( = ?auto_130013 ?auto_130016 ) ) ( not ( = ?auto_130013 ?auto_130015 ) ) ( not ( = ?auto_130013 ?auto_130014 ) ) ( not ( = ?auto_130013 ?auto_130018 ) ) ( not ( = ?auto_130013 ?auto_130012 ) ) ( not ( = ?auto_130013 ?auto_130011 ) ) ( not ( = ?auto_130016 ?auto_130015 ) ) ( not ( = ?auto_130016 ?auto_130014 ) ) ( not ( = ?auto_130016 ?auto_130018 ) ) ( not ( = ?auto_130016 ?auto_130012 ) ) ( not ( = ?auto_130016 ?auto_130011 ) ) ( not ( = ?auto_130015 ?auto_130014 ) ) ( not ( = ?auto_130015 ?auto_130018 ) ) ( not ( = ?auto_130015 ?auto_130012 ) ) ( not ( = ?auto_130015 ?auto_130011 ) ) ( not ( = ?auto_130014 ?auto_130018 ) ) ( not ( = ?auto_130014 ?auto_130012 ) ) ( not ( = ?auto_130014 ?auto_130011 ) ) ( not ( = ?auto_130010 ?auto_130013 ) ) ( not ( = ?auto_130010 ?auto_130016 ) ) ( not ( = ?auto_130010 ?auto_130015 ) ) ( not ( = ?auto_130010 ?auto_130014 ) ) ( ON ?auto_130010 ?auto_130017 ) ( not ( = ?auto_130010 ?auto_130017 ) ) ( not ( = ?auto_130011 ?auto_130017 ) ) ( not ( = ?auto_130012 ?auto_130017 ) ) ( not ( = ?auto_130018 ?auto_130017 ) ) ( not ( = ?auto_130013 ?auto_130017 ) ) ( not ( = ?auto_130016 ?auto_130017 ) ) ( not ( = ?auto_130015 ?auto_130017 ) ) ( not ( = ?auto_130014 ?auto_130017 ) ) ( ON ?auto_130011 ?auto_130010 ) ( CLEAR ?auto_130011 ) ( ON-TABLE ?auto_130017 ) ( HOLDING ?auto_130012 ) ( CLEAR ?auto_130018 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130013 ?auto_130016 ?auto_130015 ?auto_130014 ?auto_130018 ?auto_130012 )
      ( MAKE-3PILE ?auto_130010 ?auto_130011 ?auto_130012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130019 - BLOCK
      ?auto_130020 - BLOCK
      ?auto_130021 - BLOCK
    )
    :vars
    (
      ?auto_130027 - BLOCK
      ?auto_130023 - BLOCK
      ?auto_130025 - BLOCK
      ?auto_130022 - BLOCK
      ?auto_130024 - BLOCK
      ?auto_130026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130019 ?auto_130020 ) ) ( not ( = ?auto_130019 ?auto_130021 ) ) ( not ( = ?auto_130020 ?auto_130021 ) ) ( not ( = ?auto_130019 ?auto_130027 ) ) ( not ( = ?auto_130020 ?auto_130027 ) ) ( not ( = ?auto_130021 ?auto_130027 ) ) ( ON-TABLE ?auto_130023 ) ( ON ?auto_130025 ?auto_130023 ) ( ON ?auto_130022 ?auto_130025 ) ( ON ?auto_130024 ?auto_130022 ) ( ON ?auto_130027 ?auto_130024 ) ( not ( = ?auto_130023 ?auto_130025 ) ) ( not ( = ?auto_130023 ?auto_130022 ) ) ( not ( = ?auto_130023 ?auto_130024 ) ) ( not ( = ?auto_130023 ?auto_130027 ) ) ( not ( = ?auto_130023 ?auto_130021 ) ) ( not ( = ?auto_130023 ?auto_130020 ) ) ( not ( = ?auto_130025 ?auto_130022 ) ) ( not ( = ?auto_130025 ?auto_130024 ) ) ( not ( = ?auto_130025 ?auto_130027 ) ) ( not ( = ?auto_130025 ?auto_130021 ) ) ( not ( = ?auto_130025 ?auto_130020 ) ) ( not ( = ?auto_130022 ?auto_130024 ) ) ( not ( = ?auto_130022 ?auto_130027 ) ) ( not ( = ?auto_130022 ?auto_130021 ) ) ( not ( = ?auto_130022 ?auto_130020 ) ) ( not ( = ?auto_130024 ?auto_130027 ) ) ( not ( = ?auto_130024 ?auto_130021 ) ) ( not ( = ?auto_130024 ?auto_130020 ) ) ( not ( = ?auto_130019 ?auto_130023 ) ) ( not ( = ?auto_130019 ?auto_130025 ) ) ( not ( = ?auto_130019 ?auto_130022 ) ) ( not ( = ?auto_130019 ?auto_130024 ) ) ( ON ?auto_130019 ?auto_130026 ) ( not ( = ?auto_130019 ?auto_130026 ) ) ( not ( = ?auto_130020 ?auto_130026 ) ) ( not ( = ?auto_130021 ?auto_130026 ) ) ( not ( = ?auto_130027 ?auto_130026 ) ) ( not ( = ?auto_130023 ?auto_130026 ) ) ( not ( = ?auto_130025 ?auto_130026 ) ) ( not ( = ?auto_130022 ?auto_130026 ) ) ( not ( = ?auto_130024 ?auto_130026 ) ) ( ON ?auto_130020 ?auto_130019 ) ( ON-TABLE ?auto_130026 ) ( CLEAR ?auto_130027 ) ( ON ?auto_130021 ?auto_130020 ) ( CLEAR ?auto_130021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130026 ?auto_130019 ?auto_130020 )
      ( MAKE-3PILE ?auto_130019 ?auto_130020 ?auto_130021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130028 - BLOCK
      ?auto_130029 - BLOCK
      ?auto_130030 - BLOCK
    )
    :vars
    (
      ?auto_130036 - BLOCK
      ?auto_130035 - BLOCK
      ?auto_130032 - BLOCK
      ?auto_130034 - BLOCK
      ?auto_130033 - BLOCK
      ?auto_130031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130028 ?auto_130029 ) ) ( not ( = ?auto_130028 ?auto_130030 ) ) ( not ( = ?auto_130029 ?auto_130030 ) ) ( not ( = ?auto_130028 ?auto_130036 ) ) ( not ( = ?auto_130029 ?auto_130036 ) ) ( not ( = ?auto_130030 ?auto_130036 ) ) ( ON-TABLE ?auto_130035 ) ( ON ?auto_130032 ?auto_130035 ) ( ON ?auto_130034 ?auto_130032 ) ( ON ?auto_130033 ?auto_130034 ) ( not ( = ?auto_130035 ?auto_130032 ) ) ( not ( = ?auto_130035 ?auto_130034 ) ) ( not ( = ?auto_130035 ?auto_130033 ) ) ( not ( = ?auto_130035 ?auto_130036 ) ) ( not ( = ?auto_130035 ?auto_130030 ) ) ( not ( = ?auto_130035 ?auto_130029 ) ) ( not ( = ?auto_130032 ?auto_130034 ) ) ( not ( = ?auto_130032 ?auto_130033 ) ) ( not ( = ?auto_130032 ?auto_130036 ) ) ( not ( = ?auto_130032 ?auto_130030 ) ) ( not ( = ?auto_130032 ?auto_130029 ) ) ( not ( = ?auto_130034 ?auto_130033 ) ) ( not ( = ?auto_130034 ?auto_130036 ) ) ( not ( = ?auto_130034 ?auto_130030 ) ) ( not ( = ?auto_130034 ?auto_130029 ) ) ( not ( = ?auto_130033 ?auto_130036 ) ) ( not ( = ?auto_130033 ?auto_130030 ) ) ( not ( = ?auto_130033 ?auto_130029 ) ) ( not ( = ?auto_130028 ?auto_130035 ) ) ( not ( = ?auto_130028 ?auto_130032 ) ) ( not ( = ?auto_130028 ?auto_130034 ) ) ( not ( = ?auto_130028 ?auto_130033 ) ) ( ON ?auto_130028 ?auto_130031 ) ( not ( = ?auto_130028 ?auto_130031 ) ) ( not ( = ?auto_130029 ?auto_130031 ) ) ( not ( = ?auto_130030 ?auto_130031 ) ) ( not ( = ?auto_130036 ?auto_130031 ) ) ( not ( = ?auto_130035 ?auto_130031 ) ) ( not ( = ?auto_130032 ?auto_130031 ) ) ( not ( = ?auto_130034 ?auto_130031 ) ) ( not ( = ?auto_130033 ?auto_130031 ) ) ( ON ?auto_130029 ?auto_130028 ) ( ON-TABLE ?auto_130031 ) ( ON ?auto_130030 ?auto_130029 ) ( CLEAR ?auto_130030 ) ( HOLDING ?auto_130036 ) ( CLEAR ?auto_130033 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130035 ?auto_130032 ?auto_130034 ?auto_130033 ?auto_130036 )
      ( MAKE-3PILE ?auto_130028 ?auto_130029 ?auto_130030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130037 - BLOCK
      ?auto_130038 - BLOCK
      ?auto_130039 - BLOCK
    )
    :vars
    (
      ?auto_130040 - BLOCK
      ?auto_130045 - BLOCK
      ?auto_130041 - BLOCK
      ?auto_130043 - BLOCK
      ?auto_130042 - BLOCK
      ?auto_130044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130037 ?auto_130038 ) ) ( not ( = ?auto_130037 ?auto_130039 ) ) ( not ( = ?auto_130038 ?auto_130039 ) ) ( not ( = ?auto_130037 ?auto_130040 ) ) ( not ( = ?auto_130038 ?auto_130040 ) ) ( not ( = ?auto_130039 ?auto_130040 ) ) ( ON-TABLE ?auto_130045 ) ( ON ?auto_130041 ?auto_130045 ) ( ON ?auto_130043 ?auto_130041 ) ( ON ?auto_130042 ?auto_130043 ) ( not ( = ?auto_130045 ?auto_130041 ) ) ( not ( = ?auto_130045 ?auto_130043 ) ) ( not ( = ?auto_130045 ?auto_130042 ) ) ( not ( = ?auto_130045 ?auto_130040 ) ) ( not ( = ?auto_130045 ?auto_130039 ) ) ( not ( = ?auto_130045 ?auto_130038 ) ) ( not ( = ?auto_130041 ?auto_130043 ) ) ( not ( = ?auto_130041 ?auto_130042 ) ) ( not ( = ?auto_130041 ?auto_130040 ) ) ( not ( = ?auto_130041 ?auto_130039 ) ) ( not ( = ?auto_130041 ?auto_130038 ) ) ( not ( = ?auto_130043 ?auto_130042 ) ) ( not ( = ?auto_130043 ?auto_130040 ) ) ( not ( = ?auto_130043 ?auto_130039 ) ) ( not ( = ?auto_130043 ?auto_130038 ) ) ( not ( = ?auto_130042 ?auto_130040 ) ) ( not ( = ?auto_130042 ?auto_130039 ) ) ( not ( = ?auto_130042 ?auto_130038 ) ) ( not ( = ?auto_130037 ?auto_130045 ) ) ( not ( = ?auto_130037 ?auto_130041 ) ) ( not ( = ?auto_130037 ?auto_130043 ) ) ( not ( = ?auto_130037 ?auto_130042 ) ) ( ON ?auto_130037 ?auto_130044 ) ( not ( = ?auto_130037 ?auto_130044 ) ) ( not ( = ?auto_130038 ?auto_130044 ) ) ( not ( = ?auto_130039 ?auto_130044 ) ) ( not ( = ?auto_130040 ?auto_130044 ) ) ( not ( = ?auto_130045 ?auto_130044 ) ) ( not ( = ?auto_130041 ?auto_130044 ) ) ( not ( = ?auto_130043 ?auto_130044 ) ) ( not ( = ?auto_130042 ?auto_130044 ) ) ( ON ?auto_130038 ?auto_130037 ) ( ON-TABLE ?auto_130044 ) ( ON ?auto_130039 ?auto_130038 ) ( CLEAR ?auto_130042 ) ( ON ?auto_130040 ?auto_130039 ) ( CLEAR ?auto_130040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130044 ?auto_130037 ?auto_130038 ?auto_130039 )
      ( MAKE-3PILE ?auto_130037 ?auto_130038 ?auto_130039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130046 - BLOCK
      ?auto_130047 - BLOCK
      ?auto_130048 - BLOCK
    )
    :vars
    (
      ?auto_130052 - BLOCK
      ?auto_130050 - BLOCK
      ?auto_130053 - BLOCK
      ?auto_130049 - BLOCK
      ?auto_130054 - BLOCK
      ?auto_130051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130046 ?auto_130047 ) ) ( not ( = ?auto_130046 ?auto_130048 ) ) ( not ( = ?auto_130047 ?auto_130048 ) ) ( not ( = ?auto_130046 ?auto_130052 ) ) ( not ( = ?auto_130047 ?auto_130052 ) ) ( not ( = ?auto_130048 ?auto_130052 ) ) ( ON-TABLE ?auto_130050 ) ( ON ?auto_130053 ?auto_130050 ) ( ON ?auto_130049 ?auto_130053 ) ( not ( = ?auto_130050 ?auto_130053 ) ) ( not ( = ?auto_130050 ?auto_130049 ) ) ( not ( = ?auto_130050 ?auto_130054 ) ) ( not ( = ?auto_130050 ?auto_130052 ) ) ( not ( = ?auto_130050 ?auto_130048 ) ) ( not ( = ?auto_130050 ?auto_130047 ) ) ( not ( = ?auto_130053 ?auto_130049 ) ) ( not ( = ?auto_130053 ?auto_130054 ) ) ( not ( = ?auto_130053 ?auto_130052 ) ) ( not ( = ?auto_130053 ?auto_130048 ) ) ( not ( = ?auto_130053 ?auto_130047 ) ) ( not ( = ?auto_130049 ?auto_130054 ) ) ( not ( = ?auto_130049 ?auto_130052 ) ) ( not ( = ?auto_130049 ?auto_130048 ) ) ( not ( = ?auto_130049 ?auto_130047 ) ) ( not ( = ?auto_130054 ?auto_130052 ) ) ( not ( = ?auto_130054 ?auto_130048 ) ) ( not ( = ?auto_130054 ?auto_130047 ) ) ( not ( = ?auto_130046 ?auto_130050 ) ) ( not ( = ?auto_130046 ?auto_130053 ) ) ( not ( = ?auto_130046 ?auto_130049 ) ) ( not ( = ?auto_130046 ?auto_130054 ) ) ( ON ?auto_130046 ?auto_130051 ) ( not ( = ?auto_130046 ?auto_130051 ) ) ( not ( = ?auto_130047 ?auto_130051 ) ) ( not ( = ?auto_130048 ?auto_130051 ) ) ( not ( = ?auto_130052 ?auto_130051 ) ) ( not ( = ?auto_130050 ?auto_130051 ) ) ( not ( = ?auto_130053 ?auto_130051 ) ) ( not ( = ?auto_130049 ?auto_130051 ) ) ( not ( = ?auto_130054 ?auto_130051 ) ) ( ON ?auto_130047 ?auto_130046 ) ( ON-TABLE ?auto_130051 ) ( ON ?auto_130048 ?auto_130047 ) ( ON ?auto_130052 ?auto_130048 ) ( CLEAR ?auto_130052 ) ( HOLDING ?auto_130054 ) ( CLEAR ?auto_130049 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130050 ?auto_130053 ?auto_130049 ?auto_130054 )
      ( MAKE-3PILE ?auto_130046 ?auto_130047 ?auto_130048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130055 - BLOCK
      ?auto_130056 - BLOCK
      ?auto_130057 - BLOCK
    )
    :vars
    (
      ?auto_130059 - BLOCK
      ?auto_130060 - BLOCK
      ?auto_130061 - BLOCK
      ?auto_130058 - BLOCK
      ?auto_130062 - BLOCK
      ?auto_130063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130055 ?auto_130056 ) ) ( not ( = ?auto_130055 ?auto_130057 ) ) ( not ( = ?auto_130056 ?auto_130057 ) ) ( not ( = ?auto_130055 ?auto_130059 ) ) ( not ( = ?auto_130056 ?auto_130059 ) ) ( not ( = ?auto_130057 ?auto_130059 ) ) ( ON-TABLE ?auto_130060 ) ( ON ?auto_130061 ?auto_130060 ) ( ON ?auto_130058 ?auto_130061 ) ( not ( = ?auto_130060 ?auto_130061 ) ) ( not ( = ?auto_130060 ?auto_130058 ) ) ( not ( = ?auto_130060 ?auto_130062 ) ) ( not ( = ?auto_130060 ?auto_130059 ) ) ( not ( = ?auto_130060 ?auto_130057 ) ) ( not ( = ?auto_130060 ?auto_130056 ) ) ( not ( = ?auto_130061 ?auto_130058 ) ) ( not ( = ?auto_130061 ?auto_130062 ) ) ( not ( = ?auto_130061 ?auto_130059 ) ) ( not ( = ?auto_130061 ?auto_130057 ) ) ( not ( = ?auto_130061 ?auto_130056 ) ) ( not ( = ?auto_130058 ?auto_130062 ) ) ( not ( = ?auto_130058 ?auto_130059 ) ) ( not ( = ?auto_130058 ?auto_130057 ) ) ( not ( = ?auto_130058 ?auto_130056 ) ) ( not ( = ?auto_130062 ?auto_130059 ) ) ( not ( = ?auto_130062 ?auto_130057 ) ) ( not ( = ?auto_130062 ?auto_130056 ) ) ( not ( = ?auto_130055 ?auto_130060 ) ) ( not ( = ?auto_130055 ?auto_130061 ) ) ( not ( = ?auto_130055 ?auto_130058 ) ) ( not ( = ?auto_130055 ?auto_130062 ) ) ( ON ?auto_130055 ?auto_130063 ) ( not ( = ?auto_130055 ?auto_130063 ) ) ( not ( = ?auto_130056 ?auto_130063 ) ) ( not ( = ?auto_130057 ?auto_130063 ) ) ( not ( = ?auto_130059 ?auto_130063 ) ) ( not ( = ?auto_130060 ?auto_130063 ) ) ( not ( = ?auto_130061 ?auto_130063 ) ) ( not ( = ?auto_130058 ?auto_130063 ) ) ( not ( = ?auto_130062 ?auto_130063 ) ) ( ON ?auto_130056 ?auto_130055 ) ( ON-TABLE ?auto_130063 ) ( ON ?auto_130057 ?auto_130056 ) ( ON ?auto_130059 ?auto_130057 ) ( CLEAR ?auto_130058 ) ( ON ?auto_130062 ?auto_130059 ) ( CLEAR ?auto_130062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130063 ?auto_130055 ?auto_130056 ?auto_130057 ?auto_130059 )
      ( MAKE-3PILE ?auto_130055 ?auto_130056 ?auto_130057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130064 - BLOCK
      ?auto_130065 - BLOCK
      ?auto_130066 - BLOCK
    )
    :vars
    (
      ?auto_130072 - BLOCK
      ?auto_130070 - BLOCK
      ?auto_130067 - BLOCK
      ?auto_130068 - BLOCK
      ?auto_130071 - BLOCK
      ?auto_130069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130064 ?auto_130065 ) ) ( not ( = ?auto_130064 ?auto_130066 ) ) ( not ( = ?auto_130065 ?auto_130066 ) ) ( not ( = ?auto_130064 ?auto_130072 ) ) ( not ( = ?auto_130065 ?auto_130072 ) ) ( not ( = ?auto_130066 ?auto_130072 ) ) ( ON-TABLE ?auto_130070 ) ( ON ?auto_130067 ?auto_130070 ) ( not ( = ?auto_130070 ?auto_130067 ) ) ( not ( = ?auto_130070 ?auto_130068 ) ) ( not ( = ?auto_130070 ?auto_130071 ) ) ( not ( = ?auto_130070 ?auto_130072 ) ) ( not ( = ?auto_130070 ?auto_130066 ) ) ( not ( = ?auto_130070 ?auto_130065 ) ) ( not ( = ?auto_130067 ?auto_130068 ) ) ( not ( = ?auto_130067 ?auto_130071 ) ) ( not ( = ?auto_130067 ?auto_130072 ) ) ( not ( = ?auto_130067 ?auto_130066 ) ) ( not ( = ?auto_130067 ?auto_130065 ) ) ( not ( = ?auto_130068 ?auto_130071 ) ) ( not ( = ?auto_130068 ?auto_130072 ) ) ( not ( = ?auto_130068 ?auto_130066 ) ) ( not ( = ?auto_130068 ?auto_130065 ) ) ( not ( = ?auto_130071 ?auto_130072 ) ) ( not ( = ?auto_130071 ?auto_130066 ) ) ( not ( = ?auto_130071 ?auto_130065 ) ) ( not ( = ?auto_130064 ?auto_130070 ) ) ( not ( = ?auto_130064 ?auto_130067 ) ) ( not ( = ?auto_130064 ?auto_130068 ) ) ( not ( = ?auto_130064 ?auto_130071 ) ) ( ON ?auto_130064 ?auto_130069 ) ( not ( = ?auto_130064 ?auto_130069 ) ) ( not ( = ?auto_130065 ?auto_130069 ) ) ( not ( = ?auto_130066 ?auto_130069 ) ) ( not ( = ?auto_130072 ?auto_130069 ) ) ( not ( = ?auto_130070 ?auto_130069 ) ) ( not ( = ?auto_130067 ?auto_130069 ) ) ( not ( = ?auto_130068 ?auto_130069 ) ) ( not ( = ?auto_130071 ?auto_130069 ) ) ( ON ?auto_130065 ?auto_130064 ) ( ON-TABLE ?auto_130069 ) ( ON ?auto_130066 ?auto_130065 ) ( ON ?auto_130072 ?auto_130066 ) ( ON ?auto_130071 ?auto_130072 ) ( CLEAR ?auto_130071 ) ( HOLDING ?auto_130068 ) ( CLEAR ?auto_130067 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130070 ?auto_130067 ?auto_130068 )
      ( MAKE-3PILE ?auto_130064 ?auto_130065 ?auto_130066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130073 - BLOCK
      ?auto_130074 - BLOCK
      ?auto_130075 - BLOCK
    )
    :vars
    (
      ?auto_130076 - BLOCK
      ?auto_130079 - BLOCK
      ?auto_130081 - BLOCK
      ?auto_130077 - BLOCK
      ?auto_130080 - BLOCK
      ?auto_130078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130073 ?auto_130074 ) ) ( not ( = ?auto_130073 ?auto_130075 ) ) ( not ( = ?auto_130074 ?auto_130075 ) ) ( not ( = ?auto_130073 ?auto_130076 ) ) ( not ( = ?auto_130074 ?auto_130076 ) ) ( not ( = ?auto_130075 ?auto_130076 ) ) ( ON-TABLE ?auto_130079 ) ( ON ?auto_130081 ?auto_130079 ) ( not ( = ?auto_130079 ?auto_130081 ) ) ( not ( = ?auto_130079 ?auto_130077 ) ) ( not ( = ?auto_130079 ?auto_130080 ) ) ( not ( = ?auto_130079 ?auto_130076 ) ) ( not ( = ?auto_130079 ?auto_130075 ) ) ( not ( = ?auto_130079 ?auto_130074 ) ) ( not ( = ?auto_130081 ?auto_130077 ) ) ( not ( = ?auto_130081 ?auto_130080 ) ) ( not ( = ?auto_130081 ?auto_130076 ) ) ( not ( = ?auto_130081 ?auto_130075 ) ) ( not ( = ?auto_130081 ?auto_130074 ) ) ( not ( = ?auto_130077 ?auto_130080 ) ) ( not ( = ?auto_130077 ?auto_130076 ) ) ( not ( = ?auto_130077 ?auto_130075 ) ) ( not ( = ?auto_130077 ?auto_130074 ) ) ( not ( = ?auto_130080 ?auto_130076 ) ) ( not ( = ?auto_130080 ?auto_130075 ) ) ( not ( = ?auto_130080 ?auto_130074 ) ) ( not ( = ?auto_130073 ?auto_130079 ) ) ( not ( = ?auto_130073 ?auto_130081 ) ) ( not ( = ?auto_130073 ?auto_130077 ) ) ( not ( = ?auto_130073 ?auto_130080 ) ) ( ON ?auto_130073 ?auto_130078 ) ( not ( = ?auto_130073 ?auto_130078 ) ) ( not ( = ?auto_130074 ?auto_130078 ) ) ( not ( = ?auto_130075 ?auto_130078 ) ) ( not ( = ?auto_130076 ?auto_130078 ) ) ( not ( = ?auto_130079 ?auto_130078 ) ) ( not ( = ?auto_130081 ?auto_130078 ) ) ( not ( = ?auto_130077 ?auto_130078 ) ) ( not ( = ?auto_130080 ?auto_130078 ) ) ( ON ?auto_130074 ?auto_130073 ) ( ON-TABLE ?auto_130078 ) ( ON ?auto_130075 ?auto_130074 ) ( ON ?auto_130076 ?auto_130075 ) ( ON ?auto_130080 ?auto_130076 ) ( CLEAR ?auto_130081 ) ( ON ?auto_130077 ?auto_130080 ) ( CLEAR ?auto_130077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130078 ?auto_130073 ?auto_130074 ?auto_130075 ?auto_130076 ?auto_130080 )
      ( MAKE-3PILE ?auto_130073 ?auto_130074 ?auto_130075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130082 - BLOCK
      ?auto_130083 - BLOCK
      ?auto_130084 - BLOCK
    )
    :vars
    (
      ?auto_130090 - BLOCK
      ?auto_130087 - BLOCK
      ?auto_130086 - BLOCK
      ?auto_130089 - BLOCK
      ?auto_130088 - BLOCK
      ?auto_130085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130082 ?auto_130083 ) ) ( not ( = ?auto_130082 ?auto_130084 ) ) ( not ( = ?auto_130083 ?auto_130084 ) ) ( not ( = ?auto_130082 ?auto_130090 ) ) ( not ( = ?auto_130083 ?auto_130090 ) ) ( not ( = ?auto_130084 ?auto_130090 ) ) ( ON-TABLE ?auto_130087 ) ( not ( = ?auto_130087 ?auto_130086 ) ) ( not ( = ?auto_130087 ?auto_130089 ) ) ( not ( = ?auto_130087 ?auto_130088 ) ) ( not ( = ?auto_130087 ?auto_130090 ) ) ( not ( = ?auto_130087 ?auto_130084 ) ) ( not ( = ?auto_130087 ?auto_130083 ) ) ( not ( = ?auto_130086 ?auto_130089 ) ) ( not ( = ?auto_130086 ?auto_130088 ) ) ( not ( = ?auto_130086 ?auto_130090 ) ) ( not ( = ?auto_130086 ?auto_130084 ) ) ( not ( = ?auto_130086 ?auto_130083 ) ) ( not ( = ?auto_130089 ?auto_130088 ) ) ( not ( = ?auto_130089 ?auto_130090 ) ) ( not ( = ?auto_130089 ?auto_130084 ) ) ( not ( = ?auto_130089 ?auto_130083 ) ) ( not ( = ?auto_130088 ?auto_130090 ) ) ( not ( = ?auto_130088 ?auto_130084 ) ) ( not ( = ?auto_130088 ?auto_130083 ) ) ( not ( = ?auto_130082 ?auto_130087 ) ) ( not ( = ?auto_130082 ?auto_130086 ) ) ( not ( = ?auto_130082 ?auto_130089 ) ) ( not ( = ?auto_130082 ?auto_130088 ) ) ( ON ?auto_130082 ?auto_130085 ) ( not ( = ?auto_130082 ?auto_130085 ) ) ( not ( = ?auto_130083 ?auto_130085 ) ) ( not ( = ?auto_130084 ?auto_130085 ) ) ( not ( = ?auto_130090 ?auto_130085 ) ) ( not ( = ?auto_130087 ?auto_130085 ) ) ( not ( = ?auto_130086 ?auto_130085 ) ) ( not ( = ?auto_130089 ?auto_130085 ) ) ( not ( = ?auto_130088 ?auto_130085 ) ) ( ON ?auto_130083 ?auto_130082 ) ( ON-TABLE ?auto_130085 ) ( ON ?auto_130084 ?auto_130083 ) ( ON ?auto_130090 ?auto_130084 ) ( ON ?auto_130088 ?auto_130090 ) ( ON ?auto_130089 ?auto_130088 ) ( CLEAR ?auto_130089 ) ( HOLDING ?auto_130086 ) ( CLEAR ?auto_130087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130087 ?auto_130086 )
      ( MAKE-3PILE ?auto_130082 ?auto_130083 ?auto_130084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130091 - BLOCK
      ?auto_130092 - BLOCK
      ?auto_130093 - BLOCK
    )
    :vars
    (
      ?auto_130098 - BLOCK
      ?auto_130094 - BLOCK
      ?auto_130099 - BLOCK
      ?auto_130097 - BLOCK
      ?auto_130095 - BLOCK
      ?auto_130096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130091 ?auto_130092 ) ) ( not ( = ?auto_130091 ?auto_130093 ) ) ( not ( = ?auto_130092 ?auto_130093 ) ) ( not ( = ?auto_130091 ?auto_130098 ) ) ( not ( = ?auto_130092 ?auto_130098 ) ) ( not ( = ?auto_130093 ?auto_130098 ) ) ( ON-TABLE ?auto_130094 ) ( not ( = ?auto_130094 ?auto_130099 ) ) ( not ( = ?auto_130094 ?auto_130097 ) ) ( not ( = ?auto_130094 ?auto_130095 ) ) ( not ( = ?auto_130094 ?auto_130098 ) ) ( not ( = ?auto_130094 ?auto_130093 ) ) ( not ( = ?auto_130094 ?auto_130092 ) ) ( not ( = ?auto_130099 ?auto_130097 ) ) ( not ( = ?auto_130099 ?auto_130095 ) ) ( not ( = ?auto_130099 ?auto_130098 ) ) ( not ( = ?auto_130099 ?auto_130093 ) ) ( not ( = ?auto_130099 ?auto_130092 ) ) ( not ( = ?auto_130097 ?auto_130095 ) ) ( not ( = ?auto_130097 ?auto_130098 ) ) ( not ( = ?auto_130097 ?auto_130093 ) ) ( not ( = ?auto_130097 ?auto_130092 ) ) ( not ( = ?auto_130095 ?auto_130098 ) ) ( not ( = ?auto_130095 ?auto_130093 ) ) ( not ( = ?auto_130095 ?auto_130092 ) ) ( not ( = ?auto_130091 ?auto_130094 ) ) ( not ( = ?auto_130091 ?auto_130099 ) ) ( not ( = ?auto_130091 ?auto_130097 ) ) ( not ( = ?auto_130091 ?auto_130095 ) ) ( ON ?auto_130091 ?auto_130096 ) ( not ( = ?auto_130091 ?auto_130096 ) ) ( not ( = ?auto_130092 ?auto_130096 ) ) ( not ( = ?auto_130093 ?auto_130096 ) ) ( not ( = ?auto_130098 ?auto_130096 ) ) ( not ( = ?auto_130094 ?auto_130096 ) ) ( not ( = ?auto_130099 ?auto_130096 ) ) ( not ( = ?auto_130097 ?auto_130096 ) ) ( not ( = ?auto_130095 ?auto_130096 ) ) ( ON ?auto_130092 ?auto_130091 ) ( ON-TABLE ?auto_130096 ) ( ON ?auto_130093 ?auto_130092 ) ( ON ?auto_130098 ?auto_130093 ) ( ON ?auto_130095 ?auto_130098 ) ( ON ?auto_130097 ?auto_130095 ) ( CLEAR ?auto_130094 ) ( ON ?auto_130099 ?auto_130097 ) ( CLEAR ?auto_130099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130096 ?auto_130091 ?auto_130092 ?auto_130093 ?auto_130098 ?auto_130095 ?auto_130097 )
      ( MAKE-3PILE ?auto_130091 ?auto_130092 ?auto_130093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130100 - BLOCK
      ?auto_130101 - BLOCK
      ?auto_130102 - BLOCK
    )
    :vars
    (
      ?auto_130104 - BLOCK
      ?auto_130103 - BLOCK
      ?auto_130106 - BLOCK
      ?auto_130108 - BLOCK
      ?auto_130105 - BLOCK
      ?auto_130107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130100 ?auto_130101 ) ) ( not ( = ?auto_130100 ?auto_130102 ) ) ( not ( = ?auto_130101 ?auto_130102 ) ) ( not ( = ?auto_130100 ?auto_130104 ) ) ( not ( = ?auto_130101 ?auto_130104 ) ) ( not ( = ?auto_130102 ?auto_130104 ) ) ( not ( = ?auto_130103 ?auto_130106 ) ) ( not ( = ?auto_130103 ?auto_130108 ) ) ( not ( = ?auto_130103 ?auto_130105 ) ) ( not ( = ?auto_130103 ?auto_130104 ) ) ( not ( = ?auto_130103 ?auto_130102 ) ) ( not ( = ?auto_130103 ?auto_130101 ) ) ( not ( = ?auto_130106 ?auto_130108 ) ) ( not ( = ?auto_130106 ?auto_130105 ) ) ( not ( = ?auto_130106 ?auto_130104 ) ) ( not ( = ?auto_130106 ?auto_130102 ) ) ( not ( = ?auto_130106 ?auto_130101 ) ) ( not ( = ?auto_130108 ?auto_130105 ) ) ( not ( = ?auto_130108 ?auto_130104 ) ) ( not ( = ?auto_130108 ?auto_130102 ) ) ( not ( = ?auto_130108 ?auto_130101 ) ) ( not ( = ?auto_130105 ?auto_130104 ) ) ( not ( = ?auto_130105 ?auto_130102 ) ) ( not ( = ?auto_130105 ?auto_130101 ) ) ( not ( = ?auto_130100 ?auto_130103 ) ) ( not ( = ?auto_130100 ?auto_130106 ) ) ( not ( = ?auto_130100 ?auto_130108 ) ) ( not ( = ?auto_130100 ?auto_130105 ) ) ( ON ?auto_130100 ?auto_130107 ) ( not ( = ?auto_130100 ?auto_130107 ) ) ( not ( = ?auto_130101 ?auto_130107 ) ) ( not ( = ?auto_130102 ?auto_130107 ) ) ( not ( = ?auto_130104 ?auto_130107 ) ) ( not ( = ?auto_130103 ?auto_130107 ) ) ( not ( = ?auto_130106 ?auto_130107 ) ) ( not ( = ?auto_130108 ?auto_130107 ) ) ( not ( = ?auto_130105 ?auto_130107 ) ) ( ON ?auto_130101 ?auto_130100 ) ( ON-TABLE ?auto_130107 ) ( ON ?auto_130102 ?auto_130101 ) ( ON ?auto_130104 ?auto_130102 ) ( ON ?auto_130105 ?auto_130104 ) ( ON ?auto_130108 ?auto_130105 ) ( ON ?auto_130106 ?auto_130108 ) ( CLEAR ?auto_130106 ) ( HOLDING ?auto_130103 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130103 )
      ( MAKE-3PILE ?auto_130100 ?auto_130101 ?auto_130102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130109 - BLOCK
      ?auto_130110 - BLOCK
      ?auto_130111 - BLOCK
    )
    :vars
    (
      ?auto_130114 - BLOCK
      ?auto_130115 - BLOCK
      ?auto_130113 - BLOCK
      ?auto_130117 - BLOCK
      ?auto_130112 - BLOCK
      ?auto_130116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130109 ?auto_130110 ) ) ( not ( = ?auto_130109 ?auto_130111 ) ) ( not ( = ?auto_130110 ?auto_130111 ) ) ( not ( = ?auto_130109 ?auto_130114 ) ) ( not ( = ?auto_130110 ?auto_130114 ) ) ( not ( = ?auto_130111 ?auto_130114 ) ) ( not ( = ?auto_130115 ?auto_130113 ) ) ( not ( = ?auto_130115 ?auto_130117 ) ) ( not ( = ?auto_130115 ?auto_130112 ) ) ( not ( = ?auto_130115 ?auto_130114 ) ) ( not ( = ?auto_130115 ?auto_130111 ) ) ( not ( = ?auto_130115 ?auto_130110 ) ) ( not ( = ?auto_130113 ?auto_130117 ) ) ( not ( = ?auto_130113 ?auto_130112 ) ) ( not ( = ?auto_130113 ?auto_130114 ) ) ( not ( = ?auto_130113 ?auto_130111 ) ) ( not ( = ?auto_130113 ?auto_130110 ) ) ( not ( = ?auto_130117 ?auto_130112 ) ) ( not ( = ?auto_130117 ?auto_130114 ) ) ( not ( = ?auto_130117 ?auto_130111 ) ) ( not ( = ?auto_130117 ?auto_130110 ) ) ( not ( = ?auto_130112 ?auto_130114 ) ) ( not ( = ?auto_130112 ?auto_130111 ) ) ( not ( = ?auto_130112 ?auto_130110 ) ) ( not ( = ?auto_130109 ?auto_130115 ) ) ( not ( = ?auto_130109 ?auto_130113 ) ) ( not ( = ?auto_130109 ?auto_130117 ) ) ( not ( = ?auto_130109 ?auto_130112 ) ) ( ON ?auto_130109 ?auto_130116 ) ( not ( = ?auto_130109 ?auto_130116 ) ) ( not ( = ?auto_130110 ?auto_130116 ) ) ( not ( = ?auto_130111 ?auto_130116 ) ) ( not ( = ?auto_130114 ?auto_130116 ) ) ( not ( = ?auto_130115 ?auto_130116 ) ) ( not ( = ?auto_130113 ?auto_130116 ) ) ( not ( = ?auto_130117 ?auto_130116 ) ) ( not ( = ?auto_130112 ?auto_130116 ) ) ( ON ?auto_130110 ?auto_130109 ) ( ON-TABLE ?auto_130116 ) ( ON ?auto_130111 ?auto_130110 ) ( ON ?auto_130114 ?auto_130111 ) ( ON ?auto_130112 ?auto_130114 ) ( ON ?auto_130117 ?auto_130112 ) ( ON ?auto_130113 ?auto_130117 ) ( ON ?auto_130115 ?auto_130113 ) ( CLEAR ?auto_130115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_130116 ?auto_130109 ?auto_130110 ?auto_130111 ?auto_130114 ?auto_130112 ?auto_130117 ?auto_130113 )
      ( MAKE-3PILE ?auto_130109 ?auto_130110 ?auto_130111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130141 - BLOCK
      ?auto_130142 - BLOCK
      ?auto_130143 - BLOCK
      ?auto_130144 - BLOCK
    )
    :vars
    (
      ?auto_130147 - BLOCK
      ?auto_130145 - BLOCK
      ?auto_130146 - BLOCK
      ?auto_130148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130147 ?auto_130144 ) ( ON-TABLE ?auto_130141 ) ( ON ?auto_130142 ?auto_130141 ) ( ON ?auto_130143 ?auto_130142 ) ( ON ?auto_130144 ?auto_130143 ) ( not ( = ?auto_130141 ?auto_130142 ) ) ( not ( = ?auto_130141 ?auto_130143 ) ) ( not ( = ?auto_130141 ?auto_130144 ) ) ( not ( = ?auto_130141 ?auto_130147 ) ) ( not ( = ?auto_130142 ?auto_130143 ) ) ( not ( = ?auto_130142 ?auto_130144 ) ) ( not ( = ?auto_130142 ?auto_130147 ) ) ( not ( = ?auto_130143 ?auto_130144 ) ) ( not ( = ?auto_130143 ?auto_130147 ) ) ( not ( = ?auto_130144 ?auto_130147 ) ) ( not ( = ?auto_130141 ?auto_130145 ) ) ( not ( = ?auto_130141 ?auto_130146 ) ) ( not ( = ?auto_130142 ?auto_130145 ) ) ( not ( = ?auto_130142 ?auto_130146 ) ) ( not ( = ?auto_130143 ?auto_130145 ) ) ( not ( = ?auto_130143 ?auto_130146 ) ) ( not ( = ?auto_130144 ?auto_130145 ) ) ( not ( = ?auto_130144 ?auto_130146 ) ) ( not ( = ?auto_130147 ?auto_130145 ) ) ( not ( = ?auto_130147 ?auto_130146 ) ) ( not ( = ?auto_130145 ?auto_130146 ) ) ( ON ?auto_130145 ?auto_130147 ) ( CLEAR ?auto_130145 ) ( HOLDING ?auto_130146 ) ( CLEAR ?auto_130148 ) ( ON-TABLE ?auto_130148 ) ( not ( = ?auto_130148 ?auto_130146 ) ) ( not ( = ?auto_130141 ?auto_130148 ) ) ( not ( = ?auto_130142 ?auto_130148 ) ) ( not ( = ?auto_130143 ?auto_130148 ) ) ( not ( = ?auto_130144 ?auto_130148 ) ) ( not ( = ?auto_130147 ?auto_130148 ) ) ( not ( = ?auto_130145 ?auto_130148 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130148 ?auto_130146 )
      ( MAKE-4PILE ?auto_130141 ?auto_130142 ?auto_130143 ?auto_130144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130149 - BLOCK
      ?auto_130150 - BLOCK
      ?auto_130151 - BLOCK
      ?auto_130152 - BLOCK
    )
    :vars
    (
      ?auto_130153 - BLOCK
      ?auto_130156 - BLOCK
      ?auto_130155 - BLOCK
      ?auto_130154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130153 ?auto_130152 ) ( ON-TABLE ?auto_130149 ) ( ON ?auto_130150 ?auto_130149 ) ( ON ?auto_130151 ?auto_130150 ) ( ON ?auto_130152 ?auto_130151 ) ( not ( = ?auto_130149 ?auto_130150 ) ) ( not ( = ?auto_130149 ?auto_130151 ) ) ( not ( = ?auto_130149 ?auto_130152 ) ) ( not ( = ?auto_130149 ?auto_130153 ) ) ( not ( = ?auto_130150 ?auto_130151 ) ) ( not ( = ?auto_130150 ?auto_130152 ) ) ( not ( = ?auto_130150 ?auto_130153 ) ) ( not ( = ?auto_130151 ?auto_130152 ) ) ( not ( = ?auto_130151 ?auto_130153 ) ) ( not ( = ?auto_130152 ?auto_130153 ) ) ( not ( = ?auto_130149 ?auto_130156 ) ) ( not ( = ?auto_130149 ?auto_130155 ) ) ( not ( = ?auto_130150 ?auto_130156 ) ) ( not ( = ?auto_130150 ?auto_130155 ) ) ( not ( = ?auto_130151 ?auto_130156 ) ) ( not ( = ?auto_130151 ?auto_130155 ) ) ( not ( = ?auto_130152 ?auto_130156 ) ) ( not ( = ?auto_130152 ?auto_130155 ) ) ( not ( = ?auto_130153 ?auto_130156 ) ) ( not ( = ?auto_130153 ?auto_130155 ) ) ( not ( = ?auto_130156 ?auto_130155 ) ) ( ON ?auto_130156 ?auto_130153 ) ( CLEAR ?auto_130154 ) ( ON-TABLE ?auto_130154 ) ( not ( = ?auto_130154 ?auto_130155 ) ) ( not ( = ?auto_130149 ?auto_130154 ) ) ( not ( = ?auto_130150 ?auto_130154 ) ) ( not ( = ?auto_130151 ?auto_130154 ) ) ( not ( = ?auto_130152 ?auto_130154 ) ) ( not ( = ?auto_130153 ?auto_130154 ) ) ( not ( = ?auto_130156 ?auto_130154 ) ) ( ON ?auto_130155 ?auto_130156 ) ( CLEAR ?auto_130155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130149 ?auto_130150 ?auto_130151 ?auto_130152 ?auto_130153 ?auto_130156 )
      ( MAKE-4PILE ?auto_130149 ?auto_130150 ?auto_130151 ?auto_130152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130157 - BLOCK
      ?auto_130158 - BLOCK
      ?auto_130159 - BLOCK
      ?auto_130160 - BLOCK
    )
    :vars
    (
      ?auto_130163 - BLOCK
      ?auto_130164 - BLOCK
      ?auto_130161 - BLOCK
      ?auto_130162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130163 ?auto_130160 ) ( ON-TABLE ?auto_130157 ) ( ON ?auto_130158 ?auto_130157 ) ( ON ?auto_130159 ?auto_130158 ) ( ON ?auto_130160 ?auto_130159 ) ( not ( = ?auto_130157 ?auto_130158 ) ) ( not ( = ?auto_130157 ?auto_130159 ) ) ( not ( = ?auto_130157 ?auto_130160 ) ) ( not ( = ?auto_130157 ?auto_130163 ) ) ( not ( = ?auto_130158 ?auto_130159 ) ) ( not ( = ?auto_130158 ?auto_130160 ) ) ( not ( = ?auto_130158 ?auto_130163 ) ) ( not ( = ?auto_130159 ?auto_130160 ) ) ( not ( = ?auto_130159 ?auto_130163 ) ) ( not ( = ?auto_130160 ?auto_130163 ) ) ( not ( = ?auto_130157 ?auto_130164 ) ) ( not ( = ?auto_130157 ?auto_130161 ) ) ( not ( = ?auto_130158 ?auto_130164 ) ) ( not ( = ?auto_130158 ?auto_130161 ) ) ( not ( = ?auto_130159 ?auto_130164 ) ) ( not ( = ?auto_130159 ?auto_130161 ) ) ( not ( = ?auto_130160 ?auto_130164 ) ) ( not ( = ?auto_130160 ?auto_130161 ) ) ( not ( = ?auto_130163 ?auto_130164 ) ) ( not ( = ?auto_130163 ?auto_130161 ) ) ( not ( = ?auto_130164 ?auto_130161 ) ) ( ON ?auto_130164 ?auto_130163 ) ( not ( = ?auto_130162 ?auto_130161 ) ) ( not ( = ?auto_130157 ?auto_130162 ) ) ( not ( = ?auto_130158 ?auto_130162 ) ) ( not ( = ?auto_130159 ?auto_130162 ) ) ( not ( = ?auto_130160 ?auto_130162 ) ) ( not ( = ?auto_130163 ?auto_130162 ) ) ( not ( = ?auto_130164 ?auto_130162 ) ) ( ON ?auto_130161 ?auto_130164 ) ( CLEAR ?auto_130161 ) ( HOLDING ?auto_130162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130162 )
      ( MAKE-4PILE ?auto_130157 ?auto_130158 ?auto_130159 ?auto_130160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130177 - BLOCK
      ?auto_130178 - BLOCK
      ?auto_130179 - BLOCK
      ?auto_130180 - BLOCK
    )
    :vars
    (
      ?auto_130183 - BLOCK
      ?auto_130182 - BLOCK
      ?auto_130181 - BLOCK
      ?auto_130184 - BLOCK
      ?auto_130185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130183 ?auto_130180 ) ( ON-TABLE ?auto_130177 ) ( ON ?auto_130178 ?auto_130177 ) ( ON ?auto_130179 ?auto_130178 ) ( ON ?auto_130180 ?auto_130179 ) ( not ( = ?auto_130177 ?auto_130178 ) ) ( not ( = ?auto_130177 ?auto_130179 ) ) ( not ( = ?auto_130177 ?auto_130180 ) ) ( not ( = ?auto_130177 ?auto_130183 ) ) ( not ( = ?auto_130178 ?auto_130179 ) ) ( not ( = ?auto_130178 ?auto_130180 ) ) ( not ( = ?auto_130178 ?auto_130183 ) ) ( not ( = ?auto_130179 ?auto_130180 ) ) ( not ( = ?auto_130179 ?auto_130183 ) ) ( not ( = ?auto_130180 ?auto_130183 ) ) ( not ( = ?auto_130177 ?auto_130182 ) ) ( not ( = ?auto_130177 ?auto_130181 ) ) ( not ( = ?auto_130178 ?auto_130182 ) ) ( not ( = ?auto_130178 ?auto_130181 ) ) ( not ( = ?auto_130179 ?auto_130182 ) ) ( not ( = ?auto_130179 ?auto_130181 ) ) ( not ( = ?auto_130180 ?auto_130182 ) ) ( not ( = ?auto_130180 ?auto_130181 ) ) ( not ( = ?auto_130183 ?auto_130182 ) ) ( not ( = ?auto_130183 ?auto_130181 ) ) ( not ( = ?auto_130182 ?auto_130181 ) ) ( ON ?auto_130182 ?auto_130183 ) ( not ( = ?auto_130184 ?auto_130181 ) ) ( not ( = ?auto_130177 ?auto_130184 ) ) ( not ( = ?auto_130178 ?auto_130184 ) ) ( not ( = ?auto_130179 ?auto_130184 ) ) ( not ( = ?auto_130180 ?auto_130184 ) ) ( not ( = ?auto_130183 ?auto_130184 ) ) ( not ( = ?auto_130182 ?auto_130184 ) ) ( ON ?auto_130181 ?auto_130182 ) ( CLEAR ?auto_130181 ) ( ON ?auto_130184 ?auto_130185 ) ( CLEAR ?auto_130184 ) ( HAND-EMPTY ) ( not ( = ?auto_130177 ?auto_130185 ) ) ( not ( = ?auto_130178 ?auto_130185 ) ) ( not ( = ?auto_130179 ?auto_130185 ) ) ( not ( = ?auto_130180 ?auto_130185 ) ) ( not ( = ?auto_130183 ?auto_130185 ) ) ( not ( = ?auto_130182 ?auto_130185 ) ) ( not ( = ?auto_130181 ?auto_130185 ) ) ( not ( = ?auto_130184 ?auto_130185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130184 ?auto_130185 )
      ( MAKE-4PILE ?auto_130177 ?auto_130178 ?auto_130179 ?auto_130180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130186 - BLOCK
      ?auto_130187 - BLOCK
      ?auto_130188 - BLOCK
      ?auto_130189 - BLOCK
    )
    :vars
    (
      ?auto_130191 - BLOCK
      ?auto_130192 - BLOCK
      ?auto_130190 - BLOCK
      ?auto_130194 - BLOCK
      ?auto_130193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130191 ?auto_130189 ) ( ON-TABLE ?auto_130186 ) ( ON ?auto_130187 ?auto_130186 ) ( ON ?auto_130188 ?auto_130187 ) ( ON ?auto_130189 ?auto_130188 ) ( not ( = ?auto_130186 ?auto_130187 ) ) ( not ( = ?auto_130186 ?auto_130188 ) ) ( not ( = ?auto_130186 ?auto_130189 ) ) ( not ( = ?auto_130186 ?auto_130191 ) ) ( not ( = ?auto_130187 ?auto_130188 ) ) ( not ( = ?auto_130187 ?auto_130189 ) ) ( not ( = ?auto_130187 ?auto_130191 ) ) ( not ( = ?auto_130188 ?auto_130189 ) ) ( not ( = ?auto_130188 ?auto_130191 ) ) ( not ( = ?auto_130189 ?auto_130191 ) ) ( not ( = ?auto_130186 ?auto_130192 ) ) ( not ( = ?auto_130186 ?auto_130190 ) ) ( not ( = ?auto_130187 ?auto_130192 ) ) ( not ( = ?auto_130187 ?auto_130190 ) ) ( not ( = ?auto_130188 ?auto_130192 ) ) ( not ( = ?auto_130188 ?auto_130190 ) ) ( not ( = ?auto_130189 ?auto_130192 ) ) ( not ( = ?auto_130189 ?auto_130190 ) ) ( not ( = ?auto_130191 ?auto_130192 ) ) ( not ( = ?auto_130191 ?auto_130190 ) ) ( not ( = ?auto_130192 ?auto_130190 ) ) ( ON ?auto_130192 ?auto_130191 ) ( not ( = ?auto_130194 ?auto_130190 ) ) ( not ( = ?auto_130186 ?auto_130194 ) ) ( not ( = ?auto_130187 ?auto_130194 ) ) ( not ( = ?auto_130188 ?auto_130194 ) ) ( not ( = ?auto_130189 ?auto_130194 ) ) ( not ( = ?auto_130191 ?auto_130194 ) ) ( not ( = ?auto_130192 ?auto_130194 ) ) ( ON ?auto_130194 ?auto_130193 ) ( CLEAR ?auto_130194 ) ( not ( = ?auto_130186 ?auto_130193 ) ) ( not ( = ?auto_130187 ?auto_130193 ) ) ( not ( = ?auto_130188 ?auto_130193 ) ) ( not ( = ?auto_130189 ?auto_130193 ) ) ( not ( = ?auto_130191 ?auto_130193 ) ) ( not ( = ?auto_130192 ?auto_130193 ) ) ( not ( = ?auto_130190 ?auto_130193 ) ) ( not ( = ?auto_130194 ?auto_130193 ) ) ( HOLDING ?auto_130190 ) ( CLEAR ?auto_130192 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130186 ?auto_130187 ?auto_130188 ?auto_130189 ?auto_130191 ?auto_130192 ?auto_130190 )
      ( MAKE-4PILE ?auto_130186 ?auto_130187 ?auto_130188 ?auto_130189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130268 - BLOCK
      ?auto_130269 - BLOCK
      ?auto_130270 - BLOCK
      ?auto_130271 - BLOCK
    )
    :vars
    (
      ?auto_130272 - BLOCK
      ?auto_130275 - BLOCK
      ?auto_130273 - BLOCK
      ?auto_130274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130268 ) ( ON ?auto_130269 ?auto_130268 ) ( not ( = ?auto_130268 ?auto_130269 ) ) ( not ( = ?auto_130268 ?auto_130270 ) ) ( not ( = ?auto_130268 ?auto_130271 ) ) ( not ( = ?auto_130269 ?auto_130270 ) ) ( not ( = ?auto_130269 ?auto_130271 ) ) ( not ( = ?auto_130270 ?auto_130271 ) ) ( ON ?auto_130271 ?auto_130272 ) ( not ( = ?auto_130268 ?auto_130272 ) ) ( not ( = ?auto_130269 ?auto_130272 ) ) ( not ( = ?auto_130270 ?auto_130272 ) ) ( not ( = ?auto_130271 ?auto_130272 ) ) ( CLEAR ?auto_130269 ) ( ON ?auto_130270 ?auto_130271 ) ( CLEAR ?auto_130270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130275 ) ( ON ?auto_130273 ?auto_130275 ) ( ON ?auto_130274 ?auto_130273 ) ( ON ?auto_130272 ?auto_130274 ) ( not ( = ?auto_130275 ?auto_130273 ) ) ( not ( = ?auto_130275 ?auto_130274 ) ) ( not ( = ?auto_130275 ?auto_130272 ) ) ( not ( = ?auto_130275 ?auto_130271 ) ) ( not ( = ?auto_130275 ?auto_130270 ) ) ( not ( = ?auto_130273 ?auto_130274 ) ) ( not ( = ?auto_130273 ?auto_130272 ) ) ( not ( = ?auto_130273 ?auto_130271 ) ) ( not ( = ?auto_130273 ?auto_130270 ) ) ( not ( = ?auto_130274 ?auto_130272 ) ) ( not ( = ?auto_130274 ?auto_130271 ) ) ( not ( = ?auto_130274 ?auto_130270 ) ) ( not ( = ?auto_130268 ?auto_130275 ) ) ( not ( = ?auto_130268 ?auto_130273 ) ) ( not ( = ?auto_130268 ?auto_130274 ) ) ( not ( = ?auto_130269 ?auto_130275 ) ) ( not ( = ?auto_130269 ?auto_130273 ) ) ( not ( = ?auto_130269 ?auto_130274 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130275 ?auto_130273 ?auto_130274 ?auto_130272 ?auto_130271 )
      ( MAKE-4PILE ?auto_130268 ?auto_130269 ?auto_130270 ?auto_130271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130276 - BLOCK
      ?auto_130277 - BLOCK
      ?auto_130278 - BLOCK
      ?auto_130279 - BLOCK
    )
    :vars
    (
      ?auto_130283 - BLOCK
      ?auto_130282 - BLOCK
      ?auto_130281 - BLOCK
      ?auto_130280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130276 ) ( not ( = ?auto_130276 ?auto_130277 ) ) ( not ( = ?auto_130276 ?auto_130278 ) ) ( not ( = ?auto_130276 ?auto_130279 ) ) ( not ( = ?auto_130277 ?auto_130278 ) ) ( not ( = ?auto_130277 ?auto_130279 ) ) ( not ( = ?auto_130278 ?auto_130279 ) ) ( ON ?auto_130279 ?auto_130283 ) ( not ( = ?auto_130276 ?auto_130283 ) ) ( not ( = ?auto_130277 ?auto_130283 ) ) ( not ( = ?auto_130278 ?auto_130283 ) ) ( not ( = ?auto_130279 ?auto_130283 ) ) ( ON ?auto_130278 ?auto_130279 ) ( CLEAR ?auto_130278 ) ( ON-TABLE ?auto_130282 ) ( ON ?auto_130281 ?auto_130282 ) ( ON ?auto_130280 ?auto_130281 ) ( ON ?auto_130283 ?auto_130280 ) ( not ( = ?auto_130282 ?auto_130281 ) ) ( not ( = ?auto_130282 ?auto_130280 ) ) ( not ( = ?auto_130282 ?auto_130283 ) ) ( not ( = ?auto_130282 ?auto_130279 ) ) ( not ( = ?auto_130282 ?auto_130278 ) ) ( not ( = ?auto_130281 ?auto_130280 ) ) ( not ( = ?auto_130281 ?auto_130283 ) ) ( not ( = ?auto_130281 ?auto_130279 ) ) ( not ( = ?auto_130281 ?auto_130278 ) ) ( not ( = ?auto_130280 ?auto_130283 ) ) ( not ( = ?auto_130280 ?auto_130279 ) ) ( not ( = ?auto_130280 ?auto_130278 ) ) ( not ( = ?auto_130276 ?auto_130282 ) ) ( not ( = ?auto_130276 ?auto_130281 ) ) ( not ( = ?auto_130276 ?auto_130280 ) ) ( not ( = ?auto_130277 ?auto_130282 ) ) ( not ( = ?auto_130277 ?auto_130281 ) ) ( not ( = ?auto_130277 ?auto_130280 ) ) ( HOLDING ?auto_130277 ) ( CLEAR ?auto_130276 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130276 ?auto_130277 )
      ( MAKE-4PILE ?auto_130276 ?auto_130277 ?auto_130278 ?auto_130279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130284 - BLOCK
      ?auto_130285 - BLOCK
      ?auto_130286 - BLOCK
      ?auto_130287 - BLOCK
    )
    :vars
    (
      ?auto_130288 - BLOCK
      ?auto_130291 - BLOCK
      ?auto_130289 - BLOCK
      ?auto_130290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130284 ) ( not ( = ?auto_130284 ?auto_130285 ) ) ( not ( = ?auto_130284 ?auto_130286 ) ) ( not ( = ?auto_130284 ?auto_130287 ) ) ( not ( = ?auto_130285 ?auto_130286 ) ) ( not ( = ?auto_130285 ?auto_130287 ) ) ( not ( = ?auto_130286 ?auto_130287 ) ) ( ON ?auto_130287 ?auto_130288 ) ( not ( = ?auto_130284 ?auto_130288 ) ) ( not ( = ?auto_130285 ?auto_130288 ) ) ( not ( = ?auto_130286 ?auto_130288 ) ) ( not ( = ?auto_130287 ?auto_130288 ) ) ( ON ?auto_130286 ?auto_130287 ) ( ON-TABLE ?auto_130291 ) ( ON ?auto_130289 ?auto_130291 ) ( ON ?auto_130290 ?auto_130289 ) ( ON ?auto_130288 ?auto_130290 ) ( not ( = ?auto_130291 ?auto_130289 ) ) ( not ( = ?auto_130291 ?auto_130290 ) ) ( not ( = ?auto_130291 ?auto_130288 ) ) ( not ( = ?auto_130291 ?auto_130287 ) ) ( not ( = ?auto_130291 ?auto_130286 ) ) ( not ( = ?auto_130289 ?auto_130290 ) ) ( not ( = ?auto_130289 ?auto_130288 ) ) ( not ( = ?auto_130289 ?auto_130287 ) ) ( not ( = ?auto_130289 ?auto_130286 ) ) ( not ( = ?auto_130290 ?auto_130288 ) ) ( not ( = ?auto_130290 ?auto_130287 ) ) ( not ( = ?auto_130290 ?auto_130286 ) ) ( not ( = ?auto_130284 ?auto_130291 ) ) ( not ( = ?auto_130284 ?auto_130289 ) ) ( not ( = ?auto_130284 ?auto_130290 ) ) ( not ( = ?auto_130285 ?auto_130291 ) ) ( not ( = ?auto_130285 ?auto_130289 ) ) ( not ( = ?auto_130285 ?auto_130290 ) ) ( CLEAR ?auto_130284 ) ( ON ?auto_130285 ?auto_130286 ) ( CLEAR ?auto_130285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130291 ?auto_130289 ?auto_130290 ?auto_130288 ?auto_130287 ?auto_130286 )
      ( MAKE-4PILE ?auto_130284 ?auto_130285 ?auto_130286 ?auto_130287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130292 - BLOCK
      ?auto_130293 - BLOCK
      ?auto_130294 - BLOCK
      ?auto_130295 - BLOCK
    )
    :vars
    (
      ?auto_130298 - BLOCK
      ?auto_130296 - BLOCK
      ?auto_130297 - BLOCK
      ?auto_130299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130292 ?auto_130293 ) ) ( not ( = ?auto_130292 ?auto_130294 ) ) ( not ( = ?auto_130292 ?auto_130295 ) ) ( not ( = ?auto_130293 ?auto_130294 ) ) ( not ( = ?auto_130293 ?auto_130295 ) ) ( not ( = ?auto_130294 ?auto_130295 ) ) ( ON ?auto_130295 ?auto_130298 ) ( not ( = ?auto_130292 ?auto_130298 ) ) ( not ( = ?auto_130293 ?auto_130298 ) ) ( not ( = ?auto_130294 ?auto_130298 ) ) ( not ( = ?auto_130295 ?auto_130298 ) ) ( ON ?auto_130294 ?auto_130295 ) ( ON-TABLE ?auto_130296 ) ( ON ?auto_130297 ?auto_130296 ) ( ON ?auto_130299 ?auto_130297 ) ( ON ?auto_130298 ?auto_130299 ) ( not ( = ?auto_130296 ?auto_130297 ) ) ( not ( = ?auto_130296 ?auto_130299 ) ) ( not ( = ?auto_130296 ?auto_130298 ) ) ( not ( = ?auto_130296 ?auto_130295 ) ) ( not ( = ?auto_130296 ?auto_130294 ) ) ( not ( = ?auto_130297 ?auto_130299 ) ) ( not ( = ?auto_130297 ?auto_130298 ) ) ( not ( = ?auto_130297 ?auto_130295 ) ) ( not ( = ?auto_130297 ?auto_130294 ) ) ( not ( = ?auto_130299 ?auto_130298 ) ) ( not ( = ?auto_130299 ?auto_130295 ) ) ( not ( = ?auto_130299 ?auto_130294 ) ) ( not ( = ?auto_130292 ?auto_130296 ) ) ( not ( = ?auto_130292 ?auto_130297 ) ) ( not ( = ?auto_130292 ?auto_130299 ) ) ( not ( = ?auto_130293 ?auto_130296 ) ) ( not ( = ?auto_130293 ?auto_130297 ) ) ( not ( = ?auto_130293 ?auto_130299 ) ) ( ON ?auto_130293 ?auto_130294 ) ( CLEAR ?auto_130293 ) ( HOLDING ?auto_130292 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130292 )
      ( MAKE-4PILE ?auto_130292 ?auto_130293 ?auto_130294 ?auto_130295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130300 - BLOCK
      ?auto_130301 - BLOCK
      ?auto_130302 - BLOCK
      ?auto_130303 - BLOCK
    )
    :vars
    (
      ?auto_130307 - BLOCK
      ?auto_130305 - BLOCK
      ?auto_130306 - BLOCK
      ?auto_130304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130300 ?auto_130301 ) ) ( not ( = ?auto_130300 ?auto_130302 ) ) ( not ( = ?auto_130300 ?auto_130303 ) ) ( not ( = ?auto_130301 ?auto_130302 ) ) ( not ( = ?auto_130301 ?auto_130303 ) ) ( not ( = ?auto_130302 ?auto_130303 ) ) ( ON ?auto_130303 ?auto_130307 ) ( not ( = ?auto_130300 ?auto_130307 ) ) ( not ( = ?auto_130301 ?auto_130307 ) ) ( not ( = ?auto_130302 ?auto_130307 ) ) ( not ( = ?auto_130303 ?auto_130307 ) ) ( ON ?auto_130302 ?auto_130303 ) ( ON-TABLE ?auto_130305 ) ( ON ?auto_130306 ?auto_130305 ) ( ON ?auto_130304 ?auto_130306 ) ( ON ?auto_130307 ?auto_130304 ) ( not ( = ?auto_130305 ?auto_130306 ) ) ( not ( = ?auto_130305 ?auto_130304 ) ) ( not ( = ?auto_130305 ?auto_130307 ) ) ( not ( = ?auto_130305 ?auto_130303 ) ) ( not ( = ?auto_130305 ?auto_130302 ) ) ( not ( = ?auto_130306 ?auto_130304 ) ) ( not ( = ?auto_130306 ?auto_130307 ) ) ( not ( = ?auto_130306 ?auto_130303 ) ) ( not ( = ?auto_130306 ?auto_130302 ) ) ( not ( = ?auto_130304 ?auto_130307 ) ) ( not ( = ?auto_130304 ?auto_130303 ) ) ( not ( = ?auto_130304 ?auto_130302 ) ) ( not ( = ?auto_130300 ?auto_130305 ) ) ( not ( = ?auto_130300 ?auto_130306 ) ) ( not ( = ?auto_130300 ?auto_130304 ) ) ( not ( = ?auto_130301 ?auto_130305 ) ) ( not ( = ?auto_130301 ?auto_130306 ) ) ( not ( = ?auto_130301 ?auto_130304 ) ) ( ON ?auto_130301 ?auto_130302 ) ( ON ?auto_130300 ?auto_130301 ) ( CLEAR ?auto_130300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130305 ?auto_130306 ?auto_130304 ?auto_130307 ?auto_130303 ?auto_130302 ?auto_130301 )
      ( MAKE-4PILE ?auto_130300 ?auto_130301 ?auto_130302 ?auto_130303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130312 - BLOCK
      ?auto_130313 - BLOCK
      ?auto_130314 - BLOCK
      ?auto_130315 - BLOCK
    )
    :vars
    (
      ?auto_130316 - BLOCK
      ?auto_130319 - BLOCK
      ?auto_130317 - BLOCK
      ?auto_130318 - BLOCK
      ?auto_130320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130312 ?auto_130313 ) ) ( not ( = ?auto_130312 ?auto_130314 ) ) ( not ( = ?auto_130312 ?auto_130315 ) ) ( not ( = ?auto_130313 ?auto_130314 ) ) ( not ( = ?auto_130313 ?auto_130315 ) ) ( not ( = ?auto_130314 ?auto_130315 ) ) ( ON ?auto_130315 ?auto_130316 ) ( not ( = ?auto_130312 ?auto_130316 ) ) ( not ( = ?auto_130313 ?auto_130316 ) ) ( not ( = ?auto_130314 ?auto_130316 ) ) ( not ( = ?auto_130315 ?auto_130316 ) ) ( ON ?auto_130314 ?auto_130315 ) ( ON-TABLE ?auto_130319 ) ( ON ?auto_130317 ?auto_130319 ) ( ON ?auto_130318 ?auto_130317 ) ( ON ?auto_130316 ?auto_130318 ) ( not ( = ?auto_130319 ?auto_130317 ) ) ( not ( = ?auto_130319 ?auto_130318 ) ) ( not ( = ?auto_130319 ?auto_130316 ) ) ( not ( = ?auto_130319 ?auto_130315 ) ) ( not ( = ?auto_130319 ?auto_130314 ) ) ( not ( = ?auto_130317 ?auto_130318 ) ) ( not ( = ?auto_130317 ?auto_130316 ) ) ( not ( = ?auto_130317 ?auto_130315 ) ) ( not ( = ?auto_130317 ?auto_130314 ) ) ( not ( = ?auto_130318 ?auto_130316 ) ) ( not ( = ?auto_130318 ?auto_130315 ) ) ( not ( = ?auto_130318 ?auto_130314 ) ) ( not ( = ?auto_130312 ?auto_130319 ) ) ( not ( = ?auto_130312 ?auto_130317 ) ) ( not ( = ?auto_130312 ?auto_130318 ) ) ( not ( = ?auto_130313 ?auto_130319 ) ) ( not ( = ?auto_130313 ?auto_130317 ) ) ( not ( = ?auto_130313 ?auto_130318 ) ) ( ON ?auto_130313 ?auto_130314 ) ( CLEAR ?auto_130313 ) ( ON ?auto_130312 ?auto_130320 ) ( CLEAR ?auto_130312 ) ( HAND-EMPTY ) ( not ( = ?auto_130312 ?auto_130320 ) ) ( not ( = ?auto_130313 ?auto_130320 ) ) ( not ( = ?auto_130314 ?auto_130320 ) ) ( not ( = ?auto_130315 ?auto_130320 ) ) ( not ( = ?auto_130316 ?auto_130320 ) ) ( not ( = ?auto_130319 ?auto_130320 ) ) ( not ( = ?auto_130317 ?auto_130320 ) ) ( not ( = ?auto_130318 ?auto_130320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130312 ?auto_130320 )
      ( MAKE-4PILE ?auto_130312 ?auto_130313 ?auto_130314 ?auto_130315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130321 - BLOCK
      ?auto_130322 - BLOCK
      ?auto_130323 - BLOCK
      ?auto_130324 - BLOCK
    )
    :vars
    (
      ?auto_130326 - BLOCK
      ?auto_130328 - BLOCK
      ?auto_130329 - BLOCK
      ?auto_130325 - BLOCK
      ?auto_130327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130321 ?auto_130322 ) ) ( not ( = ?auto_130321 ?auto_130323 ) ) ( not ( = ?auto_130321 ?auto_130324 ) ) ( not ( = ?auto_130322 ?auto_130323 ) ) ( not ( = ?auto_130322 ?auto_130324 ) ) ( not ( = ?auto_130323 ?auto_130324 ) ) ( ON ?auto_130324 ?auto_130326 ) ( not ( = ?auto_130321 ?auto_130326 ) ) ( not ( = ?auto_130322 ?auto_130326 ) ) ( not ( = ?auto_130323 ?auto_130326 ) ) ( not ( = ?auto_130324 ?auto_130326 ) ) ( ON ?auto_130323 ?auto_130324 ) ( ON-TABLE ?auto_130328 ) ( ON ?auto_130329 ?auto_130328 ) ( ON ?auto_130325 ?auto_130329 ) ( ON ?auto_130326 ?auto_130325 ) ( not ( = ?auto_130328 ?auto_130329 ) ) ( not ( = ?auto_130328 ?auto_130325 ) ) ( not ( = ?auto_130328 ?auto_130326 ) ) ( not ( = ?auto_130328 ?auto_130324 ) ) ( not ( = ?auto_130328 ?auto_130323 ) ) ( not ( = ?auto_130329 ?auto_130325 ) ) ( not ( = ?auto_130329 ?auto_130326 ) ) ( not ( = ?auto_130329 ?auto_130324 ) ) ( not ( = ?auto_130329 ?auto_130323 ) ) ( not ( = ?auto_130325 ?auto_130326 ) ) ( not ( = ?auto_130325 ?auto_130324 ) ) ( not ( = ?auto_130325 ?auto_130323 ) ) ( not ( = ?auto_130321 ?auto_130328 ) ) ( not ( = ?auto_130321 ?auto_130329 ) ) ( not ( = ?auto_130321 ?auto_130325 ) ) ( not ( = ?auto_130322 ?auto_130328 ) ) ( not ( = ?auto_130322 ?auto_130329 ) ) ( not ( = ?auto_130322 ?auto_130325 ) ) ( ON ?auto_130321 ?auto_130327 ) ( CLEAR ?auto_130321 ) ( not ( = ?auto_130321 ?auto_130327 ) ) ( not ( = ?auto_130322 ?auto_130327 ) ) ( not ( = ?auto_130323 ?auto_130327 ) ) ( not ( = ?auto_130324 ?auto_130327 ) ) ( not ( = ?auto_130326 ?auto_130327 ) ) ( not ( = ?auto_130328 ?auto_130327 ) ) ( not ( = ?auto_130329 ?auto_130327 ) ) ( not ( = ?auto_130325 ?auto_130327 ) ) ( HOLDING ?auto_130322 ) ( CLEAR ?auto_130323 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130328 ?auto_130329 ?auto_130325 ?auto_130326 ?auto_130324 ?auto_130323 ?auto_130322 )
      ( MAKE-4PILE ?auto_130321 ?auto_130322 ?auto_130323 ?auto_130324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130330 - BLOCK
      ?auto_130331 - BLOCK
      ?auto_130332 - BLOCK
      ?auto_130333 - BLOCK
    )
    :vars
    (
      ?auto_130338 - BLOCK
      ?auto_130336 - BLOCK
      ?auto_130337 - BLOCK
      ?auto_130334 - BLOCK
      ?auto_130335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130330 ?auto_130331 ) ) ( not ( = ?auto_130330 ?auto_130332 ) ) ( not ( = ?auto_130330 ?auto_130333 ) ) ( not ( = ?auto_130331 ?auto_130332 ) ) ( not ( = ?auto_130331 ?auto_130333 ) ) ( not ( = ?auto_130332 ?auto_130333 ) ) ( ON ?auto_130333 ?auto_130338 ) ( not ( = ?auto_130330 ?auto_130338 ) ) ( not ( = ?auto_130331 ?auto_130338 ) ) ( not ( = ?auto_130332 ?auto_130338 ) ) ( not ( = ?auto_130333 ?auto_130338 ) ) ( ON ?auto_130332 ?auto_130333 ) ( ON-TABLE ?auto_130336 ) ( ON ?auto_130337 ?auto_130336 ) ( ON ?auto_130334 ?auto_130337 ) ( ON ?auto_130338 ?auto_130334 ) ( not ( = ?auto_130336 ?auto_130337 ) ) ( not ( = ?auto_130336 ?auto_130334 ) ) ( not ( = ?auto_130336 ?auto_130338 ) ) ( not ( = ?auto_130336 ?auto_130333 ) ) ( not ( = ?auto_130336 ?auto_130332 ) ) ( not ( = ?auto_130337 ?auto_130334 ) ) ( not ( = ?auto_130337 ?auto_130338 ) ) ( not ( = ?auto_130337 ?auto_130333 ) ) ( not ( = ?auto_130337 ?auto_130332 ) ) ( not ( = ?auto_130334 ?auto_130338 ) ) ( not ( = ?auto_130334 ?auto_130333 ) ) ( not ( = ?auto_130334 ?auto_130332 ) ) ( not ( = ?auto_130330 ?auto_130336 ) ) ( not ( = ?auto_130330 ?auto_130337 ) ) ( not ( = ?auto_130330 ?auto_130334 ) ) ( not ( = ?auto_130331 ?auto_130336 ) ) ( not ( = ?auto_130331 ?auto_130337 ) ) ( not ( = ?auto_130331 ?auto_130334 ) ) ( ON ?auto_130330 ?auto_130335 ) ( not ( = ?auto_130330 ?auto_130335 ) ) ( not ( = ?auto_130331 ?auto_130335 ) ) ( not ( = ?auto_130332 ?auto_130335 ) ) ( not ( = ?auto_130333 ?auto_130335 ) ) ( not ( = ?auto_130338 ?auto_130335 ) ) ( not ( = ?auto_130336 ?auto_130335 ) ) ( not ( = ?auto_130337 ?auto_130335 ) ) ( not ( = ?auto_130334 ?auto_130335 ) ) ( CLEAR ?auto_130332 ) ( ON ?auto_130331 ?auto_130330 ) ( CLEAR ?auto_130331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130335 ?auto_130330 )
      ( MAKE-4PILE ?auto_130330 ?auto_130331 ?auto_130332 ?auto_130333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130339 - BLOCK
      ?auto_130340 - BLOCK
      ?auto_130341 - BLOCK
      ?auto_130342 - BLOCK
    )
    :vars
    (
      ?auto_130345 - BLOCK
      ?auto_130343 - BLOCK
      ?auto_130347 - BLOCK
      ?auto_130346 - BLOCK
      ?auto_130344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130339 ?auto_130340 ) ) ( not ( = ?auto_130339 ?auto_130341 ) ) ( not ( = ?auto_130339 ?auto_130342 ) ) ( not ( = ?auto_130340 ?auto_130341 ) ) ( not ( = ?auto_130340 ?auto_130342 ) ) ( not ( = ?auto_130341 ?auto_130342 ) ) ( ON ?auto_130342 ?auto_130345 ) ( not ( = ?auto_130339 ?auto_130345 ) ) ( not ( = ?auto_130340 ?auto_130345 ) ) ( not ( = ?auto_130341 ?auto_130345 ) ) ( not ( = ?auto_130342 ?auto_130345 ) ) ( ON-TABLE ?auto_130343 ) ( ON ?auto_130347 ?auto_130343 ) ( ON ?auto_130346 ?auto_130347 ) ( ON ?auto_130345 ?auto_130346 ) ( not ( = ?auto_130343 ?auto_130347 ) ) ( not ( = ?auto_130343 ?auto_130346 ) ) ( not ( = ?auto_130343 ?auto_130345 ) ) ( not ( = ?auto_130343 ?auto_130342 ) ) ( not ( = ?auto_130343 ?auto_130341 ) ) ( not ( = ?auto_130347 ?auto_130346 ) ) ( not ( = ?auto_130347 ?auto_130345 ) ) ( not ( = ?auto_130347 ?auto_130342 ) ) ( not ( = ?auto_130347 ?auto_130341 ) ) ( not ( = ?auto_130346 ?auto_130345 ) ) ( not ( = ?auto_130346 ?auto_130342 ) ) ( not ( = ?auto_130346 ?auto_130341 ) ) ( not ( = ?auto_130339 ?auto_130343 ) ) ( not ( = ?auto_130339 ?auto_130347 ) ) ( not ( = ?auto_130339 ?auto_130346 ) ) ( not ( = ?auto_130340 ?auto_130343 ) ) ( not ( = ?auto_130340 ?auto_130347 ) ) ( not ( = ?auto_130340 ?auto_130346 ) ) ( ON ?auto_130339 ?auto_130344 ) ( not ( = ?auto_130339 ?auto_130344 ) ) ( not ( = ?auto_130340 ?auto_130344 ) ) ( not ( = ?auto_130341 ?auto_130344 ) ) ( not ( = ?auto_130342 ?auto_130344 ) ) ( not ( = ?auto_130345 ?auto_130344 ) ) ( not ( = ?auto_130343 ?auto_130344 ) ) ( not ( = ?auto_130347 ?auto_130344 ) ) ( not ( = ?auto_130346 ?auto_130344 ) ) ( ON ?auto_130340 ?auto_130339 ) ( CLEAR ?auto_130340 ) ( ON-TABLE ?auto_130344 ) ( HOLDING ?auto_130341 ) ( CLEAR ?auto_130342 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130343 ?auto_130347 ?auto_130346 ?auto_130345 ?auto_130342 ?auto_130341 )
      ( MAKE-4PILE ?auto_130339 ?auto_130340 ?auto_130341 ?auto_130342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130348 - BLOCK
      ?auto_130349 - BLOCK
      ?auto_130350 - BLOCK
      ?auto_130351 - BLOCK
    )
    :vars
    (
      ?auto_130355 - BLOCK
      ?auto_130353 - BLOCK
      ?auto_130356 - BLOCK
      ?auto_130352 - BLOCK
      ?auto_130354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130348 ?auto_130349 ) ) ( not ( = ?auto_130348 ?auto_130350 ) ) ( not ( = ?auto_130348 ?auto_130351 ) ) ( not ( = ?auto_130349 ?auto_130350 ) ) ( not ( = ?auto_130349 ?auto_130351 ) ) ( not ( = ?auto_130350 ?auto_130351 ) ) ( ON ?auto_130351 ?auto_130355 ) ( not ( = ?auto_130348 ?auto_130355 ) ) ( not ( = ?auto_130349 ?auto_130355 ) ) ( not ( = ?auto_130350 ?auto_130355 ) ) ( not ( = ?auto_130351 ?auto_130355 ) ) ( ON-TABLE ?auto_130353 ) ( ON ?auto_130356 ?auto_130353 ) ( ON ?auto_130352 ?auto_130356 ) ( ON ?auto_130355 ?auto_130352 ) ( not ( = ?auto_130353 ?auto_130356 ) ) ( not ( = ?auto_130353 ?auto_130352 ) ) ( not ( = ?auto_130353 ?auto_130355 ) ) ( not ( = ?auto_130353 ?auto_130351 ) ) ( not ( = ?auto_130353 ?auto_130350 ) ) ( not ( = ?auto_130356 ?auto_130352 ) ) ( not ( = ?auto_130356 ?auto_130355 ) ) ( not ( = ?auto_130356 ?auto_130351 ) ) ( not ( = ?auto_130356 ?auto_130350 ) ) ( not ( = ?auto_130352 ?auto_130355 ) ) ( not ( = ?auto_130352 ?auto_130351 ) ) ( not ( = ?auto_130352 ?auto_130350 ) ) ( not ( = ?auto_130348 ?auto_130353 ) ) ( not ( = ?auto_130348 ?auto_130356 ) ) ( not ( = ?auto_130348 ?auto_130352 ) ) ( not ( = ?auto_130349 ?auto_130353 ) ) ( not ( = ?auto_130349 ?auto_130356 ) ) ( not ( = ?auto_130349 ?auto_130352 ) ) ( ON ?auto_130348 ?auto_130354 ) ( not ( = ?auto_130348 ?auto_130354 ) ) ( not ( = ?auto_130349 ?auto_130354 ) ) ( not ( = ?auto_130350 ?auto_130354 ) ) ( not ( = ?auto_130351 ?auto_130354 ) ) ( not ( = ?auto_130355 ?auto_130354 ) ) ( not ( = ?auto_130353 ?auto_130354 ) ) ( not ( = ?auto_130356 ?auto_130354 ) ) ( not ( = ?auto_130352 ?auto_130354 ) ) ( ON ?auto_130349 ?auto_130348 ) ( ON-TABLE ?auto_130354 ) ( CLEAR ?auto_130351 ) ( ON ?auto_130350 ?auto_130349 ) ( CLEAR ?auto_130350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130354 ?auto_130348 ?auto_130349 )
      ( MAKE-4PILE ?auto_130348 ?auto_130349 ?auto_130350 ?auto_130351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130357 - BLOCK
      ?auto_130358 - BLOCK
      ?auto_130359 - BLOCK
      ?auto_130360 - BLOCK
    )
    :vars
    (
      ?auto_130362 - BLOCK
      ?auto_130363 - BLOCK
      ?auto_130361 - BLOCK
      ?auto_130364 - BLOCK
      ?auto_130365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130357 ?auto_130358 ) ) ( not ( = ?auto_130357 ?auto_130359 ) ) ( not ( = ?auto_130357 ?auto_130360 ) ) ( not ( = ?auto_130358 ?auto_130359 ) ) ( not ( = ?auto_130358 ?auto_130360 ) ) ( not ( = ?auto_130359 ?auto_130360 ) ) ( not ( = ?auto_130357 ?auto_130362 ) ) ( not ( = ?auto_130358 ?auto_130362 ) ) ( not ( = ?auto_130359 ?auto_130362 ) ) ( not ( = ?auto_130360 ?auto_130362 ) ) ( ON-TABLE ?auto_130363 ) ( ON ?auto_130361 ?auto_130363 ) ( ON ?auto_130364 ?auto_130361 ) ( ON ?auto_130362 ?auto_130364 ) ( not ( = ?auto_130363 ?auto_130361 ) ) ( not ( = ?auto_130363 ?auto_130364 ) ) ( not ( = ?auto_130363 ?auto_130362 ) ) ( not ( = ?auto_130363 ?auto_130360 ) ) ( not ( = ?auto_130363 ?auto_130359 ) ) ( not ( = ?auto_130361 ?auto_130364 ) ) ( not ( = ?auto_130361 ?auto_130362 ) ) ( not ( = ?auto_130361 ?auto_130360 ) ) ( not ( = ?auto_130361 ?auto_130359 ) ) ( not ( = ?auto_130364 ?auto_130362 ) ) ( not ( = ?auto_130364 ?auto_130360 ) ) ( not ( = ?auto_130364 ?auto_130359 ) ) ( not ( = ?auto_130357 ?auto_130363 ) ) ( not ( = ?auto_130357 ?auto_130361 ) ) ( not ( = ?auto_130357 ?auto_130364 ) ) ( not ( = ?auto_130358 ?auto_130363 ) ) ( not ( = ?auto_130358 ?auto_130361 ) ) ( not ( = ?auto_130358 ?auto_130364 ) ) ( ON ?auto_130357 ?auto_130365 ) ( not ( = ?auto_130357 ?auto_130365 ) ) ( not ( = ?auto_130358 ?auto_130365 ) ) ( not ( = ?auto_130359 ?auto_130365 ) ) ( not ( = ?auto_130360 ?auto_130365 ) ) ( not ( = ?auto_130362 ?auto_130365 ) ) ( not ( = ?auto_130363 ?auto_130365 ) ) ( not ( = ?auto_130361 ?auto_130365 ) ) ( not ( = ?auto_130364 ?auto_130365 ) ) ( ON ?auto_130358 ?auto_130357 ) ( ON-TABLE ?auto_130365 ) ( ON ?auto_130359 ?auto_130358 ) ( CLEAR ?auto_130359 ) ( HOLDING ?auto_130360 ) ( CLEAR ?auto_130362 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130363 ?auto_130361 ?auto_130364 ?auto_130362 ?auto_130360 )
      ( MAKE-4PILE ?auto_130357 ?auto_130358 ?auto_130359 ?auto_130360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130366 - BLOCK
      ?auto_130367 - BLOCK
      ?auto_130368 - BLOCK
      ?auto_130369 - BLOCK
    )
    :vars
    (
      ?auto_130370 - BLOCK
      ?auto_130371 - BLOCK
      ?auto_130372 - BLOCK
      ?auto_130374 - BLOCK
      ?auto_130373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130366 ?auto_130367 ) ) ( not ( = ?auto_130366 ?auto_130368 ) ) ( not ( = ?auto_130366 ?auto_130369 ) ) ( not ( = ?auto_130367 ?auto_130368 ) ) ( not ( = ?auto_130367 ?auto_130369 ) ) ( not ( = ?auto_130368 ?auto_130369 ) ) ( not ( = ?auto_130366 ?auto_130370 ) ) ( not ( = ?auto_130367 ?auto_130370 ) ) ( not ( = ?auto_130368 ?auto_130370 ) ) ( not ( = ?auto_130369 ?auto_130370 ) ) ( ON-TABLE ?auto_130371 ) ( ON ?auto_130372 ?auto_130371 ) ( ON ?auto_130374 ?auto_130372 ) ( ON ?auto_130370 ?auto_130374 ) ( not ( = ?auto_130371 ?auto_130372 ) ) ( not ( = ?auto_130371 ?auto_130374 ) ) ( not ( = ?auto_130371 ?auto_130370 ) ) ( not ( = ?auto_130371 ?auto_130369 ) ) ( not ( = ?auto_130371 ?auto_130368 ) ) ( not ( = ?auto_130372 ?auto_130374 ) ) ( not ( = ?auto_130372 ?auto_130370 ) ) ( not ( = ?auto_130372 ?auto_130369 ) ) ( not ( = ?auto_130372 ?auto_130368 ) ) ( not ( = ?auto_130374 ?auto_130370 ) ) ( not ( = ?auto_130374 ?auto_130369 ) ) ( not ( = ?auto_130374 ?auto_130368 ) ) ( not ( = ?auto_130366 ?auto_130371 ) ) ( not ( = ?auto_130366 ?auto_130372 ) ) ( not ( = ?auto_130366 ?auto_130374 ) ) ( not ( = ?auto_130367 ?auto_130371 ) ) ( not ( = ?auto_130367 ?auto_130372 ) ) ( not ( = ?auto_130367 ?auto_130374 ) ) ( ON ?auto_130366 ?auto_130373 ) ( not ( = ?auto_130366 ?auto_130373 ) ) ( not ( = ?auto_130367 ?auto_130373 ) ) ( not ( = ?auto_130368 ?auto_130373 ) ) ( not ( = ?auto_130369 ?auto_130373 ) ) ( not ( = ?auto_130370 ?auto_130373 ) ) ( not ( = ?auto_130371 ?auto_130373 ) ) ( not ( = ?auto_130372 ?auto_130373 ) ) ( not ( = ?auto_130374 ?auto_130373 ) ) ( ON ?auto_130367 ?auto_130366 ) ( ON-TABLE ?auto_130373 ) ( ON ?auto_130368 ?auto_130367 ) ( CLEAR ?auto_130370 ) ( ON ?auto_130369 ?auto_130368 ) ( CLEAR ?auto_130369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130373 ?auto_130366 ?auto_130367 ?auto_130368 )
      ( MAKE-4PILE ?auto_130366 ?auto_130367 ?auto_130368 ?auto_130369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130375 - BLOCK
      ?auto_130376 - BLOCK
      ?auto_130377 - BLOCK
      ?auto_130378 - BLOCK
    )
    :vars
    (
      ?auto_130379 - BLOCK
      ?auto_130381 - BLOCK
      ?auto_130380 - BLOCK
      ?auto_130383 - BLOCK
      ?auto_130382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130375 ?auto_130376 ) ) ( not ( = ?auto_130375 ?auto_130377 ) ) ( not ( = ?auto_130375 ?auto_130378 ) ) ( not ( = ?auto_130376 ?auto_130377 ) ) ( not ( = ?auto_130376 ?auto_130378 ) ) ( not ( = ?auto_130377 ?auto_130378 ) ) ( not ( = ?auto_130375 ?auto_130379 ) ) ( not ( = ?auto_130376 ?auto_130379 ) ) ( not ( = ?auto_130377 ?auto_130379 ) ) ( not ( = ?auto_130378 ?auto_130379 ) ) ( ON-TABLE ?auto_130381 ) ( ON ?auto_130380 ?auto_130381 ) ( ON ?auto_130383 ?auto_130380 ) ( not ( = ?auto_130381 ?auto_130380 ) ) ( not ( = ?auto_130381 ?auto_130383 ) ) ( not ( = ?auto_130381 ?auto_130379 ) ) ( not ( = ?auto_130381 ?auto_130378 ) ) ( not ( = ?auto_130381 ?auto_130377 ) ) ( not ( = ?auto_130380 ?auto_130383 ) ) ( not ( = ?auto_130380 ?auto_130379 ) ) ( not ( = ?auto_130380 ?auto_130378 ) ) ( not ( = ?auto_130380 ?auto_130377 ) ) ( not ( = ?auto_130383 ?auto_130379 ) ) ( not ( = ?auto_130383 ?auto_130378 ) ) ( not ( = ?auto_130383 ?auto_130377 ) ) ( not ( = ?auto_130375 ?auto_130381 ) ) ( not ( = ?auto_130375 ?auto_130380 ) ) ( not ( = ?auto_130375 ?auto_130383 ) ) ( not ( = ?auto_130376 ?auto_130381 ) ) ( not ( = ?auto_130376 ?auto_130380 ) ) ( not ( = ?auto_130376 ?auto_130383 ) ) ( ON ?auto_130375 ?auto_130382 ) ( not ( = ?auto_130375 ?auto_130382 ) ) ( not ( = ?auto_130376 ?auto_130382 ) ) ( not ( = ?auto_130377 ?auto_130382 ) ) ( not ( = ?auto_130378 ?auto_130382 ) ) ( not ( = ?auto_130379 ?auto_130382 ) ) ( not ( = ?auto_130381 ?auto_130382 ) ) ( not ( = ?auto_130380 ?auto_130382 ) ) ( not ( = ?auto_130383 ?auto_130382 ) ) ( ON ?auto_130376 ?auto_130375 ) ( ON-TABLE ?auto_130382 ) ( ON ?auto_130377 ?auto_130376 ) ( ON ?auto_130378 ?auto_130377 ) ( CLEAR ?auto_130378 ) ( HOLDING ?auto_130379 ) ( CLEAR ?auto_130383 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130381 ?auto_130380 ?auto_130383 ?auto_130379 )
      ( MAKE-4PILE ?auto_130375 ?auto_130376 ?auto_130377 ?auto_130378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130384 - BLOCK
      ?auto_130385 - BLOCK
      ?auto_130386 - BLOCK
      ?auto_130387 - BLOCK
    )
    :vars
    (
      ?auto_130389 - BLOCK
      ?auto_130390 - BLOCK
      ?auto_130392 - BLOCK
      ?auto_130391 - BLOCK
      ?auto_130388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130384 ?auto_130385 ) ) ( not ( = ?auto_130384 ?auto_130386 ) ) ( not ( = ?auto_130384 ?auto_130387 ) ) ( not ( = ?auto_130385 ?auto_130386 ) ) ( not ( = ?auto_130385 ?auto_130387 ) ) ( not ( = ?auto_130386 ?auto_130387 ) ) ( not ( = ?auto_130384 ?auto_130389 ) ) ( not ( = ?auto_130385 ?auto_130389 ) ) ( not ( = ?auto_130386 ?auto_130389 ) ) ( not ( = ?auto_130387 ?auto_130389 ) ) ( ON-TABLE ?auto_130390 ) ( ON ?auto_130392 ?auto_130390 ) ( ON ?auto_130391 ?auto_130392 ) ( not ( = ?auto_130390 ?auto_130392 ) ) ( not ( = ?auto_130390 ?auto_130391 ) ) ( not ( = ?auto_130390 ?auto_130389 ) ) ( not ( = ?auto_130390 ?auto_130387 ) ) ( not ( = ?auto_130390 ?auto_130386 ) ) ( not ( = ?auto_130392 ?auto_130391 ) ) ( not ( = ?auto_130392 ?auto_130389 ) ) ( not ( = ?auto_130392 ?auto_130387 ) ) ( not ( = ?auto_130392 ?auto_130386 ) ) ( not ( = ?auto_130391 ?auto_130389 ) ) ( not ( = ?auto_130391 ?auto_130387 ) ) ( not ( = ?auto_130391 ?auto_130386 ) ) ( not ( = ?auto_130384 ?auto_130390 ) ) ( not ( = ?auto_130384 ?auto_130392 ) ) ( not ( = ?auto_130384 ?auto_130391 ) ) ( not ( = ?auto_130385 ?auto_130390 ) ) ( not ( = ?auto_130385 ?auto_130392 ) ) ( not ( = ?auto_130385 ?auto_130391 ) ) ( ON ?auto_130384 ?auto_130388 ) ( not ( = ?auto_130384 ?auto_130388 ) ) ( not ( = ?auto_130385 ?auto_130388 ) ) ( not ( = ?auto_130386 ?auto_130388 ) ) ( not ( = ?auto_130387 ?auto_130388 ) ) ( not ( = ?auto_130389 ?auto_130388 ) ) ( not ( = ?auto_130390 ?auto_130388 ) ) ( not ( = ?auto_130392 ?auto_130388 ) ) ( not ( = ?auto_130391 ?auto_130388 ) ) ( ON ?auto_130385 ?auto_130384 ) ( ON-TABLE ?auto_130388 ) ( ON ?auto_130386 ?auto_130385 ) ( ON ?auto_130387 ?auto_130386 ) ( CLEAR ?auto_130391 ) ( ON ?auto_130389 ?auto_130387 ) ( CLEAR ?auto_130389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130388 ?auto_130384 ?auto_130385 ?auto_130386 ?auto_130387 )
      ( MAKE-4PILE ?auto_130384 ?auto_130385 ?auto_130386 ?auto_130387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130393 - BLOCK
      ?auto_130394 - BLOCK
      ?auto_130395 - BLOCK
      ?auto_130396 - BLOCK
    )
    :vars
    (
      ?auto_130398 - BLOCK
      ?auto_130399 - BLOCK
      ?auto_130401 - BLOCK
      ?auto_130397 - BLOCK
      ?auto_130400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130393 ?auto_130394 ) ) ( not ( = ?auto_130393 ?auto_130395 ) ) ( not ( = ?auto_130393 ?auto_130396 ) ) ( not ( = ?auto_130394 ?auto_130395 ) ) ( not ( = ?auto_130394 ?auto_130396 ) ) ( not ( = ?auto_130395 ?auto_130396 ) ) ( not ( = ?auto_130393 ?auto_130398 ) ) ( not ( = ?auto_130394 ?auto_130398 ) ) ( not ( = ?auto_130395 ?auto_130398 ) ) ( not ( = ?auto_130396 ?auto_130398 ) ) ( ON-TABLE ?auto_130399 ) ( ON ?auto_130401 ?auto_130399 ) ( not ( = ?auto_130399 ?auto_130401 ) ) ( not ( = ?auto_130399 ?auto_130397 ) ) ( not ( = ?auto_130399 ?auto_130398 ) ) ( not ( = ?auto_130399 ?auto_130396 ) ) ( not ( = ?auto_130399 ?auto_130395 ) ) ( not ( = ?auto_130401 ?auto_130397 ) ) ( not ( = ?auto_130401 ?auto_130398 ) ) ( not ( = ?auto_130401 ?auto_130396 ) ) ( not ( = ?auto_130401 ?auto_130395 ) ) ( not ( = ?auto_130397 ?auto_130398 ) ) ( not ( = ?auto_130397 ?auto_130396 ) ) ( not ( = ?auto_130397 ?auto_130395 ) ) ( not ( = ?auto_130393 ?auto_130399 ) ) ( not ( = ?auto_130393 ?auto_130401 ) ) ( not ( = ?auto_130393 ?auto_130397 ) ) ( not ( = ?auto_130394 ?auto_130399 ) ) ( not ( = ?auto_130394 ?auto_130401 ) ) ( not ( = ?auto_130394 ?auto_130397 ) ) ( ON ?auto_130393 ?auto_130400 ) ( not ( = ?auto_130393 ?auto_130400 ) ) ( not ( = ?auto_130394 ?auto_130400 ) ) ( not ( = ?auto_130395 ?auto_130400 ) ) ( not ( = ?auto_130396 ?auto_130400 ) ) ( not ( = ?auto_130398 ?auto_130400 ) ) ( not ( = ?auto_130399 ?auto_130400 ) ) ( not ( = ?auto_130401 ?auto_130400 ) ) ( not ( = ?auto_130397 ?auto_130400 ) ) ( ON ?auto_130394 ?auto_130393 ) ( ON-TABLE ?auto_130400 ) ( ON ?auto_130395 ?auto_130394 ) ( ON ?auto_130396 ?auto_130395 ) ( ON ?auto_130398 ?auto_130396 ) ( CLEAR ?auto_130398 ) ( HOLDING ?auto_130397 ) ( CLEAR ?auto_130401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130399 ?auto_130401 ?auto_130397 )
      ( MAKE-4PILE ?auto_130393 ?auto_130394 ?auto_130395 ?auto_130396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130402 - BLOCK
      ?auto_130403 - BLOCK
      ?auto_130404 - BLOCK
      ?auto_130405 - BLOCK
    )
    :vars
    (
      ?auto_130409 - BLOCK
      ?auto_130410 - BLOCK
      ?auto_130406 - BLOCK
      ?auto_130408 - BLOCK
      ?auto_130407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130402 ?auto_130403 ) ) ( not ( = ?auto_130402 ?auto_130404 ) ) ( not ( = ?auto_130402 ?auto_130405 ) ) ( not ( = ?auto_130403 ?auto_130404 ) ) ( not ( = ?auto_130403 ?auto_130405 ) ) ( not ( = ?auto_130404 ?auto_130405 ) ) ( not ( = ?auto_130402 ?auto_130409 ) ) ( not ( = ?auto_130403 ?auto_130409 ) ) ( not ( = ?auto_130404 ?auto_130409 ) ) ( not ( = ?auto_130405 ?auto_130409 ) ) ( ON-TABLE ?auto_130410 ) ( ON ?auto_130406 ?auto_130410 ) ( not ( = ?auto_130410 ?auto_130406 ) ) ( not ( = ?auto_130410 ?auto_130408 ) ) ( not ( = ?auto_130410 ?auto_130409 ) ) ( not ( = ?auto_130410 ?auto_130405 ) ) ( not ( = ?auto_130410 ?auto_130404 ) ) ( not ( = ?auto_130406 ?auto_130408 ) ) ( not ( = ?auto_130406 ?auto_130409 ) ) ( not ( = ?auto_130406 ?auto_130405 ) ) ( not ( = ?auto_130406 ?auto_130404 ) ) ( not ( = ?auto_130408 ?auto_130409 ) ) ( not ( = ?auto_130408 ?auto_130405 ) ) ( not ( = ?auto_130408 ?auto_130404 ) ) ( not ( = ?auto_130402 ?auto_130410 ) ) ( not ( = ?auto_130402 ?auto_130406 ) ) ( not ( = ?auto_130402 ?auto_130408 ) ) ( not ( = ?auto_130403 ?auto_130410 ) ) ( not ( = ?auto_130403 ?auto_130406 ) ) ( not ( = ?auto_130403 ?auto_130408 ) ) ( ON ?auto_130402 ?auto_130407 ) ( not ( = ?auto_130402 ?auto_130407 ) ) ( not ( = ?auto_130403 ?auto_130407 ) ) ( not ( = ?auto_130404 ?auto_130407 ) ) ( not ( = ?auto_130405 ?auto_130407 ) ) ( not ( = ?auto_130409 ?auto_130407 ) ) ( not ( = ?auto_130410 ?auto_130407 ) ) ( not ( = ?auto_130406 ?auto_130407 ) ) ( not ( = ?auto_130408 ?auto_130407 ) ) ( ON ?auto_130403 ?auto_130402 ) ( ON-TABLE ?auto_130407 ) ( ON ?auto_130404 ?auto_130403 ) ( ON ?auto_130405 ?auto_130404 ) ( ON ?auto_130409 ?auto_130405 ) ( CLEAR ?auto_130406 ) ( ON ?auto_130408 ?auto_130409 ) ( CLEAR ?auto_130408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130407 ?auto_130402 ?auto_130403 ?auto_130404 ?auto_130405 ?auto_130409 )
      ( MAKE-4PILE ?auto_130402 ?auto_130403 ?auto_130404 ?auto_130405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130411 - BLOCK
      ?auto_130412 - BLOCK
      ?auto_130413 - BLOCK
      ?auto_130414 - BLOCK
    )
    :vars
    (
      ?auto_130417 - BLOCK
      ?auto_130416 - BLOCK
      ?auto_130415 - BLOCK
      ?auto_130419 - BLOCK
      ?auto_130418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130411 ?auto_130412 ) ) ( not ( = ?auto_130411 ?auto_130413 ) ) ( not ( = ?auto_130411 ?auto_130414 ) ) ( not ( = ?auto_130412 ?auto_130413 ) ) ( not ( = ?auto_130412 ?auto_130414 ) ) ( not ( = ?auto_130413 ?auto_130414 ) ) ( not ( = ?auto_130411 ?auto_130417 ) ) ( not ( = ?auto_130412 ?auto_130417 ) ) ( not ( = ?auto_130413 ?auto_130417 ) ) ( not ( = ?auto_130414 ?auto_130417 ) ) ( ON-TABLE ?auto_130416 ) ( not ( = ?auto_130416 ?auto_130415 ) ) ( not ( = ?auto_130416 ?auto_130419 ) ) ( not ( = ?auto_130416 ?auto_130417 ) ) ( not ( = ?auto_130416 ?auto_130414 ) ) ( not ( = ?auto_130416 ?auto_130413 ) ) ( not ( = ?auto_130415 ?auto_130419 ) ) ( not ( = ?auto_130415 ?auto_130417 ) ) ( not ( = ?auto_130415 ?auto_130414 ) ) ( not ( = ?auto_130415 ?auto_130413 ) ) ( not ( = ?auto_130419 ?auto_130417 ) ) ( not ( = ?auto_130419 ?auto_130414 ) ) ( not ( = ?auto_130419 ?auto_130413 ) ) ( not ( = ?auto_130411 ?auto_130416 ) ) ( not ( = ?auto_130411 ?auto_130415 ) ) ( not ( = ?auto_130411 ?auto_130419 ) ) ( not ( = ?auto_130412 ?auto_130416 ) ) ( not ( = ?auto_130412 ?auto_130415 ) ) ( not ( = ?auto_130412 ?auto_130419 ) ) ( ON ?auto_130411 ?auto_130418 ) ( not ( = ?auto_130411 ?auto_130418 ) ) ( not ( = ?auto_130412 ?auto_130418 ) ) ( not ( = ?auto_130413 ?auto_130418 ) ) ( not ( = ?auto_130414 ?auto_130418 ) ) ( not ( = ?auto_130417 ?auto_130418 ) ) ( not ( = ?auto_130416 ?auto_130418 ) ) ( not ( = ?auto_130415 ?auto_130418 ) ) ( not ( = ?auto_130419 ?auto_130418 ) ) ( ON ?auto_130412 ?auto_130411 ) ( ON-TABLE ?auto_130418 ) ( ON ?auto_130413 ?auto_130412 ) ( ON ?auto_130414 ?auto_130413 ) ( ON ?auto_130417 ?auto_130414 ) ( ON ?auto_130419 ?auto_130417 ) ( CLEAR ?auto_130419 ) ( HOLDING ?auto_130415 ) ( CLEAR ?auto_130416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130416 ?auto_130415 )
      ( MAKE-4PILE ?auto_130411 ?auto_130412 ?auto_130413 ?auto_130414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130420 - BLOCK
      ?auto_130421 - BLOCK
      ?auto_130422 - BLOCK
      ?auto_130423 - BLOCK
    )
    :vars
    (
      ?auto_130426 - BLOCK
      ?auto_130428 - BLOCK
      ?auto_130425 - BLOCK
      ?auto_130427 - BLOCK
      ?auto_130424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130420 ?auto_130421 ) ) ( not ( = ?auto_130420 ?auto_130422 ) ) ( not ( = ?auto_130420 ?auto_130423 ) ) ( not ( = ?auto_130421 ?auto_130422 ) ) ( not ( = ?auto_130421 ?auto_130423 ) ) ( not ( = ?auto_130422 ?auto_130423 ) ) ( not ( = ?auto_130420 ?auto_130426 ) ) ( not ( = ?auto_130421 ?auto_130426 ) ) ( not ( = ?auto_130422 ?auto_130426 ) ) ( not ( = ?auto_130423 ?auto_130426 ) ) ( ON-TABLE ?auto_130428 ) ( not ( = ?auto_130428 ?auto_130425 ) ) ( not ( = ?auto_130428 ?auto_130427 ) ) ( not ( = ?auto_130428 ?auto_130426 ) ) ( not ( = ?auto_130428 ?auto_130423 ) ) ( not ( = ?auto_130428 ?auto_130422 ) ) ( not ( = ?auto_130425 ?auto_130427 ) ) ( not ( = ?auto_130425 ?auto_130426 ) ) ( not ( = ?auto_130425 ?auto_130423 ) ) ( not ( = ?auto_130425 ?auto_130422 ) ) ( not ( = ?auto_130427 ?auto_130426 ) ) ( not ( = ?auto_130427 ?auto_130423 ) ) ( not ( = ?auto_130427 ?auto_130422 ) ) ( not ( = ?auto_130420 ?auto_130428 ) ) ( not ( = ?auto_130420 ?auto_130425 ) ) ( not ( = ?auto_130420 ?auto_130427 ) ) ( not ( = ?auto_130421 ?auto_130428 ) ) ( not ( = ?auto_130421 ?auto_130425 ) ) ( not ( = ?auto_130421 ?auto_130427 ) ) ( ON ?auto_130420 ?auto_130424 ) ( not ( = ?auto_130420 ?auto_130424 ) ) ( not ( = ?auto_130421 ?auto_130424 ) ) ( not ( = ?auto_130422 ?auto_130424 ) ) ( not ( = ?auto_130423 ?auto_130424 ) ) ( not ( = ?auto_130426 ?auto_130424 ) ) ( not ( = ?auto_130428 ?auto_130424 ) ) ( not ( = ?auto_130425 ?auto_130424 ) ) ( not ( = ?auto_130427 ?auto_130424 ) ) ( ON ?auto_130421 ?auto_130420 ) ( ON-TABLE ?auto_130424 ) ( ON ?auto_130422 ?auto_130421 ) ( ON ?auto_130423 ?auto_130422 ) ( ON ?auto_130426 ?auto_130423 ) ( ON ?auto_130427 ?auto_130426 ) ( CLEAR ?auto_130428 ) ( ON ?auto_130425 ?auto_130427 ) ( CLEAR ?auto_130425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130424 ?auto_130420 ?auto_130421 ?auto_130422 ?auto_130423 ?auto_130426 ?auto_130427 )
      ( MAKE-4PILE ?auto_130420 ?auto_130421 ?auto_130422 ?auto_130423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130429 - BLOCK
      ?auto_130430 - BLOCK
      ?auto_130431 - BLOCK
      ?auto_130432 - BLOCK
    )
    :vars
    (
      ?auto_130436 - BLOCK
      ?auto_130433 - BLOCK
      ?auto_130437 - BLOCK
      ?auto_130435 - BLOCK
      ?auto_130434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130429 ?auto_130430 ) ) ( not ( = ?auto_130429 ?auto_130431 ) ) ( not ( = ?auto_130429 ?auto_130432 ) ) ( not ( = ?auto_130430 ?auto_130431 ) ) ( not ( = ?auto_130430 ?auto_130432 ) ) ( not ( = ?auto_130431 ?auto_130432 ) ) ( not ( = ?auto_130429 ?auto_130436 ) ) ( not ( = ?auto_130430 ?auto_130436 ) ) ( not ( = ?auto_130431 ?auto_130436 ) ) ( not ( = ?auto_130432 ?auto_130436 ) ) ( not ( = ?auto_130433 ?auto_130437 ) ) ( not ( = ?auto_130433 ?auto_130435 ) ) ( not ( = ?auto_130433 ?auto_130436 ) ) ( not ( = ?auto_130433 ?auto_130432 ) ) ( not ( = ?auto_130433 ?auto_130431 ) ) ( not ( = ?auto_130437 ?auto_130435 ) ) ( not ( = ?auto_130437 ?auto_130436 ) ) ( not ( = ?auto_130437 ?auto_130432 ) ) ( not ( = ?auto_130437 ?auto_130431 ) ) ( not ( = ?auto_130435 ?auto_130436 ) ) ( not ( = ?auto_130435 ?auto_130432 ) ) ( not ( = ?auto_130435 ?auto_130431 ) ) ( not ( = ?auto_130429 ?auto_130433 ) ) ( not ( = ?auto_130429 ?auto_130437 ) ) ( not ( = ?auto_130429 ?auto_130435 ) ) ( not ( = ?auto_130430 ?auto_130433 ) ) ( not ( = ?auto_130430 ?auto_130437 ) ) ( not ( = ?auto_130430 ?auto_130435 ) ) ( ON ?auto_130429 ?auto_130434 ) ( not ( = ?auto_130429 ?auto_130434 ) ) ( not ( = ?auto_130430 ?auto_130434 ) ) ( not ( = ?auto_130431 ?auto_130434 ) ) ( not ( = ?auto_130432 ?auto_130434 ) ) ( not ( = ?auto_130436 ?auto_130434 ) ) ( not ( = ?auto_130433 ?auto_130434 ) ) ( not ( = ?auto_130437 ?auto_130434 ) ) ( not ( = ?auto_130435 ?auto_130434 ) ) ( ON ?auto_130430 ?auto_130429 ) ( ON-TABLE ?auto_130434 ) ( ON ?auto_130431 ?auto_130430 ) ( ON ?auto_130432 ?auto_130431 ) ( ON ?auto_130436 ?auto_130432 ) ( ON ?auto_130435 ?auto_130436 ) ( ON ?auto_130437 ?auto_130435 ) ( CLEAR ?auto_130437 ) ( HOLDING ?auto_130433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130433 )
      ( MAKE-4PILE ?auto_130429 ?auto_130430 ?auto_130431 ?auto_130432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_130438 - BLOCK
      ?auto_130439 - BLOCK
      ?auto_130440 - BLOCK
      ?auto_130441 - BLOCK
    )
    :vars
    (
      ?auto_130446 - BLOCK
      ?auto_130445 - BLOCK
      ?auto_130444 - BLOCK
      ?auto_130442 - BLOCK
      ?auto_130443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130438 ?auto_130439 ) ) ( not ( = ?auto_130438 ?auto_130440 ) ) ( not ( = ?auto_130438 ?auto_130441 ) ) ( not ( = ?auto_130439 ?auto_130440 ) ) ( not ( = ?auto_130439 ?auto_130441 ) ) ( not ( = ?auto_130440 ?auto_130441 ) ) ( not ( = ?auto_130438 ?auto_130446 ) ) ( not ( = ?auto_130439 ?auto_130446 ) ) ( not ( = ?auto_130440 ?auto_130446 ) ) ( not ( = ?auto_130441 ?auto_130446 ) ) ( not ( = ?auto_130445 ?auto_130444 ) ) ( not ( = ?auto_130445 ?auto_130442 ) ) ( not ( = ?auto_130445 ?auto_130446 ) ) ( not ( = ?auto_130445 ?auto_130441 ) ) ( not ( = ?auto_130445 ?auto_130440 ) ) ( not ( = ?auto_130444 ?auto_130442 ) ) ( not ( = ?auto_130444 ?auto_130446 ) ) ( not ( = ?auto_130444 ?auto_130441 ) ) ( not ( = ?auto_130444 ?auto_130440 ) ) ( not ( = ?auto_130442 ?auto_130446 ) ) ( not ( = ?auto_130442 ?auto_130441 ) ) ( not ( = ?auto_130442 ?auto_130440 ) ) ( not ( = ?auto_130438 ?auto_130445 ) ) ( not ( = ?auto_130438 ?auto_130444 ) ) ( not ( = ?auto_130438 ?auto_130442 ) ) ( not ( = ?auto_130439 ?auto_130445 ) ) ( not ( = ?auto_130439 ?auto_130444 ) ) ( not ( = ?auto_130439 ?auto_130442 ) ) ( ON ?auto_130438 ?auto_130443 ) ( not ( = ?auto_130438 ?auto_130443 ) ) ( not ( = ?auto_130439 ?auto_130443 ) ) ( not ( = ?auto_130440 ?auto_130443 ) ) ( not ( = ?auto_130441 ?auto_130443 ) ) ( not ( = ?auto_130446 ?auto_130443 ) ) ( not ( = ?auto_130445 ?auto_130443 ) ) ( not ( = ?auto_130444 ?auto_130443 ) ) ( not ( = ?auto_130442 ?auto_130443 ) ) ( ON ?auto_130439 ?auto_130438 ) ( ON-TABLE ?auto_130443 ) ( ON ?auto_130440 ?auto_130439 ) ( ON ?auto_130441 ?auto_130440 ) ( ON ?auto_130446 ?auto_130441 ) ( ON ?auto_130442 ?auto_130446 ) ( ON ?auto_130444 ?auto_130442 ) ( ON ?auto_130445 ?auto_130444 ) ( CLEAR ?auto_130445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_130443 ?auto_130438 ?auto_130439 ?auto_130440 ?auto_130441 ?auto_130446 ?auto_130442 ?auto_130444 )
      ( MAKE-4PILE ?auto_130438 ?auto_130439 ?auto_130440 ?auto_130441 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130466 - BLOCK
      ?auto_130467 - BLOCK
      ?auto_130468 - BLOCK
    )
    :vars
    (
      ?auto_130469 - BLOCK
      ?auto_130471 - BLOCK
      ?auto_130470 - BLOCK
      ?auto_130473 - BLOCK
      ?auto_130472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130469 ?auto_130468 ) ( ON-TABLE ?auto_130466 ) ( ON ?auto_130467 ?auto_130466 ) ( ON ?auto_130468 ?auto_130467 ) ( not ( = ?auto_130466 ?auto_130467 ) ) ( not ( = ?auto_130466 ?auto_130468 ) ) ( not ( = ?auto_130466 ?auto_130469 ) ) ( not ( = ?auto_130467 ?auto_130468 ) ) ( not ( = ?auto_130467 ?auto_130469 ) ) ( not ( = ?auto_130468 ?auto_130469 ) ) ( not ( = ?auto_130466 ?auto_130471 ) ) ( not ( = ?auto_130466 ?auto_130470 ) ) ( not ( = ?auto_130467 ?auto_130471 ) ) ( not ( = ?auto_130467 ?auto_130470 ) ) ( not ( = ?auto_130468 ?auto_130471 ) ) ( not ( = ?auto_130468 ?auto_130470 ) ) ( not ( = ?auto_130469 ?auto_130471 ) ) ( not ( = ?auto_130469 ?auto_130470 ) ) ( not ( = ?auto_130471 ?auto_130470 ) ) ( ON ?auto_130471 ?auto_130469 ) ( CLEAR ?auto_130471 ) ( HOLDING ?auto_130470 ) ( CLEAR ?auto_130473 ) ( ON-TABLE ?auto_130472 ) ( ON ?auto_130473 ?auto_130472 ) ( not ( = ?auto_130472 ?auto_130473 ) ) ( not ( = ?auto_130472 ?auto_130470 ) ) ( not ( = ?auto_130473 ?auto_130470 ) ) ( not ( = ?auto_130466 ?auto_130473 ) ) ( not ( = ?auto_130466 ?auto_130472 ) ) ( not ( = ?auto_130467 ?auto_130473 ) ) ( not ( = ?auto_130467 ?auto_130472 ) ) ( not ( = ?auto_130468 ?auto_130473 ) ) ( not ( = ?auto_130468 ?auto_130472 ) ) ( not ( = ?auto_130469 ?auto_130473 ) ) ( not ( = ?auto_130469 ?auto_130472 ) ) ( not ( = ?auto_130471 ?auto_130473 ) ) ( not ( = ?auto_130471 ?auto_130472 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130472 ?auto_130473 ?auto_130470 )
      ( MAKE-3PILE ?auto_130466 ?auto_130467 ?auto_130468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130474 - BLOCK
      ?auto_130475 - BLOCK
      ?auto_130476 - BLOCK
    )
    :vars
    (
      ?auto_130479 - BLOCK
      ?auto_130478 - BLOCK
      ?auto_130481 - BLOCK
      ?auto_130477 - BLOCK
      ?auto_130480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130479 ?auto_130476 ) ( ON-TABLE ?auto_130474 ) ( ON ?auto_130475 ?auto_130474 ) ( ON ?auto_130476 ?auto_130475 ) ( not ( = ?auto_130474 ?auto_130475 ) ) ( not ( = ?auto_130474 ?auto_130476 ) ) ( not ( = ?auto_130474 ?auto_130479 ) ) ( not ( = ?auto_130475 ?auto_130476 ) ) ( not ( = ?auto_130475 ?auto_130479 ) ) ( not ( = ?auto_130476 ?auto_130479 ) ) ( not ( = ?auto_130474 ?auto_130478 ) ) ( not ( = ?auto_130474 ?auto_130481 ) ) ( not ( = ?auto_130475 ?auto_130478 ) ) ( not ( = ?auto_130475 ?auto_130481 ) ) ( not ( = ?auto_130476 ?auto_130478 ) ) ( not ( = ?auto_130476 ?auto_130481 ) ) ( not ( = ?auto_130479 ?auto_130478 ) ) ( not ( = ?auto_130479 ?auto_130481 ) ) ( not ( = ?auto_130478 ?auto_130481 ) ) ( ON ?auto_130478 ?auto_130479 ) ( CLEAR ?auto_130477 ) ( ON-TABLE ?auto_130480 ) ( ON ?auto_130477 ?auto_130480 ) ( not ( = ?auto_130480 ?auto_130477 ) ) ( not ( = ?auto_130480 ?auto_130481 ) ) ( not ( = ?auto_130477 ?auto_130481 ) ) ( not ( = ?auto_130474 ?auto_130477 ) ) ( not ( = ?auto_130474 ?auto_130480 ) ) ( not ( = ?auto_130475 ?auto_130477 ) ) ( not ( = ?auto_130475 ?auto_130480 ) ) ( not ( = ?auto_130476 ?auto_130477 ) ) ( not ( = ?auto_130476 ?auto_130480 ) ) ( not ( = ?auto_130479 ?auto_130477 ) ) ( not ( = ?auto_130479 ?auto_130480 ) ) ( not ( = ?auto_130478 ?auto_130477 ) ) ( not ( = ?auto_130478 ?auto_130480 ) ) ( ON ?auto_130481 ?auto_130478 ) ( CLEAR ?auto_130481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130474 ?auto_130475 ?auto_130476 ?auto_130479 ?auto_130478 )
      ( MAKE-3PILE ?auto_130474 ?auto_130475 ?auto_130476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130482 - BLOCK
      ?auto_130483 - BLOCK
      ?auto_130484 - BLOCK
    )
    :vars
    (
      ?auto_130488 - BLOCK
      ?auto_130487 - BLOCK
      ?auto_130485 - BLOCK
      ?auto_130486 - BLOCK
      ?auto_130489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130488 ?auto_130484 ) ( ON-TABLE ?auto_130482 ) ( ON ?auto_130483 ?auto_130482 ) ( ON ?auto_130484 ?auto_130483 ) ( not ( = ?auto_130482 ?auto_130483 ) ) ( not ( = ?auto_130482 ?auto_130484 ) ) ( not ( = ?auto_130482 ?auto_130488 ) ) ( not ( = ?auto_130483 ?auto_130484 ) ) ( not ( = ?auto_130483 ?auto_130488 ) ) ( not ( = ?auto_130484 ?auto_130488 ) ) ( not ( = ?auto_130482 ?auto_130487 ) ) ( not ( = ?auto_130482 ?auto_130485 ) ) ( not ( = ?auto_130483 ?auto_130487 ) ) ( not ( = ?auto_130483 ?auto_130485 ) ) ( not ( = ?auto_130484 ?auto_130487 ) ) ( not ( = ?auto_130484 ?auto_130485 ) ) ( not ( = ?auto_130488 ?auto_130487 ) ) ( not ( = ?auto_130488 ?auto_130485 ) ) ( not ( = ?auto_130487 ?auto_130485 ) ) ( ON ?auto_130487 ?auto_130488 ) ( ON-TABLE ?auto_130486 ) ( not ( = ?auto_130486 ?auto_130489 ) ) ( not ( = ?auto_130486 ?auto_130485 ) ) ( not ( = ?auto_130489 ?auto_130485 ) ) ( not ( = ?auto_130482 ?auto_130489 ) ) ( not ( = ?auto_130482 ?auto_130486 ) ) ( not ( = ?auto_130483 ?auto_130489 ) ) ( not ( = ?auto_130483 ?auto_130486 ) ) ( not ( = ?auto_130484 ?auto_130489 ) ) ( not ( = ?auto_130484 ?auto_130486 ) ) ( not ( = ?auto_130488 ?auto_130489 ) ) ( not ( = ?auto_130488 ?auto_130486 ) ) ( not ( = ?auto_130487 ?auto_130489 ) ) ( not ( = ?auto_130487 ?auto_130486 ) ) ( ON ?auto_130485 ?auto_130487 ) ( CLEAR ?auto_130485 ) ( HOLDING ?auto_130489 ) ( CLEAR ?auto_130486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130486 ?auto_130489 )
      ( MAKE-3PILE ?auto_130482 ?auto_130483 ?auto_130484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130490 - BLOCK
      ?auto_130491 - BLOCK
      ?auto_130492 - BLOCK
    )
    :vars
    (
      ?auto_130495 - BLOCK
      ?auto_130496 - BLOCK
      ?auto_130494 - BLOCK
      ?auto_130493 - BLOCK
      ?auto_130497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130495 ?auto_130492 ) ( ON-TABLE ?auto_130490 ) ( ON ?auto_130491 ?auto_130490 ) ( ON ?auto_130492 ?auto_130491 ) ( not ( = ?auto_130490 ?auto_130491 ) ) ( not ( = ?auto_130490 ?auto_130492 ) ) ( not ( = ?auto_130490 ?auto_130495 ) ) ( not ( = ?auto_130491 ?auto_130492 ) ) ( not ( = ?auto_130491 ?auto_130495 ) ) ( not ( = ?auto_130492 ?auto_130495 ) ) ( not ( = ?auto_130490 ?auto_130496 ) ) ( not ( = ?auto_130490 ?auto_130494 ) ) ( not ( = ?auto_130491 ?auto_130496 ) ) ( not ( = ?auto_130491 ?auto_130494 ) ) ( not ( = ?auto_130492 ?auto_130496 ) ) ( not ( = ?auto_130492 ?auto_130494 ) ) ( not ( = ?auto_130495 ?auto_130496 ) ) ( not ( = ?auto_130495 ?auto_130494 ) ) ( not ( = ?auto_130496 ?auto_130494 ) ) ( ON ?auto_130496 ?auto_130495 ) ( ON-TABLE ?auto_130493 ) ( not ( = ?auto_130493 ?auto_130497 ) ) ( not ( = ?auto_130493 ?auto_130494 ) ) ( not ( = ?auto_130497 ?auto_130494 ) ) ( not ( = ?auto_130490 ?auto_130497 ) ) ( not ( = ?auto_130490 ?auto_130493 ) ) ( not ( = ?auto_130491 ?auto_130497 ) ) ( not ( = ?auto_130491 ?auto_130493 ) ) ( not ( = ?auto_130492 ?auto_130497 ) ) ( not ( = ?auto_130492 ?auto_130493 ) ) ( not ( = ?auto_130495 ?auto_130497 ) ) ( not ( = ?auto_130495 ?auto_130493 ) ) ( not ( = ?auto_130496 ?auto_130497 ) ) ( not ( = ?auto_130496 ?auto_130493 ) ) ( ON ?auto_130494 ?auto_130496 ) ( CLEAR ?auto_130493 ) ( ON ?auto_130497 ?auto_130494 ) ( CLEAR ?auto_130497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130490 ?auto_130491 ?auto_130492 ?auto_130495 ?auto_130496 ?auto_130494 )
      ( MAKE-3PILE ?auto_130490 ?auto_130491 ?auto_130492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130498 - BLOCK
      ?auto_130499 - BLOCK
      ?auto_130500 - BLOCK
    )
    :vars
    (
      ?auto_130502 - BLOCK
      ?auto_130504 - BLOCK
      ?auto_130501 - BLOCK
      ?auto_130503 - BLOCK
      ?auto_130505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130502 ?auto_130500 ) ( ON-TABLE ?auto_130498 ) ( ON ?auto_130499 ?auto_130498 ) ( ON ?auto_130500 ?auto_130499 ) ( not ( = ?auto_130498 ?auto_130499 ) ) ( not ( = ?auto_130498 ?auto_130500 ) ) ( not ( = ?auto_130498 ?auto_130502 ) ) ( not ( = ?auto_130499 ?auto_130500 ) ) ( not ( = ?auto_130499 ?auto_130502 ) ) ( not ( = ?auto_130500 ?auto_130502 ) ) ( not ( = ?auto_130498 ?auto_130504 ) ) ( not ( = ?auto_130498 ?auto_130501 ) ) ( not ( = ?auto_130499 ?auto_130504 ) ) ( not ( = ?auto_130499 ?auto_130501 ) ) ( not ( = ?auto_130500 ?auto_130504 ) ) ( not ( = ?auto_130500 ?auto_130501 ) ) ( not ( = ?auto_130502 ?auto_130504 ) ) ( not ( = ?auto_130502 ?auto_130501 ) ) ( not ( = ?auto_130504 ?auto_130501 ) ) ( ON ?auto_130504 ?auto_130502 ) ( not ( = ?auto_130503 ?auto_130505 ) ) ( not ( = ?auto_130503 ?auto_130501 ) ) ( not ( = ?auto_130505 ?auto_130501 ) ) ( not ( = ?auto_130498 ?auto_130505 ) ) ( not ( = ?auto_130498 ?auto_130503 ) ) ( not ( = ?auto_130499 ?auto_130505 ) ) ( not ( = ?auto_130499 ?auto_130503 ) ) ( not ( = ?auto_130500 ?auto_130505 ) ) ( not ( = ?auto_130500 ?auto_130503 ) ) ( not ( = ?auto_130502 ?auto_130505 ) ) ( not ( = ?auto_130502 ?auto_130503 ) ) ( not ( = ?auto_130504 ?auto_130505 ) ) ( not ( = ?auto_130504 ?auto_130503 ) ) ( ON ?auto_130501 ?auto_130504 ) ( ON ?auto_130505 ?auto_130501 ) ( CLEAR ?auto_130505 ) ( HOLDING ?auto_130503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130503 )
      ( MAKE-3PILE ?auto_130498 ?auto_130499 ?auto_130500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130517 - BLOCK
      ?auto_130518 - BLOCK
      ?auto_130519 - BLOCK
    )
    :vars
    (
      ?auto_130522 - BLOCK
      ?auto_130521 - BLOCK
      ?auto_130520 - BLOCK
      ?auto_130524 - BLOCK
      ?auto_130523 - BLOCK
      ?auto_130525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130522 ?auto_130519 ) ( ON-TABLE ?auto_130517 ) ( ON ?auto_130518 ?auto_130517 ) ( ON ?auto_130519 ?auto_130518 ) ( not ( = ?auto_130517 ?auto_130518 ) ) ( not ( = ?auto_130517 ?auto_130519 ) ) ( not ( = ?auto_130517 ?auto_130522 ) ) ( not ( = ?auto_130518 ?auto_130519 ) ) ( not ( = ?auto_130518 ?auto_130522 ) ) ( not ( = ?auto_130519 ?auto_130522 ) ) ( not ( = ?auto_130517 ?auto_130521 ) ) ( not ( = ?auto_130517 ?auto_130520 ) ) ( not ( = ?auto_130518 ?auto_130521 ) ) ( not ( = ?auto_130518 ?auto_130520 ) ) ( not ( = ?auto_130519 ?auto_130521 ) ) ( not ( = ?auto_130519 ?auto_130520 ) ) ( not ( = ?auto_130522 ?auto_130521 ) ) ( not ( = ?auto_130522 ?auto_130520 ) ) ( not ( = ?auto_130521 ?auto_130520 ) ) ( ON ?auto_130521 ?auto_130522 ) ( not ( = ?auto_130524 ?auto_130523 ) ) ( not ( = ?auto_130524 ?auto_130520 ) ) ( not ( = ?auto_130523 ?auto_130520 ) ) ( not ( = ?auto_130517 ?auto_130523 ) ) ( not ( = ?auto_130517 ?auto_130524 ) ) ( not ( = ?auto_130518 ?auto_130523 ) ) ( not ( = ?auto_130518 ?auto_130524 ) ) ( not ( = ?auto_130519 ?auto_130523 ) ) ( not ( = ?auto_130519 ?auto_130524 ) ) ( not ( = ?auto_130522 ?auto_130523 ) ) ( not ( = ?auto_130522 ?auto_130524 ) ) ( not ( = ?auto_130521 ?auto_130523 ) ) ( not ( = ?auto_130521 ?auto_130524 ) ) ( ON ?auto_130520 ?auto_130521 ) ( ON ?auto_130523 ?auto_130520 ) ( CLEAR ?auto_130523 ) ( ON ?auto_130524 ?auto_130525 ) ( CLEAR ?auto_130524 ) ( HAND-EMPTY ) ( not ( = ?auto_130517 ?auto_130525 ) ) ( not ( = ?auto_130518 ?auto_130525 ) ) ( not ( = ?auto_130519 ?auto_130525 ) ) ( not ( = ?auto_130522 ?auto_130525 ) ) ( not ( = ?auto_130521 ?auto_130525 ) ) ( not ( = ?auto_130520 ?auto_130525 ) ) ( not ( = ?auto_130524 ?auto_130525 ) ) ( not ( = ?auto_130523 ?auto_130525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130524 ?auto_130525 )
      ( MAKE-3PILE ?auto_130517 ?auto_130518 ?auto_130519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130526 - BLOCK
      ?auto_130527 - BLOCK
      ?auto_130528 - BLOCK
    )
    :vars
    (
      ?auto_130534 - BLOCK
      ?auto_130529 - BLOCK
      ?auto_130532 - BLOCK
      ?auto_130531 - BLOCK
      ?auto_130533 - BLOCK
      ?auto_130530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130534 ?auto_130528 ) ( ON-TABLE ?auto_130526 ) ( ON ?auto_130527 ?auto_130526 ) ( ON ?auto_130528 ?auto_130527 ) ( not ( = ?auto_130526 ?auto_130527 ) ) ( not ( = ?auto_130526 ?auto_130528 ) ) ( not ( = ?auto_130526 ?auto_130534 ) ) ( not ( = ?auto_130527 ?auto_130528 ) ) ( not ( = ?auto_130527 ?auto_130534 ) ) ( not ( = ?auto_130528 ?auto_130534 ) ) ( not ( = ?auto_130526 ?auto_130529 ) ) ( not ( = ?auto_130526 ?auto_130532 ) ) ( not ( = ?auto_130527 ?auto_130529 ) ) ( not ( = ?auto_130527 ?auto_130532 ) ) ( not ( = ?auto_130528 ?auto_130529 ) ) ( not ( = ?auto_130528 ?auto_130532 ) ) ( not ( = ?auto_130534 ?auto_130529 ) ) ( not ( = ?auto_130534 ?auto_130532 ) ) ( not ( = ?auto_130529 ?auto_130532 ) ) ( ON ?auto_130529 ?auto_130534 ) ( not ( = ?auto_130531 ?auto_130533 ) ) ( not ( = ?auto_130531 ?auto_130532 ) ) ( not ( = ?auto_130533 ?auto_130532 ) ) ( not ( = ?auto_130526 ?auto_130533 ) ) ( not ( = ?auto_130526 ?auto_130531 ) ) ( not ( = ?auto_130527 ?auto_130533 ) ) ( not ( = ?auto_130527 ?auto_130531 ) ) ( not ( = ?auto_130528 ?auto_130533 ) ) ( not ( = ?auto_130528 ?auto_130531 ) ) ( not ( = ?auto_130534 ?auto_130533 ) ) ( not ( = ?auto_130534 ?auto_130531 ) ) ( not ( = ?auto_130529 ?auto_130533 ) ) ( not ( = ?auto_130529 ?auto_130531 ) ) ( ON ?auto_130532 ?auto_130529 ) ( ON ?auto_130531 ?auto_130530 ) ( CLEAR ?auto_130531 ) ( not ( = ?auto_130526 ?auto_130530 ) ) ( not ( = ?auto_130527 ?auto_130530 ) ) ( not ( = ?auto_130528 ?auto_130530 ) ) ( not ( = ?auto_130534 ?auto_130530 ) ) ( not ( = ?auto_130529 ?auto_130530 ) ) ( not ( = ?auto_130532 ?auto_130530 ) ) ( not ( = ?auto_130531 ?auto_130530 ) ) ( not ( = ?auto_130533 ?auto_130530 ) ) ( HOLDING ?auto_130533 ) ( CLEAR ?auto_130532 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130526 ?auto_130527 ?auto_130528 ?auto_130534 ?auto_130529 ?auto_130532 ?auto_130533 )
      ( MAKE-3PILE ?auto_130526 ?auto_130527 ?auto_130528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130535 - BLOCK
      ?auto_130536 - BLOCK
      ?auto_130537 - BLOCK
    )
    :vars
    (
      ?auto_130538 - BLOCK
      ?auto_130542 - BLOCK
      ?auto_130539 - BLOCK
      ?auto_130541 - BLOCK
      ?auto_130543 - BLOCK
      ?auto_130540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130538 ?auto_130537 ) ( ON-TABLE ?auto_130535 ) ( ON ?auto_130536 ?auto_130535 ) ( ON ?auto_130537 ?auto_130536 ) ( not ( = ?auto_130535 ?auto_130536 ) ) ( not ( = ?auto_130535 ?auto_130537 ) ) ( not ( = ?auto_130535 ?auto_130538 ) ) ( not ( = ?auto_130536 ?auto_130537 ) ) ( not ( = ?auto_130536 ?auto_130538 ) ) ( not ( = ?auto_130537 ?auto_130538 ) ) ( not ( = ?auto_130535 ?auto_130542 ) ) ( not ( = ?auto_130535 ?auto_130539 ) ) ( not ( = ?auto_130536 ?auto_130542 ) ) ( not ( = ?auto_130536 ?auto_130539 ) ) ( not ( = ?auto_130537 ?auto_130542 ) ) ( not ( = ?auto_130537 ?auto_130539 ) ) ( not ( = ?auto_130538 ?auto_130542 ) ) ( not ( = ?auto_130538 ?auto_130539 ) ) ( not ( = ?auto_130542 ?auto_130539 ) ) ( ON ?auto_130542 ?auto_130538 ) ( not ( = ?auto_130541 ?auto_130543 ) ) ( not ( = ?auto_130541 ?auto_130539 ) ) ( not ( = ?auto_130543 ?auto_130539 ) ) ( not ( = ?auto_130535 ?auto_130543 ) ) ( not ( = ?auto_130535 ?auto_130541 ) ) ( not ( = ?auto_130536 ?auto_130543 ) ) ( not ( = ?auto_130536 ?auto_130541 ) ) ( not ( = ?auto_130537 ?auto_130543 ) ) ( not ( = ?auto_130537 ?auto_130541 ) ) ( not ( = ?auto_130538 ?auto_130543 ) ) ( not ( = ?auto_130538 ?auto_130541 ) ) ( not ( = ?auto_130542 ?auto_130543 ) ) ( not ( = ?auto_130542 ?auto_130541 ) ) ( ON ?auto_130539 ?auto_130542 ) ( ON ?auto_130541 ?auto_130540 ) ( not ( = ?auto_130535 ?auto_130540 ) ) ( not ( = ?auto_130536 ?auto_130540 ) ) ( not ( = ?auto_130537 ?auto_130540 ) ) ( not ( = ?auto_130538 ?auto_130540 ) ) ( not ( = ?auto_130542 ?auto_130540 ) ) ( not ( = ?auto_130539 ?auto_130540 ) ) ( not ( = ?auto_130541 ?auto_130540 ) ) ( not ( = ?auto_130543 ?auto_130540 ) ) ( CLEAR ?auto_130539 ) ( ON ?auto_130543 ?auto_130541 ) ( CLEAR ?auto_130543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130540 ?auto_130541 )
      ( MAKE-3PILE ?auto_130535 ?auto_130536 ?auto_130537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_130544 - BLOCK
      ?auto_130545 - BLOCK
      ?auto_130546 - BLOCK
    )
    :vars
    (
      ?auto_130547 - BLOCK
      ?auto_130548 - BLOCK
      ?auto_130549 - BLOCK
      ?auto_130551 - BLOCK
      ?auto_130552 - BLOCK
      ?auto_130550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130547 ?auto_130546 ) ( ON-TABLE ?auto_130544 ) ( ON ?auto_130545 ?auto_130544 ) ( ON ?auto_130546 ?auto_130545 ) ( not ( = ?auto_130544 ?auto_130545 ) ) ( not ( = ?auto_130544 ?auto_130546 ) ) ( not ( = ?auto_130544 ?auto_130547 ) ) ( not ( = ?auto_130545 ?auto_130546 ) ) ( not ( = ?auto_130545 ?auto_130547 ) ) ( not ( = ?auto_130546 ?auto_130547 ) ) ( not ( = ?auto_130544 ?auto_130548 ) ) ( not ( = ?auto_130544 ?auto_130549 ) ) ( not ( = ?auto_130545 ?auto_130548 ) ) ( not ( = ?auto_130545 ?auto_130549 ) ) ( not ( = ?auto_130546 ?auto_130548 ) ) ( not ( = ?auto_130546 ?auto_130549 ) ) ( not ( = ?auto_130547 ?auto_130548 ) ) ( not ( = ?auto_130547 ?auto_130549 ) ) ( not ( = ?auto_130548 ?auto_130549 ) ) ( ON ?auto_130548 ?auto_130547 ) ( not ( = ?auto_130551 ?auto_130552 ) ) ( not ( = ?auto_130551 ?auto_130549 ) ) ( not ( = ?auto_130552 ?auto_130549 ) ) ( not ( = ?auto_130544 ?auto_130552 ) ) ( not ( = ?auto_130544 ?auto_130551 ) ) ( not ( = ?auto_130545 ?auto_130552 ) ) ( not ( = ?auto_130545 ?auto_130551 ) ) ( not ( = ?auto_130546 ?auto_130552 ) ) ( not ( = ?auto_130546 ?auto_130551 ) ) ( not ( = ?auto_130547 ?auto_130552 ) ) ( not ( = ?auto_130547 ?auto_130551 ) ) ( not ( = ?auto_130548 ?auto_130552 ) ) ( not ( = ?auto_130548 ?auto_130551 ) ) ( ON ?auto_130551 ?auto_130550 ) ( not ( = ?auto_130544 ?auto_130550 ) ) ( not ( = ?auto_130545 ?auto_130550 ) ) ( not ( = ?auto_130546 ?auto_130550 ) ) ( not ( = ?auto_130547 ?auto_130550 ) ) ( not ( = ?auto_130548 ?auto_130550 ) ) ( not ( = ?auto_130549 ?auto_130550 ) ) ( not ( = ?auto_130551 ?auto_130550 ) ) ( not ( = ?auto_130552 ?auto_130550 ) ) ( ON ?auto_130552 ?auto_130551 ) ( CLEAR ?auto_130552 ) ( ON-TABLE ?auto_130550 ) ( HOLDING ?auto_130549 ) ( CLEAR ?auto_130548 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130544 ?auto_130545 ?auto_130546 ?auto_130547 ?auto_130548 ?auto_130549 )
      ( MAKE-3PILE ?auto_130544 ?auto_130545 ?auto_130546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130611 - BLOCK
      ?auto_130612 - BLOCK
      ?auto_130613 - BLOCK
      ?auto_130614 - BLOCK
      ?auto_130615 - BLOCK
    )
    :vars
    (
      ?auto_130616 - BLOCK
      ?auto_130618 - BLOCK
      ?auto_130617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130611 ) ( ON ?auto_130612 ?auto_130611 ) ( ON ?auto_130613 ?auto_130612 ) ( not ( = ?auto_130611 ?auto_130612 ) ) ( not ( = ?auto_130611 ?auto_130613 ) ) ( not ( = ?auto_130611 ?auto_130614 ) ) ( not ( = ?auto_130611 ?auto_130615 ) ) ( not ( = ?auto_130612 ?auto_130613 ) ) ( not ( = ?auto_130612 ?auto_130614 ) ) ( not ( = ?auto_130612 ?auto_130615 ) ) ( not ( = ?auto_130613 ?auto_130614 ) ) ( not ( = ?auto_130613 ?auto_130615 ) ) ( not ( = ?auto_130614 ?auto_130615 ) ) ( ON ?auto_130615 ?auto_130616 ) ( not ( = ?auto_130611 ?auto_130616 ) ) ( not ( = ?auto_130612 ?auto_130616 ) ) ( not ( = ?auto_130613 ?auto_130616 ) ) ( not ( = ?auto_130614 ?auto_130616 ) ) ( not ( = ?auto_130615 ?auto_130616 ) ) ( CLEAR ?auto_130613 ) ( ON ?auto_130614 ?auto_130615 ) ( CLEAR ?auto_130614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130618 ) ( ON ?auto_130617 ?auto_130618 ) ( ON ?auto_130616 ?auto_130617 ) ( not ( = ?auto_130618 ?auto_130617 ) ) ( not ( = ?auto_130618 ?auto_130616 ) ) ( not ( = ?auto_130618 ?auto_130615 ) ) ( not ( = ?auto_130618 ?auto_130614 ) ) ( not ( = ?auto_130617 ?auto_130616 ) ) ( not ( = ?auto_130617 ?auto_130615 ) ) ( not ( = ?auto_130617 ?auto_130614 ) ) ( not ( = ?auto_130611 ?auto_130618 ) ) ( not ( = ?auto_130611 ?auto_130617 ) ) ( not ( = ?auto_130612 ?auto_130618 ) ) ( not ( = ?auto_130612 ?auto_130617 ) ) ( not ( = ?auto_130613 ?auto_130618 ) ) ( not ( = ?auto_130613 ?auto_130617 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130618 ?auto_130617 ?auto_130616 ?auto_130615 )
      ( MAKE-5PILE ?auto_130611 ?auto_130612 ?auto_130613 ?auto_130614 ?auto_130615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130619 - BLOCK
      ?auto_130620 - BLOCK
      ?auto_130621 - BLOCK
      ?auto_130622 - BLOCK
      ?auto_130623 - BLOCK
    )
    :vars
    (
      ?auto_130624 - BLOCK
      ?auto_130625 - BLOCK
      ?auto_130626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130619 ) ( ON ?auto_130620 ?auto_130619 ) ( not ( = ?auto_130619 ?auto_130620 ) ) ( not ( = ?auto_130619 ?auto_130621 ) ) ( not ( = ?auto_130619 ?auto_130622 ) ) ( not ( = ?auto_130619 ?auto_130623 ) ) ( not ( = ?auto_130620 ?auto_130621 ) ) ( not ( = ?auto_130620 ?auto_130622 ) ) ( not ( = ?auto_130620 ?auto_130623 ) ) ( not ( = ?auto_130621 ?auto_130622 ) ) ( not ( = ?auto_130621 ?auto_130623 ) ) ( not ( = ?auto_130622 ?auto_130623 ) ) ( ON ?auto_130623 ?auto_130624 ) ( not ( = ?auto_130619 ?auto_130624 ) ) ( not ( = ?auto_130620 ?auto_130624 ) ) ( not ( = ?auto_130621 ?auto_130624 ) ) ( not ( = ?auto_130622 ?auto_130624 ) ) ( not ( = ?auto_130623 ?auto_130624 ) ) ( ON ?auto_130622 ?auto_130623 ) ( CLEAR ?auto_130622 ) ( ON-TABLE ?auto_130625 ) ( ON ?auto_130626 ?auto_130625 ) ( ON ?auto_130624 ?auto_130626 ) ( not ( = ?auto_130625 ?auto_130626 ) ) ( not ( = ?auto_130625 ?auto_130624 ) ) ( not ( = ?auto_130625 ?auto_130623 ) ) ( not ( = ?auto_130625 ?auto_130622 ) ) ( not ( = ?auto_130626 ?auto_130624 ) ) ( not ( = ?auto_130626 ?auto_130623 ) ) ( not ( = ?auto_130626 ?auto_130622 ) ) ( not ( = ?auto_130619 ?auto_130625 ) ) ( not ( = ?auto_130619 ?auto_130626 ) ) ( not ( = ?auto_130620 ?auto_130625 ) ) ( not ( = ?auto_130620 ?auto_130626 ) ) ( not ( = ?auto_130621 ?auto_130625 ) ) ( not ( = ?auto_130621 ?auto_130626 ) ) ( HOLDING ?auto_130621 ) ( CLEAR ?auto_130620 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130619 ?auto_130620 ?auto_130621 )
      ( MAKE-5PILE ?auto_130619 ?auto_130620 ?auto_130621 ?auto_130622 ?auto_130623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130627 - BLOCK
      ?auto_130628 - BLOCK
      ?auto_130629 - BLOCK
      ?auto_130630 - BLOCK
      ?auto_130631 - BLOCK
    )
    :vars
    (
      ?auto_130633 - BLOCK
      ?auto_130634 - BLOCK
      ?auto_130632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130627 ) ( ON ?auto_130628 ?auto_130627 ) ( not ( = ?auto_130627 ?auto_130628 ) ) ( not ( = ?auto_130627 ?auto_130629 ) ) ( not ( = ?auto_130627 ?auto_130630 ) ) ( not ( = ?auto_130627 ?auto_130631 ) ) ( not ( = ?auto_130628 ?auto_130629 ) ) ( not ( = ?auto_130628 ?auto_130630 ) ) ( not ( = ?auto_130628 ?auto_130631 ) ) ( not ( = ?auto_130629 ?auto_130630 ) ) ( not ( = ?auto_130629 ?auto_130631 ) ) ( not ( = ?auto_130630 ?auto_130631 ) ) ( ON ?auto_130631 ?auto_130633 ) ( not ( = ?auto_130627 ?auto_130633 ) ) ( not ( = ?auto_130628 ?auto_130633 ) ) ( not ( = ?auto_130629 ?auto_130633 ) ) ( not ( = ?auto_130630 ?auto_130633 ) ) ( not ( = ?auto_130631 ?auto_130633 ) ) ( ON ?auto_130630 ?auto_130631 ) ( ON-TABLE ?auto_130634 ) ( ON ?auto_130632 ?auto_130634 ) ( ON ?auto_130633 ?auto_130632 ) ( not ( = ?auto_130634 ?auto_130632 ) ) ( not ( = ?auto_130634 ?auto_130633 ) ) ( not ( = ?auto_130634 ?auto_130631 ) ) ( not ( = ?auto_130634 ?auto_130630 ) ) ( not ( = ?auto_130632 ?auto_130633 ) ) ( not ( = ?auto_130632 ?auto_130631 ) ) ( not ( = ?auto_130632 ?auto_130630 ) ) ( not ( = ?auto_130627 ?auto_130634 ) ) ( not ( = ?auto_130627 ?auto_130632 ) ) ( not ( = ?auto_130628 ?auto_130634 ) ) ( not ( = ?auto_130628 ?auto_130632 ) ) ( not ( = ?auto_130629 ?auto_130634 ) ) ( not ( = ?auto_130629 ?auto_130632 ) ) ( CLEAR ?auto_130628 ) ( ON ?auto_130629 ?auto_130630 ) ( CLEAR ?auto_130629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130634 ?auto_130632 ?auto_130633 ?auto_130631 ?auto_130630 )
      ( MAKE-5PILE ?auto_130627 ?auto_130628 ?auto_130629 ?auto_130630 ?auto_130631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130635 - BLOCK
      ?auto_130636 - BLOCK
      ?auto_130637 - BLOCK
      ?auto_130638 - BLOCK
      ?auto_130639 - BLOCK
    )
    :vars
    (
      ?auto_130640 - BLOCK
      ?auto_130642 - BLOCK
      ?auto_130641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130635 ) ( not ( = ?auto_130635 ?auto_130636 ) ) ( not ( = ?auto_130635 ?auto_130637 ) ) ( not ( = ?auto_130635 ?auto_130638 ) ) ( not ( = ?auto_130635 ?auto_130639 ) ) ( not ( = ?auto_130636 ?auto_130637 ) ) ( not ( = ?auto_130636 ?auto_130638 ) ) ( not ( = ?auto_130636 ?auto_130639 ) ) ( not ( = ?auto_130637 ?auto_130638 ) ) ( not ( = ?auto_130637 ?auto_130639 ) ) ( not ( = ?auto_130638 ?auto_130639 ) ) ( ON ?auto_130639 ?auto_130640 ) ( not ( = ?auto_130635 ?auto_130640 ) ) ( not ( = ?auto_130636 ?auto_130640 ) ) ( not ( = ?auto_130637 ?auto_130640 ) ) ( not ( = ?auto_130638 ?auto_130640 ) ) ( not ( = ?auto_130639 ?auto_130640 ) ) ( ON ?auto_130638 ?auto_130639 ) ( ON-TABLE ?auto_130642 ) ( ON ?auto_130641 ?auto_130642 ) ( ON ?auto_130640 ?auto_130641 ) ( not ( = ?auto_130642 ?auto_130641 ) ) ( not ( = ?auto_130642 ?auto_130640 ) ) ( not ( = ?auto_130642 ?auto_130639 ) ) ( not ( = ?auto_130642 ?auto_130638 ) ) ( not ( = ?auto_130641 ?auto_130640 ) ) ( not ( = ?auto_130641 ?auto_130639 ) ) ( not ( = ?auto_130641 ?auto_130638 ) ) ( not ( = ?auto_130635 ?auto_130642 ) ) ( not ( = ?auto_130635 ?auto_130641 ) ) ( not ( = ?auto_130636 ?auto_130642 ) ) ( not ( = ?auto_130636 ?auto_130641 ) ) ( not ( = ?auto_130637 ?auto_130642 ) ) ( not ( = ?auto_130637 ?auto_130641 ) ) ( ON ?auto_130637 ?auto_130638 ) ( CLEAR ?auto_130637 ) ( HOLDING ?auto_130636 ) ( CLEAR ?auto_130635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130635 ?auto_130636 )
      ( MAKE-5PILE ?auto_130635 ?auto_130636 ?auto_130637 ?auto_130638 ?auto_130639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130643 - BLOCK
      ?auto_130644 - BLOCK
      ?auto_130645 - BLOCK
      ?auto_130646 - BLOCK
      ?auto_130647 - BLOCK
    )
    :vars
    (
      ?auto_130649 - BLOCK
      ?auto_130650 - BLOCK
      ?auto_130648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130643 ) ( not ( = ?auto_130643 ?auto_130644 ) ) ( not ( = ?auto_130643 ?auto_130645 ) ) ( not ( = ?auto_130643 ?auto_130646 ) ) ( not ( = ?auto_130643 ?auto_130647 ) ) ( not ( = ?auto_130644 ?auto_130645 ) ) ( not ( = ?auto_130644 ?auto_130646 ) ) ( not ( = ?auto_130644 ?auto_130647 ) ) ( not ( = ?auto_130645 ?auto_130646 ) ) ( not ( = ?auto_130645 ?auto_130647 ) ) ( not ( = ?auto_130646 ?auto_130647 ) ) ( ON ?auto_130647 ?auto_130649 ) ( not ( = ?auto_130643 ?auto_130649 ) ) ( not ( = ?auto_130644 ?auto_130649 ) ) ( not ( = ?auto_130645 ?auto_130649 ) ) ( not ( = ?auto_130646 ?auto_130649 ) ) ( not ( = ?auto_130647 ?auto_130649 ) ) ( ON ?auto_130646 ?auto_130647 ) ( ON-TABLE ?auto_130650 ) ( ON ?auto_130648 ?auto_130650 ) ( ON ?auto_130649 ?auto_130648 ) ( not ( = ?auto_130650 ?auto_130648 ) ) ( not ( = ?auto_130650 ?auto_130649 ) ) ( not ( = ?auto_130650 ?auto_130647 ) ) ( not ( = ?auto_130650 ?auto_130646 ) ) ( not ( = ?auto_130648 ?auto_130649 ) ) ( not ( = ?auto_130648 ?auto_130647 ) ) ( not ( = ?auto_130648 ?auto_130646 ) ) ( not ( = ?auto_130643 ?auto_130650 ) ) ( not ( = ?auto_130643 ?auto_130648 ) ) ( not ( = ?auto_130644 ?auto_130650 ) ) ( not ( = ?auto_130644 ?auto_130648 ) ) ( not ( = ?auto_130645 ?auto_130650 ) ) ( not ( = ?auto_130645 ?auto_130648 ) ) ( ON ?auto_130645 ?auto_130646 ) ( CLEAR ?auto_130643 ) ( ON ?auto_130644 ?auto_130645 ) ( CLEAR ?auto_130644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130650 ?auto_130648 ?auto_130649 ?auto_130647 ?auto_130646 ?auto_130645 )
      ( MAKE-5PILE ?auto_130643 ?auto_130644 ?auto_130645 ?auto_130646 ?auto_130647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130651 - BLOCK
      ?auto_130652 - BLOCK
      ?auto_130653 - BLOCK
      ?auto_130654 - BLOCK
      ?auto_130655 - BLOCK
    )
    :vars
    (
      ?auto_130657 - BLOCK
      ?auto_130656 - BLOCK
      ?auto_130658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130651 ?auto_130652 ) ) ( not ( = ?auto_130651 ?auto_130653 ) ) ( not ( = ?auto_130651 ?auto_130654 ) ) ( not ( = ?auto_130651 ?auto_130655 ) ) ( not ( = ?auto_130652 ?auto_130653 ) ) ( not ( = ?auto_130652 ?auto_130654 ) ) ( not ( = ?auto_130652 ?auto_130655 ) ) ( not ( = ?auto_130653 ?auto_130654 ) ) ( not ( = ?auto_130653 ?auto_130655 ) ) ( not ( = ?auto_130654 ?auto_130655 ) ) ( ON ?auto_130655 ?auto_130657 ) ( not ( = ?auto_130651 ?auto_130657 ) ) ( not ( = ?auto_130652 ?auto_130657 ) ) ( not ( = ?auto_130653 ?auto_130657 ) ) ( not ( = ?auto_130654 ?auto_130657 ) ) ( not ( = ?auto_130655 ?auto_130657 ) ) ( ON ?auto_130654 ?auto_130655 ) ( ON-TABLE ?auto_130656 ) ( ON ?auto_130658 ?auto_130656 ) ( ON ?auto_130657 ?auto_130658 ) ( not ( = ?auto_130656 ?auto_130658 ) ) ( not ( = ?auto_130656 ?auto_130657 ) ) ( not ( = ?auto_130656 ?auto_130655 ) ) ( not ( = ?auto_130656 ?auto_130654 ) ) ( not ( = ?auto_130658 ?auto_130657 ) ) ( not ( = ?auto_130658 ?auto_130655 ) ) ( not ( = ?auto_130658 ?auto_130654 ) ) ( not ( = ?auto_130651 ?auto_130656 ) ) ( not ( = ?auto_130651 ?auto_130658 ) ) ( not ( = ?auto_130652 ?auto_130656 ) ) ( not ( = ?auto_130652 ?auto_130658 ) ) ( not ( = ?auto_130653 ?auto_130656 ) ) ( not ( = ?auto_130653 ?auto_130658 ) ) ( ON ?auto_130653 ?auto_130654 ) ( ON ?auto_130652 ?auto_130653 ) ( CLEAR ?auto_130652 ) ( HOLDING ?auto_130651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130651 )
      ( MAKE-5PILE ?auto_130651 ?auto_130652 ?auto_130653 ?auto_130654 ?auto_130655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130659 - BLOCK
      ?auto_130660 - BLOCK
      ?auto_130661 - BLOCK
      ?auto_130662 - BLOCK
      ?auto_130663 - BLOCK
    )
    :vars
    (
      ?auto_130666 - BLOCK
      ?auto_130664 - BLOCK
      ?auto_130665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130659 ?auto_130660 ) ) ( not ( = ?auto_130659 ?auto_130661 ) ) ( not ( = ?auto_130659 ?auto_130662 ) ) ( not ( = ?auto_130659 ?auto_130663 ) ) ( not ( = ?auto_130660 ?auto_130661 ) ) ( not ( = ?auto_130660 ?auto_130662 ) ) ( not ( = ?auto_130660 ?auto_130663 ) ) ( not ( = ?auto_130661 ?auto_130662 ) ) ( not ( = ?auto_130661 ?auto_130663 ) ) ( not ( = ?auto_130662 ?auto_130663 ) ) ( ON ?auto_130663 ?auto_130666 ) ( not ( = ?auto_130659 ?auto_130666 ) ) ( not ( = ?auto_130660 ?auto_130666 ) ) ( not ( = ?auto_130661 ?auto_130666 ) ) ( not ( = ?auto_130662 ?auto_130666 ) ) ( not ( = ?auto_130663 ?auto_130666 ) ) ( ON ?auto_130662 ?auto_130663 ) ( ON-TABLE ?auto_130664 ) ( ON ?auto_130665 ?auto_130664 ) ( ON ?auto_130666 ?auto_130665 ) ( not ( = ?auto_130664 ?auto_130665 ) ) ( not ( = ?auto_130664 ?auto_130666 ) ) ( not ( = ?auto_130664 ?auto_130663 ) ) ( not ( = ?auto_130664 ?auto_130662 ) ) ( not ( = ?auto_130665 ?auto_130666 ) ) ( not ( = ?auto_130665 ?auto_130663 ) ) ( not ( = ?auto_130665 ?auto_130662 ) ) ( not ( = ?auto_130659 ?auto_130664 ) ) ( not ( = ?auto_130659 ?auto_130665 ) ) ( not ( = ?auto_130660 ?auto_130664 ) ) ( not ( = ?auto_130660 ?auto_130665 ) ) ( not ( = ?auto_130661 ?auto_130664 ) ) ( not ( = ?auto_130661 ?auto_130665 ) ) ( ON ?auto_130661 ?auto_130662 ) ( ON ?auto_130660 ?auto_130661 ) ( ON ?auto_130659 ?auto_130660 ) ( CLEAR ?auto_130659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130664 ?auto_130665 ?auto_130666 ?auto_130663 ?auto_130662 ?auto_130661 ?auto_130660 )
      ( MAKE-5PILE ?auto_130659 ?auto_130660 ?auto_130661 ?auto_130662 ?auto_130663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130672 - BLOCK
      ?auto_130673 - BLOCK
      ?auto_130674 - BLOCK
      ?auto_130675 - BLOCK
      ?auto_130676 - BLOCK
    )
    :vars
    (
      ?auto_130677 - BLOCK
      ?auto_130678 - BLOCK
      ?auto_130679 - BLOCK
      ?auto_130680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130672 ?auto_130673 ) ) ( not ( = ?auto_130672 ?auto_130674 ) ) ( not ( = ?auto_130672 ?auto_130675 ) ) ( not ( = ?auto_130672 ?auto_130676 ) ) ( not ( = ?auto_130673 ?auto_130674 ) ) ( not ( = ?auto_130673 ?auto_130675 ) ) ( not ( = ?auto_130673 ?auto_130676 ) ) ( not ( = ?auto_130674 ?auto_130675 ) ) ( not ( = ?auto_130674 ?auto_130676 ) ) ( not ( = ?auto_130675 ?auto_130676 ) ) ( ON ?auto_130676 ?auto_130677 ) ( not ( = ?auto_130672 ?auto_130677 ) ) ( not ( = ?auto_130673 ?auto_130677 ) ) ( not ( = ?auto_130674 ?auto_130677 ) ) ( not ( = ?auto_130675 ?auto_130677 ) ) ( not ( = ?auto_130676 ?auto_130677 ) ) ( ON ?auto_130675 ?auto_130676 ) ( ON-TABLE ?auto_130678 ) ( ON ?auto_130679 ?auto_130678 ) ( ON ?auto_130677 ?auto_130679 ) ( not ( = ?auto_130678 ?auto_130679 ) ) ( not ( = ?auto_130678 ?auto_130677 ) ) ( not ( = ?auto_130678 ?auto_130676 ) ) ( not ( = ?auto_130678 ?auto_130675 ) ) ( not ( = ?auto_130679 ?auto_130677 ) ) ( not ( = ?auto_130679 ?auto_130676 ) ) ( not ( = ?auto_130679 ?auto_130675 ) ) ( not ( = ?auto_130672 ?auto_130678 ) ) ( not ( = ?auto_130672 ?auto_130679 ) ) ( not ( = ?auto_130673 ?auto_130678 ) ) ( not ( = ?auto_130673 ?auto_130679 ) ) ( not ( = ?auto_130674 ?auto_130678 ) ) ( not ( = ?auto_130674 ?auto_130679 ) ) ( ON ?auto_130674 ?auto_130675 ) ( ON ?auto_130673 ?auto_130674 ) ( CLEAR ?auto_130673 ) ( ON ?auto_130672 ?auto_130680 ) ( CLEAR ?auto_130672 ) ( HAND-EMPTY ) ( not ( = ?auto_130672 ?auto_130680 ) ) ( not ( = ?auto_130673 ?auto_130680 ) ) ( not ( = ?auto_130674 ?auto_130680 ) ) ( not ( = ?auto_130675 ?auto_130680 ) ) ( not ( = ?auto_130676 ?auto_130680 ) ) ( not ( = ?auto_130677 ?auto_130680 ) ) ( not ( = ?auto_130678 ?auto_130680 ) ) ( not ( = ?auto_130679 ?auto_130680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130672 ?auto_130680 )
      ( MAKE-5PILE ?auto_130672 ?auto_130673 ?auto_130674 ?auto_130675 ?auto_130676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130681 - BLOCK
      ?auto_130682 - BLOCK
      ?auto_130683 - BLOCK
      ?auto_130684 - BLOCK
      ?auto_130685 - BLOCK
    )
    :vars
    (
      ?auto_130687 - BLOCK
      ?auto_130689 - BLOCK
      ?auto_130686 - BLOCK
      ?auto_130688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130681 ?auto_130682 ) ) ( not ( = ?auto_130681 ?auto_130683 ) ) ( not ( = ?auto_130681 ?auto_130684 ) ) ( not ( = ?auto_130681 ?auto_130685 ) ) ( not ( = ?auto_130682 ?auto_130683 ) ) ( not ( = ?auto_130682 ?auto_130684 ) ) ( not ( = ?auto_130682 ?auto_130685 ) ) ( not ( = ?auto_130683 ?auto_130684 ) ) ( not ( = ?auto_130683 ?auto_130685 ) ) ( not ( = ?auto_130684 ?auto_130685 ) ) ( ON ?auto_130685 ?auto_130687 ) ( not ( = ?auto_130681 ?auto_130687 ) ) ( not ( = ?auto_130682 ?auto_130687 ) ) ( not ( = ?auto_130683 ?auto_130687 ) ) ( not ( = ?auto_130684 ?auto_130687 ) ) ( not ( = ?auto_130685 ?auto_130687 ) ) ( ON ?auto_130684 ?auto_130685 ) ( ON-TABLE ?auto_130689 ) ( ON ?auto_130686 ?auto_130689 ) ( ON ?auto_130687 ?auto_130686 ) ( not ( = ?auto_130689 ?auto_130686 ) ) ( not ( = ?auto_130689 ?auto_130687 ) ) ( not ( = ?auto_130689 ?auto_130685 ) ) ( not ( = ?auto_130689 ?auto_130684 ) ) ( not ( = ?auto_130686 ?auto_130687 ) ) ( not ( = ?auto_130686 ?auto_130685 ) ) ( not ( = ?auto_130686 ?auto_130684 ) ) ( not ( = ?auto_130681 ?auto_130689 ) ) ( not ( = ?auto_130681 ?auto_130686 ) ) ( not ( = ?auto_130682 ?auto_130689 ) ) ( not ( = ?auto_130682 ?auto_130686 ) ) ( not ( = ?auto_130683 ?auto_130689 ) ) ( not ( = ?auto_130683 ?auto_130686 ) ) ( ON ?auto_130683 ?auto_130684 ) ( ON ?auto_130681 ?auto_130688 ) ( CLEAR ?auto_130681 ) ( not ( = ?auto_130681 ?auto_130688 ) ) ( not ( = ?auto_130682 ?auto_130688 ) ) ( not ( = ?auto_130683 ?auto_130688 ) ) ( not ( = ?auto_130684 ?auto_130688 ) ) ( not ( = ?auto_130685 ?auto_130688 ) ) ( not ( = ?auto_130687 ?auto_130688 ) ) ( not ( = ?auto_130689 ?auto_130688 ) ) ( not ( = ?auto_130686 ?auto_130688 ) ) ( HOLDING ?auto_130682 ) ( CLEAR ?auto_130683 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130689 ?auto_130686 ?auto_130687 ?auto_130685 ?auto_130684 ?auto_130683 ?auto_130682 )
      ( MAKE-5PILE ?auto_130681 ?auto_130682 ?auto_130683 ?auto_130684 ?auto_130685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130690 - BLOCK
      ?auto_130691 - BLOCK
      ?auto_130692 - BLOCK
      ?auto_130693 - BLOCK
      ?auto_130694 - BLOCK
    )
    :vars
    (
      ?auto_130697 - BLOCK
      ?auto_130698 - BLOCK
      ?auto_130696 - BLOCK
      ?auto_130695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130690 ?auto_130691 ) ) ( not ( = ?auto_130690 ?auto_130692 ) ) ( not ( = ?auto_130690 ?auto_130693 ) ) ( not ( = ?auto_130690 ?auto_130694 ) ) ( not ( = ?auto_130691 ?auto_130692 ) ) ( not ( = ?auto_130691 ?auto_130693 ) ) ( not ( = ?auto_130691 ?auto_130694 ) ) ( not ( = ?auto_130692 ?auto_130693 ) ) ( not ( = ?auto_130692 ?auto_130694 ) ) ( not ( = ?auto_130693 ?auto_130694 ) ) ( ON ?auto_130694 ?auto_130697 ) ( not ( = ?auto_130690 ?auto_130697 ) ) ( not ( = ?auto_130691 ?auto_130697 ) ) ( not ( = ?auto_130692 ?auto_130697 ) ) ( not ( = ?auto_130693 ?auto_130697 ) ) ( not ( = ?auto_130694 ?auto_130697 ) ) ( ON ?auto_130693 ?auto_130694 ) ( ON-TABLE ?auto_130698 ) ( ON ?auto_130696 ?auto_130698 ) ( ON ?auto_130697 ?auto_130696 ) ( not ( = ?auto_130698 ?auto_130696 ) ) ( not ( = ?auto_130698 ?auto_130697 ) ) ( not ( = ?auto_130698 ?auto_130694 ) ) ( not ( = ?auto_130698 ?auto_130693 ) ) ( not ( = ?auto_130696 ?auto_130697 ) ) ( not ( = ?auto_130696 ?auto_130694 ) ) ( not ( = ?auto_130696 ?auto_130693 ) ) ( not ( = ?auto_130690 ?auto_130698 ) ) ( not ( = ?auto_130690 ?auto_130696 ) ) ( not ( = ?auto_130691 ?auto_130698 ) ) ( not ( = ?auto_130691 ?auto_130696 ) ) ( not ( = ?auto_130692 ?auto_130698 ) ) ( not ( = ?auto_130692 ?auto_130696 ) ) ( ON ?auto_130692 ?auto_130693 ) ( ON ?auto_130690 ?auto_130695 ) ( not ( = ?auto_130690 ?auto_130695 ) ) ( not ( = ?auto_130691 ?auto_130695 ) ) ( not ( = ?auto_130692 ?auto_130695 ) ) ( not ( = ?auto_130693 ?auto_130695 ) ) ( not ( = ?auto_130694 ?auto_130695 ) ) ( not ( = ?auto_130697 ?auto_130695 ) ) ( not ( = ?auto_130698 ?auto_130695 ) ) ( not ( = ?auto_130696 ?auto_130695 ) ) ( CLEAR ?auto_130692 ) ( ON ?auto_130691 ?auto_130690 ) ( CLEAR ?auto_130691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130695 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130695 ?auto_130690 )
      ( MAKE-5PILE ?auto_130690 ?auto_130691 ?auto_130692 ?auto_130693 ?auto_130694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130699 - BLOCK
      ?auto_130700 - BLOCK
      ?auto_130701 - BLOCK
      ?auto_130702 - BLOCK
      ?auto_130703 - BLOCK
    )
    :vars
    (
      ?auto_130705 - BLOCK
      ?auto_130706 - BLOCK
      ?auto_130707 - BLOCK
      ?auto_130704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130699 ?auto_130700 ) ) ( not ( = ?auto_130699 ?auto_130701 ) ) ( not ( = ?auto_130699 ?auto_130702 ) ) ( not ( = ?auto_130699 ?auto_130703 ) ) ( not ( = ?auto_130700 ?auto_130701 ) ) ( not ( = ?auto_130700 ?auto_130702 ) ) ( not ( = ?auto_130700 ?auto_130703 ) ) ( not ( = ?auto_130701 ?auto_130702 ) ) ( not ( = ?auto_130701 ?auto_130703 ) ) ( not ( = ?auto_130702 ?auto_130703 ) ) ( ON ?auto_130703 ?auto_130705 ) ( not ( = ?auto_130699 ?auto_130705 ) ) ( not ( = ?auto_130700 ?auto_130705 ) ) ( not ( = ?auto_130701 ?auto_130705 ) ) ( not ( = ?auto_130702 ?auto_130705 ) ) ( not ( = ?auto_130703 ?auto_130705 ) ) ( ON ?auto_130702 ?auto_130703 ) ( ON-TABLE ?auto_130706 ) ( ON ?auto_130707 ?auto_130706 ) ( ON ?auto_130705 ?auto_130707 ) ( not ( = ?auto_130706 ?auto_130707 ) ) ( not ( = ?auto_130706 ?auto_130705 ) ) ( not ( = ?auto_130706 ?auto_130703 ) ) ( not ( = ?auto_130706 ?auto_130702 ) ) ( not ( = ?auto_130707 ?auto_130705 ) ) ( not ( = ?auto_130707 ?auto_130703 ) ) ( not ( = ?auto_130707 ?auto_130702 ) ) ( not ( = ?auto_130699 ?auto_130706 ) ) ( not ( = ?auto_130699 ?auto_130707 ) ) ( not ( = ?auto_130700 ?auto_130706 ) ) ( not ( = ?auto_130700 ?auto_130707 ) ) ( not ( = ?auto_130701 ?auto_130706 ) ) ( not ( = ?auto_130701 ?auto_130707 ) ) ( ON ?auto_130699 ?auto_130704 ) ( not ( = ?auto_130699 ?auto_130704 ) ) ( not ( = ?auto_130700 ?auto_130704 ) ) ( not ( = ?auto_130701 ?auto_130704 ) ) ( not ( = ?auto_130702 ?auto_130704 ) ) ( not ( = ?auto_130703 ?auto_130704 ) ) ( not ( = ?auto_130705 ?auto_130704 ) ) ( not ( = ?auto_130706 ?auto_130704 ) ) ( not ( = ?auto_130707 ?auto_130704 ) ) ( ON ?auto_130700 ?auto_130699 ) ( CLEAR ?auto_130700 ) ( ON-TABLE ?auto_130704 ) ( HOLDING ?auto_130701 ) ( CLEAR ?auto_130702 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130706 ?auto_130707 ?auto_130705 ?auto_130703 ?auto_130702 ?auto_130701 )
      ( MAKE-5PILE ?auto_130699 ?auto_130700 ?auto_130701 ?auto_130702 ?auto_130703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130708 - BLOCK
      ?auto_130709 - BLOCK
      ?auto_130710 - BLOCK
      ?auto_130711 - BLOCK
      ?auto_130712 - BLOCK
    )
    :vars
    (
      ?auto_130713 - BLOCK
      ?auto_130714 - BLOCK
      ?auto_130716 - BLOCK
      ?auto_130715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130708 ?auto_130709 ) ) ( not ( = ?auto_130708 ?auto_130710 ) ) ( not ( = ?auto_130708 ?auto_130711 ) ) ( not ( = ?auto_130708 ?auto_130712 ) ) ( not ( = ?auto_130709 ?auto_130710 ) ) ( not ( = ?auto_130709 ?auto_130711 ) ) ( not ( = ?auto_130709 ?auto_130712 ) ) ( not ( = ?auto_130710 ?auto_130711 ) ) ( not ( = ?auto_130710 ?auto_130712 ) ) ( not ( = ?auto_130711 ?auto_130712 ) ) ( ON ?auto_130712 ?auto_130713 ) ( not ( = ?auto_130708 ?auto_130713 ) ) ( not ( = ?auto_130709 ?auto_130713 ) ) ( not ( = ?auto_130710 ?auto_130713 ) ) ( not ( = ?auto_130711 ?auto_130713 ) ) ( not ( = ?auto_130712 ?auto_130713 ) ) ( ON ?auto_130711 ?auto_130712 ) ( ON-TABLE ?auto_130714 ) ( ON ?auto_130716 ?auto_130714 ) ( ON ?auto_130713 ?auto_130716 ) ( not ( = ?auto_130714 ?auto_130716 ) ) ( not ( = ?auto_130714 ?auto_130713 ) ) ( not ( = ?auto_130714 ?auto_130712 ) ) ( not ( = ?auto_130714 ?auto_130711 ) ) ( not ( = ?auto_130716 ?auto_130713 ) ) ( not ( = ?auto_130716 ?auto_130712 ) ) ( not ( = ?auto_130716 ?auto_130711 ) ) ( not ( = ?auto_130708 ?auto_130714 ) ) ( not ( = ?auto_130708 ?auto_130716 ) ) ( not ( = ?auto_130709 ?auto_130714 ) ) ( not ( = ?auto_130709 ?auto_130716 ) ) ( not ( = ?auto_130710 ?auto_130714 ) ) ( not ( = ?auto_130710 ?auto_130716 ) ) ( ON ?auto_130708 ?auto_130715 ) ( not ( = ?auto_130708 ?auto_130715 ) ) ( not ( = ?auto_130709 ?auto_130715 ) ) ( not ( = ?auto_130710 ?auto_130715 ) ) ( not ( = ?auto_130711 ?auto_130715 ) ) ( not ( = ?auto_130712 ?auto_130715 ) ) ( not ( = ?auto_130713 ?auto_130715 ) ) ( not ( = ?auto_130714 ?auto_130715 ) ) ( not ( = ?auto_130716 ?auto_130715 ) ) ( ON ?auto_130709 ?auto_130708 ) ( ON-TABLE ?auto_130715 ) ( CLEAR ?auto_130711 ) ( ON ?auto_130710 ?auto_130709 ) ( CLEAR ?auto_130710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130715 ?auto_130708 ?auto_130709 )
      ( MAKE-5PILE ?auto_130708 ?auto_130709 ?auto_130710 ?auto_130711 ?auto_130712 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130717 - BLOCK
      ?auto_130718 - BLOCK
      ?auto_130719 - BLOCK
      ?auto_130720 - BLOCK
      ?auto_130721 - BLOCK
    )
    :vars
    (
      ?auto_130724 - BLOCK
      ?auto_130725 - BLOCK
      ?auto_130722 - BLOCK
      ?auto_130723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130717 ?auto_130718 ) ) ( not ( = ?auto_130717 ?auto_130719 ) ) ( not ( = ?auto_130717 ?auto_130720 ) ) ( not ( = ?auto_130717 ?auto_130721 ) ) ( not ( = ?auto_130718 ?auto_130719 ) ) ( not ( = ?auto_130718 ?auto_130720 ) ) ( not ( = ?auto_130718 ?auto_130721 ) ) ( not ( = ?auto_130719 ?auto_130720 ) ) ( not ( = ?auto_130719 ?auto_130721 ) ) ( not ( = ?auto_130720 ?auto_130721 ) ) ( ON ?auto_130721 ?auto_130724 ) ( not ( = ?auto_130717 ?auto_130724 ) ) ( not ( = ?auto_130718 ?auto_130724 ) ) ( not ( = ?auto_130719 ?auto_130724 ) ) ( not ( = ?auto_130720 ?auto_130724 ) ) ( not ( = ?auto_130721 ?auto_130724 ) ) ( ON-TABLE ?auto_130725 ) ( ON ?auto_130722 ?auto_130725 ) ( ON ?auto_130724 ?auto_130722 ) ( not ( = ?auto_130725 ?auto_130722 ) ) ( not ( = ?auto_130725 ?auto_130724 ) ) ( not ( = ?auto_130725 ?auto_130721 ) ) ( not ( = ?auto_130725 ?auto_130720 ) ) ( not ( = ?auto_130722 ?auto_130724 ) ) ( not ( = ?auto_130722 ?auto_130721 ) ) ( not ( = ?auto_130722 ?auto_130720 ) ) ( not ( = ?auto_130717 ?auto_130725 ) ) ( not ( = ?auto_130717 ?auto_130722 ) ) ( not ( = ?auto_130718 ?auto_130725 ) ) ( not ( = ?auto_130718 ?auto_130722 ) ) ( not ( = ?auto_130719 ?auto_130725 ) ) ( not ( = ?auto_130719 ?auto_130722 ) ) ( ON ?auto_130717 ?auto_130723 ) ( not ( = ?auto_130717 ?auto_130723 ) ) ( not ( = ?auto_130718 ?auto_130723 ) ) ( not ( = ?auto_130719 ?auto_130723 ) ) ( not ( = ?auto_130720 ?auto_130723 ) ) ( not ( = ?auto_130721 ?auto_130723 ) ) ( not ( = ?auto_130724 ?auto_130723 ) ) ( not ( = ?auto_130725 ?auto_130723 ) ) ( not ( = ?auto_130722 ?auto_130723 ) ) ( ON ?auto_130718 ?auto_130717 ) ( ON-TABLE ?auto_130723 ) ( ON ?auto_130719 ?auto_130718 ) ( CLEAR ?auto_130719 ) ( HOLDING ?auto_130720 ) ( CLEAR ?auto_130721 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130725 ?auto_130722 ?auto_130724 ?auto_130721 ?auto_130720 )
      ( MAKE-5PILE ?auto_130717 ?auto_130718 ?auto_130719 ?auto_130720 ?auto_130721 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130726 - BLOCK
      ?auto_130727 - BLOCK
      ?auto_130728 - BLOCK
      ?auto_130729 - BLOCK
      ?auto_130730 - BLOCK
    )
    :vars
    (
      ?auto_130734 - BLOCK
      ?auto_130733 - BLOCK
      ?auto_130731 - BLOCK
      ?auto_130732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130726 ?auto_130727 ) ) ( not ( = ?auto_130726 ?auto_130728 ) ) ( not ( = ?auto_130726 ?auto_130729 ) ) ( not ( = ?auto_130726 ?auto_130730 ) ) ( not ( = ?auto_130727 ?auto_130728 ) ) ( not ( = ?auto_130727 ?auto_130729 ) ) ( not ( = ?auto_130727 ?auto_130730 ) ) ( not ( = ?auto_130728 ?auto_130729 ) ) ( not ( = ?auto_130728 ?auto_130730 ) ) ( not ( = ?auto_130729 ?auto_130730 ) ) ( ON ?auto_130730 ?auto_130734 ) ( not ( = ?auto_130726 ?auto_130734 ) ) ( not ( = ?auto_130727 ?auto_130734 ) ) ( not ( = ?auto_130728 ?auto_130734 ) ) ( not ( = ?auto_130729 ?auto_130734 ) ) ( not ( = ?auto_130730 ?auto_130734 ) ) ( ON-TABLE ?auto_130733 ) ( ON ?auto_130731 ?auto_130733 ) ( ON ?auto_130734 ?auto_130731 ) ( not ( = ?auto_130733 ?auto_130731 ) ) ( not ( = ?auto_130733 ?auto_130734 ) ) ( not ( = ?auto_130733 ?auto_130730 ) ) ( not ( = ?auto_130733 ?auto_130729 ) ) ( not ( = ?auto_130731 ?auto_130734 ) ) ( not ( = ?auto_130731 ?auto_130730 ) ) ( not ( = ?auto_130731 ?auto_130729 ) ) ( not ( = ?auto_130726 ?auto_130733 ) ) ( not ( = ?auto_130726 ?auto_130731 ) ) ( not ( = ?auto_130727 ?auto_130733 ) ) ( not ( = ?auto_130727 ?auto_130731 ) ) ( not ( = ?auto_130728 ?auto_130733 ) ) ( not ( = ?auto_130728 ?auto_130731 ) ) ( ON ?auto_130726 ?auto_130732 ) ( not ( = ?auto_130726 ?auto_130732 ) ) ( not ( = ?auto_130727 ?auto_130732 ) ) ( not ( = ?auto_130728 ?auto_130732 ) ) ( not ( = ?auto_130729 ?auto_130732 ) ) ( not ( = ?auto_130730 ?auto_130732 ) ) ( not ( = ?auto_130734 ?auto_130732 ) ) ( not ( = ?auto_130733 ?auto_130732 ) ) ( not ( = ?auto_130731 ?auto_130732 ) ) ( ON ?auto_130727 ?auto_130726 ) ( ON-TABLE ?auto_130732 ) ( ON ?auto_130728 ?auto_130727 ) ( CLEAR ?auto_130730 ) ( ON ?auto_130729 ?auto_130728 ) ( CLEAR ?auto_130729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130732 ?auto_130726 ?auto_130727 ?auto_130728 )
      ( MAKE-5PILE ?auto_130726 ?auto_130727 ?auto_130728 ?auto_130729 ?auto_130730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130735 - BLOCK
      ?auto_130736 - BLOCK
      ?auto_130737 - BLOCK
      ?auto_130738 - BLOCK
      ?auto_130739 - BLOCK
    )
    :vars
    (
      ?auto_130743 - BLOCK
      ?auto_130742 - BLOCK
      ?auto_130740 - BLOCK
      ?auto_130741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130735 ?auto_130736 ) ) ( not ( = ?auto_130735 ?auto_130737 ) ) ( not ( = ?auto_130735 ?auto_130738 ) ) ( not ( = ?auto_130735 ?auto_130739 ) ) ( not ( = ?auto_130736 ?auto_130737 ) ) ( not ( = ?auto_130736 ?auto_130738 ) ) ( not ( = ?auto_130736 ?auto_130739 ) ) ( not ( = ?auto_130737 ?auto_130738 ) ) ( not ( = ?auto_130737 ?auto_130739 ) ) ( not ( = ?auto_130738 ?auto_130739 ) ) ( not ( = ?auto_130735 ?auto_130743 ) ) ( not ( = ?auto_130736 ?auto_130743 ) ) ( not ( = ?auto_130737 ?auto_130743 ) ) ( not ( = ?auto_130738 ?auto_130743 ) ) ( not ( = ?auto_130739 ?auto_130743 ) ) ( ON-TABLE ?auto_130742 ) ( ON ?auto_130740 ?auto_130742 ) ( ON ?auto_130743 ?auto_130740 ) ( not ( = ?auto_130742 ?auto_130740 ) ) ( not ( = ?auto_130742 ?auto_130743 ) ) ( not ( = ?auto_130742 ?auto_130739 ) ) ( not ( = ?auto_130742 ?auto_130738 ) ) ( not ( = ?auto_130740 ?auto_130743 ) ) ( not ( = ?auto_130740 ?auto_130739 ) ) ( not ( = ?auto_130740 ?auto_130738 ) ) ( not ( = ?auto_130735 ?auto_130742 ) ) ( not ( = ?auto_130735 ?auto_130740 ) ) ( not ( = ?auto_130736 ?auto_130742 ) ) ( not ( = ?auto_130736 ?auto_130740 ) ) ( not ( = ?auto_130737 ?auto_130742 ) ) ( not ( = ?auto_130737 ?auto_130740 ) ) ( ON ?auto_130735 ?auto_130741 ) ( not ( = ?auto_130735 ?auto_130741 ) ) ( not ( = ?auto_130736 ?auto_130741 ) ) ( not ( = ?auto_130737 ?auto_130741 ) ) ( not ( = ?auto_130738 ?auto_130741 ) ) ( not ( = ?auto_130739 ?auto_130741 ) ) ( not ( = ?auto_130743 ?auto_130741 ) ) ( not ( = ?auto_130742 ?auto_130741 ) ) ( not ( = ?auto_130740 ?auto_130741 ) ) ( ON ?auto_130736 ?auto_130735 ) ( ON-TABLE ?auto_130741 ) ( ON ?auto_130737 ?auto_130736 ) ( ON ?auto_130738 ?auto_130737 ) ( CLEAR ?auto_130738 ) ( HOLDING ?auto_130739 ) ( CLEAR ?auto_130743 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130742 ?auto_130740 ?auto_130743 ?auto_130739 )
      ( MAKE-5PILE ?auto_130735 ?auto_130736 ?auto_130737 ?auto_130738 ?auto_130739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130744 - BLOCK
      ?auto_130745 - BLOCK
      ?auto_130746 - BLOCK
      ?auto_130747 - BLOCK
      ?auto_130748 - BLOCK
    )
    :vars
    (
      ?auto_130749 - BLOCK
      ?auto_130751 - BLOCK
      ?auto_130752 - BLOCK
      ?auto_130750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130744 ?auto_130745 ) ) ( not ( = ?auto_130744 ?auto_130746 ) ) ( not ( = ?auto_130744 ?auto_130747 ) ) ( not ( = ?auto_130744 ?auto_130748 ) ) ( not ( = ?auto_130745 ?auto_130746 ) ) ( not ( = ?auto_130745 ?auto_130747 ) ) ( not ( = ?auto_130745 ?auto_130748 ) ) ( not ( = ?auto_130746 ?auto_130747 ) ) ( not ( = ?auto_130746 ?auto_130748 ) ) ( not ( = ?auto_130747 ?auto_130748 ) ) ( not ( = ?auto_130744 ?auto_130749 ) ) ( not ( = ?auto_130745 ?auto_130749 ) ) ( not ( = ?auto_130746 ?auto_130749 ) ) ( not ( = ?auto_130747 ?auto_130749 ) ) ( not ( = ?auto_130748 ?auto_130749 ) ) ( ON-TABLE ?auto_130751 ) ( ON ?auto_130752 ?auto_130751 ) ( ON ?auto_130749 ?auto_130752 ) ( not ( = ?auto_130751 ?auto_130752 ) ) ( not ( = ?auto_130751 ?auto_130749 ) ) ( not ( = ?auto_130751 ?auto_130748 ) ) ( not ( = ?auto_130751 ?auto_130747 ) ) ( not ( = ?auto_130752 ?auto_130749 ) ) ( not ( = ?auto_130752 ?auto_130748 ) ) ( not ( = ?auto_130752 ?auto_130747 ) ) ( not ( = ?auto_130744 ?auto_130751 ) ) ( not ( = ?auto_130744 ?auto_130752 ) ) ( not ( = ?auto_130745 ?auto_130751 ) ) ( not ( = ?auto_130745 ?auto_130752 ) ) ( not ( = ?auto_130746 ?auto_130751 ) ) ( not ( = ?auto_130746 ?auto_130752 ) ) ( ON ?auto_130744 ?auto_130750 ) ( not ( = ?auto_130744 ?auto_130750 ) ) ( not ( = ?auto_130745 ?auto_130750 ) ) ( not ( = ?auto_130746 ?auto_130750 ) ) ( not ( = ?auto_130747 ?auto_130750 ) ) ( not ( = ?auto_130748 ?auto_130750 ) ) ( not ( = ?auto_130749 ?auto_130750 ) ) ( not ( = ?auto_130751 ?auto_130750 ) ) ( not ( = ?auto_130752 ?auto_130750 ) ) ( ON ?auto_130745 ?auto_130744 ) ( ON-TABLE ?auto_130750 ) ( ON ?auto_130746 ?auto_130745 ) ( ON ?auto_130747 ?auto_130746 ) ( CLEAR ?auto_130749 ) ( ON ?auto_130748 ?auto_130747 ) ( CLEAR ?auto_130748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130750 ?auto_130744 ?auto_130745 ?auto_130746 ?auto_130747 )
      ( MAKE-5PILE ?auto_130744 ?auto_130745 ?auto_130746 ?auto_130747 ?auto_130748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130753 - BLOCK
      ?auto_130754 - BLOCK
      ?auto_130755 - BLOCK
      ?auto_130756 - BLOCK
      ?auto_130757 - BLOCK
    )
    :vars
    (
      ?auto_130758 - BLOCK
      ?auto_130760 - BLOCK
      ?auto_130759 - BLOCK
      ?auto_130761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130753 ?auto_130754 ) ) ( not ( = ?auto_130753 ?auto_130755 ) ) ( not ( = ?auto_130753 ?auto_130756 ) ) ( not ( = ?auto_130753 ?auto_130757 ) ) ( not ( = ?auto_130754 ?auto_130755 ) ) ( not ( = ?auto_130754 ?auto_130756 ) ) ( not ( = ?auto_130754 ?auto_130757 ) ) ( not ( = ?auto_130755 ?auto_130756 ) ) ( not ( = ?auto_130755 ?auto_130757 ) ) ( not ( = ?auto_130756 ?auto_130757 ) ) ( not ( = ?auto_130753 ?auto_130758 ) ) ( not ( = ?auto_130754 ?auto_130758 ) ) ( not ( = ?auto_130755 ?auto_130758 ) ) ( not ( = ?auto_130756 ?auto_130758 ) ) ( not ( = ?auto_130757 ?auto_130758 ) ) ( ON-TABLE ?auto_130760 ) ( ON ?auto_130759 ?auto_130760 ) ( not ( = ?auto_130760 ?auto_130759 ) ) ( not ( = ?auto_130760 ?auto_130758 ) ) ( not ( = ?auto_130760 ?auto_130757 ) ) ( not ( = ?auto_130760 ?auto_130756 ) ) ( not ( = ?auto_130759 ?auto_130758 ) ) ( not ( = ?auto_130759 ?auto_130757 ) ) ( not ( = ?auto_130759 ?auto_130756 ) ) ( not ( = ?auto_130753 ?auto_130760 ) ) ( not ( = ?auto_130753 ?auto_130759 ) ) ( not ( = ?auto_130754 ?auto_130760 ) ) ( not ( = ?auto_130754 ?auto_130759 ) ) ( not ( = ?auto_130755 ?auto_130760 ) ) ( not ( = ?auto_130755 ?auto_130759 ) ) ( ON ?auto_130753 ?auto_130761 ) ( not ( = ?auto_130753 ?auto_130761 ) ) ( not ( = ?auto_130754 ?auto_130761 ) ) ( not ( = ?auto_130755 ?auto_130761 ) ) ( not ( = ?auto_130756 ?auto_130761 ) ) ( not ( = ?auto_130757 ?auto_130761 ) ) ( not ( = ?auto_130758 ?auto_130761 ) ) ( not ( = ?auto_130760 ?auto_130761 ) ) ( not ( = ?auto_130759 ?auto_130761 ) ) ( ON ?auto_130754 ?auto_130753 ) ( ON-TABLE ?auto_130761 ) ( ON ?auto_130755 ?auto_130754 ) ( ON ?auto_130756 ?auto_130755 ) ( ON ?auto_130757 ?auto_130756 ) ( CLEAR ?auto_130757 ) ( HOLDING ?auto_130758 ) ( CLEAR ?auto_130759 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130760 ?auto_130759 ?auto_130758 )
      ( MAKE-5PILE ?auto_130753 ?auto_130754 ?auto_130755 ?auto_130756 ?auto_130757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130762 - BLOCK
      ?auto_130763 - BLOCK
      ?auto_130764 - BLOCK
      ?auto_130765 - BLOCK
      ?auto_130766 - BLOCK
    )
    :vars
    (
      ?auto_130768 - BLOCK
      ?auto_130767 - BLOCK
      ?auto_130770 - BLOCK
      ?auto_130769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130762 ?auto_130763 ) ) ( not ( = ?auto_130762 ?auto_130764 ) ) ( not ( = ?auto_130762 ?auto_130765 ) ) ( not ( = ?auto_130762 ?auto_130766 ) ) ( not ( = ?auto_130763 ?auto_130764 ) ) ( not ( = ?auto_130763 ?auto_130765 ) ) ( not ( = ?auto_130763 ?auto_130766 ) ) ( not ( = ?auto_130764 ?auto_130765 ) ) ( not ( = ?auto_130764 ?auto_130766 ) ) ( not ( = ?auto_130765 ?auto_130766 ) ) ( not ( = ?auto_130762 ?auto_130768 ) ) ( not ( = ?auto_130763 ?auto_130768 ) ) ( not ( = ?auto_130764 ?auto_130768 ) ) ( not ( = ?auto_130765 ?auto_130768 ) ) ( not ( = ?auto_130766 ?auto_130768 ) ) ( ON-TABLE ?auto_130767 ) ( ON ?auto_130770 ?auto_130767 ) ( not ( = ?auto_130767 ?auto_130770 ) ) ( not ( = ?auto_130767 ?auto_130768 ) ) ( not ( = ?auto_130767 ?auto_130766 ) ) ( not ( = ?auto_130767 ?auto_130765 ) ) ( not ( = ?auto_130770 ?auto_130768 ) ) ( not ( = ?auto_130770 ?auto_130766 ) ) ( not ( = ?auto_130770 ?auto_130765 ) ) ( not ( = ?auto_130762 ?auto_130767 ) ) ( not ( = ?auto_130762 ?auto_130770 ) ) ( not ( = ?auto_130763 ?auto_130767 ) ) ( not ( = ?auto_130763 ?auto_130770 ) ) ( not ( = ?auto_130764 ?auto_130767 ) ) ( not ( = ?auto_130764 ?auto_130770 ) ) ( ON ?auto_130762 ?auto_130769 ) ( not ( = ?auto_130762 ?auto_130769 ) ) ( not ( = ?auto_130763 ?auto_130769 ) ) ( not ( = ?auto_130764 ?auto_130769 ) ) ( not ( = ?auto_130765 ?auto_130769 ) ) ( not ( = ?auto_130766 ?auto_130769 ) ) ( not ( = ?auto_130768 ?auto_130769 ) ) ( not ( = ?auto_130767 ?auto_130769 ) ) ( not ( = ?auto_130770 ?auto_130769 ) ) ( ON ?auto_130763 ?auto_130762 ) ( ON-TABLE ?auto_130769 ) ( ON ?auto_130764 ?auto_130763 ) ( ON ?auto_130765 ?auto_130764 ) ( ON ?auto_130766 ?auto_130765 ) ( CLEAR ?auto_130770 ) ( ON ?auto_130768 ?auto_130766 ) ( CLEAR ?auto_130768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130769 ?auto_130762 ?auto_130763 ?auto_130764 ?auto_130765 ?auto_130766 )
      ( MAKE-5PILE ?auto_130762 ?auto_130763 ?auto_130764 ?auto_130765 ?auto_130766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130771 - BLOCK
      ?auto_130772 - BLOCK
      ?auto_130773 - BLOCK
      ?auto_130774 - BLOCK
      ?auto_130775 - BLOCK
    )
    :vars
    (
      ?auto_130777 - BLOCK
      ?auto_130778 - BLOCK
      ?auto_130779 - BLOCK
      ?auto_130776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130771 ?auto_130772 ) ) ( not ( = ?auto_130771 ?auto_130773 ) ) ( not ( = ?auto_130771 ?auto_130774 ) ) ( not ( = ?auto_130771 ?auto_130775 ) ) ( not ( = ?auto_130772 ?auto_130773 ) ) ( not ( = ?auto_130772 ?auto_130774 ) ) ( not ( = ?auto_130772 ?auto_130775 ) ) ( not ( = ?auto_130773 ?auto_130774 ) ) ( not ( = ?auto_130773 ?auto_130775 ) ) ( not ( = ?auto_130774 ?auto_130775 ) ) ( not ( = ?auto_130771 ?auto_130777 ) ) ( not ( = ?auto_130772 ?auto_130777 ) ) ( not ( = ?auto_130773 ?auto_130777 ) ) ( not ( = ?auto_130774 ?auto_130777 ) ) ( not ( = ?auto_130775 ?auto_130777 ) ) ( ON-TABLE ?auto_130778 ) ( not ( = ?auto_130778 ?auto_130779 ) ) ( not ( = ?auto_130778 ?auto_130777 ) ) ( not ( = ?auto_130778 ?auto_130775 ) ) ( not ( = ?auto_130778 ?auto_130774 ) ) ( not ( = ?auto_130779 ?auto_130777 ) ) ( not ( = ?auto_130779 ?auto_130775 ) ) ( not ( = ?auto_130779 ?auto_130774 ) ) ( not ( = ?auto_130771 ?auto_130778 ) ) ( not ( = ?auto_130771 ?auto_130779 ) ) ( not ( = ?auto_130772 ?auto_130778 ) ) ( not ( = ?auto_130772 ?auto_130779 ) ) ( not ( = ?auto_130773 ?auto_130778 ) ) ( not ( = ?auto_130773 ?auto_130779 ) ) ( ON ?auto_130771 ?auto_130776 ) ( not ( = ?auto_130771 ?auto_130776 ) ) ( not ( = ?auto_130772 ?auto_130776 ) ) ( not ( = ?auto_130773 ?auto_130776 ) ) ( not ( = ?auto_130774 ?auto_130776 ) ) ( not ( = ?auto_130775 ?auto_130776 ) ) ( not ( = ?auto_130777 ?auto_130776 ) ) ( not ( = ?auto_130778 ?auto_130776 ) ) ( not ( = ?auto_130779 ?auto_130776 ) ) ( ON ?auto_130772 ?auto_130771 ) ( ON-TABLE ?auto_130776 ) ( ON ?auto_130773 ?auto_130772 ) ( ON ?auto_130774 ?auto_130773 ) ( ON ?auto_130775 ?auto_130774 ) ( ON ?auto_130777 ?auto_130775 ) ( CLEAR ?auto_130777 ) ( HOLDING ?auto_130779 ) ( CLEAR ?auto_130778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130778 ?auto_130779 )
      ( MAKE-5PILE ?auto_130771 ?auto_130772 ?auto_130773 ?auto_130774 ?auto_130775 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130780 - BLOCK
      ?auto_130781 - BLOCK
      ?auto_130782 - BLOCK
      ?auto_130783 - BLOCK
      ?auto_130784 - BLOCK
    )
    :vars
    (
      ?auto_130788 - BLOCK
      ?auto_130785 - BLOCK
      ?auto_130786 - BLOCK
      ?auto_130787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130780 ?auto_130781 ) ) ( not ( = ?auto_130780 ?auto_130782 ) ) ( not ( = ?auto_130780 ?auto_130783 ) ) ( not ( = ?auto_130780 ?auto_130784 ) ) ( not ( = ?auto_130781 ?auto_130782 ) ) ( not ( = ?auto_130781 ?auto_130783 ) ) ( not ( = ?auto_130781 ?auto_130784 ) ) ( not ( = ?auto_130782 ?auto_130783 ) ) ( not ( = ?auto_130782 ?auto_130784 ) ) ( not ( = ?auto_130783 ?auto_130784 ) ) ( not ( = ?auto_130780 ?auto_130788 ) ) ( not ( = ?auto_130781 ?auto_130788 ) ) ( not ( = ?auto_130782 ?auto_130788 ) ) ( not ( = ?auto_130783 ?auto_130788 ) ) ( not ( = ?auto_130784 ?auto_130788 ) ) ( ON-TABLE ?auto_130785 ) ( not ( = ?auto_130785 ?auto_130786 ) ) ( not ( = ?auto_130785 ?auto_130788 ) ) ( not ( = ?auto_130785 ?auto_130784 ) ) ( not ( = ?auto_130785 ?auto_130783 ) ) ( not ( = ?auto_130786 ?auto_130788 ) ) ( not ( = ?auto_130786 ?auto_130784 ) ) ( not ( = ?auto_130786 ?auto_130783 ) ) ( not ( = ?auto_130780 ?auto_130785 ) ) ( not ( = ?auto_130780 ?auto_130786 ) ) ( not ( = ?auto_130781 ?auto_130785 ) ) ( not ( = ?auto_130781 ?auto_130786 ) ) ( not ( = ?auto_130782 ?auto_130785 ) ) ( not ( = ?auto_130782 ?auto_130786 ) ) ( ON ?auto_130780 ?auto_130787 ) ( not ( = ?auto_130780 ?auto_130787 ) ) ( not ( = ?auto_130781 ?auto_130787 ) ) ( not ( = ?auto_130782 ?auto_130787 ) ) ( not ( = ?auto_130783 ?auto_130787 ) ) ( not ( = ?auto_130784 ?auto_130787 ) ) ( not ( = ?auto_130788 ?auto_130787 ) ) ( not ( = ?auto_130785 ?auto_130787 ) ) ( not ( = ?auto_130786 ?auto_130787 ) ) ( ON ?auto_130781 ?auto_130780 ) ( ON-TABLE ?auto_130787 ) ( ON ?auto_130782 ?auto_130781 ) ( ON ?auto_130783 ?auto_130782 ) ( ON ?auto_130784 ?auto_130783 ) ( ON ?auto_130788 ?auto_130784 ) ( CLEAR ?auto_130785 ) ( ON ?auto_130786 ?auto_130788 ) ( CLEAR ?auto_130786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130787 ?auto_130780 ?auto_130781 ?auto_130782 ?auto_130783 ?auto_130784 ?auto_130788 )
      ( MAKE-5PILE ?auto_130780 ?auto_130781 ?auto_130782 ?auto_130783 ?auto_130784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130789 - BLOCK
      ?auto_130790 - BLOCK
      ?auto_130791 - BLOCK
      ?auto_130792 - BLOCK
      ?auto_130793 - BLOCK
    )
    :vars
    (
      ?auto_130796 - BLOCK
      ?auto_130797 - BLOCK
      ?auto_130795 - BLOCK
      ?auto_130794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130789 ?auto_130790 ) ) ( not ( = ?auto_130789 ?auto_130791 ) ) ( not ( = ?auto_130789 ?auto_130792 ) ) ( not ( = ?auto_130789 ?auto_130793 ) ) ( not ( = ?auto_130790 ?auto_130791 ) ) ( not ( = ?auto_130790 ?auto_130792 ) ) ( not ( = ?auto_130790 ?auto_130793 ) ) ( not ( = ?auto_130791 ?auto_130792 ) ) ( not ( = ?auto_130791 ?auto_130793 ) ) ( not ( = ?auto_130792 ?auto_130793 ) ) ( not ( = ?auto_130789 ?auto_130796 ) ) ( not ( = ?auto_130790 ?auto_130796 ) ) ( not ( = ?auto_130791 ?auto_130796 ) ) ( not ( = ?auto_130792 ?auto_130796 ) ) ( not ( = ?auto_130793 ?auto_130796 ) ) ( not ( = ?auto_130797 ?auto_130795 ) ) ( not ( = ?auto_130797 ?auto_130796 ) ) ( not ( = ?auto_130797 ?auto_130793 ) ) ( not ( = ?auto_130797 ?auto_130792 ) ) ( not ( = ?auto_130795 ?auto_130796 ) ) ( not ( = ?auto_130795 ?auto_130793 ) ) ( not ( = ?auto_130795 ?auto_130792 ) ) ( not ( = ?auto_130789 ?auto_130797 ) ) ( not ( = ?auto_130789 ?auto_130795 ) ) ( not ( = ?auto_130790 ?auto_130797 ) ) ( not ( = ?auto_130790 ?auto_130795 ) ) ( not ( = ?auto_130791 ?auto_130797 ) ) ( not ( = ?auto_130791 ?auto_130795 ) ) ( ON ?auto_130789 ?auto_130794 ) ( not ( = ?auto_130789 ?auto_130794 ) ) ( not ( = ?auto_130790 ?auto_130794 ) ) ( not ( = ?auto_130791 ?auto_130794 ) ) ( not ( = ?auto_130792 ?auto_130794 ) ) ( not ( = ?auto_130793 ?auto_130794 ) ) ( not ( = ?auto_130796 ?auto_130794 ) ) ( not ( = ?auto_130797 ?auto_130794 ) ) ( not ( = ?auto_130795 ?auto_130794 ) ) ( ON ?auto_130790 ?auto_130789 ) ( ON-TABLE ?auto_130794 ) ( ON ?auto_130791 ?auto_130790 ) ( ON ?auto_130792 ?auto_130791 ) ( ON ?auto_130793 ?auto_130792 ) ( ON ?auto_130796 ?auto_130793 ) ( ON ?auto_130795 ?auto_130796 ) ( CLEAR ?auto_130795 ) ( HOLDING ?auto_130797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130797 )
      ( MAKE-5PILE ?auto_130789 ?auto_130790 ?auto_130791 ?auto_130792 ?auto_130793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_130798 - BLOCK
      ?auto_130799 - BLOCK
      ?auto_130800 - BLOCK
      ?auto_130801 - BLOCK
      ?auto_130802 - BLOCK
    )
    :vars
    (
      ?auto_130805 - BLOCK
      ?auto_130806 - BLOCK
      ?auto_130804 - BLOCK
      ?auto_130803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_130798 ?auto_130799 ) ) ( not ( = ?auto_130798 ?auto_130800 ) ) ( not ( = ?auto_130798 ?auto_130801 ) ) ( not ( = ?auto_130798 ?auto_130802 ) ) ( not ( = ?auto_130799 ?auto_130800 ) ) ( not ( = ?auto_130799 ?auto_130801 ) ) ( not ( = ?auto_130799 ?auto_130802 ) ) ( not ( = ?auto_130800 ?auto_130801 ) ) ( not ( = ?auto_130800 ?auto_130802 ) ) ( not ( = ?auto_130801 ?auto_130802 ) ) ( not ( = ?auto_130798 ?auto_130805 ) ) ( not ( = ?auto_130799 ?auto_130805 ) ) ( not ( = ?auto_130800 ?auto_130805 ) ) ( not ( = ?auto_130801 ?auto_130805 ) ) ( not ( = ?auto_130802 ?auto_130805 ) ) ( not ( = ?auto_130806 ?auto_130804 ) ) ( not ( = ?auto_130806 ?auto_130805 ) ) ( not ( = ?auto_130806 ?auto_130802 ) ) ( not ( = ?auto_130806 ?auto_130801 ) ) ( not ( = ?auto_130804 ?auto_130805 ) ) ( not ( = ?auto_130804 ?auto_130802 ) ) ( not ( = ?auto_130804 ?auto_130801 ) ) ( not ( = ?auto_130798 ?auto_130806 ) ) ( not ( = ?auto_130798 ?auto_130804 ) ) ( not ( = ?auto_130799 ?auto_130806 ) ) ( not ( = ?auto_130799 ?auto_130804 ) ) ( not ( = ?auto_130800 ?auto_130806 ) ) ( not ( = ?auto_130800 ?auto_130804 ) ) ( ON ?auto_130798 ?auto_130803 ) ( not ( = ?auto_130798 ?auto_130803 ) ) ( not ( = ?auto_130799 ?auto_130803 ) ) ( not ( = ?auto_130800 ?auto_130803 ) ) ( not ( = ?auto_130801 ?auto_130803 ) ) ( not ( = ?auto_130802 ?auto_130803 ) ) ( not ( = ?auto_130805 ?auto_130803 ) ) ( not ( = ?auto_130806 ?auto_130803 ) ) ( not ( = ?auto_130804 ?auto_130803 ) ) ( ON ?auto_130799 ?auto_130798 ) ( ON-TABLE ?auto_130803 ) ( ON ?auto_130800 ?auto_130799 ) ( ON ?auto_130801 ?auto_130800 ) ( ON ?auto_130802 ?auto_130801 ) ( ON ?auto_130805 ?auto_130802 ) ( ON ?auto_130804 ?auto_130805 ) ( ON ?auto_130806 ?auto_130804 ) ( CLEAR ?auto_130806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_130803 ?auto_130798 ?auto_130799 ?auto_130800 ?auto_130801 ?auto_130802 ?auto_130805 ?auto_130804 )
      ( MAKE-5PILE ?auto_130798 ?auto_130799 ?auto_130800 ?auto_130801 ?auto_130802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130822 - BLOCK
      ?auto_130823 - BLOCK
    )
    :vars
    (
      ?auto_130825 - BLOCK
      ?auto_130824 - BLOCK
      ?auto_130826 - BLOCK
      ?auto_130829 - BLOCK
      ?auto_130827 - BLOCK
      ?auto_130828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130825 ?auto_130823 ) ( ON-TABLE ?auto_130822 ) ( ON ?auto_130823 ?auto_130822 ) ( not ( = ?auto_130822 ?auto_130823 ) ) ( not ( = ?auto_130822 ?auto_130825 ) ) ( not ( = ?auto_130823 ?auto_130825 ) ) ( not ( = ?auto_130822 ?auto_130824 ) ) ( not ( = ?auto_130822 ?auto_130826 ) ) ( not ( = ?auto_130823 ?auto_130824 ) ) ( not ( = ?auto_130823 ?auto_130826 ) ) ( not ( = ?auto_130825 ?auto_130824 ) ) ( not ( = ?auto_130825 ?auto_130826 ) ) ( not ( = ?auto_130824 ?auto_130826 ) ) ( ON ?auto_130824 ?auto_130825 ) ( CLEAR ?auto_130824 ) ( HOLDING ?auto_130826 ) ( CLEAR ?auto_130829 ) ( ON-TABLE ?auto_130827 ) ( ON ?auto_130828 ?auto_130827 ) ( ON ?auto_130829 ?auto_130828 ) ( not ( = ?auto_130827 ?auto_130828 ) ) ( not ( = ?auto_130827 ?auto_130829 ) ) ( not ( = ?auto_130827 ?auto_130826 ) ) ( not ( = ?auto_130828 ?auto_130829 ) ) ( not ( = ?auto_130828 ?auto_130826 ) ) ( not ( = ?auto_130829 ?auto_130826 ) ) ( not ( = ?auto_130822 ?auto_130829 ) ) ( not ( = ?auto_130822 ?auto_130827 ) ) ( not ( = ?auto_130822 ?auto_130828 ) ) ( not ( = ?auto_130823 ?auto_130829 ) ) ( not ( = ?auto_130823 ?auto_130827 ) ) ( not ( = ?auto_130823 ?auto_130828 ) ) ( not ( = ?auto_130825 ?auto_130829 ) ) ( not ( = ?auto_130825 ?auto_130827 ) ) ( not ( = ?auto_130825 ?auto_130828 ) ) ( not ( = ?auto_130824 ?auto_130829 ) ) ( not ( = ?auto_130824 ?auto_130827 ) ) ( not ( = ?auto_130824 ?auto_130828 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130827 ?auto_130828 ?auto_130829 ?auto_130826 )
      ( MAKE-2PILE ?auto_130822 ?auto_130823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130830 - BLOCK
      ?auto_130831 - BLOCK
    )
    :vars
    (
      ?auto_130833 - BLOCK
      ?auto_130834 - BLOCK
      ?auto_130836 - BLOCK
      ?auto_130835 - BLOCK
      ?auto_130837 - BLOCK
      ?auto_130832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130833 ?auto_130831 ) ( ON-TABLE ?auto_130830 ) ( ON ?auto_130831 ?auto_130830 ) ( not ( = ?auto_130830 ?auto_130831 ) ) ( not ( = ?auto_130830 ?auto_130833 ) ) ( not ( = ?auto_130831 ?auto_130833 ) ) ( not ( = ?auto_130830 ?auto_130834 ) ) ( not ( = ?auto_130830 ?auto_130836 ) ) ( not ( = ?auto_130831 ?auto_130834 ) ) ( not ( = ?auto_130831 ?auto_130836 ) ) ( not ( = ?auto_130833 ?auto_130834 ) ) ( not ( = ?auto_130833 ?auto_130836 ) ) ( not ( = ?auto_130834 ?auto_130836 ) ) ( ON ?auto_130834 ?auto_130833 ) ( CLEAR ?auto_130835 ) ( ON-TABLE ?auto_130837 ) ( ON ?auto_130832 ?auto_130837 ) ( ON ?auto_130835 ?auto_130832 ) ( not ( = ?auto_130837 ?auto_130832 ) ) ( not ( = ?auto_130837 ?auto_130835 ) ) ( not ( = ?auto_130837 ?auto_130836 ) ) ( not ( = ?auto_130832 ?auto_130835 ) ) ( not ( = ?auto_130832 ?auto_130836 ) ) ( not ( = ?auto_130835 ?auto_130836 ) ) ( not ( = ?auto_130830 ?auto_130835 ) ) ( not ( = ?auto_130830 ?auto_130837 ) ) ( not ( = ?auto_130830 ?auto_130832 ) ) ( not ( = ?auto_130831 ?auto_130835 ) ) ( not ( = ?auto_130831 ?auto_130837 ) ) ( not ( = ?auto_130831 ?auto_130832 ) ) ( not ( = ?auto_130833 ?auto_130835 ) ) ( not ( = ?auto_130833 ?auto_130837 ) ) ( not ( = ?auto_130833 ?auto_130832 ) ) ( not ( = ?auto_130834 ?auto_130835 ) ) ( not ( = ?auto_130834 ?auto_130837 ) ) ( not ( = ?auto_130834 ?auto_130832 ) ) ( ON ?auto_130836 ?auto_130834 ) ( CLEAR ?auto_130836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130830 ?auto_130831 ?auto_130833 ?auto_130834 )
      ( MAKE-2PILE ?auto_130830 ?auto_130831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130838 - BLOCK
      ?auto_130839 - BLOCK
    )
    :vars
    (
      ?auto_130841 - BLOCK
      ?auto_130845 - BLOCK
      ?auto_130844 - BLOCK
      ?auto_130840 - BLOCK
      ?auto_130843 - BLOCK
      ?auto_130842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130841 ?auto_130839 ) ( ON-TABLE ?auto_130838 ) ( ON ?auto_130839 ?auto_130838 ) ( not ( = ?auto_130838 ?auto_130839 ) ) ( not ( = ?auto_130838 ?auto_130841 ) ) ( not ( = ?auto_130839 ?auto_130841 ) ) ( not ( = ?auto_130838 ?auto_130845 ) ) ( not ( = ?auto_130838 ?auto_130844 ) ) ( not ( = ?auto_130839 ?auto_130845 ) ) ( not ( = ?auto_130839 ?auto_130844 ) ) ( not ( = ?auto_130841 ?auto_130845 ) ) ( not ( = ?auto_130841 ?auto_130844 ) ) ( not ( = ?auto_130845 ?auto_130844 ) ) ( ON ?auto_130845 ?auto_130841 ) ( ON-TABLE ?auto_130840 ) ( ON ?auto_130843 ?auto_130840 ) ( not ( = ?auto_130840 ?auto_130843 ) ) ( not ( = ?auto_130840 ?auto_130842 ) ) ( not ( = ?auto_130840 ?auto_130844 ) ) ( not ( = ?auto_130843 ?auto_130842 ) ) ( not ( = ?auto_130843 ?auto_130844 ) ) ( not ( = ?auto_130842 ?auto_130844 ) ) ( not ( = ?auto_130838 ?auto_130842 ) ) ( not ( = ?auto_130838 ?auto_130840 ) ) ( not ( = ?auto_130838 ?auto_130843 ) ) ( not ( = ?auto_130839 ?auto_130842 ) ) ( not ( = ?auto_130839 ?auto_130840 ) ) ( not ( = ?auto_130839 ?auto_130843 ) ) ( not ( = ?auto_130841 ?auto_130842 ) ) ( not ( = ?auto_130841 ?auto_130840 ) ) ( not ( = ?auto_130841 ?auto_130843 ) ) ( not ( = ?auto_130845 ?auto_130842 ) ) ( not ( = ?auto_130845 ?auto_130840 ) ) ( not ( = ?auto_130845 ?auto_130843 ) ) ( ON ?auto_130844 ?auto_130845 ) ( CLEAR ?auto_130844 ) ( HOLDING ?auto_130842 ) ( CLEAR ?auto_130843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130840 ?auto_130843 ?auto_130842 )
      ( MAKE-2PILE ?auto_130838 ?auto_130839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130846 - BLOCK
      ?auto_130847 - BLOCK
    )
    :vars
    (
      ?auto_130852 - BLOCK
      ?auto_130850 - BLOCK
      ?auto_130851 - BLOCK
      ?auto_130853 - BLOCK
      ?auto_130849 - BLOCK
      ?auto_130848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130852 ?auto_130847 ) ( ON-TABLE ?auto_130846 ) ( ON ?auto_130847 ?auto_130846 ) ( not ( = ?auto_130846 ?auto_130847 ) ) ( not ( = ?auto_130846 ?auto_130852 ) ) ( not ( = ?auto_130847 ?auto_130852 ) ) ( not ( = ?auto_130846 ?auto_130850 ) ) ( not ( = ?auto_130846 ?auto_130851 ) ) ( not ( = ?auto_130847 ?auto_130850 ) ) ( not ( = ?auto_130847 ?auto_130851 ) ) ( not ( = ?auto_130852 ?auto_130850 ) ) ( not ( = ?auto_130852 ?auto_130851 ) ) ( not ( = ?auto_130850 ?auto_130851 ) ) ( ON ?auto_130850 ?auto_130852 ) ( ON-TABLE ?auto_130853 ) ( ON ?auto_130849 ?auto_130853 ) ( not ( = ?auto_130853 ?auto_130849 ) ) ( not ( = ?auto_130853 ?auto_130848 ) ) ( not ( = ?auto_130853 ?auto_130851 ) ) ( not ( = ?auto_130849 ?auto_130848 ) ) ( not ( = ?auto_130849 ?auto_130851 ) ) ( not ( = ?auto_130848 ?auto_130851 ) ) ( not ( = ?auto_130846 ?auto_130848 ) ) ( not ( = ?auto_130846 ?auto_130853 ) ) ( not ( = ?auto_130846 ?auto_130849 ) ) ( not ( = ?auto_130847 ?auto_130848 ) ) ( not ( = ?auto_130847 ?auto_130853 ) ) ( not ( = ?auto_130847 ?auto_130849 ) ) ( not ( = ?auto_130852 ?auto_130848 ) ) ( not ( = ?auto_130852 ?auto_130853 ) ) ( not ( = ?auto_130852 ?auto_130849 ) ) ( not ( = ?auto_130850 ?auto_130848 ) ) ( not ( = ?auto_130850 ?auto_130853 ) ) ( not ( = ?auto_130850 ?auto_130849 ) ) ( ON ?auto_130851 ?auto_130850 ) ( CLEAR ?auto_130849 ) ( ON ?auto_130848 ?auto_130851 ) ( CLEAR ?auto_130848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_130846 ?auto_130847 ?auto_130852 ?auto_130850 ?auto_130851 )
      ( MAKE-2PILE ?auto_130846 ?auto_130847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130854 - BLOCK
      ?auto_130855 - BLOCK
    )
    :vars
    (
      ?auto_130860 - BLOCK
      ?auto_130856 - BLOCK
      ?auto_130858 - BLOCK
      ?auto_130861 - BLOCK
      ?auto_130857 - BLOCK
      ?auto_130859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130860 ?auto_130855 ) ( ON-TABLE ?auto_130854 ) ( ON ?auto_130855 ?auto_130854 ) ( not ( = ?auto_130854 ?auto_130855 ) ) ( not ( = ?auto_130854 ?auto_130860 ) ) ( not ( = ?auto_130855 ?auto_130860 ) ) ( not ( = ?auto_130854 ?auto_130856 ) ) ( not ( = ?auto_130854 ?auto_130858 ) ) ( not ( = ?auto_130855 ?auto_130856 ) ) ( not ( = ?auto_130855 ?auto_130858 ) ) ( not ( = ?auto_130860 ?auto_130856 ) ) ( not ( = ?auto_130860 ?auto_130858 ) ) ( not ( = ?auto_130856 ?auto_130858 ) ) ( ON ?auto_130856 ?auto_130860 ) ( ON-TABLE ?auto_130861 ) ( not ( = ?auto_130861 ?auto_130857 ) ) ( not ( = ?auto_130861 ?auto_130859 ) ) ( not ( = ?auto_130861 ?auto_130858 ) ) ( not ( = ?auto_130857 ?auto_130859 ) ) ( not ( = ?auto_130857 ?auto_130858 ) ) ( not ( = ?auto_130859 ?auto_130858 ) ) ( not ( = ?auto_130854 ?auto_130859 ) ) ( not ( = ?auto_130854 ?auto_130861 ) ) ( not ( = ?auto_130854 ?auto_130857 ) ) ( not ( = ?auto_130855 ?auto_130859 ) ) ( not ( = ?auto_130855 ?auto_130861 ) ) ( not ( = ?auto_130855 ?auto_130857 ) ) ( not ( = ?auto_130860 ?auto_130859 ) ) ( not ( = ?auto_130860 ?auto_130861 ) ) ( not ( = ?auto_130860 ?auto_130857 ) ) ( not ( = ?auto_130856 ?auto_130859 ) ) ( not ( = ?auto_130856 ?auto_130861 ) ) ( not ( = ?auto_130856 ?auto_130857 ) ) ( ON ?auto_130858 ?auto_130856 ) ( ON ?auto_130859 ?auto_130858 ) ( CLEAR ?auto_130859 ) ( HOLDING ?auto_130857 ) ( CLEAR ?auto_130861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130861 ?auto_130857 )
      ( MAKE-2PILE ?auto_130854 ?auto_130855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130862 - BLOCK
      ?auto_130863 - BLOCK
    )
    :vars
    (
      ?auto_130868 - BLOCK
      ?auto_130864 - BLOCK
      ?auto_130866 - BLOCK
      ?auto_130867 - BLOCK
      ?auto_130869 - BLOCK
      ?auto_130865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130868 ?auto_130863 ) ( ON-TABLE ?auto_130862 ) ( ON ?auto_130863 ?auto_130862 ) ( not ( = ?auto_130862 ?auto_130863 ) ) ( not ( = ?auto_130862 ?auto_130868 ) ) ( not ( = ?auto_130863 ?auto_130868 ) ) ( not ( = ?auto_130862 ?auto_130864 ) ) ( not ( = ?auto_130862 ?auto_130866 ) ) ( not ( = ?auto_130863 ?auto_130864 ) ) ( not ( = ?auto_130863 ?auto_130866 ) ) ( not ( = ?auto_130868 ?auto_130864 ) ) ( not ( = ?auto_130868 ?auto_130866 ) ) ( not ( = ?auto_130864 ?auto_130866 ) ) ( ON ?auto_130864 ?auto_130868 ) ( ON-TABLE ?auto_130867 ) ( not ( = ?auto_130867 ?auto_130869 ) ) ( not ( = ?auto_130867 ?auto_130865 ) ) ( not ( = ?auto_130867 ?auto_130866 ) ) ( not ( = ?auto_130869 ?auto_130865 ) ) ( not ( = ?auto_130869 ?auto_130866 ) ) ( not ( = ?auto_130865 ?auto_130866 ) ) ( not ( = ?auto_130862 ?auto_130865 ) ) ( not ( = ?auto_130862 ?auto_130867 ) ) ( not ( = ?auto_130862 ?auto_130869 ) ) ( not ( = ?auto_130863 ?auto_130865 ) ) ( not ( = ?auto_130863 ?auto_130867 ) ) ( not ( = ?auto_130863 ?auto_130869 ) ) ( not ( = ?auto_130868 ?auto_130865 ) ) ( not ( = ?auto_130868 ?auto_130867 ) ) ( not ( = ?auto_130868 ?auto_130869 ) ) ( not ( = ?auto_130864 ?auto_130865 ) ) ( not ( = ?auto_130864 ?auto_130867 ) ) ( not ( = ?auto_130864 ?auto_130869 ) ) ( ON ?auto_130866 ?auto_130864 ) ( ON ?auto_130865 ?auto_130866 ) ( CLEAR ?auto_130867 ) ( ON ?auto_130869 ?auto_130865 ) ( CLEAR ?auto_130869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130862 ?auto_130863 ?auto_130868 ?auto_130864 ?auto_130866 ?auto_130865 )
      ( MAKE-2PILE ?auto_130862 ?auto_130863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130870 - BLOCK
      ?auto_130871 - BLOCK
    )
    :vars
    (
      ?auto_130872 - BLOCK
      ?auto_130873 - BLOCK
      ?auto_130876 - BLOCK
      ?auto_130874 - BLOCK
      ?auto_130877 - BLOCK
      ?auto_130875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130872 ?auto_130871 ) ( ON-TABLE ?auto_130870 ) ( ON ?auto_130871 ?auto_130870 ) ( not ( = ?auto_130870 ?auto_130871 ) ) ( not ( = ?auto_130870 ?auto_130872 ) ) ( not ( = ?auto_130871 ?auto_130872 ) ) ( not ( = ?auto_130870 ?auto_130873 ) ) ( not ( = ?auto_130870 ?auto_130876 ) ) ( not ( = ?auto_130871 ?auto_130873 ) ) ( not ( = ?auto_130871 ?auto_130876 ) ) ( not ( = ?auto_130872 ?auto_130873 ) ) ( not ( = ?auto_130872 ?auto_130876 ) ) ( not ( = ?auto_130873 ?auto_130876 ) ) ( ON ?auto_130873 ?auto_130872 ) ( not ( = ?auto_130874 ?auto_130877 ) ) ( not ( = ?auto_130874 ?auto_130875 ) ) ( not ( = ?auto_130874 ?auto_130876 ) ) ( not ( = ?auto_130877 ?auto_130875 ) ) ( not ( = ?auto_130877 ?auto_130876 ) ) ( not ( = ?auto_130875 ?auto_130876 ) ) ( not ( = ?auto_130870 ?auto_130875 ) ) ( not ( = ?auto_130870 ?auto_130874 ) ) ( not ( = ?auto_130870 ?auto_130877 ) ) ( not ( = ?auto_130871 ?auto_130875 ) ) ( not ( = ?auto_130871 ?auto_130874 ) ) ( not ( = ?auto_130871 ?auto_130877 ) ) ( not ( = ?auto_130872 ?auto_130875 ) ) ( not ( = ?auto_130872 ?auto_130874 ) ) ( not ( = ?auto_130872 ?auto_130877 ) ) ( not ( = ?auto_130873 ?auto_130875 ) ) ( not ( = ?auto_130873 ?auto_130874 ) ) ( not ( = ?auto_130873 ?auto_130877 ) ) ( ON ?auto_130876 ?auto_130873 ) ( ON ?auto_130875 ?auto_130876 ) ( ON ?auto_130877 ?auto_130875 ) ( CLEAR ?auto_130877 ) ( HOLDING ?auto_130874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_130874 )
      ( MAKE-2PILE ?auto_130870 ?auto_130871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130888 - BLOCK
      ?auto_130889 - BLOCK
    )
    :vars
    (
      ?auto_130892 - BLOCK
      ?auto_130891 - BLOCK
      ?auto_130890 - BLOCK
      ?auto_130894 - BLOCK
      ?auto_130895 - BLOCK
      ?auto_130893 - BLOCK
      ?auto_130896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130892 ?auto_130889 ) ( ON-TABLE ?auto_130888 ) ( ON ?auto_130889 ?auto_130888 ) ( not ( = ?auto_130888 ?auto_130889 ) ) ( not ( = ?auto_130888 ?auto_130892 ) ) ( not ( = ?auto_130889 ?auto_130892 ) ) ( not ( = ?auto_130888 ?auto_130891 ) ) ( not ( = ?auto_130888 ?auto_130890 ) ) ( not ( = ?auto_130889 ?auto_130891 ) ) ( not ( = ?auto_130889 ?auto_130890 ) ) ( not ( = ?auto_130892 ?auto_130891 ) ) ( not ( = ?auto_130892 ?auto_130890 ) ) ( not ( = ?auto_130891 ?auto_130890 ) ) ( ON ?auto_130891 ?auto_130892 ) ( not ( = ?auto_130894 ?auto_130895 ) ) ( not ( = ?auto_130894 ?auto_130893 ) ) ( not ( = ?auto_130894 ?auto_130890 ) ) ( not ( = ?auto_130895 ?auto_130893 ) ) ( not ( = ?auto_130895 ?auto_130890 ) ) ( not ( = ?auto_130893 ?auto_130890 ) ) ( not ( = ?auto_130888 ?auto_130893 ) ) ( not ( = ?auto_130888 ?auto_130894 ) ) ( not ( = ?auto_130888 ?auto_130895 ) ) ( not ( = ?auto_130889 ?auto_130893 ) ) ( not ( = ?auto_130889 ?auto_130894 ) ) ( not ( = ?auto_130889 ?auto_130895 ) ) ( not ( = ?auto_130892 ?auto_130893 ) ) ( not ( = ?auto_130892 ?auto_130894 ) ) ( not ( = ?auto_130892 ?auto_130895 ) ) ( not ( = ?auto_130891 ?auto_130893 ) ) ( not ( = ?auto_130891 ?auto_130894 ) ) ( not ( = ?auto_130891 ?auto_130895 ) ) ( ON ?auto_130890 ?auto_130891 ) ( ON ?auto_130893 ?auto_130890 ) ( ON ?auto_130895 ?auto_130893 ) ( CLEAR ?auto_130895 ) ( ON ?auto_130894 ?auto_130896 ) ( CLEAR ?auto_130894 ) ( HAND-EMPTY ) ( not ( = ?auto_130888 ?auto_130896 ) ) ( not ( = ?auto_130889 ?auto_130896 ) ) ( not ( = ?auto_130892 ?auto_130896 ) ) ( not ( = ?auto_130891 ?auto_130896 ) ) ( not ( = ?auto_130890 ?auto_130896 ) ) ( not ( = ?auto_130894 ?auto_130896 ) ) ( not ( = ?auto_130895 ?auto_130896 ) ) ( not ( = ?auto_130893 ?auto_130896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_130894 ?auto_130896 )
      ( MAKE-2PILE ?auto_130888 ?auto_130889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130897 - BLOCK
      ?auto_130898 - BLOCK
    )
    :vars
    (
      ?auto_130899 - BLOCK
      ?auto_130901 - BLOCK
      ?auto_130900 - BLOCK
      ?auto_130905 - BLOCK
      ?auto_130904 - BLOCK
      ?auto_130902 - BLOCK
      ?auto_130903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130899 ?auto_130898 ) ( ON-TABLE ?auto_130897 ) ( ON ?auto_130898 ?auto_130897 ) ( not ( = ?auto_130897 ?auto_130898 ) ) ( not ( = ?auto_130897 ?auto_130899 ) ) ( not ( = ?auto_130898 ?auto_130899 ) ) ( not ( = ?auto_130897 ?auto_130901 ) ) ( not ( = ?auto_130897 ?auto_130900 ) ) ( not ( = ?auto_130898 ?auto_130901 ) ) ( not ( = ?auto_130898 ?auto_130900 ) ) ( not ( = ?auto_130899 ?auto_130901 ) ) ( not ( = ?auto_130899 ?auto_130900 ) ) ( not ( = ?auto_130901 ?auto_130900 ) ) ( ON ?auto_130901 ?auto_130899 ) ( not ( = ?auto_130905 ?auto_130904 ) ) ( not ( = ?auto_130905 ?auto_130902 ) ) ( not ( = ?auto_130905 ?auto_130900 ) ) ( not ( = ?auto_130904 ?auto_130902 ) ) ( not ( = ?auto_130904 ?auto_130900 ) ) ( not ( = ?auto_130902 ?auto_130900 ) ) ( not ( = ?auto_130897 ?auto_130902 ) ) ( not ( = ?auto_130897 ?auto_130905 ) ) ( not ( = ?auto_130897 ?auto_130904 ) ) ( not ( = ?auto_130898 ?auto_130902 ) ) ( not ( = ?auto_130898 ?auto_130905 ) ) ( not ( = ?auto_130898 ?auto_130904 ) ) ( not ( = ?auto_130899 ?auto_130902 ) ) ( not ( = ?auto_130899 ?auto_130905 ) ) ( not ( = ?auto_130899 ?auto_130904 ) ) ( not ( = ?auto_130901 ?auto_130902 ) ) ( not ( = ?auto_130901 ?auto_130905 ) ) ( not ( = ?auto_130901 ?auto_130904 ) ) ( ON ?auto_130900 ?auto_130901 ) ( ON ?auto_130902 ?auto_130900 ) ( ON ?auto_130905 ?auto_130903 ) ( CLEAR ?auto_130905 ) ( not ( = ?auto_130897 ?auto_130903 ) ) ( not ( = ?auto_130898 ?auto_130903 ) ) ( not ( = ?auto_130899 ?auto_130903 ) ) ( not ( = ?auto_130901 ?auto_130903 ) ) ( not ( = ?auto_130900 ?auto_130903 ) ) ( not ( = ?auto_130905 ?auto_130903 ) ) ( not ( = ?auto_130904 ?auto_130903 ) ) ( not ( = ?auto_130902 ?auto_130903 ) ) ( HOLDING ?auto_130904 ) ( CLEAR ?auto_130902 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_130897 ?auto_130898 ?auto_130899 ?auto_130901 ?auto_130900 ?auto_130902 ?auto_130904 )
      ( MAKE-2PILE ?auto_130897 ?auto_130898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130906 - BLOCK
      ?auto_130907 - BLOCK
    )
    :vars
    (
      ?auto_130914 - BLOCK
      ?auto_130910 - BLOCK
      ?auto_130909 - BLOCK
      ?auto_130908 - BLOCK
      ?auto_130913 - BLOCK
      ?auto_130911 - BLOCK
      ?auto_130912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130914 ?auto_130907 ) ( ON-TABLE ?auto_130906 ) ( ON ?auto_130907 ?auto_130906 ) ( not ( = ?auto_130906 ?auto_130907 ) ) ( not ( = ?auto_130906 ?auto_130914 ) ) ( not ( = ?auto_130907 ?auto_130914 ) ) ( not ( = ?auto_130906 ?auto_130910 ) ) ( not ( = ?auto_130906 ?auto_130909 ) ) ( not ( = ?auto_130907 ?auto_130910 ) ) ( not ( = ?auto_130907 ?auto_130909 ) ) ( not ( = ?auto_130914 ?auto_130910 ) ) ( not ( = ?auto_130914 ?auto_130909 ) ) ( not ( = ?auto_130910 ?auto_130909 ) ) ( ON ?auto_130910 ?auto_130914 ) ( not ( = ?auto_130908 ?auto_130913 ) ) ( not ( = ?auto_130908 ?auto_130911 ) ) ( not ( = ?auto_130908 ?auto_130909 ) ) ( not ( = ?auto_130913 ?auto_130911 ) ) ( not ( = ?auto_130913 ?auto_130909 ) ) ( not ( = ?auto_130911 ?auto_130909 ) ) ( not ( = ?auto_130906 ?auto_130911 ) ) ( not ( = ?auto_130906 ?auto_130908 ) ) ( not ( = ?auto_130906 ?auto_130913 ) ) ( not ( = ?auto_130907 ?auto_130911 ) ) ( not ( = ?auto_130907 ?auto_130908 ) ) ( not ( = ?auto_130907 ?auto_130913 ) ) ( not ( = ?auto_130914 ?auto_130911 ) ) ( not ( = ?auto_130914 ?auto_130908 ) ) ( not ( = ?auto_130914 ?auto_130913 ) ) ( not ( = ?auto_130910 ?auto_130911 ) ) ( not ( = ?auto_130910 ?auto_130908 ) ) ( not ( = ?auto_130910 ?auto_130913 ) ) ( ON ?auto_130909 ?auto_130910 ) ( ON ?auto_130911 ?auto_130909 ) ( ON ?auto_130908 ?auto_130912 ) ( not ( = ?auto_130906 ?auto_130912 ) ) ( not ( = ?auto_130907 ?auto_130912 ) ) ( not ( = ?auto_130914 ?auto_130912 ) ) ( not ( = ?auto_130910 ?auto_130912 ) ) ( not ( = ?auto_130909 ?auto_130912 ) ) ( not ( = ?auto_130908 ?auto_130912 ) ) ( not ( = ?auto_130913 ?auto_130912 ) ) ( not ( = ?auto_130911 ?auto_130912 ) ) ( CLEAR ?auto_130911 ) ( ON ?auto_130913 ?auto_130908 ) ( CLEAR ?auto_130913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130912 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_130912 ?auto_130908 )
      ( MAKE-2PILE ?auto_130906 ?auto_130907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130915 - BLOCK
      ?auto_130916 - BLOCK
    )
    :vars
    (
      ?auto_130919 - BLOCK
      ?auto_130921 - BLOCK
      ?auto_130917 - BLOCK
      ?auto_130918 - BLOCK
      ?auto_130920 - BLOCK
      ?auto_130922 - BLOCK
      ?auto_130923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130919 ?auto_130916 ) ( ON-TABLE ?auto_130915 ) ( ON ?auto_130916 ?auto_130915 ) ( not ( = ?auto_130915 ?auto_130916 ) ) ( not ( = ?auto_130915 ?auto_130919 ) ) ( not ( = ?auto_130916 ?auto_130919 ) ) ( not ( = ?auto_130915 ?auto_130921 ) ) ( not ( = ?auto_130915 ?auto_130917 ) ) ( not ( = ?auto_130916 ?auto_130921 ) ) ( not ( = ?auto_130916 ?auto_130917 ) ) ( not ( = ?auto_130919 ?auto_130921 ) ) ( not ( = ?auto_130919 ?auto_130917 ) ) ( not ( = ?auto_130921 ?auto_130917 ) ) ( ON ?auto_130921 ?auto_130919 ) ( not ( = ?auto_130918 ?auto_130920 ) ) ( not ( = ?auto_130918 ?auto_130922 ) ) ( not ( = ?auto_130918 ?auto_130917 ) ) ( not ( = ?auto_130920 ?auto_130922 ) ) ( not ( = ?auto_130920 ?auto_130917 ) ) ( not ( = ?auto_130922 ?auto_130917 ) ) ( not ( = ?auto_130915 ?auto_130922 ) ) ( not ( = ?auto_130915 ?auto_130918 ) ) ( not ( = ?auto_130915 ?auto_130920 ) ) ( not ( = ?auto_130916 ?auto_130922 ) ) ( not ( = ?auto_130916 ?auto_130918 ) ) ( not ( = ?auto_130916 ?auto_130920 ) ) ( not ( = ?auto_130919 ?auto_130922 ) ) ( not ( = ?auto_130919 ?auto_130918 ) ) ( not ( = ?auto_130919 ?auto_130920 ) ) ( not ( = ?auto_130921 ?auto_130922 ) ) ( not ( = ?auto_130921 ?auto_130918 ) ) ( not ( = ?auto_130921 ?auto_130920 ) ) ( ON ?auto_130917 ?auto_130921 ) ( ON ?auto_130918 ?auto_130923 ) ( not ( = ?auto_130915 ?auto_130923 ) ) ( not ( = ?auto_130916 ?auto_130923 ) ) ( not ( = ?auto_130919 ?auto_130923 ) ) ( not ( = ?auto_130921 ?auto_130923 ) ) ( not ( = ?auto_130917 ?auto_130923 ) ) ( not ( = ?auto_130918 ?auto_130923 ) ) ( not ( = ?auto_130920 ?auto_130923 ) ) ( not ( = ?auto_130922 ?auto_130923 ) ) ( ON ?auto_130920 ?auto_130918 ) ( CLEAR ?auto_130920 ) ( ON-TABLE ?auto_130923 ) ( HOLDING ?auto_130922 ) ( CLEAR ?auto_130917 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_130915 ?auto_130916 ?auto_130919 ?auto_130921 ?auto_130917 ?auto_130922 )
      ( MAKE-2PILE ?auto_130915 ?auto_130916 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_130924 - BLOCK
      ?auto_130925 - BLOCK
    )
    :vars
    (
      ?auto_130928 - BLOCK
      ?auto_130931 - BLOCK
      ?auto_130932 - BLOCK
      ?auto_130927 - BLOCK
      ?auto_130929 - BLOCK
      ?auto_130926 - BLOCK
      ?auto_130930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_130928 ?auto_130925 ) ( ON-TABLE ?auto_130924 ) ( ON ?auto_130925 ?auto_130924 ) ( not ( = ?auto_130924 ?auto_130925 ) ) ( not ( = ?auto_130924 ?auto_130928 ) ) ( not ( = ?auto_130925 ?auto_130928 ) ) ( not ( = ?auto_130924 ?auto_130931 ) ) ( not ( = ?auto_130924 ?auto_130932 ) ) ( not ( = ?auto_130925 ?auto_130931 ) ) ( not ( = ?auto_130925 ?auto_130932 ) ) ( not ( = ?auto_130928 ?auto_130931 ) ) ( not ( = ?auto_130928 ?auto_130932 ) ) ( not ( = ?auto_130931 ?auto_130932 ) ) ( ON ?auto_130931 ?auto_130928 ) ( not ( = ?auto_130927 ?auto_130929 ) ) ( not ( = ?auto_130927 ?auto_130926 ) ) ( not ( = ?auto_130927 ?auto_130932 ) ) ( not ( = ?auto_130929 ?auto_130926 ) ) ( not ( = ?auto_130929 ?auto_130932 ) ) ( not ( = ?auto_130926 ?auto_130932 ) ) ( not ( = ?auto_130924 ?auto_130926 ) ) ( not ( = ?auto_130924 ?auto_130927 ) ) ( not ( = ?auto_130924 ?auto_130929 ) ) ( not ( = ?auto_130925 ?auto_130926 ) ) ( not ( = ?auto_130925 ?auto_130927 ) ) ( not ( = ?auto_130925 ?auto_130929 ) ) ( not ( = ?auto_130928 ?auto_130926 ) ) ( not ( = ?auto_130928 ?auto_130927 ) ) ( not ( = ?auto_130928 ?auto_130929 ) ) ( not ( = ?auto_130931 ?auto_130926 ) ) ( not ( = ?auto_130931 ?auto_130927 ) ) ( not ( = ?auto_130931 ?auto_130929 ) ) ( ON ?auto_130932 ?auto_130931 ) ( ON ?auto_130927 ?auto_130930 ) ( not ( = ?auto_130924 ?auto_130930 ) ) ( not ( = ?auto_130925 ?auto_130930 ) ) ( not ( = ?auto_130928 ?auto_130930 ) ) ( not ( = ?auto_130931 ?auto_130930 ) ) ( not ( = ?auto_130932 ?auto_130930 ) ) ( not ( = ?auto_130927 ?auto_130930 ) ) ( not ( = ?auto_130929 ?auto_130930 ) ) ( not ( = ?auto_130926 ?auto_130930 ) ) ( ON ?auto_130929 ?auto_130927 ) ( ON-TABLE ?auto_130930 ) ( CLEAR ?auto_130932 ) ( ON ?auto_130926 ?auto_130929 ) ( CLEAR ?auto_130926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130930 ?auto_130927 ?auto_130929 )
      ( MAKE-2PILE ?auto_130924 ?auto_130925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130982 - BLOCK
      ?auto_130983 - BLOCK
      ?auto_130984 - BLOCK
      ?auto_130985 - BLOCK
      ?auto_130986 - BLOCK
      ?auto_130987 - BLOCK
    )
    :vars
    (
      ?auto_130988 - BLOCK
      ?auto_130989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130982 ) ( ON ?auto_130983 ?auto_130982 ) ( ON ?auto_130984 ?auto_130983 ) ( ON ?auto_130985 ?auto_130984 ) ( not ( = ?auto_130982 ?auto_130983 ) ) ( not ( = ?auto_130982 ?auto_130984 ) ) ( not ( = ?auto_130982 ?auto_130985 ) ) ( not ( = ?auto_130982 ?auto_130986 ) ) ( not ( = ?auto_130982 ?auto_130987 ) ) ( not ( = ?auto_130983 ?auto_130984 ) ) ( not ( = ?auto_130983 ?auto_130985 ) ) ( not ( = ?auto_130983 ?auto_130986 ) ) ( not ( = ?auto_130983 ?auto_130987 ) ) ( not ( = ?auto_130984 ?auto_130985 ) ) ( not ( = ?auto_130984 ?auto_130986 ) ) ( not ( = ?auto_130984 ?auto_130987 ) ) ( not ( = ?auto_130985 ?auto_130986 ) ) ( not ( = ?auto_130985 ?auto_130987 ) ) ( not ( = ?auto_130986 ?auto_130987 ) ) ( ON ?auto_130987 ?auto_130988 ) ( not ( = ?auto_130982 ?auto_130988 ) ) ( not ( = ?auto_130983 ?auto_130988 ) ) ( not ( = ?auto_130984 ?auto_130988 ) ) ( not ( = ?auto_130985 ?auto_130988 ) ) ( not ( = ?auto_130986 ?auto_130988 ) ) ( not ( = ?auto_130987 ?auto_130988 ) ) ( CLEAR ?auto_130985 ) ( ON ?auto_130986 ?auto_130987 ) ( CLEAR ?auto_130986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_130989 ) ( ON ?auto_130988 ?auto_130989 ) ( not ( = ?auto_130989 ?auto_130988 ) ) ( not ( = ?auto_130989 ?auto_130987 ) ) ( not ( = ?auto_130989 ?auto_130986 ) ) ( not ( = ?auto_130982 ?auto_130989 ) ) ( not ( = ?auto_130983 ?auto_130989 ) ) ( not ( = ?auto_130984 ?auto_130989 ) ) ( not ( = ?auto_130985 ?auto_130989 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_130989 ?auto_130988 ?auto_130987 )
      ( MAKE-6PILE ?auto_130982 ?auto_130983 ?auto_130984 ?auto_130985 ?auto_130986 ?auto_130987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130990 - BLOCK
      ?auto_130991 - BLOCK
      ?auto_130992 - BLOCK
      ?auto_130993 - BLOCK
      ?auto_130994 - BLOCK
      ?auto_130995 - BLOCK
    )
    :vars
    (
      ?auto_130997 - BLOCK
      ?auto_130996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130990 ) ( ON ?auto_130991 ?auto_130990 ) ( ON ?auto_130992 ?auto_130991 ) ( not ( = ?auto_130990 ?auto_130991 ) ) ( not ( = ?auto_130990 ?auto_130992 ) ) ( not ( = ?auto_130990 ?auto_130993 ) ) ( not ( = ?auto_130990 ?auto_130994 ) ) ( not ( = ?auto_130990 ?auto_130995 ) ) ( not ( = ?auto_130991 ?auto_130992 ) ) ( not ( = ?auto_130991 ?auto_130993 ) ) ( not ( = ?auto_130991 ?auto_130994 ) ) ( not ( = ?auto_130991 ?auto_130995 ) ) ( not ( = ?auto_130992 ?auto_130993 ) ) ( not ( = ?auto_130992 ?auto_130994 ) ) ( not ( = ?auto_130992 ?auto_130995 ) ) ( not ( = ?auto_130993 ?auto_130994 ) ) ( not ( = ?auto_130993 ?auto_130995 ) ) ( not ( = ?auto_130994 ?auto_130995 ) ) ( ON ?auto_130995 ?auto_130997 ) ( not ( = ?auto_130990 ?auto_130997 ) ) ( not ( = ?auto_130991 ?auto_130997 ) ) ( not ( = ?auto_130992 ?auto_130997 ) ) ( not ( = ?auto_130993 ?auto_130997 ) ) ( not ( = ?auto_130994 ?auto_130997 ) ) ( not ( = ?auto_130995 ?auto_130997 ) ) ( ON ?auto_130994 ?auto_130995 ) ( CLEAR ?auto_130994 ) ( ON-TABLE ?auto_130996 ) ( ON ?auto_130997 ?auto_130996 ) ( not ( = ?auto_130996 ?auto_130997 ) ) ( not ( = ?auto_130996 ?auto_130995 ) ) ( not ( = ?auto_130996 ?auto_130994 ) ) ( not ( = ?auto_130990 ?auto_130996 ) ) ( not ( = ?auto_130991 ?auto_130996 ) ) ( not ( = ?auto_130992 ?auto_130996 ) ) ( not ( = ?auto_130993 ?auto_130996 ) ) ( HOLDING ?auto_130993 ) ( CLEAR ?auto_130992 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_130990 ?auto_130991 ?auto_130992 ?auto_130993 )
      ( MAKE-6PILE ?auto_130990 ?auto_130991 ?auto_130992 ?auto_130993 ?auto_130994 ?auto_130995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_130998 - BLOCK
      ?auto_130999 - BLOCK
      ?auto_131000 - BLOCK
      ?auto_131001 - BLOCK
      ?auto_131002 - BLOCK
      ?auto_131003 - BLOCK
    )
    :vars
    (
      ?auto_131005 - BLOCK
      ?auto_131004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_130998 ) ( ON ?auto_130999 ?auto_130998 ) ( ON ?auto_131000 ?auto_130999 ) ( not ( = ?auto_130998 ?auto_130999 ) ) ( not ( = ?auto_130998 ?auto_131000 ) ) ( not ( = ?auto_130998 ?auto_131001 ) ) ( not ( = ?auto_130998 ?auto_131002 ) ) ( not ( = ?auto_130998 ?auto_131003 ) ) ( not ( = ?auto_130999 ?auto_131000 ) ) ( not ( = ?auto_130999 ?auto_131001 ) ) ( not ( = ?auto_130999 ?auto_131002 ) ) ( not ( = ?auto_130999 ?auto_131003 ) ) ( not ( = ?auto_131000 ?auto_131001 ) ) ( not ( = ?auto_131000 ?auto_131002 ) ) ( not ( = ?auto_131000 ?auto_131003 ) ) ( not ( = ?auto_131001 ?auto_131002 ) ) ( not ( = ?auto_131001 ?auto_131003 ) ) ( not ( = ?auto_131002 ?auto_131003 ) ) ( ON ?auto_131003 ?auto_131005 ) ( not ( = ?auto_130998 ?auto_131005 ) ) ( not ( = ?auto_130999 ?auto_131005 ) ) ( not ( = ?auto_131000 ?auto_131005 ) ) ( not ( = ?auto_131001 ?auto_131005 ) ) ( not ( = ?auto_131002 ?auto_131005 ) ) ( not ( = ?auto_131003 ?auto_131005 ) ) ( ON ?auto_131002 ?auto_131003 ) ( ON-TABLE ?auto_131004 ) ( ON ?auto_131005 ?auto_131004 ) ( not ( = ?auto_131004 ?auto_131005 ) ) ( not ( = ?auto_131004 ?auto_131003 ) ) ( not ( = ?auto_131004 ?auto_131002 ) ) ( not ( = ?auto_130998 ?auto_131004 ) ) ( not ( = ?auto_130999 ?auto_131004 ) ) ( not ( = ?auto_131000 ?auto_131004 ) ) ( not ( = ?auto_131001 ?auto_131004 ) ) ( CLEAR ?auto_131000 ) ( ON ?auto_131001 ?auto_131002 ) ( CLEAR ?auto_131001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131004 ?auto_131005 ?auto_131003 ?auto_131002 )
      ( MAKE-6PILE ?auto_130998 ?auto_130999 ?auto_131000 ?auto_131001 ?auto_131002 ?auto_131003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131006 - BLOCK
      ?auto_131007 - BLOCK
      ?auto_131008 - BLOCK
      ?auto_131009 - BLOCK
      ?auto_131010 - BLOCK
      ?auto_131011 - BLOCK
    )
    :vars
    (
      ?auto_131012 - BLOCK
      ?auto_131013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131006 ) ( ON ?auto_131007 ?auto_131006 ) ( not ( = ?auto_131006 ?auto_131007 ) ) ( not ( = ?auto_131006 ?auto_131008 ) ) ( not ( = ?auto_131006 ?auto_131009 ) ) ( not ( = ?auto_131006 ?auto_131010 ) ) ( not ( = ?auto_131006 ?auto_131011 ) ) ( not ( = ?auto_131007 ?auto_131008 ) ) ( not ( = ?auto_131007 ?auto_131009 ) ) ( not ( = ?auto_131007 ?auto_131010 ) ) ( not ( = ?auto_131007 ?auto_131011 ) ) ( not ( = ?auto_131008 ?auto_131009 ) ) ( not ( = ?auto_131008 ?auto_131010 ) ) ( not ( = ?auto_131008 ?auto_131011 ) ) ( not ( = ?auto_131009 ?auto_131010 ) ) ( not ( = ?auto_131009 ?auto_131011 ) ) ( not ( = ?auto_131010 ?auto_131011 ) ) ( ON ?auto_131011 ?auto_131012 ) ( not ( = ?auto_131006 ?auto_131012 ) ) ( not ( = ?auto_131007 ?auto_131012 ) ) ( not ( = ?auto_131008 ?auto_131012 ) ) ( not ( = ?auto_131009 ?auto_131012 ) ) ( not ( = ?auto_131010 ?auto_131012 ) ) ( not ( = ?auto_131011 ?auto_131012 ) ) ( ON ?auto_131010 ?auto_131011 ) ( ON-TABLE ?auto_131013 ) ( ON ?auto_131012 ?auto_131013 ) ( not ( = ?auto_131013 ?auto_131012 ) ) ( not ( = ?auto_131013 ?auto_131011 ) ) ( not ( = ?auto_131013 ?auto_131010 ) ) ( not ( = ?auto_131006 ?auto_131013 ) ) ( not ( = ?auto_131007 ?auto_131013 ) ) ( not ( = ?auto_131008 ?auto_131013 ) ) ( not ( = ?auto_131009 ?auto_131013 ) ) ( ON ?auto_131009 ?auto_131010 ) ( CLEAR ?auto_131009 ) ( HOLDING ?auto_131008 ) ( CLEAR ?auto_131007 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131006 ?auto_131007 ?auto_131008 )
      ( MAKE-6PILE ?auto_131006 ?auto_131007 ?auto_131008 ?auto_131009 ?auto_131010 ?auto_131011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131014 - BLOCK
      ?auto_131015 - BLOCK
      ?auto_131016 - BLOCK
      ?auto_131017 - BLOCK
      ?auto_131018 - BLOCK
      ?auto_131019 - BLOCK
    )
    :vars
    (
      ?auto_131020 - BLOCK
      ?auto_131021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131014 ) ( ON ?auto_131015 ?auto_131014 ) ( not ( = ?auto_131014 ?auto_131015 ) ) ( not ( = ?auto_131014 ?auto_131016 ) ) ( not ( = ?auto_131014 ?auto_131017 ) ) ( not ( = ?auto_131014 ?auto_131018 ) ) ( not ( = ?auto_131014 ?auto_131019 ) ) ( not ( = ?auto_131015 ?auto_131016 ) ) ( not ( = ?auto_131015 ?auto_131017 ) ) ( not ( = ?auto_131015 ?auto_131018 ) ) ( not ( = ?auto_131015 ?auto_131019 ) ) ( not ( = ?auto_131016 ?auto_131017 ) ) ( not ( = ?auto_131016 ?auto_131018 ) ) ( not ( = ?auto_131016 ?auto_131019 ) ) ( not ( = ?auto_131017 ?auto_131018 ) ) ( not ( = ?auto_131017 ?auto_131019 ) ) ( not ( = ?auto_131018 ?auto_131019 ) ) ( ON ?auto_131019 ?auto_131020 ) ( not ( = ?auto_131014 ?auto_131020 ) ) ( not ( = ?auto_131015 ?auto_131020 ) ) ( not ( = ?auto_131016 ?auto_131020 ) ) ( not ( = ?auto_131017 ?auto_131020 ) ) ( not ( = ?auto_131018 ?auto_131020 ) ) ( not ( = ?auto_131019 ?auto_131020 ) ) ( ON ?auto_131018 ?auto_131019 ) ( ON-TABLE ?auto_131021 ) ( ON ?auto_131020 ?auto_131021 ) ( not ( = ?auto_131021 ?auto_131020 ) ) ( not ( = ?auto_131021 ?auto_131019 ) ) ( not ( = ?auto_131021 ?auto_131018 ) ) ( not ( = ?auto_131014 ?auto_131021 ) ) ( not ( = ?auto_131015 ?auto_131021 ) ) ( not ( = ?auto_131016 ?auto_131021 ) ) ( not ( = ?auto_131017 ?auto_131021 ) ) ( ON ?auto_131017 ?auto_131018 ) ( CLEAR ?auto_131015 ) ( ON ?auto_131016 ?auto_131017 ) ( CLEAR ?auto_131016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131021 ?auto_131020 ?auto_131019 ?auto_131018 ?auto_131017 )
      ( MAKE-6PILE ?auto_131014 ?auto_131015 ?auto_131016 ?auto_131017 ?auto_131018 ?auto_131019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131022 - BLOCK
      ?auto_131023 - BLOCK
      ?auto_131024 - BLOCK
      ?auto_131025 - BLOCK
      ?auto_131026 - BLOCK
      ?auto_131027 - BLOCK
    )
    :vars
    (
      ?auto_131029 - BLOCK
      ?auto_131028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131022 ) ( not ( = ?auto_131022 ?auto_131023 ) ) ( not ( = ?auto_131022 ?auto_131024 ) ) ( not ( = ?auto_131022 ?auto_131025 ) ) ( not ( = ?auto_131022 ?auto_131026 ) ) ( not ( = ?auto_131022 ?auto_131027 ) ) ( not ( = ?auto_131023 ?auto_131024 ) ) ( not ( = ?auto_131023 ?auto_131025 ) ) ( not ( = ?auto_131023 ?auto_131026 ) ) ( not ( = ?auto_131023 ?auto_131027 ) ) ( not ( = ?auto_131024 ?auto_131025 ) ) ( not ( = ?auto_131024 ?auto_131026 ) ) ( not ( = ?auto_131024 ?auto_131027 ) ) ( not ( = ?auto_131025 ?auto_131026 ) ) ( not ( = ?auto_131025 ?auto_131027 ) ) ( not ( = ?auto_131026 ?auto_131027 ) ) ( ON ?auto_131027 ?auto_131029 ) ( not ( = ?auto_131022 ?auto_131029 ) ) ( not ( = ?auto_131023 ?auto_131029 ) ) ( not ( = ?auto_131024 ?auto_131029 ) ) ( not ( = ?auto_131025 ?auto_131029 ) ) ( not ( = ?auto_131026 ?auto_131029 ) ) ( not ( = ?auto_131027 ?auto_131029 ) ) ( ON ?auto_131026 ?auto_131027 ) ( ON-TABLE ?auto_131028 ) ( ON ?auto_131029 ?auto_131028 ) ( not ( = ?auto_131028 ?auto_131029 ) ) ( not ( = ?auto_131028 ?auto_131027 ) ) ( not ( = ?auto_131028 ?auto_131026 ) ) ( not ( = ?auto_131022 ?auto_131028 ) ) ( not ( = ?auto_131023 ?auto_131028 ) ) ( not ( = ?auto_131024 ?auto_131028 ) ) ( not ( = ?auto_131025 ?auto_131028 ) ) ( ON ?auto_131025 ?auto_131026 ) ( ON ?auto_131024 ?auto_131025 ) ( CLEAR ?auto_131024 ) ( HOLDING ?auto_131023 ) ( CLEAR ?auto_131022 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131022 ?auto_131023 )
      ( MAKE-6PILE ?auto_131022 ?auto_131023 ?auto_131024 ?auto_131025 ?auto_131026 ?auto_131027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131030 - BLOCK
      ?auto_131031 - BLOCK
      ?auto_131032 - BLOCK
      ?auto_131033 - BLOCK
      ?auto_131034 - BLOCK
      ?auto_131035 - BLOCK
    )
    :vars
    (
      ?auto_131037 - BLOCK
      ?auto_131036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131030 ) ( not ( = ?auto_131030 ?auto_131031 ) ) ( not ( = ?auto_131030 ?auto_131032 ) ) ( not ( = ?auto_131030 ?auto_131033 ) ) ( not ( = ?auto_131030 ?auto_131034 ) ) ( not ( = ?auto_131030 ?auto_131035 ) ) ( not ( = ?auto_131031 ?auto_131032 ) ) ( not ( = ?auto_131031 ?auto_131033 ) ) ( not ( = ?auto_131031 ?auto_131034 ) ) ( not ( = ?auto_131031 ?auto_131035 ) ) ( not ( = ?auto_131032 ?auto_131033 ) ) ( not ( = ?auto_131032 ?auto_131034 ) ) ( not ( = ?auto_131032 ?auto_131035 ) ) ( not ( = ?auto_131033 ?auto_131034 ) ) ( not ( = ?auto_131033 ?auto_131035 ) ) ( not ( = ?auto_131034 ?auto_131035 ) ) ( ON ?auto_131035 ?auto_131037 ) ( not ( = ?auto_131030 ?auto_131037 ) ) ( not ( = ?auto_131031 ?auto_131037 ) ) ( not ( = ?auto_131032 ?auto_131037 ) ) ( not ( = ?auto_131033 ?auto_131037 ) ) ( not ( = ?auto_131034 ?auto_131037 ) ) ( not ( = ?auto_131035 ?auto_131037 ) ) ( ON ?auto_131034 ?auto_131035 ) ( ON-TABLE ?auto_131036 ) ( ON ?auto_131037 ?auto_131036 ) ( not ( = ?auto_131036 ?auto_131037 ) ) ( not ( = ?auto_131036 ?auto_131035 ) ) ( not ( = ?auto_131036 ?auto_131034 ) ) ( not ( = ?auto_131030 ?auto_131036 ) ) ( not ( = ?auto_131031 ?auto_131036 ) ) ( not ( = ?auto_131032 ?auto_131036 ) ) ( not ( = ?auto_131033 ?auto_131036 ) ) ( ON ?auto_131033 ?auto_131034 ) ( ON ?auto_131032 ?auto_131033 ) ( CLEAR ?auto_131030 ) ( ON ?auto_131031 ?auto_131032 ) ( CLEAR ?auto_131031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131036 ?auto_131037 ?auto_131035 ?auto_131034 ?auto_131033 ?auto_131032 )
      ( MAKE-6PILE ?auto_131030 ?auto_131031 ?auto_131032 ?auto_131033 ?auto_131034 ?auto_131035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131038 - BLOCK
      ?auto_131039 - BLOCK
      ?auto_131040 - BLOCK
      ?auto_131041 - BLOCK
      ?auto_131042 - BLOCK
      ?auto_131043 - BLOCK
    )
    :vars
    (
      ?auto_131045 - BLOCK
      ?auto_131044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131038 ?auto_131039 ) ) ( not ( = ?auto_131038 ?auto_131040 ) ) ( not ( = ?auto_131038 ?auto_131041 ) ) ( not ( = ?auto_131038 ?auto_131042 ) ) ( not ( = ?auto_131038 ?auto_131043 ) ) ( not ( = ?auto_131039 ?auto_131040 ) ) ( not ( = ?auto_131039 ?auto_131041 ) ) ( not ( = ?auto_131039 ?auto_131042 ) ) ( not ( = ?auto_131039 ?auto_131043 ) ) ( not ( = ?auto_131040 ?auto_131041 ) ) ( not ( = ?auto_131040 ?auto_131042 ) ) ( not ( = ?auto_131040 ?auto_131043 ) ) ( not ( = ?auto_131041 ?auto_131042 ) ) ( not ( = ?auto_131041 ?auto_131043 ) ) ( not ( = ?auto_131042 ?auto_131043 ) ) ( ON ?auto_131043 ?auto_131045 ) ( not ( = ?auto_131038 ?auto_131045 ) ) ( not ( = ?auto_131039 ?auto_131045 ) ) ( not ( = ?auto_131040 ?auto_131045 ) ) ( not ( = ?auto_131041 ?auto_131045 ) ) ( not ( = ?auto_131042 ?auto_131045 ) ) ( not ( = ?auto_131043 ?auto_131045 ) ) ( ON ?auto_131042 ?auto_131043 ) ( ON-TABLE ?auto_131044 ) ( ON ?auto_131045 ?auto_131044 ) ( not ( = ?auto_131044 ?auto_131045 ) ) ( not ( = ?auto_131044 ?auto_131043 ) ) ( not ( = ?auto_131044 ?auto_131042 ) ) ( not ( = ?auto_131038 ?auto_131044 ) ) ( not ( = ?auto_131039 ?auto_131044 ) ) ( not ( = ?auto_131040 ?auto_131044 ) ) ( not ( = ?auto_131041 ?auto_131044 ) ) ( ON ?auto_131041 ?auto_131042 ) ( ON ?auto_131040 ?auto_131041 ) ( ON ?auto_131039 ?auto_131040 ) ( CLEAR ?auto_131039 ) ( HOLDING ?auto_131038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131038 )
      ( MAKE-6PILE ?auto_131038 ?auto_131039 ?auto_131040 ?auto_131041 ?auto_131042 ?auto_131043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131046 - BLOCK
      ?auto_131047 - BLOCK
      ?auto_131048 - BLOCK
      ?auto_131049 - BLOCK
      ?auto_131050 - BLOCK
      ?auto_131051 - BLOCK
    )
    :vars
    (
      ?auto_131052 - BLOCK
      ?auto_131053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131046 ?auto_131047 ) ) ( not ( = ?auto_131046 ?auto_131048 ) ) ( not ( = ?auto_131046 ?auto_131049 ) ) ( not ( = ?auto_131046 ?auto_131050 ) ) ( not ( = ?auto_131046 ?auto_131051 ) ) ( not ( = ?auto_131047 ?auto_131048 ) ) ( not ( = ?auto_131047 ?auto_131049 ) ) ( not ( = ?auto_131047 ?auto_131050 ) ) ( not ( = ?auto_131047 ?auto_131051 ) ) ( not ( = ?auto_131048 ?auto_131049 ) ) ( not ( = ?auto_131048 ?auto_131050 ) ) ( not ( = ?auto_131048 ?auto_131051 ) ) ( not ( = ?auto_131049 ?auto_131050 ) ) ( not ( = ?auto_131049 ?auto_131051 ) ) ( not ( = ?auto_131050 ?auto_131051 ) ) ( ON ?auto_131051 ?auto_131052 ) ( not ( = ?auto_131046 ?auto_131052 ) ) ( not ( = ?auto_131047 ?auto_131052 ) ) ( not ( = ?auto_131048 ?auto_131052 ) ) ( not ( = ?auto_131049 ?auto_131052 ) ) ( not ( = ?auto_131050 ?auto_131052 ) ) ( not ( = ?auto_131051 ?auto_131052 ) ) ( ON ?auto_131050 ?auto_131051 ) ( ON-TABLE ?auto_131053 ) ( ON ?auto_131052 ?auto_131053 ) ( not ( = ?auto_131053 ?auto_131052 ) ) ( not ( = ?auto_131053 ?auto_131051 ) ) ( not ( = ?auto_131053 ?auto_131050 ) ) ( not ( = ?auto_131046 ?auto_131053 ) ) ( not ( = ?auto_131047 ?auto_131053 ) ) ( not ( = ?auto_131048 ?auto_131053 ) ) ( not ( = ?auto_131049 ?auto_131053 ) ) ( ON ?auto_131049 ?auto_131050 ) ( ON ?auto_131048 ?auto_131049 ) ( ON ?auto_131047 ?auto_131048 ) ( ON ?auto_131046 ?auto_131047 ) ( CLEAR ?auto_131046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131053 ?auto_131052 ?auto_131051 ?auto_131050 ?auto_131049 ?auto_131048 ?auto_131047 )
      ( MAKE-6PILE ?auto_131046 ?auto_131047 ?auto_131048 ?auto_131049 ?auto_131050 ?auto_131051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131060 - BLOCK
      ?auto_131061 - BLOCK
      ?auto_131062 - BLOCK
      ?auto_131063 - BLOCK
      ?auto_131064 - BLOCK
      ?auto_131065 - BLOCK
    )
    :vars
    (
      ?auto_131066 - BLOCK
      ?auto_131067 - BLOCK
      ?auto_131068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131060 ?auto_131061 ) ) ( not ( = ?auto_131060 ?auto_131062 ) ) ( not ( = ?auto_131060 ?auto_131063 ) ) ( not ( = ?auto_131060 ?auto_131064 ) ) ( not ( = ?auto_131060 ?auto_131065 ) ) ( not ( = ?auto_131061 ?auto_131062 ) ) ( not ( = ?auto_131061 ?auto_131063 ) ) ( not ( = ?auto_131061 ?auto_131064 ) ) ( not ( = ?auto_131061 ?auto_131065 ) ) ( not ( = ?auto_131062 ?auto_131063 ) ) ( not ( = ?auto_131062 ?auto_131064 ) ) ( not ( = ?auto_131062 ?auto_131065 ) ) ( not ( = ?auto_131063 ?auto_131064 ) ) ( not ( = ?auto_131063 ?auto_131065 ) ) ( not ( = ?auto_131064 ?auto_131065 ) ) ( ON ?auto_131065 ?auto_131066 ) ( not ( = ?auto_131060 ?auto_131066 ) ) ( not ( = ?auto_131061 ?auto_131066 ) ) ( not ( = ?auto_131062 ?auto_131066 ) ) ( not ( = ?auto_131063 ?auto_131066 ) ) ( not ( = ?auto_131064 ?auto_131066 ) ) ( not ( = ?auto_131065 ?auto_131066 ) ) ( ON ?auto_131064 ?auto_131065 ) ( ON-TABLE ?auto_131067 ) ( ON ?auto_131066 ?auto_131067 ) ( not ( = ?auto_131067 ?auto_131066 ) ) ( not ( = ?auto_131067 ?auto_131065 ) ) ( not ( = ?auto_131067 ?auto_131064 ) ) ( not ( = ?auto_131060 ?auto_131067 ) ) ( not ( = ?auto_131061 ?auto_131067 ) ) ( not ( = ?auto_131062 ?auto_131067 ) ) ( not ( = ?auto_131063 ?auto_131067 ) ) ( ON ?auto_131063 ?auto_131064 ) ( ON ?auto_131062 ?auto_131063 ) ( ON ?auto_131061 ?auto_131062 ) ( CLEAR ?auto_131061 ) ( ON ?auto_131060 ?auto_131068 ) ( CLEAR ?auto_131060 ) ( HAND-EMPTY ) ( not ( = ?auto_131060 ?auto_131068 ) ) ( not ( = ?auto_131061 ?auto_131068 ) ) ( not ( = ?auto_131062 ?auto_131068 ) ) ( not ( = ?auto_131063 ?auto_131068 ) ) ( not ( = ?auto_131064 ?auto_131068 ) ) ( not ( = ?auto_131065 ?auto_131068 ) ) ( not ( = ?auto_131066 ?auto_131068 ) ) ( not ( = ?auto_131067 ?auto_131068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131060 ?auto_131068 )
      ( MAKE-6PILE ?auto_131060 ?auto_131061 ?auto_131062 ?auto_131063 ?auto_131064 ?auto_131065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131069 - BLOCK
      ?auto_131070 - BLOCK
      ?auto_131071 - BLOCK
      ?auto_131072 - BLOCK
      ?auto_131073 - BLOCK
      ?auto_131074 - BLOCK
    )
    :vars
    (
      ?auto_131075 - BLOCK
      ?auto_131076 - BLOCK
      ?auto_131077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131069 ?auto_131070 ) ) ( not ( = ?auto_131069 ?auto_131071 ) ) ( not ( = ?auto_131069 ?auto_131072 ) ) ( not ( = ?auto_131069 ?auto_131073 ) ) ( not ( = ?auto_131069 ?auto_131074 ) ) ( not ( = ?auto_131070 ?auto_131071 ) ) ( not ( = ?auto_131070 ?auto_131072 ) ) ( not ( = ?auto_131070 ?auto_131073 ) ) ( not ( = ?auto_131070 ?auto_131074 ) ) ( not ( = ?auto_131071 ?auto_131072 ) ) ( not ( = ?auto_131071 ?auto_131073 ) ) ( not ( = ?auto_131071 ?auto_131074 ) ) ( not ( = ?auto_131072 ?auto_131073 ) ) ( not ( = ?auto_131072 ?auto_131074 ) ) ( not ( = ?auto_131073 ?auto_131074 ) ) ( ON ?auto_131074 ?auto_131075 ) ( not ( = ?auto_131069 ?auto_131075 ) ) ( not ( = ?auto_131070 ?auto_131075 ) ) ( not ( = ?auto_131071 ?auto_131075 ) ) ( not ( = ?auto_131072 ?auto_131075 ) ) ( not ( = ?auto_131073 ?auto_131075 ) ) ( not ( = ?auto_131074 ?auto_131075 ) ) ( ON ?auto_131073 ?auto_131074 ) ( ON-TABLE ?auto_131076 ) ( ON ?auto_131075 ?auto_131076 ) ( not ( = ?auto_131076 ?auto_131075 ) ) ( not ( = ?auto_131076 ?auto_131074 ) ) ( not ( = ?auto_131076 ?auto_131073 ) ) ( not ( = ?auto_131069 ?auto_131076 ) ) ( not ( = ?auto_131070 ?auto_131076 ) ) ( not ( = ?auto_131071 ?auto_131076 ) ) ( not ( = ?auto_131072 ?auto_131076 ) ) ( ON ?auto_131072 ?auto_131073 ) ( ON ?auto_131071 ?auto_131072 ) ( ON ?auto_131069 ?auto_131077 ) ( CLEAR ?auto_131069 ) ( not ( = ?auto_131069 ?auto_131077 ) ) ( not ( = ?auto_131070 ?auto_131077 ) ) ( not ( = ?auto_131071 ?auto_131077 ) ) ( not ( = ?auto_131072 ?auto_131077 ) ) ( not ( = ?auto_131073 ?auto_131077 ) ) ( not ( = ?auto_131074 ?auto_131077 ) ) ( not ( = ?auto_131075 ?auto_131077 ) ) ( not ( = ?auto_131076 ?auto_131077 ) ) ( HOLDING ?auto_131070 ) ( CLEAR ?auto_131071 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131076 ?auto_131075 ?auto_131074 ?auto_131073 ?auto_131072 ?auto_131071 ?auto_131070 )
      ( MAKE-6PILE ?auto_131069 ?auto_131070 ?auto_131071 ?auto_131072 ?auto_131073 ?auto_131074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131078 - BLOCK
      ?auto_131079 - BLOCK
      ?auto_131080 - BLOCK
      ?auto_131081 - BLOCK
      ?auto_131082 - BLOCK
      ?auto_131083 - BLOCK
    )
    :vars
    (
      ?auto_131086 - BLOCK
      ?auto_131085 - BLOCK
      ?auto_131084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131078 ?auto_131079 ) ) ( not ( = ?auto_131078 ?auto_131080 ) ) ( not ( = ?auto_131078 ?auto_131081 ) ) ( not ( = ?auto_131078 ?auto_131082 ) ) ( not ( = ?auto_131078 ?auto_131083 ) ) ( not ( = ?auto_131079 ?auto_131080 ) ) ( not ( = ?auto_131079 ?auto_131081 ) ) ( not ( = ?auto_131079 ?auto_131082 ) ) ( not ( = ?auto_131079 ?auto_131083 ) ) ( not ( = ?auto_131080 ?auto_131081 ) ) ( not ( = ?auto_131080 ?auto_131082 ) ) ( not ( = ?auto_131080 ?auto_131083 ) ) ( not ( = ?auto_131081 ?auto_131082 ) ) ( not ( = ?auto_131081 ?auto_131083 ) ) ( not ( = ?auto_131082 ?auto_131083 ) ) ( ON ?auto_131083 ?auto_131086 ) ( not ( = ?auto_131078 ?auto_131086 ) ) ( not ( = ?auto_131079 ?auto_131086 ) ) ( not ( = ?auto_131080 ?auto_131086 ) ) ( not ( = ?auto_131081 ?auto_131086 ) ) ( not ( = ?auto_131082 ?auto_131086 ) ) ( not ( = ?auto_131083 ?auto_131086 ) ) ( ON ?auto_131082 ?auto_131083 ) ( ON-TABLE ?auto_131085 ) ( ON ?auto_131086 ?auto_131085 ) ( not ( = ?auto_131085 ?auto_131086 ) ) ( not ( = ?auto_131085 ?auto_131083 ) ) ( not ( = ?auto_131085 ?auto_131082 ) ) ( not ( = ?auto_131078 ?auto_131085 ) ) ( not ( = ?auto_131079 ?auto_131085 ) ) ( not ( = ?auto_131080 ?auto_131085 ) ) ( not ( = ?auto_131081 ?auto_131085 ) ) ( ON ?auto_131081 ?auto_131082 ) ( ON ?auto_131080 ?auto_131081 ) ( ON ?auto_131078 ?auto_131084 ) ( not ( = ?auto_131078 ?auto_131084 ) ) ( not ( = ?auto_131079 ?auto_131084 ) ) ( not ( = ?auto_131080 ?auto_131084 ) ) ( not ( = ?auto_131081 ?auto_131084 ) ) ( not ( = ?auto_131082 ?auto_131084 ) ) ( not ( = ?auto_131083 ?auto_131084 ) ) ( not ( = ?auto_131086 ?auto_131084 ) ) ( not ( = ?auto_131085 ?auto_131084 ) ) ( CLEAR ?auto_131080 ) ( ON ?auto_131079 ?auto_131078 ) ( CLEAR ?auto_131079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131084 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131084 ?auto_131078 )
      ( MAKE-6PILE ?auto_131078 ?auto_131079 ?auto_131080 ?auto_131081 ?auto_131082 ?auto_131083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131087 - BLOCK
      ?auto_131088 - BLOCK
      ?auto_131089 - BLOCK
      ?auto_131090 - BLOCK
      ?auto_131091 - BLOCK
      ?auto_131092 - BLOCK
    )
    :vars
    (
      ?auto_131093 - BLOCK
      ?auto_131095 - BLOCK
      ?auto_131094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131087 ?auto_131088 ) ) ( not ( = ?auto_131087 ?auto_131089 ) ) ( not ( = ?auto_131087 ?auto_131090 ) ) ( not ( = ?auto_131087 ?auto_131091 ) ) ( not ( = ?auto_131087 ?auto_131092 ) ) ( not ( = ?auto_131088 ?auto_131089 ) ) ( not ( = ?auto_131088 ?auto_131090 ) ) ( not ( = ?auto_131088 ?auto_131091 ) ) ( not ( = ?auto_131088 ?auto_131092 ) ) ( not ( = ?auto_131089 ?auto_131090 ) ) ( not ( = ?auto_131089 ?auto_131091 ) ) ( not ( = ?auto_131089 ?auto_131092 ) ) ( not ( = ?auto_131090 ?auto_131091 ) ) ( not ( = ?auto_131090 ?auto_131092 ) ) ( not ( = ?auto_131091 ?auto_131092 ) ) ( ON ?auto_131092 ?auto_131093 ) ( not ( = ?auto_131087 ?auto_131093 ) ) ( not ( = ?auto_131088 ?auto_131093 ) ) ( not ( = ?auto_131089 ?auto_131093 ) ) ( not ( = ?auto_131090 ?auto_131093 ) ) ( not ( = ?auto_131091 ?auto_131093 ) ) ( not ( = ?auto_131092 ?auto_131093 ) ) ( ON ?auto_131091 ?auto_131092 ) ( ON-TABLE ?auto_131095 ) ( ON ?auto_131093 ?auto_131095 ) ( not ( = ?auto_131095 ?auto_131093 ) ) ( not ( = ?auto_131095 ?auto_131092 ) ) ( not ( = ?auto_131095 ?auto_131091 ) ) ( not ( = ?auto_131087 ?auto_131095 ) ) ( not ( = ?auto_131088 ?auto_131095 ) ) ( not ( = ?auto_131089 ?auto_131095 ) ) ( not ( = ?auto_131090 ?auto_131095 ) ) ( ON ?auto_131090 ?auto_131091 ) ( ON ?auto_131087 ?auto_131094 ) ( not ( = ?auto_131087 ?auto_131094 ) ) ( not ( = ?auto_131088 ?auto_131094 ) ) ( not ( = ?auto_131089 ?auto_131094 ) ) ( not ( = ?auto_131090 ?auto_131094 ) ) ( not ( = ?auto_131091 ?auto_131094 ) ) ( not ( = ?auto_131092 ?auto_131094 ) ) ( not ( = ?auto_131093 ?auto_131094 ) ) ( not ( = ?auto_131095 ?auto_131094 ) ) ( ON ?auto_131088 ?auto_131087 ) ( CLEAR ?auto_131088 ) ( ON-TABLE ?auto_131094 ) ( HOLDING ?auto_131089 ) ( CLEAR ?auto_131090 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131095 ?auto_131093 ?auto_131092 ?auto_131091 ?auto_131090 ?auto_131089 )
      ( MAKE-6PILE ?auto_131087 ?auto_131088 ?auto_131089 ?auto_131090 ?auto_131091 ?auto_131092 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131096 - BLOCK
      ?auto_131097 - BLOCK
      ?auto_131098 - BLOCK
      ?auto_131099 - BLOCK
      ?auto_131100 - BLOCK
      ?auto_131101 - BLOCK
    )
    :vars
    (
      ?auto_131104 - BLOCK
      ?auto_131102 - BLOCK
      ?auto_131103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131096 ?auto_131097 ) ) ( not ( = ?auto_131096 ?auto_131098 ) ) ( not ( = ?auto_131096 ?auto_131099 ) ) ( not ( = ?auto_131096 ?auto_131100 ) ) ( not ( = ?auto_131096 ?auto_131101 ) ) ( not ( = ?auto_131097 ?auto_131098 ) ) ( not ( = ?auto_131097 ?auto_131099 ) ) ( not ( = ?auto_131097 ?auto_131100 ) ) ( not ( = ?auto_131097 ?auto_131101 ) ) ( not ( = ?auto_131098 ?auto_131099 ) ) ( not ( = ?auto_131098 ?auto_131100 ) ) ( not ( = ?auto_131098 ?auto_131101 ) ) ( not ( = ?auto_131099 ?auto_131100 ) ) ( not ( = ?auto_131099 ?auto_131101 ) ) ( not ( = ?auto_131100 ?auto_131101 ) ) ( ON ?auto_131101 ?auto_131104 ) ( not ( = ?auto_131096 ?auto_131104 ) ) ( not ( = ?auto_131097 ?auto_131104 ) ) ( not ( = ?auto_131098 ?auto_131104 ) ) ( not ( = ?auto_131099 ?auto_131104 ) ) ( not ( = ?auto_131100 ?auto_131104 ) ) ( not ( = ?auto_131101 ?auto_131104 ) ) ( ON ?auto_131100 ?auto_131101 ) ( ON-TABLE ?auto_131102 ) ( ON ?auto_131104 ?auto_131102 ) ( not ( = ?auto_131102 ?auto_131104 ) ) ( not ( = ?auto_131102 ?auto_131101 ) ) ( not ( = ?auto_131102 ?auto_131100 ) ) ( not ( = ?auto_131096 ?auto_131102 ) ) ( not ( = ?auto_131097 ?auto_131102 ) ) ( not ( = ?auto_131098 ?auto_131102 ) ) ( not ( = ?auto_131099 ?auto_131102 ) ) ( ON ?auto_131099 ?auto_131100 ) ( ON ?auto_131096 ?auto_131103 ) ( not ( = ?auto_131096 ?auto_131103 ) ) ( not ( = ?auto_131097 ?auto_131103 ) ) ( not ( = ?auto_131098 ?auto_131103 ) ) ( not ( = ?auto_131099 ?auto_131103 ) ) ( not ( = ?auto_131100 ?auto_131103 ) ) ( not ( = ?auto_131101 ?auto_131103 ) ) ( not ( = ?auto_131104 ?auto_131103 ) ) ( not ( = ?auto_131102 ?auto_131103 ) ) ( ON ?auto_131097 ?auto_131096 ) ( ON-TABLE ?auto_131103 ) ( CLEAR ?auto_131099 ) ( ON ?auto_131098 ?auto_131097 ) ( CLEAR ?auto_131098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131103 ?auto_131096 ?auto_131097 )
      ( MAKE-6PILE ?auto_131096 ?auto_131097 ?auto_131098 ?auto_131099 ?auto_131100 ?auto_131101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131105 - BLOCK
      ?auto_131106 - BLOCK
      ?auto_131107 - BLOCK
      ?auto_131108 - BLOCK
      ?auto_131109 - BLOCK
      ?auto_131110 - BLOCK
    )
    :vars
    (
      ?auto_131112 - BLOCK
      ?auto_131113 - BLOCK
      ?auto_131111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131105 ?auto_131106 ) ) ( not ( = ?auto_131105 ?auto_131107 ) ) ( not ( = ?auto_131105 ?auto_131108 ) ) ( not ( = ?auto_131105 ?auto_131109 ) ) ( not ( = ?auto_131105 ?auto_131110 ) ) ( not ( = ?auto_131106 ?auto_131107 ) ) ( not ( = ?auto_131106 ?auto_131108 ) ) ( not ( = ?auto_131106 ?auto_131109 ) ) ( not ( = ?auto_131106 ?auto_131110 ) ) ( not ( = ?auto_131107 ?auto_131108 ) ) ( not ( = ?auto_131107 ?auto_131109 ) ) ( not ( = ?auto_131107 ?auto_131110 ) ) ( not ( = ?auto_131108 ?auto_131109 ) ) ( not ( = ?auto_131108 ?auto_131110 ) ) ( not ( = ?auto_131109 ?auto_131110 ) ) ( ON ?auto_131110 ?auto_131112 ) ( not ( = ?auto_131105 ?auto_131112 ) ) ( not ( = ?auto_131106 ?auto_131112 ) ) ( not ( = ?auto_131107 ?auto_131112 ) ) ( not ( = ?auto_131108 ?auto_131112 ) ) ( not ( = ?auto_131109 ?auto_131112 ) ) ( not ( = ?auto_131110 ?auto_131112 ) ) ( ON ?auto_131109 ?auto_131110 ) ( ON-TABLE ?auto_131113 ) ( ON ?auto_131112 ?auto_131113 ) ( not ( = ?auto_131113 ?auto_131112 ) ) ( not ( = ?auto_131113 ?auto_131110 ) ) ( not ( = ?auto_131113 ?auto_131109 ) ) ( not ( = ?auto_131105 ?auto_131113 ) ) ( not ( = ?auto_131106 ?auto_131113 ) ) ( not ( = ?auto_131107 ?auto_131113 ) ) ( not ( = ?auto_131108 ?auto_131113 ) ) ( ON ?auto_131105 ?auto_131111 ) ( not ( = ?auto_131105 ?auto_131111 ) ) ( not ( = ?auto_131106 ?auto_131111 ) ) ( not ( = ?auto_131107 ?auto_131111 ) ) ( not ( = ?auto_131108 ?auto_131111 ) ) ( not ( = ?auto_131109 ?auto_131111 ) ) ( not ( = ?auto_131110 ?auto_131111 ) ) ( not ( = ?auto_131112 ?auto_131111 ) ) ( not ( = ?auto_131113 ?auto_131111 ) ) ( ON ?auto_131106 ?auto_131105 ) ( ON-TABLE ?auto_131111 ) ( ON ?auto_131107 ?auto_131106 ) ( CLEAR ?auto_131107 ) ( HOLDING ?auto_131108 ) ( CLEAR ?auto_131109 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131113 ?auto_131112 ?auto_131110 ?auto_131109 ?auto_131108 )
      ( MAKE-6PILE ?auto_131105 ?auto_131106 ?auto_131107 ?auto_131108 ?auto_131109 ?auto_131110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131114 - BLOCK
      ?auto_131115 - BLOCK
      ?auto_131116 - BLOCK
      ?auto_131117 - BLOCK
      ?auto_131118 - BLOCK
      ?auto_131119 - BLOCK
    )
    :vars
    (
      ?auto_131122 - BLOCK
      ?auto_131121 - BLOCK
      ?auto_131120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131114 ?auto_131115 ) ) ( not ( = ?auto_131114 ?auto_131116 ) ) ( not ( = ?auto_131114 ?auto_131117 ) ) ( not ( = ?auto_131114 ?auto_131118 ) ) ( not ( = ?auto_131114 ?auto_131119 ) ) ( not ( = ?auto_131115 ?auto_131116 ) ) ( not ( = ?auto_131115 ?auto_131117 ) ) ( not ( = ?auto_131115 ?auto_131118 ) ) ( not ( = ?auto_131115 ?auto_131119 ) ) ( not ( = ?auto_131116 ?auto_131117 ) ) ( not ( = ?auto_131116 ?auto_131118 ) ) ( not ( = ?auto_131116 ?auto_131119 ) ) ( not ( = ?auto_131117 ?auto_131118 ) ) ( not ( = ?auto_131117 ?auto_131119 ) ) ( not ( = ?auto_131118 ?auto_131119 ) ) ( ON ?auto_131119 ?auto_131122 ) ( not ( = ?auto_131114 ?auto_131122 ) ) ( not ( = ?auto_131115 ?auto_131122 ) ) ( not ( = ?auto_131116 ?auto_131122 ) ) ( not ( = ?auto_131117 ?auto_131122 ) ) ( not ( = ?auto_131118 ?auto_131122 ) ) ( not ( = ?auto_131119 ?auto_131122 ) ) ( ON ?auto_131118 ?auto_131119 ) ( ON-TABLE ?auto_131121 ) ( ON ?auto_131122 ?auto_131121 ) ( not ( = ?auto_131121 ?auto_131122 ) ) ( not ( = ?auto_131121 ?auto_131119 ) ) ( not ( = ?auto_131121 ?auto_131118 ) ) ( not ( = ?auto_131114 ?auto_131121 ) ) ( not ( = ?auto_131115 ?auto_131121 ) ) ( not ( = ?auto_131116 ?auto_131121 ) ) ( not ( = ?auto_131117 ?auto_131121 ) ) ( ON ?auto_131114 ?auto_131120 ) ( not ( = ?auto_131114 ?auto_131120 ) ) ( not ( = ?auto_131115 ?auto_131120 ) ) ( not ( = ?auto_131116 ?auto_131120 ) ) ( not ( = ?auto_131117 ?auto_131120 ) ) ( not ( = ?auto_131118 ?auto_131120 ) ) ( not ( = ?auto_131119 ?auto_131120 ) ) ( not ( = ?auto_131122 ?auto_131120 ) ) ( not ( = ?auto_131121 ?auto_131120 ) ) ( ON ?auto_131115 ?auto_131114 ) ( ON-TABLE ?auto_131120 ) ( ON ?auto_131116 ?auto_131115 ) ( CLEAR ?auto_131118 ) ( ON ?auto_131117 ?auto_131116 ) ( CLEAR ?auto_131117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131120 ?auto_131114 ?auto_131115 ?auto_131116 )
      ( MAKE-6PILE ?auto_131114 ?auto_131115 ?auto_131116 ?auto_131117 ?auto_131118 ?auto_131119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131123 - BLOCK
      ?auto_131124 - BLOCK
      ?auto_131125 - BLOCK
      ?auto_131126 - BLOCK
      ?auto_131127 - BLOCK
      ?auto_131128 - BLOCK
    )
    :vars
    (
      ?auto_131129 - BLOCK
      ?auto_131131 - BLOCK
      ?auto_131130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131123 ?auto_131124 ) ) ( not ( = ?auto_131123 ?auto_131125 ) ) ( not ( = ?auto_131123 ?auto_131126 ) ) ( not ( = ?auto_131123 ?auto_131127 ) ) ( not ( = ?auto_131123 ?auto_131128 ) ) ( not ( = ?auto_131124 ?auto_131125 ) ) ( not ( = ?auto_131124 ?auto_131126 ) ) ( not ( = ?auto_131124 ?auto_131127 ) ) ( not ( = ?auto_131124 ?auto_131128 ) ) ( not ( = ?auto_131125 ?auto_131126 ) ) ( not ( = ?auto_131125 ?auto_131127 ) ) ( not ( = ?auto_131125 ?auto_131128 ) ) ( not ( = ?auto_131126 ?auto_131127 ) ) ( not ( = ?auto_131126 ?auto_131128 ) ) ( not ( = ?auto_131127 ?auto_131128 ) ) ( ON ?auto_131128 ?auto_131129 ) ( not ( = ?auto_131123 ?auto_131129 ) ) ( not ( = ?auto_131124 ?auto_131129 ) ) ( not ( = ?auto_131125 ?auto_131129 ) ) ( not ( = ?auto_131126 ?auto_131129 ) ) ( not ( = ?auto_131127 ?auto_131129 ) ) ( not ( = ?auto_131128 ?auto_131129 ) ) ( ON-TABLE ?auto_131131 ) ( ON ?auto_131129 ?auto_131131 ) ( not ( = ?auto_131131 ?auto_131129 ) ) ( not ( = ?auto_131131 ?auto_131128 ) ) ( not ( = ?auto_131131 ?auto_131127 ) ) ( not ( = ?auto_131123 ?auto_131131 ) ) ( not ( = ?auto_131124 ?auto_131131 ) ) ( not ( = ?auto_131125 ?auto_131131 ) ) ( not ( = ?auto_131126 ?auto_131131 ) ) ( ON ?auto_131123 ?auto_131130 ) ( not ( = ?auto_131123 ?auto_131130 ) ) ( not ( = ?auto_131124 ?auto_131130 ) ) ( not ( = ?auto_131125 ?auto_131130 ) ) ( not ( = ?auto_131126 ?auto_131130 ) ) ( not ( = ?auto_131127 ?auto_131130 ) ) ( not ( = ?auto_131128 ?auto_131130 ) ) ( not ( = ?auto_131129 ?auto_131130 ) ) ( not ( = ?auto_131131 ?auto_131130 ) ) ( ON ?auto_131124 ?auto_131123 ) ( ON-TABLE ?auto_131130 ) ( ON ?auto_131125 ?auto_131124 ) ( ON ?auto_131126 ?auto_131125 ) ( CLEAR ?auto_131126 ) ( HOLDING ?auto_131127 ) ( CLEAR ?auto_131128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131131 ?auto_131129 ?auto_131128 ?auto_131127 )
      ( MAKE-6PILE ?auto_131123 ?auto_131124 ?auto_131125 ?auto_131126 ?auto_131127 ?auto_131128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131132 - BLOCK
      ?auto_131133 - BLOCK
      ?auto_131134 - BLOCK
      ?auto_131135 - BLOCK
      ?auto_131136 - BLOCK
      ?auto_131137 - BLOCK
    )
    :vars
    (
      ?auto_131138 - BLOCK
      ?auto_131140 - BLOCK
      ?auto_131139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131132 ?auto_131133 ) ) ( not ( = ?auto_131132 ?auto_131134 ) ) ( not ( = ?auto_131132 ?auto_131135 ) ) ( not ( = ?auto_131132 ?auto_131136 ) ) ( not ( = ?auto_131132 ?auto_131137 ) ) ( not ( = ?auto_131133 ?auto_131134 ) ) ( not ( = ?auto_131133 ?auto_131135 ) ) ( not ( = ?auto_131133 ?auto_131136 ) ) ( not ( = ?auto_131133 ?auto_131137 ) ) ( not ( = ?auto_131134 ?auto_131135 ) ) ( not ( = ?auto_131134 ?auto_131136 ) ) ( not ( = ?auto_131134 ?auto_131137 ) ) ( not ( = ?auto_131135 ?auto_131136 ) ) ( not ( = ?auto_131135 ?auto_131137 ) ) ( not ( = ?auto_131136 ?auto_131137 ) ) ( ON ?auto_131137 ?auto_131138 ) ( not ( = ?auto_131132 ?auto_131138 ) ) ( not ( = ?auto_131133 ?auto_131138 ) ) ( not ( = ?auto_131134 ?auto_131138 ) ) ( not ( = ?auto_131135 ?auto_131138 ) ) ( not ( = ?auto_131136 ?auto_131138 ) ) ( not ( = ?auto_131137 ?auto_131138 ) ) ( ON-TABLE ?auto_131140 ) ( ON ?auto_131138 ?auto_131140 ) ( not ( = ?auto_131140 ?auto_131138 ) ) ( not ( = ?auto_131140 ?auto_131137 ) ) ( not ( = ?auto_131140 ?auto_131136 ) ) ( not ( = ?auto_131132 ?auto_131140 ) ) ( not ( = ?auto_131133 ?auto_131140 ) ) ( not ( = ?auto_131134 ?auto_131140 ) ) ( not ( = ?auto_131135 ?auto_131140 ) ) ( ON ?auto_131132 ?auto_131139 ) ( not ( = ?auto_131132 ?auto_131139 ) ) ( not ( = ?auto_131133 ?auto_131139 ) ) ( not ( = ?auto_131134 ?auto_131139 ) ) ( not ( = ?auto_131135 ?auto_131139 ) ) ( not ( = ?auto_131136 ?auto_131139 ) ) ( not ( = ?auto_131137 ?auto_131139 ) ) ( not ( = ?auto_131138 ?auto_131139 ) ) ( not ( = ?auto_131140 ?auto_131139 ) ) ( ON ?auto_131133 ?auto_131132 ) ( ON-TABLE ?auto_131139 ) ( ON ?auto_131134 ?auto_131133 ) ( ON ?auto_131135 ?auto_131134 ) ( CLEAR ?auto_131137 ) ( ON ?auto_131136 ?auto_131135 ) ( CLEAR ?auto_131136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131139 ?auto_131132 ?auto_131133 ?auto_131134 ?auto_131135 )
      ( MAKE-6PILE ?auto_131132 ?auto_131133 ?auto_131134 ?auto_131135 ?auto_131136 ?auto_131137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131141 - BLOCK
      ?auto_131142 - BLOCK
      ?auto_131143 - BLOCK
      ?auto_131144 - BLOCK
      ?auto_131145 - BLOCK
      ?auto_131146 - BLOCK
    )
    :vars
    (
      ?auto_131149 - BLOCK
      ?auto_131148 - BLOCK
      ?auto_131147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131141 ?auto_131142 ) ) ( not ( = ?auto_131141 ?auto_131143 ) ) ( not ( = ?auto_131141 ?auto_131144 ) ) ( not ( = ?auto_131141 ?auto_131145 ) ) ( not ( = ?auto_131141 ?auto_131146 ) ) ( not ( = ?auto_131142 ?auto_131143 ) ) ( not ( = ?auto_131142 ?auto_131144 ) ) ( not ( = ?auto_131142 ?auto_131145 ) ) ( not ( = ?auto_131142 ?auto_131146 ) ) ( not ( = ?auto_131143 ?auto_131144 ) ) ( not ( = ?auto_131143 ?auto_131145 ) ) ( not ( = ?auto_131143 ?auto_131146 ) ) ( not ( = ?auto_131144 ?auto_131145 ) ) ( not ( = ?auto_131144 ?auto_131146 ) ) ( not ( = ?auto_131145 ?auto_131146 ) ) ( not ( = ?auto_131141 ?auto_131149 ) ) ( not ( = ?auto_131142 ?auto_131149 ) ) ( not ( = ?auto_131143 ?auto_131149 ) ) ( not ( = ?auto_131144 ?auto_131149 ) ) ( not ( = ?auto_131145 ?auto_131149 ) ) ( not ( = ?auto_131146 ?auto_131149 ) ) ( ON-TABLE ?auto_131148 ) ( ON ?auto_131149 ?auto_131148 ) ( not ( = ?auto_131148 ?auto_131149 ) ) ( not ( = ?auto_131148 ?auto_131146 ) ) ( not ( = ?auto_131148 ?auto_131145 ) ) ( not ( = ?auto_131141 ?auto_131148 ) ) ( not ( = ?auto_131142 ?auto_131148 ) ) ( not ( = ?auto_131143 ?auto_131148 ) ) ( not ( = ?auto_131144 ?auto_131148 ) ) ( ON ?auto_131141 ?auto_131147 ) ( not ( = ?auto_131141 ?auto_131147 ) ) ( not ( = ?auto_131142 ?auto_131147 ) ) ( not ( = ?auto_131143 ?auto_131147 ) ) ( not ( = ?auto_131144 ?auto_131147 ) ) ( not ( = ?auto_131145 ?auto_131147 ) ) ( not ( = ?auto_131146 ?auto_131147 ) ) ( not ( = ?auto_131149 ?auto_131147 ) ) ( not ( = ?auto_131148 ?auto_131147 ) ) ( ON ?auto_131142 ?auto_131141 ) ( ON-TABLE ?auto_131147 ) ( ON ?auto_131143 ?auto_131142 ) ( ON ?auto_131144 ?auto_131143 ) ( ON ?auto_131145 ?auto_131144 ) ( CLEAR ?auto_131145 ) ( HOLDING ?auto_131146 ) ( CLEAR ?auto_131149 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131148 ?auto_131149 ?auto_131146 )
      ( MAKE-6PILE ?auto_131141 ?auto_131142 ?auto_131143 ?auto_131144 ?auto_131145 ?auto_131146 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131150 - BLOCK
      ?auto_131151 - BLOCK
      ?auto_131152 - BLOCK
      ?auto_131153 - BLOCK
      ?auto_131154 - BLOCK
      ?auto_131155 - BLOCK
    )
    :vars
    (
      ?auto_131156 - BLOCK
      ?auto_131158 - BLOCK
      ?auto_131157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131150 ?auto_131151 ) ) ( not ( = ?auto_131150 ?auto_131152 ) ) ( not ( = ?auto_131150 ?auto_131153 ) ) ( not ( = ?auto_131150 ?auto_131154 ) ) ( not ( = ?auto_131150 ?auto_131155 ) ) ( not ( = ?auto_131151 ?auto_131152 ) ) ( not ( = ?auto_131151 ?auto_131153 ) ) ( not ( = ?auto_131151 ?auto_131154 ) ) ( not ( = ?auto_131151 ?auto_131155 ) ) ( not ( = ?auto_131152 ?auto_131153 ) ) ( not ( = ?auto_131152 ?auto_131154 ) ) ( not ( = ?auto_131152 ?auto_131155 ) ) ( not ( = ?auto_131153 ?auto_131154 ) ) ( not ( = ?auto_131153 ?auto_131155 ) ) ( not ( = ?auto_131154 ?auto_131155 ) ) ( not ( = ?auto_131150 ?auto_131156 ) ) ( not ( = ?auto_131151 ?auto_131156 ) ) ( not ( = ?auto_131152 ?auto_131156 ) ) ( not ( = ?auto_131153 ?auto_131156 ) ) ( not ( = ?auto_131154 ?auto_131156 ) ) ( not ( = ?auto_131155 ?auto_131156 ) ) ( ON-TABLE ?auto_131158 ) ( ON ?auto_131156 ?auto_131158 ) ( not ( = ?auto_131158 ?auto_131156 ) ) ( not ( = ?auto_131158 ?auto_131155 ) ) ( not ( = ?auto_131158 ?auto_131154 ) ) ( not ( = ?auto_131150 ?auto_131158 ) ) ( not ( = ?auto_131151 ?auto_131158 ) ) ( not ( = ?auto_131152 ?auto_131158 ) ) ( not ( = ?auto_131153 ?auto_131158 ) ) ( ON ?auto_131150 ?auto_131157 ) ( not ( = ?auto_131150 ?auto_131157 ) ) ( not ( = ?auto_131151 ?auto_131157 ) ) ( not ( = ?auto_131152 ?auto_131157 ) ) ( not ( = ?auto_131153 ?auto_131157 ) ) ( not ( = ?auto_131154 ?auto_131157 ) ) ( not ( = ?auto_131155 ?auto_131157 ) ) ( not ( = ?auto_131156 ?auto_131157 ) ) ( not ( = ?auto_131158 ?auto_131157 ) ) ( ON ?auto_131151 ?auto_131150 ) ( ON-TABLE ?auto_131157 ) ( ON ?auto_131152 ?auto_131151 ) ( ON ?auto_131153 ?auto_131152 ) ( ON ?auto_131154 ?auto_131153 ) ( CLEAR ?auto_131156 ) ( ON ?auto_131155 ?auto_131154 ) ( CLEAR ?auto_131155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131157 ?auto_131150 ?auto_131151 ?auto_131152 ?auto_131153 ?auto_131154 )
      ( MAKE-6PILE ?auto_131150 ?auto_131151 ?auto_131152 ?auto_131153 ?auto_131154 ?auto_131155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131159 - BLOCK
      ?auto_131160 - BLOCK
      ?auto_131161 - BLOCK
      ?auto_131162 - BLOCK
      ?auto_131163 - BLOCK
      ?auto_131164 - BLOCK
    )
    :vars
    (
      ?auto_131166 - BLOCK
      ?auto_131167 - BLOCK
      ?auto_131165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131159 ?auto_131160 ) ) ( not ( = ?auto_131159 ?auto_131161 ) ) ( not ( = ?auto_131159 ?auto_131162 ) ) ( not ( = ?auto_131159 ?auto_131163 ) ) ( not ( = ?auto_131159 ?auto_131164 ) ) ( not ( = ?auto_131160 ?auto_131161 ) ) ( not ( = ?auto_131160 ?auto_131162 ) ) ( not ( = ?auto_131160 ?auto_131163 ) ) ( not ( = ?auto_131160 ?auto_131164 ) ) ( not ( = ?auto_131161 ?auto_131162 ) ) ( not ( = ?auto_131161 ?auto_131163 ) ) ( not ( = ?auto_131161 ?auto_131164 ) ) ( not ( = ?auto_131162 ?auto_131163 ) ) ( not ( = ?auto_131162 ?auto_131164 ) ) ( not ( = ?auto_131163 ?auto_131164 ) ) ( not ( = ?auto_131159 ?auto_131166 ) ) ( not ( = ?auto_131160 ?auto_131166 ) ) ( not ( = ?auto_131161 ?auto_131166 ) ) ( not ( = ?auto_131162 ?auto_131166 ) ) ( not ( = ?auto_131163 ?auto_131166 ) ) ( not ( = ?auto_131164 ?auto_131166 ) ) ( ON-TABLE ?auto_131167 ) ( not ( = ?auto_131167 ?auto_131166 ) ) ( not ( = ?auto_131167 ?auto_131164 ) ) ( not ( = ?auto_131167 ?auto_131163 ) ) ( not ( = ?auto_131159 ?auto_131167 ) ) ( not ( = ?auto_131160 ?auto_131167 ) ) ( not ( = ?auto_131161 ?auto_131167 ) ) ( not ( = ?auto_131162 ?auto_131167 ) ) ( ON ?auto_131159 ?auto_131165 ) ( not ( = ?auto_131159 ?auto_131165 ) ) ( not ( = ?auto_131160 ?auto_131165 ) ) ( not ( = ?auto_131161 ?auto_131165 ) ) ( not ( = ?auto_131162 ?auto_131165 ) ) ( not ( = ?auto_131163 ?auto_131165 ) ) ( not ( = ?auto_131164 ?auto_131165 ) ) ( not ( = ?auto_131166 ?auto_131165 ) ) ( not ( = ?auto_131167 ?auto_131165 ) ) ( ON ?auto_131160 ?auto_131159 ) ( ON-TABLE ?auto_131165 ) ( ON ?auto_131161 ?auto_131160 ) ( ON ?auto_131162 ?auto_131161 ) ( ON ?auto_131163 ?auto_131162 ) ( ON ?auto_131164 ?auto_131163 ) ( CLEAR ?auto_131164 ) ( HOLDING ?auto_131166 ) ( CLEAR ?auto_131167 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131167 ?auto_131166 )
      ( MAKE-6PILE ?auto_131159 ?auto_131160 ?auto_131161 ?auto_131162 ?auto_131163 ?auto_131164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131168 - BLOCK
      ?auto_131169 - BLOCK
      ?auto_131170 - BLOCK
      ?auto_131171 - BLOCK
      ?auto_131172 - BLOCK
      ?auto_131173 - BLOCK
    )
    :vars
    (
      ?auto_131176 - BLOCK
      ?auto_131175 - BLOCK
      ?auto_131174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131168 ?auto_131169 ) ) ( not ( = ?auto_131168 ?auto_131170 ) ) ( not ( = ?auto_131168 ?auto_131171 ) ) ( not ( = ?auto_131168 ?auto_131172 ) ) ( not ( = ?auto_131168 ?auto_131173 ) ) ( not ( = ?auto_131169 ?auto_131170 ) ) ( not ( = ?auto_131169 ?auto_131171 ) ) ( not ( = ?auto_131169 ?auto_131172 ) ) ( not ( = ?auto_131169 ?auto_131173 ) ) ( not ( = ?auto_131170 ?auto_131171 ) ) ( not ( = ?auto_131170 ?auto_131172 ) ) ( not ( = ?auto_131170 ?auto_131173 ) ) ( not ( = ?auto_131171 ?auto_131172 ) ) ( not ( = ?auto_131171 ?auto_131173 ) ) ( not ( = ?auto_131172 ?auto_131173 ) ) ( not ( = ?auto_131168 ?auto_131176 ) ) ( not ( = ?auto_131169 ?auto_131176 ) ) ( not ( = ?auto_131170 ?auto_131176 ) ) ( not ( = ?auto_131171 ?auto_131176 ) ) ( not ( = ?auto_131172 ?auto_131176 ) ) ( not ( = ?auto_131173 ?auto_131176 ) ) ( ON-TABLE ?auto_131175 ) ( not ( = ?auto_131175 ?auto_131176 ) ) ( not ( = ?auto_131175 ?auto_131173 ) ) ( not ( = ?auto_131175 ?auto_131172 ) ) ( not ( = ?auto_131168 ?auto_131175 ) ) ( not ( = ?auto_131169 ?auto_131175 ) ) ( not ( = ?auto_131170 ?auto_131175 ) ) ( not ( = ?auto_131171 ?auto_131175 ) ) ( ON ?auto_131168 ?auto_131174 ) ( not ( = ?auto_131168 ?auto_131174 ) ) ( not ( = ?auto_131169 ?auto_131174 ) ) ( not ( = ?auto_131170 ?auto_131174 ) ) ( not ( = ?auto_131171 ?auto_131174 ) ) ( not ( = ?auto_131172 ?auto_131174 ) ) ( not ( = ?auto_131173 ?auto_131174 ) ) ( not ( = ?auto_131176 ?auto_131174 ) ) ( not ( = ?auto_131175 ?auto_131174 ) ) ( ON ?auto_131169 ?auto_131168 ) ( ON-TABLE ?auto_131174 ) ( ON ?auto_131170 ?auto_131169 ) ( ON ?auto_131171 ?auto_131170 ) ( ON ?auto_131172 ?auto_131171 ) ( ON ?auto_131173 ?auto_131172 ) ( CLEAR ?auto_131175 ) ( ON ?auto_131176 ?auto_131173 ) ( CLEAR ?auto_131176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131174 ?auto_131168 ?auto_131169 ?auto_131170 ?auto_131171 ?auto_131172 ?auto_131173 )
      ( MAKE-6PILE ?auto_131168 ?auto_131169 ?auto_131170 ?auto_131171 ?auto_131172 ?auto_131173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131177 - BLOCK
      ?auto_131178 - BLOCK
      ?auto_131179 - BLOCK
      ?auto_131180 - BLOCK
      ?auto_131181 - BLOCK
      ?auto_131182 - BLOCK
    )
    :vars
    (
      ?auto_131183 - BLOCK
      ?auto_131184 - BLOCK
      ?auto_131185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131177 ?auto_131178 ) ) ( not ( = ?auto_131177 ?auto_131179 ) ) ( not ( = ?auto_131177 ?auto_131180 ) ) ( not ( = ?auto_131177 ?auto_131181 ) ) ( not ( = ?auto_131177 ?auto_131182 ) ) ( not ( = ?auto_131178 ?auto_131179 ) ) ( not ( = ?auto_131178 ?auto_131180 ) ) ( not ( = ?auto_131178 ?auto_131181 ) ) ( not ( = ?auto_131178 ?auto_131182 ) ) ( not ( = ?auto_131179 ?auto_131180 ) ) ( not ( = ?auto_131179 ?auto_131181 ) ) ( not ( = ?auto_131179 ?auto_131182 ) ) ( not ( = ?auto_131180 ?auto_131181 ) ) ( not ( = ?auto_131180 ?auto_131182 ) ) ( not ( = ?auto_131181 ?auto_131182 ) ) ( not ( = ?auto_131177 ?auto_131183 ) ) ( not ( = ?auto_131178 ?auto_131183 ) ) ( not ( = ?auto_131179 ?auto_131183 ) ) ( not ( = ?auto_131180 ?auto_131183 ) ) ( not ( = ?auto_131181 ?auto_131183 ) ) ( not ( = ?auto_131182 ?auto_131183 ) ) ( not ( = ?auto_131184 ?auto_131183 ) ) ( not ( = ?auto_131184 ?auto_131182 ) ) ( not ( = ?auto_131184 ?auto_131181 ) ) ( not ( = ?auto_131177 ?auto_131184 ) ) ( not ( = ?auto_131178 ?auto_131184 ) ) ( not ( = ?auto_131179 ?auto_131184 ) ) ( not ( = ?auto_131180 ?auto_131184 ) ) ( ON ?auto_131177 ?auto_131185 ) ( not ( = ?auto_131177 ?auto_131185 ) ) ( not ( = ?auto_131178 ?auto_131185 ) ) ( not ( = ?auto_131179 ?auto_131185 ) ) ( not ( = ?auto_131180 ?auto_131185 ) ) ( not ( = ?auto_131181 ?auto_131185 ) ) ( not ( = ?auto_131182 ?auto_131185 ) ) ( not ( = ?auto_131183 ?auto_131185 ) ) ( not ( = ?auto_131184 ?auto_131185 ) ) ( ON ?auto_131178 ?auto_131177 ) ( ON-TABLE ?auto_131185 ) ( ON ?auto_131179 ?auto_131178 ) ( ON ?auto_131180 ?auto_131179 ) ( ON ?auto_131181 ?auto_131180 ) ( ON ?auto_131182 ?auto_131181 ) ( ON ?auto_131183 ?auto_131182 ) ( CLEAR ?auto_131183 ) ( HOLDING ?auto_131184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131184 )
      ( MAKE-6PILE ?auto_131177 ?auto_131178 ?auto_131179 ?auto_131180 ?auto_131181 ?auto_131182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131186 - BLOCK
      ?auto_131187 - BLOCK
      ?auto_131188 - BLOCK
      ?auto_131189 - BLOCK
      ?auto_131190 - BLOCK
      ?auto_131191 - BLOCK
    )
    :vars
    (
      ?auto_131192 - BLOCK
      ?auto_131194 - BLOCK
      ?auto_131193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131186 ?auto_131187 ) ) ( not ( = ?auto_131186 ?auto_131188 ) ) ( not ( = ?auto_131186 ?auto_131189 ) ) ( not ( = ?auto_131186 ?auto_131190 ) ) ( not ( = ?auto_131186 ?auto_131191 ) ) ( not ( = ?auto_131187 ?auto_131188 ) ) ( not ( = ?auto_131187 ?auto_131189 ) ) ( not ( = ?auto_131187 ?auto_131190 ) ) ( not ( = ?auto_131187 ?auto_131191 ) ) ( not ( = ?auto_131188 ?auto_131189 ) ) ( not ( = ?auto_131188 ?auto_131190 ) ) ( not ( = ?auto_131188 ?auto_131191 ) ) ( not ( = ?auto_131189 ?auto_131190 ) ) ( not ( = ?auto_131189 ?auto_131191 ) ) ( not ( = ?auto_131190 ?auto_131191 ) ) ( not ( = ?auto_131186 ?auto_131192 ) ) ( not ( = ?auto_131187 ?auto_131192 ) ) ( not ( = ?auto_131188 ?auto_131192 ) ) ( not ( = ?auto_131189 ?auto_131192 ) ) ( not ( = ?auto_131190 ?auto_131192 ) ) ( not ( = ?auto_131191 ?auto_131192 ) ) ( not ( = ?auto_131194 ?auto_131192 ) ) ( not ( = ?auto_131194 ?auto_131191 ) ) ( not ( = ?auto_131194 ?auto_131190 ) ) ( not ( = ?auto_131186 ?auto_131194 ) ) ( not ( = ?auto_131187 ?auto_131194 ) ) ( not ( = ?auto_131188 ?auto_131194 ) ) ( not ( = ?auto_131189 ?auto_131194 ) ) ( ON ?auto_131186 ?auto_131193 ) ( not ( = ?auto_131186 ?auto_131193 ) ) ( not ( = ?auto_131187 ?auto_131193 ) ) ( not ( = ?auto_131188 ?auto_131193 ) ) ( not ( = ?auto_131189 ?auto_131193 ) ) ( not ( = ?auto_131190 ?auto_131193 ) ) ( not ( = ?auto_131191 ?auto_131193 ) ) ( not ( = ?auto_131192 ?auto_131193 ) ) ( not ( = ?auto_131194 ?auto_131193 ) ) ( ON ?auto_131187 ?auto_131186 ) ( ON-TABLE ?auto_131193 ) ( ON ?auto_131188 ?auto_131187 ) ( ON ?auto_131189 ?auto_131188 ) ( ON ?auto_131190 ?auto_131189 ) ( ON ?auto_131191 ?auto_131190 ) ( ON ?auto_131192 ?auto_131191 ) ( ON ?auto_131194 ?auto_131192 ) ( CLEAR ?auto_131194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131193 ?auto_131186 ?auto_131187 ?auto_131188 ?auto_131189 ?auto_131190 ?auto_131191 ?auto_131192 )
      ( MAKE-6PILE ?auto_131186 ?auto_131187 ?auto_131188 ?auto_131189 ?auto_131190 ?auto_131191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131206 - BLOCK
    )
    :vars
    (
      ?auto_131209 - BLOCK
      ?auto_131207 - BLOCK
      ?auto_131208 - BLOCK
      ?auto_131213 - BLOCK
      ?auto_131211 - BLOCK
      ?auto_131212 - BLOCK
      ?auto_131210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131209 ?auto_131206 ) ( ON-TABLE ?auto_131206 ) ( not ( = ?auto_131206 ?auto_131209 ) ) ( not ( = ?auto_131206 ?auto_131207 ) ) ( not ( = ?auto_131206 ?auto_131208 ) ) ( not ( = ?auto_131209 ?auto_131207 ) ) ( not ( = ?auto_131209 ?auto_131208 ) ) ( not ( = ?auto_131207 ?auto_131208 ) ) ( ON ?auto_131207 ?auto_131209 ) ( CLEAR ?auto_131207 ) ( HOLDING ?auto_131208 ) ( CLEAR ?auto_131213 ) ( ON-TABLE ?auto_131211 ) ( ON ?auto_131212 ?auto_131211 ) ( ON ?auto_131210 ?auto_131212 ) ( ON ?auto_131213 ?auto_131210 ) ( not ( = ?auto_131211 ?auto_131212 ) ) ( not ( = ?auto_131211 ?auto_131210 ) ) ( not ( = ?auto_131211 ?auto_131213 ) ) ( not ( = ?auto_131211 ?auto_131208 ) ) ( not ( = ?auto_131212 ?auto_131210 ) ) ( not ( = ?auto_131212 ?auto_131213 ) ) ( not ( = ?auto_131212 ?auto_131208 ) ) ( not ( = ?auto_131210 ?auto_131213 ) ) ( not ( = ?auto_131210 ?auto_131208 ) ) ( not ( = ?auto_131213 ?auto_131208 ) ) ( not ( = ?auto_131206 ?auto_131213 ) ) ( not ( = ?auto_131206 ?auto_131211 ) ) ( not ( = ?auto_131206 ?auto_131212 ) ) ( not ( = ?auto_131206 ?auto_131210 ) ) ( not ( = ?auto_131209 ?auto_131213 ) ) ( not ( = ?auto_131209 ?auto_131211 ) ) ( not ( = ?auto_131209 ?auto_131212 ) ) ( not ( = ?auto_131209 ?auto_131210 ) ) ( not ( = ?auto_131207 ?auto_131213 ) ) ( not ( = ?auto_131207 ?auto_131211 ) ) ( not ( = ?auto_131207 ?auto_131212 ) ) ( not ( = ?auto_131207 ?auto_131210 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131211 ?auto_131212 ?auto_131210 ?auto_131213 ?auto_131208 )
      ( MAKE-1PILE ?auto_131206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131214 - BLOCK
    )
    :vars
    (
      ?auto_131217 - BLOCK
      ?auto_131216 - BLOCK
      ?auto_131219 - BLOCK
      ?auto_131218 - BLOCK
      ?auto_131221 - BLOCK
      ?auto_131215 - BLOCK
      ?auto_131220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131217 ?auto_131214 ) ( ON-TABLE ?auto_131214 ) ( not ( = ?auto_131214 ?auto_131217 ) ) ( not ( = ?auto_131214 ?auto_131216 ) ) ( not ( = ?auto_131214 ?auto_131219 ) ) ( not ( = ?auto_131217 ?auto_131216 ) ) ( not ( = ?auto_131217 ?auto_131219 ) ) ( not ( = ?auto_131216 ?auto_131219 ) ) ( ON ?auto_131216 ?auto_131217 ) ( CLEAR ?auto_131218 ) ( ON-TABLE ?auto_131221 ) ( ON ?auto_131215 ?auto_131221 ) ( ON ?auto_131220 ?auto_131215 ) ( ON ?auto_131218 ?auto_131220 ) ( not ( = ?auto_131221 ?auto_131215 ) ) ( not ( = ?auto_131221 ?auto_131220 ) ) ( not ( = ?auto_131221 ?auto_131218 ) ) ( not ( = ?auto_131221 ?auto_131219 ) ) ( not ( = ?auto_131215 ?auto_131220 ) ) ( not ( = ?auto_131215 ?auto_131218 ) ) ( not ( = ?auto_131215 ?auto_131219 ) ) ( not ( = ?auto_131220 ?auto_131218 ) ) ( not ( = ?auto_131220 ?auto_131219 ) ) ( not ( = ?auto_131218 ?auto_131219 ) ) ( not ( = ?auto_131214 ?auto_131218 ) ) ( not ( = ?auto_131214 ?auto_131221 ) ) ( not ( = ?auto_131214 ?auto_131215 ) ) ( not ( = ?auto_131214 ?auto_131220 ) ) ( not ( = ?auto_131217 ?auto_131218 ) ) ( not ( = ?auto_131217 ?auto_131221 ) ) ( not ( = ?auto_131217 ?auto_131215 ) ) ( not ( = ?auto_131217 ?auto_131220 ) ) ( not ( = ?auto_131216 ?auto_131218 ) ) ( not ( = ?auto_131216 ?auto_131221 ) ) ( not ( = ?auto_131216 ?auto_131215 ) ) ( not ( = ?auto_131216 ?auto_131220 ) ) ( ON ?auto_131219 ?auto_131216 ) ( CLEAR ?auto_131219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131214 ?auto_131217 ?auto_131216 )
      ( MAKE-1PILE ?auto_131214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131222 - BLOCK
    )
    :vars
    (
      ?auto_131224 - BLOCK
      ?auto_131229 - BLOCK
      ?auto_131226 - BLOCK
      ?auto_131225 - BLOCK
      ?auto_131227 - BLOCK
      ?auto_131228 - BLOCK
      ?auto_131223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131224 ?auto_131222 ) ( ON-TABLE ?auto_131222 ) ( not ( = ?auto_131222 ?auto_131224 ) ) ( not ( = ?auto_131222 ?auto_131229 ) ) ( not ( = ?auto_131222 ?auto_131226 ) ) ( not ( = ?auto_131224 ?auto_131229 ) ) ( not ( = ?auto_131224 ?auto_131226 ) ) ( not ( = ?auto_131229 ?auto_131226 ) ) ( ON ?auto_131229 ?auto_131224 ) ( ON-TABLE ?auto_131225 ) ( ON ?auto_131227 ?auto_131225 ) ( ON ?auto_131228 ?auto_131227 ) ( not ( = ?auto_131225 ?auto_131227 ) ) ( not ( = ?auto_131225 ?auto_131228 ) ) ( not ( = ?auto_131225 ?auto_131223 ) ) ( not ( = ?auto_131225 ?auto_131226 ) ) ( not ( = ?auto_131227 ?auto_131228 ) ) ( not ( = ?auto_131227 ?auto_131223 ) ) ( not ( = ?auto_131227 ?auto_131226 ) ) ( not ( = ?auto_131228 ?auto_131223 ) ) ( not ( = ?auto_131228 ?auto_131226 ) ) ( not ( = ?auto_131223 ?auto_131226 ) ) ( not ( = ?auto_131222 ?auto_131223 ) ) ( not ( = ?auto_131222 ?auto_131225 ) ) ( not ( = ?auto_131222 ?auto_131227 ) ) ( not ( = ?auto_131222 ?auto_131228 ) ) ( not ( = ?auto_131224 ?auto_131223 ) ) ( not ( = ?auto_131224 ?auto_131225 ) ) ( not ( = ?auto_131224 ?auto_131227 ) ) ( not ( = ?auto_131224 ?auto_131228 ) ) ( not ( = ?auto_131229 ?auto_131223 ) ) ( not ( = ?auto_131229 ?auto_131225 ) ) ( not ( = ?auto_131229 ?auto_131227 ) ) ( not ( = ?auto_131229 ?auto_131228 ) ) ( ON ?auto_131226 ?auto_131229 ) ( CLEAR ?auto_131226 ) ( HOLDING ?auto_131223 ) ( CLEAR ?auto_131228 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131225 ?auto_131227 ?auto_131228 ?auto_131223 )
      ( MAKE-1PILE ?auto_131222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131230 - BLOCK
    )
    :vars
    (
      ?auto_131232 - BLOCK
      ?auto_131234 - BLOCK
      ?auto_131235 - BLOCK
      ?auto_131231 - BLOCK
      ?auto_131237 - BLOCK
      ?auto_131236 - BLOCK
      ?auto_131233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131232 ?auto_131230 ) ( ON-TABLE ?auto_131230 ) ( not ( = ?auto_131230 ?auto_131232 ) ) ( not ( = ?auto_131230 ?auto_131234 ) ) ( not ( = ?auto_131230 ?auto_131235 ) ) ( not ( = ?auto_131232 ?auto_131234 ) ) ( not ( = ?auto_131232 ?auto_131235 ) ) ( not ( = ?auto_131234 ?auto_131235 ) ) ( ON ?auto_131234 ?auto_131232 ) ( ON-TABLE ?auto_131231 ) ( ON ?auto_131237 ?auto_131231 ) ( ON ?auto_131236 ?auto_131237 ) ( not ( = ?auto_131231 ?auto_131237 ) ) ( not ( = ?auto_131231 ?auto_131236 ) ) ( not ( = ?auto_131231 ?auto_131233 ) ) ( not ( = ?auto_131231 ?auto_131235 ) ) ( not ( = ?auto_131237 ?auto_131236 ) ) ( not ( = ?auto_131237 ?auto_131233 ) ) ( not ( = ?auto_131237 ?auto_131235 ) ) ( not ( = ?auto_131236 ?auto_131233 ) ) ( not ( = ?auto_131236 ?auto_131235 ) ) ( not ( = ?auto_131233 ?auto_131235 ) ) ( not ( = ?auto_131230 ?auto_131233 ) ) ( not ( = ?auto_131230 ?auto_131231 ) ) ( not ( = ?auto_131230 ?auto_131237 ) ) ( not ( = ?auto_131230 ?auto_131236 ) ) ( not ( = ?auto_131232 ?auto_131233 ) ) ( not ( = ?auto_131232 ?auto_131231 ) ) ( not ( = ?auto_131232 ?auto_131237 ) ) ( not ( = ?auto_131232 ?auto_131236 ) ) ( not ( = ?auto_131234 ?auto_131233 ) ) ( not ( = ?auto_131234 ?auto_131231 ) ) ( not ( = ?auto_131234 ?auto_131237 ) ) ( not ( = ?auto_131234 ?auto_131236 ) ) ( ON ?auto_131235 ?auto_131234 ) ( CLEAR ?auto_131236 ) ( ON ?auto_131233 ?auto_131235 ) ( CLEAR ?auto_131233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131230 ?auto_131232 ?auto_131234 ?auto_131235 )
      ( MAKE-1PILE ?auto_131230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131238 - BLOCK
    )
    :vars
    (
      ?auto_131241 - BLOCK
      ?auto_131240 - BLOCK
      ?auto_131245 - BLOCK
      ?auto_131242 - BLOCK
      ?auto_131239 - BLOCK
      ?auto_131244 - BLOCK
      ?auto_131243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131241 ?auto_131238 ) ( ON-TABLE ?auto_131238 ) ( not ( = ?auto_131238 ?auto_131241 ) ) ( not ( = ?auto_131238 ?auto_131240 ) ) ( not ( = ?auto_131238 ?auto_131245 ) ) ( not ( = ?auto_131241 ?auto_131240 ) ) ( not ( = ?auto_131241 ?auto_131245 ) ) ( not ( = ?auto_131240 ?auto_131245 ) ) ( ON ?auto_131240 ?auto_131241 ) ( ON-TABLE ?auto_131242 ) ( ON ?auto_131239 ?auto_131242 ) ( not ( = ?auto_131242 ?auto_131239 ) ) ( not ( = ?auto_131242 ?auto_131244 ) ) ( not ( = ?auto_131242 ?auto_131243 ) ) ( not ( = ?auto_131242 ?auto_131245 ) ) ( not ( = ?auto_131239 ?auto_131244 ) ) ( not ( = ?auto_131239 ?auto_131243 ) ) ( not ( = ?auto_131239 ?auto_131245 ) ) ( not ( = ?auto_131244 ?auto_131243 ) ) ( not ( = ?auto_131244 ?auto_131245 ) ) ( not ( = ?auto_131243 ?auto_131245 ) ) ( not ( = ?auto_131238 ?auto_131243 ) ) ( not ( = ?auto_131238 ?auto_131242 ) ) ( not ( = ?auto_131238 ?auto_131239 ) ) ( not ( = ?auto_131238 ?auto_131244 ) ) ( not ( = ?auto_131241 ?auto_131243 ) ) ( not ( = ?auto_131241 ?auto_131242 ) ) ( not ( = ?auto_131241 ?auto_131239 ) ) ( not ( = ?auto_131241 ?auto_131244 ) ) ( not ( = ?auto_131240 ?auto_131243 ) ) ( not ( = ?auto_131240 ?auto_131242 ) ) ( not ( = ?auto_131240 ?auto_131239 ) ) ( not ( = ?auto_131240 ?auto_131244 ) ) ( ON ?auto_131245 ?auto_131240 ) ( ON ?auto_131243 ?auto_131245 ) ( CLEAR ?auto_131243 ) ( HOLDING ?auto_131244 ) ( CLEAR ?auto_131239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131242 ?auto_131239 ?auto_131244 )
      ( MAKE-1PILE ?auto_131238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131246 - BLOCK
    )
    :vars
    (
      ?auto_131249 - BLOCK
      ?auto_131247 - BLOCK
      ?auto_131248 - BLOCK
      ?auto_131252 - BLOCK
      ?auto_131251 - BLOCK
      ?auto_131253 - BLOCK
      ?auto_131250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131249 ?auto_131246 ) ( ON-TABLE ?auto_131246 ) ( not ( = ?auto_131246 ?auto_131249 ) ) ( not ( = ?auto_131246 ?auto_131247 ) ) ( not ( = ?auto_131246 ?auto_131248 ) ) ( not ( = ?auto_131249 ?auto_131247 ) ) ( not ( = ?auto_131249 ?auto_131248 ) ) ( not ( = ?auto_131247 ?auto_131248 ) ) ( ON ?auto_131247 ?auto_131249 ) ( ON-TABLE ?auto_131252 ) ( ON ?auto_131251 ?auto_131252 ) ( not ( = ?auto_131252 ?auto_131251 ) ) ( not ( = ?auto_131252 ?auto_131253 ) ) ( not ( = ?auto_131252 ?auto_131250 ) ) ( not ( = ?auto_131252 ?auto_131248 ) ) ( not ( = ?auto_131251 ?auto_131253 ) ) ( not ( = ?auto_131251 ?auto_131250 ) ) ( not ( = ?auto_131251 ?auto_131248 ) ) ( not ( = ?auto_131253 ?auto_131250 ) ) ( not ( = ?auto_131253 ?auto_131248 ) ) ( not ( = ?auto_131250 ?auto_131248 ) ) ( not ( = ?auto_131246 ?auto_131250 ) ) ( not ( = ?auto_131246 ?auto_131252 ) ) ( not ( = ?auto_131246 ?auto_131251 ) ) ( not ( = ?auto_131246 ?auto_131253 ) ) ( not ( = ?auto_131249 ?auto_131250 ) ) ( not ( = ?auto_131249 ?auto_131252 ) ) ( not ( = ?auto_131249 ?auto_131251 ) ) ( not ( = ?auto_131249 ?auto_131253 ) ) ( not ( = ?auto_131247 ?auto_131250 ) ) ( not ( = ?auto_131247 ?auto_131252 ) ) ( not ( = ?auto_131247 ?auto_131251 ) ) ( not ( = ?auto_131247 ?auto_131253 ) ) ( ON ?auto_131248 ?auto_131247 ) ( ON ?auto_131250 ?auto_131248 ) ( CLEAR ?auto_131251 ) ( ON ?auto_131253 ?auto_131250 ) ( CLEAR ?auto_131253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131246 ?auto_131249 ?auto_131247 ?auto_131248 ?auto_131250 )
      ( MAKE-1PILE ?auto_131246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131254 - BLOCK
    )
    :vars
    (
      ?auto_131255 - BLOCK
      ?auto_131257 - BLOCK
      ?auto_131259 - BLOCK
      ?auto_131258 - BLOCK
      ?auto_131260 - BLOCK
      ?auto_131256 - BLOCK
      ?auto_131261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131255 ?auto_131254 ) ( ON-TABLE ?auto_131254 ) ( not ( = ?auto_131254 ?auto_131255 ) ) ( not ( = ?auto_131254 ?auto_131257 ) ) ( not ( = ?auto_131254 ?auto_131259 ) ) ( not ( = ?auto_131255 ?auto_131257 ) ) ( not ( = ?auto_131255 ?auto_131259 ) ) ( not ( = ?auto_131257 ?auto_131259 ) ) ( ON ?auto_131257 ?auto_131255 ) ( ON-TABLE ?auto_131258 ) ( not ( = ?auto_131258 ?auto_131260 ) ) ( not ( = ?auto_131258 ?auto_131256 ) ) ( not ( = ?auto_131258 ?auto_131261 ) ) ( not ( = ?auto_131258 ?auto_131259 ) ) ( not ( = ?auto_131260 ?auto_131256 ) ) ( not ( = ?auto_131260 ?auto_131261 ) ) ( not ( = ?auto_131260 ?auto_131259 ) ) ( not ( = ?auto_131256 ?auto_131261 ) ) ( not ( = ?auto_131256 ?auto_131259 ) ) ( not ( = ?auto_131261 ?auto_131259 ) ) ( not ( = ?auto_131254 ?auto_131261 ) ) ( not ( = ?auto_131254 ?auto_131258 ) ) ( not ( = ?auto_131254 ?auto_131260 ) ) ( not ( = ?auto_131254 ?auto_131256 ) ) ( not ( = ?auto_131255 ?auto_131261 ) ) ( not ( = ?auto_131255 ?auto_131258 ) ) ( not ( = ?auto_131255 ?auto_131260 ) ) ( not ( = ?auto_131255 ?auto_131256 ) ) ( not ( = ?auto_131257 ?auto_131261 ) ) ( not ( = ?auto_131257 ?auto_131258 ) ) ( not ( = ?auto_131257 ?auto_131260 ) ) ( not ( = ?auto_131257 ?auto_131256 ) ) ( ON ?auto_131259 ?auto_131257 ) ( ON ?auto_131261 ?auto_131259 ) ( ON ?auto_131256 ?auto_131261 ) ( CLEAR ?auto_131256 ) ( HOLDING ?auto_131260 ) ( CLEAR ?auto_131258 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131258 ?auto_131260 )
      ( MAKE-1PILE ?auto_131254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131262 - BLOCK
    )
    :vars
    (
      ?auto_131269 - BLOCK
      ?auto_131263 - BLOCK
      ?auto_131265 - BLOCK
      ?auto_131264 - BLOCK
      ?auto_131268 - BLOCK
      ?auto_131266 - BLOCK
      ?auto_131267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131269 ?auto_131262 ) ( ON-TABLE ?auto_131262 ) ( not ( = ?auto_131262 ?auto_131269 ) ) ( not ( = ?auto_131262 ?auto_131263 ) ) ( not ( = ?auto_131262 ?auto_131265 ) ) ( not ( = ?auto_131269 ?auto_131263 ) ) ( not ( = ?auto_131269 ?auto_131265 ) ) ( not ( = ?auto_131263 ?auto_131265 ) ) ( ON ?auto_131263 ?auto_131269 ) ( ON-TABLE ?auto_131264 ) ( not ( = ?auto_131264 ?auto_131268 ) ) ( not ( = ?auto_131264 ?auto_131266 ) ) ( not ( = ?auto_131264 ?auto_131267 ) ) ( not ( = ?auto_131264 ?auto_131265 ) ) ( not ( = ?auto_131268 ?auto_131266 ) ) ( not ( = ?auto_131268 ?auto_131267 ) ) ( not ( = ?auto_131268 ?auto_131265 ) ) ( not ( = ?auto_131266 ?auto_131267 ) ) ( not ( = ?auto_131266 ?auto_131265 ) ) ( not ( = ?auto_131267 ?auto_131265 ) ) ( not ( = ?auto_131262 ?auto_131267 ) ) ( not ( = ?auto_131262 ?auto_131264 ) ) ( not ( = ?auto_131262 ?auto_131268 ) ) ( not ( = ?auto_131262 ?auto_131266 ) ) ( not ( = ?auto_131269 ?auto_131267 ) ) ( not ( = ?auto_131269 ?auto_131264 ) ) ( not ( = ?auto_131269 ?auto_131268 ) ) ( not ( = ?auto_131269 ?auto_131266 ) ) ( not ( = ?auto_131263 ?auto_131267 ) ) ( not ( = ?auto_131263 ?auto_131264 ) ) ( not ( = ?auto_131263 ?auto_131268 ) ) ( not ( = ?auto_131263 ?auto_131266 ) ) ( ON ?auto_131265 ?auto_131263 ) ( ON ?auto_131267 ?auto_131265 ) ( ON ?auto_131266 ?auto_131267 ) ( CLEAR ?auto_131264 ) ( ON ?auto_131268 ?auto_131266 ) ( CLEAR ?auto_131268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131262 ?auto_131269 ?auto_131263 ?auto_131265 ?auto_131267 ?auto_131266 )
      ( MAKE-1PILE ?auto_131262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131270 - BLOCK
    )
    :vars
    (
      ?auto_131276 - BLOCK
      ?auto_131273 - BLOCK
      ?auto_131275 - BLOCK
      ?auto_131272 - BLOCK
      ?auto_131271 - BLOCK
      ?auto_131277 - BLOCK
      ?auto_131274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131276 ?auto_131270 ) ( ON-TABLE ?auto_131270 ) ( not ( = ?auto_131270 ?auto_131276 ) ) ( not ( = ?auto_131270 ?auto_131273 ) ) ( not ( = ?auto_131270 ?auto_131275 ) ) ( not ( = ?auto_131276 ?auto_131273 ) ) ( not ( = ?auto_131276 ?auto_131275 ) ) ( not ( = ?auto_131273 ?auto_131275 ) ) ( ON ?auto_131273 ?auto_131276 ) ( not ( = ?auto_131272 ?auto_131271 ) ) ( not ( = ?auto_131272 ?auto_131277 ) ) ( not ( = ?auto_131272 ?auto_131274 ) ) ( not ( = ?auto_131272 ?auto_131275 ) ) ( not ( = ?auto_131271 ?auto_131277 ) ) ( not ( = ?auto_131271 ?auto_131274 ) ) ( not ( = ?auto_131271 ?auto_131275 ) ) ( not ( = ?auto_131277 ?auto_131274 ) ) ( not ( = ?auto_131277 ?auto_131275 ) ) ( not ( = ?auto_131274 ?auto_131275 ) ) ( not ( = ?auto_131270 ?auto_131274 ) ) ( not ( = ?auto_131270 ?auto_131272 ) ) ( not ( = ?auto_131270 ?auto_131271 ) ) ( not ( = ?auto_131270 ?auto_131277 ) ) ( not ( = ?auto_131276 ?auto_131274 ) ) ( not ( = ?auto_131276 ?auto_131272 ) ) ( not ( = ?auto_131276 ?auto_131271 ) ) ( not ( = ?auto_131276 ?auto_131277 ) ) ( not ( = ?auto_131273 ?auto_131274 ) ) ( not ( = ?auto_131273 ?auto_131272 ) ) ( not ( = ?auto_131273 ?auto_131271 ) ) ( not ( = ?auto_131273 ?auto_131277 ) ) ( ON ?auto_131275 ?auto_131273 ) ( ON ?auto_131274 ?auto_131275 ) ( ON ?auto_131277 ?auto_131274 ) ( ON ?auto_131271 ?auto_131277 ) ( CLEAR ?auto_131271 ) ( HOLDING ?auto_131272 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131272 )
      ( MAKE-1PILE ?auto_131270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131287 - BLOCK
    )
    :vars
    (
      ?auto_131288 - BLOCK
      ?auto_131289 - BLOCK
      ?auto_131292 - BLOCK
      ?auto_131290 - BLOCK
      ?auto_131293 - BLOCK
      ?auto_131294 - BLOCK
      ?auto_131291 - BLOCK
      ?auto_131295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131288 ?auto_131287 ) ( ON-TABLE ?auto_131287 ) ( not ( = ?auto_131287 ?auto_131288 ) ) ( not ( = ?auto_131287 ?auto_131289 ) ) ( not ( = ?auto_131287 ?auto_131292 ) ) ( not ( = ?auto_131288 ?auto_131289 ) ) ( not ( = ?auto_131288 ?auto_131292 ) ) ( not ( = ?auto_131289 ?auto_131292 ) ) ( ON ?auto_131289 ?auto_131288 ) ( not ( = ?auto_131290 ?auto_131293 ) ) ( not ( = ?auto_131290 ?auto_131294 ) ) ( not ( = ?auto_131290 ?auto_131291 ) ) ( not ( = ?auto_131290 ?auto_131292 ) ) ( not ( = ?auto_131293 ?auto_131294 ) ) ( not ( = ?auto_131293 ?auto_131291 ) ) ( not ( = ?auto_131293 ?auto_131292 ) ) ( not ( = ?auto_131294 ?auto_131291 ) ) ( not ( = ?auto_131294 ?auto_131292 ) ) ( not ( = ?auto_131291 ?auto_131292 ) ) ( not ( = ?auto_131287 ?auto_131291 ) ) ( not ( = ?auto_131287 ?auto_131290 ) ) ( not ( = ?auto_131287 ?auto_131293 ) ) ( not ( = ?auto_131287 ?auto_131294 ) ) ( not ( = ?auto_131288 ?auto_131291 ) ) ( not ( = ?auto_131288 ?auto_131290 ) ) ( not ( = ?auto_131288 ?auto_131293 ) ) ( not ( = ?auto_131288 ?auto_131294 ) ) ( not ( = ?auto_131289 ?auto_131291 ) ) ( not ( = ?auto_131289 ?auto_131290 ) ) ( not ( = ?auto_131289 ?auto_131293 ) ) ( not ( = ?auto_131289 ?auto_131294 ) ) ( ON ?auto_131292 ?auto_131289 ) ( ON ?auto_131291 ?auto_131292 ) ( ON ?auto_131294 ?auto_131291 ) ( ON ?auto_131293 ?auto_131294 ) ( CLEAR ?auto_131293 ) ( ON ?auto_131290 ?auto_131295 ) ( CLEAR ?auto_131290 ) ( HAND-EMPTY ) ( not ( = ?auto_131287 ?auto_131295 ) ) ( not ( = ?auto_131288 ?auto_131295 ) ) ( not ( = ?auto_131289 ?auto_131295 ) ) ( not ( = ?auto_131292 ?auto_131295 ) ) ( not ( = ?auto_131290 ?auto_131295 ) ) ( not ( = ?auto_131293 ?auto_131295 ) ) ( not ( = ?auto_131294 ?auto_131295 ) ) ( not ( = ?auto_131291 ?auto_131295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131290 ?auto_131295 )
      ( MAKE-1PILE ?auto_131287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131296 - BLOCK
    )
    :vars
    (
      ?auto_131299 - BLOCK
      ?auto_131304 - BLOCK
      ?auto_131301 - BLOCK
      ?auto_131298 - BLOCK
      ?auto_131300 - BLOCK
      ?auto_131297 - BLOCK
      ?auto_131303 - BLOCK
      ?auto_131302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131299 ?auto_131296 ) ( ON-TABLE ?auto_131296 ) ( not ( = ?auto_131296 ?auto_131299 ) ) ( not ( = ?auto_131296 ?auto_131304 ) ) ( not ( = ?auto_131296 ?auto_131301 ) ) ( not ( = ?auto_131299 ?auto_131304 ) ) ( not ( = ?auto_131299 ?auto_131301 ) ) ( not ( = ?auto_131304 ?auto_131301 ) ) ( ON ?auto_131304 ?auto_131299 ) ( not ( = ?auto_131298 ?auto_131300 ) ) ( not ( = ?auto_131298 ?auto_131297 ) ) ( not ( = ?auto_131298 ?auto_131303 ) ) ( not ( = ?auto_131298 ?auto_131301 ) ) ( not ( = ?auto_131300 ?auto_131297 ) ) ( not ( = ?auto_131300 ?auto_131303 ) ) ( not ( = ?auto_131300 ?auto_131301 ) ) ( not ( = ?auto_131297 ?auto_131303 ) ) ( not ( = ?auto_131297 ?auto_131301 ) ) ( not ( = ?auto_131303 ?auto_131301 ) ) ( not ( = ?auto_131296 ?auto_131303 ) ) ( not ( = ?auto_131296 ?auto_131298 ) ) ( not ( = ?auto_131296 ?auto_131300 ) ) ( not ( = ?auto_131296 ?auto_131297 ) ) ( not ( = ?auto_131299 ?auto_131303 ) ) ( not ( = ?auto_131299 ?auto_131298 ) ) ( not ( = ?auto_131299 ?auto_131300 ) ) ( not ( = ?auto_131299 ?auto_131297 ) ) ( not ( = ?auto_131304 ?auto_131303 ) ) ( not ( = ?auto_131304 ?auto_131298 ) ) ( not ( = ?auto_131304 ?auto_131300 ) ) ( not ( = ?auto_131304 ?auto_131297 ) ) ( ON ?auto_131301 ?auto_131304 ) ( ON ?auto_131303 ?auto_131301 ) ( ON ?auto_131297 ?auto_131303 ) ( ON ?auto_131298 ?auto_131302 ) ( CLEAR ?auto_131298 ) ( not ( = ?auto_131296 ?auto_131302 ) ) ( not ( = ?auto_131299 ?auto_131302 ) ) ( not ( = ?auto_131304 ?auto_131302 ) ) ( not ( = ?auto_131301 ?auto_131302 ) ) ( not ( = ?auto_131298 ?auto_131302 ) ) ( not ( = ?auto_131300 ?auto_131302 ) ) ( not ( = ?auto_131297 ?auto_131302 ) ) ( not ( = ?auto_131303 ?auto_131302 ) ) ( HOLDING ?auto_131300 ) ( CLEAR ?auto_131297 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131296 ?auto_131299 ?auto_131304 ?auto_131301 ?auto_131303 ?auto_131297 ?auto_131300 )
      ( MAKE-1PILE ?auto_131296 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131305 - BLOCK
    )
    :vars
    (
      ?auto_131313 - BLOCK
      ?auto_131309 - BLOCK
      ?auto_131307 - BLOCK
      ?auto_131310 - BLOCK
      ?auto_131312 - BLOCK
      ?auto_131308 - BLOCK
      ?auto_131306 - BLOCK
      ?auto_131311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131313 ?auto_131305 ) ( ON-TABLE ?auto_131305 ) ( not ( = ?auto_131305 ?auto_131313 ) ) ( not ( = ?auto_131305 ?auto_131309 ) ) ( not ( = ?auto_131305 ?auto_131307 ) ) ( not ( = ?auto_131313 ?auto_131309 ) ) ( not ( = ?auto_131313 ?auto_131307 ) ) ( not ( = ?auto_131309 ?auto_131307 ) ) ( ON ?auto_131309 ?auto_131313 ) ( not ( = ?auto_131310 ?auto_131312 ) ) ( not ( = ?auto_131310 ?auto_131308 ) ) ( not ( = ?auto_131310 ?auto_131306 ) ) ( not ( = ?auto_131310 ?auto_131307 ) ) ( not ( = ?auto_131312 ?auto_131308 ) ) ( not ( = ?auto_131312 ?auto_131306 ) ) ( not ( = ?auto_131312 ?auto_131307 ) ) ( not ( = ?auto_131308 ?auto_131306 ) ) ( not ( = ?auto_131308 ?auto_131307 ) ) ( not ( = ?auto_131306 ?auto_131307 ) ) ( not ( = ?auto_131305 ?auto_131306 ) ) ( not ( = ?auto_131305 ?auto_131310 ) ) ( not ( = ?auto_131305 ?auto_131312 ) ) ( not ( = ?auto_131305 ?auto_131308 ) ) ( not ( = ?auto_131313 ?auto_131306 ) ) ( not ( = ?auto_131313 ?auto_131310 ) ) ( not ( = ?auto_131313 ?auto_131312 ) ) ( not ( = ?auto_131313 ?auto_131308 ) ) ( not ( = ?auto_131309 ?auto_131306 ) ) ( not ( = ?auto_131309 ?auto_131310 ) ) ( not ( = ?auto_131309 ?auto_131312 ) ) ( not ( = ?auto_131309 ?auto_131308 ) ) ( ON ?auto_131307 ?auto_131309 ) ( ON ?auto_131306 ?auto_131307 ) ( ON ?auto_131308 ?auto_131306 ) ( ON ?auto_131310 ?auto_131311 ) ( not ( = ?auto_131305 ?auto_131311 ) ) ( not ( = ?auto_131313 ?auto_131311 ) ) ( not ( = ?auto_131309 ?auto_131311 ) ) ( not ( = ?auto_131307 ?auto_131311 ) ) ( not ( = ?auto_131310 ?auto_131311 ) ) ( not ( = ?auto_131312 ?auto_131311 ) ) ( not ( = ?auto_131308 ?auto_131311 ) ) ( not ( = ?auto_131306 ?auto_131311 ) ) ( CLEAR ?auto_131308 ) ( ON ?auto_131312 ?auto_131310 ) ( CLEAR ?auto_131312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131311 ?auto_131310 )
      ( MAKE-1PILE ?auto_131305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131314 - BLOCK
    )
    :vars
    (
      ?auto_131321 - BLOCK
      ?auto_131316 - BLOCK
      ?auto_131322 - BLOCK
      ?auto_131315 - BLOCK
      ?auto_131319 - BLOCK
      ?auto_131318 - BLOCK
      ?auto_131320 - BLOCK
      ?auto_131317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131321 ?auto_131314 ) ( ON-TABLE ?auto_131314 ) ( not ( = ?auto_131314 ?auto_131321 ) ) ( not ( = ?auto_131314 ?auto_131316 ) ) ( not ( = ?auto_131314 ?auto_131322 ) ) ( not ( = ?auto_131321 ?auto_131316 ) ) ( not ( = ?auto_131321 ?auto_131322 ) ) ( not ( = ?auto_131316 ?auto_131322 ) ) ( ON ?auto_131316 ?auto_131321 ) ( not ( = ?auto_131315 ?auto_131319 ) ) ( not ( = ?auto_131315 ?auto_131318 ) ) ( not ( = ?auto_131315 ?auto_131320 ) ) ( not ( = ?auto_131315 ?auto_131322 ) ) ( not ( = ?auto_131319 ?auto_131318 ) ) ( not ( = ?auto_131319 ?auto_131320 ) ) ( not ( = ?auto_131319 ?auto_131322 ) ) ( not ( = ?auto_131318 ?auto_131320 ) ) ( not ( = ?auto_131318 ?auto_131322 ) ) ( not ( = ?auto_131320 ?auto_131322 ) ) ( not ( = ?auto_131314 ?auto_131320 ) ) ( not ( = ?auto_131314 ?auto_131315 ) ) ( not ( = ?auto_131314 ?auto_131319 ) ) ( not ( = ?auto_131314 ?auto_131318 ) ) ( not ( = ?auto_131321 ?auto_131320 ) ) ( not ( = ?auto_131321 ?auto_131315 ) ) ( not ( = ?auto_131321 ?auto_131319 ) ) ( not ( = ?auto_131321 ?auto_131318 ) ) ( not ( = ?auto_131316 ?auto_131320 ) ) ( not ( = ?auto_131316 ?auto_131315 ) ) ( not ( = ?auto_131316 ?auto_131319 ) ) ( not ( = ?auto_131316 ?auto_131318 ) ) ( ON ?auto_131322 ?auto_131316 ) ( ON ?auto_131320 ?auto_131322 ) ( ON ?auto_131315 ?auto_131317 ) ( not ( = ?auto_131314 ?auto_131317 ) ) ( not ( = ?auto_131321 ?auto_131317 ) ) ( not ( = ?auto_131316 ?auto_131317 ) ) ( not ( = ?auto_131322 ?auto_131317 ) ) ( not ( = ?auto_131315 ?auto_131317 ) ) ( not ( = ?auto_131319 ?auto_131317 ) ) ( not ( = ?auto_131318 ?auto_131317 ) ) ( not ( = ?auto_131320 ?auto_131317 ) ) ( ON ?auto_131319 ?auto_131315 ) ( CLEAR ?auto_131319 ) ( ON-TABLE ?auto_131317 ) ( HOLDING ?auto_131318 ) ( CLEAR ?auto_131320 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131314 ?auto_131321 ?auto_131316 ?auto_131322 ?auto_131320 ?auto_131318 )
      ( MAKE-1PILE ?auto_131314 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131323 - BLOCK
    )
    :vars
    (
      ?auto_131327 - BLOCK
      ?auto_131331 - BLOCK
      ?auto_131325 - BLOCK
      ?auto_131330 - BLOCK
      ?auto_131329 - BLOCK
      ?auto_131324 - BLOCK
      ?auto_131328 - BLOCK
      ?auto_131326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131327 ?auto_131323 ) ( ON-TABLE ?auto_131323 ) ( not ( = ?auto_131323 ?auto_131327 ) ) ( not ( = ?auto_131323 ?auto_131331 ) ) ( not ( = ?auto_131323 ?auto_131325 ) ) ( not ( = ?auto_131327 ?auto_131331 ) ) ( not ( = ?auto_131327 ?auto_131325 ) ) ( not ( = ?auto_131331 ?auto_131325 ) ) ( ON ?auto_131331 ?auto_131327 ) ( not ( = ?auto_131330 ?auto_131329 ) ) ( not ( = ?auto_131330 ?auto_131324 ) ) ( not ( = ?auto_131330 ?auto_131328 ) ) ( not ( = ?auto_131330 ?auto_131325 ) ) ( not ( = ?auto_131329 ?auto_131324 ) ) ( not ( = ?auto_131329 ?auto_131328 ) ) ( not ( = ?auto_131329 ?auto_131325 ) ) ( not ( = ?auto_131324 ?auto_131328 ) ) ( not ( = ?auto_131324 ?auto_131325 ) ) ( not ( = ?auto_131328 ?auto_131325 ) ) ( not ( = ?auto_131323 ?auto_131328 ) ) ( not ( = ?auto_131323 ?auto_131330 ) ) ( not ( = ?auto_131323 ?auto_131329 ) ) ( not ( = ?auto_131323 ?auto_131324 ) ) ( not ( = ?auto_131327 ?auto_131328 ) ) ( not ( = ?auto_131327 ?auto_131330 ) ) ( not ( = ?auto_131327 ?auto_131329 ) ) ( not ( = ?auto_131327 ?auto_131324 ) ) ( not ( = ?auto_131331 ?auto_131328 ) ) ( not ( = ?auto_131331 ?auto_131330 ) ) ( not ( = ?auto_131331 ?auto_131329 ) ) ( not ( = ?auto_131331 ?auto_131324 ) ) ( ON ?auto_131325 ?auto_131331 ) ( ON ?auto_131328 ?auto_131325 ) ( ON ?auto_131330 ?auto_131326 ) ( not ( = ?auto_131323 ?auto_131326 ) ) ( not ( = ?auto_131327 ?auto_131326 ) ) ( not ( = ?auto_131331 ?auto_131326 ) ) ( not ( = ?auto_131325 ?auto_131326 ) ) ( not ( = ?auto_131330 ?auto_131326 ) ) ( not ( = ?auto_131329 ?auto_131326 ) ) ( not ( = ?auto_131324 ?auto_131326 ) ) ( not ( = ?auto_131328 ?auto_131326 ) ) ( ON ?auto_131329 ?auto_131330 ) ( ON-TABLE ?auto_131326 ) ( CLEAR ?auto_131328 ) ( ON ?auto_131324 ?auto_131329 ) ( CLEAR ?auto_131324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131326 ?auto_131330 ?auto_131329 )
      ( MAKE-1PILE ?auto_131323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131375 - BLOCK
      ?auto_131376 - BLOCK
      ?auto_131377 - BLOCK
      ?auto_131378 - BLOCK
      ?auto_131379 - BLOCK
      ?auto_131380 - BLOCK
      ?auto_131381 - BLOCK
    )
    :vars
    (
      ?auto_131382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131375 ) ( ON ?auto_131376 ?auto_131375 ) ( ON ?auto_131377 ?auto_131376 ) ( ON ?auto_131378 ?auto_131377 ) ( ON ?auto_131379 ?auto_131378 ) ( not ( = ?auto_131375 ?auto_131376 ) ) ( not ( = ?auto_131375 ?auto_131377 ) ) ( not ( = ?auto_131375 ?auto_131378 ) ) ( not ( = ?auto_131375 ?auto_131379 ) ) ( not ( = ?auto_131375 ?auto_131380 ) ) ( not ( = ?auto_131375 ?auto_131381 ) ) ( not ( = ?auto_131376 ?auto_131377 ) ) ( not ( = ?auto_131376 ?auto_131378 ) ) ( not ( = ?auto_131376 ?auto_131379 ) ) ( not ( = ?auto_131376 ?auto_131380 ) ) ( not ( = ?auto_131376 ?auto_131381 ) ) ( not ( = ?auto_131377 ?auto_131378 ) ) ( not ( = ?auto_131377 ?auto_131379 ) ) ( not ( = ?auto_131377 ?auto_131380 ) ) ( not ( = ?auto_131377 ?auto_131381 ) ) ( not ( = ?auto_131378 ?auto_131379 ) ) ( not ( = ?auto_131378 ?auto_131380 ) ) ( not ( = ?auto_131378 ?auto_131381 ) ) ( not ( = ?auto_131379 ?auto_131380 ) ) ( not ( = ?auto_131379 ?auto_131381 ) ) ( not ( = ?auto_131380 ?auto_131381 ) ) ( ON ?auto_131381 ?auto_131382 ) ( not ( = ?auto_131375 ?auto_131382 ) ) ( not ( = ?auto_131376 ?auto_131382 ) ) ( not ( = ?auto_131377 ?auto_131382 ) ) ( not ( = ?auto_131378 ?auto_131382 ) ) ( not ( = ?auto_131379 ?auto_131382 ) ) ( not ( = ?auto_131380 ?auto_131382 ) ) ( not ( = ?auto_131381 ?auto_131382 ) ) ( CLEAR ?auto_131379 ) ( ON ?auto_131380 ?auto_131381 ) ( CLEAR ?auto_131380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131382 ?auto_131381 )
      ( MAKE-7PILE ?auto_131375 ?auto_131376 ?auto_131377 ?auto_131378 ?auto_131379 ?auto_131380 ?auto_131381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131383 - BLOCK
      ?auto_131384 - BLOCK
      ?auto_131385 - BLOCK
      ?auto_131386 - BLOCK
      ?auto_131387 - BLOCK
      ?auto_131388 - BLOCK
      ?auto_131389 - BLOCK
    )
    :vars
    (
      ?auto_131390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131383 ) ( ON ?auto_131384 ?auto_131383 ) ( ON ?auto_131385 ?auto_131384 ) ( ON ?auto_131386 ?auto_131385 ) ( not ( = ?auto_131383 ?auto_131384 ) ) ( not ( = ?auto_131383 ?auto_131385 ) ) ( not ( = ?auto_131383 ?auto_131386 ) ) ( not ( = ?auto_131383 ?auto_131387 ) ) ( not ( = ?auto_131383 ?auto_131388 ) ) ( not ( = ?auto_131383 ?auto_131389 ) ) ( not ( = ?auto_131384 ?auto_131385 ) ) ( not ( = ?auto_131384 ?auto_131386 ) ) ( not ( = ?auto_131384 ?auto_131387 ) ) ( not ( = ?auto_131384 ?auto_131388 ) ) ( not ( = ?auto_131384 ?auto_131389 ) ) ( not ( = ?auto_131385 ?auto_131386 ) ) ( not ( = ?auto_131385 ?auto_131387 ) ) ( not ( = ?auto_131385 ?auto_131388 ) ) ( not ( = ?auto_131385 ?auto_131389 ) ) ( not ( = ?auto_131386 ?auto_131387 ) ) ( not ( = ?auto_131386 ?auto_131388 ) ) ( not ( = ?auto_131386 ?auto_131389 ) ) ( not ( = ?auto_131387 ?auto_131388 ) ) ( not ( = ?auto_131387 ?auto_131389 ) ) ( not ( = ?auto_131388 ?auto_131389 ) ) ( ON ?auto_131389 ?auto_131390 ) ( not ( = ?auto_131383 ?auto_131390 ) ) ( not ( = ?auto_131384 ?auto_131390 ) ) ( not ( = ?auto_131385 ?auto_131390 ) ) ( not ( = ?auto_131386 ?auto_131390 ) ) ( not ( = ?auto_131387 ?auto_131390 ) ) ( not ( = ?auto_131388 ?auto_131390 ) ) ( not ( = ?auto_131389 ?auto_131390 ) ) ( ON ?auto_131388 ?auto_131389 ) ( CLEAR ?auto_131388 ) ( ON-TABLE ?auto_131390 ) ( HOLDING ?auto_131387 ) ( CLEAR ?auto_131386 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131383 ?auto_131384 ?auto_131385 ?auto_131386 ?auto_131387 )
      ( MAKE-7PILE ?auto_131383 ?auto_131384 ?auto_131385 ?auto_131386 ?auto_131387 ?auto_131388 ?auto_131389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131391 - BLOCK
      ?auto_131392 - BLOCK
      ?auto_131393 - BLOCK
      ?auto_131394 - BLOCK
      ?auto_131395 - BLOCK
      ?auto_131396 - BLOCK
      ?auto_131397 - BLOCK
    )
    :vars
    (
      ?auto_131398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131391 ) ( ON ?auto_131392 ?auto_131391 ) ( ON ?auto_131393 ?auto_131392 ) ( ON ?auto_131394 ?auto_131393 ) ( not ( = ?auto_131391 ?auto_131392 ) ) ( not ( = ?auto_131391 ?auto_131393 ) ) ( not ( = ?auto_131391 ?auto_131394 ) ) ( not ( = ?auto_131391 ?auto_131395 ) ) ( not ( = ?auto_131391 ?auto_131396 ) ) ( not ( = ?auto_131391 ?auto_131397 ) ) ( not ( = ?auto_131392 ?auto_131393 ) ) ( not ( = ?auto_131392 ?auto_131394 ) ) ( not ( = ?auto_131392 ?auto_131395 ) ) ( not ( = ?auto_131392 ?auto_131396 ) ) ( not ( = ?auto_131392 ?auto_131397 ) ) ( not ( = ?auto_131393 ?auto_131394 ) ) ( not ( = ?auto_131393 ?auto_131395 ) ) ( not ( = ?auto_131393 ?auto_131396 ) ) ( not ( = ?auto_131393 ?auto_131397 ) ) ( not ( = ?auto_131394 ?auto_131395 ) ) ( not ( = ?auto_131394 ?auto_131396 ) ) ( not ( = ?auto_131394 ?auto_131397 ) ) ( not ( = ?auto_131395 ?auto_131396 ) ) ( not ( = ?auto_131395 ?auto_131397 ) ) ( not ( = ?auto_131396 ?auto_131397 ) ) ( ON ?auto_131397 ?auto_131398 ) ( not ( = ?auto_131391 ?auto_131398 ) ) ( not ( = ?auto_131392 ?auto_131398 ) ) ( not ( = ?auto_131393 ?auto_131398 ) ) ( not ( = ?auto_131394 ?auto_131398 ) ) ( not ( = ?auto_131395 ?auto_131398 ) ) ( not ( = ?auto_131396 ?auto_131398 ) ) ( not ( = ?auto_131397 ?auto_131398 ) ) ( ON ?auto_131396 ?auto_131397 ) ( ON-TABLE ?auto_131398 ) ( CLEAR ?auto_131394 ) ( ON ?auto_131395 ?auto_131396 ) ( CLEAR ?auto_131395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131398 ?auto_131397 ?auto_131396 )
      ( MAKE-7PILE ?auto_131391 ?auto_131392 ?auto_131393 ?auto_131394 ?auto_131395 ?auto_131396 ?auto_131397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131399 - BLOCK
      ?auto_131400 - BLOCK
      ?auto_131401 - BLOCK
      ?auto_131402 - BLOCK
      ?auto_131403 - BLOCK
      ?auto_131404 - BLOCK
      ?auto_131405 - BLOCK
    )
    :vars
    (
      ?auto_131406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131399 ) ( ON ?auto_131400 ?auto_131399 ) ( ON ?auto_131401 ?auto_131400 ) ( not ( = ?auto_131399 ?auto_131400 ) ) ( not ( = ?auto_131399 ?auto_131401 ) ) ( not ( = ?auto_131399 ?auto_131402 ) ) ( not ( = ?auto_131399 ?auto_131403 ) ) ( not ( = ?auto_131399 ?auto_131404 ) ) ( not ( = ?auto_131399 ?auto_131405 ) ) ( not ( = ?auto_131400 ?auto_131401 ) ) ( not ( = ?auto_131400 ?auto_131402 ) ) ( not ( = ?auto_131400 ?auto_131403 ) ) ( not ( = ?auto_131400 ?auto_131404 ) ) ( not ( = ?auto_131400 ?auto_131405 ) ) ( not ( = ?auto_131401 ?auto_131402 ) ) ( not ( = ?auto_131401 ?auto_131403 ) ) ( not ( = ?auto_131401 ?auto_131404 ) ) ( not ( = ?auto_131401 ?auto_131405 ) ) ( not ( = ?auto_131402 ?auto_131403 ) ) ( not ( = ?auto_131402 ?auto_131404 ) ) ( not ( = ?auto_131402 ?auto_131405 ) ) ( not ( = ?auto_131403 ?auto_131404 ) ) ( not ( = ?auto_131403 ?auto_131405 ) ) ( not ( = ?auto_131404 ?auto_131405 ) ) ( ON ?auto_131405 ?auto_131406 ) ( not ( = ?auto_131399 ?auto_131406 ) ) ( not ( = ?auto_131400 ?auto_131406 ) ) ( not ( = ?auto_131401 ?auto_131406 ) ) ( not ( = ?auto_131402 ?auto_131406 ) ) ( not ( = ?auto_131403 ?auto_131406 ) ) ( not ( = ?auto_131404 ?auto_131406 ) ) ( not ( = ?auto_131405 ?auto_131406 ) ) ( ON ?auto_131404 ?auto_131405 ) ( ON-TABLE ?auto_131406 ) ( ON ?auto_131403 ?auto_131404 ) ( CLEAR ?auto_131403 ) ( HOLDING ?auto_131402 ) ( CLEAR ?auto_131401 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131399 ?auto_131400 ?auto_131401 ?auto_131402 )
      ( MAKE-7PILE ?auto_131399 ?auto_131400 ?auto_131401 ?auto_131402 ?auto_131403 ?auto_131404 ?auto_131405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131407 - BLOCK
      ?auto_131408 - BLOCK
      ?auto_131409 - BLOCK
      ?auto_131410 - BLOCK
      ?auto_131411 - BLOCK
      ?auto_131412 - BLOCK
      ?auto_131413 - BLOCK
    )
    :vars
    (
      ?auto_131414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131407 ) ( ON ?auto_131408 ?auto_131407 ) ( ON ?auto_131409 ?auto_131408 ) ( not ( = ?auto_131407 ?auto_131408 ) ) ( not ( = ?auto_131407 ?auto_131409 ) ) ( not ( = ?auto_131407 ?auto_131410 ) ) ( not ( = ?auto_131407 ?auto_131411 ) ) ( not ( = ?auto_131407 ?auto_131412 ) ) ( not ( = ?auto_131407 ?auto_131413 ) ) ( not ( = ?auto_131408 ?auto_131409 ) ) ( not ( = ?auto_131408 ?auto_131410 ) ) ( not ( = ?auto_131408 ?auto_131411 ) ) ( not ( = ?auto_131408 ?auto_131412 ) ) ( not ( = ?auto_131408 ?auto_131413 ) ) ( not ( = ?auto_131409 ?auto_131410 ) ) ( not ( = ?auto_131409 ?auto_131411 ) ) ( not ( = ?auto_131409 ?auto_131412 ) ) ( not ( = ?auto_131409 ?auto_131413 ) ) ( not ( = ?auto_131410 ?auto_131411 ) ) ( not ( = ?auto_131410 ?auto_131412 ) ) ( not ( = ?auto_131410 ?auto_131413 ) ) ( not ( = ?auto_131411 ?auto_131412 ) ) ( not ( = ?auto_131411 ?auto_131413 ) ) ( not ( = ?auto_131412 ?auto_131413 ) ) ( ON ?auto_131413 ?auto_131414 ) ( not ( = ?auto_131407 ?auto_131414 ) ) ( not ( = ?auto_131408 ?auto_131414 ) ) ( not ( = ?auto_131409 ?auto_131414 ) ) ( not ( = ?auto_131410 ?auto_131414 ) ) ( not ( = ?auto_131411 ?auto_131414 ) ) ( not ( = ?auto_131412 ?auto_131414 ) ) ( not ( = ?auto_131413 ?auto_131414 ) ) ( ON ?auto_131412 ?auto_131413 ) ( ON-TABLE ?auto_131414 ) ( ON ?auto_131411 ?auto_131412 ) ( CLEAR ?auto_131409 ) ( ON ?auto_131410 ?auto_131411 ) ( CLEAR ?auto_131410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131414 ?auto_131413 ?auto_131412 ?auto_131411 )
      ( MAKE-7PILE ?auto_131407 ?auto_131408 ?auto_131409 ?auto_131410 ?auto_131411 ?auto_131412 ?auto_131413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131415 - BLOCK
      ?auto_131416 - BLOCK
      ?auto_131417 - BLOCK
      ?auto_131418 - BLOCK
      ?auto_131419 - BLOCK
      ?auto_131420 - BLOCK
      ?auto_131421 - BLOCK
    )
    :vars
    (
      ?auto_131422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131415 ) ( ON ?auto_131416 ?auto_131415 ) ( not ( = ?auto_131415 ?auto_131416 ) ) ( not ( = ?auto_131415 ?auto_131417 ) ) ( not ( = ?auto_131415 ?auto_131418 ) ) ( not ( = ?auto_131415 ?auto_131419 ) ) ( not ( = ?auto_131415 ?auto_131420 ) ) ( not ( = ?auto_131415 ?auto_131421 ) ) ( not ( = ?auto_131416 ?auto_131417 ) ) ( not ( = ?auto_131416 ?auto_131418 ) ) ( not ( = ?auto_131416 ?auto_131419 ) ) ( not ( = ?auto_131416 ?auto_131420 ) ) ( not ( = ?auto_131416 ?auto_131421 ) ) ( not ( = ?auto_131417 ?auto_131418 ) ) ( not ( = ?auto_131417 ?auto_131419 ) ) ( not ( = ?auto_131417 ?auto_131420 ) ) ( not ( = ?auto_131417 ?auto_131421 ) ) ( not ( = ?auto_131418 ?auto_131419 ) ) ( not ( = ?auto_131418 ?auto_131420 ) ) ( not ( = ?auto_131418 ?auto_131421 ) ) ( not ( = ?auto_131419 ?auto_131420 ) ) ( not ( = ?auto_131419 ?auto_131421 ) ) ( not ( = ?auto_131420 ?auto_131421 ) ) ( ON ?auto_131421 ?auto_131422 ) ( not ( = ?auto_131415 ?auto_131422 ) ) ( not ( = ?auto_131416 ?auto_131422 ) ) ( not ( = ?auto_131417 ?auto_131422 ) ) ( not ( = ?auto_131418 ?auto_131422 ) ) ( not ( = ?auto_131419 ?auto_131422 ) ) ( not ( = ?auto_131420 ?auto_131422 ) ) ( not ( = ?auto_131421 ?auto_131422 ) ) ( ON ?auto_131420 ?auto_131421 ) ( ON-TABLE ?auto_131422 ) ( ON ?auto_131419 ?auto_131420 ) ( ON ?auto_131418 ?auto_131419 ) ( CLEAR ?auto_131418 ) ( HOLDING ?auto_131417 ) ( CLEAR ?auto_131416 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131415 ?auto_131416 ?auto_131417 )
      ( MAKE-7PILE ?auto_131415 ?auto_131416 ?auto_131417 ?auto_131418 ?auto_131419 ?auto_131420 ?auto_131421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131423 - BLOCK
      ?auto_131424 - BLOCK
      ?auto_131425 - BLOCK
      ?auto_131426 - BLOCK
      ?auto_131427 - BLOCK
      ?auto_131428 - BLOCK
      ?auto_131429 - BLOCK
    )
    :vars
    (
      ?auto_131430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131423 ) ( ON ?auto_131424 ?auto_131423 ) ( not ( = ?auto_131423 ?auto_131424 ) ) ( not ( = ?auto_131423 ?auto_131425 ) ) ( not ( = ?auto_131423 ?auto_131426 ) ) ( not ( = ?auto_131423 ?auto_131427 ) ) ( not ( = ?auto_131423 ?auto_131428 ) ) ( not ( = ?auto_131423 ?auto_131429 ) ) ( not ( = ?auto_131424 ?auto_131425 ) ) ( not ( = ?auto_131424 ?auto_131426 ) ) ( not ( = ?auto_131424 ?auto_131427 ) ) ( not ( = ?auto_131424 ?auto_131428 ) ) ( not ( = ?auto_131424 ?auto_131429 ) ) ( not ( = ?auto_131425 ?auto_131426 ) ) ( not ( = ?auto_131425 ?auto_131427 ) ) ( not ( = ?auto_131425 ?auto_131428 ) ) ( not ( = ?auto_131425 ?auto_131429 ) ) ( not ( = ?auto_131426 ?auto_131427 ) ) ( not ( = ?auto_131426 ?auto_131428 ) ) ( not ( = ?auto_131426 ?auto_131429 ) ) ( not ( = ?auto_131427 ?auto_131428 ) ) ( not ( = ?auto_131427 ?auto_131429 ) ) ( not ( = ?auto_131428 ?auto_131429 ) ) ( ON ?auto_131429 ?auto_131430 ) ( not ( = ?auto_131423 ?auto_131430 ) ) ( not ( = ?auto_131424 ?auto_131430 ) ) ( not ( = ?auto_131425 ?auto_131430 ) ) ( not ( = ?auto_131426 ?auto_131430 ) ) ( not ( = ?auto_131427 ?auto_131430 ) ) ( not ( = ?auto_131428 ?auto_131430 ) ) ( not ( = ?auto_131429 ?auto_131430 ) ) ( ON ?auto_131428 ?auto_131429 ) ( ON-TABLE ?auto_131430 ) ( ON ?auto_131427 ?auto_131428 ) ( ON ?auto_131426 ?auto_131427 ) ( CLEAR ?auto_131424 ) ( ON ?auto_131425 ?auto_131426 ) ( CLEAR ?auto_131425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131430 ?auto_131429 ?auto_131428 ?auto_131427 ?auto_131426 )
      ( MAKE-7PILE ?auto_131423 ?auto_131424 ?auto_131425 ?auto_131426 ?auto_131427 ?auto_131428 ?auto_131429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131431 - BLOCK
      ?auto_131432 - BLOCK
      ?auto_131433 - BLOCK
      ?auto_131434 - BLOCK
      ?auto_131435 - BLOCK
      ?auto_131436 - BLOCK
      ?auto_131437 - BLOCK
    )
    :vars
    (
      ?auto_131438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131431 ) ( not ( = ?auto_131431 ?auto_131432 ) ) ( not ( = ?auto_131431 ?auto_131433 ) ) ( not ( = ?auto_131431 ?auto_131434 ) ) ( not ( = ?auto_131431 ?auto_131435 ) ) ( not ( = ?auto_131431 ?auto_131436 ) ) ( not ( = ?auto_131431 ?auto_131437 ) ) ( not ( = ?auto_131432 ?auto_131433 ) ) ( not ( = ?auto_131432 ?auto_131434 ) ) ( not ( = ?auto_131432 ?auto_131435 ) ) ( not ( = ?auto_131432 ?auto_131436 ) ) ( not ( = ?auto_131432 ?auto_131437 ) ) ( not ( = ?auto_131433 ?auto_131434 ) ) ( not ( = ?auto_131433 ?auto_131435 ) ) ( not ( = ?auto_131433 ?auto_131436 ) ) ( not ( = ?auto_131433 ?auto_131437 ) ) ( not ( = ?auto_131434 ?auto_131435 ) ) ( not ( = ?auto_131434 ?auto_131436 ) ) ( not ( = ?auto_131434 ?auto_131437 ) ) ( not ( = ?auto_131435 ?auto_131436 ) ) ( not ( = ?auto_131435 ?auto_131437 ) ) ( not ( = ?auto_131436 ?auto_131437 ) ) ( ON ?auto_131437 ?auto_131438 ) ( not ( = ?auto_131431 ?auto_131438 ) ) ( not ( = ?auto_131432 ?auto_131438 ) ) ( not ( = ?auto_131433 ?auto_131438 ) ) ( not ( = ?auto_131434 ?auto_131438 ) ) ( not ( = ?auto_131435 ?auto_131438 ) ) ( not ( = ?auto_131436 ?auto_131438 ) ) ( not ( = ?auto_131437 ?auto_131438 ) ) ( ON ?auto_131436 ?auto_131437 ) ( ON-TABLE ?auto_131438 ) ( ON ?auto_131435 ?auto_131436 ) ( ON ?auto_131434 ?auto_131435 ) ( ON ?auto_131433 ?auto_131434 ) ( CLEAR ?auto_131433 ) ( HOLDING ?auto_131432 ) ( CLEAR ?auto_131431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131431 ?auto_131432 )
      ( MAKE-7PILE ?auto_131431 ?auto_131432 ?auto_131433 ?auto_131434 ?auto_131435 ?auto_131436 ?auto_131437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131439 - BLOCK
      ?auto_131440 - BLOCK
      ?auto_131441 - BLOCK
      ?auto_131442 - BLOCK
      ?auto_131443 - BLOCK
      ?auto_131444 - BLOCK
      ?auto_131445 - BLOCK
    )
    :vars
    (
      ?auto_131446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131439 ) ( not ( = ?auto_131439 ?auto_131440 ) ) ( not ( = ?auto_131439 ?auto_131441 ) ) ( not ( = ?auto_131439 ?auto_131442 ) ) ( not ( = ?auto_131439 ?auto_131443 ) ) ( not ( = ?auto_131439 ?auto_131444 ) ) ( not ( = ?auto_131439 ?auto_131445 ) ) ( not ( = ?auto_131440 ?auto_131441 ) ) ( not ( = ?auto_131440 ?auto_131442 ) ) ( not ( = ?auto_131440 ?auto_131443 ) ) ( not ( = ?auto_131440 ?auto_131444 ) ) ( not ( = ?auto_131440 ?auto_131445 ) ) ( not ( = ?auto_131441 ?auto_131442 ) ) ( not ( = ?auto_131441 ?auto_131443 ) ) ( not ( = ?auto_131441 ?auto_131444 ) ) ( not ( = ?auto_131441 ?auto_131445 ) ) ( not ( = ?auto_131442 ?auto_131443 ) ) ( not ( = ?auto_131442 ?auto_131444 ) ) ( not ( = ?auto_131442 ?auto_131445 ) ) ( not ( = ?auto_131443 ?auto_131444 ) ) ( not ( = ?auto_131443 ?auto_131445 ) ) ( not ( = ?auto_131444 ?auto_131445 ) ) ( ON ?auto_131445 ?auto_131446 ) ( not ( = ?auto_131439 ?auto_131446 ) ) ( not ( = ?auto_131440 ?auto_131446 ) ) ( not ( = ?auto_131441 ?auto_131446 ) ) ( not ( = ?auto_131442 ?auto_131446 ) ) ( not ( = ?auto_131443 ?auto_131446 ) ) ( not ( = ?auto_131444 ?auto_131446 ) ) ( not ( = ?auto_131445 ?auto_131446 ) ) ( ON ?auto_131444 ?auto_131445 ) ( ON-TABLE ?auto_131446 ) ( ON ?auto_131443 ?auto_131444 ) ( ON ?auto_131442 ?auto_131443 ) ( ON ?auto_131441 ?auto_131442 ) ( CLEAR ?auto_131439 ) ( ON ?auto_131440 ?auto_131441 ) ( CLEAR ?auto_131440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131446 ?auto_131445 ?auto_131444 ?auto_131443 ?auto_131442 ?auto_131441 )
      ( MAKE-7PILE ?auto_131439 ?auto_131440 ?auto_131441 ?auto_131442 ?auto_131443 ?auto_131444 ?auto_131445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131447 - BLOCK
      ?auto_131448 - BLOCK
      ?auto_131449 - BLOCK
      ?auto_131450 - BLOCK
      ?auto_131451 - BLOCK
      ?auto_131452 - BLOCK
      ?auto_131453 - BLOCK
    )
    :vars
    (
      ?auto_131454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131447 ?auto_131448 ) ) ( not ( = ?auto_131447 ?auto_131449 ) ) ( not ( = ?auto_131447 ?auto_131450 ) ) ( not ( = ?auto_131447 ?auto_131451 ) ) ( not ( = ?auto_131447 ?auto_131452 ) ) ( not ( = ?auto_131447 ?auto_131453 ) ) ( not ( = ?auto_131448 ?auto_131449 ) ) ( not ( = ?auto_131448 ?auto_131450 ) ) ( not ( = ?auto_131448 ?auto_131451 ) ) ( not ( = ?auto_131448 ?auto_131452 ) ) ( not ( = ?auto_131448 ?auto_131453 ) ) ( not ( = ?auto_131449 ?auto_131450 ) ) ( not ( = ?auto_131449 ?auto_131451 ) ) ( not ( = ?auto_131449 ?auto_131452 ) ) ( not ( = ?auto_131449 ?auto_131453 ) ) ( not ( = ?auto_131450 ?auto_131451 ) ) ( not ( = ?auto_131450 ?auto_131452 ) ) ( not ( = ?auto_131450 ?auto_131453 ) ) ( not ( = ?auto_131451 ?auto_131452 ) ) ( not ( = ?auto_131451 ?auto_131453 ) ) ( not ( = ?auto_131452 ?auto_131453 ) ) ( ON ?auto_131453 ?auto_131454 ) ( not ( = ?auto_131447 ?auto_131454 ) ) ( not ( = ?auto_131448 ?auto_131454 ) ) ( not ( = ?auto_131449 ?auto_131454 ) ) ( not ( = ?auto_131450 ?auto_131454 ) ) ( not ( = ?auto_131451 ?auto_131454 ) ) ( not ( = ?auto_131452 ?auto_131454 ) ) ( not ( = ?auto_131453 ?auto_131454 ) ) ( ON ?auto_131452 ?auto_131453 ) ( ON-TABLE ?auto_131454 ) ( ON ?auto_131451 ?auto_131452 ) ( ON ?auto_131450 ?auto_131451 ) ( ON ?auto_131449 ?auto_131450 ) ( ON ?auto_131448 ?auto_131449 ) ( CLEAR ?auto_131448 ) ( HOLDING ?auto_131447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131447 )
      ( MAKE-7PILE ?auto_131447 ?auto_131448 ?auto_131449 ?auto_131450 ?auto_131451 ?auto_131452 ?auto_131453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131455 - BLOCK
      ?auto_131456 - BLOCK
      ?auto_131457 - BLOCK
      ?auto_131458 - BLOCK
      ?auto_131459 - BLOCK
      ?auto_131460 - BLOCK
      ?auto_131461 - BLOCK
    )
    :vars
    (
      ?auto_131462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131455 ?auto_131456 ) ) ( not ( = ?auto_131455 ?auto_131457 ) ) ( not ( = ?auto_131455 ?auto_131458 ) ) ( not ( = ?auto_131455 ?auto_131459 ) ) ( not ( = ?auto_131455 ?auto_131460 ) ) ( not ( = ?auto_131455 ?auto_131461 ) ) ( not ( = ?auto_131456 ?auto_131457 ) ) ( not ( = ?auto_131456 ?auto_131458 ) ) ( not ( = ?auto_131456 ?auto_131459 ) ) ( not ( = ?auto_131456 ?auto_131460 ) ) ( not ( = ?auto_131456 ?auto_131461 ) ) ( not ( = ?auto_131457 ?auto_131458 ) ) ( not ( = ?auto_131457 ?auto_131459 ) ) ( not ( = ?auto_131457 ?auto_131460 ) ) ( not ( = ?auto_131457 ?auto_131461 ) ) ( not ( = ?auto_131458 ?auto_131459 ) ) ( not ( = ?auto_131458 ?auto_131460 ) ) ( not ( = ?auto_131458 ?auto_131461 ) ) ( not ( = ?auto_131459 ?auto_131460 ) ) ( not ( = ?auto_131459 ?auto_131461 ) ) ( not ( = ?auto_131460 ?auto_131461 ) ) ( ON ?auto_131461 ?auto_131462 ) ( not ( = ?auto_131455 ?auto_131462 ) ) ( not ( = ?auto_131456 ?auto_131462 ) ) ( not ( = ?auto_131457 ?auto_131462 ) ) ( not ( = ?auto_131458 ?auto_131462 ) ) ( not ( = ?auto_131459 ?auto_131462 ) ) ( not ( = ?auto_131460 ?auto_131462 ) ) ( not ( = ?auto_131461 ?auto_131462 ) ) ( ON ?auto_131460 ?auto_131461 ) ( ON-TABLE ?auto_131462 ) ( ON ?auto_131459 ?auto_131460 ) ( ON ?auto_131458 ?auto_131459 ) ( ON ?auto_131457 ?auto_131458 ) ( ON ?auto_131456 ?auto_131457 ) ( ON ?auto_131455 ?auto_131456 ) ( CLEAR ?auto_131455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131462 ?auto_131461 ?auto_131460 ?auto_131459 ?auto_131458 ?auto_131457 ?auto_131456 )
      ( MAKE-7PILE ?auto_131455 ?auto_131456 ?auto_131457 ?auto_131458 ?auto_131459 ?auto_131460 ?auto_131461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131470 - BLOCK
      ?auto_131471 - BLOCK
      ?auto_131472 - BLOCK
      ?auto_131473 - BLOCK
      ?auto_131474 - BLOCK
      ?auto_131475 - BLOCK
      ?auto_131476 - BLOCK
    )
    :vars
    (
      ?auto_131477 - BLOCK
      ?auto_131478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131470 ?auto_131471 ) ) ( not ( = ?auto_131470 ?auto_131472 ) ) ( not ( = ?auto_131470 ?auto_131473 ) ) ( not ( = ?auto_131470 ?auto_131474 ) ) ( not ( = ?auto_131470 ?auto_131475 ) ) ( not ( = ?auto_131470 ?auto_131476 ) ) ( not ( = ?auto_131471 ?auto_131472 ) ) ( not ( = ?auto_131471 ?auto_131473 ) ) ( not ( = ?auto_131471 ?auto_131474 ) ) ( not ( = ?auto_131471 ?auto_131475 ) ) ( not ( = ?auto_131471 ?auto_131476 ) ) ( not ( = ?auto_131472 ?auto_131473 ) ) ( not ( = ?auto_131472 ?auto_131474 ) ) ( not ( = ?auto_131472 ?auto_131475 ) ) ( not ( = ?auto_131472 ?auto_131476 ) ) ( not ( = ?auto_131473 ?auto_131474 ) ) ( not ( = ?auto_131473 ?auto_131475 ) ) ( not ( = ?auto_131473 ?auto_131476 ) ) ( not ( = ?auto_131474 ?auto_131475 ) ) ( not ( = ?auto_131474 ?auto_131476 ) ) ( not ( = ?auto_131475 ?auto_131476 ) ) ( ON ?auto_131476 ?auto_131477 ) ( not ( = ?auto_131470 ?auto_131477 ) ) ( not ( = ?auto_131471 ?auto_131477 ) ) ( not ( = ?auto_131472 ?auto_131477 ) ) ( not ( = ?auto_131473 ?auto_131477 ) ) ( not ( = ?auto_131474 ?auto_131477 ) ) ( not ( = ?auto_131475 ?auto_131477 ) ) ( not ( = ?auto_131476 ?auto_131477 ) ) ( ON ?auto_131475 ?auto_131476 ) ( ON-TABLE ?auto_131477 ) ( ON ?auto_131474 ?auto_131475 ) ( ON ?auto_131473 ?auto_131474 ) ( ON ?auto_131472 ?auto_131473 ) ( ON ?auto_131471 ?auto_131472 ) ( CLEAR ?auto_131471 ) ( ON ?auto_131470 ?auto_131478 ) ( CLEAR ?auto_131470 ) ( HAND-EMPTY ) ( not ( = ?auto_131470 ?auto_131478 ) ) ( not ( = ?auto_131471 ?auto_131478 ) ) ( not ( = ?auto_131472 ?auto_131478 ) ) ( not ( = ?auto_131473 ?auto_131478 ) ) ( not ( = ?auto_131474 ?auto_131478 ) ) ( not ( = ?auto_131475 ?auto_131478 ) ) ( not ( = ?auto_131476 ?auto_131478 ) ) ( not ( = ?auto_131477 ?auto_131478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131470 ?auto_131478 )
      ( MAKE-7PILE ?auto_131470 ?auto_131471 ?auto_131472 ?auto_131473 ?auto_131474 ?auto_131475 ?auto_131476 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131479 - BLOCK
      ?auto_131480 - BLOCK
      ?auto_131481 - BLOCK
      ?auto_131482 - BLOCK
      ?auto_131483 - BLOCK
      ?auto_131484 - BLOCK
      ?auto_131485 - BLOCK
    )
    :vars
    (
      ?auto_131486 - BLOCK
      ?auto_131487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131479 ?auto_131480 ) ) ( not ( = ?auto_131479 ?auto_131481 ) ) ( not ( = ?auto_131479 ?auto_131482 ) ) ( not ( = ?auto_131479 ?auto_131483 ) ) ( not ( = ?auto_131479 ?auto_131484 ) ) ( not ( = ?auto_131479 ?auto_131485 ) ) ( not ( = ?auto_131480 ?auto_131481 ) ) ( not ( = ?auto_131480 ?auto_131482 ) ) ( not ( = ?auto_131480 ?auto_131483 ) ) ( not ( = ?auto_131480 ?auto_131484 ) ) ( not ( = ?auto_131480 ?auto_131485 ) ) ( not ( = ?auto_131481 ?auto_131482 ) ) ( not ( = ?auto_131481 ?auto_131483 ) ) ( not ( = ?auto_131481 ?auto_131484 ) ) ( not ( = ?auto_131481 ?auto_131485 ) ) ( not ( = ?auto_131482 ?auto_131483 ) ) ( not ( = ?auto_131482 ?auto_131484 ) ) ( not ( = ?auto_131482 ?auto_131485 ) ) ( not ( = ?auto_131483 ?auto_131484 ) ) ( not ( = ?auto_131483 ?auto_131485 ) ) ( not ( = ?auto_131484 ?auto_131485 ) ) ( ON ?auto_131485 ?auto_131486 ) ( not ( = ?auto_131479 ?auto_131486 ) ) ( not ( = ?auto_131480 ?auto_131486 ) ) ( not ( = ?auto_131481 ?auto_131486 ) ) ( not ( = ?auto_131482 ?auto_131486 ) ) ( not ( = ?auto_131483 ?auto_131486 ) ) ( not ( = ?auto_131484 ?auto_131486 ) ) ( not ( = ?auto_131485 ?auto_131486 ) ) ( ON ?auto_131484 ?auto_131485 ) ( ON-TABLE ?auto_131486 ) ( ON ?auto_131483 ?auto_131484 ) ( ON ?auto_131482 ?auto_131483 ) ( ON ?auto_131481 ?auto_131482 ) ( ON ?auto_131479 ?auto_131487 ) ( CLEAR ?auto_131479 ) ( not ( = ?auto_131479 ?auto_131487 ) ) ( not ( = ?auto_131480 ?auto_131487 ) ) ( not ( = ?auto_131481 ?auto_131487 ) ) ( not ( = ?auto_131482 ?auto_131487 ) ) ( not ( = ?auto_131483 ?auto_131487 ) ) ( not ( = ?auto_131484 ?auto_131487 ) ) ( not ( = ?auto_131485 ?auto_131487 ) ) ( not ( = ?auto_131486 ?auto_131487 ) ) ( HOLDING ?auto_131480 ) ( CLEAR ?auto_131481 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131486 ?auto_131485 ?auto_131484 ?auto_131483 ?auto_131482 ?auto_131481 ?auto_131480 )
      ( MAKE-7PILE ?auto_131479 ?auto_131480 ?auto_131481 ?auto_131482 ?auto_131483 ?auto_131484 ?auto_131485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131488 - BLOCK
      ?auto_131489 - BLOCK
      ?auto_131490 - BLOCK
      ?auto_131491 - BLOCK
      ?auto_131492 - BLOCK
      ?auto_131493 - BLOCK
      ?auto_131494 - BLOCK
    )
    :vars
    (
      ?auto_131495 - BLOCK
      ?auto_131496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131488 ?auto_131489 ) ) ( not ( = ?auto_131488 ?auto_131490 ) ) ( not ( = ?auto_131488 ?auto_131491 ) ) ( not ( = ?auto_131488 ?auto_131492 ) ) ( not ( = ?auto_131488 ?auto_131493 ) ) ( not ( = ?auto_131488 ?auto_131494 ) ) ( not ( = ?auto_131489 ?auto_131490 ) ) ( not ( = ?auto_131489 ?auto_131491 ) ) ( not ( = ?auto_131489 ?auto_131492 ) ) ( not ( = ?auto_131489 ?auto_131493 ) ) ( not ( = ?auto_131489 ?auto_131494 ) ) ( not ( = ?auto_131490 ?auto_131491 ) ) ( not ( = ?auto_131490 ?auto_131492 ) ) ( not ( = ?auto_131490 ?auto_131493 ) ) ( not ( = ?auto_131490 ?auto_131494 ) ) ( not ( = ?auto_131491 ?auto_131492 ) ) ( not ( = ?auto_131491 ?auto_131493 ) ) ( not ( = ?auto_131491 ?auto_131494 ) ) ( not ( = ?auto_131492 ?auto_131493 ) ) ( not ( = ?auto_131492 ?auto_131494 ) ) ( not ( = ?auto_131493 ?auto_131494 ) ) ( ON ?auto_131494 ?auto_131495 ) ( not ( = ?auto_131488 ?auto_131495 ) ) ( not ( = ?auto_131489 ?auto_131495 ) ) ( not ( = ?auto_131490 ?auto_131495 ) ) ( not ( = ?auto_131491 ?auto_131495 ) ) ( not ( = ?auto_131492 ?auto_131495 ) ) ( not ( = ?auto_131493 ?auto_131495 ) ) ( not ( = ?auto_131494 ?auto_131495 ) ) ( ON ?auto_131493 ?auto_131494 ) ( ON-TABLE ?auto_131495 ) ( ON ?auto_131492 ?auto_131493 ) ( ON ?auto_131491 ?auto_131492 ) ( ON ?auto_131490 ?auto_131491 ) ( ON ?auto_131488 ?auto_131496 ) ( not ( = ?auto_131488 ?auto_131496 ) ) ( not ( = ?auto_131489 ?auto_131496 ) ) ( not ( = ?auto_131490 ?auto_131496 ) ) ( not ( = ?auto_131491 ?auto_131496 ) ) ( not ( = ?auto_131492 ?auto_131496 ) ) ( not ( = ?auto_131493 ?auto_131496 ) ) ( not ( = ?auto_131494 ?auto_131496 ) ) ( not ( = ?auto_131495 ?auto_131496 ) ) ( CLEAR ?auto_131490 ) ( ON ?auto_131489 ?auto_131488 ) ( CLEAR ?auto_131489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131496 ?auto_131488 )
      ( MAKE-7PILE ?auto_131488 ?auto_131489 ?auto_131490 ?auto_131491 ?auto_131492 ?auto_131493 ?auto_131494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131497 - BLOCK
      ?auto_131498 - BLOCK
      ?auto_131499 - BLOCK
      ?auto_131500 - BLOCK
      ?auto_131501 - BLOCK
      ?auto_131502 - BLOCK
      ?auto_131503 - BLOCK
    )
    :vars
    (
      ?auto_131504 - BLOCK
      ?auto_131505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131497 ?auto_131498 ) ) ( not ( = ?auto_131497 ?auto_131499 ) ) ( not ( = ?auto_131497 ?auto_131500 ) ) ( not ( = ?auto_131497 ?auto_131501 ) ) ( not ( = ?auto_131497 ?auto_131502 ) ) ( not ( = ?auto_131497 ?auto_131503 ) ) ( not ( = ?auto_131498 ?auto_131499 ) ) ( not ( = ?auto_131498 ?auto_131500 ) ) ( not ( = ?auto_131498 ?auto_131501 ) ) ( not ( = ?auto_131498 ?auto_131502 ) ) ( not ( = ?auto_131498 ?auto_131503 ) ) ( not ( = ?auto_131499 ?auto_131500 ) ) ( not ( = ?auto_131499 ?auto_131501 ) ) ( not ( = ?auto_131499 ?auto_131502 ) ) ( not ( = ?auto_131499 ?auto_131503 ) ) ( not ( = ?auto_131500 ?auto_131501 ) ) ( not ( = ?auto_131500 ?auto_131502 ) ) ( not ( = ?auto_131500 ?auto_131503 ) ) ( not ( = ?auto_131501 ?auto_131502 ) ) ( not ( = ?auto_131501 ?auto_131503 ) ) ( not ( = ?auto_131502 ?auto_131503 ) ) ( ON ?auto_131503 ?auto_131504 ) ( not ( = ?auto_131497 ?auto_131504 ) ) ( not ( = ?auto_131498 ?auto_131504 ) ) ( not ( = ?auto_131499 ?auto_131504 ) ) ( not ( = ?auto_131500 ?auto_131504 ) ) ( not ( = ?auto_131501 ?auto_131504 ) ) ( not ( = ?auto_131502 ?auto_131504 ) ) ( not ( = ?auto_131503 ?auto_131504 ) ) ( ON ?auto_131502 ?auto_131503 ) ( ON-TABLE ?auto_131504 ) ( ON ?auto_131501 ?auto_131502 ) ( ON ?auto_131500 ?auto_131501 ) ( ON ?auto_131497 ?auto_131505 ) ( not ( = ?auto_131497 ?auto_131505 ) ) ( not ( = ?auto_131498 ?auto_131505 ) ) ( not ( = ?auto_131499 ?auto_131505 ) ) ( not ( = ?auto_131500 ?auto_131505 ) ) ( not ( = ?auto_131501 ?auto_131505 ) ) ( not ( = ?auto_131502 ?auto_131505 ) ) ( not ( = ?auto_131503 ?auto_131505 ) ) ( not ( = ?auto_131504 ?auto_131505 ) ) ( ON ?auto_131498 ?auto_131497 ) ( CLEAR ?auto_131498 ) ( ON-TABLE ?auto_131505 ) ( HOLDING ?auto_131499 ) ( CLEAR ?auto_131500 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131504 ?auto_131503 ?auto_131502 ?auto_131501 ?auto_131500 ?auto_131499 )
      ( MAKE-7PILE ?auto_131497 ?auto_131498 ?auto_131499 ?auto_131500 ?auto_131501 ?auto_131502 ?auto_131503 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131506 - BLOCK
      ?auto_131507 - BLOCK
      ?auto_131508 - BLOCK
      ?auto_131509 - BLOCK
      ?auto_131510 - BLOCK
      ?auto_131511 - BLOCK
      ?auto_131512 - BLOCK
    )
    :vars
    (
      ?auto_131513 - BLOCK
      ?auto_131514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131506 ?auto_131507 ) ) ( not ( = ?auto_131506 ?auto_131508 ) ) ( not ( = ?auto_131506 ?auto_131509 ) ) ( not ( = ?auto_131506 ?auto_131510 ) ) ( not ( = ?auto_131506 ?auto_131511 ) ) ( not ( = ?auto_131506 ?auto_131512 ) ) ( not ( = ?auto_131507 ?auto_131508 ) ) ( not ( = ?auto_131507 ?auto_131509 ) ) ( not ( = ?auto_131507 ?auto_131510 ) ) ( not ( = ?auto_131507 ?auto_131511 ) ) ( not ( = ?auto_131507 ?auto_131512 ) ) ( not ( = ?auto_131508 ?auto_131509 ) ) ( not ( = ?auto_131508 ?auto_131510 ) ) ( not ( = ?auto_131508 ?auto_131511 ) ) ( not ( = ?auto_131508 ?auto_131512 ) ) ( not ( = ?auto_131509 ?auto_131510 ) ) ( not ( = ?auto_131509 ?auto_131511 ) ) ( not ( = ?auto_131509 ?auto_131512 ) ) ( not ( = ?auto_131510 ?auto_131511 ) ) ( not ( = ?auto_131510 ?auto_131512 ) ) ( not ( = ?auto_131511 ?auto_131512 ) ) ( ON ?auto_131512 ?auto_131513 ) ( not ( = ?auto_131506 ?auto_131513 ) ) ( not ( = ?auto_131507 ?auto_131513 ) ) ( not ( = ?auto_131508 ?auto_131513 ) ) ( not ( = ?auto_131509 ?auto_131513 ) ) ( not ( = ?auto_131510 ?auto_131513 ) ) ( not ( = ?auto_131511 ?auto_131513 ) ) ( not ( = ?auto_131512 ?auto_131513 ) ) ( ON ?auto_131511 ?auto_131512 ) ( ON-TABLE ?auto_131513 ) ( ON ?auto_131510 ?auto_131511 ) ( ON ?auto_131509 ?auto_131510 ) ( ON ?auto_131506 ?auto_131514 ) ( not ( = ?auto_131506 ?auto_131514 ) ) ( not ( = ?auto_131507 ?auto_131514 ) ) ( not ( = ?auto_131508 ?auto_131514 ) ) ( not ( = ?auto_131509 ?auto_131514 ) ) ( not ( = ?auto_131510 ?auto_131514 ) ) ( not ( = ?auto_131511 ?auto_131514 ) ) ( not ( = ?auto_131512 ?auto_131514 ) ) ( not ( = ?auto_131513 ?auto_131514 ) ) ( ON ?auto_131507 ?auto_131506 ) ( ON-TABLE ?auto_131514 ) ( CLEAR ?auto_131509 ) ( ON ?auto_131508 ?auto_131507 ) ( CLEAR ?auto_131508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131514 ?auto_131506 ?auto_131507 )
      ( MAKE-7PILE ?auto_131506 ?auto_131507 ?auto_131508 ?auto_131509 ?auto_131510 ?auto_131511 ?auto_131512 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131515 - BLOCK
      ?auto_131516 - BLOCK
      ?auto_131517 - BLOCK
      ?auto_131518 - BLOCK
      ?auto_131519 - BLOCK
      ?auto_131520 - BLOCK
      ?auto_131521 - BLOCK
    )
    :vars
    (
      ?auto_131522 - BLOCK
      ?auto_131523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131515 ?auto_131516 ) ) ( not ( = ?auto_131515 ?auto_131517 ) ) ( not ( = ?auto_131515 ?auto_131518 ) ) ( not ( = ?auto_131515 ?auto_131519 ) ) ( not ( = ?auto_131515 ?auto_131520 ) ) ( not ( = ?auto_131515 ?auto_131521 ) ) ( not ( = ?auto_131516 ?auto_131517 ) ) ( not ( = ?auto_131516 ?auto_131518 ) ) ( not ( = ?auto_131516 ?auto_131519 ) ) ( not ( = ?auto_131516 ?auto_131520 ) ) ( not ( = ?auto_131516 ?auto_131521 ) ) ( not ( = ?auto_131517 ?auto_131518 ) ) ( not ( = ?auto_131517 ?auto_131519 ) ) ( not ( = ?auto_131517 ?auto_131520 ) ) ( not ( = ?auto_131517 ?auto_131521 ) ) ( not ( = ?auto_131518 ?auto_131519 ) ) ( not ( = ?auto_131518 ?auto_131520 ) ) ( not ( = ?auto_131518 ?auto_131521 ) ) ( not ( = ?auto_131519 ?auto_131520 ) ) ( not ( = ?auto_131519 ?auto_131521 ) ) ( not ( = ?auto_131520 ?auto_131521 ) ) ( ON ?auto_131521 ?auto_131522 ) ( not ( = ?auto_131515 ?auto_131522 ) ) ( not ( = ?auto_131516 ?auto_131522 ) ) ( not ( = ?auto_131517 ?auto_131522 ) ) ( not ( = ?auto_131518 ?auto_131522 ) ) ( not ( = ?auto_131519 ?auto_131522 ) ) ( not ( = ?auto_131520 ?auto_131522 ) ) ( not ( = ?auto_131521 ?auto_131522 ) ) ( ON ?auto_131520 ?auto_131521 ) ( ON-TABLE ?auto_131522 ) ( ON ?auto_131519 ?auto_131520 ) ( ON ?auto_131515 ?auto_131523 ) ( not ( = ?auto_131515 ?auto_131523 ) ) ( not ( = ?auto_131516 ?auto_131523 ) ) ( not ( = ?auto_131517 ?auto_131523 ) ) ( not ( = ?auto_131518 ?auto_131523 ) ) ( not ( = ?auto_131519 ?auto_131523 ) ) ( not ( = ?auto_131520 ?auto_131523 ) ) ( not ( = ?auto_131521 ?auto_131523 ) ) ( not ( = ?auto_131522 ?auto_131523 ) ) ( ON ?auto_131516 ?auto_131515 ) ( ON-TABLE ?auto_131523 ) ( ON ?auto_131517 ?auto_131516 ) ( CLEAR ?auto_131517 ) ( HOLDING ?auto_131518 ) ( CLEAR ?auto_131519 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131522 ?auto_131521 ?auto_131520 ?auto_131519 ?auto_131518 )
      ( MAKE-7PILE ?auto_131515 ?auto_131516 ?auto_131517 ?auto_131518 ?auto_131519 ?auto_131520 ?auto_131521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131524 - BLOCK
      ?auto_131525 - BLOCK
      ?auto_131526 - BLOCK
      ?auto_131527 - BLOCK
      ?auto_131528 - BLOCK
      ?auto_131529 - BLOCK
      ?auto_131530 - BLOCK
    )
    :vars
    (
      ?auto_131531 - BLOCK
      ?auto_131532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131524 ?auto_131525 ) ) ( not ( = ?auto_131524 ?auto_131526 ) ) ( not ( = ?auto_131524 ?auto_131527 ) ) ( not ( = ?auto_131524 ?auto_131528 ) ) ( not ( = ?auto_131524 ?auto_131529 ) ) ( not ( = ?auto_131524 ?auto_131530 ) ) ( not ( = ?auto_131525 ?auto_131526 ) ) ( not ( = ?auto_131525 ?auto_131527 ) ) ( not ( = ?auto_131525 ?auto_131528 ) ) ( not ( = ?auto_131525 ?auto_131529 ) ) ( not ( = ?auto_131525 ?auto_131530 ) ) ( not ( = ?auto_131526 ?auto_131527 ) ) ( not ( = ?auto_131526 ?auto_131528 ) ) ( not ( = ?auto_131526 ?auto_131529 ) ) ( not ( = ?auto_131526 ?auto_131530 ) ) ( not ( = ?auto_131527 ?auto_131528 ) ) ( not ( = ?auto_131527 ?auto_131529 ) ) ( not ( = ?auto_131527 ?auto_131530 ) ) ( not ( = ?auto_131528 ?auto_131529 ) ) ( not ( = ?auto_131528 ?auto_131530 ) ) ( not ( = ?auto_131529 ?auto_131530 ) ) ( ON ?auto_131530 ?auto_131531 ) ( not ( = ?auto_131524 ?auto_131531 ) ) ( not ( = ?auto_131525 ?auto_131531 ) ) ( not ( = ?auto_131526 ?auto_131531 ) ) ( not ( = ?auto_131527 ?auto_131531 ) ) ( not ( = ?auto_131528 ?auto_131531 ) ) ( not ( = ?auto_131529 ?auto_131531 ) ) ( not ( = ?auto_131530 ?auto_131531 ) ) ( ON ?auto_131529 ?auto_131530 ) ( ON-TABLE ?auto_131531 ) ( ON ?auto_131528 ?auto_131529 ) ( ON ?auto_131524 ?auto_131532 ) ( not ( = ?auto_131524 ?auto_131532 ) ) ( not ( = ?auto_131525 ?auto_131532 ) ) ( not ( = ?auto_131526 ?auto_131532 ) ) ( not ( = ?auto_131527 ?auto_131532 ) ) ( not ( = ?auto_131528 ?auto_131532 ) ) ( not ( = ?auto_131529 ?auto_131532 ) ) ( not ( = ?auto_131530 ?auto_131532 ) ) ( not ( = ?auto_131531 ?auto_131532 ) ) ( ON ?auto_131525 ?auto_131524 ) ( ON-TABLE ?auto_131532 ) ( ON ?auto_131526 ?auto_131525 ) ( CLEAR ?auto_131528 ) ( ON ?auto_131527 ?auto_131526 ) ( CLEAR ?auto_131527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131532 ?auto_131524 ?auto_131525 ?auto_131526 )
      ( MAKE-7PILE ?auto_131524 ?auto_131525 ?auto_131526 ?auto_131527 ?auto_131528 ?auto_131529 ?auto_131530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131533 - BLOCK
      ?auto_131534 - BLOCK
      ?auto_131535 - BLOCK
      ?auto_131536 - BLOCK
      ?auto_131537 - BLOCK
      ?auto_131538 - BLOCK
      ?auto_131539 - BLOCK
    )
    :vars
    (
      ?auto_131541 - BLOCK
      ?auto_131540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131533 ?auto_131534 ) ) ( not ( = ?auto_131533 ?auto_131535 ) ) ( not ( = ?auto_131533 ?auto_131536 ) ) ( not ( = ?auto_131533 ?auto_131537 ) ) ( not ( = ?auto_131533 ?auto_131538 ) ) ( not ( = ?auto_131533 ?auto_131539 ) ) ( not ( = ?auto_131534 ?auto_131535 ) ) ( not ( = ?auto_131534 ?auto_131536 ) ) ( not ( = ?auto_131534 ?auto_131537 ) ) ( not ( = ?auto_131534 ?auto_131538 ) ) ( not ( = ?auto_131534 ?auto_131539 ) ) ( not ( = ?auto_131535 ?auto_131536 ) ) ( not ( = ?auto_131535 ?auto_131537 ) ) ( not ( = ?auto_131535 ?auto_131538 ) ) ( not ( = ?auto_131535 ?auto_131539 ) ) ( not ( = ?auto_131536 ?auto_131537 ) ) ( not ( = ?auto_131536 ?auto_131538 ) ) ( not ( = ?auto_131536 ?auto_131539 ) ) ( not ( = ?auto_131537 ?auto_131538 ) ) ( not ( = ?auto_131537 ?auto_131539 ) ) ( not ( = ?auto_131538 ?auto_131539 ) ) ( ON ?auto_131539 ?auto_131541 ) ( not ( = ?auto_131533 ?auto_131541 ) ) ( not ( = ?auto_131534 ?auto_131541 ) ) ( not ( = ?auto_131535 ?auto_131541 ) ) ( not ( = ?auto_131536 ?auto_131541 ) ) ( not ( = ?auto_131537 ?auto_131541 ) ) ( not ( = ?auto_131538 ?auto_131541 ) ) ( not ( = ?auto_131539 ?auto_131541 ) ) ( ON ?auto_131538 ?auto_131539 ) ( ON-TABLE ?auto_131541 ) ( ON ?auto_131533 ?auto_131540 ) ( not ( = ?auto_131533 ?auto_131540 ) ) ( not ( = ?auto_131534 ?auto_131540 ) ) ( not ( = ?auto_131535 ?auto_131540 ) ) ( not ( = ?auto_131536 ?auto_131540 ) ) ( not ( = ?auto_131537 ?auto_131540 ) ) ( not ( = ?auto_131538 ?auto_131540 ) ) ( not ( = ?auto_131539 ?auto_131540 ) ) ( not ( = ?auto_131541 ?auto_131540 ) ) ( ON ?auto_131534 ?auto_131533 ) ( ON-TABLE ?auto_131540 ) ( ON ?auto_131535 ?auto_131534 ) ( ON ?auto_131536 ?auto_131535 ) ( CLEAR ?auto_131536 ) ( HOLDING ?auto_131537 ) ( CLEAR ?auto_131538 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131541 ?auto_131539 ?auto_131538 ?auto_131537 )
      ( MAKE-7PILE ?auto_131533 ?auto_131534 ?auto_131535 ?auto_131536 ?auto_131537 ?auto_131538 ?auto_131539 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131542 - BLOCK
      ?auto_131543 - BLOCK
      ?auto_131544 - BLOCK
      ?auto_131545 - BLOCK
      ?auto_131546 - BLOCK
      ?auto_131547 - BLOCK
      ?auto_131548 - BLOCK
    )
    :vars
    (
      ?auto_131549 - BLOCK
      ?auto_131550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131542 ?auto_131543 ) ) ( not ( = ?auto_131542 ?auto_131544 ) ) ( not ( = ?auto_131542 ?auto_131545 ) ) ( not ( = ?auto_131542 ?auto_131546 ) ) ( not ( = ?auto_131542 ?auto_131547 ) ) ( not ( = ?auto_131542 ?auto_131548 ) ) ( not ( = ?auto_131543 ?auto_131544 ) ) ( not ( = ?auto_131543 ?auto_131545 ) ) ( not ( = ?auto_131543 ?auto_131546 ) ) ( not ( = ?auto_131543 ?auto_131547 ) ) ( not ( = ?auto_131543 ?auto_131548 ) ) ( not ( = ?auto_131544 ?auto_131545 ) ) ( not ( = ?auto_131544 ?auto_131546 ) ) ( not ( = ?auto_131544 ?auto_131547 ) ) ( not ( = ?auto_131544 ?auto_131548 ) ) ( not ( = ?auto_131545 ?auto_131546 ) ) ( not ( = ?auto_131545 ?auto_131547 ) ) ( not ( = ?auto_131545 ?auto_131548 ) ) ( not ( = ?auto_131546 ?auto_131547 ) ) ( not ( = ?auto_131546 ?auto_131548 ) ) ( not ( = ?auto_131547 ?auto_131548 ) ) ( ON ?auto_131548 ?auto_131549 ) ( not ( = ?auto_131542 ?auto_131549 ) ) ( not ( = ?auto_131543 ?auto_131549 ) ) ( not ( = ?auto_131544 ?auto_131549 ) ) ( not ( = ?auto_131545 ?auto_131549 ) ) ( not ( = ?auto_131546 ?auto_131549 ) ) ( not ( = ?auto_131547 ?auto_131549 ) ) ( not ( = ?auto_131548 ?auto_131549 ) ) ( ON ?auto_131547 ?auto_131548 ) ( ON-TABLE ?auto_131549 ) ( ON ?auto_131542 ?auto_131550 ) ( not ( = ?auto_131542 ?auto_131550 ) ) ( not ( = ?auto_131543 ?auto_131550 ) ) ( not ( = ?auto_131544 ?auto_131550 ) ) ( not ( = ?auto_131545 ?auto_131550 ) ) ( not ( = ?auto_131546 ?auto_131550 ) ) ( not ( = ?auto_131547 ?auto_131550 ) ) ( not ( = ?auto_131548 ?auto_131550 ) ) ( not ( = ?auto_131549 ?auto_131550 ) ) ( ON ?auto_131543 ?auto_131542 ) ( ON-TABLE ?auto_131550 ) ( ON ?auto_131544 ?auto_131543 ) ( ON ?auto_131545 ?auto_131544 ) ( CLEAR ?auto_131547 ) ( ON ?auto_131546 ?auto_131545 ) ( CLEAR ?auto_131546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131550 ?auto_131542 ?auto_131543 ?auto_131544 ?auto_131545 )
      ( MAKE-7PILE ?auto_131542 ?auto_131543 ?auto_131544 ?auto_131545 ?auto_131546 ?auto_131547 ?auto_131548 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131551 - BLOCK
      ?auto_131552 - BLOCK
      ?auto_131553 - BLOCK
      ?auto_131554 - BLOCK
      ?auto_131555 - BLOCK
      ?auto_131556 - BLOCK
      ?auto_131557 - BLOCK
    )
    :vars
    (
      ?auto_131559 - BLOCK
      ?auto_131558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131551 ?auto_131552 ) ) ( not ( = ?auto_131551 ?auto_131553 ) ) ( not ( = ?auto_131551 ?auto_131554 ) ) ( not ( = ?auto_131551 ?auto_131555 ) ) ( not ( = ?auto_131551 ?auto_131556 ) ) ( not ( = ?auto_131551 ?auto_131557 ) ) ( not ( = ?auto_131552 ?auto_131553 ) ) ( not ( = ?auto_131552 ?auto_131554 ) ) ( not ( = ?auto_131552 ?auto_131555 ) ) ( not ( = ?auto_131552 ?auto_131556 ) ) ( not ( = ?auto_131552 ?auto_131557 ) ) ( not ( = ?auto_131553 ?auto_131554 ) ) ( not ( = ?auto_131553 ?auto_131555 ) ) ( not ( = ?auto_131553 ?auto_131556 ) ) ( not ( = ?auto_131553 ?auto_131557 ) ) ( not ( = ?auto_131554 ?auto_131555 ) ) ( not ( = ?auto_131554 ?auto_131556 ) ) ( not ( = ?auto_131554 ?auto_131557 ) ) ( not ( = ?auto_131555 ?auto_131556 ) ) ( not ( = ?auto_131555 ?auto_131557 ) ) ( not ( = ?auto_131556 ?auto_131557 ) ) ( ON ?auto_131557 ?auto_131559 ) ( not ( = ?auto_131551 ?auto_131559 ) ) ( not ( = ?auto_131552 ?auto_131559 ) ) ( not ( = ?auto_131553 ?auto_131559 ) ) ( not ( = ?auto_131554 ?auto_131559 ) ) ( not ( = ?auto_131555 ?auto_131559 ) ) ( not ( = ?auto_131556 ?auto_131559 ) ) ( not ( = ?auto_131557 ?auto_131559 ) ) ( ON-TABLE ?auto_131559 ) ( ON ?auto_131551 ?auto_131558 ) ( not ( = ?auto_131551 ?auto_131558 ) ) ( not ( = ?auto_131552 ?auto_131558 ) ) ( not ( = ?auto_131553 ?auto_131558 ) ) ( not ( = ?auto_131554 ?auto_131558 ) ) ( not ( = ?auto_131555 ?auto_131558 ) ) ( not ( = ?auto_131556 ?auto_131558 ) ) ( not ( = ?auto_131557 ?auto_131558 ) ) ( not ( = ?auto_131559 ?auto_131558 ) ) ( ON ?auto_131552 ?auto_131551 ) ( ON-TABLE ?auto_131558 ) ( ON ?auto_131553 ?auto_131552 ) ( ON ?auto_131554 ?auto_131553 ) ( ON ?auto_131555 ?auto_131554 ) ( CLEAR ?auto_131555 ) ( HOLDING ?auto_131556 ) ( CLEAR ?auto_131557 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131559 ?auto_131557 ?auto_131556 )
      ( MAKE-7PILE ?auto_131551 ?auto_131552 ?auto_131553 ?auto_131554 ?auto_131555 ?auto_131556 ?auto_131557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131560 - BLOCK
      ?auto_131561 - BLOCK
      ?auto_131562 - BLOCK
      ?auto_131563 - BLOCK
      ?auto_131564 - BLOCK
      ?auto_131565 - BLOCK
      ?auto_131566 - BLOCK
    )
    :vars
    (
      ?auto_131567 - BLOCK
      ?auto_131568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131560 ?auto_131561 ) ) ( not ( = ?auto_131560 ?auto_131562 ) ) ( not ( = ?auto_131560 ?auto_131563 ) ) ( not ( = ?auto_131560 ?auto_131564 ) ) ( not ( = ?auto_131560 ?auto_131565 ) ) ( not ( = ?auto_131560 ?auto_131566 ) ) ( not ( = ?auto_131561 ?auto_131562 ) ) ( not ( = ?auto_131561 ?auto_131563 ) ) ( not ( = ?auto_131561 ?auto_131564 ) ) ( not ( = ?auto_131561 ?auto_131565 ) ) ( not ( = ?auto_131561 ?auto_131566 ) ) ( not ( = ?auto_131562 ?auto_131563 ) ) ( not ( = ?auto_131562 ?auto_131564 ) ) ( not ( = ?auto_131562 ?auto_131565 ) ) ( not ( = ?auto_131562 ?auto_131566 ) ) ( not ( = ?auto_131563 ?auto_131564 ) ) ( not ( = ?auto_131563 ?auto_131565 ) ) ( not ( = ?auto_131563 ?auto_131566 ) ) ( not ( = ?auto_131564 ?auto_131565 ) ) ( not ( = ?auto_131564 ?auto_131566 ) ) ( not ( = ?auto_131565 ?auto_131566 ) ) ( ON ?auto_131566 ?auto_131567 ) ( not ( = ?auto_131560 ?auto_131567 ) ) ( not ( = ?auto_131561 ?auto_131567 ) ) ( not ( = ?auto_131562 ?auto_131567 ) ) ( not ( = ?auto_131563 ?auto_131567 ) ) ( not ( = ?auto_131564 ?auto_131567 ) ) ( not ( = ?auto_131565 ?auto_131567 ) ) ( not ( = ?auto_131566 ?auto_131567 ) ) ( ON-TABLE ?auto_131567 ) ( ON ?auto_131560 ?auto_131568 ) ( not ( = ?auto_131560 ?auto_131568 ) ) ( not ( = ?auto_131561 ?auto_131568 ) ) ( not ( = ?auto_131562 ?auto_131568 ) ) ( not ( = ?auto_131563 ?auto_131568 ) ) ( not ( = ?auto_131564 ?auto_131568 ) ) ( not ( = ?auto_131565 ?auto_131568 ) ) ( not ( = ?auto_131566 ?auto_131568 ) ) ( not ( = ?auto_131567 ?auto_131568 ) ) ( ON ?auto_131561 ?auto_131560 ) ( ON-TABLE ?auto_131568 ) ( ON ?auto_131562 ?auto_131561 ) ( ON ?auto_131563 ?auto_131562 ) ( ON ?auto_131564 ?auto_131563 ) ( CLEAR ?auto_131566 ) ( ON ?auto_131565 ?auto_131564 ) ( CLEAR ?auto_131565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131568 ?auto_131560 ?auto_131561 ?auto_131562 ?auto_131563 ?auto_131564 )
      ( MAKE-7PILE ?auto_131560 ?auto_131561 ?auto_131562 ?auto_131563 ?auto_131564 ?auto_131565 ?auto_131566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131569 - BLOCK
      ?auto_131570 - BLOCK
      ?auto_131571 - BLOCK
      ?auto_131572 - BLOCK
      ?auto_131573 - BLOCK
      ?auto_131574 - BLOCK
      ?auto_131575 - BLOCK
    )
    :vars
    (
      ?auto_131576 - BLOCK
      ?auto_131577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131569 ?auto_131570 ) ) ( not ( = ?auto_131569 ?auto_131571 ) ) ( not ( = ?auto_131569 ?auto_131572 ) ) ( not ( = ?auto_131569 ?auto_131573 ) ) ( not ( = ?auto_131569 ?auto_131574 ) ) ( not ( = ?auto_131569 ?auto_131575 ) ) ( not ( = ?auto_131570 ?auto_131571 ) ) ( not ( = ?auto_131570 ?auto_131572 ) ) ( not ( = ?auto_131570 ?auto_131573 ) ) ( not ( = ?auto_131570 ?auto_131574 ) ) ( not ( = ?auto_131570 ?auto_131575 ) ) ( not ( = ?auto_131571 ?auto_131572 ) ) ( not ( = ?auto_131571 ?auto_131573 ) ) ( not ( = ?auto_131571 ?auto_131574 ) ) ( not ( = ?auto_131571 ?auto_131575 ) ) ( not ( = ?auto_131572 ?auto_131573 ) ) ( not ( = ?auto_131572 ?auto_131574 ) ) ( not ( = ?auto_131572 ?auto_131575 ) ) ( not ( = ?auto_131573 ?auto_131574 ) ) ( not ( = ?auto_131573 ?auto_131575 ) ) ( not ( = ?auto_131574 ?auto_131575 ) ) ( not ( = ?auto_131569 ?auto_131576 ) ) ( not ( = ?auto_131570 ?auto_131576 ) ) ( not ( = ?auto_131571 ?auto_131576 ) ) ( not ( = ?auto_131572 ?auto_131576 ) ) ( not ( = ?auto_131573 ?auto_131576 ) ) ( not ( = ?auto_131574 ?auto_131576 ) ) ( not ( = ?auto_131575 ?auto_131576 ) ) ( ON-TABLE ?auto_131576 ) ( ON ?auto_131569 ?auto_131577 ) ( not ( = ?auto_131569 ?auto_131577 ) ) ( not ( = ?auto_131570 ?auto_131577 ) ) ( not ( = ?auto_131571 ?auto_131577 ) ) ( not ( = ?auto_131572 ?auto_131577 ) ) ( not ( = ?auto_131573 ?auto_131577 ) ) ( not ( = ?auto_131574 ?auto_131577 ) ) ( not ( = ?auto_131575 ?auto_131577 ) ) ( not ( = ?auto_131576 ?auto_131577 ) ) ( ON ?auto_131570 ?auto_131569 ) ( ON-TABLE ?auto_131577 ) ( ON ?auto_131571 ?auto_131570 ) ( ON ?auto_131572 ?auto_131571 ) ( ON ?auto_131573 ?auto_131572 ) ( ON ?auto_131574 ?auto_131573 ) ( CLEAR ?auto_131574 ) ( HOLDING ?auto_131575 ) ( CLEAR ?auto_131576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131576 ?auto_131575 )
      ( MAKE-7PILE ?auto_131569 ?auto_131570 ?auto_131571 ?auto_131572 ?auto_131573 ?auto_131574 ?auto_131575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131578 - BLOCK
      ?auto_131579 - BLOCK
      ?auto_131580 - BLOCK
      ?auto_131581 - BLOCK
      ?auto_131582 - BLOCK
      ?auto_131583 - BLOCK
      ?auto_131584 - BLOCK
    )
    :vars
    (
      ?auto_131585 - BLOCK
      ?auto_131586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131578 ?auto_131579 ) ) ( not ( = ?auto_131578 ?auto_131580 ) ) ( not ( = ?auto_131578 ?auto_131581 ) ) ( not ( = ?auto_131578 ?auto_131582 ) ) ( not ( = ?auto_131578 ?auto_131583 ) ) ( not ( = ?auto_131578 ?auto_131584 ) ) ( not ( = ?auto_131579 ?auto_131580 ) ) ( not ( = ?auto_131579 ?auto_131581 ) ) ( not ( = ?auto_131579 ?auto_131582 ) ) ( not ( = ?auto_131579 ?auto_131583 ) ) ( not ( = ?auto_131579 ?auto_131584 ) ) ( not ( = ?auto_131580 ?auto_131581 ) ) ( not ( = ?auto_131580 ?auto_131582 ) ) ( not ( = ?auto_131580 ?auto_131583 ) ) ( not ( = ?auto_131580 ?auto_131584 ) ) ( not ( = ?auto_131581 ?auto_131582 ) ) ( not ( = ?auto_131581 ?auto_131583 ) ) ( not ( = ?auto_131581 ?auto_131584 ) ) ( not ( = ?auto_131582 ?auto_131583 ) ) ( not ( = ?auto_131582 ?auto_131584 ) ) ( not ( = ?auto_131583 ?auto_131584 ) ) ( not ( = ?auto_131578 ?auto_131585 ) ) ( not ( = ?auto_131579 ?auto_131585 ) ) ( not ( = ?auto_131580 ?auto_131585 ) ) ( not ( = ?auto_131581 ?auto_131585 ) ) ( not ( = ?auto_131582 ?auto_131585 ) ) ( not ( = ?auto_131583 ?auto_131585 ) ) ( not ( = ?auto_131584 ?auto_131585 ) ) ( ON-TABLE ?auto_131585 ) ( ON ?auto_131578 ?auto_131586 ) ( not ( = ?auto_131578 ?auto_131586 ) ) ( not ( = ?auto_131579 ?auto_131586 ) ) ( not ( = ?auto_131580 ?auto_131586 ) ) ( not ( = ?auto_131581 ?auto_131586 ) ) ( not ( = ?auto_131582 ?auto_131586 ) ) ( not ( = ?auto_131583 ?auto_131586 ) ) ( not ( = ?auto_131584 ?auto_131586 ) ) ( not ( = ?auto_131585 ?auto_131586 ) ) ( ON ?auto_131579 ?auto_131578 ) ( ON-TABLE ?auto_131586 ) ( ON ?auto_131580 ?auto_131579 ) ( ON ?auto_131581 ?auto_131580 ) ( ON ?auto_131582 ?auto_131581 ) ( ON ?auto_131583 ?auto_131582 ) ( CLEAR ?auto_131585 ) ( ON ?auto_131584 ?auto_131583 ) ( CLEAR ?auto_131584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131586 ?auto_131578 ?auto_131579 ?auto_131580 ?auto_131581 ?auto_131582 ?auto_131583 )
      ( MAKE-7PILE ?auto_131578 ?auto_131579 ?auto_131580 ?auto_131581 ?auto_131582 ?auto_131583 ?auto_131584 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131587 - BLOCK
      ?auto_131588 - BLOCK
      ?auto_131589 - BLOCK
      ?auto_131590 - BLOCK
      ?auto_131591 - BLOCK
      ?auto_131592 - BLOCK
      ?auto_131593 - BLOCK
    )
    :vars
    (
      ?auto_131595 - BLOCK
      ?auto_131594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131587 ?auto_131588 ) ) ( not ( = ?auto_131587 ?auto_131589 ) ) ( not ( = ?auto_131587 ?auto_131590 ) ) ( not ( = ?auto_131587 ?auto_131591 ) ) ( not ( = ?auto_131587 ?auto_131592 ) ) ( not ( = ?auto_131587 ?auto_131593 ) ) ( not ( = ?auto_131588 ?auto_131589 ) ) ( not ( = ?auto_131588 ?auto_131590 ) ) ( not ( = ?auto_131588 ?auto_131591 ) ) ( not ( = ?auto_131588 ?auto_131592 ) ) ( not ( = ?auto_131588 ?auto_131593 ) ) ( not ( = ?auto_131589 ?auto_131590 ) ) ( not ( = ?auto_131589 ?auto_131591 ) ) ( not ( = ?auto_131589 ?auto_131592 ) ) ( not ( = ?auto_131589 ?auto_131593 ) ) ( not ( = ?auto_131590 ?auto_131591 ) ) ( not ( = ?auto_131590 ?auto_131592 ) ) ( not ( = ?auto_131590 ?auto_131593 ) ) ( not ( = ?auto_131591 ?auto_131592 ) ) ( not ( = ?auto_131591 ?auto_131593 ) ) ( not ( = ?auto_131592 ?auto_131593 ) ) ( not ( = ?auto_131587 ?auto_131595 ) ) ( not ( = ?auto_131588 ?auto_131595 ) ) ( not ( = ?auto_131589 ?auto_131595 ) ) ( not ( = ?auto_131590 ?auto_131595 ) ) ( not ( = ?auto_131591 ?auto_131595 ) ) ( not ( = ?auto_131592 ?auto_131595 ) ) ( not ( = ?auto_131593 ?auto_131595 ) ) ( ON ?auto_131587 ?auto_131594 ) ( not ( = ?auto_131587 ?auto_131594 ) ) ( not ( = ?auto_131588 ?auto_131594 ) ) ( not ( = ?auto_131589 ?auto_131594 ) ) ( not ( = ?auto_131590 ?auto_131594 ) ) ( not ( = ?auto_131591 ?auto_131594 ) ) ( not ( = ?auto_131592 ?auto_131594 ) ) ( not ( = ?auto_131593 ?auto_131594 ) ) ( not ( = ?auto_131595 ?auto_131594 ) ) ( ON ?auto_131588 ?auto_131587 ) ( ON-TABLE ?auto_131594 ) ( ON ?auto_131589 ?auto_131588 ) ( ON ?auto_131590 ?auto_131589 ) ( ON ?auto_131591 ?auto_131590 ) ( ON ?auto_131592 ?auto_131591 ) ( ON ?auto_131593 ?auto_131592 ) ( CLEAR ?auto_131593 ) ( HOLDING ?auto_131595 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131595 )
      ( MAKE-7PILE ?auto_131587 ?auto_131588 ?auto_131589 ?auto_131590 ?auto_131591 ?auto_131592 ?auto_131593 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131596 - BLOCK
      ?auto_131597 - BLOCK
      ?auto_131598 - BLOCK
      ?auto_131599 - BLOCK
      ?auto_131600 - BLOCK
      ?auto_131601 - BLOCK
      ?auto_131602 - BLOCK
    )
    :vars
    (
      ?auto_131604 - BLOCK
      ?auto_131603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131596 ?auto_131597 ) ) ( not ( = ?auto_131596 ?auto_131598 ) ) ( not ( = ?auto_131596 ?auto_131599 ) ) ( not ( = ?auto_131596 ?auto_131600 ) ) ( not ( = ?auto_131596 ?auto_131601 ) ) ( not ( = ?auto_131596 ?auto_131602 ) ) ( not ( = ?auto_131597 ?auto_131598 ) ) ( not ( = ?auto_131597 ?auto_131599 ) ) ( not ( = ?auto_131597 ?auto_131600 ) ) ( not ( = ?auto_131597 ?auto_131601 ) ) ( not ( = ?auto_131597 ?auto_131602 ) ) ( not ( = ?auto_131598 ?auto_131599 ) ) ( not ( = ?auto_131598 ?auto_131600 ) ) ( not ( = ?auto_131598 ?auto_131601 ) ) ( not ( = ?auto_131598 ?auto_131602 ) ) ( not ( = ?auto_131599 ?auto_131600 ) ) ( not ( = ?auto_131599 ?auto_131601 ) ) ( not ( = ?auto_131599 ?auto_131602 ) ) ( not ( = ?auto_131600 ?auto_131601 ) ) ( not ( = ?auto_131600 ?auto_131602 ) ) ( not ( = ?auto_131601 ?auto_131602 ) ) ( not ( = ?auto_131596 ?auto_131604 ) ) ( not ( = ?auto_131597 ?auto_131604 ) ) ( not ( = ?auto_131598 ?auto_131604 ) ) ( not ( = ?auto_131599 ?auto_131604 ) ) ( not ( = ?auto_131600 ?auto_131604 ) ) ( not ( = ?auto_131601 ?auto_131604 ) ) ( not ( = ?auto_131602 ?auto_131604 ) ) ( ON ?auto_131596 ?auto_131603 ) ( not ( = ?auto_131596 ?auto_131603 ) ) ( not ( = ?auto_131597 ?auto_131603 ) ) ( not ( = ?auto_131598 ?auto_131603 ) ) ( not ( = ?auto_131599 ?auto_131603 ) ) ( not ( = ?auto_131600 ?auto_131603 ) ) ( not ( = ?auto_131601 ?auto_131603 ) ) ( not ( = ?auto_131602 ?auto_131603 ) ) ( not ( = ?auto_131604 ?auto_131603 ) ) ( ON ?auto_131597 ?auto_131596 ) ( ON-TABLE ?auto_131603 ) ( ON ?auto_131598 ?auto_131597 ) ( ON ?auto_131599 ?auto_131598 ) ( ON ?auto_131600 ?auto_131599 ) ( ON ?auto_131601 ?auto_131600 ) ( ON ?auto_131602 ?auto_131601 ) ( ON ?auto_131604 ?auto_131602 ) ( CLEAR ?auto_131604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131603 ?auto_131596 ?auto_131597 ?auto_131598 ?auto_131599 ?auto_131600 ?auto_131601 ?auto_131602 )
      ( MAKE-7PILE ?auto_131596 ?auto_131597 ?auto_131598 ?auto_131599 ?auto_131600 ?auto_131601 ?auto_131602 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131621 - BLOCK
      ?auto_131622 - BLOCK
      ?auto_131623 - BLOCK
      ?auto_131624 - BLOCK
      ?auto_131625 - BLOCK
      ?auto_131626 - BLOCK
      ?auto_131627 - BLOCK
      ?auto_131628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131627 ) ( ON-TABLE ?auto_131621 ) ( ON ?auto_131622 ?auto_131621 ) ( ON ?auto_131623 ?auto_131622 ) ( ON ?auto_131624 ?auto_131623 ) ( ON ?auto_131625 ?auto_131624 ) ( ON ?auto_131626 ?auto_131625 ) ( ON ?auto_131627 ?auto_131626 ) ( not ( = ?auto_131621 ?auto_131622 ) ) ( not ( = ?auto_131621 ?auto_131623 ) ) ( not ( = ?auto_131621 ?auto_131624 ) ) ( not ( = ?auto_131621 ?auto_131625 ) ) ( not ( = ?auto_131621 ?auto_131626 ) ) ( not ( = ?auto_131621 ?auto_131627 ) ) ( not ( = ?auto_131621 ?auto_131628 ) ) ( not ( = ?auto_131622 ?auto_131623 ) ) ( not ( = ?auto_131622 ?auto_131624 ) ) ( not ( = ?auto_131622 ?auto_131625 ) ) ( not ( = ?auto_131622 ?auto_131626 ) ) ( not ( = ?auto_131622 ?auto_131627 ) ) ( not ( = ?auto_131622 ?auto_131628 ) ) ( not ( = ?auto_131623 ?auto_131624 ) ) ( not ( = ?auto_131623 ?auto_131625 ) ) ( not ( = ?auto_131623 ?auto_131626 ) ) ( not ( = ?auto_131623 ?auto_131627 ) ) ( not ( = ?auto_131623 ?auto_131628 ) ) ( not ( = ?auto_131624 ?auto_131625 ) ) ( not ( = ?auto_131624 ?auto_131626 ) ) ( not ( = ?auto_131624 ?auto_131627 ) ) ( not ( = ?auto_131624 ?auto_131628 ) ) ( not ( = ?auto_131625 ?auto_131626 ) ) ( not ( = ?auto_131625 ?auto_131627 ) ) ( not ( = ?auto_131625 ?auto_131628 ) ) ( not ( = ?auto_131626 ?auto_131627 ) ) ( not ( = ?auto_131626 ?auto_131628 ) ) ( not ( = ?auto_131627 ?auto_131628 ) ) ( ON-TABLE ?auto_131628 ) ( CLEAR ?auto_131628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_131628 )
      ( MAKE-8PILE ?auto_131621 ?auto_131622 ?auto_131623 ?auto_131624 ?auto_131625 ?auto_131626 ?auto_131627 ?auto_131628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131629 - BLOCK
      ?auto_131630 - BLOCK
      ?auto_131631 - BLOCK
      ?auto_131632 - BLOCK
      ?auto_131633 - BLOCK
      ?auto_131634 - BLOCK
      ?auto_131635 - BLOCK
      ?auto_131636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131629 ) ( ON ?auto_131630 ?auto_131629 ) ( ON ?auto_131631 ?auto_131630 ) ( ON ?auto_131632 ?auto_131631 ) ( ON ?auto_131633 ?auto_131632 ) ( ON ?auto_131634 ?auto_131633 ) ( not ( = ?auto_131629 ?auto_131630 ) ) ( not ( = ?auto_131629 ?auto_131631 ) ) ( not ( = ?auto_131629 ?auto_131632 ) ) ( not ( = ?auto_131629 ?auto_131633 ) ) ( not ( = ?auto_131629 ?auto_131634 ) ) ( not ( = ?auto_131629 ?auto_131635 ) ) ( not ( = ?auto_131629 ?auto_131636 ) ) ( not ( = ?auto_131630 ?auto_131631 ) ) ( not ( = ?auto_131630 ?auto_131632 ) ) ( not ( = ?auto_131630 ?auto_131633 ) ) ( not ( = ?auto_131630 ?auto_131634 ) ) ( not ( = ?auto_131630 ?auto_131635 ) ) ( not ( = ?auto_131630 ?auto_131636 ) ) ( not ( = ?auto_131631 ?auto_131632 ) ) ( not ( = ?auto_131631 ?auto_131633 ) ) ( not ( = ?auto_131631 ?auto_131634 ) ) ( not ( = ?auto_131631 ?auto_131635 ) ) ( not ( = ?auto_131631 ?auto_131636 ) ) ( not ( = ?auto_131632 ?auto_131633 ) ) ( not ( = ?auto_131632 ?auto_131634 ) ) ( not ( = ?auto_131632 ?auto_131635 ) ) ( not ( = ?auto_131632 ?auto_131636 ) ) ( not ( = ?auto_131633 ?auto_131634 ) ) ( not ( = ?auto_131633 ?auto_131635 ) ) ( not ( = ?auto_131633 ?auto_131636 ) ) ( not ( = ?auto_131634 ?auto_131635 ) ) ( not ( = ?auto_131634 ?auto_131636 ) ) ( not ( = ?auto_131635 ?auto_131636 ) ) ( ON-TABLE ?auto_131636 ) ( CLEAR ?auto_131636 ) ( HOLDING ?auto_131635 ) ( CLEAR ?auto_131634 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131629 ?auto_131630 ?auto_131631 ?auto_131632 ?auto_131633 ?auto_131634 ?auto_131635 )
      ( MAKE-8PILE ?auto_131629 ?auto_131630 ?auto_131631 ?auto_131632 ?auto_131633 ?auto_131634 ?auto_131635 ?auto_131636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131637 - BLOCK
      ?auto_131638 - BLOCK
      ?auto_131639 - BLOCK
      ?auto_131640 - BLOCK
      ?auto_131641 - BLOCK
      ?auto_131642 - BLOCK
      ?auto_131643 - BLOCK
      ?auto_131644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131637 ) ( ON ?auto_131638 ?auto_131637 ) ( ON ?auto_131639 ?auto_131638 ) ( ON ?auto_131640 ?auto_131639 ) ( ON ?auto_131641 ?auto_131640 ) ( ON ?auto_131642 ?auto_131641 ) ( not ( = ?auto_131637 ?auto_131638 ) ) ( not ( = ?auto_131637 ?auto_131639 ) ) ( not ( = ?auto_131637 ?auto_131640 ) ) ( not ( = ?auto_131637 ?auto_131641 ) ) ( not ( = ?auto_131637 ?auto_131642 ) ) ( not ( = ?auto_131637 ?auto_131643 ) ) ( not ( = ?auto_131637 ?auto_131644 ) ) ( not ( = ?auto_131638 ?auto_131639 ) ) ( not ( = ?auto_131638 ?auto_131640 ) ) ( not ( = ?auto_131638 ?auto_131641 ) ) ( not ( = ?auto_131638 ?auto_131642 ) ) ( not ( = ?auto_131638 ?auto_131643 ) ) ( not ( = ?auto_131638 ?auto_131644 ) ) ( not ( = ?auto_131639 ?auto_131640 ) ) ( not ( = ?auto_131639 ?auto_131641 ) ) ( not ( = ?auto_131639 ?auto_131642 ) ) ( not ( = ?auto_131639 ?auto_131643 ) ) ( not ( = ?auto_131639 ?auto_131644 ) ) ( not ( = ?auto_131640 ?auto_131641 ) ) ( not ( = ?auto_131640 ?auto_131642 ) ) ( not ( = ?auto_131640 ?auto_131643 ) ) ( not ( = ?auto_131640 ?auto_131644 ) ) ( not ( = ?auto_131641 ?auto_131642 ) ) ( not ( = ?auto_131641 ?auto_131643 ) ) ( not ( = ?auto_131641 ?auto_131644 ) ) ( not ( = ?auto_131642 ?auto_131643 ) ) ( not ( = ?auto_131642 ?auto_131644 ) ) ( not ( = ?auto_131643 ?auto_131644 ) ) ( ON-TABLE ?auto_131644 ) ( CLEAR ?auto_131642 ) ( ON ?auto_131643 ?auto_131644 ) ( CLEAR ?auto_131643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131644 )
      ( MAKE-8PILE ?auto_131637 ?auto_131638 ?auto_131639 ?auto_131640 ?auto_131641 ?auto_131642 ?auto_131643 ?auto_131644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131645 - BLOCK
      ?auto_131646 - BLOCK
      ?auto_131647 - BLOCK
      ?auto_131648 - BLOCK
      ?auto_131649 - BLOCK
      ?auto_131650 - BLOCK
      ?auto_131651 - BLOCK
      ?auto_131652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131645 ) ( ON ?auto_131646 ?auto_131645 ) ( ON ?auto_131647 ?auto_131646 ) ( ON ?auto_131648 ?auto_131647 ) ( ON ?auto_131649 ?auto_131648 ) ( not ( = ?auto_131645 ?auto_131646 ) ) ( not ( = ?auto_131645 ?auto_131647 ) ) ( not ( = ?auto_131645 ?auto_131648 ) ) ( not ( = ?auto_131645 ?auto_131649 ) ) ( not ( = ?auto_131645 ?auto_131650 ) ) ( not ( = ?auto_131645 ?auto_131651 ) ) ( not ( = ?auto_131645 ?auto_131652 ) ) ( not ( = ?auto_131646 ?auto_131647 ) ) ( not ( = ?auto_131646 ?auto_131648 ) ) ( not ( = ?auto_131646 ?auto_131649 ) ) ( not ( = ?auto_131646 ?auto_131650 ) ) ( not ( = ?auto_131646 ?auto_131651 ) ) ( not ( = ?auto_131646 ?auto_131652 ) ) ( not ( = ?auto_131647 ?auto_131648 ) ) ( not ( = ?auto_131647 ?auto_131649 ) ) ( not ( = ?auto_131647 ?auto_131650 ) ) ( not ( = ?auto_131647 ?auto_131651 ) ) ( not ( = ?auto_131647 ?auto_131652 ) ) ( not ( = ?auto_131648 ?auto_131649 ) ) ( not ( = ?auto_131648 ?auto_131650 ) ) ( not ( = ?auto_131648 ?auto_131651 ) ) ( not ( = ?auto_131648 ?auto_131652 ) ) ( not ( = ?auto_131649 ?auto_131650 ) ) ( not ( = ?auto_131649 ?auto_131651 ) ) ( not ( = ?auto_131649 ?auto_131652 ) ) ( not ( = ?auto_131650 ?auto_131651 ) ) ( not ( = ?auto_131650 ?auto_131652 ) ) ( not ( = ?auto_131651 ?auto_131652 ) ) ( ON-TABLE ?auto_131652 ) ( ON ?auto_131651 ?auto_131652 ) ( CLEAR ?auto_131651 ) ( HOLDING ?auto_131650 ) ( CLEAR ?auto_131649 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131645 ?auto_131646 ?auto_131647 ?auto_131648 ?auto_131649 ?auto_131650 )
      ( MAKE-8PILE ?auto_131645 ?auto_131646 ?auto_131647 ?auto_131648 ?auto_131649 ?auto_131650 ?auto_131651 ?auto_131652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131653 - BLOCK
      ?auto_131654 - BLOCK
      ?auto_131655 - BLOCK
      ?auto_131656 - BLOCK
      ?auto_131657 - BLOCK
      ?auto_131658 - BLOCK
      ?auto_131659 - BLOCK
      ?auto_131660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131653 ) ( ON ?auto_131654 ?auto_131653 ) ( ON ?auto_131655 ?auto_131654 ) ( ON ?auto_131656 ?auto_131655 ) ( ON ?auto_131657 ?auto_131656 ) ( not ( = ?auto_131653 ?auto_131654 ) ) ( not ( = ?auto_131653 ?auto_131655 ) ) ( not ( = ?auto_131653 ?auto_131656 ) ) ( not ( = ?auto_131653 ?auto_131657 ) ) ( not ( = ?auto_131653 ?auto_131658 ) ) ( not ( = ?auto_131653 ?auto_131659 ) ) ( not ( = ?auto_131653 ?auto_131660 ) ) ( not ( = ?auto_131654 ?auto_131655 ) ) ( not ( = ?auto_131654 ?auto_131656 ) ) ( not ( = ?auto_131654 ?auto_131657 ) ) ( not ( = ?auto_131654 ?auto_131658 ) ) ( not ( = ?auto_131654 ?auto_131659 ) ) ( not ( = ?auto_131654 ?auto_131660 ) ) ( not ( = ?auto_131655 ?auto_131656 ) ) ( not ( = ?auto_131655 ?auto_131657 ) ) ( not ( = ?auto_131655 ?auto_131658 ) ) ( not ( = ?auto_131655 ?auto_131659 ) ) ( not ( = ?auto_131655 ?auto_131660 ) ) ( not ( = ?auto_131656 ?auto_131657 ) ) ( not ( = ?auto_131656 ?auto_131658 ) ) ( not ( = ?auto_131656 ?auto_131659 ) ) ( not ( = ?auto_131656 ?auto_131660 ) ) ( not ( = ?auto_131657 ?auto_131658 ) ) ( not ( = ?auto_131657 ?auto_131659 ) ) ( not ( = ?auto_131657 ?auto_131660 ) ) ( not ( = ?auto_131658 ?auto_131659 ) ) ( not ( = ?auto_131658 ?auto_131660 ) ) ( not ( = ?auto_131659 ?auto_131660 ) ) ( ON-TABLE ?auto_131660 ) ( ON ?auto_131659 ?auto_131660 ) ( CLEAR ?auto_131657 ) ( ON ?auto_131658 ?auto_131659 ) ( CLEAR ?auto_131658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131660 ?auto_131659 )
      ( MAKE-8PILE ?auto_131653 ?auto_131654 ?auto_131655 ?auto_131656 ?auto_131657 ?auto_131658 ?auto_131659 ?auto_131660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131661 - BLOCK
      ?auto_131662 - BLOCK
      ?auto_131663 - BLOCK
      ?auto_131664 - BLOCK
      ?auto_131665 - BLOCK
      ?auto_131666 - BLOCK
      ?auto_131667 - BLOCK
      ?auto_131668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131661 ) ( ON ?auto_131662 ?auto_131661 ) ( ON ?auto_131663 ?auto_131662 ) ( ON ?auto_131664 ?auto_131663 ) ( not ( = ?auto_131661 ?auto_131662 ) ) ( not ( = ?auto_131661 ?auto_131663 ) ) ( not ( = ?auto_131661 ?auto_131664 ) ) ( not ( = ?auto_131661 ?auto_131665 ) ) ( not ( = ?auto_131661 ?auto_131666 ) ) ( not ( = ?auto_131661 ?auto_131667 ) ) ( not ( = ?auto_131661 ?auto_131668 ) ) ( not ( = ?auto_131662 ?auto_131663 ) ) ( not ( = ?auto_131662 ?auto_131664 ) ) ( not ( = ?auto_131662 ?auto_131665 ) ) ( not ( = ?auto_131662 ?auto_131666 ) ) ( not ( = ?auto_131662 ?auto_131667 ) ) ( not ( = ?auto_131662 ?auto_131668 ) ) ( not ( = ?auto_131663 ?auto_131664 ) ) ( not ( = ?auto_131663 ?auto_131665 ) ) ( not ( = ?auto_131663 ?auto_131666 ) ) ( not ( = ?auto_131663 ?auto_131667 ) ) ( not ( = ?auto_131663 ?auto_131668 ) ) ( not ( = ?auto_131664 ?auto_131665 ) ) ( not ( = ?auto_131664 ?auto_131666 ) ) ( not ( = ?auto_131664 ?auto_131667 ) ) ( not ( = ?auto_131664 ?auto_131668 ) ) ( not ( = ?auto_131665 ?auto_131666 ) ) ( not ( = ?auto_131665 ?auto_131667 ) ) ( not ( = ?auto_131665 ?auto_131668 ) ) ( not ( = ?auto_131666 ?auto_131667 ) ) ( not ( = ?auto_131666 ?auto_131668 ) ) ( not ( = ?auto_131667 ?auto_131668 ) ) ( ON-TABLE ?auto_131668 ) ( ON ?auto_131667 ?auto_131668 ) ( ON ?auto_131666 ?auto_131667 ) ( CLEAR ?auto_131666 ) ( HOLDING ?auto_131665 ) ( CLEAR ?auto_131664 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131661 ?auto_131662 ?auto_131663 ?auto_131664 ?auto_131665 )
      ( MAKE-8PILE ?auto_131661 ?auto_131662 ?auto_131663 ?auto_131664 ?auto_131665 ?auto_131666 ?auto_131667 ?auto_131668 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131669 - BLOCK
      ?auto_131670 - BLOCK
      ?auto_131671 - BLOCK
      ?auto_131672 - BLOCK
      ?auto_131673 - BLOCK
      ?auto_131674 - BLOCK
      ?auto_131675 - BLOCK
      ?auto_131676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131669 ) ( ON ?auto_131670 ?auto_131669 ) ( ON ?auto_131671 ?auto_131670 ) ( ON ?auto_131672 ?auto_131671 ) ( not ( = ?auto_131669 ?auto_131670 ) ) ( not ( = ?auto_131669 ?auto_131671 ) ) ( not ( = ?auto_131669 ?auto_131672 ) ) ( not ( = ?auto_131669 ?auto_131673 ) ) ( not ( = ?auto_131669 ?auto_131674 ) ) ( not ( = ?auto_131669 ?auto_131675 ) ) ( not ( = ?auto_131669 ?auto_131676 ) ) ( not ( = ?auto_131670 ?auto_131671 ) ) ( not ( = ?auto_131670 ?auto_131672 ) ) ( not ( = ?auto_131670 ?auto_131673 ) ) ( not ( = ?auto_131670 ?auto_131674 ) ) ( not ( = ?auto_131670 ?auto_131675 ) ) ( not ( = ?auto_131670 ?auto_131676 ) ) ( not ( = ?auto_131671 ?auto_131672 ) ) ( not ( = ?auto_131671 ?auto_131673 ) ) ( not ( = ?auto_131671 ?auto_131674 ) ) ( not ( = ?auto_131671 ?auto_131675 ) ) ( not ( = ?auto_131671 ?auto_131676 ) ) ( not ( = ?auto_131672 ?auto_131673 ) ) ( not ( = ?auto_131672 ?auto_131674 ) ) ( not ( = ?auto_131672 ?auto_131675 ) ) ( not ( = ?auto_131672 ?auto_131676 ) ) ( not ( = ?auto_131673 ?auto_131674 ) ) ( not ( = ?auto_131673 ?auto_131675 ) ) ( not ( = ?auto_131673 ?auto_131676 ) ) ( not ( = ?auto_131674 ?auto_131675 ) ) ( not ( = ?auto_131674 ?auto_131676 ) ) ( not ( = ?auto_131675 ?auto_131676 ) ) ( ON-TABLE ?auto_131676 ) ( ON ?auto_131675 ?auto_131676 ) ( ON ?auto_131674 ?auto_131675 ) ( CLEAR ?auto_131672 ) ( ON ?auto_131673 ?auto_131674 ) ( CLEAR ?auto_131673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131676 ?auto_131675 ?auto_131674 )
      ( MAKE-8PILE ?auto_131669 ?auto_131670 ?auto_131671 ?auto_131672 ?auto_131673 ?auto_131674 ?auto_131675 ?auto_131676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131677 - BLOCK
      ?auto_131678 - BLOCK
      ?auto_131679 - BLOCK
      ?auto_131680 - BLOCK
      ?auto_131681 - BLOCK
      ?auto_131682 - BLOCK
      ?auto_131683 - BLOCK
      ?auto_131684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131677 ) ( ON ?auto_131678 ?auto_131677 ) ( ON ?auto_131679 ?auto_131678 ) ( not ( = ?auto_131677 ?auto_131678 ) ) ( not ( = ?auto_131677 ?auto_131679 ) ) ( not ( = ?auto_131677 ?auto_131680 ) ) ( not ( = ?auto_131677 ?auto_131681 ) ) ( not ( = ?auto_131677 ?auto_131682 ) ) ( not ( = ?auto_131677 ?auto_131683 ) ) ( not ( = ?auto_131677 ?auto_131684 ) ) ( not ( = ?auto_131678 ?auto_131679 ) ) ( not ( = ?auto_131678 ?auto_131680 ) ) ( not ( = ?auto_131678 ?auto_131681 ) ) ( not ( = ?auto_131678 ?auto_131682 ) ) ( not ( = ?auto_131678 ?auto_131683 ) ) ( not ( = ?auto_131678 ?auto_131684 ) ) ( not ( = ?auto_131679 ?auto_131680 ) ) ( not ( = ?auto_131679 ?auto_131681 ) ) ( not ( = ?auto_131679 ?auto_131682 ) ) ( not ( = ?auto_131679 ?auto_131683 ) ) ( not ( = ?auto_131679 ?auto_131684 ) ) ( not ( = ?auto_131680 ?auto_131681 ) ) ( not ( = ?auto_131680 ?auto_131682 ) ) ( not ( = ?auto_131680 ?auto_131683 ) ) ( not ( = ?auto_131680 ?auto_131684 ) ) ( not ( = ?auto_131681 ?auto_131682 ) ) ( not ( = ?auto_131681 ?auto_131683 ) ) ( not ( = ?auto_131681 ?auto_131684 ) ) ( not ( = ?auto_131682 ?auto_131683 ) ) ( not ( = ?auto_131682 ?auto_131684 ) ) ( not ( = ?auto_131683 ?auto_131684 ) ) ( ON-TABLE ?auto_131684 ) ( ON ?auto_131683 ?auto_131684 ) ( ON ?auto_131682 ?auto_131683 ) ( ON ?auto_131681 ?auto_131682 ) ( CLEAR ?auto_131681 ) ( HOLDING ?auto_131680 ) ( CLEAR ?auto_131679 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131677 ?auto_131678 ?auto_131679 ?auto_131680 )
      ( MAKE-8PILE ?auto_131677 ?auto_131678 ?auto_131679 ?auto_131680 ?auto_131681 ?auto_131682 ?auto_131683 ?auto_131684 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131685 - BLOCK
      ?auto_131686 - BLOCK
      ?auto_131687 - BLOCK
      ?auto_131688 - BLOCK
      ?auto_131689 - BLOCK
      ?auto_131690 - BLOCK
      ?auto_131691 - BLOCK
      ?auto_131692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131685 ) ( ON ?auto_131686 ?auto_131685 ) ( ON ?auto_131687 ?auto_131686 ) ( not ( = ?auto_131685 ?auto_131686 ) ) ( not ( = ?auto_131685 ?auto_131687 ) ) ( not ( = ?auto_131685 ?auto_131688 ) ) ( not ( = ?auto_131685 ?auto_131689 ) ) ( not ( = ?auto_131685 ?auto_131690 ) ) ( not ( = ?auto_131685 ?auto_131691 ) ) ( not ( = ?auto_131685 ?auto_131692 ) ) ( not ( = ?auto_131686 ?auto_131687 ) ) ( not ( = ?auto_131686 ?auto_131688 ) ) ( not ( = ?auto_131686 ?auto_131689 ) ) ( not ( = ?auto_131686 ?auto_131690 ) ) ( not ( = ?auto_131686 ?auto_131691 ) ) ( not ( = ?auto_131686 ?auto_131692 ) ) ( not ( = ?auto_131687 ?auto_131688 ) ) ( not ( = ?auto_131687 ?auto_131689 ) ) ( not ( = ?auto_131687 ?auto_131690 ) ) ( not ( = ?auto_131687 ?auto_131691 ) ) ( not ( = ?auto_131687 ?auto_131692 ) ) ( not ( = ?auto_131688 ?auto_131689 ) ) ( not ( = ?auto_131688 ?auto_131690 ) ) ( not ( = ?auto_131688 ?auto_131691 ) ) ( not ( = ?auto_131688 ?auto_131692 ) ) ( not ( = ?auto_131689 ?auto_131690 ) ) ( not ( = ?auto_131689 ?auto_131691 ) ) ( not ( = ?auto_131689 ?auto_131692 ) ) ( not ( = ?auto_131690 ?auto_131691 ) ) ( not ( = ?auto_131690 ?auto_131692 ) ) ( not ( = ?auto_131691 ?auto_131692 ) ) ( ON-TABLE ?auto_131692 ) ( ON ?auto_131691 ?auto_131692 ) ( ON ?auto_131690 ?auto_131691 ) ( ON ?auto_131689 ?auto_131690 ) ( CLEAR ?auto_131687 ) ( ON ?auto_131688 ?auto_131689 ) ( CLEAR ?auto_131688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131692 ?auto_131691 ?auto_131690 ?auto_131689 )
      ( MAKE-8PILE ?auto_131685 ?auto_131686 ?auto_131687 ?auto_131688 ?auto_131689 ?auto_131690 ?auto_131691 ?auto_131692 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131693 - BLOCK
      ?auto_131694 - BLOCK
      ?auto_131695 - BLOCK
      ?auto_131696 - BLOCK
      ?auto_131697 - BLOCK
      ?auto_131698 - BLOCK
      ?auto_131699 - BLOCK
      ?auto_131700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131693 ) ( ON ?auto_131694 ?auto_131693 ) ( not ( = ?auto_131693 ?auto_131694 ) ) ( not ( = ?auto_131693 ?auto_131695 ) ) ( not ( = ?auto_131693 ?auto_131696 ) ) ( not ( = ?auto_131693 ?auto_131697 ) ) ( not ( = ?auto_131693 ?auto_131698 ) ) ( not ( = ?auto_131693 ?auto_131699 ) ) ( not ( = ?auto_131693 ?auto_131700 ) ) ( not ( = ?auto_131694 ?auto_131695 ) ) ( not ( = ?auto_131694 ?auto_131696 ) ) ( not ( = ?auto_131694 ?auto_131697 ) ) ( not ( = ?auto_131694 ?auto_131698 ) ) ( not ( = ?auto_131694 ?auto_131699 ) ) ( not ( = ?auto_131694 ?auto_131700 ) ) ( not ( = ?auto_131695 ?auto_131696 ) ) ( not ( = ?auto_131695 ?auto_131697 ) ) ( not ( = ?auto_131695 ?auto_131698 ) ) ( not ( = ?auto_131695 ?auto_131699 ) ) ( not ( = ?auto_131695 ?auto_131700 ) ) ( not ( = ?auto_131696 ?auto_131697 ) ) ( not ( = ?auto_131696 ?auto_131698 ) ) ( not ( = ?auto_131696 ?auto_131699 ) ) ( not ( = ?auto_131696 ?auto_131700 ) ) ( not ( = ?auto_131697 ?auto_131698 ) ) ( not ( = ?auto_131697 ?auto_131699 ) ) ( not ( = ?auto_131697 ?auto_131700 ) ) ( not ( = ?auto_131698 ?auto_131699 ) ) ( not ( = ?auto_131698 ?auto_131700 ) ) ( not ( = ?auto_131699 ?auto_131700 ) ) ( ON-TABLE ?auto_131700 ) ( ON ?auto_131699 ?auto_131700 ) ( ON ?auto_131698 ?auto_131699 ) ( ON ?auto_131697 ?auto_131698 ) ( ON ?auto_131696 ?auto_131697 ) ( CLEAR ?auto_131696 ) ( HOLDING ?auto_131695 ) ( CLEAR ?auto_131694 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131693 ?auto_131694 ?auto_131695 )
      ( MAKE-8PILE ?auto_131693 ?auto_131694 ?auto_131695 ?auto_131696 ?auto_131697 ?auto_131698 ?auto_131699 ?auto_131700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131701 - BLOCK
      ?auto_131702 - BLOCK
      ?auto_131703 - BLOCK
      ?auto_131704 - BLOCK
      ?auto_131705 - BLOCK
      ?auto_131706 - BLOCK
      ?auto_131707 - BLOCK
      ?auto_131708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131701 ) ( ON ?auto_131702 ?auto_131701 ) ( not ( = ?auto_131701 ?auto_131702 ) ) ( not ( = ?auto_131701 ?auto_131703 ) ) ( not ( = ?auto_131701 ?auto_131704 ) ) ( not ( = ?auto_131701 ?auto_131705 ) ) ( not ( = ?auto_131701 ?auto_131706 ) ) ( not ( = ?auto_131701 ?auto_131707 ) ) ( not ( = ?auto_131701 ?auto_131708 ) ) ( not ( = ?auto_131702 ?auto_131703 ) ) ( not ( = ?auto_131702 ?auto_131704 ) ) ( not ( = ?auto_131702 ?auto_131705 ) ) ( not ( = ?auto_131702 ?auto_131706 ) ) ( not ( = ?auto_131702 ?auto_131707 ) ) ( not ( = ?auto_131702 ?auto_131708 ) ) ( not ( = ?auto_131703 ?auto_131704 ) ) ( not ( = ?auto_131703 ?auto_131705 ) ) ( not ( = ?auto_131703 ?auto_131706 ) ) ( not ( = ?auto_131703 ?auto_131707 ) ) ( not ( = ?auto_131703 ?auto_131708 ) ) ( not ( = ?auto_131704 ?auto_131705 ) ) ( not ( = ?auto_131704 ?auto_131706 ) ) ( not ( = ?auto_131704 ?auto_131707 ) ) ( not ( = ?auto_131704 ?auto_131708 ) ) ( not ( = ?auto_131705 ?auto_131706 ) ) ( not ( = ?auto_131705 ?auto_131707 ) ) ( not ( = ?auto_131705 ?auto_131708 ) ) ( not ( = ?auto_131706 ?auto_131707 ) ) ( not ( = ?auto_131706 ?auto_131708 ) ) ( not ( = ?auto_131707 ?auto_131708 ) ) ( ON-TABLE ?auto_131708 ) ( ON ?auto_131707 ?auto_131708 ) ( ON ?auto_131706 ?auto_131707 ) ( ON ?auto_131705 ?auto_131706 ) ( ON ?auto_131704 ?auto_131705 ) ( CLEAR ?auto_131702 ) ( ON ?auto_131703 ?auto_131704 ) ( CLEAR ?auto_131703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131708 ?auto_131707 ?auto_131706 ?auto_131705 ?auto_131704 )
      ( MAKE-8PILE ?auto_131701 ?auto_131702 ?auto_131703 ?auto_131704 ?auto_131705 ?auto_131706 ?auto_131707 ?auto_131708 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131709 - BLOCK
      ?auto_131710 - BLOCK
      ?auto_131711 - BLOCK
      ?auto_131712 - BLOCK
      ?auto_131713 - BLOCK
      ?auto_131714 - BLOCK
      ?auto_131715 - BLOCK
      ?auto_131716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131709 ) ( not ( = ?auto_131709 ?auto_131710 ) ) ( not ( = ?auto_131709 ?auto_131711 ) ) ( not ( = ?auto_131709 ?auto_131712 ) ) ( not ( = ?auto_131709 ?auto_131713 ) ) ( not ( = ?auto_131709 ?auto_131714 ) ) ( not ( = ?auto_131709 ?auto_131715 ) ) ( not ( = ?auto_131709 ?auto_131716 ) ) ( not ( = ?auto_131710 ?auto_131711 ) ) ( not ( = ?auto_131710 ?auto_131712 ) ) ( not ( = ?auto_131710 ?auto_131713 ) ) ( not ( = ?auto_131710 ?auto_131714 ) ) ( not ( = ?auto_131710 ?auto_131715 ) ) ( not ( = ?auto_131710 ?auto_131716 ) ) ( not ( = ?auto_131711 ?auto_131712 ) ) ( not ( = ?auto_131711 ?auto_131713 ) ) ( not ( = ?auto_131711 ?auto_131714 ) ) ( not ( = ?auto_131711 ?auto_131715 ) ) ( not ( = ?auto_131711 ?auto_131716 ) ) ( not ( = ?auto_131712 ?auto_131713 ) ) ( not ( = ?auto_131712 ?auto_131714 ) ) ( not ( = ?auto_131712 ?auto_131715 ) ) ( not ( = ?auto_131712 ?auto_131716 ) ) ( not ( = ?auto_131713 ?auto_131714 ) ) ( not ( = ?auto_131713 ?auto_131715 ) ) ( not ( = ?auto_131713 ?auto_131716 ) ) ( not ( = ?auto_131714 ?auto_131715 ) ) ( not ( = ?auto_131714 ?auto_131716 ) ) ( not ( = ?auto_131715 ?auto_131716 ) ) ( ON-TABLE ?auto_131716 ) ( ON ?auto_131715 ?auto_131716 ) ( ON ?auto_131714 ?auto_131715 ) ( ON ?auto_131713 ?auto_131714 ) ( ON ?auto_131712 ?auto_131713 ) ( ON ?auto_131711 ?auto_131712 ) ( CLEAR ?auto_131711 ) ( HOLDING ?auto_131710 ) ( CLEAR ?auto_131709 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131709 ?auto_131710 )
      ( MAKE-8PILE ?auto_131709 ?auto_131710 ?auto_131711 ?auto_131712 ?auto_131713 ?auto_131714 ?auto_131715 ?auto_131716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131717 - BLOCK
      ?auto_131718 - BLOCK
      ?auto_131719 - BLOCK
      ?auto_131720 - BLOCK
      ?auto_131721 - BLOCK
      ?auto_131722 - BLOCK
      ?auto_131723 - BLOCK
      ?auto_131724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_131717 ) ( not ( = ?auto_131717 ?auto_131718 ) ) ( not ( = ?auto_131717 ?auto_131719 ) ) ( not ( = ?auto_131717 ?auto_131720 ) ) ( not ( = ?auto_131717 ?auto_131721 ) ) ( not ( = ?auto_131717 ?auto_131722 ) ) ( not ( = ?auto_131717 ?auto_131723 ) ) ( not ( = ?auto_131717 ?auto_131724 ) ) ( not ( = ?auto_131718 ?auto_131719 ) ) ( not ( = ?auto_131718 ?auto_131720 ) ) ( not ( = ?auto_131718 ?auto_131721 ) ) ( not ( = ?auto_131718 ?auto_131722 ) ) ( not ( = ?auto_131718 ?auto_131723 ) ) ( not ( = ?auto_131718 ?auto_131724 ) ) ( not ( = ?auto_131719 ?auto_131720 ) ) ( not ( = ?auto_131719 ?auto_131721 ) ) ( not ( = ?auto_131719 ?auto_131722 ) ) ( not ( = ?auto_131719 ?auto_131723 ) ) ( not ( = ?auto_131719 ?auto_131724 ) ) ( not ( = ?auto_131720 ?auto_131721 ) ) ( not ( = ?auto_131720 ?auto_131722 ) ) ( not ( = ?auto_131720 ?auto_131723 ) ) ( not ( = ?auto_131720 ?auto_131724 ) ) ( not ( = ?auto_131721 ?auto_131722 ) ) ( not ( = ?auto_131721 ?auto_131723 ) ) ( not ( = ?auto_131721 ?auto_131724 ) ) ( not ( = ?auto_131722 ?auto_131723 ) ) ( not ( = ?auto_131722 ?auto_131724 ) ) ( not ( = ?auto_131723 ?auto_131724 ) ) ( ON-TABLE ?auto_131724 ) ( ON ?auto_131723 ?auto_131724 ) ( ON ?auto_131722 ?auto_131723 ) ( ON ?auto_131721 ?auto_131722 ) ( ON ?auto_131720 ?auto_131721 ) ( ON ?auto_131719 ?auto_131720 ) ( CLEAR ?auto_131717 ) ( ON ?auto_131718 ?auto_131719 ) ( CLEAR ?auto_131718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131724 ?auto_131723 ?auto_131722 ?auto_131721 ?auto_131720 ?auto_131719 )
      ( MAKE-8PILE ?auto_131717 ?auto_131718 ?auto_131719 ?auto_131720 ?auto_131721 ?auto_131722 ?auto_131723 ?auto_131724 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131725 - BLOCK
      ?auto_131726 - BLOCK
      ?auto_131727 - BLOCK
      ?auto_131728 - BLOCK
      ?auto_131729 - BLOCK
      ?auto_131730 - BLOCK
      ?auto_131731 - BLOCK
      ?auto_131732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131725 ?auto_131726 ) ) ( not ( = ?auto_131725 ?auto_131727 ) ) ( not ( = ?auto_131725 ?auto_131728 ) ) ( not ( = ?auto_131725 ?auto_131729 ) ) ( not ( = ?auto_131725 ?auto_131730 ) ) ( not ( = ?auto_131725 ?auto_131731 ) ) ( not ( = ?auto_131725 ?auto_131732 ) ) ( not ( = ?auto_131726 ?auto_131727 ) ) ( not ( = ?auto_131726 ?auto_131728 ) ) ( not ( = ?auto_131726 ?auto_131729 ) ) ( not ( = ?auto_131726 ?auto_131730 ) ) ( not ( = ?auto_131726 ?auto_131731 ) ) ( not ( = ?auto_131726 ?auto_131732 ) ) ( not ( = ?auto_131727 ?auto_131728 ) ) ( not ( = ?auto_131727 ?auto_131729 ) ) ( not ( = ?auto_131727 ?auto_131730 ) ) ( not ( = ?auto_131727 ?auto_131731 ) ) ( not ( = ?auto_131727 ?auto_131732 ) ) ( not ( = ?auto_131728 ?auto_131729 ) ) ( not ( = ?auto_131728 ?auto_131730 ) ) ( not ( = ?auto_131728 ?auto_131731 ) ) ( not ( = ?auto_131728 ?auto_131732 ) ) ( not ( = ?auto_131729 ?auto_131730 ) ) ( not ( = ?auto_131729 ?auto_131731 ) ) ( not ( = ?auto_131729 ?auto_131732 ) ) ( not ( = ?auto_131730 ?auto_131731 ) ) ( not ( = ?auto_131730 ?auto_131732 ) ) ( not ( = ?auto_131731 ?auto_131732 ) ) ( ON-TABLE ?auto_131732 ) ( ON ?auto_131731 ?auto_131732 ) ( ON ?auto_131730 ?auto_131731 ) ( ON ?auto_131729 ?auto_131730 ) ( ON ?auto_131728 ?auto_131729 ) ( ON ?auto_131727 ?auto_131728 ) ( ON ?auto_131726 ?auto_131727 ) ( CLEAR ?auto_131726 ) ( HOLDING ?auto_131725 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131725 )
      ( MAKE-8PILE ?auto_131725 ?auto_131726 ?auto_131727 ?auto_131728 ?auto_131729 ?auto_131730 ?auto_131731 ?auto_131732 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131733 - BLOCK
      ?auto_131734 - BLOCK
      ?auto_131735 - BLOCK
      ?auto_131736 - BLOCK
      ?auto_131737 - BLOCK
      ?auto_131738 - BLOCK
      ?auto_131739 - BLOCK
      ?auto_131740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131733 ?auto_131734 ) ) ( not ( = ?auto_131733 ?auto_131735 ) ) ( not ( = ?auto_131733 ?auto_131736 ) ) ( not ( = ?auto_131733 ?auto_131737 ) ) ( not ( = ?auto_131733 ?auto_131738 ) ) ( not ( = ?auto_131733 ?auto_131739 ) ) ( not ( = ?auto_131733 ?auto_131740 ) ) ( not ( = ?auto_131734 ?auto_131735 ) ) ( not ( = ?auto_131734 ?auto_131736 ) ) ( not ( = ?auto_131734 ?auto_131737 ) ) ( not ( = ?auto_131734 ?auto_131738 ) ) ( not ( = ?auto_131734 ?auto_131739 ) ) ( not ( = ?auto_131734 ?auto_131740 ) ) ( not ( = ?auto_131735 ?auto_131736 ) ) ( not ( = ?auto_131735 ?auto_131737 ) ) ( not ( = ?auto_131735 ?auto_131738 ) ) ( not ( = ?auto_131735 ?auto_131739 ) ) ( not ( = ?auto_131735 ?auto_131740 ) ) ( not ( = ?auto_131736 ?auto_131737 ) ) ( not ( = ?auto_131736 ?auto_131738 ) ) ( not ( = ?auto_131736 ?auto_131739 ) ) ( not ( = ?auto_131736 ?auto_131740 ) ) ( not ( = ?auto_131737 ?auto_131738 ) ) ( not ( = ?auto_131737 ?auto_131739 ) ) ( not ( = ?auto_131737 ?auto_131740 ) ) ( not ( = ?auto_131738 ?auto_131739 ) ) ( not ( = ?auto_131738 ?auto_131740 ) ) ( not ( = ?auto_131739 ?auto_131740 ) ) ( ON-TABLE ?auto_131740 ) ( ON ?auto_131739 ?auto_131740 ) ( ON ?auto_131738 ?auto_131739 ) ( ON ?auto_131737 ?auto_131738 ) ( ON ?auto_131736 ?auto_131737 ) ( ON ?auto_131735 ?auto_131736 ) ( ON ?auto_131734 ?auto_131735 ) ( ON ?auto_131733 ?auto_131734 ) ( CLEAR ?auto_131733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131740 ?auto_131739 ?auto_131738 ?auto_131737 ?auto_131736 ?auto_131735 ?auto_131734 )
      ( MAKE-8PILE ?auto_131733 ?auto_131734 ?auto_131735 ?auto_131736 ?auto_131737 ?auto_131738 ?auto_131739 ?auto_131740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131749 - BLOCK
      ?auto_131750 - BLOCK
      ?auto_131751 - BLOCK
      ?auto_131752 - BLOCK
      ?auto_131753 - BLOCK
      ?auto_131754 - BLOCK
      ?auto_131755 - BLOCK
      ?auto_131756 - BLOCK
    )
    :vars
    (
      ?auto_131757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131749 ?auto_131750 ) ) ( not ( = ?auto_131749 ?auto_131751 ) ) ( not ( = ?auto_131749 ?auto_131752 ) ) ( not ( = ?auto_131749 ?auto_131753 ) ) ( not ( = ?auto_131749 ?auto_131754 ) ) ( not ( = ?auto_131749 ?auto_131755 ) ) ( not ( = ?auto_131749 ?auto_131756 ) ) ( not ( = ?auto_131750 ?auto_131751 ) ) ( not ( = ?auto_131750 ?auto_131752 ) ) ( not ( = ?auto_131750 ?auto_131753 ) ) ( not ( = ?auto_131750 ?auto_131754 ) ) ( not ( = ?auto_131750 ?auto_131755 ) ) ( not ( = ?auto_131750 ?auto_131756 ) ) ( not ( = ?auto_131751 ?auto_131752 ) ) ( not ( = ?auto_131751 ?auto_131753 ) ) ( not ( = ?auto_131751 ?auto_131754 ) ) ( not ( = ?auto_131751 ?auto_131755 ) ) ( not ( = ?auto_131751 ?auto_131756 ) ) ( not ( = ?auto_131752 ?auto_131753 ) ) ( not ( = ?auto_131752 ?auto_131754 ) ) ( not ( = ?auto_131752 ?auto_131755 ) ) ( not ( = ?auto_131752 ?auto_131756 ) ) ( not ( = ?auto_131753 ?auto_131754 ) ) ( not ( = ?auto_131753 ?auto_131755 ) ) ( not ( = ?auto_131753 ?auto_131756 ) ) ( not ( = ?auto_131754 ?auto_131755 ) ) ( not ( = ?auto_131754 ?auto_131756 ) ) ( not ( = ?auto_131755 ?auto_131756 ) ) ( ON-TABLE ?auto_131756 ) ( ON ?auto_131755 ?auto_131756 ) ( ON ?auto_131754 ?auto_131755 ) ( ON ?auto_131753 ?auto_131754 ) ( ON ?auto_131752 ?auto_131753 ) ( ON ?auto_131751 ?auto_131752 ) ( ON ?auto_131750 ?auto_131751 ) ( CLEAR ?auto_131750 ) ( ON ?auto_131749 ?auto_131757 ) ( CLEAR ?auto_131749 ) ( HAND-EMPTY ) ( not ( = ?auto_131749 ?auto_131757 ) ) ( not ( = ?auto_131750 ?auto_131757 ) ) ( not ( = ?auto_131751 ?auto_131757 ) ) ( not ( = ?auto_131752 ?auto_131757 ) ) ( not ( = ?auto_131753 ?auto_131757 ) ) ( not ( = ?auto_131754 ?auto_131757 ) ) ( not ( = ?auto_131755 ?auto_131757 ) ) ( not ( = ?auto_131756 ?auto_131757 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131749 ?auto_131757 )
      ( MAKE-8PILE ?auto_131749 ?auto_131750 ?auto_131751 ?auto_131752 ?auto_131753 ?auto_131754 ?auto_131755 ?auto_131756 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131758 - BLOCK
      ?auto_131759 - BLOCK
      ?auto_131760 - BLOCK
      ?auto_131761 - BLOCK
      ?auto_131762 - BLOCK
      ?auto_131763 - BLOCK
      ?auto_131764 - BLOCK
      ?auto_131765 - BLOCK
    )
    :vars
    (
      ?auto_131766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131758 ?auto_131759 ) ) ( not ( = ?auto_131758 ?auto_131760 ) ) ( not ( = ?auto_131758 ?auto_131761 ) ) ( not ( = ?auto_131758 ?auto_131762 ) ) ( not ( = ?auto_131758 ?auto_131763 ) ) ( not ( = ?auto_131758 ?auto_131764 ) ) ( not ( = ?auto_131758 ?auto_131765 ) ) ( not ( = ?auto_131759 ?auto_131760 ) ) ( not ( = ?auto_131759 ?auto_131761 ) ) ( not ( = ?auto_131759 ?auto_131762 ) ) ( not ( = ?auto_131759 ?auto_131763 ) ) ( not ( = ?auto_131759 ?auto_131764 ) ) ( not ( = ?auto_131759 ?auto_131765 ) ) ( not ( = ?auto_131760 ?auto_131761 ) ) ( not ( = ?auto_131760 ?auto_131762 ) ) ( not ( = ?auto_131760 ?auto_131763 ) ) ( not ( = ?auto_131760 ?auto_131764 ) ) ( not ( = ?auto_131760 ?auto_131765 ) ) ( not ( = ?auto_131761 ?auto_131762 ) ) ( not ( = ?auto_131761 ?auto_131763 ) ) ( not ( = ?auto_131761 ?auto_131764 ) ) ( not ( = ?auto_131761 ?auto_131765 ) ) ( not ( = ?auto_131762 ?auto_131763 ) ) ( not ( = ?auto_131762 ?auto_131764 ) ) ( not ( = ?auto_131762 ?auto_131765 ) ) ( not ( = ?auto_131763 ?auto_131764 ) ) ( not ( = ?auto_131763 ?auto_131765 ) ) ( not ( = ?auto_131764 ?auto_131765 ) ) ( ON-TABLE ?auto_131765 ) ( ON ?auto_131764 ?auto_131765 ) ( ON ?auto_131763 ?auto_131764 ) ( ON ?auto_131762 ?auto_131763 ) ( ON ?auto_131761 ?auto_131762 ) ( ON ?auto_131760 ?auto_131761 ) ( ON ?auto_131758 ?auto_131766 ) ( CLEAR ?auto_131758 ) ( not ( = ?auto_131758 ?auto_131766 ) ) ( not ( = ?auto_131759 ?auto_131766 ) ) ( not ( = ?auto_131760 ?auto_131766 ) ) ( not ( = ?auto_131761 ?auto_131766 ) ) ( not ( = ?auto_131762 ?auto_131766 ) ) ( not ( = ?auto_131763 ?auto_131766 ) ) ( not ( = ?auto_131764 ?auto_131766 ) ) ( not ( = ?auto_131765 ?auto_131766 ) ) ( HOLDING ?auto_131759 ) ( CLEAR ?auto_131760 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131765 ?auto_131764 ?auto_131763 ?auto_131762 ?auto_131761 ?auto_131760 ?auto_131759 )
      ( MAKE-8PILE ?auto_131758 ?auto_131759 ?auto_131760 ?auto_131761 ?auto_131762 ?auto_131763 ?auto_131764 ?auto_131765 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131767 - BLOCK
      ?auto_131768 - BLOCK
      ?auto_131769 - BLOCK
      ?auto_131770 - BLOCK
      ?auto_131771 - BLOCK
      ?auto_131772 - BLOCK
      ?auto_131773 - BLOCK
      ?auto_131774 - BLOCK
    )
    :vars
    (
      ?auto_131775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131767 ?auto_131768 ) ) ( not ( = ?auto_131767 ?auto_131769 ) ) ( not ( = ?auto_131767 ?auto_131770 ) ) ( not ( = ?auto_131767 ?auto_131771 ) ) ( not ( = ?auto_131767 ?auto_131772 ) ) ( not ( = ?auto_131767 ?auto_131773 ) ) ( not ( = ?auto_131767 ?auto_131774 ) ) ( not ( = ?auto_131768 ?auto_131769 ) ) ( not ( = ?auto_131768 ?auto_131770 ) ) ( not ( = ?auto_131768 ?auto_131771 ) ) ( not ( = ?auto_131768 ?auto_131772 ) ) ( not ( = ?auto_131768 ?auto_131773 ) ) ( not ( = ?auto_131768 ?auto_131774 ) ) ( not ( = ?auto_131769 ?auto_131770 ) ) ( not ( = ?auto_131769 ?auto_131771 ) ) ( not ( = ?auto_131769 ?auto_131772 ) ) ( not ( = ?auto_131769 ?auto_131773 ) ) ( not ( = ?auto_131769 ?auto_131774 ) ) ( not ( = ?auto_131770 ?auto_131771 ) ) ( not ( = ?auto_131770 ?auto_131772 ) ) ( not ( = ?auto_131770 ?auto_131773 ) ) ( not ( = ?auto_131770 ?auto_131774 ) ) ( not ( = ?auto_131771 ?auto_131772 ) ) ( not ( = ?auto_131771 ?auto_131773 ) ) ( not ( = ?auto_131771 ?auto_131774 ) ) ( not ( = ?auto_131772 ?auto_131773 ) ) ( not ( = ?auto_131772 ?auto_131774 ) ) ( not ( = ?auto_131773 ?auto_131774 ) ) ( ON-TABLE ?auto_131774 ) ( ON ?auto_131773 ?auto_131774 ) ( ON ?auto_131772 ?auto_131773 ) ( ON ?auto_131771 ?auto_131772 ) ( ON ?auto_131770 ?auto_131771 ) ( ON ?auto_131769 ?auto_131770 ) ( ON ?auto_131767 ?auto_131775 ) ( not ( = ?auto_131767 ?auto_131775 ) ) ( not ( = ?auto_131768 ?auto_131775 ) ) ( not ( = ?auto_131769 ?auto_131775 ) ) ( not ( = ?auto_131770 ?auto_131775 ) ) ( not ( = ?auto_131771 ?auto_131775 ) ) ( not ( = ?auto_131772 ?auto_131775 ) ) ( not ( = ?auto_131773 ?auto_131775 ) ) ( not ( = ?auto_131774 ?auto_131775 ) ) ( CLEAR ?auto_131769 ) ( ON ?auto_131768 ?auto_131767 ) ( CLEAR ?auto_131768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131775 ?auto_131767 )
      ( MAKE-8PILE ?auto_131767 ?auto_131768 ?auto_131769 ?auto_131770 ?auto_131771 ?auto_131772 ?auto_131773 ?auto_131774 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131776 - BLOCK
      ?auto_131777 - BLOCK
      ?auto_131778 - BLOCK
      ?auto_131779 - BLOCK
      ?auto_131780 - BLOCK
      ?auto_131781 - BLOCK
      ?auto_131782 - BLOCK
      ?auto_131783 - BLOCK
    )
    :vars
    (
      ?auto_131784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131776 ?auto_131777 ) ) ( not ( = ?auto_131776 ?auto_131778 ) ) ( not ( = ?auto_131776 ?auto_131779 ) ) ( not ( = ?auto_131776 ?auto_131780 ) ) ( not ( = ?auto_131776 ?auto_131781 ) ) ( not ( = ?auto_131776 ?auto_131782 ) ) ( not ( = ?auto_131776 ?auto_131783 ) ) ( not ( = ?auto_131777 ?auto_131778 ) ) ( not ( = ?auto_131777 ?auto_131779 ) ) ( not ( = ?auto_131777 ?auto_131780 ) ) ( not ( = ?auto_131777 ?auto_131781 ) ) ( not ( = ?auto_131777 ?auto_131782 ) ) ( not ( = ?auto_131777 ?auto_131783 ) ) ( not ( = ?auto_131778 ?auto_131779 ) ) ( not ( = ?auto_131778 ?auto_131780 ) ) ( not ( = ?auto_131778 ?auto_131781 ) ) ( not ( = ?auto_131778 ?auto_131782 ) ) ( not ( = ?auto_131778 ?auto_131783 ) ) ( not ( = ?auto_131779 ?auto_131780 ) ) ( not ( = ?auto_131779 ?auto_131781 ) ) ( not ( = ?auto_131779 ?auto_131782 ) ) ( not ( = ?auto_131779 ?auto_131783 ) ) ( not ( = ?auto_131780 ?auto_131781 ) ) ( not ( = ?auto_131780 ?auto_131782 ) ) ( not ( = ?auto_131780 ?auto_131783 ) ) ( not ( = ?auto_131781 ?auto_131782 ) ) ( not ( = ?auto_131781 ?auto_131783 ) ) ( not ( = ?auto_131782 ?auto_131783 ) ) ( ON-TABLE ?auto_131783 ) ( ON ?auto_131782 ?auto_131783 ) ( ON ?auto_131781 ?auto_131782 ) ( ON ?auto_131780 ?auto_131781 ) ( ON ?auto_131779 ?auto_131780 ) ( ON ?auto_131776 ?auto_131784 ) ( not ( = ?auto_131776 ?auto_131784 ) ) ( not ( = ?auto_131777 ?auto_131784 ) ) ( not ( = ?auto_131778 ?auto_131784 ) ) ( not ( = ?auto_131779 ?auto_131784 ) ) ( not ( = ?auto_131780 ?auto_131784 ) ) ( not ( = ?auto_131781 ?auto_131784 ) ) ( not ( = ?auto_131782 ?auto_131784 ) ) ( not ( = ?auto_131783 ?auto_131784 ) ) ( ON ?auto_131777 ?auto_131776 ) ( CLEAR ?auto_131777 ) ( ON-TABLE ?auto_131784 ) ( HOLDING ?auto_131778 ) ( CLEAR ?auto_131779 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131783 ?auto_131782 ?auto_131781 ?auto_131780 ?auto_131779 ?auto_131778 )
      ( MAKE-8PILE ?auto_131776 ?auto_131777 ?auto_131778 ?auto_131779 ?auto_131780 ?auto_131781 ?auto_131782 ?auto_131783 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131785 - BLOCK
      ?auto_131786 - BLOCK
      ?auto_131787 - BLOCK
      ?auto_131788 - BLOCK
      ?auto_131789 - BLOCK
      ?auto_131790 - BLOCK
      ?auto_131791 - BLOCK
      ?auto_131792 - BLOCK
    )
    :vars
    (
      ?auto_131793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131785 ?auto_131786 ) ) ( not ( = ?auto_131785 ?auto_131787 ) ) ( not ( = ?auto_131785 ?auto_131788 ) ) ( not ( = ?auto_131785 ?auto_131789 ) ) ( not ( = ?auto_131785 ?auto_131790 ) ) ( not ( = ?auto_131785 ?auto_131791 ) ) ( not ( = ?auto_131785 ?auto_131792 ) ) ( not ( = ?auto_131786 ?auto_131787 ) ) ( not ( = ?auto_131786 ?auto_131788 ) ) ( not ( = ?auto_131786 ?auto_131789 ) ) ( not ( = ?auto_131786 ?auto_131790 ) ) ( not ( = ?auto_131786 ?auto_131791 ) ) ( not ( = ?auto_131786 ?auto_131792 ) ) ( not ( = ?auto_131787 ?auto_131788 ) ) ( not ( = ?auto_131787 ?auto_131789 ) ) ( not ( = ?auto_131787 ?auto_131790 ) ) ( not ( = ?auto_131787 ?auto_131791 ) ) ( not ( = ?auto_131787 ?auto_131792 ) ) ( not ( = ?auto_131788 ?auto_131789 ) ) ( not ( = ?auto_131788 ?auto_131790 ) ) ( not ( = ?auto_131788 ?auto_131791 ) ) ( not ( = ?auto_131788 ?auto_131792 ) ) ( not ( = ?auto_131789 ?auto_131790 ) ) ( not ( = ?auto_131789 ?auto_131791 ) ) ( not ( = ?auto_131789 ?auto_131792 ) ) ( not ( = ?auto_131790 ?auto_131791 ) ) ( not ( = ?auto_131790 ?auto_131792 ) ) ( not ( = ?auto_131791 ?auto_131792 ) ) ( ON-TABLE ?auto_131792 ) ( ON ?auto_131791 ?auto_131792 ) ( ON ?auto_131790 ?auto_131791 ) ( ON ?auto_131789 ?auto_131790 ) ( ON ?auto_131788 ?auto_131789 ) ( ON ?auto_131785 ?auto_131793 ) ( not ( = ?auto_131785 ?auto_131793 ) ) ( not ( = ?auto_131786 ?auto_131793 ) ) ( not ( = ?auto_131787 ?auto_131793 ) ) ( not ( = ?auto_131788 ?auto_131793 ) ) ( not ( = ?auto_131789 ?auto_131793 ) ) ( not ( = ?auto_131790 ?auto_131793 ) ) ( not ( = ?auto_131791 ?auto_131793 ) ) ( not ( = ?auto_131792 ?auto_131793 ) ) ( ON ?auto_131786 ?auto_131785 ) ( ON-TABLE ?auto_131793 ) ( CLEAR ?auto_131788 ) ( ON ?auto_131787 ?auto_131786 ) ( CLEAR ?auto_131787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131793 ?auto_131785 ?auto_131786 )
      ( MAKE-8PILE ?auto_131785 ?auto_131786 ?auto_131787 ?auto_131788 ?auto_131789 ?auto_131790 ?auto_131791 ?auto_131792 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131794 - BLOCK
      ?auto_131795 - BLOCK
      ?auto_131796 - BLOCK
      ?auto_131797 - BLOCK
      ?auto_131798 - BLOCK
      ?auto_131799 - BLOCK
      ?auto_131800 - BLOCK
      ?auto_131801 - BLOCK
    )
    :vars
    (
      ?auto_131802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131794 ?auto_131795 ) ) ( not ( = ?auto_131794 ?auto_131796 ) ) ( not ( = ?auto_131794 ?auto_131797 ) ) ( not ( = ?auto_131794 ?auto_131798 ) ) ( not ( = ?auto_131794 ?auto_131799 ) ) ( not ( = ?auto_131794 ?auto_131800 ) ) ( not ( = ?auto_131794 ?auto_131801 ) ) ( not ( = ?auto_131795 ?auto_131796 ) ) ( not ( = ?auto_131795 ?auto_131797 ) ) ( not ( = ?auto_131795 ?auto_131798 ) ) ( not ( = ?auto_131795 ?auto_131799 ) ) ( not ( = ?auto_131795 ?auto_131800 ) ) ( not ( = ?auto_131795 ?auto_131801 ) ) ( not ( = ?auto_131796 ?auto_131797 ) ) ( not ( = ?auto_131796 ?auto_131798 ) ) ( not ( = ?auto_131796 ?auto_131799 ) ) ( not ( = ?auto_131796 ?auto_131800 ) ) ( not ( = ?auto_131796 ?auto_131801 ) ) ( not ( = ?auto_131797 ?auto_131798 ) ) ( not ( = ?auto_131797 ?auto_131799 ) ) ( not ( = ?auto_131797 ?auto_131800 ) ) ( not ( = ?auto_131797 ?auto_131801 ) ) ( not ( = ?auto_131798 ?auto_131799 ) ) ( not ( = ?auto_131798 ?auto_131800 ) ) ( not ( = ?auto_131798 ?auto_131801 ) ) ( not ( = ?auto_131799 ?auto_131800 ) ) ( not ( = ?auto_131799 ?auto_131801 ) ) ( not ( = ?auto_131800 ?auto_131801 ) ) ( ON-TABLE ?auto_131801 ) ( ON ?auto_131800 ?auto_131801 ) ( ON ?auto_131799 ?auto_131800 ) ( ON ?auto_131798 ?auto_131799 ) ( ON ?auto_131794 ?auto_131802 ) ( not ( = ?auto_131794 ?auto_131802 ) ) ( not ( = ?auto_131795 ?auto_131802 ) ) ( not ( = ?auto_131796 ?auto_131802 ) ) ( not ( = ?auto_131797 ?auto_131802 ) ) ( not ( = ?auto_131798 ?auto_131802 ) ) ( not ( = ?auto_131799 ?auto_131802 ) ) ( not ( = ?auto_131800 ?auto_131802 ) ) ( not ( = ?auto_131801 ?auto_131802 ) ) ( ON ?auto_131795 ?auto_131794 ) ( ON-TABLE ?auto_131802 ) ( ON ?auto_131796 ?auto_131795 ) ( CLEAR ?auto_131796 ) ( HOLDING ?auto_131797 ) ( CLEAR ?auto_131798 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131801 ?auto_131800 ?auto_131799 ?auto_131798 ?auto_131797 )
      ( MAKE-8PILE ?auto_131794 ?auto_131795 ?auto_131796 ?auto_131797 ?auto_131798 ?auto_131799 ?auto_131800 ?auto_131801 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131803 - BLOCK
      ?auto_131804 - BLOCK
      ?auto_131805 - BLOCK
      ?auto_131806 - BLOCK
      ?auto_131807 - BLOCK
      ?auto_131808 - BLOCK
      ?auto_131809 - BLOCK
      ?auto_131810 - BLOCK
    )
    :vars
    (
      ?auto_131811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131803 ?auto_131804 ) ) ( not ( = ?auto_131803 ?auto_131805 ) ) ( not ( = ?auto_131803 ?auto_131806 ) ) ( not ( = ?auto_131803 ?auto_131807 ) ) ( not ( = ?auto_131803 ?auto_131808 ) ) ( not ( = ?auto_131803 ?auto_131809 ) ) ( not ( = ?auto_131803 ?auto_131810 ) ) ( not ( = ?auto_131804 ?auto_131805 ) ) ( not ( = ?auto_131804 ?auto_131806 ) ) ( not ( = ?auto_131804 ?auto_131807 ) ) ( not ( = ?auto_131804 ?auto_131808 ) ) ( not ( = ?auto_131804 ?auto_131809 ) ) ( not ( = ?auto_131804 ?auto_131810 ) ) ( not ( = ?auto_131805 ?auto_131806 ) ) ( not ( = ?auto_131805 ?auto_131807 ) ) ( not ( = ?auto_131805 ?auto_131808 ) ) ( not ( = ?auto_131805 ?auto_131809 ) ) ( not ( = ?auto_131805 ?auto_131810 ) ) ( not ( = ?auto_131806 ?auto_131807 ) ) ( not ( = ?auto_131806 ?auto_131808 ) ) ( not ( = ?auto_131806 ?auto_131809 ) ) ( not ( = ?auto_131806 ?auto_131810 ) ) ( not ( = ?auto_131807 ?auto_131808 ) ) ( not ( = ?auto_131807 ?auto_131809 ) ) ( not ( = ?auto_131807 ?auto_131810 ) ) ( not ( = ?auto_131808 ?auto_131809 ) ) ( not ( = ?auto_131808 ?auto_131810 ) ) ( not ( = ?auto_131809 ?auto_131810 ) ) ( ON-TABLE ?auto_131810 ) ( ON ?auto_131809 ?auto_131810 ) ( ON ?auto_131808 ?auto_131809 ) ( ON ?auto_131807 ?auto_131808 ) ( ON ?auto_131803 ?auto_131811 ) ( not ( = ?auto_131803 ?auto_131811 ) ) ( not ( = ?auto_131804 ?auto_131811 ) ) ( not ( = ?auto_131805 ?auto_131811 ) ) ( not ( = ?auto_131806 ?auto_131811 ) ) ( not ( = ?auto_131807 ?auto_131811 ) ) ( not ( = ?auto_131808 ?auto_131811 ) ) ( not ( = ?auto_131809 ?auto_131811 ) ) ( not ( = ?auto_131810 ?auto_131811 ) ) ( ON ?auto_131804 ?auto_131803 ) ( ON-TABLE ?auto_131811 ) ( ON ?auto_131805 ?auto_131804 ) ( CLEAR ?auto_131807 ) ( ON ?auto_131806 ?auto_131805 ) ( CLEAR ?auto_131806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131811 ?auto_131803 ?auto_131804 ?auto_131805 )
      ( MAKE-8PILE ?auto_131803 ?auto_131804 ?auto_131805 ?auto_131806 ?auto_131807 ?auto_131808 ?auto_131809 ?auto_131810 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131812 - BLOCK
      ?auto_131813 - BLOCK
      ?auto_131814 - BLOCK
      ?auto_131815 - BLOCK
      ?auto_131816 - BLOCK
      ?auto_131817 - BLOCK
      ?auto_131818 - BLOCK
      ?auto_131819 - BLOCK
    )
    :vars
    (
      ?auto_131820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131812 ?auto_131813 ) ) ( not ( = ?auto_131812 ?auto_131814 ) ) ( not ( = ?auto_131812 ?auto_131815 ) ) ( not ( = ?auto_131812 ?auto_131816 ) ) ( not ( = ?auto_131812 ?auto_131817 ) ) ( not ( = ?auto_131812 ?auto_131818 ) ) ( not ( = ?auto_131812 ?auto_131819 ) ) ( not ( = ?auto_131813 ?auto_131814 ) ) ( not ( = ?auto_131813 ?auto_131815 ) ) ( not ( = ?auto_131813 ?auto_131816 ) ) ( not ( = ?auto_131813 ?auto_131817 ) ) ( not ( = ?auto_131813 ?auto_131818 ) ) ( not ( = ?auto_131813 ?auto_131819 ) ) ( not ( = ?auto_131814 ?auto_131815 ) ) ( not ( = ?auto_131814 ?auto_131816 ) ) ( not ( = ?auto_131814 ?auto_131817 ) ) ( not ( = ?auto_131814 ?auto_131818 ) ) ( not ( = ?auto_131814 ?auto_131819 ) ) ( not ( = ?auto_131815 ?auto_131816 ) ) ( not ( = ?auto_131815 ?auto_131817 ) ) ( not ( = ?auto_131815 ?auto_131818 ) ) ( not ( = ?auto_131815 ?auto_131819 ) ) ( not ( = ?auto_131816 ?auto_131817 ) ) ( not ( = ?auto_131816 ?auto_131818 ) ) ( not ( = ?auto_131816 ?auto_131819 ) ) ( not ( = ?auto_131817 ?auto_131818 ) ) ( not ( = ?auto_131817 ?auto_131819 ) ) ( not ( = ?auto_131818 ?auto_131819 ) ) ( ON-TABLE ?auto_131819 ) ( ON ?auto_131818 ?auto_131819 ) ( ON ?auto_131817 ?auto_131818 ) ( ON ?auto_131812 ?auto_131820 ) ( not ( = ?auto_131812 ?auto_131820 ) ) ( not ( = ?auto_131813 ?auto_131820 ) ) ( not ( = ?auto_131814 ?auto_131820 ) ) ( not ( = ?auto_131815 ?auto_131820 ) ) ( not ( = ?auto_131816 ?auto_131820 ) ) ( not ( = ?auto_131817 ?auto_131820 ) ) ( not ( = ?auto_131818 ?auto_131820 ) ) ( not ( = ?auto_131819 ?auto_131820 ) ) ( ON ?auto_131813 ?auto_131812 ) ( ON-TABLE ?auto_131820 ) ( ON ?auto_131814 ?auto_131813 ) ( ON ?auto_131815 ?auto_131814 ) ( CLEAR ?auto_131815 ) ( HOLDING ?auto_131816 ) ( CLEAR ?auto_131817 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_131819 ?auto_131818 ?auto_131817 ?auto_131816 )
      ( MAKE-8PILE ?auto_131812 ?auto_131813 ?auto_131814 ?auto_131815 ?auto_131816 ?auto_131817 ?auto_131818 ?auto_131819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131821 - BLOCK
      ?auto_131822 - BLOCK
      ?auto_131823 - BLOCK
      ?auto_131824 - BLOCK
      ?auto_131825 - BLOCK
      ?auto_131826 - BLOCK
      ?auto_131827 - BLOCK
      ?auto_131828 - BLOCK
    )
    :vars
    (
      ?auto_131829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131821 ?auto_131822 ) ) ( not ( = ?auto_131821 ?auto_131823 ) ) ( not ( = ?auto_131821 ?auto_131824 ) ) ( not ( = ?auto_131821 ?auto_131825 ) ) ( not ( = ?auto_131821 ?auto_131826 ) ) ( not ( = ?auto_131821 ?auto_131827 ) ) ( not ( = ?auto_131821 ?auto_131828 ) ) ( not ( = ?auto_131822 ?auto_131823 ) ) ( not ( = ?auto_131822 ?auto_131824 ) ) ( not ( = ?auto_131822 ?auto_131825 ) ) ( not ( = ?auto_131822 ?auto_131826 ) ) ( not ( = ?auto_131822 ?auto_131827 ) ) ( not ( = ?auto_131822 ?auto_131828 ) ) ( not ( = ?auto_131823 ?auto_131824 ) ) ( not ( = ?auto_131823 ?auto_131825 ) ) ( not ( = ?auto_131823 ?auto_131826 ) ) ( not ( = ?auto_131823 ?auto_131827 ) ) ( not ( = ?auto_131823 ?auto_131828 ) ) ( not ( = ?auto_131824 ?auto_131825 ) ) ( not ( = ?auto_131824 ?auto_131826 ) ) ( not ( = ?auto_131824 ?auto_131827 ) ) ( not ( = ?auto_131824 ?auto_131828 ) ) ( not ( = ?auto_131825 ?auto_131826 ) ) ( not ( = ?auto_131825 ?auto_131827 ) ) ( not ( = ?auto_131825 ?auto_131828 ) ) ( not ( = ?auto_131826 ?auto_131827 ) ) ( not ( = ?auto_131826 ?auto_131828 ) ) ( not ( = ?auto_131827 ?auto_131828 ) ) ( ON-TABLE ?auto_131828 ) ( ON ?auto_131827 ?auto_131828 ) ( ON ?auto_131826 ?auto_131827 ) ( ON ?auto_131821 ?auto_131829 ) ( not ( = ?auto_131821 ?auto_131829 ) ) ( not ( = ?auto_131822 ?auto_131829 ) ) ( not ( = ?auto_131823 ?auto_131829 ) ) ( not ( = ?auto_131824 ?auto_131829 ) ) ( not ( = ?auto_131825 ?auto_131829 ) ) ( not ( = ?auto_131826 ?auto_131829 ) ) ( not ( = ?auto_131827 ?auto_131829 ) ) ( not ( = ?auto_131828 ?auto_131829 ) ) ( ON ?auto_131822 ?auto_131821 ) ( ON-TABLE ?auto_131829 ) ( ON ?auto_131823 ?auto_131822 ) ( ON ?auto_131824 ?auto_131823 ) ( CLEAR ?auto_131826 ) ( ON ?auto_131825 ?auto_131824 ) ( CLEAR ?auto_131825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_131829 ?auto_131821 ?auto_131822 ?auto_131823 ?auto_131824 )
      ( MAKE-8PILE ?auto_131821 ?auto_131822 ?auto_131823 ?auto_131824 ?auto_131825 ?auto_131826 ?auto_131827 ?auto_131828 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131830 - BLOCK
      ?auto_131831 - BLOCK
      ?auto_131832 - BLOCK
      ?auto_131833 - BLOCK
      ?auto_131834 - BLOCK
      ?auto_131835 - BLOCK
      ?auto_131836 - BLOCK
      ?auto_131837 - BLOCK
    )
    :vars
    (
      ?auto_131838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131830 ?auto_131831 ) ) ( not ( = ?auto_131830 ?auto_131832 ) ) ( not ( = ?auto_131830 ?auto_131833 ) ) ( not ( = ?auto_131830 ?auto_131834 ) ) ( not ( = ?auto_131830 ?auto_131835 ) ) ( not ( = ?auto_131830 ?auto_131836 ) ) ( not ( = ?auto_131830 ?auto_131837 ) ) ( not ( = ?auto_131831 ?auto_131832 ) ) ( not ( = ?auto_131831 ?auto_131833 ) ) ( not ( = ?auto_131831 ?auto_131834 ) ) ( not ( = ?auto_131831 ?auto_131835 ) ) ( not ( = ?auto_131831 ?auto_131836 ) ) ( not ( = ?auto_131831 ?auto_131837 ) ) ( not ( = ?auto_131832 ?auto_131833 ) ) ( not ( = ?auto_131832 ?auto_131834 ) ) ( not ( = ?auto_131832 ?auto_131835 ) ) ( not ( = ?auto_131832 ?auto_131836 ) ) ( not ( = ?auto_131832 ?auto_131837 ) ) ( not ( = ?auto_131833 ?auto_131834 ) ) ( not ( = ?auto_131833 ?auto_131835 ) ) ( not ( = ?auto_131833 ?auto_131836 ) ) ( not ( = ?auto_131833 ?auto_131837 ) ) ( not ( = ?auto_131834 ?auto_131835 ) ) ( not ( = ?auto_131834 ?auto_131836 ) ) ( not ( = ?auto_131834 ?auto_131837 ) ) ( not ( = ?auto_131835 ?auto_131836 ) ) ( not ( = ?auto_131835 ?auto_131837 ) ) ( not ( = ?auto_131836 ?auto_131837 ) ) ( ON-TABLE ?auto_131837 ) ( ON ?auto_131836 ?auto_131837 ) ( ON ?auto_131830 ?auto_131838 ) ( not ( = ?auto_131830 ?auto_131838 ) ) ( not ( = ?auto_131831 ?auto_131838 ) ) ( not ( = ?auto_131832 ?auto_131838 ) ) ( not ( = ?auto_131833 ?auto_131838 ) ) ( not ( = ?auto_131834 ?auto_131838 ) ) ( not ( = ?auto_131835 ?auto_131838 ) ) ( not ( = ?auto_131836 ?auto_131838 ) ) ( not ( = ?auto_131837 ?auto_131838 ) ) ( ON ?auto_131831 ?auto_131830 ) ( ON-TABLE ?auto_131838 ) ( ON ?auto_131832 ?auto_131831 ) ( ON ?auto_131833 ?auto_131832 ) ( ON ?auto_131834 ?auto_131833 ) ( CLEAR ?auto_131834 ) ( HOLDING ?auto_131835 ) ( CLEAR ?auto_131836 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_131837 ?auto_131836 ?auto_131835 )
      ( MAKE-8PILE ?auto_131830 ?auto_131831 ?auto_131832 ?auto_131833 ?auto_131834 ?auto_131835 ?auto_131836 ?auto_131837 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131839 - BLOCK
      ?auto_131840 - BLOCK
      ?auto_131841 - BLOCK
      ?auto_131842 - BLOCK
      ?auto_131843 - BLOCK
      ?auto_131844 - BLOCK
      ?auto_131845 - BLOCK
      ?auto_131846 - BLOCK
    )
    :vars
    (
      ?auto_131847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131839 ?auto_131840 ) ) ( not ( = ?auto_131839 ?auto_131841 ) ) ( not ( = ?auto_131839 ?auto_131842 ) ) ( not ( = ?auto_131839 ?auto_131843 ) ) ( not ( = ?auto_131839 ?auto_131844 ) ) ( not ( = ?auto_131839 ?auto_131845 ) ) ( not ( = ?auto_131839 ?auto_131846 ) ) ( not ( = ?auto_131840 ?auto_131841 ) ) ( not ( = ?auto_131840 ?auto_131842 ) ) ( not ( = ?auto_131840 ?auto_131843 ) ) ( not ( = ?auto_131840 ?auto_131844 ) ) ( not ( = ?auto_131840 ?auto_131845 ) ) ( not ( = ?auto_131840 ?auto_131846 ) ) ( not ( = ?auto_131841 ?auto_131842 ) ) ( not ( = ?auto_131841 ?auto_131843 ) ) ( not ( = ?auto_131841 ?auto_131844 ) ) ( not ( = ?auto_131841 ?auto_131845 ) ) ( not ( = ?auto_131841 ?auto_131846 ) ) ( not ( = ?auto_131842 ?auto_131843 ) ) ( not ( = ?auto_131842 ?auto_131844 ) ) ( not ( = ?auto_131842 ?auto_131845 ) ) ( not ( = ?auto_131842 ?auto_131846 ) ) ( not ( = ?auto_131843 ?auto_131844 ) ) ( not ( = ?auto_131843 ?auto_131845 ) ) ( not ( = ?auto_131843 ?auto_131846 ) ) ( not ( = ?auto_131844 ?auto_131845 ) ) ( not ( = ?auto_131844 ?auto_131846 ) ) ( not ( = ?auto_131845 ?auto_131846 ) ) ( ON-TABLE ?auto_131846 ) ( ON ?auto_131845 ?auto_131846 ) ( ON ?auto_131839 ?auto_131847 ) ( not ( = ?auto_131839 ?auto_131847 ) ) ( not ( = ?auto_131840 ?auto_131847 ) ) ( not ( = ?auto_131841 ?auto_131847 ) ) ( not ( = ?auto_131842 ?auto_131847 ) ) ( not ( = ?auto_131843 ?auto_131847 ) ) ( not ( = ?auto_131844 ?auto_131847 ) ) ( not ( = ?auto_131845 ?auto_131847 ) ) ( not ( = ?auto_131846 ?auto_131847 ) ) ( ON ?auto_131840 ?auto_131839 ) ( ON-TABLE ?auto_131847 ) ( ON ?auto_131841 ?auto_131840 ) ( ON ?auto_131842 ?auto_131841 ) ( ON ?auto_131843 ?auto_131842 ) ( CLEAR ?auto_131845 ) ( ON ?auto_131844 ?auto_131843 ) ( CLEAR ?auto_131844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_131847 ?auto_131839 ?auto_131840 ?auto_131841 ?auto_131842 ?auto_131843 )
      ( MAKE-8PILE ?auto_131839 ?auto_131840 ?auto_131841 ?auto_131842 ?auto_131843 ?auto_131844 ?auto_131845 ?auto_131846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131848 - BLOCK
      ?auto_131849 - BLOCK
      ?auto_131850 - BLOCK
      ?auto_131851 - BLOCK
      ?auto_131852 - BLOCK
      ?auto_131853 - BLOCK
      ?auto_131854 - BLOCK
      ?auto_131855 - BLOCK
    )
    :vars
    (
      ?auto_131856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131848 ?auto_131849 ) ) ( not ( = ?auto_131848 ?auto_131850 ) ) ( not ( = ?auto_131848 ?auto_131851 ) ) ( not ( = ?auto_131848 ?auto_131852 ) ) ( not ( = ?auto_131848 ?auto_131853 ) ) ( not ( = ?auto_131848 ?auto_131854 ) ) ( not ( = ?auto_131848 ?auto_131855 ) ) ( not ( = ?auto_131849 ?auto_131850 ) ) ( not ( = ?auto_131849 ?auto_131851 ) ) ( not ( = ?auto_131849 ?auto_131852 ) ) ( not ( = ?auto_131849 ?auto_131853 ) ) ( not ( = ?auto_131849 ?auto_131854 ) ) ( not ( = ?auto_131849 ?auto_131855 ) ) ( not ( = ?auto_131850 ?auto_131851 ) ) ( not ( = ?auto_131850 ?auto_131852 ) ) ( not ( = ?auto_131850 ?auto_131853 ) ) ( not ( = ?auto_131850 ?auto_131854 ) ) ( not ( = ?auto_131850 ?auto_131855 ) ) ( not ( = ?auto_131851 ?auto_131852 ) ) ( not ( = ?auto_131851 ?auto_131853 ) ) ( not ( = ?auto_131851 ?auto_131854 ) ) ( not ( = ?auto_131851 ?auto_131855 ) ) ( not ( = ?auto_131852 ?auto_131853 ) ) ( not ( = ?auto_131852 ?auto_131854 ) ) ( not ( = ?auto_131852 ?auto_131855 ) ) ( not ( = ?auto_131853 ?auto_131854 ) ) ( not ( = ?auto_131853 ?auto_131855 ) ) ( not ( = ?auto_131854 ?auto_131855 ) ) ( ON-TABLE ?auto_131855 ) ( ON ?auto_131848 ?auto_131856 ) ( not ( = ?auto_131848 ?auto_131856 ) ) ( not ( = ?auto_131849 ?auto_131856 ) ) ( not ( = ?auto_131850 ?auto_131856 ) ) ( not ( = ?auto_131851 ?auto_131856 ) ) ( not ( = ?auto_131852 ?auto_131856 ) ) ( not ( = ?auto_131853 ?auto_131856 ) ) ( not ( = ?auto_131854 ?auto_131856 ) ) ( not ( = ?auto_131855 ?auto_131856 ) ) ( ON ?auto_131849 ?auto_131848 ) ( ON-TABLE ?auto_131856 ) ( ON ?auto_131850 ?auto_131849 ) ( ON ?auto_131851 ?auto_131850 ) ( ON ?auto_131852 ?auto_131851 ) ( ON ?auto_131853 ?auto_131852 ) ( CLEAR ?auto_131853 ) ( HOLDING ?auto_131854 ) ( CLEAR ?auto_131855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_131855 ?auto_131854 )
      ( MAKE-8PILE ?auto_131848 ?auto_131849 ?auto_131850 ?auto_131851 ?auto_131852 ?auto_131853 ?auto_131854 ?auto_131855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131857 - BLOCK
      ?auto_131858 - BLOCK
      ?auto_131859 - BLOCK
      ?auto_131860 - BLOCK
      ?auto_131861 - BLOCK
      ?auto_131862 - BLOCK
      ?auto_131863 - BLOCK
      ?auto_131864 - BLOCK
    )
    :vars
    (
      ?auto_131865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131857 ?auto_131858 ) ) ( not ( = ?auto_131857 ?auto_131859 ) ) ( not ( = ?auto_131857 ?auto_131860 ) ) ( not ( = ?auto_131857 ?auto_131861 ) ) ( not ( = ?auto_131857 ?auto_131862 ) ) ( not ( = ?auto_131857 ?auto_131863 ) ) ( not ( = ?auto_131857 ?auto_131864 ) ) ( not ( = ?auto_131858 ?auto_131859 ) ) ( not ( = ?auto_131858 ?auto_131860 ) ) ( not ( = ?auto_131858 ?auto_131861 ) ) ( not ( = ?auto_131858 ?auto_131862 ) ) ( not ( = ?auto_131858 ?auto_131863 ) ) ( not ( = ?auto_131858 ?auto_131864 ) ) ( not ( = ?auto_131859 ?auto_131860 ) ) ( not ( = ?auto_131859 ?auto_131861 ) ) ( not ( = ?auto_131859 ?auto_131862 ) ) ( not ( = ?auto_131859 ?auto_131863 ) ) ( not ( = ?auto_131859 ?auto_131864 ) ) ( not ( = ?auto_131860 ?auto_131861 ) ) ( not ( = ?auto_131860 ?auto_131862 ) ) ( not ( = ?auto_131860 ?auto_131863 ) ) ( not ( = ?auto_131860 ?auto_131864 ) ) ( not ( = ?auto_131861 ?auto_131862 ) ) ( not ( = ?auto_131861 ?auto_131863 ) ) ( not ( = ?auto_131861 ?auto_131864 ) ) ( not ( = ?auto_131862 ?auto_131863 ) ) ( not ( = ?auto_131862 ?auto_131864 ) ) ( not ( = ?auto_131863 ?auto_131864 ) ) ( ON-TABLE ?auto_131864 ) ( ON ?auto_131857 ?auto_131865 ) ( not ( = ?auto_131857 ?auto_131865 ) ) ( not ( = ?auto_131858 ?auto_131865 ) ) ( not ( = ?auto_131859 ?auto_131865 ) ) ( not ( = ?auto_131860 ?auto_131865 ) ) ( not ( = ?auto_131861 ?auto_131865 ) ) ( not ( = ?auto_131862 ?auto_131865 ) ) ( not ( = ?auto_131863 ?auto_131865 ) ) ( not ( = ?auto_131864 ?auto_131865 ) ) ( ON ?auto_131858 ?auto_131857 ) ( ON-TABLE ?auto_131865 ) ( ON ?auto_131859 ?auto_131858 ) ( ON ?auto_131860 ?auto_131859 ) ( ON ?auto_131861 ?auto_131860 ) ( ON ?auto_131862 ?auto_131861 ) ( CLEAR ?auto_131864 ) ( ON ?auto_131863 ?auto_131862 ) ( CLEAR ?auto_131863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_131865 ?auto_131857 ?auto_131858 ?auto_131859 ?auto_131860 ?auto_131861 ?auto_131862 )
      ( MAKE-8PILE ?auto_131857 ?auto_131858 ?auto_131859 ?auto_131860 ?auto_131861 ?auto_131862 ?auto_131863 ?auto_131864 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131866 - BLOCK
      ?auto_131867 - BLOCK
      ?auto_131868 - BLOCK
      ?auto_131869 - BLOCK
      ?auto_131870 - BLOCK
      ?auto_131871 - BLOCK
      ?auto_131872 - BLOCK
      ?auto_131873 - BLOCK
    )
    :vars
    (
      ?auto_131874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131866 ?auto_131867 ) ) ( not ( = ?auto_131866 ?auto_131868 ) ) ( not ( = ?auto_131866 ?auto_131869 ) ) ( not ( = ?auto_131866 ?auto_131870 ) ) ( not ( = ?auto_131866 ?auto_131871 ) ) ( not ( = ?auto_131866 ?auto_131872 ) ) ( not ( = ?auto_131866 ?auto_131873 ) ) ( not ( = ?auto_131867 ?auto_131868 ) ) ( not ( = ?auto_131867 ?auto_131869 ) ) ( not ( = ?auto_131867 ?auto_131870 ) ) ( not ( = ?auto_131867 ?auto_131871 ) ) ( not ( = ?auto_131867 ?auto_131872 ) ) ( not ( = ?auto_131867 ?auto_131873 ) ) ( not ( = ?auto_131868 ?auto_131869 ) ) ( not ( = ?auto_131868 ?auto_131870 ) ) ( not ( = ?auto_131868 ?auto_131871 ) ) ( not ( = ?auto_131868 ?auto_131872 ) ) ( not ( = ?auto_131868 ?auto_131873 ) ) ( not ( = ?auto_131869 ?auto_131870 ) ) ( not ( = ?auto_131869 ?auto_131871 ) ) ( not ( = ?auto_131869 ?auto_131872 ) ) ( not ( = ?auto_131869 ?auto_131873 ) ) ( not ( = ?auto_131870 ?auto_131871 ) ) ( not ( = ?auto_131870 ?auto_131872 ) ) ( not ( = ?auto_131870 ?auto_131873 ) ) ( not ( = ?auto_131871 ?auto_131872 ) ) ( not ( = ?auto_131871 ?auto_131873 ) ) ( not ( = ?auto_131872 ?auto_131873 ) ) ( ON ?auto_131866 ?auto_131874 ) ( not ( = ?auto_131866 ?auto_131874 ) ) ( not ( = ?auto_131867 ?auto_131874 ) ) ( not ( = ?auto_131868 ?auto_131874 ) ) ( not ( = ?auto_131869 ?auto_131874 ) ) ( not ( = ?auto_131870 ?auto_131874 ) ) ( not ( = ?auto_131871 ?auto_131874 ) ) ( not ( = ?auto_131872 ?auto_131874 ) ) ( not ( = ?auto_131873 ?auto_131874 ) ) ( ON ?auto_131867 ?auto_131866 ) ( ON-TABLE ?auto_131874 ) ( ON ?auto_131868 ?auto_131867 ) ( ON ?auto_131869 ?auto_131868 ) ( ON ?auto_131870 ?auto_131869 ) ( ON ?auto_131871 ?auto_131870 ) ( ON ?auto_131872 ?auto_131871 ) ( CLEAR ?auto_131872 ) ( HOLDING ?auto_131873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131873 )
      ( MAKE-8PILE ?auto_131866 ?auto_131867 ?auto_131868 ?auto_131869 ?auto_131870 ?auto_131871 ?auto_131872 ?auto_131873 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_131875 - BLOCK
      ?auto_131876 - BLOCK
      ?auto_131877 - BLOCK
      ?auto_131878 - BLOCK
      ?auto_131879 - BLOCK
      ?auto_131880 - BLOCK
      ?auto_131881 - BLOCK
      ?auto_131882 - BLOCK
    )
    :vars
    (
      ?auto_131883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131875 ?auto_131876 ) ) ( not ( = ?auto_131875 ?auto_131877 ) ) ( not ( = ?auto_131875 ?auto_131878 ) ) ( not ( = ?auto_131875 ?auto_131879 ) ) ( not ( = ?auto_131875 ?auto_131880 ) ) ( not ( = ?auto_131875 ?auto_131881 ) ) ( not ( = ?auto_131875 ?auto_131882 ) ) ( not ( = ?auto_131876 ?auto_131877 ) ) ( not ( = ?auto_131876 ?auto_131878 ) ) ( not ( = ?auto_131876 ?auto_131879 ) ) ( not ( = ?auto_131876 ?auto_131880 ) ) ( not ( = ?auto_131876 ?auto_131881 ) ) ( not ( = ?auto_131876 ?auto_131882 ) ) ( not ( = ?auto_131877 ?auto_131878 ) ) ( not ( = ?auto_131877 ?auto_131879 ) ) ( not ( = ?auto_131877 ?auto_131880 ) ) ( not ( = ?auto_131877 ?auto_131881 ) ) ( not ( = ?auto_131877 ?auto_131882 ) ) ( not ( = ?auto_131878 ?auto_131879 ) ) ( not ( = ?auto_131878 ?auto_131880 ) ) ( not ( = ?auto_131878 ?auto_131881 ) ) ( not ( = ?auto_131878 ?auto_131882 ) ) ( not ( = ?auto_131879 ?auto_131880 ) ) ( not ( = ?auto_131879 ?auto_131881 ) ) ( not ( = ?auto_131879 ?auto_131882 ) ) ( not ( = ?auto_131880 ?auto_131881 ) ) ( not ( = ?auto_131880 ?auto_131882 ) ) ( not ( = ?auto_131881 ?auto_131882 ) ) ( ON ?auto_131875 ?auto_131883 ) ( not ( = ?auto_131875 ?auto_131883 ) ) ( not ( = ?auto_131876 ?auto_131883 ) ) ( not ( = ?auto_131877 ?auto_131883 ) ) ( not ( = ?auto_131878 ?auto_131883 ) ) ( not ( = ?auto_131879 ?auto_131883 ) ) ( not ( = ?auto_131880 ?auto_131883 ) ) ( not ( = ?auto_131881 ?auto_131883 ) ) ( not ( = ?auto_131882 ?auto_131883 ) ) ( ON ?auto_131876 ?auto_131875 ) ( ON-TABLE ?auto_131883 ) ( ON ?auto_131877 ?auto_131876 ) ( ON ?auto_131878 ?auto_131877 ) ( ON ?auto_131879 ?auto_131878 ) ( ON ?auto_131880 ?auto_131879 ) ( ON ?auto_131881 ?auto_131880 ) ( ON ?auto_131882 ?auto_131881 ) ( CLEAR ?auto_131882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131883 ?auto_131875 ?auto_131876 ?auto_131877 ?auto_131878 ?auto_131879 ?auto_131880 ?auto_131881 )
      ( MAKE-8PILE ?auto_131875 ?auto_131876 ?auto_131877 ?auto_131878 ?auto_131879 ?auto_131880 ?auto_131881 ?auto_131882 ) )
  )

)

