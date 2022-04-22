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
      ?auto_116888 - BLOCK
      ?auto_116889 - BLOCK
      ?auto_116890 - BLOCK
      ?auto_116891 - BLOCK
      ?auto_116892 - BLOCK
      ?auto_116893 - BLOCK
      ?auto_116894 - BLOCK
      ?auto_116895 - BLOCK
    )
    :vars
    (
      ?auto_116896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116896 ?auto_116895 ) ( CLEAR ?auto_116896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116888 ) ( ON ?auto_116889 ?auto_116888 ) ( ON ?auto_116890 ?auto_116889 ) ( ON ?auto_116891 ?auto_116890 ) ( ON ?auto_116892 ?auto_116891 ) ( ON ?auto_116893 ?auto_116892 ) ( ON ?auto_116894 ?auto_116893 ) ( ON ?auto_116895 ?auto_116894 ) ( not ( = ?auto_116888 ?auto_116889 ) ) ( not ( = ?auto_116888 ?auto_116890 ) ) ( not ( = ?auto_116888 ?auto_116891 ) ) ( not ( = ?auto_116888 ?auto_116892 ) ) ( not ( = ?auto_116888 ?auto_116893 ) ) ( not ( = ?auto_116888 ?auto_116894 ) ) ( not ( = ?auto_116888 ?auto_116895 ) ) ( not ( = ?auto_116888 ?auto_116896 ) ) ( not ( = ?auto_116889 ?auto_116890 ) ) ( not ( = ?auto_116889 ?auto_116891 ) ) ( not ( = ?auto_116889 ?auto_116892 ) ) ( not ( = ?auto_116889 ?auto_116893 ) ) ( not ( = ?auto_116889 ?auto_116894 ) ) ( not ( = ?auto_116889 ?auto_116895 ) ) ( not ( = ?auto_116889 ?auto_116896 ) ) ( not ( = ?auto_116890 ?auto_116891 ) ) ( not ( = ?auto_116890 ?auto_116892 ) ) ( not ( = ?auto_116890 ?auto_116893 ) ) ( not ( = ?auto_116890 ?auto_116894 ) ) ( not ( = ?auto_116890 ?auto_116895 ) ) ( not ( = ?auto_116890 ?auto_116896 ) ) ( not ( = ?auto_116891 ?auto_116892 ) ) ( not ( = ?auto_116891 ?auto_116893 ) ) ( not ( = ?auto_116891 ?auto_116894 ) ) ( not ( = ?auto_116891 ?auto_116895 ) ) ( not ( = ?auto_116891 ?auto_116896 ) ) ( not ( = ?auto_116892 ?auto_116893 ) ) ( not ( = ?auto_116892 ?auto_116894 ) ) ( not ( = ?auto_116892 ?auto_116895 ) ) ( not ( = ?auto_116892 ?auto_116896 ) ) ( not ( = ?auto_116893 ?auto_116894 ) ) ( not ( = ?auto_116893 ?auto_116895 ) ) ( not ( = ?auto_116893 ?auto_116896 ) ) ( not ( = ?auto_116894 ?auto_116895 ) ) ( not ( = ?auto_116894 ?auto_116896 ) ) ( not ( = ?auto_116895 ?auto_116896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116896 ?auto_116895 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116898 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116898 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_116898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_116899 - BLOCK
    )
    :vars
    (
      ?auto_116900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116899 ?auto_116900 ) ( CLEAR ?auto_116899 ) ( HAND-EMPTY ) ( not ( = ?auto_116899 ?auto_116900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116899 ?auto_116900 )
      ( MAKE-1PILE ?auto_116899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116908 - BLOCK
      ?auto_116909 - BLOCK
      ?auto_116910 - BLOCK
      ?auto_116911 - BLOCK
      ?auto_116912 - BLOCK
      ?auto_116913 - BLOCK
      ?auto_116914 - BLOCK
    )
    :vars
    (
      ?auto_116915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116915 ?auto_116914 ) ( CLEAR ?auto_116915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116908 ) ( ON ?auto_116909 ?auto_116908 ) ( ON ?auto_116910 ?auto_116909 ) ( ON ?auto_116911 ?auto_116910 ) ( ON ?auto_116912 ?auto_116911 ) ( ON ?auto_116913 ?auto_116912 ) ( ON ?auto_116914 ?auto_116913 ) ( not ( = ?auto_116908 ?auto_116909 ) ) ( not ( = ?auto_116908 ?auto_116910 ) ) ( not ( = ?auto_116908 ?auto_116911 ) ) ( not ( = ?auto_116908 ?auto_116912 ) ) ( not ( = ?auto_116908 ?auto_116913 ) ) ( not ( = ?auto_116908 ?auto_116914 ) ) ( not ( = ?auto_116908 ?auto_116915 ) ) ( not ( = ?auto_116909 ?auto_116910 ) ) ( not ( = ?auto_116909 ?auto_116911 ) ) ( not ( = ?auto_116909 ?auto_116912 ) ) ( not ( = ?auto_116909 ?auto_116913 ) ) ( not ( = ?auto_116909 ?auto_116914 ) ) ( not ( = ?auto_116909 ?auto_116915 ) ) ( not ( = ?auto_116910 ?auto_116911 ) ) ( not ( = ?auto_116910 ?auto_116912 ) ) ( not ( = ?auto_116910 ?auto_116913 ) ) ( not ( = ?auto_116910 ?auto_116914 ) ) ( not ( = ?auto_116910 ?auto_116915 ) ) ( not ( = ?auto_116911 ?auto_116912 ) ) ( not ( = ?auto_116911 ?auto_116913 ) ) ( not ( = ?auto_116911 ?auto_116914 ) ) ( not ( = ?auto_116911 ?auto_116915 ) ) ( not ( = ?auto_116912 ?auto_116913 ) ) ( not ( = ?auto_116912 ?auto_116914 ) ) ( not ( = ?auto_116912 ?auto_116915 ) ) ( not ( = ?auto_116913 ?auto_116914 ) ) ( not ( = ?auto_116913 ?auto_116915 ) ) ( not ( = ?auto_116914 ?auto_116915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116915 ?auto_116914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116916 - BLOCK
      ?auto_116917 - BLOCK
      ?auto_116918 - BLOCK
      ?auto_116919 - BLOCK
      ?auto_116920 - BLOCK
      ?auto_116921 - BLOCK
      ?auto_116922 - BLOCK
    )
    :vars
    (
      ?auto_116923 - BLOCK
      ?auto_116924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116923 ?auto_116922 ) ( CLEAR ?auto_116923 ) ( ON-TABLE ?auto_116916 ) ( ON ?auto_116917 ?auto_116916 ) ( ON ?auto_116918 ?auto_116917 ) ( ON ?auto_116919 ?auto_116918 ) ( ON ?auto_116920 ?auto_116919 ) ( ON ?auto_116921 ?auto_116920 ) ( ON ?auto_116922 ?auto_116921 ) ( not ( = ?auto_116916 ?auto_116917 ) ) ( not ( = ?auto_116916 ?auto_116918 ) ) ( not ( = ?auto_116916 ?auto_116919 ) ) ( not ( = ?auto_116916 ?auto_116920 ) ) ( not ( = ?auto_116916 ?auto_116921 ) ) ( not ( = ?auto_116916 ?auto_116922 ) ) ( not ( = ?auto_116916 ?auto_116923 ) ) ( not ( = ?auto_116917 ?auto_116918 ) ) ( not ( = ?auto_116917 ?auto_116919 ) ) ( not ( = ?auto_116917 ?auto_116920 ) ) ( not ( = ?auto_116917 ?auto_116921 ) ) ( not ( = ?auto_116917 ?auto_116922 ) ) ( not ( = ?auto_116917 ?auto_116923 ) ) ( not ( = ?auto_116918 ?auto_116919 ) ) ( not ( = ?auto_116918 ?auto_116920 ) ) ( not ( = ?auto_116918 ?auto_116921 ) ) ( not ( = ?auto_116918 ?auto_116922 ) ) ( not ( = ?auto_116918 ?auto_116923 ) ) ( not ( = ?auto_116919 ?auto_116920 ) ) ( not ( = ?auto_116919 ?auto_116921 ) ) ( not ( = ?auto_116919 ?auto_116922 ) ) ( not ( = ?auto_116919 ?auto_116923 ) ) ( not ( = ?auto_116920 ?auto_116921 ) ) ( not ( = ?auto_116920 ?auto_116922 ) ) ( not ( = ?auto_116920 ?auto_116923 ) ) ( not ( = ?auto_116921 ?auto_116922 ) ) ( not ( = ?auto_116921 ?auto_116923 ) ) ( not ( = ?auto_116922 ?auto_116923 ) ) ( HOLDING ?auto_116924 ) ( not ( = ?auto_116916 ?auto_116924 ) ) ( not ( = ?auto_116917 ?auto_116924 ) ) ( not ( = ?auto_116918 ?auto_116924 ) ) ( not ( = ?auto_116919 ?auto_116924 ) ) ( not ( = ?auto_116920 ?auto_116924 ) ) ( not ( = ?auto_116921 ?auto_116924 ) ) ( not ( = ?auto_116922 ?auto_116924 ) ) ( not ( = ?auto_116923 ?auto_116924 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_116924 )
      ( MAKE-7PILE ?auto_116916 ?auto_116917 ?auto_116918 ?auto_116919 ?auto_116920 ?auto_116921 ?auto_116922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_116925 - BLOCK
      ?auto_116926 - BLOCK
      ?auto_116927 - BLOCK
      ?auto_116928 - BLOCK
      ?auto_116929 - BLOCK
      ?auto_116930 - BLOCK
      ?auto_116931 - BLOCK
    )
    :vars
    (
      ?auto_116933 - BLOCK
      ?auto_116932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116933 ?auto_116931 ) ( ON-TABLE ?auto_116925 ) ( ON ?auto_116926 ?auto_116925 ) ( ON ?auto_116927 ?auto_116926 ) ( ON ?auto_116928 ?auto_116927 ) ( ON ?auto_116929 ?auto_116928 ) ( ON ?auto_116930 ?auto_116929 ) ( ON ?auto_116931 ?auto_116930 ) ( not ( = ?auto_116925 ?auto_116926 ) ) ( not ( = ?auto_116925 ?auto_116927 ) ) ( not ( = ?auto_116925 ?auto_116928 ) ) ( not ( = ?auto_116925 ?auto_116929 ) ) ( not ( = ?auto_116925 ?auto_116930 ) ) ( not ( = ?auto_116925 ?auto_116931 ) ) ( not ( = ?auto_116925 ?auto_116933 ) ) ( not ( = ?auto_116926 ?auto_116927 ) ) ( not ( = ?auto_116926 ?auto_116928 ) ) ( not ( = ?auto_116926 ?auto_116929 ) ) ( not ( = ?auto_116926 ?auto_116930 ) ) ( not ( = ?auto_116926 ?auto_116931 ) ) ( not ( = ?auto_116926 ?auto_116933 ) ) ( not ( = ?auto_116927 ?auto_116928 ) ) ( not ( = ?auto_116927 ?auto_116929 ) ) ( not ( = ?auto_116927 ?auto_116930 ) ) ( not ( = ?auto_116927 ?auto_116931 ) ) ( not ( = ?auto_116927 ?auto_116933 ) ) ( not ( = ?auto_116928 ?auto_116929 ) ) ( not ( = ?auto_116928 ?auto_116930 ) ) ( not ( = ?auto_116928 ?auto_116931 ) ) ( not ( = ?auto_116928 ?auto_116933 ) ) ( not ( = ?auto_116929 ?auto_116930 ) ) ( not ( = ?auto_116929 ?auto_116931 ) ) ( not ( = ?auto_116929 ?auto_116933 ) ) ( not ( = ?auto_116930 ?auto_116931 ) ) ( not ( = ?auto_116930 ?auto_116933 ) ) ( not ( = ?auto_116931 ?auto_116933 ) ) ( not ( = ?auto_116925 ?auto_116932 ) ) ( not ( = ?auto_116926 ?auto_116932 ) ) ( not ( = ?auto_116927 ?auto_116932 ) ) ( not ( = ?auto_116928 ?auto_116932 ) ) ( not ( = ?auto_116929 ?auto_116932 ) ) ( not ( = ?auto_116930 ?auto_116932 ) ) ( not ( = ?auto_116931 ?auto_116932 ) ) ( not ( = ?auto_116933 ?auto_116932 ) ) ( ON ?auto_116932 ?auto_116933 ) ( CLEAR ?auto_116932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_116925 ?auto_116926 ?auto_116927 ?auto_116928 ?auto_116929 ?auto_116930 ?auto_116931 ?auto_116933 )
      ( MAKE-7PILE ?auto_116925 ?auto_116926 ?auto_116927 ?auto_116928 ?auto_116929 ?auto_116930 ?auto_116931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116936 - BLOCK
      ?auto_116937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_116937 ) ( CLEAR ?auto_116936 ) ( ON-TABLE ?auto_116936 ) ( not ( = ?auto_116936 ?auto_116937 ) ) )
    :subtasks
    ( ( !STACK ?auto_116937 ?auto_116936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116938 - BLOCK
      ?auto_116939 - BLOCK
    )
    :vars
    (
      ?auto_116940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_116938 ) ( ON-TABLE ?auto_116938 ) ( not ( = ?auto_116938 ?auto_116939 ) ) ( ON ?auto_116939 ?auto_116940 ) ( CLEAR ?auto_116939 ) ( HAND-EMPTY ) ( not ( = ?auto_116938 ?auto_116940 ) ) ( not ( = ?auto_116939 ?auto_116940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116939 ?auto_116940 )
      ( MAKE-2PILE ?auto_116938 ?auto_116939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116941 - BLOCK
      ?auto_116942 - BLOCK
    )
    :vars
    (
      ?auto_116943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116941 ?auto_116942 ) ) ( ON ?auto_116942 ?auto_116943 ) ( CLEAR ?auto_116942 ) ( not ( = ?auto_116941 ?auto_116943 ) ) ( not ( = ?auto_116942 ?auto_116943 ) ) ( HOLDING ?auto_116941 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116941 )
      ( MAKE-2PILE ?auto_116941 ?auto_116942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_116944 - BLOCK
      ?auto_116945 - BLOCK
    )
    :vars
    (
      ?auto_116946 - BLOCK
      ?auto_116947 - BLOCK
      ?auto_116952 - BLOCK
      ?auto_116950 - BLOCK
      ?auto_116948 - BLOCK
      ?auto_116949 - BLOCK
      ?auto_116951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_116944 ?auto_116945 ) ) ( ON ?auto_116945 ?auto_116946 ) ( not ( = ?auto_116944 ?auto_116946 ) ) ( not ( = ?auto_116945 ?auto_116946 ) ) ( ON ?auto_116944 ?auto_116945 ) ( CLEAR ?auto_116944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116947 ) ( ON ?auto_116952 ?auto_116947 ) ( ON ?auto_116950 ?auto_116952 ) ( ON ?auto_116948 ?auto_116950 ) ( ON ?auto_116949 ?auto_116948 ) ( ON ?auto_116951 ?auto_116949 ) ( ON ?auto_116946 ?auto_116951 ) ( not ( = ?auto_116947 ?auto_116952 ) ) ( not ( = ?auto_116947 ?auto_116950 ) ) ( not ( = ?auto_116947 ?auto_116948 ) ) ( not ( = ?auto_116947 ?auto_116949 ) ) ( not ( = ?auto_116947 ?auto_116951 ) ) ( not ( = ?auto_116947 ?auto_116946 ) ) ( not ( = ?auto_116947 ?auto_116945 ) ) ( not ( = ?auto_116947 ?auto_116944 ) ) ( not ( = ?auto_116952 ?auto_116950 ) ) ( not ( = ?auto_116952 ?auto_116948 ) ) ( not ( = ?auto_116952 ?auto_116949 ) ) ( not ( = ?auto_116952 ?auto_116951 ) ) ( not ( = ?auto_116952 ?auto_116946 ) ) ( not ( = ?auto_116952 ?auto_116945 ) ) ( not ( = ?auto_116952 ?auto_116944 ) ) ( not ( = ?auto_116950 ?auto_116948 ) ) ( not ( = ?auto_116950 ?auto_116949 ) ) ( not ( = ?auto_116950 ?auto_116951 ) ) ( not ( = ?auto_116950 ?auto_116946 ) ) ( not ( = ?auto_116950 ?auto_116945 ) ) ( not ( = ?auto_116950 ?auto_116944 ) ) ( not ( = ?auto_116948 ?auto_116949 ) ) ( not ( = ?auto_116948 ?auto_116951 ) ) ( not ( = ?auto_116948 ?auto_116946 ) ) ( not ( = ?auto_116948 ?auto_116945 ) ) ( not ( = ?auto_116948 ?auto_116944 ) ) ( not ( = ?auto_116949 ?auto_116951 ) ) ( not ( = ?auto_116949 ?auto_116946 ) ) ( not ( = ?auto_116949 ?auto_116945 ) ) ( not ( = ?auto_116949 ?auto_116944 ) ) ( not ( = ?auto_116951 ?auto_116946 ) ) ( not ( = ?auto_116951 ?auto_116945 ) ) ( not ( = ?auto_116951 ?auto_116944 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_116947 ?auto_116952 ?auto_116950 ?auto_116948 ?auto_116949 ?auto_116951 ?auto_116946 ?auto_116945 )
      ( MAKE-2PILE ?auto_116944 ?auto_116945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116959 - BLOCK
      ?auto_116960 - BLOCK
      ?auto_116961 - BLOCK
      ?auto_116962 - BLOCK
      ?auto_116963 - BLOCK
      ?auto_116964 - BLOCK
    )
    :vars
    (
      ?auto_116965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116965 ?auto_116964 ) ( CLEAR ?auto_116965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_116959 ) ( ON ?auto_116960 ?auto_116959 ) ( ON ?auto_116961 ?auto_116960 ) ( ON ?auto_116962 ?auto_116961 ) ( ON ?auto_116963 ?auto_116962 ) ( ON ?auto_116964 ?auto_116963 ) ( not ( = ?auto_116959 ?auto_116960 ) ) ( not ( = ?auto_116959 ?auto_116961 ) ) ( not ( = ?auto_116959 ?auto_116962 ) ) ( not ( = ?auto_116959 ?auto_116963 ) ) ( not ( = ?auto_116959 ?auto_116964 ) ) ( not ( = ?auto_116959 ?auto_116965 ) ) ( not ( = ?auto_116960 ?auto_116961 ) ) ( not ( = ?auto_116960 ?auto_116962 ) ) ( not ( = ?auto_116960 ?auto_116963 ) ) ( not ( = ?auto_116960 ?auto_116964 ) ) ( not ( = ?auto_116960 ?auto_116965 ) ) ( not ( = ?auto_116961 ?auto_116962 ) ) ( not ( = ?auto_116961 ?auto_116963 ) ) ( not ( = ?auto_116961 ?auto_116964 ) ) ( not ( = ?auto_116961 ?auto_116965 ) ) ( not ( = ?auto_116962 ?auto_116963 ) ) ( not ( = ?auto_116962 ?auto_116964 ) ) ( not ( = ?auto_116962 ?auto_116965 ) ) ( not ( = ?auto_116963 ?auto_116964 ) ) ( not ( = ?auto_116963 ?auto_116965 ) ) ( not ( = ?auto_116964 ?auto_116965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_116965 ?auto_116964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116966 - BLOCK
      ?auto_116967 - BLOCK
      ?auto_116968 - BLOCK
      ?auto_116969 - BLOCK
      ?auto_116970 - BLOCK
      ?auto_116971 - BLOCK
    )
    :vars
    (
      ?auto_116972 - BLOCK
      ?auto_116973 - BLOCK
      ?auto_116974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116972 ?auto_116971 ) ( CLEAR ?auto_116972 ) ( ON-TABLE ?auto_116966 ) ( ON ?auto_116967 ?auto_116966 ) ( ON ?auto_116968 ?auto_116967 ) ( ON ?auto_116969 ?auto_116968 ) ( ON ?auto_116970 ?auto_116969 ) ( ON ?auto_116971 ?auto_116970 ) ( not ( = ?auto_116966 ?auto_116967 ) ) ( not ( = ?auto_116966 ?auto_116968 ) ) ( not ( = ?auto_116966 ?auto_116969 ) ) ( not ( = ?auto_116966 ?auto_116970 ) ) ( not ( = ?auto_116966 ?auto_116971 ) ) ( not ( = ?auto_116966 ?auto_116972 ) ) ( not ( = ?auto_116967 ?auto_116968 ) ) ( not ( = ?auto_116967 ?auto_116969 ) ) ( not ( = ?auto_116967 ?auto_116970 ) ) ( not ( = ?auto_116967 ?auto_116971 ) ) ( not ( = ?auto_116967 ?auto_116972 ) ) ( not ( = ?auto_116968 ?auto_116969 ) ) ( not ( = ?auto_116968 ?auto_116970 ) ) ( not ( = ?auto_116968 ?auto_116971 ) ) ( not ( = ?auto_116968 ?auto_116972 ) ) ( not ( = ?auto_116969 ?auto_116970 ) ) ( not ( = ?auto_116969 ?auto_116971 ) ) ( not ( = ?auto_116969 ?auto_116972 ) ) ( not ( = ?auto_116970 ?auto_116971 ) ) ( not ( = ?auto_116970 ?auto_116972 ) ) ( not ( = ?auto_116971 ?auto_116972 ) ) ( HOLDING ?auto_116973 ) ( CLEAR ?auto_116974 ) ( not ( = ?auto_116966 ?auto_116973 ) ) ( not ( = ?auto_116966 ?auto_116974 ) ) ( not ( = ?auto_116967 ?auto_116973 ) ) ( not ( = ?auto_116967 ?auto_116974 ) ) ( not ( = ?auto_116968 ?auto_116973 ) ) ( not ( = ?auto_116968 ?auto_116974 ) ) ( not ( = ?auto_116969 ?auto_116973 ) ) ( not ( = ?auto_116969 ?auto_116974 ) ) ( not ( = ?auto_116970 ?auto_116973 ) ) ( not ( = ?auto_116970 ?auto_116974 ) ) ( not ( = ?auto_116971 ?auto_116973 ) ) ( not ( = ?auto_116971 ?auto_116974 ) ) ( not ( = ?auto_116972 ?auto_116973 ) ) ( not ( = ?auto_116972 ?auto_116974 ) ) ( not ( = ?auto_116973 ?auto_116974 ) ) )
    :subtasks
    ( ( !STACK ?auto_116973 ?auto_116974 )
      ( MAKE-6PILE ?auto_116966 ?auto_116967 ?auto_116968 ?auto_116969 ?auto_116970 ?auto_116971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118306 - BLOCK
      ?auto_118307 - BLOCK
      ?auto_118308 - BLOCK
      ?auto_118309 - BLOCK
      ?auto_118310 - BLOCK
      ?auto_118311 - BLOCK
    )
    :vars
    (
      ?auto_118312 - BLOCK
      ?auto_118313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118312 ?auto_118311 ) ( ON-TABLE ?auto_118306 ) ( ON ?auto_118307 ?auto_118306 ) ( ON ?auto_118308 ?auto_118307 ) ( ON ?auto_118309 ?auto_118308 ) ( ON ?auto_118310 ?auto_118309 ) ( ON ?auto_118311 ?auto_118310 ) ( not ( = ?auto_118306 ?auto_118307 ) ) ( not ( = ?auto_118306 ?auto_118308 ) ) ( not ( = ?auto_118306 ?auto_118309 ) ) ( not ( = ?auto_118306 ?auto_118310 ) ) ( not ( = ?auto_118306 ?auto_118311 ) ) ( not ( = ?auto_118306 ?auto_118312 ) ) ( not ( = ?auto_118307 ?auto_118308 ) ) ( not ( = ?auto_118307 ?auto_118309 ) ) ( not ( = ?auto_118307 ?auto_118310 ) ) ( not ( = ?auto_118307 ?auto_118311 ) ) ( not ( = ?auto_118307 ?auto_118312 ) ) ( not ( = ?auto_118308 ?auto_118309 ) ) ( not ( = ?auto_118308 ?auto_118310 ) ) ( not ( = ?auto_118308 ?auto_118311 ) ) ( not ( = ?auto_118308 ?auto_118312 ) ) ( not ( = ?auto_118309 ?auto_118310 ) ) ( not ( = ?auto_118309 ?auto_118311 ) ) ( not ( = ?auto_118309 ?auto_118312 ) ) ( not ( = ?auto_118310 ?auto_118311 ) ) ( not ( = ?auto_118310 ?auto_118312 ) ) ( not ( = ?auto_118311 ?auto_118312 ) ) ( not ( = ?auto_118306 ?auto_118313 ) ) ( not ( = ?auto_118307 ?auto_118313 ) ) ( not ( = ?auto_118308 ?auto_118313 ) ) ( not ( = ?auto_118309 ?auto_118313 ) ) ( not ( = ?auto_118310 ?auto_118313 ) ) ( not ( = ?auto_118311 ?auto_118313 ) ) ( not ( = ?auto_118312 ?auto_118313 ) ) ( ON ?auto_118313 ?auto_118312 ) ( CLEAR ?auto_118313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118306 ?auto_118307 ?auto_118308 ?auto_118309 ?auto_118310 ?auto_118311 ?auto_118312 )
      ( MAKE-6PILE ?auto_118306 ?auto_118307 ?auto_118308 ?auto_118309 ?auto_118310 ?auto_118311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116984 - BLOCK
      ?auto_116985 - BLOCK
      ?auto_116986 - BLOCK
      ?auto_116987 - BLOCK
      ?auto_116988 - BLOCK
      ?auto_116989 - BLOCK
    )
    :vars
    (
      ?auto_116991 - BLOCK
      ?auto_116992 - BLOCK
      ?auto_116990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_116991 ?auto_116989 ) ( ON-TABLE ?auto_116984 ) ( ON ?auto_116985 ?auto_116984 ) ( ON ?auto_116986 ?auto_116985 ) ( ON ?auto_116987 ?auto_116986 ) ( ON ?auto_116988 ?auto_116987 ) ( ON ?auto_116989 ?auto_116988 ) ( not ( = ?auto_116984 ?auto_116985 ) ) ( not ( = ?auto_116984 ?auto_116986 ) ) ( not ( = ?auto_116984 ?auto_116987 ) ) ( not ( = ?auto_116984 ?auto_116988 ) ) ( not ( = ?auto_116984 ?auto_116989 ) ) ( not ( = ?auto_116984 ?auto_116991 ) ) ( not ( = ?auto_116985 ?auto_116986 ) ) ( not ( = ?auto_116985 ?auto_116987 ) ) ( not ( = ?auto_116985 ?auto_116988 ) ) ( not ( = ?auto_116985 ?auto_116989 ) ) ( not ( = ?auto_116985 ?auto_116991 ) ) ( not ( = ?auto_116986 ?auto_116987 ) ) ( not ( = ?auto_116986 ?auto_116988 ) ) ( not ( = ?auto_116986 ?auto_116989 ) ) ( not ( = ?auto_116986 ?auto_116991 ) ) ( not ( = ?auto_116987 ?auto_116988 ) ) ( not ( = ?auto_116987 ?auto_116989 ) ) ( not ( = ?auto_116987 ?auto_116991 ) ) ( not ( = ?auto_116988 ?auto_116989 ) ) ( not ( = ?auto_116988 ?auto_116991 ) ) ( not ( = ?auto_116989 ?auto_116991 ) ) ( not ( = ?auto_116984 ?auto_116992 ) ) ( not ( = ?auto_116984 ?auto_116990 ) ) ( not ( = ?auto_116985 ?auto_116992 ) ) ( not ( = ?auto_116985 ?auto_116990 ) ) ( not ( = ?auto_116986 ?auto_116992 ) ) ( not ( = ?auto_116986 ?auto_116990 ) ) ( not ( = ?auto_116987 ?auto_116992 ) ) ( not ( = ?auto_116987 ?auto_116990 ) ) ( not ( = ?auto_116988 ?auto_116992 ) ) ( not ( = ?auto_116988 ?auto_116990 ) ) ( not ( = ?auto_116989 ?auto_116992 ) ) ( not ( = ?auto_116989 ?auto_116990 ) ) ( not ( = ?auto_116991 ?auto_116992 ) ) ( not ( = ?auto_116991 ?auto_116990 ) ) ( not ( = ?auto_116992 ?auto_116990 ) ) ( ON ?auto_116992 ?auto_116991 ) ( CLEAR ?auto_116992 ) ( HOLDING ?auto_116990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_116990 )
      ( MAKE-6PILE ?auto_116984 ?auto_116985 ?auto_116986 ?auto_116987 ?auto_116988 ?auto_116989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_116993 - BLOCK
      ?auto_116994 - BLOCK
      ?auto_116995 - BLOCK
      ?auto_116996 - BLOCK
      ?auto_116997 - BLOCK
      ?auto_116998 - BLOCK
    )
    :vars
    (
      ?auto_117001 - BLOCK
      ?auto_117000 - BLOCK
      ?auto_116999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117001 ?auto_116998 ) ( ON-TABLE ?auto_116993 ) ( ON ?auto_116994 ?auto_116993 ) ( ON ?auto_116995 ?auto_116994 ) ( ON ?auto_116996 ?auto_116995 ) ( ON ?auto_116997 ?auto_116996 ) ( ON ?auto_116998 ?auto_116997 ) ( not ( = ?auto_116993 ?auto_116994 ) ) ( not ( = ?auto_116993 ?auto_116995 ) ) ( not ( = ?auto_116993 ?auto_116996 ) ) ( not ( = ?auto_116993 ?auto_116997 ) ) ( not ( = ?auto_116993 ?auto_116998 ) ) ( not ( = ?auto_116993 ?auto_117001 ) ) ( not ( = ?auto_116994 ?auto_116995 ) ) ( not ( = ?auto_116994 ?auto_116996 ) ) ( not ( = ?auto_116994 ?auto_116997 ) ) ( not ( = ?auto_116994 ?auto_116998 ) ) ( not ( = ?auto_116994 ?auto_117001 ) ) ( not ( = ?auto_116995 ?auto_116996 ) ) ( not ( = ?auto_116995 ?auto_116997 ) ) ( not ( = ?auto_116995 ?auto_116998 ) ) ( not ( = ?auto_116995 ?auto_117001 ) ) ( not ( = ?auto_116996 ?auto_116997 ) ) ( not ( = ?auto_116996 ?auto_116998 ) ) ( not ( = ?auto_116996 ?auto_117001 ) ) ( not ( = ?auto_116997 ?auto_116998 ) ) ( not ( = ?auto_116997 ?auto_117001 ) ) ( not ( = ?auto_116998 ?auto_117001 ) ) ( not ( = ?auto_116993 ?auto_117000 ) ) ( not ( = ?auto_116993 ?auto_116999 ) ) ( not ( = ?auto_116994 ?auto_117000 ) ) ( not ( = ?auto_116994 ?auto_116999 ) ) ( not ( = ?auto_116995 ?auto_117000 ) ) ( not ( = ?auto_116995 ?auto_116999 ) ) ( not ( = ?auto_116996 ?auto_117000 ) ) ( not ( = ?auto_116996 ?auto_116999 ) ) ( not ( = ?auto_116997 ?auto_117000 ) ) ( not ( = ?auto_116997 ?auto_116999 ) ) ( not ( = ?auto_116998 ?auto_117000 ) ) ( not ( = ?auto_116998 ?auto_116999 ) ) ( not ( = ?auto_117001 ?auto_117000 ) ) ( not ( = ?auto_117001 ?auto_116999 ) ) ( not ( = ?auto_117000 ?auto_116999 ) ) ( ON ?auto_117000 ?auto_117001 ) ( ON ?auto_116999 ?auto_117000 ) ( CLEAR ?auto_116999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_116993 ?auto_116994 ?auto_116995 ?auto_116996 ?auto_116997 ?auto_116998 ?auto_117001 ?auto_117000 )
      ( MAKE-6PILE ?auto_116993 ?auto_116994 ?auto_116995 ?auto_116996 ?auto_116997 ?auto_116998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117005 - BLOCK
      ?auto_117006 - BLOCK
      ?auto_117007 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117007 ) ( CLEAR ?auto_117006 ) ( ON-TABLE ?auto_117005 ) ( ON ?auto_117006 ?auto_117005 ) ( not ( = ?auto_117005 ?auto_117006 ) ) ( not ( = ?auto_117005 ?auto_117007 ) ) ( not ( = ?auto_117006 ?auto_117007 ) ) )
    :subtasks
    ( ( !STACK ?auto_117007 ?auto_117006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117008 - BLOCK
      ?auto_117009 - BLOCK
      ?auto_117010 - BLOCK
    )
    :vars
    (
      ?auto_117011 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117009 ) ( ON-TABLE ?auto_117008 ) ( ON ?auto_117009 ?auto_117008 ) ( not ( = ?auto_117008 ?auto_117009 ) ) ( not ( = ?auto_117008 ?auto_117010 ) ) ( not ( = ?auto_117009 ?auto_117010 ) ) ( ON ?auto_117010 ?auto_117011 ) ( CLEAR ?auto_117010 ) ( HAND-EMPTY ) ( not ( = ?auto_117008 ?auto_117011 ) ) ( not ( = ?auto_117009 ?auto_117011 ) ) ( not ( = ?auto_117010 ?auto_117011 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117010 ?auto_117011 )
      ( MAKE-3PILE ?auto_117008 ?auto_117009 ?auto_117010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117012 - BLOCK
      ?auto_117013 - BLOCK
      ?auto_117014 - BLOCK
    )
    :vars
    (
      ?auto_117015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117012 ) ( not ( = ?auto_117012 ?auto_117013 ) ) ( not ( = ?auto_117012 ?auto_117014 ) ) ( not ( = ?auto_117013 ?auto_117014 ) ) ( ON ?auto_117014 ?auto_117015 ) ( CLEAR ?auto_117014 ) ( not ( = ?auto_117012 ?auto_117015 ) ) ( not ( = ?auto_117013 ?auto_117015 ) ) ( not ( = ?auto_117014 ?auto_117015 ) ) ( HOLDING ?auto_117013 ) ( CLEAR ?auto_117012 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117012 ?auto_117013 )
      ( MAKE-3PILE ?auto_117012 ?auto_117013 ?auto_117014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117016 - BLOCK
      ?auto_117017 - BLOCK
      ?auto_117018 - BLOCK
    )
    :vars
    (
      ?auto_117019 - BLOCK
      ?auto_117021 - BLOCK
      ?auto_117022 - BLOCK
      ?auto_117023 - BLOCK
      ?auto_117020 - BLOCK
      ?auto_117024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117016 ) ( not ( = ?auto_117016 ?auto_117017 ) ) ( not ( = ?auto_117016 ?auto_117018 ) ) ( not ( = ?auto_117017 ?auto_117018 ) ) ( ON ?auto_117018 ?auto_117019 ) ( not ( = ?auto_117016 ?auto_117019 ) ) ( not ( = ?auto_117017 ?auto_117019 ) ) ( not ( = ?auto_117018 ?auto_117019 ) ) ( CLEAR ?auto_117016 ) ( ON ?auto_117017 ?auto_117018 ) ( CLEAR ?auto_117017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117021 ) ( ON ?auto_117022 ?auto_117021 ) ( ON ?auto_117023 ?auto_117022 ) ( ON ?auto_117020 ?auto_117023 ) ( ON ?auto_117024 ?auto_117020 ) ( ON ?auto_117019 ?auto_117024 ) ( not ( = ?auto_117021 ?auto_117022 ) ) ( not ( = ?auto_117021 ?auto_117023 ) ) ( not ( = ?auto_117021 ?auto_117020 ) ) ( not ( = ?auto_117021 ?auto_117024 ) ) ( not ( = ?auto_117021 ?auto_117019 ) ) ( not ( = ?auto_117021 ?auto_117018 ) ) ( not ( = ?auto_117021 ?auto_117017 ) ) ( not ( = ?auto_117022 ?auto_117023 ) ) ( not ( = ?auto_117022 ?auto_117020 ) ) ( not ( = ?auto_117022 ?auto_117024 ) ) ( not ( = ?auto_117022 ?auto_117019 ) ) ( not ( = ?auto_117022 ?auto_117018 ) ) ( not ( = ?auto_117022 ?auto_117017 ) ) ( not ( = ?auto_117023 ?auto_117020 ) ) ( not ( = ?auto_117023 ?auto_117024 ) ) ( not ( = ?auto_117023 ?auto_117019 ) ) ( not ( = ?auto_117023 ?auto_117018 ) ) ( not ( = ?auto_117023 ?auto_117017 ) ) ( not ( = ?auto_117020 ?auto_117024 ) ) ( not ( = ?auto_117020 ?auto_117019 ) ) ( not ( = ?auto_117020 ?auto_117018 ) ) ( not ( = ?auto_117020 ?auto_117017 ) ) ( not ( = ?auto_117024 ?auto_117019 ) ) ( not ( = ?auto_117024 ?auto_117018 ) ) ( not ( = ?auto_117024 ?auto_117017 ) ) ( not ( = ?auto_117016 ?auto_117021 ) ) ( not ( = ?auto_117016 ?auto_117022 ) ) ( not ( = ?auto_117016 ?auto_117023 ) ) ( not ( = ?auto_117016 ?auto_117020 ) ) ( not ( = ?auto_117016 ?auto_117024 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117021 ?auto_117022 ?auto_117023 ?auto_117020 ?auto_117024 ?auto_117019 ?auto_117018 )
      ( MAKE-3PILE ?auto_117016 ?auto_117017 ?auto_117018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117025 - BLOCK
      ?auto_117026 - BLOCK
      ?auto_117027 - BLOCK
    )
    :vars
    (
      ?auto_117032 - BLOCK
      ?auto_117030 - BLOCK
      ?auto_117031 - BLOCK
      ?auto_117029 - BLOCK
      ?auto_117033 - BLOCK
      ?auto_117028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117025 ?auto_117026 ) ) ( not ( = ?auto_117025 ?auto_117027 ) ) ( not ( = ?auto_117026 ?auto_117027 ) ) ( ON ?auto_117027 ?auto_117032 ) ( not ( = ?auto_117025 ?auto_117032 ) ) ( not ( = ?auto_117026 ?auto_117032 ) ) ( not ( = ?auto_117027 ?auto_117032 ) ) ( ON ?auto_117026 ?auto_117027 ) ( CLEAR ?auto_117026 ) ( ON-TABLE ?auto_117030 ) ( ON ?auto_117031 ?auto_117030 ) ( ON ?auto_117029 ?auto_117031 ) ( ON ?auto_117033 ?auto_117029 ) ( ON ?auto_117028 ?auto_117033 ) ( ON ?auto_117032 ?auto_117028 ) ( not ( = ?auto_117030 ?auto_117031 ) ) ( not ( = ?auto_117030 ?auto_117029 ) ) ( not ( = ?auto_117030 ?auto_117033 ) ) ( not ( = ?auto_117030 ?auto_117028 ) ) ( not ( = ?auto_117030 ?auto_117032 ) ) ( not ( = ?auto_117030 ?auto_117027 ) ) ( not ( = ?auto_117030 ?auto_117026 ) ) ( not ( = ?auto_117031 ?auto_117029 ) ) ( not ( = ?auto_117031 ?auto_117033 ) ) ( not ( = ?auto_117031 ?auto_117028 ) ) ( not ( = ?auto_117031 ?auto_117032 ) ) ( not ( = ?auto_117031 ?auto_117027 ) ) ( not ( = ?auto_117031 ?auto_117026 ) ) ( not ( = ?auto_117029 ?auto_117033 ) ) ( not ( = ?auto_117029 ?auto_117028 ) ) ( not ( = ?auto_117029 ?auto_117032 ) ) ( not ( = ?auto_117029 ?auto_117027 ) ) ( not ( = ?auto_117029 ?auto_117026 ) ) ( not ( = ?auto_117033 ?auto_117028 ) ) ( not ( = ?auto_117033 ?auto_117032 ) ) ( not ( = ?auto_117033 ?auto_117027 ) ) ( not ( = ?auto_117033 ?auto_117026 ) ) ( not ( = ?auto_117028 ?auto_117032 ) ) ( not ( = ?auto_117028 ?auto_117027 ) ) ( not ( = ?auto_117028 ?auto_117026 ) ) ( not ( = ?auto_117025 ?auto_117030 ) ) ( not ( = ?auto_117025 ?auto_117031 ) ) ( not ( = ?auto_117025 ?auto_117029 ) ) ( not ( = ?auto_117025 ?auto_117033 ) ) ( not ( = ?auto_117025 ?auto_117028 ) ) ( HOLDING ?auto_117025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117025 )
      ( MAKE-3PILE ?auto_117025 ?auto_117026 ?auto_117027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117034 - BLOCK
      ?auto_117035 - BLOCK
      ?auto_117036 - BLOCK
    )
    :vars
    (
      ?auto_117040 - BLOCK
      ?auto_117041 - BLOCK
      ?auto_117038 - BLOCK
      ?auto_117042 - BLOCK
      ?auto_117039 - BLOCK
      ?auto_117037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117034 ?auto_117035 ) ) ( not ( = ?auto_117034 ?auto_117036 ) ) ( not ( = ?auto_117035 ?auto_117036 ) ) ( ON ?auto_117036 ?auto_117040 ) ( not ( = ?auto_117034 ?auto_117040 ) ) ( not ( = ?auto_117035 ?auto_117040 ) ) ( not ( = ?auto_117036 ?auto_117040 ) ) ( ON ?auto_117035 ?auto_117036 ) ( ON-TABLE ?auto_117041 ) ( ON ?auto_117038 ?auto_117041 ) ( ON ?auto_117042 ?auto_117038 ) ( ON ?auto_117039 ?auto_117042 ) ( ON ?auto_117037 ?auto_117039 ) ( ON ?auto_117040 ?auto_117037 ) ( not ( = ?auto_117041 ?auto_117038 ) ) ( not ( = ?auto_117041 ?auto_117042 ) ) ( not ( = ?auto_117041 ?auto_117039 ) ) ( not ( = ?auto_117041 ?auto_117037 ) ) ( not ( = ?auto_117041 ?auto_117040 ) ) ( not ( = ?auto_117041 ?auto_117036 ) ) ( not ( = ?auto_117041 ?auto_117035 ) ) ( not ( = ?auto_117038 ?auto_117042 ) ) ( not ( = ?auto_117038 ?auto_117039 ) ) ( not ( = ?auto_117038 ?auto_117037 ) ) ( not ( = ?auto_117038 ?auto_117040 ) ) ( not ( = ?auto_117038 ?auto_117036 ) ) ( not ( = ?auto_117038 ?auto_117035 ) ) ( not ( = ?auto_117042 ?auto_117039 ) ) ( not ( = ?auto_117042 ?auto_117037 ) ) ( not ( = ?auto_117042 ?auto_117040 ) ) ( not ( = ?auto_117042 ?auto_117036 ) ) ( not ( = ?auto_117042 ?auto_117035 ) ) ( not ( = ?auto_117039 ?auto_117037 ) ) ( not ( = ?auto_117039 ?auto_117040 ) ) ( not ( = ?auto_117039 ?auto_117036 ) ) ( not ( = ?auto_117039 ?auto_117035 ) ) ( not ( = ?auto_117037 ?auto_117040 ) ) ( not ( = ?auto_117037 ?auto_117036 ) ) ( not ( = ?auto_117037 ?auto_117035 ) ) ( not ( = ?auto_117034 ?auto_117041 ) ) ( not ( = ?auto_117034 ?auto_117038 ) ) ( not ( = ?auto_117034 ?auto_117042 ) ) ( not ( = ?auto_117034 ?auto_117039 ) ) ( not ( = ?auto_117034 ?auto_117037 ) ) ( ON ?auto_117034 ?auto_117035 ) ( CLEAR ?auto_117034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117041 ?auto_117038 ?auto_117042 ?auto_117039 ?auto_117037 ?auto_117040 ?auto_117036 ?auto_117035 )
      ( MAKE-3PILE ?auto_117034 ?auto_117035 ?auto_117036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117048 - BLOCK
      ?auto_117049 - BLOCK
      ?auto_117050 - BLOCK
      ?auto_117051 - BLOCK
      ?auto_117052 - BLOCK
    )
    :vars
    (
      ?auto_117053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117053 ?auto_117052 ) ( CLEAR ?auto_117053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117048 ) ( ON ?auto_117049 ?auto_117048 ) ( ON ?auto_117050 ?auto_117049 ) ( ON ?auto_117051 ?auto_117050 ) ( ON ?auto_117052 ?auto_117051 ) ( not ( = ?auto_117048 ?auto_117049 ) ) ( not ( = ?auto_117048 ?auto_117050 ) ) ( not ( = ?auto_117048 ?auto_117051 ) ) ( not ( = ?auto_117048 ?auto_117052 ) ) ( not ( = ?auto_117048 ?auto_117053 ) ) ( not ( = ?auto_117049 ?auto_117050 ) ) ( not ( = ?auto_117049 ?auto_117051 ) ) ( not ( = ?auto_117049 ?auto_117052 ) ) ( not ( = ?auto_117049 ?auto_117053 ) ) ( not ( = ?auto_117050 ?auto_117051 ) ) ( not ( = ?auto_117050 ?auto_117052 ) ) ( not ( = ?auto_117050 ?auto_117053 ) ) ( not ( = ?auto_117051 ?auto_117052 ) ) ( not ( = ?auto_117051 ?auto_117053 ) ) ( not ( = ?auto_117052 ?auto_117053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117053 ?auto_117052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117054 - BLOCK
      ?auto_117055 - BLOCK
      ?auto_117056 - BLOCK
      ?auto_117057 - BLOCK
      ?auto_117058 - BLOCK
    )
    :vars
    (
      ?auto_117059 - BLOCK
      ?auto_117060 - BLOCK
      ?auto_117061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117059 ?auto_117058 ) ( CLEAR ?auto_117059 ) ( ON-TABLE ?auto_117054 ) ( ON ?auto_117055 ?auto_117054 ) ( ON ?auto_117056 ?auto_117055 ) ( ON ?auto_117057 ?auto_117056 ) ( ON ?auto_117058 ?auto_117057 ) ( not ( = ?auto_117054 ?auto_117055 ) ) ( not ( = ?auto_117054 ?auto_117056 ) ) ( not ( = ?auto_117054 ?auto_117057 ) ) ( not ( = ?auto_117054 ?auto_117058 ) ) ( not ( = ?auto_117054 ?auto_117059 ) ) ( not ( = ?auto_117055 ?auto_117056 ) ) ( not ( = ?auto_117055 ?auto_117057 ) ) ( not ( = ?auto_117055 ?auto_117058 ) ) ( not ( = ?auto_117055 ?auto_117059 ) ) ( not ( = ?auto_117056 ?auto_117057 ) ) ( not ( = ?auto_117056 ?auto_117058 ) ) ( not ( = ?auto_117056 ?auto_117059 ) ) ( not ( = ?auto_117057 ?auto_117058 ) ) ( not ( = ?auto_117057 ?auto_117059 ) ) ( not ( = ?auto_117058 ?auto_117059 ) ) ( HOLDING ?auto_117060 ) ( CLEAR ?auto_117061 ) ( not ( = ?auto_117054 ?auto_117060 ) ) ( not ( = ?auto_117054 ?auto_117061 ) ) ( not ( = ?auto_117055 ?auto_117060 ) ) ( not ( = ?auto_117055 ?auto_117061 ) ) ( not ( = ?auto_117056 ?auto_117060 ) ) ( not ( = ?auto_117056 ?auto_117061 ) ) ( not ( = ?auto_117057 ?auto_117060 ) ) ( not ( = ?auto_117057 ?auto_117061 ) ) ( not ( = ?auto_117058 ?auto_117060 ) ) ( not ( = ?auto_117058 ?auto_117061 ) ) ( not ( = ?auto_117059 ?auto_117060 ) ) ( not ( = ?auto_117059 ?auto_117061 ) ) ( not ( = ?auto_117060 ?auto_117061 ) ) )
    :subtasks
    ( ( !STACK ?auto_117060 ?auto_117061 )
      ( MAKE-5PILE ?auto_117054 ?auto_117055 ?auto_117056 ?auto_117057 ?auto_117058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117062 - BLOCK
      ?auto_117063 - BLOCK
      ?auto_117064 - BLOCK
      ?auto_117065 - BLOCK
      ?auto_117066 - BLOCK
    )
    :vars
    (
      ?auto_117068 - BLOCK
      ?auto_117069 - BLOCK
      ?auto_117067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117068 ?auto_117066 ) ( ON-TABLE ?auto_117062 ) ( ON ?auto_117063 ?auto_117062 ) ( ON ?auto_117064 ?auto_117063 ) ( ON ?auto_117065 ?auto_117064 ) ( ON ?auto_117066 ?auto_117065 ) ( not ( = ?auto_117062 ?auto_117063 ) ) ( not ( = ?auto_117062 ?auto_117064 ) ) ( not ( = ?auto_117062 ?auto_117065 ) ) ( not ( = ?auto_117062 ?auto_117066 ) ) ( not ( = ?auto_117062 ?auto_117068 ) ) ( not ( = ?auto_117063 ?auto_117064 ) ) ( not ( = ?auto_117063 ?auto_117065 ) ) ( not ( = ?auto_117063 ?auto_117066 ) ) ( not ( = ?auto_117063 ?auto_117068 ) ) ( not ( = ?auto_117064 ?auto_117065 ) ) ( not ( = ?auto_117064 ?auto_117066 ) ) ( not ( = ?auto_117064 ?auto_117068 ) ) ( not ( = ?auto_117065 ?auto_117066 ) ) ( not ( = ?auto_117065 ?auto_117068 ) ) ( not ( = ?auto_117066 ?auto_117068 ) ) ( CLEAR ?auto_117069 ) ( not ( = ?auto_117062 ?auto_117067 ) ) ( not ( = ?auto_117062 ?auto_117069 ) ) ( not ( = ?auto_117063 ?auto_117067 ) ) ( not ( = ?auto_117063 ?auto_117069 ) ) ( not ( = ?auto_117064 ?auto_117067 ) ) ( not ( = ?auto_117064 ?auto_117069 ) ) ( not ( = ?auto_117065 ?auto_117067 ) ) ( not ( = ?auto_117065 ?auto_117069 ) ) ( not ( = ?auto_117066 ?auto_117067 ) ) ( not ( = ?auto_117066 ?auto_117069 ) ) ( not ( = ?auto_117068 ?auto_117067 ) ) ( not ( = ?auto_117068 ?auto_117069 ) ) ( not ( = ?auto_117067 ?auto_117069 ) ) ( ON ?auto_117067 ?auto_117068 ) ( CLEAR ?auto_117067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117062 ?auto_117063 ?auto_117064 ?auto_117065 ?auto_117066 ?auto_117068 )
      ( MAKE-5PILE ?auto_117062 ?auto_117063 ?auto_117064 ?auto_117065 ?auto_117066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117070 - BLOCK
      ?auto_117071 - BLOCK
      ?auto_117072 - BLOCK
      ?auto_117073 - BLOCK
      ?auto_117074 - BLOCK
    )
    :vars
    (
      ?auto_117075 - BLOCK
      ?auto_117077 - BLOCK
      ?auto_117076 - BLOCK
      ?auto_117078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117075 ?auto_117074 ) ( ON-TABLE ?auto_117070 ) ( ON ?auto_117071 ?auto_117070 ) ( ON ?auto_117072 ?auto_117071 ) ( ON ?auto_117073 ?auto_117072 ) ( ON ?auto_117074 ?auto_117073 ) ( not ( = ?auto_117070 ?auto_117071 ) ) ( not ( = ?auto_117070 ?auto_117072 ) ) ( not ( = ?auto_117070 ?auto_117073 ) ) ( not ( = ?auto_117070 ?auto_117074 ) ) ( not ( = ?auto_117070 ?auto_117075 ) ) ( not ( = ?auto_117071 ?auto_117072 ) ) ( not ( = ?auto_117071 ?auto_117073 ) ) ( not ( = ?auto_117071 ?auto_117074 ) ) ( not ( = ?auto_117071 ?auto_117075 ) ) ( not ( = ?auto_117072 ?auto_117073 ) ) ( not ( = ?auto_117072 ?auto_117074 ) ) ( not ( = ?auto_117072 ?auto_117075 ) ) ( not ( = ?auto_117073 ?auto_117074 ) ) ( not ( = ?auto_117073 ?auto_117075 ) ) ( not ( = ?auto_117074 ?auto_117075 ) ) ( not ( = ?auto_117070 ?auto_117077 ) ) ( not ( = ?auto_117070 ?auto_117076 ) ) ( not ( = ?auto_117071 ?auto_117077 ) ) ( not ( = ?auto_117071 ?auto_117076 ) ) ( not ( = ?auto_117072 ?auto_117077 ) ) ( not ( = ?auto_117072 ?auto_117076 ) ) ( not ( = ?auto_117073 ?auto_117077 ) ) ( not ( = ?auto_117073 ?auto_117076 ) ) ( not ( = ?auto_117074 ?auto_117077 ) ) ( not ( = ?auto_117074 ?auto_117076 ) ) ( not ( = ?auto_117075 ?auto_117077 ) ) ( not ( = ?auto_117075 ?auto_117076 ) ) ( not ( = ?auto_117077 ?auto_117076 ) ) ( ON ?auto_117077 ?auto_117075 ) ( CLEAR ?auto_117077 ) ( HOLDING ?auto_117076 ) ( CLEAR ?auto_117078 ) ( ON-TABLE ?auto_117078 ) ( not ( = ?auto_117078 ?auto_117076 ) ) ( not ( = ?auto_117070 ?auto_117078 ) ) ( not ( = ?auto_117071 ?auto_117078 ) ) ( not ( = ?auto_117072 ?auto_117078 ) ) ( not ( = ?auto_117073 ?auto_117078 ) ) ( not ( = ?auto_117074 ?auto_117078 ) ) ( not ( = ?auto_117075 ?auto_117078 ) ) ( not ( = ?auto_117077 ?auto_117078 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117078 ?auto_117076 )
      ( MAKE-5PILE ?auto_117070 ?auto_117071 ?auto_117072 ?auto_117073 ?auto_117074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118598 - BLOCK
      ?auto_118599 - BLOCK
      ?auto_118600 - BLOCK
      ?auto_118601 - BLOCK
      ?auto_118602 - BLOCK
    )
    :vars
    (
      ?auto_118605 - BLOCK
      ?auto_118603 - BLOCK
      ?auto_118604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118605 ?auto_118602 ) ( ON-TABLE ?auto_118598 ) ( ON ?auto_118599 ?auto_118598 ) ( ON ?auto_118600 ?auto_118599 ) ( ON ?auto_118601 ?auto_118600 ) ( ON ?auto_118602 ?auto_118601 ) ( not ( = ?auto_118598 ?auto_118599 ) ) ( not ( = ?auto_118598 ?auto_118600 ) ) ( not ( = ?auto_118598 ?auto_118601 ) ) ( not ( = ?auto_118598 ?auto_118602 ) ) ( not ( = ?auto_118598 ?auto_118605 ) ) ( not ( = ?auto_118599 ?auto_118600 ) ) ( not ( = ?auto_118599 ?auto_118601 ) ) ( not ( = ?auto_118599 ?auto_118602 ) ) ( not ( = ?auto_118599 ?auto_118605 ) ) ( not ( = ?auto_118600 ?auto_118601 ) ) ( not ( = ?auto_118600 ?auto_118602 ) ) ( not ( = ?auto_118600 ?auto_118605 ) ) ( not ( = ?auto_118601 ?auto_118602 ) ) ( not ( = ?auto_118601 ?auto_118605 ) ) ( not ( = ?auto_118602 ?auto_118605 ) ) ( not ( = ?auto_118598 ?auto_118603 ) ) ( not ( = ?auto_118598 ?auto_118604 ) ) ( not ( = ?auto_118599 ?auto_118603 ) ) ( not ( = ?auto_118599 ?auto_118604 ) ) ( not ( = ?auto_118600 ?auto_118603 ) ) ( not ( = ?auto_118600 ?auto_118604 ) ) ( not ( = ?auto_118601 ?auto_118603 ) ) ( not ( = ?auto_118601 ?auto_118604 ) ) ( not ( = ?auto_118602 ?auto_118603 ) ) ( not ( = ?auto_118602 ?auto_118604 ) ) ( not ( = ?auto_118605 ?auto_118603 ) ) ( not ( = ?auto_118605 ?auto_118604 ) ) ( not ( = ?auto_118603 ?auto_118604 ) ) ( ON ?auto_118603 ?auto_118605 ) ( ON ?auto_118604 ?auto_118603 ) ( CLEAR ?auto_118604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118598 ?auto_118599 ?auto_118600 ?auto_118601 ?auto_118602 ?auto_118605 ?auto_118603 )
      ( MAKE-5PILE ?auto_118598 ?auto_118599 ?auto_118600 ?auto_118601 ?auto_118602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117088 - BLOCK
      ?auto_117089 - BLOCK
      ?auto_117090 - BLOCK
      ?auto_117091 - BLOCK
      ?auto_117092 - BLOCK
    )
    :vars
    (
      ?auto_117095 - BLOCK
      ?auto_117096 - BLOCK
      ?auto_117093 - BLOCK
      ?auto_117094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117095 ?auto_117092 ) ( ON-TABLE ?auto_117088 ) ( ON ?auto_117089 ?auto_117088 ) ( ON ?auto_117090 ?auto_117089 ) ( ON ?auto_117091 ?auto_117090 ) ( ON ?auto_117092 ?auto_117091 ) ( not ( = ?auto_117088 ?auto_117089 ) ) ( not ( = ?auto_117088 ?auto_117090 ) ) ( not ( = ?auto_117088 ?auto_117091 ) ) ( not ( = ?auto_117088 ?auto_117092 ) ) ( not ( = ?auto_117088 ?auto_117095 ) ) ( not ( = ?auto_117089 ?auto_117090 ) ) ( not ( = ?auto_117089 ?auto_117091 ) ) ( not ( = ?auto_117089 ?auto_117092 ) ) ( not ( = ?auto_117089 ?auto_117095 ) ) ( not ( = ?auto_117090 ?auto_117091 ) ) ( not ( = ?auto_117090 ?auto_117092 ) ) ( not ( = ?auto_117090 ?auto_117095 ) ) ( not ( = ?auto_117091 ?auto_117092 ) ) ( not ( = ?auto_117091 ?auto_117095 ) ) ( not ( = ?auto_117092 ?auto_117095 ) ) ( not ( = ?auto_117088 ?auto_117096 ) ) ( not ( = ?auto_117088 ?auto_117093 ) ) ( not ( = ?auto_117089 ?auto_117096 ) ) ( not ( = ?auto_117089 ?auto_117093 ) ) ( not ( = ?auto_117090 ?auto_117096 ) ) ( not ( = ?auto_117090 ?auto_117093 ) ) ( not ( = ?auto_117091 ?auto_117096 ) ) ( not ( = ?auto_117091 ?auto_117093 ) ) ( not ( = ?auto_117092 ?auto_117096 ) ) ( not ( = ?auto_117092 ?auto_117093 ) ) ( not ( = ?auto_117095 ?auto_117096 ) ) ( not ( = ?auto_117095 ?auto_117093 ) ) ( not ( = ?auto_117096 ?auto_117093 ) ) ( ON ?auto_117096 ?auto_117095 ) ( not ( = ?auto_117094 ?auto_117093 ) ) ( not ( = ?auto_117088 ?auto_117094 ) ) ( not ( = ?auto_117089 ?auto_117094 ) ) ( not ( = ?auto_117090 ?auto_117094 ) ) ( not ( = ?auto_117091 ?auto_117094 ) ) ( not ( = ?auto_117092 ?auto_117094 ) ) ( not ( = ?auto_117095 ?auto_117094 ) ) ( not ( = ?auto_117096 ?auto_117094 ) ) ( ON ?auto_117093 ?auto_117096 ) ( CLEAR ?auto_117093 ) ( HOLDING ?auto_117094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117094 )
      ( MAKE-5PILE ?auto_117088 ?auto_117089 ?auto_117090 ?auto_117091 ?auto_117092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117097 - BLOCK
      ?auto_117098 - BLOCK
      ?auto_117099 - BLOCK
      ?auto_117100 - BLOCK
      ?auto_117101 - BLOCK
    )
    :vars
    (
      ?auto_117105 - BLOCK
      ?auto_117104 - BLOCK
      ?auto_117102 - BLOCK
      ?auto_117103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117105 ?auto_117101 ) ( ON-TABLE ?auto_117097 ) ( ON ?auto_117098 ?auto_117097 ) ( ON ?auto_117099 ?auto_117098 ) ( ON ?auto_117100 ?auto_117099 ) ( ON ?auto_117101 ?auto_117100 ) ( not ( = ?auto_117097 ?auto_117098 ) ) ( not ( = ?auto_117097 ?auto_117099 ) ) ( not ( = ?auto_117097 ?auto_117100 ) ) ( not ( = ?auto_117097 ?auto_117101 ) ) ( not ( = ?auto_117097 ?auto_117105 ) ) ( not ( = ?auto_117098 ?auto_117099 ) ) ( not ( = ?auto_117098 ?auto_117100 ) ) ( not ( = ?auto_117098 ?auto_117101 ) ) ( not ( = ?auto_117098 ?auto_117105 ) ) ( not ( = ?auto_117099 ?auto_117100 ) ) ( not ( = ?auto_117099 ?auto_117101 ) ) ( not ( = ?auto_117099 ?auto_117105 ) ) ( not ( = ?auto_117100 ?auto_117101 ) ) ( not ( = ?auto_117100 ?auto_117105 ) ) ( not ( = ?auto_117101 ?auto_117105 ) ) ( not ( = ?auto_117097 ?auto_117104 ) ) ( not ( = ?auto_117097 ?auto_117102 ) ) ( not ( = ?auto_117098 ?auto_117104 ) ) ( not ( = ?auto_117098 ?auto_117102 ) ) ( not ( = ?auto_117099 ?auto_117104 ) ) ( not ( = ?auto_117099 ?auto_117102 ) ) ( not ( = ?auto_117100 ?auto_117104 ) ) ( not ( = ?auto_117100 ?auto_117102 ) ) ( not ( = ?auto_117101 ?auto_117104 ) ) ( not ( = ?auto_117101 ?auto_117102 ) ) ( not ( = ?auto_117105 ?auto_117104 ) ) ( not ( = ?auto_117105 ?auto_117102 ) ) ( not ( = ?auto_117104 ?auto_117102 ) ) ( ON ?auto_117104 ?auto_117105 ) ( not ( = ?auto_117103 ?auto_117102 ) ) ( not ( = ?auto_117097 ?auto_117103 ) ) ( not ( = ?auto_117098 ?auto_117103 ) ) ( not ( = ?auto_117099 ?auto_117103 ) ) ( not ( = ?auto_117100 ?auto_117103 ) ) ( not ( = ?auto_117101 ?auto_117103 ) ) ( not ( = ?auto_117105 ?auto_117103 ) ) ( not ( = ?auto_117104 ?auto_117103 ) ) ( ON ?auto_117102 ?auto_117104 ) ( ON ?auto_117103 ?auto_117102 ) ( CLEAR ?auto_117103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117097 ?auto_117098 ?auto_117099 ?auto_117100 ?auto_117101 ?auto_117105 ?auto_117104 ?auto_117102 )
      ( MAKE-5PILE ?auto_117097 ?auto_117098 ?auto_117099 ?auto_117100 ?auto_117101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117110 - BLOCK
      ?auto_117111 - BLOCK
      ?auto_117112 - BLOCK
      ?auto_117113 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117113 ) ( CLEAR ?auto_117112 ) ( ON-TABLE ?auto_117110 ) ( ON ?auto_117111 ?auto_117110 ) ( ON ?auto_117112 ?auto_117111 ) ( not ( = ?auto_117110 ?auto_117111 ) ) ( not ( = ?auto_117110 ?auto_117112 ) ) ( not ( = ?auto_117110 ?auto_117113 ) ) ( not ( = ?auto_117111 ?auto_117112 ) ) ( not ( = ?auto_117111 ?auto_117113 ) ) ( not ( = ?auto_117112 ?auto_117113 ) ) )
    :subtasks
    ( ( !STACK ?auto_117113 ?auto_117112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117114 - BLOCK
      ?auto_117115 - BLOCK
      ?auto_117116 - BLOCK
      ?auto_117117 - BLOCK
    )
    :vars
    (
      ?auto_117118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117116 ) ( ON-TABLE ?auto_117114 ) ( ON ?auto_117115 ?auto_117114 ) ( ON ?auto_117116 ?auto_117115 ) ( not ( = ?auto_117114 ?auto_117115 ) ) ( not ( = ?auto_117114 ?auto_117116 ) ) ( not ( = ?auto_117114 ?auto_117117 ) ) ( not ( = ?auto_117115 ?auto_117116 ) ) ( not ( = ?auto_117115 ?auto_117117 ) ) ( not ( = ?auto_117116 ?auto_117117 ) ) ( ON ?auto_117117 ?auto_117118 ) ( CLEAR ?auto_117117 ) ( HAND-EMPTY ) ( not ( = ?auto_117114 ?auto_117118 ) ) ( not ( = ?auto_117115 ?auto_117118 ) ) ( not ( = ?auto_117116 ?auto_117118 ) ) ( not ( = ?auto_117117 ?auto_117118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117117 ?auto_117118 )
      ( MAKE-4PILE ?auto_117114 ?auto_117115 ?auto_117116 ?auto_117117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117119 - BLOCK
      ?auto_117120 - BLOCK
      ?auto_117121 - BLOCK
      ?auto_117122 - BLOCK
    )
    :vars
    (
      ?auto_117123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117119 ) ( ON ?auto_117120 ?auto_117119 ) ( not ( = ?auto_117119 ?auto_117120 ) ) ( not ( = ?auto_117119 ?auto_117121 ) ) ( not ( = ?auto_117119 ?auto_117122 ) ) ( not ( = ?auto_117120 ?auto_117121 ) ) ( not ( = ?auto_117120 ?auto_117122 ) ) ( not ( = ?auto_117121 ?auto_117122 ) ) ( ON ?auto_117122 ?auto_117123 ) ( CLEAR ?auto_117122 ) ( not ( = ?auto_117119 ?auto_117123 ) ) ( not ( = ?auto_117120 ?auto_117123 ) ) ( not ( = ?auto_117121 ?auto_117123 ) ) ( not ( = ?auto_117122 ?auto_117123 ) ) ( HOLDING ?auto_117121 ) ( CLEAR ?auto_117120 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117119 ?auto_117120 ?auto_117121 )
      ( MAKE-4PILE ?auto_117119 ?auto_117120 ?auto_117121 ?auto_117122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117124 - BLOCK
      ?auto_117125 - BLOCK
      ?auto_117126 - BLOCK
      ?auto_117127 - BLOCK
    )
    :vars
    (
      ?auto_117128 - BLOCK
      ?auto_117131 - BLOCK
      ?auto_117130 - BLOCK
      ?auto_117132 - BLOCK
      ?auto_117129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117124 ) ( ON ?auto_117125 ?auto_117124 ) ( not ( = ?auto_117124 ?auto_117125 ) ) ( not ( = ?auto_117124 ?auto_117126 ) ) ( not ( = ?auto_117124 ?auto_117127 ) ) ( not ( = ?auto_117125 ?auto_117126 ) ) ( not ( = ?auto_117125 ?auto_117127 ) ) ( not ( = ?auto_117126 ?auto_117127 ) ) ( ON ?auto_117127 ?auto_117128 ) ( not ( = ?auto_117124 ?auto_117128 ) ) ( not ( = ?auto_117125 ?auto_117128 ) ) ( not ( = ?auto_117126 ?auto_117128 ) ) ( not ( = ?auto_117127 ?auto_117128 ) ) ( CLEAR ?auto_117125 ) ( ON ?auto_117126 ?auto_117127 ) ( CLEAR ?auto_117126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117131 ) ( ON ?auto_117130 ?auto_117131 ) ( ON ?auto_117132 ?auto_117130 ) ( ON ?auto_117129 ?auto_117132 ) ( ON ?auto_117128 ?auto_117129 ) ( not ( = ?auto_117131 ?auto_117130 ) ) ( not ( = ?auto_117131 ?auto_117132 ) ) ( not ( = ?auto_117131 ?auto_117129 ) ) ( not ( = ?auto_117131 ?auto_117128 ) ) ( not ( = ?auto_117131 ?auto_117127 ) ) ( not ( = ?auto_117131 ?auto_117126 ) ) ( not ( = ?auto_117130 ?auto_117132 ) ) ( not ( = ?auto_117130 ?auto_117129 ) ) ( not ( = ?auto_117130 ?auto_117128 ) ) ( not ( = ?auto_117130 ?auto_117127 ) ) ( not ( = ?auto_117130 ?auto_117126 ) ) ( not ( = ?auto_117132 ?auto_117129 ) ) ( not ( = ?auto_117132 ?auto_117128 ) ) ( not ( = ?auto_117132 ?auto_117127 ) ) ( not ( = ?auto_117132 ?auto_117126 ) ) ( not ( = ?auto_117129 ?auto_117128 ) ) ( not ( = ?auto_117129 ?auto_117127 ) ) ( not ( = ?auto_117129 ?auto_117126 ) ) ( not ( = ?auto_117124 ?auto_117131 ) ) ( not ( = ?auto_117124 ?auto_117130 ) ) ( not ( = ?auto_117124 ?auto_117132 ) ) ( not ( = ?auto_117124 ?auto_117129 ) ) ( not ( = ?auto_117125 ?auto_117131 ) ) ( not ( = ?auto_117125 ?auto_117130 ) ) ( not ( = ?auto_117125 ?auto_117132 ) ) ( not ( = ?auto_117125 ?auto_117129 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117131 ?auto_117130 ?auto_117132 ?auto_117129 ?auto_117128 ?auto_117127 )
      ( MAKE-4PILE ?auto_117124 ?auto_117125 ?auto_117126 ?auto_117127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117133 - BLOCK
      ?auto_117134 - BLOCK
      ?auto_117135 - BLOCK
      ?auto_117136 - BLOCK
    )
    :vars
    (
      ?auto_117139 - BLOCK
      ?auto_117141 - BLOCK
      ?auto_117137 - BLOCK
      ?auto_117138 - BLOCK
      ?auto_117140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117133 ) ( not ( = ?auto_117133 ?auto_117134 ) ) ( not ( = ?auto_117133 ?auto_117135 ) ) ( not ( = ?auto_117133 ?auto_117136 ) ) ( not ( = ?auto_117134 ?auto_117135 ) ) ( not ( = ?auto_117134 ?auto_117136 ) ) ( not ( = ?auto_117135 ?auto_117136 ) ) ( ON ?auto_117136 ?auto_117139 ) ( not ( = ?auto_117133 ?auto_117139 ) ) ( not ( = ?auto_117134 ?auto_117139 ) ) ( not ( = ?auto_117135 ?auto_117139 ) ) ( not ( = ?auto_117136 ?auto_117139 ) ) ( ON ?auto_117135 ?auto_117136 ) ( CLEAR ?auto_117135 ) ( ON-TABLE ?auto_117141 ) ( ON ?auto_117137 ?auto_117141 ) ( ON ?auto_117138 ?auto_117137 ) ( ON ?auto_117140 ?auto_117138 ) ( ON ?auto_117139 ?auto_117140 ) ( not ( = ?auto_117141 ?auto_117137 ) ) ( not ( = ?auto_117141 ?auto_117138 ) ) ( not ( = ?auto_117141 ?auto_117140 ) ) ( not ( = ?auto_117141 ?auto_117139 ) ) ( not ( = ?auto_117141 ?auto_117136 ) ) ( not ( = ?auto_117141 ?auto_117135 ) ) ( not ( = ?auto_117137 ?auto_117138 ) ) ( not ( = ?auto_117137 ?auto_117140 ) ) ( not ( = ?auto_117137 ?auto_117139 ) ) ( not ( = ?auto_117137 ?auto_117136 ) ) ( not ( = ?auto_117137 ?auto_117135 ) ) ( not ( = ?auto_117138 ?auto_117140 ) ) ( not ( = ?auto_117138 ?auto_117139 ) ) ( not ( = ?auto_117138 ?auto_117136 ) ) ( not ( = ?auto_117138 ?auto_117135 ) ) ( not ( = ?auto_117140 ?auto_117139 ) ) ( not ( = ?auto_117140 ?auto_117136 ) ) ( not ( = ?auto_117140 ?auto_117135 ) ) ( not ( = ?auto_117133 ?auto_117141 ) ) ( not ( = ?auto_117133 ?auto_117137 ) ) ( not ( = ?auto_117133 ?auto_117138 ) ) ( not ( = ?auto_117133 ?auto_117140 ) ) ( not ( = ?auto_117134 ?auto_117141 ) ) ( not ( = ?auto_117134 ?auto_117137 ) ) ( not ( = ?auto_117134 ?auto_117138 ) ) ( not ( = ?auto_117134 ?auto_117140 ) ) ( HOLDING ?auto_117134 ) ( CLEAR ?auto_117133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117133 ?auto_117134 )
      ( MAKE-4PILE ?auto_117133 ?auto_117134 ?auto_117135 ?auto_117136 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117142 - BLOCK
      ?auto_117143 - BLOCK
      ?auto_117144 - BLOCK
      ?auto_117145 - BLOCK
    )
    :vars
    (
      ?auto_117147 - BLOCK
      ?auto_117148 - BLOCK
      ?auto_117146 - BLOCK
      ?auto_117150 - BLOCK
      ?auto_117149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117142 ) ( not ( = ?auto_117142 ?auto_117143 ) ) ( not ( = ?auto_117142 ?auto_117144 ) ) ( not ( = ?auto_117142 ?auto_117145 ) ) ( not ( = ?auto_117143 ?auto_117144 ) ) ( not ( = ?auto_117143 ?auto_117145 ) ) ( not ( = ?auto_117144 ?auto_117145 ) ) ( ON ?auto_117145 ?auto_117147 ) ( not ( = ?auto_117142 ?auto_117147 ) ) ( not ( = ?auto_117143 ?auto_117147 ) ) ( not ( = ?auto_117144 ?auto_117147 ) ) ( not ( = ?auto_117145 ?auto_117147 ) ) ( ON ?auto_117144 ?auto_117145 ) ( ON-TABLE ?auto_117148 ) ( ON ?auto_117146 ?auto_117148 ) ( ON ?auto_117150 ?auto_117146 ) ( ON ?auto_117149 ?auto_117150 ) ( ON ?auto_117147 ?auto_117149 ) ( not ( = ?auto_117148 ?auto_117146 ) ) ( not ( = ?auto_117148 ?auto_117150 ) ) ( not ( = ?auto_117148 ?auto_117149 ) ) ( not ( = ?auto_117148 ?auto_117147 ) ) ( not ( = ?auto_117148 ?auto_117145 ) ) ( not ( = ?auto_117148 ?auto_117144 ) ) ( not ( = ?auto_117146 ?auto_117150 ) ) ( not ( = ?auto_117146 ?auto_117149 ) ) ( not ( = ?auto_117146 ?auto_117147 ) ) ( not ( = ?auto_117146 ?auto_117145 ) ) ( not ( = ?auto_117146 ?auto_117144 ) ) ( not ( = ?auto_117150 ?auto_117149 ) ) ( not ( = ?auto_117150 ?auto_117147 ) ) ( not ( = ?auto_117150 ?auto_117145 ) ) ( not ( = ?auto_117150 ?auto_117144 ) ) ( not ( = ?auto_117149 ?auto_117147 ) ) ( not ( = ?auto_117149 ?auto_117145 ) ) ( not ( = ?auto_117149 ?auto_117144 ) ) ( not ( = ?auto_117142 ?auto_117148 ) ) ( not ( = ?auto_117142 ?auto_117146 ) ) ( not ( = ?auto_117142 ?auto_117150 ) ) ( not ( = ?auto_117142 ?auto_117149 ) ) ( not ( = ?auto_117143 ?auto_117148 ) ) ( not ( = ?auto_117143 ?auto_117146 ) ) ( not ( = ?auto_117143 ?auto_117150 ) ) ( not ( = ?auto_117143 ?auto_117149 ) ) ( CLEAR ?auto_117142 ) ( ON ?auto_117143 ?auto_117144 ) ( CLEAR ?auto_117143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117148 ?auto_117146 ?auto_117150 ?auto_117149 ?auto_117147 ?auto_117145 ?auto_117144 )
      ( MAKE-4PILE ?auto_117142 ?auto_117143 ?auto_117144 ?auto_117145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117151 - BLOCK
      ?auto_117152 - BLOCK
      ?auto_117153 - BLOCK
      ?auto_117154 - BLOCK
    )
    :vars
    (
      ?auto_117157 - BLOCK
      ?auto_117159 - BLOCK
      ?auto_117156 - BLOCK
      ?auto_117158 - BLOCK
      ?auto_117155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117151 ?auto_117152 ) ) ( not ( = ?auto_117151 ?auto_117153 ) ) ( not ( = ?auto_117151 ?auto_117154 ) ) ( not ( = ?auto_117152 ?auto_117153 ) ) ( not ( = ?auto_117152 ?auto_117154 ) ) ( not ( = ?auto_117153 ?auto_117154 ) ) ( ON ?auto_117154 ?auto_117157 ) ( not ( = ?auto_117151 ?auto_117157 ) ) ( not ( = ?auto_117152 ?auto_117157 ) ) ( not ( = ?auto_117153 ?auto_117157 ) ) ( not ( = ?auto_117154 ?auto_117157 ) ) ( ON ?auto_117153 ?auto_117154 ) ( ON-TABLE ?auto_117159 ) ( ON ?auto_117156 ?auto_117159 ) ( ON ?auto_117158 ?auto_117156 ) ( ON ?auto_117155 ?auto_117158 ) ( ON ?auto_117157 ?auto_117155 ) ( not ( = ?auto_117159 ?auto_117156 ) ) ( not ( = ?auto_117159 ?auto_117158 ) ) ( not ( = ?auto_117159 ?auto_117155 ) ) ( not ( = ?auto_117159 ?auto_117157 ) ) ( not ( = ?auto_117159 ?auto_117154 ) ) ( not ( = ?auto_117159 ?auto_117153 ) ) ( not ( = ?auto_117156 ?auto_117158 ) ) ( not ( = ?auto_117156 ?auto_117155 ) ) ( not ( = ?auto_117156 ?auto_117157 ) ) ( not ( = ?auto_117156 ?auto_117154 ) ) ( not ( = ?auto_117156 ?auto_117153 ) ) ( not ( = ?auto_117158 ?auto_117155 ) ) ( not ( = ?auto_117158 ?auto_117157 ) ) ( not ( = ?auto_117158 ?auto_117154 ) ) ( not ( = ?auto_117158 ?auto_117153 ) ) ( not ( = ?auto_117155 ?auto_117157 ) ) ( not ( = ?auto_117155 ?auto_117154 ) ) ( not ( = ?auto_117155 ?auto_117153 ) ) ( not ( = ?auto_117151 ?auto_117159 ) ) ( not ( = ?auto_117151 ?auto_117156 ) ) ( not ( = ?auto_117151 ?auto_117158 ) ) ( not ( = ?auto_117151 ?auto_117155 ) ) ( not ( = ?auto_117152 ?auto_117159 ) ) ( not ( = ?auto_117152 ?auto_117156 ) ) ( not ( = ?auto_117152 ?auto_117158 ) ) ( not ( = ?auto_117152 ?auto_117155 ) ) ( ON ?auto_117152 ?auto_117153 ) ( CLEAR ?auto_117152 ) ( HOLDING ?auto_117151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117151 )
      ( MAKE-4PILE ?auto_117151 ?auto_117152 ?auto_117153 ?auto_117154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117160 - BLOCK
      ?auto_117161 - BLOCK
      ?auto_117162 - BLOCK
      ?auto_117163 - BLOCK
    )
    :vars
    (
      ?auto_117167 - BLOCK
      ?auto_117168 - BLOCK
      ?auto_117165 - BLOCK
      ?auto_117166 - BLOCK
      ?auto_117164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117160 ?auto_117161 ) ) ( not ( = ?auto_117160 ?auto_117162 ) ) ( not ( = ?auto_117160 ?auto_117163 ) ) ( not ( = ?auto_117161 ?auto_117162 ) ) ( not ( = ?auto_117161 ?auto_117163 ) ) ( not ( = ?auto_117162 ?auto_117163 ) ) ( ON ?auto_117163 ?auto_117167 ) ( not ( = ?auto_117160 ?auto_117167 ) ) ( not ( = ?auto_117161 ?auto_117167 ) ) ( not ( = ?auto_117162 ?auto_117167 ) ) ( not ( = ?auto_117163 ?auto_117167 ) ) ( ON ?auto_117162 ?auto_117163 ) ( ON-TABLE ?auto_117168 ) ( ON ?auto_117165 ?auto_117168 ) ( ON ?auto_117166 ?auto_117165 ) ( ON ?auto_117164 ?auto_117166 ) ( ON ?auto_117167 ?auto_117164 ) ( not ( = ?auto_117168 ?auto_117165 ) ) ( not ( = ?auto_117168 ?auto_117166 ) ) ( not ( = ?auto_117168 ?auto_117164 ) ) ( not ( = ?auto_117168 ?auto_117167 ) ) ( not ( = ?auto_117168 ?auto_117163 ) ) ( not ( = ?auto_117168 ?auto_117162 ) ) ( not ( = ?auto_117165 ?auto_117166 ) ) ( not ( = ?auto_117165 ?auto_117164 ) ) ( not ( = ?auto_117165 ?auto_117167 ) ) ( not ( = ?auto_117165 ?auto_117163 ) ) ( not ( = ?auto_117165 ?auto_117162 ) ) ( not ( = ?auto_117166 ?auto_117164 ) ) ( not ( = ?auto_117166 ?auto_117167 ) ) ( not ( = ?auto_117166 ?auto_117163 ) ) ( not ( = ?auto_117166 ?auto_117162 ) ) ( not ( = ?auto_117164 ?auto_117167 ) ) ( not ( = ?auto_117164 ?auto_117163 ) ) ( not ( = ?auto_117164 ?auto_117162 ) ) ( not ( = ?auto_117160 ?auto_117168 ) ) ( not ( = ?auto_117160 ?auto_117165 ) ) ( not ( = ?auto_117160 ?auto_117166 ) ) ( not ( = ?auto_117160 ?auto_117164 ) ) ( not ( = ?auto_117161 ?auto_117168 ) ) ( not ( = ?auto_117161 ?auto_117165 ) ) ( not ( = ?auto_117161 ?auto_117166 ) ) ( not ( = ?auto_117161 ?auto_117164 ) ) ( ON ?auto_117161 ?auto_117162 ) ( ON ?auto_117160 ?auto_117161 ) ( CLEAR ?auto_117160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117168 ?auto_117165 ?auto_117166 ?auto_117164 ?auto_117167 ?auto_117163 ?auto_117162 ?auto_117161 )
      ( MAKE-4PILE ?auto_117160 ?auto_117161 ?auto_117162 ?auto_117163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117173 - BLOCK
      ?auto_117174 - BLOCK
      ?auto_117175 - BLOCK
      ?auto_117176 - BLOCK
    )
    :vars
    (
      ?auto_117177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117177 ?auto_117176 ) ( CLEAR ?auto_117177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117173 ) ( ON ?auto_117174 ?auto_117173 ) ( ON ?auto_117175 ?auto_117174 ) ( ON ?auto_117176 ?auto_117175 ) ( not ( = ?auto_117173 ?auto_117174 ) ) ( not ( = ?auto_117173 ?auto_117175 ) ) ( not ( = ?auto_117173 ?auto_117176 ) ) ( not ( = ?auto_117173 ?auto_117177 ) ) ( not ( = ?auto_117174 ?auto_117175 ) ) ( not ( = ?auto_117174 ?auto_117176 ) ) ( not ( = ?auto_117174 ?auto_117177 ) ) ( not ( = ?auto_117175 ?auto_117176 ) ) ( not ( = ?auto_117175 ?auto_117177 ) ) ( not ( = ?auto_117176 ?auto_117177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117177 ?auto_117176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117178 - BLOCK
      ?auto_117179 - BLOCK
      ?auto_117180 - BLOCK
      ?auto_117181 - BLOCK
    )
    :vars
    (
      ?auto_117182 - BLOCK
      ?auto_117183 - BLOCK
      ?auto_117184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117182 ?auto_117181 ) ( CLEAR ?auto_117182 ) ( ON-TABLE ?auto_117178 ) ( ON ?auto_117179 ?auto_117178 ) ( ON ?auto_117180 ?auto_117179 ) ( ON ?auto_117181 ?auto_117180 ) ( not ( = ?auto_117178 ?auto_117179 ) ) ( not ( = ?auto_117178 ?auto_117180 ) ) ( not ( = ?auto_117178 ?auto_117181 ) ) ( not ( = ?auto_117178 ?auto_117182 ) ) ( not ( = ?auto_117179 ?auto_117180 ) ) ( not ( = ?auto_117179 ?auto_117181 ) ) ( not ( = ?auto_117179 ?auto_117182 ) ) ( not ( = ?auto_117180 ?auto_117181 ) ) ( not ( = ?auto_117180 ?auto_117182 ) ) ( not ( = ?auto_117181 ?auto_117182 ) ) ( HOLDING ?auto_117183 ) ( CLEAR ?auto_117184 ) ( not ( = ?auto_117178 ?auto_117183 ) ) ( not ( = ?auto_117178 ?auto_117184 ) ) ( not ( = ?auto_117179 ?auto_117183 ) ) ( not ( = ?auto_117179 ?auto_117184 ) ) ( not ( = ?auto_117180 ?auto_117183 ) ) ( not ( = ?auto_117180 ?auto_117184 ) ) ( not ( = ?auto_117181 ?auto_117183 ) ) ( not ( = ?auto_117181 ?auto_117184 ) ) ( not ( = ?auto_117182 ?auto_117183 ) ) ( not ( = ?auto_117182 ?auto_117184 ) ) ( not ( = ?auto_117183 ?auto_117184 ) ) )
    :subtasks
    ( ( !STACK ?auto_117183 ?auto_117184 )
      ( MAKE-4PILE ?auto_117178 ?auto_117179 ?auto_117180 ?auto_117181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117185 - BLOCK
      ?auto_117186 - BLOCK
      ?auto_117187 - BLOCK
      ?auto_117188 - BLOCK
    )
    :vars
    (
      ?auto_117190 - BLOCK
      ?auto_117189 - BLOCK
      ?auto_117191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117190 ?auto_117188 ) ( ON-TABLE ?auto_117185 ) ( ON ?auto_117186 ?auto_117185 ) ( ON ?auto_117187 ?auto_117186 ) ( ON ?auto_117188 ?auto_117187 ) ( not ( = ?auto_117185 ?auto_117186 ) ) ( not ( = ?auto_117185 ?auto_117187 ) ) ( not ( = ?auto_117185 ?auto_117188 ) ) ( not ( = ?auto_117185 ?auto_117190 ) ) ( not ( = ?auto_117186 ?auto_117187 ) ) ( not ( = ?auto_117186 ?auto_117188 ) ) ( not ( = ?auto_117186 ?auto_117190 ) ) ( not ( = ?auto_117187 ?auto_117188 ) ) ( not ( = ?auto_117187 ?auto_117190 ) ) ( not ( = ?auto_117188 ?auto_117190 ) ) ( CLEAR ?auto_117189 ) ( not ( = ?auto_117185 ?auto_117191 ) ) ( not ( = ?auto_117185 ?auto_117189 ) ) ( not ( = ?auto_117186 ?auto_117191 ) ) ( not ( = ?auto_117186 ?auto_117189 ) ) ( not ( = ?auto_117187 ?auto_117191 ) ) ( not ( = ?auto_117187 ?auto_117189 ) ) ( not ( = ?auto_117188 ?auto_117191 ) ) ( not ( = ?auto_117188 ?auto_117189 ) ) ( not ( = ?auto_117190 ?auto_117191 ) ) ( not ( = ?auto_117190 ?auto_117189 ) ) ( not ( = ?auto_117191 ?auto_117189 ) ) ( ON ?auto_117191 ?auto_117190 ) ( CLEAR ?auto_117191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117185 ?auto_117186 ?auto_117187 ?auto_117188 ?auto_117190 )
      ( MAKE-4PILE ?auto_117185 ?auto_117186 ?auto_117187 ?auto_117188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117192 - BLOCK
      ?auto_117193 - BLOCK
      ?auto_117194 - BLOCK
      ?auto_117195 - BLOCK
    )
    :vars
    (
      ?auto_117198 - BLOCK
      ?auto_117196 - BLOCK
      ?auto_117197 - BLOCK
      ?auto_117200 - BLOCK
      ?auto_117199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117198 ?auto_117195 ) ( ON-TABLE ?auto_117192 ) ( ON ?auto_117193 ?auto_117192 ) ( ON ?auto_117194 ?auto_117193 ) ( ON ?auto_117195 ?auto_117194 ) ( not ( = ?auto_117192 ?auto_117193 ) ) ( not ( = ?auto_117192 ?auto_117194 ) ) ( not ( = ?auto_117192 ?auto_117195 ) ) ( not ( = ?auto_117192 ?auto_117198 ) ) ( not ( = ?auto_117193 ?auto_117194 ) ) ( not ( = ?auto_117193 ?auto_117195 ) ) ( not ( = ?auto_117193 ?auto_117198 ) ) ( not ( = ?auto_117194 ?auto_117195 ) ) ( not ( = ?auto_117194 ?auto_117198 ) ) ( not ( = ?auto_117195 ?auto_117198 ) ) ( not ( = ?auto_117192 ?auto_117196 ) ) ( not ( = ?auto_117192 ?auto_117197 ) ) ( not ( = ?auto_117193 ?auto_117196 ) ) ( not ( = ?auto_117193 ?auto_117197 ) ) ( not ( = ?auto_117194 ?auto_117196 ) ) ( not ( = ?auto_117194 ?auto_117197 ) ) ( not ( = ?auto_117195 ?auto_117196 ) ) ( not ( = ?auto_117195 ?auto_117197 ) ) ( not ( = ?auto_117198 ?auto_117196 ) ) ( not ( = ?auto_117198 ?auto_117197 ) ) ( not ( = ?auto_117196 ?auto_117197 ) ) ( ON ?auto_117196 ?auto_117198 ) ( CLEAR ?auto_117196 ) ( HOLDING ?auto_117197 ) ( CLEAR ?auto_117200 ) ( ON-TABLE ?auto_117199 ) ( ON ?auto_117200 ?auto_117199 ) ( not ( = ?auto_117199 ?auto_117200 ) ) ( not ( = ?auto_117199 ?auto_117197 ) ) ( not ( = ?auto_117200 ?auto_117197 ) ) ( not ( = ?auto_117192 ?auto_117200 ) ) ( not ( = ?auto_117192 ?auto_117199 ) ) ( not ( = ?auto_117193 ?auto_117200 ) ) ( not ( = ?auto_117193 ?auto_117199 ) ) ( not ( = ?auto_117194 ?auto_117200 ) ) ( not ( = ?auto_117194 ?auto_117199 ) ) ( not ( = ?auto_117195 ?auto_117200 ) ) ( not ( = ?auto_117195 ?auto_117199 ) ) ( not ( = ?auto_117198 ?auto_117200 ) ) ( not ( = ?auto_117198 ?auto_117199 ) ) ( not ( = ?auto_117196 ?auto_117200 ) ) ( not ( = ?auto_117196 ?auto_117199 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117199 ?auto_117200 ?auto_117197 )
      ( MAKE-4PILE ?auto_117192 ?auto_117193 ?auto_117194 ?auto_117195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117201 - BLOCK
      ?auto_117202 - BLOCK
      ?auto_117203 - BLOCK
      ?auto_117204 - BLOCK
    )
    :vars
    (
      ?auto_117205 - BLOCK
      ?auto_117206 - BLOCK
      ?auto_117207 - BLOCK
      ?auto_117208 - BLOCK
      ?auto_117209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117205 ?auto_117204 ) ( ON-TABLE ?auto_117201 ) ( ON ?auto_117202 ?auto_117201 ) ( ON ?auto_117203 ?auto_117202 ) ( ON ?auto_117204 ?auto_117203 ) ( not ( = ?auto_117201 ?auto_117202 ) ) ( not ( = ?auto_117201 ?auto_117203 ) ) ( not ( = ?auto_117201 ?auto_117204 ) ) ( not ( = ?auto_117201 ?auto_117205 ) ) ( not ( = ?auto_117202 ?auto_117203 ) ) ( not ( = ?auto_117202 ?auto_117204 ) ) ( not ( = ?auto_117202 ?auto_117205 ) ) ( not ( = ?auto_117203 ?auto_117204 ) ) ( not ( = ?auto_117203 ?auto_117205 ) ) ( not ( = ?auto_117204 ?auto_117205 ) ) ( not ( = ?auto_117201 ?auto_117206 ) ) ( not ( = ?auto_117201 ?auto_117207 ) ) ( not ( = ?auto_117202 ?auto_117206 ) ) ( not ( = ?auto_117202 ?auto_117207 ) ) ( not ( = ?auto_117203 ?auto_117206 ) ) ( not ( = ?auto_117203 ?auto_117207 ) ) ( not ( = ?auto_117204 ?auto_117206 ) ) ( not ( = ?auto_117204 ?auto_117207 ) ) ( not ( = ?auto_117205 ?auto_117206 ) ) ( not ( = ?auto_117205 ?auto_117207 ) ) ( not ( = ?auto_117206 ?auto_117207 ) ) ( ON ?auto_117206 ?auto_117205 ) ( CLEAR ?auto_117208 ) ( ON-TABLE ?auto_117209 ) ( ON ?auto_117208 ?auto_117209 ) ( not ( = ?auto_117209 ?auto_117208 ) ) ( not ( = ?auto_117209 ?auto_117207 ) ) ( not ( = ?auto_117208 ?auto_117207 ) ) ( not ( = ?auto_117201 ?auto_117208 ) ) ( not ( = ?auto_117201 ?auto_117209 ) ) ( not ( = ?auto_117202 ?auto_117208 ) ) ( not ( = ?auto_117202 ?auto_117209 ) ) ( not ( = ?auto_117203 ?auto_117208 ) ) ( not ( = ?auto_117203 ?auto_117209 ) ) ( not ( = ?auto_117204 ?auto_117208 ) ) ( not ( = ?auto_117204 ?auto_117209 ) ) ( not ( = ?auto_117205 ?auto_117208 ) ) ( not ( = ?auto_117205 ?auto_117209 ) ) ( not ( = ?auto_117206 ?auto_117208 ) ) ( not ( = ?auto_117206 ?auto_117209 ) ) ( ON ?auto_117207 ?auto_117206 ) ( CLEAR ?auto_117207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117201 ?auto_117202 ?auto_117203 ?auto_117204 ?auto_117205 ?auto_117206 )
      ( MAKE-4PILE ?auto_117201 ?auto_117202 ?auto_117203 ?auto_117204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117210 - BLOCK
      ?auto_117211 - BLOCK
      ?auto_117212 - BLOCK
      ?auto_117213 - BLOCK
    )
    :vars
    (
      ?auto_117214 - BLOCK
      ?auto_117218 - BLOCK
      ?auto_117217 - BLOCK
      ?auto_117215 - BLOCK
      ?auto_117216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117214 ?auto_117213 ) ( ON-TABLE ?auto_117210 ) ( ON ?auto_117211 ?auto_117210 ) ( ON ?auto_117212 ?auto_117211 ) ( ON ?auto_117213 ?auto_117212 ) ( not ( = ?auto_117210 ?auto_117211 ) ) ( not ( = ?auto_117210 ?auto_117212 ) ) ( not ( = ?auto_117210 ?auto_117213 ) ) ( not ( = ?auto_117210 ?auto_117214 ) ) ( not ( = ?auto_117211 ?auto_117212 ) ) ( not ( = ?auto_117211 ?auto_117213 ) ) ( not ( = ?auto_117211 ?auto_117214 ) ) ( not ( = ?auto_117212 ?auto_117213 ) ) ( not ( = ?auto_117212 ?auto_117214 ) ) ( not ( = ?auto_117213 ?auto_117214 ) ) ( not ( = ?auto_117210 ?auto_117218 ) ) ( not ( = ?auto_117210 ?auto_117217 ) ) ( not ( = ?auto_117211 ?auto_117218 ) ) ( not ( = ?auto_117211 ?auto_117217 ) ) ( not ( = ?auto_117212 ?auto_117218 ) ) ( not ( = ?auto_117212 ?auto_117217 ) ) ( not ( = ?auto_117213 ?auto_117218 ) ) ( not ( = ?auto_117213 ?auto_117217 ) ) ( not ( = ?auto_117214 ?auto_117218 ) ) ( not ( = ?auto_117214 ?auto_117217 ) ) ( not ( = ?auto_117218 ?auto_117217 ) ) ( ON ?auto_117218 ?auto_117214 ) ( ON-TABLE ?auto_117215 ) ( not ( = ?auto_117215 ?auto_117216 ) ) ( not ( = ?auto_117215 ?auto_117217 ) ) ( not ( = ?auto_117216 ?auto_117217 ) ) ( not ( = ?auto_117210 ?auto_117216 ) ) ( not ( = ?auto_117210 ?auto_117215 ) ) ( not ( = ?auto_117211 ?auto_117216 ) ) ( not ( = ?auto_117211 ?auto_117215 ) ) ( not ( = ?auto_117212 ?auto_117216 ) ) ( not ( = ?auto_117212 ?auto_117215 ) ) ( not ( = ?auto_117213 ?auto_117216 ) ) ( not ( = ?auto_117213 ?auto_117215 ) ) ( not ( = ?auto_117214 ?auto_117216 ) ) ( not ( = ?auto_117214 ?auto_117215 ) ) ( not ( = ?auto_117218 ?auto_117216 ) ) ( not ( = ?auto_117218 ?auto_117215 ) ) ( ON ?auto_117217 ?auto_117218 ) ( CLEAR ?auto_117217 ) ( HOLDING ?auto_117216 ) ( CLEAR ?auto_117215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117215 ?auto_117216 )
      ( MAKE-4PILE ?auto_117210 ?auto_117211 ?auto_117212 ?auto_117213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118912 - BLOCK
      ?auto_118913 - BLOCK
      ?auto_118914 - BLOCK
      ?auto_118915 - BLOCK
    )
    :vars
    (
      ?auto_118918 - BLOCK
      ?auto_118917 - BLOCK
      ?auto_118916 - BLOCK
      ?auto_118919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118918 ?auto_118915 ) ( ON-TABLE ?auto_118912 ) ( ON ?auto_118913 ?auto_118912 ) ( ON ?auto_118914 ?auto_118913 ) ( ON ?auto_118915 ?auto_118914 ) ( not ( = ?auto_118912 ?auto_118913 ) ) ( not ( = ?auto_118912 ?auto_118914 ) ) ( not ( = ?auto_118912 ?auto_118915 ) ) ( not ( = ?auto_118912 ?auto_118918 ) ) ( not ( = ?auto_118913 ?auto_118914 ) ) ( not ( = ?auto_118913 ?auto_118915 ) ) ( not ( = ?auto_118913 ?auto_118918 ) ) ( not ( = ?auto_118914 ?auto_118915 ) ) ( not ( = ?auto_118914 ?auto_118918 ) ) ( not ( = ?auto_118915 ?auto_118918 ) ) ( not ( = ?auto_118912 ?auto_118917 ) ) ( not ( = ?auto_118912 ?auto_118916 ) ) ( not ( = ?auto_118913 ?auto_118917 ) ) ( not ( = ?auto_118913 ?auto_118916 ) ) ( not ( = ?auto_118914 ?auto_118917 ) ) ( not ( = ?auto_118914 ?auto_118916 ) ) ( not ( = ?auto_118915 ?auto_118917 ) ) ( not ( = ?auto_118915 ?auto_118916 ) ) ( not ( = ?auto_118918 ?auto_118917 ) ) ( not ( = ?auto_118918 ?auto_118916 ) ) ( not ( = ?auto_118917 ?auto_118916 ) ) ( ON ?auto_118917 ?auto_118918 ) ( not ( = ?auto_118919 ?auto_118916 ) ) ( not ( = ?auto_118912 ?auto_118919 ) ) ( not ( = ?auto_118913 ?auto_118919 ) ) ( not ( = ?auto_118914 ?auto_118919 ) ) ( not ( = ?auto_118915 ?auto_118919 ) ) ( not ( = ?auto_118918 ?auto_118919 ) ) ( not ( = ?auto_118917 ?auto_118919 ) ) ( ON ?auto_118916 ?auto_118917 ) ( ON ?auto_118919 ?auto_118916 ) ( CLEAR ?auto_118919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118912 ?auto_118913 ?auto_118914 ?auto_118915 ?auto_118918 ?auto_118917 ?auto_118916 )
      ( MAKE-4PILE ?auto_118912 ?auto_118913 ?auto_118914 ?auto_118915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117228 - BLOCK
      ?auto_117229 - BLOCK
      ?auto_117230 - BLOCK
      ?auto_117231 - BLOCK
    )
    :vars
    (
      ?auto_117236 - BLOCK
      ?auto_117235 - BLOCK
      ?auto_117232 - BLOCK
      ?auto_117233 - BLOCK
      ?auto_117234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117236 ?auto_117231 ) ( ON-TABLE ?auto_117228 ) ( ON ?auto_117229 ?auto_117228 ) ( ON ?auto_117230 ?auto_117229 ) ( ON ?auto_117231 ?auto_117230 ) ( not ( = ?auto_117228 ?auto_117229 ) ) ( not ( = ?auto_117228 ?auto_117230 ) ) ( not ( = ?auto_117228 ?auto_117231 ) ) ( not ( = ?auto_117228 ?auto_117236 ) ) ( not ( = ?auto_117229 ?auto_117230 ) ) ( not ( = ?auto_117229 ?auto_117231 ) ) ( not ( = ?auto_117229 ?auto_117236 ) ) ( not ( = ?auto_117230 ?auto_117231 ) ) ( not ( = ?auto_117230 ?auto_117236 ) ) ( not ( = ?auto_117231 ?auto_117236 ) ) ( not ( = ?auto_117228 ?auto_117235 ) ) ( not ( = ?auto_117228 ?auto_117232 ) ) ( not ( = ?auto_117229 ?auto_117235 ) ) ( not ( = ?auto_117229 ?auto_117232 ) ) ( not ( = ?auto_117230 ?auto_117235 ) ) ( not ( = ?auto_117230 ?auto_117232 ) ) ( not ( = ?auto_117231 ?auto_117235 ) ) ( not ( = ?auto_117231 ?auto_117232 ) ) ( not ( = ?auto_117236 ?auto_117235 ) ) ( not ( = ?auto_117236 ?auto_117232 ) ) ( not ( = ?auto_117235 ?auto_117232 ) ) ( ON ?auto_117235 ?auto_117236 ) ( not ( = ?auto_117233 ?auto_117234 ) ) ( not ( = ?auto_117233 ?auto_117232 ) ) ( not ( = ?auto_117234 ?auto_117232 ) ) ( not ( = ?auto_117228 ?auto_117234 ) ) ( not ( = ?auto_117228 ?auto_117233 ) ) ( not ( = ?auto_117229 ?auto_117234 ) ) ( not ( = ?auto_117229 ?auto_117233 ) ) ( not ( = ?auto_117230 ?auto_117234 ) ) ( not ( = ?auto_117230 ?auto_117233 ) ) ( not ( = ?auto_117231 ?auto_117234 ) ) ( not ( = ?auto_117231 ?auto_117233 ) ) ( not ( = ?auto_117236 ?auto_117234 ) ) ( not ( = ?auto_117236 ?auto_117233 ) ) ( not ( = ?auto_117235 ?auto_117234 ) ) ( not ( = ?auto_117235 ?auto_117233 ) ) ( ON ?auto_117232 ?auto_117235 ) ( ON ?auto_117234 ?auto_117232 ) ( CLEAR ?auto_117234 ) ( HOLDING ?auto_117233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117233 )
      ( MAKE-4PILE ?auto_117228 ?auto_117229 ?auto_117230 ?auto_117231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117237 - BLOCK
      ?auto_117238 - BLOCK
      ?auto_117239 - BLOCK
      ?auto_117240 - BLOCK
    )
    :vars
    (
      ?auto_117245 - BLOCK
      ?auto_117244 - BLOCK
      ?auto_117241 - BLOCK
      ?auto_117242 - BLOCK
      ?auto_117243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117245 ?auto_117240 ) ( ON-TABLE ?auto_117237 ) ( ON ?auto_117238 ?auto_117237 ) ( ON ?auto_117239 ?auto_117238 ) ( ON ?auto_117240 ?auto_117239 ) ( not ( = ?auto_117237 ?auto_117238 ) ) ( not ( = ?auto_117237 ?auto_117239 ) ) ( not ( = ?auto_117237 ?auto_117240 ) ) ( not ( = ?auto_117237 ?auto_117245 ) ) ( not ( = ?auto_117238 ?auto_117239 ) ) ( not ( = ?auto_117238 ?auto_117240 ) ) ( not ( = ?auto_117238 ?auto_117245 ) ) ( not ( = ?auto_117239 ?auto_117240 ) ) ( not ( = ?auto_117239 ?auto_117245 ) ) ( not ( = ?auto_117240 ?auto_117245 ) ) ( not ( = ?auto_117237 ?auto_117244 ) ) ( not ( = ?auto_117237 ?auto_117241 ) ) ( not ( = ?auto_117238 ?auto_117244 ) ) ( not ( = ?auto_117238 ?auto_117241 ) ) ( not ( = ?auto_117239 ?auto_117244 ) ) ( not ( = ?auto_117239 ?auto_117241 ) ) ( not ( = ?auto_117240 ?auto_117244 ) ) ( not ( = ?auto_117240 ?auto_117241 ) ) ( not ( = ?auto_117245 ?auto_117244 ) ) ( not ( = ?auto_117245 ?auto_117241 ) ) ( not ( = ?auto_117244 ?auto_117241 ) ) ( ON ?auto_117244 ?auto_117245 ) ( not ( = ?auto_117242 ?auto_117243 ) ) ( not ( = ?auto_117242 ?auto_117241 ) ) ( not ( = ?auto_117243 ?auto_117241 ) ) ( not ( = ?auto_117237 ?auto_117243 ) ) ( not ( = ?auto_117237 ?auto_117242 ) ) ( not ( = ?auto_117238 ?auto_117243 ) ) ( not ( = ?auto_117238 ?auto_117242 ) ) ( not ( = ?auto_117239 ?auto_117243 ) ) ( not ( = ?auto_117239 ?auto_117242 ) ) ( not ( = ?auto_117240 ?auto_117243 ) ) ( not ( = ?auto_117240 ?auto_117242 ) ) ( not ( = ?auto_117245 ?auto_117243 ) ) ( not ( = ?auto_117245 ?auto_117242 ) ) ( not ( = ?auto_117244 ?auto_117243 ) ) ( not ( = ?auto_117244 ?auto_117242 ) ) ( ON ?auto_117241 ?auto_117244 ) ( ON ?auto_117243 ?auto_117241 ) ( ON ?auto_117242 ?auto_117243 ) ( CLEAR ?auto_117242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117237 ?auto_117238 ?auto_117239 ?auto_117240 ?auto_117245 ?auto_117244 ?auto_117241 ?auto_117243 )
      ( MAKE-4PILE ?auto_117237 ?auto_117238 ?auto_117239 ?auto_117240 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117251 - BLOCK
      ?auto_117252 - BLOCK
      ?auto_117253 - BLOCK
      ?auto_117254 - BLOCK
      ?auto_117255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117255 ) ( CLEAR ?auto_117254 ) ( ON-TABLE ?auto_117251 ) ( ON ?auto_117252 ?auto_117251 ) ( ON ?auto_117253 ?auto_117252 ) ( ON ?auto_117254 ?auto_117253 ) ( not ( = ?auto_117251 ?auto_117252 ) ) ( not ( = ?auto_117251 ?auto_117253 ) ) ( not ( = ?auto_117251 ?auto_117254 ) ) ( not ( = ?auto_117251 ?auto_117255 ) ) ( not ( = ?auto_117252 ?auto_117253 ) ) ( not ( = ?auto_117252 ?auto_117254 ) ) ( not ( = ?auto_117252 ?auto_117255 ) ) ( not ( = ?auto_117253 ?auto_117254 ) ) ( not ( = ?auto_117253 ?auto_117255 ) ) ( not ( = ?auto_117254 ?auto_117255 ) ) )
    :subtasks
    ( ( !STACK ?auto_117255 ?auto_117254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117256 - BLOCK
      ?auto_117257 - BLOCK
      ?auto_117258 - BLOCK
      ?auto_117259 - BLOCK
      ?auto_117260 - BLOCK
    )
    :vars
    (
      ?auto_117261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117259 ) ( ON-TABLE ?auto_117256 ) ( ON ?auto_117257 ?auto_117256 ) ( ON ?auto_117258 ?auto_117257 ) ( ON ?auto_117259 ?auto_117258 ) ( not ( = ?auto_117256 ?auto_117257 ) ) ( not ( = ?auto_117256 ?auto_117258 ) ) ( not ( = ?auto_117256 ?auto_117259 ) ) ( not ( = ?auto_117256 ?auto_117260 ) ) ( not ( = ?auto_117257 ?auto_117258 ) ) ( not ( = ?auto_117257 ?auto_117259 ) ) ( not ( = ?auto_117257 ?auto_117260 ) ) ( not ( = ?auto_117258 ?auto_117259 ) ) ( not ( = ?auto_117258 ?auto_117260 ) ) ( not ( = ?auto_117259 ?auto_117260 ) ) ( ON ?auto_117260 ?auto_117261 ) ( CLEAR ?auto_117260 ) ( HAND-EMPTY ) ( not ( = ?auto_117256 ?auto_117261 ) ) ( not ( = ?auto_117257 ?auto_117261 ) ) ( not ( = ?auto_117258 ?auto_117261 ) ) ( not ( = ?auto_117259 ?auto_117261 ) ) ( not ( = ?auto_117260 ?auto_117261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117260 ?auto_117261 )
      ( MAKE-5PILE ?auto_117256 ?auto_117257 ?auto_117258 ?auto_117259 ?auto_117260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117262 - BLOCK
      ?auto_117263 - BLOCK
      ?auto_117264 - BLOCK
      ?auto_117265 - BLOCK
      ?auto_117266 - BLOCK
    )
    :vars
    (
      ?auto_117267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117262 ) ( ON ?auto_117263 ?auto_117262 ) ( ON ?auto_117264 ?auto_117263 ) ( not ( = ?auto_117262 ?auto_117263 ) ) ( not ( = ?auto_117262 ?auto_117264 ) ) ( not ( = ?auto_117262 ?auto_117265 ) ) ( not ( = ?auto_117262 ?auto_117266 ) ) ( not ( = ?auto_117263 ?auto_117264 ) ) ( not ( = ?auto_117263 ?auto_117265 ) ) ( not ( = ?auto_117263 ?auto_117266 ) ) ( not ( = ?auto_117264 ?auto_117265 ) ) ( not ( = ?auto_117264 ?auto_117266 ) ) ( not ( = ?auto_117265 ?auto_117266 ) ) ( ON ?auto_117266 ?auto_117267 ) ( CLEAR ?auto_117266 ) ( not ( = ?auto_117262 ?auto_117267 ) ) ( not ( = ?auto_117263 ?auto_117267 ) ) ( not ( = ?auto_117264 ?auto_117267 ) ) ( not ( = ?auto_117265 ?auto_117267 ) ) ( not ( = ?auto_117266 ?auto_117267 ) ) ( HOLDING ?auto_117265 ) ( CLEAR ?auto_117264 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117262 ?auto_117263 ?auto_117264 ?auto_117265 )
      ( MAKE-5PILE ?auto_117262 ?auto_117263 ?auto_117264 ?auto_117265 ?auto_117266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117268 - BLOCK
      ?auto_117269 - BLOCK
      ?auto_117270 - BLOCK
      ?auto_117271 - BLOCK
      ?auto_117272 - BLOCK
    )
    :vars
    (
      ?auto_117273 - BLOCK
      ?auto_117274 - BLOCK
      ?auto_117276 - BLOCK
      ?auto_117275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117268 ) ( ON ?auto_117269 ?auto_117268 ) ( ON ?auto_117270 ?auto_117269 ) ( not ( = ?auto_117268 ?auto_117269 ) ) ( not ( = ?auto_117268 ?auto_117270 ) ) ( not ( = ?auto_117268 ?auto_117271 ) ) ( not ( = ?auto_117268 ?auto_117272 ) ) ( not ( = ?auto_117269 ?auto_117270 ) ) ( not ( = ?auto_117269 ?auto_117271 ) ) ( not ( = ?auto_117269 ?auto_117272 ) ) ( not ( = ?auto_117270 ?auto_117271 ) ) ( not ( = ?auto_117270 ?auto_117272 ) ) ( not ( = ?auto_117271 ?auto_117272 ) ) ( ON ?auto_117272 ?auto_117273 ) ( not ( = ?auto_117268 ?auto_117273 ) ) ( not ( = ?auto_117269 ?auto_117273 ) ) ( not ( = ?auto_117270 ?auto_117273 ) ) ( not ( = ?auto_117271 ?auto_117273 ) ) ( not ( = ?auto_117272 ?auto_117273 ) ) ( CLEAR ?auto_117270 ) ( ON ?auto_117271 ?auto_117272 ) ( CLEAR ?auto_117271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117274 ) ( ON ?auto_117276 ?auto_117274 ) ( ON ?auto_117275 ?auto_117276 ) ( ON ?auto_117273 ?auto_117275 ) ( not ( = ?auto_117274 ?auto_117276 ) ) ( not ( = ?auto_117274 ?auto_117275 ) ) ( not ( = ?auto_117274 ?auto_117273 ) ) ( not ( = ?auto_117274 ?auto_117272 ) ) ( not ( = ?auto_117274 ?auto_117271 ) ) ( not ( = ?auto_117276 ?auto_117275 ) ) ( not ( = ?auto_117276 ?auto_117273 ) ) ( not ( = ?auto_117276 ?auto_117272 ) ) ( not ( = ?auto_117276 ?auto_117271 ) ) ( not ( = ?auto_117275 ?auto_117273 ) ) ( not ( = ?auto_117275 ?auto_117272 ) ) ( not ( = ?auto_117275 ?auto_117271 ) ) ( not ( = ?auto_117268 ?auto_117274 ) ) ( not ( = ?auto_117268 ?auto_117276 ) ) ( not ( = ?auto_117268 ?auto_117275 ) ) ( not ( = ?auto_117269 ?auto_117274 ) ) ( not ( = ?auto_117269 ?auto_117276 ) ) ( not ( = ?auto_117269 ?auto_117275 ) ) ( not ( = ?auto_117270 ?auto_117274 ) ) ( not ( = ?auto_117270 ?auto_117276 ) ) ( not ( = ?auto_117270 ?auto_117275 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117274 ?auto_117276 ?auto_117275 ?auto_117273 ?auto_117272 )
      ( MAKE-5PILE ?auto_117268 ?auto_117269 ?auto_117270 ?auto_117271 ?auto_117272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117277 - BLOCK
      ?auto_117278 - BLOCK
      ?auto_117279 - BLOCK
      ?auto_117280 - BLOCK
      ?auto_117281 - BLOCK
    )
    :vars
    (
      ?auto_117285 - BLOCK
      ?auto_117284 - BLOCK
      ?auto_117282 - BLOCK
      ?auto_117283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117277 ) ( ON ?auto_117278 ?auto_117277 ) ( not ( = ?auto_117277 ?auto_117278 ) ) ( not ( = ?auto_117277 ?auto_117279 ) ) ( not ( = ?auto_117277 ?auto_117280 ) ) ( not ( = ?auto_117277 ?auto_117281 ) ) ( not ( = ?auto_117278 ?auto_117279 ) ) ( not ( = ?auto_117278 ?auto_117280 ) ) ( not ( = ?auto_117278 ?auto_117281 ) ) ( not ( = ?auto_117279 ?auto_117280 ) ) ( not ( = ?auto_117279 ?auto_117281 ) ) ( not ( = ?auto_117280 ?auto_117281 ) ) ( ON ?auto_117281 ?auto_117285 ) ( not ( = ?auto_117277 ?auto_117285 ) ) ( not ( = ?auto_117278 ?auto_117285 ) ) ( not ( = ?auto_117279 ?auto_117285 ) ) ( not ( = ?auto_117280 ?auto_117285 ) ) ( not ( = ?auto_117281 ?auto_117285 ) ) ( ON ?auto_117280 ?auto_117281 ) ( CLEAR ?auto_117280 ) ( ON-TABLE ?auto_117284 ) ( ON ?auto_117282 ?auto_117284 ) ( ON ?auto_117283 ?auto_117282 ) ( ON ?auto_117285 ?auto_117283 ) ( not ( = ?auto_117284 ?auto_117282 ) ) ( not ( = ?auto_117284 ?auto_117283 ) ) ( not ( = ?auto_117284 ?auto_117285 ) ) ( not ( = ?auto_117284 ?auto_117281 ) ) ( not ( = ?auto_117284 ?auto_117280 ) ) ( not ( = ?auto_117282 ?auto_117283 ) ) ( not ( = ?auto_117282 ?auto_117285 ) ) ( not ( = ?auto_117282 ?auto_117281 ) ) ( not ( = ?auto_117282 ?auto_117280 ) ) ( not ( = ?auto_117283 ?auto_117285 ) ) ( not ( = ?auto_117283 ?auto_117281 ) ) ( not ( = ?auto_117283 ?auto_117280 ) ) ( not ( = ?auto_117277 ?auto_117284 ) ) ( not ( = ?auto_117277 ?auto_117282 ) ) ( not ( = ?auto_117277 ?auto_117283 ) ) ( not ( = ?auto_117278 ?auto_117284 ) ) ( not ( = ?auto_117278 ?auto_117282 ) ) ( not ( = ?auto_117278 ?auto_117283 ) ) ( not ( = ?auto_117279 ?auto_117284 ) ) ( not ( = ?auto_117279 ?auto_117282 ) ) ( not ( = ?auto_117279 ?auto_117283 ) ) ( HOLDING ?auto_117279 ) ( CLEAR ?auto_117278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117277 ?auto_117278 ?auto_117279 )
      ( MAKE-5PILE ?auto_117277 ?auto_117278 ?auto_117279 ?auto_117280 ?auto_117281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117286 - BLOCK
      ?auto_117287 - BLOCK
      ?auto_117288 - BLOCK
      ?auto_117289 - BLOCK
      ?auto_117290 - BLOCK
    )
    :vars
    (
      ?auto_117294 - BLOCK
      ?auto_117293 - BLOCK
      ?auto_117291 - BLOCK
      ?auto_117292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117286 ) ( ON ?auto_117287 ?auto_117286 ) ( not ( = ?auto_117286 ?auto_117287 ) ) ( not ( = ?auto_117286 ?auto_117288 ) ) ( not ( = ?auto_117286 ?auto_117289 ) ) ( not ( = ?auto_117286 ?auto_117290 ) ) ( not ( = ?auto_117287 ?auto_117288 ) ) ( not ( = ?auto_117287 ?auto_117289 ) ) ( not ( = ?auto_117287 ?auto_117290 ) ) ( not ( = ?auto_117288 ?auto_117289 ) ) ( not ( = ?auto_117288 ?auto_117290 ) ) ( not ( = ?auto_117289 ?auto_117290 ) ) ( ON ?auto_117290 ?auto_117294 ) ( not ( = ?auto_117286 ?auto_117294 ) ) ( not ( = ?auto_117287 ?auto_117294 ) ) ( not ( = ?auto_117288 ?auto_117294 ) ) ( not ( = ?auto_117289 ?auto_117294 ) ) ( not ( = ?auto_117290 ?auto_117294 ) ) ( ON ?auto_117289 ?auto_117290 ) ( ON-TABLE ?auto_117293 ) ( ON ?auto_117291 ?auto_117293 ) ( ON ?auto_117292 ?auto_117291 ) ( ON ?auto_117294 ?auto_117292 ) ( not ( = ?auto_117293 ?auto_117291 ) ) ( not ( = ?auto_117293 ?auto_117292 ) ) ( not ( = ?auto_117293 ?auto_117294 ) ) ( not ( = ?auto_117293 ?auto_117290 ) ) ( not ( = ?auto_117293 ?auto_117289 ) ) ( not ( = ?auto_117291 ?auto_117292 ) ) ( not ( = ?auto_117291 ?auto_117294 ) ) ( not ( = ?auto_117291 ?auto_117290 ) ) ( not ( = ?auto_117291 ?auto_117289 ) ) ( not ( = ?auto_117292 ?auto_117294 ) ) ( not ( = ?auto_117292 ?auto_117290 ) ) ( not ( = ?auto_117292 ?auto_117289 ) ) ( not ( = ?auto_117286 ?auto_117293 ) ) ( not ( = ?auto_117286 ?auto_117291 ) ) ( not ( = ?auto_117286 ?auto_117292 ) ) ( not ( = ?auto_117287 ?auto_117293 ) ) ( not ( = ?auto_117287 ?auto_117291 ) ) ( not ( = ?auto_117287 ?auto_117292 ) ) ( not ( = ?auto_117288 ?auto_117293 ) ) ( not ( = ?auto_117288 ?auto_117291 ) ) ( not ( = ?auto_117288 ?auto_117292 ) ) ( CLEAR ?auto_117287 ) ( ON ?auto_117288 ?auto_117289 ) ( CLEAR ?auto_117288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117293 ?auto_117291 ?auto_117292 ?auto_117294 ?auto_117290 ?auto_117289 )
      ( MAKE-5PILE ?auto_117286 ?auto_117287 ?auto_117288 ?auto_117289 ?auto_117290 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117295 - BLOCK
      ?auto_117296 - BLOCK
      ?auto_117297 - BLOCK
      ?auto_117298 - BLOCK
      ?auto_117299 - BLOCK
    )
    :vars
    (
      ?auto_117300 - BLOCK
      ?auto_117303 - BLOCK
      ?auto_117302 - BLOCK
      ?auto_117301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117295 ) ( not ( = ?auto_117295 ?auto_117296 ) ) ( not ( = ?auto_117295 ?auto_117297 ) ) ( not ( = ?auto_117295 ?auto_117298 ) ) ( not ( = ?auto_117295 ?auto_117299 ) ) ( not ( = ?auto_117296 ?auto_117297 ) ) ( not ( = ?auto_117296 ?auto_117298 ) ) ( not ( = ?auto_117296 ?auto_117299 ) ) ( not ( = ?auto_117297 ?auto_117298 ) ) ( not ( = ?auto_117297 ?auto_117299 ) ) ( not ( = ?auto_117298 ?auto_117299 ) ) ( ON ?auto_117299 ?auto_117300 ) ( not ( = ?auto_117295 ?auto_117300 ) ) ( not ( = ?auto_117296 ?auto_117300 ) ) ( not ( = ?auto_117297 ?auto_117300 ) ) ( not ( = ?auto_117298 ?auto_117300 ) ) ( not ( = ?auto_117299 ?auto_117300 ) ) ( ON ?auto_117298 ?auto_117299 ) ( ON-TABLE ?auto_117303 ) ( ON ?auto_117302 ?auto_117303 ) ( ON ?auto_117301 ?auto_117302 ) ( ON ?auto_117300 ?auto_117301 ) ( not ( = ?auto_117303 ?auto_117302 ) ) ( not ( = ?auto_117303 ?auto_117301 ) ) ( not ( = ?auto_117303 ?auto_117300 ) ) ( not ( = ?auto_117303 ?auto_117299 ) ) ( not ( = ?auto_117303 ?auto_117298 ) ) ( not ( = ?auto_117302 ?auto_117301 ) ) ( not ( = ?auto_117302 ?auto_117300 ) ) ( not ( = ?auto_117302 ?auto_117299 ) ) ( not ( = ?auto_117302 ?auto_117298 ) ) ( not ( = ?auto_117301 ?auto_117300 ) ) ( not ( = ?auto_117301 ?auto_117299 ) ) ( not ( = ?auto_117301 ?auto_117298 ) ) ( not ( = ?auto_117295 ?auto_117303 ) ) ( not ( = ?auto_117295 ?auto_117302 ) ) ( not ( = ?auto_117295 ?auto_117301 ) ) ( not ( = ?auto_117296 ?auto_117303 ) ) ( not ( = ?auto_117296 ?auto_117302 ) ) ( not ( = ?auto_117296 ?auto_117301 ) ) ( not ( = ?auto_117297 ?auto_117303 ) ) ( not ( = ?auto_117297 ?auto_117302 ) ) ( not ( = ?auto_117297 ?auto_117301 ) ) ( ON ?auto_117297 ?auto_117298 ) ( CLEAR ?auto_117297 ) ( HOLDING ?auto_117296 ) ( CLEAR ?auto_117295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117295 ?auto_117296 )
      ( MAKE-5PILE ?auto_117295 ?auto_117296 ?auto_117297 ?auto_117298 ?auto_117299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117304 - BLOCK
      ?auto_117305 - BLOCK
      ?auto_117306 - BLOCK
      ?auto_117307 - BLOCK
      ?auto_117308 - BLOCK
    )
    :vars
    (
      ?auto_117311 - BLOCK
      ?auto_117310 - BLOCK
      ?auto_117312 - BLOCK
      ?auto_117309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117304 ) ( not ( = ?auto_117304 ?auto_117305 ) ) ( not ( = ?auto_117304 ?auto_117306 ) ) ( not ( = ?auto_117304 ?auto_117307 ) ) ( not ( = ?auto_117304 ?auto_117308 ) ) ( not ( = ?auto_117305 ?auto_117306 ) ) ( not ( = ?auto_117305 ?auto_117307 ) ) ( not ( = ?auto_117305 ?auto_117308 ) ) ( not ( = ?auto_117306 ?auto_117307 ) ) ( not ( = ?auto_117306 ?auto_117308 ) ) ( not ( = ?auto_117307 ?auto_117308 ) ) ( ON ?auto_117308 ?auto_117311 ) ( not ( = ?auto_117304 ?auto_117311 ) ) ( not ( = ?auto_117305 ?auto_117311 ) ) ( not ( = ?auto_117306 ?auto_117311 ) ) ( not ( = ?auto_117307 ?auto_117311 ) ) ( not ( = ?auto_117308 ?auto_117311 ) ) ( ON ?auto_117307 ?auto_117308 ) ( ON-TABLE ?auto_117310 ) ( ON ?auto_117312 ?auto_117310 ) ( ON ?auto_117309 ?auto_117312 ) ( ON ?auto_117311 ?auto_117309 ) ( not ( = ?auto_117310 ?auto_117312 ) ) ( not ( = ?auto_117310 ?auto_117309 ) ) ( not ( = ?auto_117310 ?auto_117311 ) ) ( not ( = ?auto_117310 ?auto_117308 ) ) ( not ( = ?auto_117310 ?auto_117307 ) ) ( not ( = ?auto_117312 ?auto_117309 ) ) ( not ( = ?auto_117312 ?auto_117311 ) ) ( not ( = ?auto_117312 ?auto_117308 ) ) ( not ( = ?auto_117312 ?auto_117307 ) ) ( not ( = ?auto_117309 ?auto_117311 ) ) ( not ( = ?auto_117309 ?auto_117308 ) ) ( not ( = ?auto_117309 ?auto_117307 ) ) ( not ( = ?auto_117304 ?auto_117310 ) ) ( not ( = ?auto_117304 ?auto_117312 ) ) ( not ( = ?auto_117304 ?auto_117309 ) ) ( not ( = ?auto_117305 ?auto_117310 ) ) ( not ( = ?auto_117305 ?auto_117312 ) ) ( not ( = ?auto_117305 ?auto_117309 ) ) ( not ( = ?auto_117306 ?auto_117310 ) ) ( not ( = ?auto_117306 ?auto_117312 ) ) ( not ( = ?auto_117306 ?auto_117309 ) ) ( ON ?auto_117306 ?auto_117307 ) ( CLEAR ?auto_117304 ) ( ON ?auto_117305 ?auto_117306 ) ( CLEAR ?auto_117305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117310 ?auto_117312 ?auto_117309 ?auto_117311 ?auto_117308 ?auto_117307 ?auto_117306 )
      ( MAKE-5PILE ?auto_117304 ?auto_117305 ?auto_117306 ?auto_117307 ?auto_117308 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117313 - BLOCK
      ?auto_117314 - BLOCK
      ?auto_117315 - BLOCK
      ?auto_117316 - BLOCK
      ?auto_117317 - BLOCK
    )
    :vars
    (
      ?auto_117320 - BLOCK
      ?auto_117321 - BLOCK
      ?auto_117318 - BLOCK
      ?auto_117319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117313 ?auto_117314 ) ) ( not ( = ?auto_117313 ?auto_117315 ) ) ( not ( = ?auto_117313 ?auto_117316 ) ) ( not ( = ?auto_117313 ?auto_117317 ) ) ( not ( = ?auto_117314 ?auto_117315 ) ) ( not ( = ?auto_117314 ?auto_117316 ) ) ( not ( = ?auto_117314 ?auto_117317 ) ) ( not ( = ?auto_117315 ?auto_117316 ) ) ( not ( = ?auto_117315 ?auto_117317 ) ) ( not ( = ?auto_117316 ?auto_117317 ) ) ( ON ?auto_117317 ?auto_117320 ) ( not ( = ?auto_117313 ?auto_117320 ) ) ( not ( = ?auto_117314 ?auto_117320 ) ) ( not ( = ?auto_117315 ?auto_117320 ) ) ( not ( = ?auto_117316 ?auto_117320 ) ) ( not ( = ?auto_117317 ?auto_117320 ) ) ( ON ?auto_117316 ?auto_117317 ) ( ON-TABLE ?auto_117321 ) ( ON ?auto_117318 ?auto_117321 ) ( ON ?auto_117319 ?auto_117318 ) ( ON ?auto_117320 ?auto_117319 ) ( not ( = ?auto_117321 ?auto_117318 ) ) ( not ( = ?auto_117321 ?auto_117319 ) ) ( not ( = ?auto_117321 ?auto_117320 ) ) ( not ( = ?auto_117321 ?auto_117317 ) ) ( not ( = ?auto_117321 ?auto_117316 ) ) ( not ( = ?auto_117318 ?auto_117319 ) ) ( not ( = ?auto_117318 ?auto_117320 ) ) ( not ( = ?auto_117318 ?auto_117317 ) ) ( not ( = ?auto_117318 ?auto_117316 ) ) ( not ( = ?auto_117319 ?auto_117320 ) ) ( not ( = ?auto_117319 ?auto_117317 ) ) ( not ( = ?auto_117319 ?auto_117316 ) ) ( not ( = ?auto_117313 ?auto_117321 ) ) ( not ( = ?auto_117313 ?auto_117318 ) ) ( not ( = ?auto_117313 ?auto_117319 ) ) ( not ( = ?auto_117314 ?auto_117321 ) ) ( not ( = ?auto_117314 ?auto_117318 ) ) ( not ( = ?auto_117314 ?auto_117319 ) ) ( not ( = ?auto_117315 ?auto_117321 ) ) ( not ( = ?auto_117315 ?auto_117318 ) ) ( not ( = ?auto_117315 ?auto_117319 ) ) ( ON ?auto_117315 ?auto_117316 ) ( ON ?auto_117314 ?auto_117315 ) ( CLEAR ?auto_117314 ) ( HOLDING ?auto_117313 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117313 )
      ( MAKE-5PILE ?auto_117313 ?auto_117314 ?auto_117315 ?auto_117316 ?auto_117317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117322 - BLOCK
      ?auto_117323 - BLOCK
      ?auto_117324 - BLOCK
      ?auto_117325 - BLOCK
      ?auto_117326 - BLOCK
    )
    :vars
    (
      ?auto_117329 - BLOCK
      ?auto_117328 - BLOCK
      ?auto_117327 - BLOCK
      ?auto_117330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117322 ?auto_117323 ) ) ( not ( = ?auto_117322 ?auto_117324 ) ) ( not ( = ?auto_117322 ?auto_117325 ) ) ( not ( = ?auto_117322 ?auto_117326 ) ) ( not ( = ?auto_117323 ?auto_117324 ) ) ( not ( = ?auto_117323 ?auto_117325 ) ) ( not ( = ?auto_117323 ?auto_117326 ) ) ( not ( = ?auto_117324 ?auto_117325 ) ) ( not ( = ?auto_117324 ?auto_117326 ) ) ( not ( = ?auto_117325 ?auto_117326 ) ) ( ON ?auto_117326 ?auto_117329 ) ( not ( = ?auto_117322 ?auto_117329 ) ) ( not ( = ?auto_117323 ?auto_117329 ) ) ( not ( = ?auto_117324 ?auto_117329 ) ) ( not ( = ?auto_117325 ?auto_117329 ) ) ( not ( = ?auto_117326 ?auto_117329 ) ) ( ON ?auto_117325 ?auto_117326 ) ( ON-TABLE ?auto_117328 ) ( ON ?auto_117327 ?auto_117328 ) ( ON ?auto_117330 ?auto_117327 ) ( ON ?auto_117329 ?auto_117330 ) ( not ( = ?auto_117328 ?auto_117327 ) ) ( not ( = ?auto_117328 ?auto_117330 ) ) ( not ( = ?auto_117328 ?auto_117329 ) ) ( not ( = ?auto_117328 ?auto_117326 ) ) ( not ( = ?auto_117328 ?auto_117325 ) ) ( not ( = ?auto_117327 ?auto_117330 ) ) ( not ( = ?auto_117327 ?auto_117329 ) ) ( not ( = ?auto_117327 ?auto_117326 ) ) ( not ( = ?auto_117327 ?auto_117325 ) ) ( not ( = ?auto_117330 ?auto_117329 ) ) ( not ( = ?auto_117330 ?auto_117326 ) ) ( not ( = ?auto_117330 ?auto_117325 ) ) ( not ( = ?auto_117322 ?auto_117328 ) ) ( not ( = ?auto_117322 ?auto_117327 ) ) ( not ( = ?auto_117322 ?auto_117330 ) ) ( not ( = ?auto_117323 ?auto_117328 ) ) ( not ( = ?auto_117323 ?auto_117327 ) ) ( not ( = ?auto_117323 ?auto_117330 ) ) ( not ( = ?auto_117324 ?auto_117328 ) ) ( not ( = ?auto_117324 ?auto_117327 ) ) ( not ( = ?auto_117324 ?auto_117330 ) ) ( ON ?auto_117324 ?auto_117325 ) ( ON ?auto_117323 ?auto_117324 ) ( ON ?auto_117322 ?auto_117323 ) ( CLEAR ?auto_117322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117328 ?auto_117327 ?auto_117330 ?auto_117329 ?auto_117326 ?auto_117325 ?auto_117324 ?auto_117323 )
      ( MAKE-5PILE ?auto_117322 ?auto_117323 ?auto_117324 ?auto_117325 ?auto_117326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117334 - BLOCK
      ?auto_117335 - BLOCK
      ?auto_117336 - BLOCK
    )
    :vars
    (
      ?auto_117337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117337 ?auto_117336 ) ( CLEAR ?auto_117337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117334 ) ( ON ?auto_117335 ?auto_117334 ) ( ON ?auto_117336 ?auto_117335 ) ( not ( = ?auto_117334 ?auto_117335 ) ) ( not ( = ?auto_117334 ?auto_117336 ) ) ( not ( = ?auto_117334 ?auto_117337 ) ) ( not ( = ?auto_117335 ?auto_117336 ) ) ( not ( = ?auto_117335 ?auto_117337 ) ) ( not ( = ?auto_117336 ?auto_117337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117337 ?auto_117336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117338 - BLOCK
      ?auto_117339 - BLOCK
      ?auto_117340 - BLOCK
    )
    :vars
    (
      ?auto_117341 - BLOCK
      ?auto_117342 - BLOCK
      ?auto_117343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117341 ?auto_117340 ) ( CLEAR ?auto_117341 ) ( ON-TABLE ?auto_117338 ) ( ON ?auto_117339 ?auto_117338 ) ( ON ?auto_117340 ?auto_117339 ) ( not ( = ?auto_117338 ?auto_117339 ) ) ( not ( = ?auto_117338 ?auto_117340 ) ) ( not ( = ?auto_117338 ?auto_117341 ) ) ( not ( = ?auto_117339 ?auto_117340 ) ) ( not ( = ?auto_117339 ?auto_117341 ) ) ( not ( = ?auto_117340 ?auto_117341 ) ) ( HOLDING ?auto_117342 ) ( CLEAR ?auto_117343 ) ( not ( = ?auto_117338 ?auto_117342 ) ) ( not ( = ?auto_117338 ?auto_117343 ) ) ( not ( = ?auto_117339 ?auto_117342 ) ) ( not ( = ?auto_117339 ?auto_117343 ) ) ( not ( = ?auto_117340 ?auto_117342 ) ) ( not ( = ?auto_117340 ?auto_117343 ) ) ( not ( = ?auto_117341 ?auto_117342 ) ) ( not ( = ?auto_117341 ?auto_117343 ) ) ( not ( = ?auto_117342 ?auto_117343 ) ) )
    :subtasks
    ( ( !STACK ?auto_117342 ?auto_117343 )
      ( MAKE-3PILE ?auto_117338 ?auto_117339 ?auto_117340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117344 - BLOCK
      ?auto_117345 - BLOCK
      ?auto_117346 - BLOCK
    )
    :vars
    (
      ?auto_117347 - BLOCK
      ?auto_117349 - BLOCK
      ?auto_117348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117347 ?auto_117346 ) ( ON-TABLE ?auto_117344 ) ( ON ?auto_117345 ?auto_117344 ) ( ON ?auto_117346 ?auto_117345 ) ( not ( = ?auto_117344 ?auto_117345 ) ) ( not ( = ?auto_117344 ?auto_117346 ) ) ( not ( = ?auto_117344 ?auto_117347 ) ) ( not ( = ?auto_117345 ?auto_117346 ) ) ( not ( = ?auto_117345 ?auto_117347 ) ) ( not ( = ?auto_117346 ?auto_117347 ) ) ( CLEAR ?auto_117349 ) ( not ( = ?auto_117344 ?auto_117348 ) ) ( not ( = ?auto_117344 ?auto_117349 ) ) ( not ( = ?auto_117345 ?auto_117348 ) ) ( not ( = ?auto_117345 ?auto_117349 ) ) ( not ( = ?auto_117346 ?auto_117348 ) ) ( not ( = ?auto_117346 ?auto_117349 ) ) ( not ( = ?auto_117347 ?auto_117348 ) ) ( not ( = ?auto_117347 ?auto_117349 ) ) ( not ( = ?auto_117348 ?auto_117349 ) ) ( ON ?auto_117348 ?auto_117347 ) ( CLEAR ?auto_117348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117344 ?auto_117345 ?auto_117346 ?auto_117347 )
      ( MAKE-3PILE ?auto_117344 ?auto_117345 ?auto_117346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117350 - BLOCK
      ?auto_117351 - BLOCK
      ?auto_117352 - BLOCK
    )
    :vars
    (
      ?auto_117353 - BLOCK
      ?auto_117354 - BLOCK
      ?auto_117355 - BLOCK
      ?auto_117358 - BLOCK
      ?auto_117357 - BLOCK
      ?auto_117356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117353 ?auto_117352 ) ( ON-TABLE ?auto_117350 ) ( ON ?auto_117351 ?auto_117350 ) ( ON ?auto_117352 ?auto_117351 ) ( not ( = ?auto_117350 ?auto_117351 ) ) ( not ( = ?auto_117350 ?auto_117352 ) ) ( not ( = ?auto_117350 ?auto_117353 ) ) ( not ( = ?auto_117351 ?auto_117352 ) ) ( not ( = ?auto_117351 ?auto_117353 ) ) ( not ( = ?auto_117352 ?auto_117353 ) ) ( not ( = ?auto_117350 ?auto_117354 ) ) ( not ( = ?auto_117350 ?auto_117355 ) ) ( not ( = ?auto_117351 ?auto_117354 ) ) ( not ( = ?auto_117351 ?auto_117355 ) ) ( not ( = ?auto_117352 ?auto_117354 ) ) ( not ( = ?auto_117352 ?auto_117355 ) ) ( not ( = ?auto_117353 ?auto_117354 ) ) ( not ( = ?auto_117353 ?auto_117355 ) ) ( not ( = ?auto_117354 ?auto_117355 ) ) ( ON ?auto_117354 ?auto_117353 ) ( CLEAR ?auto_117354 ) ( HOLDING ?auto_117355 ) ( CLEAR ?auto_117358 ) ( ON-TABLE ?auto_117357 ) ( ON ?auto_117356 ?auto_117357 ) ( ON ?auto_117358 ?auto_117356 ) ( not ( = ?auto_117357 ?auto_117356 ) ) ( not ( = ?auto_117357 ?auto_117358 ) ) ( not ( = ?auto_117357 ?auto_117355 ) ) ( not ( = ?auto_117356 ?auto_117358 ) ) ( not ( = ?auto_117356 ?auto_117355 ) ) ( not ( = ?auto_117358 ?auto_117355 ) ) ( not ( = ?auto_117350 ?auto_117358 ) ) ( not ( = ?auto_117350 ?auto_117357 ) ) ( not ( = ?auto_117350 ?auto_117356 ) ) ( not ( = ?auto_117351 ?auto_117358 ) ) ( not ( = ?auto_117351 ?auto_117357 ) ) ( not ( = ?auto_117351 ?auto_117356 ) ) ( not ( = ?auto_117352 ?auto_117358 ) ) ( not ( = ?auto_117352 ?auto_117357 ) ) ( not ( = ?auto_117352 ?auto_117356 ) ) ( not ( = ?auto_117353 ?auto_117358 ) ) ( not ( = ?auto_117353 ?auto_117357 ) ) ( not ( = ?auto_117353 ?auto_117356 ) ) ( not ( = ?auto_117354 ?auto_117358 ) ) ( not ( = ?auto_117354 ?auto_117357 ) ) ( not ( = ?auto_117354 ?auto_117356 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117357 ?auto_117356 ?auto_117358 ?auto_117355 )
      ( MAKE-3PILE ?auto_117350 ?auto_117351 ?auto_117352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117359 - BLOCK
      ?auto_117360 - BLOCK
      ?auto_117361 - BLOCK
    )
    :vars
    (
      ?auto_117366 - BLOCK
      ?auto_117367 - BLOCK
      ?auto_117364 - BLOCK
      ?auto_117365 - BLOCK
      ?auto_117363 - BLOCK
      ?auto_117362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117366 ?auto_117361 ) ( ON-TABLE ?auto_117359 ) ( ON ?auto_117360 ?auto_117359 ) ( ON ?auto_117361 ?auto_117360 ) ( not ( = ?auto_117359 ?auto_117360 ) ) ( not ( = ?auto_117359 ?auto_117361 ) ) ( not ( = ?auto_117359 ?auto_117366 ) ) ( not ( = ?auto_117360 ?auto_117361 ) ) ( not ( = ?auto_117360 ?auto_117366 ) ) ( not ( = ?auto_117361 ?auto_117366 ) ) ( not ( = ?auto_117359 ?auto_117367 ) ) ( not ( = ?auto_117359 ?auto_117364 ) ) ( not ( = ?auto_117360 ?auto_117367 ) ) ( not ( = ?auto_117360 ?auto_117364 ) ) ( not ( = ?auto_117361 ?auto_117367 ) ) ( not ( = ?auto_117361 ?auto_117364 ) ) ( not ( = ?auto_117366 ?auto_117367 ) ) ( not ( = ?auto_117366 ?auto_117364 ) ) ( not ( = ?auto_117367 ?auto_117364 ) ) ( ON ?auto_117367 ?auto_117366 ) ( CLEAR ?auto_117365 ) ( ON-TABLE ?auto_117363 ) ( ON ?auto_117362 ?auto_117363 ) ( ON ?auto_117365 ?auto_117362 ) ( not ( = ?auto_117363 ?auto_117362 ) ) ( not ( = ?auto_117363 ?auto_117365 ) ) ( not ( = ?auto_117363 ?auto_117364 ) ) ( not ( = ?auto_117362 ?auto_117365 ) ) ( not ( = ?auto_117362 ?auto_117364 ) ) ( not ( = ?auto_117365 ?auto_117364 ) ) ( not ( = ?auto_117359 ?auto_117365 ) ) ( not ( = ?auto_117359 ?auto_117363 ) ) ( not ( = ?auto_117359 ?auto_117362 ) ) ( not ( = ?auto_117360 ?auto_117365 ) ) ( not ( = ?auto_117360 ?auto_117363 ) ) ( not ( = ?auto_117360 ?auto_117362 ) ) ( not ( = ?auto_117361 ?auto_117365 ) ) ( not ( = ?auto_117361 ?auto_117363 ) ) ( not ( = ?auto_117361 ?auto_117362 ) ) ( not ( = ?auto_117366 ?auto_117365 ) ) ( not ( = ?auto_117366 ?auto_117363 ) ) ( not ( = ?auto_117366 ?auto_117362 ) ) ( not ( = ?auto_117367 ?auto_117365 ) ) ( not ( = ?auto_117367 ?auto_117363 ) ) ( not ( = ?auto_117367 ?auto_117362 ) ) ( ON ?auto_117364 ?auto_117367 ) ( CLEAR ?auto_117364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117359 ?auto_117360 ?auto_117361 ?auto_117366 ?auto_117367 )
      ( MAKE-3PILE ?auto_117359 ?auto_117360 ?auto_117361 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117368 - BLOCK
      ?auto_117369 - BLOCK
      ?auto_117370 - BLOCK
    )
    :vars
    (
      ?auto_117375 - BLOCK
      ?auto_117371 - BLOCK
      ?auto_117374 - BLOCK
      ?auto_117373 - BLOCK
      ?auto_117376 - BLOCK
      ?auto_117372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117375 ?auto_117370 ) ( ON-TABLE ?auto_117368 ) ( ON ?auto_117369 ?auto_117368 ) ( ON ?auto_117370 ?auto_117369 ) ( not ( = ?auto_117368 ?auto_117369 ) ) ( not ( = ?auto_117368 ?auto_117370 ) ) ( not ( = ?auto_117368 ?auto_117375 ) ) ( not ( = ?auto_117369 ?auto_117370 ) ) ( not ( = ?auto_117369 ?auto_117375 ) ) ( not ( = ?auto_117370 ?auto_117375 ) ) ( not ( = ?auto_117368 ?auto_117371 ) ) ( not ( = ?auto_117368 ?auto_117374 ) ) ( not ( = ?auto_117369 ?auto_117371 ) ) ( not ( = ?auto_117369 ?auto_117374 ) ) ( not ( = ?auto_117370 ?auto_117371 ) ) ( not ( = ?auto_117370 ?auto_117374 ) ) ( not ( = ?auto_117375 ?auto_117371 ) ) ( not ( = ?auto_117375 ?auto_117374 ) ) ( not ( = ?auto_117371 ?auto_117374 ) ) ( ON ?auto_117371 ?auto_117375 ) ( ON-TABLE ?auto_117373 ) ( ON ?auto_117376 ?auto_117373 ) ( not ( = ?auto_117373 ?auto_117376 ) ) ( not ( = ?auto_117373 ?auto_117372 ) ) ( not ( = ?auto_117373 ?auto_117374 ) ) ( not ( = ?auto_117376 ?auto_117372 ) ) ( not ( = ?auto_117376 ?auto_117374 ) ) ( not ( = ?auto_117372 ?auto_117374 ) ) ( not ( = ?auto_117368 ?auto_117372 ) ) ( not ( = ?auto_117368 ?auto_117373 ) ) ( not ( = ?auto_117368 ?auto_117376 ) ) ( not ( = ?auto_117369 ?auto_117372 ) ) ( not ( = ?auto_117369 ?auto_117373 ) ) ( not ( = ?auto_117369 ?auto_117376 ) ) ( not ( = ?auto_117370 ?auto_117372 ) ) ( not ( = ?auto_117370 ?auto_117373 ) ) ( not ( = ?auto_117370 ?auto_117376 ) ) ( not ( = ?auto_117375 ?auto_117372 ) ) ( not ( = ?auto_117375 ?auto_117373 ) ) ( not ( = ?auto_117375 ?auto_117376 ) ) ( not ( = ?auto_117371 ?auto_117372 ) ) ( not ( = ?auto_117371 ?auto_117373 ) ) ( not ( = ?auto_117371 ?auto_117376 ) ) ( ON ?auto_117374 ?auto_117371 ) ( CLEAR ?auto_117374 ) ( HOLDING ?auto_117372 ) ( CLEAR ?auto_117376 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117373 ?auto_117376 ?auto_117372 )
      ( MAKE-3PILE ?auto_117368 ?auto_117369 ?auto_117370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117377 - BLOCK
      ?auto_117378 - BLOCK
      ?auto_117379 - BLOCK
    )
    :vars
    (
      ?auto_117384 - BLOCK
      ?auto_117385 - BLOCK
      ?auto_117381 - BLOCK
      ?auto_117383 - BLOCK
      ?auto_117382 - BLOCK
      ?auto_117380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117384 ?auto_117379 ) ( ON-TABLE ?auto_117377 ) ( ON ?auto_117378 ?auto_117377 ) ( ON ?auto_117379 ?auto_117378 ) ( not ( = ?auto_117377 ?auto_117378 ) ) ( not ( = ?auto_117377 ?auto_117379 ) ) ( not ( = ?auto_117377 ?auto_117384 ) ) ( not ( = ?auto_117378 ?auto_117379 ) ) ( not ( = ?auto_117378 ?auto_117384 ) ) ( not ( = ?auto_117379 ?auto_117384 ) ) ( not ( = ?auto_117377 ?auto_117385 ) ) ( not ( = ?auto_117377 ?auto_117381 ) ) ( not ( = ?auto_117378 ?auto_117385 ) ) ( not ( = ?auto_117378 ?auto_117381 ) ) ( not ( = ?auto_117379 ?auto_117385 ) ) ( not ( = ?auto_117379 ?auto_117381 ) ) ( not ( = ?auto_117384 ?auto_117385 ) ) ( not ( = ?auto_117384 ?auto_117381 ) ) ( not ( = ?auto_117385 ?auto_117381 ) ) ( ON ?auto_117385 ?auto_117384 ) ( ON-TABLE ?auto_117383 ) ( ON ?auto_117382 ?auto_117383 ) ( not ( = ?auto_117383 ?auto_117382 ) ) ( not ( = ?auto_117383 ?auto_117380 ) ) ( not ( = ?auto_117383 ?auto_117381 ) ) ( not ( = ?auto_117382 ?auto_117380 ) ) ( not ( = ?auto_117382 ?auto_117381 ) ) ( not ( = ?auto_117380 ?auto_117381 ) ) ( not ( = ?auto_117377 ?auto_117380 ) ) ( not ( = ?auto_117377 ?auto_117383 ) ) ( not ( = ?auto_117377 ?auto_117382 ) ) ( not ( = ?auto_117378 ?auto_117380 ) ) ( not ( = ?auto_117378 ?auto_117383 ) ) ( not ( = ?auto_117378 ?auto_117382 ) ) ( not ( = ?auto_117379 ?auto_117380 ) ) ( not ( = ?auto_117379 ?auto_117383 ) ) ( not ( = ?auto_117379 ?auto_117382 ) ) ( not ( = ?auto_117384 ?auto_117380 ) ) ( not ( = ?auto_117384 ?auto_117383 ) ) ( not ( = ?auto_117384 ?auto_117382 ) ) ( not ( = ?auto_117385 ?auto_117380 ) ) ( not ( = ?auto_117385 ?auto_117383 ) ) ( not ( = ?auto_117385 ?auto_117382 ) ) ( ON ?auto_117381 ?auto_117385 ) ( CLEAR ?auto_117382 ) ( ON ?auto_117380 ?auto_117381 ) ( CLEAR ?auto_117380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117377 ?auto_117378 ?auto_117379 ?auto_117384 ?auto_117385 ?auto_117381 )
      ( MAKE-3PILE ?auto_117377 ?auto_117378 ?auto_117379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117386 - BLOCK
      ?auto_117387 - BLOCK
      ?auto_117388 - BLOCK
    )
    :vars
    (
      ?auto_117390 - BLOCK
      ?auto_117392 - BLOCK
      ?auto_117393 - BLOCK
      ?auto_117389 - BLOCK
      ?auto_117394 - BLOCK
      ?auto_117391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117390 ?auto_117388 ) ( ON-TABLE ?auto_117386 ) ( ON ?auto_117387 ?auto_117386 ) ( ON ?auto_117388 ?auto_117387 ) ( not ( = ?auto_117386 ?auto_117387 ) ) ( not ( = ?auto_117386 ?auto_117388 ) ) ( not ( = ?auto_117386 ?auto_117390 ) ) ( not ( = ?auto_117387 ?auto_117388 ) ) ( not ( = ?auto_117387 ?auto_117390 ) ) ( not ( = ?auto_117388 ?auto_117390 ) ) ( not ( = ?auto_117386 ?auto_117392 ) ) ( not ( = ?auto_117386 ?auto_117393 ) ) ( not ( = ?auto_117387 ?auto_117392 ) ) ( not ( = ?auto_117387 ?auto_117393 ) ) ( not ( = ?auto_117388 ?auto_117392 ) ) ( not ( = ?auto_117388 ?auto_117393 ) ) ( not ( = ?auto_117390 ?auto_117392 ) ) ( not ( = ?auto_117390 ?auto_117393 ) ) ( not ( = ?auto_117392 ?auto_117393 ) ) ( ON ?auto_117392 ?auto_117390 ) ( ON-TABLE ?auto_117389 ) ( not ( = ?auto_117389 ?auto_117394 ) ) ( not ( = ?auto_117389 ?auto_117391 ) ) ( not ( = ?auto_117389 ?auto_117393 ) ) ( not ( = ?auto_117394 ?auto_117391 ) ) ( not ( = ?auto_117394 ?auto_117393 ) ) ( not ( = ?auto_117391 ?auto_117393 ) ) ( not ( = ?auto_117386 ?auto_117391 ) ) ( not ( = ?auto_117386 ?auto_117389 ) ) ( not ( = ?auto_117386 ?auto_117394 ) ) ( not ( = ?auto_117387 ?auto_117391 ) ) ( not ( = ?auto_117387 ?auto_117389 ) ) ( not ( = ?auto_117387 ?auto_117394 ) ) ( not ( = ?auto_117388 ?auto_117391 ) ) ( not ( = ?auto_117388 ?auto_117389 ) ) ( not ( = ?auto_117388 ?auto_117394 ) ) ( not ( = ?auto_117390 ?auto_117391 ) ) ( not ( = ?auto_117390 ?auto_117389 ) ) ( not ( = ?auto_117390 ?auto_117394 ) ) ( not ( = ?auto_117392 ?auto_117391 ) ) ( not ( = ?auto_117392 ?auto_117389 ) ) ( not ( = ?auto_117392 ?auto_117394 ) ) ( ON ?auto_117393 ?auto_117392 ) ( ON ?auto_117391 ?auto_117393 ) ( CLEAR ?auto_117391 ) ( HOLDING ?auto_117394 ) ( CLEAR ?auto_117389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117389 ?auto_117394 )
      ( MAKE-3PILE ?auto_117386 ?auto_117387 ?auto_117388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119253 - BLOCK
      ?auto_119254 - BLOCK
      ?auto_119255 - BLOCK
    )
    :vars
    (
      ?auto_119256 - BLOCK
      ?auto_119259 - BLOCK
      ?auto_119258 - BLOCK
      ?auto_119257 - BLOCK
      ?auto_119260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119256 ?auto_119255 ) ( ON-TABLE ?auto_119253 ) ( ON ?auto_119254 ?auto_119253 ) ( ON ?auto_119255 ?auto_119254 ) ( not ( = ?auto_119253 ?auto_119254 ) ) ( not ( = ?auto_119253 ?auto_119255 ) ) ( not ( = ?auto_119253 ?auto_119256 ) ) ( not ( = ?auto_119254 ?auto_119255 ) ) ( not ( = ?auto_119254 ?auto_119256 ) ) ( not ( = ?auto_119255 ?auto_119256 ) ) ( not ( = ?auto_119253 ?auto_119259 ) ) ( not ( = ?auto_119253 ?auto_119258 ) ) ( not ( = ?auto_119254 ?auto_119259 ) ) ( not ( = ?auto_119254 ?auto_119258 ) ) ( not ( = ?auto_119255 ?auto_119259 ) ) ( not ( = ?auto_119255 ?auto_119258 ) ) ( not ( = ?auto_119256 ?auto_119259 ) ) ( not ( = ?auto_119256 ?auto_119258 ) ) ( not ( = ?auto_119259 ?auto_119258 ) ) ( ON ?auto_119259 ?auto_119256 ) ( not ( = ?auto_119257 ?auto_119260 ) ) ( not ( = ?auto_119257 ?auto_119258 ) ) ( not ( = ?auto_119260 ?auto_119258 ) ) ( not ( = ?auto_119253 ?auto_119260 ) ) ( not ( = ?auto_119253 ?auto_119257 ) ) ( not ( = ?auto_119254 ?auto_119260 ) ) ( not ( = ?auto_119254 ?auto_119257 ) ) ( not ( = ?auto_119255 ?auto_119260 ) ) ( not ( = ?auto_119255 ?auto_119257 ) ) ( not ( = ?auto_119256 ?auto_119260 ) ) ( not ( = ?auto_119256 ?auto_119257 ) ) ( not ( = ?auto_119259 ?auto_119260 ) ) ( not ( = ?auto_119259 ?auto_119257 ) ) ( ON ?auto_119258 ?auto_119259 ) ( ON ?auto_119260 ?auto_119258 ) ( ON ?auto_119257 ?auto_119260 ) ( CLEAR ?auto_119257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119253 ?auto_119254 ?auto_119255 ?auto_119256 ?auto_119259 ?auto_119258 ?auto_119260 )
      ( MAKE-3PILE ?auto_119253 ?auto_119254 ?auto_119255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117404 - BLOCK
      ?auto_117405 - BLOCK
      ?auto_117406 - BLOCK
    )
    :vars
    (
      ?auto_117411 - BLOCK
      ?auto_117410 - BLOCK
      ?auto_117408 - BLOCK
      ?auto_117407 - BLOCK
      ?auto_117409 - BLOCK
      ?auto_117412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117411 ?auto_117406 ) ( ON-TABLE ?auto_117404 ) ( ON ?auto_117405 ?auto_117404 ) ( ON ?auto_117406 ?auto_117405 ) ( not ( = ?auto_117404 ?auto_117405 ) ) ( not ( = ?auto_117404 ?auto_117406 ) ) ( not ( = ?auto_117404 ?auto_117411 ) ) ( not ( = ?auto_117405 ?auto_117406 ) ) ( not ( = ?auto_117405 ?auto_117411 ) ) ( not ( = ?auto_117406 ?auto_117411 ) ) ( not ( = ?auto_117404 ?auto_117410 ) ) ( not ( = ?auto_117404 ?auto_117408 ) ) ( not ( = ?auto_117405 ?auto_117410 ) ) ( not ( = ?auto_117405 ?auto_117408 ) ) ( not ( = ?auto_117406 ?auto_117410 ) ) ( not ( = ?auto_117406 ?auto_117408 ) ) ( not ( = ?auto_117411 ?auto_117410 ) ) ( not ( = ?auto_117411 ?auto_117408 ) ) ( not ( = ?auto_117410 ?auto_117408 ) ) ( ON ?auto_117410 ?auto_117411 ) ( not ( = ?auto_117407 ?auto_117409 ) ) ( not ( = ?auto_117407 ?auto_117412 ) ) ( not ( = ?auto_117407 ?auto_117408 ) ) ( not ( = ?auto_117409 ?auto_117412 ) ) ( not ( = ?auto_117409 ?auto_117408 ) ) ( not ( = ?auto_117412 ?auto_117408 ) ) ( not ( = ?auto_117404 ?auto_117412 ) ) ( not ( = ?auto_117404 ?auto_117407 ) ) ( not ( = ?auto_117404 ?auto_117409 ) ) ( not ( = ?auto_117405 ?auto_117412 ) ) ( not ( = ?auto_117405 ?auto_117407 ) ) ( not ( = ?auto_117405 ?auto_117409 ) ) ( not ( = ?auto_117406 ?auto_117412 ) ) ( not ( = ?auto_117406 ?auto_117407 ) ) ( not ( = ?auto_117406 ?auto_117409 ) ) ( not ( = ?auto_117411 ?auto_117412 ) ) ( not ( = ?auto_117411 ?auto_117407 ) ) ( not ( = ?auto_117411 ?auto_117409 ) ) ( not ( = ?auto_117410 ?auto_117412 ) ) ( not ( = ?auto_117410 ?auto_117407 ) ) ( not ( = ?auto_117410 ?auto_117409 ) ) ( ON ?auto_117408 ?auto_117410 ) ( ON ?auto_117412 ?auto_117408 ) ( ON ?auto_117409 ?auto_117412 ) ( CLEAR ?auto_117409 ) ( HOLDING ?auto_117407 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117407 )
      ( MAKE-3PILE ?auto_117404 ?auto_117405 ?auto_117406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117413 - BLOCK
      ?auto_117414 - BLOCK
      ?auto_117415 - BLOCK
    )
    :vars
    (
      ?auto_117420 - BLOCK
      ?auto_117419 - BLOCK
      ?auto_117416 - BLOCK
      ?auto_117421 - BLOCK
      ?auto_117418 - BLOCK
      ?auto_117417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117420 ?auto_117415 ) ( ON-TABLE ?auto_117413 ) ( ON ?auto_117414 ?auto_117413 ) ( ON ?auto_117415 ?auto_117414 ) ( not ( = ?auto_117413 ?auto_117414 ) ) ( not ( = ?auto_117413 ?auto_117415 ) ) ( not ( = ?auto_117413 ?auto_117420 ) ) ( not ( = ?auto_117414 ?auto_117415 ) ) ( not ( = ?auto_117414 ?auto_117420 ) ) ( not ( = ?auto_117415 ?auto_117420 ) ) ( not ( = ?auto_117413 ?auto_117419 ) ) ( not ( = ?auto_117413 ?auto_117416 ) ) ( not ( = ?auto_117414 ?auto_117419 ) ) ( not ( = ?auto_117414 ?auto_117416 ) ) ( not ( = ?auto_117415 ?auto_117419 ) ) ( not ( = ?auto_117415 ?auto_117416 ) ) ( not ( = ?auto_117420 ?auto_117419 ) ) ( not ( = ?auto_117420 ?auto_117416 ) ) ( not ( = ?auto_117419 ?auto_117416 ) ) ( ON ?auto_117419 ?auto_117420 ) ( not ( = ?auto_117421 ?auto_117418 ) ) ( not ( = ?auto_117421 ?auto_117417 ) ) ( not ( = ?auto_117421 ?auto_117416 ) ) ( not ( = ?auto_117418 ?auto_117417 ) ) ( not ( = ?auto_117418 ?auto_117416 ) ) ( not ( = ?auto_117417 ?auto_117416 ) ) ( not ( = ?auto_117413 ?auto_117417 ) ) ( not ( = ?auto_117413 ?auto_117421 ) ) ( not ( = ?auto_117413 ?auto_117418 ) ) ( not ( = ?auto_117414 ?auto_117417 ) ) ( not ( = ?auto_117414 ?auto_117421 ) ) ( not ( = ?auto_117414 ?auto_117418 ) ) ( not ( = ?auto_117415 ?auto_117417 ) ) ( not ( = ?auto_117415 ?auto_117421 ) ) ( not ( = ?auto_117415 ?auto_117418 ) ) ( not ( = ?auto_117420 ?auto_117417 ) ) ( not ( = ?auto_117420 ?auto_117421 ) ) ( not ( = ?auto_117420 ?auto_117418 ) ) ( not ( = ?auto_117419 ?auto_117417 ) ) ( not ( = ?auto_117419 ?auto_117421 ) ) ( not ( = ?auto_117419 ?auto_117418 ) ) ( ON ?auto_117416 ?auto_117419 ) ( ON ?auto_117417 ?auto_117416 ) ( ON ?auto_117418 ?auto_117417 ) ( ON ?auto_117421 ?auto_117418 ) ( CLEAR ?auto_117421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117413 ?auto_117414 ?auto_117415 ?auto_117420 ?auto_117419 ?auto_117416 ?auto_117417 ?auto_117418 )
      ( MAKE-3PILE ?auto_117413 ?auto_117414 ?auto_117415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117428 - BLOCK
      ?auto_117429 - BLOCK
      ?auto_117430 - BLOCK
      ?auto_117431 - BLOCK
      ?auto_117432 - BLOCK
      ?auto_117433 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117433 ) ( CLEAR ?auto_117432 ) ( ON-TABLE ?auto_117428 ) ( ON ?auto_117429 ?auto_117428 ) ( ON ?auto_117430 ?auto_117429 ) ( ON ?auto_117431 ?auto_117430 ) ( ON ?auto_117432 ?auto_117431 ) ( not ( = ?auto_117428 ?auto_117429 ) ) ( not ( = ?auto_117428 ?auto_117430 ) ) ( not ( = ?auto_117428 ?auto_117431 ) ) ( not ( = ?auto_117428 ?auto_117432 ) ) ( not ( = ?auto_117428 ?auto_117433 ) ) ( not ( = ?auto_117429 ?auto_117430 ) ) ( not ( = ?auto_117429 ?auto_117431 ) ) ( not ( = ?auto_117429 ?auto_117432 ) ) ( not ( = ?auto_117429 ?auto_117433 ) ) ( not ( = ?auto_117430 ?auto_117431 ) ) ( not ( = ?auto_117430 ?auto_117432 ) ) ( not ( = ?auto_117430 ?auto_117433 ) ) ( not ( = ?auto_117431 ?auto_117432 ) ) ( not ( = ?auto_117431 ?auto_117433 ) ) ( not ( = ?auto_117432 ?auto_117433 ) ) )
    :subtasks
    ( ( !STACK ?auto_117433 ?auto_117432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117434 - BLOCK
      ?auto_117435 - BLOCK
      ?auto_117436 - BLOCK
      ?auto_117437 - BLOCK
      ?auto_117438 - BLOCK
      ?auto_117439 - BLOCK
    )
    :vars
    (
      ?auto_117440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117438 ) ( ON-TABLE ?auto_117434 ) ( ON ?auto_117435 ?auto_117434 ) ( ON ?auto_117436 ?auto_117435 ) ( ON ?auto_117437 ?auto_117436 ) ( ON ?auto_117438 ?auto_117437 ) ( not ( = ?auto_117434 ?auto_117435 ) ) ( not ( = ?auto_117434 ?auto_117436 ) ) ( not ( = ?auto_117434 ?auto_117437 ) ) ( not ( = ?auto_117434 ?auto_117438 ) ) ( not ( = ?auto_117434 ?auto_117439 ) ) ( not ( = ?auto_117435 ?auto_117436 ) ) ( not ( = ?auto_117435 ?auto_117437 ) ) ( not ( = ?auto_117435 ?auto_117438 ) ) ( not ( = ?auto_117435 ?auto_117439 ) ) ( not ( = ?auto_117436 ?auto_117437 ) ) ( not ( = ?auto_117436 ?auto_117438 ) ) ( not ( = ?auto_117436 ?auto_117439 ) ) ( not ( = ?auto_117437 ?auto_117438 ) ) ( not ( = ?auto_117437 ?auto_117439 ) ) ( not ( = ?auto_117438 ?auto_117439 ) ) ( ON ?auto_117439 ?auto_117440 ) ( CLEAR ?auto_117439 ) ( HAND-EMPTY ) ( not ( = ?auto_117434 ?auto_117440 ) ) ( not ( = ?auto_117435 ?auto_117440 ) ) ( not ( = ?auto_117436 ?auto_117440 ) ) ( not ( = ?auto_117437 ?auto_117440 ) ) ( not ( = ?auto_117438 ?auto_117440 ) ) ( not ( = ?auto_117439 ?auto_117440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117439 ?auto_117440 )
      ( MAKE-6PILE ?auto_117434 ?auto_117435 ?auto_117436 ?auto_117437 ?auto_117438 ?auto_117439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117441 - BLOCK
      ?auto_117442 - BLOCK
      ?auto_117443 - BLOCK
      ?auto_117444 - BLOCK
      ?auto_117445 - BLOCK
      ?auto_117446 - BLOCK
    )
    :vars
    (
      ?auto_117447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117441 ) ( ON ?auto_117442 ?auto_117441 ) ( ON ?auto_117443 ?auto_117442 ) ( ON ?auto_117444 ?auto_117443 ) ( not ( = ?auto_117441 ?auto_117442 ) ) ( not ( = ?auto_117441 ?auto_117443 ) ) ( not ( = ?auto_117441 ?auto_117444 ) ) ( not ( = ?auto_117441 ?auto_117445 ) ) ( not ( = ?auto_117441 ?auto_117446 ) ) ( not ( = ?auto_117442 ?auto_117443 ) ) ( not ( = ?auto_117442 ?auto_117444 ) ) ( not ( = ?auto_117442 ?auto_117445 ) ) ( not ( = ?auto_117442 ?auto_117446 ) ) ( not ( = ?auto_117443 ?auto_117444 ) ) ( not ( = ?auto_117443 ?auto_117445 ) ) ( not ( = ?auto_117443 ?auto_117446 ) ) ( not ( = ?auto_117444 ?auto_117445 ) ) ( not ( = ?auto_117444 ?auto_117446 ) ) ( not ( = ?auto_117445 ?auto_117446 ) ) ( ON ?auto_117446 ?auto_117447 ) ( CLEAR ?auto_117446 ) ( not ( = ?auto_117441 ?auto_117447 ) ) ( not ( = ?auto_117442 ?auto_117447 ) ) ( not ( = ?auto_117443 ?auto_117447 ) ) ( not ( = ?auto_117444 ?auto_117447 ) ) ( not ( = ?auto_117445 ?auto_117447 ) ) ( not ( = ?auto_117446 ?auto_117447 ) ) ( HOLDING ?auto_117445 ) ( CLEAR ?auto_117444 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117441 ?auto_117442 ?auto_117443 ?auto_117444 ?auto_117445 )
      ( MAKE-6PILE ?auto_117441 ?auto_117442 ?auto_117443 ?auto_117444 ?auto_117445 ?auto_117446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117448 - BLOCK
      ?auto_117449 - BLOCK
      ?auto_117450 - BLOCK
      ?auto_117451 - BLOCK
      ?auto_117452 - BLOCK
      ?auto_117453 - BLOCK
    )
    :vars
    (
      ?auto_117454 - BLOCK
      ?auto_117455 - BLOCK
      ?auto_117456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117448 ) ( ON ?auto_117449 ?auto_117448 ) ( ON ?auto_117450 ?auto_117449 ) ( ON ?auto_117451 ?auto_117450 ) ( not ( = ?auto_117448 ?auto_117449 ) ) ( not ( = ?auto_117448 ?auto_117450 ) ) ( not ( = ?auto_117448 ?auto_117451 ) ) ( not ( = ?auto_117448 ?auto_117452 ) ) ( not ( = ?auto_117448 ?auto_117453 ) ) ( not ( = ?auto_117449 ?auto_117450 ) ) ( not ( = ?auto_117449 ?auto_117451 ) ) ( not ( = ?auto_117449 ?auto_117452 ) ) ( not ( = ?auto_117449 ?auto_117453 ) ) ( not ( = ?auto_117450 ?auto_117451 ) ) ( not ( = ?auto_117450 ?auto_117452 ) ) ( not ( = ?auto_117450 ?auto_117453 ) ) ( not ( = ?auto_117451 ?auto_117452 ) ) ( not ( = ?auto_117451 ?auto_117453 ) ) ( not ( = ?auto_117452 ?auto_117453 ) ) ( ON ?auto_117453 ?auto_117454 ) ( not ( = ?auto_117448 ?auto_117454 ) ) ( not ( = ?auto_117449 ?auto_117454 ) ) ( not ( = ?auto_117450 ?auto_117454 ) ) ( not ( = ?auto_117451 ?auto_117454 ) ) ( not ( = ?auto_117452 ?auto_117454 ) ) ( not ( = ?auto_117453 ?auto_117454 ) ) ( CLEAR ?auto_117451 ) ( ON ?auto_117452 ?auto_117453 ) ( CLEAR ?auto_117452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117455 ) ( ON ?auto_117456 ?auto_117455 ) ( ON ?auto_117454 ?auto_117456 ) ( not ( = ?auto_117455 ?auto_117456 ) ) ( not ( = ?auto_117455 ?auto_117454 ) ) ( not ( = ?auto_117455 ?auto_117453 ) ) ( not ( = ?auto_117455 ?auto_117452 ) ) ( not ( = ?auto_117456 ?auto_117454 ) ) ( not ( = ?auto_117456 ?auto_117453 ) ) ( not ( = ?auto_117456 ?auto_117452 ) ) ( not ( = ?auto_117448 ?auto_117455 ) ) ( not ( = ?auto_117448 ?auto_117456 ) ) ( not ( = ?auto_117449 ?auto_117455 ) ) ( not ( = ?auto_117449 ?auto_117456 ) ) ( not ( = ?auto_117450 ?auto_117455 ) ) ( not ( = ?auto_117450 ?auto_117456 ) ) ( not ( = ?auto_117451 ?auto_117455 ) ) ( not ( = ?auto_117451 ?auto_117456 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117455 ?auto_117456 ?auto_117454 ?auto_117453 )
      ( MAKE-6PILE ?auto_117448 ?auto_117449 ?auto_117450 ?auto_117451 ?auto_117452 ?auto_117453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117457 - BLOCK
      ?auto_117458 - BLOCK
      ?auto_117459 - BLOCK
      ?auto_117460 - BLOCK
      ?auto_117461 - BLOCK
      ?auto_117462 - BLOCK
    )
    :vars
    (
      ?auto_117463 - BLOCK
      ?auto_117464 - BLOCK
      ?auto_117465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117457 ) ( ON ?auto_117458 ?auto_117457 ) ( ON ?auto_117459 ?auto_117458 ) ( not ( = ?auto_117457 ?auto_117458 ) ) ( not ( = ?auto_117457 ?auto_117459 ) ) ( not ( = ?auto_117457 ?auto_117460 ) ) ( not ( = ?auto_117457 ?auto_117461 ) ) ( not ( = ?auto_117457 ?auto_117462 ) ) ( not ( = ?auto_117458 ?auto_117459 ) ) ( not ( = ?auto_117458 ?auto_117460 ) ) ( not ( = ?auto_117458 ?auto_117461 ) ) ( not ( = ?auto_117458 ?auto_117462 ) ) ( not ( = ?auto_117459 ?auto_117460 ) ) ( not ( = ?auto_117459 ?auto_117461 ) ) ( not ( = ?auto_117459 ?auto_117462 ) ) ( not ( = ?auto_117460 ?auto_117461 ) ) ( not ( = ?auto_117460 ?auto_117462 ) ) ( not ( = ?auto_117461 ?auto_117462 ) ) ( ON ?auto_117462 ?auto_117463 ) ( not ( = ?auto_117457 ?auto_117463 ) ) ( not ( = ?auto_117458 ?auto_117463 ) ) ( not ( = ?auto_117459 ?auto_117463 ) ) ( not ( = ?auto_117460 ?auto_117463 ) ) ( not ( = ?auto_117461 ?auto_117463 ) ) ( not ( = ?auto_117462 ?auto_117463 ) ) ( ON ?auto_117461 ?auto_117462 ) ( CLEAR ?auto_117461 ) ( ON-TABLE ?auto_117464 ) ( ON ?auto_117465 ?auto_117464 ) ( ON ?auto_117463 ?auto_117465 ) ( not ( = ?auto_117464 ?auto_117465 ) ) ( not ( = ?auto_117464 ?auto_117463 ) ) ( not ( = ?auto_117464 ?auto_117462 ) ) ( not ( = ?auto_117464 ?auto_117461 ) ) ( not ( = ?auto_117465 ?auto_117463 ) ) ( not ( = ?auto_117465 ?auto_117462 ) ) ( not ( = ?auto_117465 ?auto_117461 ) ) ( not ( = ?auto_117457 ?auto_117464 ) ) ( not ( = ?auto_117457 ?auto_117465 ) ) ( not ( = ?auto_117458 ?auto_117464 ) ) ( not ( = ?auto_117458 ?auto_117465 ) ) ( not ( = ?auto_117459 ?auto_117464 ) ) ( not ( = ?auto_117459 ?auto_117465 ) ) ( not ( = ?auto_117460 ?auto_117464 ) ) ( not ( = ?auto_117460 ?auto_117465 ) ) ( HOLDING ?auto_117460 ) ( CLEAR ?auto_117459 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117457 ?auto_117458 ?auto_117459 ?auto_117460 )
      ( MAKE-6PILE ?auto_117457 ?auto_117458 ?auto_117459 ?auto_117460 ?auto_117461 ?auto_117462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117466 - BLOCK
      ?auto_117467 - BLOCK
      ?auto_117468 - BLOCK
      ?auto_117469 - BLOCK
      ?auto_117470 - BLOCK
      ?auto_117471 - BLOCK
    )
    :vars
    (
      ?auto_117473 - BLOCK
      ?auto_117472 - BLOCK
      ?auto_117474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117466 ) ( ON ?auto_117467 ?auto_117466 ) ( ON ?auto_117468 ?auto_117467 ) ( not ( = ?auto_117466 ?auto_117467 ) ) ( not ( = ?auto_117466 ?auto_117468 ) ) ( not ( = ?auto_117466 ?auto_117469 ) ) ( not ( = ?auto_117466 ?auto_117470 ) ) ( not ( = ?auto_117466 ?auto_117471 ) ) ( not ( = ?auto_117467 ?auto_117468 ) ) ( not ( = ?auto_117467 ?auto_117469 ) ) ( not ( = ?auto_117467 ?auto_117470 ) ) ( not ( = ?auto_117467 ?auto_117471 ) ) ( not ( = ?auto_117468 ?auto_117469 ) ) ( not ( = ?auto_117468 ?auto_117470 ) ) ( not ( = ?auto_117468 ?auto_117471 ) ) ( not ( = ?auto_117469 ?auto_117470 ) ) ( not ( = ?auto_117469 ?auto_117471 ) ) ( not ( = ?auto_117470 ?auto_117471 ) ) ( ON ?auto_117471 ?auto_117473 ) ( not ( = ?auto_117466 ?auto_117473 ) ) ( not ( = ?auto_117467 ?auto_117473 ) ) ( not ( = ?auto_117468 ?auto_117473 ) ) ( not ( = ?auto_117469 ?auto_117473 ) ) ( not ( = ?auto_117470 ?auto_117473 ) ) ( not ( = ?auto_117471 ?auto_117473 ) ) ( ON ?auto_117470 ?auto_117471 ) ( ON-TABLE ?auto_117472 ) ( ON ?auto_117474 ?auto_117472 ) ( ON ?auto_117473 ?auto_117474 ) ( not ( = ?auto_117472 ?auto_117474 ) ) ( not ( = ?auto_117472 ?auto_117473 ) ) ( not ( = ?auto_117472 ?auto_117471 ) ) ( not ( = ?auto_117472 ?auto_117470 ) ) ( not ( = ?auto_117474 ?auto_117473 ) ) ( not ( = ?auto_117474 ?auto_117471 ) ) ( not ( = ?auto_117474 ?auto_117470 ) ) ( not ( = ?auto_117466 ?auto_117472 ) ) ( not ( = ?auto_117466 ?auto_117474 ) ) ( not ( = ?auto_117467 ?auto_117472 ) ) ( not ( = ?auto_117467 ?auto_117474 ) ) ( not ( = ?auto_117468 ?auto_117472 ) ) ( not ( = ?auto_117468 ?auto_117474 ) ) ( not ( = ?auto_117469 ?auto_117472 ) ) ( not ( = ?auto_117469 ?auto_117474 ) ) ( CLEAR ?auto_117468 ) ( ON ?auto_117469 ?auto_117470 ) ( CLEAR ?auto_117469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117472 ?auto_117474 ?auto_117473 ?auto_117471 ?auto_117470 )
      ( MAKE-6PILE ?auto_117466 ?auto_117467 ?auto_117468 ?auto_117469 ?auto_117470 ?auto_117471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117475 - BLOCK
      ?auto_117476 - BLOCK
      ?auto_117477 - BLOCK
      ?auto_117478 - BLOCK
      ?auto_117479 - BLOCK
      ?auto_117480 - BLOCK
    )
    :vars
    (
      ?auto_117482 - BLOCK
      ?auto_117481 - BLOCK
      ?auto_117483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117475 ) ( ON ?auto_117476 ?auto_117475 ) ( not ( = ?auto_117475 ?auto_117476 ) ) ( not ( = ?auto_117475 ?auto_117477 ) ) ( not ( = ?auto_117475 ?auto_117478 ) ) ( not ( = ?auto_117475 ?auto_117479 ) ) ( not ( = ?auto_117475 ?auto_117480 ) ) ( not ( = ?auto_117476 ?auto_117477 ) ) ( not ( = ?auto_117476 ?auto_117478 ) ) ( not ( = ?auto_117476 ?auto_117479 ) ) ( not ( = ?auto_117476 ?auto_117480 ) ) ( not ( = ?auto_117477 ?auto_117478 ) ) ( not ( = ?auto_117477 ?auto_117479 ) ) ( not ( = ?auto_117477 ?auto_117480 ) ) ( not ( = ?auto_117478 ?auto_117479 ) ) ( not ( = ?auto_117478 ?auto_117480 ) ) ( not ( = ?auto_117479 ?auto_117480 ) ) ( ON ?auto_117480 ?auto_117482 ) ( not ( = ?auto_117475 ?auto_117482 ) ) ( not ( = ?auto_117476 ?auto_117482 ) ) ( not ( = ?auto_117477 ?auto_117482 ) ) ( not ( = ?auto_117478 ?auto_117482 ) ) ( not ( = ?auto_117479 ?auto_117482 ) ) ( not ( = ?auto_117480 ?auto_117482 ) ) ( ON ?auto_117479 ?auto_117480 ) ( ON-TABLE ?auto_117481 ) ( ON ?auto_117483 ?auto_117481 ) ( ON ?auto_117482 ?auto_117483 ) ( not ( = ?auto_117481 ?auto_117483 ) ) ( not ( = ?auto_117481 ?auto_117482 ) ) ( not ( = ?auto_117481 ?auto_117480 ) ) ( not ( = ?auto_117481 ?auto_117479 ) ) ( not ( = ?auto_117483 ?auto_117482 ) ) ( not ( = ?auto_117483 ?auto_117480 ) ) ( not ( = ?auto_117483 ?auto_117479 ) ) ( not ( = ?auto_117475 ?auto_117481 ) ) ( not ( = ?auto_117475 ?auto_117483 ) ) ( not ( = ?auto_117476 ?auto_117481 ) ) ( not ( = ?auto_117476 ?auto_117483 ) ) ( not ( = ?auto_117477 ?auto_117481 ) ) ( not ( = ?auto_117477 ?auto_117483 ) ) ( not ( = ?auto_117478 ?auto_117481 ) ) ( not ( = ?auto_117478 ?auto_117483 ) ) ( ON ?auto_117478 ?auto_117479 ) ( CLEAR ?auto_117478 ) ( HOLDING ?auto_117477 ) ( CLEAR ?auto_117476 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117475 ?auto_117476 ?auto_117477 )
      ( MAKE-6PILE ?auto_117475 ?auto_117476 ?auto_117477 ?auto_117478 ?auto_117479 ?auto_117480 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117484 - BLOCK
      ?auto_117485 - BLOCK
      ?auto_117486 - BLOCK
      ?auto_117487 - BLOCK
      ?auto_117488 - BLOCK
      ?auto_117489 - BLOCK
    )
    :vars
    (
      ?auto_117492 - BLOCK
      ?auto_117491 - BLOCK
      ?auto_117490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117484 ) ( ON ?auto_117485 ?auto_117484 ) ( not ( = ?auto_117484 ?auto_117485 ) ) ( not ( = ?auto_117484 ?auto_117486 ) ) ( not ( = ?auto_117484 ?auto_117487 ) ) ( not ( = ?auto_117484 ?auto_117488 ) ) ( not ( = ?auto_117484 ?auto_117489 ) ) ( not ( = ?auto_117485 ?auto_117486 ) ) ( not ( = ?auto_117485 ?auto_117487 ) ) ( not ( = ?auto_117485 ?auto_117488 ) ) ( not ( = ?auto_117485 ?auto_117489 ) ) ( not ( = ?auto_117486 ?auto_117487 ) ) ( not ( = ?auto_117486 ?auto_117488 ) ) ( not ( = ?auto_117486 ?auto_117489 ) ) ( not ( = ?auto_117487 ?auto_117488 ) ) ( not ( = ?auto_117487 ?auto_117489 ) ) ( not ( = ?auto_117488 ?auto_117489 ) ) ( ON ?auto_117489 ?auto_117492 ) ( not ( = ?auto_117484 ?auto_117492 ) ) ( not ( = ?auto_117485 ?auto_117492 ) ) ( not ( = ?auto_117486 ?auto_117492 ) ) ( not ( = ?auto_117487 ?auto_117492 ) ) ( not ( = ?auto_117488 ?auto_117492 ) ) ( not ( = ?auto_117489 ?auto_117492 ) ) ( ON ?auto_117488 ?auto_117489 ) ( ON-TABLE ?auto_117491 ) ( ON ?auto_117490 ?auto_117491 ) ( ON ?auto_117492 ?auto_117490 ) ( not ( = ?auto_117491 ?auto_117490 ) ) ( not ( = ?auto_117491 ?auto_117492 ) ) ( not ( = ?auto_117491 ?auto_117489 ) ) ( not ( = ?auto_117491 ?auto_117488 ) ) ( not ( = ?auto_117490 ?auto_117492 ) ) ( not ( = ?auto_117490 ?auto_117489 ) ) ( not ( = ?auto_117490 ?auto_117488 ) ) ( not ( = ?auto_117484 ?auto_117491 ) ) ( not ( = ?auto_117484 ?auto_117490 ) ) ( not ( = ?auto_117485 ?auto_117491 ) ) ( not ( = ?auto_117485 ?auto_117490 ) ) ( not ( = ?auto_117486 ?auto_117491 ) ) ( not ( = ?auto_117486 ?auto_117490 ) ) ( not ( = ?auto_117487 ?auto_117491 ) ) ( not ( = ?auto_117487 ?auto_117490 ) ) ( ON ?auto_117487 ?auto_117488 ) ( CLEAR ?auto_117485 ) ( ON ?auto_117486 ?auto_117487 ) ( CLEAR ?auto_117486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117491 ?auto_117490 ?auto_117492 ?auto_117489 ?auto_117488 ?auto_117487 )
      ( MAKE-6PILE ?auto_117484 ?auto_117485 ?auto_117486 ?auto_117487 ?auto_117488 ?auto_117489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117493 - BLOCK
      ?auto_117494 - BLOCK
      ?auto_117495 - BLOCK
      ?auto_117496 - BLOCK
      ?auto_117497 - BLOCK
      ?auto_117498 - BLOCK
    )
    :vars
    (
      ?auto_117499 - BLOCK
      ?auto_117500 - BLOCK
      ?auto_117501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117493 ) ( not ( = ?auto_117493 ?auto_117494 ) ) ( not ( = ?auto_117493 ?auto_117495 ) ) ( not ( = ?auto_117493 ?auto_117496 ) ) ( not ( = ?auto_117493 ?auto_117497 ) ) ( not ( = ?auto_117493 ?auto_117498 ) ) ( not ( = ?auto_117494 ?auto_117495 ) ) ( not ( = ?auto_117494 ?auto_117496 ) ) ( not ( = ?auto_117494 ?auto_117497 ) ) ( not ( = ?auto_117494 ?auto_117498 ) ) ( not ( = ?auto_117495 ?auto_117496 ) ) ( not ( = ?auto_117495 ?auto_117497 ) ) ( not ( = ?auto_117495 ?auto_117498 ) ) ( not ( = ?auto_117496 ?auto_117497 ) ) ( not ( = ?auto_117496 ?auto_117498 ) ) ( not ( = ?auto_117497 ?auto_117498 ) ) ( ON ?auto_117498 ?auto_117499 ) ( not ( = ?auto_117493 ?auto_117499 ) ) ( not ( = ?auto_117494 ?auto_117499 ) ) ( not ( = ?auto_117495 ?auto_117499 ) ) ( not ( = ?auto_117496 ?auto_117499 ) ) ( not ( = ?auto_117497 ?auto_117499 ) ) ( not ( = ?auto_117498 ?auto_117499 ) ) ( ON ?auto_117497 ?auto_117498 ) ( ON-TABLE ?auto_117500 ) ( ON ?auto_117501 ?auto_117500 ) ( ON ?auto_117499 ?auto_117501 ) ( not ( = ?auto_117500 ?auto_117501 ) ) ( not ( = ?auto_117500 ?auto_117499 ) ) ( not ( = ?auto_117500 ?auto_117498 ) ) ( not ( = ?auto_117500 ?auto_117497 ) ) ( not ( = ?auto_117501 ?auto_117499 ) ) ( not ( = ?auto_117501 ?auto_117498 ) ) ( not ( = ?auto_117501 ?auto_117497 ) ) ( not ( = ?auto_117493 ?auto_117500 ) ) ( not ( = ?auto_117493 ?auto_117501 ) ) ( not ( = ?auto_117494 ?auto_117500 ) ) ( not ( = ?auto_117494 ?auto_117501 ) ) ( not ( = ?auto_117495 ?auto_117500 ) ) ( not ( = ?auto_117495 ?auto_117501 ) ) ( not ( = ?auto_117496 ?auto_117500 ) ) ( not ( = ?auto_117496 ?auto_117501 ) ) ( ON ?auto_117496 ?auto_117497 ) ( ON ?auto_117495 ?auto_117496 ) ( CLEAR ?auto_117495 ) ( HOLDING ?auto_117494 ) ( CLEAR ?auto_117493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117493 ?auto_117494 )
      ( MAKE-6PILE ?auto_117493 ?auto_117494 ?auto_117495 ?auto_117496 ?auto_117497 ?auto_117498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117502 - BLOCK
      ?auto_117503 - BLOCK
      ?auto_117504 - BLOCK
      ?auto_117505 - BLOCK
      ?auto_117506 - BLOCK
      ?auto_117507 - BLOCK
    )
    :vars
    (
      ?auto_117508 - BLOCK
      ?auto_117510 - BLOCK
      ?auto_117509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117502 ) ( not ( = ?auto_117502 ?auto_117503 ) ) ( not ( = ?auto_117502 ?auto_117504 ) ) ( not ( = ?auto_117502 ?auto_117505 ) ) ( not ( = ?auto_117502 ?auto_117506 ) ) ( not ( = ?auto_117502 ?auto_117507 ) ) ( not ( = ?auto_117503 ?auto_117504 ) ) ( not ( = ?auto_117503 ?auto_117505 ) ) ( not ( = ?auto_117503 ?auto_117506 ) ) ( not ( = ?auto_117503 ?auto_117507 ) ) ( not ( = ?auto_117504 ?auto_117505 ) ) ( not ( = ?auto_117504 ?auto_117506 ) ) ( not ( = ?auto_117504 ?auto_117507 ) ) ( not ( = ?auto_117505 ?auto_117506 ) ) ( not ( = ?auto_117505 ?auto_117507 ) ) ( not ( = ?auto_117506 ?auto_117507 ) ) ( ON ?auto_117507 ?auto_117508 ) ( not ( = ?auto_117502 ?auto_117508 ) ) ( not ( = ?auto_117503 ?auto_117508 ) ) ( not ( = ?auto_117504 ?auto_117508 ) ) ( not ( = ?auto_117505 ?auto_117508 ) ) ( not ( = ?auto_117506 ?auto_117508 ) ) ( not ( = ?auto_117507 ?auto_117508 ) ) ( ON ?auto_117506 ?auto_117507 ) ( ON-TABLE ?auto_117510 ) ( ON ?auto_117509 ?auto_117510 ) ( ON ?auto_117508 ?auto_117509 ) ( not ( = ?auto_117510 ?auto_117509 ) ) ( not ( = ?auto_117510 ?auto_117508 ) ) ( not ( = ?auto_117510 ?auto_117507 ) ) ( not ( = ?auto_117510 ?auto_117506 ) ) ( not ( = ?auto_117509 ?auto_117508 ) ) ( not ( = ?auto_117509 ?auto_117507 ) ) ( not ( = ?auto_117509 ?auto_117506 ) ) ( not ( = ?auto_117502 ?auto_117510 ) ) ( not ( = ?auto_117502 ?auto_117509 ) ) ( not ( = ?auto_117503 ?auto_117510 ) ) ( not ( = ?auto_117503 ?auto_117509 ) ) ( not ( = ?auto_117504 ?auto_117510 ) ) ( not ( = ?auto_117504 ?auto_117509 ) ) ( not ( = ?auto_117505 ?auto_117510 ) ) ( not ( = ?auto_117505 ?auto_117509 ) ) ( ON ?auto_117505 ?auto_117506 ) ( ON ?auto_117504 ?auto_117505 ) ( CLEAR ?auto_117502 ) ( ON ?auto_117503 ?auto_117504 ) ( CLEAR ?auto_117503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117510 ?auto_117509 ?auto_117508 ?auto_117507 ?auto_117506 ?auto_117505 ?auto_117504 )
      ( MAKE-6PILE ?auto_117502 ?auto_117503 ?auto_117504 ?auto_117505 ?auto_117506 ?auto_117507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117511 - BLOCK
      ?auto_117512 - BLOCK
      ?auto_117513 - BLOCK
      ?auto_117514 - BLOCK
      ?auto_117515 - BLOCK
      ?auto_117516 - BLOCK
    )
    :vars
    (
      ?auto_117518 - BLOCK
      ?auto_117519 - BLOCK
      ?auto_117517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117511 ?auto_117512 ) ) ( not ( = ?auto_117511 ?auto_117513 ) ) ( not ( = ?auto_117511 ?auto_117514 ) ) ( not ( = ?auto_117511 ?auto_117515 ) ) ( not ( = ?auto_117511 ?auto_117516 ) ) ( not ( = ?auto_117512 ?auto_117513 ) ) ( not ( = ?auto_117512 ?auto_117514 ) ) ( not ( = ?auto_117512 ?auto_117515 ) ) ( not ( = ?auto_117512 ?auto_117516 ) ) ( not ( = ?auto_117513 ?auto_117514 ) ) ( not ( = ?auto_117513 ?auto_117515 ) ) ( not ( = ?auto_117513 ?auto_117516 ) ) ( not ( = ?auto_117514 ?auto_117515 ) ) ( not ( = ?auto_117514 ?auto_117516 ) ) ( not ( = ?auto_117515 ?auto_117516 ) ) ( ON ?auto_117516 ?auto_117518 ) ( not ( = ?auto_117511 ?auto_117518 ) ) ( not ( = ?auto_117512 ?auto_117518 ) ) ( not ( = ?auto_117513 ?auto_117518 ) ) ( not ( = ?auto_117514 ?auto_117518 ) ) ( not ( = ?auto_117515 ?auto_117518 ) ) ( not ( = ?auto_117516 ?auto_117518 ) ) ( ON ?auto_117515 ?auto_117516 ) ( ON-TABLE ?auto_117519 ) ( ON ?auto_117517 ?auto_117519 ) ( ON ?auto_117518 ?auto_117517 ) ( not ( = ?auto_117519 ?auto_117517 ) ) ( not ( = ?auto_117519 ?auto_117518 ) ) ( not ( = ?auto_117519 ?auto_117516 ) ) ( not ( = ?auto_117519 ?auto_117515 ) ) ( not ( = ?auto_117517 ?auto_117518 ) ) ( not ( = ?auto_117517 ?auto_117516 ) ) ( not ( = ?auto_117517 ?auto_117515 ) ) ( not ( = ?auto_117511 ?auto_117519 ) ) ( not ( = ?auto_117511 ?auto_117517 ) ) ( not ( = ?auto_117512 ?auto_117519 ) ) ( not ( = ?auto_117512 ?auto_117517 ) ) ( not ( = ?auto_117513 ?auto_117519 ) ) ( not ( = ?auto_117513 ?auto_117517 ) ) ( not ( = ?auto_117514 ?auto_117519 ) ) ( not ( = ?auto_117514 ?auto_117517 ) ) ( ON ?auto_117514 ?auto_117515 ) ( ON ?auto_117513 ?auto_117514 ) ( ON ?auto_117512 ?auto_117513 ) ( CLEAR ?auto_117512 ) ( HOLDING ?auto_117511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117511 )
      ( MAKE-6PILE ?auto_117511 ?auto_117512 ?auto_117513 ?auto_117514 ?auto_117515 ?auto_117516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117520 - BLOCK
      ?auto_117521 - BLOCK
      ?auto_117522 - BLOCK
      ?auto_117523 - BLOCK
      ?auto_117524 - BLOCK
      ?auto_117525 - BLOCK
    )
    :vars
    (
      ?auto_117528 - BLOCK
      ?auto_117526 - BLOCK
      ?auto_117527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117520 ?auto_117521 ) ) ( not ( = ?auto_117520 ?auto_117522 ) ) ( not ( = ?auto_117520 ?auto_117523 ) ) ( not ( = ?auto_117520 ?auto_117524 ) ) ( not ( = ?auto_117520 ?auto_117525 ) ) ( not ( = ?auto_117521 ?auto_117522 ) ) ( not ( = ?auto_117521 ?auto_117523 ) ) ( not ( = ?auto_117521 ?auto_117524 ) ) ( not ( = ?auto_117521 ?auto_117525 ) ) ( not ( = ?auto_117522 ?auto_117523 ) ) ( not ( = ?auto_117522 ?auto_117524 ) ) ( not ( = ?auto_117522 ?auto_117525 ) ) ( not ( = ?auto_117523 ?auto_117524 ) ) ( not ( = ?auto_117523 ?auto_117525 ) ) ( not ( = ?auto_117524 ?auto_117525 ) ) ( ON ?auto_117525 ?auto_117528 ) ( not ( = ?auto_117520 ?auto_117528 ) ) ( not ( = ?auto_117521 ?auto_117528 ) ) ( not ( = ?auto_117522 ?auto_117528 ) ) ( not ( = ?auto_117523 ?auto_117528 ) ) ( not ( = ?auto_117524 ?auto_117528 ) ) ( not ( = ?auto_117525 ?auto_117528 ) ) ( ON ?auto_117524 ?auto_117525 ) ( ON-TABLE ?auto_117526 ) ( ON ?auto_117527 ?auto_117526 ) ( ON ?auto_117528 ?auto_117527 ) ( not ( = ?auto_117526 ?auto_117527 ) ) ( not ( = ?auto_117526 ?auto_117528 ) ) ( not ( = ?auto_117526 ?auto_117525 ) ) ( not ( = ?auto_117526 ?auto_117524 ) ) ( not ( = ?auto_117527 ?auto_117528 ) ) ( not ( = ?auto_117527 ?auto_117525 ) ) ( not ( = ?auto_117527 ?auto_117524 ) ) ( not ( = ?auto_117520 ?auto_117526 ) ) ( not ( = ?auto_117520 ?auto_117527 ) ) ( not ( = ?auto_117521 ?auto_117526 ) ) ( not ( = ?auto_117521 ?auto_117527 ) ) ( not ( = ?auto_117522 ?auto_117526 ) ) ( not ( = ?auto_117522 ?auto_117527 ) ) ( not ( = ?auto_117523 ?auto_117526 ) ) ( not ( = ?auto_117523 ?auto_117527 ) ) ( ON ?auto_117523 ?auto_117524 ) ( ON ?auto_117522 ?auto_117523 ) ( ON ?auto_117521 ?auto_117522 ) ( ON ?auto_117520 ?auto_117521 ) ( CLEAR ?auto_117520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117526 ?auto_117527 ?auto_117528 ?auto_117525 ?auto_117524 ?auto_117523 ?auto_117522 ?auto_117521 )
      ( MAKE-6PILE ?auto_117520 ?auto_117521 ?auto_117522 ?auto_117523 ?auto_117524 ?auto_117525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117531 - BLOCK
      ?auto_117532 - BLOCK
    )
    :vars
    (
      ?auto_117533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117533 ?auto_117532 ) ( CLEAR ?auto_117533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117531 ) ( ON ?auto_117532 ?auto_117531 ) ( not ( = ?auto_117531 ?auto_117532 ) ) ( not ( = ?auto_117531 ?auto_117533 ) ) ( not ( = ?auto_117532 ?auto_117533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117533 ?auto_117532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117534 - BLOCK
      ?auto_117535 - BLOCK
    )
    :vars
    (
      ?auto_117536 - BLOCK
      ?auto_117537 - BLOCK
      ?auto_117538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117536 ?auto_117535 ) ( CLEAR ?auto_117536 ) ( ON-TABLE ?auto_117534 ) ( ON ?auto_117535 ?auto_117534 ) ( not ( = ?auto_117534 ?auto_117535 ) ) ( not ( = ?auto_117534 ?auto_117536 ) ) ( not ( = ?auto_117535 ?auto_117536 ) ) ( HOLDING ?auto_117537 ) ( CLEAR ?auto_117538 ) ( not ( = ?auto_117534 ?auto_117537 ) ) ( not ( = ?auto_117534 ?auto_117538 ) ) ( not ( = ?auto_117535 ?auto_117537 ) ) ( not ( = ?auto_117535 ?auto_117538 ) ) ( not ( = ?auto_117536 ?auto_117537 ) ) ( not ( = ?auto_117536 ?auto_117538 ) ) ( not ( = ?auto_117537 ?auto_117538 ) ) )
    :subtasks
    ( ( !STACK ?auto_117537 ?auto_117538 )
      ( MAKE-2PILE ?auto_117534 ?auto_117535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117539 - BLOCK
      ?auto_117540 - BLOCK
    )
    :vars
    (
      ?auto_117543 - BLOCK
      ?auto_117542 - BLOCK
      ?auto_117541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117543 ?auto_117540 ) ( ON-TABLE ?auto_117539 ) ( ON ?auto_117540 ?auto_117539 ) ( not ( = ?auto_117539 ?auto_117540 ) ) ( not ( = ?auto_117539 ?auto_117543 ) ) ( not ( = ?auto_117540 ?auto_117543 ) ) ( CLEAR ?auto_117542 ) ( not ( = ?auto_117539 ?auto_117541 ) ) ( not ( = ?auto_117539 ?auto_117542 ) ) ( not ( = ?auto_117540 ?auto_117541 ) ) ( not ( = ?auto_117540 ?auto_117542 ) ) ( not ( = ?auto_117543 ?auto_117541 ) ) ( not ( = ?auto_117543 ?auto_117542 ) ) ( not ( = ?auto_117541 ?auto_117542 ) ) ( ON ?auto_117541 ?auto_117543 ) ( CLEAR ?auto_117541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117539 ?auto_117540 ?auto_117543 )
      ( MAKE-2PILE ?auto_117539 ?auto_117540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117544 - BLOCK
      ?auto_117545 - BLOCK
    )
    :vars
    (
      ?auto_117546 - BLOCK
      ?auto_117548 - BLOCK
      ?auto_117547 - BLOCK
      ?auto_117552 - BLOCK
      ?auto_117550 - BLOCK
      ?auto_117551 - BLOCK
      ?auto_117549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117546 ?auto_117545 ) ( ON-TABLE ?auto_117544 ) ( ON ?auto_117545 ?auto_117544 ) ( not ( = ?auto_117544 ?auto_117545 ) ) ( not ( = ?auto_117544 ?auto_117546 ) ) ( not ( = ?auto_117545 ?auto_117546 ) ) ( not ( = ?auto_117544 ?auto_117548 ) ) ( not ( = ?auto_117544 ?auto_117547 ) ) ( not ( = ?auto_117545 ?auto_117548 ) ) ( not ( = ?auto_117545 ?auto_117547 ) ) ( not ( = ?auto_117546 ?auto_117548 ) ) ( not ( = ?auto_117546 ?auto_117547 ) ) ( not ( = ?auto_117548 ?auto_117547 ) ) ( ON ?auto_117548 ?auto_117546 ) ( CLEAR ?auto_117548 ) ( HOLDING ?auto_117547 ) ( CLEAR ?auto_117552 ) ( ON-TABLE ?auto_117550 ) ( ON ?auto_117551 ?auto_117550 ) ( ON ?auto_117549 ?auto_117551 ) ( ON ?auto_117552 ?auto_117549 ) ( not ( = ?auto_117550 ?auto_117551 ) ) ( not ( = ?auto_117550 ?auto_117549 ) ) ( not ( = ?auto_117550 ?auto_117552 ) ) ( not ( = ?auto_117550 ?auto_117547 ) ) ( not ( = ?auto_117551 ?auto_117549 ) ) ( not ( = ?auto_117551 ?auto_117552 ) ) ( not ( = ?auto_117551 ?auto_117547 ) ) ( not ( = ?auto_117549 ?auto_117552 ) ) ( not ( = ?auto_117549 ?auto_117547 ) ) ( not ( = ?auto_117552 ?auto_117547 ) ) ( not ( = ?auto_117544 ?auto_117552 ) ) ( not ( = ?auto_117544 ?auto_117550 ) ) ( not ( = ?auto_117544 ?auto_117551 ) ) ( not ( = ?auto_117544 ?auto_117549 ) ) ( not ( = ?auto_117545 ?auto_117552 ) ) ( not ( = ?auto_117545 ?auto_117550 ) ) ( not ( = ?auto_117545 ?auto_117551 ) ) ( not ( = ?auto_117545 ?auto_117549 ) ) ( not ( = ?auto_117546 ?auto_117552 ) ) ( not ( = ?auto_117546 ?auto_117550 ) ) ( not ( = ?auto_117546 ?auto_117551 ) ) ( not ( = ?auto_117546 ?auto_117549 ) ) ( not ( = ?auto_117548 ?auto_117552 ) ) ( not ( = ?auto_117548 ?auto_117550 ) ) ( not ( = ?auto_117548 ?auto_117551 ) ) ( not ( = ?auto_117548 ?auto_117549 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117550 ?auto_117551 ?auto_117549 ?auto_117552 ?auto_117547 )
      ( MAKE-2PILE ?auto_117544 ?auto_117545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117553 - BLOCK
      ?auto_117554 - BLOCK
    )
    :vars
    (
      ?auto_117558 - BLOCK
      ?auto_117559 - BLOCK
      ?auto_117561 - BLOCK
      ?auto_117557 - BLOCK
      ?auto_117560 - BLOCK
      ?auto_117555 - BLOCK
      ?auto_117556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117558 ?auto_117554 ) ( ON-TABLE ?auto_117553 ) ( ON ?auto_117554 ?auto_117553 ) ( not ( = ?auto_117553 ?auto_117554 ) ) ( not ( = ?auto_117553 ?auto_117558 ) ) ( not ( = ?auto_117554 ?auto_117558 ) ) ( not ( = ?auto_117553 ?auto_117559 ) ) ( not ( = ?auto_117553 ?auto_117561 ) ) ( not ( = ?auto_117554 ?auto_117559 ) ) ( not ( = ?auto_117554 ?auto_117561 ) ) ( not ( = ?auto_117558 ?auto_117559 ) ) ( not ( = ?auto_117558 ?auto_117561 ) ) ( not ( = ?auto_117559 ?auto_117561 ) ) ( ON ?auto_117559 ?auto_117558 ) ( CLEAR ?auto_117557 ) ( ON-TABLE ?auto_117560 ) ( ON ?auto_117555 ?auto_117560 ) ( ON ?auto_117556 ?auto_117555 ) ( ON ?auto_117557 ?auto_117556 ) ( not ( = ?auto_117560 ?auto_117555 ) ) ( not ( = ?auto_117560 ?auto_117556 ) ) ( not ( = ?auto_117560 ?auto_117557 ) ) ( not ( = ?auto_117560 ?auto_117561 ) ) ( not ( = ?auto_117555 ?auto_117556 ) ) ( not ( = ?auto_117555 ?auto_117557 ) ) ( not ( = ?auto_117555 ?auto_117561 ) ) ( not ( = ?auto_117556 ?auto_117557 ) ) ( not ( = ?auto_117556 ?auto_117561 ) ) ( not ( = ?auto_117557 ?auto_117561 ) ) ( not ( = ?auto_117553 ?auto_117557 ) ) ( not ( = ?auto_117553 ?auto_117560 ) ) ( not ( = ?auto_117553 ?auto_117555 ) ) ( not ( = ?auto_117553 ?auto_117556 ) ) ( not ( = ?auto_117554 ?auto_117557 ) ) ( not ( = ?auto_117554 ?auto_117560 ) ) ( not ( = ?auto_117554 ?auto_117555 ) ) ( not ( = ?auto_117554 ?auto_117556 ) ) ( not ( = ?auto_117558 ?auto_117557 ) ) ( not ( = ?auto_117558 ?auto_117560 ) ) ( not ( = ?auto_117558 ?auto_117555 ) ) ( not ( = ?auto_117558 ?auto_117556 ) ) ( not ( = ?auto_117559 ?auto_117557 ) ) ( not ( = ?auto_117559 ?auto_117560 ) ) ( not ( = ?auto_117559 ?auto_117555 ) ) ( not ( = ?auto_117559 ?auto_117556 ) ) ( ON ?auto_117561 ?auto_117559 ) ( CLEAR ?auto_117561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117553 ?auto_117554 ?auto_117558 ?auto_117559 )
      ( MAKE-2PILE ?auto_117553 ?auto_117554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117562 - BLOCK
      ?auto_117563 - BLOCK
    )
    :vars
    (
      ?auto_117570 - BLOCK
      ?auto_117566 - BLOCK
      ?auto_117564 - BLOCK
      ?auto_117567 - BLOCK
      ?auto_117569 - BLOCK
      ?auto_117568 - BLOCK
      ?auto_117565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117570 ?auto_117563 ) ( ON-TABLE ?auto_117562 ) ( ON ?auto_117563 ?auto_117562 ) ( not ( = ?auto_117562 ?auto_117563 ) ) ( not ( = ?auto_117562 ?auto_117570 ) ) ( not ( = ?auto_117563 ?auto_117570 ) ) ( not ( = ?auto_117562 ?auto_117566 ) ) ( not ( = ?auto_117562 ?auto_117564 ) ) ( not ( = ?auto_117563 ?auto_117566 ) ) ( not ( = ?auto_117563 ?auto_117564 ) ) ( not ( = ?auto_117570 ?auto_117566 ) ) ( not ( = ?auto_117570 ?auto_117564 ) ) ( not ( = ?auto_117566 ?auto_117564 ) ) ( ON ?auto_117566 ?auto_117570 ) ( ON-TABLE ?auto_117567 ) ( ON ?auto_117569 ?auto_117567 ) ( ON ?auto_117568 ?auto_117569 ) ( not ( = ?auto_117567 ?auto_117569 ) ) ( not ( = ?auto_117567 ?auto_117568 ) ) ( not ( = ?auto_117567 ?auto_117565 ) ) ( not ( = ?auto_117567 ?auto_117564 ) ) ( not ( = ?auto_117569 ?auto_117568 ) ) ( not ( = ?auto_117569 ?auto_117565 ) ) ( not ( = ?auto_117569 ?auto_117564 ) ) ( not ( = ?auto_117568 ?auto_117565 ) ) ( not ( = ?auto_117568 ?auto_117564 ) ) ( not ( = ?auto_117565 ?auto_117564 ) ) ( not ( = ?auto_117562 ?auto_117565 ) ) ( not ( = ?auto_117562 ?auto_117567 ) ) ( not ( = ?auto_117562 ?auto_117569 ) ) ( not ( = ?auto_117562 ?auto_117568 ) ) ( not ( = ?auto_117563 ?auto_117565 ) ) ( not ( = ?auto_117563 ?auto_117567 ) ) ( not ( = ?auto_117563 ?auto_117569 ) ) ( not ( = ?auto_117563 ?auto_117568 ) ) ( not ( = ?auto_117570 ?auto_117565 ) ) ( not ( = ?auto_117570 ?auto_117567 ) ) ( not ( = ?auto_117570 ?auto_117569 ) ) ( not ( = ?auto_117570 ?auto_117568 ) ) ( not ( = ?auto_117566 ?auto_117565 ) ) ( not ( = ?auto_117566 ?auto_117567 ) ) ( not ( = ?auto_117566 ?auto_117569 ) ) ( not ( = ?auto_117566 ?auto_117568 ) ) ( ON ?auto_117564 ?auto_117566 ) ( CLEAR ?auto_117564 ) ( HOLDING ?auto_117565 ) ( CLEAR ?auto_117568 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117567 ?auto_117569 ?auto_117568 ?auto_117565 )
      ( MAKE-2PILE ?auto_117562 ?auto_117563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117571 - BLOCK
      ?auto_117572 - BLOCK
    )
    :vars
    (
      ?auto_117576 - BLOCK
      ?auto_117574 - BLOCK
      ?auto_117579 - BLOCK
      ?auto_117578 - BLOCK
      ?auto_117577 - BLOCK
      ?auto_117573 - BLOCK
      ?auto_117575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117576 ?auto_117572 ) ( ON-TABLE ?auto_117571 ) ( ON ?auto_117572 ?auto_117571 ) ( not ( = ?auto_117571 ?auto_117572 ) ) ( not ( = ?auto_117571 ?auto_117576 ) ) ( not ( = ?auto_117572 ?auto_117576 ) ) ( not ( = ?auto_117571 ?auto_117574 ) ) ( not ( = ?auto_117571 ?auto_117579 ) ) ( not ( = ?auto_117572 ?auto_117574 ) ) ( not ( = ?auto_117572 ?auto_117579 ) ) ( not ( = ?auto_117576 ?auto_117574 ) ) ( not ( = ?auto_117576 ?auto_117579 ) ) ( not ( = ?auto_117574 ?auto_117579 ) ) ( ON ?auto_117574 ?auto_117576 ) ( ON-TABLE ?auto_117578 ) ( ON ?auto_117577 ?auto_117578 ) ( ON ?auto_117573 ?auto_117577 ) ( not ( = ?auto_117578 ?auto_117577 ) ) ( not ( = ?auto_117578 ?auto_117573 ) ) ( not ( = ?auto_117578 ?auto_117575 ) ) ( not ( = ?auto_117578 ?auto_117579 ) ) ( not ( = ?auto_117577 ?auto_117573 ) ) ( not ( = ?auto_117577 ?auto_117575 ) ) ( not ( = ?auto_117577 ?auto_117579 ) ) ( not ( = ?auto_117573 ?auto_117575 ) ) ( not ( = ?auto_117573 ?auto_117579 ) ) ( not ( = ?auto_117575 ?auto_117579 ) ) ( not ( = ?auto_117571 ?auto_117575 ) ) ( not ( = ?auto_117571 ?auto_117578 ) ) ( not ( = ?auto_117571 ?auto_117577 ) ) ( not ( = ?auto_117571 ?auto_117573 ) ) ( not ( = ?auto_117572 ?auto_117575 ) ) ( not ( = ?auto_117572 ?auto_117578 ) ) ( not ( = ?auto_117572 ?auto_117577 ) ) ( not ( = ?auto_117572 ?auto_117573 ) ) ( not ( = ?auto_117576 ?auto_117575 ) ) ( not ( = ?auto_117576 ?auto_117578 ) ) ( not ( = ?auto_117576 ?auto_117577 ) ) ( not ( = ?auto_117576 ?auto_117573 ) ) ( not ( = ?auto_117574 ?auto_117575 ) ) ( not ( = ?auto_117574 ?auto_117578 ) ) ( not ( = ?auto_117574 ?auto_117577 ) ) ( not ( = ?auto_117574 ?auto_117573 ) ) ( ON ?auto_117579 ?auto_117574 ) ( CLEAR ?auto_117573 ) ( ON ?auto_117575 ?auto_117579 ) ( CLEAR ?auto_117575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117571 ?auto_117572 ?auto_117576 ?auto_117574 ?auto_117579 )
      ( MAKE-2PILE ?auto_117571 ?auto_117572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117580 - BLOCK
      ?auto_117581 - BLOCK
    )
    :vars
    (
      ?auto_117588 - BLOCK
      ?auto_117585 - BLOCK
      ?auto_117586 - BLOCK
      ?auto_117587 - BLOCK
      ?auto_117584 - BLOCK
      ?auto_117582 - BLOCK
      ?auto_117583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117588 ?auto_117581 ) ( ON-TABLE ?auto_117580 ) ( ON ?auto_117581 ?auto_117580 ) ( not ( = ?auto_117580 ?auto_117581 ) ) ( not ( = ?auto_117580 ?auto_117588 ) ) ( not ( = ?auto_117581 ?auto_117588 ) ) ( not ( = ?auto_117580 ?auto_117585 ) ) ( not ( = ?auto_117580 ?auto_117586 ) ) ( not ( = ?auto_117581 ?auto_117585 ) ) ( not ( = ?auto_117581 ?auto_117586 ) ) ( not ( = ?auto_117588 ?auto_117585 ) ) ( not ( = ?auto_117588 ?auto_117586 ) ) ( not ( = ?auto_117585 ?auto_117586 ) ) ( ON ?auto_117585 ?auto_117588 ) ( ON-TABLE ?auto_117587 ) ( ON ?auto_117584 ?auto_117587 ) ( not ( = ?auto_117587 ?auto_117584 ) ) ( not ( = ?auto_117587 ?auto_117582 ) ) ( not ( = ?auto_117587 ?auto_117583 ) ) ( not ( = ?auto_117587 ?auto_117586 ) ) ( not ( = ?auto_117584 ?auto_117582 ) ) ( not ( = ?auto_117584 ?auto_117583 ) ) ( not ( = ?auto_117584 ?auto_117586 ) ) ( not ( = ?auto_117582 ?auto_117583 ) ) ( not ( = ?auto_117582 ?auto_117586 ) ) ( not ( = ?auto_117583 ?auto_117586 ) ) ( not ( = ?auto_117580 ?auto_117583 ) ) ( not ( = ?auto_117580 ?auto_117587 ) ) ( not ( = ?auto_117580 ?auto_117584 ) ) ( not ( = ?auto_117580 ?auto_117582 ) ) ( not ( = ?auto_117581 ?auto_117583 ) ) ( not ( = ?auto_117581 ?auto_117587 ) ) ( not ( = ?auto_117581 ?auto_117584 ) ) ( not ( = ?auto_117581 ?auto_117582 ) ) ( not ( = ?auto_117588 ?auto_117583 ) ) ( not ( = ?auto_117588 ?auto_117587 ) ) ( not ( = ?auto_117588 ?auto_117584 ) ) ( not ( = ?auto_117588 ?auto_117582 ) ) ( not ( = ?auto_117585 ?auto_117583 ) ) ( not ( = ?auto_117585 ?auto_117587 ) ) ( not ( = ?auto_117585 ?auto_117584 ) ) ( not ( = ?auto_117585 ?auto_117582 ) ) ( ON ?auto_117586 ?auto_117585 ) ( ON ?auto_117583 ?auto_117586 ) ( CLEAR ?auto_117583 ) ( HOLDING ?auto_117582 ) ( CLEAR ?auto_117584 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117587 ?auto_117584 ?auto_117582 )
      ( MAKE-2PILE ?auto_117580 ?auto_117581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117589 - BLOCK
      ?auto_117590 - BLOCK
    )
    :vars
    (
      ?auto_117591 - BLOCK
      ?auto_117593 - BLOCK
      ?auto_117597 - BLOCK
      ?auto_117592 - BLOCK
      ?auto_117594 - BLOCK
      ?auto_117596 - BLOCK
      ?auto_117595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117591 ?auto_117590 ) ( ON-TABLE ?auto_117589 ) ( ON ?auto_117590 ?auto_117589 ) ( not ( = ?auto_117589 ?auto_117590 ) ) ( not ( = ?auto_117589 ?auto_117591 ) ) ( not ( = ?auto_117590 ?auto_117591 ) ) ( not ( = ?auto_117589 ?auto_117593 ) ) ( not ( = ?auto_117589 ?auto_117597 ) ) ( not ( = ?auto_117590 ?auto_117593 ) ) ( not ( = ?auto_117590 ?auto_117597 ) ) ( not ( = ?auto_117591 ?auto_117593 ) ) ( not ( = ?auto_117591 ?auto_117597 ) ) ( not ( = ?auto_117593 ?auto_117597 ) ) ( ON ?auto_117593 ?auto_117591 ) ( ON-TABLE ?auto_117592 ) ( ON ?auto_117594 ?auto_117592 ) ( not ( = ?auto_117592 ?auto_117594 ) ) ( not ( = ?auto_117592 ?auto_117596 ) ) ( not ( = ?auto_117592 ?auto_117595 ) ) ( not ( = ?auto_117592 ?auto_117597 ) ) ( not ( = ?auto_117594 ?auto_117596 ) ) ( not ( = ?auto_117594 ?auto_117595 ) ) ( not ( = ?auto_117594 ?auto_117597 ) ) ( not ( = ?auto_117596 ?auto_117595 ) ) ( not ( = ?auto_117596 ?auto_117597 ) ) ( not ( = ?auto_117595 ?auto_117597 ) ) ( not ( = ?auto_117589 ?auto_117595 ) ) ( not ( = ?auto_117589 ?auto_117592 ) ) ( not ( = ?auto_117589 ?auto_117594 ) ) ( not ( = ?auto_117589 ?auto_117596 ) ) ( not ( = ?auto_117590 ?auto_117595 ) ) ( not ( = ?auto_117590 ?auto_117592 ) ) ( not ( = ?auto_117590 ?auto_117594 ) ) ( not ( = ?auto_117590 ?auto_117596 ) ) ( not ( = ?auto_117591 ?auto_117595 ) ) ( not ( = ?auto_117591 ?auto_117592 ) ) ( not ( = ?auto_117591 ?auto_117594 ) ) ( not ( = ?auto_117591 ?auto_117596 ) ) ( not ( = ?auto_117593 ?auto_117595 ) ) ( not ( = ?auto_117593 ?auto_117592 ) ) ( not ( = ?auto_117593 ?auto_117594 ) ) ( not ( = ?auto_117593 ?auto_117596 ) ) ( ON ?auto_117597 ?auto_117593 ) ( ON ?auto_117595 ?auto_117597 ) ( CLEAR ?auto_117594 ) ( ON ?auto_117596 ?auto_117595 ) ( CLEAR ?auto_117596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117589 ?auto_117590 ?auto_117591 ?auto_117593 ?auto_117597 ?auto_117595 )
      ( MAKE-2PILE ?auto_117589 ?auto_117590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117598 - BLOCK
      ?auto_117599 - BLOCK
    )
    :vars
    (
      ?auto_117602 - BLOCK
      ?auto_117604 - BLOCK
      ?auto_117603 - BLOCK
      ?auto_117601 - BLOCK
      ?auto_117606 - BLOCK
      ?auto_117600 - BLOCK
      ?auto_117605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117602 ?auto_117599 ) ( ON-TABLE ?auto_117598 ) ( ON ?auto_117599 ?auto_117598 ) ( not ( = ?auto_117598 ?auto_117599 ) ) ( not ( = ?auto_117598 ?auto_117602 ) ) ( not ( = ?auto_117599 ?auto_117602 ) ) ( not ( = ?auto_117598 ?auto_117604 ) ) ( not ( = ?auto_117598 ?auto_117603 ) ) ( not ( = ?auto_117599 ?auto_117604 ) ) ( not ( = ?auto_117599 ?auto_117603 ) ) ( not ( = ?auto_117602 ?auto_117604 ) ) ( not ( = ?auto_117602 ?auto_117603 ) ) ( not ( = ?auto_117604 ?auto_117603 ) ) ( ON ?auto_117604 ?auto_117602 ) ( ON-TABLE ?auto_117601 ) ( not ( = ?auto_117601 ?auto_117606 ) ) ( not ( = ?auto_117601 ?auto_117600 ) ) ( not ( = ?auto_117601 ?auto_117605 ) ) ( not ( = ?auto_117601 ?auto_117603 ) ) ( not ( = ?auto_117606 ?auto_117600 ) ) ( not ( = ?auto_117606 ?auto_117605 ) ) ( not ( = ?auto_117606 ?auto_117603 ) ) ( not ( = ?auto_117600 ?auto_117605 ) ) ( not ( = ?auto_117600 ?auto_117603 ) ) ( not ( = ?auto_117605 ?auto_117603 ) ) ( not ( = ?auto_117598 ?auto_117605 ) ) ( not ( = ?auto_117598 ?auto_117601 ) ) ( not ( = ?auto_117598 ?auto_117606 ) ) ( not ( = ?auto_117598 ?auto_117600 ) ) ( not ( = ?auto_117599 ?auto_117605 ) ) ( not ( = ?auto_117599 ?auto_117601 ) ) ( not ( = ?auto_117599 ?auto_117606 ) ) ( not ( = ?auto_117599 ?auto_117600 ) ) ( not ( = ?auto_117602 ?auto_117605 ) ) ( not ( = ?auto_117602 ?auto_117601 ) ) ( not ( = ?auto_117602 ?auto_117606 ) ) ( not ( = ?auto_117602 ?auto_117600 ) ) ( not ( = ?auto_117604 ?auto_117605 ) ) ( not ( = ?auto_117604 ?auto_117601 ) ) ( not ( = ?auto_117604 ?auto_117606 ) ) ( not ( = ?auto_117604 ?auto_117600 ) ) ( ON ?auto_117603 ?auto_117604 ) ( ON ?auto_117605 ?auto_117603 ) ( ON ?auto_117600 ?auto_117605 ) ( CLEAR ?auto_117600 ) ( HOLDING ?auto_117606 ) ( CLEAR ?auto_117601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117601 ?auto_117606 )
      ( MAKE-2PILE ?auto_117598 ?auto_117599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119625 - BLOCK
      ?auto_119626 - BLOCK
    )
    :vars
    (
      ?auto_119629 - BLOCK
      ?auto_119627 - BLOCK
      ?auto_119632 - BLOCK
      ?auto_119630 - BLOCK
      ?auto_119631 - BLOCK
      ?auto_119628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119629 ?auto_119626 ) ( ON-TABLE ?auto_119625 ) ( ON ?auto_119626 ?auto_119625 ) ( not ( = ?auto_119625 ?auto_119626 ) ) ( not ( = ?auto_119625 ?auto_119629 ) ) ( not ( = ?auto_119626 ?auto_119629 ) ) ( not ( = ?auto_119625 ?auto_119627 ) ) ( not ( = ?auto_119625 ?auto_119632 ) ) ( not ( = ?auto_119626 ?auto_119627 ) ) ( not ( = ?auto_119626 ?auto_119632 ) ) ( not ( = ?auto_119629 ?auto_119627 ) ) ( not ( = ?auto_119629 ?auto_119632 ) ) ( not ( = ?auto_119627 ?auto_119632 ) ) ( ON ?auto_119627 ?auto_119629 ) ( not ( = ?auto_119630 ?auto_119631 ) ) ( not ( = ?auto_119630 ?auto_119628 ) ) ( not ( = ?auto_119630 ?auto_119632 ) ) ( not ( = ?auto_119631 ?auto_119628 ) ) ( not ( = ?auto_119631 ?auto_119632 ) ) ( not ( = ?auto_119628 ?auto_119632 ) ) ( not ( = ?auto_119625 ?auto_119628 ) ) ( not ( = ?auto_119625 ?auto_119630 ) ) ( not ( = ?auto_119625 ?auto_119631 ) ) ( not ( = ?auto_119626 ?auto_119628 ) ) ( not ( = ?auto_119626 ?auto_119630 ) ) ( not ( = ?auto_119626 ?auto_119631 ) ) ( not ( = ?auto_119629 ?auto_119628 ) ) ( not ( = ?auto_119629 ?auto_119630 ) ) ( not ( = ?auto_119629 ?auto_119631 ) ) ( not ( = ?auto_119627 ?auto_119628 ) ) ( not ( = ?auto_119627 ?auto_119630 ) ) ( not ( = ?auto_119627 ?auto_119631 ) ) ( ON ?auto_119632 ?auto_119627 ) ( ON ?auto_119628 ?auto_119632 ) ( ON ?auto_119631 ?auto_119628 ) ( ON ?auto_119630 ?auto_119631 ) ( CLEAR ?auto_119630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119625 ?auto_119626 ?auto_119629 ?auto_119627 ?auto_119632 ?auto_119628 ?auto_119631 )
      ( MAKE-2PILE ?auto_119625 ?auto_119626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117616 - BLOCK
      ?auto_117617 - BLOCK
    )
    :vars
    (
      ?auto_117618 - BLOCK
      ?auto_117619 - BLOCK
      ?auto_117621 - BLOCK
      ?auto_117623 - BLOCK
      ?auto_117624 - BLOCK
      ?auto_117622 - BLOCK
      ?auto_117620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117618 ?auto_117617 ) ( ON-TABLE ?auto_117616 ) ( ON ?auto_117617 ?auto_117616 ) ( not ( = ?auto_117616 ?auto_117617 ) ) ( not ( = ?auto_117616 ?auto_117618 ) ) ( not ( = ?auto_117617 ?auto_117618 ) ) ( not ( = ?auto_117616 ?auto_117619 ) ) ( not ( = ?auto_117616 ?auto_117621 ) ) ( not ( = ?auto_117617 ?auto_117619 ) ) ( not ( = ?auto_117617 ?auto_117621 ) ) ( not ( = ?auto_117618 ?auto_117619 ) ) ( not ( = ?auto_117618 ?auto_117621 ) ) ( not ( = ?auto_117619 ?auto_117621 ) ) ( ON ?auto_117619 ?auto_117618 ) ( not ( = ?auto_117623 ?auto_117624 ) ) ( not ( = ?auto_117623 ?auto_117622 ) ) ( not ( = ?auto_117623 ?auto_117620 ) ) ( not ( = ?auto_117623 ?auto_117621 ) ) ( not ( = ?auto_117624 ?auto_117622 ) ) ( not ( = ?auto_117624 ?auto_117620 ) ) ( not ( = ?auto_117624 ?auto_117621 ) ) ( not ( = ?auto_117622 ?auto_117620 ) ) ( not ( = ?auto_117622 ?auto_117621 ) ) ( not ( = ?auto_117620 ?auto_117621 ) ) ( not ( = ?auto_117616 ?auto_117620 ) ) ( not ( = ?auto_117616 ?auto_117623 ) ) ( not ( = ?auto_117616 ?auto_117624 ) ) ( not ( = ?auto_117616 ?auto_117622 ) ) ( not ( = ?auto_117617 ?auto_117620 ) ) ( not ( = ?auto_117617 ?auto_117623 ) ) ( not ( = ?auto_117617 ?auto_117624 ) ) ( not ( = ?auto_117617 ?auto_117622 ) ) ( not ( = ?auto_117618 ?auto_117620 ) ) ( not ( = ?auto_117618 ?auto_117623 ) ) ( not ( = ?auto_117618 ?auto_117624 ) ) ( not ( = ?auto_117618 ?auto_117622 ) ) ( not ( = ?auto_117619 ?auto_117620 ) ) ( not ( = ?auto_117619 ?auto_117623 ) ) ( not ( = ?auto_117619 ?auto_117624 ) ) ( not ( = ?auto_117619 ?auto_117622 ) ) ( ON ?auto_117621 ?auto_117619 ) ( ON ?auto_117620 ?auto_117621 ) ( ON ?auto_117622 ?auto_117620 ) ( ON ?auto_117624 ?auto_117622 ) ( CLEAR ?auto_117624 ) ( HOLDING ?auto_117623 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117623 )
      ( MAKE-2PILE ?auto_117616 ?auto_117617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117625 - BLOCK
      ?auto_117626 - BLOCK
    )
    :vars
    (
      ?auto_117630 - BLOCK
      ?auto_117628 - BLOCK
      ?auto_117632 - BLOCK
      ?auto_117629 - BLOCK
      ?auto_117627 - BLOCK
      ?auto_117633 - BLOCK
      ?auto_117631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117630 ?auto_117626 ) ( ON-TABLE ?auto_117625 ) ( ON ?auto_117626 ?auto_117625 ) ( not ( = ?auto_117625 ?auto_117626 ) ) ( not ( = ?auto_117625 ?auto_117630 ) ) ( not ( = ?auto_117626 ?auto_117630 ) ) ( not ( = ?auto_117625 ?auto_117628 ) ) ( not ( = ?auto_117625 ?auto_117632 ) ) ( not ( = ?auto_117626 ?auto_117628 ) ) ( not ( = ?auto_117626 ?auto_117632 ) ) ( not ( = ?auto_117630 ?auto_117628 ) ) ( not ( = ?auto_117630 ?auto_117632 ) ) ( not ( = ?auto_117628 ?auto_117632 ) ) ( ON ?auto_117628 ?auto_117630 ) ( not ( = ?auto_117629 ?auto_117627 ) ) ( not ( = ?auto_117629 ?auto_117633 ) ) ( not ( = ?auto_117629 ?auto_117631 ) ) ( not ( = ?auto_117629 ?auto_117632 ) ) ( not ( = ?auto_117627 ?auto_117633 ) ) ( not ( = ?auto_117627 ?auto_117631 ) ) ( not ( = ?auto_117627 ?auto_117632 ) ) ( not ( = ?auto_117633 ?auto_117631 ) ) ( not ( = ?auto_117633 ?auto_117632 ) ) ( not ( = ?auto_117631 ?auto_117632 ) ) ( not ( = ?auto_117625 ?auto_117631 ) ) ( not ( = ?auto_117625 ?auto_117629 ) ) ( not ( = ?auto_117625 ?auto_117627 ) ) ( not ( = ?auto_117625 ?auto_117633 ) ) ( not ( = ?auto_117626 ?auto_117631 ) ) ( not ( = ?auto_117626 ?auto_117629 ) ) ( not ( = ?auto_117626 ?auto_117627 ) ) ( not ( = ?auto_117626 ?auto_117633 ) ) ( not ( = ?auto_117630 ?auto_117631 ) ) ( not ( = ?auto_117630 ?auto_117629 ) ) ( not ( = ?auto_117630 ?auto_117627 ) ) ( not ( = ?auto_117630 ?auto_117633 ) ) ( not ( = ?auto_117628 ?auto_117631 ) ) ( not ( = ?auto_117628 ?auto_117629 ) ) ( not ( = ?auto_117628 ?auto_117627 ) ) ( not ( = ?auto_117628 ?auto_117633 ) ) ( ON ?auto_117632 ?auto_117628 ) ( ON ?auto_117631 ?auto_117632 ) ( ON ?auto_117633 ?auto_117631 ) ( ON ?auto_117627 ?auto_117633 ) ( ON ?auto_117629 ?auto_117627 ) ( CLEAR ?auto_117629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117625 ?auto_117626 ?auto_117630 ?auto_117628 ?auto_117632 ?auto_117631 ?auto_117633 ?auto_117627 )
      ( MAKE-2PILE ?auto_117625 ?auto_117626 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117641 - BLOCK
      ?auto_117642 - BLOCK
      ?auto_117643 - BLOCK
      ?auto_117644 - BLOCK
      ?auto_117645 - BLOCK
      ?auto_117646 - BLOCK
      ?auto_117647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117647 ) ( CLEAR ?auto_117646 ) ( ON-TABLE ?auto_117641 ) ( ON ?auto_117642 ?auto_117641 ) ( ON ?auto_117643 ?auto_117642 ) ( ON ?auto_117644 ?auto_117643 ) ( ON ?auto_117645 ?auto_117644 ) ( ON ?auto_117646 ?auto_117645 ) ( not ( = ?auto_117641 ?auto_117642 ) ) ( not ( = ?auto_117641 ?auto_117643 ) ) ( not ( = ?auto_117641 ?auto_117644 ) ) ( not ( = ?auto_117641 ?auto_117645 ) ) ( not ( = ?auto_117641 ?auto_117646 ) ) ( not ( = ?auto_117641 ?auto_117647 ) ) ( not ( = ?auto_117642 ?auto_117643 ) ) ( not ( = ?auto_117642 ?auto_117644 ) ) ( not ( = ?auto_117642 ?auto_117645 ) ) ( not ( = ?auto_117642 ?auto_117646 ) ) ( not ( = ?auto_117642 ?auto_117647 ) ) ( not ( = ?auto_117643 ?auto_117644 ) ) ( not ( = ?auto_117643 ?auto_117645 ) ) ( not ( = ?auto_117643 ?auto_117646 ) ) ( not ( = ?auto_117643 ?auto_117647 ) ) ( not ( = ?auto_117644 ?auto_117645 ) ) ( not ( = ?auto_117644 ?auto_117646 ) ) ( not ( = ?auto_117644 ?auto_117647 ) ) ( not ( = ?auto_117645 ?auto_117646 ) ) ( not ( = ?auto_117645 ?auto_117647 ) ) ( not ( = ?auto_117646 ?auto_117647 ) ) )
    :subtasks
    ( ( !STACK ?auto_117647 ?auto_117646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117648 - BLOCK
      ?auto_117649 - BLOCK
      ?auto_117650 - BLOCK
      ?auto_117651 - BLOCK
      ?auto_117652 - BLOCK
      ?auto_117653 - BLOCK
      ?auto_117654 - BLOCK
    )
    :vars
    (
      ?auto_117655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117653 ) ( ON-TABLE ?auto_117648 ) ( ON ?auto_117649 ?auto_117648 ) ( ON ?auto_117650 ?auto_117649 ) ( ON ?auto_117651 ?auto_117650 ) ( ON ?auto_117652 ?auto_117651 ) ( ON ?auto_117653 ?auto_117652 ) ( not ( = ?auto_117648 ?auto_117649 ) ) ( not ( = ?auto_117648 ?auto_117650 ) ) ( not ( = ?auto_117648 ?auto_117651 ) ) ( not ( = ?auto_117648 ?auto_117652 ) ) ( not ( = ?auto_117648 ?auto_117653 ) ) ( not ( = ?auto_117648 ?auto_117654 ) ) ( not ( = ?auto_117649 ?auto_117650 ) ) ( not ( = ?auto_117649 ?auto_117651 ) ) ( not ( = ?auto_117649 ?auto_117652 ) ) ( not ( = ?auto_117649 ?auto_117653 ) ) ( not ( = ?auto_117649 ?auto_117654 ) ) ( not ( = ?auto_117650 ?auto_117651 ) ) ( not ( = ?auto_117650 ?auto_117652 ) ) ( not ( = ?auto_117650 ?auto_117653 ) ) ( not ( = ?auto_117650 ?auto_117654 ) ) ( not ( = ?auto_117651 ?auto_117652 ) ) ( not ( = ?auto_117651 ?auto_117653 ) ) ( not ( = ?auto_117651 ?auto_117654 ) ) ( not ( = ?auto_117652 ?auto_117653 ) ) ( not ( = ?auto_117652 ?auto_117654 ) ) ( not ( = ?auto_117653 ?auto_117654 ) ) ( ON ?auto_117654 ?auto_117655 ) ( CLEAR ?auto_117654 ) ( HAND-EMPTY ) ( not ( = ?auto_117648 ?auto_117655 ) ) ( not ( = ?auto_117649 ?auto_117655 ) ) ( not ( = ?auto_117650 ?auto_117655 ) ) ( not ( = ?auto_117651 ?auto_117655 ) ) ( not ( = ?auto_117652 ?auto_117655 ) ) ( not ( = ?auto_117653 ?auto_117655 ) ) ( not ( = ?auto_117654 ?auto_117655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117654 ?auto_117655 )
      ( MAKE-7PILE ?auto_117648 ?auto_117649 ?auto_117650 ?auto_117651 ?auto_117652 ?auto_117653 ?auto_117654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117656 - BLOCK
      ?auto_117657 - BLOCK
      ?auto_117658 - BLOCK
      ?auto_117659 - BLOCK
      ?auto_117660 - BLOCK
      ?auto_117661 - BLOCK
      ?auto_117662 - BLOCK
    )
    :vars
    (
      ?auto_117663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117656 ) ( ON ?auto_117657 ?auto_117656 ) ( ON ?auto_117658 ?auto_117657 ) ( ON ?auto_117659 ?auto_117658 ) ( ON ?auto_117660 ?auto_117659 ) ( not ( = ?auto_117656 ?auto_117657 ) ) ( not ( = ?auto_117656 ?auto_117658 ) ) ( not ( = ?auto_117656 ?auto_117659 ) ) ( not ( = ?auto_117656 ?auto_117660 ) ) ( not ( = ?auto_117656 ?auto_117661 ) ) ( not ( = ?auto_117656 ?auto_117662 ) ) ( not ( = ?auto_117657 ?auto_117658 ) ) ( not ( = ?auto_117657 ?auto_117659 ) ) ( not ( = ?auto_117657 ?auto_117660 ) ) ( not ( = ?auto_117657 ?auto_117661 ) ) ( not ( = ?auto_117657 ?auto_117662 ) ) ( not ( = ?auto_117658 ?auto_117659 ) ) ( not ( = ?auto_117658 ?auto_117660 ) ) ( not ( = ?auto_117658 ?auto_117661 ) ) ( not ( = ?auto_117658 ?auto_117662 ) ) ( not ( = ?auto_117659 ?auto_117660 ) ) ( not ( = ?auto_117659 ?auto_117661 ) ) ( not ( = ?auto_117659 ?auto_117662 ) ) ( not ( = ?auto_117660 ?auto_117661 ) ) ( not ( = ?auto_117660 ?auto_117662 ) ) ( not ( = ?auto_117661 ?auto_117662 ) ) ( ON ?auto_117662 ?auto_117663 ) ( CLEAR ?auto_117662 ) ( not ( = ?auto_117656 ?auto_117663 ) ) ( not ( = ?auto_117657 ?auto_117663 ) ) ( not ( = ?auto_117658 ?auto_117663 ) ) ( not ( = ?auto_117659 ?auto_117663 ) ) ( not ( = ?auto_117660 ?auto_117663 ) ) ( not ( = ?auto_117661 ?auto_117663 ) ) ( not ( = ?auto_117662 ?auto_117663 ) ) ( HOLDING ?auto_117661 ) ( CLEAR ?auto_117660 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117656 ?auto_117657 ?auto_117658 ?auto_117659 ?auto_117660 ?auto_117661 )
      ( MAKE-7PILE ?auto_117656 ?auto_117657 ?auto_117658 ?auto_117659 ?auto_117660 ?auto_117661 ?auto_117662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117664 - BLOCK
      ?auto_117665 - BLOCK
      ?auto_117666 - BLOCK
      ?auto_117667 - BLOCK
      ?auto_117668 - BLOCK
      ?auto_117669 - BLOCK
      ?auto_117670 - BLOCK
    )
    :vars
    (
      ?auto_117671 - BLOCK
      ?auto_117672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117664 ) ( ON ?auto_117665 ?auto_117664 ) ( ON ?auto_117666 ?auto_117665 ) ( ON ?auto_117667 ?auto_117666 ) ( ON ?auto_117668 ?auto_117667 ) ( not ( = ?auto_117664 ?auto_117665 ) ) ( not ( = ?auto_117664 ?auto_117666 ) ) ( not ( = ?auto_117664 ?auto_117667 ) ) ( not ( = ?auto_117664 ?auto_117668 ) ) ( not ( = ?auto_117664 ?auto_117669 ) ) ( not ( = ?auto_117664 ?auto_117670 ) ) ( not ( = ?auto_117665 ?auto_117666 ) ) ( not ( = ?auto_117665 ?auto_117667 ) ) ( not ( = ?auto_117665 ?auto_117668 ) ) ( not ( = ?auto_117665 ?auto_117669 ) ) ( not ( = ?auto_117665 ?auto_117670 ) ) ( not ( = ?auto_117666 ?auto_117667 ) ) ( not ( = ?auto_117666 ?auto_117668 ) ) ( not ( = ?auto_117666 ?auto_117669 ) ) ( not ( = ?auto_117666 ?auto_117670 ) ) ( not ( = ?auto_117667 ?auto_117668 ) ) ( not ( = ?auto_117667 ?auto_117669 ) ) ( not ( = ?auto_117667 ?auto_117670 ) ) ( not ( = ?auto_117668 ?auto_117669 ) ) ( not ( = ?auto_117668 ?auto_117670 ) ) ( not ( = ?auto_117669 ?auto_117670 ) ) ( ON ?auto_117670 ?auto_117671 ) ( not ( = ?auto_117664 ?auto_117671 ) ) ( not ( = ?auto_117665 ?auto_117671 ) ) ( not ( = ?auto_117666 ?auto_117671 ) ) ( not ( = ?auto_117667 ?auto_117671 ) ) ( not ( = ?auto_117668 ?auto_117671 ) ) ( not ( = ?auto_117669 ?auto_117671 ) ) ( not ( = ?auto_117670 ?auto_117671 ) ) ( CLEAR ?auto_117668 ) ( ON ?auto_117669 ?auto_117670 ) ( CLEAR ?auto_117669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117672 ) ( ON ?auto_117671 ?auto_117672 ) ( not ( = ?auto_117672 ?auto_117671 ) ) ( not ( = ?auto_117672 ?auto_117670 ) ) ( not ( = ?auto_117672 ?auto_117669 ) ) ( not ( = ?auto_117664 ?auto_117672 ) ) ( not ( = ?auto_117665 ?auto_117672 ) ) ( not ( = ?auto_117666 ?auto_117672 ) ) ( not ( = ?auto_117667 ?auto_117672 ) ) ( not ( = ?auto_117668 ?auto_117672 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117672 ?auto_117671 ?auto_117670 )
      ( MAKE-7PILE ?auto_117664 ?auto_117665 ?auto_117666 ?auto_117667 ?auto_117668 ?auto_117669 ?auto_117670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117673 - BLOCK
      ?auto_117674 - BLOCK
      ?auto_117675 - BLOCK
      ?auto_117676 - BLOCK
      ?auto_117677 - BLOCK
      ?auto_117678 - BLOCK
      ?auto_117679 - BLOCK
    )
    :vars
    (
      ?auto_117680 - BLOCK
      ?auto_117681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117673 ) ( ON ?auto_117674 ?auto_117673 ) ( ON ?auto_117675 ?auto_117674 ) ( ON ?auto_117676 ?auto_117675 ) ( not ( = ?auto_117673 ?auto_117674 ) ) ( not ( = ?auto_117673 ?auto_117675 ) ) ( not ( = ?auto_117673 ?auto_117676 ) ) ( not ( = ?auto_117673 ?auto_117677 ) ) ( not ( = ?auto_117673 ?auto_117678 ) ) ( not ( = ?auto_117673 ?auto_117679 ) ) ( not ( = ?auto_117674 ?auto_117675 ) ) ( not ( = ?auto_117674 ?auto_117676 ) ) ( not ( = ?auto_117674 ?auto_117677 ) ) ( not ( = ?auto_117674 ?auto_117678 ) ) ( not ( = ?auto_117674 ?auto_117679 ) ) ( not ( = ?auto_117675 ?auto_117676 ) ) ( not ( = ?auto_117675 ?auto_117677 ) ) ( not ( = ?auto_117675 ?auto_117678 ) ) ( not ( = ?auto_117675 ?auto_117679 ) ) ( not ( = ?auto_117676 ?auto_117677 ) ) ( not ( = ?auto_117676 ?auto_117678 ) ) ( not ( = ?auto_117676 ?auto_117679 ) ) ( not ( = ?auto_117677 ?auto_117678 ) ) ( not ( = ?auto_117677 ?auto_117679 ) ) ( not ( = ?auto_117678 ?auto_117679 ) ) ( ON ?auto_117679 ?auto_117680 ) ( not ( = ?auto_117673 ?auto_117680 ) ) ( not ( = ?auto_117674 ?auto_117680 ) ) ( not ( = ?auto_117675 ?auto_117680 ) ) ( not ( = ?auto_117676 ?auto_117680 ) ) ( not ( = ?auto_117677 ?auto_117680 ) ) ( not ( = ?auto_117678 ?auto_117680 ) ) ( not ( = ?auto_117679 ?auto_117680 ) ) ( ON ?auto_117678 ?auto_117679 ) ( CLEAR ?auto_117678 ) ( ON-TABLE ?auto_117681 ) ( ON ?auto_117680 ?auto_117681 ) ( not ( = ?auto_117681 ?auto_117680 ) ) ( not ( = ?auto_117681 ?auto_117679 ) ) ( not ( = ?auto_117681 ?auto_117678 ) ) ( not ( = ?auto_117673 ?auto_117681 ) ) ( not ( = ?auto_117674 ?auto_117681 ) ) ( not ( = ?auto_117675 ?auto_117681 ) ) ( not ( = ?auto_117676 ?auto_117681 ) ) ( not ( = ?auto_117677 ?auto_117681 ) ) ( HOLDING ?auto_117677 ) ( CLEAR ?auto_117676 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117673 ?auto_117674 ?auto_117675 ?auto_117676 ?auto_117677 )
      ( MAKE-7PILE ?auto_117673 ?auto_117674 ?auto_117675 ?auto_117676 ?auto_117677 ?auto_117678 ?auto_117679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117682 - BLOCK
      ?auto_117683 - BLOCK
      ?auto_117684 - BLOCK
      ?auto_117685 - BLOCK
      ?auto_117686 - BLOCK
      ?auto_117687 - BLOCK
      ?auto_117688 - BLOCK
    )
    :vars
    (
      ?auto_117689 - BLOCK
      ?auto_117690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117682 ) ( ON ?auto_117683 ?auto_117682 ) ( ON ?auto_117684 ?auto_117683 ) ( ON ?auto_117685 ?auto_117684 ) ( not ( = ?auto_117682 ?auto_117683 ) ) ( not ( = ?auto_117682 ?auto_117684 ) ) ( not ( = ?auto_117682 ?auto_117685 ) ) ( not ( = ?auto_117682 ?auto_117686 ) ) ( not ( = ?auto_117682 ?auto_117687 ) ) ( not ( = ?auto_117682 ?auto_117688 ) ) ( not ( = ?auto_117683 ?auto_117684 ) ) ( not ( = ?auto_117683 ?auto_117685 ) ) ( not ( = ?auto_117683 ?auto_117686 ) ) ( not ( = ?auto_117683 ?auto_117687 ) ) ( not ( = ?auto_117683 ?auto_117688 ) ) ( not ( = ?auto_117684 ?auto_117685 ) ) ( not ( = ?auto_117684 ?auto_117686 ) ) ( not ( = ?auto_117684 ?auto_117687 ) ) ( not ( = ?auto_117684 ?auto_117688 ) ) ( not ( = ?auto_117685 ?auto_117686 ) ) ( not ( = ?auto_117685 ?auto_117687 ) ) ( not ( = ?auto_117685 ?auto_117688 ) ) ( not ( = ?auto_117686 ?auto_117687 ) ) ( not ( = ?auto_117686 ?auto_117688 ) ) ( not ( = ?auto_117687 ?auto_117688 ) ) ( ON ?auto_117688 ?auto_117689 ) ( not ( = ?auto_117682 ?auto_117689 ) ) ( not ( = ?auto_117683 ?auto_117689 ) ) ( not ( = ?auto_117684 ?auto_117689 ) ) ( not ( = ?auto_117685 ?auto_117689 ) ) ( not ( = ?auto_117686 ?auto_117689 ) ) ( not ( = ?auto_117687 ?auto_117689 ) ) ( not ( = ?auto_117688 ?auto_117689 ) ) ( ON ?auto_117687 ?auto_117688 ) ( ON-TABLE ?auto_117690 ) ( ON ?auto_117689 ?auto_117690 ) ( not ( = ?auto_117690 ?auto_117689 ) ) ( not ( = ?auto_117690 ?auto_117688 ) ) ( not ( = ?auto_117690 ?auto_117687 ) ) ( not ( = ?auto_117682 ?auto_117690 ) ) ( not ( = ?auto_117683 ?auto_117690 ) ) ( not ( = ?auto_117684 ?auto_117690 ) ) ( not ( = ?auto_117685 ?auto_117690 ) ) ( not ( = ?auto_117686 ?auto_117690 ) ) ( CLEAR ?auto_117685 ) ( ON ?auto_117686 ?auto_117687 ) ( CLEAR ?auto_117686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117690 ?auto_117689 ?auto_117688 ?auto_117687 )
      ( MAKE-7PILE ?auto_117682 ?auto_117683 ?auto_117684 ?auto_117685 ?auto_117686 ?auto_117687 ?auto_117688 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117691 - BLOCK
      ?auto_117692 - BLOCK
      ?auto_117693 - BLOCK
      ?auto_117694 - BLOCK
      ?auto_117695 - BLOCK
      ?auto_117696 - BLOCK
      ?auto_117697 - BLOCK
    )
    :vars
    (
      ?auto_117699 - BLOCK
      ?auto_117698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117691 ) ( ON ?auto_117692 ?auto_117691 ) ( ON ?auto_117693 ?auto_117692 ) ( not ( = ?auto_117691 ?auto_117692 ) ) ( not ( = ?auto_117691 ?auto_117693 ) ) ( not ( = ?auto_117691 ?auto_117694 ) ) ( not ( = ?auto_117691 ?auto_117695 ) ) ( not ( = ?auto_117691 ?auto_117696 ) ) ( not ( = ?auto_117691 ?auto_117697 ) ) ( not ( = ?auto_117692 ?auto_117693 ) ) ( not ( = ?auto_117692 ?auto_117694 ) ) ( not ( = ?auto_117692 ?auto_117695 ) ) ( not ( = ?auto_117692 ?auto_117696 ) ) ( not ( = ?auto_117692 ?auto_117697 ) ) ( not ( = ?auto_117693 ?auto_117694 ) ) ( not ( = ?auto_117693 ?auto_117695 ) ) ( not ( = ?auto_117693 ?auto_117696 ) ) ( not ( = ?auto_117693 ?auto_117697 ) ) ( not ( = ?auto_117694 ?auto_117695 ) ) ( not ( = ?auto_117694 ?auto_117696 ) ) ( not ( = ?auto_117694 ?auto_117697 ) ) ( not ( = ?auto_117695 ?auto_117696 ) ) ( not ( = ?auto_117695 ?auto_117697 ) ) ( not ( = ?auto_117696 ?auto_117697 ) ) ( ON ?auto_117697 ?auto_117699 ) ( not ( = ?auto_117691 ?auto_117699 ) ) ( not ( = ?auto_117692 ?auto_117699 ) ) ( not ( = ?auto_117693 ?auto_117699 ) ) ( not ( = ?auto_117694 ?auto_117699 ) ) ( not ( = ?auto_117695 ?auto_117699 ) ) ( not ( = ?auto_117696 ?auto_117699 ) ) ( not ( = ?auto_117697 ?auto_117699 ) ) ( ON ?auto_117696 ?auto_117697 ) ( ON-TABLE ?auto_117698 ) ( ON ?auto_117699 ?auto_117698 ) ( not ( = ?auto_117698 ?auto_117699 ) ) ( not ( = ?auto_117698 ?auto_117697 ) ) ( not ( = ?auto_117698 ?auto_117696 ) ) ( not ( = ?auto_117691 ?auto_117698 ) ) ( not ( = ?auto_117692 ?auto_117698 ) ) ( not ( = ?auto_117693 ?auto_117698 ) ) ( not ( = ?auto_117694 ?auto_117698 ) ) ( not ( = ?auto_117695 ?auto_117698 ) ) ( ON ?auto_117695 ?auto_117696 ) ( CLEAR ?auto_117695 ) ( HOLDING ?auto_117694 ) ( CLEAR ?auto_117693 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117691 ?auto_117692 ?auto_117693 ?auto_117694 )
      ( MAKE-7PILE ?auto_117691 ?auto_117692 ?auto_117693 ?auto_117694 ?auto_117695 ?auto_117696 ?auto_117697 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117700 - BLOCK
      ?auto_117701 - BLOCK
      ?auto_117702 - BLOCK
      ?auto_117703 - BLOCK
      ?auto_117704 - BLOCK
      ?auto_117705 - BLOCK
      ?auto_117706 - BLOCK
    )
    :vars
    (
      ?auto_117708 - BLOCK
      ?auto_117707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117700 ) ( ON ?auto_117701 ?auto_117700 ) ( ON ?auto_117702 ?auto_117701 ) ( not ( = ?auto_117700 ?auto_117701 ) ) ( not ( = ?auto_117700 ?auto_117702 ) ) ( not ( = ?auto_117700 ?auto_117703 ) ) ( not ( = ?auto_117700 ?auto_117704 ) ) ( not ( = ?auto_117700 ?auto_117705 ) ) ( not ( = ?auto_117700 ?auto_117706 ) ) ( not ( = ?auto_117701 ?auto_117702 ) ) ( not ( = ?auto_117701 ?auto_117703 ) ) ( not ( = ?auto_117701 ?auto_117704 ) ) ( not ( = ?auto_117701 ?auto_117705 ) ) ( not ( = ?auto_117701 ?auto_117706 ) ) ( not ( = ?auto_117702 ?auto_117703 ) ) ( not ( = ?auto_117702 ?auto_117704 ) ) ( not ( = ?auto_117702 ?auto_117705 ) ) ( not ( = ?auto_117702 ?auto_117706 ) ) ( not ( = ?auto_117703 ?auto_117704 ) ) ( not ( = ?auto_117703 ?auto_117705 ) ) ( not ( = ?auto_117703 ?auto_117706 ) ) ( not ( = ?auto_117704 ?auto_117705 ) ) ( not ( = ?auto_117704 ?auto_117706 ) ) ( not ( = ?auto_117705 ?auto_117706 ) ) ( ON ?auto_117706 ?auto_117708 ) ( not ( = ?auto_117700 ?auto_117708 ) ) ( not ( = ?auto_117701 ?auto_117708 ) ) ( not ( = ?auto_117702 ?auto_117708 ) ) ( not ( = ?auto_117703 ?auto_117708 ) ) ( not ( = ?auto_117704 ?auto_117708 ) ) ( not ( = ?auto_117705 ?auto_117708 ) ) ( not ( = ?auto_117706 ?auto_117708 ) ) ( ON ?auto_117705 ?auto_117706 ) ( ON-TABLE ?auto_117707 ) ( ON ?auto_117708 ?auto_117707 ) ( not ( = ?auto_117707 ?auto_117708 ) ) ( not ( = ?auto_117707 ?auto_117706 ) ) ( not ( = ?auto_117707 ?auto_117705 ) ) ( not ( = ?auto_117700 ?auto_117707 ) ) ( not ( = ?auto_117701 ?auto_117707 ) ) ( not ( = ?auto_117702 ?auto_117707 ) ) ( not ( = ?auto_117703 ?auto_117707 ) ) ( not ( = ?auto_117704 ?auto_117707 ) ) ( ON ?auto_117704 ?auto_117705 ) ( CLEAR ?auto_117702 ) ( ON ?auto_117703 ?auto_117704 ) ( CLEAR ?auto_117703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117707 ?auto_117708 ?auto_117706 ?auto_117705 ?auto_117704 )
      ( MAKE-7PILE ?auto_117700 ?auto_117701 ?auto_117702 ?auto_117703 ?auto_117704 ?auto_117705 ?auto_117706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117709 - BLOCK
      ?auto_117710 - BLOCK
      ?auto_117711 - BLOCK
      ?auto_117712 - BLOCK
      ?auto_117713 - BLOCK
      ?auto_117714 - BLOCK
      ?auto_117715 - BLOCK
    )
    :vars
    (
      ?auto_117717 - BLOCK
      ?auto_117716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117709 ) ( ON ?auto_117710 ?auto_117709 ) ( not ( = ?auto_117709 ?auto_117710 ) ) ( not ( = ?auto_117709 ?auto_117711 ) ) ( not ( = ?auto_117709 ?auto_117712 ) ) ( not ( = ?auto_117709 ?auto_117713 ) ) ( not ( = ?auto_117709 ?auto_117714 ) ) ( not ( = ?auto_117709 ?auto_117715 ) ) ( not ( = ?auto_117710 ?auto_117711 ) ) ( not ( = ?auto_117710 ?auto_117712 ) ) ( not ( = ?auto_117710 ?auto_117713 ) ) ( not ( = ?auto_117710 ?auto_117714 ) ) ( not ( = ?auto_117710 ?auto_117715 ) ) ( not ( = ?auto_117711 ?auto_117712 ) ) ( not ( = ?auto_117711 ?auto_117713 ) ) ( not ( = ?auto_117711 ?auto_117714 ) ) ( not ( = ?auto_117711 ?auto_117715 ) ) ( not ( = ?auto_117712 ?auto_117713 ) ) ( not ( = ?auto_117712 ?auto_117714 ) ) ( not ( = ?auto_117712 ?auto_117715 ) ) ( not ( = ?auto_117713 ?auto_117714 ) ) ( not ( = ?auto_117713 ?auto_117715 ) ) ( not ( = ?auto_117714 ?auto_117715 ) ) ( ON ?auto_117715 ?auto_117717 ) ( not ( = ?auto_117709 ?auto_117717 ) ) ( not ( = ?auto_117710 ?auto_117717 ) ) ( not ( = ?auto_117711 ?auto_117717 ) ) ( not ( = ?auto_117712 ?auto_117717 ) ) ( not ( = ?auto_117713 ?auto_117717 ) ) ( not ( = ?auto_117714 ?auto_117717 ) ) ( not ( = ?auto_117715 ?auto_117717 ) ) ( ON ?auto_117714 ?auto_117715 ) ( ON-TABLE ?auto_117716 ) ( ON ?auto_117717 ?auto_117716 ) ( not ( = ?auto_117716 ?auto_117717 ) ) ( not ( = ?auto_117716 ?auto_117715 ) ) ( not ( = ?auto_117716 ?auto_117714 ) ) ( not ( = ?auto_117709 ?auto_117716 ) ) ( not ( = ?auto_117710 ?auto_117716 ) ) ( not ( = ?auto_117711 ?auto_117716 ) ) ( not ( = ?auto_117712 ?auto_117716 ) ) ( not ( = ?auto_117713 ?auto_117716 ) ) ( ON ?auto_117713 ?auto_117714 ) ( ON ?auto_117712 ?auto_117713 ) ( CLEAR ?auto_117712 ) ( HOLDING ?auto_117711 ) ( CLEAR ?auto_117710 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117709 ?auto_117710 ?auto_117711 )
      ( MAKE-7PILE ?auto_117709 ?auto_117710 ?auto_117711 ?auto_117712 ?auto_117713 ?auto_117714 ?auto_117715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117718 - BLOCK
      ?auto_117719 - BLOCK
      ?auto_117720 - BLOCK
      ?auto_117721 - BLOCK
      ?auto_117722 - BLOCK
      ?auto_117723 - BLOCK
      ?auto_117724 - BLOCK
    )
    :vars
    (
      ?auto_117726 - BLOCK
      ?auto_117725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117718 ) ( ON ?auto_117719 ?auto_117718 ) ( not ( = ?auto_117718 ?auto_117719 ) ) ( not ( = ?auto_117718 ?auto_117720 ) ) ( not ( = ?auto_117718 ?auto_117721 ) ) ( not ( = ?auto_117718 ?auto_117722 ) ) ( not ( = ?auto_117718 ?auto_117723 ) ) ( not ( = ?auto_117718 ?auto_117724 ) ) ( not ( = ?auto_117719 ?auto_117720 ) ) ( not ( = ?auto_117719 ?auto_117721 ) ) ( not ( = ?auto_117719 ?auto_117722 ) ) ( not ( = ?auto_117719 ?auto_117723 ) ) ( not ( = ?auto_117719 ?auto_117724 ) ) ( not ( = ?auto_117720 ?auto_117721 ) ) ( not ( = ?auto_117720 ?auto_117722 ) ) ( not ( = ?auto_117720 ?auto_117723 ) ) ( not ( = ?auto_117720 ?auto_117724 ) ) ( not ( = ?auto_117721 ?auto_117722 ) ) ( not ( = ?auto_117721 ?auto_117723 ) ) ( not ( = ?auto_117721 ?auto_117724 ) ) ( not ( = ?auto_117722 ?auto_117723 ) ) ( not ( = ?auto_117722 ?auto_117724 ) ) ( not ( = ?auto_117723 ?auto_117724 ) ) ( ON ?auto_117724 ?auto_117726 ) ( not ( = ?auto_117718 ?auto_117726 ) ) ( not ( = ?auto_117719 ?auto_117726 ) ) ( not ( = ?auto_117720 ?auto_117726 ) ) ( not ( = ?auto_117721 ?auto_117726 ) ) ( not ( = ?auto_117722 ?auto_117726 ) ) ( not ( = ?auto_117723 ?auto_117726 ) ) ( not ( = ?auto_117724 ?auto_117726 ) ) ( ON ?auto_117723 ?auto_117724 ) ( ON-TABLE ?auto_117725 ) ( ON ?auto_117726 ?auto_117725 ) ( not ( = ?auto_117725 ?auto_117726 ) ) ( not ( = ?auto_117725 ?auto_117724 ) ) ( not ( = ?auto_117725 ?auto_117723 ) ) ( not ( = ?auto_117718 ?auto_117725 ) ) ( not ( = ?auto_117719 ?auto_117725 ) ) ( not ( = ?auto_117720 ?auto_117725 ) ) ( not ( = ?auto_117721 ?auto_117725 ) ) ( not ( = ?auto_117722 ?auto_117725 ) ) ( ON ?auto_117722 ?auto_117723 ) ( ON ?auto_117721 ?auto_117722 ) ( CLEAR ?auto_117719 ) ( ON ?auto_117720 ?auto_117721 ) ( CLEAR ?auto_117720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117725 ?auto_117726 ?auto_117724 ?auto_117723 ?auto_117722 ?auto_117721 )
      ( MAKE-7PILE ?auto_117718 ?auto_117719 ?auto_117720 ?auto_117721 ?auto_117722 ?auto_117723 ?auto_117724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117727 - BLOCK
      ?auto_117728 - BLOCK
      ?auto_117729 - BLOCK
      ?auto_117730 - BLOCK
      ?auto_117731 - BLOCK
      ?auto_117732 - BLOCK
      ?auto_117733 - BLOCK
    )
    :vars
    (
      ?auto_117735 - BLOCK
      ?auto_117734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117727 ) ( not ( = ?auto_117727 ?auto_117728 ) ) ( not ( = ?auto_117727 ?auto_117729 ) ) ( not ( = ?auto_117727 ?auto_117730 ) ) ( not ( = ?auto_117727 ?auto_117731 ) ) ( not ( = ?auto_117727 ?auto_117732 ) ) ( not ( = ?auto_117727 ?auto_117733 ) ) ( not ( = ?auto_117728 ?auto_117729 ) ) ( not ( = ?auto_117728 ?auto_117730 ) ) ( not ( = ?auto_117728 ?auto_117731 ) ) ( not ( = ?auto_117728 ?auto_117732 ) ) ( not ( = ?auto_117728 ?auto_117733 ) ) ( not ( = ?auto_117729 ?auto_117730 ) ) ( not ( = ?auto_117729 ?auto_117731 ) ) ( not ( = ?auto_117729 ?auto_117732 ) ) ( not ( = ?auto_117729 ?auto_117733 ) ) ( not ( = ?auto_117730 ?auto_117731 ) ) ( not ( = ?auto_117730 ?auto_117732 ) ) ( not ( = ?auto_117730 ?auto_117733 ) ) ( not ( = ?auto_117731 ?auto_117732 ) ) ( not ( = ?auto_117731 ?auto_117733 ) ) ( not ( = ?auto_117732 ?auto_117733 ) ) ( ON ?auto_117733 ?auto_117735 ) ( not ( = ?auto_117727 ?auto_117735 ) ) ( not ( = ?auto_117728 ?auto_117735 ) ) ( not ( = ?auto_117729 ?auto_117735 ) ) ( not ( = ?auto_117730 ?auto_117735 ) ) ( not ( = ?auto_117731 ?auto_117735 ) ) ( not ( = ?auto_117732 ?auto_117735 ) ) ( not ( = ?auto_117733 ?auto_117735 ) ) ( ON ?auto_117732 ?auto_117733 ) ( ON-TABLE ?auto_117734 ) ( ON ?auto_117735 ?auto_117734 ) ( not ( = ?auto_117734 ?auto_117735 ) ) ( not ( = ?auto_117734 ?auto_117733 ) ) ( not ( = ?auto_117734 ?auto_117732 ) ) ( not ( = ?auto_117727 ?auto_117734 ) ) ( not ( = ?auto_117728 ?auto_117734 ) ) ( not ( = ?auto_117729 ?auto_117734 ) ) ( not ( = ?auto_117730 ?auto_117734 ) ) ( not ( = ?auto_117731 ?auto_117734 ) ) ( ON ?auto_117731 ?auto_117732 ) ( ON ?auto_117730 ?auto_117731 ) ( ON ?auto_117729 ?auto_117730 ) ( CLEAR ?auto_117729 ) ( HOLDING ?auto_117728 ) ( CLEAR ?auto_117727 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117727 ?auto_117728 )
      ( MAKE-7PILE ?auto_117727 ?auto_117728 ?auto_117729 ?auto_117730 ?auto_117731 ?auto_117732 ?auto_117733 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117736 - BLOCK
      ?auto_117737 - BLOCK
      ?auto_117738 - BLOCK
      ?auto_117739 - BLOCK
      ?auto_117740 - BLOCK
      ?auto_117741 - BLOCK
      ?auto_117742 - BLOCK
    )
    :vars
    (
      ?auto_117744 - BLOCK
      ?auto_117743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117736 ) ( not ( = ?auto_117736 ?auto_117737 ) ) ( not ( = ?auto_117736 ?auto_117738 ) ) ( not ( = ?auto_117736 ?auto_117739 ) ) ( not ( = ?auto_117736 ?auto_117740 ) ) ( not ( = ?auto_117736 ?auto_117741 ) ) ( not ( = ?auto_117736 ?auto_117742 ) ) ( not ( = ?auto_117737 ?auto_117738 ) ) ( not ( = ?auto_117737 ?auto_117739 ) ) ( not ( = ?auto_117737 ?auto_117740 ) ) ( not ( = ?auto_117737 ?auto_117741 ) ) ( not ( = ?auto_117737 ?auto_117742 ) ) ( not ( = ?auto_117738 ?auto_117739 ) ) ( not ( = ?auto_117738 ?auto_117740 ) ) ( not ( = ?auto_117738 ?auto_117741 ) ) ( not ( = ?auto_117738 ?auto_117742 ) ) ( not ( = ?auto_117739 ?auto_117740 ) ) ( not ( = ?auto_117739 ?auto_117741 ) ) ( not ( = ?auto_117739 ?auto_117742 ) ) ( not ( = ?auto_117740 ?auto_117741 ) ) ( not ( = ?auto_117740 ?auto_117742 ) ) ( not ( = ?auto_117741 ?auto_117742 ) ) ( ON ?auto_117742 ?auto_117744 ) ( not ( = ?auto_117736 ?auto_117744 ) ) ( not ( = ?auto_117737 ?auto_117744 ) ) ( not ( = ?auto_117738 ?auto_117744 ) ) ( not ( = ?auto_117739 ?auto_117744 ) ) ( not ( = ?auto_117740 ?auto_117744 ) ) ( not ( = ?auto_117741 ?auto_117744 ) ) ( not ( = ?auto_117742 ?auto_117744 ) ) ( ON ?auto_117741 ?auto_117742 ) ( ON-TABLE ?auto_117743 ) ( ON ?auto_117744 ?auto_117743 ) ( not ( = ?auto_117743 ?auto_117744 ) ) ( not ( = ?auto_117743 ?auto_117742 ) ) ( not ( = ?auto_117743 ?auto_117741 ) ) ( not ( = ?auto_117736 ?auto_117743 ) ) ( not ( = ?auto_117737 ?auto_117743 ) ) ( not ( = ?auto_117738 ?auto_117743 ) ) ( not ( = ?auto_117739 ?auto_117743 ) ) ( not ( = ?auto_117740 ?auto_117743 ) ) ( ON ?auto_117740 ?auto_117741 ) ( ON ?auto_117739 ?auto_117740 ) ( ON ?auto_117738 ?auto_117739 ) ( CLEAR ?auto_117736 ) ( ON ?auto_117737 ?auto_117738 ) ( CLEAR ?auto_117737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117743 ?auto_117744 ?auto_117742 ?auto_117741 ?auto_117740 ?auto_117739 ?auto_117738 )
      ( MAKE-7PILE ?auto_117736 ?auto_117737 ?auto_117738 ?auto_117739 ?auto_117740 ?auto_117741 ?auto_117742 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117745 - BLOCK
      ?auto_117746 - BLOCK
      ?auto_117747 - BLOCK
      ?auto_117748 - BLOCK
      ?auto_117749 - BLOCK
      ?auto_117750 - BLOCK
      ?auto_117751 - BLOCK
    )
    :vars
    (
      ?auto_117753 - BLOCK
      ?auto_117752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117745 ?auto_117746 ) ) ( not ( = ?auto_117745 ?auto_117747 ) ) ( not ( = ?auto_117745 ?auto_117748 ) ) ( not ( = ?auto_117745 ?auto_117749 ) ) ( not ( = ?auto_117745 ?auto_117750 ) ) ( not ( = ?auto_117745 ?auto_117751 ) ) ( not ( = ?auto_117746 ?auto_117747 ) ) ( not ( = ?auto_117746 ?auto_117748 ) ) ( not ( = ?auto_117746 ?auto_117749 ) ) ( not ( = ?auto_117746 ?auto_117750 ) ) ( not ( = ?auto_117746 ?auto_117751 ) ) ( not ( = ?auto_117747 ?auto_117748 ) ) ( not ( = ?auto_117747 ?auto_117749 ) ) ( not ( = ?auto_117747 ?auto_117750 ) ) ( not ( = ?auto_117747 ?auto_117751 ) ) ( not ( = ?auto_117748 ?auto_117749 ) ) ( not ( = ?auto_117748 ?auto_117750 ) ) ( not ( = ?auto_117748 ?auto_117751 ) ) ( not ( = ?auto_117749 ?auto_117750 ) ) ( not ( = ?auto_117749 ?auto_117751 ) ) ( not ( = ?auto_117750 ?auto_117751 ) ) ( ON ?auto_117751 ?auto_117753 ) ( not ( = ?auto_117745 ?auto_117753 ) ) ( not ( = ?auto_117746 ?auto_117753 ) ) ( not ( = ?auto_117747 ?auto_117753 ) ) ( not ( = ?auto_117748 ?auto_117753 ) ) ( not ( = ?auto_117749 ?auto_117753 ) ) ( not ( = ?auto_117750 ?auto_117753 ) ) ( not ( = ?auto_117751 ?auto_117753 ) ) ( ON ?auto_117750 ?auto_117751 ) ( ON-TABLE ?auto_117752 ) ( ON ?auto_117753 ?auto_117752 ) ( not ( = ?auto_117752 ?auto_117753 ) ) ( not ( = ?auto_117752 ?auto_117751 ) ) ( not ( = ?auto_117752 ?auto_117750 ) ) ( not ( = ?auto_117745 ?auto_117752 ) ) ( not ( = ?auto_117746 ?auto_117752 ) ) ( not ( = ?auto_117747 ?auto_117752 ) ) ( not ( = ?auto_117748 ?auto_117752 ) ) ( not ( = ?auto_117749 ?auto_117752 ) ) ( ON ?auto_117749 ?auto_117750 ) ( ON ?auto_117748 ?auto_117749 ) ( ON ?auto_117747 ?auto_117748 ) ( ON ?auto_117746 ?auto_117747 ) ( CLEAR ?auto_117746 ) ( HOLDING ?auto_117745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117745 )
      ( MAKE-7PILE ?auto_117745 ?auto_117746 ?auto_117747 ?auto_117748 ?auto_117749 ?auto_117750 ?auto_117751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117754 - BLOCK
      ?auto_117755 - BLOCK
      ?auto_117756 - BLOCK
      ?auto_117757 - BLOCK
      ?auto_117758 - BLOCK
      ?auto_117759 - BLOCK
      ?auto_117760 - BLOCK
    )
    :vars
    (
      ?auto_117762 - BLOCK
      ?auto_117761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_117754 ?auto_117755 ) ) ( not ( = ?auto_117754 ?auto_117756 ) ) ( not ( = ?auto_117754 ?auto_117757 ) ) ( not ( = ?auto_117754 ?auto_117758 ) ) ( not ( = ?auto_117754 ?auto_117759 ) ) ( not ( = ?auto_117754 ?auto_117760 ) ) ( not ( = ?auto_117755 ?auto_117756 ) ) ( not ( = ?auto_117755 ?auto_117757 ) ) ( not ( = ?auto_117755 ?auto_117758 ) ) ( not ( = ?auto_117755 ?auto_117759 ) ) ( not ( = ?auto_117755 ?auto_117760 ) ) ( not ( = ?auto_117756 ?auto_117757 ) ) ( not ( = ?auto_117756 ?auto_117758 ) ) ( not ( = ?auto_117756 ?auto_117759 ) ) ( not ( = ?auto_117756 ?auto_117760 ) ) ( not ( = ?auto_117757 ?auto_117758 ) ) ( not ( = ?auto_117757 ?auto_117759 ) ) ( not ( = ?auto_117757 ?auto_117760 ) ) ( not ( = ?auto_117758 ?auto_117759 ) ) ( not ( = ?auto_117758 ?auto_117760 ) ) ( not ( = ?auto_117759 ?auto_117760 ) ) ( ON ?auto_117760 ?auto_117762 ) ( not ( = ?auto_117754 ?auto_117762 ) ) ( not ( = ?auto_117755 ?auto_117762 ) ) ( not ( = ?auto_117756 ?auto_117762 ) ) ( not ( = ?auto_117757 ?auto_117762 ) ) ( not ( = ?auto_117758 ?auto_117762 ) ) ( not ( = ?auto_117759 ?auto_117762 ) ) ( not ( = ?auto_117760 ?auto_117762 ) ) ( ON ?auto_117759 ?auto_117760 ) ( ON-TABLE ?auto_117761 ) ( ON ?auto_117762 ?auto_117761 ) ( not ( = ?auto_117761 ?auto_117762 ) ) ( not ( = ?auto_117761 ?auto_117760 ) ) ( not ( = ?auto_117761 ?auto_117759 ) ) ( not ( = ?auto_117754 ?auto_117761 ) ) ( not ( = ?auto_117755 ?auto_117761 ) ) ( not ( = ?auto_117756 ?auto_117761 ) ) ( not ( = ?auto_117757 ?auto_117761 ) ) ( not ( = ?auto_117758 ?auto_117761 ) ) ( ON ?auto_117758 ?auto_117759 ) ( ON ?auto_117757 ?auto_117758 ) ( ON ?auto_117756 ?auto_117757 ) ( ON ?auto_117755 ?auto_117756 ) ( ON ?auto_117754 ?auto_117755 ) ( CLEAR ?auto_117754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117761 ?auto_117762 ?auto_117760 ?auto_117759 ?auto_117758 ?auto_117757 ?auto_117756 ?auto_117755 )
      ( MAKE-7PILE ?auto_117754 ?auto_117755 ?auto_117756 ?auto_117757 ?auto_117758 ?auto_117759 ?auto_117760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117764 - BLOCK
    )
    :vars
    (
      ?auto_117765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117765 ?auto_117764 ) ( CLEAR ?auto_117765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117764 ) ( not ( = ?auto_117764 ?auto_117765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117765 ?auto_117764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117766 - BLOCK
    )
    :vars
    (
      ?auto_117767 - BLOCK
      ?auto_117768 - BLOCK
      ?auto_117769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117767 ?auto_117766 ) ( CLEAR ?auto_117767 ) ( ON-TABLE ?auto_117766 ) ( not ( = ?auto_117766 ?auto_117767 ) ) ( HOLDING ?auto_117768 ) ( CLEAR ?auto_117769 ) ( not ( = ?auto_117766 ?auto_117768 ) ) ( not ( = ?auto_117766 ?auto_117769 ) ) ( not ( = ?auto_117767 ?auto_117768 ) ) ( not ( = ?auto_117767 ?auto_117769 ) ) ( not ( = ?auto_117768 ?auto_117769 ) ) )
    :subtasks
    ( ( !STACK ?auto_117768 ?auto_117769 )
      ( MAKE-1PILE ?auto_117766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117770 - BLOCK
    )
    :vars
    (
      ?auto_117773 - BLOCK
      ?auto_117771 - BLOCK
      ?auto_117772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117773 ?auto_117770 ) ( ON-TABLE ?auto_117770 ) ( not ( = ?auto_117770 ?auto_117773 ) ) ( CLEAR ?auto_117771 ) ( not ( = ?auto_117770 ?auto_117772 ) ) ( not ( = ?auto_117770 ?auto_117771 ) ) ( not ( = ?auto_117773 ?auto_117772 ) ) ( not ( = ?auto_117773 ?auto_117771 ) ) ( not ( = ?auto_117772 ?auto_117771 ) ) ( ON ?auto_117772 ?auto_117773 ) ( CLEAR ?auto_117772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117770 ?auto_117773 )
      ( MAKE-1PILE ?auto_117770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117774 - BLOCK
    )
    :vars
    (
      ?auto_117777 - BLOCK
      ?auto_117775 - BLOCK
      ?auto_117776 - BLOCK
      ?auto_117778 - BLOCK
      ?auto_117779 - BLOCK
      ?auto_117780 - BLOCK
      ?auto_117781 - BLOCK
      ?auto_117782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117777 ?auto_117774 ) ( ON-TABLE ?auto_117774 ) ( not ( = ?auto_117774 ?auto_117777 ) ) ( not ( = ?auto_117774 ?auto_117775 ) ) ( not ( = ?auto_117774 ?auto_117776 ) ) ( not ( = ?auto_117777 ?auto_117775 ) ) ( not ( = ?auto_117777 ?auto_117776 ) ) ( not ( = ?auto_117775 ?auto_117776 ) ) ( ON ?auto_117775 ?auto_117777 ) ( CLEAR ?auto_117775 ) ( HOLDING ?auto_117776 ) ( CLEAR ?auto_117778 ) ( ON-TABLE ?auto_117779 ) ( ON ?auto_117780 ?auto_117779 ) ( ON ?auto_117781 ?auto_117780 ) ( ON ?auto_117782 ?auto_117781 ) ( ON ?auto_117778 ?auto_117782 ) ( not ( = ?auto_117779 ?auto_117780 ) ) ( not ( = ?auto_117779 ?auto_117781 ) ) ( not ( = ?auto_117779 ?auto_117782 ) ) ( not ( = ?auto_117779 ?auto_117778 ) ) ( not ( = ?auto_117779 ?auto_117776 ) ) ( not ( = ?auto_117780 ?auto_117781 ) ) ( not ( = ?auto_117780 ?auto_117782 ) ) ( not ( = ?auto_117780 ?auto_117778 ) ) ( not ( = ?auto_117780 ?auto_117776 ) ) ( not ( = ?auto_117781 ?auto_117782 ) ) ( not ( = ?auto_117781 ?auto_117778 ) ) ( not ( = ?auto_117781 ?auto_117776 ) ) ( not ( = ?auto_117782 ?auto_117778 ) ) ( not ( = ?auto_117782 ?auto_117776 ) ) ( not ( = ?auto_117778 ?auto_117776 ) ) ( not ( = ?auto_117774 ?auto_117778 ) ) ( not ( = ?auto_117774 ?auto_117779 ) ) ( not ( = ?auto_117774 ?auto_117780 ) ) ( not ( = ?auto_117774 ?auto_117781 ) ) ( not ( = ?auto_117774 ?auto_117782 ) ) ( not ( = ?auto_117777 ?auto_117778 ) ) ( not ( = ?auto_117777 ?auto_117779 ) ) ( not ( = ?auto_117777 ?auto_117780 ) ) ( not ( = ?auto_117777 ?auto_117781 ) ) ( not ( = ?auto_117777 ?auto_117782 ) ) ( not ( = ?auto_117775 ?auto_117778 ) ) ( not ( = ?auto_117775 ?auto_117779 ) ) ( not ( = ?auto_117775 ?auto_117780 ) ) ( not ( = ?auto_117775 ?auto_117781 ) ) ( not ( = ?auto_117775 ?auto_117782 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117779 ?auto_117780 ?auto_117781 ?auto_117782 ?auto_117778 ?auto_117776 )
      ( MAKE-1PILE ?auto_117774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117783 - BLOCK
    )
    :vars
    (
      ?auto_117787 - BLOCK
      ?auto_117790 - BLOCK
      ?auto_117791 - BLOCK
      ?auto_117784 - BLOCK
      ?auto_117785 - BLOCK
      ?auto_117788 - BLOCK
      ?auto_117789 - BLOCK
      ?auto_117786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117787 ?auto_117783 ) ( ON-TABLE ?auto_117783 ) ( not ( = ?auto_117783 ?auto_117787 ) ) ( not ( = ?auto_117783 ?auto_117790 ) ) ( not ( = ?auto_117783 ?auto_117791 ) ) ( not ( = ?auto_117787 ?auto_117790 ) ) ( not ( = ?auto_117787 ?auto_117791 ) ) ( not ( = ?auto_117790 ?auto_117791 ) ) ( ON ?auto_117790 ?auto_117787 ) ( CLEAR ?auto_117784 ) ( ON-TABLE ?auto_117785 ) ( ON ?auto_117788 ?auto_117785 ) ( ON ?auto_117789 ?auto_117788 ) ( ON ?auto_117786 ?auto_117789 ) ( ON ?auto_117784 ?auto_117786 ) ( not ( = ?auto_117785 ?auto_117788 ) ) ( not ( = ?auto_117785 ?auto_117789 ) ) ( not ( = ?auto_117785 ?auto_117786 ) ) ( not ( = ?auto_117785 ?auto_117784 ) ) ( not ( = ?auto_117785 ?auto_117791 ) ) ( not ( = ?auto_117788 ?auto_117789 ) ) ( not ( = ?auto_117788 ?auto_117786 ) ) ( not ( = ?auto_117788 ?auto_117784 ) ) ( not ( = ?auto_117788 ?auto_117791 ) ) ( not ( = ?auto_117789 ?auto_117786 ) ) ( not ( = ?auto_117789 ?auto_117784 ) ) ( not ( = ?auto_117789 ?auto_117791 ) ) ( not ( = ?auto_117786 ?auto_117784 ) ) ( not ( = ?auto_117786 ?auto_117791 ) ) ( not ( = ?auto_117784 ?auto_117791 ) ) ( not ( = ?auto_117783 ?auto_117784 ) ) ( not ( = ?auto_117783 ?auto_117785 ) ) ( not ( = ?auto_117783 ?auto_117788 ) ) ( not ( = ?auto_117783 ?auto_117789 ) ) ( not ( = ?auto_117783 ?auto_117786 ) ) ( not ( = ?auto_117787 ?auto_117784 ) ) ( not ( = ?auto_117787 ?auto_117785 ) ) ( not ( = ?auto_117787 ?auto_117788 ) ) ( not ( = ?auto_117787 ?auto_117789 ) ) ( not ( = ?auto_117787 ?auto_117786 ) ) ( not ( = ?auto_117790 ?auto_117784 ) ) ( not ( = ?auto_117790 ?auto_117785 ) ) ( not ( = ?auto_117790 ?auto_117788 ) ) ( not ( = ?auto_117790 ?auto_117789 ) ) ( not ( = ?auto_117790 ?auto_117786 ) ) ( ON ?auto_117791 ?auto_117790 ) ( CLEAR ?auto_117791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117783 ?auto_117787 ?auto_117790 )
      ( MAKE-1PILE ?auto_117783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117792 - BLOCK
    )
    :vars
    (
      ?auto_117795 - BLOCK
      ?auto_117793 - BLOCK
      ?auto_117799 - BLOCK
      ?auto_117796 - BLOCK
      ?auto_117798 - BLOCK
      ?auto_117800 - BLOCK
      ?auto_117797 - BLOCK
      ?auto_117794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117795 ?auto_117792 ) ( ON-TABLE ?auto_117792 ) ( not ( = ?auto_117792 ?auto_117795 ) ) ( not ( = ?auto_117792 ?auto_117793 ) ) ( not ( = ?auto_117792 ?auto_117799 ) ) ( not ( = ?auto_117795 ?auto_117793 ) ) ( not ( = ?auto_117795 ?auto_117799 ) ) ( not ( = ?auto_117793 ?auto_117799 ) ) ( ON ?auto_117793 ?auto_117795 ) ( ON-TABLE ?auto_117796 ) ( ON ?auto_117798 ?auto_117796 ) ( ON ?auto_117800 ?auto_117798 ) ( ON ?auto_117797 ?auto_117800 ) ( not ( = ?auto_117796 ?auto_117798 ) ) ( not ( = ?auto_117796 ?auto_117800 ) ) ( not ( = ?auto_117796 ?auto_117797 ) ) ( not ( = ?auto_117796 ?auto_117794 ) ) ( not ( = ?auto_117796 ?auto_117799 ) ) ( not ( = ?auto_117798 ?auto_117800 ) ) ( not ( = ?auto_117798 ?auto_117797 ) ) ( not ( = ?auto_117798 ?auto_117794 ) ) ( not ( = ?auto_117798 ?auto_117799 ) ) ( not ( = ?auto_117800 ?auto_117797 ) ) ( not ( = ?auto_117800 ?auto_117794 ) ) ( not ( = ?auto_117800 ?auto_117799 ) ) ( not ( = ?auto_117797 ?auto_117794 ) ) ( not ( = ?auto_117797 ?auto_117799 ) ) ( not ( = ?auto_117794 ?auto_117799 ) ) ( not ( = ?auto_117792 ?auto_117794 ) ) ( not ( = ?auto_117792 ?auto_117796 ) ) ( not ( = ?auto_117792 ?auto_117798 ) ) ( not ( = ?auto_117792 ?auto_117800 ) ) ( not ( = ?auto_117792 ?auto_117797 ) ) ( not ( = ?auto_117795 ?auto_117794 ) ) ( not ( = ?auto_117795 ?auto_117796 ) ) ( not ( = ?auto_117795 ?auto_117798 ) ) ( not ( = ?auto_117795 ?auto_117800 ) ) ( not ( = ?auto_117795 ?auto_117797 ) ) ( not ( = ?auto_117793 ?auto_117794 ) ) ( not ( = ?auto_117793 ?auto_117796 ) ) ( not ( = ?auto_117793 ?auto_117798 ) ) ( not ( = ?auto_117793 ?auto_117800 ) ) ( not ( = ?auto_117793 ?auto_117797 ) ) ( ON ?auto_117799 ?auto_117793 ) ( CLEAR ?auto_117799 ) ( HOLDING ?auto_117794 ) ( CLEAR ?auto_117797 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117796 ?auto_117798 ?auto_117800 ?auto_117797 ?auto_117794 )
      ( MAKE-1PILE ?auto_117792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117801 - BLOCK
    )
    :vars
    (
      ?auto_117808 - BLOCK
      ?auto_117809 - BLOCK
      ?auto_117802 - BLOCK
      ?auto_117806 - BLOCK
      ?auto_117804 - BLOCK
      ?auto_117807 - BLOCK
      ?auto_117803 - BLOCK
      ?auto_117805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117808 ?auto_117801 ) ( ON-TABLE ?auto_117801 ) ( not ( = ?auto_117801 ?auto_117808 ) ) ( not ( = ?auto_117801 ?auto_117809 ) ) ( not ( = ?auto_117801 ?auto_117802 ) ) ( not ( = ?auto_117808 ?auto_117809 ) ) ( not ( = ?auto_117808 ?auto_117802 ) ) ( not ( = ?auto_117809 ?auto_117802 ) ) ( ON ?auto_117809 ?auto_117808 ) ( ON-TABLE ?auto_117806 ) ( ON ?auto_117804 ?auto_117806 ) ( ON ?auto_117807 ?auto_117804 ) ( ON ?auto_117803 ?auto_117807 ) ( not ( = ?auto_117806 ?auto_117804 ) ) ( not ( = ?auto_117806 ?auto_117807 ) ) ( not ( = ?auto_117806 ?auto_117803 ) ) ( not ( = ?auto_117806 ?auto_117805 ) ) ( not ( = ?auto_117806 ?auto_117802 ) ) ( not ( = ?auto_117804 ?auto_117807 ) ) ( not ( = ?auto_117804 ?auto_117803 ) ) ( not ( = ?auto_117804 ?auto_117805 ) ) ( not ( = ?auto_117804 ?auto_117802 ) ) ( not ( = ?auto_117807 ?auto_117803 ) ) ( not ( = ?auto_117807 ?auto_117805 ) ) ( not ( = ?auto_117807 ?auto_117802 ) ) ( not ( = ?auto_117803 ?auto_117805 ) ) ( not ( = ?auto_117803 ?auto_117802 ) ) ( not ( = ?auto_117805 ?auto_117802 ) ) ( not ( = ?auto_117801 ?auto_117805 ) ) ( not ( = ?auto_117801 ?auto_117806 ) ) ( not ( = ?auto_117801 ?auto_117804 ) ) ( not ( = ?auto_117801 ?auto_117807 ) ) ( not ( = ?auto_117801 ?auto_117803 ) ) ( not ( = ?auto_117808 ?auto_117805 ) ) ( not ( = ?auto_117808 ?auto_117806 ) ) ( not ( = ?auto_117808 ?auto_117804 ) ) ( not ( = ?auto_117808 ?auto_117807 ) ) ( not ( = ?auto_117808 ?auto_117803 ) ) ( not ( = ?auto_117809 ?auto_117805 ) ) ( not ( = ?auto_117809 ?auto_117806 ) ) ( not ( = ?auto_117809 ?auto_117804 ) ) ( not ( = ?auto_117809 ?auto_117807 ) ) ( not ( = ?auto_117809 ?auto_117803 ) ) ( ON ?auto_117802 ?auto_117809 ) ( CLEAR ?auto_117803 ) ( ON ?auto_117805 ?auto_117802 ) ( CLEAR ?auto_117805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117801 ?auto_117808 ?auto_117809 ?auto_117802 )
      ( MAKE-1PILE ?auto_117801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117810 - BLOCK
    )
    :vars
    (
      ?auto_117812 - BLOCK
      ?auto_117815 - BLOCK
      ?auto_117817 - BLOCK
      ?auto_117814 - BLOCK
      ?auto_117818 - BLOCK
      ?auto_117816 - BLOCK
      ?auto_117813 - BLOCK
      ?auto_117811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117812 ?auto_117810 ) ( ON-TABLE ?auto_117810 ) ( not ( = ?auto_117810 ?auto_117812 ) ) ( not ( = ?auto_117810 ?auto_117815 ) ) ( not ( = ?auto_117810 ?auto_117817 ) ) ( not ( = ?auto_117812 ?auto_117815 ) ) ( not ( = ?auto_117812 ?auto_117817 ) ) ( not ( = ?auto_117815 ?auto_117817 ) ) ( ON ?auto_117815 ?auto_117812 ) ( ON-TABLE ?auto_117814 ) ( ON ?auto_117818 ?auto_117814 ) ( ON ?auto_117816 ?auto_117818 ) ( not ( = ?auto_117814 ?auto_117818 ) ) ( not ( = ?auto_117814 ?auto_117816 ) ) ( not ( = ?auto_117814 ?auto_117813 ) ) ( not ( = ?auto_117814 ?auto_117811 ) ) ( not ( = ?auto_117814 ?auto_117817 ) ) ( not ( = ?auto_117818 ?auto_117816 ) ) ( not ( = ?auto_117818 ?auto_117813 ) ) ( not ( = ?auto_117818 ?auto_117811 ) ) ( not ( = ?auto_117818 ?auto_117817 ) ) ( not ( = ?auto_117816 ?auto_117813 ) ) ( not ( = ?auto_117816 ?auto_117811 ) ) ( not ( = ?auto_117816 ?auto_117817 ) ) ( not ( = ?auto_117813 ?auto_117811 ) ) ( not ( = ?auto_117813 ?auto_117817 ) ) ( not ( = ?auto_117811 ?auto_117817 ) ) ( not ( = ?auto_117810 ?auto_117811 ) ) ( not ( = ?auto_117810 ?auto_117814 ) ) ( not ( = ?auto_117810 ?auto_117818 ) ) ( not ( = ?auto_117810 ?auto_117816 ) ) ( not ( = ?auto_117810 ?auto_117813 ) ) ( not ( = ?auto_117812 ?auto_117811 ) ) ( not ( = ?auto_117812 ?auto_117814 ) ) ( not ( = ?auto_117812 ?auto_117818 ) ) ( not ( = ?auto_117812 ?auto_117816 ) ) ( not ( = ?auto_117812 ?auto_117813 ) ) ( not ( = ?auto_117815 ?auto_117811 ) ) ( not ( = ?auto_117815 ?auto_117814 ) ) ( not ( = ?auto_117815 ?auto_117818 ) ) ( not ( = ?auto_117815 ?auto_117816 ) ) ( not ( = ?auto_117815 ?auto_117813 ) ) ( ON ?auto_117817 ?auto_117815 ) ( ON ?auto_117811 ?auto_117817 ) ( CLEAR ?auto_117811 ) ( HOLDING ?auto_117813 ) ( CLEAR ?auto_117816 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117814 ?auto_117818 ?auto_117816 ?auto_117813 )
      ( MAKE-1PILE ?auto_117810 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117819 - BLOCK
    )
    :vars
    (
      ?auto_117822 - BLOCK
      ?auto_117820 - BLOCK
      ?auto_117825 - BLOCK
      ?auto_117827 - BLOCK
      ?auto_117826 - BLOCK
      ?auto_117823 - BLOCK
      ?auto_117824 - BLOCK
      ?auto_117821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117822 ?auto_117819 ) ( ON-TABLE ?auto_117819 ) ( not ( = ?auto_117819 ?auto_117822 ) ) ( not ( = ?auto_117819 ?auto_117820 ) ) ( not ( = ?auto_117819 ?auto_117825 ) ) ( not ( = ?auto_117822 ?auto_117820 ) ) ( not ( = ?auto_117822 ?auto_117825 ) ) ( not ( = ?auto_117820 ?auto_117825 ) ) ( ON ?auto_117820 ?auto_117822 ) ( ON-TABLE ?auto_117827 ) ( ON ?auto_117826 ?auto_117827 ) ( ON ?auto_117823 ?auto_117826 ) ( not ( = ?auto_117827 ?auto_117826 ) ) ( not ( = ?auto_117827 ?auto_117823 ) ) ( not ( = ?auto_117827 ?auto_117824 ) ) ( not ( = ?auto_117827 ?auto_117821 ) ) ( not ( = ?auto_117827 ?auto_117825 ) ) ( not ( = ?auto_117826 ?auto_117823 ) ) ( not ( = ?auto_117826 ?auto_117824 ) ) ( not ( = ?auto_117826 ?auto_117821 ) ) ( not ( = ?auto_117826 ?auto_117825 ) ) ( not ( = ?auto_117823 ?auto_117824 ) ) ( not ( = ?auto_117823 ?auto_117821 ) ) ( not ( = ?auto_117823 ?auto_117825 ) ) ( not ( = ?auto_117824 ?auto_117821 ) ) ( not ( = ?auto_117824 ?auto_117825 ) ) ( not ( = ?auto_117821 ?auto_117825 ) ) ( not ( = ?auto_117819 ?auto_117821 ) ) ( not ( = ?auto_117819 ?auto_117827 ) ) ( not ( = ?auto_117819 ?auto_117826 ) ) ( not ( = ?auto_117819 ?auto_117823 ) ) ( not ( = ?auto_117819 ?auto_117824 ) ) ( not ( = ?auto_117822 ?auto_117821 ) ) ( not ( = ?auto_117822 ?auto_117827 ) ) ( not ( = ?auto_117822 ?auto_117826 ) ) ( not ( = ?auto_117822 ?auto_117823 ) ) ( not ( = ?auto_117822 ?auto_117824 ) ) ( not ( = ?auto_117820 ?auto_117821 ) ) ( not ( = ?auto_117820 ?auto_117827 ) ) ( not ( = ?auto_117820 ?auto_117826 ) ) ( not ( = ?auto_117820 ?auto_117823 ) ) ( not ( = ?auto_117820 ?auto_117824 ) ) ( ON ?auto_117825 ?auto_117820 ) ( ON ?auto_117821 ?auto_117825 ) ( CLEAR ?auto_117823 ) ( ON ?auto_117824 ?auto_117821 ) ( CLEAR ?auto_117824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117819 ?auto_117822 ?auto_117820 ?auto_117825 ?auto_117821 )
      ( MAKE-1PILE ?auto_117819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117828 - BLOCK
    )
    :vars
    (
      ?auto_117835 - BLOCK
      ?auto_117836 - BLOCK
      ?auto_117834 - BLOCK
      ?auto_117831 - BLOCK
      ?auto_117832 - BLOCK
      ?auto_117833 - BLOCK
      ?auto_117829 - BLOCK
      ?auto_117830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117835 ?auto_117828 ) ( ON-TABLE ?auto_117828 ) ( not ( = ?auto_117828 ?auto_117835 ) ) ( not ( = ?auto_117828 ?auto_117836 ) ) ( not ( = ?auto_117828 ?auto_117834 ) ) ( not ( = ?auto_117835 ?auto_117836 ) ) ( not ( = ?auto_117835 ?auto_117834 ) ) ( not ( = ?auto_117836 ?auto_117834 ) ) ( ON ?auto_117836 ?auto_117835 ) ( ON-TABLE ?auto_117831 ) ( ON ?auto_117832 ?auto_117831 ) ( not ( = ?auto_117831 ?auto_117832 ) ) ( not ( = ?auto_117831 ?auto_117833 ) ) ( not ( = ?auto_117831 ?auto_117829 ) ) ( not ( = ?auto_117831 ?auto_117830 ) ) ( not ( = ?auto_117831 ?auto_117834 ) ) ( not ( = ?auto_117832 ?auto_117833 ) ) ( not ( = ?auto_117832 ?auto_117829 ) ) ( not ( = ?auto_117832 ?auto_117830 ) ) ( not ( = ?auto_117832 ?auto_117834 ) ) ( not ( = ?auto_117833 ?auto_117829 ) ) ( not ( = ?auto_117833 ?auto_117830 ) ) ( not ( = ?auto_117833 ?auto_117834 ) ) ( not ( = ?auto_117829 ?auto_117830 ) ) ( not ( = ?auto_117829 ?auto_117834 ) ) ( not ( = ?auto_117830 ?auto_117834 ) ) ( not ( = ?auto_117828 ?auto_117830 ) ) ( not ( = ?auto_117828 ?auto_117831 ) ) ( not ( = ?auto_117828 ?auto_117832 ) ) ( not ( = ?auto_117828 ?auto_117833 ) ) ( not ( = ?auto_117828 ?auto_117829 ) ) ( not ( = ?auto_117835 ?auto_117830 ) ) ( not ( = ?auto_117835 ?auto_117831 ) ) ( not ( = ?auto_117835 ?auto_117832 ) ) ( not ( = ?auto_117835 ?auto_117833 ) ) ( not ( = ?auto_117835 ?auto_117829 ) ) ( not ( = ?auto_117836 ?auto_117830 ) ) ( not ( = ?auto_117836 ?auto_117831 ) ) ( not ( = ?auto_117836 ?auto_117832 ) ) ( not ( = ?auto_117836 ?auto_117833 ) ) ( not ( = ?auto_117836 ?auto_117829 ) ) ( ON ?auto_117834 ?auto_117836 ) ( ON ?auto_117830 ?auto_117834 ) ( ON ?auto_117829 ?auto_117830 ) ( CLEAR ?auto_117829 ) ( HOLDING ?auto_117833 ) ( CLEAR ?auto_117832 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117831 ?auto_117832 ?auto_117833 )
      ( MAKE-1PILE ?auto_117828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117837 - BLOCK
    )
    :vars
    (
      ?auto_117845 - BLOCK
      ?auto_117844 - BLOCK
      ?auto_117841 - BLOCK
      ?auto_117840 - BLOCK
      ?auto_117843 - BLOCK
      ?auto_117838 - BLOCK
      ?auto_117842 - BLOCK
      ?auto_117839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117845 ?auto_117837 ) ( ON-TABLE ?auto_117837 ) ( not ( = ?auto_117837 ?auto_117845 ) ) ( not ( = ?auto_117837 ?auto_117844 ) ) ( not ( = ?auto_117837 ?auto_117841 ) ) ( not ( = ?auto_117845 ?auto_117844 ) ) ( not ( = ?auto_117845 ?auto_117841 ) ) ( not ( = ?auto_117844 ?auto_117841 ) ) ( ON ?auto_117844 ?auto_117845 ) ( ON-TABLE ?auto_117840 ) ( ON ?auto_117843 ?auto_117840 ) ( not ( = ?auto_117840 ?auto_117843 ) ) ( not ( = ?auto_117840 ?auto_117838 ) ) ( not ( = ?auto_117840 ?auto_117842 ) ) ( not ( = ?auto_117840 ?auto_117839 ) ) ( not ( = ?auto_117840 ?auto_117841 ) ) ( not ( = ?auto_117843 ?auto_117838 ) ) ( not ( = ?auto_117843 ?auto_117842 ) ) ( not ( = ?auto_117843 ?auto_117839 ) ) ( not ( = ?auto_117843 ?auto_117841 ) ) ( not ( = ?auto_117838 ?auto_117842 ) ) ( not ( = ?auto_117838 ?auto_117839 ) ) ( not ( = ?auto_117838 ?auto_117841 ) ) ( not ( = ?auto_117842 ?auto_117839 ) ) ( not ( = ?auto_117842 ?auto_117841 ) ) ( not ( = ?auto_117839 ?auto_117841 ) ) ( not ( = ?auto_117837 ?auto_117839 ) ) ( not ( = ?auto_117837 ?auto_117840 ) ) ( not ( = ?auto_117837 ?auto_117843 ) ) ( not ( = ?auto_117837 ?auto_117838 ) ) ( not ( = ?auto_117837 ?auto_117842 ) ) ( not ( = ?auto_117845 ?auto_117839 ) ) ( not ( = ?auto_117845 ?auto_117840 ) ) ( not ( = ?auto_117845 ?auto_117843 ) ) ( not ( = ?auto_117845 ?auto_117838 ) ) ( not ( = ?auto_117845 ?auto_117842 ) ) ( not ( = ?auto_117844 ?auto_117839 ) ) ( not ( = ?auto_117844 ?auto_117840 ) ) ( not ( = ?auto_117844 ?auto_117843 ) ) ( not ( = ?auto_117844 ?auto_117838 ) ) ( not ( = ?auto_117844 ?auto_117842 ) ) ( ON ?auto_117841 ?auto_117844 ) ( ON ?auto_117839 ?auto_117841 ) ( ON ?auto_117842 ?auto_117839 ) ( CLEAR ?auto_117843 ) ( ON ?auto_117838 ?auto_117842 ) ( CLEAR ?auto_117838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117837 ?auto_117845 ?auto_117844 ?auto_117841 ?auto_117839 ?auto_117842 )
      ( MAKE-1PILE ?auto_117837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117846 - BLOCK
    )
    :vars
    (
      ?auto_117854 - BLOCK
      ?auto_117847 - BLOCK
      ?auto_117850 - BLOCK
      ?auto_117853 - BLOCK
      ?auto_117852 - BLOCK
      ?auto_117851 - BLOCK
      ?auto_117849 - BLOCK
      ?auto_117848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117854 ?auto_117846 ) ( ON-TABLE ?auto_117846 ) ( not ( = ?auto_117846 ?auto_117854 ) ) ( not ( = ?auto_117846 ?auto_117847 ) ) ( not ( = ?auto_117846 ?auto_117850 ) ) ( not ( = ?auto_117854 ?auto_117847 ) ) ( not ( = ?auto_117854 ?auto_117850 ) ) ( not ( = ?auto_117847 ?auto_117850 ) ) ( ON ?auto_117847 ?auto_117854 ) ( ON-TABLE ?auto_117853 ) ( not ( = ?auto_117853 ?auto_117852 ) ) ( not ( = ?auto_117853 ?auto_117851 ) ) ( not ( = ?auto_117853 ?auto_117849 ) ) ( not ( = ?auto_117853 ?auto_117848 ) ) ( not ( = ?auto_117853 ?auto_117850 ) ) ( not ( = ?auto_117852 ?auto_117851 ) ) ( not ( = ?auto_117852 ?auto_117849 ) ) ( not ( = ?auto_117852 ?auto_117848 ) ) ( not ( = ?auto_117852 ?auto_117850 ) ) ( not ( = ?auto_117851 ?auto_117849 ) ) ( not ( = ?auto_117851 ?auto_117848 ) ) ( not ( = ?auto_117851 ?auto_117850 ) ) ( not ( = ?auto_117849 ?auto_117848 ) ) ( not ( = ?auto_117849 ?auto_117850 ) ) ( not ( = ?auto_117848 ?auto_117850 ) ) ( not ( = ?auto_117846 ?auto_117848 ) ) ( not ( = ?auto_117846 ?auto_117853 ) ) ( not ( = ?auto_117846 ?auto_117852 ) ) ( not ( = ?auto_117846 ?auto_117851 ) ) ( not ( = ?auto_117846 ?auto_117849 ) ) ( not ( = ?auto_117854 ?auto_117848 ) ) ( not ( = ?auto_117854 ?auto_117853 ) ) ( not ( = ?auto_117854 ?auto_117852 ) ) ( not ( = ?auto_117854 ?auto_117851 ) ) ( not ( = ?auto_117854 ?auto_117849 ) ) ( not ( = ?auto_117847 ?auto_117848 ) ) ( not ( = ?auto_117847 ?auto_117853 ) ) ( not ( = ?auto_117847 ?auto_117852 ) ) ( not ( = ?auto_117847 ?auto_117851 ) ) ( not ( = ?auto_117847 ?auto_117849 ) ) ( ON ?auto_117850 ?auto_117847 ) ( ON ?auto_117848 ?auto_117850 ) ( ON ?auto_117849 ?auto_117848 ) ( ON ?auto_117851 ?auto_117849 ) ( CLEAR ?auto_117851 ) ( HOLDING ?auto_117852 ) ( CLEAR ?auto_117853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117853 ?auto_117852 )
      ( MAKE-1PILE ?auto_117846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120025 - BLOCK
    )
    :vars
    (
      ?auto_120031 - BLOCK
      ?auto_120027 - BLOCK
      ?auto_120028 - BLOCK
      ?auto_120026 - BLOCK
      ?auto_120030 - BLOCK
      ?auto_120032 - BLOCK
      ?auto_120029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120031 ?auto_120025 ) ( ON-TABLE ?auto_120025 ) ( not ( = ?auto_120025 ?auto_120031 ) ) ( not ( = ?auto_120025 ?auto_120027 ) ) ( not ( = ?auto_120025 ?auto_120028 ) ) ( not ( = ?auto_120031 ?auto_120027 ) ) ( not ( = ?auto_120031 ?auto_120028 ) ) ( not ( = ?auto_120027 ?auto_120028 ) ) ( ON ?auto_120027 ?auto_120031 ) ( not ( = ?auto_120026 ?auto_120030 ) ) ( not ( = ?auto_120026 ?auto_120032 ) ) ( not ( = ?auto_120026 ?auto_120029 ) ) ( not ( = ?auto_120026 ?auto_120028 ) ) ( not ( = ?auto_120030 ?auto_120032 ) ) ( not ( = ?auto_120030 ?auto_120029 ) ) ( not ( = ?auto_120030 ?auto_120028 ) ) ( not ( = ?auto_120032 ?auto_120029 ) ) ( not ( = ?auto_120032 ?auto_120028 ) ) ( not ( = ?auto_120029 ?auto_120028 ) ) ( not ( = ?auto_120025 ?auto_120029 ) ) ( not ( = ?auto_120025 ?auto_120026 ) ) ( not ( = ?auto_120025 ?auto_120030 ) ) ( not ( = ?auto_120025 ?auto_120032 ) ) ( not ( = ?auto_120031 ?auto_120029 ) ) ( not ( = ?auto_120031 ?auto_120026 ) ) ( not ( = ?auto_120031 ?auto_120030 ) ) ( not ( = ?auto_120031 ?auto_120032 ) ) ( not ( = ?auto_120027 ?auto_120029 ) ) ( not ( = ?auto_120027 ?auto_120026 ) ) ( not ( = ?auto_120027 ?auto_120030 ) ) ( not ( = ?auto_120027 ?auto_120032 ) ) ( ON ?auto_120028 ?auto_120027 ) ( ON ?auto_120029 ?auto_120028 ) ( ON ?auto_120032 ?auto_120029 ) ( ON ?auto_120030 ?auto_120032 ) ( ON ?auto_120026 ?auto_120030 ) ( CLEAR ?auto_120026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120025 ?auto_120031 ?auto_120027 ?auto_120028 ?auto_120029 ?auto_120032 ?auto_120030 )
      ( MAKE-1PILE ?auto_120025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117864 - BLOCK
    )
    :vars
    (
      ?auto_117867 - BLOCK
      ?auto_117865 - BLOCK
      ?auto_117869 - BLOCK
      ?auto_117871 - BLOCK
      ?auto_117866 - BLOCK
      ?auto_117868 - BLOCK
      ?auto_117870 - BLOCK
      ?auto_117872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117867 ?auto_117864 ) ( ON-TABLE ?auto_117864 ) ( not ( = ?auto_117864 ?auto_117867 ) ) ( not ( = ?auto_117864 ?auto_117865 ) ) ( not ( = ?auto_117864 ?auto_117869 ) ) ( not ( = ?auto_117867 ?auto_117865 ) ) ( not ( = ?auto_117867 ?auto_117869 ) ) ( not ( = ?auto_117865 ?auto_117869 ) ) ( ON ?auto_117865 ?auto_117867 ) ( not ( = ?auto_117871 ?auto_117866 ) ) ( not ( = ?auto_117871 ?auto_117868 ) ) ( not ( = ?auto_117871 ?auto_117870 ) ) ( not ( = ?auto_117871 ?auto_117872 ) ) ( not ( = ?auto_117871 ?auto_117869 ) ) ( not ( = ?auto_117866 ?auto_117868 ) ) ( not ( = ?auto_117866 ?auto_117870 ) ) ( not ( = ?auto_117866 ?auto_117872 ) ) ( not ( = ?auto_117866 ?auto_117869 ) ) ( not ( = ?auto_117868 ?auto_117870 ) ) ( not ( = ?auto_117868 ?auto_117872 ) ) ( not ( = ?auto_117868 ?auto_117869 ) ) ( not ( = ?auto_117870 ?auto_117872 ) ) ( not ( = ?auto_117870 ?auto_117869 ) ) ( not ( = ?auto_117872 ?auto_117869 ) ) ( not ( = ?auto_117864 ?auto_117872 ) ) ( not ( = ?auto_117864 ?auto_117871 ) ) ( not ( = ?auto_117864 ?auto_117866 ) ) ( not ( = ?auto_117864 ?auto_117868 ) ) ( not ( = ?auto_117864 ?auto_117870 ) ) ( not ( = ?auto_117867 ?auto_117872 ) ) ( not ( = ?auto_117867 ?auto_117871 ) ) ( not ( = ?auto_117867 ?auto_117866 ) ) ( not ( = ?auto_117867 ?auto_117868 ) ) ( not ( = ?auto_117867 ?auto_117870 ) ) ( not ( = ?auto_117865 ?auto_117872 ) ) ( not ( = ?auto_117865 ?auto_117871 ) ) ( not ( = ?auto_117865 ?auto_117866 ) ) ( not ( = ?auto_117865 ?auto_117868 ) ) ( not ( = ?auto_117865 ?auto_117870 ) ) ( ON ?auto_117869 ?auto_117865 ) ( ON ?auto_117872 ?auto_117869 ) ( ON ?auto_117870 ?auto_117872 ) ( ON ?auto_117868 ?auto_117870 ) ( ON ?auto_117866 ?auto_117868 ) ( CLEAR ?auto_117866 ) ( HOLDING ?auto_117871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117871 )
      ( MAKE-1PILE ?auto_117864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117873 - BLOCK
    )
    :vars
    (
      ?auto_117877 - BLOCK
      ?auto_117875 - BLOCK
      ?auto_117879 - BLOCK
      ?auto_117880 - BLOCK
      ?auto_117876 - BLOCK
      ?auto_117874 - BLOCK
      ?auto_117878 - BLOCK
      ?auto_117881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117877 ?auto_117873 ) ( ON-TABLE ?auto_117873 ) ( not ( = ?auto_117873 ?auto_117877 ) ) ( not ( = ?auto_117873 ?auto_117875 ) ) ( not ( = ?auto_117873 ?auto_117879 ) ) ( not ( = ?auto_117877 ?auto_117875 ) ) ( not ( = ?auto_117877 ?auto_117879 ) ) ( not ( = ?auto_117875 ?auto_117879 ) ) ( ON ?auto_117875 ?auto_117877 ) ( not ( = ?auto_117880 ?auto_117876 ) ) ( not ( = ?auto_117880 ?auto_117874 ) ) ( not ( = ?auto_117880 ?auto_117878 ) ) ( not ( = ?auto_117880 ?auto_117881 ) ) ( not ( = ?auto_117880 ?auto_117879 ) ) ( not ( = ?auto_117876 ?auto_117874 ) ) ( not ( = ?auto_117876 ?auto_117878 ) ) ( not ( = ?auto_117876 ?auto_117881 ) ) ( not ( = ?auto_117876 ?auto_117879 ) ) ( not ( = ?auto_117874 ?auto_117878 ) ) ( not ( = ?auto_117874 ?auto_117881 ) ) ( not ( = ?auto_117874 ?auto_117879 ) ) ( not ( = ?auto_117878 ?auto_117881 ) ) ( not ( = ?auto_117878 ?auto_117879 ) ) ( not ( = ?auto_117881 ?auto_117879 ) ) ( not ( = ?auto_117873 ?auto_117881 ) ) ( not ( = ?auto_117873 ?auto_117880 ) ) ( not ( = ?auto_117873 ?auto_117876 ) ) ( not ( = ?auto_117873 ?auto_117874 ) ) ( not ( = ?auto_117873 ?auto_117878 ) ) ( not ( = ?auto_117877 ?auto_117881 ) ) ( not ( = ?auto_117877 ?auto_117880 ) ) ( not ( = ?auto_117877 ?auto_117876 ) ) ( not ( = ?auto_117877 ?auto_117874 ) ) ( not ( = ?auto_117877 ?auto_117878 ) ) ( not ( = ?auto_117875 ?auto_117881 ) ) ( not ( = ?auto_117875 ?auto_117880 ) ) ( not ( = ?auto_117875 ?auto_117876 ) ) ( not ( = ?auto_117875 ?auto_117874 ) ) ( not ( = ?auto_117875 ?auto_117878 ) ) ( ON ?auto_117879 ?auto_117875 ) ( ON ?auto_117881 ?auto_117879 ) ( ON ?auto_117878 ?auto_117881 ) ( ON ?auto_117874 ?auto_117878 ) ( ON ?auto_117876 ?auto_117874 ) ( ON ?auto_117880 ?auto_117876 ) ( CLEAR ?auto_117880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_117873 ?auto_117877 ?auto_117875 ?auto_117879 ?auto_117881 ?auto_117878 ?auto_117874 ?auto_117876 )
      ( MAKE-1PILE ?auto_117873 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117890 - BLOCK
      ?auto_117891 - BLOCK
      ?auto_117892 - BLOCK
      ?auto_117893 - BLOCK
      ?auto_117894 - BLOCK
      ?auto_117895 - BLOCK
      ?auto_117896 - BLOCK
      ?auto_117897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_117897 ) ( CLEAR ?auto_117896 ) ( ON-TABLE ?auto_117890 ) ( ON ?auto_117891 ?auto_117890 ) ( ON ?auto_117892 ?auto_117891 ) ( ON ?auto_117893 ?auto_117892 ) ( ON ?auto_117894 ?auto_117893 ) ( ON ?auto_117895 ?auto_117894 ) ( ON ?auto_117896 ?auto_117895 ) ( not ( = ?auto_117890 ?auto_117891 ) ) ( not ( = ?auto_117890 ?auto_117892 ) ) ( not ( = ?auto_117890 ?auto_117893 ) ) ( not ( = ?auto_117890 ?auto_117894 ) ) ( not ( = ?auto_117890 ?auto_117895 ) ) ( not ( = ?auto_117890 ?auto_117896 ) ) ( not ( = ?auto_117890 ?auto_117897 ) ) ( not ( = ?auto_117891 ?auto_117892 ) ) ( not ( = ?auto_117891 ?auto_117893 ) ) ( not ( = ?auto_117891 ?auto_117894 ) ) ( not ( = ?auto_117891 ?auto_117895 ) ) ( not ( = ?auto_117891 ?auto_117896 ) ) ( not ( = ?auto_117891 ?auto_117897 ) ) ( not ( = ?auto_117892 ?auto_117893 ) ) ( not ( = ?auto_117892 ?auto_117894 ) ) ( not ( = ?auto_117892 ?auto_117895 ) ) ( not ( = ?auto_117892 ?auto_117896 ) ) ( not ( = ?auto_117892 ?auto_117897 ) ) ( not ( = ?auto_117893 ?auto_117894 ) ) ( not ( = ?auto_117893 ?auto_117895 ) ) ( not ( = ?auto_117893 ?auto_117896 ) ) ( not ( = ?auto_117893 ?auto_117897 ) ) ( not ( = ?auto_117894 ?auto_117895 ) ) ( not ( = ?auto_117894 ?auto_117896 ) ) ( not ( = ?auto_117894 ?auto_117897 ) ) ( not ( = ?auto_117895 ?auto_117896 ) ) ( not ( = ?auto_117895 ?auto_117897 ) ) ( not ( = ?auto_117896 ?auto_117897 ) ) )
    :subtasks
    ( ( !STACK ?auto_117897 ?auto_117896 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117898 - BLOCK
      ?auto_117899 - BLOCK
      ?auto_117900 - BLOCK
      ?auto_117901 - BLOCK
      ?auto_117902 - BLOCK
      ?auto_117903 - BLOCK
      ?auto_117904 - BLOCK
      ?auto_117905 - BLOCK
    )
    :vars
    (
      ?auto_117906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117904 ) ( ON-TABLE ?auto_117898 ) ( ON ?auto_117899 ?auto_117898 ) ( ON ?auto_117900 ?auto_117899 ) ( ON ?auto_117901 ?auto_117900 ) ( ON ?auto_117902 ?auto_117901 ) ( ON ?auto_117903 ?auto_117902 ) ( ON ?auto_117904 ?auto_117903 ) ( not ( = ?auto_117898 ?auto_117899 ) ) ( not ( = ?auto_117898 ?auto_117900 ) ) ( not ( = ?auto_117898 ?auto_117901 ) ) ( not ( = ?auto_117898 ?auto_117902 ) ) ( not ( = ?auto_117898 ?auto_117903 ) ) ( not ( = ?auto_117898 ?auto_117904 ) ) ( not ( = ?auto_117898 ?auto_117905 ) ) ( not ( = ?auto_117899 ?auto_117900 ) ) ( not ( = ?auto_117899 ?auto_117901 ) ) ( not ( = ?auto_117899 ?auto_117902 ) ) ( not ( = ?auto_117899 ?auto_117903 ) ) ( not ( = ?auto_117899 ?auto_117904 ) ) ( not ( = ?auto_117899 ?auto_117905 ) ) ( not ( = ?auto_117900 ?auto_117901 ) ) ( not ( = ?auto_117900 ?auto_117902 ) ) ( not ( = ?auto_117900 ?auto_117903 ) ) ( not ( = ?auto_117900 ?auto_117904 ) ) ( not ( = ?auto_117900 ?auto_117905 ) ) ( not ( = ?auto_117901 ?auto_117902 ) ) ( not ( = ?auto_117901 ?auto_117903 ) ) ( not ( = ?auto_117901 ?auto_117904 ) ) ( not ( = ?auto_117901 ?auto_117905 ) ) ( not ( = ?auto_117902 ?auto_117903 ) ) ( not ( = ?auto_117902 ?auto_117904 ) ) ( not ( = ?auto_117902 ?auto_117905 ) ) ( not ( = ?auto_117903 ?auto_117904 ) ) ( not ( = ?auto_117903 ?auto_117905 ) ) ( not ( = ?auto_117904 ?auto_117905 ) ) ( ON ?auto_117905 ?auto_117906 ) ( CLEAR ?auto_117905 ) ( HAND-EMPTY ) ( not ( = ?auto_117898 ?auto_117906 ) ) ( not ( = ?auto_117899 ?auto_117906 ) ) ( not ( = ?auto_117900 ?auto_117906 ) ) ( not ( = ?auto_117901 ?auto_117906 ) ) ( not ( = ?auto_117902 ?auto_117906 ) ) ( not ( = ?auto_117903 ?auto_117906 ) ) ( not ( = ?auto_117904 ?auto_117906 ) ) ( not ( = ?auto_117905 ?auto_117906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117905 ?auto_117906 )
      ( MAKE-8PILE ?auto_117898 ?auto_117899 ?auto_117900 ?auto_117901 ?auto_117902 ?auto_117903 ?auto_117904 ?auto_117905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117907 - BLOCK
      ?auto_117908 - BLOCK
      ?auto_117909 - BLOCK
      ?auto_117910 - BLOCK
      ?auto_117911 - BLOCK
      ?auto_117912 - BLOCK
      ?auto_117913 - BLOCK
      ?auto_117914 - BLOCK
    )
    :vars
    (
      ?auto_117915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117907 ) ( ON ?auto_117908 ?auto_117907 ) ( ON ?auto_117909 ?auto_117908 ) ( ON ?auto_117910 ?auto_117909 ) ( ON ?auto_117911 ?auto_117910 ) ( ON ?auto_117912 ?auto_117911 ) ( not ( = ?auto_117907 ?auto_117908 ) ) ( not ( = ?auto_117907 ?auto_117909 ) ) ( not ( = ?auto_117907 ?auto_117910 ) ) ( not ( = ?auto_117907 ?auto_117911 ) ) ( not ( = ?auto_117907 ?auto_117912 ) ) ( not ( = ?auto_117907 ?auto_117913 ) ) ( not ( = ?auto_117907 ?auto_117914 ) ) ( not ( = ?auto_117908 ?auto_117909 ) ) ( not ( = ?auto_117908 ?auto_117910 ) ) ( not ( = ?auto_117908 ?auto_117911 ) ) ( not ( = ?auto_117908 ?auto_117912 ) ) ( not ( = ?auto_117908 ?auto_117913 ) ) ( not ( = ?auto_117908 ?auto_117914 ) ) ( not ( = ?auto_117909 ?auto_117910 ) ) ( not ( = ?auto_117909 ?auto_117911 ) ) ( not ( = ?auto_117909 ?auto_117912 ) ) ( not ( = ?auto_117909 ?auto_117913 ) ) ( not ( = ?auto_117909 ?auto_117914 ) ) ( not ( = ?auto_117910 ?auto_117911 ) ) ( not ( = ?auto_117910 ?auto_117912 ) ) ( not ( = ?auto_117910 ?auto_117913 ) ) ( not ( = ?auto_117910 ?auto_117914 ) ) ( not ( = ?auto_117911 ?auto_117912 ) ) ( not ( = ?auto_117911 ?auto_117913 ) ) ( not ( = ?auto_117911 ?auto_117914 ) ) ( not ( = ?auto_117912 ?auto_117913 ) ) ( not ( = ?auto_117912 ?auto_117914 ) ) ( not ( = ?auto_117913 ?auto_117914 ) ) ( ON ?auto_117914 ?auto_117915 ) ( CLEAR ?auto_117914 ) ( not ( = ?auto_117907 ?auto_117915 ) ) ( not ( = ?auto_117908 ?auto_117915 ) ) ( not ( = ?auto_117909 ?auto_117915 ) ) ( not ( = ?auto_117910 ?auto_117915 ) ) ( not ( = ?auto_117911 ?auto_117915 ) ) ( not ( = ?auto_117912 ?auto_117915 ) ) ( not ( = ?auto_117913 ?auto_117915 ) ) ( not ( = ?auto_117914 ?auto_117915 ) ) ( HOLDING ?auto_117913 ) ( CLEAR ?auto_117912 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_117907 ?auto_117908 ?auto_117909 ?auto_117910 ?auto_117911 ?auto_117912 ?auto_117913 )
      ( MAKE-8PILE ?auto_117907 ?auto_117908 ?auto_117909 ?auto_117910 ?auto_117911 ?auto_117912 ?auto_117913 ?auto_117914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117916 - BLOCK
      ?auto_117917 - BLOCK
      ?auto_117918 - BLOCK
      ?auto_117919 - BLOCK
      ?auto_117920 - BLOCK
      ?auto_117921 - BLOCK
      ?auto_117922 - BLOCK
      ?auto_117923 - BLOCK
    )
    :vars
    (
      ?auto_117924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117916 ) ( ON ?auto_117917 ?auto_117916 ) ( ON ?auto_117918 ?auto_117917 ) ( ON ?auto_117919 ?auto_117918 ) ( ON ?auto_117920 ?auto_117919 ) ( ON ?auto_117921 ?auto_117920 ) ( not ( = ?auto_117916 ?auto_117917 ) ) ( not ( = ?auto_117916 ?auto_117918 ) ) ( not ( = ?auto_117916 ?auto_117919 ) ) ( not ( = ?auto_117916 ?auto_117920 ) ) ( not ( = ?auto_117916 ?auto_117921 ) ) ( not ( = ?auto_117916 ?auto_117922 ) ) ( not ( = ?auto_117916 ?auto_117923 ) ) ( not ( = ?auto_117917 ?auto_117918 ) ) ( not ( = ?auto_117917 ?auto_117919 ) ) ( not ( = ?auto_117917 ?auto_117920 ) ) ( not ( = ?auto_117917 ?auto_117921 ) ) ( not ( = ?auto_117917 ?auto_117922 ) ) ( not ( = ?auto_117917 ?auto_117923 ) ) ( not ( = ?auto_117918 ?auto_117919 ) ) ( not ( = ?auto_117918 ?auto_117920 ) ) ( not ( = ?auto_117918 ?auto_117921 ) ) ( not ( = ?auto_117918 ?auto_117922 ) ) ( not ( = ?auto_117918 ?auto_117923 ) ) ( not ( = ?auto_117919 ?auto_117920 ) ) ( not ( = ?auto_117919 ?auto_117921 ) ) ( not ( = ?auto_117919 ?auto_117922 ) ) ( not ( = ?auto_117919 ?auto_117923 ) ) ( not ( = ?auto_117920 ?auto_117921 ) ) ( not ( = ?auto_117920 ?auto_117922 ) ) ( not ( = ?auto_117920 ?auto_117923 ) ) ( not ( = ?auto_117921 ?auto_117922 ) ) ( not ( = ?auto_117921 ?auto_117923 ) ) ( not ( = ?auto_117922 ?auto_117923 ) ) ( ON ?auto_117923 ?auto_117924 ) ( not ( = ?auto_117916 ?auto_117924 ) ) ( not ( = ?auto_117917 ?auto_117924 ) ) ( not ( = ?auto_117918 ?auto_117924 ) ) ( not ( = ?auto_117919 ?auto_117924 ) ) ( not ( = ?auto_117920 ?auto_117924 ) ) ( not ( = ?auto_117921 ?auto_117924 ) ) ( not ( = ?auto_117922 ?auto_117924 ) ) ( not ( = ?auto_117923 ?auto_117924 ) ) ( CLEAR ?auto_117921 ) ( ON ?auto_117922 ?auto_117923 ) ( CLEAR ?auto_117922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117924 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117924 ?auto_117923 )
      ( MAKE-8PILE ?auto_117916 ?auto_117917 ?auto_117918 ?auto_117919 ?auto_117920 ?auto_117921 ?auto_117922 ?auto_117923 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117925 - BLOCK
      ?auto_117926 - BLOCK
      ?auto_117927 - BLOCK
      ?auto_117928 - BLOCK
      ?auto_117929 - BLOCK
      ?auto_117930 - BLOCK
      ?auto_117931 - BLOCK
      ?auto_117932 - BLOCK
    )
    :vars
    (
      ?auto_117933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117925 ) ( ON ?auto_117926 ?auto_117925 ) ( ON ?auto_117927 ?auto_117926 ) ( ON ?auto_117928 ?auto_117927 ) ( ON ?auto_117929 ?auto_117928 ) ( not ( = ?auto_117925 ?auto_117926 ) ) ( not ( = ?auto_117925 ?auto_117927 ) ) ( not ( = ?auto_117925 ?auto_117928 ) ) ( not ( = ?auto_117925 ?auto_117929 ) ) ( not ( = ?auto_117925 ?auto_117930 ) ) ( not ( = ?auto_117925 ?auto_117931 ) ) ( not ( = ?auto_117925 ?auto_117932 ) ) ( not ( = ?auto_117926 ?auto_117927 ) ) ( not ( = ?auto_117926 ?auto_117928 ) ) ( not ( = ?auto_117926 ?auto_117929 ) ) ( not ( = ?auto_117926 ?auto_117930 ) ) ( not ( = ?auto_117926 ?auto_117931 ) ) ( not ( = ?auto_117926 ?auto_117932 ) ) ( not ( = ?auto_117927 ?auto_117928 ) ) ( not ( = ?auto_117927 ?auto_117929 ) ) ( not ( = ?auto_117927 ?auto_117930 ) ) ( not ( = ?auto_117927 ?auto_117931 ) ) ( not ( = ?auto_117927 ?auto_117932 ) ) ( not ( = ?auto_117928 ?auto_117929 ) ) ( not ( = ?auto_117928 ?auto_117930 ) ) ( not ( = ?auto_117928 ?auto_117931 ) ) ( not ( = ?auto_117928 ?auto_117932 ) ) ( not ( = ?auto_117929 ?auto_117930 ) ) ( not ( = ?auto_117929 ?auto_117931 ) ) ( not ( = ?auto_117929 ?auto_117932 ) ) ( not ( = ?auto_117930 ?auto_117931 ) ) ( not ( = ?auto_117930 ?auto_117932 ) ) ( not ( = ?auto_117931 ?auto_117932 ) ) ( ON ?auto_117932 ?auto_117933 ) ( not ( = ?auto_117925 ?auto_117933 ) ) ( not ( = ?auto_117926 ?auto_117933 ) ) ( not ( = ?auto_117927 ?auto_117933 ) ) ( not ( = ?auto_117928 ?auto_117933 ) ) ( not ( = ?auto_117929 ?auto_117933 ) ) ( not ( = ?auto_117930 ?auto_117933 ) ) ( not ( = ?auto_117931 ?auto_117933 ) ) ( not ( = ?auto_117932 ?auto_117933 ) ) ( ON ?auto_117931 ?auto_117932 ) ( CLEAR ?auto_117931 ) ( ON-TABLE ?auto_117933 ) ( HOLDING ?auto_117930 ) ( CLEAR ?auto_117929 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117925 ?auto_117926 ?auto_117927 ?auto_117928 ?auto_117929 ?auto_117930 )
      ( MAKE-8PILE ?auto_117925 ?auto_117926 ?auto_117927 ?auto_117928 ?auto_117929 ?auto_117930 ?auto_117931 ?auto_117932 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117934 - BLOCK
      ?auto_117935 - BLOCK
      ?auto_117936 - BLOCK
      ?auto_117937 - BLOCK
      ?auto_117938 - BLOCK
      ?auto_117939 - BLOCK
      ?auto_117940 - BLOCK
      ?auto_117941 - BLOCK
    )
    :vars
    (
      ?auto_117942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117934 ) ( ON ?auto_117935 ?auto_117934 ) ( ON ?auto_117936 ?auto_117935 ) ( ON ?auto_117937 ?auto_117936 ) ( ON ?auto_117938 ?auto_117937 ) ( not ( = ?auto_117934 ?auto_117935 ) ) ( not ( = ?auto_117934 ?auto_117936 ) ) ( not ( = ?auto_117934 ?auto_117937 ) ) ( not ( = ?auto_117934 ?auto_117938 ) ) ( not ( = ?auto_117934 ?auto_117939 ) ) ( not ( = ?auto_117934 ?auto_117940 ) ) ( not ( = ?auto_117934 ?auto_117941 ) ) ( not ( = ?auto_117935 ?auto_117936 ) ) ( not ( = ?auto_117935 ?auto_117937 ) ) ( not ( = ?auto_117935 ?auto_117938 ) ) ( not ( = ?auto_117935 ?auto_117939 ) ) ( not ( = ?auto_117935 ?auto_117940 ) ) ( not ( = ?auto_117935 ?auto_117941 ) ) ( not ( = ?auto_117936 ?auto_117937 ) ) ( not ( = ?auto_117936 ?auto_117938 ) ) ( not ( = ?auto_117936 ?auto_117939 ) ) ( not ( = ?auto_117936 ?auto_117940 ) ) ( not ( = ?auto_117936 ?auto_117941 ) ) ( not ( = ?auto_117937 ?auto_117938 ) ) ( not ( = ?auto_117937 ?auto_117939 ) ) ( not ( = ?auto_117937 ?auto_117940 ) ) ( not ( = ?auto_117937 ?auto_117941 ) ) ( not ( = ?auto_117938 ?auto_117939 ) ) ( not ( = ?auto_117938 ?auto_117940 ) ) ( not ( = ?auto_117938 ?auto_117941 ) ) ( not ( = ?auto_117939 ?auto_117940 ) ) ( not ( = ?auto_117939 ?auto_117941 ) ) ( not ( = ?auto_117940 ?auto_117941 ) ) ( ON ?auto_117941 ?auto_117942 ) ( not ( = ?auto_117934 ?auto_117942 ) ) ( not ( = ?auto_117935 ?auto_117942 ) ) ( not ( = ?auto_117936 ?auto_117942 ) ) ( not ( = ?auto_117937 ?auto_117942 ) ) ( not ( = ?auto_117938 ?auto_117942 ) ) ( not ( = ?auto_117939 ?auto_117942 ) ) ( not ( = ?auto_117940 ?auto_117942 ) ) ( not ( = ?auto_117941 ?auto_117942 ) ) ( ON ?auto_117940 ?auto_117941 ) ( ON-TABLE ?auto_117942 ) ( CLEAR ?auto_117938 ) ( ON ?auto_117939 ?auto_117940 ) ( CLEAR ?auto_117939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117942 ?auto_117941 ?auto_117940 )
      ( MAKE-8PILE ?auto_117934 ?auto_117935 ?auto_117936 ?auto_117937 ?auto_117938 ?auto_117939 ?auto_117940 ?auto_117941 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117943 - BLOCK
      ?auto_117944 - BLOCK
      ?auto_117945 - BLOCK
      ?auto_117946 - BLOCK
      ?auto_117947 - BLOCK
      ?auto_117948 - BLOCK
      ?auto_117949 - BLOCK
      ?auto_117950 - BLOCK
    )
    :vars
    (
      ?auto_117951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117943 ) ( ON ?auto_117944 ?auto_117943 ) ( ON ?auto_117945 ?auto_117944 ) ( ON ?auto_117946 ?auto_117945 ) ( not ( = ?auto_117943 ?auto_117944 ) ) ( not ( = ?auto_117943 ?auto_117945 ) ) ( not ( = ?auto_117943 ?auto_117946 ) ) ( not ( = ?auto_117943 ?auto_117947 ) ) ( not ( = ?auto_117943 ?auto_117948 ) ) ( not ( = ?auto_117943 ?auto_117949 ) ) ( not ( = ?auto_117943 ?auto_117950 ) ) ( not ( = ?auto_117944 ?auto_117945 ) ) ( not ( = ?auto_117944 ?auto_117946 ) ) ( not ( = ?auto_117944 ?auto_117947 ) ) ( not ( = ?auto_117944 ?auto_117948 ) ) ( not ( = ?auto_117944 ?auto_117949 ) ) ( not ( = ?auto_117944 ?auto_117950 ) ) ( not ( = ?auto_117945 ?auto_117946 ) ) ( not ( = ?auto_117945 ?auto_117947 ) ) ( not ( = ?auto_117945 ?auto_117948 ) ) ( not ( = ?auto_117945 ?auto_117949 ) ) ( not ( = ?auto_117945 ?auto_117950 ) ) ( not ( = ?auto_117946 ?auto_117947 ) ) ( not ( = ?auto_117946 ?auto_117948 ) ) ( not ( = ?auto_117946 ?auto_117949 ) ) ( not ( = ?auto_117946 ?auto_117950 ) ) ( not ( = ?auto_117947 ?auto_117948 ) ) ( not ( = ?auto_117947 ?auto_117949 ) ) ( not ( = ?auto_117947 ?auto_117950 ) ) ( not ( = ?auto_117948 ?auto_117949 ) ) ( not ( = ?auto_117948 ?auto_117950 ) ) ( not ( = ?auto_117949 ?auto_117950 ) ) ( ON ?auto_117950 ?auto_117951 ) ( not ( = ?auto_117943 ?auto_117951 ) ) ( not ( = ?auto_117944 ?auto_117951 ) ) ( not ( = ?auto_117945 ?auto_117951 ) ) ( not ( = ?auto_117946 ?auto_117951 ) ) ( not ( = ?auto_117947 ?auto_117951 ) ) ( not ( = ?auto_117948 ?auto_117951 ) ) ( not ( = ?auto_117949 ?auto_117951 ) ) ( not ( = ?auto_117950 ?auto_117951 ) ) ( ON ?auto_117949 ?auto_117950 ) ( ON-TABLE ?auto_117951 ) ( ON ?auto_117948 ?auto_117949 ) ( CLEAR ?auto_117948 ) ( HOLDING ?auto_117947 ) ( CLEAR ?auto_117946 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117943 ?auto_117944 ?auto_117945 ?auto_117946 ?auto_117947 )
      ( MAKE-8PILE ?auto_117943 ?auto_117944 ?auto_117945 ?auto_117946 ?auto_117947 ?auto_117948 ?auto_117949 ?auto_117950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117952 - BLOCK
      ?auto_117953 - BLOCK
      ?auto_117954 - BLOCK
      ?auto_117955 - BLOCK
      ?auto_117956 - BLOCK
      ?auto_117957 - BLOCK
      ?auto_117958 - BLOCK
      ?auto_117959 - BLOCK
    )
    :vars
    (
      ?auto_117960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117952 ) ( ON ?auto_117953 ?auto_117952 ) ( ON ?auto_117954 ?auto_117953 ) ( ON ?auto_117955 ?auto_117954 ) ( not ( = ?auto_117952 ?auto_117953 ) ) ( not ( = ?auto_117952 ?auto_117954 ) ) ( not ( = ?auto_117952 ?auto_117955 ) ) ( not ( = ?auto_117952 ?auto_117956 ) ) ( not ( = ?auto_117952 ?auto_117957 ) ) ( not ( = ?auto_117952 ?auto_117958 ) ) ( not ( = ?auto_117952 ?auto_117959 ) ) ( not ( = ?auto_117953 ?auto_117954 ) ) ( not ( = ?auto_117953 ?auto_117955 ) ) ( not ( = ?auto_117953 ?auto_117956 ) ) ( not ( = ?auto_117953 ?auto_117957 ) ) ( not ( = ?auto_117953 ?auto_117958 ) ) ( not ( = ?auto_117953 ?auto_117959 ) ) ( not ( = ?auto_117954 ?auto_117955 ) ) ( not ( = ?auto_117954 ?auto_117956 ) ) ( not ( = ?auto_117954 ?auto_117957 ) ) ( not ( = ?auto_117954 ?auto_117958 ) ) ( not ( = ?auto_117954 ?auto_117959 ) ) ( not ( = ?auto_117955 ?auto_117956 ) ) ( not ( = ?auto_117955 ?auto_117957 ) ) ( not ( = ?auto_117955 ?auto_117958 ) ) ( not ( = ?auto_117955 ?auto_117959 ) ) ( not ( = ?auto_117956 ?auto_117957 ) ) ( not ( = ?auto_117956 ?auto_117958 ) ) ( not ( = ?auto_117956 ?auto_117959 ) ) ( not ( = ?auto_117957 ?auto_117958 ) ) ( not ( = ?auto_117957 ?auto_117959 ) ) ( not ( = ?auto_117958 ?auto_117959 ) ) ( ON ?auto_117959 ?auto_117960 ) ( not ( = ?auto_117952 ?auto_117960 ) ) ( not ( = ?auto_117953 ?auto_117960 ) ) ( not ( = ?auto_117954 ?auto_117960 ) ) ( not ( = ?auto_117955 ?auto_117960 ) ) ( not ( = ?auto_117956 ?auto_117960 ) ) ( not ( = ?auto_117957 ?auto_117960 ) ) ( not ( = ?auto_117958 ?auto_117960 ) ) ( not ( = ?auto_117959 ?auto_117960 ) ) ( ON ?auto_117958 ?auto_117959 ) ( ON-TABLE ?auto_117960 ) ( ON ?auto_117957 ?auto_117958 ) ( CLEAR ?auto_117955 ) ( ON ?auto_117956 ?auto_117957 ) ( CLEAR ?auto_117956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117960 ?auto_117959 ?auto_117958 ?auto_117957 )
      ( MAKE-8PILE ?auto_117952 ?auto_117953 ?auto_117954 ?auto_117955 ?auto_117956 ?auto_117957 ?auto_117958 ?auto_117959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117961 - BLOCK
      ?auto_117962 - BLOCK
      ?auto_117963 - BLOCK
      ?auto_117964 - BLOCK
      ?auto_117965 - BLOCK
      ?auto_117966 - BLOCK
      ?auto_117967 - BLOCK
      ?auto_117968 - BLOCK
    )
    :vars
    (
      ?auto_117969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117961 ) ( ON ?auto_117962 ?auto_117961 ) ( ON ?auto_117963 ?auto_117962 ) ( not ( = ?auto_117961 ?auto_117962 ) ) ( not ( = ?auto_117961 ?auto_117963 ) ) ( not ( = ?auto_117961 ?auto_117964 ) ) ( not ( = ?auto_117961 ?auto_117965 ) ) ( not ( = ?auto_117961 ?auto_117966 ) ) ( not ( = ?auto_117961 ?auto_117967 ) ) ( not ( = ?auto_117961 ?auto_117968 ) ) ( not ( = ?auto_117962 ?auto_117963 ) ) ( not ( = ?auto_117962 ?auto_117964 ) ) ( not ( = ?auto_117962 ?auto_117965 ) ) ( not ( = ?auto_117962 ?auto_117966 ) ) ( not ( = ?auto_117962 ?auto_117967 ) ) ( not ( = ?auto_117962 ?auto_117968 ) ) ( not ( = ?auto_117963 ?auto_117964 ) ) ( not ( = ?auto_117963 ?auto_117965 ) ) ( not ( = ?auto_117963 ?auto_117966 ) ) ( not ( = ?auto_117963 ?auto_117967 ) ) ( not ( = ?auto_117963 ?auto_117968 ) ) ( not ( = ?auto_117964 ?auto_117965 ) ) ( not ( = ?auto_117964 ?auto_117966 ) ) ( not ( = ?auto_117964 ?auto_117967 ) ) ( not ( = ?auto_117964 ?auto_117968 ) ) ( not ( = ?auto_117965 ?auto_117966 ) ) ( not ( = ?auto_117965 ?auto_117967 ) ) ( not ( = ?auto_117965 ?auto_117968 ) ) ( not ( = ?auto_117966 ?auto_117967 ) ) ( not ( = ?auto_117966 ?auto_117968 ) ) ( not ( = ?auto_117967 ?auto_117968 ) ) ( ON ?auto_117968 ?auto_117969 ) ( not ( = ?auto_117961 ?auto_117969 ) ) ( not ( = ?auto_117962 ?auto_117969 ) ) ( not ( = ?auto_117963 ?auto_117969 ) ) ( not ( = ?auto_117964 ?auto_117969 ) ) ( not ( = ?auto_117965 ?auto_117969 ) ) ( not ( = ?auto_117966 ?auto_117969 ) ) ( not ( = ?auto_117967 ?auto_117969 ) ) ( not ( = ?auto_117968 ?auto_117969 ) ) ( ON ?auto_117967 ?auto_117968 ) ( ON-TABLE ?auto_117969 ) ( ON ?auto_117966 ?auto_117967 ) ( ON ?auto_117965 ?auto_117966 ) ( CLEAR ?auto_117965 ) ( HOLDING ?auto_117964 ) ( CLEAR ?auto_117963 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117961 ?auto_117962 ?auto_117963 ?auto_117964 )
      ( MAKE-8PILE ?auto_117961 ?auto_117962 ?auto_117963 ?auto_117964 ?auto_117965 ?auto_117966 ?auto_117967 ?auto_117968 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117970 - BLOCK
      ?auto_117971 - BLOCK
      ?auto_117972 - BLOCK
      ?auto_117973 - BLOCK
      ?auto_117974 - BLOCK
      ?auto_117975 - BLOCK
      ?auto_117976 - BLOCK
      ?auto_117977 - BLOCK
    )
    :vars
    (
      ?auto_117978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117970 ) ( ON ?auto_117971 ?auto_117970 ) ( ON ?auto_117972 ?auto_117971 ) ( not ( = ?auto_117970 ?auto_117971 ) ) ( not ( = ?auto_117970 ?auto_117972 ) ) ( not ( = ?auto_117970 ?auto_117973 ) ) ( not ( = ?auto_117970 ?auto_117974 ) ) ( not ( = ?auto_117970 ?auto_117975 ) ) ( not ( = ?auto_117970 ?auto_117976 ) ) ( not ( = ?auto_117970 ?auto_117977 ) ) ( not ( = ?auto_117971 ?auto_117972 ) ) ( not ( = ?auto_117971 ?auto_117973 ) ) ( not ( = ?auto_117971 ?auto_117974 ) ) ( not ( = ?auto_117971 ?auto_117975 ) ) ( not ( = ?auto_117971 ?auto_117976 ) ) ( not ( = ?auto_117971 ?auto_117977 ) ) ( not ( = ?auto_117972 ?auto_117973 ) ) ( not ( = ?auto_117972 ?auto_117974 ) ) ( not ( = ?auto_117972 ?auto_117975 ) ) ( not ( = ?auto_117972 ?auto_117976 ) ) ( not ( = ?auto_117972 ?auto_117977 ) ) ( not ( = ?auto_117973 ?auto_117974 ) ) ( not ( = ?auto_117973 ?auto_117975 ) ) ( not ( = ?auto_117973 ?auto_117976 ) ) ( not ( = ?auto_117973 ?auto_117977 ) ) ( not ( = ?auto_117974 ?auto_117975 ) ) ( not ( = ?auto_117974 ?auto_117976 ) ) ( not ( = ?auto_117974 ?auto_117977 ) ) ( not ( = ?auto_117975 ?auto_117976 ) ) ( not ( = ?auto_117975 ?auto_117977 ) ) ( not ( = ?auto_117976 ?auto_117977 ) ) ( ON ?auto_117977 ?auto_117978 ) ( not ( = ?auto_117970 ?auto_117978 ) ) ( not ( = ?auto_117971 ?auto_117978 ) ) ( not ( = ?auto_117972 ?auto_117978 ) ) ( not ( = ?auto_117973 ?auto_117978 ) ) ( not ( = ?auto_117974 ?auto_117978 ) ) ( not ( = ?auto_117975 ?auto_117978 ) ) ( not ( = ?auto_117976 ?auto_117978 ) ) ( not ( = ?auto_117977 ?auto_117978 ) ) ( ON ?auto_117976 ?auto_117977 ) ( ON-TABLE ?auto_117978 ) ( ON ?auto_117975 ?auto_117976 ) ( ON ?auto_117974 ?auto_117975 ) ( CLEAR ?auto_117972 ) ( ON ?auto_117973 ?auto_117974 ) ( CLEAR ?auto_117973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117978 ?auto_117977 ?auto_117976 ?auto_117975 ?auto_117974 )
      ( MAKE-8PILE ?auto_117970 ?auto_117971 ?auto_117972 ?auto_117973 ?auto_117974 ?auto_117975 ?auto_117976 ?auto_117977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117979 - BLOCK
      ?auto_117980 - BLOCK
      ?auto_117981 - BLOCK
      ?auto_117982 - BLOCK
      ?auto_117983 - BLOCK
      ?auto_117984 - BLOCK
      ?auto_117985 - BLOCK
      ?auto_117986 - BLOCK
    )
    :vars
    (
      ?auto_117987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117979 ) ( ON ?auto_117980 ?auto_117979 ) ( not ( = ?auto_117979 ?auto_117980 ) ) ( not ( = ?auto_117979 ?auto_117981 ) ) ( not ( = ?auto_117979 ?auto_117982 ) ) ( not ( = ?auto_117979 ?auto_117983 ) ) ( not ( = ?auto_117979 ?auto_117984 ) ) ( not ( = ?auto_117979 ?auto_117985 ) ) ( not ( = ?auto_117979 ?auto_117986 ) ) ( not ( = ?auto_117980 ?auto_117981 ) ) ( not ( = ?auto_117980 ?auto_117982 ) ) ( not ( = ?auto_117980 ?auto_117983 ) ) ( not ( = ?auto_117980 ?auto_117984 ) ) ( not ( = ?auto_117980 ?auto_117985 ) ) ( not ( = ?auto_117980 ?auto_117986 ) ) ( not ( = ?auto_117981 ?auto_117982 ) ) ( not ( = ?auto_117981 ?auto_117983 ) ) ( not ( = ?auto_117981 ?auto_117984 ) ) ( not ( = ?auto_117981 ?auto_117985 ) ) ( not ( = ?auto_117981 ?auto_117986 ) ) ( not ( = ?auto_117982 ?auto_117983 ) ) ( not ( = ?auto_117982 ?auto_117984 ) ) ( not ( = ?auto_117982 ?auto_117985 ) ) ( not ( = ?auto_117982 ?auto_117986 ) ) ( not ( = ?auto_117983 ?auto_117984 ) ) ( not ( = ?auto_117983 ?auto_117985 ) ) ( not ( = ?auto_117983 ?auto_117986 ) ) ( not ( = ?auto_117984 ?auto_117985 ) ) ( not ( = ?auto_117984 ?auto_117986 ) ) ( not ( = ?auto_117985 ?auto_117986 ) ) ( ON ?auto_117986 ?auto_117987 ) ( not ( = ?auto_117979 ?auto_117987 ) ) ( not ( = ?auto_117980 ?auto_117987 ) ) ( not ( = ?auto_117981 ?auto_117987 ) ) ( not ( = ?auto_117982 ?auto_117987 ) ) ( not ( = ?auto_117983 ?auto_117987 ) ) ( not ( = ?auto_117984 ?auto_117987 ) ) ( not ( = ?auto_117985 ?auto_117987 ) ) ( not ( = ?auto_117986 ?auto_117987 ) ) ( ON ?auto_117985 ?auto_117986 ) ( ON-TABLE ?auto_117987 ) ( ON ?auto_117984 ?auto_117985 ) ( ON ?auto_117983 ?auto_117984 ) ( ON ?auto_117982 ?auto_117983 ) ( CLEAR ?auto_117982 ) ( HOLDING ?auto_117981 ) ( CLEAR ?auto_117980 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117979 ?auto_117980 ?auto_117981 )
      ( MAKE-8PILE ?auto_117979 ?auto_117980 ?auto_117981 ?auto_117982 ?auto_117983 ?auto_117984 ?auto_117985 ?auto_117986 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117988 - BLOCK
      ?auto_117989 - BLOCK
      ?auto_117990 - BLOCK
      ?auto_117991 - BLOCK
      ?auto_117992 - BLOCK
      ?auto_117993 - BLOCK
      ?auto_117994 - BLOCK
      ?auto_117995 - BLOCK
    )
    :vars
    (
      ?auto_117996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117988 ) ( ON ?auto_117989 ?auto_117988 ) ( not ( = ?auto_117988 ?auto_117989 ) ) ( not ( = ?auto_117988 ?auto_117990 ) ) ( not ( = ?auto_117988 ?auto_117991 ) ) ( not ( = ?auto_117988 ?auto_117992 ) ) ( not ( = ?auto_117988 ?auto_117993 ) ) ( not ( = ?auto_117988 ?auto_117994 ) ) ( not ( = ?auto_117988 ?auto_117995 ) ) ( not ( = ?auto_117989 ?auto_117990 ) ) ( not ( = ?auto_117989 ?auto_117991 ) ) ( not ( = ?auto_117989 ?auto_117992 ) ) ( not ( = ?auto_117989 ?auto_117993 ) ) ( not ( = ?auto_117989 ?auto_117994 ) ) ( not ( = ?auto_117989 ?auto_117995 ) ) ( not ( = ?auto_117990 ?auto_117991 ) ) ( not ( = ?auto_117990 ?auto_117992 ) ) ( not ( = ?auto_117990 ?auto_117993 ) ) ( not ( = ?auto_117990 ?auto_117994 ) ) ( not ( = ?auto_117990 ?auto_117995 ) ) ( not ( = ?auto_117991 ?auto_117992 ) ) ( not ( = ?auto_117991 ?auto_117993 ) ) ( not ( = ?auto_117991 ?auto_117994 ) ) ( not ( = ?auto_117991 ?auto_117995 ) ) ( not ( = ?auto_117992 ?auto_117993 ) ) ( not ( = ?auto_117992 ?auto_117994 ) ) ( not ( = ?auto_117992 ?auto_117995 ) ) ( not ( = ?auto_117993 ?auto_117994 ) ) ( not ( = ?auto_117993 ?auto_117995 ) ) ( not ( = ?auto_117994 ?auto_117995 ) ) ( ON ?auto_117995 ?auto_117996 ) ( not ( = ?auto_117988 ?auto_117996 ) ) ( not ( = ?auto_117989 ?auto_117996 ) ) ( not ( = ?auto_117990 ?auto_117996 ) ) ( not ( = ?auto_117991 ?auto_117996 ) ) ( not ( = ?auto_117992 ?auto_117996 ) ) ( not ( = ?auto_117993 ?auto_117996 ) ) ( not ( = ?auto_117994 ?auto_117996 ) ) ( not ( = ?auto_117995 ?auto_117996 ) ) ( ON ?auto_117994 ?auto_117995 ) ( ON-TABLE ?auto_117996 ) ( ON ?auto_117993 ?auto_117994 ) ( ON ?auto_117992 ?auto_117993 ) ( ON ?auto_117991 ?auto_117992 ) ( CLEAR ?auto_117989 ) ( ON ?auto_117990 ?auto_117991 ) ( CLEAR ?auto_117990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_117996 ?auto_117995 ?auto_117994 ?auto_117993 ?auto_117992 ?auto_117991 )
      ( MAKE-8PILE ?auto_117988 ?auto_117989 ?auto_117990 ?auto_117991 ?auto_117992 ?auto_117993 ?auto_117994 ?auto_117995 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_117997 - BLOCK
      ?auto_117998 - BLOCK
      ?auto_117999 - BLOCK
      ?auto_118000 - BLOCK
      ?auto_118001 - BLOCK
      ?auto_118002 - BLOCK
      ?auto_118003 - BLOCK
      ?auto_118004 - BLOCK
    )
    :vars
    (
      ?auto_118005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_117997 ) ( not ( = ?auto_117997 ?auto_117998 ) ) ( not ( = ?auto_117997 ?auto_117999 ) ) ( not ( = ?auto_117997 ?auto_118000 ) ) ( not ( = ?auto_117997 ?auto_118001 ) ) ( not ( = ?auto_117997 ?auto_118002 ) ) ( not ( = ?auto_117997 ?auto_118003 ) ) ( not ( = ?auto_117997 ?auto_118004 ) ) ( not ( = ?auto_117998 ?auto_117999 ) ) ( not ( = ?auto_117998 ?auto_118000 ) ) ( not ( = ?auto_117998 ?auto_118001 ) ) ( not ( = ?auto_117998 ?auto_118002 ) ) ( not ( = ?auto_117998 ?auto_118003 ) ) ( not ( = ?auto_117998 ?auto_118004 ) ) ( not ( = ?auto_117999 ?auto_118000 ) ) ( not ( = ?auto_117999 ?auto_118001 ) ) ( not ( = ?auto_117999 ?auto_118002 ) ) ( not ( = ?auto_117999 ?auto_118003 ) ) ( not ( = ?auto_117999 ?auto_118004 ) ) ( not ( = ?auto_118000 ?auto_118001 ) ) ( not ( = ?auto_118000 ?auto_118002 ) ) ( not ( = ?auto_118000 ?auto_118003 ) ) ( not ( = ?auto_118000 ?auto_118004 ) ) ( not ( = ?auto_118001 ?auto_118002 ) ) ( not ( = ?auto_118001 ?auto_118003 ) ) ( not ( = ?auto_118001 ?auto_118004 ) ) ( not ( = ?auto_118002 ?auto_118003 ) ) ( not ( = ?auto_118002 ?auto_118004 ) ) ( not ( = ?auto_118003 ?auto_118004 ) ) ( ON ?auto_118004 ?auto_118005 ) ( not ( = ?auto_117997 ?auto_118005 ) ) ( not ( = ?auto_117998 ?auto_118005 ) ) ( not ( = ?auto_117999 ?auto_118005 ) ) ( not ( = ?auto_118000 ?auto_118005 ) ) ( not ( = ?auto_118001 ?auto_118005 ) ) ( not ( = ?auto_118002 ?auto_118005 ) ) ( not ( = ?auto_118003 ?auto_118005 ) ) ( not ( = ?auto_118004 ?auto_118005 ) ) ( ON ?auto_118003 ?auto_118004 ) ( ON-TABLE ?auto_118005 ) ( ON ?auto_118002 ?auto_118003 ) ( ON ?auto_118001 ?auto_118002 ) ( ON ?auto_118000 ?auto_118001 ) ( ON ?auto_117999 ?auto_118000 ) ( CLEAR ?auto_117999 ) ( HOLDING ?auto_117998 ) ( CLEAR ?auto_117997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117997 ?auto_117998 )
      ( MAKE-8PILE ?auto_117997 ?auto_117998 ?auto_117999 ?auto_118000 ?auto_118001 ?auto_118002 ?auto_118003 ?auto_118004 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118006 - BLOCK
      ?auto_118007 - BLOCK
      ?auto_118008 - BLOCK
      ?auto_118009 - BLOCK
      ?auto_118010 - BLOCK
      ?auto_118011 - BLOCK
      ?auto_118012 - BLOCK
      ?auto_118013 - BLOCK
    )
    :vars
    (
      ?auto_118014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118006 ) ( not ( = ?auto_118006 ?auto_118007 ) ) ( not ( = ?auto_118006 ?auto_118008 ) ) ( not ( = ?auto_118006 ?auto_118009 ) ) ( not ( = ?auto_118006 ?auto_118010 ) ) ( not ( = ?auto_118006 ?auto_118011 ) ) ( not ( = ?auto_118006 ?auto_118012 ) ) ( not ( = ?auto_118006 ?auto_118013 ) ) ( not ( = ?auto_118007 ?auto_118008 ) ) ( not ( = ?auto_118007 ?auto_118009 ) ) ( not ( = ?auto_118007 ?auto_118010 ) ) ( not ( = ?auto_118007 ?auto_118011 ) ) ( not ( = ?auto_118007 ?auto_118012 ) ) ( not ( = ?auto_118007 ?auto_118013 ) ) ( not ( = ?auto_118008 ?auto_118009 ) ) ( not ( = ?auto_118008 ?auto_118010 ) ) ( not ( = ?auto_118008 ?auto_118011 ) ) ( not ( = ?auto_118008 ?auto_118012 ) ) ( not ( = ?auto_118008 ?auto_118013 ) ) ( not ( = ?auto_118009 ?auto_118010 ) ) ( not ( = ?auto_118009 ?auto_118011 ) ) ( not ( = ?auto_118009 ?auto_118012 ) ) ( not ( = ?auto_118009 ?auto_118013 ) ) ( not ( = ?auto_118010 ?auto_118011 ) ) ( not ( = ?auto_118010 ?auto_118012 ) ) ( not ( = ?auto_118010 ?auto_118013 ) ) ( not ( = ?auto_118011 ?auto_118012 ) ) ( not ( = ?auto_118011 ?auto_118013 ) ) ( not ( = ?auto_118012 ?auto_118013 ) ) ( ON ?auto_118013 ?auto_118014 ) ( not ( = ?auto_118006 ?auto_118014 ) ) ( not ( = ?auto_118007 ?auto_118014 ) ) ( not ( = ?auto_118008 ?auto_118014 ) ) ( not ( = ?auto_118009 ?auto_118014 ) ) ( not ( = ?auto_118010 ?auto_118014 ) ) ( not ( = ?auto_118011 ?auto_118014 ) ) ( not ( = ?auto_118012 ?auto_118014 ) ) ( not ( = ?auto_118013 ?auto_118014 ) ) ( ON ?auto_118012 ?auto_118013 ) ( ON-TABLE ?auto_118014 ) ( ON ?auto_118011 ?auto_118012 ) ( ON ?auto_118010 ?auto_118011 ) ( ON ?auto_118009 ?auto_118010 ) ( ON ?auto_118008 ?auto_118009 ) ( CLEAR ?auto_118006 ) ( ON ?auto_118007 ?auto_118008 ) ( CLEAR ?auto_118007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118014 ?auto_118013 ?auto_118012 ?auto_118011 ?auto_118010 ?auto_118009 ?auto_118008 )
      ( MAKE-8PILE ?auto_118006 ?auto_118007 ?auto_118008 ?auto_118009 ?auto_118010 ?auto_118011 ?auto_118012 ?auto_118013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118015 - BLOCK
      ?auto_118016 - BLOCK
      ?auto_118017 - BLOCK
      ?auto_118018 - BLOCK
      ?auto_118019 - BLOCK
      ?auto_118020 - BLOCK
      ?auto_118021 - BLOCK
      ?auto_118022 - BLOCK
    )
    :vars
    (
      ?auto_118023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118015 ?auto_118016 ) ) ( not ( = ?auto_118015 ?auto_118017 ) ) ( not ( = ?auto_118015 ?auto_118018 ) ) ( not ( = ?auto_118015 ?auto_118019 ) ) ( not ( = ?auto_118015 ?auto_118020 ) ) ( not ( = ?auto_118015 ?auto_118021 ) ) ( not ( = ?auto_118015 ?auto_118022 ) ) ( not ( = ?auto_118016 ?auto_118017 ) ) ( not ( = ?auto_118016 ?auto_118018 ) ) ( not ( = ?auto_118016 ?auto_118019 ) ) ( not ( = ?auto_118016 ?auto_118020 ) ) ( not ( = ?auto_118016 ?auto_118021 ) ) ( not ( = ?auto_118016 ?auto_118022 ) ) ( not ( = ?auto_118017 ?auto_118018 ) ) ( not ( = ?auto_118017 ?auto_118019 ) ) ( not ( = ?auto_118017 ?auto_118020 ) ) ( not ( = ?auto_118017 ?auto_118021 ) ) ( not ( = ?auto_118017 ?auto_118022 ) ) ( not ( = ?auto_118018 ?auto_118019 ) ) ( not ( = ?auto_118018 ?auto_118020 ) ) ( not ( = ?auto_118018 ?auto_118021 ) ) ( not ( = ?auto_118018 ?auto_118022 ) ) ( not ( = ?auto_118019 ?auto_118020 ) ) ( not ( = ?auto_118019 ?auto_118021 ) ) ( not ( = ?auto_118019 ?auto_118022 ) ) ( not ( = ?auto_118020 ?auto_118021 ) ) ( not ( = ?auto_118020 ?auto_118022 ) ) ( not ( = ?auto_118021 ?auto_118022 ) ) ( ON ?auto_118022 ?auto_118023 ) ( not ( = ?auto_118015 ?auto_118023 ) ) ( not ( = ?auto_118016 ?auto_118023 ) ) ( not ( = ?auto_118017 ?auto_118023 ) ) ( not ( = ?auto_118018 ?auto_118023 ) ) ( not ( = ?auto_118019 ?auto_118023 ) ) ( not ( = ?auto_118020 ?auto_118023 ) ) ( not ( = ?auto_118021 ?auto_118023 ) ) ( not ( = ?auto_118022 ?auto_118023 ) ) ( ON ?auto_118021 ?auto_118022 ) ( ON-TABLE ?auto_118023 ) ( ON ?auto_118020 ?auto_118021 ) ( ON ?auto_118019 ?auto_118020 ) ( ON ?auto_118018 ?auto_118019 ) ( ON ?auto_118017 ?auto_118018 ) ( ON ?auto_118016 ?auto_118017 ) ( CLEAR ?auto_118016 ) ( HOLDING ?auto_118015 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118015 )
      ( MAKE-8PILE ?auto_118015 ?auto_118016 ?auto_118017 ?auto_118018 ?auto_118019 ?auto_118020 ?auto_118021 ?auto_118022 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118024 - BLOCK
      ?auto_118025 - BLOCK
      ?auto_118026 - BLOCK
      ?auto_118027 - BLOCK
      ?auto_118028 - BLOCK
      ?auto_118029 - BLOCK
      ?auto_118030 - BLOCK
      ?auto_118031 - BLOCK
    )
    :vars
    (
      ?auto_118032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118024 ?auto_118025 ) ) ( not ( = ?auto_118024 ?auto_118026 ) ) ( not ( = ?auto_118024 ?auto_118027 ) ) ( not ( = ?auto_118024 ?auto_118028 ) ) ( not ( = ?auto_118024 ?auto_118029 ) ) ( not ( = ?auto_118024 ?auto_118030 ) ) ( not ( = ?auto_118024 ?auto_118031 ) ) ( not ( = ?auto_118025 ?auto_118026 ) ) ( not ( = ?auto_118025 ?auto_118027 ) ) ( not ( = ?auto_118025 ?auto_118028 ) ) ( not ( = ?auto_118025 ?auto_118029 ) ) ( not ( = ?auto_118025 ?auto_118030 ) ) ( not ( = ?auto_118025 ?auto_118031 ) ) ( not ( = ?auto_118026 ?auto_118027 ) ) ( not ( = ?auto_118026 ?auto_118028 ) ) ( not ( = ?auto_118026 ?auto_118029 ) ) ( not ( = ?auto_118026 ?auto_118030 ) ) ( not ( = ?auto_118026 ?auto_118031 ) ) ( not ( = ?auto_118027 ?auto_118028 ) ) ( not ( = ?auto_118027 ?auto_118029 ) ) ( not ( = ?auto_118027 ?auto_118030 ) ) ( not ( = ?auto_118027 ?auto_118031 ) ) ( not ( = ?auto_118028 ?auto_118029 ) ) ( not ( = ?auto_118028 ?auto_118030 ) ) ( not ( = ?auto_118028 ?auto_118031 ) ) ( not ( = ?auto_118029 ?auto_118030 ) ) ( not ( = ?auto_118029 ?auto_118031 ) ) ( not ( = ?auto_118030 ?auto_118031 ) ) ( ON ?auto_118031 ?auto_118032 ) ( not ( = ?auto_118024 ?auto_118032 ) ) ( not ( = ?auto_118025 ?auto_118032 ) ) ( not ( = ?auto_118026 ?auto_118032 ) ) ( not ( = ?auto_118027 ?auto_118032 ) ) ( not ( = ?auto_118028 ?auto_118032 ) ) ( not ( = ?auto_118029 ?auto_118032 ) ) ( not ( = ?auto_118030 ?auto_118032 ) ) ( not ( = ?auto_118031 ?auto_118032 ) ) ( ON ?auto_118030 ?auto_118031 ) ( ON-TABLE ?auto_118032 ) ( ON ?auto_118029 ?auto_118030 ) ( ON ?auto_118028 ?auto_118029 ) ( ON ?auto_118027 ?auto_118028 ) ( ON ?auto_118026 ?auto_118027 ) ( ON ?auto_118025 ?auto_118026 ) ( ON ?auto_118024 ?auto_118025 ) ( CLEAR ?auto_118024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118032 ?auto_118031 ?auto_118030 ?auto_118029 ?auto_118028 ?auto_118027 ?auto_118026 ?auto_118025 )
      ( MAKE-8PILE ?auto_118024 ?auto_118025 ?auto_118026 ?auto_118027 ?auto_118028 ?auto_118029 ?auto_118030 ?auto_118031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118169 - BLOCK
    )
    :vars
    (
      ?auto_118170 - BLOCK
      ?auto_118171 - BLOCK
      ?auto_118172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118169 ?auto_118170 ) ( CLEAR ?auto_118169 ) ( not ( = ?auto_118169 ?auto_118170 ) ) ( HOLDING ?auto_118171 ) ( CLEAR ?auto_118172 ) ( not ( = ?auto_118169 ?auto_118171 ) ) ( not ( = ?auto_118169 ?auto_118172 ) ) ( not ( = ?auto_118170 ?auto_118171 ) ) ( not ( = ?auto_118170 ?auto_118172 ) ) ( not ( = ?auto_118171 ?auto_118172 ) ) )
    :subtasks
    ( ( !STACK ?auto_118171 ?auto_118172 )
      ( MAKE-1PILE ?auto_118169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118173 - BLOCK
    )
    :vars
    (
      ?auto_118174 - BLOCK
      ?auto_118176 - BLOCK
      ?auto_118175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118173 ?auto_118174 ) ( not ( = ?auto_118173 ?auto_118174 ) ) ( CLEAR ?auto_118176 ) ( not ( = ?auto_118173 ?auto_118175 ) ) ( not ( = ?auto_118173 ?auto_118176 ) ) ( not ( = ?auto_118174 ?auto_118175 ) ) ( not ( = ?auto_118174 ?auto_118176 ) ) ( not ( = ?auto_118175 ?auto_118176 ) ) ( ON ?auto_118175 ?auto_118173 ) ( CLEAR ?auto_118175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118174 ?auto_118173 )
      ( MAKE-1PILE ?auto_118173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118177 - BLOCK
    )
    :vars
    (
      ?auto_118178 - BLOCK
      ?auto_118179 - BLOCK
      ?auto_118180 - BLOCK
      ?auto_118181 - BLOCK
      ?auto_118182 - BLOCK
      ?auto_118183 - BLOCK
      ?auto_118184 - BLOCK
      ?auto_118185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118177 ?auto_118178 ) ( not ( = ?auto_118177 ?auto_118178 ) ) ( not ( = ?auto_118177 ?auto_118179 ) ) ( not ( = ?auto_118177 ?auto_118180 ) ) ( not ( = ?auto_118178 ?auto_118179 ) ) ( not ( = ?auto_118178 ?auto_118180 ) ) ( not ( = ?auto_118179 ?auto_118180 ) ) ( ON ?auto_118179 ?auto_118177 ) ( CLEAR ?auto_118179 ) ( ON-TABLE ?auto_118178 ) ( HOLDING ?auto_118180 ) ( CLEAR ?auto_118181 ) ( ON-TABLE ?auto_118182 ) ( ON ?auto_118183 ?auto_118182 ) ( ON ?auto_118184 ?auto_118183 ) ( ON ?auto_118185 ?auto_118184 ) ( ON ?auto_118181 ?auto_118185 ) ( not ( = ?auto_118182 ?auto_118183 ) ) ( not ( = ?auto_118182 ?auto_118184 ) ) ( not ( = ?auto_118182 ?auto_118185 ) ) ( not ( = ?auto_118182 ?auto_118181 ) ) ( not ( = ?auto_118182 ?auto_118180 ) ) ( not ( = ?auto_118183 ?auto_118184 ) ) ( not ( = ?auto_118183 ?auto_118185 ) ) ( not ( = ?auto_118183 ?auto_118181 ) ) ( not ( = ?auto_118183 ?auto_118180 ) ) ( not ( = ?auto_118184 ?auto_118185 ) ) ( not ( = ?auto_118184 ?auto_118181 ) ) ( not ( = ?auto_118184 ?auto_118180 ) ) ( not ( = ?auto_118185 ?auto_118181 ) ) ( not ( = ?auto_118185 ?auto_118180 ) ) ( not ( = ?auto_118181 ?auto_118180 ) ) ( not ( = ?auto_118177 ?auto_118181 ) ) ( not ( = ?auto_118177 ?auto_118182 ) ) ( not ( = ?auto_118177 ?auto_118183 ) ) ( not ( = ?auto_118177 ?auto_118184 ) ) ( not ( = ?auto_118177 ?auto_118185 ) ) ( not ( = ?auto_118178 ?auto_118181 ) ) ( not ( = ?auto_118178 ?auto_118182 ) ) ( not ( = ?auto_118178 ?auto_118183 ) ) ( not ( = ?auto_118178 ?auto_118184 ) ) ( not ( = ?auto_118178 ?auto_118185 ) ) ( not ( = ?auto_118179 ?auto_118181 ) ) ( not ( = ?auto_118179 ?auto_118182 ) ) ( not ( = ?auto_118179 ?auto_118183 ) ) ( not ( = ?auto_118179 ?auto_118184 ) ) ( not ( = ?auto_118179 ?auto_118185 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118182 ?auto_118183 ?auto_118184 ?auto_118185 ?auto_118181 ?auto_118180 )
      ( MAKE-1PILE ?auto_118177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118186 - BLOCK
    )
    :vars
    (
      ?auto_118189 - BLOCK
      ?auto_118194 - BLOCK
      ?auto_118193 - BLOCK
      ?auto_118187 - BLOCK
      ?auto_118191 - BLOCK
      ?auto_118190 - BLOCK
      ?auto_118192 - BLOCK
      ?auto_118188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118186 ?auto_118189 ) ( not ( = ?auto_118186 ?auto_118189 ) ) ( not ( = ?auto_118186 ?auto_118194 ) ) ( not ( = ?auto_118186 ?auto_118193 ) ) ( not ( = ?auto_118189 ?auto_118194 ) ) ( not ( = ?auto_118189 ?auto_118193 ) ) ( not ( = ?auto_118194 ?auto_118193 ) ) ( ON ?auto_118194 ?auto_118186 ) ( ON-TABLE ?auto_118189 ) ( CLEAR ?auto_118187 ) ( ON-TABLE ?auto_118191 ) ( ON ?auto_118190 ?auto_118191 ) ( ON ?auto_118192 ?auto_118190 ) ( ON ?auto_118188 ?auto_118192 ) ( ON ?auto_118187 ?auto_118188 ) ( not ( = ?auto_118191 ?auto_118190 ) ) ( not ( = ?auto_118191 ?auto_118192 ) ) ( not ( = ?auto_118191 ?auto_118188 ) ) ( not ( = ?auto_118191 ?auto_118187 ) ) ( not ( = ?auto_118191 ?auto_118193 ) ) ( not ( = ?auto_118190 ?auto_118192 ) ) ( not ( = ?auto_118190 ?auto_118188 ) ) ( not ( = ?auto_118190 ?auto_118187 ) ) ( not ( = ?auto_118190 ?auto_118193 ) ) ( not ( = ?auto_118192 ?auto_118188 ) ) ( not ( = ?auto_118192 ?auto_118187 ) ) ( not ( = ?auto_118192 ?auto_118193 ) ) ( not ( = ?auto_118188 ?auto_118187 ) ) ( not ( = ?auto_118188 ?auto_118193 ) ) ( not ( = ?auto_118187 ?auto_118193 ) ) ( not ( = ?auto_118186 ?auto_118187 ) ) ( not ( = ?auto_118186 ?auto_118191 ) ) ( not ( = ?auto_118186 ?auto_118190 ) ) ( not ( = ?auto_118186 ?auto_118192 ) ) ( not ( = ?auto_118186 ?auto_118188 ) ) ( not ( = ?auto_118189 ?auto_118187 ) ) ( not ( = ?auto_118189 ?auto_118191 ) ) ( not ( = ?auto_118189 ?auto_118190 ) ) ( not ( = ?auto_118189 ?auto_118192 ) ) ( not ( = ?auto_118189 ?auto_118188 ) ) ( not ( = ?auto_118194 ?auto_118187 ) ) ( not ( = ?auto_118194 ?auto_118191 ) ) ( not ( = ?auto_118194 ?auto_118190 ) ) ( not ( = ?auto_118194 ?auto_118192 ) ) ( not ( = ?auto_118194 ?auto_118188 ) ) ( ON ?auto_118193 ?auto_118194 ) ( CLEAR ?auto_118193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118189 ?auto_118186 ?auto_118194 )
      ( MAKE-1PILE ?auto_118186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118195 - BLOCK
    )
    :vars
    (
      ?auto_118196 - BLOCK
      ?auto_118202 - BLOCK
      ?auto_118203 - BLOCK
      ?auto_118199 - BLOCK
      ?auto_118201 - BLOCK
      ?auto_118197 - BLOCK
      ?auto_118198 - BLOCK
      ?auto_118200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118195 ?auto_118196 ) ( not ( = ?auto_118195 ?auto_118196 ) ) ( not ( = ?auto_118195 ?auto_118202 ) ) ( not ( = ?auto_118195 ?auto_118203 ) ) ( not ( = ?auto_118196 ?auto_118202 ) ) ( not ( = ?auto_118196 ?auto_118203 ) ) ( not ( = ?auto_118202 ?auto_118203 ) ) ( ON ?auto_118202 ?auto_118195 ) ( ON-TABLE ?auto_118196 ) ( ON-TABLE ?auto_118199 ) ( ON ?auto_118201 ?auto_118199 ) ( ON ?auto_118197 ?auto_118201 ) ( ON ?auto_118198 ?auto_118197 ) ( not ( = ?auto_118199 ?auto_118201 ) ) ( not ( = ?auto_118199 ?auto_118197 ) ) ( not ( = ?auto_118199 ?auto_118198 ) ) ( not ( = ?auto_118199 ?auto_118200 ) ) ( not ( = ?auto_118199 ?auto_118203 ) ) ( not ( = ?auto_118201 ?auto_118197 ) ) ( not ( = ?auto_118201 ?auto_118198 ) ) ( not ( = ?auto_118201 ?auto_118200 ) ) ( not ( = ?auto_118201 ?auto_118203 ) ) ( not ( = ?auto_118197 ?auto_118198 ) ) ( not ( = ?auto_118197 ?auto_118200 ) ) ( not ( = ?auto_118197 ?auto_118203 ) ) ( not ( = ?auto_118198 ?auto_118200 ) ) ( not ( = ?auto_118198 ?auto_118203 ) ) ( not ( = ?auto_118200 ?auto_118203 ) ) ( not ( = ?auto_118195 ?auto_118200 ) ) ( not ( = ?auto_118195 ?auto_118199 ) ) ( not ( = ?auto_118195 ?auto_118201 ) ) ( not ( = ?auto_118195 ?auto_118197 ) ) ( not ( = ?auto_118195 ?auto_118198 ) ) ( not ( = ?auto_118196 ?auto_118200 ) ) ( not ( = ?auto_118196 ?auto_118199 ) ) ( not ( = ?auto_118196 ?auto_118201 ) ) ( not ( = ?auto_118196 ?auto_118197 ) ) ( not ( = ?auto_118196 ?auto_118198 ) ) ( not ( = ?auto_118202 ?auto_118200 ) ) ( not ( = ?auto_118202 ?auto_118199 ) ) ( not ( = ?auto_118202 ?auto_118201 ) ) ( not ( = ?auto_118202 ?auto_118197 ) ) ( not ( = ?auto_118202 ?auto_118198 ) ) ( ON ?auto_118203 ?auto_118202 ) ( CLEAR ?auto_118203 ) ( HOLDING ?auto_118200 ) ( CLEAR ?auto_118198 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118199 ?auto_118201 ?auto_118197 ?auto_118198 ?auto_118200 )
      ( MAKE-1PILE ?auto_118195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118204 - BLOCK
    )
    :vars
    (
      ?auto_118207 - BLOCK
      ?auto_118210 - BLOCK
      ?auto_118205 - BLOCK
      ?auto_118208 - BLOCK
      ?auto_118211 - BLOCK
      ?auto_118212 - BLOCK
      ?auto_118206 - BLOCK
      ?auto_118209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118204 ?auto_118207 ) ( not ( = ?auto_118204 ?auto_118207 ) ) ( not ( = ?auto_118204 ?auto_118210 ) ) ( not ( = ?auto_118204 ?auto_118205 ) ) ( not ( = ?auto_118207 ?auto_118210 ) ) ( not ( = ?auto_118207 ?auto_118205 ) ) ( not ( = ?auto_118210 ?auto_118205 ) ) ( ON ?auto_118210 ?auto_118204 ) ( ON-TABLE ?auto_118207 ) ( ON-TABLE ?auto_118208 ) ( ON ?auto_118211 ?auto_118208 ) ( ON ?auto_118212 ?auto_118211 ) ( ON ?auto_118206 ?auto_118212 ) ( not ( = ?auto_118208 ?auto_118211 ) ) ( not ( = ?auto_118208 ?auto_118212 ) ) ( not ( = ?auto_118208 ?auto_118206 ) ) ( not ( = ?auto_118208 ?auto_118209 ) ) ( not ( = ?auto_118208 ?auto_118205 ) ) ( not ( = ?auto_118211 ?auto_118212 ) ) ( not ( = ?auto_118211 ?auto_118206 ) ) ( not ( = ?auto_118211 ?auto_118209 ) ) ( not ( = ?auto_118211 ?auto_118205 ) ) ( not ( = ?auto_118212 ?auto_118206 ) ) ( not ( = ?auto_118212 ?auto_118209 ) ) ( not ( = ?auto_118212 ?auto_118205 ) ) ( not ( = ?auto_118206 ?auto_118209 ) ) ( not ( = ?auto_118206 ?auto_118205 ) ) ( not ( = ?auto_118209 ?auto_118205 ) ) ( not ( = ?auto_118204 ?auto_118209 ) ) ( not ( = ?auto_118204 ?auto_118208 ) ) ( not ( = ?auto_118204 ?auto_118211 ) ) ( not ( = ?auto_118204 ?auto_118212 ) ) ( not ( = ?auto_118204 ?auto_118206 ) ) ( not ( = ?auto_118207 ?auto_118209 ) ) ( not ( = ?auto_118207 ?auto_118208 ) ) ( not ( = ?auto_118207 ?auto_118211 ) ) ( not ( = ?auto_118207 ?auto_118212 ) ) ( not ( = ?auto_118207 ?auto_118206 ) ) ( not ( = ?auto_118210 ?auto_118209 ) ) ( not ( = ?auto_118210 ?auto_118208 ) ) ( not ( = ?auto_118210 ?auto_118211 ) ) ( not ( = ?auto_118210 ?auto_118212 ) ) ( not ( = ?auto_118210 ?auto_118206 ) ) ( ON ?auto_118205 ?auto_118210 ) ( CLEAR ?auto_118206 ) ( ON ?auto_118209 ?auto_118205 ) ( CLEAR ?auto_118209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118207 ?auto_118204 ?auto_118210 ?auto_118205 )
      ( MAKE-1PILE ?auto_118204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118213 - BLOCK
    )
    :vars
    (
      ?auto_118221 - BLOCK
      ?auto_118216 - BLOCK
      ?auto_118218 - BLOCK
      ?auto_118217 - BLOCK
      ?auto_118219 - BLOCK
      ?auto_118220 - BLOCK
      ?auto_118214 - BLOCK
      ?auto_118215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118213 ?auto_118221 ) ( not ( = ?auto_118213 ?auto_118221 ) ) ( not ( = ?auto_118213 ?auto_118216 ) ) ( not ( = ?auto_118213 ?auto_118218 ) ) ( not ( = ?auto_118221 ?auto_118216 ) ) ( not ( = ?auto_118221 ?auto_118218 ) ) ( not ( = ?auto_118216 ?auto_118218 ) ) ( ON ?auto_118216 ?auto_118213 ) ( ON-TABLE ?auto_118221 ) ( ON-TABLE ?auto_118217 ) ( ON ?auto_118219 ?auto_118217 ) ( ON ?auto_118220 ?auto_118219 ) ( not ( = ?auto_118217 ?auto_118219 ) ) ( not ( = ?auto_118217 ?auto_118220 ) ) ( not ( = ?auto_118217 ?auto_118214 ) ) ( not ( = ?auto_118217 ?auto_118215 ) ) ( not ( = ?auto_118217 ?auto_118218 ) ) ( not ( = ?auto_118219 ?auto_118220 ) ) ( not ( = ?auto_118219 ?auto_118214 ) ) ( not ( = ?auto_118219 ?auto_118215 ) ) ( not ( = ?auto_118219 ?auto_118218 ) ) ( not ( = ?auto_118220 ?auto_118214 ) ) ( not ( = ?auto_118220 ?auto_118215 ) ) ( not ( = ?auto_118220 ?auto_118218 ) ) ( not ( = ?auto_118214 ?auto_118215 ) ) ( not ( = ?auto_118214 ?auto_118218 ) ) ( not ( = ?auto_118215 ?auto_118218 ) ) ( not ( = ?auto_118213 ?auto_118215 ) ) ( not ( = ?auto_118213 ?auto_118217 ) ) ( not ( = ?auto_118213 ?auto_118219 ) ) ( not ( = ?auto_118213 ?auto_118220 ) ) ( not ( = ?auto_118213 ?auto_118214 ) ) ( not ( = ?auto_118221 ?auto_118215 ) ) ( not ( = ?auto_118221 ?auto_118217 ) ) ( not ( = ?auto_118221 ?auto_118219 ) ) ( not ( = ?auto_118221 ?auto_118220 ) ) ( not ( = ?auto_118221 ?auto_118214 ) ) ( not ( = ?auto_118216 ?auto_118215 ) ) ( not ( = ?auto_118216 ?auto_118217 ) ) ( not ( = ?auto_118216 ?auto_118219 ) ) ( not ( = ?auto_118216 ?auto_118220 ) ) ( not ( = ?auto_118216 ?auto_118214 ) ) ( ON ?auto_118218 ?auto_118216 ) ( ON ?auto_118215 ?auto_118218 ) ( CLEAR ?auto_118215 ) ( HOLDING ?auto_118214 ) ( CLEAR ?auto_118220 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118217 ?auto_118219 ?auto_118220 ?auto_118214 )
      ( MAKE-1PILE ?auto_118213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118222 - BLOCK
    )
    :vars
    (
      ?auto_118224 - BLOCK
      ?auto_118230 - BLOCK
      ?auto_118229 - BLOCK
      ?auto_118226 - BLOCK
      ?auto_118227 - BLOCK
      ?auto_118225 - BLOCK
      ?auto_118228 - BLOCK
      ?auto_118223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118222 ?auto_118224 ) ( not ( = ?auto_118222 ?auto_118224 ) ) ( not ( = ?auto_118222 ?auto_118230 ) ) ( not ( = ?auto_118222 ?auto_118229 ) ) ( not ( = ?auto_118224 ?auto_118230 ) ) ( not ( = ?auto_118224 ?auto_118229 ) ) ( not ( = ?auto_118230 ?auto_118229 ) ) ( ON ?auto_118230 ?auto_118222 ) ( ON-TABLE ?auto_118224 ) ( ON-TABLE ?auto_118226 ) ( ON ?auto_118227 ?auto_118226 ) ( ON ?auto_118225 ?auto_118227 ) ( not ( = ?auto_118226 ?auto_118227 ) ) ( not ( = ?auto_118226 ?auto_118225 ) ) ( not ( = ?auto_118226 ?auto_118228 ) ) ( not ( = ?auto_118226 ?auto_118223 ) ) ( not ( = ?auto_118226 ?auto_118229 ) ) ( not ( = ?auto_118227 ?auto_118225 ) ) ( not ( = ?auto_118227 ?auto_118228 ) ) ( not ( = ?auto_118227 ?auto_118223 ) ) ( not ( = ?auto_118227 ?auto_118229 ) ) ( not ( = ?auto_118225 ?auto_118228 ) ) ( not ( = ?auto_118225 ?auto_118223 ) ) ( not ( = ?auto_118225 ?auto_118229 ) ) ( not ( = ?auto_118228 ?auto_118223 ) ) ( not ( = ?auto_118228 ?auto_118229 ) ) ( not ( = ?auto_118223 ?auto_118229 ) ) ( not ( = ?auto_118222 ?auto_118223 ) ) ( not ( = ?auto_118222 ?auto_118226 ) ) ( not ( = ?auto_118222 ?auto_118227 ) ) ( not ( = ?auto_118222 ?auto_118225 ) ) ( not ( = ?auto_118222 ?auto_118228 ) ) ( not ( = ?auto_118224 ?auto_118223 ) ) ( not ( = ?auto_118224 ?auto_118226 ) ) ( not ( = ?auto_118224 ?auto_118227 ) ) ( not ( = ?auto_118224 ?auto_118225 ) ) ( not ( = ?auto_118224 ?auto_118228 ) ) ( not ( = ?auto_118230 ?auto_118223 ) ) ( not ( = ?auto_118230 ?auto_118226 ) ) ( not ( = ?auto_118230 ?auto_118227 ) ) ( not ( = ?auto_118230 ?auto_118225 ) ) ( not ( = ?auto_118230 ?auto_118228 ) ) ( ON ?auto_118229 ?auto_118230 ) ( ON ?auto_118223 ?auto_118229 ) ( CLEAR ?auto_118225 ) ( ON ?auto_118228 ?auto_118223 ) ( CLEAR ?auto_118228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118224 ?auto_118222 ?auto_118230 ?auto_118229 ?auto_118223 )
      ( MAKE-1PILE ?auto_118222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118231 - BLOCK
    )
    :vars
    (
      ?auto_118235 - BLOCK
      ?auto_118238 - BLOCK
      ?auto_118233 - BLOCK
      ?auto_118236 - BLOCK
      ?auto_118239 - BLOCK
      ?auto_118232 - BLOCK
      ?auto_118237 - BLOCK
      ?auto_118234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118231 ?auto_118235 ) ( not ( = ?auto_118231 ?auto_118235 ) ) ( not ( = ?auto_118231 ?auto_118238 ) ) ( not ( = ?auto_118231 ?auto_118233 ) ) ( not ( = ?auto_118235 ?auto_118238 ) ) ( not ( = ?auto_118235 ?auto_118233 ) ) ( not ( = ?auto_118238 ?auto_118233 ) ) ( ON ?auto_118238 ?auto_118231 ) ( ON-TABLE ?auto_118235 ) ( ON-TABLE ?auto_118236 ) ( ON ?auto_118239 ?auto_118236 ) ( not ( = ?auto_118236 ?auto_118239 ) ) ( not ( = ?auto_118236 ?auto_118232 ) ) ( not ( = ?auto_118236 ?auto_118237 ) ) ( not ( = ?auto_118236 ?auto_118234 ) ) ( not ( = ?auto_118236 ?auto_118233 ) ) ( not ( = ?auto_118239 ?auto_118232 ) ) ( not ( = ?auto_118239 ?auto_118237 ) ) ( not ( = ?auto_118239 ?auto_118234 ) ) ( not ( = ?auto_118239 ?auto_118233 ) ) ( not ( = ?auto_118232 ?auto_118237 ) ) ( not ( = ?auto_118232 ?auto_118234 ) ) ( not ( = ?auto_118232 ?auto_118233 ) ) ( not ( = ?auto_118237 ?auto_118234 ) ) ( not ( = ?auto_118237 ?auto_118233 ) ) ( not ( = ?auto_118234 ?auto_118233 ) ) ( not ( = ?auto_118231 ?auto_118234 ) ) ( not ( = ?auto_118231 ?auto_118236 ) ) ( not ( = ?auto_118231 ?auto_118239 ) ) ( not ( = ?auto_118231 ?auto_118232 ) ) ( not ( = ?auto_118231 ?auto_118237 ) ) ( not ( = ?auto_118235 ?auto_118234 ) ) ( not ( = ?auto_118235 ?auto_118236 ) ) ( not ( = ?auto_118235 ?auto_118239 ) ) ( not ( = ?auto_118235 ?auto_118232 ) ) ( not ( = ?auto_118235 ?auto_118237 ) ) ( not ( = ?auto_118238 ?auto_118234 ) ) ( not ( = ?auto_118238 ?auto_118236 ) ) ( not ( = ?auto_118238 ?auto_118239 ) ) ( not ( = ?auto_118238 ?auto_118232 ) ) ( not ( = ?auto_118238 ?auto_118237 ) ) ( ON ?auto_118233 ?auto_118238 ) ( ON ?auto_118234 ?auto_118233 ) ( ON ?auto_118237 ?auto_118234 ) ( CLEAR ?auto_118237 ) ( HOLDING ?auto_118232 ) ( CLEAR ?auto_118239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118236 ?auto_118239 ?auto_118232 )
      ( MAKE-1PILE ?auto_118231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118240 - BLOCK
    )
    :vars
    (
      ?auto_118242 - BLOCK
      ?auto_118248 - BLOCK
      ?auto_118246 - BLOCK
      ?auto_118247 - BLOCK
      ?auto_118241 - BLOCK
      ?auto_118243 - BLOCK
      ?auto_118245 - BLOCK
      ?auto_118244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118240 ?auto_118242 ) ( not ( = ?auto_118240 ?auto_118242 ) ) ( not ( = ?auto_118240 ?auto_118248 ) ) ( not ( = ?auto_118240 ?auto_118246 ) ) ( not ( = ?auto_118242 ?auto_118248 ) ) ( not ( = ?auto_118242 ?auto_118246 ) ) ( not ( = ?auto_118248 ?auto_118246 ) ) ( ON ?auto_118248 ?auto_118240 ) ( ON-TABLE ?auto_118242 ) ( ON-TABLE ?auto_118247 ) ( ON ?auto_118241 ?auto_118247 ) ( not ( = ?auto_118247 ?auto_118241 ) ) ( not ( = ?auto_118247 ?auto_118243 ) ) ( not ( = ?auto_118247 ?auto_118245 ) ) ( not ( = ?auto_118247 ?auto_118244 ) ) ( not ( = ?auto_118247 ?auto_118246 ) ) ( not ( = ?auto_118241 ?auto_118243 ) ) ( not ( = ?auto_118241 ?auto_118245 ) ) ( not ( = ?auto_118241 ?auto_118244 ) ) ( not ( = ?auto_118241 ?auto_118246 ) ) ( not ( = ?auto_118243 ?auto_118245 ) ) ( not ( = ?auto_118243 ?auto_118244 ) ) ( not ( = ?auto_118243 ?auto_118246 ) ) ( not ( = ?auto_118245 ?auto_118244 ) ) ( not ( = ?auto_118245 ?auto_118246 ) ) ( not ( = ?auto_118244 ?auto_118246 ) ) ( not ( = ?auto_118240 ?auto_118244 ) ) ( not ( = ?auto_118240 ?auto_118247 ) ) ( not ( = ?auto_118240 ?auto_118241 ) ) ( not ( = ?auto_118240 ?auto_118243 ) ) ( not ( = ?auto_118240 ?auto_118245 ) ) ( not ( = ?auto_118242 ?auto_118244 ) ) ( not ( = ?auto_118242 ?auto_118247 ) ) ( not ( = ?auto_118242 ?auto_118241 ) ) ( not ( = ?auto_118242 ?auto_118243 ) ) ( not ( = ?auto_118242 ?auto_118245 ) ) ( not ( = ?auto_118248 ?auto_118244 ) ) ( not ( = ?auto_118248 ?auto_118247 ) ) ( not ( = ?auto_118248 ?auto_118241 ) ) ( not ( = ?auto_118248 ?auto_118243 ) ) ( not ( = ?auto_118248 ?auto_118245 ) ) ( ON ?auto_118246 ?auto_118248 ) ( ON ?auto_118244 ?auto_118246 ) ( ON ?auto_118245 ?auto_118244 ) ( CLEAR ?auto_118241 ) ( ON ?auto_118243 ?auto_118245 ) ( CLEAR ?auto_118243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118242 ?auto_118240 ?auto_118248 ?auto_118246 ?auto_118244 ?auto_118245 )
      ( MAKE-1PILE ?auto_118240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118249 - BLOCK
    )
    :vars
    (
      ?auto_118257 - BLOCK
      ?auto_118255 - BLOCK
      ?auto_118251 - BLOCK
      ?auto_118254 - BLOCK
      ?auto_118256 - BLOCK
      ?auto_118252 - BLOCK
      ?auto_118253 - BLOCK
      ?auto_118250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118249 ?auto_118257 ) ( not ( = ?auto_118249 ?auto_118257 ) ) ( not ( = ?auto_118249 ?auto_118255 ) ) ( not ( = ?auto_118249 ?auto_118251 ) ) ( not ( = ?auto_118257 ?auto_118255 ) ) ( not ( = ?auto_118257 ?auto_118251 ) ) ( not ( = ?auto_118255 ?auto_118251 ) ) ( ON ?auto_118255 ?auto_118249 ) ( ON-TABLE ?auto_118257 ) ( ON-TABLE ?auto_118254 ) ( not ( = ?auto_118254 ?auto_118256 ) ) ( not ( = ?auto_118254 ?auto_118252 ) ) ( not ( = ?auto_118254 ?auto_118253 ) ) ( not ( = ?auto_118254 ?auto_118250 ) ) ( not ( = ?auto_118254 ?auto_118251 ) ) ( not ( = ?auto_118256 ?auto_118252 ) ) ( not ( = ?auto_118256 ?auto_118253 ) ) ( not ( = ?auto_118256 ?auto_118250 ) ) ( not ( = ?auto_118256 ?auto_118251 ) ) ( not ( = ?auto_118252 ?auto_118253 ) ) ( not ( = ?auto_118252 ?auto_118250 ) ) ( not ( = ?auto_118252 ?auto_118251 ) ) ( not ( = ?auto_118253 ?auto_118250 ) ) ( not ( = ?auto_118253 ?auto_118251 ) ) ( not ( = ?auto_118250 ?auto_118251 ) ) ( not ( = ?auto_118249 ?auto_118250 ) ) ( not ( = ?auto_118249 ?auto_118254 ) ) ( not ( = ?auto_118249 ?auto_118256 ) ) ( not ( = ?auto_118249 ?auto_118252 ) ) ( not ( = ?auto_118249 ?auto_118253 ) ) ( not ( = ?auto_118257 ?auto_118250 ) ) ( not ( = ?auto_118257 ?auto_118254 ) ) ( not ( = ?auto_118257 ?auto_118256 ) ) ( not ( = ?auto_118257 ?auto_118252 ) ) ( not ( = ?auto_118257 ?auto_118253 ) ) ( not ( = ?auto_118255 ?auto_118250 ) ) ( not ( = ?auto_118255 ?auto_118254 ) ) ( not ( = ?auto_118255 ?auto_118256 ) ) ( not ( = ?auto_118255 ?auto_118252 ) ) ( not ( = ?auto_118255 ?auto_118253 ) ) ( ON ?auto_118251 ?auto_118255 ) ( ON ?auto_118250 ?auto_118251 ) ( ON ?auto_118253 ?auto_118250 ) ( ON ?auto_118252 ?auto_118253 ) ( CLEAR ?auto_118252 ) ( HOLDING ?auto_118256 ) ( CLEAR ?auto_118254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118254 ?auto_118256 )
      ( MAKE-1PILE ?auto_118249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118258 - BLOCK
    )
    :vars
    (
      ?auto_118264 - BLOCK
      ?auto_118262 - BLOCK
      ?auto_118259 - BLOCK
      ?auto_118260 - BLOCK
      ?auto_118263 - BLOCK
      ?auto_118261 - BLOCK
      ?auto_118265 - BLOCK
      ?auto_118266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118258 ?auto_118264 ) ( not ( = ?auto_118258 ?auto_118264 ) ) ( not ( = ?auto_118258 ?auto_118262 ) ) ( not ( = ?auto_118258 ?auto_118259 ) ) ( not ( = ?auto_118264 ?auto_118262 ) ) ( not ( = ?auto_118264 ?auto_118259 ) ) ( not ( = ?auto_118262 ?auto_118259 ) ) ( ON ?auto_118262 ?auto_118258 ) ( ON-TABLE ?auto_118264 ) ( ON-TABLE ?auto_118260 ) ( not ( = ?auto_118260 ?auto_118263 ) ) ( not ( = ?auto_118260 ?auto_118261 ) ) ( not ( = ?auto_118260 ?auto_118265 ) ) ( not ( = ?auto_118260 ?auto_118266 ) ) ( not ( = ?auto_118260 ?auto_118259 ) ) ( not ( = ?auto_118263 ?auto_118261 ) ) ( not ( = ?auto_118263 ?auto_118265 ) ) ( not ( = ?auto_118263 ?auto_118266 ) ) ( not ( = ?auto_118263 ?auto_118259 ) ) ( not ( = ?auto_118261 ?auto_118265 ) ) ( not ( = ?auto_118261 ?auto_118266 ) ) ( not ( = ?auto_118261 ?auto_118259 ) ) ( not ( = ?auto_118265 ?auto_118266 ) ) ( not ( = ?auto_118265 ?auto_118259 ) ) ( not ( = ?auto_118266 ?auto_118259 ) ) ( not ( = ?auto_118258 ?auto_118266 ) ) ( not ( = ?auto_118258 ?auto_118260 ) ) ( not ( = ?auto_118258 ?auto_118263 ) ) ( not ( = ?auto_118258 ?auto_118261 ) ) ( not ( = ?auto_118258 ?auto_118265 ) ) ( not ( = ?auto_118264 ?auto_118266 ) ) ( not ( = ?auto_118264 ?auto_118260 ) ) ( not ( = ?auto_118264 ?auto_118263 ) ) ( not ( = ?auto_118264 ?auto_118261 ) ) ( not ( = ?auto_118264 ?auto_118265 ) ) ( not ( = ?auto_118262 ?auto_118266 ) ) ( not ( = ?auto_118262 ?auto_118260 ) ) ( not ( = ?auto_118262 ?auto_118263 ) ) ( not ( = ?auto_118262 ?auto_118261 ) ) ( not ( = ?auto_118262 ?auto_118265 ) ) ( ON ?auto_118259 ?auto_118262 ) ( ON ?auto_118266 ?auto_118259 ) ( ON ?auto_118265 ?auto_118266 ) ( ON ?auto_118261 ?auto_118265 ) ( CLEAR ?auto_118260 ) ( ON ?auto_118263 ?auto_118261 ) ( CLEAR ?auto_118263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118264 ?auto_118258 ?auto_118262 ?auto_118259 ?auto_118266 ?auto_118265 ?auto_118261 )
      ( MAKE-1PILE ?auto_118258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118267 - BLOCK
    )
    :vars
    (
      ?auto_118275 - BLOCK
      ?auto_118271 - BLOCK
      ?auto_118268 - BLOCK
      ?auto_118270 - BLOCK
      ?auto_118274 - BLOCK
      ?auto_118273 - BLOCK
      ?auto_118269 - BLOCK
      ?auto_118272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118267 ?auto_118275 ) ( not ( = ?auto_118267 ?auto_118275 ) ) ( not ( = ?auto_118267 ?auto_118271 ) ) ( not ( = ?auto_118267 ?auto_118268 ) ) ( not ( = ?auto_118275 ?auto_118271 ) ) ( not ( = ?auto_118275 ?auto_118268 ) ) ( not ( = ?auto_118271 ?auto_118268 ) ) ( ON ?auto_118271 ?auto_118267 ) ( ON-TABLE ?auto_118275 ) ( not ( = ?auto_118270 ?auto_118274 ) ) ( not ( = ?auto_118270 ?auto_118273 ) ) ( not ( = ?auto_118270 ?auto_118269 ) ) ( not ( = ?auto_118270 ?auto_118272 ) ) ( not ( = ?auto_118270 ?auto_118268 ) ) ( not ( = ?auto_118274 ?auto_118273 ) ) ( not ( = ?auto_118274 ?auto_118269 ) ) ( not ( = ?auto_118274 ?auto_118272 ) ) ( not ( = ?auto_118274 ?auto_118268 ) ) ( not ( = ?auto_118273 ?auto_118269 ) ) ( not ( = ?auto_118273 ?auto_118272 ) ) ( not ( = ?auto_118273 ?auto_118268 ) ) ( not ( = ?auto_118269 ?auto_118272 ) ) ( not ( = ?auto_118269 ?auto_118268 ) ) ( not ( = ?auto_118272 ?auto_118268 ) ) ( not ( = ?auto_118267 ?auto_118272 ) ) ( not ( = ?auto_118267 ?auto_118270 ) ) ( not ( = ?auto_118267 ?auto_118274 ) ) ( not ( = ?auto_118267 ?auto_118273 ) ) ( not ( = ?auto_118267 ?auto_118269 ) ) ( not ( = ?auto_118275 ?auto_118272 ) ) ( not ( = ?auto_118275 ?auto_118270 ) ) ( not ( = ?auto_118275 ?auto_118274 ) ) ( not ( = ?auto_118275 ?auto_118273 ) ) ( not ( = ?auto_118275 ?auto_118269 ) ) ( not ( = ?auto_118271 ?auto_118272 ) ) ( not ( = ?auto_118271 ?auto_118270 ) ) ( not ( = ?auto_118271 ?auto_118274 ) ) ( not ( = ?auto_118271 ?auto_118273 ) ) ( not ( = ?auto_118271 ?auto_118269 ) ) ( ON ?auto_118268 ?auto_118271 ) ( ON ?auto_118272 ?auto_118268 ) ( ON ?auto_118269 ?auto_118272 ) ( ON ?auto_118273 ?auto_118269 ) ( ON ?auto_118274 ?auto_118273 ) ( CLEAR ?auto_118274 ) ( HOLDING ?auto_118270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118270 )
      ( MAKE-1PILE ?auto_118267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118276 - BLOCK
    )
    :vars
    (
      ?auto_118278 - BLOCK
      ?auto_118282 - BLOCK
      ?auto_118277 - BLOCK
      ?auto_118279 - BLOCK
      ?auto_118283 - BLOCK
      ?auto_118280 - BLOCK
      ?auto_118281 - BLOCK
      ?auto_118284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118276 ?auto_118278 ) ( not ( = ?auto_118276 ?auto_118278 ) ) ( not ( = ?auto_118276 ?auto_118282 ) ) ( not ( = ?auto_118276 ?auto_118277 ) ) ( not ( = ?auto_118278 ?auto_118282 ) ) ( not ( = ?auto_118278 ?auto_118277 ) ) ( not ( = ?auto_118282 ?auto_118277 ) ) ( ON ?auto_118282 ?auto_118276 ) ( ON-TABLE ?auto_118278 ) ( not ( = ?auto_118279 ?auto_118283 ) ) ( not ( = ?auto_118279 ?auto_118280 ) ) ( not ( = ?auto_118279 ?auto_118281 ) ) ( not ( = ?auto_118279 ?auto_118284 ) ) ( not ( = ?auto_118279 ?auto_118277 ) ) ( not ( = ?auto_118283 ?auto_118280 ) ) ( not ( = ?auto_118283 ?auto_118281 ) ) ( not ( = ?auto_118283 ?auto_118284 ) ) ( not ( = ?auto_118283 ?auto_118277 ) ) ( not ( = ?auto_118280 ?auto_118281 ) ) ( not ( = ?auto_118280 ?auto_118284 ) ) ( not ( = ?auto_118280 ?auto_118277 ) ) ( not ( = ?auto_118281 ?auto_118284 ) ) ( not ( = ?auto_118281 ?auto_118277 ) ) ( not ( = ?auto_118284 ?auto_118277 ) ) ( not ( = ?auto_118276 ?auto_118284 ) ) ( not ( = ?auto_118276 ?auto_118279 ) ) ( not ( = ?auto_118276 ?auto_118283 ) ) ( not ( = ?auto_118276 ?auto_118280 ) ) ( not ( = ?auto_118276 ?auto_118281 ) ) ( not ( = ?auto_118278 ?auto_118284 ) ) ( not ( = ?auto_118278 ?auto_118279 ) ) ( not ( = ?auto_118278 ?auto_118283 ) ) ( not ( = ?auto_118278 ?auto_118280 ) ) ( not ( = ?auto_118278 ?auto_118281 ) ) ( not ( = ?auto_118282 ?auto_118284 ) ) ( not ( = ?auto_118282 ?auto_118279 ) ) ( not ( = ?auto_118282 ?auto_118283 ) ) ( not ( = ?auto_118282 ?auto_118280 ) ) ( not ( = ?auto_118282 ?auto_118281 ) ) ( ON ?auto_118277 ?auto_118282 ) ( ON ?auto_118284 ?auto_118277 ) ( ON ?auto_118281 ?auto_118284 ) ( ON ?auto_118280 ?auto_118281 ) ( ON ?auto_118283 ?auto_118280 ) ( ON ?auto_118279 ?auto_118283 ) ( CLEAR ?auto_118279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118278 ?auto_118276 ?auto_118282 ?auto_118277 ?auto_118284 ?auto_118281 ?auto_118280 ?auto_118283 )
      ( MAKE-1PILE ?auto_118276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118298 - BLOCK
      ?auto_118299 - BLOCK
      ?auto_118300 - BLOCK
      ?auto_118301 - BLOCK
      ?auto_118302 - BLOCK
      ?auto_118303 - BLOCK
    )
    :vars
    (
      ?auto_118304 - BLOCK
      ?auto_118305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118304 ?auto_118303 ) ( CLEAR ?auto_118304 ) ( ON-TABLE ?auto_118298 ) ( ON ?auto_118299 ?auto_118298 ) ( ON ?auto_118300 ?auto_118299 ) ( ON ?auto_118301 ?auto_118300 ) ( ON ?auto_118302 ?auto_118301 ) ( ON ?auto_118303 ?auto_118302 ) ( not ( = ?auto_118298 ?auto_118299 ) ) ( not ( = ?auto_118298 ?auto_118300 ) ) ( not ( = ?auto_118298 ?auto_118301 ) ) ( not ( = ?auto_118298 ?auto_118302 ) ) ( not ( = ?auto_118298 ?auto_118303 ) ) ( not ( = ?auto_118298 ?auto_118304 ) ) ( not ( = ?auto_118299 ?auto_118300 ) ) ( not ( = ?auto_118299 ?auto_118301 ) ) ( not ( = ?auto_118299 ?auto_118302 ) ) ( not ( = ?auto_118299 ?auto_118303 ) ) ( not ( = ?auto_118299 ?auto_118304 ) ) ( not ( = ?auto_118300 ?auto_118301 ) ) ( not ( = ?auto_118300 ?auto_118302 ) ) ( not ( = ?auto_118300 ?auto_118303 ) ) ( not ( = ?auto_118300 ?auto_118304 ) ) ( not ( = ?auto_118301 ?auto_118302 ) ) ( not ( = ?auto_118301 ?auto_118303 ) ) ( not ( = ?auto_118301 ?auto_118304 ) ) ( not ( = ?auto_118302 ?auto_118303 ) ) ( not ( = ?auto_118302 ?auto_118304 ) ) ( not ( = ?auto_118303 ?auto_118304 ) ) ( HOLDING ?auto_118305 ) ( not ( = ?auto_118298 ?auto_118305 ) ) ( not ( = ?auto_118299 ?auto_118305 ) ) ( not ( = ?auto_118300 ?auto_118305 ) ) ( not ( = ?auto_118301 ?auto_118305 ) ) ( not ( = ?auto_118302 ?auto_118305 ) ) ( not ( = ?auto_118303 ?auto_118305 ) ) ( not ( = ?auto_118304 ?auto_118305 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_118305 )
      ( MAKE-6PILE ?auto_118298 ?auto_118299 ?auto_118300 ?auto_118301 ?auto_118302 ?auto_118303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118423 - BLOCK
      ?auto_118424 - BLOCK
    )
    :vars
    (
      ?auto_118425 - BLOCK
      ?auto_118430 - BLOCK
      ?auto_118428 - BLOCK
      ?auto_118429 - BLOCK
      ?auto_118426 - BLOCK
      ?auto_118427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118423 ?auto_118424 ) ) ( ON ?auto_118424 ?auto_118425 ) ( not ( = ?auto_118423 ?auto_118425 ) ) ( not ( = ?auto_118424 ?auto_118425 ) ) ( ON ?auto_118423 ?auto_118424 ) ( CLEAR ?auto_118423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118430 ) ( ON ?auto_118428 ?auto_118430 ) ( ON ?auto_118429 ?auto_118428 ) ( ON ?auto_118426 ?auto_118429 ) ( ON ?auto_118427 ?auto_118426 ) ( ON ?auto_118425 ?auto_118427 ) ( not ( = ?auto_118430 ?auto_118428 ) ) ( not ( = ?auto_118430 ?auto_118429 ) ) ( not ( = ?auto_118430 ?auto_118426 ) ) ( not ( = ?auto_118430 ?auto_118427 ) ) ( not ( = ?auto_118430 ?auto_118425 ) ) ( not ( = ?auto_118430 ?auto_118424 ) ) ( not ( = ?auto_118430 ?auto_118423 ) ) ( not ( = ?auto_118428 ?auto_118429 ) ) ( not ( = ?auto_118428 ?auto_118426 ) ) ( not ( = ?auto_118428 ?auto_118427 ) ) ( not ( = ?auto_118428 ?auto_118425 ) ) ( not ( = ?auto_118428 ?auto_118424 ) ) ( not ( = ?auto_118428 ?auto_118423 ) ) ( not ( = ?auto_118429 ?auto_118426 ) ) ( not ( = ?auto_118429 ?auto_118427 ) ) ( not ( = ?auto_118429 ?auto_118425 ) ) ( not ( = ?auto_118429 ?auto_118424 ) ) ( not ( = ?auto_118429 ?auto_118423 ) ) ( not ( = ?auto_118426 ?auto_118427 ) ) ( not ( = ?auto_118426 ?auto_118425 ) ) ( not ( = ?auto_118426 ?auto_118424 ) ) ( not ( = ?auto_118426 ?auto_118423 ) ) ( not ( = ?auto_118427 ?auto_118425 ) ) ( not ( = ?auto_118427 ?auto_118424 ) ) ( not ( = ?auto_118427 ?auto_118423 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118430 ?auto_118428 ?auto_118429 ?auto_118426 ?auto_118427 ?auto_118425 ?auto_118424 )
      ( MAKE-2PILE ?auto_118423 ?auto_118424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118433 - BLOCK
      ?auto_118434 - BLOCK
    )
    :vars
    (
      ?auto_118435 - BLOCK
      ?auto_118436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118433 ?auto_118434 ) ) ( ON ?auto_118434 ?auto_118435 ) ( CLEAR ?auto_118434 ) ( not ( = ?auto_118433 ?auto_118435 ) ) ( not ( = ?auto_118434 ?auto_118435 ) ) ( ON ?auto_118433 ?auto_118436 ) ( CLEAR ?auto_118433 ) ( HAND-EMPTY ) ( not ( = ?auto_118433 ?auto_118436 ) ) ( not ( = ?auto_118434 ?auto_118436 ) ) ( not ( = ?auto_118435 ?auto_118436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118433 ?auto_118436 )
      ( MAKE-2PILE ?auto_118433 ?auto_118434 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118437 - BLOCK
      ?auto_118438 - BLOCK
    )
    :vars
    (
      ?auto_118439 - BLOCK
      ?auto_118440 - BLOCK
      ?auto_118441 - BLOCK
      ?auto_118443 - BLOCK
      ?auto_118442 - BLOCK
      ?auto_118445 - BLOCK
      ?auto_118444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118437 ?auto_118438 ) ) ( not ( = ?auto_118437 ?auto_118439 ) ) ( not ( = ?auto_118438 ?auto_118439 ) ) ( ON ?auto_118437 ?auto_118440 ) ( CLEAR ?auto_118437 ) ( not ( = ?auto_118437 ?auto_118440 ) ) ( not ( = ?auto_118438 ?auto_118440 ) ) ( not ( = ?auto_118439 ?auto_118440 ) ) ( HOLDING ?auto_118438 ) ( CLEAR ?auto_118439 ) ( ON-TABLE ?auto_118441 ) ( ON ?auto_118443 ?auto_118441 ) ( ON ?auto_118442 ?auto_118443 ) ( ON ?auto_118445 ?auto_118442 ) ( ON ?auto_118444 ?auto_118445 ) ( ON ?auto_118439 ?auto_118444 ) ( not ( = ?auto_118441 ?auto_118443 ) ) ( not ( = ?auto_118441 ?auto_118442 ) ) ( not ( = ?auto_118441 ?auto_118445 ) ) ( not ( = ?auto_118441 ?auto_118444 ) ) ( not ( = ?auto_118441 ?auto_118439 ) ) ( not ( = ?auto_118441 ?auto_118438 ) ) ( not ( = ?auto_118443 ?auto_118442 ) ) ( not ( = ?auto_118443 ?auto_118445 ) ) ( not ( = ?auto_118443 ?auto_118444 ) ) ( not ( = ?auto_118443 ?auto_118439 ) ) ( not ( = ?auto_118443 ?auto_118438 ) ) ( not ( = ?auto_118442 ?auto_118445 ) ) ( not ( = ?auto_118442 ?auto_118444 ) ) ( not ( = ?auto_118442 ?auto_118439 ) ) ( not ( = ?auto_118442 ?auto_118438 ) ) ( not ( = ?auto_118445 ?auto_118444 ) ) ( not ( = ?auto_118445 ?auto_118439 ) ) ( not ( = ?auto_118445 ?auto_118438 ) ) ( not ( = ?auto_118444 ?auto_118439 ) ) ( not ( = ?auto_118444 ?auto_118438 ) ) ( not ( = ?auto_118437 ?auto_118441 ) ) ( not ( = ?auto_118437 ?auto_118443 ) ) ( not ( = ?auto_118437 ?auto_118442 ) ) ( not ( = ?auto_118437 ?auto_118445 ) ) ( not ( = ?auto_118437 ?auto_118444 ) ) ( not ( = ?auto_118440 ?auto_118441 ) ) ( not ( = ?auto_118440 ?auto_118443 ) ) ( not ( = ?auto_118440 ?auto_118442 ) ) ( not ( = ?auto_118440 ?auto_118445 ) ) ( not ( = ?auto_118440 ?auto_118444 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118441 ?auto_118443 ?auto_118442 ?auto_118445 ?auto_118444 ?auto_118439 ?auto_118438 )
      ( MAKE-2PILE ?auto_118437 ?auto_118438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118446 - BLOCK
      ?auto_118447 - BLOCK
    )
    :vars
    (
      ?auto_118449 - BLOCK
      ?auto_118451 - BLOCK
      ?auto_118454 - BLOCK
      ?auto_118450 - BLOCK
      ?auto_118448 - BLOCK
      ?auto_118452 - BLOCK
      ?auto_118453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118446 ?auto_118447 ) ) ( not ( = ?auto_118446 ?auto_118449 ) ) ( not ( = ?auto_118447 ?auto_118449 ) ) ( ON ?auto_118446 ?auto_118451 ) ( not ( = ?auto_118446 ?auto_118451 ) ) ( not ( = ?auto_118447 ?auto_118451 ) ) ( not ( = ?auto_118449 ?auto_118451 ) ) ( CLEAR ?auto_118449 ) ( ON-TABLE ?auto_118454 ) ( ON ?auto_118450 ?auto_118454 ) ( ON ?auto_118448 ?auto_118450 ) ( ON ?auto_118452 ?auto_118448 ) ( ON ?auto_118453 ?auto_118452 ) ( ON ?auto_118449 ?auto_118453 ) ( not ( = ?auto_118454 ?auto_118450 ) ) ( not ( = ?auto_118454 ?auto_118448 ) ) ( not ( = ?auto_118454 ?auto_118452 ) ) ( not ( = ?auto_118454 ?auto_118453 ) ) ( not ( = ?auto_118454 ?auto_118449 ) ) ( not ( = ?auto_118454 ?auto_118447 ) ) ( not ( = ?auto_118450 ?auto_118448 ) ) ( not ( = ?auto_118450 ?auto_118452 ) ) ( not ( = ?auto_118450 ?auto_118453 ) ) ( not ( = ?auto_118450 ?auto_118449 ) ) ( not ( = ?auto_118450 ?auto_118447 ) ) ( not ( = ?auto_118448 ?auto_118452 ) ) ( not ( = ?auto_118448 ?auto_118453 ) ) ( not ( = ?auto_118448 ?auto_118449 ) ) ( not ( = ?auto_118448 ?auto_118447 ) ) ( not ( = ?auto_118452 ?auto_118453 ) ) ( not ( = ?auto_118452 ?auto_118449 ) ) ( not ( = ?auto_118452 ?auto_118447 ) ) ( not ( = ?auto_118453 ?auto_118449 ) ) ( not ( = ?auto_118453 ?auto_118447 ) ) ( not ( = ?auto_118446 ?auto_118454 ) ) ( not ( = ?auto_118446 ?auto_118450 ) ) ( not ( = ?auto_118446 ?auto_118448 ) ) ( not ( = ?auto_118446 ?auto_118452 ) ) ( not ( = ?auto_118446 ?auto_118453 ) ) ( not ( = ?auto_118451 ?auto_118454 ) ) ( not ( = ?auto_118451 ?auto_118450 ) ) ( not ( = ?auto_118451 ?auto_118448 ) ) ( not ( = ?auto_118451 ?auto_118452 ) ) ( not ( = ?auto_118451 ?auto_118453 ) ) ( ON ?auto_118447 ?auto_118446 ) ( CLEAR ?auto_118447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118451 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118451 ?auto_118446 )
      ( MAKE-2PILE ?auto_118446 ?auto_118447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118455 - BLOCK
      ?auto_118456 - BLOCK
    )
    :vars
    (
      ?auto_118460 - BLOCK
      ?auto_118462 - BLOCK
      ?auto_118457 - BLOCK
      ?auto_118459 - BLOCK
      ?auto_118458 - BLOCK
      ?auto_118461 - BLOCK
      ?auto_118463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118455 ?auto_118456 ) ) ( not ( = ?auto_118455 ?auto_118460 ) ) ( not ( = ?auto_118456 ?auto_118460 ) ) ( ON ?auto_118455 ?auto_118462 ) ( not ( = ?auto_118455 ?auto_118462 ) ) ( not ( = ?auto_118456 ?auto_118462 ) ) ( not ( = ?auto_118460 ?auto_118462 ) ) ( ON-TABLE ?auto_118457 ) ( ON ?auto_118459 ?auto_118457 ) ( ON ?auto_118458 ?auto_118459 ) ( ON ?auto_118461 ?auto_118458 ) ( ON ?auto_118463 ?auto_118461 ) ( not ( = ?auto_118457 ?auto_118459 ) ) ( not ( = ?auto_118457 ?auto_118458 ) ) ( not ( = ?auto_118457 ?auto_118461 ) ) ( not ( = ?auto_118457 ?auto_118463 ) ) ( not ( = ?auto_118457 ?auto_118460 ) ) ( not ( = ?auto_118457 ?auto_118456 ) ) ( not ( = ?auto_118459 ?auto_118458 ) ) ( not ( = ?auto_118459 ?auto_118461 ) ) ( not ( = ?auto_118459 ?auto_118463 ) ) ( not ( = ?auto_118459 ?auto_118460 ) ) ( not ( = ?auto_118459 ?auto_118456 ) ) ( not ( = ?auto_118458 ?auto_118461 ) ) ( not ( = ?auto_118458 ?auto_118463 ) ) ( not ( = ?auto_118458 ?auto_118460 ) ) ( not ( = ?auto_118458 ?auto_118456 ) ) ( not ( = ?auto_118461 ?auto_118463 ) ) ( not ( = ?auto_118461 ?auto_118460 ) ) ( not ( = ?auto_118461 ?auto_118456 ) ) ( not ( = ?auto_118463 ?auto_118460 ) ) ( not ( = ?auto_118463 ?auto_118456 ) ) ( not ( = ?auto_118455 ?auto_118457 ) ) ( not ( = ?auto_118455 ?auto_118459 ) ) ( not ( = ?auto_118455 ?auto_118458 ) ) ( not ( = ?auto_118455 ?auto_118461 ) ) ( not ( = ?auto_118455 ?auto_118463 ) ) ( not ( = ?auto_118462 ?auto_118457 ) ) ( not ( = ?auto_118462 ?auto_118459 ) ) ( not ( = ?auto_118462 ?auto_118458 ) ) ( not ( = ?auto_118462 ?auto_118461 ) ) ( not ( = ?auto_118462 ?auto_118463 ) ) ( ON ?auto_118456 ?auto_118455 ) ( CLEAR ?auto_118456 ) ( ON-TABLE ?auto_118462 ) ( HOLDING ?auto_118460 ) ( CLEAR ?auto_118463 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118457 ?auto_118459 ?auto_118458 ?auto_118461 ?auto_118463 ?auto_118460 )
      ( MAKE-2PILE ?auto_118455 ?auto_118456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118464 - BLOCK
      ?auto_118465 - BLOCK
    )
    :vars
    (
      ?auto_118469 - BLOCK
      ?auto_118467 - BLOCK
      ?auto_118466 - BLOCK
      ?auto_118470 - BLOCK
      ?auto_118472 - BLOCK
      ?auto_118471 - BLOCK
      ?auto_118468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118464 ?auto_118465 ) ) ( not ( = ?auto_118464 ?auto_118469 ) ) ( not ( = ?auto_118465 ?auto_118469 ) ) ( ON ?auto_118464 ?auto_118467 ) ( not ( = ?auto_118464 ?auto_118467 ) ) ( not ( = ?auto_118465 ?auto_118467 ) ) ( not ( = ?auto_118469 ?auto_118467 ) ) ( ON-TABLE ?auto_118466 ) ( ON ?auto_118470 ?auto_118466 ) ( ON ?auto_118472 ?auto_118470 ) ( ON ?auto_118471 ?auto_118472 ) ( ON ?auto_118468 ?auto_118471 ) ( not ( = ?auto_118466 ?auto_118470 ) ) ( not ( = ?auto_118466 ?auto_118472 ) ) ( not ( = ?auto_118466 ?auto_118471 ) ) ( not ( = ?auto_118466 ?auto_118468 ) ) ( not ( = ?auto_118466 ?auto_118469 ) ) ( not ( = ?auto_118466 ?auto_118465 ) ) ( not ( = ?auto_118470 ?auto_118472 ) ) ( not ( = ?auto_118470 ?auto_118471 ) ) ( not ( = ?auto_118470 ?auto_118468 ) ) ( not ( = ?auto_118470 ?auto_118469 ) ) ( not ( = ?auto_118470 ?auto_118465 ) ) ( not ( = ?auto_118472 ?auto_118471 ) ) ( not ( = ?auto_118472 ?auto_118468 ) ) ( not ( = ?auto_118472 ?auto_118469 ) ) ( not ( = ?auto_118472 ?auto_118465 ) ) ( not ( = ?auto_118471 ?auto_118468 ) ) ( not ( = ?auto_118471 ?auto_118469 ) ) ( not ( = ?auto_118471 ?auto_118465 ) ) ( not ( = ?auto_118468 ?auto_118469 ) ) ( not ( = ?auto_118468 ?auto_118465 ) ) ( not ( = ?auto_118464 ?auto_118466 ) ) ( not ( = ?auto_118464 ?auto_118470 ) ) ( not ( = ?auto_118464 ?auto_118472 ) ) ( not ( = ?auto_118464 ?auto_118471 ) ) ( not ( = ?auto_118464 ?auto_118468 ) ) ( not ( = ?auto_118467 ?auto_118466 ) ) ( not ( = ?auto_118467 ?auto_118470 ) ) ( not ( = ?auto_118467 ?auto_118472 ) ) ( not ( = ?auto_118467 ?auto_118471 ) ) ( not ( = ?auto_118467 ?auto_118468 ) ) ( ON ?auto_118465 ?auto_118464 ) ( ON-TABLE ?auto_118467 ) ( CLEAR ?auto_118468 ) ( ON ?auto_118469 ?auto_118465 ) ( CLEAR ?auto_118469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118467 ?auto_118464 ?auto_118465 )
      ( MAKE-2PILE ?auto_118464 ?auto_118465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118473 - BLOCK
      ?auto_118474 - BLOCK
    )
    :vars
    (
      ?auto_118477 - BLOCK
      ?auto_118481 - BLOCK
      ?auto_118475 - BLOCK
      ?auto_118476 - BLOCK
      ?auto_118480 - BLOCK
      ?auto_118479 - BLOCK
      ?auto_118478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118473 ?auto_118474 ) ) ( not ( = ?auto_118473 ?auto_118477 ) ) ( not ( = ?auto_118474 ?auto_118477 ) ) ( ON ?auto_118473 ?auto_118481 ) ( not ( = ?auto_118473 ?auto_118481 ) ) ( not ( = ?auto_118474 ?auto_118481 ) ) ( not ( = ?auto_118477 ?auto_118481 ) ) ( ON-TABLE ?auto_118475 ) ( ON ?auto_118476 ?auto_118475 ) ( ON ?auto_118480 ?auto_118476 ) ( ON ?auto_118479 ?auto_118480 ) ( not ( = ?auto_118475 ?auto_118476 ) ) ( not ( = ?auto_118475 ?auto_118480 ) ) ( not ( = ?auto_118475 ?auto_118479 ) ) ( not ( = ?auto_118475 ?auto_118478 ) ) ( not ( = ?auto_118475 ?auto_118477 ) ) ( not ( = ?auto_118475 ?auto_118474 ) ) ( not ( = ?auto_118476 ?auto_118480 ) ) ( not ( = ?auto_118476 ?auto_118479 ) ) ( not ( = ?auto_118476 ?auto_118478 ) ) ( not ( = ?auto_118476 ?auto_118477 ) ) ( not ( = ?auto_118476 ?auto_118474 ) ) ( not ( = ?auto_118480 ?auto_118479 ) ) ( not ( = ?auto_118480 ?auto_118478 ) ) ( not ( = ?auto_118480 ?auto_118477 ) ) ( not ( = ?auto_118480 ?auto_118474 ) ) ( not ( = ?auto_118479 ?auto_118478 ) ) ( not ( = ?auto_118479 ?auto_118477 ) ) ( not ( = ?auto_118479 ?auto_118474 ) ) ( not ( = ?auto_118478 ?auto_118477 ) ) ( not ( = ?auto_118478 ?auto_118474 ) ) ( not ( = ?auto_118473 ?auto_118475 ) ) ( not ( = ?auto_118473 ?auto_118476 ) ) ( not ( = ?auto_118473 ?auto_118480 ) ) ( not ( = ?auto_118473 ?auto_118479 ) ) ( not ( = ?auto_118473 ?auto_118478 ) ) ( not ( = ?auto_118481 ?auto_118475 ) ) ( not ( = ?auto_118481 ?auto_118476 ) ) ( not ( = ?auto_118481 ?auto_118480 ) ) ( not ( = ?auto_118481 ?auto_118479 ) ) ( not ( = ?auto_118481 ?auto_118478 ) ) ( ON ?auto_118474 ?auto_118473 ) ( ON-TABLE ?auto_118481 ) ( ON ?auto_118477 ?auto_118474 ) ( CLEAR ?auto_118477 ) ( HOLDING ?auto_118478 ) ( CLEAR ?auto_118479 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118475 ?auto_118476 ?auto_118480 ?auto_118479 ?auto_118478 )
      ( MAKE-2PILE ?auto_118473 ?auto_118474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118482 - BLOCK
      ?auto_118483 - BLOCK
    )
    :vars
    (
      ?auto_118487 - BLOCK
      ?auto_118485 - BLOCK
      ?auto_118488 - BLOCK
      ?auto_118484 - BLOCK
      ?auto_118489 - BLOCK
      ?auto_118490 - BLOCK
      ?auto_118486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118482 ?auto_118483 ) ) ( not ( = ?auto_118482 ?auto_118487 ) ) ( not ( = ?auto_118483 ?auto_118487 ) ) ( ON ?auto_118482 ?auto_118485 ) ( not ( = ?auto_118482 ?auto_118485 ) ) ( not ( = ?auto_118483 ?auto_118485 ) ) ( not ( = ?auto_118487 ?auto_118485 ) ) ( ON-TABLE ?auto_118488 ) ( ON ?auto_118484 ?auto_118488 ) ( ON ?auto_118489 ?auto_118484 ) ( ON ?auto_118490 ?auto_118489 ) ( not ( = ?auto_118488 ?auto_118484 ) ) ( not ( = ?auto_118488 ?auto_118489 ) ) ( not ( = ?auto_118488 ?auto_118490 ) ) ( not ( = ?auto_118488 ?auto_118486 ) ) ( not ( = ?auto_118488 ?auto_118487 ) ) ( not ( = ?auto_118488 ?auto_118483 ) ) ( not ( = ?auto_118484 ?auto_118489 ) ) ( not ( = ?auto_118484 ?auto_118490 ) ) ( not ( = ?auto_118484 ?auto_118486 ) ) ( not ( = ?auto_118484 ?auto_118487 ) ) ( not ( = ?auto_118484 ?auto_118483 ) ) ( not ( = ?auto_118489 ?auto_118490 ) ) ( not ( = ?auto_118489 ?auto_118486 ) ) ( not ( = ?auto_118489 ?auto_118487 ) ) ( not ( = ?auto_118489 ?auto_118483 ) ) ( not ( = ?auto_118490 ?auto_118486 ) ) ( not ( = ?auto_118490 ?auto_118487 ) ) ( not ( = ?auto_118490 ?auto_118483 ) ) ( not ( = ?auto_118486 ?auto_118487 ) ) ( not ( = ?auto_118486 ?auto_118483 ) ) ( not ( = ?auto_118482 ?auto_118488 ) ) ( not ( = ?auto_118482 ?auto_118484 ) ) ( not ( = ?auto_118482 ?auto_118489 ) ) ( not ( = ?auto_118482 ?auto_118490 ) ) ( not ( = ?auto_118482 ?auto_118486 ) ) ( not ( = ?auto_118485 ?auto_118488 ) ) ( not ( = ?auto_118485 ?auto_118484 ) ) ( not ( = ?auto_118485 ?auto_118489 ) ) ( not ( = ?auto_118485 ?auto_118490 ) ) ( not ( = ?auto_118485 ?auto_118486 ) ) ( ON ?auto_118483 ?auto_118482 ) ( ON-TABLE ?auto_118485 ) ( ON ?auto_118487 ?auto_118483 ) ( CLEAR ?auto_118490 ) ( ON ?auto_118486 ?auto_118487 ) ( CLEAR ?auto_118486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118485 ?auto_118482 ?auto_118483 ?auto_118487 )
      ( MAKE-2PILE ?auto_118482 ?auto_118483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118491 - BLOCK
      ?auto_118492 - BLOCK
    )
    :vars
    (
      ?auto_118494 - BLOCK
      ?auto_118495 - BLOCK
      ?auto_118497 - BLOCK
      ?auto_118496 - BLOCK
      ?auto_118498 - BLOCK
      ?auto_118499 - BLOCK
      ?auto_118493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118491 ?auto_118492 ) ) ( not ( = ?auto_118491 ?auto_118494 ) ) ( not ( = ?auto_118492 ?auto_118494 ) ) ( ON ?auto_118491 ?auto_118495 ) ( not ( = ?auto_118491 ?auto_118495 ) ) ( not ( = ?auto_118492 ?auto_118495 ) ) ( not ( = ?auto_118494 ?auto_118495 ) ) ( ON-TABLE ?auto_118497 ) ( ON ?auto_118496 ?auto_118497 ) ( ON ?auto_118498 ?auto_118496 ) ( not ( = ?auto_118497 ?auto_118496 ) ) ( not ( = ?auto_118497 ?auto_118498 ) ) ( not ( = ?auto_118497 ?auto_118499 ) ) ( not ( = ?auto_118497 ?auto_118493 ) ) ( not ( = ?auto_118497 ?auto_118494 ) ) ( not ( = ?auto_118497 ?auto_118492 ) ) ( not ( = ?auto_118496 ?auto_118498 ) ) ( not ( = ?auto_118496 ?auto_118499 ) ) ( not ( = ?auto_118496 ?auto_118493 ) ) ( not ( = ?auto_118496 ?auto_118494 ) ) ( not ( = ?auto_118496 ?auto_118492 ) ) ( not ( = ?auto_118498 ?auto_118499 ) ) ( not ( = ?auto_118498 ?auto_118493 ) ) ( not ( = ?auto_118498 ?auto_118494 ) ) ( not ( = ?auto_118498 ?auto_118492 ) ) ( not ( = ?auto_118499 ?auto_118493 ) ) ( not ( = ?auto_118499 ?auto_118494 ) ) ( not ( = ?auto_118499 ?auto_118492 ) ) ( not ( = ?auto_118493 ?auto_118494 ) ) ( not ( = ?auto_118493 ?auto_118492 ) ) ( not ( = ?auto_118491 ?auto_118497 ) ) ( not ( = ?auto_118491 ?auto_118496 ) ) ( not ( = ?auto_118491 ?auto_118498 ) ) ( not ( = ?auto_118491 ?auto_118499 ) ) ( not ( = ?auto_118491 ?auto_118493 ) ) ( not ( = ?auto_118495 ?auto_118497 ) ) ( not ( = ?auto_118495 ?auto_118496 ) ) ( not ( = ?auto_118495 ?auto_118498 ) ) ( not ( = ?auto_118495 ?auto_118499 ) ) ( not ( = ?auto_118495 ?auto_118493 ) ) ( ON ?auto_118492 ?auto_118491 ) ( ON-TABLE ?auto_118495 ) ( ON ?auto_118494 ?auto_118492 ) ( ON ?auto_118493 ?auto_118494 ) ( CLEAR ?auto_118493 ) ( HOLDING ?auto_118499 ) ( CLEAR ?auto_118498 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118497 ?auto_118496 ?auto_118498 ?auto_118499 )
      ( MAKE-2PILE ?auto_118491 ?auto_118492 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118500 - BLOCK
      ?auto_118501 - BLOCK
    )
    :vars
    (
      ?auto_118505 - BLOCK
      ?auto_118503 - BLOCK
      ?auto_118504 - BLOCK
      ?auto_118502 - BLOCK
      ?auto_118508 - BLOCK
      ?auto_118506 - BLOCK
      ?auto_118507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118500 ?auto_118501 ) ) ( not ( = ?auto_118500 ?auto_118505 ) ) ( not ( = ?auto_118501 ?auto_118505 ) ) ( ON ?auto_118500 ?auto_118503 ) ( not ( = ?auto_118500 ?auto_118503 ) ) ( not ( = ?auto_118501 ?auto_118503 ) ) ( not ( = ?auto_118505 ?auto_118503 ) ) ( ON-TABLE ?auto_118504 ) ( ON ?auto_118502 ?auto_118504 ) ( ON ?auto_118508 ?auto_118502 ) ( not ( = ?auto_118504 ?auto_118502 ) ) ( not ( = ?auto_118504 ?auto_118508 ) ) ( not ( = ?auto_118504 ?auto_118506 ) ) ( not ( = ?auto_118504 ?auto_118507 ) ) ( not ( = ?auto_118504 ?auto_118505 ) ) ( not ( = ?auto_118504 ?auto_118501 ) ) ( not ( = ?auto_118502 ?auto_118508 ) ) ( not ( = ?auto_118502 ?auto_118506 ) ) ( not ( = ?auto_118502 ?auto_118507 ) ) ( not ( = ?auto_118502 ?auto_118505 ) ) ( not ( = ?auto_118502 ?auto_118501 ) ) ( not ( = ?auto_118508 ?auto_118506 ) ) ( not ( = ?auto_118508 ?auto_118507 ) ) ( not ( = ?auto_118508 ?auto_118505 ) ) ( not ( = ?auto_118508 ?auto_118501 ) ) ( not ( = ?auto_118506 ?auto_118507 ) ) ( not ( = ?auto_118506 ?auto_118505 ) ) ( not ( = ?auto_118506 ?auto_118501 ) ) ( not ( = ?auto_118507 ?auto_118505 ) ) ( not ( = ?auto_118507 ?auto_118501 ) ) ( not ( = ?auto_118500 ?auto_118504 ) ) ( not ( = ?auto_118500 ?auto_118502 ) ) ( not ( = ?auto_118500 ?auto_118508 ) ) ( not ( = ?auto_118500 ?auto_118506 ) ) ( not ( = ?auto_118500 ?auto_118507 ) ) ( not ( = ?auto_118503 ?auto_118504 ) ) ( not ( = ?auto_118503 ?auto_118502 ) ) ( not ( = ?auto_118503 ?auto_118508 ) ) ( not ( = ?auto_118503 ?auto_118506 ) ) ( not ( = ?auto_118503 ?auto_118507 ) ) ( ON ?auto_118501 ?auto_118500 ) ( ON-TABLE ?auto_118503 ) ( ON ?auto_118505 ?auto_118501 ) ( ON ?auto_118507 ?auto_118505 ) ( CLEAR ?auto_118508 ) ( ON ?auto_118506 ?auto_118507 ) ( CLEAR ?auto_118506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118503 ?auto_118500 ?auto_118501 ?auto_118505 ?auto_118507 )
      ( MAKE-2PILE ?auto_118500 ?auto_118501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118509 - BLOCK
      ?auto_118510 - BLOCK
    )
    :vars
    (
      ?auto_118513 - BLOCK
      ?auto_118516 - BLOCK
      ?auto_118514 - BLOCK
      ?auto_118512 - BLOCK
      ?auto_118511 - BLOCK
      ?auto_118515 - BLOCK
      ?auto_118517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118509 ?auto_118510 ) ) ( not ( = ?auto_118509 ?auto_118513 ) ) ( not ( = ?auto_118510 ?auto_118513 ) ) ( ON ?auto_118509 ?auto_118516 ) ( not ( = ?auto_118509 ?auto_118516 ) ) ( not ( = ?auto_118510 ?auto_118516 ) ) ( not ( = ?auto_118513 ?auto_118516 ) ) ( ON-TABLE ?auto_118514 ) ( ON ?auto_118512 ?auto_118514 ) ( not ( = ?auto_118514 ?auto_118512 ) ) ( not ( = ?auto_118514 ?auto_118511 ) ) ( not ( = ?auto_118514 ?auto_118515 ) ) ( not ( = ?auto_118514 ?auto_118517 ) ) ( not ( = ?auto_118514 ?auto_118513 ) ) ( not ( = ?auto_118514 ?auto_118510 ) ) ( not ( = ?auto_118512 ?auto_118511 ) ) ( not ( = ?auto_118512 ?auto_118515 ) ) ( not ( = ?auto_118512 ?auto_118517 ) ) ( not ( = ?auto_118512 ?auto_118513 ) ) ( not ( = ?auto_118512 ?auto_118510 ) ) ( not ( = ?auto_118511 ?auto_118515 ) ) ( not ( = ?auto_118511 ?auto_118517 ) ) ( not ( = ?auto_118511 ?auto_118513 ) ) ( not ( = ?auto_118511 ?auto_118510 ) ) ( not ( = ?auto_118515 ?auto_118517 ) ) ( not ( = ?auto_118515 ?auto_118513 ) ) ( not ( = ?auto_118515 ?auto_118510 ) ) ( not ( = ?auto_118517 ?auto_118513 ) ) ( not ( = ?auto_118517 ?auto_118510 ) ) ( not ( = ?auto_118509 ?auto_118514 ) ) ( not ( = ?auto_118509 ?auto_118512 ) ) ( not ( = ?auto_118509 ?auto_118511 ) ) ( not ( = ?auto_118509 ?auto_118515 ) ) ( not ( = ?auto_118509 ?auto_118517 ) ) ( not ( = ?auto_118516 ?auto_118514 ) ) ( not ( = ?auto_118516 ?auto_118512 ) ) ( not ( = ?auto_118516 ?auto_118511 ) ) ( not ( = ?auto_118516 ?auto_118515 ) ) ( not ( = ?auto_118516 ?auto_118517 ) ) ( ON ?auto_118510 ?auto_118509 ) ( ON-TABLE ?auto_118516 ) ( ON ?auto_118513 ?auto_118510 ) ( ON ?auto_118517 ?auto_118513 ) ( ON ?auto_118515 ?auto_118517 ) ( CLEAR ?auto_118515 ) ( HOLDING ?auto_118511 ) ( CLEAR ?auto_118512 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118514 ?auto_118512 ?auto_118511 )
      ( MAKE-2PILE ?auto_118509 ?auto_118510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118518 - BLOCK
      ?auto_118519 - BLOCK
    )
    :vars
    (
      ?auto_118526 - BLOCK
      ?auto_118522 - BLOCK
      ?auto_118524 - BLOCK
      ?auto_118520 - BLOCK
      ?auto_118521 - BLOCK
      ?auto_118525 - BLOCK
      ?auto_118523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118518 ?auto_118519 ) ) ( not ( = ?auto_118518 ?auto_118526 ) ) ( not ( = ?auto_118519 ?auto_118526 ) ) ( ON ?auto_118518 ?auto_118522 ) ( not ( = ?auto_118518 ?auto_118522 ) ) ( not ( = ?auto_118519 ?auto_118522 ) ) ( not ( = ?auto_118526 ?auto_118522 ) ) ( ON-TABLE ?auto_118524 ) ( ON ?auto_118520 ?auto_118524 ) ( not ( = ?auto_118524 ?auto_118520 ) ) ( not ( = ?auto_118524 ?auto_118521 ) ) ( not ( = ?auto_118524 ?auto_118525 ) ) ( not ( = ?auto_118524 ?auto_118523 ) ) ( not ( = ?auto_118524 ?auto_118526 ) ) ( not ( = ?auto_118524 ?auto_118519 ) ) ( not ( = ?auto_118520 ?auto_118521 ) ) ( not ( = ?auto_118520 ?auto_118525 ) ) ( not ( = ?auto_118520 ?auto_118523 ) ) ( not ( = ?auto_118520 ?auto_118526 ) ) ( not ( = ?auto_118520 ?auto_118519 ) ) ( not ( = ?auto_118521 ?auto_118525 ) ) ( not ( = ?auto_118521 ?auto_118523 ) ) ( not ( = ?auto_118521 ?auto_118526 ) ) ( not ( = ?auto_118521 ?auto_118519 ) ) ( not ( = ?auto_118525 ?auto_118523 ) ) ( not ( = ?auto_118525 ?auto_118526 ) ) ( not ( = ?auto_118525 ?auto_118519 ) ) ( not ( = ?auto_118523 ?auto_118526 ) ) ( not ( = ?auto_118523 ?auto_118519 ) ) ( not ( = ?auto_118518 ?auto_118524 ) ) ( not ( = ?auto_118518 ?auto_118520 ) ) ( not ( = ?auto_118518 ?auto_118521 ) ) ( not ( = ?auto_118518 ?auto_118525 ) ) ( not ( = ?auto_118518 ?auto_118523 ) ) ( not ( = ?auto_118522 ?auto_118524 ) ) ( not ( = ?auto_118522 ?auto_118520 ) ) ( not ( = ?auto_118522 ?auto_118521 ) ) ( not ( = ?auto_118522 ?auto_118525 ) ) ( not ( = ?auto_118522 ?auto_118523 ) ) ( ON ?auto_118519 ?auto_118518 ) ( ON-TABLE ?auto_118522 ) ( ON ?auto_118526 ?auto_118519 ) ( ON ?auto_118523 ?auto_118526 ) ( ON ?auto_118525 ?auto_118523 ) ( CLEAR ?auto_118520 ) ( ON ?auto_118521 ?auto_118525 ) ( CLEAR ?auto_118521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118522 ?auto_118518 ?auto_118519 ?auto_118526 ?auto_118523 ?auto_118525 )
      ( MAKE-2PILE ?auto_118518 ?auto_118519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118527 - BLOCK
      ?auto_118528 - BLOCK
    )
    :vars
    (
      ?auto_118532 - BLOCK
      ?auto_118531 - BLOCK
      ?auto_118530 - BLOCK
      ?auto_118534 - BLOCK
      ?auto_118529 - BLOCK
      ?auto_118535 - BLOCK
      ?auto_118533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118527 ?auto_118528 ) ) ( not ( = ?auto_118527 ?auto_118532 ) ) ( not ( = ?auto_118528 ?auto_118532 ) ) ( ON ?auto_118527 ?auto_118531 ) ( not ( = ?auto_118527 ?auto_118531 ) ) ( not ( = ?auto_118528 ?auto_118531 ) ) ( not ( = ?auto_118532 ?auto_118531 ) ) ( ON-TABLE ?auto_118530 ) ( not ( = ?auto_118530 ?auto_118534 ) ) ( not ( = ?auto_118530 ?auto_118529 ) ) ( not ( = ?auto_118530 ?auto_118535 ) ) ( not ( = ?auto_118530 ?auto_118533 ) ) ( not ( = ?auto_118530 ?auto_118532 ) ) ( not ( = ?auto_118530 ?auto_118528 ) ) ( not ( = ?auto_118534 ?auto_118529 ) ) ( not ( = ?auto_118534 ?auto_118535 ) ) ( not ( = ?auto_118534 ?auto_118533 ) ) ( not ( = ?auto_118534 ?auto_118532 ) ) ( not ( = ?auto_118534 ?auto_118528 ) ) ( not ( = ?auto_118529 ?auto_118535 ) ) ( not ( = ?auto_118529 ?auto_118533 ) ) ( not ( = ?auto_118529 ?auto_118532 ) ) ( not ( = ?auto_118529 ?auto_118528 ) ) ( not ( = ?auto_118535 ?auto_118533 ) ) ( not ( = ?auto_118535 ?auto_118532 ) ) ( not ( = ?auto_118535 ?auto_118528 ) ) ( not ( = ?auto_118533 ?auto_118532 ) ) ( not ( = ?auto_118533 ?auto_118528 ) ) ( not ( = ?auto_118527 ?auto_118530 ) ) ( not ( = ?auto_118527 ?auto_118534 ) ) ( not ( = ?auto_118527 ?auto_118529 ) ) ( not ( = ?auto_118527 ?auto_118535 ) ) ( not ( = ?auto_118527 ?auto_118533 ) ) ( not ( = ?auto_118531 ?auto_118530 ) ) ( not ( = ?auto_118531 ?auto_118534 ) ) ( not ( = ?auto_118531 ?auto_118529 ) ) ( not ( = ?auto_118531 ?auto_118535 ) ) ( not ( = ?auto_118531 ?auto_118533 ) ) ( ON ?auto_118528 ?auto_118527 ) ( ON-TABLE ?auto_118531 ) ( ON ?auto_118532 ?auto_118528 ) ( ON ?auto_118533 ?auto_118532 ) ( ON ?auto_118535 ?auto_118533 ) ( ON ?auto_118529 ?auto_118535 ) ( CLEAR ?auto_118529 ) ( HOLDING ?auto_118534 ) ( CLEAR ?auto_118530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118530 ?auto_118534 )
      ( MAKE-2PILE ?auto_118527 ?auto_118528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118536 - BLOCK
      ?auto_118537 - BLOCK
    )
    :vars
    (
      ?auto_118540 - BLOCK
      ?auto_118542 - BLOCK
      ?auto_118538 - BLOCK
      ?auto_118539 - BLOCK
      ?auto_118541 - BLOCK
      ?auto_118544 - BLOCK
      ?auto_118543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118536 ?auto_118537 ) ) ( not ( = ?auto_118536 ?auto_118540 ) ) ( not ( = ?auto_118537 ?auto_118540 ) ) ( ON ?auto_118536 ?auto_118542 ) ( not ( = ?auto_118536 ?auto_118542 ) ) ( not ( = ?auto_118537 ?auto_118542 ) ) ( not ( = ?auto_118540 ?auto_118542 ) ) ( ON-TABLE ?auto_118538 ) ( not ( = ?auto_118538 ?auto_118539 ) ) ( not ( = ?auto_118538 ?auto_118541 ) ) ( not ( = ?auto_118538 ?auto_118544 ) ) ( not ( = ?auto_118538 ?auto_118543 ) ) ( not ( = ?auto_118538 ?auto_118540 ) ) ( not ( = ?auto_118538 ?auto_118537 ) ) ( not ( = ?auto_118539 ?auto_118541 ) ) ( not ( = ?auto_118539 ?auto_118544 ) ) ( not ( = ?auto_118539 ?auto_118543 ) ) ( not ( = ?auto_118539 ?auto_118540 ) ) ( not ( = ?auto_118539 ?auto_118537 ) ) ( not ( = ?auto_118541 ?auto_118544 ) ) ( not ( = ?auto_118541 ?auto_118543 ) ) ( not ( = ?auto_118541 ?auto_118540 ) ) ( not ( = ?auto_118541 ?auto_118537 ) ) ( not ( = ?auto_118544 ?auto_118543 ) ) ( not ( = ?auto_118544 ?auto_118540 ) ) ( not ( = ?auto_118544 ?auto_118537 ) ) ( not ( = ?auto_118543 ?auto_118540 ) ) ( not ( = ?auto_118543 ?auto_118537 ) ) ( not ( = ?auto_118536 ?auto_118538 ) ) ( not ( = ?auto_118536 ?auto_118539 ) ) ( not ( = ?auto_118536 ?auto_118541 ) ) ( not ( = ?auto_118536 ?auto_118544 ) ) ( not ( = ?auto_118536 ?auto_118543 ) ) ( not ( = ?auto_118542 ?auto_118538 ) ) ( not ( = ?auto_118542 ?auto_118539 ) ) ( not ( = ?auto_118542 ?auto_118541 ) ) ( not ( = ?auto_118542 ?auto_118544 ) ) ( not ( = ?auto_118542 ?auto_118543 ) ) ( ON ?auto_118537 ?auto_118536 ) ( ON-TABLE ?auto_118542 ) ( ON ?auto_118540 ?auto_118537 ) ( ON ?auto_118543 ?auto_118540 ) ( ON ?auto_118544 ?auto_118543 ) ( ON ?auto_118541 ?auto_118544 ) ( CLEAR ?auto_118538 ) ( ON ?auto_118539 ?auto_118541 ) ( CLEAR ?auto_118539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118542 ?auto_118536 ?auto_118537 ?auto_118540 ?auto_118543 ?auto_118544 ?auto_118541 )
      ( MAKE-2PILE ?auto_118536 ?auto_118537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118545 - BLOCK
      ?auto_118546 - BLOCK
    )
    :vars
    (
      ?auto_118547 - BLOCK
      ?auto_118551 - BLOCK
      ?auto_118548 - BLOCK
      ?auto_118550 - BLOCK
      ?auto_118552 - BLOCK
      ?auto_118549 - BLOCK
      ?auto_118553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118545 ?auto_118546 ) ) ( not ( = ?auto_118545 ?auto_118547 ) ) ( not ( = ?auto_118546 ?auto_118547 ) ) ( ON ?auto_118545 ?auto_118551 ) ( not ( = ?auto_118545 ?auto_118551 ) ) ( not ( = ?auto_118546 ?auto_118551 ) ) ( not ( = ?auto_118547 ?auto_118551 ) ) ( not ( = ?auto_118548 ?auto_118550 ) ) ( not ( = ?auto_118548 ?auto_118552 ) ) ( not ( = ?auto_118548 ?auto_118549 ) ) ( not ( = ?auto_118548 ?auto_118553 ) ) ( not ( = ?auto_118548 ?auto_118547 ) ) ( not ( = ?auto_118548 ?auto_118546 ) ) ( not ( = ?auto_118550 ?auto_118552 ) ) ( not ( = ?auto_118550 ?auto_118549 ) ) ( not ( = ?auto_118550 ?auto_118553 ) ) ( not ( = ?auto_118550 ?auto_118547 ) ) ( not ( = ?auto_118550 ?auto_118546 ) ) ( not ( = ?auto_118552 ?auto_118549 ) ) ( not ( = ?auto_118552 ?auto_118553 ) ) ( not ( = ?auto_118552 ?auto_118547 ) ) ( not ( = ?auto_118552 ?auto_118546 ) ) ( not ( = ?auto_118549 ?auto_118553 ) ) ( not ( = ?auto_118549 ?auto_118547 ) ) ( not ( = ?auto_118549 ?auto_118546 ) ) ( not ( = ?auto_118553 ?auto_118547 ) ) ( not ( = ?auto_118553 ?auto_118546 ) ) ( not ( = ?auto_118545 ?auto_118548 ) ) ( not ( = ?auto_118545 ?auto_118550 ) ) ( not ( = ?auto_118545 ?auto_118552 ) ) ( not ( = ?auto_118545 ?auto_118549 ) ) ( not ( = ?auto_118545 ?auto_118553 ) ) ( not ( = ?auto_118551 ?auto_118548 ) ) ( not ( = ?auto_118551 ?auto_118550 ) ) ( not ( = ?auto_118551 ?auto_118552 ) ) ( not ( = ?auto_118551 ?auto_118549 ) ) ( not ( = ?auto_118551 ?auto_118553 ) ) ( ON ?auto_118546 ?auto_118545 ) ( ON-TABLE ?auto_118551 ) ( ON ?auto_118547 ?auto_118546 ) ( ON ?auto_118553 ?auto_118547 ) ( ON ?auto_118549 ?auto_118553 ) ( ON ?auto_118552 ?auto_118549 ) ( ON ?auto_118550 ?auto_118552 ) ( CLEAR ?auto_118550 ) ( HOLDING ?auto_118548 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118548 )
      ( MAKE-2PILE ?auto_118545 ?auto_118546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118554 - BLOCK
      ?auto_118555 - BLOCK
    )
    :vars
    (
      ?auto_118557 - BLOCK
      ?auto_118558 - BLOCK
      ?auto_118562 - BLOCK
      ?auto_118561 - BLOCK
      ?auto_118556 - BLOCK
      ?auto_118560 - BLOCK
      ?auto_118559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118554 ?auto_118555 ) ) ( not ( = ?auto_118554 ?auto_118557 ) ) ( not ( = ?auto_118555 ?auto_118557 ) ) ( ON ?auto_118554 ?auto_118558 ) ( not ( = ?auto_118554 ?auto_118558 ) ) ( not ( = ?auto_118555 ?auto_118558 ) ) ( not ( = ?auto_118557 ?auto_118558 ) ) ( not ( = ?auto_118562 ?auto_118561 ) ) ( not ( = ?auto_118562 ?auto_118556 ) ) ( not ( = ?auto_118562 ?auto_118560 ) ) ( not ( = ?auto_118562 ?auto_118559 ) ) ( not ( = ?auto_118562 ?auto_118557 ) ) ( not ( = ?auto_118562 ?auto_118555 ) ) ( not ( = ?auto_118561 ?auto_118556 ) ) ( not ( = ?auto_118561 ?auto_118560 ) ) ( not ( = ?auto_118561 ?auto_118559 ) ) ( not ( = ?auto_118561 ?auto_118557 ) ) ( not ( = ?auto_118561 ?auto_118555 ) ) ( not ( = ?auto_118556 ?auto_118560 ) ) ( not ( = ?auto_118556 ?auto_118559 ) ) ( not ( = ?auto_118556 ?auto_118557 ) ) ( not ( = ?auto_118556 ?auto_118555 ) ) ( not ( = ?auto_118560 ?auto_118559 ) ) ( not ( = ?auto_118560 ?auto_118557 ) ) ( not ( = ?auto_118560 ?auto_118555 ) ) ( not ( = ?auto_118559 ?auto_118557 ) ) ( not ( = ?auto_118559 ?auto_118555 ) ) ( not ( = ?auto_118554 ?auto_118562 ) ) ( not ( = ?auto_118554 ?auto_118561 ) ) ( not ( = ?auto_118554 ?auto_118556 ) ) ( not ( = ?auto_118554 ?auto_118560 ) ) ( not ( = ?auto_118554 ?auto_118559 ) ) ( not ( = ?auto_118558 ?auto_118562 ) ) ( not ( = ?auto_118558 ?auto_118561 ) ) ( not ( = ?auto_118558 ?auto_118556 ) ) ( not ( = ?auto_118558 ?auto_118560 ) ) ( not ( = ?auto_118558 ?auto_118559 ) ) ( ON ?auto_118555 ?auto_118554 ) ( ON-TABLE ?auto_118558 ) ( ON ?auto_118557 ?auto_118555 ) ( ON ?auto_118559 ?auto_118557 ) ( ON ?auto_118560 ?auto_118559 ) ( ON ?auto_118556 ?auto_118560 ) ( ON ?auto_118561 ?auto_118556 ) ( ON ?auto_118562 ?auto_118561 ) ( CLEAR ?auto_118562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118558 ?auto_118554 ?auto_118555 ?auto_118557 ?auto_118559 ?auto_118560 ?auto_118556 ?auto_118561 )
      ( MAKE-2PILE ?auto_118554 ?auto_118555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118590 - BLOCK
      ?auto_118591 - BLOCK
      ?auto_118592 - BLOCK
      ?auto_118593 - BLOCK
      ?auto_118594 - BLOCK
    )
    :vars
    (
      ?auto_118597 - BLOCK
      ?auto_118595 - BLOCK
      ?auto_118596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118597 ?auto_118594 ) ( ON-TABLE ?auto_118590 ) ( ON ?auto_118591 ?auto_118590 ) ( ON ?auto_118592 ?auto_118591 ) ( ON ?auto_118593 ?auto_118592 ) ( ON ?auto_118594 ?auto_118593 ) ( not ( = ?auto_118590 ?auto_118591 ) ) ( not ( = ?auto_118590 ?auto_118592 ) ) ( not ( = ?auto_118590 ?auto_118593 ) ) ( not ( = ?auto_118590 ?auto_118594 ) ) ( not ( = ?auto_118590 ?auto_118597 ) ) ( not ( = ?auto_118591 ?auto_118592 ) ) ( not ( = ?auto_118591 ?auto_118593 ) ) ( not ( = ?auto_118591 ?auto_118594 ) ) ( not ( = ?auto_118591 ?auto_118597 ) ) ( not ( = ?auto_118592 ?auto_118593 ) ) ( not ( = ?auto_118592 ?auto_118594 ) ) ( not ( = ?auto_118592 ?auto_118597 ) ) ( not ( = ?auto_118593 ?auto_118594 ) ) ( not ( = ?auto_118593 ?auto_118597 ) ) ( not ( = ?auto_118594 ?auto_118597 ) ) ( not ( = ?auto_118590 ?auto_118595 ) ) ( not ( = ?auto_118590 ?auto_118596 ) ) ( not ( = ?auto_118591 ?auto_118595 ) ) ( not ( = ?auto_118591 ?auto_118596 ) ) ( not ( = ?auto_118592 ?auto_118595 ) ) ( not ( = ?auto_118592 ?auto_118596 ) ) ( not ( = ?auto_118593 ?auto_118595 ) ) ( not ( = ?auto_118593 ?auto_118596 ) ) ( not ( = ?auto_118594 ?auto_118595 ) ) ( not ( = ?auto_118594 ?auto_118596 ) ) ( not ( = ?auto_118597 ?auto_118595 ) ) ( not ( = ?auto_118597 ?auto_118596 ) ) ( not ( = ?auto_118595 ?auto_118596 ) ) ( ON ?auto_118595 ?auto_118597 ) ( CLEAR ?auto_118595 ) ( HOLDING ?auto_118596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118596 )
      ( MAKE-5PILE ?auto_118590 ?auto_118591 ?auto_118592 ?auto_118593 ?auto_118594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118703 - BLOCK
      ?auto_118704 - BLOCK
      ?auto_118705 - BLOCK
    )
    :vars
    (
      ?auto_118706 - BLOCK
      ?auto_118707 - BLOCK
      ?auto_118709 - BLOCK
      ?auto_118708 - BLOCK
      ?auto_118710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118703 ) ( not ( = ?auto_118703 ?auto_118704 ) ) ( not ( = ?auto_118703 ?auto_118705 ) ) ( not ( = ?auto_118704 ?auto_118705 ) ) ( ON ?auto_118705 ?auto_118706 ) ( not ( = ?auto_118703 ?auto_118706 ) ) ( not ( = ?auto_118704 ?auto_118706 ) ) ( not ( = ?auto_118705 ?auto_118706 ) ) ( CLEAR ?auto_118703 ) ( ON ?auto_118704 ?auto_118705 ) ( CLEAR ?auto_118704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118707 ) ( ON ?auto_118709 ?auto_118707 ) ( ON ?auto_118708 ?auto_118709 ) ( ON ?auto_118710 ?auto_118708 ) ( ON ?auto_118706 ?auto_118710 ) ( not ( = ?auto_118707 ?auto_118709 ) ) ( not ( = ?auto_118707 ?auto_118708 ) ) ( not ( = ?auto_118707 ?auto_118710 ) ) ( not ( = ?auto_118707 ?auto_118706 ) ) ( not ( = ?auto_118707 ?auto_118705 ) ) ( not ( = ?auto_118707 ?auto_118704 ) ) ( not ( = ?auto_118709 ?auto_118708 ) ) ( not ( = ?auto_118709 ?auto_118710 ) ) ( not ( = ?auto_118709 ?auto_118706 ) ) ( not ( = ?auto_118709 ?auto_118705 ) ) ( not ( = ?auto_118709 ?auto_118704 ) ) ( not ( = ?auto_118708 ?auto_118710 ) ) ( not ( = ?auto_118708 ?auto_118706 ) ) ( not ( = ?auto_118708 ?auto_118705 ) ) ( not ( = ?auto_118708 ?auto_118704 ) ) ( not ( = ?auto_118710 ?auto_118706 ) ) ( not ( = ?auto_118710 ?auto_118705 ) ) ( not ( = ?auto_118710 ?auto_118704 ) ) ( not ( = ?auto_118703 ?auto_118707 ) ) ( not ( = ?auto_118703 ?auto_118709 ) ) ( not ( = ?auto_118703 ?auto_118708 ) ) ( not ( = ?auto_118703 ?auto_118710 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118707 ?auto_118709 ?auto_118708 ?auto_118710 ?auto_118706 ?auto_118705 )
      ( MAKE-3PILE ?auto_118703 ?auto_118704 ?auto_118705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118711 - BLOCK
      ?auto_118712 - BLOCK
      ?auto_118713 - BLOCK
    )
    :vars
    (
      ?auto_118714 - BLOCK
      ?auto_118718 - BLOCK
      ?auto_118717 - BLOCK
      ?auto_118715 - BLOCK
      ?auto_118716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118711 ?auto_118712 ) ) ( not ( = ?auto_118711 ?auto_118713 ) ) ( not ( = ?auto_118712 ?auto_118713 ) ) ( ON ?auto_118713 ?auto_118714 ) ( not ( = ?auto_118711 ?auto_118714 ) ) ( not ( = ?auto_118712 ?auto_118714 ) ) ( not ( = ?auto_118713 ?auto_118714 ) ) ( ON ?auto_118712 ?auto_118713 ) ( CLEAR ?auto_118712 ) ( ON-TABLE ?auto_118718 ) ( ON ?auto_118717 ?auto_118718 ) ( ON ?auto_118715 ?auto_118717 ) ( ON ?auto_118716 ?auto_118715 ) ( ON ?auto_118714 ?auto_118716 ) ( not ( = ?auto_118718 ?auto_118717 ) ) ( not ( = ?auto_118718 ?auto_118715 ) ) ( not ( = ?auto_118718 ?auto_118716 ) ) ( not ( = ?auto_118718 ?auto_118714 ) ) ( not ( = ?auto_118718 ?auto_118713 ) ) ( not ( = ?auto_118718 ?auto_118712 ) ) ( not ( = ?auto_118717 ?auto_118715 ) ) ( not ( = ?auto_118717 ?auto_118716 ) ) ( not ( = ?auto_118717 ?auto_118714 ) ) ( not ( = ?auto_118717 ?auto_118713 ) ) ( not ( = ?auto_118717 ?auto_118712 ) ) ( not ( = ?auto_118715 ?auto_118716 ) ) ( not ( = ?auto_118715 ?auto_118714 ) ) ( not ( = ?auto_118715 ?auto_118713 ) ) ( not ( = ?auto_118715 ?auto_118712 ) ) ( not ( = ?auto_118716 ?auto_118714 ) ) ( not ( = ?auto_118716 ?auto_118713 ) ) ( not ( = ?auto_118716 ?auto_118712 ) ) ( not ( = ?auto_118711 ?auto_118718 ) ) ( not ( = ?auto_118711 ?auto_118717 ) ) ( not ( = ?auto_118711 ?auto_118715 ) ) ( not ( = ?auto_118711 ?auto_118716 ) ) ( HOLDING ?auto_118711 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118711 )
      ( MAKE-3PILE ?auto_118711 ?auto_118712 ?auto_118713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118719 - BLOCK
      ?auto_118720 - BLOCK
      ?auto_118721 - BLOCK
    )
    :vars
    (
      ?auto_118726 - BLOCK
      ?auto_118723 - BLOCK
      ?auto_118724 - BLOCK
      ?auto_118725 - BLOCK
      ?auto_118722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118719 ?auto_118720 ) ) ( not ( = ?auto_118719 ?auto_118721 ) ) ( not ( = ?auto_118720 ?auto_118721 ) ) ( ON ?auto_118721 ?auto_118726 ) ( not ( = ?auto_118719 ?auto_118726 ) ) ( not ( = ?auto_118720 ?auto_118726 ) ) ( not ( = ?auto_118721 ?auto_118726 ) ) ( ON ?auto_118720 ?auto_118721 ) ( ON-TABLE ?auto_118723 ) ( ON ?auto_118724 ?auto_118723 ) ( ON ?auto_118725 ?auto_118724 ) ( ON ?auto_118722 ?auto_118725 ) ( ON ?auto_118726 ?auto_118722 ) ( not ( = ?auto_118723 ?auto_118724 ) ) ( not ( = ?auto_118723 ?auto_118725 ) ) ( not ( = ?auto_118723 ?auto_118722 ) ) ( not ( = ?auto_118723 ?auto_118726 ) ) ( not ( = ?auto_118723 ?auto_118721 ) ) ( not ( = ?auto_118723 ?auto_118720 ) ) ( not ( = ?auto_118724 ?auto_118725 ) ) ( not ( = ?auto_118724 ?auto_118722 ) ) ( not ( = ?auto_118724 ?auto_118726 ) ) ( not ( = ?auto_118724 ?auto_118721 ) ) ( not ( = ?auto_118724 ?auto_118720 ) ) ( not ( = ?auto_118725 ?auto_118722 ) ) ( not ( = ?auto_118725 ?auto_118726 ) ) ( not ( = ?auto_118725 ?auto_118721 ) ) ( not ( = ?auto_118725 ?auto_118720 ) ) ( not ( = ?auto_118722 ?auto_118726 ) ) ( not ( = ?auto_118722 ?auto_118721 ) ) ( not ( = ?auto_118722 ?auto_118720 ) ) ( not ( = ?auto_118719 ?auto_118723 ) ) ( not ( = ?auto_118719 ?auto_118724 ) ) ( not ( = ?auto_118719 ?auto_118725 ) ) ( not ( = ?auto_118719 ?auto_118722 ) ) ( ON ?auto_118719 ?auto_118720 ) ( CLEAR ?auto_118719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118723 ?auto_118724 ?auto_118725 ?auto_118722 ?auto_118726 ?auto_118721 ?auto_118720 )
      ( MAKE-3PILE ?auto_118719 ?auto_118720 ?auto_118721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118730 - BLOCK
      ?auto_118731 - BLOCK
      ?auto_118732 - BLOCK
    )
    :vars
    (
      ?auto_118737 - BLOCK
      ?auto_118733 - BLOCK
      ?auto_118735 - BLOCK
      ?auto_118736 - BLOCK
      ?auto_118734 - BLOCK
      ?auto_118738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118730 ?auto_118731 ) ) ( not ( = ?auto_118730 ?auto_118732 ) ) ( not ( = ?auto_118731 ?auto_118732 ) ) ( ON ?auto_118732 ?auto_118737 ) ( not ( = ?auto_118730 ?auto_118737 ) ) ( not ( = ?auto_118731 ?auto_118737 ) ) ( not ( = ?auto_118732 ?auto_118737 ) ) ( ON ?auto_118731 ?auto_118732 ) ( CLEAR ?auto_118731 ) ( ON-TABLE ?auto_118733 ) ( ON ?auto_118735 ?auto_118733 ) ( ON ?auto_118736 ?auto_118735 ) ( ON ?auto_118734 ?auto_118736 ) ( ON ?auto_118737 ?auto_118734 ) ( not ( = ?auto_118733 ?auto_118735 ) ) ( not ( = ?auto_118733 ?auto_118736 ) ) ( not ( = ?auto_118733 ?auto_118734 ) ) ( not ( = ?auto_118733 ?auto_118737 ) ) ( not ( = ?auto_118733 ?auto_118732 ) ) ( not ( = ?auto_118733 ?auto_118731 ) ) ( not ( = ?auto_118735 ?auto_118736 ) ) ( not ( = ?auto_118735 ?auto_118734 ) ) ( not ( = ?auto_118735 ?auto_118737 ) ) ( not ( = ?auto_118735 ?auto_118732 ) ) ( not ( = ?auto_118735 ?auto_118731 ) ) ( not ( = ?auto_118736 ?auto_118734 ) ) ( not ( = ?auto_118736 ?auto_118737 ) ) ( not ( = ?auto_118736 ?auto_118732 ) ) ( not ( = ?auto_118736 ?auto_118731 ) ) ( not ( = ?auto_118734 ?auto_118737 ) ) ( not ( = ?auto_118734 ?auto_118732 ) ) ( not ( = ?auto_118734 ?auto_118731 ) ) ( not ( = ?auto_118730 ?auto_118733 ) ) ( not ( = ?auto_118730 ?auto_118735 ) ) ( not ( = ?auto_118730 ?auto_118736 ) ) ( not ( = ?auto_118730 ?auto_118734 ) ) ( ON ?auto_118730 ?auto_118738 ) ( CLEAR ?auto_118730 ) ( HAND-EMPTY ) ( not ( = ?auto_118730 ?auto_118738 ) ) ( not ( = ?auto_118731 ?auto_118738 ) ) ( not ( = ?auto_118732 ?auto_118738 ) ) ( not ( = ?auto_118737 ?auto_118738 ) ) ( not ( = ?auto_118733 ?auto_118738 ) ) ( not ( = ?auto_118735 ?auto_118738 ) ) ( not ( = ?auto_118736 ?auto_118738 ) ) ( not ( = ?auto_118734 ?auto_118738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118730 ?auto_118738 )
      ( MAKE-3PILE ?auto_118730 ?auto_118731 ?auto_118732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118739 - BLOCK
      ?auto_118740 - BLOCK
      ?auto_118741 - BLOCK
    )
    :vars
    (
      ?auto_118746 - BLOCK
      ?auto_118743 - BLOCK
      ?auto_118744 - BLOCK
      ?auto_118745 - BLOCK
      ?auto_118742 - BLOCK
      ?auto_118747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118739 ?auto_118740 ) ) ( not ( = ?auto_118739 ?auto_118741 ) ) ( not ( = ?auto_118740 ?auto_118741 ) ) ( ON ?auto_118741 ?auto_118746 ) ( not ( = ?auto_118739 ?auto_118746 ) ) ( not ( = ?auto_118740 ?auto_118746 ) ) ( not ( = ?auto_118741 ?auto_118746 ) ) ( ON-TABLE ?auto_118743 ) ( ON ?auto_118744 ?auto_118743 ) ( ON ?auto_118745 ?auto_118744 ) ( ON ?auto_118742 ?auto_118745 ) ( ON ?auto_118746 ?auto_118742 ) ( not ( = ?auto_118743 ?auto_118744 ) ) ( not ( = ?auto_118743 ?auto_118745 ) ) ( not ( = ?auto_118743 ?auto_118742 ) ) ( not ( = ?auto_118743 ?auto_118746 ) ) ( not ( = ?auto_118743 ?auto_118741 ) ) ( not ( = ?auto_118743 ?auto_118740 ) ) ( not ( = ?auto_118744 ?auto_118745 ) ) ( not ( = ?auto_118744 ?auto_118742 ) ) ( not ( = ?auto_118744 ?auto_118746 ) ) ( not ( = ?auto_118744 ?auto_118741 ) ) ( not ( = ?auto_118744 ?auto_118740 ) ) ( not ( = ?auto_118745 ?auto_118742 ) ) ( not ( = ?auto_118745 ?auto_118746 ) ) ( not ( = ?auto_118745 ?auto_118741 ) ) ( not ( = ?auto_118745 ?auto_118740 ) ) ( not ( = ?auto_118742 ?auto_118746 ) ) ( not ( = ?auto_118742 ?auto_118741 ) ) ( not ( = ?auto_118742 ?auto_118740 ) ) ( not ( = ?auto_118739 ?auto_118743 ) ) ( not ( = ?auto_118739 ?auto_118744 ) ) ( not ( = ?auto_118739 ?auto_118745 ) ) ( not ( = ?auto_118739 ?auto_118742 ) ) ( ON ?auto_118739 ?auto_118747 ) ( CLEAR ?auto_118739 ) ( not ( = ?auto_118739 ?auto_118747 ) ) ( not ( = ?auto_118740 ?auto_118747 ) ) ( not ( = ?auto_118741 ?auto_118747 ) ) ( not ( = ?auto_118746 ?auto_118747 ) ) ( not ( = ?auto_118743 ?auto_118747 ) ) ( not ( = ?auto_118744 ?auto_118747 ) ) ( not ( = ?auto_118745 ?auto_118747 ) ) ( not ( = ?auto_118742 ?auto_118747 ) ) ( HOLDING ?auto_118740 ) ( CLEAR ?auto_118741 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118743 ?auto_118744 ?auto_118745 ?auto_118742 ?auto_118746 ?auto_118741 ?auto_118740 )
      ( MAKE-3PILE ?auto_118739 ?auto_118740 ?auto_118741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118748 - BLOCK
      ?auto_118749 - BLOCK
      ?auto_118750 - BLOCK
    )
    :vars
    (
      ?auto_118755 - BLOCK
      ?auto_118751 - BLOCK
      ?auto_118752 - BLOCK
      ?auto_118754 - BLOCK
      ?auto_118753 - BLOCK
      ?auto_118756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118748 ?auto_118749 ) ) ( not ( = ?auto_118748 ?auto_118750 ) ) ( not ( = ?auto_118749 ?auto_118750 ) ) ( ON ?auto_118750 ?auto_118755 ) ( not ( = ?auto_118748 ?auto_118755 ) ) ( not ( = ?auto_118749 ?auto_118755 ) ) ( not ( = ?auto_118750 ?auto_118755 ) ) ( ON-TABLE ?auto_118751 ) ( ON ?auto_118752 ?auto_118751 ) ( ON ?auto_118754 ?auto_118752 ) ( ON ?auto_118753 ?auto_118754 ) ( ON ?auto_118755 ?auto_118753 ) ( not ( = ?auto_118751 ?auto_118752 ) ) ( not ( = ?auto_118751 ?auto_118754 ) ) ( not ( = ?auto_118751 ?auto_118753 ) ) ( not ( = ?auto_118751 ?auto_118755 ) ) ( not ( = ?auto_118751 ?auto_118750 ) ) ( not ( = ?auto_118751 ?auto_118749 ) ) ( not ( = ?auto_118752 ?auto_118754 ) ) ( not ( = ?auto_118752 ?auto_118753 ) ) ( not ( = ?auto_118752 ?auto_118755 ) ) ( not ( = ?auto_118752 ?auto_118750 ) ) ( not ( = ?auto_118752 ?auto_118749 ) ) ( not ( = ?auto_118754 ?auto_118753 ) ) ( not ( = ?auto_118754 ?auto_118755 ) ) ( not ( = ?auto_118754 ?auto_118750 ) ) ( not ( = ?auto_118754 ?auto_118749 ) ) ( not ( = ?auto_118753 ?auto_118755 ) ) ( not ( = ?auto_118753 ?auto_118750 ) ) ( not ( = ?auto_118753 ?auto_118749 ) ) ( not ( = ?auto_118748 ?auto_118751 ) ) ( not ( = ?auto_118748 ?auto_118752 ) ) ( not ( = ?auto_118748 ?auto_118754 ) ) ( not ( = ?auto_118748 ?auto_118753 ) ) ( ON ?auto_118748 ?auto_118756 ) ( not ( = ?auto_118748 ?auto_118756 ) ) ( not ( = ?auto_118749 ?auto_118756 ) ) ( not ( = ?auto_118750 ?auto_118756 ) ) ( not ( = ?auto_118755 ?auto_118756 ) ) ( not ( = ?auto_118751 ?auto_118756 ) ) ( not ( = ?auto_118752 ?auto_118756 ) ) ( not ( = ?auto_118754 ?auto_118756 ) ) ( not ( = ?auto_118753 ?auto_118756 ) ) ( CLEAR ?auto_118750 ) ( ON ?auto_118749 ?auto_118748 ) ( CLEAR ?auto_118749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118756 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118756 ?auto_118748 )
      ( MAKE-3PILE ?auto_118748 ?auto_118749 ?auto_118750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118757 - BLOCK
      ?auto_118758 - BLOCK
      ?auto_118759 - BLOCK
    )
    :vars
    (
      ?auto_118763 - BLOCK
      ?auto_118760 - BLOCK
      ?auto_118761 - BLOCK
      ?auto_118764 - BLOCK
      ?auto_118765 - BLOCK
      ?auto_118762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118757 ?auto_118758 ) ) ( not ( = ?auto_118757 ?auto_118759 ) ) ( not ( = ?auto_118758 ?auto_118759 ) ) ( not ( = ?auto_118757 ?auto_118763 ) ) ( not ( = ?auto_118758 ?auto_118763 ) ) ( not ( = ?auto_118759 ?auto_118763 ) ) ( ON-TABLE ?auto_118760 ) ( ON ?auto_118761 ?auto_118760 ) ( ON ?auto_118764 ?auto_118761 ) ( ON ?auto_118765 ?auto_118764 ) ( ON ?auto_118763 ?auto_118765 ) ( not ( = ?auto_118760 ?auto_118761 ) ) ( not ( = ?auto_118760 ?auto_118764 ) ) ( not ( = ?auto_118760 ?auto_118765 ) ) ( not ( = ?auto_118760 ?auto_118763 ) ) ( not ( = ?auto_118760 ?auto_118759 ) ) ( not ( = ?auto_118760 ?auto_118758 ) ) ( not ( = ?auto_118761 ?auto_118764 ) ) ( not ( = ?auto_118761 ?auto_118765 ) ) ( not ( = ?auto_118761 ?auto_118763 ) ) ( not ( = ?auto_118761 ?auto_118759 ) ) ( not ( = ?auto_118761 ?auto_118758 ) ) ( not ( = ?auto_118764 ?auto_118765 ) ) ( not ( = ?auto_118764 ?auto_118763 ) ) ( not ( = ?auto_118764 ?auto_118759 ) ) ( not ( = ?auto_118764 ?auto_118758 ) ) ( not ( = ?auto_118765 ?auto_118763 ) ) ( not ( = ?auto_118765 ?auto_118759 ) ) ( not ( = ?auto_118765 ?auto_118758 ) ) ( not ( = ?auto_118757 ?auto_118760 ) ) ( not ( = ?auto_118757 ?auto_118761 ) ) ( not ( = ?auto_118757 ?auto_118764 ) ) ( not ( = ?auto_118757 ?auto_118765 ) ) ( ON ?auto_118757 ?auto_118762 ) ( not ( = ?auto_118757 ?auto_118762 ) ) ( not ( = ?auto_118758 ?auto_118762 ) ) ( not ( = ?auto_118759 ?auto_118762 ) ) ( not ( = ?auto_118763 ?auto_118762 ) ) ( not ( = ?auto_118760 ?auto_118762 ) ) ( not ( = ?auto_118761 ?auto_118762 ) ) ( not ( = ?auto_118764 ?auto_118762 ) ) ( not ( = ?auto_118765 ?auto_118762 ) ) ( ON ?auto_118758 ?auto_118757 ) ( CLEAR ?auto_118758 ) ( ON-TABLE ?auto_118762 ) ( HOLDING ?auto_118759 ) ( CLEAR ?auto_118763 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118760 ?auto_118761 ?auto_118764 ?auto_118765 ?auto_118763 ?auto_118759 )
      ( MAKE-3PILE ?auto_118757 ?auto_118758 ?auto_118759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118766 - BLOCK
      ?auto_118767 - BLOCK
      ?auto_118768 - BLOCK
    )
    :vars
    (
      ?auto_118769 - BLOCK
      ?auto_118774 - BLOCK
      ?auto_118770 - BLOCK
      ?auto_118771 - BLOCK
      ?auto_118772 - BLOCK
      ?auto_118773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118766 ?auto_118767 ) ) ( not ( = ?auto_118766 ?auto_118768 ) ) ( not ( = ?auto_118767 ?auto_118768 ) ) ( not ( = ?auto_118766 ?auto_118769 ) ) ( not ( = ?auto_118767 ?auto_118769 ) ) ( not ( = ?auto_118768 ?auto_118769 ) ) ( ON-TABLE ?auto_118774 ) ( ON ?auto_118770 ?auto_118774 ) ( ON ?auto_118771 ?auto_118770 ) ( ON ?auto_118772 ?auto_118771 ) ( ON ?auto_118769 ?auto_118772 ) ( not ( = ?auto_118774 ?auto_118770 ) ) ( not ( = ?auto_118774 ?auto_118771 ) ) ( not ( = ?auto_118774 ?auto_118772 ) ) ( not ( = ?auto_118774 ?auto_118769 ) ) ( not ( = ?auto_118774 ?auto_118768 ) ) ( not ( = ?auto_118774 ?auto_118767 ) ) ( not ( = ?auto_118770 ?auto_118771 ) ) ( not ( = ?auto_118770 ?auto_118772 ) ) ( not ( = ?auto_118770 ?auto_118769 ) ) ( not ( = ?auto_118770 ?auto_118768 ) ) ( not ( = ?auto_118770 ?auto_118767 ) ) ( not ( = ?auto_118771 ?auto_118772 ) ) ( not ( = ?auto_118771 ?auto_118769 ) ) ( not ( = ?auto_118771 ?auto_118768 ) ) ( not ( = ?auto_118771 ?auto_118767 ) ) ( not ( = ?auto_118772 ?auto_118769 ) ) ( not ( = ?auto_118772 ?auto_118768 ) ) ( not ( = ?auto_118772 ?auto_118767 ) ) ( not ( = ?auto_118766 ?auto_118774 ) ) ( not ( = ?auto_118766 ?auto_118770 ) ) ( not ( = ?auto_118766 ?auto_118771 ) ) ( not ( = ?auto_118766 ?auto_118772 ) ) ( ON ?auto_118766 ?auto_118773 ) ( not ( = ?auto_118766 ?auto_118773 ) ) ( not ( = ?auto_118767 ?auto_118773 ) ) ( not ( = ?auto_118768 ?auto_118773 ) ) ( not ( = ?auto_118769 ?auto_118773 ) ) ( not ( = ?auto_118774 ?auto_118773 ) ) ( not ( = ?auto_118770 ?auto_118773 ) ) ( not ( = ?auto_118771 ?auto_118773 ) ) ( not ( = ?auto_118772 ?auto_118773 ) ) ( ON ?auto_118767 ?auto_118766 ) ( ON-TABLE ?auto_118773 ) ( CLEAR ?auto_118769 ) ( ON ?auto_118768 ?auto_118767 ) ( CLEAR ?auto_118768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118773 ?auto_118766 ?auto_118767 )
      ( MAKE-3PILE ?auto_118766 ?auto_118767 ?auto_118768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118775 - BLOCK
      ?auto_118776 - BLOCK
      ?auto_118777 - BLOCK
    )
    :vars
    (
      ?auto_118779 - BLOCK
      ?auto_118783 - BLOCK
      ?auto_118780 - BLOCK
      ?auto_118778 - BLOCK
      ?auto_118781 - BLOCK
      ?auto_118782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118775 ?auto_118776 ) ) ( not ( = ?auto_118775 ?auto_118777 ) ) ( not ( = ?auto_118776 ?auto_118777 ) ) ( not ( = ?auto_118775 ?auto_118779 ) ) ( not ( = ?auto_118776 ?auto_118779 ) ) ( not ( = ?auto_118777 ?auto_118779 ) ) ( ON-TABLE ?auto_118783 ) ( ON ?auto_118780 ?auto_118783 ) ( ON ?auto_118778 ?auto_118780 ) ( ON ?auto_118781 ?auto_118778 ) ( not ( = ?auto_118783 ?auto_118780 ) ) ( not ( = ?auto_118783 ?auto_118778 ) ) ( not ( = ?auto_118783 ?auto_118781 ) ) ( not ( = ?auto_118783 ?auto_118779 ) ) ( not ( = ?auto_118783 ?auto_118777 ) ) ( not ( = ?auto_118783 ?auto_118776 ) ) ( not ( = ?auto_118780 ?auto_118778 ) ) ( not ( = ?auto_118780 ?auto_118781 ) ) ( not ( = ?auto_118780 ?auto_118779 ) ) ( not ( = ?auto_118780 ?auto_118777 ) ) ( not ( = ?auto_118780 ?auto_118776 ) ) ( not ( = ?auto_118778 ?auto_118781 ) ) ( not ( = ?auto_118778 ?auto_118779 ) ) ( not ( = ?auto_118778 ?auto_118777 ) ) ( not ( = ?auto_118778 ?auto_118776 ) ) ( not ( = ?auto_118781 ?auto_118779 ) ) ( not ( = ?auto_118781 ?auto_118777 ) ) ( not ( = ?auto_118781 ?auto_118776 ) ) ( not ( = ?auto_118775 ?auto_118783 ) ) ( not ( = ?auto_118775 ?auto_118780 ) ) ( not ( = ?auto_118775 ?auto_118778 ) ) ( not ( = ?auto_118775 ?auto_118781 ) ) ( ON ?auto_118775 ?auto_118782 ) ( not ( = ?auto_118775 ?auto_118782 ) ) ( not ( = ?auto_118776 ?auto_118782 ) ) ( not ( = ?auto_118777 ?auto_118782 ) ) ( not ( = ?auto_118779 ?auto_118782 ) ) ( not ( = ?auto_118783 ?auto_118782 ) ) ( not ( = ?auto_118780 ?auto_118782 ) ) ( not ( = ?auto_118778 ?auto_118782 ) ) ( not ( = ?auto_118781 ?auto_118782 ) ) ( ON ?auto_118776 ?auto_118775 ) ( ON-TABLE ?auto_118782 ) ( ON ?auto_118777 ?auto_118776 ) ( CLEAR ?auto_118777 ) ( HOLDING ?auto_118779 ) ( CLEAR ?auto_118781 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118783 ?auto_118780 ?auto_118778 ?auto_118781 ?auto_118779 )
      ( MAKE-3PILE ?auto_118775 ?auto_118776 ?auto_118777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118784 - BLOCK
      ?auto_118785 - BLOCK
      ?auto_118786 - BLOCK
    )
    :vars
    (
      ?auto_118791 - BLOCK
      ?auto_118789 - BLOCK
      ?auto_118788 - BLOCK
      ?auto_118787 - BLOCK
      ?auto_118792 - BLOCK
      ?auto_118790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118784 ?auto_118785 ) ) ( not ( = ?auto_118784 ?auto_118786 ) ) ( not ( = ?auto_118785 ?auto_118786 ) ) ( not ( = ?auto_118784 ?auto_118791 ) ) ( not ( = ?auto_118785 ?auto_118791 ) ) ( not ( = ?auto_118786 ?auto_118791 ) ) ( ON-TABLE ?auto_118789 ) ( ON ?auto_118788 ?auto_118789 ) ( ON ?auto_118787 ?auto_118788 ) ( ON ?auto_118792 ?auto_118787 ) ( not ( = ?auto_118789 ?auto_118788 ) ) ( not ( = ?auto_118789 ?auto_118787 ) ) ( not ( = ?auto_118789 ?auto_118792 ) ) ( not ( = ?auto_118789 ?auto_118791 ) ) ( not ( = ?auto_118789 ?auto_118786 ) ) ( not ( = ?auto_118789 ?auto_118785 ) ) ( not ( = ?auto_118788 ?auto_118787 ) ) ( not ( = ?auto_118788 ?auto_118792 ) ) ( not ( = ?auto_118788 ?auto_118791 ) ) ( not ( = ?auto_118788 ?auto_118786 ) ) ( not ( = ?auto_118788 ?auto_118785 ) ) ( not ( = ?auto_118787 ?auto_118792 ) ) ( not ( = ?auto_118787 ?auto_118791 ) ) ( not ( = ?auto_118787 ?auto_118786 ) ) ( not ( = ?auto_118787 ?auto_118785 ) ) ( not ( = ?auto_118792 ?auto_118791 ) ) ( not ( = ?auto_118792 ?auto_118786 ) ) ( not ( = ?auto_118792 ?auto_118785 ) ) ( not ( = ?auto_118784 ?auto_118789 ) ) ( not ( = ?auto_118784 ?auto_118788 ) ) ( not ( = ?auto_118784 ?auto_118787 ) ) ( not ( = ?auto_118784 ?auto_118792 ) ) ( ON ?auto_118784 ?auto_118790 ) ( not ( = ?auto_118784 ?auto_118790 ) ) ( not ( = ?auto_118785 ?auto_118790 ) ) ( not ( = ?auto_118786 ?auto_118790 ) ) ( not ( = ?auto_118791 ?auto_118790 ) ) ( not ( = ?auto_118789 ?auto_118790 ) ) ( not ( = ?auto_118788 ?auto_118790 ) ) ( not ( = ?auto_118787 ?auto_118790 ) ) ( not ( = ?auto_118792 ?auto_118790 ) ) ( ON ?auto_118785 ?auto_118784 ) ( ON-TABLE ?auto_118790 ) ( ON ?auto_118786 ?auto_118785 ) ( CLEAR ?auto_118792 ) ( ON ?auto_118791 ?auto_118786 ) ( CLEAR ?auto_118791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118790 ?auto_118784 ?auto_118785 ?auto_118786 )
      ( MAKE-3PILE ?auto_118784 ?auto_118785 ?auto_118786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118793 - BLOCK
      ?auto_118794 - BLOCK
      ?auto_118795 - BLOCK
    )
    :vars
    (
      ?auto_118796 - BLOCK
      ?auto_118801 - BLOCK
      ?auto_118800 - BLOCK
      ?auto_118797 - BLOCK
      ?auto_118798 - BLOCK
      ?auto_118799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118793 ?auto_118794 ) ) ( not ( = ?auto_118793 ?auto_118795 ) ) ( not ( = ?auto_118794 ?auto_118795 ) ) ( not ( = ?auto_118793 ?auto_118796 ) ) ( not ( = ?auto_118794 ?auto_118796 ) ) ( not ( = ?auto_118795 ?auto_118796 ) ) ( ON-TABLE ?auto_118801 ) ( ON ?auto_118800 ?auto_118801 ) ( ON ?auto_118797 ?auto_118800 ) ( not ( = ?auto_118801 ?auto_118800 ) ) ( not ( = ?auto_118801 ?auto_118797 ) ) ( not ( = ?auto_118801 ?auto_118798 ) ) ( not ( = ?auto_118801 ?auto_118796 ) ) ( not ( = ?auto_118801 ?auto_118795 ) ) ( not ( = ?auto_118801 ?auto_118794 ) ) ( not ( = ?auto_118800 ?auto_118797 ) ) ( not ( = ?auto_118800 ?auto_118798 ) ) ( not ( = ?auto_118800 ?auto_118796 ) ) ( not ( = ?auto_118800 ?auto_118795 ) ) ( not ( = ?auto_118800 ?auto_118794 ) ) ( not ( = ?auto_118797 ?auto_118798 ) ) ( not ( = ?auto_118797 ?auto_118796 ) ) ( not ( = ?auto_118797 ?auto_118795 ) ) ( not ( = ?auto_118797 ?auto_118794 ) ) ( not ( = ?auto_118798 ?auto_118796 ) ) ( not ( = ?auto_118798 ?auto_118795 ) ) ( not ( = ?auto_118798 ?auto_118794 ) ) ( not ( = ?auto_118793 ?auto_118801 ) ) ( not ( = ?auto_118793 ?auto_118800 ) ) ( not ( = ?auto_118793 ?auto_118797 ) ) ( not ( = ?auto_118793 ?auto_118798 ) ) ( ON ?auto_118793 ?auto_118799 ) ( not ( = ?auto_118793 ?auto_118799 ) ) ( not ( = ?auto_118794 ?auto_118799 ) ) ( not ( = ?auto_118795 ?auto_118799 ) ) ( not ( = ?auto_118796 ?auto_118799 ) ) ( not ( = ?auto_118801 ?auto_118799 ) ) ( not ( = ?auto_118800 ?auto_118799 ) ) ( not ( = ?auto_118797 ?auto_118799 ) ) ( not ( = ?auto_118798 ?auto_118799 ) ) ( ON ?auto_118794 ?auto_118793 ) ( ON-TABLE ?auto_118799 ) ( ON ?auto_118795 ?auto_118794 ) ( ON ?auto_118796 ?auto_118795 ) ( CLEAR ?auto_118796 ) ( HOLDING ?auto_118798 ) ( CLEAR ?auto_118797 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118801 ?auto_118800 ?auto_118797 ?auto_118798 )
      ( MAKE-3PILE ?auto_118793 ?auto_118794 ?auto_118795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118802 - BLOCK
      ?auto_118803 - BLOCK
      ?auto_118804 - BLOCK
    )
    :vars
    (
      ?auto_118807 - BLOCK
      ?auto_118810 - BLOCK
      ?auto_118806 - BLOCK
      ?auto_118805 - BLOCK
      ?auto_118809 - BLOCK
      ?auto_118808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118802 ?auto_118803 ) ) ( not ( = ?auto_118802 ?auto_118804 ) ) ( not ( = ?auto_118803 ?auto_118804 ) ) ( not ( = ?auto_118802 ?auto_118807 ) ) ( not ( = ?auto_118803 ?auto_118807 ) ) ( not ( = ?auto_118804 ?auto_118807 ) ) ( ON-TABLE ?auto_118810 ) ( ON ?auto_118806 ?auto_118810 ) ( ON ?auto_118805 ?auto_118806 ) ( not ( = ?auto_118810 ?auto_118806 ) ) ( not ( = ?auto_118810 ?auto_118805 ) ) ( not ( = ?auto_118810 ?auto_118809 ) ) ( not ( = ?auto_118810 ?auto_118807 ) ) ( not ( = ?auto_118810 ?auto_118804 ) ) ( not ( = ?auto_118810 ?auto_118803 ) ) ( not ( = ?auto_118806 ?auto_118805 ) ) ( not ( = ?auto_118806 ?auto_118809 ) ) ( not ( = ?auto_118806 ?auto_118807 ) ) ( not ( = ?auto_118806 ?auto_118804 ) ) ( not ( = ?auto_118806 ?auto_118803 ) ) ( not ( = ?auto_118805 ?auto_118809 ) ) ( not ( = ?auto_118805 ?auto_118807 ) ) ( not ( = ?auto_118805 ?auto_118804 ) ) ( not ( = ?auto_118805 ?auto_118803 ) ) ( not ( = ?auto_118809 ?auto_118807 ) ) ( not ( = ?auto_118809 ?auto_118804 ) ) ( not ( = ?auto_118809 ?auto_118803 ) ) ( not ( = ?auto_118802 ?auto_118810 ) ) ( not ( = ?auto_118802 ?auto_118806 ) ) ( not ( = ?auto_118802 ?auto_118805 ) ) ( not ( = ?auto_118802 ?auto_118809 ) ) ( ON ?auto_118802 ?auto_118808 ) ( not ( = ?auto_118802 ?auto_118808 ) ) ( not ( = ?auto_118803 ?auto_118808 ) ) ( not ( = ?auto_118804 ?auto_118808 ) ) ( not ( = ?auto_118807 ?auto_118808 ) ) ( not ( = ?auto_118810 ?auto_118808 ) ) ( not ( = ?auto_118806 ?auto_118808 ) ) ( not ( = ?auto_118805 ?auto_118808 ) ) ( not ( = ?auto_118809 ?auto_118808 ) ) ( ON ?auto_118803 ?auto_118802 ) ( ON-TABLE ?auto_118808 ) ( ON ?auto_118804 ?auto_118803 ) ( ON ?auto_118807 ?auto_118804 ) ( CLEAR ?auto_118805 ) ( ON ?auto_118809 ?auto_118807 ) ( CLEAR ?auto_118809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118808 ?auto_118802 ?auto_118803 ?auto_118804 ?auto_118807 )
      ( MAKE-3PILE ?auto_118802 ?auto_118803 ?auto_118804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118811 - BLOCK
      ?auto_118812 - BLOCK
      ?auto_118813 - BLOCK
    )
    :vars
    (
      ?auto_118819 - BLOCK
      ?auto_118817 - BLOCK
      ?auto_118816 - BLOCK
      ?auto_118815 - BLOCK
      ?auto_118818 - BLOCK
      ?auto_118814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118811 ?auto_118812 ) ) ( not ( = ?auto_118811 ?auto_118813 ) ) ( not ( = ?auto_118812 ?auto_118813 ) ) ( not ( = ?auto_118811 ?auto_118819 ) ) ( not ( = ?auto_118812 ?auto_118819 ) ) ( not ( = ?auto_118813 ?auto_118819 ) ) ( ON-TABLE ?auto_118817 ) ( ON ?auto_118816 ?auto_118817 ) ( not ( = ?auto_118817 ?auto_118816 ) ) ( not ( = ?auto_118817 ?auto_118815 ) ) ( not ( = ?auto_118817 ?auto_118818 ) ) ( not ( = ?auto_118817 ?auto_118819 ) ) ( not ( = ?auto_118817 ?auto_118813 ) ) ( not ( = ?auto_118817 ?auto_118812 ) ) ( not ( = ?auto_118816 ?auto_118815 ) ) ( not ( = ?auto_118816 ?auto_118818 ) ) ( not ( = ?auto_118816 ?auto_118819 ) ) ( not ( = ?auto_118816 ?auto_118813 ) ) ( not ( = ?auto_118816 ?auto_118812 ) ) ( not ( = ?auto_118815 ?auto_118818 ) ) ( not ( = ?auto_118815 ?auto_118819 ) ) ( not ( = ?auto_118815 ?auto_118813 ) ) ( not ( = ?auto_118815 ?auto_118812 ) ) ( not ( = ?auto_118818 ?auto_118819 ) ) ( not ( = ?auto_118818 ?auto_118813 ) ) ( not ( = ?auto_118818 ?auto_118812 ) ) ( not ( = ?auto_118811 ?auto_118817 ) ) ( not ( = ?auto_118811 ?auto_118816 ) ) ( not ( = ?auto_118811 ?auto_118815 ) ) ( not ( = ?auto_118811 ?auto_118818 ) ) ( ON ?auto_118811 ?auto_118814 ) ( not ( = ?auto_118811 ?auto_118814 ) ) ( not ( = ?auto_118812 ?auto_118814 ) ) ( not ( = ?auto_118813 ?auto_118814 ) ) ( not ( = ?auto_118819 ?auto_118814 ) ) ( not ( = ?auto_118817 ?auto_118814 ) ) ( not ( = ?auto_118816 ?auto_118814 ) ) ( not ( = ?auto_118815 ?auto_118814 ) ) ( not ( = ?auto_118818 ?auto_118814 ) ) ( ON ?auto_118812 ?auto_118811 ) ( ON-TABLE ?auto_118814 ) ( ON ?auto_118813 ?auto_118812 ) ( ON ?auto_118819 ?auto_118813 ) ( ON ?auto_118818 ?auto_118819 ) ( CLEAR ?auto_118818 ) ( HOLDING ?auto_118815 ) ( CLEAR ?auto_118816 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118817 ?auto_118816 ?auto_118815 )
      ( MAKE-3PILE ?auto_118811 ?auto_118812 ?auto_118813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118820 - BLOCK
      ?auto_118821 - BLOCK
      ?auto_118822 - BLOCK
    )
    :vars
    (
      ?auto_118828 - BLOCK
      ?auto_118826 - BLOCK
      ?auto_118823 - BLOCK
      ?auto_118824 - BLOCK
      ?auto_118825 - BLOCK
      ?auto_118827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118820 ?auto_118821 ) ) ( not ( = ?auto_118820 ?auto_118822 ) ) ( not ( = ?auto_118821 ?auto_118822 ) ) ( not ( = ?auto_118820 ?auto_118828 ) ) ( not ( = ?auto_118821 ?auto_118828 ) ) ( not ( = ?auto_118822 ?auto_118828 ) ) ( ON-TABLE ?auto_118826 ) ( ON ?auto_118823 ?auto_118826 ) ( not ( = ?auto_118826 ?auto_118823 ) ) ( not ( = ?auto_118826 ?auto_118824 ) ) ( not ( = ?auto_118826 ?auto_118825 ) ) ( not ( = ?auto_118826 ?auto_118828 ) ) ( not ( = ?auto_118826 ?auto_118822 ) ) ( not ( = ?auto_118826 ?auto_118821 ) ) ( not ( = ?auto_118823 ?auto_118824 ) ) ( not ( = ?auto_118823 ?auto_118825 ) ) ( not ( = ?auto_118823 ?auto_118828 ) ) ( not ( = ?auto_118823 ?auto_118822 ) ) ( not ( = ?auto_118823 ?auto_118821 ) ) ( not ( = ?auto_118824 ?auto_118825 ) ) ( not ( = ?auto_118824 ?auto_118828 ) ) ( not ( = ?auto_118824 ?auto_118822 ) ) ( not ( = ?auto_118824 ?auto_118821 ) ) ( not ( = ?auto_118825 ?auto_118828 ) ) ( not ( = ?auto_118825 ?auto_118822 ) ) ( not ( = ?auto_118825 ?auto_118821 ) ) ( not ( = ?auto_118820 ?auto_118826 ) ) ( not ( = ?auto_118820 ?auto_118823 ) ) ( not ( = ?auto_118820 ?auto_118824 ) ) ( not ( = ?auto_118820 ?auto_118825 ) ) ( ON ?auto_118820 ?auto_118827 ) ( not ( = ?auto_118820 ?auto_118827 ) ) ( not ( = ?auto_118821 ?auto_118827 ) ) ( not ( = ?auto_118822 ?auto_118827 ) ) ( not ( = ?auto_118828 ?auto_118827 ) ) ( not ( = ?auto_118826 ?auto_118827 ) ) ( not ( = ?auto_118823 ?auto_118827 ) ) ( not ( = ?auto_118824 ?auto_118827 ) ) ( not ( = ?auto_118825 ?auto_118827 ) ) ( ON ?auto_118821 ?auto_118820 ) ( ON-TABLE ?auto_118827 ) ( ON ?auto_118822 ?auto_118821 ) ( ON ?auto_118828 ?auto_118822 ) ( ON ?auto_118825 ?auto_118828 ) ( CLEAR ?auto_118823 ) ( ON ?auto_118824 ?auto_118825 ) ( CLEAR ?auto_118824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118827 ?auto_118820 ?auto_118821 ?auto_118822 ?auto_118828 ?auto_118825 )
      ( MAKE-3PILE ?auto_118820 ?auto_118821 ?auto_118822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118829 - BLOCK
      ?auto_118830 - BLOCK
      ?auto_118831 - BLOCK
    )
    :vars
    (
      ?auto_118837 - BLOCK
      ?auto_118834 - BLOCK
      ?auto_118835 - BLOCK
      ?auto_118836 - BLOCK
      ?auto_118832 - BLOCK
      ?auto_118833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118829 ?auto_118830 ) ) ( not ( = ?auto_118829 ?auto_118831 ) ) ( not ( = ?auto_118830 ?auto_118831 ) ) ( not ( = ?auto_118829 ?auto_118837 ) ) ( not ( = ?auto_118830 ?auto_118837 ) ) ( not ( = ?auto_118831 ?auto_118837 ) ) ( ON-TABLE ?auto_118834 ) ( not ( = ?auto_118834 ?auto_118835 ) ) ( not ( = ?auto_118834 ?auto_118836 ) ) ( not ( = ?auto_118834 ?auto_118832 ) ) ( not ( = ?auto_118834 ?auto_118837 ) ) ( not ( = ?auto_118834 ?auto_118831 ) ) ( not ( = ?auto_118834 ?auto_118830 ) ) ( not ( = ?auto_118835 ?auto_118836 ) ) ( not ( = ?auto_118835 ?auto_118832 ) ) ( not ( = ?auto_118835 ?auto_118837 ) ) ( not ( = ?auto_118835 ?auto_118831 ) ) ( not ( = ?auto_118835 ?auto_118830 ) ) ( not ( = ?auto_118836 ?auto_118832 ) ) ( not ( = ?auto_118836 ?auto_118837 ) ) ( not ( = ?auto_118836 ?auto_118831 ) ) ( not ( = ?auto_118836 ?auto_118830 ) ) ( not ( = ?auto_118832 ?auto_118837 ) ) ( not ( = ?auto_118832 ?auto_118831 ) ) ( not ( = ?auto_118832 ?auto_118830 ) ) ( not ( = ?auto_118829 ?auto_118834 ) ) ( not ( = ?auto_118829 ?auto_118835 ) ) ( not ( = ?auto_118829 ?auto_118836 ) ) ( not ( = ?auto_118829 ?auto_118832 ) ) ( ON ?auto_118829 ?auto_118833 ) ( not ( = ?auto_118829 ?auto_118833 ) ) ( not ( = ?auto_118830 ?auto_118833 ) ) ( not ( = ?auto_118831 ?auto_118833 ) ) ( not ( = ?auto_118837 ?auto_118833 ) ) ( not ( = ?auto_118834 ?auto_118833 ) ) ( not ( = ?auto_118835 ?auto_118833 ) ) ( not ( = ?auto_118836 ?auto_118833 ) ) ( not ( = ?auto_118832 ?auto_118833 ) ) ( ON ?auto_118830 ?auto_118829 ) ( ON-TABLE ?auto_118833 ) ( ON ?auto_118831 ?auto_118830 ) ( ON ?auto_118837 ?auto_118831 ) ( ON ?auto_118832 ?auto_118837 ) ( ON ?auto_118836 ?auto_118832 ) ( CLEAR ?auto_118836 ) ( HOLDING ?auto_118835 ) ( CLEAR ?auto_118834 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118834 ?auto_118835 )
      ( MAKE-3PILE ?auto_118829 ?auto_118830 ?auto_118831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118838 - BLOCK
      ?auto_118839 - BLOCK
      ?auto_118840 - BLOCK
    )
    :vars
    (
      ?auto_118843 - BLOCK
      ?auto_118845 - BLOCK
      ?auto_118844 - BLOCK
      ?auto_118841 - BLOCK
      ?auto_118842 - BLOCK
      ?auto_118846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118838 ?auto_118839 ) ) ( not ( = ?auto_118838 ?auto_118840 ) ) ( not ( = ?auto_118839 ?auto_118840 ) ) ( not ( = ?auto_118838 ?auto_118843 ) ) ( not ( = ?auto_118839 ?auto_118843 ) ) ( not ( = ?auto_118840 ?auto_118843 ) ) ( ON-TABLE ?auto_118845 ) ( not ( = ?auto_118845 ?auto_118844 ) ) ( not ( = ?auto_118845 ?auto_118841 ) ) ( not ( = ?auto_118845 ?auto_118842 ) ) ( not ( = ?auto_118845 ?auto_118843 ) ) ( not ( = ?auto_118845 ?auto_118840 ) ) ( not ( = ?auto_118845 ?auto_118839 ) ) ( not ( = ?auto_118844 ?auto_118841 ) ) ( not ( = ?auto_118844 ?auto_118842 ) ) ( not ( = ?auto_118844 ?auto_118843 ) ) ( not ( = ?auto_118844 ?auto_118840 ) ) ( not ( = ?auto_118844 ?auto_118839 ) ) ( not ( = ?auto_118841 ?auto_118842 ) ) ( not ( = ?auto_118841 ?auto_118843 ) ) ( not ( = ?auto_118841 ?auto_118840 ) ) ( not ( = ?auto_118841 ?auto_118839 ) ) ( not ( = ?auto_118842 ?auto_118843 ) ) ( not ( = ?auto_118842 ?auto_118840 ) ) ( not ( = ?auto_118842 ?auto_118839 ) ) ( not ( = ?auto_118838 ?auto_118845 ) ) ( not ( = ?auto_118838 ?auto_118844 ) ) ( not ( = ?auto_118838 ?auto_118841 ) ) ( not ( = ?auto_118838 ?auto_118842 ) ) ( ON ?auto_118838 ?auto_118846 ) ( not ( = ?auto_118838 ?auto_118846 ) ) ( not ( = ?auto_118839 ?auto_118846 ) ) ( not ( = ?auto_118840 ?auto_118846 ) ) ( not ( = ?auto_118843 ?auto_118846 ) ) ( not ( = ?auto_118845 ?auto_118846 ) ) ( not ( = ?auto_118844 ?auto_118846 ) ) ( not ( = ?auto_118841 ?auto_118846 ) ) ( not ( = ?auto_118842 ?auto_118846 ) ) ( ON ?auto_118839 ?auto_118838 ) ( ON-TABLE ?auto_118846 ) ( ON ?auto_118840 ?auto_118839 ) ( ON ?auto_118843 ?auto_118840 ) ( ON ?auto_118842 ?auto_118843 ) ( ON ?auto_118841 ?auto_118842 ) ( CLEAR ?auto_118845 ) ( ON ?auto_118844 ?auto_118841 ) ( CLEAR ?auto_118844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118846 ?auto_118838 ?auto_118839 ?auto_118840 ?auto_118843 ?auto_118842 ?auto_118841 )
      ( MAKE-3PILE ?auto_118838 ?auto_118839 ?auto_118840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118847 - BLOCK
      ?auto_118848 - BLOCK
      ?auto_118849 - BLOCK
    )
    :vars
    (
      ?auto_118855 - BLOCK
      ?auto_118851 - BLOCK
      ?auto_118852 - BLOCK
      ?auto_118853 - BLOCK
      ?auto_118850 - BLOCK
      ?auto_118854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118847 ?auto_118848 ) ) ( not ( = ?auto_118847 ?auto_118849 ) ) ( not ( = ?auto_118848 ?auto_118849 ) ) ( not ( = ?auto_118847 ?auto_118855 ) ) ( not ( = ?auto_118848 ?auto_118855 ) ) ( not ( = ?auto_118849 ?auto_118855 ) ) ( not ( = ?auto_118851 ?auto_118852 ) ) ( not ( = ?auto_118851 ?auto_118853 ) ) ( not ( = ?auto_118851 ?auto_118850 ) ) ( not ( = ?auto_118851 ?auto_118855 ) ) ( not ( = ?auto_118851 ?auto_118849 ) ) ( not ( = ?auto_118851 ?auto_118848 ) ) ( not ( = ?auto_118852 ?auto_118853 ) ) ( not ( = ?auto_118852 ?auto_118850 ) ) ( not ( = ?auto_118852 ?auto_118855 ) ) ( not ( = ?auto_118852 ?auto_118849 ) ) ( not ( = ?auto_118852 ?auto_118848 ) ) ( not ( = ?auto_118853 ?auto_118850 ) ) ( not ( = ?auto_118853 ?auto_118855 ) ) ( not ( = ?auto_118853 ?auto_118849 ) ) ( not ( = ?auto_118853 ?auto_118848 ) ) ( not ( = ?auto_118850 ?auto_118855 ) ) ( not ( = ?auto_118850 ?auto_118849 ) ) ( not ( = ?auto_118850 ?auto_118848 ) ) ( not ( = ?auto_118847 ?auto_118851 ) ) ( not ( = ?auto_118847 ?auto_118852 ) ) ( not ( = ?auto_118847 ?auto_118853 ) ) ( not ( = ?auto_118847 ?auto_118850 ) ) ( ON ?auto_118847 ?auto_118854 ) ( not ( = ?auto_118847 ?auto_118854 ) ) ( not ( = ?auto_118848 ?auto_118854 ) ) ( not ( = ?auto_118849 ?auto_118854 ) ) ( not ( = ?auto_118855 ?auto_118854 ) ) ( not ( = ?auto_118851 ?auto_118854 ) ) ( not ( = ?auto_118852 ?auto_118854 ) ) ( not ( = ?auto_118853 ?auto_118854 ) ) ( not ( = ?auto_118850 ?auto_118854 ) ) ( ON ?auto_118848 ?auto_118847 ) ( ON-TABLE ?auto_118854 ) ( ON ?auto_118849 ?auto_118848 ) ( ON ?auto_118855 ?auto_118849 ) ( ON ?auto_118850 ?auto_118855 ) ( ON ?auto_118853 ?auto_118850 ) ( ON ?auto_118852 ?auto_118853 ) ( CLEAR ?auto_118852 ) ( HOLDING ?auto_118851 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118851 )
      ( MAKE-3PILE ?auto_118847 ?auto_118848 ?auto_118849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118856 - BLOCK
      ?auto_118857 - BLOCK
      ?auto_118858 - BLOCK
    )
    :vars
    (
      ?auto_118859 - BLOCK
      ?auto_118864 - BLOCK
      ?auto_118860 - BLOCK
      ?auto_118862 - BLOCK
      ?auto_118861 - BLOCK
      ?auto_118863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118856 ?auto_118857 ) ) ( not ( = ?auto_118856 ?auto_118858 ) ) ( not ( = ?auto_118857 ?auto_118858 ) ) ( not ( = ?auto_118856 ?auto_118859 ) ) ( not ( = ?auto_118857 ?auto_118859 ) ) ( not ( = ?auto_118858 ?auto_118859 ) ) ( not ( = ?auto_118864 ?auto_118860 ) ) ( not ( = ?auto_118864 ?auto_118862 ) ) ( not ( = ?auto_118864 ?auto_118861 ) ) ( not ( = ?auto_118864 ?auto_118859 ) ) ( not ( = ?auto_118864 ?auto_118858 ) ) ( not ( = ?auto_118864 ?auto_118857 ) ) ( not ( = ?auto_118860 ?auto_118862 ) ) ( not ( = ?auto_118860 ?auto_118861 ) ) ( not ( = ?auto_118860 ?auto_118859 ) ) ( not ( = ?auto_118860 ?auto_118858 ) ) ( not ( = ?auto_118860 ?auto_118857 ) ) ( not ( = ?auto_118862 ?auto_118861 ) ) ( not ( = ?auto_118862 ?auto_118859 ) ) ( not ( = ?auto_118862 ?auto_118858 ) ) ( not ( = ?auto_118862 ?auto_118857 ) ) ( not ( = ?auto_118861 ?auto_118859 ) ) ( not ( = ?auto_118861 ?auto_118858 ) ) ( not ( = ?auto_118861 ?auto_118857 ) ) ( not ( = ?auto_118856 ?auto_118864 ) ) ( not ( = ?auto_118856 ?auto_118860 ) ) ( not ( = ?auto_118856 ?auto_118862 ) ) ( not ( = ?auto_118856 ?auto_118861 ) ) ( ON ?auto_118856 ?auto_118863 ) ( not ( = ?auto_118856 ?auto_118863 ) ) ( not ( = ?auto_118857 ?auto_118863 ) ) ( not ( = ?auto_118858 ?auto_118863 ) ) ( not ( = ?auto_118859 ?auto_118863 ) ) ( not ( = ?auto_118864 ?auto_118863 ) ) ( not ( = ?auto_118860 ?auto_118863 ) ) ( not ( = ?auto_118862 ?auto_118863 ) ) ( not ( = ?auto_118861 ?auto_118863 ) ) ( ON ?auto_118857 ?auto_118856 ) ( ON-TABLE ?auto_118863 ) ( ON ?auto_118858 ?auto_118857 ) ( ON ?auto_118859 ?auto_118858 ) ( ON ?auto_118861 ?auto_118859 ) ( ON ?auto_118862 ?auto_118861 ) ( ON ?auto_118860 ?auto_118862 ) ( ON ?auto_118864 ?auto_118860 ) ( CLEAR ?auto_118864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118863 ?auto_118856 ?auto_118857 ?auto_118858 ?auto_118859 ?auto_118861 ?auto_118862 ?auto_118860 )
      ( MAKE-3PILE ?auto_118856 ?auto_118857 ?auto_118858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118888 - BLOCK
      ?auto_118889 - BLOCK
      ?auto_118890 - BLOCK
      ?auto_118891 - BLOCK
    )
    :vars
    (
      ?auto_118894 - BLOCK
      ?auto_118893 - BLOCK
      ?auto_118892 - BLOCK
      ?auto_118895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118894 ?auto_118891 ) ( ON-TABLE ?auto_118888 ) ( ON ?auto_118889 ?auto_118888 ) ( ON ?auto_118890 ?auto_118889 ) ( ON ?auto_118891 ?auto_118890 ) ( not ( = ?auto_118888 ?auto_118889 ) ) ( not ( = ?auto_118888 ?auto_118890 ) ) ( not ( = ?auto_118888 ?auto_118891 ) ) ( not ( = ?auto_118888 ?auto_118894 ) ) ( not ( = ?auto_118889 ?auto_118890 ) ) ( not ( = ?auto_118889 ?auto_118891 ) ) ( not ( = ?auto_118889 ?auto_118894 ) ) ( not ( = ?auto_118890 ?auto_118891 ) ) ( not ( = ?auto_118890 ?auto_118894 ) ) ( not ( = ?auto_118891 ?auto_118894 ) ) ( not ( = ?auto_118888 ?auto_118893 ) ) ( not ( = ?auto_118888 ?auto_118892 ) ) ( not ( = ?auto_118889 ?auto_118893 ) ) ( not ( = ?auto_118889 ?auto_118892 ) ) ( not ( = ?auto_118890 ?auto_118893 ) ) ( not ( = ?auto_118890 ?auto_118892 ) ) ( not ( = ?auto_118891 ?auto_118893 ) ) ( not ( = ?auto_118891 ?auto_118892 ) ) ( not ( = ?auto_118894 ?auto_118893 ) ) ( not ( = ?auto_118894 ?auto_118892 ) ) ( not ( = ?auto_118893 ?auto_118892 ) ) ( ON ?auto_118893 ?auto_118894 ) ( CLEAR ?auto_118893 ) ( HOLDING ?auto_118892 ) ( CLEAR ?auto_118895 ) ( ON-TABLE ?auto_118895 ) ( not ( = ?auto_118895 ?auto_118892 ) ) ( not ( = ?auto_118888 ?auto_118895 ) ) ( not ( = ?auto_118889 ?auto_118895 ) ) ( not ( = ?auto_118890 ?auto_118895 ) ) ( not ( = ?auto_118891 ?auto_118895 ) ) ( not ( = ?auto_118894 ?auto_118895 ) ) ( not ( = ?auto_118893 ?auto_118895 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118895 ?auto_118892 )
      ( MAKE-4PILE ?auto_118888 ?auto_118889 ?auto_118890 ?auto_118891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118896 - BLOCK
      ?auto_118897 - BLOCK
      ?auto_118898 - BLOCK
      ?auto_118899 - BLOCK
    )
    :vars
    (
      ?auto_118902 - BLOCK
      ?auto_118900 - BLOCK
      ?auto_118903 - BLOCK
      ?auto_118901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118902 ?auto_118899 ) ( ON-TABLE ?auto_118896 ) ( ON ?auto_118897 ?auto_118896 ) ( ON ?auto_118898 ?auto_118897 ) ( ON ?auto_118899 ?auto_118898 ) ( not ( = ?auto_118896 ?auto_118897 ) ) ( not ( = ?auto_118896 ?auto_118898 ) ) ( not ( = ?auto_118896 ?auto_118899 ) ) ( not ( = ?auto_118896 ?auto_118902 ) ) ( not ( = ?auto_118897 ?auto_118898 ) ) ( not ( = ?auto_118897 ?auto_118899 ) ) ( not ( = ?auto_118897 ?auto_118902 ) ) ( not ( = ?auto_118898 ?auto_118899 ) ) ( not ( = ?auto_118898 ?auto_118902 ) ) ( not ( = ?auto_118899 ?auto_118902 ) ) ( not ( = ?auto_118896 ?auto_118900 ) ) ( not ( = ?auto_118896 ?auto_118903 ) ) ( not ( = ?auto_118897 ?auto_118900 ) ) ( not ( = ?auto_118897 ?auto_118903 ) ) ( not ( = ?auto_118898 ?auto_118900 ) ) ( not ( = ?auto_118898 ?auto_118903 ) ) ( not ( = ?auto_118899 ?auto_118900 ) ) ( not ( = ?auto_118899 ?auto_118903 ) ) ( not ( = ?auto_118902 ?auto_118900 ) ) ( not ( = ?auto_118902 ?auto_118903 ) ) ( not ( = ?auto_118900 ?auto_118903 ) ) ( ON ?auto_118900 ?auto_118902 ) ( CLEAR ?auto_118901 ) ( ON-TABLE ?auto_118901 ) ( not ( = ?auto_118901 ?auto_118903 ) ) ( not ( = ?auto_118896 ?auto_118901 ) ) ( not ( = ?auto_118897 ?auto_118901 ) ) ( not ( = ?auto_118898 ?auto_118901 ) ) ( not ( = ?auto_118899 ?auto_118901 ) ) ( not ( = ?auto_118902 ?auto_118901 ) ) ( not ( = ?auto_118900 ?auto_118901 ) ) ( ON ?auto_118903 ?auto_118900 ) ( CLEAR ?auto_118903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118896 ?auto_118897 ?auto_118898 ?auto_118899 ?auto_118902 ?auto_118900 )
      ( MAKE-4PILE ?auto_118896 ?auto_118897 ?auto_118898 ?auto_118899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118904 - BLOCK
      ?auto_118905 - BLOCK
      ?auto_118906 - BLOCK
      ?auto_118907 - BLOCK
    )
    :vars
    (
      ?auto_118909 - BLOCK
      ?auto_118910 - BLOCK
      ?auto_118908 - BLOCK
      ?auto_118911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118909 ?auto_118907 ) ( ON-TABLE ?auto_118904 ) ( ON ?auto_118905 ?auto_118904 ) ( ON ?auto_118906 ?auto_118905 ) ( ON ?auto_118907 ?auto_118906 ) ( not ( = ?auto_118904 ?auto_118905 ) ) ( not ( = ?auto_118904 ?auto_118906 ) ) ( not ( = ?auto_118904 ?auto_118907 ) ) ( not ( = ?auto_118904 ?auto_118909 ) ) ( not ( = ?auto_118905 ?auto_118906 ) ) ( not ( = ?auto_118905 ?auto_118907 ) ) ( not ( = ?auto_118905 ?auto_118909 ) ) ( not ( = ?auto_118906 ?auto_118907 ) ) ( not ( = ?auto_118906 ?auto_118909 ) ) ( not ( = ?auto_118907 ?auto_118909 ) ) ( not ( = ?auto_118904 ?auto_118910 ) ) ( not ( = ?auto_118904 ?auto_118908 ) ) ( not ( = ?auto_118905 ?auto_118910 ) ) ( not ( = ?auto_118905 ?auto_118908 ) ) ( not ( = ?auto_118906 ?auto_118910 ) ) ( not ( = ?auto_118906 ?auto_118908 ) ) ( not ( = ?auto_118907 ?auto_118910 ) ) ( not ( = ?auto_118907 ?auto_118908 ) ) ( not ( = ?auto_118909 ?auto_118910 ) ) ( not ( = ?auto_118909 ?auto_118908 ) ) ( not ( = ?auto_118910 ?auto_118908 ) ) ( ON ?auto_118910 ?auto_118909 ) ( not ( = ?auto_118911 ?auto_118908 ) ) ( not ( = ?auto_118904 ?auto_118911 ) ) ( not ( = ?auto_118905 ?auto_118911 ) ) ( not ( = ?auto_118906 ?auto_118911 ) ) ( not ( = ?auto_118907 ?auto_118911 ) ) ( not ( = ?auto_118909 ?auto_118911 ) ) ( not ( = ?auto_118910 ?auto_118911 ) ) ( ON ?auto_118908 ?auto_118910 ) ( CLEAR ?auto_118908 ) ( HOLDING ?auto_118911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118911 )
      ( MAKE-4PILE ?auto_118904 ?auto_118905 ?auto_118906 ?auto_118907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118924 - BLOCK
      ?auto_118925 - BLOCK
      ?auto_118926 - BLOCK
      ?auto_118927 - BLOCK
    )
    :vars
    (
      ?auto_118929 - BLOCK
      ?auto_118930 - BLOCK
      ?auto_118931 - BLOCK
      ?auto_118928 - BLOCK
      ?auto_118932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118929 ?auto_118927 ) ( ON-TABLE ?auto_118924 ) ( ON ?auto_118925 ?auto_118924 ) ( ON ?auto_118926 ?auto_118925 ) ( ON ?auto_118927 ?auto_118926 ) ( not ( = ?auto_118924 ?auto_118925 ) ) ( not ( = ?auto_118924 ?auto_118926 ) ) ( not ( = ?auto_118924 ?auto_118927 ) ) ( not ( = ?auto_118924 ?auto_118929 ) ) ( not ( = ?auto_118925 ?auto_118926 ) ) ( not ( = ?auto_118925 ?auto_118927 ) ) ( not ( = ?auto_118925 ?auto_118929 ) ) ( not ( = ?auto_118926 ?auto_118927 ) ) ( not ( = ?auto_118926 ?auto_118929 ) ) ( not ( = ?auto_118927 ?auto_118929 ) ) ( not ( = ?auto_118924 ?auto_118930 ) ) ( not ( = ?auto_118924 ?auto_118931 ) ) ( not ( = ?auto_118925 ?auto_118930 ) ) ( not ( = ?auto_118925 ?auto_118931 ) ) ( not ( = ?auto_118926 ?auto_118930 ) ) ( not ( = ?auto_118926 ?auto_118931 ) ) ( not ( = ?auto_118927 ?auto_118930 ) ) ( not ( = ?auto_118927 ?auto_118931 ) ) ( not ( = ?auto_118929 ?auto_118930 ) ) ( not ( = ?auto_118929 ?auto_118931 ) ) ( not ( = ?auto_118930 ?auto_118931 ) ) ( ON ?auto_118930 ?auto_118929 ) ( not ( = ?auto_118928 ?auto_118931 ) ) ( not ( = ?auto_118924 ?auto_118928 ) ) ( not ( = ?auto_118925 ?auto_118928 ) ) ( not ( = ?auto_118926 ?auto_118928 ) ) ( not ( = ?auto_118927 ?auto_118928 ) ) ( not ( = ?auto_118929 ?auto_118928 ) ) ( not ( = ?auto_118930 ?auto_118928 ) ) ( ON ?auto_118931 ?auto_118930 ) ( CLEAR ?auto_118931 ) ( ON ?auto_118928 ?auto_118932 ) ( CLEAR ?auto_118928 ) ( HAND-EMPTY ) ( not ( = ?auto_118924 ?auto_118932 ) ) ( not ( = ?auto_118925 ?auto_118932 ) ) ( not ( = ?auto_118926 ?auto_118932 ) ) ( not ( = ?auto_118927 ?auto_118932 ) ) ( not ( = ?auto_118929 ?auto_118932 ) ) ( not ( = ?auto_118930 ?auto_118932 ) ) ( not ( = ?auto_118931 ?auto_118932 ) ) ( not ( = ?auto_118928 ?auto_118932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118928 ?auto_118932 )
      ( MAKE-4PILE ?auto_118924 ?auto_118925 ?auto_118926 ?auto_118927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118933 - BLOCK
      ?auto_118934 - BLOCK
      ?auto_118935 - BLOCK
      ?auto_118936 - BLOCK
    )
    :vars
    (
      ?auto_118938 - BLOCK
      ?auto_118941 - BLOCK
      ?auto_118939 - BLOCK
      ?auto_118937 - BLOCK
      ?auto_118940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118938 ?auto_118936 ) ( ON-TABLE ?auto_118933 ) ( ON ?auto_118934 ?auto_118933 ) ( ON ?auto_118935 ?auto_118934 ) ( ON ?auto_118936 ?auto_118935 ) ( not ( = ?auto_118933 ?auto_118934 ) ) ( not ( = ?auto_118933 ?auto_118935 ) ) ( not ( = ?auto_118933 ?auto_118936 ) ) ( not ( = ?auto_118933 ?auto_118938 ) ) ( not ( = ?auto_118934 ?auto_118935 ) ) ( not ( = ?auto_118934 ?auto_118936 ) ) ( not ( = ?auto_118934 ?auto_118938 ) ) ( not ( = ?auto_118935 ?auto_118936 ) ) ( not ( = ?auto_118935 ?auto_118938 ) ) ( not ( = ?auto_118936 ?auto_118938 ) ) ( not ( = ?auto_118933 ?auto_118941 ) ) ( not ( = ?auto_118933 ?auto_118939 ) ) ( not ( = ?auto_118934 ?auto_118941 ) ) ( not ( = ?auto_118934 ?auto_118939 ) ) ( not ( = ?auto_118935 ?auto_118941 ) ) ( not ( = ?auto_118935 ?auto_118939 ) ) ( not ( = ?auto_118936 ?auto_118941 ) ) ( not ( = ?auto_118936 ?auto_118939 ) ) ( not ( = ?auto_118938 ?auto_118941 ) ) ( not ( = ?auto_118938 ?auto_118939 ) ) ( not ( = ?auto_118941 ?auto_118939 ) ) ( ON ?auto_118941 ?auto_118938 ) ( not ( = ?auto_118937 ?auto_118939 ) ) ( not ( = ?auto_118933 ?auto_118937 ) ) ( not ( = ?auto_118934 ?auto_118937 ) ) ( not ( = ?auto_118935 ?auto_118937 ) ) ( not ( = ?auto_118936 ?auto_118937 ) ) ( not ( = ?auto_118938 ?auto_118937 ) ) ( not ( = ?auto_118941 ?auto_118937 ) ) ( ON ?auto_118937 ?auto_118940 ) ( CLEAR ?auto_118937 ) ( not ( = ?auto_118933 ?auto_118940 ) ) ( not ( = ?auto_118934 ?auto_118940 ) ) ( not ( = ?auto_118935 ?auto_118940 ) ) ( not ( = ?auto_118936 ?auto_118940 ) ) ( not ( = ?auto_118938 ?auto_118940 ) ) ( not ( = ?auto_118941 ?auto_118940 ) ) ( not ( = ?auto_118939 ?auto_118940 ) ) ( not ( = ?auto_118937 ?auto_118940 ) ) ( HOLDING ?auto_118939 ) ( CLEAR ?auto_118941 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118933 ?auto_118934 ?auto_118935 ?auto_118936 ?auto_118938 ?auto_118941 ?auto_118939 )
      ( MAKE-4PILE ?auto_118933 ?auto_118934 ?auto_118935 ?auto_118936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119015 - BLOCK
      ?auto_119016 - BLOCK
      ?auto_119017 - BLOCK
      ?auto_119018 - BLOCK
    )
    :vars
    (
      ?auto_119019 - BLOCK
      ?auto_119021 - BLOCK
      ?auto_119022 - BLOCK
      ?auto_119020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119015 ) ( ON ?auto_119016 ?auto_119015 ) ( not ( = ?auto_119015 ?auto_119016 ) ) ( not ( = ?auto_119015 ?auto_119017 ) ) ( not ( = ?auto_119015 ?auto_119018 ) ) ( not ( = ?auto_119016 ?auto_119017 ) ) ( not ( = ?auto_119016 ?auto_119018 ) ) ( not ( = ?auto_119017 ?auto_119018 ) ) ( ON ?auto_119018 ?auto_119019 ) ( not ( = ?auto_119015 ?auto_119019 ) ) ( not ( = ?auto_119016 ?auto_119019 ) ) ( not ( = ?auto_119017 ?auto_119019 ) ) ( not ( = ?auto_119018 ?auto_119019 ) ) ( CLEAR ?auto_119016 ) ( ON ?auto_119017 ?auto_119018 ) ( CLEAR ?auto_119017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119021 ) ( ON ?auto_119022 ?auto_119021 ) ( ON ?auto_119020 ?auto_119022 ) ( ON ?auto_119019 ?auto_119020 ) ( not ( = ?auto_119021 ?auto_119022 ) ) ( not ( = ?auto_119021 ?auto_119020 ) ) ( not ( = ?auto_119021 ?auto_119019 ) ) ( not ( = ?auto_119021 ?auto_119018 ) ) ( not ( = ?auto_119021 ?auto_119017 ) ) ( not ( = ?auto_119022 ?auto_119020 ) ) ( not ( = ?auto_119022 ?auto_119019 ) ) ( not ( = ?auto_119022 ?auto_119018 ) ) ( not ( = ?auto_119022 ?auto_119017 ) ) ( not ( = ?auto_119020 ?auto_119019 ) ) ( not ( = ?auto_119020 ?auto_119018 ) ) ( not ( = ?auto_119020 ?auto_119017 ) ) ( not ( = ?auto_119015 ?auto_119021 ) ) ( not ( = ?auto_119015 ?auto_119022 ) ) ( not ( = ?auto_119015 ?auto_119020 ) ) ( not ( = ?auto_119016 ?auto_119021 ) ) ( not ( = ?auto_119016 ?auto_119022 ) ) ( not ( = ?auto_119016 ?auto_119020 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119021 ?auto_119022 ?auto_119020 ?auto_119019 ?auto_119018 )
      ( MAKE-4PILE ?auto_119015 ?auto_119016 ?auto_119017 ?auto_119018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119023 - BLOCK
      ?auto_119024 - BLOCK
      ?auto_119025 - BLOCK
      ?auto_119026 - BLOCK
    )
    :vars
    (
      ?auto_119030 - BLOCK
      ?auto_119027 - BLOCK
      ?auto_119029 - BLOCK
      ?auto_119028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119023 ) ( not ( = ?auto_119023 ?auto_119024 ) ) ( not ( = ?auto_119023 ?auto_119025 ) ) ( not ( = ?auto_119023 ?auto_119026 ) ) ( not ( = ?auto_119024 ?auto_119025 ) ) ( not ( = ?auto_119024 ?auto_119026 ) ) ( not ( = ?auto_119025 ?auto_119026 ) ) ( ON ?auto_119026 ?auto_119030 ) ( not ( = ?auto_119023 ?auto_119030 ) ) ( not ( = ?auto_119024 ?auto_119030 ) ) ( not ( = ?auto_119025 ?auto_119030 ) ) ( not ( = ?auto_119026 ?auto_119030 ) ) ( ON ?auto_119025 ?auto_119026 ) ( CLEAR ?auto_119025 ) ( ON-TABLE ?auto_119027 ) ( ON ?auto_119029 ?auto_119027 ) ( ON ?auto_119028 ?auto_119029 ) ( ON ?auto_119030 ?auto_119028 ) ( not ( = ?auto_119027 ?auto_119029 ) ) ( not ( = ?auto_119027 ?auto_119028 ) ) ( not ( = ?auto_119027 ?auto_119030 ) ) ( not ( = ?auto_119027 ?auto_119026 ) ) ( not ( = ?auto_119027 ?auto_119025 ) ) ( not ( = ?auto_119029 ?auto_119028 ) ) ( not ( = ?auto_119029 ?auto_119030 ) ) ( not ( = ?auto_119029 ?auto_119026 ) ) ( not ( = ?auto_119029 ?auto_119025 ) ) ( not ( = ?auto_119028 ?auto_119030 ) ) ( not ( = ?auto_119028 ?auto_119026 ) ) ( not ( = ?auto_119028 ?auto_119025 ) ) ( not ( = ?auto_119023 ?auto_119027 ) ) ( not ( = ?auto_119023 ?auto_119029 ) ) ( not ( = ?auto_119023 ?auto_119028 ) ) ( not ( = ?auto_119024 ?auto_119027 ) ) ( not ( = ?auto_119024 ?auto_119029 ) ) ( not ( = ?auto_119024 ?auto_119028 ) ) ( HOLDING ?auto_119024 ) ( CLEAR ?auto_119023 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119023 ?auto_119024 )
      ( MAKE-4PILE ?auto_119023 ?auto_119024 ?auto_119025 ?auto_119026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119031 - BLOCK
      ?auto_119032 - BLOCK
      ?auto_119033 - BLOCK
      ?auto_119034 - BLOCK
    )
    :vars
    (
      ?auto_119036 - BLOCK
      ?auto_119038 - BLOCK
      ?auto_119037 - BLOCK
      ?auto_119035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119031 ) ( not ( = ?auto_119031 ?auto_119032 ) ) ( not ( = ?auto_119031 ?auto_119033 ) ) ( not ( = ?auto_119031 ?auto_119034 ) ) ( not ( = ?auto_119032 ?auto_119033 ) ) ( not ( = ?auto_119032 ?auto_119034 ) ) ( not ( = ?auto_119033 ?auto_119034 ) ) ( ON ?auto_119034 ?auto_119036 ) ( not ( = ?auto_119031 ?auto_119036 ) ) ( not ( = ?auto_119032 ?auto_119036 ) ) ( not ( = ?auto_119033 ?auto_119036 ) ) ( not ( = ?auto_119034 ?auto_119036 ) ) ( ON ?auto_119033 ?auto_119034 ) ( ON-TABLE ?auto_119038 ) ( ON ?auto_119037 ?auto_119038 ) ( ON ?auto_119035 ?auto_119037 ) ( ON ?auto_119036 ?auto_119035 ) ( not ( = ?auto_119038 ?auto_119037 ) ) ( not ( = ?auto_119038 ?auto_119035 ) ) ( not ( = ?auto_119038 ?auto_119036 ) ) ( not ( = ?auto_119038 ?auto_119034 ) ) ( not ( = ?auto_119038 ?auto_119033 ) ) ( not ( = ?auto_119037 ?auto_119035 ) ) ( not ( = ?auto_119037 ?auto_119036 ) ) ( not ( = ?auto_119037 ?auto_119034 ) ) ( not ( = ?auto_119037 ?auto_119033 ) ) ( not ( = ?auto_119035 ?auto_119036 ) ) ( not ( = ?auto_119035 ?auto_119034 ) ) ( not ( = ?auto_119035 ?auto_119033 ) ) ( not ( = ?auto_119031 ?auto_119038 ) ) ( not ( = ?auto_119031 ?auto_119037 ) ) ( not ( = ?auto_119031 ?auto_119035 ) ) ( not ( = ?auto_119032 ?auto_119038 ) ) ( not ( = ?auto_119032 ?auto_119037 ) ) ( not ( = ?auto_119032 ?auto_119035 ) ) ( CLEAR ?auto_119031 ) ( ON ?auto_119032 ?auto_119033 ) ( CLEAR ?auto_119032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119038 ?auto_119037 ?auto_119035 ?auto_119036 ?auto_119034 ?auto_119033 )
      ( MAKE-4PILE ?auto_119031 ?auto_119032 ?auto_119033 ?auto_119034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119039 - BLOCK
      ?auto_119040 - BLOCK
      ?auto_119041 - BLOCK
      ?auto_119042 - BLOCK
    )
    :vars
    (
      ?auto_119046 - BLOCK
      ?auto_119043 - BLOCK
      ?auto_119044 - BLOCK
      ?auto_119045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119039 ?auto_119040 ) ) ( not ( = ?auto_119039 ?auto_119041 ) ) ( not ( = ?auto_119039 ?auto_119042 ) ) ( not ( = ?auto_119040 ?auto_119041 ) ) ( not ( = ?auto_119040 ?auto_119042 ) ) ( not ( = ?auto_119041 ?auto_119042 ) ) ( ON ?auto_119042 ?auto_119046 ) ( not ( = ?auto_119039 ?auto_119046 ) ) ( not ( = ?auto_119040 ?auto_119046 ) ) ( not ( = ?auto_119041 ?auto_119046 ) ) ( not ( = ?auto_119042 ?auto_119046 ) ) ( ON ?auto_119041 ?auto_119042 ) ( ON-TABLE ?auto_119043 ) ( ON ?auto_119044 ?auto_119043 ) ( ON ?auto_119045 ?auto_119044 ) ( ON ?auto_119046 ?auto_119045 ) ( not ( = ?auto_119043 ?auto_119044 ) ) ( not ( = ?auto_119043 ?auto_119045 ) ) ( not ( = ?auto_119043 ?auto_119046 ) ) ( not ( = ?auto_119043 ?auto_119042 ) ) ( not ( = ?auto_119043 ?auto_119041 ) ) ( not ( = ?auto_119044 ?auto_119045 ) ) ( not ( = ?auto_119044 ?auto_119046 ) ) ( not ( = ?auto_119044 ?auto_119042 ) ) ( not ( = ?auto_119044 ?auto_119041 ) ) ( not ( = ?auto_119045 ?auto_119046 ) ) ( not ( = ?auto_119045 ?auto_119042 ) ) ( not ( = ?auto_119045 ?auto_119041 ) ) ( not ( = ?auto_119039 ?auto_119043 ) ) ( not ( = ?auto_119039 ?auto_119044 ) ) ( not ( = ?auto_119039 ?auto_119045 ) ) ( not ( = ?auto_119040 ?auto_119043 ) ) ( not ( = ?auto_119040 ?auto_119044 ) ) ( not ( = ?auto_119040 ?auto_119045 ) ) ( ON ?auto_119040 ?auto_119041 ) ( CLEAR ?auto_119040 ) ( HOLDING ?auto_119039 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119039 )
      ( MAKE-4PILE ?auto_119039 ?auto_119040 ?auto_119041 ?auto_119042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119047 - BLOCK
      ?auto_119048 - BLOCK
      ?auto_119049 - BLOCK
      ?auto_119050 - BLOCK
    )
    :vars
    (
      ?auto_119051 - BLOCK
      ?auto_119054 - BLOCK
      ?auto_119053 - BLOCK
      ?auto_119052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119047 ?auto_119048 ) ) ( not ( = ?auto_119047 ?auto_119049 ) ) ( not ( = ?auto_119047 ?auto_119050 ) ) ( not ( = ?auto_119048 ?auto_119049 ) ) ( not ( = ?auto_119048 ?auto_119050 ) ) ( not ( = ?auto_119049 ?auto_119050 ) ) ( ON ?auto_119050 ?auto_119051 ) ( not ( = ?auto_119047 ?auto_119051 ) ) ( not ( = ?auto_119048 ?auto_119051 ) ) ( not ( = ?auto_119049 ?auto_119051 ) ) ( not ( = ?auto_119050 ?auto_119051 ) ) ( ON ?auto_119049 ?auto_119050 ) ( ON-TABLE ?auto_119054 ) ( ON ?auto_119053 ?auto_119054 ) ( ON ?auto_119052 ?auto_119053 ) ( ON ?auto_119051 ?auto_119052 ) ( not ( = ?auto_119054 ?auto_119053 ) ) ( not ( = ?auto_119054 ?auto_119052 ) ) ( not ( = ?auto_119054 ?auto_119051 ) ) ( not ( = ?auto_119054 ?auto_119050 ) ) ( not ( = ?auto_119054 ?auto_119049 ) ) ( not ( = ?auto_119053 ?auto_119052 ) ) ( not ( = ?auto_119053 ?auto_119051 ) ) ( not ( = ?auto_119053 ?auto_119050 ) ) ( not ( = ?auto_119053 ?auto_119049 ) ) ( not ( = ?auto_119052 ?auto_119051 ) ) ( not ( = ?auto_119052 ?auto_119050 ) ) ( not ( = ?auto_119052 ?auto_119049 ) ) ( not ( = ?auto_119047 ?auto_119054 ) ) ( not ( = ?auto_119047 ?auto_119053 ) ) ( not ( = ?auto_119047 ?auto_119052 ) ) ( not ( = ?auto_119048 ?auto_119054 ) ) ( not ( = ?auto_119048 ?auto_119053 ) ) ( not ( = ?auto_119048 ?auto_119052 ) ) ( ON ?auto_119048 ?auto_119049 ) ( ON ?auto_119047 ?auto_119048 ) ( CLEAR ?auto_119047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119054 ?auto_119053 ?auto_119052 ?auto_119051 ?auto_119050 ?auto_119049 ?auto_119048 )
      ( MAKE-4PILE ?auto_119047 ?auto_119048 ?auto_119049 ?auto_119050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119059 - BLOCK
      ?auto_119060 - BLOCK
      ?auto_119061 - BLOCK
      ?auto_119062 - BLOCK
    )
    :vars
    (
      ?auto_119064 - BLOCK
      ?auto_119065 - BLOCK
      ?auto_119063 - BLOCK
      ?auto_119066 - BLOCK
      ?auto_119067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119059 ?auto_119060 ) ) ( not ( = ?auto_119059 ?auto_119061 ) ) ( not ( = ?auto_119059 ?auto_119062 ) ) ( not ( = ?auto_119060 ?auto_119061 ) ) ( not ( = ?auto_119060 ?auto_119062 ) ) ( not ( = ?auto_119061 ?auto_119062 ) ) ( ON ?auto_119062 ?auto_119064 ) ( not ( = ?auto_119059 ?auto_119064 ) ) ( not ( = ?auto_119060 ?auto_119064 ) ) ( not ( = ?auto_119061 ?auto_119064 ) ) ( not ( = ?auto_119062 ?auto_119064 ) ) ( ON ?auto_119061 ?auto_119062 ) ( ON-TABLE ?auto_119065 ) ( ON ?auto_119063 ?auto_119065 ) ( ON ?auto_119066 ?auto_119063 ) ( ON ?auto_119064 ?auto_119066 ) ( not ( = ?auto_119065 ?auto_119063 ) ) ( not ( = ?auto_119065 ?auto_119066 ) ) ( not ( = ?auto_119065 ?auto_119064 ) ) ( not ( = ?auto_119065 ?auto_119062 ) ) ( not ( = ?auto_119065 ?auto_119061 ) ) ( not ( = ?auto_119063 ?auto_119066 ) ) ( not ( = ?auto_119063 ?auto_119064 ) ) ( not ( = ?auto_119063 ?auto_119062 ) ) ( not ( = ?auto_119063 ?auto_119061 ) ) ( not ( = ?auto_119066 ?auto_119064 ) ) ( not ( = ?auto_119066 ?auto_119062 ) ) ( not ( = ?auto_119066 ?auto_119061 ) ) ( not ( = ?auto_119059 ?auto_119065 ) ) ( not ( = ?auto_119059 ?auto_119063 ) ) ( not ( = ?auto_119059 ?auto_119066 ) ) ( not ( = ?auto_119060 ?auto_119065 ) ) ( not ( = ?auto_119060 ?auto_119063 ) ) ( not ( = ?auto_119060 ?auto_119066 ) ) ( ON ?auto_119060 ?auto_119061 ) ( CLEAR ?auto_119060 ) ( ON ?auto_119059 ?auto_119067 ) ( CLEAR ?auto_119059 ) ( HAND-EMPTY ) ( not ( = ?auto_119059 ?auto_119067 ) ) ( not ( = ?auto_119060 ?auto_119067 ) ) ( not ( = ?auto_119061 ?auto_119067 ) ) ( not ( = ?auto_119062 ?auto_119067 ) ) ( not ( = ?auto_119064 ?auto_119067 ) ) ( not ( = ?auto_119065 ?auto_119067 ) ) ( not ( = ?auto_119063 ?auto_119067 ) ) ( not ( = ?auto_119066 ?auto_119067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119059 ?auto_119067 )
      ( MAKE-4PILE ?auto_119059 ?auto_119060 ?auto_119061 ?auto_119062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119068 - BLOCK
      ?auto_119069 - BLOCK
      ?auto_119070 - BLOCK
      ?auto_119071 - BLOCK
    )
    :vars
    (
      ?auto_119073 - BLOCK
      ?auto_119074 - BLOCK
      ?auto_119072 - BLOCK
      ?auto_119075 - BLOCK
      ?auto_119076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119068 ?auto_119069 ) ) ( not ( = ?auto_119068 ?auto_119070 ) ) ( not ( = ?auto_119068 ?auto_119071 ) ) ( not ( = ?auto_119069 ?auto_119070 ) ) ( not ( = ?auto_119069 ?auto_119071 ) ) ( not ( = ?auto_119070 ?auto_119071 ) ) ( ON ?auto_119071 ?auto_119073 ) ( not ( = ?auto_119068 ?auto_119073 ) ) ( not ( = ?auto_119069 ?auto_119073 ) ) ( not ( = ?auto_119070 ?auto_119073 ) ) ( not ( = ?auto_119071 ?auto_119073 ) ) ( ON ?auto_119070 ?auto_119071 ) ( ON-TABLE ?auto_119074 ) ( ON ?auto_119072 ?auto_119074 ) ( ON ?auto_119075 ?auto_119072 ) ( ON ?auto_119073 ?auto_119075 ) ( not ( = ?auto_119074 ?auto_119072 ) ) ( not ( = ?auto_119074 ?auto_119075 ) ) ( not ( = ?auto_119074 ?auto_119073 ) ) ( not ( = ?auto_119074 ?auto_119071 ) ) ( not ( = ?auto_119074 ?auto_119070 ) ) ( not ( = ?auto_119072 ?auto_119075 ) ) ( not ( = ?auto_119072 ?auto_119073 ) ) ( not ( = ?auto_119072 ?auto_119071 ) ) ( not ( = ?auto_119072 ?auto_119070 ) ) ( not ( = ?auto_119075 ?auto_119073 ) ) ( not ( = ?auto_119075 ?auto_119071 ) ) ( not ( = ?auto_119075 ?auto_119070 ) ) ( not ( = ?auto_119068 ?auto_119074 ) ) ( not ( = ?auto_119068 ?auto_119072 ) ) ( not ( = ?auto_119068 ?auto_119075 ) ) ( not ( = ?auto_119069 ?auto_119074 ) ) ( not ( = ?auto_119069 ?auto_119072 ) ) ( not ( = ?auto_119069 ?auto_119075 ) ) ( ON ?auto_119068 ?auto_119076 ) ( CLEAR ?auto_119068 ) ( not ( = ?auto_119068 ?auto_119076 ) ) ( not ( = ?auto_119069 ?auto_119076 ) ) ( not ( = ?auto_119070 ?auto_119076 ) ) ( not ( = ?auto_119071 ?auto_119076 ) ) ( not ( = ?auto_119073 ?auto_119076 ) ) ( not ( = ?auto_119074 ?auto_119076 ) ) ( not ( = ?auto_119072 ?auto_119076 ) ) ( not ( = ?auto_119075 ?auto_119076 ) ) ( HOLDING ?auto_119069 ) ( CLEAR ?auto_119070 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119074 ?auto_119072 ?auto_119075 ?auto_119073 ?auto_119071 ?auto_119070 ?auto_119069 )
      ( MAKE-4PILE ?auto_119068 ?auto_119069 ?auto_119070 ?auto_119071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119077 - BLOCK
      ?auto_119078 - BLOCK
      ?auto_119079 - BLOCK
      ?auto_119080 - BLOCK
    )
    :vars
    (
      ?auto_119084 - BLOCK
      ?auto_119085 - BLOCK
      ?auto_119082 - BLOCK
      ?auto_119081 - BLOCK
      ?auto_119083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119077 ?auto_119078 ) ) ( not ( = ?auto_119077 ?auto_119079 ) ) ( not ( = ?auto_119077 ?auto_119080 ) ) ( not ( = ?auto_119078 ?auto_119079 ) ) ( not ( = ?auto_119078 ?auto_119080 ) ) ( not ( = ?auto_119079 ?auto_119080 ) ) ( ON ?auto_119080 ?auto_119084 ) ( not ( = ?auto_119077 ?auto_119084 ) ) ( not ( = ?auto_119078 ?auto_119084 ) ) ( not ( = ?auto_119079 ?auto_119084 ) ) ( not ( = ?auto_119080 ?auto_119084 ) ) ( ON ?auto_119079 ?auto_119080 ) ( ON-TABLE ?auto_119085 ) ( ON ?auto_119082 ?auto_119085 ) ( ON ?auto_119081 ?auto_119082 ) ( ON ?auto_119084 ?auto_119081 ) ( not ( = ?auto_119085 ?auto_119082 ) ) ( not ( = ?auto_119085 ?auto_119081 ) ) ( not ( = ?auto_119085 ?auto_119084 ) ) ( not ( = ?auto_119085 ?auto_119080 ) ) ( not ( = ?auto_119085 ?auto_119079 ) ) ( not ( = ?auto_119082 ?auto_119081 ) ) ( not ( = ?auto_119082 ?auto_119084 ) ) ( not ( = ?auto_119082 ?auto_119080 ) ) ( not ( = ?auto_119082 ?auto_119079 ) ) ( not ( = ?auto_119081 ?auto_119084 ) ) ( not ( = ?auto_119081 ?auto_119080 ) ) ( not ( = ?auto_119081 ?auto_119079 ) ) ( not ( = ?auto_119077 ?auto_119085 ) ) ( not ( = ?auto_119077 ?auto_119082 ) ) ( not ( = ?auto_119077 ?auto_119081 ) ) ( not ( = ?auto_119078 ?auto_119085 ) ) ( not ( = ?auto_119078 ?auto_119082 ) ) ( not ( = ?auto_119078 ?auto_119081 ) ) ( ON ?auto_119077 ?auto_119083 ) ( not ( = ?auto_119077 ?auto_119083 ) ) ( not ( = ?auto_119078 ?auto_119083 ) ) ( not ( = ?auto_119079 ?auto_119083 ) ) ( not ( = ?auto_119080 ?auto_119083 ) ) ( not ( = ?auto_119084 ?auto_119083 ) ) ( not ( = ?auto_119085 ?auto_119083 ) ) ( not ( = ?auto_119082 ?auto_119083 ) ) ( not ( = ?auto_119081 ?auto_119083 ) ) ( CLEAR ?auto_119079 ) ( ON ?auto_119078 ?auto_119077 ) ( CLEAR ?auto_119078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119083 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119083 ?auto_119077 )
      ( MAKE-4PILE ?auto_119077 ?auto_119078 ?auto_119079 ?auto_119080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119086 - BLOCK
      ?auto_119087 - BLOCK
      ?auto_119088 - BLOCK
      ?auto_119089 - BLOCK
    )
    :vars
    (
      ?auto_119091 - BLOCK
      ?auto_119094 - BLOCK
      ?auto_119092 - BLOCK
      ?auto_119093 - BLOCK
      ?auto_119090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119086 ?auto_119087 ) ) ( not ( = ?auto_119086 ?auto_119088 ) ) ( not ( = ?auto_119086 ?auto_119089 ) ) ( not ( = ?auto_119087 ?auto_119088 ) ) ( not ( = ?auto_119087 ?auto_119089 ) ) ( not ( = ?auto_119088 ?auto_119089 ) ) ( ON ?auto_119089 ?auto_119091 ) ( not ( = ?auto_119086 ?auto_119091 ) ) ( not ( = ?auto_119087 ?auto_119091 ) ) ( not ( = ?auto_119088 ?auto_119091 ) ) ( not ( = ?auto_119089 ?auto_119091 ) ) ( ON-TABLE ?auto_119094 ) ( ON ?auto_119092 ?auto_119094 ) ( ON ?auto_119093 ?auto_119092 ) ( ON ?auto_119091 ?auto_119093 ) ( not ( = ?auto_119094 ?auto_119092 ) ) ( not ( = ?auto_119094 ?auto_119093 ) ) ( not ( = ?auto_119094 ?auto_119091 ) ) ( not ( = ?auto_119094 ?auto_119089 ) ) ( not ( = ?auto_119094 ?auto_119088 ) ) ( not ( = ?auto_119092 ?auto_119093 ) ) ( not ( = ?auto_119092 ?auto_119091 ) ) ( not ( = ?auto_119092 ?auto_119089 ) ) ( not ( = ?auto_119092 ?auto_119088 ) ) ( not ( = ?auto_119093 ?auto_119091 ) ) ( not ( = ?auto_119093 ?auto_119089 ) ) ( not ( = ?auto_119093 ?auto_119088 ) ) ( not ( = ?auto_119086 ?auto_119094 ) ) ( not ( = ?auto_119086 ?auto_119092 ) ) ( not ( = ?auto_119086 ?auto_119093 ) ) ( not ( = ?auto_119087 ?auto_119094 ) ) ( not ( = ?auto_119087 ?auto_119092 ) ) ( not ( = ?auto_119087 ?auto_119093 ) ) ( ON ?auto_119086 ?auto_119090 ) ( not ( = ?auto_119086 ?auto_119090 ) ) ( not ( = ?auto_119087 ?auto_119090 ) ) ( not ( = ?auto_119088 ?auto_119090 ) ) ( not ( = ?auto_119089 ?auto_119090 ) ) ( not ( = ?auto_119091 ?auto_119090 ) ) ( not ( = ?auto_119094 ?auto_119090 ) ) ( not ( = ?auto_119092 ?auto_119090 ) ) ( not ( = ?auto_119093 ?auto_119090 ) ) ( ON ?auto_119087 ?auto_119086 ) ( CLEAR ?auto_119087 ) ( ON-TABLE ?auto_119090 ) ( HOLDING ?auto_119088 ) ( CLEAR ?auto_119089 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119094 ?auto_119092 ?auto_119093 ?auto_119091 ?auto_119089 ?auto_119088 )
      ( MAKE-4PILE ?auto_119086 ?auto_119087 ?auto_119088 ?auto_119089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119095 - BLOCK
      ?auto_119096 - BLOCK
      ?auto_119097 - BLOCK
      ?auto_119098 - BLOCK
    )
    :vars
    (
      ?auto_119099 - BLOCK
      ?auto_119103 - BLOCK
      ?auto_119101 - BLOCK
      ?auto_119100 - BLOCK
      ?auto_119102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119095 ?auto_119096 ) ) ( not ( = ?auto_119095 ?auto_119097 ) ) ( not ( = ?auto_119095 ?auto_119098 ) ) ( not ( = ?auto_119096 ?auto_119097 ) ) ( not ( = ?auto_119096 ?auto_119098 ) ) ( not ( = ?auto_119097 ?auto_119098 ) ) ( ON ?auto_119098 ?auto_119099 ) ( not ( = ?auto_119095 ?auto_119099 ) ) ( not ( = ?auto_119096 ?auto_119099 ) ) ( not ( = ?auto_119097 ?auto_119099 ) ) ( not ( = ?auto_119098 ?auto_119099 ) ) ( ON-TABLE ?auto_119103 ) ( ON ?auto_119101 ?auto_119103 ) ( ON ?auto_119100 ?auto_119101 ) ( ON ?auto_119099 ?auto_119100 ) ( not ( = ?auto_119103 ?auto_119101 ) ) ( not ( = ?auto_119103 ?auto_119100 ) ) ( not ( = ?auto_119103 ?auto_119099 ) ) ( not ( = ?auto_119103 ?auto_119098 ) ) ( not ( = ?auto_119103 ?auto_119097 ) ) ( not ( = ?auto_119101 ?auto_119100 ) ) ( not ( = ?auto_119101 ?auto_119099 ) ) ( not ( = ?auto_119101 ?auto_119098 ) ) ( not ( = ?auto_119101 ?auto_119097 ) ) ( not ( = ?auto_119100 ?auto_119099 ) ) ( not ( = ?auto_119100 ?auto_119098 ) ) ( not ( = ?auto_119100 ?auto_119097 ) ) ( not ( = ?auto_119095 ?auto_119103 ) ) ( not ( = ?auto_119095 ?auto_119101 ) ) ( not ( = ?auto_119095 ?auto_119100 ) ) ( not ( = ?auto_119096 ?auto_119103 ) ) ( not ( = ?auto_119096 ?auto_119101 ) ) ( not ( = ?auto_119096 ?auto_119100 ) ) ( ON ?auto_119095 ?auto_119102 ) ( not ( = ?auto_119095 ?auto_119102 ) ) ( not ( = ?auto_119096 ?auto_119102 ) ) ( not ( = ?auto_119097 ?auto_119102 ) ) ( not ( = ?auto_119098 ?auto_119102 ) ) ( not ( = ?auto_119099 ?auto_119102 ) ) ( not ( = ?auto_119103 ?auto_119102 ) ) ( not ( = ?auto_119101 ?auto_119102 ) ) ( not ( = ?auto_119100 ?auto_119102 ) ) ( ON ?auto_119096 ?auto_119095 ) ( ON-TABLE ?auto_119102 ) ( CLEAR ?auto_119098 ) ( ON ?auto_119097 ?auto_119096 ) ( CLEAR ?auto_119097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119102 ?auto_119095 ?auto_119096 )
      ( MAKE-4PILE ?auto_119095 ?auto_119096 ?auto_119097 ?auto_119098 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119104 - BLOCK
      ?auto_119105 - BLOCK
      ?auto_119106 - BLOCK
      ?auto_119107 - BLOCK
    )
    :vars
    (
      ?auto_119109 - BLOCK
      ?auto_119110 - BLOCK
      ?auto_119112 - BLOCK
      ?auto_119108 - BLOCK
      ?auto_119111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119104 ?auto_119105 ) ) ( not ( = ?auto_119104 ?auto_119106 ) ) ( not ( = ?auto_119104 ?auto_119107 ) ) ( not ( = ?auto_119105 ?auto_119106 ) ) ( not ( = ?auto_119105 ?auto_119107 ) ) ( not ( = ?auto_119106 ?auto_119107 ) ) ( not ( = ?auto_119104 ?auto_119109 ) ) ( not ( = ?auto_119105 ?auto_119109 ) ) ( not ( = ?auto_119106 ?auto_119109 ) ) ( not ( = ?auto_119107 ?auto_119109 ) ) ( ON-TABLE ?auto_119110 ) ( ON ?auto_119112 ?auto_119110 ) ( ON ?auto_119108 ?auto_119112 ) ( ON ?auto_119109 ?auto_119108 ) ( not ( = ?auto_119110 ?auto_119112 ) ) ( not ( = ?auto_119110 ?auto_119108 ) ) ( not ( = ?auto_119110 ?auto_119109 ) ) ( not ( = ?auto_119110 ?auto_119107 ) ) ( not ( = ?auto_119110 ?auto_119106 ) ) ( not ( = ?auto_119112 ?auto_119108 ) ) ( not ( = ?auto_119112 ?auto_119109 ) ) ( not ( = ?auto_119112 ?auto_119107 ) ) ( not ( = ?auto_119112 ?auto_119106 ) ) ( not ( = ?auto_119108 ?auto_119109 ) ) ( not ( = ?auto_119108 ?auto_119107 ) ) ( not ( = ?auto_119108 ?auto_119106 ) ) ( not ( = ?auto_119104 ?auto_119110 ) ) ( not ( = ?auto_119104 ?auto_119112 ) ) ( not ( = ?auto_119104 ?auto_119108 ) ) ( not ( = ?auto_119105 ?auto_119110 ) ) ( not ( = ?auto_119105 ?auto_119112 ) ) ( not ( = ?auto_119105 ?auto_119108 ) ) ( ON ?auto_119104 ?auto_119111 ) ( not ( = ?auto_119104 ?auto_119111 ) ) ( not ( = ?auto_119105 ?auto_119111 ) ) ( not ( = ?auto_119106 ?auto_119111 ) ) ( not ( = ?auto_119107 ?auto_119111 ) ) ( not ( = ?auto_119109 ?auto_119111 ) ) ( not ( = ?auto_119110 ?auto_119111 ) ) ( not ( = ?auto_119112 ?auto_119111 ) ) ( not ( = ?auto_119108 ?auto_119111 ) ) ( ON ?auto_119105 ?auto_119104 ) ( ON-TABLE ?auto_119111 ) ( ON ?auto_119106 ?auto_119105 ) ( CLEAR ?auto_119106 ) ( HOLDING ?auto_119107 ) ( CLEAR ?auto_119109 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119110 ?auto_119112 ?auto_119108 ?auto_119109 ?auto_119107 )
      ( MAKE-4PILE ?auto_119104 ?auto_119105 ?auto_119106 ?auto_119107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119113 - BLOCK
      ?auto_119114 - BLOCK
      ?auto_119115 - BLOCK
      ?auto_119116 - BLOCK
    )
    :vars
    (
      ?auto_119119 - BLOCK
      ?auto_119117 - BLOCK
      ?auto_119120 - BLOCK
      ?auto_119118 - BLOCK
      ?auto_119121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119113 ?auto_119114 ) ) ( not ( = ?auto_119113 ?auto_119115 ) ) ( not ( = ?auto_119113 ?auto_119116 ) ) ( not ( = ?auto_119114 ?auto_119115 ) ) ( not ( = ?auto_119114 ?auto_119116 ) ) ( not ( = ?auto_119115 ?auto_119116 ) ) ( not ( = ?auto_119113 ?auto_119119 ) ) ( not ( = ?auto_119114 ?auto_119119 ) ) ( not ( = ?auto_119115 ?auto_119119 ) ) ( not ( = ?auto_119116 ?auto_119119 ) ) ( ON-TABLE ?auto_119117 ) ( ON ?auto_119120 ?auto_119117 ) ( ON ?auto_119118 ?auto_119120 ) ( ON ?auto_119119 ?auto_119118 ) ( not ( = ?auto_119117 ?auto_119120 ) ) ( not ( = ?auto_119117 ?auto_119118 ) ) ( not ( = ?auto_119117 ?auto_119119 ) ) ( not ( = ?auto_119117 ?auto_119116 ) ) ( not ( = ?auto_119117 ?auto_119115 ) ) ( not ( = ?auto_119120 ?auto_119118 ) ) ( not ( = ?auto_119120 ?auto_119119 ) ) ( not ( = ?auto_119120 ?auto_119116 ) ) ( not ( = ?auto_119120 ?auto_119115 ) ) ( not ( = ?auto_119118 ?auto_119119 ) ) ( not ( = ?auto_119118 ?auto_119116 ) ) ( not ( = ?auto_119118 ?auto_119115 ) ) ( not ( = ?auto_119113 ?auto_119117 ) ) ( not ( = ?auto_119113 ?auto_119120 ) ) ( not ( = ?auto_119113 ?auto_119118 ) ) ( not ( = ?auto_119114 ?auto_119117 ) ) ( not ( = ?auto_119114 ?auto_119120 ) ) ( not ( = ?auto_119114 ?auto_119118 ) ) ( ON ?auto_119113 ?auto_119121 ) ( not ( = ?auto_119113 ?auto_119121 ) ) ( not ( = ?auto_119114 ?auto_119121 ) ) ( not ( = ?auto_119115 ?auto_119121 ) ) ( not ( = ?auto_119116 ?auto_119121 ) ) ( not ( = ?auto_119119 ?auto_119121 ) ) ( not ( = ?auto_119117 ?auto_119121 ) ) ( not ( = ?auto_119120 ?auto_119121 ) ) ( not ( = ?auto_119118 ?auto_119121 ) ) ( ON ?auto_119114 ?auto_119113 ) ( ON-TABLE ?auto_119121 ) ( ON ?auto_119115 ?auto_119114 ) ( CLEAR ?auto_119119 ) ( ON ?auto_119116 ?auto_119115 ) ( CLEAR ?auto_119116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119121 ?auto_119113 ?auto_119114 ?auto_119115 )
      ( MAKE-4PILE ?auto_119113 ?auto_119114 ?auto_119115 ?auto_119116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119122 - BLOCK
      ?auto_119123 - BLOCK
      ?auto_119124 - BLOCK
      ?auto_119125 - BLOCK
    )
    :vars
    (
      ?auto_119128 - BLOCK
      ?auto_119126 - BLOCK
      ?auto_119129 - BLOCK
      ?auto_119130 - BLOCK
      ?auto_119127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119122 ?auto_119123 ) ) ( not ( = ?auto_119122 ?auto_119124 ) ) ( not ( = ?auto_119122 ?auto_119125 ) ) ( not ( = ?auto_119123 ?auto_119124 ) ) ( not ( = ?auto_119123 ?auto_119125 ) ) ( not ( = ?auto_119124 ?auto_119125 ) ) ( not ( = ?auto_119122 ?auto_119128 ) ) ( not ( = ?auto_119123 ?auto_119128 ) ) ( not ( = ?auto_119124 ?auto_119128 ) ) ( not ( = ?auto_119125 ?auto_119128 ) ) ( ON-TABLE ?auto_119126 ) ( ON ?auto_119129 ?auto_119126 ) ( ON ?auto_119130 ?auto_119129 ) ( not ( = ?auto_119126 ?auto_119129 ) ) ( not ( = ?auto_119126 ?auto_119130 ) ) ( not ( = ?auto_119126 ?auto_119128 ) ) ( not ( = ?auto_119126 ?auto_119125 ) ) ( not ( = ?auto_119126 ?auto_119124 ) ) ( not ( = ?auto_119129 ?auto_119130 ) ) ( not ( = ?auto_119129 ?auto_119128 ) ) ( not ( = ?auto_119129 ?auto_119125 ) ) ( not ( = ?auto_119129 ?auto_119124 ) ) ( not ( = ?auto_119130 ?auto_119128 ) ) ( not ( = ?auto_119130 ?auto_119125 ) ) ( not ( = ?auto_119130 ?auto_119124 ) ) ( not ( = ?auto_119122 ?auto_119126 ) ) ( not ( = ?auto_119122 ?auto_119129 ) ) ( not ( = ?auto_119122 ?auto_119130 ) ) ( not ( = ?auto_119123 ?auto_119126 ) ) ( not ( = ?auto_119123 ?auto_119129 ) ) ( not ( = ?auto_119123 ?auto_119130 ) ) ( ON ?auto_119122 ?auto_119127 ) ( not ( = ?auto_119122 ?auto_119127 ) ) ( not ( = ?auto_119123 ?auto_119127 ) ) ( not ( = ?auto_119124 ?auto_119127 ) ) ( not ( = ?auto_119125 ?auto_119127 ) ) ( not ( = ?auto_119128 ?auto_119127 ) ) ( not ( = ?auto_119126 ?auto_119127 ) ) ( not ( = ?auto_119129 ?auto_119127 ) ) ( not ( = ?auto_119130 ?auto_119127 ) ) ( ON ?auto_119123 ?auto_119122 ) ( ON-TABLE ?auto_119127 ) ( ON ?auto_119124 ?auto_119123 ) ( ON ?auto_119125 ?auto_119124 ) ( CLEAR ?auto_119125 ) ( HOLDING ?auto_119128 ) ( CLEAR ?auto_119130 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119126 ?auto_119129 ?auto_119130 ?auto_119128 )
      ( MAKE-4PILE ?auto_119122 ?auto_119123 ?auto_119124 ?auto_119125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119131 - BLOCK
      ?auto_119132 - BLOCK
      ?auto_119133 - BLOCK
      ?auto_119134 - BLOCK
    )
    :vars
    (
      ?auto_119138 - BLOCK
      ?auto_119136 - BLOCK
      ?auto_119135 - BLOCK
      ?auto_119137 - BLOCK
      ?auto_119139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119131 ?auto_119132 ) ) ( not ( = ?auto_119131 ?auto_119133 ) ) ( not ( = ?auto_119131 ?auto_119134 ) ) ( not ( = ?auto_119132 ?auto_119133 ) ) ( not ( = ?auto_119132 ?auto_119134 ) ) ( not ( = ?auto_119133 ?auto_119134 ) ) ( not ( = ?auto_119131 ?auto_119138 ) ) ( not ( = ?auto_119132 ?auto_119138 ) ) ( not ( = ?auto_119133 ?auto_119138 ) ) ( not ( = ?auto_119134 ?auto_119138 ) ) ( ON-TABLE ?auto_119136 ) ( ON ?auto_119135 ?auto_119136 ) ( ON ?auto_119137 ?auto_119135 ) ( not ( = ?auto_119136 ?auto_119135 ) ) ( not ( = ?auto_119136 ?auto_119137 ) ) ( not ( = ?auto_119136 ?auto_119138 ) ) ( not ( = ?auto_119136 ?auto_119134 ) ) ( not ( = ?auto_119136 ?auto_119133 ) ) ( not ( = ?auto_119135 ?auto_119137 ) ) ( not ( = ?auto_119135 ?auto_119138 ) ) ( not ( = ?auto_119135 ?auto_119134 ) ) ( not ( = ?auto_119135 ?auto_119133 ) ) ( not ( = ?auto_119137 ?auto_119138 ) ) ( not ( = ?auto_119137 ?auto_119134 ) ) ( not ( = ?auto_119137 ?auto_119133 ) ) ( not ( = ?auto_119131 ?auto_119136 ) ) ( not ( = ?auto_119131 ?auto_119135 ) ) ( not ( = ?auto_119131 ?auto_119137 ) ) ( not ( = ?auto_119132 ?auto_119136 ) ) ( not ( = ?auto_119132 ?auto_119135 ) ) ( not ( = ?auto_119132 ?auto_119137 ) ) ( ON ?auto_119131 ?auto_119139 ) ( not ( = ?auto_119131 ?auto_119139 ) ) ( not ( = ?auto_119132 ?auto_119139 ) ) ( not ( = ?auto_119133 ?auto_119139 ) ) ( not ( = ?auto_119134 ?auto_119139 ) ) ( not ( = ?auto_119138 ?auto_119139 ) ) ( not ( = ?auto_119136 ?auto_119139 ) ) ( not ( = ?auto_119135 ?auto_119139 ) ) ( not ( = ?auto_119137 ?auto_119139 ) ) ( ON ?auto_119132 ?auto_119131 ) ( ON-TABLE ?auto_119139 ) ( ON ?auto_119133 ?auto_119132 ) ( ON ?auto_119134 ?auto_119133 ) ( CLEAR ?auto_119137 ) ( ON ?auto_119138 ?auto_119134 ) ( CLEAR ?auto_119138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119139 ?auto_119131 ?auto_119132 ?auto_119133 ?auto_119134 )
      ( MAKE-4PILE ?auto_119131 ?auto_119132 ?auto_119133 ?auto_119134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119140 - BLOCK
      ?auto_119141 - BLOCK
      ?auto_119142 - BLOCK
      ?auto_119143 - BLOCK
    )
    :vars
    (
      ?auto_119144 - BLOCK
      ?auto_119148 - BLOCK
      ?auto_119145 - BLOCK
      ?auto_119146 - BLOCK
      ?auto_119147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119140 ?auto_119141 ) ) ( not ( = ?auto_119140 ?auto_119142 ) ) ( not ( = ?auto_119140 ?auto_119143 ) ) ( not ( = ?auto_119141 ?auto_119142 ) ) ( not ( = ?auto_119141 ?auto_119143 ) ) ( not ( = ?auto_119142 ?auto_119143 ) ) ( not ( = ?auto_119140 ?auto_119144 ) ) ( not ( = ?auto_119141 ?auto_119144 ) ) ( not ( = ?auto_119142 ?auto_119144 ) ) ( not ( = ?auto_119143 ?auto_119144 ) ) ( ON-TABLE ?auto_119148 ) ( ON ?auto_119145 ?auto_119148 ) ( not ( = ?auto_119148 ?auto_119145 ) ) ( not ( = ?auto_119148 ?auto_119146 ) ) ( not ( = ?auto_119148 ?auto_119144 ) ) ( not ( = ?auto_119148 ?auto_119143 ) ) ( not ( = ?auto_119148 ?auto_119142 ) ) ( not ( = ?auto_119145 ?auto_119146 ) ) ( not ( = ?auto_119145 ?auto_119144 ) ) ( not ( = ?auto_119145 ?auto_119143 ) ) ( not ( = ?auto_119145 ?auto_119142 ) ) ( not ( = ?auto_119146 ?auto_119144 ) ) ( not ( = ?auto_119146 ?auto_119143 ) ) ( not ( = ?auto_119146 ?auto_119142 ) ) ( not ( = ?auto_119140 ?auto_119148 ) ) ( not ( = ?auto_119140 ?auto_119145 ) ) ( not ( = ?auto_119140 ?auto_119146 ) ) ( not ( = ?auto_119141 ?auto_119148 ) ) ( not ( = ?auto_119141 ?auto_119145 ) ) ( not ( = ?auto_119141 ?auto_119146 ) ) ( ON ?auto_119140 ?auto_119147 ) ( not ( = ?auto_119140 ?auto_119147 ) ) ( not ( = ?auto_119141 ?auto_119147 ) ) ( not ( = ?auto_119142 ?auto_119147 ) ) ( not ( = ?auto_119143 ?auto_119147 ) ) ( not ( = ?auto_119144 ?auto_119147 ) ) ( not ( = ?auto_119148 ?auto_119147 ) ) ( not ( = ?auto_119145 ?auto_119147 ) ) ( not ( = ?auto_119146 ?auto_119147 ) ) ( ON ?auto_119141 ?auto_119140 ) ( ON-TABLE ?auto_119147 ) ( ON ?auto_119142 ?auto_119141 ) ( ON ?auto_119143 ?auto_119142 ) ( ON ?auto_119144 ?auto_119143 ) ( CLEAR ?auto_119144 ) ( HOLDING ?auto_119146 ) ( CLEAR ?auto_119145 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119148 ?auto_119145 ?auto_119146 )
      ( MAKE-4PILE ?auto_119140 ?auto_119141 ?auto_119142 ?auto_119143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119149 - BLOCK
      ?auto_119150 - BLOCK
      ?auto_119151 - BLOCK
      ?auto_119152 - BLOCK
    )
    :vars
    (
      ?auto_119154 - BLOCK
      ?auto_119153 - BLOCK
      ?auto_119157 - BLOCK
      ?auto_119155 - BLOCK
      ?auto_119156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119149 ?auto_119150 ) ) ( not ( = ?auto_119149 ?auto_119151 ) ) ( not ( = ?auto_119149 ?auto_119152 ) ) ( not ( = ?auto_119150 ?auto_119151 ) ) ( not ( = ?auto_119150 ?auto_119152 ) ) ( not ( = ?auto_119151 ?auto_119152 ) ) ( not ( = ?auto_119149 ?auto_119154 ) ) ( not ( = ?auto_119150 ?auto_119154 ) ) ( not ( = ?auto_119151 ?auto_119154 ) ) ( not ( = ?auto_119152 ?auto_119154 ) ) ( ON-TABLE ?auto_119153 ) ( ON ?auto_119157 ?auto_119153 ) ( not ( = ?auto_119153 ?auto_119157 ) ) ( not ( = ?auto_119153 ?auto_119155 ) ) ( not ( = ?auto_119153 ?auto_119154 ) ) ( not ( = ?auto_119153 ?auto_119152 ) ) ( not ( = ?auto_119153 ?auto_119151 ) ) ( not ( = ?auto_119157 ?auto_119155 ) ) ( not ( = ?auto_119157 ?auto_119154 ) ) ( not ( = ?auto_119157 ?auto_119152 ) ) ( not ( = ?auto_119157 ?auto_119151 ) ) ( not ( = ?auto_119155 ?auto_119154 ) ) ( not ( = ?auto_119155 ?auto_119152 ) ) ( not ( = ?auto_119155 ?auto_119151 ) ) ( not ( = ?auto_119149 ?auto_119153 ) ) ( not ( = ?auto_119149 ?auto_119157 ) ) ( not ( = ?auto_119149 ?auto_119155 ) ) ( not ( = ?auto_119150 ?auto_119153 ) ) ( not ( = ?auto_119150 ?auto_119157 ) ) ( not ( = ?auto_119150 ?auto_119155 ) ) ( ON ?auto_119149 ?auto_119156 ) ( not ( = ?auto_119149 ?auto_119156 ) ) ( not ( = ?auto_119150 ?auto_119156 ) ) ( not ( = ?auto_119151 ?auto_119156 ) ) ( not ( = ?auto_119152 ?auto_119156 ) ) ( not ( = ?auto_119154 ?auto_119156 ) ) ( not ( = ?auto_119153 ?auto_119156 ) ) ( not ( = ?auto_119157 ?auto_119156 ) ) ( not ( = ?auto_119155 ?auto_119156 ) ) ( ON ?auto_119150 ?auto_119149 ) ( ON-TABLE ?auto_119156 ) ( ON ?auto_119151 ?auto_119150 ) ( ON ?auto_119152 ?auto_119151 ) ( ON ?auto_119154 ?auto_119152 ) ( CLEAR ?auto_119157 ) ( ON ?auto_119155 ?auto_119154 ) ( CLEAR ?auto_119155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119156 ?auto_119149 ?auto_119150 ?auto_119151 ?auto_119152 ?auto_119154 )
      ( MAKE-4PILE ?auto_119149 ?auto_119150 ?auto_119151 ?auto_119152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119158 - BLOCK
      ?auto_119159 - BLOCK
      ?auto_119160 - BLOCK
      ?auto_119161 - BLOCK
    )
    :vars
    (
      ?auto_119163 - BLOCK
      ?auto_119162 - BLOCK
      ?auto_119166 - BLOCK
      ?auto_119165 - BLOCK
      ?auto_119164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119158 ?auto_119159 ) ) ( not ( = ?auto_119158 ?auto_119160 ) ) ( not ( = ?auto_119158 ?auto_119161 ) ) ( not ( = ?auto_119159 ?auto_119160 ) ) ( not ( = ?auto_119159 ?auto_119161 ) ) ( not ( = ?auto_119160 ?auto_119161 ) ) ( not ( = ?auto_119158 ?auto_119163 ) ) ( not ( = ?auto_119159 ?auto_119163 ) ) ( not ( = ?auto_119160 ?auto_119163 ) ) ( not ( = ?auto_119161 ?auto_119163 ) ) ( ON-TABLE ?auto_119162 ) ( not ( = ?auto_119162 ?auto_119166 ) ) ( not ( = ?auto_119162 ?auto_119165 ) ) ( not ( = ?auto_119162 ?auto_119163 ) ) ( not ( = ?auto_119162 ?auto_119161 ) ) ( not ( = ?auto_119162 ?auto_119160 ) ) ( not ( = ?auto_119166 ?auto_119165 ) ) ( not ( = ?auto_119166 ?auto_119163 ) ) ( not ( = ?auto_119166 ?auto_119161 ) ) ( not ( = ?auto_119166 ?auto_119160 ) ) ( not ( = ?auto_119165 ?auto_119163 ) ) ( not ( = ?auto_119165 ?auto_119161 ) ) ( not ( = ?auto_119165 ?auto_119160 ) ) ( not ( = ?auto_119158 ?auto_119162 ) ) ( not ( = ?auto_119158 ?auto_119166 ) ) ( not ( = ?auto_119158 ?auto_119165 ) ) ( not ( = ?auto_119159 ?auto_119162 ) ) ( not ( = ?auto_119159 ?auto_119166 ) ) ( not ( = ?auto_119159 ?auto_119165 ) ) ( ON ?auto_119158 ?auto_119164 ) ( not ( = ?auto_119158 ?auto_119164 ) ) ( not ( = ?auto_119159 ?auto_119164 ) ) ( not ( = ?auto_119160 ?auto_119164 ) ) ( not ( = ?auto_119161 ?auto_119164 ) ) ( not ( = ?auto_119163 ?auto_119164 ) ) ( not ( = ?auto_119162 ?auto_119164 ) ) ( not ( = ?auto_119166 ?auto_119164 ) ) ( not ( = ?auto_119165 ?auto_119164 ) ) ( ON ?auto_119159 ?auto_119158 ) ( ON-TABLE ?auto_119164 ) ( ON ?auto_119160 ?auto_119159 ) ( ON ?auto_119161 ?auto_119160 ) ( ON ?auto_119163 ?auto_119161 ) ( ON ?auto_119165 ?auto_119163 ) ( CLEAR ?auto_119165 ) ( HOLDING ?auto_119166 ) ( CLEAR ?auto_119162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119162 ?auto_119166 )
      ( MAKE-4PILE ?auto_119158 ?auto_119159 ?auto_119160 ?auto_119161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119167 - BLOCK
      ?auto_119168 - BLOCK
      ?auto_119169 - BLOCK
      ?auto_119170 - BLOCK
    )
    :vars
    (
      ?auto_119171 - BLOCK
      ?auto_119175 - BLOCK
      ?auto_119173 - BLOCK
      ?auto_119172 - BLOCK
      ?auto_119174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119167 ?auto_119168 ) ) ( not ( = ?auto_119167 ?auto_119169 ) ) ( not ( = ?auto_119167 ?auto_119170 ) ) ( not ( = ?auto_119168 ?auto_119169 ) ) ( not ( = ?auto_119168 ?auto_119170 ) ) ( not ( = ?auto_119169 ?auto_119170 ) ) ( not ( = ?auto_119167 ?auto_119171 ) ) ( not ( = ?auto_119168 ?auto_119171 ) ) ( not ( = ?auto_119169 ?auto_119171 ) ) ( not ( = ?auto_119170 ?auto_119171 ) ) ( ON-TABLE ?auto_119175 ) ( not ( = ?auto_119175 ?auto_119173 ) ) ( not ( = ?auto_119175 ?auto_119172 ) ) ( not ( = ?auto_119175 ?auto_119171 ) ) ( not ( = ?auto_119175 ?auto_119170 ) ) ( not ( = ?auto_119175 ?auto_119169 ) ) ( not ( = ?auto_119173 ?auto_119172 ) ) ( not ( = ?auto_119173 ?auto_119171 ) ) ( not ( = ?auto_119173 ?auto_119170 ) ) ( not ( = ?auto_119173 ?auto_119169 ) ) ( not ( = ?auto_119172 ?auto_119171 ) ) ( not ( = ?auto_119172 ?auto_119170 ) ) ( not ( = ?auto_119172 ?auto_119169 ) ) ( not ( = ?auto_119167 ?auto_119175 ) ) ( not ( = ?auto_119167 ?auto_119173 ) ) ( not ( = ?auto_119167 ?auto_119172 ) ) ( not ( = ?auto_119168 ?auto_119175 ) ) ( not ( = ?auto_119168 ?auto_119173 ) ) ( not ( = ?auto_119168 ?auto_119172 ) ) ( ON ?auto_119167 ?auto_119174 ) ( not ( = ?auto_119167 ?auto_119174 ) ) ( not ( = ?auto_119168 ?auto_119174 ) ) ( not ( = ?auto_119169 ?auto_119174 ) ) ( not ( = ?auto_119170 ?auto_119174 ) ) ( not ( = ?auto_119171 ?auto_119174 ) ) ( not ( = ?auto_119175 ?auto_119174 ) ) ( not ( = ?auto_119173 ?auto_119174 ) ) ( not ( = ?auto_119172 ?auto_119174 ) ) ( ON ?auto_119168 ?auto_119167 ) ( ON-TABLE ?auto_119174 ) ( ON ?auto_119169 ?auto_119168 ) ( ON ?auto_119170 ?auto_119169 ) ( ON ?auto_119171 ?auto_119170 ) ( ON ?auto_119172 ?auto_119171 ) ( CLEAR ?auto_119175 ) ( ON ?auto_119173 ?auto_119172 ) ( CLEAR ?auto_119173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119174 ?auto_119167 ?auto_119168 ?auto_119169 ?auto_119170 ?auto_119171 ?auto_119172 )
      ( MAKE-4PILE ?auto_119167 ?auto_119168 ?auto_119169 ?auto_119170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119176 - BLOCK
      ?auto_119177 - BLOCK
      ?auto_119178 - BLOCK
      ?auto_119179 - BLOCK
    )
    :vars
    (
      ?auto_119180 - BLOCK
      ?auto_119184 - BLOCK
      ?auto_119182 - BLOCK
      ?auto_119181 - BLOCK
      ?auto_119183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119176 ?auto_119177 ) ) ( not ( = ?auto_119176 ?auto_119178 ) ) ( not ( = ?auto_119176 ?auto_119179 ) ) ( not ( = ?auto_119177 ?auto_119178 ) ) ( not ( = ?auto_119177 ?auto_119179 ) ) ( not ( = ?auto_119178 ?auto_119179 ) ) ( not ( = ?auto_119176 ?auto_119180 ) ) ( not ( = ?auto_119177 ?auto_119180 ) ) ( not ( = ?auto_119178 ?auto_119180 ) ) ( not ( = ?auto_119179 ?auto_119180 ) ) ( not ( = ?auto_119184 ?auto_119182 ) ) ( not ( = ?auto_119184 ?auto_119181 ) ) ( not ( = ?auto_119184 ?auto_119180 ) ) ( not ( = ?auto_119184 ?auto_119179 ) ) ( not ( = ?auto_119184 ?auto_119178 ) ) ( not ( = ?auto_119182 ?auto_119181 ) ) ( not ( = ?auto_119182 ?auto_119180 ) ) ( not ( = ?auto_119182 ?auto_119179 ) ) ( not ( = ?auto_119182 ?auto_119178 ) ) ( not ( = ?auto_119181 ?auto_119180 ) ) ( not ( = ?auto_119181 ?auto_119179 ) ) ( not ( = ?auto_119181 ?auto_119178 ) ) ( not ( = ?auto_119176 ?auto_119184 ) ) ( not ( = ?auto_119176 ?auto_119182 ) ) ( not ( = ?auto_119176 ?auto_119181 ) ) ( not ( = ?auto_119177 ?auto_119184 ) ) ( not ( = ?auto_119177 ?auto_119182 ) ) ( not ( = ?auto_119177 ?auto_119181 ) ) ( ON ?auto_119176 ?auto_119183 ) ( not ( = ?auto_119176 ?auto_119183 ) ) ( not ( = ?auto_119177 ?auto_119183 ) ) ( not ( = ?auto_119178 ?auto_119183 ) ) ( not ( = ?auto_119179 ?auto_119183 ) ) ( not ( = ?auto_119180 ?auto_119183 ) ) ( not ( = ?auto_119184 ?auto_119183 ) ) ( not ( = ?auto_119182 ?auto_119183 ) ) ( not ( = ?auto_119181 ?auto_119183 ) ) ( ON ?auto_119177 ?auto_119176 ) ( ON-TABLE ?auto_119183 ) ( ON ?auto_119178 ?auto_119177 ) ( ON ?auto_119179 ?auto_119178 ) ( ON ?auto_119180 ?auto_119179 ) ( ON ?auto_119181 ?auto_119180 ) ( ON ?auto_119182 ?auto_119181 ) ( CLEAR ?auto_119182 ) ( HOLDING ?auto_119184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119184 )
      ( MAKE-4PILE ?auto_119176 ?auto_119177 ?auto_119178 ?auto_119179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119185 - BLOCK
      ?auto_119186 - BLOCK
      ?auto_119187 - BLOCK
      ?auto_119188 - BLOCK
    )
    :vars
    (
      ?auto_119192 - BLOCK
      ?auto_119193 - BLOCK
      ?auto_119191 - BLOCK
      ?auto_119190 - BLOCK
      ?auto_119189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119185 ?auto_119186 ) ) ( not ( = ?auto_119185 ?auto_119187 ) ) ( not ( = ?auto_119185 ?auto_119188 ) ) ( not ( = ?auto_119186 ?auto_119187 ) ) ( not ( = ?auto_119186 ?auto_119188 ) ) ( not ( = ?auto_119187 ?auto_119188 ) ) ( not ( = ?auto_119185 ?auto_119192 ) ) ( not ( = ?auto_119186 ?auto_119192 ) ) ( not ( = ?auto_119187 ?auto_119192 ) ) ( not ( = ?auto_119188 ?auto_119192 ) ) ( not ( = ?auto_119193 ?auto_119191 ) ) ( not ( = ?auto_119193 ?auto_119190 ) ) ( not ( = ?auto_119193 ?auto_119192 ) ) ( not ( = ?auto_119193 ?auto_119188 ) ) ( not ( = ?auto_119193 ?auto_119187 ) ) ( not ( = ?auto_119191 ?auto_119190 ) ) ( not ( = ?auto_119191 ?auto_119192 ) ) ( not ( = ?auto_119191 ?auto_119188 ) ) ( not ( = ?auto_119191 ?auto_119187 ) ) ( not ( = ?auto_119190 ?auto_119192 ) ) ( not ( = ?auto_119190 ?auto_119188 ) ) ( not ( = ?auto_119190 ?auto_119187 ) ) ( not ( = ?auto_119185 ?auto_119193 ) ) ( not ( = ?auto_119185 ?auto_119191 ) ) ( not ( = ?auto_119185 ?auto_119190 ) ) ( not ( = ?auto_119186 ?auto_119193 ) ) ( not ( = ?auto_119186 ?auto_119191 ) ) ( not ( = ?auto_119186 ?auto_119190 ) ) ( ON ?auto_119185 ?auto_119189 ) ( not ( = ?auto_119185 ?auto_119189 ) ) ( not ( = ?auto_119186 ?auto_119189 ) ) ( not ( = ?auto_119187 ?auto_119189 ) ) ( not ( = ?auto_119188 ?auto_119189 ) ) ( not ( = ?auto_119192 ?auto_119189 ) ) ( not ( = ?auto_119193 ?auto_119189 ) ) ( not ( = ?auto_119191 ?auto_119189 ) ) ( not ( = ?auto_119190 ?auto_119189 ) ) ( ON ?auto_119186 ?auto_119185 ) ( ON-TABLE ?auto_119189 ) ( ON ?auto_119187 ?auto_119186 ) ( ON ?auto_119188 ?auto_119187 ) ( ON ?auto_119192 ?auto_119188 ) ( ON ?auto_119190 ?auto_119192 ) ( ON ?auto_119191 ?auto_119190 ) ( ON ?auto_119193 ?auto_119191 ) ( CLEAR ?auto_119193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_119189 ?auto_119185 ?auto_119186 ?auto_119187 ?auto_119188 ?auto_119192 ?auto_119190 ?auto_119191 )
      ( MAKE-4PILE ?auto_119185 ?auto_119186 ?auto_119187 ?auto_119188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119213 - BLOCK
      ?auto_119214 - BLOCK
      ?auto_119215 - BLOCK
    )
    :vars
    (
      ?auto_119216 - BLOCK
      ?auto_119218 - BLOCK
      ?auto_119217 - BLOCK
      ?auto_119219 - BLOCK
      ?auto_119220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119216 ?auto_119215 ) ( ON-TABLE ?auto_119213 ) ( ON ?auto_119214 ?auto_119213 ) ( ON ?auto_119215 ?auto_119214 ) ( not ( = ?auto_119213 ?auto_119214 ) ) ( not ( = ?auto_119213 ?auto_119215 ) ) ( not ( = ?auto_119213 ?auto_119216 ) ) ( not ( = ?auto_119214 ?auto_119215 ) ) ( not ( = ?auto_119214 ?auto_119216 ) ) ( not ( = ?auto_119215 ?auto_119216 ) ) ( not ( = ?auto_119213 ?auto_119218 ) ) ( not ( = ?auto_119213 ?auto_119217 ) ) ( not ( = ?auto_119214 ?auto_119218 ) ) ( not ( = ?auto_119214 ?auto_119217 ) ) ( not ( = ?auto_119215 ?auto_119218 ) ) ( not ( = ?auto_119215 ?auto_119217 ) ) ( not ( = ?auto_119216 ?auto_119218 ) ) ( not ( = ?auto_119216 ?auto_119217 ) ) ( not ( = ?auto_119218 ?auto_119217 ) ) ( ON ?auto_119218 ?auto_119216 ) ( CLEAR ?auto_119218 ) ( HOLDING ?auto_119217 ) ( CLEAR ?auto_119219 ) ( ON-TABLE ?auto_119220 ) ( ON ?auto_119219 ?auto_119220 ) ( not ( = ?auto_119220 ?auto_119219 ) ) ( not ( = ?auto_119220 ?auto_119217 ) ) ( not ( = ?auto_119219 ?auto_119217 ) ) ( not ( = ?auto_119213 ?auto_119219 ) ) ( not ( = ?auto_119213 ?auto_119220 ) ) ( not ( = ?auto_119214 ?auto_119219 ) ) ( not ( = ?auto_119214 ?auto_119220 ) ) ( not ( = ?auto_119215 ?auto_119219 ) ) ( not ( = ?auto_119215 ?auto_119220 ) ) ( not ( = ?auto_119216 ?auto_119219 ) ) ( not ( = ?auto_119216 ?auto_119220 ) ) ( not ( = ?auto_119218 ?auto_119219 ) ) ( not ( = ?auto_119218 ?auto_119220 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119220 ?auto_119219 ?auto_119217 )
      ( MAKE-3PILE ?auto_119213 ?auto_119214 ?auto_119215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119221 - BLOCK
      ?auto_119222 - BLOCK
      ?auto_119223 - BLOCK
    )
    :vars
    (
      ?auto_119225 - BLOCK
      ?auto_119224 - BLOCK
      ?auto_119226 - BLOCK
      ?auto_119228 - BLOCK
      ?auto_119227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119225 ?auto_119223 ) ( ON-TABLE ?auto_119221 ) ( ON ?auto_119222 ?auto_119221 ) ( ON ?auto_119223 ?auto_119222 ) ( not ( = ?auto_119221 ?auto_119222 ) ) ( not ( = ?auto_119221 ?auto_119223 ) ) ( not ( = ?auto_119221 ?auto_119225 ) ) ( not ( = ?auto_119222 ?auto_119223 ) ) ( not ( = ?auto_119222 ?auto_119225 ) ) ( not ( = ?auto_119223 ?auto_119225 ) ) ( not ( = ?auto_119221 ?auto_119224 ) ) ( not ( = ?auto_119221 ?auto_119226 ) ) ( not ( = ?auto_119222 ?auto_119224 ) ) ( not ( = ?auto_119222 ?auto_119226 ) ) ( not ( = ?auto_119223 ?auto_119224 ) ) ( not ( = ?auto_119223 ?auto_119226 ) ) ( not ( = ?auto_119225 ?auto_119224 ) ) ( not ( = ?auto_119225 ?auto_119226 ) ) ( not ( = ?auto_119224 ?auto_119226 ) ) ( ON ?auto_119224 ?auto_119225 ) ( CLEAR ?auto_119228 ) ( ON-TABLE ?auto_119227 ) ( ON ?auto_119228 ?auto_119227 ) ( not ( = ?auto_119227 ?auto_119228 ) ) ( not ( = ?auto_119227 ?auto_119226 ) ) ( not ( = ?auto_119228 ?auto_119226 ) ) ( not ( = ?auto_119221 ?auto_119228 ) ) ( not ( = ?auto_119221 ?auto_119227 ) ) ( not ( = ?auto_119222 ?auto_119228 ) ) ( not ( = ?auto_119222 ?auto_119227 ) ) ( not ( = ?auto_119223 ?auto_119228 ) ) ( not ( = ?auto_119223 ?auto_119227 ) ) ( not ( = ?auto_119225 ?auto_119228 ) ) ( not ( = ?auto_119225 ?auto_119227 ) ) ( not ( = ?auto_119224 ?auto_119228 ) ) ( not ( = ?auto_119224 ?auto_119227 ) ) ( ON ?auto_119226 ?auto_119224 ) ( CLEAR ?auto_119226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119221 ?auto_119222 ?auto_119223 ?auto_119225 ?auto_119224 )
      ( MAKE-3PILE ?auto_119221 ?auto_119222 ?auto_119223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119229 - BLOCK
      ?auto_119230 - BLOCK
      ?auto_119231 - BLOCK
    )
    :vars
    (
      ?auto_119235 - BLOCK
      ?auto_119234 - BLOCK
      ?auto_119233 - BLOCK
      ?auto_119232 - BLOCK
      ?auto_119236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119235 ?auto_119231 ) ( ON-TABLE ?auto_119229 ) ( ON ?auto_119230 ?auto_119229 ) ( ON ?auto_119231 ?auto_119230 ) ( not ( = ?auto_119229 ?auto_119230 ) ) ( not ( = ?auto_119229 ?auto_119231 ) ) ( not ( = ?auto_119229 ?auto_119235 ) ) ( not ( = ?auto_119230 ?auto_119231 ) ) ( not ( = ?auto_119230 ?auto_119235 ) ) ( not ( = ?auto_119231 ?auto_119235 ) ) ( not ( = ?auto_119229 ?auto_119234 ) ) ( not ( = ?auto_119229 ?auto_119233 ) ) ( not ( = ?auto_119230 ?auto_119234 ) ) ( not ( = ?auto_119230 ?auto_119233 ) ) ( not ( = ?auto_119231 ?auto_119234 ) ) ( not ( = ?auto_119231 ?auto_119233 ) ) ( not ( = ?auto_119235 ?auto_119234 ) ) ( not ( = ?auto_119235 ?auto_119233 ) ) ( not ( = ?auto_119234 ?auto_119233 ) ) ( ON ?auto_119234 ?auto_119235 ) ( ON-TABLE ?auto_119232 ) ( not ( = ?auto_119232 ?auto_119236 ) ) ( not ( = ?auto_119232 ?auto_119233 ) ) ( not ( = ?auto_119236 ?auto_119233 ) ) ( not ( = ?auto_119229 ?auto_119236 ) ) ( not ( = ?auto_119229 ?auto_119232 ) ) ( not ( = ?auto_119230 ?auto_119236 ) ) ( not ( = ?auto_119230 ?auto_119232 ) ) ( not ( = ?auto_119231 ?auto_119236 ) ) ( not ( = ?auto_119231 ?auto_119232 ) ) ( not ( = ?auto_119235 ?auto_119236 ) ) ( not ( = ?auto_119235 ?auto_119232 ) ) ( not ( = ?auto_119234 ?auto_119236 ) ) ( not ( = ?auto_119234 ?auto_119232 ) ) ( ON ?auto_119233 ?auto_119234 ) ( CLEAR ?auto_119233 ) ( HOLDING ?auto_119236 ) ( CLEAR ?auto_119232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119232 ?auto_119236 )
      ( MAKE-3PILE ?auto_119229 ?auto_119230 ?auto_119231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119237 - BLOCK
      ?auto_119238 - BLOCK
      ?auto_119239 - BLOCK
    )
    :vars
    (
      ?auto_119243 - BLOCK
      ?auto_119241 - BLOCK
      ?auto_119240 - BLOCK
      ?auto_119244 - BLOCK
      ?auto_119242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119243 ?auto_119239 ) ( ON-TABLE ?auto_119237 ) ( ON ?auto_119238 ?auto_119237 ) ( ON ?auto_119239 ?auto_119238 ) ( not ( = ?auto_119237 ?auto_119238 ) ) ( not ( = ?auto_119237 ?auto_119239 ) ) ( not ( = ?auto_119237 ?auto_119243 ) ) ( not ( = ?auto_119238 ?auto_119239 ) ) ( not ( = ?auto_119238 ?auto_119243 ) ) ( not ( = ?auto_119239 ?auto_119243 ) ) ( not ( = ?auto_119237 ?auto_119241 ) ) ( not ( = ?auto_119237 ?auto_119240 ) ) ( not ( = ?auto_119238 ?auto_119241 ) ) ( not ( = ?auto_119238 ?auto_119240 ) ) ( not ( = ?auto_119239 ?auto_119241 ) ) ( not ( = ?auto_119239 ?auto_119240 ) ) ( not ( = ?auto_119243 ?auto_119241 ) ) ( not ( = ?auto_119243 ?auto_119240 ) ) ( not ( = ?auto_119241 ?auto_119240 ) ) ( ON ?auto_119241 ?auto_119243 ) ( ON-TABLE ?auto_119244 ) ( not ( = ?auto_119244 ?auto_119242 ) ) ( not ( = ?auto_119244 ?auto_119240 ) ) ( not ( = ?auto_119242 ?auto_119240 ) ) ( not ( = ?auto_119237 ?auto_119242 ) ) ( not ( = ?auto_119237 ?auto_119244 ) ) ( not ( = ?auto_119238 ?auto_119242 ) ) ( not ( = ?auto_119238 ?auto_119244 ) ) ( not ( = ?auto_119239 ?auto_119242 ) ) ( not ( = ?auto_119239 ?auto_119244 ) ) ( not ( = ?auto_119243 ?auto_119242 ) ) ( not ( = ?auto_119243 ?auto_119244 ) ) ( not ( = ?auto_119241 ?auto_119242 ) ) ( not ( = ?auto_119241 ?auto_119244 ) ) ( ON ?auto_119240 ?auto_119241 ) ( CLEAR ?auto_119244 ) ( ON ?auto_119242 ?auto_119240 ) ( CLEAR ?auto_119242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119237 ?auto_119238 ?auto_119239 ?auto_119243 ?auto_119241 ?auto_119240 )
      ( MAKE-3PILE ?auto_119237 ?auto_119238 ?auto_119239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119245 - BLOCK
      ?auto_119246 - BLOCK
      ?auto_119247 - BLOCK
    )
    :vars
    (
      ?auto_119248 - BLOCK
      ?auto_119249 - BLOCK
      ?auto_119251 - BLOCK
      ?auto_119250 - BLOCK
      ?auto_119252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119248 ?auto_119247 ) ( ON-TABLE ?auto_119245 ) ( ON ?auto_119246 ?auto_119245 ) ( ON ?auto_119247 ?auto_119246 ) ( not ( = ?auto_119245 ?auto_119246 ) ) ( not ( = ?auto_119245 ?auto_119247 ) ) ( not ( = ?auto_119245 ?auto_119248 ) ) ( not ( = ?auto_119246 ?auto_119247 ) ) ( not ( = ?auto_119246 ?auto_119248 ) ) ( not ( = ?auto_119247 ?auto_119248 ) ) ( not ( = ?auto_119245 ?auto_119249 ) ) ( not ( = ?auto_119245 ?auto_119251 ) ) ( not ( = ?auto_119246 ?auto_119249 ) ) ( not ( = ?auto_119246 ?auto_119251 ) ) ( not ( = ?auto_119247 ?auto_119249 ) ) ( not ( = ?auto_119247 ?auto_119251 ) ) ( not ( = ?auto_119248 ?auto_119249 ) ) ( not ( = ?auto_119248 ?auto_119251 ) ) ( not ( = ?auto_119249 ?auto_119251 ) ) ( ON ?auto_119249 ?auto_119248 ) ( not ( = ?auto_119250 ?auto_119252 ) ) ( not ( = ?auto_119250 ?auto_119251 ) ) ( not ( = ?auto_119252 ?auto_119251 ) ) ( not ( = ?auto_119245 ?auto_119252 ) ) ( not ( = ?auto_119245 ?auto_119250 ) ) ( not ( = ?auto_119246 ?auto_119252 ) ) ( not ( = ?auto_119246 ?auto_119250 ) ) ( not ( = ?auto_119247 ?auto_119252 ) ) ( not ( = ?auto_119247 ?auto_119250 ) ) ( not ( = ?auto_119248 ?auto_119252 ) ) ( not ( = ?auto_119248 ?auto_119250 ) ) ( not ( = ?auto_119249 ?auto_119252 ) ) ( not ( = ?auto_119249 ?auto_119250 ) ) ( ON ?auto_119251 ?auto_119249 ) ( ON ?auto_119252 ?auto_119251 ) ( CLEAR ?auto_119252 ) ( HOLDING ?auto_119250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119250 )
      ( MAKE-3PILE ?auto_119245 ?auto_119246 ?auto_119247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119264 - BLOCK
      ?auto_119265 - BLOCK
      ?auto_119266 - BLOCK
    )
    :vars
    (
      ?auto_119271 - BLOCK
      ?auto_119269 - BLOCK
      ?auto_119268 - BLOCK
      ?auto_119270 - BLOCK
      ?auto_119267 - BLOCK
      ?auto_119272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119271 ?auto_119266 ) ( ON-TABLE ?auto_119264 ) ( ON ?auto_119265 ?auto_119264 ) ( ON ?auto_119266 ?auto_119265 ) ( not ( = ?auto_119264 ?auto_119265 ) ) ( not ( = ?auto_119264 ?auto_119266 ) ) ( not ( = ?auto_119264 ?auto_119271 ) ) ( not ( = ?auto_119265 ?auto_119266 ) ) ( not ( = ?auto_119265 ?auto_119271 ) ) ( not ( = ?auto_119266 ?auto_119271 ) ) ( not ( = ?auto_119264 ?auto_119269 ) ) ( not ( = ?auto_119264 ?auto_119268 ) ) ( not ( = ?auto_119265 ?auto_119269 ) ) ( not ( = ?auto_119265 ?auto_119268 ) ) ( not ( = ?auto_119266 ?auto_119269 ) ) ( not ( = ?auto_119266 ?auto_119268 ) ) ( not ( = ?auto_119271 ?auto_119269 ) ) ( not ( = ?auto_119271 ?auto_119268 ) ) ( not ( = ?auto_119269 ?auto_119268 ) ) ( ON ?auto_119269 ?auto_119271 ) ( not ( = ?auto_119270 ?auto_119267 ) ) ( not ( = ?auto_119270 ?auto_119268 ) ) ( not ( = ?auto_119267 ?auto_119268 ) ) ( not ( = ?auto_119264 ?auto_119267 ) ) ( not ( = ?auto_119264 ?auto_119270 ) ) ( not ( = ?auto_119265 ?auto_119267 ) ) ( not ( = ?auto_119265 ?auto_119270 ) ) ( not ( = ?auto_119266 ?auto_119267 ) ) ( not ( = ?auto_119266 ?auto_119270 ) ) ( not ( = ?auto_119271 ?auto_119267 ) ) ( not ( = ?auto_119271 ?auto_119270 ) ) ( not ( = ?auto_119269 ?auto_119267 ) ) ( not ( = ?auto_119269 ?auto_119270 ) ) ( ON ?auto_119268 ?auto_119269 ) ( ON ?auto_119267 ?auto_119268 ) ( CLEAR ?auto_119267 ) ( ON ?auto_119270 ?auto_119272 ) ( CLEAR ?auto_119270 ) ( HAND-EMPTY ) ( not ( = ?auto_119264 ?auto_119272 ) ) ( not ( = ?auto_119265 ?auto_119272 ) ) ( not ( = ?auto_119266 ?auto_119272 ) ) ( not ( = ?auto_119271 ?auto_119272 ) ) ( not ( = ?auto_119269 ?auto_119272 ) ) ( not ( = ?auto_119268 ?auto_119272 ) ) ( not ( = ?auto_119270 ?auto_119272 ) ) ( not ( = ?auto_119267 ?auto_119272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119270 ?auto_119272 )
      ( MAKE-3PILE ?auto_119264 ?auto_119265 ?auto_119266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119273 - BLOCK
      ?auto_119274 - BLOCK
      ?auto_119275 - BLOCK
    )
    :vars
    (
      ?auto_119281 - BLOCK
      ?auto_119278 - BLOCK
      ?auto_119277 - BLOCK
      ?auto_119279 - BLOCK
      ?auto_119276 - BLOCK
      ?auto_119280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119281 ?auto_119275 ) ( ON-TABLE ?auto_119273 ) ( ON ?auto_119274 ?auto_119273 ) ( ON ?auto_119275 ?auto_119274 ) ( not ( = ?auto_119273 ?auto_119274 ) ) ( not ( = ?auto_119273 ?auto_119275 ) ) ( not ( = ?auto_119273 ?auto_119281 ) ) ( not ( = ?auto_119274 ?auto_119275 ) ) ( not ( = ?auto_119274 ?auto_119281 ) ) ( not ( = ?auto_119275 ?auto_119281 ) ) ( not ( = ?auto_119273 ?auto_119278 ) ) ( not ( = ?auto_119273 ?auto_119277 ) ) ( not ( = ?auto_119274 ?auto_119278 ) ) ( not ( = ?auto_119274 ?auto_119277 ) ) ( not ( = ?auto_119275 ?auto_119278 ) ) ( not ( = ?auto_119275 ?auto_119277 ) ) ( not ( = ?auto_119281 ?auto_119278 ) ) ( not ( = ?auto_119281 ?auto_119277 ) ) ( not ( = ?auto_119278 ?auto_119277 ) ) ( ON ?auto_119278 ?auto_119281 ) ( not ( = ?auto_119279 ?auto_119276 ) ) ( not ( = ?auto_119279 ?auto_119277 ) ) ( not ( = ?auto_119276 ?auto_119277 ) ) ( not ( = ?auto_119273 ?auto_119276 ) ) ( not ( = ?auto_119273 ?auto_119279 ) ) ( not ( = ?auto_119274 ?auto_119276 ) ) ( not ( = ?auto_119274 ?auto_119279 ) ) ( not ( = ?auto_119275 ?auto_119276 ) ) ( not ( = ?auto_119275 ?auto_119279 ) ) ( not ( = ?auto_119281 ?auto_119276 ) ) ( not ( = ?auto_119281 ?auto_119279 ) ) ( not ( = ?auto_119278 ?auto_119276 ) ) ( not ( = ?auto_119278 ?auto_119279 ) ) ( ON ?auto_119277 ?auto_119278 ) ( ON ?auto_119279 ?auto_119280 ) ( CLEAR ?auto_119279 ) ( not ( = ?auto_119273 ?auto_119280 ) ) ( not ( = ?auto_119274 ?auto_119280 ) ) ( not ( = ?auto_119275 ?auto_119280 ) ) ( not ( = ?auto_119281 ?auto_119280 ) ) ( not ( = ?auto_119278 ?auto_119280 ) ) ( not ( = ?auto_119277 ?auto_119280 ) ) ( not ( = ?auto_119279 ?auto_119280 ) ) ( not ( = ?auto_119276 ?auto_119280 ) ) ( HOLDING ?auto_119276 ) ( CLEAR ?auto_119277 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119273 ?auto_119274 ?auto_119275 ?auto_119281 ?auto_119278 ?auto_119277 ?auto_119276 )
      ( MAKE-3PILE ?auto_119273 ?auto_119274 ?auto_119275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119282 - BLOCK
      ?auto_119283 - BLOCK
      ?auto_119284 - BLOCK
    )
    :vars
    (
      ?auto_119286 - BLOCK
      ?auto_119285 - BLOCK
      ?auto_119288 - BLOCK
      ?auto_119287 - BLOCK
      ?auto_119289 - BLOCK
      ?auto_119290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119286 ?auto_119284 ) ( ON-TABLE ?auto_119282 ) ( ON ?auto_119283 ?auto_119282 ) ( ON ?auto_119284 ?auto_119283 ) ( not ( = ?auto_119282 ?auto_119283 ) ) ( not ( = ?auto_119282 ?auto_119284 ) ) ( not ( = ?auto_119282 ?auto_119286 ) ) ( not ( = ?auto_119283 ?auto_119284 ) ) ( not ( = ?auto_119283 ?auto_119286 ) ) ( not ( = ?auto_119284 ?auto_119286 ) ) ( not ( = ?auto_119282 ?auto_119285 ) ) ( not ( = ?auto_119282 ?auto_119288 ) ) ( not ( = ?auto_119283 ?auto_119285 ) ) ( not ( = ?auto_119283 ?auto_119288 ) ) ( not ( = ?auto_119284 ?auto_119285 ) ) ( not ( = ?auto_119284 ?auto_119288 ) ) ( not ( = ?auto_119286 ?auto_119285 ) ) ( not ( = ?auto_119286 ?auto_119288 ) ) ( not ( = ?auto_119285 ?auto_119288 ) ) ( ON ?auto_119285 ?auto_119286 ) ( not ( = ?auto_119287 ?auto_119289 ) ) ( not ( = ?auto_119287 ?auto_119288 ) ) ( not ( = ?auto_119289 ?auto_119288 ) ) ( not ( = ?auto_119282 ?auto_119289 ) ) ( not ( = ?auto_119282 ?auto_119287 ) ) ( not ( = ?auto_119283 ?auto_119289 ) ) ( not ( = ?auto_119283 ?auto_119287 ) ) ( not ( = ?auto_119284 ?auto_119289 ) ) ( not ( = ?auto_119284 ?auto_119287 ) ) ( not ( = ?auto_119286 ?auto_119289 ) ) ( not ( = ?auto_119286 ?auto_119287 ) ) ( not ( = ?auto_119285 ?auto_119289 ) ) ( not ( = ?auto_119285 ?auto_119287 ) ) ( ON ?auto_119288 ?auto_119285 ) ( ON ?auto_119287 ?auto_119290 ) ( not ( = ?auto_119282 ?auto_119290 ) ) ( not ( = ?auto_119283 ?auto_119290 ) ) ( not ( = ?auto_119284 ?auto_119290 ) ) ( not ( = ?auto_119286 ?auto_119290 ) ) ( not ( = ?auto_119285 ?auto_119290 ) ) ( not ( = ?auto_119288 ?auto_119290 ) ) ( not ( = ?auto_119287 ?auto_119290 ) ) ( not ( = ?auto_119289 ?auto_119290 ) ) ( CLEAR ?auto_119288 ) ( ON ?auto_119289 ?auto_119287 ) ( CLEAR ?auto_119289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119290 ?auto_119287 )
      ( MAKE-3PILE ?auto_119282 ?auto_119283 ?auto_119284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119291 - BLOCK
      ?auto_119292 - BLOCK
      ?auto_119293 - BLOCK
    )
    :vars
    (
      ?auto_119298 - BLOCK
      ?auto_119299 - BLOCK
      ?auto_119295 - BLOCK
      ?auto_119294 - BLOCK
      ?auto_119297 - BLOCK
      ?auto_119296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119298 ?auto_119293 ) ( ON-TABLE ?auto_119291 ) ( ON ?auto_119292 ?auto_119291 ) ( ON ?auto_119293 ?auto_119292 ) ( not ( = ?auto_119291 ?auto_119292 ) ) ( not ( = ?auto_119291 ?auto_119293 ) ) ( not ( = ?auto_119291 ?auto_119298 ) ) ( not ( = ?auto_119292 ?auto_119293 ) ) ( not ( = ?auto_119292 ?auto_119298 ) ) ( not ( = ?auto_119293 ?auto_119298 ) ) ( not ( = ?auto_119291 ?auto_119299 ) ) ( not ( = ?auto_119291 ?auto_119295 ) ) ( not ( = ?auto_119292 ?auto_119299 ) ) ( not ( = ?auto_119292 ?auto_119295 ) ) ( not ( = ?auto_119293 ?auto_119299 ) ) ( not ( = ?auto_119293 ?auto_119295 ) ) ( not ( = ?auto_119298 ?auto_119299 ) ) ( not ( = ?auto_119298 ?auto_119295 ) ) ( not ( = ?auto_119299 ?auto_119295 ) ) ( ON ?auto_119299 ?auto_119298 ) ( not ( = ?auto_119294 ?auto_119297 ) ) ( not ( = ?auto_119294 ?auto_119295 ) ) ( not ( = ?auto_119297 ?auto_119295 ) ) ( not ( = ?auto_119291 ?auto_119297 ) ) ( not ( = ?auto_119291 ?auto_119294 ) ) ( not ( = ?auto_119292 ?auto_119297 ) ) ( not ( = ?auto_119292 ?auto_119294 ) ) ( not ( = ?auto_119293 ?auto_119297 ) ) ( not ( = ?auto_119293 ?auto_119294 ) ) ( not ( = ?auto_119298 ?auto_119297 ) ) ( not ( = ?auto_119298 ?auto_119294 ) ) ( not ( = ?auto_119299 ?auto_119297 ) ) ( not ( = ?auto_119299 ?auto_119294 ) ) ( ON ?auto_119294 ?auto_119296 ) ( not ( = ?auto_119291 ?auto_119296 ) ) ( not ( = ?auto_119292 ?auto_119296 ) ) ( not ( = ?auto_119293 ?auto_119296 ) ) ( not ( = ?auto_119298 ?auto_119296 ) ) ( not ( = ?auto_119299 ?auto_119296 ) ) ( not ( = ?auto_119295 ?auto_119296 ) ) ( not ( = ?auto_119294 ?auto_119296 ) ) ( not ( = ?auto_119297 ?auto_119296 ) ) ( ON ?auto_119297 ?auto_119294 ) ( CLEAR ?auto_119297 ) ( ON-TABLE ?auto_119296 ) ( HOLDING ?auto_119295 ) ( CLEAR ?auto_119299 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119291 ?auto_119292 ?auto_119293 ?auto_119298 ?auto_119299 ?auto_119295 )
      ( MAKE-3PILE ?auto_119291 ?auto_119292 ?auto_119293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119358 - BLOCK
      ?auto_119359 - BLOCK
      ?auto_119360 - BLOCK
      ?auto_119361 - BLOCK
      ?auto_119362 - BLOCK
    )
    :vars
    (
      ?auto_119363 - BLOCK
      ?auto_119365 - BLOCK
      ?auto_119364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119358 ) ( ON ?auto_119359 ?auto_119358 ) ( ON ?auto_119360 ?auto_119359 ) ( not ( = ?auto_119358 ?auto_119359 ) ) ( not ( = ?auto_119358 ?auto_119360 ) ) ( not ( = ?auto_119358 ?auto_119361 ) ) ( not ( = ?auto_119358 ?auto_119362 ) ) ( not ( = ?auto_119359 ?auto_119360 ) ) ( not ( = ?auto_119359 ?auto_119361 ) ) ( not ( = ?auto_119359 ?auto_119362 ) ) ( not ( = ?auto_119360 ?auto_119361 ) ) ( not ( = ?auto_119360 ?auto_119362 ) ) ( not ( = ?auto_119361 ?auto_119362 ) ) ( ON ?auto_119362 ?auto_119363 ) ( not ( = ?auto_119358 ?auto_119363 ) ) ( not ( = ?auto_119359 ?auto_119363 ) ) ( not ( = ?auto_119360 ?auto_119363 ) ) ( not ( = ?auto_119361 ?auto_119363 ) ) ( not ( = ?auto_119362 ?auto_119363 ) ) ( CLEAR ?auto_119360 ) ( ON ?auto_119361 ?auto_119362 ) ( CLEAR ?auto_119361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119365 ) ( ON ?auto_119364 ?auto_119365 ) ( ON ?auto_119363 ?auto_119364 ) ( not ( = ?auto_119365 ?auto_119364 ) ) ( not ( = ?auto_119365 ?auto_119363 ) ) ( not ( = ?auto_119365 ?auto_119362 ) ) ( not ( = ?auto_119365 ?auto_119361 ) ) ( not ( = ?auto_119364 ?auto_119363 ) ) ( not ( = ?auto_119364 ?auto_119362 ) ) ( not ( = ?auto_119364 ?auto_119361 ) ) ( not ( = ?auto_119358 ?auto_119365 ) ) ( not ( = ?auto_119358 ?auto_119364 ) ) ( not ( = ?auto_119359 ?auto_119365 ) ) ( not ( = ?auto_119359 ?auto_119364 ) ) ( not ( = ?auto_119360 ?auto_119365 ) ) ( not ( = ?auto_119360 ?auto_119364 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119365 ?auto_119364 ?auto_119363 ?auto_119362 )
      ( MAKE-5PILE ?auto_119358 ?auto_119359 ?auto_119360 ?auto_119361 ?auto_119362 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119366 - BLOCK
      ?auto_119367 - BLOCK
      ?auto_119368 - BLOCK
      ?auto_119369 - BLOCK
      ?auto_119370 - BLOCK
    )
    :vars
    (
      ?auto_119373 - BLOCK
      ?auto_119371 - BLOCK
      ?auto_119372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119366 ) ( ON ?auto_119367 ?auto_119366 ) ( not ( = ?auto_119366 ?auto_119367 ) ) ( not ( = ?auto_119366 ?auto_119368 ) ) ( not ( = ?auto_119366 ?auto_119369 ) ) ( not ( = ?auto_119366 ?auto_119370 ) ) ( not ( = ?auto_119367 ?auto_119368 ) ) ( not ( = ?auto_119367 ?auto_119369 ) ) ( not ( = ?auto_119367 ?auto_119370 ) ) ( not ( = ?auto_119368 ?auto_119369 ) ) ( not ( = ?auto_119368 ?auto_119370 ) ) ( not ( = ?auto_119369 ?auto_119370 ) ) ( ON ?auto_119370 ?auto_119373 ) ( not ( = ?auto_119366 ?auto_119373 ) ) ( not ( = ?auto_119367 ?auto_119373 ) ) ( not ( = ?auto_119368 ?auto_119373 ) ) ( not ( = ?auto_119369 ?auto_119373 ) ) ( not ( = ?auto_119370 ?auto_119373 ) ) ( ON ?auto_119369 ?auto_119370 ) ( CLEAR ?auto_119369 ) ( ON-TABLE ?auto_119371 ) ( ON ?auto_119372 ?auto_119371 ) ( ON ?auto_119373 ?auto_119372 ) ( not ( = ?auto_119371 ?auto_119372 ) ) ( not ( = ?auto_119371 ?auto_119373 ) ) ( not ( = ?auto_119371 ?auto_119370 ) ) ( not ( = ?auto_119371 ?auto_119369 ) ) ( not ( = ?auto_119372 ?auto_119373 ) ) ( not ( = ?auto_119372 ?auto_119370 ) ) ( not ( = ?auto_119372 ?auto_119369 ) ) ( not ( = ?auto_119366 ?auto_119371 ) ) ( not ( = ?auto_119366 ?auto_119372 ) ) ( not ( = ?auto_119367 ?auto_119371 ) ) ( not ( = ?auto_119367 ?auto_119372 ) ) ( not ( = ?auto_119368 ?auto_119371 ) ) ( not ( = ?auto_119368 ?auto_119372 ) ) ( HOLDING ?auto_119368 ) ( CLEAR ?auto_119367 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119366 ?auto_119367 ?auto_119368 )
      ( MAKE-5PILE ?auto_119366 ?auto_119367 ?auto_119368 ?auto_119369 ?auto_119370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119374 - BLOCK
      ?auto_119375 - BLOCK
      ?auto_119376 - BLOCK
      ?auto_119377 - BLOCK
      ?auto_119378 - BLOCK
    )
    :vars
    (
      ?auto_119380 - BLOCK
      ?auto_119379 - BLOCK
      ?auto_119381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119374 ) ( ON ?auto_119375 ?auto_119374 ) ( not ( = ?auto_119374 ?auto_119375 ) ) ( not ( = ?auto_119374 ?auto_119376 ) ) ( not ( = ?auto_119374 ?auto_119377 ) ) ( not ( = ?auto_119374 ?auto_119378 ) ) ( not ( = ?auto_119375 ?auto_119376 ) ) ( not ( = ?auto_119375 ?auto_119377 ) ) ( not ( = ?auto_119375 ?auto_119378 ) ) ( not ( = ?auto_119376 ?auto_119377 ) ) ( not ( = ?auto_119376 ?auto_119378 ) ) ( not ( = ?auto_119377 ?auto_119378 ) ) ( ON ?auto_119378 ?auto_119380 ) ( not ( = ?auto_119374 ?auto_119380 ) ) ( not ( = ?auto_119375 ?auto_119380 ) ) ( not ( = ?auto_119376 ?auto_119380 ) ) ( not ( = ?auto_119377 ?auto_119380 ) ) ( not ( = ?auto_119378 ?auto_119380 ) ) ( ON ?auto_119377 ?auto_119378 ) ( ON-TABLE ?auto_119379 ) ( ON ?auto_119381 ?auto_119379 ) ( ON ?auto_119380 ?auto_119381 ) ( not ( = ?auto_119379 ?auto_119381 ) ) ( not ( = ?auto_119379 ?auto_119380 ) ) ( not ( = ?auto_119379 ?auto_119378 ) ) ( not ( = ?auto_119379 ?auto_119377 ) ) ( not ( = ?auto_119381 ?auto_119380 ) ) ( not ( = ?auto_119381 ?auto_119378 ) ) ( not ( = ?auto_119381 ?auto_119377 ) ) ( not ( = ?auto_119374 ?auto_119379 ) ) ( not ( = ?auto_119374 ?auto_119381 ) ) ( not ( = ?auto_119375 ?auto_119379 ) ) ( not ( = ?auto_119375 ?auto_119381 ) ) ( not ( = ?auto_119376 ?auto_119379 ) ) ( not ( = ?auto_119376 ?auto_119381 ) ) ( CLEAR ?auto_119375 ) ( ON ?auto_119376 ?auto_119377 ) ( CLEAR ?auto_119376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119379 ?auto_119381 ?auto_119380 ?auto_119378 ?auto_119377 )
      ( MAKE-5PILE ?auto_119374 ?auto_119375 ?auto_119376 ?auto_119377 ?auto_119378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119382 - BLOCK
      ?auto_119383 - BLOCK
      ?auto_119384 - BLOCK
      ?auto_119385 - BLOCK
      ?auto_119386 - BLOCK
    )
    :vars
    (
      ?auto_119387 - BLOCK
      ?auto_119388 - BLOCK
      ?auto_119389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119382 ) ( not ( = ?auto_119382 ?auto_119383 ) ) ( not ( = ?auto_119382 ?auto_119384 ) ) ( not ( = ?auto_119382 ?auto_119385 ) ) ( not ( = ?auto_119382 ?auto_119386 ) ) ( not ( = ?auto_119383 ?auto_119384 ) ) ( not ( = ?auto_119383 ?auto_119385 ) ) ( not ( = ?auto_119383 ?auto_119386 ) ) ( not ( = ?auto_119384 ?auto_119385 ) ) ( not ( = ?auto_119384 ?auto_119386 ) ) ( not ( = ?auto_119385 ?auto_119386 ) ) ( ON ?auto_119386 ?auto_119387 ) ( not ( = ?auto_119382 ?auto_119387 ) ) ( not ( = ?auto_119383 ?auto_119387 ) ) ( not ( = ?auto_119384 ?auto_119387 ) ) ( not ( = ?auto_119385 ?auto_119387 ) ) ( not ( = ?auto_119386 ?auto_119387 ) ) ( ON ?auto_119385 ?auto_119386 ) ( ON-TABLE ?auto_119388 ) ( ON ?auto_119389 ?auto_119388 ) ( ON ?auto_119387 ?auto_119389 ) ( not ( = ?auto_119388 ?auto_119389 ) ) ( not ( = ?auto_119388 ?auto_119387 ) ) ( not ( = ?auto_119388 ?auto_119386 ) ) ( not ( = ?auto_119388 ?auto_119385 ) ) ( not ( = ?auto_119389 ?auto_119387 ) ) ( not ( = ?auto_119389 ?auto_119386 ) ) ( not ( = ?auto_119389 ?auto_119385 ) ) ( not ( = ?auto_119382 ?auto_119388 ) ) ( not ( = ?auto_119382 ?auto_119389 ) ) ( not ( = ?auto_119383 ?auto_119388 ) ) ( not ( = ?auto_119383 ?auto_119389 ) ) ( not ( = ?auto_119384 ?auto_119388 ) ) ( not ( = ?auto_119384 ?auto_119389 ) ) ( ON ?auto_119384 ?auto_119385 ) ( CLEAR ?auto_119384 ) ( HOLDING ?auto_119383 ) ( CLEAR ?auto_119382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119382 ?auto_119383 )
      ( MAKE-5PILE ?auto_119382 ?auto_119383 ?auto_119384 ?auto_119385 ?auto_119386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119390 - BLOCK
      ?auto_119391 - BLOCK
      ?auto_119392 - BLOCK
      ?auto_119393 - BLOCK
      ?auto_119394 - BLOCK
    )
    :vars
    (
      ?auto_119395 - BLOCK
      ?auto_119396 - BLOCK
      ?auto_119397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119390 ) ( not ( = ?auto_119390 ?auto_119391 ) ) ( not ( = ?auto_119390 ?auto_119392 ) ) ( not ( = ?auto_119390 ?auto_119393 ) ) ( not ( = ?auto_119390 ?auto_119394 ) ) ( not ( = ?auto_119391 ?auto_119392 ) ) ( not ( = ?auto_119391 ?auto_119393 ) ) ( not ( = ?auto_119391 ?auto_119394 ) ) ( not ( = ?auto_119392 ?auto_119393 ) ) ( not ( = ?auto_119392 ?auto_119394 ) ) ( not ( = ?auto_119393 ?auto_119394 ) ) ( ON ?auto_119394 ?auto_119395 ) ( not ( = ?auto_119390 ?auto_119395 ) ) ( not ( = ?auto_119391 ?auto_119395 ) ) ( not ( = ?auto_119392 ?auto_119395 ) ) ( not ( = ?auto_119393 ?auto_119395 ) ) ( not ( = ?auto_119394 ?auto_119395 ) ) ( ON ?auto_119393 ?auto_119394 ) ( ON-TABLE ?auto_119396 ) ( ON ?auto_119397 ?auto_119396 ) ( ON ?auto_119395 ?auto_119397 ) ( not ( = ?auto_119396 ?auto_119397 ) ) ( not ( = ?auto_119396 ?auto_119395 ) ) ( not ( = ?auto_119396 ?auto_119394 ) ) ( not ( = ?auto_119396 ?auto_119393 ) ) ( not ( = ?auto_119397 ?auto_119395 ) ) ( not ( = ?auto_119397 ?auto_119394 ) ) ( not ( = ?auto_119397 ?auto_119393 ) ) ( not ( = ?auto_119390 ?auto_119396 ) ) ( not ( = ?auto_119390 ?auto_119397 ) ) ( not ( = ?auto_119391 ?auto_119396 ) ) ( not ( = ?auto_119391 ?auto_119397 ) ) ( not ( = ?auto_119392 ?auto_119396 ) ) ( not ( = ?auto_119392 ?auto_119397 ) ) ( ON ?auto_119392 ?auto_119393 ) ( CLEAR ?auto_119390 ) ( ON ?auto_119391 ?auto_119392 ) ( CLEAR ?auto_119391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119396 ?auto_119397 ?auto_119395 ?auto_119394 ?auto_119393 ?auto_119392 )
      ( MAKE-5PILE ?auto_119390 ?auto_119391 ?auto_119392 ?auto_119393 ?auto_119394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119398 - BLOCK
      ?auto_119399 - BLOCK
      ?auto_119400 - BLOCK
      ?auto_119401 - BLOCK
      ?auto_119402 - BLOCK
    )
    :vars
    (
      ?auto_119403 - BLOCK
      ?auto_119404 - BLOCK
      ?auto_119405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119398 ?auto_119399 ) ) ( not ( = ?auto_119398 ?auto_119400 ) ) ( not ( = ?auto_119398 ?auto_119401 ) ) ( not ( = ?auto_119398 ?auto_119402 ) ) ( not ( = ?auto_119399 ?auto_119400 ) ) ( not ( = ?auto_119399 ?auto_119401 ) ) ( not ( = ?auto_119399 ?auto_119402 ) ) ( not ( = ?auto_119400 ?auto_119401 ) ) ( not ( = ?auto_119400 ?auto_119402 ) ) ( not ( = ?auto_119401 ?auto_119402 ) ) ( ON ?auto_119402 ?auto_119403 ) ( not ( = ?auto_119398 ?auto_119403 ) ) ( not ( = ?auto_119399 ?auto_119403 ) ) ( not ( = ?auto_119400 ?auto_119403 ) ) ( not ( = ?auto_119401 ?auto_119403 ) ) ( not ( = ?auto_119402 ?auto_119403 ) ) ( ON ?auto_119401 ?auto_119402 ) ( ON-TABLE ?auto_119404 ) ( ON ?auto_119405 ?auto_119404 ) ( ON ?auto_119403 ?auto_119405 ) ( not ( = ?auto_119404 ?auto_119405 ) ) ( not ( = ?auto_119404 ?auto_119403 ) ) ( not ( = ?auto_119404 ?auto_119402 ) ) ( not ( = ?auto_119404 ?auto_119401 ) ) ( not ( = ?auto_119405 ?auto_119403 ) ) ( not ( = ?auto_119405 ?auto_119402 ) ) ( not ( = ?auto_119405 ?auto_119401 ) ) ( not ( = ?auto_119398 ?auto_119404 ) ) ( not ( = ?auto_119398 ?auto_119405 ) ) ( not ( = ?auto_119399 ?auto_119404 ) ) ( not ( = ?auto_119399 ?auto_119405 ) ) ( not ( = ?auto_119400 ?auto_119404 ) ) ( not ( = ?auto_119400 ?auto_119405 ) ) ( ON ?auto_119400 ?auto_119401 ) ( ON ?auto_119399 ?auto_119400 ) ( CLEAR ?auto_119399 ) ( HOLDING ?auto_119398 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119398 )
      ( MAKE-5PILE ?auto_119398 ?auto_119399 ?auto_119400 ?auto_119401 ?auto_119402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119406 - BLOCK
      ?auto_119407 - BLOCK
      ?auto_119408 - BLOCK
      ?auto_119409 - BLOCK
      ?auto_119410 - BLOCK
    )
    :vars
    (
      ?auto_119413 - BLOCK
      ?auto_119412 - BLOCK
      ?auto_119411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119406 ?auto_119407 ) ) ( not ( = ?auto_119406 ?auto_119408 ) ) ( not ( = ?auto_119406 ?auto_119409 ) ) ( not ( = ?auto_119406 ?auto_119410 ) ) ( not ( = ?auto_119407 ?auto_119408 ) ) ( not ( = ?auto_119407 ?auto_119409 ) ) ( not ( = ?auto_119407 ?auto_119410 ) ) ( not ( = ?auto_119408 ?auto_119409 ) ) ( not ( = ?auto_119408 ?auto_119410 ) ) ( not ( = ?auto_119409 ?auto_119410 ) ) ( ON ?auto_119410 ?auto_119413 ) ( not ( = ?auto_119406 ?auto_119413 ) ) ( not ( = ?auto_119407 ?auto_119413 ) ) ( not ( = ?auto_119408 ?auto_119413 ) ) ( not ( = ?auto_119409 ?auto_119413 ) ) ( not ( = ?auto_119410 ?auto_119413 ) ) ( ON ?auto_119409 ?auto_119410 ) ( ON-TABLE ?auto_119412 ) ( ON ?auto_119411 ?auto_119412 ) ( ON ?auto_119413 ?auto_119411 ) ( not ( = ?auto_119412 ?auto_119411 ) ) ( not ( = ?auto_119412 ?auto_119413 ) ) ( not ( = ?auto_119412 ?auto_119410 ) ) ( not ( = ?auto_119412 ?auto_119409 ) ) ( not ( = ?auto_119411 ?auto_119413 ) ) ( not ( = ?auto_119411 ?auto_119410 ) ) ( not ( = ?auto_119411 ?auto_119409 ) ) ( not ( = ?auto_119406 ?auto_119412 ) ) ( not ( = ?auto_119406 ?auto_119411 ) ) ( not ( = ?auto_119407 ?auto_119412 ) ) ( not ( = ?auto_119407 ?auto_119411 ) ) ( not ( = ?auto_119408 ?auto_119412 ) ) ( not ( = ?auto_119408 ?auto_119411 ) ) ( ON ?auto_119408 ?auto_119409 ) ( ON ?auto_119407 ?auto_119408 ) ( ON ?auto_119406 ?auto_119407 ) ( CLEAR ?auto_119406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119412 ?auto_119411 ?auto_119413 ?auto_119410 ?auto_119409 ?auto_119408 ?auto_119407 )
      ( MAKE-5PILE ?auto_119406 ?auto_119407 ?auto_119408 ?auto_119409 ?auto_119410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119419 - BLOCK
      ?auto_119420 - BLOCK
      ?auto_119421 - BLOCK
      ?auto_119422 - BLOCK
      ?auto_119423 - BLOCK
    )
    :vars
    (
      ?auto_119424 - BLOCK
      ?auto_119426 - BLOCK
      ?auto_119425 - BLOCK
      ?auto_119427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119419 ?auto_119420 ) ) ( not ( = ?auto_119419 ?auto_119421 ) ) ( not ( = ?auto_119419 ?auto_119422 ) ) ( not ( = ?auto_119419 ?auto_119423 ) ) ( not ( = ?auto_119420 ?auto_119421 ) ) ( not ( = ?auto_119420 ?auto_119422 ) ) ( not ( = ?auto_119420 ?auto_119423 ) ) ( not ( = ?auto_119421 ?auto_119422 ) ) ( not ( = ?auto_119421 ?auto_119423 ) ) ( not ( = ?auto_119422 ?auto_119423 ) ) ( ON ?auto_119423 ?auto_119424 ) ( not ( = ?auto_119419 ?auto_119424 ) ) ( not ( = ?auto_119420 ?auto_119424 ) ) ( not ( = ?auto_119421 ?auto_119424 ) ) ( not ( = ?auto_119422 ?auto_119424 ) ) ( not ( = ?auto_119423 ?auto_119424 ) ) ( ON ?auto_119422 ?auto_119423 ) ( ON-TABLE ?auto_119426 ) ( ON ?auto_119425 ?auto_119426 ) ( ON ?auto_119424 ?auto_119425 ) ( not ( = ?auto_119426 ?auto_119425 ) ) ( not ( = ?auto_119426 ?auto_119424 ) ) ( not ( = ?auto_119426 ?auto_119423 ) ) ( not ( = ?auto_119426 ?auto_119422 ) ) ( not ( = ?auto_119425 ?auto_119424 ) ) ( not ( = ?auto_119425 ?auto_119423 ) ) ( not ( = ?auto_119425 ?auto_119422 ) ) ( not ( = ?auto_119419 ?auto_119426 ) ) ( not ( = ?auto_119419 ?auto_119425 ) ) ( not ( = ?auto_119420 ?auto_119426 ) ) ( not ( = ?auto_119420 ?auto_119425 ) ) ( not ( = ?auto_119421 ?auto_119426 ) ) ( not ( = ?auto_119421 ?auto_119425 ) ) ( ON ?auto_119421 ?auto_119422 ) ( ON ?auto_119420 ?auto_119421 ) ( CLEAR ?auto_119420 ) ( ON ?auto_119419 ?auto_119427 ) ( CLEAR ?auto_119419 ) ( HAND-EMPTY ) ( not ( = ?auto_119419 ?auto_119427 ) ) ( not ( = ?auto_119420 ?auto_119427 ) ) ( not ( = ?auto_119421 ?auto_119427 ) ) ( not ( = ?auto_119422 ?auto_119427 ) ) ( not ( = ?auto_119423 ?auto_119427 ) ) ( not ( = ?auto_119424 ?auto_119427 ) ) ( not ( = ?auto_119426 ?auto_119427 ) ) ( not ( = ?auto_119425 ?auto_119427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119419 ?auto_119427 )
      ( MAKE-5PILE ?auto_119419 ?auto_119420 ?auto_119421 ?auto_119422 ?auto_119423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119428 - BLOCK
      ?auto_119429 - BLOCK
      ?auto_119430 - BLOCK
      ?auto_119431 - BLOCK
      ?auto_119432 - BLOCK
    )
    :vars
    (
      ?auto_119435 - BLOCK
      ?auto_119434 - BLOCK
      ?auto_119433 - BLOCK
      ?auto_119436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119428 ?auto_119429 ) ) ( not ( = ?auto_119428 ?auto_119430 ) ) ( not ( = ?auto_119428 ?auto_119431 ) ) ( not ( = ?auto_119428 ?auto_119432 ) ) ( not ( = ?auto_119429 ?auto_119430 ) ) ( not ( = ?auto_119429 ?auto_119431 ) ) ( not ( = ?auto_119429 ?auto_119432 ) ) ( not ( = ?auto_119430 ?auto_119431 ) ) ( not ( = ?auto_119430 ?auto_119432 ) ) ( not ( = ?auto_119431 ?auto_119432 ) ) ( ON ?auto_119432 ?auto_119435 ) ( not ( = ?auto_119428 ?auto_119435 ) ) ( not ( = ?auto_119429 ?auto_119435 ) ) ( not ( = ?auto_119430 ?auto_119435 ) ) ( not ( = ?auto_119431 ?auto_119435 ) ) ( not ( = ?auto_119432 ?auto_119435 ) ) ( ON ?auto_119431 ?auto_119432 ) ( ON-TABLE ?auto_119434 ) ( ON ?auto_119433 ?auto_119434 ) ( ON ?auto_119435 ?auto_119433 ) ( not ( = ?auto_119434 ?auto_119433 ) ) ( not ( = ?auto_119434 ?auto_119435 ) ) ( not ( = ?auto_119434 ?auto_119432 ) ) ( not ( = ?auto_119434 ?auto_119431 ) ) ( not ( = ?auto_119433 ?auto_119435 ) ) ( not ( = ?auto_119433 ?auto_119432 ) ) ( not ( = ?auto_119433 ?auto_119431 ) ) ( not ( = ?auto_119428 ?auto_119434 ) ) ( not ( = ?auto_119428 ?auto_119433 ) ) ( not ( = ?auto_119429 ?auto_119434 ) ) ( not ( = ?auto_119429 ?auto_119433 ) ) ( not ( = ?auto_119430 ?auto_119434 ) ) ( not ( = ?auto_119430 ?auto_119433 ) ) ( ON ?auto_119430 ?auto_119431 ) ( ON ?auto_119428 ?auto_119436 ) ( CLEAR ?auto_119428 ) ( not ( = ?auto_119428 ?auto_119436 ) ) ( not ( = ?auto_119429 ?auto_119436 ) ) ( not ( = ?auto_119430 ?auto_119436 ) ) ( not ( = ?auto_119431 ?auto_119436 ) ) ( not ( = ?auto_119432 ?auto_119436 ) ) ( not ( = ?auto_119435 ?auto_119436 ) ) ( not ( = ?auto_119434 ?auto_119436 ) ) ( not ( = ?auto_119433 ?auto_119436 ) ) ( HOLDING ?auto_119429 ) ( CLEAR ?auto_119430 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119434 ?auto_119433 ?auto_119435 ?auto_119432 ?auto_119431 ?auto_119430 ?auto_119429 )
      ( MAKE-5PILE ?auto_119428 ?auto_119429 ?auto_119430 ?auto_119431 ?auto_119432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119437 - BLOCK
      ?auto_119438 - BLOCK
      ?auto_119439 - BLOCK
      ?auto_119440 - BLOCK
      ?auto_119441 - BLOCK
    )
    :vars
    (
      ?auto_119442 - BLOCK
      ?auto_119444 - BLOCK
      ?auto_119443 - BLOCK
      ?auto_119445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119437 ?auto_119438 ) ) ( not ( = ?auto_119437 ?auto_119439 ) ) ( not ( = ?auto_119437 ?auto_119440 ) ) ( not ( = ?auto_119437 ?auto_119441 ) ) ( not ( = ?auto_119438 ?auto_119439 ) ) ( not ( = ?auto_119438 ?auto_119440 ) ) ( not ( = ?auto_119438 ?auto_119441 ) ) ( not ( = ?auto_119439 ?auto_119440 ) ) ( not ( = ?auto_119439 ?auto_119441 ) ) ( not ( = ?auto_119440 ?auto_119441 ) ) ( ON ?auto_119441 ?auto_119442 ) ( not ( = ?auto_119437 ?auto_119442 ) ) ( not ( = ?auto_119438 ?auto_119442 ) ) ( not ( = ?auto_119439 ?auto_119442 ) ) ( not ( = ?auto_119440 ?auto_119442 ) ) ( not ( = ?auto_119441 ?auto_119442 ) ) ( ON ?auto_119440 ?auto_119441 ) ( ON-TABLE ?auto_119444 ) ( ON ?auto_119443 ?auto_119444 ) ( ON ?auto_119442 ?auto_119443 ) ( not ( = ?auto_119444 ?auto_119443 ) ) ( not ( = ?auto_119444 ?auto_119442 ) ) ( not ( = ?auto_119444 ?auto_119441 ) ) ( not ( = ?auto_119444 ?auto_119440 ) ) ( not ( = ?auto_119443 ?auto_119442 ) ) ( not ( = ?auto_119443 ?auto_119441 ) ) ( not ( = ?auto_119443 ?auto_119440 ) ) ( not ( = ?auto_119437 ?auto_119444 ) ) ( not ( = ?auto_119437 ?auto_119443 ) ) ( not ( = ?auto_119438 ?auto_119444 ) ) ( not ( = ?auto_119438 ?auto_119443 ) ) ( not ( = ?auto_119439 ?auto_119444 ) ) ( not ( = ?auto_119439 ?auto_119443 ) ) ( ON ?auto_119439 ?auto_119440 ) ( ON ?auto_119437 ?auto_119445 ) ( not ( = ?auto_119437 ?auto_119445 ) ) ( not ( = ?auto_119438 ?auto_119445 ) ) ( not ( = ?auto_119439 ?auto_119445 ) ) ( not ( = ?auto_119440 ?auto_119445 ) ) ( not ( = ?auto_119441 ?auto_119445 ) ) ( not ( = ?auto_119442 ?auto_119445 ) ) ( not ( = ?auto_119444 ?auto_119445 ) ) ( not ( = ?auto_119443 ?auto_119445 ) ) ( CLEAR ?auto_119439 ) ( ON ?auto_119438 ?auto_119437 ) ( CLEAR ?auto_119438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119445 ?auto_119437 )
      ( MAKE-5PILE ?auto_119437 ?auto_119438 ?auto_119439 ?auto_119440 ?auto_119441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119446 - BLOCK
      ?auto_119447 - BLOCK
      ?auto_119448 - BLOCK
      ?auto_119449 - BLOCK
      ?auto_119450 - BLOCK
    )
    :vars
    (
      ?auto_119451 - BLOCK
      ?auto_119452 - BLOCK
      ?auto_119454 - BLOCK
      ?auto_119453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119446 ?auto_119447 ) ) ( not ( = ?auto_119446 ?auto_119448 ) ) ( not ( = ?auto_119446 ?auto_119449 ) ) ( not ( = ?auto_119446 ?auto_119450 ) ) ( not ( = ?auto_119447 ?auto_119448 ) ) ( not ( = ?auto_119447 ?auto_119449 ) ) ( not ( = ?auto_119447 ?auto_119450 ) ) ( not ( = ?auto_119448 ?auto_119449 ) ) ( not ( = ?auto_119448 ?auto_119450 ) ) ( not ( = ?auto_119449 ?auto_119450 ) ) ( ON ?auto_119450 ?auto_119451 ) ( not ( = ?auto_119446 ?auto_119451 ) ) ( not ( = ?auto_119447 ?auto_119451 ) ) ( not ( = ?auto_119448 ?auto_119451 ) ) ( not ( = ?auto_119449 ?auto_119451 ) ) ( not ( = ?auto_119450 ?auto_119451 ) ) ( ON ?auto_119449 ?auto_119450 ) ( ON-TABLE ?auto_119452 ) ( ON ?auto_119454 ?auto_119452 ) ( ON ?auto_119451 ?auto_119454 ) ( not ( = ?auto_119452 ?auto_119454 ) ) ( not ( = ?auto_119452 ?auto_119451 ) ) ( not ( = ?auto_119452 ?auto_119450 ) ) ( not ( = ?auto_119452 ?auto_119449 ) ) ( not ( = ?auto_119454 ?auto_119451 ) ) ( not ( = ?auto_119454 ?auto_119450 ) ) ( not ( = ?auto_119454 ?auto_119449 ) ) ( not ( = ?auto_119446 ?auto_119452 ) ) ( not ( = ?auto_119446 ?auto_119454 ) ) ( not ( = ?auto_119447 ?auto_119452 ) ) ( not ( = ?auto_119447 ?auto_119454 ) ) ( not ( = ?auto_119448 ?auto_119452 ) ) ( not ( = ?auto_119448 ?auto_119454 ) ) ( ON ?auto_119446 ?auto_119453 ) ( not ( = ?auto_119446 ?auto_119453 ) ) ( not ( = ?auto_119447 ?auto_119453 ) ) ( not ( = ?auto_119448 ?auto_119453 ) ) ( not ( = ?auto_119449 ?auto_119453 ) ) ( not ( = ?auto_119450 ?auto_119453 ) ) ( not ( = ?auto_119451 ?auto_119453 ) ) ( not ( = ?auto_119452 ?auto_119453 ) ) ( not ( = ?auto_119454 ?auto_119453 ) ) ( ON ?auto_119447 ?auto_119446 ) ( CLEAR ?auto_119447 ) ( ON-TABLE ?auto_119453 ) ( HOLDING ?auto_119448 ) ( CLEAR ?auto_119449 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119452 ?auto_119454 ?auto_119451 ?auto_119450 ?auto_119449 ?auto_119448 )
      ( MAKE-5PILE ?auto_119446 ?auto_119447 ?auto_119448 ?auto_119449 ?auto_119450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119455 - BLOCK
      ?auto_119456 - BLOCK
      ?auto_119457 - BLOCK
      ?auto_119458 - BLOCK
      ?auto_119459 - BLOCK
    )
    :vars
    (
      ?auto_119462 - BLOCK
      ?auto_119460 - BLOCK
      ?auto_119463 - BLOCK
      ?auto_119461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119455 ?auto_119456 ) ) ( not ( = ?auto_119455 ?auto_119457 ) ) ( not ( = ?auto_119455 ?auto_119458 ) ) ( not ( = ?auto_119455 ?auto_119459 ) ) ( not ( = ?auto_119456 ?auto_119457 ) ) ( not ( = ?auto_119456 ?auto_119458 ) ) ( not ( = ?auto_119456 ?auto_119459 ) ) ( not ( = ?auto_119457 ?auto_119458 ) ) ( not ( = ?auto_119457 ?auto_119459 ) ) ( not ( = ?auto_119458 ?auto_119459 ) ) ( ON ?auto_119459 ?auto_119462 ) ( not ( = ?auto_119455 ?auto_119462 ) ) ( not ( = ?auto_119456 ?auto_119462 ) ) ( not ( = ?auto_119457 ?auto_119462 ) ) ( not ( = ?auto_119458 ?auto_119462 ) ) ( not ( = ?auto_119459 ?auto_119462 ) ) ( ON ?auto_119458 ?auto_119459 ) ( ON-TABLE ?auto_119460 ) ( ON ?auto_119463 ?auto_119460 ) ( ON ?auto_119462 ?auto_119463 ) ( not ( = ?auto_119460 ?auto_119463 ) ) ( not ( = ?auto_119460 ?auto_119462 ) ) ( not ( = ?auto_119460 ?auto_119459 ) ) ( not ( = ?auto_119460 ?auto_119458 ) ) ( not ( = ?auto_119463 ?auto_119462 ) ) ( not ( = ?auto_119463 ?auto_119459 ) ) ( not ( = ?auto_119463 ?auto_119458 ) ) ( not ( = ?auto_119455 ?auto_119460 ) ) ( not ( = ?auto_119455 ?auto_119463 ) ) ( not ( = ?auto_119456 ?auto_119460 ) ) ( not ( = ?auto_119456 ?auto_119463 ) ) ( not ( = ?auto_119457 ?auto_119460 ) ) ( not ( = ?auto_119457 ?auto_119463 ) ) ( ON ?auto_119455 ?auto_119461 ) ( not ( = ?auto_119455 ?auto_119461 ) ) ( not ( = ?auto_119456 ?auto_119461 ) ) ( not ( = ?auto_119457 ?auto_119461 ) ) ( not ( = ?auto_119458 ?auto_119461 ) ) ( not ( = ?auto_119459 ?auto_119461 ) ) ( not ( = ?auto_119462 ?auto_119461 ) ) ( not ( = ?auto_119460 ?auto_119461 ) ) ( not ( = ?auto_119463 ?auto_119461 ) ) ( ON ?auto_119456 ?auto_119455 ) ( ON-TABLE ?auto_119461 ) ( CLEAR ?auto_119458 ) ( ON ?auto_119457 ?auto_119456 ) ( CLEAR ?auto_119457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119461 ?auto_119455 ?auto_119456 )
      ( MAKE-5PILE ?auto_119455 ?auto_119456 ?auto_119457 ?auto_119458 ?auto_119459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119464 - BLOCK
      ?auto_119465 - BLOCK
      ?auto_119466 - BLOCK
      ?auto_119467 - BLOCK
      ?auto_119468 - BLOCK
    )
    :vars
    (
      ?auto_119470 - BLOCK
      ?auto_119471 - BLOCK
      ?auto_119469 - BLOCK
      ?auto_119472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119464 ?auto_119465 ) ) ( not ( = ?auto_119464 ?auto_119466 ) ) ( not ( = ?auto_119464 ?auto_119467 ) ) ( not ( = ?auto_119464 ?auto_119468 ) ) ( not ( = ?auto_119465 ?auto_119466 ) ) ( not ( = ?auto_119465 ?auto_119467 ) ) ( not ( = ?auto_119465 ?auto_119468 ) ) ( not ( = ?auto_119466 ?auto_119467 ) ) ( not ( = ?auto_119466 ?auto_119468 ) ) ( not ( = ?auto_119467 ?auto_119468 ) ) ( ON ?auto_119468 ?auto_119470 ) ( not ( = ?auto_119464 ?auto_119470 ) ) ( not ( = ?auto_119465 ?auto_119470 ) ) ( not ( = ?auto_119466 ?auto_119470 ) ) ( not ( = ?auto_119467 ?auto_119470 ) ) ( not ( = ?auto_119468 ?auto_119470 ) ) ( ON-TABLE ?auto_119471 ) ( ON ?auto_119469 ?auto_119471 ) ( ON ?auto_119470 ?auto_119469 ) ( not ( = ?auto_119471 ?auto_119469 ) ) ( not ( = ?auto_119471 ?auto_119470 ) ) ( not ( = ?auto_119471 ?auto_119468 ) ) ( not ( = ?auto_119471 ?auto_119467 ) ) ( not ( = ?auto_119469 ?auto_119470 ) ) ( not ( = ?auto_119469 ?auto_119468 ) ) ( not ( = ?auto_119469 ?auto_119467 ) ) ( not ( = ?auto_119464 ?auto_119471 ) ) ( not ( = ?auto_119464 ?auto_119469 ) ) ( not ( = ?auto_119465 ?auto_119471 ) ) ( not ( = ?auto_119465 ?auto_119469 ) ) ( not ( = ?auto_119466 ?auto_119471 ) ) ( not ( = ?auto_119466 ?auto_119469 ) ) ( ON ?auto_119464 ?auto_119472 ) ( not ( = ?auto_119464 ?auto_119472 ) ) ( not ( = ?auto_119465 ?auto_119472 ) ) ( not ( = ?auto_119466 ?auto_119472 ) ) ( not ( = ?auto_119467 ?auto_119472 ) ) ( not ( = ?auto_119468 ?auto_119472 ) ) ( not ( = ?auto_119470 ?auto_119472 ) ) ( not ( = ?auto_119471 ?auto_119472 ) ) ( not ( = ?auto_119469 ?auto_119472 ) ) ( ON ?auto_119465 ?auto_119464 ) ( ON-TABLE ?auto_119472 ) ( ON ?auto_119466 ?auto_119465 ) ( CLEAR ?auto_119466 ) ( HOLDING ?auto_119467 ) ( CLEAR ?auto_119468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119471 ?auto_119469 ?auto_119470 ?auto_119468 ?auto_119467 )
      ( MAKE-5PILE ?auto_119464 ?auto_119465 ?auto_119466 ?auto_119467 ?auto_119468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119473 - BLOCK
      ?auto_119474 - BLOCK
      ?auto_119475 - BLOCK
      ?auto_119476 - BLOCK
      ?auto_119477 - BLOCK
    )
    :vars
    (
      ?auto_119480 - BLOCK
      ?auto_119479 - BLOCK
      ?auto_119478 - BLOCK
      ?auto_119481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119473 ?auto_119474 ) ) ( not ( = ?auto_119473 ?auto_119475 ) ) ( not ( = ?auto_119473 ?auto_119476 ) ) ( not ( = ?auto_119473 ?auto_119477 ) ) ( not ( = ?auto_119474 ?auto_119475 ) ) ( not ( = ?auto_119474 ?auto_119476 ) ) ( not ( = ?auto_119474 ?auto_119477 ) ) ( not ( = ?auto_119475 ?auto_119476 ) ) ( not ( = ?auto_119475 ?auto_119477 ) ) ( not ( = ?auto_119476 ?auto_119477 ) ) ( ON ?auto_119477 ?auto_119480 ) ( not ( = ?auto_119473 ?auto_119480 ) ) ( not ( = ?auto_119474 ?auto_119480 ) ) ( not ( = ?auto_119475 ?auto_119480 ) ) ( not ( = ?auto_119476 ?auto_119480 ) ) ( not ( = ?auto_119477 ?auto_119480 ) ) ( ON-TABLE ?auto_119479 ) ( ON ?auto_119478 ?auto_119479 ) ( ON ?auto_119480 ?auto_119478 ) ( not ( = ?auto_119479 ?auto_119478 ) ) ( not ( = ?auto_119479 ?auto_119480 ) ) ( not ( = ?auto_119479 ?auto_119477 ) ) ( not ( = ?auto_119479 ?auto_119476 ) ) ( not ( = ?auto_119478 ?auto_119480 ) ) ( not ( = ?auto_119478 ?auto_119477 ) ) ( not ( = ?auto_119478 ?auto_119476 ) ) ( not ( = ?auto_119473 ?auto_119479 ) ) ( not ( = ?auto_119473 ?auto_119478 ) ) ( not ( = ?auto_119474 ?auto_119479 ) ) ( not ( = ?auto_119474 ?auto_119478 ) ) ( not ( = ?auto_119475 ?auto_119479 ) ) ( not ( = ?auto_119475 ?auto_119478 ) ) ( ON ?auto_119473 ?auto_119481 ) ( not ( = ?auto_119473 ?auto_119481 ) ) ( not ( = ?auto_119474 ?auto_119481 ) ) ( not ( = ?auto_119475 ?auto_119481 ) ) ( not ( = ?auto_119476 ?auto_119481 ) ) ( not ( = ?auto_119477 ?auto_119481 ) ) ( not ( = ?auto_119480 ?auto_119481 ) ) ( not ( = ?auto_119479 ?auto_119481 ) ) ( not ( = ?auto_119478 ?auto_119481 ) ) ( ON ?auto_119474 ?auto_119473 ) ( ON-TABLE ?auto_119481 ) ( ON ?auto_119475 ?auto_119474 ) ( CLEAR ?auto_119477 ) ( ON ?auto_119476 ?auto_119475 ) ( CLEAR ?auto_119476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119481 ?auto_119473 ?auto_119474 ?auto_119475 )
      ( MAKE-5PILE ?auto_119473 ?auto_119474 ?auto_119475 ?auto_119476 ?auto_119477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119482 - BLOCK
      ?auto_119483 - BLOCK
      ?auto_119484 - BLOCK
      ?auto_119485 - BLOCK
      ?auto_119486 - BLOCK
    )
    :vars
    (
      ?auto_119489 - BLOCK
      ?auto_119488 - BLOCK
      ?auto_119487 - BLOCK
      ?auto_119490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119482 ?auto_119483 ) ) ( not ( = ?auto_119482 ?auto_119484 ) ) ( not ( = ?auto_119482 ?auto_119485 ) ) ( not ( = ?auto_119482 ?auto_119486 ) ) ( not ( = ?auto_119483 ?auto_119484 ) ) ( not ( = ?auto_119483 ?auto_119485 ) ) ( not ( = ?auto_119483 ?auto_119486 ) ) ( not ( = ?auto_119484 ?auto_119485 ) ) ( not ( = ?auto_119484 ?auto_119486 ) ) ( not ( = ?auto_119485 ?auto_119486 ) ) ( not ( = ?auto_119482 ?auto_119489 ) ) ( not ( = ?auto_119483 ?auto_119489 ) ) ( not ( = ?auto_119484 ?auto_119489 ) ) ( not ( = ?auto_119485 ?auto_119489 ) ) ( not ( = ?auto_119486 ?auto_119489 ) ) ( ON-TABLE ?auto_119488 ) ( ON ?auto_119487 ?auto_119488 ) ( ON ?auto_119489 ?auto_119487 ) ( not ( = ?auto_119488 ?auto_119487 ) ) ( not ( = ?auto_119488 ?auto_119489 ) ) ( not ( = ?auto_119488 ?auto_119486 ) ) ( not ( = ?auto_119488 ?auto_119485 ) ) ( not ( = ?auto_119487 ?auto_119489 ) ) ( not ( = ?auto_119487 ?auto_119486 ) ) ( not ( = ?auto_119487 ?auto_119485 ) ) ( not ( = ?auto_119482 ?auto_119488 ) ) ( not ( = ?auto_119482 ?auto_119487 ) ) ( not ( = ?auto_119483 ?auto_119488 ) ) ( not ( = ?auto_119483 ?auto_119487 ) ) ( not ( = ?auto_119484 ?auto_119488 ) ) ( not ( = ?auto_119484 ?auto_119487 ) ) ( ON ?auto_119482 ?auto_119490 ) ( not ( = ?auto_119482 ?auto_119490 ) ) ( not ( = ?auto_119483 ?auto_119490 ) ) ( not ( = ?auto_119484 ?auto_119490 ) ) ( not ( = ?auto_119485 ?auto_119490 ) ) ( not ( = ?auto_119486 ?auto_119490 ) ) ( not ( = ?auto_119489 ?auto_119490 ) ) ( not ( = ?auto_119488 ?auto_119490 ) ) ( not ( = ?auto_119487 ?auto_119490 ) ) ( ON ?auto_119483 ?auto_119482 ) ( ON-TABLE ?auto_119490 ) ( ON ?auto_119484 ?auto_119483 ) ( ON ?auto_119485 ?auto_119484 ) ( CLEAR ?auto_119485 ) ( HOLDING ?auto_119486 ) ( CLEAR ?auto_119489 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119488 ?auto_119487 ?auto_119489 ?auto_119486 )
      ( MAKE-5PILE ?auto_119482 ?auto_119483 ?auto_119484 ?auto_119485 ?auto_119486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119491 - BLOCK
      ?auto_119492 - BLOCK
      ?auto_119493 - BLOCK
      ?auto_119494 - BLOCK
      ?auto_119495 - BLOCK
    )
    :vars
    (
      ?auto_119498 - BLOCK
      ?auto_119497 - BLOCK
      ?auto_119499 - BLOCK
      ?auto_119496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119491 ?auto_119492 ) ) ( not ( = ?auto_119491 ?auto_119493 ) ) ( not ( = ?auto_119491 ?auto_119494 ) ) ( not ( = ?auto_119491 ?auto_119495 ) ) ( not ( = ?auto_119492 ?auto_119493 ) ) ( not ( = ?auto_119492 ?auto_119494 ) ) ( not ( = ?auto_119492 ?auto_119495 ) ) ( not ( = ?auto_119493 ?auto_119494 ) ) ( not ( = ?auto_119493 ?auto_119495 ) ) ( not ( = ?auto_119494 ?auto_119495 ) ) ( not ( = ?auto_119491 ?auto_119498 ) ) ( not ( = ?auto_119492 ?auto_119498 ) ) ( not ( = ?auto_119493 ?auto_119498 ) ) ( not ( = ?auto_119494 ?auto_119498 ) ) ( not ( = ?auto_119495 ?auto_119498 ) ) ( ON-TABLE ?auto_119497 ) ( ON ?auto_119499 ?auto_119497 ) ( ON ?auto_119498 ?auto_119499 ) ( not ( = ?auto_119497 ?auto_119499 ) ) ( not ( = ?auto_119497 ?auto_119498 ) ) ( not ( = ?auto_119497 ?auto_119495 ) ) ( not ( = ?auto_119497 ?auto_119494 ) ) ( not ( = ?auto_119499 ?auto_119498 ) ) ( not ( = ?auto_119499 ?auto_119495 ) ) ( not ( = ?auto_119499 ?auto_119494 ) ) ( not ( = ?auto_119491 ?auto_119497 ) ) ( not ( = ?auto_119491 ?auto_119499 ) ) ( not ( = ?auto_119492 ?auto_119497 ) ) ( not ( = ?auto_119492 ?auto_119499 ) ) ( not ( = ?auto_119493 ?auto_119497 ) ) ( not ( = ?auto_119493 ?auto_119499 ) ) ( ON ?auto_119491 ?auto_119496 ) ( not ( = ?auto_119491 ?auto_119496 ) ) ( not ( = ?auto_119492 ?auto_119496 ) ) ( not ( = ?auto_119493 ?auto_119496 ) ) ( not ( = ?auto_119494 ?auto_119496 ) ) ( not ( = ?auto_119495 ?auto_119496 ) ) ( not ( = ?auto_119498 ?auto_119496 ) ) ( not ( = ?auto_119497 ?auto_119496 ) ) ( not ( = ?auto_119499 ?auto_119496 ) ) ( ON ?auto_119492 ?auto_119491 ) ( ON-TABLE ?auto_119496 ) ( ON ?auto_119493 ?auto_119492 ) ( ON ?auto_119494 ?auto_119493 ) ( CLEAR ?auto_119498 ) ( ON ?auto_119495 ?auto_119494 ) ( CLEAR ?auto_119495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119496 ?auto_119491 ?auto_119492 ?auto_119493 ?auto_119494 )
      ( MAKE-5PILE ?auto_119491 ?auto_119492 ?auto_119493 ?auto_119494 ?auto_119495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119500 - BLOCK
      ?auto_119501 - BLOCK
      ?auto_119502 - BLOCK
      ?auto_119503 - BLOCK
      ?auto_119504 - BLOCK
    )
    :vars
    (
      ?auto_119507 - BLOCK
      ?auto_119508 - BLOCK
      ?auto_119506 - BLOCK
      ?auto_119505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119500 ?auto_119501 ) ) ( not ( = ?auto_119500 ?auto_119502 ) ) ( not ( = ?auto_119500 ?auto_119503 ) ) ( not ( = ?auto_119500 ?auto_119504 ) ) ( not ( = ?auto_119501 ?auto_119502 ) ) ( not ( = ?auto_119501 ?auto_119503 ) ) ( not ( = ?auto_119501 ?auto_119504 ) ) ( not ( = ?auto_119502 ?auto_119503 ) ) ( not ( = ?auto_119502 ?auto_119504 ) ) ( not ( = ?auto_119503 ?auto_119504 ) ) ( not ( = ?auto_119500 ?auto_119507 ) ) ( not ( = ?auto_119501 ?auto_119507 ) ) ( not ( = ?auto_119502 ?auto_119507 ) ) ( not ( = ?auto_119503 ?auto_119507 ) ) ( not ( = ?auto_119504 ?auto_119507 ) ) ( ON-TABLE ?auto_119508 ) ( ON ?auto_119506 ?auto_119508 ) ( not ( = ?auto_119508 ?auto_119506 ) ) ( not ( = ?auto_119508 ?auto_119507 ) ) ( not ( = ?auto_119508 ?auto_119504 ) ) ( not ( = ?auto_119508 ?auto_119503 ) ) ( not ( = ?auto_119506 ?auto_119507 ) ) ( not ( = ?auto_119506 ?auto_119504 ) ) ( not ( = ?auto_119506 ?auto_119503 ) ) ( not ( = ?auto_119500 ?auto_119508 ) ) ( not ( = ?auto_119500 ?auto_119506 ) ) ( not ( = ?auto_119501 ?auto_119508 ) ) ( not ( = ?auto_119501 ?auto_119506 ) ) ( not ( = ?auto_119502 ?auto_119508 ) ) ( not ( = ?auto_119502 ?auto_119506 ) ) ( ON ?auto_119500 ?auto_119505 ) ( not ( = ?auto_119500 ?auto_119505 ) ) ( not ( = ?auto_119501 ?auto_119505 ) ) ( not ( = ?auto_119502 ?auto_119505 ) ) ( not ( = ?auto_119503 ?auto_119505 ) ) ( not ( = ?auto_119504 ?auto_119505 ) ) ( not ( = ?auto_119507 ?auto_119505 ) ) ( not ( = ?auto_119508 ?auto_119505 ) ) ( not ( = ?auto_119506 ?auto_119505 ) ) ( ON ?auto_119501 ?auto_119500 ) ( ON-TABLE ?auto_119505 ) ( ON ?auto_119502 ?auto_119501 ) ( ON ?auto_119503 ?auto_119502 ) ( ON ?auto_119504 ?auto_119503 ) ( CLEAR ?auto_119504 ) ( HOLDING ?auto_119507 ) ( CLEAR ?auto_119506 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119508 ?auto_119506 ?auto_119507 )
      ( MAKE-5PILE ?auto_119500 ?auto_119501 ?auto_119502 ?auto_119503 ?auto_119504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119509 - BLOCK
      ?auto_119510 - BLOCK
      ?auto_119511 - BLOCK
      ?auto_119512 - BLOCK
      ?auto_119513 - BLOCK
    )
    :vars
    (
      ?auto_119514 - BLOCK
      ?auto_119516 - BLOCK
      ?auto_119517 - BLOCK
      ?auto_119515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119509 ?auto_119510 ) ) ( not ( = ?auto_119509 ?auto_119511 ) ) ( not ( = ?auto_119509 ?auto_119512 ) ) ( not ( = ?auto_119509 ?auto_119513 ) ) ( not ( = ?auto_119510 ?auto_119511 ) ) ( not ( = ?auto_119510 ?auto_119512 ) ) ( not ( = ?auto_119510 ?auto_119513 ) ) ( not ( = ?auto_119511 ?auto_119512 ) ) ( not ( = ?auto_119511 ?auto_119513 ) ) ( not ( = ?auto_119512 ?auto_119513 ) ) ( not ( = ?auto_119509 ?auto_119514 ) ) ( not ( = ?auto_119510 ?auto_119514 ) ) ( not ( = ?auto_119511 ?auto_119514 ) ) ( not ( = ?auto_119512 ?auto_119514 ) ) ( not ( = ?auto_119513 ?auto_119514 ) ) ( ON-TABLE ?auto_119516 ) ( ON ?auto_119517 ?auto_119516 ) ( not ( = ?auto_119516 ?auto_119517 ) ) ( not ( = ?auto_119516 ?auto_119514 ) ) ( not ( = ?auto_119516 ?auto_119513 ) ) ( not ( = ?auto_119516 ?auto_119512 ) ) ( not ( = ?auto_119517 ?auto_119514 ) ) ( not ( = ?auto_119517 ?auto_119513 ) ) ( not ( = ?auto_119517 ?auto_119512 ) ) ( not ( = ?auto_119509 ?auto_119516 ) ) ( not ( = ?auto_119509 ?auto_119517 ) ) ( not ( = ?auto_119510 ?auto_119516 ) ) ( not ( = ?auto_119510 ?auto_119517 ) ) ( not ( = ?auto_119511 ?auto_119516 ) ) ( not ( = ?auto_119511 ?auto_119517 ) ) ( ON ?auto_119509 ?auto_119515 ) ( not ( = ?auto_119509 ?auto_119515 ) ) ( not ( = ?auto_119510 ?auto_119515 ) ) ( not ( = ?auto_119511 ?auto_119515 ) ) ( not ( = ?auto_119512 ?auto_119515 ) ) ( not ( = ?auto_119513 ?auto_119515 ) ) ( not ( = ?auto_119514 ?auto_119515 ) ) ( not ( = ?auto_119516 ?auto_119515 ) ) ( not ( = ?auto_119517 ?auto_119515 ) ) ( ON ?auto_119510 ?auto_119509 ) ( ON-TABLE ?auto_119515 ) ( ON ?auto_119511 ?auto_119510 ) ( ON ?auto_119512 ?auto_119511 ) ( ON ?auto_119513 ?auto_119512 ) ( CLEAR ?auto_119517 ) ( ON ?auto_119514 ?auto_119513 ) ( CLEAR ?auto_119514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119515 ?auto_119509 ?auto_119510 ?auto_119511 ?auto_119512 ?auto_119513 )
      ( MAKE-5PILE ?auto_119509 ?auto_119510 ?auto_119511 ?auto_119512 ?auto_119513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119518 - BLOCK
      ?auto_119519 - BLOCK
      ?auto_119520 - BLOCK
      ?auto_119521 - BLOCK
      ?auto_119522 - BLOCK
    )
    :vars
    (
      ?auto_119525 - BLOCK
      ?auto_119523 - BLOCK
      ?auto_119526 - BLOCK
      ?auto_119524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119518 ?auto_119519 ) ) ( not ( = ?auto_119518 ?auto_119520 ) ) ( not ( = ?auto_119518 ?auto_119521 ) ) ( not ( = ?auto_119518 ?auto_119522 ) ) ( not ( = ?auto_119519 ?auto_119520 ) ) ( not ( = ?auto_119519 ?auto_119521 ) ) ( not ( = ?auto_119519 ?auto_119522 ) ) ( not ( = ?auto_119520 ?auto_119521 ) ) ( not ( = ?auto_119520 ?auto_119522 ) ) ( not ( = ?auto_119521 ?auto_119522 ) ) ( not ( = ?auto_119518 ?auto_119525 ) ) ( not ( = ?auto_119519 ?auto_119525 ) ) ( not ( = ?auto_119520 ?auto_119525 ) ) ( not ( = ?auto_119521 ?auto_119525 ) ) ( not ( = ?auto_119522 ?auto_119525 ) ) ( ON-TABLE ?auto_119523 ) ( not ( = ?auto_119523 ?auto_119526 ) ) ( not ( = ?auto_119523 ?auto_119525 ) ) ( not ( = ?auto_119523 ?auto_119522 ) ) ( not ( = ?auto_119523 ?auto_119521 ) ) ( not ( = ?auto_119526 ?auto_119525 ) ) ( not ( = ?auto_119526 ?auto_119522 ) ) ( not ( = ?auto_119526 ?auto_119521 ) ) ( not ( = ?auto_119518 ?auto_119523 ) ) ( not ( = ?auto_119518 ?auto_119526 ) ) ( not ( = ?auto_119519 ?auto_119523 ) ) ( not ( = ?auto_119519 ?auto_119526 ) ) ( not ( = ?auto_119520 ?auto_119523 ) ) ( not ( = ?auto_119520 ?auto_119526 ) ) ( ON ?auto_119518 ?auto_119524 ) ( not ( = ?auto_119518 ?auto_119524 ) ) ( not ( = ?auto_119519 ?auto_119524 ) ) ( not ( = ?auto_119520 ?auto_119524 ) ) ( not ( = ?auto_119521 ?auto_119524 ) ) ( not ( = ?auto_119522 ?auto_119524 ) ) ( not ( = ?auto_119525 ?auto_119524 ) ) ( not ( = ?auto_119523 ?auto_119524 ) ) ( not ( = ?auto_119526 ?auto_119524 ) ) ( ON ?auto_119519 ?auto_119518 ) ( ON-TABLE ?auto_119524 ) ( ON ?auto_119520 ?auto_119519 ) ( ON ?auto_119521 ?auto_119520 ) ( ON ?auto_119522 ?auto_119521 ) ( ON ?auto_119525 ?auto_119522 ) ( CLEAR ?auto_119525 ) ( HOLDING ?auto_119526 ) ( CLEAR ?auto_119523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119523 ?auto_119526 )
      ( MAKE-5PILE ?auto_119518 ?auto_119519 ?auto_119520 ?auto_119521 ?auto_119522 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119527 - BLOCK
      ?auto_119528 - BLOCK
      ?auto_119529 - BLOCK
      ?auto_119530 - BLOCK
      ?auto_119531 - BLOCK
    )
    :vars
    (
      ?auto_119532 - BLOCK
      ?auto_119534 - BLOCK
      ?auto_119533 - BLOCK
      ?auto_119535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119527 ?auto_119528 ) ) ( not ( = ?auto_119527 ?auto_119529 ) ) ( not ( = ?auto_119527 ?auto_119530 ) ) ( not ( = ?auto_119527 ?auto_119531 ) ) ( not ( = ?auto_119528 ?auto_119529 ) ) ( not ( = ?auto_119528 ?auto_119530 ) ) ( not ( = ?auto_119528 ?auto_119531 ) ) ( not ( = ?auto_119529 ?auto_119530 ) ) ( not ( = ?auto_119529 ?auto_119531 ) ) ( not ( = ?auto_119530 ?auto_119531 ) ) ( not ( = ?auto_119527 ?auto_119532 ) ) ( not ( = ?auto_119528 ?auto_119532 ) ) ( not ( = ?auto_119529 ?auto_119532 ) ) ( not ( = ?auto_119530 ?auto_119532 ) ) ( not ( = ?auto_119531 ?auto_119532 ) ) ( ON-TABLE ?auto_119534 ) ( not ( = ?auto_119534 ?auto_119533 ) ) ( not ( = ?auto_119534 ?auto_119532 ) ) ( not ( = ?auto_119534 ?auto_119531 ) ) ( not ( = ?auto_119534 ?auto_119530 ) ) ( not ( = ?auto_119533 ?auto_119532 ) ) ( not ( = ?auto_119533 ?auto_119531 ) ) ( not ( = ?auto_119533 ?auto_119530 ) ) ( not ( = ?auto_119527 ?auto_119534 ) ) ( not ( = ?auto_119527 ?auto_119533 ) ) ( not ( = ?auto_119528 ?auto_119534 ) ) ( not ( = ?auto_119528 ?auto_119533 ) ) ( not ( = ?auto_119529 ?auto_119534 ) ) ( not ( = ?auto_119529 ?auto_119533 ) ) ( ON ?auto_119527 ?auto_119535 ) ( not ( = ?auto_119527 ?auto_119535 ) ) ( not ( = ?auto_119528 ?auto_119535 ) ) ( not ( = ?auto_119529 ?auto_119535 ) ) ( not ( = ?auto_119530 ?auto_119535 ) ) ( not ( = ?auto_119531 ?auto_119535 ) ) ( not ( = ?auto_119532 ?auto_119535 ) ) ( not ( = ?auto_119534 ?auto_119535 ) ) ( not ( = ?auto_119533 ?auto_119535 ) ) ( ON ?auto_119528 ?auto_119527 ) ( ON-TABLE ?auto_119535 ) ( ON ?auto_119529 ?auto_119528 ) ( ON ?auto_119530 ?auto_119529 ) ( ON ?auto_119531 ?auto_119530 ) ( ON ?auto_119532 ?auto_119531 ) ( CLEAR ?auto_119534 ) ( ON ?auto_119533 ?auto_119532 ) ( CLEAR ?auto_119533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119535 ?auto_119527 ?auto_119528 ?auto_119529 ?auto_119530 ?auto_119531 ?auto_119532 )
      ( MAKE-5PILE ?auto_119527 ?auto_119528 ?auto_119529 ?auto_119530 ?auto_119531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119536 - BLOCK
      ?auto_119537 - BLOCK
      ?auto_119538 - BLOCK
      ?auto_119539 - BLOCK
      ?auto_119540 - BLOCK
    )
    :vars
    (
      ?auto_119542 - BLOCK
      ?auto_119541 - BLOCK
      ?auto_119543 - BLOCK
      ?auto_119544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119536 ?auto_119537 ) ) ( not ( = ?auto_119536 ?auto_119538 ) ) ( not ( = ?auto_119536 ?auto_119539 ) ) ( not ( = ?auto_119536 ?auto_119540 ) ) ( not ( = ?auto_119537 ?auto_119538 ) ) ( not ( = ?auto_119537 ?auto_119539 ) ) ( not ( = ?auto_119537 ?auto_119540 ) ) ( not ( = ?auto_119538 ?auto_119539 ) ) ( not ( = ?auto_119538 ?auto_119540 ) ) ( not ( = ?auto_119539 ?auto_119540 ) ) ( not ( = ?auto_119536 ?auto_119542 ) ) ( not ( = ?auto_119537 ?auto_119542 ) ) ( not ( = ?auto_119538 ?auto_119542 ) ) ( not ( = ?auto_119539 ?auto_119542 ) ) ( not ( = ?auto_119540 ?auto_119542 ) ) ( not ( = ?auto_119541 ?auto_119543 ) ) ( not ( = ?auto_119541 ?auto_119542 ) ) ( not ( = ?auto_119541 ?auto_119540 ) ) ( not ( = ?auto_119541 ?auto_119539 ) ) ( not ( = ?auto_119543 ?auto_119542 ) ) ( not ( = ?auto_119543 ?auto_119540 ) ) ( not ( = ?auto_119543 ?auto_119539 ) ) ( not ( = ?auto_119536 ?auto_119541 ) ) ( not ( = ?auto_119536 ?auto_119543 ) ) ( not ( = ?auto_119537 ?auto_119541 ) ) ( not ( = ?auto_119537 ?auto_119543 ) ) ( not ( = ?auto_119538 ?auto_119541 ) ) ( not ( = ?auto_119538 ?auto_119543 ) ) ( ON ?auto_119536 ?auto_119544 ) ( not ( = ?auto_119536 ?auto_119544 ) ) ( not ( = ?auto_119537 ?auto_119544 ) ) ( not ( = ?auto_119538 ?auto_119544 ) ) ( not ( = ?auto_119539 ?auto_119544 ) ) ( not ( = ?auto_119540 ?auto_119544 ) ) ( not ( = ?auto_119542 ?auto_119544 ) ) ( not ( = ?auto_119541 ?auto_119544 ) ) ( not ( = ?auto_119543 ?auto_119544 ) ) ( ON ?auto_119537 ?auto_119536 ) ( ON-TABLE ?auto_119544 ) ( ON ?auto_119538 ?auto_119537 ) ( ON ?auto_119539 ?auto_119538 ) ( ON ?auto_119540 ?auto_119539 ) ( ON ?auto_119542 ?auto_119540 ) ( ON ?auto_119543 ?auto_119542 ) ( CLEAR ?auto_119543 ) ( HOLDING ?auto_119541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119541 )
      ( MAKE-5PILE ?auto_119536 ?auto_119537 ?auto_119538 ?auto_119539 ?auto_119540 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119545 - BLOCK
      ?auto_119546 - BLOCK
      ?auto_119547 - BLOCK
      ?auto_119548 - BLOCK
      ?auto_119549 - BLOCK
    )
    :vars
    (
      ?auto_119551 - BLOCK
      ?auto_119550 - BLOCK
      ?auto_119552 - BLOCK
      ?auto_119553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119545 ?auto_119546 ) ) ( not ( = ?auto_119545 ?auto_119547 ) ) ( not ( = ?auto_119545 ?auto_119548 ) ) ( not ( = ?auto_119545 ?auto_119549 ) ) ( not ( = ?auto_119546 ?auto_119547 ) ) ( not ( = ?auto_119546 ?auto_119548 ) ) ( not ( = ?auto_119546 ?auto_119549 ) ) ( not ( = ?auto_119547 ?auto_119548 ) ) ( not ( = ?auto_119547 ?auto_119549 ) ) ( not ( = ?auto_119548 ?auto_119549 ) ) ( not ( = ?auto_119545 ?auto_119551 ) ) ( not ( = ?auto_119546 ?auto_119551 ) ) ( not ( = ?auto_119547 ?auto_119551 ) ) ( not ( = ?auto_119548 ?auto_119551 ) ) ( not ( = ?auto_119549 ?auto_119551 ) ) ( not ( = ?auto_119550 ?auto_119552 ) ) ( not ( = ?auto_119550 ?auto_119551 ) ) ( not ( = ?auto_119550 ?auto_119549 ) ) ( not ( = ?auto_119550 ?auto_119548 ) ) ( not ( = ?auto_119552 ?auto_119551 ) ) ( not ( = ?auto_119552 ?auto_119549 ) ) ( not ( = ?auto_119552 ?auto_119548 ) ) ( not ( = ?auto_119545 ?auto_119550 ) ) ( not ( = ?auto_119545 ?auto_119552 ) ) ( not ( = ?auto_119546 ?auto_119550 ) ) ( not ( = ?auto_119546 ?auto_119552 ) ) ( not ( = ?auto_119547 ?auto_119550 ) ) ( not ( = ?auto_119547 ?auto_119552 ) ) ( ON ?auto_119545 ?auto_119553 ) ( not ( = ?auto_119545 ?auto_119553 ) ) ( not ( = ?auto_119546 ?auto_119553 ) ) ( not ( = ?auto_119547 ?auto_119553 ) ) ( not ( = ?auto_119548 ?auto_119553 ) ) ( not ( = ?auto_119549 ?auto_119553 ) ) ( not ( = ?auto_119551 ?auto_119553 ) ) ( not ( = ?auto_119550 ?auto_119553 ) ) ( not ( = ?auto_119552 ?auto_119553 ) ) ( ON ?auto_119546 ?auto_119545 ) ( ON-TABLE ?auto_119553 ) ( ON ?auto_119547 ?auto_119546 ) ( ON ?auto_119548 ?auto_119547 ) ( ON ?auto_119549 ?auto_119548 ) ( ON ?auto_119551 ?auto_119549 ) ( ON ?auto_119552 ?auto_119551 ) ( ON ?auto_119550 ?auto_119552 ) ( CLEAR ?auto_119550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_119553 ?auto_119545 ?auto_119546 ?auto_119547 ?auto_119548 ?auto_119549 ?auto_119551 ?auto_119552 )
      ( MAKE-5PILE ?auto_119545 ?auto_119546 ?auto_119547 ?auto_119548 ?auto_119549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119569 - BLOCK
      ?auto_119570 - BLOCK
    )
    :vars
    (
      ?auto_119573 - BLOCK
      ?auto_119571 - BLOCK
      ?auto_119572 - BLOCK
      ?auto_119574 - BLOCK
      ?auto_119575 - BLOCK
      ?auto_119576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119573 ?auto_119570 ) ( ON-TABLE ?auto_119569 ) ( ON ?auto_119570 ?auto_119569 ) ( not ( = ?auto_119569 ?auto_119570 ) ) ( not ( = ?auto_119569 ?auto_119573 ) ) ( not ( = ?auto_119570 ?auto_119573 ) ) ( not ( = ?auto_119569 ?auto_119571 ) ) ( not ( = ?auto_119569 ?auto_119572 ) ) ( not ( = ?auto_119570 ?auto_119571 ) ) ( not ( = ?auto_119570 ?auto_119572 ) ) ( not ( = ?auto_119573 ?auto_119571 ) ) ( not ( = ?auto_119573 ?auto_119572 ) ) ( not ( = ?auto_119571 ?auto_119572 ) ) ( ON ?auto_119571 ?auto_119573 ) ( CLEAR ?auto_119571 ) ( HOLDING ?auto_119572 ) ( CLEAR ?auto_119574 ) ( ON-TABLE ?auto_119575 ) ( ON ?auto_119576 ?auto_119575 ) ( ON ?auto_119574 ?auto_119576 ) ( not ( = ?auto_119575 ?auto_119576 ) ) ( not ( = ?auto_119575 ?auto_119574 ) ) ( not ( = ?auto_119575 ?auto_119572 ) ) ( not ( = ?auto_119576 ?auto_119574 ) ) ( not ( = ?auto_119576 ?auto_119572 ) ) ( not ( = ?auto_119574 ?auto_119572 ) ) ( not ( = ?auto_119569 ?auto_119574 ) ) ( not ( = ?auto_119569 ?auto_119575 ) ) ( not ( = ?auto_119569 ?auto_119576 ) ) ( not ( = ?auto_119570 ?auto_119574 ) ) ( not ( = ?auto_119570 ?auto_119575 ) ) ( not ( = ?auto_119570 ?auto_119576 ) ) ( not ( = ?auto_119573 ?auto_119574 ) ) ( not ( = ?auto_119573 ?auto_119575 ) ) ( not ( = ?auto_119573 ?auto_119576 ) ) ( not ( = ?auto_119571 ?auto_119574 ) ) ( not ( = ?auto_119571 ?auto_119575 ) ) ( not ( = ?auto_119571 ?auto_119576 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119575 ?auto_119576 ?auto_119574 ?auto_119572 )
      ( MAKE-2PILE ?auto_119569 ?auto_119570 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119577 - BLOCK
      ?auto_119578 - BLOCK
    )
    :vars
    (
      ?auto_119583 - BLOCK
      ?auto_119581 - BLOCK
      ?auto_119580 - BLOCK
      ?auto_119584 - BLOCK
      ?auto_119582 - BLOCK
      ?auto_119579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119583 ?auto_119578 ) ( ON-TABLE ?auto_119577 ) ( ON ?auto_119578 ?auto_119577 ) ( not ( = ?auto_119577 ?auto_119578 ) ) ( not ( = ?auto_119577 ?auto_119583 ) ) ( not ( = ?auto_119578 ?auto_119583 ) ) ( not ( = ?auto_119577 ?auto_119581 ) ) ( not ( = ?auto_119577 ?auto_119580 ) ) ( not ( = ?auto_119578 ?auto_119581 ) ) ( not ( = ?auto_119578 ?auto_119580 ) ) ( not ( = ?auto_119583 ?auto_119581 ) ) ( not ( = ?auto_119583 ?auto_119580 ) ) ( not ( = ?auto_119581 ?auto_119580 ) ) ( ON ?auto_119581 ?auto_119583 ) ( CLEAR ?auto_119584 ) ( ON-TABLE ?auto_119582 ) ( ON ?auto_119579 ?auto_119582 ) ( ON ?auto_119584 ?auto_119579 ) ( not ( = ?auto_119582 ?auto_119579 ) ) ( not ( = ?auto_119582 ?auto_119584 ) ) ( not ( = ?auto_119582 ?auto_119580 ) ) ( not ( = ?auto_119579 ?auto_119584 ) ) ( not ( = ?auto_119579 ?auto_119580 ) ) ( not ( = ?auto_119584 ?auto_119580 ) ) ( not ( = ?auto_119577 ?auto_119584 ) ) ( not ( = ?auto_119577 ?auto_119582 ) ) ( not ( = ?auto_119577 ?auto_119579 ) ) ( not ( = ?auto_119578 ?auto_119584 ) ) ( not ( = ?auto_119578 ?auto_119582 ) ) ( not ( = ?auto_119578 ?auto_119579 ) ) ( not ( = ?auto_119583 ?auto_119584 ) ) ( not ( = ?auto_119583 ?auto_119582 ) ) ( not ( = ?auto_119583 ?auto_119579 ) ) ( not ( = ?auto_119581 ?auto_119584 ) ) ( not ( = ?auto_119581 ?auto_119582 ) ) ( not ( = ?auto_119581 ?auto_119579 ) ) ( ON ?auto_119580 ?auto_119581 ) ( CLEAR ?auto_119580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119577 ?auto_119578 ?auto_119583 ?auto_119581 )
      ( MAKE-2PILE ?auto_119577 ?auto_119578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119585 - BLOCK
      ?auto_119586 - BLOCK
    )
    :vars
    (
      ?auto_119589 - BLOCK
      ?auto_119587 - BLOCK
      ?auto_119590 - BLOCK
      ?auto_119591 - BLOCK
      ?auto_119592 - BLOCK
      ?auto_119588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119589 ?auto_119586 ) ( ON-TABLE ?auto_119585 ) ( ON ?auto_119586 ?auto_119585 ) ( not ( = ?auto_119585 ?auto_119586 ) ) ( not ( = ?auto_119585 ?auto_119589 ) ) ( not ( = ?auto_119586 ?auto_119589 ) ) ( not ( = ?auto_119585 ?auto_119587 ) ) ( not ( = ?auto_119585 ?auto_119590 ) ) ( not ( = ?auto_119586 ?auto_119587 ) ) ( not ( = ?auto_119586 ?auto_119590 ) ) ( not ( = ?auto_119589 ?auto_119587 ) ) ( not ( = ?auto_119589 ?auto_119590 ) ) ( not ( = ?auto_119587 ?auto_119590 ) ) ( ON ?auto_119587 ?auto_119589 ) ( ON-TABLE ?auto_119591 ) ( ON ?auto_119592 ?auto_119591 ) ( not ( = ?auto_119591 ?auto_119592 ) ) ( not ( = ?auto_119591 ?auto_119588 ) ) ( not ( = ?auto_119591 ?auto_119590 ) ) ( not ( = ?auto_119592 ?auto_119588 ) ) ( not ( = ?auto_119592 ?auto_119590 ) ) ( not ( = ?auto_119588 ?auto_119590 ) ) ( not ( = ?auto_119585 ?auto_119588 ) ) ( not ( = ?auto_119585 ?auto_119591 ) ) ( not ( = ?auto_119585 ?auto_119592 ) ) ( not ( = ?auto_119586 ?auto_119588 ) ) ( not ( = ?auto_119586 ?auto_119591 ) ) ( not ( = ?auto_119586 ?auto_119592 ) ) ( not ( = ?auto_119589 ?auto_119588 ) ) ( not ( = ?auto_119589 ?auto_119591 ) ) ( not ( = ?auto_119589 ?auto_119592 ) ) ( not ( = ?auto_119587 ?auto_119588 ) ) ( not ( = ?auto_119587 ?auto_119591 ) ) ( not ( = ?auto_119587 ?auto_119592 ) ) ( ON ?auto_119590 ?auto_119587 ) ( CLEAR ?auto_119590 ) ( HOLDING ?auto_119588 ) ( CLEAR ?auto_119592 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119591 ?auto_119592 ?auto_119588 )
      ( MAKE-2PILE ?auto_119585 ?auto_119586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119593 - BLOCK
      ?auto_119594 - BLOCK
    )
    :vars
    (
      ?auto_119596 - BLOCK
      ?auto_119595 - BLOCK
      ?auto_119597 - BLOCK
      ?auto_119599 - BLOCK
      ?auto_119598 - BLOCK
      ?auto_119600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119596 ?auto_119594 ) ( ON-TABLE ?auto_119593 ) ( ON ?auto_119594 ?auto_119593 ) ( not ( = ?auto_119593 ?auto_119594 ) ) ( not ( = ?auto_119593 ?auto_119596 ) ) ( not ( = ?auto_119594 ?auto_119596 ) ) ( not ( = ?auto_119593 ?auto_119595 ) ) ( not ( = ?auto_119593 ?auto_119597 ) ) ( not ( = ?auto_119594 ?auto_119595 ) ) ( not ( = ?auto_119594 ?auto_119597 ) ) ( not ( = ?auto_119596 ?auto_119595 ) ) ( not ( = ?auto_119596 ?auto_119597 ) ) ( not ( = ?auto_119595 ?auto_119597 ) ) ( ON ?auto_119595 ?auto_119596 ) ( ON-TABLE ?auto_119599 ) ( ON ?auto_119598 ?auto_119599 ) ( not ( = ?auto_119599 ?auto_119598 ) ) ( not ( = ?auto_119599 ?auto_119600 ) ) ( not ( = ?auto_119599 ?auto_119597 ) ) ( not ( = ?auto_119598 ?auto_119600 ) ) ( not ( = ?auto_119598 ?auto_119597 ) ) ( not ( = ?auto_119600 ?auto_119597 ) ) ( not ( = ?auto_119593 ?auto_119600 ) ) ( not ( = ?auto_119593 ?auto_119599 ) ) ( not ( = ?auto_119593 ?auto_119598 ) ) ( not ( = ?auto_119594 ?auto_119600 ) ) ( not ( = ?auto_119594 ?auto_119599 ) ) ( not ( = ?auto_119594 ?auto_119598 ) ) ( not ( = ?auto_119596 ?auto_119600 ) ) ( not ( = ?auto_119596 ?auto_119599 ) ) ( not ( = ?auto_119596 ?auto_119598 ) ) ( not ( = ?auto_119595 ?auto_119600 ) ) ( not ( = ?auto_119595 ?auto_119599 ) ) ( not ( = ?auto_119595 ?auto_119598 ) ) ( ON ?auto_119597 ?auto_119595 ) ( CLEAR ?auto_119598 ) ( ON ?auto_119600 ?auto_119597 ) ( CLEAR ?auto_119600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119593 ?auto_119594 ?auto_119596 ?auto_119595 ?auto_119597 )
      ( MAKE-2PILE ?auto_119593 ?auto_119594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119601 - BLOCK
      ?auto_119602 - BLOCK
    )
    :vars
    (
      ?auto_119606 - BLOCK
      ?auto_119603 - BLOCK
      ?auto_119604 - BLOCK
      ?auto_119605 - BLOCK
      ?auto_119608 - BLOCK
      ?auto_119607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119606 ?auto_119602 ) ( ON-TABLE ?auto_119601 ) ( ON ?auto_119602 ?auto_119601 ) ( not ( = ?auto_119601 ?auto_119602 ) ) ( not ( = ?auto_119601 ?auto_119606 ) ) ( not ( = ?auto_119602 ?auto_119606 ) ) ( not ( = ?auto_119601 ?auto_119603 ) ) ( not ( = ?auto_119601 ?auto_119604 ) ) ( not ( = ?auto_119602 ?auto_119603 ) ) ( not ( = ?auto_119602 ?auto_119604 ) ) ( not ( = ?auto_119606 ?auto_119603 ) ) ( not ( = ?auto_119606 ?auto_119604 ) ) ( not ( = ?auto_119603 ?auto_119604 ) ) ( ON ?auto_119603 ?auto_119606 ) ( ON-TABLE ?auto_119605 ) ( not ( = ?auto_119605 ?auto_119608 ) ) ( not ( = ?auto_119605 ?auto_119607 ) ) ( not ( = ?auto_119605 ?auto_119604 ) ) ( not ( = ?auto_119608 ?auto_119607 ) ) ( not ( = ?auto_119608 ?auto_119604 ) ) ( not ( = ?auto_119607 ?auto_119604 ) ) ( not ( = ?auto_119601 ?auto_119607 ) ) ( not ( = ?auto_119601 ?auto_119605 ) ) ( not ( = ?auto_119601 ?auto_119608 ) ) ( not ( = ?auto_119602 ?auto_119607 ) ) ( not ( = ?auto_119602 ?auto_119605 ) ) ( not ( = ?auto_119602 ?auto_119608 ) ) ( not ( = ?auto_119606 ?auto_119607 ) ) ( not ( = ?auto_119606 ?auto_119605 ) ) ( not ( = ?auto_119606 ?auto_119608 ) ) ( not ( = ?auto_119603 ?auto_119607 ) ) ( not ( = ?auto_119603 ?auto_119605 ) ) ( not ( = ?auto_119603 ?auto_119608 ) ) ( ON ?auto_119604 ?auto_119603 ) ( ON ?auto_119607 ?auto_119604 ) ( CLEAR ?auto_119607 ) ( HOLDING ?auto_119608 ) ( CLEAR ?auto_119605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119605 ?auto_119608 )
      ( MAKE-2PILE ?auto_119601 ?auto_119602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119609 - BLOCK
      ?auto_119610 - BLOCK
    )
    :vars
    (
      ?auto_119611 - BLOCK
      ?auto_119615 - BLOCK
      ?auto_119614 - BLOCK
      ?auto_119612 - BLOCK
      ?auto_119613 - BLOCK
      ?auto_119616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119611 ?auto_119610 ) ( ON-TABLE ?auto_119609 ) ( ON ?auto_119610 ?auto_119609 ) ( not ( = ?auto_119609 ?auto_119610 ) ) ( not ( = ?auto_119609 ?auto_119611 ) ) ( not ( = ?auto_119610 ?auto_119611 ) ) ( not ( = ?auto_119609 ?auto_119615 ) ) ( not ( = ?auto_119609 ?auto_119614 ) ) ( not ( = ?auto_119610 ?auto_119615 ) ) ( not ( = ?auto_119610 ?auto_119614 ) ) ( not ( = ?auto_119611 ?auto_119615 ) ) ( not ( = ?auto_119611 ?auto_119614 ) ) ( not ( = ?auto_119615 ?auto_119614 ) ) ( ON ?auto_119615 ?auto_119611 ) ( ON-TABLE ?auto_119612 ) ( not ( = ?auto_119612 ?auto_119613 ) ) ( not ( = ?auto_119612 ?auto_119616 ) ) ( not ( = ?auto_119612 ?auto_119614 ) ) ( not ( = ?auto_119613 ?auto_119616 ) ) ( not ( = ?auto_119613 ?auto_119614 ) ) ( not ( = ?auto_119616 ?auto_119614 ) ) ( not ( = ?auto_119609 ?auto_119616 ) ) ( not ( = ?auto_119609 ?auto_119612 ) ) ( not ( = ?auto_119609 ?auto_119613 ) ) ( not ( = ?auto_119610 ?auto_119616 ) ) ( not ( = ?auto_119610 ?auto_119612 ) ) ( not ( = ?auto_119610 ?auto_119613 ) ) ( not ( = ?auto_119611 ?auto_119616 ) ) ( not ( = ?auto_119611 ?auto_119612 ) ) ( not ( = ?auto_119611 ?auto_119613 ) ) ( not ( = ?auto_119615 ?auto_119616 ) ) ( not ( = ?auto_119615 ?auto_119612 ) ) ( not ( = ?auto_119615 ?auto_119613 ) ) ( ON ?auto_119614 ?auto_119615 ) ( ON ?auto_119616 ?auto_119614 ) ( CLEAR ?auto_119612 ) ( ON ?auto_119613 ?auto_119616 ) ( CLEAR ?auto_119613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119609 ?auto_119610 ?auto_119611 ?auto_119615 ?auto_119614 ?auto_119616 )
      ( MAKE-2PILE ?auto_119609 ?auto_119610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119617 - BLOCK
      ?auto_119618 - BLOCK
    )
    :vars
    (
      ?auto_119621 - BLOCK
      ?auto_119624 - BLOCK
      ?auto_119622 - BLOCK
      ?auto_119619 - BLOCK
      ?auto_119623 - BLOCK
      ?auto_119620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119621 ?auto_119618 ) ( ON-TABLE ?auto_119617 ) ( ON ?auto_119618 ?auto_119617 ) ( not ( = ?auto_119617 ?auto_119618 ) ) ( not ( = ?auto_119617 ?auto_119621 ) ) ( not ( = ?auto_119618 ?auto_119621 ) ) ( not ( = ?auto_119617 ?auto_119624 ) ) ( not ( = ?auto_119617 ?auto_119622 ) ) ( not ( = ?auto_119618 ?auto_119624 ) ) ( not ( = ?auto_119618 ?auto_119622 ) ) ( not ( = ?auto_119621 ?auto_119624 ) ) ( not ( = ?auto_119621 ?auto_119622 ) ) ( not ( = ?auto_119624 ?auto_119622 ) ) ( ON ?auto_119624 ?auto_119621 ) ( not ( = ?auto_119619 ?auto_119623 ) ) ( not ( = ?auto_119619 ?auto_119620 ) ) ( not ( = ?auto_119619 ?auto_119622 ) ) ( not ( = ?auto_119623 ?auto_119620 ) ) ( not ( = ?auto_119623 ?auto_119622 ) ) ( not ( = ?auto_119620 ?auto_119622 ) ) ( not ( = ?auto_119617 ?auto_119620 ) ) ( not ( = ?auto_119617 ?auto_119619 ) ) ( not ( = ?auto_119617 ?auto_119623 ) ) ( not ( = ?auto_119618 ?auto_119620 ) ) ( not ( = ?auto_119618 ?auto_119619 ) ) ( not ( = ?auto_119618 ?auto_119623 ) ) ( not ( = ?auto_119621 ?auto_119620 ) ) ( not ( = ?auto_119621 ?auto_119619 ) ) ( not ( = ?auto_119621 ?auto_119623 ) ) ( not ( = ?auto_119624 ?auto_119620 ) ) ( not ( = ?auto_119624 ?auto_119619 ) ) ( not ( = ?auto_119624 ?auto_119623 ) ) ( ON ?auto_119622 ?auto_119624 ) ( ON ?auto_119620 ?auto_119622 ) ( ON ?auto_119623 ?auto_119620 ) ( CLEAR ?auto_119623 ) ( HOLDING ?auto_119619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119619 )
      ( MAKE-2PILE ?auto_119617 ?auto_119618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119635 - BLOCK
      ?auto_119636 - BLOCK
    )
    :vars
    (
      ?auto_119638 - BLOCK
      ?auto_119642 - BLOCK
      ?auto_119641 - BLOCK
      ?auto_119639 - BLOCK
      ?auto_119637 - BLOCK
      ?auto_119640 - BLOCK
      ?auto_119643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119638 ?auto_119636 ) ( ON-TABLE ?auto_119635 ) ( ON ?auto_119636 ?auto_119635 ) ( not ( = ?auto_119635 ?auto_119636 ) ) ( not ( = ?auto_119635 ?auto_119638 ) ) ( not ( = ?auto_119636 ?auto_119638 ) ) ( not ( = ?auto_119635 ?auto_119642 ) ) ( not ( = ?auto_119635 ?auto_119641 ) ) ( not ( = ?auto_119636 ?auto_119642 ) ) ( not ( = ?auto_119636 ?auto_119641 ) ) ( not ( = ?auto_119638 ?auto_119642 ) ) ( not ( = ?auto_119638 ?auto_119641 ) ) ( not ( = ?auto_119642 ?auto_119641 ) ) ( ON ?auto_119642 ?auto_119638 ) ( not ( = ?auto_119639 ?auto_119637 ) ) ( not ( = ?auto_119639 ?auto_119640 ) ) ( not ( = ?auto_119639 ?auto_119641 ) ) ( not ( = ?auto_119637 ?auto_119640 ) ) ( not ( = ?auto_119637 ?auto_119641 ) ) ( not ( = ?auto_119640 ?auto_119641 ) ) ( not ( = ?auto_119635 ?auto_119640 ) ) ( not ( = ?auto_119635 ?auto_119639 ) ) ( not ( = ?auto_119635 ?auto_119637 ) ) ( not ( = ?auto_119636 ?auto_119640 ) ) ( not ( = ?auto_119636 ?auto_119639 ) ) ( not ( = ?auto_119636 ?auto_119637 ) ) ( not ( = ?auto_119638 ?auto_119640 ) ) ( not ( = ?auto_119638 ?auto_119639 ) ) ( not ( = ?auto_119638 ?auto_119637 ) ) ( not ( = ?auto_119642 ?auto_119640 ) ) ( not ( = ?auto_119642 ?auto_119639 ) ) ( not ( = ?auto_119642 ?auto_119637 ) ) ( ON ?auto_119641 ?auto_119642 ) ( ON ?auto_119640 ?auto_119641 ) ( ON ?auto_119637 ?auto_119640 ) ( CLEAR ?auto_119637 ) ( ON ?auto_119639 ?auto_119643 ) ( CLEAR ?auto_119639 ) ( HAND-EMPTY ) ( not ( = ?auto_119635 ?auto_119643 ) ) ( not ( = ?auto_119636 ?auto_119643 ) ) ( not ( = ?auto_119638 ?auto_119643 ) ) ( not ( = ?auto_119642 ?auto_119643 ) ) ( not ( = ?auto_119641 ?auto_119643 ) ) ( not ( = ?auto_119639 ?auto_119643 ) ) ( not ( = ?auto_119637 ?auto_119643 ) ) ( not ( = ?auto_119640 ?auto_119643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119639 ?auto_119643 )
      ( MAKE-2PILE ?auto_119635 ?auto_119636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119644 - BLOCK
      ?auto_119645 - BLOCK
    )
    :vars
    (
      ?auto_119649 - BLOCK
      ?auto_119651 - BLOCK
      ?auto_119652 - BLOCK
      ?auto_119646 - BLOCK
      ?auto_119648 - BLOCK
      ?auto_119647 - BLOCK
      ?auto_119650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119649 ?auto_119645 ) ( ON-TABLE ?auto_119644 ) ( ON ?auto_119645 ?auto_119644 ) ( not ( = ?auto_119644 ?auto_119645 ) ) ( not ( = ?auto_119644 ?auto_119649 ) ) ( not ( = ?auto_119645 ?auto_119649 ) ) ( not ( = ?auto_119644 ?auto_119651 ) ) ( not ( = ?auto_119644 ?auto_119652 ) ) ( not ( = ?auto_119645 ?auto_119651 ) ) ( not ( = ?auto_119645 ?auto_119652 ) ) ( not ( = ?auto_119649 ?auto_119651 ) ) ( not ( = ?auto_119649 ?auto_119652 ) ) ( not ( = ?auto_119651 ?auto_119652 ) ) ( ON ?auto_119651 ?auto_119649 ) ( not ( = ?auto_119646 ?auto_119648 ) ) ( not ( = ?auto_119646 ?auto_119647 ) ) ( not ( = ?auto_119646 ?auto_119652 ) ) ( not ( = ?auto_119648 ?auto_119647 ) ) ( not ( = ?auto_119648 ?auto_119652 ) ) ( not ( = ?auto_119647 ?auto_119652 ) ) ( not ( = ?auto_119644 ?auto_119647 ) ) ( not ( = ?auto_119644 ?auto_119646 ) ) ( not ( = ?auto_119644 ?auto_119648 ) ) ( not ( = ?auto_119645 ?auto_119647 ) ) ( not ( = ?auto_119645 ?auto_119646 ) ) ( not ( = ?auto_119645 ?auto_119648 ) ) ( not ( = ?auto_119649 ?auto_119647 ) ) ( not ( = ?auto_119649 ?auto_119646 ) ) ( not ( = ?auto_119649 ?auto_119648 ) ) ( not ( = ?auto_119651 ?auto_119647 ) ) ( not ( = ?auto_119651 ?auto_119646 ) ) ( not ( = ?auto_119651 ?auto_119648 ) ) ( ON ?auto_119652 ?auto_119651 ) ( ON ?auto_119647 ?auto_119652 ) ( ON ?auto_119646 ?auto_119650 ) ( CLEAR ?auto_119646 ) ( not ( = ?auto_119644 ?auto_119650 ) ) ( not ( = ?auto_119645 ?auto_119650 ) ) ( not ( = ?auto_119649 ?auto_119650 ) ) ( not ( = ?auto_119651 ?auto_119650 ) ) ( not ( = ?auto_119652 ?auto_119650 ) ) ( not ( = ?auto_119646 ?auto_119650 ) ) ( not ( = ?auto_119648 ?auto_119650 ) ) ( not ( = ?auto_119647 ?auto_119650 ) ) ( HOLDING ?auto_119648 ) ( CLEAR ?auto_119647 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119644 ?auto_119645 ?auto_119649 ?auto_119651 ?auto_119652 ?auto_119647 ?auto_119648 )
      ( MAKE-2PILE ?auto_119644 ?auto_119645 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119653 - BLOCK
      ?auto_119654 - BLOCK
    )
    :vars
    (
      ?auto_119658 - BLOCK
      ?auto_119659 - BLOCK
      ?auto_119661 - BLOCK
      ?auto_119655 - BLOCK
      ?auto_119656 - BLOCK
      ?auto_119660 - BLOCK
      ?auto_119657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119658 ?auto_119654 ) ( ON-TABLE ?auto_119653 ) ( ON ?auto_119654 ?auto_119653 ) ( not ( = ?auto_119653 ?auto_119654 ) ) ( not ( = ?auto_119653 ?auto_119658 ) ) ( not ( = ?auto_119654 ?auto_119658 ) ) ( not ( = ?auto_119653 ?auto_119659 ) ) ( not ( = ?auto_119653 ?auto_119661 ) ) ( not ( = ?auto_119654 ?auto_119659 ) ) ( not ( = ?auto_119654 ?auto_119661 ) ) ( not ( = ?auto_119658 ?auto_119659 ) ) ( not ( = ?auto_119658 ?auto_119661 ) ) ( not ( = ?auto_119659 ?auto_119661 ) ) ( ON ?auto_119659 ?auto_119658 ) ( not ( = ?auto_119655 ?auto_119656 ) ) ( not ( = ?auto_119655 ?auto_119660 ) ) ( not ( = ?auto_119655 ?auto_119661 ) ) ( not ( = ?auto_119656 ?auto_119660 ) ) ( not ( = ?auto_119656 ?auto_119661 ) ) ( not ( = ?auto_119660 ?auto_119661 ) ) ( not ( = ?auto_119653 ?auto_119660 ) ) ( not ( = ?auto_119653 ?auto_119655 ) ) ( not ( = ?auto_119653 ?auto_119656 ) ) ( not ( = ?auto_119654 ?auto_119660 ) ) ( not ( = ?auto_119654 ?auto_119655 ) ) ( not ( = ?auto_119654 ?auto_119656 ) ) ( not ( = ?auto_119658 ?auto_119660 ) ) ( not ( = ?auto_119658 ?auto_119655 ) ) ( not ( = ?auto_119658 ?auto_119656 ) ) ( not ( = ?auto_119659 ?auto_119660 ) ) ( not ( = ?auto_119659 ?auto_119655 ) ) ( not ( = ?auto_119659 ?auto_119656 ) ) ( ON ?auto_119661 ?auto_119659 ) ( ON ?auto_119660 ?auto_119661 ) ( ON ?auto_119655 ?auto_119657 ) ( not ( = ?auto_119653 ?auto_119657 ) ) ( not ( = ?auto_119654 ?auto_119657 ) ) ( not ( = ?auto_119658 ?auto_119657 ) ) ( not ( = ?auto_119659 ?auto_119657 ) ) ( not ( = ?auto_119661 ?auto_119657 ) ) ( not ( = ?auto_119655 ?auto_119657 ) ) ( not ( = ?auto_119656 ?auto_119657 ) ) ( not ( = ?auto_119660 ?auto_119657 ) ) ( CLEAR ?auto_119660 ) ( ON ?auto_119656 ?auto_119655 ) ( CLEAR ?auto_119656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119657 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119657 ?auto_119655 )
      ( MAKE-2PILE ?auto_119653 ?auto_119654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119662 - BLOCK
      ?auto_119663 - BLOCK
    )
    :vars
    (
      ?auto_119667 - BLOCK
      ?auto_119670 - BLOCK
      ?auto_119668 - BLOCK
      ?auto_119666 - BLOCK
      ?auto_119665 - BLOCK
      ?auto_119664 - BLOCK
      ?auto_119669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119667 ?auto_119663 ) ( ON-TABLE ?auto_119662 ) ( ON ?auto_119663 ?auto_119662 ) ( not ( = ?auto_119662 ?auto_119663 ) ) ( not ( = ?auto_119662 ?auto_119667 ) ) ( not ( = ?auto_119663 ?auto_119667 ) ) ( not ( = ?auto_119662 ?auto_119670 ) ) ( not ( = ?auto_119662 ?auto_119668 ) ) ( not ( = ?auto_119663 ?auto_119670 ) ) ( not ( = ?auto_119663 ?auto_119668 ) ) ( not ( = ?auto_119667 ?auto_119670 ) ) ( not ( = ?auto_119667 ?auto_119668 ) ) ( not ( = ?auto_119670 ?auto_119668 ) ) ( ON ?auto_119670 ?auto_119667 ) ( not ( = ?auto_119666 ?auto_119665 ) ) ( not ( = ?auto_119666 ?auto_119664 ) ) ( not ( = ?auto_119666 ?auto_119668 ) ) ( not ( = ?auto_119665 ?auto_119664 ) ) ( not ( = ?auto_119665 ?auto_119668 ) ) ( not ( = ?auto_119664 ?auto_119668 ) ) ( not ( = ?auto_119662 ?auto_119664 ) ) ( not ( = ?auto_119662 ?auto_119666 ) ) ( not ( = ?auto_119662 ?auto_119665 ) ) ( not ( = ?auto_119663 ?auto_119664 ) ) ( not ( = ?auto_119663 ?auto_119666 ) ) ( not ( = ?auto_119663 ?auto_119665 ) ) ( not ( = ?auto_119667 ?auto_119664 ) ) ( not ( = ?auto_119667 ?auto_119666 ) ) ( not ( = ?auto_119667 ?auto_119665 ) ) ( not ( = ?auto_119670 ?auto_119664 ) ) ( not ( = ?auto_119670 ?auto_119666 ) ) ( not ( = ?auto_119670 ?auto_119665 ) ) ( ON ?auto_119668 ?auto_119670 ) ( ON ?auto_119666 ?auto_119669 ) ( not ( = ?auto_119662 ?auto_119669 ) ) ( not ( = ?auto_119663 ?auto_119669 ) ) ( not ( = ?auto_119667 ?auto_119669 ) ) ( not ( = ?auto_119670 ?auto_119669 ) ) ( not ( = ?auto_119668 ?auto_119669 ) ) ( not ( = ?auto_119666 ?auto_119669 ) ) ( not ( = ?auto_119665 ?auto_119669 ) ) ( not ( = ?auto_119664 ?auto_119669 ) ) ( ON ?auto_119665 ?auto_119666 ) ( CLEAR ?auto_119665 ) ( ON-TABLE ?auto_119669 ) ( HOLDING ?auto_119664 ) ( CLEAR ?auto_119668 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119662 ?auto_119663 ?auto_119667 ?auto_119670 ?auto_119668 ?auto_119664 )
      ( MAKE-2PILE ?auto_119662 ?auto_119663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119671 - BLOCK
      ?auto_119672 - BLOCK
    )
    :vars
    (
      ?auto_119676 - BLOCK
      ?auto_119673 - BLOCK
      ?auto_119678 - BLOCK
      ?auto_119679 - BLOCK
      ?auto_119674 - BLOCK
      ?auto_119677 - BLOCK
      ?auto_119675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119676 ?auto_119672 ) ( ON-TABLE ?auto_119671 ) ( ON ?auto_119672 ?auto_119671 ) ( not ( = ?auto_119671 ?auto_119672 ) ) ( not ( = ?auto_119671 ?auto_119676 ) ) ( not ( = ?auto_119672 ?auto_119676 ) ) ( not ( = ?auto_119671 ?auto_119673 ) ) ( not ( = ?auto_119671 ?auto_119678 ) ) ( not ( = ?auto_119672 ?auto_119673 ) ) ( not ( = ?auto_119672 ?auto_119678 ) ) ( not ( = ?auto_119676 ?auto_119673 ) ) ( not ( = ?auto_119676 ?auto_119678 ) ) ( not ( = ?auto_119673 ?auto_119678 ) ) ( ON ?auto_119673 ?auto_119676 ) ( not ( = ?auto_119679 ?auto_119674 ) ) ( not ( = ?auto_119679 ?auto_119677 ) ) ( not ( = ?auto_119679 ?auto_119678 ) ) ( not ( = ?auto_119674 ?auto_119677 ) ) ( not ( = ?auto_119674 ?auto_119678 ) ) ( not ( = ?auto_119677 ?auto_119678 ) ) ( not ( = ?auto_119671 ?auto_119677 ) ) ( not ( = ?auto_119671 ?auto_119679 ) ) ( not ( = ?auto_119671 ?auto_119674 ) ) ( not ( = ?auto_119672 ?auto_119677 ) ) ( not ( = ?auto_119672 ?auto_119679 ) ) ( not ( = ?auto_119672 ?auto_119674 ) ) ( not ( = ?auto_119676 ?auto_119677 ) ) ( not ( = ?auto_119676 ?auto_119679 ) ) ( not ( = ?auto_119676 ?auto_119674 ) ) ( not ( = ?auto_119673 ?auto_119677 ) ) ( not ( = ?auto_119673 ?auto_119679 ) ) ( not ( = ?auto_119673 ?auto_119674 ) ) ( ON ?auto_119678 ?auto_119673 ) ( ON ?auto_119679 ?auto_119675 ) ( not ( = ?auto_119671 ?auto_119675 ) ) ( not ( = ?auto_119672 ?auto_119675 ) ) ( not ( = ?auto_119676 ?auto_119675 ) ) ( not ( = ?auto_119673 ?auto_119675 ) ) ( not ( = ?auto_119678 ?auto_119675 ) ) ( not ( = ?auto_119679 ?auto_119675 ) ) ( not ( = ?auto_119674 ?auto_119675 ) ) ( not ( = ?auto_119677 ?auto_119675 ) ) ( ON ?auto_119674 ?auto_119679 ) ( ON-TABLE ?auto_119675 ) ( CLEAR ?auto_119678 ) ( ON ?auto_119677 ?auto_119674 ) ( CLEAR ?auto_119677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119675 ?auto_119679 ?auto_119674 )
      ( MAKE-2PILE ?auto_119671 ?auto_119672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119729 - BLOCK
      ?auto_119730 - BLOCK
      ?auto_119731 - BLOCK
      ?auto_119732 - BLOCK
      ?auto_119733 - BLOCK
      ?auto_119734 - BLOCK
    )
    :vars
    (
      ?auto_119735 - BLOCK
      ?auto_119736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119729 ) ( ON ?auto_119730 ?auto_119729 ) ( ON ?auto_119731 ?auto_119730 ) ( ON ?auto_119732 ?auto_119731 ) ( not ( = ?auto_119729 ?auto_119730 ) ) ( not ( = ?auto_119729 ?auto_119731 ) ) ( not ( = ?auto_119729 ?auto_119732 ) ) ( not ( = ?auto_119729 ?auto_119733 ) ) ( not ( = ?auto_119729 ?auto_119734 ) ) ( not ( = ?auto_119730 ?auto_119731 ) ) ( not ( = ?auto_119730 ?auto_119732 ) ) ( not ( = ?auto_119730 ?auto_119733 ) ) ( not ( = ?auto_119730 ?auto_119734 ) ) ( not ( = ?auto_119731 ?auto_119732 ) ) ( not ( = ?auto_119731 ?auto_119733 ) ) ( not ( = ?auto_119731 ?auto_119734 ) ) ( not ( = ?auto_119732 ?auto_119733 ) ) ( not ( = ?auto_119732 ?auto_119734 ) ) ( not ( = ?auto_119733 ?auto_119734 ) ) ( ON ?auto_119734 ?auto_119735 ) ( not ( = ?auto_119729 ?auto_119735 ) ) ( not ( = ?auto_119730 ?auto_119735 ) ) ( not ( = ?auto_119731 ?auto_119735 ) ) ( not ( = ?auto_119732 ?auto_119735 ) ) ( not ( = ?auto_119733 ?auto_119735 ) ) ( not ( = ?auto_119734 ?auto_119735 ) ) ( CLEAR ?auto_119732 ) ( ON ?auto_119733 ?auto_119734 ) ( CLEAR ?auto_119733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119736 ) ( ON ?auto_119735 ?auto_119736 ) ( not ( = ?auto_119736 ?auto_119735 ) ) ( not ( = ?auto_119736 ?auto_119734 ) ) ( not ( = ?auto_119736 ?auto_119733 ) ) ( not ( = ?auto_119729 ?auto_119736 ) ) ( not ( = ?auto_119730 ?auto_119736 ) ) ( not ( = ?auto_119731 ?auto_119736 ) ) ( not ( = ?auto_119732 ?auto_119736 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119736 ?auto_119735 ?auto_119734 )
      ( MAKE-6PILE ?auto_119729 ?auto_119730 ?auto_119731 ?auto_119732 ?auto_119733 ?auto_119734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119737 - BLOCK
      ?auto_119738 - BLOCK
      ?auto_119739 - BLOCK
      ?auto_119740 - BLOCK
      ?auto_119741 - BLOCK
      ?auto_119742 - BLOCK
    )
    :vars
    (
      ?auto_119743 - BLOCK
      ?auto_119744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119737 ) ( ON ?auto_119738 ?auto_119737 ) ( ON ?auto_119739 ?auto_119738 ) ( not ( = ?auto_119737 ?auto_119738 ) ) ( not ( = ?auto_119737 ?auto_119739 ) ) ( not ( = ?auto_119737 ?auto_119740 ) ) ( not ( = ?auto_119737 ?auto_119741 ) ) ( not ( = ?auto_119737 ?auto_119742 ) ) ( not ( = ?auto_119738 ?auto_119739 ) ) ( not ( = ?auto_119738 ?auto_119740 ) ) ( not ( = ?auto_119738 ?auto_119741 ) ) ( not ( = ?auto_119738 ?auto_119742 ) ) ( not ( = ?auto_119739 ?auto_119740 ) ) ( not ( = ?auto_119739 ?auto_119741 ) ) ( not ( = ?auto_119739 ?auto_119742 ) ) ( not ( = ?auto_119740 ?auto_119741 ) ) ( not ( = ?auto_119740 ?auto_119742 ) ) ( not ( = ?auto_119741 ?auto_119742 ) ) ( ON ?auto_119742 ?auto_119743 ) ( not ( = ?auto_119737 ?auto_119743 ) ) ( not ( = ?auto_119738 ?auto_119743 ) ) ( not ( = ?auto_119739 ?auto_119743 ) ) ( not ( = ?auto_119740 ?auto_119743 ) ) ( not ( = ?auto_119741 ?auto_119743 ) ) ( not ( = ?auto_119742 ?auto_119743 ) ) ( ON ?auto_119741 ?auto_119742 ) ( CLEAR ?auto_119741 ) ( ON-TABLE ?auto_119744 ) ( ON ?auto_119743 ?auto_119744 ) ( not ( = ?auto_119744 ?auto_119743 ) ) ( not ( = ?auto_119744 ?auto_119742 ) ) ( not ( = ?auto_119744 ?auto_119741 ) ) ( not ( = ?auto_119737 ?auto_119744 ) ) ( not ( = ?auto_119738 ?auto_119744 ) ) ( not ( = ?auto_119739 ?auto_119744 ) ) ( not ( = ?auto_119740 ?auto_119744 ) ) ( HOLDING ?auto_119740 ) ( CLEAR ?auto_119739 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119737 ?auto_119738 ?auto_119739 ?auto_119740 )
      ( MAKE-6PILE ?auto_119737 ?auto_119738 ?auto_119739 ?auto_119740 ?auto_119741 ?auto_119742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119745 - BLOCK
      ?auto_119746 - BLOCK
      ?auto_119747 - BLOCK
      ?auto_119748 - BLOCK
      ?auto_119749 - BLOCK
      ?auto_119750 - BLOCK
    )
    :vars
    (
      ?auto_119751 - BLOCK
      ?auto_119752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119745 ) ( ON ?auto_119746 ?auto_119745 ) ( ON ?auto_119747 ?auto_119746 ) ( not ( = ?auto_119745 ?auto_119746 ) ) ( not ( = ?auto_119745 ?auto_119747 ) ) ( not ( = ?auto_119745 ?auto_119748 ) ) ( not ( = ?auto_119745 ?auto_119749 ) ) ( not ( = ?auto_119745 ?auto_119750 ) ) ( not ( = ?auto_119746 ?auto_119747 ) ) ( not ( = ?auto_119746 ?auto_119748 ) ) ( not ( = ?auto_119746 ?auto_119749 ) ) ( not ( = ?auto_119746 ?auto_119750 ) ) ( not ( = ?auto_119747 ?auto_119748 ) ) ( not ( = ?auto_119747 ?auto_119749 ) ) ( not ( = ?auto_119747 ?auto_119750 ) ) ( not ( = ?auto_119748 ?auto_119749 ) ) ( not ( = ?auto_119748 ?auto_119750 ) ) ( not ( = ?auto_119749 ?auto_119750 ) ) ( ON ?auto_119750 ?auto_119751 ) ( not ( = ?auto_119745 ?auto_119751 ) ) ( not ( = ?auto_119746 ?auto_119751 ) ) ( not ( = ?auto_119747 ?auto_119751 ) ) ( not ( = ?auto_119748 ?auto_119751 ) ) ( not ( = ?auto_119749 ?auto_119751 ) ) ( not ( = ?auto_119750 ?auto_119751 ) ) ( ON ?auto_119749 ?auto_119750 ) ( ON-TABLE ?auto_119752 ) ( ON ?auto_119751 ?auto_119752 ) ( not ( = ?auto_119752 ?auto_119751 ) ) ( not ( = ?auto_119752 ?auto_119750 ) ) ( not ( = ?auto_119752 ?auto_119749 ) ) ( not ( = ?auto_119745 ?auto_119752 ) ) ( not ( = ?auto_119746 ?auto_119752 ) ) ( not ( = ?auto_119747 ?auto_119752 ) ) ( not ( = ?auto_119748 ?auto_119752 ) ) ( CLEAR ?auto_119747 ) ( ON ?auto_119748 ?auto_119749 ) ( CLEAR ?auto_119748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119752 ?auto_119751 ?auto_119750 ?auto_119749 )
      ( MAKE-6PILE ?auto_119745 ?auto_119746 ?auto_119747 ?auto_119748 ?auto_119749 ?auto_119750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119753 - BLOCK
      ?auto_119754 - BLOCK
      ?auto_119755 - BLOCK
      ?auto_119756 - BLOCK
      ?auto_119757 - BLOCK
      ?auto_119758 - BLOCK
    )
    :vars
    (
      ?auto_119760 - BLOCK
      ?auto_119759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119753 ) ( ON ?auto_119754 ?auto_119753 ) ( not ( = ?auto_119753 ?auto_119754 ) ) ( not ( = ?auto_119753 ?auto_119755 ) ) ( not ( = ?auto_119753 ?auto_119756 ) ) ( not ( = ?auto_119753 ?auto_119757 ) ) ( not ( = ?auto_119753 ?auto_119758 ) ) ( not ( = ?auto_119754 ?auto_119755 ) ) ( not ( = ?auto_119754 ?auto_119756 ) ) ( not ( = ?auto_119754 ?auto_119757 ) ) ( not ( = ?auto_119754 ?auto_119758 ) ) ( not ( = ?auto_119755 ?auto_119756 ) ) ( not ( = ?auto_119755 ?auto_119757 ) ) ( not ( = ?auto_119755 ?auto_119758 ) ) ( not ( = ?auto_119756 ?auto_119757 ) ) ( not ( = ?auto_119756 ?auto_119758 ) ) ( not ( = ?auto_119757 ?auto_119758 ) ) ( ON ?auto_119758 ?auto_119760 ) ( not ( = ?auto_119753 ?auto_119760 ) ) ( not ( = ?auto_119754 ?auto_119760 ) ) ( not ( = ?auto_119755 ?auto_119760 ) ) ( not ( = ?auto_119756 ?auto_119760 ) ) ( not ( = ?auto_119757 ?auto_119760 ) ) ( not ( = ?auto_119758 ?auto_119760 ) ) ( ON ?auto_119757 ?auto_119758 ) ( ON-TABLE ?auto_119759 ) ( ON ?auto_119760 ?auto_119759 ) ( not ( = ?auto_119759 ?auto_119760 ) ) ( not ( = ?auto_119759 ?auto_119758 ) ) ( not ( = ?auto_119759 ?auto_119757 ) ) ( not ( = ?auto_119753 ?auto_119759 ) ) ( not ( = ?auto_119754 ?auto_119759 ) ) ( not ( = ?auto_119755 ?auto_119759 ) ) ( not ( = ?auto_119756 ?auto_119759 ) ) ( ON ?auto_119756 ?auto_119757 ) ( CLEAR ?auto_119756 ) ( HOLDING ?auto_119755 ) ( CLEAR ?auto_119754 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119753 ?auto_119754 ?auto_119755 )
      ( MAKE-6PILE ?auto_119753 ?auto_119754 ?auto_119755 ?auto_119756 ?auto_119757 ?auto_119758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119761 - BLOCK
      ?auto_119762 - BLOCK
      ?auto_119763 - BLOCK
      ?auto_119764 - BLOCK
      ?auto_119765 - BLOCK
      ?auto_119766 - BLOCK
    )
    :vars
    (
      ?auto_119768 - BLOCK
      ?auto_119767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119761 ) ( ON ?auto_119762 ?auto_119761 ) ( not ( = ?auto_119761 ?auto_119762 ) ) ( not ( = ?auto_119761 ?auto_119763 ) ) ( not ( = ?auto_119761 ?auto_119764 ) ) ( not ( = ?auto_119761 ?auto_119765 ) ) ( not ( = ?auto_119761 ?auto_119766 ) ) ( not ( = ?auto_119762 ?auto_119763 ) ) ( not ( = ?auto_119762 ?auto_119764 ) ) ( not ( = ?auto_119762 ?auto_119765 ) ) ( not ( = ?auto_119762 ?auto_119766 ) ) ( not ( = ?auto_119763 ?auto_119764 ) ) ( not ( = ?auto_119763 ?auto_119765 ) ) ( not ( = ?auto_119763 ?auto_119766 ) ) ( not ( = ?auto_119764 ?auto_119765 ) ) ( not ( = ?auto_119764 ?auto_119766 ) ) ( not ( = ?auto_119765 ?auto_119766 ) ) ( ON ?auto_119766 ?auto_119768 ) ( not ( = ?auto_119761 ?auto_119768 ) ) ( not ( = ?auto_119762 ?auto_119768 ) ) ( not ( = ?auto_119763 ?auto_119768 ) ) ( not ( = ?auto_119764 ?auto_119768 ) ) ( not ( = ?auto_119765 ?auto_119768 ) ) ( not ( = ?auto_119766 ?auto_119768 ) ) ( ON ?auto_119765 ?auto_119766 ) ( ON-TABLE ?auto_119767 ) ( ON ?auto_119768 ?auto_119767 ) ( not ( = ?auto_119767 ?auto_119768 ) ) ( not ( = ?auto_119767 ?auto_119766 ) ) ( not ( = ?auto_119767 ?auto_119765 ) ) ( not ( = ?auto_119761 ?auto_119767 ) ) ( not ( = ?auto_119762 ?auto_119767 ) ) ( not ( = ?auto_119763 ?auto_119767 ) ) ( not ( = ?auto_119764 ?auto_119767 ) ) ( ON ?auto_119764 ?auto_119765 ) ( CLEAR ?auto_119762 ) ( ON ?auto_119763 ?auto_119764 ) ( CLEAR ?auto_119763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119767 ?auto_119768 ?auto_119766 ?auto_119765 ?auto_119764 )
      ( MAKE-6PILE ?auto_119761 ?auto_119762 ?auto_119763 ?auto_119764 ?auto_119765 ?auto_119766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119769 - BLOCK
      ?auto_119770 - BLOCK
      ?auto_119771 - BLOCK
      ?auto_119772 - BLOCK
      ?auto_119773 - BLOCK
      ?auto_119774 - BLOCK
    )
    :vars
    (
      ?auto_119775 - BLOCK
      ?auto_119776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119769 ) ( not ( = ?auto_119769 ?auto_119770 ) ) ( not ( = ?auto_119769 ?auto_119771 ) ) ( not ( = ?auto_119769 ?auto_119772 ) ) ( not ( = ?auto_119769 ?auto_119773 ) ) ( not ( = ?auto_119769 ?auto_119774 ) ) ( not ( = ?auto_119770 ?auto_119771 ) ) ( not ( = ?auto_119770 ?auto_119772 ) ) ( not ( = ?auto_119770 ?auto_119773 ) ) ( not ( = ?auto_119770 ?auto_119774 ) ) ( not ( = ?auto_119771 ?auto_119772 ) ) ( not ( = ?auto_119771 ?auto_119773 ) ) ( not ( = ?auto_119771 ?auto_119774 ) ) ( not ( = ?auto_119772 ?auto_119773 ) ) ( not ( = ?auto_119772 ?auto_119774 ) ) ( not ( = ?auto_119773 ?auto_119774 ) ) ( ON ?auto_119774 ?auto_119775 ) ( not ( = ?auto_119769 ?auto_119775 ) ) ( not ( = ?auto_119770 ?auto_119775 ) ) ( not ( = ?auto_119771 ?auto_119775 ) ) ( not ( = ?auto_119772 ?auto_119775 ) ) ( not ( = ?auto_119773 ?auto_119775 ) ) ( not ( = ?auto_119774 ?auto_119775 ) ) ( ON ?auto_119773 ?auto_119774 ) ( ON-TABLE ?auto_119776 ) ( ON ?auto_119775 ?auto_119776 ) ( not ( = ?auto_119776 ?auto_119775 ) ) ( not ( = ?auto_119776 ?auto_119774 ) ) ( not ( = ?auto_119776 ?auto_119773 ) ) ( not ( = ?auto_119769 ?auto_119776 ) ) ( not ( = ?auto_119770 ?auto_119776 ) ) ( not ( = ?auto_119771 ?auto_119776 ) ) ( not ( = ?auto_119772 ?auto_119776 ) ) ( ON ?auto_119772 ?auto_119773 ) ( ON ?auto_119771 ?auto_119772 ) ( CLEAR ?auto_119771 ) ( HOLDING ?auto_119770 ) ( CLEAR ?auto_119769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119769 ?auto_119770 )
      ( MAKE-6PILE ?auto_119769 ?auto_119770 ?auto_119771 ?auto_119772 ?auto_119773 ?auto_119774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119777 - BLOCK
      ?auto_119778 - BLOCK
      ?auto_119779 - BLOCK
      ?auto_119780 - BLOCK
      ?auto_119781 - BLOCK
      ?auto_119782 - BLOCK
    )
    :vars
    (
      ?auto_119783 - BLOCK
      ?auto_119784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119777 ) ( not ( = ?auto_119777 ?auto_119778 ) ) ( not ( = ?auto_119777 ?auto_119779 ) ) ( not ( = ?auto_119777 ?auto_119780 ) ) ( not ( = ?auto_119777 ?auto_119781 ) ) ( not ( = ?auto_119777 ?auto_119782 ) ) ( not ( = ?auto_119778 ?auto_119779 ) ) ( not ( = ?auto_119778 ?auto_119780 ) ) ( not ( = ?auto_119778 ?auto_119781 ) ) ( not ( = ?auto_119778 ?auto_119782 ) ) ( not ( = ?auto_119779 ?auto_119780 ) ) ( not ( = ?auto_119779 ?auto_119781 ) ) ( not ( = ?auto_119779 ?auto_119782 ) ) ( not ( = ?auto_119780 ?auto_119781 ) ) ( not ( = ?auto_119780 ?auto_119782 ) ) ( not ( = ?auto_119781 ?auto_119782 ) ) ( ON ?auto_119782 ?auto_119783 ) ( not ( = ?auto_119777 ?auto_119783 ) ) ( not ( = ?auto_119778 ?auto_119783 ) ) ( not ( = ?auto_119779 ?auto_119783 ) ) ( not ( = ?auto_119780 ?auto_119783 ) ) ( not ( = ?auto_119781 ?auto_119783 ) ) ( not ( = ?auto_119782 ?auto_119783 ) ) ( ON ?auto_119781 ?auto_119782 ) ( ON-TABLE ?auto_119784 ) ( ON ?auto_119783 ?auto_119784 ) ( not ( = ?auto_119784 ?auto_119783 ) ) ( not ( = ?auto_119784 ?auto_119782 ) ) ( not ( = ?auto_119784 ?auto_119781 ) ) ( not ( = ?auto_119777 ?auto_119784 ) ) ( not ( = ?auto_119778 ?auto_119784 ) ) ( not ( = ?auto_119779 ?auto_119784 ) ) ( not ( = ?auto_119780 ?auto_119784 ) ) ( ON ?auto_119780 ?auto_119781 ) ( ON ?auto_119779 ?auto_119780 ) ( CLEAR ?auto_119777 ) ( ON ?auto_119778 ?auto_119779 ) ( CLEAR ?auto_119778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119784 ?auto_119783 ?auto_119782 ?auto_119781 ?auto_119780 ?auto_119779 )
      ( MAKE-6PILE ?auto_119777 ?auto_119778 ?auto_119779 ?auto_119780 ?auto_119781 ?auto_119782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119785 - BLOCK
      ?auto_119786 - BLOCK
      ?auto_119787 - BLOCK
      ?auto_119788 - BLOCK
      ?auto_119789 - BLOCK
      ?auto_119790 - BLOCK
    )
    :vars
    (
      ?auto_119791 - BLOCK
      ?auto_119792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119785 ?auto_119786 ) ) ( not ( = ?auto_119785 ?auto_119787 ) ) ( not ( = ?auto_119785 ?auto_119788 ) ) ( not ( = ?auto_119785 ?auto_119789 ) ) ( not ( = ?auto_119785 ?auto_119790 ) ) ( not ( = ?auto_119786 ?auto_119787 ) ) ( not ( = ?auto_119786 ?auto_119788 ) ) ( not ( = ?auto_119786 ?auto_119789 ) ) ( not ( = ?auto_119786 ?auto_119790 ) ) ( not ( = ?auto_119787 ?auto_119788 ) ) ( not ( = ?auto_119787 ?auto_119789 ) ) ( not ( = ?auto_119787 ?auto_119790 ) ) ( not ( = ?auto_119788 ?auto_119789 ) ) ( not ( = ?auto_119788 ?auto_119790 ) ) ( not ( = ?auto_119789 ?auto_119790 ) ) ( ON ?auto_119790 ?auto_119791 ) ( not ( = ?auto_119785 ?auto_119791 ) ) ( not ( = ?auto_119786 ?auto_119791 ) ) ( not ( = ?auto_119787 ?auto_119791 ) ) ( not ( = ?auto_119788 ?auto_119791 ) ) ( not ( = ?auto_119789 ?auto_119791 ) ) ( not ( = ?auto_119790 ?auto_119791 ) ) ( ON ?auto_119789 ?auto_119790 ) ( ON-TABLE ?auto_119792 ) ( ON ?auto_119791 ?auto_119792 ) ( not ( = ?auto_119792 ?auto_119791 ) ) ( not ( = ?auto_119792 ?auto_119790 ) ) ( not ( = ?auto_119792 ?auto_119789 ) ) ( not ( = ?auto_119785 ?auto_119792 ) ) ( not ( = ?auto_119786 ?auto_119792 ) ) ( not ( = ?auto_119787 ?auto_119792 ) ) ( not ( = ?auto_119788 ?auto_119792 ) ) ( ON ?auto_119788 ?auto_119789 ) ( ON ?auto_119787 ?auto_119788 ) ( ON ?auto_119786 ?auto_119787 ) ( CLEAR ?auto_119786 ) ( HOLDING ?auto_119785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119785 )
      ( MAKE-6PILE ?auto_119785 ?auto_119786 ?auto_119787 ?auto_119788 ?auto_119789 ?auto_119790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119793 - BLOCK
      ?auto_119794 - BLOCK
      ?auto_119795 - BLOCK
      ?auto_119796 - BLOCK
      ?auto_119797 - BLOCK
      ?auto_119798 - BLOCK
    )
    :vars
    (
      ?auto_119799 - BLOCK
      ?auto_119800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119793 ?auto_119794 ) ) ( not ( = ?auto_119793 ?auto_119795 ) ) ( not ( = ?auto_119793 ?auto_119796 ) ) ( not ( = ?auto_119793 ?auto_119797 ) ) ( not ( = ?auto_119793 ?auto_119798 ) ) ( not ( = ?auto_119794 ?auto_119795 ) ) ( not ( = ?auto_119794 ?auto_119796 ) ) ( not ( = ?auto_119794 ?auto_119797 ) ) ( not ( = ?auto_119794 ?auto_119798 ) ) ( not ( = ?auto_119795 ?auto_119796 ) ) ( not ( = ?auto_119795 ?auto_119797 ) ) ( not ( = ?auto_119795 ?auto_119798 ) ) ( not ( = ?auto_119796 ?auto_119797 ) ) ( not ( = ?auto_119796 ?auto_119798 ) ) ( not ( = ?auto_119797 ?auto_119798 ) ) ( ON ?auto_119798 ?auto_119799 ) ( not ( = ?auto_119793 ?auto_119799 ) ) ( not ( = ?auto_119794 ?auto_119799 ) ) ( not ( = ?auto_119795 ?auto_119799 ) ) ( not ( = ?auto_119796 ?auto_119799 ) ) ( not ( = ?auto_119797 ?auto_119799 ) ) ( not ( = ?auto_119798 ?auto_119799 ) ) ( ON ?auto_119797 ?auto_119798 ) ( ON-TABLE ?auto_119800 ) ( ON ?auto_119799 ?auto_119800 ) ( not ( = ?auto_119800 ?auto_119799 ) ) ( not ( = ?auto_119800 ?auto_119798 ) ) ( not ( = ?auto_119800 ?auto_119797 ) ) ( not ( = ?auto_119793 ?auto_119800 ) ) ( not ( = ?auto_119794 ?auto_119800 ) ) ( not ( = ?auto_119795 ?auto_119800 ) ) ( not ( = ?auto_119796 ?auto_119800 ) ) ( ON ?auto_119796 ?auto_119797 ) ( ON ?auto_119795 ?auto_119796 ) ( ON ?auto_119794 ?auto_119795 ) ( ON ?auto_119793 ?auto_119794 ) ( CLEAR ?auto_119793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119800 ?auto_119799 ?auto_119798 ?auto_119797 ?auto_119796 ?auto_119795 ?auto_119794 )
      ( MAKE-6PILE ?auto_119793 ?auto_119794 ?auto_119795 ?auto_119796 ?auto_119797 ?auto_119798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119807 - BLOCK
      ?auto_119808 - BLOCK
      ?auto_119809 - BLOCK
      ?auto_119810 - BLOCK
      ?auto_119811 - BLOCK
      ?auto_119812 - BLOCK
    )
    :vars
    (
      ?auto_119813 - BLOCK
      ?auto_119814 - BLOCK
      ?auto_119815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119807 ?auto_119808 ) ) ( not ( = ?auto_119807 ?auto_119809 ) ) ( not ( = ?auto_119807 ?auto_119810 ) ) ( not ( = ?auto_119807 ?auto_119811 ) ) ( not ( = ?auto_119807 ?auto_119812 ) ) ( not ( = ?auto_119808 ?auto_119809 ) ) ( not ( = ?auto_119808 ?auto_119810 ) ) ( not ( = ?auto_119808 ?auto_119811 ) ) ( not ( = ?auto_119808 ?auto_119812 ) ) ( not ( = ?auto_119809 ?auto_119810 ) ) ( not ( = ?auto_119809 ?auto_119811 ) ) ( not ( = ?auto_119809 ?auto_119812 ) ) ( not ( = ?auto_119810 ?auto_119811 ) ) ( not ( = ?auto_119810 ?auto_119812 ) ) ( not ( = ?auto_119811 ?auto_119812 ) ) ( ON ?auto_119812 ?auto_119813 ) ( not ( = ?auto_119807 ?auto_119813 ) ) ( not ( = ?auto_119808 ?auto_119813 ) ) ( not ( = ?auto_119809 ?auto_119813 ) ) ( not ( = ?auto_119810 ?auto_119813 ) ) ( not ( = ?auto_119811 ?auto_119813 ) ) ( not ( = ?auto_119812 ?auto_119813 ) ) ( ON ?auto_119811 ?auto_119812 ) ( ON-TABLE ?auto_119814 ) ( ON ?auto_119813 ?auto_119814 ) ( not ( = ?auto_119814 ?auto_119813 ) ) ( not ( = ?auto_119814 ?auto_119812 ) ) ( not ( = ?auto_119814 ?auto_119811 ) ) ( not ( = ?auto_119807 ?auto_119814 ) ) ( not ( = ?auto_119808 ?auto_119814 ) ) ( not ( = ?auto_119809 ?auto_119814 ) ) ( not ( = ?auto_119810 ?auto_119814 ) ) ( ON ?auto_119810 ?auto_119811 ) ( ON ?auto_119809 ?auto_119810 ) ( ON ?auto_119808 ?auto_119809 ) ( CLEAR ?auto_119808 ) ( ON ?auto_119807 ?auto_119815 ) ( CLEAR ?auto_119807 ) ( HAND-EMPTY ) ( not ( = ?auto_119807 ?auto_119815 ) ) ( not ( = ?auto_119808 ?auto_119815 ) ) ( not ( = ?auto_119809 ?auto_119815 ) ) ( not ( = ?auto_119810 ?auto_119815 ) ) ( not ( = ?auto_119811 ?auto_119815 ) ) ( not ( = ?auto_119812 ?auto_119815 ) ) ( not ( = ?auto_119813 ?auto_119815 ) ) ( not ( = ?auto_119814 ?auto_119815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119807 ?auto_119815 )
      ( MAKE-6PILE ?auto_119807 ?auto_119808 ?auto_119809 ?auto_119810 ?auto_119811 ?auto_119812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119816 - BLOCK
      ?auto_119817 - BLOCK
      ?auto_119818 - BLOCK
      ?auto_119819 - BLOCK
      ?auto_119820 - BLOCK
      ?auto_119821 - BLOCK
    )
    :vars
    (
      ?auto_119822 - BLOCK
      ?auto_119823 - BLOCK
      ?auto_119824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119816 ?auto_119817 ) ) ( not ( = ?auto_119816 ?auto_119818 ) ) ( not ( = ?auto_119816 ?auto_119819 ) ) ( not ( = ?auto_119816 ?auto_119820 ) ) ( not ( = ?auto_119816 ?auto_119821 ) ) ( not ( = ?auto_119817 ?auto_119818 ) ) ( not ( = ?auto_119817 ?auto_119819 ) ) ( not ( = ?auto_119817 ?auto_119820 ) ) ( not ( = ?auto_119817 ?auto_119821 ) ) ( not ( = ?auto_119818 ?auto_119819 ) ) ( not ( = ?auto_119818 ?auto_119820 ) ) ( not ( = ?auto_119818 ?auto_119821 ) ) ( not ( = ?auto_119819 ?auto_119820 ) ) ( not ( = ?auto_119819 ?auto_119821 ) ) ( not ( = ?auto_119820 ?auto_119821 ) ) ( ON ?auto_119821 ?auto_119822 ) ( not ( = ?auto_119816 ?auto_119822 ) ) ( not ( = ?auto_119817 ?auto_119822 ) ) ( not ( = ?auto_119818 ?auto_119822 ) ) ( not ( = ?auto_119819 ?auto_119822 ) ) ( not ( = ?auto_119820 ?auto_119822 ) ) ( not ( = ?auto_119821 ?auto_119822 ) ) ( ON ?auto_119820 ?auto_119821 ) ( ON-TABLE ?auto_119823 ) ( ON ?auto_119822 ?auto_119823 ) ( not ( = ?auto_119823 ?auto_119822 ) ) ( not ( = ?auto_119823 ?auto_119821 ) ) ( not ( = ?auto_119823 ?auto_119820 ) ) ( not ( = ?auto_119816 ?auto_119823 ) ) ( not ( = ?auto_119817 ?auto_119823 ) ) ( not ( = ?auto_119818 ?auto_119823 ) ) ( not ( = ?auto_119819 ?auto_119823 ) ) ( ON ?auto_119819 ?auto_119820 ) ( ON ?auto_119818 ?auto_119819 ) ( ON ?auto_119816 ?auto_119824 ) ( CLEAR ?auto_119816 ) ( not ( = ?auto_119816 ?auto_119824 ) ) ( not ( = ?auto_119817 ?auto_119824 ) ) ( not ( = ?auto_119818 ?auto_119824 ) ) ( not ( = ?auto_119819 ?auto_119824 ) ) ( not ( = ?auto_119820 ?auto_119824 ) ) ( not ( = ?auto_119821 ?auto_119824 ) ) ( not ( = ?auto_119822 ?auto_119824 ) ) ( not ( = ?auto_119823 ?auto_119824 ) ) ( HOLDING ?auto_119817 ) ( CLEAR ?auto_119818 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119823 ?auto_119822 ?auto_119821 ?auto_119820 ?auto_119819 ?auto_119818 ?auto_119817 )
      ( MAKE-6PILE ?auto_119816 ?auto_119817 ?auto_119818 ?auto_119819 ?auto_119820 ?auto_119821 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119825 - BLOCK
      ?auto_119826 - BLOCK
      ?auto_119827 - BLOCK
      ?auto_119828 - BLOCK
      ?auto_119829 - BLOCK
      ?auto_119830 - BLOCK
    )
    :vars
    (
      ?auto_119833 - BLOCK
      ?auto_119832 - BLOCK
      ?auto_119831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119825 ?auto_119826 ) ) ( not ( = ?auto_119825 ?auto_119827 ) ) ( not ( = ?auto_119825 ?auto_119828 ) ) ( not ( = ?auto_119825 ?auto_119829 ) ) ( not ( = ?auto_119825 ?auto_119830 ) ) ( not ( = ?auto_119826 ?auto_119827 ) ) ( not ( = ?auto_119826 ?auto_119828 ) ) ( not ( = ?auto_119826 ?auto_119829 ) ) ( not ( = ?auto_119826 ?auto_119830 ) ) ( not ( = ?auto_119827 ?auto_119828 ) ) ( not ( = ?auto_119827 ?auto_119829 ) ) ( not ( = ?auto_119827 ?auto_119830 ) ) ( not ( = ?auto_119828 ?auto_119829 ) ) ( not ( = ?auto_119828 ?auto_119830 ) ) ( not ( = ?auto_119829 ?auto_119830 ) ) ( ON ?auto_119830 ?auto_119833 ) ( not ( = ?auto_119825 ?auto_119833 ) ) ( not ( = ?auto_119826 ?auto_119833 ) ) ( not ( = ?auto_119827 ?auto_119833 ) ) ( not ( = ?auto_119828 ?auto_119833 ) ) ( not ( = ?auto_119829 ?auto_119833 ) ) ( not ( = ?auto_119830 ?auto_119833 ) ) ( ON ?auto_119829 ?auto_119830 ) ( ON-TABLE ?auto_119832 ) ( ON ?auto_119833 ?auto_119832 ) ( not ( = ?auto_119832 ?auto_119833 ) ) ( not ( = ?auto_119832 ?auto_119830 ) ) ( not ( = ?auto_119832 ?auto_119829 ) ) ( not ( = ?auto_119825 ?auto_119832 ) ) ( not ( = ?auto_119826 ?auto_119832 ) ) ( not ( = ?auto_119827 ?auto_119832 ) ) ( not ( = ?auto_119828 ?auto_119832 ) ) ( ON ?auto_119828 ?auto_119829 ) ( ON ?auto_119827 ?auto_119828 ) ( ON ?auto_119825 ?auto_119831 ) ( not ( = ?auto_119825 ?auto_119831 ) ) ( not ( = ?auto_119826 ?auto_119831 ) ) ( not ( = ?auto_119827 ?auto_119831 ) ) ( not ( = ?auto_119828 ?auto_119831 ) ) ( not ( = ?auto_119829 ?auto_119831 ) ) ( not ( = ?auto_119830 ?auto_119831 ) ) ( not ( = ?auto_119833 ?auto_119831 ) ) ( not ( = ?auto_119832 ?auto_119831 ) ) ( CLEAR ?auto_119827 ) ( ON ?auto_119826 ?auto_119825 ) ( CLEAR ?auto_119826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119831 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119831 ?auto_119825 )
      ( MAKE-6PILE ?auto_119825 ?auto_119826 ?auto_119827 ?auto_119828 ?auto_119829 ?auto_119830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119834 - BLOCK
      ?auto_119835 - BLOCK
      ?auto_119836 - BLOCK
      ?auto_119837 - BLOCK
      ?auto_119838 - BLOCK
      ?auto_119839 - BLOCK
    )
    :vars
    (
      ?auto_119840 - BLOCK
      ?auto_119842 - BLOCK
      ?auto_119841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119834 ?auto_119835 ) ) ( not ( = ?auto_119834 ?auto_119836 ) ) ( not ( = ?auto_119834 ?auto_119837 ) ) ( not ( = ?auto_119834 ?auto_119838 ) ) ( not ( = ?auto_119834 ?auto_119839 ) ) ( not ( = ?auto_119835 ?auto_119836 ) ) ( not ( = ?auto_119835 ?auto_119837 ) ) ( not ( = ?auto_119835 ?auto_119838 ) ) ( not ( = ?auto_119835 ?auto_119839 ) ) ( not ( = ?auto_119836 ?auto_119837 ) ) ( not ( = ?auto_119836 ?auto_119838 ) ) ( not ( = ?auto_119836 ?auto_119839 ) ) ( not ( = ?auto_119837 ?auto_119838 ) ) ( not ( = ?auto_119837 ?auto_119839 ) ) ( not ( = ?auto_119838 ?auto_119839 ) ) ( ON ?auto_119839 ?auto_119840 ) ( not ( = ?auto_119834 ?auto_119840 ) ) ( not ( = ?auto_119835 ?auto_119840 ) ) ( not ( = ?auto_119836 ?auto_119840 ) ) ( not ( = ?auto_119837 ?auto_119840 ) ) ( not ( = ?auto_119838 ?auto_119840 ) ) ( not ( = ?auto_119839 ?auto_119840 ) ) ( ON ?auto_119838 ?auto_119839 ) ( ON-TABLE ?auto_119842 ) ( ON ?auto_119840 ?auto_119842 ) ( not ( = ?auto_119842 ?auto_119840 ) ) ( not ( = ?auto_119842 ?auto_119839 ) ) ( not ( = ?auto_119842 ?auto_119838 ) ) ( not ( = ?auto_119834 ?auto_119842 ) ) ( not ( = ?auto_119835 ?auto_119842 ) ) ( not ( = ?auto_119836 ?auto_119842 ) ) ( not ( = ?auto_119837 ?auto_119842 ) ) ( ON ?auto_119837 ?auto_119838 ) ( ON ?auto_119834 ?auto_119841 ) ( not ( = ?auto_119834 ?auto_119841 ) ) ( not ( = ?auto_119835 ?auto_119841 ) ) ( not ( = ?auto_119836 ?auto_119841 ) ) ( not ( = ?auto_119837 ?auto_119841 ) ) ( not ( = ?auto_119838 ?auto_119841 ) ) ( not ( = ?auto_119839 ?auto_119841 ) ) ( not ( = ?auto_119840 ?auto_119841 ) ) ( not ( = ?auto_119842 ?auto_119841 ) ) ( ON ?auto_119835 ?auto_119834 ) ( CLEAR ?auto_119835 ) ( ON-TABLE ?auto_119841 ) ( HOLDING ?auto_119836 ) ( CLEAR ?auto_119837 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119842 ?auto_119840 ?auto_119839 ?auto_119838 ?auto_119837 ?auto_119836 )
      ( MAKE-6PILE ?auto_119834 ?auto_119835 ?auto_119836 ?auto_119837 ?auto_119838 ?auto_119839 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119843 - BLOCK
      ?auto_119844 - BLOCK
      ?auto_119845 - BLOCK
      ?auto_119846 - BLOCK
      ?auto_119847 - BLOCK
      ?auto_119848 - BLOCK
    )
    :vars
    (
      ?auto_119851 - BLOCK
      ?auto_119849 - BLOCK
      ?auto_119850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119843 ?auto_119844 ) ) ( not ( = ?auto_119843 ?auto_119845 ) ) ( not ( = ?auto_119843 ?auto_119846 ) ) ( not ( = ?auto_119843 ?auto_119847 ) ) ( not ( = ?auto_119843 ?auto_119848 ) ) ( not ( = ?auto_119844 ?auto_119845 ) ) ( not ( = ?auto_119844 ?auto_119846 ) ) ( not ( = ?auto_119844 ?auto_119847 ) ) ( not ( = ?auto_119844 ?auto_119848 ) ) ( not ( = ?auto_119845 ?auto_119846 ) ) ( not ( = ?auto_119845 ?auto_119847 ) ) ( not ( = ?auto_119845 ?auto_119848 ) ) ( not ( = ?auto_119846 ?auto_119847 ) ) ( not ( = ?auto_119846 ?auto_119848 ) ) ( not ( = ?auto_119847 ?auto_119848 ) ) ( ON ?auto_119848 ?auto_119851 ) ( not ( = ?auto_119843 ?auto_119851 ) ) ( not ( = ?auto_119844 ?auto_119851 ) ) ( not ( = ?auto_119845 ?auto_119851 ) ) ( not ( = ?auto_119846 ?auto_119851 ) ) ( not ( = ?auto_119847 ?auto_119851 ) ) ( not ( = ?auto_119848 ?auto_119851 ) ) ( ON ?auto_119847 ?auto_119848 ) ( ON-TABLE ?auto_119849 ) ( ON ?auto_119851 ?auto_119849 ) ( not ( = ?auto_119849 ?auto_119851 ) ) ( not ( = ?auto_119849 ?auto_119848 ) ) ( not ( = ?auto_119849 ?auto_119847 ) ) ( not ( = ?auto_119843 ?auto_119849 ) ) ( not ( = ?auto_119844 ?auto_119849 ) ) ( not ( = ?auto_119845 ?auto_119849 ) ) ( not ( = ?auto_119846 ?auto_119849 ) ) ( ON ?auto_119846 ?auto_119847 ) ( ON ?auto_119843 ?auto_119850 ) ( not ( = ?auto_119843 ?auto_119850 ) ) ( not ( = ?auto_119844 ?auto_119850 ) ) ( not ( = ?auto_119845 ?auto_119850 ) ) ( not ( = ?auto_119846 ?auto_119850 ) ) ( not ( = ?auto_119847 ?auto_119850 ) ) ( not ( = ?auto_119848 ?auto_119850 ) ) ( not ( = ?auto_119851 ?auto_119850 ) ) ( not ( = ?auto_119849 ?auto_119850 ) ) ( ON ?auto_119844 ?auto_119843 ) ( ON-TABLE ?auto_119850 ) ( CLEAR ?auto_119846 ) ( ON ?auto_119845 ?auto_119844 ) ( CLEAR ?auto_119845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119850 ?auto_119843 ?auto_119844 )
      ( MAKE-6PILE ?auto_119843 ?auto_119844 ?auto_119845 ?auto_119846 ?auto_119847 ?auto_119848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119852 - BLOCK
      ?auto_119853 - BLOCK
      ?auto_119854 - BLOCK
      ?auto_119855 - BLOCK
      ?auto_119856 - BLOCK
      ?auto_119857 - BLOCK
    )
    :vars
    (
      ?auto_119859 - BLOCK
      ?auto_119860 - BLOCK
      ?auto_119858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119852 ?auto_119853 ) ) ( not ( = ?auto_119852 ?auto_119854 ) ) ( not ( = ?auto_119852 ?auto_119855 ) ) ( not ( = ?auto_119852 ?auto_119856 ) ) ( not ( = ?auto_119852 ?auto_119857 ) ) ( not ( = ?auto_119853 ?auto_119854 ) ) ( not ( = ?auto_119853 ?auto_119855 ) ) ( not ( = ?auto_119853 ?auto_119856 ) ) ( not ( = ?auto_119853 ?auto_119857 ) ) ( not ( = ?auto_119854 ?auto_119855 ) ) ( not ( = ?auto_119854 ?auto_119856 ) ) ( not ( = ?auto_119854 ?auto_119857 ) ) ( not ( = ?auto_119855 ?auto_119856 ) ) ( not ( = ?auto_119855 ?auto_119857 ) ) ( not ( = ?auto_119856 ?auto_119857 ) ) ( ON ?auto_119857 ?auto_119859 ) ( not ( = ?auto_119852 ?auto_119859 ) ) ( not ( = ?auto_119853 ?auto_119859 ) ) ( not ( = ?auto_119854 ?auto_119859 ) ) ( not ( = ?auto_119855 ?auto_119859 ) ) ( not ( = ?auto_119856 ?auto_119859 ) ) ( not ( = ?auto_119857 ?auto_119859 ) ) ( ON ?auto_119856 ?auto_119857 ) ( ON-TABLE ?auto_119860 ) ( ON ?auto_119859 ?auto_119860 ) ( not ( = ?auto_119860 ?auto_119859 ) ) ( not ( = ?auto_119860 ?auto_119857 ) ) ( not ( = ?auto_119860 ?auto_119856 ) ) ( not ( = ?auto_119852 ?auto_119860 ) ) ( not ( = ?auto_119853 ?auto_119860 ) ) ( not ( = ?auto_119854 ?auto_119860 ) ) ( not ( = ?auto_119855 ?auto_119860 ) ) ( ON ?auto_119852 ?auto_119858 ) ( not ( = ?auto_119852 ?auto_119858 ) ) ( not ( = ?auto_119853 ?auto_119858 ) ) ( not ( = ?auto_119854 ?auto_119858 ) ) ( not ( = ?auto_119855 ?auto_119858 ) ) ( not ( = ?auto_119856 ?auto_119858 ) ) ( not ( = ?auto_119857 ?auto_119858 ) ) ( not ( = ?auto_119859 ?auto_119858 ) ) ( not ( = ?auto_119860 ?auto_119858 ) ) ( ON ?auto_119853 ?auto_119852 ) ( ON-TABLE ?auto_119858 ) ( ON ?auto_119854 ?auto_119853 ) ( CLEAR ?auto_119854 ) ( HOLDING ?auto_119855 ) ( CLEAR ?auto_119856 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119860 ?auto_119859 ?auto_119857 ?auto_119856 ?auto_119855 )
      ( MAKE-6PILE ?auto_119852 ?auto_119853 ?auto_119854 ?auto_119855 ?auto_119856 ?auto_119857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119861 - BLOCK
      ?auto_119862 - BLOCK
      ?auto_119863 - BLOCK
      ?auto_119864 - BLOCK
      ?auto_119865 - BLOCK
      ?auto_119866 - BLOCK
    )
    :vars
    (
      ?auto_119869 - BLOCK
      ?auto_119868 - BLOCK
      ?auto_119867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119861 ?auto_119862 ) ) ( not ( = ?auto_119861 ?auto_119863 ) ) ( not ( = ?auto_119861 ?auto_119864 ) ) ( not ( = ?auto_119861 ?auto_119865 ) ) ( not ( = ?auto_119861 ?auto_119866 ) ) ( not ( = ?auto_119862 ?auto_119863 ) ) ( not ( = ?auto_119862 ?auto_119864 ) ) ( not ( = ?auto_119862 ?auto_119865 ) ) ( not ( = ?auto_119862 ?auto_119866 ) ) ( not ( = ?auto_119863 ?auto_119864 ) ) ( not ( = ?auto_119863 ?auto_119865 ) ) ( not ( = ?auto_119863 ?auto_119866 ) ) ( not ( = ?auto_119864 ?auto_119865 ) ) ( not ( = ?auto_119864 ?auto_119866 ) ) ( not ( = ?auto_119865 ?auto_119866 ) ) ( ON ?auto_119866 ?auto_119869 ) ( not ( = ?auto_119861 ?auto_119869 ) ) ( not ( = ?auto_119862 ?auto_119869 ) ) ( not ( = ?auto_119863 ?auto_119869 ) ) ( not ( = ?auto_119864 ?auto_119869 ) ) ( not ( = ?auto_119865 ?auto_119869 ) ) ( not ( = ?auto_119866 ?auto_119869 ) ) ( ON ?auto_119865 ?auto_119866 ) ( ON-TABLE ?auto_119868 ) ( ON ?auto_119869 ?auto_119868 ) ( not ( = ?auto_119868 ?auto_119869 ) ) ( not ( = ?auto_119868 ?auto_119866 ) ) ( not ( = ?auto_119868 ?auto_119865 ) ) ( not ( = ?auto_119861 ?auto_119868 ) ) ( not ( = ?auto_119862 ?auto_119868 ) ) ( not ( = ?auto_119863 ?auto_119868 ) ) ( not ( = ?auto_119864 ?auto_119868 ) ) ( ON ?auto_119861 ?auto_119867 ) ( not ( = ?auto_119861 ?auto_119867 ) ) ( not ( = ?auto_119862 ?auto_119867 ) ) ( not ( = ?auto_119863 ?auto_119867 ) ) ( not ( = ?auto_119864 ?auto_119867 ) ) ( not ( = ?auto_119865 ?auto_119867 ) ) ( not ( = ?auto_119866 ?auto_119867 ) ) ( not ( = ?auto_119869 ?auto_119867 ) ) ( not ( = ?auto_119868 ?auto_119867 ) ) ( ON ?auto_119862 ?auto_119861 ) ( ON-TABLE ?auto_119867 ) ( ON ?auto_119863 ?auto_119862 ) ( CLEAR ?auto_119865 ) ( ON ?auto_119864 ?auto_119863 ) ( CLEAR ?auto_119864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119867 ?auto_119861 ?auto_119862 ?auto_119863 )
      ( MAKE-6PILE ?auto_119861 ?auto_119862 ?auto_119863 ?auto_119864 ?auto_119865 ?auto_119866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119870 - BLOCK
      ?auto_119871 - BLOCK
      ?auto_119872 - BLOCK
      ?auto_119873 - BLOCK
      ?auto_119874 - BLOCK
      ?auto_119875 - BLOCK
    )
    :vars
    (
      ?auto_119876 - BLOCK
      ?auto_119878 - BLOCK
      ?auto_119877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119870 ?auto_119871 ) ) ( not ( = ?auto_119870 ?auto_119872 ) ) ( not ( = ?auto_119870 ?auto_119873 ) ) ( not ( = ?auto_119870 ?auto_119874 ) ) ( not ( = ?auto_119870 ?auto_119875 ) ) ( not ( = ?auto_119871 ?auto_119872 ) ) ( not ( = ?auto_119871 ?auto_119873 ) ) ( not ( = ?auto_119871 ?auto_119874 ) ) ( not ( = ?auto_119871 ?auto_119875 ) ) ( not ( = ?auto_119872 ?auto_119873 ) ) ( not ( = ?auto_119872 ?auto_119874 ) ) ( not ( = ?auto_119872 ?auto_119875 ) ) ( not ( = ?auto_119873 ?auto_119874 ) ) ( not ( = ?auto_119873 ?auto_119875 ) ) ( not ( = ?auto_119874 ?auto_119875 ) ) ( ON ?auto_119875 ?auto_119876 ) ( not ( = ?auto_119870 ?auto_119876 ) ) ( not ( = ?auto_119871 ?auto_119876 ) ) ( not ( = ?auto_119872 ?auto_119876 ) ) ( not ( = ?auto_119873 ?auto_119876 ) ) ( not ( = ?auto_119874 ?auto_119876 ) ) ( not ( = ?auto_119875 ?auto_119876 ) ) ( ON-TABLE ?auto_119878 ) ( ON ?auto_119876 ?auto_119878 ) ( not ( = ?auto_119878 ?auto_119876 ) ) ( not ( = ?auto_119878 ?auto_119875 ) ) ( not ( = ?auto_119878 ?auto_119874 ) ) ( not ( = ?auto_119870 ?auto_119878 ) ) ( not ( = ?auto_119871 ?auto_119878 ) ) ( not ( = ?auto_119872 ?auto_119878 ) ) ( not ( = ?auto_119873 ?auto_119878 ) ) ( ON ?auto_119870 ?auto_119877 ) ( not ( = ?auto_119870 ?auto_119877 ) ) ( not ( = ?auto_119871 ?auto_119877 ) ) ( not ( = ?auto_119872 ?auto_119877 ) ) ( not ( = ?auto_119873 ?auto_119877 ) ) ( not ( = ?auto_119874 ?auto_119877 ) ) ( not ( = ?auto_119875 ?auto_119877 ) ) ( not ( = ?auto_119876 ?auto_119877 ) ) ( not ( = ?auto_119878 ?auto_119877 ) ) ( ON ?auto_119871 ?auto_119870 ) ( ON-TABLE ?auto_119877 ) ( ON ?auto_119872 ?auto_119871 ) ( ON ?auto_119873 ?auto_119872 ) ( CLEAR ?auto_119873 ) ( HOLDING ?auto_119874 ) ( CLEAR ?auto_119875 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119878 ?auto_119876 ?auto_119875 ?auto_119874 )
      ( MAKE-6PILE ?auto_119870 ?auto_119871 ?auto_119872 ?auto_119873 ?auto_119874 ?auto_119875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119879 - BLOCK
      ?auto_119880 - BLOCK
      ?auto_119881 - BLOCK
      ?auto_119882 - BLOCK
      ?auto_119883 - BLOCK
      ?auto_119884 - BLOCK
    )
    :vars
    (
      ?auto_119885 - BLOCK
      ?auto_119887 - BLOCK
      ?auto_119886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119879 ?auto_119880 ) ) ( not ( = ?auto_119879 ?auto_119881 ) ) ( not ( = ?auto_119879 ?auto_119882 ) ) ( not ( = ?auto_119879 ?auto_119883 ) ) ( not ( = ?auto_119879 ?auto_119884 ) ) ( not ( = ?auto_119880 ?auto_119881 ) ) ( not ( = ?auto_119880 ?auto_119882 ) ) ( not ( = ?auto_119880 ?auto_119883 ) ) ( not ( = ?auto_119880 ?auto_119884 ) ) ( not ( = ?auto_119881 ?auto_119882 ) ) ( not ( = ?auto_119881 ?auto_119883 ) ) ( not ( = ?auto_119881 ?auto_119884 ) ) ( not ( = ?auto_119882 ?auto_119883 ) ) ( not ( = ?auto_119882 ?auto_119884 ) ) ( not ( = ?auto_119883 ?auto_119884 ) ) ( ON ?auto_119884 ?auto_119885 ) ( not ( = ?auto_119879 ?auto_119885 ) ) ( not ( = ?auto_119880 ?auto_119885 ) ) ( not ( = ?auto_119881 ?auto_119885 ) ) ( not ( = ?auto_119882 ?auto_119885 ) ) ( not ( = ?auto_119883 ?auto_119885 ) ) ( not ( = ?auto_119884 ?auto_119885 ) ) ( ON-TABLE ?auto_119887 ) ( ON ?auto_119885 ?auto_119887 ) ( not ( = ?auto_119887 ?auto_119885 ) ) ( not ( = ?auto_119887 ?auto_119884 ) ) ( not ( = ?auto_119887 ?auto_119883 ) ) ( not ( = ?auto_119879 ?auto_119887 ) ) ( not ( = ?auto_119880 ?auto_119887 ) ) ( not ( = ?auto_119881 ?auto_119887 ) ) ( not ( = ?auto_119882 ?auto_119887 ) ) ( ON ?auto_119879 ?auto_119886 ) ( not ( = ?auto_119879 ?auto_119886 ) ) ( not ( = ?auto_119880 ?auto_119886 ) ) ( not ( = ?auto_119881 ?auto_119886 ) ) ( not ( = ?auto_119882 ?auto_119886 ) ) ( not ( = ?auto_119883 ?auto_119886 ) ) ( not ( = ?auto_119884 ?auto_119886 ) ) ( not ( = ?auto_119885 ?auto_119886 ) ) ( not ( = ?auto_119887 ?auto_119886 ) ) ( ON ?auto_119880 ?auto_119879 ) ( ON-TABLE ?auto_119886 ) ( ON ?auto_119881 ?auto_119880 ) ( ON ?auto_119882 ?auto_119881 ) ( CLEAR ?auto_119884 ) ( ON ?auto_119883 ?auto_119882 ) ( CLEAR ?auto_119883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119886 ?auto_119879 ?auto_119880 ?auto_119881 ?auto_119882 )
      ( MAKE-6PILE ?auto_119879 ?auto_119880 ?auto_119881 ?auto_119882 ?auto_119883 ?auto_119884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119888 - BLOCK
      ?auto_119889 - BLOCK
      ?auto_119890 - BLOCK
      ?auto_119891 - BLOCK
      ?auto_119892 - BLOCK
      ?auto_119893 - BLOCK
    )
    :vars
    (
      ?auto_119896 - BLOCK
      ?auto_119895 - BLOCK
      ?auto_119894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119888 ?auto_119889 ) ) ( not ( = ?auto_119888 ?auto_119890 ) ) ( not ( = ?auto_119888 ?auto_119891 ) ) ( not ( = ?auto_119888 ?auto_119892 ) ) ( not ( = ?auto_119888 ?auto_119893 ) ) ( not ( = ?auto_119889 ?auto_119890 ) ) ( not ( = ?auto_119889 ?auto_119891 ) ) ( not ( = ?auto_119889 ?auto_119892 ) ) ( not ( = ?auto_119889 ?auto_119893 ) ) ( not ( = ?auto_119890 ?auto_119891 ) ) ( not ( = ?auto_119890 ?auto_119892 ) ) ( not ( = ?auto_119890 ?auto_119893 ) ) ( not ( = ?auto_119891 ?auto_119892 ) ) ( not ( = ?auto_119891 ?auto_119893 ) ) ( not ( = ?auto_119892 ?auto_119893 ) ) ( not ( = ?auto_119888 ?auto_119896 ) ) ( not ( = ?auto_119889 ?auto_119896 ) ) ( not ( = ?auto_119890 ?auto_119896 ) ) ( not ( = ?auto_119891 ?auto_119896 ) ) ( not ( = ?auto_119892 ?auto_119896 ) ) ( not ( = ?auto_119893 ?auto_119896 ) ) ( ON-TABLE ?auto_119895 ) ( ON ?auto_119896 ?auto_119895 ) ( not ( = ?auto_119895 ?auto_119896 ) ) ( not ( = ?auto_119895 ?auto_119893 ) ) ( not ( = ?auto_119895 ?auto_119892 ) ) ( not ( = ?auto_119888 ?auto_119895 ) ) ( not ( = ?auto_119889 ?auto_119895 ) ) ( not ( = ?auto_119890 ?auto_119895 ) ) ( not ( = ?auto_119891 ?auto_119895 ) ) ( ON ?auto_119888 ?auto_119894 ) ( not ( = ?auto_119888 ?auto_119894 ) ) ( not ( = ?auto_119889 ?auto_119894 ) ) ( not ( = ?auto_119890 ?auto_119894 ) ) ( not ( = ?auto_119891 ?auto_119894 ) ) ( not ( = ?auto_119892 ?auto_119894 ) ) ( not ( = ?auto_119893 ?auto_119894 ) ) ( not ( = ?auto_119896 ?auto_119894 ) ) ( not ( = ?auto_119895 ?auto_119894 ) ) ( ON ?auto_119889 ?auto_119888 ) ( ON-TABLE ?auto_119894 ) ( ON ?auto_119890 ?auto_119889 ) ( ON ?auto_119891 ?auto_119890 ) ( ON ?auto_119892 ?auto_119891 ) ( CLEAR ?auto_119892 ) ( HOLDING ?auto_119893 ) ( CLEAR ?auto_119896 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119895 ?auto_119896 ?auto_119893 )
      ( MAKE-6PILE ?auto_119888 ?auto_119889 ?auto_119890 ?auto_119891 ?auto_119892 ?auto_119893 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119897 - BLOCK
      ?auto_119898 - BLOCK
      ?auto_119899 - BLOCK
      ?auto_119900 - BLOCK
      ?auto_119901 - BLOCK
      ?auto_119902 - BLOCK
    )
    :vars
    (
      ?auto_119903 - BLOCK
      ?auto_119905 - BLOCK
      ?auto_119904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119897 ?auto_119898 ) ) ( not ( = ?auto_119897 ?auto_119899 ) ) ( not ( = ?auto_119897 ?auto_119900 ) ) ( not ( = ?auto_119897 ?auto_119901 ) ) ( not ( = ?auto_119897 ?auto_119902 ) ) ( not ( = ?auto_119898 ?auto_119899 ) ) ( not ( = ?auto_119898 ?auto_119900 ) ) ( not ( = ?auto_119898 ?auto_119901 ) ) ( not ( = ?auto_119898 ?auto_119902 ) ) ( not ( = ?auto_119899 ?auto_119900 ) ) ( not ( = ?auto_119899 ?auto_119901 ) ) ( not ( = ?auto_119899 ?auto_119902 ) ) ( not ( = ?auto_119900 ?auto_119901 ) ) ( not ( = ?auto_119900 ?auto_119902 ) ) ( not ( = ?auto_119901 ?auto_119902 ) ) ( not ( = ?auto_119897 ?auto_119903 ) ) ( not ( = ?auto_119898 ?auto_119903 ) ) ( not ( = ?auto_119899 ?auto_119903 ) ) ( not ( = ?auto_119900 ?auto_119903 ) ) ( not ( = ?auto_119901 ?auto_119903 ) ) ( not ( = ?auto_119902 ?auto_119903 ) ) ( ON-TABLE ?auto_119905 ) ( ON ?auto_119903 ?auto_119905 ) ( not ( = ?auto_119905 ?auto_119903 ) ) ( not ( = ?auto_119905 ?auto_119902 ) ) ( not ( = ?auto_119905 ?auto_119901 ) ) ( not ( = ?auto_119897 ?auto_119905 ) ) ( not ( = ?auto_119898 ?auto_119905 ) ) ( not ( = ?auto_119899 ?auto_119905 ) ) ( not ( = ?auto_119900 ?auto_119905 ) ) ( ON ?auto_119897 ?auto_119904 ) ( not ( = ?auto_119897 ?auto_119904 ) ) ( not ( = ?auto_119898 ?auto_119904 ) ) ( not ( = ?auto_119899 ?auto_119904 ) ) ( not ( = ?auto_119900 ?auto_119904 ) ) ( not ( = ?auto_119901 ?auto_119904 ) ) ( not ( = ?auto_119902 ?auto_119904 ) ) ( not ( = ?auto_119903 ?auto_119904 ) ) ( not ( = ?auto_119905 ?auto_119904 ) ) ( ON ?auto_119898 ?auto_119897 ) ( ON-TABLE ?auto_119904 ) ( ON ?auto_119899 ?auto_119898 ) ( ON ?auto_119900 ?auto_119899 ) ( ON ?auto_119901 ?auto_119900 ) ( CLEAR ?auto_119903 ) ( ON ?auto_119902 ?auto_119901 ) ( CLEAR ?auto_119902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119904 ?auto_119897 ?auto_119898 ?auto_119899 ?auto_119900 ?auto_119901 )
      ( MAKE-6PILE ?auto_119897 ?auto_119898 ?auto_119899 ?auto_119900 ?auto_119901 ?auto_119902 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119906 - BLOCK
      ?auto_119907 - BLOCK
      ?auto_119908 - BLOCK
      ?auto_119909 - BLOCK
      ?auto_119910 - BLOCK
      ?auto_119911 - BLOCK
    )
    :vars
    (
      ?auto_119913 - BLOCK
      ?auto_119914 - BLOCK
      ?auto_119912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119906 ?auto_119907 ) ) ( not ( = ?auto_119906 ?auto_119908 ) ) ( not ( = ?auto_119906 ?auto_119909 ) ) ( not ( = ?auto_119906 ?auto_119910 ) ) ( not ( = ?auto_119906 ?auto_119911 ) ) ( not ( = ?auto_119907 ?auto_119908 ) ) ( not ( = ?auto_119907 ?auto_119909 ) ) ( not ( = ?auto_119907 ?auto_119910 ) ) ( not ( = ?auto_119907 ?auto_119911 ) ) ( not ( = ?auto_119908 ?auto_119909 ) ) ( not ( = ?auto_119908 ?auto_119910 ) ) ( not ( = ?auto_119908 ?auto_119911 ) ) ( not ( = ?auto_119909 ?auto_119910 ) ) ( not ( = ?auto_119909 ?auto_119911 ) ) ( not ( = ?auto_119910 ?auto_119911 ) ) ( not ( = ?auto_119906 ?auto_119913 ) ) ( not ( = ?auto_119907 ?auto_119913 ) ) ( not ( = ?auto_119908 ?auto_119913 ) ) ( not ( = ?auto_119909 ?auto_119913 ) ) ( not ( = ?auto_119910 ?auto_119913 ) ) ( not ( = ?auto_119911 ?auto_119913 ) ) ( ON-TABLE ?auto_119914 ) ( not ( = ?auto_119914 ?auto_119913 ) ) ( not ( = ?auto_119914 ?auto_119911 ) ) ( not ( = ?auto_119914 ?auto_119910 ) ) ( not ( = ?auto_119906 ?auto_119914 ) ) ( not ( = ?auto_119907 ?auto_119914 ) ) ( not ( = ?auto_119908 ?auto_119914 ) ) ( not ( = ?auto_119909 ?auto_119914 ) ) ( ON ?auto_119906 ?auto_119912 ) ( not ( = ?auto_119906 ?auto_119912 ) ) ( not ( = ?auto_119907 ?auto_119912 ) ) ( not ( = ?auto_119908 ?auto_119912 ) ) ( not ( = ?auto_119909 ?auto_119912 ) ) ( not ( = ?auto_119910 ?auto_119912 ) ) ( not ( = ?auto_119911 ?auto_119912 ) ) ( not ( = ?auto_119913 ?auto_119912 ) ) ( not ( = ?auto_119914 ?auto_119912 ) ) ( ON ?auto_119907 ?auto_119906 ) ( ON-TABLE ?auto_119912 ) ( ON ?auto_119908 ?auto_119907 ) ( ON ?auto_119909 ?auto_119908 ) ( ON ?auto_119910 ?auto_119909 ) ( ON ?auto_119911 ?auto_119910 ) ( CLEAR ?auto_119911 ) ( HOLDING ?auto_119913 ) ( CLEAR ?auto_119914 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119914 ?auto_119913 )
      ( MAKE-6PILE ?auto_119906 ?auto_119907 ?auto_119908 ?auto_119909 ?auto_119910 ?auto_119911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119915 - BLOCK
      ?auto_119916 - BLOCK
      ?auto_119917 - BLOCK
      ?auto_119918 - BLOCK
      ?auto_119919 - BLOCK
      ?auto_119920 - BLOCK
    )
    :vars
    (
      ?auto_119923 - BLOCK
      ?auto_119922 - BLOCK
      ?auto_119921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119915 ?auto_119916 ) ) ( not ( = ?auto_119915 ?auto_119917 ) ) ( not ( = ?auto_119915 ?auto_119918 ) ) ( not ( = ?auto_119915 ?auto_119919 ) ) ( not ( = ?auto_119915 ?auto_119920 ) ) ( not ( = ?auto_119916 ?auto_119917 ) ) ( not ( = ?auto_119916 ?auto_119918 ) ) ( not ( = ?auto_119916 ?auto_119919 ) ) ( not ( = ?auto_119916 ?auto_119920 ) ) ( not ( = ?auto_119917 ?auto_119918 ) ) ( not ( = ?auto_119917 ?auto_119919 ) ) ( not ( = ?auto_119917 ?auto_119920 ) ) ( not ( = ?auto_119918 ?auto_119919 ) ) ( not ( = ?auto_119918 ?auto_119920 ) ) ( not ( = ?auto_119919 ?auto_119920 ) ) ( not ( = ?auto_119915 ?auto_119923 ) ) ( not ( = ?auto_119916 ?auto_119923 ) ) ( not ( = ?auto_119917 ?auto_119923 ) ) ( not ( = ?auto_119918 ?auto_119923 ) ) ( not ( = ?auto_119919 ?auto_119923 ) ) ( not ( = ?auto_119920 ?auto_119923 ) ) ( ON-TABLE ?auto_119922 ) ( not ( = ?auto_119922 ?auto_119923 ) ) ( not ( = ?auto_119922 ?auto_119920 ) ) ( not ( = ?auto_119922 ?auto_119919 ) ) ( not ( = ?auto_119915 ?auto_119922 ) ) ( not ( = ?auto_119916 ?auto_119922 ) ) ( not ( = ?auto_119917 ?auto_119922 ) ) ( not ( = ?auto_119918 ?auto_119922 ) ) ( ON ?auto_119915 ?auto_119921 ) ( not ( = ?auto_119915 ?auto_119921 ) ) ( not ( = ?auto_119916 ?auto_119921 ) ) ( not ( = ?auto_119917 ?auto_119921 ) ) ( not ( = ?auto_119918 ?auto_119921 ) ) ( not ( = ?auto_119919 ?auto_119921 ) ) ( not ( = ?auto_119920 ?auto_119921 ) ) ( not ( = ?auto_119923 ?auto_119921 ) ) ( not ( = ?auto_119922 ?auto_119921 ) ) ( ON ?auto_119916 ?auto_119915 ) ( ON-TABLE ?auto_119921 ) ( ON ?auto_119917 ?auto_119916 ) ( ON ?auto_119918 ?auto_119917 ) ( ON ?auto_119919 ?auto_119918 ) ( ON ?auto_119920 ?auto_119919 ) ( CLEAR ?auto_119922 ) ( ON ?auto_119923 ?auto_119920 ) ( CLEAR ?auto_119923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119921 ?auto_119915 ?auto_119916 ?auto_119917 ?auto_119918 ?auto_119919 ?auto_119920 )
      ( MAKE-6PILE ?auto_119915 ?auto_119916 ?auto_119917 ?auto_119918 ?auto_119919 ?auto_119920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119924 - BLOCK
      ?auto_119925 - BLOCK
      ?auto_119926 - BLOCK
      ?auto_119927 - BLOCK
      ?auto_119928 - BLOCK
      ?auto_119929 - BLOCK
    )
    :vars
    (
      ?auto_119930 - BLOCK
      ?auto_119931 - BLOCK
      ?auto_119932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119924 ?auto_119925 ) ) ( not ( = ?auto_119924 ?auto_119926 ) ) ( not ( = ?auto_119924 ?auto_119927 ) ) ( not ( = ?auto_119924 ?auto_119928 ) ) ( not ( = ?auto_119924 ?auto_119929 ) ) ( not ( = ?auto_119925 ?auto_119926 ) ) ( not ( = ?auto_119925 ?auto_119927 ) ) ( not ( = ?auto_119925 ?auto_119928 ) ) ( not ( = ?auto_119925 ?auto_119929 ) ) ( not ( = ?auto_119926 ?auto_119927 ) ) ( not ( = ?auto_119926 ?auto_119928 ) ) ( not ( = ?auto_119926 ?auto_119929 ) ) ( not ( = ?auto_119927 ?auto_119928 ) ) ( not ( = ?auto_119927 ?auto_119929 ) ) ( not ( = ?auto_119928 ?auto_119929 ) ) ( not ( = ?auto_119924 ?auto_119930 ) ) ( not ( = ?auto_119925 ?auto_119930 ) ) ( not ( = ?auto_119926 ?auto_119930 ) ) ( not ( = ?auto_119927 ?auto_119930 ) ) ( not ( = ?auto_119928 ?auto_119930 ) ) ( not ( = ?auto_119929 ?auto_119930 ) ) ( not ( = ?auto_119931 ?auto_119930 ) ) ( not ( = ?auto_119931 ?auto_119929 ) ) ( not ( = ?auto_119931 ?auto_119928 ) ) ( not ( = ?auto_119924 ?auto_119931 ) ) ( not ( = ?auto_119925 ?auto_119931 ) ) ( not ( = ?auto_119926 ?auto_119931 ) ) ( not ( = ?auto_119927 ?auto_119931 ) ) ( ON ?auto_119924 ?auto_119932 ) ( not ( = ?auto_119924 ?auto_119932 ) ) ( not ( = ?auto_119925 ?auto_119932 ) ) ( not ( = ?auto_119926 ?auto_119932 ) ) ( not ( = ?auto_119927 ?auto_119932 ) ) ( not ( = ?auto_119928 ?auto_119932 ) ) ( not ( = ?auto_119929 ?auto_119932 ) ) ( not ( = ?auto_119930 ?auto_119932 ) ) ( not ( = ?auto_119931 ?auto_119932 ) ) ( ON ?auto_119925 ?auto_119924 ) ( ON-TABLE ?auto_119932 ) ( ON ?auto_119926 ?auto_119925 ) ( ON ?auto_119927 ?auto_119926 ) ( ON ?auto_119928 ?auto_119927 ) ( ON ?auto_119929 ?auto_119928 ) ( ON ?auto_119930 ?auto_119929 ) ( CLEAR ?auto_119930 ) ( HOLDING ?auto_119931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119931 )
      ( MAKE-6PILE ?auto_119924 ?auto_119925 ?auto_119926 ?auto_119927 ?auto_119928 ?auto_119929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119933 - BLOCK
      ?auto_119934 - BLOCK
      ?auto_119935 - BLOCK
      ?auto_119936 - BLOCK
      ?auto_119937 - BLOCK
      ?auto_119938 - BLOCK
    )
    :vars
    (
      ?auto_119939 - BLOCK
      ?auto_119941 - BLOCK
      ?auto_119940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119933 ?auto_119934 ) ) ( not ( = ?auto_119933 ?auto_119935 ) ) ( not ( = ?auto_119933 ?auto_119936 ) ) ( not ( = ?auto_119933 ?auto_119937 ) ) ( not ( = ?auto_119933 ?auto_119938 ) ) ( not ( = ?auto_119934 ?auto_119935 ) ) ( not ( = ?auto_119934 ?auto_119936 ) ) ( not ( = ?auto_119934 ?auto_119937 ) ) ( not ( = ?auto_119934 ?auto_119938 ) ) ( not ( = ?auto_119935 ?auto_119936 ) ) ( not ( = ?auto_119935 ?auto_119937 ) ) ( not ( = ?auto_119935 ?auto_119938 ) ) ( not ( = ?auto_119936 ?auto_119937 ) ) ( not ( = ?auto_119936 ?auto_119938 ) ) ( not ( = ?auto_119937 ?auto_119938 ) ) ( not ( = ?auto_119933 ?auto_119939 ) ) ( not ( = ?auto_119934 ?auto_119939 ) ) ( not ( = ?auto_119935 ?auto_119939 ) ) ( not ( = ?auto_119936 ?auto_119939 ) ) ( not ( = ?auto_119937 ?auto_119939 ) ) ( not ( = ?auto_119938 ?auto_119939 ) ) ( not ( = ?auto_119941 ?auto_119939 ) ) ( not ( = ?auto_119941 ?auto_119938 ) ) ( not ( = ?auto_119941 ?auto_119937 ) ) ( not ( = ?auto_119933 ?auto_119941 ) ) ( not ( = ?auto_119934 ?auto_119941 ) ) ( not ( = ?auto_119935 ?auto_119941 ) ) ( not ( = ?auto_119936 ?auto_119941 ) ) ( ON ?auto_119933 ?auto_119940 ) ( not ( = ?auto_119933 ?auto_119940 ) ) ( not ( = ?auto_119934 ?auto_119940 ) ) ( not ( = ?auto_119935 ?auto_119940 ) ) ( not ( = ?auto_119936 ?auto_119940 ) ) ( not ( = ?auto_119937 ?auto_119940 ) ) ( not ( = ?auto_119938 ?auto_119940 ) ) ( not ( = ?auto_119939 ?auto_119940 ) ) ( not ( = ?auto_119941 ?auto_119940 ) ) ( ON ?auto_119934 ?auto_119933 ) ( ON-TABLE ?auto_119940 ) ( ON ?auto_119935 ?auto_119934 ) ( ON ?auto_119936 ?auto_119935 ) ( ON ?auto_119937 ?auto_119936 ) ( ON ?auto_119938 ?auto_119937 ) ( ON ?auto_119939 ?auto_119938 ) ( ON ?auto_119941 ?auto_119939 ) ( CLEAR ?auto_119941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_119940 ?auto_119933 ?auto_119934 ?auto_119935 ?auto_119936 ?auto_119937 ?auto_119938 ?auto_119939 )
      ( MAKE-6PILE ?auto_119933 ?auto_119934 ?auto_119935 ?auto_119936 ?auto_119937 ?auto_119938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119953 - BLOCK
    )
    :vars
    (
      ?auto_119956 - BLOCK
      ?auto_119955 - BLOCK
      ?auto_119954 - BLOCK
      ?auto_119959 - BLOCK
      ?auto_119957 - BLOCK
      ?auto_119960 - BLOCK
      ?auto_119958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119956 ?auto_119953 ) ( ON-TABLE ?auto_119953 ) ( not ( = ?auto_119953 ?auto_119956 ) ) ( not ( = ?auto_119953 ?auto_119955 ) ) ( not ( = ?auto_119953 ?auto_119954 ) ) ( not ( = ?auto_119956 ?auto_119955 ) ) ( not ( = ?auto_119956 ?auto_119954 ) ) ( not ( = ?auto_119955 ?auto_119954 ) ) ( ON ?auto_119955 ?auto_119956 ) ( CLEAR ?auto_119955 ) ( HOLDING ?auto_119954 ) ( CLEAR ?auto_119959 ) ( ON-TABLE ?auto_119957 ) ( ON ?auto_119960 ?auto_119957 ) ( ON ?auto_119958 ?auto_119960 ) ( ON ?auto_119959 ?auto_119958 ) ( not ( = ?auto_119957 ?auto_119960 ) ) ( not ( = ?auto_119957 ?auto_119958 ) ) ( not ( = ?auto_119957 ?auto_119959 ) ) ( not ( = ?auto_119957 ?auto_119954 ) ) ( not ( = ?auto_119960 ?auto_119958 ) ) ( not ( = ?auto_119960 ?auto_119959 ) ) ( not ( = ?auto_119960 ?auto_119954 ) ) ( not ( = ?auto_119958 ?auto_119959 ) ) ( not ( = ?auto_119958 ?auto_119954 ) ) ( not ( = ?auto_119959 ?auto_119954 ) ) ( not ( = ?auto_119953 ?auto_119959 ) ) ( not ( = ?auto_119953 ?auto_119957 ) ) ( not ( = ?auto_119953 ?auto_119960 ) ) ( not ( = ?auto_119953 ?auto_119958 ) ) ( not ( = ?auto_119956 ?auto_119959 ) ) ( not ( = ?auto_119956 ?auto_119957 ) ) ( not ( = ?auto_119956 ?auto_119960 ) ) ( not ( = ?auto_119956 ?auto_119958 ) ) ( not ( = ?auto_119955 ?auto_119959 ) ) ( not ( = ?auto_119955 ?auto_119957 ) ) ( not ( = ?auto_119955 ?auto_119960 ) ) ( not ( = ?auto_119955 ?auto_119958 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119957 ?auto_119960 ?auto_119958 ?auto_119959 ?auto_119954 )
      ( MAKE-1PILE ?auto_119953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119961 - BLOCK
    )
    :vars
    (
      ?auto_119964 - BLOCK
      ?auto_119966 - BLOCK
      ?auto_119963 - BLOCK
      ?auto_119962 - BLOCK
      ?auto_119967 - BLOCK
      ?auto_119965 - BLOCK
      ?auto_119968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119964 ?auto_119961 ) ( ON-TABLE ?auto_119961 ) ( not ( = ?auto_119961 ?auto_119964 ) ) ( not ( = ?auto_119961 ?auto_119966 ) ) ( not ( = ?auto_119961 ?auto_119963 ) ) ( not ( = ?auto_119964 ?auto_119966 ) ) ( not ( = ?auto_119964 ?auto_119963 ) ) ( not ( = ?auto_119966 ?auto_119963 ) ) ( ON ?auto_119966 ?auto_119964 ) ( CLEAR ?auto_119962 ) ( ON-TABLE ?auto_119967 ) ( ON ?auto_119965 ?auto_119967 ) ( ON ?auto_119968 ?auto_119965 ) ( ON ?auto_119962 ?auto_119968 ) ( not ( = ?auto_119967 ?auto_119965 ) ) ( not ( = ?auto_119967 ?auto_119968 ) ) ( not ( = ?auto_119967 ?auto_119962 ) ) ( not ( = ?auto_119967 ?auto_119963 ) ) ( not ( = ?auto_119965 ?auto_119968 ) ) ( not ( = ?auto_119965 ?auto_119962 ) ) ( not ( = ?auto_119965 ?auto_119963 ) ) ( not ( = ?auto_119968 ?auto_119962 ) ) ( not ( = ?auto_119968 ?auto_119963 ) ) ( not ( = ?auto_119962 ?auto_119963 ) ) ( not ( = ?auto_119961 ?auto_119962 ) ) ( not ( = ?auto_119961 ?auto_119967 ) ) ( not ( = ?auto_119961 ?auto_119965 ) ) ( not ( = ?auto_119961 ?auto_119968 ) ) ( not ( = ?auto_119964 ?auto_119962 ) ) ( not ( = ?auto_119964 ?auto_119967 ) ) ( not ( = ?auto_119964 ?auto_119965 ) ) ( not ( = ?auto_119964 ?auto_119968 ) ) ( not ( = ?auto_119966 ?auto_119962 ) ) ( not ( = ?auto_119966 ?auto_119967 ) ) ( not ( = ?auto_119966 ?auto_119965 ) ) ( not ( = ?auto_119966 ?auto_119968 ) ) ( ON ?auto_119963 ?auto_119966 ) ( CLEAR ?auto_119963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119961 ?auto_119964 ?auto_119966 )
      ( MAKE-1PILE ?auto_119961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119969 - BLOCK
    )
    :vars
    (
      ?auto_119973 - BLOCK
      ?auto_119976 - BLOCK
      ?auto_119971 - BLOCK
      ?auto_119975 - BLOCK
      ?auto_119970 - BLOCK
      ?auto_119972 - BLOCK
      ?auto_119974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119973 ?auto_119969 ) ( ON-TABLE ?auto_119969 ) ( not ( = ?auto_119969 ?auto_119973 ) ) ( not ( = ?auto_119969 ?auto_119976 ) ) ( not ( = ?auto_119969 ?auto_119971 ) ) ( not ( = ?auto_119973 ?auto_119976 ) ) ( not ( = ?auto_119973 ?auto_119971 ) ) ( not ( = ?auto_119976 ?auto_119971 ) ) ( ON ?auto_119976 ?auto_119973 ) ( ON-TABLE ?auto_119975 ) ( ON ?auto_119970 ?auto_119975 ) ( ON ?auto_119972 ?auto_119970 ) ( not ( = ?auto_119975 ?auto_119970 ) ) ( not ( = ?auto_119975 ?auto_119972 ) ) ( not ( = ?auto_119975 ?auto_119974 ) ) ( not ( = ?auto_119975 ?auto_119971 ) ) ( not ( = ?auto_119970 ?auto_119972 ) ) ( not ( = ?auto_119970 ?auto_119974 ) ) ( not ( = ?auto_119970 ?auto_119971 ) ) ( not ( = ?auto_119972 ?auto_119974 ) ) ( not ( = ?auto_119972 ?auto_119971 ) ) ( not ( = ?auto_119974 ?auto_119971 ) ) ( not ( = ?auto_119969 ?auto_119974 ) ) ( not ( = ?auto_119969 ?auto_119975 ) ) ( not ( = ?auto_119969 ?auto_119970 ) ) ( not ( = ?auto_119969 ?auto_119972 ) ) ( not ( = ?auto_119973 ?auto_119974 ) ) ( not ( = ?auto_119973 ?auto_119975 ) ) ( not ( = ?auto_119973 ?auto_119970 ) ) ( not ( = ?auto_119973 ?auto_119972 ) ) ( not ( = ?auto_119976 ?auto_119974 ) ) ( not ( = ?auto_119976 ?auto_119975 ) ) ( not ( = ?auto_119976 ?auto_119970 ) ) ( not ( = ?auto_119976 ?auto_119972 ) ) ( ON ?auto_119971 ?auto_119976 ) ( CLEAR ?auto_119971 ) ( HOLDING ?auto_119974 ) ( CLEAR ?auto_119972 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119975 ?auto_119970 ?auto_119972 ?auto_119974 )
      ( MAKE-1PILE ?auto_119969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119977 - BLOCK
    )
    :vars
    (
      ?auto_119980 - BLOCK
      ?auto_119978 - BLOCK
      ?auto_119982 - BLOCK
      ?auto_119984 - BLOCK
      ?auto_119983 - BLOCK
      ?auto_119981 - BLOCK
      ?auto_119979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119980 ?auto_119977 ) ( ON-TABLE ?auto_119977 ) ( not ( = ?auto_119977 ?auto_119980 ) ) ( not ( = ?auto_119977 ?auto_119978 ) ) ( not ( = ?auto_119977 ?auto_119982 ) ) ( not ( = ?auto_119980 ?auto_119978 ) ) ( not ( = ?auto_119980 ?auto_119982 ) ) ( not ( = ?auto_119978 ?auto_119982 ) ) ( ON ?auto_119978 ?auto_119980 ) ( ON-TABLE ?auto_119984 ) ( ON ?auto_119983 ?auto_119984 ) ( ON ?auto_119981 ?auto_119983 ) ( not ( = ?auto_119984 ?auto_119983 ) ) ( not ( = ?auto_119984 ?auto_119981 ) ) ( not ( = ?auto_119984 ?auto_119979 ) ) ( not ( = ?auto_119984 ?auto_119982 ) ) ( not ( = ?auto_119983 ?auto_119981 ) ) ( not ( = ?auto_119983 ?auto_119979 ) ) ( not ( = ?auto_119983 ?auto_119982 ) ) ( not ( = ?auto_119981 ?auto_119979 ) ) ( not ( = ?auto_119981 ?auto_119982 ) ) ( not ( = ?auto_119979 ?auto_119982 ) ) ( not ( = ?auto_119977 ?auto_119979 ) ) ( not ( = ?auto_119977 ?auto_119984 ) ) ( not ( = ?auto_119977 ?auto_119983 ) ) ( not ( = ?auto_119977 ?auto_119981 ) ) ( not ( = ?auto_119980 ?auto_119979 ) ) ( not ( = ?auto_119980 ?auto_119984 ) ) ( not ( = ?auto_119980 ?auto_119983 ) ) ( not ( = ?auto_119980 ?auto_119981 ) ) ( not ( = ?auto_119978 ?auto_119979 ) ) ( not ( = ?auto_119978 ?auto_119984 ) ) ( not ( = ?auto_119978 ?auto_119983 ) ) ( not ( = ?auto_119978 ?auto_119981 ) ) ( ON ?auto_119982 ?auto_119978 ) ( CLEAR ?auto_119981 ) ( ON ?auto_119979 ?auto_119982 ) ( CLEAR ?auto_119979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119977 ?auto_119980 ?auto_119978 ?auto_119982 )
      ( MAKE-1PILE ?auto_119977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119985 - BLOCK
    )
    :vars
    (
      ?auto_119989 - BLOCK
      ?auto_119987 - BLOCK
      ?auto_119986 - BLOCK
      ?auto_119988 - BLOCK
      ?auto_119991 - BLOCK
      ?auto_119992 - BLOCK
      ?auto_119990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119989 ?auto_119985 ) ( ON-TABLE ?auto_119985 ) ( not ( = ?auto_119985 ?auto_119989 ) ) ( not ( = ?auto_119985 ?auto_119987 ) ) ( not ( = ?auto_119985 ?auto_119986 ) ) ( not ( = ?auto_119989 ?auto_119987 ) ) ( not ( = ?auto_119989 ?auto_119986 ) ) ( not ( = ?auto_119987 ?auto_119986 ) ) ( ON ?auto_119987 ?auto_119989 ) ( ON-TABLE ?auto_119988 ) ( ON ?auto_119991 ?auto_119988 ) ( not ( = ?auto_119988 ?auto_119991 ) ) ( not ( = ?auto_119988 ?auto_119992 ) ) ( not ( = ?auto_119988 ?auto_119990 ) ) ( not ( = ?auto_119988 ?auto_119986 ) ) ( not ( = ?auto_119991 ?auto_119992 ) ) ( not ( = ?auto_119991 ?auto_119990 ) ) ( not ( = ?auto_119991 ?auto_119986 ) ) ( not ( = ?auto_119992 ?auto_119990 ) ) ( not ( = ?auto_119992 ?auto_119986 ) ) ( not ( = ?auto_119990 ?auto_119986 ) ) ( not ( = ?auto_119985 ?auto_119990 ) ) ( not ( = ?auto_119985 ?auto_119988 ) ) ( not ( = ?auto_119985 ?auto_119991 ) ) ( not ( = ?auto_119985 ?auto_119992 ) ) ( not ( = ?auto_119989 ?auto_119990 ) ) ( not ( = ?auto_119989 ?auto_119988 ) ) ( not ( = ?auto_119989 ?auto_119991 ) ) ( not ( = ?auto_119989 ?auto_119992 ) ) ( not ( = ?auto_119987 ?auto_119990 ) ) ( not ( = ?auto_119987 ?auto_119988 ) ) ( not ( = ?auto_119987 ?auto_119991 ) ) ( not ( = ?auto_119987 ?auto_119992 ) ) ( ON ?auto_119986 ?auto_119987 ) ( ON ?auto_119990 ?auto_119986 ) ( CLEAR ?auto_119990 ) ( HOLDING ?auto_119992 ) ( CLEAR ?auto_119991 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119988 ?auto_119991 ?auto_119992 )
      ( MAKE-1PILE ?auto_119985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119993 - BLOCK
    )
    :vars
    (
      ?auto_119999 - BLOCK
      ?auto_120000 - BLOCK
      ?auto_119997 - BLOCK
      ?auto_119998 - BLOCK
      ?auto_119994 - BLOCK
      ?auto_119995 - BLOCK
      ?auto_119996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119999 ?auto_119993 ) ( ON-TABLE ?auto_119993 ) ( not ( = ?auto_119993 ?auto_119999 ) ) ( not ( = ?auto_119993 ?auto_120000 ) ) ( not ( = ?auto_119993 ?auto_119997 ) ) ( not ( = ?auto_119999 ?auto_120000 ) ) ( not ( = ?auto_119999 ?auto_119997 ) ) ( not ( = ?auto_120000 ?auto_119997 ) ) ( ON ?auto_120000 ?auto_119999 ) ( ON-TABLE ?auto_119998 ) ( ON ?auto_119994 ?auto_119998 ) ( not ( = ?auto_119998 ?auto_119994 ) ) ( not ( = ?auto_119998 ?auto_119995 ) ) ( not ( = ?auto_119998 ?auto_119996 ) ) ( not ( = ?auto_119998 ?auto_119997 ) ) ( not ( = ?auto_119994 ?auto_119995 ) ) ( not ( = ?auto_119994 ?auto_119996 ) ) ( not ( = ?auto_119994 ?auto_119997 ) ) ( not ( = ?auto_119995 ?auto_119996 ) ) ( not ( = ?auto_119995 ?auto_119997 ) ) ( not ( = ?auto_119996 ?auto_119997 ) ) ( not ( = ?auto_119993 ?auto_119996 ) ) ( not ( = ?auto_119993 ?auto_119998 ) ) ( not ( = ?auto_119993 ?auto_119994 ) ) ( not ( = ?auto_119993 ?auto_119995 ) ) ( not ( = ?auto_119999 ?auto_119996 ) ) ( not ( = ?auto_119999 ?auto_119998 ) ) ( not ( = ?auto_119999 ?auto_119994 ) ) ( not ( = ?auto_119999 ?auto_119995 ) ) ( not ( = ?auto_120000 ?auto_119996 ) ) ( not ( = ?auto_120000 ?auto_119998 ) ) ( not ( = ?auto_120000 ?auto_119994 ) ) ( not ( = ?auto_120000 ?auto_119995 ) ) ( ON ?auto_119997 ?auto_120000 ) ( ON ?auto_119996 ?auto_119997 ) ( CLEAR ?auto_119994 ) ( ON ?auto_119995 ?auto_119996 ) ( CLEAR ?auto_119995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119993 ?auto_119999 ?auto_120000 ?auto_119997 ?auto_119996 )
      ( MAKE-1PILE ?auto_119993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120001 - BLOCK
    )
    :vars
    (
      ?auto_120007 - BLOCK
      ?auto_120003 - BLOCK
      ?auto_120006 - BLOCK
      ?auto_120002 - BLOCK
      ?auto_120008 - BLOCK
      ?auto_120004 - BLOCK
      ?auto_120005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120007 ?auto_120001 ) ( ON-TABLE ?auto_120001 ) ( not ( = ?auto_120001 ?auto_120007 ) ) ( not ( = ?auto_120001 ?auto_120003 ) ) ( not ( = ?auto_120001 ?auto_120006 ) ) ( not ( = ?auto_120007 ?auto_120003 ) ) ( not ( = ?auto_120007 ?auto_120006 ) ) ( not ( = ?auto_120003 ?auto_120006 ) ) ( ON ?auto_120003 ?auto_120007 ) ( ON-TABLE ?auto_120002 ) ( not ( = ?auto_120002 ?auto_120008 ) ) ( not ( = ?auto_120002 ?auto_120004 ) ) ( not ( = ?auto_120002 ?auto_120005 ) ) ( not ( = ?auto_120002 ?auto_120006 ) ) ( not ( = ?auto_120008 ?auto_120004 ) ) ( not ( = ?auto_120008 ?auto_120005 ) ) ( not ( = ?auto_120008 ?auto_120006 ) ) ( not ( = ?auto_120004 ?auto_120005 ) ) ( not ( = ?auto_120004 ?auto_120006 ) ) ( not ( = ?auto_120005 ?auto_120006 ) ) ( not ( = ?auto_120001 ?auto_120005 ) ) ( not ( = ?auto_120001 ?auto_120002 ) ) ( not ( = ?auto_120001 ?auto_120008 ) ) ( not ( = ?auto_120001 ?auto_120004 ) ) ( not ( = ?auto_120007 ?auto_120005 ) ) ( not ( = ?auto_120007 ?auto_120002 ) ) ( not ( = ?auto_120007 ?auto_120008 ) ) ( not ( = ?auto_120007 ?auto_120004 ) ) ( not ( = ?auto_120003 ?auto_120005 ) ) ( not ( = ?auto_120003 ?auto_120002 ) ) ( not ( = ?auto_120003 ?auto_120008 ) ) ( not ( = ?auto_120003 ?auto_120004 ) ) ( ON ?auto_120006 ?auto_120003 ) ( ON ?auto_120005 ?auto_120006 ) ( ON ?auto_120004 ?auto_120005 ) ( CLEAR ?auto_120004 ) ( HOLDING ?auto_120008 ) ( CLEAR ?auto_120002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120002 ?auto_120008 )
      ( MAKE-1PILE ?auto_120001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120009 - BLOCK
    )
    :vars
    (
      ?auto_120014 - BLOCK
      ?auto_120011 - BLOCK
      ?auto_120015 - BLOCK
      ?auto_120016 - BLOCK
      ?auto_120013 - BLOCK
      ?auto_120010 - BLOCK
      ?auto_120012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120014 ?auto_120009 ) ( ON-TABLE ?auto_120009 ) ( not ( = ?auto_120009 ?auto_120014 ) ) ( not ( = ?auto_120009 ?auto_120011 ) ) ( not ( = ?auto_120009 ?auto_120015 ) ) ( not ( = ?auto_120014 ?auto_120011 ) ) ( not ( = ?auto_120014 ?auto_120015 ) ) ( not ( = ?auto_120011 ?auto_120015 ) ) ( ON ?auto_120011 ?auto_120014 ) ( ON-TABLE ?auto_120016 ) ( not ( = ?auto_120016 ?auto_120013 ) ) ( not ( = ?auto_120016 ?auto_120010 ) ) ( not ( = ?auto_120016 ?auto_120012 ) ) ( not ( = ?auto_120016 ?auto_120015 ) ) ( not ( = ?auto_120013 ?auto_120010 ) ) ( not ( = ?auto_120013 ?auto_120012 ) ) ( not ( = ?auto_120013 ?auto_120015 ) ) ( not ( = ?auto_120010 ?auto_120012 ) ) ( not ( = ?auto_120010 ?auto_120015 ) ) ( not ( = ?auto_120012 ?auto_120015 ) ) ( not ( = ?auto_120009 ?auto_120012 ) ) ( not ( = ?auto_120009 ?auto_120016 ) ) ( not ( = ?auto_120009 ?auto_120013 ) ) ( not ( = ?auto_120009 ?auto_120010 ) ) ( not ( = ?auto_120014 ?auto_120012 ) ) ( not ( = ?auto_120014 ?auto_120016 ) ) ( not ( = ?auto_120014 ?auto_120013 ) ) ( not ( = ?auto_120014 ?auto_120010 ) ) ( not ( = ?auto_120011 ?auto_120012 ) ) ( not ( = ?auto_120011 ?auto_120016 ) ) ( not ( = ?auto_120011 ?auto_120013 ) ) ( not ( = ?auto_120011 ?auto_120010 ) ) ( ON ?auto_120015 ?auto_120011 ) ( ON ?auto_120012 ?auto_120015 ) ( ON ?auto_120010 ?auto_120012 ) ( CLEAR ?auto_120016 ) ( ON ?auto_120013 ?auto_120010 ) ( CLEAR ?auto_120013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120009 ?auto_120014 ?auto_120011 ?auto_120015 ?auto_120012 ?auto_120010 )
      ( MAKE-1PILE ?auto_120009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120017 - BLOCK
    )
    :vars
    (
      ?auto_120020 - BLOCK
      ?auto_120021 - BLOCK
      ?auto_120018 - BLOCK
      ?auto_120022 - BLOCK
      ?auto_120023 - BLOCK
      ?auto_120024 - BLOCK
      ?auto_120019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120020 ?auto_120017 ) ( ON-TABLE ?auto_120017 ) ( not ( = ?auto_120017 ?auto_120020 ) ) ( not ( = ?auto_120017 ?auto_120021 ) ) ( not ( = ?auto_120017 ?auto_120018 ) ) ( not ( = ?auto_120020 ?auto_120021 ) ) ( not ( = ?auto_120020 ?auto_120018 ) ) ( not ( = ?auto_120021 ?auto_120018 ) ) ( ON ?auto_120021 ?auto_120020 ) ( not ( = ?auto_120022 ?auto_120023 ) ) ( not ( = ?auto_120022 ?auto_120024 ) ) ( not ( = ?auto_120022 ?auto_120019 ) ) ( not ( = ?auto_120022 ?auto_120018 ) ) ( not ( = ?auto_120023 ?auto_120024 ) ) ( not ( = ?auto_120023 ?auto_120019 ) ) ( not ( = ?auto_120023 ?auto_120018 ) ) ( not ( = ?auto_120024 ?auto_120019 ) ) ( not ( = ?auto_120024 ?auto_120018 ) ) ( not ( = ?auto_120019 ?auto_120018 ) ) ( not ( = ?auto_120017 ?auto_120019 ) ) ( not ( = ?auto_120017 ?auto_120022 ) ) ( not ( = ?auto_120017 ?auto_120023 ) ) ( not ( = ?auto_120017 ?auto_120024 ) ) ( not ( = ?auto_120020 ?auto_120019 ) ) ( not ( = ?auto_120020 ?auto_120022 ) ) ( not ( = ?auto_120020 ?auto_120023 ) ) ( not ( = ?auto_120020 ?auto_120024 ) ) ( not ( = ?auto_120021 ?auto_120019 ) ) ( not ( = ?auto_120021 ?auto_120022 ) ) ( not ( = ?auto_120021 ?auto_120023 ) ) ( not ( = ?auto_120021 ?auto_120024 ) ) ( ON ?auto_120018 ?auto_120021 ) ( ON ?auto_120019 ?auto_120018 ) ( ON ?auto_120024 ?auto_120019 ) ( ON ?auto_120023 ?auto_120024 ) ( CLEAR ?auto_120023 ) ( HOLDING ?auto_120022 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120022 )
      ( MAKE-1PILE ?auto_120017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120034 - BLOCK
    )
    :vars
    (
      ?auto_120037 - BLOCK
      ?auto_120038 - BLOCK
      ?auto_120041 - BLOCK
      ?auto_120040 - BLOCK
      ?auto_120036 - BLOCK
      ?auto_120035 - BLOCK
      ?auto_120039 - BLOCK
      ?auto_120042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120037 ?auto_120034 ) ( ON-TABLE ?auto_120034 ) ( not ( = ?auto_120034 ?auto_120037 ) ) ( not ( = ?auto_120034 ?auto_120038 ) ) ( not ( = ?auto_120034 ?auto_120041 ) ) ( not ( = ?auto_120037 ?auto_120038 ) ) ( not ( = ?auto_120037 ?auto_120041 ) ) ( not ( = ?auto_120038 ?auto_120041 ) ) ( ON ?auto_120038 ?auto_120037 ) ( not ( = ?auto_120040 ?auto_120036 ) ) ( not ( = ?auto_120040 ?auto_120035 ) ) ( not ( = ?auto_120040 ?auto_120039 ) ) ( not ( = ?auto_120040 ?auto_120041 ) ) ( not ( = ?auto_120036 ?auto_120035 ) ) ( not ( = ?auto_120036 ?auto_120039 ) ) ( not ( = ?auto_120036 ?auto_120041 ) ) ( not ( = ?auto_120035 ?auto_120039 ) ) ( not ( = ?auto_120035 ?auto_120041 ) ) ( not ( = ?auto_120039 ?auto_120041 ) ) ( not ( = ?auto_120034 ?auto_120039 ) ) ( not ( = ?auto_120034 ?auto_120040 ) ) ( not ( = ?auto_120034 ?auto_120036 ) ) ( not ( = ?auto_120034 ?auto_120035 ) ) ( not ( = ?auto_120037 ?auto_120039 ) ) ( not ( = ?auto_120037 ?auto_120040 ) ) ( not ( = ?auto_120037 ?auto_120036 ) ) ( not ( = ?auto_120037 ?auto_120035 ) ) ( not ( = ?auto_120038 ?auto_120039 ) ) ( not ( = ?auto_120038 ?auto_120040 ) ) ( not ( = ?auto_120038 ?auto_120036 ) ) ( not ( = ?auto_120038 ?auto_120035 ) ) ( ON ?auto_120041 ?auto_120038 ) ( ON ?auto_120039 ?auto_120041 ) ( ON ?auto_120035 ?auto_120039 ) ( ON ?auto_120036 ?auto_120035 ) ( CLEAR ?auto_120036 ) ( ON ?auto_120040 ?auto_120042 ) ( CLEAR ?auto_120040 ) ( HAND-EMPTY ) ( not ( = ?auto_120034 ?auto_120042 ) ) ( not ( = ?auto_120037 ?auto_120042 ) ) ( not ( = ?auto_120038 ?auto_120042 ) ) ( not ( = ?auto_120041 ?auto_120042 ) ) ( not ( = ?auto_120040 ?auto_120042 ) ) ( not ( = ?auto_120036 ?auto_120042 ) ) ( not ( = ?auto_120035 ?auto_120042 ) ) ( not ( = ?auto_120039 ?auto_120042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120040 ?auto_120042 )
      ( MAKE-1PILE ?auto_120034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120043 - BLOCK
    )
    :vars
    (
      ?auto_120048 - BLOCK
      ?auto_120044 - BLOCK
      ?auto_120047 - BLOCK
      ?auto_120051 - BLOCK
      ?auto_120050 - BLOCK
      ?auto_120049 - BLOCK
      ?auto_120046 - BLOCK
      ?auto_120045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120048 ?auto_120043 ) ( ON-TABLE ?auto_120043 ) ( not ( = ?auto_120043 ?auto_120048 ) ) ( not ( = ?auto_120043 ?auto_120044 ) ) ( not ( = ?auto_120043 ?auto_120047 ) ) ( not ( = ?auto_120048 ?auto_120044 ) ) ( not ( = ?auto_120048 ?auto_120047 ) ) ( not ( = ?auto_120044 ?auto_120047 ) ) ( ON ?auto_120044 ?auto_120048 ) ( not ( = ?auto_120051 ?auto_120050 ) ) ( not ( = ?auto_120051 ?auto_120049 ) ) ( not ( = ?auto_120051 ?auto_120046 ) ) ( not ( = ?auto_120051 ?auto_120047 ) ) ( not ( = ?auto_120050 ?auto_120049 ) ) ( not ( = ?auto_120050 ?auto_120046 ) ) ( not ( = ?auto_120050 ?auto_120047 ) ) ( not ( = ?auto_120049 ?auto_120046 ) ) ( not ( = ?auto_120049 ?auto_120047 ) ) ( not ( = ?auto_120046 ?auto_120047 ) ) ( not ( = ?auto_120043 ?auto_120046 ) ) ( not ( = ?auto_120043 ?auto_120051 ) ) ( not ( = ?auto_120043 ?auto_120050 ) ) ( not ( = ?auto_120043 ?auto_120049 ) ) ( not ( = ?auto_120048 ?auto_120046 ) ) ( not ( = ?auto_120048 ?auto_120051 ) ) ( not ( = ?auto_120048 ?auto_120050 ) ) ( not ( = ?auto_120048 ?auto_120049 ) ) ( not ( = ?auto_120044 ?auto_120046 ) ) ( not ( = ?auto_120044 ?auto_120051 ) ) ( not ( = ?auto_120044 ?auto_120050 ) ) ( not ( = ?auto_120044 ?auto_120049 ) ) ( ON ?auto_120047 ?auto_120044 ) ( ON ?auto_120046 ?auto_120047 ) ( ON ?auto_120049 ?auto_120046 ) ( ON ?auto_120051 ?auto_120045 ) ( CLEAR ?auto_120051 ) ( not ( = ?auto_120043 ?auto_120045 ) ) ( not ( = ?auto_120048 ?auto_120045 ) ) ( not ( = ?auto_120044 ?auto_120045 ) ) ( not ( = ?auto_120047 ?auto_120045 ) ) ( not ( = ?auto_120051 ?auto_120045 ) ) ( not ( = ?auto_120050 ?auto_120045 ) ) ( not ( = ?auto_120049 ?auto_120045 ) ) ( not ( = ?auto_120046 ?auto_120045 ) ) ( HOLDING ?auto_120050 ) ( CLEAR ?auto_120049 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120043 ?auto_120048 ?auto_120044 ?auto_120047 ?auto_120046 ?auto_120049 ?auto_120050 )
      ( MAKE-1PILE ?auto_120043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120052 - BLOCK
    )
    :vars
    (
      ?auto_120055 - BLOCK
      ?auto_120056 - BLOCK
      ?auto_120060 - BLOCK
      ?auto_120057 - BLOCK
      ?auto_120054 - BLOCK
      ?auto_120059 - BLOCK
      ?auto_120053 - BLOCK
      ?auto_120058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120055 ?auto_120052 ) ( ON-TABLE ?auto_120052 ) ( not ( = ?auto_120052 ?auto_120055 ) ) ( not ( = ?auto_120052 ?auto_120056 ) ) ( not ( = ?auto_120052 ?auto_120060 ) ) ( not ( = ?auto_120055 ?auto_120056 ) ) ( not ( = ?auto_120055 ?auto_120060 ) ) ( not ( = ?auto_120056 ?auto_120060 ) ) ( ON ?auto_120056 ?auto_120055 ) ( not ( = ?auto_120057 ?auto_120054 ) ) ( not ( = ?auto_120057 ?auto_120059 ) ) ( not ( = ?auto_120057 ?auto_120053 ) ) ( not ( = ?auto_120057 ?auto_120060 ) ) ( not ( = ?auto_120054 ?auto_120059 ) ) ( not ( = ?auto_120054 ?auto_120053 ) ) ( not ( = ?auto_120054 ?auto_120060 ) ) ( not ( = ?auto_120059 ?auto_120053 ) ) ( not ( = ?auto_120059 ?auto_120060 ) ) ( not ( = ?auto_120053 ?auto_120060 ) ) ( not ( = ?auto_120052 ?auto_120053 ) ) ( not ( = ?auto_120052 ?auto_120057 ) ) ( not ( = ?auto_120052 ?auto_120054 ) ) ( not ( = ?auto_120052 ?auto_120059 ) ) ( not ( = ?auto_120055 ?auto_120053 ) ) ( not ( = ?auto_120055 ?auto_120057 ) ) ( not ( = ?auto_120055 ?auto_120054 ) ) ( not ( = ?auto_120055 ?auto_120059 ) ) ( not ( = ?auto_120056 ?auto_120053 ) ) ( not ( = ?auto_120056 ?auto_120057 ) ) ( not ( = ?auto_120056 ?auto_120054 ) ) ( not ( = ?auto_120056 ?auto_120059 ) ) ( ON ?auto_120060 ?auto_120056 ) ( ON ?auto_120053 ?auto_120060 ) ( ON ?auto_120059 ?auto_120053 ) ( ON ?auto_120057 ?auto_120058 ) ( not ( = ?auto_120052 ?auto_120058 ) ) ( not ( = ?auto_120055 ?auto_120058 ) ) ( not ( = ?auto_120056 ?auto_120058 ) ) ( not ( = ?auto_120060 ?auto_120058 ) ) ( not ( = ?auto_120057 ?auto_120058 ) ) ( not ( = ?auto_120054 ?auto_120058 ) ) ( not ( = ?auto_120059 ?auto_120058 ) ) ( not ( = ?auto_120053 ?auto_120058 ) ) ( CLEAR ?auto_120059 ) ( ON ?auto_120054 ?auto_120057 ) ( CLEAR ?auto_120054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120058 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120058 ?auto_120057 )
      ( MAKE-1PILE ?auto_120052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120061 - BLOCK
    )
    :vars
    (
      ?auto_120069 - BLOCK
      ?auto_120064 - BLOCK
      ?auto_120063 - BLOCK
      ?auto_120067 - BLOCK
      ?auto_120068 - BLOCK
      ?auto_120065 - BLOCK
      ?auto_120062 - BLOCK
      ?auto_120066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120069 ?auto_120061 ) ( ON-TABLE ?auto_120061 ) ( not ( = ?auto_120061 ?auto_120069 ) ) ( not ( = ?auto_120061 ?auto_120064 ) ) ( not ( = ?auto_120061 ?auto_120063 ) ) ( not ( = ?auto_120069 ?auto_120064 ) ) ( not ( = ?auto_120069 ?auto_120063 ) ) ( not ( = ?auto_120064 ?auto_120063 ) ) ( ON ?auto_120064 ?auto_120069 ) ( not ( = ?auto_120067 ?auto_120068 ) ) ( not ( = ?auto_120067 ?auto_120065 ) ) ( not ( = ?auto_120067 ?auto_120062 ) ) ( not ( = ?auto_120067 ?auto_120063 ) ) ( not ( = ?auto_120068 ?auto_120065 ) ) ( not ( = ?auto_120068 ?auto_120062 ) ) ( not ( = ?auto_120068 ?auto_120063 ) ) ( not ( = ?auto_120065 ?auto_120062 ) ) ( not ( = ?auto_120065 ?auto_120063 ) ) ( not ( = ?auto_120062 ?auto_120063 ) ) ( not ( = ?auto_120061 ?auto_120062 ) ) ( not ( = ?auto_120061 ?auto_120067 ) ) ( not ( = ?auto_120061 ?auto_120068 ) ) ( not ( = ?auto_120061 ?auto_120065 ) ) ( not ( = ?auto_120069 ?auto_120062 ) ) ( not ( = ?auto_120069 ?auto_120067 ) ) ( not ( = ?auto_120069 ?auto_120068 ) ) ( not ( = ?auto_120069 ?auto_120065 ) ) ( not ( = ?auto_120064 ?auto_120062 ) ) ( not ( = ?auto_120064 ?auto_120067 ) ) ( not ( = ?auto_120064 ?auto_120068 ) ) ( not ( = ?auto_120064 ?auto_120065 ) ) ( ON ?auto_120063 ?auto_120064 ) ( ON ?auto_120062 ?auto_120063 ) ( ON ?auto_120067 ?auto_120066 ) ( not ( = ?auto_120061 ?auto_120066 ) ) ( not ( = ?auto_120069 ?auto_120066 ) ) ( not ( = ?auto_120064 ?auto_120066 ) ) ( not ( = ?auto_120063 ?auto_120066 ) ) ( not ( = ?auto_120067 ?auto_120066 ) ) ( not ( = ?auto_120068 ?auto_120066 ) ) ( not ( = ?auto_120065 ?auto_120066 ) ) ( not ( = ?auto_120062 ?auto_120066 ) ) ( ON ?auto_120068 ?auto_120067 ) ( CLEAR ?auto_120068 ) ( ON-TABLE ?auto_120066 ) ( HOLDING ?auto_120065 ) ( CLEAR ?auto_120062 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120061 ?auto_120069 ?auto_120064 ?auto_120063 ?auto_120062 ?auto_120065 )
      ( MAKE-1PILE ?auto_120061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120070 - BLOCK
    )
    :vars
    (
      ?auto_120077 - BLOCK
      ?auto_120074 - BLOCK
      ?auto_120076 - BLOCK
      ?auto_120072 - BLOCK
      ?auto_120071 - BLOCK
      ?auto_120078 - BLOCK
      ?auto_120075 - BLOCK
      ?auto_120073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120077 ?auto_120070 ) ( ON-TABLE ?auto_120070 ) ( not ( = ?auto_120070 ?auto_120077 ) ) ( not ( = ?auto_120070 ?auto_120074 ) ) ( not ( = ?auto_120070 ?auto_120076 ) ) ( not ( = ?auto_120077 ?auto_120074 ) ) ( not ( = ?auto_120077 ?auto_120076 ) ) ( not ( = ?auto_120074 ?auto_120076 ) ) ( ON ?auto_120074 ?auto_120077 ) ( not ( = ?auto_120072 ?auto_120071 ) ) ( not ( = ?auto_120072 ?auto_120078 ) ) ( not ( = ?auto_120072 ?auto_120075 ) ) ( not ( = ?auto_120072 ?auto_120076 ) ) ( not ( = ?auto_120071 ?auto_120078 ) ) ( not ( = ?auto_120071 ?auto_120075 ) ) ( not ( = ?auto_120071 ?auto_120076 ) ) ( not ( = ?auto_120078 ?auto_120075 ) ) ( not ( = ?auto_120078 ?auto_120076 ) ) ( not ( = ?auto_120075 ?auto_120076 ) ) ( not ( = ?auto_120070 ?auto_120075 ) ) ( not ( = ?auto_120070 ?auto_120072 ) ) ( not ( = ?auto_120070 ?auto_120071 ) ) ( not ( = ?auto_120070 ?auto_120078 ) ) ( not ( = ?auto_120077 ?auto_120075 ) ) ( not ( = ?auto_120077 ?auto_120072 ) ) ( not ( = ?auto_120077 ?auto_120071 ) ) ( not ( = ?auto_120077 ?auto_120078 ) ) ( not ( = ?auto_120074 ?auto_120075 ) ) ( not ( = ?auto_120074 ?auto_120072 ) ) ( not ( = ?auto_120074 ?auto_120071 ) ) ( not ( = ?auto_120074 ?auto_120078 ) ) ( ON ?auto_120076 ?auto_120074 ) ( ON ?auto_120075 ?auto_120076 ) ( ON ?auto_120072 ?auto_120073 ) ( not ( = ?auto_120070 ?auto_120073 ) ) ( not ( = ?auto_120077 ?auto_120073 ) ) ( not ( = ?auto_120074 ?auto_120073 ) ) ( not ( = ?auto_120076 ?auto_120073 ) ) ( not ( = ?auto_120072 ?auto_120073 ) ) ( not ( = ?auto_120071 ?auto_120073 ) ) ( not ( = ?auto_120078 ?auto_120073 ) ) ( not ( = ?auto_120075 ?auto_120073 ) ) ( ON ?auto_120071 ?auto_120072 ) ( ON-TABLE ?auto_120073 ) ( CLEAR ?auto_120075 ) ( ON ?auto_120078 ?auto_120071 ) ( CLEAR ?auto_120078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120073 ?auto_120072 ?auto_120071 )
      ( MAKE-1PILE ?auto_120070 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120122 - BLOCK
      ?auto_120123 - BLOCK
      ?auto_120124 - BLOCK
      ?auto_120125 - BLOCK
      ?auto_120126 - BLOCK
      ?auto_120127 - BLOCK
      ?auto_120128 - BLOCK
    )
    :vars
    (
      ?auto_120129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120122 ) ( ON ?auto_120123 ?auto_120122 ) ( ON ?auto_120124 ?auto_120123 ) ( ON ?auto_120125 ?auto_120124 ) ( ON ?auto_120126 ?auto_120125 ) ( not ( = ?auto_120122 ?auto_120123 ) ) ( not ( = ?auto_120122 ?auto_120124 ) ) ( not ( = ?auto_120122 ?auto_120125 ) ) ( not ( = ?auto_120122 ?auto_120126 ) ) ( not ( = ?auto_120122 ?auto_120127 ) ) ( not ( = ?auto_120122 ?auto_120128 ) ) ( not ( = ?auto_120123 ?auto_120124 ) ) ( not ( = ?auto_120123 ?auto_120125 ) ) ( not ( = ?auto_120123 ?auto_120126 ) ) ( not ( = ?auto_120123 ?auto_120127 ) ) ( not ( = ?auto_120123 ?auto_120128 ) ) ( not ( = ?auto_120124 ?auto_120125 ) ) ( not ( = ?auto_120124 ?auto_120126 ) ) ( not ( = ?auto_120124 ?auto_120127 ) ) ( not ( = ?auto_120124 ?auto_120128 ) ) ( not ( = ?auto_120125 ?auto_120126 ) ) ( not ( = ?auto_120125 ?auto_120127 ) ) ( not ( = ?auto_120125 ?auto_120128 ) ) ( not ( = ?auto_120126 ?auto_120127 ) ) ( not ( = ?auto_120126 ?auto_120128 ) ) ( not ( = ?auto_120127 ?auto_120128 ) ) ( ON ?auto_120128 ?auto_120129 ) ( not ( = ?auto_120122 ?auto_120129 ) ) ( not ( = ?auto_120123 ?auto_120129 ) ) ( not ( = ?auto_120124 ?auto_120129 ) ) ( not ( = ?auto_120125 ?auto_120129 ) ) ( not ( = ?auto_120126 ?auto_120129 ) ) ( not ( = ?auto_120127 ?auto_120129 ) ) ( not ( = ?auto_120128 ?auto_120129 ) ) ( CLEAR ?auto_120126 ) ( ON ?auto_120127 ?auto_120128 ) ( CLEAR ?auto_120127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120129 ?auto_120128 )
      ( MAKE-7PILE ?auto_120122 ?auto_120123 ?auto_120124 ?auto_120125 ?auto_120126 ?auto_120127 ?auto_120128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120130 - BLOCK
      ?auto_120131 - BLOCK
      ?auto_120132 - BLOCK
      ?auto_120133 - BLOCK
      ?auto_120134 - BLOCK
      ?auto_120135 - BLOCK
      ?auto_120136 - BLOCK
    )
    :vars
    (
      ?auto_120137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120130 ) ( ON ?auto_120131 ?auto_120130 ) ( ON ?auto_120132 ?auto_120131 ) ( ON ?auto_120133 ?auto_120132 ) ( not ( = ?auto_120130 ?auto_120131 ) ) ( not ( = ?auto_120130 ?auto_120132 ) ) ( not ( = ?auto_120130 ?auto_120133 ) ) ( not ( = ?auto_120130 ?auto_120134 ) ) ( not ( = ?auto_120130 ?auto_120135 ) ) ( not ( = ?auto_120130 ?auto_120136 ) ) ( not ( = ?auto_120131 ?auto_120132 ) ) ( not ( = ?auto_120131 ?auto_120133 ) ) ( not ( = ?auto_120131 ?auto_120134 ) ) ( not ( = ?auto_120131 ?auto_120135 ) ) ( not ( = ?auto_120131 ?auto_120136 ) ) ( not ( = ?auto_120132 ?auto_120133 ) ) ( not ( = ?auto_120132 ?auto_120134 ) ) ( not ( = ?auto_120132 ?auto_120135 ) ) ( not ( = ?auto_120132 ?auto_120136 ) ) ( not ( = ?auto_120133 ?auto_120134 ) ) ( not ( = ?auto_120133 ?auto_120135 ) ) ( not ( = ?auto_120133 ?auto_120136 ) ) ( not ( = ?auto_120134 ?auto_120135 ) ) ( not ( = ?auto_120134 ?auto_120136 ) ) ( not ( = ?auto_120135 ?auto_120136 ) ) ( ON ?auto_120136 ?auto_120137 ) ( not ( = ?auto_120130 ?auto_120137 ) ) ( not ( = ?auto_120131 ?auto_120137 ) ) ( not ( = ?auto_120132 ?auto_120137 ) ) ( not ( = ?auto_120133 ?auto_120137 ) ) ( not ( = ?auto_120134 ?auto_120137 ) ) ( not ( = ?auto_120135 ?auto_120137 ) ) ( not ( = ?auto_120136 ?auto_120137 ) ) ( ON ?auto_120135 ?auto_120136 ) ( CLEAR ?auto_120135 ) ( ON-TABLE ?auto_120137 ) ( HOLDING ?auto_120134 ) ( CLEAR ?auto_120133 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120130 ?auto_120131 ?auto_120132 ?auto_120133 ?auto_120134 )
      ( MAKE-7PILE ?auto_120130 ?auto_120131 ?auto_120132 ?auto_120133 ?auto_120134 ?auto_120135 ?auto_120136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120138 - BLOCK
      ?auto_120139 - BLOCK
      ?auto_120140 - BLOCK
      ?auto_120141 - BLOCK
      ?auto_120142 - BLOCK
      ?auto_120143 - BLOCK
      ?auto_120144 - BLOCK
    )
    :vars
    (
      ?auto_120145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120138 ) ( ON ?auto_120139 ?auto_120138 ) ( ON ?auto_120140 ?auto_120139 ) ( ON ?auto_120141 ?auto_120140 ) ( not ( = ?auto_120138 ?auto_120139 ) ) ( not ( = ?auto_120138 ?auto_120140 ) ) ( not ( = ?auto_120138 ?auto_120141 ) ) ( not ( = ?auto_120138 ?auto_120142 ) ) ( not ( = ?auto_120138 ?auto_120143 ) ) ( not ( = ?auto_120138 ?auto_120144 ) ) ( not ( = ?auto_120139 ?auto_120140 ) ) ( not ( = ?auto_120139 ?auto_120141 ) ) ( not ( = ?auto_120139 ?auto_120142 ) ) ( not ( = ?auto_120139 ?auto_120143 ) ) ( not ( = ?auto_120139 ?auto_120144 ) ) ( not ( = ?auto_120140 ?auto_120141 ) ) ( not ( = ?auto_120140 ?auto_120142 ) ) ( not ( = ?auto_120140 ?auto_120143 ) ) ( not ( = ?auto_120140 ?auto_120144 ) ) ( not ( = ?auto_120141 ?auto_120142 ) ) ( not ( = ?auto_120141 ?auto_120143 ) ) ( not ( = ?auto_120141 ?auto_120144 ) ) ( not ( = ?auto_120142 ?auto_120143 ) ) ( not ( = ?auto_120142 ?auto_120144 ) ) ( not ( = ?auto_120143 ?auto_120144 ) ) ( ON ?auto_120144 ?auto_120145 ) ( not ( = ?auto_120138 ?auto_120145 ) ) ( not ( = ?auto_120139 ?auto_120145 ) ) ( not ( = ?auto_120140 ?auto_120145 ) ) ( not ( = ?auto_120141 ?auto_120145 ) ) ( not ( = ?auto_120142 ?auto_120145 ) ) ( not ( = ?auto_120143 ?auto_120145 ) ) ( not ( = ?auto_120144 ?auto_120145 ) ) ( ON ?auto_120143 ?auto_120144 ) ( ON-TABLE ?auto_120145 ) ( CLEAR ?auto_120141 ) ( ON ?auto_120142 ?auto_120143 ) ( CLEAR ?auto_120142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120145 ?auto_120144 ?auto_120143 )
      ( MAKE-7PILE ?auto_120138 ?auto_120139 ?auto_120140 ?auto_120141 ?auto_120142 ?auto_120143 ?auto_120144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120146 - BLOCK
      ?auto_120147 - BLOCK
      ?auto_120148 - BLOCK
      ?auto_120149 - BLOCK
      ?auto_120150 - BLOCK
      ?auto_120151 - BLOCK
      ?auto_120152 - BLOCK
    )
    :vars
    (
      ?auto_120153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120146 ) ( ON ?auto_120147 ?auto_120146 ) ( ON ?auto_120148 ?auto_120147 ) ( not ( = ?auto_120146 ?auto_120147 ) ) ( not ( = ?auto_120146 ?auto_120148 ) ) ( not ( = ?auto_120146 ?auto_120149 ) ) ( not ( = ?auto_120146 ?auto_120150 ) ) ( not ( = ?auto_120146 ?auto_120151 ) ) ( not ( = ?auto_120146 ?auto_120152 ) ) ( not ( = ?auto_120147 ?auto_120148 ) ) ( not ( = ?auto_120147 ?auto_120149 ) ) ( not ( = ?auto_120147 ?auto_120150 ) ) ( not ( = ?auto_120147 ?auto_120151 ) ) ( not ( = ?auto_120147 ?auto_120152 ) ) ( not ( = ?auto_120148 ?auto_120149 ) ) ( not ( = ?auto_120148 ?auto_120150 ) ) ( not ( = ?auto_120148 ?auto_120151 ) ) ( not ( = ?auto_120148 ?auto_120152 ) ) ( not ( = ?auto_120149 ?auto_120150 ) ) ( not ( = ?auto_120149 ?auto_120151 ) ) ( not ( = ?auto_120149 ?auto_120152 ) ) ( not ( = ?auto_120150 ?auto_120151 ) ) ( not ( = ?auto_120150 ?auto_120152 ) ) ( not ( = ?auto_120151 ?auto_120152 ) ) ( ON ?auto_120152 ?auto_120153 ) ( not ( = ?auto_120146 ?auto_120153 ) ) ( not ( = ?auto_120147 ?auto_120153 ) ) ( not ( = ?auto_120148 ?auto_120153 ) ) ( not ( = ?auto_120149 ?auto_120153 ) ) ( not ( = ?auto_120150 ?auto_120153 ) ) ( not ( = ?auto_120151 ?auto_120153 ) ) ( not ( = ?auto_120152 ?auto_120153 ) ) ( ON ?auto_120151 ?auto_120152 ) ( ON-TABLE ?auto_120153 ) ( ON ?auto_120150 ?auto_120151 ) ( CLEAR ?auto_120150 ) ( HOLDING ?auto_120149 ) ( CLEAR ?auto_120148 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120146 ?auto_120147 ?auto_120148 ?auto_120149 )
      ( MAKE-7PILE ?auto_120146 ?auto_120147 ?auto_120148 ?auto_120149 ?auto_120150 ?auto_120151 ?auto_120152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120154 - BLOCK
      ?auto_120155 - BLOCK
      ?auto_120156 - BLOCK
      ?auto_120157 - BLOCK
      ?auto_120158 - BLOCK
      ?auto_120159 - BLOCK
      ?auto_120160 - BLOCK
    )
    :vars
    (
      ?auto_120161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120154 ) ( ON ?auto_120155 ?auto_120154 ) ( ON ?auto_120156 ?auto_120155 ) ( not ( = ?auto_120154 ?auto_120155 ) ) ( not ( = ?auto_120154 ?auto_120156 ) ) ( not ( = ?auto_120154 ?auto_120157 ) ) ( not ( = ?auto_120154 ?auto_120158 ) ) ( not ( = ?auto_120154 ?auto_120159 ) ) ( not ( = ?auto_120154 ?auto_120160 ) ) ( not ( = ?auto_120155 ?auto_120156 ) ) ( not ( = ?auto_120155 ?auto_120157 ) ) ( not ( = ?auto_120155 ?auto_120158 ) ) ( not ( = ?auto_120155 ?auto_120159 ) ) ( not ( = ?auto_120155 ?auto_120160 ) ) ( not ( = ?auto_120156 ?auto_120157 ) ) ( not ( = ?auto_120156 ?auto_120158 ) ) ( not ( = ?auto_120156 ?auto_120159 ) ) ( not ( = ?auto_120156 ?auto_120160 ) ) ( not ( = ?auto_120157 ?auto_120158 ) ) ( not ( = ?auto_120157 ?auto_120159 ) ) ( not ( = ?auto_120157 ?auto_120160 ) ) ( not ( = ?auto_120158 ?auto_120159 ) ) ( not ( = ?auto_120158 ?auto_120160 ) ) ( not ( = ?auto_120159 ?auto_120160 ) ) ( ON ?auto_120160 ?auto_120161 ) ( not ( = ?auto_120154 ?auto_120161 ) ) ( not ( = ?auto_120155 ?auto_120161 ) ) ( not ( = ?auto_120156 ?auto_120161 ) ) ( not ( = ?auto_120157 ?auto_120161 ) ) ( not ( = ?auto_120158 ?auto_120161 ) ) ( not ( = ?auto_120159 ?auto_120161 ) ) ( not ( = ?auto_120160 ?auto_120161 ) ) ( ON ?auto_120159 ?auto_120160 ) ( ON-TABLE ?auto_120161 ) ( ON ?auto_120158 ?auto_120159 ) ( CLEAR ?auto_120156 ) ( ON ?auto_120157 ?auto_120158 ) ( CLEAR ?auto_120157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120161 ?auto_120160 ?auto_120159 ?auto_120158 )
      ( MAKE-7PILE ?auto_120154 ?auto_120155 ?auto_120156 ?auto_120157 ?auto_120158 ?auto_120159 ?auto_120160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120162 - BLOCK
      ?auto_120163 - BLOCK
      ?auto_120164 - BLOCK
      ?auto_120165 - BLOCK
      ?auto_120166 - BLOCK
      ?auto_120167 - BLOCK
      ?auto_120168 - BLOCK
    )
    :vars
    (
      ?auto_120169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120162 ) ( ON ?auto_120163 ?auto_120162 ) ( not ( = ?auto_120162 ?auto_120163 ) ) ( not ( = ?auto_120162 ?auto_120164 ) ) ( not ( = ?auto_120162 ?auto_120165 ) ) ( not ( = ?auto_120162 ?auto_120166 ) ) ( not ( = ?auto_120162 ?auto_120167 ) ) ( not ( = ?auto_120162 ?auto_120168 ) ) ( not ( = ?auto_120163 ?auto_120164 ) ) ( not ( = ?auto_120163 ?auto_120165 ) ) ( not ( = ?auto_120163 ?auto_120166 ) ) ( not ( = ?auto_120163 ?auto_120167 ) ) ( not ( = ?auto_120163 ?auto_120168 ) ) ( not ( = ?auto_120164 ?auto_120165 ) ) ( not ( = ?auto_120164 ?auto_120166 ) ) ( not ( = ?auto_120164 ?auto_120167 ) ) ( not ( = ?auto_120164 ?auto_120168 ) ) ( not ( = ?auto_120165 ?auto_120166 ) ) ( not ( = ?auto_120165 ?auto_120167 ) ) ( not ( = ?auto_120165 ?auto_120168 ) ) ( not ( = ?auto_120166 ?auto_120167 ) ) ( not ( = ?auto_120166 ?auto_120168 ) ) ( not ( = ?auto_120167 ?auto_120168 ) ) ( ON ?auto_120168 ?auto_120169 ) ( not ( = ?auto_120162 ?auto_120169 ) ) ( not ( = ?auto_120163 ?auto_120169 ) ) ( not ( = ?auto_120164 ?auto_120169 ) ) ( not ( = ?auto_120165 ?auto_120169 ) ) ( not ( = ?auto_120166 ?auto_120169 ) ) ( not ( = ?auto_120167 ?auto_120169 ) ) ( not ( = ?auto_120168 ?auto_120169 ) ) ( ON ?auto_120167 ?auto_120168 ) ( ON-TABLE ?auto_120169 ) ( ON ?auto_120166 ?auto_120167 ) ( ON ?auto_120165 ?auto_120166 ) ( CLEAR ?auto_120165 ) ( HOLDING ?auto_120164 ) ( CLEAR ?auto_120163 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120162 ?auto_120163 ?auto_120164 )
      ( MAKE-7PILE ?auto_120162 ?auto_120163 ?auto_120164 ?auto_120165 ?auto_120166 ?auto_120167 ?auto_120168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120170 - BLOCK
      ?auto_120171 - BLOCK
      ?auto_120172 - BLOCK
      ?auto_120173 - BLOCK
      ?auto_120174 - BLOCK
      ?auto_120175 - BLOCK
      ?auto_120176 - BLOCK
    )
    :vars
    (
      ?auto_120177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120170 ) ( ON ?auto_120171 ?auto_120170 ) ( not ( = ?auto_120170 ?auto_120171 ) ) ( not ( = ?auto_120170 ?auto_120172 ) ) ( not ( = ?auto_120170 ?auto_120173 ) ) ( not ( = ?auto_120170 ?auto_120174 ) ) ( not ( = ?auto_120170 ?auto_120175 ) ) ( not ( = ?auto_120170 ?auto_120176 ) ) ( not ( = ?auto_120171 ?auto_120172 ) ) ( not ( = ?auto_120171 ?auto_120173 ) ) ( not ( = ?auto_120171 ?auto_120174 ) ) ( not ( = ?auto_120171 ?auto_120175 ) ) ( not ( = ?auto_120171 ?auto_120176 ) ) ( not ( = ?auto_120172 ?auto_120173 ) ) ( not ( = ?auto_120172 ?auto_120174 ) ) ( not ( = ?auto_120172 ?auto_120175 ) ) ( not ( = ?auto_120172 ?auto_120176 ) ) ( not ( = ?auto_120173 ?auto_120174 ) ) ( not ( = ?auto_120173 ?auto_120175 ) ) ( not ( = ?auto_120173 ?auto_120176 ) ) ( not ( = ?auto_120174 ?auto_120175 ) ) ( not ( = ?auto_120174 ?auto_120176 ) ) ( not ( = ?auto_120175 ?auto_120176 ) ) ( ON ?auto_120176 ?auto_120177 ) ( not ( = ?auto_120170 ?auto_120177 ) ) ( not ( = ?auto_120171 ?auto_120177 ) ) ( not ( = ?auto_120172 ?auto_120177 ) ) ( not ( = ?auto_120173 ?auto_120177 ) ) ( not ( = ?auto_120174 ?auto_120177 ) ) ( not ( = ?auto_120175 ?auto_120177 ) ) ( not ( = ?auto_120176 ?auto_120177 ) ) ( ON ?auto_120175 ?auto_120176 ) ( ON-TABLE ?auto_120177 ) ( ON ?auto_120174 ?auto_120175 ) ( ON ?auto_120173 ?auto_120174 ) ( CLEAR ?auto_120171 ) ( ON ?auto_120172 ?auto_120173 ) ( CLEAR ?auto_120172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120177 ?auto_120176 ?auto_120175 ?auto_120174 ?auto_120173 )
      ( MAKE-7PILE ?auto_120170 ?auto_120171 ?auto_120172 ?auto_120173 ?auto_120174 ?auto_120175 ?auto_120176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120178 - BLOCK
      ?auto_120179 - BLOCK
      ?auto_120180 - BLOCK
      ?auto_120181 - BLOCK
      ?auto_120182 - BLOCK
      ?auto_120183 - BLOCK
      ?auto_120184 - BLOCK
    )
    :vars
    (
      ?auto_120185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120178 ) ( not ( = ?auto_120178 ?auto_120179 ) ) ( not ( = ?auto_120178 ?auto_120180 ) ) ( not ( = ?auto_120178 ?auto_120181 ) ) ( not ( = ?auto_120178 ?auto_120182 ) ) ( not ( = ?auto_120178 ?auto_120183 ) ) ( not ( = ?auto_120178 ?auto_120184 ) ) ( not ( = ?auto_120179 ?auto_120180 ) ) ( not ( = ?auto_120179 ?auto_120181 ) ) ( not ( = ?auto_120179 ?auto_120182 ) ) ( not ( = ?auto_120179 ?auto_120183 ) ) ( not ( = ?auto_120179 ?auto_120184 ) ) ( not ( = ?auto_120180 ?auto_120181 ) ) ( not ( = ?auto_120180 ?auto_120182 ) ) ( not ( = ?auto_120180 ?auto_120183 ) ) ( not ( = ?auto_120180 ?auto_120184 ) ) ( not ( = ?auto_120181 ?auto_120182 ) ) ( not ( = ?auto_120181 ?auto_120183 ) ) ( not ( = ?auto_120181 ?auto_120184 ) ) ( not ( = ?auto_120182 ?auto_120183 ) ) ( not ( = ?auto_120182 ?auto_120184 ) ) ( not ( = ?auto_120183 ?auto_120184 ) ) ( ON ?auto_120184 ?auto_120185 ) ( not ( = ?auto_120178 ?auto_120185 ) ) ( not ( = ?auto_120179 ?auto_120185 ) ) ( not ( = ?auto_120180 ?auto_120185 ) ) ( not ( = ?auto_120181 ?auto_120185 ) ) ( not ( = ?auto_120182 ?auto_120185 ) ) ( not ( = ?auto_120183 ?auto_120185 ) ) ( not ( = ?auto_120184 ?auto_120185 ) ) ( ON ?auto_120183 ?auto_120184 ) ( ON-TABLE ?auto_120185 ) ( ON ?auto_120182 ?auto_120183 ) ( ON ?auto_120181 ?auto_120182 ) ( ON ?auto_120180 ?auto_120181 ) ( CLEAR ?auto_120180 ) ( HOLDING ?auto_120179 ) ( CLEAR ?auto_120178 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120178 ?auto_120179 )
      ( MAKE-7PILE ?auto_120178 ?auto_120179 ?auto_120180 ?auto_120181 ?auto_120182 ?auto_120183 ?auto_120184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120186 - BLOCK
      ?auto_120187 - BLOCK
      ?auto_120188 - BLOCK
      ?auto_120189 - BLOCK
      ?auto_120190 - BLOCK
      ?auto_120191 - BLOCK
      ?auto_120192 - BLOCK
    )
    :vars
    (
      ?auto_120193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120186 ) ( not ( = ?auto_120186 ?auto_120187 ) ) ( not ( = ?auto_120186 ?auto_120188 ) ) ( not ( = ?auto_120186 ?auto_120189 ) ) ( not ( = ?auto_120186 ?auto_120190 ) ) ( not ( = ?auto_120186 ?auto_120191 ) ) ( not ( = ?auto_120186 ?auto_120192 ) ) ( not ( = ?auto_120187 ?auto_120188 ) ) ( not ( = ?auto_120187 ?auto_120189 ) ) ( not ( = ?auto_120187 ?auto_120190 ) ) ( not ( = ?auto_120187 ?auto_120191 ) ) ( not ( = ?auto_120187 ?auto_120192 ) ) ( not ( = ?auto_120188 ?auto_120189 ) ) ( not ( = ?auto_120188 ?auto_120190 ) ) ( not ( = ?auto_120188 ?auto_120191 ) ) ( not ( = ?auto_120188 ?auto_120192 ) ) ( not ( = ?auto_120189 ?auto_120190 ) ) ( not ( = ?auto_120189 ?auto_120191 ) ) ( not ( = ?auto_120189 ?auto_120192 ) ) ( not ( = ?auto_120190 ?auto_120191 ) ) ( not ( = ?auto_120190 ?auto_120192 ) ) ( not ( = ?auto_120191 ?auto_120192 ) ) ( ON ?auto_120192 ?auto_120193 ) ( not ( = ?auto_120186 ?auto_120193 ) ) ( not ( = ?auto_120187 ?auto_120193 ) ) ( not ( = ?auto_120188 ?auto_120193 ) ) ( not ( = ?auto_120189 ?auto_120193 ) ) ( not ( = ?auto_120190 ?auto_120193 ) ) ( not ( = ?auto_120191 ?auto_120193 ) ) ( not ( = ?auto_120192 ?auto_120193 ) ) ( ON ?auto_120191 ?auto_120192 ) ( ON-TABLE ?auto_120193 ) ( ON ?auto_120190 ?auto_120191 ) ( ON ?auto_120189 ?auto_120190 ) ( ON ?auto_120188 ?auto_120189 ) ( CLEAR ?auto_120186 ) ( ON ?auto_120187 ?auto_120188 ) ( CLEAR ?auto_120187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120193 ?auto_120192 ?auto_120191 ?auto_120190 ?auto_120189 ?auto_120188 )
      ( MAKE-7PILE ?auto_120186 ?auto_120187 ?auto_120188 ?auto_120189 ?auto_120190 ?auto_120191 ?auto_120192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120194 - BLOCK
      ?auto_120195 - BLOCK
      ?auto_120196 - BLOCK
      ?auto_120197 - BLOCK
      ?auto_120198 - BLOCK
      ?auto_120199 - BLOCK
      ?auto_120200 - BLOCK
    )
    :vars
    (
      ?auto_120201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120194 ?auto_120195 ) ) ( not ( = ?auto_120194 ?auto_120196 ) ) ( not ( = ?auto_120194 ?auto_120197 ) ) ( not ( = ?auto_120194 ?auto_120198 ) ) ( not ( = ?auto_120194 ?auto_120199 ) ) ( not ( = ?auto_120194 ?auto_120200 ) ) ( not ( = ?auto_120195 ?auto_120196 ) ) ( not ( = ?auto_120195 ?auto_120197 ) ) ( not ( = ?auto_120195 ?auto_120198 ) ) ( not ( = ?auto_120195 ?auto_120199 ) ) ( not ( = ?auto_120195 ?auto_120200 ) ) ( not ( = ?auto_120196 ?auto_120197 ) ) ( not ( = ?auto_120196 ?auto_120198 ) ) ( not ( = ?auto_120196 ?auto_120199 ) ) ( not ( = ?auto_120196 ?auto_120200 ) ) ( not ( = ?auto_120197 ?auto_120198 ) ) ( not ( = ?auto_120197 ?auto_120199 ) ) ( not ( = ?auto_120197 ?auto_120200 ) ) ( not ( = ?auto_120198 ?auto_120199 ) ) ( not ( = ?auto_120198 ?auto_120200 ) ) ( not ( = ?auto_120199 ?auto_120200 ) ) ( ON ?auto_120200 ?auto_120201 ) ( not ( = ?auto_120194 ?auto_120201 ) ) ( not ( = ?auto_120195 ?auto_120201 ) ) ( not ( = ?auto_120196 ?auto_120201 ) ) ( not ( = ?auto_120197 ?auto_120201 ) ) ( not ( = ?auto_120198 ?auto_120201 ) ) ( not ( = ?auto_120199 ?auto_120201 ) ) ( not ( = ?auto_120200 ?auto_120201 ) ) ( ON ?auto_120199 ?auto_120200 ) ( ON-TABLE ?auto_120201 ) ( ON ?auto_120198 ?auto_120199 ) ( ON ?auto_120197 ?auto_120198 ) ( ON ?auto_120196 ?auto_120197 ) ( ON ?auto_120195 ?auto_120196 ) ( CLEAR ?auto_120195 ) ( HOLDING ?auto_120194 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120194 )
      ( MAKE-7PILE ?auto_120194 ?auto_120195 ?auto_120196 ?auto_120197 ?auto_120198 ?auto_120199 ?auto_120200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120202 - BLOCK
      ?auto_120203 - BLOCK
      ?auto_120204 - BLOCK
      ?auto_120205 - BLOCK
      ?auto_120206 - BLOCK
      ?auto_120207 - BLOCK
      ?auto_120208 - BLOCK
    )
    :vars
    (
      ?auto_120209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120202 ?auto_120203 ) ) ( not ( = ?auto_120202 ?auto_120204 ) ) ( not ( = ?auto_120202 ?auto_120205 ) ) ( not ( = ?auto_120202 ?auto_120206 ) ) ( not ( = ?auto_120202 ?auto_120207 ) ) ( not ( = ?auto_120202 ?auto_120208 ) ) ( not ( = ?auto_120203 ?auto_120204 ) ) ( not ( = ?auto_120203 ?auto_120205 ) ) ( not ( = ?auto_120203 ?auto_120206 ) ) ( not ( = ?auto_120203 ?auto_120207 ) ) ( not ( = ?auto_120203 ?auto_120208 ) ) ( not ( = ?auto_120204 ?auto_120205 ) ) ( not ( = ?auto_120204 ?auto_120206 ) ) ( not ( = ?auto_120204 ?auto_120207 ) ) ( not ( = ?auto_120204 ?auto_120208 ) ) ( not ( = ?auto_120205 ?auto_120206 ) ) ( not ( = ?auto_120205 ?auto_120207 ) ) ( not ( = ?auto_120205 ?auto_120208 ) ) ( not ( = ?auto_120206 ?auto_120207 ) ) ( not ( = ?auto_120206 ?auto_120208 ) ) ( not ( = ?auto_120207 ?auto_120208 ) ) ( ON ?auto_120208 ?auto_120209 ) ( not ( = ?auto_120202 ?auto_120209 ) ) ( not ( = ?auto_120203 ?auto_120209 ) ) ( not ( = ?auto_120204 ?auto_120209 ) ) ( not ( = ?auto_120205 ?auto_120209 ) ) ( not ( = ?auto_120206 ?auto_120209 ) ) ( not ( = ?auto_120207 ?auto_120209 ) ) ( not ( = ?auto_120208 ?auto_120209 ) ) ( ON ?auto_120207 ?auto_120208 ) ( ON-TABLE ?auto_120209 ) ( ON ?auto_120206 ?auto_120207 ) ( ON ?auto_120205 ?auto_120206 ) ( ON ?auto_120204 ?auto_120205 ) ( ON ?auto_120203 ?auto_120204 ) ( ON ?auto_120202 ?auto_120203 ) ( CLEAR ?auto_120202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120209 ?auto_120208 ?auto_120207 ?auto_120206 ?auto_120205 ?auto_120204 ?auto_120203 )
      ( MAKE-7PILE ?auto_120202 ?auto_120203 ?auto_120204 ?auto_120205 ?auto_120206 ?auto_120207 ?auto_120208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120217 - BLOCK
      ?auto_120218 - BLOCK
      ?auto_120219 - BLOCK
      ?auto_120220 - BLOCK
      ?auto_120221 - BLOCK
      ?auto_120222 - BLOCK
      ?auto_120223 - BLOCK
    )
    :vars
    (
      ?auto_120224 - BLOCK
      ?auto_120225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120217 ?auto_120218 ) ) ( not ( = ?auto_120217 ?auto_120219 ) ) ( not ( = ?auto_120217 ?auto_120220 ) ) ( not ( = ?auto_120217 ?auto_120221 ) ) ( not ( = ?auto_120217 ?auto_120222 ) ) ( not ( = ?auto_120217 ?auto_120223 ) ) ( not ( = ?auto_120218 ?auto_120219 ) ) ( not ( = ?auto_120218 ?auto_120220 ) ) ( not ( = ?auto_120218 ?auto_120221 ) ) ( not ( = ?auto_120218 ?auto_120222 ) ) ( not ( = ?auto_120218 ?auto_120223 ) ) ( not ( = ?auto_120219 ?auto_120220 ) ) ( not ( = ?auto_120219 ?auto_120221 ) ) ( not ( = ?auto_120219 ?auto_120222 ) ) ( not ( = ?auto_120219 ?auto_120223 ) ) ( not ( = ?auto_120220 ?auto_120221 ) ) ( not ( = ?auto_120220 ?auto_120222 ) ) ( not ( = ?auto_120220 ?auto_120223 ) ) ( not ( = ?auto_120221 ?auto_120222 ) ) ( not ( = ?auto_120221 ?auto_120223 ) ) ( not ( = ?auto_120222 ?auto_120223 ) ) ( ON ?auto_120223 ?auto_120224 ) ( not ( = ?auto_120217 ?auto_120224 ) ) ( not ( = ?auto_120218 ?auto_120224 ) ) ( not ( = ?auto_120219 ?auto_120224 ) ) ( not ( = ?auto_120220 ?auto_120224 ) ) ( not ( = ?auto_120221 ?auto_120224 ) ) ( not ( = ?auto_120222 ?auto_120224 ) ) ( not ( = ?auto_120223 ?auto_120224 ) ) ( ON ?auto_120222 ?auto_120223 ) ( ON-TABLE ?auto_120224 ) ( ON ?auto_120221 ?auto_120222 ) ( ON ?auto_120220 ?auto_120221 ) ( ON ?auto_120219 ?auto_120220 ) ( ON ?auto_120218 ?auto_120219 ) ( CLEAR ?auto_120218 ) ( ON ?auto_120217 ?auto_120225 ) ( CLEAR ?auto_120217 ) ( HAND-EMPTY ) ( not ( = ?auto_120217 ?auto_120225 ) ) ( not ( = ?auto_120218 ?auto_120225 ) ) ( not ( = ?auto_120219 ?auto_120225 ) ) ( not ( = ?auto_120220 ?auto_120225 ) ) ( not ( = ?auto_120221 ?auto_120225 ) ) ( not ( = ?auto_120222 ?auto_120225 ) ) ( not ( = ?auto_120223 ?auto_120225 ) ) ( not ( = ?auto_120224 ?auto_120225 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120217 ?auto_120225 )
      ( MAKE-7PILE ?auto_120217 ?auto_120218 ?auto_120219 ?auto_120220 ?auto_120221 ?auto_120222 ?auto_120223 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120226 - BLOCK
      ?auto_120227 - BLOCK
      ?auto_120228 - BLOCK
      ?auto_120229 - BLOCK
      ?auto_120230 - BLOCK
      ?auto_120231 - BLOCK
      ?auto_120232 - BLOCK
    )
    :vars
    (
      ?auto_120233 - BLOCK
      ?auto_120234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120226 ?auto_120227 ) ) ( not ( = ?auto_120226 ?auto_120228 ) ) ( not ( = ?auto_120226 ?auto_120229 ) ) ( not ( = ?auto_120226 ?auto_120230 ) ) ( not ( = ?auto_120226 ?auto_120231 ) ) ( not ( = ?auto_120226 ?auto_120232 ) ) ( not ( = ?auto_120227 ?auto_120228 ) ) ( not ( = ?auto_120227 ?auto_120229 ) ) ( not ( = ?auto_120227 ?auto_120230 ) ) ( not ( = ?auto_120227 ?auto_120231 ) ) ( not ( = ?auto_120227 ?auto_120232 ) ) ( not ( = ?auto_120228 ?auto_120229 ) ) ( not ( = ?auto_120228 ?auto_120230 ) ) ( not ( = ?auto_120228 ?auto_120231 ) ) ( not ( = ?auto_120228 ?auto_120232 ) ) ( not ( = ?auto_120229 ?auto_120230 ) ) ( not ( = ?auto_120229 ?auto_120231 ) ) ( not ( = ?auto_120229 ?auto_120232 ) ) ( not ( = ?auto_120230 ?auto_120231 ) ) ( not ( = ?auto_120230 ?auto_120232 ) ) ( not ( = ?auto_120231 ?auto_120232 ) ) ( ON ?auto_120232 ?auto_120233 ) ( not ( = ?auto_120226 ?auto_120233 ) ) ( not ( = ?auto_120227 ?auto_120233 ) ) ( not ( = ?auto_120228 ?auto_120233 ) ) ( not ( = ?auto_120229 ?auto_120233 ) ) ( not ( = ?auto_120230 ?auto_120233 ) ) ( not ( = ?auto_120231 ?auto_120233 ) ) ( not ( = ?auto_120232 ?auto_120233 ) ) ( ON ?auto_120231 ?auto_120232 ) ( ON-TABLE ?auto_120233 ) ( ON ?auto_120230 ?auto_120231 ) ( ON ?auto_120229 ?auto_120230 ) ( ON ?auto_120228 ?auto_120229 ) ( ON ?auto_120226 ?auto_120234 ) ( CLEAR ?auto_120226 ) ( not ( = ?auto_120226 ?auto_120234 ) ) ( not ( = ?auto_120227 ?auto_120234 ) ) ( not ( = ?auto_120228 ?auto_120234 ) ) ( not ( = ?auto_120229 ?auto_120234 ) ) ( not ( = ?auto_120230 ?auto_120234 ) ) ( not ( = ?auto_120231 ?auto_120234 ) ) ( not ( = ?auto_120232 ?auto_120234 ) ) ( not ( = ?auto_120233 ?auto_120234 ) ) ( HOLDING ?auto_120227 ) ( CLEAR ?auto_120228 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120233 ?auto_120232 ?auto_120231 ?auto_120230 ?auto_120229 ?auto_120228 ?auto_120227 )
      ( MAKE-7PILE ?auto_120226 ?auto_120227 ?auto_120228 ?auto_120229 ?auto_120230 ?auto_120231 ?auto_120232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120235 - BLOCK
      ?auto_120236 - BLOCK
      ?auto_120237 - BLOCK
      ?auto_120238 - BLOCK
      ?auto_120239 - BLOCK
      ?auto_120240 - BLOCK
      ?auto_120241 - BLOCK
    )
    :vars
    (
      ?auto_120242 - BLOCK
      ?auto_120243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120235 ?auto_120236 ) ) ( not ( = ?auto_120235 ?auto_120237 ) ) ( not ( = ?auto_120235 ?auto_120238 ) ) ( not ( = ?auto_120235 ?auto_120239 ) ) ( not ( = ?auto_120235 ?auto_120240 ) ) ( not ( = ?auto_120235 ?auto_120241 ) ) ( not ( = ?auto_120236 ?auto_120237 ) ) ( not ( = ?auto_120236 ?auto_120238 ) ) ( not ( = ?auto_120236 ?auto_120239 ) ) ( not ( = ?auto_120236 ?auto_120240 ) ) ( not ( = ?auto_120236 ?auto_120241 ) ) ( not ( = ?auto_120237 ?auto_120238 ) ) ( not ( = ?auto_120237 ?auto_120239 ) ) ( not ( = ?auto_120237 ?auto_120240 ) ) ( not ( = ?auto_120237 ?auto_120241 ) ) ( not ( = ?auto_120238 ?auto_120239 ) ) ( not ( = ?auto_120238 ?auto_120240 ) ) ( not ( = ?auto_120238 ?auto_120241 ) ) ( not ( = ?auto_120239 ?auto_120240 ) ) ( not ( = ?auto_120239 ?auto_120241 ) ) ( not ( = ?auto_120240 ?auto_120241 ) ) ( ON ?auto_120241 ?auto_120242 ) ( not ( = ?auto_120235 ?auto_120242 ) ) ( not ( = ?auto_120236 ?auto_120242 ) ) ( not ( = ?auto_120237 ?auto_120242 ) ) ( not ( = ?auto_120238 ?auto_120242 ) ) ( not ( = ?auto_120239 ?auto_120242 ) ) ( not ( = ?auto_120240 ?auto_120242 ) ) ( not ( = ?auto_120241 ?auto_120242 ) ) ( ON ?auto_120240 ?auto_120241 ) ( ON-TABLE ?auto_120242 ) ( ON ?auto_120239 ?auto_120240 ) ( ON ?auto_120238 ?auto_120239 ) ( ON ?auto_120237 ?auto_120238 ) ( ON ?auto_120235 ?auto_120243 ) ( not ( = ?auto_120235 ?auto_120243 ) ) ( not ( = ?auto_120236 ?auto_120243 ) ) ( not ( = ?auto_120237 ?auto_120243 ) ) ( not ( = ?auto_120238 ?auto_120243 ) ) ( not ( = ?auto_120239 ?auto_120243 ) ) ( not ( = ?auto_120240 ?auto_120243 ) ) ( not ( = ?auto_120241 ?auto_120243 ) ) ( not ( = ?auto_120242 ?auto_120243 ) ) ( CLEAR ?auto_120237 ) ( ON ?auto_120236 ?auto_120235 ) ( CLEAR ?auto_120236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120243 ?auto_120235 )
      ( MAKE-7PILE ?auto_120235 ?auto_120236 ?auto_120237 ?auto_120238 ?auto_120239 ?auto_120240 ?auto_120241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120244 - BLOCK
      ?auto_120245 - BLOCK
      ?auto_120246 - BLOCK
      ?auto_120247 - BLOCK
      ?auto_120248 - BLOCK
      ?auto_120249 - BLOCK
      ?auto_120250 - BLOCK
    )
    :vars
    (
      ?auto_120251 - BLOCK
      ?auto_120252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120244 ?auto_120245 ) ) ( not ( = ?auto_120244 ?auto_120246 ) ) ( not ( = ?auto_120244 ?auto_120247 ) ) ( not ( = ?auto_120244 ?auto_120248 ) ) ( not ( = ?auto_120244 ?auto_120249 ) ) ( not ( = ?auto_120244 ?auto_120250 ) ) ( not ( = ?auto_120245 ?auto_120246 ) ) ( not ( = ?auto_120245 ?auto_120247 ) ) ( not ( = ?auto_120245 ?auto_120248 ) ) ( not ( = ?auto_120245 ?auto_120249 ) ) ( not ( = ?auto_120245 ?auto_120250 ) ) ( not ( = ?auto_120246 ?auto_120247 ) ) ( not ( = ?auto_120246 ?auto_120248 ) ) ( not ( = ?auto_120246 ?auto_120249 ) ) ( not ( = ?auto_120246 ?auto_120250 ) ) ( not ( = ?auto_120247 ?auto_120248 ) ) ( not ( = ?auto_120247 ?auto_120249 ) ) ( not ( = ?auto_120247 ?auto_120250 ) ) ( not ( = ?auto_120248 ?auto_120249 ) ) ( not ( = ?auto_120248 ?auto_120250 ) ) ( not ( = ?auto_120249 ?auto_120250 ) ) ( ON ?auto_120250 ?auto_120251 ) ( not ( = ?auto_120244 ?auto_120251 ) ) ( not ( = ?auto_120245 ?auto_120251 ) ) ( not ( = ?auto_120246 ?auto_120251 ) ) ( not ( = ?auto_120247 ?auto_120251 ) ) ( not ( = ?auto_120248 ?auto_120251 ) ) ( not ( = ?auto_120249 ?auto_120251 ) ) ( not ( = ?auto_120250 ?auto_120251 ) ) ( ON ?auto_120249 ?auto_120250 ) ( ON-TABLE ?auto_120251 ) ( ON ?auto_120248 ?auto_120249 ) ( ON ?auto_120247 ?auto_120248 ) ( ON ?auto_120244 ?auto_120252 ) ( not ( = ?auto_120244 ?auto_120252 ) ) ( not ( = ?auto_120245 ?auto_120252 ) ) ( not ( = ?auto_120246 ?auto_120252 ) ) ( not ( = ?auto_120247 ?auto_120252 ) ) ( not ( = ?auto_120248 ?auto_120252 ) ) ( not ( = ?auto_120249 ?auto_120252 ) ) ( not ( = ?auto_120250 ?auto_120252 ) ) ( not ( = ?auto_120251 ?auto_120252 ) ) ( ON ?auto_120245 ?auto_120244 ) ( CLEAR ?auto_120245 ) ( ON-TABLE ?auto_120252 ) ( HOLDING ?auto_120246 ) ( CLEAR ?auto_120247 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120251 ?auto_120250 ?auto_120249 ?auto_120248 ?auto_120247 ?auto_120246 )
      ( MAKE-7PILE ?auto_120244 ?auto_120245 ?auto_120246 ?auto_120247 ?auto_120248 ?auto_120249 ?auto_120250 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120253 - BLOCK
      ?auto_120254 - BLOCK
      ?auto_120255 - BLOCK
      ?auto_120256 - BLOCK
      ?auto_120257 - BLOCK
      ?auto_120258 - BLOCK
      ?auto_120259 - BLOCK
    )
    :vars
    (
      ?auto_120260 - BLOCK
      ?auto_120261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120253 ?auto_120254 ) ) ( not ( = ?auto_120253 ?auto_120255 ) ) ( not ( = ?auto_120253 ?auto_120256 ) ) ( not ( = ?auto_120253 ?auto_120257 ) ) ( not ( = ?auto_120253 ?auto_120258 ) ) ( not ( = ?auto_120253 ?auto_120259 ) ) ( not ( = ?auto_120254 ?auto_120255 ) ) ( not ( = ?auto_120254 ?auto_120256 ) ) ( not ( = ?auto_120254 ?auto_120257 ) ) ( not ( = ?auto_120254 ?auto_120258 ) ) ( not ( = ?auto_120254 ?auto_120259 ) ) ( not ( = ?auto_120255 ?auto_120256 ) ) ( not ( = ?auto_120255 ?auto_120257 ) ) ( not ( = ?auto_120255 ?auto_120258 ) ) ( not ( = ?auto_120255 ?auto_120259 ) ) ( not ( = ?auto_120256 ?auto_120257 ) ) ( not ( = ?auto_120256 ?auto_120258 ) ) ( not ( = ?auto_120256 ?auto_120259 ) ) ( not ( = ?auto_120257 ?auto_120258 ) ) ( not ( = ?auto_120257 ?auto_120259 ) ) ( not ( = ?auto_120258 ?auto_120259 ) ) ( ON ?auto_120259 ?auto_120260 ) ( not ( = ?auto_120253 ?auto_120260 ) ) ( not ( = ?auto_120254 ?auto_120260 ) ) ( not ( = ?auto_120255 ?auto_120260 ) ) ( not ( = ?auto_120256 ?auto_120260 ) ) ( not ( = ?auto_120257 ?auto_120260 ) ) ( not ( = ?auto_120258 ?auto_120260 ) ) ( not ( = ?auto_120259 ?auto_120260 ) ) ( ON ?auto_120258 ?auto_120259 ) ( ON-TABLE ?auto_120260 ) ( ON ?auto_120257 ?auto_120258 ) ( ON ?auto_120256 ?auto_120257 ) ( ON ?auto_120253 ?auto_120261 ) ( not ( = ?auto_120253 ?auto_120261 ) ) ( not ( = ?auto_120254 ?auto_120261 ) ) ( not ( = ?auto_120255 ?auto_120261 ) ) ( not ( = ?auto_120256 ?auto_120261 ) ) ( not ( = ?auto_120257 ?auto_120261 ) ) ( not ( = ?auto_120258 ?auto_120261 ) ) ( not ( = ?auto_120259 ?auto_120261 ) ) ( not ( = ?auto_120260 ?auto_120261 ) ) ( ON ?auto_120254 ?auto_120253 ) ( ON-TABLE ?auto_120261 ) ( CLEAR ?auto_120256 ) ( ON ?auto_120255 ?auto_120254 ) ( CLEAR ?auto_120255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120261 ?auto_120253 ?auto_120254 )
      ( MAKE-7PILE ?auto_120253 ?auto_120254 ?auto_120255 ?auto_120256 ?auto_120257 ?auto_120258 ?auto_120259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120262 - BLOCK
      ?auto_120263 - BLOCK
      ?auto_120264 - BLOCK
      ?auto_120265 - BLOCK
      ?auto_120266 - BLOCK
      ?auto_120267 - BLOCK
      ?auto_120268 - BLOCK
    )
    :vars
    (
      ?auto_120269 - BLOCK
      ?auto_120270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120262 ?auto_120263 ) ) ( not ( = ?auto_120262 ?auto_120264 ) ) ( not ( = ?auto_120262 ?auto_120265 ) ) ( not ( = ?auto_120262 ?auto_120266 ) ) ( not ( = ?auto_120262 ?auto_120267 ) ) ( not ( = ?auto_120262 ?auto_120268 ) ) ( not ( = ?auto_120263 ?auto_120264 ) ) ( not ( = ?auto_120263 ?auto_120265 ) ) ( not ( = ?auto_120263 ?auto_120266 ) ) ( not ( = ?auto_120263 ?auto_120267 ) ) ( not ( = ?auto_120263 ?auto_120268 ) ) ( not ( = ?auto_120264 ?auto_120265 ) ) ( not ( = ?auto_120264 ?auto_120266 ) ) ( not ( = ?auto_120264 ?auto_120267 ) ) ( not ( = ?auto_120264 ?auto_120268 ) ) ( not ( = ?auto_120265 ?auto_120266 ) ) ( not ( = ?auto_120265 ?auto_120267 ) ) ( not ( = ?auto_120265 ?auto_120268 ) ) ( not ( = ?auto_120266 ?auto_120267 ) ) ( not ( = ?auto_120266 ?auto_120268 ) ) ( not ( = ?auto_120267 ?auto_120268 ) ) ( ON ?auto_120268 ?auto_120269 ) ( not ( = ?auto_120262 ?auto_120269 ) ) ( not ( = ?auto_120263 ?auto_120269 ) ) ( not ( = ?auto_120264 ?auto_120269 ) ) ( not ( = ?auto_120265 ?auto_120269 ) ) ( not ( = ?auto_120266 ?auto_120269 ) ) ( not ( = ?auto_120267 ?auto_120269 ) ) ( not ( = ?auto_120268 ?auto_120269 ) ) ( ON ?auto_120267 ?auto_120268 ) ( ON-TABLE ?auto_120269 ) ( ON ?auto_120266 ?auto_120267 ) ( ON ?auto_120262 ?auto_120270 ) ( not ( = ?auto_120262 ?auto_120270 ) ) ( not ( = ?auto_120263 ?auto_120270 ) ) ( not ( = ?auto_120264 ?auto_120270 ) ) ( not ( = ?auto_120265 ?auto_120270 ) ) ( not ( = ?auto_120266 ?auto_120270 ) ) ( not ( = ?auto_120267 ?auto_120270 ) ) ( not ( = ?auto_120268 ?auto_120270 ) ) ( not ( = ?auto_120269 ?auto_120270 ) ) ( ON ?auto_120263 ?auto_120262 ) ( ON-TABLE ?auto_120270 ) ( ON ?auto_120264 ?auto_120263 ) ( CLEAR ?auto_120264 ) ( HOLDING ?auto_120265 ) ( CLEAR ?auto_120266 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120269 ?auto_120268 ?auto_120267 ?auto_120266 ?auto_120265 )
      ( MAKE-7PILE ?auto_120262 ?auto_120263 ?auto_120264 ?auto_120265 ?auto_120266 ?auto_120267 ?auto_120268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120271 - BLOCK
      ?auto_120272 - BLOCK
      ?auto_120273 - BLOCK
      ?auto_120274 - BLOCK
      ?auto_120275 - BLOCK
      ?auto_120276 - BLOCK
      ?auto_120277 - BLOCK
    )
    :vars
    (
      ?auto_120278 - BLOCK
      ?auto_120279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120271 ?auto_120272 ) ) ( not ( = ?auto_120271 ?auto_120273 ) ) ( not ( = ?auto_120271 ?auto_120274 ) ) ( not ( = ?auto_120271 ?auto_120275 ) ) ( not ( = ?auto_120271 ?auto_120276 ) ) ( not ( = ?auto_120271 ?auto_120277 ) ) ( not ( = ?auto_120272 ?auto_120273 ) ) ( not ( = ?auto_120272 ?auto_120274 ) ) ( not ( = ?auto_120272 ?auto_120275 ) ) ( not ( = ?auto_120272 ?auto_120276 ) ) ( not ( = ?auto_120272 ?auto_120277 ) ) ( not ( = ?auto_120273 ?auto_120274 ) ) ( not ( = ?auto_120273 ?auto_120275 ) ) ( not ( = ?auto_120273 ?auto_120276 ) ) ( not ( = ?auto_120273 ?auto_120277 ) ) ( not ( = ?auto_120274 ?auto_120275 ) ) ( not ( = ?auto_120274 ?auto_120276 ) ) ( not ( = ?auto_120274 ?auto_120277 ) ) ( not ( = ?auto_120275 ?auto_120276 ) ) ( not ( = ?auto_120275 ?auto_120277 ) ) ( not ( = ?auto_120276 ?auto_120277 ) ) ( ON ?auto_120277 ?auto_120278 ) ( not ( = ?auto_120271 ?auto_120278 ) ) ( not ( = ?auto_120272 ?auto_120278 ) ) ( not ( = ?auto_120273 ?auto_120278 ) ) ( not ( = ?auto_120274 ?auto_120278 ) ) ( not ( = ?auto_120275 ?auto_120278 ) ) ( not ( = ?auto_120276 ?auto_120278 ) ) ( not ( = ?auto_120277 ?auto_120278 ) ) ( ON ?auto_120276 ?auto_120277 ) ( ON-TABLE ?auto_120278 ) ( ON ?auto_120275 ?auto_120276 ) ( ON ?auto_120271 ?auto_120279 ) ( not ( = ?auto_120271 ?auto_120279 ) ) ( not ( = ?auto_120272 ?auto_120279 ) ) ( not ( = ?auto_120273 ?auto_120279 ) ) ( not ( = ?auto_120274 ?auto_120279 ) ) ( not ( = ?auto_120275 ?auto_120279 ) ) ( not ( = ?auto_120276 ?auto_120279 ) ) ( not ( = ?auto_120277 ?auto_120279 ) ) ( not ( = ?auto_120278 ?auto_120279 ) ) ( ON ?auto_120272 ?auto_120271 ) ( ON-TABLE ?auto_120279 ) ( ON ?auto_120273 ?auto_120272 ) ( CLEAR ?auto_120275 ) ( ON ?auto_120274 ?auto_120273 ) ( CLEAR ?auto_120274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120279 ?auto_120271 ?auto_120272 ?auto_120273 )
      ( MAKE-7PILE ?auto_120271 ?auto_120272 ?auto_120273 ?auto_120274 ?auto_120275 ?auto_120276 ?auto_120277 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120280 - BLOCK
      ?auto_120281 - BLOCK
      ?auto_120282 - BLOCK
      ?auto_120283 - BLOCK
      ?auto_120284 - BLOCK
      ?auto_120285 - BLOCK
      ?auto_120286 - BLOCK
    )
    :vars
    (
      ?auto_120288 - BLOCK
      ?auto_120287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120280 ?auto_120281 ) ) ( not ( = ?auto_120280 ?auto_120282 ) ) ( not ( = ?auto_120280 ?auto_120283 ) ) ( not ( = ?auto_120280 ?auto_120284 ) ) ( not ( = ?auto_120280 ?auto_120285 ) ) ( not ( = ?auto_120280 ?auto_120286 ) ) ( not ( = ?auto_120281 ?auto_120282 ) ) ( not ( = ?auto_120281 ?auto_120283 ) ) ( not ( = ?auto_120281 ?auto_120284 ) ) ( not ( = ?auto_120281 ?auto_120285 ) ) ( not ( = ?auto_120281 ?auto_120286 ) ) ( not ( = ?auto_120282 ?auto_120283 ) ) ( not ( = ?auto_120282 ?auto_120284 ) ) ( not ( = ?auto_120282 ?auto_120285 ) ) ( not ( = ?auto_120282 ?auto_120286 ) ) ( not ( = ?auto_120283 ?auto_120284 ) ) ( not ( = ?auto_120283 ?auto_120285 ) ) ( not ( = ?auto_120283 ?auto_120286 ) ) ( not ( = ?auto_120284 ?auto_120285 ) ) ( not ( = ?auto_120284 ?auto_120286 ) ) ( not ( = ?auto_120285 ?auto_120286 ) ) ( ON ?auto_120286 ?auto_120288 ) ( not ( = ?auto_120280 ?auto_120288 ) ) ( not ( = ?auto_120281 ?auto_120288 ) ) ( not ( = ?auto_120282 ?auto_120288 ) ) ( not ( = ?auto_120283 ?auto_120288 ) ) ( not ( = ?auto_120284 ?auto_120288 ) ) ( not ( = ?auto_120285 ?auto_120288 ) ) ( not ( = ?auto_120286 ?auto_120288 ) ) ( ON ?auto_120285 ?auto_120286 ) ( ON-TABLE ?auto_120288 ) ( ON ?auto_120280 ?auto_120287 ) ( not ( = ?auto_120280 ?auto_120287 ) ) ( not ( = ?auto_120281 ?auto_120287 ) ) ( not ( = ?auto_120282 ?auto_120287 ) ) ( not ( = ?auto_120283 ?auto_120287 ) ) ( not ( = ?auto_120284 ?auto_120287 ) ) ( not ( = ?auto_120285 ?auto_120287 ) ) ( not ( = ?auto_120286 ?auto_120287 ) ) ( not ( = ?auto_120288 ?auto_120287 ) ) ( ON ?auto_120281 ?auto_120280 ) ( ON-TABLE ?auto_120287 ) ( ON ?auto_120282 ?auto_120281 ) ( ON ?auto_120283 ?auto_120282 ) ( CLEAR ?auto_120283 ) ( HOLDING ?auto_120284 ) ( CLEAR ?auto_120285 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120288 ?auto_120286 ?auto_120285 ?auto_120284 )
      ( MAKE-7PILE ?auto_120280 ?auto_120281 ?auto_120282 ?auto_120283 ?auto_120284 ?auto_120285 ?auto_120286 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120289 - BLOCK
      ?auto_120290 - BLOCK
      ?auto_120291 - BLOCK
      ?auto_120292 - BLOCK
      ?auto_120293 - BLOCK
      ?auto_120294 - BLOCK
      ?auto_120295 - BLOCK
    )
    :vars
    (
      ?auto_120296 - BLOCK
      ?auto_120297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120289 ?auto_120290 ) ) ( not ( = ?auto_120289 ?auto_120291 ) ) ( not ( = ?auto_120289 ?auto_120292 ) ) ( not ( = ?auto_120289 ?auto_120293 ) ) ( not ( = ?auto_120289 ?auto_120294 ) ) ( not ( = ?auto_120289 ?auto_120295 ) ) ( not ( = ?auto_120290 ?auto_120291 ) ) ( not ( = ?auto_120290 ?auto_120292 ) ) ( not ( = ?auto_120290 ?auto_120293 ) ) ( not ( = ?auto_120290 ?auto_120294 ) ) ( not ( = ?auto_120290 ?auto_120295 ) ) ( not ( = ?auto_120291 ?auto_120292 ) ) ( not ( = ?auto_120291 ?auto_120293 ) ) ( not ( = ?auto_120291 ?auto_120294 ) ) ( not ( = ?auto_120291 ?auto_120295 ) ) ( not ( = ?auto_120292 ?auto_120293 ) ) ( not ( = ?auto_120292 ?auto_120294 ) ) ( not ( = ?auto_120292 ?auto_120295 ) ) ( not ( = ?auto_120293 ?auto_120294 ) ) ( not ( = ?auto_120293 ?auto_120295 ) ) ( not ( = ?auto_120294 ?auto_120295 ) ) ( ON ?auto_120295 ?auto_120296 ) ( not ( = ?auto_120289 ?auto_120296 ) ) ( not ( = ?auto_120290 ?auto_120296 ) ) ( not ( = ?auto_120291 ?auto_120296 ) ) ( not ( = ?auto_120292 ?auto_120296 ) ) ( not ( = ?auto_120293 ?auto_120296 ) ) ( not ( = ?auto_120294 ?auto_120296 ) ) ( not ( = ?auto_120295 ?auto_120296 ) ) ( ON ?auto_120294 ?auto_120295 ) ( ON-TABLE ?auto_120296 ) ( ON ?auto_120289 ?auto_120297 ) ( not ( = ?auto_120289 ?auto_120297 ) ) ( not ( = ?auto_120290 ?auto_120297 ) ) ( not ( = ?auto_120291 ?auto_120297 ) ) ( not ( = ?auto_120292 ?auto_120297 ) ) ( not ( = ?auto_120293 ?auto_120297 ) ) ( not ( = ?auto_120294 ?auto_120297 ) ) ( not ( = ?auto_120295 ?auto_120297 ) ) ( not ( = ?auto_120296 ?auto_120297 ) ) ( ON ?auto_120290 ?auto_120289 ) ( ON-TABLE ?auto_120297 ) ( ON ?auto_120291 ?auto_120290 ) ( ON ?auto_120292 ?auto_120291 ) ( CLEAR ?auto_120294 ) ( ON ?auto_120293 ?auto_120292 ) ( CLEAR ?auto_120293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120297 ?auto_120289 ?auto_120290 ?auto_120291 ?auto_120292 )
      ( MAKE-7PILE ?auto_120289 ?auto_120290 ?auto_120291 ?auto_120292 ?auto_120293 ?auto_120294 ?auto_120295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120298 - BLOCK
      ?auto_120299 - BLOCK
      ?auto_120300 - BLOCK
      ?auto_120301 - BLOCK
      ?auto_120302 - BLOCK
      ?auto_120303 - BLOCK
      ?auto_120304 - BLOCK
    )
    :vars
    (
      ?auto_120306 - BLOCK
      ?auto_120305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120298 ?auto_120299 ) ) ( not ( = ?auto_120298 ?auto_120300 ) ) ( not ( = ?auto_120298 ?auto_120301 ) ) ( not ( = ?auto_120298 ?auto_120302 ) ) ( not ( = ?auto_120298 ?auto_120303 ) ) ( not ( = ?auto_120298 ?auto_120304 ) ) ( not ( = ?auto_120299 ?auto_120300 ) ) ( not ( = ?auto_120299 ?auto_120301 ) ) ( not ( = ?auto_120299 ?auto_120302 ) ) ( not ( = ?auto_120299 ?auto_120303 ) ) ( not ( = ?auto_120299 ?auto_120304 ) ) ( not ( = ?auto_120300 ?auto_120301 ) ) ( not ( = ?auto_120300 ?auto_120302 ) ) ( not ( = ?auto_120300 ?auto_120303 ) ) ( not ( = ?auto_120300 ?auto_120304 ) ) ( not ( = ?auto_120301 ?auto_120302 ) ) ( not ( = ?auto_120301 ?auto_120303 ) ) ( not ( = ?auto_120301 ?auto_120304 ) ) ( not ( = ?auto_120302 ?auto_120303 ) ) ( not ( = ?auto_120302 ?auto_120304 ) ) ( not ( = ?auto_120303 ?auto_120304 ) ) ( ON ?auto_120304 ?auto_120306 ) ( not ( = ?auto_120298 ?auto_120306 ) ) ( not ( = ?auto_120299 ?auto_120306 ) ) ( not ( = ?auto_120300 ?auto_120306 ) ) ( not ( = ?auto_120301 ?auto_120306 ) ) ( not ( = ?auto_120302 ?auto_120306 ) ) ( not ( = ?auto_120303 ?auto_120306 ) ) ( not ( = ?auto_120304 ?auto_120306 ) ) ( ON-TABLE ?auto_120306 ) ( ON ?auto_120298 ?auto_120305 ) ( not ( = ?auto_120298 ?auto_120305 ) ) ( not ( = ?auto_120299 ?auto_120305 ) ) ( not ( = ?auto_120300 ?auto_120305 ) ) ( not ( = ?auto_120301 ?auto_120305 ) ) ( not ( = ?auto_120302 ?auto_120305 ) ) ( not ( = ?auto_120303 ?auto_120305 ) ) ( not ( = ?auto_120304 ?auto_120305 ) ) ( not ( = ?auto_120306 ?auto_120305 ) ) ( ON ?auto_120299 ?auto_120298 ) ( ON-TABLE ?auto_120305 ) ( ON ?auto_120300 ?auto_120299 ) ( ON ?auto_120301 ?auto_120300 ) ( ON ?auto_120302 ?auto_120301 ) ( CLEAR ?auto_120302 ) ( HOLDING ?auto_120303 ) ( CLEAR ?auto_120304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120306 ?auto_120304 ?auto_120303 )
      ( MAKE-7PILE ?auto_120298 ?auto_120299 ?auto_120300 ?auto_120301 ?auto_120302 ?auto_120303 ?auto_120304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120307 - BLOCK
      ?auto_120308 - BLOCK
      ?auto_120309 - BLOCK
      ?auto_120310 - BLOCK
      ?auto_120311 - BLOCK
      ?auto_120312 - BLOCK
      ?auto_120313 - BLOCK
    )
    :vars
    (
      ?auto_120314 - BLOCK
      ?auto_120315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120307 ?auto_120308 ) ) ( not ( = ?auto_120307 ?auto_120309 ) ) ( not ( = ?auto_120307 ?auto_120310 ) ) ( not ( = ?auto_120307 ?auto_120311 ) ) ( not ( = ?auto_120307 ?auto_120312 ) ) ( not ( = ?auto_120307 ?auto_120313 ) ) ( not ( = ?auto_120308 ?auto_120309 ) ) ( not ( = ?auto_120308 ?auto_120310 ) ) ( not ( = ?auto_120308 ?auto_120311 ) ) ( not ( = ?auto_120308 ?auto_120312 ) ) ( not ( = ?auto_120308 ?auto_120313 ) ) ( not ( = ?auto_120309 ?auto_120310 ) ) ( not ( = ?auto_120309 ?auto_120311 ) ) ( not ( = ?auto_120309 ?auto_120312 ) ) ( not ( = ?auto_120309 ?auto_120313 ) ) ( not ( = ?auto_120310 ?auto_120311 ) ) ( not ( = ?auto_120310 ?auto_120312 ) ) ( not ( = ?auto_120310 ?auto_120313 ) ) ( not ( = ?auto_120311 ?auto_120312 ) ) ( not ( = ?auto_120311 ?auto_120313 ) ) ( not ( = ?auto_120312 ?auto_120313 ) ) ( ON ?auto_120313 ?auto_120314 ) ( not ( = ?auto_120307 ?auto_120314 ) ) ( not ( = ?auto_120308 ?auto_120314 ) ) ( not ( = ?auto_120309 ?auto_120314 ) ) ( not ( = ?auto_120310 ?auto_120314 ) ) ( not ( = ?auto_120311 ?auto_120314 ) ) ( not ( = ?auto_120312 ?auto_120314 ) ) ( not ( = ?auto_120313 ?auto_120314 ) ) ( ON-TABLE ?auto_120314 ) ( ON ?auto_120307 ?auto_120315 ) ( not ( = ?auto_120307 ?auto_120315 ) ) ( not ( = ?auto_120308 ?auto_120315 ) ) ( not ( = ?auto_120309 ?auto_120315 ) ) ( not ( = ?auto_120310 ?auto_120315 ) ) ( not ( = ?auto_120311 ?auto_120315 ) ) ( not ( = ?auto_120312 ?auto_120315 ) ) ( not ( = ?auto_120313 ?auto_120315 ) ) ( not ( = ?auto_120314 ?auto_120315 ) ) ( ON ?auto_120308 ?auto_120307 ) ( ON-TABLE ?auto_120315 ) ( ON ?auto_120309 ?auto_120308 ) ( ON ?auto_120310 ?auto_120309 ) ( ON ?auto_120311 ?auto_120310 ) ( CLEAR ?auto_120313 ) ( ON ?auto_120312 ?auto_120311 ) ( CLEAR ?auto_120312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120315 ?auto_120307 ?auto_120308 ?auto_120309 ?auto_120310 ?auto_120311 )
      ( MAKE-7PILE ?auto_120307 ?auto_120308 ?auto_120309 ?auto_120310 ?auto_120311 ?auto_120312 ?auto_120313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120316 - BLOCK
      ?auto_120317 - BLOCK
      ?auto_120318 - BLOCK
      ?auto_120319 - BLOCK
      ?auto_120320 - BLOCK
      ?auto_120321 - BLOCK
      ?auto_120322 - BLOCK
    )
    :vars
    (
      ?auto_120323 - BLOCK
      ?auto_120324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120316 ?auto_120317 ) ) ( not ( = ?auto_120316 ?auto_120318 ) ) ( not ( = ?auto_120316 ?auto_120319 ) ) ( not ( = ?auto_120316 ?auto_120320 ) ) ( not ( = ?auto_120316 ?auto_120321 ) ) ( not ( = ?auto_120316 ?auto_120322 ) ) ( not ( = ?auto_120317 ?auto_120318 ) ) ( not ( = ?auto_120317 ?auto_120319 ) ) ( not ( = ?auto_120317 ?auto_120320 ) ) ( not ( = ?auto_120317 ?auto_120321 ) ) ( not ( = ?auto_120317 ?auto_120322 ) ) ( not ( = ?auto_120318 ?auto_120319 ) ) ( not ( = ?auto_120318 ?auto_120320 ) ) ( not ( = ?auto_120318 ?auto_120321 ) ) ( not ( = ?auto_120318 ?auto_120322 ) ) ( not ( = ?auto_120319 ?auto_120320 ) ) ( not ( = ?auto_120319 ?auto_120321 ) ) ( not ( = ?auto_120319 ?auto_120322 ) ) ( not ( = ?auto_120320 ?auto_120321 ) ) ( not ( = ?auto_120320 ?auto_120322 ) ) ( not ( = ?auto_120321 ?auto_120322 ) ) ( not ( = ?auto_120316 ?auto_120323 ) ) ( not ( = ?auto_120317 ?auto_120323 ) ) ( not ( = ?auto_120318 ?auto_120323 ) ) ( not ( = ?auto_120319 ?auto_120323 ) ) ( not ( = ?auto_120320 ?auto_120323 ) ) ( not ( = ?auto_120321 ?auto_120323 ) ) ( not ( = ?auto_120322 ?auto_120323 ) ) ( ON-TABLE ?auto_120323 ) ( ON ?auto_120316 ?auto_120324 ) ( not ( = ?auto_120316 ?auto_120324 ) ) ( not ( = ?auto_120317 ?auto_120324 ) ) ( not ( = ?auto_120318 ?auto_120324 ) ) ( not ( = ?auto_120319 ?auto_120324 ) ) ( not ( = ?auto_120320 ?auto_120324 ) ) ( not ( = ?auto_120321 ?auto_120324 ) ) ( not ( = ?auto_120322 ?auto_120324 ) ) ( not ( = ?auto_120323 ?auto_120324 ) ) ( ON ?auto_120317 ?auto_120316 ) ( ON-TABLE ?auto_120324 ) ( ON ?auto_120318 ?auto_120317 ) ( ON ?auto_120319 ?auto_120318 ) ( ON ?auto_120320 ?auto_120319 ) ( ON ?auto_120321 ?auto_120320 ) ( CLEAR ?auto_120321 ) ( HOLDING ?auto_120322 ) ( CLEAR ?auto_120323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120323 ?auto_120322 )
      ( MAKE-7PILE ?auto_120316 ?auto_120317 ?auto_120318 ?auto_120319 ?auto_120320 ?auto_120321 ?auto_120322 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120325 - BLOCK
      ?auto_120326 - BLOCK
      ?auto_120327 - BLOCK
      ?auto_120328 - BLOCK
      ?auto_120329 - BLOCK
      ?auto_120330 - BLOCK
      ?auto_120331 - BLOCK
    )
    :vars
    (
      ?auto_120332 - BLOCK
      ?auto_120333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120325 ?auto_120326 ) ) ( not ( = ?auto_120325 ?auto_120327 ) ) ( not ( = ?auto_120325 ?auto_120328 ) ) ( not ( = ?auto_120325 ?auto_120329 ) ) ( not ( = ?auto_120325 ?auto_120330 ) ) ( not ( = ?auto_120325 ?auto_120331 ) ) ( not ( = ?auto_120326 ?auto_120327 ) ) ( not ( = ?auto_120326 ?auto_120328 ) ) ( not ( = ?auto_120326 ?auto_120329 ) ) ( not ( = ?auto_120326 ?auto_120330 ) ) ( not ( = ?auto_120326 ?auto_120331 ) ) ( not ( = ?auto_120327 ?auto_120328 ) ) ( not ( = ?auto_120327 ?auto_120329 ) ) ( not ( = ?auto_120327 ?auto_120330 ) ) ( not ( = ?auto_120327 ?auto_120331 ) ) ( not ( = ?auto_120328 ?auto_120329 ) ) ( not ( = ?auto_120328 ?auto_120330 ) ) ( not ( = ?auto_120328 ?auto_120331 ) ) ( not ( = ?auto_120329 ?auto_120330 ) ) ( not ( = ?auto_120329 ?auto_120331 ) ) ( not ( = ?auto_120330 ?auto_120331 ) ) ( not ( = ?auto_120325 ?auto_120332 ) ) ( not ( = ?auto_120326 ?auto_120332 ) ) ( not ( = ?auto_120327 ?auto_120332 ) ) ( not ( = ?auto_120328 ?auto_120332 ) ) ( not ( = ?auto_120329 ?auto_120332 ) ) ( not ( = ?auto_120330 ?auto_120332 ) ) ( not ( = ?auto_120331 ?auto_120332 ) ) ( ON-TABLE ?auto_120332 ) ( ON ?auto_120325 ?auto_120333 ) ( not ( = ?auto_120325 ?auto_120333 ) ) ( not ( = ?auto_120326 ?auto_120333 ) ) ( not ( = ?auto_120327 ?auto_120333 ) ) ( not ( = ?auto_120328 ?auto_120333 ) ) ( not ( = ?auto_120329 ?auto_120333 ) ) ( not ( = ?auto_120330 ?auto_120333 ) ) ( not ( = ?auto_120331 ?auto_120333 ) ) ( not ( = ?auto_120332 ?auto_120333 ) ) ( ON ?auto_120326 ?auto_120325 ) ( ON-TABLE ?auto_120333 ) ( ON ?auto_120327 ?auto_120326 ) ( ON ?auto_120328 ?auto_120327 ) ( ON ?auto_120329 ?auto_120328 ) ( ON ?auto_120330 ?auto_120329 ) ( CLEAR ?auto_120332 ) ( ON ?auto_120331 ?auto_120330 ) ( CLEAR ?auto_120331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120333 ?auto_120325 ?auto_120326 ?auto_120327 ?auto_120328 ?auto_120329 ?auto_120330 )
      ( MAKE-7PILE ?auto_120325 ?auto_120326 ?auto_120327 ?auto_120328 ?auto_120329 ?auto_120330 ?auto_120331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120334 - BLOCK
      ?auto_120335 - BLOCK
      ?auto_120336 - BLOCK
      ?auto_120337 - BLOCK
      ?auto_120338 - BLOCK
      ?auto_120339 - BLOCK
      ?auto_120340 - BLOCK
    )
    :vars
    (
      ?auto_120342 - BLOCK
      ?auto_120341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120334 ?auto_120335 ) ) ( not ( = ?auto_120334 ?auto_120336 ) ) ( not ( = ?auto_120334 ?auto_120337 ) ) ( not ( = ?auto_120334 ?auto_120338 ) ) ( not ( = ?auto_120334 ?auto_120339 ) ) ( not ( = ?auto_120334 ?auto_120340 ) ) ( not ( = ?auto_120335 ?auto_120336 ) ) ( not ( = ?auto_120335 ?auto_120337 ) ) ( not ( = ?auto_120335 ?auto_120338 ) ) ( not ( = ?auto_120335 ?auto_120339 ) ) ( not ( = ?auto_120335 ?auto_120340 ) ) ( not ( = ?auto_120336 ?auto_120337 ) ) ( not ( = ?auto_120336 ?auto_120338 ) ) ( not ( = ?auto_120336 ?auto_120339 ) ) ( not ( = ?auto_120336 ?auto_120340 ) ) ( not ( = ?auto_120337 ?auto_120338 ) ) ( not ( = ?auto_120337 ?auto_120339 ) ) ( not ( = ?auto_120337 ?auto_120340 ) ) ( not ( = ?auto_120338 ?auto_120339 ) ) ( not ( = ?auto_120338 ?auto_120340 ) ) ( not ( = ?auto_120339 ?auto_120340 ) ) ( not ( = ?auto_120334 ?auto_120342 ) ) ( not ( = ?auto_120335 ?auto_120342 ) ) ( not ( = ?auto_120336 ?auto_120342 ) ) ( not ( = ?auto_120337 ?auto_120342 ) ) ( not ( = ?auto_120338 ?auto_120342 ) ) ( not ( = ?auto_120339 ?auto_120342 ) ) ( not ( = ?auto_120340 ?auto_120342 ) ) ( ON ?auto_120334 ?auto_120341 ) ( not ( = ?auto_120334 ?auto_120341 ) ) ( not ( = ?auto_120335 ?auto_120341 ) ) ( not ( = ?auto_120336 ?auto_120341 ) ) ( not ( = ?auto_120337 ?auto_120341 ) ) ( not ( = ?auto_120338 ?auto_120341 ) ) ( not ( = ?auto_120339 ?auto_120341 ) ) ( not ( = ?auto_120340 ?auto_120341 ) ) ( not ( = ?auto_120342 ?auto_120341 ) ) ( ON ?auto_120335 ?auto_120334 ) ( ON-TABLE ?auto_120341 ) ( ON ?auto_120336 ?auto_120335 ) ( ON ?auto_120337 ?auto_120336 ) ( ON ?auto_120338 ?auto_120337 ) ( ON ?auto_120339 ?auto_120338 ) ( ON ?auto_120340 ?auto_120339 ) ( CLEAR ?auto_120340 ) ( HOLDING ?auto_120342 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120342 )
      ( MAKE-7PILE ?auto_120334 ?auto_120335 ?auto_120336 ?auto_120337 ?auto_120338 ?auto_120339 ?auto_120340 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_120343 - BLOCK
      ?auto_120344 - BLOCK
      ?auto_120345 - BLOCK
      ?auto_120346 - BLOCK
      ?auto_120347 - BLOCK
      ?auto_120348 - BLOCK
      ?auto_120349 - BLOCK
    )
    :vars
    (
      ?auto_120351 - BLOCK
      ?auto_120350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120343 ?auto_120344 ) ) ( not ( = ?auto_120343 ?auto_120345 ) ) ( not ( = ?auto_120343 ?auto_120346 ) ) ( not ( = ?auto_120343 ?auto_120347 ) ) ( not ( = ?auto_120343 ?auto_120348 ) ) ( not ( = ?auto_120343 ?auto_120349 ) ) ( not ( = ?auto_120344 ?auto_120345 ) ) ( not ( = ?auto_120344 ?auto_120346 ) ) ( not ( = ?auto_120344 ?auto_120347 ) ) ( not ( = ?auto_120344 ?auto_120348 ) ) ( not ( = ?auto_120344 ?auto_120349 ) ) ( not ( = ?auto_120345 ?auto_120346 ) ) ( not ( = ?auto_120345 ?auto_120347 ) ) ( not ( = ?auto_120345 ?auto_120348 ) ) ( not ( = ?auto_120345 ?auto_120349 ) ) ( not ( = ?auto_120346 ?auto_120347 ) ) ( not ( = ?auto_120346 ?auto_120348 ) ) ( not ( = ?auto_120346 ?auto_120349 ) ) ( not ( = ?auto_120347 ?auto_120348 ) ) ( not ( = ?auto_120347 ?auto_120349 ) ) ( not ( = ?auto_120348 ?auto_120349 ) ) ( not ( = ?auto_120343 ?auto_120351 ) ) ( not ( = ?auto_120344 ?auto_120351 ) ) ( not ( = ?auto_120345 ?auto_120351 ) ) ( not ( = ?auto_120346 ?auto_120351 ) ) ( not ( = ?auto_120347 ?auto_120351 ) ) ( not ( = ?auto_120348 ?auto_120351 ) ) ( not ( = ?auto_120349 ?auto_120351 ) ) ( ON ?auto_120343 ?auto_120350 ) ( not ( = ?auto_120343 ?auto_120350 ) ) ( not ( = ?auto_120344 ?auto_120350 ) ) ( not ( = ?auto_120345 ?auto_120350 ) ) ( not ( = ?auto_120346 ?auto_120350 ) ) ( not ( = ?auto_120347 ?auto_120350 ) ) ( not ( = ?auto_120348 ?auto_120350 ) ) ( not ( = ?auto_120349 ?auto_120350 ) ) ( not ( = ?auto_120351 ?auto_120350 ) ) ( ON ?auto_120344 ?auto_120343 ) ( ON-TABLE ?auto_120350 ) ( ON ?auto_120345 ?auto_120344 ) ( ON ?auto_120346 ?auto_120345 ) ( ON ?auto_120347 ?auto_120346 ) ( ON ?auto_120348 ?auto_120347 ) ( ON ?auto_120349 ?auto_120348 ) ( ON ?auto_120351 ?auto_120349 ) ( CLEAR ?auto_120351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120350 ?auto_120343 ?auto_120344 ?auto_120345 ?auto_120346 ?auto_120347 ?auto_120348 ?auto_120349 )
      ( MAKE-7PILE ?auto_120343 ?auto_120344 ?auto_120345 ?auto_120346 ?auto_120347 ?auto_120348 ?auto_120349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120368 - BLOCK
      ?auto_120369 - BLOCK
      ?auto_120370 - BLOCK
      ?auto_120371 - BLOCK
      ?auto_120372 - BLOCK
      ?auto_120373 - BLOCK
      ?auto_120374 - BLOCK
      ?auto_120375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120374 ) ( ON-TABLE ?auto_120368 ) ( ON ?auto_120369 ?auto_120368 ) ( ON ?auto_120370 ?auto_120369 ) ( ON ?auto_120371 ?auto_120370 ) ( ON ?auto_120372 ?auto_120371 ) ( ON ?auto_120373 ?auto_120372 ) ( ON ?auto_120374 ?auto_120373 ) ( not ( = ?auto_120368 ?auto_120369 ) ) ( not ( = ?auto_120368 ?auto_120370 ) ) ( not ( = ?auto_120368 ?auto_120371 ) ) ( not ( = ?auto_120368 ?auto_120372 ) ) ( not ( = ?auto_120368 ?auto_120373 ) ) ( not ( = ?auto_120368 ?auto_120374 ) ) ( not ( = ?auto_120368 ?auto_120375 ) ) ( not ( = ?auto_120369 ?auto_120370 ) ) ( not ( = ?auto_120369 ?auto_120371 ) ) ( not ( = ?auto_120369 ?auto_120372 ) ) ( not ( = ?auto_120369 ?auto_120373 ) ) ( not ( = ?auto_120369 ?auto_120374 ) ) ( not ( = ?auto_120369 ?auto_120375 ) ) ( not ( = ?auto_120370 ?auto_120371 ) ) ( not ( = ?auto_120370 ?auto_120372 ) ) ( not ( = ?auto_120370 ?auto_120373 ) ) ( not ( = ?auto_120370 ?auto_120374 ) ) ( not ( = ?auto_120370 ?auto_120375 ) ) ( not ( = ?auto_120371 ?auto_120372 ) ) ( not ( = ?auto_120371 ?auto_120373 ) ) ( not ( = ?auto_120371 ?auto_120374 ) ) ( not ( = ?auto_120371 ?auto_120375 ) ) ( not ( = ?auto_120372 ?auto_120373 ) ) ( not ( = ?auto_120372 ?auto_120374 ) ) ( not ( = ?auto_120372 ?auto_120375 ) ) ( not ( = ?auto_120373 ?auto_120374 ) ) ( not ( = ?auto_120373 ?auto_120375 ) ) ( not ( = ?auto_120374 ?auto_120375 ) ) ( ON-TABLE ?auto_120375 ) ( CLEAR ?auto_120375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_120375 )
      ( MAKE-8PILE ?auto_120368 ?auto_120369 ?auto_120370 ?auto_120371 ?auto_120372 ?auto_120373 ?auto_120374 ?auto_120375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120376 - BLOCK
      ?auto_120377 - BLOCK
      ?auto_120378 - BLOCK
      ?auto_120379 - BLOCK
      ?auto_120380 - BLOCK
      ?auto_120381 - BLOCK
      ?auto_120382 - BLOCK
      ?auto_120383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120376 ) ( ON ?auto_120377 ?auto_120376 ) ( ON ?auto_120378 ?auto_120377 ) ( ON ?auto_120379 ?auto_120378 ) ( ON ?auto_120380 ?auto_120379 ) ( ON ?auto_120381 ?auto_120380 ) ( not ( = ?auto_120376 ?auto_120377 ) ) ( not ( = ?auto_120376 ?auto_120378 ) ) ( not ( = ?auto_120376 ?auto_120379 ) ) ( not ( = ?auto_120376 ?auto_120380 ) ) ( not ( = ?auto_120376 ?auto_120381 ) ) ( not ( = ?auto_120376 ?auto_120382 ) ) ( not ( = ?auto_120376 ?auto_120383 ) ) ( not ( = ?auto_120377 ?auto_120378 ) ) ( not ( = ?auto_120377 ?auto_120379 ) ) ( not ( = ?auto_120377 ?auto_120380 ) ) ( not ( = ?auto_120377 ?auto_120381 ) ) ( not ( = ?auto_120377 ?auto_120382 ) ) ( not ( = ?auto_120377 ?auto_120383 ) ) ( not ( = ?auto_120378 ?auto_120379 ) ) ( not ( = ?auto_120378 ?auto_120380 ) ) ( not ( = ?auto_120378 ?auto_120381 ) ) ( not ( = ?auto_120378 ?auto_120382 ) ) ( not ( = ?auto_120378 ?auto_120383 ) ) ( not ( = ?auto_120379 ?auto_120380 ) ) ( not ( = ?auto_120379 ?auto_120381 ) ) ( not ( = ?auto_120379 ?auto_120382 ) ) ( not ( = ?auto_120379 ?auto_120383 ) ) ( not ( = ?auto_120380 ?auto_120381 ) ) ( not ( = ?auto_120380 ?auto_120382 ) ) ( not ( = ?auto_120380 ?auto_120383 ) ) ( not ( = ?auto_120381 ?auto_120382 ) ) ( not ( = ?auto_120381 ?auto_120383 ) ) ( not ( = ?auto_120382 ?auto_120383 ) ) ( ON-TABLE ?auto_120383 ) ( CLEAR ?auto_120383 ) ( HOLDING ?auto_120382 ) ( CLEAR ?auto_120381 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120376 ?auto_120377 ?auto_120378 ?auto_120379 ?auto_120380 ?auto_120381 ?auto_120382 )
      ( MAKE-8PILE ?auto_120376 ?auto_120377 ?auto_120378 ?auto_120379 ?auto_120380 ?auto_120381 ?auto_120382 ?auto_120383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120384 - BLOCK
      ?auto_120385 - BLOCK
      ?auto_120386 - BLOCK
      ?auto_120387 - BLOCK
      ?auto_120388 - BLOCK
      ?auto_120389 - BLOCK
      ?auto_120390 - BLOCK
      ?auto_120391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120384 ) ( ON ?auto_120385 ?auto_120384 ) ( ON ?auto_120386 ?auto_120385 ) ( ON ?auto_120387 ?auto_120386 ) ( ON ?auto_120388 ?auto_120387 ) ( ON ?auto_120389 ?auto_120388 ) ( not ( = ?auto_120384 ?auto_120385 ) ) ( not ( = ?auto_120384 ?auto_120386 ) ) ( not ( = ?auto_120384 ?auto_120387 ) ) ( not ( = ?auto_120384 ?auto_120388 ) ) ( not ( = ?auto_120384 ?auto_120389 ) ) ( not ( = ?auto_120384 ?auto_120390 ) ) ( not ( = ?auto_120384 ?auto_120391 ) ) ( not ( = ?auto_120385 ?auto_120386 ) ) ( not ( = ?auto_120385 ?auto_120387 ) ) ( not ( = ?auto_120385 ?auto_120388 ) ) ( not ( = ?auto_120385 ?auto_120389 ) ) ( not ( = ?auto_120385 ?auto_120390 ) ) ( not ( = ?auto_120385 ?auto_120391 ) ) ( not ( = ?auto_120386 ?auto_120387 ) ) ( not ( = ?auto_120386 ?auto_120388 ) ) ( not ( = ?auto_120386 ?auto_120389 ) ) ( not ( = ?auto_120386 ?auto_120390 ) ) ( not ( = ?auto_120386 ?auto_120391 ) ) ( not ( = ?auto_120387 ?auto_120388 ) ) ( not ( = ?auto_120387 ?auto_120389 ) ) ( not ( = ?auto_120387 ?auto_120390 ) ) ( not ( = ?auto_120387 ?auto_120391 ) ) ( not ( = ?auto_120388 ?auto_120389 ) ) ( not ( = ?auto_120388 ?auto_120390 ) ) ( not ( = ?auto_120388 ?auto_120391 ) ) ( not ( = ?auto_120389 ?auto_120390 ) ) ( not ( = ?auto_120389 ?auto_120391 ) ) ( not ( = ?auto_120390 ?auto_120391 ) ) ( ON-TABLE ?auto_120391 ) ( CLEAR ?auto_120389 ) ( ON ?auto_120390 ?auto_120391 ) ( CLEAR ?auto_120390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120391 )
      ( MAKE-8PILE ?auto_120384 ?auto_120385 ?auto_120386 ?auto_120387 ?auto_120388 ?auto_120389 ?auto_120390 ?auto_120391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120392 - BLOCK
      ?auto_120393 - BLOCK
      ?auto_120394 - BLOCK
      ?auto_120395 - BLOCK
      ?auto_120396 - BLOCK
      ?auto_120397 - BLOCK
      ?auto_120398 - BLOCK
      ?auto_120399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120392 ) ( ON ?auto_120393 ?auto_120392 ) ( ON ?auto_120394 ?auto_120393 ) ( ON ?auto_120395 ?auto_120394 ) ( ON ?auto_120396 ?auto_120395 ) ( not ( = ?auto_120392 ?auto_120393 ) ) ( not ( = ?auto_120392 ?auto_120394 ) ) ( not ( = ?auto_120392 ?auto_120395 ) ) ( not ( = ?auto_120392 ?auto_120396 ) ) ( not ( = ?auto_120392 ?auto_120397 ) ) ( not ( = ?auto_120392 ?auto_120398 ) ) ( not ( = ?auto_120392 ?auto_120399 ) ) ( not ( = ?auto_120393 ?auto_120394 ) ) ( not ( = ?auto_120393 ?auto_120395 ) ) ( not ( = ?auto_120393 ?auto_120396 ) ) ( not ( = ?auto_120393 ?auto_120397 ) ) ( not ( = ?auto_120393 ?auto_120398 ) ) ( not ( = ?auto_120393 ?auto_120399 ) ) ( not ( = ?auto_120394 ?auto_120395 ) ) ( not ( = ?auto_120394 ?auto_120396 ) ) ( not ( = ?auto_120394 ?auto_120397 ) ) ( not ( = ?auto_120394 ?auto_120398 ) ) ( not ( = ?auto_120394 ?auto_120399 ) ) ( not ( = ?auto_120395 ?auto_120396 ) ) ( not ( = ?auto_120395 ?auto_120397 ) ) ( not ( = ?auto_120395 ?auto_120398 ) ) ( not ( = ?auto_120395 ?auto_120399 ) ) ( not ( = ?auto_120396 ?auto_120397 ) ) ( not ( = ?auto_120396 ?auto_120398 ) ) ( not ( = ?auto_120396 ?auto_120399 ) ) ( not ( = ?auto_120397 ?auto_120398 ) ) ( not ( = ?auto_120397 ?auto_120399 ) ) ( not ( = ?auto_120398 ?auto_120399 ) ) ( ON-TABLE ?auto_120399 ) ( ON ?auto_120398 ?auto_120399 ) ( CLEAR ?auto_120398 ) ( HOLDING ?auto_120397 ) ( CLEAR ?auto_120396 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120392 ?auto_120393 ?auto_120394 ?auto_120395 ?auto_120396 ?auto_120397 )
      ( MAKE-8PILE ?auto_120392 ?auto_120393 ?auto_120394 ?auto_120395 ?auto_120396 ?auto_120397 ?auto_120398 ?auto_120399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120400 - BLOCK
      ?auto_120401 - BLOCK
      ?auto_120402 - BLOCK
      ?auto_120403 - BLOCK
      ?auto_120404 - BLOCK
      ?auto_120405 - BLOCK
      ?auto_120406 - BLOCK
      ?auto_120407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120400 ) ( ON ?auto_120401 ?auto_120400 ) ( ON ?auto_120402 ?auto_120401 ) ( ON ?auto_120403 ?auto_120402 ) ( ON ?auto_120404 ?auto_120403 ) ( not ( = ?auto_120400 ?auto_120401 ) ) ( not ( = ?auto_120400 ?auto_120402 ) ) ( not ( = ?auto_120400 ?auto_120403 ) ) ( not ( = ?auto_120400 ?auto_120404 ) ) ( not ( = ?auto_120400 ?auto_120405 ) ) ( not ( = ?auto_120400 ?auto_120406 ) ) ( not ( = ?auto_120400 ?auto_120407 ) ) ( not ( = ?auto_120401 ?auto_120402 ) ) ( not ( = ?auto_120401 ?auto_120403 ) ) ( not ( = ?auto_120401 ?auto_120404 ) ) ( not ( = ?auto_120401 ?auto_120405 ) ) ( not ( = ?auto_120401 ?auto_120406 ) ) ( not ( = ?auto_120401 ?auto_120407 ) ) ( not ( = ?auto_120402 ?auto_120403 ) ) ( not ( = ?auto_120402 ?auto_120404 ) ) ( not ( = ?auto_120402 ?auto_120405 ) ) ( not ( = ?auto_120402 ?auto_120406 ) ) ( not ( = ?auto_120402 ?auto_120407 ) ) ( not ( = ?auto_120403 ?auto_120404 ) ) ( not ( = ?auto_120403 ?auto_120405 ) ) ( not ( = ?auto_120403 ?auto_120406 ) ) ( not ( = ?auto_120403 ?auto_120407 ) ) ( not ( = ?auto_120404 ?auto_120405 ) ) ( not ( = ?auto_120404 ?auto_120406 ) ) ( not ( = ?auto_120404 ?auto_120407 ) ) ( not ( = ?auto_120405 ?auto_120406 ) ) ( not ( = ?auto_120405 ?auto_120407 ) ) ( not ( = ?auto_120406 ?auto_120407 ) ) ( ON-TABLE ?auto_120407 ) ( ON ?auto_120406 ?auto_120407 ) ( CLEAR ?auto_120404 ) ( ON ?auto_120405 ?auto_120406 ) ( CLEAR ?auto_120405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120407 ?auto_120406 )
      ( MAKE-8PILE ?auto_120400 ?auto_120401 ?auto_120402 ?auto_120403 ?auto_120404 ?auto_120405 ?auto_120406 ?auto_120407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120408 - BLOCK
      ?auto_120409 - BLOCK
      ?auto_120410 - BLOCK
      ?auto_120411 - BLOCK
      ?auto_120412 - BLOCK
      ?auto_120413 - BLOCK
      ?auto_120414 - BLOCK
      ?auto_120415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120408 ) ( ON ?auto_120409 ?auto_120408 ) ( ON ?auto_120410 ?auto_120409 ) ( ON ?auto_120411 ?auto_120410 ) ( not ( = ?auto_120408 ?auto_120409 ) ) ( not ( = ?auto_120408 ?auto_120410 ) ) ( not ( = ?auto_120408 ?auto_120411 ) ) ( not ( = ?auto_120408 ?auto_120412 ) ) ( not ( = ?auto_120408 ?auto_120413 ) ) ( not ( = ?auto_120408 ?auto_120414 ) ) ( not ( = ?auto_120408 ?auto_120415 ) ) ( not ( = ?auto_120409 ?auto_120410 ) ) ( not ( = ?auto_120409 ?auto_120411 ) ) ( not ( = ?auto_120409 ?auto_120412 ) ) ( not ( = ?auto_120409 ?auto_120413 ) ) ( not ( = ?auto_120409 ?auto_120414 ) ) ( not ( = ?auto_120409 ?auto_120415 ) ) ( not ( = ?auto_120410 ?auto_120411 ) ) ( not ( = ?auto_120410 ?auto_120412 ) ) ( not ( = ?auto_120410 ?auto_120413 ) ) ( not ( = ?auto_120410 ?auto_120414 ) ) ( not ( = ?auto_120410 ?auto_120415 ) ) ( not ( = ?auto_120411 ?auto_120412 ) ) ( not ( = ?auto_120411 ?auto_120413 ) ) ( not ( = ?auto_120411 ?auto_120414 ) ) ( not ( = ?auto_120411 ?auto_120415 ) ) ( not ( = ?auto_120412 ?auto_120413 ) ) ( not ( = ?auto_120412 ?auto_120414 ) ) ( not ( = ?auto_120412 ?auto_120415 ) ) ( not ( = ?auto_120413 ?auto_120414 ) ) ( not ( = ?auto_120413 ?auto_120415 ) ) ( not ( = ?auto_120414 ?auto_120415 ) ) ( ON-TABLE ?auto_120415 ) ( ON ?auto_120414 ?auto_120415 ) ( ON ?auto_120413 ?auto_120414 ) ( CLEAR ?auto_120413 ) ( HOLDING ?auto_120412 ) ( CLEAR ?auto_120411 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120408 ?auto_120409 ?auto_120410 ?auto_120411 ?auto_120412 )
      ( MAKE-8PILE ?auto_120408 ?auto_120409 ?auto_120410 ?auto_120411 ?auto_120412 ?auto_120413 ?auto_120414 ?auto_120415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120416 - BLOCK
      ?auto_120417 - BLOCK
      ?auto_120418 - BLOCK
      ?auto_120419 - BLOCK
      ?auto_120420 - BLOCK
      ?auto_120421 - BLOCK
      ?auto_120422 - BLOCK
      ?auto_120423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120416 ) ( ON ?auto_120417 ?auto_120416 ) ( ON ?auto_120418 ?auto_120417 ) ( ON ?auto_120419 ?auto_120418 ) ( not ( = ?auto_120416 ?auto_120417 ) ) ( not ( = ?auto_120416 ?auto_120418 ) ) ( not ( = ?auto_120416 ?auto_120419 ) ) ( not ( = ?auto_120416 ?auto_120420 ) ) ( not ( = ?auto_120416 ?auto_120421 ) ) ( not ( = ?auto_120416 ?auto_120422 ) ) ( not ( = ?auto_120416 ?auto_120423 ) ) ( not ( = ?auto_120417 ?auto_120418 ) ) ( not ( = ?auto_120417 ?auto_120419 ) ) ( not ( = ?auto_120417 ?auto_120420 ) ) ( not ( = ?auto_120417 ?auto_120421 ) ) ( not ( = ?auto_120417 ?auto_120422 ) ) ( not ( = ?auto_120417 ?auto_120423 ) ) ( not ( = ?auto_120418 ?auto_120419 ) ) ( not ( = ?auto_120418 ?auto_120420 ) ) ( not ( = ?auto_120418 ?auto_120421 ) ) ( not ( = ?auto_120418 ?auto_120422 ) ) ( not ( = ?auto_120418 ?auto_120423 ) ) ( not ( = ?auto_120419 ?auto_120420 ) ) ( not ( = ?auto_120419 ?auto_120421 ) ) ( not ( = ?auto_120419 ?auto_120422 ) ) ( not ( = ?auto_120419 ?auto_120423 ) ) ( not ( = ?auto_120420 ?auto_120421 ) ) ( not ( = ?auto_120420 ?auto_120422 ) ) ( not ( = ?auto_120420 ?auto_120423 ) ) ( not ( = ?auto_120421 ?auto_120422 ) ) ( not ( = ?auto_120421 ?auto_120423 ) ) ( not ( = ?auto_120422 ?auto_120423 ) ) ( ON-TABLE ?auto_120423 ) ( ON ?auto_120422 ?auto_120423 ) ( ON ?auto_120421 ?auto_120422 ) ( CLEAR ?auto_120419 ) ( ON ?auto_120420 ?auto_120421 ) ( CLEAR ?auto_120420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120423 ?auto_120422 ?auto_120421 )
      ( MAKE-8PILE ?auto_120416 ?auto_120417 ?auto_120418 ?auto_120419 ?auto_120420 ?auto_120421 ?auto_120422 ?auto_120423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120424 - BLOCK
      ?auto_120425 - BLOCK
      ?auto_120426 - BLOCK
      ?auto_120427 - BLOCK
      ?auto_120428 - BLOCK
      ?auto_120429 - BLOCK
      ?auto_120430 - BLOCK
      ?auto_120431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120424 ) ( ON ?auto_120425 ?auto_120424 ) ( ON ?auto_120426 ?auto_120425 ) ( not ( = ?auto_120424 ?auto_120425 ) ) ( not ( = ?auto_120424 ?auto_120426 ) ) ( not ( = ?auto_120424 ?auto_120427 ) ) ( not ( = ?auto_120424 ?auto_120428 ) ) ( not ( = ?auto_120424 ?auto_120429 ) ) ( not ( = ?auto_120424 ?auto_120430 ) ) ( not ( = ?auto_120424 ?auto_120431 ) ) ( not ( = ?auto_120425 ?auto_120426 ) ) ( not ( = ?auto_120425 ?auto_120427 ) ) ( not ( = ?auto_120425 ?auto_120428 ) ) ( not ( = ?auto_120425 ?auto_120429 ) ) ( not ( = ?auto_120425 ?auto_120430 ) ) ( not ( = ?auto_120425 ?auto_120431 ) ) ( not ( = ?auto_120426 ?auto_120427 ) ) ( not ( = ?auto_120426 ?auto_120428 ) ) ( not ( = ?auto_120426 ?auto_120429 ) ) ( not ( = ?auto_120426 ?auto_120430 ) ) ( not ( = ?auto_120426 ?auto_120431 ) ) ( not ( = ?auto_120427 ?auto_120428 ) ) ( not ( = ?auto_120427 ?auto_120429 ) ) ( not ( = ?auto_120427 ?auto_120430 ) ) ( not ( = ?auto_120427 ?auto_120431 ) ) ( not ( = ?auto_120428 ?auto_120429 ) ) ( not ( = ?auto_120428 ?auto_120430 ) ) ( not ( = ?auto_120428 ?auto_120431 ) ) ( not ( = ?auto_120429 ?auto_120430 ) ) ( not ( = ?auto_120429 ?auto_120431 ) ) ( not ( = ?auto_120430 ?auto_120431 ) ) ( ON-TABLE ?auto_120431 ) ( ON ?auto_120430 ?auto_120431 ) ( ON ?auto_120429 ?auto_120430 ) ( ON ?auto_120428 ?auto_120429 ) ( CLEAR ?auto_120428 ) ( HOLDING ?auto_120427 ) ( CLEAR ?auto_120426 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120424 ?auto_120425 ?auto_120426 ?auto_120427 )
      ( MAKE-8PILE ?auto_120424 ?auto_120425 ?auto_120426 ?auto_120427 ?auto_120428 ?auto_120429 ?auto_120430 ?auto_120431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120432 - BLOCK
      ?auto_120433 - BLOCK
      ?auto_120434 - BLOCK
      ?auto_120435 - BLOCK
      ?auto_120436 - BLOCK
      ?auto_120437 - BLOCK
      ?auto_120438 - BLOCK
      ?auto_120439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120432 ) ( ON ?auto_120433 ?auto_120432 ) ( ON ?auto_120434 ?auto_120433 ) ( not ( = ?auto_120432 ?auto_120433 ) ) ( not ( = ?auto_120432 ?auto_120434 ) ) ( not ( = ?auto_120432 ?auto_120435 ) ) ( not ( = ?auto_120432 ?auto_120436 ) ) ( not ( = ?auto_120432 ?auto_120437 ) ) ( not ( = ?auto_120432 ?auto_120438 ) ) ( not ( = ?auto_120432 ?auto_120439 ) ) ( not ( = ?auto_120433 ?auto_120434 ) ) ( not ( = ?auto_120433 ?auto_120435 ) ) ( not ( = ?auto_120433 ?auto_120436 ) ) ( not ( = ?auto_120433 ?auto_120437 ) ) ( not ( = ?auto_120433 ?auto_120438 ) ) ( not ( = ?auto_120433 ?auto_120439 ) ) ( not ( = ?auto_120434 ?auto_120435 ) ) ( not ( = ?auto_120434 ?auto_120436 ) ) ( not ( = ?auto_120434 ?auto_120437 ) ) ( not ( = ?auto_120434 ?auto_120438 ) ) ( not ( = ?auto_120434 ?auto_120439 ) ) ( not ( = ?auto_120435 ?auto_120436 ) ) ( not ( = ?auto_120435 ?auto_120437 ) ) ( not ( = ?auto_120435 ?auto_120438 ) ) ( not ( = ?auto_120435 ?auto_120439 ) ) ( not ( = ?auto_120436 ?auto_120437 ) ) ( not ( = ?auto_120436 ?auto_120438 ) ) ( not ( = ?auto_120436 ?auto_120439 ) ) ( not ( = ?auto_120437 ?auto_120438 ) ) ( not ( = ?auto_120437 ?auto_120439 ) ) ( not ( = ?auto_120438 ?auto_120439 ) ) ( ON-TABLE ?auto_120439 ) ( ON ?auto_120438 ?auto_120439 ) ( ON ?auto_120437 ?auto_120438 ) ( ON ?auto_120436 ?auto_120437 ) ( CLEAR ?auto_120434 ) ( ON ?auto_120435 ?auto_120436 ) ( CLEAR ?auto_120435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120439 ?auto_120438 ?auto_120437 ?auto_120436 )
      ( MAKE-8PILE ?auto_120432 ?auto_120433 ?auto_120434 ?auto_120435 ?auto_120436 ?auto_120437 ?auto_120438 ?auto_120439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120440 - BLOCK
      ?auto_120441 - BLOCK
      ?auto_120442 - BLOCK
      ?auto_120443 - BLOCK
      ?auto_120444 - BLOCK
      ?auto_120445 - BLOCK
      ?auto_120446 - BLOCK
      ?auto_120447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120440 ) ( ON ?auto_120441 ?auto_120440 ) ( not ( = ?auto_120440 ?auto_120441 ) ) ( not ( = ?auto_120440 ?auto_120442 ) ) ( not ( = ?auto_120440 ?auto_120443 ) ) ( not ( = ?auto_120440 ?auto_120444 ) ) ( not ( = ?auto_120440 ?auto_120445 ) ) ( not ( = ?auto_120440 ?auto_120446 ) ) ( not ( = ?auto_120440 ?auto_120447 ) ) ( not ( = ?auto_120441 ?auto_120442 ) ) ( not ( = ?auto_120441 ?auto_120443 ) ) ( not ( = ?auto_120441 ?auto_120444 ) ) ( not ( = ?auto_120441 ?auto_120445 ) ) ( not ( = ?auto_120441 ?auto_120446 ) ) ( not ( = ?auto_120441 ?auto_120447 ) ) ( not ( = ?auto_120442 ?auto_120443 ) ) ( not ( = ?auto_120442 ?auto_120444 ) ) ( not ( = ?auto_120442 ?auto_120445 ) ) ( not ( = ?auto_120442 ?auto_120446 ) ) ( not ( = ?auto_120442 ?auto_120447 ) ) ( not ( = ?auto_120443 ?auto_120444 ) ) ( not ( = ?auto_120443 ?auto_120445 ) ) ( not ( = ?auto_120443 ?auto_120446 ) ) ( not ( = ?auto_120443 ?auto_120447 ) ) ( not ( = ?auto_120444 ?auto_120445 ) ) ( not ( = ?auto_120444 ?auto_120446 ) ) ( not ( = ?auto_120444 ?auto_120447 ) ) ( not ( = ?auto_120445 ?auto_120446 ) ) ( not ( = ?auto_120445 ?auto_120447 ) ) ( not ( = ?auto_120446 ?auto_120447 ) ) ( ON-TABLE ?auto_120447 ) ( ON ?auto_120446 ?auto_120447 ) ( ON ?auto_120445 ?auto_120446 ) ( ON ?auto_120444 ?auto_120445 ) ( ON ?auto_120443 ?auto_120444 ) ( CLEAR ?auto_120443 ) ( HOLDING ?auto_120442 ) ( CLEAR ?auto_120441 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120440 ?auto_120441 ?auto_120442 )
      ( MAKE-8PILE ?auto_120440 ?auto_120441 ?auto_120442 ?auto_120443 ?auto_120444 ?auto_120445 ?auto_120446 ?auto_120447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120448 - BLOCK
      ?auto_120449 - BLOCK
      ?auto_120450 - BLOCK
      ?auto_120451 - BLOCK
      ?auto_120452 - BLOCK
      ?auto_120453 - BLOCK
      ?auto_120454 - BLOCK
      ?auto_120455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120448 ) ( ON ?auto_120449 ?auto_120448 ) ( not ( = ?auto_120448 ?auto_120449 ) ) ( not ( = ?auto_120448 ?auto_120450 ) ) ( not ( = ?auto_120448 ?auto_120451 ) ) ( not ( = ?auto_120448 ?auto_120452 ) ) ( not ( = ?auto_120448 ?auto_120453 ) ) ( not ( = ?auto_120448 ?auto_120454 ) ) ( not ( = ?auto_120448 ?auto_120455 ) ) ( not ( = ?auto_120449 ?auto_120450 ) ) ( not ( = ?auto_120449 ?auto_120451 ) ) ( not ( = ?auto_120449 ?auto_120452 ) ) ( not ( = ?auto_120449 ?auto_120453 ) ) ( not ( = ?auto_120449 ?auto_120454 ) ) ( not ( = ?auto_120449 ?auto_120455 ) ) ( not ( = ?auto_120450 ?auto_120451 ) ) ( not ( = ?auto_120450 ?auto_120452 ) ) ( not ( = ?auto_120450 ?auto_120453 ) ) ( not ( = ?auto_120450 ?auto_120454 ) ) ( not ( = ?auto_120450 ?auto_120455 ) ) ( not ( = ?auto_120451 ?auto_120452 ) ) ( not ( = ?auto_120451 ?auto_120453 ) ) ( not ( = ?auto_120451 ?auto_120454 ) ) ( not ( = ?auto_120451 ?auto_120455 ) ) ( not ( = ?auto_120452 ?auto_120453 ) ) ( not ( = ?auto_120452 ?auto_120454 ) ) ( not ( = ?auto_120452 ?auto_120455 ) ) ( not ( = ?auto_120453 ?auto_120454 ) ) ( not ( = ?auto_120453 ?auto_120455 ) ) ( not ( = ?auto_120454 ?auto_120455 ) ) ( ON-TABLE ?auto_120455 ) ( ON ?auto_120454 ?auto_120455 ) ( ON ?auto_120453 ?auto_120454 ) ( ON ?auto_120452 ?auto_120453 ) ( ON ?auto_120451 ?auto_120452 ) ( CLEAR ?auto_120449 ) ( ON ?auto_120450 ?auto_120451 ) ( CLEAR ?auto_120450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120455 ?auto_120454 ?auto_120453 ?auto_120452 ?auto_120451 )
      ( MAKE-8PILE ?auto_120448 ?auto_120449 ?auto_120450 ?auto_120451 ?auto_120452 ?auto_120453 ?auto_120454 ?auto_120455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120456 - BLOCK
      ?auto_120457 - BLOCK
      ?auto_120458 - BLOCK
      ?auto_120459 - BLOCK
      ?auto_120460 - BLOCK
      ?auto_120461 - BLOCK
      ?auto_120462 - BLOCK
      ?auto_120463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120456 ) ( not ( = ?auto_120456 ?auto_120457 ) ) ( not ( = ?auto_120456 ?auto_120458 ) ) ( not ( = ?auto_120456 ?auto_120459 ) ) ( not ( = ?auto_120456 ?auto_120460 ) ) ( not ( = ?auto_120456 ?auto_120461 ) ) ( not ( = ?auto_120456 ?auto_120462 ) ) ( not ( = ?auto_120456 ?auto_120463 ) ) ( not ( = ?auto_120457 ?auto_120458 ) ) ( not ( = ?auto_120457 ?auto_120459 ) ) ( not ( = ?auto_120457 ?auto_120460 ) ) ( not ( = ?auto_120457 ?auto_120461 ) ) ( not ( = ?auto_120457 ?auto_120462 ) ) ( not ( = ?auto_120457 ?auto_120463 ) ) ( not ( = ?auto_120458 ?auto_120459 ) ) ( not ( = ?auto_120458 ?auto_120460 ) ) ( not ( = ?auto_120458 ?auto_120461 ) ) ( not ( = ?auto_120458 ?auto_120462 ) ) ( not ( = ?auto_120458 ?auto_120463 ) ) ( not ( = ?auto_120459 ?auto_120460 ) ) ( not ( = ?auto_120459 ?auto_120461 ) ) ( not ( = ?auto_120459 ?auto_120462 ) ) ( not ( = ?auto_120459 ?auto_120463 ) ) ( not ( = ?auto_120460 ?auto_120461 ) ) ( not ( = ?auto_120460 ?auto_120462 ) ) ( not ( = ?auto_120460 ?auto_120463 ) ) ( not ( = ?auto_120461 ?auto_120462 ) ) ( not ( = ?auto_120461 ?auto_120463 ) ) ( not ( = ?auto_120462 ?auto_120463 ) ) ( ON-TABLE ?auto_120463 ) ( ON ?auto_120462 ?auto_120463 ) ( ON ?auto_120461 ?auto_120462 ) ( ON ?auto_120460 ?auto_120461 ) ( ON ?auto_120459 ?auto_120460 ) ( ON ?auto_120458 ?auto_120459 ) ( CLEAR ?auto_120458 ) ( HOLDING ?auto_120457 ) ( CLEAR ?auto_120456 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120456 ?auto_120457 )
      ( MAKE-8PILE ?auto_120456 ?auto_120457 ?auto_120458 ?auto_120459 ?auto_120460 ?auto_120461 ?auto_120462 ?auto_120463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120464 - BLOCK
      ?auto_120465 - BLOCK
      ?auto_120466 - BLOCK
      ?auto_120467 - BLOCK
      ?auto_120468 - BLOCK
      ?auto_120469 - BLOCK
      ?auto_120470 - BLOCK
      ?auto_120471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120464 ) ( not ( = ?auto_120464 ?auto_120465 ) ) ( not ( = ?auto_120464 ?auto_120466 ) ) ( not ( = ?auto_120464 ?auto_120467 ) ) ( not ( = ?auto_120464 ?auto_120468 ) ) ( not ( = ?auto_120464 ?auto_120469 ) ) ( not ( = ?auto_120464 ?auto_120470 ) ) ( not ( = ?auto_120464 ?auto_120471 ) ) ( not ( = ?auto_120465 ?auto_120466 ) ) ( not ( = ?auto_120465 ?auto_120467 ) ) ( not ( = ?auto_120465 ?auto_120468 ) ) ( not ( = ?auto_120465 ?auto_120469 ) ) ( not ( = ?auto_120465 ?auto_120470 ) ) ( not ( = ?auto_120465 ?auto_120471 ) ) ( not ( = ?auto_120466 ?auto_120467 ) ) ( not ( = ?auto_120466 ?auto_120468 ) ) ( not ( = ?auto_120466 ?auto_120469 ) ) ( not ( = ?auto_120466 ?auto_120470 ) ) ( not ( = ?auto_120466 ?auto_120471 ) ) ( not ( = ?auto_120467 ?auto_120468 ) ) ( not ( = ?auto_120467 ?auto_120469 ) ) ( not ( = ?auto_120467 ?auto_120470 ) ) ( not ( = ?auto_120467 ?auto_120471 ) ) ( not ( = ?auto_120468 ?auto_120469 ) ) ( not ( = ?auto_120468 ?auto_120470 ) ) ( not ( = ?auto_120468 ?auto_120471 ) ) ( not ( = ?auto_120469 ?auto_120470 ) ) ( not ( = ?auto_120469 ?auto_120471 ) ) ( not ( = ?auto_120470 ?auto_120471 ) ) ( ON-TABLE ?auto_120471 ) ( ON ?auto_120470 ?auto_120471 ) ( ON ?auto_120469 ?auto_120470 ) ( ON ?auto_120468 ?auto_120469 ) ( ON ?auto_120467 ?auto_120468 ) ( ON ?auto_120466 ?auto_120467 ) ( CLEAR ?auto_120464 ) ( ON ?auto_120465 ?auto_120466 ) ( CLEAR ?auto_120465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120471 ?auto_120470 ?auto_120469 ?auto_120468 ?auto_120467 ?auto_120466 )
      ( MAKE-8PILE ?auto_120464 ?auto_120465 ?auto_120466 ?auto_120467 ?auto_120468 ?auto_120469 ?auto_120470 ?auto_120471 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120472 - BLOCK
      ?auto_120473 - BLOCK
      ?auto_120474 - BLOCK
      ?auto_120475 - BLOCK
      ?auto_120476 - BLOCK
      ?auto_120477 - BLOCK
      ?auto_120478 - BLOCK
      ?auto_120479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120472 ?auto_120473 ) ) ( not ( = ?auto_120472 ?auto_120474 ) ) ( not ( = ?auto_120472 ?auto_120475 ) ) ( not ( = ?auto_120472 ?auto_120476 ) ) ( not ( = ?auto_120472 ?auto_120477 ) ) ( not ( = ?auto_120472 ?auto_120478 ) ) ( not ( = ?auto_120472 ?auto_120479 ) ) ( not ( = ?auto_120473 ?auto_120474 ) ) ( not ( = ?auto_120473 ?auto_120475 ) ) ( not ( = ?auto_120473 ?auto_120476 ) ) ( not ( = ?auto_120473 ?auto_120477 ) ) ( not ( = ?auto_120473 ?auto_120478 ) ) ( not ( = ?auto_120473 ?auto_120479 ) ) ( not ( = ?auto_120474 ?auto_120475 ) ) ( not ( = ?auto_120474 ?auto_120476 ) ) ( not ( = ?auto_120474 ?auto_120477 ) ) ( not ( = ?auto_120474 ?auto_120478 ) ) ( not ( = ?auto_120474 ?auto_120479 ) ) ( not ( = ?auto_120475 ?auto_120476 ) ) ( not ( = ?auto_120475 ?auto_120477 ) ) ( not ( = ?auto_120475 ?auto_120478 ) ) ( not ( = ?auto_120475 ?auto_120479 ) ) ( not ( = ?auto_120476 ?auto_120477 ) ) ( not ( = ?auto_120476 ?auto_120478 ) ) ( not ( = ?auto_120476 ?auto_120479 ) ) ( not ( = ?auto_120477 ?auto_120478 ) ) ( not ( = ?auto_120477 ?auto_120479 ) ) ( not ( = ?auto_120478 ?auto_120479 ) ) ( ON-TABLE ?auto_120479 ) ( ON ?auto_120478 ?auto_120479 ) ( ON ?auto_120477 ?auto_120478 ) ( ON ?auto_120476 ?auto_120477 ) ( ON ?auto_120475 ?auto_120476 ) ( ON ?auto_120474 ?auto_120475 ) ( ON ?auto_120473 ?auto_120474 ) ( CLEAR ?auto_120473 ) ( HOLDING ?auto_120472 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120472 )
      ( MAKE-8PILE ?auto_120472 ?auto_120473 ?auto_120474 ?auto_120475 ?auto_120476 ?auto_120477 ?auto_120478 ?auto_120479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120480 - BLOCK
      ?auto_120481 - BLOCK
      ?auto_120482 - BLOCK
      ?auto_120483 - BLOCK
      ?auto_120484 - BLOCK
      ?auto_120485 - BLOCK
      ?auto_120486 - BLOCK
      ?auto_120487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120480 ?auto_120481 ) ) ( not ( = ?auto_120480 ?auto_120482 ) ) ( not ( = ?auto_120480 ?auto_120483 ) ) ( not ( = ?auto_120480 ?auto_120484 ) ) ( not ( = ?auto_120480 ?auto_120485 ) ) ( not ( = ?auto_120480 ?auto_120486 ) ) ( not ( = ?auto_120480 ?auto_120487 ) ) ( not ( = ?auto_120481 ?auto_120482 ) ) ( not ( = ?auto_120481 ?auto_120483 ) ) ( not ( = ?auto_120481 ?auto_120484 ) ) ( not ( = ?auto_120481 ?auto_120485 ) ) ( not ( = ?auto_120481 ?auto_120486 ) ) ( not ( = ?auto_120481 ?auto_120487 ) ) ( not ( = ?auto_120482 ?auto_120483 ) ) ( not ( = ?auto_120482 ?auto_120484 ) ) ( not ( = ?auto_120482 ?auto_120485 ) ) ( not ( = ?auto_120482 ?auto_120486 ) ) ( not ( = ?auto_120482 ?auto_120487 ) ) ( not ( = ?auto_120483 ?auto_120484 ) ) ( not ( = ?auto_120483 ?auto_120485 ) ) ( not ( = ?auto_120483 ?auto_120486 ) ) ( not ( = ?auto_120483 ?auto_120487 ) ) ( not ( = ?auto_120484 ?auto_120485 ) ) ( not ( = ?auto_120484 ?auto_120486 ) ) ( not ( = ?auto_120484 ?auto_120487 ) ) ( not ( = ?auto_120485 ?auto_120486 ) ) ( not ( = ?auto_120485 ?auto_120487 ) ) ( not ( = ?auto_120486 ?auto_120487 ) ) ( ON-TABLE ?auto_120487 ) ( ON ?auto_120486 ?auto_120487 ) ( ON ?auto_120485 ?auto_120486 ) ( ON ?auto_120484 ?auto_120485 ) ( ON ?auto_120483 ?auto_120484 ) ( ON ?auto_120482 ?auto_120483 ) ( ON ?auto_120481 ?auto_120482 ) ( ON ?auto_120480 ?auto_120481 ) ( CLEAR ?auto_120480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120487 ?auto_120486 ?auto_120485 ?auto_120484 ?auto_120483 ?auto_120482 ?auto_120481 )
      ( MAKE-8PILE ?auto_120480 ?auto_120481 ?auto_120482 ?auto_120483 ?auto_120484 ?auto_120485 ?auto_120486 ?auto_120487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120496 - BLOCK
      ?auto_120497 - BLOCK
      ?auto_120498 - BLOCK
      ?auto_120499 - BLOCK
      ?auto_120500 - BLOCK
      ?auto_120501 - BLOCK
      ?auto_120502 - BLOCK
      ?auto_120503 - BLOCK
    )
    :vars
    (
      ?auto_120504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120496 ?auto_120497 ) ) ( not ( = ?auto_120496 ?auto_120498 ) ) ( not ( = ?auto_120496 ?auto_120499 ) ) ( not ( = ?auto_120496 ?auto_120500 ) ) ( not ( = ?auto_120496 ?auto_120501 ) ) ( not ( = ?auto_120496 ?auto_120502 ) ) ( not ( = ?auto_120496 ?auto_120503 ) ) ( not ( = ?auto_120497 ?auto_120498 ) ) ( not ( = ?auto_120497 ?auto_120499 ) ) ( not ( = ?auto_120497 ?auto_120500 ) ) ( not ( = ?auto_120497 ?auto_120501 ) ) ( not ( = ?auto_120497 ?auto_120502 ) ) ( not ( = ?auto_120497 ?auto_120503 ) ) ( not ( = ?auto_120498 ?auto_120499 ) ) ( not ( = ?auto_120498 ?auto_120500 ) ) ( not ( = ?auto_120498 ?auto_120501 ) ) ( not ( = ?auto_120498 ?auto_120502 ) ) ( not ( = ?auto_120498 ?auto_120503 ) ) ( not ( = ?auto_120499 ?auto_120500 ) ) ( not ( = ?auto_120499 ?auto_120501 ) ) ( not ( = ?auto_120499 ?auto_120502 ) ) ( not ( = ?auto_120499 ?auto_120503 ) ) ( not ( = ?auto_120500 ?auto_120501 ) ) ( not ( = ?auto_120500 ?auto_120502 ) ) ( not ( = ?auto_120500 ?auto_120503 ) ) ( not ( = ?auto_120501 ?auto_120502 ) ) ( not ( = ?auto_120501 ?auto_120503 ) ) ( not ( = ?auto_120502 ?auto_120503 ) ) ( ON-TABLE ?auto_120503 ) ( ON ?auto_120502 ?auto_120503 ) ( ON ?auto_120501 ?auto_120502 ) ( ON ?auto_120500 ?auto_120501 ) ( ON ?auto_120499 ?auto_120500 ) ( ON ?auto_120498 ?auto_120499 ) ( ON ?auto_120497 ?auto_120498 ) ( CLEAR ?auto_120497 ) ( ON ?auto_120496 ?auto_120504 ) ( CLEAR ?auto_120496 ) ( HAND-EMPTY ) ( not ( = ?auto_120496 ?auto_120504 ) ) ( not ( = ?auto_120497 ?auto_120504 ) ) ( not ( = ?auto_120498 ?auto_120504 ) ) ( not ( = ?auto_120499 ?auto_120504 ) ) ( not ( = ?auto_120500 ?auto_120504 ) ) ( not ( = ?auto_120501 ?auto_120504 ) ) ( not ( = ?auto_120502 ?auto_120504 ) ) ( not ( = ?auto_120503 ?auto_120504 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120496 ?auto_120504 )
      ( MAKE-8PILE ?auto_120496 ?auto_120497 ?auto_120498 ?auto_120499 ?auto_120500 ?auto_120501 ?auto_120502 ?auto_120503 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120505 - BLOCK
      ?auto_120506 - BLOCK
      ?auto_120507 - BLOCK
      ?auto_120508 - BLOCK
      ?auto_120509 - BLOCK
      ?auto_120510 - BLOCK
      ?auto_120511 - BLOCK
      ?auto_120512 - BLOCK
    )
    :vars
    (
      ?auto_120513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120505 ?auto_120506 ) ) ( not ( = ?auto_120505 ?auto_120507 ) ) ( not ( = ?auto_120505 ?auto_120508 ) ) ( not ( = ?auto_120505 ?auto_120509 ) ) ( not ( = ?auto_120505 ?auto_120510 ) ) ( not ( = ?auto_120505 ?auto_120511 ) ) ( not ( = ?auto_120505 ?auto_120512 ) ) ( not ( = ?auto_120506 ?auto_120507 ) ) ( not ( = ?auto_120506 ?auto_120508 ) ) ( not ( = ?auto_120506 ?auto_120509 ) ) ( not ( = ?auto_120506 ?auto_120510 ) ) ( not ( = ?auto_120506 ?auto_120511 ) ) ( not ( = ?auto_120506 ?auto_120512 ) ) ( not ( = ?auto_120507 ?auto_120508 ) ) ( not ( = ?auto_120507 ?auto_120509 ) ) ( not ( = ?auto_120507 ?auto_120510 ) ) ( not ( = ?auto_120507 ?auto_120511 ) ) ( not ( = ?auto_120507 ?auto_120512 ) ) ( not ( = ?auto_120508 ?auto_120509 ) ) ( not ( = ?auto_120508 ?auto_120510 ) ) ( not ( = ?auto_120508 ?auto_120511 ) ) ( not ( = ?auto_120508 ?auto_120512 ) ) ( not ( = ?auto_120509 ?auto_120510 ) ) ( not ( = ?auto_120509 ?auto_120511 ) ) ( not ( = ?auto_120509 ?auto_120512 ) ) ( not ( = ?auto_120510 ?auto_120511 ) ) ( not ( = ?auto_120510 ?auto_120512 ) ) ( not ( = ?auto_120511 ?auto_120512 ) ) ( ON-TABLE ?auto_120512 ) ( ON ?auto_120511 ?auto_120512 ) ( ON ?auto_120510 ?auto_120511 ) ( ON ?auto_120509 ?auto_120510 ) ( ON ?auto_120508 ?auto_120509 ) ( ON ?auto_120507 ?auto_120508 ) ( ON ?auto_120505 ?auto_120513 ) ( CLEAR ?auto_120505 ) ( not ( = ?auto_120505 ?auto_120513 ) ) ( not ( = ?auto_120506 ?auto_120513 ) ) ( not ( = ?auto_120507 ?auto_120513 ) ) ( not ( = ?auto_120508 ?auto_120513 ) ) ( not ( = ?auto_120509 ?auto_120513 ) ) ( not ( = ?auto_120510 ?auto_120513 ) ) ( not ( = ?auto_120511 ?auto_120513 ) ) ( not ( = ?auto_120512 ?auto_120513 ) ) ( HOLDING ?auto_120506 ) ( CLEAR ?auto_120507 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120512 ?auto_120511 ?auto_120510 ?auto_120509 ?auto_120508 ?auto_120507 ?auto_120506 )
      ( MAKE-8PILE ?auto_120505 ?auto_120506 ?auto_120507 ?auto_120508 ?auto_120509 ?auto_120510 ?auto_120511 ?auto_120512 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120514 - BLOCK
      ?auto_120515 - BLOCK
      ?auto_120516 - BLOCK
      ?auto_120517 - BLOCK
      ?auto_120518 - BLOCK
      ?auto_120519 - BLOCK
      ?auto_120520 - BLOCK
      ?auto_120521 - BLOCK
    )
    :vars
    (
      ?auto_120522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120514 ?auto_120515 ) ) ( not ( = ?auto_120514 ?auto_120516 ) ) ( not ( = ?auto_120514 ?auto_120517 ) ) ( not ( = ?auto_120514 ?auto_120518 ) ) ( not ( = ?auto_120514 ?auto_120519 ) ) ( not ( = ?auto_120514 ?auto_120520 ) ) ( not ( = ?auto_120514 ?auto_120521 ) ) ( not ( = ?auto_120515 ?auto_120516 ) ) ( not ( = ?auto_120515 ?auto_120517 ) ) ( not ( = ?auto_120515 ?auto_120518 ) ) ( not ( = ?auto_120515 ?auto_120519 ) ) ( not ( = ?auto_120515 ?auto_120520 ) ) ( not ( = ?auto_120515 ?auto_120521 ) ) ( not ( = ?auto_120516 ?auto_120517 ) ) ( not ( = ?auto_120516 ?auto_120518 ) ) ( not ( = ?auto_120516 ?auto_120519 ) ) ( not ( = ?auto_120516 ?auto_120520 ) ) ( not ( = ?auto_120516 ?auto_120521 ) ) ( not ( = ?auto_120517 ?auto_120518 ) ) ( not ( = ?auto_120517 ?auto_120519 ) ) ( not ( = ?auto_120517 ?auto_120520 ) ) ( not ( = ?auto_120517 ?auto_120521 ) ) ( not ( = ?auto_120518 ?auto_120519 ) ) ( not ( = ?auto_120518 ?auto_120520 ) ) ( not ( = ?auto_120518 ?auto_120521 ) ) ( not ( = ?auto_120519 ?auto_120520 ) ) ( not ( = ?auto_120519 ?auto_120521 ) ) ( not ( = ?auto_120520 ?auto_120521 ) ) ( ON-TABLE ?auto_120521 ) ( ON ?auto_120520 ?auto_120521 ) ( ON ?auto_120519 ?auto_120520 ) ( ON ?auto_120518 ?auto_120519 ) ( ON ?auto_120517 ?auto_120518 ) ( ON ?auto_120516 ?auto_120517 ) ( ON ?auto_120514 ?auto_120522 ) ( not ( = ?auto_120514 ?auto_120522 ) ) ( not ( = ?auto_120515 ?auto_120522 ) ) ( not ( = ?auto_120516 ?auto_120522 ) ) ( not ( = ?auto_120517 ?auto_120522 ) ) ( not ( = ?auto_120518 ?auto_120522 ) ) ( not ( = ?auto_120519 ?auto_120522 ) ) ( not ( = ?auto_120520 ?auto_120522 ) ) ( not ( = ?auto_120521 ?auto_120522 ) ) ( CLEAR ?auto_120516 ) ( ON ?auto_120515 ?auto_120514 ) ( CLEAR ?auto_120515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120522 ?auto_120514 )
      ( MAKE-8PILE ?auto_120514 ?auto_120515 ?auto_120516 ?auto_120517 ?auto_120518 ?auto_120519 ?auto_120520 ?auto_120521 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120523 - BLOCK
      ?auto_120524 - BLOCK
      ?auto_120525 - BLOCK
      ?auto_120526 - BLOCK
      ?auto_120527 - BLOCK
      ?auto_120528 - BLOCK
      ?auto_120529 - BLOCK
      ?auto_120530 - BLOCK
    )
    :vars
    (
      ?auto_120531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120523 ?auto_120524 ) ) ( not ( = ?auto_120523 ?auto_120525 ) ) ( not ( = ?auto_120523 ?auto_120526 ) ) ( not ( = ?auto_120523 ?auto_120527 ) ) ( not ( = ?auto_120523 ?auto_120528 ) ) ( not ( = ?auto_120523 ?auto_120529 ) ) ( not ( = ?auto_120523 ?auto_120530 ) ) ( not ( = ?auto_120524 ?auto_120525 ) ) ( not ( = ?auto_120524 ?auto_120526 ) ) ( not ( = ?auto_120524 ?auto_120527 ) ) ( not ( = ?auto_120524 ?auto_120528 ) ) ( not ( = ?auto_120524 ?auto_120529 ) ) ( not ( = ?auto_120524 ?auto_120530 ) ) ( not ( = ?auto_120525 ?auto_120526 ) ) ( not ( = ?auto_120525 ?auto_120527 ) ) ( not ( = ?auto_120525 ?auto_120528 ) ) ( not ( = ?auto_120525 ?auto_120529 ) ) ( not ( = ?auto_120525 ?auto_120530 ) ) ( not ( = ?auto_120526 ?auto_120527 ) ) ( not ( = ?auto_120526 ?auto_120528 ) ) ( not ( = ?auto_120526 ?auto_120529 ) ) ( not ( = ?auto_120526 ?auto_120530 ) ) ( not ( = ?auto_120527 ?auto_120528 ) ) ( not ( = ?auto_120527 ?auto_120529 ) ) ( not ( = ?auto_120527 ?auto_120530 ) ) ( not ( = ?auto_120528 ?auto_120529 ) ) ( not ( = ?auto_120528 ?auto_120530 ) ) ( not ( = ?auto_120529 ?auto_120530 ) ) ( ON-TABLE ?auto_120530 ) ( ON ?auto_120529 ?auto_120530 ) ( ON ?auto_120528 ?auto_120529 ) ( ON ?auto_120527 ?auto_120528 ) ( ON ?auto_120526 ?auto_120527 ) ( ON ?auto_120523 ?auto_120531 ) ( not ( = ?auto_120523 ?auto_120531 ) ) ( not ( = ?auto_120524 ?auto_120531 ) ) ( not ( = ?auto_120525 ?auto_120531 ) ) ( not ( = ?auto_120526 ?auto_120531 ) ) ( not ( = ?auto_120527 ?auto_120531 ) ) ( not ( = ?auto_120528 ?auto_120531 ) ) ( not ( = ?auto_120529 ?auto_120531 ) ) ( not ( = ?auto_120530 ?auto_120531 ) ) ( ON ?auto_120524 ?auto_120523 ) ( CLEAR ?auto_120524 ) ( ON-TABLE ?auto_120531 ) ( HOLDING ?auto_120525 ) ( CLEAR ?auto_120526 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120530 ?auto_120529 ?auto_120528 ?auto_120527 ?auto_120526 ?auto_120525 )
      ( MAKE-8PILE ?auto_120523 ?auto_120524 ?auto_120525 ?auto_120526 ?auto_120527 ?auto_120528 ?auto_120529 ?auto_120530 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120532 - BLOCK
      ?auto_120533 - BLOCK
      ?auto_120534 - BLOCK
      ?auto_120535 - BLOCK
      ?auto_120536 - BLOCK
      ?auto_120537 - BLOCK
      ?auto_120538 - BLOCK
      ?auto_120539 - BLOCK
    )
    :vars
    (
      ?auto_120540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120532 ?auto_120533 ) ) ( not ( = ?auto_120532 ?auto_120534 ) ) ( not ( = ?auto_120532 ?auto_120535 ) ) ( not ( = ?auto_120532 ?auto_120536 ) ) ( not ( = ?auto_120532 ?auto_120537 ) ) ( not ( = ?auto_120532 ?auto_120538 ) ) ( not ( = ?auto_120532 ?auto_120539 ) ) ( not ( = ?auto_120533 ?auto_120534 ) ) ( not ( = ?auto_120533 ?auto_120535 ) ) ( not ( = ?auto_120533 ?auto_120536 ) ) ( not ( = ?auto_120533 ?auto_120537 ) ) ( not ( = ?auto_120533 ?auto_120538 ) ) ( not ( = ?auto_120533 ?auto_120539 ) ) ( not ( = ?auto_120534 ?auto_120535 ) ) ( not ( = ?auto_120534 ?auto_120536 ) ) ( not ( = ?auto_120534 ?auto_120537 ) ) ( not ( = ?auto_120534 ?auto_120538 ) ) ( not ( = ?auto_120534 ?auto_120539 ) ) ( not ( = ?auto_120535 ?auto_120536 ) ) ( not ( = ?auto_120535 ?auto_120537 ) ) ( not ( = ?auto_120535 ?auto_120538 ) ) ( not ( = ?auto_120535 ?auto_120539 ) ) ( not ( = ?auto_120536 ?auto_120537 ) ) ( not ( = ?auto_120536 ?auto_120538 ) ) ( not ( = ?auto_120536 ?auto_120539 ) ) ( not ( = ?auto_120537 ?auto_120538 ) ) ( not ( = ?auto_120537 ?auto_120539 ) ) ( not ( = ?auto_120538 ?auto_120539 ) ) ( ON-TABLE ?auto_120539 ) ( ON ?auto_120538 ?auto_120539 ) ( ON ?auto_120537 ?auto_120538 ) ( ON ?auto_120536 ?auto_120537 ) ( ON ?auto_120535 ?auto_120536 ) ( ON ?auto_120532 ?auto_120540 ) ( not ( = ?auto_120532 ?auto_120540 ) ) ( not ( = ?auto_120533 ?auto_120540 ) ) ( not ( = ?auto_120534 ?auto_120540 ) ) ( not ( = ?auto_120535 ?auto_120540 ) ) ( not ( = ?auto_120536 ?auto_120540 ) ) ( not ( = ?auto_120537 ?auto_120540 ) ) ( not ( = ?auto_120538 ?auto_120540 ) ) ( not ( = ?auto_120539 ?auto_120540 ) ) ( ON ?auto_120533 ?auto_120532 ) ( ON-TABLE ?auto_120540 ) ( CLEAR ?auto_120535 ) ( ON ?auto_120534 ?auto_120533 ) ( CLEAR ?auto_120534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120540 ?auto_120532 ?auto_120533 )
      ( MAKE-8PILE ?auto_120532 ?auto_120533 ?auto_120534 ?auto_120535 ?auto_120536 ?auto_120537 ?auto_120538 ?auto_120539 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120541 - BLOCK
      ?auto_120542 - BLOCK
      ?auto_120543 - BLOCK
      ?auto_120544 - BLOCK
      ?auto_120545 - BLOCK
      ?auto_120546 - BLOCK
      ?auto_120547 - BLOCK
      ?auto_120548 - BLOCK
    )
    :vars
    (
      ?auto_120549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120541 ?auto_120542 ) ) ( not ( = ?auto_120541 ?auto_120543 ) ) ( not ( = ?auto_120541 ?auto_120544 ) ) ( not ( = ?auto_120541 ?auto_120545 ) ) ( not ( = ?auto_120541 ?auto_120546 ) ) ( not ( = ?auto_120541 ?auto_120547 ) ) ( not ( = ?auto_120541 ?auto_120548 ) ) ( not ( = ?auto_120542 ?auto_120543 ) ) ( not ( = ?auto_120542 ?auto_120544 ) ) ( not ( = ?auto_120542 ?auto_120545 ) ) ( not ( = ?auto_120542 ?auto_120546 ) ) ( not ( = ?auto_120542 ?auto_120547 ) ) ( not ( = ?auto_120542 ?auto_120548 ) ) ( not ( = ?auto_120543 ?auto_120544 ) ) ( not ( = ?auto_120543 ?auto_120545 ) ) ( not ( = ?auto_120543 ?auto_120546 ) ) ( not ( = ?auto_120543 ?auto_120547 ) ) ( not ( = ?auto_120543 ?auto_120548 ) ) ( not ( = ?auto_120544 ?auto_120545 ) ) ( not ( = ?auto_120544 ?auto_120546 ) ) ( not ( = ?auto_120544 ?auto_120547 ) ) ( not ( = ?auto_120544 ?auto_120548 ) ) ( not ( = ?auto_120545 ?auto_120546 ) ) ( not ( = ?auto_120545 ?auto_120547 ) ) ( not ( = ?auto_120545 ?auto_120548 ) ) ( not ( = ?auto_120546 ?auto_120547 ) ) ( not ( = ?auto_120546 ?auto_120548 ) ) ( not ( = ?auto_120547 ?auto_120548 ) ) ( ON-TABLE ?auto_120548 ) ( ON ?auto_120547 ?auto_120548 ) ( ON ?auto_120546 ?auto_120547 ) ( ON ?auto_120545 ?auto_120546 ) ( ON ?auto_120541 ?auto_120549 ) ( not ( = ?auto_120541 ?auto_120549 ) ) ( not ( = ?auto_120542 ?auto_120549 ) ) ( not ( = ?auto_120543 ?auto_120549 ) ) ( not ( = ?auto_120544 ?auto_120549 ) ) ( not ( = ?auto_120545 ?auto_120549 ) ) ( not ( = ?auto_120546 ?auto_120549 ) ) ( not ( = ?auto_120547 ?auto_120549 ) ) ( not ( = ?auto_120548 ?auto_120549 ) ) ( ON ?auto_120542 ?auto_120541 ) ( ON-TABLE ?auto_120549 ) ( ON ?auto_120543 ?auto_120542 ) ( CLEAR ?auto_120543 ) ( HOLDING ?auto_120544 ) ( CLEAR ?auto_120545 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120548 ?auto_120547 ?auto_120546 ?auto_120545 ?auto_120544 )
      ( MAKE-8PILE ?auto_120541 ?auto_120542 ?auto_120543 ?auto_120544 ?auto_120545 ?auto_120546 ?auto_120547 ?auto_120548 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120550 - BLOCK
      ?auto_120551 - BLOCK
      ?auto_120552 - BLOCK
      ?auto_120553 - BLOCK
      ?auto_120554 - BLOCK
      ?auto_120555 - BLOCK
      ?auto_120556 - BLOCK
      ?auto_120557 - BLOCK
    )
    :vars
    (
      ?auto_120558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120550 ?auto_120551 ) ) ( not ( = ?auto_120550 ?auto_120552 ) ) ( not ( = ?auto_120550 ?auto_120553 ) ) ( not ( = ?auto_120550 ?auto_120554 ) ) ( not ( = ?auto_120550 ?auto_120555 ) ) ( not ( = ?auto_120550 ?auto_120556 ) ) ( not ( = ?auto_120550 ?auto_120557 ) ) ( not ( = ?auto_120551 ?auto_120552 ) ) ( not ( = ?auto_120551 ?auto_120553 ) ) ( not ( = ?auto_120551 ?auto_120554 ) ) ( not ( = ?auto_120551 ?auto_120555 ) ) ( not ( = ?auto_120551 ?auto_120556 ) ) ( not ( = ?auto_120551 ?auto_120557 ) ) ( not ( = ?auto_120552 ?auto_120553 ) ) ( not ( = ?auto_120552 ?auto_120554 ) ) ( not ( = ?auto_120552 ?auto_120555 ) ) ( not ( = ?auto_120552 ?auto_120556 ) ) ( not ( = ?auto_120552 ?auto_120557 ) ) ( not ( = ?auto_120553 ?auto_120554 ) ) ( not ( = ?auto_120553 ?auto_120555 ) ) ( not ( = ?auto_120553 ?auto_120556 ) ) ( not ( = ?auto_120553 ?auto_120557 ) ) ( not ( = ?auto_120554 ?auto_120555 ) ) ( not ( = ?auto_120554 ?auto_120556 ) ) ( not ( = ?auto_120554 ?auto_120557 ) ) ( not ( = ?auto_120555 ?auto_120556 ) ) ( not ( = ?auto_120555 ?auto_120557 ) ) ( not ( = ?auto_120556 ?auto_120557 ) ) ( ON-TABLE ?auto_120557 ) ( ON ?auto_120556 ?auto_120557 ) ( ON ?auto_120555 ?auto_120556 ) ( ON ?auto_120554 ?auto_120555 ) ( ON ?auto_120550 ?auto_120558 ) ( not ( = ?auto_120550 ?auto_120558 ) ) ( not ( = ?auto_120551 ?auto_120558 ) ) ( not ( = ?auto_120552 ?auto_120558 ) ) ( not ( = ?auto_120553 ?auto_120558 ) ) ( not ( = ?auto_120554 ?auto_120558 ) ) ( not ( = ?auto_120555 ?auto_120558 ) ) ( not ( = ?auto_120556 ?auto_120558 ) ) ( not ( = ?auto_120557 ?auto_120558 ) ) ( ON ?auto_120551 ?auto_120550 ) ( ON-TABLE ?auto_120558 ) ( ON ?auto_120552 ?auto_120551 ) ( CLEAR ?auto_120554 ) ( ON ?auto_120553 ?auto_120552 ) ( CLEAR ?auto_120553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120558 ?auto_120550 ?auto_120551 ?auto_120552 )
      ( MAKE-8PILE ?auto_120550 ?auto_120551 ?auto_120552 ?auto_120553 ?auto_120554 ?auto_120555 ?auto_120556 ?auto_120557 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120559 - BLOCK
      ?auto_120560 - BLOCK
      ?auto_120561 - BLOCK
      ?auto_120562 - BLOCK
      ?auto_120563 - BLOCK
      ?auto_120564 - BLOCK
      ?auto_120565 - BLOCK
      ?auto_120566 - BLOCK
    )
    :vars
    (
      ?auto_120567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120559 ?auto_120560 ) ) ( not ( = ?auto_120559 ?auto_120561 ) ) ( not ( = ?auto_120559 ?auto_120562 ) ) ( not ( = ?auto_120559 ?auto_120563 ) ) ( not ( = ?auto_120559 ?auto_120564 ) ) ( not ( = ?auto_120559 ?auto_120565 ) ) ( not ( = ?auto_120559 ?auto_120566 ) ) ( not ( = ?auto_120560 ?auto_120561 ) ) ( not ( = ?auto_120560 ?auto_120562 ) ) ( not ( = ?auto_120560 ?auto_120563 ) ) ( not ( = ?auto_120560 ?auto_120564 ) ) ( not ( = ?auto_120560 ?auto_120565 ) ) ( not ( = ?auto_120560 ?auto_120566 ) ) ( not ( = ?auto_120561 ?auto_120562 ) ) ( not ( = ?auto_120561 ?auto_120563 ) ) ( not ( = ?auto_120561 ?auto_120564 ) ) ( not ( = ?auto_120561 ?auto_120565 ) ) ( not ( = ?auto_120561 ?auto_120566 ) ) ( not ( = ?auto_120562 ?auto_120563 ) ) ( not ( = ?auto_120562 ?auto_120564 ) ) ( not ( = ?auto_120562 ?auto_120565 ) ) ( not ( = ?auto_120562 ?auto_120566 ) ) ( not ( = ?auto_120563 ?auto_120564 ) ) ( not ( = ?auto_120563 ?auto_120565 ) ) ( not ( = ?auto_120563 ?auto_120566 ) ) ( not ( = ?auto_120564 ?auto_120565 ) ) ( not ( = ?auto_120564 ?auto_120566 ) ) ( not ( = ?auto_120565 ?auto_120566 ) ) ( ON-TABLE ?auto_120566 ) ( ON ?auto_120565 ?auto_120566 ) ( ON ?auto_120564 ?auto_120565 ) ( ON ?auto_120559 ?auto_120567 ) ( not ( = ?auto_120559 ?auto_120567 ) ) ( not ( = ?auto_120560 ?auto_120567 ) ) ( not ( = ?auto_120561 ?auto_120567 ) ) ( not ( = ?auto_120562 ?auto_120567 ) ) ( not ( = ?auto_120563 ?auto_120567 ) ) ( not ( = ?auto_120564 ?auto_120567 ) ) ( not ( = ?auto_120565 ?auto_120567 ) ) ( not ( = ?auto_120566 ?auto_120567 ) ) ( ON ?auto_120560 ?auto_120559 ) ( ON-TABLE ?auto_120567 ) ( ON ?auto_120561 ?auto_120560 ) ( ON ?auto_120562 ?auto_120561 ) ( CLEAR ?auto_120562 ) ( HOLDING ?auto_120563 ) ( CLEAR ?auto_120564 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120566 ?auto_120565 ?auto_120564 ?auto_120563 )
      ( MAKE-8PILE ?auto_120559 ?auto_120560 ?auto_120561 ?auto_120562 ?auto_120563 ?auto_120564 ?auto_120565 ?auto_120566 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120568 - BLOCK
      ?auto_120569 - BLOCK
      ?auto_120570 - BLOCK
      ?auto_120571 - BLOCK
      ?auto_120572 - BLOCK
      ?auto_120573 - BLOCK
      ?auto_120574 - BLOCK
      ?auto_120575 - BLOCK
    )
    :vars
    (
      ?auto_120576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120568 ?auto_120569 ) ) ( not ( = ?auto_120568 ?auto_120570 ) ) ( not ( = ?auto_120568 ?auto_120571 ) ) ( not ( = ?auto_120568 ?auto_120572 ) ) ( not ( = ?auto_120568 ?auto_120573 ) ) ( not ( = ?auto_120568 ?auto_120574 ) ) ( not ( = ?auto_120568 ?auto_120575 ) ) ( not ( = ?auto_120569 ?auto_120570 ) ) ( not ( = ?auto_120569 ?auto_120571 ) ) ( not ( = ?auto_120569 ?auto_120572 ) ) ( not ( = ?auto_120569 ?auto_120573 ) ) ( not ( = ?auto_120569 ?auto_120574 ) ) ( not ( = ?auto_120569 ?auto_120575 ) ) ( not ( = ?auto_120570 ?auto_120571 ) ) ( not ( = ?auto_120570 ?auto_120572 ) ) ( not ( = ?auto_120570 ?auto_120573 ) ) ( not ( = ?auto_120570 ?auto_120574 ) ) ( not ( = ?auto_120570 ?auto_120575 ) ) ( not ( = ?auto_120571 ?auto_120572 ) ) ( not ( = ?auto_120571 ?auto_120573 ) ) ( not ( = ?auto_120571 ?auto_120574 ) ) ( not ( = ?auto_120571 ?auto_120575 ) ) ( not ( = ?auto_120572 ?auto_120573 ) ) ( not ( = ?auto_120572 ?auto_120574 ) ) ( not ( = ?auto_120572 ?auto_120575 ) ) ( not ( = ?auto_120573 ?auto_120574 ) ) ( not ( = ?auto_120573 ?auto_120575 ) ) ( not ( = ?auto_120574 ?auto_120575 ) ) ( ON-TABLE ?auto_120575 ) ( ON ?auto_120574 ?auto_120575 ) ( ON ?auto_120573 ?auto_120574 ) ( ON ?auto_120568 ?auto_120576 ) ( not ( = ?auto_120568 ?auto_120576 ) ) ( not ( = ?auto_120569 ?auto_120576 ) ) ( not ( = ?auto_120570 ?auto_120576 ) ) ( not ( = ?auto_120571 ?auto_120576 ) ) ( not ( = ?auto_120572 ?auto_120576 ) ) ( not ( = ?auto_120573 ?auto_120576 ) ) ( not ( = ?auto_120574 ?auto_120576 ) ) ( not ( = ?auto_120575 ?auto_120576 ) ) ( ON ?auto_120569 ?auto_120568 ) ( ON-TABLE ?auto_120576 ) ( ON ?auto_120570 ?auto_120569 ) ( ON ?auto_120571 ?auto_120570 ) ( CLEAR ?auto_120573 ) ( ON ?auto_120572 ?auto_120571 ) ( CLEAR ?auto_120572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120576 ?auto_120568 ?auto_120569 ?auto_120570 ?auto_120571 )
      ( MAKE-8PILE ?auto_120568 ?auto_120569 ?auto_120570 ?auto_120571 ?auto_120572 ?auto_120573 ?auto_120574 ?auto_120575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120577 - BLOCK
      ?auto_120578 - BLOCK
      ?auto_120579 - BLOCK
      ?auto_120580 - BLOCK
      ?auto_120581 - BLOCK
      ?auto_120582 - BLOCK
      ?auto_120583 - BLOCK
      ?auto_120584 - BLOCK
    )
    :vars
    (
      ?auto_120585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120577 ?auto_120578 ) ) ( not ( = ?auto_120577 ?auto_120579 ) ) ( not ( = ?auto_120577 ?auto_120580 ) ) ( not ( = ?auto_120577 ?auto_120581 ) ) ( not ( = ?auto_120577 ?auto_120582 ) ) ( not ( = ?auto_120577 ?auto_120583 ) ) ( not ( = ?auto_120577 ?auto_120584 ) ) ( not ( = ?auto_120578 ?auto_120579 ) ) ( not ( = ?auto_120578 ?auto_120580 ) ) ( not ( = ?auto_120578 ?auto_120581 ) ) ( not ( = ?auto_120578 ?auto_120582 ) ) ( not ( = ?auto_120578 ?auto_120583 ) ) ( not ( = ?auto_120578 ?auto_120584 ) ) ( not ( = ?auto_120579 ?auto_120580 ) ) ( not ( = ?auto_120579 ?auto_120581 ) ) ( not ( = ?auto_120579 ?auto_120582 ) ) ( not ( = ?auto_120579 ?auto_120583 ) ) ( not ( = ?auto_120579 ?auto_120584 ) ) ( not ( = ?auto_120580 ?auto_120581 ) ) ( not ( = ?auto_120580 ?auto_120582 ) ) ( not ( = ?auto_120580 ?auto_120583 ) ) ( not ( = ?auto_120580 ?auto_120584 ) ) ( not ( = ?auto_120581 ?auto_120582 ) ) ( not ( = ?auto_120581 ?auto_120583 ) ) ( not ( = ?auto_120581 ?auto_120584 ) ) ( not ( = ?auto_120582 ?auto_120583 ) ) ( not ( = ?auto_120582 ?auto_120584 ) ) ( not ( = ?auto_120583 ?auto_120584 ) ) ( ON-TABLE ?auto_120584 ) ( ON ?auto_120583 ?auto_120584 ) ( ON ?auto_120577 ?auto_120585 ) ( not ( = ?auto_120577 ?auto_120585 ) ) ( not ( = ?auto_120578 ?auto_120585 ) ) ( not ( = ?auto_120579 ?auto_120585 ) ) ( not ( = ?auto_120580 ?auto_120585 ) ) ( not ( = ?auto_120581 ?auto_120585 ) ) ( not ( = ?auto_120582 ?auto_120585 ) ) ( not ( = ?auto_120583 ?auto_120585 ) ) ( not ( = ?auto_120584 ?auto_120585 ) ) ( ON ?auto_120578 ?auto_120577 ) ( ON-TABLE ?auto_120585 ) ( ON ?auto_120579 ?auto_120578 ) ( ON ?auto_120580 ?auto_120579 ) ( ON ?auto_120581 ?auto_120580 ) ( CLEAR ?auto_120581 ) ( HOLDING ?auto_120582 ) ( CLEAR ?auto_120583 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120584 ?auto_120583 ?auto_120582 )
      ( MAKE-8PILE ?auto_120577 ?auto_120578 ?auto_120579 ?auto_120580 ?auto_120581 ?auto_120582 ?auto_120583 ?auto_120584 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120586 - BLOCK
      ?auto_120587 - BLOCK
      ?auto_120588 - BLOCK
      ?auto_120589 - BLOCK
      ?auto_120590 - BLOCK
      ?auto_120591 - BLOCK
      ?auto_120592 - BLOCK
      ?auto_120593 - BLOCK
    )
    :vars
    (
      ?auto_120594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120586 ?auto_120587 ) ) ( not ( = ?auto_120586 ?auto_120588 ) ) ( not ( = ?auto_120586 ?auto_120589 ) ) ( not ( = ?auto_120586 ?auto_120590 ) ) ( not ( = ?auto_120586 ?auto_120591 ) ) ( not ( = ?auto_120586 ?auto_120592 ) ) ( not ( = ?auto_120586 ?auto_120593 ) ) ( not ( = ?auto_120587 ?auto_120588 ) ) ( not ( = ?auto_120587 ?auto_120589 ) ) ( not ( = ?auto_120587 ?auto_120590 ) ) ( not ( = ?auto_120587 ?auto_120591 ) ) ( not ( = ?auto_120587 ?auto_120592 ) ) ( not ( = ?auto_120587 ?auto_120593 ) ) ( not ( = ?auto_120588 ?auto_120589 ) ) ( not ( = ?auto_120588 ?auto_120590 ) ) ( not ( = ?auto_120588 ?auto_120591 ) ) ( not ( = ?auto_120588 ?auto_120592 ) ) ( not ( = ?auto_120588 ?auto_120593 ) ) ( not ( = ?auto_120589 ?auto_120590 ) ) ( not ( = ?auto_120589 ?auto_120591 ) ) ( not ( = ?auto_120589 ?auto_120592 ) ) ( not ( = ?auto_120589 ?auto_120593 ) ) ( not ( = ?auto_120590 ?auto_120591 ) ) ( not ( = ?auto_120590 ?auto_120592 ) ) ( not ( = ?auto_120590 ?auto_120593 ) ) ( not ( = ?auto_120591 ?auto_120592 ) ) ( not ( = ?auto_120591 ?auto_120593 ) ) ( not ( = ?auto_120592 ?auto_120593 ) ) ( ON-TABLE ?auto_120593 ) ( ON ?auto_120592 ?auto_120593 ) ( ON ?auto_120586 ?auto_120594 ) ( not ( = ?auto_120586 ?auto_120594 ) ) ( not ( = ?auto_120587 ?auto_120594 ) ) ( not ( = ?auto_120588 ?auto_120594 ) ) ( not ( = ?auto_120589 ?auto_120594 ) ) ( not ( = ?auto_120590 ?auto_120594 ) ) ( not ( = ?auto_120591 ?auto_120594 ) ) ( not ( = ?auto_120592 ?auto_120594 ) ) ( not ( = ?auto_120593 ?auto_120594 ) ) ( ON ?auto_120587 ?auto_120586 ) ( ON-TABLE ?auto_120594 ) ( ON ?auto_120588 ?auto_120587 ) ( ON ?auto_120589 ?auto_120588 ) ( ON ?auto_120590 ?auto_120589 ) ( CLEAR ?auto_120592 ) ( ON ?auto_120591 ?auto_120590 ) ( CLEAR ?auto_120591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120594 ?auto_120586 ?auto_120587 ?auto_120588 ?auto_120589 ?auto_120590 )
      ( MAKE-8PILE ?auto_120586 ?auto_120587 ?auto_120588 ?auto_120589 ?auto_120590 ?auto_120591 ?auto_120592 ?auto_120593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120595 - BLOCK
      ?auto_120596 - BLOCK
      ?auto_120597 - BLOCK
      ?auto_120598 - BLOCK
      ?auto_120599 - BLOCK
      ?auto_120600 - BLOCK
      ?auto_120601 - BLOCK
      ?auto_120602 - BLOCK
    )
    :vars
    (
      ?auto_120603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120595 ?auto_120596 ) ) ( not ( = ?auto_120595 ?auto_120597 ) ) ( not ( = ?auto_120595 ?auto_120598 ) ) ( not ( = ?auto_120595 ?auto_120599 ) ) ( not ( = ?auto_120595 ?auto_120600 ) ) ( not ( = ?auto_120595 ?auto_120601 ) ) ( not ( = ?auto_120595 ?auto_120602 ) ) ( not ( = ?auto_120596 ?auto_120597 ) ) ( not ( = ?auto_120596 ?auto_120598 ) ) ( not ( = ?auto_120596 ?auto_120599 ) ) ( not ( = ?auto_120596 ?auto_120600 ) ) ( not ( = ?auto_120596 ?auto_120601 ) ) ( not ( = ?auto_120596 ?auto_120602 ) ) ( not ( = ?auto_120597 ?auto_120598 ) ) ( not ( = ?auto_120597 ?auto_120599 ) ) ( not ( = ?auto_120597 ?auto_120600 ) ) ( not ( = ?auto_120597 ?auto_120601 ) ) ( not ( = ?auto_120597 ?auto_120602 ) ) ( not ( = ?auto_120598 ?auto_120599 ) ) ( not ( = ?auto_120598 ?auto_120600 ) ) ( not ( = ?auto_120598 ?auto_120601 ) ) ( not ( = ?auto_120598 ?auto_120602 ) ) ( not ( = ?auto_120599 ?auto_120600 ) ) ( not ( = ?auto_120599 ?auto_120601 ) ) ( not ( = ?auto_120599 ?auto_120602 ) ) ( not ( = ?auto_120600 ?auto_120601 ) ) ( not ( = ?auto_120600 ?auto_120602 ) ) ( not ( = ?auto_120601 ?auto_120602 ) ) ( ON-TABLE ?auto_120602 ) ( ON ?auto_120595 ?auto_120603 ) ( not ( = ?auto_120595 ?auto_120603 ) ) ( not ( = ?auto_120596 ?auto_120603 ) ) ( not ( = ?auto_120597 ?auto_120603 ) ) ( not ( = ?auto_120598 ?auto_120603 ) ) ( not ( = ?auto_120599 ?auto_120603 ) ) ( not ( = ?auto_120600 ?auto_120603 ) ) ( not ( = ?auto_120601 ?auto_120603 ) ) ( not ( = ?auto_120602 ?auto_120603 ) ) ( ON ?auto_120596 ?auto_120595 ) ( ON-TABLE ?auto_120603 ) ( ON ?auto_120597 ?auto_120596 ) ( ON ?auto_120598 ?auto_120597 ) ( ON ?auto_120599 ?auto_120598 ) ( ON ?auto_120600 ?auto_120599 ) ( CLEAR ?auto_120600 ) ( HOLDING ?auto_120601 ) ( CLEAR ?auto_120602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120602 ?auto_120601 )
      ( MAKE-8PILE ?auto_120595 ?auto_120596 ?auto_120597 ?auto_120598 ?auto_120599 ?auto_120600 ?auto_120601 ?auto_120602 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120604 - BLOCK
      ?auto_120605 - BLOCK
      ?auto_120606 - BLOCK
      ?auto_120607 - BLOCK
      ?auto_120608 - BLOCK
      ?auto_120609 - BLOCK
      ?auto_120610 - BLOCK
      ?auto_120611 - BLOCK
    )
    :vars
    (
      ?auto_120612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120604 ?auto_120605 ) ) ( not ( = ?auto_120604 ?auto_120606 ) ) ( not ( = ?auto_120604 ?auto_120607 ) ) ( not ( = ?auto_120604 ?auto_120608 ) ) ( not ( = ?auto_120604 ?auto_120609 ) ) ( not ( = ?auto_120604 ?auto_120610 ) ) ( not ( = ?auto_120604 ?auto_120611 ) ) ( not ( = ?auto_120605 ?auto_120606 ) ) ( not ( = ?auto_120605 ?auto_120607 ) ) ( not ( = ?auto_120605 ?auto_120608 ) ) ( not ( = ?auto_120605 ?auto_120609 ) ) ( not ( = ?auto_120605 ?auto_120610 ) ) ( not ( = ?auto_120605 ?auto_120611 ) ) ( not ( = ?auto_120606 ?auto_120607 ) ) ( not ( = ?auto_120606 ?auto_120608 ) ) ( not ( = ?auto_120606 ?auto_120609 ) ) ( not ( = ?auto_120606 ?auto_120610 ) ) ( not ( = ?auto_120606 ?auto_120611 ) ) ( not ( = ?auto_120607 ?auto_120608 ) ) ( not ( = ?auto_120607 ?auto_120609 ) ) ( not ( = ?auto_120607 ?auto_120610 ) ) ( not ( = ?auto_120607 ?auto_120611 ) ) ( not ( = ?auto_120608 ?auto_120609 ) ) ( not ( = ?auto_120608 ?auto_120610 ) ) ( not ( = ?auto_120608 ?auto_120611 ) ) ( not ( = ?auto_120609 ?auto_120610 ) ) ( not ( = ?auto_120609 ?auto_120611 ) ) ( not ( = ?auto_120610 ?auto_120611 ) ) ( ON-TABLE ?auto_120611 ) ( ON ?auto_120604 ?auto_120612 ) ( not ( = ?auto_120604 ?auto_120612 ) ) ( not ( = ?auto_120605 ?auto_120612 ) ) ( not ( = ?auto_120606 ?auto_120612 ) ) ( not ( = ?auto_120607 ?auto_120612 ) ) ( not ( = ?auto_120608 ?auto_120612 ) ) ( not ( = ?auto_120609 ?auto_120612 ) ) ( not ( = ?auto_120610 ?auto_120612 ) ) ( not ( = ?auto_120611 ?auto_120612 ) ) ( ON ?auto_120605 ?auto_120604 ) ( ON-TABLE ?auto_120612 ) ( ON ?auto_120606 ?auto_120605 ) ( ON ?auto_120607 ?auto_120606 ) ( ON ?auto_120608 ?auto_120607 ) ( ON ?auto_120609 ?auto_120608 ) ( CLEAR ?auto_120611 ) ( ON ?auto_120610 ?auto_120609 ) ( CLEAR ?auto_120610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120612 ?auto_120604 ?auto_120605 ?auto_120606 ?auto_120607 ?auto_120608 ?auto_120609 )
      ( MAKE-8PILE ?auto_120604 ?auto_120605 ?auto_120606 ?auto_120607 ?auto_120608 ?auto_120609 ?auto_120610 ?auto_120611 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120613 - BLOCK
      ?auto_120614 - BLOCK
      ?auto_120615 - BLOCK
      ?auto_120616 - BLOCK
      ?auto_120617 - BLOCK
      ?auto_120618 - BLOCK
      ?auto_120619 - BLOCK
      ?auto_120620 - BLOCK
    )
    :vars
    (
      ?auto_120621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120613 ?auto_120614 ) ) ( not ( = ?auto_120613 ?auto_120615 ) ) ( not ( = ?auto_120613 ?auto_120616 ) ) ( not ( = ?auto_120613 ?auto_120617 ) ) ( not ( = ?auto_120613 ?auto_120618 ) ) ( not ( = ?auto_120613 ?auto_120619 ) ) ( not ( = ?auto_120613 ?auto_120620 ) ) ( not ( = ?auto_120614 ?auto_120615 ) ) ( not ( = ?auto_120614 ?auto_120616 ) ) ( not ( = ?auto_120614 ?auto_120617 ) ) ( not ( = ?auto_120614 ?auto_120618 ) ) ( not ( = ?auto_120614 ?auto_120619 ) ) ( not ( = ?auto_120614 ?auto_120620 ) ) ( not ( = ?auto_120615 ?auto_120616 ) ) ( not ( = ?auto_120615 ?auto_120617 ) ) ( not ( = ?auto_120615 ?auto_120618 ) ) ( not ( = ?auto_120615 ?auto_120619 ) ) ( not ( = ?auto_120615 ?auto_120620 ) ) ( not ( = ?auto_120616 ?auto_120617 ) ) ( not ( = ?auto_120616 ?auto_120618 ) ) ( not ( = ?auto_120616 ?auto_120619 ) ) ( not ( = ?auto_120616 ?auto_120620 ) ) ( not ( = ?auto_120617 ?auto_120618 ) ) ( not ( = ?auto_120617 ?auto_120619 ) ) ( not ( = ?auto_120617 ?auto_120620 ) ) ( not ( = ?auto_120618 ?auto_120619 ) ) ( not ( = ?auto_120618 ?auto_120620 ) ) ( not ( = ?auto_120619 ?auto_120620 ) ) ( ON ?auto_120613 ?auto_120621 ) ( not ( = ?auto_120613 ?auto_120621 ) ) ( not ( = ?auto_120614 ?auto_120621 ) ) ( not ( = ?auto_120615 ?auto_120621 ) ) ( not ( = ?auto_120616 ?auto_120621 ) ) ( not ( = ?auto_120617 ?auto_120621 ) ) ( not ( = ?auto_120618 ?auto_120621 ) ) ( not ( = ?auto_120619 ?auto_120621 ) ) ( not ( = ?auto_120620 ?auto_120621 ) ) ( ON ?auto_120614 ?auto_120613 ) ( ON-TABLE ?auto_120621 ) ( ON ?auto_120615 ?auto_120614 ) ( ON ?auto_120616 ?auto_120615 ) ( ON ?auto_120617 ?auto_120616 ) ( ON ?auto_120618 ?auto_120617 ) ( ON ?auto_120619 ?auto_120618 ) ( CLEAR ?auto_120619 ) ( HOLDING ?auto_120620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120620 )
      ( MAKE-8PILE ?auto_120613 ?auto_120614 ?auto_120615 ?auto_120616 ?auto_120617 ?auto_120618 ?auto_120619 ?auto_120620 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_120622 - BLOCK
      ?auto_120623 - BLOCK
      ?auto_120624 - BLOCK
      ?auto_120625 - BLOCK
      ?auto_120626 - BLOCK
      ?auto_120627 - BLOCK
      ?auto_120628 - BLOCK
      ?auto_120629 - BLOCK
    )
    :vars
    (
      ?auto_120630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120622 ?auto_120623 ) ) ( not ( = ?auto_120622 ?auto_120624 ) ) ( not ( = ?auto_120622 ?auto_120625 ) ) ( not ( = ?auto_120622 ?auto_120626 ) ) ( not ( = ?auto_120622 ?auto_120627 ) ) ( not ( = ?auto_120622 ?auto_120628 ) ) ( not ( = ?auto_120622 ?auto_120629 ) ) ( not ( = ?auto_120623 ?auto_120624 ) ) ( not ( = ?auto_120623 ?auto_120625 ) ) ( not ( = ?auto_120623 ?auto_120626 ) ) ( not ( = ?auto_120623 ?auto_120627 ) ) ( not ( = ?auto_120623 ?auto_120628 ) ) ( not ( = ?auto_120623 ?auto_120629 ) ) ( not ( = ?auto_120624 ?auto_120625 ) ) ( not ( = ?auto_120624 ?auto_120626 ) ) ( not ( = ?auto_120624 ?auto_120627 ) ) ( not ( = ?auto_120624 ?auto_120628 ) ) ( not ( = ?auto_120624 ?auto_120629 ) ) ( not ( = ?auto_120625 ?auto_120626 ) ) ( not ( = ?auto_120625 ?auto_120627 ) ) ( not ( = ?auto_120625 ?auto_120628 ) ) ( not ( = ?auto_120625 ?auto_120629 ) ) ( not ( = ?auto_120626 ?auto_120627 ) ) ( not ( = ?auto_120626 ?auto_120628 ) ) ( not ( = ?auto_120626 ?auto_120629 ) ) ( not ( = ?auto_120627 ?auto_120628 ) ) ( not ( = ?auto_120627 ?auto_120629 ) ) ( not ( = ?auto_120628 ?auto_120629 ) ) ( ON ?auto_120622 ?auto_120630 ) ( not ( = ?auto_120622 ?auto_120630 ) ) ( not ( = ?auto_120623 ?auto_120630 ) ) ( not ( = ?auto_120624 ?auto_120630 ) ) ( not ( = ?auto_120625 ?auto_120630 ) ) ( not ( = ?auto_120626 ?auto_120630 ) ) ( not ( = ?auto_120627 ?auto_120630 ) ) ( not ( = ?auto_120628 ?auto_120630 ) ) ( not ( = ?auto_120629 ?auto_120630 ) ) ( ON ?auto_120623 ?auto_120622 ) ( ON-TABLE ?auto_120630 ) ( ON ?auto_120624 ?auto_120623 ) ( ON ?auto_120625 ?auto_120624 ) ( ON ?auto_120626 ?auto_120625 ) ( ON ?auto_120627 ?auto_120626 ) ( ON ?auto_120628 ?auto_120627 ) ( ON ?auto_120629 ?auto_120628 ) ( CLEAR ?auto_120629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_120630 ?auto_120622 ?auto_120623 ?auto_120624 ?auto_120625 ?auto_120626 ?auto_120627 ?auto_120628 )
      ( MAKE-8PILE ?auto_120622 ?auto_120623 ?auto_120624 ?auto_120625 ?auto_120626 ?auto_120627 ?auto_120628 ?auto_120629 ) )
  )

)

