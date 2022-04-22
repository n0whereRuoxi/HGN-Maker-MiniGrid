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
      ?auto_12932 - BLOCK
    )
    :vars
    (
      ?auto_12933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12932 ?auto_12933 ) ( CLEAR ?auto_12932 ) ( HAND-EMPTY ) ( not ( = ?auto_12932 ?auto_12933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12932 ?auto_12933 )
      ( !PUTDOWN ?auto_12932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12939 - BLOCK
      ?auto_12940 - BLOCK
    )
    :vars
    (
      ?auto_12941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12939 ) ( ON ?auto_12940 ?auto_12941 ) ( CLEAR ?auto_12940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12939 ) ( not ( = ?auto_12939 ?auto_12940 ) ) ( not ( = ?auto_12939 ?auto_12941 ) ) ( not ( = ?auto_12940 ?auto_12941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12940 ?auto_12941 )
      ( !STACK ?auto_12940 ?auto_12939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12949 - BLOCK
      ?auto_12950 - BLOCK
    )
    :vars
    (
      ?auto_12951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12950 ?auto_12951 ) ( not ( = ?auto_12949 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12951 ) ) ( not ( = ?auto_12950 ?auto_12951 ) ) ( ON ?auto_12949 ?auto_12950 ) ( CLEAR ?auto_12949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12949 )
      ( MAKE-2PILE ?auto_12949 ?auto_12950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12960 - BLOCK
      ?auto_12961 - BLOCK
      ?auto_12962 - BLOCK
    )
    :vars
    (
      ?auto_12963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12961 ) ( ON ?auto_12962 ?auto_12963 ) ( CLEAR ?auto_12962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12960 ) ( ON ?auto_12961 ?auto_12960 ) ( not ( = ?auto_12960 ?auto_12961 ) ) ( not ( = ?auto_12960 ?auto_12962 ) ) ( not ( = ?auto_12960 ?auto_12963 ) ) ( not ( = ?auto_12961 ?auto_12962 ) ) ( not ( = ?auto_12961 ?auto_12963 ) ) ( not ( = ?auto_12962 ?auto_12963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12962 ?auto_12963 )
      ( !STACK ?auto_12962 ?auto_12961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12974 - BLOCK
      ?auto_12975 - BLOCK
      ?auto_12976 - BLOCK
    )
    :vars
    (
      ?auto_12977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12976 ?auto_12977 ) ( ON-TABLE ?auto_12974 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( not ( = ?auto_12974 ?auto_12976 ) ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12976 ) ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12977 ) ) ( CLEAR ?auto_12974 ) ( ON ?auto_12975 ?auto_12976 ) ( CLEAR ?auto_12975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12974 ?auto_12975 )
      ( MAKE-3PILE ?auto_12974 ?auto_12975 ?auto_12976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12988 - BLOCK
      ?auto_12989 - BLOCK
      ?auto_12990 - BLOCK
    )
    :vars
    (
      ?auto_12991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12990 ?auto_12991 ) ( not ( = ?auto_12988 ?auto_12989 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12988 ?auto_12991 ) ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( not ( = ?auto_12989 ?auto_12991 ) ) ( not ( = ?auto_12990 ?auto_12991 ) ) ( ON ?auto_12989 ?auto_12990 ) ( ON ?auto_12988 ?auto_12989 ) ( CLEAR ?auto_12988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12988 )
      ( MAKE-3PILE ?auto_12988 ?auto_12989 ?auto_12990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13003 - BLOCK
      ?auto_13004 - BLOCK
      ?auto_13005 - BLOCK
      ?auto_13006 - BLOCK
    )
    :vars
    (
      ?auto_13007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13005 ) ( ON ?auto_13006 ?auto_13007 ) ( CLEAR ?auto_13006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13003 ) ( ON ?auto_13004 ?auto_13003 ) ( ON ?auto_13005 ?auto_13004 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13003 ?auto_13006 ) ) ( not ( = ?auto_13003 ?auto_13007 ) ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13007 ) ) ( not ( = ?auto_13005 ?auto_13006 ) ) ( not ( = ?auto_13005 ?auto_13007 ) ) ( not ( = ?auto_13006 ?auto_13007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13006 ?auto_13007 )
      ( !STACK ?auto_13006 ?auto_13005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13021 - BLOCK
      ?auto_13022 - BLOCK
      ?auto_13023 - BLOCK
      ?auto_13024 - BLOCK
    )
    :vars
    (
      ?auto_13025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13024 ?auto_13025 ) ( ON-TABLE ?auto_13021 ) ( ON ?auto_13022 ?auto_13021 ) ( not ( = ?auto_13021 ?auto_13022 ) ) ( not ( = ?auto_13021 ?auto_13023 ) ) ( not ( = ?auto_13021 ?auto_13024 ) ) ( not ( = ?auto_13021 ?auto_13025 ) ) ( not ( = ?auto_13022 ?auto_13023 ) ) ( not ( = ?auto_13022 ?auto_13024 ) ) ( not ( = ?auto_13022 ?auto_13025 ) ) ( not ( = ?auto_13023 ?auto_13024 ) ) ( not ( = ?auto_13023 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( CLEAR ?auto_13022 ) ( ON ?auto_13023 ?auto_13024 ) ( CLEAR ?auto_13023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13021 ?auto_13022 ?auto_13023 )
      ( MAKE-4PILE ?auto_13021 ?auto_13022 ?auto_13023 ?auto_13024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13039 - BLOCK
      ?auto_13040 - BLOCK
      ?auto_13041 - BLOCK
      ?auto_13042 - BLOCK
    )
    :vars
    (
      ?auto_13043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13042 ?auto_13043 ) ( ON-TABLE ?auto_13039 ) ( not ( = ?auto_13039 ?auto_13040 ) ) ( not ( = ?auto_13039 ?auto_13041 ) ) ( not ( = ?auto_13039 ?auto_13042 ) ) ( not ( = ?auto_13039 ?auto_13043 ) ) ( not ( = ?auto_13040 ?auto_13041 ) ) ( not ( = ?auto_13040 ?auto_13042 ) ) ( not ( = ?auto_13040 ?auto_13043 ) ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( not ( = ?auto_13042 ?auto_13043 ) ) ( ON ?auto_13041 ?auto_13042 ) ( CLEAR ?auto_13039 ) ( ON ?auto_13040 ?auto_13041 ) ( CLEAR ?auto_13040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13039 ?auto_13040 )
      ( MAKE-4PILE ?auto_13039 ?auto_13040 ?auto_13041 ?auto_13042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13057 - BLOCK
      ?auto_13058 - BLOCK
      ?auto_13059 - BLOCK
      ?auto_13060 - BLOCK
    )
    :vars
    (
      ?auto_13061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13060 ?auto_13061 ) ( not ( = ?auto_13057 ?auto_13058 ) ) ( not ( = ?auto_13057 ?auto_13059 ) ) ( not ( = ?auto_13057 ?auto_13060 ) ) ( not ( = ?auto_13057 ?auto_13061 ) ) ( not ( = ?auto_13058 ?auto_13059 ) ) ( not ( = ?auto_13058 ?auto_13060 ) ) ( not ( = ?auto_13058 ?auto_13061 ) ) ( not ( = ?auto_13059 ?auto_13060 ) ) ( not ( = ?auto_13059 ?auto_13061 ) ) ( not ( = ?auto_13060 ?auto_13061 ) ) ( ON ?auto_13059 ?auto_13060 ) ( ON ?auto_13058 ?auto_13059 ) ( ON ?auto_13057 ?auto_13058 ) ( CLEAR ?auto_13057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13057 )
      ( MAKE-4PILE ?auto_13057 ?auto_13058 ?auto_13059 ?auto_13060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13076 - BLOCK
      ?auto_13077 - BLOCK
      ?auto_13078 - BLOCK
      ?auto_13079 - BLOCK
      ?auto_13080 - BLOCK
    )
    :vars
    (
      ?auto_13081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13079 ) ( ON ?auto_13080 ?auto_13081 ) ( CLEAR ?auto_13080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13076 ) ( ON ?auto_13077 ?auto_13076 ) ( ON ?auto_13078 ?auto_13077 ) ( ON ?auto_13079 ?auto_13078 ) ( not ( = ?auto_13076 ?auto_13077 ) ) ( not ( = ?auto_13076 ?auto_13078 ) ) ( not ( = ?auto_13076 ?auto_13079 ) ) ( not ( = ?auto_13076 ?auto_13080 ) ) ( not ( = ?auto_13076 ?auto_13081 ) ) ( not ( = ?auto_13077 ?auto_13078 ) ) ( not ( = ?auto_13077 ?auto_13079 ) ) ( not ( = ?auto_13077 ?auto_13080 ) ) ( not ( = ?auto_13077 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( not ( = ?auto_13078 ?auto_13080 ) ) ( not ( = ?auto_13078 ?auto_13081 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13081 ) ) ( not ( = ?auto_13080 ?auto_13081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13080 ?auto_13081 )
      ( !STACK ?auto_13080 ?auto_13079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13098 - BLOCK
      ?auto_13099 - BLOCK
      ?auto_13100 - BLOCK
      ?auto_13101 - BLOCK
      ?auto_13102 - BLOCK
    )
    :vars
    (
      ?auto_13103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13102 ?auto_13103 ) ( ON-TABLE ?auto_13098 ) ( ON ?auto_13099 ?auto_13098 ) ( ON ?auto_13100 ?auto_13099 ) ( not ( = ?auto_13098 ?auto_13099 ) ) ( not ( = ?auto_13098 ?auto_13100 ) ) ( not ( = ?auto_13098 ?auto_13101 ) ) ( not ( = ?auto_13098 ?auto_13102 ) ) ( not ( = ?auto_13098 ?auto_13103 ) ) ( not ( = ?auto_13099 ?auto_13100 ) ) ( not ( = ?auto_13099 ?auto_13101 ) ) ( not ( = ?auto_13099 ?auto_13102 ) ) ( not ( = ?auto_13099 ?auto_13103 ) ) ( not ( = ?auto_13100 ?auto_13101 ) ) ( not ( = ?auto_13100 ?auto_13102 ) ) ( not ( = ?auto_13100 ?auto_13103 ) ) ( not ( = ?auto_13101 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13103 ) ) ( not ( = ?auto_13102 ?auto_13103 ) ) ( CLEAR ?auto_13100 ) ( ON ?auto_13101 ?auto_13102 ) ( CLEAR ?auto_13101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13098 ?auto_13099 ?auto_13100 ?auto_13101 )
      ( MAKE-5PILE ?auto_13098 ?auto_13099 ?auto_13100 ?auto_13101 ?auto_13102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13120 - BLOCK
      ?auto_13121 - BLOCK
      ?auto_13122 - BLOCK
      ?auto_13123 - BLOCK
      ?auto_13124 - BLOCK
    )
    :vars
    (
      ?auto_13125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13124 ?auto_13125 ) ( ON-TABLE ?auto_13120 ) ( ON ?auto_13121 ?auto_13120 ) ( not ( = ?auto_13120 ?auto_13121 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13120 ?auto_13123 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13125 ) ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13124 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13122 ?auto_13124 ) ) ( not ( = ?auto_13122 ?auto_13125 ) ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13125 ) ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( ON ?auto_13123 ?auto_13124 ) ( CLEAR ?auto_13121 ) ( ON ?auto_13122 ?auto_13123 ) ( CLEAR ?auto_13122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13120 ?auto_13121 ?auto_13122 )
      ( MAKE-5PILE ?auto_13120 ?auto_13121 ?auto_13122 ?auto_13123 ?auto_13124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13142 - BLOCK
      ?auto_13143 - BLOCK
      ?auto_13144 - BLOCK
      ?auto_13145 - BLOCK
      ?auto_13146 - BLOCK
    )
    :vars
    (
      ?auto_13147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13146 ?auto_13147 ) ( ON-TABLE ?auto_13142 ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13144 ) ) ( not ( = ?auto_13142 ?auto_13145 ) ) ( not ( = ?auto_13142 ?auto_13146 ) ) ( not ( = ?auto_13142 ?auto_13147 ) ) ( not ( = ?auto_13143 ?auto_13144 ) ) ( not ( = ?auto_13143 ?auto_13145 ) ) ( not ( = ?auto_13143 ?auto_13146 ) ) ( not ( = ?auto_13143 ?auto_13147 ) ) ( not ( = ?auto_13144 ?auto_13145 ) ) ( not ( = ?auto_13144 ?auto_13146 ) ) ( not ( = ?auto_13144 ?auto_13147 ) ) ( not ( = ?auto_13145 ?auto_13146 ) ) ( not ( = ?auto_13145 ?auto_13147 ) ) ( not ( = ?auto_13146 ?auto_13147 ) ) ( ON ?auto_13145 ?auto_13146 ) ( ON ?auto_13144 ?auto_13145 ) ( CLEAR ?auto_13142 ) ( ON ?auto_13143 ?auto_13144 ) ( CLEAR ?auto_13143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13142 ?auto_13143 )
      ( MAKE-5PILE ?auto_13142 ?auto_13143 ?auto_13144 ?auto_13145 ?auto_13146 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_13164 - BLOCK
      ?auto_13165 - BLOCK
      ?auto_13166 - BLOCK
      ?auto_13167 - BLOCK
      ?auto_13168 - BLOCK
    )
    :vars
    (
      ?auto_13169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13168 ?auto_13169 ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( not ( = ?auto_13164 ?auto_13166 ) ) ( not ( = ?auto_13164 ?auto_13167 ) ) ( not ( = ?auto_13164 ?auto_13168 ) ) ( not ( = ?auto_13164 ?auto_13169 ) ) ( not ( = ?auto_13165 ?auto_13166 ) ) ( not ( = ?auto_13165 ?auto_13167 ) ) ( not ( = ?auto_13165 ?auto_13168 ) ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( not ( = ?auto_13166 ?auto_13167 ) ) ( not ( = ?auto_13166 ?auto_13168 ) ) ( not ( = ?auto_13166 ?auto_13169 ) ) ( not ( = ?auto_13167 ?auto_13168 ) ) ( not ( = ?auto_13167 ?auto_13169 ) ) ( not ( = ?auto_13168 ?auto_13169 ) ) ( ON ?auto_13167 ?auto_13168 ) ( ON ?auto_13166 ?auto_13167 ) ( ON ?auto_13165 ?auto_13166 ) ( ON ?auto_13164 ?auto_13165 ) ( CLEAR ?auto_13164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13164 )
      ( MAKE-5PILE ?auto_13164 ?auto_13165 ?auto_13166 ?auto_13167 ?auto_13168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13187 - BLOCK
      ?auto_13188 - BLOCK
      ?auto_13189 - BLOCK
      ?auto_13190 - BLOCK
      ?auto_13191 - BLOCK
      ?auto_13192 - BLOCK
    )
    :vars
    (
      ?auto_13193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13191 ) ( ON ?auto_13192 ?auto_13193 ) ( CLEAR ?auto_13192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13187 ) ( ON ?auto_13188 ?auto_13187 ) ( ON ?auto_13189 ?auto_13188 ) ( ON ?auto_13190 ?auto_13189 ) ( ON ?auto_13191 ?auto_13190 ) ( not ( = ?auto_13187 ?auto_13188 ) ) ( not ( = ?auto_13187 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13190 ) ) ( not ( = ?auto_13187 ?auto_13191 ) ) ( not ( = ?auto_13187 ?auto_13192 ) ) ( not ( = ?auto_13187 ?auto_13193 ) ) ( not ( = ?auto_13188 ?auto_13189 ) ) ( not ( = ?auto_13188 ?auto_13190 ) ) ( not ( = ?auto_13188 ?auto_13191 ) ) ( not ( = ?auto_13188 ?auto_13192 ) ) ( not ( = ?auto_13188 ?auto_13193 ) ) ( not ( = ?auto_13189 ?auto_13190 ) ) ( not ( = ?auto_13189 ?auto_13191 ) ) ( not ( = ?auto_13189 ?auto_13192 ) ) ( not ( = ?auto_13189 ?auto_13193 ) ) ( not ( = ?auto_13190 ?auto_13191 ) ) ( not ( = ?auto_13190 ?auto_13192 ) ) ( not ( = ?auto_13190 ?auto_13193 ) ) ( not ( = ?auto_13191 ?auto_13192 ) ) ( not ( = ?auto_13191 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13192 ?auto_13193 )
      ( !STACK ?auto_13192 ?auto_13191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13200 - BLOCK
      ?auto_13201 - BLOCK
      ?auto_13202 - BLOCK
      ?auto_13203 - BLOCK
      ?auto_13204 - BLOCK
      ?auto_13205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13204 ) ( ON-TABLE ?auto_13205 ) ( CLEAR ?auto_13205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13200 ) ( ON ?auto_13201 ?auto_13200 ) ( ON ?auto_13202 ?auto_13201 ) ( ON ?auto_13203 ?auto_13202 ) ( ON ?auto_13204 ?auto_13203 ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13200 ?auto_13204 ) ) ( not ( = ?auto_13200 ?auto_13205 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13203 ) ) ( not ( = ?auto_13201 ?auto_13204 ) ) ( not ( = ?auto_13201 ?auto_13205 ) ) ( not ( = ?auto_13202 ?auto_13203 ) ) ( not ( = ?auto_13202 ?auto_13204 ) ) ( not ( = ?auto_13202 ?auto_13205 ) ) ( not ( = ?auto_13203 ?auto_13204 ) ) ( not ( = ?auto_13203 ?auto_13205 ) ) ( not ( = ?auto_13204 ?auto_13205 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_13205 )
      ( !STACK ?auto_13205 ?auto_13204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13212 - BLOCK
      ?auto_13213 - BLOCK
      ?auto_13214 - BLOCK
      ?auto_13215 - BLOCK
      ?auto_13216 - BLOCK
      ?auto_13217 - BLOCK
    )
    :vars
    (
      ?auto_13218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13217 ?auto_13218 ) ( ON-TABLE ?auto_13212 ) ( ON ?auto_13213 ?auto_13212 ) ( ON ?auto_13214 ?auto_13213 ) ( ON ?auto_13215 ?auto_13214 ) ( not ( = ?auto_13212 ?auto_13213 ) ) ( not ( = ?auto_13212 ?auto_13214 ) ) ( not ( = ?auto_13212 ?auto_13215 ) ) ( not ( = ?auto_13212 ?auto_13216 ) ) ( not ( = ?auto_13212 ?auto_13217 ) ) ( not ( = ?auto_13212 ?auto_13218 ) ) ( not ( = ?auto_13213 ?auto_13214 ) ) ( not ( = ?auto_13213 ?auto_13215 ) ) ( not ( = ?auto_13213 ?auto_13216 ) ) ( not ( = ?auto_13213 ?auto_13217 ) ) ( not ( = ?auto_13213 ?auto_13218 ) ) ( not ( = ?auto_13214 ?auto_13215 ) ) ( not ( = ?auto_13214 ?auto_13216 ) ) ( not ( = ?auto_13214 ?auto_13217 ) ) ( not ( = ?auto_13214 ?auto_13218 ) ) ( not ( = ?auto_13215 ?auto_13216 ) ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13218 ) ) ( not ( = ?auto_13216 ?auto_13217 ) ) ( not ( = ?auto_13216 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( CLEAR ?auto_13215 ) ( ON ?auto_13216 ?auto_13217 ) ( CLEAR ?auto_13216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_13212 ?auto_13213 ?auto_13214 ?auto_13215 ?auto_13216 )
      ( MAKE-6PILE ?auto_13212 ?auto_13213 ?auto_13214 ?auto_13215 ?auto_13216 ?auto_13217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13225 - BLOCK
      ?auto_13226 - BLOCK
      ?auto_13227 - BLOCK
      ?auto_13228 - BLOCK
      ?auto_13229 - BLOCK
      ?auto_13230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13230 ) ( ON-TABLE ?auto_13225 ) ( ON ?auto_13226 ?auto_13225 ) ( ON ?auto_13227 ?auto_13226 ) ( ON ?auto_13228 ?auto_13227 ) ( not ( = ?auto_13225 ?auto_13226 ) ) ( not ( = ?auto_13225 ?auto_13227 ) ) ( not ( = ?auto_13225 ?auto_13228 ) ) ( not ( = ?auto_13225 ?auto_13229 ) ) ( not ( = ?auto_13225 ?auto_13230 ) ) ( not ( = ?auto_13226 ?auto_13227 ) ) ( not ( = ?auto_13226 ?auto_13228 ) ) ( not ( = ?auto_13226 ?auto_13229 ) ) ( not ( = ?auto_13226 ?auto_13230 ) ) ( not ( = ?auto_13227 ?auto_13228 ) ) ( not ( = ?auto_13227 ?auto_13229 ) ) ( not ( = ?auto_13227 ?auto_13230 ) ) ( not ( = ?auto_13228 ?auto_13229 ) ) ( not ( = ?auto_13228 ?auto_13230 ) ) ( not ( = ?auto_13229 ?auto_13230 ) ) ( CLEAR ?auto_13228 ) ( ON ?auto_13229 ?auto_13230 ) ( CLEAR ?auto_13229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_13225 ?auto_13226 ?auto_13227 ?auto_13228 ?auto_13229 )
      ( MAKE-6PILE ?auto_13225 ?auto_13226 ?auto_13227 ?auto_13228 ?auto_13229 ?auto_13230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13237 - BLOCK
      ?auto_13238 - BLOCK
      ?auto_13239 - BLOCK
      ?auto_13240 - BLOCK
      ?auto_13241 - BLOCK
      ?auto_13242 - BLOCK
    )
    :vars
    (
      ?auto_13243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13242 ?auto_13243 ) ( ON-TABLE ?auto_13237 ) ( ON ?auto_13238 ?auto_13237 ) ( ON ?auto_13239 ?auto_13238 ) ( not ( = ?auto_13237 ?auto_13238 ) ) ( not ( = ?auto_13237 ?auto_13239 ) ) ( not ( = ?auto_13237 ?auto_13240 ) ) ( not ( = ?auto_13237 ?auto_13241 ) ) ( not ( = ?auto_13237 ?auto_13242 ) ) ( not ( = ?auto_13237 ?auto_13243 ) ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( not ( = ?auto_13238 ?auto_13241 ) ) ( not ( = ?auto_13238 ?auto_13242 ) ) ( not ( = ?auto_13238 ?auto_13243 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13241 ) ) ( not ( = ?auto_13239 ?auto_13242 ) ) ( not ( = ?auto_13239 ?auto_13243 ) ) ( not ( = ?auto_13240 ?auto_13241 ) ) ( not ( = ?auto_13240 ?auto_13242 ) ) ( not ( = ?auto_13240 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( ON ?auto_13241 ?auto_13242 ) ( CLEAR ?auto_13239 ) ( ON ?auto_13240 ?auto_13241 ) ( CLEAR ?auto_13240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13237 ?auto_13238 ?auto_13239 ?auto_13240 )
      ( MAKE-6PILE ?auto_13237 ?auto_13238 ?auto_13239 ?auto_13240 ?auto_13241 ?auto_13242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13250 - BLOCK
      ?auto_13251 - BLOCK
      ?auto_13252 - BLOCK
      ?auto_13253 - BLOCK
      ?auto_13254 - BLOCK
      ?auto_13255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13255 ) ( ON-TABLE ?auto_13250 ) ( ON ?auto_13251 ?auto_13250 ) ( ON ?auto_13252 ?auto_13251 ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13253 ) ) ( not ( = ?auto_13250 ?auto_13254 ) ) ( not ( = ?auto_13250 ?auto_13255 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13254 ) ) ( not ( = ?auto_13251 ?auto_13255 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13252 ?auto_13255 ) ) ( not ( = ?auto_13253 ?auto_13254 ) ) ( not ( = ?auto_13253 ?auto_13255 ) ) ( not ( = ?auto_13254 ?auto_13255 ) ) ( ON ?auto_13254 ?auto_13255 ) ( CLEAR ?auto_13252 ) ( ON ?auto_13253 ?auto_13254 ) ( CLEAR ?auto_13253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13253 )
      ( MAKE-6PILE ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13253 ?auto_13254 ?auto_13255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13262 - BLOCK
      ?auto_13263 - BLOCK
      ?auto_13264 - BLOCK
      ?auto_13265 - BLOCK
      ?auto_13266 - BLOCK
      ?auto_13267 - BLOCK
    )
    :vars
    (
      ?auto_13268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13267 ?auto_13268 ) ( ON-TABLE ?auto_13262 ) ( ON ?auto_13263 ?auto_13262 ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( not ( = ?auto_13262 ?auto_13264 ) ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13262 ?auto_13266 ) ) ( not ( = ?auto_13262 ?auto_13267 ) ) ( not ( = ?auto_13262 ?auto_13268 ) ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( not ( = ?auto_13263 ?auto_13265 ) ) ( not ( = ?auto_13263 ?auto_13266 ) ) ( not ( = ?auto_13263 ?auto_13267 ) ) ( not ( = ?auto_13263 ?auto_13268 ) ) ( not ( = ?auto_13264 ?auto_13265 ) ) ( not ( = ?auto_13264 ?auto_13266 ) ) ( not ( = ?auto_13264 ?auto_13267 ) ) ( not ( = ?auto_13264 ?auto_13268 ) ) ( not ( = ?auto_13265 ?auto_13266 ) ) ( not ( = ?auto_13265 ?auto_13267 ) ) ( not ( = ?auto_13265 ?auto_13268 ) ) ( not ( = ?auto_13266 ?auto_13267 ) ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( ON ?auto_13266 ?auto_13267 ) ( ON ?auto_13265 ?auto_13266 ) ( CLEAR ?auto_13263 ) ( ON ?auto_13264 ?auto_13265 ) ( CLEAR ?auto_13264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13262 ?auto_13263 ?auto_13264 )
      ( MAKE-6PILE ?auto_13262 ?auto_13263 ?auto_13264 ?auto_13265 ?auto_13266 ?auto_13267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13275 - BLOCK
      ?auto_13276 - BLOCK
      ?auto_13277 - BLOCK
      ?auto_13278 - BLOCK
      ?auto_13279 - BLOCK
      ?auto_13280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13280 ) ( ON-TABLE ?auto_13275 ) ( ON ?auto_13276 ?auto_13275 ) ( not ( = ?auto_13275 ?auto_13276 ) ) ( not ( = ?auto_13275 ?auto_13277 ) ) ( not ( = ?auto_13275 ?auto_13278 ) ) ( not ( = ?auto_13275 ?auto_13279 ) ) ( not ( = ?auto_13275 ?auto_13280 ) ) ( not ( = ?auto_13276 ?auto_13277 ) ) ( not ( = ?auto_13276 ?auto_13278 ) ) ( not ( = ?auto_13276 ?auto_13279 ) ) ( not ( = ?auto_13276 ?auto_13280 ) ) ( not ( = ?auto_13277 ?auto_13278 ) ) ( not ( = ?auto_13277 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13280 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13280 ) ) ( not ( = ?auto_13279 ?auto_13280 ) ) ( ON ?auto_13279 ?auto_13280 ) ( ON ?auto_13278 ?auto_13279 ) ( CLEAR ?auto_13276 ) ( ON ?auto_13277 ?auto_13278 ) ( CLEAR ?auto_13277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13275 ?auto_13276 ?auto_13277 )
      ( MAKE-6PILE ?auto_13275 ?auto_13276 ?auto_13277 ?auto_13278 ?auto_13279 ?auto_13280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13287 - BLOCK
      ?auto_13288 - BLOCK
      ?auto_13289 - BLOCK
      ?auto_13290 - BLOCK
      ?auto_13291 - BLOCK
      ?auto_13292 - BLOCK
    )
    :vars
    (
      ?auto_13293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13292 ?auto_13293 ) ( ON-TABLE ?auto_13287 ) ( not ( = ?auto_13287 ?auto_13288 ) ) ( not ( = ?auto_13287 ?auto_13289 ) ) ( not ( = ?auto_13287 ?auto_13290 ) ) ( not ( = ?auto_13287 ?auto_13291 ) ) ( not ( = ?auto_13287 ?auto_13292 ) ) ( not ( = ?auto_13287 ?auto_13293 ) ) ( not ( = ?auto_13288 ?auto_13289 ) ) ( not ( = ?auto_13288 ?auto_13290 ) ) ( not ( = ?auto_13288 ?auto_13291 ) ) ( not ( = ?auto_13288 ?auto_13292 ) ) ( not ( = ?auto_13288 ?auto_13293 ) ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13289 ?auto_13291 ) ) ( not ( = ?auto_13289 ?auto_13292 ) ) ( not ( = ?auto_13289 ?auto_13293 ) ) ( not ( = ?auto_13290 ?auto_13291 ) ) ( not ( = ?auto_13290 ?auto_13292 ) ) ( not ( = ?auto_13290 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( ON ?auto_13291 ?auto_13292 ) ( ON ?auto_13290 ?auto_13291 ) ( ON ?auto_13289 ?auto_13290 ) ( CLEAR ?auto_13287 ) ( ON ?auto_13288 ?auto_13289 ) ( CLEAR ?auto_13288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13287 ?auto_13288 )
      ( MAKE-6PILE ?auto_13287 ?auto_13288 ?auto_13289 ?auto_13290 ?auto_13291 ?auto_13292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13300 - BLOCK
      ?auto_13301 - BLOCK
      ?auto_13302 - BLOCK
      ?auto_13303 - BLOCK
      ?auto_13304 - BLOCK
      ?auto_13305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13305 ) ( ON-TABLE ?auto_13300 ) ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13300 ?auto_13302 ) ) ( not ( = ?auto_13300 ?auto_13303 ) ) ( not ( = ?auto_13300 ?auto_13304 ) ) ( not ( = ?auto_13300 ?auto_13305 ) ) ( not ( = ?auto_13301 ?auto_13302 ) ) ( not ( = ?auto_13301 ?auto_13303 ) ) ( not ( = ?auto_13301 ?auto_13304 ) ) ( not ( = ?auto_13301 ?auto_13305 ) ) ( not ( = ?auto_13302 ?auto_13303 ) ) ( not ( = ?auto_13302 ?auto_13304 ) ) ( not ( = ?auto_13302 ?auto_13305 ) ) ( not ( = ?auto_13303 ?auto_13304 ) ) ( not ( = ?auto_13303 ?auto_13305 ) ) ( not ( = ?auto_13304 ?auto_13305 ) ) ( ON ?auto_13304 ?auto_13305 ) ( ON ?auto_13303 ?auto_13304 ) ( ON ?auto_13302 ?auto_13303 ) ( CLEAR ?auto_13300 ) ( ON ?auto_13301 ?auto_13302 ) ( CLEAR ?auto_13301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13300 ?auto_13301 )
      ( MAKE-6PILE ?auto_13300 ?auto_13301 ?auto_13302 ?auto_13303 ?auto_13304 ?auto_13305 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13312 - BLOCK
      ?auto_13313 - BLOCK
      ?auto_13314 - BLOCK
      ?auto_13315 - BLOCK
      ?auto_13316 - BLOCK
      ?auto_13317 - BLOCK
    )
    :vars
    (
      ?auto_13318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13317 ?auto_13318 ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13314 ) ) ( not ( = ?auto_13312 ?auto_13315 ) ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13312 ?auto_13317 ) ) ( not ( = ?auto_13312 ?auto_13318 ) ) ( not ( = ?auto_13313 ?auto_13314 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13316 ) ) ( not ( = ?auto_13313 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13318 ) ) ( not ( = ?auto_13314 ?auto_13315 ) ) ( not ( = ?auto_13314 ?auto_13316 ) ) ( not ( = ?auto_13314 ?auto_13317 ) ) ( not ( = ?auto_13314 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( ON ?auto_13316 ?auto_13317 ) ( ON ?auto_13315 ?auto_13316 ) ( ON ?auto_13314 ?auto_13315 ) ( ON ?auto_13313 ?auto_13314 ) ( ON ?auto_13312 ?auto_13313 ) ( CLEAR ?auto_13312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13312 )
      ( MAKE-6PILE ?auto_13312 ?auto_13313 ?auto_13314 ?auto_13315 ?auto_13316 ?auto_13317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13325 - BLOCK
      ?auto_13326 - BLOCK
      ?auto_13327 - BLOCK
      ?auto_13328 - BLOCK
      ?auto_13329 - BLOCK
      ?auto_13330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13330 ) ( not ( = ?auto_13325 ?auto_13326 ) ) ( not ( = ?auto_13325 ?auto_13327 ) ) ( not ( = ?auto_13325 ?auto_13328 ) ) ( not ( = ?auto_13325 ?auto_13329 ) ) ( not ( = ?auto_13325 ?auto_13330 ) ) ( not ( = ?auto_13326 ?auto_13327 ) ) ( not ( = ?auto_13326 ?auto_13328 ) ) ( not ( = ?auto_13326 ?auto_13329 ) ) ( not ( = ?auto_13326 ?auto_13330 ) ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13327 ?auto_13330 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13330 ) ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( ON ?auto_13329 ?auto_13330 ) ( ON ?auto_13328 ?auto_13329 ) ( ON ?auto_13327 ?auto_13328 ) ( ON ?auto_13326 ?auto_13327 ) ( ON ?auto_13325 ?auto_13326 ) ( CLEAR ?auto_13325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13325 )
      ( MAKE-6PILE ?auto_13325 ?auto_13326 ?auto_13327 ?auto_13328 ?auto_13329 ?auto_13330 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_13337 - BLOCK
      ?auto_13338 - BLOCK
      ?auto_13339 - BLOCK
      ?auto_13340 - BLOCK
      ?auto_13341 - BLOCK
      ?auto_13342 - BLOCK
    )
    :vars
    (
      ?auto_13343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13337 ?auto_13338 ) ) ( not ( = ?auto_13337 ?auto_13339 ) ) ( not ( = ?auto_13337 ?auto_13340 ) ) ( not ( = ?auto_13337 ?auto_13341 ) ) ( not ( = ?auto_13337 ?auto_13342 ) ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13340 ) ) ( not ( = ?auto_13338 ?auto_13341 ) ) ( not ( = ?auto_13338 ?auto_13342 ) ) ( not ( = ?auto_13339 ?auto_13340 ) ) ( not ( = ?auto_13339 ?auto_13341 ) ) ( not ( = ?auto_13339 ?auto_13342 ) ) ( not ( = ?auto_13340 ?auto_13341 ) ) ( not ( = ?auto_13340 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( ON ?auto_13337 ?auto_13343 ) ( not ( = ?auto_13342 ?auto_13343 ) ) ( not ( = ?auto_13341 ?auto_13343 ) ) ( not ( = ?auto_13340 ?auto_13343 ) ) ( not ( = ?auto_13339 ?auto_13343 ) ) ( not ( = ?auto_13338 ?auto_13343 ) ) ( not ( = ?auto_13337 ?auto_13343 ) ) ( ON ?auto_13338 ?auto_13337 ) ( ON ?auto_13339 ?auto_13338 ) ( ON ?auto_13340 ?auto_13339 ) ( ON ?auto_13341 ?auto_13340 ) ( ON ?auto_13342 ?auto_13341 ) ( CLEAR ?auto_13342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_13342 ?auto_13341 ?auto_13340 ?auto_13339 ?auto_13338 ?auto_13337 )
      ( MAKE-6PILE ?auto_13337 ?auto_13338 ?auto_13339 ?auto_13340 ?auto_13341 ?auto_13342 ) )
  )

)

