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
      ?auto_131892 - BLOCK
      ?auto_131893 - BLOCK
      ?auto_131894 - BLOCK
      ?auto_131895 - BLOCK
      ?auto_131896 - BLOCK
      ?auto_131897 - BLOCK
      ?auto_131898 - BLOCK
      ?auto_131899 - BLOCK
    )
    :vars
    (
      ?auto_131900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131900 ?auto_131899 ) ( CLEAR ?auto_131900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131892 ) ( ON ?auto_131893 ?auto_131892 ) ( ON ?auto_131894 ?auto_131893 ) ( ON ?auto_131895 ?auto_131894 ) ( ON ?auto_131896 ?auto_131895 ) ( ON ?auto_131897 ?auto_131896 ) ( ON ?auto_131898 ?auto_131897 ) ( ON ?auto_131899 ?auto_131898 ) ( not ( = ?auto_131892 ?auto_131893 ) ) ( not ( = ?auto_131892 ?auto_131894 ) ) ( not ( = ?auto_131892 ?auto_131895 ) ) ( not ( = ?auto_131892 ?auto_131896 ) ) ( not ( = ?auto_131892 ?auto_131897 ) ) ( not ( = ?auto_131892 ?auto_131898 ) ) ( not ( = ?auto_131892 ?auto_131899 ) ) ( not ( = ?auto_131892 ?auto_131900 ) ) ( not ( = ?auto_131893 ?auto_131894 ) ) ( not ( = ?auto_131893 ?auto_131895 ) ) ( not ( = ?auto_131893 ?auto_131896 ) ) ( not ( = ?auto_131893 ?auto_131897 ) ) ( not ( = ?auto_131893 ?auto_131898 ) ) ( not ( = ?auto_131893 ?auto_131899 ) ) ( not ( = ?auto_131893 ?auto_131900 ) ) ( not ( = ?auto_131894 ?auto_131895 ) ) ( not ( = ?auto_131894 ?auto_131896 ) ) ( not ( = ?auto_131894 ?auto_131897 ) ) ( not ( = ?auto_131894 ?auto_131898 ) ) ( not ( = ?auto_131894 ?auto_131899 ) ) ( not ( = ?auto_131894 ?auto_131900 ) ) ( not ( = ?auto_131895 ?auto_131896 ) ) ( not ( = ?auto_131895 ?auto_131897 ) ) ( not ( = ?auto_131895 ?auto_131898 ) ) ( not ( = ?auto_131895 ?auto_131899 ) ) ( not ( = ?auto_131895 ?auto_131900 ) ) ( not ( = ?auto_131896 ?auto_131897 ) ) ( not ( = ?auto_131896 ?auto_131898 ) ) ( not ( = ?auto_131896 ?auto_131899 ) ) ( not ( = ?auto_131896 ?auto_131900 ) ) ( not ( = ?auto_131897 ?auto_131898 ) ) ( not ( = ?auto_131897 ?auto_131899 ) ) ( not ( = ?auto_131897 ?auto_131900 ) ) ( not ( = ?auto_131898 ?auto_131899 ) ) ( not ( = ?auto_131898 ?auto_131900 ) ) ( not ( = ?auto_131899 ?auto_131900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131900 ?auto_131899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_131902 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_131902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_131903 - BLOCK
    )
    :vars
    (
      ?auto_131904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131903 ?auto_131904 ) ( CLEAR ?auto_131903 ) ( HAND-EMPTY ) ( not ( = ?auto_131903 ?auto_131904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131903 ?auto_131904 )
      ( MAKE-1PILE ?auto_131903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131912 - BLOCK
      ?auto_131913 - BLOCK
      ?auto_131914 - BLOCK
      ?auto_131915 - BLOCK
      ?auto_131916 - BLOCK
      ?auto_131917 - BLOCK
      ?auto_131918 - BLOCK
    )
    :vars
    (
      ?auto_131919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131919 ?auto_131918 ) ( CLEAR ?auto_131919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131912 ) ( ON ?auto_131913 ?auto_131912 ) ( ON ?auto_131914 ?auto_131913 ) ( ON ?auto_131915 ?auto_131914 ) ( ON ?auto_131916 ?auto_131915 ) ( ON ?auto_131917 ?auto_131916 ) ( ON ?auto_131918 ?auto_131917 ) ( not ( = ?auto_131912 ?auto_131913 ) ) ( not ( = ?auto_131912 ?auto_131914 ) ) ( not ( = ?auto_131912 ?auto_131915 ) ) ( not ( = ?auto_131912 ?auto_131916 ) ) ( not ( = ?auto_131912 ?auto_131917 ) ) ( not ( = ?auto_131912 ?auto_131918 ) ) ( not ( = ?auto_131912 ?auto_131919 ) ) ( not ( = ?auto_131913 ?auto_131914 ) ) ( not ( = ?auto_131913 ?auto_131915 ) ) ( not ( = ?auto_131913 ?auto_131916 ) ) ( not ( = ?auto_131913 ?auto_131917 ) ) ( not ( = ?auto_131913 ?auto_131918 ) ) ( not ( = ?auto_131913 ?auto_131919 ) ) ( not ( = ?auto_131914 ?auto_131915 ) ) ( not ( = ?auto_131914 ?auto_131916 ) ) ( not ( = ?auto_131914 ?auto_131917 ) ) ( not ( = ?auto_131914 ?auto_131918 ) ) ( not ( = ?auto_131914 ?auto_131919 ) ) ( not ( = ?auto_131915 ?auto_131916 ) ) ( not ( = ?auto_131915 ?auto_131917 ) ) ( not ( = ?auto_131915 ?auto_131918 ) ) ( not ( = ?auto_131915 ?auto_131919 ) ) ( not ( = ?auto_131916 ?auto_131917 ) ) ( not ( = ?auto_131916 ?auto_131918 ) ) ( not ( = ?auto_131916 ?auto_131919 ) ) ( not ( = ?auto_131917 ?auto_131918 ) ) ( not ( = ?auto_131917 ?auto_131919 ) ) ( not ( = ?auto_131918 ?auto_131919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131919 ?auto_131918 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131920 - BLOCK
      ?auto_131921 - BLOCK
      ?auto_131922 - BLOCK
      ?auto_131923 - BLOCK
      ?auto_131924 - BLOCK
      ?auto_131925 - BLOCK
      ?auto_131926 - BLOCK
    )
    :vars
    (
      ?auto_131927 - BLOCK
      ?auto_131928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131927 ?auto_131926 ) ( CLEAR ?auto_131927 ) ( ON-TABLE ?auto_131920 ) ( ON ?auto_131921 ?auto_131920 ) ( ON ?auto_131922 ?auto_131921 ) ( ON ?auto_131923 ?auto_131922 ) ( ON ?auto_131924 ?auto_131923 ) ( ON ?auto_131925 ?auto_131924 ) ( ON ?auto_131926 ?auto_131925 ) ( not ( = ?auto_131920 ?auto_131921 ) ) ( not ( = ?auto_131920 ?auto_131922 ) ) ( not ( = ?auto_131920 ?auto_131923 ) ) ( not ( = ?auto_131920 ?auto_131924 ) ) ( not ( = ?auto_131920 ?auto_131925 ) ) ( not ( = ?auto_131920 ?auto_131926 ) ) ( not ( = ?auto_131920 ?auto_131927 ) ) ( not ( = ?auto_131921 ?auto_131922 ) ) ( not ( = ?auto_131921 ?auto_131923 ) ) ( not ( = ?auto_131921 ?auto_131924 ) ) ( not ( = ?auto_131921 ?auto_131925 ) ) ( not ( = ?auto_131921 ?auto_131926 ) ) ( not ( = ?auto_131921 ?auto_131927 ) ) ( not ( = ?auto_131922 ?auto_131923 ) ) ( not ( = ?auto_131922 ?auto_131924 ) ) ( not ( = ?auto_131922 ?auto_131925 ) ) ( not ( = ?auto_131922 ?auto_131926 ) ) ( not ( = ?auto_131922 ?auto_131927 ) ) ( not ( = ?auto_131923 ?auto_131924 ) ) ( not ( = ?auto_131923 ?auto_131925 ) ) ( not ( = ?auto_131923 ?auto_131926 ) ) ( not ( = ?auto_131923 ?auto_131927 ) ) ( not ( = ?auto_131924 ?auto_131925 ) ) ( not ( = ?auto_131924 ?auto_131926 ) ) ( not ( = ?auto_131924 ?auto_131927 ) ) ( not ( = ?auto_131925 ?auto_131926 ) ) ( not ( = ?auto_131925 ?auto_131927 ) ) ( not ( = ?auto_131926 ?auto_131927 ) ) ( HOLDING ?auto_131928 ) ( not ( = ?auto_131920 ?auto_131928 ) ) ( not ( = ?auto_131921 ?auto_131928 ) ) ( not ( = ?auto_131922 ?auto_131928 ) ) ( not ( = ?auto_131923 ?auto_131928 ) ) ( not ( = ?auto_131924 ?auto_131928 ) ) ( not ( = ?auto_131925 ?auto_131928 ) ) ( not ( = ?auto_131926 ?auto_131928 ) ) ( not ( = ?auto_131927 ?auto_131928 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_131928 )
      ( MAKE-7PILE ?auto_131920 ?auto_131921 ?auto_131922 ?auto_131923 ?auto_131924 ?auto_131925 ?auto_131926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_131929 - BLOCK
      ?auto_131930 - BLOCK
      ?auto_131931 - BLOCK
      ?auto_131932 - BLOCK
      ?auto_131933 - BLOCK
      ?auto_131934 - BLOCK
      ?auto_131935 - BLOCK
    )
    :vars
    (
      ?auto_131936 - BLOCK
      ?auto_131937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131936 ?auto_131935 ) ( ON-TABLE ?auto_131929 ) ( ON ?auto_131930 ?auto_131929 ) ( ON ?auto_131931 ?auto_131930 ) ( ON ?auto_131932 ?auto_131931 ) ( ON ?auto_131933 ?auto_131932 ) ( ON ?auto_131934 ?auto_131933 ) ( ON ?auto_131935 ?auto_131934 ) ( not ( = ?auto_131929 ?auto_131930 ) ) ( not ( = ?auto_131929 ?auto_131931 ) ) ( not ( = ?auto_131929 ?auto_131932 ) ) ( not ( = ?auto_131929 ?auto_131933 ) ) ( not ( = ?auto_131929 ?auto_131934 ) ) ( not ( = ?auto_131929 ?auto_131935 ) ) ( not ( = ?auto_131929 ?auto_131936 ) ) ( not ( = ?auto_131930 ?auto_131931 ) ) ( not ( = ?auto_131930 ?auto_131932 ) ) ( not ( = ?auto_131930 ?auto_131933 ) ) ( not ( = ?auto_131930 ?auto_131934 ) ) ( not ( = ?auto_131930 ?auto_131935 ) ) ( not ( = ?auto_131930 ?auto_131936 ) ) ( not ( = ?auto_131931 ?auto_131932 ) ) ( not ( = ?auto_131931 ?auto_131933 ) ) ( not ( = ?auto_131931 ?auto_131934 ) ) ( not ( = ?auto_131931 ?auto_131935 ) ) ( not ( = ?auto_131931 ?auto_131936 ) ) ( not ( = ?auto_131932 ?auto_131933 ) ) ( not ( = ?auto_131932 ?auto_131934 ) ) ( not ( = ?auto_131932 ?auto_131935 ) ) ( not ( = ?auto_131932 ?auto_131936 ) ) ( not ( = ?auto_131933 ?auto_131934 ) ) ( not ( = ?auto_131933 ?auto_131935 ) ) ( not ( = ?auto_131933 ?auto_131936 ) ) ( not ( = ?auto_131934 ?auto_131935 ) ) ( not ( = ?auto_131934 ?auto_131936 ) ) ( not ( = ?auto_131935 ?auto_131936 ) ) ( not ( = ?auto_131929 ?auto_131937 ) ) ( not ( = ?auto_131930 ?auto_131937 ) ) ( not ( = ?auto_131931 ?auto_131937 ) ) ( not ( = ?auto_131932 ?auto_131937 ) ) ( not ( = ?auto_131933 ?auto_131937 ) ) ( not ( = ?auto_131934 ?auto_131937 ) ) ( not ( = ?auto_131935 ?auto_131937 ) ) ( not ( = ?auto_131936 ?auto_131937 ) ) ( ON ?auto_131937 ?auto_131936 ) ( CLEAR ?auto_131937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131929 ?auto_131930 ?auto_131931 ?auto_131932 ?auto_131933 ?auto_131934 ?auto_131935 ?auto_131936 )
      ( MAKE-7PILE ?auto_131929 ?auto_131930 ?auto_131931 ?auto_131932 ?auto_131933 ?auto_131934 ?auto_131935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131940 - BLOCK
      ?auto_131941 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_131941 ) ( CLEAR ?auto_131940 ) ( ON-TABLE ?auto_131940 ) ( not ( = ?auto_131940 ?auto_131941 ) ) )
    :subtasks
    ( ( !STACK ?auto_131941 ?auto_131940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131942 - BLOCK
      ?auto_131943 - BLOCK
    )
    :vars
    (
      ?auto_131944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_131942 ) ( ON-TABLE ?auto_131942 ) ( not ( = ?auto_131942 ?auto_131943 ) ) ( ON ?auto_131943 ?auto_131944 ) ( CLEAR ?auto_131943 ) ( HAND-EMPTY ) ( not ( = ?auto_131942 ?auto_131944 ) ) ( not ( = ?auto_131943 ?auto_131944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131943 ?auto_131944 )
      ( MAKE-2PILE ?auto_131942 ?auto_131943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131945 - BLOCK
      ?auto_131946 - BLOCK
    )
    :vars
    (
      ?auto_131947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131945 ?auto_131946 ) ) ( ON ?auto_131946 ?auto_131947 ) ( CLEAR ?auto_131946 ) ( not ( = ?auto_131945 ?auto_131947 ) ) ( not ( = ?auto_131946 ?auto_131947 ) ) ( HOLDING ?auto_131945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131945 )
      ( MAKE-2PILE ?auto_131945 ?auto_131946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_131948 - BLOCK
      ?auto_131949 - BLOCK
    )
    :vars
    (
      ?auto_131950 - BLOCK
      ?auto_131953 - BLOCK
      ?auto_131954 - BLOCK
      ?auto_131952 - BLOCK
      ?auto_131955 - BLOCK
      ?auto_131951 - BLOCK
      ?auto_131956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_131948 ?auto_131949 ) ) ( ON ?auto_131949 ?auto_131950 ) ( not ( = ?auto_131948 ?auto_131950 ) ) ( not ( = ?auto_131949 ?auto_131950 ) ) ( ON ?auto_131948 ?auto_131949 ) ( CLEAR ?auto_131948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131953 ) ( ON ?auto_131954 ?auto_131953 ) ( ON ?auto_131952 ?auto_131954 ) ( ON ?auto_131955 ?auto_131952 ) ( ON ?auto_131951 ?auto_131955 ) ( ON ?auto_131956 ?auto_131951 ) ( ON ?auto_131950 ?auto_131956 ) ( not ( = ?auto_131953 ?auto_131954 ) ) ( not ( = ?auto_131953 ?auto_131952 ) ) ( not ( = ?auto_131953 ?auto_131955 ) ) ( not ( = ?auto_131953 ?auto_131951 ) ) ( not ( = ?auto_131953 ?auto_131956 ) ) ( not ( = ?auto_131953 ?auto_131950 ) ) ( not ( = ?auto_131953 ?auto_131949 ) ) ( not ( = ?auto_131953 ?auto_131948 ) ) ( not ( = ?auto_131954 ?auto_131952 ) ) ( not ( = ?auto_131954 ?auto_131955 ) ) ( not ( = ?auto_131954 ?auto_131951 ) ) ( not ( = ?auto_131954 ?auto_131956 ) ) ( not ( = ?auto_131954 ?auto_131950 ) ) ( not ( = ?auto_131954 ?auto_131949 ) ) ( not ( = ?auto_131954 ?auto_131948 ) ) ( not ( = ?auto_131952 ?auto_131955 ) ) ( not ( = ?auto_131952 ?auto_131951 ) ) ( not ( = ?auto_131952 ?auto_131956 ) ) ( not ( = ?auto_131952 ?auto_131950 ) ) ( not ( = ?auto_131952 ?auto_131949 ) ) ( not ( = ?auto_131952 ?auto_131948 ) ) ( not ( = ?auto_131955 ?auto_131951 ) ) ( not ( = ?auto_131955 ?auto_131956 ) ) ( not ( = ?auto_131955 ?auto_131950 ) ) ( not ( = ?auto_131955 ?auto_131949 ) ) ( not ( = ?auto_131955 ?auto_131948 ) ) ( not ( = ?auto_131951 ?auto_131956 ) ) ( not ( = ?auto_131951 ?auto_131950 ) ) ( not ( = ?auto_131951 ?auto_131949 ) ) ( not ( = ?auto_131951 ?auto_131948 ) ) ( not ( = ?auto_131956 ?auto_131950 ) ) ( not ( = ?auto_131956 ?auto_131949 ) ) ( not ( = ?auto_131956 ?auto_131948 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131953 ?auto_131954 ?auto_131952 ?auto_131955 ?auto_131951 ?auto_131956 ?auto_131950 ?auto_131949 )
      ( MAKE-2PILE ?auto_131948 ?auto_131949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131963 - BLOCK
      ?auto_131964 - BLOCK
      ?auto_131965 - BLOCK
      ?auto_131966 - BLOCK
      ?auto_131967 - BLOCK
      ?auto_131968 - BLOCK
    )
    :vars
    (
      ?auto_131969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131969 ?auto_131968 ) ( CLEAR ?auto_131969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_131963 ) ( ON ?auto_131964 ?auto_131963 ) ( ON ?auto_131965 ?auto_131964 ) ( ON ?auto_131966 ?auto_131965 ) ( ON ?auto_131967 ?auto_131966 ) ( ON ?auto_131968 ?auto_131967 ) ( not ( = ?auto_131963 ?auto_131964 ) ) ( not ( = ?auto_131963 ?auto_131965 ) ) ( not ( = ?auto_131963 ?auto_131966 ) ) ( not ( = ?auto_131963 ?auto_131967 ) ) ( not ( = ?auto_131963 ?auto_131968 ) ) ( not ( = ?auto_131963 ?auto_131969 ) ) ( not ( = ?auto_131964 ?auto_131965 ) ) ( not ( = ?auto_131964 ?auto_131966 ) ) ( not ( = ?auto_131964 ?auto_131967 ) ) ( not ( = ?auto_131964 ?auto_131968 ) ) ( not ( = ?auto_131964 ?auto_131969 ) ) ( not ( = ?auto_131965 ?auto_131966 ) ) ( not ( = ?auto_131965 ?auto_131967 ) ) ( not ( = ?auto_131965 ?auto_131968 ) ) ( not ( = ?auto_131965 ?auto_131969 ) ) ( not ( = ?auto_131966 ?auto_131967 ) ) ( not ( = ?auto_131966 ?auto_131968 ) ) ( not ( = ?auto_131966 ?auto_131969 ) ) ( not ( = ?auto_131967 ?auto_131968 ) ) ( not ( = ?auto_131967 ?auto_131969 ) ) ( not ( = ?auto_131968 ?auto_131969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_131969 ?auto_131968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131970 - BLOCK
      ?auto_131971 - BLOCK
      ?auto_131972 - BLOCK
      ?auto_131973 - BLOCK
      ?auto_131974 - BLOCK
      ?auto_131975 - BLOCK
    )
    :vars
    (
      ?auto_131976 - BLOCK
      ?auto_131977 - BLOCK
      ?auto_131978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131976 ?auto_131975 ) ( CLEAR ?auto_131976 ) ( ON-TABLE ?auto_131970 ) ( ON ?auto_131971 ?auto_131970 ) ( ON ?auto_131972 ?auto_131971 ) ( ON ?auto_131973 ?auto_131972 ) ( ON ?auto_131974 ?auto_131973 ) ( ON ?auto_131975 ?auto_131974 ) ( not ( = ?auto_131970 ?auto_131971 ) ) ( not ( = ?auto_131970 ?auto_131972 ) ) ( not ( = ?auto_131970 ?auto_131973 ) ) ( not ( = ?auto_131970 ?auto_131974 ) ) ( not ( = ?auto_131970 ?auto_131975 ) ) ( not ( = ?auto_131970 ?auto_131976 ) ) ( not ( = ?auto_131971 ?auto_131972 ) ) ( not ( = ?auto_131971 ?auto_131973 ) ) ( not ( = ?auto_131971 ?auto_131974 ) ) ( not ( = ?auto_131971 ?auto_131975 ) ) ( not ( = ?auto_131971 ?auto_131976 ) ) ( not ( = ?auto_131972 ?auto_131973 ) ) ( not ( = ?auto_131972 ?auto_131974 ) ) ( not ( = ?auto_131972 ?auto_131975 ) ) ( not ( = ?auto_131972 ?auto_131976 ) ) ( not ( = ?auto_131973 ?auto_131974 ) ) ( not ( = ?auto_131973 ?auto_131975 ) ) ( not ( = ?auto_131973 ?auto_131976 ) ) ( not ( = ?auto_131974 ?auto_131975 ) ) ( not ( = ?auto_131974 ?auto_131976 ) ) ( not ( = ?auto_131975 ?auto_131976 ) ) ( HOLDING ?auto_131977 ) ( CLEAR ?auto_131978 ) ( not ( = ?auto_131970 ?auto_131977 ) ) ( not ( = ?auto_131970 ?auto_131978 ) ) ( not ( = ?auto_131971 ?auto_131977 ) ) ( not ( = ?auto_131971 ?auto_131978 ) ) ( not ( = ?auto_131972 ?auto_131977 ) ) ( not ( = ?auto_131972 ?auto_131978 ) ) ( not ( = ?auto_131973 ?auto_131977 ) ) ( not ( = ?auto_131973 ?auto_131978 ) ) ( not ( = ?auto_131974 ?auto_131977 ) ) ( not ( = ?auto_131974 ?auto_131978 ) ) ( not ( = ?auto_131975 ?auto_131977 ) ) ( not ( = ?auto_131975 ?auto_131978 ) ) ( not ( = ?auto_131976 ?auto_131977 ) ) ( not ( = ?auto_131976 ?auto_131978 ) ) ( not ( = ?auto_131977 ?auto_131978 ) ) )
    :subtasks
    ( ( !STACK ?auto_131977 ?auto_131978 )
      ( MAKE-6PILE ?auto_131970 ?auto_131971 ?auto_131972 ?auto_131973 ?auto_131974 ?auto_131975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133310 - BLOCK
      ?auto_133311 - BLOCK
      ?auto_133312 - BLOCK
      ?auto_133313 - BLOCK
      ?auto_133314 - BLOCK
      ?auto_133315 - BLOCK
    )
    :vars
    (
      ?auto_133316 - BLOCK
      ?auto_133317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133316 ?auto_133315 ) ( ON-TABLE ?auto_133310 ) ( ON ?auto_133311 ?auto_133310 ) ( ON ?auto_133312 ?auto_133311 ) ( ON ?auto_133313 ?auto_133312 ) ( ON ?auto_133314 ?auto_133313 ) ( ON ?auto_133315 ?auto_133314 ) ( not ( = ?auto_133310 ?auto_133311 ) ) ( not ( = ?auto_133310 ?auto_133312 ) ) ( not ( = ?auto_133310 ?auto_133313 ) ) ( not ( = ?auto_133310 ?auto_133314 ) ) ( not ( = ?auto_133310 ?auto_133315 ) ) ( not ( = ?auto_133310 ?auto_133316 ) ) ( not ( = ?auto_133311 ?auto_133312 ) ) ( not ( = ?auto_133311 ?auto_133313 ) ) ( not ( = ?auto_133311 ?auto_133314 ) ) ( not ( = ?auto_133311 ?auto_133315 ) ) ( not ( = ?auto_133311 ?auto_133316 ) ) ( not ( = ?auto_133312 ?auto_133313 ) ) ( not ( = ?auto_133312 ?auto_133314 ) ) ( not ( = ?auto_133312 ?auto_133315 ) ) ( not ( = ?auto_133312 ?auto_133316 ) ) ( not ( = ?auto_133313 ?auto_133314 ) ) ( not ( = ?auto_133313 ?auto_133315 ) ) ( not ( = ?auto_133313 ?auto_133316 ) ) ( not ( = ?auto_133314 ?auto_133315 ) ) ( not ( = ?auto_133314 ?auto_133316 ) ) ( not ( = ?auto_133315 ?auto_133316 ) ) ( not ( = ?auto_133310 ?auto_133317 ) ) ( not ( = ?auto_133311 ?auto_133317 ) ) ( not ( = ?auto_133312 ?auto_133317 ) ) ( not ( = ?auto_133313 ?auto_133317 ) ) ( not ( = ?auto_133314 ?auto_133317 ) ) ( not ( = ?auto_133315 ?auto_133317 ) ) ( not ( = ?auto_133316 ?auto_133317 ) ) ( ON ?auto_133317 ?auto_133316 ) ( CLEAR ?auto_133317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133310 ?auto_133311 ?auto_133312 ?auto_133313 ?auto_133314 ?auto_133315 ?auto_133316 )
      ( MAKE-6PILE ?auto_133310 ?auto_133311 ?auto_133312 ?auto_133313 ?auto_133314 ?auto_133315 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131988 - BLOCK
      ?auto_131989 - BLOCK
      ?auto_131990 - BLOCK
      ?auto_131991 - BLOCK
      ?auto_131992 - BLOCK
      ?auto_131993 - BLOCK
    )
    :vars
    (
      ?auto_131994 - BLOCK
      ?auto_131996 - BLOCK
      ?auto_131995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_131994 ?auto_131993 ) ( ON-TABLE ?auto_131988 ) ( ON ?auto_131989 ?auto_131988 ) ( ON ?auto_131990 ?auto_131989 ) ( ON ?auto_131991 ?auto_131990 ) ( ON ?auto_131992 ?auto_131991 ) ( ON ?auto_131993 ?auto_131992 ) ( not ( = ?auto_131988 ?auto_131989 ) ) ( not ( = ?auto_131988 ?auto_131990 ) ) ( not ( = ?auto_131988 ?auto_131991 ) ) ( not ( = ?auto_131988 ?auto_131992 ) ) ( not ( = ?auto_131988 ?auto_131993 ) ) ( not ( = ?auto_131988 ?auto_131994 ) ) ( not ( = ?auto_131989 ?auto_131990 ) ) ( not ( = ?auto_131989 ?auto_131991 ) ) ( not ( = ?auto_131989 ?auto_131992 ) ) ( not ( = ?auto_131989 ?auto_131993 ) ) ( not ( = ?auto_131989 ?auto_131994 ) ) ( not ( = ?auto_131990 ?auto_131991 ) ) ( not ( = ?auto_131990 ?auto_131992 ) ) ( not ( = ?auto_131990 ?auto_131993 ) ) ( not ( = ?auto_131990 ?auto_131994 ) ) ( not ( = ?auto_131991 ?auto_131992 ) ) ( not ( = ?auto_131991 ?auto_131993 ) ) ( not ( = ?auto_131991 ?auto_131994 ) ) ( not ( = ?auto_131992 ?auto_131993 ) ) ( not ( = ?auto_131992 ?auto_131994 ) ) ( not ( = ?auto_131993 ?auto_131994 ) ) ( not ( = ?auto_131988 ?auto_131996 ) ) ( not ( = ?auto_131988 ?auto_131995 ) ) ( not ( = ?auto_131989 ?auto_131996 ) ) ( not ( = ?auto_131989 ?auto_131995 ) ) ( not ( = ?auto_131990 ?auto_131996 ) ) ( not ( = ?auto_131990 ?auto_131995 ) ) ( not ( = ?auto_131991 ?auto_131996 ) ) ( not ( = ?auto_131991 ?auto_131995 ) ) ( not ( = ?auto_131992 ?auto_131996 ) ) ( not ( = ?auto_131992 ?auto_131995 ) ) ( not ( = ?auto_131993 ?auto_131996 ) ) ( not ( = ?auto_131993 ?auto_131995 ) ) ( not ( = ?auto_131994 ?auto_131996 ) ) ( not ( = ?auto_131994 ?auto_131995 ) ) ( not ( = ?auto_131996 ?auto_131995 ) ) ( ON ?auto_131996 ?auto_131994 ) ( CLEAR ?auto_131996 ) ( HOLDING ?auto_131995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_131995 )
      ( MAKE-6PILE ?auto_131988 ?auto_131989 ?auto_131990 ?auto_131991 ?auto_131992 ?auto_131993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_131997 - BLOCK
      ?auto_131998 - BLOCK
      ?auto_131999 - BLOCK
      ?auto_132000 - BLOCK
      ?auto_132001 - BLOCK
      ?auto_132002 - BLOCK
    )
    :vars
    (
      ?auto_132003 - BLOCK
      ?auto_132005 - BLOCK
      ?auto_132004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132003 ?auto_132002 ) ( ON-TABLE ?auto_131997 ) ( ON ?auto_131998 ?auto_131997 ) ( ON ?auto_131999 ?auto_131998 ) ( ON ?auto_132000 ?auto_131999 ) ( ON ?auto_132001 ?auto_132000 ) ( ON ?auto_132002 ?auto_132001 ) ( not ( = ?auto_131997 ?auto_131998 ) ) ( not ( = ?auto_131997 ?auto_131999 ) ) ( not ( = ?auto_131997 ?auto_132000 ) ) ( not ( = ?auto_131997 ?auto_132001 ) ) ( not ( = ?auto_131997 ?auto_132002 ) ) ( not ( = ?auto_131997 ?auto_132003 ) ) ( not ( = ?auto_131998 ?auto_131999 ) ) ( not ( = ?auto_131998 ?auto_132000 ) ) ( not ( = ?auto_131998 ?auto_132001 ) ) ( not ( = ?auto_131998 ?auto_132002 ) ) ( not ( = ?auto_131998 ?auto_132003 ) ) ( not ( = ?auto_131999 ?auto_132000 ) ) ( not ( = ?auto_131999 ?auto_132001 ) ) ( not ( = ?auto_131999 ?auto_132002 ) ) ( not ( = ?auto_131999 ?auto_132003 ) ) ( not ( = ?auto_132000 ?auto_132001 ) ) ( not ( = ?auto_132000 ?auto_132002 ) ) ( not ( = ?auto_132000 ?auto_132003 ) ) ( not ( = ?auto_132001 ?auto_132002 ) ) ( not ( = ?auto_132001 ?auto_132003 ) ) ( not ( = ?auto_132002 ?auto_132003 ) ) ( not ( = ?auto_131997 ?auto_132005 ) ) ( not ( = ?auto_131997 ?auto_132004 ) ) ( not ( = ?auto_131998 ?auto_132005 ) ) ( not ( = ?auto_131998 ?auto_132004 ) ) ( not ( = ?auto_131999 ?auto_132005 ) ) ( not ( = ?auto_131999 ?auto_132004 ) ) ( not ( = ?auto_132000 ?auto_132005 ) ) ( not ( = ?auto_132000 ?auto_132004 ) ) ( not ( = ?auto_132001 ?auto_132005 ) ) ( not ( = ?auto_132001 ?auto_132004 ) ) ( not ( = ?auto_132002 ?auto_132005 ) ) ( not ( = ?auto_132002 ?auto_132004 ) ) ( not ( = ?auto_132003 ?auto_132005 ) ) ( not ( = ?auto_132003 ?auto_132004 ) ) ( not ( = ?auto_132005 ?auto_132004 ) ) ( ON ?auto_132005 ?auto_132003 ) ( ON ?auto_132004 ?auto_132005 ) ( CLEAR ?auto_132004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_131997 ?auto_131998 ?auto_131999 ?auto_132000 ?auto_132001 ?auto_132002 ?auto_132003 ?auto_132005 )
      ( MAKE-6PILE ?auto_131997 ?auto_131998 ?auto_131999 ?auto_132000 ?auto_132001 ?auto_132002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132009 - BLOCK
      ?auto_132010 - BLOCK
      ?auto_132011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132011 ) ( CLEAR ?auto_132010 ) ( ON-TABLE ?auto_132009 ) ( ON ?auto_132010 ?auto_132009 ) ( not ( = ?auto_132009 ?auto_132010 ) ) ( not ( = ?auto_132009 ?auto_132011 ) ) ( not ( = ?auto_132010 ?auto_132011 ) ) )
    :subtasks
    ( ( !STACK ?auto_132011 ?auto_132010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132012 - BLOCK
      ?auto_132013 - BLOCK
      ?auto_132014 - BLOCK
    )
    :vars
    (
      ?auto_132015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132013 ) ( ON-TABLE ?auto_132012 ) ( ON ?auto_132013 ?auto_132012 ) ( not ( = ?auto_132012 ?auto_132013 ) ) ( not ( = ?auto_132012 ?auto_132014 ) ) ( not ( = ?auto_132013 ?auto_132014 ) ) ( ON ?auto_132014 ?auto_132015 ) ( CLEAR ?auto_132014 ) ( HAND-EMPTY ) ( not ( = ?auto_132012 ?auto_132015 ) ) ( not ( = ?auto_132013 ?auto_132015 ) ) ( not ( = ?auto_132014 ?auto_132015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132014 ?auto_132015 )
      ( MAKE-3PILE ?auto_132012 ?auto_132013 ?auto_132014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132016 - BLOCK
      ?auto_132017 - BLOCK
      ?auto_132018 - BLOCK
    )
    :vars
    (
      ?auto_132019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132016 ) ( not ( = ?auto_132016 ?auto_132017 ) ) ( not ( = ?auto_132016 ?auto_132018 ) ) ( not ( = ?auto_132017 ?auto_132018 ) ) ( ON ?auto_132018 ?auto_132019 ) ( CLEAR ?auto_132018 ) ( not ( = ?auto_132016 ?auto_132019 ) ) ( not ( = ?auto_132017 ?auto_132019 ) ) ( not ( = ?auto_132018 ?auto_132019 ) ) ( HOLDING ?auto_132017 ) ( CLEAR ?auto_132016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132016 ?auto_132017 )
      ( MAKE-3PILE ?auto_132016 ?auto_132017 ?auto_132018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132020 - BLOCK
      ?auto_132021 - BLOCK
      ?auto_132022 - BLOCK
    )
    :vars
    (
      ?auto_132023 - BLOCK
      ?auto_132024 - BLOCK
      ?auto_132025 - BLOCK
      ?auto_132027 - BLOCK
      ?auto_132026 - BLOCK
      ?auto_132028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132020 ) ( not ( = ?auto_132020 ?auto_132021 ) ) ( not ( = ?auto_132020 ?auto_132022 ) ) ( not ( = ?auto_132021 ?auto_132022 ) ) ( ON ?auto_132022 ?auto_132023 ) ( not ( = ?auto_132020 ?auto_132023 ) ) ( not ( = ?auto_132021 ?auto_132023 ) ) ( not ( = ?auto_132022 ?auto_132023 ) ) ( CLEAR ?auto_132020 ) ( ON ?auto_132021 ?auto_132022 ) ( CLEAR ?auto_132021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132024 ) ( ON ?auto_132025 ?auto_132024 ) ( ON ?auto_132027 ?auto_132025 ) ( ON ?auto_132026 ?auto_132027 ) ( ON ?auto_132028 ?auto_132026 ) ( ON ?auto_132023 ?auto_132028 ) ( not ( = ?auto_132024 ?auto_132025 ) ) ( not ( = ?auto_132024 ?auto_132027 ) ) ( not ( = ?auto_132024 ?auto_132026 ) ) ( not ( = ?auto_132024 ?auto_132028 ) ) ( not ( = ?auto_132024 ?auto_132023 ) ) ( not ( = ?auto_132024 ?auto_132022 ) ) ( not ( = ?auto_132024 ?auto_132021 ) ) ( not ( = ?auto_132025 ?auto_132027 ) ) ( not ( = ?auto_132025 ?auto_132026 ) ) ( not ( = ?auto_132025 ?auto_132028 ) ) ( not ( = ?auto_132025 ?auto_132023 ) ) ( not ( = ?auto_132025 ?auto_132022 ) ) ( not ( = ?auto_132025 ?auto_132021 ) ) ( not ( = ?auto_132027 ?auto_132026 ) ) ( not ( = ?auto_132027 ?auto_132028 ) ) ( not ( = ?auto_132027 ?auto_132023 ) ) ( not ( = ?auto_132027 ?auto_132022 ) ) ( not ( = ?auto_132027 ?auto_132021 ) ) ( not ( = ?auto_132026 ?auto_132028 ) ) ( not ( = ?auto_132026 ?auto_132023 ) ) ( not ( = ?auto_132026 ?auto_132022 ) ) ( not ( = ?auto_132026 ?auto_132021 ) ) ( not ( = ?auto_132028 ?auto_132023 ) ) ( not ( = ?auto_132028 ?auto_132022 ) ) ( not ( = ?auto_132028 ?auto_132021 ) ) ( not ( = ?auto_132020 ?auto_132024 ) ) ( not ( = ?auto_132020 ?auto_132025 ) ) ( not ( = ?auto_132020 ?auto_132027 ) ) ( not ( = ?auto_132020 ?auto_132026 ) ) ( not ( = ?auto_132020 ?auto_132028 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132024 ?auto_132025 ?auto_132027 ?auto_132026 ?auto_132028 ?auto_132023 ?auto_132022 )
      ( MAKE-3PILE ?auto_132020 ?auto_132021 ?auto_132022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132029 - BLOCK
      ?auto_132030 - BLOCK
      ?auto_132031 - BLOCK
    )
    :vars
    (
      ?auto_132032 - BLOCK
      ?auto_132033 - BLOCK
      ?auto_132035 - BLOCK
      ?auto_132034 - BLOCK
      ?auto_132036 - BLOCK
      ?auto_132037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132029 ?auto_132030 ) ) ( not ( = ?auto_132029 ?auto_132031 ) ) ( not ( = ?auto_132030 ?auto_132031 ) ) ( ON ?auto_132031 ?auto_132032 ) ( not ( = ?auto_132029 ?auto_132032 ) ) ( not ( = ?auto_132030 ?auto_132032 ) ) ( not ( = ?auto_132031 ?auto_132032 ) ) ( ON ?auto_132030 ?auto_132031 ) ( CLEAR ?auto_132030 ) ( ON-TABLE ?auto_132033 ) ( ON ?auto_132035 ?auto_132033 ) ( ON ?auto_132034 ?auto_132035 ) ( ON ?auto_132036 ?auto_132034 ) ( ON ?auto_132037 ?auto_132036 ) ( ON ?auto_132032 ?auto_132037 ) ( not ( = ?auto_132033 ?auto_132035 ) ) ( not ( = ?auto_132033 ?auto_132034 ) ) ( not ( = ?auto_132033 ?auto_132036 ) ) ( not ( = ?auto_132033 ?auto_132037 ) ) ( not ( = ?auto_132033 ?auto_132032 ) ) ( not ( = ?auto_132033 ?auto_132031 ) ) ( not ( = ?auto_132033 ?auto_132030 ) ) ( not ( = ?auto_132035 ?auto_132034 ) ) ( not ( = ?auto_132035 ?auto_132036 ) ) ( not ( = ?auto_132035 ?auto_132037 ) ) ( not ( = ?auto_132035 ?auto_132032 ) ) ( not ( = ?auto_132035 ?auto_132031 ) ) ( not ( = ?auto_132035 ?auto_132030 ) ) ( not ( = ?auto_132034 ?auto_132036 ) ) ( not ( = ?auto_132034 ?auto_132037 ) ) ( not ( = ?auto_132034 ?auto_132032 ) ) ( not ( = ?auto_132034 ?auto_132031 ) ) ( not ( = ?auto_132034 ?auto_132030 ) ) ( not ( = ?auto_132036 ?auto_132037 ) ) ( not ( = ?auto_132036 ?auto_132032 ) ) ( not ( = ?auto_132036 ?auto_132031 ) ) ( not ( = ?auto_132036 ?auto_132030 ) ) ( not ( = ?auto_132037 ?auto_132032 ) ) ( not ( = ?auto_132037 ?auto_132031 ) ) ( not ( = ?auto_132037 ?auto_132030 ) ) ( not ( = ?auto_132029 ?auto_132033 ) ) ( not ( = ?auto_132029 ?auto_132035 ) ) ( not ( = ?auto_132029 ?auto_132034 ) ) ( not ( = ?auto_132029 ?auto_132036 ) ) ( not ( = ?auto_132029 ?auto_132037 ) ) ( HOLDING ?auto_132029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132029 )
      ( MAKE-3PILE ?auto_132029 ?auto_132030 ?auto_132031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132038 - BLOCK
      ?auto_132039 - BLOCK
      ?auto_132040 - BLOCK
    )
    :vars
    (
      ?auto_132044 - BLOCK
      ?auto_132045 - BLOCK
      ?auto_132046 - BLOCK
      ?auto_132043 - BLOCK
      ?auto_132041 - BLOCK
      ?auto_132042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132038 ?auto_132039 ) ) ( not ( = ?auto_132038 ?auto_132040 ) ) ( not ( = ?auto_132039 ?auto_132040 ) ) ( ON ?auto_132040 ?auto_132044 ) ( not ( = ?auto_132038 ?auto_132044 ) ) ( not ( = ?auto_132039 ?auto_132044 ) ) ( not ( = ?auto_132040 ?auto_132044 ) ) ( ON ?auto_132039 ?auto_132040 ) ( ON-TABLE ?auto_132045 ) ( ON ?auto_132046 ?auto_132045 ) ( ON ?auto_132043 ?auto_132046 ) ( ON ?auto_132041 ?auto_132043 ) ( ON ?auto_132042 ?auto_132041 ) ( ON ?auto_132044 ?auto_132042 ) ( not ( = ?auto_132045 ?auto_132046 ) ) ( not ( = ?auto_132045 ?auto_132043 ) ) ( not ( = ?auto_132045 ?auto_132041 ) ) ( not ( = ?auto_132045 ?auto_132042 ) ) ( not ( = ?auto_132045 ?auto_132044 ) ) ( not ( = ?auto_132045 ?auto_132040 ) ) ( not ( = ?auto_132045 ?auto_132039 ) ) ( not ( = ?auto_132046 ?auto_132043 ) ) ( not ( = ?auto_132046 ?auto_132041 ) ) ( not ( = ?auto_132046 ?auto_132042 ) ) ( not ( = ?auto_132046 ?auto_132044 ) ) ( not ( = ?auto_132046 ?auto_132040 ) ) ( not ( = ?auto_132046 ?auto_132039 ) ) ( not ( = ?auto_132043 ?auto_132041 ) ) ( not ( = ?auto_132043 ?auto_132042 ) ) ( not ( = ?auto_132043 ?auto_132044 ) ) ( not ( = ?auto_132043 ?auto_132040 ) ) ( not ( = ?auto_132043 ?auto_132039 ) ) ( not ( = ?auto_132041 ?auto_132042 ) ) ( not ( = ?auto_132041 ?auto_132044 ) ) ( not ( = ?auto_132041 ?auto_132040 ) ) ( not ( = ?auto_132041 ?auto_132039 ) ) ( not ( = ?auto_132042 ?auto_132044 ) ) ( not ( = ?auto_132042 ?auto_132040 ) ) ( not ( = ?auto_132042 ?auto_132039 ) ) ( not ( = ?auto_132038 ?auto_132045 ) ) ( not ( = ?auto_132038 ?auto_132046 ) ) ( not ( = ?auto_132038 ?auto_132043 ) ) ( not ( = ?auto_132038 ?auto_132041 ) ) ( not ( = ?auto_132038 ?auto_132042 ) ) ( ON ?auto_132038 ?auto_132039 ) ( CLEAR ?auto_132038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132045 ?auto_132046 ?auto_132043 ?auto_132041 ?auto_132042 ?auto_132044 ?auto_132040 ?auto_132039 )
      ( MAKE-3PILE ?auto_132038 ?auto_132039 ?auto_132040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132052 - BLOCK
      ?auto_132053 - BLOCK
      ?auto_132054 - BLOCK
      ?auto_132055 - BLOCK
      ?auto_132056 - BLOCK
    )
    :vars
    (
      ?auto_132057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132057 ?auto_132056 ) ( CLEAR ?auto_132057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132052 ) ( ON ?auto_132053 ?auto_132052 ) ( ON ?auto_132054 ?auto_132053 ) ( ON ?auto_132055 ?auto_132054 ) ( ON ?auto_132056 ?auto_132055 ) ( not ( = ?auto_132052 ?auto_132053 ) ) ( not ( = ?auto_132052 ?auto_132054 ) ) ( not ( = ?auto_132052 ?auto_132055 ) ) ( not ( = ?auto_132052 ?auto_132056 ) ) ( not ( = ?auto_132052 ?auto_132057 ) ) ( not ( = ?auto_132053 ?auto_132054 ) ) ( not ( = ?auto_132053 ?auto_132055 ) ) ( not ( = ?auto_132053 ?auto_132056 ) ) ( not ( = ?auto_132053 ?auto_132057 ) ) ( not ( = ?auto_132054 ?auto_132055 ) ) ( not ( = ?auto_132054 ?auto_132056 ) ) ( not ( = ?auto_132054 ?auto_132057 ) ) ( not ( = ?auto_132055 ?auto_132056 ) ) ( not ( = ?auto_132055 ?auto_132057 ) ) ( not ( = ?auto_132056 ?auto_132057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132057 ?auto_132056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132058 - BLOCK
      ?auto_132059 - BLOCK
      ?auto_132060 - BLOCK
      ?auto_132061 - BLOCK
      ?auto_132062 - BLOCK
    )
    :vars
    (
      ?auto_132063 - BLOCK
      ?auto_132064 - BLOCK
      ?auto_132065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132063 ?auto_132062 ) ( CLEAR ?auto_132063 ) ( ON-TABLE ?auto_132058 ) ( ON ?auto_132059 ?auto_132058 ) ( ON ?auto_132060 ?auto_132059 ) ( ON ?auto_132061 ?auto_132060 ) ( ON ?auto_132062 ?auto_132061 ) ( not ( = ?auto_132058 ?auto_132059 ) ) ( not ( = ?auto_132058 ?auto_132060 ) ) ( not ( = ?auto_132058 ?auto_132061 ) ) ( not ( = ?auto_132058 ?auto_132062 ) ) ( not ( = ?auto_132058 ?auto_132063 ) ) ( not ( = ?auto_132059 ?auto_132060 ) ) ( not ( = ?auto_132059 ?auto_132061 ) ) ( not ( = ?auto_132059 ?auto_132062 ) ) ( not ( = ?auto_132059 ?auto_132063 ) ) ( not ( = ?auto_132060 ?auto_132061 ) ) ( not ( = ?auto_132060 ?auto_132062 ) ) ( not ( = ?auto_132060 ?auto_132063 ) ) ( not ( = ?auto_132061 ?auto_132062 ) ) ( not ( = ?auto_132061 ?auto_132063 ) ) ( not ( = ?auto_132062 ?auto_132063 ) ) ( HOLDING ?auto_132064 ) ( CLEAR ?auto_132065 ) ( not ( = ?auto_132058 ?auto_132064 ) ) ( not ( = ?auto_132058 ?auto_132065 ) ) ( not ( = ?auto_132059 ?auto_132064 ) ) ( not ( = ?auto_132059 ?auto_132065 ) ) ( not ( = ?auto_132060 ?auto_132064 ) ) ( not ( = ?auto_132060 ?auto_132065 ) ) ( not ( = ?auto_132061 ?auto_132064 ) ) ( not ( = ?auto_132061 ?auto_132065 ) ) ( not ( = ?auto_132062 ?auto_132064 ) ) ( not ( = ?auto_132062 ?auto_132065 ) ) ( not ( = ?auto_132063 ?auto_132064 ) ) ( not ( = ?auto_132063 ?auto_132065 ) ) ( not ( = ?auto_132064 ?auto_132065 ) ) )
    :subtasks
    ( ( !STACK ?auto_132064 ?auto_132065 )
      ( MAKE-5PILE ?auto_132058 ?auto_132059 ?auto_132060 ?auto_132061 ?auto_132062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132066 - BLOCK
      ?auto_132067 - BLOCK
      ?auto_132068 - BLOCK
      ?auto_132069 - BLOCK
      ?auto_132070 - BLOCK
    )
    :vars
    (
      ?auto_132072 - BLOCK
      ?auto_132071 - BLOCK
      ?auto_132073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132072 ?auto_132070 ) ( ON-TABLE ?auto_132066 ) ( ON ?auto_132067 ?auto_132066 ) ( ON ?auto_132068 ?auto_132067 ) ( ON ?auto_132069 ?auto_132068 ) ( ON ?auto_132070 ?auto_132069 ) ( not ( = ?auto_132066 ?auto_132067 ) ) ( not ( = ?auto_132066 ?auto_132068 ) ) ( not ( = ?auto_132066 ?auto_132069 ) ) ( not ( = ?auto_132066 ?auto_132070 ) ) ( not ( = ?auto_132066 ?auto_132072 ) ) ( not ( = ?auto_132067 ?auto_132068 ) ) ( not ( = ?auto_132067 ?auto_132069 ) ) ( not ( = ?auto_132067 ?auto_132070 ) ) ( not ( = ?auto_132067 ?auto_132072 ) ) ( not ( = ?auto_132068 ?auto_132069 ) ) ( not ( = ?auto_132068 ?auto_132070 ) ) ( not ( = ?auto_132068 ?auto_132072 ) ) ( not ( = ?auto_132069 ?auto_132070 ) ) ( not ( = ?auto_132069 ?auto_132072 ) ) ( not ( = ?auto_132070 ?auto_132072 ) ) ( CLEAR ?auto_132071 ) ( not ( = ?auto_132066 ?auto_132073 ) ) ( not ( = ?auto_132066 ?auto_132071 ) ) ( not ( = ?auto_132067 ?auto_132073 ) ) ( not ( = ?auto_132067 ?auto_132071 ) ) ( not ( = ?auto_132068 ?auto_132073 ) ) ( not ( = ?auto_132068 ?auto_132071 ) ) ( not ( = ?auto_132069 ?auto_132073 ) ) ( not ( = ?auto_132069 ?auto_132071 ) ) ( not ( = ?auto_132070 ?auto_132073 ) ) ( not ( = ?auto_132070 ?auto_132071 ) ) ( not ( = ?auto_132072 ?auto_132073 ) ) ( not ( = ?auto_132072 ?auto_132071 ) ) ( not ( = ?auto_132073 ?auto_132071 ) ) ( ON ?auto_132073 ?auto_132072 ) ( CLEAR ?auto_132073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132066 ?auto_132067 ?auto_132068 ?auto_132069 ?auto_132070 ?auto_132072 )
      ( MAKE-5PILE ?auto_132066 ?auto_132067 ?auto_132068 ?auto_132069 ?auto_132070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132074 - BLOCK
      ?auto_132075 - BLOCK
      ?auto_132076 - BLOCK
      ?auto_132077 - BLOCK
      ?auto_132078 - BLOCK
    )
    :vars
    (
      ?auto_132080 - BLOCK
      ?auto_132081 - BLOCK
      ?auto_132079 - BLOCK
      ?auto_132082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132080 ?auto_132078 ) ( ON-TABLE ?auto_132074 ) ( ON ?auto_132075 ?auto_132074 ) ( ON ?auto_132076 ?auto_132075 ) ( ON ?auto_132077 ?auto_132076 ) ( ON ?auto_132078 ?auto_132077 ) ( not ( = ?auto_132074 ?auto_132075 ) ) ( not ( = ?auto_132074 ?auto_132076 ) ) ( not ( = ?auto_132074 ?auto_132077 ) ) ( not ( = ?auto_132074 ?auto_132078 ) ) ( not ( = ?auto_132074 ?auto_132080 ) ) ( not ( = ?auto_132075 ?auto_132076 ) ) ( not ( = ?auto_132075 ?auto_132077 ) ) ( not ( = ?auto_132075 ?auto_132078 ) ) ( not ( = ?auto_132075 ?auto_132080 ) ) ( not ( = ?auto_132076 ?auto_132077 ) ) ( not ( = ?auto_132076 ?auto_132078 ) ) ( not ( = ?auto_132076 ?auto_132080 ) ) ( not ( = ?auto_132077 ?auto_132078 ) ) ( not ( = ?auto_132077 ?auto_132080 ) ) ( not ( = ?auto_132078 ?auto_132080 ) ) ( not ( = ?auto_132074 ?auto_132081 ) ) ( not ( = ?auto_132074 ?auto_132079 ) ) ( not ( = ?auto_132075 ?auto_132081 ) ) ( not ( = ?auto_132075 ?auto_132079 ) ) ( not ( = ?auto_132076 ?auto_132081 ) ) ( not ( = ?auto_132076 ?auto_132079 ) ) ( not ( = ?auto_132077 ?auto_132081 ) ) ( not ( = ?auto_132077 ?auto_132079 ) ) ( not ( = ?auto_132078 ?auto_132081 ) ) ( not ( = ?auto_132078 ?auto_132079 ) ) ( not ( = ?auto_132080 ?auto_132081 ) ) ( not ( = ?auto_132080 ?auto_132079 ) ) ( not ( = ?auto_132081 ?auto_132079 ) ) ( ON ?auto_132081 ?auto_132080 ) ( CLEAR ?auto_132081 ) ( HOLDING ?auto_132079 ) ( CLEAR ?auto_132082 ) ( ON-TABLE ?auto_132082 ) ( not ( = ?auto_132082 ?auto_132079 ) ) ( not ( = ?auto_132074 ?auto_132082 ) ) ( not ( = ?auto_132075 ?auto_132082 ) ) ( not ( = ?auto_132076 ?auto_132082 ) ) ( not ( = ?auto_132077 ?auto_132082 ) ) ( not ( = ?auto_132078 ?auto_132082 ) ) ( not ( = ?auto_132080 ?auto_132082 ) ) ( not ( = ?auto_132081 ?auto_132082 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132082 ?auto_132079 )
      ( MAKE-5PILE ?auto_132074 ?auto_132075 ?auto_132076 ?auto_132077 ?auto_132078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133602 - BLOCK
      ?auto_133603 - BLOCK
      ?auto_133604 - BLOCK
      ?auto_133605 - BLOCK
      ?auto_133606 - BLOCK
    )
    :vars
    (
      ?auto_133609 - BLOCK
      ?auto_133608 - BLOCK
      ?auto_133607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133609 ?auto_133606 ) ( ON-TABLE ?auto_133602 ) ( ON ?auto_133603 ?auto_133602 ) ( ON ?auto_133604 ?auto_133603 ) ( ON ?auto_133605 ?auto_133604 ) ( ON ?auto_133606 ?auto_133605 ) ( not ( = ?auto_133602 ?auto_133603 ) ) ( not ( = ?auto_133602 ?auto_133604 ) ) ( not ( = ?auto_133602 ?auto_133605 ) ) ( not ( = ?auto_133602 ?auto_133606 ) ) ( not ( = ?auto_133602 ?auto_133609 ) ) ( not ( = ?auto_133603 ?auto_133604 ) ) ( not ( = ?auto_133603 ?auto_133605 ) ) ( not ( = ?auto_133603 ?auto_133606 ) ) ( not ( = ?auto_133603 ?auto_133609 ) ) ( not ( = ?auto_133604 ?auto_133605 ) ) ( not ( = ?auto_133604 ?auto_133606 ) ) ( not ( = ?auto_133604 ?auto_133609 ) ) ( not ( = ?auto_133605 ?auto_133606 ) ) ( not ( = ?auto_133605 ?auto_133609 ) ) ( not ( = ?auto_133606 ?auto_133609 ) ) ( not ( = ?auto_133602 ?auto_133608 ) ) ( not ( = ?auto_133602 ?auto_133607 ) ) ( not ( = ?auto_133603 ?auto_133608 ) ) ( not ( = ?auto_133603 ?auto_133607 ) ) ( not ( = ?auto_133604 ?auto_133608 ) ) ( not ( = ?auto_133604 ?auto_133607 ) ) ( not ( = ?auto_133605 ?auto_133608 ) ) ( not ( = ?auto_133605 ?auto_133607 ) ) ( not ( = ?auto_133606 ?auto_133608 ) ) ( not ( = ?auto_133606 ?auto_133607 ) ) ( not ( = ?auto_133609 ?auto_133608 ) ) ( not ( = ?auto_133609 ?auto_133607 ) ) ( not ( = ?auto_133608 ?auto_133607 ) ) ( ON ?auto_133608 ?auto_133609 ) ( ON ?auto_133607 ?auto_133608 ) ( CLEAR ?auto_133607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133602 ?auto_133603 ?auto_133604 ?auto_133605 ?auto_133606 ?auto_133609 ?auto_133608 )
      ( MAKE-5PILE ?auto_133602 ?auto_133603 ?auto_133604 ?auto_133605 ?auto_133606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132092 - BLOCK
      ?auto_132093 - BLOCK
      ?auto_132094 - BLOCK
      ?auto_132095 - BLOCK
      ?auto_132096 - BLOCK
    )
    :vars
    (
      ?auto_132098 - BLOCK
      ?auto_132097 - BLOCK
      ?auto_132100 - BLOCK
      ?auto_132099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132098 ?auto_132096 ) ( ON-TABLE ?auto_132092 ) ( ON ?auto_132093 ?auto_132092 ) ( ON ?auto_132094 ?auto_132093 ) ( ON ?auto_132095 ?auto_132094 ) ( ON ?auto_132096 ?auto_132095 ) ( not ( = ?auto_132092 ?auto_132093 ) ) ( not ( = ?auto_132092 ?auto_132094 ) ) ( not ( = ?auto_132092 ?auto_132095 ) ) ( not ( = ?auto_132092 ?auto_132096 ) ) ( not ( = ?auto_132092 ?auto_132098 ) ) ( not ( = ?auto_132093 ?auto_132094 ) ) ( not ( = ?auto_132093 ?auto_132095 ) ) ( not ( = ?auto_132093 ?auto_132096 ) ) ( not ( = ?auto_132093 ?auto_132098 ) ) ( not ( = ?auto_132094 ?auto_132095 ) ) ( not ( = ?auto_132094 ?auto_132096 ) ) ( not ( = ?auto_132094 ?auto_132098 ) ) ( not ( = ?auto_132095 ?auto_132096 ) ) ( not ( = ?auto_132095 ?auto_132098 ) ) ( not ( = ?auto_132096 ?auto_132098 ) ) ( not ( = ?auto_132092 ?auto_132097 ) ) ( not ( = ?auto_132092 ?auto_132100 ) ) ( not ( = ?auto_132093 ?auto_132097 ) ) ( not ( = ?auto_132093 ?auto_132100 ) ) ( not ( = ?auto_132094 ?auto_132097 ) ) ( not ( = ?auto_132094 ?auto_132100 ) ) ( not ( = ?auto_132095 ?auto_132097 ) ) ( not ( = ?auto_132095 ?auto_132100 ) ) ( not ( = ?auto_132096 ?auto_132097 ) ) ( not ( = ?auto_132096 ?auto_132100 ) ) ( not ( = ?auto_132098 ?auto_132097 ) ) ( not ( = ?auto_132098 ?auto_132100 ) ) ( not ( = ?auto_132097 ?auto_132100 ) ) ( ON ?auto_132097 ?auto_132098 ) ( not ( = ?auto_132099 ?auto_132100 ) ) ( not ( = ?auto_132092 ?auto_132099 ) ) ( not ( = ?auto_132093 ?auto_132099 ) ) ( not ( = ?auto_132094 ?auto_132099 ) ) ( not ( = ?auto_132095 ?auto_132099 ) ) ( not ( = ?auto_132096 ?auto_132099 ) ) ( not ( = ?auto_132098 ?auto_132099 ) ) ( not ( = ?auto_132097 ?auto_132099 ) ) ( ON ?auto_132100 ?auto_132097 ) ( CLEAR ?auto_132100 ) ( HOLDING ?auto_132099 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132099 )
      ( MAKE-5PILE ?auto_132092 ?auto_132093 ?auto_132094 ?auto_132095 ?auto_132096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132101 - BLOCK
      ?auto_132102 - BLOCK
      ?auto_132103 - BLOCK
      ?auto_132104 - BLOCK
      ?auto_132105 - BLOCK
    )
    :vars
    (
      ?auto_132109 - BLOCK
      ?auto_132106 - BLOCK
      ?auto_132108 - BLOCK
      ?auto_132107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132109 ?auto_132105 ) ( ON-TABLE ?auto_132101 ) ( ON ?auto_132102 ?auto_132101 ) ( ON ?auto_132103 ?auto_132102 ) ( ON ?auto_132104 ?auto_132103 ) ( ON ?auto_132105 ?auto_132104 ) ( not ( = ?auto_132101 ?auto_132102 ) ) ( not ( = ?auto_132101 ?auto_132103 ) ) ( not ( = ?auto_132101 ?auto_132104 ) ) ( not ( = ?auto_132101 ?auto_132105 ) ) ( not ( = ?auto_132101 ?auto_132109 ) ) ( not ( = ?auto_132102 ?auto_132103 ) ) ( not ( = ?auto_132102 ?auto_132104 ) ) ( not ( = ?auto_132102 ?auto_132105 ) ) ( not ( = ?auto_132102 ?auto_132109 ) ) ( not ( = ?auto_132103 ?auto_132104 ) ) ( not ( = ?auto_132103 ?auto_132105 ) ) ( not ( = ?auto_132103 ?auto_132109 ) ) ( not ( = ?auto_132104 ?auto_132105 ) ) ( not ( = ?auto_132104 ?auto_132109 ) ) ( not ( = ?auto_132105 ?auto_132109 ) ) ( not ( = ?auto_132101 ?auto_132106 ) ) ( not ( = ?auto_132101 ?auto_132108 ) ) ( not ( = ?auto_132102 ?auto_132106 ) ) ( not ( = ?auto_132102 ?auto_132108 ) ) ( not ( = ?auto_132103 ?auto_132106 ) ) ( not ( = ?auto_132103 ?auto_132108 ) ) ( not ( = ?auto_132104 ?auto_132106 ) ) ( not ( = ?auto_132104 ?auto_132108 ) ) ( not ( = ?auto_132105 ?auto_132106 ) ) ( not ( = ?auto_132105 ?auto_132108 ) ) ( not ( = ?auto_132109 ?auto_132106 ) ) ( not ( = ?auto_132109 ?auto_132108 ) ) ( not ( = ?auto_132106 ?auto_132108 ) ) ( ON ?auto_132106 ?auto_132109 ) ( not ( = ?auto_132107 ?auto_132108 ) ) ( not ( = ?auto_132101 ?auto_132107 ) ) ( not ( = ?auto_132102 ?auto_132107 ) ) ( not ( = ?auto_132103 ?auto_132107 ) ) ( not ( = ?auto_132104 ?auto_132107 ) ) ( not ( = ?auto_132105 ?auto_132107 ) ) ( not ( = ?auto_132109 ?auto_132107 ) ) ( not ( = ?auto_132106 ?auto_132107 ) ) ( ON ?auto_132108 ?auto_132106 ) ( ON ?auto_132107 ?auto_132108 ) ( CLEAR ?auto_132107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132101 ?auto_132102 ?auto_132103 ?auto_132104 ?auto_132105 ?auto_132109 ?auto_132106 ?auto_132108 )
      ( MAKE-5PILE ?auto_132101 ?auto_132102 ?auto_132103 ?auto_132104 ?auto_132105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132114 - BLOCK
      ?auto_132115 - BLOCK
      ?auto_132116 - BLOCK
      ?auto_132117 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132117 ) ( CLEAR ?auto_132116 ) ( ON-TABLE ?auto_132114 ) ( ON ?auto_132115 ?auto_132114 ) ( ON ?auto_132116 ?auto_132115 ) ( not ( = ?auto_132114 ?auto_132115 ) ) ( not ( = ?auto_132114 ?auto_132116 ) ) ( not ( = ?auto_132114 ?auto_132117 ) ) ( not ( = ?auto_132115 ?auto_132116 ) ) ( not ( = ?auto_132115 ?auto_132117 ) ) ( not ( = ?auto_132116 ?auto_132117 ) ) )
    :subtasks
    ( ( !STACK ?auto_132117 ?auto_132116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132118 - BLOCK
      ?auto_132119 - BLOCK
      ?auto_132120 - BLOCK
      ?auto_132121 - BLOCK
    )
    :vars
    (
      ?auto_132122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132120 ) ( ON-TABLE ?auto_132118 ) ( ON ?auto_132119 ?auto_132118 ) ( ON ?auto_132120 ?auto_132119 ) ( not ( = ?auto_132118 ?auto_132119 ) ) ( not ( = ?auto_132118 ?auto_132120 ) ) ( not ( = ?auto_132118 ?auto_132121 ) ) ( not ( = ?auto_132119 ?auto_132120 ) ) ( not ( = ?auto_132119 ?auto_132121 ) ) ( not ( = ?auto_132120 ?auto_132121 ) ) ( ON ?auto_132121 ?auto_132122 ) ( CLEAR ?auto_132121 ) ( HAND-EMPTY ) ( not ( = ?auto_132118 ?auto_132122 ) ) ( not ( = ?auto_132119 ?auto_132122 ) ) ( not ( = ?auto_132120 ?auto_132122 ) ) ( not ( = ?auto_132121 ?auto_132122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132121 ?auto_132122 )
      ( MAKE-4PILE ?auto_132118 ?auto_132119 ?auto_132120 ?auto_132121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132123 - BLOCK
      ?auto_132124 - BLOCK
      ?auto_132125 - BLOCK
      ?auto_132126 - BLOCK
    )
    :vars
    (
      ?auto_132127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132123 ) ( ON ?auto_132124 ?auto_132123 ) ( not ( = ?auto_132123 ?auto_132124 ) ) ( not ( = ?auto_132123 ?auto_132125 ) ) ( not ( = ?auto_132123 ?auto_132126 ) ) ( not ( = ?auto_132124 ?auto_132125 ) ) ( not ( = ?auto_132124 ?auto_132126 ) ) ( not ( = ?auto_132125 ?auto_132126 ) ) ( ON ?auto_132126 ?auto_132127 ) ( CLEAR ?auto_132126 ) ( not ( = ?auto_132123 ?auto_132127 ) ) ( not ( = ?auto_132124 ?auto_132127 ) ) ( not ( = ?auto_132125 ?auto_132127 ) ) ( not ( = ?auto_132126 ?auto_132127 ) ) ( HOLDING ?auto_132125 ) ( CLEAR ?auto_132124 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132123 ?auto_132124 ?auto_132125 )
      ( MAKE-4PILE ?auto_132123 ?auto_132124 ?auto_132125 ?auto_132126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132128 - BLOCK
      ?auto_132129 - BLOCK
      ?auto_132130 - BLOCK
      ?auto_132131 - BLOCK
    )
    :vars
    (
      ?auto_132132 - BLOCK
      ?auto_132134 - BLOCK
      ?auto_132133 - BLOCK
      ?auto_132136 - BLOCK
      ?auto_132135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132128 ) ( ON ?auto_132129 ?auto_132128 ) ( not ( = ?auto_132128 ?auto_132129 ) ) ( not ( = ?auto_132128 ?auto_132130 ) ) ( not ( = ?auto_132128 ?auto_132131 ) ) ( not ( = ?auto_132129 ?auto_132130 ) ) ( not ( = ?auto_132129 ?auto_132131 ) ) ( not ( = ?auto_132130 ?auto_132131 ) ) ( ON ?auto_132131 ?auto_132132 ) ( not ( = ?auto_132128 ?auto_132132 ) ) ( not ( = ?auto_132129 ?auto_132132 ) ) ( not ( = ?auto_132130 ?auto_132132 ) ) ( not ( = ?auto_132131 ?auto_132132 ) ) ( CLEAR ?auto_132129 ) ( ON ?auto_132130 ?auto_132131 ) ( CLEAR ?auto_132130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132134 ) ( ON ?auto_132133 ?auto_132134 ) ( ON ?auto_132136 ?auto_132133 ) ( ON ?auto_132135 ?auto_132136 ) ( ON ?auto_132132 ?auto_132135 ) ( not ( = ?auto_132134 ?auto_132133 ) ) ( not ( = ?auto_132134 ?auto_132136 ) ) ( not ( = ?auto_132134 ?auto_132135 ) ) ( not ( = ?auto_132134 ?auto_132132 ) ) ( not ( = ?auto_132134 ?auto_132131 ) ) ( not ( = ?auto_132134 ?auto_132130 ) ) ( not ( = ?auto_132133 ?auto_132136 ) ) ( not ( = ?auto_132133 ?auto_132135 ) ) ( not ( = ?auto_132133 ?auto_132132 ) ) ( not ( = ?auto_132133 ?auto_132131 ) ) ( not ( = ?auto_132133 ?auto_132130 ) ) ( not ( = ?auto_132136 ?auto_132135 ) ) ( not ( = ?auto_132136 ?auto_132132 ) ) ( not ( = ?auto_132136 ?auto_132131 ) ) ( not ( = ?auto_132136 ?auto_132130 ) ) ( not ( = ?auto_132135 ?auto_132132 ) ) ( not ( = ?auto_132135 ?auto_132131 ) ) ( not ( = ?auto_132135 ?auto_132130 ) ) ( not ( = ?auto_132128 ?auto_132134 ) ) ( not ( = ?auto_132128 ?auto_132133 ) ) ( not ( = ?auto_132128 ?auto_132136 ) ) ( not ( = ?auto_132128 ?auto_132135 ) ) ( not ( = ?auto_132129 ?auto_132134 ) ) ( not ( = ?auto_132129 ?auto_132133 ) ) ( not ( = ?auto_132129 ?auto_132136 ) ) ( not ( = ?auto_132129 ?auto_132135 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132134 ?auto_132133 ?auto_132136 ?auto_132135 ?auto_132132 ?auto_132131 )
      ( MAKE-4PILE ?auto_132128 ?auto_132129 ?auto_132130 ?auto_132131 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132137 - BLOCK
      ?auto_132138 - BLOCK
      ?auto_132139 - BLOCK
      ?auto_132140 - BLOCK
    )
    :vars
    (
      ?auto_132141 - BLOCK
      ?auto_132144 - BLOCK
      ?auto_132145 - BLOCK
      ?auto_132143 - BLOCK
      ?auto_132142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132137 ) ( not ( = ?auto_132137 ?auto_132138 ) ) ( not ( = ?auto_132137 ?auto_132139 ) ) ( not ( = ?auto_132137 ?auto_132140 ) ) ( not ( = ?auto_132138 ?auto_132139 ) ) ( not ( = ?auto_132138 ?auto_132140 ) ) ( not ( = ?auto_132139 ?auto_132140 ) ) ( ON ?auto_132140 ?auto_132141 ) ( not ( = ?auto_132137 ?auto_132141 ) ) ( not ( = ?auto_132138 ?auto_132141 ) ) ( not ( = ?auto_132139 ?auto_132141 ) ) ( not ( = ?auto_132140 ?auto_132141 ) ) ( ON ?auto_132139 ?auto_132140 ) ( CLEAR ?auto_132139 ) ( ON-TABLE ?auto_132144 ) ( ON ?auto_132145 ?auto_132144 ) ( ON ?auto_132143 ?auto_132145 ) ( ON ?auto_132142 ?auto_132143 ) ( ON ?auto_132141 ?auto_132142 ) ( not ( = ?auto_132144 ?auto_132145 ) ) ( not ( = ?auto_132144 ?auto_132143 ) ) ( not ( = ?auto_132144 ?auto_132142 ) ) ( not ( = ?auto_132144 ?auto_132141 ) ) ( not ( = ?auto_132144 ?auto_132140 ) ) ( not ( = ?auto_132144 ?auto_132139 ) ) ( not ( = ?auto_132145 ?auto_132143 ) ) ( not ( = ?auto_132145 ?auto_132142 ) ) ( not ( = ?auto_132145 ?auto_132141 ) ) ( not ( = ?auto_132145 ?auto_132140 ) ) ( not ( = ?auto_132145 ?auto_132139 ) ) ( not ( = ?auto_132143 ?auto_132142 ) ) ( not ( = ?auto_132143 ?auto_132141 ) ) ( not ( = ?auto_132143 ?auto_132140 ) ) ( not ( = ?auto_132143 ?auto_132139 ) ) ( not ( = ?auto_132142 ?auto_132141 ) ) ( not ( = ?auto_132142 ?auto_132140 ) ) ( not ( = ?auto_132142 ?auto_132139 ) ) ( not ( = ?auto_132137 ?auto_132144 ) ) ( not ( = ?auto_132137 ?auto_132145 ) ) ( not ( = ?auto_132137 ?auto_132143 ) ) ( not ( = ?auto_132137 ?auto_132142 ) ) ( not ( = ?auto_132138 ?auto_132144 ) ) ( not ( = ?auto_132138 ?auto_132145 ) ) ( not ( = ?auto_132138 ?auto_132143 ) ) ( not ( = ?auto_132138 ?auto_132142 ) ) ( HOLDING ?auto_132138 ) ( CLEAR ?auto_132137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132137 ?auto_132138 )
      ( MAKE-4PILE ?auto_132137 ?auto_132138 ?auto_132139 ?auto_132140 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132146 - BLOCK
      ?auto_132147 - BLOCK
      ?auto_132148 - BLOCK
      ?auto_132149 - BLOCK
    )
    :vars
    (
      ?auto_132154 - BLOCK
      ?auto_132150 - BLOCK
      ?auto_132153 - BLOCK
      ?auto_132152 - BLOCK
      ?auto_132151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132146 ) ( not ( = ?auto_132146 ?auto_132147 ) ) ( not ( = ?auto_132146 ?auto_132148 ) ) ( not ( = ?auto_132146 ?auto_132149 ) ) ( not ( = ?auto_132147 ?auto_132148 ) ) ( not ( = ?auto_132147 ?auto_132149 ) ) ( not ( = ?auto_132148 ?auto_132149 ) ) ( ON ?auto_132149 ?auto_132154 ) ( not ( = ?auto_132146 ?auto_132154 ) ) ( not ( = ?auto_132147 ?auto_132154 ) ) ( not ( = ?auto_132148 ?auto_132154 ) ) ( not ( = ?auto_132149 ?auto_132154 ) ) ( ON ?auto_132148 ?auto_132149 ) ( ON-TABLE ?auto_132150 ) ( ON ?auto_132153 ?auto_132150 ) ( ON ?auto_132152 ?auto_132153 ) ( ON ?auto_132151 ?auto_132152 ) ( ON ?auto_132154 ?auto_132151 ) ( not ( = ?auto_132150 ?auto_132153 ) ) ( not ( = ?auto_132150 ?auto_132152 ) ) ( not ( = ?auto_132150 ?auto_132151 ) ) ( not ( = ?auto_132150 ?auto_132154 ) ) ( not ( = ?auto_132150 ?auto_132149 ) ) ( not ( = ?auto_132150 ?auto_132148 ) ) ( not ( = ?auto_132153 ?auto_132152 ) ) ( not ( = ?auto_132153 ?auto_132151 ) ) ( not ( = ?auto_132153 ?auto_132154 ) ) ( not ( = ?auto_132153 ?auto_132149 ) ) ( not ( = ?auto_132153 ?auto_132148 ) ) ( not ( = ?auto_132152 ?auto_132151 ) ) ( not ( = ?auto_132152 ?auto_132154 ) ) ( not ( = ?auto_132152 ?auto_132149 ) ) ( not ( = ?auto_132152 ?auto_132148 ) ) ( not ( = ?auto_132151 ?auto_132154 ) ) ( not ( = ?auto_132151 ?auto_132149 ) ) ( not ( = ?auto_132151 ?auto_132148 ) ) ( not ( = ?auto_132146 ?auto_132150 ) ) ( not ( = ?auto_132146 ?auto_132153 ) ) ( not ( = ?auto_132146 ?auto_132152 ) ) ( not ( = ?auto_132146 ?auto_132151 ) ) ( not ( = ?auto_132147 ?auto_132150 ) ) ( not ( = ?auto_132147 ?auto_132153 ) ) ( not ( = ?auto_132147 ?auto_132152 ) ) ( not ( = ?auto_132147 ?auto_132151 ) ) ( CLEAR ?auto_132146 ) ( ON ?auto_132147 ?auto_132148 ) ( CLEAR ?auto_132147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132150 ?auto_132153 ?auto_132152 ?auto_132151 ?auto_132154 ?auto_132149 ?auto_132148 )
      ( MAKE-4PILE ?auto_132146 ?auto_132147 ?auto_132148 ?auto_132149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132155 - BLOCK
      ?auto_132156 - BLOCK
      ?auto_132157 - BLOCK
      ?auto_132158 - BLOCK
    )
    :vars
    (
      ?auto_132161 - BLOCK
      ?auto_132162 - BLOCK
      ?auto_132159 - BLOCK
      ?auto_132163 - BLOCK
      ?auto_132160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132155 ?auto_132156 ) ) ( not ( = ?auto_132155 ?auto_132157 ) ) ( not ( = ?auto_132155 ?auto_132158 ) ) ( not ( = ?auto_132156 ?auto_132157 ) ) ( not ( = ?auto_132156 ?auto_132158 ) ) ( not ( = ?auto_132157 ?auto_132158 ) ) ( ON ?auto_132158 ?auto_132161 ) ( not ( = ?auto_132155 ?auto_132161 ) ) ( not ( = ?auto_132156 ?auto_132161 ) ) ( not ( = ?auto_132157 ?auto_132161 ) ) ( not ( = ?auto_132158 ?auto_132161 ) ) ( ON ?auto_132157 ?auto_132158 ) ( ON-TABLE ?auto_132162 ) ( ON ?auto_132159 ?auto_132162 ) ( ON ?auto_132163 ?auto_132159 ) ( ON ?auto_132160 ?auto_132163 ) ( ON ?auto_132161 ?auto_132160 ) ( not ( = ?auto_132162 ?auto_132159 ) ) ( not ( = ?auto_132162 ?auto_132163 ) ) ( not ( = ?auto_132162 ?auto_132160 ) ) ( not ( = ?auto_132162 ?auto_132161 ) ) ( not ( = ?auto_132162 ?auto_132158 ) ) ( not ( = ?auto_132162 ?auto_132157 ) ) ( not ( = ?auto_132159 ?auto_132163 ) ) ( not ( = ?auto_132159 ?auto_132160 ) ) ( not ( = ?auto_132159 ?auto_132161 ) ) ( not ( = ?auto_132159 ?auto_132158 ) ) ( not ( = ?auto_132159 ?auto_132157 ) ) ( not ( = ?auto_132163 ?auto_132160 ) ) ( not ( = ?auto_132163 ?auto_132161 ) ) ( not ( = ?auto_132163 ?auto_132158 ) ) ( not ( = ?auto_132163 ?auto_132157 ) ) ( not ( = ?auto_132160 ?auto_132161 ) ) ( not ( = ?auto_132160 ?auto_132158 ) ) ( not ( = ?auto_132160 ?auto_132157 ) ) ( not ( = ?auto_132155 ?auto_132162 ) ) ( not ( = ?auto_132155 ?auto_132159 ) ) ( not ( = ?auto_132155 ?auto_132163 ) ) ( not ( = ?auto_132155 ?auto_132160 ) ) ( not ( = ?auto_132156 ?auto_132162 ) ) ( not ( = ?auto_132156 ?auto_132159 ) ) ( not ( = ?auto_132156 ?auto_132163 ) ) ( not ( = ?auto_132156 ?auto_132160 ) ) ( ON ?auto_132156 ?auto_132157 ) ( CLEAR ?auto_132156 ) ( HOLDING ?auto_132155 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132155 )
      ( MAKE-4PILE ?auto_132155 ?auto_132156 ?auto_132157 ?auto_132158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132164 - BLOCK
      ?auto_132165 - BLOCK
      ?auto_132166 - BLOCK
      ?auto_132167 - BLOCK
    )
    :vars
    (
      ?auto_132169 - BLOCK
      ?auto_132168 - BLOCK
      ?auto_132170 - BLOCK
      ?auto_132172 - BLOCK
      ?auto_132171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132164 ?auto_132165 ) ) ( not ( = ?auto_132164 ?auto_132166 ) ) ( not ( = ?auto_132164 ?auto_132167 ) ) ( not ( = ?auto_132165 ?auto_132166 ) ) ( not ( = ?auto_132165 ?auto_132167 ) ) ( not ( = ?auto_132166 ?auto_132167 ) ) ( ON ?auto_132167 ?auto_132169 ) ( not ( = ?auto_132164 ?auto_132169 ) ) ( not ( = ?auto_132165 ?auto_132169 ) ) ( not ( = ?auto_132166 ?auto_132169 ) ) ( not ( = ?auto_132167 ?auto_132169 ) ) ( ON ?auto_132166 ?auto_132167 ) ( ON-TABLE ?auto_132168 ) ( ON ?auto_132170 ?auto_132168 ) ( ON ?auto_132172 ?auto_132170 ) ( ON ?auto_132171 ?auto_132172 ) ( ON ?auto_132169 ?auto_132171 ) ( not ( = ?auto_132168 ?auto_132170 ) ) ( not ( = ?auto_132168 ?auto_132172 ) ) ( not ( = ?auto_132168 ?auto_132171 ) ) ( not ( = ?auto_132168 ?auto_132169 ) ) ( not ( = ?auto_132168 ?auto_132167 ) ) ( not ( = ?auto_132168 ?auto_132166 ) ) ( not ( = ?auto_132170 ?auto_132172 ) ) ( not ( = ?auto_132170 ?auto_132171 ) ) ( not ( = ?auto_132170 ?auto_132169 ) ) ( not ( = ?auto_132170 ?auto_132167 ) ) ( not ( = ?auto_132170 ?auto_132166 ) ) ( not ( = ?auto_132172 ?auto_132171 ) ) ( not ( = ?auto_132172 ?auto_132169 ) ) ( not ( = ?auto_132172 ?auto_132167 ) ) ( not ( = ?auto_132172 ?auto_132166 ) ) ( not ( = ?auto_132171 ?auto_132169 ) ) ( not ( = ?auto_132171 ?auto_132167 ) ) ( not ( = ?auto_132171 ?auto_132166 ) ) ( not ( = ?auto_132164 ?auto_132168 ) ) ( not ( = ?auto_132164 ?auto_132170 ) ) ( not ( = ?auto_132164 ?auto_132172 ) ) ( not ( = ?auto_132164 ?auto_132171 ) ) ( not ( = ?auto_132165 ?auto_132168 ) ) ( not ( = ?auto_132165 ?auto_132170 ) ) ( not ( = ?auto_132165 ?auto_132172 ) ) ( not ( = ?auto_132165 ?auto_132171 ) ) ( ON ?auto_132165 ?auto_132166 ) ( ON ?auto_132164 ?auto_132165 ) ( CLEAR ?auto_132164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132168 ?auto_132170 ?auto_132172 ?auto_132171 ?auto_132169 ?auto_132167 ?auto_132166 ?auto_132165 )
      ( MAKE-4PILE ?auto_132164 ?auto_132165 ?auto_132166 ?auto_132167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132177 - BLOCK
      ?auto_132178 - BLOCK
      ?auto_132179 - BLOCK
      ?auto_132180 - BLOCK
    )
    :vars
    (
      ?auto_132181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132181 ?auto_132180 ) ( CLEAR ?auto_132181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132177 ) ( ON ?auto_132178 ?auto_132177 ) ( ON ?auto_132179 ?auto_132178 ) ( ON ?auto_132180 ?auto_132179 ) ( not ( = ?auto_132177 ?auto_132178 ) ) ( not ( = ?auto_132177 ?auto_132179 ) ) ( not ( = ?auto_132177 ?auto_132180 ) ) ( not ( = ?auto_132177 ?auto_132181 ) ) ( not ( = ?auto_132178 ?auto_132179 ) ) ( not ( = ?auto_132178 ?auto_132180 ) ) ( not ( = ?auto_132178 ?auto_132181 ) ) ( not ( = ?auto_132179 ?auto_132180 ) ) ( not ( = ?auto_132179 ?auto_132181 ) ) ( not ( = ?auto_132180 ?auto_132181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132181 ?auto_132180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132182 - BLOCK
      ?auto_132183 - BLOCK
      ?auto_132184 - BLOCK
      ?auto_132185 - BLOCK
    )
    :vars
    (
      ?auto_132186 - BLOCK
      ?auto_132187 - BLOCK
      ?auto_132188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132186 ?auto_132185 ) ( CLEAR ?auto_132186 ) ( ON-TABLE ?auto_132182 ) ( ON ?auto_132183 ?auto_132182 ) ( ON ?auto_132184 ?auto_132183 ) ( ON ?auto_132185 ?auto_132184 ) ( not ( = ?auto_132182 ?auto_132183 ) ) ( not ( = ?auto_132182 ?auto_132184 ) ) ( not ( = ?auto_132182 ?auto_132185 ) ) ( not ( = ?auto_132182 ?auto_132186 ) ) ( not ( = ?auto_132183 ?auto_132184 ) ) ( not ( = ?auto_132183 ?auto_132185 ) ) ( not ( = ?auto_132183 ?auto_132186 ) ) ( not ( = ?auto_132184 ?auto_132185 ) ) ( not ( = ?auto_132184 ?auto_132186 ) ) ( not ( = ?auto_132185 ?auto_132186 ) ) ( HOLDING ?auto_132187 ) ( CLEAR ?auto_132188 ) ( not ( = ?auto_132182 ?auto_132187 ) ) ( not ( = ?auto_132182 ?auto_132188 ) ) ( not ( = ?auto_132183 ?auto_132187 ) ) ( not ( = ?auto_132183 ?auto_132188 ) ) ( not ( = ?auto_132184 ?auto_132187 ) ) ( not ( = ?auto_132184 ?auto_132188 ) ) ( not ( = ?auto_132185 ?auto_132187 ) ) ( not ( = ?auto_132185 ?auto_132188 ) ) ( not ( = ?auto_132186 ?auto_132187 ) ) ( not ( = ?auto_132186 ?auto_132188 ) ) ( not ( = ?auto_132187 ?auto_132188 ) ) )
    :subtasks
    ( ( !STACK ?auto_132187 ?auto_132188 )
      ( MAKE-4PILE ?auto_132182 ?auto_132183 ?auto_132184 ?auto_132185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132189 - BLOCK
      ?auto_132190 - BLOCK
      ?auto_132191 - BLOCK
      ?auto_132192 - BLOCK
    )
    :vars
    (
      ?auto_132194 - BLOCK
      ?auto_132193 - BLOCK
      ?auto_132195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132194 ?auto_132192 ) ( ON-TABLE ?auto_132189 ) ( ON ?auto_132190 ?auto_132189 ) ( ON ?auto_132191 ?auto_132190 ) ( ON ?auto_132192 ?auto_132191 ) ( not ( = ?auto_132189 ?auto_132190 ) ) ( not ( = ?auto_132189 ?auto_132191 ) ) ( not ( = ?auto_132189 ?auto_132192 ) ) ( not ( = ?auto_132189 ?auto_132194 ) ) ( not ( = ?auto_132190 ?auto_132191 ) ) ( not ( = ?auto_132190 ?auto_132192 ) ) ( not ( = ?auto_132190 ?auto_132194 ) ) ( not ( = ?auto_132191 ?auto_132192 ) ) ( not ( = ?auto_132191 ?auto_132194 ) ) ( not ( = ?auto_132192 ?auto_132194 ) ) ( CLEAR ?auto_132193 ) ( not ( = ?auto_132189 ?auto_132195 ) ) ( not ( = ?auto_132189 ?auto_132193 ) ) ( not ( = ?auto_132190 ?auto_132195 ) ) ( not ( = ?auto_132190 ?auto_132193 ) ) ( not ( = ?auto_132191 ?auto_132195 ) ) ( not ( = ?auto_132191 ?auto_132193 ) ) ( not ( = ?auto_132192 ?auto_132195 ) ) ( not ( = ?auto_132192 ?auto_132193 ) ) ( not ( = ?auto_132194 ?auto_132195 ) ) ( not ( = ?auto_132194 ?auto_132193 ) ) ( not ( = ?auto_132195 ?auto_132193 ) ) ( ON ?auto_132195 ?auto_132194 ) ( CLEAR ?auto_132195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132189 ?auto_132190 ?auto_132191 ?auto_132192 ?auto_132194 )
      ( MAKE-4PILE ?auto_132189 ?auto_132190 ?auto_132191 ?auto_132192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132196 - BLOCK
      ?auto_132197 - BLOCK
      ?auto_132198 - BLOCK
      ?auto_132199 - BLOCK
    )
    :vars
    (
      ?auto_132202 - BLOCK
      ?auto_132201 - BLOCK
      ?auto_132200 - BLOCK
      ?auto_132204 - BLOCK
      ?auto_132203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132202 ?auto_132199 ) ( ON-TABLE ?auto_132196 ) ( ON ?auto_132197 ?auto_132196 ) ( ON ?auto_132198 ?auto_132197 ) ( ON ?auto_132199 ?auto_132198 ) ( not ( = ?auto_132196 ?auto_132197 ) ) ( not ( = ?auto_132196 ?auto_132198 ) ) ( not ( = ?auto_132196 ?auto_132199 ) ) ( not ( = ?auto_132196 ?auto_132202 ) ) ( not ( = ?auto_132197 ?auto_132198 ) ) ( not ( = ?auto_132197 ?auto_132199 ) ) ( not ( = ?auto_132197 ?auto_132202 ) ) ( not ( = ?auto_132198 ?auto_132199 ) ) ( not ( = ?auto_132198 ?auto_132202 ) ) ( not ( = ?auto_132199 ?auto_132202 ) ) ( not ( = ?auto_132196 ?auto_132201 ) ) ( not ( = ?auto_132196 ?auto_132200 ) ) ( not ( = ?auto_132197 ?auto_132201 ) ) ( not ( = ?auto_132197 ?auto_132200 ) ) ( not ( = ?auto_132198 ?auto_132201 ) ) ( not ( = ?auto_132198 ?auto_132200 ) ) ( not ( = ?auto_132199 ?auto_132201 ) ) ( not ( = ?auto_132199 ?auto_132200 ) ) ( not ( = ?auto_132202 ?auto_132201 ) ) ( not ( = ?auto_132202 ?auto_132200 ) ) ( not ( = ?auto_132201 ?auto_132200 ) ) ( ON ?auto_132201 ?auto_132202 ) ( CLEAR ?auto_132201 ) ( HOLDING ?auto_132200 ) ( CLEAR ?auto_132204 ) ( ON-TABLE ?auto_132203 ) ( ON ?auto_132204 ?auto_132203 ) ( not ( = ?auto_132203 ?auto_132204 ) ) ( not ( = ?auto_132203 ?auto_132200 ) ) ( not ( = ?auto_132204 ?auto_132200 ) ) ( not ( = ?auto_132196 ?auto_132204 ) ) ( not ( = ?auto_132196 ?auto_132203 ) ) ( not ( = ?auto_132197 ?auto_132204 ) ) ( not ( = ?auto_132197 ?auto_132203 ) ) ( not ( = ?auto_132198 ?auto_132204 ) ) ( not ( = ?auto_132198 ?auto_132203 ) ) ( not ( = ?auto_132199 ?auto_132204 ) ) ( not ( = ?auto_132199 ?auto_132203 ) ) ( not ( = ?auto_132202 ?auto_132204 ) ) ( not ( = ?auto_132202 ?auto_132203 ) ) ( not ( = ?auto_132201 ?auto_132204 ) ) ( not ( = ?auto_132201 ?auto_132203 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132203 ?auto_132204 ?auto_132200 )
      ( MAKE-4PILE ?auto_132196 ?auto_132197 ?auto_132198 ?auto_132199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132205 - BLOCK
      ?auto_132206 - BLOCK
      ?auto_132207 - BLOCK
      ?auto_132208 - BLOCK
    )
    :vars
    (
      ?auto_132212 - BLOCK
      ?auto_132210 - BLOCK
      ?auto_132213 - BLOCK
      ?auto_132209 - BLOCK
      ?auto_132211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132212 ?auto_132208 ) ( ON-TABLE ?auto_132205 ) ( ON ?auto_132206 ?auto_132205 ) ( ON ?auto_132207 ?auto_132206 ) ( ON ?auto_132208 ?auto_132207 ) ( not ( = ?auto_132205 ?auto_132206 ) ) ( not ( = ?auto_132205 ?auto_132207 ) ) ( not ( = ?auto_132205 ?auto_132208 ) ) ( not ( = ?auto_132205 ?auto_132212 ) ) ( not ( = ?auto_132206 ?auto_132207 ) ) ( not ( = ?auto_132206 ?auto_132208 ) ) ( not ( = ?auto_132206 ?auto_132212 ) ) ( not ( = ?auto_132207 ?auto_132208 ) ) ( not ( = ?auto_132207 ?auto_132212 ) ) ( not ( = ?auto_132208 ?auto_132212 ) ) ( not ( = ?auto_132205 ?auto_132210 ) ) ( not ( = ?auto_132205 ?auto_132213 ) ) ( not ( = ?auto_132206 ?auto_132210 ) ) ( not ( = ?auto_132206 ?auto_132213 ) ) ( not ( = ?auto_132207 ?auto_132210 ) ) ( not ( = ?auto_132207 ?auto_132213 ) ) ( not ( = ?auto_132208 ?auto_132210 ) ) ( not ( = ?auto_132208 ?auto_132213 ) ) ( not ( = ?auto_132212 ?auto_132210 ) ) ( not ( = ?auto_132212 ?auto_132213 ) ) ( not ( = ?auto_132210 ?auto_132213 ) ) ( ON ?auto_132210 ?auto_132212 ) ( CLEAR ?auto_132209 ) ( ON-TABLE ?auto_132211 ) ( ON ?auto_132209 ?auto_132211 ) ( not ( = ?auto_132211 ?auto_132209 ) ) ( not ( = ?auto_132211 ?auto_132213 ) ) ( not ( = ?auto_132209 ?auto_132213 ) ) ( not ( = ?auto_132205 ?auto_132209 ) ) ( not ( = ?auto_132205 ?auto_132211 ) ) ( not ( = ?auto_132206 ?auto_132209 ) ) ( not ( = ?auto_132206 ?auto_132211 ) ) ( not ( = ?auto_132207 ?auto_132209 ) ) ( not ( = ?auto_132207 ?auto_132211 ) ) ( not ( = ?auto_132208 ?auto_132209 ) ) ( not ( = ?auto_132208 ?auto_132211 ) ) ( not ( = ?auto_132212 ?auto_132209 ) ) ( not ( = ?auto_132212 ?auto_132211 ) ) ( not ( = ?auto_132210 ?auto_132209 ) ) ( not ( = ?auto_132210 ?auto_132211 ) ) ( ON ?auto_132213 ?auto_132210 ) ( CLEAR ?auto_132213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132205 ?auto_132206 ?auto_132207 ?auto_132208 ?auto_132212 ?auto_132210 )
      ( MAKE-4PILE ?auto_132205 ?auto_132206 ?auto_132207 ?auto_132208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132214 - BLOCK
      ?auto_132215 - BLOCK
      ?auto_132216 - BLOCK
      ?auto_132217 - BLOCK
    )
    :vars
    (
      ?auto_132220 - BLOCK
      ?auto_132219 - BLOCK
      ?auto_132218 - BLOCK
      ?auto_132222 - BLOCK
      ?auto_132221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132220 ?auto_132217 ) ( ON-TABLE ?auto_132214 ) ( ON ?auto_132215 ?auto_132214 ) ( ON ?auto_132216 ?auto_132215 ) ( ON ?auto_132217 ?auto_132216 ) ( not ( = ?auto_132214 ?auto_132215 ) ) ( not ( = ?auto_132214 ?auto_132216 ) ) ( not ( = ?auto_132214 ?auto_132217 ) ) ( not ( = ?auto_132214 ?auto_132220 ) ) ( not ( = ?auto_132215 ?auto_132216 ) ) ( not ( = ?auto_132215 ?auto_132217 ) ) ( not ( = ?auto_132215 ?auto_132220 ) ) ( not ( = ?auto_132216 ?auto_132217 ) ) ( not ( = ?auto_132216 ?auto_132220 ) ) ( not ( = ?auto_132217 ?auto_132220 ) ) ( not ( = ?auto_132214 ?auto_132219 ) ) ( not ( = ?auto_132214 ?auto_132218 ) ) ( not ( = ?auto_132215 ?auto_132219 ) ) ( not ( = ?auto_132215 ?auto_132218 ) ) ( not ( = ?auto_132216 ?auto_132219 ) ) ( not ( = ?auto_132216 ?auto_132218 ) ) ( not ( = ?auto_132217 ?auto_132219 ) ) ( not ( = ?auto_132217 ?auto_132218 ) ) ( not ( = ?auto_132220 ?auto_132219 ) ) ( not ( = ?auto_132220 ?auto_132218 ) ) ( not ( = ?auto_132219 ?auto_132218 ) ) ( ON ?auto_132219 ?auto_132220 ) ( ON-TABLE ?auto_132222 ) ( not ( = ?auto_132222 ?auto_132221 ) ) ( not ( = ?auto_132222 ?auto_132218 ) ) ( not ( = ?auto_132221 ?auto_132218 ) ) ( not ( = ?auto_132214 ?auto_132221 ) ) ( not ( = ?auto_132214 ?auto_132222 ) ) ( not ( = ?auto_132215 ?auto_132221 ) ) ( not ( = ?auto_132215 ?auto_132222 ) ) ( not ( = ?auto_132216 ?auto_132221 ) ) ( not ( = ?auto_132216 ?auto_132222 ) ) ( not ( = ?auto_132217 ?auto_132221 ) ) ( not ( = ?auto_132217 ?auto_132222 ) ) ( not ( = ?auto_132220 ?auto_132221 ) ) ( not ( = ?auto_132220 ?auto_132222 ) ) ( not ( = ?auto_132219 ?auto_132221 ) ) ( not ( = ?auto_132219 ?auto_132222 ) ) ( ON ?auto_132218 ?auto_132219 ) ( CLEAR ?auto_132218 ) ( HOLDING ?auto_132221 ) ( CLEAR ?auto_132222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132222 ?auto_132221 )
      ( MAKE-4PILE ?auto_132214 ?auto_132215 ?auto_132216 ?auto_132217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133916 - BLOCK
      ?auto_133917 - BLOCK
      ?auto_133918 - BLOCK
      ?auto_133919 - BLOCK
    )
    :vars
    (
      ?auto_133922 - BLOCK
      ?auto_133921 - BLOCK
      ?auto_133920 - BLOCK
      ?auto_133923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133922 ?auto_133919 ) ( ON-TABLE ?auto_133916 ) ( ON ?auto_133917 ?auto_133916 ) ( ON ?auto_133918 ?auto_133917 ) ( ON ?auto_133919 ?auto_133918 ) ( not ( = ?auto_133916 ?auto_133917 ) ) ( not ( = ?auto_133916 ?auto_133918 ) ) ( not ( = ?auto_133916 ?auto_133919 ) ) ( not ( = ?auto_133916 ?auto_133922 ) ) ( not ( = ?auto_133917 ?auto_133918 ) ) ( not ( = ?auto_133917 ?auto_133919 ) ) ( not ( = ?auto_133917 ?auto_133922 ) ) ( not ( = ?auto_133918 ?auto_133919 ) ) ( not ( = ?auto_133918 ?auto_133922 ) ) ( not ( = ?auto_133919 ?auto_133922 ) ) ( not ( = ?auto_133916 ?auto_133921 ) ) ( not ( = ?auto_133916 ?auto_133920 ) ) ( not ( = ?auto_133917 ?auto_133921 ) ) ( not ( = ?auto_133917 ?auto_133920 ) ) ( not ( = ?auto_133918 ?auto_133921 ) ) ( not ( = ?auto_133918 ?auto_133920 ) ) ( not ( = ?auto_133919 ?auto_133921 ) ) ( not ( = ?auto_133919 ?auto_133920 ) ) ( not ( = ?auto_133922 ?auto_133921 ) ) ( not ( = ?auto_133922 ?auto_133920 ) ) ( not ( = ?auto_133921 ?auto_133920 ) ) ( ON ?auto_133921 ?auto_133922 ) ( not ( = ?auto_133923 ?auto_133920 ) ) ( not ( = ?auto_133916 ?auto_133923 ) ) ( not ( = ?auto_133917 ?auto_133923 ) ) ( not ( = ?auto_133918 ?auto_133923 ) ) ( not ( = ?auto_133919 ?auto_133923 ) ) ( not ( = ?auto_133922 ?auto_133923 ) ) ( not ( = ?auto_133921 ?auto_133923 ) ) ( ON ?auto_133920 ?auto_133921 ) ( ON ?auto_133923 ?auto_133920 ) ( CLEAR ?auto_133923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133916 ?auto_133917 ?auto_133918 ?auto_133919 ?auto_133922 ?auto_133921 ?auto_133920 )
      ( MAKE-4PILE ?auto_133916 ?auto_133917 ?auto_133918 ?auto_133919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132232 - BLOCK
      ?auto_132233 - BLOCK
      ?auto_132234 - BLOCK
      ?auto_132235 - BLOCK
    )
    :vars
    (
      ?auto_132240 - BLOCK
      ?auto_132237 - BLOCK
      ?auto_132236 - BLOCK
      ?auto_132239 - BLOCK
      ?auto_132238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132240 ?auto_132235 ) ( ON-TABLE ?auto_132232 ) ( ON ?auto_132233 ?auto_132232 ) ( ON ?auto_132234 ?auto_132233 ) ( ON ?auto_132235 ?auto_132234 ) ( not ( = ?auto_132232 ?auto_132233 ) ) ( not ( = ?auto_132232 ?auto_132234 ) ) ( not ( = ?auto_132232 ?auto_132235 ) ) ( not ( = ?auto_132232 ?auto_132240 ) ) ( not ( = ?auto_132233 ?auto_132234 ) ) ( not ( = ?auto_132233 ?auto_132235 ) ) ( not ( = ?auto_132233 ?auto_132240 ) ) ( not ( = ?auto_132234 ?auto_132235 ) ) ( not ( = ?auto_132234 ?auto_132240 ) ) ( not ( = ?auto_132235 ?auto_132240 ) ) ( not ( = ?auto_132232 ?auto_132237 ) ) ( not ( = ?auto_132232 ?auto_132236 ) ) ( not ( = ?auto_132233 ?auto_132237 ) ) ( not ( = ?auto_132233 ?auto_132236 ) ) ( not ( = ?auto_132234 ?auto_132237 ) ) ( not ( = ?auto_132234 ?auto_132236 ) ) ( not ( = ?auto_132235 ?auto_132237 ) ) ( not ( = ?auto_132235 ?auto_132236 ) ) ( not ( = ?auto_132240 ?auto_132237 ) ) ( not ( = ?auto_132240 ?auto_132236 ) ) ( not ( = ?auto_132237 ?auto_132236 ) ) ( ON ?auto_132237 ?auto_132240 ) ( not ( = ?auto_132239 ?auto_132238 ) ) ( not ( = ?auto_132239 ?auto_132236 ) ) ( not ( = ?auto_132238 ?auto_132236 ) ) ( not ( = ?auto_132232 ?auto_132238 ) ) ( not ( = ?auto_132232 ?auto_132239 ) ) ( not ( = ?auto_132233 ?auto_132238 ) ) ( not ( = ?auto_132233 ?auto_132239 ) ) ( not ( = ?auto_132234 ?auto_132238 ) ) ( not ( = ?auto_132234 ?auto_132239 ) ) ( not ( = ?auto_132235 ?auto_132238 ) ) ( not ( = ?auto_132235 ?auto_132239 ) ) ( not ( = ?auto_132240 ?auto_132238 ) ) ( not ( = ?auto_132240 ?auto_132239 ) ) ( not ( = ?auto_132237 ?auto_132238 ) ) ( not ( = ?auto_132237 ?auto_132239 ) ) ( ON ?auto_132236 ?auto_132237 ) ( ON ?auto_132238 ?auto_132236 ) ( CLEAR ?auto_132238 ) ( HOLDING ?auto_132239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132239 )
      ( MAKE-4PILE ?auto_132232 ?auto_132233 ?auto_132234 ?auto_132235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132241 - BLOCK
      ?auto_132242 - BLOCK
      ?auto_132243 - BLOCK
      ?auto_132244 - BLOCK
    )
    :vars
    (
      ?auto_132248 - BLOCK
      ?auto_132247 - BLOCK
      ?auto_132249 - BLOCK
      ?auto_132246 - BLOCK
      ?auto_132245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132248 ?auto_132244 ) ( ON-TABLE ?auto_132241 ) ( ON ?auto_132242 ?auto_132241 ) ( ON ?auto_132243 ?auto_132242 ) ( ON ?auto_132244 ?auto_132243 ) ( not ( = ?auto_132241 ?auto_132242 ) ) ( not ( = ?auto_132241 ?auto_132243 ) ) ( not ( = ?auto_132241 ?auto_132244 ) ) ( not ( = ?auto_132241 ?auto_132248 ) ) ( not ( = ?auto_132242 ?auto_132243 ) ) ( not ( = ?auto_132242 ?auto_132244 ) ) ( not ( = ?auto_132242 ?auto_132248 ) ) ( not ( = ?auto_132243 ?auto_132244 ) ) ( not ( = ?auto_132243 ?auto_132248 ) ) ( not ( = ?auto_132244 ?auto_132248 ) ) ( not ( = ?auto_132241 ?auto_132247 ) ) ( not ( = ?auto_132241 ?auto_132249 ) ) ( not ( = ?auto_132242 ?auto_132247 ) ) ( not ( = ?auto_132242 ?auto_132249 ) ) ( not ( = ?auto_132243 ?auto_132247 ) ) ( not ( = ?auto_132243 ?auto_132249 ) ) ( not ( = ?auto_132244 ?auto_132247 ) ) ( not ( = ?auto_132244 ?auto_132249 ) ) ( not ( = ?auto_132248 ?auto_132247 ) ) ( not ( = ?auto_132248 ?auto_132249 ) ) ( not ( = ?auto_132247 ?auto_132249 ) ) ( ON ?auto_132247 ?auto_132248 ) ( not ( = ?auto_132246 ?auto_132245 ) ) ( not ( = ?auto_132246 ?auto_132249 ) ) ( not ( = ?auto_132245 ?auto_132249 ) ) ( not ( = ?auto_132241 ?auto_132245 ) ) ( not ( = ?auto_132241 ?auto_132246 ) ) ( not ( = ?auto_132242 ?auto_132245 ) ) ( not ( = ?auto_132242 ?auto_132246 ) ) ( not ( = ?auto_132243 ?auto_132245 ) ) ( not ( = ?auto_132243 ?auto_132246 ) ) ( not ( = ?auto_132244 ?auto_132245 ) ) ( not ( = ?auto_132244 ?auto_132246 ) ) ( not ( = ?auto_132248 ?auto_132245 ) ) ( not ( = ?auto_132248 ?auto_132246 ) ) ( not ( = ?auto_132247 ?auto_132245 ) ) ( not ( = ?auto_132247 ?auto_132246 ) ) ( ON ?auto_132249 ?auto_132247 ) ( ON ?auto_132245 ?auto_132249 ) ( ON ?auto_132246 ?auto_132245 ) ( CLEAR ?auto_132246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132241 ?auto_132242 ?auto_132243 ?auto_132244 ?auto_132248 ?auto_132247 ?auto_132249 ?auto_132245 )
      ( MAKE-4PILE ?auto_132241 ?auto_132242 ?auto_132243 ?auto_132244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132255 - BLOCK
      ?auto_132256 - BLOCK
      ?auto_132257 - BLOCK
      ?auto_132258 - BLOCK
      ?auto_132259 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132259 ) ( CLEAR ?auto_132258 ) ( ON-TABLE ?auto_132255 ) ( ON ?auto_132256 ?auto_132255 ) ( ON ?auto_132257 ?auto_132256 ) ( ON ?auto_132258 ?auto_132257 ) ( not ( = ?auto_132255 ?auto_132256 ) ) ( not ( = ?auto_132255 ?auto_132257 ) ) ( not ( = ?auto_132255 ?auto_132258 ) ) ( not ( = ?auto_132255 ?auto_132259 ) ) ( not ( = ?auto_132256 ?auto_132257 ) ) ( not ( = ?auto_132256 ?auto_132258 ) ) ( not ( = ?auto_132256 ?auto_132259 ) ) ( not ( = ?auto_132257 ?auto_132258 ) ) ( not ( = ?auto_132257 ?auto_132259 ) ) ( not ( = ?auto_132258 ?auto_132259 ) ) )
    :subtasks
    ( ( !STACK ?auto_132259 ?auto_132258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132260 - BLOCK
      ?auto_132261 - BLOCK
      ?auto_132262 - BLOCK
      ?auto_132263 - BLOCK
      ?auto_132264 - BLOCK
    )
    :vars
    (
      ?auto_132265 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132263 ) ( ON-TABLE ?auto_132260 ) ( ON ?auto_132261 ?auto_132260 ) ( ON ?auto_132262 ?auto_132261 ) ( ON ?auto_132263 ?auto_132262 ) ( not ( = ?auto_132260 ?auto_132261 ) ) ( not ( = ?auto_132260 ?auto_132262 ) ) ( not ( = ?auto_132260 ?auto_132263 ) ) ( not ( = ?auto_132260 ?auto_132264 ) ) ( not ( = ?auto_132261 ?auto_132262 ) ) ( not ( = ?auto_132261 ?auto_132263 ) ) ( not ( = ?auto_132261 ?auto_132264 ) ) ( not ( = ?auto_132262 ?auto_132263 ) ) ( not ( = ?auto_132262 ?auto_132264 ) ) ( not ( = ?auto_132263 ?auto_132264 ) ) ( ON ?auto_132264 ?auto_132265 ) ( CLEAR ?auto_132264 ) ( HAND-EMPTY ) ( not ( = ?auto_132260 ?auto_132265 ) ) ( not ( = ?auto_132261 ?auto_132265 ) ) ( not ( = ?auto_132262 ?auto_132265 ) ) ( not ( = ?auto_132263 ?auto_132265 ) ) ( not ( = ?auto_132264 ?auto_132265 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132264 ?auto_132265 )
      ( MAKE-5PILE ?auto_132260 ?auto_132261 ?auto_132262 ?auto_132263 ?auto_132264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132266 - BLOCK
      ?auto_132267 - BLOCK
      ?auto_132268 - BLOCK
      ?auto_132269 - BLOCK
      ?auto_132270 - BLOCK
    )
    :vars
    (
      ?auto_132271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132266 ) ( ON ?auto_132267 ?auto_132266 ) ( ON ?auto_132268 ?auto_132267 ) ( not ( = ?auto_132266 ?auto_132267 ) ) ( not ( = ?auto_132266 ?auto_132268 ) ) ( not ( = ?auto_132266 ?auto_132269 ) ) ( not ( = ?auto_132266 ?auto_132270 ) ) ( not ( = ?auto_132267 ?auto_132268 ) ) ( not ( = ?auto_132267 ?auto_132269 ) ) ( not ( = ?auto_132267 ?auto_132270 ) ) ( not ( = ?auto_132268 ?auto_132269 ) ) ( not ( = ?auto_132268 ?auto_132270 ) ) ( not ( = ?auto_132269 ?auto_132270 ) ) ( ON ?auto_132270 ?auto_132271 ) ( CLEAR ?auto_132270 ) ( not ( = ?auto_132266 ?auto_132271 ) ) ( not ( = ?auto_132267 ?auto_132271 ) ) ( not ( = ?auto_132268 ?auto_132271 ) ) ( not ( = ?auto_132269 ?auto_132271 ) ) ( not ( = ?auto_132270 ?auto_132271 ) ) ( HOLDING ?auto_132269 ) ( CLEAR ?auto_132268 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132266 ?auto_132267 ?auto_132268 ?auto_132269 )
      ( MAKE-5PILE ?auto_132266 ?auto_132267 ?auto_132268 ?auto_132269 ?auto_132270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132272 - BLOCK
      ?auto_132273 - BLOCK
      ?auto_132274 - BLOCK
      ?auto_132275 - BLOCK
      ?auto_132276 - BLOCK
    )
    :vars
    (
      ?auto_132277 - BLOCK
      ?auto_132279 - BLOCK
      ?auto_132280 - BLOCK
      ?auto_132278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132272 ) ( ON ?auto_132273 ?auto_132272 ) ( ON ?auto_132274 ?auto_132273 ) ( not ( = ?auto_132272 ?auto_132273 ) ) ( not ( = ?auto_132272 ?auto_132274 ) ) ( not ( = ?auto_132272 ?auto_132275 ) ) ( not ( = ?auto_132272 ?auto_132276 ) ) ( not ( = ?auto_132273 ?auto_132274 ) ) ( not ( = ?auto_132273 ?auto_132275 ) ) ( not ( = ?auto_132273 ?auto_132276 ) ) ( not ( = ?auto_132274 ?auto_132275 ) ) ( not ( = ?auto_132274 ?auto_132276 ) ) ( not ( = ?auto_132275 ?auto_132276 ) ) ( ON ?auto_132276 ?auto_132277 ) ( not ( = ?auto_132272 ?auto_132277 ) ) ( not ( = ?auto_132273 ?auto_132277 ) ) ( not ( = ?auto_132274 ?auto_132277 ) ) ( not ( = ?auto_132275 ?auto_132277 ) ) ( not ( = ?auto_132276 ?auto_132277 ) ) ( CLEAR ?auto_132274 ) ( ON ?auto_132275 ?auto_132276 ) ( CLEAR ?auto_132275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132279 ) ( ON ?auto_132280 ?auto_132279 ) ( ON ?auto_132278 ?auto_132280 ) ( ON ?auto_132277 ?auto_132278 ) ( not ( = ?auto_132279 ?auto_132280 ) ) ( not ( = ?auto_132279 ?auto_132278 ) ) ( not ( = ?auto_132279 ?auto_132277 ) ) ( not ( = ?auto_132279 ?auto_132276 ) ) ( not ( = ?auto_132279 ?auto_132275 ) ) ( not ( = ?auto_132280 ?auto_132278 ) ) ( not ( = ?auto_132280 ?auto_132277 ) ) ( not ( = ?auto_132280 ?auto_132276 ) ) ( not ( = ?auto_132280 ?auto_132275 ) ) ( not ( = ?auto_132278 ?auto_132277 ) ) ( not ( = ?auto_132278 ?auto_132276 ) ) ( not ( = ?auto_132278 ?auto_132275 ) ) ( not ( = ?auto_132272 ?auto_132279 ) ) ( not ( = ?auto_132272 ?auto_132280 ) ) ( not ( = ?auto_132272 ?auto_132278 ) ) ( not ( = ?auto_132273 ?auto_132279 ) ) ( not ( = ?auto_132273 ?auto_132280 ) ) ( not ( = ?auto_132273 ?auto_132278 ) ) ( not ( = ?auto_132274 ?auto_132279 ) ) ( not ( = ?auto_132274 ?auto_132280 ) ) ( not ( = ?auto_132274 ?auto_132278 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132279 ?auto_132280 ?auto_132278 ?auto_132277 ?auto_132276 )
      ( MAKE-5PILE ?auto_132272 ?auto_132273 ?auto_132274 ?auto_132275 ?auto_132276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132281 - BLOCK
      ?auto_132282 - BLOCK
      ?auto_132283 - BLOCK
      ?auto_132284 - BLOCK
      ?auto_132285 - BLOCK
    )
    :vars
    (
      ?auto_132289 - BLOCK
      ?auto_132286 - BLOCK
      ?auto_132288 - BLOCK
      ?auto_132287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132281 ) ( ON ?auto_132282 ?auto_132281 ) ( not ( = ?auto_132281 ?auto_132282 ) ) ( not ( = ?auto_132281 ?auto_132283 ) ) ( not ( = ?auto_132281 ?auto_132284 ) ) ( not ( = ?auto_132281 ?auto_132285 ) ) ( not ( = ?auto_132282 ?auto_132283 ) ) ( not ( = ?auto_132282 ?auto_132284 ) ) ( not ( = ?auto_132282 ?auto_132285 ) ) ( not ( = ?auto_132283 ?auto_132284 ) ) ( not ( = ?auto_132283 ?auto_132285 ) ) ( not ( = ?auto_132284 ?auto_132285 ) ) ( ON ?auto_132285 ?auto_132289 ) ( not ( = ?auto_132281 ?auto_132289 ) ) ( not ( = ?auto_132282 ?auto_132289 ) ) ( not ( = ?auto_132283 ?auto_132289 ) ) ( not ( = ?auto_132284 ?auto_132289 ) ) ( not ( = ?auto_132285 ?auto_132289 ) ) ( ON ?auto_132284 ?auto_132285 ) ( CLEAR ?auto_132284 ) ( ON-TABLE ?auto_132286 ) ( ON ?auto_132288 ?auto_132286 ) ( ON ?auto_132287 ?auto_132288 ) ( ON ?auto_132289 ?auto_132287 ) ( not ( = ?auto_132286 ?auto_132288 ) ) ( not ( = ?auto_132286 ?auto_132287 ) ) ( not ( = ?auto_132286 ?auto_132289 ) ) ( not ( = ?auto_132286 ?auto_132285 ) ) ( not ( = ?auto_132286 ?auto_132284 ) ) ( not ( = ?auto_132288 ?auto_132287 ) ) ( not ( = ?auto_132288 ?auto_132289 ) ) ( not ( = ?auto_132288 ?auto_132285 ) ) ( not ( = ?auto_132288 ?auto_132284 ) ) ( not ( = ?auto_132287 ?auto_132289 ) ) ( not ( = ?auto_132287 ?auto_132285 ) ) ( not ( = ?auto_132287 ?auto_132284 ) ) ( not ( = ?auto_132281 ?auto_132286 ) ) ( not ( = ?auto_132281 ?auto_132288 ) ) ( not ( = ?auto_132281 ?auto_132287 ) ) ( not ( = ?auto_132282 ?auto_132286 ) ) ( not ( = ?auto_132282 ?auto_132288 ) ) ( not ( = ?auto_132282 ?auto_132287 ) ) ( not ( = ?auto_132283 ?auto_132286 ) ) ( not ( = ?auto_132283 ?auto_132288 ) ) ( not ( = ?auto_132283 ?auto_132287 ) ) ( HOLDING ?auto_132283 ) ( CLEAR ?auto_132282 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132281 ?auto_132282 ?auto_132283 )
      ( MAKE-5PILE ?auto_132281 ?auto_132282 ?auto_132283 ?auto_132284 ?auto_132285 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132290 - BLOCK
      ?auto_132291 - BLOCK
      ?auto_132292 - BLOCK
      ?auto_132293 - BLOCK
      ?auto_132294 - BLOCK
    )
    :vars
    (
      ?auto_132298 - BLOCK
      ?auto_132295 - BLOCK
      ?auto_132297 - BLOCK
      ?auto_132296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132290 ) ( ON ?auto_132291 ?auto_132290 ) ( not ( = ?auto_132290 ?auto_132291 ) ) ( not ( = ?auto_132290 ?auto_132292 ) ) ( not ( = ?auto_132290 ?auto_132293 ) ) ( not ( = ?auto_132290 ?auto_132294 ) ) ( not ( = ?auto_132291 ?auto_132292 ) ) ( not ( = ?auto_132291 ?auto_132293 ) ) ( not ( = ?auto_132291 ?auto_132294 ) ) ( not ( = ?auto_132292 ?auto_132293 ) ) ( not ( = ?auto_132292 ?auto_132294 ) ) ( not ( = ?auto_132293 ?auto_132294 ) ) ( ON ?auto_132294 ?auto_132298 ) ( not ( = ?auto_132290 ?auto_132298 ) ) ( not ( = ?auto_132291 ?auto_132298 ) ) ( not ( = ?auto_132292 ?auto_132298 ) ) ( not ( = ?auto_132293 ?auto_132298 ) ) ( not ( = ?auto_132294 ?auto_132298 ) ) ( ON ?auto_132293 ?auto_132294 ) ( ON-TABLE ?auto_132295 ) ( ON ?auto_132297 ?auto_132295 ) ( ON ?auto_132296 ?auto_132297 ) ( ON ?auto_132298 ?auto_132296 ) ( not ( = ?auto_132295 ?auto_132297 ) ) ( not ( = ?auto_132295 ?auto_132296 ) ) ( not ( = ?auto_132295 ?auto_132298 ) ) ( not ( = ?auto_132295 ?auto_132294 ) ) ( not ( = ?auto_132295 ?auto_132293 ) ) ( not ( = ?auto_132297 ?auto_132296 ) ) ( not ( = ?auto_132297 ?auto_132298 ) ) ( not ( = ?auto_132297 ?auto_132294 ) ) ( not ( = ?auto_132297 ?auto_132293 ) ) ( not ( = ?auto_132296 ?auto_132298 ) ) ( not ( = ?auto_132296 ?auto_132294 ) ) ( not ( = ?auto_132296 ?auto_132293 ) ) ( not ( = ?auto_132290 ?auto_132295 ) ) ( not ( = ?auto_132290 ?auto_132297 ) ) ( not ( = ?auto_132290 ?auto_132296 ) ) ( not ( = ?auto_132291 ?auto_132295 ) ) ( not ( = ?auto_132291 ?auto_132297 ) ) ( not ( = ?auto_132291 ?auto_132296 ) ) ( not ( = ?auto_132292 ?auto_132295 ) ) ( not ( = ?auto_132292 ?auto_132297 ) ) ( not ( = ?auto_132292 ?auto_132296 ) ) ( CLEAR ?auto_132291 ) ( ON ?auto_132292 ?auto_132293 ) ( CLEAR ?auto_132292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132295 ?auto_132297 ?auto_132296 ?auto_132298 ?auto_132294 ?auto_132293 )
      ( MAKE-5PILE ?auto_132290 ?auto_132291 ?auto_132292 ?auto_132293 ?auto_132294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132299 - BLOCK
      ?auto_132300 - BLOCK
      ?auto_132301 - BLOCK
      ?auto_132302 - BLOCK
      ?auto_132303 - BLOCK
    )
    :vars
    (
      ?auto_132307 - BLOCK
      ?auto_132306 - BLOCK
      ?auto_132304 - BLOCK
      ?auto_132305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132299 ) ( not ( = ?auto_132299 ?auto_132300 ) ) ( not ( = ?auto_132299 ?auto_132301 ) ) ( not ( = ?auto_132299 ?auto_132302 ) ) ( not ( = ?auto_132299 ?auto_132303 ) ) ( not ( = ?auto_132300 ?auto_132301 ) ) ( not ( = ?auto_132300 ?auto_132302 ) ) ( not ( = ?auto_132300 ?auto_132303 ) ) ( not ( = ?auto_132301 ?auto_132302 ) ) ( not ( = ?auto_132301 ?auto_132303 ) ) ( not ( = ?auto_132302 ?auto_132303 ) ) ( ON ?auto_132303 ?auto_132307 ) ( not ( = ?auto_132299 ?auto_132307 ) ) ( not ( = ?auto_132300 ?auto_132307 ) ) ( not ( = ?auto_132301 ?auto_132307 ) ) ( not ( = ?auto_132302 ?auto_132307 ) ) ( not ( = ?auto_132303 ?auto_132307 ) ) ( ON ?auto_132302 ?auto_132303 ) ( ON-TABLE ?auto_132306 ) ( ON ?auto_132304 ?auto_132306 ) ( ON ?auto_132305 ?auto_132304 ) ( ON ?auto_132307 ?auto_132305 ) ( not ( = ?auto_132306 ?auto_132304 ) ) ( not ( = ?auto_132306 ?auto_132305 ) ) ( not ( = ?auto_132306 ?auto_132307 ) ) ( not ( = ?auto_132306 ?auto_132303 ) ) ( not ( = ?auto_132306 ?auto_132302 ) ) ( not ( = ?auto_132304 ?auto_132305 ) ) ( not ( = ?auto_132304 ?auto_132307 ) ) ( not ( = ?auto_132304 ?auto_132303 ) ) ( not ( = ?auto_132304 ?auto_132302 ) ) ( not ( = ?auto_132305 ?auto_132307 ) ) ( not ( = ?auto_132305 ?auto_132303 ) ) ( not ( = ?auto_132305 ?auto_132302 ) ) ( not ( = ?auto_132299 ?auto_132306 ) ) ( not ( = ?auto_132299 ?auto_132304 ) ) ( not ( = ?auto_132299 ?auto_132305 ) ) ( not ( = ?auto_132300 ?auto_132306 ) ) ( not ( = ?auto_132300 ?auto_132304 ) ) ( not ( = ?auto_132300 ?auto_132305 ) ) ( not ( = ?auto_132301 ?auto_132306 ) ) ( not ( = ?auto_132301 ?auto_132304 ) ) ( not ( = ?auto_132301 ?auto_132305 ) ) ( ON ?auto_132301 ?auto_132302 ) ( CLEAR ?auto_132301 ) ( HOLDING ?auto_132300 ) ( CLEAR ?auto_132299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132299 ?auto_132300 )
      ( MAKE-5PILE ?auto_132299 ?auto_132300 ?auto_132301 ?auto_132302 ?auto_132303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132308 - BLOCK
      ?auto_132309 - BLOCK
      ?auto_132310 - BLOCK
      ?auto_132311 - BLOCK
      ?auto_132312 - BLOCK
    )
    :vars
    (
      ?auto_132314 - BLOCK
      ?auto_132316 - BLOCK
      ?auto_132313 - BLOCK
      ?auto_132315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132308 ) ( not ( = ?auto_132308 ?auto_132309 ) ) ( not ( = ?auto_132308 ?auto_132310 ) ) ( not ( = ?auto_132308 ?auto_132311 ) ) ( not ( = ?auto_132308 ?auto_132312 ) ) ( not ( = ?auto_132309 ?auto_132310 ) ) ( not ( = ?auto_132309 ?auto_132311 ) ) ( not ( = ?auto_132309 ?auto_132312 ) ) ( not ( = ?auto_132310 ?auto_132311 ) ) ( not ( = ?auto_132310 ?auto_132312 ) ) ( not ( = ?auto_132311 ?auto_132312 ) ) ( ON ?auto_132312 ?auto_132314 ) ( not ( = ?auto_132308 ?auto_132314 ) ) ( not ( = ?auto_132309 ?auto_132314 ) ) ( not ( = ?auto_132310 ?auto_132314 ) ) ( not ( = ?auto_132311 ?auto_132314 ) ) ( not ( = ?auto_132312 ?auto_132314 ) ) ( ON ?auto_132311 ?auto_132312 ) ( ON-TABLE ?auto_132316 ) ( ON ?auto_132313 ?auto_132316 ) ( ON ?auto_132315 ?auto_132313 ) ( ON ?auto_132314 ?auto_132315 ) ( not ( = ?auto_132316 ?auto_132313 ) ) ( not ( = ?auto_132316 ?auto_132315 ) ) ( not ( = ?auto_132316 ?auto_132314 ) ) ( not ( = ?auto_132316 ?auto_132312 ) ) ( not ( = ?auto_132316 ?auto_132311 ) ) ( not ( = ?auto_132313 ?auto_132315 ) ) ( not ( = ?auto_132313 ?auto_132314 ) ) ( not ( = ?auto_132313 ?auto_132312 ) ) ( not ( = ?auto_132313 ?auto_132311 ) ) ( not ( = ?auto_132315 ?auto_132314 ) ) ( not ( = ?auto_132315 ?auto_132312 ) ) ( not ( = ?auto_132315 ?auto_132311 ) ) ( not ( = ?auto_132308 ?auto_132316 ) ) ( not ( = ?auto_132308 ?auto_132313 ) ) ( not ( = ?auto_132308 ?auto_132315 ) ) ( not ( = ?auto_132309 ?auto_132316 ) ) ( not ( = ?auto_132309 ?auto_132313 ) ) ( not ( = ?auto_132309 ?auto_132315 ) ) ( not ( = ?auto_132310 ?auto_132316 ) ) ( not ( = ?auto_132310 ?auto_132313 ) ) ( not ( = ?auto_132310 ?auto_132315 ) ) ( ON ?auto_132310 ?auto_132311 ) ( CLEAR ?auto_132308 ) ( ON ?auto_132309 ?auto_132310 ) ( CLEAR ?auto_132309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132316 ?auto_132313 ?auto_132315 ?auto_132314 ?auto_132312 ?auto_132311 ?auto_132310 )
      ( MAKE-5PILE ?auto_132308 ?auto_132309 ?auto_132310 ?auto_132311 ?auto_132312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132317 - BLOCK
      ?auto_132318 - BLOCK
      ?auto_132319 - BLOCK
      ?auto_132320 - BLOCK
      ?auto_132321 - BLOCK
    )
    :vars
    (
      ?auto_132323 - BLOCK
      ?auto_132322 - BLOCK
      ?auto_132324 - BLOCK
      ?auto_132325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132317 ?auto_132318 ) ) ( not ( = ?auto_132317 ?auto_132319 ) ) ( not ( = ?auto_132317 ?auto_132320 ) ) ( not ( = ?auto_132317 ?auto_132321 ) ) ( not ( = ?auto_132318 ?auto_132319 ) ) ( not ( = ?auto_132318 ?auto_132320 ) ) ( not ( = ?auto_132318 ?auto_132321 ) ) ( not ( = ?auto_132319 ?auto_132320 ) ) ( not ( = ?auto_132319 ?auto_132321 ) ) ( not ( = ?auto_132320 ?auto_132321 ) ) ( ON ?auto_132321 ?auto_132323 ) ( not ( = ?auto_132317 ?auto_132323 ) ) ( not ( = ?auto_132318 ?auto_132323 ) ) ( not ( = ?auto_132319 ?auto_132323 ) ) ( not ( = ?auto_132320 ?auto_132323 ) ) ( not ( = ?auto_132321 ?auto_132323 ) ) ( ON ?auto_132320 ?auto_132321 ) ( ON-TABLE ?auto_132322 ) ( ON ?auto_132324 ?auto_132322 ) ( ON ?auto_132325 ?auto_132324 ) ( ON ?auto_132323 ?auto_132325 ) ( not ( = ?auto_132322 ?auto_132324 ) ) ( not ( = ?auto_132322 ?auto_132325 ) ) ( not ( = ?auto_132322 ?auto_132323 ) ) ( not ( = ?auto_132322 ?auto_132321 ) ) ( not ( = ?auto_132322 ?auto_132320 ) ) ( not ( = ?auto_132324 ?auto_132325 ) ) ( not ( = ?auto_132324 ?auto_132323 ) ) ( not ( = ?auto_132324 ?auto_132321 ) ) ( not ( = ?auto_132324 ?auto_132320 ) ) ( not ( = ?auto_132325 ?auto_132323 ) ) ( not ( = ?auto_132325 ?auto_132321 ) ) ( not ( = ?auto_132325 ?auto_132320 ) ) ( not ( = ?auto_132317 ?auto_132322 ) ) ( not ( = ?auto_132317 ?auto_132324 ) ) ( not ( = ?auto_132317 ?auto_132325 ) ) ( not ( = ?auto_132318 ?auto_132322 ) ) ( not ( = ?auto_132318 ?auto_132324 ) ) ( not ( = ?auto_132318 ?auto_132325 ) ) ( not ( = ?auto_132319 ?auto_132322 ) ) ( not ( = ?auto_132319 ?auto_132324 ) ) ( not ( = ?auto_132319 ?auto_132325 ) ) ( ON ?auto_132319 ?auto_132320 ) ( ON ?auto_132318 ?auto_132319 ) ( CLEAR ?auto_132318 ) ( HOLDING ?auto_132317 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132317 )
      ( MAKE-5PILE ?auto_132317 ?auto_132318 ?auto_132319 ?auto_132320 ?auto_132321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132326 - BLOCK
      ?auto_132327 - BLOCK
      ?auto_132328 - BLOCK
      ?auto_132329 - BLOCK
      ?auto_132330 - BLOCK
    )
    :vars
    (
      ?auto_132334 - BLOCK
      ?auto_132331 - BLOCK
      ?auto_132333 - BLOCK
      ?auto_132332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132326 ?auto_132327 ) ) ( not ( = ?auto_132326 ?auto_132328 ) ) ( not ( = ?auto_132326 ?auto_132329 ) ) ( not ( = ?auto_132326 ?auto_132330 ) ) ( not ( = ?auto_132327 ?auto_132328 ) ) ( not ( = ?auto_132327 ?auto_132329 ) ) ( not ( = ?auto_132327 ?auto_132330 ) ) ( not ( = ?auto_132328 ?auto_132329 ) ) ( not ( = ?auto_132328 ?auto_132330 ) ) ( not ( = ?auto_132329 ?auto_132330 ) ) ( ON ?auto_132330 ?auto_132334 ) ( not ( = ?auto_132326 ?auto_132334 ) ) ( not ( = ?auto_132327 ?auto_132334 ) ) ( not ( = ?auto_132328 ?auto_132334 ) ) ( not ( = ?auto_132329 ?auto_132334 ) ) ( not ( = ?auto_132330 ?auto_132334 ) ) ( ON ?auto_132329 ?auto_132330 ) ( ON-TABLE ?auto_132331 ) ( ON ?auto_132333 ?auto_132331 ) ( ON ?auto_132332 ?auto_132333 ) ( ON ?auto_132334 ?auto_132332 ) ( not ( = ?auto_132331 ?auto_132333 ) ) ( not ( = ?auto_132331 ?auto_132332 ) ) ( not ( = ?auto_132331 ?auto_132334 ) ) ( not ( = ?auto_132331 ?auto_132330 ) ) ( not ( = ?auto_132331 ?auto_132329 ) ) ( not ( = ?auto_132333 ?auto_132332 ) ) ( not ( = ?auto_132333 ?auto_132334 ) ) ( not ( = ?auto_132333 ?auto_132330 ) ) ( not ( = ?auto_132333 ?auto_132329 ) ) ( not ( = ?auto_132332 ?auto_132334 ) ) ( not ( = ?auto_132332 ?auto_132330 ) ) ( not ( = ?auto_132332 ?auto_132329 ) ) ( not ( = ?auto_132326 ?auto_132331 ) ) ( not ( = ?auto_132326 ?auto_132333 ) ) ( not ( = ?auto_132326 ?auto_132332 ) ) ( not ( = ?auto_132327 ?auto_132331 ) ) ( not ( = ?auto_132327 ?auto_132333 ) ) ( not ( = ?auto_132327 ?auto_132332 ) ) ( not ( = ?auto_132328 ?auto_132331 ) ) ( not ( = ?auto_132328 ?auto_132333 ) ) ( not ( = ?auto_132328 ?auto_132332 ) ) ( ON ?auto_132328 ?auto_132329 ) ( ON ?auto_132327 ?auto_132328 ) ( ON ?auto_132326 ?auto_132327 ) ( CLEAR ?auto_132326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132331 ?auto_132333 ?auto_132332 ?auto_132334 ?auto_132330 ?auto_132329 ?auto_132328 ?auto_132327 )
      ( MAKE-5PILE ?auto_132326 ?auto_132327 ?auto_132328 ?auto_132329 ?auto_132330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132338 - BLOCK
      ?auto_132339 - BLOCK
      ?auto_132340 - BLOCK
    )
    :vars
    (
      ?auto_132341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132341 ?auto_132340 ) ( CLEAR ?auto_132341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132338 ) ( ON ?auto_132339 ?auto_132338 ) ( ON ?auto_132340 ?auto_132339 ) ( not ( = ?auto_132338 ?auto_132339 ) ) ( not ( = ?auto_132338 ?auto_132340 ) ) ( not ( = ?auto_132338 ?auto_132341 ) ) ( not ( = ?auto_132339 ?auto_132340 ) ) ( not ( = ?auto_132339 ?auto_132341 ) ) ( not ( = ?auto_132340 ?auto_132341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132341 ?auto_132340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132342 - BLOCK
      ?auto_132343 - BLOCK
      ?auto_132344 - BLOCK
    )
    :vars
    (
      ?auto_132345 - BLOCK
      ?auto_132346 - BLOCK
      ?auto_132347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132345 ?auto_132344 ) ( CLEAR ?auto_132345 ) ( ON-TABLE ?auto_132342 ) ( ON ?auto_132343 ?auto_132342 ) ( ON ?auto_132344 ?auto_132343 ) ( not ( = ?auto_132342 ?auto_132343 ) ) ( not ( = ?auto_132342 ?auto_132344 ) ) ( not ( = ?auto_132342 ?auto_132345 ) ) ( not ( = ?auto_132343 ?auto_132344 ) ) ( not ( = ?auto_132343 ?auto_132345 ) ) ( not ( = ?auto_132344 ?auto_132345 ) ) ( HOLDING ?auto_132346 ) ( CLEAR ?auto_132347 ) ( not ( = ?auto_132342 ?auto_132346 ) ) ( not ( = ?auto_132342 ?auto_132347 ) ) ( not ( = ?auto_132343 ?auto_132346 ) ) ( not ( = ?auto_132343 ?auto_132347 ) ) ( not ( = ?auto_132344 ?auto_132346 ) ) ( not ( = ?auto_132344 ?auto_132347 ) ) ( not ( = ?auto_132345 ?auto_132346 ) ) ( not ( = ?auto_132345 ?auto_132347 ) ) ( not ( = ?auto_132346 ?auto_132347 ) ) )
    :subtasks
    ( ( !STACK ?auto_132346 ?auto_132347 )
      ( MAKE-3PILE ?auto_132342 ?auto_132343 ?auto_132344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132348 - BLOCK
      ?auto_132349 - BLOCK
      ?auto_132350 - BLOCK
    )
    :vars
    (
      ?auto_132351 - BLOCK
      ?auto_132352 - BLOCK
      ?auto_132353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132351 ?auto_132350 ) ( ON-TABLE ?auto_132348 ) ( ON ?auto_132349 ?auto_132348 ) ( ON ?auto_132350 ?auto_132349 ) ( not ( = ?auto_132348 ?auto_132349 ) ) ( not ( = ?auto_132348 ?auto_132350 ) ) ( not ( = ?auto_132348 ?auto_132351 ) ) ( not ( = ?auto_132349 ?auto_132350 ) ) ( not ( = ?auto_132349 ?auto_132351 ) ) ( not ( = ?auto_132350 ?auto_132351 ) ) ( CLEAR ?auto_132352 ) ( not ( = ?auto_132348 ?auto_132353 ) ) ( not ( = ?auto_132348 ?auto_132352 ) ) ( not ( = ?auto_132349 ?auto_132353 ) ) ( not ( = ?auto_132349 ?auto_132352 ) ) ( not ( = ?auto_132350 ?auto_132353 ) ) ( not ( = ?auto_132350 ?auto_132352 ) ) ( not ( = ?auto_132351 ?auto_132353 ) ) ( not ( = ?auto_132351 ?auto_132352 ) ) ( not ( = ?auto_132353 ?auto_132352 ) ) ( ON ?auto_132353 ?auto_132351 ) ( CLEAR ?auto_132353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132348 ?auto_132349 ?auto_132350 ?auto_132351 )
      ( MAKE-3PILE ?auto_132348 ?auto_132349 ?auto_132350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132354 - BLOCK
      ?auto_132355 - BLOCK
      ?auto_132356 - BLOCK
    )
    :vars
    (
      ?auto_132357 - BLOCK
      ?auto_132359 - BLOCK
      ?auto_132358 - BLOCK
      ?auto_132361 - BLOCK
      ?auto_132360 - BLOCK
      ?auto_132362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132357 ?auto_132356 ) ( ON-TABLE ?auto_132354 ) ( ON ?auto_132355 ?auto_132354 ) ( ON ?auto_132356 ?auto_132355 ) ( not ( = ?auto_132354 ?auto_132355 ) ) ( not ( = ?auto_132354 ?auto_132356 ) ) ( not ( = ?auto_132354 ?auto_132357 ) ) ( not ( = ?auto_132355 ?auto_132356 ) ) ( not ( = ?auto_132355 ?auto_132357 ) ) ( not ( = ?auto_132356 ?auto_132357 ) ) ( not ( = ?auto_132354 ?auto_132359 ) ) ( not ( = ?auto_132354 ?auto_132358 ) ) ( not ( = ?auto_132355 ?auto_132359 ) ) ( not ( = ?auto_132355 ?auto_132358 ) ) ( not ( = ?auto_132356 ?auto_132359 ) ) ( not ( = ?auto_132356 ?auto_132358 ) ) ( not ( = ?auto_132357 ?auto_132359 ) ) ( not ( = ?auto_132357 ?auto_132358 ) ) ( not ( = ?auto_132359 ?auto_132358 ) ) ( ON ?auto_132359 ?auto_132357 ) ( CLEAR ?auto_132359 ) ( HOLDING ?auto_132358 ) ( CLEAR ?auto_132361 ) ( ON-TABLE ?auto_132360 ) ( ON ?auto_132362 ?auto_132360 ) ( ON ?auto_132361 ?auto_132362 ) ( not ( = ?auto_132360 ?auto_132362 ) ) ( not ( = ?auto_132360 ?auto_132361 ) ) ( not ( = ?auto_132360 ?auto_132358 ) ) ( not ( = ?auto_132362 ?auto_132361 ) ) ( not ( = ?auto_132362 ?auto_132358 ) ) ( not ( = ?auto_132361 ?auto_132358 ) ) ( not ( = ?auto_132354 ?auto_132361 ) ) ( not ( = ?auto_132354 ?auto_132360 ) ) ( not ( = ?auto_132354 ?auto_132362 ) ) ( not ( = ?auto_132355 ?auto_132361 ) ) ( not ( = ?auto_132355 ?auto_132360 ) ) ( not ( = ?auto_132355 ?auto_132362 ) ) ( not ( = ?auto_132356 ?auto_132361 ) ) ( not ( = ?auto_132356 ?auto_132360 ) ) ( not ( = ?auto_132356 ?auto_132362 ) ) ( not ( = ?auto_132357 ?auto_132361 ) ) ( not ( = ?auto_132357 ?auto_132360 ) ) ( not ( = ?auto_132357 ?auto_132362 ) ) ( not ( = ?auto_132359 ?auto_132361 ) ) ( not ( = ?auto_132359 ?auto_132360 ) ) ( not ( = ?auto_132359 ?auto_132362 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132360 ?auto_132362 ?auto_132361 ?auto_132358 )
      ( MAKE-3PILE ?auto_132354 ?auto_132355 ?auto_132356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132363 - BLOCK
      ?auto_132364 - BLOCK
      ?auto_132365 - BLOCK
    )
    :vars
    (
      ?auto_132367 - BLOCK
      ?auto_132368 - BLOCK
      ?auto_132369 - BLOCK
      ?auto_132370 - BLOCK
      ?auto_132366 - BLOCK
      ?auto_132371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132367 ?auto_132365 ) ( ON-TABLE ?auto_132363 ) ( ON ?auto_132364 ?auto_132363 ) ( ON ?auto_132365 ?auto_132364 ) ( not ( = ?auto_132363 ?auto_132364 ) ) ( not ( = ?auto_132363 ?auto_132365 ) ) ( not ( = ?auto_132363 ?auto_132367 ) ) ( not ( = ?auto_132364 ?auto_132365 ) ) ( not ( = ?auto_132364 ?auto_132367 ) ) ( not ( = ?auto_132365 ?auto_132367 ) ) ( not ( = ?auto_132363 ?auto_132368 ) ) ( not ( = ?auto_132363 ?auto_132369 ) ) ( not ( = ?auto_132364 ?auto_132368 ) ) ( not ( = ?auto_132364 ?auto_132369 ) ) ( not ( = ?auto_132365 ?auto_132368 ) ) ( not ( = ?auto_132365 ?auto_132369 ) ) ( not ( = ?auto_132367 ?auto_132368 ) ) ( not ( = ?auto_132367 ?auto_132369 ) ) ( not ( = ?auto_132368 ?auto_132369 ) ) ( ON ?auto_132368 ?auto_132367 ) ( CLEAR ?auto_132370 ) ( ON-TABLE ?auto_132366 ) ( ON ?auto_132371 ?auto_132366 ) ( ON ?auto_132370 ?auto_132371 ) ( not ( = ?auto_132366 ?auto_132371 ) ) ( not ( = ?auto_132366 ?auto_132370 ) ) ( not ( = ?auto_132366 ?auto_132369 ) ) ( not ( = ?auto_132371 ?auto_132370 ) ) ( not ( = ?auto_132371 ?auto_132369 ) ) ( not ( = ?auto_132370 ?auto_132369 ) ) ( not ( = ?auto_132363 ?auto_132370 ) ) ( not ( = ?auto_132363 ?auto_132366 ) ) ( not ( = ?auto_132363 ?auto_132371 ) ) ( not ( = ?auto_132364 ?auto_132370 ) ) ( not ( = ?auto_132364 ?auto_132366 ) ) ( not ( = ?auto_132364 ?auto_132371 ) ) ( not ( = ?auto_132365 ?auto_132370 ) ) ( not ( = ?auto_132365 ?auto_132366 ) ) ( not ( = ?auto_132365 ?auto_132371 ) ) ( not ( = ?auto_132367 ?auto_132370 ) ) ( not ( = ?auto_132367 ?auto_132366 ) ) ( not ( = ?auto_132367 ?auto_132371 ) ) ( not ( = ?auto_132368 ?auto_132370 ) ) ( not ( = ?auto_132368 ?auto_132366 ) ) ( not ( = ?auto_132368 ?auto_132371 ) ) ( ON ?auto_132369 ?auto_132368 ) ( CLEAR ?auto_132369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132363 ?auto_132364 ?auto_132365 ?auto_132367 ?auto_132368 )
      ( MAKE-3PILE ?auto_132363 ?auto_132364 ?auto_132365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132372 - BLOCK
      ?auto_132373 - BLOCK
      ?auto_132374 - BLOCK
    )
    :vars
    (
      ?auto_132375 - BLOCK
      ?auto_132380 - BLOCK
      ?auto_132378 - BLOCK
      ?auto_132379 - BLOCK
      ?auto_132376 - BLOCK
      ?auto_132377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132375 ?auto_132374 ) ( ON-TABLE ?auto_132372 ) ( ON ?auto_132373 ?auto_132372 ) ( ON ?auto_132374 ?auto_132373 ) ( not ( = ?auto_132372 ?auto_132373 ) ) ( not ( = ?auto_132372 ?auto_132374 ) ) ( not ( = ?auto_132372 ?auto_132375 ) ) ( not ( = ?auto_132373 ?auto_132374 ) ) ( not ( = ?auto_132373 ?auto_132375 ) ) ( not ( = ?auto_132374 ?auto_132375 ) ) ( not ( = ?auto_132372 ?auto_132380 ) ) ( not ( = ?auto_132372 ?auto_132378 ) ) ( not ( = ?auto_132373 ?auto_132380 ) ) ( not ( = ?auto_132373 ?auto_132378 ) ) ( not ( = ?auto_132374 ?auto_132380 ) ) ( not ( = ?auto_132374 ?auto_132378 ) ) ( not ( = ?auto_132375 ?auto_132380 ) ) ( not ( = ?auto_132375 ?auto_132378 ) ) ( not ( = ?auto_132380 ?auto_132378 ) ) ( ON ?auto_132380 ?auto_132375 ) ( ON-TABLE ?auto_132379 ) ( ON ?auto_132376 ?auto_132379 ) ( not ( = ?auto_132379 ?auto_132376 ) ) ( not ( = ?auto_132379 ?auto_132377 ) ) ( not ( = ?auto_132379 ?auto_132378 ) ) ( not ( = ?auto_132376 ?auto_132377 ) ) ( not ( = ?auto_132376 ?auto_132378 ) ) ( not ( = ?auto_132377 ?auto_132378 ) ) ( not ( = ?auto_132372 ?auto_132377 ) ) ( not ( = ?auto_132372 ?auto_132379 ) ) ( not ( = ?auto_132372 ?auto_132376 ) ) ( not ( = ?auto_132373 ?auto_132377 ) ) ( not ( = ?auto_132373 ?auto_132379 ) ) ( not ( = ?auto_132373 ?auto_132376 ) ) ( not ( = ?auto_132374 ?auto_132377 ) ) ( not ( = ?auto_132374 ?auto_132379 ) ) ( not ( = ?auto_132374 ?auto_132376 ) ) ( not ( = ?auto_132375 ?auto_132377 ) ) ( not ( = ?auto_132375 ?auto_132379 ) ) ( not ( = ?auto_132375 ?auto_132376 ) ) ( not ( = ?auto_132380 ?auto_132377 ) ) ( not ( = ?auto_132380 ?auto_132379 ) ) ( not ( = ?auto_132380 ?auto_132376 ) ) ( ON ?auto_132378 ?auto_132380 ) ( CLEAR ?auto_132378 ) ( HOLDING ?auto_132377 ) ( CLEAR ?auto_132376 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132379 ?auto_132376 ?auto_132377 )
      ( MAKE-3PILE ?auto_132372 ?auto_132373 ?auto_132374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132381 - BLOCK
      ?auto_132382 - BLOCK
      ?auto_132383 - BLOCK
    )
    :vars
    (
      ?auto_132384 - BLOCK
      ?auto_132388 - BLOCK
      ?auto_132387 - BLOCK
      ?auto_132389 - BLOCK
      ?auto_132385 - BLOCK
      ?auto_132386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132384 ?auto_132383 ) ( ON-TABLE ?auto_132381 ) ( ON ?auto_132382 ?auto_132381 ) ( ON ?auto_132383 ?auto_132382 ) ( not ( = ?auto_132381 ?auto_132382 ) ) ( not ( = ?auto_132381 ?auto_132383 ) ) ( not ( = ?auto_132381 ?auto_132384 ) ) ( not ( = ?auto_132382 ?auto_132383 ) ) ( not ( = ?auto_132382 ?auto_132384 ) ) ( not ( = ?auto_132383 ?auto_132384 ) ) ( not ( = ?auto_132381 ?auto_132388 ) ) ( not ( = ?auto_132381 ?auto_132387 ) ) ( not ( = ?auto_132382 ?auto_132388 ) ) ( not ( = ?auto_132382 ?auto_132387 ) ) ( not ( = ?auto_132383 ?auto_132388 ) ) ( not ( = ?auto_132383 ?auto_132387 ) ) ( not ( = ?auto_132384 ?auto_132388 ) ) ( not ( = ?auto_132384 ?auto_132387 ) ) ( not ( = ?auto_132388 ?auto_132387 ) ) ( ON ?auto_132388 ?auto_132384 ) ( ON-TABLE ?auto_132389 ) ( ON ?auto_132385 ?auto_132389 ) ( not ( = ?auto_132389 ?auto_132385 ) ) ( not ( = ?auto_132389 ?auto_132386 ) ) ( not ( = ?auto_132389 ?auto_132387 ) ) ( not ( = ?auto_132385 ?auto_132386 ) ) ( not ( = ?auto_132385 ?auto_132387 ) ) ( not ( = ?auto_132386 ?auto_132387 ) ) ( not ( = ?auto_132381 ?auto_132386 ) ) ( not ( = ?auto_132381 ?auto_132389 ) ) ( not ( = ?auto_132381 ?auto_132385 ) ) ( not ( = ?auto_132382 ?auto_132386 ) ) ( not ( = ?auto_132382 ?auto_132389 ) ) ( not ( = ?auto_132382 ?auto_132385 ) ) ( not ( = ?auto_132383 ?auto_132386 ) ) ( not ( = ?auto_132383 ?auto_132389 ) ) ( not ( = ?auto_132383 ?auto_132385 ) ) ( not ( = ?auto_132384 ?auto_132386 ) ) ( not ( = ?auto_132384 ?auto_132389 ) ) ( not ( = ?auto_132384 ?auto_132385 ) ) ( not ( = ?auto_132388 ?auto_132386 ) ) ( not ( = ?auto_132388 ?auto_132389 ) ) ( not ( = ?auto_132388 ?auto_132385 ) ) ( ON ?auto_132387 ?auto_132388 ) ( CLEAR ?auto_132385 ) ( ON ?auto_132386 ?auto_132387 ) ( CLEAR ?auto_132386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132381 ?auto_132382 ?auto_132383 ?auto_132384 ?auto_132388 ?auto_132387 )
      ( MAKE-3PILE ?auto_132381 ?auto_132382 ?auto_132383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132390 - BLOCK
      ?auto_132391 - BLOCK
      ?auto_132392 - BLOCK
    )
    :vars
    (
      ?auto_132393 - BLOCK
      ?auto_132394 - BLOCK
      ?auto_132395 - BLOCK
      ?auto_132396 - BLOCK
      ?auto_132398 - BLOCK
      ?auto_132397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132393 ?auto_132392 ) ( ON-TABLE ?auto_132390 ) ( ON ?auto_132391 ?auto_132390 ) ( ON ?auto_132392 ?auto_132391 ) ( not ( = ?auto_132390 ?auto_132391 ) ) ( not ( = ?auto_132390 ?auto_132392 ) ) ( not ( = ?auto_132390 ?auto_132393 ) ) ( not ( = ?auto_132391 ?auto_132392 ) ) ( not ( = ?auto_132391 ?auto_132393 ) ) ( not ( = ?auto_132392 ?auto_132393 ) ) ( not ( = ?auto_132390 ?auto_132394 ) ) ( not ( = ?auto_132390 ?auto_132395 ) ) ( not ( = ?auto_132391 ?auto_132394 ) ) ( not ( = ?auto_132391 ?auto_132395 ) ) ( not ( = ?auto_132392 ?auto_132394 ) ) ( not ( = ?auto_132392 ?auto_132395 ) ) ( not ( = ?auto_132393 ?auto_132394 ) ) ( not ( = ?auto_132393 ?auto_132395 ) ) ( not ( = ?auto_132394 ?auto_132395 ) ) ( ON ?auto_132394 ?auto_132393 ) ( ON-TABLE ?auto_132396 ) ( not ( = ?auto_132396 ?auto_132398 ) ) ( not ( = ?auto_132396 ?auto_132397 ) ) ( not ( = ?auto_132396 ?auto_132395 ) ) ( not ( = ?auto_132398 ?auto_132397 ) ) ( not ( = ?auto_132398 ?auto_132395 ) ) ( not ( = ?auto_132397 ?auto_132395 ) ) ( not ( = ?auto_132390 ?auto_132397 ) ) ( not ( = ?auto_132390 ?auto_132396 ) ) ( not ( = ?auto_132390 ?auto_132398 ) ) ( not ( = ?auto_132391 ?auto_132397 ) ) ( not ( = ?auto_132391 ?auto_132396 ) ) ( not ( = ?auto_132391 ?auto_132398 ) ) ( not ( = ?auto_132392 ?auto_132397 ) ) ( not ( = ?auto_132392 ?auto_132396 ) ) ( not ( = ?auto_132392 ?auto_132398 ) ) ( not ( = ?auto_132393 ?auto_132397 ) ) ( not ( = ?auto_132393 ?auto_132396 ) ) ( not ( = ?auto_132393 ?auto_132398 ) ) ( not ( = ?auto_132394 ?auto_132397 ) ) ( not ( = ?auto_132394 ?auto_132396 ) ) ( not ( = ?auto_132394 ?auto_132398 ) ) ( ON ?auto_132395 ?auto_132394 ) ( ON ?auto_132397 ?auto_132395 ) ( CLEAR ?auto_132397 ) ( HOLDING ?auto_132398 ) ( CLEAR ?auto_132396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132396 ?auto_132398 )
      ( MAKE-3PILE ?auto_132390 ?auto_132391 ?auto_132392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134257 - BLOCK
      ?auto_134258 - BLOCK
      ?auto_134259 - BLOCK
    )
    :vars
    (
      ?auto_134261 - BLOCK
      ?auto_134264 - BLOCK
      ?auto_134260 - BLOCK
      ?auto_134262 - BLOCK
      ?auto_134263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134261 ?auto_134259 ) ( ON-TABLE ?auto_134257 ) ( ON ?auto_134258 ?auto_134257 ) ( ON ?auto_134259 ?auto_134258 ) ( not ( = ?auto_134257 ?auto_134258 ) ) ( not ( = ?auto_134257 ?auto_134259 ) ) ( not ( = ?auto_134257 ?auto_134261 ) ) ( not ( = ?auto_134258 ?auto_134259 ) ) ( not ( = ?auto_134258 ?auto_134261 ) ) ( not ( = ?auto_134259 ?auto_134261 ) ) ( not ( = ?auto_134257 ?auto_134264 ) ) ( not ( = ?auto_134257 ?auto_134260 ) ) ( not ( = ?auto_134258 ?auto_134264 ) ) ( not ( = ?auto_134258 ?auto_134260 ) ) ( not ( = ?auto_134259 ?auto_134264 ) ) ( not ( = ?auto_134259 ?auto_134260 ) ) ( not ( = ?auto_134261 ?auto_134264 ) ) ( not ( = ?auto_134261 ?auto_134260 ) ) ( not ( = ?auto_134264 ?auto_134260 ) ) ( ON ?auto_134264 ?auto_134261 ) ( not ( = ?auto_134262 ?auto_134263 ) ) ( not ( = ?auto_134262 ?auto_134260 ) ) ( not ( = ?auto_134263 ?auto_134260 ) ) ( not ( = ?auto_134257 ?auto_134263 ) ) ( not ( = ?auto_134257 ?auto_134262 ) ) ( not ( = ?auto_134258 ?auto_134263 ) ) ( not ( = ?auto_134258 ?auto_134262 ) ) ( not ( = ?auto_134259 ?auto_134263 ) ) ( not ( = ?auto_134259 ?auto_134262 ) ) ( not ( = ?auto_134261 ?auto_134263 ) ) ( not ( = ?auto_134261 ?auto_134262 ) ) ( not ( = ?auto_134264 ?auto_134263 ) ) ( not ( = ?auto_134264 ?auto_134262 ) ) ( ON ?auto_134260 ?auto_134264 ) ( ON ?auto_134263 ?auto_134260 ) ( ON ?auto_134262 ?auto_134263 ) ( CLEAR ?auto_134262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134257 ?auto_134258 ?auto_134259 ?auto_134261 ?auto_134264 ?auto_134260 ?auto_134263 )
      ( MAKE-3PILE ?auto_134257 ?auto_134258 ?auto_134259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132408 - BLOCK
      ?auto_132409 - BLOCK
      ?auto_132410 - BLOCK
    )
    :vars
    (
      ?auto_132412 - BLOCK
      ?auto_132415 - BLOCK
      ?auto_132414 - BLOCK
      ?auto_132413 - BLOCK
      ?auto_132416 - BLOCK
      ?auto_132411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132412 ?auto_132410 ) ( ON-TABLE ?auto_132408 ) ( ON ?auto_132409 ?auto_132408 ) ( ON ?auto_132410 ?auto_132409 ) ( not ( = ?auto_132408 ?auto_132409 ) ) ( not ( = ?auto_132408 ?auto_132410 ) ) ( not ( = ?auto_132408 ?auto_132412 ) ) ( not ( = ?auto_132409 ?auto_132410 ) ) ( not ( = ?auto_132409 ?auto_132412 ) ) ( not ( = ?auto_132410 ?auto_132412 ) ) ( not ( = ?auto_132408 ?auto_132415 ) ) ( not ( = ?auto_132408 ?auto_132414 ) ) ( not ( = ?auto_132409 ?auto_132415 ) ) ( not ( = ?auto_132409 ?auto_132414 ) ) ( not ( = ?auto_132410 ?auto_132415 ) ) ( not ( = ?auto_132410 ?auto_132414 ) ) ( not ( = ?auto_132412 ?auto_132415 ) ) ( not ( = ?auto_132412 ?auto_132414 ) ) ( not ( = ?auto_132415 ?auto_132414 ) ) ( ON ?auto_132415 ?auto_132412 ) ( not ( = ?auto_132413 ?auto_132416 ) ) ( not ( = ?auto_132413 ?auto_132411 ) ) ( not ( = ?auto_132413 ?auto_132414 ) ) ( not ( = ?auto_132416 ?auto_132411 ) ) ( not ( = ?auto_132416 ?auto_132414 ) ) ( not ( = ?auto_132411 ?auto_132414 ) ) ( not ( = ?auto_132408 ?auto_132411 ) ) ( not ( = ?auto_132408 ?auto_132413 ) ) ( not ( = ?auto_132408 ?auto_132416 ) ) ( not ( = ?auto_132409 ?auto_132411 ) ) ( not ( = ?auto_132409 ?auto_132413 ) ) ( not ( = ?auto_132409 ?auto_132416 ) ) ( not ( = ?auto_132410 ?auto_132411 ) ) ( not ( = ?auto_132410 ?auto_132413 ) ) ( not ( = ?auto_132410 ?auto_132416 ) ) ( not ( = ?auto_132412 ?auto_132411 ) ) ( not ( = ?auto_132412 ?auto_132413 ) ) ( not ( = ?auto_132412 ?auto_132416 ) ) ( not ( = ?auto_132415 ?auto_132411 ) ) ( not ( = ?auto_132415 ?auto_132413 ) ) ( not ( = ?auto_132415 ?auto_132416 ) ) ( ON ?auto_132414 ?auto_132415 ) ( ON ?auto_132411 ?auto_132414 ) ( ON ?auto_132416 ?auto_132411 ) ( CLEAR ?auto_132416 ) ( HOLDING ?auto_132413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132413 )
      ( MAKE-3PILE ?auto_132408 ?auto_132409 ?auto_132410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132417 - BLOCK
      ?auto_132418 - BLOCK
      ?auto_132419 - BLOCK
    )
    :vars
    (
      ?auto_132424 - BLOCK
      ?auto_132423 - BLOCK
      ?auto_132422 - BLOCK
      ?auto_132425 - BLOCK
      ?auto_132420 - BLOCK
      ?auto_132421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132424 ?auto_132419 ) ( ON-TABLE ?auto_132417 ) ( ON ?auto_132418 ?auto_132417 ) ( ON ?auto_132419 ?auto_132418 ) ( not ( = ?auto_132417 ?auto_132418 ) ) ( not ( = ?auto_132417 ?auto_132419 ) ) ( not ( = ?auto_132417 ?auto_132424 ) ) ( not ( = ?auto_132418 ?auto_132419 ) ) ( not ( = ?auto_132418 ?auto_132424 ) ) ( not ( = ?auto_132419 ?auto_132424 ) ) ( not ( = ?auto_132417 ?auto_132423 ) ) ( not ( = ?auto_132417 ?auto_132422 ) ) ( not ( = ?auto_132418 ?auto_132423 ) ) ( not ( = ?auto_132418 ?auto_132422 ) ) ( not ( = ?auto_132419 ?auto_132423 ) ) ( not ( = ?auto_132419 ?auto_132422 ) ) ( not ( = ?auto_132424 ?auto_132423 ) ) ( not ( = ?auto_132424 ?auto_132422 ) ) ( not ( = ?auto_132423 ?auto_132422 ) ) ( ON ?auto_132423 ?auto_132424 ) ( not ( = ?auto_132425 ?auto_132420 ) ) ( not ( = ?auto_132425 ?auto_132421 ) ) ( not ( = ?auto_132425 ?auto_132422 ) ) ( not ( = ?auto_132420 ?auto_132421 ) ) ( not ( = ?auto_132420 ?auto_132422 ) ) ( not ( = ?auto_132421 ?auto_132422 ) ) ( not ( = ?auto_132417 ?auto_132421 ) ) ( not ( = ?auto_132417 ?auto_132425 ) ) ( not ( = ?auto_132417 ?auto_132420 ) ) ( not ( = ?auto_132418 ?auto_132421 ) ) ( not ( = ?auto_132418 ?auto_132425 ) ) ( not ( = ?auto_132418 ?auto_132420 ) ) ( not ( = ?auto_132419 ?auto_132421 ) ) ( not ( = ?auto_132419 ?auto_132425 ) ) ( not ( = ?auto_132419 ?auto_132420 ) ) ( not ( = ?auto_132424 ?auto_132421 ) ) ( not ( = ?auto_132424 ?auto_132425 ) ) ( not ( = ?auto_132424 ?auto_132420 ) ) ( not ( = ?auto_132423 ?auto_132421 ) ) ( not ( = ?auto_132423 ?auto_132425 ) ) ( not ( = ?auto_132423 ?auto_132420 ) ) ( ON ?auto_132422 ?auto_132423 ) ( ON ?auto_132421 ?auto_132422 ) ( ON ?auto_132420 ?auto_132421 ) ( ON ?auto_132425 ?auto_132420 ) ( CLEAR ?auto_132425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132417 ?auto_132418 ?auto_132419 ?auto_132424 ?auto_132423 ?auto_132422 ?auto_132421 ?auto_132420 )
      ( MAKE-3PILE ?auto_132417 ?auto_132418 ?auto_132419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132432 - BLOCK
      ?auto_132433 - BLOCK
      ?auto_132434 - BLOCK
      ?auto_132435 - BLOCK
      ?auto_132436 - BLOCK
      ?auto_132437 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132437 ) ( CLEAR ?auto_132436 ) ( ON-TABLE ?auto_132432 ) ( ON ?auto_132433 ?auto_132432 ) ( ON ?auto_132434 ?auto_132433 ) ( ON ?auto_132435 ?auto_132434 ) ( ON ?auto_132436 ?auto_132435 ) ( not ( = ?auto_132432 ?auto_132433 ) ) ( not ( = ?auto_132432 ?auto_132434 ) ) ( not ( = ?auto_132432 ?auto_132435 ) ) ( not ( = ?auto_132432 ?auto_132436 ) ) ( not ( = ?auto_132432 ?auto_132437 ) ) ( not ( = ?auto_132433 ?auto_132434 ) ) ( not ( = ?auto_132433 ?auto_132435 ) ) ( not ( = ?auto_132433 ?auto_132436 ) ) ( not ( = ?auto_132433 ?auto_132437 ) ) ( not ( = ?auto_132434 ?auto_132435 ) ) ( not ( = ?auto_132434 ?auto_132436 ) ) ( not ( = ?auto_132434 ?auto_132437 ) ) ( not ( = ?auto_132435 ?auto_132436 ) ) ( not ( = ?auto_132435 ?auto_132437 ) ) ( not ( = ?auto_132436 ?auto_132437 ) ) )
    :subtasks
    ( ( !STACK ?auto_132437 ?auto_132436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132438 - BLOCK
      ?auto_132439 - BLOCK
      ?auto_132440 - BLOCK
      ?auto_132441 - BLOCK
      ?auto_132442 - BLOCK
      ?auto_132443 - BLOCK
    )
    :vars
    (
      ?auto_132444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132442 ) ( ON-TABLE ?auto_132438 ) ( ON ?auto_132439 ?auto_132438 ) ( ON ?auto_132440 ?auto_132439 ) ( ON ?auto_132441 ?auto_132440 ) ( ON ?auto_132442 ?auto_132441 ) ( not ( = ?auto_132438 ?auto_132439 ) ) ( not ( = ?auto_132438 ?auto_132440 ) ) ( not ( = ?auto_132438 ?auto_132441 ) ) ( not ( = ?auto_132438 ?auto_132442 ) ) ( not ( = ?auto_132438 ?auto_132443 ) ) ( not ( = ?auto_132439 ?auto_132440 ) ) ( not ( = ?auto_132439 ?auto_132441 ) ) ( not ( = ?auto_132439 ?auto_132442 ) ) ( not ( = ?auto_132439 ?auto_132443 ) ) ( not ( = ?auto_132440 ?auto_132441 ) ) ( not ( = ?auto_132440 ?auto_132442 ) ) ( not ( = ?auto_132440 ?auto_132443 ) ) ( not ( = ?auto_132441 ?auto_132442 ) ) ( not ( = ?auto_132441 ?auto_132443 ) ) ( not ( = ?auto_132442 ?auto_132443 ) ) ( ON ?auto_132443 ?auto_132444 ) ( CLEAR ?auto_132443 ) ( HAND-EMPTY ) ( not ( = ?auto_132438 ?auto_132444 ) ) ( not ( = ?auto_132439 ?auto_132444 ) ) ( not ( = ?auto_132440 ?auto_132444 ) ) ( not ( = ?auto_132441 ?auto_132444 ) ) ( not ( = ?auto_132442 ?auto_132444 ) ) ( not ( = ?auto_132443 ?auto_132444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132443 ?auto_132444 )
      ( MAKE-6PILE ?auto_132438 ?auto_132439 ?auto_132440 ?auto_132441 ?auto_132442 ?auto_132443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132445 - BLOCK
      ?auto_132446 - BLOCK
      ?auto_132447 - BLOCK
      ?auto_132448 - BLOCK
      ?auto_132449 - BLOCK
      ?auto_132450 - BLOCK
    )
    :vars
    (
      ?auto_132451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132445 ) ( ON ?auto_132446 ?auto_132445 ) ( ON ?auto_132447 ?auto_132446 ) ( ON ?auto_132448 ?auto_132447 ) ( not ( = ?auto_132445 ?auto_132446 ) ) ( not ( = ?auto_132445 ?auto_132447 ) ) ( not ( = ?auto_132445 ?auto_132448 ) ) ( not ( = ?auto_132445 ?auto_132449 ) ) ( not ( = ?auto_132445 ?auto_132450 ) ) ( not ( = ?auto_132446 ?auto_132447 ) ) ( not ( = ?auto_132446 ?auto_132448 ) ) ( not ( = ?auto_132446 ?auto_132449 ) ) ( not ( = ?auto_132446 ?auto_132450 ) ) ( not ( = ?auto_132447 ?auto_132448 ) ) ( not ( = ?auto_132447 ?auto_132449 ) ) ( not ( = ?auto_132447 ?auto_132450 ) ) ( not ( = ?auto_132448 ?auto_132449 ) ) ( not ( = ?auto_132448 ?auto_132450 ) ) ( not ( = ?auto_132449 ?auto_132450 ) ) ( ON ?auto_132450 ?auto_132451 ) ( CLEAR ?auto_132450 ) ( not ( = ?auto_132445 ?auto_132451 ) ) ( not ( = ?auto_132446 ?auto_132451 ) ) ( not ( = ?auto_132447 ?auto_132451 ) ) ( not ( = ?auto_132448 ?auto_132451 ) ) ( not ( = ?auto_132449 ?auto_132451 ) ) ( not ( = ?auto_132450 ?auto_132451 ) ) ( HOLDING ?auto_132449 ) ( CLEAR ?auto_132448 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132445 ?auto_132446 ?auto_132447 ?auto_132448 ?auto_132449 )
      ( MAKE-6PILE ?auto_132445 ?auto_132446 ?auto_132447 ?auto_132448 ?auto_132449 ?auto_132450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132452 - BLOCK
      ?auto_132453 - BLOCK
      ?auto_132454 - BLOCK
      ?auto_132455 - BLOCK
      ?auto_132456 - BLOCK
      ?auto_132457 - BLOCK
    )
    :vars
    (
      ?auto_132458 - BLOCK
      ?auto_132460 - BLOCK
      ?auto_132459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132452 ) ( ON ?auto_132453 ?auto_132452 ) ( ON ?auto_132454 ?auto_132453 ) ( ON ?auto_132455 ?auto_132454 ) ( not ( = ?auto_132452 ?auto_132453 ) ) ( not ( = ?auto_132452 ?auto_132454 ) ) ( not ( = ?auto_132452 ?auto_132455 ) ) ( not ( = ?auto_132452 ?auto_132456 ) ) ( not ( = ?auto_132452 ?auto_132457 ) ) ( not ( = ?auto_132453 ?auto_132454 ) ) ( not ( = ?auto_132453 ?auto_132455 ) ) ( not ( = ?auto_132453 ?auto_132456 ) ) ( not ( = ?auto_132453 ?auto_132457 ) ) ( not ( = ?auto_132454 ?auto_132455 ) ) ( not ( = ?auto_132454 ?auto_132456 ) ) ( not ( = ?auto_132454 ?auto_132457 ) ) ( not ( = ?auto_132455 ?auto_132456 ) ) ( not ( = ?auto_132455 ?auto_132457 ) ) ( not ( = ?auto_132456 ?auto_132457 ) ) ( ON ?auto_132457 ?auto_132458 ) ( not ( = ?auto_132452 ?auto_132458 ) ) ( not ( = ?auto_132453 ?auto_132458 ) ) ( not ( = ?auto_132454 ?auto_132458 ) ) ( not ( = ?auto_132455 ?auto_132458 ) ) ( not ( = ?auto_132456 ?auto_132458 ) ) ( not ( = ?auto_132457 ?auto_132458 ) ) ( CLEAR ?auto_132455 ) ( ON ?auto_132456 ?auto_132457 ) ( CLEAR ?auto_132456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132460 ) ( ON ?auto_132459 ?auto_132460 ) ( ON ?auto_132458 ?auto_132459 ) ( not ( = ?auto_132460 ?auto_132459 ) ) ( not ( = ?auto_132460 ?auto_132458 ) ) ( not ( = ?auto_132460 ?auto_132457 ) ) ( not ( = ?auto_132460 ?auto_132456 ) ) ( not ( = ?auto_132459 ?auto_132458 ) ) ( not ( = ?auto_132459 ?auto_132457 ) ) ( not ( = ?auto_132459 ?auto_132456 ) ) ( not ( = ?auto_132452 ?auto_132460 ) ) ( not ( = ?auto_132452 ?auto_132459 ) ) ( not ( = ?auto_132453 ?auto_132460 ) ) ( not ( = ?auto_132453 ?auto_132459 ) ) ( not ( = ?auto_132454 ?auto_132460 ) ) ( not ( = ?auto_132454 ?auto_132459 ) ) ( not ( = ?auto_132455 ?auto_132460 ) ) ( not ( = ?auto_132455 ?auto_132459 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132460 ?auto_132459 ?auto_132458 ?auto_132457 )
      ( MAKE-6PILE ?auto_132452 ?auto_132453 ?auto_132454 ?auto_132455 ?auto_132456 ?auto_132457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132461 - BLOCK
      ?auto_132462 - BLOCK
      ?auto_132463 - BLOCK
      ?auto_132464 - BLOCK
      ?auto_132465 - BLOCK
      ?auto_132466 - BLOCK
    )
    :vars
    (
      ?auto_132467 - BLOCK
      ?auto_132468 - BLOCK
      ?auto_132469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132461 ) ( ON ?auto_132462 ?auto_132461 ) ( ON ?auto_132463 ?auto_132462 ) ( not ( = ?auto_132461 ?auto_132462 ) ) ( not ( = ?auto_132461 ?auto_132463 ) ) ( not ( = ?auto_132461 ?auto_132464 ) ) ( not ( = ?auto_132461 ?auto_132465 ) ) ( not ( = ?auto_132461 ?auto_132466 ) ) ( not ( = ?auto_132462 ?auto_132463 ) ) ( not ( = ?auto_132462 ?auto_132464 ) ) ( not ( = ?auto_132462 ?auto_132465 ) ) ( not ( = ?auto_132462 ?auto_132466 ) ) ( not ( = ?auto_132463 ?auto_132464 ) ) ( not ( = ?auto_132463 ?auto_132465 ) ) ( not ( = ?auto_132463 ?auto_132466 ) ) ( not ( = ?auto_132464 ?auto_132465 ) ) ( not ( = ?auto_132464 ?auto_132466 ) ) ( not ( = ?auto_132465 ?auto_132466 ) ) ( ON ?auto_132466 ?auto_132467 ) ( not ( = ?auto_132461 ?auto_132467 ) ) ( not ( = ?auto_132462 ?auto_132467 ) ) ( not ( = ?auto_132463 ?auto_132467 ) ) ( not ( = ?auto_132464 ?auto_132467 ) ) ( not ( = ?auto_132465 ?auto_132467 ) ) ( not ( = ?auto_132466 ?auto_132467 ) ) ( ON ?auto_132465 ?auto_132466 ) ( CLEAR ?auto_132465 ) ( ON-TABLE ?auto_132468 ) ( ON ?auto_132469 ?auto_132468 ) ( ON ?auto_132467 ?auto_132469 ) ( not ( = ?auto_132468 ?auto_132469 ) ) ( not ( = ?auto_132468 ?auto_132467 ) ) ( not ( = ?auto_132468 ?auto_132466 ) ) ( not ( = ?auto_132468 ?auto_132465 ) ) ( not ( = ?auto_132469 ?auto_132467 ) ) ( not ( = ?auto_132469 ?auto_132466 ) ) ( not ( = ?auto_132469 ?auto_132465 ) ) ( not ( = ?auto_132461 ?auto_132468 ) ) ( not ( = ?auto_132461 ?auto_132469 ) ) ( not ( = ?auto_132462 ?auto_132468 ) ) ( not ( = ?auto_132462 ?auto_132469 ) ) ( not ( = ?auto_132463 ?auto_132468 ) ) ( not ( = ?auto_132463 ?auto_132469 ) ) ( not ( = ?auto_132464 ?auto_132468 ) ) ( not ( = ?auto_132464 ?auto_132469 ) ) ( HOLDING ?auto_132464 ) ( CLEAR ?auto_132463 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132461 ?auto_132462 ?auto_132463 ?auto_132464 )
      ( MAKE-6PILE ?auto_132461 ?auto_132462 ?auto_132463 ?auto_132464 ?auto_132465 ?auto_132466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132470 - BLOCK
      ?auto_132471 - BLOCK
      ?auto_132472 - BLOCK
      ?auto_132473 - BLOCK
      ?auto_132474 - BLOCK
      ?auto_132475 - BLOCK
    )
    :vars
    (
      ?auto_132478 - BLOCK
      ?auto_132477 - BLOCK
      ?auto_132476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132470 ) ( ON ?auto_132471 ?auto_132470 ) ( ON ?auto_132472 ?auto_132471 ) ( not ( = ?auto_132470 ?auto_132471 ) ) ( not ( = ?auto_132470 ?auto_132472 ) ) ( not ( = ?auto_132470 ?auto_132473 ) ) ( not ( = ?auto_132470 ?auto_132474 ) ) ( not ( = ?auto_132470 ?auto_132475 ) ) ( not ( = ?auto_132471 ?auto_132472 ) ) ( not ( = ?auto_132471 ?auto_132473 ) ) ( not ( = ?auto_132471 ?auto_132474 ) ) ( not ( = ?auto_132471 ?auto_132475 ) ) ( not ( = ?auto_132472 ?auto_132473 ) ) ( not ( = ?auto_132472 ?auto_132474 ) ) ( not ( = ?auto_132472 ?auto_132475 ) ) ( not ( = ?auto_132473 ?auto_132474 ) ) ( not ( = ?auto_132473 ?auto_132475 ) ) ( not ( = ?auto_132474 ?auto_132475 ) ) ( ON ?auto_132475 ?auto_132478 ) ( not ( = ?auto_132470 ?auto_132478 ) ) ( not ( = ?auto_132471 ?auto_132478 ) ) ( not ( = ?auto_132472 ?auto_132478 ) ) ( not ( = ?auto_132473 ?auto_132478 ) ) ( not ( = ?auto_132474 ?auto_132478 ) ) ( not ( = ?auto_132475 ?auto_132478 ) ) ( ON ?auto_132474 ?auto_132475 ) ( ON-TABLE ?auto_132477 ) ( ON ?auto_132476 ?auto_132477 ) ( ON ?auto_132478 ?auto_132476 ) ( not ( = ?auto_132477 ?auto_132476 ) ) ( not ( = ?auto_132477 ?auto_132478 ) ) ( not ( = ?auto_132477 ?auto_132475 ) ) ( not ( = ?auto_132477 ?auto_132474 ) ) ( not ( = ?auto_132476 ?auto_132478 ) ) ( not ( = ?auto_132476 ?auto_132475 ) ) ( not ( = ?auto_132476 ?auto_132474 ) ) ( not ( = ?auto_132470 ?auto_132477 ) ) ( not ( = ?auto_132470 ?auto_132476 ) ) ( not ( = ?auto_132471 ?auto_132477 ) ) ( not ( = ?auto_132471 ?auto_132476 ) ) ( not ( = ?auto_132472 ?auto_132477 ) ) ( not ( = ?auto_132472 ?auto_132476 ) ) ( not ( = ?auto_132473 ?auto_132477 ) ) ( not ( = ?auto_132473 ?auto_132476 ) ) ( CLEAR ?auto_132472 ) ( ON ?auto_132473 ?auto_132474 ) ( CLEAR ?auto_132473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132477 ?auto_132476 ?auto_132478 ?auto_132475 ?auto_132474 )
      ( MAKE-6PILE ?auto_132470 ?auto_132471 ?auto_132472 ?auto_132473 ?auto_132474 ?auto_132475 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132479 - BLOCK
      ?auto_132480 - BLOCK
      ?auto_132481 - BLOCK
      ?auto_132482 - BLOCK
      ?auto_132483 - BLOCK
      ?auto_132484 - BLOCK
    )
    :vars
    (
      ?auto_132487 - BLOCK
      ?auto_132485 - BLOCK
      ?auto_132486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132479 ) ( ON ?auto_132480 ?auto_132479 ) ( not ( = ?auto_132479 ?auto_132480 ) ) ( not ( = ?auto_132479 ?auto_132481 ) ) ( not ( = ?auto_132479 ?auto_132482 ) ) ( not ( = ?auto_132479 ?auto_132483 ) ) ( not ( = ?auto_132479 ?auto_132484 ) ) ( not ( = ?auto_132480 ?auto_132481 ) ) ( not ( = ?auto_132480 ?auto_132482 ) ) ( not ( = ?auto_132480 ?auto_132483 ) ) ( not ( = ?auto_132480 ?auto_132484 ) ) ( not ( = ?auto_132481 ?auto_132482 ) ) ( not ( = ?auto_132481 ?auto_132483 ) ) ( not ( = ?auto_132481 ?auto_132484 ) ) ( not ( = ?auto_132482 ?auto_132483 ) ) ( not ( = ?auto_132482 ?auto_132484 ) ) ( not ( = ?auto_132483 ?auto_132484 ) ) ( ON ?auto_132484 ?auto_132487 ) ( not ( = ?auto_132479 ?auto_132487 ) ) ( not ( = ?auto_132480 ?auto_132487 ) ) ( not ( = ?auto_132481 ?auto_132487 ) ) ( not ( = ?auto_132482 ?auto_132487 ) ) ( not ( = ?auto_132483 ?auto_132487 ) ) ( not ( = ?auto_132484 ?auto_132487 ) ) ( ON ?auto_132483 ?auto_132484 ) ( ON-TABLE ?auto_132485 ) ( ON ?auto_132486 ?auto_132485 ) ( ON ?auto_132487 ?auto_132486 ) ( not ( = ?auto_132485 ?auto_132486 ) ) ( not ( = ?auto_132485 ?auto_132487 ) ) ( not ( = ?auto_132485 ?auto_132484 ) ) ( not ( = ?auto_132485 ?auto_132483 ) ) ( not ( = ?auto_132486 ?auto_132487 ) ) ( not ( = ?auto_132486 ?auto_132484 ) ) ( not ( = ?auto_132486 ?auto_132483 ) ) ( not ( = ?auto_132479 ?auto_132485 ) ) ( not ( = ?auto_132479 ?auto_132486 ) ) ( not ( = ?auto_132480 ?auto_132485 ) ) ( not ( = ?auto_132480 ?auto_132486 ) ) ( not ( = ?auto_132481 ?auto_132485 ) ) ( not ( = ?auto_132481 ?auto_132486 ) ) ( not ( = ?auto_132482 ?auto_132485 ) ) ( not ( = ?auto_132482 ?auto_132486 ) ) ( ON ?auto_132482 ?auto_132483 ) ( CLEAR ?auto_132482 ) ( HOLDING ?auto_132481 ) ( CLEAR ?auto_132480 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132479 ?auto_132480 ?auto_132481 )
      ( MAKE-6PILE ?auto_132479 ?auto_132480 ?auto_132481 ?auto_132482 ?auto_132483 ?auto_132484 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132488 - BLOCK
      ?auto_132489 - BLOCK
      ?auto_132490 - BLOCK
      ?auto_132491 - BLOCK
      ?auto_132492 - BLOCK
      ?auto_132493 - BLOCK
    )
    :vars
    (
      ?auto_132495 - BLOCK
      ?auto_132494 - BLOCK
      ?auto_132496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132488 ) ( ON ?auto_132489 ?auto_132488 ) ( not ( = ?auto_132488 ?auto_132489 ) ) ( not ( = ?auto_132488 ?auto_132490 ) ) ( not ( = ?auto_132488 ?auto_132491 ) ) ( not ( = ?auto_132488 ?auto_132492 ) ) ( not ( = ?auto_132488 ?auto_132493 ) ) ( not ( = ?auto_132489 ?auto_132490 ) ) ( not ( = ?auto_132489 ?auto_132491 ) ) ( not ( = ?auto_132489 ?auto_132492 ) ) ( not ( = ?auto_132489 ?auto_132493 ) ) ( not ( = ?auto_132490 ?auto_132491 ) ) ( not ( = ?auto_132490 ?auto_132492 ) ) ( not ( = ?auto_132490 ?auto_132493 ) ) ( not ( = ?auto_132491 ?auto_132492 ) ) ( not ( = ?auto_132491 ?auto_132493 ) ) ( not ( = ?auto_132492 ?auto_132493 ) ) ( ON ?auto_132493 ?auto_132495 ) ( not ( = ?auto_132488 ?auto_132495 ) ) ( not ( = ?auto_132489 ?auto_132495 ) ) ( not ( = ?auto_132490 ?auto_132495 ) ) ( not ( = ?auto_132491 ?auto_132495 ) ) ( not ( = ?auto_132492 ?auto_132495 ) ) ( not ( = ?auto_132493 ?auto_132495 ) ) ( ON ?auto_132492 ?auto_132493 ) ( ON-TABLE ?auto_132494 ) ( ON ?auto_132496 ?auto_132494 ) ( ON ?auto_132495 ?auto_132496 ) ( not ( = ?auto_132494 ?auto_132496 ) ) ( not ( = ?auto_132494 ?auto_132495 ) ) ( not ( = ?auto_132494 ?auto_132493 ) ) ( not ( = ?auto_132494 ?auto_132492 ) ) ( not ( = ?auto_132496 ?auto_132495 ) ) ( not ( = ?auto_132496 ?auto_132493 ) ) ( not ( = ?auto_132496 ?auto_132492 ) ) ( not ( = ?auto_132488 ?auto_132494 ) ) ( not ( = ?auto_132488 ?auto_132496 ) ) ( not ( = ?auto_132489 ?auto_132494 ) ) ( not ( = ?auto_132489 ?auto_132496 ) ) ( not ( = ?auto_132490 ?auto_132494 ) ) ( not ( = ?auto_132490 ?auto_132496 ) ) ( not ( = ?auto_132491 ?auto_132494 ) ) ( not ( = ?auto_132491 ?auto_132496 ) ) ( ON ?auto_132491 ?auto_132492 ) ( CLEAR ?auto_132489 ) ( ON ?auto_132490 ?auto_132491 ) ( CLEAR ?auto_132490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132494 ?auto_132496 ?auto_132495 ?auto_132493 ?auto_132492 ?auto_132491 )
      ( MAKE-6PILE ?auto_132488 ?auto_132489 ?auto_132490 ?auto_132491 ?auto_132492 ?auto_132493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132497 - BLOCK
      ?auto_132498 - BLOCK
      ?auto_132499 - BLOCK
      ?auto_132500 - BLOCK
      ?auto_132501 - BLOCK
      ?auto_132502 - BLOCK
    )
    :vars
    (
      ?auto_132503 - BLOCK
      ?auto_132505 - BLOCK
      ?auto_132504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132497 ) ( not ( = ?auto_132497 ?auto_132498 ) ) ( not ( = ?auto_132497 ?auto_132499 ) ) ( not ( = ?auto_132497 ?auto_132500 ) ) ( not ( = ?auto_132497 ?auto_132501 ) ) ( not ( = ?auto_132497 ?auto_132502 ) ) ( not ( = ?auto_132498 ?auto_132499 ) ) ( not ( = ?auto_132498 ?auto_132500 ) ) ( not ( = ?auto_132498 ?auto_132501 ) ) ( not ( = ?auto_132498 ?auto_132502 ) ) ( not ( = ?auto_132499 ?auto_132500 ) ) ( not ( = ?auto_132499 ?auto_132501 ) ) ( not ( = ?auto_132499 ?auto_132502 ) ) ( not ( = ?auto_132500 ?auto_132501 ) ) ( not ( = ?auto_132500 ?auto_132502 ) ) ( not ( = ?auto_132501 ?auto_132502 ) ) ( ON ?auto_132502 ?auto_132503 ) ( not ( = ?auto_132497 ?auto_132503 ) ) ( not ( = ?auto_132498 ?auto_132503 ) ) ( not ( = ?auto_132499 ?auto_132503 ) ) ( not ( = ?auto_132500 ?auto_132503 ) ) ( not ( = ?auto_132501 ?auto_132503 ) ) ( not ( = ?auto_132502 ?auto_132503 ) ) ( ON ?auto_132501 ?auto_132502 ) ( ON-TABLE ?auto_132505 ) ( ON ?auto_132504 ?auto_132505 ) ( ON ?auto_132503 ?auto_132504 ) ( not ( = ?auto_132505 ?auto_132504 ) ) ( not ( = ?auto_132505 ?auto_132503 ) ) ( not ( = ?auto_132505 ?auto_132502 ) ) ( not ( = ?auto_132505 ?auto_132501 ) ) ( not ( = ?auto_132504 ?auto_132503 ) ) ( not ( = ?auto_132504 ?auto_132502 ) ) ( not ( = ?auto_132504 ?auto_132501 ) ) ( not ( = ?auto_132497 ?auto_132505 ) ) ( not ( = ?auto_132497 ?auto_132504 ) ) ( not ( = ?auto_132498 ?auto_132505 ) ) ( not ( = ?auto_132498 ?auto_132504 ) ) ( not ( = ?auto_132499 ?auto_132505 ) ) ( not ( = ?auto_132499 ?auto_132504 ) ) ( not ( = ?auto_132500 ?auto_132505 ) ) ( not ( = ?auto_132500 ?auto_132504 ) ) ( ON ?auto_132500 ?auto_132501 ) ( ON ?auto_132499 ?auto_132500 ) ( CLEAR ?auto_132499 ) ( HOLDING ?auto_132498 ) ( CLEAR ?auto_132497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132497 ?auto_132498 )
      ( MAKE-6PILE ?auto_132497 ?auto_132498 ?auto_132499 ?auto_132500 ?auto_132501 ?auto_132502 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132506 - BLOCK
      ?auto_132507 - BLOCK
      ?auto_132508 - BLOCK
      ?auto_132509 - BLOCK
      ?auto_132510 - BLOCK
      ?auto_132511 - BLOCK
    )
    :vars
    (
      ?auto_132512 - BLOCK
      ?auto_132514 - BLOCK
      ?auto_132513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132506 ) ( not ( = ?auto_132506 ?auto_132507 ) ) ( not ( = ?auto_132506 ?auto_132508 ) ) ( not ( = ?auto_132506 ?auto_132509 ) ) ( not ( = ?auto_132506 ?auto_132510 ) ) ( not ( = ?auto_132506 ?auto_132511 ) ) ( not ( = ?auto_132507 ?auto_132508 ) ) ( not ( = ?auto_132507 ?auto_132509 ) ) ( not ( = ?auto_132507 ?auto_132510 ) ) ( not ( = ?auto_132507 ?auto_132511 ) ) ( not ( = ?auto_132508 ?auto_132509 ) ) ( not ( = ?auto_132508 ?auto_132510 ) ) ( not ( = ?auto_132508 ?auto_132511 ) ) ( not ( = ?auto_132509 ?auto_132510 ) ) ( not ( = ?auto_132509 ?auto_132511 ) ) ( not ( = ?auto_132510 ?auto_132511 ) ) ( ON ?auto_132511 ?auto_132512 ) ( not ( = ?auto_132506 ?auto_132512 ) ) ( not ( = ?auto_132507 ?auto_132512 ) ) ( not ( = ?auto_132508 ?auto_132512 ) ) ( not ( = ?auto_132509 ?auto_132512 ) ) ( not ( = ?auto_132510 ?auto_132512 ) ) ( not ( = ?auto_132511 ?auto_132512 ) ) ( ON ?auto_132510 ?auto_132511 ) ( ON-TABLE ?auto_132514 ) ( ON ?auto_132513 ?auto_132514 ) ( ON ?auto_132512 ?auto_132513 ) ( not ( = ?auto_132514 ?auto_132513 ) ) ( not ( = ?auto_132514 ?auto_132512 ) ) ( not ( = ?auto_132514 ?auto_132511 ) ) ( not ( = ?auto_132514 ?auto_132510 ) ) ( not ( = ?auto_132513 ?auto_132512 ) ) ( not ( = ?auto_132513 ?auto_132511 ) ) ( not ( = ?auto_132513 ?auto_132510 ) ) ( not ( = ?auto_132506 ?auto_132514 ) ) ( not ( = ?auto_132506 ?auto_132513 ) ) ( not ( = ?auto_132507 ?auto_132514 ) ) ( not ( = ?auto_132507 ?auto_132513 ) ) ( not ( = ?auto_132508 ?auto_132514 ) ) ( not ( = ?auto_132508 ?auto_132513 ) ) ( not ( = ?auto_132509 ?auto_132514 ) ) ( not ( = ?auto_132509 ?auto_132513 ) ) ( ON ?auto_132509 ?auto_132510 ) ( ON ?auto_132508 ?auto_132509 ) ( CLEAR ?auto_132506 ) ( ON ?auto_132507 ?auto_132508 ) ( CLEAR ?auto_132507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132514 ?auto_132513 ?auto_132512 ?auto_132511 ?auto_132510 ?auto_132509 ?auto_132508 )
      ( MAKE-6PILE ?auto_132506 ?auto_132507 ?auto_132508 ?auto_132509 ?auto_132510 ?auto_132511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132515 - BLOCK
      ?auto_132516 - BLOCK
      ?auto_132517 - BLOCK
      ?auto_132518 - BLOCK
      ?auto_132519 - BLOCK
      ?auto_132520 - BLOCK
    )
    :vars
    (
      ?auto_132523 - BLOCK
      ?auto_132521 - BLOCK
      ?auto_132522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132515 ?auto_132516 ) ) ( not ( = ?auto_132515 ?auto_132517 ) ) ( not ( = ?auto_132515 ?auto_132518 ) ) ( not ( = ?auto_132515 ?auto_132519 ) ) ( not ( = ?auto_132515 ?auto_132520 ) ) ( not ( = ?auto_132516 ?auto_132517 ) ) ( not ( = ?auto_132516 ?auto_132518 ) ) ( not ( = ?auto_132516 ?auto_132519 ) ) ( not ( = ?auto_132516 ?auto_132520 ) ) ( not ( = ?auto_132517 ?auto_132518 ) ) ( not ( = ?auto_132517 ?auto_132519 ) ) ( not ( = ?auto_132517 ?auto_132520 ) ) ( not ( = ?auto_132518 ?auto_132519 ) ) ( not ( = ?auto_132518 ?auto_132520 ) ) ( not ( = ?auto_132519 ?auto_132520 ) ) ( ON ?auto_132520 ?auto_132523 ) ( not ( = ?auto_132515 ?auto_132523 ) ) ( not ( = ?auto_132516 ?auto_132523 ) ) ( not ( = ?auto_132517 ?auto_132523 ) ) ( not ( = ?auto_132518 ?auto_132523 ) ) ( not ( = ?auto_132519 ?auto_132523 ) ) ( not ( = ?auto_132520 ?auto_132523 ) ) ( ON ?auto_132519 ?auto_132520 ) ( ON-TABLE ?auto_132521 ) ( ON ?auto_132522 ?auto_132521 ) ( ON ?auto_132523 ?auto_132522 ) ( not ( = ?auto_132521 ?auto_132522 ) ) ( not ( = ?auto_132521 ?auto_132523 ) ) ( not ( = ?auto_132521 ?auto_132520 ) ) ( not ( = ?auto_132521 ?auto_132519 ) ) ( not ( = ?auto_132522 ?auto_132523 ) ) ( not ( = ?auto_132522 ?auto_132520 ) ) ( not ( = ?auto_132522 ?auto_132519 ) ) ( not ( = ?auto_132515 ?auto_132521 ) ) ( not ( = ?auto_132515 ?auto_132522 ) ) ( not ( = ?auto_132516 ?auto_132521 ) ) ( not ( = ?auto_132516 ?auto_132522 ) ) ( not ( = ?auto_132517 ?auto_132521 ) ) ( not ( = ?auto_132517 ?auto_132522 ) ) ( not ( = ?auto_132518 ?auto_132521 ) ) ( not ( = ?auto_132518 ?auto_132522 ) ) ( ON ?auto_132518 ?auto_132519 ) ( ON ?auto_132517 ?auto_132518 ) ( ON ?auto_132516 ?auto_132517 ) ( CLEAR ?auto_132516 ) ( HOLDING ?auto_132515 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132515 )
      ( MAKE-6PILE ?auto_132515 ?auto_132516 ?auto_132517 ?auto_132518 ?auto_132519 ?auto_132520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132524 - BLOCK
      ?auto_132525 - BLOCK
      ?auto_132526 - BLOCK
      ?auto_132527 - BLOCK
      ?auto_132528 - BLOCK
      ?auto_132529 - BLOCK
    )
    :vars
    (
      ?auto_132530 - BLOCK
      ?auto_132531 - BLOCK
      ?auto_132532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132524 ?auto_132525 ) ) ( not ( = ?auto_132524 ?auto_132526 ) ) ( not ( = ?auto_132524 ?auto_132527 ) ) ( not ( = ?auto_132524 ?auto_132528 ) ) ( not ( = ?auto_132524 ?auto_132529 ) ) ( not ( = ?auto_132525 ?auto_132526 ) ) ( not ( = ?auto_132525 ?auto_132527 ) ) ( not ( = ?auto_132525 ?auto_132528 ) ) ( not ( = ?auto_132525 ?auto_132529 ) ) ( not ( = ?auto_132526 ?auto_132527 ) ) ( not ( = ?auto_132526 ?auto_132528 ) ) ( not ( = ?auto_132526 ?auto_132529 ) ) ( not ( = ?auto_132527 ?auto_132528 ) ) ( not ( = ?auto_132527 ?auto_132529 ) ) ( not ( = ?auto_132528 ?auto_132529 ) ) ( ON ?auto_132529 ?auto_132530 ) ( not ( = ?auto_132524 ?auto_132530 ) ) ( not ( = ?auto_132525 ?auto_132530 ) ) ( not ( = ?auto_132526 ?auto_132530 ) ) ( not ( = ?auto_132527 ?auto_132530 ) ) ( not ( = ?auto_132528 ?auto_132530 ) ) ( not ( = ?auto_132529 ?auto_132530 ) ) ( ON ?auto_132528 ?auto_132529 ) ( ON-TABLE ?auto_132531 ) ( ON ?auto_132532 ?auto_132531 ) ( ON ?auto_132530 ?auto_132532 ) ( not ( = ?auto_132531 ?auto_132532 ) ) ( not ( = ?auto_132531 ?auto_132530 ) ) ( not ( = ?auto_132531 ?auto_132529 ) ) ( not ( = ?auto_132531 ?auto_132528 ) ) ( not ( = ?auto_132532 ?auto_132530 ) ) ( not ( = ?auto_132532 ?auto_132529 ) ) ( not ( = ?auto_132532 ?auto_132528 ) ) ( not ( = ?auto_132524 ?auto_132531 ) ) ( not ( = ?auto_132524 ?auto_132532 ) ) ( not ( = ?auto_132525 ?auto_132531 ) ) ( not ( = ?auto_132525 ?auto_132532 ) ) ( not ( = ?auto_132526 ?auto_132531 ) ) ( not ( = ?auto_132526 ?auto_132532 ) ) ( not ( = ?auto_132527 ?auto_132531 ) ) ( not ( = ?auto_132527 ?auto_132532 ) ) ( ON ?auto_132527 ?auto_132528 ) ( ON ?auto_132526 ?auto_132527 ) ( ON ?auto_132525 ?auto_132526 ) ( ON ?auto_132524 ?auto_132525 ) ( CLEAR ?auto_132524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132531 ?auto_132532 ?auto_132530 ?auto_132529 ?auto_132528 ?auto_132527 ?auto_132526 ?auto_132525 )
      ( MAKE-6PILE ?auto_132524 ?auto_132525 ?auto_132526 ?auto_132527 ?auto_132528 ?auto_132529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132535 - BLOCK
      ?auto_132536 - BLOCK
    )
    :vars
    (
      ?auto_132537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132537 ?auto_132536 ) ( CLEAR ?auto_132537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132535 ) ( ON ?auto_132536 ?auto_132535 ) ( not ( = ?auto_132535 ?auto_132536 ) ) ( not ( = ?auto_132535 ?auto_132537 ) ) ( not ( = ?auto_132536 ?auto_132537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132537 ?auto_132536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132538 - BLOCK
      ?auto_132539 - BLOCK
    )
    :vars
    (
      ?auto_132540 - BLOCK
      ?auto_132541 - BLOCK
      ?auto_132542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132540 ?auto_132539 ) ( CLEAR ?auto_132540 ) ( ON-TABLE ?auto_132538 ) ( ON ?auto_132539 ?auto_132538 ) ( not ( = ?auto_132538 ?auto_132539 ) ) ( not ( = ?auto_132538 ?auto_132540 ) ) ( not ( = ?auto_132539 ?auto_132540 ) ) ( HOLDING ?auto_132541 ) ( CLEAR ?auto_132542 ) ( not ( = ?auto_132538 ?auto_132541 ) ) ( not ( = ?auto_132538 ?auto_132542 ) ) ( not ( = ?auto_132539 ?auto_132541 ) ) ( not ( = ?auto_132539 ?auto_132542 ) ) ( not ( = ?auto_132540 ?auto_132541 ) ) ( not ( = ?auto_132540 ?auto_132542 ) ) ( not ( = ?auto_132541 ?auto_132542 ) ) )
    :subtasks
    ( ( !STACK ?auto_132541 ?auto_132542 )
      ( MAKE-2PILE ?auto_132538 ?auto_132539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132543 - BLOCK
      ?auto_132544 - BLOCK
    )
    :vars
    (
      ?auto_132546 - BLOCK
      ?auto_132547 - BLOCK
      ?auto_132545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132546 ?auto_132544 ) ( ON-TABLE ?auto_132543 ) ( ON ?auto_132544 ?auto_132543 ) ( not ( = ?auto_132543 ?auto_132544 ) ) ( not ( = ?auto_132543 ?auto_132546 ) ) ( not ( = ?auto_132544 ?auto_132546 ) ) ( CLEAR ?auto_132547 ) ( not ( = ?auto_132543 ?auto_132545 ) ) ( not ( = ?auto_132543 ?auto_132547 ) ) ( not ( = ?auto_132544 ?auto_132545 ) ) ( not ( = ?auto_132544 ?auto_132547 ) ) ( not ( = ?auto_132546 ?auto_132545 ) ) ( not ( = ?auto_132546 ?auto_132547 ) ) ( not ( = ?auto_132545 ?auto_132547 ) ) ( ON ?auto_132545 ?auto_132546 ) ( CLEAR ?auto_132545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132543 ?auto_132544 ?auto_132546 )
      ( MAKE-2PILE ?auto_132543 ?auto_132544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132548 - BLOCK
      ?auto_132549 - BLOCK
    )
    :vars
    (
      ?auto_132552 - BLOCK
      ?auto_132551 - BLOCK
      ?auto_132550 - BLOCK
      ?auto_132555 - BLOCK
      ?auto_132554 - BLOCK
      ?auto_132553 - BLOCK
      ?auto_132556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132552 ?auto_132549 ) ( ON-TABLE ?auto_132548 ) ( ON ?auto_132549 ?auto_132548 ) ( not ( = ?auto_132548 ?auto_132549 ) ) ( not ( = ?auto_132548 ?auto_132552 ) ) ( not ( = ?auto_132549 ?auto_132552 ) ) ( not ( = ?auto_132548 ?auto_132551 ) ) ( not ( = ?auto_132548 ?auto_132550 ) ) ( not ( = ?auto_132549 ?auto_132551 ) ) ( not ( = ?auto_132549 ?auto_132550 ) ) ( not ( = ?auto_132552 ?auto_132551 ) ) ( not ( = ?auto_132552 ?auto_132550 ) ) ( not ( = ?auto_132551 ?auto_132550 ) ) ( ON ?auto_132551 ?auto_132552 ) ( CLEAR ?auto_132551 ) ( HOLDING ?auto_132550 ) ( CLEAR ?auto_132555 ) ( ON-TABLE ?auto_132554 ) ( ON ?auto_132553 ?auto_132554 ) ( ON ?auto_132556 ?auto_132553 ) ( ON ?auto_132555 ?auto_132556 ) ( not ( = ?auto_132554 ?auto_132553 ) ) ( not ( = ?auto_132554 ?auto_132556 ) ) ( not ( = ?auto_132554 ?auto_132555 ) ) ( not ( = ?auto_132554 ?auto_132550 ) ) ( not ( = ?auto_132553 ?auto_132556 ) ) ( not ( = ?auto_132553 ?auto_132555 ) ) ( not ( = ?auto_132553 ?auto_132550 ) ) ( not ( = ?auto_132556 ?auto_132555 ) ) ( not ( = ?auto_132556 ?auto_132550 ) ) ( not ( = ?auto_132555 ?auto_132550 ) ) ( not ( = ?auto_132548 ?auto_132555 ) ) ( not ( = ?auto_132548 ?auto_132554 ) ) ( not ( = ?auto_132548 ?auto_132553 ) ) ( not ( = ?auto_132548 ?auto_132556 ) ) ( not ( = ?auto_132549 ?auto_132555 ) ) ( not ( = ?auto_132549 ?auto_132554 ) ) ( not ( = ?auto_132549 ?auto_132553 ) ) ( not ( = ?auto_132549 ?auto_132556 ) ) ( not ( = ?auto_132552 ?auto_132555 ) ) ( not ( = ?auto_132552 ?auto_132554 ) ) ( not ( = ?auto_132552 ?auto_132553 ) ) ( not ( = ?auto_132552 ?auto_132556 ) ) ( not ( = ?auto_132551 ?auto_132555 ) ) ( not ( = ?auto_132551 ?auto_132554 ) ) ( not ( = ?auto_132551 ?auto_132553 ) ) ( not ( = ?auto_132551 ?auto_132556 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132554 ?auto_132553 ?auto_132556 ?auto_132555 ?auto_132550 )
      ( MAKE-2PILE ?auto_132548 ?auto_132549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132557 - BLOCK
      ?auto_132558 - BLOCK
    )
    :vars
    (
      ?auto_132565 - BLOCK
      ?auto_132563 - BLOCK
      ?auto_132560 - BLOCK
      ?auto_132564 - BLOCK
      ?auto_132562 - BLOCK
      ?auto_132561 - BLOCK
      ?auto_132559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132565 ?auto_132558 ) ( ON-TABLE ?auto_132557 ) ( ON ?auto_132558 ?auto_132557 ) ( not ( = ?auto_132557 ?auto_132558 ) ) ( not ( = ?auto_132557 ?auto_132565 ) ) ( not ( = ?auto_132558 ?auto_132565 ) ) ( not ( = ?auto_132557 ?auto_132563 ) ) ( not ( = ?auto_132557 ?auto_132560 ) ) ( not ( = ?auto_132558 ?auto_132563 ) ) ( not ( = ?auto_132558 ?auto_132560 ) ) ( not ( = ?auto_132565 ?auto_132563 ) ) ( not ( = ?auto_132565 ?auto_132560 ) ) ( not ( = ?auto_132563 ?auto_132560 ) ) ( ON ?auto_132563 ?auto_132565 ) ( CLEAR ?auto_132564 ) ( ON-TABLE ?auto_132562 ) ( ON ?auto_132561 ?auto_132562 ) ( ON ?auto_132559 ?auto_132561 ) ( ON ?auto_132564 ?auto_132559 ) ( not ( = ?auto_132562 ?auto_132561 ) ) ( not ( = ?auto_132562 ?auto_132559 ) ) ( not ( = ?auto_132562 ?auto_132564 ) ) ( not ( = ?auto_132562 ?auto_132560 ) ) ( not ( = ?auto_132561 ?auto_132559 ) ) ( not ( = ?auto_132561 ?auto_132564 ) ) ( not ( = ?auto_132561 ?auto_132560 ) ) ( not ( = ?auto_132559 ?auto_132564 ) ) ( not ( = ?auto_132559 ?auto_132560 ) ) ( not ( = ?auto_132564 ?auto_132560 ) ) ( not ( = ?auto_132557 ?auto_132564 ) ) ( not ( = ?auto_132557 ?auto_132562 ) ) ( not ( = ?auto_132557 ?auto_132561 ) ) ( not ( = ?auto_132557 ?auto_132559 ) ) ( not ( = ?auto_132558 ?auto_132564 ) ) ( not ( = ?auto_132558 ?auto_132562 ) ) ( not ( = ?auto_132558 ?auto_132561 ) ) ( not ( = ?auto_132558 ?auto_132559 ) ) ( not ( = ?auto_132565 ?auto_132564 ) ) ( not ( = ?auto_132565 ?auto_132562 ) ) ( not ( = ?auto_132565 ?auto_132561 ) ) ( not ( = ?auto_132565 ?auto_132559 ) ) ( not ( = ?auto_132563 ?auto_132564 ) ) ( not ( = ?auto_132563 ?auto_132562 ) ) ( not ( = ?auto_132563 ?auto_132561 ) ) ( not ( = ?auto_132563 ?auto_132559 ) ) ( ON ?auto_132560 ?auto_132563 ) ( CLEAR ?auto_132560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132557 ?auto_132558 ?auto_132565 ?auto_132563 )
      ( MAKE-2PILE ?auto_132557 ?auto_132558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132566 - BLOCK
      ?auto_132567 - BLOCK
    )
    :vars
    (
      ?auto_132571 - BLOCK
      ?auto_132572 - BLOCK
      ?auto_132568 - BLOCK
      ?auto_132570 - BLOCK
      ?auto_132569 - BLOCK
      ?auto_132573 - BLOCK
      ?auto_132574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132571 ?auto_132567 ) ( ON-TABLE ?auto_132566 ) ( ON ?auto_132567 ?auto_132566 ) ( not ( = ?auto_132566 ?auto_132567 ) ) ( not ( = ?auto_132566 ?auto_132571 ) ) ( not ( = ?auto_132567 ?auto_132571 ) ) ( not ( = ?auto_132566 ?auto_132572 ) ) ( not ( = ?auto_132566 ?auto_132568 ) ) ( not ( = ?auto_132567 ?auto_132572 ) ) ( not ( = ?auto_132567 ?auto_132568 ) ) ( not ( = ?auto_132571 ?auto_132572 ) ) ( not ( = ?auto_132571 ?auto_132568 ) ) ( not ( = ?auto_132572 ?auto_132568 ) ) ( ON ?auto_132572 ?auto_132571 ) ( ON-TABLE ?auto_132570 ) ( ON ?auto_132569 ?auto_132570 ) ( ON ?auto_132573 ?auto_132569 ) ( not ( = ?auto_132570 ?auto_132569 ) ) ( not ( = ?auto_132570 ?auto_132573 ) ) ( not ( = ?auto_132570 ?auto_132574 ) ) ( not ( = ?auto_132570 ?auto_132568 ) ) ( not ( = ?auto_132569 ?auto_132573 ) ) ( not ( = ?auto_132569 ?auto_132574 ) ) ( not ( = ?auto_132569 ?auto_132568 ) ) ( not ( = ?auto_132573 ?auto_132574 ) ) ( not ( = ?auto_132573 ?auto_132568 ) ) ( not ( = ?auto_132574 ?auto_132568 ) ) ( not ( = ?auto_132566 ?auto_132574 ) ) ( not ( = ?auto_132566 ?auto_132570 ) ) ( not ( = ?auto_132566 ?auto_132569 ) ) ( not ( = ?auto_132566 ?auto_132573 ) ) ( not ( = ?auto_132567 ?auto_132574 ) ) ( not ( = ?auto_132567 ?auto_132570 ) ) ( not ( = ?auto_132567 ?auto_132569 ) ) ( not ( = ?auto_132567 ?auto_132573 ) ) ( not ( = ?auto_132571 ?auto_132574 ) ) ( not ( = ?auto_132571 ?auto_132570 ) ) ( not ( = ?auto_132571 ?auto_132569 ) ) ( not ( = ?auto_132571 ?auto_132573 ) ) ( not ( = ?auto_132572 ?auto_132574 ) ) ( not ( = ?auto_132572 ?auto_132570 ) ) ( not ( = ?auto_132572 ?auto_132569 ) ) ( not ( = ?auto_132572 ?auto_132573 ) ) ( ON ?auto_132568 ?auto_132572 ) ( CLEAR ?auto_132568 ) ( HOLDING ?auto_132574 ) ( CLEAR ?auto_132573 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132570 ?auto_132569 ?auto_132573 ?auto_132574 )
      ( MAKE-2PILE ?auto_132566 ?auto_132567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132575 - BLOCK
      ?auto_132576 - BLOCK
    )
    :vars
    (
      ?auto_132578 - BLOCK
      ?auto_132582 - BLOCK
      ?auto_132581 - BLOCK
      ?auto_132579 - BLOCK
      ?auto_132580 - BLOCK
      ?auto_132577 - BLOCK
      ?auto_132583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132578 ?auto_132576 ) ( ON-TABLE ?auto_132575 ) ( ON ?auto_132576 ?auto_132575 ) ( not ( = ?auto_132575 ?auto_132576 ) ) ( not ( = ?auto_132575 ?auto_132578 ) ) ( not ( = ?auto_132576 ?auto_132578 ) ) ( not ( = ?auto_132575 ?auto_132582 ) ) ( not ( = ?auto_132575 ?auto_132581 ) ) ( not ( = ?auto_132576 ?auto_132582 ) ) ( not ( = ?auto_132576 ?auto_132581 ) ) ( not ( = ?auto_132578 ?auto_132582 ) ) ( not ( = ?auto_132578 ?auto_132581 ) ) ( not ( = ?auto_132582 ?auto_132581 ) ) ( ON ?auto_132582 ?auto_132578 ) ( ON-TABLE ?auto_132579 ) ( ON ?auto_132580 ?auto_132579 ) ( ON ?auto_132577 ?auto_132580 ) ( not ( = ?auto_132579 ?auto_132580 ) ) ( not ( = ?auto_132579 ?auto_132577 ) ) ( not ( = ?auto_132579 ?auto_132583 ) ) ( not ( = ?auto_132579 ?auto_132581 ) ) ( not ( = ?auto_132580 ?auto_132577 ) ) ( not ( = ?auto_132580 ?auto_132583 ) ) ( not ( = ?auto_132580 ?auto_132581 ) ) ( not ( = ?auto_132577 ?auto_132583 ) ) ( not ( = ?auto_132577 ?auto_132581 ) ) ( not ( = ?auto_132583 ?auto_132581 ) ) ( not ( = ?auto_132575 ?auto_132583 ) ) ( not ( = ?auto_132575 ?auto_132579 ) ) ( not ( = ?auto_132575 ?auto_132580 ) ) ( not ( = ?auto_132575 ?auto_132577 ) ) ( not ( = ?auto_132576 ?auto_132583 ) ) ( not ( = ?auto_132576 ?auto_132579 ) ) ( not ( = ?auto_132576 ?auto_132580 ) ) ( not ( = ?auto_132576 ?auto_132577 ) ) ( not ( = ?auto_132578 ?auto_132583 ) ) ( not ( = ?auto_132578 ?auto_132579 ) ) ( not ( = ?auto_132578 ?auto_132580 ) ) ( not ( = ?auto_132578 ?auto_132577 ) ) ( not ( = ?auto_132582 ?auto_132583 ) ) ( not ( = ?auto_132582 ?auto_132579 ) ) ( not ( = ?auto_132582 ?auto_132580 ) ) ( not ( = ?auto_132582 ?auto_132577 ) ) ( ON ?auto_132581 ?auto_132582 ) ( CLEAR ?auto_132577 ) ( ON ?auto_132583 ?auto_132581 ) ( CLEAR ?auto_132583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132575 ?auto_132576 ?auto_132578 ?auto_132582 ?auto_132581 )
      ( MAKE-2PILE ?auto_132575 ?auto_132576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132584 - BLOCK
      ?auto_132585 - BLOCK
    )
    :vars
    (
      ?auto_132589 - BLOCK
      ?auto_132592 - BLOCK
      ?auto_132586 - BLOCK
      ?auto_132588 - BLOCK
      ?auto_132587 - BLOCK
      ?auto_132591 - BLOCK
      ?auto_132590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132589 ?auto_132585 ) ( ON-TABLE ?auto_132584 ) ( ON ?auto_132585 ?auto_132584 ) ( not ( = ?auto_132584 ?auto_132585 ) ) ( not ( = ?auto_132584 ?auto_132589 ) ) ( not ( = ?auto_132585 ?auto_132589 ) ) ( not ( = ?auto_132584 ?auto_132592 ) ) ( not ( = ?auto_132584 ?auto_132586 ) ) ( not ( = ?auto_132585 ?auto_132592 ) ) ( not ( = ?auto_132585 ?auto_132586 ) ) ( not ( = ?auto_132589 ?auto_132592 ) ) ( not ( = ?auto_132589 ?auto_132586 ) ) ( not ( = ?auto_132592 ?auto_132586 ) ) ( ON ?auto_132592 ?auto_132589 ) ( ON-TABLE ?auto_132588 ) ( ON ?auto_132587 ?auto_132588 ) ( not ( = ?auto_132588 ?auto_132587 ) ) ( not ( = ?auto_132588 ?auto_132591 ) ) ( not ( = ?auto_132588 ?auto_132590 ) ) ( not ( = ?auto_132588 ?auto_132586 ) ) ( not ( = ?auto_132587 ?auto_132591 ) ) ( not ( = ?auto_132587 ?auto_132590 ) ) ( not ( = ?auto_132587 ?auto_132586 ) ) ( not ( = ?auto_132591 ?auto_132590 ) ) ( not ( = ?auto_132591 ?auto_132586 ) ) ( not ( = ?auto_132590 ?auto_132586 ) ) ( not ( = ?auto_132584 ?auto_132590 ) ) ( not ( = ?auto_132584 ?auto_132588 ) ) ( not ( = ?auto_132584 ?auto_132587 ) ) ( not ( = ?auto_132584 ?auto_132591 ) ) ( not ( = ?auto_132585 ?auto_132590 ) ) ( not ( = ?auto_132585 ?auto_132588 ) ) ( not ( = ?auto_132585 ?auto_132587 ) ) ( not ( = ?auto_132585 ?auto_132591 ) ) ( not ( = ?auto_132589 ?auto_132590 ) ) ( not ( = ?auto_132589 ?auto_132588 ) ) ( not ( = ?auto_132589 ?auto_132587 ) ) ( not ( = ?auto_132589 ?auto_132591 ) ) ( not ( = ?auto_132592 ?auto_132590 ) ) ( not ( = ?auto_132592 ?auto_132588 ) ) ( not ( = ?auto_132592 ?auto_132587 ) ) ( not ( = ?auto_132592 ?auto_132591 ) ) ( ON ?auto_132586 ?auto_132592 ) ( ON ?auto_132590 ?auto_132586 ) ( CLEAR ?auto_132590 ) ( HOLDING ?auto_132591 ) ( CLEAR ?auto_132587 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132588 ?auto_132587 ?auto_132591 )
      ( MAKE-2PILE ?auto_132584 ?auto_132585 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132593 - BLOCK
      ?auto_132594 - BLOCK
    )
    :vars
    (
      ?auto_132595 - BLOCK
      ?auto_132598 - BLOCK
      ?auto_132597 - BLOCK
      ?auto_132601 - BLOCK
      ?auto_132600 - BLOCK
      ?auto_132596 - BLOCK
      ?auto_132599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132595 ?auto_132594 ) ( ON-TABLE ?auto_132593 ) ( ON ?auto_132594 ?auto_132593 ) ( not ( = ?auto_132593 ?auto_132594 ) ) ( not ( = ?auto_132593 ?auto_132595 ) ) ( not ( = ?auto_132594 ?auto_132595 ) ) ( not ( = ?auto_132593 ?auto_132598 ) ) ( not ( = ?auto_132593 ?auto_132597 ) ) ( not ( = ?auto_132594 ?auto_132598 ) ) ( not ( = ?auto_132594 ?auto_132597 ) ) ( not ( = ?auto_132595 ?auto_132598 ) ) ( not ( = ?auto_132595 ?auto_132597 ) ) ( not ( = ?auto_132598 ?auto_132597 ) ) ( ON ?auto_132598 ?auto_132595 ) ( ON-TABLE ?auto_132601 ) ( ON ?auto_132600 ?auto_132601 ) ( not ( = ?auto_132601 ?auto_132600 ) ) ( not ( = ?auto_132601 ?auto_132596 ) ) ( not ( = ?auto_132601 ?auto_132599 ) ) ( not ( = ?auto_132601 ?auto_132597 ) ) ( not ( = ?auto_132600 ?auto_132596 ) ) ( not ( = ?auto_132600 ?auto_132599 ) ) ( not ( = ?auto_132600 ?auto_132597 ) ) ( not ( = ?auto_132596 ?auto_132599 ) ) ( not ( = ?auto_132596 ?auto_132597 ) ) ( not ( = ?auto_132599 ?auto_132597 ) ) ( not ( = ?auto_132593 ?auto_132599 ) ) ( not ( = ?auto_132593 ?auto_132601 ) ) ( not ( = ?auto_132593 ?auto_132600 ) ) ( not ( = ?auto_132593 ?auto_132596 ) ) ( not ( = ?auto_132594 ?auto_132599 ) ) ( not ( = ?auto_132594 ?auto_132601 ) ) ( not ( = ?auto_132594 ?auto_132600 ) ) ( not ( = ?auto_132594 ?auto_132596 ) ) ( not ( = ?auto_132595 ?auto_132599 ) ) ( not ( = ?auto_132595 ?auto_132601 ) ) ( not ( = ?auto_132595 ?auto_132600 ) ) ( not ( = ?auto_132595 ?auto_132596 ) ) ( not ( = ?auto_132598 ?auto_132599 ) ) ( not ( = ?auto_132598 ?auto_132601 ) ) ( not ( = ?auto_132598 ?auto_132600 ) ) ( not ( = ?auto_132598 ?auto_132596 ) ) ( ON ?auto_132597 ?auto_132598 ) ( ON ?auto_132599 ?auto_132597 ) ( CLEAR ?auto_132600 ) ( ON ?auto_132596 ?auto_132599 ) ( CLEAR ?auto_132596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132593 ?auto_132594 ?auto_132595 ?auto_132598 ?auto_132597 ?auto_132599 )
      ( MAKE-2PILE ?auto_132593 ?auto_132594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132602 - BLOCK
      ?auto_132603 - BLOCK
    )
    :vars
    (
      ?auto_132604 - BLOCK
      ?auto_132610 - BLOCK
      ?auto_132608 - BLOCK
      ?auto_132606 - BLOCK
      ?auto_132607 - BLOCK
      ?auto_132609 - BLOCK
      ?auto_132605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132604 ?auto_132603 ) ( ON-TABLE ?auto_132602 ) ( ON ?auto_132603 ?auto_132602 ) ( not ( = ?auto_132602 ?auto_132603 ) ) ( not ( = ?auto_132602 ?auto_132604 ) ) ( not ( = ?auto_132603 ?auto_132604 ) ) ( not ( = ?auto_132602 ?auto_132610 ) ) ( not ( = ?auto_132602 ?auto_132608 ) ) ( not ( = ?auto_132603 ?auto_132610 ) ) ( not ( = ?auto_132603 ?auto_132608 ) ) ( not ( = ?auto_132604 ?auto_132610 ) ) ( not ( = ?auto_132604 ?auto_132608 ) ) ( not ( = ?auto_132610 ?auto_132608 ) ) ( ON ?auto_132610 ?auto_132604 ) ( ON-TABLE ?auto_132606 ) ( not ( = ?auto_132606 ?auto_132607 ) ) ( not ( = ?auto_132606 ?auto_132609 ) ) ( not ( = ?auto_132606 ?auto_132605 ) ) ( not ( = ?auto_132606 ?auto_132608 ) ) ( not ( = ?auto_132607 ?auto_132609 ) ) ( not ( = ?auto_132607 ?auto_132605 ) ) ( not ( = ?auto_132607 ?auto_132608 ) ) ( not ( = ?auto_132609 ?auto_132605 ) ) ( not ( = ?auto_132609 ?auto_132608 ) ) ( not ( = ?auto_132605 ?auto_132608 ) ) ( not ( = ?auto_132602 ?auto_132605 ) ) ( not ( = ?auto_132602 ?auto_132606 ) ) ( not ( = ?auto_132602 ?auto_132607 ) ) ( not ( = ?auto_132602 ?auto_132609 ) ) ( not ( = ?auto_132603 ?auto_132605 ) ) ( not ( = ?auto_132603 ?auto_132606 ) ) ( not ( = ?auto_132603 ?auto_132607 ) ) ( not ( = ?auto_132603 ?auto_132609 ) ) ( not ( = ?auto_132604 ?auto_132605 ) ) ( not ( = ?auto_132604 ?auto_132606 ) ) ( not ( = ?auto_132604 ?auto_132607 ) ) ( not ( = ?auto_132604 ?auto_132609 ) ) ( not ( = ?auto_132610 ?auto_132605 ) ) ( not ( = ?auto_132610 ?auto_132606 ) ) ( not ( = ?auto_132610 ?auto_132607 ) ) ( not ( = ?auto_132610 ?auto_132609 ) ) ( ON ?auto_132608 ?auto_132610 ) ( ON ?auto_132605 ?auto_132608 ) ( ON ?auto_132609 ?auto_132605 ) ( CLEAR ?auto_132609 ) ( HOLDING ?auto_132607 ) ( CLEAR ?auto_132606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132606 ?auto_132607 )
      ( MAKE-2PILE ?auto_132602 ?auto_132603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134629 - BLOCK
      ?auto_134630 - BLOCK
    )
    :vars
    (
      ?auto_134631 - BLOCK
      ?auto_134635 - BLOCK
      ?auto_134634 - BLOCK
      ?auto_134636 - BLOCK
      ?auto_134633 - BLOCK
      ?auto_134632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134631 ?auto_134630 ) ( ON-TABLE ?auto_134629 ) ( ON ?auto_134630 ?auto_134629 ) ( not ( = ?auto_134629 ?auto_134630 ) ) ( not ( = ?auto_134629 ?auto_134631 ) ) ( not ( = ?auto_134630 ?auto_134631 ) ) ( not ( = ?auto_134629 ?auto_134635 ) ) ( not ( = ?auto_134629 ?auto_134634 ) ) ( not ( = ?auto_134630 ?auto_134635 ) ) ( not ( = ?auto_134630 ?auto_134634 ) ) ( not ( = ?auto_134631 ?auto_134635 ) ) ( not ( = ?auto_134631 ?auto_134634 ) ) ( not ( = ?auto_134635 ?auto_134634 ) ) ( ON ?auto_134635 ?auto_134631 ) ( not ( = ?auto_134636 ?auto_134633 ) ) ( not ( = ?auto_134636 ?auto_134632 ) ) ( not ( = ?auto_134636 ?auto_134634 ) ) ( not ( = ?auto_134633 ?auto_134632 ) ) ( not ( = ?auto_134633 ?auto_134634 ) ) ( not ( = ?auto_134632 ?auto_134634 ) ) ( not ( = ?auto_134629 ?auto_134632 ) ) ( not ( = ?auto_134629 ?auto_134636 ) ) ( not ( = ?auto_134629 ?auto_134633 ) ) ( not ( = ?auto_134630 ?auto_134632 ) ) ( not ( = ?auto_134630 ?auto_134636 ) ) ( not ( = ?auto_134630 ?auto_134633 ) ) ( not ( = ?auto_134631 ?auto_134632 ) ) ( not ( = ?auto_134631 ?auto_134636 ) ) ( not ( = ?auto_134631 ?auto_134633 ) ) ( not ( = ?auto_134635 ?auto_134632 ) ) ( not ( = ?auto_134635 ?auto_134636 ) ) ( not ( = ?auto_134635 ?auto_134633 ) ) ( ON ?auto_134634 ?auto_134635 ) ( ON ?auto_134632 ?auto_134634 ) ( ON ?auto_134633 ?auto_134632 ) ( ON ?auto_134636 ?auto_134633 ) ( CLEAR ?auto_134636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134629 ?auto_134630 ?auto_134631 ?auto_134635 ?auto_134634 ?auto_134632 ?auto_134633 )
      ( MAKE-2PILE ?auto_134629 ?auto_134630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132620 - BLOCK
      ?auto_132621 - BLOCK
    )
    :vars
    (
      ?auto_132626 - BLOCK
      ?auto_132627 - BLOCK
      ?auto_132622 - BLOCK
      ?auto_132625 - BLOCK
      ?auto_132623 - BLOCK
      ?auto_132628 - BLOCK
      ?auto_132624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132626 ?auto_132621 ) ( ON-TABLE ?auto_132620 ) ( ON ?auto_132621 ?auto_132620 ) ( not ( = ?auto_132620 ?auto_132621 ) ) ( not ( = ?auto_132620 ?auto_132626 ) ) ( not ( = ?auto_132621 ?auto_132626 ) ) ( not ( = ?auto_132620 ?auto_132627 ) ) ( not ( = ?auto_132620 ?auto_132622 ) ) ( not ( = ?auto_132621 ?auto_132627 ) ) ( not ( = ?auto_132621 ?auto_132622 ) ) ( not ( = ?auto_132626 ?auto_132627 ) ) ( not ( = ?auto_132626 ?auto_132622 ) ) ( not ( = ?auto_132627 ?auto_132622 ) ) ( ON ?auto_132627 ?auto_132626 ) ( not ( = ?auto_132625 ?auto_132623 ) ) ( not ( = ?auto_132625 ?auto_132628 ) ) ( not ( = ?auto_132625 ?auto_132624 ) ) ( not ( = ?auto_132625 ?auto_132622 ) ) ( not ( = ?auto_132623 ?auto_132628 ) ) ( not ( = ?auto_132623 ?auto_132624 ) ) ( not ( = ?auto_132623 ?auto_132622 ) ) ( not ( = ?auto_132628 ?auto_132624 ) ) ( not ( = ?auto_132628 ?auto_132622 ) ) ( not ( = ?auto_132624 ?auto_132622 ) ) ( not ( = ?auto_132620 ?auto_132624 ) ) ( not ( = ?auto_132620 ?auto_132625 ) ) ( not ( = ?auto_132620 ?auto_132623 ) ) ( not ( = ?auto_132620 ?auto_132628 ) ) ( not ( = ?auto_132621 ?auto_132624 ) ) ( not ( = ?auto_132621 ?auto_132625 ) ) ( not ( = ?auto_132621 ?auto_132623 ) ) ( not ( = ?auto_132621 ?auto_132628 ) ) ( not ( = ?auto_132626 ?auto_132624 ) ) ( not ( = ?auto_132626 ?auto_132625 ) ) ( not ( = ?auto_132626 ?auto_132623 ) ) ( not ( = ?auto_132626 ?auto_132628 ) ) ( not ( = ?auto_132627 ?auto_132624 ) ) ( not ( = ?auto_132627 ?auto_132625 ) ) ( not ( = ?auto_132627 ?auto_132623 ) ) ( not ( = ?auto_132627 ?auto_132628 ) ) ( ON ?auto_132622 ?auto_132627 ) ( ON ?auto_132624 ?auto_132622 ) ( ON ?auto_132628 ?auto_132624 ) ( ON ?auto_132623 ?auto_132628 ) ( CLEAR ?auto_132623 ) ( HOLDING ?auto_132625 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132625 )
      ( MAKE-2PILE ?auto_132620 ?auto_132621 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132629 - BLOCK
      ?auto_132630 - BLOCK
    )
    :vars
    (
      ?auto_132637 - BLOCK
      ?auto_132631 - BLOCK
      ?auto_132636 - BLOCK
      ?auto_132633 - BLOCK
      ?auto_132635 - BLOCK
      ?auto_132634 - BLOCK
      ?auto_132632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132637 ?auto_132630 ) ( ON-TABLE ?auto_132629 ) ( ON ?auto_132630 ?auto_132629 ) ( not ( = ?auto_132629 ?auto_132630 ) ) ( not ( = ?auto_132629 ?auto_132637 ) ) ( not ( = ?auto_132630 ?auto_132637 ) ) ( not ( = ?auto_132629 ?auto_132631 ) ) ( not ( = ?auto_132629 ?auto_132636 ) ) ( not ( = ?auto_132630 ?auto_132631 ) ) ( not ( = ?auto_132630 ?auto_132636 ) ) ( not ( = ?auto_132637 ?auto_132631 ) ) ( not ( = ?auto_132637 ?auto_132636 ) ) ( not ( = ?auto_132631 ?auto_132636 ) ) ( ON ?auto_132631 ?auto_132637 ) ( not ( = ?auto_132633 ?auto_132635 ) ) ( not ( = ?auto_132633 ?auto_132634 ) ) ( not ( = ?auto_132633 ?auto_132632 ) ) ( not ( = ?auto_132633 ?auto_132636 ) ) ( not ( = ?auto_132635 ?auto_132634 ) ) ( not ( = ?auto_132635 ?auto_132632 ) ) ( not ( = ?auto_132635 ?auto_132636 ) ) ( not ( = ?auto_132634 ?auto_132632 ) ) ( not ( = ?auto_132634 ?auto_132636 ) ) ( not ( = ?auto_132632 ?auto_132636 ) ) ( not ( = ?auto_132629 ?auto_132632 ) ) ( not ( = ?auto_132629 ?auto_132633 ) ) ( not ( = ?auto_132629 ?auto_132635 ) ) ( not ( = ?auto_132629 ?auto_132634 ) ) ( not ( = ?auto_132630 ?auto_132632 ) ) ( not ( = ?auto_132630 ?auto_132633 ) ) ( not ( = ?auto_132630 ?auto_132635 ) ) ( not ( = ?auto_132630 ?auto_132634 ) ) ( not ( = ?auto_132637 ?auto_132632 ) ) ( not ( = ?auto_132637 ?auto_132633 ) ) ( not ( = ?auto_132637 ?auto_132635 ) ) ( not ( = ?auto_132637 ?auto_132634 ) ) ( not ( = ?auto_132631 ?auto_132632 ) ) ( not ( = ?auto_132631 ?auto_132633 ) ) ( not ( = ?auto_132631 ?auto_132635 ) ) ( not ( = ?auto_132631 ?auto_132634 ) ) ( ON ?auto_132636 ?auto_132631 ) ( ON ?auto_132632 ?auto_132636 ) ( ON ?auto_132634 ?auto_132632 ) ( ON ?auto_132635 ?auto_132634 ) ( ON ?auto_132633 ?auto_132635 ) ( CLEAR ?auto_132633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132629 ?auto_132630 ?auto_132637 ?auto_132631 ?auto_132636 ?auto_132632 ?auto_132634 ?auto_132635 )
      ( MAKE-2PILE ?auto_132629 ?auto_132630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132645 - BLOCK
      ?auto_132646 - BLOCK
      ?auto_132647 - BLOCK
      ?auto_132648 - BLOCK
      ?auto_132649 - BLOCK
      ?auto_132650 - BLOCK
      ?auto_132651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132651 ) ( CLEAR ?auto_132650 ) ( ON-TABLE ?auto_132645 ) ( ON ?auto_132646 ?auto_132645 ) ( ON ?auto_132647 ?auto_132646 ) ( ON ?auto_132648 ?auto_132647 ) ( ON ?auto_132649 ?auto_132648 ) ( ON ?auto_132650 ?auto_132649 ) ( not ( = ?auto_132645 ?auto_132646 ) ) ( not ( = ?auto_132645 ?auto_132647 ) ) ( not ( = ?auto_132645 ?auto_132648 ) ) ( not ( = ?auto_132645 ?auto_132649 ) ) ( not ( = ?auto_132645 ?auto_132650 ) ) ( not ( = ?auto_132645 ?auto_132651 ) ) ( not ( = ?auto_132646 ?auto_132647 ) ) ( not ( = ?auto_132646 ?auto_132648 ) ) ( not ( = ?auto_132646 ?auto_132649 ) ) ( not ( = ?auto_132646 ?auto_132650 ) ) ( not ( = ?auto_132646 ?auto_132651 ) ) ( not ( = ?auto_132647 ?auto_132648 ) ) ( not ( = ?auto_132647 ?auto_132649 ) ) ( not ( = ?auto_132647 ?auto_132650 ) ) ( not ( = ?auto_132647 ?auto_132651 ) ) ( not ( = ?auto_132648 ?auto_132649 ) ) ( not ( = ?auto_132648 ?auto_132650 ) ) ( not ( = ?auto_132648 ?auto_132651 ) ) ( not ( = ?auto_132649 ?auto_132650 ) ) ( not ( = ?auto_132649 ?auto_132651 ) ) ( not ( = ?auto_132650 ?auto_132651 ) ) )
    :subtasks
    ( ( !STACK ?auto_132651 ?auto_132650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132652 - BLOCK
      ?auto_132653 - BLOCK
      ?auto_132654 - BLOCK
      ?auto_132655 - BLOCK
      ?auto_132656 - BLOCK
      ?auto_132657 - BLOCK
      ?auto_132658 - BLOCK
    )
    :vars
    (
      ?auto_132659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132657 ) ( ON-TABLE ?auto_132652 ) ( ON ?auto_132653 ?auto_132652 ) ( ON ?auto_132654 ?auto_132653 ) ( ON ?auto_132655 ?auto_132654 ) ( ON ?auto_132656 ?auto_132655 ) ( ON ?auto_132657 ?auto_132656 ) ( not ( = ?auto_132652 ?auto_132653 ) ) ( not ( = ?auto_132652 ?auto_132654 ) ) ( not ( = ?auto_132652 ?auto_132655 ) ) ( not ( = ?auto_132652 ?auto_132656 ) ) ( not ( = ?auto_132652 ?auto_132657 ) ) ( not ( = ?auto_132652 ?auto_132658 ) ) ( not ( = ?auto_132653 ?auto_132654 ) ) ( not ( = ?auto_132653 ?auto_132655 ) ) ( not ( = ?auto_132653 ?auto_132656 ) ) ( not ( = ?auto_132653 ?auto_132657 ) ) ( not ( = ?auto_132653 ?auto_132658 ) ) ( not ( = ?auto_132654 ?auto_132655 ) ) ( not ( = ?auto_132654 ?auto_132656 ) ) ( not ( = ?auto_132654 ?auto_132657 ) ) ( not ( = ?auto_132654 ?auto_132658 ) ) ( not ( = ?auto_132655 ?auto_132656 ) ) ( not ( = ?auto_132655 ?auto_132657 ) ) ( not ( = ?auto_132655 ?auto_132658 ) ) ( not ( = ?auto_132656 ?auto_132657 ) ) ( not ( = ?auto_132656 ?auto_132658 ) ) ( not ( = ?auto_132657 ?auto_132658 ) ) ( ON ?auto_132658 ?auto_132659 ) ( CLEAR ?auto_132658 ) ( HAND-EMPTY ) ( not ( = ?auto_132652 ?auto_132659 ) ) ( not ( = ?auto_132653 ?auto_132659 ) ) ( not ( = ?auto_132654 ?auto_132659 ) ) ( not ( = ?auto_132655 ?auto_132659 ) ) ( not ( = ?auto_132656 ?auto_132659 ) ) ( not ( = ?auto_132657 ?auto_132659 ) ) ( not ( = ?auto_132658 ?auto_132659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132658 ?auto_132659 )
      ( MAKE-7PILE ?auto_132652 ?auto_132653 ?auto_132654 ?auto_132655 ?auto_132656 ?auto_132657 ?auto_132658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132660 - BLOCK
      ?auto_132661 - BLOCK
      ?auto_132662 - BLOCK
      ?auto_132663 - BLOCK
      ?auto_132664 - BLOCK
      ?auto_132665 - BLOCK
      ?auto_132666 - BLOCK
    )
    :vars
    (
      ?auto_132667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132660 ) ( ON ?auto_132661 ?auto_132660 ) ( ON ?auto_132662 ?auto_132661 ) ( ON ?auto_132663 ?auto_132662 ) ( ON ?auto_132664 ?auto_132663 ) ( not ( = ?auto_132660 ?auto_132661 ) ) ( not ( = ?auto_132660 ?auto_132662 ) ) ( not ( = ?auto_132660 ?auto_132663 ) ) ( not ( = ?auto_132660 ?auto_132664 ) ) ( not ( = ?auto_132660 ?auto_132665 ) ) ( not ( = ?auto_132660 ?auto_132666 ) ) ( not ( = ?auto_132661 ?auto_132662 ) ) ( not ( = ?auto_132661 ?auto_132663 ) ) ( not ( = ?auto_132661 ?auto_132664 ) ) ( not ( = ?auto_132661 ?auto_132665 ) ) ( not ( = ?auto_132661 ?auto_132666 ) ) ( not ( = ?auto_132662 ?auto_132663 ) ) ( not ( = ?auto_132662 ?auto_132664 ) ) ( not ( = ?auto_132662 ?auto_132665 ) ) ( not ( = ?auto_132662 ?auto_132666 ) ) ( not ( = ?auto_132663 ?auto_132664 ) ) ( not ( = ?auto_132663 ?auto_132665 ) ) ( not ( = ?auto_132663 ?auto_132666 ) ) ( not ( = ?auto_132664 ?auto_132665 ) ) ( not ( = ?auto_132664 ?auto_132666 ) ) ( not ( = ?auto_132665 ?auto_132666 ) ) ( ON ?auto_132666 ?auto_132667 ) ( CLEAR ?auto_132666 ) ( not ( = ?auto_132660 ?auto_132667 ) ) ( not ( = ?auto_132661 ?auto_132667 ) ) ( not ( = ?auto_132662 ?auto_132667 ) ) ( not ( = ?auto_132663 ?auto_132667 ) ) ( not ( = ?auto_132664 ?auto_132667 ) ) ( not ( = ?auto_132665 ?auto_132667 ) ) ( not ( = ?auto_132666 ?auto_132667 ) ) ( HOLDING ?auto_132665 ) ( CLEAR ?auto_132664 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132660 ?auto_132661 ?auto_132662 ?auto_132663 ?auto_132664 ?auto_132665 )
      ( MAKE-7PILE ?auto_132660 ?auto_132661 ?auto_132662 ?auto_132663 ?auto_132664 ?auto_132665 ?auto_132666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132668 - BLOCK
      ?auto_132669 - BLOCK
      ?auto_132670 - BLOCK
      ?auto_132671 - BLOCK
      ?auto_132672 - BLOCK
      ?auto_132673 - BLOCK
      ?auto_132674 - BLOCK
    )
    :vars
    (
      ?auto_132675 - BLOCK
      ?auto_132676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132668 ) ( ON ?auto_132669 ?auto_132668 ) ( ON ?auto_132670 ?auto_132669 ) ( ON ?auto_132671 ?auto_132670 ) ( ON ?auto_132672 ?auto_132671 ) ( not ( = ?auto_132668 ?auto_132669 ) ) ( not ( = ?auto_132668 ?auto_132670 ) ) ( not ( = ?auto_132668 ?auto_132671 ) ) ( not ( = ?auto_132668 ?auto_132672 ) ) ( not ( = ?auto_132668 ?auto_132673 ) ) ( not ( = ?auto_132668 ?auto_132674 ) ) ( not ( = ?auto_132669 ?auto_132670 ) ) ( not ( = ?auto_132669 ?auto_132671 ) ) ( not ( = ?auto_132669 ?auto_132672 ) ) ( not ( = ?auto_132669 ?auto_132673 ) ) ( not ( = ?auto_132669 ?auto_132674 ) ) ( not ( = ?auto_132670 ?auto_132671 ) ) ( not ( = ?auto_132670 ?auto_132672 ) ) ( not ( = ?auto_132670 ?auto_132673 ) ) ( not ( = ?auto_132670 ?auto_132674 ) ) ( not ( = ?auto_132671 ?auto_132672 ) ) ( not ( = ?auto_132671 ?auto_132673 ) ) ( not ( = ?auto_132671 ?auto_132674 ) ) ( not ( = ?auto_132672 ?auto_132673 ) ) ( not ( = ?auto_132672 ?auto_132674 ) ) ( not ( = ?auto_132673 ?auto_132674 ) ) ( ON ?auto_132674 ?auto_132675 ) ( not ( = ?auto_132668 ?auto_132675 ) ) ( not ( = ?auto_132669 ?auto_132675 ) ) ( not ( = ?auto_132670 ?auto_132675 ) ) ( not ( = ?auto_132671 ?auto_132675 ) ) ( not ( = ?auto_132672 ?auto_132675 ) ) ( not ( = ?auto_132673 ?auto_132675 ) ) ( not ( = ?auto_132674 ?auto_132675 ) ) ( CLEAR ?auto_132672 ) ( ON ?auto_132673 ?auto_132674 ) ( CLEAR ?auto_132673 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132676 ) ( ON ?auto_132675 ?auto_132676 ) ( not ( = ?auto_132676 ?auto_132675 ) ) ( not ( = ?auto_132676 ?auto_132674 ) ) ( not ( = ?auto_132676 ?auto_132673 ) ) ( not ( = ?auto_132668 ?auto_132676 ) ) ( not ( = ?auto_132669 ?auto_132676 ) ) ( not ( = ?auto_132670 ?auto_132676 ) ) ( not ( = ?auto_132671 ?auto_132676 ) ) ( not ( = ?auto_132672 ?auto_132676 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132676 ?auto_132675 ?auto_132674 )
      ( MAKE-7PILE ?auto_132668 ?auto_132669 ?auto_132670 ?auto_132671 ?auto_132672 ?auto_132673 ?auto_132674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132677 - BLOCK
      ?auto_132678 - BLOCK
      ?auto_132679 - BLOCK
      ?auto_132680 - BLOCK
      ?auto_132681 - BLOCK
      ?auto_132682 - BLOCK
      ?auto_132683 - BLOCK
    )
    :vars
    (
      ?auto_132684 - BLOCK
      ?auto_132685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132677 ) ( ON ?auto_132678 ?auto_132677 ) ( ON ?auto_132679 ?auto_132678 ) ( ON ?auto_132680 ?auto_132679 ) ( not ( = ?auto_132677 ?auto_132678 ) ) ( not ( = ?auto_132677 ?auto_132679 ) ) ( not ( = ?auto_132677 ?auto_132680 ) ) ( not ( = ?auto_132677 ?auto_132681 ) ) ( not ( = ?auto_132677 ?auto_132682 ) ) ( not ( = ?auto_132677 ?auto_132683 ) ) ( not ( = ?auto_132678 ?auto_132679 ) ) ( not ( = ?auto_132678 ?auto_132680 ) ) ( not ( = ?auto_132678 ?auto_132681 ) ) ( not ( = ?auto_132678 ?auto_132682 ) ) ( not ( = ?auto_132678 ?auto_132683 ) ) ( not ( = ?auto_132679 ?auto_132680 ) ) ( not ( = ?auto_132679 ?auto_132681 ) ) ( not ( = ?auto_132679 ?auto_132682 ) ) ( not ( = ?auto_132679 ?auto_132683 ) ) ( not ( = ?auto_132680 ?auto_132681 ) ) ( not ( = ?auto_132680 ?auto_132682 ) ) ( not ( = ?auto_132680 ?auto_132683 ) ) ( not ( = ?auto_132681 ?auto_132682 ) ) ( not ( = ?auto_132681 ?auto_132683 ) ) ( not ( = ?auto_132682 ?auto_132683 ) ) ( ON ?auto_132683 ?auto_132684 ) ( not ( = ?auto_132677 ?auto_132684 ) ) ( not ( = ?auto_132678 ?auto_132684 ) ) ( not ( = ?auto_132679 ?auto_132684 ) ) ( not ( = ?auto_132680 ?auto_132684 ) ) ( not ( = ?auto_132681 ?auto_132684 ) ) ( not ( = ?auto_132682 ?auto_132684 ) ) ( not ( = ?auto_132683 ?auto_132684 ) ) ( ON ?auto_132682 ?auto_132683 ) ( CLEAR ?auto_132682 ) ( ON-TABLE ?auto_132685 ) ( ON ?auto_132684 ?auto_132685 ) ( not ( = ?auto_132685 ?auto_132684 ) ) ( not ( = ?auto_132685 ?auto_132683 ) ) ( not ( = ?auto_132685 ?auto_132682 ) ) ( not ( = ?auto_132677 ?auto_132685 ) ) ( not ( = ?auto_132678 ?auto_132685 ) ) ( not ( = ?auto_132679 ?auto_132685 ) ) ( not ( = ?auto_132680 ?auto_132685 ) ) ( not ( = ?auto_132681 ?auto_132685 ) ) ( HOLDING ?auto_132681 ) ( CLEAR ?auto_132680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132677 ?auto_132678 ?auto_132679 ?auto_132680 ?auto_132681 )
      ( MAKE-7PILE ?auto_132677 ?auto_132678 ?auto_132679 ?auto_132680 ?auto_132681 ?auto_132682 ?auto_132683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132686 - BLOCK
      ?auto_132687 - BLOCK
      ?auto_132688 - BLOCK
      ?auto_132689 - BLOCK
      ?auto_132690 - BLOCK
      ?auto_132691 - BLOCK
      ?auto_132692 - BLOCK
    )
    :vars
    (
      ?auto_132693 - BLOCK
      ?auto_132694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132686 ) ( ON ?auto_132687 ?auto_132686 ) ( ON ?auto_132688 ?auto_132687 ) ( ON ?auto_132689 ?auto_132688 ) ( not ( = ?auto_132686 ?auto_132687 ) ) ( not ( = ?auto_132686 ?auto_132688 ) ) ( not ( = ?auto_132686 ?auto_132689 ) ) ( not ( = ?auto_132686 ?auto_132690 ) ) ( not ( = ?auto_132686 ?auto_132691 ) ) ( not ( = ?auto_132686 ?auto_132692 ) ) ( not ( = ?auto_132687 ?auto_132688 ) ) ( not ( = ?auto_132687 ?auto_132689 ) ) ( not ( = ?auto_132687 ?auto_132690 ) ) ( not ( = ?auto_132687 ?auto_132691 ) ) ( not ( = ?auto_132687 ?auto_132692 ) ) ( not ( = ?auto_132688 ?auto_132689 ) ) ( not ( = ?auto_132688 ?auto_132690 ) ) ( not ( = ?auto_132688 ?auto_132691 ) ) ( not ( = ?auto_132688 ?auto_132692 ) ) ( not ( = ?auto_132689 ?auto_132690 ) ) ( not ( = ?auto_132689 ?auto_132691 ) ) ( not ( = ?auto_132689 ?auto_132692 ) ) ( not ( = ?auto_132690 ?auto_132691 ) ) ( not ( = ?auto_132690 ?auto_132692 ) ) ( not ( = ?auto_132691 ?auto_132692 ) ) ( ON ?auto_132692 ?auto_132693 ) ( not ( = ?auto_132686 ?auto_132693 ) ) ( not ( = ?auto_132687 ?auto_132693 ) ) ( not ( = ?auto_132688 ?auto_132693 ) ) ( not ( = ?auto_132689 ?auto_132693 ) ) ( not ( = ?auto_132690 ?auto_132693 ) ) ( not ( = ?auto_132691 ?auto_132693 ) ) ( not ( = ?auto_132692 ?auto_132693 ) ) ( ON ?auto_132691 ?auto_132692 ) ( ON-TABLE ?auto_132694 ) ( ON ?auto_132693 ?auto_132694 ) ( not ( = ?auto_132694 ?auto_132693 ) ) ( not ( = ?auto_132694 ?auto_132692 ) ) ( not ( = ?auto_132694 ?auto_132691 ) ) ( not ( = ?auto_132686 ?auto_132694 ) ) ( not ( = ?auto_132687 ?auto_132694 ) ) ( not ( = ?auto_132688 ?auto_132694 ) ) ( not ( = ?auto_132689 ?auto_132694 ) ) ( not ( = ?auto_132690 ?auto_132694 ) ) ( CLEAR ?auto_132689 ) ( ON ?auto_132690 ?auto_132691 ) ( CLEAR ?auto_132690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132694 ?auto_132693 ?auto_132692 ?auto_132691 )
      ( MAKE-7PILE ?auto_132686 ?auto_132687 ?auto_132688 ?auto_132689 ?auto_132690 ?auto_132691 ?auto_132692 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132695 - BLOCK
      ?auto_132696 - BLOCK
      ?auto_132697 - BLOCK
      ?auto_132698 - BLOCK
      ?auto_132699 - BLOCK
      ?auto_132700 - BLOCK
      ?auto_132701 - BLOCK
    )
    :vars
    (
      ?auto_132703 - BLOCK
      ?auto_132702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132695 ) ( ON ?auto_132696 ?auto_132695 ) ( ON ?auto_132697 ?auto_132696 ) ( not ( = ?auto_132695 ?auto_132696 ) ) ( not ( = ?auto_132695 ?auto_132697 ) ) ( not ( = ?auto_132695 ?auto_132698 ) ) ( not ( = ?auto_132695 ?auto_132699 ) ) ( not ( = ?auto_132695 ?auto_132700 ) ) ( not ( = ?auto_132695 ?auto_132701 ) ) ( not ( = ?auto_132696 ?auto_132697 ) ) ( not ( = ?auto_132696 ?auto_132698 ) ) ( not ( = ?auto_132696 ?auto_132699 ) ) ( not ( = ?auto_132696 ?auto_132700 ) ) ( not ( = ?auto_132696 ?auto_132701 ) ) ( not ( = ?auto_132697 ?auto_132698 ) ) ( not ( = ?auto_132697 ?auto_132699 ) ) ( not ( = ?auto_132697 ?auto_132700 ) ) ( not ( = ?auto_132697 ?auto_132701 ) ) ( not ( = ?auto_132698 ?auto_132699 ) ) ( not ( = ?auto_132698 ?auto_132700 ) ) ( not ( = ?auto_132698 ?auto_132701 ) ) ( not ( = ?auto_132699 ?auto_132700 ) ) ( not ( = ?auto_132699 ?auto_132701 ) ) ( not ( = ?auto_132700 ?auto_132701 ) ) ( ON ?auto_132701 ?auto_132703 ) ( not ( = ?auto_132695 ?auto_132703 ) ) ( not ( = ?auto_132696 ?auto_132703 ) ) ( not ( = ?auto_132697 ?auto_132703 ) ) ( not ( = ?auto_132698 ?auto_132703 ) ) ( not ( = ?auto_132699 ?auto_132703 ) ) ( not ( = ?auto_132700 ?auto_132703 ) ) ( not ( = ?auto_132701 ?auto_132703 ) ) ( ON ?auto_132700 ?auto_132701 ) ( ON-TABLE ?auto_132702 ) ( ON ?auto_132703 ?auto_132702 ) ( not ( = ?auto_132702 ?auto_132703 ) ) ( not ( = ?auto_132702 ?auto_132701 ) ) ( not ( = ?auto_132702 ?auto_132700 ) ) ( not ( = ?auto_132695 ?auto_132702 ) ) ( not ( = ?auto_132696 ?auto_132702 ) ) ( not ( = ?auto_132697 ?auto_132702 ) ) ( not ( = ?auto_132698 ?auto_132702 ) ) ( not ( = ?auto_132699 ?auto_132702 ) ) ( ON ?auto_132699 ?auto_132700 ) ( CLEAR ?auto_132699 ) ( HOLDING ?auto_132698 ) ( CLEAR ?auto_132697 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132695 ?auto_132696 ?auto_132697 ?auto_132698 )
      ( MAKE-7PILE ?auto_132695 ?auto_132696 ?auto_132697 ?auto_132698 ?auto_132699 ?auto_132700 ?auto_132701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132704 - BLOCK
      ?auto_132705 - BLOCK
      ?auto_132706 - BLOCK
      ?auto_132707 - BLOCK
      ?auto_132708 - BLOCK
      ?auto_132709 - BLOCK
      ?auto_132710 - BLOCK
    )
    :vars
    (
      ?auto_132712 - BLOCK
      ?auto_132711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132704 ) ( ON ?auto_132705 ?auto_132704 ) ( ON ?auto_132706 ?auto_132705 ) ( not ( = ?auto_132704 ?auto_132705 ) ) ( not ( = ?auto_132704 ?auto_132706 ) ) ( not ( = ?auto_132704 ?auto_132707 ) ) ( not ( = ?auto_132704 ?auto_132708 ) ) ( not ( = ?auto_132704 ?auto_132709 ) ) ( not ( = ?auto_132704 ?auto_132710 ) ) ( not ( = ?auto_132705 ?auto_132706 ) ) ( not ( = ?auto_132705 ?auto_132707 ) ) ( not ( = ?auto_132705 ?auto_132708 ) ) ( not ( = ?auto_132705 ?auto_132709 ) ) ( not ( = ?auto_132705 ?auto_132710 ) ) ( not ( = ?auto_132706 ?auto_132707 ) ) ( not ( = ?auto_132706 ?auto_132708 ) ) ( not ( = ?auto_132706 ?auto_132709 ) ) ( not ( = ?auto_132706 ?auto_132710 ) ) ( not ( = ?auto_132707 ?auto_132708 ) ) ( not ( = ?auto_132707 ?auto_132709 ) ) ( not ( = ?auto_132707 ?auto_132710 ) ) ( not ( = ?auto_132708 ?auto_132709 ) ) ( not ( = ?auto_132708 ?auto_132710 ) ) ( not ( = ?auto_132709 ?auto_132710 ) ) ( ON ?auto_132710 ?auto_132712 ) ( not ( = ?auto_132704 ?auto_132712 ) ) ( not ( = ?auto_132705 ?auto_132712 ) ) ( not ( = ?auto_132706 ?auto_132712 ) ) ( not ( = ?auto_132707 ?auto_132712 ) ) ( not ( = ?auto_132708 ?auto_132712 ) ) ( not ( = ?auto_132709 ?auto_132712 ) ) ( not ( = ?auto_132710 ?auto_132712 ) ) ( ON ?auto_132709 ?auto_132710 ) ( ON-TABLE ?auto_132711 ) ( ON ?auto_132712 ?auto_132711 ) ( not ( = ?auto_132711 ?auto_132712 ) ) ( not ( = ?auto_132711 ?auto_132710 ) ) ( not ( = ?auto_132711 ?auto_132709 ) ) ( not ( = ?auto_132704 ?auto_132711 ) ) ( not ( = ?auto_132705 ?auto_132711 ) ) ( not ( = ?auto_132706 ?auto_132711 ) ) ( not ( = ?auto_132707 ?auto_132711 ) ) ( not ( = ?auto_132708 ?auto_132711 ) ) ( ON ?auto_132708 ?auto_132709 ) ( CLEAR ?auto_132706 ) ( ON ?auto_132707 ?auto_132708 ) ( CLEAR ?auto_132707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132711 ?auto_132712 ?auto_132710 ?auto_132709 ?auto_132708 )
      ( MAKE-7PILE ?auto_132704 ?auto_132705 ?auto_132706 ?auto_132707 ?auto_132708 ?auto_132709 ?auto_132710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132713 - BLOCK
      ?auto_132714 - BLOCK
      ?auto_132715 - BLOCK
      ?auto_132716 - BLOCK
      ?auto_132717 - BLOCK
      ?auto_132718 - BLOCK
      ?auto_132719 - BLOCK
    )
    :vars
    (
      ?auto_132721 - BLOCK
      ?auto_132720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132713 ) ( ON ?auto_132714 ?auto_132713 ) ( not ( = ?auto_132713 ?auto_132714 ) ) ( not ( = ?auto_132713 ?auto_132715 ) ) ( not ( = ?auto_132713 ?auto_132716 ) ) ( not ( = ?auto_132713 ?auto_132717 ) ) ( not ( = ?auto_132713 ?auto_132718 ) ) ( not ( = ?auto_132713 ?auto_132719 ) ) ( not ( = ?auto_132714 ?auto_132715 ) ) ( not ( = ?auto_132714 ?auto_132716 ) ) ( not ( = ?auto_132714 ?auto_132717 ) ) ( not ( = ?auto_132714 ?auto_132718 ) ) ( not ( = ?auto_132714 ?auto_132719 ) ) ( not ( = ?auto_132715 ?auto_132716 ) ) ( not ( = ?auto_132715 ?auto_132717 ) ) ( not ( = ?auto_132715 ?auto_132718 ) ) ( not ( = ?auto_132715 ?auto_132719 ) ) ( not ( = ?auto_132716 ?auto_132717 ) ) ( not ( = ?auto_132716 ?auto_132718 ) ) ( not ( = ?auto_132716 ?auto_132719 ) ) ( not ( = ?auto_132717 ?auto_132718 ) ) ( not ( = ?auto_132717 ?auto_132719 ) ) ( not ( = ?auto_132718 ?auto_132719 ) ) ( ON ?auto_132719 ?auto_132721 ) ( not ( = ?auto_132713 ?auto_132721 ) ) ( not ( = ?auto_132714 ?auto_132721 ) ) ( not ( = ?auto_132715 ?auto_132721 ) ) ( not ( = ?auto_132716 ?auto_132721 ) ) ( not ( = ?auto_132717 ?auto_132721 ) ) ( not ( = ?auto_132718 ?auto_132721 ) ) ( not ( = ?auto_132719 ?auto_132721 ) ) ( ON ?auto_132718 ?auto_132719 ) ( ON-TABLE ?auto_132720 ) ( ON ?auto_132721 ?auto_132720 ) ( not ( = ?auto_132720 ?auto_132721 ) ) ( not ( = ?auto_132720 ?auto_132719 ) ) ( not ( = ?auto_132720 ?auto_132718 ) ) ( not ( = ?auto_132713 ?auto_132720 ) ) ( not ( = ?auto_132714 ?auto_132720 ) ) ( not ( = ?auto_132715 ?auto_132720 ) ) ( not ( = ?auto_132716 ?auto_132720 ) ) ( not ( = ?auto_132717 ?auto_132720 ) ) ( ON ?auto_132717 ?auto_132718 ) ( ON ?auto_132716 ?auto_132717 ) ( CLEAR ?auto_132716 ) ( HOLDING ?auto_132715 ) ( CLEAR ?auto_132714 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132713 ?auto_132714 ?auto_132715 )
      ( MAKE-7PILE ?auto_132713 ?auto_132714 ?auto_132715 ?auto_132716 ?auto_132717 ?auto_132718 ?auto_132719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132722 - BLOCK
      ?auto_132723 - BLOCK
      ?auto_132724 - BLOCK
      ?auto_132725 - BLOCK
      ?auto_132726 - BLOCK
      ?auto_132727 - BLOCK
      ?auto_132728 - BLOCK
    )
    :vars
    (
      ?auto_132729 - BLOCK
      ?auto_132730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132722 ) ( ON ?auto_132723 ?auto_132722 ) ( not ( = ?auto_132722 ?auto_132723 ) ) ( not ( = ?auto_132722 ?auto_132724 ) ) ( not ( = ?auto_132722 ?auto_132725 ) ) ( not ( = ?auto_132722 ?auto_132726 ) ) ( not ( = ?auto_132722 ?auto_132727 ) ) ( not ( = ?auto_132722 ?auto_132728 ) ) ( not ( = ?auto_132723 ?auto_132724 ) ) ( not ( = ?auto_132723 ?auto_132725 ) ) ( not ( = ?auto_132723 ?auto_132726 ) ) ( not ( = ?auto_132723 ?auto_132727 ) ) ( not ( = ?auto_132723 ?auto_132728 ) ) ( not ( = ?auto_132724 ?auto_132725 ) ) ( not ( = ?auto_132724 ?auto_132726 ) ) ( not ( = ?auto_132724 ?auto_132727 ) ) ( not ( = ?auto_132724 ?auto_132728 ) ) ( not ( = ?auto_132725 ?auto_132726 ) ) ( not ( = ?auto_132725 ?auto_132727 ) ) ( not ( = ?auto_132725 ?auto_132728 ) ) ( not ( = ?auto_132726 ?auto_132727 ) ) ( not ( = ?auto_132726 ?auto_132728 ) ) ( not ( = ?auto_132727 ?auto_132728 ) ) ( ON ?auto_132728 ?auto_132729 ) ( not ( = ?auto_132722 ?auto_132729 ) ) ( not ( = ?auto_132723 ?auto_132729 ) ) ( not ( = ?auto_132724 ?auto_132729 ) ) ( not ( = ?auto_132725 ?auto_132729 ) ) ( not ( = ?auto_132726 ?auto_132729 ) ) ( not ( = ?auto_132727 ?auto_132729 ) ) ( not ( = ?auto_132728 ?auto_132729 ) ) ( ON ?auto_132727 ?auto_132728 ) ( ON-TABLE ?auto_132730 ) ( ON ?auto_132729 ?auto_132730 ) ( not ( = ?auto_132730 ?auto_132729 ) ) ( not ( = ?auto_132730 ?auto_132728 ) ) ( not ( = ?auto_132730 ?auto_132727 ) ) ( not ( = ?auto_132722 ?auto_132730 ) ) ( not ( = ?auto_132723 ?auto_132730 ) ) ( not ( = ?auto_132724 ?auto_132730 ) ) ( not ( = ?auto_132725 ?auto_132730 ) ) ( not ( = ?auto_132726 ?auto_132730 ) ) ( ON ?auto_132726 ?auto_132727 ) ( ON ?auto_132725 ?auto_132726 ) ( CLEAR ?auto_132723 ) ( ON ?auto_132724 ?auto_132725 ) ( CLEAR ?auto_132724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132730 ?auto_132729 ?auto_132728 ?auto_132727 ?auto_132726 ?auto_132725 )
      ( MAKE-7PILE ?auto_132722 ?auto_132723 ?auto_132724 ?auto_132725 ?auto_132726 ?auto_132727 ?auto_132728 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132731 - BLOCK
      ?auto_132732 - BLOCK
      ?auto_132733 - BLOCK
      ?auto_132734 - BLOCK
      ?auto_132735 - BLOCK
      ?auto_132736 - BLOCK
      ?auto_132737 - BLOCK
    )
    :vars
    (
      ?auto_132739 - BLOCK
      ?auto_132738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132731 ) ( not ( = ?auto_132731 ?auto_132732 ) ) ( not ( = ?auto_132731 ?auto_132733 ) ) ( not ( = ?auto_132731 ?auto_132734 ) ) ( not ( = ?auto_132731 ?auto_132735 ) ) ( not ( = ?auto_132731 ?auto_132736 ) ) ( not ( = ?auto_132731 ?auto_132737 ) ) ( not ( = ?auto_132732 ?auto_132733 ) ) ( not ( = ?auto_132732 ?auto_132734 ) ) ( not ( = ?auto_132732 ?auto_132735 ) ) ( not ( = ?auto_132732 ?auto_132736 ) ) ( not ( = ?auto_132732 ?auto_132737 ) ) ( not ( = ?auto_132733 ?auto_132734 ) ) ( not ( = ?auto_132733 ?auto_132735 ) ) ( not ( = ?auto_132733 ?auto_132736 ) ) ( not ( = ?auto_132733 ?auto_132737 ) ) ( not ( = ?auto_132734 ?auto_132735 ) ) ( not ( = ?auto_132734 ?auto_132736 ) ) ( not ( = ?auto_132734 ?auto_132737 ) ) ( not ( = ?auto_132735 ?auto_132736 ) ) ( not ( = ?auto_132735 ?auto_132737 ) ) ( not ( = ?auto_132736 ?auto_132737 ) ) ( ON ?auto_132737 ?auto_132739 ) ( not ( = ?auto_132731 ?auto_132739 ) ) ( not ( = ?auto_132732 ?auto_132739 ) ) ( not ( = ?auto_132733 ?auto_132739 ) ) ( not ( = ?auto_132734 ?auto_132739 ) ) ( not ( = ?auto_132735 ?auto_132739 ) ) ( not ( = ?auto_132736 ?auto_132739 ) ) ( not ( = ?auto_132737 ?auto_132739 ) ) ( ON ?auto_132736 ?auto_132737 ) ( ON-TABLE ?auto_132738 ) ( ON ?auto_132739 ?auto_132738 ) ( not ( = ?auto_132738 ?auto_132739 ) ) ( not ( = ?auto_132738 ?auto_132737 ) ) ( not ( = ?auto_132738 ?auto_132736 ) ) ( not ( = ?auto_132731 ?auto_132738 ) ) ( not ( = ?auto_132732 ?auto_132738 ) ) ( not ( = ?auto_132733 ?auto_132738 ) ) ( not ( = ?auto_132734 ?auto_132738 ) ) ( not ( = ?auto_132735 ?auto_132738 ) ) ( ON ?auto_132735 ?auto_132736 ) ( ON ?auto_132734 ?auto_132735 ) ( ON ?auto_132733 ?auto_132734 ) ( CLEAR ?auto_132733 ) ( HOLDING ?auto_132732 ) ( CLEAR ?auto_132731 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132731 ?auto_132732 )
      ( MAKE-7PILE ?auto_132731 ?auto_132732 ?auto_132733 ?auto_132734 ?auto_132735 ?auto_132736 ?auto_132737 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132740 - BLOCK
      ?auto_132741 - BLOCK
      ?auto_132742 - BLOCK
      ?auto_132743 - BLOCK
      ?auto_132744 - BLOCK
      ?auto_132745 - BLOCK
      ?auto_132746 - BLOCK
    )
    :vars
    (
      ?auto_132748 - BLOCK
      ?auto_132747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132740 ) ( not ( = ?auto_132740 ?auto_132741 ) ) ( not ( = ?auto_132740 ?auto_132742 ) ) ( not ( = ?auto_132740 ?auto_132743 ) ) ( not ( = ?auto_132740 ?auto_132744 ) ) ( not ( = ?auto_132740 ?auto_132745 ) ) ( not ( = ?auto_132740 ?auto_132746 ) ) ( not ( = ?auto_132741 ?auto_132742 ) ) ( not ( = ?auto_132741 ?auto_132743 ) ) ( not ( = ?auto_132741 ?auto_132744 ) ) ( not ( = ?auto_132741 ?auto_132745 ) ) ( not ( = ?auto_132741 ?auto_132746 ) ) ( not ( = ?auto_132742 ?auto_132743 ) ) ( not ( = ?auto_132742 ?auto_132744 ) ) ( not ( = ?auto_132742 ?auto_132745 ) ) ( not ( = ?auto_132742 ?auto_132746 ) ) ( not ( = ?auto_132743 ?auto_132744 ) ) ( not ( = ?auto_132743 ?auto_132745 ) ) ( not ( = ?auto_132743 ?auto_132746 ) ) ( not ( = ?auto_132744 ?auto_132745 ) ) ( not ( = ?auto_132744 ?auto_132746 ) ) ( not ( = ?auto_132745 ?auto_132746 ) ) ( ON ?auto_132746 ?auto_132748 ) ( not ( = ?auto_132740 ?auto_132748 ) ) ( not ( = ?auto_132741 ?auto_132748 ) ) ( not ( = ?auto_132742 ?auto_132748 ) ) ( not ( = ?auto_132743 ?auto_132748 ) ) ( not ( = ?auto_132744 ?auto_132748 ) ) ( not ( = ?auto_132745 ?auto_132748 ) ) ( not ( = ?auto_132746 ?auto_132748 ) ) ( ON ?auto_132745 ?auto_132746 ) ( ON-TABLE ?auto_132747 ) ( ON ?auto_132748 ?auto_132747 ) ( not ( = ?auto_132747 ?auto_132748 ) ) ( not ( = ?auto_132747 ?auto_132746 ) ) ( not ( = ?auto_132747 ?auto_132745 ) ) ( not ( = ?auto_132740 ?auto_132747 ) ) ( not ( = ?auto_132741 ?auto_132747 ) ) ( not ( = ?auto_132742 ?auto_132747 ) ) ( not ( = ?auto_132743 ?auto_132747 ) ) ( not ( = ?auto_132744 ?auto_132747 ) ) ( ON ?auto_132744 ?auto_132745 ) ( ON ?auto_132743 ?auto_132744 ) ( ON ?auto_132742 ?auto_132743 ) ( CLEAR ?auto_132740 ) ( ON ?auto_132741 ?auto_132742 ) ( CLEAR ?auto_132741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132747 ?auto_132748 ?auto_132746 ?auto_132745 ?auto_132744 ?auto_132743 ?auto_132742 )
      ( MAKE-7PILE ?auto_132740 ?auto_132741 ?auto_132742 ?auto_132743 ?auto_132744 ?auto_132745 ?auto_132746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132749 - BLOCK
      ?auto_132750 - BLOCK
      ?auto_132751 - BLOCK
      ?auto_132752 - BLOCK
      ?auto_132753 - BLOCK
      ?auto_132754 - BLOCK
      ?auto_132755 - BLOCK
    )
    :vars
    (
      ?auto_132757 - BLOCK
      ?auto_132756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132749 ?auto_132750 ) ) ( not ( = ?auto_132749 ?auto_132751 ) ) ( not ( = ?auto_132749 ?auto_132752 ) ) ( not ( = ?auto_132749 ?auto_132753 ) ) ( not ( = ?auto_132749 ?auto_132754 ) ) ( not ( = ?auto_132749 ?auto_132755 ) ) ( not ( = ?auto_132750 ?auto_132751 ) ) ( not ( = ?auto_132750 ?auto_132752 ) ) ( not ( = ?auto_132750 ?auto_132753 ) ) ( not ( = ?auto_132750 ?auto_132754 ) ) ( not ( = ?auto_132750 ?auto_132755 ) ) ( not ( = ?auto_132751 ?auto_132752 ) ) ( not ( = ?auto_132751 ?auto_132753 ) ) ( not ( = ?auto_132751 ?auto_132754 ) ) ( not ( = ?auto_132751 ?auto_132755 ) ) ( not ( = ?auto_132752 ?auto_132753 ) ) ( not ( = ?auto_132752 ?auto_132754 ) ) ( not ( = ?auto_132752 ?auto_132755 ) ) ( not ( = ?auto_132753 ?auto_132754 ) ) ( not ( = ?auto_132753 ?auto_132755 ) ) ( not ( = ?auto_132754 ?auto_132755 ) ) ( ON ?auto_132755 ?auto_132757 ) ( not ( = ?auto_132749 ?auto_132757 ) ) ( not ( = ?auto_132750 ?auto_132757 ) ) ( not ( = ?auto_132751 ?auto_132757 ) ) ( not ( = ?auto_132752 ?auto_132757 ) ) ( not ( = ?auto_132753 ?auto_132757 ) ) ( not ( = ?auto_132754 ?auto_132757 ) ) ( not ( = ?auto_132755 ?auto_132757 ) ) ( ON ?auto_132754 ?auto_132755 ) ( ON-TABLE ?auto_132756 ) ( ON ?auto_132757 ?auto_132756 ) ( not ( = ?auto_132756 ?auto_132757 ) ) ( not ( = ?auto_132756 ?auto_132755 ) ) ( not ( = ?auto_132756 ?auto_132754 ) ) ( not ( = ?auto_132749 ?auto_132756 ) ) ( not ( = ?auto_132750 ?auto_132756 ) ) ( not ( = ?auto_132751 ?auto_132756 ) ) ( not ( = ?auto_132752 ?auto_132756 ) ) ( not ( = ?auto_132753 ?auto_132756 ) ) ( ON ?auto_132753 ?auto_132754 ) ( ON ?auto_132752 ?auto_132753 ) ( ON ?auto_132751 ?auto_132752 ) ( ON ?auto_132750 ?auto_132751 ) ( CLEAR ?auto_132750 ) ( HOLDING ?auto_132749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132749 )
      ( MAKE-7PILE ?auto_132749 ?auto_132750 ?auto_132751 ?auto_132752 ?auto_132753 ?auto_132754 ?auto_132755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132758 - BLOCK
      ?auto_132759 - BLOCK
      ?auto_132760 - BLOCK
      ?auto_132761 - BLOCK
      ?auto_132762 - BLOCK
      ?auto_132763 - BLOCK
      ?auto_132764 - BLOCK
    )
    :vars
    (
      ?auto_132766 - BLOCK
      ?auto_132765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132758 ?auto_132759 ) ) ( not ( = ?auto_132758 ?auto_132760 ) ) ( not ( = ?auto_132758 ?auto_132761 ) ) ( not ( = ?auto_132758 ?auto_132762 ) ) ( not ( = ?auto_132758 ?auto_132763 ) ) ( not ( = ?auto_132758 ?auto_132764 ) ) ( not ( = ?auto_132759 ?auto_132760 ) ) ( not ( = ?auto_132759 ?auto_132761 ) ) ( not ( = ?auto_132759 ?auto_132762 ) ) ( not ( = ?auto_132759 ?auto_132763 ) ) ( not ( = ?auto_132759 ?auto_132764 ) ) ( not ( = ?auto_132760 ?auto_132761 ) ) ( not ( = ?auto_132760 ?auto_132762 ) ) ( not ( = ?auto_132760 ?auto_132763 ) ) ( not ( = ?auto_132760 ?auto_132764 ) ) ( not ( = ?auto_132761 ?auto_132762 ) ) ( not ( = ?auto_132761 ?auto_132763 ) ) ( not ( = ?auto_132761 ?auto_132764 ) ) ( not ( = ?auto_132762 ?auto_132763 ) ) ( not ( = ?auto_132762 ?auto_132764 ) ) ( not ( = ?auto_132763 ?auto_132764 ) ) ( ON ?auto_132764 ?auto_132766 ) ( not ( = ?auto_132758 ?auto_132766 ) ) ( not ( = ?auto_132759 ?auto_132766 ) ) ( not ( = ?auto_132760 ?auto_132766 ) ) ( not ( = ?auto_132761 ?auto_132766 ) ) ( not ( = ?auto_132762 ?auto_132766 ) ) ( not ( = ?auto_132763 ?auto_132766 ) ) ( not ( = ?auto_132764 ?auto_132766 ) ) ( ON ?auto_132763 ?auto_132764 ) ( ON-TABLE ?auto_132765 ) ( ON ?auto_132766 ?auto_132765 ) ( not ( = ?auto_132765 ?auto_132766 ) ) ( not ( = ?auto_132765 ?auto_132764 ) ) ( not ( = ?auto_132765 ?auto_132763 ) ) ( not ( = ?auto_132758 ?auto_132765 ) ) ( not ( = ?auto_132759 ?auto_132765 ) ) ( not ( = ?auto_132760 ?auto_132765 ) ) ( not ( = ?auto_132761 ?auto_132765 ) ) ( not ( = ?auto_132762 ?auto_132765 ) ) ( ON ?auto_132762 ?auto_132763 ) ( ON ?auto_132761 ?auto_132762 ) ( ON ?auto_132760 ?auto_132761 ) ( ON ?auto_132759 ?auto_132760 ) ( ON ?auto_132758 ?auto_132759 ) ( CLEAR ?auto_132758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132765 ?auto_132766 ?auto_132764 ?auto_132763 ?auto_132762 ?auto_132761 ?auto_132760 ?auto_132759 )
      ( MAKE-7PILE ?auto_132758 ?auto_132759 ?auto_132760 ?auto_132761 ?auto_132762 ?auto_132763 ?auto_132764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132768 - BLOCK
    )
    :vars
    (
      ?auto_132769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132769 ?auto_132768 ) ( CLEAR ?auto_132769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132768 ) ( not ( = ?auto_132768 ?auto_132769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132769 ?auto_132768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132770 - BLOCK
    )
    :vars
    (
      ?auto_132771 - BLOCK
      ?auto_132772 - BLOCK
      ?auto_132773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132771 ?auto_132770 ) ( CLEAR ?auto_132771 ) ( ON-TABLE ?auto_132770 ) ( not ( = ?auto_132770 ?auto_132771 ) ) ( HOLDING ?auto_132772 ) ( CLEAR ?auto_132773 ) ( not ( = ?auto_132770 ?auto_132772 ) ) ( not ( = ?auto_132770 ?auto_132773 ) ) ( not ( = ?auto_132771 ?auto_132772 ) ) ( not ( = ?auto_132771 ?auto_132773 ) ) ( not ( = ?auto_132772 ?auto_132773 ) ) )
    :subtasks
    ( ( !STACK ?auto_132772 ?auto_132773 )
      ( MAKE-1PILE ?auto_132770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132774 - BLOCK
    )
    :vars
    (
      ?auto_132776 - BLOCK
      ?auto_132775 - BLOCK
      ?auto_132777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132776 ?auto_132774 ) ( ON-TABLE ?auto_132774 ) ( not ( = ?auto_132774 ?auto_132776 ) ) ( CLEAR ?auto_132775 ) ( not ( = ?auto_132774 ?auto_132777 ) ) ( not ( = ?auto_132774 ?auto_132775 ) ) ( not ( = ?auto_132776 ?auto_132777 ) ) ( not ( = ?auto_132776 ?auto_132775 ) ) ( not ( = ?auto_132777 ?auto_132775 ) ) ( ON ?auto_132777 ?auto_132776 ) ( CLEAR ?auto_132777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132774 ?auto_132776 )
      ( MAKE-1PILE ?auto_132774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132778 - BLOCK
    )
    :vars
    (
      ?auto_132779 - BLOCK
      ?auto_132781 - BLOCK
      ?auto_132780 - BLOCK
      ?auto_132784 - BLOCK
      ?auto_132783 - BLOCK
      ?auto_132782 - BLOCK
      ?auto_132785 - BLOCK
      ?auto_132786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132779 ?auto_132778 ) ( ON-TABLE ?auto_132778 ) ( not ( = ?auto_132778 ?auto_132779 ) ) ( not ( = ?auto_132778 ?auto_132781 ) ) ( not ( = ?auto_132778 ?auto_132780 ) ) ( not ( = ?auto_132779 ?auto_132781 ) ) ( not ( = ?auto_132779 ?auto_132780 ) ) ( not ( = ?auto_132781 ?auto_132780 ) ) ( ON ?auto_132781 ?auto_132779 ) ( CLEAR ?auto_132781 ) ( HOLDING ?auto_132780 ) ( CLEAR ?auto_132784 ) ( ON-TABLE ?auto_132783 ) ( ON ?auto_132782 ?auto_132783 ) ( ON ?auto_132785 ?auto_132782 ) ( ON ?auto_132786 ?auto_132785 ) ( ON ?auto_132784 ?auto_132786 ) ( not ( = ?auto_132783 ?auto_132782 ) ) ( not ( = ?auto_132783 ?auto_132785 ) ) ( not ( = ?auto_132783 ?auto_132786 ) ) ( not ( = ?auto_132783 ?auto_132784 ) ) ( not ( = ?auto_132783 ?auto_132780 ) ) ( not ( = ?auto_132782 ?auto_132785 ) ) ( not ( = ?auto_132782 ?auto_132786 ) ) ( not ( = ?auto_132782 ?auto_132784 ) ) ( not ( = ?auto_132782 ?auto_132780 ) ) ( not ( = ?auto_132785 ?auto_132786 ) ) ( not ( = ?auto_132785 ?auto_132784 ) ) ( not ( = ?auto_132785 ?auto_132780 ) ) ( not ( = ?auto_132786 ?auto_132784 ) ) ( not ( = ?auto_132786 ?auto_132780 ) ) ( not ( = ?auto_132784 ?auto_132780 ) ) ( not ( = ?auto_132778 ?auto_132784 ) ) ( not ( = ?auto_132778 ?auto_132783 ) ) ( not ( = ?auto_132778 ?auto_132782 ) ) ( not ( = ?auto_132778 ?auto_132785 ) ) ( not ( = ?auto_132778 ?auto_132786 ) ) ( not ( = ?auto_132779 ?auto_132784 ) ) ( not ( = ?auto_132779 ?auto_132783 ) ) ( not ( = ?auto_132779 ?auto_132782 ) ) ( not ( = ?auto_132779 ?auto_132785 ) ) ( not ( = ?auto_132779 ?auto_132786 ) ) ( not ( = ?auto_132781 ?auto_132784 ) ) ( not ( = ?auto_132781 ?auto_132783 ) ) ( not ( = ?auto_132781 ?auto_132782 ) ) ( not ( = ?auto_132781 ?auto_132785 ) ) ( not ( = ?auto_132781 ?auto_132786 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132783 ?auto_132782 ?auto_132785 ?auto_132786 ?auto_132784 ?auto_132780 )
      ( MAKE-1PILE ?auto_132778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132787 - BLOCK
    )
    :vars
    (
      ?auto_132792 - BLOCK
      ?auto_132791 - BLOCK
      ?auto_132790 - BLOCK
      ?auto_132793 - BLOCK
      ?auto_132795 - BLOCK
      ?auto_132789 - BLOCK
      ?auto_132794 - BLOCK
      ?auto_132788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132792 ?auto_132787 ) ( ON-TABLE ?auto_132787 ) ( not ( = ?auto_132787 ?auto_132792 ) ) ( not ( = ?auto_132787 ?auto_132791 ) ) ( not ( = ?auto_132787 ?auto_132790 ) ) ( not ( = ?auto_132792 ?auto_132791 ) ) ( not ( = ?auto_132792 ?auto_132790 ) ) ( not ( = ?auto_132791 ?auto_132790 ) ) ( ON ?auto_132791 ?auto_132792 ) ( CLEAR ?auto_132793 ) ( ON-TABLE ?auto_132795 ) ( ON ?auto_132789 ?auto_132795 ) ( ON ?auto_132794 ?auto_132789 ) ( ON ?auto_132788 ?auto_132794 ) ( ON ?auto_132793 ?auto_132788 ) ( not ( = ?auto_132795 ?auto_132789 ) ) ( not ( = ?auto_132795 ?auto_132794 ) ) ( not ( = ?auto_132795 ?auto_132788 ) ) ( not ( = ?auto_132795 ?auto_132793 ) ) ( not ( = ?auto_132795 ?auto_132790 ) ) ( not ( = ?auto_132789 ?auto_132794 ) ) ( not ( = ?auto_132789 ?auto_132788 ) ) ( not ( = ?auto_132789 ?auto_132793 ) ) ( not ( = ?auto_132789 ?auto_132790 ) ) ( not ( = ?auto_132794 ?auto_132788 ) ) ( not ( = ?auto_132794 ?auto_132793 ) ) ( not ( = ?auto_132794 ?auto_132790 ) ) ( not ( = ?auto_132788 ?auto_132793 ) ) ( not ( = ?auto_132788 ?auto_132790 ) ) ( not ( = ?auto_132793 ?auto_132790 ) ) ( not ( = ?auto_132787 ?auto_132793 ) ) ( not ( = ?auto_132787 ?auto_132795 ) ) ( not ( = ?auto_132787 ?auto_132789 ) ) ( not ( = ?auto_132787 ?auto_132794 ) ) ( not ( = ?auto_132787 ?auto_132788 ) ) ( not ( = ?auto_132792 ?auto_132793 ) ) ( not ( = ?auto_132792 ?auto_132795 ) ) ( not ( = ?auto_132792 ?auto_132789 ) ) ( not ( = ?auto_132792 ?auto_132794 ) ) ( not ( = ?auto_132792 ?auto_132788 ) ) ( not ( = ?auto_132791 ?auto_132793 ) ) ( not ( = ?auto_132791 ?auto_132795 ) ) ( not ( = ?auto_132791 ?auto_132789 ) ) ( not ( = ?auto_132791 ?auto_132794 ) ) ( not ( = ?auto_132791 ?auto_132788 ) ) ( ON ?auto_132790 ?auto_132791 ) ( CLEAR ?auto_132790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132787 ?auto_132792 ?auto_132791 )
      ( MAKE-1PILE ?auto_132787 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132796 - BLOCK
    )
    :vars
    (
      ?auto_132804 - BLOCK
      ?auto_132798 - BLOCK
      ?auto_132803 - BLOCK
      ?auto_132802 - BLOCK
      ?auto_132797 - BLOCK
      ?auto_132799 - BLOCK
      ?auto_132800 - BLOCK
      ?auto_132801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132804 ?auto_132796 ) ( ON-TABLE ?auto_132796 ) ( not ( = ?auto_132796 ?auto_132804 ) ) ( not ( = ?auto_132796 ?auto_132798 ) ) ( not ( = ?auto_132796 ?auto_132803 ) ) ( not ( = ?auto_132804 ?auto_132798 ) ) ( not ( = ?auto_132804 ?auto_132803 ) ) ( not ( = ?auto_132798 ?auto_132803 ) ) ( ON ?auto_132798 ?auto_132804 ) ( ON-TABLE ?auto_132802 ) ( ON ?auto_132797 ?auto_132802 ) ( ON ?auto_132799 ?auto_132797 ) ( ON ?auto_132800 ?auto_132799 ) ( not ( = ?auto_132802 ?auto_132797 ) ) ( not ( = ?auto_132802 ?auto_132799 ) ) ( not ( = ?auto_132802 ?auto_132800 ) ) ( not ( = ?auto_132802 ?auto_132801 ) ) ( not ( = ?auto_132802 ?auto_132803 ) ) ( not ( = ?auto_132797 ?auto_132799 ) ) ( not ( = ?auto_132797 ?auto_132800 ) ) ( not ( = ?auto_132797 ?auto_132801 ) ) ( not ( = ?auto_132797 ?auto_132803 ) ) ( not ( = ?auto_132799 ?auto_132800 ) ) ( not ( = ?auto_132799 ?auto_132801 ) ) ( not ( = ?auto_132799 ?auto_132803 ) ) ( not ( = ?auto_132800 ?auto_132801 ) ) ( not ( = ?auto_132800 ?auto_132803 ) ) ( not ( = ?auto_132801 ?auto_132803 ) ) ( not ( = ?auto_132796 ?auto_132801 ) ) ( not ( = ?auto_132796 ?auto_132802 ) ) ( not ( = ?auto_132796 ?auto_132797 ) ) ( not ( = ?auto_132796 ?auto_132799 ) ) ( not ( = ?auto_132796 ?auto_132800 ) ) ( not ( = ?auto_132804 ?auto_132801 ) ) ( not ( = ?auto_132804 ?auto_132802 ) ) ( not ( = ?auto_132804 ?auto_132797 ) ) ( not ( = ?auto_132804 ?auto_132799 ) ) ( not ( = ?auto_132804 ?auto_132800 ) ) ( not ( = ?auto_132798 ?auto_132801 ) ) ( not ( = ?auto_132798 ?auto_132802 ) ) ( not ( = ?auto_132798 ?auto_132797 ) ) ( not ( = ?auto_132798 ?auto_132799 ) ) ( not ( = ?auto_132798 ?auto_132800 ) ) ( ON ?auto_132803 ?auto_132798 ) ( CLEAR ?auto_132803 ) ( HOLDING ?auto_132801 ) ( CLEAR ?auto_132800 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132802 ?auto_132797 ?auto_132799 ?auto_132800 ?auto_132801 )
      ( MAKE-1PILE ?auto_132796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132805 - BLOCK
    )
    :vars
    (
      ?auto_132812 - BLOCK
      ?auto_132810 - BLOCK
      ?auto_132813 - BLOCK
      ?auto_132811 - BLOCK
      ?auto_132807 - BLOCK
      ?auto_132808 - BLOCK
      ?auto_132809 - BLOCK
      ?auto_132806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132812 ?auto_132805 ) ( ON-TABLE ?auto_132805 ) ( not ( = ?auto_132805 ?auto_132812 ) ) ( not ( = ?auto_132805 ?auto_132810 ) ) ( not ( = ?auto_132805 ?auto_132813 ) ) ( not ( = ?auto_132812 ?auto_132810 ) ) ( not ( = ?auto_132812 ?auto_132813 ) ) ( not ( = ?auto_132810 ?auto_132813 ) ) ( ON ?auto_132810 ?auto_132812 ) ( ON-TABLE ?auto_132811 ) ( ON ?auto_132807 ?auto_132811 ) ( ON ?auto_132808 ?auto_132807 ) ( ON ?auto_132809 ?auto_132808 ) ( not ( = ?auto_132811 ?auto_132807 ) ) ( not ( = ?auto_132811 ?auto_132808 ) ) ( not ( = ?auto_132811 ?auto_132809 ) ) ( not ( = ?auto_132811 ?auto_132806 ) ) ( not ( = ?auto_132811 ?auto_132813 ) ) ( not ( = ?auto_132807 ?auto_132808 ) ) ( not ( = ?auto_132807 ?auto_132809 ) ) ( not ( = ?auto_132807 ?auto_132806 ) ) ( not ( = ?auto_132807 ?auto_132813 ) ) ( not ( = ?auto_132808 ?auto_132809 ) ) ( not ( = ?auto_132808 ?auto_132806 ) ) ( not ( = ?auto_132808 ?auto_132813 ) ) ( not ( = ?auto_132809 ?auto_132806 ) ) ( not ( = ?auto_132809 ?auto_132813 ) ) ( not ( = ?auto_132806 ?auto_132813 ) ) ( not ( = ?auto_132805 ?auto_132806 ) ) ( not ( = ?auto_132805 ?auto_132811 ) ) ( not ( = ?auto_132805 ?auto_132807 ) ) ( not ( = ?auto_132805 ?auto_132808 ) ) ( not ( = ?auto_132805 ?auto_132809 ) ) ( not ( = ?auto_132812 ?auto_132806 ) ) ( not ( = ?auto_132812 ?auto_132811 ) ) ( not ( = ?auto_132812 ?auto_132807 ) ) ( not ( = ?auto_132812 ?auto_132808 ) ) ( not ( = ?auto_132812 ?auto_132809 ) ) ( not ( = ?auto_132810 ?auto_132806 ) ) ( not ( = ?auto_132810 ?auto_132811 ) ) ( not ( = ?auto_132810 ?auto_132807 ) ) ( not ( = ?auto_132810 ?auto_132808 ) ) ( not ( = ?auto_132810 ?auto_132809 ) ) ( ON ?auto_132813 ?auto_132810 ) ( CLEAR ?auto_132809 ) ( ON ?auto_132806 ?auto_132813 ) ( CLEAR ?auto_132806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132805 ?auto_132812 ?auto_132810 ?auto_132813 )
      ( MAKE-1PILE ?auto_132805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132814 - BLOCK
    )
    :vars
    (
      ?auto_132819 - BLOCK
      ?auto_132820 - BLOCK
      ?auto_132816 - BLOCK
      ?auto_132822 - BLOCK
      ?auto_132817 - BLOCK
      ?auto_132815 - BLOCK
      ?auto_132818 - BLOCK
      ?auto_132821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132819 ?auto_132814 ) ( ON-TABLE ?auto_132814 ) ( not ( = ?auto_132814 ?auto_132819 ) ) ( not ( = ?auto_132814 ?auto_132820 ) ) ( not ( = ?auto_132814 ?auto_132816 ) ) ( not ( = ?auto_132819 ?auto_132820 ) ) ( not ( = ?auto_132819 ?auto_132816 ) ) ( not ( = ?auto_132820 ?auto_132816 ) ) ( ON ?auto_132820 ?auto_132819 ) ( ON-TABLE ?auto_132822 ) ( ON ?auto_132817 ?auto_132822 ) ( ON ?auto_132815 ?auto_132817 ) ( not ( = ?auto_132822 ?auto_132817 ) ) ( not ( = ?auto_132822 ?auto_132815 ) ) ( not ( = ?auto_132822 ?auto_132818 ) ) ( not ( = ?auto_132822 ?auto_132821 ) ) ( not ( = ?auto_132822 ?auto_132816 ) ) ( not ( = ?auto_132817 ?auto_132815 ) ) ( not ( = ?auto_132817 ?auto_132818 ) ) ( not ( = ?auto_132817 ?auto_132821 ) ) ( not ( = ?auto_132817 ?auto_132816 ) ) ( not ( = ?auto_132815 ?auto_132818 ) ) ( not ( = ?auto_132815 ?auto_132821 ) ) ( not ( = ?auto_132815 ?auto_132816 ) ) ( not ( = ?auto_132818 ?auto_132821 ) ) ( not ( = ?auto_132818 ?auto_132816 ) ) ( not ( = ?auto_132821 ?auto_132816 ) ) ( not ( = ?auto_132814 ?auto_132821 ) ) ( not ( = ?auto_132814 ?auto_132822 ) ) ( not ( = ?auto_132814 ?auto_132817 ) ) ( not ( = ?auto_132814 ?auto_132815 ) ) ( not ( = ?auto_132814 ?auto_132818 ) ) ( not ( = ?auto_132819 ?auto_132821 ) ) ( not ( = ?auto_132819 ?auto_132822 ) ) ( not ( = ?auto_132819 ?auto_132817 ) ) ( not ( = ?auto_132819 ?auto_132815 ) ) ( not ( = ?auto_132819 ?auto_132818 ) ) ( not ( = ?auto_132820 ?auto_132821 ) ) ( not ( = ?auto_132820 ?auto_132822 ) ) ( not ( = ?auto_132820 ?auto_132817 ) ) ( not ( = ?auto_132820 ?auto_132815 ) ) ( not ( = ?auto_132820 ?auto_132818 ) ) ( ON ?auto_132816 ?auto_132820 ) ( ON ?auto_132821 ?auto_132816 ) ( CLEAR ?auto_132821 ) ( HOLDING ?auto_132818 ) ( CLEAR ?auto_132815 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132822 ?auto_132817 ?auto_132815 ?auto_132818 )
      ( MAKE-1PILE ?auto_132814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132823 - BLOCK
    )
    :vars
    (
      ?auto_132828 - BLOCK
      ?auto_132830 - BLOCK
      ?auto_132831 - BLOCK
      ?auto_132827 - BLOCK
      ?auto_132824 - BLOCK
      ?auto_132825 - BLOCK
      ?auto_132826 - BLOCK
      ?auto_132829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132828 ?auto_132823 ) ( ON-TABLE ?auto_132823 ) ( not ( = ?auto_132823 ?auto_132828 ) ) ( not ( = ?auto_132823 ?auto_132830 ) ) ( not ( = ?auto_132823 ?auto_132831 ) ) ( not ( = ?auto_132828 ?auto_132830 ) ) ( not ( = ?auto_132828 ?auto_132831 ) ) ( not ( = ?auto_132830 ?auto_132831 ) ) ( ON ?auto_132830 ?auto_132828 ) ( ON-TABLE ?auto_132827 ) ( ON ?auto_132824 ?auto_132827 ) ( ON ?auto_132825 ?auto_132824 ) ( not ( = ?auto_132827 ?auto_132824 ) ) ( not ( = ?auto_132827 ?auto_132825 ) ) ( not ( = ?auto_132827 ?auto_132826 ) ) ( not ( = ?auto_132827 ?auto_132829 ) ) ( not ( = ?auto_132827 ?auto_132831 ) ) ( not ( = ?auto_132824 ?auto_132825 ) ) ( not ( = ?auto_132824 ?auto_132826 ) ) ( not ( = ?auto_132824 ?auto_132829 ) ) ( not ( = ?auto_132824 ?auto_132831 ) ) ( not ( = ?auto_132825 ?auto_132826 ) ) ( not ( = ?auto_132825 ?auto_132829 ) ) ( not ( = ?auto_132825 ?auto_132831 ) ) ( not ( = ?auto_132826 ?auto_132829 ) ) ( not ( = ?auto_132826 ?auto_132831 ) ) ( not ( = ?auto_132829 ?auto_132831 ) ) ( not ( = ?auto_132823 ?auto_132829 ) ) ( not ( = ?auto_132823 ?auto_132827 ) ) ( not ( = ?auto_132823 ?auto_132824 ) ) ( not ( = ?auto_132823 ?auto_132825 ) ) ( not ( = ?auto_132823 ?auto_132826 ) ) ( not ( = ?auto_132828 ?auto_132829 ) ) ( not ( = ?auto_132828 ?auto_132827 ) ) ( not ( = ?auto_132828 ?auto_132824 ) ) ( not ( = ?auto_132828 ?auto_132825 ) ) ( not ( = ?auto_132828 ?auto_132826 ) ) ( not ( = ?auto_132830 ?auto_132829 ) ) ( not ( = ?auto_132830 ?auto_132827 ) ) ( not ( = ?auto_132830 ?auto_132824 ) ) ( not ( = ?auto_132830 ?auto_132825 ) ) ( not ( = ?auto_132830 ?auto_132826 ) ) ( ON ?auto_132831 ?auto_132830 ) ( ON ?auto_132829 ?auto_132831 ) ( CLEAR ?auto_132825 ) ( ON ?auto_132826 ?auto_132829 ) ( CLEAR ?auto_132826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132823 ?auto_132828 ?auto_132830 ?auto_132831 ?auto_132829 )
      ( MAKE-1PILE ?auto_132823 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132832 - BLOCK
    )
    :vars
    (
      ?auto_132839 - BLOCK
      ?auto_132838 - BLOCK
      ?auto_132837 - BLOCK
      ?auto_132840 - BLOCK
      ?auto_132833 - BLOCK
      ?auto_132835 - BLOCK
      ?auto_132834 - BLOCK
      ?auto_132836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132839 ?auto_132832 ) ( ON-TABLE ?auto_132832 ) ( not ( = ?auto_132832 ?auto_132839 ) ) ( not ( = ?auto_132832 ?auto_132838 ) ) ( not ( = ?auto_132832 ?auto_132837 ) ) ( not ( = ?auto_132839 ?auto_132838 ) ) ( not ( = ?auto_132839 ?auto_132837 ) ) ( not ( = ?auto_132838 ?auto_132837 ) ) ( ON ?auto_132838 ?auto_132839 ) ( ON-TABLE ?auto_132840 ) ( ON ?auto_132833 ?auto_132840 ) ( not ( = ?auto_132840 ?auto_132833 ) ) ( not ( = ?auto_132840 ?auto_132835 ) ) ( not ( = ?auto_132840 ?auto_132834 ) ) ( not ( = ?auto_132840 ?auto_132836 ) ) ( not ( = ?auto_132840 ?auto_132837 ) ) ( not ( = ?auto_132833 ?auto_132835 ) ) ( not ( = ?auto_132833 ?auto_132834 ) ) ( not ( = ?auto_132833 ?auto_132836 ) ) ( not ( = ?auto_132833 ?auto_132837 ) ) ( not ( = ?auto_132835 ?auto_132834 ) ) ( not ( = ?auto_132835 ?auto_132836 ) ) ( not ( = ?auto_132835 ?auto_132837 ) ) ( not ( = ?auto_132834 ?auto_132836 ) ) ( not ( = ?auto_132834 ?auto_132837 ) ) ( not ( = ?auto_132836 ?auto_132837 ) ) ( not ( = ?auto_132832 ?auto_132836 ) ) ( not ( = ?auto_132832 ?auto_132840 ) ) ( not ( = ?auto_132832 ?auto_132833 ) ) ( not ( = ?auto_132832 ?auto_132835 ) ) ( not ( = ?auto_132832 ?auto_132834 ) ) ( not ( = ?auto_132839 ?auto_132836 ) ) ( not ( = ?auto_132839 ?auto_132840 ) ) ( not ( = ?auto_132839 ?auto_132833 ) ) ( not ( = ?auto_132839 ?auto_132835 ) ) ( not ( = ?auto_132839 ?auto_132834 ) ) ( not ( = ?auto_132838 ?auto_132836 ) ) ( not ( = ?auto_132838 ?auto_132840 ) ) ( not ( = ?auto_132838 ?auto_132833 ) ) ( not ( = ?auto_132838 ?auto_132835 ) ) ( not ( = ?auto_132838 ?auto_132834 ) ) ( ON ?auto_132837 ?auto_132838 ) ( ON ?auto_132836 ?auto_132837 ) ( ON ?auto_132834 ?auto_132836 ) ( CLEAR ?auto_132834 ) ( HOLDING ?auto_132835 ) ( CLEAR ?auto_132833 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132840 ?auto_132833 ?auto_132835 )
      ( MAKE-1PILE ?auto_132832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132841 - BLOCK
    )
    :vars
    (
      ?auto_132848 - BLOCK
      ?auto_132849 - BLOCK
      ?auto_132844 - BLOCK
      ?auto_132843 - BLOCK
      ?auto_132847 - BLOCK
      ?auto_132845 - BLOCK
      ?auto_132842 - BLOCK
      ?auto_132846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132848 ?auto_132841 ) ( ON-TABLE ?auto_132841 ) ( not ( = ?auto_132841 ?auto_132848 ) ) ( not ( = ?auto_132841 ?auto_132849 ) ) ( not ( = ?auto_132841 ?auto_132844 ) ) ( not ( = ?auto_132848 ?auto_132849 ) ) ( not ( = ?auto_132848 ?auto_132844 ) ) ( not ( = ?auto_132849 ?auto_132844 ) ) ( ON ?auto_132849 ?auto_132848 ) ( ON-TABLE ?auto_132843 ) ( ON ?auto_132847 ?auto_132843 ) ( not ( = ?auto_132843 ?auto_132847 ) ) ( not ( = ?auto_132843 ?auto_132845 ) ) ( not ( = ?auto_132843 ?auto_132842 ) ) ( not ( = ?auto_132843 ?auto_132846 ) ) ( not ( = ?auto_132843 ?auto_132844 ) ) ( not ( = ?auto_132847 ?auto_132845 ) ) ( not ( = ?auto_132847 ?auto_132842 ) ) ( not ( = ?auto_132847 ?auto_132846 ) ) ( not ( = ?auto_132847 ?auto_132844 ) ) ( not ( = ?auto_132845 ?auto_132842 ) ) ( not ( = ?auto_132845 ?auto_132846 ) ) ( not ( = ?auto_132845 ?auto_132844 ) ) ( not ( = ?auto_132842 ?auto_132846 ) ) ( not ( = ?auto_132842 ?auto_132844 ) ) ( not ( = ?auto_132846 ?auto_132844 ) ) ( not ( = ?auto_132841 ?auto_132846 ) ) ( not ( = ?auto_132841 ?auto_132843 ) ) ( not ( = ?auto_132841 ?auto_132847 ) ) ( not ( = ?auto_132841 ?auto_132845 ) ) ( not ( = ?auto_132841 ?auto_132842 ) ) ( not ( = ?auto_132848 ?auto_132846 ) ) ( not ( = ?auto_132848 ?auto_132843 ) ) ( not ( = ?auto_132848 ?auto_132847 ) ) ( not ( = ?auto_132848 ?auto_132845 ) ) ( not ( = ?auto_132848 ?auto_132842 ) ) ( not ( = ?auto_132849 ?auto_132846 ) ) ( not ( = ?auto_132849 ?auto_132843 ) ) ( not ( = ?auto_132849 ?auto_132847 ) ) ( not ( = ?auto_132849 ?auto_132845 ) ) ( not ( = ?auto_132849 ?auto_132842 ) ) ( ON ?auto_132844 ?auto_132849 ) ( ON ?auto_132846 ?auto_132844 ) ( ON ?auto_132842 ?auto_132846 ) ( CLEAR ?auto_132847 ) ( ON ?auto_132845 ?auto_132842 ) ( CLEAR ?auto_132845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132841 ?auto_132848 ?auto_132849 ?auto_132844 ?auto_132846 ?auto_132842 )
      ( MAKE-1PILE ?auto_132841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132850 - BLOCK
    )
    :vars
    (
      ?auto_132857 - BLOCK
      ?auto_132852 - BLOCK
      ?auto_132856 - BLOCK
      ?auto_132851 - BLOCK
      ?auto_132854 - BLOCK
      ?auto_132853 - BLOCK
      ?auto_132855 - BLOCK
      ?auto_132858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132857 ?auto_132850 ) ( ON-TABLE ?auto_132850 ) ( not ( = ?auto_132850 ?auto_132857 ) ) ( not ( = ?auto_132850 ?auto_132852 ) ) ( not ( = ?auto_132850 ?auto_132856 ) ) ( not ( = ?auto_132857 ?auto_132852 ) ) ( not ( = ?auto_132857 ?auto_132856 ) ) ( not ( = ?auto_132852 ?auto_132856 ) ) ( ON ?auto_132852 ?auto_132857 ) ( ON-TABLE ?auto_132851 ) ( not ( = ?auto_132851 ?auto_132854 ) ) ( not ( = ?auto_132851 ?auto_132853 ) ) ( not ( = ?auto_132851 ?auto_132855 ) ) ( not ( = ?auto_132851 ?auto_132858 ) ) ( not ( = ?auto_132851 ?auto_132856 ) ) ( not ( = ?auto_132854 ?auto_132853 ) ) ( not ( = ?auto_132854 ?auto_132855 ) ) ( not ( = ?auto_132854 ?auto_132858 ) ) ( not ( = ?auto_132854 ?auto_132856 ) ) ( not ( = ?auto_132853 ?auto_132855 ) ) ( not ( = ?auto_132853 ?auto_132858 ) ) ( not ( = ?auto_132853 ?auto_132856 ) ) ( not ( = ?auto_132855 ?auto_132858 ) ) ( not ( = ?auto_132855 ?auto_132856 ) ) ( not ( = ?auto_132858 ?auto_132856 ) ) ( not ( = ?auto_132850 ?auto_132858 ) ) ( not ( = ?auto_132850 ?auto_132851 ) ) ( not ( = ?auto_132850 ?auto_132854 ) ) ( not ( = ?auto_132850 ?auto_132853 ) ) ( not ( = ?auto_132850 ?auto_132855 ) ) ( not ( = ?auto_132857 ?auto_132858 ) ) ( not ( = ?auto_132857 ?auto_132851 ) ) ( not ( = ?auto_132857 ?auto_132854 ) ) ( not ( = ?auto_132857 ?auto_132853 ) ) ( not ( = ?auto_132857 ?auto_132855 ) ) ( not ( = ?auto_132852 ?auto_132858 ) ) ( not ( = ?auto_132852 ?auto_132851 ) ) ( not ( = ?auto_132852 ?auto_132854 ) ) ( not ( = ?auto_132852 ?auto_132853 ) ) ( not ( = ?auto_132852 ?auto_132855 ) ) ( ON ?auto_132856 ?auto_132852 ) ( ON ?auto_132858 ?auto_132856 ) ( ON ?auto_132855 ?auto_132858 ) ( ON ?auto_132853 ?auto_132855 ) ( CLEAR ?auto_132853 ) ( HOLDING ?auto_132854 ) ( CLEAR ?auto_132851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132851 ?auto_132854 )
      ( MAKE-1PILE ?auto_132850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135029 - BLOCK
    )
    :vars
    (
      ?auto_135032 - BLOCK
      ?auto_135036 - BLOCK
      ?auto_135030 - BLOCK
      ?auto_135031 - BLOCK
      ?auto_135035 - BLOCK
      ?auto_135033 - BLOCK
      ?auto_135034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135032 ?auto_135029 ) ( ON-TABLE ?auto_135029 ) ( not ( = ?auto_135029 ?auto_135032 ) ) ( not ( = ?auto_135029 ?auto_135036 ) ) ( not ( = ?auto_135029 ?auto_135030 ) ) ( not ( = ?auto_135032 ?auto_135036 ) ) ( not ( = ?auto_135032 ?auto_135030 ) ) ( not ( = ?auto_135036 ?auto_135030 ) ) ( ON ?auto_135036 ?auto_135032 ) ( not ( = ?auto_135031 ?auto_135035 ) ) ( not ( = ?auto_135031 ?auto_135033 ) ) ( not ( = ?auto_135031 ?auto_135034 ) ) ( not ( = ?auto_135031 ?auto_135030 ) ) ( not ( = ?auto_135035 ?auto_135033 ) ) ( not ( = ?auto_135035 ?auto_135034 ) ) ( not ( = ?auto_135035 ?auto_135030 ) ) ( not ( = ?auto_135033 ?auto_135034 ) ) ( not ( = ?auto_135033 ?auto_135030 ) ) ( not ( = ?auto_135034 ?auto_135030 ) ) ( not ( = ?auto_135029 ?auto_135034 ) ) ( not ( = ?auto_135029 ?auto_135031 ) ) ( not ( = ?auto_135029 ?auto_135035 ) ) ( not ( = ?auto_135029 ?auto_135033 ) ) ( not ( = ?auto_135032 ?auto_135034 ) ) ( not ( = ?auto_135032 ?auto_135031 ) ) ( not ( = ?auto_135032 ?auto_135035 ) ) ( not ( = ?auto_135032 ?auto_135033 ) ) ( not ( = ?auto_135036 ?auto_135034 ) ) ( not ( = ?auto_135036 ?auto_135031 ) ) ( not ( = ?auto_135036 ?auto_135035 ) ) ( not ( = ?auto_135036 ?auto_135033 ) ) ( ON ?auto_135030 ?auto_135036 ) ( ON ?auto_135034 ?auto_135030 ) ( ON ?auto_135033 ?auto_135034 ) ( ON ?auto_135035 ?auto_135033 ) ( ON ?auto_135031 ?auto_135035 ) ( CLEAR ?auto_135031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135029 ?auto_135032 ?auto_135036 ?auto_135030 ?auto_135034 ?auto_135033 ?auto_135035 )
      ( MAKE-1PILE ?auto_135029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132868 - BLOCK
    )
    :vars
    (
      ?auto_132870 - BLOCK
      ?auto_132871 - BLOCK
      ?auto_132874 - BLOCK
      ?auto_132875 - BLOCK
      ?auto_132876 - BLOCK
      ?auto_132872 - BLOCK
      ?auto_132869 - BLOCK
      ?auto_132873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132870 ?auto_132868 ) ( ON-TABLE ?auto_132868 ) ( not ( = ?auto_132868 ?auto_132870 ) ) ( not ( = ?auto_132868 ?auto_132871 ) ) ( not ( = ?auto_132868 ?auto_132874 ) ) ( not ( = ?auto_132870 ?auto_132871 ) ) ( not ( = ?auto_132870 ?auto_132874 ) ) ( not ( = ?auto_132871 ?auto_132874 ) ) ( ON ?auto_132871 ?auto_132870 ) ( not ( = ?auto_132875 ?auto_132876 ) ) ( not ( = ?auto_132875 ?auto_132872 ) ) ( not ( = ?auto_132875 ?auto_132869 ) ) ( not ( = ?auto_132875 ?auto_132873 ) ) ( not ( = ?auto_132875 ?auto_132874 ) ) ( not ( = ?auto_132876 ?auto_132872 ) ) ( not ( = ?auto_132876 ?auto_132869 ) ) ( not ( = ?auto_132876 ?auto_132873 ) ) ( not ( = ?auto_132876 ?auto_132874 ) ) ( not ( = ?auto_132872 ?auto_132869 ) ) ( not ( = ?auto_132872 ?auto_132873 ) ) ( not ( = ?auto_132872 ?auto_132874 ) ) ( not ( = ?auto_132869 ?auto_132873 ) ) ( not ( = ?auto_132869 ?auto_132874 ) ) ( not ( = ?auto_132873 ?auto_132874 ) ) ( not ( = ?auto_132868 ?auto_132873 ) ) ( not ( = ?auto_132868 ?auto_132875 ) ) ( not ( = ?auto_132868 ?auto_132876 ) ) ( not ( = ?auto_132868 ?auto_132872 ) ) ( not ( = ?auto_132868 ?auto_132869 ) ) ( not ( = ?auto_132870 ?auto_132873 ) ) ( not ( = ?auto_132870 ?auto_132875 ) ) ( not ( = ?auto_132870 ?auto_132876 ) ) ( not ( = ?auto_132870 ?auto_132872 ) ) ( not ( = ?auto_132870 ?auto_132869 ) ) ( not ( = ?auto_132871 ?auto_132873 ) ) ( not ( = ?auto_132871 ?auto_132875 ) ) ( not ( = ?auto_132871 ?auto_132876 ) ) ( not ( = ?auto_132871 ?auto_132872 ) ) ( not ( = ?auto_132871 ?auto_132869 ) ) ( ON ?auto_132874 ?auto_132871 ) ( ON ?auto_132873 ?auto_132874 ) ( ON ?auto_132869 ?auto_132873 ) ( ON ?auto_132872 ?auto_132869 ) ( ON ?auto_132876 ?auto_132872 ) ( CLEAR ?auto_132876 ) ( HOLDING ?auto_132875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132875 )
      ( MAKE-1PILE ?auto_132868 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132877 - BLOCK
    )
    :vars
    (
      ?auto_132882 - BLOCK
      ?auto_132879 - BLOCK
      ?auto_132880 - BLOCK
      ?auto_132883 - BLOCK
      ?auto_132885 - BLOCK
      ?auto_132884 - BLOCK
      ?auto_132881 - BLOCK
      ?auto_132878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132882 ?auto_132877 ) ( ON-TABLE ?auto_132877 ) ( not ( = ?auto_132877 ?auto_132882 ) ) ( not ( = ?auto_132877 ?auto_132879 ) ) ( not ( = ?auto_132877 ?auto_132880 ) ) ( not ( = ?auto_132882 ?auto_132879 ) ) ( not ( = ?auto_132882 ?auto_132880 ) ) ( not ( = ?auto_132879 ?auto_132880 ) ) ( ON ?auto_132879 ?auto_132882 ) ( not ( = ?auto_132883 ?auto_132885 ) ) ( not ( = ?auto_132883 ?auto_132884 ) ) ( not ( = ?auto_132883 ?auto_132881 ) ) ( not ( = ?auto_132883 ?auto_132878 ) ) ( not ( = ?auto_132883 ?auto_132880 ) ) ( not ( = ?auto_132885 ?auto_132884 ) ) ( not ( = ?auto_132885 ?auto_132881 ) ) ( not ( = ?auto_132885 ?auto_132878 ) ) ( not ( = ?auto_132885 ?auto_132880 ) ) ( not ( = ?auto_132884 ?auto_132881 ) ) ( not ( = ?auto_132884 ?auto_132878 ) ) ( not ( = ?auto_132884 ?auto_132880 ) ) ( not ( = ?auto_132881 ?auto_132878 ) ) ( not ( = ?auto_132881 ?auto_132880 ) ) ( not ( = ?auto_132878 ?auto_132880 ) ) ( not ( = ?auto_132877 ?auto_132878 ) ) ( not ( = ?auto_132877 ?auto_132883 ) ) ( not ( = ?auto_132877 ?auto_132885 ) ) ( not ( = ?auto_132877 ?auto_132884 ) ) ( not ( = ?auto_132877 ?auto_132881 ) ) ( not ( = ?auto_132882 ?auto_132878 ) ) ( not ( = ?auto_132882 ?auto_132883 ) ) ( not ( = ?auto_132882 ?auto_132885 ) ) ( not ( = ?auto_132882 ?auto_132884 ) ) ( not ( = ?auto_132882 ?auto_132881 ) ) ( not ( = ?auto_132879 ?auto_132878 ) ) ( not ( = ?auto_132879 ?auto_132883 ) ) ( not ( = ?auto_132879 ?auto_132885 ) ) ( not ( = ?auto_132879 ?auto_132884 ) ) ( not ( = ?auto_132879 ?auto_132881 ) ) ( ON ?auto_132880 ?auto_132879 ) ( ON ?auto_132878 ?auto_132880 ) ( ON ?auto_132881 ?auto_132878 ) ( ON ?auto_132884 ?auto_132881 ) ( ON ?auto_132885 ?auto_132884 ) ( ON ?auto_132883 ?auto_132885 ) ( CLEAR ?auto_132883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132877 ?auto_132882 ?auto_132879 ?auto_132880 ?auto_132878 ?auto_132881 ?auto_132884 ?auto_132885 )
      ( MAKE-1PILE ?auto_132877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132894 - BLOCK
      ?auto_132895 - BLOCK
      ?auto_132896 - BLOCK
      ?auto_132897 - BLOCK
      ?auto_132898 - BLOCK
      ?auto_132899 - BLOCK
      ?auto_132900 - BLOCK
      ?auto_132901 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132901 ) ( CLEAR ?auto_132900 ) ( ON-TABLE ?auto_132894 ) ( ON ?auto_132895 ?auto_132894 ) ( ON ?auto_132896 ?auto_132895 ) ( ON ?auto_132897 ?auto_132896 ) ( ON ?auto_132898 ?auto_132897 ) ( ON ?auto_132899 ?auto_132898 ) ( ON ?auto_132900 ?auto_132899 ) ( not ( = ?auto_132894 ?auto_132895 ) ) ( not ( = ?auto_132894 ?auto_132896 ) ) ( not ( = ?auto_132894 ?auto_132897 ) ) ( not ( = ?auto_132894 ?auto_132898 ) ) ( not ( = ?auto_132894 ?auto_132899 ) ) ( not ( = ?auto_132894 ?auto_132900 ) ) ( not ( = ?auto_132894 ?auto_132901 ) ) ( not ( = ?auto_132895 ?auto_132896 ) ) ( not ( = ?auto_132895 ?auto_132897 ) ) ( not ( = ?auto_132895 ?auto_132898 ) ) ( not ( = ?auto_132895 ?auto_132899 ) ) ( not ( = ?auto_132895 ?auto_132900 ) ) ( not ( = ?auto_132895 ?auto_132901 ) ) ( not ( = ?auto_132896 ?auto_132897 ) ) ( not ( = ?auto_132896 ?auto_132898 ) ) ( not ( = ?auto_132896 ?auto_132899 ) ) ( not ( = ?auto_132896 ?auto_132900 ) ) ( not ( = ?auto_132896 ?auto_132901 ) ) ( not ( = ?auto_132897 ?auto_132898 ) ) ( not ( = ?auto_132897 ?auto_132899 ) ) ( not ( = ?auto_132897 ?auto_132900 ) ) ( not ( = ?auto_132897 ?auto_132901 ) ) ( not ( = ?auto_132898 ?auto_132899 ) ) ( not ( = ?auto_132898 ?auto_132900 ) ) ( not ( = ?auto_132898 ?auto_132901 ) ) ( not ( = ?auto_132899 ?auto_132900 ) ) ( not ( = ?auto_132899 ?auto_132901 ) ) ( not ( = ?auto_132900 ?auto_132901 ) ) )
    :subtasks
    ( ( !STACK ?auto_132901 ?auto_132900 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132902 - BLOCK
      ?auto_132903 - BLOCK
      ?auto_132904 - BLOCK
      ?auto_132905 - BLOCK
      ?auto_132906 - BLOCK
      ?auto_132907 - BLOCK
      ?auto_132908 - BLOCK
      ?auto_132909 - BLOCK
    )
    :vars
    (
      ?auto_132910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132908 ) ( ON-TABLE ?auto_132902 ) ( ON ?auto_132903 ?auto_132902 ) ( ON ?auto_132904 ?auto_132903 ) ( ON ?auto_132905 ?auto_132904 ) ( ON ?auto_132906 ?auto_132905 ) ( ON ?auto_132907 ?auto_132906 ) ( ON ?auto_132908 ?auto_132907 ) ( not ( = ?auto_132902 ?auto_132903 ) ) ( not ( = ?auto_132902 ?auto_132904 ) ) ( not ( = ?auto_132902 ?auto_132905 ) ) ( not ( = ?auto_132902 ?auto_132906 ) ) ( not ( = ?auto_132902 ?auto_132907 ) ) ( not ( = ?auto_132902 ?auto_132908 ) ) ( not ( = ?auto_132902 ?auto_132909 ) ) ( not ( = ?auto_132903 ?auto_132904 ) ) ( not ( = ?auto_132903 ?auto_132905 ) ) ( not ( = ?auto_132903 ?auto_132906 ) ) ( not ( = ?auto_132903 ?auto_132907 ) ) ( not ( = ?auto_132903 ?auto_132908 ) ) ( not ( = ?auto_132903 ?auto_132909 ) ) ( not ( = ?auto_132904 ?auto_132905 ) ) ( not ( = ?auto_132904 ?auto_132906 ) ) ( not ( = ?auto_132904 ?auto_132907 ) ) ( not ( = ?auto_132904 ?auto_132908 ) ) ( not ( = ?auto_132904 ?auto_132909 ) ) ( not ( = ?auto_132905 ?auto_132906 ) ) ( not ( = ?auto_132905 ?auto_132907 ) ) ( not ( = ?auto_132905 ?auto_132908 ) ) ( not ( = ?auto_132905 ?auto_132909 ) ) ( not ( = ?auto_132906 ?auto_132907 ) ) ( not ( = ?auto_132906 ?auto_132908 ) ) ( not ( = ?auto_132906 ?auto_132909 ) ) ( not ( = ?auto_132907 ?auto_132908 ) ) ( not ( = ?auto_132907 ?auto_132909 ) ) ( not ( = ?auto_132908 ?auto_132909 ) ) ( ON ?auto_132909 ?auto_132910 ) ( CLEAR ?auto_132909 ) ( HAND-EMPTY ) ( not ( = ?auto_132902 ?auto_132910 ) ) ( not ( = ?auto_132903 ?auto_132910 ) ) ( not ( = ?auto_132904 ?auto_132910 ) ) ( not ( = ?auto_132905 ?auto_132910 ) ) ( not ( = ?auto_132906 ?auto_132910 ) ) ( not ( = ?auto_132907 ?auto_132910 ) ) ( not ( = ?auto_132908 ?auto_132910 ) ) ( not ( = ?auto_132909 ?auto_132910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132909 ?auto_132910 )
      ( MAKE-8PILE ?auto_132902 ?auto_132903 ?auto_132904 ?auto_132905 ?auto_132906 ?auto_132907 ?auto_132908 ?auto_132909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132911 - BLOCK
      ?auto_132912 - BLOCK
      ?auto_132913 - BLOCK
      ?auto_132914 - BLOCK
      ?auto_132915 - BLOCK
      ?auto_132916 - BLOCK
      ?auto_132917 - BLOCK
      ?auto_132918 - BLOCK
    )
    :vars
    (
      ?auto_132919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132911 ) ( ON ?auto_132912 ?auto_132911 ) ( ON ?auto_132913 ?auto_132912 ) ( ON ?auto_132914 ?auto_132913 ) ( ON ?auto_132915 ?auto_132914 ) ( ON ?auto_132916 ?auto_132915 ) ( not ( = ?auto_132911 ?auto_132912 ) ) ( not ( = ?auto_132911 ?auto_132913 ) ) ( not ( = ?auto_132911 ?auto_132914 ) ) ( not ( = ?auto_132911 ?auto_132915 ) ) ( not ( = ?auto_132911 ?auto_132916 ) ) ( not ( = ?auto_132911 ?auto_132917 ) ) ( not ( = ?auto_132911 ?auto_132918 ) ) ( not ( = ?auto_132912 ?auto_132913 ) ) ( not ( = ?auto_132912 ?auto_132914 ) ) ( not ( = ?auto_132912 ?auto_132915 ) ) ( not ( = ?auto_132912 ?auto_132916 ) ) ( not ( = ?auto_132912 ?auto_132917 ) ) ( not ( = ?auto_132912 ?auto_132918 ) ) ( not ( = ?auto_132913 ?auto_132914 ) ) ( not ( = ?auto_132913 ?auto_132915 ) ) ( not ( = ?auto_132913 ?auto_132916 ) ) ( not ( = ?auto_132913 ?auto_132917 ) ) ( not ( = ?auto_132913 ?auto_132918 ) ) ( not ( = ?auto_132914 ?auto_132915 ) ) ( not ( = ?auto_132914 ?auto_132916 ) ) ( not ( = ?auto_132914 ?auto_132917 ) ) ( not ( = ?auto_132914 ?auto_132918 ) ) ( not ( = ?auto_132915 ?auto_132916 ) ) ( not ( = ?auto_132915 ?auto_132917 ) ) ( not ( = ?auto_132915 ?auto_132918 ) ) ( not ( = ?auto_132916 ?auto_132917 ) ) ( not ( = ?auto_132916 ?auto_132918 ) ) ( not ( = ?auto_132917 ?auto_132918 ) ) ( ON ?auto_132918 ?auto_132919 ) ( CLEAR ?auto_132918 ) ( not ( = ?auto_132911 ?auto_132919 ) ) ( not ( = ?auto_132912 ?auto_132919 ) ) ( not ( = ?auto_132913 ?auto_132919 ) ) ( not ( = ?auto_132914 ?auto_132919 ) ) ( not ( = ?auto_132915 ?auto_132919 ) ) ( not ( = ?auto_132916 ?auto_132919 ) ) ( not ( = ?auto_132917 ?auto_132919 ) ) ( not ( = ?auto_132918 ?auto_132919 ) ) ( HOLDING ?auto_132917 ) ( CLEAR ?auto_132916 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132911 ?auto_132912 ?auto_132913 ?auto_132914 ?auto_132915 ?auto_132916 ?auto_132917 )
      ( MAKE-8PILE ?auto_132911 ?auto_132912 ?auto_132913 ?auto_132914 ?auto_132915 ?auto_132916 ?auto_132917 ?auto_132918 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132920 - BLOCK
      ?auto_132921 - BLOCK
      ?auto_132922 - BLOCK
      ?auto_132923 - BLOCK
      ?auto_132924 - BLOCK
      ?auto_132925 - BLOCK
      ?auto_132926 - BLOCK
      ?auto_132927 - BLOCK
    )
    :vars
    (
      ?auto_132928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132920 ) ( ON ?auto_132921 ?auto_132920 ) ( ON ?auto_132922 ?auto_132921 ) ( ON ?auto_132923 ?auto_132922 ) ( ON ?auto_132924 ?auto_132923 ) ( ON ?auto_132925 ?auto_132924 ) ( not ( = ?auto_132920 ?auto_132921 ) ) ( not ( = ?auto_132920 ?auto_132922 ) ) ( not ( = ?auto_132920 ?auto_132923 ) ) ( not ( = ?auto_132920 ?auto_132924 ) ) ( not ( = ?auto_132920 ?auto_132925 ) ) ( not ( = ?auto_132920 ?auto_132926 ) ) ( not ( = ?auto_132920 ?auto_132927 ) ) ( not ( = ?auto_132921 ?auto_132922 ) ) ( not ( = ?auto_132921 ?auto_132923 ) ) ( not ( = ?auto_132921 ?auto_132924 ) ) ( not ( = ?auto_132921 ?auto_132925 ) ) ( not ( = ?auto_132921 ?auto_132926 ) ) ( not ( = ?auto_132921 ?auto_132927 ) ) ( not ( = ?auto_132922 ?auto_132923 ) ) ( not ( = ?auto_132922 ?auto_132924 ) ) ( not ( = ?auto_132922 ?auto_132925 ) ) ( not ( = ?auto_132922 ?auto_132926 ) ) ( not ( = ?auto_132922 ?auto_132927 ) ) ( not ( = ?auto_132923 ?auto_132924 ) ) ( not ( = ?auto_132923 ?auto_132925 ) ) ( not ( = ?auto_132923 ?auto_132926 ) ) ( not ( = ?auto_132923 ?auto_132927 ) ) ( not ( = ?auto_132924 ?auto_132925 ) ) ( not ( = ?auto_132924 ?auto_132926 ) ) ( not ( = ?auto_132924 ?auto_132927 ) ) ( not ( = ?auto_132925 ?auto_132926 ) ) ( not ( = ?auto_132925 ?auto_132927 ) ) ( not ( = ?auto_132926 ?auto_132927 ) ) ( ON ?auto_132927 ?auto_132928 ) ( not ( = ?auto_132920 ?auto_132928 ) ) ( not ( = ?auto_132921 ?auto_132928 ) ) ( not ( = ?auto_132922 ?auto_132928 ) ) ( not ( = ?auto_132923 ?auto_132928 ) ) ( not ( = ?auto_132924 ?auto_132928 ) ) ( not ( = ?auto_132925 ?auto_132928 ) ) ( not ( = ?auto_132926 ?auto_132928 ) ) ( not ( = ?auto_132927 ?auto_132928 ) ) ( CLEAR ?auto_132925 ) ( ON ?auto_132926 ?auto_132927 ) ( CLEAR ?auto_132926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132928 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132928 ?auto_132927 )
      ( MAKE-8PILE ?auto_132920 ?auto_132921 ?auto_132922 ?auto_132923 ?auto_132924 ?auto_132925 ?auto_132926 ?auto_132927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132929 - BLOCK
      ?auto_132930 - BLOCK
      ?auto_132931 - BLOCK
      ?auto_132932 - BLOCK
      ?auto_132933 - BLOCK
      ?auto_132934 - BLOCK
      ?auto_132935 - BLOCK
      ?auto_132936 - BLOCK
    )
    :vars
    (
      ?auto_132937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132929 ) ( ON ?auto_132930 ?auto_132929 ) ( ON ?auto_132931 ?auto_132930 ) ( ON ?auto_132932 ?auto_132931 ) ( ON ?auto_132933 ?auto_132932 ) ( not ( = ?auto_132929 ?auto_132930 ) ) ( not ( = ?auto_132929 ?auto_132931 ) ) ( not ( = ?auto_132929 ?auto_132932 ) ) ( not ( = ?auto_132929 ?auto_132933 ) ) ( not ( = ?auto_132929 ?auto_132934 ) ) ( not ( = ?auto_132929 ?auto_132935 ) ) ( not ( = ?auto_132929 ?auto_132936 ) ) ( not ( = ?auto_132930 ?auto_132931 ) ) ( not ( = ?auto_132930 ?auto_132932 ) ) ( not ( = ?auto_132930 ?auto_132933 ) ) ( not ( = ?auto_132930 ?auto_132934 ) ) ( not ( = ?auto_132930 ?auto_132935 ) ) ( not ( = ?auto_132930 ?auto_132936 ) ) ( not ( = ?auto_132931 ?auto_132932 ) ) ( not ( = ?auto_132931 ?auto_132933 ) ) ( not ( = ?auto_132931 ?auto_132934 ) ) ( not ( = ?auto_132931 ?auto_132935 ) ) ( not ( = ?auto_132931 ?auto_132936 ) ) ( not ( = ?auto_132932 ?auto_132933 ) ) ( not ( = ?auto_132932 ?auto_132934 ) ) ( not ( = ?auto_132932 ?auto_132935 ) ) ( not ( = ?auto_132932 ?auto_132936 ) ) ( not ( = ?auto_132933 ?auto_132934 ) ) ( not ( = ?auto_132933 ?auto_132935 ) ) ( not ( = ?auto_132933 ?auto_132936 ) ) ( not ( = ?auto_132934 ?auto_132935 ) ) ( not ( = ?auto_132934 ?auto_132936 ) ) ( not ( = ?auto_132935 ?auto_132936 ) ) ( ON ?auto_132936 ?auto_132937 ) ( not ( = ?auto_132929 ?auto_132937 ) ) ( not ( = ?auto_132930 ?auto_132937 ) ) ( not ( = ?auto_132931 ?auto_132937 ) ) ( not ( = ?auto_132932 ?auto_132937 ) ) ( not ( = ?auto_132933 ?auto_132937 ) ) ( not ( = ?auto_132934 ?auto_132937 ) ) ( not ( = ?auto_132935 ?auto_132937 ) ) ( not ( = ?auto_132936 ?auto_132937 ) ) ( ON ?auto_132935 ?auto_132936 ) ( CLEAR ?auto_132935 ) ( ON-TABLE ?auto_132937 ) ( HOLDING ?auto_132934 ) ( CLEAR ?auto_132933 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_132929 ?auto_132930 ?auto_132931 ?auto_132932 ?auto_132933 ?auto_132934 )
      ( MAKE-8PILE ?auto_132929 ?auto_132930 ?auto_132931 ?auto_132932 ?auto_132933 ?auto_132934 ?auto_132935 ?auto_132936 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132938 - BLOCK
      ?auto_132939 - BLOCK
      ?auto_132940 - BLOCK
      ?auto_132941 - BLOCK
      ?auto_132942 - BLOCK
      ?auto_132943 - BLOCK
      ?auto_132944 - BLOCK
      ?auto_132945 - BLOCK
    )
    :vars
    (
      ?auto_132946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132938 ) ( ON ?auto_132939 ?auto_132938 ) ( ON ?auto_132940 ?auto_132939 ) ( ON ?auto_132941 ?auto_132940 ) ( ON ?auto_132942 ?auto_132941 ) ( not ( = ?auto_132938 ?auto_132939 ) ) ( not ( = ?auto_132938 ?auto_132940 ) ) ( not ( = ?auto_132938 ?auto_132941 ) ) ( not ( = ?auto_132938 ?auto_132942 ) ) ( not ( = ?auto_132938 ?auto_132943 ) ) ( not ( = ?auto_132938 ?auto_132944 ) ) ( not ( = ?auto_132938 ?auto_132945 ) ) ( not ( = ?auto_132939 ?auto_132940 ) ) ( not ( = ?auto_132939 ?auto_132941 ) ) ( not ( = ?auto_132939 ?auto_132942 ) ) ( not ( = ?auto_132939 ?auto_132943 ) ) ( not ( = ?auto_132939 ?auto_132944 ) ) ( not ( = ?auto_132939 ?auto_132945 ) ) ( not ( = ?auto_132940 ?auto_132941 ) ) ( not ( = ?auto_132940 ?auto_132942 ) ) ( not ( = ?auto_132940 ?auto_132943 ) ) ( not ( = ?auto_132940 ?auto_132944 ) ) ( not ( = ?auto_132940 ?auto_132945 ) ) ( not ( = ?auto_132941 ?auto_132942 ) ) ( not ( = ?auto_132941 ?auto_132943 ) ) ( not ( = ?auto_132941 ?auto_132944 ) ) ( not ( = ?auto_132941 ?auto_132945 ) ) ( not ( = ?auto_132942 ?auto_132943 ) ) ( not ( = ?auto_132942 ?auto_132944 ) ) ( not ( = ?auto_132942 ?auto_132945 ) ) ( not ( = ?auto_132943 ?auto_132944 ) ) ( not ( = ?auto_132943 ?auto_132945 ) ) ( not ( = ?auto_132944 ?auto_132945 ) ) ( ON ?auto_132945 ?auto_132946 ) ( not ( = ?auto_132938 ?auto_132946 ) ) ( not ( = ?auto_132939 ?auto_132946 ) ) ( not ( = ?auto_132940 ?auto_132946 ) ) ( not ( = ?auto_132941 ?auto_132946 ) ) ( not ( = ?auto_132942 ?auto_132946 ) ) ( not ( = ?auto_132943 ?auto_132946 ) ) ( not ( = ?auto_132944 ?auto_132946 ) ) ( not ( = ?auto_132945 ?auto_132946 ) ) ( ON ?auto_132944 ?auto_132945 ) ( ON-TABLE ?auto_132946 ) ( CLEAR ?auto_132942 ) ( ON ?auto_132943 ?auto_132944 ) ( CLEAR ?auto_132943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132946 ?auto_132945 ?auto_132944 )
      ( MAKE-8PILE ?auto_132938 ?auto_132939 ?auto_132940 ?auto_132941 ?auto_132942 ?auto_132943 ?auto_132944 ?auto_132945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132947 - BLOCK
      ?auto_132948 - BLOCK
      ?auto_132949 - BLOCK
      ?auto_132950 - BLOCK
      ?auto_132951 - BLOCK
      ?auto_132952 - BLOCK
      ?auto_132953 - BLOCK
      ?auto_132954 - BLOCK
    )
    :vars
    (
      ?auto_132955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132947 ) ( ON ?auto_132948 ?auto_132947 ) ( ON ?auto_132949 ?auto_132948 ) ( ON ?auto_132950 ?auto_132949 ) ( not ( = ?auto_132947 ?auto_132948 ) ) ( not ( = ?auto_132947 ?auto_132949 ) ) ( not ( = ?auto_132947 ?auto_132950 ) ) ( not ( = ?auto_132947 ?auto_132951 ) ) ( not ( = ?auto_132947 ?auto_132952 ) ) ( not ( = ?auto_132947 ?auto_132953 ) ) ( not ( = ?auto_132947 ?auto_132954 ) ) ( not ( = ?auto_132948 ?auto_132949 ) ) ( not ( = ?auto_132948 ?auto_132950 ) ) ( not ( = ?auto_132948 ?auto_132951 ) ) ( not ( = ?auto_132948 ?auto_132952 ) ) ( not ( = ?auto_132948 ?auto_132953 ) ) ( not ( = ?auto_132948 ?auto_132954 ) ) ( not ( = ?auto_132949 ?auto_132950 ) ) ( not ( = ?auto_132949 ?auto_132951 ) ) ( not ( = ?auto_132949 ?auto_132952 ) ) ( not ( = ?auto_132949 ?auto_132953 ) ) ( not ( = ?auto_132949 ?auto_132954 ) ) ( not ( = ?auto_132950 ?auto_132951 ) ) ( not ( = ?auto_132950 ?auto_132952 ) ) ( not ( = ?auto_132950 ?auto_132953 ) ) ( not ( = ?auto_132950 ?auto_132954 ) ) ( not ( = ?auto_132951 ?auto_132952 ) ) ( not ( = ?auto_132951 ?auto_132953 ) ) ( not ( = ?auto_132951 ?auto_132954 ) ) ( not ( = ?auto_132952 ?auto_132953 ) ) ( not ( = ?auto_132952 ?auto_132954 ) ) ( not ( = ?auto_132953 ?auto_132954 ) ) ( ON ?auto_132954 ?auto_132955 ) ( not ( = ?auto_132947 ?auto_132955 ) ) ( not ( = ?auto_132948 ?auto_132955 ) ) ( not ( = ?auto_132949 ?auto_132955 ) ) ( not ( = ?auto_132950 ?auto_132955 ) ) ( not ( = ?auto_132951 ?auto_132955 ) ) ( not ( = ?auto_132952 ?auto_132955 ) ) ( not ( = ?auto_132953 ?auto_132955 ) ) ( not ( = ?auto_132954 ?auto_132955 ) ) ( ON ?auto_132953 ?auto_132954 ) ( ON-TABLE ?auto_132955 ) ( ON ?auto_132952 ?auto_132953 ) ( CLEAR ?auto_132952 ) ( HOLDING ?auto_132951 ) ( CLEAR ?auto_132950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132947 ?auto_132948 ?auto_132949 ?auto_132950 ?auto_132951 )
      ( MAKE-8PILE ?auto_132947 ?auto_132948 ?auto_132949 ?auto_132950 ?auto_132951 ?auto_132952 ?auto_132953 ?auto_132954 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132956 - BLOCK
      ?auto_132957 - BLOCK
      ?auto_132958 - BLOCK
      ?auto_132959 - BLOCK
      ?auto_132960 - BLOCK
      ?auto_132961 - BLOCK
      ?auto_132962 - BLOCK
      ?auto_132963 - BLOCK
    )
    :vars
    (
      ?auto_132964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132956 ) ( ON ?auto_132957 ?auto_132956 ) ( ON ?auto_132958 ?auto_132957 ) ( ON ?auto_132959 ?auto_132958 ) ( not ( = ?auto_132956 ?auto_132957 ) ) ( not ( = ?auto_132956 ?auto_132958 ) ) ( not ( = ?auto_132956 ?auto_132959 ) ) ( not ( = ?auto_132956 ?auto_132960 ) ) ( not ( = ?auto_132956 ?auto_132961 ) ) ( not ( = ?auto_132956 ?auto_132962 ) ) ( not ( = ?auto_132956 ?auto_132963 ) ) ( not ( = ?auto_132957 ?auto_132958 ) ) ( not ( = ?auto_132957 ?auto_132959 ) ) ( not ( = ?auto_132957 ?auto_132960 ) ) ( not ( = ?auto_132957 ?auto_132961 ) ) ( not ( = ?auto_132957 ?auto_132962 ) ) ( not ( = ?auto_132957 ?auto_132963 ) ) ( not ( = ?auto_132958 ?auto_132959 ) ) ( not ( = ?auto_132958 ?auto_132960 ) ) ( not ( = ?auto_132958 ?auto_132961 ) ) ( not ( = ?auto_132958 ?auto_132962 ) ) ( not ( = ?auto_132958 ?auto_132963 ) ) ( not ( = ?auto_132959 ?auto_132960 ) ) ( not ( = ?auto_132959 ?auto_132961 ) ) ( not ( = ?auto_132959 ?auto_132962 ) ) ( not ( = ?auto_132959 ?auto_132963 ) ) ( not ( = ?auto_132960 ?auto_132961 ) ) ( not ( = ?auto_132960 ?auto_132962 ) ) ( not ( = ?auto_132960 ?auto_132963 ) ) ( not ( = ?auto_132961 ?auto_132962 ) ) ( not ( = ?auto_132961 ?auto_132963 ) ) ( not ( = ?auto_132962 ?auto_132963 ) ) ( ON ?auto_132963 ?auto_132964 ) ( not ( = ?auto_132956 ?auto_132964 ) ) ( not ( = ?auto_132957 ?auto_132964 ) ) ( not ( = ?auto_132958 ?auto_132964 ) ) ( not ( = ?auto_132959 ?auto_132964 ) ) ( not ( = ?auto_132960 ?auto_132964 ) ) ( not ( = ?auto_132961 ?auto_132964 ) ) ( not ( = ?auto_132962 ?auto_132964 ) ) ( not ( = ?auto_132963 ?auto_132964 ) ) ( ON ?auto_132962 ?auto_132963 ) ( ON-TABLE ?auto_132964 ) ( ON ?auto_132961 ?auto_132962 ) ( CLEAR ?auto_132959 ) ( ON ?auto_132960 ?auto_132961 ) ( CLEAR ?auto_132960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132964 ?auto_132963 ?auto_132962 ?auto_132961 )
      ( MAKE-8PILE ?auto_132956 ?auto_132957 ?auto_132958 ?auto_132959 ?auto_132960 ?auto_132961 ?auto_132962 ?auto_132963 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132965 - BLOCK
      ?auto_132966 - BLOCK
      ?auto_132967 - BLOCK
      ?auto_132968 - BLOCK
      ?auto_132969 - BLOCK
      ?auto_132970 - BLOCK
      ?auto_132971 - BLOCK
      ?auto_132972 - BLOCK
    )
    :vars
    (
      ?auto_132973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132965 ) ( ON ?auto_132966 ?auto_132965 ) ( ON ?auto_132967 ?auto_132966 ) ( not ( = ?auto_132965 ?auto_132966 ) ) ( not ( = ?auto_132965 ?auto_132967 ) ) ( not ( = ?auto_132965 ?auto_132968 ) ) ( not ( = ?auto_132965 ?auto_132969 ) ) ( not ( = ?auto_132965 ?auto_132970 ) ) ( not ( = ?auto_132965 ?auto_132971 ) ) ( not ( = ?auto_132965 ?auto_132972 ) ) ( not ( = ?auto_132966 ?auto_132967 ) ) ( not ( = ?auto_132966 ?auto_132968 ) ) ( not ( = ?auto_132966 ?auto_132969 ) ) ( not ( = ?auto_132966 ?auto_132970 ) ) ( not ( = ?auto_132966 ?auto_132971 ) ) ( not ( = ?auto_132966 ?auto_132972 ) ) ( not ( = ?auto_132967 ?auto_132968 ) ) ( not ( = ?auto_132967 ?auto_132969 ) ) ( not ( = ?auto_132967 ?auto_132970 ) ) ( not ( = ?auto_132967 ?auto_132971 ) ) ( not ( = ?auto_132967 ?auto_132972 ) ) ( not ( = ?auto_132968 ?auto_132969 ) ) ( not ( = ?auto_132968 ?auto_132970 ) ) ( not ( = ?auto_132968 ?auto_132971 ) ) ( not ( = ?auto_132968 ?auto_132972 ) ) ( not ( = ?auto_132969 ?auto_132970 ) ) ( not ( = ?auto_132969 ?auto_132971 ) ) ( not ( = ?auto_132969 ?auto_132972 ) ) ( not ( = ?auto_132970 ?auto_132971 ) ) ( not ( = ?auto_132970 ?auto_132972 ) ) ( not ( = ?auto_132971 ?auto_132972 ) ) ( ON ?auto_132972 ?auto_132973 ) ( not ( = ?auto_132965 ?auto_132973 ) ) ( not ( = ?auto_132966 ?auto_132973 ) ) ( not ( = ?auto_132967 ?auto_132973 ) ) ( not ( = ?auto_132968 ?auto_132973 ) ) ( not ( = ?auto_132969 ?auto_132973 ) ) ( not ( = ?auto_132970 ?auto_132973 ) ) ( not ( = ?auto_132971 ?auto_132973 ) ) ( not ( = ?auto_132972 ?auto_132973 ) ) ( ON ?auto_132971 ?auto_132972 ) ( ON-TABLE ?auto_132973 ) ( ON ?auto_132970 ?auto_132971 ) ( ON ?auto_132969 ?auto_132970 ) ( CLEAR ?auto_132969 ) ( HOLDING ?auto_132968 ) ( CLEAR ?auto_132967 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132965 ?auto_132966 ?auto_132967 ?auto_132968 )
      ( MAKE-8PILE ?auto_132965 ?auto_132966 ?auto_132967 ?auto_132968 ?auto_132969 ?auto_132970 ?auto_132971 ?auto_132972 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132974 - BLOCK
      ?auto_132975 - BLOCK
      ?auto_132976 - BLOCK
      ?auto_132977 - BLOCK
      ?auto_132978 - BLOCK
      ?auto_132979 - BLOCK
      ?auto_132980 - BLOCK
      ?auto_132981 - BLOCK
    )
    :vars
    (
      ?auto_132982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132974 ) ( ON ?auto_132975 ?auto_132974 ) ( ON ?auto_132976 ?auto_132975 ) ( not ( = ?auto_132974 ?auto_132975 ) ) ( not ( = ?auto_132974 ?auto_132976 ) ) ( not ( = ?auto_132974 ?auto_132977 ) ) ( not ( = ?auto_132974 ?auto_132978 ) ) ( not ( = ?auto_132974 ?auto_132979 ) ) ( not ( = ?auto_132974 ?auto_132980 ) ) ( not ( = ?auto_132974 ?auto_132981 ) ) ( not ( = ?auto_132975 ?auto_132976 ) ) ( not ( = ?auto_132975 ?auto_132977 ) ) ( not ( = ?auto_132975 ?auto_132978 ) ) ( not ( = ?auto_132975 ?auto_132979 ) ) ( not ( = ?auto_132975 ?auto_132980 ) ) ( not ( = ?auto_132975 ?auto_132981 ) ) ( not ( = ?auto_132976 ?auto_132977 ) ) ( not ( = ?auto_132976 ?auto_132978 ) ) ( not ( = ?auto_132976 ?auto_132979 ) ) ( not ( = ?auto_132976 ?auto_132980 ) ) ( not ( = ?auto_132976 ?auto_132981 ) ) ( not ( = ?auto_132977 ?auto_132978 ) ) ( not ( = ?auto_132977 ?auto_132979 ) ) ( not ( = ?auto_132977 ?auto_132980 ) ) ( not ( = ?auto_132977 ?auto_132981 ) ) ( not ( = ?auto_132978 ?auto_132979 ) ) ( not ( = ?auto_132978 ?auto_132980 ) ) ( not ( = ?auto_132978 ?auto_132981 ) ) ( not ( = ?auto_132979 ?auto_132980 ) ) ( not ( = ?auto_132979 ?auto_132981 ) ) ( not ( = ?auto_132980 ?auto_132981 ) ) ( ON ?auto_132981 ?auto_132982 ) ( not ( = ?auto_132974 ?auto_132982 ) ) ( not ( = ?auto_132975 ?auto_132982 ) ) ( not ( = ?auto_132976 ?auto_132982 ) ) ( not ( = ?auto_132977 ?auto_132982 ) ) ( not ( = ?auto_132978 ?auto_132982 ) ) ( not ( = ?auto_132979 ?auto_132982 ) ) ( not ( = ?auto_132980 ?auto_132982 ) ) ( not ( = ?auto_132981 ?auto_132982 ) ) ( ON ?auto_132980 ?auto_132981 ) ( ON-TABLE ?auto_132982 ) ( ON ?auto_132979 ?auto_132980 ) ( ON ?auto_132978 ?auto_132979 ) ( CLEAR ?auto_132976 ) ( ON ?auto_132977 ?auto_132978 ) ( CLEAR ?auto_132977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_132982 ?auto_132981 ?auto_132980 ?auto_132979 ?auto_132978 )
      ( MAKE-8PILE ?auto_132974 ?auto_132975 ?auto_132976 ?auto_132977 ?auto_132978 ?auto_132979 ?auto_132980 ?auto_132981 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132983 - BLOCK
      ?auto_132984 - BLOCK
      ?auto_132985 - BLOCK
      ?auto_132986 - BLOCK
      ?auto_132987 - BLOCK
      ?auto_132988 - BLOCK
      ?auto_132989 - BLOCK
      ?auto_132990 - BLOCK
    )
    :vars
    (
      ?auto_132991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132983 ) ( ON ?auto_132984 ?auto_132983 ) ( not ( = ?auto_132983 ?auto_132984 ) ) ( not ( = ?auto_132983 ?auto_132985 ) ) ( not ( = ?auto_132983 ?auto_132986 ) ) ( not ( = ?auto_132983 ?auto_132987 ) ) ( not ( = ?auto_132983 ?auto_132988 ) ) ( not ( = ?auto_132983 ?auto_132989 ) ) ( not ( = ?auto_132983 ?auto_132990 ) ) ( not ( = ?auto_132984 ?auto_132985 ) ) ( not ( = ?auto_132984 ?auto_132986 ) ) ( not ( = ?auto_132984 ?auto_132987 ) ) ( not ( = ?auto_132984 ?auto_132988 ) ) ( not ( = ?auto_132984 ?auto_132989 ) ) ( not ( = ?auto_132984 ?auto_132990 ) ) ( not ( = ?auto_132985 ?auto_132986 ) ) ( not ( = ?auto_132985 ?auto_132987 ) ) ( not ( = ?auto_132985 ?auto_132988 ) ) ( not ( = ?auto_132985 ?auto_132989 ) ) ( not ( = ?auto_132985 ?auto_132990 ) ) ( not ( = ?auto_132986 ?auto_132987 ) ) ( not ( = ?auto_132986 ?auto_132988 ) ) ( not ( = ?auto_132986 ?auto_132989 ) ) ( not ( = ?auto_132986 ?auto_132990 ) ) ( not ( = ?auto_132987 ?auto_132988 ) ) ( not ( = ?auto_132987 ?auto_132989 ) ) ( not ( = ?auto_132987 ?auto_132990 ) ) ( not ( = ?auto_132988 ?auto_132989 ) ) ( not ( = ?auto_132988 ?auto_132990 ) ) ( not ( = ?auto_132989 ?auto_132990 ) ) ( ON ?auto_132990 ?auto_132991 ) ( not ( = ?auto_132983 ?auto_132991 ) ) ( not ( = ?auto_132984 ?auto_132991 ) ) ( not ( = ?auto_132985 ?auto_132991 ) ) ( not ( = ?auto_132986 ?auto_132991 ) ) ( not ( = ?auto_132987 ?auto_132991 ) ) ( not ( = ?auto_132988 ?auto_132991 ) ) ( not ( = ?auto_132989 ?auto_132991 ) ) ( not ( = ?auto_132990 ?auto_132991 ) ) ( ON ?auto_132989 ?auto_132990 ) ( ON-TABLE ?auto_132991 ) ( ON ?auto_132988 ?auto_132989 ) ( ON ?auto_132987 ?auto_132988 ) ( ON ?auto_132986 ?auto_132987 ) ( CLEAR ?auto_132986 ) ( HOLDING ?auto_132985 ) ( CLEAR ?auto_132984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132983 ?auto_132984 ?auto_132985 )
      ( MAKE-8PILE ?auto_132983 ?auto_132984 ?auto_132985 ?auto_132986 ?auto_132987 ?auto_132988 ?auto_132989 ?auto_132990 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132992 - BLOCK
      ?auto_132993 - BLOCK
      ?auto_132994 - BLOCK
      ?auto_132995 - BLOCK
      ?auto_132996 - BLOCK
      ?auto_132997 - BLOCK
      ?auto_132998 - BLOCK
      ?auto_132999 - BLOCK
    )
    :vars
    (
      ?auto_133000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132992 ) ( ON ?auto_132993 ?auto_132992 ) ( not ( = ?auto_132992 ?auto_132993 ) ) ( not ( = ?auto_132992 ?auto_132994 ) ) ( not ( = ?auto_132992 ?auto_132995 ) ) ( not ( = ?auto_132992 ?auto_132996 ) ) ( not ( = ?auto_132992 ?auto_132997 ) ) ( not ( = ?auto_132992 ?auto_132998 ) ) ( not ( = ?auto_132992 ?auto_132999 ) ) ( not ( = ?auto_132993 ?auto_132994 ) ) ( not ( = ?auto_132993 ?auto_132995 ) ) ( not ( = ?auto_132993 ?auto_132996 ) ) ( not ( = ?auto_132993 ?auto_132997 ) ) ( not ( = ?auto_132993 ?auto_132998 ) ) ( not ( = ?auto_132993 ?auto_132999 ) ) ( not ( = ?auto_132994 ?auto_132995 ) ) ( not ( = ?auto_132994 ?auto_132996 ) ) ( not ( = ?auto_132994 ?auto_132997 ) ) ( not ( = ?auto_132994 ?auto_132998 ) ) ( not ( = ?auto_132994 ?auto_132999 ) ) ( not ( = ?auto_132995 ?auto_132996 ) ) ( not ( = ?auto_132995 ?auto_132997 ) ) ( not ( = ?auto_132995 ?auto_132998 ) ) ( not ( = ?auto_132995 ?auto_132999 ) ) ( not ( = ?auto_132996 ?auto_132997 ) ) ( not ( = ?auto_132996 ?auto_132998 ) ) ( not ( = ?auto_132996 ?auto_132999 ) ) ( not ( = ?auto_132997 ?auto_132998 ) ) ( not ( = ?auto_132997 ?auto_132999 ) ) ( not ( = ?auto_132998 ?auto_132999 ) ) ( ON ?auto_132999 ?auto_133000 ) ( not ( = ?auto_132992 ?auto_133000 ) ) ( not ( = ?auto_132993 ?auto_133000 ) ) ( not ( = ?auto_132994 ?auto_133000 ) ) ( not ( = ?auto_132995 ?auto_133000 ) ) ( not ( = ?auto_132996 ?auto_133000 ) ) ( not ( = ?auto_132997 ?auto_133000 ) ) ( not ( = ?auto_132998 ?auto_133000 ) ) ( not ( = ?auto_132999 ?auto_133000 ) ) ( ON ?auto_132998 ?auto_132999 ) ( ON-TABLE ?auto_133000 ) ( ON ?auto_132997 ?auto_132998 ) ( ON ?auto_132996 ?auto_132997 ) ( ON ?auto_132995 ?auto_132996 ) ( CLEAR ?auto_132993 ) ( ON ?auto_132994 ?auto_132995 ) ( CLEAR ?auto_132994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133000 ?auto_132999 ?auto_132998 ?auto_132997 ?auto_132996 ?auto_132995 )
      ( MAKE-8PILE ?auto_132992 ?auto_132993 ?auto_132994 ?auto_132995 ?auto_132996 ?auto_132997 ?auto_132998 ?auto_132999 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133001 - BLOCK
      ?auto_133002 - BLOCK
      ?auto_133003 - BLOCK
      ?auto_133004 - BLOCK
      ?auto_133005 - BLOCK
      ?auto_133006 - BLOCK
      ?auto_133007 - BLOCK
      ?auto_133008 - BLOCK
    )
    :vars
    (
      ?auto_133009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133001 ) ( not ( = ?auto_133001 ?auto_133002 ) ) ( not ( = ?auto_133001 ?auto_133003 ) ) ( not ( = ?auto_133001 ?auto_133004 ) ) ( not ( = ?auto_133001 ?auto_133005 ) ) ( not ( = ?auto_133001 ?auto_133006 ) ) ( not ( = ?auto_133001 ?auto_133007 ) ) ( not ( = ?auto_133001 ?auto_133008 ) ) ( not ( = ?auto_133002 ?auto_133003 ) ) ( not ( = ?auto_133002 ?auto_133004 ) ) ( not ( = ?auto_133002 ?auto_133005 ) ) ( not ( = ?auto_133002 ?auto_133006 ) ) ( not ( = ?auto_133002 ?auto_133007 ) ) ( not ( = ?auto_133002 ?auto_133008 ) ) ( not ( = ?auto_133003 ?auto_133004 ) ) ( not ( = ?auto_133003 ?auto_133005 ) ) ( not ( = ?auto_133003 ?auto_133006 ) ) ( not ( = ?auto_133003 ?auto_133007 ) ) ( not ( = ?auto_133003 ?auto_133008 ) ) ( not ( = ?auto_133004 ?auto_133005 ) ) ( not ( = ?auto_133004 ?auto_133006 ) ) ( not ( = ?auto_133004 ?auto_133007 ) ) ( not ( = ?auto_133004 ?auto_133008 ) ) ( not ( = ?auto_133005 ?auto_133006 ) ) ( not ( = ?auto_133005 ?auto_133007 ) ) ( not ( = ?auto_133005 ?auto_133008 ) ) ( not ( = ?auto_133006 ?auto_133007 ) ) ( not ( = ?auto_133006 ?auto_133008 ) ) ( not ( = ?auto_133007 ?auto_133008 ) ) ( ON ?auto_133008 ?auto_133009 ) ( not ( = ?auto_133001 ?auto_133009 ) ) ( not ( = ?auto_133002 ?auto_133009 ) ) ( not ( = ?auto_133003 ?auto_133009 ) ) ( not ( = ?auto_133004 ?auto_133009 ) ) ( not ( = ?auto_133005 ?auto_133009 ) ) ( not ( = ?auto_133006 ?auto_133009 ) ) ( not ( = ?auto_133007 ?auto_133009 ) ) ( not ( = ?auto_133008 ?auto_133009 ) ) ( ON ?auto_133007 ?auto_133008 ) ( ON-TABLE ?auto_133009 ) ( ON ?auto_133006 ?auto_133007 ) ( ON ?auto_133005 ?auto_133006 ) ( ON ?auto_133004 ?auto_133005 ) ( ON ?auto_133003 ?auto_133004 ) ( CLEAR ?auto_133003 ) ( HOLDING ?auto_133002 ) ( CLEAR ?auto_133001 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133001 ?auto_133002 )
      ( MAKE-8PILE ?auto_133001 ?auto_133002 ?auto_133003 ?auto_133004 ?auto_133005 ?auto_133006 ?auto_133007 ?auto_133008 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133010 - BLOCK
      ?auto_133011 - BLOCK
      ?auto_133012 - BLOCK
      ?auto_133013 - BLOCK
      ?auto_133014 - BLOCK
      ?auto_133015 - BLOCK
      ?auto_133016 - BLOCK
      ?auto_133017 - BLOCK
    )
    :vars
    (
      ?auto_133018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133010 ) ( not ( = ?auto_133010 ?auto_133011 ) ) ( not ( = ?auto_133010 ?auto_133012 ) ) ( not ( = ?auto_133010 ?auto_133013 ) ) ( not ( = ?auto_133010 ?auto_133014 ) ) ( not ( = ?auto_133010 ?auto_133015 ) ) ( not ( = ?auto_133010 ?auto_133016 ) ) ( not ( = ?auto_133010 ?auto_133017 ) ) ( not ( = ?auto_133011 ?auto_133012 ) ) ( not ( = ?auto_133011 ?auto_133013 ) ) ( not ( = ?auto_133011 ?auto_133014 ) ) ( not ( = ?auto_133011 ?auto_133015 ) ) ( not ( = ?auto_133011 ?auto_133016 ) ) ( not ( = ?auto_133011 ?auto_133017 ) ) ( not ( = ?auto_133012 ?auto_133013 ) ) ( not ( = ?auto_133012 ?auto_133014 ) ) ( not ( = ?auto_133012 ?auto_133015 ) ) ( not ( = ?auto_133012 ?auto_133016 ) ) ( not ( = ?auto_133012 ?auto_133017 ) ) ( not ( = ?auto_133013 ?auto_133014 ) ) ( not ( = ?auto_133013 ?auto_133015 ) ) ( not ( = ?auto_133013 ?auto_133016 ) ) ( not ( = ?auto_133013 ?auto_133017 ) ) ( not ( = ?auto_133014 ?auto_133015 ) ) ( not ( = ?auto_133014 ?auto_133016 ) ) ( not ( = ?auto_133014 ?auto_133017 ) ) ( not ( = ?auto_133015 ?auto_133016 ) ) ( not ( = ?auto_133015 ?auto_133017 ) ) ( not ( = ?auto_133016 ?auto_133017 ) ) ( ON ?auto_133017 ?auto_133018 ) ( not ( = ?auto_133010 ?auto_133018 ) ) ( not ( = ?auto_133011 ?auto_133018 ) ) ( not ( = ?auto_133012 ?auto_133018 ) ) ( not ( = ?auto_133013 ?auto_133018 ) ) ( not ( = ?auto_133014 ?auto_133018 ) ) ( not ( = ?auto_133015 ?auto_133018 ) ) ( not ( = ?auto_133016 ?auto_133018 ) ) ( not ( = ?auto_133017 ?auto_133018 ) ) ( ON ?auto_133016 ?auto_133017 ) ( ON-TABLE ?auto_133018 ) ( ON ?auto_133015 ?auto_133016 ) ( ON ?auto_133014 ?auto_133015 ) ( ON ?auto_133013 ?auto_133014 ) ( ON ?auto_133012 ?auto_133013 ) ( CLEAR ?auto_133010 ) ( ON ?auto_133011 ?auto_133012 ) ( CLEAR ?auto_133011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133018 ?auto_133017 ?auto_133016 ?auto_133015 ?auto_133014 ?auto_133013 ?auto_133012 )
      ( MAKE-8PILE ?auto_133010 ?auto_133011 ?auto_133012 ?auto_133013 ?auto_133014 ?auto_133015 ?auto_133016 ?auto_133017 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133019 - BLOCK
      ?auto_133020 - BLOCK
      ?auto_133021 - BLOCK
      ?auto_133022 - BLOCK
      ?auto_133023 - BLOCK
      ?auto_133024 - BLOCK
      ?auto_133025 - BLOCK
      ?auto_133026 - BLOCK
    )
    :vars
    (
      ?auto_133027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133019 ?auto_133020 ) ) ( not ( = ?auto_133019 ?auto_133021 ) ) ( not ( = ?auto_133019 ?auto_133022 ) ) ( not ( = ?auto_133019 ?auto_133023 ) ) ( not ( = ?auto_133019 ?auto_133024 ) ) ( not ( = ?auto_133019 ?auto_133025 ) ) ( not ( = ?auto_133019 ?auto_133026 ) ) ( not ( = ?auto_133020 ?auto_133021 ) ) ( not ( = ?auto_133020 ?auto_133022 ) ) ( not ( = ?auto_133020 ?auto_133023 ) ) ( not ( = ?auto_133020 ?auto_133024 ) ) ( not ( = ?auto_133020 ?auto_133025 ) ) ( not ( = ?auto_133020 ?auto_133026 ) ) ( not ( = ?auto_133021 ?auto_133022 ) ) ( not ( = ?auto_133021 ?auto_133023 ) ) ( not ( = ?auto_133021 ?auto_133024 ) ) ( not ( = ?auto_133021 ?auto_133025 ) ) ( not ( = ?auto_133021 ?auto_133026 ) ) ( not ( = ?auto_133022 ?auto_133023 ) ) ( not ( = ?auto_133022 ?auto_133024 ) ) ( not ( = ?auto_133022 ?auto_133025 ) ) ( not ( = ?auto_133022 ?auto_133026 ) ) ( not ( = ?auto_133023 ?auto_133024 ) ) ( not ( = ?auto_133023 ?auto_133025 ) ) ( not ( = ?auto_133023 ?auto_133026 ) ) ( not ( = ?auto_133024 ?auto_133025 ) ) ( not ( = ?auto_133024 ?auto_133026 ) ) ( not ( = ?auto_133025 ?auto_133026 ) ) ( ON ?auto_133026 ?auto_133027 ) ( not ( = ?auto_133019 ?auto_133027 ) ) ( not ( = ?auto_133020 ?auto_133027 ) ) ( not ( = ?auto_133021 ?auto_133027 ) ) ( not ( = ?auto_133022 ?auto_133027 ) ) ( not ( = ?auto_133023 ?auto_133027 ) ) ( not ( = ?auto_133024 ?auto_133027 ) ) ( not ( = ?auto_133025 ?auto_133027 ) ) ( not ( = ?auto_133026 ?auto_133027 ) ) ( ON ?auto_133025 ?auto_133026 ) ( ON-TABLE ?auto_133027 ) ( ON ?auto_133024 ?auto_133025 ) ( ON ?auto_133023 ?auto_133024 ) ( ON ?auto_133022 ?auto_133023 ) ( ON ?auto_133021 ?auto_133022 ) ( ON ?auto_133020 ?auto_133021 ) ( CLEAR ?auto_133020 ) ( HOLDING ?auto_133019 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133019 )
      ( MAKE-8PILE ?auto_133019 ?auto_133020 ?auto_133021 ?auto_133022 ?auto_133023 ?auto_133024 ?auto_133025 ?auto_133026 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133028 - BLOCK
      ?auto_133029 - BLOCK
      ?auto_133030 - BLOCK
      ?auto_133031 - BLOCK
      ?auto_133032 - BLOCK
      ?auto_133033 - BLOCK
      ?auto_133034 - BLOCK
      ?auto_133035 - BLOCK
    )
    :vars
    (
      ?auto_133036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133028 ?auto_133029 ) ) ( not ( = ?auto_133028 ?auto_133030 ) ) ( not ( = ?auto_133028 ?auto_133031 ) ) ( not ( = ?auto_133028 ?auto_133032 ) ) ( not ( = ?auto_133028 ?auto_133033 ) ) ( not ( = ?auto_133028 ?auto_133034 ) ) ( not ( = ?auto_133028 ?auto_133035 ) ) ( not ( = ?auto_133029 ?auto_133030 ) ) ( not ( = ?auto_133029 ?auto_133031 ) ) ( not ( = ?auto_133029 ?auto_133032 ) ) ( not ( = ?auto_133029 ?auto_133033 ) ) ( not ( = ?auto_133029 ?auto_133034 ) ) ( not ( = ?auto_133029 ?auto_133035 ) ) ( not ( = ?auto_133030 ?auto_133031 ) ) ( not ( = ?auto_133030 ?auto_133032 ) ) ( not ( = ?auto_133030 ?auto_133033 ) ) ( not ( = ?auto_133030 ?auto_133034 ) ) ( not ( = ?auto_133030 ?auto_133035 ) ) ( not ( = ?auto_133031 ?auto_133032 ) ) ( not ( = ?auto_133031 ?auto_133033 ) ) ( not ( = ?auto_133031 ?auto_133034 ) ) ( not ( = ?auto_133031 ?auto_133035 ) ) ( not ( = ?auto_133032 ?auto_133033 ) ) ( not ( = ?auto_133032 ?auto_133034 ) ) ( not ( = ?auto_133032 ?auto_133035 ) ) ( not ( = ?auto_133033 ?auto_133034 ) ) ( not ( = ?auto_133033 ?auto_133035 ) ) ( not ( = ?auto_133034 ?auto_133035 ) ) ( ON ?auto_133035 ?auto_133036 ) ( not ( = ?auto_133028 ?auto_133036 ) ) ( not ( = ?auto_133029 ?auto_133036 ) ) ( not ( = ?auto_133030 ?auto_133036 ) ) ( not ( = ?auto_133031 ?auto_133036 ) ) ( not ( = ?auto_133032 ?auto_133036 ) ) ( not ( = ?auto_133033 ?auto_133036 ) ) ( not ( = ?auto_133034 ?auto_133036 ) ) ( not ( = ?auto_133035 ?auto_133036 ) ) ( ON ?auto_133034 ?auto_133035 ) ( ON-TABLE ?auto_133036 ) ( ON ?auto_133033 ?auto_133034 ) ( ON ?auto_133032 ?auto_133033 ) ( ON ?auto_133031 ?auto_133032 ) ( ON ?auto_133030 ?auto_133031 ) ( ON ?auto_133029 ?auto_133030 ) ( ON ?auto_133028 ?auto_133029 ) ( CLEAR ?auto_133028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133036 ?auto_133035 ?auto_133034 ?auto_133033 ?auto_133032 ?auto_133031 ?auto_133030 ?auto_133029 )
      ( MAKE-8PILE ?auto_133028 ?auto_133029 ?auto_133030 ?auto_133031 ?auto_133032 ?auto_133033 ?auto_133034 ?auto_133035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133173 - BLOCK
    )
    :vars
    (
      ?auto_133174 - BLOCK
      ?auto_133175 - BLOCK
      ?auto_133176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133173 ?auto_133174 ) ( CLEAR ?auto_133173 ) ( not ( = ?auto_133173 ?auto_133174 ) ) ( HOLDING ?auto_133175 ) ( CLEAR ?auto_133176 ) ( not ( = ?auto_133173 ?auto_133175 ) ) ( not ( = ?auto_133173 ?auto_133176 ) ) ( not ( = ?auto_133174 ?auto_133175 ) ) ( not ( = ?auto_133174 ?auto_133176 ) ) ( not ( = ?auto_133175 ?auto_133176 ) ) )
    :subtasks
    ( ( !STACK ?auto_133175 ?auto_133176 )
      ( MAKE-1PILE ?auto_133173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133177 - BLOCK
    )
    :vars
    (
      ?auto_133180 - BLOCK
      ?auto_133178 - BLOCK
      ?auto_133179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133177 ?auto_133180 ) ( not ( = ?auto_133177 ?auto_133180 ) ) ( CLEAR ?auto_133178 ) ( not ( = ?auto_133177 ?auto_133179 ) ) ( not ( = ?auto_133177 ?auto_133178 ) ) ( not ( = ?auto_133180 ?auto_133179 ) ) ( not ( = ?auto_133180 ?auto_133178 ) ) ( not ( = ?auto_133179 ?auto_133178 ) ) ( ON ?auto_133179 ?auto_133177 ) ( CLEAR ?auto_133179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133180 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133180 ?auto_133177 )
      ( MAKE-1PILE ?auto_133177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133181 - BLOCK
    )
    :vars
    (
      ?auto_133183 - BLOCK
      ?auto_133182 - BLOCK
      ?auto_133184 - BLOCK
      ?auto_133187 - BLOCK
      ?auto_133186 - BLOCK
      ?auto_133185 - BLOCK
      ?auto_133188 - BLOCK
      ?auto_133189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133181 ?auto_133183 ) ( not ( = ?auto_133181 ?auto_133183 ) ) ( not ( = ?auto_133181 ?auto_133182 ) ) ( not ( = ?auto_133181 ?auto_133184 ) ) ( not ( = ?auto_133183 ?auto_133182 ) ) ( not ( = ?auto_133183 ?auto_133184 ) ) ( not ( = ?auto_133182 ?auto_133184 ) ) ( ON ?auto_133182 ?auto_133181 ) ( CLEAR ?auto_133182 ) ( ON-TABLE ?auto_133183 ) ( HOLDING ?auto_133184 ) ( CLEAR ?auto_133187 ) ( ON-TABLE ?auto_133186 ) ( ON ?auto_133185 ?auto_133186 ) ( ON ?auto_133188 ?auto_133185 ) ( ON ?auto_133189 ?auto_133188 ) ( ON ?auto_133187 ?auto_133189 ) ( not ( = ?auto_133186 ?auto_133185 ) ) ( not ( = ?auto_133186 ?auto_133188 ) ) ( not ( = ?auto_133186 ?auto_133189 ) ) ( not ( = ?auto_133186 ?auto_133187 ) ) ( not ( = ?auto_133186 ?auto_133184 ) ) ( not ( = ?auto_133185 ?auto_133188 ) ) ( not ( = ?auto_133185 ?auto_133189 ) ) ( not ( = ?auto_133185 ?auto_133187 ) ) ( not ( = ?auto_133185 ?auto_133184 ) ) ( not ( = ?auto_133188 ?auto_133189 ) ) ( not ( = ?auto_133188 ?auto_133187 ) ) ( not ( = ?auto_133188 ?auto_133184 ) ) ( not ( = ?auto_133189 ?auto_133187 ) ) ( not ( = ?auto_133189 ?auto_133184 ) ) ( not ( = ?auto_133187 ?auto_133184 ) ) ( not ( = ?auto_133181 ?auto_133187 ) ) ( not ( = ?auto_133181 ?auto_133186 ) ) ( not ( = ?auto_133181 ?auto_133185 ) ) ( not ( = ?auto_133181 ?auto_133188 ) ) ( not ( = ?auto_133181 ?auto_133189 ) ) ( not ( = ?auto_133183 ?auto_133187 ) ) ( not ( = ?auto_133183 ?auto_133186 ) ) ( not ( = ?auto_133183 ?auto_133185 ) ) ( not ( = ?auto_133183 ?auto_133188 ) ) ( not ( = ?auto_133183 ?auto_133189 ) ) ( not ( = ?auto_133182 ?auto_133187 ) ) ( not ( = ?auto_133182 ?auto_133186 ) ) ( not ( = ?auto_133182 ?auto_133185 ) ) ( not ( = ?auto_133182 ?auto_133188 ) ) ( not ( = ?auto_133182 ?auto_133189 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133186 ?auto_133185 ?auto_133188 ?auto_133189 ?auto_133187 ?auto_133184 )
      ( MAKE-1PILE ?auto_133181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133190 - BLOCK
    )
    :vars
    (
      ?auto_133198 - BLOCK
      ?auto_133191 - BLOCK
      ?auto_133193 - BLOCK
      ?auto_133196 - BLOCK
      ?auto_133197 - BLOCK
      ?auto_133194 - BLOCK
      ?auto_133195 - BLOCK
      ?auto_133192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133190 ?auto_133198 ) ( not ( = ?auto_133190 ?auto_133198 ) ) ( not ( = ?auto_133190 ?auto_133191 ) ) ( not ( = ?auto_133190 ?auto_133193 ) ) ( not ( = ?auto_133198 ?auto_133191 ) ) ( not ( = ?auto_133198 ?auto_133193 ) ) ( not ( = ?auto_133191 ?auto_133193 ) ) ( ON ?auto_133191 ?auto_133190 ) ( ON-TABLE ?auto_133198 ) ( CLEAR ?auto_133196 ) ( ON-TABLE ?auto_133197 ) ( ON ?auto_133194 ?auto_133197 ) ( ON ?auto_133195 ?auto_133194 ) ( ON ?auto_133192 ?auto_133195 ) ( ON ?auto_133196 ?auto_133192 ) ( not ( = ?auto_133197 ?auto_133194 ) ) ( not ( = ?auto_133197 ?auto_133195 ) ) ( not ( = ?auto_133197 ?auto_133192 ) ) ( not ( = ?auto_133197 ?auto_133196 ) ) ( not ( = ?auto_133197 ?auto_133193 ) ) ( not ( = ?auto_133194 ?auto_133195 ) ) ( not ( = ?auto_133194 ?auto_133192 ) ) ( not ( = ?auto_133194 ?auto_133196 ) ) ( not ( = ?auto_133194 ?auto_133193 ) ) ( not ( = ?auto_133195 ?auto_133192 ) ) ( not ( = ?auto_133195 ?auto_133196 ) ) ( not ( = ?auto_133195 ?auto_133193 ) ) ( not ( = ?auto_133192 ?auto_133196 ) ) ( not ( = ?auto_133192 ?auto_133193 ) ) ( not ( = ?auto_133196 ?auto_133193 ) ) ( not ( = ?auto_133190 ?auto_133196 ) ) ( not ( = ?auto_133190 ?auto_133197 ) ) ( not ( = ?auto_133190 ?auto_133194 ) ) ( not ( = ?auto_133190 ?auto_133195 ) ) ( not ( = ?auto_133190 ?auto_133192 ) ) ( not ( = ?auto_133198 ?auto_133196 ) ) ( not ( = ?auto_133198 ?auto_133197 ) ) ( not ( = ?auto_133198 ?auto_133194 ) ) ( not ( = ?auto_133198 ?auto_133195 ) ) ( not ( = ?auto_133198 ?auto_133192 ) ) ( not ( = ?auto_133191 ?auto_133196 ) ) ( not ( = ?auto_133191 ?auto_133197 ) ) ( not ( = ?auto_133191 ?auto_133194 ) ) ( not ( = ?auto_133191 ?auto_133195 ) ) ( not ( = ?auto_133191 ?auto_133192 ) ) ( ON ?auto_133193 ?auto_133191 ) ( CLEAR ?auto_133193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133198 ?auto_133190 ?auto_133191 )
      ( MAKE-1PILE ?auto_133190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133199 - BLOCK
    )
    :vars
    (
      ?auto_133206 - BLOCK
      ?auto_133204 - BLOCK
      ?auto_133201 - BLOCK
      ?auto_133202 - BLOCK
      ?auto_133200 - BLOCK
      ?auto_133205 - BLOCK
      ?auto_133203 - BLOCK
      ?auto_133207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133199 ?auto_133206 ) ( not ( = ?auto_133199 ?auto_133206 ) ) ( not ( = ?auto_133199 ?auto_133204 ) ) ( not ( = ?auto_133199 ?auto_133201 ) ) ( not ( = ?auto_133206 ?auto_133204 ) ) ( not ( = ?auto_133206 ?auto_133201 ) ) ( not ( = ?auto_133204 ?auto_133201 ) ) ( ON ?auto_133204 ?auto_133199 ) ( ON-TABLE ?auto_133206 ) ( ON-TABLE ?auto_133202 ) ( ON ?auto_133200 ?auto_133202 ) ( ON ?auto_133205 ?auto_133200 ) ( ON ?auto_133203 ?auto_133205 ) ( not ( = ?auto_133202 ?auto_133200 ) ) ( not ( = ?auto_133202 ?auto_133205 ) ) ( not ( = ?auto_133202 ?auto_133203 ) ) ( not ( = ?auto_133202 ?auto_133207 ) ) ( not ( = ?auto_133202 ?auto_133201 ) ) ( not ( = ?auto_133200 ?auto_133205 ) ) ( not ( = ?auto_133200 ?auto_133203 ) ) ( not ( = ?auto_133200 ?auto_133207 ) ) ( not ( = ?auto_133200 ?auto_133201 ) ) ( not ( = ?auto_133205 ?auto_133203 ) ) ( not ( = ?auto_133205 ?auto_133207 ) ) ( not ( = ?auto_133205 ?auto_133201 ) ) ( not ( = ?auto_133203 ?auto_133207 ) ) ( not ( = ?auto_133203 ?auto_133201 ) ) ( not ( = ?auto_133207 ?auto_133201 ) ) ( not ( = ?auto_133199 ?auto_133207 ) ) ( not ( = ?auto_133199 ?auto_133202 ) ) ( not ( = ?auto_133199 ?auto_133200 ) ) ( not ( = ?auto_133199 ?auto_133205 ) ) ( not ( = ?auto_133199 ?auto_133203 ) ) ( not ( = ?auto_133206 ?auto_133207 ) ) ( not ( = ?auto_133206 ?auto_133202 ) ) ( not ( = ?auto_133206 ?auto_133200 ) ) ( not ( = ?auto_133206 ?auto_133205 ) ) ( not ( = ?auto_133206 ?auto_133203 ) ) ( not ( = ?auto_133204 ?auto_133207 ) ) ( not ( = ?auto_133204 ?auto_133202 ) ) ( not ( = ?auto_133204 ?auto_133200 ) ) ( not ( = ?auto_133204 ?auto_133205 ) ) ( not ( = ?auto_133204 ?auto_133203 ) ) ( ON ?auto_133201 ?auto_133204 ) ( CLEAR ?auto_133201 ) ( HOLDING ?auto_133207 ) ( CLEAR ?auto_133203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133202 ?auto_133200 ?auto_133205 ?auto_133203 ?auto_133207 )
      ( MAKE-1PILE ?auto_133199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133208 - BLOCK
    )
    :vars
    (
      ?auto_133214 - BLOCK
      ?auto_133213 - BLOCK
      ?auto_133216 - BLOCK
      ?auto_133212 - BLOCK
      ?auto_133209 - BLOCK
      ?auto_133211 - BLOCK
      ?auto_133215 - BLOCK
      ?auto_133210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133208 ?auto_133214 ) ( not ( = ?auto_133208 ?auto_133214 ) ) ( not ( = ?auto_133208 ?auto_133213 ) ) ( not ( = ?auto_133208 ?auto_133216 ) ) ( not ( = ?auto_133214 ?auto_133213 ) ) ( not ( = ?auto_133214 ?auto_133216 ) ) ( not ( = ?auto_133213 ?auto_133216 ) ) ( ON ?auto_133213 ?auto_133208 ) ( ON-TABLE ?auto_133214 ) ( ON-TABLE ?auto_133212 ) ( ON ?auto_133209 ?auto_133212 ) ( ON ?auto_133211 ?auto_133209 ) ( ON ?auto_133215 ?auto_133211 ) ( not ( = ?auto_133212 ?auto_133209 ) ) ( not ( = ?auto_133212 ?auto_133211 ) ) ( not ( = ?auto_133212 ?auto_133215 ) ) ( not ( = ?auto_133212 ?auto_133210 ) ) ( not ( = ?auto_133212 ?auto_133216 ) ) ( not ( = ?auto_133209 ?auto_133211 ) ) ( not ( = ?auto_133209 ?auto_133215 ) ) ( not ( = ?auto_133209 ?auto_133210 ) ) ( not ( = ?auto_133209 ?auto_133216 ) ) ( not ( = ?auto_133211 ?auto_133215 ) ) ( not ( = ?auto_133211 ?auto_133210 ) ) ( not ( = ?auto_133211 ?auto_133216 ) ) ( not ( = ?auto_133215 ?auto_133210 ) ) ( not ( = ?auto_133215 ?auto_133216 ) ) ( not ( = ?auto_133210 ?auto_133216 ) ) ( not ( = ?auto_133208 ?auto_133210 ) ) ( not ( = ?auto_133208 ?auto_133212 ) ) ( not ( = ?auto_133208 ?auto_133209 ) ) ( not ( = ?auto_133208 ?auto_133211 ) ) ( not ( = ?auto_133208 ?auto_133215 ) ) ( not ( = ?auto_133214 ?auto_133210 ) ) ( not ( = ?auto_133214 ?auto_133212 ) ) ( not ( = ?auto_133214 ?auto_133209 ) ) ( not ( = ?auto_133214 ?auto_133211 ) ) ( not ( = ?auto_133214 ?auto_133215 ) ) ( not ( = ?auto_133213 ?auto_133210 ) ) ( not ( = ?auto_133213 ?auto_133212 ) ) ( not ( = ?auto_133213 ?auto_133209 ) ) ( not ( = ?auto_133213 ?auto_133211 ) ) ( not ( = ?auto_133213 ?auto_133215 ) ) ( ON ?auto_133216 ?auto_133213 ) ( CLEAR ?auto_133215 ) ( ON ?auto_133210 ?auto_133216 ) ( CLEAR ?auto_133210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133214 ?auto_133208 ?auto_133213 ?auto_133216 )
      ( MAKE-1PILE ?auto_133208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133217 - BLOCK
    )
    :vars
    (
      ?auto_133222 - BLOCK
      ?auto_133218 - BLOCK
      ?auto_133225 - BLOCK
      ?auto_133223 - BLOCK
      ?auto_133220 - BLOCK
      ?auto_133221 - BLOCK
      ?auto_133219 - BLOCK
      ?auto_133224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133217 ?auto_133222 ) ( not ( = ?auto_133217 ?auto_133222 ) ) ( not ( = ?auto_133217 ?auto_133218 ) ) ( not ( = ?auto_133217 ?auto_133225 ) ) ( not ( = ?auto_133222 ?auto_133218 ) ) ( not ( = ?auto_133222 ?auto_133225 ) ) ( not ( = ?auto_133218 ?auto_133225 ) ) ( ON ?auto_133218 ?auto_133217 ) ( ON-TABLE ?auto_133222 ) ( ON-TABLE ?auto_133223 ) ( ON ?auto_133220 ?auto_133223 ) ( ON ?auto_133221 ?auto_133220 ) ( not ( = ?auto_133223 ?auto_133220 ) ) ( not ( = ?auto_133223 ?auto_133221 ) ) ( not ( = ?auto_133223 ?auto_133219 ) ) ( not ( = ?auto_133223 ?auto_133224 ) ) ( not ( = ?auto_133223 ?auto_133225 ) ) ( not ( = ?auto_133220 ?auto_133221 ) ) ( not ( = ?auto_133220 ?auto_133219 ) ) ( not ( = ?auto_133220 ?auto_133224 ) ) ( not ( = ?auto_133220 ?auto_133225 ) ) ( not ( = ?auto_133221 ?auto_133219 ) ) ( not ( = ?auto_133221 ?auto_133224 ) ) ( not ( = ?auto_133221 ?auto_133225 ) ) ( not ( = ?auto_133219 ?auto_133224 ) ) ( not ( = ?auto_133219 ?auto_133225 ) ) ( not ( = ?auto_133224 ?auto_133225 ) ) ( not ( = ?auto_133217 ?auto_133224 ) ) ( not ( = ?auto_133217 ?auto_133223 ) ) ( not ( = ?auto_133217 ?auto_133220 ) ) ( not ( = ?auto_133217 ?auto_133221 ) ) ( not ( = ?auto_133217 ?auto_133219 ) ) ( not ( = ?auto_133222 ?auto_133224 ) ) ( not ( = ?auto_133222 ?auto_133223 ) ) ( not ( = ?auto_133222 ?auto_133220 ) ) ( not ( = ?auto_133222 ?auto_133221 ) ) ( not ( = ?auto_133222 ?auto_133219 ) ) ( not ( = ?auto_133218 ?auto_133224 ) ) ( not ( = ?auto_133218 ?auto_133223 ) ) ( not ( = ?auto_133218 ?auto_133220 ) ) ( not ( = ?auto_133218 ?auto_133221 ) ) ( not ( = ?auto_133218 ?auto_133219 ) ) ( ON ?auto_133225 ?auto_133218 ) ( ON ?auto_133224 ?auto_133225 ) ( CLEAR ?auto_133224 ) ( HOLDING ?auto_133219 ) ( CLEAR ?auto_133221 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133223 ?auto_133220 ?auto_133221 ?auto_133219 )
      ( MAKE-1PILE ?auto_133217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133226 - BLOCK
    )
    :vars
    (
      ?auto_133229 - BLOCK
      ?auto_133228 - BLOCK
      ?auto_133230 - BLOCK
      ?auto_133227 - BLOCK
      ?auto_133234 - BLOCK
      ?auto_133231 - BLOCK
      ?auto_133233 - BLOCK
      ?auto_133232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133226 ?auto_133229 ) ( not ( = ?auto_133226 ?auto_133229 ) ) ( not ( = ?auto_133226 ?auto_133228 ) ) ( not ( = ?auto_133226 ?auto_133230 ) ) ( not ( = ?auto_133229 ?auto_133228 ) ) ( not ( = ?auto_133229 ?auto_133230 ) ) ( not ( = ?auto_133228 ?auto_133230 ) ) ( ON ?auto_133228 ?auto_133226 ) ( ON-TABLE ?auto_133229 ) ( ON-TABLE ?auto_133227 ) ( ON ?auto_133234 ?auto_133227 ) ( ON ?auto_133231 ?auto_133234 ) ( not ( = ?auto_133227 ?auto_133234 ) ) ( not ( = ?auto_133227 ?auto_133231 ) ) ( not ( = ?auto_133227 ?auto_133233 ) ) ( not ( = ?auto_133227 ?auto_133232 ) ) ( not ( = ?auto_133227 ?auto_133230 ) ) ( not ( = ?auto_133234 ?auto_133231 ) ) ( not ( = ?auto_133234 ?auto_133233 ) ) ( not ( = ?auto_133234 ?auto_133232 ) ) ( not ( = ?auto_133234 ?auto_133230 ) ) ( not ( = ?auto_133231 ?auto_133233 ) ) ( not ( = ?auto_133231 ?auto_133232 ) ) ( not ( = ?auto_133231 ?auto_133230 ) ) ( not ( = ?auto_133233 ?auto_133232 ) ) ( not ( = ?auto_133233 ?auto_133230 ) ) ( not ( = ?auto_133232 ?auto_133230 ) ) ( not ( = ?auto_133226 ?auto_133232 ) ) ( not ( = ?auto_133226 ?auto_133227 ) ) ( not ( = ?auto_133226 ?auto_133234 ) ) ( not ( = ?auto_133226 ?auto_133231 ) ) ( not ( = ?auto_133226 ?auto_133233 ) ) ( not ( = ?auto_133229 ?auto_133232 ) ) ( not ( = ?auto_133229 ?auto_133227 ) ) ( not ( = ?auto_133229 ?auto_133234 ) ) ( not ( = ?auto_133229 ?auto_133231 ) ) ( not ( = ?auto_133229 ?auto_133233 ) ) ( not ( = ?auto_133228 ?auto_133232 ) ) ( not ( = ?auto_133228 ?auto_133227 ) ) ( not ( = ?auto_133228 ?auto_133234 ) ) ( not ( = ?auto_133228 ?auto_133231 ) ) ( not ( = ?auto_133228 ?auto_133233 ) ) ( ON ?auto_133230 ?auto_133228 ) ( ON ?auto_133232 ?auto_133230 ) ( CLEAR ?auto_133231 ) ( ON ?auto_133233 ?auto_133232 ) ( CLEAR ?auto_133233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133229 ?auto_133226 ?auto_133228 ?auto_133230 ?auto_133232 )
      ( MAKE-1PILE ?auto_133226 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133235 - BLOCK
    )
    :vars
    (
      ?auto_133241 - BLOCK
      ?auto_133237 - BLOCK
      ?auto_133243 - BLOCK
      ?auto_133238 - BLOCK
      ?auto_133242 - BLOCK
      ?auto_133240 - BLOCK
      ?auto_133236 - BLOCK
      ?auto_133239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133235 ?auto_133241 ) ( not ( = ?auto_133235 ?auto_133241 ) ) ( not ( = ?auto_133235 ?auto_133237 ) ) ( not ( = ?auto_133235 ?auto_133243 ) ) ( not ( = ?auto_133241 ?auto_133237 ) ) ( not ( = ?auto_133241 ?auto_133243 ) ) ( not ( = ?auto_133237 ?auto_133243 ) ) ( ON ?auto_133237 ?auto_133235 ) ( ON-TABLE ?auto_133241 ) ( ON-TABLE ?auto_133238 ) ( ON ?auto_133242 ?auto_133238 ) ( not ( = ?auto_133238 ?auto_133242 ) ) ( not ( = ?auto_133238 ?auto_133240 ) ) ( not ( = ?auto_133238 ?auto_133236 ) ) ( not ( = ?auto_133238 ?auto_133239 ) ) ( not ( = ?auto_133238 ?auto_133243 ) ) ( not ( = ?auto_133242 ?auto_133240 ) ) ( not ( = ?auto_133242 ?auto_133236 ) ) ( not ( = ?auto_133242 ?auto_133239 ) ) ( not ( = ?auto_133242 ?auto_133243 ) ) ( not ( = ?auto_133240 ?auto_133236 ) ) ( not ( = ?auto_133240 ?auto_133239 ) ) ( not ( = ?auto_133240 ?auto_133243 ) ) ( not ( = ?auto_133236 ?auto_133239 ) ) ( not ( = ?auto_133236 ?auto_133243 ) ) ( not ( = ?auto_133239 ?auto_133243 ) ) ( not ( = ?auto_133235 ?auto_133239 ) ) ( not ( = ?auto_133235 ?auto_133238 ) ) ( not ( = ?auto_133235 ?auto_133242 ) ) ( not ( = ?auto_133235 ?auto_133240 ) ) ( not ( = ?auto_133235 ?auto_133236 ) ) ( not ( = ?auto_133241 ?auto_133239 ) ) ( not ( = ?auto_133241 ?auto_133238 ) ) ( not ( = ?auto_133241 ?auto_133242 ) ) ( not ( = ?auto_133241 ?auto_133240 ) ) ( not ( = ?auto_133241 ?auto_133236 ) ) ( not ( = ?auto_133237 ?auto_133239 ) ) ( not ( = ?auto_133237 ?auto_133238 ) ) ( not ( = ?auto_133237 ?auto_133242 ) ) ( not ( = ?auto_133237 ?auto_133240 ) ) ( not ( = ?auto_133237 ?auto_133236 ) ) ( ON ?auto_133243 ?auto_133237 ) ( ON ?auto_133239 ?auto_133243 ) ( ON ?auto_133236 ?auto_133239 ) ( CLEAR ?auto_133236 ) ( HOLDING ?auto_133240 ) ( CLEAR ?auto_133242 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133238 ?auto_133242 ?auto_133240 )
      ( MAKE-1PILE ?auto_133235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133244 - BLOCK
    )
    :vars
    (
      ?auto_133249 - BLOCK
      ?auto_133245 - BLOCK
      ?auto_133252 - BLOCK
      ?auto_133247 - BLOCK
      ?auto_133248 - BLOCK
      ?auto_133251 - BLOCK
      ?auto_133250 - BLOCK
      ?auto_133246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133244 ?auto_133249 ) ( not ( = ?auto_133244 ?auto_133249 ) ) ( not ( = ?auto_133244 ?auto_133245 ) ) ( not ( = ?auto_133244 ?auto_133252 ) ) ( not ( = ?auto_133249 ?auto_133245 ) ) ( not ( = ?auto_133249 ?auto_133252 ) ) ( not ( = ?auto_133245 ?auto_133252 ) ) ( ON ?auto_133245 ?auto_133244 ) ( ON-TABLE ?auto_133249 ) ( ON-TABLE ?auto_133247 ) ( ON ?auto_133248 ?auto_133247 ) ( not ( = ?auto_133247 ?auto_133248 ) ) ( not ( = ?auto_133247 ?auto_133251 ) ) ( not ( = ?auto_133247 ?auto_133250 ) ) ( not ( = ?auto_133247 ?auto_133246 ) ) ( not ( = ?auto_133247 ?auto_133252 ) ) ( not ( = ?auto_133248 ?auto_133251 ) ) ( not ( = ?auto_133248 ?auto_133250 ) ) ( not ( = ?auto_133248 ?auto_133246 ) ) ( not ( = ?auto_133248 ?auto_133252 ) ) ( not ( = ?auto_133251 ?auto_133250 ) ) ( not ( = ?auto_133251 ?auto_133246 ) ) ( not ( = ?auto_133251 ?auto_133252 ) ) ( not ( = ?auto_133250 ?auto_133246 ) ) ( not ( = ?auto_133250 ?auto_133252 ) ) ( not ( = ?auto_133246 ?auto_133252 ) ) ( not ( = ?auto_133244 ?auto_133246 ) ) ( not ( = ?auto_133244 ?auto_133247 ) ) ( not ( = ?auto_133244 ?auto_133248 ) ) ( not ( = ?auto_133244 ?auto_133251 ) ) ( not ( = ?auto_133244 ?auto_133250 ) ) ( not ( = ?auto_133249 ?auto_133246 ) ) ( not ( = ?auto_133249 ?auto_133247 ) ) ( not ( = ?auto_133249 ?auto_133248 ) ) ( not ( = ?auto_133249 ?auto_133251 ) ) ( not ( = ?auto_133249 ?auto_133250 ) ) ( not ( = ?auto_133245 ?auto_133246 ) ) ( not ( = ?auto_133245 ?auto_133247 ) ) ( not ( = ?auto_133245 ?auto_133248 ) ) ( not ( = ?auto_133245 ?auto_133251 ) ) ( not ( = ?auto_133245 ?auto_133250 ) ) ( ON ?auto_133252 ?auto_133245 ) ( ON ?auto_133246 ?auto_133252 ) ( ON ?auto_133250 ?auto_133246 ) ( CLEAR ?auto_133248 ) ( ON ?auto_133251 ?auto_133250 ) ( CLEAR ?auto_133251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133249 ?auto_133244 ?auto_133245 ?auto_133252 ?auto_133246 ?auto_133250 )
      ( MAKE-1PILE ?auto_133244 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133253 - BLOCK
    )
    :vars
    (
      ?auto_133260 - BLOCK
      ?auto_133256 - BLOCK
      ?auto_133259 - BLOCK
      ?auto_133261 - BLOCK
      ?auto_133254 - BLOCK
      ?auto_133258 - BLOCK
      ?auto_133257 - BLOCK
      ?auto_133255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133253 ?auto_133260 ) ( not ( = ?auto_133253 ?auto_133260 ) ) ( not ( = ?auto_133253 ?auto_133256 ) ) ( not ( = ?auto_133253 ?auto_133259 ) ) ( not ( = ?auto_133260 ?auto_133256 ) ) ( not ( = ?auto_133260 ?auto_133259 ) ) ( not ( = ?auto_133256 ?auto_133259 ) ) ( ON ?auto_133256 ?auto_133253 ) ( ON-TABLE ?auto_133260 ) ( ON-TABLE ?auto_133261 ) ( not ( = ?auto_133261 ?auto_133254 ) ) ( not ( = ?auto_133261 ?auto_133258 ) ) ( not ( = ?auto_133261 ?auto_133257 ) ) ( not ( = ?auto_133261 ?auto_133255 ) ) ( not ( = ?auto_133261 ?auto_133259 ) ) ( not ( = ?auto_133254 ?auto_133258 ) ) ( not ( = ?auto_133254 ?auto_133257 ) ) ( not ( = ?auto_133254 ?auto_133255 ) ) ( not ( = ?auto_133254 ?auto_133259 ) ) ( not ( = ?auto_133258 ?auto_133257 ) ) ( not ( = ?auto_133258 ?auto_133255 ) ) ( not ( = ?auto_133258 ?auto_133259 ) ) ( not ( = ?auto_133257 ?auto_133255 ) ) ( not ( = ?auto_133257 ?auto_133259 ) ) ( not ( = ?auto_133255 ?auto_133259 ) ) ( not ( = ?auto_133253 ?auto_133255 ) ) ( not ( = ?auto_133253 ?auto_133261 ) ) ( not ( = ?auto_133253 ?auto_133254 ) ) ( not ( = ?auto_133253 ?auto_133258 ) ) ( not ( = ?auto_133253 ?auto_133257 ) ) ( not ( = ?auto_133260 ?auto_133255 ) ) ( not ( = ?auto_133260 ?auto_133261 ) ) ( not ( = ?auto_133260 ?auto_133254 ) ) ( not ( = ?auto_133260 ?auto_133258 ) ) ( not ( = ?auto_133260 ?auto_133257 ) ) ( not ( = ?auto_133256 ?auto_133255 ) ) ( not ( = ?auto_133256 ?auto_133261 ) ) ( not ( = ?auto_133256 ?auto_133254 ) ) ( not ( = ?auto_133256 ?auto_133258 ) ) ( not ( = ?auto_133256 ?auto_133257 ) ) ( ON ?auto_133259 ?auto_133256 ) ( ON ?auto_133255 ?auto_133259 ) ( ON ?auto_133257 ?auto_133255 ) ( ON ?auto_133258 ?auto_133257 ) ( CLEAR ?auto_133258 ) ( HOLDING ?auto_133254 ) ( CLEAR ?auto_133261 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133261 ?auto_133254 )
      ( MAKE-1PILE ?auto_133253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133262 - BLOCK
    )
    :vars
    (
      ?auto_133263 - BLOCK
      ?auto_133267 - BLOCK
      ?auto_133269 - BLOCK
      ?auto_133270 - BLOCK
      ?auto_133265 - BLOCK
      ?auto_133266 - BLOCK
      ?auto_133264 - BLOCK
      ?auto_133268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133262 ?auto_133263 ) ( not ( = ?auto_133262 ?auto_133263 ) ) ( not ( = ?auto_133262 ?auto_133267 ) ) ( not ( = ?auto_133262 ?auto_133269 ) ) ( not ( = ?auto_133263 ?auto_133267 ) ) ( not ( = ?auto_133263 ?auto_133269 ) ) ( not ( = ?auto_133267 ?auto_133269 ) ) ( ON ?auto_133267 ?auto_133262 ) ( ON-TABLE ?auto_133263 ) ( ON-TABLE ?auto_133270 ) ( not ( = ?auto_133270 ?auto_133265 ) ) ( not ( = ?auto_133270 ?auto_133266 ) ) ( not ( = ?auto_133270 ?auto_133264 ) ) ( not ( = ?auto_133270 ?auto_133268 ) ) ( not ( = ?auto_133270 ?auto_133269 ) ) ( not ( = ?auto_133265 ?auto_133266 ) ) ( not ( = ?auto_133265 ?auto_133264 ) ) ( not ( = ?auto_133265 ?auto_133268 ) ) ( not ( = ?auto_133265 ?auto_133269 ) ) ( not ( = ?auto_133266 ?auto_133264 ) ) ( not ( = ?auto_133266 ?auto_133268 ) ) ( not ( = ?auto_133266 ?auto_133269 ) ) ( not ( = ?auto_133264 ?auto_133268 ) ) ( not ( = ?auto_133264 ?auto_133269 ) ) ( not ( = ?auto_133268 ?auto_133269 ) ) ( not ( = ?auto_133262 ?auto_133268 ) ) ( not ( = ?auto_133262 ?auto_133270 ) ) ( not ( = ?auto_133262 ?auto_133265 ) ) ( not ( = ?auto_133262 ?auto_133266 ) ) ( not ( = ?auto_133262 ?auto_133264 ) ) ( not ( = ?auto_133263 ?auto_133268 ) ) ( not ( = ?auto_133263 ?auto_133270 ) ) ( not ( = ?auto_133263 ?auto_133265 ) ) ( not ( = ?auto_133263 ?auto_133266 ) ) ( not ( = ?auto_133263 ?auto_133264 ) ) ( not ( = ?auto_133267 ?auto_133268 ) ) ( not ( = ?auto_133267 ?auto_133270 ) ) ( not ( = ?auto_133267 ?auto_133265 ) ) ( not ( = ?auto_133267 ?auto_133266 ) ) ( not ( = ?auto_133267 ?auto_133264 ) ) ( ON ?auto_133269 ?auto_133267 ) ( ON ?auto_133268 ?auto_133269 ) ( ON ?auto_133264 ?auto_133268 ) ( ON ?auto_133266 ?auto_133264 ) ( CLEAR ?auto_133270 ) ( ON ?auto_133265 ?auto_133266 ) ( CLEAR ?auto_133265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133263 ?auto_133262 ?auto_133267 ?auto_133269 ?auto_133268 ?auto_133264 ?auto_133266 )
      ( MAKE-1PILE ?auto_133262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133271 - BLOCK
    )
    :vars
    (
      ?auto_133277 - BLOCK
      ?auto_133275 - BLOCK
      ?auto_133272 - BLOCK
      ?auto_133276 - BLOCK
      ?auto_133274 - BLOCK
      ?auto_133279 - BLOCK
      ?auto_133273 - BLOCK
      ?auto_133278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133271 ?auto_133277 ) ( not ( = ?auto_133271 ?auto_133277 ) ) ( not ( = ?auto_133271 ?auto_133275 ) ) ( not ( = ?auto_133271 ?auto_133272 ) ) ( not ( = ?auto_133277 ?auto_133275 ) ) ( not ( = ?auto_133277 ?auto_133272 ) ) ( not ( = ?auto_133275 ?auto_133272 ) ) ( ON ?auto_133275 ?auto_133271 ) ( ON-TABLE ?auto_133277 ) ( not ( = ?auto_133276 ?auto_133274 ) ) ( not ( = ?auto_133276 ?auto_133279 ) ) ( not ( = ?auto_133276 ?auto_133273 ) ) ( not ( = ?auto_133276 ?auto_133278 ) ) ( not ( = ?auto_133276 ?auto_133272 ) ) ( not ( = ?auto_133274 ?auto_133279 ) ) ( not ( = ?auto_133274 ?auto_133273 ) ) ( not ( = ?auto_133274 ?auto_133278 ) ) ( not ( = ?auto_133274 ?auto_133272 ) ) ( not ( = ?auto_133279 ?auto_133273 ) ) ( not ( = ?auto_133279 ?auto_133278 ) ) ( not ( = ?auto_133279 ?auto_133272 ) ) ( not ( = ?auto_133273 ?auto_133278 ) ) ( not ( = ?auto_133273 ?auto_133272 ) ) ( not ( = ?auto_133278 ?auto_133272 ) ) ( not ( = ?auto_133271 ?auto_133278 ) ) ( not ( = ?auto_133271 ?auto_133276 ) ) ( not ( = ?auto_133271 ?auto_133274 ) ) ( not ( = ?auto_133271 ?auto_133279 ) ) ( not ( = ?auto_133271 ?auto_133273 ) ) ( not ( = ?auto_133277 ?auto_133278 ) ) ( not ( = ?auto_133277 ?auto_133276 ) ) ( not ( = ?auto_133277 ?auto_133274 ) ) ( not ( = ?auto_133277 ?auto_133279 ) ) ( not ( = ?auto_133277 ?auto_133273 ) ) ( not ( = ?auto_133275 ?auto_133278 ) ) ( not ( = ?auto_133275 ?auto_133276 ) ) ( not ( = ?auto_133275 ?auto_133274 ) ) ( not ( = ?auto_133275 ?auto_133279 ) ) ( not ( = ?auto_133275 ?auto_133273 ) ) ( ON ?auto_133272 ?auto_133275 ) ( ON ?auto_133278 ?auto_133272 ) ( ON ?auto_133273 ?auto_133278 ) ( ON ?auto_133279 ?auto_133273 ) ( ON ?auto_133274 ?auto_133279 ) ( CLEAR ?auto_133274 ) ( HOLDING ?auto_133276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133276 )
      ( MAKE-1PILE ?auto_133271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133280 - BLOCK
    )
    :vars
    (
      ?auto_133288 - BLOCK
      ?auto_133281 - BLOCK
      ?auto_133284 - BLOCK
      ?auto_133287 - BLOCK
      ?auto_133283 - BLOCK
      ?auto_133282 - BLOCK
      ?auto_133286 - BLOCK
      ?auto_133285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133280 ?auto_133288 ) ( not ( = ?auto_133280 ?auto_133288 ) ) ( not ( = ?auto_133280 ?auto_133281 ) ) ( not ( = ?auto_133280 ?auto_133284 ) ) ( not ( = ?auto_133288 ?auto_133281 ) ) ( not ( = ?auto_133288 ?auto_133284 ) ) ( not ( = ?auto_133281 ?auto_133284 ) ) ( ON ?auto_133281 ?auto_133280 ) ( ON-TABLE ?auto_133288 ) ( not ( = ?auto_133287 ?auto_133283 ) ) ( not ( = ?auto_133287 ?auto_133282 ) ) ( not ( = ?auto_133287 ?auto_133286 ) ) ( not ( = ?auto_133287 ?auto_133285 ) ) ( not ( = ?auto_133287 ?auto_133284 ) ) ( not ( = ?auto_133283 ?auto_133282 ) ) ( not ( = ?auto_133283 ?auto_133286 ) ) ( not ( = ?auto_133283 ?auto_133285 ) ) ( not ( = ?auto_133283 ?auto_133284 ) ) ( not ( = ?auto_133282 ?auto_133286 ) ) ( not ( = ?auto_133282 ?auto_133285 ) ) ( not ( = ?auto_133282 ?auto_133284 ) ) ( not ( = ?auto_133286 ?auto_133285 ) ) ( not ( = ?auto_133286 ?auto_133284 ) ) ( not ( = ?auto_133285 ?auto_133284 ) ) ( not ( = ?auto_133280 ?auto_133285 ) ) ( not ( = ?auto_133280 ?auto_133287 ) ) ( not ( = ?auto_133280 ?auto_133283 ) ) ( not ( = ?auto_133280 ?auto_133282 ) ) ( not ( = ?auto_133280 ?auto_133286 ) ) ( not ( = ?auto_133288 ?auto_133285 ) ) ( not ( = ?auto_133288 ?auto_133287 ) ) ( not ( = ?auto_133288 ?auto_133283 ) ) ( not ( = ?auto_133288 ?auto_133282 ) ) ( not ( = ?auto_133288 ?auto_133286 ) ) ( not ( = ?auto_133281 ?auto_133285 ) ) ( not ( = ?auto_133281 ?auto_133287 ) ) ( not ( = ?auto_133281 ?auto_133283 ) ) ( not ( = ?auto_133281 ?auto_133282 ) ) ( not ( = ?auto_133281 ?auto_133286 ) ) ( ON ?auto_133284 ?auto_133281 ) ( ON ?auto_133285 ?auto_133284 ) ( ON ?auto_133286 ?auto_133285 ) ( ON ?auto_133282 ?auto_133286 ) ( ON ?auto_133283 ?auto_133282 ) ( ON ?auto_133287 ?auto_133283 ) ( CLEAR ?auto_133287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133288 ?auto_133280 ?auto_133281 ?auto_133284 ?auto_133285 ?auto_133286 ?auto_133282 ?auto_133283 )
      ( MAKE-1PILE ?auto_133280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133302 - BLOCK
      ?auto_133303 - BLOCK
      ?auto_133304 - BLOCK
      ?auto_133305 - BLOCK
      ?auto_133306 - BLOCK
      ?auto_133307 - BLOCK
    )
    :vars
    (
      ?auto_133308 - BLOCK
      ?auto_133309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133308 ?auto_133307 ) ( CLEAR ?auto_133308 ) ( ON-TABLE ?auto_133302 ) ( ON ?auto_133303 ?auto_133302 ) ( ON ?auto_133304 ?auto_133303 ) ( ON ?auto_133305 ?auto_133304 ) ( ON ?auto_133306 ?auto_133305 ) ( ON ?auto_133307 ?auto_133306 ) ( not ( = ?auto_133302 ?auto_133303 ) ) ( not ( = ?auto_133302 ?auto_133304 ) ) ( not ( = ?auto_133302 ?auto_133305 ) ) ( not ( = ?auto_133302 ?auto_133306 ) ) ( not ( = ?auto_133302 ?auto_133307 ) ) ( not ( = ?auto_133302 ?auto_133308 ) ) ( not ( = ?auto_133303 ?auto_133304 ) ) ( not ( = ?auto_133303 ?auto_133305 ) ) ( not ( = ?auto_133303 ?auto_133306 ) ) ( not ( = ?auto_133303 ?auto_133307 ) ) ( not ( = ?auto_133303 ?auto_133308 ) ) ( not ( = ?auto_133304 ?auto_133305 ) ) ( not ( = ?auto_133304 ?auto_133306 ) ) ( not ( = ?auto_133304 ?auto_133307 ) ) ( not ( = ?auto_133304 ?auto_133308 ) ) ( not ( = ?auto_133305 ?auto_133306 ) ) ( not ( = ?auto_133305 ?auto_133307 ) ) ( not ( = ?auto_133305 ?auto_133308 ) ) ( not ( = ?auto_133306 ?auto_133307 ) ) ( not ( = ?auto_133306 ?auto_133308 ) ) ( not ( = ?auto_133307 ?auto_133308 ) ) ( HOLDING ?auto_133309 ) ( not ( = ?auto_133302 ?auto_133309 ) ) ( not ( = ?auto_133303 ?auto_133309 ) ) ( not ( = ?auto_133304 ?auto_133309 ) ) ( not ( = ?auto_133305 ?auto_133309 ) ) ( not ( = ?auto_133306 ?auto_133309 ) ) ( not ( = ?auto_133307 ?auto_133309 ) ) ( not ( = ?auto_133308 ?auto_133309 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_133309 )
      ( MAKE-6PILE ?auto_133302 ?auto_133303 ?auto_133304 ?auto_133305 ?auto_133306 ?auto_133307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133427 - BLOCK
      ?auto_133428 - BLOCK
    )
    :vars
    (
      ?auto_133429 - BLOCK
      ?auto_133434 - BLOCK
      ?auto_133433 - BLOCK
      ?auto_133431 - BLOCK
      ?auto_133430 - BLOCK
      ?auto_133432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133427 ?auto_133428 ) ) ( ON ?auto_133428 ?auto_133429 ) ( not ( = ?auto_133427 ?auto_133429 ) ) ( not ( = ?auto_133428 ?auto_133429 ) ) ( ON ?auto_133427 ?auto_133428 ) ( CLEAR ?auto_133427 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133434 ) ( ON ?auto_133433 ?auto_133434 ) ( ON ?auto_133431 ?auto_133433 ) ( ON ?auto_133430 ?auto_133431 ) ( ON ?auto_133432 ?auto_133430 ) ( ON ?auto_133429 ?auto_133432 ) ( not ( = ?auto_133434 ?auto_133433 ) ) ( not ( = ?auto_133434 ?auto_133431 ) ) ( not ( = ?auto_133434 ?auto_133430 ) ) ( not ( = ?auto_133434 ?auto_133432 ) ) ( not ( = ?auto_133434 ?auto_133429 ) ) ( not ( = ?auto_133434 ?auto_133428 ) ) ( not ( = ?auto_133434 ?auto_133427 ) ) ( not ( = ?auto_133433 ?auto_133431 ) ) ( not ( = ?auto_133433 ?auto_133430 ) ) ( not ( = ?auto_133433 ?auto_133432 ) ) ( not ( = ?auto_133433 ?auto_133429 ) ) ( not ( = ?auto_133433 ?auto_133428 ) ) ( not ( = ?auto_133433 ?auto_133427 ) ) ( not ( = ?auto_133431 ?auto_133430 ) ) ( not ( = ?auto_133431 ?auto_133432 ) ) ( not ( = ?auto_133431 ?auto_133429 ) ) ( not ( = ?auto_133431 ?auto_133428 ) ) ( not ( = ?auto_133431 ?auto_133427 ) ) ( not ( = ?auto_133430 ?auto_133432 ) ) ( not ( = ?auto_133430 ?auto_133429 ) ) ( not ( = ?auto_133430 ?auto_133428 ) ) ( not ( = ?auto_133430 ?auto_133427 ) ) ( not ( = ?auto_133432 ?auto_133429 ) ) ( not ( = ?auto_133432 ?auto_133428 ) ) ( not ( = ?auto_133432 ?auto_133427 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133434 ?auto_133433 ?auto_133431 ?auto_133430 ?auto_133432 ?auto_133429 ?auto_133428 )
      ( MAKE-2PILE ?auto_133427 ?auto_133428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133437 - BLOCK
      ?auto_133438 - BLOCK
    )
    :vars
    (
      ?auto_133439 - BLOCK
      ?auto_133440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133437 ?auto_133438 ) ) ( ON ?auto_133438 ?auto_133439 ) ( CLEAR ?auto_133438 ) ( not ( = ?auto_133437 ?auto_133439 ) ) ( not ( = ?auto_133438 ?auto_133439 ) ) ( ON ?auto_133437 ?auto_133440 ) ( CLEAR ?auto_133437 ) ( HAND-EMPTY ) ( not ( = ?auto_133437 ?auto_133440 ) ) ( not ( = ?auto_133438 ?auto_133440 ) ) ( not ( = ?auto_133439 ?auto_133440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133437 ?auto_133440 )
      ( MAKE-2PILE ?auto_133437 ?auto_133438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133441 - BLOCK
      ?auto_133442 - BLOCK
    )
    :vars
    (
      ?auto_133444 - BLOCK
      ?auto_133443 - BLOCK
      ?auto_133448 - BLOCK
      ?auto_133445 - BLOCK
      ?auto_133449 - BLOCK
      ?auto_133446 - BLOCK
      ?auto_133447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133441 ?auto_133442 ) ) ( not ( = ?auto_133441 ?auto_133444 ) ) ( not ( = ?auto_133442 ?auto_133444 ) ) ( ON ?auto_133441 ?auto_133443 ) ( CLEAR ?auto_133441 ) ( not ( = ?auto_133441 ?auto_133443 ) ) ( not ( = ?auto_133442 ?auto_133443 ) ) ( not ( = ?auto_133444 ?auto_133443 ) ) ( HOLDING ?auto_133442 ) ( CLEAR ?auto_133444 ) ( ON-TABLE ?auto_133448 ) ( ON ?auto_133445 ?auto_133448 ) ( ON ?auto_133449 ?auto_133445 ) ( ON ?auto_133446 ?auto_133449 ) ( ON ?auto_133447 ?auto_133446 ) ( ON ?auto_133444 ?auto_133447 ) ( not ( = ?auto_133448 ?auto_133445 ) ) ( not ( = ?auto_133448 ?auto_133449 ) ) ( not ( = ?auto_133448 ?auto_133446 ) ) ( not ( = ?auto_133448 ?auto_133447 ) ) ( not ( = ?auto_133448 ?auto_133444 ) ) ( not ( = ?auto_133448 ?auto_133442 ) ) ( not ( = ?auto_133445 ?auto_133449 ) ) ( not ( = ?auto_133445 ?auto_133446 ) ) ( not ( = ?auto_133445 ?auto_133447 ) ) ( not ( = ?auto_133445 ?auto_133444 ) ) ( not ( = ?auto_133445 ?auto_133442 ) ) ( not ( = ?auto_133449 ?auto_133446 ) ) ( not ( = ?auto_133449 ?auto_133447 ) ) ( not ( = ?auto_133449 ?auto_133444 ) ) ( not ( = ?auto_133449 ?auto_133442 ) ) ( not ( = ?auto_133446 ?auto_133447 ) ) ( not ( = ?auto_133446 ?auto_133444 ) ) ( not ( = ?auto_133446 ?auto_133442 ) ) ( not ( = ?auto_133447 ?auto_133444 ) ) ( not ( = ?auto_133447 ?auto_133442 ) ) ( not ( = ?auto_133441 ?auto_133448 ) ) ( not ( = ?auto_133441 ?auto_133445 ) ) ( not ( = ?auto_133441 ?auto_133449 ) ) ( not ( = ?auto_133441 ?auto_133446 ) ) ( not ( = ?auto_133441 ?auto_133447 ) ) ( not ( = ?auto_133443 ?auto_133448 ) ) ( not ( = ?auto_133443 ?auto_133445 ) ) ( not ( = ?auto_133443 ?auto_133449 ) ) ( not ( = ?auto_133443 ?auto_133446 ) ) ( not ( = ?auto_133443 ?auto_133447 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133448 ?auto_133445 ?auto_133449 ?auto_133446 ?auto_133447 ?auto_133444 ?auto_133442 )
      ( MAKE-2PILE ?auto_133441 ?auto_133442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133450 - BLOCK
      ?auto_133451 - BLOCK
    )
    :vars
    (
      ?auto_133453 - BLOCK
      ?auto_133458 - BLOCK
      ?auto_133455 - BLOCK
      ?auto_133456 - BLOCK
      ?auto_133457 - BLOCK
      ?auto_133454 - BLOCK
      ?auto_133452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133450 ?auto_133451 ) ) ( not ( = ?auto_133450 ?auto_133453 ) ) ( not ( = ?auto_133451 ?auto_133453 ) ) ( ON ?auto_133450 ?auto_133458 ) ( not ( = ?auto_133450 ?auto_133458 ) ) ( not ( = ?auto_133451 ?auto_133458 ) ) ( not ( = ?auto_133453 ?auto_133458 ) ) ( CLEAR ?auto_133453 ) ( ON-TABLE ?auto_133455 ) ( ON ?auto_133456 ?auto_133455 ) ( ON ?auto_133457 ?auto_133456 ) ( ON ?auto_133454 ?auto_133457 ) ( ON ?auto_133452 ?auto_133454 ) ( ON ?auto_133453 ?auto_133452 ) ( not ( = ?auto_133455 ?auto_133456 ) ) ( not ( = ?auto_133455 ?auto_133457 ) ) ( not ( = ?auto_133455 ?auto_133454 ) ) ( not ( = ?auto_133455 ?auto_133452 ) ) ( not ( = ?auto_133455 ?auto_133453 ) ) ( not ( = ?auto_133455 ?auto_133451 ) ) ( not ( = ?auto_133456 ?auto_133457 ) ) ( not ( = ?auto_133456 ?auto_133454 ) ) ( not ( = ?auto_133456 ?auto_133452 ) ) ( not ( = ?auto_133456 ?auto_133453 ) ) ( not ( = ?auto_133456 ?auto_133451 ) ) ( not ( = ?auto_133457 ?auto_133454 ) ) ( not ( = ?auto_133457 ?auto_133452 ) ) ( not ( = ?auto_133457 ?auto_133453 ) ) ( not ( = ?auto_133457 ?auto_133451 ) ) ( not ( = ?auto_133454 ?auto_133452 ) ) ( not ( = ?auto_133454 ?auto_133453 ) ) ( not ( = ?auto_133454 ?auto_133451 ) ) ( not ( = ?auto_133452 ?auto_133453 ) ) ( not ( = ?auto_133452 ?auto_133451 ) ) ( not ( = ?auto_133450 ?auto_133455 ) ) ( not ( = ?auto_133450 ?auto_133456 ) ) ( not ( = ?auto_133450 ?auto_133457 ) ) ( not ( = ?auto_133450 ?auto_133454 ) ) ( not ( = ?auto_133450 ?auto_133452 ) ) ( not ( = ?auto_133458 ?auto_133455 ) ) ( not ( = ?auto_133458 ?auto_133456 ) ) ( not ( = ?auto_133458 ?auto_133457 ) ) ( not ( = ?auto_133458 ?auto_133454 ) ) ( not ( = ?auto_133458 ?auto_133452 ) ) ( ON ?auto_133451 ?auto_133450 ) ( CLEAR ?auto_133451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133458 ?auto_133450 )
      ( MAKE-2PILE ?auto_133450 ?auto_133451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133459 - BLOCK
      ?auto_133460 - BLOCK
    )
    :vars
    (
      ?auto_133465 - BLOCK
      ?auto_133461 - BLOCK
      ?auto_133467 - BLOCK
      ?auto_133464 - BLOCK
      ?auto_133462 - BLOCK
      ?auto_133466 - BLOCK
      ?auto_133463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133459 ?auto_133460 ) ) ( not ( = ?auto_133459 ?auto_133465 ) ) ( not ( = ?auto_133460 ?auto_133465 ) ) ( ON ?auto_133459 ?auto_133461 ) ( not ( = ?auto_133459 ?auto_133461 ) ) ( not ( = ?auto_133460 ?auto_133461 ) ) ( not ( = ?auto_133465 ?auto_133461 ) ) ( ON-TABLE ?auto_133467 ) ( ON ?auto_133464 ?auto_133467 ) ( ON ?auto_133462 ?auto_133464 ) ( ON ?auto_133466 ?auto_133462 ) ( ON ?auto_133463 ?auto_133466 ) ( not ( = ?auto_133467 ?auto_133464 ) ) ( not ( = ?auto_133467 ?auto_133462 ) ) ( not ( = ?auto_133467 ?auto_133466 ) ) ( not ( = ?auto_133467 ?auto_133463 ) ) ( not ( = ?auto_133467 ?auto_133465 ) ) ( not ( = ?auto_133467 ?auto_133460 ) ) ( not ( = ?auto_133464 ?auto_133462 ) ) ( not ( = ?auto_133464 ?auto_133466 ) ) ( not ( = ?auto_133464 ?auto_133463 ) ) ( not ( = ?auto_133464 ?auto_133465 ) ) ( not ( = ?auto_133464 ?auto_133460 ) ) ( not ( = ?auto_133462 ?auto_133466 ) ) ( not ( = ?auto_133462 ?auto_133463 ) ) ( not ( = ?auto_133462 ?auto_133465 ) ) ( not ( = ?auto_133462 ?auto_133460 ) ) ( not ( = ?auto_133466 ?auto_133463 ) ) ( not ( = ?auto_133466 ?auto_133465 ) ) ( not ( = ?auto_133466 ?auto_133460 ) ) ( not ( = ?auto_133463 ?auto_133465 ) ) ( not ( = ?auto_133463 ?auto_133460 ) ) ( not ( = ?auto_133459 ?auto_133467 ) ) ( not ( = ?auto_133459 ?auto_133464 ) ) ( not ( = ?auto_133459 ?auto_133462 ) ) ( not ( = ?auto_133459 ?auto_133466 ) ) ( not ( = ?auto_133459 ?auto_133463 ) ) ( not ( = ?auto_133461 ?auto_133467 ) ) ( not ( = ?auto_133461 ?auto_133464 ) ) ( not ( = ?auto_133461 ?auto_133462 ) ) ( not ( = ?auto_133461 ?auto_133466 ) ) ( not ( = ?auto_133461 ?auto_133463 ) ) ( ON ?auto_133460 ?auto_133459 ) ( CLEAR ?auto_133460 ) ( ON-TABLE ?auto_133461 ) ( HOLDING ?auto_133465 ) ( CLEAR ?auto_133463 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133467 ?auto_133464 ?auto_133462 ?auto_133466 ?auto_133463 ?auto_133465 )
      ( MAKE-2PILE ?auto_133459 ?auto_133460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133468 - BLOCK
      ?auto_133469 - BLOCK
    )
    :vars
    (
      ?auto_133471 - BLOCK
      ?auto_133475 - BLOCK
      ?auto_133474 - BLOCK
      ?auto_133476 - BLOCK
      ?auto_133473 - BLOCK
      ?auto_133470 - BLOCK
      ?auto_133472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133468 ?auto_133469 ) ) ( not ( = ?auto_133468 ?auto_133471 ) ) ( not ( = ?auto_133469 ?auto_133471 ) ) ( ON ?auto_133468 ?auto_133475 ) ( not ( = ?auto_133468 ?auto_133475 ) ) ( not ( = ?auto_133469 ?auto_133475 ) ) ( not ( = ?auto_133471 ?auto_133475 ) ) ( ON-TABLE ?auto_133474 ) ( ON ?auto_133476 ?auto_133474 ) ( ON ?auto_133473 ?auto_133476 ) ( ON ?auto_133470 ?auto_133473 ) ( ON ?auto_133472 ?auto_133470 ) ( not ( = ?auto_133474 ?auto_133476 ) ) ( not ( = ?auto_133474 ?auto_133473 ) ) ( not ( = ?auto_133474 ?auto_133470 ) ) ( not ( = ?auto_133474 ?auto_133472 ) ) ( not ( = ?auto_133474 ?auto_133471 ) ) ( not ( = ?auto_133474 ?auto_133469 ) ) ( not ( = ?auto_133476 ?auto_133473 ) ) ( not ( = ?auto_133476 ?auto_133470 ) ) ( not ( = ?auto_133476 ?auto_133472 ) ) ( not ( = ?auto_133476 ?auto_133471 ) ) ( not ( = ?auto_133476 ?auto_133469 ) ) ( not ( = ?auto_133473 ?auto_133470 ) ) ( not ( = ?auto_133473 ?auto_133472 ) ) ( not ( = ?auto_133473 ?auto_133471 ) ) ( not ( = ?auto_133473 ?auto_133469 ) ) ( not ( = ?auto_133470 ?auto_133472 ) ) ( not ( = ?auto_133470 ?auto_133471 ) ) ( not ( = ?auto_133470 ?auto_133469 ) ) ( not ( = ?auto_133472 ?auto_133471 ) ) ( not ( = ?auto_133472 ?auto_133469 ) ) ( not ( = ?auto_133468 ?auto_133474 ) ) ( not ( = ?auto_133468 ?auto_133476 ) ) ( not ( = ?auto_133468 ?auto_133473 ) ) ( not ( = ?auto_133468 ?auto_133470 ) ) ( not ( = ?auto_133468 ?auto_133472 ) ) ( not ( = ?auto_133475 ?auto_133474 ) ) ( not ( = ?auto_133475 ?auto_133476 ) ) ( not ( = ?auto_133475 ?auto_133473 ) ) ( not ( = ?auto_133475 ?auto_133470 ) ) ( not ( = ?auto_133475 ?auto_133472 ) ) ( ON ?auto_133469 ?auto_133468 ) ( ON-TABLE ?auto_133475 ) ( CLEAR ?auto_133472 ) ( ON ?auto_133471 ?auto_133469 ) ( CLEAR ?auto_133471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133475 ?auto_133468 ?auto_133469 )
      ( MAKE-2PILE ?auto_133468 ?auto_133469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133477 - BLOCK
      ?auto_133478 - BLOCK
    )
    :vars
    (
      ?auto_133479 - BLOCK
      ?auto_133482 - BLOCK
      ?auto_133480 - BLOCK
      ?auto_133485 - BLOCK
      ?auto_133481 - BLOCK
      ?auto_133484 - BLOCK
      ?auto_133483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133477 ?auto_133478 ) ) ( not ( = ?auto_133477 ?auto_133479 ) ) ( not ( = ?auto_133478 ?auto_133479 ) ) ( ON ?auto_133477 ?auto_133482 ) ( not ( = ?auto_133477 ?auto_133482 ) ) ( not ( = ?auto_133478 ?auto_133482 ) ) ( not ( = ?auto_133479 ?auto_133482 ) ) ( ON-TABLE ?auto_133480 ) ( ON ?auto_133485 ?auto_133480 ) ( ON ?auto_133481 ?auto_133485 ) ( ON ?auto_133484 ?auto_133481 ) ( not ( = ?auto_133480 ?auto_133485 ) ) ( not ( = ?auto_133480 ?auto_133481 ) ) ( not ( = ?auto_133480 ?auto_133484 ) ) ( not ( = ?auto_133480 ?auto_133483 ) ) ( not ( = ?auto_133480 ?auto_133479 ) ) ( not ( = ?auto_133480 ?auto_133478 ) ) ( not ( = ?auto_133485 ?auto_133481 ) ) ( not ( = ?auto_133485 ?auto_133484 ) ) ( not ( = ?auto_133485 ?auto_133483 ) ) ( not ( = ?auto_133485 ?auto_133479 ) ) ( not ( = ?auto_133485 ?auto_133478 ) ) ( not ( = ?auto_133481 ?auto_133484 ) ) ( not ( = ?auto_133481 ?auto_133483 ) ) ( not ( = ?auto_133481 ?auto_133479 ) ) ( not ( = ?auto_133481 ?auto_133478 ) ) ( not ( = ?auto_133484 ?auto_133483 ) ) ( not ( = ?auto_133484 ?auto_133479 ) ) ( not ( = ?auto_133484 ?auto_133478 ) ) ( not ( = ?auto_133483 ?auto_133479 ) ) ( not ( = ?auto_133483 ?auto_133478 ) ) ( not ( = ?auto_133477 ?auto_133480 ) ) ( not ( = ?auto_133477 ?auto_133485 ) ) ( not ( = ?auto_133477 ?auto_133481 ) ) ( not ( = ?auto_133477 ?auto_133484 ) ) ( not ( = ?auto_133477 ?auto_133483 ) ) ( not ( = ?auto_133482 ?auto_133480 ) ) ( not ( = ?auto_133482 ?auto_133485 ) ) ( not ( = ?auto_133482 ?auto_133481 ) ) ( not ( = ?auto_133482 ?auto_133484 ) ) ( not ( = ?auto_133482 ?auto_133483 ) ) ( ON ?auto_133478 ?auto_133477 ) ( ON-TABLE ?auto_133482 ) ( ON ?auto_133479 ?auto_133478 ) ( CLEAR ?auto_133479 ) ( HOLDING ?auto_133483 ) ( CLEAR ?auto_133484 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133480 ?auto_133485 ?auto_133481 ?auto_133484 ?auto_133483 )
      ( MAKE-2PILE ?auto_133477 ?auto_133478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133486 - BLOCK
      ?auto_133487 - BLOCK
    )
    :vars
    (
      ?auto_133493 - BLOCK
      ?auto_133492 - BLOCK
      ?auto_133489 - BLOCK
      ?auto_133488 - BLOCK
      ?auto_133491 - BLOCK
      ?auto_133494 - BLOCK
      ?auto_133490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133486 ?auto_133487 ) ) ( not ( = ?auto_133486 ?auto_133493 ) ) ( not ( = ?auto_133487 ?auto_133493 ) ) ( ON ?auto_133486 ?auto_133492 ) ( not ( = ?auto_133486 ?auto_133492 ) ) ( not ( = ?auto_133487 ?auto_133492 ) ) ( not ( = ?auto_133493 ?auto_133492 ) ) ( ON-TABLE ?auto_133489 ) ( ON ?auto_133488 ?auto_133489 ) ( ON ?auto_133491 ?auto_133488 ) ( ON ?auto_133494 ?auto_133491 ) ( not ( = ?auto_133489 ?auto_133488 ) ) ( not ( = ?auto_133489 ?auto_133491 ) ) ( not ( = ?auto_133489 ?auto_133494 ) ) ( not ( = ?auto_133489 ?auto_133490 ) ) ( not ( = ?auto_133489 ?auto_133493 ) ) ( not ( = ?auto_133489 ?auto_133487 ) ) ( not ( = ?auto_133488 ?auto_133491 ) ) ( not ( = ?auto_133488 ?auto_133494 ) ) ( not ( = ?auto_133488 ?auto_133490 ) ) ( not ( = ?auto_133488 ?auto_133493 ) ) ( not ( = ?auto_133488 ?auto_133487 ) ) ( not ( = ?auto_133491 ?auto_133494 ) ) ( not ( = ?auto_133491 ?auto_133490 ) ) ( not ( = ?auto_133491 ?auto_133493 ) ) ( not ( = ?auto_133491 ?auto_133487 ) ) ( not ( = ?auto_133494 ?auto_133490 ) ) ( not ( = ?auto_133494 ?auto_133493 ) ) ( not ( = ?auto_133494 ?auto_133487 ) ) ( not ( = ?auto_133490 ?auto_133493 ) ) ( not ( = ?auto_133490 ?auto_133487 ) ) ( not ( = ?auto_133486 ?auto_133489 ) ) ( not ( = ?auto_133486 ?auto_133488 ) ) ( not ( = ?auto_133486 ?auto_133491 ) ) ( not ( = ?auto_133486 ?auto_133494 ) ) ( not ( = ?auto_133486 ?auto_133490 ) ) ( not ( = ?auto_133492 ?auto_133489 ) ) ( not ( = ?auto_133492 ?auto_133488 ) ) ( not ( = ?auto_133492 ?auto_133491 ) ) ( not ( = ?auto_133492 ?auto_133494 ) ) ( not ( = ?auto_133492 ?auto_133490 ) ) ( ON ?auto_133487 ?auto_133486 ) ( ON-TABLE ?auto_133492 ) ( ON ?auto_133493 ?auto_133487 ) ( CLEAR ?auto_133494 ) ( ON ?auto_133490 ?auto_133493 ) ( CLEAR ?auto_133490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133492 ?auto_133486 ?auto_133487 ?auto_133493 )
      ( MAKE-2PILE ?auto_133486 ?auto_133487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133495 - BLOCK
      ?auto_133496 - BLOCK
    )
    :vars
    (
      ?auto_133498 - BLOCK
      ?auto_133499 - BLOCK
      ?auto_133497 - BLOCK
      ?auto_133500 - BLOCK
      ?auto_133501 - BLOCK
      ?auto_133503 - BLOCK
      ?auto_133502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133495 ?auto_133496 ) ) ( not ( = ?auto_133495 ?auto_133498 ) ) ( not ( = ?auto_133496 ?auto_133498 ) ) ( ON ?auto_133495 ?auto_133499 ) ( not ( = ?auto_133495 ?auto_133499 ) ) ( not ( = ?auto_133496 ?auto_133499 ) ) ( not ( = ?auto_133498 ?auto_133499 ) ) ( ON-TABLE ?auto_133497 ) ( ON ?auto_133500 ?auto_133497 ) ( ON ?auto_133501 ?auto_133500 ) ( not ( = ?auto_133497 ?auto_133500 ) ) ( not ( = ?auto_133497 ?auto_133501 ) ) ( not ( = ?auto_133497 ?auto_133503 ) ) ( not ( = ?auto_133497 ?auto_133502 ) ) ( not ( = ?auto_133497 ?auto_133498 ) ) ( not ( = ?auto_133497 ?auto_133496 ) ) ( not ( = ?auto_133500 ?auto_133501 ) ) ( not ( = ?auto_133500 ?auto_133503 ) ) ( not ( = ?auto_133500 ?auto_133502 ) ) ( not ( = ?auto_133500 ?auto_133498 ) ) ( not ( = ?auto_133500 ?auto_133496 ) ) ( not ( = ?auto_133501 ?auto_133503 ) ) ( not ( = ?auto_133501 ?auto_133502 ) ) ( not ( = ?auto_133501 ?auto_133498 ) ) ( not ( = ?auto_133501 ?auto_133496 ) ) ( not ( = ?auto_133503 ?auto_133502 ) ) ( not ( = ?auto_133503 ?auto_133498 ) ) ( not ( = ?auto_133503 ?auto_133496 ) ) ( not ( = ?auto_133502 ?auto_133498 ) ) ( not ( = ?auto_133502 ?auto_133496 ) ) ( not ( = ?auto_133495 ?auto_133497 ) ) ( not ( = ?auto_133495 ?auto_133500 ) ) ( not ( = ?auto_133495 ?auto_133501 ) ) ( not ( = ?auto_133495 ?auto_133503 ) ) ( not ( = ?auto_133495 ?auto_133502 ) ) ( not ( = ?auto_133499 ?auto_133497 ) ) ( not ( = ?auto_133499 ?auto_133500 ) ) ( not ( = ?auto_133499 ?auto_133501 ) ) ( not ( = ?auto_133499 ?auto_133503 ) ) ( not ( = ?auto_133499 ?auto_133502 ) ) ( ON ?auto_133496 ?auto_133495 ) ( ON-TABLE ?auto_133499 ) ( ON ?auto_133498 ?auto_133496 ) ( ON ?auto_133502 ?auto_133498 ) ( CLEAR ?auto_133502 ) ( HOLDING ?auto_133503 ) ( CLEAR ?auto_133501 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133497 ?auto_133500 ?auto_133501 ?auto_133503 )
      ( MAKE-2PILE ?auto_133495 ?auto_133496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133504 - BLOCK
      ?auto_133505 - BLOCK
    )
    :vars
    (
      ?auto_133506 - BLOCK
      ?auto_133511 - BLOCK
      ?auto_133509 - BLOCK
      ?auto_133510 - BLOCK
      ?auto_133508 - BLOCK
      ?auto_133507 - BLOCK
      ?auto_133512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133504 ?auto_133505 ) ) ( not ( = ?auto_133504 ?auto_133506 ) ) ( not ( = ?auto_133505 ?auto_133506 ) ) ( ON ?auto_133504 ?auto_133511 ) ( not ( = ?auto_133504 ?auto_133511 ) ) ( not ( = ?auto_133505 ?auto_133511 ) ) ( not ( = ?auto_133506 ?auto_133511 ) ) ( ON-TABLE ?auto_133509 ) ( ON ?auto_133510 ?auto_133509 ) ( ON ?auto_133508 ?auto_133510 ) ( not ( = ?auto_133509 ?auto_133510 ) ) ( not ( = ?auto_133509 ?auto_133508 ) ) ( not ( = ?auto_133509 ?auto_133507 ) ) ( not ( = ?auto_133509 ?auto_133512 ) ) ( not ( = ?auto_133509 ?auto_133506 ) ) ( not ( = ?auto_133509 ?auto_133505 ) ) ( not ( = ?auto_133510 ?auto_133508 ) ) ( not ( = ?auto_133510 ?auto_133507 ) ) ( not ( = ?auto_133510 ?auto_133512 ) ) ( not ( = ?auto_133510 ?auto_133506 ) ) ( not ( = ?auto_133510 ?auto_133505 ) ) ( not ( = ?auto_133508 ?auto_133507 ) ) ( not ( = ?auto_133508 ?auto_133512 ) ) ( not ( = ?auto_133508 ?auto_133506 ) ) ( not ( = ?auto_133508 ?auto_133505 ) ) ( not ( = ?auto_133507 ?auto_133512 ) ) ( not ( = ?auto_133507 ?auto_133506 ) ) ( not ( = ?auto_133507 ?auto_133505 ) ) ( not ( = ?auto_133512 ?auto_133506 ) ) ( not ( = ?auto_133512 ?auto_133505 ) ) ( not ( = ?auto_133504 ?auto_133509 ) ) ( not ( = ?auto_133504 ?auto_133510 ) ) ( not ( = ?auto_133504 ?auto_133508 ) ) ( not ( = ?auto_133504 ?auto_133507 ) ) ( not ( = ?auto_133504 ?auto_133512 ) ) ( not ( = ?auto_133511 ?auto_133509 ) ) ( not ( = ?auto_133511 ?auto_133510 ) ) ( not ( = ?auto_133511 ?auto_133508 ) ) ( not ( = ?auto_133511 ?auto_133507 ) ) ( not ( = ?auto_133511 ?auto_133512 ) ) ( ON ?auto_133505 ?auto_133504 ) ( ON-TABLE ?auto_133511 ) ( ON ?auto_133506 ?auto_133505 ) ( ON ?auto_133512 ?auto_133506 ) ( CLEAR ?auto_133508 ) ( ON ?auto_133507 ?auto_133512 ) ( CLEAR ?auto_133507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133511 ?auto_133504 ?auto_133505 ?auto_133506 ?auto_133512 )
      ( MAKE-2PILE ?auto_133504 ?auto_133505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133513 - BLOCK
      ?auto_133514 - BLOCK
    )
    :vars
    (
      ?auto_133520 - BLOCK
      ?auto_133517 - BLOCK
      ?auto_133516 - BLOCK
      ?auto_133515 - BLOCK
      ?auto_133521 - BLOCK
      ?auto_133518 - BLOCK
      ?auto_133519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133513 ?auto_133514 ) ) ( not ( = ?auto_133513 ?auto_133520 ) ) ( not ( = ?auto_133514 ?auto_133520 ) ) ( ON ?auto_133513 ?auto_133517 ) ( not ( = ?auto_133513 ?auto_133517 ) ) ( not ( = ?auto_133514 ?auto_133517 ) ) ( not ( = ?auto_133520 ?auto_133517 ) ) ( ON-TABLE ?auto_133516 ) ( ON ?auto_133515 ?auto_133516 ) ( not ( = ?auto_133516 ?auto_133515 ) ) ( not ( = ?auto_133516 ?auto_133521 ) ) ( not ( = ?auto_133516 ?auto_133518 ) ) ( not ( = ?auto_133516 ?auto_133519 ) ) ( not ( = ?auto_133516 ?auto_133520 ) ) ( not ( = ?auto_133516 ?auto_133514 ) ) ( not ( = ?auto_133515 ?auto_133521 ) ) ( not ( = ?auto_133515 ?auto_133518 ) ) ( not ( = ?auto_133515 ?auto_133519 ) ) ( not ( = ?auto_133515 ?auto_133520 ) ) ( not ( = ?auto_133515 ?auto_133514 ) ) ( not ( = ?auto_133521 ?auto_133518 ) ) ( not ( = ?auto_133521 ?auto_133519 ) ) ( not ( = ?auto_133521 ?auto_133520 ) ) ( not ( = ?auto_133521 ?auto_133514 ) ) ( not ( = ?auto_133518 ?auto_133519 ) ) ( not ( = ?auto_133518 ?auto_133520 ) ) ( not ( = ?auto_133518 ?auto_133514 ) ) ( not ( = ?auto_133519 ?auto_133520 ) ) ( not ( = ?auto_133519 ?auto_133514 ) ) ( not ( = ?auto_133513 ?auto_133516 ) ) ( not ( = ?auto_133513 ?auto_133515 ) ) ( not ( = ?auto_133513 ?auto_133521 ) ) ( not ( = ?auto_133513 ?auto_133518 ) ) ( not ( = ?auto_133513 ?auto_133519 ) ) ( not ( = ?auto_133517 ?auto_133516 ) ) ( not ( = ?auto_133517 ?auto_133515 ) ) ( not ( = ?auto_133517 ?auto_133521 ) ) ( not ( = ?auto_133517 ?auto_133518 ) ) ( not ( = ?auto_133517 ?auto_133519 ) ) ( ON ?auto_133514 ?auto_133513 ) ( ON-TABLE ?auto_133517 ) ( ON ?auto_133520 ?auto_133514 ) ( ON ?auto_133519 ?auto_133520 ) ( ON ?auto_133518 ?auto_133519 ) ( CLEAR ?auto_133518 ) ( HOLDING ?auto_133521 ) ( CLEAR ?auto_133515 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133516 ?auto_133515 ?auto_133521 )
      ( MAKE-2PILE ?auto_133513 ?auto_133514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133522 - BLOCK
      ?auto_133523 - BLOCK
    )
    :vars
    (
      ?auto_133524 - BLOCK
      ?auto_133525 - BLOCK
      ?auto_133527 - BLOCK
      ?auto_133526 - BLOCK
      ?auto_133530 - BLOCK
      ?auto_133529 - BLOCK
      ?auto_133528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133522 ?auto_133523 ) ) ( not ( = ?auto_133522 ?auto_133524 ) ) ( not ( = ?auto_133523 ?auto_133524 ) ) ( ON ?auto_133522 ?auto_133525 ) ( not ( = ?auto_133522 ?auto_133525 ) ) ( not ( = ?auto_133523 ?auto_133525 ) ) ( not ( = ?auto_133524 ?auto_133525 ) ) ( ON-TABLE ?auto_133527 ) ( ON ?auto_133526 ?auto_133527 ) ( not ( = ?auto_133527 ?auto_133526 ) ) ( not ( = ?auto_133527 ?auto_133530 ) ) ( not ( = ?auto_133527 ?auto_133529 ) ) ( not ( = ?auto_133527 ?auto_133528 ) ) ( not ( = ?auto_133527 ?auto_133524 ) ) ( not ( = ?auto_133527 ?auto_133523 ) ) ( not ( = ?auto_133526 ?auto_133530 ) ) ( not ( = ?auto_133526 ?auto_133529 ) ) ( not ( = ?auto_133526 ?auto_133528 ) ) ( not ( = ?auto_133526 ?auto_133524 ) ) ( not ( = ?auto_133526 ?auto_133523 ) ) ( not ( = ?auto_133530 ?auto_133529 ) ) ( not ( = ?auto_133530 ?auto_133528 ) ) ( not ( = ?auto_133530 ?auto_133524 ) ) ( not ( = ?auto_133530 ?auto_133523 ) ) ( not ( = ?auto_133529 ?auto_133528 ) ) ( not ( = ?auto_133529 ?auto_133524 ) ) ( not ( = ?auto_133529 ?auto_133523 ) ) ( not ( = ?auto_133528 ?auto_133524 ) ) ( not ( = ?auto_133528 ?auto_133523 ) ) ( not ( = ?auto_133522 ?auto_133527 ) ) ( not ( = ?auto_133522 ?auto_133526 ) ) ( not ( = ?auto_133522 ?auto_133530 ) ) ( not ( = ?auto_133522 ?auto_133529 ) ) ( not ( = ?auto_133522 ?auto_133528 ) ) ( not ( = ?auto_133525 ?auto_133527 ) ) ( not ( = ?auto_133525 ?auto_133526 ) ) ( not ( = ?auto_133525 ?auto_133530 ) ) ( not ( = ?auto_133525 ?auto_133529 ) ) ( not ( = ?auto_133525 ?auto_133528 ) ) ( ON ?auto_133523 ?auto_133522 ) ( ON-TABLE ?auto_133525 ) ( ON ?auto_133524 ?auto_133523 ) ( ON ?auto_133528 ?auto_133524 ) ( ON ?auto_133529 ?auto_133528 ) ( CLEAR ?auto_133526 ) ( ON ?auto_133530 ?auto_133529 ) ( CLEAR ?auto_133530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133525 ?auto_133522 ?auto_133523 ?auto_133524 ?auto_133528 ?auto_133529 )
      ( MAKE-2PILE ?auto_133522 ?auto_133523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133531 - BLOCK
      ?auto_133532 - BLOCK
    )
    :vars
    (
      ?auto_133537 - BLOCK
      ?auto_133538 - BLOCK
      ?auto_133536 - BLOCK
      ?auto_133533 - BLOCK
      ?auto_133535 - BLOCK
      ?auto_133534 - BLOCK
      ?auto_133539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133531 ?auto_133532 ) ) ( not ( = ?auto_133531 ?auto_133537 ) ) ( not ( = ?auto_133532 ?auto_133537 ) ) ( ON ?auto_133531 ?auto_133538 ) ( not ( = ?auto_133531 ?auto_133538 ) ) ( not ( = ?auto_133532 ?auto_133538 ) ) ( not ( = ?auto_133537 ?auto_133538 ) ) ( ON-TABLE ?auto_133536 ) ( not ( = ?auto_133536 ?auto_133533 ) ) ( not ( = ?auto_133536 ?auto_133535 ) ) ( not ( = ?auto_133536 ?auto_133534 ) ) ( not ( = ?auto_133536 ?auto_133539 ) ) ( not ( = ?auto_133536 ?auto_133537 ) ) ( not ( = ?auto_133536 ?auto_133532 ) ) ( not ( = ?auto_133533 ?auto_133535 ) ) ( not ( = ?auto_133533 ?auto_133534 ) ) ( not ( = ?auto_133533 ?auto_133539 ) ) ( not ( = ?auto_133533 ?auto_133537 ) ) ( not ( = ?auto_133533 ?auto_133532 ) ) ( not ( = ?auto_133535 ?auto_133534 ) ) ( not ( = ?auto_133535 ?auto_133539 ) ) ( not ( = ?auto_133535 ?auto_133537 ) ) ( not ( = ?auto_133535 ?auto_133532 ) ) ( not ( = ?auto_133534 ?auto_133539 ) ) ( not ( = ?auto_133534 ?auto_133537 ) ) ( not ( = ?auto_133534 ?auto_133532 ) ) ( not ( = ?auto_133539 ?auto_133537 ) ) ( not ( = ?auto_133539 ?auto_133532 ) ) ( not ( = ?auto_133531 ?auto_133536 ) ) ( not ( = ?auto_133531 ?auto_133533 ) ) ( not ( = ?auto_133531 ?auto_133535 ) ) ( not ( = ?auto_133531 ?auto_133534 ) ) ( not ( = ?auto_133531 ?auto_133539 ) ) ( not ( = ?auto_133538 ?auto_133536 ) ) ( not ( = ?auto_133538 ?auto_133533 ) ) ( not ( = ?auto_133538 ?auto_133535 ) ) ( not ( = ?auto_133538 ?auto_133534 ) ) ( not ( = ?auto_133538 ?auto_133539 ) ) ( ON ?auto_133532 ?auto_133531 ) ( ON-TABLE ?auto_133538 ) ( ON ?auto_133537 ?auto_133532 ) ( ON ?auto_133539 ?auto_133537 ) ( ON ?auto_133534 ?auto_133539 ) ( ON ?auto_133535 ?auto_133534 ) ( CLEAR ?auto_133535 ) ( HOLDING ?auto_133533 ) ( CLEAR ?auto_133536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133536 ?auto_133533 )
      ( MAKE-2PILE ?auto_133531 ?auto_133532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133540 - BLOCK
      ?auto_133541 - BLOCK
    )
    :vars
    (
      ?auto_133543 - BLOCK
      ?auto_133542 - BLOCK
      ?auto_133548 - BLOCK
      ?auto_133545 - BLOCK
      ?auto_133546 - BLOCK
      ?auto_133547 - BLOCK
      ?auto_133544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133540 ?auto_133541 ) ) ( not ( = ?auto_133540 ?auto_133543 ) ) ( not ( = ?auto_133541 ?auto_133543 ) ) ( ON ?auto_133540 ?auto_133542 ) ( not ( = ?auto_133540 ?auto_133542 ) ) ( not ( = ?auto_133541 ?auto_133542 ) ) ( not ( = ?auto_133543 ?auto_133542 ) ) ( ON-TABLE ?auto_133548 ) ( not ( = ?auto_133548 ?auto_133545 ) ) ( not ( = ?auto_133548 ?auto_133546 ) ) ( not ( = ?auto_133548 ?auto_133547 ) ) ( not ( = ?auto_133548 ?auto_133544 ) ) ( not ( = ?auto_133548 ?auto_133543 ) ) ( not ( = ?auto_133548 ?auto_133541 ) ) ( not ( = ?auto_133545 ?auto_133546 ) ) ( not ( = ?auto_133545 ?auto_133547 ) ) ( not ( = ?auto_133545 ?auto_133544 ) ) ( not ( = ?auto_133545 ?auto_133543 ) ) ( not ( = ?auto_133545 ?auto_133541 ) ) ( not ( = ?auto_133546 ?auto_133547 ) ) ( not ( = ?auto_133546 ?auto_133544 ) ) ( not ( = ?auto_133546 ?auto_133543 ) ) ( not ( = ?auto_133546 ?auto_133541 ) ) ( not ( = ?auto_133547 ?auto_133544 ) ) ( not ( = ?auto_133547 ?auto_133543 ) ) ( not ( = ?auto_133547 ?auto_133541 ) ) ( not ( = ?auto_133544 ?auto_133543 ) ) ( not ( = ?auto_133544 ?auto_133541 ) ) ( not ( = ?auto_133540 ?auto_133548 ) ) ( not ( = ?auto_133540 ?auto_133545 ) ) ( not ( = ?auto_133540 ?auto_133546 ) ) ( not ( = ?auto_133540 ?auto_133547 ) ) ( not ( = ?auto_133540 ?auto_133544 ) ) ( not ( = ?auto_133542 ?auto_133548 ) ) ( not ( = ?auto_133542 ?auto_133545 ) ) ( not ( = ?auto_133542 ?auto_133546 ) ) ( not ( = ?auto_133542 ?auto_133547 ) ) ( not ( = ?auto_133542 ?auto_133544 ) ) ( ON ?auto_133541 ?auto_133540 ) ( ON-TABLE ?auto_133542 ) ( ON ?auto_133543 ?auto_133541 ) ( ON ?auto_133544 ?auto_133543 ) ( ON ?auto_133547 ?auto_133544 ) ( ON ?auto_133546 ?auto_133547 ) ( CLEAR ?auto_133548 ) ( ON ?auto_133545 ?auto_133546 ) ( CLEAR ?auto_133545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133542 ?auto_133540 ?auto_133541 ?auto_133543 ?auto_133544 ?auto_133547 ?auto_133546 )
      ( MAKE-2PILE ?auto_133540 ?auto_133541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133549 - BLOCK
      ?auto_133550 - BLOCK
    )
    :vars
    (
      ?auto_133554 - BLOCK
      ?auto_133557 - BLOCK
      ?auto_133556 - BLOCK
      ?auto_133555 - BLOCK
      ?auto_133552 - BLOCK
      ?auto_133553 - BLOCK
      ?auto_133551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133549 ?auto_133550 ) ) ( not ( = ?auto_133549 ?auto_133554 ) ) ( not ( = ?auto_133550 ?auto_133554 ) ) ( ON ?auto_133549 ?auto_133557 ) ( not ( = ?auto_133549 ?auto_133557 ) ) ( not ( = ?auto_133550 ?auto_133557 ) ) ( not ( = ?auto_133554 ?auto_133557 ) ) ( not ( = ?auto_133556 ?auto_133555 ) ) ( not ( = ?auto_133556 ?auto_133552 ) ) ( not ( = ?auto_133556 ?auto_133553 ) ) ( not ( = ?auto_133556 ?auto_133551 ) ) ( not ( = ?auto_133556 ?auto_133554 ) ) ( not ( = ?auto_133556 ?auto_133550 ) ) ( not ( = ?auto_133555 ?auto_133552 ) ) ( not ( = ?auto_133555 ?auto_133553 ) ) ( not ( = ?auto_133555 ?auto_133551 ) ) ( not ( = ?auto_133555 ?auto_133554 ) ) ( not ( = ?auto_133555 ?auto_133550 ) ) ( not ( = ?auto_133552 ?auto_133553 ) ) ( not ( = ?auto_133552 ?auto_133551 ) ) ( not ( = ?auto_133552 ?auto_133554 ) ) ( not ( = ?auto_133552 ?auto_133550 ) ) ( not ( = ?auto_133553 ?auto_133551 ) ) ( not ( = ?auto_133553 ?auto_133554 ) ) ( not ( = ?auto_133553 ?auto_133550 ) ) ( not ( = ?auto_133551 ?auto_133554 ) ) ( not ( = ?auto_133551 ?auto_133550 ) ) ( not ( = ?auto_133549 ?auto_133556 ) ) ( not ( = ?auto_133549 ?auto_133555 ) ) ( not ( = ?auto_133549 ?auto_133552 ) ) ( not ( = ?auto_133549 ?auto_133553 ) ) ( not ( = ?auto_133549 ?auto_133551 ) ) ( not ( = ?auto_133557 ?auto_133556 ) ) ( not ( = ?auto_133557 ?auto_133555 ) ) ( not ( = ?auto_133557 ?auto_133552 ) ) ( not ( = ?auto_133557 ?auto_133553 ) ) ( not ( = ?auto_133557 ?auto_133551 ) ) ( ON ?auto_133550 ?auto_133549 ) ( ON-TABLE ?auto_133557 ) ( ON ?auto_133554 ?auto_133550 ) ( ON ?auto_133551 ?auto_133554 ) ( ON ?auto_133553 ?auto_133551 ) ( ON ?auto_133552 ?auto_133553 ) ( ON ?auto_133555 ?auto_133552 ) ( CLEAR ?auto_133555 ) ( HOLDING ?auto_133556 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133556 )
      ( MAKE-2PILE ?auto_133549 ?auto_133550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133558 - BLOCK
      ?auto_133559 - BLOCK
    )
    :vars
    (
      ?auto_133566 - BLOCK
      ?auto_133561 - BLOCK
      ?auto_133563 - BLOCK
      ?auto_133562 - BLOCK
      ?auto_133560 - BLOCK
      ?auto_133565 - BLOCK
      ?auto_133564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133558 ?auto_133559 ) ) ( not ( = ?auto_133558 ?auto_133566 ) ) ( not ( = ?auto_133559 ?auto_133566 ) ) ( ON ?auto_133558 ?auto_133561 ) ( not ( = ?auto_133558 ?auto_133561 ) ) ( not ( = ?auto_133559 ?auto_133561 ) ) ( not ( = ?auto_133566 ?auto_133561 ) ) ( not ( = ?auto_133563 ?auto_133562 ) ) ( not ( = ?auto_133563 ?auto_133560 ) ) ( not ( = ?auto_133563 ?auto_133565 ) ) ( not ( = ?auto_133563 ?auto_133564 ) ) ( not ( = ?auto_133563 ?auto_133566 ) ) ( not ( = ?auto_133563 ?auto_133559 ) ) ( not ( = ?auto_133562 ?auto_133560 ) ) ( not ( = ?auto_133562 ?auto_133565 ) ) ( not ( = ?auto_133562 ?auto_133564 ) ) ( not ( = ?auto_133562 ?auto_133566 ) ) ( not ( = ?auto_133562 ?auto_133559 ) ) ( not ( = ?auto_133560 ?auto_133565 ) ) ( not ( = ?auto_133560 ?auto_133564 ) ) ( not ( = ?auto_133560 ?auto_133566 ) ) ( not ( = ?auto_133560 ?auto_133559 ) ) ( not ( = ?auto_133565 ?auto_133564 ) ) ( not ( = ?auto_133565 ?auto_133566 ) ) ( not ( = ?auto_133565 ?auto_133559 ) ) ( not ( = ?auto_133564 ?auto_133566 ) ) ( not ( = ?auto_133564 ?auto_133559 ) ) ( not ( = ?auto_133558 ?auto_133563 ) ) ( not ( = ?auto_133558 ?auto_133562 ) ) ( not ( = ?auto_133558 ?auto_133560 ) ) ( not ( = ?auto_133558 ?auto_133565 ) ) ( not ( = ?auto_133558 ?auto_133564 ) ) ( not ( = ?auto_133561 ?auto_133563 ) ) ( not ( = ?auto_133561 ?auto_133562 ) ) ( not ( = ?auto_133561 ?auto_133560 ) ) ( not ( = ?auto_133561 ?auto_133565 ) ) ( not ( = ?auto_133561 ?auto_133564 ) ) ( ON ?auto_133559 ?auto_133558 ) ( ON-TABLE ?auto_133561 ) ( ON ?auto_133566 ?auto_133559 ) ( ON ?auto_133564 ?auto_133566 ) ( ON ?auto_133565 ?auto_133564 ) ( ON ?auto_133560 ?auto_133565 ) ( ON ?auto_133562 ?auto_133560 ) ( ON ?auto_133563 ?auto_133562 ) ( CLEAR ?auto_133563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133561 ?auto_133558 ?auto_133559 ?auto_133566 ?auto_133564 ?auto_133565 ?auto_133560 ?auto_133562 )
      ( MAKE-2PILE ?auto_133558 ?auto_133559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133594 - BLOCK
      ?auto_133595 - BLOCK
      ?auto_133596 - BLOCK
      ?auto_133597 - BLOCK
      ?auto_133598 - BLOCK
    )
    :vars
    (
      ?auto_133601 - BLOCK
      ?auto_133599 - BLOCK
      ?auto_133600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133601 ?auto_133598 ) ( ON-TABLE ?auto_133594 ) ( ON ?auto_133595 ?auto_133594 ) ( ON ?auto_133596 ?auto_133595 ) ( ON ?auto_133597 ?auto_133596 ) ( ON ?auto_133598 ?auto_133597 ) ( not ( = ?auto_133594 ?auto_133595 ) ) ( not ( = ?auto_133594 ?auto_133596 ) ) ( not ( = ?auto_133594 ?auto_133597 ) ) ( not ( = ?auto_133594 ?auto_133598 ) ) ( not ( = ?auto_133594 ?auto_133601 ) ) ( not ( = ?auto_133595 ?auto_133596 ) ) ( not ( = ?auto_133595 ?auto_133597 ) ) ( not ( = ?auto_133595 ?auto_133598 ) ) ( not ( = ?auto_133595 ?auto_133601 ) ) ( not ( = ?auto_133596 ?auto_133597 ) ) ( not ( = ?auto_133596 ?auto_133598 ) ) ( not ( = ?auto_133596 ?auto_133601 ) ) ( not ( = ?auto_133597 ?auto_133598 ) ) ( not ( = ?auto_133597 ?auto_133601 ) ) ( not ( = ?auto_133598 ?auto_133601 ) ) ( not ( = ?auto_133594 ?auto_133599 ) ) ( not ( = ?auto_133594 ?auto_133600 ) ) ( not ( = ?auto_133595 ?auto_133599 ) ) ( not ( = ?auto_133595 ?auto_133600 ) ) ( not ( = ?auto_133596 ?auto_133599 ) ) ( not ( = ?auto_133596 ?auto_133600 ) ) ( not ( = ?auto_133597 ?auto_133599 ) ) ( not ( = ?auto_133597 ?auto_133600 ) ) ( not ( = ?auto_133598 ?auto_133599 ) ) ( not ( = ?auto_133598 ?auto_133600 ) ) ( not ( = ?auto_133601 ?auto_133599 ) ) ( not ( = ?auto_133601 ?auto_133600 ) ) ( not ( = ?auto_133599 ?auto_133600 ) ) ( ON ?auto_133599 ?auto_133601 ) ( CLEAR ?auto_133599 ) ( HOLDING ?auto_133600 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133600 )
      ( MAKE-5PILE ?auto_133594 ?auto_133595 ?auto_133596 ?auto_133597 ?auto_133598 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133707 - BLOCK
      ?auto_133708 - BLOCK
      ?auto_133709 - BLOCK
    )
    :vars
    (
      ?auto_133710 - BLOCK
      ?auto_133714 - BLOCK
      ?auto_133711 - BLOCK
      ?auto_133713 - BLOCK
      ?auto_133712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133707 ) ( not ( = ?auto_133707 ?auto_133708 ) ) ( not ( = ?auto_133707 ?auto_133709 ) ) ( not ( = ?auto_133708 ?auto_133709 ) ) ( ON ?auto_133709 ?auto_133710 ) ( not ( = ?auto_133707 ?auto_133710 ) ) ( not ( = ?auto_133708 ?auto_133710 ) ) ( not ( = ?auto_133709 ?auto_133710 ) ) ( CLEAR ?auto_133707 ) ( ON ?auto_133708 ?auto_133709 ) ( CLEAR ?auto_133708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133714 ) ( ON ?auto_133711 ?auto_133714 ) ( ON ?auto_133713 ?auto_133711 ) ( ON ?auto_133712 ?auto_133713 ) ( ON ?auto_133710 ?auto_133712 ) ( not ( = ?auto_133714 ?auto_133711 ) ) ( not ( = ?auto_133714 ?auto_133713 ) ) ( not ( = ?auto_133714 ?auto_133712 ) ) ( not ( = ?auto_133714 ?auto_133710 ) ) ( not ( = ?auto_133714 ?auto_133709 ) ) ( not ( = ?auto_133714 ?auto_133708 ) ) ( not ( = ?auto_133711 ?auto_133713 ) ) ( not ( = ?auto_133711 ?auto_133712 ) ) ( not ( = ?auto_133711 ?auto_133710 ) ) ( not ( = ?auto_133711 ?auto_133709 ) ) ( not ( = ?auto_133711 ?auto_133708 ) ) ( not ( = ?auto_133713 ?auto_133712 ) ) ( not ( = ?auto_133713 ?auto_133710 ) ) ( not ( = ?auto_133713 ?auto_133709 ) ) ( not ( = ?auto_133713 ?auto_133708 ) ) ( not ( = ?auto_133712 ?auto_133710 ) ) ( not ( = ?auto_133712 ?auto_133709 ) ) ( not ( = ?auto_133712 ?auto_133708 ) ) ( not ( = ?auto_133707 ?auto_133714 ) ) ( not ( = ?auto_133707 ?auto_133711 ) ) ( not ( = ?auto_133707 ?auto_133713 ) ) ( not ( = ?auto_133707 ?auto_133712 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133714 ?auto_133711 ?auto_133713 ?auto_133712 ?auto_133710 ?auto_133709 )
      ( MAKE-3PILE ?auto_133707 ?auto_133708 ?auto_133709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133715 - BLOCK
      ?auto_133716 - BLOCK
      ?auto_133717 - BLOCK
    )
    :vars
    (
      ?auto_133720 - BLOCK
      ?auto_133718 - BLOCK
      ?auto_133719 - BLOCK
      ?auto_133722 - BLOCK
      ?auto_133721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133715 ?auto_133716 ) ) ( not ( = ?auto_133715 ?auto_133717 ) ) ( not ( = ?auto_133716 ?auto_133717 ) ) ( ON ?auto_133717 ?auto_133720 ) ( not ( = ?auto_133715 ?auto_133720 ) ) ( not ( = ?auto_133716 ?auto_133720 ) ) ( not ( = ?auto_133717 ?auto_133720 ) ) ( ON ?auto_133716 ?auto_133717 ) ( CLEAR ?auto_133716 ) ( ON-TABLE ?auto_133718 ) ( ON ?auto_133719 ?auto_133718 ) ( ON ?auto_133722 ?auto_133719 ) ( ON ?auto_133721 ?auto_133722 ) ( ON ?auto_133720 ?auto_133721 ) ( not ( = ?auto_133718 ?auto_133719 ) ) ( not ( = ?auto_133718 ?auto_133722 ) ) ( not ( = ?auto_133718 ?auto_133721 ) ) ( not ( = ?auto_133718 ?auto_133720 ) ) ( not ( = ?auto_133718 ?auto_133717 ) ) ( not ( = ?auto_133718 ?auto_133716 ) ) ( not ( = ?auto_133719 ?auto_133722 ) ) ( not ( = ?auto_133719 ?auto_133721 ) ) ( not ( = ?auto_133719 ?auto_133720 ) ) ( not ( = ?auto_133719 ?auto_133717 ) ) ( not ( = ?auto_133719 ?auto_133716 ) ) ( not ( = ?auto_133722 ?auto_133721 ) ) ( not ( = ?auto_133722 ?auto_133720 ) ) ( not ( = ?auto_133722 ?auto_133717 ) ) ( not ( = ?auto_133722 ?auto_133716 ) ) ( not ( = ?auto_133721 ?auto_133720 ) ) ( not ( = ?auto_133721 ?auto_133717 ) ) ( not ( = ?auto_133721 ?auto_133716 ) ) ( not ( = ?auto_133715 ?auto_133718 ) ) ( not ( = ?auto_133715 ?auto_133719 ) ) ( not ( = ?auto_133715 ?auto_133722 ) ) ( not ( = ?auto_133715 ?auto_133721 ) ) ( HOLDING ?auto_133715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133715 )
      ( MAKE-3PILE ?auto_133715 ?auto_133716 ?auto_133717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133723 - BLOCK
      ?auto_133724 - BLOCK
      ?auto_133725 - BLOCK
    )
    :vars
    (
      ?auto_133729 - BLOCK
      ?auto_133730 - BLOCK
      ?auto_133728 - BLOCK
      ?auto_133726 - BLOCK
      ?auto_133727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133723 ?auto_133724 ) ) ( not ( = ?auto_133723 ?auto_133725 ) ) ( not ( = ?auto_133724 ?auto_133725 ) ) ( ON ?auto_133725 ?auto_133729 ) ( not ( = ?auto_133723 ?auto_133729 ) ) ( not ( = ?auto_133724 ?auto_133729 ) ) ( not ( = ?auto_133725 ?auto_133729 ) ) ( ON ?auto_133724 ?auto_133725 ) ( ON-TABLE ?auto_133730 ) ( ON ?auto_133728 ?auto_133730 ) ( ON ?auto_133726 ?auto_133728 ) ( ON ?auto_133727 ?auto_133726 ) ( ON ?auto_133729 ?auto_133727 ) ( not ( = ?auto_133730 ?auto_133728 ) ) ( not ( = ?auto_133730 ?auto_133726 ) ) ( not ( = ?auto_133730 ?auto_133727 ) ) ( not ( = ?auto_133730 ?auto_133729 ) ) ( not ( = ?auto_133730 ?auto_133725 ) ) ( not ( = ?auto_133730 ?auto_133724 ) ) ( not ( = ?auto_133728 ?auto_133726 ) ) ( not ( = ?auto_133728 ?auto_133727 ) ) ( not ( = ?auto_133728 ?auto_133729 ) ) ( not ( = ?auto_133728 ?auto_133725 ) ) ( not ( = ?auto_133728 ?auto_133724 ) ) ( not ( = ?auto_133726 ?auto_133727 ) ) ( not ( = ?auto_133726 ?auto_133729 ) ) ( not ( = ?auto_133726 ?auto_133725 ) ) ( not ( = ?auto_133726 ?auto_133724 ) ) ( not ( = ?auto_133727 ?auto_133729 ) ) ( not ( = ?auto_133727 ?auto_133725 ) ) ( not ( = ?auto_133727 ?auto_133724 ) ) ( not ( = ?auto_133723 ?auto_133730 ) ) ( not ( = ?auto_133723 ?auto_133728 ) ) ( not ( = ?auto_133723 ?auto_133726 ) ) ( not ( = ?auto_133723 ?auto_133727 ) ) ( ON ?auto_133723 ?auto_133724 ) ( CLEAR ?auto_133723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133730 ?auto_133728 ?auto_133726 ?auto_133727 ?auto_133729 ?auto_133725 ?auto_133724 )
      ( MAKE-3PILE ?auto_133723 ?auto_133724 ?auto_133725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133734 - BLOCK
      ?auto_133735 - BLOCK
      ?auto_133736 - BLOCK
    )
    :vars
    (
      ?auto_133741 - BLOCK
      ?auto_133740 - BLOCK
      ?auto_133737 - BLOCK
      ?auto_133738 - BLOCK
      ?auto_133739 - BLOCK
      ?auto_133742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133734 ?auto_133735 ) ) ( not ( = ?auto_133734 ?auto_133736 ) ) ( not ( = ?auto_133735 ?auto_133736 ) ) ( ON ?auto_133736 ?auto_133741 ) ( not ( = ?auto_133734 ?auto_133741 ) ) ( not ( = ?auto_133735 ?auto_133741 ) ) ( not ( = ?auto_133736 ?auto_133741 ) ) ( ON ?auto_133735 ?auto_133736 ) ( CLEAR ?auto_133735 ) ( ON-TABLE ?auto_133740 ) ( ON ?auto_133737 ?auto_133740 ) ( ON ?auto_133738 ?auto_133737 ) ( ON ?auto_133739 ?auto_133738 ) ( ON ?auto_133741 ?auto_133739 ) ( not ( = ?auto_133740 ?auto_133737 ) ) ( not ( = ?auto_133740 ?auto_133738 ) ) ( not ( = ?auto_133740 ?auto_133739 ) ) ( not ( = ?auto_133740 ?auto_133741 ) ) ( not ( = ?auto_133740 ?auto_133736 ) ) ( not ( = ?auto_133740 ?auto_133735 ) ) ( not ( = ?auto_133737 ?auto_133738 ) ) ( not ( = ?auto_133737 ?auto_133739 ) ) ( not ( = ?auto_133737 ?auto_133741 ) ) ( not ( = ?auto_133737 ?auto_133736 ) ) ( not ( = ?auto_133737 ?auto_133735 ) ) ( not ( = ?auto_133738 ?auto_133739 ) ) ( not ( = ?auto_133738 ?auto_133741 ) ) ( not ( = ?auto_133738 ?auto_133736 ) ) ( not ( = ?auto_133738 ?auto_133735 ) ) ( not ( = ?auto_133739 ?auto_133741 ) ) ( not ( = ?auto_133739 ?auto_133736 ) ) ( not ( = ?auto_133739 ?auto_133735 ) ) ( not ( = ?auto_133734 ?auto_133740 ) ) ( not ( = ?auto_133734 ?auto_133737 ) ) ( not ( = ?auto_133734 ?auto_133738 ) ) ( not ( = ?auto_133734 ?auto_133739 ) ) ( ON ?auto_133734 ?auto_133742 ) ( CLEAR ?auto_133734 ) ( HAND-EMPTY ) ( not ( = ?auto_133734 ?auto_133742 ) ) ( not ( = ?auto_133735 ?auto_133742 ) ) ( not ( = ?auto_133736 ?auto_133742 ) ) ( not ( = ?auto_133741 ?auto_133742 ) ) ( not ( = ?auto_133740 ?auto_133742 ) ) ( not ( = ?auto_133737 ?auto_133742 ) ) ( not ( = ?auto_133738 ?auto_133742 ) ) ( not ( = ?auto_133739 ?auto_133742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133734 ?auto_133742 )
      ( MAKE-3PILE ?auto_133734 ?auto_133735 ?auto_133736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133743 - BLOCK
      ?auto_133744 - BLOCK
      ?auto_133745 - BLOCK
    )
    :vars
    (
      ?auto_133748 - BLOCK
      ?auto_133747 - BLOCK
      ?auto_133749 - BLOCK
      ?auto_133746 - BLOCK
      ?auto_133751 - BLOCK
      ?auto_133750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133743 ?auto_133744 ) ) ( not ( = ?auto_133743 ?auto_133745 ) ) ( not ( = ?auto_133744 ?auto_133745 ) ) ( ON ?auto_133745 ?auto_133748 ) ( not ( = ?auto_133743 ?auto_133748 ) ) ( not ( = ?auto_133744 ?auto_133748 ) ) ( not ( = ?auto_133745 ?auto_133748 ) ) ( ON-TABLE ?auto_133747 ) ( ON ?auto_133749 ?auto_133747 ) ( ON ?auto_133746 ?auto_133749 ) ( ON ?auto_133751 ?auto_133746 ) ( ON ?auto_133748 ?auto_133751 ) ( not ( = ?auto_133747 ?auto_133749 ) ) ( not ( = ?auto_133747 ?auto_133746 ) ) ( not ( = ?auto_133747 ?auto_133751 ) ) ( not ( = ?auto_133747 ?auto_133748 ) ) ( not ( = ?auto_133747 ?auto_133745 ) ) ( not ( = ?auto_133747 ?auto_133744 ) ) ( not ( = ?auto_133749 ?auto_133746 ) ) ( not ( = ?auto_133749 ?auto_133751 ) ) ( not ( = ?auto_133749 ?auto_133748 ) ) ( not ( = ?auto_133749 ?auto_133745 ) ) ( not ( = ?auto_133749 ?auto_133744 ) ) ( not ( = ?auto_133746 ?auto_133751 ) ) ( not ( = ?auto_133746 ?auto_133748 ) ) ( not ( = ?auto_133746 ?auto_133745 ) ) ( not ( = ?auto_133746 ?auto_133744 ) ) ( not ( = ?auto_133751 ?auto_133748 ) ) ( not ( = ?auto_133751 ?auto_133745 ) ) ( not ( = ?auto_133751 ?auto_133744 ) ) ( not ( = ?auto_133743 ?auto_133747 ) ) ( not ( = ?auto_133743 ?auto_133749 ) ) ( not ( = ?auto_133743 ?auto_133746 ) ) ( not ( = ?auto_133743 ?auto_133751 ) ) ( ON ?auto_133743 ?auto_133750 ) ( CLEAR ?auto_133743 ) ( not ( = ?auto_133743 ?auto_133750 ) ) ( not ( = ?auto_133744 ?auto_133750 ) ) ( not ( = ?auto_133745 ?auto_133750 ) ) ( not ( = ?auto_133748 ?auto_133750 ) ) ( not ( = ?auto_133747 ?auto_133750 ) ) ( not ( = ?auto_133749 ?auto_133750 ) ) ( not ( = ?auto_133746 ?auto_133750 ) ) ( not ( = ?auto_133751 ?auto_133750 ) ) ( HOLDING ?auto_133744 ) ( CLEAR ?auto_133745 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133747 ?auto_133749 ?auto_133746 ?auto_133751 ?auto_133748 ?auto_133745 ?auto_133744 )
      ( MAKE-3PILE ?auto_133743 ?auto_133744 ?auto_133745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133752 - BLOCK
      ?auto_133753 - BLOCK
      ?auto_133754 - BLOCK
    )
    :vars
    (
      ?auto_133756 - BLOCK
      ?auto_133757 - BLOCK
      ?auto_133755 - BLOCK
      ?auto_133760 - BLOCK
      ?auto_133758 - BLOCK
      ?auto_133759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133752 ?auto_133753 ) ) ( not ( = ?auto_133752 ?auto_133754 ) ) ( not ( = ?auto_133753 ?auto_133754 ) ) ( ON ?auto_133754 ?auto_133756 ) ( not ( = ?auto_133752 ?auto_133756 ) ) ( not ( = ?auto_133753 ?auto_133756 ) ) ( not ( = ?auto_133754 ?auto_133756 ) ) ( ON-TABLE ?auto_133757 ) ( ON ?auto_133755 ?auto_133757 ) ( ON ?auto_133760 ?auto_133755 ) ( ON ?auto_133758 ?auto_133760 ) ( ON ?auto_133756 ?auto_133758 ) ( not ( = ?auto_133757 ?auto_133755 ) ) ( not ( = ?auto_133757 ?auto_133760 ) ) ( not ( = ?auto_133757 ?auto_133758 ) ) ( not ( = ?auto_133757 ?auto_133756 ) ) ( not ( = ?auto_133757 ?auto_133754 ) ) ( not ( = ?auto_133757 ?auto_133753 ) ) ( not ( = ?auto_133755 ?auto_133760 ) ) ( not ( = ?auto_133755 ?auto_133758 ) ) ( not ( = ?auto_133755 ?auto_133756 ) ) ( not ( = ?auto_133755 ?auto_133754 ) ) ( not ( = ?auto_133755 ?auto_133753 ) ) ( not ( = ?auto_133760 ?auto_133758 ) ) ( not ( = ?auto_133760 ?auto_133756 ) ) ( not ( = ?auto_133760 ?auto_133754 ) ) ( not ( = ?auto_133760 ?auto_133753 ) ) ( not ( = ?auto_133758 ?auto_133756 ) ) ( not ( = ?auto_133758 ?auto_133754 ) ) ( not ( = ?auto_133758 ?auto_133753 ) ) ( not ( = ?auto_133752 ?auto_133757 ) ) ( not ( = ?auto_133752 ?auto_133755 ) ) ( not ( = ?auto_133752 ?auto_133760 ) ) ( not ( = ?auto_133752 ?auto_133758 ) ) ( ON ?auto_133752 ?auto_133759 ) ( not ( = ?auto_133752 ?auto_133759 ) ) ( not ( = ?auto_133753 ?auto_133759 ) ) ( not ( = ?auto_133754 ?auto_133759 ) ) ( not ( = ?auto_133756 ?auto_133759 ) ) ( not ( = ?auto_133757 ?auto_133759 ) ) ( not ( = ?auto_133755 ?auto_133759 ) ) ( not ( = ?auto_133760 ?auto_133759 ) ) ( not ( = ?auto_133758 ?auto_133759 ) ) ( CLEAR ?auto_133754 ) ( ON ?auto_133753 ?auto_133752 ) ( CLEAR ?auto_133753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133759 ?auto_133752 )
      ( MAKE-3PILE ?auto_133752 ?auto_133753 ?auto_133754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133761 - BLOCK
      ?auto_133762 - BLOCK
      ?auto_133763 - BLOCK
    )
    :vars
    (
      ?auto_133765 - BLOCK
      ?auto_133767 - BLOCK
      ?auto_133766 - BLOCK
      ?auto_133768 - BLOCK
      ?auto_133764 - BLOCK
      ?auto_133769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133761 ?auto_133762 ) ) ( not ( = ?auto_133761 ?auto_133763 ) ) ( not ( = ?auto_133762 ?auto_133763 ) ) ( not ( = ?auto_133761 ?auto_133765 ) ) ( not ( = ?auto_133762 ?auto_133765 ) ) ( not ( = ?auto_133763 ?auto_133765 ) ) ( ON-TABLE ?auto_133767 ) ( ON ?auto_133766 ?auto_133767 ) ( ON ?auto_133768 ?auto_133766 ) ( ON ?auto_133764 ?auto_133768 ) ( ON ?auto_133765 ?auto_133764 ) ( not ( = ?auto_133767 ?auto_133766 ) ) ( not ( = ?auto_133767 ?auto_133768 ) ) ( not ( = ?auto_133767 ?auto_133764 ) ) ( not ( = ?auto_133767 ?auto_133765 ) ) ( not ( = ?auto_133767 ?auto_133763 ) ) ( not ( = ?auto_133767 ?auto_133762 ) ) ( not ( = ?auto_133766 ?auto_133768 ) ) ( not ( = ?auto_133766 ?auto_133764 ) ) ( not ( = ?auto_133766 ?auto_133765 ) ) ( not ( = ?auto_133766 ?auto_133763 ) ) ( not ( = ?auto_133766 ?auto_133762 ) ) ( not ( = ?auto_133768 ?auto_133764 ) ) ( not ( = ?auto_133768 ?auto_133765 ) ) ( not ( = ?auto_133768 ?auto_133763 ) ) ( not ( = ?auto_133768 ?auto_133762 ) ) ( not ( = ?auto_133764 ?auto_133765 ) ) ( not ( = ?auto_133764 ?auto_133763 ) ) ( not ( = ?auto_133764 ?auto_133762 ) ) ( not ( = ?auto_133761 ?auto_133767 ) ) ( not ( = ?auto_133761 ?auto_133766 ) ) ( not ( = ?auto_133761 ?auto_133768 ) ) ( not ( = ?auto_133761 ?auto_133764 ) ) ( ON ?auto_133761 ?auto_133769 ) ( not ( = ?auto_133761 ?auto_133769 ) ) ( not ( = ?auto_133762 ?auto_133769 ) ) ( not ( = ?auto_133763 ?auto_133769 ) ) ( not ( = ?auto_133765 ?auto_133769 ) ) ( not ( = ?auto_133767 ?auto_133769 ) ) ( not ( = ?auto_133766 ?auto_133769 ) ) ( not ( = ?auto_133768 ?auto_133769 ) ) ( not ( = ?auto_133764 ?auto_133769 ) ) ( ON ?auto_133762 ?auto_133761 ) ( CLEAR ?auto_133762 ) ( ON-TABLE ?auto_133769 ) ( HOLDING ?auto_133763 ) ( CLEAR ?auto_133765 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133767 ?auto_133766 ?auto_133768 ?auto_133764 ?auto_133765 ?auto_133763 )
      ( MAKE-3PILE ?auto_133761 ?auto_133762 ?auto_133763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133770 - BLOCK
      ?auto_133771 - BLOCK
      ?auto_133772 - BLOCK
    )
    :vars
    (
      ?auto_133774 - BLOCK
      ?auto_133777 - BLOCK
      ?auto_133773 - BLOCK
      ?auto_133778 - BLOCK
      ?auto_133775 - BLOCK
      ?auto_133776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133770 ?auto_133771 ) ) ( not ( = ?auto_133770 ?auto_133772 ) ) ( not ( = ?auto_133771 ?auto_133772 ) ) ( not ( = ?auto_133770 ?auto_133774 ) ) ( not ( = ?auto_133771 ?auto_133774 ) ) ( not ( = ?auto_133772 ?auto_133774 ) ) ( ON-TABLE ?auto_133777 ) ( ON ?auto_133773 ?auto_133777 ) ( ON ?auto_133778 ?auto_133773 ) ( ON ?auto_133775 ?auto_133778 ) ( ON ?auto_133774 ?auto_133775 ) ( not ( = ?auto_133777 ?auto_133773 ) ) ( not ( = ?auto_133777 ?auto_133778 ) ) ( not ( = ?auto_133777 ?auto_133775 ) ) ( not ( = ?auto_133777 ?auto_133774 ) ) ( not ( = ?auto_133777 ?auto_133772 ) ) ( not ( = ?auto_133777 ?auto_133771 ) ) ( not ( = ?auto_133773 ?auto_133778 ) ) ( not ( = ?auto_133773 ?auto_133775 ) ) ( not ( = ?auto_133773 ?auto_133774 ) ) ( not ( = ?auto_133773 ?auto_133772 ) ) ( not ( = ?auto_133773 ?auto_133771 ) ) ( not ( = ?auto_133778 ?auto_133775 ) ) ( not ( = ?auto_133778 ?auto_133774 ) ) ( not ( = ?auto_133778 ?auto_133772 ) ) ( not ( = ?auto_133778 ?auto_133771 ) ) ( not ( = ?auto_133775 ?auto_133774 ) ) ( not ( = ?auto_133775 ?auto_133772 ) ) ( not ( = ?auto_133775 ?auto_133771 ) ) ( not ( = ?auto_133770 ?auto_133777 ) ) ( not ( = ?auto_133770 ?auto_133773 ) ) ( not ( = ?auto_133770 ?auto_133778 ) ) ( not ( = ?auto_133770 ?auto_133775 ) ) ( ON ?auto_133770 ?auto_133776 ) ( not ( = ?auto_133770 ?auto_133776 ) ) ( not ( = ?auto_133771 ?auto_133776 ) ) ( not ( = ?auto_133772 ?auto_133776 ) ) ( not ( = ?auto_133774 ?auto_133776 ) ) ( not ( = ?auto_133777 ?auto_133776 ) ) ( not ( = ?auto_133773 ?auto_133776 ) ) ( not ( = ?auto_133778 ?auto_133776 ) ) ( not ( = ?auto_133775 ?auto_133776 ) ) ( ON ?auto_133771 ?auto_133770 ) ( ON-TABLE ?auto_133776 ) ( CLEAR ?auto_133774 ) ( ON ?auto_133772 ?auto_133771 ) ( CLEAR ?auto_133772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133776 ?auto_133770 ?auto_133771 )
      ( MAKE-3PILE ?auto_133770 ?auto_133771 ?auto_133772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133779 - BLOCK
      ?auto_133780 - BLOCK
      ?auto_133781 - BLOCK
    )
    :vars
    (
      ?auto_133782 - BLOCK
      ?auto_133787 - BLOCK
      ?auto_133784 - BLOCK
      ?auto_133785 - BLOCK
      ?auto_133786 - BLOCK
      ?auto_133783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133779 ?auto_133780 ) ) ( not ( = ?auto_133779 ?auto_133781 ) ) ( not ( = ?auto_133780 ?auto_133781 ) ) ( not ( = ?auto_133779 ?auto_133782 ) ) ( not ( = ?auto_133780 ?auto_133782 ) ) ( not ( = ?auto_133781 ?auto_133782 ) ) ( ON-TABLE ?auto_133787 ) ( ON ?auto_133784 ?auto_133787 ) ( ON ?auto_133785 ?auto_133784 ) ( ON ?auto_133786 ?auto_133785 ) ( not ( = ?auto_133787 ?auto_133784 ) ) ( not ( = ?auto_133787 ?auto_133785 ) ) ( not ( = ?auto_133787 ?auto_133786 ) ) ( not ( = ?auto_133787 ?auto_133782 ) ) ( not ( = ?auto_133787 ?auto_133781 ) ) ( not ( = ?auto_133787 ?auto_133780 ) ) ( not ( = ?auto_133784 ?auto_133785 ) ) ( not ( = ?auto_133784 ?auto_133786 ) ) ( not ( = ?auto_133784 ?auto_133782 ) ) ( not ( = ?auto_133784 ?auto_133781 ) ) ( not ( = ?auto_133784 ?auto_133780 ) ) ( not ( = ?auto_133785 ?auto_133786 ) ) ( not ( = ?auto_133785 ?auto_133782 ) ) ( not ( = ?auto_133785 ?auto_133781 ) ) ( not ( = ?auto_133785 ?auto_133780 ) ) ( not ( = ?auto_133786 ?auto_133782 ) ) ( not ( = ?auto_133786 ?auto_133781 ) ) ( not ( = ?auto_133786 ?auto_133780 ) ) ( not ( = ?auto_133779 ?auto_133787 ) ) ( not ( = ?auto_133779 ?auto_133784 ) ) ( not ( = ?auto_133779 ?auto_133785 ) ) ( not ( = ?auto_133779 ?auto_133786 ) ) ( ON ?auto_133779 ?auto_133783 ) ( not ( = ?auto_133779 ?auto_133783 ) ) ( not ( = ?auto_133780 ?auto_133783 ) ) ( not ( = ?auto_133781 ?auto_133783 ) ) ( not ( = ?auto_133782 ?auto_133783 ) ) ( not ( = ?auto_133787 ?auto_133783 ) ) ( not ( = ?auto_133784 ?auto_133783 ) ) ( not ( = ?auto_133785 ?auto_133783 ) ) ( not ( = ?auto_133786 ?auto_133783 ) ) ( ON ?auto_133780 ?auto_133779 ) ( ON-TABLE ?auto_133783 ) ( ON ?auto_133781 ?auto_133780 ) ( CLEAR ?auto_133781 ) ( HOLDING ?auto_133782 ) ( CLEAR ?auto_133786 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133787 ?auto_133784 ?auto_133785 ?auto_133786 ?auto_133782 )
      ( MAKE-3PILE ?auto_133779 ?auto_133780 ?auto_133781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133788 - BLOCK
      ?auto_133789 - BLOCK
      ?auto_133790 - BLOCK
    )
    :vars
    (
      ?auto_133794 - BLOCK
      ?auto_133796 - BLOCK
      ?auto_133793 - BLOCK
      ?auto_133792 - BLOCK
      ?auto_133791 - BLOCK
      ?auto_133795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133788 ?auto_133789 ) ) ( not ( = ?auto_133788 ?auto_133790 ) ) ( not ( = ?auto_133789 ?auto_133790 ) ) ( not ( = ?auto_133788 ?auto_133794 ) ) ( not ( = ?auto_133789 ?auto_133794 ) ) ( not ( = ?auto_133790 ?auto_133794 ) ) ( ON-TABLE ?auto_133796 ) ( ON ?auto_133793 ?auto_133796 ) ( ON ?auto_133792 ?auto_133793 ) ( ON ?auto_133791 ?auto_133792 ) ( not ( = ?auto_133796 ?auto_133793 ) ) ( not ( = ?auto_133796 ?auto_133792 ) ) ( not ( = ?auto_133796 ?auto_133791 ) ) ( not ( = ?auto_133796 ?auto_133794 ) ) ( not ( = ?auto_133796 ?auto_133790 ) ) ( not ( = ?auto_133796 ?auto_133789 ) ) ( not ( = ?auto_133793 ?auto_133792 ) ) ( not ( = ?auto_133793 ?auto_133791 ) ) ( not ( = ?auto_133793 ?auto_133794 ) ) ( not ( = ?auto_133793 ?auto_133790 ) ) ( not ( = ?auto_133793 ?auto_133789 ) ) ( not ( = ?auto_133792 ?auto_133791 ) ) ( not ( = ?auto_133792 ?auto_133794 ) ) ( not ( = ?auto_133792 ?auto_133790 ) ) ( not ( = ?auto_133792 ?auto_133789 ) ) ( not ( = ?auto_133791 ?auto_133794 ) ) ( not ( = ?auto_133791 ?auto_133790 ) ) ( not ( = ?auto_133791 ?auto_133789 ) ) ( not ( = ?auto_133788 ?auto_133796 ) ) ( not ( = ?auto_133788 ?auto_133793 ) ) ( not ( = ?auto_133788 ?auto_133792 ) ) ( not ( = ?auto_133788 ?auto_133791 ) ) ( ON ?auto_133788 ?auto_133795 ) ( not ( = ?auto_133788 ?auto_133795 ) ) ( not ( = ?auto_133789 ?auto_133795 ) ) ( not ( = ?auto_133790 ?auto_133795 ) ) ( not ( = ?auto_133794 ?auto_133795 ) ) ( not ( = ?auto_133796 ?auto_133795 ) ) ( not ( = ?auto_133793 ?auto_133795 ) ) ( not ( = ?auto_133792 ?auto_133795 ) ) ( not ( = ?auto_133791 ?auto_133795 ) ) ( ON ?auto_133789 ?auto_133788 ) ( ON-TABLE ?auto_133795 ) ( ON ?auto_133790 ?auto_133789 ) ( CLEAR ?auto_133791 ) ( ON ?auto_133794 ?auto_133790 ) ( CLEAR ?auto_133794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133795 ?auto_133788 ?auto_133789 ?auto_133790 )
      ( MAKE-3PILE ?auto_133788 ?auto_133789 ?auto_133790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133797 - BLOCK
      ?auto_133798 - BLOCK
      ?auto_133799 - BLOCK
    )
    :vars
    (
      ?auto_133805 - BLOCK
      ?auto_133802 - BLOCK
      ?auto_133800 - BLOCK
      ?auto_133801 - BLOCK
      ?auto_133803 - BLOCK
      ?auto_133804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133797 ?auto_133798 ) ) ( not ( = ?auto_133797 ?auto_133799 ) ) ( not ( = ?auto_133798 ?auto_133799 ) ) ( not ( = ?auto_133797 ?auto_133805 ) ) ( not ( = ?auto_133798 ?auto_133805 ) ) ( not ( = ?auto_133799 ?auto_133805 ) ) ( ON-TABLE ?auto_133802 ) ( ON ?auto_133800 ?auto_133802 ) ( ON ?auto_133801 ?auto_133800 ) ( not ( = ?auto_133802 ?auto_133800 ) ) ( not ( = ?auto_133802 ?auto_133801 ) ) ( not ( = ?auto_133802 ?auto_133803 ) ) ( not ( = ?auto_133802 ?auto_133805 ) ) ( not ( = ?auto_133802 ?auto_133799 ) ) ( not ( = ?auto_133802 ?auto_133798 ) ) ( not ( = ?auto_133800 ?auto_133801 ) ) ( not ( = ?auto_133800 ?auto_133803 ) ) ( not ( = ?auto_133800 ?auto_133805 ) ) ( not ( = ?auto_133800 ?auto_133799 ) ) ( not ( = ?auto_133800 ?auto_133798 ) ) ( not ( = ?auto_133801 ?auto_133803 ) ) ( not ( = ?auto_133801 ?auto_133805 ) ) ( not ( = ?auto_133801 ?auto_133799 ) ) ( not ( = ?auto_133801 ?auto_133798 ) ) ( not ( = ?auto_133803 ?auto_133805 ) ) ( not ( = ?auto_133803 ?auto_133799 ) ) ( not ( = ?auto_133803 ?auto_133798 ) ) ( not ( = ?auto_133797 ?auto_133802 ) ) ( not ( = ?auto_133797 ?auto_133800 ) ) ( not ( = ?auto_133797 ?auto_133801 ) ) ( not ( = ?auto_133797 ?auto_133803 ) ) ( ON ?auto_133797 ?auto_133804 ) ( not ( = ?auto_133797 ?auto_133804 ) ) ( not ( = ?auto_133798 ?auto_133804 ) ) ( not ( = ?auto_133799 ?auto_133804 ) ) ( not ( = ?auto_133805 ?auto_133804 ) ) ( not ( = ?auto_133802 ?auto_133804 ) ) ( not ( = ?auto_133800 ?auto_133804 ) ) ( not ( = ?auto_133801 ?auto_133804 ) ) ( not ( = ?auto_133803 ?auto_133804 ) ) ( ON ?auto_133798 ?auto_133797 ) ( ON-TABLE ?auto_133804 ) ( ON ?auto_133799 ?auto_133798 ) ( ON ?auto_133805 ?auto_133799 ) ( CLEAR ?auto_133805 ) ( HOLDING ?auto_133803 ) ( CLEAR ?auto_133801 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133802 ?auto_133800 ?auto_133801 ?auto_133803 )
      ( MAKE-3PILE ?auto_133797 ?auto_133798 ?auto_133799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133806 - BLOCK
      ?auto_133807 - BLOCK
      ?auto_133808 - BLOCK
    )
    :vars
    (
      ?auto_133809 - BLOCK
      ?auto_133810 - BLOCK
      ?auto_133814 - BLOCK
      ?auto_133812 - BLOCK
      ?auto_133813 - BLOCK
      ?auto_133811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133806 ?auto_133807 ) ) ( not ( = ?auto_133806 ?auto_133808 ) ) ( not ( = ?auto_133807 ?auto_133808 ) ) ( not ( = ?auto_133806 ?auto_133809 ) ) ( not ( = ?auto_133807 ?auto_133809 ) ) ( not ( = ?auto_133808 ?auto_133809 ) ) ( ON-TABLE ?auto_133810 ) ( ON ?auto_133814 ?auto_133810 ) ( ON ?auto_133812 ?auto_133814 ) ( not ( = ?auto_133810 ?auto_133814 ) ) ( not ( = ?auto_133810 ?auto_133812 ) ) ( not ( = ?auto_133810 ?auto_133813 ) ) ( not ( = ?auto_133810 ?auto_133809 ) ) ( not ( = ?auto_133810 ?auto_133808 ) ) ( not ( = ?auto_133810 ?auto_133807 ) ) ( not ( = ?auto_133814 ?auto_133812 ) ) ( not ( = ?auto_133814 ?auto_133813 ) ) ( not ( = ?auto_133814 ?auto_133809 ) ) ( not ( = ?auto_133814 ?auto_133808 ) ) ( not ( = ?auto_133814 ?auto_133807 ) ) ( not ( = ?auto_133812 ?auto_133813 ) ) ( not ( = ?auto_133812 ?auto_133809 ) ) ( not ( = ?auto_133812 ?auto_133808 ) ) ( not ( = ?auto_133812 ?auto_133807 ) ) ( not ( = ?auto_133813 ?auto_133809 ) ) ( not ( = ?auto_133813 ?auto_133808 ) ) ( not ( = ?auto_133813 ?auto_133807 ) ) ( not ( = ?auto_133806 ?auto_133810 ) ) ( not ( = ?auto_133806 ?auto_133814 ) ) ( not ( = ?auto_133806 ?auto_133812 ) ) ( not ( = ?auto_133806 ?auto_133813 ) ) ( ON ?auto_133806 ?auto_133811 ) ( not ( = ?auto_133806 ?auto_133811 ) ) ( not ( = ?auto_133807 ?auto_133811 ) ) ( not ( = ?auto_133808 ?auto_133811 ) ) ( not ( = ?auto_133809 ?auto_133811 ) ) ( not ( = ?auto_133810 ?auto_133811 ) ) ( not ( = ?auto_133814 ?auto_133811 ) ) ( not ( = ?auto_133812 ?auto_133811 ) ) ( not ( = ?auto_133813 ?auto_133811 ) ) ( ON ?auto_133807 ?auto_133806 ) ( ON-TABLE ?auto_133811 ) ( ON ?auto_133808 ?auto_133807 ) ( ON ?auto_133809 ?auto_133808 ) ( CLEAR ?auto_133812 ) ( ON ?auto_133813 ?auto_133809 ) ( CLEAR ?auto_133813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133811 ?auto_133806 ?auto_133807 ?auto_133808 ?auto_133809 )
      ( MAKE-3PILE ?auto_133806 ?auto_133807 ?auto_133808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133815 - BLOCK
      ?auto_133816 - BLOCK
      ?auto_133817 - BLOCK
    )
    :vars
    (
      ?auto_133819 - BLOCK
      ?auto_133822 - BLOCK
      ?auto_133820 - BLOCK
      ?auto_133818 - BLOCK
      ?auto_133823 - BLOCK
      ?auto_133821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133815 ?auto_133816 ) ) ( not ( = ?auto_133815 ?auto_133817 ) ) ( not ( = ?auto_133816 ?auto_133817 ) ) ( not ( = ?auto_133815 ?auto_133819 ) ) ( not ( = ?auto_133816 ?auto_133819 ) ) ( not ( = ?auto_133817 ?auto_133819 ) ) ( ON-TABLE ?auto_133822 ) ( ON ?auto_133820 ?auto_133822 ) ( not ( = ?auto_133822 ?auto_133820 ) ) ( not ( = ?auto_133822 ?auto_133818 ) ) ( not ( = ?auto_133822 ?auto_133823 ) ) ( not ( = ?auto_133822 ?auto_133819 ) ) ( not ( = ?auto_133822 ?auto_133817 ) ) ( not ( = ?auto_133822 ?auto_133816 ) ) ( not ( = ?auto_133820 ?auto_133818 ) ) ( not ( = ?auto_133820 ?auto_133823 ) ) ( not ( = ?auto_133820 ?auto_133819 ) ) ( not ( = ?auto_133820 ?auto_133817 ) ) ( not ( = ?auto_133820 ?auto_133816 ) ) ( not ( = ?auto_133818 ?auto_133823 ) ) ( not ( = ?auto_133818 ?auto_133819 ) ) ( not ( = ?auto_133818 ?auto_133817 ) ) ( not ( = ?auto_133818 ?auto_133816 ) ) ( not ( = ?auto_133823 ?auto_133819 ) ) ( not ( = ?auto_133823 ?auto_133817 ) ) ( not ( = ?auto_133823 ?auto_133816 ) ) ( not ( = ?auto_133815 ?auto_133822 ) ) ( not ( = ?auto_133815 ?auto_133820 ) ) ( not ( = ?auto_133815 ?auto_133818 ) ) ( not ( = ?auto_133815 ?auto_133823 ) ) ( ON ?auto_133815 ?auto_133821 ) ( not ( = ?auto_133815 ?auto_133821 ) ) ( not ( = ?auto_133816 ?auto_133821 ) ) ( not ( = ?auto_133817 ?auto_133821 ) ) ( not ( = ?auto_133819 ?auto_133821 ) ) ( not ( = ?auto_133822 ?auto_133821 ) ) ( not ( = ?auto_133820 ?auto_133821 ) ) ( not ( = ?auto_133818 ?auto_133821 ) ) ( not ( = ?auto_133823 ?auto_133821 ) ) ( ON ?auto_133816 ?auto_133815 ) ( ON-TABLE ?auto_133821 ) ( ON ?auto_133817 ?auto_133816 ) ( ON ?auto_133819 ?auto_133817 ) ( ON ?auto_133823 ?auto_133819 ) ( CLEAR ?auto_133823 ) ( HOLDING ?auto_133818 ) ( CLEAR ?auto_133820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133822 ?auto_133820 ?auto_133818 )
      ( MAKE-3PILE ?auto_133815 ?auto_133816 ?auto_133817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133824 - BLOCK
      ?auto_133825 - BLOCK
      ?auto_133826 - BLOCK
    )
    :vars
    (
      ?auto_133832 - BLOCK
      ?auto_133827 - BLOCK
      ?auto_133828 - BLOCK
      ?auto_133830 - BLOCK
      ?auto_133829 - BLOCK
      ?auto_133831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133824 ?auto_133825 ) ) ( not ( = ?auto_133824 ?auto_133826 ) ) ( not ( = ?auto_133825 ?auto_133826 ) ) ( not ( = ?auto_133824 ?auto_133832 ) ) ( not ( = ?auto_133825 ?auto_133832 ) ) ( not ( = ?auto_133826 ?auto_133832 ) ) ( ON-TABLE ?auto_133827 ) ( ON ?auto_133828 ?auto_133827 ) ( not ( = ?auto_133827 ?auto_133828 ) ) ( not ( = ?auto_133827 ?auto_133830 ) ) ( not ( = ?auto_133827 ?auto_133829 ) ) ( not ( = ?auto_133827 ?auto_133832 ) ) ( not ( = ?auto_133827 ?auto_133826 ) ) ( not ( = ?auto_133827 ?auto_133825 ) ) ( not ( = ?auto_133828 ?auto_133830 ) ) ( not ( = ?auto_133828 ?auto_133829 ) ) ( not ( = ?auto_133828 ?auto_133832 ) ) ( not ( = ?auto_133828 ?auto_133826 ) ) ( not ( = ?auto_133828 ?auto_133825 ) ) ( not ( = ?auto_133830 ?auto_133829 ) ) ( not ( = ?auto_133830 ?auto_133832 ) ) ( not ( = ?auto_133830 ?auto_133826 ) ) ( not ( = ?auto_133830 ?auto_133825 ) ) ( not ( = ?auto_133829 ?auto_133832 ) ) ( not ( = ?auto_133829 ?auto_133826 ) ) ( not ( = ?auto_133829 ?auto_133825 ) ) ( not ( = ?auto_133824 ?auto_133827 ) ) ( not ( = ?auto_133824 ?auto_133828 ) ) ( not ( = ?auto_133824 ?auto_133830 ) ) ( not ( = ?auto_133824 ?auto_133829 ) ) ( ON ?auto_133824 ?auto_133831 ) ( not ( = ?auto_133824 ?auto_133831 ) ) ( not ( = ?auto_133825 ?auto_133831 ) ) ( not ( = ?auto_133826 ?auto_133831 ) ) ( not ( = ?auto_133832 ?auto_133831 ) ) ( not ( = ?auto_133827 ?auto_133831 ) ) ( not ( = ?auto_133828 ?auto_133831 ) ) ( not ( = ?auto_133830 ?auto_133831 ) ) ( not ( = ?auto_133829 ?auto_133831 ) ) ( ON ?auto_133825 ?auto_133824 ) ( ON-TABLE ?auto_133831 ) ( ON ?auto_133826 ?auto_133825 ) ( ON ?auto_133832 ?auto_133826 ) ( ON ?auto_133829 ?auto_133832 ) ( CLEAR ?auto_133828 ) ( ON ?auto_133830 ?auto_133829 ) ( CLEAR ?auto_133830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133831 ?auto_133824 ?auto_133825 ?auto_133826 ?auto_133832 ?auto_133829 )
      ( MAKE-3PILE ?auto_133824 ?auto_133825 ?auto_133826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133833 - BLOCK
      ?auto_133834 - BLOCK
      ?auto_133835 - BLOCK
    )
    :vars
    (
      ?auto_133838 - BLOCK
      ?auto_133836 - BLOCK
      ?auto_133837 - BLOCK
      ?auto_133841 - BLOCK
      ?auto_133839 - BLOCK
      ?auto_133840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133833 ?auto_133834 ) ) ( not ( = ?auto_133833 ?auto_133835 ) ) ( not ( = ?auto_133834 ?auto_133835 ) ) ( not ( = ?auto_133833 ?auto_133838 ) ) ( not ( = ?auto_133834 ?auto_133838 ) ) ( not ( = ?auto_133835 ?auto_133838 ) ) ( ON-TABLE ?auto_133836 ) ( not ( = ?auto_133836 ?auto_133837 ) ) ( not ( = ?auto_133836 ?auto_133841 ) ) ( not ( = ?auto_133836 ?auto_133839 ) ) ( not ( = ?auto_133836 ?auto_133838 ) ) ( not ( = ?auto_133836 ?auto_133835 ) ) ( not ( = ?auto_133836 ?auto_133834 ) ) ( not ( = ?auto_133837 ?auto_133841 ) ) ( not ( = ?auto_133837 ?auto_133839 ) ) ( not ( = ?auto_133837 ?auto_133838 ) ) ( not ( = ?auto_133837 ?auto_133835 ) ) ( not ( = ?auto_133837 ?auto_133834 ) ) ( not ( = ?auto_133841 ?auto_133839 ) ) ( not ( = ?auto_133841 ?auto_133838 ) ) ( not ( = ?auto_133841 ?auto_133835 ) ) ( not ( = ?auto_133841 ?auto_133834 ) ) ( not ( = ?auto_133839 ?auto_133838 ) ) ( not ( = ?auto_133839 ?auto_133835 ) ) ( not ( = ?auto_133839 ?auto_133834 ) ) ( not ( = ?auto_133833 ?auto_133836 ) ) ( not ( = ?auto_133833 ?auto_133837 ) ) ( not ( = ?auto_133833 ?auto_133841 ) ) ( not ( = ?auto_133833 ?auto_133839 ) ) ( ON ?auto_133833 ?auto_133840 ) ( not ( = ?auto_133833 ?auto_133840 ) ) ( not ( = ?auto_133834 ?auto_133840 ) ) ( not ( = ?auto_133835 ?auto_133840 ) ) ( not ( = ?auto_133838 ?auto_133840 ) ) ( not ( = ?auto_133836 ?auto_133840 ) ) ( not ( = ?auto_133837 ?auto_133840 ) ) ( not ( = ?auto_133841 ?auto_133840 ) ) ( not ( = ?auto_133839 ?auto_133840 ) ) ( ON ?auto_133834 ?auto_133833 ) ( ON-TABLE ?auto_133840 ) ( ON ?auto_133835 ?auto_133834 ) ( ON ?auto_133838 ?auto_133835 ) ( ON ?auto_133839 ?auto_133838 ) ( ON ?auto_133841 ?auto_133839 ) ( CLEAR ?auto_133841 ) ( HOLDING ?auto_133837 ) ( CLEAR ?auto_133836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133836 ?auto_133837 )
      ( MAKE-3PILE ?auto_133833 ?auto_133834 ?auto_133835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133842 - BLOCK
      ?auto_133843 - BLOCK
      ?auto_133844 - BLOCK
    )
    :vars
    (
      ?auto_133849 - BLOCK
      ?auto_133846 - BLOCK
      ?auto_133845 - BLOCK
      ?auto_133848 - BLOCK
      ?auto_133850 - BLOCK
      ?auto_133847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133842 ?auto_133843 ) ) ( not ( = ?auto_133842 ?auto_133844 ) ) ( not ( = ?auto_133843 ?auto_133844 ) ) ( not ( = ?auto_133842 ?auto_133849 ) ) ( not ( = ?auto_133843 ?auto_133849 ) ) ( not ( = ?auto_133844 ?auto_133849 ) ) ( ON-TABLE ?auto_133846 ) ( not ( = ?auto_133846 ?auto_133845 ) ) ( not ( = ?auto_133846 ?auto_133848 ) ) ( not ( = ?auto_133846 ?auto_133850 ) ) ( not ( = ?auto_133846 ?auto_133849 ) ) ( not ( = ?auto_133846 ?auto_133844 ) ) ( not ( = ?auto_133846 ?auto_133843 ) ) ( not ( = ?auto_133845 ?auto_133848 ) ) ( not ( = ?auto_133845 ?auto_133850 ) ) ( not ( = ?auto_133845 ?auto_133849 ) ) ( not ( = ?auto_133845 ?auto_133844 ) ) ( not ( = ?auto_133845 ?auto_133843 ) ) ( not ( = ?auto_133848 ?auto_133850 ) ) ( not ( = ?auto_133848 ?auto_133849 ) ) ( not ( = ?auto_133848 ?auto_133844 ) ) ( not ( = ?auto_133848 ?auto_133843 ) ) ( not ( = ?auto_133850 ?auto_133849 ) ) ( not ( = ?auto_133850 ?auto_133844 ) ) ( not ( = ?auto_133850 ?auto_133843 ) ) ( not ( = ?auto_133842 ?auto_133846 ) ) ( not ( = ?auto_133842 ?auto_133845 ) ) ( not ( = ?auto_133842 ?auto_133848 ) ) ( not ( = ?auto_133842 ?auto_133850 ) ) ( ON ?auto_133842 ?auto_133847 ) ( not ( = ?auto_133842 ?auto_133847 ) ) ( not ( = ?auto_133843 ?auto_133847 ) ) ( not ( = ?auto_133844 ?auto_133847 ) ) ( not ( = ?auto_133849 ?auto_133847 ) ) ( not ( = ?auto_133846 ?auto_133847 ) ) ( not ( = ?auto_133845 ?auto_133847 ) ) ( not ( = ?auto_133848 ?auto_133847 ) ) ( not ( = ?auto_133850 ?auto_133847 ) ) ( ON ?auto_133843 ?auto_133842 ) ( ON-TABLE ?auto_133847 ) ( ON ?auto_133844 ?auto_133843 ) ( ON ?auto_133849 ?auto_133844 ) ( ON ?auto_133850 ?auto_133849 ) ( ON ?auto_133848 ?auto_133850 ) ( CLEAR ?auto_133846 ) ( ON ?auto_133845 ?auto_133848 ) ( CLEAR ?auto_133845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133847 ?auto_133842 ?auto_133843 ?auto_133844 ?auto_133849 ?auto_133850 ?auto_133848 )
      ( MAKE-3PILE ?auto_133842 ?auto_133843 ?auto_133844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133851 - BLOCK
      ?auto_133852 - BLOCK
      ?auto_133853 - BLOCK
    )
    :vars
    (
      ?auto_133857 - BLOCK
      ?auto_133854 - BLOCK
      ?auto_133859 - BLOCK
      ?auto_133855 - BLOCK
      ?auto_133856 - BLOCK
      ?auto_133858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133851 ?auto_133852 ) ) ( not ( = ?auto_133851 ?auto_133853 ) ) ( not ( = ?auto_133852 ?auto_133853 ) ) ( not ( = ?auto_133851 ?auto_133857 ) ) ( not ( = ?auto_133852 ?auto_133857 ) ) ( not ( = ?auto_133853 ?auto_133857 ) ) ( not ( = ?auto_133854 ?auto_133859 ) ) ( not ( = ?auto_133854 ?auto_133855 ) ) ( not ( = ?auto_133854 ?auto_133856 ) ) ( not ( = ?auto_133854 ?auto_133857 ) ) ( not ( = ?auto_133854 ?auto_133853 ) ) ( not ( = ?auto_133854 ?auto_133852 ) ) ( not ( = ?auto_133859 ?auto_133855 ) ) ( not ( = ?auto_133859 ?auto_133856 ) ) ( not ( = ?auto_133859 ?auto_133857 ) ) ( not ( = ?auto_133859 ?auto_133853 ) ) ( not ( = ?auto_133859 ?auto_133852 ) ) ( not ( = ?auto_133855 ?auto_133856 ) ) ( not ( = ?auto_133855 ?auto_133857 ) ) ( not ( = ?auto_133855 ?auto_133853 ) ) ( not ( = ?auto_133855 ?auto_133852 ) ) ( not ( = ?auto_133856 ?auto_133857 ) ) ( not ( = ?auto_133856 ?auto_133853 ) ) ( not ( = ?auto_133856 ?auto_133852 ) ) ( not ( = ?auto_133851 ?auto_133854 ) ) ( not ( = ?auto_133851 ?auto_133859 ) ) ( not ( = ?auto_133851 ?auto_133855 ) ) ( not ( = ?auto_133851 ?auto_133856 ) ) ( ON ?auto_133851 ?auto_133858 ) ( not ( = ?auto_133851 ?auto_133858 ) ) ( not ( = ?auto_133852 ?auto_133858 ) ) ( not ( = ?auto_133853 ?auto_133858 ) ) ( not ( = ?auto_133857 ?auto_133858 ) ) ( not ( = ?auto_133854 ?auto_133858 ) ) ( not ( = ?auto_133859 ?auto_133858 ) ) ( not ( = ?auto_133855 ?auto_133858 ) ) ( not ( = ?auto_133856 ?auto_133858 ) ) ( ON ?auto_133852 ?auto_133851 ) ( ON-TABLE ?auto_133858 ) ( ON ?auto_133853 ?auto_133852 ) ( ON ?auto_133857 ?auto_133853 ) ( ON ?auto_133856 ?auto_133857 ) ( ON ?auto_133855 ?auto_133856 ) ( ON ?auto_133859 ?auto_133855 ) ( CLEAR ?auto_133859 ) ( HOLDING ?auto_133854 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133854 )
      ( MAKE-3PILE ?auto_133851 ?auto_133852 ?auto_133853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133860 - BLOCK
      ?auto_133861 - BLOCK
      ?auto_133862 - BLOCK
    )
    :vars
    (
      ?auto_133866 - BLOCK
      ?auto_133863 - BLOCK
      ?auto_133865 - BLOCK
      ?auto_133864 - BLOCK
      ?auto_133868 - BLOCK
      ?auto_133867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133860 ?auto_133861 ) ) ( not ( = ?auto_133860 ?auto_133862 ) ) ( not ( = ?auto_133861 ?auto_133862 ) ) ( not ( = ?auto_133860 ?auto_133866 ) ) ( not ( = ?auto_133861 ?auto_133866 ) ) ( not ( = ?auto_133862 ?auto_133866 ) ) ( not ( = ?auto_133863 ?auto_133865 ) ) ( not ( = ?auto_133863 ?auto_133864 ) ) ( not ( = ?auto_133863 ?auto_133868 ) ) ( not ( = ?auto_133863 ?auto_133866 ) ) ( not ( = ?auto_133863 ?auto_133862 ) ) ( not ( = ?auto_133863 ?auto_133861 ) ) ( not ( = ?auto_133865 ?auto_133864 ) ) ( not ( = ?auto_133865 ?auto_133868 ) ) ( not ( = ?auto_133865 ?auto_133866 ) ) ( not ( = ?auto_133865 ?auto_133862 ) ) ( not ( = ?auto_133865 ?auto_133861 ) ) ( not ( = ?auto_133864 ?auto_133868 ) ) ( not ( = ?auto_133864 ?auto_133866 ) ) ( not ( = ?auto_133864 ?auto_133862 ) ) ( not ( = ?auto_133864 ?auto_133861 ) ) ( not ( = ?auto_133868 ?auto_133866 ) ) ( not ( = ?auto_133868 ?auto_133862 ) ) ( not ( = ?auto_133868 ?auto_133861 ) ) ( not ( = ?auto_133860 ?auto_133863 ) ) ( not ( = ?auto_133860 ?auto_133865 ) ) ( not ( = ?auto_133860 ?auto_133864 ) ) ( not ( = ?auto_133860 ?auto_133868 ) ) ( ON ?auto_133860 ?auto_133867 ) ( not ( = ?auto_133860 ?auto_133867 ) ) ( not ( = ?auto_133861 ?auto_133867 ) ) ( not ( = ?auto_133862 ?auto_133867 ) ) ( not ( = ?auto_133866 ?auto_133867 ) ) ( not ( = ?auto_133863 ?auto_133867 ) ) ( not ( = ?auto_133865 ?auto_133867 ) ) ( not ( = ?auto_133864 ?auto_133867 ) ) ( not ( = ?auto_133868 ?auto_133867 ) ) ( ON ?auto_133861 ?auto_133860 ) ( ON-TABLE ?auto_133867 ) ( ON ?auto_133862 ?auto_133861 ) ( ON ?auto_133866 ?auto_133862 ) ( ON ?auto_133868 ?auto_133866 ) ( ON ?auto_133864 ?auto_133868 ) ( ON ?auto_133865 ?auto_133864 ) ( ON ?auto_133863 ?auto_133865 ) ( CLEAR ?auto_133863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133867 ?auto_133860 ?auto_133861 ?auto_133862 ?auto_133866 ?auto_133868 ?auto_133864 ?auto_133865 )
      ( MAKE-3PILE ?auto_133860 ?auto_133861 ?auto_133862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133892 - BLOCK
      ?auto_133893 - BLOCK
      ?auto_133894 - BLOCK
      ?auto_133895 - BLOCK
    )
    :vars
    (
      ?auto_133896 - BLOCK
      ?auto_133897 - BLOCK
      ?auto_133898 - BLOCK
      ?auto_133899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133896 ?auto_133895 ) ( ON-TABLE ?auto_133892 ) ( ON ?auto_133893 ?auto_133892 ) ( ON ?auto_133894 ?auto_133893 ) ( ON ?auto_133895 ?auto_133894 ) ( not ( = ?auto_133892 ?auto_133893 ) ) ( not ( = ?auto_133892 ?auto_133894 ) ) ( not ( = ?auto_133892 ?auto_133895 ) ) ( not ( = ?auto_133892 ?auto_133896 ) ) ( not ( = ?auto_133893 ?auto_133894 ) ) ( not ( = ?auto_133893 ?auto_133895 ) ) ( not ( = ?auto_133893 ?auto_133896 ) ) ( not ( = ?auto_133894 ?auto_133895 ) ) ( not ( = ?auto_133894 ?auto_133896 ) ) ( not ( = ?auto_133895 ?auto_133896 ) ) ( not ( = ?auto_133892 ?auto_133897 ) ) ( not ( = ?auto_133892 ?auto_133898 ) ) ( not ( = ?auto_133893 ?auto_133897 ) ) ( not ( = ?auto_133893 ?auto_133898 ) ) ( not ( = ?auto_133894 ?auto_133897 ) ) ( not ( = ?auto_133894 ?auto_133898 ) ) ( not ( = ?auto_133895 ?auto_133897 ) ) ( not ( = ?auto_133895 ?auto_133898 ) ) ( not ( = ?auto_133896 ?auto_133897 ) ) ( not ( = ?auto_133896 ?auto_133898 ) ) ( not ( = ?auto_133897 ?auto_133898 ) ) ( ON ?auto_133897 ?auto_133896 ) ( CLEAR ?auto_133897 ) ( HOLDING ?auto_133898 ) ( CLEAR ?auto_133899 ) ( ON-TABLE ?auto_133899 ) ( not ( = ?auto_133899 ?auto_133898 ) ) ( not ( = ?auto_133892 ?auto_133899 ) ) ( not ( = ?auto_133893 ?auto_133899 ) ) ( not ( = ?auto_133894 ?auto_133899 ) ) ( not ( = ?auto_133895 ?auto_133899 ) ) ( not ( = ?auto_133896 ?auto_133899 ) ) ( not ( = ?auto_133897 ?auto_133899 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133899 ?auto_133898 )
      ( MAKE-4PILE ?auto_133892 ?auto_133893 ?auto_133894 ?auto_133895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133900 - BLOCK
      ?auto_133901 - BLOCK
      ?auto_133902 - BLOCK
      ?auto_133903 - BLOCK
    )
    :vars
    (
      ?auto_133904 - BLOCK
      ?auto_133906 - BLOCK
      ?auto_133907 - BLOCK
      ?auto_133905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133904 ?auto_133903 ) ( ON-TABLE ?auto_133900 ) ( ON ?auto_133901 ?auto_133900 ) ( ON ?auto_133902 ?auto_133901 ) ( ON ?auto_133903 ?auto_133902 ) ( not ( = ?auto_133900 ?auto_133901 ) ) ( not ( = ?auto_133900 ?auto_133902 ) ) ( not ( = ?auto_133900 ?auto_133903 ) ) ( not ( = ?auto_133900 ?auto_133904 ) ) ( not ( = ?auto_133901 ?auto_133902 ) ) ( not ( = ?auto_133901 ?auto_133903 ) ) ( not ( = ?auto_133901 ?auto_133904 ) ) ( not ( = ?auto_133902 ?auto_133903 ) ) ( not ( = ?auto_133902 ?auto_133904 ) ) ( not ( = ?auto_133903 ?auto_133904 ) ) ( not ( = ?auto_133900 ?auto_133906 ) ) ( not ( = ?auto_133900 ?auto_133907 ) ) ( not ( = ?auto_133901 ?auto_133906 ) ) ( not ( = ?auto_133901 ?auto_133907 ) ) ( not ( = ?auto_133902 ?auto_133906 ) ) ( not ( = ?auto_133902 ?auto_133907 ) ) ( not ( = ?auto_133903 ?auto_133906 ) ) ( not ( = ?auto_133903 ?auto_133907 ) ) ( not ( = ?auto_133904 ?auto_133906 ) ) ( not ( = ?auto_133904 ?auto_133907 ) ) ( not ( = ?auto_133906 ?auto_133907 ) ) ( ON ?auto_133906 ?auto_133904 ) ( CLEAR ?auto_133905 ) ( ON-TABLE ?auto_133905 ) ( not ( = ?auto_133905 ?auto_133907 ) ) ( not ( = ?auto_133900 ?auto_133905 ) ) ( not ( = ?auto_133901 ?auto_133905 ) ) ( not ( = ?auto_133902 ?auto_133905 ) ) ( not ( = ?auto_133903 ?auto_133905 ) ) ( not ( = ?auto_133904 ?auto_133905 ) ) ( not ( = ?auto_133906 ?auto_133905 ) ) ( ON ?auto_133907 ?auto_133906 ) ( CLEAR ?auto_133907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133900 ?auto_133901 ?auto_133902 ?auto_133903 ?auto_133904 ?auto_133906 )
      ( MAKE-4PILE ?auto_133900 ?auto_133901 ?auto_133902 ?auto_133903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133908 - BLOCK
      ?auto_133909 - BLOCK
      ?auto_133910 - BLOCK
      ?auto_133911 - BLOCK
    )
    :vars
    (
      ?auto_133914 - BLOCK
      ?auto_133915 - BLOCK
      ?auto_133912 - BLOCK
      ?auto_133913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133914 ?auto_133911 ) ( ON-TABLE ?auto_133908 ) ( ON ?auto_133909 ?auto_133908 ) ( ON ?auto_133910 ?auto_133909 ) ( ON ?auto_133911 ?auto_133910 ) ( not ( = ?auto_133908 ?auto_133909 ) ) ( not ( = ?auto_133908 ?auto_133910 ) ) ( not ( = ?auto_133908 ?auto_133911 ) ) ( not ( = ?auto_133908 ?auto_133914 ) ) ( not ( = ?auto_133909 ?auto_133910 ) ) ( not ( = ?auto_133909 ?auto_133911 ) ) ( not ( = ?auto_133909 ?auto_133914 ) ) ( not ( = ?auto_133910 ?auto_133911 ) ) ( not ( = ?auto_133910 ?auto_133914 ) ) ( not ( = ?auto_133911 ?auto_133914 ) ) ( not ( = ?auto_133908 ?auto_133915 ) ) ( not ( = ?auto_133908 ?auto_133912 ) ) ( not ( = ?auto_133909 ?auto_133915 ) ) ( not ( = ?auto_133909 ?auto_133912 ) ) ( not ( = ?auto_133910 ?auto_133915 ) ) ( not ( = ?auto_133910 ?auto_133912 ) ) ( not ( = ?auto_133911 ?auto_133915 ) ) ( not ( = ?auto_133911 ?auto_133912 ) ) ( not ( = ?auto_133914 ?auto_133915 ) ) ( not ( = ?auto_133914 ?auto_133912 ) ) ( not ( = ?auto_133915 ?auto_133912 ) ) ( ON ?auto_133915 ?auto_133914 ) ( not ( = ?auto_133913 ?auto_133912 ) ) ( not ( = ?auto_133908 ?auto_133913 ) ) ( not ( = ?auto_133909 ?auto_133913 ) ) ( not ( = ?auto_133910 ?auto_133913 ) ) ( not ( = ?auto_133911 ?auto_133913 ) ) ( not ( = ?auto_133914 ?auto_133913 ) ) ( not ( = ?auto_133915 ?auto_133913 ) ) ( ON ?auto_133912 ?auto_133915 ) ( CLEAR ?auto_133912 ) ( HOLDING ?auto_133913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133913 )
      ( MAKE-4PILE ?auto_133908 ?auto_133909 ?auto_133910 ?auto_133911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133928 - BLOCK
      ?auto_133929 - BLOCK
      ?auto_133930 - BLOCK
      ?auto_133931 - BLOCK
    )
    :vars
    (
      ?auto_133933 - BLOCK
      ?auto_133934 - BLOCK
      ?auto_133932 - BLOCK
      ?auto_133935 - BLOCK
      ?auto_133936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133933 ?auto_133931 ) ( ON-TABLE ?auto_133928 ) ( ON ?auto_133929 ?auto_133928 ) ( ON ?auto_133930 ?auto_133929 ) ( ON ?auto_133931 ?auto_133930 ) ( not ( = ?auto_133928 ?auto_133929 ) ) ( not ( = ?auto_133928 ?auto_133930 ) ) ( not ( = ?auto_133928 ?auto_133931 ) ) ( not ( = ?auto_133928 ?auto_133933 ) ) ( not ( = ?auto_133929 ?auto_133930 ) ) ( not ( = ?auto_133929 ?auto_133931 ) ) ( not ( = ?auto_133929 ?auto_133933 ) ) ( not ( = ?auto_133930 ?auto_133931 ) ) ( not ( = ?auto_133930 ?auto_133933 ) ) ( not ( = ?auto_133931 ?auto_133933 ) ) ( not ( = ?auto_133928 ?auto_133934 ) ) ( not ( = ?auto_133928 ?auto_133932 ) ) ( not ( = ?auto_133929 ?auto_133934 ) ) ( not ( = ?auto_133929 ?auto_133932 ) ) ( not ( = ?auto_133930 ?auto_133934 ) ) ( not ( = ?auto_133930 ?auto_133932 ) ) ( not ( = ?auto_133931 ?auto_133934 ) ) ( not ( = ?auto_133931 ?auto_133932 ) ) ( not ( = ?auto_133933 ?auto_133934 ) ) ( not ( = ?auto_133933 ?auto_133932 ) ) ( not ( = ?auto_133934 ?auto_133932 ) ) ( ON ?auto_133934 ?auto_133933 ) ( not ( = ?auto_133935 ?auto_133932 ) ) ( not ( = ?auto_133928 ?auto_133935 ) ) ( not ( = ?auto_133929 ?auto_133935 ) ) ( not ( = ?auto_133930 ?auto_133935 ) ) ( not ( = ?auto_133931 ?auto_133935 ) ) ( not ( = ?auto_133933 ?auto_133935 ) ) ( not ( = ?auto_133934 ?auto_133935 ) ) ( ON ?auto_133932 ?auto_133934 ) ( CLEAR ?auto_133932 ) ( ON ?auto_133935 ?auto_133936 ) ( CLEAR ?auto_133935 ) ( HAND-EMPTY ) ( not ( = ?auto_133928 ?auto_133936 ) ) ( not ( = ?auto_133929 ?auto_133936 ) ) ( not ( = ?auto_133930 ?auto_133936 ) ) ( not ( = ?auto_133931 ?auto_133936 ) ) ( not ( = ?auto_133933 ?auto_133936 ) ) ( not ( = ?auto_133934 ?auto_133936 ) ) ( not ( = ?auto_133932 ?auto_133936 ) ) ( not ( = ?auto_133935 ?auto_133936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133935 ?auto_133936 )
      ( MAKE-4PILE ?auto_133928 ?auto_133929 ?auto_133930 ?auto_133931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133937 - BLOCK
      ?auto_133938 - BLOCK
      ?auto_133939 - BLOCK
      ?auto_133940 - BLOCK
    )
    :vars
    (
      ?auto_133941 - BLOCK
      ?auto_133944 - BLOCK
      ?auto_133945 - BLOCK
      ?auto_133942 - BLOCK
      ?auto_133943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133941 ?auto_133940 ) ( ON-TABLE ?auto_133937 ) ( ON ?auto_133938 ?auto_133937 ) ( ON ?auto_133939 ?auto_133938 ) ( ON ?auto_133940 ?auto_133939 ) ( not ( = ?auto_133937 ?auto_133938 ) ) ( not ( = ?auto_133937 ?auto_133939 ) ) ( not ( = ?auto_133937 ?auto_133940 ) ) ( not ( = ?auto_133937 ?auto_133941 ) ) ( not ( = ?auto_133938 ?auto_133939 ) ) ( not ( = ?auto_133938 ?auto_133940 ) ) ( not ( = ?auto_133938 ?auto_133941 ) ) ( not ( = ?auto_133939 ?auto_133940 ) ) ( not ( = ?auto_133939 ?auto_133941 ) ) ( not ( = ?auto_133940 ?auto_133941 ) ) ( not ( = ?auto_133937 ?auto_133944 ) ) ( not ( = ?auto_133937 ?auto_133945 ) ) ( not ( = ?auto_133938 ?auto_133944 ) ) ( not ( = ?auto_133938 ?auto_133945 ) ) ( not ( = ?auto_133939 ?auto_133944 ) ) ( not ( = ?auto_133939 ?auto_133945 ) ) ( not ( = ?auto_133940 ?auto_133944 ) ) ( not ( = ?auto_133940 ?auto_133945 ) ) ( not ( = ?auto_133941 ?auto_133944 ) ) ( not ( = ?auto_133941 ?auto_133945 ) ) ( not ( = ?auto_133944 ?auto_133945 ) ) ( ON ?auto_133944 ?auto_133941 ) ( not ( = ?auto_133942 ?auto_133945 ) ) ( not ( = ?auto_133937 ?auto_133942 ) ) ( not ( = ?auto_133938 ?auto_133942 ) ) ( not ( = ?auto_133939 ?auto_133942 ) ) ( not ( = ?auto_133940 ?auto_133942 ) ) ( not ( = ?auto_133941 ?auto_133942 ) ) ( not ( = ?auto_133944 ?auto_133942 ) ) ( ON ?auto_133942 ?auto_133943 ) ( CLEAR ?auto_133942 ) ( not ( = ?auto_133937 ?auto_133943 ) ) ( not ( = ?auto_133938 ?auto_133943 ) ) ( not ( = ?auto_133939 ?auto_133943 ) ) ( not ( = ?auto_133940 ?auto_133943 ) ) ( not ( = ?auto_133941 ?auto_133943 ) ) ( not ( = ?auto_133944 ?auto_133943 ) ) ( not ( = ?auto_133945 ?auto_133943 ) ) ( not ( = ?auto_133942 ?auto_133943 ) ) ( HOLDING ?auto_133945 ) ( CLEAR ?auto_133944 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133937 ?auto_133938 ?auto_133939 ?auto_133940 ?auto_133941 ?auto_133944 ?auto_133945 )
      ( MAKE-4PILE ?auto_133937 ?auto_133938 ?auto_133939 ?auto_133940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134019 - BLOCK
      ?auto_134020 - BLOCK
      ?auto_134021 - BLOCK
      ?auto_134022 - BLOCK
    )
    :vars
    (
      ?auto_134023 - BLOCK
      ?auto_134026 - BLOCK
      ?auto_134025 - BLOCK
      ?auto_134024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134019 ) ( ON ?auto_134020 ?auto_134019 ) ( not ( = ?auto_134019 ?auto_134020 ) ) ( not ( = ?auto_134019 ?auto_134021 ) ) ( not ( = ?auto_134019 ?auto_134022 ) ) ( not ( = ?auto_134020 ?auto_134021 ) ) ( not ( = ?auto_134020 ?auto_134022 ) ) ( not ( = ?auto_134021 ?auto_134022 ) ) ( ON ?auto_134022 ?auto_134023 ) ( not ( = ?auto_134019 ?auto_134023 ) ) ( not ( = ?auto_134020 ?auto_134023 ) ) ( not ( = ?auto_134021 ?auto_134023 ) ) ( not ( = ?auto_134022 ?auto_134023 ) ) ( CLEAR ?auto_134020 ) ( ON ?auto_134021 ?auto_134022 ) ( CLEAR ?auto_134021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134026 ) ( ON ?auto_134025 ?auto_134026 ) ( ON ?auto_134024 ?auto_134025 ) ( ON ?auto_134023 ?auto_134024 ) ( not ( = ?auto_134026 ?auto_134025 ) ) ( not ( = ?auto_134026 ?auto_134024 ) ) ( not ( = ?auto_134026 ?auto_134023 ) ) ( not ( = ?auto_134026 ?auto_134022 ) ) ( not ( = ?auto_134026 ?auto_134021 ) ) ( not ( = ?auto_134025 ?auto_134024 ) ) ( not ( = ?auto_134025 ?auto_134023 ) ) ( not ( = ?auto_134025 ?auto_134022 ) ) ( not ( = ?auto_134025 ?auto_134021 ) ) ( not ( = ?auto_134024 ?auto_134023 ) ) ( not ( = ?auto_134024 ?auto_134022 ) ) ( not ( = ?auto_134024 ?auto_134021 ) ) ( not ( = ?auto_134019 ?auto_134026 ) ) ( not ( = ?auto_134019 ?auto_134025 ) ) ( not ( = ?auto_134019 ?auto_134024 ) ) ( not ( = ?auto_134020 ?auto_134026 ) ) ( not ( = ?auto_134020 ?auto_134025 ) ) ( not ( = ?auto_134020 ?auto_134024 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134026 ?auto_134025 ?auto_134024 ?auto_134023 ?auto_134022 )
      ( MAKE-4PILE ?auto_134019 ?auto_134020 ?auto_134021 ?auto_134022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134027 - BLOCK
      ?auto_134028 - BLOCK
      ?auto_134029 - BLOCK
      ?auto_134030 - BLOCK
    )
    :vars
    (
      ?auto_134033 - BLOCK
      ?auto_134034 - BLOCK
      ?auto_134031 - BLOCK
      ?auto_134032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134027 ) ( not ( = ?auto_134027 ?auto_134028 ) ) ( not ( = ?auto_134027 ?auto_134029 ) ) ( not ( = ?auto_134027 ?auto_134030 ) ) ( not ( = ?auto_134028 ?auto_134029 ) ) ( not ( = ?auto_134028 ?auto_134030 ) ) ( not ( = ?auto_134029 ?auto_134030 ) ) ( ON ?auto_134030 ?auto_134033 ) ( not ( = ?auto_134027 ?auto_134033 ) ) ( not ( = ?auto_134028 ?auto_134033 ) ) ( not ( = ?auto_134029 ?auto_134033 ) ) ( not ( = ?auto_134030 ?auto_134033 ) ) ( ON ?auto_134029 ?auto_134030 ) ( CLEAR ?auto_134029 ) ( ON-TABLE ?auto_134034 ) ( ON ?auto_134031 ?auto_134034 ) ( ON ?auto_134032 ?auto_134031 ) ( ON ?auto_134033 ?auto_134032 ) ( not ( = ?auto_134034 ?auto_134031 ) ) ( not ( = ?auto_134034 ?auto_134032 ) ) ( not ( = ?auto_134034 ?auto_134033 ) ) ( not ( = ?auto_134034 ?auto_134030 ) ) ( not ( = ?auto_134034 ?auto_134029 ) ) ( not ( = ?auto_134031 ?auto_134032 ) ) ( not ( = ?auto_134031 ?auto_134033 ) ) ( not ( = ?auto_134031 ?auto_134030 ) ) ( not ( = ?auto_134031 ?auto_134029 ) ) ( not ( = ?auto_134032 ?auto_134033 ) ) ( not ( = ?auto_134032 ?auto_134030 ) ) ( not ( = ?auto_134032 ?auto_134029 ) ) ( not ( = ?auto_134027 ?auto_134034 ) ) ( not ( = ?auto_134027 ?auto_134031 ) ) ( not ( = ?auto_134027 ?auto_134032 ) ) ( not ( = ?auto_134028 ?auto_134034 ) ) ( not ( = ?auto_134028 ?auto_134031 ) ) ( not ( = ?auto_134028 ?auto_134032 ) ) ( HOLDING ?auto_134028 ) ( CLEAR ?auto_134027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134027 ?auto_134028 )
      ( MAKE-4PILE ?auto_134027 ?auto_134028 ?auto_134029 ?auto_134030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134035 - BLOCK
      ?auto_134036 - BLOCK
      ?auto_134037 - BLOCK
      ?auto_134038 - BLOCK
    )
    :vars
    (
      ?auto_134041 - BLOCK
      ?auto_134042 - BLOCK
      ?auto_134040 - BLOCK
      ?auto_134039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134035 ) ( not ( = ?auto_134035 ?auto_134036 ) ) ( not ( = ?auto_134035 ?auto_134037 ) ) ( not ( = ?auto_134035 ?auto_134038 ) ) ( not ( = ?auto_134036 ?auto_134037 ) ) ( not ( = ?auto_134036 ?auto_134038 ) ) ( not ( = ?auto_134037 ?auto_134038 ) ) ( ON ?auto_134038 ?auto_134041 ) ( not ( = ?auto_134035 ?auto_134041 ) ) ( not ( = ?auto_134036 ?auto_134041 ) ) ( not ( = ?auto_134037 ?auto_134041 ) ) ( not ( = ?auto_134038 ?auto_134041 ) ) ( ON ?auto_134037 ?auto_134038 ) ( ON-TABLE ?auto_134042 ) ( ON ?auto_134040 ?auto_134042 ) ( ON ?auto_134039 ?auto_134040 ) ( ON ?auto_134041 ?auto_134039 ) ( not ( = ?auto_134042 ?auto_134040 ) ) ( not ( = ?auto_134042 ?auto_134039 ) ) ( not ( = ?auto_134042 ?auto_134041 ) ) ( not ( = ?auto_134042 ?auto_134038 ) ) ( not ( = ?auto_134042 ?auto_134037 ) ) ( not ( = ?auto_134040 ?auto_134039 ) ) ( not ( = ?auto_134040 ?auto_134041 ) ) ( not ( = ?auto_134040 ?auto_134038 ) ) ( not ( = ?auto_134040 ?auto_134037 ) ) ( not ( = ?auto_134039 ?auto_134041 ) ) ( not ( = ?auto_134039 ?auto_134038 ) ) ( not ( = ?auto_134039 ?auto_134037 ) ) ( not ( = ?auto_134035 ?auto_134042 ) ) ( not ( = ?auto_134035 ?auto_134040 ) ) ( not ( = ?auto_134035 ?auto_134039 ) ) ( not ( = ?auto_134036 ?auto_134042 ) ) ( not ( = ?auto_134036 ?auto_134040 ) ) ( not ( = ?auto_134036 ?auto_134039 ) ) ( CLEAR ?auto_134035 ) ( ON ?auto_134036 ?auto_134037 ) ( CLEAR ?auto_134036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134042 ?auto_134040 ?auto_134039 ?auto_134041 ?auto_134038 ?auto_134037 )
      ( MAKE-4PILE ?auto_134035 ?auto_134036 ?auto_134037 ?auto_134038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134043 - BLOCK
      ?auto_134044 - BLOCK
      ?auto_134045 - BLOCK
      ?auto_134046 - BLOCK
    )
    :vars
    (
      ?auto_134049 - BLOCK
      ?auto_134050 - BLOCK
      ?auto_134048 - BLOCK
      ?auto_134047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134043 ?auto_134044 ) ) ( not ( = ?auto_134043 ?auto_134045 ) ) ( not ( = ?auto_134043 ?auto_134046 ) ) ( not ( = ?auto_134044 ?auto_134045 ) ) ( not ( = ?auto_134044 ?auto_134046 ) ) ( not ( = ?auto_134045 ?auto_134046 ) ) ( ON ?auto_134046 ?auto_134049 ) ( not ( = ?auto_134043 ?auto_134049 ) ) ( not ( = ?auto_134044 ?auto_134049 ) ) ( not ( = ?auto_134045 ?auto_134049 ) ) ( not ( = ?auto_134046 ?auto_134049 ) ) ( ON ?auto_134045 ?auto_134046 ) ( ON-TABLE ?auto_134050 ) ( ON ?auto_134048 ?auto_134050 ) ( ON ?auto_134047 ?auto_134048 ) ( ON ?auto_134049 ?auto_134047 ) ( not ( = ?auto_134050 ?auto_134048 ) ) ( not ( = ?auto_134050 ?auto_134047 ) ) ( not ( = ?auto_134050 ?auto_134049 ) ) ( not ( = ?auto_134050 ?auto_134046 ) ) ( not ( = ?auto_134050 ?auto_134045 ) ) ( not ( = ?auto_134048 ?auto_134047 ) ) ( not ( = ?auto_134048 ?auto_134049 ) ) ( not ( = ?auto_134048 ?auto_134046 ) ) ( not ( = ?auto_134048 ?auto_134045 ) ) ( not ( = ?auto_134047 ?auto_134049 ) ) ( not ( = ?auto_134047 ?auto_134046 ) ) ( not ( = ?auto_134047 ?auto_134045 ) ) ( not ( = ?auto_134043 ?auto_134050 ) ) ( not ( = ?auto_134043 ?auto_134048 ) ) ( not ( = ?auto_134043 ?auto_134047 ) ) ( not ( = ?auto_134044 ?auto_134050 ) ) ( not ( = ?auto_134044 ?auto_134048 ) ) ( not ( = ?auto_134044 ?auto_134047 ) ) ( ON ?auto_134044 ?auto_134045 ) ( CLEAR ?auto_134044 ) ( HOLDING ?auto_134043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134043 )
      ( MAKE-4PILE ?auto_134043 ?auto_134044 ?auto_134045 ?auto_134046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134051 - BLOCK
      ?auto_134052 - BLOCK
      ?auto_134053 - BLOCK
      ?auto_134054 - BLOCK
    )
    :vars
    (
      ?auto_134057 - BLOCK
      ?auto_134058 - BLOCK
      ?auto_134055 - BLOCK
      ?auto_134056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134051 ?auto_134052 ) ) ( not ( = ?auto_134051 ?auto_134053 ) ) ( not ( = ?auto_134051 ?auto_134054 ) ) ( not ( = ?auto_134052 ?auto_134053 ) ) ( not ( = ?auto_134052 ?auto_134054 ) ) ( not ( = ?auto_134053 ?auto_134054 ) ) ( ON ?auto_134054 ?auto_134057 ) ( not ( = ?auto_134051 ?auto_134057 ) ) ( not ( = ?auto_134052 ?auto_134057 ) ) ( not ( = ?auto_134053 ?auto_134057 ) ) ( not ( = ?auto_134054 ?auto_134057 ) ) ( ON ?auto_134053 ?auto_134054 ) ( ON-TABLE ?auto_134058 ) ( ON ?auto_134055 ?auto_134058 ) ( ON ?auto_134056 ?auto_134055 ) ( ON ?auto_134057 ?auto_134056 ) ( not ( = ?auto_134058 ?auto_134055 ) ) ( not ( = ?auto_134058 ?auto_134056 ) ) ( not ( = ?auto_134058 ?auto_134057 ) ) ( not ( = ?auto_134058 ?auto_134054 ) ) ( not ( = ?auto_134058 ?auto_134053 ) ) ( not ( = ?auto_134055 ?auto_134056 ) ) ( not ( = ?auto_134055 ?auto_134057 ) ) ( not ( = ?auto_134055 ?auto_134054 ) ) ( not ( = ?auto_134055 ?auto_134053 ) ) ( not ( = ?auto_134056 ?auto_134057 ) ) ( not ( = ?auto_134056 ?auto_134054 ) ) ( not ( = ?auto_134056 ?auto_134053 ) ) ( not ( = ?auto_134051 ?auto_134058 ) ) ( not ( = ?auto_134051 ?auto_134055 ) ) ( not ( = ?auto_134051 ?auto_134056 ) ) ( not ( = ?auto_134052 ?auto_134058 ) ) ( not ( = ?auto_134052 ?auto_134055 ) ) ( not ( = ?auto_134052 ?auto_134056 ) ) ( ON ?auto_134052 ?auto_134053 ) ( ON ?auto_134051 ?auto_134052 ) ( CLEAR ?auto_134051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134058 ?auto_134055 ?auto_134056 ?auto_134057 ?auto_134054 ?auto_134053 ?auto_134052 )
      ( MAKE-4PILE ?auto_134051 ?auto_134052 ?auto_134053 ?auto_134054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134063 - BLOCK
      ?auto_134064 - BLOCK
      ?auto_134065 - BLOCK
      ?auto_134066 - BLOCK
    )
    :vars
    (
      ?auto_134067 - BLOCK
      ?auto_134068 - BLOCK
      ?auto_134069 - BLOCK
      ?auto_134070 - BLOCK
      ?auto_134071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134063 ?auto_134064 ) ) ( not ( = ?auto_134063 ?auto_134065 ) ) ( not ( = ?auto_134063 ?auto_134066 ) ) ( not ( = ?auto_134064 ?auto_134065 ) ) ( not ( = ?auto_134064 ?auto_134066 ) ) ( not ( = ?auto_134065 ?auto_134066 ) ) ( ON ?auto_134066 ?auto_134067 ) ( not ( = ?auto_134063 ?auto_134067 ) ) ( not ( = ?auto_134064 ?auto_134067 ) ) ( not ( = ?auto_134065 ?auto_134067 ) ) ( not ( = ?auto_134066 ?auto_134067 ) ) ( ON ?auto_134065 ?auto_134066 ) ( ON-TABLE ?auto_134068 ) ( ON ?auto_134069 ?auto_134068 ) ( ON ?auto_134070 ?auto_134069 ) ( ON ?auto_134067 ?auto_134070 ) ( not ( = ?auto_134068 ?auto_134069 ) ) ( not ( = ?auto_134068 ?auto_134070 ) ) ( not ( = ?auto_134068 ?auto_134067 ) ) ( not ( = ?auto_134068 ?auto_134066 ) ) ( not ( = ?auto_134068 ?auto_134065 ) ) ( not ( = ?auto_134069 ?auto_134070 ) ) ( not ( = ?auto_134069 ?auto_134067 ) ) ( not ( = ?auto_134069 ?auto_134066 ) ) ( not ( = ?auto_134069 ?auto_134065 ) ) ( not ( = ?auto_134070 ?auto_134067 ) ) ( not ( = ?auto_134070 ?auto_134066 ) ) ( not ( = ?auto_134070 ?auto_134065 ) ) ( not ( = ?auto_134063 ?auto_134068 ) ) ( not ( = ?auto_134063 ?auto_134069 ) ) ( not ( = ?auto_134063 ?auto_134070 ) ) ( not ( = ?auto_134064 ?auto_134068 ) ) ( not ( = ?auto_134064 ?auto_134069 ) ) ( not ( = ?auto_134064 ?auto_134070 ) ) ( ON ?auto_134064 ?auto_134065 ) ( CLEAR ?auto_134064 ) ( ON ?auto_134063 ?auto_134071 ) ( CLEAR ?auto_134063 ) ( HAND-EMPTY ) ( not ( = ?auto_134063 ?auto_134071 ) ) ( not ( = ?auto_134064 ?auto_134071 ) ) ( not ( = ?auto_134065 ?auto_134071 ) ) ( not ( = ?auto_134066 ?auto_134071 ) ) ( not ( = ?auto_134067 ?auto_134071 ) ) ( not ( = ?auto_134068 ?auto_134071 ) ) ( not ( = ?auto_134069 ?auto_134071 ) ) ( not ( = ?auto_134070 ?auto_134071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134063 ?auto_134071 )
      ( MAKE-4PILE ?auto_134063 ?auto_134064 ?auto_134065 ?auto_134066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134072 - BLOCK
      ?auto_134073 - BLOCK
      ?auto_134074 - BLOCK
      ?auto_134075 - BLOCK
    )
    :vars
    (
      ?auto_134076 - BLOCK
      ?auto_134079 - BLOCK
      ?auto_134077 - BLOCK
      ?auto_134078 - BLOCK
      ?auto_134080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134072 ?auto_134073 ) ) ( not ( = ?auto_134072 ?auto_134074 ) ) ( not ( = ?auto_134072 ?auto_134075 ) ) ( not ( = ?auto_134073 ?auto_134074 ) ) ( not ( = ?auto_134073 ?auto_134075 ) ) ( not ( = ?auto_134074 ?auto_134075 ) ) ( ON ?auto_134075 ?auto_134076 ) ( not ( = ?auto_134072 ?auto_134076 ) ) ( not ( = ?auto_134073 ?auto_134076 ) ) ( not ( = ?auto_134074 ?auto_134076 ) ) ( not ( = ?auto_134075 ?auto_134076 ) ) ( ON ?auto_134074 ?auto_134075 ) ( ON-TABLE ?auto_134079 ) ( ON ?auto_134077 ?auto_134079 ) ( ON ?auto_134078 ?auto_134077 ) ( ON ?auto_134076 ?auto_134078 ) ( not ( = ?auto_134079 ?auto_134077 ) ) ( not ( = ?auto_134079 ?auto_134078 ) ) ( not ( = ?auto_134079 ?auto_134076 ) ) ( not ( = ?auto_134079 ?auto_134075 ) ) ( not ( = ?auto_134079 ?auto_134074 ) ) ( not ( = ?auto_134077 ?auto_134078 ) ) ( not ( = ?auto_134077 ?auto_134076 ) ) ( not ( = ?auto_134077 ?auto_134075 ) ) ( not ( = ?auto_134077 ?auto_134074 ) ) ( not ( = ?auto_134078 ?auto_134076 ) ) ( not ( = ?auto_134078 ?auto_134075 ) ) ( not ( = ?auto_134078 ?auto_134074 ) ) ( not ( = ?auto_134072 ?auto_134079 ) ) ( not ( = ?auto_134072 ?auto_134077 ) ) ( not ( = ?auto_134072 ?auto_134078 ) ) ( not ( = ?auto_134073 ?auto_134079 ) ) ( not ( = ?auto_134073 ?auto_134077 ) ) ( not ( = ?auto_134073 ?auto_134078 ) ) ( ON ?auto_134072 ?auto_134080 ) ( CLEAR ?auto_134072 ) ( not ( = ?auto_134072 ?auto_134080 ) ) ( not ( = ?auto_134073 ?auto_134080 ) ) ( not ( = ?auto_134074 ?auto_134080 ) ) ( not ( = ?auto_134075 ?auto_134080 ) ) ( not ( = ?auto_134076 ?auto_134080 ) ) ( not ( = ?auto_134079 ?auto_134080 ) ) ( not ( = ?auto_134077 ?auto_134080 ) ) ( not ( = ?auto_134078 ?auto_134080 ) ) ( HOLDING ?auto_134073 ) ( CLEAR ?auto_134074 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134079 ?auto_134077 ?auto_134078 ?auto_134076 ?auto_134075 ?auto_134074 ?auto_134073 )
      ( MAKE-4PILE ?auto_134072 ?auto_134073 ?auto_134074 ?auto_134075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134081 - BLOCK
      ?auto_134082 - BLOCK
      ?auto_134083 - BLOCK
      ?auto_134084 - BLOCK
    )
    :vars
    (
      ?auto_134089 - BLOCK
      ?auto_134087 - BLOCK
      ?auto_134086 - BLOCK
      ?auto_134088 - BLOCK
      ?auto_134085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134081 ?auto_134082 ) ) ( not ( = ?auto_134081 ?auto_134083 ) ) ( not ( = ?auto_134081 ?auto_134084 ) ) ( not ( = ?auto_134082 ?auto_134083 ) ) ( not ( = ?auto_134082 ?auto_134084 ) ) ( not ( = ?auto_134083 ?auto_134084 ) ) ( ON ?auto_134084 ?auto_134089 ) ( not ( = ?auto_134081 ?auto_134089 ) ) ( not ( = ?auto_134082 ?auto_134089 ) ) ( not ( = ?auto_134083 ?auto_134089 ) ) ( not ( = ?auto_134084 ?auto_134089 ) ) ( ON ?auto_134083 ?auto_134084 ) ( ON-TABLE ?auto_134087 ) ( ON ?auto_134086 ?auto_134087 ) ( ON ?auto_134088 ?auto_134086 ) ( ON ?auto_134089 ?auto_134088 ) ( not ( = ?auto_134087 ?auto_134086 ) ) ( not ( = ?auto_134087 ?auto_134088 ) ) ( not ( = ?auto_134087 ?auto_134089 ) ) ( not ( = ?auto_134087 ?auto_134084 ) ) ( not ( = ?auto_134087 ?auto_134083 ) ) ( not ( = ?auto_134086 ?auto_134088 ) ) ( not ( = ?auto_134086 ?auto_134089 ) ) ( not ( = ?auto_134086 ?auto_134084 ) ) ( not ( = ?auto_134086 ?auto_134083 ) ) ( not ( = ?auto_134088 ?auto_134089 ) ) ( not ( = ?auto_134088 ?auto_134084 ) ) ( not ( = ?auto_134088 ?auto_134083 ) ) ( not ( = ?auto_134081 ?auto_134087 ) ) ( not ( = ?auto_134081 ?auto_134086 ) ) ( not ( = ?auto_134081 ?auto_134088 ) ) ( not ( = ?auto_134082 ?auto_134087 ) ) ( not ( = ?auto_134082 ?auto_134086 ) ) ( not ( = ?auto_134082 ?auto_134088 ) ) ( ON ?auto_134081 ?auto_134085 ) ( not ( = ?auto_134081 ?auto_134085 ) ) ( not ( = ?auto_134082 ?auto_134085 ) ) ( not ( = ?auto_134083 ?auto_134085 ) ) ( not ( = ?auto_134084 ?auto_134085 ) ) ( not ( = ?auto_134089 ?auto_134085 ) ) ( not ( = ?auto_134087 ?auto_134085 ) ) ( not ( = ?auto_134086 ?auto_134085 ) ) ( not ( = ?auto_134088 ?auto_134085 ) ) ( CLEAR ?auto_134083 ) ( ON ?auto_134082 ?auto_134081 ) ( CLEAR ?auto_134082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134085 ?auto_134081 )
      ( MAKE-4PILE ?auto_134081 ?auto_134082 ?auto_134083 ?auto_134084 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134090 - BLOCK
      ?auto_134091 - BLOCK
      ?auto_134092 - BLOCK
      ?auto_134093 - BLOCK
    )
    :vars
    (
      ?auto_134097 - BLOCK
      ?auto_134098 - BLOCK
      ?auto_134095 - BLOCK
      ?auto_134094 - BLOCK
      ?auto_134096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134090 ?auto_134091 ) ) ( not ( = ?auto_134090 ?auto_134092 ) ) ( not ( = ?auto_134090 ?auto_134093 ) ) ( not ( = ?auto_134091 ?auto_134092 ) ) ( not ( = ?auto_134091 ?auto_134093 ) ) ( not ( = ?auto_134092 ?auto_134093 ) ) ( ON ?auto_134093 ?auto_134097 ) ( not ( = ?auto_134090 ?auto_134097 ) ) ( not ( = ?auto_134091 ?auto_134097 ) ) ( not ( = ?auto_134092 ?auto_134097 ) ) ( not ( = ?auto_134093 ?auto_134097 ) ) ( ON-TABLE ?auto_134098 ) ( ON ?auto_134095 ?auto_134098 ) ( ON ?auto_134094 ?auto_134095 ) ( ON ?auto_134097 ?auto_134094 ) ( not ( = ?auto_134098 ?auto_134095 ) ) ( not ( = ?auto_134098 ?auto_134094 ) ) ( not ( = ?auto_134098 ?auto_134097 ) ) ( not ( = ?auto_134098 ?auto_134093 ) ) ( not ( = ?auto_134098 ?auto_134092 ) ) ( not ( = ?auto_134095 ?auto_134094 ) ) ( not ( = ?auto_134095 ?auto_134097 ) ) ( not ( = ?auto_134095 ?auto_134093 ) ) ( not ( = ?auto_134095 ?auto_134092 ) ) ( not ( = ?auto_134094 ?auto_134097 ) ) ( not ( = ?auto_134094 ?auto_134093 ) ) ( not ( = ?auto_134094 ?auto_134092 ) ) ( not ( = ?auto_134090 ?auto_134098 ) ) ( not ( = ?auto_134090 ?auto_134095 ) ) ( not ( = ?auto_134090 ?auto_134094 ) ) ( not ( = ?auto_134091 ?auto_134098 ) ) ( not ( = ?auto_134091 ?auto_134095 ) ) ( not ( = ?auto_134091 ?auto_134094 ) ) ( ON ?auto_134090 ?auto_134096 ) ( not ( = ?auto_134090 ?auto_134096 ) ) ( not ( = ?auto_134091 ?auto_134096 ) ) ( not ( = ?auto_134092 ?auto_134096 ) ) ( not ( = ?auto_134093 ?auto_134096 ) ) ( not ( = ?auto_134097 ?auto_134096 ) ) ( not ( = ?auto_134098 ?auto_134096 ) ) ( not ( = ?auto_134095 ?auto_134096 ) ) ( not ( = ?auto_134094 ?auto_134096 ) ) ( ON ?auto_134091 ?auto_134090 ) ( CLEAR ?auto_134091 ) ( ON-TABLE ?auto_134096 ) ( HOLDING ?auto_134092 ) ( CLEAR ?auto_134093 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134098 ?auto_134095 ?auto_134094 ?auto_134097 ?auto_134093 ?auto_134092 )
      ( MAKE-4PILE ?auto_134090 ?auto_134091 ?auto_134092 ?auto_134093 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134099 - BLOCK
      ?auto_134100 - BLOCK
      ?auto_134101 - BLOCK
      ?auto_134102 - BLOCK
    )
    :vars
    (
      ?auto_134105 - BLOCK
      ?auto_134104 - BLOCK
      ?auto_134107 - BLOCK
      ?auto_134106 - BLOCK
      ?auto_134103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134099 ?auto_134100 ) ) ( not ( = ?auto_134099 ?auto_134101 ) ) ( not ( = ?auto_134099 ?auto_134102 ) ) ( not ( = ?auto_134100 ?auto_134101 ) ) ( not ( = ?auto_134100 ?auto_134102 ) ) ( not ( = ?auto_134101 ?auto_134102 ) ) ( ON ?auto_134102 ?auto_134105 ) ( not ( = ?auto_134099 ?auto_134105 ) ) ( not ( = ?auto_134100 ?auto_134105 ) ) ( not ( = ?auto_134101 ?auto_134105 ) ) ( not ( = ?auto_134102 ?auto_134105 ) ) ( ON-TABLE ?auto_134104 ) ( ON ?auto_134107 ?auto_134104 ) ( ON ?auto_134106 ?auto_134107 ) ( ON ?auto_134105 ?auto_134106 ) ( not ( = ?auto_134104 ?auto_134107 ) ) ( not ( = ?auto_134104 ?auto_134106 ) ) ( not ( = ?auto_134104 ?auto_134105 ) ) ( not ( = ?auto_134104 ?auto_134102 ) ) ( not ( = ?auto_134104 ?auto_134101 ) ) ( not ( = ?auto_134107 ?auto_134106 ) ) ( not ( = ?auto_134107 ?auto_134105 ) ) ( not ( = ?auto_134107 ?auto_134102 ) ) ( not ( = ?auto_134107 ?auto_134101 ) ) ( not ( = ?auto_134106 ?auto_134105 ) ) ( not ( = ?auto_134106 ?auto_134102 ) ) ( not ( = ?auto_134106 ?auto_134101 ) ) ( not ( = ?auto_134099 ?auto_134104 ) ) ( not ( = ?auto_134099 ?auto_134107 ) ) ( not ( = ?auto_134099 ?auto_134106 ) ) ( not ( = ?auto_134100 ?auto_134104 ) ) ( not ( = ?auto_134100 ?auto_134107 ) ) ( not ( = ?auto_134100 ?auto_134106 ) ) ( ON ?auto_134099 ?auto_134103 ) ( not ( = ?auto_134099 ?auto_134103 ) ) ( not ( = ?auto_134100 ?auto_134103 ) ) ( not ( = ?auto_134101 ?auto_134103 ) ) ( not ( = ?auto_134102 ?auto_134103 ) ) ( not ( = ?auto_134105 ?auto_134103 ) ) ( not ( = ?auto_134104 ?auto_134103 ) ) ( not ( = ?auto_134107 ?auto_134103 ) ) ( not ( = ?auto_134106 ?auto_134103 ) ) ( ON ?auto_134100 ?auto_134099 ) ( ON-TABLE ?auto_134103 ) ( CLEAR ?auto_134102 ) ( ON ?auto_134101 ?auto_134100 ) ( CLEAR ?auto_134101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134103 ?auto_134099 ?auto_134100 )
      ( MAKE-4PILE ?auto_134099 ?auto_134100 ?auto_134101 ?auto_134102 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134108 - BLOCK
      ?auto_134109 - BLOCK
      ?auto_134110 - BLOCK
      ?auto_134111 - BLOCK
    )
    :vars
    (
      ?auto_134116 - BLOCK
      ?auto_134114 - BLOCK
      ?auto_134112 - BLOCK
      ?auto_134115 - BLOCK
      ?auto_134113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134108 ?auto_134109 ) ) ( not ( = ?auto_134108 ?auto_134110 ) ) ( not ( = ?auto_134108 ?auto_134111 ) ) ( not ( = ?auto_134109 ?auto_134110 ) ) ( not ( = ?auto_134109 ?auto_134111 ) ) ( not ( = ?auto_134110 ?auto_134111 ) ) ( not ( = ?auto_134108 ?auto_134116 ) ) ( not ( = ?auto_134109 ?auto_134116 ) ) ( not ( = ?auto_134110 ?auto_134116 ) ) ( not ( = ?auto_134111 ?auto_134116 ) ) ( ON-TABLE ?auto_134114 ) ( ON ?auto_134112 ?auto_134114 ) ( ON ?auto_134115 ?auto_134112 ) ( ON ?auto_134116 ?auto_134115 ) ( not ( = ?auto_134114 ?auto_134112 ) ) ( not ( = ?auto_134114 ?auto_134115 ) ) ( not ( = ?auto_134114 ?auto_134116 ) ) ( not ( = ?auto_134114 ?auto_134111 ) ) ( not ( = ?auto_134114 ?auto_134110 ) ) ( not ( = ?auto_134112 ?auto_134115 ) ) ( not ( = ?auto_134112 ?auto_134116 ) ) ( not ( = ?auto_134112 ?auto_134111 ) ) ( not ( = ?auto_134112 ?auto_134110 ) ) ( not ( = ?auto_134115 ?auto_134116 ) ) ( not ( = ?auto_134115 ?auto_134111 ) ) ( not ( = ?auto_134115 ?auto_134110 ) ) ( not ( = ?auto_134108 ?auto_134114 ) ) ( not ( = ?auto_134108 ?auto_134112 ) ) ( not ( = ?auto_134108 ?auto_134115 ) ) ( not ( = ?auto_134109 ?auto_134114 ) ) ( not ( = ?auto_134109 ?auto_134112 ) ) ( not ( = ?auto_134109 ?auto_134115 ) ) ( ON ?auto_134108 ?auto_134113 ) ( not ( = ?auto_134108 ?auto_134113 ) ) ( not ( = ?auto_134109 ?auto_134113 ) ) ( not ( = ?auto_134110 ?auto_134113 ) ) ( not ( = ?auto_134111 ?auto_134113 ) ) ( not ( = ?auto_134116 ?auto_134113 ) ) ( not ( = ?auto_134114 ?auto_134113 ) ) ( not ( = ?auto_134112 ?auto_134113 ) ) ( not ( = ?auto_134115 ?auto_134113 ) ) ( ON ?auto_134109 ?auto_134108 ) ( ON-TABLE ?auto_134113 ) ( ON ?auto_134110 ?auto_134109 ) ( CLEAR ?auto_134110 ) ( HOLDING ?auto_134111 ) ( CLEAR ?auto_134116 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134114 ?auto_134112 ?auto_134115 ?auto_134116 ?auto_134111 )
      ( MAKE-4PILE ?auto_134108 ?auto_134109 ?auto_134110 ?auto_134111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134117 - BLOCK
      ?auto_134118 - BLOCK
      ?auto_134119 - BLOCK
      ?auto_134120 - BLOCK
    )
    :vars
    (
      ?auto_134124 - BLOCK
      ?auto_134121 - BLOCK
      ?auto_134123 - BLOCK
      ?auto_134122 - BLOCK
      ?auto_134125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134117 ?auto_134118 ) ) ( not ( = ?auto_134117 ?auto_134119 ) ) ( not ( = ?auto_134117 ?auto_134120 ) ) ( not ( = ?auto_134118 ?auto_134119 ) ) ( not ( = ?auto_134118 ?auto_134120 ) ) ( not ( = ?auto_134119 ?auto_134120 ) ) ( not ( = ?auto_134117 ?auto_134124 ) ) ( not ( = ?auto_134118 ?auto_134124 ) ) ( not ( = ?auto_134119 ?auto_134124 ) ) ( not ( = ?auto_134120 ?auto_134124 ) ) ( ON-TABLE ?auto_134121 ) ( ON ?auto_134123 ?auto_134121 ) ( ON ?auto_134122 ?auto_134123 ) ( ON ?auto_134124 ?auto_134122 ) ( not ( = ?auto_134121 ?auto_134123 ) ) ( not ( = ?auto_134121 ?auto_134122 ) ) ( not ( = ?auto_134121 ?auto_134124 ) ) ( not ( = ?auto_134121 ?auto_134120 ) ) ( not ( = ?auto_134121 ?auto_134119 ) ) ( not ( = ?auto_134123 ?auto_134122 ) ) ( not ( = ?auto_134123 ?auto_134124 ) ) ( not ( = ?auto_134123 ?auto_134120 ) ) ( not ( = ?auto_134123 ?auto_134119 ) ) ( not ( = ?auto_134122 ?auto_134124 ) ) ( not ( = ?auto_134122 ?auto_134120 ) ) ( not ( = ?auto_134122 ?auto_134119 ) ) ( not ( = ?auto_134117 ?auto_134121 ) ) ( not ( = ?auto_134117 ?auto_134123 ) ) ( not ( = ?auto_134117 ?auto_134122 ) ) ( not ( = ?auto_134118 ?auto_134121 ) ) ( not ( = ?auto_134118 ?auto_134123 ) ) ( not ( = ?auto_134118 ?auto_134122 ) ) ( ON ?auto_134117 ?auto_134125 ) ( not ( = ?auto_134117 ?auto_134125 ) ) ( not ( = ?auto_134118 ?auto_134125 ) ) ( not ( = ?auto_134119 ?auto_134125 ) ) ( not ( = ?auto_134120 ?auto_134125 ) ) ( not ( = ?auto_134124 ?auto_134125 ) ) ( not ( = ?auto_134121 ?auto_134125 ) ) ( not ( = ?auto_134123 ?auto_134125 ) ) ( not ( = ?auto_134122 ?auto_134125 ) ) ( ON ?auto_134118 ?auto_134117 ) ( ON-TABLE ?auto_134125 ) ( ON ?auto_134119 ?auto_134118 ) ( CLEAR ?auto_134124 ) ( ON ?auto_134120 ?auto_134119 ) ( CLEAR ?auto_134120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134125 ?auto_134117 ?auto_134118 ?auto_134119 )
      ( MAKE-4PILE ?auto_134117 ?auto_134118 ?auto_134119 ?auto_134120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134126 - BLOCK
      ?auto_134127 - BLOCK
      ?auto_134128 - BLOCK
      ?auto_134129 - BLOCK
    )
    :vars
    (
      ?auto_134130 - BLOCK
      ?auto_134132 - BLOCK
      ?auto_134134 - BLOCK
      ?auto_134131 - BLOCK
      ?auto_134133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134126 ?auto_134127 ) ) ( not ( = ?auto_134126 ?auto_134128 ) ) ( not ( = ?auto_134126 ?auto_134129 ) ) ( not ( = ?auto_134127 ?auto_134128 ) ) ( not ( = ?auto_134127 ?auto_134129 ) ) ( not ( = ?auto_134128 ?auto_134129 ) ) ( not ( = ?auto_134126 ?auto_134130 ) ) ( not ( = ?auto_134127 ?auto_134130 ) ) ( not ( = ?auto_134128 ?auto_134130 ) ) ( not ( = ?auto_134129 ?auto_134130 ) ) ( ON-TABLE ?auto_134132 ) ( ON ?auto_134134 ?auto_134132 ) ( ON ?auto_134131 ?auto_134134 ) ( not ( = ?auto_134132 ?auto_134134 ) ) ( not ( = ?auto_134132 ?auto_134131 ) ) ( not ( = ?auto_134132 ?auto_134130 ) ) ( not ( = ?auto_134132 ?auto_134129 ) ) ( not ( = ?auto_134132 ?auto_134128 ) ) ( not ( = ?auto_134134 ?auto_134131 ) ) ( not ( = ?auto_134134 ?auto_134130 ) ) ( not ( = ?auto_134134 ?auto_134129 ) ) ( not ( = ?auto_134134 ?auto_134128 ) ) ( not ( = ?auto_134131 ?auto_134130 ) ) ( not ( = ?auto_134131 ?auto_134129 ) ) ( not ( = ?auto_134131 ?auto_134128 ) ) ( not ( = ?auto_134126 ?auto_134132 ) ) ( not ( = ?auto_134126 ?auto_134134 ) ) ( not ( = ?auto_134126 ?auto_134131 ) ) ( not ( = ?auto_134127 ?auto_134132 ) ) ( not ( = ?auto_134127 ?auto_134134 ) ) ( not ( = ?auto_134127 ?auto_134131 ) ) ( ON ?auto_134126 ?auto_134133 ) ( not ( = ?auto_134126 ?auto_134133 ) ) ( not ( = ?auto_134127 ?auto_134133 ) ) ( not ( = ?auto_134128 ?auto_134133 ) ) ( not ( = ?auto_134129 ?auto_134133 ) ) ( not ( = ?auto_134130 ?auto_134133 ) ) ( not ( = ?auto_134132 ?auto_134133 ) ) ( not ( = ?auto_134134 ?auto_134133 ) ) ( not ( = ?auto_134131 ?auto_134133 ) ) ( ON ?auto_134127 ?auto_134126 ) ( ON-TABLE ?auto_134133 ) ( ON ?auto_134128 ?auto_134127 ) ( ON ?auto_134129 ?auto_134128 ) ( CLEAR ?auto_134129 ) ( HOLDING ?auto_134130 ) ( CLEAR ?auto_134131 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134132 ?auto_134134 ?auto_134131 ?auto_134130 )
      ( MAKE-4PILE ?auto_134126 ?auto_134127 ?auto_134128 ?auto_134129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134135 - BLOCK
      ?auto_134136 - BLOCK
      ?auto_134137 - BLOCK
      ?auto_134138 - BLOCK
    )
    :vars
    (
      ?auto_134140 - BLOCK
      ?auto_134141 - BLOCK
      ?auto_134142 - BLOCK
      ?auto_134139 - BLOCK
      ?auto_134143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134135 ?auto_134136 ) ) ( not ( = ?auto_134135 ?auto_134137 ) ) ( not ( = ?auto_134135 ?auto_134138 ) ) ( not ( = ?auto_134136 ?auto_134137 ) ) ( not ( = ?auto_134136 ?auto_134138 ) ) ( not ( = ?auto_134137 ?auto_134138 ) ) ( not ( = ?auto_134135 ?auto_134140 ) ) ( not ( = ?auto_134136 ?auto_134140 ) ) ( not ( = ?auto_134137 ?auto_134140 ) ) ( not ( = ?auto_134138 ?auto_134140 ) ) ( ON-TABLE ?auto_134141 ) ( ON ?auto_134142 ?auto_134141 ) ( ON ?auto_134139 ?auto_134142 ) ( not ( = ?auto_134141 ?auto_134142 ) ) ( not ( = ?auto_134141 ?auto_134139 ) ) ( not ( = ?auto_134141 ?auto_134140 ) ) ( not ( = ?auto_134141 ?auto_134138 ) ) ( not ( = ?auto_134141 ?auto_134137 ) ) ( not ( = ?auto_134142 ?auto_134139 ) ) ( not ( = ?auto_134142 ?auto_134140 ) ) ( not ( = ?auto_134142 ?auto_134138 ) ) ( not ( = ?auto_134142 ?auto_134137 ) ) ( not ( = ?auto_134139 ?auto_134140 ) ) ( not ( = ?auto_134139 ?auto_134138 ) ) ( not ( = ?auto_134139 ?auto_134137 ) ) ( not ( = ?auto_134135 ?auto_134141 ) ) ( not ( = ?auto_134135 ?auto_134142 ) ) ( not ( = ?auto_134135 ?auto_134139 ) ) ( not ( = ?auto_134136 ?auto_134141 ) ) ( not ( = ?auto_134136 ?auto_134142 ) ) ( not ( = ?auto_134136 ?auto_134139 ) ) ( ON ?auto_134135 ?auto_134143 ) ( not ( = ?auto_134135 ?auto_134143 ) ) ( not ( = ?auto_134136 ?auto_134143 ) ) ( not ( = ?auto_134137 ?auto_134143 ) ) ( not ( = ?auto_134138 ?auto_134143 ) ) ( not ( = ?auto_134140 ?auto_134143 ) ) ( not ( = ?auto_134141 ?auto_134143 ) ) ( not ( = ?auto_134142 ?auto_134143 ) ) ( not ( = ?auto_134139 ?auto_134143 ) ) ( ON ?auto_134136 ?auto_134135 ) ( ON-TABLE ?auto_134143 ) ( ON ?auto_134137 ?auto_134136 ) ( ON ?auto_134138 ?auto_134137 ) ( CLEAR ?auto_134139 ) ( ON ?auto_134140 ?auto_134138 ) ( CLEAR ?auto_134140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134143 ?auto_134135 ?auto_134136 ?auto_134137 ?auto_134138 )
      ( MAKE-4PILE ?auto_134135 ?auto_134136 ?auto_134137 ?auto_134138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134144 - BLOCK
      ?auto_134145 - BLOCK
      ?auto_134146 - BLOCK
      ?auto_134147 - BLOCK
    )
    :vars
    (
      ?auto_134151 - BLOCK
      ?auto_134149 - BLOCK
      ?auto_134150 - BLOCK
      ?auto_134148 - BLOCK
      ?auto_134152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134144 ?auto_134145 ) ) ( not ( = ?auto_134144 ?auto_134146 ) ) ( not ( = ?auto_134144 ?auto_134147 ) ) ( not ( = ?auto_134145 ?auto_134146 ) ) ( not ( = ?auto_134145 ?auto_134147 ) ) ( not ( = ?auto_134146 ?auto_134147 ) ) ( not ( = ?auto_134144 ?auto_134151 ) ) ( not ( = ?auto_134145 ?auto_134151 ) ) ( not ( = ?auto_134146 ?auto_134151 ) ) ( not ( = ?auto_134147 ?auto_134151 ) ) ( ON-TABLE ?auto_134149 ) ( ON ?auto_134150 ?auto_134149 ) ( not ( = ?auto_134149 ?auto_134150 ) ) ( not ( = ?auto_134149 ?auto_134148 ) ) ( not ( = ?auto_134149 ?auto_134151 ) ) ( not ( = ?auto_134149 ?auto_134147 ) ) ( not ( = ?auto_134149 ?auto_134146 ) ) ( not ( = ?auto_134150 ?auto_134148 ) ) ( not ( = ?auto_134150 ?auto_134151 ) ) ( not ( = ?auto_134150 ?auto_134147 ) ) ( not ( = ?auto_134150 ?auto_134146 ) ) ( not ( = ?auto_134148 ?auto_134151 ) ) ( not ( = ?auto_134148 ?auto_134147 ) ) ( not ( = ?auto_134148 ?auto_134146 ) ) ( not ( = ?auto_134144 ?auto_134149 ) ) ( not ( = ?auto_134144 ?auto_134150 ) ) ( not ( = ?auto_134144 ?auto_134148 ) ) ( not ( = ?auto_134145 ?auto_134149 ) ) ( not ( = ?auto_134145 ?auto_134150 ) ) ( not ( = ?auto_134145 ?auto_134148 ) ) ( ON ?auto_134144 ?auto_134152 ) ( not ( = ?auto_134144 ?auto_134152 ) ) ( not ( = ?auto_134145 ?auto_134152 ) ) ( not ( = ?auto_134146 ?auto_134152 ) ) ( not ( = ?auto_134147 ?auto_134152 ) ) ( not ( = ?auto_134151 ?auto_134152 ) ) ( not ( = ?auto_134149 ?auto_134152 ) ) ( not ( = ?auto_134150 ?auto_134152 ) ) ( not ( = ?auto_134148 ?auto_134152 ) ) ( ON ?auto_134145 ?auto_134144 ) ( ON-TABLE ?auto_134152 ) ( ON ?auto_134146 ?auto_134145 ) ( ON ?auto_134147 ?auto_134146 ) ( ON ?auto_134151 ?auto_134147 ) ( CLEAR ?auto_134151 ) ( HOLDING ?auto_134148 ) ( CLEAR ?auto_134150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134149 ?auto_134150 ?auto_134148 )
      ( MAKE-4PILE ?auto_134144 ?auto_134145 ?auto_134146 ?auto_134147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134153 - BLOCK
      ?auto_134154 - BLOCK
      ?auto_134155 - BLOCK
      ?auto_134156 - BLOCK
    )
    :vars
    (
      ?auto_134157 - BLOCK
      ?auto_134161 - BLOCK
      ?auto_134159 - BLOCK
      ?auto_134158 - BLOCK
      ?auto_134160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134153 ?auto_134154 ) ) ( not ( = ?auto_134153 ?auto_134155 ) ) ( not ( = ?auto_134153 ?auto_134156 ) ) ( not ( = ?auto_134154 ?auto_134155 ) ) ( not ( = ?auto_134154 ?auto_134156 ) ) ( not ( = ?auto_134155 ?auto_134156 ) ) ( not ( = ?auto_134153 ?auto_134157 ) ) ( not ( = ?auto_134154 ?auto_134157 ) ) ( not ( = ?auto_134155 ?auto_134157 ) ) ( not ( = ?auto_134156 ?auto_134157 ) ) ( ON-TABLE ?auto_134161 ) ( ON ?auto_134159 ?auto_134161 ) ( not ( = ?auto_134161 ?auto_134159 ) ) ( not ( = ?auto_134161 ?auto_134158 ) ) ( not ( = ?auto_134161 ?auto_134157 ) ) ( not ( = ?auto_134161 ?auto_134156 ) ) ( not ( = ?auto_134161 ?auto_134155 ) ) ( not ( = ?auto_134159 ?auto_134158 ) ) ( not ( = ?auto_134159 ?auto_134157 ) ) ( not ( = ?auto_134159 ?auto_134156 ) ) ( not ( = ?auto_134159 ?auto_134155 ) ) ( not ( = ?auto_134158 ?auto_134157 ) ) ( not ( = ?auto_134158 ?auto_134156 ) ) ( not ( = ?auto_134158 ?auto_134155 ) ) ( not ( = ?auto_134153 ?auto_134161 ) ) ( not ( = ?auto_134153 ?auto_134159 ) ) ( not ( = ?auto_134153 ?auto_134158 ) ) ( not ( = ?auto_134154 ?auto_134161 ) ) ( not ( = ?auto_134154 ?auto_134159 ) ) ( not ( = ?auto_134154 ?auto_134158 ) ) ( ON ?auto_134153 ?auto_134160 ) ( not ( = ?auto_134153 ?auto_134160 ) ) ( not ( = ?auto_134154 ?auto_134160 ) ) ( not ( = ?auto_134155 ?auto_134160 ) ) ( not ( = ?auto_134156 ?auto_134160 ) ) ( not ( = ?auto_134157 ?auto_134160 ) ) ( not ( = ?auto_134161 ?auto_134160 ) ) ( not ( = ?auto_134159 ?auto_134160 ) ) ( not ( = ?auto_134158 ?auto_134160 ) ) ( ON ?auto_134154 ?auto_134153 ) ( ON-TABLE ?auto_134160 ) ( ON ?auto_134155 ?auto_134154 ) ( ON ?auto_134156 ?auto_134155 ) ( ON ?auto_134157 ?auto_134156 ) ( CLEAR ?auto_134159 ) ( ON ?auto_134158 ?auto_134157 ) ( CLEAR ?auto_134158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134160 ?auto_134153 ?auto_134154 ?auto_134155 ?auto_134156 ?auto_134157 )
      ( MAKE-4PILE ?auto_134153 ?auto_134154 ?auto_134155 ?auto_134156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134162 - BLOCK
      ?auto_134163 - BLOCK
      ?auto_134164 - BLOCK
      ?auto_134165 - BLOCK
    )
    :vars
    (
      ?auto_134166 - BLOCK
      ?auto_134170 - BLOCK
      ?auto_134167 - BLOCK
      ?auto_134168 - BLOCK
      ?auto_134169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134162 ?auto_134163 ) ) ( not ( = ?auto_134162 ?auto_134164 ) ) ( not ( = ?auto_134162 ?auto_134165 ) ) ( not ( = ?auto_134163 ?auto_134164 ) ) ( not ( = ?auto_134163 ?auto_134165 ) ) ( not ( = ?auto_134164 ?auto_134165 ) ) ( not ( = ?auto_134162 ?auto_134166 ) ) ( not ( = ?auto_134163 ?auto_134166 ) ) ( not ( = ?auto_134164 ?auto_134166 ) ) ( not ( = ?auto_134165 ?auto_134166 ) ) ( ON-TABLE ?auto_134170 ) ( not ( = ?auto_134170 ?auto_134167 ) ) ( not ( = ?auto_134170 ?auto_134168 ) ) ( not ( = ?auto_134170 ?auto_134166 ) ) ( not ( = ?auto_134170 ?auto_134165 ) ) ( not ( = ?auto_134170 ?auto_134164 ) ) ( not ( = ?auto_134167 ?auto_134168 ) ) ( not ( = ?auto_134167 ?auto_134166 ) ) ( not ( = ?auto_134167 ?auto_134165 ) ) ( not ( = ?auto_134167 ?auto_134164 ) ) ( not ( = ?auto_134168 ?auto_134166 ) ) ( not ( = ?auto_134168 ?auto_134165 ) ) ( not ( = ?auto_134168 ?auto_134164 ) ) ( not ( = ?auto_134162 ?auto_134170 ) ) ( not ( = ?auto_134162 ?auto_134167 ) ) ( not ( = ?auto_134162 ?auto_134168 ) ) ( not ( = ?auto_134163 ?auto_134170 ) ) ( not ( = ?auto_134163 ?auto_134167 ) ) ( not ( = ?auto_134163 ?auto_134168 ) ) ( ON ?auto_134162 ?auto_134169 ) ( not ( = ?auto_134162 ?auto_134169 ) ) ( not ( = ?auto_134163 ?auto_134169 ) ) ( not ( = ?auto_134164 ?auto_134169 ) ) ( not ( = ?auto_134165 ?auto_134169 ) ) ( not ( = ?auto_134166 ?auto_134169 ) ) ( not ( = ?auto_134170 ?auto_134169 ) ) ( not ( = ?auto_134167 ?auto_134169 ) ) ( not ( = ?auto_134168 ?auto_134169 ) ) ( ON ?auto_134163 ?auto_134162 ) ( ON-TABLE ?auto_134169 ) ( ON ?auto_134164 ?auto_134163 ) ( ON ?auto_134165 ?auto_134164 ) ( ON ?auto_134166 ?auto_134165 ) ( ON ?auto_134168 ?auto_134166 ) ( CLEAR ?auto_134168 ) ( HOLDING ?auto_134167 ) ( CLEAR ?auto_134170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134170 ?auto_134167 )
      ( MAKE-4PILE ?auto_134162 ?auto_134163 ?auto_134164 ?auto_134165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134171 - BLOCK
      ?auto_134172 - BLOCK
      ?auto_134173 - BLOCK
      ?auto_134174 - BLOCK
    )
    :vars
    (
      ?auto_134178 - BLOCK
      ?auto_134177 - BLOCK
      ?auto_134175 - BLOCK
      ?auto_134179 - BLOCK
      ?auto_134176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134171 ?auto_134172 ) ) ( not ( = ?auto_134171 ?auto_134173 ) ) ( not ( = ?auto_134171 ?auto_134174 ) ) ( not ( = ?auto_134172 ?auto_134173 ) ) ( not ( = ?auto_134172 ?auto_134174 ) ) ( not ( = ?auto_134173 ?auto_134174 ) ) ( not ( = ?auto_134171 ?auto_134178 ) ) ( not ( = ?auto_134172 ?auto_134178 ) ) ( not ( = ?auto_134173 ?auto_134178 ) ) ( not ( = ?auto_134174 ?auto_134178 ) ) ( ON-TABLE ?auto_134177 ) ( not ( = ?auto_134177 ?auto_134175 ) ) ( not ( = ?auto_134177 ?auto_134179 ) ) ( not ( = ?auto_134177 ?auto_134178 ) ) ( not ( = ?auto_134177 ?auto_134174 ) ) ( not ( = ?auto_134177 ?auto_134173 ) ) ( not ( = ?auto_134175 ?auto_134179 ) ) ( not ( = ?auto_134175 ?auto_134178 ) ) ( not ( = ?auto_134175 ?auto_134174 ) ) ( not ( = ?auto_134175 ?auto_134173 ) ) ( not ( = ?auto_134179 ?auto_134178 ) ) ( not ( = ?auto_134179 ?auto_134174 ) ) ( not ( = ?auto_134179 ?auto_134173 ) ) ( not ( = ?auto_134171 ?auto_134177 ) ) ( not ( = ?auto_134171 ?auto_134175 ) ) ( not ( = ?auto_134171 ?auto_134179 ) ) ( not ( = ?auto_134172 ?auto_134177 ) ) ( not ( = ?auto_134172 ?auto_134175 ) ) ( not ( = ?auto_134172 ?auto_134179 ) ) ( ON ?auto_134171 ?auto_134176 ) ( not ( = ?auto_134171 ?auto_134176 ) ) ( not ( = ?auto_134172 ?auto_134176 ) ) ( not ( = ?auto_134173 ?auto_134176 ) ) ( not ( = ?auto_134174 ?auto_134176 ) ) ( not ( = ?auto_134178 ?auto_134176 ) ) ( not ( = ?auto_134177 ?auto_134176 ) ) ( not ( = ?auto_134175 ?auto_134176 ) ) ( not ( = ?auto_134179 ?auto_134176 ) ) ( ON ?auto_134172 ?auto_134171 ) ( ON-TABLE ?auto_134176 ) ( ON ?auto_134173 ?auto_134172 ) ( ON ?auto_134174 ?auto_134173 ) ( ON ?auto_134178 ?auto_134174 ) ( ON ?auto_134179 ?auto_134178 ) ( CLEAR ?auto_134177 ) ( ON ?auto_134175 ?auto_134179 ) ( CLEAR ?auto_134175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134176 ?auto_134171 ?auto_134172 ?auto_134173 ?auto_134174 ?auto_134178 ?auto_134179 )
      ( MAKE-4PILE ?auto_134171 ?auto_134172 ?auto_134173 ?auto_134174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134180 - BLOCK
      ?auto_134181 - BLOCK
      ?auto_134182 - BLOCK
      ?auto_134183 - BLOCK
    )
    :vars
    (
      ?auto_134187 - BLOCK
      ?auto_134185 - BLOCK
      ?auto_134186 - BLOCK
      ?auto_134184 - BLOCK
      ?auto_134188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134180 ?auto_134181 ) ) ( not ( = ?auto_134180 ?auto_134182 ) ) ( not ( = ?auto_134180 ?auto_134183 ) ) ( not ( = ?auto_134181 ?auto_134182 ) ) ( not ( = ?auto_134181 ?auto_134183 ) ) ( not ( = ?auto_134182 ?auto_134183 ) ) ( not ( = ?auto_134180 ?auto_134187 ) ) ( not ( = ?auto_134181 ?auto_134187 ) ) ( not ( = ?auto_134182 ?auto_134187 ) ) ( not ( = ?auto_134183 ?auto_134187 ) ) ( not ( = ?auto_134185 ?auto_134186 ) ) ( not ( = ?auto_134185 ?auto_134184 ) ) ( not ( = ?auto_134185 ?auto_134187 ) ) ( not ( = ?auto_134185 ?auto_134183 ) ) ( not ( = ?auto_134185 ?auto_134182 ) ) ( not ( = ?auto_134186 ?auto_134184 ) ) ( not ( = ?auto_134186 ?auto_134187 ) ) ( not ( = ?auto_134186 ?auto_134183 ) ) ( not ( = ?auto_134186 ?auto_134182 ) ) ( not ( = ?auto_134184 ?auto_134187 ) ) ( not ( = ?auto_134184 ?auto_134183 ) ) ( not ( = ?auto_134184 ?auto_134182 ) ) ( not ( = ?auto_134180 ?auto_134185 ) ) ( not ( = ?auto_134180 ?auto_134186 ) ) ( not ( = ?auto_134180 ?auto_134184 ) ) ( not ( = ?auto_134181 ?auto_134185 ) ) ( not ( = ?auto_134181 ?auto_134186 ) ) ( not ( = ?auto_134181 ?auto_134184 ) ) ( ON ?auto_134180 ?auto_134188 ) ( not ( = ?auto_134180 ?auto_134188 ) ) ( not ( = ?auto_134181 ?auto_134188 ) ) ( not ( = ?auto_134182 ?auto_134188 ) ) ( not ( = ?auto_134183 ?auto_134188 ) ) ( not ( = ?auto_134187 ?auto_134188 ) ) ( not ( = ?auto_134185 ?auto_134188 ) ) ( not ( = ?auto_134186 ?auto_134188 ) ) ( not ( = ?auto_134184 ?auto_134188 ) ) ( ON ?auto_134181 ?auto_134180 ) ( ON-TABLE ?auto_134188 ) ( ON ?auto_134182 ?auto_134181 ) ( ON ?auto_134183 ?auto_134182 ) ( ON ?auto_134187 ?auto_134183 ) ( ON ?auto_134184 ?auto_134187 ) ( ON ?auto_134186 ?auto_134184 ) ( CLEAR ?auto_134186 ) ( HOLDING ?auto_134185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134185 )
      ( MAKE-4PILE ?auto_134180 ?auto_134181 ?auto_134182 ?auto_134183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134189 - BLOCK
      ?auto_134190 - BLOCK
      ?auto_134191 - BLOCK
      ?auto_134192 - BLOCK
    )
    :vars
    (
      ?auto_134193 - BLOCK
      ?auto_134196 - BLOCK
      ?auto_134197 - BLOCK
      ?auto_134195 - BLOCK
      ?auto_134194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134189 ?auto_134190 ) ) ( not ( = ?auto_134189 ?auto_134191 ) ) ( not ( = ?auto_134189 ?auto_134192 ) ) ( not ( = ?auto_134190 ?auto_134191 ) ) ( not ( = ?auto_134190 ?auto_134192 ) ) ( not ( = ?auto_134191 ?auto_134192 ) ) ( not ( = ?auto_134189 ?auto_134193 ) ) ( not ( = ?auto_134190 ?auto_134193 ) ) ( not ( = ?auto_134191 ?auto_134193 ) ) ( not ( = ?auto_134192 ?auto_134193 ) ) ( not ( = ?auto_134196 ?auto_134197 ) ) ( not ( = ?auto_134196 ?auto_134195 ) ) ( not ( = ?auto_134196 ?auto_134193 ) ) ( not ( = ?auto_134196 ?auto_134192 ) ) ( not ( = ?auto_134196 ?auto_134191 ) ) ( not ( = ?auto_134197 ?auto_134195 ) ) ( not ( = ?auto_134197 ?auto_134193 ) ) ( not ( = ?auto_134197 ?auto_134192 ) ) ( not ( = ?auto_134197 ?auto_134191 ) ) ( not ( = ?auto_134195 ?auto_134193 ) ) ( not ( = ?auto_134195 ?auto_134192 ) ) ( not ( = ?auto_134195 ?auto_134191 ) ) ( not ( = ?auto_134189 ?auto_134196 ) ) ( not ( = ?auto_134189 ?auto_134197 ) ) ( not ( = ?auto_134189 ?auto_134195 ) ) ( not ( = ?auto_134190 ?auto_134196 ) ) ( not ( = ?auto_134190 ?auto_134197 ) ) ( not ( = ?auto_134190 ?auto_134195 ) ) ( ON ?auto_134189 ?auto_134194 ) ( not ( = ?auto_134189 ?auto_134194 ) ) ( not ( = ?auto_134190 ?auto_134194 ) ) ( not ( = ?auto_134191 ?auto_134194 ) ) ( not ( = ?auto_134192 ?auto_134194 ) ) ( not ( = ?auto_134193 ?auto_134194 ) ) ( not ( = ?auto_134196 ?auto_134194 ) ) ( not ( = ?auto_134197 ?auto_134194 ) ) ( not ( = ?auto_134195 ?auto_134194 ) ) ( ON ?auto_134190 ?auto_134189 ) ( ON-TABLE ?auto_134194 ) ( ON ?auto_134191 ?auto_134190 ) ( ON ?auto_134192 ?auto_134191 ) ( ON ?auto_134193 ?auto_134192 ) ( ON ?auto_134195 ?auto_134193 ) ( ON ?auto_134197 ?auto_134195 ) ( ON ?auto_134196 ?auto_134197 ) ( CLEAR ?auto_134196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134194 ?auto_134189 ?auto_134190 ?auto_134191 ?auto_134192 ?auto_134193 ?auto_134195 ?auto_134197 )
      ( MAKE-4PILE ?auto_134189 ?auto_134190 ?auto_134191 ?auto_134192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134217 - BLOCK
      ?auto_134218 - BLOCK
      ?auto_134219 - BLOCK
    )
    :vars
    (
      ?auto_134220 - BLOCK
      ?auto_134221 - BLOCK
      ?auto_134222 - BLOCK
      ?auto_134223 - BLOCK
      ?auto_134224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134220 ?auto_134219 ) ( ON-TABLE ?auto_134217 ) ( ON ?auto_134218 ?auto_134217 ) ( ON ?auto_134219 ?auto_134218 ) ( not ( = ?auto_134217 ?auto_134218 ) ) ( not ( = ?auto_134217 ?auto_134219 ) ) ( not ( = ?auto_134217 ?auto_134220 ) ) ( not ( = ?auto_134218 ?auto_134219 ) ) ( not ( = ?auto_134218 ?auto_134220 ) ) ( not ( = ?auto_134219 ?auto_134220 ) ) ( not ( = ?auto_134217 ?auto_134221 ) ) ( not ( = ?auto_134217 ?auto_134222 ) ) ( not ( = ?auto_134218 ?auto_134221 ) ) ( not ( = ?auto_134218 ?auto_134222 ) ) ( not ( = ?auto_134219 ?auto_134221 ) ) ( not ( = ?auto_134219 ?auto_134222 ) ) ( not ( = ?auto_134220 ?auto_134221 ) ) ( not ( = ?auto_134220 ?auto_134222 ) ) ( not ( = ?auto_134221 ?auto_134222 ) ) ( ON ?auto_134221 ?auto_134220 ) ( CLEAR ?auto_134221 ) ( HOLDING ?auto_134222 ) ( CLEAR ?auto_134223 ) ( ON-TABLE ?auto_134224 ) ( ON ?auto_134223 ?auto_134224 ) ( not ( = ?auto_134224 ?auto_134223 ) ) ( not ( = ?auto_134224 ?auto_134222 ) ) ( not ( = ?auto_134223 ?auto_134222 ) ) ( not ( = ?auto_134217 ?auto_134223 ) ) ( not ( = ?auto_134217 ?auto_134224 ) ) ( not ( = ?auto_134218 ?auto_134223 ) ) ( not ( = ?auto_134218 ?auto_134224 ) ) ( not ( = ?auto_134219 ?auto_134223 ) ) ( not ( = ?auto_134219 ?auto_134224 ) ) ( not ( = ?auto_134220 ?auto_134223 ) ) ( not ( = ?auto_134220 ?auto_134224 ) ) ( not ( = ?auto_134221 ?auto_134223 ) ) ( not ( = ?auto_134221 ?auto_134224 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134224 ?auto_134223 ?auto_134222 )
      ( MAKE-3PILE ?auto_134217 ?auto_134218 ?auto_134219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134225 - BLOCK
      ?auto_134226 - BLOCK
      ?auto_134227 - BLOCK
    )
    :vars
    (
      ?auto_134231 - BLOCK
      ?auto_134232 - BLOCK
      ?auto_134229 - BLOCK
      ?auto_134230 - BLOCK
      ?auto_134228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134231 ?auto_134227 ) ( ON-TABLE ?auto_134225 ) ( ON ?auto_134226 ?auto_134225 ) ( ON ?auto_134227 ?auto_134226 ) ( not ( = ?auto_134225 ?auto_134226 ) ) ( not ( = ?auto_134225 ?auto_134227 ) ) ( not ( = ?auto_134225 ?auto_134231 ) ) ( not ( = ?auto_134226 ?auto_134227 ) ) ( not ( = ?auto_134226 ?auto_134231 ) ) ( not ( = ?auto_134227 ?auto_134231 ) ) ( not ( = ?auto_134225 ?auto_134232 ) ) ( not ( = ?auto_134225 ?auto_134229 ) ) ( not ( = ?auto_134226 ?auto_134232 ) ) ( not ( = ?auto_134226 ?auto_134229 ) ) ( not ( = ?auto_134227 ?auto_134232 ) ) ( not ( = ?auto_134227 ?auto_134229 ) ) ( not ( = ?auto_134231 ?auto_134232 ) ) ( not ( = ?auto_134231 ?auto_134229 ) ) ( not ( = ?auto_134232 ?auto_134229 ) ) ( ON ?auto_134232 ?auto_134231 ) ( CLEAR ?auto_134230 ) ( ON-TABLE ?auto_134228 ) ( ON ?auto_134230 ?auto_134228 ) ( not ( = ?auto_134228 ?auto_134230 ) ) ( not ( = ?auto_134228 ?auto_134229 ) ) ( not ( = ?auto_134230 ?auto_134229 ) ) ( not ( = ?auto_134225 ?auto_134230 ) ) ( not ( = ?auto_134225 ?auto_134228 ) ) ( not ( = ?auto_134226 ?auto_134230 ) ) ( not ( = ?auto_134226 ?auto_134228 ) ) ( not ( = ?auto_134227 ?auto_134230 ) ) ( not ( = ?auto_134227 ?auto_134228 ) ) ( not ( = ?auto_134231 ?auto_134230 ) ) ( not ( = ?auto_134231 ?auto_134228 ) ) ( not ( = ?auto_134232 ?auto_134230 ) ) ( not ( = ?auto_134232 ?auto_134228 ) ) ( ON ?auto_134229 ?auto_134232 ) ( CLEAR ?auto_134229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134225 ?auto_134226 ?auto_134227 ?auto_134231 ?auto_134232 )
      ( MAKE-3PILE ?auto_134225 ?auto_134226 ?auto_134227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134233 - BLOCK
      ?auto_134234 - BLOCK
      ?auto_134235 - BLOCK
    )
    :vars
    (
      ?auto_134237 - BLOCK
      ?auto_134238 - BLOCK
      ?auto_134240 - BLOCK
      ?auto_134239 - BLOCK
      ?auto_134236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134237 ?auto_134235 ) ( ON-TABLE ?auto_134233 ) ( ON ?auto_134234 ?auto_134233 ) ( ON ?auto_134235 ?auto_134234 ) ( not ( = ?auto_134233 ?auto_134234 ) ) ( not ( = ?auto_134233 ?auto_134235 ) ) ( not ( = ?auto_134233 ?auto_134237 ) ) ( not ( = ?auto_134234 ?auto_134235 ) ) ( not ( = ?auto_134234 ?auto_134237 ) ) ( not ( = ?auto_134235 ?auto_134237 ) ) ( not ( = ?auto_134233 ?auto_134238 ) ) ( not ( = ?auto_134233 ?auto_134240 ) ) ( not ( = ?auto_134234 ?auto_134238 ) ) ( not ( = ?auto_134234 ?auto_134240 ) ) ( not ( = ?auto_134235 ?auto_134238 ) ) ( not ( = ?auto_134235 ?auto_134240 ) ) ( not ( = ?auto_134237 ?auto_134238 ) ) ( not ( = ?auto_134237 ?auto_134240 ) ) ( not ( = ?auto_134238 ?auto_134240 ) ) ( ON ?auto_134238 ?auto_134237 ) ( ON-TABLE ?auto_134239 ) ( not ( = ?auto_134239 ?auto_134236 ) ) ( not ( = ?auto_134239 ?auto_134240 ) ) ( not ( = ?auto_134236 ?auto_134240 ) ) ( not ( = ?auto_134233 ?auto_134236 ) ) ( not ( = ?auto_134233 ?auto_134239 ) ) ( not ( = ?auto_134234 ?auto_134236 ) ) ( not ( = ?auto_134234 ?auto_134239 ) ) ( not ( = ?auto_134235 ?auto_134236 ) ) ( not ( = ?auto_134235 ?auto_134239 ) ) ( not ( = ?auto_134237 ?auto_134236 ) ) ( not ( = ?auto_134237 ?auto_134239 ) ) ( not ( = ?auto_134238 ?auto_134236 ) ) ( not ( = ?auto_134238 ?auto_134239 ) ) ( ON ?auto_134240 ?auto_134238 ) ( CLEAR ?auto_134240 ) ( HOLDING ?auto_134236 ) ( CLEAR ?auto_134239 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134239 ?auto_134236 )
      ( MAKE-3PILE ?auto_134233 ?auto_134234 ?auto_134235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134241 - BLOCK
      ?auto_134242 - BLOCK
      ?auto_134243 - BLOCK
    )
    :vars
    (
      ?auto_134246 - BLOCK
      ?auto_134244 - BLOCK
      ?auto_134245 - BLOCK
      ?auto_134247 - BLOCK
      ?auto_134248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134246 ?auto_134243 ) ( ON-TABLE ?auto_134241 ) ( ON ?auto_134242 ?auto_134241 ) ( ON ?auto_134243 ?auto_134242 ) ( not ( = ?auto_134241 ?auto_134242 ) ) ( not ( = ?auto_134241 ?auto_134243 ) ) ( not ( = ?auto_134241 ?auto_134246 ) ) ( not ( = ?auto_134242 ?auto_134243 ) ) ( not ( = ?auto_134242 ?auto_134246 ) ) ( not ( = ?auto_134243 ?auto_134246 ) ) ( not ( = ?auto_134241 ?auto_134244 ) ) ( not ( = ?auto_134241 ?auto_134245 ) ) ( not ( = ?auto_134242 ?auto_134244 ) ) ( not ( = ?auto_134242 ?auto_134245 ) ) ( not ( = ?auto_134243 ?auto_134244 ) ) ( not ( = ?auto_134243 ?auto_134245 ) ) ( not ( = ?auto_134246 ?auto_134244 ) ) ( not ( = ?auto_134246 ?auto_134245 ) ) ( not ( = ?auto_134244 ?auto_134245 ) ) ( ON ?auto_134244 ?auto_134246 ) ( ON-TABLE ?auto_134247 ) ( not ( = ?auto_134247 ?auto_134248 ) ) ( not ( = ?auto_134247 ?auto_134245 ) ) ( not ( = ?auto_134248 ?auto_134245 ) ) ( not ( = ?auto_134241 ?auto_134248 ) ) ( not ( = ?auto_134241 ?auto_134247 ) ) ( not ( = ?auto_134242 ?auto_134248 ) ) ( not ( = ?auto_134242 ?auto_134247 ) ) ( not ( = ?auto_134243 ?auto_134248 ) ) ( not ( = ?auto_134243 ?auto_134247 ) ) ( not ( = ?auto_134246 ?auto_134248 ) ) ( not ( = ?auto_134246 ?auto_134247 ) ) ( not ( = ?auto_134244 ?auto_134248 ) ) ( not ( = ?auto_134244 ?auto_134247 ) ) ( ON ?auto_134245 ?auto_134244 ) ( CLEAR ?auto_134247 ) ( ON ?auto_134248 ?auto_134245 ) ( CLEAR ?auto_134248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134241 ?auto_134242 ?auto_134243 ?auto_134246 ?auto_134244 ?auto_134245 )
      ( MAKE-3PILE ?auto_134241 ?auto_134242 ?auto_134243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134249 - BLOCK
      ?auto_134250 - BLOCK
      ?auto_134251 - BLOCK
    )
    :vars
    (
      ?auto_134256 - BLOCK
      ?auto_134255 - BLOCK
      ?auto_134253 - BLOCK
      ?auto_134252 - BLOCK
      ?auto_134254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134256 ?auto_134251 ) ( ON-TABLE ?auto_134249 ) ( ON ?auto_134250 ?auto_134249 ) ( ON ?auto_134251 ?auto_134250 ) ( not ( = ?auto_134249 ?auto_134250 ) ) ( not ( = ?auto_134249 ?auto_134251 ) ) ( not ( = ?auto_134249 ?auto_134256 ) ) ( not ( = ?auto_134250 ?auto_134251 ) ) ( not ( = ?auto_134250 ?auto_134256 ) ) ( not ( = ?auto_134251 ?auto_134256 ) ) ( not ( = ?auto_134249 ?auto_134255 ) ) ( not ( = ?auto_134249 ?auto_134253 ) ) ( not ( = ?auto_134250 ?auto_134255 ) ) ( not ( = ?auto_134250 ?auto_134253 ) ) ( not ( = ?auto_134251 ?auto_134255 ) ) ( not ( = ?auto_134251 ?auto_134253 ) ) ( not ( = ?auto_134256 ?auto_134255 ) ) ( not ( = ?auto_134256 ?auto_134253 ) ) ( not ( = ?auto_134255 ?auto_134253 ) ) ( ON ?auto_134255 ?auto_134256 ) ( not ( = ?auto_134252 ?auto_134254 ) ) ( not ( = ?auto_134252 ?auto_134253 ) ) ( not ( = ?auto_134254 ?auto_134253 ) ) ( not ( = ?auto_134249 ?auto_134254 ) ) ( not ( = ?auto_134249 ?auto_134252 ) ) ( not ( = ?auto_134250 ?auto_134254 ) ) ( not ( = ?auto_134250 ?auto_134252 ) ) ( not ( = ?auto_134251 ?auto_134254 ) ) ( not ( = ?auto_134251 ?auto_134252 ) ) ( not ( = ?auto_134256 ?auto_134254 ) ) ( not ( = ?auto_134256 ?auto_134252 ) ) ( not ( = ?auto_134255 ?auto_134254 ) ) ( not ( = ?auto_134255 ?auto_134252 ) ) ( ON ?auto_134253 ?auto_134255 ) ( ON ?auto_134254 ?auto_134253 ) ( CLEAR ?auto_134254 ) ( HOLDING ?auto_134252 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134252 )
      ( MAKE-3PILE ?auto_134249 ?auto_134250 ?auto_134251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134268 - BLOCK
      ?auto_134269 - BLOCK
      ?auto_134270 - BLOCK
    )
    :vars
    (
      ?auto_134271 - BLOCK
      ?auto_134275 - BLOCK
      ?auto_134272 - BLOCK
      ?auto_134273 - BLOCK
      ?auto_134274 - BLOCK
      ?auto_134276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134271 ?auto_134270 ) ( ON-TABLE ?auto_134268 ) ( ON ?auto_134269 ?auto_134268 ) ( ON ?auto_134270 ?auto_134269 ) ( not ( = ?auto_134268 ?auto_134269 ) ) ( not ( = ?auto_134268 ?auto_134270 ) ) ( not ( = ?auto_134268 ?auto_134271 ) ) ( not ( = ?auto_134269 ?auto_134270 ) ) ( not ( = ?auto_134269 ?auto_134271 ) ) ( not ( = ?auto_134270 ?auto_134271 ) ) ( not ( = ?auto_134268 ?auto_134275 ) ) ( not ( = ?auto_134268 ?auto_134272 ) ) ( not ( = ?auto_134269 ?auto_134275 ) ) ( not ( = ?auto_134269 ?auto_134272 ) ) ( not ( = ?auto_134270 ?auto_134275 ) ) ( not ( = ?auto_134270 ?auto_134272 ) ) ( not ( = ?auto_134271 ?auto_134275 ) ) ( not ( = ?auto_134271 ?auto_134272 ) ) ( not ( = ?auto_134275 ?auto_134272 ) ) ( ON ?auto_134275 ?auto_134271 ) ( not ( = ?auto_134273 ?auto_134274 ) ) ( not ( = ?auto_134273 ?auto_134272 ) ) ( not ( = ?auto_134274 ?auto_134272 ) ) ( not ( = ?auto_134268 ?auto_134274 ) ) ( not ( = ?auto_134268 ?auto_134273 ) ) ( not ( = ?auto_134269 ?auto_134274 ) ) ( not ( = ?auto_134269 ?auto_134273 ) ) ( not ( = ?auto_134270 ?auto_134274 ) ) ( not ( = ?auto_134270 ?auto_134273 ) ) ( not ( = ?auto_134271 ?auto_134274 ) ) ( not ( = ?auto_134271 ?auto_134273 ) ) ( not ( = ?auto_134275 ?auto_134274 ) ) ( not ( = ?auto_134275 ?auto_134273 ) ) ( ON ?auto_134272 ?auto_134275 ) ( ON ?auto_134274 ?auto_134272 ) ( CLEAR ?auto_134274 ) ( ON ?auto_134273 ?auto_134276 ) ( CLEAR ?auto_134273 ) ( HAND-EMPTY ) ( not ( = ?auto_134268 ?auto_134276 ) ) ( not ( = ?auto_134269 ?auto_134276 ) ) ( not ( = ?auto_134270 ?auto_134276 ) ) ( not ( = ?auto_134271 ?auto_134276 ) ) ( not ( = ?auto_134275 ?auto_134276 ) ) ( not ( = ?auto_134272 ?auto_134276 ) ) ( not ( = ?auto_134273 ?auto_134276 ) ) ( not ( = ?auto_134274 ?auto_134276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134273 ?auto_134276 )
      ( MAKE-3PILE ?auto_134268 ?auto_134269 ?auto_134270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134277 - BLOCK
      ?auto_134278 - BLOCK
      ?auto_134279 - BLOCK
    )
    :vars
    (
      ?auto_134280 - BLOCK
      ?auto_134283 - BLOCK
      ?auto_134282 - BLOCK
      ?auto_134285 - BLOCK
      ?auto_134284 - BLOCK
      ?auto_134281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134280 ?auto_134279 ) ( ON-TABLE ?auto_134277 ) ( ON ?auto_134278 ?auto_134277 ) ( ON ?auto_134279 ?auto_134278 ) ( not ( = ?auto_134277 ?auto_134278 ) ) ( not ( = ?auto_134277 ?auto_134279 ) ) ( not ( = ?auto_134277 ?auto_134280 ) ) ( not ( = ?auto_134278 ?auto_134279 ) ) ( not ( = ?auto_134278 ?auto_134280 ) ) ( not ( = ?auto_134279 ?auto_134280 ) ) ( not ( = ?auto_134277 ?auto_134283 ) ) ( not ( = ?auto_134277 ?auto_134282 ) ) ( not ( = ?auto_134278 ?auto_134283 ) ) ( not ( = ?auto_134278 ?auto_134282 ) ) ( not ( = ?auto_134279 ?auto_134283 ) ) ( not ( = ?auto_134279 ?auto_134282 ) ) ( not ( = ?auto_134280 ?auto_134283 ) ) ( not ( = ?auto_134280 ?auto_134282 ) ) ( not ( = ?auto_134283 ?auto_134282 ) ) ( ON ?auto_134283 ?auto_134280 ) ( not ( = ?auto_134285 ?auto_134284 ) ) ( not ( = ?auto_134285 ?auto_134282 ) ) ( not ( = ?auto_134284 ?auto_134282 ) ) ( not ( = ?auto_134277 ?auto_134284 ) ) ( not ( = ?auto_134277 ?auto_134285 ) ) ( not ( = ?auto_134278 ?auto_134284 ) ) ( not ( = ?auto_134278 ?auto_134285 ) ) ( not ( = ?auto_134279 ?auto_134284 ) ) ( not ( = ?auto_134279 ?auto_134285 ) ) ( not ( = ?auto_134280 ?auto_134284 ) ) ( not ( = ?auto_134280 ?auto_134285 ) ) ( not ( = ?auto_134283 ?auto_134284 ) ) ( not ( = ?auto_134283 ?auto_134285 ) ) ( ON ?auto_134282 ?auto_134283 ) ( ON ?auto_134285 ?auto_134281 ) ( CLEAR ?auto_134285 ) ( not ( = ?auto_134277 ?auto_134281 ) ) ( not ( = ?auto_134278 ?auto_134281 ) ) ( not ( = ?auto_134279 ?auto_134281 ) ) ( not ( = ?auto_134280 ?auto_134281 ) ) ( not ( = ?auto_134283 ?auto_134281 ) ) ( not ( = ?auto_134282 ?auto_134281 ) ) ( not ( = ?auto_134285 ?auto_134281 ) ) ( not ( = ?auto_134284 ?auto_134281 ) ) ( HOLDING ?auto_134284 ) ( CLEAR ?auto_134282 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134277 ?auto_134278 ?auto_134279 ?auto_134280 ?auto_134283 ?auto_134282 ?auto_134284 )
      ( MAKE-3PILE ?auto_134277 ?auto_134278 ?auto_134279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134286 - BLOCK
      ?auto_134287 - BLOCK
      ?auto_134288 - BLOCK
    )
    :vars
    (
      ?auto_134292 - BLOCK
      ?auto_134289 - BLOCK
      ?auto_134291 - BLOCK
      ?auto_134294 - BLOCK
      ?auto_134290 - BLOCK
      ?auto_134293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134292 ?auto_134288 ) ( ON-TABLE ?auto_134286 ) ( ON ?auto_134287 ?auto_134286 ) ( ON ?auto_134288 ?auto_134287 ) ( not ( = ?auto_134286 ?auto_134287 ) ) ( not ( = ?auto_134286 ?auto_134288 ) ) ( not ( = ?auto_134286 ?auto_134292 ) ) ( not ( = ?auto_134287 ?auto_134288 ) ) ( not ( = ?auto_134287 ?auto_134292 ) ) ( not ( = ?auto_134288 ?auto_134292 ) ) ( not ( = ?auto_134286 ?auto_134289 ) ) ( not ( = ?auto_134286 ?auto_134291 ) ) ( not ( = ?auto_134287 ?auto_134289 ) ) ( not ( = ?auto_134287 ?auto_134291 ) ) ( not ( = ?auto_134288 ?auto_134289 ) ) ( not ( = ?auto_134288 ?auto_134291 ) ) ( not ( = ?auto_134292 ?auto_134289 ) ) ( not ( = ?auto_134292 ?auto_134291 ) ) ( not ( = ?auto_134289 ?auto_134291 ) ) ( ON ?auto_134289 ?auto_134292 ) ( not ( = ?auto_134294 ?auto_134290 ) ) ( not ( = ?auto_134294 ?auto_134291 ) ) ( not ( = ?auto_134290 ?auto_134291 ) ) ( not ( = ?auto_134286 ?auto_134290 ) ) ( not ( = ?auto_134286 ?auto_134294 ) ) ( not ( = ?auto_134287 ?auto_134290 ) ) ( not ( = ?auto_134287 ?auto_134294 ) ) ( not ( = ?auto_134288 ?auto_134290 ) ) ( not ( = ?auto_134288 ?auto_134294 ) ) ( not ( = ?auto_134292 ?auto_134290 ) ) ( not ( = ?auto_134292 ?auto_134294 ) ) ( not ( = ?auto_134289 ?auto_134290 ) ) ( not ( = ?auto_134289 ?auto_134294 ) ) ( ON ?auto_134291 ?auto_134289 ) ( ON ?auto_134294 ?auto_134293 ) ( not ( = ?auto_134286 ?auto_134293 ) ) ( not ( = ?auto_134287 ?auto_134293 ) ) ( not ( = ?auto_134288 ?auto_134293 ) ) ( not ( = ?auto_134292 ?auto_134293 ) ) ( not ( = ?auto_134289 ?auto_134293 ) ) ( not ( = ?auto_134291 ?auto_134293 ) ) ( not ( = ?auto_134294 ?auto_134293 ) ) ( not ( = ?auto_134290 ?auto_134293 ) ) ( CLEAR ?auto_134291 ) ( ON ?auto_134290 ?auto_134294 ) ( CLEAR ?auto_134290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134293 ?auto_134294 )
      ( MAKE-3PILE ?auto_134286 ?auto_134287 ?auto_134288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134295 - BLOCK
      ?auto_134296 - BLOCK
      ?auto_134297 - BLOCK
    )
    :vars
    (
      ?auto_134298 - BLOCK
      ?auto_134301 - BLOCK
      ?auto_134303 - BLOCK
      ?auto_134302 - BLOCK
      ?auto_134300 - BLOCK
      ?auto_134299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134298 ?auto_134297 ) ( ON-TABLE ?auto_134295 ) ( ON ?auto_134296 ?auto_134295 ) ( ON ?auto_134297 ?auto_134296 ) ( not ( = ?auto_134295 ?auto_134296 ) ) ( not ( = ?auto_134295 ?auto_134297 ) ) ( not ( = ?auto_134295 ?auto_134298 ) ) ( not ( = ?auto_134296 ?auto_134297 ) ) ( not ( = ?auto_134296 ?auto_134298 ) ) ( not ( = ?auto_134297 ?auto_134298 ) ) ( not ( = ?auto_134295 ?auto_134301 ) ) ( not ( = ?auto_134295 ?auto_134303 ) ) ( not ( = ?auto_134296 ?auto_134301 ) ) ( not ( = ?auto_134296 ?auto_134303 ) ) ( not ( = ?auto_134297 ?auto_134301 ) ) ( not ( = ?auto_134297 ?auto_134303 ) ) ( not ( = ?auto_134298 ?auto_134301 ) ) ( not ( = ?auto_134298 ?auto_134303 ) ) ( not ( = ?auto_134301 ?auto_134303 ) ) ( ON ?auto_134301 ?auto_134298 ) ( not ( = ?auto_134302 ?auto_134300 ) ) ( not ( = ?auto_134302 ?auto_134303 ) ) ( not ( = ?auto_134300 ?auto_134303 ) ) ( not ( = ?auto_134295 ?auto_134300 ) ) ( not ( = ?auto_134295 ?auto_134302 ) ) ( not ( = ?auto_134296 ?auto_134300 ) ) ( not ( = ?auto_134296 ?auto_134302 ) ) ( not ( = ?auto_134297 ?auto_134300 ) ) ( not ( = ?auto_134297 ?auto_134302 ) ) ( not ( = ?auto_134298 ?auto_134300 ) ) ( not ( = ?auto_134298 ?auto_134302 ) ) ( not ( = ?auto_134301 ?auto_134300 ) ) ( not ( = ?auto_134301 ?auto_134302 ) ) ( ON ?auto_134302 ?auto_134299 ) ( not ( = ?auto_134295 ?auto_134299 ) ) ( not ( = ?auto_134296 ?auto_134299 ) ) ( not ( = ?auto_134297 ?auto_134299 ) ) ( not ( = ?auto_134298 ?auto_134299 ) ) ( not ( = ?auto_134301 ?auto_134299 ) ) ( not ( = ?auto_134303 ?auto_134299 ) ) ( not ( = ?auto_134302 ?auto_134299 ) ) ( not ( = ?auto_134300 ?auto_134299 ) ) ( ON ?auto_134300 ?auto_134302 ) ( CLEAR ?auto_134300 ) ( ON-TABLE ?auto_134299 ) ( HOLDING ?auto_134303 ) ( CLEAR ?auto_134301 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134295 ?auto_134296 ?auto_134297 ?auto_134298 ?auto_134301 ?auto_134303 )
      ( MAKE-3PILE ?auto_134295 ?auto_134296 ?auto_134297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134362 - BLOCK
      ?auto_134363 - BLOCK
      ?auto_134364 - BLOCK
      ?auto_134365 - BLOCK
      ?auto_134366 - BLOCK
    )
    :vars
    (
      ?auto_134367 - BLOCK
      ?auto_134368 - BLOCK
      ?auto_134369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134362 ) ( ON ?auto_134363 ?auto_134362 ) ( ON ?auto_134364 ?auto_134363 ) ( not ( = ?auto_134362 ?auto_134363 ) ) ( not ( = ?auto_134362 ?auto_134364 ) ) ( not ( = ?auto_134362 ?auto_134365 ) ) ( not ( = ?auto_134362 ?auto_134366 ) ) ( not ( = ?auto_134363 ?auto_134364 ) ) ( not ( = ?auto_134363 ?auto_134365 ) ) ( not ( = ?auto_134363 ?auto_134366 ) ) ( not ( = ?auto_134364 ?auto_134365 ) ) ( not ( = ?auto_134364 ?auto_134366 ) ) ( not ( = ?auto_134365 ?auto_134366 ) ) ( ON ?auto_134366 ?auto_134367 ) ( not ( = ?auto_134362 ?auto_134367 ) ) ( not ( = ?auto_134363 ?auto_134367 ) ) ( not ( = ?auto_134364 ?auto_134367 ) ) ( not ( = ?auto_134365 ?auto_134367 ) ) ( not ( = ?auto_134366 ?auto_134367 ) ) ( CLEAR ?auto_134364 ) ( ON ?auto_134365 ?auto_134366 ) ( CLEAR ?auto_134365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134368 ) ( ON ?auto_134369 ?auto_134368 ) ( ON ?auto_134367 ?auto_134369 ) ( not ( = ?auto_134368 ?auto_134369 ) ) ( not ( = ?auto_134368 ?auto_134367 ) ) ( not ( = ?auto_134368 ?auto_134366 ) ) ( not ( = ?auto_134368 ?auto_134365 ) ) ( not ( = ?auto_134369 ?auto_134367 ) ) ( not ( = ?auto_134369 ?auto_134366 ) ) ( not ( = ?auto_134369 ?auto_134365 ) ) ( not ( = ?auto_134362 ?auto_134368 ) ) ( not ( = ?auto_134362 ?auto_134369 ) ) ( not ( = ?auto_134363 ?auto_134368 ) ) ( not ( = ?auto_134363 ?auto_134369 ) ) ( not ( = ?auto_134364 ?auto_134368 ) ) ( not ( = ?auto_134364 ?auto_134369 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134368 ?auto_134369 ?auto_134367 ?auto_134366 )
      ( MAKE-5PILE ?auto_134362 ?auto_134363 ?auto_134364 ?auto_134365 ?auto_134366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134370 - BLOCK
      ?auto_134371 - BLOCK
      ?auto_134372 - BLOCK
      ?auto_134373 - BLOCK
      ?auto_134374 - BLOCK
    )
    :vars
    (
      ?auto_134376 - BLOCK
      ?auto_134377 - BLOCK
      ?auto_134375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134370 ) ( ON ?auto_134371 ?auto_134370 ) ( not ( = ?auto_134370 ?auto_134371 ) ) ( not ( = ?auto_134370 ?auto_134372 ) ) ( not ( = ?auto_134370 ?auto_134373 ) ) ( not ( = ?auto_134370 ?auto_134374 ) ) ( not ( = ?auto_134371 ?auto_134372 ) ) ( not ( = ?auto_134371 ?auto_134373 ) ) ( not ( = ?auto_134371 ?auto_134374 ) ) ( not ( = ?auto_134372 ?auto_134373 ) ) ( not ( = ?auto_134372 ?auto_134374 ) ) ( not ( = ?auto_134373 ?auto_134374 ) ) ( ON ?auto_134374 ?auto_134376 ) ( not ( = ?auto_134370 ?auto_134376 ) ) ( not ( = ?auto_134371 ?auto_134376 ) ) ( not ( = ?auto_134372 ?auto_134376 ) ) ( not ( = ?auto_134373 ?auto_134376 ) ) ( not ( = ?auto_134374 ?auto_134376 ) ) ( ON ?auto_134373 ?auto_134374 ) ( CLEAR ?auto_134373 ) ( ON-TABLE ?auto_134377 ) ( ON ?auto_134375 ?auto_134377 ) ( ON ?auto_134376 ?auto_134375 ) ( not ( = ?auto_134377 ?auto_134375 ) ) ( not ( = ?auto_134377 ?auto_134376 ) ) ( not ( = ?auto_134377 ?auto_134374 ) ) ( not ( = ?auto_134377 ?auto_134373 ) ) ( not ( = ?auto_134375 ?auto_134376 ) ) ( not ( = ?auto_134375 ?auto_134374 ) ) ( not ( = ?auto_134375 ?auto_134373 ) ) ( not ( = ?auto_134370 ?auto_134377 ) ) ( not ( = ?auto_134370 ?auto_134375 ) ) ( not ( = ?auto_134371 ?auto_134377 ) ) ( not ( = ?auto_134371 ?auto_134375 ) ) ( not ( = ?auto_134372 ?auto_134377 ) ) ( not ( = ?auto_134372 ?auto_134375 ) ) ( HOLDING ?auto_134372 ) ( CLEAR ?auto_134371 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134370 ?auto_134371 ?auto_134372 )
      ( MAKE-5PILE ?auto_134370 ?auto_134371 ?auto_134372 ?auto_134373 ?auto_134374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134378 - BLOCK
      ?auto_134379 - BLOCK
      ?auto_134380 - BLOCK
      ?auto_134381 - BLOCK
      ?auto_134382 - BLOCK
    )
    :vars
    (
      ?auto_134385 - BLOCK
      ?auto_134383 - BLOCK
      ?auto_134384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134378 ) ( ON ?auto_134379 ?auto_134378 ) ( not ( = ?auto_134378 ?auto_134379 ) ) ( not ( = ?auto_134378 ?auto_134380 ) ) ( not ( = ?auto_134378 ?auto_134381 ) ) ( not ( = ?auto_134378 ?auto_134382 ) ) ( not ( = ?auto_134379 ?auto_134380 ) ) ( not ( = ?auto_134379 ?auto_134381 ) ) ( not ( = ?auto_134379 ?auto_134382 ) ) ( not ( = ?auto_134380 ?auto_134381 ) ) ( not ( = ?auto_134380 ?auto_134382 ) ) ( not ( = ?auto_134381 ?auto_134382 ) ) ( ON ?auto_134382 ?auto_134385 ) ( not ( = ?auto_134378 ?auto_134385 ) ) ( not ( = ?auto_134379 ?auto_134385 ) ) ( not ( = ?auto_134380 ?auto_134385 ) ) ( not ( = ?auto_134381 ?auto_134385 ) ) ( not ( = ?auto_134382 ?auto_134385 ) ) ( ON ?auto_134381 ?auto_134382 ) ( ON-TABLE ?auto_134383 ) ( ON ?auto_134384 ?auto_134383 ) ( ON ?auto_134385 ?auto_134384 ) ( not ( = ?auto_134383 ?auto_134384 ) ) ( not ( = ?auto_134383 ?auto_134385 ) ) ( not ( = ?auto_134383 ?auto_134382 ) ) ( not ( = ?auto_134383 ?auto_134381 ) ) ( not ( = ?auto_134384 ?auto_134385 ) ) ( not ( = ?auto_134384 ?auto_134382 ) ) ( not ( = ?auto_134384 ?auto_134381 ) ) ( not ( = ?auto_134378 ?auto_134383 ) ) ( not ( = ?auto_134378 ?auto_134384 ) ) ( not ( = ?auto_134379 ?auto_134383 ) ) ( not ( = ?auto_134379 ?auto_134384 ) ) ( not ( = ?auto_134380 ?auto_134383 ) ) ( not ( = ?auto_134380 ?auto_134384 ) ) ( CLEAR ?auto_134379 ) ( ON ?auto_134380 ?auto_134381 ) ( CLEAR ?auto_134380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134383 ?auto_134384 ?auto_134385 ?auto_134382 ?auto_134381 )
      ( MAKE-5PILE ?auto_134378 ?auto_134379 ?auto_134380 ?auto_134381 ?auto_134382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134386 - BLOCK
      ?auto_134387 - BLOCK
      ?auto_134388 - BLOCK
      ?auto_134389 - BLOCK
      ?auto_134390 - BLOCK
    )
    :vars
    (
      ?auto_134393 - BLOCK
      ?auto_134392 - BLOCK
      ?auto_134391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134386 ) ( not ( = ?auto_134386 ?auto_134387 ) ) ( not ( = ?auto_134386 ?auto_134388 ) ) ( not ( = ?auto_134386 ?auto_134389 ) ) ( not ( = ?auto_134386 ?auto_134390 ) ) ( not ( = ?auto_134387 ?auto_134388 ) ) ( not ( = ?auto_134387 ?auto_134389 ) ) ( not ( = ?auto_134387 ?auto_134390 ) ) ( not ( = ?auto_134388 ?auto_134389 ) ) ( not ( = ?auto_134388 ?auto_134390 ) ) ( not ( = ?auto_134389 ?auto_134390 ) ) ( ON ?auto_134390 ?auto_134393 ) ( not ( = ?auto_134386 ?auto_134393 ) ) ( not ( = ?auto_134387 ?auto_134393 ) ) ( not ( = ?auto_134388 ?auto_134393 ) ) ( not ( = ?auto_134389 ?auto_134393 ) ) ( not ( = ?auto_134390 ?auto_134393 ) ) ( ON ?auto_134389 ?auto_134390 ) ( ON-TABLE ?auto_134392 ) ( ON ?auto_134391 ?auto_134392 ) ( ON ?auto_134393 ?auto_134391 ) ( not ( = ?auto_134392 ?auto_134391 ) ) ( not ( = ?auto_134392 ?auto_134393 ) ) ( not ( = ?auto_134392 ?auto_134390 ) ) ( not ( = ?auto_134392 ?auto_134389 ) ) ( not ( = ?auto_134391 ?auto_134393 ) ) ( not ( = ?auto_134391 ?auto_134390 ) ) ( not ( = ?auto_134391 ?auto_134389 ) ) ( not ( = ?auto_134386 ?auto_134392 ) ) ( not ( = ?auto_134386 ?auto_134391 ) ) ( not ( = ?auto_134387 ?auto_134392 ) ) ( not ( = ?auto_134387 ?auto_134391 ) ) ( not ( = ?auto_134388 ?auto_134392 ) ) ( not ( = ?auto_134388 ?auto_134391 ) ) ( ON ?auto_134388 ?auto_134389 ) ( CLEAR ?auto_134388 ) ( HOLDING ?auto_134387 ) ( CLEAR ?auto_134386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134386 ?auto_134387 )
      ( MAKE-5PILE ?auto_134386 ?auto_134387 ?auto_134388 ?auto_134389 ?auto_134390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134394 - BLOCK
      ?auto_134395 - BLOCK
      ?auto_134396 - BLOCK
      ?auto_134397 - BLOCK
      ?auto_134398 - BLOCK
    )
    :vars
    (
      ?auto_134401 - BLOCK
      ?auto_134400 - BLOCK
      ?auto_134399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134394 ) ( not ( = ?auto_134394 ?auto_134395 ) ) ( not ( = ?auto_134394 ?auto_134396 ) ) ( not ( = ?auto_134394 ?auto_134397 ) ) ( not ( = ?auto_134394 ?auto_134398 ) ) ( not ( = ?auto_134395 ?auto_134396 ) ) ( not ( = ?auto_134395 ?auto_134397 ) ) ( not ( = ?auto_134395 ?auto_134398 ) ) ( not ( = ?auto_134396 ?auto_134397 ) ) ( not ( = ?auto_134396 ?auto_134398 ) ) ( not ( = ?auto_134397 ?auto_134398 ) ) ( ON ?auto_134398 ?auto_134401 ) ( not ( = ?auto_134394 ?auto_134401 ) ) ( not ( = ?auto_134395 ?auto_134401 ) ) ( not ( = ?auto_134396 ?auto_134401 ) ) ( not ( = ?auto_134397 ?auto_134401 ) ) ( not ( = ?auto_134398 ?auto_134401 ) ) ( ON ?auto_134397 ?auto_134398 ) ( ON-TABLE ?auto_134400 ) ( ON ?auto_134399 ?auto_134400 ) ( ON ?auto_134401 ?auto_134399 ) ( not ( = ?auto_134400 ?auto_134399 ) ) ( not ( = ?auto_134400 ?auto_134401 ) ) ( not ( = ?auto_134400 ?auto_134398 ) ) ( not ( = ?auto_134400 ?auto_134397 ) ) ( not ( = ?auto_134399 ?auto_134401 ) ) ( not ( = ?auto_134399 ?auto_134398 ) ) ( not ( = ?auto_134399 ?auto_134397 ) ) ( not ( = ?auto_134394 ?auto_134400 ) ) ( not ( = ?auto_134394 ?auto_134399 ) ) ( not ( = ?auto_134395 ?auto_134400 ) ) ( not ( = ?auto_134395 ?auto_134399 ) ) ( not ( = ?auto_134396 ?auto_134400 ) ) ( not ( = ?auto_134396 ?auto_134399 ) ) ( ON ?auto_134396 ?auto_134397 ) ( CLEAR ?auto_134394 ) ( ON ?auto_134395 ?auto_134396 ) ( CLEAR ?auto_134395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134400 ?auto_134399 ?auto_134401 ?auto_134398 ?auto_134397 ?auto_134396 )
      ( MAKE-5PILE ?auto_134394 ?auto_134395 ?auto_134396 ?auto_134397 ?auto_134398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134402 - BLOCK
      ?auto_134403 - BLOCK
      ?auto_134404 - BLOCK
      ?auto_134405 - BLOCK
      ?auto_134406 - BLOCK
    )
    :vars
    (
      ?auto_134407 - BLOCK
      ?auto_134409 - BLOCK
      ?auto_134408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134402 ?auto_134403 ) ) ( not ( = ?auto_134402 ?auto_134404 ) ) ( not ( = ?auto_134402 ?auto_134405 ) ) ( not ( = ?auto_134402 ?auto_134406 ) ) ( not ( = ?auto_134403 ?auto_134404 ) ) ( not ( = ?auto_134403 ?auto_134405 ) ) ( not ( = ?auto_134403 ?auto_134406 ) ) ( not ( = ?auto_134404 ?auto_134405 ) ) ( not ( = ?auto_134404 ?auto_134406 ) ) ( not ( = ?auto_134405 ?auto_134406 ) ) ( ON ?auto_134406 ?auto_134407 ) ( not ( = ?auto_134402 ?auto_134407 ) ) ( not ( = ?auto_134403 ?auto_134407 ) ) ( not ( = ?auto_134404 ?auto_134407 ) ) ( not ( = ?auto_134405 ?auto_134407 ) ) ( not ( = ?auto_134406 ?auto_134407 ) ) ( ON ?auto_134405 ?auto_134406 ) ( ON-TABLE ?auto_134409 ) ( ON ?auto_134408 ?auto_134409 ) ( ON ?auto_134407 ?auto_134408 ) ( not ( = ?auto_134409 ?auto_134408 ) ) ( not ( = ?auto_134409 ?auto_134407 ) ) ( not ( = ?auto_134409 ?auto_134406 ) ) ( not ( = ?auto_134409 ?auto_134405 ) ) ( not ( = ?auto_134408 ?auto_134407 ) ) ( not ( = ?auto_134408 ?auto_134406 ) ) ( not ( = ?auto_134408 ?auto_134405 ) ) ( not ( = ?auto_134402 ?auto_134409 ) ) ( not ( = ?auto_134402 ?auto_134408 ) ) ( not ( = ?auto_134403 ?auto_134409 ) ) ( not ( = ?auto_134403 ?auto_134408 ) ) ( not ( = ?auto_134404 ?auto_134409 ) ) ( not ( = ?auto_134404 ?auto_134408 ) ) ( ON ?auto_134404 ?auto_134405 ) ( ON ?auto_134403 ?auto_134404 ) ( CLEAR ?auto_134403 ) ( HOLDING ?auto_134402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134402 )
      ( MAKE-5PILE ?auto_134402 ?auto_134403 ?auto_134404 ?auto_134405 ?auto_134406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134410 - BLOCK
      ?auto_134411 - BLOCK
      ?auto_134412 - BLOCK
      ?auto_134413 - BLOCK
      ?auto_134414 - BLOCK
    )
    :vars
    (
      ?auto_134416 - BLOCK
      ?auto_134417 - BLOCK
      ?auto_134415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134410 ?auto_134411 ) ) ( not ( = ?auto_134410 ?auto_134412 ) ) ( not ( = ?auto_134410 ?auto_134413 ) ) ( not ( = ?auto_134410 ?auto_134414 ) ) ( not ( = ?auto_134411 ?auto_134412 ) ) ( not ( = ?auto_134411 ?auto_134413 ) ) ( not ( = ?auto_134411 ?auto_134414 ) ) ( not ( = ?auto_134412 ?auto_134413 ) ) ( not ( = ?auto_134412 ?auto_134414 ) ) ( not ( = ?auto_134413 ?auto_134414 ) ) ( ON ?auto_134414 ?auto_134416 ) ( not ( = ?auto_134410 ?auto_134416 ) ) ( not ( = ?auto_134411 ?auto_134416 ) ) ( not ( = ?auto_134412 ?auto_134416 ) ) ( not ( = ?auto_134413 ?auto_134416 ) ) ( not ( = ?auto_134414 ?auto_134416 ) ) ( ON ?auto_134413 ?auto_134414 ) ( ON-TABLE ?auto_134417 ) ( ON ?auto_134415 ?auto_134417 ) ( ON ?auto_134416 ?auto_134415 ) ( not ( = ?auto_134417 ?auto_134415 ) ) ( not ( = ?auto_134417 ?auto_134416 ) ) ( not ( = ?auto_134417 ?auto_134414 ) ) ( not ( = ?auto_134417 ?auto_134413 ) ) ( not ( = ?auto_134415 ?auto_134416 ) ) ( not ( = ?auto_134415 ?auto_134414 ) ) ( not ( = ?auto_134415 ?auto_134413 ) ) ( not ( = ?auto_134410 ?auto_134417 ) ) ( not ( = ?auto_134410 ?auto_134415 ) ) ( not ( = ?auto_134411 ?auto_134417 ) ) ( not ( = ?auto_134411 ?auto_134415 ) ) ( not ( = ?auto_134412 ?auto_134417 ) ) ( not ( = ?auto_134412 ?auto_134415 ) ) ( ON ?auto_134412 ?auto_134413 ) ( ON ?auto_134411 ?auto_134412 ) ( ON ?auto_134410 ?auto_134411 ) ( CLEAR ?auto_134410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134417 ?auto_134415 ?auto_134416 ?auto_134414 ?auto_134413 ?auto_134412 ?auto_134411 )
      ( MAKE-5PILE ?auto_134410 ?auto_134411 ?auto_134412 ?auto_134413 ?auto_134414 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134423 - BLOCK
      ?auto_134424 - BLOCK
      ?auto_134425 - BLOCK
      ?auto_134426 - BLOCK
      ?auto_134427 - BLOCK
    )
    :vars
    (
      ?auto_134430 - BLOCK
      ?auto_134428 - BLOCK
      ?auto_134429 - BLOCK
      ?auto_134431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134423 ?auto_134424 ) ) ( not ( = ?auto_134423 ?auto_134425 ) ) ( not ( = ?auto_134423 ?auto_134426 ) ) ( not ( = ?auto_134423 ?auto_134427 ) ) ( not ( = ?auto_134424 ?auto_134425 ) ) ( not ( = ?auto_134424 ?auto_134426 ) ) ( not ( = ?auto_134424 ?auto_134427 ) ) ( not ( = ?auto_134425 ?auto_134426 ) ) ( not ( = ?auto_134425 ?auto_134427 ) ) ( not ( = ?auto_134426 ?auto_134427 ) ) ( ON ?auto_134427 ?auto_134430 ) ( not ( = ?auto_134423 ?auto_134430 ) ) ( not ( = ?auto_134424 ?auto_134430 ) ) ( not ( = ?auto_134425 ?auto_134430 ) ) ( not ( = ?auto_134426 ?auto_134430 ) ) ( not ( = ?auto_134427 ?auto_134430 ) ) ( ON ?auto_134426 ?auto_134427 ) ( ON-TABLE ?auto_134428 ) ( ON ?auto_134429 ?auto_134428 ) ( ON ?auto_134430 ?auto_134429 ) ( not ( = ?auto_134428 ?auto_134429 ) ) ( not ( = ?auto_134428 ?auto_134430 ) ) ( not ( = ?auto_134428 ?auto_134427 ) ) ( not ( = ?auto_134428 ?auto_134426 ) ) ( not ( = ?auto_134429 ?auto_134430 ) ) ( not ( = ?auto_134429 ?auto_134427 ) ) ( not ( = ?auto_134429 ?auto_134426 ) ) ( not ( = ?auto_134423 ?auto_134428 ) ) ( not ( = ?auto_134423 ?auto_134429 ) ) ( not ( = ?auto_134424 ?auto_134428 ) ) ( not ( = ?auto_134424 ?auto_134429 ) ) ( not ( = ?auto_134425 ?auto_134428 ) ) ( not ( = ?auto_134425 ?auto_134429 ) ) ( ON ?auto_134425 ?auto_134426 ) ( ON ?auto_134424 ?auto_134425 ) ( CLEAR ?auto_134424 ) ( ON ?auto_134423 ?auto_134431 ) ( CLEAR ?auto_134423 ) ( HAND-EMPTY ) ( not ( = ?auto_134423 ?auto_134431 ) ) ( not ( = ?auto_134424 ?auto_134431 ) ) ( not ( = ?auto_134425 ?auto_134431 ) ) ( not ( = ?auto_134426 ?auto_134431 ) ) ( not ( = ?auto_134427 ?auto_134431 ) ) ( not ( = ?auto_134430 ?auto_134431 ) ) ( not ( = ?auto_134428 ?auto_134431 ) ) ( not ( = ?auto_134429 ?auto_134431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134423 ?auto_134431 )
      ( MAKE-5PILE ?auto_134423 ?auto_134424 ?auto_134425 ?auto_134426 ?auto_134427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134432 - BLOCK
      ?auto_134433 - BLOCK
      ?auto_134434 - BLOCK
      ?auto_134435 - BLOCK
      ?auto_134436 - BLOCK
    )
    :vars
    (
      ?auto_134437 - BLOCK
      ?auto_134438 - BLOCK
      ?auto_134440 - BLOCK
      ?auto_134439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134432 ?auto_134433 ) ) ( not ( = ?auto_134432 ?auto_134434 ) ) ( not ( = ?auto_134432 ?auto_134435 ) ) ( not ( = ?auto_134432 ?auto_134436 ) ) ( not ( = ?auto_134433 ?auto_134434 ) ) ( not ( = ?auto_134433 ?auto_134435 ) ) ( not ( = ?auto_134433 ?auto_134436 ) ) ( not ( = ?auto_134434 ?auto_134435 ) ) ( not ( = ?auto_134434 ?auto_134436 ) ) ( not ( = ?auto_134435 ?auto_134436 ) ) ( ON ?auto_134436 ?auto_134437 ) ( not ( = ?auto_134432 ?auto_134437 ) ) ( not ( = ?auto_134433 ?auto_134437 ) ) ( not ( = ?auto_134434 ?auto_134437 ) ) ( not ( = ?auto_134435 ?auto_134437 ) ) ( not ( = ?auto_134436 ?auto_134437 ) ) ( ON ?auto_134435 ?auto_134436 ) ( ON-TABLE ?auto_134438 ) ( ON ?auto_134440 ?auto_134438 ) ( ON ?auto_134437 ?auto_134440 ) ( not ( = ?auto_134438 ?auto_134440 ) ) ( not ( = ?auto_134438 ?auto_134437 ) ) ( not ( = ?auto_134438 ?auto_134436 ) ) ( not ( = ?auto_134438 ?auto_134435 ) ) ( not ( = ?auto_134440 ?auto_134437 ) ) ( not ( = ?auto_134440 ?auto_134436 ) ) ( not ( = ?auto_134440 ?auto_134435 ) ) ( not ( = ?auto_134432 ?auto_134438 ) ) ( not ( = ?auto_134432 ?auto_134440 ) ) ( not ( = ?auto_134433 ?auto_134438 ) ) ( not ( = ?auto_134433 ?auto_134440 ) ) ( not ( = ?auto_134434 ?auto_134438 ) ) ( not ( = ?auto_134434 ?auto_134440 ) ) ( ON ?auto_134434 ?auto_134435 ) ( ON ?auto_134432 ?auto_134439 ) ( CLEAR ?auto_134432 ) ( not ( = ?auto_134432 ?auto_134439 ) ) ( not ( = ?auto_134433 ?auto_134439 ) ) ( not ( = ?auto_134434 ?auto_134439 ) ) ( not ( = ?auto_134435 ?auto_134439 ) ) ( not ( = ?auto_134436 ?auto_134439 ) ) ( not ( = ?auto_134437 ?auto_134439 ) ) ( not ( = ?auto_134438 ?auto_134439 ) ) ( not ( = ?auto_134440 ?auto_134439 ) ) ( HOLDING ?auto_134433 ) ( CLEAR ?auto_134434 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134438 ?auto_134440 ?auto_134437 ?auto_134436 ?auto_134435 ?auto_134434 ?auto_134433 )
      ( MAKE-5PILE ?auto_134432 ?auto_134433 ?auto_134434 ?auto_134435 ?auto_134436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134441 - BLOCK
      ?auto_134442 - BLOCK
      ?auto_134443 - BLOCK
      ?auto_134444 - BLOCK
      ?auto_134445 - BLOCK
    )
    :vars
    (
      ?auto_134446 - BLOCK
      ?auto_134447 - BLOCK
      ?auto_134449 - BLOCK
      ?auto_134448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134441 ?auto_134442 ) ) ( not ( = ?auto_134441 ?auto_134443 ) ) ( not ( = ?auto_134441 ?auto_134444 ) ) ( not ( = ?auto_134441 ?auto_134445 ) ) ( not ( = ?auto_134442 ?auto_134443 ) ) ( not ( = ?auto_134442 ?auto_134444 ) ) ( not ( = ?auto_134442 ?auto_134445 ) ) ( not ( = ?auto_134443 ?auto_134444 ) ) ( not ( = ?auto_134443 ?auto_134445 ) ) ( not ( = ?auto_134444 ?auto_134445 ) ) ( ON ?auto_134445 ?auto_134446 ) ( not ( = ?auto_134441 ?auto_134446 ) ) ( not ( = ?auto_134442 ?auto_134446 ) ) ( not ( = ?auto_134443 ?auto_134446 ) ) ( not ( = ?auto_134444 ?auto_134446 ) ) ( not ( = ?auto_134445 ?auto_134446 ) ) ( ON ?auto_134444 ?auto_134445 ) ( ON-TABLE ?auto_134447 ) ( ON ?auto_134449 ?auto_134447 ) ( ON ?auto_134446 ?auto_134449 ) ( not ( = ?auto_134447 ?auto_134449 ) ) ( not ( = ?auto_134447 ?auto_134446 ) ) ( not ( = ?auto_134447 ?auto_134445 ) ) ( not ( = ?auto_134447 ?auto_134444 ) ) ( not ( = ?auto_134449 ?auto_134446 ) ) ( not ( = ?auto_134449 ?auto_134445 ) ) ( not ( = ?auto_134449 ?auto_134444 ) ) ( not ( = ?auto_134441 ?auto_134447 ) ) ( not ( = ?auto_134441 ?auto_134449 ) ) ( not ( = ?auto_134442 ?auto_134447 ) ) ( not ( = ?auto_134442 ?auto_134449 ) ) ( not ( = ?auto_134443 ?auto_134447 ) ) ( not ( = ?auto_134443 ?auto_134449 ) ) ( ON ?auto_134443 ?auto_134444 ) ( ON ?auto_134441 ?auto_134448 ) ( not ( = ?auto_134441 ?auto_134448 ) ) ( not ( = ?auto_134442 ?auto_134448 ) ) ( not ( = ?auto_134443 ?auto_134448 ) ) ( not ( = ?auto_134444 ?auto_134448 ) ) ( not ( = ?auto_134445 ?auto_134448 ) ) ( not ( = ?auto_134446 ?auto_134448 ) ) ( not ( = ?auto_134447 ?auto_134448 ) ) ( not ( = ?auto_134449 ?auto_134448 ) ) ( CLEAR ?auto_134443 ) ( ON ?auto_134442 ?auto_134441 ) ( CLEAR ?auto_134442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134448 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134448 ?auto_134441 )
      ( MAKE-5PILE ?auto_134441 ?auto_134442 ?auto_134443 ?auto_134444 ?auto_134445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134450 - BLOCK
      ?auto_134451 - BLOCK
      ?auto_134452 - BLOCK
      ?auto_134453 - BLOCK
      ?auto_134454 - BLOCK
    )
    :vars
    (
      ?auto_134458 - BLOCK
      ?auto_134457 - BLOCK
      ?auto_134456 - BLOCK
      ?auto_134455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134450 ?auto_134451 ) ) ( not ( = ?auto_134450 ?auto_134452 ) ) ( not ( = ?auto_134450 ?auto_134453 ) ) ( not ( = ?auto_134450 ?auto_134454 ) ) ( not ( = ?auto_134451 ?auto_134452 ) ) ( not ( = ?auto_134451 ?auto_134453 ) ) ( not ( = ?auto_134451 ?auto_134454 ) ) ( not ( = ?auto_134452 ?auto_134453 ) ) ( not ( = ?auto_134452 ?auto_134454 ) ) ( not ( = ?auto_134453 ?auto_134454 ) ) ( ON ?auto_134454 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134458 ) ) ( not ( = ?auto_134451 ?auto_134458 ) ) ( not ( = ?auto_134452 ?auto_134458 ) ) ( not ( = ?auto_134453 ?auto_134458 ) ) ( not ( = ?auto_134454 ?auto_134458 ) ) ( ON ?auto_134453 ?auto_134454 ) ( ON-TABLE ?auto_134457 ) ( ON ?auto_134456 ?auto_134457 ) ( ON ?auto_134458 ?auto_134456 ) ( not ( = ?auto_134457 ?auto_134456 ) ) ( not ( = ?auto_134457 ?auto_134458 ) ) ( not ( = ?auto_134457 ?auto_134454 ) ) ( not ( = ?auto_134457 ?auto_134453 ) ) ( not ( = ?auto_134456 ?auto_134458 ) ) ( not ( = ?auto_134456 ?auto_134454 ) ) ( not ( = ?auto_134456 ?auto_134453 ) ) ( not ( = ?auto_134450 ?auto_134457 ) ) ( not ( = ?auto_134450 ?auto_134456 ) ) ( not ( = ?auto_134451 ?auto_134457 ) ) ( not ( = ?auto_134451 ?auto_134456 ) ) ( not ( = ?auto_134452 ?auto_134457 ) ) ( not ( = ?auto_134452 ?auto_134456 ) ) ( ON ?auto_134450 ?auto_134455 ) ( not ( = ?auto_134450 ?auto_134455 ) ) ( not ( = ?auto_134451 ?auto_134455 ) ) ( not ( = ?auto_134452 ?auto_134455 ) ) ( not ( = ?auto_134453 ?auto_134455 ) ) ( not ( = ?auto_134454 ?auto_134455 ) ) ( not ( = ?auto_134458 ?auto_134455 ) ) ( not ( = ?auto_134457 ?auto_134455 ) ) ( not ( = ?auto_134456 ?auto_134455 ) ) ( ON ?auto_134451 ?auto_134450 ) ( CLEAR ?auto_134451 ) ( ON-TABLE ?auto_134455 ) ( HOLDING ?auto_134452 ) ( CLEAR ?auto_134453 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134457 ?auto_134456 ?auto_134458 ?auto_134454 ?auto_134453 ?auto_134452 )
      ( MAKE-5PILE ?auto_134450 ?auto_134451 ?auto_134452 ?auto_134453 ?auto_134454 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134459 - BLOCK
      ?auto_134460 - BLOCK
      ?auto_134461 - BLOCK
      ?auto_134462 - BLOCK
      ?auto_134463 - BLOCK
    )
    :vars
    (
      ?auto_134464 - BLOCK
      ?auto_134467 - BLOCK
      ?auto_134466 - BLOCK
      ?auto_134465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134459 ?auto_134460 ) ) ( not ( = ?auto_134459 ?auto_134461 ) ) ( not ( = ?auto_134459 ?auto_134462 ) ) ( not ( = ?auto_134459 ?auto_134463 ) ) ( not ( = ?auto_134460 ?auto_134461 ) ) ( not ( = ?auto_134460 ?auto_134462 ) ) ( not ( = ?auto_134460 ?auto_134463 ) ) ( not ( = ?auto_134461 ?auto_134462 ) ) ( not ( = ?auto_134461 ?auto_134463 ) ) ( not ( = ?auto_134462 ?auto_134463 ) ) ( ON ?auto_134463 ?auto_134464 ) ( not ( = ?auto_134459 ?auto_134464 ) ) ( not ( = ?auto_134460 ?auto_134464 ) ) ( not ( = ?auto_134461 ?auto_134464 ) ) ( not ( = ?auto_134462 ?auto_134464 ) ) ( not ( = ?auto_134463 ?auto_134464 ) ) ( ON ?auto_134462 ?auto_134463 ) ( ON-TABLE ?auto_134467 ) ( ON ?auto_134466 ?auto_134467 ) ( ON ?auto_134464 ?auto_134466 ) ( not ( = ?auto_134467 ?auto_134466 ) ) ( not ( = ?auto_134467 ?auto_134464 ) ) ( not ( = ?auto_134467 ?auto_134463 ) ) ( not ( = ?auto_134467 ?auto_134462 ) ) ( not ( = ?auto_134466 ?auto_134464 ) ) ( not ( = ?auto_134466 ?auto_134463 ) ) ( not ( = ?auto_134466 ?auto_134462 ) ) ( not ( = ?auto_134459 ?auto_134467 ) ) ( not ( = ?auto_134459 ?auto_134466 ) ) ( not ( = ?auto_134460 ?auto_134467 ) ) ( not ( = ?auto_134460 ?auto_134466 ) ) ( not ( = ?auto_134461 ?auto_134467 ) ) ( not ( = ?auto_134461 ?auto_134466 ) ) ( ON ?auto_134459 ?auto_134465 ) ( not ( = ?auto_134459 ?auto_134465 ) ) ( not ( = ?auto_134460 ?auto_134465 ) ) ( not ( = ?auto_134461 ?auto_134465 ) ) ( not ( = ?auto_134462 ?auto_134465 ) ) ( not ( = ?auto_134463 ?auto_134465 ) ) ( not ( = ?auto_134464 ?auto_134465 ) ) ( not ( = ?auto_134467 ?auto_134465 ) ) ( not ( = ?auto_134466 ?auto_134465 ) ) ( ON ?auto_134460 ?auto_134459 ) ( ON-TABLE ?auto_134465 ) ( CLEAR ?auto_134462 ) ( ON ?auto_134461 ?auto_134460 ) ( CLEAR ?auto_134461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134465 ?auto_134459 ?auto_134460 )
      ( MAKE-5PILE ?auto_134459 ?auto_134460 ?auto_134461 ?auto_134462 ?auto_134463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134468 - BLOCK
      ?auto_134469 - BLOCK
      ?auto_134470 - BLOCK
      ?auto_134471 - BLOCK
      ?auto_134472 - BLOCK
    )
    :vars
    (
      ?auto_134474 - BLOCK
      ?auto_134476 - BLOCK
      ?auto_134473 - BLOCK
      ?auto_134475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134468 ?auto_134469 ) ) ( not ( = ?auto_134468 ?auto_134470 ) ) ( not ( = ?auto_134468 ?auto_134471 ) ) ( not ( = ?auto_134468 ?auto_134472 ) ) ( not ( = ?auto_134469 ?auto_134470 ) ) ( not ( = ?auto_134469 ?auto_134471 ) ) ( not ( = ?auto_134469 ?auto_134472 ) ) ( not ( = ?auto_134470 ?auto_134471 ) ) ( not ( = ?auto_134470 ?auto_134472 ) ) ( not ( = ?auto_134471 ?auto_134472 ) ) ( ON ?auto_134472 ?auto_134474 ) ( not ( = ?auto_134468 ?auto_134474 ) ) ( not ( = ?auto_134469 ?auto_134474 ) ) ( not ( = ?auto_134470 ?auto_134474 ) ) ( not ( = ?auto_134471 ?auto_134474 ) ) ( not ( = ?auto_134472 ?auto_134474 ) ) ( ON-TABLE ?auto_134476 ) ( ON ?auto_134473 ?auto_134476 ) ( ON ?auto_134474 ?auto_134473 ) ( not ( = ?auto_134476 ?auto_134473 ) ) ( not ( = ?auto_134476 ?auto_134474 ) ) ( not ( = ?auto_134476 ?auto_134472 ) ) ( not ( = ?auto_134476 ?auto_134471 ) ) ( not ( = ?auto_134473 ?auto_134474 ) ) ( not ( = ?auto_134473 ?auto_134472 ) ) ( not ( = ?auto_134473 ?auto_134471 ) ) ( not ( = ?auto_134468 ?auto_134476 ) ) ( not ( = ?auto_134468 ?auto_134473 ) ) ( not ( = ?auto_134469 ?auto_134476 ) ) ( not ( = ?auto_134469 ?auto_134473 ) ) ( not ( = ?auto_134470 ?auto_134476 ) ) ( not ( = ?auto_134470 ?auto_134473 ) ) ( ON ?auto_134468 ?auto_134475 ) ( not ( = ?auto_134468 ?auto_134475 ) ) ( not ( = ?auto_134469 ?auto_134475 ) ) ( not ( = ?auto_134470 ?auto_134475 ) ) ( not ( = ?auto_134471 ?auto_134475 ) ) ( not ( = ?auto_134472 ?auto_134475 ) ) ( not ( = ?auto_134474 ?auto_134475 ) ) ( not ( = ?auto_134476 ?auto_134475 ) ) ( not ( = ?auto_134473 ?auto_134475 ) ) ( ON ?auto_134469 ?auto_134468 ) ( ON-TABLE ?auto_134475 ) ( ON ?auto_134470 ?auto_134469 ) ( CLEAR ?auto_134470 ) ( HOLDING ?auto_134471 ) ( CLEAR ?auto_134472 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134476 ?auto_134473 ?auto_134474 ?auto_134472 ?auto_134471 )
      ( MAKE-5PILE ?auto_134468 ?auto_134469 ?auto_134470 ?auto_134471 ?auto_134472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134477 - BLOCK
      ?auto_134478 - BLOCK
      ?auto_134479 - BLOCK
      ?auto_134480 - BLOCK
      ?auto_134481 - BLOCK
    )
    :vars
    (
      ?auto_134483 - BLOCK
      ?auto_134484 - BLOCK
      ?auto_134485 - BLOCK
      ?auto_134482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134477 ?auto_134478 ) ) ( not ( = ?auto_134477 ?auto_134479 ) ) ( not ( = ?auto_134477 ?auto_134480 ) ) ( not ( = ?auto_134477 ?auto_134481 ) ) ( not ( = ?auto_134478 ?auto_134479 ) ) ( not ( = ?auto_134478 ?auto_134480 ) ) ( not ( = ?auto_134478 ?auto_134481 ) ) ( not ( = ?auto_134479 ?auto_134480 ) ) ( not ( = ?auto_134479 ?auto_134481 ) ) ( not ( = ?auto_134480 ?auto_134481 ) ) ( ON ?auto_134481 ?auto_134483 ) ( not ( = ?auto_134477 ?auto_134483 ) ) ( not ( = ?auto_134478 ?auto_134483 ) ) ( not ( = ?auto_134479 ?auto_134483 ) ) ( not ( = ?auto_134480 ?auto_134483 ) ) ( not ( = ?auto_134481 ?auto_134483 ) ) ( ON-TABLE ?auto_134484 ) ( ON ?auto_134485 ?auto_134484 ) ( ON ?auto_134483 ?auto_134485 ) ( not ( = ?auto_134484 ?auto_134485 ) ) ( not ( = ?auto_134484 ?auto_134483 ) ) ( not ( = ?auto_134484 ?auto_134481 ) ) ( not ( = ?auto_134484 ?auto_134480 ) ) ( not ( = ?auto_134485 ?auto_134483 ) ) ( not ( = ?auto_134485 ?auto_134481 ) ) ( not ( = ?auto_134485 ?auto_134480 ) ) ( not ( = ?auto_134477 ?auto_134484 ) ) ( not ( = ?auto_134477 ?auto_134485 ) ) ( not ( = ?auto_134478 ?auto_134484 ) ) ( not ( = ?auto_134478 ?auto_134485 ) ) ( not ( = ?auto_134479 ?auto_134484 ) ) ( not ( = ?auto_134479 ?auto_134485 ) ) ( ON ?auto_134477 ?auto_134482 ) ( not ( = ?auto_134477 ?auto_134482 ) ) ( not ( = ?auto_134478 ?auto_134482 ) ) ( not ( = ?auto_134479 ?auto_134482 ) ) ( not ( = ?auto_134480 ?auto_134482 ) ) ( not ( = ?auto_134481 ?auto_134482 ) ) ( not ( = ?auto_134483 ?auto_134482 ) ) ( not ( = ?auto_134484 ?auto_134482 ) ) ( not ( = ?auto_134485 ?auto_134482 ) ) ( ON ?auto_134478 ?auto_134477 ) ( ON-TABLE ?auto_134482 ) ( ON ?auto_134479 ?auto_134478 ) ( CLEAR ?auto_134481 ) ( ON ?auto_134480 ?auto_134479 ) ( CLEAR ?auto_134480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134482 ?auto_134477 ?auto_134478 ?auto_134479 )
      ( MAKE-5PILE ?auto_134477 ?auto_134478 ?auto_134479 ?auto_134480 ?auto_134481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134486 - BLOCK
      ?auto_134487 - BLOCK
      ?auto_134488 - BLOCK
      ?auto_134489 - BLOCK
      ?auto_134490 - BLOCK
    )
    :vars
    (
      ?auto_134491 - BLOCK
      ?auto_134492 - BLOCK
      ?auto_134494 - BLOCK
      ?auto_134493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134486 ?auto_134487 ) ) ( not ( = ?auto_134486 ?auto_134488 ) ) ( not ( = ?auto_134486 ?auto_134489 ) ) ( not ( = ?auto_134486 ?auto_134490 ) ) ( not ( = ?auto_134487 ?auto_134488 ) ) ( not ( = ?auto_134487 ?auto_134489 ) ) ( not ( = ?auto_134487 ?auto_134490 ) ) ( not ( = ?auto_134488 ?auto_134489 ) ) ( not ( = ?auto_134488 ?auto_134490 ) ) ( not ( = ?auto_134489 ?auto_134490 ) ) ( not ( = ?auto_134486 ?auto_134491 ) ) ( not ( = ?auto_134487 ?auto_134491 ) ) ( not ( = ?auto_134488 ?auto_134491 ) ) ( not ( = ?auto_134489 ?auto_134491 ) ) ( not ( = ?auto_134490 ?auto_134491 ) ) ( ON-TABLE ?auto_134492 ) ( ON ?auto_134494 ?auto_134492 ) ( ON ?auto_134491 ?auto_134494 ) ( not ( = ?auto_134492 ?auto_134494 ) ) ( not ( = ?auto_134492 ?auto_134491 ) ) ( not ( = ?auto_134492 ?auto_134490 ) ) ( not ( = ?auto_134492 ?auto_134489 ) ) ( not ( = ?auto_134494 ?auto_134491 ) ) ( not ( = ?auto_134494 ?auto_134490 ) ) ( not ( = ?auto_134494 ?auto_134489 ) ) ( not ( = ?auto_134486 ?auto_134492 ) ) ( not ( = ?auto_134486 ?auto_134494 ) ) ( not ( = ?auto_134487 ?auto_134492 ) ) ( not ( = ?auto_134487 ?auto_134494 ) ) ( not ( = ?auto_134488 ?auto_134492 ) ) ( not ( = ?auto_134488 ?auto_134494 ) ) ( ON ?auto_134486 ?auto_134493 ) ( not ( = ?auto_134486 ?auto_134493 ) ) ( not ( = ?auto_134487 ?auto_134493 ) ) ( not ( = ?auto_134488 ?auto_134493 ) ) ( not ( = ?auto_134489 ?auto_134493 ) ) ( not ( = ?auto_134490 ?auto_134493 ) ) ( not ( = ?auto_134491 ?auto_134493 ) ) ( not ( = ?auto_134492 ?auto_134493 ) ) ( not ( = ?auto_134494 ?auto_134493 ) ) ( ON ?auto_134487 ?auto_134486 ) ( ON-TABLE ?auto_134493 ) ( ON ?auto_134488 ?auto_134487 ) ( ON ?auto_134489 ?auto_134488 ) ( CLEAR ?auto_134489 ) ( HOLDING ?auto_134490 ) ( CLEAR ?auto_134491 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134492 ?auto_134494 ?auto_134491 ?auto_134490 )
      ( MAKE-5PILE ?auto_134486 ?auto_134487 ?auto_134488 ?auto_134489 ?auto_134490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134495 - BLOCK
      ?auto_134496 - BLOCK
      ?auto_134497 - BLOCK
      ?auto_134498 - BLOCK
      ?auto_134499 - BLOCK
    )
    :vars
    (
      ?auto_134502 - BLOCK
      ?auto_134500 - BLOCK
      ?auto_134503 - BLOCK
      ?auto_134501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134495 ?auto_134496 ) ) ( not ( = ?auto_134495 ?auto_134497 ) ) ( not ( = ?auto_134495 ?auto_134498 ) ) ( not ( = ?auto_134495 ?auto_134499 ) ) ( not ( = ?auto_134496 ?auto_134497 ) ) ( not ( = ?auto_134496 ?auto_134498 ) ) ( not ( = ?auto_134496 ?auto_134499 ) ) ( not ( = ?auto_134497 ?auto_134498 ) ) ( not ( = ?auto_134497 ?auto_134499 ) ) ( not ( = ?auto_134498 ?auto_134499 ) ) ( not ( = ?auto_134495 ?auto_134502 ) ) ( not ( = ?auto_134496 ?auto_134502 ) ) ( not ( = ?auto_134497 ?auto_134502 ) ) ( not ( = ?auto_134498 ?auto_134502 ) ) ( not ( = ?auto_134499 ?auto_134502 ) ) ( ON-TABLE ?auto_134500 ) ( ON ?auto_134503 ?auto_134500 ) ( ON ?auto_134502 ?auto_134503 ) ( not ( = ?auto_134500 ?auto_134503 ) ) ( not ( = ?auto_134500 ?auto_134502 ) ) ( not ( = ?auto_134500 ?auto_134499 ) ) ( not ( = ?auto_134500 ?auto_134498 ) ) ( not ( = ?auto_134503 ?auto_134502 ) ) ( not ( = ?auto_134503 ?auto_134499 ) ) ( not ( = ?auto_134503 ?auto_134498 ) ) ( not ( = ?auto_134495 ?auto_134500 ) ) ( not ( = ?auto_134495 ?auto_134503 ) ) ( not ( = ?auto_134496 ?auto_134500 ) ) ( not ( = ?auto_134496 ?auto_134503 ) ) ( not ( = ?auto_134497 ?auto_134500 ) ) ( not ( = ?auto_134497 ?auto_134503 ) ) ( ON ?auto_134495 ?auto_134501 ) ( not ( = ?auto_134495 ?auto_134501 ) ) ( not ( = ?auto_134496 ?auto_134501 ) ) ( not ( = ?auto_134497 ?auto_134501 ) ) ( not ( = ?auto_134498 ?auto_134501 ) ) ( not ( = ?auto_134499 ?auto_134501 ) ) ( not ( = ?auto_134502 ?auto_134501 ) ) ( not ( = ?auto_134500 ?auto_134501 ) ) ( not ( = ?auto_134503 ?auto_134501 ) ) ( ON ?auto_134496 ?auto_134495 ) ( ON-TABLE ?auto_134501 ) ( ON ?auto_134497 ?auto_134496 ) ( ON ?auto_134498 ?auto_134497 ) ( CLEAR ?auto_134502 ) ( ON ?auto_134499 ?auto_134498 ) ( CLEAR ?auto_134499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134501 ?auto_134495 ?auto_134496 ?auto_134497 ?auto_134498 )
      ( MAKE-5PILE ?auto_134495 ?auto_134496 ?auto_134497 ?auto_134498 ?auto_134499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134504 - BLOCK
      ?auto_134505 - BLOCK
      ?auto_134506 - BLOCK
      ?auto_134507 - BLOCK
      ?auto_134508 - BLOCK
    )
    :vars
    (
      ?auto_134511 - BLOCK
      ?auto_134509 - BLOCK
      ?auto_134510 - BLOCK
      ?auto_134512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134504 ?auto_134505 ) ) ( not ( = ?auto_134504 ?auto_134506 ) ) ( not ( = ?auto_134504 ?auto_134507 ) ) ( not ( = ?auto_134504 ?auto_134508 ) ) ( not ( = ?auto_134505 ?auto_134506 ) ) ( not ( = ?auto_134505 ?auto_134507 ) ) ( not ( = ?auto_134505 ?auto_134508 ) ) ( not ( = ?auto_134506 ?auto_134507 ) ) ( not ( = ?auto_134506 ?auto_134508 ) ) ( not ( = ?auto_134507 ?auto_134508 ) ) ( not ( = ?auto_134504 ?auto_134511 ) ) ( not ( = ?auto_134505 ?auto_134511 ) ) ( not ( = ?auto_134506 ?auto_134511 ) ) ( not ( = ?auto_134507 ?auto_134511 ) ) ( not ( = ?auto_134508 ?auto_134511 ) ) ( ON-TABLE ?auto_134509 ) ( ON ?auto_134510 ?auto_134509 ) ( not ( = ?auto_134509 ?auto_134510 ) ) ( not ( = ?auto_134509 ?auto_134511 ) ) ( not ( = ?auto_134509 ?auto_134508 ) ) ( not ( = ?auto_134509 ?auto_134507 ) ) ( not ( = ?auto_134510 ?auto_134511 ) ) ( not ( = ?auto_134510 ?auto_134508 ) ) ( not ( = ?auto_134510 ?auto_134507 ) ) ( not ( = ?auto_134504 ?auto_134509 ) ) ( not ( = ?auto_134504 ?auto_134510 ) ) ( not ( = ?auto_134505 ?auto_134509 ) ) ( not ( = ?auto_134505 ?auto_134510 ) ) ( not ( = ?auto_134506 ?auto_134509 ) ) ( not ( = ?auto_134506 ?auto_134510 ) ) ( ON ?auto_134504 ?auto_134512 ) ( not ( = ?auto_134504 ?auto_134512 ) ) ( not ( = ?auto_134505 ?auto_134512 ) ) ( not ( = ?auto_134506 ?auto_134512 ) ) ( not ( = ?auto_134507 ?auto_134512 ) ) ( not ( = ?auto_134508 ?auto_134512 ) ) ( not ( = ?auto_134511 ?auto_134512 ) ) ( not ( = ?auto_134509 ?auto_134512 ) ) ( not ( = ?auto_134510 ?auto_134512 ) ) ( ON ?auto_134505 ?auto_134504 ) ( ON-TABLE ?auto_134512 ) ( ON ?auto_134506 ?auto_134505 ) ( ON ?auto_134507 ?auto_134506 ) ( ON ?auto_134508 ?auto_134507 ) ( CLEAR ?auto_134508 ) ( HOLDING ?auto_134511 ) ( CLEAR ?auto_134510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134509 ?auto_134510 ?auto_134511 )
      ( MAKE-5PILE ?auto_134504 ?auto_134505 ?auto_134506 ?auto_134507 ?auto_134508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134513 - BLOCK
      ?auto_134514 - BLOCK
      ?auto_134515 - BLOCK
      ?auto_134516 - BLOCK
      ?auto_134517 - BLOCK
    )
    :vars
    (
      ?auto_134518 - BLOCK
      ?auto_134521 - BLOCK
      ?auto_134520 - BLOCK
      ?auto_134519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134513 ?auto_134514 ) ) ( not ( = ?auto_134513 ?auto_134515 ) ) ( not ( = ?auto_134513 ?auto_134516 ) ) ( not ( = ?auto_134513 ?auto_134517 ) ) ( not ( = ?auto_134514 ?auto_134515 ) ) ( not ( = ?auto_134514 ?auto_134516 ) ) ( not ( = ?auto_134514 ?auto_134517 ) ) ( not ( = ?auto_134515 ?auto_134516 ) ) ( not ( = ?auto_134515 ?auto_134517 ) ) ( not ( = ?auto_134516 ?auto_134517 ) ) ( not ( = ?auto_134513 ?auto_134518 ) ) ( not ( = ?auto_134514 ?auto_134518 ) ) ( not ( = ?auto_134515 ?auto_134518 ) ) ( not ( = ?auto_134516 ?auto_134518 ) ) ( not ( = ?auto_134517 ?auto_134518 ) ) ( ON-TABLE ?auto_134521 ) ( ON ?auto_134520 ?auto_134521 ) ( not ( = ?auto_134521 ?auto_134520 ) ) ( not ( = ?auto_134521 ?auto_134518 ) ) ( not ( = ?auto_134521 ?auto_134517 ) ) ( not ( = ?auto_134521 ?auto_134516 ) ) ( not ( = ?auto_134520 ?auto_134518 ) ) ( not ( = ?auto_134520 ?auto_134517 ) ) ( not ( = ?auto_134520 ?auto_134516 ) ) ( not ( = ?auto_134513 ?auto_134521 ) ) ( not ( = ?auto_134513 ?auto_134520 ) ) ( not ( = ?auto_134514 ?auto_134521 ) ) ( not ( = ?auto_134514 ?auto_134520 ) ) ( not ( = ?auto_134515 ?auto_134521 ) ) ( not ( = ?auto_134515 ?auto_134520 ) ) ( ON ?auto_134513 ?auto_134519 ) ( not ( = ?auto_134513 ?auto_134519 ) ) ( not ( = ?auto_134514 ?auto_134519 ) ) ( not ( = ?auto_134515 ?auto_134519 ) ) ( not ( = ?auto_134516 ?auto_134519 ) ) ( not ( = ?auto_134517 ?auto_134519 ) ) ( not ( = ?auto_134518 ?auto_134519 ) ) ( not ( = ?auto_134521 ?auto_134519 ) ) ( not ( = ?auto_134520 ?auto_134519 ) ) ( ON ?auto_134514 ?auto_134513 ) ( ON-TABLE ?auto_134519 ) ( ON ?auto_134515 ?auto_134514 ) ( ON ?auto_134516 ?auto_134515 ) ( ON ?auto_134517 ?auto_134516 ) ( CLEAR ?auto_134520 ) ( ON ?auto_134518 ?auto_134517 ) ( CLEAR ?auto_134518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134519 ?auto_134513 ?auto_134514 ?auto_134515 ?auto_134516 ?auto_134517 )
      ( MAKE-5PILE ?auto_134513 ?auto_134514 ?auto_134515 ?auto_134516 ?auto_134517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134522 - BLOCK
      ?auto_134523 - BLOCK
      ?auto_134524 - BLOCK
      ?auto_134525 - BLOCK
      ?auto_134526 - BLOCK
    )
    :vars
    (
      ?auto_134529 - BLOCK
      ?auto_134528 - BLOCK
      ?auto_134527 - BLOCK
      ?auto_134530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134522 ?auto_134523 ) ) ( not ( = ?auto_134522 ?auto_134524 ) ) ( not ( = ?auto_134522 ?auto_134525 ) ) ( not ( = ?auto_134522 ?auto_134526 ) ) ( not ( = ?auto_134523 ?auto_134524 ) ) ( not ( = ?auto_134523 ?auto_134525 ) ) ( not ( = ?auto_134523 ?auto_134526 ) ) ( not ( = ?auto_134524 ?auto_134525 ) ) ( not ( = ?auto_134524 ?auto_134526 ) ) ( not ( = ?auto_134525 ?auto_134526 ) ) ( not ( = ?auto_134522 ?auto_134529 ) ) ( not ( = ?auto_134523 ?auto_134529 ) ) ( not ( = ?auto_134524 ?auto_134529 ) ) ( not ( = ?auto_134525 ?auto_134529 ) ) ( not ( = ?auto_134526 ?auto_134529 ) ) ( ON-TABLE ?auto_134528 ) ( not ( = ?auto_134528 ?auto_134527 ) ) ( not ( = ?auto_134528 ?auto_134529 ) ) ( not ( = ?auto_134528 ?auto_134526 ) ) ( not ( = ?auto_134528 ?auto_134525 ) ) ( not ( = ?auto_134527 ?auto_134529 ) ) ( not ( = ?auto_134527 ?auto_134526 ) ) ( not ( = ?auto_134527 ?auto_134525 ) ) ( not ( = ?auto_134522 ?auto_134528 ) ) ( not ( = ?auto_134522 ?auto_134527 ) ) ( not ( = ?auto_134523 ?auto_134528 ) ) ( not ( = ?auto_134523 ?auto_134527 ) ) ( not ( = ?auto_134524 ?auto_134528 ) ) ( not ( = ?auto_134524 ?auto_134527 ) ) ( ON ?auto_134522 ?auto_134530 ) ( not ( = ?auto_134522 ?auto_134530 ) ) ( not ( = ?auto_134523 ?auto_134530 ) ) ( not ( = ?auto_134524 ?auto_134530 ) ) ( not ( = ?auto_134525 ?auto_134530 ) ) ( not ( = ?auto_134526 ?auto_134530 ) ) ( not ( = ?auto_134529 ?auto_134530 ) ) ( not ( = ?auto_134528 ?auto_134530 ) ) ( not ( = ?auto_134527 ?auto_134530 ) ) ( ON ?auto_134523 ?auto_134522 ) ( ON-TABLE ?auto_134530 ) ( ON ?auto_134524 ?auto_134523 ) ( ON ?auto_134525 ?auto_134524 ) ( ON ?auto_134526 ?auto_134525 ) ( ON ?auto_134529 ?auto_134526 ) ( CLEAR ?auto_134529 ) ( HOLDING ?auto_134527 ) ( CLEAR ?auto_134528 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134528 ?auto_134527 )
      ( MAKE-5PILE ?auto_134522 ?auto_134523 ?auto_134524 ?auto_134525 ?auto_134526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134531 - BLOCK
      ?auto_134532 - BLOCK
      ?auto_134533 - BLOCK
      ?auto_134534 - BLOCK
      ?auto_134535 - BLOCK
    )
    :vars
    (
      ?auto_134536 - BLOCK
      ?auto_134538 - BLOCK
      ?auto_134537 - BLOCK
      ?auto_134539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134531 ?auto_134532 ) ) ( not ( = ?auto_134531 ?auto_134533 ) ) ( not ( = ?auto_134531 ?auto_134534 ) ) ( not ( = ?auto_134531 ?auto_134535 ) ) ( not ( = ?auto_134532 ?auto_134533 ) ) ( not ( = ?auto_134532 ?auto_134534 ) ) ( not ( = ?auto_134532 ?auto_134535 ) ) ( not ( = ?auto_134533 ?auto_134534 ) ) ( not ( = ?auto_134533 ?auto_134535 ) ) ( not ( = ?auto_134534 ?auto_134535 ) ) ( not ( = ?auto_134531 ?auto_134536 ) ) ( not ( = ?auto_134532 ?auto_134536 ) ) ( not ( = ?auto_134533 ?auto_134536 ) ) ( not ( = ?auto_134534 ?auto_134536 ) ) ( not ( = ?auto_134535 ?auto_134536 ) ) ( ON-TABLE ?auto_134538 ) ( not ( = ?auto_134538 ?auto_134537 ) ) ( not ( = ?auto_134538 ?auto_134536 ) ) ( not ( = ?auto_134538 ?auto_134535 ) ) ( not ( = ?auto_134538 ?auto_134534 ) ) ( not ( = ?auto_134537 ?auto_134536 ) ) ( not ( = ?auto_134537 ?auto_134535 ) ) ( not ( = ?auto_134537 ?auto_134534 ) ) ( not ( = ?auto_134531 ?auto_134538 ) ) ( not ( = ?auto_134531 ?auto_134537 ) ) ( not ( = ?auto_134532 ?auto_134538 ) ) ( not ( = ?auto_134532 ?auto_134537 ) ) ( not ( = ?auto_134533 ?auto_134538 ) ) ( not ( = ?auto_134533 ?auto_134537 ) ) ( ON ?auto_134531 ?auto_134539 ) ( not ( = ?auto_134531 ?auto_134539 ) ) ( not ( = ?auto_134532 ?auto_134539 ) ) ( not ( = ?auto_134533 ?auto_134539 ) ) ( not ( = ?auto_134534 ?auto_134539 ) ) ( not ( = ?auto_134535 ?auto_134539 ) ) ( not ( = ?auto_134536 ?auto_134539 ) ) ( not ( = ?auto_134538 ?auto_134539 ) ) ( not ( = ?auto_134537 ?auto_134539 ) ) ( ON ?auto_134532 ?auto_134531 ) ( ON-TABLE ?auto_134539 ) ( ON ?auto_134533 ?auto_134532 ) ( ON ?auto_134534 ?auto_134533 ) ( ON ?auto_134535 ?auto_134534 ) ( ON ?auto_134536 ?auto_134535 ) ( CLEAR ?auto_134538 ) ( ON ?auto_134537 ?auto_134536 ) ( CLEAR ?auto_134537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134539 ?auto_134531 ?auto_134532 ?auto_134533 ?auto_134534 ?auto_134535 ?auto_134536 )
      ( MAKE-5PILE ?auto_134531 ?auto_134532 ?auto_134533 ?auto_134534 ?auto_134535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134540 - BLOCK
      ?auto_134541 - BLOCK
      ?auto_134542 - BLOCK
      ?auto_134543 - BLOCK
      ?auto_134544 - BLOCK
    )
    :vars
    (
      ?auto_134548 - BLOCK
      ?auto_134545 - BLOCK
      ?auto_134546 - BLOCK
      ?auto_134547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134540 ?auto_134541 ) ) ( not ( = ?auto_134540 ?auto_134542 ) ) ( not ( = ?auto_134540 ?auto_134543 ) ) ( not ( = ?auto_134540 ?auto_134544 ) ) ( not ( = ?auto_134541 ?auto_134542 ) ) ( not ( = ?auto_134541 ?auto_134543 ) ) ( not ( = ?auto_134541 ?auto_134544 ) ) ( not ( = ?auto_134542 ?auto_134543 ) ) ( not ( = ?auto_134542 ?auto_134544 ) ) ( not ( = ?auto_134543 ?auto_134544 ) ) ( not ( = ?auto_134540 ?auto_134548 ) ) ( not ( = ?auto_134541 ?auto_134548 ) ) ( not ( = ?auto_134542 ?auto_134548 ) ) ( not ( = ?auto_134543 ?auto_134548 ) ) ( not ( = ?auto_134544 ?auto_134548 ) ) ( not ( = ?auto_134545 ?auto_134546 ) ) ( not ( = ?auto_134545 ?auto_134548 ) ) ( not ( = ?auto_134545 ?auto_134544 ) ) ( not ( = ?auto_134545 ?auto_134543 ) ) ( not ( = ?auto_134546 ?auto_134548 ) ) ( not ( = ?auto_134546 ?auto_134544 ) ) ( not ( = ?auto_134546 ?auto_134543 ) ) ( not ( = ?auto_134540 ?auto_134545 ) ) ( not ( = ?auto_134540 ?auto_134546 ) ) ( not ( = ?auto_134541 ?auto_134545 ) ) ( not ( = ?auto_134541 ?auto_134546 ) ) ( not ( = ?auto_134542 ?auto_134545 ) ) ( not ( = ?auto_134542 ?auto_134546 ) ) ( ON ?auto_134540 ?auto_134547 ) ( not ( = ?auto_134540 ?auto_134547 ) ) ( not ( = ?auto_134541 ?auto_134547 ) ) ( not ( = ?auto_134542 ?auto_134547 ) ) ( not ( = ?auto_134543 ?auto_134547 ) ) ( not ( = ?auto_134544 ?auto_134547 ) ) ( not ( = ?auto_134548 ?auto_134547 ) ) ( not ( = ?auto_134545 ?auto_134547 ) ) ( not ( = ?auto_134546 ?auto_134547 ) ) ( ON ?auto_134541 ?auto_134540 ) ( ON-TABLE ?auto_134547 ) ( ON ?auto_134542 ?auto_134541 ) ( ON ?auto_134543 ?auto_134542 ) ( ON ?auto_134544 ?auto_134543 ) ( ON ?auto_134548 ?auto_134544 ) ( ON ?auto_134546 ?auto_134548 ) ( CLEAR ?auto_134546 ) ( HOLDING ?auto_134545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134545 )
      ( MAKE-5PILE ?auto_134540 ?auto_134541 ?auto_134542 ?auto_134543 ?auto_134544 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134549 - BLOCK
      ?auto_134550 - BLOCK
      ?auto_134551 - BLOCK
      ?auto_134552 - BLOCK
      ?auto_134553 - BLOCK
    )
    :vars
    (
      ?auto_134557 - BLOCK
      ?auto_134554 - BLOCK
      ?auto_134555 - BLOCK
      ?auto_134556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134549 ?auto_134550 ) ) ( not ( = ?auto_134549 ?auto_134551 ) ) ( not ( = ?auto_134549 ?auto_134552 ) ) ( not ( = ?auto_134549 ?auto_134553 ) ) ( not ( = ?auto_134550 ?auto_134551 ) ) ( not ( = ?auto_134550 ?auto_134552 ) ) ( not ( = ?auto_134550 ?auto_134553 ) ) ( not ( = ?auto_134551 ?auto_134552 ) ) ( not ( = ?auto_134551 ?auto_134553 ) ) ( not ( = ?auto_134552 ?auto_134553 ) ) ( not ( = ?auto_134549 ?auto_134557 ) ) ( not ( = ?auto_134550 ?auto_134557 ) ) ( not ( = ?auto_134551 ?auto_134557 ) ) ( not ( = ?auto_134552 ?auto_134557 ) ) ( not ( = ?auto_134553 ?auto_134557 ) ) ( not ( = ?auto_134554 ?auto_134555 ) ) ( not ( = ?auto_134554 ?auto_134557 ) ) ( not ( = ?auto_134554 ?auto_134553 ) ) ( not ( = ?auto_134554 ?auto_134552 ) ) ( not ( = ?auto_134555 ?auto_134557 ) ) ( not ( = ?auto_134555 ?auto_134553 ) ) ( not ( = ?auto_134555 ?auto_134552 ) ) ( not ( = ?auto_134549 ?auto_134554 ) ) ( not ( = ?auto_134549 ?auto_134555 ) ) ( not ( = ?auto_134550 ?auto_134554 ) ) ( not ( = ?auto_134550 ?auto_134555 ) ) ( not ( = ?auto_134551 ?auto_134554 ) ) ( not ( = ?auto_134551 ?auto_134555 ) ) ( ON ?auto_134549 ?auto_134556 ) ( not ( = ?auto_134549 ?auto_134556 ) ) ( not ( = ?auto_134550 ?auto_134556 ) ) ( not ( = ?auto_134551 ?auto_134556 ) ) ( not ( = ?auto_134552 ?auto_134556 ) ) ( not ( = ?auto_134553 ?auto_134556 ) ) ( not ( = ?auto_134557 ?auto_134556 ) ) ( not ( = ?auto_134554 ?auto_134556 ) ) ( not ( = ?auto_134555 ?auto_134556 ) ) ( ON ?auto_134550 ?auto_134549 ) ( ON-TABLE ?auto_134556 ) ( ON ?auto_134551 ?auto_134550 ) ( ON ?auto_134552 ?auto_134551 ) ( ON ?auto_134553 ?auto_134552 ) ( ON ?auto_134557 ?auto_134553 ) ( ON ?auto_134555 ?auto_134557 ) ( ON ?auto_134554 ?auto_134555 ) ( CLEAR ?auto_134554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134556 ?auto_134549 ?auto_134550 ?auto_134551 ?auto_134552 ?auto_134553 ?auto_134557 ?auto_134555 )
      ( MAKE-5PILE ?auto_134549 ?auto_134550 ?auto_134551 ?auto_134552 ?auto_134553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134573 - BLOCK
      ?auto_134574 - BLOCK
    )
    :vars
    (
      ?auto_134576 - BLOCK
      ?auto_134575 - BLOCK
      ?auto_134577 - BLOCK
      ?auto_134580 - BLOCK
      ?auto_134579 - BLOCK
      ?auto_134578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134576 ?auto_134574 ) ( ON-TABLE ?auto_134573 ) ( ON ?auto_134574 ?auto_134573 ) ( not ( = ?auto_134573 ?auto_134574 ) ) ( not ( = ?auto_134573 ?auto_134576 ) ) ( not ( = ?auto_134574 ?auto_134576 ) ) ( not ( = ?auto_134573 ?auto_134575 ) ) ( not ( = ?auto_134573 ?auto_134577 ) ) ( not ( = ?auto_134574 ?auto_134575 ) ) ( not ( = ?auto_134574 ?auto_134577 ) ) ( not ( = ?auto_134576 ?auto_134575 ) ) ( not ( = ?auto_134576 ?auto_134577 ) ) ( not ( = ?auto_134575 ?auto_134577 ) ) ( ON ?auto_134575 ?auto_134576 ) ( CLEAR ?auto_134575 ) ( HOLDING ?auto_134577 ) ( CLEAR ?auto_134580 ) ( ON-TABLE ?auto_134579 ) ( ON ?auto_134578 ?auto_134579 ) ( ON ?auto_134580 ?auto_134578 ) ( not ( = ?auto_134579 ?auto_134578 ) ) ( not ( = ?auto_134579 ?auto_134580 ) ) ( not ( = ?auto_134579 ?auto_134577 ) ) ( not ( = ?auto_134578 ?auto_134580 ) ) ( not ( = ?auto_134578 ?auto_134577 ) ) ( not ( = ?auto_134580 ?auto_134577 ) ) ( not ( = ?auto_134573 ?auto_134580 ) ) ( not ( = ?auto_134573 ?auto_134579 ) ) ( not ( = ?auto_134573 ?auto_134578 ) ) ( not ( = ?auto_134574 ?auto_134580 ) ) ( not ( = ?auto_134574 ?auto_134579 ) ) ( not ( = ?auto_134574 ?auto_134578 ) ) ( not ( = ?auto_134576 ?auto_134580 ) ) ( not ( = ?auto_134576 ?auto_134579 ) ) ( not ( = ?auto_134576 ?auto_134578 ) ) ( not ( = ?auto_134575 ?auto_134580 ) ) ( not ( = ?auto_134575 ?auto_134579 ) ) ( not ( = ?auto_134575 ?auto_134578 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134579 ?auto_134578 ?auto_134580 ?auto_134577 )
      ( MAKE-2PILE ?auto_134573 ?auto_134574 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134581 - BLOCK
      ?auto_134582 - BLOCK
    )
    :vars
    (
      ?auto_134583 - BLOCK
      ?auto_134585 - BLOCK
      ?auto_134587 - BLOCK
      ?auto_134586 - BLOCK
      ?auto_134588 - BLOCK
      ?auto_134584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134583 ?auto_134582 ) ( ON-TABLE ?auto_134581 ) ( ON ?auto_134582 ?auto_134581 ) ( not ( = ?auto_134581 ?auto_134582 ) ) ( not ( = ?auto_134581 ?auto_134583 ) ) ( not ( = ?auto_134582 ?auto_134583 ) ) ( not ( = ?auto_134581 ?auto_134585 ) ) ( not ( = ?auto_134581 ?auto_134587 ) ) ( not ( = ?auto_134582 ?auto_134585 ) ) ( not ( = ?auto_134582 ?auto_134587 ) ) ( not ( = ?auto_134583 ?auto_134585 ) ) ( not ( = ?auto_134583 ?auto_134587 ) ) ( not ( = ?auto_134585 ?auto_134587 ) ) ( ON ?auto_134585 ?auto_134583 ) ( CLEAR ?auto_134586 ) ( ON-TABLE ?auto_134588 ) ( ON ?auto_134584 ?auto_134588 ) ( ON ?auto_134586 ?auto_134584 ) ( not ( = ?auto_134588 ?auto_134584 ) ) ( not ( = ?auto_134588 ?auto_134586 ) ) ( not ( = ?auto_134588 ?auto_134587 ) ) ( not ( = ?auto_134584 ?auto_134586 ) ) ( not ( = ?auto_134584 ?auto_134587 ) ) ( not ( = ?auto_134586 ?auto_134587 ) ) ( not ( = ?auto_134581 ?auto_134586 ) ) ( not ( = ?auto_134581 ?auto_134588 ) ) ( not ( = ?auto_134581 ?auto_134584 ) ) ( not ( = ?auto_134582 ?auto_134586 ) ) ( not ( = ?auto_134582 ?auto_134588 ) ) ( not ( = ?auto_134582 ?auto_134584 ) ) ( not ( = ?auto_134583 ?auto_134586 ) ) ( not ( = ?auto_134583 ?auto_134588 ) ) ( not ( = ?auto_134583 ?auto_134584 ) ) ( not ( = ?auto_134585 ?auto_134586 ) ) ( not ( = ?auto_134585 ?auto_134588 ) ) ( not ( = ?auto_134585 ?auto_134584 ) ) ( ON ?auto_134587 ?auto_134585 ) ( CLEAR ?auto_134587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134581 ?auto_134582 ?auto_134583 ?auto_134585 )
      ( MAKE-2PILE ?auto_134581 ?auto_134582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134589 - BLOCK
      ?auto_134590 - BLOCK
    )
    :vars
    (
      ?auto_134593 - BLOCK
      ?auto_134596 - BLOCK
      ?auto_134595 - BLOCK
      ?auto_134591 - BLOCK
      ?auto_134594 - BLOCK
      ?auto_134592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134593 ?auto_134590 ) ( ON-TABLE ?auto_134589 ) ( ON ?auto_134590 ?auto_134589 ) ( not ( = ?auto_134589 ?auto_134590 ) ) ( not ( = ?auto_134589 ?auto_134593 ) ) ( not ( = ?auto_134590 ?auto_134593 ) ) ( not ( = ?auto_134589 ?auto_134596 ) ) ( not ( = ?auto_134589 ?auto_134595 ) ) ( not ( = ?auto_134590 ?auto_134596 ) ) ( not ( = ?auto_134590 ?auto_134595 ) ) ( not ( = ?auto_134593 ?auto_134596 ) ) ( not ( = ?auto_134593 ?auto_134595 ) ) ( not ( = ?auto_134596 ?auto_134595 ) ) ( ON ?auto_134596 ?auto_134593 ) ( ON-TABLE ?auto_134591 ) ( ON ?auto_134594 ?auto_134591 ) ( not ( = ?auto_134591 ?auto_134594 ) ) ( not ( = ?auto_134591 ?auto_134592 ) ) ( not ( = ?auto_134591 ?auto_134595 ) ) ( not ( = ?auto_134594 ?auto_134592 ) ) ( not ( = ?auto_134594 ?auto_134595 ) ) ( not ( = ?auto_134592 ?auto_134595 ) ) ( not ( = ?auto_134589 ?auto_134592 ) ) ( not ( = ?auto_134589 ?auto_134591 ) ) ( not ( = ?auto_134589 ?auto_134594 ) ) ( not ( = ?auto_134590 ?auto_134592 ) ) ( not ( = ?auto_134590 ?auto_134591 ) ) ( not ( = ?auto_134590 ?auto_134594 ) ) ( not ( = ?auto_134593 ?auto_134592 ) ) ( not ( = ?auto_134593 ?auto_134591 ) ) ( not ( = ?auto_134593 ?auto_134594 ) ) ( not ( = ?auto_134596 ?auto_134592 ) ) ( not ( = ?auto_134596 ?auto_134591 ) ) ( not ( = ?auto_134596 ?auto_134594 ) ) ( ON ?auto_134595 ?auto_134596 ) ( CLEAR ?auto_134595 ) ( HOLDING ?auto_134592 ) ( CLEAR ?auto_134594 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134591 ?auto_134594 ?auto_134592 )
      ( MAKE-2PILE ?auto_134589 ?auto_134590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134597 - BLOCK
      ?auto_134598 - BLOCK
    )
    :vars
    (
      ?auto_134599 - BLOCK
      ?auto_134601 - BLOCK
      ?auto_134602 - BLOCK
      ?auto_134604 - BLOCK
      ?auto_134600 - BLOCK
      ?auto_134603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134599 ?auto_134598 ) ( ON-TABLE ?auto_134597 ) ( ON ?auto_134598 ?auto_134597 ) ( not ( = ?auto_134597 ?auto_134598 ) ) ( not ( = ?auto_134597 ?auto_134599 ) ) ( not ( = ?auto_134598 ?auto_134599 ) ) ( not ( = ?auto_134597 ?auto_134601 ) ) ( not ( = ?auto_134597 ?auto_134602 ) ) ( not ( = ?auto_134598 ?auto_134601 ) ) ( not ( = ?auto_134598 ?auto_134602 ) ) ( not ( = ?auto_134599 ?auto_134601 ) ) ( not ( = ?auto_134599 ?auto_134602 ) ) ( not ( = ?auto_134601 ?auto_134602 ) ) ( ON ?auto_134601 ?auto_134599 ) ( ON-TABLE ?auto_134604 ) ( ON ?auto_134600 ?auto_134604 ) ( not ( = ?auto_134604 ?auto_134600 ) ) ( not ( = ?auto_134604 ?auto_134603 ) ) ( not ( = ?auto_134604 ?auto_134602 ) ) ( not ( = ?auto_134600 ?auto_134603 ) ) ( not ( = ?auto_134600 ?auto_134602 ) ) ( not ( = ?auto_134603 ?auto_134602 ) ) ( not ( = ?auto_134597 ?auto_134603 ) ) ( not ( = ?auto_134597 ?auto_134604 ) ) ( not ( = ?auto_134597 ?auto_134600 ) ) ( not ( = ?auto_134598 ?auto_134603 ) ) ( not ( = ?auto_134598 ?auto_134604 ) ) ( not ( = ?auto_134598 ?auto_134600 ) ) ( not ( = ?auto_134599 ?auto_134603 ) ) ( not ( = ?auto_134599 ?auto_134604 ) ) ( not ( = ?auto_134599 ?auto_134600 ) ) ( not ( = ?auto_134601 ?auto_134603 ) ) ( not ( = ?auto_134601 ?auto_134604 ) ) ( not ( = ?auto_134601 ?auto_134600 ) ) ( ON ?auto_134602 ?auto_134601 ) ( CLEAR ?auto_134600 ) ( ON ?auto_134603 ?auto_134602 ) ( CLEAR ?auto_134603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134597 ?auto_134598 ?auto_134599 ?auto_134601 ?auto_134602 )
      ( MAKE-2PILE ?auto_134597 ?auto_134598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134605 - BLOCK
      ?auto_134606 - BLOCK
    )
    :vars
    (
      ?auto_134610 - BLOCK
      ?auto_134607 - BLOCK
      ?auto_134609 - BLOCK
      ?auto_134612 - BLOCK
      ?auto_134608 - BLOCK
      ?auto_134611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134610 ?auto_134606 ) ( ON-TABLE ?auto_134605 ) ( ON ?auto_134606 ?auto_134605 ) ( not ( = ?auto_134605 ?auto_134606 ) ) ( not ( = ?auto_134605 ?auto_134610 ) ) ( not ( = ?auto_134606 ?auto_134610 ) ) ( not ( = ?auto_134605 ?auto_134607 ) ) ( not ( = ?auto_134605 ?auto_134609 ) ) ( not ( = ?auto_134606 ?auto_134607 ) ) ( not ( = ?auto_134606 ?auto_134609 ) ) ( not ( = ?auto_134610 ?auto_134607 ) ) ( not ( = ?auto_134610 ?auto_134609 ) ) ( not ( = ?auto_134607 ?auto_134609 ) ) ( ON ?auto_134607 ?auto_134610 ) ( ON-TABLE ?auto_134612 ) ( not ( = ?auto_134612 ?auto_134608 ) ) ( not ( = ?auto_134612 ?auto_134611 ) ) ( not ( = ?auto_134612 ?auto_134609 ) ) ( not ( = ?auto_134608 ?auto_134611 ) ) ( not ( = ?auto_134608 ?auto_134609 ) ) ( not ( = ?auto_134611 ?auto_134609 ) ) ( not ( = ?auto_134605 ?auto_134611 ) ) ( not ( = ?auto_134605 ?auto_134612 ) ) ( not ( = ?auto_134605 ?auto_134608 ) ) ( not ( = ?auto_134606 ?auto_134611 ) ) ( not ( = ?auto_134606 ?auto_134612 ) ) ( not ( = ?auto_134606 ?auto_134608 ) ) ( not ( = ?auto_134610 ?auto_134611 ) ) ( not ( = ?auto_134610 ?auto_134612 ) ) ( not ( = ?auto_134610 ?auto_134608 ) ) ( not ( = ?auto_134607 ?auto_134611 ) ) ( not ( = ?auto_134607 ?auto_134612 ) ) ( not ( = ?auto_134607 ?auto_134608 ) ) ( ON ?auto_134609 ?auto_134607 ) ( ON ?auto_134611 ?auto_134609 ) ( CLEAR ?auto_134611 ) ( HOLDING ?auto_134608 ) ( CLEAR ?auto_134612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134612 ?auto_134608 )
      ( MAKE-2PILE ?auto_134605 ?auto_134606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134613 - BLOCK
      ?auto_134614 - BLOCK
    )
    :vars
    (
      ?auto_134619 - BLOCK
      ?auto_134618 - BLOCK
      ?auto_134615 - BLOCK
      ?auto_134617 - BLOCK
      ?auto_134620 - BLOCK
      ?auto_134616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134619 ?auto_134614 ) ( ON-TABLE ?auto_134613 ) ( ON ?auto_134614 ?auto_134613 ) ( not ( = ?auto_134613 ?auto_134614 ) ) ( not ( = ?auto_134613 ?auto_134619 ) ) ( not ( = ?auto_134614 ?auto_134619 ) ) ( not ( = ?auto_134613 ?auto_134618 ) ) ( not ( = ?auto_134613 ?auto_134615 ) ) ( not ( = ?auto_134614 ?auto_134618 ) ) ( not ( = ?auto_134614 ?auto_134615 ) ) ( not ( = ?auto_134619 ?auto_134618 ) ) ( not ( = ?auto_134619 ?auto_134615 ) ) ( not ( = ?auto_134618 ?auto_134615 ) ) ( ON ?auto_134618 ?auto_134619 ) ( ON-TABLE ?auto_134617 ) ( not ( = ?auto_134617 ?auto_134620 ) ) ( not ( = ?auto_134617 ?auto_134616 ) ) ( not ( = ?auto_134617 ?auto_134615 ) ) ( not ( = ?auto_134620 ?auto_134616 ) ) ( not ( = ?auto_134620 ?auto_134615 ) ) ( not ( = ?auto_134616 ?auto_134615 ) ) ( not ( = ?auto_134613 ?auto_134616 ) ) ( not ( = ?auto_134613 ?auto_134617 ) ) ( not ( = ?auto_134613 ?auto_134620 ) ) ( not ( = ?auto_134614 ?auto_134616 ) ) ( not ( = ?auto_134614 ?auto_134617 ) ) ( not ( = ?auto_134614 ?auto_134620 ) ) ( not ( = ?auto_134619 ?auto_134616 ) ) ( not ( = ?auto_134619 ?auto_134617 ) ) ( not ( = ?auto_134619 ?auto_134620 ) ) ( not ( = ?auto_134618 ?auto_134616 ) ) ( not ( = ?auto_134618 ?auto_134617 ) ) ( not ( = ?auto_134618 ?auto_134620 ) ) ( ON ?auto_134615 ?auto_134618 ) ( ON ?auto_134616 ?auto_134615 ) ( CLEAR ?auto_134617 ) ( ON ?auto_134620 ?auto_134616 ) ( CLEAR ?auto_134620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134613 ?auto_134614 ?auto_134619 ?auto_134618 ?auto_134615 ?auto_134616 )
      ( MAKE-2PILE ?auto_134613 ?auto_134614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134621 - BLOCK
      ?auto_134622 - BLOCK
    )
    :vars
    (
      ?auto_134623 - BLOCK
      ?auto_134625 - BLOCK
      ?auto_134626 - BLOCK
      ?auto_134627 - BLOCK
      ?auto_134624 - BLOCK
      ?auto_134628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134623 ?auto_134622 ) ( ON-TABLE ?auto_134621 ) ( ON ?auto_134622 ?auto_134621 ) ( not ( = ?auto_134621 ?auto_134622 ) ) ( not ( = ?auto_134621 ?auto_134623 ) ) ( not ( = ?auto_134622 ?auto_134623 ) ) ( not ( = ?auto_134621 ?auto_134625 ) ) ( not ( = ?auto_134621 ?auto_134626 ) ) ( not ( = ?auto_134622 ?auto_134625 ) ) ( not ( = ?auto_134622 ?auto_134626 ) ) ( not ( = ?auto_134623 ?auto_134625 ) ) ( not ( = ?auto_134623 ?auto_134626 ) ) ( not ( = ?auto_134625 ?auto_134626 ) ) ( ON ?auto_134625 ?auto_134623 ) ( not ( = ?auto_134627 ?auto_134624 ) ) ( not ( = ?auto_134627 ?auto_134628 ) ) ( not ( = ?auto_134627 ?auto_134626 ) ) ( not ( = ?auto_134624 ?auto_134628 ) ) ( not ( = ?auto_134624 ?auto_134626 ) ) ( not ( = ?auto_134628 ?auto_134626 ) ) ( not ( = ?auto_134621 ?auto_134628 ) ) ( not ( = ?auto_134621 ?auto_134627 ) ) ( not ( = ?auto_134621 ?auto_134624 ) ) ( not ( = ?auto_134622 ?auto_134628 ) ) ( not ( = ?auto_134622 ?auto_134627 ) ) ( not ( = ?auto_134622 ?auto_134624 ) ) ( not ( = ?auto_134623 ?auto_134628 ) ) ( not ( = ?auto_134623 ?auto_134627 ) ) ( not ( = ?auto_134623 ?auto_134624 ) ) ( not ( = ?auto_134625 ?auto_134628 ) ) ( not ( = ?auto_134625 ?auto_134627 ) ) ( not ( = ?auto_134625 ?auto_134624 ) ) ( ON ?auto_134626 ?auto_134625 ) ( ON ?auto_134628 ?auto_134626 ) ( ON ?auto_134624 ?auto_134628 ) ( CLEAR ?auto_134624 ) ( HOLDING ?auto_134627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134627 )
      ( MAKE-2PILE ?auto_134621 ?auto_134622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134639 - BLOCK
      ?auto_134640 - BLOCK
    )
    :vars
    (
      ?auto_134646 - BLOCK
      ?auto_134645 - BLOCK
      ?auto_134644 - BLOCK
      ?auto_134641 - BLOCK
      ?auto_134643 - BLOCK
      ?auto_134642 - BLOCK
      ?auto_134647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134646 ?auto_134640 ) ( ON-TABLE ?auto_134639 ) ( ON ?auto_134640 ?auto_134639 ) ( not ( = ?auto_134639 ?auto_134640 ) ) ( not ( = ?auto_134639 ?auto_134646 ) ) ( not ( = ?auto_134640 ?auto_134646 ) ) ( not ( = ?auto_134639 ?auto_134645 ) ) ( not ( = ?auto_134639 ?auto_134644 ) ) ( not ( = ?auto_134640 ?auto_134645 ) ) ( not ( = ?auto_134640 ?auto_134644 ) ) ( not ( = ?auto_134646 ?auto_134645 ) ) ( not ( = ?auto_134646 ?auto_134644 ) ) ( not ( = ?auto_134645 ?auto_134644 ) ) ( ON ?auto_134645 ?auto_134646 ) ( not ( = ?auto_134641 ?auto_134643 ) ) ( not ( = ?auto_134641 ?auto_134642 ) ) ( not ( = ?auto_134641 ?auto_134644 ) ) ( not ( = ?auto_134643 ?auto_134642 ) ) ( not ( = ?auto_134643 ?auto_134644 ) ) ( not ( = ?auto_134642 ?auto_134644 ) ) ( not ( = ?auto_134639 ?auto_134642 ) ) ( not ( = ?auto_134639 ?auto_134641 ) ) ( not ( = ?auto_134639 ?auto_134643 ) ) ( not ( = ?auto_134640 ?auto_134642 ) ) ( not ( = ?auto_134640 ?auto_134641 ) ) ( not ( = ?auto_134640 ?auto_134643 ) ) ( not ( = ?auto_134646 ?auto_134642 ) ) ( not ( = ?auto_134646 ?auto_134641 ) ) ( not ( = ?auto_134646 ?auto_134643 ) ) ( not ( = ?auto_134645 ?auto_134642 ) ) ( not ( = ?auto_134645 ?auto_134641 ) ) ( not ( = ?auto_134645 ?auto_134643 ) ) ( ON ?auto_134644 ?auto_134645 ) ( ON ?auto_134642 ?auto_134644 ) ( ON ?auto_134643 ?auto_134642 ) ( CLEAR ?auto_134643 ) ( ON ?auto_134641 ?auto_134647 ) ( CLEAR ?auto_134641 ) ( HAND-EMPTY ) ( not ( = ?auto_134639 ?auto_134647 ) ) ( not ( = ?auto_134640 ?auto_134647 ) ) ( not ( = ?auto_134646 ?auto_134647 ) ) ( not ( = ?auto_134645 ?auto_134647 ) ) ( not ( = ?auto_134644 ?auto_134647 ) ) ( not ( = ?auto_134641 ?auto_134647 ) ) ( not ( = ?auto_134643 ?auto_134647 ) ) ( not ( = ?auto_134642 ?auto_134647 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134641 ?auto_134647 )
      ( MAKE-2PILE ?auto_134639 ?auto_134640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134648 - BLOCK
      ?auto_134649 - BLOCK
    )
    :vars
    (
      ?auto_134655 - BLOCK
      ?auto_134656 - BLOCK
      ?auto_134653 - BLOCK
      ?auto_134651 - BLOCK
      ?auto_134650 - BLOCK
      ?auto_134652 - BLOCK
      ?auto_134654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134655 ?auto_134649 ) ( ON-TABLE ?auto_134648 ) ( ON ?auto_134649 ?auto_134648 ) ( not ( = ?auto_134648 ?auto_134649 ) ) ( not ( = ?auto_134648 ?auto_134655 ) ) ( not ( = ?auto_134649 ?auto_134655 ) ) ( not ( = ?auto_134648 ?auto_134656 ) ) ( not ( = ?auto_134648 ?auto_134653 ) ) ( not ( = ?auto_134649 ?auto_134656 ) ) ( not ( = ?auto_134649 ?auto_134653 ) ) ( not ( = ?auto_134655 ?auto_134656 ) ) ( not ( = ?auto_134655 ?auto_134653 ) ) ( not ( = ?auto_134656 ?auto_134653 ) ) ( ON ?auto_134656 ?auto_134655 ) ( not ( = ?auto_134651 ?auto_134650 ) ) ( not ( = ?auto_134651 ?auto_134652 ) ) ( not ( = ?auto_134651 ?auto_134653 ) ) ( not ( = ?auto_134650 ?auto_134652 ) ) ( not ( = ?auto_134650 ?auto_134653 ) ) ( not ( = ?auto_134652 ?auto_134653 ) ) ( not ( = ?auto_134648 ?auto_134652 ) ) ( not ( = ?auto_134648 ?auto_134651 ) ) ( not ( = ?auto_134648 ?auto_134650 ) ) ( not ( = ?auto_134649 ?auto_134652 ) ) ( not ( = ?auto_134649 ?auto_134651 ) ) ( not ( = ?auto_134649 ?auto_134650 ) ) ( not ( = ?auto_134655 ?auto_134652 ) ) ( not ( = ?auto_134655 ?auto_134651 ) ) ( not ( = ?auto_134655 ?auto_134650 ) ) ( not ( = ?auto_134656 ?auto_134652 ) ) ( not ( = ?auto_134656 ?auto_134651 ) ) ( not ( = ?auto_134656 ?auto_134650 ) ) ( ON ?auto_134653 ?auto_134656 ) ( ON ?auto_134652 ?auto_134653 ) ( ON ?auto_134651 ?auto_134654 ) ( CLEAR ?auto_134651 ) ( not ( = ?auto_134648 ?auto_134654 ) ) ( not ( = ?auto_134649 ?auto_134654 ) ) ( not ( = ?auto_134655 ?auto_134654 ) ) ( not ( = ?auto_134656 ?auto_134654 ) ) ( not ( = ?auto_134653 ?auto_134654 ) ) ( not ( = ?auto_134651 ?auto_134654 ) ) ( not ( = ?auto_134650 ?auto_134654 ) ) ( not ( = ?auto_134652 ?auto_134654 ) ) ( HOLDING ?auto_134650 ) ( CLEAR ?auto_134652 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134648 ?auto_134649 ?auto_134655 ?auto_134656 ?auto_134653 ?auto_134652 ?auto_134650 )
      ( MAKE-2PILE ?auto_134648 ?auto_134649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134657 - BLOCK
      ?auto_134658 - BLOCK
    )
    :vars
    (
      ?auto_134663 - BLOCK
      ?auto_134664 - BLOCK
      ?auto_134661 - BLOCK
      ?auto_134659 - BLOCK
      ?auto_134665 - BLOCK
      ?auto_134660 - BLOCK
      ?auto_134662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134663 ?auto_134658 ) ( ON-TABLE ?auto_134657 ) ( ON ?auto_134658 ?auto_134657 ) ( not ( = ?auto_134657 ?auto_134658 ) ) ( not ( = ?auto_134657 ?auto_134663 ) ) ( not ( = ?auto_134658 ?auto_134663 ) ) ( not ( = ?auto_134657 ?auto_134664 ) ) ( not ( = ?auto_134657 ?auto_134661 ) ) ( not ( = ?auto_134658 ?auto_134664 ) ) ( not ( = ?auto_134658 ?auto_134661 ) ) ( not ( = ?auto_134663 ?auto_134664 ) ) ( not ( = ?auto_134663 ?auto_134661 ) ) ( not ( = ?auto_134664 ?auto_134661 ) ) ( ON ?auto_134664 ?auto_134663 ) ( not ( = ?auto_134659 ?auto_134665 ) ) ( not ( = ?auto_134659 ?auto_134660 ) ) ( not ( = ?auto_134659 ?auto_134661 ) ) ( not ( = ?auto_134665 ?auto_134660 ) ) ( not ( = ?auto_134665 ?auto_134661 ) ) ( not ( = ?auto_134660 ?auto_134661 ) ) ( not ( = ?auto_134657 ?auto_134660 ) ) ( not ( = ?auto_134657 ?auto_134659 ) ) ( not ( = ?auto_134657 ?auto_134665 ) ) ( not ( = ?auto_134658 ?auto_134660 ) ) ( not ( = ?auto_134658 ?auto_134659 ) ) ( not ( = ?auto_134658 ?auto_134665 ) ) ( not ( = ?auto_134663 ?auto_134660 ) ) ( not ( = ?auto_134663 ?auto_134659 ) ) ( not ( = ?auto_134663 ?auto_134665 ) ) ( not ( = ?auto_134664 ?auto_134660 ) ) ( not ( = ?auto_134664 ?auto_134659 ) ) ( not ( = ?auto_134664 ?auto_134665 ) ) ( ON ?auto_134661 ?auto_134664 ) ( ON ?auto_134660 ?auto_134661 ) ( ON ?auto_134659 ?auto_134662 ) ( not ( = ?auto_134657 ?auto_134662 ) ) ( not ( = ?auto_134658 ?auto_134662 ) ) ( not ( = ?auto_134663 ?auto_134662 ) ) ( not ( = ?auto_134664 ?auto_134662 ) ) ( not ( = ?auto_134661 ?auto_134662 ) ) ( not ( = ?auto_134659 ?auto_134662 ) ) ( not ( = ?auto_134665 ?auto_134662 ) ) ( not ( = ?auto_134660 ?auto_134662 ) ) ( CLEAR ?auto_134660 ) ( ON ?auto_134665 ?auto_134659 ) ( CLEAR ?auto_134665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134662 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134662 ?auto_134659 )
      ( MAKE-2PILE ?auto_134657 ?auto_134658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134666 - BLOCK
      ?auto_134667 - BLOCK
    )
    :vars
    (
      ?auto_134673 - BLOCK
      ?auto_134669 - BLOCK
      ?auto_134670 - BLOCK
      ?auto_134668 - BLOCK
      ?auto_134674 - BLOCK
      ?auto_134672 - BLOCK
      ?auto_134671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134673 ?auto_134667 ) ( ON-TABLE ?auto_134666 ) ( ON ?auto_134667 ?auto_134666 ) ( not ( = ?auto_134666 ?auto_134667 ) ) ( not ( = ?auto_134666 ?auto_134673 ) ) ( not ( = ?auto_134667 ?auto_134673 ) ) ( not ( = ?auto_134666 ?auto_134669 ) ) ( not ( = ?auto_134666 ?auto_134670 ) ) ( not ( = ?auto_134667 ?auto_134669 ) ) ( not ( = ?auto_134667 ?auto_134670 ) ) ( not ( = ?auto_134673 ?auto_134669 ) ) ( not ( = ?auto_134673 ?auto_134670 ) ) ( not ( = ?auto_134669 ?auto_134670 ) ) ( ON ?auto_134669 ?auto_134673 ) ( not ( = ?auto_134668 ?auto_134674 ) ) ( not ( = ?auto_134668 ?auto_134672 ) ) ( not ( = ?auto_134668 ?auto_134670 ) ) ( not ( = ?auto_134674 ?auto_134672 ) ) ( not ( = ?auto_134674 ?auto_134670 ) ) ( not ( = ?auto_134672 ?auto_134670 ) ) ( not ( = ?auto_134666 ?auto_134672 ) ) ( not ( = ?auto_134666 ?auto_134668 ) ) ( not ( = ?auto_134666 ?auto_134674 ) ) ( not ( = ?auto_134667 ?auto_134672 ) ) ( not ( = ?auto_134667 ?auto_134668 ) ) ( not ( = ?auto_134667 ?auto_134674 ) ) ( not ( = ?auto_134673 ?auto_134672 ) ) ( not ( = ?auto_134673 ?auto_134668 ) ) ( not ( = ?auto_134673 ?auto_134674 ) ) ( not ( = ?auto_134669 ?auto_134672 ) ) ( not ( = ?auto_134669 ?auto_134668 ) ) ( not ( = ?auto_134669 ?auto_134674 ) ) ( ON ?auto_134670 ?auto_134669 ) ( ON ?auto_134668 ?auto_134671 ) ( not ( = ?auto_134666 ?auto_134671 ) ) ( not ( = ?auto_134667 ?auto_134671 ) ) ( not ( = ?auto_134673 ?auto_134671 ) ) ( not ( = ?auto_134669 ?auto_134671 ) ) ( not ( = ?auto_134670 ?auto_134671 ) ) ( not ( = ?auto_134668 ?auto_134671 ) ) ( not ( = ?auto_134674 ?auto_134671 ) ) ( not ( = ?auto_134672 ?auto_134671 ) ) ( ON ?auto_134674 ?auto_134668 ) ( CLEAR ?auto_134674 ) ( ON-TABLE ?auto_134671 ) ( HOLDING ?auto_134672 ) ( CLEAR ?auto_134670 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134666 ?auto_134667 ?auto_134673 ?auto_134669 ?auto_134670 ?auto_134672 )
      ( MAKE-2PILE ?auto_134666 ?auto_134667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134675 - BLOCK
      ?auto_134676 - BLOCK
    )
    :vars
    (
      ?auto_134682 - BLOCK
      ?auto_134678 - BLOCK
      ?auto_134680 - BLOCK
      ?auto_134683 - BLOCK
      ?auto_134677 - BLOCK
      ?auto_134681 - BLOCK
      ?auto_134679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134682 ?auto_134676 ) ( ON-TABLE ?auto_134675 ) ( ON ?auto_134676 ?auto_134675 ) ( not ( = ?auto_134675 ?auto_134676 ) ) ( not ( = ?auto_134675 ?auto_134682 ) ) ( not ( = ?auto_134676 ?auto_134682 ) ) ( not ( = ?auto_134675 ?auto_134678 ) ) ( not ( = ?auto_134675 ?auto_134680 ) ) ( not ( = ?auto_134676 ?auto_134678 ) ) ( not ( = ?auto_134676 ?auto_134680 ) ) ( not ( = ?auto_134682 ?auto_134678 ) ) ( not ( = ?auto_134682 ?auto_134680 ) ) ( not ( = ?auto_134678 ?auto_134680 ) ) ( ON ?auto_134678 ?auto_134682 ) ( not ( = ?auto_134683 ?auto_134677 ) ) ( not ( = ?auto_134683 ?auto_134681 ) ) ( not ( = ?auto_134683 ?auto_134680 ) ) ( not ( = ?auto_134677 ?auto_134681 ) ) ( not ( = ?auto_134677 ?auto_134680 ) ) ( not ( = ?auto_134681 ?auto_134680 ) ) ( not ( = ?auto_134675 ?auto_134681 ) ) ( not ( = ?auto_134675 ?auto_134683 ) ) ( not ( = ?auto_134675 ?auto_134677 ) ) ( not ( = ?auto_134676 ?auto_134681 ) ) ( not ( = ?auto_134676 ?auto_134683 ) ) ( not ( = ?auto_134676 ?auto_134677 ) ) ( not ( = ?auto_134682 ?auto_134681 ) ) ( not ( = ?auto_134682 ?auto_134683 ) ) ( not ( = ?auto_134682 ?auto_134677 ) ) ( not ( = ?auto_134678 ?auto_134681 ) ) ( not ( = ?auto_134678 ?auto_134683 ) ) ( not ( = ?auto_134678 ?auto_134677 ) ) ( ON ?auto_134680 ?auto_134678 ) ( ON ?auto_134683 ?auto_134679 ) ( not ( = ?auto_134675 ?auto_134679 ) ) ( not ( = ?auto_134676 ?auto_134679 ) ) ( not ( = ?auto_134682 ?auto_134679 ) ) ( not ( = ?auto_134678 ?auto_134679 ) ) ( not ( = ?auto_134680 ?auto_134679 ) ) ( not ( = ?auto_134683 ?auto_134679 ) ) ( not ( = ?auto_134677 ?auto_134679 ) ) ( not ( = ?auto_134681 ?auto_134679 ) ) ( ON ?auto_134677 ?auto_134683 ) ( ON-TABLE ?auto_134679 ) ( CLEAR ?auto_134680 ) ( ON ?auto_134681 ?auto_134677 ) ( CLEAR ?auto_134681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134679 ?auto_134683 ?auto_134677 )
      ( MAKE-2PILE ?auto_134675 ?auto_134676 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134733 - BLOCK
      ?auto_134734 - BLOCK
      ?auto_134735 - BLOCK
      ?auto_134736 - BLOCK
      ?auto_134737 - BLOCK
      ?auto_134738 - BLOCK
    )
    :vars
    (
      ?auto_134739 - BLOCK
      ?auto_134740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134733 ) ( ON ?auto_134734 ?auto_134733 ) ( ON ?auto_134735 ?auto_134734 ) ( ON ?auto_134736 ?auto_134735 ) ( not ( = ?auto_134733 ?auto_134734 ) ) ( not ( = ?auto_134733 ?auto_134735 ) ) ( not ( = ?auto_134733 ?auto_134736 ) ) ( not ( = ?auto_134733 ?auto_134737 ) ) ( not ( = ?auto_134733 ?auto_134738 ) ) ( not ( = ?auto_134734 ?auto_134735 ) ) ( not ( = ?auto_134734 ?auto_134736 ) ) ( not ( = ?auto_134734 ?auto_134737 ) ) ( not ( = ?auto_134734 ?auto_134738 ) ) ( not ( = ?auto_134735 ?auto_134736 ) ) ( not ( = ?auto_134735 ?auto_134737 ) ) ( not ( = ?auto_134735 ?auto_134738 ) ) ( not ( = ?auto_134736 ?auto_134737 ) ) ( not ( = ?auto_134736 ?auto_134738 ) ) ( not ( = ?auto_134737 ?auto_134738 ) ) ( ON ?auto_134738 ?auto_134739 ) ( not ( = ?auto_134733 ?auto_134739 ) ) ( not ( = ?auto_134734 ?auto_134739 ) ) ( not ( = ?auto_134735 ?auto_134739 ) ) ( not ( = ?auto_134736 ?auto_134739 ) ) ( not ( = ?auto_134737 ?auto_134739 ) ) ( not ( = ?auto_134738 ?auto_134739 ) ) ( CLEAR ?auto_134736 ) ( ON ?auto_134737 ?auto_134738 ) ( CLEAR ?auto_134737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134740 ) ( ON ?auto_134739 ?auto_134740 ) ( not ( = ?auto_134740 ?auto_134739 ) ) ( not ( = ?auto_134740 ?auto_134738 ) ) ( not ( = ?auto_134740 ?auto_134737 ) ) ( not ( = ?auto_134733 ?auto_134740 ) ) ( not ( = ?auto_134734 ?auto_134740 ) ) ( not ( = ?auto_134735 ?auto_134740 ) ) ( not ( = ?auto_134736 ?auto_134740 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134740 ?auto_134739 ?auto_134738 )
      ( MAKE-6PILE ?auto_134733 ?auto_134734 ?auto_134735 ?auto_134736 ?auto_134737 ?auto_134738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134741 - BLOCK
      ?auto_134742 - BLOCK
      ?auto_134743 - BLOCK
      ?auto_134744 - BLOCK
      ?auto_134745 - BLOCK
      ?auto_134746 - BLOCK
    )
    :vars
    (
      ?auto_134747 - BLOCK
      ?auto_134748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134741 ) ( ON ?auto_134742 ?auto_134741 ) ( ON ?auto_134743 ?auto_134742 ) ( not ( = ?auto_134741 ?auto_134742 ) ) ( not ( = ?auto_134741 ?auto_134743 ) ) ( not ( = ?auto_134741 ?auto_134744 ) ) ( not ( = ?auto_134741 ?auto_134745 ) ) ( not ( = ?auto_134741 ?auto_134746 ) ) ( not ( = ?auto_134742 ?auto_134743 ) ) ( not ( = ?auto_134742 ?auto_134744 ) ) ( not ( = ?auto_134742 ?auto_134745 ) ) ( not ( = ?auto_134742 ?auto_134746 ) ) ( not ( = ?auto_134743 ?auto_134744 ) ) ( not ( = ?auto_134743 ?auto_134745 ) ) ( not ( = ?auto_134743 ?auto_134746 ) ) ( not ( = ?auto_134744 ?auto_134745 ) ) ( not ( = ?auto_134744 ?auto_134746 ) ) ( not ( = ?auto_134745 ?auto_134746 ) ) ( ON ?auto_134746 ?auto_134747 ) ( not ( = ?auto_134741 ?auto_134747 ) ) ( not ( = ?auto_134742 ?auto_134747 ) ) ( not ( = ?auto_134743 ?auto_134747 ) ) ( not ( = ?auto_134744 ?auto_134747 ) ) ( not ( = ?auto_134745 ?auto_134747 ) ) ( not ( = ?auto_134746 ?auto_134747 ) ) ( ON ?auto_134745 ?auto_134746 ) ( CLEAR ?auto_134745 ) ( ON-TABLE ?auto_134748 ) ( ON ?auto_134747 ?auto_134748 ) ( not ( = ?auto_134748 ?auto_134747 ) ) ( not ( = ?auto_134748 ?auto_134746 ) ) ( not ( = ?auto_134748 ?auto_134745 ) ) ( not ( = ?auto_134741 ?auto_134748 ) ) ( not ( = ?auto_134742 ?auto_134748 ) ) ( not ( = ?auto_134743 ?auto_134748 ) ) ( not ( = ?auto_134744 ?auto_134748 ) ) ( HOLDING ?auto_134744 ) ( CLEAR ?auto_134743 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134741 ?auto_134742 ?auto_134743 ?auto_134744 )
      ( MAKE-6PILE ?auto_134741 ?auto_134742 ?auto_134743 ?auto_134744 ?auto_134745 ?auto_134746 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134749 - BLOCK
      ?auto_134750 - BLOCK
      ?auto_134751 - BLOCK
      ?auto_134752 - BLOCK
      ?auto_134753 - BLOCK
      ?auto_134754 - BLOCK
    )
    :vars
    (
      ?auto_134756 - BLOCK
      ?auto_134755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134749 ) ( ON ?auto_134750 ?auto_134749 ) ( ON ?auto_134751 ?auto_134750 ) ( not ( = ?auto_134749 ?auto_134750 ) ) ( not ( = ?auto_134749 ?auto_134751 ) ) ( not ( = ?auto_134749 ?auto_134752 ) ) ( not ( = ?auto_134749 ?auto_134753 ) ) ( not ( = ?auto_134749 ?auto_134754 ) ) ( not ( = ?auto_134750 ?auto_134751 ) ) ( not ( = ?auto_134750 ?auto_134752 ) ) ( not ( = ?auto_134750 ?auto_134753 ) ) ( not ( = ?auto_134750 ?auto_134754 ) ) ( not ( = ?auto_134751 ?auto_134752 ) ) ( not ( = ?auto_134751 ?auto_134753 ) ) ( not ( = ?auto_134751 ?auto_134754 ) ) ( not ( = ?auto_134752 ?auto_134753 ) ) ( not ( = ?auto_134752 ?auto_134754 ) ) ( not ( = ?auto_134753 ?auto_134754 ) ) ( ON ?auto_134754 ?auto_134756 ) ( not ( = ?auto_134749 ?auto_134756 ) ) ( not ( = ?auto_134750 ?auto_134756 ) ) ( not ( = ?auto_134751 ?auto_134756 ) ) ( not ( = ?auto_134752 ?auto_134756 ) ) ( not ( = ?auto_134753 ?auto_134756 ) ) ( not ( = ?auto_134754 ?auto_134756 ) ) ( ON ?auto_134753 ?auto_134754 ) ( ON-TABLE ?auto_134755 ) ( ON ?auto_134756 ?auto_134755 ) ( not ( = ?auto_134755 ?auto_134756 ) ) ( not ( = ?auto_134755 ?auto_134754 ) ) ( not ( = ?auto_134755 ?auto_134753 ) ) ( not ( = ?auto_134749 ?auto_134755 ) ) ( not ( = ?auto_134750 ?auto_134755 ) ) ( not ( = ?auto_134751 ?auto_134755 ) ) ( not ( = ?auto_134752 ?auto_134755 ) ) ( CLEAR ?auto_134751 ) ( ON ?auto_134752 ?auto_134753 ) ( CLEAR ?auto_134752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134755 ?auto_134756 ?auto_134754 ?auto_134753 )
      ( MAKE-6PILE ?auto_134749 ?auto_134750 ?auto_134751 ?auto_134752 ?auto_134753 ?auto_134754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134757 - BLOCK
      ?auto_134758 - BLOCK
      ?auto_134759 - BLOCK
      ?auto_134760 - BLOCK
      ?auto_134761 - BLOCK
      ?auto_134762 - BLOCK
    )
    :vars
    (
      ?auto_134763 - BLOCK
      ?auto_134764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134757 ) ( ON ?auto_134758 ?auto_134757 ) ( not ( = ?auto_134757 ?auto_134758 ) ) ( not ( = ?auto_134757 ?auto_134759 ) ) ( not ( = ?auto_134757 ?auto_134760 ) ) ( not ( = ?auto_134757 ?auto_134761 ) ) ( not ( = ?auto_134757 ?auto_134762 ) ) ( not ( = ?auto_134758 ?auto_134759 ) ) ( not ( = ?auto_134758 ?auto_134760 ) ) ( not ( = ?auto_134758 ?auto_134761 ) ) ( not ( = ?auto_134758 ?auto_134762 ) ) ( not ( = ?auto_134759 ?auto_134760 ) ) ( not ( = ?auto_134759 ?auto_134761 ) ) ( not ( = ?auto_134759 ?auto_134762 ) ) ( not ( = ?auto_134760 ?auto_134761 ) ) ( not ( = ?auto_134760 ?auto_134762 ) ) ( not ( = ?auto_134761 ?auto_134762 ) ) ( ON ?auto_134762 ?auto_134763 ) ( not ( = ?auto_134757 ?auto_134763 ) ) ( not ( = ?auto_134758 ?auto_134763 ) ) ( not ( = ?auto_134759 ?auto_134763 ) ) ( not ( = ?auto_134760 ?auto_134763 ) ) ( not ( = ?auto_134761 ?auto_134763 ) ) ( not ( = ?auto_134762 ?auto_134763 ) ) ( ON ?auto_134761 ?auto_134762 ) ( ON-TABLE ?auto_134764 ) ( ON ?auto_134763 ?auto_134764 ) ( not ( = ?auto_134764 ?auto_134763 ) ) ( not ( = ?auto_134764 ?auto_134762 ) ) ( not ( = ?auto_134764 ?auto_134761 ) ) ( not ( = ?auto_134757 ?auto_134764 ) ) ( not ( = ?auto_134758 ?auto_134764 ) ) ( not ( = ?auto_134759 ?auto_134764 ) ) ( not ( = ?auto_134760 ?auto_134764 ) ) ( ON ?auto_134760 ?auto_134761 ) ( CLEAR ?auto_134760 ) ( HOLDING ?auto_134759 ) ( CLEAR ?auto_134758 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134757 ?auto_134758 ?auto_134759 )
      ( MAKE-6PILE ?auto_134757 ?auto_134758 ?auto_134759 ?auto_134760 ?auto_134761 ?auto_134762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134765 - BLOCK
      ?auto_134766 - BLOCK
      ?auto_134767 - BLOCK
      ?auto_134768 - BLOCK
      ?auto_134769 - BLOCK
      ?auto_134770 - BLOCK
    )
    :vars
    (
      ?auto_134771 - BLOCK
      ?auto_134772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134765 ) ( ON ?auto_134766 ?auto_134765 ) ( not ( = ?auto_134765 ?auto_134766 ) ) ( not ( = ?auto_134765 ?auto_134767 ) ) ( not ( = ?auto_134765 ?auto_134768 ) ) ( not ( = ?auto_134765 ?auto_134769 ) ) ( not ( = ?auto_134765 ?auto_134770 ) ) ( not ( = ?auto_134766 ?auto_134767 ) ) ( not ( = ?auto_134766 ?auto_134768 ) ) ( not ( = ?auto_134766 ?auto_134769 ) ) ( not ( = ?auto_134766 ?auto_134770 ) ) ( not ( = ?auto_134767 ?auto_134768 ) ) ( not ( = ?auto_134767 ?auto_134769 ) ) ( not ( = ?auto_134767 ?auto_134770 ) ) ( not ( = ?auto_134768 ?auto_134769 ) ) ( not ( = ?auto_134768 ?auto_134770 ) ) ( not ( = ?auto_134769 ?auto_134770 ) ) ( ON ?auto_134770 ?auto_134771 ) ( not ( = ?auto_134765 ?auto_134771 ) ) ( not ( = ?auto_134766 ?auto_134771 ) ) ( not ( = ?auto_134767 ?auto_134771 ) ) ( not ( = ?auto_134768 ?auto_134771 ) ) ( not ( = ?auto_134769 ?auto_134771 ) ) ( not ( = ?auto_134770 ?auto_134771 ) ) ( ON ?auto_134769 ?auto_134770 ) ( ON-TABLE ?auto_134772 ) ( ON ?auto_134771 ?auto_134772 ) ( not ( = ?auto_134772 ?auto_134771 ) ) ( not ( = ?auto_134772 ?auto_134770 ) ) ( not ( = ?auto_134772 ?auto_134769 ) ) ( not ( = ?auto_134765 ?auto_134772 ) ) ( not ( = ?auto_134766 ?auto_134772 ) ) ( not ( = ?auto_134767 ?auto_134772 ) ) ( not ( = ?auto_134768 ?auto_134772 ) ) ( ON ?auto_134768 ?auto_134769 ) ( CLEAR ?auto_134766 ) ( ON ?auto_134767 ?auto_134768 ) ( CLEAR ?auto_134767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134772 ?auto_134771 ?auto_134770 ?auto_134769 ?auto_134768 )
      ( MAKE-6PILE ?auto_134765 ?auto_134766 ?auto_134767 ?auto_134768 ?auto_134769 ?auto_134770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134773 - BLOCK
      ?auto_134774 - BLOCK
      ?auto_134775 - BLOCK
      ?auto_134776 - BLOCK
      ?auto_134777 - BLOCK
      ?auto_134778 - BLOCK
    )
    :vars
    (
      ?auto_134780 - BLOCK
      ?auto_134779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134773 ) ( not ( = ?auto_134773 ?auto_134774 ) ) ( not ( = ?auto_134773 ?auto_134775 ) ) ( not ( = ?auto_134773 ?auto_134776 ) ) ( not ( = ?auto_134773 ?auto_134777 ) ) ( not ( = ?auto_134773 ?auto_134778 ) ) ( not ( = ?auto_134774 ?auto_134775 ) ) ( not ( = ?auto_134774 ?auto_134776 ) ) ( not ( = ?auto_134774 ?auto_134777 ) ) ( not ( = ?auto_134774 ?auto_134778 ) ) ( not ( = ?auto_134775 ?auto_134776 ) ) ( not ( = ?auto_134775 ?auto_134777 ) ) ( not ( = ?auto_134775 ?auto_134778 ) ) ( not ( = ?auto_134776 ?auto_134777 ) ) ( not ( = ?auto_134776 ?auto_134778 ) ) ( not ( = ?auto_134777 ?auto_134778 ) ) ( ON ?auto_134778 ?auto_134780 ) ( not ( = ?auto_134773 ?auto_134780 ) ) ( not ( = ?auto_134774 ?auto_134780 ) ) ( not ( = ?auto_134775 ?auto_134780 ) ) ( not ( = ?auto_134776 ?auto_134780 ) ) ( not ( = ?auto_134777 ?auto_134780 ) ) ( not ( = ?auto_134778 ?auto_134780 ) ) ( ON ?auto_134777 ?auto_134778 ) ( ON-TABLE ?auto_134779 ) ( ON ?auto_134780 ?auto_134779 ) ( not ( = ?auto_134779 ?auto_134780 ) ) ( not ( = ?auto_134779 ?auto_134778 ) ) ( not ( = ?auto_134779 ?auto_134777 ) ) ( not ( = ?auto_134773 ?auto_134779 ) ) ( not ( = ?auto_134774 ?auto_134779 ) ) ( not ( = ?auto_134775 ?auto_134779 ) ) ( not ( = ?auto_134776 ?auto_134779 ) ) ( ON ?auto_134776 ?auto_134777 ) ( ON ?auto_134775 ?auto_134776 ) ( CLEAR ?auto_134775 ) ( HOLDING ?auto_134774 ) ( CLEAR ?auto_134773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134773 ?auto_134774 )
      ( MAKE-6PILE ?auto_134773 ?auto_134774 ?auto_134775 ?auto_134776 ?auto_134777 ?auto_134778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134781 - BLOCK
      ?auto_134782 - BLOCK
      ?auto_134783 - BLOCK
      ?auto_134784 - BLOCK
      ?auto_134785 - BLOCK
      ?auto_134786 - BLOCK
    )
    :vars
    (
      ?auto_134788 - BLOCK
      ?auto_134787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134781 ) ( not ( = ?auto_134781 ?auto_134782 ) ) ( not ( = ?auto_134781 ?auto_134783 ) ) ( not ( = ?auto_134781 ?auto_134784 ) ) ( not ( = ?auto_134781 ?auto_134785 ) ) ( not ( = ?auto_134781 ?auto_134786 ) ) ( not ( = ?auto_134782 ?auto_134783 ) ) ( not ( = ?auto_134782 ?auto_134784 ) ) ( not ( = ?auto_134782 ?auto_134785 ) ) ( not ( = ?auto_134782 ?auto_134786 ) ) ( not ( = ?auto_134783 ?auto_134784 ) ) ( not ( = ?auto_134783 ?auto_134785 ) ) ( not ( = ?auto_134783 ?auto_134786 ) ) ( not ( = ?auto_134784 ?auto_134785 ) ) ( not ( = ?auto_134784 ?auto_134786 ) ) ( not ( = ?auto_134785 ?auto_134786 ) ) ( ON ?auto_134786 ?auto_134788 ) ( not ( = ?auto_134781 ?auto_134788 ) ) ( not ( = ?auto_134782 ?auto_134788 ) ) ( not ( = ?auto_134783 ?auto_134788 ) ) ( not ( = ?auto_134784 ?auto_134788 ) ) ( not ( = ?auto_134785 ?auto_134788 ) ) ( not ( = ?auto_134786 ?auto_134788 ) ) ( ON ?auto_134785 ?auto_134786 ) ( ON-TABLE ?auto_134787 ) ( ON ?auto_134788 ?auto_134787 ) ( not ( = ?auto_134787 ?auto_134788 ) ) ( not ( = ?auto_134787 ?auto_134786 ) ) ( not ( = ?auto_134787 ?auto_134785 ) ) ( not ( = ?auto_134781 ?auto_134787 ) ) ( not ( = ?auto_134782 ?auto_134787 ) ) ( not ( = ?auto_134783 ?auto_134787 ) ) ( not ( = ?auto_134784 ?auto_134787 ) ) ( ON ?auto_134784 ?auto_134785 ) ( ON ?auto_134783 ?auto_134784 ) ( CLEAR ?auto_134781 ) ( ON ?auto_134782 ?auto_134783 ) ( CLEAR ?auto_134782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134787 ?auto_134788 ?auto_134786 ?auto_134785 ?auto_134784 ?auto_134783 )
      ( MAKE-6PILE ?auto_134781 ?auto_134782 ?auto_134783 ?auto_134784 ?auto_134785 ?auto_134786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134789 - BLOCK
      ?auto_134790 - BLOCK
      ?auto_134791 - BLOCK
      ?auto_134792 - BLOCK
      ?auto_134793 - BLOCK
      ?auto_134794 - BLOCK
    )
    :vars
    (
      ?auto_134796 - BLOCK
      ?auto_134795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134789 ?auto_134790 ) ) ( not ( = ?auto_134789 ?auto_134791 ) ) ( not ( = ?auto_134789 ?auto_134792 ) ) ( not ( = ?auto_134789 ?auto_134793 ) ) ( not ( = ?auto_134789 ?auto_134794 ) ) ( not ( = ?auto_134790 ?auto_134791 ) ) ( not ( = ?auto_134790 ?auto_134792 ) ) ( not ( = ?auto_134790 ?auto_134793 ) ) ( not ( = ?auto_134790 ?auto_134794 ) ) ( not ( = ?auto_134791 ?auto_134792 ) ) ( not ( = ?auto_134791 ?auto_134793 ) ) ( not ( = ?auto_134791 ?auto_134794 ) ) ( not ( = ?auto_134792 ?auto_134793 ) ) ( not ( = ?auto_134792 ?auto_134794 ) ) ( not ( = ?auto_134793 ?auto_134794 ) ) ( ON ?auto_134794 ?auto_134796 ) ( not ( = ?auto_134789 ?auto_134796 ) ) ( not ( = ?auto_134790 ?auto_134796 ) ) ( not ( = ?auto_134791 ?auto_134796 ) ) ( not ( = ?auto_134792 ?auto_134796 ) ) ( not ( = ?auto_134793 ?auto_134796 ) ) ( not ( = ?auto_134794 ?auto_134796 ) ) ( ON ?auto_134793 ?auto_134794 ) ( ON-TABLE ?auto_134795 ) ( ON ?auto_134796 ?auto_134795 ) ( not ( = ?auto_134795 ?auto_134796 ) ) ( not ( = ?auto_134795 ?auto_134794 ) ) ( not ( = ?auto_134795 ?auto_134793 ) ) ( not ( = ?auto_134789 ?auto_134795 ) ) ( not ( = ?auto_134790 ?auto_134795 ) ) ( not ( = ?auto_134791 ?auto_134795 ) ) ( not ( = ?auto_134792 ?auto_134795 ) ) ( ON ?auto_134792 ?auto_134793 ) ( ON ?auto_134791 ?auto_134792 ) ( ON ?auto_134790 ?auto_134791 ) ( CLEAR ?auto_134790 ) ( HOLDING ?auto_134789 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134789 )
      ( MAKE-6PILE ?auto_134789 ?auto_134790 ?auto_134791 ?auto_134792 ?auto_134793 ?auto_134794 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134797 - BLOCK
      ?auto_134798 - BLOCK
      ?auto_134799 - BLOCK
      ?auto_134800 - BLOCK
      ?auto_134801 - BLOCK
      ?auto_134802 - BLOCK
    )
    :vars
    (
      ?auto_134803 - BLOCK
      ?auto_134804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134797 ?auto_134798 ) ) ( not ( = ?auto_134797 ?auto_134799 ) ) ( not ( = ?auto_134797 ?auto_134800 ) ) ( not ( = ?auto_134797 ?auto_134801 ) ) ( not ( = ?auto_134797 ?auto_134802 ) ) ( not ( = ?auto_134798 ?auto_134799 ) ) ( not ( = ?auto_134798 ?auto_134800 ) ) ( not ( = ?auto_134798 ?auto_134801 ) ) ( not ( = ?auto_134798 ?auto_134802 ) ) ( not ( = ?auto_134799 ?auto_134800 ) ) ( not ( = ?auto_134799 ?auto_134801 ) ) ( not ( = ?auto_134799 ?auto_134802 ) ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) ( ON ?auto_134802 ?auto_134803 ) ( not ( = ?auto_134797 ?auto_134803 ) ) ( not ( = ?auto_134798 ?auto_134803 ) ) ( not ( = ?auto_134799 ?auto_134803 ) ) ( not ( = ?auto_134800 ?auto_134803 ) ) ( not ( = ?auto_134801 ?auto_134803 ) ) ( not ( = ?auto_134802 ?auto_134803 ) ) ( ON ?auto_134801 ?auto_134802 ) ( ON-TABLE ?auto_134804 ) ( ON ?auto_134803 ?auto_134804 ) ( not ( = ?auto_134804 ?auto_134803 ) ) ( not ( = ?auto_134804 ?auto_134802 ) ) ( not ( = ?auto_134804 ?auto_134801 ) ) ( not ( = ?auto_134797 ?auto_134804 ) ) ( not ( = ?auto_134798 ?auto_134804 ) ) ( not ( = ?auto_134799 ?auto_134804 ) ) ( not ( = ?auto_134800 ?auto_134804 ) ) ( ON ?auto_134800 ?auto_134801 ) ( ON ?auto_134799 ?auto_134800 ) ( ON ?auto_134798 ?auto_134799 ) ( ON ?auto_134797 ?auto_134798 ) ( CLEAR ?auto_134797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134804 ?auto_134803 ?auto_134802 ?auto_134801 ?auto_134800 ?auto_134799 ?auto_134798 )
      ( MAKE-6PILE ?auto_134797 ?auto_134798 ?auto_134799 ?auto_134800 ?auto_134801 ?auto_134802 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134811 - BLOCK
      ?auto_134812 - BLOCK
      ?auto_134813 - BLOCK
      ?auto_134814 - BLOCK
      ?auto_134815 - BLOCK
      ?auto_134816 - BLOCK
    )
    :vars
    (
      ?auto_134817 - BLOCK
      ?auto_134818 - BLOCK
      ?auto_134819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134811 ?auto_134812 ) ) ( not ( = ?auto_134811 ?auto_134813 ) ) ( not ( = ?auto_134811 ?auto_134814 ) ) ( not ( = ?auto_134811 ?auto_134815 ) ) ( not ( = ?auto_134811 ?auto_134816 ) ) ( not ( = ?auto_134812 ?auto_134813 ) ) ( not ( = ?auto_134812 ?auto_134814 ) ) ( not ( = ?auto_134812 ?auto_134815 ) ) ( not ( = ?auto_134812 ?auto_134816 ) ) ( not ( = ?auto_134813 ?auto_134814 ) ) ( not ( = ?auto_134813 ?auto_134815 ) ) ( not ( = ?auto_134813 ?auto_134816 ) ) ( not ( = ?auto_134814 ?auto_134815 ) ) ( not ( = ?auto_134814 ?auto_134816 ) ) ( not ( = ?auto_134815 ?auto_134816 ) ) ( ON ?auto_134816 ?auto_134817 ) ( not ( = ?auto_134811 ?auto_134817 ) ) ( not ( = ?auto_134812 ?auto_134817 ) ) ( not ( = ?auto_134813 ?auto_134817 ) ) ( not ( = ?auto_134814 ?auto_134817 ) ) ( not ( = ?auto_134815 ?auto_134817 ) ) ( not ( = ?auto_134816 ?auto_134817 ) ) ( ON ?auto_134815 ?auto_134816 ) ( ON-TABLE ?auto_134818 ) ( ON ?auto_134817 ?auto_134818 ) ( not ( = ?auto_134818 ?auto_134817 ) ) ( not ( = ?auto_134818 ?auto_134816 ) ) ( not ( = ?auto_134818 ?auto_134815 ) ) ( not ( = ?auto_134811 ?auto_134818 ) ) ( not ( = ?auto_134812 ?auto_134818 ) ) ( not ( = ?auto_134813 ?auto_134818 ) ) ( not ( = ?auto_134814 ?auto_134818 ) ) ( ON ?auto_134814 ?auto_134815 ) ( ON ?auto_134813 ?auto_134814 ) ( ON ?auto_134812 ?auto_134813 ) ( CLEAR ?auto_134812 ) ( ON ?auto_134811 ?auto_134819 ) ( CLEAR ?auto_134811 ) ( HAND-EMPTY ) ( not ( = ?auto_134811 ?auto_134819 ) ) ( not ( = ?auto_134812 ?auto_134819 ) ) ( not ( = ?auto_134813 ?auto_134819 ) ) ( not ( = ?auto_134814 ?auto_134819 ) ) ( not ( = ?auto_134815 ?auto_134819 ) ) ( not ( = ?auto_134816 ?auto_134819 ) ) ( not ( = ?auto_134817 ?auto_134819 ) ) ( not ( = ?auto_134818 ?auto_134819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134811 ?auto_134819 )
      ( MAKE-6PILE ?auto_134811 ?auto_134812 ?auto_134813 ?auto_134814 ?auto_134815 ?auto_134816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134820 - BLOCK
      ?auto_134821 - BLOCK
      ?auto_134822 - BLOCK
      ?auto_134823 - BLOCK
      ?auto_134824 - BLOCK
      ?auto_134825 - BLOCK
    )
    :vars
    (
      ?auto_134826 - BLOCK
      ?auto_134827 - BLOCK
      ?auto_134828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134820 ?auto_134821 ) ) ( not ( = ?auto_134820 ?auto_134822 ) ) ( not ( = ?auto_134820 ?auto_134823 ) ) ( not ( = ?auto_134820 ?auto_134824 ) ) ( not ( = ?auto_134820 ?auto_134825 ) ) ( not ( = ?auto_134821 ?auto_134822 ) ) ( not ( = ?auto_134821 ?auto_134823 ) ) ( not ( = ?auto_134821 ?auto_134824 ) ) ( not ( = ?auto_134821 ?auto_134825 ) ) ( not ( = ?auto_134822 ?auto_134823 ) ) ( not ( = ?auto_134822 ?auto_134824 ) ) ( not ( = ?auto_134822 ?auto_134825 ) ) ( not ( = ?auto_134823 ?auto_134824 ) ) ( not ( = ?auto_134823 ?auto_134825 ) ) ( not ( = ?auto_134824 ?auto_134825 ) ) ( ON ?auto_134825 ?auto_134826 ) ( not ( = ?auto_134820 ?auto_134826 ) ) ( not ( = ?auto_134821 ?auto_134826 ) ) ( not ( = ?auto_134822 ?auto_134826 ) ) ( not ( = ?auto_134823 ?auto_134826 ) ) ( not ( = ?auto_134824 ?auto_134826 ) ) ( not ( = ?auto_134825 ?auto_134826 ) ) ( ON ?auto_134824 ?auto_134825 ) ( ON-TABLE ?auto_134827 ) ( ON ?auto_134826 ?auto_134827 ) ( not ( = ?auto_134827 ?auto_134826 ) ) ( not ( = ?auto_134827 ?auto_134825 ) ) ( not ( = ?auto_134827 ?auto_134824 ) ) ( not ( = ?auto_134820 ?auto_134827 ) ) ( not ( = ?auto_134821 ?auto_134827 ) ) ( not ( = ?auto_134822 ?auto_134827 ) ) ( not ( = ?auto_134823 ?auto_134827 ) ) ( ON ?auto_134823 ?auto_134824 ) ( ON ?auto_134822 ?auto_134823 ) ( ON ?auto_134820 ?auto_134828 ) ( CLEAR ?auto_134820 ) ( not ( = ?auto_134820 ?auto_134828 ) ) ( not ( = ?auto_134821 ?auto_134828 ) ) ( not ( = ?auto_134822 ?auto_134828 ) ) ( not ( = ?auto_134823 ?auto_134828 ) ) ( not ( = ?auto_134824 ?auto_134828 ) ) ( not ( = ?auto_134825 ?auto_134828 ) ) ( not ( = ?auto_134826 ?auto_134828 ) ) ( not ( = ?auto_134827 ?auto_134828 ) ) ( HOLDING ?auto_134821 ) ( CLEAR ?auto_134822 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134827 ?auto_134826 ?auto_134825 ?auto_134824 ?auto_134823 ?auto_134822 ?auto_134821 )
      ( MAKE-6PILE ?auto_134820 ?auto_134821 ?auto_134822 ?auto_134823 ?auto_134824 ?auto_134825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134829 - BLOCK
      ?auto_134830 - BLOCK
      ?auto_134831 - BLOCK
      ?auto_134832 - BLOCK
      ?auto_134833 - BLOCK
      ?auto_134834 - BLOCK
    )
    :vars
    (
      ?auto_134837 - BLOCK
      ?auto_134836 - BLOCK
      ?auto_134835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134829 ?auto_134830 ) ) ( not ( = ?auto_134829 ?auto_134831 ) ) ( not ( = ?auto_134829 ?auto_134832 ) ) ( not ( = ?auto_134829 ?auto_134833 ) ) ( not ( = ?auto_134829 ?auto_134834 ) ) ( not ( = ?auto_134830 ?auto_134831 ) ) ( not ( = ?auto_134830 ?auto_134832 ) ) ( not ( = ?auto_134830 ?auto_134833 ) ) ( not ( = ?auto_134830 ?auto_134834 ) ) ( not ( = ?auto_134831 ?auto_134832 ) ) ( not ( = ?auto_134831 ?auto_134833 ) ) ( not ( = ?auto_134831 ?auto_134834 ) ) ( not ( = ?auto_134832 ?auto_134833 ) ) ( not ( = ?auto_134832 ?auto_134834 ) ) ( not ( = ?auto_134833 ?auto_134834 ) ) ( ON ?auto_134834 ?auto_134837 ) ( not ( = ?auto_134829 ?auto_134837 ) ) ( not ( = ?auto_134830 ?auto_134837 ) ) ( not ( = ?auto_134831 ?auto_134837 ) ) ( not ( = ?auto_134832 ?auto_134837 ) ) ( not ( = ?auto_134833 ?auto_134837 ) ) ( not ( = ?auto_134834 ?auto_134837 ) ) ( ON ?auto_134833 ?auto_134834 ) ( ON-TABLE ?auto_134836 ) ( ON ?auto_134837 ?auto_134836 ) ( not ( = ?auto_134836 ?auto_134837 ) ) ( not ( = ?auto_134836 ?auto_134834 ) ) ( not ( = ?auto_134836 ?auto_134833 ) ) ( not ( = ?auto_134829 ?auto_134836 ) ) ( not ( = ?auto_134830 ?auto_134836 ) ) ( not ( = ?auto_134831 ?auto_134836 ) ) ( not ( = ?auto_134832 ?auto_134836 ) ) ( ON ?auto_134832 ?auto_134833 ) ( ON ?auto_134831 ?auto_134832 ) ( ON ?auto_134829 ?auto_134835 ) ( not ( = ?auto_134829 ?auto_134835 ) ) ( not ( = ?auto_134830 ?auto_134835 ) ) ( not ( = ?auto_134831 ?auto_134835 ) ) ( not ( = ?auto_134832 ?auto_134835 ) ) ( not ( = ?auto_134833 ?auto_134835 ) ) ( not ( = ?auto_134834 ?auto_134835 ) ) ( not ( = ?auto_134837 ?auto_134835 ) ) ( not ( = ?auto_134836 ?auto_134835 ) ) ( CLEAR ?auto_134831 ) ( ON ?auto_134830 ?auto_134829 ) ( CLEAR ?auto_134830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134835 ?auto_134829 )
      ( MAKE-6PILE ?auto_134829 ?auto_134830 ?auto_134831 ?auto_134832 ?auto_134833 ?auto_134834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134838 - BLOCK
      ?auto_134839 - BLOCK
      ?auto_134840 - BLOCK
      ?auto_134841 - BLOCK
      ?auto_134842 - BLOCK
      ?auto_134843 - BLOCK
    )
    :vars
    (
      ?auto_134844 - BLOCK
      ?auto_134846 - BLOCK
      ?auto_134845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134838 ?auto_134839 ) ) ( not ( = ?auto_134838 ?auto_134840 ) ) ( not ( = ?auto_134838 ?auto_134841 ) ) ( not ( = ?auto_134838 ?auto_134842 ) ) ( not ( = ?auto_134838 ?auto_134843 ) ) ( not ( = ?auto_134839 ?auto_134840 ) ) ( not ( = ?auto_134839 ?auto_134841 ) ) ( not ( = ?auto_134839 ?auto_134842 ) ) ( not ( = ?auto_134839 ?auto_134843 ) ) ( not ( = ?auto_134840 ?auto_134841 ) ) ( not ( = ?auto_134840 ?auto_134842 ) ) ( not ( = ?auto_134840 ?auto_134843 ) ) ( not ( = ?auto_134841 ?auto_134842 ) ) ( not ( = ?auto_134841 ?auto_134843 ) ) ( not ( = ?auto_134842 ?auto_134843 ) ) ( ON ?auto_134843 ?auto_134844 ) ( not ( = ?auto_134838 ?auto_134844 ) ) ( not ( = ?auto_134839 ?auto_134844 ) ) ( not ( = ?auto_134840 ?auto_134844 ) ) ( not ( = ?auto_134841 ?auto_134844 ) ) ( not ( = ?auto_134842 ?auto_134844 ) ) ( not ( = ?auto_134843 ?auto_134844 ) ) ( ON ?auto_134842 ?auto_134843 ) ( ON-TABLE ?auto_134846 ) ( ON ?auto_134844 ?auto_134846 ) ( not ( = ?auto_134846 ?auto_134844 ) ) ( not ( = ?auto_134846 ?auto_134843 ) ) ( not ( = ?auto_134846 ?auto_134842 ) ) ( not ( = ?auto_134838 ?auto_134846 ) ) ( not ( = ?auto_134839 ?auto_134846 ) ) ( not ( = ?auto_134840 ?auto_134846 ) ) ( not ( = ?auto_134841 ?auto_134846 ) ) ( ON ?auto_134841 ?auto_134842 ) ( ON ?auto_134838 ?auto_134845 ) ( not ( = ?auto_134838 ?auto_134845 ) ) ( not ( = ?auto_134839 ?auto_134845 ) ) ( not ( = ?auto_134840 ?auto_134845 ) ) ( not ( = ?auto_134841 ?auto_134845 ) ) ( not ( = ?auto_134842 ?auto_134845 ) ) ( not ( = ?auto_134843 ?auto_134845 ) ) ( not ( = ?auto_134844 ?auto_134845 ) ) ( not ( = ?auto_134846 ?auto_134845 ) ) ( ON ?auto_134839 ?auto_134838 ) ( CLEAR ?auto_134839 ) ( ON-TABLE ?auto_134845 ) ( HOLDING ?auto_134840 ) ( CLEAR ?auto_134841 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134846 ?auto_134844 ?auto_134843 ?auto_134842 ?auto_134841 ?auto_134840 )
      ( MAKE-6PILE ?auto_134838 ?auto_134839 ?auto_134840 ?auto_134841 ?auto_134842 ?auto_134843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134847 - BLOCK
      ?auto_134848 - BLOCK
      ?auto_134849 - BLOCK
      ?auto_134850 - BLOCK
      ?auto_134851 - BLOCK
      ?auto_134852 - BLOCK
    )
    :vars
    (
      ?auto_134855 - BLOCK
      ?auto_134853 - BLOCK
      ?auto_134854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134847 ?auto_134848 ) ) ( not ( = ?auto_134847 ?auto_134849 ) ) ( not ( = ?auto_134847 ?auto_134850 ) ) ( not ( = ?auto_134847 ?auto_134851 ) ) ( not ( = ?auto_134847 ?auto_134852 ) ) ( not ( = ?auto_134848 ?auto_134849 ) ) ( not ( = ?auto_134848 ?auto_134850 ) ) ( not ( = ?auto_134848 ?auto_134851 ) ) ( not ( = ?auto_134848 ?auto_134852 ) ) ( not ( = ?auto_134849 ?auto_134850 ) ) ( not ( = ?auto_134849 ?auto_134851 ) ) ( not ( = ?auto_134849 ?auto_134852 ) ) ( not ( = ?auto_134850 ?auto_134851 ) ) ( not ( = ?auto_134850 ?auto_134852 ) ) ( not ( = ?auto_134851 ?auto_134852 ) ) ( ON ?auto_134852 ?auto_134855 ) ( not ( = ?auto_134847 ?auto_134855 ) ) ( not ( = ?auto_134848 ?auto_134855 ) ) ( not ( = ?auto_134849 ?auto_134855 ) ) ( not ( = ?auto_134850 ?auto_134855 ) ) ( not ( = ?auto_134851 ?auto_134855 ) ) ( not ( = ?auto_134852 ?auto_134855 ) ) ( ON ?auto_134851 ?auto_134852 ) ( ON-TABLE ?auto_134853 ) ( ON ?auto_134855 ?auto_134853 ) ( not ( = ?auto_134853 ?auto_134855 ) ) ( not ( = ?auto_134853 ?auto_134852 ) ) ( not ( = ?auto_134853 ?auto_134851 ) ) ( not ( = ?auto_134847 ?auto_134853 ) ) ( not ( = ?auto_134848 ?auto_134853 ) ) ( not ( = ?auto_134849 ?auto_134853 ) ) ( not ( = ?auto_134850 ?auto_134853 ) ) ( ON ?auto_134850 ?auto_134851 ) ( ON ?auto_134847 ?auto_134854 ) ( not ( = ?auto_134847 ?auto_134854 ) ) ( not ( = ?auto_134848 ?auto_134854 ) ) ( not ( = ?auto_134849 ?auto_134854 ) ) ( not ( = ?auto_134850 ?auto_134854 ) ) ( not ( = ?auto_134851 ?auto_134854 ) ) ( not ( = ?auto_134852 ?auto_134854 ) ) ( not ( = ?auto_134855 ?auto_134854 ) ) ( not ( = ?auto_134853 ?auto_134854 ) ) ( ON ?auto_134848 ?auto_134847 ) ( ON-TABLE ?auto_134854 ) ( CLEAR ?auto_134850 ) ( ON ?auto_134849 ?auto_134848 ) ( CLEAR ?auto_134849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134854 ?auto_134847 ?auto_134848 )
      ( MAKE-6PILE ?auto_134847 ?auto_134848 ?auto_134849 ?auto_134850 ?auto_134851 ?auto_134852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134856 - BLOCK
      ?auto_134857 - BLOCK
      ?auto_134858 - BLOCK
      ?auto_134859 - BLOCK
      ?auto_134860 - BLOCK
      ?auto_134861 - BLOCK
    )
    :vars
    (
      ?auto_134863 - BLOCK
      ?auto_134864 - BLOCK
      ?auto_134862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134856 ?auto_134857 ) ) ( not ( = ?auto_134856 ?auto_134858 ) ) ( not ( = ?auto_134856 ?auto_134859 ) ) ( not ( = ?auto_134856 ?auto_134860 ) ) ( not ( = ?auto_134856 ?auto_134861 ) ) ( not ( = ?auto_134857 ?auto_134858 ) ) ( not ( = ?auto_134857 ?auto_134859 ) ) ( not ( = ?auto_134857 ?auto_134860 ) ) ( not ( = ?auto_134857 ?auto_134861 ) ) ( not ( = ?auto_134858 ?auto_134859 ) ) ( not ( = ?auto_134858 ?auto_134860 ) ) ( not ( = ?auto_134858 ?auto_134861 ) ) ( not ( = ?auto_134859 ?auto_134860 ) ) ( not ( = ?auto_134859 ?auto_134861 ) ) ( not ( = ?auto_134860 ?auto_134861 ) ) ( ON ?auto_134861 ?auto_134863 ) ( not ( = ?auto_134856 ?auto_134863 ) ) ( not ( = ?auto_134857 ?auto_134863 ) ) ( not ( = ?auto_134858 ?auto_134863 ) ) ( not ( = ?auto_134859 ?auto_134863 ) ) ( not ( = ?auto_134860 ?auto_134863 ) ) ( not ( = ?auto_134861 ?auto_134863 ) ) ( ON ?auto_134860 ?auto_134861 ) ( ON-TABLE ?auto_134864 ) ( ON ?auto_134863 ?auto_134864 ) ( not ( = ?auto_134864 ?auto_134863 ) ) ( not ( = ?auto_134864 ?auto_134861 ) ) ( not ( = ?auto_134864 ?auto_134860 ) ) ( not ( = ?auto_134856 ?auto_134864 ) ) ( not ( = ?auto_134857 ?auto_134864 ) ) ( not ( = ?auto_134858 ?auto_134864 ) ) ( not ( = ?auto_134859 ?auto_134864 ) ) ( ON ?auto_134856 ?auto_134862 ) ( not ( = ?auto_134856 ?auto_134862 ) ) ( not ( = ?auto_134857 ?auto_134862 ) ) ( not ( = ?auto_134858 ?auto_134862 ) ) ( not ( = ?auto_134859 ?auto_134862 ) ) ( not ( = ?auto_134860 ?auto_134862 ) ) ( not ( = ?auto_134861 ?auto_134862 ) ) ( not ( = ?auto_134863 ?auto_134862 ) ) ( not ( = ?auto_134864 ?auto_134862 ) ) ( ON ?auto_134857 ?auto_134856 ) ( ON-TABLE ?auto_134862 ) ( ON ?auto_134858 ?auto_134857 ) ( CLEAR ?auto_134858 ) ( HOLDING ?auto_134859 ) ( CLEAR ?auto_134860 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134864 ?auto_134863 ?auto_134861 ?auto_134860 ?auto_134859 )
      ( MAKE-6PILE ?auto_134856 ?auto_134857 ?auto_134858 ?auto_134859 ?auto_134860 ?auto_134861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134865 - BLOCK
      ?auto_134866 - BLOCK
      ?auto_134867 - BLOCK
      ?auto_134868 - BLOCK
      ?auto_134869 - BLOCK
      ?auto_134870 - BLOCK
    )
    :vars
    (
      ?auto_134873 - BLOCK
      ?auto_134872 - BLOCK
      ?auto_134871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134865 ?auto_134866 ) ) ( not ( = ?auto_134865 ?auto_134867 ) ) ( not ( = ?auto_134865 ?auto_134868 ) ) ( not ( = ?auto_134865 ?auto_134869 ) ) ( not ( = ?auto_134865 ?auto_134870 ) ) ( not ( = ?auto_134866 ?auto_134867 ) ) ( not ( = ?auto_134866 ?auto_134868 ) ) ( not ( = ?auto_134866 ?auto_134869 ) ) ( not ( = ?auto_134866 ?auto_134870 ) ) ( not ( = ?auto_134867 ?auto_134868 ) ) ( not ( = ?auto_134867 ?auto_134869 ) ) ( not ( = ?auto_134867 ?auto_134870 ) ) ( not ( = ?auto_134868 ?auto_134869 ) ) ( not ( = ?auto_134868 ?auto_134870 ) ) ( not ( = ?auto_134869 ?auto_134870 ) ) ( ON ?auto_134870 ?auto_134873 ) ( not ( = ?auto_134865 ?auto_134873 ) ) ( not ( = ?auto_134866 ?auto_134873 ) ) ( not ( = ?auto_134867 ?auto_134873 ) ) ( not ( = ?auto_134868 ?auto_134873 ) ) ( not ( = ?auto_134869 ?auto_134873 ) ) ( not ( = ?auto_134870 ?auto_134873 ) ) ( ON ?auto_134869 ?auto_134870 ) ( ON-TABLE ?auto_134872 ) ( ON ?auto_134873 ?auto_134872 ) ( not ( = ?auto_134872 ?auto_134873 ) ) ( not ( = ?auto_134872 ?auto_134870 ) ) ( not ( = ?auto_134872 ?auto_134869 ) ) ( not ( = ?auto_134865 ?auto_134872 ) ) ( not ( = ?auto_134866 ?auto_134872 ) ) ( not ( = ?auto_134867 ?auto_134872 ) ) ( not ( = ?auto_134868 ?auto_134872 ) ) ( ON ?auto_134865 ?auto_134871 ) ( not ( = ?auto_134865 ?auto_134871 ) ) ( not ( = ?auto_134866 ?auto_134871 ) ) ( not ( = ?auto_134867 ?auto_134871 ) ) ( not ( = ?auto_134868 ?auto_134871 ) ) ( not ( = ?auto_134869 ?auto_134871 ) ) ( not ( = ?auto_134870 ?auto_134871 ) ) ( not ( = ?auto_134873 ?auto_134871 ) ) ( not ( = ?auto_134872 ?auto_134871 ) ) ( ON ?auto_134866 ?auto_134865 ) ( ON-TABLE ?auto_134871 ) ( ON ?auto_134867 ?auto_134866 ) ( CLEAR ?auto_134869 ) ( ON ?auto_134868 ?auto_134867 ) ( CLEAR ?auto_134868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134871 ?auto_134865 ?auto_134866 ?auto_134867 )
      ( MAKE-6PILE ?auto_134865 ?auto_134866 ?auto_134867 ?auto_134868 ?auto_134869 ?auto_134870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134874 - BLOCK
      ?auto_134875 - BLOCK
      ?auto_134876 - BLOCK
      ?auto_134877 - BLOCK
      ?auto_134878 - BLOCK
      ?auto_134879 - BLOCK
    )
    :vars
    (
      ?auto_134880 - BLOCK
      ?auto_134882 - BLOCK
      ?auto_134881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134874 ?auto_134875 ) ) ( not ( = ?auto_134874 ?auto_134876 ) ) ( not ( = ?auto_134874 ?auto_134877 ) ) ( not ( = ?auto_134874 ?auto_134878 ) ) ( not ( = ?auto_134874 ?auto_134879 ) ) ( not ( = ?auto_134875 ?auto_134876 ) ) ( not ( = ?auto_134875 ?auto_134877 ) ) ( not ( = ?auto_134875 ?auto_134878 ) ) ( not ( = ?auto_134875 ?auto_134879 ) ) ( not ( = ?auto_134876 ?auto_134877 ) ) ( not ( = ?auto_134876 ?auto_134878 ) ) ( not ( = ?auto_134876 ?auto_134879 ) ) ( not ( = ?auto_134877 ?auto_134878 ) ) ( not ( = ?auto_134877 ?auto_134879 ) ) ( not ( = ?auto_134878 ?auto_134879 ) ) ( ON ?auto_134879 ?auto_134880 ) ( not ( = ?auto_134874 ?auto_134880 ) ) ( not ( = ?auto_134875 ?auto_134880 ) ) ( not ( = ?auto_134876 ?auto_134880 ) ) ( not ( = ?auto_134877 ?auto_134880 ) ) ( not ( = ?auto_134878 ?auto_134880 ) ) ( not ( = ?auto_134879 ?auto_134880 ) ) ( ON-TABLE ?auto_134882 ) ( ON ?auto_134880 ?auto_134882 ) ( not ( = ?auto_134882 ?auto_134880 ) ) ( not ( = ?auto_134882 ?auto_134879 ) ) ( not ( = ?auto_134882 ?auto_134878 ) ) ( not ( = ?auto_134874 ?auto_134882 ) ) ( not ( = ?auto_134875 ?auto_134882 ) ) ( not ( = ?auto_134876 ?auto_134882 ) ) ( not ( = ?auto_134877 ?auto_134882 ) ) ( ON ?auto_134874 ?auto_134881 ) ( not ( = ?auto_134874 ?auto_134881 ) ) ( not ( = ?auto_134875 ?auto_134881 ) ) ( not ( = ?auto_134876 ?auto_134881 ) ) ( not ( = ?auto_134877 ?auto_134881 ) ) ( not ( = ?auto_134878 ?auto_134881 ) ) ( not ( = ?auto_134879 ?auto_134881 ) ) ( not ( = ?auto_134880 ?auto_134881 ) ) ( not ( = ?auto_134882 ?auto_134881 ) ) ( ON ?auto_134875 ?auto_134874 ) ( ON-TABLE ?auto_134881 ) ( ON ?auto_134876 ?auto_134875 ) ( ON ?auto_134877 ?auto_134876 ) ( CLEAR ?auto_134877 ) ( HOLDING ?auto_134878 ) ( CLEAR ?auto_134879 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134882 ?auto_134880 ?auto_134879 ?auto_134878 )
      ( MAKE-6PILE ?auto_134874 ?auto_134875 ?auto_134876 ?auto_134877 ?auto_134878 ?auto_134879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134883 - BLOCK
      ?auto_134884 - BLOCK
      ?auto_134885 - BLOCK
      ?auto_134886 - BLOCK
      ?auto_134887 - BLOCK
      ?auto_134888 - BLOCK
    )
    :vars
    (
      ?auto_134889 - BLOCK
      ?auto_134891 - BLOCK
      ?auto_134890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134883 ?auto_134884 ) ) ( not ( = ?auto_134883 ?auto_134885 ) ) ( not ( = ?auto_134883 ?auto_134886 ) ) ( not ( = ?auto_134883 ?auto_134887 ) ) ( not ( = ?auto_134883 ?auto_134888 ) ) ( not ( = ?auto_134884 ?auto_134885 ) ) ( not ( = ?auto_134884 ?auto_134886 ) ) ( not ( = ?auto_134884 ?auto_134887 ) ) ( not ( = ?auto_134884 ?auto_134888 ) ) ( not ( = ?auto_134885 ?auto_134886 ) ) ( not ( = ?auto_134885 ?auto_134887 ) ) ( not ( = ?auto_134885 ?auto_134888 ) ) ( not ( = ?auto_134886 ?auto_134887 ) ) ( not ( = ?auto_134886 ?auto_134888 ) ) ( not ( = ?auto_134887 ?auto_134888 ) ) ( ON ?auto_134888 ?auto_134889 ) ( not ( = ?auto_134883 ?auto_134889 ) ) ( not ( = ?auto_134884 ?auto_134889 ) ) ( not ( = ?auto_134885 ?auto_134889 ) ) ( not ( = ?auto_134886 ?auto_134889 ) ) ( not ( = ?auto_134887 ?auto_134889 ) ) ( not ( = ?auto_134888 ?auto_134889 ) ) ( ON-TABLE ?auto_134891 ) ( ON ?auto_134889 ?auto_134891 ) ( not ( = ?auto_134891 ?auto_134889 ) ) ( not ( = ?auto_134891 ?auto_134888 ) ) ( not ( = ?auto_134891 ?auto_134887 ) ) ( not ( = ?auto_134883 ?auto_134891 ) ) ( not ( = ?auto_134884 ?auto_134891 ) ) ( not ( = ?auto_134885 ?auto_134891 ) ) ( not ( = ?auto_134886 ?auto_134891 ) ) ( ON ?auto_134883 ?auto_134890 ) ( not ( = ?auto_134883 ?auto_134890 ) ) ( not ( = ?auto_134884 ?auto_134890 ) ) ( not ( = ?auto_134885 ?auto_134890 ) ) ( not ( = ?auto_134886 ?auto_134890 ) ) ( not ( = ?auto_134887 ?auto_134890 ) ) ( not ( = ?auto_134888 ?auto_134890 ) ) ( not ( = ?auto_134889 ?auto_134890 ) ) ( not ( = ?auto_134891 ?auto_134890 ) ) ( ON ?auto_134884 ?auto_134883 ) ( ON-TABLE ?auto_134890 ) ( ON ?auto_134885 ?auto_134884 ) ( ON ?auto_134886 ?auto_134885 ) ( CLEAR ?auto_134888 ) ( ON ?auto_134887 ?auto_134886 ) ( CLEAR ?auto_134887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134890 ?auto_134883 ?auto_134884 ?auto_134885 ?auto_134886 )
      ( MAKE-6PILE ?auto_134883 ?auto_134884 ?auto_134885 ?auto_134886 ?auto_134887 ?auto_134888 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134892 - BLOCK
      ?auto_134893 - BLOCK
      ?auto_134894 - BLOCK
      ?auto_134895 - BLOCK
      ?auto_134896 - BLOCK
      ?auto_134897 - BLOCK
    )
    :vars
    (
      ?auto_134900 - BLOCK
      ?auto_134899 - BLOCK
      ?auto_134898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134892 ?auto_134893 ) ) ( not ( = ?auto_134892 ?auto_134894 ) ) ( not ( = ?auto_134892 ?auto_134895 ) ) ( not ( = ?auto_134892 ?auto_134896 ) ) ( not ( = ?auto_134892 ?auto_134897 ) ) ( not ( = ?auto_134893 ?auto_134894 ) ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134893 ?auto_134896 ) ) ( not ( = ?auto_134893 ?auto_134897 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134896 ) ) ( not ( = ?auto_134894 ?auto_134897 ) ) ( not ( = ?auto_134895 ?auto_134896 ) ) ( not ( = ?auto_134895 ?auto_134897 ) ) ( not ( = ?auto_134896 ?auto_134897 ) ) ( not ( = ?auto_134892 ?auto_134900 ) ) ( not ( = ?auto_134893 ?auto_134900 ) ) ( not ( = ?auto_134894 ?auto_134900 ) ) ( not ( = ?auto_134895 ?auto_134900 ) ) ( not ( = ?auto_134896 ?auto_134900 ) ) ( not ( = ?auto_134897 ?auto_134900 ) ) ( ON-TABLE ?auto_134899 ) ( ON ?auto_134900 ?auto_134899 ) ( not ( = ?auto_134899 ?auto_134900 ) ) ( not ( = ?auto_134899 ?auto_134897 ) ) ( not ( = ?auto_134899 ?auto_134896 ) ) ( not ( = ?auto_134892 ?auto_134899 ) ) ( not ( = ?auto_134893 ?auto_134899 ) ) ( not ( = ?auto_134894 ?auto_134899 ) ) ( not ( = ?auto_134895 ?auto_134899 ) ) ( ON ?auto_134892 ?auto_134898 ) ( not ( = ?auto_134892 ?auto_134898 ) ) ( not ( = ?auto_134893 ?auto_134898 ) ) ( not ( = ?auto_134894 ?auto_134898 ) ) ( not ( = ?auto_134895 ?auto_134898 ) ) ( not ( = ?auto_134896 ?auto_134898 ) ) ( not ( = ?auto_134897 ?auto_134898 ) ) ( not ( = ?auto_134900 ?auto_134898 ) ) ( not ( = ?auto_134899 ?auto_134898 ) ) ( ON ?auto_134893 ?auto_134892 ) ( ON-TABLE ?auto_134898 ) ( ON ?auto_134894 ?auto_134893 ) ( ON ?auto_134895 ?auto_134894 ) ( ON ?auto_134896 ?auto_134895 ) ( CLEAR ?auto_134896 ) ( HOLDING ?auto_134897 ) ( CLEAR ?auto_134900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134899 ?auto_134900 ?auto_134897 )
      ( MAKE-6PILE ?auto_134892 ?auto_134893 ?auto_134894 ?auto_134895 ?auto_134896 ?auto_134897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134901 - BLOCK
      ?auto_134902 - BLOCK
      ?auto_134903 - BLOCK
      ?auto_134904 - BLOCK
      ?auto_134905 - BLOCK
      ?auto_134906 - BLOCK
    )
    :vars
    (
      ?auto_134907 - BLOCK
      ?auto_134909 - BLOCK
      ?auto_134908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134901 ?auto_134902 ) ) ( not ( = ?auto_134901 ?auto_134903 ) ) ( not ( = ?auto_134901 ?auto_134904 ) ) ( not ( = ?auto_134901 ?auto_134905 ) ) ( not ( = ?auto_134901 ?auto_134906 ) ) ( not ( = ?auto_134902 ?auto_134903 ) ) ( not ( = ?auto_134902 ?auto_134904 ) ) ( not ( = ?auto_134902 ?auto_134905 ) ) ( not ( = ?auto_134902 ?auto_134906 ) ) ( not ( = ?auto_134903 ?auto_134904 ) ) ( not ( = ?auto_134903 ?auto_134905 ) ) ( not ( = ?auto_134903 ?auto_134906 ) ) ( not ( = ?auto_134904 ?auto_134905 ) ) ( not ( = ?auto_134904 ?auto_134906 ) ) ( not ( = ?auto_134905 ?auto_134906 ) ) ( not ( = ?auto_134901 ?auto_134907 ) ) ( not ( = ?auto_134902 ?auto_134907 ) ) ( not ( = ?auto_134903 ?auto_134907 ) ) ( not ( = ?auto_134904 ?auto_134907 ) ) ( not ( = ?auto_134905 ?auto_134907 ) ) ( not ( = ?auto_134906 ?auto_134907 ) ) ( ON-TABLE ?auto_134909 ) ( ON ?auto_134907 ?auto_134909 ) ( not ( = ?auto_134909 ?auto_134907 ) ) ( not ( = ?auto_134909 ?auto_134906 ) ) ( not ( = ?auto_134909 ?auto_134905 ) ) ( not ( = ?auto_134901 ?auto_134909 ) ) ( not ( = ?auto_134902 ?auto_134909 ) ) ( not ( = ?auto_134903 ?auto_134909 ) ) ( not ( = ?auto_134904 ?auto_134909 ) ) ( ON ?auto_134901 ?auto_134908 ) ( not ( = ?auto_134901 ?auto_134908 ) ) ( not ( = ?auto_134902 ?auto_134908 ) ) ( not ( = ?auto_134903 ?auto_134908 ) ) ( not ( = ?auto_134904 ?auto_134908 ) ) ( not ( = ?auto_134905 ?auto_134908 ) ) ( not ( = ?auto_134906 ?auto_134908 ) ) ( not ( = ?auto_134907 ?auto_134908 ) ) ( not ( = ?auto_134909 ?auto_134908 ) ) ( ON ?auto_134902 ?auto_134901 ) ( ON-TABLE ?auto_134908 ) ( ON ?auto_134903 ?auto_134902 ) ( ON ?auto_134904 ?auto_134903 ) ( ON ?auto_134905 ?auto_134904 ) ( CLEAR ?auto_134907 ) ( ON ?auto_134906 ?auto_134905 ) ( CLEAR ?auto_134906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134908 ?auto_134901 ?auto_134902 ?auto_134903 ?auto_134904 ?auto_134905 )
      ( MAKE-6PILE ?auto_134901 ?auto_134902 ?auto_134903 ?auto_134904 ?auto_134905 ?auto_134906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134910 - BLOCK
      ?auto_134911 - BLOCK
      ?auto_134912 - BLOCK
      ?auto_134913 - BLOCK
      ?auto_134914 - BLOCK
      ?auto_134915 - BLOCK
    )
    :vars
    (
      ?auto_134917 - BLOCK
      ?auto_134918 - BLOCK
      ?auto_134916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134910 ?auto_134911 ) ) ( not ( = ?auto_134910 ?auto_134912 ) ) ( not ( = ?auto_134910 ?auto_134913 ) ) ( not ( = ?auto_134910 ?auto_134914 ) ) ( not ( = ?auto_134910 ?auto_134915 ) ) ( not ( = ?auto_134911 ?auto_134912 ) ) ( not ( = ?auto_134911 ?auto_134913 ) ) ( not ( = ?auto_134911 ?auto_134914 ) ) ( not ( = ?auto_134911 ?auto_134915 ) ) ( not ( = ?auto_134912 ?auto_134913 ) ) ( not ( = ?auto_134912 ?auto_134914 ) ) ( not ( = ?auto_134912 ?auto_134915 ) ) ( not ( = ?auto_134913 ?auto_134914 ) ) ( not ( = ?auto_134913 ?auto_134915 ) ) ( not ( = ?auto_134914 ?auto_134915 ) ) ( not ( = ?auto_134910 ?auto_134917 ) ) ( not ( = ?auto_134911 ?auto_134917 ) ) ( not ( = ?auto_134912 ?auto_134917 ) ) ( not ( = ?auto_134913 ?auto_134917 ) ) ( not ( = ?auto_134914 ?auto_134917 ) ) ( not ( = ?auto_134915 ?auto_134917 ) ) ( ON-TABLE ?auto_134918 ) ( not ( = ?auto_134918 ?auto_134917 ) ) ( not ( = ?auto_134918 ?auto_134915 ) ) ( not ( = ?auto_134918 ?auto_134914 ) ) ( not ( = ?auto_134910 ?auto_134918 ) ) ( not ( = ?auto_134911 ?auto_134918 ) ) ( not ( = ?auto_134912 ?auto_134918 ) ) ( not ( = ?auto_134913 ?auto_134918 ) ) ( ON ?auto_134910 ?auto_134916 ) ( not ( = ?auto_134910 ?auto_134916 ) ) ( not ( = ?auto_134911 ?auto_134916 ) ) ( not ( = ?auto_134912 ?auto_134916 ) ) ( not ( = ?auto_134913 ?auto_134916 ) ) ( not ( = ?auto_134914 ?auto_134916 ) ) ( not ( = ?auto_134915 ?auto_134916 ) ) ( not ( = ?auto_134917 ?auto_134916 ) ) ( not ( = ?auto_134918 ?auto_134916 ) ) ( ON ?auto_134911 ?auto_134910 ) ( ON-TABLE ?auto_134916 ) ( ON ?auto_134912 ?auto_134911 ) ( ON ?auto_134913 ?auto_134912 ) ( ON ?auto_134914 ?auto_134913 ) ( ON ?auto_134915 ?auto_134914 ) ( CLEAR ?auto_134915 ) ( HOLDING ?auto_134917 ) ( CLEAR ?auto_134918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134918 ?auto_134917 )
      ( MAKE-6PILE ?auto_134910 ?auto_134911 ?auto_134912 ?auto_134913 ?auto_134914 ?auto_134915 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134919 - BLOCK
      ?auto_134920 - BLOCK
      ?auto_134921 - BLOCK
      ?auto_134922 - BLOCK
      ?auto_134923 - BLOCK
      ?auto_134924 - BLOCK
    )
    :vars
    (
      ?auto_134927 - BLOCK
      ?auto_134926 - BLOCK
      ?auto_134925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134919 ?auto_134920 ) ) ( not ( = ?auto_134919 ?auto_134921 ) ) ( not ( = ?auto_134919 ?auto_134922 ) ) ( not ( = ?auto_134919 ?auto_134923 ) ) ( not ( = ?auto_134919 ?auto_134924 ) ) ( not ( = ?auto_134920 ?auto_134921 ) ) ( not ( = ?auto_134920 ?auto_134922 ) ) ( not ( = ?auto_134920 ?auto_134923 ) ) ( not ( = ?auto_134920 ?auto_134924 ) ) ( not ( = ?auto_134921 ?auto_134922 ) ) ( not ( = ?auto_134921 ?auto_134923 ) ) ( not ( = ?auto_134921 ?auto_134924 ) ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134924 ) ) ( not ( = ?auto_134923 ?auto_134924 ) ) ( not ( = ?auto_134919 ?auto_134927 ) ) ( not ( = ?auto_134920 ?auto_134927 ) ) ( not ( = ?auto_134921 ?auto_134927 ) ) ( not ( = ?auto_134922 ?auto_134927 ) ) ( not ( = ?auto_134923 ?auto_134927 ) ) ( not ( = ?auto_134924 ?auto_134927 ) ) ( ON-TABLE ?auto_134926 ) ( not ( = ?auto_134926 ?auto_134927 ) ) ( not ( = ?auto_134926 ?auto_134924 ) ) ( not ( = ?auto_134926 ?auto_134923 ) ) ( not ( = ?auto_134919 ?auto_134926 ) ) ( not ( = ?auto_134920 ?auto_134926 ) ) ( not ( = ?auto_134921 ?auto_134926 ) ) ( not ( = ?auto_134922 ?auto_134926 ) ) ( ON ?auto_134919 ?auto_134925 ) ( not ( = ?auto_134919 ?auto_134925 ) ) ( not ( = ?auto_134920 ?auto_134925 ) ) ( not ( = ?auto_134921 ?auto_134925 ) ) ( not ( = ?auto_134922 ?auto_134925 ) ) ( not ( = ?auto_134923 ?auto_134925 ) ) ( not ( = ?auto_134924 ?auto_134925 ) ) ( not ( = ?auto_134927 ?auto_134925 ) ) ( not ( = ?auto_134926 ?auto_134925 ) ) ( ON ?auto_134920 ?auto_134919 ) ( ON-TABLE ?auto_134925 ) ( ON ?auto_134921 ?auto_134920 ) ( ON ?auto_134922 ?auto_134921 ) ( ON ?auto_134923 ?auto_134922 ) ( ON ?auto_134924 ?auto_134923 ) ( CLEAR ?auto_134926 ) ( ON ?auto_134927 ?auto_134924 ) ( CLEAR ?auto_134927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134925 ?auto_134919 ?auto_134920 ?auto_134921 ?auto_134922 ?auto_134923 ?auto_134924 )
      ( MAKE-6PILE ?auto_134919 ?auto_134920 ?auto_134921 ?auto_134922 ?auto_134923 ?auto_134924 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134928 - BLOCK
      ?auto_134929 - BLOCK
      ?auto_134930 - BLOCK
      ?auto_134931 - BLOCK
      ?auto_134932 - BLOCK
      ?auto_134933 - BLOCK
    )
    :vars
    (
      ?auto_134934 - BLOCK
      ?auto_134935 - BLOCK
      ?auto_134936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134928 ?auto_134929 ) ) ( not ( = ?auto_134928 ?auto_134930 ) ) ( not ( = ?auto_134928 ?auto_134931 ) ) ( not ( = ?auto_134928 ?auto_134932 ) ) ( not ( = ?auto_134928 ?auto_134933 ) ) ( not ( = ?auto_134929 ?auto_134930 ) ) ( not ( = ?auto_134929 ?auto_134931 ) ) ( not ( = ?auto_134929 ?auto_134932 ) ) ( not ( = ?auto_134929 ?auto_134933 ) ) ( not ( = ?auto_134930 ?auto_134931 ) ) ( not ( = ?auto_134930 ?auto_134932 ) ) ( not ( = ?auto_134930 ?auto_134933 ) ) ( not ( = ?auto_134931 ?auto_134932 ) ) ( not ( = ?auto_134931 ?auto_134933 ) ) ( not ( = ?auto_134932 ?auto_134933 ) ) ( not ( = ?auto_134928 ?auto_134934 ) ) ( not ( = ?auto_134929 ?auto_134934 ) ) ( not ( = ?auto_134930 ?auto_134934 ) ) ( not ( = ?auto_134931 ?auto_134934 ) ) ( not ( = ?auto_134932 ?auto_134934 ) ) ( not ( = ?auto_134933 ?auto_134934 ) ) ( not ( = ?auto_134935 ?auto_134934 ) ) ( not ( = ?auto_134935 ?auto_134933 ) ) ( not ( = ?auto_134935 ?auto_134932 ) ) ( not ( = ?auto_134928 ?auto_134935 ) ) ( not ( = ?auto_134929 ?auto_134935 ) ) ( not ( = ?auto_134930 ?auto_134935 ) ) ( not ( = ?auto_134931 ?auto_134935 ) ) ( ON ?auto_134928 ?auto_134936 ) ( not ( = ?auto_134928 ?auto_134936 ) ) ( not ( = ?auto_134929 ?auto_134936 ) ) ( not ( = ?auto_134930 ?auto_134936 ) ) ( not ( = ?auto_134931 ?auto_134936 ) ) ( not ( = ?auto_134932 ?auto_134936 ) ) ( not ( = ?auto_134933 ?auto_134936 ) ) ( not ( = ?auto_134934 ?auto_134936 ) ) ( not ( = ?auto_134935 ?auto_134936 ) ) ( ON ?auto_134929 ?auto_134928 ) ( ON-TABLE ?auto_134936 ) ( ON ?auto_134930 ?auto_134929 ) ( ON ?auto_134931 ?auto_134930 ) ( ON ?auto_134932 ?auto_134931 ) ( ON ?auto_134933 ?auto_134932 ) ( ON ?auto_134934 ?auto_134933 ) ( CLEAR ?auto_134934 ) ( HOLDING ?auto_134935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134935 )
      ( MAKE-6PILE ?auto_134928 ?auto_134929 ?auto_134930 ?auto_134931 ?auto_134932 ?auto_134933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134937 - BLOCK
      ?auto_134938 - BLOCK
      ?auto_134939 - BLOCK
      ?auto_134940 - BLOCK
      ?auto_134941 - BLOCK
      ?auto_134942 - BLOCK
    )
    :vars
    (
      ?auto_134943 - BLOCK
      ?auto_134945 - BLOCK
      ?auto_134944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134937 ?auto_134938 ) ) ( not ( = ?auto_134937 ?auto_134939 ) ) ( not ( = ?auto_134937 ?auto_134940 ) ) ( not ( = ?auto_134937 ?auto_134941 ) ) ( not ( = ?auto_134937 ?auto_134942 ) ) ( not ( = ?auto_134938 ?auto_134939 ) ) ( not ( = ?auto_134938 ?auto_134940 ) ) ( not ( = ?auto_134938 ?auto_134941 ) ) ( not ( = ?auto_134938 ?auto_134942 ) ) ( not ( = ?auto_134939 ?auto_134940 ) ) ( not ( = ?auto_134939 ?auto_134941 ) ) ( not ( = ?auto_134939 ?auto_134942 ) ) ( not ( = ?auto_134940 ?auto_134941 ) ) ( not ( = ?auto_134940 ?auto_134942 ) ) ( not ( = ?auto_134941 ?auto_134942 ) ) ( not ( = ?auto_134937 ?auto_134943 ) ) ( not ( = ?auto_134938 ?auto_134943 ) ) ( not ( = ?auto_134939 ?auto_134943 ) ) ( not ( = ?auto_134940 ?auto_134943 ) ) ( not ( = ?auto_134941 ?auto_134943 ) ) ( not ( = ?auto_134942 ?auto_134943 ) ) ( not ( = ?auto_134945 ?auto_134943 ) ) ( not ( = ?auto_134945 ?auto_134942 ) ) ( not ( = ?auto_134945 ?auto_134941 ) ) ( not ( = ?auto_134937 ?auto_134945 ) ) ( not ( = ?auto_134938 ?auto_134945 ) ) ( not ( = ?auto_134939 ?auto_134945 ) ) ( not ( = ?auto_134940 ?auto_134945 ) ) ( ON ?auto_134937 ?auto_134944 ) ( not ( = ?auto_134937 ?auto_134944 ) ) ( not ( = ?auto_134938 ?auto_134944 ) ) ( not ( = ?auto_134939 ?auto_134944 ) ) ( not ( = ?auto_134940 ?auto_134944 ) ) ( not ( = ?auto_134941 ?auto_134944 ) ) ( not ( = ?auto_134942 ?auto_134944 ) ) ( not ( = ?auto_134943 ?auto_134944 ) ) ( not ( = ?auto_134945 ?auto_134944 ) ) ( ON ?auto_134938 ?auto_134937 ) ( ON-TABLE ?auto_134944 ) ( ON ?auto_134939 ?auto_134938 ) ( ON ?auto_134940 ?auto_134939 ) ( ON ?auto_134941 ?auto_134940 ) ( ON ?auto_134942 ?auto_134941 ) ( ON ?auto_134943 ?auto_134942 ) ( ON ?auto_134945 ?auto_134943 ) ( CLEAR ?auto_134945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134944 ?auto_134937 ?auto_134938 ?auto_134939 ?auto_134940 ?auto_134941 ?auto_134942 ?auto_134943 )
      ( MAKE-6PILE ?auto_134937 ?auto_134938 ?auto_134939 ?auto_134940 ?auto_134941 ?auto_134942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134957 - BLOCK
    )
    :vars
    (
      ?auto_134958 - BLOCK
      ?auto_134960 - BLOCK
      ?auto_134959 - BLOCK
      ?auto_134961 - BLOCK
      ?auto_134962 - BLOCK
      ?auto_134963 - BLOCK
      ?auto_134964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134958 ?auto_134957 ) ( ON-TABLE ?auto_134957 ) ( not ( = ?auto_134957 ?auto_134958 ) ) ( not ( = ?auto_134957 ?auto_134960 ) ) ( not ( = ?auto_134957 ?auto_134959 ) ) ( not ( = ?auto_134958 ?auto_134960 ) ) ( not ( = ?auto_134958 ?auto_134959 ) ) ( not ( = ?auto_134960 ?auto_134959 ) ) ( ON ?auto_134960 ?auto_134958 ) ( CLEAR ?auto_134960 ) ( HOLDING ?auto_134959 ) ( CLEAR ?auto_134961 ) ( ON-TABLE ?auto_134962 ) ( ON ?auto_134963 ?auto_134962 ) ( ON ?auto_134964 ?auto_134963 ) ( ON ?auto_134961 ?auto_134964 ) ( not ( = ?auto_134962 ?auto_134963 ) ) ( not ( = ?auto_134962 ?auto_134964 ) ) ( not ( = ?auto_134962 ?auto_134961 ) ) ( not ( = ?auto_134962 ?auto_134959 ) ) ( not ( = ?auto_134963 ?auto_134964 ) ) ( not ( = ?auto_134963 ?auto_134961 ) ) ( not ( = ?auto_134963 ?auto_134959 ) ) ( not ( = ?auto_134964 ?auto_134961 ) ) ( not ( = ?auto_134964 ?auto_134959 ) ) ( not ( = ?auto_134961 ?auto_134959 ) ) ( not ( = ?auto_134957 ?auto_134961 ) ) ( not ( = ?auto_134957 ?auto_134962 ) ) ( not ( = ?auto_134957 ?auto_134963 ) ) ( not ( = ?auto_134957 ?auto_134964 ) ) ( not ( = ?auto_134958 ?auto_134961 ) ) ( not ( = ?auto_134958 ?auto_134962 ) ) ( not ( = ?auto_134958 ?auto_134963 ) ) ( not ( = ?auto_134958 ?auto_134964 ) ) ( not ( = ?auto_134960 ?auto_134961 ) ) ( not ( = ?auto_134960 ?auto_134962 ) ) ( not ( = ?auto_134960 ?auto_134963 ) ) ( not ( = ?auto_134960 ?auto_134964 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134962 ?auto_134963 ?auto_134964 ?auto_134961 ?auto_134959 )
      ( MAKE-1PILE ?auto_134957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134965 - BLOCK
    )
    :vars
    (
      ?auto_134967 - BLOCK
      ?auto_134968 - BLOCK
      ?auto_134970 - BLOCK
      ?auto_134971 - BLOCK
      ?auto_134972 - BLOCK
      ?auto_134966 - BLOCK
      ?auto_134969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134967 ?auto_134965 ) ( ON-TABLE ?auto_134965 ) ( not ( = ?auto_134965 ?auto_134967 ) ) ( not ( = ?auto_134965 ?auto_134968 ) ) ( not ( = ?auto_134965 ?auto_134970 ) ) ( not ( = ?auto_134967 ?auto_134968 ) ) ( not ( = ?auto_134967 ?auto_134970 ) ) ( not ( = ?auto_134968 ?auto_134970 ) ) ( ON ?auto_134968 ?auto_134967 ) ( CLEAR ?auto_134971 ) ( ON-TABLE ?auto_134972 ) ( ON ?auto_134966 ?auto_134972 ) ( ON ?auto_134969 ?auto_134966 ) ( ON ?auto_134971 ?auto_134969 ) ( not ( = ?auto_134972 ?auto_134966 ) ) ( not ( = ?auto_134972 ?auto_134969 ) ) ( not ( = ?auto_134972 ?auto_134971 ) ) ( not ( = ?auto_134972 ?auto_134970 ) ) ( not ( = ?auto_134966 ?auto_134969 ) ) ( not ( = ?auto_134966 ?auto_134971 ) ) ( not ( = ?auto_134966 ?auto_134970 ) ) ( not ( = ?auto_134969 ?auto_134971 ) ) ( not ( = ?auto_134969 ?auto_134970 ) ) ( not ( = ?auto_134971 ?auto_134970 ) ) ( not ( = ?auto_134965 ?auto_134971 ) ) ( not ( = ?auto_134965 ?auto_134972 ) ) ( not ( = ?auto_134965 ?auto_134966 ) ) ( not ( = ?auto_134965 ?auto_134969 ) ) ( not ( = ?auto_134967 ?auto_134971 ) ) ( not ( = ?auto_134967 ?auto_134972 ) ) ( not ( = ?auto_134967 ?auto_134966 ) ) ( not ( = ?auto_134967 ?auto_134969 ) ) ( not ( = ?auto_134968 ?auto_134971 ) ) ( not ( = ?auto_134968 ?auto_134972 ) ) ( not ( = ?auto_134968 ?auto_134966 ) ) ( not ( = ?auto_134968 ?auto_134969 ) ) ( ON ?auto_134970 ?auto_134968 ) ( CLEAR ?auto_134970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134965 ?auto_134967 ?auto_134968 )
      ( MAKE-1PILE ?auto_134965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134973 - BLOCK
    )
    :vars
    (
      ?auto_134980 - BLOCK
      ?auto_134975 - BLOCK
      ?auto_134976 - BLOCK
      ?auto_134977 - BLOCK
      ?auto_134978 - BLOCK
      ?auto_134974 - BLOCK
      ?auto_134979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134980 ?auto_134973 ) ( ON-TABLE ?auto_134973 ) ( not ( = ?auto_134973 ?auto_134980 ) ) ( not ( = ?auto_134973 ?auto_134975 ) ) ( not ( = ?auto_134973 ?auto_134976 ) ) ( not ( = ?auto_134980 ?auto_134975 ) ) ( not ( = ?auto_134980 ?auto_134976 ) ) ( not ( = ?auto_134975 ?auto_134976 ) ) ( ON ?auto_134975 ?auto_134980 ) ( ON-TABLE ?auto_134977 ) ( ON ?auto_134978 ?auto_134977 ) ( ON ?auto_134974 ?auto_134978 ) ( not ( = ?auto_134977 ?auto_134978 ) ) ( not ( = ?auto_134977 ?auto_134974 ) ) ( not ( = ?auto_134977 ?auto_134979 ) ) ( not ( = ?auto_134977 ?auto_134976 ) ) ( not ( = ?auto_134978 ?auto_134974 ) ) ( not ( = ?auto_134978 ?auto_134979 ) ) ( not ( = ?auto_134978 ?auto_134976 ) ) ( not ( = ?auto_134974 ?auto_134979 ) ) ( not ( = ?auto_134974 ?auto_134976 ) ) ( not ( = ?auto_134979 ?auto_134976 ) ) ( not ( = ?auto_134973 ?auto_134979 ) ) ( not ( = ?auto_134973 ?auto_134977 ) ) ( not ( = ?auto_134973 ?auto_134978 ) ) ( not ( = ?auto_134973 ?auto_134974 ) ) ( not ( = ?auto_134980 ?auto_134979 ) ) ( not ( = ?auto_134980 ?auto_134977 ) ) ( not ( = ?auto_134980 ?auto_134978 ) ) ( not ( = ?auto_134980 ?auto_134974 ) ) ( not ( = ?auto_134975 ?auto_134979 ) ) ( not ( = ?auto_134975 ?auto_134977 ) ) ( not ( = ?auto_134975 ?auto_134978 ) ) ( not ( = ?auto_134975 ?auto_134974 ) ) ( ON ?auto_134976 ?auto_134975 ) ( CLEAR ?auto_134976 ) ( HOLDING ?auto_134979 ) ( CLEAR ?auto_134974 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134977 ?auto_134978 ?auto_134974 ?auto_134979 )
      ( MAKE-1PILE ?auto_134973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134981 - BLOCK
    )
    :vars
    (
      ?auto_134985 - BLOCK
      ?auto_134983 - BLOCK
      ?auto_134982 - BLOCK
      ?auto_134986 - BLOCK
      ?auto_134988 - BLOCK
      ?auto_134984 - BLOCK
      ?auto_134987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134985 ?auto_134981 ) ( ON-TABLE ?auto_134981 ) ( not ( = ?auto_134981 ?auto_134985 ) ) ( not ( = ?auto_134981 ?auto_134983 ) ) ( not ( = ?auto_134981 ?auto_134982 ) ) ( not ( = ?auto_134985 ?auto_134983 ) ) ( not ( = ?auto_134985 ?auto_134982 ) ) ( not ( = ?auto_134983 ?auto_134982 ) ) ( ON ?auto_134983 ?auto_134985 ) ( ON-TABLE ?auto_134986 ) ( ON ?auto_134988 ?auto_134986 ) ( ON ?auto_134984 ?auto_134988 ) ( not ( = ?auto_134986 ?auto_134988 ) ) ( not ( = ?auto_134986 ?auto_134984 ) ) ( not ( = ?auto_134986 ?auto_134987 ) ) ( not ( = ?auto_134986 ?auto_134982 ) ) ( not ( = ?auto_134988 ?auto_134984 ) ) ( not ( = ?auto_134988 ?auto_134987 ) ) ( not ( = ?auto_134988 ?auto_134982 ) ) ( not ( = ?auto_134984 ?auto_134987 ) ) ( not ( = ?auto_134984 ?auto_134982 ) ) ( not ( = ?auto_134987 ?auto_134982 ) ) ( not ( = ?auto_134981 ?auto_134987 ) ) ( not ( = ?auto_134981 ?auto_134986 ) ) ( not ( = ?auto_134981 ?auto_134988 ) ) ( not ( = ?auto_134981 ?auto_134984 ) ) ( not ( = ?auto_134985 ?auto_134987 ) ) ( not ( = ?auto_134985 ?auto_134986 ) ) ( not ( = ?auto_134985 ?auto_134988 ) ) ( not ( = ?auto_134985 ?auto_134984 ) ) ( not ( = ?auto_134983 ?auto_134987 ) ) ( not ( = ?auto_134983 ?auto_134986 ) ) ( not ( = ?auto_134983 ?auto_134988 ) ) ( not ( = ?auto_134983 ?auto_134984 ) ) ( ON ?auto_134982 ?auto_134983 ) ( CLEAR ?auto_134984 ) ( ON ?auto_134987 ?auto_134982 ) ( CLEAR ?auto_134987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134981 ?auto_134985 ?auto_134983 ?auto_134982 )
      ( MAKE-1PILE ?auto_134981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134989 - BLOCK
    )
    :vars
    (
      ?auto_134995 - BLOCK
      ?auto_134992 - BLOCK
      ?auto_134991 - BLOCK
      ?auto_134996 - BLOCK
      ?auto_134990 - BLOCK
      ?auto_134994 - BLOCK
      ?auto_134993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134995 ?auto_134989 ) ( ON-TABLE ?auto_134989 ) ( not ( = ?auto_134989 ?auto_134995 ) ) ( not ( = ?auto_134989 ?auto_134992 ) ) ( not ( = ?auto_134989 ?auto_134991 ) ) ( not ( = ?auto_134995 ?auto_134992 ) ) ( not ( = ?auto_134995 ?auto_134991 ) ) ( not ( = ?auto_134992 ?auto_134991 ) ) ( ON ?auto_134992 ?auto_134995 ) ( ON-TABLE ?auto_134996 ) ( ON ?auto_134990 ?auto_134996 ) ( not ( = ?auto_134996 ?auto_134990 ) ) ( not ( = ?auto_134996 ?auto_134994 ) ) ( not ( = ?auto_134996 ?auto_134993 ) ) ( not ( = ?auto_134996 ?auto_134991 ) ) ( not ( = ?auto_134990 ?auto_134994 ) ) ( not ( = ?auto_134990 ?auto_134993 ) ) ( not ( = ?auto_134990 ?auto_134991 ) ) ( not ( = ?auto_134994 ?auto_134993 ) ) ( not ( = ?auto_134994 ?auto_134991 ) ) ( not ( = ?auto_134993 ?auto_134991 ) ) ( not ( = ?auto_134989 ?auto_134993 ) ) ( not ( = ?auto_134989 ?auto_134996 ) ) ( not ( = ?auto_134989 ?auto_134990 ) ) ( not ( = ?auto_134989 ?auto_134994 ) ) ( not ( = ?auto_134995 ?auto_134993 ) ) ( not ( = ?auto_134995 ?auto_134996 ) ) ( not ( = ?auto_134995 ?auto_134990 ) ) ( not ( = ?auto_134995 ?auto_134994 ) ) ( not ( = ?auto_134992 ?auto_134993 ) ) ( not ( = ?auto_134992 ?auto_134996 ) ) ( not ( = ?auto_134992 ?auto_134990 ) ) ( not ( = ?auto_134992 ?auto_134994 ) ) ( ON ?auto_134991 ?auto_134992 ) ( ON ?auto_134993 ?auto_134991 ) ( CLEAR ?auto_134993 ) ( HOLDING ?auto_134994 ) ( CLEAR ?auto_134990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134996 ?auto_134990 ?auto_134994 )
      ( MAKE-1PILE ?auto_134989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134997 - BLOCK
    )
    :vars
    (
      ?auto_135004 - BLOCK
      ?auto_135000 - BLOCK
      ?auto_134998 - BLOCK
      ?auto_134999 - BLOCK
      ?auto_135002 - BLOCK
      ?auto_135001 - BLOCK
      ?auto_135003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135004 ?auto_134997 ) ( ON-TABLE ?auto_134997 ) ( not ( = ?auto_134997 ?auto_135004 ) ) ( not ( = ?auto_134997 ?auto_135000 ) ) ( not ( = ?auto_134997 ?auto_134998 ) ) ( not ( = ?auto_135004 ?auto_135000 ) ) ( not ( = ?auto_135004 ?auto_134998 ) ) ( not ( = ?auto_135000 ?auto_134998 ) ) ( ON ?auto_135000 ?auto_135004 ) ( ON-TABLE ?auto_134999 ) ( ON ?auto_135002 ?auto_134999 ) ( not ( = ?auto_134999 ?auto_135002 ) ) ( not ( = ?auto_134999 ?auto_135001 ) ) ( not ( = ?auto_134999 ?auto_135003 ) ) ( not ( = ?auto_134999 ?auto_134998 ) ) ( not ( = ?auto_135002 ?auto_135001 ) ) ( not ( = ?auto_135002 ?auto_135003 ) ) ( not ( = ?auto_135002 ?auto_134998 ) ) ( not ( = ?auto_135001 ?auto_135003 ) ) ( not ( = ?auto_135001 ?auto_134998 ) ) ( not ( = ?auto_135003 ?auto_134998 ) ) ( not ( = ?auto_134997 ?auto_135003 ) ) ( not ( = ?auto_134997 ?auto_134999 ) ) ( not ( = ?auto_134997 ?auto_135002 ) ) ( not ( = ?auto_134997 ?auto_135001 ) ) ( not ( = ?auto_135004 ?auto_135003 ) ) ( not ( = ?auto_135004 ?auto_134999 ) ) ( not ( = ?auto_135004 ?auto_135002 ) ) ( not ( = ?auto_135004 ?auto_135001 ) ) ( not ( = ?auto_135000 ?auto_135003 ) ) ( not ( = ?auto_135000 ?auto_134999 ) ) ( not ( = ?auto_135000 ?auto_135002 ) ) ( not ( = ?auto_135000 ?auto_135001 ) ) ( ON ?auto_134998 ?auto_135000 ) ( ON ?auto_135003 ?auto_134998 ) ( CLEAR ?auto_135002 ) ( ON ?auto_135001 ?auto_135003 ) ( CLEAR ?auto_135001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134997 ?auto_135004 ?auto_135000 ?auto_134998 ?auto_135003 )
      ( MAKE-1PILE ?auto_134997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135005 - BLOCK
    )
    :vars
    (
      ?auto_135007 - BLOCK
      ?auto_135008 - BLOCK
      ?auto_135009 - BLOCK
      ?auto_135010 - BLOCK
      ?auto_135012 - BLOCK
      ?auto_135006 - BLOCK
      ?auto_135011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135007 ?auto_135005 ) ( ON-TABLE ?auto_135005 ) ( not ( = ?auto_135005 ?auto_135007 ) ) ( not ( = ?auto_135005 ?auto_135008 ) ) ( not ( = ?auto_135005 ?auto_135009 ) ) ( not ( = ?auto_135007 ?auto_135008 ) ) ( not ( = ?auto_135007 ?auto_135009 ) ) ( not ( = ?auto_135008 ?auto_135009 ) ) ( ON ?auto_135008 ?auto_135007 ) ( ON-TABLE ?auto_135010 ) ( not ( = ?auto_135010 ?auto_135012 ) ) ( not ( = ?auto_135010 ?auto_135006 ) ) ( not ( = ?auto_135010 ?auto_135011 ) ) ( not ( = ?auto_135010 ?auto_135009 ) ) ( not ( = ?auto_135012 ?auto_135006 ) ) ( not ( = ?auto_135012 ?auto_135011 ) ) ( not ( = ?auto_135012 ?auto_135009 ) ) ( not ( = ?auto_135006 ?auto_135011 ) ) ( not ( = ?auto_135006 ?auto_135009 ) ) ( not ( = ?auto_135011 ?auto_135009 ) ) ( not ( = ?auto_135005 ?auto_135011 ) ) ( not ( = ?auto_135005 ?auto_135010 ) ) ( not ( = ?auto_135005 ?auto_135012 ) ) ( not ( = ?auto_135005 ?auto_135006 ) ) ( not ( = ?auto_135007 ?auto_135011 ) ) ( not ( = ?auto_135007 ?auto_135010 ) ) ( not ( = ?auto_135007 ?auto_135012 ) ) ( not ( = ?auto_135007 ?auto_135006 ) ) ( not ( = ?auto_135008 ?auto_135011 ) ) ( not ( = ?auto_135008 ?auto_135010 ) ) ( not ( = ?auto_135008 ?auto_135012 ) ) ( not ( = ?auto_135008 ?auto_135006 ) ) ( ON ?auto_135009 ?auto_135008 ) ( ON ?auto_135011 ?auto_135009 ) ( ON ?auto_135006 ?auto_135011 ) ( CLEAR ?auto_135006 ) ( HOLDING ?auto_135012 ) ( CLEAR ?auto_135010 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135010 ?auto_135012 )
      ( MAKE-1PILE ?auto_135005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135013 - BLOCK
    )
    :vars
    (
      ?auto_135015 - BLOCK
      ?auto_135014 - BLOCK
      ?auto_135016 - BLOCK
      ?auto_135017 - BLOCK
      ?auto_135019 - BLOCK
      ?auto_135018 - BLOCK
      ?auto_135020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135015 ?auto_135013 ) ( ON-TABLE ?auto_135013 ) ( not ( = ?auto_135013 ?auto_135015 ) ) ( not ( = ?auto_135013 ?auto_135014 ) ) ( not ( = ?auto_135013 ?auto_135016 ) ) ( not ( = ?auto_135015 ?auto_135014 ) ) ( not ( = ?auto_135015 ?auto_135016 ) ) ( not ( = ?auto_135014 ?auto_135016 ) ) ( ON ?auto_135014 ?auto_135015 ) ( ON-TABLE ?auto_135017 ) ( not ( = ?auto_135017 ?auto_135019 ) ) ( not ( = ?auto_135017 ?auto_135018 ) ) ( not ( = ?auto_135017 ?auto_135020 ) ) ( not ( = ?auto_135017 ?auto_135016 ) ) ( not ( = ?auto_135019 ?auto_135018 ) ) ( not ( = ?auto_135019 ?auto_135020 ) ) ( not ( = ?auto_135019 ?auto_135016 ) ) ( not ( = ?auto_135018 ?auto_135020 ) ) ( not ( = ?auto_135018 ?auto_135016 ) ) ( not ( = ?auto_135020 ?auto_135016 ) ) ( not ( = ?auto_135013 ?auto_135020 ) ) ( not ( = ?auto_135013 ?auto_135017 ) ) ( not ( = ?auto_135013 ?auto_135019 ) ) ( not ( = ?auto_135013 ?auto_135018 ) ) ( not ( = ?auto_135015 ?auto_135020 ) ) ( not ( = ?auto_135015 ?auto_135017 ) ) ( not ( = ?auto_135015 ?auto_135019 ) ) ( not ( = ?auto_135015 ?auto_135018 ) ) ( not ( = ?auto_135014 ?auto_135020 ) ) ( not ( = ?auto_135014 ?auto_135017 ) ) ( not ( = ?auto_135014 ?auto_135019 ) ) ( not ( = ?auto_135014 ?auto_135018 ) ) ( ON ?auto_135016 ?auto_135014 ) ( ON ?auto_135020 ?auto_135016 ) ( ON ?auto_135018 ?auto_135020 ) ( CLEAR ?auto_135017 ) ( ON ?auto_135019 ?auto_135018 ) ( CLEAR ?auto_135019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135013 ?auto_135015 ?auto_135014 ?auto_135016 ?auto_135020 ?auto_135018 )
      ( MAKE-1PILE ?auto_135013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135021 - BLOCK
    )
    :vars
    (
      ?auto_135024 - BLOCK
      ?auto_135023 - BLOCK
      ?auto_135026 - BLOCK
      ?auto_135028 - BLOCK
      ?auto_135022 - BLOCK
      ?auto_135025 - BLOCK
      ?auto_135027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135024 ?auto_135021 ) ( ON-TABLE ?auto_135021 ) ( not ( = ?auto_135021 ?auto_135024 ) ) ( not ( = ?auto_135021 ?auto_135023 ) ) ( not ( = ?auto_135021 ?auto_135026 ) ) ( not ( = ?auto_135024 ?auto_135023 ) ) ( not ( = ?auto_135024 ?auto_135026 ) ) ( not ( = ?auto_135023 ?auto_135026 ) ) ( ON ?auto_135023 ?auto_135024 ) ( not ( = ?auto_135028 ?auto_135022 ) ) ( not ( = ?auto_135028 ?auto_135025 ) ) ( not ( = ?auto_135028 ?auto_135027 ) ) ( not ( = ?auto_135028 ?auto_135026 ) ) ( not ( = ?auto_135022 ?auto_135025 ) ) ( not ( = ?auto_135022 ?auto_135027 ) ) ( not ( = ?auto_135022 ?auto_135026 ) ) ( not ( = ?auto_135025 ?auto_135027 ) ) ( not ( = ?auto_135025 ?auto_135026 ) ) ( not ( = ?auto_135027 ?auto_135026 ) ) ( not ( = ?auto_135021 ?auto_135027 ) ) ( not ( = ?auto_135021 ?auto_135028 ) ) ( not ( = ?auto_135021 ?auto_135022 ) ) ( not ( = ?auto_135021 ?auto_135025 ) ) ( not ( = ?auto_135024 ?auto_135027 ) ) ( not ( = ?auto_135024 ?auto_135028 ) ) ( not ( = ?auto_135024 ?auto_135022 ) ) ( not ( = ?auto_135024 ?auto_135025 ) ) ( not ( = ?auto_135023 ?auto_135027 ) ) ( not ( = ?auto_135023 ?auto_135028 ) ) ( not ( = ?auto_135023 ?auto_135022 ) ) ( not ( = ?auto_135023 ?auto_135025 ) ) ( ON ?auto_135026 ?auto_135023 ) ( ON ?auto_135027 ?auto_135026 ) ( ON ?auto_135025 ?auto_135027 ) ( ON ?auto_135022 ?auto_135025 ) ( CLEAR ?auto_135022 ) ( HOLDING ?auto_135028 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135028 )
      ( MAKE-1PILE ?auto_135021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135038 - BLOCK
    )
    :vars
    (
      ?auto_135045 - BLOCK
      ?auto_135039 - BLOCK
      ?auto_135044 - BLOCK
      ?auto_135043 - BLOCK
      ?auto_135042 - BLOCK
      ?auto_135041 - BLOCK
      ?auto_135040 - BLOCK
      ?auto_135046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135045 ?auto_135038 ) ( ON-TABLE ?auto_135038 ) ( not ( = ?auto_135038 ?auto_135045 ) ) ( not ( = ?auto_135038 ?auto_135039 ) ) ( not ( = ?auto_135038 ?auto_135044 ) ) ( not ( = ?auto_135045 ?auto_135039 ) ) ( not ( = ?auto_135045 ?auto_135044 ) ) ( not ( = ?auto_135039 ?auto_135044 ) ) ( ON ?auto_135039 ?auto_135045 ) ( not ( = ?auto_135043 ?auto_135042 ) ) ( not ( = ?auto_135043 ?auto_135041 ) ) ( not ( = ?auto_135043 ?auto_135040 ) ) ( not ( = ?auto_135043 ?auto_135044 ) ) ( not ( = ?auto_135042 ?auto_135041 ) ) ( not ( = ?auto_135042 ?auto_135040 ) ) ( not ( = ?auto_135042 ?auto_135044 ) ) ( not ( = ?auto_135041 ?auto_135040 ) ) ( not ( = ?auto_135041 ?auto_135044 ) ) ( not ( = ?auto_135040 ?auto_135044 ) ) ( not ( = ?auto_135038 ?auto_135040 ) ) ( not ( = ?auto_135038 ?auto_135043 ) ) ( not ( = ?auto_135038 ?auto_135042 ) ) ( not ( = ?auto_135038 ?auto_135041 ) ) ( not ( = ?auto_135045 ?auto_135040 ) ) ( not ( = ?auto_135045 ?auto_135043 ) ) ( not ( = ?auto_135045 ?auto_135042 ) ) ( not ( = ?auto_135045 ?auto_135041 ) ) ( not ( = ?auto_135039 ?auto_135040 ) ) ( not ( = ?auto_135039 ?auto_135043 ) ) ( not ( = ?auto_135039 ?auto_135042 ) ) ( not ( = ?auto_135039 ?auto_135041 ) ) ( ON ?auto_135044 ?auto_135039 ) ( ON ?auto_135040 ?auto_135044 ) ( ON ?auto_135041 ?auto_135040 ) ( ON ?auto_135042 ?auto_135041 ) ( CLEAR ?auto_135042 ) ( ON ?auto_135043 ?auto_135046 ) ( CLEAR ?auto_135043 ) ( HAND-EMPTY ) ( not ( = ?auto_135038 ?auto_135046 ) ) ( not ( = ?auto_135045 ?auto_135046 ) ) ( not ( = ?auto_135039 ?auto_135046 ) ) ( not ( = ?auto_135044 ?auto_135046 ) ) ( not ( = ?auto_135043 ?auto_135046 ) ) ( not ( = ?auto_135042 ?auto_135046 ) ) ( not ( = ?auto_135041 ?auto_135046 ) ) ( not ( = ?auto_135040 ?auto_135046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135043 ?auto_135046 )
      ( MAKE-1PILE ?auto_135038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135047 - BLOCK
    )
    :vars
    (
      ?auto_135054 - BLOCK
      ?auto_135050 - BLOCK
      ?auto_135051 - BLOCK
      ?auto_135055 - BLOCK
      ?auto_135048 - BLOCK
      ?auto_135049 - BLOCK
      ?auto_135053 - BLOCK
      ?auto_135052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135054 ?auto_135047 ) ( ON-TABLE ?auto_135047 ) ( not ( = ?auto_135047 ?auto_135054 ) ) ( not ( = ?auto_135047 ?auto_135050 ) ) ( not ( = ?auto_135047 ?auto_135051 ) ) ( not ( = ?auto_135054 ?auto_135050 ) ) ( not ( = ?auto_135054 ?auto_135051 ) ) ( not ( = ?auto_135050 ?auto_135051 ) ) ( ON ?auto_135050 ?auto_135054 ) ( not ( = ?auto_135055 ?auto_135048 ) ) ( not ( = ?auto_135055 ?auto_135049 ) ) ( not ( = ?auto_135055 ?auto_135053 ) ) ( not ( = ?auto_135055 ?auto_135051 ) ) ( not ( = ?auto_135048 ?auto_135049 ) ) ( not ( = ?auto_135048 ?auto_135053 ) ) ( not ( = ?auto_135048 ?auto_135051 ) ) ( not ( = ?auto_135049 ?auto_135053 ) ) ( not ( = ?auto_135049 ?auto_135051 ) ) ( not ( = ?auto_135053 ?auto_135051 ) ) ( not ( = ?auto_135047 ?auto_135053 ) ) ( not ( = ?auto_135047 ?auto_135055 ) ) ( not ( = ?auto_135047 ?auto_135048 ) ) ( not ( = ?auto_135047 ?auto_135049 ) ) ( not ( = ?auto_135054 ?auto_135053 ) ) ( not ( = ?auto_135054 ?auto_135055 ) ) ( not ( = ?auto_135054 ?auto_135048 ) ) ( not ( = ?auto_135054 ?auto_135049 ) ) ( not ( = ?auto_135050 ?auto_135053 ) ) ( not ( = ?auto_135050 ?auto_135055 ) ) ( not ( = ?auto_135050 ?auto_135048 ) ) ( not ( = ?auto_135050 ?auto_135049 ) ) ( ON ?auto_135051 ?auto_135050 ) ( ON ?auto_135053 ?auto_135051 ) ( ON ?auto_135049 ?auto_135053 ) ( ON ?auto_135055 ?auto_135052 ) ( CLEAR ?auto_135055 ) ( not ( = ?auto_135047 ?auto_135052 ) ) ( not ( = ?auto_135054 ?auto_135052 ) ) ( not ( = ?auto_135050 ?auto_135052 ) ) ( not ( = ?auto_135051 ?auto_135052 ) ) ( not ( = ?auto_135055 ?auto_135052 ) ) ( not ( = ?auto_135048 ?auto_135052 ) ) ( not ( = ?auto_135049 ?auto_135052 ) ) ( not ( = ?auto_135053 ?auto_135052 ) ) ( HOLDING ?auto_135048 ) ( CLEAR ?auto_135049 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135047 ?auto_135054 ?auto_135050 ?auto_135051 ?auto_135053 ?auto_135049 ?auto_135048 )
      ( MAKE-1PILE ?auto_135047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135056 - BLOCK
    )
    :vars
    (
      ?auto_135060 - BLOCK
      ?auto_135064 - BLOCK
      ?auto_135063 - BLOCK
      ?auto_135058 - BLOCK
      ?auto_135057 - BLOCK
      ?auto_135061 - BLOCK
      ?auto_135062 - BLOCK
      ?auto_135059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135060 ?auto_135056 ) ( ON-TABLE ?auto_135056 ) ( not ( = ?auto_135056 ?auto_135060 ) ) ( not ( = ?auto_135056 ?auto_135064 ) ) ( not ( = ?auto_135056 ?auto_135063 ) ) ( not ( = ?auto_135060 ?auto_135064 ) ) ( not ( = ?auto_135060 ?auto_135063 ) ) ( not ( = ?auto_135064 ?auto_135063 ) ) ( ON ?auto_135064 ?auto_135060 ) ( not ( = ?auto_135058 ?auto_135057 ) ) ( not ( = ?auto_135058 ?auto_135061 ) ) ( not ( = ?auto_135058 ?auto_135062 ) ) ( not ( = ?auto_135058 ?auto_135063 ) ) ( not ( = ?auto_135057 ?auto_135061 ) ) ( not ( = ?auto_135057 ?auto_135062 ) ) ( not ( = ?auto_135057 ?auto_135063 ) ) ( not ( = ?auto_135061 ?auto_135062 ) ) ( not ( = ?auto_135061 ?auto_135063 ) ) ( not ( = ?auto_135062 ?auto_135063 ) ) ( not ( = ?auto_135056 ?auto_135062 ) ) ( not ( = ?auto_135056 ?auto_135058 ) ) ( not ( = ?auto_135056 ?auto_135057 ) ) ( not ( = ?auto_135056 ?auto_135061 ) ) ( not ( = ?auto_135060 ?auto_135062 ) ) ( not ( = ?auto_135060 ?auto_135058 ) ) ( not ( = ?auto_135060 ?auto_135057 ) ) ( not ( = ?auto_135060 ?auto_135061 ) ) ( not ( = ?auto_135064 ?auto_135062 ) ) ( not ( = ?auto_135064 ?auto_135058 ) ) ( not ( = ?auto_135064 ?auto_135057 ) ) ( not ( = ?auto_135064 ?auto_135061 ) ) ( ON ?auto_135063 ?auto_135064 ) ( ON ?auto_135062 ?auto_135063 ) ( ON ?auto_135061 ?auto_135062 ) ( ON ?auto_135058 ?auto_135059 ) ( not ( = ?auto_135056 ?auto_135059 ) ) ( not ( = ?auto_135060 ?auto_135059 ) ) ( not ( = ?auto_135064 ?auto_135059 ) ) ( not ( = ?auto_135063 ?auto_135059 ) ) ( not ( = ?auto_135058 ?auto_135059 ) ) ( not ( = ?auto_135057 ?auto_135059 ) ) ( not ( = ?auto_135061 ?auto_135059 ) ) ( not ( = ?auto_135062 ?auto_135059 ) ) ( CLEAR ?auto_135061 ) ( ON ?auto_135057 ?auto_135058 ) ( CLEAR ?auto_135057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135059 ?auto_135058 )
      ( MAKE-1PILE ?auto_135056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135065 - BLOCK
    )
    :vars
    (
      ?auto_135071 - BLOCK
      ?auto_135068 - BLOCK
      ?auto_135073 - BLOCK
      ?auto_135069 - BLOCK
      ?auto_135072 - BLOCK
      ?auto_135070 - BLOCK
      ?auto_135066 - BLOCK
      ?auto_135067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135071 ?auto_135065 ) ( ON-TABLE ?auto_135065 ) ( not ( = ?auto_135065 ?auto_135071 ) ) ( not ( = ?auto_135065 ?auto_135068 ) ) ( not ( = ?auto_135065 ?auto_135073 ) ) ( not ( = ?auto_135071 ?auto_135068 ) ) ( not ( = ?auto_135071 ?auto_135073 ) ) ( not ( = ?auto_135068 ?auto_135073 ) ) ( ON ?auto_135068 ?auto_135071 ) ( not ( = ?auto_135069 ?auto_135072 ) ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( not ( = ?auto_135069 ?auto_135066 ) ) ( not ( = ?auto_135069 ?auto_135073 ) ) ( not ( = ?auto_135072 ?auto_135070 ) ) ( not ( = ?auto_135072 ?auto_135066 ) ) ( not ( = ?auto_135072 ?auto_135073 ) ) ( not ( = ?auto_135070 ?auto_135066 ) ) ( not ( = ?auto_135070 ?auto_135073 ) ) ( not ( = ?auto_135066 ?auto_135073 ) ) ( not ( = ?auto_135065 ?auto_135066 ) ) ( not ( = ?auto_135065 ?auto_135069 ) ) ( not ( = ?auto_135065 ?auto_135072 ) ) ( not ( = ?auto_135065 ?auto_135070 ) ) ( not ( = ?auto_135071 ?auto_135066 ) ) ( not ( = ?auto_135071 ?auto_135069 ) ) ( not ( = ?auto_135071 ?auto_135072 ) ) ( not ( = ?auto_135071 ?auto_135070 ) ) ( not ( = ?auto_135068 ?auto_135066 ) ) ( not ( = ?auto_135068 ?auto_135069 ) ) ( not ( = ?auto_135068 ?auto_135072 ) ) ( not ( = ?auto_135068 ?auto_135070 ) ) ( ON ?auto_135073 ?auto_135068 ) ( ON ?auto_135066 ?auto_135073 ) ( ON ?auto_135069 ?auto_135067 ) ( not ( = ?auto_135065 ?auto_135067 ) ) ( not ( = ?auto_135071 ?auto_135067 ) ) ( not ( = ?auto_135068 ?auto_135067 ) ) ( not ( = ?auto_135073 ?auto_135067 ) ) ( not ( = ?auto_135069 ?auto_135067 ) ) ( not ( = ?auto_135072 ?auto_135067 ) ) ( not ( = ?auto_135070 ?auto_135067 ) ) ( not ( = ?auto_135066 ?auto_135067 ) ) ( ON ?auto_135072 ?auto_135069 ) ( CLEAR ?auto_135072 ) ( ON-TABLE ?auto_135067 ) ( HOLDING ?auto_135070 ) ( CLEAR ?auto_135066 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135065 ?auto_135071 ?auto_135068 ?auto_135073 ?auto_135066 ?auto_135070 )
      ( MAKE-1PILE ?auto_135065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_135074 - BLOCK
    )
    :vars
    (
      ?auto_135076 - BLOCK
      ?auto_135078 - BLOCK
      ?auto_135081 - BLOCK
      ?auto_135075 - BLOCK
      ?auto_135077 - BLOCK
      ?auto_135080 - BLOCK
      ?auto_135079 - BLOCK
      ?auto_135082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135076 ?auto_135074 ) ( ON-TABLE ?auto_135074 ) ( not ( = ?auto_135074 ?auto_135076 ) ) ( not ( = ?auto_135074 ?auto_135078 ) ) ( not ( = ?auto_135074 ?auto_135081 ) ) ( not ( = ?auto_135076 ?auto_135078 ) ) ( not ( = ?auto_135076 ?auto_135081 ) ) ( not ( = ?auto_135078 ?auto_135081 ) ) ( ON ?auto_135078 ?auto_135076 ) ( not ( = ?auto_135075 ?auto_135077 ) ) ( not ( = ?auto_135075 ?auto_135080 ) ) ( not ( = ?auto_135075 ?auto_135079 ) ) ( not ( = ?auto_135075 ?auto_135081 ) ) ( not ( = ?auto_135077 ?auto_135080 ) ) ( not ( = ?auto_135077 ?auto_135079 ) ) ( not ( = ?auto_135077 ?auto_135081 ) ) ( not ( = ?auto_135080 ?auto_135079 ) ) ( not ( = ?auto_135080 ?auto_135081 ) ) ( not ( = ?auto_135079 ?auto_135081 ) ) ( not ( = ?auto_135074 ?auto_135079 ) ) ( not ( = ?auto_135074 ?auto_135075 ) ) ( not ( = ?auto_135074 ?auto_135077 ) ) ( not ( = ?auto_135074 ?auto_135080 ) ) ( not ( = ?auto_135076 ?auto_135079 ) ) ( not ( = ?auto_135076 ?auto_135075 ) ) ( not ( = ?auto_135076 ?auto_135077 ) ) ( not ( = ?auto_135076 ?auto_135080 ) ) ( not ( = ?auto_135078 ?auto_135079 ) ) ( not ( = ?auto_135078 ?auto_135075 ) ) ( not ( = ?auto_135078 ?auto_135077 ) ) ( not ( = ?auto_135078 ?auto_135080 ) ) ( ON ?auto_135081 ?auto_135078 ) ( ON ?auto_135079 ?auto_135081 ) ( ON ?auto_135075 ?auto_135082 ) ( not ( = ?auto_135074 ?auto_135082 ) ) ( not ( = ?auto_135076 ?auto_135082 ) ) ( not ( = ?auto_135078 ?auto_135082 ) ) ( not ( = ?auto_135081 ?auto_135082 ) ) ( not ( = ?auto_135075 ?auto_135082 ) ) ( not ( = ?auto_135077 ?auto_135082 ) ) ( not ( = ?auto_135080 ?auto_135082 ) ) ( not ( = ?auto_135079 ?auto_135082 ) ) ( ON ?auto_135077 ?auto_135075 ) ( ON-TABLE ?auto_135082 ) ( CLEAR ?auto_135079 ) ( ON ?auto_135080 ?auto_135077 ) ( CLEAR ?auto_135080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135082 ?auto_135075 ?auto_135077 )
      ( MAKE-1PILE ?auto_135074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135126 - BLOCK
      ?auto_135127 - BLOCK
      ?auto_135128 - BLOCK
      ?auto_135129 - BLOCK
      ?auto_135130 - BLOCK
      ?auto_135131 - BLOCK
      ?auto_135132 - BLOCK
    )
    :vars
    (
      ?auto_135133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135126 ) ( ON ?auto_135127 ?auto_135126 ) ( ON ?auto_135128 ?auto_135127 ) ( ON ?auto_135129 ?auto_135128 ) ( ON ?auto_135130 ?auto_135129 ) ( not ( = ?auto_135126 ?auto_135127 ) ) ( not ( = ?auto_135126 ?auto_135128 ) ) ( not ( = ?auto_135126 ?auto_135129 ) ) ( not ( = ?auto_135126 ?auto_135130 ) ) ( not ( = ?auto_135126 ?auto_135131 ) ) ( not ( = ?auto_135126 ?auto_135132 ) ) ( not ( = ?auto_135127 ?auto_135128 ) ) ( not ( = ?auto_135127 ?auto_135129 ) ) ( not ( = ?auto_135127 ?auto_135130 ) ) ( not ( = ?auto_135127 ?auto_135131 ) ) ( not ( = ?auto_135127 ?auto_135132 ) ) ( not ( = ?auto_135128 ?auto_135129 ) ) ( not ( = ?auto_135128 ?auto_135130 ) ) ( not ( = ?auto_135128 ?auto_135131 ) ) ( not ( = ?auto_135128 ?auto_135132 ) ) ( not ( = ?auto_135129 ?auto_135130 ) ) ( not ( = ?auto_135129 ?auto_135131 ) ) ( not ( = ?auto_135129 ?auto_135132 ) ) ( not ( = ?auto_135130 ?auto_135131 ) ) ( not ( = ?auto_135130 ?auto_135132 ) ) ( not ( = ?auto_135131 ?auto_135132 ) ) ( ON ?auto_135132 ?auto_135133 ) ( not ( = ?auto_135126 ?auto_135133 ) ) ( not ( = ?auto_135127 ?auto_135133 ) ) ( not ( = ?auto_135128 ?auto_135133 ) ) ( not ( = ?auto_135129 ?auto_135133 ) ) ( not ( = ?auto_135130 ?auto_135133 ) ) ( not ( = ?auto_135131 ?auto_135133 ) ) ( not ( = ?auto_135132 ?auto_135133 ) ) ( CLEAR ?auto_135130 ) ( ON ?auto_135131 ?auto_135132 ) ( CLEAR ?auto_135131 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135133 ?auto_135132 )
      ( MAKE-7PILE ?auto_135126 ?auto_135127 ?auto_135128 ?auto_135129 ?auto_135130 ?auto_135131 ?auto_135132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135134 - BLOCK
      ?auto_135135 - BLOCK
      ?auto_135136 - BLOCK
      ?auto_135137 - BLOCK
      ?auto_135138 - BLOCK
      ?auto_135139 - BLOCK
      ?auto_135140 - BLOCK
    )
    :vars
    (
      ?auto_135141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135134 ) ( ON ?auto_135135 ?auto_135134 ) ( ON ?auto_135136 ?auto_135135 ) ( ON ?auto_135137 ?auto_135136 ) ( not ( = ?auto_135134 ?auto_135135 ) ) ( not ( = ?auto_135134 ?auto_135136 ) ) ( not ( = ?auto_135134 ?auto_135137 ) ) ( not ( = ?auto_135134 ?auto_135138 ) ) ( not ( = ?auto_135134 ?auto_135139 ) ) ( not ( = ?auto_135134 ?auto_135140 ) ) ( not ( = ?auto_135135 ?auto_135136 ) ) ( not ( = ?auto_135135 ?auto_135137 ) ) ( not ( = ?auto_135135 ?auto_135138 ) ) ( not ( = ?auto_135135 ?auto_135139 ) ) ( not ( = ?auto_135135 ?auto_135140 ) ) ( not ( = ?auto_135136 ?auto_135137 ) ) ( not ( = ?auto_135136 ?auto_135138 ) ) ( not ( = ?auto_135136 ?auto_135139 ) ) ( not ( = ?auto_135136 ?auto_135140 ) ) ( not ( = ?auto_135137 ?auto_135138 ) ) ( not ( = ?auto_135137 ?auto_135139 ) ) ( not ( = ?auto_135137 ?auto_135140 ) ) ( not ( = ?auto_135138 ?auto_135139 ) ) ( not ( = ?auto_135138 ?auto_135140 ) ) ( not ( = ?auto_135139 ?auto_135140 ) ) ( ON ?auto_135140 ?auto_135141 ) ( not ( = ?auto_135134 ?auto_135141 ) ) ( not ( = ?auto_135135 ?auto_135141 ) ) ( not ( = ?auto_135136 ?auto_135141 ) ) ( not ( = ?auto_135137 ?auto_135141 ) ) ( not ( = ?auto_135138 ?auto_135141 ) ) ( not ( = ?auto_135139 ?auto_135141 ) ) ( not ( = ?auto_135140 ?auto_135141 ) ) ( ON ?auto_135139 ?auto_135140 ) ( CLEAR ?auto_135139 ) ( ON-TABLE ?auto_135141 ) ( HOLDING ?auto_135138 ) ( CLEAR ?auto_135137 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135134 ?auto_135135 ?auto_135136 ?auto_135137 ?auto_135138 )
      ( MAKE-7PILE ?auto_135134 ?auto_135135 ?auto_135136 ?auto_135137 ?auto_135138 ?auto_135139 ?auto_135140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135142 - BLOCK
      ?auto_135143 - BLOCK
      ?auto_135144 - BLOCK
      ?auto_135145 - BLOCK
      ?auto_135146 - BLOCK
      ?auto_135147 - BLOCK
      ?auto_135148 - BLOCK
    )
    :vars
    (
      ?auto_135149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135142 ) ( ON ?auto_135143 ?auto_135142 ) ( ON ?auto_135144 ?auto_135143 ) ( ON ?auto_135145 ?auto_135144 ) ( not ( = ?auto_135142 ?auto_135143 ) ) ( not ( = ?auto_135142 ?auto_135144 ) ) ( not ( = ?auto_135142 ?auto_135145 ) ) ( not ( = ?auto_135142 ?auto_135146 ) ) ( not ( = ?auto_135142 ?auto_135147 ) ) ( not ( = ?auto_135142 ?auto_135148 ) ) ( not ( = ?auto_135143 ?auto_135144 ) ) ( not ( = ?auto_135143 ?auto_135145 ) ) ( not ( = ?auto_135143 ?auto_135146 ) ) ( not ( = ?auto_135143 ?auto_135147 ) ) ( not ( = ?auto_135143 ?auto_135148 ) ) ( not ( = ?auto_135144 ?auto_135145 ) ) ( not ( = ?auto_135144 ?auto_135146 ) ) ( not ( = ?auto_135144 ?auto_135147 ) ) ( not ( = ?auto_135144 ?auto_135148 ) ) ( not ( = ?auto_135145 ?auto_135146 ) ) ( not ( = ?auto_135145 ?auto_135147 ) ) ( not ( = ?auto_135145 ?auto_135148 ) ) ( not ( = ?auto_135146 ?auto_135147 ) ) ( not ( = ?auto_135146 ?auto_135148 ) ) ( not ( = ?auto_135147 ?auto_135148 ) ) ( ON ?auto_135148 ?auto_135149 ) ( not ( = ?auto_135142 ?auto_135149 ) ) ( not ( = ?auto_135143 ?auto_135149 ) ) ( not ( = ?auto_135144 ?auto_135149 ) ) ( not ( = ?auto_135145 ?auto_135149 ) ) ( not ( = ?auto_135146 ?auto_135149 ) ) ( not ( = ?auto_135147 ?auto_135149 ) ) ( not ( = ?auto_135148 ?auto_135149 ) ) ( ON ?auto_135147 ?auto_135148 ) ( ON-TABLE ?auto_135149 ) ( CLEAR ?auto_135145 ) ( ON ?auto_135146 ?auto_135147 ) ( CLEAR ?auto_135146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135149 ?auto_135148 ?auto_135147 )
      ( MAKE-7PILE ?auto_135142 ?auto_135143 ?auto_135144 ?auto_135145 ?auto_135146 ?auto_135147 ?auto_135148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135150 - BLOCK
      ?auto_135151 - BLOCK
      ?auto_135152 - BLOCK
      ?auto_135153 - BLOCK
      ?auto_135154 - BLOCK
      ?auto_135155 - BLOCK
      ?auto_135156 - BLOCK
    )
    :vars
    (
      ?auto_135157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135150 ) ( ON ?auto_135151 ?auto_135150 ) ( ON ?auto_135152 ?auto_135151 ) ( not ( = ?auto_135150 ?auto_135151 ) ) ( not ( = ?auto_135150 ?auto_135152 ) ) ( not ( = ?auto_135150 ?auto_135153 ) ) ( not ( = ?auto_135150 ?auto_135154 ) ) ( not ( = ?auto_135150 ?auto_135155 ) ) ( not ( = ?auto_135150 ?auto_135156 ) ) ( not ( = ?auto_135151 ?auto_135152 ) ) ( not ( = ?auto_135151 ?auto_135153 ) ) ( not ( = ?auto_135151 ?auto_135154 ) ) ( not ( = ?auto_135151 ?auto_135155 ) ) ( not ( = ?auto_135151 ?auto_135156 ) ) ( not ( = ?auto_135152 ?auto_135153 ) ) ( not ( = ?auto_135152 ?auto_135154 ) ) ( not ( = ?auto_135152 ?auto_135155 ) ) ( not ( = ?auto_135152 ?auto_135156 ) ) ( not ( = ?auto_135153 ?auto_135154 ) ) ( not ( = ?auto_135153 ?auto_135155 ) ) ( not ( = ?auto_135153 ?auto_135156 ) ) ( not ( = ?auto_135154 ?auto_135155 ) ) ( not ( = ?auto_135154 ?auto_135156 ) ) ( not ( = ?auto_135155 ?auto_135156 ) ) ( ON ?auto_135156 ?auto_135157 ) ( not ( = ?auto_135150 ?auto_135157 ) ) ( not ( = ?auto_135151 ?auto_135157 ) ) ( not ( = ?auto_135152 ?auto_135157 ) ) ( not ( = ?auto_135153 ?auto_135157 ) ) ( not ( = ?auto_135154 ?auto_135157 ) ) ( not ( = ?auto_135155 ?auto_135157 ) ) ( not ( = ?auto_135156 ?auto_135157 ) ) ( ON ?auto_135155 ?auto_135156 ) ( ON-TABLE ?auto_135157 ) ( ON ?auto_135154 ?auto_135155 ) ( CLEAR ?auto_135154 ) ( HOLDING ?auto_135153 ) ( CLEAR ?auto_135152 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135150 ?auto_135151 ?auto_135152 ?auto_135153 )
      ( MAKE-7PILE ?auto_135150 ?auto_135151 ?auto_135152 ?auto_135153 ?auto_135154 ?auto_135155 ?auto_135156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135158 - BLOCK
      ?auto_135159 - BLOCK
      ?auto_135160 - BLOCK
      ?auto_135161 - BLOCK
      ?auto_135162 - BLOCK
      ?auto_135163 - BLOCK
      ?auto_135164 - BLOCK
    )
    :vars
    (
      ?auto_135165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135158 ) ( ON ?auto_135159 ?auto_135158 ) ( ON ?auto_135160 ?auto_135159 ) ( not ( = ?auto_135158 ?auto_135159 ) ) ( not ( = ?auto_135158 ?auto_135160 ) ) ( not ( = ?auto_135158 ?auto_135161 ) ) ( not ( = ?auto_135158 ?auto_135162 ) ) ( not ( = ?auto_135158 ?auto_135163 ) ) ( not ( = ?auto_135158 ?auto_135164 ) ) ( not ( = ?auto_135159 ?auto_135160 ) ) ( not ( = ?auto_135159 ?auto_135161 ) ) ( not ( = ?auto_135159 ?auto_135162 ) ) ( not ( = ?auto_135159 ?auto_135163 ) ) ( not ( = ?auto_135159 ?auto_135164 ) ) ( not ( = ?auto_135160 ?auto_135161 ) ) ( not ( = ?auto_135160 ?auto_135162 ) ) ( not ( = ?auto_135160 ?auto_135163 ) ) ( not ( = ?auto_135160 ?auto_135164 ) ) ( not ( = ?auto_135161 ?auto_135162 ) ) ( not ( = ?auto_135161 ?auto_135163 ) ) ( not ( = ?auto_135161 ?auto_135164 ) ) ( not ( = ?auto_135162 ?auto_135163 ) ) ( not ( = ?auto_135162 ?auto_135164 ) ) ( not ( = ?auto_135163 ?auto_135164 ) ) ( ON ?auto_135164 ?auto_135165 ) ( not ( = ?auto_135158 ?auto_135165 ) ) ( not ( = ?auto_135159 ?auto_135165 ) ) ( not ( = ?auto_135160 ?auto_135165 ) ) ( not ( = ?auto_135161 ?auto_135165 ) ) ( not ( = ?auto_135162 ?auto_135165 ) ) ( not ( = ?auto_135163 ?auto_135165 ) ) ( not ( = ?auto_135164 ?auto_135165 ) ) ( ON ?auto_135163 ?auto_135164 ) ( ON-TABLE ?auto_135165 ) ( ON ?auto_135162 ?auto_135163 ) ( CLEAR ?auto_135160 ) ( ON ?auto_135161 ?auto_135162 ) ( CLEAR ?auto_135161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135165 ?auto_135164 ?auto_135163 ?auto_135162 )
      ( MAKE-7PILE ?auto_135158 ?auto_135159 ?auto_135160 ?auto_135161 ?auto_135162 ?auto_135163 ?auto_135164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135166 - BLOCK
      ?auto_135167 - BLOCK
      ?auto_135168 - BLOCK
      ?auto_135169 - BLOCK
      ?auto_135170 - BLOCK
      ?auto_135171 - BLOCK
      ?auto_135172 - BLOCK
    )
    :vars
    (
      ?auto_135173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135166 ) ( ON ?auto_135167 ?auto_135166 ) ( not ( = ?auto_135166 ?auto_135167 ) ) ( not ( = ?auto_135166 ?auto_135168 ) ) ( not ( = ?auto_135166 ?auto_135169 ) ) ( not ( = ?auto_135166 ?auto_135170 ) ) ( not ( = ?auto_135166 ?auto_135171 ) ) ( not ( = ?auto_135166 ?auto_135172 ) ) ( not ( = ?auto_135167 ?auto_135168 ) ) ( not ( = ?auto_135167 ?auto_135169 ) ) ( not ( = ?auto_135167 ?auto_135170 ) ) ( not ( = ?auto_135167 ?auto_135171 ) ) ( not ( = ?auto_135167 ?auto_135172 ) ) ( not ( = ?auto_135168 ?auto_135169 ) ) ( not ( = ?auto_135168 ?auto_135170 ) ) ( not ( = ?auto_135168 ?auto_135171 ) ) ( not ( = ?auto_135168 ?auto_135172 ) ) ( not ( = ?auto_135169 ?auto_135170 ) ) ( not ( = ?auto_135169 ?auto_135171 ) ) ( not ( = ?auto_135169 ?auto_135172 ) ) ( not ( = ?auto_135170 ?auto_135171 ) ) ( not ( = ?auto_135170 ?auto_135172 ) ) ( not ( = ?auto_135171 ?auto_135172 ) ) ( ON ?auto_135172 ?auto_135173 ) ( not ( = ?auto_135166 ?auto_135173 ) ) ( not ( = ?auto_135167 ?auto_135173 ) ) ( not ( = ?auto_135168 ?auto_135173 ) ) ( not ( = ?auto_135169 ?auto_135173 ) ) ( not ( = ?auto_135170 ?auto_135173 ) ) ( not ( = ?auto_135171 ?auto_135173 ) ) ( not ( = ?auto_135172 ?auto_135173 ) ) ( ON ?auto_135171 ?auto_135172 ) ( ON-TABLE ?auto_135173 ) ( ON ?auto_135170 ?auto_135171 ) ( ON ?auto_135169 ?auto_135170 ) ( CLEAR ?auto_135169 ) ( HOLDING ?auto_135168 ) ( CLEAR ?auto_135167 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135166 ?auto_135167 ?auto_135168 )
      ( MAKE-7PILE ?auto_135166 ?auto_135167 ?auto_135168 ?auto_135169 ?auto_135170 ?auto_135171 ?auto_135172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135174 - BLOCK
      ?auto_135175 - BLOCK
      ?auto_135176 - BLOCK
      ?auto_135177 - BLOCK
      ?auto_135178 - BLOCK
      ?auto_135179 - BLOCK
      ?auto_135180 - BLOCK
    )
    :vars
    (
      ?auto_135181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135174 ) ( ON ?auto_135175 ?auto_135174 ) ( not ( = ?auto_135174 ?auto_135175 ) ) ( not ( = ?auto_135174 ?auto_135176 ) ) ( not ( = ?auto_135174 ?auto_135177 ) ) ( not ( = ?auto_135174 ?auto_135178 ) ) ( not ( = ?auto_135174 ?auto_135179 ) ) ( not ( = ?auto_135174 ?auto_135180 ) ) ( not ( = ?auto_135175 ?auto_135176 ) ) ( not ( = ?auto_135175 ?auto_135177 ) ) ( not ( = ?auto_135175 ?auto_135178 ) ) ( not ( = ?auto_135175 ?auto_135179 ) ) ( not ( = ?auto_135175 ?auto_135180 ) ) ( not ( = ?auto_135176 ?auto_135177 ) ) ( not ( = ?auto_135176 ?auto_135178 ) ) ( not ( = ?auto_135176 ?auto_135179 ) ) ( not ( = ?auto_135176 ?auto_135180 ) ) ( not ( = ?auto_135177 ?auto_135178 ) ) ( not ( = ?auto_135177 ?auto_135179 ) ) ( not ( = ?auto_135177 ?auto_135180 ) ) ( not ( = ?auto_135178 ?auto_135179 ) ) ( not ( = ?auto_135178 ?auto_135180 ) ) ( not ( = ?auto_135179 ?auto_135180 ) ) ( ON ?auto_135180 ?auto_135181 ) ( not ( = ?auto_135174 ?auto_135181 ) ) ( not ( = ?auto_135175 ?auto_135181 ) ) ( not ( = ?auto_135176 ?auto_135181 ) ) ( not ( = ?auto_135177 ?auto_135181 ) ) ( not ( = ?auto_135178 ?auto_135181 ) ) ( not ( = ?auto_135179 ?auto_135181 ) ) ( not ( = ?auto_135180 ?auto_135181 ) ) ( ON ?auto_135179 ?auto_135180 ) ( ON-TABLE ?auto_135181 ) ( ON ?auto_135178 ?auto_135179 ) ( ON ?auto_135177 ?auto_135178 ) ( CLEAR ?auto_135175 ) ( ON ?auto_135176 ?auto_135177 ) ( CLEAR ?auto_135176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135181 ?auto_135180 ?auto_135179 ?auto_135178 ?auto_135177 )
      ( MAKE-7PILE ?auto_135174 ?auto_135175 ?auto_135176 ?auto_135177 ?auto_135178 ?auto_135179 ?auto_135180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135182 - BLOCK
      ?auto_135183 - BLOCK
      ?auto_135184 - BLOCK
      ?auto_135185 - BLOCK
      ?auto_135186 - BLOCK
      ?auto_135187 - BLOCK
      ?auto_135188 - BLOCK
    )
    :vars
    (
      ?auto_135189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135182 ) ( not ( = ?auto_135182 ?auto_135183 ) ) ( not ( = ?auto_135182 ?auto_135184 ) ) ( not ( = ?auto_135182 ?auto_135185 ) ) ( not ( = ?auto_135182 ?auto_135186 ) ) ( not ( = ?auto_135182 ?auto_135187 ) ) ( not ( = ?auto_135182 ?auto_135188 ) ) ( not ( = ?auto_135183 ?auto_135184 ) ) ( not ( = ?auto_135183 ?auto_135185 ) ) ( not ( = ?auto_135183 ?auto_135186 ) ) ( not ( = ?auto_135183 ?auto_135187 ) ) ( not ( = ?auto_135183 ?auto_135188 ) ) ( not ( = ?auto_135184 ?auto_135185 ) ) ( not ( = ?auto_135184 ?auto_135186 ) ) ( not ( = ?auto_135184 ?auto_135187 ) ) ( not ( = ?auto_135184 ?auto_135188 ) ) ( not ( = ?auto_135185 ?auto_135186 ) ) ( not ( = ?auto_135185 ?auto_135187 ) ) ( not ( = ?auto_135185 ?auto_135188 ) ) ( not ( = ?auto_135186 ?auto_135187 ) ) ( not ( = ?auto_135186 ?auto_135188 ) ) ( not ( = ?auto_135187 ?auto_135188 ) ) ( ON ?auto_135188 ?auto_135189 ) ( not ( = ?auto_135182 ?auto_135189 ) ) ( not ( = ?auto_135183 ?auto_135189 ) ) ( not ( = ?auto_135184 ?auto_135189 ) ) ( not ( = ?auto_135185 ?auto_135189 ) ) ( not ( = ?auto_135186 ?auto_135189 ) ) ( not ( = ?auto_135187 ?auto_135189 ) ) ( not ( = ?auto_135188 ?auto_135189 ) ) ( ON ?auto_135187 ?auto_135188 ) ( ON-TABLE ?auto_135189 ) ( ON ?auto_135186 ?auto_135187 ) ( ON ?auto_135185 ?auto_135186 ) ( ON ?auto_135184 ?auto_135185 ) ( CLEAR ?auto_135184 ) ( HOLDING ?auto_135183 ) ( CLEAR ?auto_135182 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135182 ?auto_135183 )
      ( MAKE-7PILE ?auto_135182 ?auto_135183 ?auto_135184 ?auto_135185 ?auto_135186 ?auto_135187 ?auto_135188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135190 - BLOCK
      ?auto_135191 - BLOCK
      ?auto_135192 - BLOCK
      ?auto_135193 - BLOCK
      ?auto_135194 - BLOCK
      ?auto_135195 - BLOCK
      ?auto_135196 - BLOCK
    )
    :vars
    (
      ?auto_135197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135190 ) ( not ( = ?auto_135190 ?auto_135191 ) ) ( not ( = ?auto_135190 ?auto_135192 ) ) ( not ( = ?auto_135190 ?auto_135193 ) ) ( not ( = ?auto_135190 ?auto_135194 ) ) ( not ( = ?auto_135190 ?auto_135195 ) ) ( not ( = ?auto_135190 ?auto_135196 ) ) ( not ( = ?auto_135191 ?auto_135192 ) ) ( not ( = ?auto_135191 ?auto_135193 ) ) ( not ( = ?auto_135191 ?auto_135194 ) ) ( not ( = ?auto_135191 ?auto_135195 ) ) ( not ( = ?auto_135191 ?auto_135196 ) ) ( not ( = ?auto_135192 ?auto_135193 ) ) ( not ( = ?auto_135192 ?auto_135194 ) ) ( not ( = ?auto_135192 ?auto_135195 ) ) ( not ( = ?auto_135192 ?auto_135196 ) ) ( not ( = ?auto_135193 ?auto_135194 ) ) ( not ( = ?auto_135193 ?auto_135195 ) ) ( not ( = ?auto_135193 ?auto_135196 ) ) ( not ( = ?auto_135194 ?auto_135195 ) ) ( not ( = ?auto_135194 ?auto_135196 ) ) ( not ( = ?auto_135195 ?auto_135196 ) ) ( ON ?auto_135196 ?auto_135197 ) ( not ( = ?auto_135190 ?auto_135197 ) ) ( not ( = ?auto_135191 ?auto_135197 ) ) ( not ( = ?auto_135192 ?auto_135197 ) ) ( not ( = ?auto_135193 ?auto_135197 ) ) ( not ( = ?auto_135194 ?auto_135197 ) ) ( not ( = ?auto_135195 ?auto_135197 ) ) ( not ( = ?auto_135196 ?auto_135197 ) ) ( ON ?auto_135195 ?auto_135196 ) ( ON-TABLE ?auto_135197 ) ( ON ?auto_135194 ?auto_135195 ) ( ON ?auto_135193 ?auto_135194 ) ( ON ?auto_135192 ?auto_135193 ) ( CLEAR ?auto_135190 ) ( ON ?auto_135191 ?auto_135192 ) ( CLEAR ?auto_135191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135197 ?auto_135196 ?auto_135195 ?auto_135194 ?auto_135193 ?auto_135192 )
      ( MAKE-7PILE ?auto_135190 ?auto_135191 ?auto_135192 ?auto_135193 ?auto_135194 ?auto_135195 ?auto_135196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135198 - BLOCK
      ?auto_135199 - BLOCK
      ?auto_135200 - BLOCK
      ?auto_135201 - BLOCK
      ?auto_135202 - BLOCK
      ?auto_135203 - BLOCK
      ?auto_135204 - BLOCK
    )
    :vars
    (
      ?auto_135205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135198 ?auto_135199 ) ) ( not ( = ?auto_135198 ?auto_135200 ) ) ( not ( = ?auto_135198 ?auto_135201 ) ) ( not ( = ?auto_135198 ?auto_135202 ) ) ( not ( = ?auto_135198 ?auto_135203 ) ) ( not ( = ?auto_135198 ?auto_135204 ) ) ( not ( = ?auto_135199 ?auto_135200 ) ) ( not ( = ?auto_135199 ?auto_135201 ) ) ( not ( = ?auto_135199 ?auto_135202 ) ) ( not ( = ?auto_135199 ?auto_135203 ) ) ( not ( = ?auto_135199 ?auto_135204 ) ) ( not ( = ?auto_135200 ?auto_135201 ) ) ( not ( = ?auto_135200 ?auto_135202 ) ) ( not ( = ?auto_135200 ?auto_135203 ) ) ( not ( = ?auto_135200 ?auto_135204 ) ) ( not ( = ?auto_135201 ?auto_135202 ) ) ( not ( = ?auto_135201 ?auto_135203 ) ) ( not ( = ?auto_135201 ?auto_135204 ) ) ( not ( = ?auto_135202 ?auto_135203 ) ) ( not ( = ?auto_135202 ?auto_135204 ) ) ( not ( = ?auto_135203 ?auto_135204 ) ) ( ON ?auto_135204 ?auto_135205 ) ( not ( = ?auto_135198 ?auto_135205 ) ) ( not ( = ?auto_135199 ?auto_135205 ) ) ( not ( = ?auto_135200 ?auto_135205 ) ) ( not ( = ?auto_135201 ?auto_135205 ) ) ( not ( = ?auto_135202 ?auto_135205 ) ) ( not ( = ?auto_135203 ?auto_135205 ) ) ( not ( = ?auto_135204 ?auto_135205 ) ) ( ON ?auto_135203 ?auto_135204 ) ( ON-TABLE ?auto_135205 ) ( ON ?auto_135202 ?auto_135203 ) ( ON ?auto_135201 ?auto_135202 ) ( ON ?auto_135200 ?auto_135201 ) ( ON ?auto_135199 ?auto_135200 ) ( CLEAR ?auto_135199 ) ( HOLDING ?auto_135198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135198 )
      ( MAKE-7PILE ?auto_135198 ?auto_135199 ?auto_135200 ?auto_135201 ?auto_135202 ?auto_135203 ?auto_135204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135206 - BLOCK
      ?auto_135207 - BLOCK
      ?auto_135208 - BLOCK
      ?auto_135209 - BLOCK
      ?auto_135210 - BLOCK
      ?auto_135211 - BLOCK
      ?auto_135212 - BLOCK
    )
    :vars
    (
      ?auto_135213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135206 ?auto_135207 ) ) ( not ( = ?auto_135206 ?auto_135208 ) ) ( not ( = ?auto_135206 ?auto_135209 ) ) ( not ( = ?auto_135206 ?auto_135210 ) ) ( not ( = ?auto_135206 ?auto_135211 ) ) ( not ( = ?auto_135206 ?auto_135212 ) ) ( not ( = ?auto_135207 ?auto_135208 ) ) ( not ( = ?auto_135207 ?auto_135209 ) ) ( not ( = ?auto_135207 ?auto_135210 ) ) ( not ( = ?auto_135207 ?auto_135211 ) ) ( not ( = ?auto_135207 ?auto_135212 ) ) ( not ( = ?auto_135208 ?auto_135209 ) ) ( not ( = ?auto_135208 ?auto_135210 ) ) ( not ( = ?auto_135208 ?auto_135211 ) ) ( not ( = ?auto_135208 ?auto_135212 ) ) ( not ( = ?auto_135209 ?auto_135210 ) ) ( not ( = ?auto_135209 ?auto_135211 ) ) ( not ( = ?auto_135209 ?auto_135212 ) ) ( not ( = ?auto_135210 ?auto_135211 ) ) ( not ( = ?auto_135210 ?auto_135212 ) ) ( not ( = ?auto_135211 ?auto_135212 ) ) ( ON ?auto_135212 ?auto_135213 ) ( not ( = ?auto_135206 ?auto_135213 ) ) ( not ( = ?auto_135207 ?auto_135213 ) ) ( not ( = ?auto_135208 ?auto_135213 ) ) ( not ( = ?auto_135209 ?auto_135213 ) ) ( not ( = ?auto_135210 ?auto_135213 ) ) ( not ( = ?auto_135211 ?auto_135213 ) ) ( not ( = ?auto_135212 ?auto_135213 ) ) ( ON ?auto_135211 ?auto_135212 ) ( ON-TABLE ?auto_135213 ) ( ON ?auto_135210 ?auto_135211 ) ( ON ?auto_135209 ?auto_135210 ) ( ON ?auto_135208 ?auto_135209 ) ( ON ?auto_135207 ?auto_135208 ) ( ON ?auto_135206 ?auto_135207 ) ( CLEAR ?auto_135206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135213 ?auto_135212 ?auto_135211 ?auto_135210 ?auto_135209 ?auto_135208 ?auto_135207 )
      ( MAKE-7PILE ?auto_135206 ?auto_135207 ?auto_135208 ?auto_135209 ?auto_135210 ?auto_135211 ?auto_135212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135221 - BLOCK
      ?auto_135222 - BLOCK
      ?auto_135223 - BLOCK
      ?auto_135224 - BLOCK
      ?auto_135225 - BLOCK
      ?auto_135226 - BLOCK
      ?auto_135227 - BLOCK
    )
    :vars
    (
      ?auto_135228 - BLOCK
      ?auto_135229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135221 ?auto_135222 ) ) ( not ( = ?auto_135221 ?auto_135223 ) ) ( not ( = ?auto_135221 ?auto_135224 ) ) ( not ( = ?auto_135221 ?auto_135225 ) ) ( not ( = ?auto_135221 ?auto_135226 ) ) ( not ( = ?auto_135221 ?auto_135227 ) ) ( not ( = ?auto_135222 ?auto_135223 ) ) ( not ( = ?auto_135222 ?auto_135224 ) ) ( not ( = ?auto_135222 ?auto_135225 ) ) ( not ( = ?auto_135222 ?auto_135226 ) ) ( not ( = ?auto_135222 ?auto_135227 ) ) ( not ( = ?auto_135223 ?auto_135224 ) ) ( not ( = ?auto_135223 ?auto_135225 ) ) ( not ( = ?auto_135223 ?auto_135226 ) ) ( not ( = ?auto_135223 ?auto_135227 ) ) ( not ( = ?auto_135224 ?auto_135225 ) ) ( not ( = ?auto_135224 ?auto_135226 ) ) ( not ( = ?auto_135224 ?auto_135227 ) ) ( not ( = ?auto_135225 ?auto_135226 ) ) ( not ( = ?auto_135225 ?auto_135227 ) ) ( not ( = ?auto_135226 ?auto_135227 ) ) ( ON ?auto_135227 ?auto_135228 ) ( not ( = ?auto_135221 ?auto_135228 ) ) ( not ( = ?auto_135222 ?auto_135228 ) ) ( not ( = ?auto_135223 ?auto_135228 ) ) ( not ( = ?auto_135224 ?auto_135228 ) ) ( not ( = ?auto_135225 ?auto_135228 ) ) ( not ( = ?auto_135226 ?auto_135228 ) ) ( not ( = ?auto_135227 ?auto_135228 ) ) ( ON ?auto_135226 ?auto_135227 ) ( ON-TABLE ?auto_135228 ) ( ON ?auto_135225 ?auto_135226 ) ( ON ?auto_135224 ?auto_135225 ) ( ON ?auto_135223 ?auto_135224 ) ( ON ?auto_135222 ?auto_135223 ) ( CLEAR ?auto_135222 ) ( ON ?auto_135221 ?auto_135229 ) ( CLEAR ?auto_135221 ) ( HAND-EMPTY ) ( not ( = ?auto_135221 ?auto_135229 ) ) ( not ( = ?auto_135222 ?auto_135229 ) ) ( not ( = ?auto_135223 ?auto_135229 ) ) ( not ( = ?auto_135224 ?auto_135229 ) ) ( not ( = ?auto_135225 ?auto_135229 ) ) ( not ( = ?auto_135226 ?auto_135229 ) ) ( not ( = ?auto_135227 ?auto_135229 ) ) ( not ( = ?auto_135228 ?auto_135229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135221 ?auto_135229 )
      ( MAKE-7PILE ?auto_135221 ?auto_135222 ?auto_135223 ?auto_135224 ?auto_135225 ?auto_135226 ?auto_135227 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135230 - BLOCK
      ?auto_135231 - BLOCK
      ?auto_135232 - BLOCK
      ?auto_135233 - BLOCK
      ?auto_135234 - BLOCK
      ?auto_135235 - BLOCK
      ?auto_135236 - BLOCK
    )
    :vars
    (
      ?auto_135237 - BLOCK
      ?auto_135238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135230 ?auto_135231 ) ) ( not ( = ?auto_135230 ?auto_135232 ) ) ( not ( = ?auto_135230 ?auto_135233 ) ) ( not ( = ?auto_135230 ?auto_135234 ) ) ( not ( = ?auto_135230 ?auto_135235 ) ) ( not ( = ?auto_135230 ?auto_135236 ) ) ( not ( = ?auto_135231 ?auto_135232 ) ) ( not ( = ?auto_135231 ?auto_135233 ) ) ( not ( = ?auto_135231 ?auto_135234 ) ) ( not ( = ?auto_135231 ?auto_135235 ) ) ( not ( = ?auto_135231 ?auto_135236 ) ) ( not ( = ?auto_135232 ?auto_135233 ) ) ( not ( = ?auto_135232 ?auto_135234 ) ) ( not ( = ?auto_135232 ?auto_135235 ) ) ( not ( = ?auto_135232 ?auto_135236 ) ) ( not ( = ?auto_135233 ?auto_135234 ) ) ( not ( = ?auto_135233 ?auto_135235 ) ) ( not ( = ?auto_135233 ?auto_135236 ) ) ( not ( = ?auto_135234 ?auto_135235 ) ) ( not ( = ?auto_135234 ?auto_135236 ) ) ( not ( = ?auto_135235 ?auto_135236 ) ) ( ON ?auto_135236 ?auto_135237 ) ( not ( = ?auto_135230 ?auto_135237 ) ) ( not ( = ?auto_135231 ?auto_135237 ) ) ( not ( = ?auto_135232 ?auto_135237 ) ) ( not ( = ?auto_135233 ?auto_135237 ) ) ( not ( = ?auto_135234 ?auto_135237 ) ) ( not ( = ?auto_135235 ?auto_135237 ) ) ( not ( = ?auto_135236 ?auto_135237 ) ) ( ON ?auto_135235 ?auto_135236 ) ( ON-TABLE ?auto_135237 ) ( ON ?auto_135234 ?auto_135235 ) ( ON ?auto_135233 ?auto_135234 ) ( ON ?auto_135232 ?auto_135233 ) ( ON ?auto_135230 ?auto_135238 ) ( CLEAR ?auto_135230 ) ( not ( = ?auto_135230 ?auto_135238 ) ) ( not ( = ?auto_135231 ?auto_135238 ) ) ( not ( = ?auto_135232 ?auto_135238 ) ) ( not ( = ?auto_135233 ?auto_135238 ) ) ( not ( = ?auto_135234 ?auto_135238 ) ) ( not ( = ?auto_135235 ?auto_135238 ) ) ( not ( = ?auto_135236 ?auto_135238 ) ) ( not ( = ?auto_135237 ?auto_135238 ) ) ( HOLDING ?auto_135231 ) ( CLEAR ?auto_135232 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135237 ?auto_135236 ?auto_135235 ?auto_135234 ?auto_135233 ?auto_135232 ?auto_135231 )
      ( MAKE-7PILE ?auto_135230 ?auto_135231 ?auto_135232 ?auto_135233 ?auto_135234 ?auto_135235 ?auto_135236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135239 - BLOCK
      ?auto_135240 - BLOCK
      ?auto_135241 - BLOCK
      ?auto_135242 - BLOCK
      ?auto_135243 - BLOCK
      ?auto_135244 - BLOCK
      ?auto_135245 - BLOCK
    )
    :vars
    (
      ?auto_135246 - BLOCK
      ?auto_135247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135239 ?auto_135240 ) ) ( not ( = ?auto_135239 ?auto_135241 ) ) ( not ( = ?auto_135239 ?auto_135242 ) ) ( not ( = ?auto_135239 ?auto_135243 ) ) ( not ( = ?auto_135239 ?auto_135244 ) ) ( not ( = ?auto_135239 ?auto_135245 ) ) ( not ( = ?auto_135240 ?auto_135241 ) ) ( not ( = ?auto_135240 ?auto_135242 ) ) ( not ( = ?auto_135240 ?auto_135243 ) ) ( not ( = ?auto_135240 ?auto_135244 ) ) ( not ( = ?auto_135240 ?auto_135245 ) ) ( not ( = ?auto_135241 ?auto_135242 ) ) ( not ( = ?auto_135241 ?auto_135243 ) ) ( not ( = ?auto_135241 ?auto_135244 ) ) ( not ( = ?auto_135241 ?auto_135245 ) ) ( not ( = ?auto_135242 ?auto_135243 ) ) ( not ( = ?auto_135242 ?auto_135244 ) ) ( not ( = ?auto_135242 ?auto_135245 ) ) ( not ( = ?auto_135243 ?auto_135244 ) ) ( not ( = ?auto_135243 ?auto_135245 ) ) ( not ( = ?auto_135244 ?auto_135245 ) ) ( ON ?auto_135245 ?auto_135246 ) ( not ( = ?auto_135239 ?auto_135246 ) ) ( not ( = ?auto_135240 ?auto_135246 ) ) ( not ( = ?auto_135241 ?auto_135246 ) ) ( not ( = ?auto_135242 ?auto_135246 ) ) ( not ( = ?auto_135243 ?auto_135246 ) ) ( not ( = ?auto_135244 ?auto_135246 ) ) ( not ( = ?auto_135245 ?auto_135246 ) ) ( ON ?auto_135244 ?auto_135245 ) ( ON-TABLE ?auto_135246 ) ( ON ?auto_135243 ?auto_135244 ) ( ON ?auto_135242 ?auto_135243 ) ( ON ?auto_135241 ?auto_135242 ) ( ON ?auto_135239 ?auto_135247 ) ( not ( = ?auto_135239 ?auto_135247 ) ) ( not ( = ?auto_135240 ?auto_135247 ) ) ( not ( = ?auto_135241 ?auto_135247 ) ) ( not ( = ?auto_135242 ?auto_135247 ) ) ( not ( = ?auto_135243 ?auto_135247 ) ) ( not ( = ?auto_135244 ?auto_135247 ) ) ( not ( = ?auto_135245 ?auto_135247 ) ) ( not ( = ?auto_135246 ?auto_135247 ) ) ( CLEAR ?auto_135241 ) ( ON ?auto_135240 ?auto_135239 ) ( CLEAR ?auto_135240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135247 ?auto_135239 )
      ( MAKE-7PILE ?auto_135239 ?auto_135240 ?auto_135241 ?auto_135242 ?auto_135243 ?auto_135244 ?auto_135245 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135248 - BLOCK
      ?auto_135249 - BLOCK
      ?auto_135250 - BLOCK
      ?auto_135251 - BLOCK
      ?auto_135252 - BLOCK
      ?auto_135253 - BLOCK
      ?auto_135254 - BLOCK
    )
    :vars
    (
      ?auto_135255 - BLOCK
      ?auto_135256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135248 ?auto_135249 ) ) ( not ( = ?auto_135248 ?auto_135250 ) ) ( not ( = ?auto_135248 ?auto_135251 ) ) ( not ( = ?auto_135248 ?auto_135252 ) ) ( not ( = ?auto_135248 ?auto_135253 ) ) ( not ( = ?auto_135248 ?auto_135254 ) ) ( not ( = ?auto_135249 ?auto_135250 ) ) ( not ( = ?auto_135249 ?auto_135251 ) ) ( not ( = ?auto_135249 ?auto_135252 ) ) ( not ( = ?auto_135249 ?auto_135253 ) ) ( not ( = ?auto_135249 ?auto_135254 ) ) ( not ( = ?auto_135250 ?auto_135251 ) ) ( not ( = ?auto_135250 ?auto_135252 ) ) ( not ( = ?auto_135250 ?auto_135253 ) ) ( not ( = ?auto_135250 ?auto_135254 ) ) ( not ( = ?auto_135251 ?auto_135252 ) ) ( not ( = ?auto_135251 ?auto_135253 ) ) ( not ( = ?auto_135251 ?auto_135254 ) ) ( not ( = ?auto_135252 ?auto_135253 ) ) ( not ( = ?auto_135252 ?auto_135254 ) ) ( not ( = ?auto_135253 ?auto_135254 ) ) ( ON ?auto_135254 ?auto_135255 ) ( not ( = ?auto_135248 ?auto_135255 ) ) ( not ( = ?auto_135249 ?auto_135255 ) ) ( not ( = ?auto_135250 ?auto_135255 ) ) ( not ( = ?auto_135251 ?auto_135255 ) ) ( not ( = ?auto_135252 ?auto_135255 ) ) ( not ( = ?auto_135253 ?auto_135255 ) ) ( not ( = ?auto_135254 ?auto_135255 ) ) ( ON ?auto_135253 ?auto_135254 ) ( ON-TABLE ?auto_135255 ) ( ON ?auto_135252 ?auto_135253 ) ( ON ?auto_135251 ?auto_135252 ) ( ON ?auto_135248 ?auto_135256 ) ( not ( = ?auto_135248 ?auto_135256 ) ) ( not ( = ?auto_135249 ?auto_135256 ) ) ( not ( = ?auto_135250 ?auto_135256 ) ) ( not ( = ?auto_135251 ?auto_135256 ) ) ( not ( = ?auto_135252 ?auto_135256 ) ) ( not ( = ?auto_135253 ?auto_135256 ) ) ( not ( = ?auto_135254 ?auto_135256 ) ) ( not ( = ?auto_135255 ?auto_135256 ) ) ( ON ?auto_135249 ?auto_135248 ) ( CLEAR ?auto_135249 ) ( ON-TABLE ?auto_135256 ) ( HOLDING ?auto_135250 ) ( CLEAR ?auto_135251 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135255 ?auto_135254 ?auto_135253 ?auto_135252 ?auto_135251 ?auto_135250 )
      ( MAKE-7PILE ?auto_135248 ?auto_135249 ?auto_135250 ?auto_135251 ?auto_135252 ?auto_135253 ?auto_135254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135257 - BLOCK
      ?auto_135258 - BLOCK
      ?auto_135259 - BLOCK
      ?auto_135260 - BLOCK
      ?auto_135261 - BLOCK
      ?auto_135262 - BLOCK
      ?auto_135263 - BLOCK
    )
    :vars
    (
      ?auto_135264 - BLOCK
      ?auto_135265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135257 ?auto_135258 ) ) ( not ( = ?auto_135257 ?auto_135259 ) ) ( not ( = ?auto_135257 ?auto_135260 ) ) ( not ( = ?auto_135257 ?auto_135261 ) ) ( not ( = ?auto_135257 ?auto_135262 ) ) ( not ( = ?auto_135257 ?auto_135263 ) ) ( not ( = ?auto_135258 ?auto_135259 ) ) ( not ( = ?auto_135258 ?auto_135260 ) ) ( not ( = ?auto_135258 ?auto_135261 ) ) ( not ( = ?auto_135258 ?auto_135262 ) ) ( not ( = ?auto_135258 ?auto_135263 ) ) ( not ( = ?auto_135259 ?auto_135260 ) ) ( not ( = ?auto_135259 ?auto_135261 ) ) ( not ( = ?auto_135259 ?auto_135262 ) ) ( not ( = ?auto_135259 ?auto_135263 ) ) ( not ( = ?auto_135260 ?auto_135261 ) ) ( not ( = ?auto_135260 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135263 ) ) ( not ( = ?auto_135261 ?auto_135262 ) ) ( not ( = ?auto_135261 ?auto_135263 ) ) ( not ( = ?auto_135262 ?auto_135263 ) ) ( ON ?auto_135263 ?auto_135264 ) ( not ( = ?auto_135257 ?auto_135264 ) ) ( not ( = ?auto_135258 ?auto_135264 ) ) ( not ( = ?auto_135259 ?auto_135264 ) ) ( not ( = ?auto_135260 ?auto_135264 ) ) ( not ( = ?auto_135261 ?auto_135264 ) ) ( not ( = ?auto_135262 ?auto_135264 ) ) ( not ( = ?auto_135263 ?auto_135264 ) ) ( ON ?auto_135262 ?auto_135263 ) ( ON-TABLE ?auto_135264 ) ( ON ?auto_135261 ?auto_135262 ) ( ON ?auto_135260 ?auto_135261 ) ( ON ?auto_135257 ?auto_135265 ) ( not ( = ?auto_135257 ?auto_135265 ) ) ( not ( = ?auto_135258 ?auto_135265 ) ) ( not ( = ?auto_135259 ?auto_135265 ) ) ( not ( = ?auto_135260 ?auto_135265 ) ) ( not ( = ?auto_135261 ?auto_135265 ) ) ( not ( = ?auto_135262 ?auto_135265 ) ) ( not ( = ?auto_135263 ?auto_135265 ) ) ( not ( = ?auto_135264 ?auto_135265 ) ) ( ON ?auto_135258 ?auto_135257 ) ( ON-TABLE ?auto_135265 ) ( CLEAR ?auto_135260 ) ( ON ?auto_135259 ?auto_135258 ) ( CLEAR ?auto_135259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135265 ?auto_135257 ?auto_135258 )
      ( MAKE-7PILE ?auto_135257 ?auto_135258 ?auto_135259 ?auto_135260 ?auto_135261 ?auto_135262 ?auto_135263 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135266 - BLOCK
      ?auto_135267 - BLOCK
      ?auto_135268 - BLOCK
      ?auto_135269 - BLOCK
      ?auto_135270 - BLOCK
      ?auto_135271 - BLOCK
      ?auto_135272 - BLOCK
    )
    :vars
    (
      ?auto_135273 - BLOCK
      ?auto_135274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135266 ?auto_135267 ) ) ( not ( = ?auto_135266 ?auto_135268 ) ) ( not ( = ?auto_135266 ?auto_135269 ) ) ( not ( = ?auto_135266 ?auto_135270 ) ) ( not ( = ?auto_135266 ?auto_135271 ) ) ( not ( = ?auto_135266 ?auto_135272 ) ) ( not ( = ?auto_135267 ?auto_135268 ) ) ( not ( = ?auto_135267 ?auto_135269 ) ) ( not ( = ?auto_135267 ?auto_135270 ) ) ( not ( = ?auto_135267 ?auto_135271 ) ) ( not ( = ?auto_135267 ?auto_135272 ) ) ( not ( = ?auto_135268 ?auto_135269 ) ) ( not ( = ?auto_135268 ?auto_135270 ) ) ( not ( = ?auto_135268 ?auto_135271 ) ) ( not ( = ?auto_135268 ?auto_135272 ) ) ( not ( = ?auto_135269 ?auto_135270 ) ) ( not ( = ?auto_135269 ?auto_135271 ) ) ( not ( = ?auto_135269 ?auto_135272 ) ) ( not ( = ?auto_135270 ?auto_135271 ) ) ( not ( = ?auto_135270 ?auto_135272 ) ) ( not ( = ?auto_135271 ?auto_135272 ) ) ( ON ?auto_135272 ?auto_135273 ) ( not ( = ?auto_135266 ?auto_135273 ) ) ( not ( = ?auto_135267 ?auto_135273 ) ) ( not ( = ?auto_135268 ?auto_135273 ) ) ( not ( = ?auto_135269 ?auto_135273 ) ) ( not ( = ?auto_135270 ?auto_135273 ) ) ( not ( = ?auto_135271 ?auto_135273 ) ) ( not ( = ?auto_135272 ?auto_135273 ) ) ( ON ?auto_135271 ?auto_135272 ) ( ON-TABLE ?auto_135273 ) ( ON ?auto_135270 ?auto_135271 ) ( ON ?auto_135266 ?auto_135274 ) ( not ( = ?auto_135266 ?auto_135274 ) ) ( not ( = ?auto_135267 ?auto_135274 ) ) ( not ( = ?auto_135268 ?auto_135274 ) ) ( not ( = ?auto_135269 ?auto_135274 ) ) ( not ( = ?auto_135270 ?auto_135274 ) ) ( not ( = ?auto_135271 ?auto_135274 ) ) ( not ( = ?auto_135272 ?auto_135274 ) ) ( not ( = ?auto_135273 ?auto_135274 ) ) ( ON ?auto_135267 ?auto_135266 ) ( ON-TABLE ?auto_135274 ) ( ON ?auto_135268 ?auto_135267 ) ( CLEAR ?auto_135268 ) ( HOLDING ?auto_135269 ) ( CLEAR ?auto_135270 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135273 ?auto_135272 ?auto_135271 ?auto_135270 ?auto_135269 )
      ( MAKE-7PILE ?auto_135266 ?auto_135267 ?auto_135268 ?auto_135269 ?auto_135270 ?auto_135271 ?auto_135272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135275 - BLOCK
      ?auto_135276 - BLOCK
      ?auto_135277 - BLOCK
      ?auto_135278 - BLOCK
      ?auto_135279 - BLOCK
      ?auto_135280 - BLOCK
      ?auto_135281 - BLOCK
    )
    :vars
    (
      ?auto_135282 - BLOCK
      ?auto_135283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135275 ?auto_135276 ) ) ( not ( = ?auto_135275 ?auto_135277 ) ) ( not ( = ?auto_135275 ?auto_135278 ) ) ( not ( = ?auto_135275 ?auto_135279 ) ) ( not ( = ?auto_135275 ?auto_135280 ) ) ( not ( = ?auto_135275 ?auto_135281 ) ) ( not ( = ?auto_135276 ?auto_135277 ) ) ( not ( = ?auto_135276 ?auto_135278 ) ) ( not ( = ?auto_135276 ?auto_135279 ) ) ( not ( = ?auto_135276 ?auto_135280 ) ) ( not ( = ?auto_135276 ?auto_135281 ) ) ( not ( = ?auto_135277 ?auto_135278 ) ) ( not ( = ?auto_135277 ?auto_135279 ) ) ( not ( = ?auto_135277 ?auto_135280 ) ) ( not ( = ?auto_135277 ?auto_135281 ) ) ( not ( = ?auto_135278 ?auto_135279 ) ) ( not ( = ?auto_135278 ?auto_135280 ) ) ( not ( = ?auto_135278 ?auto_135281 ) ) ( not ( = ?auto_135279 ?auto_135280 ) ) ( not ( = ?auto_135279 ?auto_135281 ) ) ( not ( = ?auto_135280 ?auto_135281 ) ) ( ON ?auto_135281 ?auto_135282 ) ( not ( = ?auto_135275 ?auto_135282 ) ) ( not ( = ?auto_135276 ?auto_135282 ) ) ( not ( = ?auto_135277 ?auto_135282 ) ) ( not ( = ?auto_135278 ?auto_135282 ) ) ( not ( = ?auto_135279 ?auto_135282 ) ) ( not ( = ?auto_135280 ?auto_135282 ) ) ( not ( = ?auto_135281 ?auto_135282 ) ) ( ON ?auto_135280 ?auto_135281 ) ( ON-TABLE ?auto_135282 ) ( ON ?auto_135279 ?auto_135280 ) ( ON ?auto_135275 ?auto_135283 ) ( not ( = ?auto_135275 ?auto_135283 ) ) ( not ( = ?auto_135276 ?auto_135283 ) ) ( not ( = ?auto_135277 ?auto_135283 ) ) ( not ( = ?auto_135278 ?auto_135283 ) ) ( not ( = ?auto_135279 ?auto_135283 ) ) ( not ( = ?auto_135280 ?auto_135283 ) ) ( not ( = ?auto_135281 ?auto_135283 ) ) ( not ( = ?auto_135282 ?auto_135283 ) ) ( ON ?auto_135276 ?auto_135275 ) ( ON-TABLE ?auto_135283 ) ( ON ?auto_135277 ?auto_135276 ) ( CLEAR ?auto_135279 ) ( ON ?auto_135278 ?auto_135277 ) ( CLEAR ?auto_135278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135283 ?auto_135275 ?auto_135276 ?auto_135277 )
      ( MAKE-7PILE ?auto_135275 ?auto_135276 ?auto_135277 ?auto_135278 ?auto_135279 ?auto_135280 ?auto_135281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135284 - BLOCK
      ?auto_135285 - BLOCK
      ?auto_135286 - BLOCK
      ?auto_135287 - BLOCK
      ?auto_135288 - BLOCK
      ?auto_135289 - BLOCK
      ?auto_135290 - BLOCK
    )
    :vars
    (
      ?auto_135292 - BLOCK
      ?auto_135291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135284 ?auto_135285 ) ) ( not ( = ?auto_135284 ?auto_135286 ) ) ( not ( = ?auto_135284 ?auto_135287 ) ) ( not ( = ?auto_135284 ?auto_135288 ) ) ( not ( = ?auto_135284 ?auto_135289 ) ) ( not ( = ?auto_135284 ?auto_135290 ) ) ( not ( = ?auto_135285 ?auto_135286 ) ) ( not ( = ?auto_135285 ?auto_135287 ) ) ( not ( = ?auto_135285 ?auto_135288 ) ) ( not ( = ?auto_135285 ?auto_135289 ) ) ( not ( = ?auto_135285 ?auto_135290 ) ) ( not ( = ?auto_135286 ?auto_135287 ) ) ( not ( = ?auto_135286 ?auto_135288 ) ) ( not ( = ?auto_135286 ?auto_135289 ) ) ( not ( = ?auto_135286 ?auto_135290 ) ) ( not ( = ?auto_135287 ?auto_135288 ) ) ( not ( = ?auto_135287 ?auto_135289 ) ) ( not ( = ?auto_135287 ?auto_135290 ) ) ( not ( = ?auto_135288 ?auto_135289 ) ) ( not ( = ?auto_135288 ?auto_135290 ) ) ( not ( = ?auto_135289 ?auto_135290 ) ) ( ON ?auto_135290 ?auto_135292 ) ( not ( = ?auto_135284 ?auto_135292 ) ) ( not ( = ?auto_135285 ?auto_135292 ) ) ( not ( = ?auto_135286 ?auto_135292 ) ) ( not ( = ?auto_135287 ?auto_135292 ) ) ( not ( = ?auto_135288 ?auto_135292 ) ) ( not ( = ?auto_135289 ?auto_135292 ) ) ( not ( = ?auto_135290 ?auto_135292 ) ) ( ON ?auto_135289 ?auto_135290 ) ( ON-TABLE ?auto_135292 ) ( ON ?auto_135284 ?auto_135291 ) ( not ( = ?auto_135284 ?auto_135291 ) ) ( not ( = ?auto_135285 ?auto_135291 ) ) ( not ( = ?auto_135286 ?auto_135291 ) ) ( not ( = ?auto_135287 ?auto_135291 ) ) ( not ( = ?auto_135288 ?auto_135291 ) ) ( not ( = ?auto_135289 ?auto_135291 ) ) ( not ( = ?auto_135290 ?auto_135291 ) ) ( not ( = ?auto_135292 ?auto_135291 ) ) ( ON ?auto_135285 ?auto_135284 ) ( ON-TABLE ?auto_135291 ) ( ON ?auto_135286 ?auto_135285 ) ( ON ?auto_135287 ?auto_135286 ) ( CLEAR ?auto_135287 ) ( HOLDING ?auto_135288 ) ( CLEAR ?auto_135289 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135292 ?auto_135290 ?auto_135289 ?auto_135288 )
      ( MAKE-7PILE ?auto_135284 ?auto_135285 ?auto_135286 ?auto_135287 ?auto_135288 ?auto_135289 ?auto_135290 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135293 - BLOCK
      ?auto_135294 - BLOCK
      ?auto_135295 - BLOCK
      ?auto_135296 - BLOCK
      ?auto_135297 - BLOCK
      ?auto_135298 - BLOCK
      ?auto_135299 - BLOCK
    )
    :vars
    (
      ?auto_135300 - BLOCK
      ?auto_135301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135293 ?auto_135294 ) ) ( not ( = ?auto_135293 ?auto_135295 ) ) ( not ( = ?auto_135293 ?auto_135296 ) ) ( not ( = ?auto_135293 ?auto_135297 ) ) ( not ( = ?auto_135293 ?auto_135298 ) ) ( not ( = ?auto_135293 ?auto_135299 ) ) ( not ( = ?auto_135294 ?auto_135295 ) ) ( not ( = ?auto_135294 ?auto_135296 ) ) ( not ( = ?auto_135294 ?auto_135297 ) ) ( not ( = ?auto_135294 ?auto_135298 ) ) ( not ( = ?auto_135294 ?auto_135299 ) ) ( not ( = ?auto_135295 ?auto_135296 ) ) ( not ( = ?auto_135295 ?auto_135297 ) ) ( not ( = ?auto_135295 ?auto_135298 ) ) ( not ( = ?auto_135295 ?auto_135299 ) ) ( not ( = ?auto_135296 ?auto_135297 ) ) ( not ( = ?auto_135296 ?auto_135298 ) ) ( not ( = ?auto_135296 ?auto_135299 ) ) ( not ( = ?auto_135297 ?auto_135298 ) ) ( not ( = ?auto_135297 ?auto_135299 ) ) ( not ( = ?auto_135298 ?auto_135299 ) ) ( ON ?auto_135299 ?auto_135300 ) ( not ( = ?auto_135293 ?auto_135300 ) ) ( not ( = ?auto_135294 ?auto_135300 ) ) ( not ( = ?auto_135295 ?auto_135300 ) ) ( not ( = ?auto_135296 ?auto_135300 ) ) ( not ( = ?auto_135297 ?auto_135300 ) ) ( not ( = ?auto_135298 ?auto_135300 ) ) ( not ( = ?auto_135299 ?auto_135300 ) ) ( ON ?auto_135298 ?auto_135299 ) ( ON-TABLE ?auto_135300 ) ( ON ?auto_135293 ?auto_135301 ) ( not ( = ?auto_135293 ?auto_135301 ) ) ( not ( = ?auto_135294 ?auto_135301 ) ) ( not ( = ?auto_135295 ?auto_135301 ) ) ( not ( = ?auto_135296 ?auto_135301 ) ) ( not ( = ?auto_135297 ?auto_135301 ) ) ( not ( = ?auto_135298 ?auto_135301 ) ) ( not ( = ?auto_135299 ?auto_135301 ) ) ( not ( = ?auto_135300 ?auto_135301 ) ) ( ON ?auto_135294 ?auto_135293 ) ( ON-TABLE ?auto_135301 ) ( ON ?auto_135295 ?auto_135294 ) ( ON ?auto_135296 ?auto_135295 ) ( CLEAR ?auto_135298 ) ( ON ?auto_135297 ?auto_135296 ) ( CLEAR ?auto_135297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135301 ?auto_135293 ?auto_135294 ?auto_135295 ?auto_135296 )
      ( MAKE-7PILE ?auto_135293 ?auto_135294 ?auto_135295 ?auto_135296 ?auto_135297 ?auto_135298 ?auto_135299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135302 - BLOCK
      ?auto_135303 - BLOCK
      ?auto_135304 - BLOCK
      ?auto_135305 - BLOCK
      ?auto_135306 - BLOCK
      ?auto_135307 - BLOCK
      ?auto_135308 - BLOCK
    )
    :vars
    (
      ?auto_135310 - BLOCK
      ?auto_135309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135302 ?auto_135303 ) ) ( not ( = ?auto_135302 ?auto_135304 ) ) ( not ( = ?auto_135302 ?auto_135305 ) ) ( not ( = ?auto_135302 ?auto_135306 ) ) ( not ( = ?auto_135302 ?auto_135307 ) ) ( not ( = ?auto_135302 ?auto_135308 ) ) ( not ( = ?auto_135303 ?auto_135304 ) ) ( not ( = ?auto_135303 ?auto_135305 ) ) ( not ( = ?auto_135303 ?auto_135306 ) ) ( not ( = ?auto_135303 ?auto_135307 ) ) ( not ( = ?auto_135303 ?auto_135308 ) ) ( not ( = ?auto_135304 ?auto_135305 ) ) ( not ( = ?auto_135304 ?auto_135306 ) ) ( not ( = ?auto_135304 ?auto_135307 ) ) ( not ( = ?auto_135304 ?auto_135308 ) ) ( not ( = ?auto_135305 ?auto_135306 ) ) ( not ( = ?auto_135305 ?auto_135307 ) ) ( not ( = ?auto_135305 ?auto_135308 ) ) ( not ( = ?auto_135306 ?auto_135307 ) ) ( not ( = ?auto_135306 ?auto_135308 ) ) ( not ( = ?auto_135307 ?auto_135308 ) ) ( ON ?auto_135308 ?auto_135310 ) ( not ( = ?auto_135302 ?auto_135310 ) ) ( not ( = ?auto_135303 ?auto_135310 ) ) ( not ( = ?auto_135304 ?auto_135310 ) ) ( not ( = ?auto_135305 ?auto_135310 ) ) ( not ( = ?auto_135306 ?auto_135310 ) ) ( not ( = ?auto_135307 ?auto_135310 ) ) ( not ( = ?auto_135308 ?auto_135310 ) ) ( ON-TABLE ?auto_135310 ) ( ON ?auto_135302 ?auto_135309 ) ( not ( = ?auto_135302 ?auto_135309 ) ) ( not ( = ?auto_135303 ?auto_135309 ) ) ( not ( = ?auto_135304 ?auto_135309 ) ) ( not ( = ?auto_135305 ?auto_135309 ) ) ( not ( = ?auto_135306 ?auto_135309 ) ) ( not ( = ?auto_135307 ?auto_135309 ) ) ( not ( = ?auto_135308 ?auto_135309 ) ) ( not ( = ?auto_135310 ?auto_135309 ) ) ( ON ?auto_135303 ?auto_135302 ) ( ON-TABLE ?auto_135309 ) ( ON ?auto_135304 ?auto_135303 ) ( ON ?auto_135305 ?auto_135304 ) ( ON ?auto_135306 ?auto_135305 ) ( CLEAR ?auto_135306 ) ( HOLDING ?auto_135307 ) ( CLEAR ?auto_135308 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135310 ?auto_135308 ?auto_135307 )
      ( MAKE-7PILE ?auto_135302 ?auto_135303 ?auto_135304 ?auto_135305 ?auto_135306 ?auto_135307 ?auto_135308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135311 - BLOCK
      ?auto_135312 - BLOCK
      ?auto_135313 - BLOCK
      ?auto_135314 - BLOCK
      ?auto_135315 - BLOCK
      ?auto_135316 - BLOCK
      ?auto_135317 - BLOCK
    )
    :vars
    (
      ?auto_135318 - BLOCK
      ?auto_135319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135311 ?auto_135312 ) ) ( not ( = ?auto_135311 ?auto_135313 ) ) ( not ( = ?auto_135311 ?auto_135314 ) ) ( not ( = ?auto_135311 ?auto_135315 ) ) ( not ( = ?auto_135311 ?auto_135316 ) ) ( not ( = ?auto_135311 ?auto_135317 ) ) ( not ( = ?auto_135312 ?auto_135313 ) ) ( not ( = ?auto_135312 ?auto_135314 ) ) ( not ( = ?auto_135312 ?auto_135315 ) ) ( not ( = ?auto_135312 ?auto_135316 ) ) ( not ( = ?auto_135312 ?auto_135317 ) ) ( not ( = ?auto_135313 ?auto_135314 ) ) ( not ( = ?auto_135313 ?auto_135315 ) ) ( not ( = ?auto_135313 ?auto_135316 ) ) ( not ( = ?auto_135313 ?auto_135317 ) ) ( not ( = ?auto_135314 ?auto_135315 ) ) ( not ( = ?auto_135314 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135317 ) ) ( not ( = ?auto_135315 ?auto_135316 ) ) ( not ( = ?auto_135315 ?auto_135317 ) ) ( not ( = ?auto_135316 ?auto_135317 ) ) ( ON ?auto_135317 ?auto_135318 ) ( not ( = ?auto_135311 ?auto_135318 ) ) ( not ( = ?auto_135312 ?auto_135318 ) ) ( not ( = ?auto_135313 ?auto_135318 ) ) ( not ( = ?auto_135314 ?auto_135318 ) ) ( not ( = ?auto_135315 ?auto_135318 ) ) ( not ( = ?auto_135316 ?auto_135318 ) ) ( not ( = ?auto_135317 ?auto_135318 ) ) ( ON-TABLE ?auto_135318 ) ( ON ?auto_135311 ?auto_135319 ) ( not ( = ?auto_135311 ?auto_135319 ) ) ( not ( = ?auto_135312 ?auto_135319 ) ) ( not ( = ?auto_135313 ?auto_135319 ) ) ( not ( = ?auto_135314 ?auto_135319 ) ) ( not ( = ?auto_135315 ?auto_135319 ) ) ( not ( = ?auto_135316 ?auto_135319 ) ) ( not ( = ?auto_135317 ?auto_135319 ) ) ( not ( = ?auto_135318 ?auto_135319 ) ) ( ON ?auto_135312 ?auto_135311 ) ( ON-TABLE ?auto_135319 ) ( ON ?auto_135313 ?auto_135312 ) ( ON ?auto_135314 ?auto_135313 ) ( ON ?auto_135315 ?auto_135314 ) ( CLEAR ?auto_135317 ) ( ON ?auto_135316 ?auto_135315 ) ( CLEAR ?auto_135316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135319 ?auto_135311 ?auto_135312 ?auto_135313 ?auto_135314 ?auto_135315 )
      ( MAKE-7PILE ?auto_135311 ?auto_135312 ?auto_135313 ?auto_135314 ?auto_135315 ?auto_135316 ?auto_135317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135320 - BLOCK
      ?auto_135321 - BLOCK
      ?auto_135322 - BLOCK
      ?auto_135323 - BLOCK
      ?auto_135324 - BLOCK
      ?auto_135325 - BLOCK
      ?auto_135326 - BLOCK
    )
    :vars
    (
      ?auto_135327 - BLOCK
      ?auto_135328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135320 ?auto_135321 ) ) ( not ( = ?auto_135320 ?auto_135322 ) ) ( not ( = ?auto_135320 ?auto_135323 ) ) ( not ( = ?auto_135320 ?auto_135324 ) ) ( not ( = ?auto_135320 ?auto_135325 ) ) ( not ( = ?auto_135320 ?auto_135326 ) ) ( not ( = ?auto_135321 ?auto_135322 ) ) ( not ( = ?auto_135321 ?auto_135323 ) ) ( not ( = ?auto_135321 ?auto_135324 ) ) ( not ( = ?auto_135321 ?auto_135325 ) ) ( not ( = ?auto_135321 ?auto_135326 ) ) ( not ( = ?auto_135322 ?auto_135323 ) ) ( not ( = ?auto_135322 ?auto_135324 ) ) ( not ( = ?auto_135322 ?auto_135325 ) ) ( not ( = ?auto_135322 ?auto_135326 ) ) ( not ( = ?auto_135323 ?auto_135324 ) ) ( not ( = ?auto_135323 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135326 ) ) ( not ( = ?auto_135324 ?auto_135325 ) ) ( not ( = ?auto_135324 ?auto_135326 ) ) ( not ( = ?auto_135325 ?auto_135326 ) ) ( not ( = ?auto_135320 ?auto_135327 ) ) ( not ( = ?auto_135321 ?auto_135327 ) ) ( not ( = ?auto_135322 ?auto_135327 ) ) ( not ( = ?auto_135323 ?auto_135327 ) ) ( not ( = ?auto_135324 ?auto_135327 ) ) ( not ( = ?auto_135325 ?auto_135327 ) ) ( not ( = ?auto_135326 ?auto_135327 ) ) ( ON-TABLE ?auto_135327 ) ( ON ?auto_135320 ?auto_135328 ) ( not ( = ?auto_135320 ?auto_135328 ) ) ( not ( = ?auto_135321 ?auto_135328 ) ) ( not ( = ?auto_135322 ?auto_135328 ) ) ( not ( = ?auto_135323 ?auto_135328 ) ) ( not ( = ?auto_135324 ?auto_135328 ) ) ( not ( = ?auto_135325 ?auto_135328 ) ) ( not ( = ?auto_135326 ?auto_135328 ) ) ( not ( = ?auto_135327 ?auto_135328 ) ) ( ON ?auto_135321 ?auto_135320 ) ( ON-TABLE ?auto_135328 ) ( ON ?auto_135322 ?auto_135321 ) ( ON ?auto_135323 ?auto_135322 ) ( ON ?auto_135324 ?auto_135323 ) ( ON ?auto_135325 ?auto_135324 ) ( CLEAR ?auto_135325 ) ( HOLDING ?auto_135326 ) ( CLEAR ?auto_135327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135327 ?auto_135326 )
      ( MAKE-7PILE ?auto_135320 ?auto_135321 ?auto_135322 ?auto_135323 ?auto_135324 ?auto_135325 ?auto_135326 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135329 - BLOCK
      ?auto_135330 - BLOCK
      ?auto_135331 - BLOCK
      ?auto_135332 - BLOCK
      ?auto_135333 - BLOCK
      ?auto_135334 - BLOCK
      ?auto_135335 - BLOCK
    )
    :vars
    (
      ?auto_135336 - BLOCK
      ?auto_135337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135329 ?auto_135330 ) ) ( not ( = ?auto_135329 ?auto_135331 ) ) ( not ( = ?auto_135329 ?auto_135332 ) ) ( not ( = ?auto_135329 ?auto_135333 ) ) ( not ( = ?auto_135329 ?auto_135334 ) ) ( not ( = ?auto_135329 ?auto_135335 ) ) ( not ( = ?auto_135330 ?auto_135331 ) ) ( not ( = ?auto_135330 ?auto_135332 ) ) ( not ( = ?auto_135330 ?auto_135333 ) ) ( not ( = ?auto_135330 ?auto_135334 ) ) ( not ( = ?auto_135330 ?auto_135335 ) ) ( not ( = ?auto_135331 ?auto_135332 ) ) ( not ( = ?auto_135331 ?auto_135333 ) ) ( not ( = ?auto_135331 ?auto_135334 ) ) ( not ( = ?auto_135331 ?auto_135335 ) ) ( not ( = ?auto_135332 ?auto_135333 ) ) ( not ( = ?auto_135332 ?auto_135334 ) ) ( not ( = ?auto_135332 ?auto_135335 ) ) ( not ( = ?auto_135333 ?auto_135334 ) ) ( not ( = ?auto_135333 ?auto_135335 ) ) ( not ( = ?auto_135334 ?auto_135335 ) ) ( not ( = ?auto_135329 ?auto_135336 ) ) ( not ( = ?auto_135330 ?auto_135336 ) ) ( not ( = ?auto_135331 ?auto_135336 ) ) ( not ( = ?auto_135332 ?auto_135336 ) ) ( not ( = ?auto_135333 ?auto_135336 ) ) ( not ( = ?auto_135334 ?auto_135336 ) ) ( not ( = ?auto_135335 ?auto_135336 ) ) ( ON-TABLE ?auto_135336 ) ( ON ?auto_135329 ?auto_135337 ) ( not ( = ?auto_135329 ?auto_135337 ) ) ( not ( = ?auto_135330 ?auto_135337 ) ) ( not ( = ?auto_135331 ?auto_135337 ) ) ( not ( = ?auto_135332 ?auto_135337 ) ) ( not ( = ?auto_135333 ?auto_135337 ) ) ( not ( = ?auto_135334 ?auto_135337 ) ) ( not ( = ?auto_135335 ?auto_135337 ) ) ( not ( = ?auto_135336 ?auto_135337 ) ) ( ON ?auto_135330 ?auto_135329 ) ( ON-TABLE ?auto_135337 ) ( ON ?auto_135331 ?auto_135330 ) ( ON ?auto_135332 ?auto_135331 ) ( ON ?auto_135333 ?auto_135332 ) ( ON ?auto_135334 ?auto_135333 ) ( CLEAR ?auto_135336 ) ( ON ?auto_135335 ?auto_135334 ) ( CLEAR ?auto_135335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135337 ?auto_135329 ?auto_135330 ?auto_135331 ?auto_135332 ?auto_135333 ?auto_135334 )
      ( MAKE-7PILE ?auto_135329 ?auto_135330 ?auto_135331 ?auto_135332 ?auto_135333 ?auto_135334 ?auto_135335 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135338 - BLOCK
      ?auto_135339 - BLOCK
      ?auto_135340 - BLOCK
      ?auto_135341 - BLOCK
      ?auto_135342 - BLOCK
      ?auto_135343 - BLOCK
      ?auto_135344 - BLOCK
    )
    :vars
    (
      ?auto_135346 - BLOCK
      ?auto_135345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135338 ?auto_135339 ) ) ( not ( = ?auto_135338 ?auto_135340 ) ) ( not ( = ?auto_135338 ?auto_135341 ) ) ( not ( = ?auto_135338 ?auto_135342 ) ) ( not ( = ?auto_135338 ?auto_135343 ) ) ( not ( = ?auto_135338 ?auto_135344 ) ) ( not ( = ?auto_135339 ?auto_135340 ) ) ( not ( = ?auto_135339 ?auto_135341 ) ) ( not ( = ?auto_135339 ?auto_135342 ) ) ( not ( = ?auto_135339 ?auto_135343 ) ) ( not ( = ?auto_135339 ?auto_135344 ) ) ( not ( = ?auto_135340 ?auto_135341 ) ) ( not ( = ?auto_135340 ?auto_135342 ) ) ( not ( = ?auto_135340 ?auto_135343 ) ) ( not ( = ?auto_135340 ?auto_135344 ) ) ( not ( = ?auto_135341 ?auto_135342 ) ) ( not ( = ?auto_135341 ?auto_135343 ) ) ( not ( = ?auto_135341 ?auto_135344 ) ) ( not ( = ?auto_135342 ?auto_135343 ) ) ( not ( = ?auto_135342 ?auto_135344 ) ) ( not ( = ?auto_135343 ?auto_135344 ) ) ( not ( = ?auto_135338 ?auto_135346 ) ) ( not ( = ?auto_135339 ?auto_135346 ) ) ( not ( = ?auto_135340 ?auto_135346 ) ) ( not ( = ?auto_135341 ?auto_135346 ) ) ( not ( = ?auto_135342 ?auto_135346 ) ) ( not ( = ?auto_135343 ?auto_135346 ) ) ( not ( = ?auto_135344 ?auto_135346 ) ) ( ON ?auto_135338 ?auto_135345 ) ( not ( = ?auto_135338 ?auto_135345 ) ) ( not ( = ?auto_135339 ?auto_135345 ) ) ( not ( = ?auto_135340 ?auto_135345 ) ) ( not ( = ?auto_135341 ?auto_135345 ) ) ( not ( = ?auto_135342 ?auto_135345 ) ) ( not ( = ?auto_135343 ?auto_135345 ) ) ( not ( = ?auto_135344 ?auto_135345 ) ) ( not ( = ?auto_135346 ?auto_135345 ) ) ( ON ?auto_135339 ?auto_135338 ) ( ON-TABLE ?auto_135345 ) ( ON ?auto_135340 ?auto_135339 ) ( ON ?auto_135341 ?auto_135340 ) ( ON ?auto_135342 ?auto_135341 ) ( ON ?auto_135343 ?auto_135342 ) ( ON ?auto_135344 ?auto_135343 ) ( CLEAR ?auto_135344 ) ( HOLDING ?auto_135346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135346 )
      ( MAKE-7PILE ?auto_135338 ?auto_135339 ?auto_135340 ?auto_135341 ?auto_135342 ?auto_135343 ?auto_135344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135347 - BLOCK
      ?auto_135348 - BLOCK
      ?auto_135349 - BLOCK
      ?auto_135350 - BLOCK
      ?auto_135351 - BLOCK
      ?auto_135352 - BLOCK
      ?auto_135353 - BLOCK
    )
    :vars
    (
      ?auto_135355 - BLOCK
      ?auto_135354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135347 ?auto_135348 ) ) ( not ( = ?auto_135347 ?auto_135349 ) ) ( not ( = ?auto_135347 ?auto_135350 ) ) ( not ( = ?auto_135347 ?auto_135351 ) ) ( not ( = ?auto_135347 ?auto_135352 ) ) ( not ( = ?auto_135347 ?auto_135353 ) ) ( not ( = ?auto_135348 ?auto_135349 ) ) ( not ( = ?auto_135348 ?auto_135350 ) ) ( not ( = ?auto_135348 ?auto_135351 ) ) ( not ( = ?auto_135348 ?auto_135352 ) ) ( not ( = ?auto_135348 ?auto_135353 ) ) ( not ( = ?auto_135349 ?auto_135350 ) ) ( not ( = ?auto_135349 ?auto_135351 ) ) ( not ( = ?auto_135349 ?auto_135352 ) ) ( not ( = ?auto_135349 ?auto_135353 ) ) ( not ( = ?auto_135350 ?auto_135351 ) ) ( not ( = ?auto_135350 ?auto_135352 ) ) ( not ( = ?auto_135350 ?auto_135353 ) ) ( not ( = ?auto_135351 ?auto_135352 ) ) ( not ( = ?auto_135351 ?auto_135353 ) ) ( not ( = ?auto_135352 ?auto_135353 ) ) ( not ( = ?auto_135347 ?auto_135355 ) ) ( not ( = ?auto_135348 ?auto_135355 ) ) ( not ( = ?auto_135349 ?auto_135355 ) ) ( not ( = ?auto_135350 ?auto_135355 ) ) ( not ( = ?auto_135351 ?auto_135355 ) ) ( not ( = ?auto_135352 ?auto_135355 ) ) ( not ( = ?auto_135353 ?auto_135355 ) ) ( ON ?auto_135347 ?auto_135354 ) ( not ( = ?auto_135347 ?auto_135354 ) ) ( not ( = ?auto_135348 ?auto_135354 ) ) ( not ( = ?auto_135349 ?auto_135354 ) ) ( not ( = ?auto_135350 ?auto_135354 ) ) ( not ( = ?auto_135351 ?auto_135354 ) ) ( not ( = ?auto_135352 ?auto_135354 ) ) ( not ( = ?auto_135353 ?auto_135354 ) ) ( not ( = ?auto_135355 ?auto_135354 ) ) ( ON ?auto_135348 ?auto_135347 ) ( ON-TABLE ?auto_135354 ) ( ON ?auto_135349 ?auto_135348 ) ( ON ?auto_135350 ?auto_135349 ) ( ON ?auto_135351 ?auto_135350 ) ( ON ?auto_135352 ?auto_135351 ) ( ON ?auto_135353 ?auto_135352 ) ( ON ?auto_135355 ?auto_135353 ) ( CLEAR ?auto_135355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135354 ?auto_135347 ?auto_135348 ?auto_135349 ?auto_135350 ?auto_135351 ?auto_135352 ?auto_135353 )
      ( MAKE-7PILE ?auto_135347 ?auto_135348 ?auto_135349 ?auto_135350 ?auto_135351 ?auto_135352 ?auto_135353 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135372 - BLOCK
      ?auto_135373 - BLOCK
      ?auto_135374 - BLOCK
      ?auto_135375 - BLOCK
      ?auto_135376 - BLOCK
      ?auto_135377 - BLOCK
      ?auto_135378 - BLOCK
      ?auto_135379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135378 ) ( ON-TABLE ?auto_135372 ) ( ON ?auto_135373 ?auto_135372 ) ( ON ?auto_135374 ?auto_135373 ) ( ON ?auto_135375 ?auto_135374 ) ( ON ?auto_135376 ?auto_135375 ) ( ON ?auto_135377 ?auto_135376 ) ( ON ?auto_135378 ?auto_135377 ) ( not ( = ?auto_135372 ?auto_135373 ) ) ( not ( = ?auto_135372 ?auto_135374 ) ) ( not ( = ?auto_135372 ?auto_135375 ) ) ( not ( = ?auto_135372 ?auto_135376 ) ) ( not ( = ?auto_135372 ?auto_135377 ) ) ( not ( = ?auto_135372 ?auto_135378 ) ) ( not ( = ?auto_135372 ?auto_135379 ) ) ( not ( = ?auto_135373 ?auto_135374 ) ) ( not ( = ?auto_135373 ?auto_135375 ) ) ( not ( = ?auto_135373 ?auto_135376 ) ) ( not ( = ?auto_135373 ?auto_135377 ) ) ( not ( = ?auto_135373 ?auto_135378 ) ) ( not ( = ?auto_135373 ?auto_135379 ) ) ( not ( = ?auto_135374 ?auto_135375 ) ) ( not ( = ?auto_135374 ?auto_135376 ) ) ( not ( = ?auto_135374 ?auto_135377 ) ) ( not ( = ?auto_135374 ?auto_135378 ) ) ( not ( = ?auto_135374 ?auto_135379 ) ) ( not ( = ?auto_135375 ?auto_135376 ) ) ( not ( = ?auto_135375 ?auto_135377 ) ) ( not ( = ?auto_135375 ?auto_135378 ) ) ( not ( = ?auto_135375 ?auto_135379 ) ) ( not ( = ?auto_135376 ?auto_135377 ) ) ( not ( = ?auto_135376 ?auto_135378 ) ) ( not ( = ?auto_135376 ?auto_135379 ) ) ( not ( = ?auto_135377 ?auto_135378 ) ) ( not ( = ?auto_135377 ?auto_135379 ) ) ( not ( = ?auto_135378 ?auto_135379 ) ) ( ON-TABLE ?auto_135379 ) ( CLEAR ?auto_135379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_135379 )
      ( MAKE-8PILE ?auto_135372 ?auto_135373 ?auto_135374 ?auto_135375 ?auto_135376 ?auto_135377 ?auto_135378 ?auto_135379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135380 - BLOCK
      ?auto_135381 - BLOCK
      ?auto_135382 - BLOCK
      ?auto_135383 - BLOCK
      ?auto_135384 - BLOCK
      ?auto_135385 - BLOCK
      ?auto_135386 - BLOCK
      ?auto_135387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135380 ) ( ON ?auto_135381 ?auto_135380 ) ( ON ?auto_135382 ?auto_135381 ) ( ON ?auto_135383 ?auto_135382 ) ( ON ?auto_135384 ?auto_135383 ) ( ON ?auto_135385 ?auto_135384 ) ( not ( = ?auto_135380 ?auto_135381 ) ) ( not ( = ?auto_135380 ?auto_135382 ) ) ( not ( = ?auto_135380 ?auto_135383 ) ) ( not ( = ?auto_135380 ?auto_135384 ) ) ( not ( = ?auto_135380 ?auto_135385 ) ) ( not ( = ?auto_135380 ?auto_135386 ) ) ( not ( = ?auto_135380 ?auto_135387 ) ) ( not ( = ?auto_135381 ?auto_135382 ) ) ( not ( = ?auto_135381 ?auto_135383 ) ) ( not ( = ?auto_135381 ?auto_135384 ) ) ( not ( = ?auto_135381 ?auto_135385 ) ) ( not ( = ?auto_135381 ?auto_135386 ) ) ( not ( = ?auto_135381 ?auto_135387 ) ) ( not ( = ?auto_135382 ?auto_135383 ) ) ( not ( = ?auto_135382 ?auto_135384 ) ) ( not ( = ?auto_135382 ?auto_135385 ) ) ( not ( = ?auto_135382 ?auto_135386 ) ) ( not ( = ?auto_135382 ?auto_135387 ) ) ( not ( = ?auto_135383 ?auto_135384 ) ) ( not ( = ?auto_135383 ?auto_135385 ) ) ( not ( = ?auto_135383 ?auto_135386 ) ) ( not ( = ?auto_135383 ?auto_135387 ) ) ( not ( = ?auto_135384 ?auto_135385 ) ) ( not ( = ?auto_135384 ?auto_135386 ) ) ( not ( = ?auto_135384 ?auto_135387 ) ) ( not ( = ?auto_135385 ?auto_135386 ) ) ( not ( = ?auto_135385 ?auto_135387 ) ) ( not ( = ?auto_135386 ?auto_135387 ) ) ( ON-TABLE ?auto_135387 ) ( CLEAR ?auto_135387 ) ( HOLDING ?auto_135386 ) ( CLEAR ?auto_135385 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135380 ?auto_135381 ?auto_135382 ?auto_135383 ?auto_135384 ?auto_135385 ?auto_135386 )
      ( MAKE-8PILE ?auto_135380 ?auto_135381 ?auto_135382 ?auto_135383 ?auto_135384 ?auto_135385 ?auto_135386 ?auto_135387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135388 - BLOCK
      ?auto_135389 - BLOCK
      ?auto_135390 - BLOCK
      ?auto_135391 - BLOCK
      ?auto_135392 - BLOCK
      ?auto_135393 - BLOCK
      ?auto_135394 - BLOCK
      ?auto_135395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135388 ) ( ON ?auto_135389 ?auto_135388 ) ( ON ?auto_135390 ?auto_135389 ) ( ON ?auto_135391 ?auto_135390 ) ( ON ?auto_135392 ?auto_135391 ) ( ON ?auto_135393 ?auto_135392 ) ( not ( = ?auto_135388 ?auto_135389 ) ) ( not ( = ?auto_135388 ?auto_135390 ) ) ( not ( = ?auto_135388 ?auto_135391 ) ) ( not ( = ?auto_135388 ?auto_135392 ) ) ( not ( = ?auto_135388 ?auto_135393 ) ) ( not ( = ?auto_135388 ?auto_135394 ) ) ( not ( = ?auto_135388 ?auto_135395 ) ) ( not ( = ?auto_135389 ?auto_135390 ) ) ( not ( = ?auto_135389 ?auto_135391 ) ) ( not ( = ?auto_135389 ?auto_135392 ) ) ( not ( = ?auto_135389 ?auto_135393 ) ) ( not ( = ?auto_135389 ?auto_135394 ) ) ( not ( = ?auto_135389 ?auto_135395 ) ) ( not ( = ?auto_135390 ?auto_135391 ) ) ( not ( = ?auto_135390 ?auto_135392 ) ) ( not ( = ?auto_135390 ?auto_135393 ) ) ( not ( = ?auto_135390 ?auto_135394 ) ) ( not ( = ?auto_135390 ?auto_135395 ) ) ( not ( = ?auto_135391 ?auto_135392 ) ) ( not ( = ?auto_135391 ?auto_135393 ) ) ( not ( = ?auto_135391 ?auto_135394 ) ) ( not ( = ?auto_135391 ?auto_135395 ) ) ( not ( = ?auto_135392 ?auto_135393 ) ) ( not ( = ?auto_135392 ?auto_135394 ) ) ( not ( = ?auto_135392 ?auto_135395 ) ) ( not ( = ?auto_135393 ?auto_135394 ) ) ( not ( = ?auto_135393 ?auto_135395 ) ) ( not ( = ?auto_135394 ?auto_135395 ) ) ( ON-TABLE ?auto_135395 ) ( CLEAR ?auto_135393 ) ( ON ?auto_135394 ?auto_135395 ) ( CLEAR ?auto_135394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135395 )
      ( MAKE-8PILE ?auto_135388 ?auto_135389 ?auto_135390 ?auto_135391 ?auto_135392 ?auto_135393 ?auto_135394 ?auto_135395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135396 - BLOCK
      ?auto_135397 - BLOCK
      ?auto_135398 - BLOCK
      ?auto_135399 - BLOCK
      ?auto_135400 - BLOCK
      ?auto_135401 - BLOCK
      ?auto_135402 - BLOCK
      ?auto_135403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135396 ) ( ON ?auto_135397 ?auto_135396 ) ( ON ?auto_135398 ?auto_135397 ) ( ON ?auto_135399 ?auto_135398 ) ( ON ?auto_135400 ?auto_135399 ) ( not ( = ?auto_135396 ?auto_135397 ) ) ( not ( = ?auto_135396 ?auto_135398 ) ) ( not ( = ?auto_135396 ?auto_135399 ) ) ( not ( = ?auto_135396 ?auto_135400 ) ) ( not ( = ?auto_135396 ?auto_135401 ) ) ( not ( = ?auto_135396 ?auto_135402 ) ) ( not ( = ?auto_135396 ?auto_135403 ) ) ( not ( = ?auto_135397 ?auto_135398 ) ) ( not ( = ?auto_135397 ?auto_135399 ) ) ( not ( = ?auto_135397 ?auto_135400 ) ) ( not ( = ?auto_135397 ?auto_135401 ) ) ( not ( = ?auto_135397 ?auto_135402 ) ) ( not ( = ?auto_135397 ?auto_135403 ) ) ( not ( = ?auto_135398 ?auto_135399 ) ) ( not ( = ?auto_135398 ?auto_135400 ) ) ( not ( = ?auto_135398 ?auto_135401 ) ) ( not ( = ?auto_135398 ?auto_135402 ) ) ( not ( = ?auto_135398 ?auto_135403 ) ) ( not ( = ?auto_135399 ?auto_135400 ) ) ( not ( = ?auto_135399 ?auto_135401 ) ) ( not ( = ?auto_135399 ?auto_135402 ) ) ( not ( = ?auto_135399 ?auto_135403 ) ) ( not ( = ?auto_135400 ?auto_135401 ) ) ( not ( = ?auto_135400 ?auto_135402 ) ) ( not ( = ?auto_135400 ?auto_135403 ) ) ( not ( = ?auto_135401 ?auto_135402 ) ) ( not ( = ?auto_135401 ?auto_135403 ) ) ( not ( = ?auto_135402 ?auto_135403 ) ) ( ON-TABLE ?auto_135403 ) ( ON ?auto_135402 ?auto_135403 ) ( CLEAR ?auto_135402 ) ( HOLDING ?auto_135401 ) ( CLEAR ?auto_135400 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135396 ?auto_135397 ?auto_135398 ?auto_135399 ?auto_135400 ?auto_135401 )
      ( MAKE-8PILE ?auto_135396 ?auto_135397 ?auto_135398 ?auto_135399 ?auto_135400 ?auto_135401 ?auto_135402 ?auto_135403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135404 - BLOCK
      ?auto_135405 - BLOCK
      ?auto_135406 - BLOCK
      ?auto_135407 - BLOCK
      ?auto_135408 - BLOCK
      ?auto_135409 - BLOCK
      ?auto_135410 - BLOCK
      ?auto_135411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135404 ) ( ON ?auto_135405 ?auto_135404 ) ( ON ?auto_135406 ?auto_135405 ) ( ON ?auto_135407 ?auto_135406 ) ( ON ?auto_135408 ?auto_135407 ) ( not ( = ?auto_135404 ?auto_135405 ) ) ( not ( = ?auto_135404 ?auto_135406 ) ) ( not ( = ?auto_135404 ?auto_135407 ) ) ( not ( = ?auto_135404 ?auto_135408 ) ) ( not ( = ?auto_135404 ?auto_135409 ) ) ( not ( = ?auto_135404 ?auto_135410 ) ) ( not ( = ?auto_135404 ?auto_135411 ) ) ( not ( = ?auto_135405 ?auto_135406 ) ) ( not ( = ?auto_135405 ?auto_135407 ) ) ( not ( = ?auto_135405 ?auto_135408 ) ) ( not ( = ?auto_135405 ?auto_135409 ) ) ( not ( = ?auto_135405 ?auto_135410 ) ) ( not ( = ?auto_135405 ?auto_135411 ) ) ( not ( = ?auto_135406 ?auto_135407 ) ) ( not ( = ?auto_135406 ?auto_135408 ) ) ( not ( = ?auto_135406 ?auto_135409 ) ) ( not ( = ?auto_135406 ?auto_135410 ) ) ( not ( = ?auto_135406 ?auto_135411 ) ) ( not ( = ?auto_135407 ?auto_135408 ) ) ( not ( = ?auto_135407 ?auto_135409 ) ) ( not ( = ?auto_135407 ?auto_135410 ) ) ( not ( = ?auto_135407 ?auto_135411 ) ) ( not ( = ?auto_135408 ?auto_135409 ) ) ( not ( = ?auto_135408 ?auto_135410 ) ) ( not ( = ?auto_135408 ?auto_135411 ) ) ( not ( = ?auto_135409 ?auto_135410 ) ) ( not ( = ?auto_135409 ?auto_135411 ) ) ( not ( = ?auto_135410 ?auto_135411 ) ) ( ON-TABLE ?auto_135411 ) ( ON ?auto_135410 ?auto_135411 ) ( CLEAR ?auto_135408 ) ( ON ?auto_135409 ?auto_135410 ) ( CLEAR ?auto_135409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135411 ?auto_135410 )
      ( MAKE-8PILE ?auto_135404 ?auto_135405 ?auto_135406 ?auto_135407 ?auto_135408 ?auto_135409 ?auto_135410 ?auto_135411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135412 - BLOCK
      ?auto_135413 - BLOCK
      ?auto_135414 - BLOCK
      ?auto_135415 - BLOCK
      ?auto_135416 - BLOCK
      ?auto_135417 - BLOCK
      ?auto_135418 - BLOCK
      ?auto_135419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135412 ) ( ON ?auto_135413 ?auto_135412 ) ( ON ?auto_135414 ?auto_135413 ) ( ON ?auto_135415 ?auto_135414 ) ( not ( = ?auto_135412 ?auto_135413 ) ) ( not ( = ?auto_135412 ?auto_135414 ) ) ( not ( = ?auto_135412 ?auto_135415 ) ) ( not ( = ?auto_135412 ?auto_135416 ) ) ( not ( = ?auto_135412 ?auto_135417 ) ) ( not ( = ?auto_135412 ?auto_135418 ) ) ( not ( = ?auto_135412 ?auto_135419 ) ) ( not ( = ?auto_135413 ?auto_135414 ) ) ( not ( = ?auto_135413 ?auto_135415 ) ) ( not ( = ?auto_135413 ?auto_135416 ) ) ( not ( = ?auto_135413 ?auto_135417 ) ) ( not ( = ?auto_135413 ?auto_135418 ) ) ( not ( = ?auto_135413 ?auto_135419 ) ) ( not ( = ?auto_135414 ?auto_135415 ) ) ( not ( = ?auto_135414 ?auto_135416 ) ) ( not ( = ?auto_135414 ?auto_135417 ) ) ( not ( = ?auto_135414 ?auto_135418 ) ) ( not ( = ?auto_135414 ?auto_135419 ) ) ( not ( = ?auto_135415 ?auto_135416 ) ) ( not ( = ?auto_135415 ?auto_135417 ) ) ( not ( = ?auto_135415 ?auto_135418 ) ) ( not ( = ?auto_135415 ?auto_135419 ) ) ( not ( = ?auto_135416 ?auto_135417 ) ) ( not ( = ?auto_135416 ?auto_135418 ) ) ( not ( = ?auto_135416 ?auto_135419 ) ) ( not ( = ?auto_135417 ?auto_135418 ) ) ( not ( = ?auto_135417 ?auto_135419 ) ) ( not ( = ?auto_135418 ?auto_135419 ) ) ( ON-TABLE ?auto_135419 ) ( ON ?auto_135418 ?auto_135419 ) ( ON ?auto_135417 ?auto_135418 ) ( CLEAR ?auto_135417 ) ( HOLDING ?auto_135416 ) ( CLEAR ?auto_135415 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135412 ?auto_135413 ?auto_135414 ?auto_135415 ?auto_135416 )
      ( MAKE-8PILE ?auto_135412 ?auto_135413 ?auto_135414 ?auto_135415 ?auto_135416 ?auto_135417 ?auto_135418 ?auto_135419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135420 - BLOCK
      ?auto_135421 - BLOCK
      ?auto_135422 - BLOCK
      ?auto_135423 - BLOCK
      ?auto_135424 - BLOCK
      ?auto_135425 - BLOCK
      ?auto_135426 - BLOCK
      ?auto_135427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135420 ) ( ON ?auto_135421 ?auto_135420 ) ( ON ?auto_135422 ?auto_135421 ) ( ON ?auto_135423 ?auto_135422 ) ( not ( = ?auto_135420 ?auto_135421 ) ) ( not ( = ?auto_135420 ?auto_135422 ) ) ( not ( = ?auto_135420 ?auto_135423 ) ) ( not ( = ?auto_135420 ?auto_135424 ) ) ( not ( = ?auto_135420 ?auto_135425 ) ) ( not ( = ?auto_135420 ?auto_135426 ) ) ( not ( = ?auto_135420 ?auto_135427 ) ) ( not ( = ?auto_135421 ?auto_135422 ) ) ( not ( = ?auto_135421 ?auto_135423 ) ) ( not ( = ?auto_135421 ?auto_135424 ) ) ( not ( = ?auto_135421 ?auto_135425 ) ) ( not ( = ?auto_135421 ?auto_135426 ) ) ( not ( = ?auto_135421 ?auto_135427 ) ) ( not ( = ?auto_135422 ?auto_135423 ) ) ( not ( = ?auto_135422 ?auto_135424 ) ) ( not ( = ?auto_135422 ?auto_135425 ) ) ( not ( = ?auto_135422 ?auto_135426 ) ) ( not ( = ?auto_135422 ?auto_135427 ) ) ( not ( = ?auto_135423 ?auto_135424 ) ) ( not ( = ?auto_135423 ?auto_135425 ) ) ( not ( = ?auto_135423 ?auto_135426 ) ) ( not ( = ?auto_135423 ?auto_135427 ) ) ( not ( = ?auto_135424 ?auto_135425 ) ) ( not ( = ?auto_135424 ?auto_135426 ) ) ( not ( = ?auto_135424 ?auto_135427 ) ) ( not ( = ?auto_135425 ?auto_135426 ) ) ( not ( = ?auto_135425 ?auto_135427 ) ) ( not ( = ?auto_135426 ?auto_135427 ) ) ( ON-TABLE ?auto_135427 ) ( ON ?auto_135426 ?auto_135427 ) ( ON ?auto_135425 ?auto_135426 ) ( CLEAR ?auto_135423 ) ( ON ?auto_135424 ?auto_135425 ) ( CLEAR ?auto_135424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135427 ?auto_135426 ?auto_135425 )
      ( MAKE-8PILE ?auto_135420 ?auto_135421 ?auto_135422 ?auto_135423 ?auto_135424 ?auto_135425 ?auto_135426 ?auto_135427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135428 - BLOCK
      ?auto_135429 - BLOCK
      ?auto_135430 - BLOCK
      ?auto_135431 - BLOCK
      ?auto_135432 - BLOCK
      ?auto_135433 - BLOCK
      ?auto_135434 - BLOCK
      ?auto_135435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135428 ) ( ON ?auto_135429 ?auto_135428 ) ( ON ?auto_135430 ?auto_135429 ) ( not ( = ?auto_135428 ?auto_135429 ) ) ( not ( = ?auto_135428 ?auto_135430 ) ) ( not ( = ?auto_135428 ?auto_135431 ) ) ( not ( = ?auto_135428 ?auto_135432 ) ) ( not ( = ?auto_135428 ?auto_135433 ) ) ( not ( = ?auto_135428 ?auto_135434 ) ) ( not ( = ?auto_135428 ?auto_135435 ) ) ( not ( = ?auto_135429 ?auto_135430 ) ) ( not ( = ?auto_135429 ?auto_135431 ) ) ( not ( = ?auto_135429 ?auto_135432 ) ) ( not ( = ?auto_135429 ?auto_135433 ) ) ( not ( = ?auto_135429 ?auto_135434 ) ) ( not ( = ?auto_135429 ?auto_135435 ) ) ( not ( = ?auto_135430 ?auto_135431 ) ) ( not ( = ?auto_135430 ?auto_135432 ) ) ( not ( = ?auto_135430 ?auto_135433 ) ) ( not ( = ?auto_135430 ?auto_135434 ) ) ( not ( = ?auto_135430 ?auto_135435 ) ) ( not ( = ?auto_135431 ?auto_135432 ) ) ( not ( = ?auto_135431 ?auto_135433 ) ) ( not ( = ?auto_135431 ?auto_135434 ) ) ( not ( = ?auto_135431 ?auto_135435 ) ) ( not ( = ?auto_135432 ?auto_135433 ) ) ( not ( = ?auto_135432 ?auto_135434 ) ) ( not ( = ?auto_135432 ?auto_135435 ) ) ( not ( = ?auto_135433 ?auto_135434 ) ) ( not ( = ?auto_135433 ?auto_135435 ) ) ( not ( = ?auto_135434 ?auto_135435 ) ) ( ON-TABLE ?auto_135435 ) ( ON ?auto_135434 ?auto_135435 ) ( ON ?auto_135433 ?auto_135434 ) ( ON ?auto_135432 ?auto_135433 ) ( CLEAR ?auto_135432 ) ( HOLDING ?auto_135431 ) ( CLEAR ?auto_135430 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135428 ?auto_135429 ?auto_135430 ?auto_135431 )
      ( MAKE-8PILE ?auto_135428 ?auto_135429 ?auto_135430 ?auto_135431 ?auto_135432 ?auto_135433 ?auto_135434 ?auto_135435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135436 - BLOCK
      ?auto_135437 - BLOCK
      ?auto_135438 - BLOCK
      ?auto_135439 - BLOCK
      ?auto_135440 - BLOCK
      ?auto_135441 - BLOCK
      ?auto_135442 - BLOCK
      ?auto_135443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135436 ) ( ON ?auto_135437 ?auto_135436 ) ( ON ?auto_135438 ?auto_135437 ) ( not ( = ?auto_135436 ?auto_135437 ) ) ( not ( = ?auto_135436 ?auto_135438 ) ) ( not ( = ?auto_135436 ?auto_135439 ) ) ( not ( = ?auto_135436 ?auto_135440 ) ) ( not ( = ?auto_135436 ?auto_135441 ) ) ( not ( = ?auto_135436 ?auto_135442 ) ) ( not ( = ?auto_135436 ?auto_135443 ) ) ( not ( = ?auto_135437 ?auto_135438 ) ) ( not ( = ?auto_135437 ?auto_135439 ) ) ( not ( = ?auto_135437 ?auto_135440 ) ) ( not ( = ?auto_135437 ?auto_135441 ) ) ( not ( = ?auto_135437 ?auto_135442 ) ) ( not ( = ?auto_135437 ?auto_135443 ) ) ( not ( = ?auto_135438 ?auto_135439 ) ) ( not ( = ?auto_135438 ?auto_135440 ) ) ( not ( = ?auto_135438 ?auto_135441 ) ) ( not ( = ?auto_135438 ?auto_135442 ) ) ( not ( = ?auto_135438 ?auto_135443 ) ) ( not ( = ?auto_135439 ?auto_135440 ) ) ( not ( = ?auto_135439 ?auto_135441 ) ) ( not ( = ?auto_135439 ?auto_135442 ) ) ( not ( = ?auto_135439 ?auto_135443 ) ) ( not ( = ?auto_135440 ?auto_135441 ) ) ( not ( = ?auto_135440 ?auto_135442 ) ) ( not ( = ?auto_135440 ?auto_135443 ) ) ( not ( = ?auto_135441 ?auto_135442 ) ) ( not ( = ?auto_135441 ?auto_135443 ) ) ( not ( = ?auto_135442 ?auto_135443 ) ) ( ON-TABLE ?auto_135443 ) ( ON ?auto_135442 ?auto_135443 ) ( ON ?auto_135441 ?auto_135442 ) ( ON ?auto_135440 ?auto_135441 ) ( CLEAR ?auto_135438 ) ( ON ?auto_135439 ?auto_135440 ) ( CLEAR ?auto_135439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135443 ?auto_135442 ?auto_135441 ?auto_135440 )
      ( MAKE-8PILE ?auto_135436 ?auto_135437 ?auto_135438 ?auto_135439 ?auto_135440 ?auto_135441 ?auto_135442 ?auto_135443 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135444 - BLOCK
      ?auto_135445 - BLOCK
      ?auto_135446 - BLOCK
      ?auto_135447 - BLOCK
      ?auto_135448 - BLOCK
      ?auto_135449 - BLOCK
      ?auto_135450 - BLOCK
      ?auto_135451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135444 ) ( ON ?auto_135445 ?auto_135444 ) ( not ( = ?auto_135444 ?auto_135445 ) ) ( not ( = ?auto_135444 ?auto_135446 ) ) ( not ( = ?auto_135444 ?auto_135447 ) ) ( not ( = ?auto_135444 ?auto_135448 ) ) ( not ( = ?auto_135444 ?auto_135449 ) ) ( not ( = ?auto_135444 ?auto_135450 ) ) ( not ( = ?auto_135444 ?auto_135451 ) ) ( not ( = ?auto_135445 ?auto_135446 ) ) ( not ( = ?auto_135445 ?auto_135447 ) ) ( not ( = ?auto_135445 ?auto_135448 ) ) ( not ( = ?auto_135445 ?auto_135449 ) ) ( not ( = ?auto_135445 ?auto_135450 ) ) ( not ( = ?auto_135445 ?auto_135451 ) ) ( not ( = ?auto_135446 ?auto_135447 ) ) ( not ( = ?auto_135446 ?auto_135448 ) ) ( not ( = ?auto_135446 ?auto_135449 ) ) ( not ( = ?auto_135446 ?auto_135450 ) ) ( not ( = ?auto_135446 ?auto_135451 ) ) ( not ( = ?auto_135447 ?auto_135448 ) ) ( not ( = ?auto_135447 ?auto_135449 ) ) ( not ( = ?auto_135447 ?auto_135450 ) ) ( not ( = ?auto_135447 ?auto_135451 ) ) ( not ( = ?auto_135448 ?auto_135449 ) ) ( not ( = ?auto_135448 ?auto_135450 ) ) ( not ( = ?auto_135448 ?auto_135451 ) ) ( not ( = ?auto_135449 ?auto_135450 ) ) ( not ( = ?auto_135449 ?auto_135451 ) ) ( not ( = ?auto_135450 ?auto_135451 ) ) ( ON-TABLE ?auto_135451 ) ( ON ?auto_135450 ?auto_135451 ) ( ON ?auto_135449 ?auto_135450 ) ( ON ?auto_135448 ?auto_135449 ) ( ON ?auto_135447 ?auto_135448 ) ( CLEAR ?auto_135447 ) ( HOLDING ?auto_135446 ) ( CLEAR ?auto_135445 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135444 ?auto_135445 ?auto_135446 )
      ( MAKE-8PILE ?auto_135444 ?auto_135445 ?auto_135446 ?auto_135447 ?auto_135448 ?auto_135449 ?auto_135450 ?auto_135451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135452 - BLOCK
      ?auto_135453 - BLOCK
      ?auto_135454 - BLOCK
      ?auto_135455 - BLOCK
      ?auto_135456 - BLOCK
      ?auto_135457 - BLOCK
      ?auto_135458 - BLOCK
      ?auto_135459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135452 ) ( ON ?auto_135453 ?auto_135452 ) ( not ( = ?auto_135452 ?auto_135453 ) ) ( not ( = ?auto_135452 ?auto_135454 ) ) ( not ( = ?auto_135452 ?auto_135455 ) ) ( not ( = ?auto_135452 ?auto_135456 ) ) ( not ( = ?auto_135452 ?auto_135457 ) ) ( not ( = ?auto_135452 ?auto_135458 ) ) ( not ( = ?auto_135452 ?auto_135459 ) ) ( not ( = ?auto_135453 ?auto_135454 ) ) ( not ( = ?auto_135453 ?auto_135455 ) ) ( not ( = ?auto_135453 ?auto_135456 ) ) ( not ( = ?auto_135453 ?auto_135457 ) ) ( not ( = ?auto_135453 ?auto_135458 ) ) ( not ( = ?auto_135453 ?auto_135459 ) ) ( not ( = ?auto_135454 ?auto_135455 ) ) ( not ( = ?auto_135454 ?auto_135456 ) ) ( not ( = ?auto_135454 ?auto_135457 ) ) ( not ( = ?auto_135454 ?auto_135458 ) ) ( not ( = ?auto_135454 ?auto_135459 ) ) ( not ( = ?auto_135455 ?auto_135456 ) ) ( not ( = ?auto_135455 ?auto_135457 ) ) ( not ( = ?auto_135455 ?auto_135458 ) ) ( not ( = ?auto_135455 ?auto_135459 ) ) ( not ( = ?auto_135456 ?auto_135457 ) ) ( not ( = ?auto_135456 ?auto_135458 ) ) ( not ( = ?auto_135456 ?auto_135459 ) ) ( not ( = ?auto_135457 ?auto_135458 ) ) ( not ( = ?auto_135457 ?auto_135459 ) ) ( not ( = ?auto_135458 ?auto_135459 ) ) ( ON-TABLE ?auto_135459 ) ( ON ?auto_135458 ?auto_135459 ) ( ON ?auto_135457 ?auto_135458 ) ( ON ?auto_135456 ?auto_135457 ) ( ON ?auto_135455 ?auto_135456 ) ( CLEAR ?auto_135453 ) ( ON ?auto_135454 ?auto_135455 ) ( CLEAR ?auto_135454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135459 ?auto_135458 ?auto_135457 ?auto_135456 ?auto_135455 )
      ( MAKE-8PILE ?auto_135452 ?auto_135453 ?auto_135454 ?auto_135455 ?auto_135456 ?auto_135457 ?auto_135458 ?auto_135459 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135460 - BLOCK
      ?auto_135461 - BLOCK
      ?auto_135462 - BLOCK
      ?auto_135463 - BLOCK
      ?auto_135464 - BLOCK
      ?auto_135465 - BLOCK
      ?auto_135466 - BLOCK
      ?auto_135467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135460 ) ( not ( = ?auto_135460 ?auto_135461 ) ) ( not ( = ?auto_135460 ?auto_135462 ) ) ( not ( = ?auto_135460 ?auto_135463 ) ) ( not ( = ?auto_135460 ?auto_135464 ) ) ( not ( = ?auto_135460 ?auto_135465 ) ) ( not ( = ?auto_135460 ?auto_135466 ) ) ( not ( = ?auto_135460 ?auto_135467 ) ) ( not ( = ?auto_135461 ?auto_135462 ) ) ( not ( = ?auto_135461 ?auto_135463 ) ) ( not ( = ?auto_135461 ?auto_135464 ) ) ( not ( = ?auto_135461 ?auto_135465 ) ) ( not ( = ?auto_135461 ?auto_135466 ) ) ( not ( = ?auto_135461 ?auto_135467 ) ) ( not ( = ?auto_135462 ?auto_135463 ) ) ( not ( = ?auto_135462 ?auto_135464 ) ) ( not ( = ?auto_135462 ?auto_135465 ) ) ( not ( = ?auto_135462 ?auto_135466 ) ) ( not ( = ?auto_135462 ?auto_135467 ) ) ( not ( = ?auto_135463 ?auto_135464 ) ) ( not ( = ?auto_135463 ?auto_135465 ) ) ( not ( = ?auto_135463 ?auto_135466 ) ) ( not ( = ?auto_135463 ?auto_135467 ) ) ( not ( = ?auto_135464 ?auto_135465 ) ) ( not ( = ?auto_135464 ?auto_135466 ) ) ( not ( = ?auto_135464 ?auto_135467 ) ) ( not ( = ?auto_135465 ?auto_135466 ) ) ( not ( = ?auto_135465 ?auto_135467 ) ) ( not ( = ?auto_135466 ?auto_135467 ) ) ( ON-TABLE ?auto_135467 ) ( ON ?auto_135466 ?auto_135467 ) ( ON ?auto_135465 ?auto_135466 ) ( ON ?auto_135464 ?auto_135465 ) ( ON ?auto_135463 ?auto_135464 ) ( ON ?auto_135462 ?auto_135463 ) ( CLEAR ?auto_135462 ) ( HOLDING ?auto_135461 ) ( CLEAR ?auto_135460 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135460 ?auto_135461 )
      ( MAKE-8PILE ?auto_135460 ?auto_135461 ?auto_135462 ?auto_135463 ?auto_135464 ?auto_135465 ?auto_135466 ?auto_135467 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135468 - BLOCK
      ?auto_135469 - BLOCK
      ?auto_135470 - BLOCK
      ?auto_135471 - BLOCK
      ?auto_135472 - BLOCK
      ?auto_135473 - BLOCK
      ?auto_135474 - BLOCK
      ?auto_135475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135468 ) ( not ( = ?auto_135468 ?auto_135469 ) ) ( not ( = ?auto_135468 ?auto_135470 ) ) ( not ( = ?auto_135468 ?auto_135471 ) ) ( not ( = ?auto_135468 ?auto_135472 ) ) ( not ( = ?auto_135468 ?auto_135473 ) ) ( not ( = ?auto_135468 ?auto_135474 ) ) ( not ( = ?auto_135468 ?auto_135475 ) ) ( not ( = ?auto_135469 ?auto_135470 ) ) ( not ( = ?auto_135469 ?auto_135471 ) ) ( not ( = ?auto_135469 ?auto_135472 ) ) ( not ( = ?auto_135469 ?auto_135473 ) ) ( not ( = ?auto_135469 ?auto_135474 ) ) ( not ( = ?auto_135469 ?auto_135475 ) ) ( not ( = ?auto_135470 ?auto_135471 ) ) ( not ( = ?auto_135470 ?auto_135472 ) ) ( not ( = ?auto_135470 ?auto_135473 ) ) ( not ( = ?auto_135470 ?auto_135474 ) ) ( not ( = ?auto_135470 ?auto_135475 ) ) ( not ( = ?auto_135471 ?auto_135472 ) ) ( not ( = ?auto_135471 ?auto_135473 ) ) ( not ( = ?auto_135471 ?auto_135474 ) ) ( not ( = ?auto_135471 ?auto_135475 ) ) ( not ( = ?auto_135472 ?auto_135473 ) ) ( not ( = ?auto_135472 ?auto_135474 ) ) ( not ( = ?auto_135472 ?auto_135475 ) ) ( not ( = ?auto_135473 ?auto_135474 ) ) ( not ( = ?auto_135473 ?auto_135475 ) ) ( not ( = ?auto_135474 ?auto_135475 ) ) ( ON-TABLE ?auto_135475 ) ( ON ?auto_135474 ?auto_135475 ) ( ON ?auto_135473 ?auto_135474 ) ( ON ?auto_135472 ?auto_135473 ) ( ON ?auto_135471 ?auto_135472 ) ( ON ?auto_135470 ?auto_135471 ) ( CLEAR ?auto_135468 ) ( ON ?auto_135469 ?auto_135470 ) ( CLEAR ?auto_135469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135475 ?auto_135474 ?auto_135473 ?auto_135472 ?auto_135471 ?auto_135470 )
      ( MAKE-8PILE ?auto_135468 ?auto_135469 ?auto_135470 ?auto_135471 ?auto_135472 ?auto_135473 ?auto_135474 ?auto_135475 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135476 - BLOCK
      ?auto_135477 - BLOCK
      ?auto_135478 - BLOCK
      ?auto_135479 - BLOCK
      ?auto_135480 - BLOCK
      ?auto_135481 - BLOCK
      ?auto_135482 - BLOCK
      ?auto_135483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135476 ?auto_135477 ) ) ( not ( = ?auto_135476 ?auto_135478 ) ) ( not ( = ?auto_135476 ?auto_135479 ) ) ( not ( = ?auto_135476 ?auto_135480 ) ) ( not ( = ?auto_135476 ?auto_135481 ) ) ( not ( = ?auto_135476 ?auto_135482 ) ) ( not ( = ?auto_135476 ?auto_135483 ) ) ( not ( = ?auto_135477 ?auto_135478 ) ) ( not ( = ?auto_135477 ?auto_135479 ) ) ( not ( = ?auto_135477 ?auto_135480 ) ) ( not ( = ?auto_135477 ?auto_135481 ) ) ( not ( = ?auto_135477 ?auto_135482 ) ) ( not ( = ?auto_135477 ?auto_135483 ) ) ( not ( = ?auto_135478 ?auto_135479 ) ) ( not ( = ?auto_135478 ?auto_135480 ) ) ( not ( = ?auto_135478 ?auto_135481 ) ) ( not ( = ?auto_135478 ?auto_135482 ) ) ( not ( = ?auto_135478 ?auto_135483 ) ) ( not ( = ?auto_135479 ?auto_135480 ) ) ( not ( = ?auto_135479 ?auto_135481 ) ) ( not ( = ?auto_135479 ?auto_135482 ) ) ( not ( = ?auto_135479 ?auto_135483 ) ) ( not ( = ?auto_135480 ?auto_135481 ) ) ( not ( = ?auto_135480 ?auto_135482 ) ) ( not ( = ?auto_135480 ?auto_135483 ) ) ( not ( = ?auto_135481 ?auto_135482 ) ) ( not ( = ?auto_135481 ?auto_135483 ) ) ( not ( = ?auto_135482 ?auto_135483 ) ) ( ON-TABLE ?auto_135483 ) ( ON ?auto_135482 ?auto_135483 ) ( ON ?auto_135481 ?auto_135482 ) ( ON ?auto_135480 ?auto_135481 ) ( ON ?auto_135479 ?auto_135480 ) ( ON ?auto_135478 ?auto_135479 ) ( ON ?auto_135477 ?auto_135478 ) ( CLEAR ?auto_135477 ) ( HOLDING ?auto_135476 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135476 )
      ( MAKE-8PILE ?auto_135476 ?auto_135477 ?auto_135478 ?auto_135479 ?auto_135480 ?auto_135481 ?auto_135482 ?auto_135483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135484 - BLOCK
      ?auto_135485 - BLOCK
      ?auto_135486 - BLOCK
      ?auto_135487 - BLOCK
      ?auto_135488 - BLOCK
      ?auto_135489 - BLOCK
      ?auto_135490 - BLOCK
      ?auto_135491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135484 ?auto_135485 ) ) ( not ( = ?auto_135484 ?auto_135486 ) ) ( not ( = ?auto_135484 ?auto_135487 ) ) ( not ( = ?auto_135484 ?auto_135488 ) ) ( not ( = ?auto_135484 ?auto_135489 ) ) ( not ( = ?auto_135484 ?auto_135490 ) ) ( not ( = ?auto_135484 ?auto_135491 ) ) ( not ( = ?auto_135485 ?auto_135486 ) ) ( not ( = ?auto_135485 ?auto_135487 ) ) ( not ( = ?auto_135485 ?auto_135488 ) ) ( not ( = ?auto_135485 ?auto_135489 ) ) ( not ( = ?auto_135485 ?auto_135490 ) ) ( not ( = ?auto_135485 ?auto_135491 ) ) ( not ( = ?auto_135486 ?auto_135487 ) ) ( not ( = ?auto_135486 ?auto_135488 ) ) ( not ( = ?auto_135486 ?auto_135489 ) ) ( not ( = ?auto_135486 ?auto_135490 ) ) ( not ( = ?auto_135486 ?auto_135491 ) ) ( not ( = ?auto_135487 ?auto_135488 ) ) ( not ( = ?auto_135487 ?auto_135489 ) ) ( not ( = ?auto_135487 ?auto_135490 ) ) ( not ( = ?auto_135487 ?auto_135491 ) ) ( not ( = ?auto_135488 ?auto_135489 ) ) ( not ( = ?auto_135488 ?auto_135490 ) ) ( not ( = ?auto_135488 ?auto_135491 ) ) ( not ( = ?auto_135489 ?auto_135490 ) ) ( not ( = ?auto_135489 ?auto_135491 ) ) ( not ( = ?auto_135490 ?auto_135491 ) ) ( ON-TABLE ?auto_135491 ) ( ON ?auto_135490 ?auto_135491 ) ( ON ?auto_135489 ?auto_135490 ) ( ON ?auto_135488 ?auto_135489 ) ( ON ?auto_135487 ?auto_135488 ) ( ON ?auto_135486 ?auto_135487 ) ( ON ?auto_135485 ?auto_135486 ) ( ON ?auto_135484 ?auto_135485 ) ( CLEAR ?auto_135484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135491 ?auto_135490 ?auto_135489 ?auto_135488 ?auto_135487 ?auto_135486 ?auto_135485 )
      ( MAKE-8PILE ?auto_135484 ?auto_135485 ?auto_135486 ?auto_135487 ?auto_135488 ?auto_135489 ?auto_135490 ?auto_135491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135500 - BLOCK
      ?auto_135501 - BLOCK
      ?auto_135502 - BLOCK
      ?auto_135503 - BLOCK
      ?auto_135504 - BLOCK
      ?auto_135505 - BLOCK
      ?auto_135506 - BLOCK
      ?auto_135507 - BLOCK
    )
    :vars
    (
      ?auto_135508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135500 ?auto_135501 ) ) ( not ( = ?auto_135500 ?auto_135502 ) ) ( not ( = ?auto_135500 ?auto_135503 ) ) ( not ( = ?auto_135500 ?auto_135504 ) ) ( not ( = ?auto_135500 ?auto_135505 ) ) ( not ( = ?auto_135500 ?auto_135506 ) ) ( not ( = ?auto_135500 ?auto_135507 ) ) ( not ( = ?auto_135501 ?auto_135502 ) ) ( not ( = ?auto_135501 ?auto_135503 ) ) ( not ( = ?auto_135501 ?auto_135504 ) ) ( not ( = ?auto_135501 ?auto_135505 ) ) ( not ( = ?auto_135501 ?auto_135506 ) ) ( not ( = ?auto_135501 ?auto_135507 ) ) ( not ( = ?auto_135502 ?auto_135503 ) ) ( not ( = ?auto_135502 ?auto_135504 ) ) ( not ( = ?auto_135502 ?auto_135505 ) ) ( not ( = ?auto_135502 ?auto_135506 ) ) ( not ( = ?auto_135502 ?auto_135507 ) ) ( not ( = ?auto_135503 ?auto_135504 ) ) ( not ( = ?auto_135503 ?auto_135505 ) ) ( not ( = ?auto_135503 ?auto_135506 ) ) ( not ( = ?auto_135503 ?auto_135507 ) ) ( not ( = ?auto_135504 ?auto_135505 ) ) ( not ( = ?auto_135504 ?auto_135506 ) ) ( not ( = ?auto_135504 ?auto_135507 ) ) ( not ( = ?auto_135505 ?auto_135506 ) ) ( not ( = ?auto_135505 ?auto_135507 ) ) ( not ( = ?auto_135506 ?auto_135507 ) ) ( ON-TABLE ?auto_135507 ) ( ON ?auto_135506 ?auto_135507 ) ( ON ?auto_135505 ?auto_135506 ) ( ON ?auto_135504 ?auto_135505 ) ( ON ?auto_135503 ?auto_135504 ) ( ON ?auto_135502 ?auto_135503 ) ( ON ?auto_135501 ?auto_135502 ) ( CLEAR ?auto_135501 ) ( ON ?auto_135500 ?auto_135508 ) ( CLEAR ?auto_135500 ) ( HAND-EMPTY ) ( not ( = ?auto_135500 ?auto_135508 ) ) ( not ( = ?auto_135501 ?auto_135508 ) ) ( not ( = ?auto_135502 ?auto_135508 ) ) ( not ( = ?auto_135503 ?auto_135508 ) ) ( not ( = ?auto_135504 ?auto_135508 ) ) ( not ( = ?auto_135505 ?auto_135508 ) ) ( not ( = ?auto_135506 ?auto_135508 ) ) ( not ( = ?auto_135507 ?auto_135508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135500 ?auto_135508 )
      ( MAKE-8PILE ?auto_135500 ?auto_135501 ?auto_135502 ?auto_135503 ?auto_135504 ?auto_135505 ?auto_135506 ?auto_135507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135509 - BLOCK
      ?auto_135510 - BLOCK
      ?auto_135511 - BLOCK
      ?auto_135512 - BLOCK
      ?auto_135513 - BLOCK
      ?auto_135514 - BLOCK
      ?auto_135515 - BLOCK
      ?auto_135516 - BLOCK
    )
    :vars
    (
      ?auto_135517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135509 ?auto_135510 ) ) ( not ( = ?auto_135509 ?auto_135511 ) ) ( not ( = ?auto_135509 ?auto_135512 ) ) ( not ( = ?auto_135509 ?auto_135513 ) ) ( not ( = ?auto_135509 ?auto_135514 ) ) ( not ( = ?auto_135509 ?auto_135515 ) ) ( not ( = ?auto_135509 ?auto_135516 ) ) ( not ( = ?auto_135510 ?auto_135511 ) ) ( not ( = ?auto_135510 ?auto_135512 ) ) ( not ( = ?auto_135510 ?auto_135513 ) ) ( not ( = ?auto_135510 ?auto_135514 ) ) ( not ( = ?auto_135510 ?auto_135515 ) ) ( not ( = ?auto_135510 ?auto_135516 ) ) ( not ( = ?auto_135511 ?auto_135512 ) ) ( not ( = ?auto_135511 ?auto_135513 ) ) ( not ( = ?auto_135511 ?auto_135514 ) ) ( not ( = ?auto_135511 ?auto_135515 ) ) ( not ( = ?auto_135511 ?auto_135516 ) ) ( not ( = ?auto_135512 ?auto_135513 ) ) ( not ( = ?auto_135512 ?auto_135514 ) ) ( not ( = ?auto_135512 ?auto_135515 ) ) ( not ( = ?auto_135512 ?auto_135516 ) ) ( not ( = ?auto_135513 ?auto_135514 ) ) ( not ( = ?auto_135513 ?auto_135515 ) ) ( not ( = ?auto_135513 ?auto_135516 ) ) ( not ( = ?auto_135514 ?auto_135515 ) ) ( not ( = ?auto_135514 ?auto_135516 ) ) ( not ( = ?auto_135515 ?auto_135516 ) ) ( ON-TABLE ?auto_135516 ) ( ON ?auto_135515 ?auto_135516 ) ( ON ?auto_135514 ?auto_135515 ) ( ON ?auto_135513 ?auto_135514 ) ( ON ?auto_135512 ?auto_135513 ) ( ON ?auto_135511 ?auto_135512 ) ( ON ?auto_135509 ?auto_135517 ) ( CLEAR ?auto_135509 ) ( not ( = ?auto_135509 ?auto_135517 ) ) ( not ( = ?auto_135510 ?auto_135517 ) ) ( not ( = ?auto_135511 ?auto_135517 ) ) ( not ( = ?auto_135512 ?auto_135517 ) ) ( not ( = ?auto_135513 ?auto_135517 ) ) ( not ( = ?auto_135514 ?auto_135517 ) ) ( not ( = ?auto_135515 ?auto_135517 ) ) ( not ( = ?auto_135516 ?auto_135517 ) ) ( HOLDING ?auto_135510 ) ( CLEAR ?auto_135511 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135516 ?auto_135515 ?auto_135514 ?auto_135513 ?auto_135512 ?auto_135511 ?auto_135510 )
      ( MAKE-8PILE ?auto_135509 ?auto_135510 ?auto_135511 ?auto_135512 ?auto_135513 ?auto_135514 ?auto_135515 ?auto_135516 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135518 - BLOCK
      ?auto_135519 - BLOCK
      ?auto_135520 - BLOCK
      ?auto_135521 - BLOCK
      ?auto_135522 - BLOCK
      ?auto_135523 - BLOCK
      ?auto_135524 - BLOCK
      ?auto_135525 - BLOCK
    )
    :vars
    (
      ?auto_135526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135518 ?auto_135519 ) ) ( not ( = ?auto_135518 ?auto_135520 ) ) ( not ( = ?auto_135518 ?auto_135521 ) ) ( not ( = ?auto_135518 ?auto_135522 ) ) ( not ( = ?auto_135518 ?auto_135523 ) ) ( not ( = ?auto_135518 ?auto_135524 ) ) ( not ( = ?auto_135518 ?auto_135525 ) ) ( not ( = ?auto_135519 ?auto_135520 ) ) ( not ( = ?auto_135519 ?auto_135521 ) ) ( not ( = ?auto_135519 ?auto_135522 ) ) ( not ( = ?auto_135519 ?auto_135523 ) ) ( not ( = ?auto_135519 ?auto_135524 ) ) ( not ( = ?auto_135519 ?auto_135525 ) ) ( not ( = ?auto_135520 ?auto_135521 ) ) ( not ( = ?auto_135520 ?auto_135522 ) ) ( not ( = ?auto_135520 ?auto_135523 ) ) ( not ( = ?auto_135520 ?auto_135524 ) ) ( not ( = ?auto_135520 ?auto_135525 ) ) ( not ( = ?auto_135521 ?auto_135522 ) ) ( not ( = ?auto_135521 ?auto_135523 ) ) ( not ( = ?auto_135521 ?auto_135524 ) ) ( not ( = ?auto_135521 ?auto_135525 ) ) ( not ( = ?auto_135522 ?auto_135523 ) ) ( not ( = ?auto_135522 ?auto_135524 ) ) ( not ( = ?auto_135522 ?auto_135525 ) ) ( not ( = ?auto_135523 ?auto_135524 ) ) ( not ( = ?auto_135523 ?auto_135525 ) ) ( not ( = ?auto_135524 ?auto_135525 ) ) ( ON-TABLE ?auto_135525 ) ( ON ?auto_135524 ?auto_135525 ) ( ON ?auto_135523 ?auto_135524 ) ( ON ?auto_135522 ?auto_135523 ) ( ON ?auto_135521 ?auto_135522 ) ( ON ?auto_135520 ?auto_135521 ) ( ON ?auto_135518 ?auto_135526 ) ( not ( = ?auto_135518 ?auto_135526 ) ) ( not ( = ?auto_135519 ?auto_135526 ) ) ( not ( = ?auto_135520 ?auto_135526 ) ) ( not ( = ?auto_135521 ?auto_135526 ) ) ( not ( = ?auto_135522 ?auto_135526 ) ) ( not ( = ?auto_135523 ?auto_135526 ) ) ( not ( = ?auto_135524 ?auto_135526 ) ) ( not ( = ?auto_135525 ?auto_135526 ) ) ( CLEAR ?auto_135520 ) ( ON ?auto_135519 ?auto_135518 ) ( CLEAR ?auto_135519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135526 ?auto_135518 )
      ( MAKE-8PILE ?auto_135518 ?auto_135519 ?auto_135520 ?auto_135521 ?auto_135522 ?auto_135523 ?auto_135524 ?auto_135525 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135527 - BLOCK
      ?auto_135528 - BLOCK
      ?auto_135529 - BLOCK
      ?auto_135530 - BLOCK
      ?auto_135531 - BLOCK
      ?auto_135532 - BLOCK
      ?auto_135533 - BLOCK
      ?auto_135534 - BLOCK
    )
    :vars
    (
      ?auto_135535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135527 ?auto_135528 ) ) ( not ( = ?auto_135527 ?auto_135529 ) ) ( not ( = ?auto_135527 ?auto_135530 ) ) ( not ( = ?auto_135527 ?auto_135531 ) ) ( not ( = ?auto_135527 ?auto_135532 ) ) ( not ( = ?auto_135527 ?auto_135533 ) ) ( not ( = ?auto_135527 ?auto_135534 ) ) ( not ( = ?auto_135528 ?auto_135529 ) ) ( not ( = ?auto_135528 ?auto_135530 ) ) ( not ( = ?auto_135528 ?auto_135531 ) ) ( not ( = ?auto_135528 ?auto_135532 ) ) ( not ( = ?auto_135528 ?auto_135533 ) ) ( not ( = ?auto_135528 ?auto_135534 ) ) ( not ( = ?auto_135529 ?auto_135530 ) ) ( not ( = ?auto_135529 ?auto_135531 ) ) ( not ( = ?auto_135529 ?auto_135532 ) ) ( not ( = ?auto_135529 ?auto_135533 ) ) ( not ( = ?auto_135529 ?auto_135534 ) ) ( not ( = ?auto_135530 ?auto_135531 ) ) ( not ( = ?auto_135530 ?auto_135532 ) ) ( not ( = ?auto_135530 ?auto_135533 ) ) ( not ( = ?auto_135530 ?auto_135534 ) ) ( not ( = ?auto_135531 ?auto_135532 ) ) ( not ( = ?auto_135531 ?auto_135533 ) ) ( not ( = ?auto_135531 ?auto_135534 ) ) ( not ( = ?auto_135532 ?auto_135533 ) ) ( not ( = ?auto_135532 ?auto_135534 ) ) ( not ( = ?auto_135533 ?auto_135534 ) ) ( ON-TABLE ?auto_135534 ) ( ON ?auto_135533 ?auto_135534 ) ( ON ?auto_135532 ?auto_135533 ) ( ON ?auto_135531 ?auto_135532 ) ( ON ?auto_135530 ?auto_135531 ) ( ON ?auto_135527 ?auto_135535 ) ( not ( = ?auto_135527 ?auto_135535 ) ) ( not ( = ?auto_135528 ?auto_135535 ) ) ( not ( = ?auto_135529 ?auto_135535 ) ) ( not ( = ?auto_135530 ?auto_135535 ) ) ( not ( = ?auto_135531 ?auto_135535 ) ) ( not ( = ?auto_135532 ?auto_135535 ) ) ( not ( = ?auto_135533 ?auto_135535 ) ) ( not ( = ?auto_135534 ?auto_135535 ) ) ( ON ?auto_135528 ?auto_135527 ) ( CLEAR ?auto_135528 ) ( ON-TABLE ?auto_135535 ) ( HOLDING ?auto_135529 ) ( CLEAR ?auto_135530 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135534 ?auto_135533 ?auto_135532 ?auto_135531 ?auto_135530 ?auto_135529 )
      ( MAKE-8PILE ?auto_135527 ?auto_135528 ?auto_135529 ?auto_135530 ?auto_135531 ?auto_135532 ?auto_135533 ?auto_135534 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135536 - BLOCK
      ?auto_135537 - BLOCK
      ?auto_135538 - BLOCK
      ?auto_135539 - BLOCK
      ?auto_135540 - BLOCK
      ?auto_135541 - BLOCK
      ?auto_135542 - BLOCK
      ?auto_135543 - BLOCK
    )
    :vars
    (
      ?auto_135544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135536 ?auto_135537 ) ) ( not ( = ?auto_135536 ?auto_135538 ) ) ( not ( = ?auto_135536 ?auto_135539 ) ) ( not ( = ?auto_135536 ?auto_135540 ) ) ( not ( = ?auto_135536 ?auto_135541 ) ) ( not ( = ?auto_135536 ?auto_135542 ) ) ( not ( = ?auto_135536 ?auto_135543 ) ) ( not ( = ?auto_135537 ?auto_135538 ) ) ( not ( = ?auto_135537 ?auto_135539 ) ) ( not ( = ?auto_135537 ?auto_135540 ) ) ( not ( = ?auto_135537 ?auto_135541 ) ) ( not ( = ?auto_135537 ?auto_135542 ) ) ( not ( = ?auto_135537 ?auto_135543 ) ) ( not ( = ?auto_135538 ?auto_135539 ) ) ( not ( = ?auto_135538 ?auto_135540 ) ) ( not ( = ?auto_135538 ?auto_135541 ) ) ( not ( = ?auto_135538 ?auto_135542 ) ) ( not ( = ?auto_135538 ?auto_135543 ) ) ( not ( = ?auto_135539 ?auto_135540 ) ) ( not ( = ?auto_135539 ?auto_135541 ) ) ( not ( = ?auto_135539 ?auto_135542 ) ) ( not ( = ?auto_135539 ?auto_135543 ) ) ( not ( = ?auto_135540 ?auto_135541 ) ) ( not ( = ?auto_135540 ?auto_135542 ) ) ( not ( = ?auto_135540 ?auto_135543 ) ) ( not ( = ?auto_135541 ?auto_135542 ) ) ( not ( = ?auto_135541 ?auto_135543 ) ) ( not ( = ?auto_135542 ?auto_135543 ) ) ( ON-TABLE ?auto_135543 ) ( ON ?auto_135542 ?auto_135543 ) ( ON ?auto_135541 ?auto_135542 ) ( ON ?auto_135540 ?auto_135541 ) ( ON ?auto_135539 ?auto_135540 ) ( ON ?auto_135536 ?auto_135544 ) ( not ( = ?auto_135536 ?auto_135544 ) ) ( not ( = ?auto_135537 ?auto_135544 ) ) ( not ( = ?auto_135538 ?auto_135544 ) ) ( not ( = ?auto_135539 ?auto_135544 ) ) ( not ( = ?auto_135540 ?auto_135544 ) ) ( not ( = ?auto_135541 ?auto_135544 ) ) ( not ( = ?auto_135542 ?auto_135544 ) ) ( not ( = ?auto_135543 ?auto_135544 ) ) ( ON ?auto_135537 ?auto_135536 ) ( ON-TABLE ?auto_135544 ) ( CLEAR ?auto_135539 ) ( ON ?auto_135538 ?auto_135537 ) ( CLEAR ?auto_135538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135544 ?auto_135536 ?auto_135537 )
      ( MAKE-8PILE ?auto_135536 ?auto_135537 ?auto_135538 ?auto_135539 ?auto_135540 ?auto_135541 ?auto_135542 ?auto_135543 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135545 - BLOCK
      ?auto_135546 - BLOCK
      ?auto_135547 - BLOCK
      ?auto_135548 - BLOCK
      ?auto_135549 - BLOCK
      ?auto_135550 - BLOCK
      ?auto_135551 - BLOCK
      ?auto_135552 - BLOCK
    )
    :vars
    (
      ?auto_135553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135545 ?auto_135546 ) ) ( not ( = ?auto_135545 ?auto_135547 ) ) ( not ( = ?auto_135545 ?auto_135548 ) ) ( not ( = ?auto_135545 ?auto_135549 ) ) ( not ( = ?auto_135545 ?auto_135550 ) ) ( not ( = ?auto_135545 ?auto_135551 ) ) ( not ( = ?auto_135545 ?auto_135552 ) ) ( not ( = ?auto_135546 ?auto_135547 ) ) ( not ( = ?auto_135546 ?auto_135548 ) ) ( not ( = ?auto_135546 ?auto_135549 ) ) ( not ( = ?auto_135546 ?auto_135550 ) ) ( not ( = ?auto_135546 ?auto_135551 ) ) ( not ( = ?auto_135546 ?auto_135552 ) ) ( not ( = ?auto_135547 ?auto_135548 ) ) ( not ( = ?auto_135547 ?auto_135549 ) ) ( not ( = ?auto_135547 ?auto_135550 ) ) ( not ( = ?auto_135547 ?auto_135551 ) ) ( not ( = ?auto_135547 ?auto_135552 ) ) ( not ( = ?auto_135548 ?auto_135549 ) ) ( not ( = ?auto_135548 ?auto_135550 ) ) ( not ( = ?auto_135548 ?auto_135551 ) ) ( not ( = ?auto_135548 ?auto_135552 ) ) ( not ( = ?auto_135549 ?auto_135550 ) ) ( not ( = ?auto_135549 ?auto_135551 ) ) ( not ( = ?auto_135549 ?auto_135552 ) ) ( not ( = ?auto_135550 ?auto_135551 ) ) ( not ( = ?auto_135550 ?auto_135552 ) ) ( not ( = ?auto_135551 ?auto_135552 ) ) ( ON-TABLE ?auto_135552 ) ( ON ?auto_135551 ?auto_135552 ) ( ON ?auto_135550 ?auto_135551 ) ( ON ?auto_135549 ?auto_135550 ) ( ON ?auto_135545 ?auto_135553 ) ( not ( = ?auto_135545 ?auto_135553 ) ) ( not ( = ?auto_135546 ?auto_135553 ) ) ( not ( = ?auto_135547 ?auto_135553 ) ) ( not ( = ?auto_135548 ?auto_135553 ) ) ( not ( = ?auto_135549 ?auto_135553 ) ) ( not ( = ?auto_135550 ?auto_135553 ) ) ( not ( = ?auto_135551 ?auto_135553 ) ) ( not ( = ?auto_135552 ?auto_135553 ) ) ( ON ?auto_135546 ?auto_135545 ) ( ON-TABLE ?auto_135553 ) ( ON ?auto_135547 ?auto_135546 ) ( CLEAR ?auto_135547 ) ( HOLDING ?auto_135548 ) ( CLEAR ?auto_135549 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135552 ?auto_135551 ?auto_135550 ?auto_135549 ?auto_135548 )
      ( MAKE-8PILE ?auto_135545 ?auto_135546 ?auto_135547 ?auto_135548 ?auto_135549 ?auto_135550 ?auto_135551 ?auto_135552 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135554 - BLOCK
      ?auto_135555 - BLOCK
      ?auto_135556 - BLOCK
      ?auto_135557 - BLOCK
      ?auto_135558 - BLOCK
      ?auto_135559 - BLOCK
      ?auto_135560 - BLOCK
      ?auto_135561 - BLOCK
    )
    :vars
    (
      ?auto_135562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135554 ?auto_135555 ) ) ( not ( = ?auto_135554 ?auto_135556 ) ) ( not ( = ?auto_135554 ?auto_135557 ) ) ( not ( = ?auto_135554 ?auto_135558 ) ) ( not ( = ?auto_135554 ?auto_135559 ) ) ( not ( = ?auto_135554 ?auto_135560 ) ) ( not ( = ?auto_135554 ?auto_135561 ) ) ( not ( = ?auto_135555 ?auto_135556 ) ) ( not ( = ?auto_135555 ?auto_135557 ) ) ( not ( = ?auto_135555 ?auto_135558 ) ) ( not ( = ?auto_135555 ?auto_135559 ) ) ( not ( = ?auto_135555 ?auto_135560 ) ) ( not ( = ?auto_135555 ?auto_135561 ) ) ( not ( = ?auto_135556 ?auto_135557 ) ) ( not ( = ?auto_135556 ?auto_135558 ) ) ( not ( = ?auto_135556 ?auto_135559 ) ) ( not ( = ?auto_135556 ?auto_135560 ) ) ( not ( = ?auto_135556 ?auto_135561 ) ) ( not ( = ?auto_135557 ?auto_135558 ) ) ( not ( = ?auto_135557 ?auto_135559 ) ) ( not ( = ?auto_135557 ?auto_135560 ) ) ( not ( = ?auto_135557 ?auto_135561 ) ) ( not ( = ?auto_135558 ?auto_135559 ) ) ( not ( = ?auto_135558 ?auto_135560 ) ) ( not ( = ?auto_135558 ?auto_135561 ) ) ( not ( = ?auto_135559 ?auto_135560 ) ) ( not ( = ?auto_135559 ?auto_135561 ) ) ( not ( = ?auto_135560 ?auto_135561 ) ) ( ON-TABLE ?auto_135561 ) ( ON ?auto_135560 ?auto_135561 ) ( ON ?auto_135559 ?auto_135560 ) ( ON ?auto_135558 ?auto_135559 ) ( ON ?auto_135554 ?auto_135562 ) ( not ( = ?auto_135554 ?auto_135562 ) ) ( not ( = ?auto_135555 ?auto_135562 ) ) ( not ( = ?auto_135556 ?auto_135562 ) ) ( not ( = ?auto_135557 ?auto_135562 ) ) ( not ( = ?auto_135558 ?auto_135562 ) ) ( not ( = ?auto_135559 ?auto_135562 ) ) ( not ( = ?auto_135560 ?auto_135562 ) ) ( not ( = ?auto_135561 ?auto_135562 ) ) ( ON ?auto_135555 ?auto_135554 ) ( ON-TABLE ?auto_135562 ) ( ON ?auto_135556 ?auto_135555 ) ( CLEAR ?auto_135558 ) ( ON ?auto_135557 ?auto_135556 ) ( CLEAR ?auto_135557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135562 ?auto_135554 ?auto_135555 ?auto_135556 )
      ( MAKE-8PILE ?auto_135554 ?auto_135555 ?auto_135556 ?auto_135557 ?auto_135558 ?auto_135559 ?auto_135560 ?auto_135561 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135563 - BLOCK
      ?auto_135564 - BLOCK
      ?auto_135565 - BLOCK
      ?auto_135566 - BLOCK
      ?auto_135567 - BLOCK
      ?auto_135568 - BLOCK
      ?auto_135569 - BLOCK
      ?auto_135570 - BLOCK
    )
    :vars
    (
      ?auto_135571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135563 ?auto_135564 ) ) ( not ( = ?auto_135563 ?auto_135565 ) ) ( not ( = ?auto_135563 ?auto_135566 ) ) ( not ( = ?auto_135563 ?auto_135567 ) ) ( not ( = ?auto_135563 ?auto_135568 ) ) ( not ( = ?auto_135563 ?auto_135569 ) ) ( not ( = ?auto_135563 ?auto_135570 ) ) ( not ( = ?auto_135564 ?auto_135565 ) ) ( not ( = ?auto_135564 ?auto_135566 ) ) ( not ( = ?auto_135564 ?auto_135567 ) ) ( not ( = ?auto_135564 ?auto_135568 ) ) ( not ( = ?auto_135564 ?auto_135569 ) ) ( not ( = ?auto_135564 ?auto_135570 ) ) ( not ( = ?auto_135565 ?auto_135566 ) ) ( not ( = ?auto_135565 ?auto_135567 ) ) ( not ( = ?auto_135565 ?auto_135568 ) ) ( not ( = ?auto_135565 ?auto_135569 ) ) ( not ( = ?auto_135565 ?auto_135570 ) ) ( not ( = ?auto_135566 ?auto_135567 ) ) ( not ( = ?auto_135566 ?auto_135568 ) ) ( not ( = ?auto_135566 ?auto_135569 ) ) ( not ( = ?auto_135566 ?auto_135570 ) ) ( not ( = ?auto_135567 ?auto_135568 ) ) ( not ( = ?auto_135567 ?auto_135569 ) ) ( not ( = ?auto_135567 ?auto_135570 ) ) ( not ( = ?auto_135568 ?auto_135569 ) ) ( not ( = ?auto_135568 ?auto_135570 ) ) ( not ( = ?auto_135569 ?auto_135570 ) ) ( ON-TABLE ?auto_135570 ) ( ON ?auto_135569 ?auto_135570 ) ( ON ?auto_135568 ?auto_135569 ) ( ON ?auto_135563 ?auto_135571 ) ( not ( = ?auto_135563 ?auto_135571 ) ) ( not ( = ?auto_135564 ?auto_135571 ) ) ( not ( = ?auto_135565 ?auto_135571 ) ) ( not ( = ?auto_135566 ?auto_135571 ) ) ( not ( = ?auto_135567 ?auto_135571 ) ) ( not ( = ?auto_135568 ?auto_135571 ) ) ( not ( = ?auto_135569 ?auto_135571 ) ) ( not ( = ?auto_135570 ?auto_135571 ) ) ( ON ?auto_135564 ?auto_135563 ) ( ON-TABLE ?auto_135571 ) ( ON ?auto_135565 ?auto_135564 ) ( ON ?auto_135566 ?auto_135565 ) ( CLEAR ?auto_135566 ) ( HOLDING ?auto_135567 ) ( CLEAR ?auto_135568 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135570 ?auto_135569 ?auto_135568 ?auto_135567 )
      ( MAKE-8PILE ?auto_135563 ?auto_135564 ?auto_135565 ?auto_135566 ?auto_135567 ?auto_135568 ?auto_135569 ?auto_135570 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135572 - BLOCK
      ?auto_135573 - BLOCK
      ?auto_135574 - BLOCK
      ?auto_135575 - BLOCK
      ?auto_135576 - BLOCK
      ?auto_135577 - BLOCK
      ?auto_135578 - BLOCK
      ?auto_135579 - BLOCK
    )
    :vars
    (
      ?auto_135580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135572 ?auto_135573 ) ) ( not ( = ?auto_135572 ?auto_135574 ) ) ( not ( = ?auto_135572 ?auto_135575 ) ) ( not ( = ?auto_135572 ?auto_135576 ) ) ( not ( = ?auto_135572 ?auto_135577 ) ) ( not ( = ?auto_135572 ?auto_135578 ) ) ( not ( = ?auto_135572 ?auto_135579 ) ) ( not ( = ?auto_135573 ?auto_135574 ) ) ( not ( = ?auto_135573 ?auto_135575 ) ) ( not ( = ?auto_135573 ?auto_135576 ) ) ( not ( = ?auto_135573 ?auto_135577 ) ) ( not ( = ?auto_135573 ?auto_135578 ) ) ( not ( = ?auto_135573 ?auto_135579 ) ) ( not ( = ?auto_135574 ?auto_135575 ) ) ( not ( = ?auto_135574 ?auto_135576 ) ) ( not ( = ?auto_135574 ?auto_135577 ) ) ( not ( = ?auto_135574 ?auto_135578 ) ) ( not ( = ?auto_135574 ?auto_135579 ) ) ( not ( = ?auto_135575 ?auto_135576 ) ) ( not ( = ?auto_135575 ?auto_135577 ) ) ( not ( = ?auto_135575 ?auto_135578 ) ) ( not ( = ?auto_135575 ?auto_135579 ) ) ( not ( = ?auto_135576 ?auto_135577 ) ) ( not ( = ?auto_135576 ?auto_135578 ) ) ( not ( = ?auto_135576 ?auto_135579 ) ) ( not ( = ?auto_135577 ?auto_135578 ) ) ( not ( = ?auto_135577 ?auto_135579 ) ) ( not ( = ?auto_135578 ?auto_135579 ) ) ( ON-TABLE ?auto_135579 ) ( ON ?auto_135578 ?auto_135579 ) ( ON ?auto_135577 ?auto_135578 ) ( ON ?auto_135572 ?auto_135580 ) ( not ( = ?auto_135572 ?auto_135580 ) ) ( not ( = ?auto_135573 ?auto_135580 ) ) ( not ( = ?auto_135574 ?auto_135580 ) ) ( not ( = ?auto_135575 ?auto_135580 ) ) ( not ( = ?auto_135576 ?auto_135580 ) ) ( not ( = ?auto_135577 ?auto_135580 ) ) ( not ( = ?auto_135578 ?auto_135580 ) ) ( not ( = ?auto_135579 ?auto_135580 ) ) ( ON ?auto_135573 ?auto_135572 ) ( ON-TABLE ?auto_135580 ) ( ON ?auto_135574 ?auto_135573 ) ( ON ?auto_135575 ?auto_135574 ) ( CLEAR ?auto_135577 ) ( ON ?auto_135576 ?auto_135575 ) ( CLEAR ?auto_135576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135580 ?auto_135572 ?auto_135573 ?auto_135574 ?auto_135575 )
      ( MAKE-8PILE ?auto_135572 ?auto_135573 ?auto_135574 ?auto_135575 ?auto_135576 ?auto_135577 ?auto_135578 ?auto_135579 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135581 - BLOCK
      ?auto_135582 - BLOCK
      ?auto_135583 - BLOCK
      ?auto_135584 - BLOCK
      ?auto_135585 - BLOCK
      ?auto_135586 - BLOCK
      ?auto_135587 - BLOCK
      ?auto_135588 - BLOCK
    )
    :vars
    (
      ?auto_135589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135581 ?auto_135582 ) ) ( not ( = ?auto_135581 ?auto_135583 ) ) ( not ( = ?auto_135581 ?auto_135584 ) ) ( not ( = ?auto_135581 ?auto_135585 ) ) ( not ( = ?auto_135581 ?auto_135586 ) ) ( not ( = ?auto_135581 ?auto_135587 ) ) ( not ( = ?auto_135581 ?auto_135588 ) ) ( not ( = ?auto_135582 ?auto_135583 ) ) ( not ( = ?auto_135582 ?auto_135584 ) ) ( not ( = ?auto_135582 ?auto_135585 ) ) ( not ( = ?auto_135582 ?auto_135586 ) ) ( not ( = ?auto_135582 ?auto_135587 ) ) ( not ( = ?auto_135582 ?auto_135588 ) ) ( not ( = ?auto_135583 ?auto_135584 ) ) ( not ( = ?auto_135583 ?auto_135585 ) ) ( not ( = ?auto_135583 ?auto_135586 ) ) ( not ( = ?auto_135583 ?auto_135587 ) ) ( not ( = ?auto_135583 ?auto_135588 ) ) ( not ( = ?auto_135584 ?auto_135585 ) ) ( not ( = ?auto_135584 ?auto_135586 ) ) ( not ( = ?auto_135584 ?auto_135587 ) ) ( not ( = ?auto_135584 ?auto_135588 ) ) ( not ( = ?auto_135585 ?auto_135586 ) ) ( not ( = ?auto_135585 ?auto_135587 ) ) ( not ( = ?auto_135585 ?auto_135588 ) ) ( not ( = ?auto_135586 ?auto_135587 ) ) ( not ( = ?auto_135586 ?auto_135588 ) ) ( not ( = ?auto_135587 ?auto_135588 ) ) ( ON-TABLE ?auto_135588 ) ( ON ?auto_135587 ?auto_135588 ) ( ON ?auto_135581 ?auto_135589 ) ( not ( = ?auto_135581 ?auto_135589 ) ) ( not ( = ?auto_135582 ?auto_135589 ) ) ( not ( = ?auto_135583 ?auto_135589 ) ) ( not ( = ?auto_135584 ?auto_135589 ) ) ( not ( = ?auto_135585 ?auto_135589 ) ) ( not ( = ?auto_135586 ?auto_135589 ) ) ( not ( = ?auto_135587 ?auto_135589 ) ) ( not ( = ?auto_135588 ?auto_135589 ) ) ( ON ?auto_135582 ?auto_135581 ) ( ON-TABLE ?auto_135589 ) ( ON ?auto_135583 ?auto_135582 ) ( ON ?auto_135584 ?auto_135583 ) ( ON ?auto_135585 ?auto_135584 ) ( CLEAR ?auto_135585 ) ( HOLDING ?auto_135586 ) ( CLEAR ?auto_135587 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135588 ?auto_135587 ?auto_135586 )
      ( MAKE-8PILE ?auto_135581 ?auto_135582 ?auto_135583 ?auto_135584 ?auto_135585 ?auto_135586 ?auto_135587 ?auto_135588 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135590 - BLOCK
      ?auto_135591 - BLOCK
      ?auto_135592 - BLOCK
      ?auto_135593 - BLOCK
      ?auto_135594 - BLOCK
      ?auto_135595 - BLOCK
      ?auto_135596 - BLOCK
      ?auto_135597 - BLOCK
    )
    :vars
    (
      ?auto_135598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135590 ?auto_135591 ) ) ( not ( = ?auto_135590 ?auto_135592 ) ) ( not ( = ?auto_135590 ?auto_135593 ) ) ( not ( = ?auto_135590 ?auto_135594 ) ) ( not ( = ?auto_135590 ?auto_135595 ) ) ( not ( = ?auto_135590 ?auto_135596 ) ) ( not ( = ?auto_135590 ?auto_135597 ) ) ( not ( = ?auto_135591 ?auto_135592 ) ) ( not ( = ?auto_135591 ?auto_135593 ) ) ( not ( = ?auto_135591 ?auto_135594 ) ) ( not ( = ?auto_135591 ?auto_135595 ) ) ( not ( = ?auto_135591 ?auto_135596 ) ) ( not ( = ?auto_135591 ?auto_135597 ) ) ( not ( = ?auto_135592 ?auto_135593 ) ) ( not ( = ?auto_135592 ?auto_135594 ) ) ( not ( = ?auto_135592 ?auto_135595 ) ) ( not ( = ?auto_135592 ?auto_135596 ) ) ( not ( = ?auto_135592 ?auto_135597 ) ) ( not ( = ?auto_135593 ?auto_135594 ) ) ( not ( = ?auto_135593 ?auto_135595 ) ) ( not ( = ?auto_135593 ?auto_135596 ) ) ( not ( = ?auto_135593 ?auto_135597 ) ) ( not ( = ?auto_135594 ?auto_135595 ) ) ( not ( = ?auto_135594 ?auto_135596 ) ) ( not ( = ?auto_135594 ?auto_135597 ) ) ( not ( = ?auto_135595 ?auto_135596 ) ) ( not ( = ?auto_135595 ?auto_135597 ) ) ( not ( = ?auto_135596 ?auto_135597 ) ) ( ON-TABLE ?auto_135597 ) ( ON ?auto_135596 ?auto_135597 ) ( ON ?auto_135590 ?auto_135598 ) ( not ( = ?auto_135590 ?auto_135598 ) ) ( not ( = ?auto_135591 ?auto_135598 ) ) ( not ( = ?auto_135592 ?auto_135598 ) ) ( not ( = ?auto_135593 ?auto_135598 ) ) ( not ( = ?auto_135594 ?auto_135598 ) ) ( not ( = ?auto_135595 ?auto_135598 ) ) ( not ( = ?auto_135596 ?auto_135598 ) ) ( not ( = ?auto_135597 ?auto_135598 ) ) ( ON ?auto_135591 ?auto_135590 ) ( ON-TABLE ?auto_135598 ) ( ON ?auto_135592 ?auto_135591 ) ( ON ?auto_135593 ?auto_135592 ) ( ON ?auto_135594 ?auto_135593 ) ( CLEAR ?auto_135596 ) ( ON ?auto_135595 ?auto_135594 ) ( CLEAR ?auto_135595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135598 ?auto_135590 ?auto_135591 ?auto_135592 ?auto_135593 ?auto_135594 )
      ( MAKE-8PILE ?auto_135590 ?auto_135591 ?auto_135592 ?auto_135593 ?auto_135594 ?auto_135595 ?auto_135596 ?auto_135597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135599 - BLOCK
      ?auto_135600 - BLOCK
      ?auto_135601 - BLOCK
      ?auto_135602 - BLOCK
      ?auto_135603 - BLOCK
      ?auto_135604 - BLOCK
      ?auto_135605 - BLOCK
      ?auto_135606 - BLOCK
    )
    :vars
    (
      ?auto_135607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135599 ?auto_135600 ) ) ( not ( = ?auto_135599 ?auto_135601 ) ) ( not ( = ?auto_135599 ?auto_135602 ) ) ( not ( = ?auto_135599 ?auto_135603 ) ) ( not ( = ?auto_135599 ?auto_135604 ) ) ( not ( = ?auto_135599 ?auto_135605 ) ) ( not ( = ?auto_135599 ?auto_135606 ) ) ( not ( = ?auto_135600 ?auto_135601 ) ) ( not ( = ?auto_135600 ?auto_135602 ) ) ( not ( = ?auto_135600 ?auto_135603 ) ) ( not ( = ?auto_135600 ?auto_135604 ) ) ( not ( = ?auto_135600 ?auto_135605 ) ) ( not ( = ?auto_135600 ?auto_135606 ) ) ( not ( = ?auto_135601 ?auto_135602 ) ) ( not ( = ?auto_135601 ?auto_135603 ) ) ( not ( = ?auto_135601 ?auto_135604 ) ) ( not ( = ?auto_135601 ?auto_135605 ) ) ( not ( = ?auto_135601 ?auto_135606 ) ) ( not ( = ?auto_135602 ?auto_135603 ) ) ( not ( = ?auto_135602 ?auto_135604 ) ) ( not ( = ?auto_135602 ?auto_135605 ) ) ( not ( = ?auto_135602 ?auto_135606 ) ) ( not ( = ?auto_135603 ?auto_135604 ) ) ( not ( = ?auto_135603 ?auto_135605 ) ) ( not ( = ?auto_135603 ?auto_135606 ) ) ( not ( = ?auto_135604 ?auto_135605 ) ) ( not ( = ?auto_135604 ?auto_135606 ) ) ( not ( = ?auto_135605 ?auto_135606 ) ) ( ON-TABLE ?auto_135606 ) ( ON ?auto_135599 ?auto_135607 ) ( not ( = ?auto_135599 ?auto_135607 ) ) ( not ( = ?auto_135600 ?auto_135607 ) ) ( not ( = ?auto_135601 ?auto_135607 ) ) ( not ( = ?auto_135602 ?auto_135607 ) ) ( not ( = ?auto_135603 ?auto_135607 ) ) ( not ( = ?auto_135604 ?auto_135607 ) ) ( not ( = ?auto_135605 ?auto_135607 ) ) ( not ( = ?auto_135606 ?auto_135607 ) ) ( ON ?auto_135600 ?auto_135599 ) ( ON-TABLE ?auto_135607 ) ( ON ?auto_135601 ?auto_135600 ) ( ON ?auto_135602 ?auto_135601 ) ( ON ?auto_135603 ?auto_135602 ) ( ON ?auto_135604 ?auto_135603 ) ( CLEAR ?auto_135604 ) ( HOLDING ?auto_135605 ) ( CLEAR ?auto_135606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135606 ?auto_135605 )
      ( MAKE-8PILE ?auto_135599 ?auto_135600 ?auto_135601 ?auto_135602 ?auto_135603 ?auto_135604 ?auto_135605 ?auto_135606 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135608 - BLOCK
      ?auto_135609 - BLOCK
      ?auto_135610 - BLOCK
      ?auto_135611 - BLOCK
      ?auto_135612 - BLOCK
      ?auto_135613 - BLOCK
      ?auto_135614 - BLOCK
      ?auto_135615 - BLOCK
    )
    :vars
    (
      ?auto_135616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135608 ?auto_135609 ) ) ( not ( = ?auto_135608 ?auto_135610 ) ) ( not ( = ?auto_135608 ?auto_135611 ) ) ( not ( = ?auto_135608 ?auto_135612 ) ) ( not ( = ?auto_135608 ?auto_135613 ) ) ( not ( = ?auto_135608 ?auto_135614 ) ) ( not ( = ?auto_135608 ?auto_135615 ) ) ( not ( = ?auto_135609 ?auto_135610 ) ) ( not ( = ?auto_135609 ?auto_135611 ) ) ( not ( = ?auto_135609 ?auto_135612 ) ) ( not ( = ?auto_135609 ?auto_135613 ) ) ( not ( = ?auto_135609 ?auto_135614 ) ) ( not ( = ?auto_135609 ?auto_135615 ) ) ( not ( = ?auto_135610 ?auto_135611 ) ) ( not ( = ?auto_135610 ?auto_135612 ) ) ( not ( = ?auto_135610 ?auto_135613 ) ) ( not ( = ?auto_135610 ?auto_135614 ) ) ( not ( = ?auto_135610 ?auto_135615 ) ) ( not ( = ?auto_135611 ?auto_135612 ) ) ( not ( = ?auto_135611 ?auto_135613 ) ) ( not ( = ?auto_135611 ?auto_135614 ) ) ( not ( = ?auto_135611 ?auto_135615 ) ) ( not ( = ?auto_135612 ?auto_135613 ) ) ( not ( = ?auto_135612 ?auto_135614 ) ) ( not ( = ?auto_135612 ?auto_135615 ) ) ( not ( = ?auto_135613 ?auto_135614 ) ) ( not ( = ?auto_135613 ?auto_135615 ) ) ( not ( = ?auto_135614 ?auto_135615 ) ) ( ON-TABLE ?auto_135615 ) ( ON ?auto_135608 ?auto_135616 ) ( not ( = ?auto_135608 ?auto_135616 ) ) ( not ( = ?auto_135609 ?auto_135616 ) ) ( not ( = ?auto_135610 ?auto_135616 ) ) ( not ( = ?auto_135611 ?auto_135616 ) ) ( not ( = ?auto_135612 ?auto_135616 ) ) ( not ( = ?auto_135613 ?auto_135616 ) ) ( not ( = ?auto_135614 ?auto_135616 ) ) ( not ( = ?auto_135615 ?auto_135616 ) ) ( ON ?auto_135609 ?auto_135608 ) ( ON-TABLE ?auto_135616 ) ( ON ?auto_135610 ?auto_135609 ) ( ON ?auto_135611 ?auto_135610 ) ( ON ?auto_135612 ?auto_135611 ) ( ON ?auto_135613 ?auto_135612 ) ( CLEAR ?auto_135615 ) ( ON ?auto_135614 ?auto_135613 ) ( CLEAR ?auto_135614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135616 ?auto_135608 ?auto_135609 ?auto_135610 ?auto_135611 ?auto_135612 ?auto_135613 )
      ( MAKE-8PILE ?auto_135608 ?auto_135609 ?auto_135610 ?auto_135611 ?auto_135612 ?auto_135613 ?auto_135614 ?auto_135615 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135617 - BLOCK
      ?auto_135618 - BLOCK
      ?auto_135619 - BLOCK
      ?auto_135620 - BLOCK
      ?auto_135621 - BLOCK
      ?auto_135622 - BLOCK
      ?auto_135623 - BLOCK
      ?auto_135624 - BLOCK
    )
    :vars
    (
      ?auto_135625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135617 ?auto_135618 ) ) ( not ( = ?auto_135617 ?auto_135619 ) ) ( not ( = ?auto_135617 ?auto_135620 ) ) ( not ( = ?auto_135617 ?auto_135621 ) ) ( not ( = ?auto_135617 ?auto_135622 ) ) ( not ( = ?auto_135617 ?auto_135623 ) ) ( not ( = ?auto_135617 ?auto_135624 ) ) ( not ( = ?auto_135618 ?auto_135619 ) ) ( not ( = ?auto_135618 ?auto_135620 ) ) ( not ( = ?auto_135618 ?auto_135621 ) ) ( not ( = ?auto_135618 ?auto_135622 ) ) ( not ( = ?auto_135618 ?auto_135623 ) ) ( not ( = ?auto_135618 ?auto_135624 ) ) ( not ( = ?auto_135619 ?auto_135620 ) ) ( not ( = ?auto_135619 ?auto_135621 ) ) ( not ( = ?auto_135619 ?auto_135622 ) ) ( not ( = ?auto_135619 ?auto_135623 ) ) ( not ( = ?auto_135619 ?auto_135624 ) ) ( not ( = ?auto_135620 ?auto_135621 ) ) ( not ( = ?auto_135620 ?auto_135622 ) ) ( not ( = ?auto_135620 ?auto_135623 ) ) ( not ( = ?auto_135620 ?auto_135624 ) ) ( not ( = ?auto_135621 ?auto_135622 ) ) ( not ( = ?auto_135621 ?auto_135623 ) ) ( not ( = ?auto_135621 ?auto_135624 ) ) ( not ( = ?auto_135622 ?auto_135623 ) ) ( not ( = ?auto_135622 ?auto_135624 ) ) ( not ( = ?auto_135623 ?auto_135624 ) ) ( ON ?auto_135617 ?auto_135625 ) ( not ( = ?auto_135617 ?auto_135625 ) ) ( not ( = ?auto_135618 ?auto_135625 ) ) ( not ( = ?auto_135619 ?auto_135625 ) ) ( not ( = ?auto_135620 ?auto_135625 ) ) ( not ( = ?auto_135621 ?auto_135625 ) ) ( not ( = ?auto_135622 ?auto_135625 ) ) ( not ( = ?auto_135623 ?auto_135625 ) ) ( not ( = ?auto_135624 ?auto_135625 ) ) ( ON ?auto_135618 ?auto_135617 ) ( ON-TABLE ?auto_135625 ) ( ON ?auto_135619 ?auto_135618 ) ( ON ?auto_135620 ?auto_135619 ) ( ON ?auto_135621 ?auto_135620 ) ( ON ?auto_135622 ?auto_135621 ) ( ON ?auto_135623 ?auto_135622 ) ( CLEAR ?auto_135623 ) ( HOLDING ?auto_135624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135624 )
      ( MAKE-8PILE ?auto_135617 ?auto_135618 ?auto_135619 ?auto_135620 ?auto_135621 ?auto_135622 ?auto_135623 ?auto_135624 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135626 - BLOCK
      ?auto_135627 - BLOCK
      ?auto_135628 - BLOCK
      ?auto_135629 - BLOCK
      ?auto_135630 - BLOCK
      ?auto_135631 - BLOCK
      ?auto_135632 - BLOCK
      ?auto_135633 - BLOCK
    )
    :vars
    (
      ?auto_135634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135626 ?auto_135627 ) ) ( not ( = ?auto_135626 ?auto_135628 ) ) ( not ( = ?auto_135626 ?auto_135629 ) ) ( not ( = ?auto_135626 ?auto_135630 ) ) ( not ( = ?auto_135626 ?auto_135631 ) ) ( not ( = ?auto_135626 ?auto_135632 ) ) ( not ( = ?auto_135626 ?auto_135633 ) ) ( not ( = ?auto_135627 ?auto_135628 ) ) ( not ( = ?auto_135627 ?auto_135629 ) ) ( not ( = ?auto_135627 ?auto_135630 ) ) ( not ( = ?auto_135627 ?auto_135631 ) ) ( not ( = ?auto_135627 ?auto_135632 ) ) ( not ( = ?auto_135627 ?auto_135633 ) ) ( not ( = ?auto_135628 ?auto_135629 ) ) ( not ( = ?auto_135628 ?auto_135630 ) ) ( not ( = ?auto_135628 ?auto_135631 ) ) ( not ( = ?auto_135628 ?auto_135632 ) ) ( not ( = ?auto_135628 ?auto_135633 ) ) ( not ( = ?auto_135629 ?auto_135630 ) ) ( not ( = ?auto_135629 ?auto_135631 ) ) ( not ( = ?auto_135629 ?auto_135632 ) ) ( not ( = ?auto_135629 ?auto_135633 ) ) ( not ( = ?auto_135630 ?auto_135631 ) ) ( not ( = ?auto_135630 ?auto_135632 ) ) ( not ( = ?auto_135630 ?auto_135633 ) ) ( not ( = ?auto_135631 ?auto_135632 ) ) ( not ( = ?auto_135631 ?auto_135633 ) ) ( not ( = ?auto_135632 ?auto_135633 ) ) ( ON ?auto_135626 ?auto_135634 ) ( not ( = ?auto_135626 ?auto_135634 ) ) ( not ( = ?auto_135627 ?auto_135634 ) ) ( not ( = ?auto_135628 ?auto_135634 ) ) ( not ( = ?auto_135629 ?auto_135634 ) ) ( not ( = ?auto_135630 ?auto_135634 ) ) ( not ( = ?auto_135631 ?auto_135634 ) ) ( not ( = ?auto_135632 ?auto_135634 ) ) ( not ( = ?auto_135633 ?auto_135634 ) ) ( ON ?auto_135627 ?auto_135626 ) ( ON-TABLE ?auto_135634 ) ( ON ?auto_135628 ?auto_135627 ) ( ON ?auto_135629 ?auto_135628 ) ( ON ?auto_135630 ?auto_135629 ) ( ON ?auto_135631 ?auto_135630 ) ( ON ?auto_135632 ?auto_135631 ) ( ON ?auto_135633 ?auto_135632 ) ( CLEAR ?auto_135633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135634 ?auto_135626 ?auto_135627 ?auto_135628 ?auto_135629 ?auto_135630 ?auto_135631 ?auto_135632 )
      ( MAKE-8PILE ?auto_135626 ?auto_135627 ?auto_135628 ?auto_135629 ?auto_135630 ?auto_135631 ?auto_135632 ?auto_135633 ) )
  )

)

