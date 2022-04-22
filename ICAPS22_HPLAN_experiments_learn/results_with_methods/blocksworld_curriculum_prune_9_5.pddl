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
      ?auto_54921 - BLOCK
    )
    :vars
    (
      ?auto_54922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54921 ?auto_54922 ) ( CLEAR ?auto_54921 ) ( HAND-EMPTY ) ( not ( = ?auto_54921 ?auto_54922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54921 ?auto_54922 )
      ( !PUTDOWN ?auto_54921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54928 - BLOCK
      ?auto_54929 - BLOCK
    )
    :vars
    (
      ?auto_54930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54928 ) ( ON ?auto_54929 ?auto_54930 ) ( CLEAR ?auto_54929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54928 ) ( not ( = ?auto_54928 ?auto_54929 ) ) ( not ( = ?auto_54928 ?auto_54930 ) ) ( not ( = ?auto_54929 ?auto_54930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54929 ?auto_54930 )
      ( !STACK ?auto_54929 ?auto_54928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_54938 - BLOCK
      ?auto_54939 - BLOCK
    )
    :vars
    (
      ?auto_54940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54939 ?auto_54940 ) ( not ( = ?auto_54938 ?auto_54939 ) ) ( not ( = ?auto_54938 ?auto_54940 ) ) ( not ( = ?auto_54939 ?auto_54940 ) ) ( ON ?auto_54938 ?auto_54939 ) ( CLEAR ?auto_54938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54938 )
      ( MAKE-2PILE ?auto_54938 ?auto_54939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54949 - BLOCK
      ?auto_54950 - BLOCK
      ?auto_54951 - BLOCK
    )
    :vars
    (
      ?auto_54952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54950 ) ( ON ?auto_54951 ?auto_54952 ) ( CLEAR ?auto_54951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54949 ) ( ON ?auto_54950 ?auto_54949 ) ( not ( = ?auto_54949 ?auto_54950 ) ) ( not ( = ?auto_54949 ?auto_54951 ) ) ( not ( = ?auto_54949 ?auto_54952 ) ) ( not ( = ?auto_54950 ?auto_54951 ) ) ( not ( = ?auto_54950 ?auto_54952 ) ) ( not ( = ?auto_54951 ?auto_54952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54951 ?auto_54952 )
      ( !STACK ?auto_54951 ?auto_54950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54963 - BLOCK
      ?auto_54964 - BLOCK
      ?auto_54965 - BLOCK
    )
    :vars
    (
      ?auto_54966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54965 ?auto_54966 ) ( ON-TABLE ?auto_54963 ) ( not ( = ?auto_54963 ?auto_54964 ) ) ( not ( = ?auto_54963 ?auto_54965 ) ) ( not ( = ?auto_54963 ?auto_54966 ) ) ( not ( = ?auto_54964 ?auto_54965 ) ) ( not ( = ?auto_54964 ?auto_54966 ) ) ( not ( = ?auto_54965 ?auto_54966 ) ) ( CLEAR ?auto_54963 ) ( ON ?auto_54964 ?auto_54965 ) ( CLEAR ?auto_54964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54963 ?auto_54964 )
      ( MAKE-3PILE ?auto_54963 ?auto_54964 ?auto_54965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_54977 - BLOCK
      ?auto_54978 - BLOCK
      ?auto_54979 - BLOCK
    )
    :vars
    (
      ?auto_54980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54979 ?auto_54980 ) ( not ( = ?auto_54977 ?auto_54978 ) ) ( not ( = ?auto_54977 ?auto_54979 ) ) ( not ( = ?auto_54977 ?auto_54980 ) ) ( not ( = ?auto_54978 ?auto_54979 ) ) ( not ( = ?auto_54978 ?auto_54980 ) ) ( not ( = ?auto_54979 ?auto_54980 ) ) ( ON ?auto_54978 ?auto_54979 ) ( ON ?auto_54977 ?auto_54978 ) ( CLEAR ?auto_54977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54977 )
      ( MAKE-3PILE ?auto_54977 ?auto_54978 ?auto_54979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_54992 - BLOCK
      ?auto_54993 - BLOCK
      ?auto_54994 - BLOCK
      ?auto_54995 - BLOCK
    )
    :vars
    (
      ?auto_54996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54994 ) ( ON ?auto_54995 ?auto_54996 ) ( CLEAR ?auto_54995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54992 ) ( ON ?auto_54993 ?auto_54992 ) ( ON ?auto_54994 ?auto_54993 ) ( not ( = ?auto_54992 ?auto_54993 ) ) ( not ( = ?auto_54992 ?auto_54994 ) ) ( not ( = ?auto_54992 ?auto_54995 ) ) ( not ( = ?auto_54992 ?auto_54996 ) ) ( not ( = ?auto_54993 ?auto_54994 ) ) ( not ( = ?auto_54993 ?auto_54995 ) ) ( not ( = ?auto_54993 ?auto_54996 ) ) ( not ( = ?auto_54994 ?auto_54995 ) ) ( not ( = ?auto_54994 ?auto_54996 ) ) ( not ( = ?auto_54995 ?auto_54996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54995 ?auto_54996 )
      ( !STACK ?auto_54995 ?auto_54994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55010 - BLOCK
      ?auto_55011 - BLOCK
      ?auto_55012 - BLOCK
      ?auto_55013 - BLOCK
    )
    :vars
    (
      ?auto_55014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55013 ?auto_55014 ) ( ON-TABLE ?auto_55010 ) ( ON ?auto_55011 ?auto_55010 ) ( not ( = ?auto_55010 ?auto_55011 ) ) ( not ( = ?auto_55010 ?auto_55012 ) ) ( not ( = ?auto_55010 ?auto_55013 ) ) ( not ( = ?auto_55010 ?auto_55014 ) ) ( not ( = ?auto_55011 ?auto_55012 ) ) ( not ( = ?auto_55011 ?auto_55013 ) ) ( not ( = ?auto_55011 ?auto_55014 ) ) ( not ( = ?auto_55012 ?auto_55013 ) ) ( not ( = ?auto_55012 ?auto_55014 ) ) ( not ( = ?auto_55013 ?auto_55014 ) ) ( CLEAR ?auto_55011 ) ( ON ?auto_55012 ?auto_55013 ) ( CLEAR ?auto_55012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55010 ?auto_55011 ?auto_55012 )
      ( MAKE-4PILE ?auto_55010 ?auto_55011 ?auto_55012 ?auto_55013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55028 - BLOCK
      ?auto_55029 - BLOCK
      ?auto_55030 - BLOCK
      ?auto_55031 - BLOCK
    )
    :vars
    (
      ?auto_55032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55031 ?auto_55032 ) ( ON-TABLE ?auto_55028 ) ( not ( = ?auto_55028 ?auto_55029 ) ) ( not ( = ?auto_55028 ?auto_55030 ) ) ( not ( = ?auto_55028 ?auto_55031 ) ) ( not ( = ?auto_55028 ?auto_55032 ) ) ( not ( = ?auto_55029 ?auto_55030 ) ) ( not ( = ?auto_55029 ?auto_55031 ) ) ( not ( = ?auto_55029 ?auto_55032 ) ) ( not ( = ?auto_55030 ?auto_55031 ) ) ( not ( = ?auto_55030 ?auto_55032 ) ) ( not ( = ?auto_55031 ?auto_55032 ) ) ( ON ?auto_55030 ?auto_55031 ) ( CLEAR ?auto_55028 ) ( ON ?auto_55029 ?auto_55030 ) ( CLEAR ?auto_55029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55028 ?auto_55029 )
      ( MAKE-4PILE ?auto_55028 ?auto_55029 ?auto_55030 ?auto_55031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_55046 - BLOCK
      ?auto_55047 - BLOCK
      ?auto_55048 - BLOCK
      ?auto_55049 - BLOCK
    )
    :vars
    (
      ?auto_55050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55049 ?auto_55050 ) ( not ( = ?auto_55046 ?auto_55047 ) ) ( not ( = ?auto_55046 ?auto_55048 ) ) ( not ( = ?auto_55046 ?auto_55049 ) ) ( not ( = ?auto_55046 ?auto_55050 ) ) ( not ( = ?auto_55047 ?auto_55048 ) ) ( not ( = ?auto_55047 ?auto_55049 ) ) ( not ( = ?auto_55047 ?auto_55050 ) ) ( not ( = ?auto_55048 ?auto_55049 ) ) ( not ( = ?auto_55048 ?auto_55050 ) ) ( not ( = ?auto_55049 ?auto_55050 ) ) ( ON ?auto_55048 ?auto_55049 ) ( ON ?auto_55047 ?auto_55048 ) ( ON ?auto_55046 ?auto_55047 ) ( CLEAR ?auto_55046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55046 )
      ( MAKE-4PILE ?auto_55046 ?auto_55047 ?auto_55048 ?auto_55049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55065 - BLOCK
      ?auto_55066 - BLOCK
      ?auto_55067 - BLOCK
      ?auto_55068 - BLOCK
      ?auto_55069 - BLOCK
    )
    :vars
    (
      ?auto_55070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55068 ) ( ON ?auto_55069 ?auto_55070 ) ( CLEAR ?auto_55069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55065 ) ( ON ?auto_55066 ?auto_55065 ) ( ON ?auto_55067 ?auto_55066 ) ( ON ?auto_55068 ?auto_55067 ) ( not ( = ?auto_55065 ?auto_55066 ) ) ( not ( = ?auto_55065 ?auto_55067 ) ) ( not ( = ?auto_55065 ?auto_55068 ) ) ( not ( = ?auto_55065 ?auto_55069 ) ) ( not ( = ?auto_55065 ?auto_55070 ) ) ( not ( = ?auto_55066 ?auto_55067 ) ) ( not ( = ?auto_55066 ?auto_55068 ) ) ( not ( = ?auto_55066 ?auto_55069 ) ) ( not ( = ?auto_55066 ?auto_55070 ) ) ( not ( = ?auto_55067 ?auto_55068 ) ) ( not ( = ?auto_55067 ?auto_55069 ) ) ( not ( = ?auto_55067 ?auto_55070 ) ) ( not ( = ?auto_55068 ?auto_55069 ) ) ( not ( = ?auto_55068 ?auto_55070 ) ) ( not ( = ?auto_55069 ?auto_55070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55069 ?auto_55070 )
      ( !STACK ?auto_55069 ?auto_55068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55087 - BLOCK
      ?auto_55088 - BLOCK
      ?auto_55089 - BLOCK
      ?auto_55090 - BLOCK
      ?auto_55091 - BLOCK
    )
    :vars
    (
      ?auto_55092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55091 ?auto_55092 ) ( ON-TABLE ?auto_55087 ) ( ON ?auto_55088 ?auto_55087 ) ( ON ?auto_55089 ?auto_55088 ) ( not ( = ?auto_55087 ?auto_55088 ) ) ( not ( = ?auto_55087 ?auto_55089 ) ) ( not ( = ?auto_55087 ?auto_55090 ) ) ( not ( = ?auto_55087 ?auto_55091 ) ) ( not ( = ?auto_55087 ?auto_55092 ) ) ( not ( = ?auto_55088 ?auto_55089 ) ) ( not ( = ?auto_55088 ?auto_55090 ) ) ( not ( = ?auto_55088 ?auto_55091 ) ) ( not ( = ?auto_55088 ?auto_55092 ) ) ( not ( = ?auto_55089 ?auto_55090 ) ) ( not ( = ?auto_55089 ?auto_55091 ) ) ( not ( = ?auto_55089 ?auto_55092 ) ) ( not ( = ?auto_55090 ?auto_55091 ) ) ( not ( = ?auto_55090 ?auto_55092 ) ) ( not ( = ?auto_55091 ?auto_55092 ) ) ( CLEAR ?auto_55089 ) ( ON ?auto_55090 ?auto_55091 ) ( CLEAR ?auto_55090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55087 ?auto_55088 ?auto_55089 ?auto_55090 )
      ( MAKE-5PILE ?auto_55087 ?auto_55088 ?auto_55089 ?auto_55090 ?auto_55091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55109 - BLOCK
      ?auto_55110 - BLOCK
      ?auto_55111 - BLOCK
      ?auto_55112 - BLOCK
      ?auto_55113 - BLOCK
    )
    :vars
    (
      ?auto_55114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55113 ?auto_55114 ) ( ON-TABLE ?auto_55109 ) ( ON ?auto_55110 ?auto_55109 ) ( not ( = ?auto_55109 ?auto_55110 ) ) ( not ( = ?auto_55109 ?auto_55111 ) ) ( not ( = ?auto_55109 ?auto_55112 ) ) ( not ( = ?auto_55109 ?auto_55113 ) ) ( not ( = ?auto_55109 ?auto_55114 ) ) ( not ( = ?auto_55110 ?auto_55111 ) ) ( not ( = ?auto_55110 ?auto_55112 ) ) ( not ( = ?auto_55110 ?auto_55113 ) ) ( not ( = ?auto_55110 ?auto_55114 ) ) ( not ( = ?auto_55111 ?auto_55112 ) ) ( not ( = ?auto_55111 ?auto_55113 ) ) ( not ( = ?auto_55111 ?auto_55114 ) ) ( not ( = ?auto_55112 ?auto_55113 ) ) ( not ( = ?auto_55112 ?auto_55114 ) ) ( not ( = ?auto_55113 ?auto_55114 ) ) ( ON ?auto_55112 ?auto_55113 ) ( CLEAR ?auto_55110 ) ( ON ?auto_55111 ?auto_55112 ) ( CLEAR ?auto_55111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55109 ?auto_55110 ?auto_55111 )
      ( MAKE-5PILE ?auto_55109 ?auto_55110 ?auto_55111 ?auto_55112 ?auto_55113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55131 - BLOCK
      ?auto_55132 - BLOCK
      ?auto_55133 - BLOCK
      ?auto_55134 - BLOCK
      ?auto_55135 - BLOCK
    )
    :vars
    (
      ?auto_55136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55135 ?auto_55136 ) ( ON-TABLE ?auto_55131 ) ( not ( = ?auto_55131 ?auto_55132 ) ) ( not ( = ?auto_55131 ?auto_55133 ) ) ( not ( = ?auto_55131 ?auto_55134 ) ) ( not ( = ?auto_55131 ?auto_55135 ) ) ( not ( = ?auto_55131 ?auto_55136 ) ) ( not ( = ?auto_55132 ?auto_55133 ) ) ( not ( = ?auto_55132 ?auto_55134 ) ) ( not ( = ?auto_55132 ?auto_55135 ) ) ( not ( = ?auto_55132 ?auto_55136 ) ) ( not ( = ?auto_55133 ?auto_55134 ) ) ( not ( = ?auto_55133 ?auto_55135 ) ) ( not ( = ?auto_55133 ?auto_55136 ) ) ( not ( = ?auto_55134 ?auto_55135 ) ) ( not ( = ?auto_55134 ?auto_55136 ) ) ( not ( = ?auto_55135 ?auto_55136 ) ) ( ON ?auto_55134 ?auto_55135 ) ( ON ?auto_55133 ?auto_55134 ) ( CLEAR ?auto_55131 ) ( ON ?auto_55132 ?auto_55133 ) ( CLEAR ?auto_55132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55131 ?auto_55132 )
      ( MAKE-5PILE ?auto_55131 ?auto_55132 ?auto_55133 ?auto_55134 ?auto_55135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_55153 - BLOCK
      ?auto_55154 - BLOCK
      ?auto_55155 - BLOCK
      ?auto_55156 - BLOCK
      ?auto_55157 - BLOCK
    )
    :vars
    (
      ?auto_55158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55157 ?auto_55158 ) ( not ( = ?auto_55153 ?auto_55154 ) ) ( not ( = ?auto_55153 ?auto_55155 ) ) ( not ( = ?auto_55153 ?auto_55156 ) ) ( not ( = ?auto_55153 ?auto_55157 ) ) ( not ( = ?auto_55153 ?auto_55158 ) ) ( not ( = ?auto_55154 ?auto_55155 ) ) ( not ( = ?auto_55154 ?auto_55156 ) ) ( not ( = ?auto_55154 ?auto_55157 ) ) ( not ( = ?auto_55154 ?auto_55158 ) ) ( not ( = ?auto_55155 ?auto_55156 ) ) ( not ( = ?auto_55155 ?auto_55157 ) ) ( not ( = ?auto_55155 ?auto_55158 ) ) ( not ( = ?auto_55156 ?auto_55157 ) ) ( not ( = ?auto_55156 ?auto_55158 ) ) ( not ( = ?auto_55157 ?auto_55158 ) ) ( ON ?auto_55156 ?auto_55157 ) ( ON ?auto_55155 ?auto_55156 ) ( ON ?auto_55154 ?auto_55155 ) ( ON ?auto_55153 ?auto_55154 ) ( CLEAR ?auto_55153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55153 )
      ( MAKE-5PILE ?auto_55153 ?auto_55154 ?auto_55155 ?auto_55156 ?auto_55157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55176 - BLOCK
      ?auto_55177 - BLOCK
      ?auto_55178 - BLOCK
      ?auto_55179 - BLOCK
      ?auto_55180 - BLOCK
      ?auto_55181 - BLOCK
    )
    :vars
    (
      ?auto_55182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55180 ) ( ON ?auto_55181 ?auto_55182 ) ( CLEAR ?auto_55181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55176 ) ( ON ?auto_55177 ?auto_55176 ) ( ON ?auto_55178 ?auto_55177 ) ( ON ?auto_55179 ?auto_55178 ) ( ON ?auto_55180 ?auto_55179 ) ( not ( = ?auto_55176 ?auto_55177 ) ) ( not ( = ?auto_55176 ?auto_55178 ) ) ( not ( = ?auto_55176 ?auto_55179 ) ) ( not ( = ?auto_55176 ?auto_55180 ) ) ( not ( = ?auto_55176 ?auto_55181 ) ) ( not ( = ?auto_55176 ?auto_55182 ) ) ( not ( = ?auto_55177 ?auto_55178 ) ) ( not ( = ?auto_55177 ?auto_55179 ) ) ( not ( = ?auto_55177 ?auto_55180 ) ) ( not ( = ?auto_55177 ?auto_55181 ) ) ( not ( = ?auto_55177 ?auto_55182 ) ) ( not ( = ?auto_55178 ?auto_55179 ) ) ( not ( = ?auto_55178 ?auto_55180 ) ) ( not ( = ?auto_55178 ?auto_55181 ) ) ( not ( = ?auto_55178 ?auto_55182 ) ) ( not ( = ?auto_55179 ?auto_55180 ) ) ( not ( = ?auto_55179 ?auto_55181 ) ) ( not ( = ?auto_55179 ?auto_55182 ) ) ( not ( = ?auto_55180 ?auto_55181 ) ) ( not ( = ?auto_55180 ?auto_55182 ) ) ( not ( = ?auto_55181 ?auto_55182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55181 ?auto_55182 )
      ( !STACK ?auto_55181 ?auto_55180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55202 - BLOCK
      ?auto_55203 - BLOCK
      ?auto_55204 - BLOCK
      ?auto_55205 - BLOCK
      ?auto_55206 - BLOCK
      ?auto_55207 - BLOCK
    )
    :vars
    (
      ?auto_55208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55207 ?auto_55208 ) ( ON-TABLE ?auto_55202 ) ( ON ?auto_55203 ?auto_55202 ) ( ON ?auto_55204 ?auto_55203 ) ( ON ?auto_55205 ?auto_55204 ) ( not ( = ?auto_55202 ?auto_55203 ) ) ( not ( = ?auto_55202 ?auto_55204 ) ) ( not ( = ?auto_55202 ?auto_55205 ) ) ( not ( = ?auto_55202 ?auto_55206 ) ) ( not ( = ?auto_55202 ?auto_55207 ) ) ( not ( = ?auto_55202 ?auto_55208 ) ) ( not ( = ?auto_55203 ?auto_55204 ) ) ( not ( = ?auto_55203 ?auto_55205 ) ) ( not ( = ?auto_55203 ?auto_55206 ) ) ( not ( = ?auto_55203 ?auto_55207 ) ) ( not ( = ?auto_55203 ?auto_55208 ) ) ( not ( = ?auto_55204 ?auto_55205 ) ) ( not ( = ?auto_55204 ?auto_55206 ) ) ( not ( = ?auto_55204 ?auto_55207 ) ) ( not ( = ?auto_55204 ?auto_55208 ) ) ( not ( = ?auto_55205 ?auto_55206 ) ) ( not ( = ?auto_55205 ?auto_55207 ) ) ( not ( = ?auto_55205 ?auto_55208 ) ) ( not ( = ?auto_55206 ?auto_55207 ) ) ( not ( = ?auto_55206 ?auto_55208 ) ) ( not ( = ?auto_55207 ?auto_55208 ) ) ( CLEAR ?auto_55205 ) ( ON ?auto_55206 ?auto_55207 ) ( CLEAR ?auto_55206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55202 ?auto_55203 ?auto_55204 ?auto_55205 ?auto_55206 )
      ( MAKE-6PILE ?auto_55202 ?auto_55203 ?auto_55204 ?auto_55205 ?auto_55206 ?auto_55207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55228 - BLOCK
      ?auto_55229 - BLOCK
      ?auto_55230 - BLOCK
      ?auto_55231 - BLOCK
      ?auto_55232 - BLOCK
      ?auto_55233 - BLOCK
    )
    :vars
    (
      ?auto_55234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55233 ?auto_55234 ) ( ON-TABLE ?auto_55228 ) ( ON ?auto_55229 ?auto_55228 ) ( ON ?auto_55230 ?auto_55229 ) ( not ( = ?auto_55228 ?auto_55229 ) ) ( not ( = ?auto_55228 ?auto_55230 ) ) ( not ( = ?auto_55228 ?auto_55231 ) ) ( not ( = ?auto_55228 ?auto_55232 ) ) ( not ( = ?auto_55228 ?auto_55233 ) ) ( not ( = ?auto_55228 ?auto_55234 ) ) ( not ( = ?auto_55229 ?auto_55230 ) ) ( not ( = ?auto_55229 ?auto_55231 ) ) ( not ( = ?auto_55229 ?auto_55232 ) ) ( not ( = ?auto_55229 ?auto_55233 ) ) ( not ( = ?auto_55229 ?auto_55234 ) ) ( not ( = ?auto_55230 ?auto_55231 ) ) ( not ( = ?auto_55230 ?auto_55232 ) ) ( not ( = ?auto_55230 ?auto_55233 ) ) ( not ( = ?auto_55230 ?auto_55234 ) ) ( not ( = ?auto_55231 ?auto_55232 ) ) ( not ( = ?auto_55231 ?auto_55233 ) ) ( not ( = ?auto_55231 ?auto_55234 ) ) ( not ( = ?auto_55232 ?auto_55233 ) ) ( not ( = ?auto_55232 ?auto_55234 ) ) ( not ( = ?auto_55233 ?auto_55234 ) ) ( ON ?auto_55232 ?auto_55233 ) ( CLEAR ?auto_55230 ) ( ON ?auto_55231 ?auto_55232 ) ( CLEAR ?auto_55231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55228 ?auto_55229 ?auto_55230 ?auto_55231 )
      ( MAKE-6PILE ?auto_55228 ?auto_55229 ?auto_55230 ?auto_55231 ?auto_55232 ?auto_55233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55254 - BLOCK
      ?auto_55255 - BLOCK
      ?auto_55256 - BLOCK
      ?auto_55257 - BLOCK
      ?auto_55258 - BLOCK
      ?auto_55259 - BLOCK
    )
    :vars
    (
      ?auto_55260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55259 ?auto_55260 ) ( ON-TABLE ?auto_55254 ) ( ON ?auto_55255 ?auto_55254 ) ( not ( = ?auto_55254 ?auto_55255 ) ) ( not ( = ?auto_55254 ?auto_55256 ) ) ( not ( = ?auto_55254 ?auto_55257 ) ) ( not ( = ?auto_55254 ?auto_55258 ) ) ( not ( = ?auto_55254 ?auto_55259 ) ) ( not ( = ?auto_55254 ?auto_55260 ) ) ( not ( = ?auto_55255 ?auto_55256 ) ) ( not ( = ?auto_55255 ?auto_55257 ) ) ( not ( = ?auto_55255 ?auto_55258 ) ) ( not ( = ?auto_55255 ?auto_55259 ) ) ( not ( = ?auto_55255 ?auto_55260 ) ) ( not ( = ?auto_55256 ?auto_55257 ) ) ( not ( = ?auto_55256 ?auto_55258 ) ) ( not ( = ?auto_55256 ?auto_55259 ) ) ( not ( = ?auto_55256 ?auto_55260 ) ) ( not ( = ?auto_55257 ?auto_55258 ) ) ( not ( = ?auto_55257 ?auto_55259 ) ) ( not ( = ?auto_55257 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55259 ) ) ( not ( = ?auto_55258 ?auto_55260 ) ) ( not ( = ?auto_55259 ?auto_55260 ) ) ( ON ?auto_55258 ?auto_55259 ) ( ON ?auto_55257 ?auto_55258 ) ( CLEAR ?auto_55255 ) ( ON ?auto_55256 ?auto_55257 ) ( CLEAR ?auto_55256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55254 ?auto_55255 ?auto_55256 )
      ( MAKE-6PILE ?auto_55254 ?auto_55255 ?auto_55256 ?auto_55257 ?auto_55258 ?auto_55259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55280 - BLOCK
      ?auto_55281 - BLOCK
      ?auto_55282 - BLOCK
      ?auto_55283 - BLOCK
      ?auto_55284 - BLOCK
      ?auto_55285 - BLOCK
    )
    :vars
    (
      ?auto_55286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55285 ?auto_55286 ) ( ON-TABLE ?auto_55280 ) ( not ( = ?auto_55280 ?auto_55281 ) ) ( not ( = ?auto_55280 ?auto_55282 ) ) ( not ( = ?auto_55280 ?auto_55283 ) ) ( not ( = ?auto_55280 ?auto_55284 ) ) ( not ( = ?auto_55280 ?auto_55285 ) ) ( not ( = ?auto_55280 ?auto_55286 ) ) ( not ( = ?auto_55281 ?auto_55282 ) ) ( not ( = ?auto_55281 ?auto_55283 ) ) ( not ( = ?auto_55281 ?auto_55284 ) ) ( not ( = ?auto_55281 ?auto_55285 ) ) ( not ( = ?auto_55281 ?auto_55286 ) ) ( not ( = ?auto_55282 ?auto_55283 ) ) ( not ( = ?auto_55282 ?auto_55284 ) ) ( not ( = ?auto_55282 ?auto_55285 ) ) ( not ( = ?auto_55282 ?auto_55286 ) ) ( not ( = ?auto_55283 ?auto_55284 ) ) ( not ( = ?auto_55283 ?auto_55285 ) ) ( not ( = ?auto_55283 ?auto_55286 ) ) ( not ( = ?auto_55284 ?auto_55285 ) ) ( not ( = ?auto_55284 ?auto_55286 ) ) ( not ( = ?auto_55285 ?auto_55286 ) ) ( ON ?auto_55284 ?auto_55285 ) ( ON ?auto_55283 ?auto_55284 ) ( ON ?auto_55282 ?auto_55283 ) ( CLEAR ?auto_55280 ) ( ON ?auto_55281 ?auto_55282 ) ( CLEAR ?auto_55281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55280 ?auto_55281 )
      ( MAKE-6PILE ?auto_55280 ?auto_55281 ?auto_55282 ?auto_55283 ?auto_55284 ?auto_55285 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_55306 - BLOCK
      ?auto_55307 - BLOCK
      ?auto_55308 - BLOCK
      ?auto_55309 - BLOCK
      ?auto_55310 - BLOCK
      ?auto_55311 - BLOCK
    )
    :vars
    (
      ?auto_55312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55311 ?auto_55312 ) ( not ( = ?auto_55306 ?auto_55307 ) ) ( not ( = ?auto_55306 ?auto_55308 ) ) ( not ( = ?auto_55306 ?auto_55309 ) ) ( not ( = ?auto_55306 ?auto_55310 ) ) ( not ( = ?auto_55306 ?auto_55311 ) ) ( not ( = ?auto_55306 ?auto_55312 ) ) ( not ( = ?auto_55307 ?auto_55308 ) ) ( not ( = ?auto_55307 ?auto_55309 ) ) ( not ( = ?auto_55307 ?auto_55310 ) ) ( not ( = ?auto_55307 ?auto_55311 ) ) ( not ( = ?auto_55307 ?auto_55312 ) ) ( not ( = ?auto_55308 ?auto_55309 ) ) ( not ( = ?auto_55308 ?auto_55310 ) ) ( not ( = ?auto_55308 ?auto_55311 ) ) ( not ( = ?auto_55308 ?auto_55312 ) ) ( not ( = ?auto_55309 ?auto_55310 ) ) ( not ( = ?auto_55309 ?auto_55311 ) ) ( not ( = ?auto_55309 ?auto_55312 ) ) ( not ( = ?auto_55310 ?auto_55311 ) ) ( not ( = ?auto_55310 ?auto_55312 ) ) ( not ( = ?auto_55311 ?auto_55312 ) ) ( ON ?auto_55310 ?auto_55311 ) ( ON ?auto_55309 ?auto_55310 ) ( ON ?auto_55308 ?auto_55309 ) ( ON ?auto_55307 ?auto_55308 ) ( ON ?auto_55306 ?auto_55307 ) ( CLEAR ?auto_55306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55306 )
      ( MAKE-6PILE ?auto_55306 ?auto_55307 ?auto_55308 ?auto_55309 ?auto_55310 ?auto_55311 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55333 - BLOCK
      ?auto_55334 - BLOCK
      ?auto_55335 - BLOCK
      ?auto_55336 - BLOCK
      ?auto_55337 - BLOCK
      ?auto_55338 - BLOCK
      ?auto_55339 - BLOCK
    )
    :vars
    (
      ?auto_55340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55338 ) ( ON ?auto_55339 ?auto_55340 ) ( CLEAR ?auto_55339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55333 ) ( ON ?auto_55334 ?auto_55333 ) ( ON ?auto_55335 ?auto_55334 ) ( ON ?auto_55336 ?auto_55335 ) ( ON ?auto_55337 ?auto_55336 ) ( ON ?auto_55338 ?auto_55337 ) ( not ( = ?auto_55333 ?auto_55334 ) ) ( not ( = ?auto_55333 ?auto_55335 ) ) ( not ( = ?auto_55333 ?auto_55336 ) ) ( not ( = ?auto_55333 ?auto_55337 ) ) ( not ( = ?auto_55333 ?auto_55338 ) ) ( not ( = ?auto_55333 ?auto_55339 ) ) ( not ( = ?auto_55333 ?auto_55340 ) ) ( not ( = ?auto_55334 ?auto_55335 ) ) ( not ( = ?auto_55334 ?auto_55336 ) ) ( not ( = ?auto_55334 ?auto_55337 ) ) ( not ( = ?auto_55334 ?auto_55338 ) ) ( not ( = ?auto_55334 ?auto_55339 ) ) ( not ( = ?auto_55334 ?auto_55340 ) ) ( not ( = ?auto_55335 ?auto_55336 ) ) ( not ( = ?auto_55335 ?auto_55337 ) ) ( not ( = ?auto_55335 ?auto_55338 ) ) ( not ( = ?auto_55335 ?auto_55339 ) ) ( not ( = ?auto_55335 ?auto_55340 ) ) ( not ( = ?auto_55336 ?auto_55337 ) ) ( not ( = ?auto_55336 ?auto_55338 ) ) ( not ( = ?auto_55336 ?auto_55339 ) ) ( not ( = ?auto_55336 ?auto_55340 ) ) ( not ( = ?auto_55337 ?auto_55338 ) ) ( not ( = ?auto_55337 ?auto_55339 ) ) ( not ( = ?auto_55337 ?auto_55340 ) ) ( not ( = ?auto_55338 ?auto_55339 ) ) ( not ( = ?auto_55338 ?auto_55340 ) ) ( not ( = ?auto_55339 ?auto_55340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55339 ?auto_55340 )
      ( !STACK ?auto_55339 ?auto_55338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55363 - BLOCK
      ?auto_55364 - BLOCK
      ?auto_55365 - BLOCK
      ?auto_55366 - BLOCK
      ?auto_55367 - BLOCK
      ?auto_55368 - BLOCK
      ?auto_55369 - BLOCK
    )
    :vars
    (
      ?auto_55370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55369 ?auto_55370 ) ( ON-TABLE ?auto_55363 ) ( ON ?auto_55364 ?auto_55363 ) ( ON ?auto_55365 ?auto_55364 ) ( ON ?auto_55366 ?auto_55365 ) ( ON ?auto_55367 ?auto_55366 ) ( not ( = ?auto_55363 ?auto_55364 ) ) ( not ( = ?auto_55363 ?auto_55365 ) ) ( not ( = ?auto_55363 ?auto_55366 ) ) ( not ( = ?auto_55363 ?auto_55367 ) ) ( not ( = ?auto_55363 ?auto_55368 ) ) ( not ( = ?auto_55363 ?auto_55369 ) ) ( not ( = ?auto_55363 ?auto_55370 ) ) ( not ( = ?auto_55364 ?auto_55365 ) ) ( not ( = ?auto_55364 ?auto_55366 ) ) ( not ( = ?auto_55364 ?auto_55367 ) ) ( not ( = ?auto_55364 ?auto_55368 ) ) ( not ( = ?auto_55364 ?auto_55369 ) ) ( not ( = ?auto_55364 ?auto_55370 ) ) ( not ( = ?auto_55365 ?auto_55366 ) ) ( not ( = ?auto_55365 ?auto_55367 ) ) ( not ( = ?auto_55365 ?auto_55368 ) ) ( not ( = ?auto_55365 ?auto_55369 ) ) ( not ( = ?auto_55365 ?auto_55370 ) ) ( not ( = ?auto_55366 ?auto_55367 ) ) ( not ( = ?auto_55366 ?auto_55368 ) ) ( not ( = ?auto_55366 ?auto_55369 ) ) ( not ( = ?auto_55366 ?auto_55370 ) ) ( not ( = ?auto_55367 ?auto_55368 ) ) ( not ( = ?auto_55367 ?auto_55369 ) ) ( not ( = ?auto_55367 ?auto_55370 ) ) ( not ( = ?auto_55368 ?auto_55369 ) ) ( not ( = ?auto_55368 ?auto_55370 ) ) ( not ( = ?auto_55369 ?auto_55370 ) ) ( CLEAR ?auto_55367 ) ( ON ?auto_55368 ?auto_55369 ) ( CLEAR ?auto_55368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55363 ?auto_55364 ?auto_55365 ?auto_55366 ?auto_55367 ?auto_55368 )
      ( MAKE-7PILE ?auto_55363 ?auto_55364 ?auto_55365 ?auto_55366 ?auto_55367 ?auto_55368 ?auto_55369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55393 - BLOCK
      ?auto_55394 - BLOCK
      ?auto_55395 - BLOCK
      ?auto_55396 - BLOCK
      ?auto_55397 - BLOCK
      ?auto_55398 - BLOCK
      ?auto_55399 - BLOCK
    )
    :vars
    (
      ?auto_55400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55399 ?auto_55400 ) ( ON-TABLE ?auto_55393 ) ( ON ?auto_55394 ?auto_55393 ) ( ON ?auto_55395 ?auto_55394 ) ( ON ?auto_55396 ?auto_55395 ) ( not ( = ?auto_55393 ?auto_55394 ) ) ( not ( = ?auto_55393 ?auto_55395 ) ) ( not ( = ?auto_55393 ?auto_55396 ) ) ( not ( = ?auto_55393 ?auto_55397 ) ) ( not ( = ?auto_55393 ?auto_55398 ) ) ( not ( = ?auto_55393 ?auto_55399 ) ) ( not ( = ?auto_55393 ?auto_55400 ) ) ( not ( = ?auto_55394 ?auto_55395 ) ) ( not ( = ?auto_55394 ?auto_55396 ) ) ( not ( = ?auto_55394 ?auto_55397 ) ) ( not ( = ?auto_55394 ?auto_55398 ) ) ( not ( = ?auto_55394 ?auto_55399 ) ) ( not ( = ?auto_55394 ?auto_55400 ) ) ( not ( = ?auto_55395 ?auto_55396 ) ) ( not ( = ?auto_55395 ?auto_55397 ) ) ( not ( = ?auto_55395 ?auto_55398 ) ) ( not ( = ?auto_55395 ?auto_55399 ) ) ( not ( = ?auto_55395 ?auto_55400 ) ) ( not ( = ?auto_55396 ?auto_55397 ) ) ( not ( = ?auto_55396 ?auto_55398 ) ) ( not ( = ?auto_55396 ?auto_55399 ) ) ( not ( = ?auto_55396 ?auto_55400 ) ) ( not ( = ?auto_55397 ?auto_55398 ) ) ( not ( = ?auto_55397 ?auto_55399 ) ) ( not ( = ?auto_55397 ?auto_55400 ) ) ( not ( = ?auto_55398 ?auto_55399 ) ) ( not ( = ?auto_55398 ?auto_55400 ) ) ( not ( = ?auto_55399 ?auto_55400 ) ) ( ON ?auto_55398 ?auto_55399 ) ( CLEAR ?auto_55396 ) ( ON ?auto_55397 ?auto_55398 ) ( CLEAR ?auto_55397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55393 ?auto_55394 ?auto_55395 ?auto_55396 ?auto_55397 )
      ( MAKE-7PILE ?auto_55393 ?auto_55394 ?auto_55395 ?auto_55396 ?auto_55397 ?auto_55398 ?auto_55399 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55423 - BLOCK
      ?auto_55424 - BLOCK
      ?auto_55425 - BLOCK
      ?auto_55426 - BLOCK
      ?auto_55427 - BLOCK
      ?auto_55428 - BLOCK
      ?auto_55429 - BLOCK
    )
    :vars
    (
      ?auto_55430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55429 ?auto_55430 ) ( ON-TABLE ?auto_55423 ) ( ON ?auto_55424 ?auto_55423 ) ( ON ?auto_55425 ?auto_55424 ) ( not ( = ?auto_55423 ?auto_55424 ) ) ( not ( = ?auto_55423 ?auto_55425 ) ) ( not ( = ?auto_55423 ?auto_55426 ) ) ( not ( = ?auto_55423 ?auto_55427 ) ) ( not ( = ?auto_55423 ?auto_55428 ) ) ( not ( = ?auto_55423 ?auto_55429 ) ) ( not ( = ?auto_55423 ?auto_55430 ) ) ( not ( = ?auto_55424 ?auto_55425 ) ) ( not ( = ?auto_55424 ?auto_55426 ) ) ( not ( = ?auto_55424 ?auto_55427 ) ) ( not ( = ?auto_55424 ?auto_55428 ) ) ( not ( = ?auto_55424 ?auto_55429 ) ) ( not ( = ?auto_55424 ?auto_55430 ) ) ( not ( = ?auto_55425 ?auto_55426 ) ) ( not ( = ?auto_55425 ?auto_55427 ) ) ( not ( = ?auto_55425 ?auto_55428 ) ) ( not ( = ?auto_55425 ?auto_55429 ) ) ( not ( = ?auto_55425 ?auto_55430 ) ) ( not ( = ?auto_55426 ?auto_55427 ) ) ( not ( = ?auto_55426 ?auto_55428 ) ) ( not ( = ?auto_55426 ?auto_55429 ) ) ( not ( = ?auto_55426 ?auto_55430 ) ) ( not ( = ?auto_55427 ?auto_55428 ) ) ( not ( = ?auto_55427 ?auto_55429 ) ) ( not ( = ?auto_55427 ?auto_55430 ) ) ( not ( = ?auto_55428 ?auto_55429 ) ) ( not ( = ?auto_55428 ?auto_55430 ) ) ( not ( = ?auto_55429 ?auto_55430 ) ) ( ON ?auto_55428 ?auto_55429 ) ( ON ?auto_55427 ?auto_55428 ) ( CLEAR ?auto_55425 ) ( ON ?auto_55426 ?auto_55427 ) ( CLEAR ?auto_55426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55423 ?auto_55424 ?auto_55425 ?auto_55426 )
      ( MAKE-7PILE ?auto_55423 ?auto_55424 ?auto_55425 ?auto_55426 ?auto_55427 ?auto_55428 ?auto_55429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55453 - BLOCK
      ?auto_55454 - BLOCK
      ?auto_55455 - BLOCK
      ?auto_55456 - BLOCK
      ?auto_55457 - BLOCK
      ?auto_55458 - BLOCK
      ?auto_55459 - BLOCK
    )
    :vars
    (
      ?auto_55460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55459 ?auto_55460 ) ( ON-TABLE ?auto_55453 ) ( ON ?auto_55454 ?auto_55453 ) ( not ( = ?auto_55453 ?auto_55454 ) ) ( not ( = ?auto_55453 ?auto_55455 ) ) ( not ( = ?auto_55453 ?auto_55456 ) ) ( not ( = ?auto_55453 ?auto_55457 ) ) ( not ( = ?auto_55453 ?auto_55458 ) ) ( not ( = ?auto_55453 ?auto_55459 ) ) ( not ( = ?auto_55453 ?auto_55460 ) ) ( not ( = ?auto_55454 ?auto_55455 ) ) ( not ( = ?auto_55454 ?auto_55456 ) ) ( not ( = ?auto_55454 ?auto_55457 ) ) ( not ( = ?auto_55454 ?auto_55458 ) ) ( not ( = ?auto_55454 ?auto_55459 ) ) ( not ( = ?auto_55454 ?auto_55460 ) ) ( not ( = ?auto_55455 ?auto_55456 ) ) ( not ( = ?auto_55455 ?auto_55457 ) ) ( not ( = ?auto_55455 ?auto_55458 ) ) ( not ( = ?auto_55455 ?auto_55459 ) ) ( not ( = ?auto_55455 ?auto_55460 ) ) ( not ( = ?auto_55456 ?auto_55457 ) ) ( not ( = ?auto_55456 ?auto_55458 ) ) ( not ( = ?auto_55456 ?auto_55459 ) ) ( not ( = ?auto_55456 ?auto_55460 ) ) ( not ( = ?auto_55457 ?auto_55458 ) ) ( not ( = ?auto_55457 ?auto_55459 ) ) ( not ( = ?auto_55457 ?auto_55460 ) ) ( not ( = ?auto_55458 ?auto_55459 ) ) ( not ( = ?auto_55458 ?auto_55460 ) ) ( not ( = ?auto_55459 ?auto_55460 ) ) ( ON ?auto_55458 ?auto_55459 ) ( ON ?auto_55457 ?auto_55458 ) ( ON ?auto_55456 ?auto_55457 ) ( CLEAR ?auto_55454 ) ( ON ?auto_55455 ?auto_55456 ) ( CLEAR ?auto_55455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55453 ?auto_55454 ?auto_55455 )
      ( MAKE-7PILE ?auto_55453 ?auto_55454 ?auto_55455 ?auto_55456 ?auto_55457 ?auto_55458 ?auto_55459 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55483 - BLOCK
      ?auto_55484 - BLOCK
      ?auto_55485 - BLOCK
      ?auto_55486 - BLOCK
      ?auto_55487 - BLOCK
      ?auto_55488 - BLOCK
      ?auto_55489 - BLOCK
    )
    :vars
    (
      ?auto_55490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55489 ?auto_55490 ) ( ON-TABLE ?auto_55483 ) ( not ( = ?auto_55483 ?auto_55484 ) ) ( not ( = ?auto_55483 ?auto_55485 ) ) ( not ( = ?auto_55483 ?auto_55486 ) ) ( not ( = ?auto_55483 ?auto_55487 ) ) ( not ( = ?auto_55483 ?auto_55488 ) ) ( not ( = ?auto_55483 ?auto_55489 ) ) ( not ( = ?auto_55483 ?auto_55490 ) ) ( not ( = ?auto_55484 ?auto_55485 ) ) ( not ( = ?auto_55484 ?auto_55486 ) ) ( not ( = ?auto_55484 ?auto_55487 ) ) ( not ( = ?auto_55484 ?auto_55488 ) ) ( not ( = ?auto_55484 ?auto_55489 ) ) ( not ( = ?auto_55484 ?auto_55490 ) ) ( not ( = ?auto_55485 ?auto_55486 ) ) ( not ( = ?auto_55485 ?auto_55487 ) ) ( not ( = ?auto_55485 ?auto_55488 ) ) ( not ( = ?auto_55485 ?auto_55489 ) ) ( not ( = ?auto_55485 ?auto_55490 ) ) ( not ( = ?auto_55486 ?auto_55487 ) ) ( not ( = ?auto_55486 ?auto_55488 ) ) ( not ( = ?auto_55486 ?auto_55489 ) ) ( not ( = ?auto_55486 ?auto_55490 ) ) ( not ( = ?auto_55487 ?auto_55488 ) ) ( not ( = ?auto_55487 ?auto_55489 ) ) ( not ( = ?auto_55487 ?auto_55490 ) ) ( not ( = ?auto_55488 ?auto_55489 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55490 ) ) ( ON ?auto_55488 ?auto_55489 ) ( ON ?auto_55487 ?auto_55488 ) ( ON ?auto_55486 ?auto_55487 ) ( ON ?auto_55485 ?auto_55486 ) ( CLEAR ?auto_55483 ) ( ON ?auto_55484 ?auto_55485 ) ( CLEAR ?auto_55484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55483 ?auto_55484 )
      ( MAKE-7PILE ?auto_55483 ?auto_55484 ?auto_55485 ?auto_55486 ?auto_55487 ?auto_55488 ?auto_55489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_55513 - BLOCK
      ?auto_55514 - BLOCK
      ?auto_55515 - BLOCK
      ?auto_55516 - BLOCK
      ?auto_55517 - BLOCK
      ?auto_55518 - BLOCK
      ?auto_55519 - BLOCK
    )
    :vars
    (
      ?auto_55520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55519 ?auto_55520 ) ( not ( = ?auto_55513 ?auto_55514 ) ) ( not ( = ?auto_55513 ?auto_55515 ) ) ( not ( = ?auto_55513 ?auto_55516 ) ) ( not ( = ?auto_55513 ?auto_55517 ) ) ( not ( = ?auto_55513 ?auto_55518 ) ) ( not ( = ?auto_55513 ?auto_55519 ) ) ( not ( = ?auto_55513 ?auto_55520 ) ) ( not ( = ?auto_55514 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55516 ) ) ( not ( = ?auto_55514 ?auto_55517 ) ) ( not ( = ?auto_55514 ?auto_55518 ) ) ( not ( = ?auto_55514 ?auto_55519 ) ) ( not ( = ?auto_55514 ?auto_55520 ) ) ( not ( = ?auto_55515 ?auto_55516 ) ) ( not ( = ?auto_55515 ?auto_55517 ) ) ( not ( = ?auto_55515 ?auto_55518 ) ) ( not ( = ?auto_55515 ?auto_55519 ) ) ( not ( = ?auto_55515 ?auto_55520 ) ) ( not ( = ?auto_55516 ?auto_55517 ) ) ( not ( = ?auto_55516 ?auto_55518 ) ) ( not ( = ?auto_55516 ?auto_55519 ) ) ( not ( = ?auto_55516 ?auto_55520 ) ) ( not ( = ?auto_55517 ?auto_55518 ) ) ( not ( = ?auto_55517 ?auto_55519 ) ) ( not ( = ?auto_55517 ?auto_55520 ) ) ( not ( = ?auto_55518 ?auto_55519 ) ) ( not ( = ?auto_55518 ?auto_55520 ) ) ( not ( = ?auto_55519 ?auto_55520 ) ) ( ON ?auto_55518 ?auto_55519 ) ( ON ?auto_55517 ?auto_55518 ) ( ON ?auto_55516 ?auto_55517 ) ( ON ?auto_55515 ?auto_55516 ) ( ON ?auto_55514 ?auto_55515 ) ( ON ?auto_55513 ?auto_55514 ) ( CLEAR ?auto_55513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55513 )
      ( MAKE-7PILE ?auto_55513 ?auto_55514 ?auto_55515 ?auto_55516 ?auto_55517 ?auto_55518 ?auto_55519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55544 - BLOCK
      ?auto_55545 - BLOCK
      ?auto_55546 - BLOCK
      ?auto_55547 - BLOCK
      ?auto_55548 - BLOCK
      ?auto_55549 - BLOCK
      ?auto_55550 - BLOCK
      ?auto_55551 - BLOCK
    )
    :vars
    (
      ?auto_55552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55550 ) ( ON ?auto_55551 ?auto_55552 ) ( CLEAR ?auto_55551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55544 ) ( ON ?auto_55545 ?auto_55544 ) ( ON ?auto_55546 ?auto_55545 ) ( ON ?auto_55547 ?auto_55546 ) ( ON ?auto_55548 ?auto_55547 ) ( ON ?auto_55549 ?auto_55548 ) ( ON ?auto_55550 ?auto_55549 ) ( not ( = ?auto_55544 ?auto_55545 ) ) ( not ( = ?auto_55544 ?auto_55546 ) ) ( not ( = ?auto_55544 ?auto_55547 ) ) ( not ( = ?auto_55544 ?auto_55548 ) ) ( not ( = ?auto_55544 ?auto_55549 ) ) ( not ( = ?auto_55544 ?auto_55550 ) ) ( not ( = ?auto_55544 ?auto_55551 ) ) ( not ( = ?auto_55544 ?auto_55552 ) ) ( not ( = ?auto_55545 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55547 ) ) ( not ( = ?auto_55545 ?auto_55548 ) ) ( not ( = ?auto_55545 ?auto_55549 ) ) ( not ( = ?auto_55545 ?auto_55550 ) ) ( not ( = ?auto_55545 ?auto_55551 ) ) ( not ( = ?auto_55545 ?auto_55552 ) ) ( not ( = ?auto_55546 ?auto_55547 ) ) ( not ( = ?auto_55546 ?auto_55548 ) ) ( not ( = ?auto_55546 ?auto_55549 ) ) ( not ( = ?auto_55546 ?auto_55550 ) ) ( not ( = ?auto_55546 ?auto_55551 ) ) ( not ( = ?auto_55546 ?auto_55552 ) ) ( not ( = ?auto_55547 ?auto_55548 ) ) ( not ( = ?auto_55547 ?auto_55549 ) ) ( not ( = ?auto_55547 ?auto_55550 ) ) ( not ( = ?auto_55547 ?auto_55551 ) ) ( not ( = ?auto_55547 ?auto_55552 ) ) ( not ( = ?auto_55548 ?auto_55549 ) ) ( not ( = ?auto_55548 ?auto_55550 ) ) ( not ( = ?auto_55548 ?auto_55551 ) ) ( not ( = ?auto_55548 ?auto_55552 ) ) ( not ( = ?auto_55549 ?auto_55550 ) ) ( not ( = ?auto_55549 ?auto_55551 ) ) ( not ( = ?auto_55549 ?auto_55552 ) ) ( not ( = ?auto_55550 ?auto_55551 ) ) ( not ( = ?auto_55550 ?auto_55552 ) ) ( not ( = ?auto_55551 ?auto_55552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55551 ?auto_55552 )
      ( !STACK ?auto_55551 ?auto_55550 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55578 - BLOCK
      ?auto_55579 - BLOCK
      ?auto_55580 - BLOCK
      ?auto_55581 - BLOCK
      ?auto_55582 - BLOCK
      ?auto_55583 - BLOCK
      ?auto_55584 - BLOCK
      ?auto_55585 - BLOCK
    )
    :vars
    (
      ?auto_55586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55585 ?auto_55586 ) ( ON-TABLE ?auto_55578 ) ( ON ?auto_55579 ?auto_55578 ) ( ON ?auto_55580 ?auto_55579 ) ( ON ?auto_55581 ?auto_55580 ) ( ON ?auto_55582 ?auto_55581 ) ( ON ?auto_55583 ?auto_55582 ) ( not ( = ?auto_55578 ?auto_55579 ) ) ( not ( = ?auto_55578 ?auto_55580 ) ) ( not ( = ?auto_55578 ?auto_55581 ) ) ( not ( = ?auto_55578 ?auto_55582 ) ) ( not ( = ?auto_55578 ?auto_55583 ) ) ( not ( = ?auto_55578 ?auto_55584 ) ) ( not ( = ?auto_55578 ?auto_55585 ) ) ( not ( = ?auto_55578 ?auto_55586 ) ) ( not ( = ?auto_55579 ?auto_55580 ) ) ( not ( = ?auto_55579 ?auto_55581 ) ) ( not ( = ?auto_55579 ?auto_55582 ) ) ( not ( = ?auto_55579 ?auto_55583 ) ) ( not ( = ?auto_55579 ?auto_55584 ) ) ( not ( = ?auto_55579 ?auto_55585 ) ) ( not ( = ?auto_55579 ?auto_55586 ) ) ( not ( = ?auto_55580 ?auto_55581 ) ) ( not ( = ?auto_55580 ?auto_55582 ) ) ( not ( = ?auto_55580 ?auto_55583 ) ) ( not ( = ?auto_55580 ?auto_55584 ) ) ( not ( = ?auto_55580 ?auto_55585 ) ) ( not ( = ?auto_55580 ?auto_55586 ) ) ( not ( = ?auto_55581 ?auto_55582 ) ) ( not ( = ?auto_55581 ?auto_55583 ) ) ( not ( = ?auto_55581 ?auto_55584 ) ) ( not ( = ?auto_55581 ?auto_55585 ) ) ( not ( = ?auto_55581 ?auto_55586 ) ) ( not ( = ?auto_55582 ?auto_55583 ) ) ( not ( = ?auto_55582 ?auto_55584 ) ) ( not ( = ?auto_55582 ?auto_55585 ) ) ( not ( = ?auto_55582 ?auto_55586 ) ) ( not ( = ?auto_55583 ?auto_55584 ) ) ( not ( = ?auto_55583 ?auto_55585 ) ) ( not ( = ?auto_55583 ?auto_55586 ) ) ( not ( = ?auto_55584 ?auto_55585 ) ) ( not ( = ?auto_55584 ?auto_55586 ) ) ( not ( = ?auto_55585 ?auto_55586 ) ) ( CLEAR ?auto_55583 ) ( ON ?auto_55584 ?auto_55585 ) ( CLEAR ?auto_55584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_55578 ?auto_55579 ?auto_55580 ?auto_55581 ?auto_55582 ?auto_55583 ?auto_55584 )
      ( MAKE-8PILE ?auto_55578 ?auto_55579 ?auto_55580 ?auto_55581 ?auto_55582 ?auto_55583 ?auto_55584 ?auto_55585 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55612 - BLOCK
      ?auto_55613 - BLOCK
      ?auto_55614 - BLOCK
      ?auto_55615 - BLOCK
      ?auto_55616 - BLOCK
      ?auto_55617 - BLOCK
      ?auto_55618 - BLOCK
      ?auto_55619 - BLOCK
    )
    :vars
    (
      ?auto_55620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55619 ?auto_55620 ) ( ON-TABLE ?auto_55612 ) ( ON ?auto_55613 ?auto_55612 ) ( ON ?auto_55614 ?auto_55613 ) ( ON ?auto_55615 ?auto_55614 ) ( ON ?auto_55616 ?auto_55615 ) ( not ( = ?auto_55612 ?auto_55613 ) ) ( not ( = ?auto_55612 ?auto_55614 ) ) ( not ( = ?auto_55612 ?auto_55615 ) ) ( not ( = ?auto_55612 ?auto_55616 ) ) ( not ( = ?auto_55612 ?auto_55617 ) ) ( not ( = ?auto_55612 ?auto_55618 ) ) ( not ( = ?auto_55612 ?auto_55619 ) ) ( not ( = ?auto_55612 ?auto_55620 ) ) ( not ( = ?auto_55613 ?auto_55614 ) ) ( not ( = ?auto_55613 ?auto_55615 ) ) ( not ( = ?auto_55613 ?auto_55616 ) ) ( not ( = ?auto_55613 ?auto_55617 ) ) ( not ( = ?auto_55613 ?auto_55618 ) ) ( not ( = ?auto_55613 ?auto_55619 ) ) ( not ( = ?auto_55613 ?auto_55620 ) ) ( not ( = ?auto_55614 ?auto_55615 ) ) ( not ( = ?auto_55614 ?auto_55616 ) ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( not ( = ?auto_55614 ?auto_55618 ) ) ( not ( = ?auto_55614 ?auto_55619 ) ) ( not ( = ?auto_55614 ?auto_55620 ) ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( not ( = ?auto_55615 ?auto_55617 ) ) ( not ( = ?auto_55615 ?auto_55618 ) ) ( not ( = ?auto_55615 ?auto_55619 ) ) ( not ( = ?auto_55615 ?auto_55620 ) ) ( not ( = ?auto_55616 ?auto_55617 ) ) ( not ( = ?auto_55616 ?auto_55618 ) ) ( not ( = ?auto_55616 ?auto_55619 ) ) ( not ( = ?auto_55616 ?auto_55620 ) ) ( not ( = ?auto_55617 ?auto_55618 ) ) ( not ( = ?auto_55617 ?auto_55619 ) ) ( not ( = ?auto_55617 ?auto_55620 ) ) ( not ( = ?auto_55618 ?auto_55619 ) ) ( not ( = ?auto_55618 ?auto_55620 ) ) ( not ( = ?auto_55619 ?auto_55620 ) ) ( ON ?auto_55618 ?auto_55619 ) ( CLEAR ?auto_55616 ) ( ON ?auto_55617 ?auto_55618 ) ( CLEAR ?auto_55617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55612 ?auto_55613 ?auto_55614 ?auto_55615 ?auto_55616 ?auto_55617 )
      ( MAKE-8PILE ?auto_55612 ?auto_55613 ?auto_55614 ?auto_55615 ?auto_55616 ?auto_55617 ?auto_55618 ?auto_55619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55646 - BLOCK
      ?auto_55647 - BLOCK
      ?auto_55648 - BLOCK
      ?auto_55649 - BLOCK
      ?auto_55650 - BLOCK
      ?auto_55651 - BLOCK
      ?auto_55652 - BLOCK
      ?auto_55653 - BLOCK
    )
    :vars
    (
      ?auto_55654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55653 ?auto_55654 ) ( ON-TABLE ?auto_55646 ) ( ON ?auto_55647 ?auto_55646 ) ( ON ?auto_55648 ?auto_55647 ) ( ON ?auto_55649 ?auto_55648 ) ( not ( = ?auto_55646 ?auto_55647 ) ) ( not ( = ?auto_55646 ?auto_55648 ) ) ( not ( = ?auto_55646 ?auto_55649 ) ) ( not ( = ?auto_55646 ?auto_55650 ) ) ( not ( = ?auto_55646 ?auto_55651 ) ) ( not ( = ?auto_55646 ?auto_55652 ) ) ( not ( = ?auto_55646 ?auto_55653 ) ) ( not ( = ?auto_55646 ?auto_55654 ) ) ( not ( = ?auto_55647 ?auto_55648 ) ) ( not ( = ?auto_55647 ?auto_55649 ) ) ( not ( = ?auto_55647 ?auto_55650 ) ) ( not ( = ?auto_55647 ?auto_55651 ) ) ( not ( = ?auto_55647 ?auto_55652 ) ) ( not ( = ?auto_55647 ?auto_55653 ) ) ( not ( = ?auto_55647 ?auto_55654 ) ) ( not ( = ?auto_55648 ?auto_55649 ) ) ( not ( = ?auto_55648 ?auto_55650 ) ) ( not ( = ?auto_55648 ?auto_55651 ) ) ( not ( = ?auto_55648 ?auto_55652 ) ) ( not ( = ?auto_55648 ?auto_55653 ) ) ( not ( = ?auto_55648 ?auto_55654 ) ) ( not ( = ?auto_55649 ?auto_55650 ) ) ( not ( = ?auto_55649 ?auto_55651 ) ) ( not ( = ?auto_55649 ?auto_55652 ) ) ( not ( = ?auto_55649 ?auto_55653 ) ) ( not ( = ?auto_55649 ?auto_55654 ) ) ( not ( = ?auto_55650 ?auto_55651 ) ) ( not ( = ?auto_55650 ?auto_55652 ) ) ( not ( = ?auto_55650 ?auto_55653 ) ) ( not ( = ?auto_55650 ?auto_55654 ) ) ( not ( = ?auto_55651 ?auto_55652 ) ) ( not ( = ?auto_55651 ?auto_55653 ) ) ( not ( = ?auto_55651 ?auto_55654 ) ) ( not ( = ?auto_55652 ?auto_55653 ) ) ( not ( = ?auto_55652 ?auto_55654 ) ) ( not ( = ?auto_55653 ?auto_55654 ) ) ( ON ?auto_55652 ?auto_55653 ) ( ON ?auto_55651 ?auto_55652 ) ( CLEAR ?auto_55649 ) ( ON ?auto_55650 ?auto_55651 ) ( CLEAR ?auto_55650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55646 ?auto_55647 ?auto_55648 ?auto_55649 ?auto_55650 )
      ( MAKE-8PILE ?auto_55646 ?auto_55647 ?auto_55648 ?auto_55649 ?auto_55650 ?auto_55651 ?auto_55652 ?auto_55653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55680 - BLOCK
      ?auto_55681 - BLOCK
      ?auto_55682 - BLOCK
      ?auto_55683 - BLOCK
      ?auto_55684 - BLOCK
      ?auto_55685 - BLOCK
      ?auto_55686 - BLOCK
      ?auto_55687 - BLOCK
    )
    :vars
    (
      ?auto_55688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55687 ?auto_55688 ) ( ON-TABLE ?auto_55680 ) ( ON ?auto_55681 ?auto_55680 ) ( ON ?auto_55682 ?auto_55681 ) ( not ( = ?auto_55680 ?auto_55681 ) ) ( not ( = ?auto_55680 ?auto_55682 ) ) ( not ( = ?auto_55680 ?auto_55683 ) ) ( not ( = ?auto_55680 ?auto_55684 ) ) ( not ( = ?auto_55680 ?auto_55685 ) ) ( not ( = ?auto_55680 ?auto_55686 ) ) ( not ( = ?auto_55680 ?auto_55687 ) ) ( not ( = ?auto_55680 ?auto_55688 ) ) ( not ( = ?auto_55681 ?auto_55682 ) ) ( not ( = ?auto_55681 ?auto_55683 ) ) ( not ( = ?auto_55681 ?auto_55684 ) ) ( not ( = ?auto_55681 ?auto_55685 ) ) ( not ( = ?auto_55681 ?auto_55686 ) ) ( not ( = ?auto_55681 ?auto_55687 ) ) ( not ( = ?auto_55681 ?auto_55688 ) ) ( not ( = ?auto_55682 ?auto_55683 ) ) ( not ( = ?auto_55682 ?auto_55684 ) ) ( not ( = ?auto_55682 ?auto_55685 ) ) ( not ( = ?auto_55682 ?auto_55686 ) ) ( not ( = ?auto_55682 ?auto_55687 ) ) ( not ( = ?auto_55682 ?auto_55688 ) ) ( not ( = ?auto_55683 ?auto_55684 ) ) ( not ( = ?auto_55683 ?auto_55685 ) ) ( not ( = ?auto_55683 ?auto_55686 ) ) ( not ( = ?auto_55683 ?auto_55687 ) ) ( not ( = ?auto_55683 ?auto_55688 ) ) ( not ( = ?auto_55684 ?auto_55685 ) ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55687 ) ) ( not ( = ?auto_55684 ?auto_55688 ) ) ( not ( = ?auto_55685 ?auto_55686 ) ) ( not ( = ?auto_55685 ?auto_55687 ) ) ( not ( = ?auto_55685 ?auto_55688 ) ) ( not ( = ?auto_55686 ?auto_55687 ) ) ( not ( = ?auto_55686 ?auto_55688 ) ) ( not ( = ?auto_55687 ?auto_55688 ) ) ( ON ?auto_55686 ?auto_55687 ) ( ON ?auto_55685 ?auto_55686 ) ( ON ?auto_55684 ?auto_55685 ) ( CLEAR ?auto_55682 ) ( ON ?auto_55683 ?auto_55684 ) ( CLEAR ?auto_55683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_55680 ?auto_55681 ?auto_55682 ?auto_55683 )
      ( MAKE-8PILE ?auto_55680 ?auto_55681 ?auto_55682 ?auto_55683 ?auto_55684 ?auto_55685 ?auto_55686 ?auto_55687 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55714 - BLOCK
      ?auto_55715 - BLOCK
      ?auto_55716 - BLOCK
      ?auto_55717 - BLOCK
      ?auto_55718 - BLOCK
      ?auto_55719 - BLOCK
      ?auto_55720 - BLOCK
      ?auto_55721 - BLOCK
    )
    :vars
    (
      ?auto_55722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55721 ?auto_55722 ) ( ON-TABLE ?auto_55714 ) ( ON ?auto_55715 ?auto_55714 ) ( not ( = ?auto_55714 ?auto_55715 ) ) ( not ( = ?auto_55714 ?auto_55716 ) ) ( not ( = ?auto_55714 ?auto_55717 ) ) ( not ( = ?auto_55714 ?auto_55718 ) ) ( not ( = ?auto_55714 ?auto_55719 ) ) ( not ( = ?auto_55714 ?auto_55720 ) ) ( not ( = ?auto_55714 ?auto_55721 ) ) ( not ( = ?auto_55714 ?auto_55722 ) ) ( not ( = ?auto_55715 ?auto_55716 ) ) ( not ( = ?auto_55715 ?auto_55717 ) ) ( not ( = ?auto_55715 ?auto_55718 ) ) ( not ( = ?auto_55715 ?auto_55719 ) ) ( not ( = ?auto_55715 ?auto_55720 ) ) ( not ( = ?auto_55715 ?auto_55721 ) ) ( not ( = ?auto_55715 ?auto_55722 ) ) ( not ( = ?auto_55716 ?auto_55717 ) ) ( not ( = ?auto_55716 ?auto_55718 ) ) ( not ( = ?auto_55716 ?auto_55719 ) ) ( not ( = ?auto_55716 ?auto_55720 ) ) ( not ( = ?auto_55716 ?auto_55721 ) ) ( not ( = ?auto_55716 ?auto_55722 ) ) ( not ( = ?auto_55717 ?auto_55718 ) ) ( not ( = ?auto_55717 ?auto_55719 ) ) ( not ( = ?auto_55717 ?auto_55720 ) ) ( not ( = ?auto_55717 ?auto_55721 ) ) ( not ( = ?auto_55717 ?auto_55722 ) ) ( not ( = ?auto_55718 ?auto_55719 ) ) ( not ( = ?auto_55718 ?auto_55720 ) ) ( not ( = ?auto_55718 ?auto_55721 ) ) ( not ( = ?auto_55718 ?auto_55722 ) ) ( not ( = ?auto_55719 ?auto_55720 ) ) ( not ( = ?auto_55719 ?auto_55721 ) ) ( not ( = ?auto_55719 ?auto_55722 ) ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( not ( = ?auto_55720 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( ON ?auto_55720 ?auto_55721 ) ( ON ?auto_55719 ?auto_55720 ) ( ON ?auto_55718 ?auto_55719 ) ( ON ?auto_55717 ?auto_55718 ) ( CLEAR ?auto_55715 ) ( ON ?auto_55716 ?auto_55717 ) ( CLEAR ?auto_55716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_55714 ?auto_55715 ?auto_55716 )
      ( MAKE-8PILE ?auto_55714 ?auto_55715 ?auto_55716 ?auto_55717 ?auto_55718 ?auto_55719 ?auto_55720 ?auto_55721 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55748 - BLOCK
      ?auto_55749 - BLOCK
      ?auto_55750 - BLOCK
      ?auto_55751 - BLOCK
      ?auto_55752 - BLOCK
      ?auto_55753 - BLOCK
      ?auto_55754 - BLOCK
      ?auto_55755 - BLOCK
    )
    :vars
    (
      ?auto_55756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55755 ?auto_55756 ) ( ON-TABLE ?auto_55748 ) ( not ( = ?auto_55748 ?auto_55749 ) ) ( not ( = ?auto_55748 ?auto_55750 ) ) ( not ( = ?auto_55748 ?auto_55751 ) ) ( not ( = ?auto_55748 ?auto_55752 ) ) ( not ( = ?auto_55748 ?auto_55753 ) ) ( not ( = ?auto_55748 ?auto_55754 ) ) ( not ( = ?auto_55748 ?auto_55755 ) ) ( not ( = ?auto_55748 ?auto_55756 ) ) ( not ( = ?auto_55749 ?auto_55750 ) ) ( not ( = ?auto_55749 ?auto_55751 ) ) ( not ( = ?auto_55749 ?auto_55752 ) ) ( not ( = ?auto_55749 ?auto_55753 ) ) ( not ( = ?auto_55749 ?auto_55754 ) ) ( not ( = ?auto_55749 ?auto_55755 ) ) ( not ( = ?auto_55749 ?auto_55756 ) ) ( not ( = ?auto_55750 ?auto_55751 ) ) ( not ( = ?auto_55750 ?auto_55752 ) ) ( not ( = ?auto_55750 ?auto_55753 ) ) ( not ( = ?auto_55750 ?auto_55754 ) ) ( not ( = ?auto_55750 ?auto_55755 ) ) ( not ( = ?auto_55750 ?auto_55756 ) ) ( not ( = ?auto_55751 ?auto_55752 ) ) ( not ( = ?auto_55751 ?auto_55753 ) ) ( not ( = ?auto_55751 ?auto_55754 ) ) ( not ( = ?auto_55751 ?auto_55755 ) ) ( not ( = ?auto_55751 ?auto_55756 ) ) ( not ( = ?auto_55752 ?auto_55753 ) ) ( not ( = ?auto_55752 ?auto_55754 ) ) ( not ( = ?auto_55752 ?auto_55755 ) ) ( not ( = ?auto_55752 ?auto_55756 ) ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55755 ) ) ( not ( = ?auto_55753 ?auto_55756 ) ) ( not ( = ?auto_55754 ?auto_55755 ) ) ( not ( = ?auto_55754 ?auto_55756 ) ) ( not ( = ?auto_55755 ?auto_55756 ) ) ( ON ?auto_55754 ?auto_55755 ) ( ON ?auto_55753 ?auto_55754 ) ( ON ?auto_55752 ?auto_55753 ) ( ON ?auto_55751 ?auto_55752 ) ( ON ?auto_55750 ?auto_55751 ) ( CLEAR ?auto_55748 ) ( ON ?auto_55749 ?auto_55750 ) ( CLEAR ?auto_55749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_55748 ?auto_55749 )
      ( MAKE-8PILE ?auto_55748 ?auto_55749 ?auto_55750 ?auto_55751 ?auto_55752 ?auto_55753 ?auto_55754 ?auto_55755 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_55782 - BLOCK
      ?auto_55783 - BLOCK
      ?auto_55784 - BLOCK
      ?auto_55785 - BLOCK
      ?auto_55786 - BLOCK
      ?auto_55787 - BLOCK
      ?auto_55788 - BLOCK
      ?auto_55789 - BLOCK
    )
    :vars
    (
      ?auto_55790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55789 ?auto_55790 ) ( not ( = ?auto_55782 ?auto_55783 ) ) ( not ( = ?auto_55782 ?auto_55784 ) ) ( not ( = ?auto_55782 ?auto_55785 ) ) ( not ( = ?auto_55782 ?auto_55786 ) ) ( not ( = ?auto_55782 ?auto_55787 ) ) ( not ( = ?auto_55782 ?auto_55788 ) ) ( not ( = ?auto_55782 ?auto_55789 ) ) ( not ( = ?auto_55782 ?auto_55790 ) ) ( not ( = ?auto_55783 ?auto_55784 ) ) ( not ( = ?auto_55783 ?auto_55785 ) ) ( not ( = ?auto_55783 ?auto_55786 ) ) ( not ( = ?auto_55783 ?auto_55787 ) ) ( not ( = ?auto_55783 ?auto_55788 ) ) ( not ( = ?auto_55783 ?auto_55789 ) ) ( not ( = ?auto_55783 ?auto_55790 ) ) ( not ( = ?auto_55784 ?auto_55785 ) ) ( not ( = ?auto_55784 ?auto_55786 ) ) ( not ( = ?auto_55784 ?auto_55787 ) ) ( not ( = ?auto_55784 ?auto_55788 ) ) ( not ( = ?auto_55784 ?auto_55789 ) ) ( not ( = ?auto_55784 ?auto_55790 ) ) ( not ( = ?auto_55785 ?auto_55786 ) ) ( not ( = ?auto_55785 ?auto_55787 ) ) ( not ( = ?auto_55785 ?auto_55788 ) ) ( not ( = ?auto_55785 ?auto_55789 ) ) ( not ( = ?auto_55785 ?auto_55790 ) ) ( not ( = ?auto_55786 ?auto_55787 ) ) ( not ( = ?auto_55786 ?auto_55788 ) ) ( not ( = ?auto_55786 ?auto_55789 ) ) ( not ( = ?auto_55786 ?auto_55790 ) ) ( not ( = ?auto_55787 ?auto_55788 ) ) ( not ( = ?auto_55787 ?auto_55789 ) ) ( not ( = ?auto_55787 ?auto_55790 ) ) ( not ( = ?auto_55788 ?auto_55789 ) ) ( not ( = ?auto_55788 ?auto_55790 ) ) ( not ( = ?auto_55789 ?auto_55790 ) ) ( ON ?auto_55788 ?auto_55789 ) ( ON ?auto_55787 ?auto_55788 ) ( ON ?auto_55786 ?auto_55787 ) ( ON ?auto_55785 ?auto_55786 ) ( ON ?auto_55784 ?auto_55785 ) ( ON ?auto_55783 ?auto_55784 ) ( ON ?auto_55782 ?auto_55783 ) ( CLEAR ?auto_55782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_55782 )
      ( MAKE-8PILE ?auto_55782 ?auto_55783 ?auto_55784 ?auto_55785 ?auto_55786 ?auto_55787 ?auto_55788 ?auto_55789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55817 - BLOCK
      ?auto_55818 - BLOCK
      ?auto_55819 - BLOCK
      ?auto_55820 - BLOCK
      ?auto_55821 - BLOCK
      ?auto_55822 - BLOCK
      ?auto_55823 - BLOCK
      ?auto_55824 - BLOCK
      ?auto_55825 - BLOCK
    )
    :vars
    (
      ?auto_55826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55824 ) ( ON ?auto_55825 ?auto_55826 ) ( CLEAR ?auto_55825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55817 ) ( ON ?auto_55818 ?auto_55817 ) ( ON ?auto_55819 ?auto_55818 ) ( ON ?auto_55820 ?auto_55819 ) ( ON ?auto_55821 ?auto_55820 ) ( ON ?auto_55822 ?auto_55821 ) ( ON ?auto_55823 ?auto_55822 ) ( ON ?auto_55824 ?auto_55823 ) ( not ( = ?auto_55817 ?auto_55818 ) ) ( not ( = ?auto_55817 ?auto_55819 ) ) ( not ( = ?auto_55817 ?auto_55820 ) ) ( not ( = ?auto_55817 ?auto_55821 ) ) ( not ( = ?auto_55817 ?auto_55822 ) ) ( not ( = ?auto_55817 ?auto_55823 ) ) ( not ( = ?auto_55817 ?auto_55824 ) ) ( not ( = ?auto_55817 ?auto_55825 ) ) ( not ( = ?auto_55817 ?auto_55826 ) ) ( not ( = ?auto_55818 ?auto_55819 ) ) ( not ( = ?auto_55818 ?auto_55820 ) ) ( not ( = ?auto_55818 ?auto_55821 ) ) ( not ( = ?auto_55818 ?auto_55822 ) ) ( not ( = ?auto_55818 ?auto_55823 ) ) ( not ( = ?auto_55818 ?auto_55824 ) ) ( not ( = ?auto_55818 ?auto_55825 ) ) ( not ( = ?auto_55818 ?auto_55826 ) ) ( not ( = ?auto_55819 ?auto_55820 ) ) ( not ( = ?auto_55819 ?auto_55821 ) ) ( not ( = ?auto_55819 ?auto_55822 ) ) ( not ( = ?auto_55819 ?auto_55823 ) ) ( not ( = ?auto_55819 ?auto_55824 ) ) ( not ( = ?auto_55819 ?auto_55825 ) ) ( not ( = ?auto_55819 ?auto_55826 ) ) ( not ( = ?auto_55820 ?auto_55821 ) ) ( not ( = ?auto_55820 ?auto_55822 ) ) ( not ( = ?auto_55820 ?auto_55823 ) ) ( not ( = ?auto_55820 ?auto_55824 ) ) ( not ( = ?auto_55820 ?auto_55825 ) ) ( not ( = ?auto_55820 ?auto_55826 ) ) ( not ( = ?auto_55821 ?auto_55822 ) ) ( not ( = ?auto_55821 ?auto_55823 ) ) ( not ( = ?auto_55821 ?auto_55824 ) ) ( not ( = ?auto_55821 ?auto_55825 ) ) ( not ( = ?auto_55821 ?auto_55826 ) ) ( not ( = ?auto_55822 ?auto_55823 ) ) ( not ( = ?auto_55822 ?auto_55824 ) ) ( not ( = ?auto_55822 ?auto_55825 ) ) ( not ( = ?auto_55822 ?auto_55826 ) ) ( not ( = ?auto_55823 ?auto_55824 ) ) ( not ( = ?auto_55823 ?auto_55825 ) ) ( not ( = ?auto_55823 ?auto_55826 ) ) ( not ( = ?auto_55824 ?auto_55825 ) ) ( not ( = ?auto_55824 ?auto_55826 ) ) ( not ( = ?auto_55825 ?auto_55826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_55825 ?auto_55826 )
      ( !STACK ?auto_55825 ?auto_55824 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55836 - BLOCK
      ?auto_55837 - BLOCK
      ?auto_55838 - BLOCK
      ?auto_55839 - BLOCK
      ?auto_55840 - BLOCK
      ?auto_55841 - BLOCK
      ?auto_55842 - BLOCK
      ?auto_55843 - BLOCK
      ?auto_55844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_55843 ) ( ON-TABLE ?auto_55844 ) ( CLEAR ?auto_55844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_55836 ) ( ON ?auto_55837 ?auto_55836 ) ( ON ?auto_55838 ?auto_55837 ) ( ON ?auto_55839 ?auto_55838 ) ( ON ?auto_55840 ?auto_55839 ) ( ON ?auto_55841 ?auto_55840 ) ( ON ?auto_55842 ?auto_55841 ) ( ON ?auto_55843 ?auto_55842 ) ( not ( = ?auto_55836 ?auto_55837 ) ) ( not ( = ?auto_55836 ?auto_55838 ) ) ( not ( = ?auto_55836 ?auto_55839 ) ) ( not ( = ?auto_55836 ?auto_55840 ) ) ( not ( = ?auto_55836 ?auto_55841 ) ) ( not ( = ?auto_55836 ?auto_55842 ) ) ( not ( = ?auto_55836 ?auto_55843 ) ) ( not ( = ?auto_55836 ?auto_55844 ) ) ( not ( = ?auto_55837 ?auto_55838 ) ) ( not ( = ?auto_55837 ?auto_55839 ) ) ( not ( = ?auto_55837 ?auto_55840 ) ) ( not ( = ?auto_55837 ?auto_55841 ) ) ( not ( = ?auto_55837 ?auto_55842 ) ) ( not ( = ?auto_55837 ?auto_55843 ) ) ( not ( = ?auto_55837 ?auto_55844 ) ) ( not ( = ?auto_55838 ?auto_55839 ) ) ( not ( = ?auto_55838 ?auto_55840 ) ) ( not ( = ?auto_55838 ?auto_55841 ) ) ( not ( = ?auto_55838 ?auto_55842 ) ) ( not ( = ?auto_55838 ?auto_55843 ) ) ( not ( = ?auto_55838 ?auto_55844 ) ) ( not ( = ?auto_55839 ?auto_55840 ) ) ( not ( = ?auto_55839 ?auto_55841 ) ) ( not ( = ?auto_55839 ?auto_55842 ) ) ( not ( = ?auto_55839 ?auto_55843 ) ) ( not ( = ?auto_55839 ?auto_55844 ) ) ( not ( = ?auto_55840 ?auto_55841 ) ) ( not ( = ?auto_55840 ?auto_55842 ) ) ( not ( = ?auto_55840 ?auto_55843 ) ) ( not ( = ?auto_55840 ?auto_55844 ) ) ( not ( = ?auto_55841 ?auto_55842 ) ) ( not ( = ?auto_55841 ?auto_55843 ) ) ( not ( = ?auto_55841 ?auto_55844 ) ) ( not ( = ?auto_55842 ?auto_55843 ) ) ( not ( = ?auto_55842 ?auto_55844 ) ) ( not ( = ?auto_55843 ?auto_55844 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_55844 )
      ( !STACK ?auto_55844 ?auto_55843 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55854 - BLOCK
      ?auto_55855 - BLOCK
      ?auto_55856 - BLOCK
      ?auto_55857 - BLOCK
      ?auto_55858 - BLOCK
      ?auto_55859 - BLOCK
      ?auto_55860 - BLOCK
      ?auto_55861 - BLOCK
      ?auto_55862 - BLOCK
    )
    :vars
    (
      ?auto_55863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55862 ?auto_55863 ) ( ON-TABLE ?auto_55854 ) ( ON ?auto_55855 ?auto_55854 ) ( ON ?auto_55856 ?auto_55855 ) ( ON ?auto_55857 ?auto_55856 ) ( ON ?auto_55858 ?auto_55857 ) ( ON ?auto_55859 ?auto_55858 ) ( ON ?auto_55860 ?auto_55859 ) ( not ( = ?auto_55854 ?auto_55855 ) ) ( not ( = ?auto_55854 ?auto_55856 ) ) ( not ( = ?auto_55854 ?auto_55857 ) ) ( not ( = ?auto_55854 ?auto_55858 ) ) ( not ( = ?auto_55854 ?auto_55859 ) ) ( not ( = ?auto_55854 ?auto_55860 ) ) ( not ( = ?auto_55854 ?auto_55861 ) ) ( not ( = ?auto_55854 ?auto_55862 ) ) ( not ( = ?auto_55854 ?auto_55863 ) ) ( not ( = ?auto_55855 ?auto_55856 ) ) ( not ( = ?auto_55855 ?auto_55857 ) ) ( not ( = ?auto_55855 ?auto_55858 ) ) ( not ( = ?auto_55855 ?auto_55859 ) ) ( not ( = ?auto_55855 ?auto_55860 ) ) ( not ( = ?auto_55855 ?auto_55861 ) ) ( not ( = ?auto_55855 ?auto_55862 ) ) ( not ( = ?auto_55855 ?auto_55863 ) ) ( not ( = ?auto_55856 ?auto_55857 ) ) ( not ( = ?auto_55856 ?auto_55858 ) ) ( not ( = ?auto_55856 ?auto_55859 ) ) ( not ( = ?auto_55856 ?auto_55860 ) ) ( not ( = ?auto_55856 ?auto_55861 ) ) ( not ( = ?auto_55856 ?auto_55862 ) ) ( not ( = ?auto_55856 ?auto_55863 ) ) ( not ( = ?auto_55857 ?auto_55858 ) ) ( not ( = ?auto_55857 ?auto_55859 ) ) ( not ( = ?auto_55857 ?auto_55860 ) ) ( not ( = ?auto_55857 ?auto_55861 ) ) ( not ( = ?auto_55857 ?auto_55862 ) ) ( not ( = ?auto_55857 ?auto_55863 ) ) ( not ( = ?auto_55858 ?auto_55859 ) ) ( not ( = ?auto_55858 ?auto_55860 ) ) ( not ( = ?auto_55858 ?auto_55861 ) ) ( not ( = ?auto_55858 ?auto_55862 ) ) ( not ( = ?auto_55858 ?auto_55863 ) ) ( not ( = ?auto_55859 ?auto_55860 ) ) ( not ( = ?auto_55859 ?auto_55861 ) ) ( not ( = ?auto_55859 ?auto_55862 ) ) ( not ( = ?auto_55859 ?auto_55863 ) ) ( not ( = ?auto_55860 ?auto_55861 ) ) ( not ( = ?auto_55860 ?auto_55862 ) ) ( not ( = ?auto_55860 ?auto_55863 ) ) ( not ( = ?auto_55861 ?auto_55862 ) ) ( not ( = ?auto_55861 ?auto_55863 ) ) ( not ( = ?auto_55862 ?auto_55863 ) ) ( CLEAR ?auto_55860 ) ( ON ?auto_55861 ?auto_55862 ) ( CLEAR ?auto_55861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_55854 ?auto_55855 ?auto_55856 ?auto_55857 ?auto_55858 ?auto_55859 ?auto_55860 ?auto_55861 )
      ( MAKE-9PILE ?auto_55854 ?auto_55855 ?auto_55856 ?auto_55857 ?auto_55858 ?auto_55859 ?auto_55860 ?auto_55861 ?auto_55862 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55873 - BLOCK
      ?auto_55874 - BLOCK
      ?auto_55875 - BLOCK
      ?auto_55876 - BLOCK
      ?auto_55877 - BLOCK
      ?auto_55878 - BLOCK
      ?auto_55879 - BLOCK
      ?auto_55880 - BLOCK
      ?auto_55881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55881 ) ( ON-TABLE ?auto_55873 ) ( ON ?auto_55874 ?auto_55873 ) ( ON ?auto_55875 ?auto_55874 ) ( ON ?auto_55876 ?auto_55875 ) ( ON ?auto_55877 ?auto_55876 ) ( ON ?auto_55878 ?auto_55877 ) ( ON ?auto_55879 ?auto_55878 ) ( not ( = ?auto_55873 ?auto_55874 ) ) ( not ( = ?auto_55873 ?auto_55875 ) ) ( not ( = ?auto_55873 ?auto_55876 ) ) ( not ( = ?auto_55873 ?auto_55877 ) ) ( not ( = ?auto_55873 ?auto_55878 ) ) ( not ( = ?auto_55873 ?auto_55879 ) ) ( not ( = ?auto_55873 ?auto_55880 ) ) ( not ( = ?auto_55873 ?auto_55881 ) ) ( not ( = ?auto_55874 ?auto_55875 ) ) ( not ( = ?auto_55874 ?auto_55876 ) ) ( not ( = ?auto_55874 ?auto_55877 ) ) ( not ( = ?auto_55874 ?auto_55878 ) ) ( not ( = ?auto_55874 ?auto_55879 ) ) ( not ( = ?auto_55874 ?auto_55880 ) ) ( not ( = ?auto_55874 ?auto_55881 ) ) ( not ( = ?auto_55875 ?auto_55876 ) ) ( not ( = ?auto_55875 ?auto_55877 ) ) ( not ( = ?auto_55875 ?auto_55878 ) ) ( not ( = ?auto_55875 ?auto_55879 ) ) ( not ( = ?auto_55875 ?auto_55880 ) ) ( not ( = ?auto_55875 ?auto_55881 ) ) ( not ( = ?auto_55876 ?auto_55877 ) ) ( not ( = ?auto_55876 ?auto_55878 ) ) ( not ( = ?auto_55876 ?auto_55879 ) ) ( not ( = ?auto_55876 ?auto_55880 ) ) ( not ( = ?auto_55876 ?auto_55881 ) ) ( not ( = ?auto_55877 ?auto_55878 ) ) ( not ( = ?auto_55877 ?auto_55879 ) ) ( not ( = ?auto_55877 ?auto_55880 ) ) ( not ( = ?auto_55877 ?auto_55881 ) ) ( not ( = ?auto_55878 ?auto_55879 ) ) ( not ( = ?auto_55878 ?auto_55880 ) ) ( not ( = ?auto_55878 ?auto_55881 ) ) ( not ( = ?auto_55879 ?auto_55880 ) ) ( not ( = ?auto_55879 ?auto_55881 ) ) ( not ( = ?auto_55880 ?auto_55881 ) ) ( CLEAR ?auto_55879 ) ( ON ?auto_55880 ?auto_55881 ) ( CLEAR ?auto_55880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_55873 ?auto_55874 ?auto_55875 ?auto_55876 ?auto_55877 ?auto_55878 ?auto_55879 ?auto_55880 )
      ( MAKE-9PILE ?auto_55873 ?auto_55874 ?auto_55875 ?auto_55876 ?auto_55877 ?auto_55878 ?auto_55879 ?auto_55880 ?auto_55881 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55891 - BLOCK
      ?auto_55892 - BLOCK
      ?auto_55893 - BLOCK
      ?auto_55894 - BLOCK
      ?auto_55895 - BLOCK
      ?auto_55896 - BLOCK
      ?auto_55897 - BLOCK
      ?auto_55898 - BLOCK
      ?auto_55899 - BLOCK
    )
    :vars
    (
      ?auto_55900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55899 ?auto_55900 ) ( ON-TABLE ?auto_55891 ) ( ON ?auto_55892 ?auto_55891 ) ( ON ?auto_55893 ?auto_55892 ) ( ON ?auto_55894 ?auto_55893 ) ( ON ?auto_55895 ?auto_55894 ) ( ON ?auto_55896 ?auto_55895 ) ( not ( = ?auto_55891 ?auto_55892 ) ) ( not ( = ?auto_55891 ?auto_55893 ) ) ( not ( = ?auto_55891 ?auto_55894 ) ) ( not ( = ?auto_55891 ?auto_55895 ) ) ( not ( = ?auto_55891 ?auto_55896 ) ) ( not ( = ?auto_55891 ?auto_55897 ) ) ( not ( = ?auto_55891 ?auto_55898 ) ) ( not ( = ?auto_55891 ?auto_55899 ) ) ( not ( = ?auto_55891 ?auto_55900 ) ) ( not ( = ?auto_55892 ?auto_55893 ) ) ( not ( = ?auto_55892 ?auto_55894 ) ) ( not ( = ?auto_55892 ?auto_55895 ) ) ( not ( = ?auto_55892 ?auto_55896 ) ) ( not ( = ?auto_55892 ?auto_55897 ) ) ( not ( = ?auto_55892 ?auto_55898 ) ) ( not ( = ?auto_55892 ?auto_55899 ) ) ( not ( = ?auto_55892 ?auto_55900 ) ) ( not ( = ?auto_55893 ?auto_55894 ) ) ( not ( = ?auto_55893 ?auto_55895 ) ) ( not ( = ?auto_55893 ?auto_55896 ) ) ( not ( = ?auto_55893 ?auto_55897 ) ) ( not ( = ?auto_55893 ?auto_55898 ) ) ( not ( = ?auto_55893 ?auto_55899 ) ) ( not ( = ?auto_55893 ?auto_55900 ) ) ( not ( = ?auto_55894 ?auto_55895 ) ) ( not ( = ?auto_55894 ?auto_55896 ) ) ( not ( = ?auto_55894 ?auto_55897 ) ) ( not ( = ?auto_55894 ?auto_55898 ) ) ( not ( = ?auto_55894 ?auto_55899 ) ) ( not ( = ?auto_55894 ?auto_55900 ) ) ( not ( = ?auto_55895 ?auto_55896 ) ) ( not ( = ?auto_55895 ?auto_55897 ) ) ( not ( = ?auto_55895 ?auto_55898 ) ) ( not ( = ?auto_55895 ?auto_55899 ) ) ( not ( = ?auto_55895 ?auto_55900 ) ) ( not ( = ?auto_55896 ?auto_55897 ) ) ( not ( = ?auto_55896 ?auto_55898 ) ) ( not ( = ?auto_55896 ?auto_55899 ) ) ( not ( = ?auto_55896 ?auto_55900 ) ) ( not ( = ?auto_55897 ?auto_55898 ) ) ( not ( = ?auto_55897 ?auto_55899 ) ) ( not ( = ?auto_55897 ?auto_55900 ) ) ( not ( = ?auto_55898 ?auto_55899 ) ) ( not ( = ?auto_55898 ?auto_55900 ) ) ( not ( = ?auto_55899 ?auto_55900 ) ) ( ON ?auto_55898 ?auto_55899 ) ( CLEAR ?auto_55896 ) ( ON ?auto_55897 ?auto_55898 ) ( CLEAR ?auto_55897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_55891 ?auto_55892 ?auto_55893 ?auto_55894 ?auto_55895 ?auto_55896 ?auto_55897 )
      ( MAKE-9PILE ?auto_55891 ?auto_55892 ?auto_55893 ?auto_55894 ?auto_55895 ?auto_55896 ?auto_55897 ?auto_55898 ?auto_55899 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55910 - BLOCK
      ?auto_55911 - BLOCK
      ?auto_55912 - BLOCK
      ?auto_55913 - BLOCK
      ?auto_55914 - BLOCK
      ?auto_55915 - BLOCK
      ?auto_55916 - BLOCK
      ?auto_55917 - BLOCK
      ?auto_55918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55918 ) ( ON-TABLE ?auto_55910 ) ( ON ?auto_55911 ?auto_55910 ) ( ON ?auto_55912 ?auto_55911 ) ( ON ?auto_55913 ?auto_55912 ) ( ON ?auto_55914 ?auto_55913 ) ( ON ?auto_55915 ?auto_55914 ) ( not ( = ?auto_55910 ?auto_55911 ) ) ( not ( = ?auto_55910 ?auto_55912 ) ) ( not ( = ?auto_55910 ?auto_55913 ) ) ( not ( = ?auto_55910 ?auto_55914 ) ) ( not ( = ?auto_55910 ?auto_55915 ) ) ( not ( = ?auto_55910 ?auto_55916 ) ) ( not ( = ?auto_55910 ?auto_55917 ) ) ( not ( = ?auto_55910 ?auto_55918 ) ) ( not ( = ?auto_55911 ?auto_55912 ) ) ( not ( = ?auto_55911 ?auto_55913 ) ) ( not ( = ?auto_55911 ?auto_55914 ) ) ( not ( = ?auto_55911 ?auto_55915 ) ) ( not ( = ?auto_55911 ?auto_55916 ) ) ( not ( = ?auto_55911 ?auto_55917 ) ) ( not ( = ?auto_55911 ?auto_55918 ) ) ( not ( = ?auto_55912 ?auto_55913 ) ) ( not ( = ?auto_55912 ?auto_55914 ) ) ( not ( = ?auto_55912 ?auto_55915 ) ) ( not ( = ?auto_55912 ?auto_55916 ) ) ( not ( = ?auto_55912 ?auto_55917 ) ) ( not ( = ?auto_55912 ?auto_55918 ) ) ( not ( = ?auto_55913 ?auto_55914 ) ) ( not ( = ?auto_55913 ?auto_55915 ) ) ( not ( = ?auto_55913 ?auto_55916 ) ) ( not ( = ?auto_55913 ?auto_55917 ) ) ( not ( = ?auto_55913 ?auto_55918 ) ) ( not ( = ?auto_55914 ?auto_55915 ) ) ( not ( = ?auto_55914 ?auto_55916 ) ) ( not ( = ?auto_55914 ?auto_55917 ) ) ( not ( = ?auto_55914 ?auto_55918 ) ) ( not ( = ?auto_55915 ?auto_55916 ) ) ( not ( = ?auto_55915 ?auto_55917 ) ) ( not ( = ?auto_55915 ?auto_55918 ) ) ( not ( = ?auto_55916 ?auto_55917 ) ) ( not ( = ?auto_55916 ?auto_55918 ) ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( ON ?auto_55917 ?auto_55918 ) ( CLEAR ?auto_55915 ) ( ON ?auto_55916 ?auto_55917 ) ( CLEAR ?auto_55916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_55910 ?auto_55911 ?auto_55912 ?auto_55913 ?auto_55914 ?auto_55915 ?auto_55916 )
      ( MAKE-9PILE ?auto_55910 ?auto_55911 ?auto_55912 ?auto_55913 ?auto_55914 ?auto_55915 ?auto_55916 ?auto_55917 ?auto_55918 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55928 - BLOCK
      ?auto_55929 - BLOCK
      ?auto_55930 - BLOCK
      ?auto_55931 - BLOCK
      ?auto_55932 - BLOCK
      ?auto_55933 - BLOCK
      ?auto_55934 - BLOCK
      ?auto_55935 - BLOCK
      ?auto_55936 - BLOCK
    )
    :vars
    (
      ?auto_55937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55936 ?auto_55937 ) ( ON-TABLE ?auto_55928 ) ( ON ?auto_55929 ?auto_55928 ) ( ON ?auto_55930 ?auto_55929 ) ( ON ?auto_55931 ?auto_55930 ) ( ON ?auto_55932 ?auto_55931 ) ( not ( = ?auto_55928 ?auto_55929 ) ) ( not ( = ?auto_55928 ?auto_55930 ) ) ( not ( = ?auto_55928 ?auto_55931 ) ) ( not ( = ?auto_55928 ?auto_55932 ) ) ( not ( = ?auto_55928 ?auto_55933 ) ) ( not ( = ?auto_55928 ?auto_55934 ) ) ( not ( = ?auto_55928 ?auto_55935 ) ) ( not ( = ?auto_55928 ?auto_55936 ) ) ( not ( = ?auto_55928 ?auto_55937 ) ) ( not ( = ?auto_55929 ?auto_55930 ) ) ( not ( = ?auto_55929 ?auto_55931 ) ) ( not ( = ?auto_55929 ?auto_55932 ) ) ( not ( = ?auto_55929 ?auto_55933 ) ) ( not ( = ?auto_55929 ?auto_55934 ) ) ( not ( = ?auto_55929 ?auto_55935 ) ) ( not ( = ?auto_55929 ?auto_55936 ) ) ( not ( = ?auto_55929 ?auto_55937 ) ) ( not ( = ?auto_55930 ?auto_55931 ) ) ( not ( = ?auto_55930 ?auto_55932 ) ) ( not ( = ?auto_55930 ?auto_55933 ) ) ( not ( = ?auto_55930 ?auto_55934 ) ) ( not ( = ?auto_55930 ?auto_55935 ) ) ( not ( = ?auto_55930 ?auto_55936 ) ) ( not ( = ?auto_55930 ?auto_55937 ) ) ( not ( = ?auto_55931 ?auto_55932 ) ) ( not ( = ?auto_55931 ?auto_55933 ) ) ( not ( = ?auto_55931 ?auto_55934 ) ) ( not ( = ?auto_55931 ?auto_55935 ) ) ( not ( = ?auto_55931 ?auto_55936 ) ) ( not ( = ?auto_55931 ?auto_55937 ) ) ( not ( = ?auto_55932 ?auto_55933 ) ) ( not ( = ?auto_55932 ?auto_55934 ) ) ( not ( = ?auto_55932 ?auto_55935 ) ) ( not ( = ?auto_55932 ?auto_55936 ) ) ( not ( = ?auto_55932 ?auto_55937 ) ) ( not ( = ?auto_55933 ?auto_55934 ) ) ( not ( = ?auto_55933 ?auto_55935 ) ) ( not ( = ?auto_55933 ?auto_55936 ) ) ( not ( = ?auto_55933 ?auto_55937 ) ) ( not ( = ?auto_55934 ?auto_55935 ) ) ( not ( = ?auto_55934 ?auto_55936 ) ) ( not ( = ?auto_55934 ?auto_55937 ) ) ( not ( = ?auto_55935 ?auto_55936 ) ) ( not ( = ?auto_55935 ?auto_55937 ) ) ( not ( = ?auto_55936 ?auto_55937 ) ) ( ON ?auto_55935 ?auto_55936 ) ( ON ?auto_55934 ?auto_55935 ) ( CLEAR ?auto_55932 ) ( ON ?auto_55933 ?auto_55934 ) ( CLEAR ?auto_55933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55928 ?auto_55929 ?auto_55930 ?auto_55931 ?auto_55932 ?auto_55933 )
      ( MAKE-9PILE ?auto_55928 ?auto_55929 ?auto_55930 ?auto_55931 ?auto_55932 ?auto_55933 ?auto_55934 ?auto_55935 ?auto_55936 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55947 - BLOCK
      ?auto_55948 - BLOCK
      ?auto_55949 - BLOCK
      ?auto_55950 - BLOCK
      ?auto_55951 - BLOCK
      ?auto_55952 - BLOCK
      ?auto_55953 - BLOCK
      ?auto_55954 - BLOCK
      ?auto_55955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55955 ) ( ON-TABLE ?auto_55947 ) ( ON ?auto_55948 ?auto_55947 ) ( ON ?auto_55949 ?auto_55948 ) ( ON ?auto_55950 ?auto_55949 ) ( ON ?auto_55951 ?auto_55950 ) ( not ( = ?auto_55947 ?auto_55948 ) ) ( not ( = ?auto_55947 ?auto_55949 ) ) ( not ( = ?auto_55947 ?auto_55950 ) ) ( not ( = ?auto_55947 ?auto_55951 ) ) ( not ( = ?auto_55947 ?auto_55952 ) ) ( not ( = ?auto_55947 ?auto_55953 ) ) ( not ( = ?auto_55947 ?auto_55954 ) ) ( not ( = ?auto_55947 ?auto_55955 ) ) ( not ( = ?auto_55948 ?auto_55949 ) ) ( not ( = ?auto_55948 ?auto_55950 ) ) ( not ( = ?auto_55948 ?auto_55951 ) ) ( not ( = ?auto_55948 ?auto_55952 ) ) ( not ( = ?auto_55948 ?auto_55953 ) ) ( not ( = ?auto_55948 ?auto_55954 ) ) ( not ( = ?auto_55948 ?auto_55955 ) ) ( not ( = ?auto_55949 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55949 ?auto_55952 ) ) ( not ( = ?auto_55949 ?auto_55953 ) ) ( not ( = ?auto_55949 ?auto_55954 ) ) ( not ( = ?auto_55949 ?auto_55955 ) ) ( not ( = ?auto_55950 ?auto_55951 ) ) ( not ( = ?auto_55950 ?auto_55952 ) ) ( not ( = ?auto_55950 ?auto_55953 ) ) ( not ( = ?auto_55950 ?auto_55954 ) ) ( not ( = ?auto_55950 ?auto_55955 ) ) ( not ( = ?auto_55951 ?auto_55952 ) ) ( not ( = ?auto_55951 ?auto_55953 ) ) ( not ( = ?auto_55951 ?auto_55954 ) ) ( not ( = ?auto_55951 ?auto_55955 ) ) ( not ( = ?auto_55952 ?auto_55953 ) ) ( not ( = ?auto_55952 ?auto_55954 ) ) ( not ( = ?auto_55952 ?auto_55955 ) ) ( not ( = ?auto_55953 ?auto_55954 ) ) ( not ( = ?auto_55953 ?auto_55955 ) ) ( not ( = ?auto_55954 ?auto_55955 ) ) ( ON ?auto_55954 ?auto_55955 ) ( ON ?auto_55953 ?auto_55954 ) ( CLEAR ?auto_55951 ) ( ON ?auto_55952 ?auto_55953 ) ( CLEAR ?auto_55952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_55947 ?auto_55948 ?auto_55949 ?auto_55950 ?auto_55951 ?auto_55952 )
      ( MAKE-9PILE ?auto_55947 ?auto_55948 ?auto_55949 ?auto_55950 ?auto_55951 ?auto_55952 ?auto_55953 ?auto_55954 ?auto_55955 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55965 - BLOCK
      ?auto_55966 - BLOCK
      ?auto_55967 - BLOCK
      ?auto_55968 - BLOCK
      ?auto_55969 - BLOCK
      ?auto_55970 - BLOCK
      ?auto_55971 - BLOCK
      ?auto_55972 - BLOCK
      ?auto_55973 - BLOCK
    )
    :vars
    (
      ?auto_55974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_55973 ?auto_55974 ) ( ON-TABLE ?auto_55965 ) ( ON ?auto_55966 ?auto_55965 ) ( ON ?auto_55967 ?auto_55966 ) ( ON ?auto_55968 ?auto_55967 ) ( not ( = ?auto_55965 ?auto_55966 ) ) ( not ( = ?auto_55965 ?auto_55967 ) ) ( not ( = ?auto_55965 ?auto_55968 ) ) ( not ( = ?auto_55965 ?auto_55969 ) ) ( not ( = ?auto_55965 ?auto_55970 ) ) ( not ( = ?auto_55965 ?auto_55971 ) ) ( not ( = ?auto_55965 ?auto_55972 ) ) ( not ( = ?auto_55965 ?auto_55973 ) ) ( not ( = ?auto_55965 ?auto_55974 ) ) ( not ( = ?auto_55966 ?auto_55967 ) ) ( not ( = ?auto_55966 ?auto_55968 ) ) ( not ( = ?auto_55966 ?auto_55969 ) ) ( not ( = ?auto_55966 ?auto_55970 ) ) ( not ( = ?auto_55966 ?auto_55971 ) ) ( not ( = ?auto_55966 ?auto_55972 ) ) ( not ( = ?auto_55966 ?auto_55973 ) ) ( not ( = ?auto_55966 ?auto_55974 ) ) ( not ( = ?auto_55967 ?auto_55968 ) ) ( not ( = ?auto_55967 ?auto_55969 ) ) ( not ( = ?auto_55967 ?auto_55970 ) ) ( not ( = ?auto_55967 ?auto_55971 ) ) ( not ( = ?auto_55967 ?auto_55972 ) ) ( not ( = ?auto_55967 ?auto_55973 ) ) ( not ( = ?auto_55967 ?auto_55974 ) ) ( not ( = ?auto_55968 ?auto_55969 ) ) ( not ( = ?auto_55968 ?auto_55970 ) ) ( not ( = ?auto_55968 ?auto_55971 ) ) ( not ( = ?auto_55968 ?auto_55972 ) ) ( not ( = ?auto_55968 ?auto_55973 ) ) ( not ( = ?auto_55968 ?auto_55974 ) ) ( not ( = ?auto_55969 ?auto_55970 ) ) ( not ( = ?auto_55969 ?auto_55971 ) ) ( not ( = ?auto_55969 ?auto_55972 ) ) ( not ( = ?auto_55969 ?auto_55973 ) ) ( not ( = ?auto_55969 ?auto_55974 ) ) ( not ( = ?auto_55970 ?auto_55971 ) ) ( not ( = ?auto_55970 ?auto_55972 ) ) ( not ( = ?auto_55970 ?auto_55973 ) ) ( not ( = ?auto_55970 ?auto_55974 ) ) ( not ( = ?auto_55971 ?auto_55972 ) ) ( not ( = ?auto_55971 ?auto_55973 ) ) ( not ( = ?auto_55971 ?auto_55974 ) ) ( not ( = ?auto_55972 ?auto_55973 ) ) ( not ( = ?auto_55972 ?auto_55974 ) ) ( not ( = ?auto_55973 ?auto_55974 ) ) ( ON ?auto_55972 ?auto_55973 ) ( ON ?auto_55971 ?auto_55972 ) ( ON ?auto_55970 ?auto_55971 ) ( CLEAR ?auto_55968 ) ( ON ?auto_55969 ?auto_55970 ) ( CLEAR ?auto_55969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55965 ?auto_55966 ?auto_55967 ?auto_55968 ?auto_55969 )
      ( MAKE-9PILE ?auto_55965 ?auto_55966 ?auto_55967 ?auto_55968 ?auto_55969 ?auto_55970 ?auto_55971 ?auto_55972 ?auto_55973 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_55984 - BLOCK
      ?auto_55985 - BLOCK
      ?auto_55986 - BLOCK
      ?auto_55987 - BLOCK
      ?auto_55988 - BLOCK
      ?auto_55989 - BLOCK
      ?auto_55990 - BLOCK
      ?auto_55991 - BLOCK
      ?auto_55992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_55992 ) ( ON-TABLE ?auto_55984 ) ( ON ?auto_55985 ?auto_55984 ) ( ON ?auto_55986 ?auto_55985 ) ( ON ?auto_55987 ?auto_55986 ) ( not ( = ?auto_55984 ?auto_55985 ) ) ( not ( = ?auto_55984 ?auto_55986 ) ) ( not ( = ?auto_55984 ?auto_55987 ) ) ( not ( = ?auto_55984 ?auto_55988 ) ) ( not ( = ?auto_55984 ?auto_55989 ) ) ( not ( = ?auto_55984 ?auto_55990 ) ) ( not ( = ?auto_55984 ?auto_55991 ) ) ( not ( = ?auto_55984 ?auto_55992 ) ) ( not ( = ?auto_55985 ?auto_55986 ) ) ( not ( = ?auto_55985 ?auto_55987 ) ) ( not ( = ?auto_55985 ?auto_55988 ) ) ( not ( = ?auto_55985 ?auto_55989 ) ) ( not ( = ?auto_55985 ?auto_55990 ) ) ( not ( = ?auto_55985 ?auto_55991 ) ) ( not ( = ?auto_55985 ?auto_55992 ) ) ( not ( = ?auto_55986 ?auto_55987 ) ) ( not ( = ?auto_55986 ?auto_55988 ) ) ( not ( = ?auto_55986 ?auto_55989 ) ) ( not ( = ?auto_55986 ?auto_55990 ) ) ( not ( = ?auto_55986 ?auto_55991 ) ) ( not ( = ?auto_55986 ?auto_55992 ) ) ( not ( = ?auto_55987 ?auto_55988 ) ) ( not ( = ?auto_55987 ?auto_55989 ) ) ( not ( = ?auto_55987 ?auto_55990 ) ) ( not ( = ?auto_55987 ?auto_55991 ) ) ( not ( = ?auto_55987 ?auto_55992 ) ) ( not ( = ?auto_55988 ?auto_55989 ) ) ( not ( = ?auto_55988 ?auto_55990 ) ) ( not ( = ?auto_55988 ?auto_55991 ) ) ( not ( = ?auto_55988 ?auto_55992 ) ) ( not ( = ?auto_55989 ?auto_55990 ) ) ( not ( = ?auto_55989 ?auto_55991 ) ) ( not ( = ?auto_55989 ?auto_55992 ) ) ( not ( = ?auto_55990 ?auto_55991 ) ) ( not ( = ?auto_55990 ?auto_55992 ) ) ( not ( = ?auto_55991 ?auto_55992 ) ) ( ON ?auto_55991 ?auto_55992 ) ( ON ?auto_55990 ?auto_55991 ) ( ON ?auto_55989 ?auto_55990 ) ( CLEAR ?auto_55987 ) ( ON ?auto_55988 ?auto_55989 ) ( CLEAR ?auto_55988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_55984 ?auto_55985 ?auto_55986 ?auto_55987 ?auto_55988 )
      ( MAKE-9PILE ?auto_55984 ?auto_55985 ?auto_55986 ?auto_55987 ?auto_55988 ?auto_55989 ?auto_55990 ?auto_55991 ?auto_55992 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56002 - BLOCK
      ?auto_56003 - BLOCK
      ?auto_56004 - BLOCK
      ?auto_56005 - BLOCK
      ?auto_56006 - BLOCK
      ?auto_56007 - BLOCK
      ?auto_56008 - BLOCK
      ?auto_56009 - BLOCK
      ?auto_56010 - BLOCK
    )
    :vars
    (
      ?auto_56011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56010 ?auto_56011 ) ( ON-TABLE ?auto_56002 ) ( ON ?auto_56003 ?auto_56002 ) ( ON ?auto_56004 ?auto_56003 ) ( not ( = ?auto_56002 ?auto_56003 ) ) ( not ( = ?auto_56002 ?auto_56004 ) ) ( not ( = ?auto_56002 ?auto_56005 ) ) ( not ( = ?auto_56002 ?auto_56006 ) ) ( not ( = ?auto_56002 ?auto_56007 ) ) ( not ( = ?auto_56002 ?auto_56008 ) ) ( not ( = ?auto_56002 ?auto_56009 ) ) ( not ( = ?auto_56002 ?auto_56010 ) ) ( not ( = ?auto_56002 ?auto_56011 ) ) ( not ( = ?auto_56003 ?auto_56004 ) ) ( not ( = ?auto_56003 ?auto_56005 ) ) ( not ( = ?auto_56003 ?auto_56006 ) ) ( not ( = ?auto_56003 ?auto_56007 ) ) ( not ( = ?auto_56003 ?auto_56008 ) ) ( not ( = ?auto_56003 ?auto_56009 ) ) ( not ( = ?auto_56003 ?auto_56010 ) ) ( not ( = ?auto_56003 ?auto_56011 ) ) ( not ( = ?auto_56004 ?auto_56005 ) ) ( not ( = ?auto_56004 ?auto_56006 ) ) ( not ( = ?auto_56004 ?auto_56007 ) ) ( not ( = ?auto_56004 ?auto_56008 ) ) ( not ( = ?auto_56004 ?auto_56009 ) ) ( not ( = ?auto_56004 ?auto_56010 ) ) ( not ( = ?auto_56004 ?auto_56011 ) ) ( not ( = ?auto_56005 ?auto_56006 ) ) ( not ( = ?auto_56005 ?auto_56007 ) ) ( not ( = ?auto_56005 ?auto_56008 ) ) ( not ( = ?auto_56005 ?auto_56009 ) ) ( not ( = ?auto_56005 ?auto_56010 ) ) ( not ( = ?auto_56005 ?auto_56011 ) ) ( not ( = ?auto_56006 ?auto_56007 ) ) ( not ( = ?auto_56006 ?auto_56008 ) ) ( not ( = ?auto_56006 ?auto_56009 ) ) ( not ( = ?auto_56006 ?auto_56010 ) ) ( not ( = ?auto_56006 ?auto_56011 ) ) ( not ( = ?auto_56007 ?auto_56008 ) ) ( not ( = ?auto_56007 ?auto_56009 ) ) ( not ( = ?auto_56007 ?auto_56010 ) ) ( not ( = ?auto_56007 ?auto_56011 ) ) ( not ( = ?auto_56008 ?auto_56009 ) ) ( not ( = ?auto_56008 ?auto_56010 ) ) ( not ( = ?auto_56008 ?auto_56011 ) ) ( not ( = ?auto_56009 ?auto_56010 ) ) ( not ( = ?auto_56009 ?auto_56011 ) ) ( not ( = ?auto_56010 ?auto_56011 ) ) ( ON ?auto_56009 ?auto_56010 ) ( ON ?auto_56008 ?auto_56009 ) ( ON ?auto_56007 ?auto_56008 ) ( ON ?auto_56006 ?auto_56007 ) ( CLEAR ?auto_56004 ) ( ON ?auto_56005 ?auto_56006 ) ( CLEAR ?auto_56005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56002 ?auto_56003 ?auto_56004 ?auto_56005 )
      ( MAKE-9PILE ?auto_56002 ?auto_56003 ?auto_56004 ?auto_56005 ?auto_56006 ?auto_56007 ?auto_56008 ?auto_56009 ?auto_56010 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56021 - BLOCK
      ?auto_56022 - BLOCK
      ?auto_56023 - BLOCK
      ?auto_56024 - BLOCK
      ?auto_56025 - BLOCK
      ?auto_56026 - BLOCK
      ?auto_56027 - BLOCK
      ?auto_56028 - BLOCK
      ?auto_56029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56029 ) ( ON-TABLE ?auto_56021 ) ( ON ?auto_56022 ?auto_56021 ) ( ON ?auto_56023 ?auto_56022 ) ( not ( = ?auto_56021 ?auto_56022 ) ) ( not ( = ?auto_56021 ?auto_56023 ) ) ( not ( = ?auto_56021 ?auto_56024 ) ) ( not ( = ?auto_56021 ?auto_56025 ) ) ( not ( = ?auto_56021 ?auto_56026 ) ) ( not ( = ?auto_56021 ?auto_56027 ) ) ( not ( = ?auto_56021 ?auto_56028 ) ) ( not ( = ?auto_56021 ?auto_56029 ) ) ( not ( = ?auto_56022 ?auto_56023 ) ) ( not ( = ?auto_56022 ?auto_56024 ) ) ( not ( = ?auto_56022 ?auto_56025 ) ) ( not ( = ?auto_56022 ?auto_56026 ) ) ( not ( = ?auto_56022 ?auto_56027 ) ) ( not ( = ?auto_56022 ?auto_56028 ) ) ( not ( = ?auto_56022 ?auto_56029 ) ) ( not ( = ?auto_56023 ?auto_56024 ) ) ( not ( = ?auto_56023 ?auto_56025 ) ) ( not ( = ?auto_56023 ?auto_56026 ) ) ( not ( = ?auto_56023 ?auto_56027 ) ) ( not ( = ?auto_56023 ?auto_56028 ) ) ( not ( = ?auto_56023 ?auto_56029 ) ) ( not ( = ?auto_56024 ?auto_56025 ) ) ( not ( = ?auto_56024 ?auto_56026 ) ) ( not ( = ?auto_56024 ?auto_56027 ) ) ( not ( = ?auto_56024 ?auto_56028 ) ) ( not ( = ?auto_56024 ?auto_56029 ) ) ( not ( = ?auto_56025 ?auto_56026 ) ) ( not ( = ?auto_56025 ?auto_56027 ) ) ( not ( = ?auto_56025 ?auto_56028 ) ) ( not ( = ?auto_56025 ?auto_56029 ) ) ( not ( = ?auto_56026 ?auto_56027 ) ) ( not ( = ?auto_56026 ?auto_56028 ) ) ( not ( = ?auto_56026 ?auto_56029 ) ) ( not ( = ?auto_56027 ?auto_56028 ) ) ( not ( = ?auto_56027 ?auto_56029 ) ) ( not ( = ?auto_56028 ?auto_56029 ) ) ( ON ?auto_56028 ?auto_56029 ) ( ON ?auto_56027 ?auto_56028 ) ( ON ?auto_56026 ?auto_56027 ) ( ON ?auto_56025 ?auto_56026 ) ( CLEAR ?auto_56023 ) ( ON ?auto_56024 ?auto_56025 ) ( CLEAR ?auto_56024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_56021 ?auto_56022 ?auto_56023 ?auto_56024 )
      ( MAKE-9PILE ?auto_56021 ?auto_56022 ?auto_56023 ?auto_56024 ?auto_56025 ?auto_56026 ?auto_56027 ?auto_56028 ?auto_56029 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56039 - BLOCK
      ?auto_56040 - BLOCK
      ?auto_56041 - BLOCK
      ?auto_56042 - BLOCK
      ?auto_56043 - BLOCK
      ?auto_56044 - BLOCK
      ?auto_56045 - BLOCK
      ?auto_56046 - BLOCK
      ?auto_56047 - BLOCK
    )
    :vars
    (
      ?auto_56048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56047 ?auto_56048 ) ( ON-TABLE ?auto_56039 ) ( ON ?auto_56040 ?auto_56039 ) ( not ( = ?auto_56039 ?auto_56040 ) ) ( not ( = ?auto_56039 ?auto_56041 ) ) ( not ( = ?auto_56039 ?auto_56042 ) ) ( not ( = ?auto_56039 ?auto_56043 ) ) ( not ( = ?auto_56039 ?auto_56044 ) ) ( not ( = ?auto_56039 ?auto_56045 ) ) ( not ( = ?auto_56039 ?auto_56046 ) ) ( not ( = ?auto_56039 ?auto_56047 ) ) ( not ( = ?auto_56039 ?auto_56048 ) ) ( not ( = ?auto_56040 ?auto_56041 ) ) ( not ( = ?auto_56040 ?auto_56042 ) ) ( not ( = ?auto_56040 ?auto_56043 ) ) ( not ( = ?auto_56040 ?auto_56044 ) ) ( not ( = ?auto_56040 ?auto_56045 ) ) ( not ( = ?auto_56040 ?auto_56046 ) ) ( not ( = ?auto_56040 ?auto_56047 ) ) ( not ( = ?auto_56040 ?auto_56048 ) ) ( not ( = ?auto_56041 ?auto_56042 ) ) ( not ( = ?auto_56041 ?auto_56043 ) ) ( not ( = ?auto_56041 ?auto_56044 ) ) ( not ( = ?auto_56041 ?auto_56045 ) ) ( not ( = ?auto_56041 ?auto_56046 ) ) ( not ( = ?auto_56041 ?auto_56047 ) ) ( not ( = ?auto_56041 ?auto_56048 ) ) ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56044 ) ) ( not ( = ?auto_56042 ?auto_56045 ) ) ( not ( = ?auto_56042 ?auto_56046 ) ) ( not ( = ?auto_56042 ?auto_56047 ) ) ( not ( = ?auto_56042 ?auto_56048 ) ) ( not ( = ?auto_56043 ?auto_56044 ) ) ( not ( = ?auto_56043 ?auto_56045 ) ) ( not ( = ?auto_56043 ?auto_56046 ) ) ( not ( = ?auto_56043 ?auto_56047 ) ) ( not ( = ?auto_56043 ?auto_56048 ) ) ( not ( = ?auto_56044 ?auto_56045 ) ) ( not ( = ?auto_56044 ?auto_56046 ) ) ( not ( = ?auto_56044 ?auto_56047 ) ) ( not ( = ?auto_56044 ?auto_56048 ) ) ( not ( = ?auto_56045 ?auto_56046 ) ) ( not ( = ?auto_56045 ?auto_56047 ) ) ( not ( = ?auto_56045 ?auto_56048 ) ) ( not ( = ?auto_56046 ?auto_56047 ) ) ( not ( = ?auto_56046 ?auto_56048 ) ) ( not ( = ?auto_56047 ?auto_56048 ) ) ( ON ?auto_56046 ?auto_56047 ) ( ON ?auto_56045 ?auto_56046 ) ( ON ?auto_56044 ?auto_56045 ) ( ON ?auto_56043 ?auto_56044 ) ( ON ?auto_56042 ?auto_56043 ) ( CLEAR ?auto_56040 ) ( ON ?auto_56041 ?auto_56042 ) ( CLEAR ?auto_56041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56039 ?auto_56040 ?auto_56041 )
      ( MAKE-9PILE ?auto_56039 ?auto_56040 ?auto_56041 ?auto_56042 ?auto_56043 ?auto_56044 ?auto_56045 ?auto_56046 ?auto_56047 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56058 - BLOCK
      ?auto_56059 - BLOCK
      ?auto_56060 - BLOCK
      ?auto_56061 - BLOCK
      ?auto_56062 - BLOCK
      ?auto_56063 - BLOCK
      ?auto_56064 - BLOCK
      ?auto_56065 - BLOCK
      ?auto_56066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56066 ) ( ON-TABLE ?auto_56058 ) ( ON ?auto_56059 ?auto_56058 ) ( not ( = ?auto_56058 ?auto_56059 ) ) ( not ( = ?auto_56058 ?auto_56060 ) ) ( not ( = ?auto_56058 ?auto_56061 ) ) ( not ( = ?auto_56058 ?auto_56062 ) ) ( not ( = ?auto_56058 ?auto_56063 ) ) ( not ( = ?auto_56058 ?auto_56064 ) ) ( not ( = ?auto_56058 ?auto_56065 ) ) ( not ( = ?auto_56058 ?auto_56066 ) ) ( not ( = ?auto_56059 ?auto_56060 ) ) ( not ( = ?auto_56059 ?auto_56061 ) ) ( not ( = ?auto_56059 ?auto_56062 ) ) ( not ( = ?auto_56059 ?auto_56063 ) ) ( not ( = ?auto_56059 ?auto_56064 ) ) ( not ( = ?auto_56059 ?auto_56065 ) ) ( not ( = ?auto_56059 ?auto_56066 ) ) ( not ( = ?auto_56060 ?auto_56061 ) ) ( not ( = ?auto_56060 ?auto_56062 ) ) ( not ( = ?auto_56060 ?auto_56063 ) ) ( not ( = ?auto_56060 ?auto_56064 ) ) ( not ( = ?auto_56060 ?auto_56065 ) ) ( not ( = ?auto_56060 ?auto_56066 ) ) ( not ( = ?auto_56061 ?auto_56062 ) ) ( not ( = ?auto_56061 ?auto_56063 ) ) ( not ( = ?auto_56061 ?auto_56064 ) ) ( not ( = ?auto_56061 ?auto_56065 ) ) ( not ( = ?auto_56061 ?auto_56066 ) ) ( not ( = ?auto_56062 ?auto_56063 ) ) ( not ( = ?auto_56062 ?auto_56064 ) ) ( not ( = ?auto_56062 ?auto_56065 ) ) ( not ( = ?auto_56062 ?auto_56066 ) ) ( not ( = ?auto_56063 ?auto_56064 ) ) ( not ( = ?auto_56063 ?auto_56065 ) ) ( not ( = ?auto_56063 ?auto_56066 ) ) ( not ( = ?auto_56064 ?auto_56065 ) ) ( not ( = ?auto_56064 ?auto_56066 ) ) ( not ( = ?auto_56065 ?auto_56066 ) ) ( ON ?auto_56065 ?auto_56066 ) ( ON ?auto_56064 ?auto_56065 ) ( ON ?auto_56063 ?auto_56064 ) ( ON ?auto_56062 ?auto_56063 ) ( ON ?auto_56061 ?auto_56062 ) ( CLEAR ?auto_56059 ) ( ON ?auto_56060 ?auto_56061 ) ( CLEAR ?auto_56060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_56058 ?auto_56059 ?auto_56060 )
      ( MAKE-9PILE ?auto_56058 ?auto_56059 ?auto_56060 ?auto_56061 ?auto_56062 ?auto_56063 ?auto_56064 ?auto_56065 ?auto_56066 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56076 - BLOCK
      ?auto_56077 - BLOCK
      ?auto_56078 - BLOCK
      ?auto_56079 - BLOCK
      ?auto_56080 - BLOCK
      ?auto_56081 - BLOCK
      ?auto_56082 - BLOCK
      ?auto_56083 - BLOCK
      ?auto_56084 - BLOCK
    )
    :vars
    (
      ?auto_56085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56084 ?auto_56085 ) ( ON-TABLE ?auto_56076 ) ( not ( = ?auto_56076 ?auto_56077 ) ) ( not ( = ?auto_56076 ?auto_56078 ) ) ( not ( = ?auto_56076 ?auto_56079 ) ) ( not ( = ?auto_56076 ?auto_56080 ) ) ( not ( = ?auto_56076 ?auto_56081 ) ) ( not ( = ?auto_56076 ?auto_56082 ) ) ( not ( = ?auto_56076 ?auto_56083 ) ) ( not ( = ?auto_56076 ?auto_56084 ) ) ( not ( = ?auto_56076 ?auto_56085 ) ) ( not ( = ?auto_56077 ?auto_56078 ) ) ( not ( = ?auto_56077 ?auto_56079 ) ) ( not ( = ?auto_56077 ?auto_56080 ) ) ( not ( = ?auto_56077 ?auto_56081 ) ) ( not ( = ?auto_56077 ?auto_56082 ) ) ( not ( = ?auto_56077 ?auto_56083 ) ) ( not ( = ?auto_56077 ?auto_56084 ) ) ( not ( = ?auto_56077 ?auto_56085 ) ) ( not ( = ?auto_56078 ?auto_56079 ) ) ( not ( = ?auto_56078 ?auto_56080 ) ) ( not ( = ?auto_56078 ?auto_56081 ) ) ( not ( = ?auto_56078 ?auto_56082 ) ) ( not ( = ?auto_56078 ?auto_56083 ) ) ( not ( = ?auto_56078 ?auto_56084 ) ) ( not ( = ?auto_56078 ?auto_56085 ) ) ( not ( = ?auto_56079 ?auto_56080 ) ) ( not ( = ?auto_56079 ?auto_56081 ) ) ( not ( = ?auto_56079 ?auto_56082 ) ) ( not ( = ?auto_56079 ?auto_56083 ) ) ( not ( = ?auto_56079 ?auto_56084 ) ) ( not ( = ?auto_56079 ?auto_56085 ) ) ( not ( = ?auto_56080 ?auto_56081 ) ) ( not ( = ?auto_56080 ?auto_56082 ) ) ( not ( = ?auto_56080 ?auto_56083 ) ) ( not ( = ?auto_56080 ?auto_56084 ) ) ( not ( = ?auto_56080 ?auto_56085 ) ) ( not ( = ?auto_56081 ?auto_56082 ) ) ( not ( = ?auto_56081 ?auto_56083 ) ) ( not ( = ?auto_56081 ?auto_56084 ) ) ( not ( = ?auto_56081 ?auto_56085 ) ) ( not ( = ?auto_56082 ?auto_56083 ) ) ( not ( = ?auto_56082 ?auto_56084 ) ) ( not ( = ?auto_56082 ?auto_56085 ) ) ( not ( = ?auto_56083 ?auto_56084 ) ) ( not ( = ?auto_56083 ?auto_56085 ) ) ( not ( = ?auto_56084 ?auto_56085 ) ) ( ON ?auto_56083 ?auto_56084 ) ( ON ?auto_56082 ?auto_56083 ) ( ON ?auto_56081 ?auto_56082 ) ( ON ?auto_56080 ?auto_56081 ) ( ON ?auto_56079 ?auto_56080 ) ( ON ?auto_56078 ?auto_56079 ) ( CLEAR ?auto_56076 ) ( ON ?auto_56077 ?auto_56078 ) ( CLEAR ?auto_56077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56076 ?auto_56077 )
      ( MAKE-9PILE ?auto_56076 ?auto_56077 ?auto_56078 ?auto_56079 ?auto_56080 ?auto_56081 ?auto_56082 ?auto_56083 ?auto_56084 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56095 - BLOCK
      ?auto_56096 - BLOCK
      ?auto_56097 - BLOCK
      ?auto_56098 - BLOCK
      ?auto_56099 - BLOCK
      ?auto_56100 - BLOCK
      ?auto_56101 - BLOCK
      ?auto_56102 - BLOCK
      ?auto_56103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56103 ) ( ON-TABLE ?auto_56095 ) ( not ( = ?auto_56095 ?auto_56096 ) ) ( not ( = ?auto_56095 ?auto_56097 ) ) ( not ( = ?auto_56095 ?auto_56098 ) ) ( not ( = ?auto_56095 ?auto_56099 ) ) ( not ( = ?auto_56095 ?auto_56100 ) ) ( not ( = ?auto_56095 ?auto_56101 ) ) ( not ( = ?auto_56095 ?auto_56102 ) ) ( not ( = ?auto_56095 ?auto_56103 ) ) ( not ( = ?auto_56096 ?auto_56097 ) ) ( not ( = ?auto_56096 ?auto_56098 ) ) ( not ( = ?auto_56096 ?auto_56099 ) ) ( not ( = ?auto_56096 ?auto_56100 ) ) ( not ( = ?auto_56096 ?auto_56101 ) ) ( not ( = ?auto_56096 ?auto_56102 ) ) ( not ( = ?auto_56096 ?auto_56103 ) ) ( not ( = ?auto_56097 ?auto_56098 ) ) ( not ( = ?auto_56097 ?auto_56099 ) ) ( not ( = ?auto_56097 ?auto_56100 ) ) ( not ( = ?auto_56097 ?auto_56101 ) ) ( not ( = ?auto_56097 ?auto_56102 ) ) ( not ( = ?auto_56097 ?auto_56103 ) ) ( not ( = ?auto_56098 ?auto_56099 ) ) ( not ( = ?auto_56098 ?auto_56100 ) ) ( not ( = ?auto_56098 ?auto_56101 ) ) ( not ( = ?auto_56098 ?auto_56102 ) ) ( not ( = ?auto_56098 ?auto_56103 ) ) ( not ( = ?auto_56099 ?auto_56100 ) ) ( not ( = ?auto_56099 ?auto_56101 ) ) ( not ( = ?auto_56099 ?auto_56102 ) ) ( not ( = ?auto_56099 ?auto_56103 ) ) ( not ( = ?auto_56100 ?auto_56101 ) ) ( not ( = ?auto_56100 ?auto_56102 ) ) ( not ( = ?auto_56100 ?auto_56103 ) ) ( not ( = ?auto_56101 ?auto_56102 ) ) ( not ( = ?auto_56101 ?auto_56103 ) ) ( not ( = ?auto_56102 ?auto_56103 ) ) ( ON ?auto_56102 ?auto_56103 ) ( ON ?auto_56101 ?auto_56102 ) ( ON ?auto_56100 ?auto_56101 ) ( ON ?auto_56099 ?auto_56100 ) ( ON ?auto_56098 ?auto_56099 ) ( ON ?auto_56097 ?auto_56098 ) ( CLEAR ?auto_56095 ) ( ON ?auto_56096 ?auto_56097 ) ( CLEAR ?auto_56096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56095 ?auto_56096 )
      ( MAKE-9PILE ?auto_56095 ?auto_56096 ?auto_56097 ?auto_56098 ?auto_56099 ?auto_56100 ?auto_56101 ?auto_56102 ?auto_56103 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56113 - BLOCK
      ?auto_56114 - BLOCK
      ?auto_56115 - BLOCK
      ?auto_56116 - BLOCK
      ?auto_56117 - BLOCK
      ?auto_56118 - BLOCK
      ?auto_56119 - BLOCK
      ?auto_56120 - BLOCK
      ?auto_56121 - BLOCK
    )
    :vars
    (
      ?auto_56122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56121 ?auto_56122 ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( not ( = ?auto_56113 ?auto_56115 ) ) ( not ( = ?auto_56113 ?auto_56116 ) ) ( not ( = ?auto_56113 ?auto_56117 ) ) ( not ( = ?auto_56113 ?auto_56118 ) ) ( not ( = ?auto_56113 ?auto_56119 ) ) ( not ( = ?auto_56113 ?auto_56120 ) ) ( not ( = ?auto_56113 ?auto_56121 ) ) ( not ( = ?auto_56113 ?auto_56122 ) ) ( not ( = ?auto_56114 ?auto_56115 ) ) ( not ( = ?auto_56114 ?auto_56116 ) ) ( not ( = ?auto_56114 ?auto_56117 ) ) ( not ( = ?auto_56114 ?auto_56118 ) ) ( not ( = ?auto_56114 ?auto_56119 ) ) ( not ( = ?auto_56114 ?auto_56120 ) ) ( not ( = ?auto_56114 ?auto_56121 ) ) ( not ( = ?auto_56114 ?auto_56122 ) ) ( not ( = ?auto_56115 ?auto_56116 ) ) ( not ( = ?auto_56115 ?auto_56117 ) ) ( not ( = ?auto_56115 ?auto_56118 ) ) ( not ( = ?auto_56115 ?auto_56119 ) ) ( not ( = ?auto_56115 ?auto_56120 ) ) ( not ( = ?auto_56115 ?auto_56121 ) ) ( not ( = ?auto_56115 ?auto_56122 ) ) ( not ( = ?auto_56116 ?auto_56117 ) ) ( not ( = ?auto_56116 ?auto_56118 ) ) ( not ( = ?auto_56116 ?auto_56119 ) ) ( not ( = ?auto_56116 ?auto_56120 ) ) ( not ( = ?auto_56116 ?auto_56121 ) ) ( not ( = ?auto_56116 ?auto_56122 ) ) ( not ( = ?auto_56117 ?auto_56118 ) ) ( not ( = ?auto_56117 ?auto_56119 ) ) ( not ( = ?auto_56117 ?auto_56120 ) ) ( not ( = ?auto_56117 ?auto_56121 ) ) ( not ( = ?auto_56117 ?auto_56122 ) ) ( not ( = ?auto_56118 ?auto_56119 ) ) ( not ( = ?auto_56118 ?auto_56120 ) ) ( not ( = ?auto_56118 ?auto_56121 ) ) ( not ( = ?auto_56118 ?auto_56122 ) ) ( not ( = ?auto_56119 ?auto_56120 ) ) ( not ( = ?auto_56119 ?auto_56121 ) ) ( not ( = ?auto_56119 ?auto_56122 ) ) ( not ( = ?auto_56120 ?auto_56121 ) ) ( not ( = ?auto_56120 ?auto_56122 ) ) ( not ( = ?auto_56121 ?auto_56122 ) ) ( ON ?auto_56120 ?auto_56121 ) ( ON ?auto_56119 ?auto_56120 ) ( ON ?auto_56118 ?auto_56119 ) ( ON ?auto_56117 ?auto_56118 ) ( ON ?auto_56116 ?auto_56117 ) ( ON ?auto_56115 ?auto_56116 ) ( ON ?auto_56114 ?auto_56115 ) ( ON ?auto_56113 ?auto_56114 ) ( CLEAR ?auto_56113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56113 )
      ( MAKE-9PILE ?auto_56113 ?auto_56114 ?auto_56115 ?auto_56116 ?auto_56117 ?auto_56118 ?auto_56119 ?auto_56120 ?auto_56121 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56132 - BLOCK
      ?auto_56133 - BLOCK
      ?auto_56134 - BLOCK
      ?auto_56135 - BLOCK
      ?auto_56136 - BLOCK
      ?auto_56137 - BLOCK
      ?auto_56138 - BLOCK
      ?auto_56139 - BLOCK
      ?auto_56140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_56140 ) ( not ( = ?auto_56132 ?auto_56133 ) ) ( not ( = ?auto_56132 ?auto_56134 ) ) ( not ( = ?auto_56132 ?auto_56135 ) ) ( not ( = ?auto_56132 ?auto_56136 ) ) ( not ( = ?auto_56132 ?auto_56137 ) ) ( not ( = ?auto_56132 ?auto_56138 ) ) ( not ( = ?auto_56132 ?auto_56139 ) ) ( not ( = ?auto_56132 ?auto_56140 ) ) ( not ( = ?auto_56133 ?auto_56134 ) ) ( not ( = ?auto_56133 ?auto_56135 ) ) ( not ( = ?auto_56133 ?auto_56136 ) ) ( not ( = ?auto_56133 ?auto_56137 ) ) ( not ( = ?auto_56133 ?auto_56138 ) ) ( not ( = ?auto_56133 ?auto_56139 ) ) ( not ( = ?auto_56133 ?auto_56140 ) ) ( not ( = ?auto_56134 ?auto_56135 ) ) ( not ( = ?auto_56134 ?auto_56136 ) ) ( not ( = ?auto_56134 ?auto_56137 ) ) ( not ( = ?auto_56134 ?auto_56138 ) ) ( not ( = ?auto_56134 ?auto_56139 ) ) ( not ( = ?auto_56134 ?auto_56140 ) ) ( not ( = ?auto_56135 ?auto_56136 ) ) ( not ( = ?auto_56135 ?auto_56137 ) ) ( not ( = ?auto_56135 ?auto_56138 ) ) ( not ( = ?auto_56135 ?auto_56139 ) ) ( not ( = ?auto_56135 ?auto_56140 ) ) ( not ( = ?auto_56136 ?auto_56137 ) ) ( not ( = ?auto_56136 ?auto_56138 ) ) ( not ( = ?auto_56136 ?auto_56139 ) ) ( not ( = ?auto_56136 ?auto_56140 ) ) ( not ( = ?auto_56137 ?auto_56138 ) ) ( not ( = ?auto_56137 ?auto_56139 ) ) ( not ( = ?auto_56137 ?auto_56140 ) ) ( not ( = ?auto_56138 ?auto_56139 ) ) ( not ( = ?auto_56138 ?auto_56140 ) ) ( not ( = ?auto_56139 ?auto_56140 ) ) ( ON ?auto_56139 ?auto_56140 ) ( ON ?auto_56138 ?auto_56139 ) ( ON ?auto_56137 ?auto_56138 ) ( ON ?auto_56136 ?auto_56137 ) ( ON ?auto_56135 ?auto_56136 ) ( ON ?auto_56134 ?auto_56135 ) ( ON ?auto_56133 ?auto_56134 ) ( ON ?auto_56132 ?auto_56133 ) ( CLEAR ?auto_56132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56132 )
      ( MAKE-9PILE ?auto_56132 ?auto_56133 ?auto_56134 ?auto_56135 ?auto_56136 ?auto_56137 ?auto_56138 ?auto_56139 ?auto_56140 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_56150 - BLOCK
      ?auto_56151 - BLOCK
      ?auto_56152 - BLOCK
      ?auto_56153 - BLOCK
      ?auto_56154 - BLOCK
      ?auto_56155 - BLOCK
      ?auto_56156 - BLOCK
      ?auto_56157 - BLOCK
      ?auto_56158 - BLOCK
    )
    :vars
    (
      ?auto_56159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_56150 ?auto_56151 ) ) ( not ( = ?auto_56150 ?auto_56152 ) ) ( not ( = ?auto_56150 ?auto_56153 ) ) ( not ( = ?auto_56150 ?auto_56154 ) ) ( not ( = ?auto_56150 ?auto_56155 ) ) ( not ( = ?auto_56150 ?auto_56156 ) ) ( not ( = ?auto_56150 ?auto_56157 ) ) ( not ( = ?auto_56150 ?auto_56158 ) ) ( not ( = ?auto_56151 ?auto_56152 ) ) ( not ( = ?auto_56151 ?auto_56153 ) ) ( not ( = ?auto_56151 ?auto_56154 ) ) ( not ( = ?auto_56151 ?auto_56155 ) ) ( not ( = ?auto_56151 ?auto_56156 ) ) ( not ( = ?auto_56151 ?auto_56157 ) ) ( not ( = ?auto_56151 ?auto_56158 ) ) ( not ( = ?auto_56152 ?auto_56153 ) ) ( not ( = ?auto_56152 ?auto_56154 ) ) ( not ( = ?auto_56152 ?auto_56155 ) ) ( not ( = ?auto_56152 ?auto_56156 ) ) ( not ( = ?auto_56152 ?auto_56157 ) ) ( not ( = ?auto_56152 ?auto_56158 ) ) ( not ( = ?auto_56153 ?auto_56154 ) ) ( not ( = ?auto_56153 ?auto_56155 ) ) ( not ( = ?auto_56153 ?auto_56156 ) ) ( not ( = ?auto_56153 ?auto_56157 ) ) ( not ( = ?auto_56153 ?auto_56158 ) ) ( not ( = ?auto_56154 ?auto_56155 ) ) ( not ( = ?auto_56154 ?auto_56156 ) ) ( not ( = ?auto_56154 ?auto_56157 ) ) ( not ( = ?auto_56154 ?auto_56158 ) ) ( not ( = ?auto_56155 ?auto_56156 ) ) ( not ( = ?auto_56155 ?auto_56157 ) ) ( not ( = ?auto_56155 ?auto_56158 ) ) ( not ( = ?auto_56156 ?auto_56157 ) ) ( not ( = ?auto_56156 ?auto_56158 ) ) ( not ( = ?auto_56157 ?auto_56158 ) ) ( ON ?auto_56150 ?auto_56159 ) ( not ( = ?auto_56158 ?auto_56159 ) ) ( not ( = ?auto_56157 ?auto_56159 ) ) ( not ( = ?auto_56156 ?auto_56159 ) ) ( not ( = ?auto_56155 ?auto_56159 ) ) ( not ( = ?auto_56154 ?auto_56159 ) ) ( not ( = ?auto_56153 ?auto_56159 ) ) ( not ( = ?auto_56152 ?auto_56159 ) ) ( not ( = ?auto_56151 ?auto_56159 ) ) ( not ( = ?auto_56150 ?auto_56159 ) ) ( ON ?auto_56151 ?auto_56150 ) ( ON ?auto_56152 ?auto_56151 ) ( ON ?auto_56153 ?auto_56152 ) ( ON ?auto_56154 ?auto_56153 ) ( ON ?auto_56155 ?auto_56154 ) ( ON ?auto_56156 ?auto_56155 ) ( ON ?auto_56157 ?auto_56156 ) ( ON ?auto_56158 ?auto_56157 ) ( CLEAR ?auto_56158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_56158 ?auto_56157 ?auto_56156 ?auto_56155 ?auto_56154 ?auto_56153 ?auto_56152 ?auto_56151 ?auto_56150 )
      ( MAKE-9PILE ?auto_56150 ?auto_56151 ?auto_56152 ?auto_56153 ?auto_56154 ?auto_56155 ?auto_56156 ?auto_56157 ?auto_56158 ) )
  )

)

