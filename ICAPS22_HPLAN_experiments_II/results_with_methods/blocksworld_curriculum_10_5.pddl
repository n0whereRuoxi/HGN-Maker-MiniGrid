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
      ?auto_81826 - BLOCK
    )
    :vars
    (
      ?auto_81827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81826 ?auto_81827 ) ( CLEAR ?auto_81826 ) ( HAND-EMPTY ) ( not ( = ?auto_81826 ?auto_81827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81826 ?auto_81827 )
      ( !PUTDOWN ?auto_81826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81829 - BLOCK
    )
    :vars
    (
      ?auto_81830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81829 ?auto_81830 ) ( CLEAR ?auto_81829 ) ( HAND-EMPTY ) ( not ( = ?auto_81829 ?auto_81830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81829 ?auto_81830 )
      ( !PUTDOWN ?auto_81829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81833 - BLOCK
      ?auto_81834 - BLOCK
    )
    :vars
    (
      ?auto_81835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81833 ) ( ON ?auto_81834 ?auto_81835 ) ( CLEAR ?auto_81834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81833 ) ( not ( = ?auto_81833 ?auto_81834 ) ) ( not ( = ?auto_81833 ?auto_81835 ) ) ( not ( = ?auto_81834 ?auto_81835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81834 ?auto_81835 )
      ( !STACK ?auto_81834 ?auto_81833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81838 - BLOCK
      ?auto_81839 - BLOCK
    )
    :vars
    (
      ?auto_81840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81838 ) ( ON ?auto_81839 ?auto_81840 ) ( CLEAR ?auto_81839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81838 ) ( not ( = ?auto_81838 ?auto_81839 ) ) ( not ( = ?auto_81838 ?auto_81840 ) ) ( not ( = ?auto_81839 ?auto_81840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81839 ?auto_81840 )
      ( !STACK ?auto_81839 ?auto_81838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81843 - BLOCK
      ?auto_81844 - BLOCK
    )
    :vars
    (
      ?auto_81845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81844 ?auto_81845 ) ( not ( = ?auto_81843 ?auto_81844 ) ) ( not ( = ?auto_81843 ?auto_81845 ) ) ( not ( = ?auto_81844 ?auto_81845 ) ) ( ON ?auto_81843 ?auto_81844 ) ( CLEAR ?auto_81843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81843 )
      ( MAKE-2PILE ?auto_81843 ?auto_81844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81848 - BLOCK
      ?auto_81849 - BLOCK
    )
    :vars
    (
      ?auto_81850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81849 ?auto_81850 ) ( not ( = ?auto_81848 ?auto_81849 ) ) ( not ( = ?auto_81848 ?auto_81850 ) ) ( not ( = ?auto_81849 ?auto_81850 ) ) ( ON ?auto_81848 ?auto_81849 ) ( CLEAR ?auto_81848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81848 )
      ( MAKE-2PILE ?auto_81848 ?auto_81849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81854 - BLOCK
      ?auto_81855 - BLOCK
      ?auto_81856 - BLOCK
    )
    :vars
    (
      ?auto_81857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81855 ) ( ON ?auto_81856 ?auto_81857 ) ( CLEAR ?auto_81856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81854 ) ( ON ?auto_81855 ?auto_81854 ) ( not ( = ?auto_81854 ?auto_81855 ) ) ( not ( = ?auto_81854 ?auto_81856 ) ) ( not ( = ?auto_81854 ?auto_81857 ) ) ( not ( = ?auto_81855 ?auto_81856 ) ) ( not ( = ?auto_81855 ?auto_81857 ) ) ( not ( = ?auto_81856 ?auto_81857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81856 ?auto_81857 )
      ( !STACK ?auto_81856 ?auto_81855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81861 - BLOCK
      ?auto_81862 - BLOCK
      ?auto_81863 - BLOCK
    )
    :vars
    (
      ?auto_81864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81862 ) ( ON ?auto_81863 ?auto_81864 ) ( CLEAR ?auto_81863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81861 ) ( ON ?auto_81862 ?auto_81861 ) ( not ( = ?auto_81861 ?auto_81862 ) ) ( not ( = ?auto_81861 ?auto_81863 ) ) ( not ( = ?auto_81861 ?auto_81864 ) ) ( not ( = ?auto_81862 ?auto_81863 ) ) ( not ( = ?auto_81862 ?auto_81864 ) ) ( not ( = ?auto_81863 ?auto_81864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81863 ?auto_81864 )
      ( !STACK ?auto_81863 ?auto_81862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81868 - BLOCK
      ?auto_81869 - BLOCK
      ?auto_81870 - BLOCK
    )
    :vars
    (
      ?auto_81871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81870 ?auto_81871 ) ( ON-TABLE ?auto_81868 ) ( not ( = ?auto_81868 ?auto_81869 ) ) ( not ( = ?auto_81868 ?auto_81870 ) ) ( not ( = ?auto_81868 ?auto_81871 ) ) ( not ( = ?auto_81869 ?auto_81870 ) ) ( not ( = ?auto_81869 ?auto_81871 ) ) ( not ( = ?auto_81870 ?auto_81871 ) ) ( CLEAR ?auto_81868 ) ( ON ?auto_81869 ?auto_81870 ) ( CLEAR ?auto_81869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81868 ?auto_81869 )
      ( MAKE-3PILE ?auto_81868 ?auto_81869 ?auto_81870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81875 - BLOCK
      ?auto_81876 - BLOCK
      ?auto_81877 - BLOCK
    )
    :vars
    (
      ?auto_81878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81877 ?auto_81878 ) ( ON-TABLE ?auto_81875 ) ( not ( = ?auto_81875 ?auto_81876 ) ) ( not ( = ?auto_81875 ?auto_81877 ) ) ( not ( = ?auto_81875 ?auto_81878 ) ) ( not ( = ?auto_81876 ?auto_81877 ) ) ( not ( = ?auto_81876 ?auto_81878 ) ) ( not ( = ?auto_81877 ?auto_81878 ) ) ( CLEAR ?auto_81875 ) ( ON ?auto_81876 ?auto_81877 ) ( CLEAR ?auto_81876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81875 ?auto_81876 )
      ( MAKE-3PILE ?auto_81875 ?auto_81876 ?auto_81877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81882 - BLOCK
      ?auto_81883 - BLOCK
      ?auto_81884 - BLOCK
    )
    :vars
    (
      ?auto_81885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81884 ?auto_81885 ) ( not ( = ?auto_81882 ?auto_81883 ) ) ( not ( = ?auto_81882 ?auto_81884 ) ) ( not ( = ?auto_81882 ?auto_81885 ) ) ( not ( = ?auto_81883 ?auto_81884 ) ) ( not ( = ?auto_81883 ?auto_81885 ) ) ( not ( = ?auto_81884 ?auto_81885 ) ) ( ON ?auto_81883 ?auto_81884 ) ( ON ?auto_81882 ?auto_81883 ) ( CLEAR ?auto_81882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81882 )
      ( MAKE-3PILE ?auto_81882 ?auto_81883 ?auto_81884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81889 - BLOCK
      ?auto_81890 - BLOCK
      ?auto_81891 - BLOCK
    )
    :vars
    (
      ?auto_81892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81891 ?auto_81892 ) ( not ( = ?auto_81889 ?auto_81890 ) ) ( not ( = ?auto_81889 ?auto_81891 ) ) ( not ( = ?auto_81889 ?auto_81892 ) ) ( not ( = ?auto_81890 ?auto_81891 ) ) ( not ( = ?auto_81890 ?auto_81892 ) ) ( not ( = ?auto_81891 ?auto_81892 ) ) ( ON ?auto_81890 ?auto_81891 ) ( ON ?auto_81889 ?auto_81890 ) ( CLEAR ?auto_81889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81889 )
      ( MAKE-3PILE ?auto_81889 ?auto_81890 ?auto_81891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81897 - BLOCK
      ?auto_81898 - BLOCK
      ?auto_81899 - BLOCK
      ?auto_81900 - BLOCK
    )
    :vars
    (
      ?auto_81901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81899 ) ( ON ?auto_81900 ?auto_81901 ) ( CLEAR ?auto_81900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81897 ) ( ON ?auto_81898 ?auto_81897 ) ( ON ?auto_81899 ?auto_81898 ) ( not ( = ?auto_81897 ?auto_81898 ) ) ( not ( = ?auto_81897 ?auto_81899 ) ) ( not ( = ?auto_81897 ?auto_81900 ) ) ( not ( = ?auto_81897 ?auto_81901 ) ) ( not ( = ?auto_81898 ?auto_81899 ) ) ( not ( = ?auto_81898 ?auto_81900 ) ) ( not ( = ?auto_81898 ?auto_81901 ) ) ( not ( = ?auto_81899 ?auto_81900 ) ) ( not ( = ?auto_81899 ?auto_81901 ) ) ( not ( = ?auto_81900 ?auto_81901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81900 ?auto_81901 )
      ( !STACK ?auto_81900 ?auto_81899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81906 - BLOCK
      ?auto_81907 - BLOCK
      ?auto_81908 - BLOCK
      ?auto_81909 - BLOCK
    )
    :vars
    (
      ?auto_81910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81908 ) ( ON ?auto_81909 ?auto_81910 ) ( CLEAR ?auto_81909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81906 ) ( ON ?auto_81907 ?auto_81906 ) ( ON ?auto_81908 ?auto_81907 ) ( not ( = ?auto_81906 ?auto_81907 ) ) ( not ( = ?auto_81906 ?auto_81908 ) ) ( not ( = ?auto_81906 ?auto_81909 ) ) ( not ( = ?auto_81906 ?auto_81910 ) ) ( not ( = ?auto_81907 ?auto_81908 ) ) ( not ( = ?auto_81907 ?auto_81909 ) ) ( not ( = ?auto_81907 ?auto_81910 ) ) ( not ( = ?auto_81908 ?auto_81909 ) ) ( not ( = ?auto_81908 ?auto_81910 ) ) ( not ( = ?auto_81909 ?auto_81910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81909 ?auto_81910 )
      ( !STACK ?auto_81909 ?auto_81908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81915 - BLOCK
      ?auto_81916 - BLOCK
      ?auto_81917 - BLOCK
      ?auto_81918 - BLOCK
    )
    :vars
    (
      ?auto_81919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81918 ?auto_81919 ) ( ON-TABLE ?auto_81915 ) ( ON ?auto_81916 ?auto_81915 ) ( not ( = ?auto_81915 ?auto_81916 ) ) ( not ( = ?auto_81915 ?auto_81917 ) ) ( not ( = ?auto_81915 ?auto_81918 ) ) ( not ( = ?auto_81915 ?auto_81919 ) ) ( not ( = ?auto_81916 ?auto_81917 ) ) ( not ( = ?auto_81916 ?auto_81918 ) ) ( not ( = ?auto_81916 ?auto_81919 ) ) ( not ( = ?auto_81917 ?auto_81918 ) ) ( not ( = ?auto_81917 ?auto_81919 ) ) ( not ( = ?auto_81918 ?auto_81919 ) ) ( CLEAR ?auto_81916 ) ( ON ?auto_81917 ?auto_81918 ) ( CLEAR ?auto_81917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81915 ?auto_81916 ?auto_81917 )
      ( MAKE-4PILE ?auto_81915 ?auto_81916 ?auto_81917 ?auto_81918 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81924 - BLOCK
      ?auto_81925 - BLOCK
      ?auto_81926 - BLOCK
      ?auto_81927 - BLOCK
    )
    :vars
    (
      ?auto_81928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81927 ?auto_81928 ) ( ON-TABLE ?auto_81924 ) ( ON ?auto_81925 ?auto_81924 ) ( not ( = ?auto_81924 ?auto_81925 ) ) ( not ( = ?auto_81924 ?auto_81926 ) ) ( not ( = ?auto_81924 ?auto_81927 ) ) ( not ( = ?auto_81924 ?auto_81928 ) ) ( not ( = ?auto_81925 ?auto_81926 ) ) ( not ( = ?auto_81925 ?auto_81927 ) ) ( not ( = ?auto_81925 ?auto_81928 ) ) ( not ( = ?auto_81926 ?auto_81927 ) ) ( not ( = ?auto_81926 ?auto_81928 ) ) ( not ( = ?auto_81927 ?auto_81928 ) ) ( CLEAR ?auto_81925 ) ( ON ?auto_81926 ?auto_81927 ) ( CLEAR ?auto_81926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81924 ?auto_81925 ?auto_81926 )
      ( MAKE-4PILE ?auto_81924 ?auto_81925 ?auto_81926 ?auto_81927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81933 - BLOCK
      ?auto_81934 - BLOCK
      ?auto_81935 - BLOCK
      ?auto_81936 - BLOCK
    )
    :vars
    (
      ?auto_81937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81936 ?auto_81937 ) ( ON-TABLE ?auto_81933 ) ( not ( = ?auto_81933 ?auto_81934 ) ) ( not ( = ?auto_81933 ?auto_81935 ) ) ( not ( = ?auto_81933 ?auto_81936 ) ) ( not ( = ?auto_81933 ?auto_81937 ) ) ( not ( = ?auto_81934 ?auto_81935 ) ) ( not ( = ?auto_81934 ?auto_81936 ) ) ( not ( = ?auto_81934 ?auto_81937 ) ) ( not ( = ?auto_81935 ?auto_81936 ) ) ( not ( = ?auto_81935 ?auto_81937 ) ) ( not ( = ?auto_81936 ?auto_81937 ) ) ( ON ?auto_81935 ?auto_81936 ) ( CLEAR ?auto_81933 ) ( ON ?auto_81934 ?auto_81935 ) ( CLEAR ?auto_81934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81933 ?auto_81934 )
      ( MAKE-4PILE ?auto_81933 ?auto_81934 ?auto_81935 ?auto_81936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81942 - BLOCK
      ?auto_81943 - BLOCK
      ?auto_81944 - BLOCK
      ?auto_81945 - BLOCK
    )
    :vars
    (
      ?auto_81946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81945 ?auto_81946 ) ( ON-TABLE ?auto_81942 ) ( not ( = ?auto_81942 ?auto_81943 ) ) ( not ( = ?auto_81942 ?auto_81944 ) ) ( not ( = ?auto_81942 ?auto_81945 ) ) ( not ( = ?auto_81942 ?auto_81946 ) ) ( not ( = ?auto_81943 ?auto_81944 ) ) ( not ( = ?auto_81943 ?auto_81945 ) ) ( not ( = ?auto_81943 ?auto_81946 ) ) ( not ( = ?auto_81944 ?auto_81945 ) ) ( not ( = ?auto_81944 ?auto_81946 ) ) ( not ( = ?auto_81945 ?auto_81946 ) ) ( ON ?auto_81944 ?auto_81945 ) ( CLEAR ?auto_81942 ) ( ON ?auto_81943 ?auto_81944 ) ( CLEAR ?auto_81943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81942 ?auto_81943 )
      ( MAKE-4PILE ?auto_81942 ?auto_81943 ?auto_81944 ?auto_81945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81951 - BLOCK
      ?auto_81952 - BLOCK
      ?auto_81953 - BLOCK
      ?auto_81954 - BLOCK
    )
    :vars
    (
      ?auto_81955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81954 ?auto_81955 ) ( not ( = ?auto_81951 ?auto_81952 ) ) ( not ( = ?auto_81951 ?auto_81953 ) ) ( not ( = ?auto_81951 ?auto_81954 ) ) ( not ( = ?auto_81951 ?auto_81955 ) ) ( not ( = ?auto_81952 ?auto_81953 ) ) ( not ( = ?auto_81952 ?auto_81954 ) ) ( not ( = ?auto_81952 ?auto_81955 ) ) ( not ( = ?auto_81953 ?auto_81954 ) ) ( not ( = ?auto_81953 ?auto_81955 ) ) ( not ( = ?auto_81954 ?auto_81955 ) ) ( ON ?auto_81953 ?auto_81954 ) ( ON ?auto_81952 ?auto_81953 ) ( ON ?auto_81951 ?auto_81952 ) ( CLEAR ?auto_81951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81951 )
      ( MAKE-4PILE ?auto_81951 ?auto_81952 ?auto_81953 ?auto_81954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81960 - BLOCK
      ?auto_81961 - BLOCK
      ?auto_81962 - BLOCK
      ?auto_81963 - BLOCK
    )
    :vars
    (
      ?auto_81964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81963 ?auto_81964 ) ( not ( = ?auto_81960 ?auto_81961 ) ) ( not ( = ?auto_81960 ?auto_81962 ) ) ( not ( = ?auto_81960 ?auto_81963 ) ) ( not ( = ?auto_81960 ?auto_81964 ) ) ( not ( = ?auto_81961 ?auto_81962 ) ) ( not ( = ?auto_81961 ?auto_81963 ) ) ( not ( = ?auto_81961 ?auto_81964 ) ) ( not ( = ?auto_81962 ?auto_81963 ) ) ( not ( = ?auto_81962 ?auto_81964 ) ) ( not ( = ?auto_81963 ?auto_81964 ) ) ( ON ?auto_81962 ?auto_81963 ) ( ON ?auto_81961 ?auto_81962 ) ( ON ?auto_81960 ?auto_81961 ) ( CLEAR ?auto_81960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81960 )
      ( MAKE-4PILE ?auto_81960 ?auto_81961 ?auto_81962 ?auto_81963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81970 - BLOCK
      ?auto_81971 - BLOCK
      ?auto_81972 - BLOCK
      ?auto_81973 - BLOCK
      ?auto_81974 - BLOCK
    )
    :vars
    (
      ?auto_81975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81973 ) ( ON ?auto_81974 ?auto_81975 ) ( CLEAR ?auto_81974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81970 ) ( ON ?auto_81971 ?auto_81970 ) ( ON ?auto_81972 ?auto_81971 ) ( ON ?auto_81973 ?auto_81972 ) ( not ( = ?auto_81970 ?auto_81971 ) ) ( not ( = ?auto_81970 ?auto_81972 ) ) ( not ( = ?auto_81970 ?auto_81973 ) ) ( not ( = ?auto_81970 ?auto_81974 ) ) ( not ( = ?auto_81970 ?auto_81975 ) ) ( not ( = ?auto_81971 ?auto_81972 ) ) ( not ( = ?auto_81971 ?auto_81973 ) ) ( not ( = ?auto_81971 ?auto_81974 ) ) ( not ( = ?auto_81971 ?auto_81975 ) ) ( not ( = ?auto_81972 ?auto_81973 ) ) ( not ( = ?auto_81972 ?auto_81974 ) ) ( not ( = ?auto_81972 ?auto_81975 ) ) ( not ( = ?auto_81973 ?auto_81974 ) ) ( not ( = ?auto_81973 ?auto_81975 ) ) ( not ( = ?auto_81974 ?auto_81975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81974 ?auto_81975 )
      ( !STACK ?auto_81974 ?auto_81973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81981 - BLOCK
      ?auto_81982 - BLOCK
      ?auto_81983 - BLOCK
      ?auto_81984 - BLOCK
      ?auto_81985 - BLOCK
    )
    :vars
    (
      ?auto_81986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81984 ) ( ON ?auto_81985 ?auto_81986 ) ( CLEAR ?auto_81985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81981 ) ( ON ?auto_81982 ?auto_81981 ) ( ON ?auto_81983 ?auto_81982 ) ( ON ?auto_81984 ?auto_81983 ) ( not ( = ?auto_81981 ?auto_81982 ) ) ( not ( = ?auto_81981 ?auto_81983 ) ) ( not ( = ?auto_81981 ?auto_81984 ) ) ( not ( = ?auto_81981 ?auto_81985 ) ) ( not ( = ?auto_81981 ?auto_81986 ) ) ( not ( = ?auto_81982 ?auto_81983 ) ) ( not ( = ?auto_81982 ?auto_81984 ) ) ( not ( = ?auto_81982 ?auto_81985 ) ) ( not ( = ?auto_81982 ?auto_81986 ) ) ( not ( = ?auto_81983 ?auto_81984 ) ) ( not ( = ?auto_81983 ?auto_81985 ) ) ( not ( = ?auto_81983 ?auto_81986 ) ) ( not ( = ?auto_81984 ?auto_81985 ) ) ( not ( = ?auto_81984 ?auto_81986 ) ) ( not ( = ?auto_81985 ?auto_81986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81985 ?auto_81986 )
      ( !STACK ?auto_81985 ?auto_81984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81992 - BLOCK
      ?auto_81993 - BLOCK
      ?auto_81994 - BLOCK
      ?auto_81995 - BLOCK
      ?auto_81996 - BLOCK
    )
    :vars
    (
      ?auto_81997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81996 ?auto_81997 ) ( ON-TABLE ?auto_81992 ) ( ON ?auto_81993 ?auto_81992 ) ( ON ?auto_81994 ?auto_81993 ) ( not ( = ?auto_81992 ?auto_81993 ) ) ( not ( = ?auto_81992 ?auto_81994 ) ) ( not ( = ?auto_81992 ?auto_81995 ) ) ( not ( = ?auto_81992 ?auto_81996 ) ) ( not ( = ?auto_81992 ?auto_81997 ) ) ( not ( = ?auto_81993 ?auto_81994 ) ) ( not ( = ?auto_81993 ?auto_81995 ) ) ( not ( = ?auto_81993 ?auto_81996 ) ) ( not ( = ?auto_81993 ?auto_81997 ) ) ( not ( = ?auto_81994 ?auto_81995 ) ) ( not ( = ?auto_81994 ?auto_81996 ) ) ( not ( = ?auto_81994 ?auto_81997 ) ) ( not ( = ?auto_81995 ?auto_81996 ) ) ( not ( = ?auto_81995 ?auto_81997 ) ) ( not ( = ?auto_81996 ?auto_81997 ) ) ( CLEAR ?auto_81994 ) ( ON ?auto_81995 ?auto_81996 ) ( CLEAR ?auto_81995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81992 ?auto_81993 ?auto_81994 ?auto_81995 )
      ( MAKE-5PILE ?auto_81992 ?auto_81993 ?auto_81994 ?auto_81995 ?auto_81996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82003 - BLOCK
      ?auto_82004 - BLOCK
      ?auto_82005 - BLOCK
      ?auto_82006 - BLOCK
      ?auto_82007 - BLOCK
    )
    :vars
    (
      ?auto_82008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82007 ?auto_82008 ) ( ON-TABLE ?auto_82003 ) ( ON ?auto_82004 ?auto_82003 ) ( ON ?auto_82005 ?auto_82004 ) ( not ( = ?auto_82003 ?auto_82004 ) ) ( not ( = ?auto_82003 ?auto_82005 ) ) ( not ( = ?auto_82003 ?auto_82006 ) ) ( not ( = ?auto_82003 ?auto_82007 ) ) ( not ( = ?auto_82003 ?auto_82008 ) ) ( not ( = ?auto_82004 ?auto_82005 ) ) ( not ( = ?auto_82004 ?auto_82006 ) ) ( not ( = ?auto_82004 ?auto_82007 ) ) ( not ( = ?auto_82004 ?auto_82008 ) ) ( not ( = ?auto_82005 ?auto_82006 ) ) ( not ( = ?auto_82005 ?auto_82007 ) ) ( not ( = ?auto_82005 ?auto_82008 ) ) ( not ( = ?auto_82006 ?auto_82007 ) ) ( not ( = ?auto_82006 ?auto_82008 ) ) ( not ( = ?auto_82007 ?auto_82008 ) ) ( CLEAR ?auto_82005 ) ( ON ?auto_82006 ?auto_82007 ) ( CLEAR ?auto_82006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82003 ?auto_82004 ?auto_82005 ?auto_82006 )
      ( MAKE-5PILE ?auto_82003 ?auto_82004 ?auto_82005 ?auto_82006 ?auto_82007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82014 - BLOCK
      ?auto_82015 - BLOCK
      ?auto_82016 - BLOCK
      ?auto_82017 - BLOCK
      ?auto_82018 - BLOCK
    )
    :vars
    (
      ?auto_82019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82018 ?auto_82019 ) ( ON-TABLE ?auto_82014 ) ( ON ?auto_82015 ?auto_82014 ) ( not ( = ?auto_82014 ?auto_82015 ) ) ( not ( = ?auto_82014 ?auto_82016 ) ) ( not ( = ?auto_82014 ?auto_82017 ) ) ( not ( = ?auto_82014 ?auto_82018 ) ) ( not ( = ?auto_82014 ?auto_82019 ) ) ( not ( = ?auto_82015 ?auto_82016 ) ) ( not ( = ?auto_82015 ?auto_82017 ) ) ( not ( = ?auto_82015 ?auto_82018 ) ) ( not ( = ?auto_82015 ?auto_82019 ) ) ( not ( = ?auto_82016 ?auto_82017 ) ) ( not ( = ?auto_82016 ?auto_82018 ) ) ( not ( = ?auto_82016 ?auto_82019 ) ) ( not ( = ?auto_82017 ?auto_82018 ) ) ( not ( = ?auto_82017 ?auto_82019 ) ) ( not ( = ?auto_82018 ?auto_82019 ) ) ( ON ?auto_82017 ?auto_82018 ) ( CLEAR ?auto_82015 ) ( ON ?auto_82016 ?auto_82017 ) ( CLEAR ?auto_82016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82014 ?auto_82015 ?auto_82016 )
      ( MAKE-5PILE ?auto_82014 ?auto_82015 ?auto_82016 ?auto_82017 ?auto_82018 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82025 - BLOCK
      ?auto_82026 - BLOCK
      ?auto_82027 - BLOCK
      ?auto_82028 - BLOCK
      ?auto_82029 - BLOCK
    )
    :vars
    (
      ?auto_82030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82029 ?auto_82030 ) ( ON-TABLE ?auto_82025 ) ( ON ?auto_82026 ?auto_82025 ) ( not ( = ?auto_82025 ?auto_82026 ) ) ( not ( = ?auto_82025 ?auto_82027 ) ) ( not ( = ?auto_82025 ?auto_82028 ) ) ( not ( = ?auto_82025 ?auto_82029 ) ) ( not ( = ?auto_82025 ?auto_82030 ) ) ( not ( = ?auto_82026 ?auto_82027 ) ) ( not ( = ?auto_82026 ?auto_82028 ) ) ( not ( = ?auto_82026 ?auto_82029 ) ) ( not ( = ?auto_82026 ?auto_82030 ) ) ( not ( = ?auto_82027 ?auto_82028 ) ) ( not ( = ?auto_82027 ?auto_82029 ) ) ( not ( = ?auto_82027 ?auto_82030 ) ) ( not ( = ?auto_82028 ?auto_82029 ) ) ( not ( = ?auto_82028 ?auto_82030 ) ) ( not ( = ?auto_82029 ?auto_82030 ) ) ( ON ?auto_82028 ?auto_82029 ) ( CLEAR ?auto_82026 ) ( ON ?auto_82027 ?auto_82028 ) ( CLEAR ?auto_82027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82025 ?auto_82026 ?auto_82027 )
      ( MAKE-5PILE ?auto_82025 ?auto_82026 ?auto_82027 ?auto_82028 ?auto_82029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82036 - BLOCK
      ?auto_82037 - BLOCK
      ?auto_82038 - BLOCK
      ?auto_82039 - BLOCK
      ?auto_82040 - BLOCK
    )
    :vars
    (
      ?auto_82041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82040 ?auto_82041 ) ( ON-TABLE ?auto_82036 ) ( not ( = ?auto_82036 ?auto_82037 ) ) ( not ( = ?auto_82036 ?auto_82038 ) ) ( not ( = ?auto_82036 ?auto_82039 ) ) ( not ( = ?auto_82036 ?auto_82040 ) ) ( not ( = ?auto_82036 ?auto_82041 ) ) ( not ( = ?auto_82037 ?auto_82038 ) ) ( not ( = ?auto_82037 ?auto_82039 ) ) ( not ( = ?auto_82037 ?auto_82040 ) ) ( not ( = ?auto_82037 ?auto_82041 ) ) ( not ( = ?auto_82038 ?auto_82039 ) ) ( not ( = ?auto_82038 ?auto_82040 ) ) ( not ( = ?auto_82038 ?auto_82041 ) ) ( not ( = ?auto_82039 ?auto_82040 ) ) ( not ( = ?auto_82039 ?auto_82041 ) ) ( not ( = ?auto_82040 ?auto_82041 ) ) ( ON ?auto_82039 ?auto_82040 ) ( ON ?auto_82038 ?auto_82039 ) ( CLEAR ?auto_82036 ) ( ON ?auto_82037 ?auto_82038 ) ( CLEAR ?auto_82037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82036 ?auto_82037 )
      ( MAKE-5PILE ?auto_82036 ?auto_82037 ?auto_82038 ?auto_82039 ?auto_82040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82047 - BLOCK
      ?auto_82048 - BLOCK
      ?auto_82049 - BLOCK
      ?auto_82050 - BLOCK
      ?auto_82051 - BLOCK
    )
    :vars
    (
      ?auto_82052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82051 ?auto_82052 ) ( ON-TABLE ?auto_82047 ) ( not ( = ?auto_82047 ?auto_82048 ) ) ( not ( = ?auto_82047 ?auto_82049 ) ) ( not ( = ?auto_82047 ?auto_82050 ) ) ( not ( = ?auto_82047 ?auto_82051 ) ) ( not ( = ?auto_82047 ?auto_82052 ) ) ( not ( = ?auto_82048 ?auto_82049 ) ) ( not ( = ?auto_82048 ?auto_82050 ) ) ( not ( = ?auto_82048 ?auto_82051 ) ) ( not ( = ?auto_82048 ?auto_82052 ) ) ( not ( = ?auto_82049 ?auto_82050 ) ) ( not ( = ?auto_82049 ?auto_82051 ) ) ( not ( = ?auto_82049 ?auto_82052 ) ) ( not ( = ?auto_82050 ?auto_82051 ) ) ( not ( = ?auto_82050 ?auto_82052 ) ) ( not ( = ?auto_82051 ?auto_82052 ) ) ( ON ?auto_82050 ?auto_82051 ) ( ON ?auto_82049 ?auto_82050 ) ( CLEAR ?auto_82047 ) ( ON ?auto_82048 ?auto_82049 ) ( CLEAR ?auto_82048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82047 ?auto_82048 )
      ( MAKE-5PILE ?auto_82047 ?auto_82048 ?auto_82049 ?auto_82050 ?auto_82051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82058 - BLOCK
      ?auto_82059 - BLOCK
      ?auto_82060 - BLOCK
      ?auto_82061 - BLOCK
      ?auto_82062 - BLOCK
    )
    :vars
    (
      ?auto_82063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82062 ?auto_82063 ) ( not ( = ?auto_82058 ?auto_82059 ) ) ( not ( = ?auto_82058 ?auto_82060 ) ) ( not ( = ?auto_82058 ?auto_82061 ) ) ( not ( = ?auto_82058 ?auto_82062 ) ) ( not ( = ?auto_82058 ?auto_82063 ) ) ( not ( = ?auto_82059 ?auto_82060 ) ) ( not ( = ?auto_82059 ?auto_82061 ) ) ( not ( = ?auto_82059 ?auto_82062 ) ) ( not ( = ?auto_82059 ?auto_82063 ) ) ( not ( = ?auto_82060 ?auto_82061 ) ) ( not ( = ?auto_82060 ?auto_82062 ) ) ( not ( = ?auto_82060 ?auto_82063 ) ) ( not ( = ?auto_82061 ?auto_82062 ) ) ( not ( = ?auto_82061 ?auto_82063 ) ) ( not ( = ?auto_82062 ?auto_82063 ) ) ( ON ?auto_82061 ?auto_82062 ) ( ON ?auto_82060 ?auto_82061 ) ( ON ?auto_82059 ?auto_82060 ) ( ON ?auto_82058 ?auto_82059 ) ( CLEAR ?auto_82058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82058 )
      ( MAKE-5PILE ?auto_82058 ?auto_82059 ?auto_82060 ?auto_82061 ?auto_82062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82069 - BLOCK
      ?auto_82070 - BLOCK
      ?auto_82071 - BLOCK
      ?auto_82072 - BLOCK
      ?auto_82073 - BLOCK
    )
    :vars
    (
      ?auto_82074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82073 ?auto_82074 ) ( not ( = ?auto_82069 ?auto_82070 ) ) ( not ( = ?auto_82069 ?auto_82071 ) ) ( not ( = ?auto_82069 ?auto_82072 ) ) ( not ( = ?auto_82069 ?auto_82073 ) ) ( not ( = ?auto_82069 ?auto_82074 ) ) ( not ( = ?auto_82070 ?auto_82071 ) ) ( not ( = ?auto_82070 ?auto_82072 ) ) ( not ( = ?auto_82070 ?auto_82073 ) ) ( not ( = ?auto_82070 ?auto_82074 ) ) ( not ( = ?auto_82071 ?auto_82072 ) ) ( not ( = ?auto_82071 ?auto_82073 ) ) ( not ( = ?auto_82071 ?auto_82074 ) ) ( not ( = ?auto_82072 ?auto_82073 ) ) ( not ( = ?auto_82072 ?auto_82074 ) ) ( not ( = ?auto_82073 ?auto_82074 ) ) ( ON ?auto_82072 ?auto_82073 ) ( ON ?auto_82071 ?auto_82072 ) ( ON ?auto_82070 ?auto_82071 ) ( ON ?auto_82069 ?auto_82070 ) ( CLEAR ?auto_82069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82069 )
      ( MAKE-5PILE ?auto_82069 ?auto_82070 ?auto_82071 ?auto_82072 ?auto_82073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82081 - BLOCK
      ?auto_82082 - BLOCK
      ?auto_82083 - BLOCK
      ?auto_82084 - BLOCK
      ?auto_82085 - BLOCK
      ?auto_82086 - BLOCK
    )
    :vars
    (
      ?auto_82087 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82085 ) ( ON ?auto_82086 ?auto_82087 ) ( CLEAR ?auto_82086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82081 ) ( ON ?auto_82082 ?auto_82081 ) ( ON ?auto_82083 ?auto_82082 ) ( ON ?auto_82084 ?auto_82083 ) ( ON ?auto_82085 ?auto_82084 ) ( not ( = ?auto_82081 ?auto_82082 ) ) ( not ( = ?auto_82081 ?auto_82083 ) ) ( not ( = ?auto_82081 ?auto_82084 ) ) ( not ( = ?auto_82081 ?auto_82085 ) ) ( not ( = ?auto_82081 ?auto_82086 ) ) ( not ( = ?auto_82081 ?auto_82087 ) ) ( not ( = ?auto_82082 ?auto_82083 ) ) ( not ( = ?auto_82082 ?auto_82084 ) ) ( not ( = ?auto_82082 ?auto_82085 ) ) ( not ( = ?auto_82082 ?auto_82086 ) ) ( not ( = ?auto_82082 ?auto_82087 ) ) ( not ( = ?auto_82083 ?auto_82084 ) ) ( not ( = ?auto_82083 ?auto_82085 ) ) ( not ( = ?auto_82083 ?auto_82086 ) ) ( not ( = ?auto_82083 ?auto_82087 ) ) ( not ( = ?auto_82084 ?auto_82085 ) ) ( not ( = ?auto_82084 ?auto_82086 ) ) ( not ( = ?auto_82084 ?auto_82087 ) ) ( not ( = ?auto_82085 ?auto_82086 ) ) ( not ( = ?auto_82085 ?auto_82087 ) ) ( not ( = ?auto_82086 ?auto_82087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82086 ?auto_82087 )
      ( !STACK ?auto_82086 ?auto_82085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82094 - BLOCK
      ?auto_82095 - BLOCK
      ?auto_82096 - BLOCK
      ?auto_82097 - BLOCK
      ?auto_82098 - BLOCK
      ?auto_82099 - BLOCK
    )
    :vars
    (
      ?auto_82100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82098 ) ( ON ?auto_82099 ?auto_82100 ) ( CLEAR ?auto_82099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82094 ) ( ON ?auto_82095 ?auto_82094 ) ( ON ?auto_82096 ?auto_82095 ) ( ON ?auto_82097 ?auto_82096 ) ( ON ?auto_82098 ?auto_82097 ) ( not ( = ?auto_82094 ?auto_82095 ) ) ( not ( = ?auto_82094 ?auto_82096 ) ) ( not ( = ?auto_82094 ?auto_82097 ) ) ( not ( = ?auto_82094 ?auto_82098 ) ) ( not ( = ?auto_82094 ?auto_82099 ) ) ( not ( = ?auto_82094 ?auto_82100 ) ) ( not ( = ?auto_82095 ?auto_82096 ) ) ( not ( = ?auto_82095 ?auto_82097 ) ) ( not ( = ?auto_82095 ?auto_82098 ) ) ( not ( = ?auto_82095 ?auto_82099 ) ) ( not ( = ?auto_82095 ?auto_82100 ) ) ( not ( = ?auto_82096 ?auto_82097 ) ) ( not ( = ?auto_82096 ?auto_82098 ) ) ( not ( = ?auto_82096 ?auto_82099 ) ) ( not ( = ?auto_82096 ?auto_82100 ) ) ( not ( = ?auto_82097 ?auto_82098 ) ) ( not ( = ?auto_82097 ?auto_82099 ) ) ( not ( = ?auto_82097 ?auto_82100 ) ) ( not ( = ?auto_82098 ?auto_82099 ) ) ( not ( = ?auto_82098 ?auto_82100 ) ) ( not ( = ?auto_82099 ?auto_82100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82099 ?auto_82100 )
      ( !STACK ?auto_82099 ?auto_82098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82107 - BLOCK
      ?auto_82108 - BLOCK
      ?auto_82109 - BLOCK
      ?auto_82110 - BLOCK
      ?auto_82111 - BLOCK
      ?auto_82112 - BLOCK
    )
    :vars
    (
      ?auto_82113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82112 ?auto_82113 ) ( ON-TABLE ?auto_82107 ) ( ON ?auto_82108 ?auto_82107 ) ( ON ?auto_82109 ?auto_82108 ) ( ON ?auto_82110 ?auto_82109 ) ( not ( = ?auto_82107 ?auto_82108 ) ) ( not ( = ?auto_82107 ?auto_82109 ) ) ( not ( = ?auto_82107 ?auto_82110 ) ) ( not ( = ?auto_82107 ?auto_82111 ) ) ( not ( = ?auto_82107 ?auto_82112 ) ) ( not ( = ?auto_82107 ?auto_82113 ) ) ( not ( = ?auto_82108 ?auto_82109 ) ) ( not ( = ?auto_82108 ?auto_82110 ) ) ( not ( = ?auto_82108 ?auto_82111 ) ) ( not ( = ?auto_82108 ?auto_82112 ) ) ( not ( = ?auto_82108 ?auto_82113 ) ) ( not ( = ?auto_82109 ?auto_82110 ) ) ( not ( = ?auto_82109 ?auto_82111 ) ) ( not ( = ?auto_82109 ?auto_82112 ) ) ( not ( = ?auto_82109 ?auto_82113 ) ) ( not ( = ?auto_82110 ?auto_82111 ) ) ( not ( = ?auto_82110 ?auto_82112 ) ) ( not ( = ?auto_82110 ?auto_82113 ) ) ( not ( = ?auto_82111 ?auto_82112 ) ) ( not ( = ?auto_82111 ?auto_82113 ) ) ( not ( = ?auto_82112 ?auto_82113 ) ) ( CLEAR ?auto_82110 ) ( ON ?auto_82111 ?auto_82112 ) ( CLEAR ?auto_82111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82107 ?auto_82108 ?auto_82109 ?auto_82110 ?auto_82111 )
      ( MAKE-6PILE ?auto_82107 ?auto_82108 ?auto_82109 ?auto_82110 ?auto_82111 ?auto_82112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82120 - BLOCK
      ?auto_82121 - BLOCK
      ?auto_82122 - BLOCK
      ?auto_82123 - BLOCK
      ?auto_82124 - BLOCK
      ?auto_82125 - BLOCK
    )
    :vars
    (
      ?auto_82126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82125 ?auto_82126 ) ( ON-TABLE ?auto_82120 ) ( ON ?auto_82121 ?auto_82120 ) ( ON ?auto_82122 ?auto_82121 ) ( ON ?auto_82123 ?auto_82122 ) ( not ( = ?auto_82120 ?auto_82121 ) ) ( not ( = ?auto_82120 ?auto_82122 ) ) ( not ( = ?auto_82120 ?auto_82123 ) ) ( not ( = ?auto_82120 ?auto_82124 ) ) ( not ( = ?auto_82120 ?auto_82125 ) ) ( not ( = ?auto_82120 ?auto_82126 ) ) ( not ( = ?auto_82121 ?auto_82122 ) ) ( not ( = ?auto_82121 ?auto_82123 ) ) ( not ( = ?auto_82121 ?auto_82124 ) ) ( not ( = ?auto_82121 ?auto_82125 ) ) ( not ( = ?auto_82121 ?auto_82126 ) ) ( not ( = ?auto_82122 ?auto_82123 ) ) ( not ( = ?auto_82122 ?auto_82124 ) ) ( not ( = ?auto_82122 ?auto_82125 ) ) ( not ( = ?auto_82122 ?auto_82126 ) ) ( not ( = ?auto_82123 ?auto_82124 ) ) ( not ( = ?auto_82123 ?auto_82125 ) ) ( not ( = ?auto_82123 ?auto_82126 ) ) ( not ( = ?auto_82124 ?auto_82125 ) ) ( not ( = ?auto_82124 ?auto_82126 ) ) ( not ( = ?auto_82125 ?auto_82126 ) ) ( CLEAR ?auto_82123 ) ( ON ?auto_82124 ?auto_82125 ) ( CLEAR ?auto_82124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82120 ?auto_82121 ?auto_82122 ?auto_82123 ?auto_82124 )
      ( MAKE-6PILE ?auto_82120 ?auto_82121 ?auto_82122 ?auto_82123 ?auto_82124 ?auto_82125 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82133 - BLOCK
      ?auto_82134 - BLOCK
      ?auto_82135 - BLOCK
      ?auto_82136 - BLOCK
      ?auto_82137 - BLOCK
      ?auto_82138 - BLOCK
    )
    :vars
    (
      ?auto_82139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82138 ?auto_82139 ) ( ON-TABLE ?auto_82133 ) ( ON ?auto_82134 ?auto_82133 ) ( ON ?auto_82135 ?auto_82134 ) ( not ( = ?auto_82133 ?auto_82134 ) ) ( not ( = ?auto_82133 ?auto_82135 ) ) ( not ( = ?auto_82133 ?auto_82136 ) ) ( not ( = ?auto_82133 ?auto_82137 ) ) ( not ( = ?auto_82133 ?auto_82138 ) ) ( not ( = ?auto_82133 ?auto_82139 ) ) ( not ( = ?auto_82134 ?auto_82135 ) ) ( not ( = ?auto_82134 ?auto_82136 ) ) ( not ( = ?auto_82134 ?auto_82137 ) ) ( not ( = ?auto_82134 ?auto_82138 ) ) ( not ( = ?auto_82134 ?auto_82139 ) ) ( not ( = ?auto_82135 ?auto_82136 ) ) ( not ( = ?auto_82135 ?auto_82137 ) ) ( not ( = ?auto_82135 ?auto_82138 ) ) ( not ( = ?auto_82135 ?auto_82139 ) ) ( not ( = ?auto_82136 ?auto_82137 ) ) ( not ( = ?auto_82136 ?auto_82138 ) ) ( not ( = ?auto_82136 ?auto_82139 ) ) ( not ( = ?auto_82137 ?auto_82138 ) ) ( not ( = ?auto_82137 ?auto_82139 ) ) ( not ( = ?auto_82138 ?auto_82139 ) ) ( ON ?auto_82137 ?auto_82138 ) ( CLEAR ?auto_82135 ) ( ON ?auto_82136 ?auto_82137 ) ( CLEAR ?auto_82136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82133 ?auto_82134 ?auto_82135 ?auto_82136 )
      ( MAKE-6PILE ?auto_82133 ?auto_82134 ?auto_82135 ?auto_82136 ?auto_82137 ?auto_82138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82146 - BLOCK
      ?auto_82147 - BLOCK
      ?auto_82148 - BLOCK
      ?auto_82149 - BLOCK
      ?auto_82150 - BLOCK
      ?auto_82151 - BLOCK
    )
    :vars
    (
      ?auto_82152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82151 ?auto_82152 ) ( ON-TABLE ?auto_82146 ) ( ON ?auto_82147 ?auto_82146 ) ( ON ?auto_82148 ?auto_82147 ) ( not ( = ?auto_82146 ?auto_82147 ) ) ( not ( = ?auto_82146 ?auto_82148 ) ) ( not ( = ?auto_82146 ?auto_82149 ) ) ( not ( = ?auto_82146 ?auto_82150 ) ) ( not ( = ?auto_82146 ?auto_82151 ) ) ( not ( = ?auto_82146 ?auto_82152 ) ) ( not ( = ?auto_82147 ?auto_82148 ) ) ( not ( = ?auto_82147 ?auto_82149 ) ) ( not ( = ?auto_82147 ?auto_82150 ) ) ( not ( = ?auto_82147 ?auto_82151 ) ) ( not ( = ?auto_82147 ?auto_82152 ) ) ( not ( = ?auto_82148 ?auto_82149 ) ) ( not ( = ?auto_82148 ?auto_82150 ) ) ( not ( = ?auto_82148 ?auto_82151 ) ) ( not ( = ?auto_82148 ?auto_82152 ) ) ( not ( = ?auto_82149 ?auto_82150 ) ) ( not ( = ?auto_82149 ?auto_82151 ) ) ( not ( = ?auto_82149 ?auto_82152 ) ) ( not ( = ?auto_82150 ?auto_82151 ) ) ( not ( = ?auto_82150 ?auto_82152 ) ) ( not ( = ?auto_82151 ?auto_82152 ) ) ( ON ?auto_82150 ?auto_82151 ) ( CLEAR ?auto_82148 ) ( ON ?auto_82149 ?auto_82150 ) ( CLEAR ?auto_82149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82146 ?auto_82147 ?auto_82148 ?auto_82149 )
      ( MAKE-6PILE ?auto_82146 ?auto_82147 ?auto_82148 ?auto_82149 ?auto_82150 ?auto_82151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82159 - BLOCK
      ?auto_82160 - BLOCK
      ?auto_82161 - BLOCK
      ?auto_82162 - BLOCK
      ?auto_82163 - BLOCK
      ?auto_82164 - BLOCK
    )
    :vars
    (
      ?auto_82165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82164 ?auto_82165 ) ( ON-TABLE ?auto_82159 ) ( ON ?auto_82160 ?auto_82159 ) ( not ( = ?auto_82159 ?auto_82160 ) ) ( not ( = ?auto_82159 ?auto_82161 ) ) ( not ( = ?auto_82159 ?auto_82162 ) ) ( not ( = ?auto_82159 ?auto_82163 ) ) ( not ( = ?auto_82159 ?auto_82164 ) ) ( not ( = ?auto_82159 ?auto_82165 ) ) ( not ( = ?auto_82160 ?auto_82161 ) ) ( not ( = ?auto_82160 ?auto_82162 ) ) ( not ( = ?auto_82160 ?auto_82163 ) ) ( not ( = ?auto_82160 ?auto_82164 ) ) ( not ( = ?auto_82160 ?auto_82165 ) ) ( not ( = ?auto_82161 ?auto_82162 ) ) ( not ( = ?auto_82161 ?auto_82163 ) ) ( not ( = ?auto_82161 ?auto_82164 ) ) ( not ( = ?auto_82161 ?auto_82165 ) ) ( not ( = ?auto_82162 ?auto_82163 ) ) ( not ( = ?auto_82162 ?auto_82164 ) ) ( not ( = ?auto_82162 ?auto_82165 ) ) ( not ( = ?auto_82163 ?auto_82164 ) ) ( not ( = ?auto_82163 ?auto_82165 ) ) ( not ( = ?auto_82164 ?auto_82165 ) ) ( ON ?auto_82163 ?auto_82164 ) ( ON ?auto_82162 ?auto_82163 ) ( CLEAR ?auto_82160 ) ( ON ?auto_82161 ?auto_82162 ) ( CLEAR ?auto_82161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82159 ?auto_82160 ?auto_82161 )
      ( MAKE-6PILE ?auto_82159 ?auto_82160 ?auto_82161 ?auto_82162 ?auto_82163 ?auto_82164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82172 - BLOCK
      ?auto_82173 - BLOCK
      ?auto_82174 - BLOCK
      ?auto_82175 - BLOCK
      ?auto_82176 - BLOCK
      ?auto_82177 - BLOCK
    )
    :vars
    (
      ?auto_82178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82177 ?auto_82178 ) ( ON-TABLE ?auto_82172 ) ( ON ?auto_82173 ?auto_82172 ) ( not ( = ?auto_82172 ?auto_82173 ) ) ( not ( = ?auto_82172 ?auto_82174 ) ) ( not ( = ?auto_82172 ?auto_82175 ) ) ( not ( = ?auto_82172 ?auto_82176 ) ) ( not ( = ?auto_82172 ?auto_82177 ) ) ( not ( = ?auto_82172 ?auto_82178 ) ) ( not ( = ?auto_82173 ?auto_82174 ) ) ( not ( = ?auto_82173 ?auto_82175 ) ) ( not ( = ?auto_82173 ?auto_82176 ) ) ( not ( = ?auto_82173 ?auto_82177 ) ) ( not ( = ?auto_82173 ?auto_82178 ) ) ( not ( = ?auto_82174 ?auto_82175 ) ) ( not ( = ?auto_82174 ?auto_82176 ) ) ( not ( = ?auto_82174 ?auto_82177 ) ) ( not ( = ?auto_82174 ?auto_82178 ) ) ( not ( = ?auto_82175 ?auto_82176 ) ) ( not ( = ?auto_82175 ?auto_82177 ) ) ( not ( = ?auto_82175 ?auto_82178 ) ) ( not ( = ?auto_82176 ?auto_82177 ) ) ( not ( = ?auto_82176 ?auto_82178 ) ) ( not ( = ?auto_82177 ?auto_82178 ) ) ( ON ?auto_82176 ?auto_82177 ) ( ON ?auto_82175 ?auto_82176 ) ( CLEAR ?auto_82173 ) ( ON ?auto_82174 ?auto_82175 ) ( CLEAR ?auto_82174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82172 ?auto_82173 ?auto_82174 )
      ( MAKE-6PILE ?auto_82172 ?auto_82173 ?auto_82174 ?auto_82175 ?auto_82176 ?auto_82177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82185 - BLOCK
      ?auto_82186 - BLOCK
      ?auto_82187 - BLOCK
      ?auto_82188 - BLOCK
      ?auto_82189 - BLOCK
      ?auto_82190 - BLOCK
    )
    :vars
    (
      ?auto_82191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82190 ?auto_82191 ) ( ON-TABLE ?auto_82185 ) ( not ( = ?auto_82185 ?auto_82186 ) ) ( not ( = ?auto_82185 ?auto_82187 ) ) ( not ( = ?auto_82185 ?auto_82188 ) ) ( not ( = ?auto_82185 ?auto_82189 ) ) ( not ( = ?auto_82185 ?auto_82190 ) ) ( not ( = ?auto_82185 ?auto_82191 ) ) ( not ( = ?auto_82186 ?auto_82187 ) ) ( not ( = ?auto_82186 ?auto_82188 ) ) ( not ( = ?auto_82186 ?auto_82189 ) ) ( not ( = ?auto_82186 ?auto_82190 ) ) ( not ( = ?auto_82186 ?auto_82191 ) ) ( not ( = ?auto_82187 ?auto_82188 ) ) ( not ( = ?auto_82187 ?auto_82189 ) ) ( not ( = ?auto_82187 ?auto_82190 ) ) ( not ( = ?auto_82187 ?auto_82191 ) ) ( not ( = ?auto_82188 ?auto_82189 ) ) ( not ( = ?auto_82188 ?auto_82190 ) ) ( not ( = ?auto_82188 ?auto_82191 ) ) ( not ( = ?auto_82189 ?auto_82190 ) ) ( not ( = ?auto_82189 ?auto_82191 ) ) ( not ( = ?auto_82190 ?auto_82191 ) ) ( ON ?auto_82189 ?auto_82190 ) ( ON ?auto_82188 ?auto_82189 ) ( ON ?auto_82187 ?auto_82188 ) ( CLEAR ?auto_82185 ) ( ON ?auto_82186 ?auto_82187 ) ( CLEAR ?auto_82186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82185 ?auto_82186 )
      ( MAKE-6PILE ?auto_82185 ?auto_82186 ?auto_82187 ?auto_82188 ?auto_82189 ?auto_82190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82198 - BLOCK
      ?auto_82199 - BLOCK
      ?auto_82200 - BLOCK
      ?auto_82201 - BLOCK
      ?auto_82202 - BLOCK
      ?auto_82203 - BLOCK
    )
    :vars
    (
      ?auto_82204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82203 ?auto_82204 ) ( ON-TABLE ?auto_82198 ) ( not ( = ?auto_82198 ?auto_82199 ) ) ( not ( = ?auto_82198 ?auto_82200 ) ) ( not ( = ?auto_82198 ?auto_82201 ) ) ( not ( = ?auto_82198 ?auto_82202 ) ) ( not ( = ?auto_82198 ?auto_82203 ) ) ( not ( = ?auto_82198 ?auto_82204 ) ) ( not ( = ?auto_82199 ?auto_82200 ) ) ( not ( = ?auto_82199 ?auto_82201 ) ) ( not ( = ?auto_82199 ?auto_82202 ) ) ( not ( = ?auto_82199 ?auto_82203 ) ) ( not ( = ?auto_82199 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82201 ) ) ( not ( = ?auto_82200 ?auto_82202 ) ) ( not ( = ?auto_82200 ?auto_82203 ) ) ( not ( = ?auto_82200 ?auto_82204 ) ) ( not ( = ?auto_82201 ?auto_82202 ) ) ( not ( = ?auto_82201 ?auto_82203 ) ) ( not ( = ?auto_82201 ?auto_82204 ) ) ( not ( = ?auto_82202 ?auto_82203 ) ) ( not ( = ?auto_82202 ?auto_82204 ) ) ( not ( = ?auto_82203 ?auto_82204 ) ) ( ON ?auto_82202 ?auto_82203 ) ( ON ?auto_82201 ?auto_82202 ) ( ON ?auto_82200 ?auto_82201 ) ( CLEAR ?auto_82198 ) ( ON ?auto_82199 ?auto_82200 ) ( CLEAR ?auto_82199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82198 ?auto_82199 )
      ( MAKE-6PILE ?auto_82198 ?auto_82199 ?auto_82200 ?auto_82201 ?auto_82202 ?auto_82203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82211 - BLOCK
      ?auto_82212 - BLOCK
      ?auto_82213 - BLOCK
      ?auto_82214 - BLOCK
      ?auto_82215 - BLOCK
      ?auto_82216 - BLOCK
    )
    :vars
    (
      ?auto_82217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82216 ?auto_82217 ) ( not ( = ?auto_82211 ?auto_82212 ) ) ( not ( = ?auto_82211 ?auto_82213 ) ) ( not ( = ?auto_82211 ?auto_82214 ) ) ( not ( = ?auto_82211 ?auto_82215 ) ) ( not ( = ?auto_82211 ?auto_82216 ) ) ( not ( = ?auto_82211 ?auto_82217 ) ) ( not ( = ?auto_82212 ?auto_82213 ) ) ( not ( = ?auto_82212 ?auto_82214 ) ) ( not ( = ?auto_82212 ?auto_82215 ) ) ( not ( = ?auto_82212 ?auto_82216 ) ) ( not ( = ?auto_82212 ?auto_82217 ) ) ( not ( = ?auto_82213 ?auto_82214 ) ) ( not ( = ?auto_82213 ?auto_82215 ) ) ( not ( = ?auto_82213 ?auto_82216 ) ) ( not ( = ?auto_82213 ?auto_82217 ) ) ( not ( = ?auto_82214 ?auto_82215 ) ) ( not ( = ?auto_82214 ?auto_82216 ) ) ( not ( = ?auto_82214 ?auto_82217 ) ) ( not ( = ?auto_82215 ?auto_82216 ) ) ( not ( = ?auto_82215 ?auto_82217 ) ) ( not ( = ?auto_82216 ?auto_82217 ) ) ( ON ?auto_82215 ?auto_82216 ) ( ON ?auto_82214 ?auto_82215 ) ( ON ?auto_82213 ?auto_82214 ) ( ON ?auto_82212 ?auto_82213 ) ( ON ?auto_82211 ?auto_82212 ) ( CLEAR ?auto_82211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82211 )
      ( MAKE-6PILE ?auto_82211 ?auto_82212 ?auto_82213 ?auto_82214 ?auto_82215 ?auto_82216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82224 - BLOCK
      ?auto_82225 - BLOCK
      ?auto_82226 - BLOCK
      ?auto_82227 - BLOCK
      ?auto_82228 - BLOCK
      ?auto_82229 - BLOCK
    )
    :vars
    (
      ?auto_82230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82229 ?auto_82230 ) ( not ( = ?auto_82224 ?auto_82225 ) ) ( not ( = ?auto_82224 ?auto_82226 ) ) ( not ( = ?auto_82224 ?auto_82227 ) ) ( not ( = ?auto_82224 ?auto_82228 ) ) ( not ( = ?auto_82224 ?auto_82229 ) ) ( not ( = ?auto_82224 ?auto_82230 ) ) ( not ( = ?auto_82225 ?auto_82226 ) ) ( not ( = ?auto_82225 ?auto_82227 ) ) ( not ( = ?auto_82225 ?auto_82228 ) ) ( not ( = ?auto_82225 ?auto_82229 ) ) ( not ( = ?auto_82225 ?auto_82230 ) ) ( not ( = ?auto_82226 ?auto_82227 ) ) ( not ( = ?auto_82226 ?auto_82228 ) ) ( not ( = ?auto_82226 ?auto_82229 ) ) ( not ( = ?auto_82226 ?auto_82230 ) ) ( not ( = ?auto_82227 ?auto_82228 ) ) ( not ( = ?auto_82227 ?auto_82229 ) ) ( not ( = ?auto_82227 ?auto_82230 ) ) ( not ( = ?auto_82228 ?auto_82229 ) ) ( not ( = ?auto_82228 ?auto_82230 ) ) ( not ( = ?auto_82229 ?auto_82230 ) ) ( ON ?auto_82228 ?auto_82229 ) ( ON ?auto_82227 ?auto_82228 ) ( ON ?auto_82226 ?auto_82227 ) ( ON ?auto_82225 ?auto_82226 ) ( ON ?auto_82224 ?auto_82225 ) ( CLEAR ?auto_82224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82224 )
      ( MAKE-6PILE ?auto_82224 ?auto_82225 ?auto_82226 ?auto_82227 ?auto_82228 ?auto_82229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82238 - BLOCK
      ?auto_82239 - BLOCK
      ?auto_82240 - BLOCK
      ?auto_82241 - BLOCK
      ?auto_82242 - BLOCK
      ?auto_82243 - BLOCK
      ?auto_82244 - BLOCK
    )
    :vars
    (
      ?auto_82245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82243 ) ( ON ?auto_82244 ?auto_82245 ) ( CLEAR ?auto_82244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82238 ) ( ON ?auto_82239 ?auto_82238 ) ( ON ?auto_82240 ?auto_82239 ) ( ON ?auto_82241 ?auto_82240 ) ( ON ?auto_82242 ?auto_82241 ) ( ON ?auto_82243 ?auto_82242 ) ( not ( = ?auto_82238 ?auto_82239 ) ) ( not ( = ?auto_82238 ?auto_82240 ) ) ( not ( = ?auto_82238 ?auto_82241 ) ) ( not ( = ?auto_82238 ?auto_82242 ) ) ( not ( = ?auto_82238 ?auto_82243 ) ) ( not ( = ?auto_82238 ?auto_82244 ) ) ( not ( = ?auto_82238 ?auto_82245 ) ) ( not ( = ?auto_82239 ?auto_82240 ) ) ( not ( = ?auto_82239 ?auto_82241 ) ) ( not ( = ?auto_82239 ?auto_82242 ) ) ( not ( = ?auto_82239 ?auto_82243 ) ) ( not ( = ?auto_82239 ?auto_82244 ) ) ( not ( = ?auto_82239 ?auto_82245 ) ) ( not ( = ?auto_82240 ?auto_82241 ) ) ( not ( = ?auto_82240 ?auto_82242 ) ) ( not ( = ?auto_82240 ?auto_82243 ) ) ( not ( = ?auto_82240 ?auto_82244 ) ) ( not ( = ?auto_82240 ?auto_82245 ) ) ( not ( = ?auto_82241 ?auto_82242 ) ) ( not ( = ?auto_82241 ?auto_82243 ) ) ( not ( = ?auto_82241 ?auto_82244 ) ) ( not ( = ?auto_82241 ?auto_82245 ) ) ( not ( = ?auto_82242 ?auto_82243 ) ) ( not ( = ?auto_82242 ?auto_82244 ) ) ( not ( = ?auto_82242 ?auto_82245 ) ) ( not ( = ?auto_82243 ?auto_82244 ) ) ( not ( = ?auto_82243 ?auto_82245 ) ) ( not ( = ?auto_82244 ?auto_82245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82244 ?auto_82245 )
      ( !STACK ?auto_82244 ?auto_82243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82253 - BLOCK
      ?auto_82254 - BLOCK
      ?auto_82255 - BLOCK
      ?auto_82256 - BLOCK
      ?auto_82257 - BLOCK
      ?auto_82258 - BLOCK
      ?auto_82259 - BLOCK
    )
    :vars
    (
      ?auto_82260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82258 ) ( ON ?auto_82259 ?auto_82260 ) ( CLEAR ?auto_82259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82253 ) ( ON ?auto_82254 ?auto_82253 ) ( ON ?auto_82255 ?auto_82254 ) ( ON ?auto_82256 ?auto_82255 ) ( ON ?auto_82257 ?auto_82256 ) ( ON ?auto_82258 ?auto_82257 ) ( not ( = ?auto_82253 ?auto_82254 ) ) ( not ( = ?auto_82253 ?auto_82255 ) ) ( not ( = ?auto_82253 ?auto_82256 ) ) ( not ( = ?auto_82253 ?auto_82257 ) ) ( not ( = ?auto_82253 ?auto_82258 ) ) ( not ( = ?auto_82253 ?auto_82259 ) ) ( not ( = ?auto_82253 ?auto_82260 ) ) ( not ( = ?auto_82254 ?auto_82255 ) ) ( not ( = ?auto_82254 ?auto_82256 ) ) ( not ( = ?auto_82254 ?auto_82257 ) ) ( not ( = ?auto_82254 ?auto_82258 ) ) ( not ( = ?auto_82254 ?auto_82259 ) ) ( not ( = ?auto_82254 ?auto_82260 ) ) ( not ( = ?auto_82255 ?auto_82256 ) ) ( not ( = ?auto_82255 ?auto_82257 ) ) ( not ( = ?auto_82255 ?auto_82258 ) ) ( not ( = ?auto_82255 ?auto_82259 ) ) ( not ( = ?auto_82255 ?auto_82260 ) ) ( not ( = ?auto_82256 ?auto_82257 ) ) ( not ( = ?auto_82256 ?auto_82258 ) ) ( not ( = ?auto_82256 ?auto_82259 ) ) ( not ( = ?auto_82256 ?auto_82260 ) ) ( not ( = ?auto_82257 ?auto_82258 ) ) ( not ( = ?auto_82257 ?auto_82259 ) ) ( not ( = ?auto_82257 ?auto_82260 ) ) ( not ( = ?auto_82258 ?auto_82259 ) ) ( not ( = ?auto_82258 ?auto_82260 ) ) ( not ( = ?auto_82259 ?auto_82260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82259 ?auto_82260 )
      ( !STACK ?auto_82259 ?auto_82258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82268 - BLOCK
      ?auto_82269 - BLOCK
      ?auto_82270 - BLOCK
      ?auto_82271 - BLOCK
      ?auto_82272 - BLOCK
      ?auto_82273 - BLOCK
      ?auto_82274 - BLOCK
    )
    :vars
    (
      ?auto_82275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82274 ?auto_82275 ) ( ON-TABLE ?auto_82268 ) ( ON ?auto_82269 ?auto_82268 ) ( ON ?auto_82270 ?auto_82269 ) ( ON ?auto_82271 ?auto_82270 ) ( ON ?auto_82272 ?auto_82271 ) ( not ( = ?auto_82268 ?auto_82269 ) ) ( not ( = ?auto_82268 ?auto_82270 ) ) ( not ( = ?auto_82268 ?auto_82271 ) ) ( not ( = ?auto_82268 ?auto_82272 ) ) ( not ( = ?auto_82268 ?auto_82273 ) ) ( not ( = ?auto_82268 ?auto_82274 ) ) ( not ( = ?auto_82268 ?auto_82275 ) ) ( not ( = ?auto_82269 ?auto_82270 ) ) ( not ( = ?auto_82269 ?auto_82271 ) ) ( not ( = ?auto_82269 ?auto_82272 ) ) ( not ( = ?auto_82269 ?auto_82273 ) ) ( not ( = ?auto_82269 ?auto_82274 ) ) ( not ( = ?auto_82269 ?auto_82275 ) ) ( not ( = ?auto_82270 ?auto_82271 ) ) ( not ( = ?auto_82270 ?auto_82272 ) ) ( not ( = ?auto_82270 ?auto_82273 ) ) ( not ( = ?auto_82270 ?auto_82274 ) ) ( not ( = ?auto_82270 ?auto_82275 ) ) ( not ( = ?auto_82271 ?auto_82272 ) ) ( not ( = ?auto_82271 ?auto_82273 ) ) ( not ( = ?auto_82271 ?auto_82274 ) ) ( not ( = ?auto_82271 ?auto_82275 ) ) ( not ( = ?auto_82272 ?auto_82273 ) ) ( not ( = ?auto_82272 ?auto_82274 ) ) ( not ( = ?auto_82272 ?auto_82275 ) ) ( not ( = ?auto_82273 ?auto_82274 ) ) ( not ( = ?auto_82273 ?auto_82275 ) ) ( not ( = ?auto_82274 ?auto_82275 ) ) ( CLEAR ?auto_82272 ) ( ON ?auto_82273 ?auto_82274 ) ( CLEAR ?auto_82273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 ?auto_82273 )
      ( MAKE-7PILE ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 ?auto_82273 ?auto_82274 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82283 - BLOCK
      ?auto_82284 - BLOCK
      ?auto_82285 - BLOCK
      ?auto_82286 - BLOCK
      ?auto_82287 - BLOCK
      ?auto_82288 - BLOCK
      ?auto_82289 - BLOCK
    )
    :vars
    (
      ?auto_82290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82289 ?auto_82290 ) ( ON-TABLE ?auto_82283 ) ( ON ?auto_82284 ?auto_82283 ) ( ON ?auto_82285 ?auto_82284 ) ( ON ?auto_82286 ?auto_82285 ) ( ON ?auto_82287 ?auto_82286 ) ( not ( = ?auto_82283 ?auto_82284 ) ) ( not ( = ?auto_82283 ?auto_82285 ) ) ( not ( = ?auto_82283 ?auto_82286 ) ) ( not ( = ?auto_82283 ?auto_82287 ) ) ( not ( = ?auto_82283 ?auto_82288 ) ) ( not ( = ?auto_82283 ?auto_82289 ) ) ( not ( = ?auto_82283 ?auto_82290 ) ) ( not ( = ?auto_82284 ?auto_82285 ) ) ( not ( = ?auto_82284 ?auto_82286 ) ) ( not ( = ?auto_82284 ?auto_82287 ) ) ( not ( = ?auto_82284 ?auto_82288 ) ) ( not ( = ?auto_82284 ?auto_82289 ) ) ( not ( = ?auto_82284 ?auto_82290 ) ) ( not ( = ?auto_82285 ?auto_82286 ) ) ( not ( = ?auto_82285 ?auto_82287 ) ) ( not ( = ?auto_82285 ?auto_82288 ) ) ( not ( = ?auto_82285 ?auto_82289 ) ) ( not ( = ?auto_82285 ?auto_82290 ) ) ( not ( = ?auto_82286 ?auto_82287 ) ) ( not ( = ?auto_82286 ?auto_82288 ) ) ( not ( = ?auto_82286 ?auto_82289 ) ) ( not ( = ?auto_82286 ?auto_82290 ) ) ( not ( = ?auto_82287 ?auto_82288 ) ) ( not ( = ?auto_82287 ?auto_82289 ) ) ( not ( = ?auto_82287 ?auto_82290 ) ) ( not ( = ?auto_82288 ?auto_82289 ) ) ( not ( = ?auto_82288 ?auto_82290 ) ) ( not ( = ?auto_82289 ?auto_82290 ) ) ( CLEAR ?auto_82287 ) ( ON ?auto_82288 ?auto_82289 ) ( CLEAR ?auto_82288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 ?auto_82288 )
      ( MAKE-7PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 ?auto_82288 ?auto_82289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82298 - BLOCK
      ?auto_82299 - BLOCK
      ?auto_82300 - BLOCK
      ?auto_82301 - BLOCK
      ?auto_82302 - BLOCK
      ?auto_82303 - BLOCK
      ?auto_82304 - BLOCK
    )
    :vars
    (
      ?auto_82305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82304 ?auto_82305 ) ( ON-TABLE ?auto_82298 ) ( ON ?auto_82299 ?auto_82298 ) ( ON ?auto_82300 ?auto_82299 ) ( ON ?auto_82301 ?auto_82300 ) ( not ( = ?auto_82298 ?auto_82299 ) ) ( not ( = ?auto_82298 ?auto_82300 ) ) ( not ( = ?auto_82298 ?auto_82301 ) ) ( not ( = ?auto_82298 ?auto_82302 ) ) ( not ( = ?auto_82298 ?auto_82303 ) ) ( not ( = ?auto_82298 ?auto_82304 ) ) ( not ( = ?auto_82298 ?auto_82305 ) ) ( not ( = ?auto_82299 ?auto_82300 ) ) ( not ( = ?auto_82299 ?auto_82301 ) ) ( not ( = ?auto_82299 ?auto_82302 ) ) ( not ( = ?auto_82299 ?auto_82303 ) ) ( not ( = ?auto_82299 ?auto_82304 ) ) ( not ( = ?auto_82299 ?auto_82305 ) ) ( not ( = ?auto_82300 ?auto_82301 ) ) ( not ( = ?auto_82300 ?auto_82302 ) ) ( not ( = ?auto_82300 ?auto_82303 ) ) ( not ( = ?auto_82300 ?auto_82304 ) ) ( not ( = ?auto_82300 ?auto_82305 ) ) ( not ( = ?auto_82301 ?auto_82302 ) ) ( not ( = ?auto_82301 ?auto_82303 ) ) ( not ( = ?auto_82301 ?auto_82304 ) ) ( not ( = ?auto_82301 ?auto_82305 ) ) ( not ( = ?auto_82302 ?auto_82303 ) ) ( not ( = ?auto_82302 ?auto_82304 ) ) ( not ( = ?auto_82302 ?auto_82305 ) ) ( not ( = ?auto_82303 ?auto_82304 ) ) ( not ( = ?auto_82303 ?auto_82305 ) ) ( not ( = ?auto_82304 ?auto_82305 ) ) ( ON ?auto_82303 ?auto_82304 ) ( CLEAR ?auto_82301 ) ( ON ?auto_82302 ?auto_82303 ) ( CLEAR ?auto_82302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82298 ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 )
      ( MAKE-7PILE ?auto_82298 ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 ?auto_82303 ?auto_82304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82313 - BLOCK
      ?auto_82314 - BLOCK
      ?auto_82315 - BLOCK
      ?auto_82316 - BLOCK
      ?auto_82317 - BLOCK
      ?auto_82318 - BLOCK
      ?auto_82319 - BLOCK
    )
    :vars
    (
      ?auto_82320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82319 ?auto_82320 ) ( ON-TABLE ?auto_82313 ) ( ON ?auto_82314 ?auto_82313 ) ( ON ?auto_82315 ?auto_82314 ) ( ON ?auto_82316 ?auto_82315 ) ( not ( = ?auto_82313 ?auto_82314 ) ) ( not ( = ?auto_82313 ?auto_82315 ) ) ( not ( = ?auto_82313 ?auto_82316 ) ) ( not ( = ?auto_82313 ?auto_82317 ) ) ( not ( = ?auto_82313 ?auto_82318 ) ) ( not ( = ?auto_82313 ?auto_82319 ) ) ( not ( = ?auto_82313 ?auto_82320 ) ) ( not ( = ?auto_82314 ?auto_82315 ) ) ( not ( = ?auto_82314 ?auto_82316 ) ) ( not ( = ?auto_82314 ?auto_82317 ) ) ( not ( = ?auto_82314 ?auto_82318 ) ) ( not ( = ?auto_82314 ?auto_82319 ) ) ( not ( = ?auto_82314 ?auto_82320 ) ) ( not ( = ?auto_82315 ?auto_82316 ) ) ( not ( = ?auto_82315 ?auto_82317 ) ) ( not ( = ?auto_82315 ?auto_82318 ) ) ( not ( = ?auto_82315 ?auto_82319 ) ) ( not ( = ?auto_82315 ?auto_82320 ) ) ( not ( = ?auto_82316 ?auto_82317 ) ) ( not ( = ?auto_82316 ?auto_82318 ) ) ( not ( = ?auto_82316 ?auto_82319 ) ) ( not ( = ?auto_82316 ?auto_82320 ) ) ( not ( = ?auto_82317 ?auto_82318 ) ) ( not ( = ?auto_82317 ?auto_82319 ) ) ( not ( = ?auto_82317 ?auto_82320 ) ) ( not ( = ?auto_82318 ?auto_82319 ) ) ( not ( = ?auto_82318 ?auto_82320 ) ) ( not ( = ?auto_82319 ?auto_82320 ) ) ( ON ?auto_82318 ?auto_82319 ) ( CLEAR ?auto_82316 ) ( ON ?auto_82317 ?auto_82318 ) ( CLEAR ?auto_82317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82313 ?auto_82314 ?auto_82315 ?auto_82316 ?auto_82317 )
      ( MAKE-7PILE ?auto_82313 ?auto_82314 ?auto_82315 ?auto_82316 ?auto_82317 ?auto_82318 ?auto_82319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82328 - BLOCK
      ?auto_82329 - BLOCK
      ?auto_82330 - BLOCK
      ?auto_82331 - BLOCK
      ?auto_82332 - BLOCK
      ?auto_82333 - BLOCK
      ?auto_82334 - BLOCK
    )
    :vars
    (
      ?auto_82335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82334 ?auto_82335 ) ( ON-TABLE ?auto_82328 ) ( ON ?auto_82329 ?auto_82328 ) ( ON ?auto_82330 ?auto_82329 ) ( not ( = ?auto_82328 ?auto_82329 ) ) ( not ( = ?auto_82328 ?auto_82330 ) ) ( not ( = ?auto_82328 ?auto_82331 ) ) ( not ( = ?auto_82328 ?auto_82332 ) ) ( not ( = ?auto_82328 ?auto_82333 ) ) ( not ( = ?auto_82328 ?auto_82334 ) ) ( not ( = ?auto_82328 ?auto_82335 ) ) ( not ( = ?auto_82329 ?auto_82330 ) ) ( not ( = ?auto_82329 ?auto_82331 ) ) ( not ( = ?auto_82329 ?auto_82332 ) ) ( not ( = ?auto_82329 ?auto_82333 ) ) ( not ( = ?auto_82329 ?auto_82334 ) ) ( not ( = ?auto_82329 ?auto_82335 ) ) ( not ( = ?auto_82330 ?auto_82331 ) ) ( not ( = ?auto_82330 ?auto_82332 ) ) ( not ( = ?auto_82330 ?auto_82333 ) ) ( not ( = ?auto_82330 ?auto_82334 ) ) ( not ( = ?auto_82330 ?auto_82335 ) ) ( not ( = ?auto_82331 ?auto_82332 ) ) ( not ( = ?auto_82331 ?auto_82333 ) ) ( not ( = ?auto_82331 ?auto_82334 ) ) ( not ( = ?auto_82331 ?auto_82335 ) ) ( not ( = ?auto_82332 ?auto_82333 ) ) ( not ( = ?auto_82332 ?auto_82334 ) ) ( not ( = ?auto_82332 ?auto_82335 ) ) ( not ( = ?auto_82333 ?auto_82334 ) ) ( not ( = ?auto_82333 ?auto_82335 ) ) ( not ( = ?auto_82334 ?auto_82335 ) ) ( ON ?auto_82333 ?auto_82334 ) ( ON ?auto_82332 ?auto_82333 ) ( CLEAR ?auto_82330 ) ( ON ?auto_82331 ?auto_82332 ) ( CLEAR ?auto_82331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82328 ?auto_82329 ?auto_82330 ?auto_82331 )
      ( MAKE-7PILE ?auto_82328 ?auto_82329 ?auto_82330 ?auto_82331 ?auto_82332 ?auto_82333 ?auto_82334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82343 - BLOCK
      ?auto_82344 - BLOCK
      ?auto_82345 - BLOCK
      ?auto_82346 - BLOCK
      ?auto_82347 - BLOCK
      ?auto_82348 - BLOCK
      ?auto_82349 - BLOCK
    )
    :vars
    (
      ?auto_82350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82349 ?auto_82350 ) ( ON-TABLE ?auto_82343 ) ( ON ?auto_82344 ?auto_82343 ) ( ON ?auto_82345 ?auto_82344 ) ( not ( = ?auto_82343 ?auto_82344 ) ) ( not ( = ?auto_82343 ?auto_82345 ) ) ( not ( = ?auto_82343 ?auto_82346 ) ) ( not ( = ?auto_82343 ?auto_82347 ) ) ( not ( = ?auto_82343 ?auto_82348 ) ) ( not ( = ?auto_82343 ?auto_82349 ) ) ( not ( = ?auto_82343 ?auto_82350 ) ) ( not ( = ?auto_82344 ?auto_82345 ) ) ( not ( = ?auto_82344 ?auto_82346 ) ) ( not ( = ?auto_82344 ?auto_82347 ) ) ( not ( = ?auto_82344 ?auto_82348 ) ) ( not ( = ?auto_82344 ?auto_82349 ) ) ( not ( = ?auto_82344 ?auto_82350 ) ) ( not ( = ?auto_82345 ?auto_82346 ) ) ( not ( = ?auto_82345 ?auto_82347 ) ) ( not ( = ?auto_82345 ?auto_82348 ) ) ( not ( = ?auto_82345 ?auto_82349 ) ) ( not ( = ?auto_82345 ?auto_82350 ) ) ( not ( = ?auto_82346 ?auto_82347 ) ) ( not ( = ?auto_82346 ?auto_82348 ) ) ( not ( = ?auto_82346 ?auto_82349 ) ) ( not ( = ?auto_82346 ?auto_82350 ) ) ( not ( = ?auto_82347 ?auto_82348 ) ) ( not ( = ?auto_82347 ?auto_82349 ) ) ( not ( = ?auto_82347 ?auto_82350 ) ) ( not ( = ?auto_82348 ?auto_82349 ) ) ( not ( = ?auto_82348 ?auto_82350 ) ) ( not ( = ?auto_82349 ?auto_82350 ) ) ( ON ?auto_82348 ?auto_82349 ) ( ON ?auto_82347 ?auto_82348 ) ( CLEAR ?auto_82345 ) ( ON ?auto_82346 ?auto_82347 ) ( CLEAR ?auto_82346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82343 ?auto_82344 ?auto_82345 ?auto_82346 )
      ( MAKE-7PILE ?auto_82343 ?auto_82344 ?auto_82345 ?auto_82346 ?auto_82347 ?auto_82348 ?auto_82349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82358 - BLOCK
      ?auto_82359 - BLOCK
      ?auto_82360 - BLOCK
      ?auto_82361 - BLOCK
      ?auto_82362 - BLOCK
      ?auto_82363 - BLOCK
      ?auto_82364 - BLOCK
    )
    :vars
    (
      ?auto_82365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82364 ?auto_82365 ) ( ON-TABLE ?auto_82358 ) ( ON ?auto_82359 ?auto_82358 ) ( not ( = ?auto_82358 ?auto_82359 ) ) ( not ( = ?auto_82358 ?auto_82360 ) ) ( not ( = ?auto_82358 ?auto_82361 ) ) ( not ( = ?auto_82358 ?auto_82362 ) ) ( not ( = ?auto_82358 ?auto_82363 ) ) ( not ( = ?auto_82358 ?auto_82364 ) ) ( not ( = ?auto_82358 ?auto_82365 ) ) ( not ( = ?auto_82359 ?auto_82360 ) ) ( not ( = ?auto_82359 ?auto_82361 ) ) ( not ( = ?auto_82359 ?auto_82362 ) ) ( not ( = ?auto_82359 ?auto_82363 ) ) ( not ( = ?auto_82359 ?auto_82364 ) ) ( not ( = ?auto_82359 ?auto_82365 ) ) ( not ( = ?auto_82360 ?auto_82361 ) ) ( not ( = ?auto_82360 ?auto_82362 ) ) ( not ( = ?auto_82360 ?auto_82363 ) ) ( not ( = ?auto_82360 ?auto_82364 ) ) ( not ( = ?auto_82360 ?auto_82365 ) ) ( not ( = ?auto_82361 ?auto_82362 ) ) ( not ( = ?auto_82361 ?auto_82363 ) ) ( not ( = ?auto_82361 ?auto_82364 ) ) ( not ( = ?auto_82361 ?auto_82365 ) ) ( not ( = ?auto_82362 ?auto_82363 ) ) ( not ( = ?auto_82362 ?auto_82364 ) ) ( not ( = ?auto_82362 ?auto_82365 ) ) ( not ( = ?auto_82363 ?auto_82364 ) ) ( not ( = ?auto_82363 ?auto_82365 ) ) ( not ( = ?auto_82364 ?auto_82365 ) ) ( ON ?auto_82363 ?auto_82364 ) ( ON ?auto_82362 ?auto_82363 ) ( ON ?auto_82361 ?auto_82362 ) ( CLEAR ?auto_82359 ) ( ON ?auto_82360 ?auto_82361 ) ( CLEAR ?auto_82360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82358 ?auto_82359 ?auto_82360 )
      ( MAKE-7PILE ?auto_82358 ?auto_82359 ?auto_82360 ?auto_82361 ?auto_82362 ?auto_82363 ?auto_82364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82373 - BLOCK
      ?auto_82374 - BLOCK
      ?auto_82375 - BLOCK
      ?auto_82376 - BLOCK
      ?auto_82377 - BLOCK
      ?auto_82378 - BLOCK
      ?auto_82379 - BLOCK
    )
    :vars
    (
      ?auto_82380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82379 ?auto_82380 ) ( ON-TABLE ?auto_82373 ) ( ON ?auto_82374 ?auto_82373 ) ( not ( = ?auto_82373 ?auto_82374 ) ) ( not ( = ?auto_82373 ?auto_82375 ) ) ( not ( = ?auto_82373 ?auto_82376 ) ) ( not ( = ?auto_82373 ?auto_82377 ) ) ( not ( = ?auto_82373 ?auto_82378 ) ) ( not ( = ?auto_82373 ?auto_82379 ) ) ( not ( = ?auto_82373 ?auto_82380 ) ) ( not ( = ?auto_82374 ?auto_82375 ) ) ( not ( = ?auto_82374 ?auto_82376 ) ) ( not ( = ?auto_82374 ?auto_82377 ) ) ( not ( = ?auto_82374 ?auto_82378 ) ) ( not ( = ?auto_82374 ?auto_82379 ) ) ( not ( = ?auto_82374 ?auto_82380 ) ) ( not ( = ?auto_82375 ?auto_82376 ) ) ( not ( = ?auto_82375 ?auto_82377 ) ) ( not ( = ?auto_82375 ?auto_82378 ) ) ( not ( = ?auto_82375 ?auto_82379 ) ) ( not ( = ?auto_82375 ?auto_82380 ) ) ( not ( = ?auto_82376 ?auto_82377 ) ) ( not ( = ?auto_82376 ?auto_82378 ) ) ( not ( = ?auto_82376 ?auto_82379 ) ) ( not ( = ?auto_82376 ?auto_82380 ) ) ( not ( = ?auto_82377 ?auto_82378 ) ) ( not ( = ?auto_82377 ?auto_82379 ) ) ( not ( = ?auto_82377 ?auto_82380 ) ) ( not ( = ?auto_82378 ?auto_82379 ) ) ( not ( = ?auto_82378 ?auto_82380 ) ) ( not ( = ?auto_82379 ?auto_82380 ) ) ( ON ?auto_82378 ?auto_82379 ) ( ON ?auto_82377 ?auto_82378 ) ( ON ?auto_82376 ?auto_82377 ) ( CLEAR ?auto_82374 ) ( ON ?auto_82375 ?auto_82376 ) ( CLEAR ?auto_82375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82373 ?auto_82374 ?auto_82375 )
      ( MAKE-7PILE ?auto_82373 ?auto_82374 ?auto_82375 ?auto_82376 ?auto_82377 ?auto_82378 ?auto_82379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82388 - BLOCK
      ?auto_82389 - BLOCK
      ?auto_82390 - BLOCK
      ?auto_82391 - BLOCK
      ?auto_82392 - BLOCK
      ?auto_82393 - BLOCK
      ?auto_82394 - BLOCK
    )
    :vars
    (
      ?auto_82395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82394 ?auto_82395 ) ( ON-TABLE ?auto_82388 ) ( not ( = ?auto_82388 ?auto_82389 ) ) ( not ( = ?auto_82388 ?auto_82390 ) ) ( not ( = ?auto_82388 ?auto_82391 ) ) ( not ( = ?auto_82388 ?auto_82392 ) ) ( not ( = ?auto_82388 ?auto_82393 ) ) ( not ( = ?auto_82388 ?auto_82394 ) ) ( not ( = ?auto_82388 ?auto_82395 ) ) ( not ( = ?auto_82389 ?auto_82390 ) ) ( not ( = ?auto_82389 ?auto_82391 ) ) ( not ( = ?auto_82389 ?auto_82392 ) ) ( not ( = ?auto_82389 ?auto_82393 ) ) ( not ( = ?auto_82389 ?auto_82394 ) ) ( not ( = ?auto_82389 ?auto_82395 ) ) ( not ( = ?auto_82390 ?auto_82391 ) ) ( not ( = ?auto_82390 ?auto_82392 ) ) ( not ( = ?auto_82390 ?auto_82393 ) ) ( not ( = ?auto_82390 ?auto_82394 ) ) ( not ( = ?auto_82390 ?auto_82395 ) ) ( not ( = ?auto_82391 ?auto_82392 ) ) ( not ( = ?auto_82391 ?auto_82393 ) ) ( not ( = ?auto_82391 ?auto_82394 ) ) ( not ( = ?auto_82391 ?auto_82395 ) ) ( not ( = ?auto_82392 ?auto_82393 ) ) ( not ( = ?auto_82392 ?auto_82394 ) ) ( not ( = ?auto_82392 ?auto_82395 ) ) ( not ( = ?auto_82393 ?auto_82394 ) ) ( not ( = ?auto_82393 ?auto_82395 ) ) ( not ( = ?auto_82394 ?auto_82395 ) ) ( ON ?auto_82393 ?auto_82394 ) ( ON ?auto_82392 ?auto_82393 ) ( ON ?auto_82391 ?auto_82392 ) ( ON ?auto_82390 ?auto_82391 ) ( CLEAR ?auto_82388 ) ( ON ?auto_82389 ?auto_82390 ) ( CLEAR ?auto_82389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82388 ?auto_82389 )
      ( MAKE-7PILE ?auto_82388 ?auto_82389 ?auto_82390 ?auto_82391 ?auto_82392 ?auto_82393 ?auto_82394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82403 - BLOCK
      ?auto_82404 - BLOCK
      ?auto_82405 - BLOCK
      ?auto_82406 - BLOCK
      ?auto_82407 - BLOCK
      ?auto_82408 - BLOCK
      ?auto_82409 - BLOCK
    )
    :vars
    (
      ?auto_82410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82409 ?auto_82410 ) ( ON-TABLE ?auto_82403 ) ( not ( = ?auto_82403 ?auto_82404 ) ) ( not ( = ?auto_82403 ?auto_82405 ) ) ( not ( = ?auto_82403 ?auto_82406 ) ) ( not ( = ?auto_82403 ?auto_82407 ) ) ( not ( = ?auto_82403 ?auto_82408 ) ) ( not ( = ?auto_82403 ?auto_82409 ) ) ( not ( = ?auto_82403 ?auto_82410 ) ) ( not ( = ?auto_82404 ?auto_82405 ) ) ( not ( = ?auto_82404 ?auto_82406 ) ) ( not ( = ?auto_82404 ?auto_82407 ) ) ( not ( = ?auto_82404 ?auto_82408 ) ) ( not ( = ?auto_82404 ?auto_82409 ) ) ( not ( = ?auto_82404 ?auto_82410 ) ) ( not ( = ?auto_82405 ?auto_82406 ) ) ( not ( = ?auto_82405 ?auto_82407 ) ) ( not ( = ?auto_82405 ?auto_82408 ) ) ( not ( = ?auto_82405 ?auto_82409 ) ) ( not ( = ?auto_82405 ?auto_82410 ) ) ( not ( = ?auto_82406 ?auto_82407 ) ) ( not ( = ?auto_82406 ?auto_82408 ) ) ( not ( = ?auto_82406 ?auto_82409 ) ) ( not ( = ?auto_82406 ?auto_82410 ) ) ( not ( = ?auto_82407 ?auto_82408 ) ) ( not ( = ?auto_82407 ?auto_82409 ) ) ( not ( = ?auto_82407 ?auto_82410 ) ) ( not ( = ?auto_82408 ?auto_82409 ) ) ( not ( = ?auto_82408 ?auto_82410 ) ) ( not ( = ?auto_82409 ?auto_82410 ) ) ( ON ?auto_82408 ?auto_82409 ) ( ON ?auto_82407 ?auto_82408 ) ( ON ?auto_82406 ?auto_82407 ) ( ON ?auto_82405 ?auto_82406 ) ( CLEAR ?auto_82403 ) ( ON ?auto_82404 ?auto_82405 ) ( CLEAR ?auto_82404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82403 ?auto_82404 )
      ( MAKE-7PILE ?auto_82403 ?auto_82404 ?auto_82405 ?auto_82406 ?auto_82407 ?auto_82408 ?auto_82409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82418 - BLOCK
      ?auto_82419 - BLOCK
      ?auto_82420 - BLOCK
      ?auto_82421 - BLOCK
      ?auto_82422 - BLOCK
      ?auto_82423 - BLOCK
      ?auto_82424 - BLOCK
    )
    :vars
    (
      ?auto_82425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82424 ?auto_82425 ) ( not ( = ?auto_82418 ?auto_82419 ) ) ( not ( = ?auto_82418 ?auto_82420 ) ) ( not ( = ?auto_82418 ?auto_82421 ) ) ( not ( = ?auto_82418 ?auto_82422 ) ) ( not ( = ?auto_82418 ?auto_82423 ) ) ( not ( = ?auto_82418 ?auto_82424 ) ) ( not ( = ?auto_82418 ?auto_82425 ) ) ( not ( = ?auto_82419 ?auto_82420 ) ) ( not ( = ?auto_82419 ?auto_82421 ) ) ( not ( = ?auto_82419 ?auto_82422 ) ) ( not ( = ?auto_82419 ?auto_82423 ) ) ( not ( = ?auto_82419 ?auto_82424 ) ) ( not ( = ?auto_82419 ?auto_82425 ) ) ( not ( = ?auto_82420 ?auto_82421 ) ) ( not ( = ?auto_82420 ?auto_82422 ) ) ( not ( = ?auto_82420 ?auto_82423 ) ) ( not ( = ?auto_82420 ?auto_82424 ) ) ( not ( = ?auto_82420 ?auto_82425 ) ) ( not ( = ?auto_82421 ?auto_82422 ) ) ( not ( = ?auto_82421 ?auto_82423 ) ) ( not ( = ?auto_82421 ?auto_82424 ) ) ( not ( = ?auto_82421 ?auto_82425 ) ) ( not ( = ?auto_82422 ?auto_82423 ) ) ( not ( = ?auto_82422 ?auto_82424 ) ) ( not ( = ?auto_82422 ?auto_82425 ) ) ( not ( = ?auto_82423 ?auto_82424 ) ) ( not ( = ?auto_82423 ?auto_82425 ) ) ( not ( = ?auto_82424 ?auto_82425 ) ) ( ON ?auto_82423 ?auto_82424 ) ( ON ?auto_82422 ?auto_82423 ) ( ON ?auto_82421 ?auto_82422 ) ( ON ?auto_82420 ?auto_82421 ) ( ON ?auto_82419 ?auto_82420 ) ( ON ?auto_82418 ?auto_82419 ) ( CLEAR ?auto_82418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82418 )
      ( MAKE-7PILE ?auto_82418 ?auto_82419 ?auto_82420 ?auto_82421 ?auto_82422 ?auto_82423 ?auto_82424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82433 - BLOCK
      ?auto_82434 - BLOCK
      ?auto_82435 - BLOCK
      ?auto_82436 - BLOCK
      ?auto_82437 - BLOCK
      ?auto_82438 - BLOCK
      ?auto_82439 - BLOCK
    )
    :vars
    (
      ?auto_82440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82439 ?auto_82440 ) ( not ( = ?auto_82433 ?auto_82434 ) ) ( not ( = ?auto_82433 ?auto_82435 ) ) ( not ( = ?auto_82433 ?auto_82436 ) ) ( not ( = ?auto_82433 ?auto_82437 ) ) ( not ( = ?auto_82433 ?auto_82438 ) ) ( not ( = ?auto_82433 ?auto_82439 ) ) ( not ( = ?auto_82433 ?auto_82440 ) ) ( not ( = ?auto_82434 ?auto_82435 ) ) ( not ( = ?auto_82434 ?auto_82436 ) ) ( not ( = ?auto_82434 ?auto_82437 ) ) ( not ( = ?auto_82434 ?auto_82438 ) ) ( not ( = ?auto_82434 ?auto_82439 ) ) ( not ( = ?auto_82434 ?auto_82440 ) ) ( not ( = ?auto_82435 ?auto_82436 ) ) ( not ( = ?auto_82435 ?auto_82437 ) ) ( not ( = ?auto_82435 ?auto_82438 ) ) ( not ( = ?auto_82435 ?auto_82439 ) ) ( not ( = ?auto_82435 ?auto_82440 ) ) ( not ( = ?auto_82436 ?auto_82437 ) ) ( not ( = ?auto_82436 ?auto_82438 ) ) ( not ( = ?auto_82436 ?auto_82439 ) ) ( not ( = ?auto_82436 ?auto_82440 ) ) ( not ( = ?auto_82437 ?auto_82438 ) ) ( not ( = ?auto_82437 ?auto_82439 ) ) ( not ( = ?auto_82437 ?auto_82440 ) ) ( not ( = ?auto_82438 ?auto_82439 ) ) ( not ( = ?auto_82438 ?auto_82440 ) ) ( not ( = ?auto_82439 ?auto_82440 ) ) ( ON ?auto_82438 ?auto_82439 ) ( ON ?auto_82437 ?auto_82438 ) ( ON ?auto_82436 ?auto_82437 ) ( ON ?auto_82435 ?auto_82436 ) ( ON ?auto_82434 ?auto_82435 ) ( ON ?auto_82433 ?auto_82434 ) ( CLEAR ?auto_82433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82433 )
      ( MAKE-7PILE ?auto_82433 ?auto_82434 ?auto_82435 ?auto_82436 ?auto_82437 ?auto_82438 ?auto_82439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82449 - BLOCK
      ?auto_82450 - BLOCK
      ?auto_82451 - BLOCK
      ?auto_82452 - BLOCK
      ?auto_82453 - BLOCK
      ?auto_82454 - BLOCK
      ?auto_82455 - BLOCK
      ?auto_82456 - BLOCK
    )
    :vars
    (
      ?auto_82457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82455 ) ( ON ?auto_82456 ?auto_82457 ) ( CLEAR ?auto_82456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82449 ) ( ON ?auto_82450 ?auto_82449 ) ( ON ?auto_82451 ?auto_82450 ) ( ON ?auto_82452 ?auto_82451 ) ( ON ?auto_82453 ?auto_82452 ) ( ON ?auto_82454 ?auto_82453 ) ( ON ?auto_82455 ?auto_82454 ) ( not ( = ?auto_82449 ?auto_82450 ) ) ( not ( = ?auto_82449 ?auto_82451 ) ) ( not ( = ?auto_82449 ?auto_82452 ) ) ( not ( = ?auto_82449 ?auto_82453 ) ) ( not ( = ?auto_82449 ?auto_82454 ) ) ( not ( = ?auto_82449 ?auto_82455 ) ) ( not ( = ?auto_82449 ?auto_82456 ) ) ( not ( = ?auto_82449 ?auto_82457 ) ) ( not ( = ?auto_82450 ?auto_82451 ) ) ( not ( = ?auto_82450 ?auto_82452 ) ) ( not ( = ?auto_82450 ?auto_82453 ) ) ( not ( = ?auto_82450 ?auto_82454 ) ) ( not ( = ?auto_82450 ?auto_82455 ) ) ( not ( = ?auto_82450 ?auto_82456 ) ) ( not ( = ?auto_82450 ?auto_82457 ) ) ( not ( = ?auto_82451 ?auto_82452 ) ) ( not ( = ?auto_82451 ?auto_82453 ) ) ( not ( = ?auto_82451 ?auto_82454 ) ) ( not ( = ?auto_82451 ?auto_82455 ) ) ( not ( = ?auto_82451 ?auto_82456 ) ) ( not ( = ?auto_82451 ?auto_82457 ) ) ( not ( = ?auto_82452 ?auto_82453 ) ) ( not ( = ?auto_82452 ?auto_82454 ) ) ( not ( = ?auto_82452 ?auto_82455 ) ) ( not ( = ?auto_82452 ?auto_82456 ) ) ( not ( = ?auto_82452 ?auto_82457 ) ) ( not ( = ?auto_82453 ?auto_82454 ) ) ( not ( = ?auto_82453 ?auto_82455 ) ) ( not ( = ?auto_82453 ?auto_82456 ) ) ( not ( = ?auto_82453 ?auto_82457 ) ) ( not ( = ?auto_82454 ?auto_82455 ) ) ( not ( = ?auto_82454 ?auto_82456 ) ) ( not ( = ?auto_82454 ?auto_82457 ) ) ( not ( = ?auto_82455 ?auto_82456 ) ) ( not ( = ?auto_82455 ?auto_82457 ) ) ( not ( = ?auto_82456 ?auto_82457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82456 ?auto_82457 )
      ( !STACK ?auto_82456 ?auto_82455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82466 - BLOCK
      ?auto_82467 - BLOCK
      ?auto_82468 - BLOCK
      ?auto_82469 - BLOCK
      ?auto_82470 - BLOCK
      ?auto_82471 - BLOCK
      ?auto_82472 - BLOCK
      ?auto_82473 - BLOCK
    )
    :vars
    (
      ?auto_82474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82472 ) ( ON ?auto_82473 ?auto_82474 ) ( CLEAR ?auto_82473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82466 ) ( ON ?auto_82467 ?auto_82466 ) ( ON ?auto_82468 ?auto_82467 ) ( ON ?auto_82469 ?auto_82468 ) ( ON ?auto_82470 ?auto_82469 ) ( ON ?auto_82471 ?auto_82470 ) ( ON ?auto_82472 ?auto_82471 ) ( not ( = ?auto_82466 ?auto_82467 ) ) ( not ( = ?auto_82466 ?auto_82468 ) ) ( not ( = ?auto_82466 ?auto_82469 ) ) ( not ( = ?auto_82466 ?auto_82470 ) ) ( not ( = ?auto_82466 ?auto_82471 ) ) ( not ( = ?auto_82466 ?auto_82472 ) ) ( not ( = ?auto_82466 ?auto_82473 ) ) ( not ( = ?auto_82466 ?auto_82474 ) ) ( not ( = ?auto_82467 ?auto_82468 ) ) ( not ( = ?auto_82467 ?auto_82469 ) ) ( not ( = ?auto_82467 ?auto_82470 ) ) ( not ( = ?auto_82467 ?auto_82471 ) ) ( not ( = ?auto_82467 ?auto_82472 ) ) ( not ( = ?auto_82467 ?auto_82473 ) ) ( not ( = ?auto_82467 ?auto_82474 ) ) ( not ( = ?auto_82468 ?auto_82469 ) ) ( not ( = ?auto_82468 ?auto_82470 ) ) ( not ( = ?auto_82468 ?auto_82471 ) ) ( not ( = ?auto_82468 ?auto_82472 ) ) ( not ( = ?auto_82468 ?auto_82473 ) ) ( not ( = ?auto_82468 ?auto_82474 ) ) ( not ( = ?auto_82469 ?auto_82470 ) ) ( not ( = ?auto_82469 ?auto_82471 ) ) ( not ( = ?auto_82469 ?auto_82472 ) ) ( not ( = ?auto_82469 ?auto_82473 ) ) ( not ( = ?auto_82469 ?auto_82474 ) ) ( not ( = ?auto_82470 ?auto_82471 ) ) ( not ( = ?auto_82470 ?auto_82472 ) ) ( not ( = ?auto_82470 ?auto_82473 ) ) ( not ( = ?auto_82470 ?auto_82474 ) ) ( not ( = ?auto_82471 ?auto_82472 ) ) ( not ( = ?auto_82471 ?auto_82473 ) ) ( not ( = ?auto_82471 ?auto_82474 ) ) ( not ( = ?auto_82472 ?auto_82473 ) ) ( not ( = ?auto_82472 ?auto_82474 ) ) ( not ( = ?auto_82473 ?auto_82474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82473 ?auto_82474 )
      ( !STACK ?auto_82473 ?auto_82472 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82483 - BLOCK
      ?auto_82484 - BLOCK
      ?auto_82485 - BLOCK
      ?auto_82486 - BLOCK
      ?auto_82487 - BLOCK
      ?auto_82488 - BLOCK
      ?auto_82489 - BLOCK
      ?auto_82490 - BLOCK
    )
    :vars
    (
      ?auto_82491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82490 ?auto_82491 ) ( ON-TABLE ?auto_82483 ) ( ON ?auto_82484 ?auto_82483 ) ( ON ?auto_82485 ?auto_82484 ) ( ON ?auto_82486 ?auto_82485 ) ( ON ?auto_82487 ?auto_82486 ) ( ON ?auto_82488 ?auto_82487 ) ( not ( = ?auto_82483 ?auto_82484 ) ) ( not ( = ?auto_82483 ?auto_82485 ) ) ( not ( = ?auto_82483 ?auto_82486 ) ) ( not ( = ?auto_82483 ?auto_82487 ) ) ( not ( = ?auto_82483 ?auto_82488 ) ) ( not ( = ?auto_82483 ?auto_82489 ) ) ( not ( = ?auto_82483 ?auto_82490 ) ) ( not ( = ?auto_82483 ?auto_82491 ) ) ( not ( = ?auto_82484 ?auto_82485 ) ) ( not ( = ?auto_82484 ?auto_82486 ) ) ( not ( = ?auto_82484 ?auto_82487 ) ) ( not ( = ?auto_82484 ?auto_82488 ) ) ( not ( = ?auto_82484 ?auto_82489 ) ) ( not ( = ?auto_82484 ?auto_82490 ) ) ( not ( = ?auto_82484 ?auto_82491 ) ) ( not ( = ?auto_82485 ?auto_82486 ) ) ( not ( = ?auto_82485 ?auto_82487 ) ) ( not ( = ?auto_82485 ?auto_82488 ) ) ( not ( = ?auto_82485 ?auto_82489 ) ) ( not ( = ?auto_82485 ?auto_82490 ) ) ( not ( = ?auto_82485 ?auto_82491 ) ) ( not ( = ?auto_82486 ?auto_82487 ) ) ( not ( = ?auto_82486 ?auto_82488 ) ) ( not ( = ?auto_82486 ?auto_82489 ) ) ( not ( = ?auto_82486 ?auto_82490 ) ) ( not ( = ?auto_82486 ?auto_82491 ) ) ( not ( = ?auto_82487 ?auto_82488 ) ) ( not ( = ?auto_82487 ?auto_82489 ) ) ( not ( = ?auto_82487 ?auto_82490 ) ) ( not ( = ?auto_82487 ?auto_82491 ) ) ( not ( = ?auto_82488 ?auto_82489 ) ) ( not ( = ?auto_82488 ?auto_82490 ) ) ( not ( = ?auto_82488 ?auto_82491 ) ) ( not ( = ?auto_82489 ?auto_82490 ) ) ( not ( = ?auto_82489 ?auto_82491 ) ) ( not ( = ?auto_82490 ?auto_82491 ) ) ( CLEAR ?auto_82488 ) ( ON ?auto_82489 ?auto_82490 ) ( CLEAR ?auto_82489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82483 ?auto_82484 ?auto_82485 ?auto_82486 ?auto_82487 ?auto_82488 ?auto_82489 )
      ( MAKE-8PILE ?auto_82483 ?auto_82484 ?auto_82485 ?auto_82486 ?auto_82487 ?auto_82488 ?auto_82489 ?auto_82490 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82500 - BLOCK
      ?auto_82501 - BLOCK
      ?auto_82502 - BLOCK
      ?auto_82503 - BLOCK
      ?auto_82504 - BLOCK
      ?auto_82505 - BLOCK
      ?auto_82506 - BLOCK
      ?auto_82507 - BLOCK
    )
    :vars
    (
      ?auto_82508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82507 ?auto_82508 ) ( ON-TABLE ?auto_82500 ) ( ON ?auto_82501 ?auto_82500 ) ( ON ?auto_82502 ?auto_82501 ) ( ON ?auto_82503 ?auto_82502 ) ( ON ?auto_82504 ?auto_82503 ) ( ON ?auto_82505 ?auto_82504 ) ( not ( = ?auto_82500 ?auto_82501 ) ) ( not ( = ?auto_82500 ?auto_82502 ) ) ( not ( = ?auto_82500 ?auto_82503 ) ) ( not ( = ?auto_82500 ?auto_82504 ) ) ( not ( = ?auto_82500 ?auto_82505 ) ) ( not ( = ?auto_82500 ?auto_82506 ) ) ( not ( = ?auto_82500 ?auto_82507 ) ) ( not ( = ?auto_82500 ?auto_82508 ) ) ( not ( = ?auto_82501 ?auto_82502 ) ) ( not ( = ?auto_82501 ?auto_82503 ) ) ( not ( = ?auto_82501 ?auto_82504 ) ) ( not ( = ?auto_82501 ?auto_82505 ) ) ( not ( = ?auto_82501 ?auto_82506 ) ) ( not ( = ?auto_82501 ?auto_82507 ) ) ( not ( = ?auto_82501 ?auto_82508 ) ) ( not ( = ?auto_82502 ?auto_82503 ) ) ( not ( = ?auto_82502 ?auto_82504 ) ) ( not ( = ?auto_82502 ?auto_82505 ) ) ( not ( = ?auto_82502 ?auto_82506 ) ) ( not ( = ?auto_82502 ?auto_82507 ) ) ( not ( = ?auto_82502 ?auto_82508 ) ) ( not ( = ?auto_82503 ?auto_82504 ) ) ( not ( = ?auto_82503 ?auto_82505 ) ) ( not ( = ?auto_82503 ?auto_82506 ) ) ( not ( = ?auto_82503 ?auto_82507 ) ) ( not ( = ?auto_82503 ?auto_82508 ) ) ( not ( = ?auto_82504 ?auto_82505 ) ) ( not ( = ?auto_82504 ?auto_82506 ) ) ( not ( = ?auto_82504 ?auto_82507 ) ) ( not ( = ?auto_82504 ?auto_82508 ) ) ( not ( = ?auto_82505 ?auto_82506 ) ) ( not ( = ?auto_82505 ?auto_82507 ) ) ( not ( = ?auto_82505 ?auto_82508 ) ) ( not ( = ?auto_82506 ?auto_82507 ) ) ( not ( = ?auto_82506 ?auto_82508 ) ) ( not ( = ?auto_82507 ?auto_82508 ) ) ( CLEAR ?auto_82505 ) ( ON ?auto_82506 ?auto_82507 ) ( CLEAR ?auto_82506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82500 ?auto_82501 ?auto_82502 ?auto_82503 ?auto_82504 ?auto_82505 ?auto_82506 )
      ( MAKE-8PILE ?auto_82500 ?auto_82501 ?auto_82502 ?auto_82503 ?auto_82504 ?auto_82505 ?auto_82506 ?auto_82507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82517 - BLOCK
      ?auto_82518 - BLOCK
      ?auto_82519 - BLOCK
      ?auto_82520 - BLOCK
      ?auto_82521 - BLOCK
      ?auto_82522 - BLOCK
      ?auto_82523 - BLOCK
      ?auto_82524 - BLOCK
    )
    :vars
    (
      ?auto_82525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82524 ?auto_82525 ) ( ON-TABLE ?auto_82517 ) ( ON ?auto_82518 ?auto_82517 ) ( ON ?auto_82519 ?auto_82518 ) ( ON ?auto_82520 ?auto_82519 ) ( ON ?auto_82521 ?auto_82520 ) ( not ( = ?auto_82517 ?auto_82518 ) ) ( not ( = ?auto_82517 ?auto_82519 ) ) ( not ( = ?auto_82517 ?auto_82520 ) ) ( not ( = ?auto_82517 ?auto_82521 ) ) ( not ( = ?auto_82517 ?auto_82522 ) ) ( not ( = ?auto_82517 ?auto_82523 ) ) ( not ( = ?auto_82517 ?auto_82524 ) ) ( not ( = ?auto_82517 ?auto_82525 ) ) ( not ( = ?auto_82518 ?auto_82519 ) ) ( not ( = ?auto_82518 ?auto_82520 ) ) ( not ( = ?auto_82518 ?auto_82521 ) ) ( not ( = ?auto_82518 ?auto_82522 ) ) ( not ( = ?auto_82518 ?auto_82523 ) ) ( not ( = ?auto_82518 ?auto_82524 ) ) ( not ( = ?auto_82518 ?auto_82525 ) ) ( not ( = ?auto_82519 ?auto_82520 ) ) ( not ( = ?auto_82519 ?auto_82521 ) ) ( not ( = ?auto_82519 ?auto_82522 ) ) ( not ( = ?auto_82519 ?auto_82523 ) ) ( not ( = ?auto_82519 ?auto_82524 ) ) ( not ( = ?auto_82519 ?auto_82525 ) ) ( not ( = ?auto_82520 ?auto_82521 ) ) ( not ( = ?auto_82520 ?auto_82522 ) ) ( not ( = ?auto_82520 ?auto_82523 ) ) ( not ( = ?auto_82520 ?auto_82524 ) ) ( not ( = ?auto_82520 ?auto_82525 ) ) ( not ( = ?auto_82521 ?auto_82522 ) ) ( not ( = ?auto_82521 ?auto_82523 ) ) ( not ( = ?auto_82521 ?auto_82524 ) ) ( not ( = ?auto_82521 ?auto_82525 ) ) ( not ( = ?auto_82522 ?auto_82523 ) ) ( not ( = ?auto_82522 ?auto_82524 ) ) ( not ( = ?auto_82522 ?auto_82525 ) ) ( not ( = ?auto_82523 ?auto_82524 ) ) ( not ( = ?auto_82523 ?auto_82525 ) ) ( not ( = ?auto_82524 ?auto_82525 ) ) ( ON ?auto_82523 ?auto_82524 ) ( CLEAR ?auto_82521 ) ( ON ?auto_82522 ?auto_82523 ) ( CLEAR ?auto_82522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82517 ?auto_82518 ?auto_82519 ?auto_82520 ?auto_82521 ?auto_82522 )
      ( MAKE-8PILE ?auto_82517 ?auto_82518 ?auto_82519 ?auto_82520 ?auto_82521 ?auto_82522 ?auto_82523 ?auto_82524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82534 - BLOCK
      ?auto_82535 - BLOCK
      ?auto_82536 - BLOCK
      ?auto_82537 - BLOCK
      ?auto_82538 - BLOCK
      ?auto_82539 - BLOCK
      ?auto_82540 - BLOCK
      ?auto_82541 - BLOCK
    )
    :vars
    (
      ?auto_82542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82541 ?auto_82542 ) ( ON-TABLE ?auto_82534 ) ( ON ?auto_82535 ?auto_82534 ) ( ON ?auto_82536 ?auto_82535 ) ( ON ?auto_82537 ?auto_82536 ) ( ON ?auto_82538 ?auto_82537 ) ( not ( = ?auto_82534 ?auto_82535 ) ) ( not ( = ?auto_82534 ?auto_82536 ) ) ( not ( = ?auto_82534 ?auto_82537 ) ) ( not ( = ?auto_82534 ?auto_82538 ) ) ( not ( = ?auto_82534 ?auto_82539 ) ) ( not ( = ?auto_82534 ?auto_82540 ) ) ( not ( = ?auto_82534 ?auto_82541 ) ) ( not ( = ?auto_82534 ?auto_82542 ) ) ( not ( = ?auto_82535 ?auto_82536 ) ) ( not ( = ?auto_82535 ?auto_82537 ) ) ( not ( = ?auto_82535 ?auto_82538 ) ) ( not ( = ?auto_82535 ?auto_82539 ) ) ( not ( = ?auto_82535 ?auto_82540 ) ) ( not ( = ?auto_82535 ?auto_82541 ) ) ( not ( = ?auto_82535 ?auto_82542 ) ) ( not ( = ?auto_82536 ?auto_82537 ) ) ( not ( = ?auto_82536 ?auto_82538 ) ) ( not ( = ?auto_82536 ?auto_82539 ) ) ( not ( = ?auto_82536 ?auto_82540 ) ) ( not ( = ?auto_82536 ?auto_82541 ) ) ( not ( = ?auto_82536 ?auto_82542 ) ) ( not ( = ?auto_82537 ?auto_82538 ) ) ( not ( = ?auto_82537 ?auto_82539 ) ) ( not ( = ?auto_82537 ?auto_82540 ) ) ( not ( = ?auto_82537 ?auto_82541 ) ) ( not ( = ?auto_82537 ?auto_82542 ) ) ( not ( = ?auto_82538 ?auto_82539 ) ) ( not ( = ?auto_82538 ?auto_82540 ) ) ( not ( = ?auto_82538 ?auto_82541 ) ) ( not ( = ?auto_82538 ?auto_82542 ) ) ( not ( = ?auto_82539 ?auto_82540 ) ) ( not ( = ?auto_82539 ?auto_82541 ) ) ( not ( = ?auto_82539 ?auto_82542 ) ) ( not ( = ?auto_82540 ?auto_82541 ) ) ( not ( = ?auto_82540 ?auto_82542 ) ) ( not ( = ?auto_82541 ?auto_82542 ) ) ( ON ?auto_82540 ?auto_82541 ) ( CLEAR ?auto_82538 ) ( ON ?auto_82539 ?auto_82540 ) ( CLEAR ?auto_82539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82534 ?auto_82535 ?auto_82536 ?auto_82537 ?auto_82538 ?auto_82539 )
      ( MAKE-8PILE ?auto_82534 ?auto_82535 ?auto_82536 ?auto_82537 ?auto_82538 ?auto_82539 ?auto_82540 ?auto_82541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82551 - BLOCK
      ?auto_82552 - BLOCK
      ?auto_82553 - BLOCK
      ?auto_82554 - BLOCK
      ?auto_82555 - BLOCK
      ?auto_82556 - BLOCK
      ?auto_82557 - BLOCK
      ?auto_82558 - BLOCK
    )
    :vars
    (
      ?auto_82559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82558 ?auto_82559 ) ( ON-TABLE ?auto_82551 ) ( ON ?auto_82552 ?auto_82551 ) ( ON ?auto_82553 ?auto_82552 ) ( ON ?auto_82554 ?auto_82553 ) ( not ( = ?auto_82551 ?auto_82552 ) ) ( not ( = ?auto_82551 ?auto_82553 ) ) ( not ( = ?auto_82551 ?auto_82554 ) ) ( not ( = ?auto_82551 ?auto_82555 ) ) ( not ( = ?auto_82551 ?auto_82556 ) ) ( not ( = ?auto_82551 ?auto_82557 ) ) ( not ( = ?auto_82551 ?auto_82558 ) ) ( not ( = ?auto_82551 ?auto_82559 ) ) ( not ( = ?auto_82552 ?auto_82553 ) ) ( not ( = ?auto_82552 ?auto_82554 ) ) ( not ( = ?auto_82552 ?auto_82555 ) ) ( not ( = ?auto_82552 ?auto_82556 ) ) ( not ( = ?auto_82552 ?auto_82557 ) ) ( not ( = ?auto_82552 ?auto_82558 ) ) ( not ( = ?auto_82552 ?auto_82559 ) ) ( not ( = ?auto_82553 ?auto_82554 ) ) ( not ( = ?auto_82553 ?auto_82555 ) ) ( not ( = ?auto_82553 ?auto_82556 ) ) ( not ( = ?auto_82553 ?auto_82557 ) ) ( not ( = ?auto_82553 ?auto_82558 ) ) ( not ( = ?auto_82553 ?auto_82559 ) ) ( not ( = ?auto_82554 ?auto_82555 ) ) ( not ( = ?auto_82554 ?auto_82556 ) ) ( not ( = ?auto_82554 ?auto_82557 ) ) ( not ( = ?auto_82554 ?auto_82558 ) ) ( not ( = ?auto_82554 ?auto_82559 ) ) ( not ( = ?auto_82555 ?auto_82556 ) ) ( not ( = ?auto_82555 ?auto_82557 ) ) ( not ( = ?auto_82555 ?auto_82558 ) ) ( not ( = ?auto_82555 ?auto_82559 ) ) ( not ( = ?auto_82556 ?auto_82557 ) ) ( not ( = ?auto_82556 ?auto_82558 ) ) ( not ( = ?auto_82556 ?auto_82559 ) ) ( not ( = ?auto_82557 ?auto_82558 ) ) ( not ( = ?auto_82557 ?auto_82559 ) ) ( not ( = ?auto_82558 ?auto_82559 ) ) ( ON ?auto_82557 ?auto_82558 ) ( ON ?auto_82556 ?auto_82557 ) ( CLEAR ?auto_82554 ) ( ON ?auto_82555 ?auto_82556 ) ( CLEAR ?auto_82555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82551 ?auto_82552 ?auto_82553 ?auto_82554 ?auto_82555 )
      ( MAKE-8PILE ?auto_82551 ?auto_82552 ?auto_82553 ?auto_82554 ?auto_82555 ?auto_82556 ?auto_82557 ?auto_82558 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82568 - BLOCK
      ?auto_82569 - BLOCK
      ?auto_82570 - BLOCK
      ?auto_82571 - BLOCK
      ?auto_82572 - BLOCK
      ?auto_82573 - BLOCK
      ?auto_82574 - BLOCK
      ?auto_82575 - BLOCK
    )
    :vars
    (
      ?auto_82576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82575 ?auto_82576 ) ( ON-TABLE ?auto_82568 ) ( ON ?auto_82569 ?auto_82568 ) ( ON ?auto_82570 ?auto_82569 ) ( ON ?auto_82571 ?auto_82570 ) ( not ( = ?auto_82568 ?auto_82569 ) ) ( not ( = ?auto_82568 ?auto_82570 ) ) ( not ( = ?auto_82568 ?auto_82571 ) ) ( not ( = ?auto_82568 ?auto_82572 ) ) ( not ( = ?auto_82568 ?auto_82573 ) ) ( not ( = ?auto_82568 ?auto_82574 ) ) ( not ( = ?auto_82568 ?auto_82575 ) ) ( not ( = ?auto_82568 ?auto_82576 ) ) ( not ( = ?auto_82569 ?auto_82570 ) ) ( not ( = ?auto_82569 ?auto_82571 ) ) ( not ( = ?auto_82569 ?auto_82572 ) ) ( not ( = ?auto_82569 ?auto_82573 ) ) ( not ( = ?auto_82569 ?auto_82574 ) ) ( not ( = ?auto_82569 ?auto_82575 ) ) ( not ( = ?auto_82569 ?auto_82576 ) ) ( not ( = ?auto_82570 ?auto_82571 ) ) ( not ( = ?auto_82570 ?auto_82572 ) ) ( not ( = ?auto_82570 ?auto_82573 ) ) ( not ( = ?auto_82570 ?auto_82574 ) ) ( not ( = ?auto_82570 ?auto_82575 ) ) ( not ( = ?auto_82570 ?auto_82576 ) ) ( not ( = ?auto_82571 ?auto_82572 ) ) ( not ( = ?auto_82571 ?auto_82573 ) ) ( not ( = ?auto_82571 ?auto_82574 ) ) ( not ( = ?auto_82571 ?auto_82575 ) ) ( not ( = ?auto_82571 ?auto_82576 ) ) ( not ( = ?auto_82572 ?auto_82573 ) ) ( not ( = ?auto_82572 ?auto_82574 ) ) ( not ( = ?auto_82572 ?auto_82575 ) ) ( not ( = ?auto_82572 ?auto_82576 ) ) ( not ( = ?auto_82573 ?auto_82574 ) ) ( not ( = ?auto_82573 ?auto_82575 ) ) ( not ( = ?auto_82573 ?auto_82576 ) ) ( not ( = ?auto_82574 ?auto_82575 ) ) ( not ( = ?auto_82574 ?auto_82576 ) ) ( not ( = ?auto_82575 ?auto_82576 ) ) ( ON ?auto_82574 ?auto_82575 ) ( ON ?auto_82573 ?auto_82574 ) ( CLEAR ?auto_82571 ) ( ON ?auto_82572 ?auto_82573 ) ( CLEAR ?auto_82572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82568 ?auto_82569 ?auto_82570 ?auto_82571 ?auto_82572 )
      ( MAKE-8PILE ?auto_82568 ?auto_82569 ?auto_82570 ?auto_82571 ?auto_82572 ?auto_82573 ?auto_82574 ?auto_82575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82585 - BLOCK
      ?auto_82586 - BLOCK
      ?auto_82587 - BLOCK
      ?auto_82588 - BLOCK
      ?auto_82589 - BLOCK
      ?auto_82590 - BLOCK
      ?auto_82591 - BLOCK
      ?auto_82592 - BLOCK
    )
    :vars
    (
      ?auto_82593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82592 ?auto_82593 ) ( ON-TABLE ?auto_82585 ) ( ON ?auto_82586 ?auto_82585 ) ( ON ?auto_82587 ?auto_82586 ) ( not ( = ?auto_82585 ?auto_82586 ) ) ( not ( = ?auto_82585 ?auto_82587 ) ) ( not ( = ?auto_82585 ?auto_82588 ) ) ( not ( = ?auto_82585 ?auto_82589 ) ) ( not ( = ?auto_82585 ?auto_82590 ) ) ( not ( = ?auto_82585 ?auto_82591 ) ) ( not ( = ?auto_82585 ?auto_82592 ) ) ( not ( = ?auto_82585 ?auto_82593 ) ) ( not ( = ?auto_82586 ?auto_82587 ) ) ( not ( = ?auto_82586 ?auto_82588 ) ) ( not ( = ?auto_82586 ?auto_82589 ) ) ( not ( = ?auto_82586 ?auto_82590 ) ) ( not ( = ?auto_82586 ?auto_82591 ) ) ( not ( = ?auto_82586 ?auto_82592 ) ) ( not ( = ?auto_82586 ?auto_82593 ) ) ( not ( = ?auto_82587 ?auto_82588 ) ) ( not ( = ?auto_82587 ?auto_82589 ) ) ( not ( = ?auto_82587 ?auto_82590 ) ) ( not ( = ?auto_82587 ?auto_82591 ) ) ( not ( = ?auto_82587 ?auto_82592 ) ) ( not ( = ?auto_82587 ?auto_82593 ) ) ( not ( = ?auto_82588 ?auto_82589 ) ) ( not ( = ?auto_82588 ?auto_82590 ) ) ( not ( = ?auto_82588 ?auto_82591 ) ) ( not ( = ?auto_82588 ?auto_82592 ) ) ( not ( = ?auto_82588 ?auto_82593 ) ) ( not ( = ?auto_82589 ?auto_82590 ) ) ( not ( = ?auto_82589 ?auto_82591 ) ) ( not ( = ?auto_82589 ?auto_82592 ) ) ( not ( = ?auto_82589 ?auto_82593 ) ) ( not ( = ?auto_82590 ?auto_82591 ) ) ( not ( = ?auto_82590 ?auto_82592 ) ) ( not ( = ?auto_82590 ?auto_82593 ) ) ( not ( = ?auto_82591 ?auto_82592 ) ) ( not ( = ?auto_82591 ?auto_82593 ) ) ( not ( = ?auto_82592 ?auto_82593 ) ) ( ON ?auto_82591 ?auto_82592 ) ( ON ?auto_82590 ?auto_82591 ) ( ON ?auto_82589 ?auto_82590 ) ( CLEAR ?auto_82587 ) ( ON ?auto_82588 ?auto_82589 ) ( CLEAR ?auto_82588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82585 ?auto_82586 ?auto_82587 ?auto_82588 )
      ( MAKE-8PILE ?auto_82585 ?auto_82586 ?auto_82587 ?auto_82588 ?auto_82589 ?auto_82590 ?auto_82591 ?auto_82592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82602 - BLOCK
      ?auto_82603 - BLOCK
      ?auto_82604 - BLOCK
      ?auto_82605 - BLOCK
      ?auto_82606 - BLOCK
      ?auto_82607 - BLOCK
      ?auto_82608 - BLOCK
      ?auto_82609 - BLOCK
    )
    :vars
    (
      ?auto_82610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82609 ?auto_82610 ) ( ON-TABLE ?auto_82602 ) ( ON ?auto_82603 ?auto_82602 ) ( ON ?auto_82604 ?auto_82603 ) ( not ( = ?auto_82602 ?auto_82603 ) ) ( not ( = ?auto_82602 ?auto_82604 ) ) ( not ( = ?auto_82602 ?auto_82605 ) ) ( not ( = ?auto_82602 ?auto_82606 ) ) ( not ( = ?auto_82602 ?auto_82607 ) ) ( not ( = ?auto_82602 ?auto_82608 ) ) ( not ( = ?auto_82602 ?auto_82609 ) ) ( not ( = ?auto_82602 ?auto_82610 ) ) ( not ( = ?auto_82603 ?auto_82604 ) ) ( not ( = ?auto_82603 ?auto_82605 ) ) ( not ( = ?auto_82603 ?auto_82606 ) ) ( not ( = ?auto_82603 ?auto_82607 ) ) ( not ( = ?auto_82603 ?auto_82608 ) ) ( not ( = ?auto_82603 ?auto_82609 ) ) ( not ( = ?auto_82603 ?auto_82610 ) ) ( not ( = ?auto_82604 ?auto_82605 ) ) ( not ( = ?auto_82604 ?auto_82606 ) ) ( not ( = ?auto_82604 ?auto_82607 ) ) ( not ( = ?auto_82604 ?auto_82608 ) ) ( not ( = ?auto_82604 ?auto_82609 ) ) ( not ( = ?auto_82604 ?auto_82610 ) ) ( not ( = ?auto_82605 ?auto_82606 ) ) ( not ( = ?auto_82605 ?auto_82607 ) ) ( not ( = ?auto_82605 ?auto_82608 ) ) ( not ( = ?auto_82605 ?auto_82609 ) ) ( not ( = ?auto_82605 ?auto_82610 ) ) ( not ( = ?auto_82606 ?auto_82607 ) ) ( not ( = ?auto_82606 ?auto_82608 ) ) ( not ( = ?auto_82606 ?auto_82609 ) ) ( not ( = ?auto_82606 ?auto_82610 ) ) ( not ( = ?auto_82607 ?auto_82608 ) ) ( not ( = ?auto_82607 ?auto_82609 ) ) ( not ( = ?auto_82607 ?auto_82610 ) ) ( not ( = ?auto_82608 ?auto_82609 ) ) ( not ( = ?auto_82608 ?auto_82610 ) ) ( not ( = ?auto_82609 ?auto_82610 ) ) ( ON ?auto_82608 ?auto_82609 ) ( ON ?auto_82607 ?auto_82608 ) ( ON ?auto_82606 ?auto_82607 ) ( CLEAR ?auto_82604 ) ( ON ?auto_82605 ?auto_82606 ) ( CLEAR ?auto_82605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82602 ?auto_82603 ?auto_82604 ?auto_82605 )
      ( MAKE-8PILE ?auto_82602 ?auto_82603 ?auto_82604 ?auto_82605 ?auto_82606 ?auto_82607 ?auto_82608 ?auto_82609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82619 - BLOCK
      ?auto_82620 - BLOCK
      ?auto_82621 - BLOCK
      ?auto_82622 - BLOCK
      ?auto_82623 - BLOCK
      ?auto_82624 - BLOCK
      ?auto_82625 - BLOCK
      ?auto_82626 - BLOCK
    )
    :vars
    (
      ?auto_82627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82626 ?auto_82627 ) ( ON-TABLE ?auto_82619 ) ( ON ?auto_82620 ?auto_82619 ) ( not ( = ?auto_82619 ?auto_82620 ) ) ( not ( = ?auto_82619 ?auto_82621 ) ) ( not ( = ?auto_82619 ?auto_82622 ) ) ( not ( = ?auto_82619 ?auto_82623 ) ) ( not ( = ?auto_82619 ?auto_82624 ) ) ( not ( = ?auto_82619 ?auto_82625 ) ) ( not ( = ?auto_82619 ?auto_82626 ) ) ( not ( = ?auto_82619 ?auto_82627 ) ) ( not ( = ?auto_82620 ?auto_82621 ) ) ( not ( = ?auto_82620 ?auto_82622 ) ) ( not ( = ?auto_82620 ?auto_82623 ) ) ( not ( = ?auto_82620 ?auto_82624 ) ) ( not ( = ?auto_82620 ?auto_82625 ) ) ( not ( = ?auto_82620 ?auto_82626 ) ) ( not ( = ?auto_82620 ?auto_82627 ) ) ( not ( = ?auto_82621 ?auto_82622 ) ) ( not ( = ?auto_82621 ?auto_82623 ) ) ( not ( = ?auto_82621 ?auto_82624 ) ) ( not ( = ?auto_82621 ?auto_82625 ) ) ( not ( = ?auto_82621 ?auto_82626 ) ) ( not ( = ?auto_82621 ?auto_82627 ) ) ( not ( = ?auto_82622 ?auto_82623 ) ) ( not ( = ?auto_82622 ?auto_82624 ) ) ( not ( = ?auto_82622 ?auto_82625 ) ) ( not ( = ?auto_82622 ?auto_82626 ) ) ( not ( = ?auto_82622 ?auto_82627 ) ) ( not ( = ?auto_82623 ?auto_82624 ) ) ( not ( = ?auto_82623 ?auto_82625 ) ) ( not ( = ?auto_82623 ?auto_82626 ) ) ( not ( = ?auto_82623 ?auto_82627 ) ) ( not ( = ?auto_82624 ?auto_82625 ) ) ( not ( = ?auto_82624 ?auto_82626 ) ) ( not ( = ?auto_82624 ?auto_82627 ) ) ( not ( = ?auto_82625 ?auto_82626 ) ) ( not ( = ?auto_82625 ?auto_82627 ) ) ( not ( = ?auto_82626 ?auto_82627 ) ) ( ON ?auto_82625 ?auto_82626 ) ( ON ?auto_82624 ?auto_82625 ) ( ON ?auto_82623 ?auto_82624 ) ( ON ?auto_82622 ?auto_82623 ) ( CLEAR ?auto_82620 ) ( ON ?auto_82621 ?auto_82622 ) ( CLEAR ?auto_82621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82619 ?auto_82620 ?auto_82621 )
      ( MAKE-8PILE ?auto_82619 ?auto_82620 ?auto_82621 ?auto_82622 ?auto_82623 ?auto_82624 ?auto_82625 ?auto_82626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82636 - BLOCK
      ?auto_82637 - BLOCK
      ?auto_82638 - BLOCK
      ?auto_82639 - BLOCK
      ?auto_82640 - BLOCK
      ?auto_82641 - BLOCK
      ?auto_82642 - BLOCK
      ?auto_82643 - BLOCK
    )
    :vars
    (
      ?auto_82644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82643 ?auto_82644 ) ( ON-TABLE ?auto_82636 ) ( ON ?auto_82637 ?auto_82636 ) ( not ( = ?auto_82636 ?auto_82637 ) ) ( not ( = ?auto_82636 ?auto_82638 ) ) ( not ( = ?auto_82636 ?auto_82639 ) ) ( not ( = ?auto_82636 ?auto_82640 ) ) ( not ( = ?auto_82636 ?auto_82641 ) ) ( not ( = ?auto_82636 ?auto_82642 ) ) ( not ( = ?auto_82636 ?auto_82643 ) ) ( not ( = ?auto_82636 ?auto_82644 ) ) ( not ( = ?auto_82637 ?auto_82638 ) ) ( not ( = ?auto_82637 ?auto_82639 ) ) ( not ( = ?auto_82637 ?auto_82640 ) ) ( not ( = ?auto_82637 ?auto_82641 ) ) ( not ( = ?auto_82637 ?auto_82642 ) ) ( not ( = ?auto_82637 ?auto_82643 ) ) ( not ( = ?auto_82637 ?auto_82644 ) ) ( not ( = ?auto_82638 ?auto_82639 ) ) ( not ( = ?auto_82638 ?auto_82640 ) ) ( not ( = ?auto_82638 ?auto_82641 ) ) ( not ( = ?auto_82638 ?auto_82642 ) ) ( not ( = ?auto_82638 ?auto_82643 ) ) ( not ( = ?auto_82638 ?auto_82644 ) ) ( not ( = ?auto_82639 ?auto_82640 ) ) ( not ( = ?auto_82639 ?auto_82641 ) ) ( not ( = ?auto_82639 ?auto_82642 ) ) ( not ( = ?auto_82639 ?auto_82643 ) ) ( not ( = ?auto_82639 ?auto_82644 ) ) ( not ( = ?auto_82640 ?auto_82641 ) ) ( not ( = ?auto_82640 ?auto_82642 ) ) ( not ( = ?auto_82640 ?auto_82643 ) ) ( not ( = ?auto_82640 ?auto_82644 ) ) ( not ( = ?auto_82641 ?auto_82642 ) ) ( not ( = ?auto_82641 ?auto_82643 ) ) ( not ( = ?auto_82641 ?auto_82644 ) ) ( not ( = ?auto_82642 ?auto_82643 ) ) ( not ( = ?auto_82642 ?auto_82644 ) ) ( not ( = ?auto_82643 ?auto_82644 ) ) ( ON ?auto_82642 ?auto_82643 ) ( ON ?auto_82641 ?auto_82642 ) ( ON ?auto_82640 ?auto_82641 ) ( ON ?auto_82639 ?auto_82640 ) ( CLEAR ?auto_82637 ) ( ON ?auto_82638 ?auto_82639 ) ( CLEAR ?auto_82638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82636 ?auto_82637 ?auto_82638 )
      ( MAKE-8PILE ?auto_82636 ?auto_82637 ?auto_82638 ?auto_82639 ?auto_82640 ?auto_82641 ?auto_82642 ?auto_82643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82653 - BLOCK
      ?auto_82654 - BLOCK
      ?auto_82655 - BLOCK
      ?auto_82656 - BLOCK
      ?auto_82657 - BLOCK
      ?auto_82658 - BLOCK
      ?auto_82659 - BLOCK
      ?auto_82660 - BLOCK
    )
    :vars
    (
      ?auto_82661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82660 ?auto_82661 ) ( ON-TABLE ?auto_82653 ) ( not ( = ?auto_82653 ?auto_82654 ) ) ( not ( = ?auto_82653 ?auto_82655 ) ) ( not ( = ?auto_82653 ?auto_82656 ) ) ( not ( = ?auto_82653 ?auto_82657 ) ) ( not ( = ?auto_82653 ?auto_82658 ) ) ( not ( = ?auto_82653 ?auto_82659 ) ) ( not ( = ?auto_82653 ?auto_82660 ) ) ( not ( = ?auto_82653 ?auto_82661 ) ) ( not ( = ?auto_82654 ?auto_82655 ) ) ( not ( = ?auto_82654 ?auto_82656 ) ) ( not ( = ?auto_82654 ?auto_82657 ) ) ( not ( = ?auto_82654 ?auto_82658 ) ) ( not ( = ?auto_82654 ?auto_82659 ) ) ( not ( = ?auto_82654 ?auto_82660 ) ) ( not ( = ?auto_82654 ?auto_82661 ) ) ( not ( = ?auto_82655 ?auto_82656 ) ) ( not ( = ?auto_82655 ?auto_82657 ) ) ( not ( = ?auto_82655 ?auto_82658 ) ) ( not ( = ?auto_82655 ?auto_82659 ) ) ( not ( = ?auto_82655 ?auto_82660 ) ) ( not ( = ?auto_82655 ?auto_82661 ) ) ( not ( = ?auto_82656 ?auto_82657 ) ) ( not ( = ?auto_82656 ?auto_82658 ) ) ( not ( = ?auto_82656 ?auto_82659 ) ) ( not ( = ?auto_82656 ?auto_82660 ) ) ( not ( = ?auto_82656 ?auto_82661 ) ) ( not ( = ?auto_82657 ?auto_82658 ) ) ( not ( = ?auto_82657 ?auto_82659 ) ) ( not ( = ?auto_82657 ?auto_82660 ) ) ( not ( = ?auto_82657 ?auto_82661 ) ) ( not ( = ?auto_82658 ?auto_82659 ) ) ( not ( = ?auto_82658 ?auto_82660 ) ) ( not ( = ?auto_82658 ?auto_82661 ) ) ( not ( = ?auto_82659 ?auto_82660 ) ) ( not ( = ?auto_82659 ?auto_82661 ) ) ( not ( = ?auto_82660 ?auto_82661 ) ) ( ON ?auto_82659 ?auto_82660 ) ( ON ?auto_82658 ?auto_82659 ) ( ON ?auto_82657 ?auto_82658 ) ( ON ?auto_82656 ?auto_82657 ) ( ON ?auto_82655 ?auto_82656 ) ( CLEAR ?auto_82653 ) ( ON ?auto_82654 ?auto_82655 ) ( CLEAR ?auto_82654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82653 ?auto_82654 )
      ( MAKE-8PILE ?auto_82653 ?auto_82654 ?auto_82655 ?auto_82656 ?auto_82657 ?auto_82658 ?auto_82659 ?auto_82660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82670 - BLOCK
      ?auto_82671 - BLOCK
      ?auto_82672 - BLOCK
      ?auto_82673 - BLOCK
      ?auto_82674 - BLOCK
      ?auto_82675 - BLOCK
      ?auto_82676 - BLOCK
      ?auto_82677 - BLOCK
    )
    :vars
    (
      ?auto_82678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82677 ?auto_82678 ) ( ON-TABLE ?auto_82670 ) ( not ( = ?auto_82670 ?auto_82671 ) ) ( not ( = ?auto_82670 ?auto_82672 ) ) ( not ( = ?auto_82670 ?auto_82673 ) ) ( not ( = ?auto_82670 ?auto_82674 ) ) ( not ( = ?auto_82670 ?auto_82675 ) ) ( not ( = ?auto_82670 ?auto_82676 ) ) ( not ( = ?auto_82670 ?auto_82677 ) ) ( not ( = ?auto_82670 ?auto_82678 ) ) ( not ( = ?auto_82671 ?auto_82672 ) ) ( not ( = ?auto_82671 ?auto_82673 ) ) ( not ( = ?auto_82671 ?auto_82674 ) ) ( not ( = ?auto_82671 ?auto_82675 ) ) ( not ( = ?auto_82671 ?auto_82676 ) ) ( not ( = ?auto_82671 ?auto_82677 ) ) ( not ( = ?auto_82671 ?auto_82678 ) ) ( not ( = ?auto_82672 ?auto_82673 ) ) ( not ( = ?auto_82672 ?auto_82674 ) ) ( not ( = ?auto_82672 ?auto_82675 ) ) ( not ( = ?auto_82672 ?auto_82676 ) ) ( not ( = ?auto_82672 ?auto_82677 ) ) ( not ( = ?auto_82672 ?auto_82678 ) ) ( not ( = ?auto_82673 ?auto_82674 ) ) ( not ( = ?auto_82673 ?auto_82675 ) ) ( not ( = ?auto_82673 ?auto_82676 ) ) ( not ( = ?auto_82673 ?auto_82677 ) ) ( not ( = ?auto_82673 ?auto_82678 ) ) ( not ( = ?auto_82674 ?auto_82675 ) ) ( not ( = ?auto_82674 ?auto_82676 ) ) ( not ( = ?auto_82674 ?auto_82677 ) ) ( not ( = ?auto_82674 ?auto_82678 ) ) ( not ( = ?auto_82675 ?auto_82676 ) ) ( not ( = ?auto_82675 ?auto_82677 ) ) ( not ( = ?auto_82675 ?auto_82678 ) ) ( not ( = ?auto_82676 ?auto_82677 ) ) ( not ( = ?auto_82676 ?auto_82678 ) ) ( not ( = ?auto_82677 ?auto_82678 ) ) ( ON ?auto_82676 ?auto_82677 ) ( ON ?auto_82675 ?auto_82676 ) ( ON ?auto_82674 ?auto_82675 ) ( ON ?auto_82673 ?auto_82674 ) ( ON ?auto_82672 ?auto_82673 ) ( CLEAR ?auto_82670 ) ( ON ?auto_82671 ?auto_82672 ) ( CLEAR ?auto_82671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82670 ?auto_82671 )
      ( MAKE-8PILE ?auto_82670 ?auto_82671 ?auto_82672 ?auto_82673 ?auto_82674 ?auto_82675 ?auto_82676 ?auto_82677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82687 - BLOCK
      ?auto_82688 - BLOCK
      ?auto_82689 - BLOCK
      ?auto_82690 - BLOCK
      ?auto_82691 - BLOCK
      ?auto_82692 - BLOCK
      ?auto_82693 - BLOCK
      ?auto_82694 - BLOCK
    )
    :vars
    (
      ?auto_82695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82694 ?auto_82695 ) ( not ( = ?auto_82687 ?auto_82688 ) ) ( not ( = ?auto_82687 ?auto_82689 ) ) ( not ( = ?auto_82687 ?auto_82690 ) ) ( not ( = ?auto_82687 ?auto_82691 ) ) ( not ( = ?auto_82687 ?auto_82692 ) ) ( not ( = ?auto_82687 ?auto_82693 ) ) ( not ( = ?auto_82687 ?auto_82694 ) ) ( not ( = ?auto_82687 ?auto_82695 ) ) ( not ( = ?auto_82688 ?auto_82689 ) ) ( not ( = ?auto_82688 ?auto_82690 ) ) ( not ( = ?auto_82688 ?auto_82691 ) ) ( not ( = ?auto_82688 ?auto_82692 ) ) ( not ( = ?auto_82688 ?auto_82693 ) ) ( not ( = ?auto_82688 ?auto_82694 ) ) ( not ( = ?auto_82688 ?auto_82695 ) ) ( not ( = ?auto_82689 ?auto_82690 ) ) ( not ( = ?auto_82689 ?auto_82691 ) ) ( not ( = ?auto_82689 ?auto_82692 ) ) ( not ( = ?auto_82689 ?auto_82693 ) ) ( not ( = ?auto_82689 ?auto_82694 ) ) ( not ( = ?auto_82689 ?auto_82695 ) ) ( not ( = ?auto_82690 ?auto_82691 ) ) ( not ( = ?auto_82690 ?auto_82692 ) ) ( not ( = ?auto_82690 ?auto_82693 ) ) ( not ( = ?auto_82690 ?auto_82694 ) ) ( not ( = ?auto_82690 ?auto_82695 ) ) ( not ( = ?auto_82691 ?auto_82692 ) ) ( not ( = ?auto_82691 ?auto_82693 ) ) ( not ( = ?auto_82691 ?auto_82694 ) ) ( not ( = ?auto_82691 ?auto_82695 ) ) ( not ( = ?auto_82692 ?auto_82693 ) ) ( not ( = ?auto_82692 ?auto_82694 ) ) ( not ( = ?auto_82692 ?auto_82695 ) ) ( not ( = ?auto_82693 ?auto_82694 ) ) ( not ( = ?auto_82693 ?auto_82695 ) ) ( not ( = ?auto_82694 ?auto_82695 ) ) ( ON ?auto_82693 ?auto_82694 ) ( ON ?auto_82692 ?auto_82693 ) ( ON ?auto_82691 ?auto_82692 ) ( ON ?auto_82690 ?auto_82691 ) ( ON ?auto_82689 ?auto_82690 ) ( ON ?auto_82688 ?auto_82689 ) ( ON ?auto_82687 ?auto_82688 ) ( CLEAR ?auto_82687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82687 )
      ( MAKE-8PILE ?auto_82687 ?auto_82688 ?auto_82689 ?auto_82690 ?auto_82691 ?auto_82692 ?auto_82693 ?auto_82694 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_82704 - BLOCK
      ?auto_82705 - BLOCK
      ?auto_82706 - BLOCK
      ?auto_82707 - BLOCK
      ?auto_82708 - BLOCK
      ?auto_82709 - BLOCK
      ?auto_82710 - BLOCK
      ?auto_82711 - BLOCK
    )
    :vars
    (
      ?auto_82712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82711 ?auto_82712 ) ( not ( = ?auto_82704 ?auto_82705 ) ) ( not ( = ?auto_82704 ?auto_82706 ) ) ( not ( = ?auto_82704 ?auto_82707 ) ) ( not ( = ?auto_82704 ?auto_82708 ) ) ( not ( = ?auto_82704 ?auto_82709 ) ) ( not ( = ?auto_82704 ?auto_82710 ) ) ( not ( = ?auto_82704 ?auto_82711 ) ) ( not ( = ?auto_82704 ?auto_82712 ) ) ( not ( = ?auto_82705 ?auto_82706 ) ) ( not ( = ?auto_82705 ?auto_82707 ) ) ( not ( = ?auto_82705 ?auto_82708 ) ) ( not ( = ?auto_82705 ?auto_82709 ) ) ( not ( = ?auto_82705 ?auto_82710 ) ) ( not ( = ?auto_82705 ?auto_82711 ) ) ( not ( = ?auto_82705 ?auto_82712 ) ) ( not ( = ?auto_82706 ?auto_82707 ) ) ( not ( = ?auto_82706 ?auto_82708 ) ) ( not ( = ?auto_82706 ?auto_82709 ) ) ( not ( = ?auto_82706 ?auto_82710 ) ) ( not ( = ?auto_82706 ?auto_82711 ) ) ( not ( = ?auto_82706 ?auto_82712 ) ) ( not ( = ?auto_82707 ?auto_82708 ) ) ( not ( = ?auto_82707 ?auto_82709 ) ) ( not ( = ?auto_82707 ?auto_82710 ) ) ( not ( = ?auto_82707 ?auto_82711 ) ) ( not ( = ?auto_82707 ?auto_82712 ) ) ( not ( = ?auto_82708 ?auto_82709 ) ) ( not ( = ?auto_82708 ?auto_82710 ) ) ( not ( = ?auto_82708 ?auto_82711 ) ) ( not ( = ?auto_82708 ?auto_82712 ) ) ( not ( = ?auto_82709 ?auto_82710 ) ) ( not ( = ?auto_82709 ?auto_82711 ) ) ( not ( = ?auto_82709 ?auto_82712 ) ) ( not ( = ?auto_82710 ?auto_82711 ) ) ( not ( = ?auto_82710 ?auto_82712 ) ) ( not ( = ?auto_82711 ?auto_82712 ) ) ( ON ?auto_82710 ?auto_82711 ) ( ON ?auto_82709 ?auto_82710 ) ( ON ?auto_82708 ?auto_82709 ) ( ON ?auto_82707 ?auto_82708 ) ( ON ?auto_82706 ?auto_82707 ) ( ON ?auto_82705 ?auto_82706 ) ( ON ?auto_82704 ?auto_82705 ) ( CLEAR ?auto_82704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82704 )
      ( MAKE-8PILE ?auto_82704 ?auto_82705 ?auto_82706 ?auto_82707 ?auto_82708 ?auto_82709 ?auto_82710 ?auto_82711 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82722 - BLOCK
      ?auto_82723 - BLOCK
      ?auto_82724 - BLOCK
      ?auto_82725 - BLOCK
      ?auto_82726 - BLOCK
      ?auto_82727 - BLOCK
      ?auto_82728 - BLOCK
      ?auto_82729 - BLOCK
      ?auto_82730 - BLOCK
    )
    :vars
    (
      ?auto_82731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82729 ) ( ON ?auto_82730 ?auto_82731 ) ( CLEAR ?auto_82730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82722 ) ( ON ?auto_82723 ?auto_82722 ) ( ON ?auto_82724 ?auto_82723 ) ( ON ?auto_82725 ?auto_82724 ) ( ON ?auto_82726 ?auto_82725 ) ( ON ?auto_82727 ?auto_82726 ) ( ON ?auto_82728 ?auto_82727 ) ( ON ?auto_82729 ?auto_82728 ) ( not ( = ?auto_82722 ?auto_82723 ) ) ( not ( = ?auto_82722 ?auto_82724 ) ) ( not ( = ?auto_82722 ?auto_82725 ) ) ( not ( = ?auto_82722 ?auto_82726 ) ) ( not ( = ?auto_82722 ?auto_82727 ) ) ( not ( = ?auto_82722 ?auto_82728 ) ) ( not ( = ?auto_82722 ?auto_82729 ) ) ( not ( = ?auto_82722 ?auto_82730 ) ) ( not ( = ?auto_82722 ?auto_82731 ) ) ( not ( = ?auto_82723 ?auto_82724 ) ) ( not ( = ?auto_82723 ?auto_82725 ) ) ( not ( = ?auto_82723 ?auto_82726 ) ) ( not ( = ?auto_82723 ?auto_82727 ) ) ( not ( = ?auto_82723 ?auto_82728 ) ) ( not ( = ?auto_82723 ?auto_82729 ) ) ( not ( = ?auto_82723 ?auto_82730 ) ) ( not ( = ?auto_82723 ?auto_82731 ) ) ( not ( = ?auto_82724 ?auto_82725 ) ) ( not ( = ?auto_82724 ?auto_82726 ) ) ( not ( = ?auto_82724 ?auto_82727 ) ) ( not ( = ?auto_82724 ?auto_82728 ) ) ( not ( = ?auto_82724 ?auto_82729 ) ) ( not ( = ?auto_82724 ?auto_82730 ) ) ( not ( = ?auto_82724 ?auto_82731 ) ) ( not ( = ?auto_82725 ?auto_82726 ) ) ( not ( = ?auto_82725 ?auto_82727 ) ) ( not ( = ?auto_82725 ?auto_82728 ) ) ( not ( = ?auto_82725 ?auto_82729 ) ) ( not ( = ?auto_82725 ?auto_82730 ) ) ( not ( = ?auto_82725 ?auto_82731 ) ) ( not ( = ?auto_82726 ?auto_82727 ) ) ( not ( = ?auto_82726 ?auto_82728 ) ) ( not ( = ?auto_82726 ?auto_82729 ) ) ( not ( = ?auto_82726 ?auto_82730 ) ) ( not ( = ?auto_82726 ?auto_82731 ) ) ( not ( = ?auto_82727 ?auto_82728 ) ) ( not ( = ?auto_82727 ?auto_82729 ) ) ( not ( = ?auto_82727 ?auto_82730 ) ) ( not ( = ?auto_82727 ?auto_82731 ) ) ( not ( = ?auto_82728 ?auto_82729 ) ) ( not ( = ?auto_82728 ?auto_82730 ) ) ( not ( = ?auto_82728 ?auto_82731 ) ) ( not ( = ?auto_82729 ?auto_82730 ) ) ( not ( = ?auto_82729 ?auto_82731 ) ) ( not ( = ?auto_82730 ?auto_82731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82730 ?auto_82731 )
      ( !STACK ?auto_82730 ?auto_82729 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82741 - BLOCK
      ?auto_82742 - BLOCK
      ?auto_82743 - BLOCK
      ?auto_82744 - BLOCK
      ?auto_82745 - BLOCK
      ?auto_82746 - BLOCK
      ?auto_82747 - BLOCK
      ?auto_82748 - BLOCK
      ?auto_82749 - BLOCK
    )
    :vars
    (
      ?auto_82750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82748 ) ( ON ?auto_82749 ?auto_82750 ) ( CLEAR ?auto_82749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82741 ) ( ON ?auto_82742 ?auto_82741 ) ( ON ?auto_82743 ?auto_82742 ) ( ON ?auto_82744 ?auto_82743 ) ( ON ?auto_82745 ?auto_82744 ) ( ON ?auto_82746 ?auto_82745 ) ( ON ?auto_82747 ?auto_82746 ) ( ON ?auto_82748 ?auto_82747 ) ( not ( = ?auto_82741 ?auto_82742 ) ) ( not ( = ?auto_82741 ?auto_82743 ) ) ( not ( = ?auto_82741 ?auto_82744 ) ) ( not ( = ?auto_82741 ?auto_82745 ) ) ( not ( = ?auto_82741 ?auto_82746 ) ) ( not ( = ?auto_82741 ?auto_82747 ) ) ( not ( = ?auto_82741 ?auto_82748 ) ) ( not ( = ?auto_82741 ?auto_82749 ) ) ( not ( = ?auto_82741 ?auto_82750 ) ) ( not ( = ?auto_82742 ?auto_82743 ) ) ( not ( = ?auto_82742 ?auto_82744 ) ) ( not ( = ?auto_82742 ?auto_82745 ) ) ( not ( = ?auto_82742 ?auto_82746 ) ) ( not ( = ?auto_82742 ?auto_82747 ) ) ( not ( = ?auto_82742 ?auto_82748 ) ) ( not ( = ?auto_82742 ?auto_82749 ) ) ( not ( = ?auto_82742 ?auto_82750 ) ) ( not ( = ?auto_82743 ?auto_82744 ) ) ( not ( = ?auto_82743 ?auto_82745 ) ) ( not ( = ?auto_82743 ?auto_82746 ) ) ( not ( = ?auto_82743 ?auto_82747 ) ) ( not ( = ?auto_82743 ?auto_82748 ) ) ( not ( = ?auto_82743 ?auto_82749 ) ) ( not ( = ?auto_82743 ?auto_82750 ) ) ( not ( = ?auto_82744 ?auto_82745 ) ) ( not ( = ?auto_82744 ?auto_82746 ) ) ( not ( = ?auto_82744 ?auto_82747 ) ) ( not ( = ?auto_82744 ?auto_82748 ) ) ( not ( = ?auto_82744 ?auto_82749 ) ) ( not ( = ?auto_82744 ?auto_82750 ) ) ( not ( = ?auto_82745 ?auto_82746 ) ) ( not ( = ?auto_82745 ?auto_82747 ) ) ( not ( = ?auto_82745 ?auto_82748 ) ) ( not ( = ?auto_82745 ?auto_82749 ) ) ( not ( = ?auto_82745 ?auto_82750 ) ) ( not ( = ?auto_82746 ?auto_82747 ) ) ( not ( = ?auto_82746 ?auto_82748 ) ) ( not ( = ?auto_82746 ?auto_82749 ) ) ( not ( = ?auto_82746 ?auto_82750 ) ) ( not ( = ?auto_82747 ?auto_82748 ) ) ( not ( = ?auto_82747 ?auto_82749 ) ) ( not ( = ?auto_82747 ?auto_82750 ) ) ( not ( = ?auto_82748 ?auto_82749 ) ) ( not ( = ?auto_82748 ?auto_82750 ) ) ( not ( = ?auto_82749 ?auto_82750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82749 ?auto_82750 )
      ( !STACK ?auto_82749 ?auto_82748 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82760 - BLOCK
      ?auto_82761 - BLOCK
      ?auto_82762 - BLOCK
      ?auto_82763 - BLOCK
      ?auto_82764 - BLOCK
      ?auto_82765 - BLOCK
      ?auto_82766 - BLOCK
      ?auto_82767 - BLOCK
      ?auto_82768 - BLOCK
    )
    :vars
    (
      ?auto_82769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82768 ?auto_82769 ) ( ON-TABLE ?auto_82760 ) ( ON ?auto_82761 ?auto_82760 ) ( ON ?auto_82762 ?auto_82761 ) ( ON ?auto_82763 ?auto_82762 ) ( ON ?auto_82764 ?auto_82763 ) ( ON ?auto_82765 ?auto_82764 ) ( ON ?auto_82766 ?auto_82765 ) ( not ( = ?auto_82760 ?auto_82761 ) ) ( not ( = ?auto_82760 ?auto_82762 ) ) ( not ( = ?auto_82760 ?auto_82763 ) ) ( not ( = ?auto_82760 ?auto_82764 ) ) ( not ( = ?auto_82760 ?auto_82765 ) ) ( not ( = ?auto_82760 ?auto_82766 ) ) ( not ( = ?auto_82760 ?auto_82767 ) ) ( not ( = ?auto_82760 ?auto_82768 ) ) ( not ( = ?auto_82760 ?auto_82769 ) ) ( not ( = ?auto_82761 ?auto_82762 ) ) ( not ( = ?auto_82761 ?auto_82763 ) ) ( not ( = ?auto_82761 ?auto_82764 ) ) ( not ( = ?auto_82761 ?auto_82765 ) ) ( not ( = ?auto_82761 ?auto_82766 ) ) ( not ( = ?auto_82761 ?auto_82767 ) ) ( not ( = ?auto_82761 ?auto_82768 ) ) ( not ( = ?auto_82761 ?auto_82769 ) ) ( not ( = ?auto_82762 ?auto_82763 ) ) ( not ( = ?auto_82762 ?auto_82764 ) ) ( not ( = ?auto_82762 ?auto_82765 ) ) ( not ( = ?auto_82762 ?auto_82766 ) ) ( not ( = ?auto_82762 ?auto_82767 ) ) ( not ( = ?auto_82762 ?auto_82768 ) ) ( not ( = ?auto_82762 ?auto_82769 ) ) ( not ( = ?auto_82763 ?auto_82764 ) ) ( not ( = ?auto_82763 ?auto_82765 ) ) ( not ( = ?auto_82763 ?auto_82766 ) ) ( not ( = ?auto_82763 ?auto_82767 ) ) ( not ( = ?auto_82763 ?auto_82768 ) ) ( not ( = ?auto_82763 ?auto_82769 ) ) ( not ( = ?auto_82764 ?auto_82765 ) ) ( not ( = ?auto_82764 ?auto_82766 ) ) ( not ( = ?auto_82764 ?auto_82767 ) ) ( not ( = ?auto_82764 ?auto_82768 ) ) ( not ( = ?auto_82764 ?auto_82769 ) ) ( not ( = ?auto_82765 ?auto_82766 ) ) ( not ( = ?auto_82765 ?auto_82767 ) ) ( not ( = ?auto_82765 ?auto_82768 ) ) ( not ( = ?auto_82765 ?auto_82769 ) ) ( not ( = ?auto_82766 ?auto_82767 ) ) ( not ( = ?auto_82766 ?auto_82768 ) ) ( not ( = ?auto_82766 ?auto_82769 ) ) ( not ( = ?auto_82767 ?auto_82768 ) ) ( not ( = ?auto_82767 ?auto_82769 ) ) ( not ( = ?auto_82768 ?auto_82769 ) ) ( CLEAR ?auto_82766 ) ( ON ?auto_82767 ?auto_82768 ) ( CLEAR ?auto_82767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_82760 ?auto_82761 ?auto_82762 ?auto_82763 ?auto_82764 ?auto_82765 ?auto_82766 ?auto_82767 )
      ( MAKE-9PILE ?auto_82760 ?auto_82761 ?auto_82762 ?auto_82763 ?auto_82764 ?auto_82765 ?auto_82766 ?auto_82767 ?auto_82768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82779 - BLOCK
      ?auto_82780 - BLOCK
      ?auto_82781 - BLOCK
      ?auto_82782 - BLOCK
      ?auto_82783 - BLOCK
      ?auto_82784 - BLOCK
      ?auto_82785 - BLOCK
      ?auto_82786 - BLOCK
      ?auto_82787 - BLOCK
    )
    :vars
    (
      ?auto_82788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82787 ?auto_82788 ) ( ON-TABLE ?auto_82779 ) ( ON ?auto_82780 ?auto_82779 ) ( ON ?auto_82781 ?auto_82780 ) ( ON ?auto_82782 ?auto_82781 ) ( ON ?auto_82783 ?auto_82782 ) ( ON ?auto_82784 ?auto_82783 ) ( ON ?auto_82785 ?auto_82784 ) ( not ( = ?auto_82779 ?auto_82780 ) ) ( not ( = ?auto_82779 ?auto_82781 ) ) ( not ( = ?auto_82779 ?auto_82782 ) ) ( not ( = ?auto_82779 ?auto_82783 ) ) ( not ( = ?auto_82779 ?auto_82784 ) ) ( not ( = ?auto_82779 ?auto_82785 ) ) ( not ( = ?auto_82779 ?auto_82786 ) ) ( not ( = ?auto_82779 ?auto_82787 ) ) ( not ( = ?auto_82779 ?auto_82788 ) ) ( not ( = ?auto_82780 ?auto_82781 ) ) ( not ( = ?auto_82780 ?auto_82782 ) ) ( not ( = ?auto_82780 ?auto_82783 ) ) ( not ( = ?auto_82780 ?auto_82784 ) ) ( not ( = ?auto_82780 ?auto_82785 ) ) ( not ( = ?auto_82780 ?auto_82786 ) ) ( not ( = ?auto_82780 ?auto_82787 ) ) ( not ( = ?auto_82780 ?auto_82788 ) ) ( not ( = ?auto_82781 ?auto_82782 ) ) ( not ( = ?auto_82781 ?auto_82783 ) ) ( not ( = ?auto_82781 ?auto_82784 ) ) ( not ( = ?auto_82781 ?auto_82785 ) ) ( not ( = ?auto_82781 ?auto_82786 ) ) ( not ( = ?auto_82781 ?auto_82787 ) ) ( not ( = ?auto_82781 ?auto_82788 ) ) ( not ( = ?auto_82782 ?auto_82783 ) ) ( not ( = ?auto_82782 ?auto_82784 ) ) ( not ( = ?auto_82782 ?auto_82785 ) ) ( not ( = ?auto_82782 ?auto_82786 ) ) ( not ( = ?auto_82782 ?auto_82787 ) ) ( not ( = ?auto_82782 ?auto_82788 ) ) ( not ( = ?auto_82783 ?auto_82784 ) ) ( not ( = ?auto_82783 ?auto_82785 ) ) ( not ( = ?auto_82783 ?auto_82786 ) ) ( not ( = ?auto_82783 ?auto_82787 ) ) ( not ( = ?auto_82783 ?auto_82788 ) ) ( not ( = ?auto_82784 ?auto_82785 ) ) ( not ( = ?auto_82784 ?auto_82786 ) ) ( not ( = ?auto_82784 ?auto_82787 ) ) ( not ( = ?auto_82784 ?auto_82788 ) ) ( not ( = ?auto_82785 ?auto_82786 ) ) ( not ( = ?auto_82785 ?auto_82787 ) ) ( not ( = ?auto_82785 ?auto_82788 ) ) ( not ( = ?auto_82786 ?auto_82787 ) ) ( not ( = ?auto_82786 ?auto_82788 ) ) ( not ( = ?auto_82787 ?auto_82788 ) ) ( CLEAR ?auto_82785 ) ( ON ?auto_82786 ?auto_82787 ) ( CLEAR ?auto_82786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_82779 ?auto_82780 ?auto_82781 ?auto_82782 ?auto_82783 ?auto_82784 ?auto_82785 ?auto_82786 )
      ( MAKE-9PILE ?auto_82779 ?auto_82780 ?auto_82781 ?auto_82782 ?auto_82783 ?auto_82784 ?auto_82785 ?auto_82786 ?auto_82787 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82798 - BLOCK
      ?auto_82799 - BLOCK
      ?auto_82800 - BLOCK
      ?auto_82801 - BLOCK
      ?auto_82802 - BLOCK
      ?auto_82803 - BLOCK
      ?auto_82804 - BLOCK
      ?auto_82805 - BLOCK
      ?auto_82806 - BLOCK
    )
    :vars
    (
      ?auto_82807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82806 ?auto_82807 ) ( ON-TABLE ?auto_82798 ) ( ON ?auto_82799 ?auto_82798 ) ( ON ?auto_82800 ?auto_82799 ) ( ON ?auto_82801 ?auto_82800 ) ( ON ?auto_82802 ?auto_82801 ) ( ON ?auto_82803 ?auto_82802 ) ( not ( = ?auto_82798 ?auto_82799 ) ) ( not ( = ?auto_82798 ?auto_82800 ) ) ( not ( = ?auto_82798 ?auto_82801 ) ) ( not ( = ?auto_82798 ?auto_82802 ) ) ( not ( = ?auto_82798 ?auto_82803 ) ) ( not ( = ?auto_82798 ?auto_82804 ) ) ( not ( = ?auto_82798 ?auto_82805 ) ) ( not ( = ?auto_82798 ?auto_82806 ) ) ( not ( = ?auto_82798 ?auto_82807 ) ) ( not ( = ?auto_82799 ?auto_82800 ) ) ( not ( = ?auto_82799 ?auto_82801 ) ) ( not ( = ?auto_82799 ?auto_82802 ) ) ( not ( = ?auto_82799 ?auto_82803 ) ) ( not ( = ?auto_82799 ?auto_82804 ) ) ( not ( = ?auto_82799 ?auto_82805 ) ) ( not ( = ?auto_82799 ?auto_82806 ) ) ( not ( = ?auto_82799 ?auto_82807 ) ) ( not ( = ?auto_82800 ?auto_82801 ) ) ( not ( = ?auto_82800 ?auto_82802 ) ) ( not ( = ?auto_82800 ?auto_82803 ) ) ( not ( = ?auto_82800 ?auto_82804 ) ) ( not ( = ?auto_82800 ?auto_82805 ) ) ( not ( = ?auto_82800 ?auto_82806 ) ) ( not ( = ?auto_82800 ?auto_82807 ) ) ( not ( = ?auto_82801 ?auto_82802 ) ) ( not ( = ?auto_82801 ?auto_82803 ) ) ( not ( = ?auto_82801 ?auto_82804 ) ) ( not ( = ?auto_82801 ?auto_82805 ) ) ( not ( = ?auto_82801 ?auto_82806 ) ) ( not ( = ?auto_82801 ?auto_82807 ) ) ( not ( = ?auto_82802 ?auto_82803 ) ) ( not ( = ?auto_82802 ?auto_82804 ) ) ( not ( = ?auto_82802 ?auto_82805 ) ) ( not ( = ?auto_82802 ?auto_82806 ) ) ( not ( = ?auto_82802 ?auto_82807 ) ) ( not ( = ?auto_82803 ?auto_82804 ) ) ( not ( = ?auto_82803 ?auto_82805 ) ) ( not ( = ?auto_82803 ?auto_82806 ) ) ( not ( = ?auto_82803 ?auto_82807 ) ) ( not ( = ?auto_82804 ?auto_82805 ) ) ( not ( = ?auto_82804 ?auto_82806 ) ) ( not ( = ?auto_82804 ?auto_82807 ) ) ( not ( = ?auto_82805 ?auto_82806 ) ) ( not ( = ?auto_82805 ?auto_82807 ) ) ( not ( = ?auto_82806 ?auto_82807 ) ) ( ON ?auto_82805 ?auto_82806 ) ( CLEAR ?auto_82803 ) ( ON ?auto_82804 ?auto_82805 ) ( CLEAR ?auto_82804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82798 ?auto_82799 ?auto_82800 ?auto_82801 ?auto_82802 ?auto_82803 ?auto_82804 )
      ( MAKE-9PILE ?auto_82798 ?auto_82799 ?auto_82800 ?auto_82801 ?auto_82802 ?auto_82803 ?auto_82804 ?auto_82805 ?auto_82806 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82817 - BLOCK
      ?auto_82818 - BLOCK
      ?auto_82819 - BLOCK
      ?auto_82820 - BLOCK
      ?auto_82821 - BLOCK
      ?auto_82822 - BLOCK
      ?auto_82823 - BLOCK
      ?auto_82824 - BLOCK
      ?auto_82825 - BLOCK
    )
    :vars
    (
      ?auto_82826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82825 ?auto_82826 ) ( ON-TABLE ?auto_82817 ) ( ON ?auto_82818 ?auto_82817 ) ( ON ?auto_82819 ?auto_82818 ) ( ON ?auto_82820 ?auto_82819 ) ( ON ?auto_82821 ?auto_82820 ) ( ON ?auto_82822 ?auto_82821 ) ( not ( = ?auto_82817 ?auto_82818 ) ) ( not ( = ?auto_82817 ?auto_82819 ) ) ( not ( = ?auto_82817 ?auto_82820 ) ) ( not ( = ?auto_82817 ?auto_82821 ) ) ( not ( = ?auto_82817 ?auto_82822 ) ) ( not ( = ?auto_82817 ?auto_82823 ) ) ( not ( = ?auto_82817 ?auto_82824 ) ) ( not ( = ?auto_82817 ?auto_82825 ) ) ( not ( = ?auto_82817 ?auto_82826 ) ) ( not ( = ?auto_82818 ?auto_82819 ) ) ( not ( = ?auto_82818 ?auto_82820 ) ) ( not ( = ?auto_82818 ?auto_82821 ) ) ( not ( = ?auto_82818 ?auto_82822 ) ) ( not ( = ?auto_82818 ?auto_82823 ) ) ( not ( = ?auto_82818 ?auto_82824 ) ) ( not ( = ?auto_82818 ?auto_82825 ) ) ( not ( = ?auto_82818 ?auto_82826 ) ) ( not ( = ?auto_82819 ?auto_82820 ) ) ( not ( = ?auto_82819 ?auto_82821 ) ) ( not ( = ?auto_82819 ?auto_82822 ) ) ( not ( = ?auto_82819 ?auto_82823 ) ) ( not ( = ?auto_82819 ?auto_82824 ) ) ( not ( = ?auto_82819 ?auto_82825 ) ) ( not ( = ?auto_82819 ?auto_82826 ) ) ( not ( = ?auto_82820 ?auto_82821 ) ) ( not ( = ?auto_82820 ?auto_82822 ) ) ( not ( = ?auto_82820 ?auto_82823 ) ) ( not ( = ?auto_82820 ?auto_82824 ) ) ( not ( = ?auto_82820 ?auto_82825 ) ) ( not ( = ?auto_82820 ?auto_82826 ) ) ( not ( = ?auto_82821 ?auto_82822 ) ) ( not ( = ?auto_82821 ?auto_82823 ) ) ( not ( = ?auto_82821 ?auto_82824 ) ) ( not ( = ?auto_82821 ?auto_82825 ) ) ( not ( = ?auto_82821 ?auto_82826 ) ) ( not ( = ?auto_82822 ?auto_82823 ) ) ( not ( = ?auto_82822 ?auto_82824 ) ) ( not ( = ?auto_82822 ?auto_82825 ) ) ( not ( = ?auto_82822 ?auto_82826 ) ) ( not ( = ?auto_82823 ?auto_82824 ) ) ( not ( = ?auto_82823 ?auto_82825 ) ) ( not ( = ?auto_82823 ?auto_82826 ) ) ( not ( = ?auto_82824 ?auto_82825 ) ) ( not ( = ?auto_82824 ?auto_82826 ) ) ( not ( = ?auto_82825 ?auto_82826 ) ) ( ON ?auto_82824 ?auto_82825 ) ( CLEAR ?auto_82822 ) ( ON ?auto_82823 ?auto_82824 ) ( CLEAR ?auto_82823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82817 ?auto_82818 ?auto_82819 ?auto_82820 ?auto_82821 ?auto_82822 ?auto_82823 )
      ( MAKE-9PILE ?auto_82817 ?auto_82818 ?auto_82819 ?auto_82820 ?auto_82821 ?auto_82822 ?auto_82823 ?auto_82824 ?auto_82825 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82836 - BLOCK
      ?auto_82837 - BLOCK
      ?auto_82838 - BLOCK
      ?auto_82839 - BLOCK
      ?auto_82840 - BLOCK
      ?auto_82841 - BLOCK
      ?auto_82842 - BLOCK
      ?auto_82843 - BLOCK
      ?auto_82844 - BLOCK
    )
    :vars
    (
      ?auto_82845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82844 ?auto_82845 ) ( ON-TABLE ?auto_82836 ) ( ON ?auto_82837 ?auto_82836 ) ( ON ?auto_82838 ?auto_82837 ) ( ON ?auto_82839 ?auto_82838 ) ( ON ?auto_82840 ?auto_82839 ) ( not ( = ?auto_82836 ?auto_82837 ) ) ( not ( = ?auto_82836 ?auto_82838 ) ) ( not ( = ?auto_82836 ?auto_82839 ) ) ( not ( = ?auto_82836 ?auto_82840 ) ) ( not ( = ?auto_82836 ?auto_82841 ) ) ( not ( = ?auto_82836 ?auto_82842 ) ) ( not ( = ?auto_82836 ?auto_82843 ) ) ( not ( = ?auto_82836 ?auto_82844 ) ) ( not ( = ?auto_82836 ?auto_82845 ) ) ( not ( = ?auto_82837 ?auto_82838 ) ) ( not ( = ?auto_82837 ?auto_82839 ) ) ( not ( = ?auto_82837 ?auto_82840 ) ) ( not ( = ?auto_82837 ?auto_82841 ) ) ( not ( = ?auto_82837 ?auto_82842 ) ) ( not ( = ?auto_82837 ?auto_82843 ) ) ( not ( = ?auto_82837 ?auto_82844 ) ) ( not ( = ?auto_82837 ?auto_82845 ) ) ( not ( = ?auto_82838 ?auto_82839 ) ) ( not ( = ?auto_82838 ?auto_82840 ) ) ( not ( = ?auto_82838 ?auto_82841 ) ) ( not ( = ?auto_82838 ?auto_82842 ) ) ( not ( = ?auto_82838 ?auto_82843 ) ) ( not ( = ?auto_82838 ?auto_82844 ) ) ( not ( = ?auto_82838 ?auto_82845 ) ) ( not ( = ?auto_82839 ?auto_82840 ) ) ( not ( = ?auto_82839 ?auto_82841 ) ) ( not ( = ?auto_82839 ?auto_82842 ) ) ( not ( = ?auto_82839 ?auto_82843 ) ) ( not ( = ?auto_82839 ?auto_82844 ) ) ( not ( = ?auto_82839 ?auto_82845 ) ) ( not ( = ?auto_82840 ?auto_82841 ) ) ( not ( = ?auto_82840 ?auto_82842 ) ) ( not ( = ?auto_82840 ?auto_82843 ) ) ( not ( = ?auto_82840 ?auto_82844 ) ) ( not ( = ?auto_82840 ?auto_82845 ) ) ( not ( = ?auto_82841 ?auto_82842 ) ) ( not ( = ?auto_82841 ?auto_82843 ) ) ( not ( = ?auto_82841 ?auto_82844 ) ) ( not ( = ?auto_82841 ?auto_82845 ) ) ( not ( = ?auto_82842 ?auto_82843 ) ) ( not ( = ?auto_82842 ?auto_82844 ) ) ( not ( = ?auto_82842 ?auto_82845 ) ) ( not ( = ?auto_82843 ?auto_82844 ) ) ( not ( = ?auto_82843 ?auto_82845 ) ) ( not ( = ?auto_82844 ?auto_82845 ) ) ( ON ?auto_82843 ?auto_82844 ) ( ON ?auto_82842 ?auto_82843 ) ( CLEAR ?auto_82840 ) ( ON ?auto_82841 ?auto_82842 ) ( CLEAR ?auto_82841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82836 ?auto_82837 ?auto_82838 ?auto_82839 ?auto_82840 ?auto_82841 )
      ( MAKE-9PILE ?auto_82836 ?auto_82837 ?auto_82838 ?auto_82839 ?auto_82840 ?auto_82841 ?auto_82842 ?auto_82843 ?auto_82844 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82855 - BLOCK
      ?auto_82856 - BLOCK
      ?auto_82857 - BLOCK
      ?auto_82858 - BLOCK
      ?auto_82859 - BLOCK
      ?auto_82860 - BLOCK
      ?auto_82861 - BLOCK
      ?auto_82862 - BLOCK
      ?auto_82863 - BLOCK
    )
    :vars
    (
      ?auto_82864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82863 ?auto_82864 ) ( ON-TABLE ?auto_82855 ) ( ON ?auto_82856 ?auto_82855 ) ( ON ?auto_82857 ?auto_82856 ) ( ON ?auto_82858 ?auto_82857 ) ( ON ?auto_82859 ?auto_82858 ) ( not ( = ?auto_82855 ?auto_82856 ) ) ( not ( = ?auto_82855 ?auto_82857 ) ) ( not ( = ?auto_82855 ?auto_82858 ) ) ( not ( = ?auto_82855 ?auto_82859 ) ) ( not ( = ?auto_82855 ?auto_82860 ) ) ( not ( = ?auto_82855 ?auto_82861 ) ) ( not ( = ?auto_82855 ?auto_82862 ) ) ( not ( = ?auto_82855 ?auto_82863 ) ) ( not ( = ?auto_82855 ?auto_82864 ) ) ( not ( = ?auto_82856 ?auto_82857 ) ) ( not ( = ?auto_82856 ?auto_82858 ) ) ( not ( = ?auto_82856 ?auto_82859 ) ) ( not ( = ?auto_82856 ?auto_82860 ) ) ( not ( = ?auto_82856 ?auto_82861 ) ) ( not ( = ?auto_82856 ?auto_82862 ) ) ( not ( = ?auto_82856 ?auto_82863 ) ) ( not ( = ?auto_82856 ?auto_82864 ) ) ( not ( = ?auto_82857 ?auto_82858 ) ) ( not ( = ?auto_82857 ?auto_82859 ) ) ( not ( = ?auto_82857 ?auto_82860 ) ) ( not ( = ?auto_82857 ?auto_82861 ) ) ( not ( = ?auto_82857 ?auto_82862 ) ) ( not ( = ?auto_82857 ?auto_82863 ) ) ( not ( = ?auto_82857 ?auto_82864 ) ) ( not ( = ?auto_82858 ?auto_82859 ) ) ( not ( = ?auto_82858 ?auto_82860 ) ) ( not ( = ?auto_82858 ?auto_82861 ) ) ( not ( = ?auto_82858 ?auto_82862 ) ) ( not ( = ?auto_82858 ?auto_82863 ) ) ( not ( = ?auto_82858 ?auto_82864 ) ) ( not ( = ?auto_82859 ?auto_82860 ) ) ( not ( = ?auto_82859 ?auto_82861 ) ) ( not ( = ?auto_82859 ?auto_82862 ) ) ( not ( = ?auto_82859 ?auto_82863 ) ) ( not ( = ?auto_82859 ?auto_82864 ) ) ( not ( = ?auto_82860 ?auto_82861 ) ) ( not ( = ?auto_82860 ?auto_82862 ) ) ( not ( = ?auto_82860 ?auto_82863 ) ) ( not ( = ?auto_82860 ?auto_82864 ) ) ( not ( = ?auto_82861 ?auto_82862 ) ) ( not ( = ?auto_82861 ?auto_82863 ) ) ( not ( = ?auto_82861 ?auto_82864 ) ) ( not ( = ?auto_82862 ?auto_82863 ) ) ( not ( = ?auto_82862 ?auto_82864 ) ) ( not ( = ?auto_82863 ?auto_82864 ) ) ( ON ?auto_82862 ?auto_82863 ) ( ON ?auto_82861 ?auto_82862 ) ( CLEAR ?auto_82859 ) ( ON ?auto_82860 ?auto_82861 ) ( CLEAR ?auto_82860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82855 ?auto_82856 ?auto_82857 ?auto_82858 ?auto_82859 ?auto_82860 )
      ( MAKE-9PILE ?auto_82855 ?auto_82856 ?auto_82857 ?auto_82858 ?auto_82859 ?auto_82860 ?auto_82861 ?auto_82862 ?auto_82863 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82874 - BLOCK
      ?auto_82875 - BLOCK
      ?auto_82876 - BLOCK
      ?auto_82877 - BLOCK
      ?auto_82878 - BLOCK
      ?auto_82879 - BLOCK
      ?auto_82880 - BLOCK
      ?auto_82881 - BLOCK
      ?auto_82882 - BLOCK
    )
    :vars
    (
      ?auto_82883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82882 ?auto_82883 ) ( ON-TABLE ?auto_82874 ) ( ON ?auto_82875 ?auto_82874 ) ( ON ?auto_82876 ?auto_82875 ) ( ON ?auto_82877 ?auto_82876 ) ( not ( = ?auto_82874 ?auto_82875 ) ) ( not ( = ?auto_82874 ?auto_82876 ) ) ( not ( = ?auto_82874 ?auto_82877 ) ) ( not ( = ?auto_82874 ?auto_82878 ) ) ( not ( = ?auto_82874 ?auto_82879 ) ) ( not ( = ?auto_82874 ?auto_82880 ) ) ( not ( = ?auto_82874 ?auto_82881 ) ) ( not ( = ?auto_82874 ?auto_82882 ) ) ( not ( = ?auto_82874 ?auto_82883 ) ) ( not ( = ?auto_82875 ?auto_82876 ) ) ( not ( = ?auto_82875 ?auto_82877 ) ) ( not ( = ?auto_82875 ?auto_82878 ) ) ( not ( = ?auto_82875 ?auto_82879 ) ) ( not ( = ?auto_82875 ?auto_82880 ) ) ( not ( = ?auto_82875 ?auto_82881 ) ) ( not ( = ?auto_82875 ?auto_82882 ) ) ( not ( = ?auto_82875 ?auto_82883 ) ) ( not ( = ?auto_82876 ?auto_82877 ) ) ( not ( = ?auto_82876 ?auto_82878 ) ) ( not ( = ?auto_82876 ?auto_82879 ) ) ( not ( = ?auto_82876 ?auto_82880 ) ) ( not ( = ?auto_82876 ?auto_82881 ) ) ( not ( = ?auto_82876 ?auto_82882 ) ) ( not ( = ?auto_82876 ?auto_82883 ) ) ( not ( = ?auto_82877 ?auto_82878 ) ) ( not ( = ?auto_82877 ?auto_82879 ) ) ( not ( = ?auto_82877 ?auto_82880 ) ) ( not ( = ?auto_82877 ?auto_82881 ) ) ( not ( = ?auto_82877 ?auto_82882 ) ) ( not ( = ?auto_82877 ?auto_82883 ) ) ( not ( = ?auto_82878 ?auto_82879 ) ) ( not ( = ?auto_82878 ?auto_82880 ) ) ( not ( = ?auto_82878 ?auto_82881 ) ) ( not ( = ?auto_82878 ?auto_82882 ) ) ( not ( = ?auto_82878 ?auto_82883 ) ) ( not ( = ?auto_82879 ?auto_82880 ) ) ( not ( = ?auto_82879 ?auto_82881 ) ) ( not ( = ?auto_82879 ?auto_82882 ) ) ( not ( = ?auto_82879 ?auto_82883 ) ) ( not ( = ?auto_82880 ?auto_82881 ) ) ( not ( = ?auto_82880 ?auto_82882 ) ) ( not ( = ?auto_82880 ?auto_82883 ) ) ( not ( = ?auto_82881 ?auto_82882 ) ) ( not ( = ?auto_82881 ?auto_82883 ) ) ( not ( = ?auto_82882 ?auto_82883 ) ) ( ON ?auto_82881 ?auto_82882 ) ( ON ?auto_82880 ?auto_82881 ) ( ON ?auto_82879 ?auto_82880 ) ( CLEAR ?auto_82877 ) ( ON ?auto_82878 ?auto_82879 ) ( CLEAR ?auto_82878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82874 ?auto_82875 ?auto_82876 ?auto_82877 ?auto_82878 )
      ( MAKE-9PILE ?auto_82874 ?auto_82875 ?auto_82876 ?auto_82877 ?auto_82878 ?auto_82879 ?auto_82880 ?auto_82881 ?auto_82882 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82893 - BLOCK
      ?auto_82894 - BLOCK
      ?auto_82895 - BLOCK
      ?auto_82896 - BLOCK
      ?auto_82897 - BLOCK
      ?auto_82898 - BLOCK
      ?auto_82899 - BLOCK
      ?auto_82900 - BLOCK
      ?auto_82901 - BLOCK
    )
    :vars
    (
      ?auto_82902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82901 ?auto_82902 ) ( ON-TABLE ?auto_82893 ) ( ON ?auto_82894 ?auto_82893 ) ( ON ?auto_82895 ?auto_82894 ) ( ON ?auto_82896 ?auto_82895 ) ( not ( = ?auto_82893 ?auto_82894 ) ) ( not ( = ?auto_82893 ?auto_82895 ) ) ( not ( = ?auto_82893 ?auto_82896 ) ) ( not ( = ?auto_82893 ?auto_82897 ) ) ( not ( = ?auto_82893 ?auto_82898 ) ) ( not ( = ?auto_82893 ?auto_82899 ) ) ( not ( = ?auto_82893 ?auto_82900 ) ) ( not ( = ?auto_82893 ?auto_82901 ) ) ( not ( = ?auto_82893 ?auto_82902 ) ) ( not ( = ?auto_82894 ?auto_82895 ) ) ( not ( = ?auto_82894 ?auto_82896 ) ) ( not ( = ?auto_82894 ?auto_82897 ) ) ( not ( = ?auto_82894 ?auto_82898 ) ) ( not ( = ?auto_82894 ?auto_82899 ) ) ( not ( = ?auto_82894 ?auto_82900 ) ) ( not ( = ?auto_82894 ?auto_82901 ) ) ( not ( = ?auto_82894 ?auto_82902 ) ) ( not ( = ?auto_82895 ?auto_82896 ) ) ( not ( = ?auto_82895 ?auto_82897 ) ) ( not ( = ?auto_82895 ?auto_82898 ) ) ( not ( = ?auto_82895 ?auto_82899 ) ) ( not ( = ?auto_82895 ?auto_82900 ) ) ( not ( = ?auto_82895 ?auto_82901 ) ) ( not ( = ?auto_82895 ?auto_82902 ) ) ( not ( = ?auto_82896 ?auto_82897 ) ) ( not ( = ?auto_82896 ?auto_82898 ) ) ( not ( = ?auto_82896 ?auto_82899 ) ) ( not ( = ?auto_82896 ?auto_82900 ) ) ( not ( = ?auto_82896 ?auto_82901 ) ) ( not ( = ?auto_82896 ?auto_82902 ) ) ( not ( = ?auto_82897 ?auto_82898 ) ) ( not ( = ?auto_82897 ?auto_82899 ) ) ( not ( = ?auto_82897 ?auto_82900 ) ) ( not ( = ?auto_82897 ?auto_82901 ) ) ( not ( = ?auto_82897 ?auto_82902 ) ) ( not ( = ?auto_82898 ?auto_82899 ) ) ( not ( = ?auto_82898 ?auto_82900 ) ) ( not ( = ?auto_82898 ?auto_82901 ) ) ( not ( = ?auto_82898 ?auto_82902 ) ) ( not ( = ?auto_82899 ?auto_82900 ) ) ( not ( = ?auto_82899 ?auto_82901 ) ) ( not ( = ?auto_82899 ?auto_82902 ) ) ( not ( = ?auto_82900 ?auto_82901 ) ) ( not ( = ?auto_82900 ?auto_82902 ) ) ( not ( = ?auto_82901 ?auto_82902 ) ) ( ON ?auto_82900 ?auto_82901 ) ( ON ?auto_82899 ?auto_82900 ) ( ON ?auto_82898 ?auto_82899 ) ( CLEAR ?auto_82896 ) ( ON ?auto_82897 ?auto_82898 ) ( CLEAR ?auto_82897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82893 ?auto_82894 ?auto_82895 ?auto_82896 ?auto_82897 )
      ( MAKE-9PILE ?auto_82893 ?auto_82894 ?auto_82895 ?auto_82896 ?auto_82897 ?auto_82898 ?auto_82899 ?auto_82900 ?auto_82901 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82912 - BLOCK
      ?auto_82913 - BLOCK
      ?auto_82914 - BLOCK
      ?auto_82915 - BLOCK
      ?auto_82916 - BLOCK
      ?auto_82917 - BLOCK
      ?auto_82918 - BLOCK
      ?auto_82919 - BLOCK
      ?auto_82920 - BLOCK
    )
    :vars
    (
      ?auto_82921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82920 ?auto_82921 ) ( ON-TABLE ?auto_82912 ) ( ON ?auto_82913 ?auto_82912 ) ( ON ?auto_82914 ?auto_82913 ) ( not ( = ?auto_82912 ?auto_82913 ) ) ( not ( = ?auto_82912 ?auto_82914 ) ) ( not ( = ?auto_82912 ?auto_82915 ) ) ( not ( = ?auto_82912 ?auto_82916 ) ) ( not ( = ?auto_82912 ?auto_82917 ) ) ( not ( = ?auto_82912 ?auto_82918 ) ) ( not ( = ?auto_82912 ?auto_82919 ) ) ( not ( = ?auto_82912 ?auto_82920 ) ) ( not ( = ?auto_82912 ?auto_82921 ) ) ( not ( = ?auto_82913 ?auto_82914 ) ) ( not ( = ?auto_82913 ?auto_82915 ) ) ( not ( = ?auto_82913 ?auto_82916 ) ) ( not ( = ?auto_82913 ?auto_82917 ) ) ( not ( = ?auto_82913 ?auto_82918 ) ) ( not ( = ?auto_82913 ?auto_82919 ) ) ( not ( = ?auto_82913 ?auto_82920 ) ) ( not ( = ?auto_82913 ?auto_82921 ) ) ( not ( = ?auto_82914 ?auto_82915 ) ) ( not ( = ?auto_82914 ?auto_82916 ) ) ( not ( = ?auto_82914 ?auto_82917 ) ) ( not ( = ?auto_82914 ?auto_82918 ) ) ( not ( = ?auto_82914 ?auto_82919 ) ) ( not ( = ?auto_82914 ?auto_82920 ) ) ( not ( = ?auto_82914 ?auto_82921 ) ) ( not ( = ?auto_82915 ?auto_82916 ) ) ( not ( = ?auto_82915 ?auto_82917 ) ) ( not ( = ?auto_82915 ?auto_82918 ) ) ( not ( = ?auto_82915 ?auto_82919 ) ) ( not ( = ?auto_82915 ?auto_82920 ) ) ( not ( = ?auto_82915 ?auto_82921 ) ) ( not ( = ?auto_82916 ?auto_82917 ) ) ( not ( = ?auto_82916 ?auto_82918 ) ) ( not ( = ?auto_82916 ?auto_82919 ) ) ( not ( = ?auto_82916 ?auto_82920 ) ) ( not ( = ?auto_82916 ?auto_82921 ) ) ( not ( = ?auto_82917 ?auto_82918 ) ) ( not ( = ?auto_82917 ?auto_82919 ) ) ( not ( = ?auto_82917 ?auto_82920 ) ) ( not ( = ?auto_82917 ?auto_82921 ) ) ( not ( = ?auto_82918 ?auto_82919 ) ) ( not ( = ?auto_82918 ?auto_82920 ) ) ( not ( = ?auto_82918 ?auto_82921 ) ) ( not ( = ?auto_82919 ?auto_82920 ) ) ( not ( = ?auto_82919 ?auto_82921 ) ) ( not ( = ?auto_82920 ?auto_82921 ) ) ( ON ?auto_82919 ?auto_82920 ) ( ON ?auto_82918 ?auto_82919 ) ( ON ?auto_82917 ?auto_82918 ) ( ON ?auto_82916 ?auto_82917 ) ( CLEAR ?auto_82914 ) ( ON ?auto_82915 ?auto_82916 ) ( CLEAR ?auto_82915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82912 ?auto_82913 ?auto_82914 ?auto_82915 )
      ( MAKE-9PILE ?auto_82912 ?auto_82913 ?auto_82914 ?auto_82915 ?auto_82916 ?auto_82917 ?auto_82918 ?auto_82919 ?auto_82920 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82931 - BLOCK
      ?auto_82932 - BLOCK
      ?auto_82933 - BLOCK
      ?auto_82934 - BLOCK
      ?auto_82935 - BLOCK
      ?auto_82936 - BLOCK
      ?auto_82937 - BLOCK
      ?auto_82938 - BLOCK
      ?auto_82939 - BLOCK
    )
    :vars
    (
      ?auto_82940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82939 ?auto_82940 ) ( ON-TABLE ?auto_82931 ) ( ON ?auto_82932 ?auto_82931 ) ( ON ?auto_82933 ?auto_82932 ) ( not ( = ?auto_82931 ?auto_82932 ) ) ( not ( = ?auto_82931 ?auto_82933 ) ) ( not ( = ?auto_82931 ?auto_82934 ) ) ( not ( = ?auto_82931 ?auto_82935 ) ) ( not ( = ?auto_82931 ?auto_82936 ) ) ( not ( = ?auto_82931 ?auto_82937 ) ) ( not ( = ?auto_82931 ?auto_82938 ) ) ( not ( = ?auto_82931 ?auto_82939 ) ) ( not ( = ?auto_82931 ?auto_82940 ) ) ( not ( = ?auto_82932 ?auto_82933 ) ) ( not ( = ?auto_82932 ?auto_82934 ) ) ( not ( = ?auto_82932 ?auto_82935 ) ) ( not ( = ?auto_82932 ?auto_82936 ) ) ( not ( = ?auto_82932 ?auto_82937 ) ) ( not ( = ?auto_82932 ?auto_82938 ) ) ( not ( = ?auto_82932 ?auto_82939 ) ) ( not ( = ?auto_82932 ?auto_82940 ) ) ( not ( = ?auto_82933 ?auto_82934 ) ) ( not ( = ?auto_82933 ?auto_82935 ) ) ( not ( = ?auto_82933 ?auto_82936 ) ) ( not ( = ?auto_82933 ?auto_82937 ) ) ( not ( = ?auto_82933 ?auto_82938 ) ) ( not ( = ?auto_82933 ?auto_82939 ) ) ( not ( = ?auto_82933 ?auto_82940 ) ) ( not ( = ?auto_82934 ?auto_82935 ) ) ( not ( = ?auto_82934 ?auto_82936 ) ) ( not ( = ?auto_82934 ?auto_82937 ) ) ( not ( = ?auto_82934 ?auto_82938 ) ) ( not ( = ?auto_82934 ?auto_82939 ) ) ( not ( = ?auto_82934 ?auto_82940 ) ) ( not ( = ?auto_82935 ?auto_82936 ) ) ( not ( = ?auto_82935 ?auto_82937 ) ) ( not ( = ?auto_82935 ?auto_82938 ) ) ( not ( = ?auto_82935 ?auto_82939 ) ) ( not ( = ?auto_82935 ?auto_82940 ) ) ( not ( = ?auto_82936 ?auto_82937 ) ) ( not ( = ?auto_82936 ?auto_82938 ) ) ( not ( = ?auto_82936 ?auto_82939 ) ) ( not ( = ?auto_82936 ?auto_82940 ) ) ( not ( = ?auto_82937 ?auto_82938 ) ) ( not ( = ?auto_82937 ?auto_82939 ) ) ( not ( = ?auto_82937 ?auto_82940 ) ) ( not ( = ?auto_82938 ?auto_82939 ) ) ( not ( = ?auto_82938 ?auto_82940 ) ) ( not ( = ?auto_82939 ?auto_82940 ) ) ( ON ?auto_82938 ?auto_82939 ) ( ON ?auto_82937 ?auto_82938 ) ( ON ?auto_82936 ?auto_82937 ) ( ON ?auto_82935 ?auto_82936 ) ( CLEAR ?auto_82933 ) ( ON ?auto_82934 ?auto_82935 ) ( CLEAR ?auto_82934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82931 ?auto_82932 ?auto_82933 ?auto_82934 )
      ( MAKE-9PILE ?auto_82931 ?auto_82932 ?auto_82933 ?auto_82934 ?auto_82935 ?auto_82936 ?auto_82937 ?auto_82938 ?auto_82939 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82950 - BLOCK
      ?auto_82951 - BLOCK
      ?auto_82952 - BLOCK
      ?auto_82953 - BLOCK
      ?auto_82954 - BLOCK
      ?auto_82955 - BLOCK
      ?auto_82956 - BLOCK
      ?auto_82957 - BLOCK
      ?auto_82958 - BLOCK
    )
    :vars
    (
      ?auto_82959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82958 ?auto_82959 ) ( ON-TABLE ?auto_82950 ) ( ON ?auto_82951 ?auto_82950 ) ( not ( = ?auto_82950 ?auto_82951 ) ) ( not ( = ?auto_82950 ?auto_82952 ) ) ( not ( = ?auto_82950 ?auto_82953 ) ) ( not ( = ?auto_82950 ?auto_82954 ) ) ( not ( = ?auto_82950 ?auto_82955 ) ) ( not ( = ?auto_82950 ?auto_82956 ) ) ( not ( = ?auto_82950 ?auto_82957 ) ) ( not ( = ?auto_82950 ?auto_82958 ) ) ( not ( = ?auto_82950 ?auto_82959 ) ) ( not ( = ?auto_82951 ?auto_82952 ) ) ( not ( = ?auto_82951 ?auto_82953 ) ) ( not ( = ?auto_82951 ?auto_82954 ) ) ( not ( = ?auto_82951 ?auto_82955 ) ) ( not ( = ?auto_82951 ?auto_82956 ) ) ( not ( = ?auto_82951 ?auto_82957 ) ) ( not ( = ?auto_82951 ?auto_82958 ) ) ( not ( = ?auto_82951 ?auto_82959 ) ) ( not ( = ?auto_82952 ?auto_82953 ) ) ( not ( = ?auto_82952 ?auto_82954 ) ) ( not ( = ?auto_82952 ?auto_82955 ) ) ( not ( = ?auto_82952 ?auto_82956 ) ) ( not ( = ?auto_82952 ?auto_82957 ) ) ( not ( = ?auto_82952 ?auto_82958 ) ) ( not ( = ?auto_82952 ?auto_82959 ) ) ( not ( = ?auto_82953 ?auto_82954 ) ) ( not ( = ?auto_82953 ?auto_82955 ) ) ( not ( = ?auto_82953 ?auto_82956 ) ) ( not ( = ?auto_82953 ?auto_82957 ) ) ( not ( = ?auto_82953 ?auto_82958 ) ) ( not ( = ?auto_82953 ?auto_82959 ) ) ( not ( = ?auto_82954 ?auto_82955 ) ) ( not ( = ?auto_82954 ?auto_82956 ) ) ( not ( = ?auto_82954 ?auto_82957 ) ) ( not ( = ?auto_82954 ?auto_82958 ) ) ( not ( = ?auto_82954 ?auto_82959 ) ) ( not ( = ?auto_82955 ?auto_82956 ) ) ( not ( = ?auto_82955 ?auto_82957 ) ) ( not ( = ?auto_82955 ?auto_82958 ) ) ( not ( = ?auto_82955 ?auto_82959 ) ) ( not ( = ?auto_82956 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82958 ) ) ( not ( = ?auto_82956 ?auto_82959 ) ) ( not ( = ?auto_82957 ?auto_82958 ) ) ( not ( = ?auto_82957 ?auto_82959 ) ) ( not ( = ?auto_82958 ?auto_82959 ) ) ( ON ?auto_82957 ?auto_82958 ) ( ON ?auto_82956 ?auto_82957 ) ( ON ?auto_82955 ?auto_82956 ) ( ON ?auto_82954 ?auto_82955 ) ( ON ?auto_82953 ?auto_82954 ) ( CLEAR ?auto_82951 ) ( ON ?auto_82952 ?auto_82953 ) ( CLEAR ?auto_82952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82950 ?auto_82951 ?auto_82952 )
      ( MAKE-9PILE ?auto_82950 ?auto_82951 ?auto_82952 ?auto_82953 ?auto_82954 ?auto_82955 ?auto_82956 ?auto_82957 ?auto_82958 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82969 - BLOCK
      ?auto_82970 - BLOCK
      ?auto_82971 - BLOCK
      ?auto_82972 - BLOCK
      ?auto_82973 - BLOCK
      ?auto_82974 - BLOCK
      ?auto_82975 - BLOCK
      ?auto_82976 - BLOCK
      ?auto_82977 - BLOCK
    )
    :vars
    (
      ?auto_82978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82977 ?auto_82978 ) ( ON-TABLE ?auto_82969 ) ( ON ?auto_82970 ?auto_82969 ) ( not ( = ?auto_82969 ?auto_82970 ) ) ( not ( = ?auto_82969 ?auto_82971 ) ) ( not ( = ?auto_82969 ?auto_82972 ) ) ( not ( = ?auto_82969 ?auto_82973 ) ) ( not ( = ?auto_82969 ?auto_82974 ) ) ( not ( = ?auto_82969 ?auto_82975 ) ) ( not ( = ?auto_82969 ?auto_82976 ) ) ( not ( = ?auto_82969 ?auto_82977 ) ) ( not ( = ?auto_82969 ?auto_82978 ) ) ( not ( = ?auto_82970 ?auto_82971 ) ) ( not ( = ?auto_82970 ?auto_82972 ) ) ( not ( = ?auto_82970 ?auto_82973 ) ) ( not ( = ?auto_82970 ?auto_82974 ) ) ( not ( = ?auto_82970 ?auto_82975 ) ) ( not ( = ?auto_82970 ?auto_82976 ) ) ( not ( = ?auto_82970 ?auto_82977 ) ) ( not ( = ?auto_82970 ?auto_82978 ) ) ( not ( = ?auto_82971 ?auto_82972 ) ) ( not ( = ?auto_82971 ?auto_82973 ) ) ( not ( = ?auto_82971 ?auto_82974 ) ) ( not ( = ?auto_82971 ?auto_82975 ) ) ( not ( = ?auto_82971 ?auto_82976 ) ) ( not ( = ?auto_82971 ?auto_82977 ) ) ( not ( = ?auto_82971 ?auto_82978 ) ) ( not ( = ?auto_82972 ?auto_82973 ) ) ( not ( = ?auto_82972 ?auto_82974 ) ) ( not ( = ?auto_82972 ?auto_82975 ) ) ( not ( = ?auto_82972 ?auto_82976 ) ) ( not ( = ?auto_82972 ?auto_82977 ) ) ( not ( = ?auto_82972 ?auto_82978 ) ) ( not ( = ?auto_82973 ?auto_82974 ) ) ( not ( = ?auto_82973 ?auto_82975 ) ) ( not ( = ?auto_82973 ?auto_82976 ) ) ( not ( = ?auto_82973 ?auto_82977 ) ) ( not ( = ?auto_82973 ?auto_82978 ) ) ( not ( = ?auto_82974 ?auto_82975 ) ) ( not ( = ?auto_82974 ?auto_82976 ) ) ( not ( = ?auto_82974 ?auto_82977 ) ) ( not ( = ?auto_82974 ?auto_82978 ) ) ( not ( = ?auto_82975 ?auto_82976 ) ) ( not ( = ?auto_82975 ?auto_82977 ) ) ( not ( = ?auto_82975 ?auto_82978 ) ) ( not ( = ?auto_82976 ?auto_82977 ) ) ( not ( = ?auto_82976 ?auto_82978 ) ) ( not ( = ?auto_82977 ?auto_82978 ) ) ( ON ?auto_82976 ?auto_82977 ) ( ON ?auto_82975 ?auto_82976 ) ( ON ?auto_82974 ?auto_82975 ) ( ON ?auto_82973 ?auto_82974 ) ( ON ?auto_82972 ?auto_82973 ) ( CLEAR ?auto_82970 ) ( ON ?auto_82971 ?auto_82972 ) ( CLEAR ?auto_82971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82969 ?auto_82970 ?auto_82971 )
      ( MAKE-9PILE ?auto_82969 ?auto_82970 ?auto_82971 ?auto_82972 ?auto_82973 ?auto_82974 ?auto_82975 ?auto_82976 ?auto_82977 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_82988 - BLOCK
      ?auto_82989 - BLOCK
      ?auto_82990 - BLOCK
      ?auto_82991 - BLOCK
      ?auto_82992 - BLOCK
      ?auto_82993 - BLOCK
      ?auto_82994 - BLOCK
      ?auto_82995 - BLOCK
      ?auto_82996 - BLOCK
    )
    :vars
    (
      ?auto_82997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82996 ?auto_82997 ) ( ON-TABLE ?auto_82988 ) ( not ( = ?auto_82988 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82990 ) ) ( not ( = ?auto_82988 ?auto_82991 ) ) ( not ( = ?auto_82988 ?auto_82992 ) ) ( not ( = ?auto_82988 ?auto_82993 ) ) ( not ( = ?auto_82988 ?auto_82994 ) ) ( not ( = ?auto_82988 ?auto_82995 ) ) ( not ( = ?auto_82988 ?auto_82996 ) ) ( not ( = ?auto_82988 ?auto_82997 ) ) ( not ( = ?auto_82989 ?auto_82990 ) ) ( not ( = ?auto_82989 ?auto_82991 ) ) ( not ( = ?auto_82989 ?auto_82992 ) ) ( not ( = ?auto_82989 ?auto_82993 ) ) ( not ( = ?auto_82989 ?auto_82994 ) ) ( not ( = ?auto_82989 ?auto_82995 ) ) ( not ( = ?auto_82989 ?auto_82996 ) ) ( not ( = ?auto_82989 ?auto_82997 ) ) ( not ( = ?auto_82990 ?auto_82991 ) ) ( not ( = ?auto_82990 ?auto_82992 ) ) ( not ( = ?auto_82990 ?auto_82993 ) ) ( not ( = ?auto_82990 ?auto_82994 ) ) ( not ( = ?auto_82990 ?auto_82995 ) ) ( not ( = ?auto_82990 ?auto_82996 ) ) ( not ( = ?auto_82990 ?auto_82997 ) ) ( not ( = ?auto_82991 ?auto_82992 ) ) ( not ( = ?auto_82991 ?auto_82993 ) ) ( not ( = ?auto_82991 ?auto_82994 ) ) ( not ( = ?auto_82991 ?auto_82995 ) ) ( not ( = ?auto_82991 ?auto_82996 ) ) ( not ( = ?auto_82991 ?auto_82997 ) ) ( not ( = ?auto_82992 ?auto_82993 ) ) ( not ( = ?auto_82992 ?auto_82994 ) ) ( not ( = ?auto_82992 ?auto_82995 ) ) ( not ( = ?auto_82992 ?auto_82996 ) ) ( not ( = ?auto_82992 ?auto_82997 ) ) ( not ( = ?auto_82993 ?auto_82994 ) ) ( not ( = ?auto_82993 ?auto_82995 ) ) ( not ( = ?auto_82993 ?auto_82996 ) ) ( not ( = ?auto_82993 ?auto_82997 ) ) ( not ( = ?auto_82994 ?auto_82995 ) ) ( not ( = ?auto_82994 ?auto_82996 ) ) ( not ( = ?auto_82994 ?auto_82997 ) ) ( not ( = ?auto_82995 ?auto_82996 ) ) ( not ( = ?auto_82995 ?auto_82997 ) ) ( not ( = ?auto_82996 ?auto_82997 ) ) ( ON ?auto_82995 ?auto_82996 ) ( ON ?auto_82994 ?auto_82995 ) ( ON ?auto_82993 ?auto_82994 ) ( ON ?auto_82992 ?auto_82993 ) ( ON ?auto_82991 ?auto_82992 ) ( ON ?auto_82990 ?auto_82991 ) ( CLEAR ?auto_82988 ) ( ON ?auto_82989 ?auto_82990 ) ( CLEAR ?auto_82989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82988 ?auto_82989 )
      ( MAKE-9PILE ?auto_82988 ?auto_82989 ?auto_82990 ?auto_82991 ?auto_82992 ?auto_82993 ?auto_82994 ?auto_82995 ?auto_82996 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_83007 - BLOCK
      ?auto_83008 - BLOCK
      ?auto_83009 - BLOCK
      ?auto_83010 - BLOCK
      ?auto_83011 - BLOCK
      ?auto_83012 - BLOCK
      ?auto_83013 - BLOCK
      ?auto_83014 - BLOCK
      ?auto_83015 - BLOCK
    )
    :vars
    (
      ?auto_83016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83015 ?auto_83016 ) ( ON-TABLE ?auto_83007 ) ( not ( = ?auto_83007 ?auto_83008 ) ) ( not ( = ?auto_83007 ?auto_83009 ) ) ( not ( = ?auto_83007 ?auto_83010 ) ) ( not ( = ?auto_83007 ?auto_83011 ) ) ( not ( = ?auto_83007 ?auto_83012 ) ) ( not ( = ?auto_83007 ?auto_83013 ) ) ( not ( = ?auto_83007 ?auto_83014 ) ) ( not ( = ?auto_83007 ?auto_83015 ) ) ( not ( = ?auto_83007 ?auto_83016 ) ) ( not ( = ?auto_83008 ?auto_83009 ) ) ( not ( = ?auto_83008 ?auto_83010 ) ) ( not ( = ?auto_83008 ?auto_83011 ) ) ( not ( = ?auto_83008 ?auto_83012 ) ) ( not ( = ?auto_83008 ?auto_83013 ) ) ( not ( = ?auto_83008 ?auto_83014 ) ) ( not ( = ?auto_83008 ?auto_83015 ) ) ( not ( = ?auto_83008 ?auto_83016 ) ) ( not ( = ?auto_83009 ?auto_83010 ) ) ( not ( = ?auto_83009 ?auto_83011 ) ) ( not ( = ?auto_83009 ?auto_83012 ) ) ( not ( = ?auto_83009 ?auto_83013 ) ) ( not ( = ?auto_83009 ?auto_83014 ) ) ( not ( = ?auto_83009 ?auto_83015 ) ) ( not ( = ?auto_83009 ?auto_83016 ) ) ( not ( = ?auto_83010 ?auto_83011 ) ) ( not ( = ?auto_83010 ?auto_83012 ) ) ( not ( = ?auto_83010 ?auto_83013 ) ) ( not ( = ?auto_83010 ?auto_83014 ) ) ( not ( = ?auto_83010 ?auto_83015 ) ) ( not ( = ?auto_83010 ?auto_83016 ) ) ( not ( = ?auto_83011 ?auto_83012 ) ) ( not ( = ?auto_83011 ?auto_83013 ) ) ( not ( = ?auto_83011 ?auto_83014 ) ) ( not ( = ?auto_83011 ?auto_83015 ) ) ( not ( = ?auto_83011 ?auto_83016 ) ) ( not ( = ?auto_83012 ?auto_83013 ) ) ( not ( = ?auto_83012 ?auto_83014 ) ) ( not ( = ?auto_83012 ?auto_83015 ) ) ( not ( = ?auto_83012 ?auto_83016 ) ) ( not ( = ?auto_83013 ?auto_83014 ) ) ( not ( = ?auto_83013 ?auto_83015 ) ) ( not ( = ?auto_83013 ?auto_83016 ) ) ( not ( = ?auto_83014 ?auto_83015 ) ) ( not ( = ?auto_83014 ?auto_83016 ) ) ( not ( = ?auto_83015 ?auto_83016 ) ) ( ON ?auto_83014 ?auto_83015 ) ( ON ?auto_83013 ?auto_83014 ) ( ON ?auto_83012 ?auto_83013 ) ( ON ?auto_83011 ?auto_83012 ) ( ON ?auto_83010 ?auto_83011 ) ( ON ?auto_83009 ?auto_83010 ) ( CLEAR ?auto_83007 ) ( ON ?auto_83008 ?auto_83009 ) ( CLEAR ?auto_83008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83007 ?auto_83008 )
      ( MAKE-9PILE ?auto_83007 ?auto_83008 ?auto_83009 ?auto_83010 ?auto_83011 ?auto_83012 ?auto_83013 ?auto_83014 ?auto_83015 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_83026 - BLOCK
      ?auto_83027 - BLOCK
      ?auto_83028 - BLOCK
      ?auto_83029 - BLOCK
      ?auto_83030 - BLOCK
      ?auto_83031 - BLOCK
      ?auto_83032 - BLOCK
      ?auto_83033 - BLOCK
      ?auto_83034 - BLOCK
    )
    :vars
    (
      ?auto_83035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83034 ?auto_83035 ) ( not ( = ?auto_83026 ?auto_83027 ) ) ( not ( = ?auto_83026 ?auto_83028 ) ) ( not ( = ?auto_83026 ?auto_83029 ) ) ( not ( = ?auto_83026 ?auto_83030 ) ) ( not ( = ?auto_83026 ?auto_83031 ) ) ( not ( = ?auto_83026 ?auto_83032 ) ) ( not ( = ?auto_83026 ?auto_83033 ) ) ( not ( = ?auto_83026 ?auto_83034 ) ) ( not ( = ?auto_83026 ?auto_83035 ) ) ( not ( = ?auto_83027 ?auto_83028 ) ) ( not ( = ?auto_83027 ?auto_83029 ) ) ( not ( = ?auto_83027 ?auto_83030 ) ) ( not ( = ?auto_83027 ?auto_83031 ) ) ( not ( = ?auto_83027 ?auto_83032 ) ) ( not ( = ?auto_83027 ?auto_83033 ) ) ( not ( = ?auto_83027 ?auto_83034 ) ) ( not ( = ?auto_83027 ?auto_83035 ) ) ( not ( = ?auto_83028 ?auto_83029 ) ) ( not ( = ?auto_83028 ?auto_83030 ) ) ( not ( = ?auto_83028 ?auto_83031 ) ) ( not ( = ?auto_83028 ?auto_83032 ) ) ( not ( = ?auto_83028 ?auto_83033 ) ) ( not ( = ?auto_83028 ?auto_83034 ) ) ( not ( = ?auto_83028 ?auto_83035 ) ) ( not ( = ?auto_83029 ?auto_83030 ) ) ( not ( = ?auto_83029 ?auto_83031 ) ) ( not ( = ?auto_83029 ?auto_83032 ) ) ( not ( = ?auto_83029 ?auto_83033 ) ) ( not ( = ?auto_83029 ?auto_83034 ) ) ( not ( = ?auto_83029 ?auto_83035 ) ) ( not ( = ?auto_83030 ?auto_83031 ) ) ( not ( = ?auto_83030 ?auto_83032 ) ) ( not ( = ?auto_83030 ?auto_83033 ) ) ( not ( = ?auto_83030 ?auto_83034 ) ) ( not ( = ?auto_83030 ?auto_83035 ) ) ( not ( = ?auto_83031 ?auto_83032 ) ) ( not ( = ?auto_83031 ?auto_83033 ) ) ( not ( = ?auto_83031 ?auto_83034 ) ) ( not ( = ?auto_83031 ?auto_83035 ) ) ( not ( = ?auto_83032 ?auto_83033 ) ) ( not ( = ?auto_83032 ?auto_83034 ) ) ( not ( = ?auto_83032 ?auto_83035 ) ) ( not ( = ?auto_83033 ?auto_83034 ) ) ( not ( = ?auto_83033 ?auto_83035 ) ) ( not ( = ?auto_83034 ?auto_83035 ) ) ( ON ?auto_83033 ?auto_83034 ) ( ON ?auto_83032 ?auto_83033 ) ( ON ?auto_83031 ?auto_83032 ) ( ON ?auto_83030 ?auto_83031 ) ( ON ?auto_83029 ?auto_83030 ) ( ON ?auto_83028 ?auto_83029 ) ( ON ?auto_83027 ?auto_83028 ) ( ON ?auto_83026 ?auto_83027 ) ( CLEAR ?auto_83026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83026 )
      ( MAKE-9PILE ?auto_83026 ?auto_83027 ?auto_83028 ?auto_83029 ?auto_83030 ?auto_83031 ?auto_83032 ?auto_83033 ?auto_83034 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_83045 - BLOCK
      ?auto_83046 - BLOCK
      ?auto_83047 - BLOCK
      ?auto_83048 - BLOCK
      ?auto_83049 - BLOCK
      ?auto_83050 - BLOCK
      ?auto_83051 - BLOCK
      ?auto_83052 - BLOCK
      ?auto_83053 - BLOCK
    )
    :vars
    (
      ?auto_83054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83053 ?auto_83054 ) ( not ( = ?auto_83045 ?auto_83046 ) ) ( not ( = ?auto_83045 ?auto_83047 ) ) ( not ( = ?auto_83045 ?auto_83048 ) ) ( not ( = ?auto_83045 ?auto_83049 ) ) ( not ( = ?auto_83045 ?auto_83050 ) ) ( not ( = ?auto_83045 ?auto_83051 ) ) ( not ( = ?auto_83045 ?auto_83052 ) ) ( not ( = ?auto_83045 ?auto_83053 ) ) ( not ( = ?auto_83045 ?auto_83054 ) ) ( not ( = ?auto_83046 ?auto_83047 ) ) ( not ( = ?auto_83046 ?auto_83048 ) ) ( not ( = ?auto_83046 ?auto_83049 ) ) ( not ( = ?auto_83046 ?auto_83050 ) ) ( not ( = ?auto_83046 ?auto_83051 ) ) ( not ( = ?auto_83046 ?auto_83052 ) ) ( not ( = ?auto_83046 ?auto_83053 ) ) ( not ( = ?auto_83046 ?auto_83054 ) ) ( not ( = ?auto_83047 ?auto_83048 ) ) ( not ( = ?auto_83047 ?auto_83049 ) ) ( not ( = ?auto_83047 ?auto_83050 ) ) ( not ( = ?auto_83047 ?auto_83051 ) ) ( not ( = ?auto_83047 ?auto_83052 ) ) ( not ( = ?auto_83047 ?auto_83053 ) ) ( not ( = ?auto_83047 ?auto_83054 ) ) ( not ( = ?auto_83048 ?auto_83049 ) ) ( not ( = ?auto_83048 ?auto_83050 ) ) ( not ( = ?auto_83048 ?auto_83051 ) ) ( not ( = ?auto_83048 ?auto_83052 ) ) ( not ( = ?auto_83048 ?auto_83053 ) ) ( not ( = ?auto_83048 ?auto_83054 ) ) ( not ( = ?auto_83049 ?auto_83050 ) ) ( not ( = ?auto_83049 ?auto_83051 ) ) ( not ( = ?auto_83049 ?auto_83052 ) ) ( not ( = ?auto_83049 ?auto_83053 ) ) ( not ( = ?auto_83049 ?auto_83054 ) ) ( not ( = ?auto_83050 ?auto_83051 ) ) ( not ( = ?auto_83050 ?auto_83052 ) ) ( not ( = ?auto_83050 ?auto_83053 ) ) ( not ( = ?auto_83050 ?auto_83054 ) ) ( not ( = ?auto_83051 ?auto_83052 ) ) ( not ( = ?auto_83051 ?auto_83053 ) ) ( not ( = ?auto_83051 ?auto_83054 ) ) ( not ( = ?auto_83052 ?auto_83053 ) ) ( not ( = ?auto_83052 ?auto_83054 ) ) ( not ( = ?auto_83053 ?auto_83054 ) ) ( ON ?auto_83052 ?auto_83053 ) ( ON ?auto_83051 ?auto_83052 ) ( ON ?auto_83050 ?auto_83051 ) ( ON ?auto_83049 ?auto_83050 ) ( ON ?auto_83048 ?auto_83049 ) ( ON ?auto_83047 ?auto_83048 ) ( ON ?auto_83046 ?auto_83047 ) ( ON ?auto_83045 ?auto_83046 ) ( CLEAR ?auto_83045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83045 )
      ( MAKE-9PILE ?auto_83045 ?auto_83046 ?auto_83047 ?auto_83048 ?auto_83049 ?auto_83050 ?auto_83051 ?auto_83052 ?auto_83053 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83065 - BLOCK
      ?auto_83066 - BLOCK
      ?auto_83067 - BLOCK
      ?auto_83068 - BLOCK
      ?auto_83069 - BLOCK
      ?auto_83070 - BLOCK
      ?auto_83071 - BLOCK
      ?auto_83072 - BLOCK
      ?auto_83073 - BLOCK
      ?auto_83074 - BLOCK
    )
    :vars
    (
      ?auto_83075 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83073 ) ( ON ?auto_83074 ?auto_83075 ) ( CLEAR ?auto_83074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83065 ) ( ON ?auto_83066 ?auto_83065 ) ( ON ?auto_83067 ?auto_83066 ) ( ON ?auto_83068 ?auto_83067 ) ( ON ?auto_83069 ?auto_83068 ) ( ON ?auto_83070 ?auto_83069 ) ( ON ?auto_83071 ?auto_83070 ) ( ON ?auto_83072 ?auto_83071 ) ( ON ?auto_83073 ?auto_83072 ) ( not ( = ?auto_83065 ?auto_83066 ) ) ( not ( = ?auto_83065 ?auto_83067 ) ) ( not ( = ?auto_83065 ?auto_83068 ) ) ( not ( = ?auto_83065 ?auto_83069 ) ) ( not ( = ?auto_83065 ?auto_83070 ) ) ( not ( = ?auto_83065 ?auto_83071 ) ) ( not ( = ?auto_83065 ?auto_83072 ) ) ( not ( = ?auto_83065 ?auto_83073 ) ) ( not ( = ?auto_83065 ?auto_83074 ) ) ( not ( = ?auto_83065 ?auto_83075 ) ) ( not ( = ?auto_83066 ?auto_83067 ) ) ( not ( = ?auto_83066 ?auto_83068 ) ) ( not ( = ?auto_83066 ?auto_83069 ) ) ( not ( = ?auto_83066 ?auto_83070 ) ) ( not ( = ?auto_83066 ?auto_83071 ) ) ( not ( = ?auto_83066 ?auto_83072 ) ) ( not ( = ?auto_83066 ?auto_83073 ) ) ( not ( = ?auto_83066 ?auto_83074 ) ) ( not ( = ?auto_83066 ?auto_83075 ) ) ( not ( = ?auto_83067 ?auto_83068 ) ) ( not ( = ?auto_83067 ?auto_83069 ) ) ( not ( = ?auto_83067 ?auto_83070 ) ) ( not ( = ?auto_83067 ?auto_83071 ) ) ( not ( = ?auto_83067 ?auto_83072 ) ) ( not ( = ?auto_83067 ?auto_83073 ) ) ( not ( = ?auto_83067 ?auto_83074 ) ) ( not ( = ?auto_83067 ?auto_83075 ) ) ( not ( = ?auto_83068 ?auto_83069 ) ) ( not ( = ?auto_83068 ?auto_83070 ) ) ( not ( = ?auto_83068 ?auto_83071 ) ) ( not ( = ?auto_83068 ?auto_83072 ) ) ( not ( = ?auto_83068 ?auto_83073 ) ) ( not ( = ?auto_83068 ?auto_83074 ) ) ( not ( = ?auto_83068 ?auto_83075 ) ) ( not ( = ?auto_83069 ?auto_83070 ) ) ( not ( = ?auto_83069 ?auto_83071 ) ) ( not ( = ?auto_83069 ?auto_83072 ) ) ( not ( = ?auto_83069 ?auto_83073 ) ) ( not ( = ?auto_83069 ?auto_83074 ) ) ( not ( = ?auto_83069 ?auto_83075 ) ) ( not ( = ?auto_83070 ?auto_83071 ) ) ( not ( = ?auto_83070 ?auto_83072 ) ) ( not ( = ?auto_83070 ?auto_83073 ) ) ( not ( = ?auto_83070 ?auto_83074 ) ) ( not ( = ?auto_83070 ?auto_83075 ) ) ( not ( = ?auto_83071 ?auto_83072 ) ) ( not ( = ?auto_83071 ?auto_83073 ) ) ( not ( = ?auto_83071 ?auto_83074 ) ) ( not ( = ?auto_83071 ?auto_83075 ) ) ( not ( = ?auto_83072 ?auto_83073 ) ) ( not ( = ?auto_83072 ?auto_83074 ) ) ( not ( = ?auto_83072 ?auto_83075 ) ) ( not ( = ?auto_83073 ?auto_83074 ) ) ( not ( = ?auto_83073 ?auto_83075 ) ) ( not ( = ?auto_83074 ?auto_83075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83074 ?auto_83075 )
      ( !STACK ?auto_83074 ?auto_83073 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83086 - BLOCK
      ?auto_83087 - BLOCK
      ?auto_83088 - BLOCK
      ?auto_83089 - BLOCK
      ?auto_83090 - BLOCK
      ?auto_83091 - BLOCK
      ?auto_83092 - BLOCK
      ?auto_83093 - BLOCK
      ?auto_83094 - BLOCK
      ?auto_83095 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83094 ) ( ON-TABLE ?auto_83095 ) ( CLEAR ?auto_83095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83086 ) ( ON ?auto_83087 ?auto_83086 ) ( ON ?auto_83088 ?auto_83087 ) ( ON ?auto_83089 ?auto_83088 ) ( ON ?auto_83090 ?auto_83089 ) ( ON ?auto_83091 ?auto_83090 ) ( ON ?auto_83092 ?auto_83091 ) ( ON ?auto_83093 ?auto_83092 ) ( ON ?auto_83094 ?auto_83093 ) ( not ( = ?auto_83086 ?auto_83087 ) ) ( not ( = ?auto_83086 ?auto_83088 ) ) ( not ( = ?auto_83086 ?auto_83089 ) ) ( not ( = ?auto_83086 ?auto_83090 ) ) ( not ( = ?auto_83086 ?auto_83091 ) ) ( not ( = ?auto_83086 ?auto_83092 ) ) ( not ( = ?auto_83086 ?auto_83093 ) ) ( not ( = ?auto_83086 ?auto_83094 ) ) ( not ( = ?auto_83086 ?auto_83095 ) ) ( not ( = ?auto_83087 ?auto_83088 ) ) ( not ( = ?auto_83087 ?auto_83089 ) ) ( not ( = ?auto_83087 ?auto_83090 ) ) ( not ( = ?auto_83087 ?auto_83091 ) ) ( not ( = ?auto_83087 ?auto_83092 ) ) ( not ( = ?auto_83087 ?auto_83093 ) ) ( not ( = ?auto_83087 ?auto_83094 ) ) ( not ( = ?auto_83087 ?auto_83095 ) ) ( not ( = ?auto_83088 ?auto_83089 ) ) ( not ( = ?auto_83088 ?auto_83090 ) ) ( not ( = ?auto_83088 ?auto_83091 ) ) ( not ( = ?auto_83088 ?auto_83092 ) ) ( not ( = ?auto_83088 ?auto_83093 ) ) ( not ( = ?auto_83088 ?auto_83094 ) ) ( not ( = ?auto_83088 ?auto_83095 ) ) ( not ( = ?auto_83089 ?auto_83090 ) ) ( not ( = ?auto_83089 ?auto_83091 ) ) ( not ( = ?auto_83089 ?auto_83092 ) ) ( not ( = ?auto_83089 ?auto_83093 ) ) ( not ( = ?auto_83089 ?auto_83094 ) ) ( not ( = ?auto_83089 ?auto_83095 ) ) ( not ( = ?auto_83090 ?auto_83091 ) ) ( not ( = ?auto_83090 ?auto_83092 ) ) ( not ( = ?auto_83090 ?auto_83093 ) ) ( not ( = ?auto_83090 ?auto_83094 ) ) ( not ( = ?auto_83090 ?auto_83095 ) ) ( not ( = ?auto_83091 ?auto_83092 ) ) ( not ( = ?auto_83091 ?auto_83093 ) ) ( not ( = ?auto_83091 ?auto_83094 ) ) ( not ( = ?auto_83091 ?auto_83095 ) ) ( not ( = ?auto_83092 ?auto_83093 ) ) ( not ( = ?auto_83092 ?auto_83094 ) ) ( not ( = ?auto_83092 ?auto_83095 ) ) ( not ( = ?auto_83093 ?auto_83094 ) ) ( not ( = ?auto_83093 ?auto_83095 ) ) ( not ( = ?auto_83094 ?auto_83095 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_83095 )
      ( !STACK ?auto_83095 ?auto_83094 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83106 - BLOCK
      ?auto_83107 - BLOCK
      ?auto_83108 - BLOCK
      ?auto_83109 - BLOCK
      ?auto_83110 - BLOCK
      ?auto_83111 - BLOCK
      ?auto_83112 - BLOCK
      ?auto_83113 - BLOCK
      ?auto_83114 - BLOCK
      ?auto_83115 - BLOCK
    )
    :vars
    (
      ?auto_83116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83115 ?auto_83116 ) ( ON-TABLE ?auto_83106 ) ( ON ?auto_83107 ?auto_83106 ) ( ON ?auto_83108 ?auto_83107 ) ( ON ?auto_83109 ?auto_83108 ) ( ON ?auto_83110 ?auto_83109 ) ( ON ?auto_83111 ?auto_83110 ) ( ON ?auto_83112 ?auto_83111 ) ( ON ?auto_83113 ?auto_83112 ) ( not ( = ?auto_83106 ?auto_83107 ) ) ( not ( = ?auto_83106 ?auto_83108 ) ) ( not ( = ?auto_83106 ?auto_83109 ) ) ( not ( = ?auto_83106 ?auto_83110 ) ) ( not ( = ?auto_83106 ?auto_83111 ) ) ( not ( = ?auto_83106 ?auto_83112 ) ) ( not ( = ?auto_83106 ?auto_83113 ) ) ( not ( = ?auto_83106 ?auto_83114 ) ) ( not ( = ?auto_83106 ?auto_83115 ) ) ( not ( = ?auto_83106 ?auto_83116 ) ) ( not ( = ?auto_83107 ?auto_83108 ) ) ( not ( = ?auto_83107 ?auto_83109 ) ) ( not ( = ?auto_83107 ?auto_83110 ) ) ( not ( = ?auto_83107 ?auto_83111 ) ) ( not ( = ?auto_83107 ?auto_83112 ) ) ( not ( = ?auto_83107 ?auto_83113 ) ) ( not ( = ?auto_83107 ?auto_83114 ) ) ( not ( = ?auto_83107 ?auto_83115 ) ) ( not ( = ?auto_83107 ?auto_83116 ) ) ( not ( = ?auto_83108 ?auto_83109 ) ) ( not ( = ?auto_83108 ?auto_83110 ) ) ( not ( = ?auto_83108 ?auto_83111 ) ) ( not ( = ?auto_83108 ?auto_83112 ) ) ( not ( = ?auto_83108 ?auto_83113 ) ) ( not ( = ?auto_83108 ?auto_83114 ) ) ( not ( = ?auto_83108 ?auto_83115 ) ) ( not ( = ?auto_83108 ?auto_83116 ) ) ( not ( = ?auto_83109 ?auto_83110 ) ) ( not ( = ?auto_83109 ?auto_83111 ) ) ( not ( = ?auto_83109 ?auto_83112 ) ) ( not ( = ?auto_83109 ?auto_83113 ) ) ( not ( = ?auto_83109 ?auto_83114 ) ) ( not ( = ?auto_83109 ?auto_83115 ) ) ( not ( = ?auto_83109 ?auto_83116 ) ) ( not ( = ?auto_83110 ?auto_83111 ) ) ( not ( = ?auto_83110 ?auto_83112 ) ) ( not ( = ?auto_83110 ?auto_83113 ) ) ( not ( = ?auto_83110 ?auto_83114 ) ) ( not ( = ?auto_83110 ?auto_83115 ) ) ( not ( = ?auto_83110 ?auto_83116 ) ) ( not ( = ?auto_83111 ?auto_83112 ) ) ( not ( = ?auto_83111 ?auto_83113 ) ) ( not ( = ?auto_83111 ?auto_83114 ) ) ( not ( = ?auto_83111 ?auto_83115 ) ) ( not ( = ?auto_83111 ?auto_83116 ) ) ( not ( = ?auto_83112 ?auto_83113 ) ) ( not ( = ?auto_83112 ?auto_83114 ) ) ( not ( = ?auto_83112 ?auto_83115 ) ) ( not ( = ?auto_83112 ?auto_83116 ) ) ( not ( = ?auto_83113 ?auto_83114 ) ) ( not ( = ?auto_83113 ?auto_83115 ) ) ( not ( = ?auto_83113 ?auto_83116 ) ) ( not ( = ?auto_83114 ?auto_83115 ) ) ( not ( = ?auto_83114 ?auto_83116 ) ) ( not ( = ?auto_83115 ?auto_83116 ) ) ( CLEAR ?auto_83113 ) ( ON ?auto_83114 ?auto_83115 ) ( CLEAR ?auto_83114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_83106 ?auto_83107 ?auto_83108 ?auto_83109 ?auto_83110 ?auto_83111 ?auto_83112 ?auto_83113 ?auto_83114 )
      ( MAKE-10PILE ?auto_83106 ?auto_83107 ?auto_83108 ?auto_83109 ?auto_83110 ?auto_83111 ?auto_83112 ?auto_83113 ?auto_83114 ?auto_83115 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83127 - BLOCK
      ?auto_83128 - BLOCK
      ?auto_83129 - BLOCK
      ?auto_83130 - BLOCK
      ?auto_83131 - BLOCK
      ?auto_83132 - BLOCK
      ?auto_83133 - BLOCK
      ?auto_83134 - BLOCK
      ?auto_83135 - BLOCK
      ?auto_83136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83136 ) ( ON-TABLE ?auto_83127 ) ( ON ?auto_83128 ?auto_83127 ) ( ON ?auto_83129 ?auto_83128 ) ( ON ?auto_83130 ?auto_83129 ) ( ON ?auto_83131 ?auto_83130 ) ( ON ?auto_83132 ?auto_83131 ) ( ON ?auto_83133 ?auto_83132 ) ( ON ?auto_83134 ?auto_83133 ) ( not ( = ?auto_83127 ?auto_83128 ) ) ( not ( = ?auto_83127 ?auto_83129 ) ) ( not ( = ?auto_83127 ?auto_83130 ) ) ( not ( = ?auto_83127 ?auto_83131 ) ) ( not ( = ?auto_83127 ?auto_83132 ) ) ( not ( = ?auto_83127 ?auto_83133 ) ) ( not ( = ?auto_83127 ?auto_83134 ) ) ( not ( = ?auto_83127 ?auto_83135 ) ) ( not ( = ?auto_83127 ?auto_83136 ) ) ( not ( = ?auto_83128 ?auto_83129 ) ) ( not ( = ?auto_83128 ?auto_83130 ) ) ( not ( = ?auto_83128 ?auto_83131 ) ) ( not ( = ?auto_83128 ?auto_83132 ) ) ( not ( = ?auto_83128 ?auto_83133 ) ) ( not ( = ?auto_83128 ?auto_83134 ) ) ( not ( = ?auto_83128 ?auto_83135 ) ) ( not ( = ?auto_83128 ?auto_83136 ) ) ( not ( = ?auto_83129 ?auto_83130 ) ) ( not ( = ?auto_83129 ?auto_83131 ) ) ( not ( = ?auto_83129 ?auto_83132 ) ) ( not ( = ?auto_83129 ?auto_83133 ) ) ( not ( = ?auto_83129 ?auto_83134 ) ) ( not ( = ?auto_83129 ?auto_83135 ) ) ( not ( = ?auto_83129 ?auto_83136 ) ) ( not ( = ?auto_83130 ?auto_83131 ) ) ( not ( = ?auto_83130 ?auto_83132 ) ) ( not ( = ?auto_83130 ?auto_83133 ) ) ( not ( = ?auto_83130 ?auto_83134 ) ) ( not ( = ?auto_83130 ?auto_83135 ) ) ( not ( = ?auto_83130 ?auto_83136 ) ) ( not ( = ?auto_83131 ?auto_83132 ) ) ( not ( = ?auto_83131 ?auto_83133 ) ) ( not ( = ?auto_83131 ?auto_83134 ) ) ( not ( = ?auto_83131 ?auto_83135 ) ) ( not ( = ?auto_83131 ?auto_83136 ) ) ( not ( = ?auto_83132 ?auto_83133 ) ) ( not ( = ?auto_83132 ?auto_83134 ) ) ( not ( = ?auto_83132 ?auto_83135 ) ) ( not ( = ?auto_83132 ?auto_83136 ) ) ( not ( = ?auto_83133 ?auto_83134 ) ) ( not ( = ?auto_83133 ?auto_83135 ) ) ( not ( = ?auto_83133 ?auto_83136 ) ) ( not ( = ?auto_83134 ?auto_83135 ) ) ( not ( = ?auto_83134 ?auto_83136 ) ) ( not ( = ?auto_83135 ?auto_83136 ) ) ( CLEAR ?auto_83134 ) ( ON ?auto_83135 ?auto_83136 ) ( CLEAR ?auto_83135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_83127 ?auto_83128 ?auto_83129 ?auto_83130 ?auto_83131 ?auto_83132 ?auto_83133 ?auto_83134 ?auto_83135 )
      ( MAKE-10PILE ?auto_83127 ?auto_83128 ?auto_83129 ?auto_83130 ?auto_83131 ?auto_83132 ?auto_83133 ?auto_83134 ?auto_83135 ?auto_83136 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83147 - BLOCK
      ?auto_83148 - BLOCK
      ?auto_83149 - BLOCK
      ?auto_83150 - BLOCK
      ?auto_83151 - BLOCK
      ?auto_83152 - BLOCK
      ?auto_83153 - BLOCK
      ?auto_83154 - BLOCK
      ?auto_83155 - BLOCK
      ?auto_83156 - BLOCK
    )
    :vars
    (
      ?auto_83157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83156 ?auto_83157 ) ( ON-TABLE ?auto_83147 ) ( ON ?auto_83148 ?auto_83147 ) ( ON ?auto_83149 ?auto_83148 ) ( ON ?auto_83150 ?auto_83149 ) ( ON ?auto_83151 ?auto_83150 ) ( ON ?auto_83152 ?auto_83151 ) ( ON ?auto_83153 ?auto_83152 ) ( not ( = ?auto_83147 ?auto_83148 ) ) ( not ( = ?auto_83147 ?auto_83149 ) ) ( not ( = ?auto_83147 ?auto_83150 ) ) ( not ( = ?auto_83147 ?auto_83151 ) ) ( not ( = ?auto_83147 ?auto_83152 ) ) ( not ( = ?auto_83147 ?auto_83153 ) ) ( not ( = ?auto_83147 ?auto_83154 ) ) ( not ( = ?auto_83147 ?auto_83155 ) ) ( not ( = ?auto_83147 ?auto_83156 ) ) ( not ( = ?auto_83147 ?auto_83157 ) ) ( not ( = ?auto_83148 ?auto_83149 ) ) ( not ( = ?auto_83148 ?auto_83150 ) ) ( not ( = ?auto_83148 ?auto_83151 ) ) ( not ( = ?auto_83148 ?auto_83152 ) ) ( not ( = ?auto_83148 ?auto_83153 ) ) ( not ( = ?auto_83148 ?auto_83154 ) ) ( not ( = ?auto_83148 ?auto_83155 ) ) ( not ( = ?auto_83148 ?auto_83156 ) ) ( not ( = ?auto_83148 ?auto_83157 ) ) ( not ( = ?auto_83149 ?auto_83150 ) ) ( not ( = ?auto_83149 ?auto_83151 ) ) ( not ( = ?auto_83149 ?auto_83152 ) ) ( not ( = ?auto_83149 ?auto_83153 ) ) ( not ( = ?auto_83149 ?auto_83154 ) ) ( not ( = ?auto_83149 ?auto_83155 ) ) ( not ( = ?auto_83149 ?auto_83156 ) ) ( not ( = ?auto_83149 ?auto_83157 ) ) ( not ( = ?auto_83150 ?auto_83151 ) ) ( not ( = ?auto_83150 ?auto_83152 ) ) ( not ( = ?auto_83150 ?auto_83153 ) ) ( not ( = ?auto_83150 ?auto_83154 ) ) ( not ( = ?auto_83150 ?auto_83155 ) ) ( not ( = ?auto_83150 ?auto_83156 ) ) ( not ( = ?auto_83150 ?auto_83157 ) ) ( not ( = ?auto_83151 ?auto_83152 ) ) ( not ( = ?auto_83151 ?auto_83153 ) ) ( not ( = ?auto_83151 ?auto_83154 ) ) ( not ( = ?auto_83151 ?auto_83155 ) ) ( not ( = ?auto_83151 ?auto_83156 ) ) ( not ( = ?auto_83151 ?auto_83157 ) ) ( not ( = ?auto_83152 ?auto_83153 ) ) ( not ( = ?auto_83152 ?auto_83154 ) ) ( not ( = ?auto_83152 ?auto_83155 ) ) ( not ( = ?auto_83152 ?auto_83156 ) ) ( not ( = ?auto_83152 ?auto_83157 ) ) ( not ( = ?auto_83153 ?auto_83154 ) ) ( not ( = ?auto_83153 ?auto_83155 ) ) ( not ( = ?auto_83153 ?auto_83156 ) ) ( not ( = ?auto_83153 ?auto_83157 ) ) ( not ( = ?auto_83154 ?auto_83155 ) ) ( not ( = ?auto_83154 ?auto_83156 ) ) ( not ( = ?auto_83154 ?auto_83157 ) ) ( not ( = ?auto_83155 ?auto_83156 ) ) ( not ( = ?auto_83155 ?auto_83157 ) ) ( not ( = ?auto_83156 ?auto_83157 ) ) ( ON ?auto_83155 ?auto_83156 ) ( CLEAR ?auto_83153 ) ( ON ?auto_83154 ?auto_83155 ) ( CLEAR ?auto_83154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_83147 ?auto_83148 ?auto_83149 ?auto_83150 ?auto_83151 ?auto_83152 ?auto_83153 ?auto_83154 )
      ( MAKE-10PILE ?auto_83147 ?auto_83148 ?auto_83149 ?auto_83150 ?auto_83151 ?auto_83152 ?auto_83153 ?auto_83154 ?auto_83155 ?auto_83156 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83168 - BLOCK
      ?auto_83169 - BLOCK
      ?auto_83170 - BLOCK
      ?auto_83171 - BLOCK
      ?auto_83172 - BLOCK
      ?auto_83173 - BLOCK
      ?auto_83174 - BLOCK
      ?auto_83175 - BLOCK
      ?auto_83176 - BLOCK
      ?auto_83177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83177 ) ( ON-TABLE ?auto_83168 ) ( ON ?auto_83169 ?auto_83168 ) ( ON ?auto_83170 ?auto_83169 ) ( ON ?auto_83171 ?auto_83170 ) ( ON ?auto_83172 ?auto_83171 ) ( ON ?auto_83173 ?auto_83172 ) ( ON ?auto_83174 ?auto_83173 ) ( not ( = ?auto_83168 ?auto_83169 ) ) ( not ( = ?auto_83168 ?auto_83170 ) ) ( not ( = ?auto_83168 ?auto_83171 ) ) ( not ( = ?auto_83168 ?auto_83172 ) ) ( not ( = ?auto_83168 ?auto_83173 ) ) ( not ( = ?auto_83168 ?auto_83174 ) ) ( not ( = ?auto_83168 ?auto_83175 ) ) ( not ( = ?auto_83168 ?auto_83176 ) ) ( not ( = ?auto_83168 ?auto_83177 ) ) ( not ( = ?auto_83169 ?auto_83170 ) ) ( not ( = ?auto_83169 ?auto_83171 ) ) ( not ( = ?auto_83169 ?auto_83172 ) ) ( not ( = ?auto_83169 ?auto_83173 ) ) ( not ( = ?auto_83169 ?auto_83174 ) ) ( not ( = ?auto_83169 ?auto_83175 ) ) ( not ( = ?auto_83169 ?auto_83176 ) ) ( not ( = ?auto_83169 ?auto_83177 ) ) ( not ( = ?auto_83170 ?auto_83171 ) ) ( not ( = ?auto_83170 ?auto_83172 ) ) ( not ( = ?auto_83170 ?auto_83173 ) ) ( not ( = ?auto_83170 ?auto_83174 ) ) ( not ( = ?auto_83170 ?auto_83175 ) ) ( not ( = ?auto_83170 ?auto_83176 ) ) ( not ( = ?auto_83170 ?auto_83177 ) ) ( not ( = ?auto_83171 ?auto_83172 ) ) ( not ( = ?auto_83171 ?auto_83173 ) ) ( not ( = ?auto_83171 ?auto_83174 ) ) ( not ( = ?auto_83171 ?auto_83175 ) ) ( not ( = ?auto_83171 ?auto_83176 ) ) ( not ( = ?auto_83171 ?auto_83177 ) ) ( not ( = ?auto_83172 ?auto_83173 ) ) ( not ( = ?auto_83172 ?auto_83174 ) ) ( not ( = ?auto_83172 ?auto_83175 ) ) ( not ( = ?auto_83172 ?auto_83176 ) ) ( not ( = ?auto_83172 ?auto_83177 ) ) ( not ( = ?auto_83173 ?auto_83174 ) ) ( not ( = ?auto_83173 ?auto_83175 ) ) ( not ( = ?auto_83173 ?auto_83176 ) ) ( not ( = ?auto_83173 ?auto_83177 ) ) ( not ( = ?auto_83174 ?auto_83175 ) ) ( not ( = ?auto_83174 ?auto_83176 ) ) ( not ( = ?auto_83174 ?auto_83177 ) ) ( not ( = ?auto_83175 ?auto_83176 ) ) ( not ( = ?auto_83175 ?auto_83177 ) ) ( not ( = ?auto_83176 ?auto_83177 ) ) ( ON ?auto_83176 ?auto_83177 ) ( CLEAR ?auto_83174 ) ( ON ?auto_83175 ?auto_83176 ) ( CLEAR ?auto_83175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_83168 ?auto_83169 ?auto_83170 ?auto_83171 ?auto_83172 ?auto_83173 ?auto_83174 ?auto_83175 )
      ( MAKE-10PILE ?auto_83168 ?auto_83169 ?auto_83170 ?auto_83171 ?auto_83172 ?auto_83173 ?auto_83174 ?auto_83175 ?auto_83176 ?auto_83177 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83188 - BLOCK
      ?auto_83189 - BLOCK
      ?auto_83190 - BLOCK
      ?auto_83191 - BLOCK
      ?auto_83192 - BLOCK
      ?auto_83193 - BLOCK
      ?auto_83194 - BLOCK
      ?auto_83195 - BLOCK
      ?auto_83196 - BLOCK
      ?auto_83197 - BLOCK
    )
    :vars
    (
      ?auto_83198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83197 ?auto_83198 ) ( ON-TABLE ?auto_83188 ) ( ON ?auto_83189 ?auto_83188 ) ( ON ?auto_83190 ?auto_83189 ) ( ON ?auto_83191 ?auto_83190 ) ( ON ?auto_83192 ?auto_83191 ) ( ON ?auto_83193 ?auto_83192 ) ( not ( = ?auto_83188 ?auto_83189 ) ) ( not ( = ?auto_83188 ?auto_83190 ) ) ( not ( = ?auto_83188 ?auto_83191 ) ) ( not ( = ?auto_83188 ?auto_83192 ) ) ( not ( = ?auto_83188 ?auto_83193 ) ) ( not ( = ?auto_83188 ?auto_83194 ) ) ( not ( = ?auto_83188 ?auto_83195 ) ) ( not ( = ?auto_83188 ?auto_83196 ) ) ( not ( = ?auto_83188 ?auto_83197 ) ) ( not ( = ?auto_83188 ?auto_83198 ) ) ( not ( = ?auto_83189 ?auto_83190 ) ) ( not ( = ?auto_83189 ?auto_83191 ) ) ( not ( = ?auto_83189 ?auto_83192 ) ) ( not ( = ?auto_83189 ?auto_83193 ) ) ( not ( = ?auto_83189 ?auto_83194 ) ) ( not ( = ?auto_83189 ?auto_83195 ) ) ( not ( = ?auto_83189 ?auto_83196 ) ) ( not ( = ?auto_83189 ?auto_83197 ) ) ( not ( = ?auto_83189 ?auto_83198 ) ) ( not ( = ?auto_83190 ?auto_83191 ) ) ( not ( = ?auto_83190 ?auto_83192 ) ) ( not ( = ?auto_83190 ?auto_83193 ) ) ( not ( = ?auto_83190 ?auto_83194 ) ) ( not ( = ?auto_83190 ?auto_83195 ) ) ( not ( = ?auto_83190 ?auto_83196 ) ) ( not ( = ?auto_83190 ?auto_83197 ) ) ( not ( = ?auto_83190 ?auto_83198 ) ) ( not ( = ?auto_83191 ?auto_83192 ) ) ( not ( = ?auto_83191 ?auto_83193 ) ) ( not ( = ?auto_83191 ?auto_83194 ) ) ( not ( = ?auto_83191 ?auto_83195 ) ) ( not ( = ?auto_83191 ?auto_83196 ) ) ( not ( = ?auto_83191 ?auto_83197 ) ) ( not ( = ?auto_83191 ?auto_83198 ) ) ( not ( = ?auto_83192 ?auto_83193 ) ) ( not ( = ?auto_83192 ?auto_83194 ) ) ( not ( = ?auto_83192 ?auto_83195 ) ) ( not ( = ?auto_83192 ?auto_83196 ) ) ( not ( = ?auto_83192 ?auto_83197 ) ) ( not ( = ?auto_83192 ?auto_83198 ) ) ( not ( = ?auto_83193 ?auto_83194 ) ) ( not ( = ?auto_83193 ?auto_83195 ) ) ( not ( = ?auto_83193 ?auto_83196 ) ) ( not ( = ?auto_83193 ?auto_83197 ) ) ( not ( = ?auto_83193 ?auto_83198 ) ) ( not ( = ?auto_83194 ?auto_83195 ) ) ( not ( = ?auto_83194 ?auto_83196 ) ) ( not ( = ?auto_83194 ?auto_83197 ) ) ( not ( = ?auto_83194 ?auto_83198 ) ) ( not ( = ?auto_83195 ?auto_83196 ) ) ( not ( = ?auto_83195 ?auto_83197 ) ) ( not ( = ?auto_83195 ?auto_83198 ) ) ( not ( = ?auto_83196 ?auto_83197 ) ) ( not ( = ?auto_83196 ?auto_83198 ) ) ( not ( = ?auto_83197 ?auto_83198 ) ) ( ON ?auto_83196 ?auto_83197 ) ( ON ?auto_83195 ?auto_83196 ) ( CLEAR ?auto_83193 ) ( ON ?auto_83194 ?auto_83195 ) ( CLEAR ?auto_83194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83188 ?auto_83189 ?auto_83190 ?auto_83191 ?auto_83192 ?auto_83193 ?auto_83194 )
      ( MAKE-10PILE ?auto_83188 ?auto_83189 ?auto_83190 ?auto_83191 ?auto_83192 ?auto_83193 ?auto_83194 ?auto_83195 ?auto_83196 ?auto_83197 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83209 - BLOCK
      ?auto_83210 - BLOCK
      ?auto_83211 - BLOCK
      ?auto_83212 - BLOCK
      ?auto_83213 - BLOCK
      ?auto_83214 - BLOCK
      ?auto_83215 - BLOCK
      ?auto_83216 - BLOCK
      ?auto_83217 - BLOCK
      ?auto_83218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83218 ) ( ON-TABLE ?auto_83209 ) ( ON ?auto_83210 ?auto_83209 ) ( ON ?auto_83211 ?auto_83210 ) ( ON ?auto_83212 ?auto_83211 ) ( ON ?auto_83213 ?auto_83212 ) ( ON ?auto_83214 ?auto_83213 ) ( not ( = ?auto_83209 ?auto_83210 ) ) ( not ( = ?auto_83209 ?auto_83211 ) ) ( not ( = ?auto_83209 ?auto_83212 ) ) ( not ( = ?auto_83209 ?auto_83213 ) ) ( not ( = ?auto_83209 ?auto_83214 ) ) ( not ( = ?auto_83209 ?auto_83215 ) ) ( not ( = ?auto_83209 ?auto_83216 ) ) ( not ( = ?auto_83209 ?auto_83217 ) ) ( not ( = ?auto_83209 ?auto_83218 ) ) ( not ( = ?auto_83210 ?auto_83211 ) ) ( not ( = ?auto_83210 ?auto_83212 ) ) ( not ( = ?auto_83210 ?auto_83213 ) ) ( not ( = ?auto_83210 ?auto_83214 ) ) ( not ( = ?auto_83210 ?auto_83215 ) ) ( not ( = ?auto_83210 ?auto_83216 ) ) ( not ( = ?auto_83210 ?auto_83217 ) ) ( not ( = ?auto_83210 ?auto_83218 ) ) ( not ( = ?auto_83211 ?auto_83212 ) ) ( not ( = ?auto_83211 ?auto_83213 ) ) ( not ( = ?auto_83211 ?auto_83214 ) ) ( not ( = ?auto_83211 ?auto_83215 ) ) ( not ( = ?auto_83211 ?auto_83216 ) ) ( not ( = ?auto_83211 ?auto_83217 ) ) ( not ( = ?auto_83211 ?auto_83218 ) ) ( not ( = ?auto_83212 ?auto_83213 ) ) ( not ( = ?auto_83212 ?auto_83214 ) ) ( not ( = ?auto_83212 ?auto_83215 ) ) ( not ( = ?auto_83212 ?auto_83216 ) ) ( not ( = ?auto_83212 ?auto_83217 ) ) ( not ( = ?auto_83212 ?auto_83218 ) ) ( not ( = ?auto_83213 ?auto_83214 ) ) ( not ( = ?auto_83213 ?auto_83215 ) ) ( not ( = ?auto_83213 ?auto_83216 ) ) ( not ( = ?auto_83213 ?auto_83217 ) ) ( not ( = ?auto_83213 ?auto_83218 ) ) ( not ( = ?auto_83214 ?auto_83215 ) ) ( not ( = ?auto_83214 ?auto_83216 ) ) ( not ( = ?auto_83214 ?auto_83217 ) ) ( not ( = ?auto_83214 ?auto_83218 ) ) ( not ( = ?auto_83215 ?auto_83216 ) ) ( not ( = ?auto_83215 ?auto_83217 ) ) ( not ( = ?auto_83215 ?auto_83218 ) ) ( not ( = ?auto_83216 ?auto_83217 ) ) ( not ( = ?auto_83216 ?auto_83218 ) ) ( not ( = ?auto_83217 ?auto_83218 ) ) ( ON ?auto_83217 ?auto_83218 ) ( ON ?auto_83216 ?auto_83217 ) ( CLEAR ?auto_83214 ) ( ON ?auto_83215 ?auto_83216 ) ( CLEAR ?auto_83215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83209 ?auto_83210 ?auto_83211 ?auto_83212 ?auto_83213 ?auto_83214 ?auto_83215 )
      ( MAKE-10PILE ?auto_83209 ?auto_83210 ?auto_83211 ?auto_83212 ?auto_83213 ?auto_83214 ?auto_83215 ?auto_83216 ?auto_83217 ?auto_83218 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83229 - BLOCK
      ?auto_83230 - BLOCK
      ?auto_83231 - BLOCK
      ?auto_83232 - BLOCK
      ?auto_83233 - BLOCK
      ?auto_83234 - BLOCK
      ?auto_83235 - BLOCK
      ?auto_83236 - BLOCK
      ?auto_83237 - BLOCK
      ?auto_83238 - BLOCK
    )
    :vars
    (
      ?auto_83239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83238 ?auto_83239 ) ( ON-TABLE ?auto_83229 ) ( ON ?auto_83230 ?auto_83229 ) ( ON ?auto_83231 ?auto_83230 ) ( ON ?auto_83232 ?auto_83231 ) ( ON ?auto_83233 ?auto_83232 ) ( not ( = ?auto_83229 ?auto_83230 ) ) ( not ( = ?auto_83229 ?auto_83231 ) ) ( not ( = ?auto_83229 ?auto_83232 ) ) ( not ( = ?auto_83229 ?auto_83233 ) ) ( not ( = ?auto_83229 ?auto_83234 ) ) ( not ( = ?auto_83229 ?auto_83235 ) ) ( not ( = ?auto_83229 ?auto_83236 ) ) ( not ( = ?auto_83229 ?auto_83237 ) ) ( not ( = ?auto_83229 ?auto_83238 ) ) ( not ( = ?auto_83229 ?auto_83239 ) ) ( not ( = ?auto_83230 ?auto_83231 ) ) ( not ( = ?auto_83230 ?auto_83232 ) ) ( not ( = ?auto_83230 ?auto_83233 ) ) ( not ( = ?auto_83230 ?auto_83234 ) ) ( not ( = ?auto_83230 ?auto_83235 ) ) ( not ( = ?auto_83230 ?auto_83236 ) ) ( not ( = ?auto_83230 ?auto_83237 ) ) ( not ( = ?auto_83230 ?auto_83238 ) ) ( not ( = ?auto_83230 ?auto_83239 ) ) ( not ( = ?auto_83231 ?auto_83232 ) ) ( not ( = ?auto_83231 ?auto_83233 ) ) ( not ( = ?auto_83231 ?auto_83234 ) ) ( not ( = ?auto_83231 ?auto_83235 ) ) ( not ( = ?auto_83231 ?auto_83236 ) ) ( not ( = ?auto_83231 ?auto_83237 ) ) ( not ( = ?auto_83231 ?auto_83238 ) ) ( not ( = ?auto_83231 ?auto_83239 ) ) ( not ( = ?auto_83232 ?auto_83233 ) ) ( not ( = ?auto_83232 ?auto_83234 ) ) ( not ( = ?auto_83232 ?auto_83235 ) ) ( not ( = ?auto_83232 ?auto_83236 ) ) ( not ( = ?auto_83232 ?auto_83237 ) ) ( not ( = ?auto_83232 ?auto_83238 ) ) ( not ( = ?auto_83232 ?auto_83239 ) ) ( not ( = ?auto_83233 ?auto_83234 ) ) ( not ( = ?auto_83233 ?auto_83235 ) ) ( not ( = ?auto_83233 ?auto_83236 ) ) ( not ( = ?auto_83233 ?auto_83237 ) ) ( not ( = ?auto_83233 ?auto_83238 ) ) ( not ( = ?auto_83233 ?auto_83239 ) ) ( not ( = ?auto_83234 ?auto_83235 ) ) ( not ( = ?auto_83234 ?auto_83236 ) ) ( not ( = ?auto_83234 ?auto_83237 ) ) ( not ( = ?auto_83234 ?auto_83238 ) ) ( not ( = ?auto_83234 ?auto_83239 ) ) ( not ( = ?auto_83235 ?auto_83236 ) ) ( not ( = ?auto_83235 ?auto_83237 ) ) ( not ( = ?auto_83235 ?auto_83238 ) ) ( not ( = ?auto_83235 ?auto_83239 ) ) ( not ( = ?auto_83236 ?auto_83237 ) ) ( not ( = ?auto_83236 ?auto_83238 ) ) ( not ( = ?auto_83236 ?auto_83239 ) ) ( not ( = ?auto_83237 ?auto_83238 ) ) ( not ( = ?auto_83237 ?auto_83239 ) ) ( not ( = ?auto_83238 ?auto_83239 ) ) ( ON ?auto_83237 ?auto_83238 ) ( ON ?auto_83236 ?auto_83237 ) ( ON ?auto_83235 ?auto_83236 ) ( CLEAR ?auto_83233 ) ( ON ?auto_83234 ?auto_83235 ) ( CLEAR ?auto_83234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83229 ?auto_83230 ?auto_83231 ?auto_83232 ?auto_83233 ?auto_83234 )
      ( MAKE-10PILE ?auto_83229 ?auto_83230 ?auto_83231 ?auto_83232 ?auto_83233 ?auto_83234 ?auto_83235 ?auto_83236 ?auto_83237 ?auto_83238 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83250 - BLOCK
      ?auto_83251 - BLOCK
      ?auto_83252 - BLOCK
      ?auto_83253 - BLOCK
      ?auto_83254 - BLOCK
      ?auto_83255 - BLOCK
      ?auto_83256 - BLOCK
      ?auto_83257 - BLOCK
      ?auto_83258 - BLOCK
      ?auto_83259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83259 ) ( ON-TABLE ?auto_83250 ) ( ON ?auto_83251 ?auto_83250 ) ( ON ?auto_83252 ?auto_83251 ) ( ON ?auto_83253 ?auto_83252 ) ( ON ?auto_83254 ?auto_83253 ) ( not ( = ?auto_83250 ?auto_83251 ) ) ( not ( = ?auto_83250 ?auto_83252 ) ) ( not ( = ?auto_83250 ?auto_83253 ) ) ( not ( = ?auto_83250 ?auto_83254 ) ) ( not ( = ?auto_83250 ?auto_83255 ) ) ( not ( = ?auto_83250 ?auto_83256 ) ) ( not ( = ?auto_83250 ?auto_83257 ) ) ( not ( = ?auto_83250 ?auto_83258 ) ) ( not ( = ?auto_83250 ?auto_83259 ) ) ( not ( = ?auto_83251 ?auto_83252 ) ) ( not ( = ?auto_83251 ?auto_83253 ) ) ( not ( = ?auto_83251 ?auto_83254 ) ) ( not ( = ?auto_83251 ?auto_83255 ) ) ( not ( = ?auto_83251 ?auto_83256 ) ) ( not ( = ?auto_83251 ?auto_83257 ) ) ( not ( = ?auto_83251 ?auto_83258 ) ) ( not ( = ?auto_83251 ?auto_83259 ) ) ( not ( = ?auto_83252 ?auto_83253 ) ) ( not ( = ?auto_83252 ?auto_83254 ) ) ( not ( = ?auto_83252 ?auto_83255 ) ) ( not ( = ?auto_83252 ?auto_83256 ) ) ( not ( = ?auto_83252 ?auto_83257 ) ) ( not ( = ?auto_83252 ?auto_83258 ) ) ( not ( = ?auto_83252 ?auto_83259 ) ) ( not ( = ?auto_83253 ?auto_83254 ) ) ( not ( = ?auto_83253 ?auto_83255 ) ) ( not ( = ?auto_83253 ?auto_83256 ) ) ( not ( = ?auto_83253 ?auto_83257 ) ) ( not ( = ?auto_83253 ?auto_83258 ) ) ( not ( = ?auto_83253 ?auto_83259 ) ) ( not ( = ?auto_83254 ?auto_83255 ) ) ( not ( = ?auto_83254 ?auto_83256 ) ) ( not ( = ?auto_83254 ?auto_83257 ) ) ( not ( = ?auto_83254 ?auto_83258 ) ) ( not ( = ?auto_83254 ?auto_83259 ) ) ( not ( = ?auto_83255 ?auto_83256 ) ) ( not ( = ?auto_83255 ?auto_83257 ) ) ( not ( = ?auto_83255 ?auto_83258 ) ) ( not ( = ?auto_83255 ?auto_83259 ) ) ( not ( = ?auto_83256 ?auto_83257 ) ) ( not ( = ?auto_83256 ?auto_83258 ) ) ( not ( = ?auto_83256 ?auto_83259 ) ) ( not ( = ?auto_83257 ?auto_83258 ) ) ( not ( = ?auto_83257 ?auto_83259 ) ) ( not ( = ?auto_83258 ?auto_83259 ) ) ( ON ?auto_83258 ?auto_83259 ) ( ON ?auto_83257 ?auto_83258 ) ( ON ?auto_83256 ?auto_83257 ) ( CLEAR ?auto_83254 ) ( ON ?auto_83255 ?auto_83256 ) ( CLEAR ?auto_83255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83250 ?auto_83251 ?auto_83252 ?auto_83253 ?auto_83254 ?auto_83255 )
      ( MAKE-10PILE ?auto_83250 ?auto_83251 ?auto_83252 ?auto_83253 ?auto_83254 ?auto_83255 ?auto_83256 ?auto_83257 ?auto_83258 ?auto_83259 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83270 - BLOCK
      ?auto_83271 - BLOCK
      ?auto_83272 - BLOCK
      ?auto_83273 - BLOCK
      ?auto_83274 - BLOCK
      ?auto_83275 - BLOCK
      ?auto_83276 - BLOCK
      ?auto_83277 - BLOCK
      ?auto_83278 - BLOCK
      ?auto_83279 - BLOCK
    )
    :vars
    (
      ?auto_83280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83279 ?auto_83280 ) ( ON-TABLE ?auto_83270 ) ( ON ?auto_83271 ?auto_83270 ) ( ON ?auto_83272 ?auto_83271 ) ( ON ?auto_83273 ?auto_83272 ) ( not ( = ?auto_83270 ?auto_83271 ) ) ( not ( = ?auto_83270 ?auto_83272 ) ) ( not ( = ?auto_83270 ?auto_83273 ) ) ( not ( = ?auto_83270 ?auto_83274 ) ) ( not ( = ?auto_83270 ?auto_83275 ) ) ( not ( = ?auto_83270 ?auto_83276 ) ) ( not ( = ?auto_83270 ?auto_83277 ) ) ( not ( = ?auto_83270 ?auto_83278 ) ) ( not ( = ?auto_83270 ?auto_83279 ) ) ( not ( = ?auto_83270 ?auto_83280 ) ) ( not ( = ?auto_83271 ?auto_83272 ) ) ( not ( = ?auto_83271 ?auto_83273 ) ) ( not ( = ?auto_83271 ?auto_83274 ) ) ( not ( = ?auto_83271 ?auto_83275 ) ) ( not ( = ?auto_83271 ?auto_83276 ) ) ( not ( = ?auto_83271 ?auto_83277 ) ) ( not ( = ?auto_83271 ?auto_83278 ) ) ( not ( = ?auto_83271 ?auto_83279 ) ) ( not ( = ?auto_83271 ?auto_83280 ) ) ( not ( = ?auto_83272 ?auto_83273 ) ) ( not ( = ?auto_83272 ?auto_83274 ) ) ( not ( = ?auto_83272 ?auto_83275 ) ) ( not ( = ?auto_83272 ?auto_83276 ) ) ( not ( = ?auto_83272 ?auto_83277 ) ) ( not ( = ?auto_83272 ?auto_83278 ) ) ( not ( = ?auto_83272 ?auto_83279 ) ) ( not ( = ?auto_83272 ?auto_83280 ) ) ( not ( = ?auto_83273 ?auto_83274 ) ) ( not ( = ?auto_83273 ?auto_83275 ) ) ( not ( = ?auto_83273 ?auto_83276 ) ) ( not ( = ?auto_83273 ?auto_83277 ) ) ( not ( = ?auto_83273 ?auto_83278 ) ) ( not ( = ?auto_83273 ?auto_83279 ) ) ( not ( = ?auto_83273 ?auto_83280 ) ) ( not ( = ?auto_83274 ?auto_83275 ) ) ( not ( = ?auto_83274 ?auto_83276 ) ) ( not ( = ?auto_83274 ?auto_83277 ) ) ( not ( = ?auto_83274 ?auto_83278 ) ) ( not ( = ?auto_83274 ?auto_83279 ) ) ( not ( = ?auto_83274 ?auto_83280 ) ) ( not ( = ?auto_83275 ?auto_83276 ) ) ( not ( = ?auto_83275 ?auto_83277 ) ) ( not ( = ?auto_83275 ?auto_83278 ) ) ( not ( = ?auto_83275 ?auto_83279 ) ) ( not ( = ?auto_83275 ?auto_83280 ) ) ( not ( = ?auto_83276 ?auto_83277 ) ) ( not ( = ?auto_83276 ?auto_83278 ) ) ( not ( = ?auto_83276 ?auto_83279 ) ) ( not ( = ?auto_83276 ?auto_83280 ) ) ( not ( = ?auto_83277 ?auto_83278 ) ) ( not ( = ?auto_83277 ?auto_83279 ) ) ( not ( = ?auto_83277 ?auto_83280 ) ) ( not ( = ?auto_83278 ?auto_83279 ) ) ( not ( = ?auto_83278 ?auto_83280 ) ) ( not ( = ?auto_83279 ?auto_83280 ) ) ( ON ?auto_83278 ?auto_83279 ) ( ON ?auto_83277 ?auto_83278 ) ( ON ?auto_83276 ?auto_83277 ) ( ON ?auto_83275 ?auto_83276 ) ( CLEAR ?auto_83273 ) ( ON ?auto_83274 ?auto_83275 ) ( CLEAR ?auto_83274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83270 ?auto_83271 ?auto_83272 ?auto_83273 ?auto_83274 )
      ( MAKE-10PILE ?auto_83270 ?auto_83271 ?auto_83272 ?auto_83273 ?auto_83274 ?auto_83275 ?auto_83276 ?auto_83277 ?auto_83278 ?auto_83279 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83291 - BLOCK
      ?auto_83292 - BLOCK
      ?auto_83293 - BLOCK
      ?auto_83294 - BLOCK
      ?auto_83295 - BLOCK
      ?auto_83296 - BLOCK
      ?auto_83297 - BLOCK
      ?auto_83298 - BLOCK
      ?auto_83299 - BLOCK
      ?auto_83300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83300 ) ( ON-TABLE ?auto_83291 ) ( ON ?auto_83292 ?auto_83291 ) ( ON ?auto_83293 ?auto_83292 ) ( ON ?auto_83294 ?auto_83293 ) ( not ( = ?auto_83291 ?auto_83292 ) ) ( not ( = ?auto_83291 ?auto_83293 ) ) ( not ( = ?auto_83291 ?auto_83294 ) ) ( not ( = ?auto_83291 ?auto_83295 ) ) ( not ( = ?auto_83291 ?auto_83296 ) ) ( not ( = ?auto_83291 ?auto_83297 ) ) ( not ( = ?auto_83291 ?auto_83298 ) ) ( not ( = ?auto_83291 ?auto_83299 ) ) ( not ( = ?auto_83291 ?auto_83300 ) ) ( not ( = ?auto_83292 ?auto_83293 ) ) ( not ( = ?auto_83292 ?auto_83294 ) ) ( not ( = ?auto_83292 ?auto_83295 ) ) ( not ( = ?auto_83292 ?auto_83296 ) ) ( not ( = ?auto_83292 ?auto_83297 ) ) ( not ( = ?auto_83292 ?auto_83298 ) ) ( not ( = ?auto_83292 ?auto_83299 ) ) ( not ( = ?auto_83292 ?auto_83300 ) ) ( not ( = ?auto_83293 ?auto_83294 ) ) ( not ( = ?auto_83293 ?auto_83295 ) ) ( not ( = ?auto_83293 ?auto_83296 ) ) ( not ( = ?auto_83293 ?auto_83297 ) ) ( not ( = ?auto_83293 ?auto_83298 ) ) ( not ( = ?auto_83293 ?auto_83299 ) ) ( not ( = ?auto_83293 ?auto_83300 ) ) ( not ( = ?auto_83294 ?auto_83295 ) ) ( not ( = ?auto_83294 ?auto_83296 ) ) ( not ( = ?auto_83294 ?auto_83297 ) ) ( not ( = ?auto_83294 ?auto_83298 ) ) ( not ( = ?auto_83294 ?auto_83299 ) ) ( not ( = ?auto_83294 ?auto_83300 ) ) ( not ( = ?auto_83295 ?auto_83296 ) ) ( not ( = ?auto_83295 ?auto_83297 ) ) ( not ( = ?auto_83295 ?auto_83298 ) ) ( not ( = ?auto_83295 ?auto_83299 ) ) ( not ( = ?auto_83295 ?auto_83300 ) ) ( not ( = ?auto_83296 ?auto_83297 ) ) ( not ( = ?auto_83296 ?auto_83298 ) ) ( not ( = ?auto_83296 ?auto_83299 ) ) ( not ( = ?auto_83296 ?auto_83300 ) ) ( not ( = ?auto_83297 ?auto_83298 ) ) ( not ( = ?auto_83297 ?auto_83299 ) ) ( not ( = ?auto_83297 ?auto_83300 ) ) ( not ( = ?auto_83298 ?auto_83299 ) ) ( not ( = ?auto_83298 ?auto_83300 ) ) ( not ( = ?auto_83299 ?auto_83300 ) ) ( ON ?auto_83299 ?auto_83300 ) ( ON ?auto_83298 ?auto_83299 ) ( ON ?auto_83297 ?auto_83298 ) ( ON ?auto_83296 ?auto_83297 ) ( CLEAR ?auto_83294 ) ( ON ?auto_83295 ?auto_83296 ) ( CLEAR ?auto_83295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83291 ?auto_83292 ?auto_83293 ?auto_83294 ?auto_83295 )
      ( MAKE-10PILE ?auto_83291 ?auto_83292 ?auto_83293 ?auto_83294 ?auto_83295 ?auto_83296 ?auto_83297 ?auto_83298 ?auto_83299 ?auto_83300 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83311 - BLOCK
      ?auto_83312 - BLOCK
      ?auto_83313 - BLOCK
      ?auto_83314 - BLOCK
      ?auto_83315 - BLOCK
      ?auto_83316 - BLOCK
      ?auto_83317 - BLOCK
      ?auto_83318 - BLOCK
      ?auto_83319 - BLOCK
      ?auto_83320 - BLOCK
    )
    :vars
    (
      ?auto_83321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83320 ?auto_83321 ) ( ON-TABLE ?auto_83311 ) ( ON ?auto_83312 ?auto_83311 ) ( ON ?auto_83313 ?auto_83312 ) ( not ( = ?auto_83311 ?auto_83312 ) ) ( not ( = ?auto_83311 ?auto_83313 ) ) ( not ( = ?auto_83311 ?auto_83314 ) ) ( not ( = ?auto_83311 ?auto_83315 ) ) ( not ( = ?auto_83311 ?auto_83316 ) ) ( not ( = ?auto_83311 ?auto_83317 ) ) ( not ( = ?auto_83311 ?auto_83318 ) ) ( not ( = ?auto_83311 ?auto_83319 ) ) ( not ( = ?auto_83311 ?auto_83320 ) ) ( not ( = ?auto_83311 ?auto_83321 ) ) ( not ( = ?auto_83312 ?auto_83313 ) ) ( not ( = ?auto_83312 ?auto_83314 ) ) ( not ( = ?auto_83312 ?auto_83315 ) ) ( not ( = ?auto_83312 ?auto_83316 ) ) ( not ( = ?auto_83312 ?auto_83317 ) ) ( not ( = ?auto_83312 ?auto_83318 ) ) ( not ( = ?auto_83312 ?auto_83319 ) ) ( not ( = ?auto_83312 ?auto_83320 ) ) ( not ( = ?auto_83312 ?auto_83321 ) ) ( not ( = ?auto_83313 ?auto_83314 ) ) ( not ( = ?auto_83313 ?auto_83315 ) ) ( not ( = ?auto_83313 ?auto_83316 ) ) ( not ( = ?auto_83313 ?auto_83317 ) ) ( not ( = ?auto_83313 ?auto_83318 ) ) ( not ( = ?auto_83313 ?auto_83319 ) ) ( not ( = ?auto_83313 ?auto_83320 ) ) ( not ( = ?auto_83313 ?auto_83321 ) ) ( not ( = ?auto_83314 ?auto_83315 ) ) ( not ( = ?auto_83314 ?auto_83316 ) ) ( not ( = ?auto_83314 ?auto_83317 ) ) ( not ( = ?auto_83314 ?auto_83318 ) ) ( not ( = ?auto_83314 ?auto_83319 ) ) ( not ( = ?auto_83314 ?auto_83320 ) ) ( not ( = ?auto_83314 ?auto_83321 ) ) ( not ( = ?auto_83315 ?auto_83316 ) ) ( not ( = ?auto_83315 ?auto_83317 ) ) ( not ( = ?auto_83315 ?auto_83318 ) ) ( not ( = ?auto_83315 ?auto_83319 ) ) ( not ( = ?auto_83315 ?auto_83320 ) ) ( not ( = ?auto_83315 ?auto_83321 ) ) ( not ( = ?auto_83316 ?auto_83317 ) ) ( not ( = ?auto_83316 ?auto_83318 ) ) ( not ( = ?auto_83316 ?auto_83319 ) ) ( not ( = ?auto_83316 ?auto_83320 ) ) ( not ( = ?auto_83316 ?auto_83321 ) ) ( not ( = ?auto_83317 ?auto_83318 ) ) ( not ( = ?auto_83317 ?auto_83319 ) ) ( not ( = ?auto_83317 ?auto_83320 ) ) ( not ( = ?auto_83317 ?auto_83321 ) ) ( not ( = ?auto_83318 ?auto_83319 ) ) ( not ( = ?auto_83318 ?auto_83320 ) ) ( not ( = ?auto_83318 ?auto_83321 ) ) ( not ( = ?auto_83319 ?auto_83320 ) ) ( not ( = ?auto_83319 ?auto_83321 ) ) ( not ( = ?auto_83320 ?auto_83321 ) ) ( ON ?auto_83319 ?auto_83320 ) ( ON ?auto_83318 ?auto_83319 ) ( ON ?auto_83317 ?auto_83318 ) ( ON ?auto_83316 ?auto_83317 ) ( ON ?auto_83315 ?auto_83316 ) ( CLEAR ?auto_83313 ) ( ON ?auto_83314 ?auto_83315 ) ( CLEAR ?auto_83314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83311 ?auto_83312 ?auto_83313 ?auto_83314 )
      ( MAKE-10PILE ?auto_83311 ?auto_83312 ?auto_83313 ?auto_83314 ?auto_83315 ?auto_83316 ?auto_83317 ?auto_83318 ?auto_83319 ?auto_83320 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83332 - BLOCK
      ?auto_83333 - BLOCK
      ?auto_83334 - BLOCK
      ?auto_83335 - BLOCK
      ?auto_83336 - BLOCK
      ?auto_83337 - BLOCK
      ?auto_83338 - BLOCK
      ?auto_83339 - BLOCK
      ?auto_83340 - BLOCK
      ?auto_83341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83341 ) ( ON-TABLE ?auto_83332 ) ( ON ?auto_83333 ?auto_83332 ) ( ON ?auto_83334 ?auto_83333 ) ( not ( = ?auto_83332 ?auto_83333 ) ) ( not ( = ?auto_83332 ?auto_83334 ) ) ( not ( = ?auto_83332 ?auto_83335 ) ) ( not ( = ?auto_83332 ?auto_83336 ) ) ( not ( = ?auto_83332 ?auto_83337 ) ) ( not ( = ?auto_83332 ?auto_83338 ) ) ( not ( = ?auto_83332 ?auto_83339 ) ) ( not ( = ?auto_83332 ?auto_83340 ) ) ( not ( = ?auto_83332 ?auto_83341 ) ) ( not ( = ?auto_83333 ?auto_83334 ) ) ( not ( = ?auto_83333 ?auto_83335 ) ) ( not ( = ?auto_83333 ?auto_83336 ) ) ( not ( = ?auto_83333 ?auto_83337 ) ) ( not ( = ?auto_83333 ?auto_83338 ) ) ( not ( = ?auto_83333 ?auto_83339 ) ) ( not ( = ?auto_83333 ?auto_83340 ) ) ( not ( = ?auto_83333 ?auto_83341 ) ) ( not ( = ?auto_83334 ?auto_83335 ) ) ( not ( = ?auto_83334 ?auto_83336 ) ) ( not ( = ?auto_83334 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83338 ) ) ( not ( = ?auto_83334 ?auto_83339 ) ) ( not ( = ?auto_83334 ?auto_83340 ) ) ( not ( = ?auto_83334 ?auto_83341 ) ) ( not ( = ?auto_83335 ?auto_83336 ) ) ( not ( = ?auto_83335 ?auto_83337 ) ) ( not ( = ?auto_83335 ?auto_83338 ) ) ( not ( = ?auto_83335 ?auto_83339 ) ) ( not ( = ?auto_83335 ?auto_83340 ) ) ( not ( = ?auto_83335 ?auto_83341 ) ) ( not ( = ?auto_83336 ?auto_83337 ) ) ( not ( = ?auto_83336 ?auto_83338 ) ) ( not ( = ?auto_83336 ?auto_83339 ) ) ( not ( = ?auto_83336 ?auto_83340 ) ) ( not ( = ?auto_83336 ?auto_83341 ) ) ( not ( = ?auto_83337 ?auto_83338 ) ) ( not ( = ?auto_83337 ?auto_83339 ) ) ( not ( = ?auto_83337 ?auto_83340 ) ) ( not ( = ?auto_83337 ?auto_83341 ) ) ( not ( = ?auto_83338 ?auto_83339 ) ) ( not ( = ?auto_83338 ?auto_83340 ) ) ( not ( = ?auto_83338 ?auto_83341 ) ) ( not ( = ?auto_83339 ?auto_83340 ) ) ( not ( = ?auto_83339 ?auto_83341 ) ) ( not ( = ?auto_83340 ?auto_83341 ) ) ( ON ?auto_83340 ?auto_83341 ) ( ON ?auto_83339 ?auto_83340 ) ( ON ?auto_83338 ?auto_83339 ) ( ON ?auto_83337 ?auto_83338 ) ( ON ?auto_83336 ?auto_83337 ) ( CLEAR ?auto_83334 ) ( ON ?auto_83335 ?auto_83336 ) ( CLEAR ?auto_83335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83332 ?auto_83333 ?auto_83334 ?auto_83335 )
      ( MAKE-10PILE ?auto_83332 ?auto_83333 ?auto_83334 ?auto_83335 ?auto_83336 ?auto_83337 ?auto_83338 ?auto_83339 ?auto_83340 ?auto_83341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83352 - BLOCK
      ?auto_83353 - BLOCK
      ?auto_83354 - BLOCK
      ?auto_83355 - BLOCK
      ?auto_83356 - BLOCK
      ?auto_83357 - BLOCK
      ?auto_83358 - BLOCK
      ?auto_83359 - BLOCK
      ?auto_83360 - BLOCK
      ?auto_83361 - BLOCK
    )
    :vars
    (
      ?auto_83362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83361 ?auto_83362 ) ( ON-TABLE ?auto_83352 ) ( ON ?auto_83353 ?auto_83352 ) ( not ( = ?auto_83352 ?auto_83353 ) ) ( not ( = ?auto_83352 ?auto_83354 ) ) ( not ( = ?auto_83352 ?auto_83355 ) ) ( not ( = ?auto_83352 ?auto_83356 ) ) ( not ( = ?auto_83352 ?auto_83357 ) ) ( not ( = ?auto_83352 ?auto_83358 ) ) ( not ( = ?auto_83352 ?auto_83359 ) ) ( not ( = ?auto_83352 ?auto_83360 ) ) ( not ( = ?auto_83352 ?auto_83361 ) ) ( not ( = ?auto_83352 ?auto_83362 ) ) ( not ( = ?auto_83353 ?auto_83354 ) ) ( not ( = ?auto_83353 ?auto_83355 ) ) ( not ( = ?auto_83353 ?auto_83356 ) ) ( not ( = ?auto_83353 ?auto_83357 ) ) ( not ( = ?auto_83353 ?auto_83358 ) ) ( not ( = ?auto_83353 ?auto_83359 ) ) ( not ( = ?auto_83353 ?auto_83360 ) ) ( not ( = ?auto_83353 ?auto_83361 ) ) ( not ( = ?auto_83353 ?auto_83362 ) ) ( not ( = ?auto_83354 ?auto_83355 ) ) ( not ( = ?auto_83354 ?auto_83356 ) ) ( not ( = ?auto_83354 ?auto_83357 ) ) ( not ( = ?auto_83354 ?auto_83358 ) ) ( not ( = ?auto_83354 ?auto_83359 ) ) ( not ( = ?auto_83354 ?auto_83360 ) ) ( not ( = ?auto_83354 ?auto_83361 ) ) ( not ( = ?auto_83354 ?auto_83362 ) ) ( not ( = ?auto_83355 ?auto_83356 ) ) ( not ( = ?auto_83355 ?auto_83357 ) ) ( not ( = ?auto_83355 ?auto_83358 ) ) ( not ( = ?auto_83355 ?auto_83359 ) ) ( not ( = ?auto_83355 ?auto_83360 ) ) ( not ( = ?auto_83355 ?auto_83361 ) ) ( not ( = ?auto_83355 ?auto_83362 ) ) ( not ( = ?auto_83356 ?auto_83357 ) ) ( not ( = ?auto_83356 ?auto_83358 ) ) ( not ( = ?auto_83356 ?auto_83359 ) ) ( not ( = ?auto_83356 ?auto_83360 ) ) ( not ( = ?auto_83356 ?auto_83361 ) ) ( not ( = ?auto_83356 ?auto_83362 ) ) ( not ( = ?auto_83357 ?auto_83358 ) ) ( not ( = ?auto_83357 ?auto_83359 ) ) ( not ( = ?auto_83357 ?auto_83360 ) ) ( not ( = ?auto_83357 ?auto_83361 ) ) ( not ( = ?auto_83357 ?auto_83362 ) ) ( not ( = ?auto_83358 ?auto_83359 ) ) ( not ( = ?auto_83358 ?auto_83360 ) ) ( not ( = ?auto_83358 ?auto_83361 ) ) ( not ( = ?auto_83358 ?auto_83362 ) ) ( not ( = ?auto_83359 ?auto_83360 ) ) ( not ( = ?auto_83359 ?auto_83361 ) ) ( not ( = ?auto_83359 ?auto_83362 ) ) ( not ( = ?auto_83360 ?auto_83361 ) ) ( not ( = ?auto_83360 ?auto_83362 ) ) ( not ( = ?auto_83361 ?auto_83362 ) ) ( ON ?auto_83360 ?auto_83361 ) ( ON ?auto_83359 ?auto_83360 ) ( ON ?auto_83358 ?auto_83359 ) ( ON ?auto_83357 ?auto_83358 ) ( ON ?auto_83356 ?auto_83357 ) ( ON ?auto_83355 ?auto_83356 ) ( CLEAR ?auto_83353 ) ( ON ?auto_83354 ?auto_83355 ) ( CLEAR ?auto_83354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83352 ?auto_83353 ?auto_83354 )
      ( MAKE-10PILE ?auto_83352 ?auto_83353 ?auto_83354 ?auto_83355 ?auto_83356 ?auto_83357 ?auto_83358 ?auto_83359 ?auto_83360 ?auto_83361 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83373 - BLOCK
      ?auto_83374 - BLOCK
      ?auto_83375 - BLOCK
      ?auto_83376 - BLOCK
      ?auto_83377 - BLOCK
      ?auto_83378 - BLOCK
      ?auto_83379 - BLOCK
      ?auto_83380 - BLOCK
      ?auto_83381 - BLOCK
      ?auto_83382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83382 ) ( ON-TABLE ?auto_83373 ) ( ON ?auto_83374 ?auto_83373 ) ( not ( = ?auto_83373 ?auto_83374 ) ) ( not ( = ?auto_83373 ?auto_83375 ) ) ( not ( = ?auto_83373 ?auto_83376 ) ) ( not ( = ?auto_83373 ?auto_83377 ) ) ( not ( = ?auto_83373 ?auto_83378 ) ) ( not ( = ?auto_83373 ?auto_83379 ) ) ( not ( = ?auto_83373 ?auto_83380 ) ) ( not ( = ?auto_83373 ?auto_83381 ) ) ( not ( = ?auto_83373 ?auto_83382 ) ) ( not ( = ?auto_83374 ?auto_83375 ) ) ( not ( = ?auto_83374 ?auto_83376 ) ) ( not ( = ?auto_83374 ?auto_83377 ) ) ( not ( = ?auto_83374 ?auto_83378 ) ) ( not ( = ?auto_83374 ?auto_83379 ) ) ( not ( = ?auto_83374 ?auto_83380 ) ) ( not ( = ?auto_83374 ?auto_83381 ) ) ( not ( = ?auto_83374 ?auto_83382 ) ) ( not ( = ?auto_83375 ?auto_83376 ) ) ( not ( = ?auto_83375 ?auto_83377 ) ) ( not ( = ?auto_83375 ?auto_83378 ) ) ( not ( = ?auto_83375 ?auto_83379 ) ) ( not ( = ?auto_83375 ?auto_83380 ) ) ( not ( = ?auto_83375 ?auto_83381 ) ) ( not ( = ?auto_83375 ?auto_83382 ) ) ( not ( = ?auto_83376 ?auto_83377 ) ) ( not ( = ?auto_83376 ?auto_83378 ) ) ( not ( = ?auto_83376 ?auto_83379 ) ) ( not ( = ?auto_83376 ?auto_83380 ) ) ( not ( = ?auto_83376 ?auto_83381 ) ) ( not ( = ?auto_83376 ?auto_83382 ) ) ( not ( = ?auto_83377 ?auto_83378 ) ) ( not ( = ?auto_83377 ?auto_83379 ) ) ( not ( = ?auto_83377 ?auto_83380 ) ) ( not ( = ?auto_83377 ?auto_83381 ) ) ( not ( = ?auto_83377 ?auto_83382 ) ) ( not ( = ?auto_83378 ?auto_83379 ) ) ( not ( = ?auto_83378 ?auto_83380 ) ) ( not ( = ?auto_83378 ?auto_83381 ) ) ( not ( = ?auto_83378 ?auto_83382 ) ) ( not ( = ?auto_83379 ?auto_83380 ) ) ( not ( = ?auto_83379 ?auto_83381 ) ) ( not ( = ?auto_83379 ?auto_83382 ) ) ( not ( = ?auto_83380 ?auto_83381 ) ) ( not ( = ?auto_83380 ?auto_83382 ) ) ( not ( = ?auto_83381 ?auto_83382 ) ) ( ON ?auto_83381 ?auto_83382 ) ( ON ?auto_83380 ?auto_83381 ) ( ON ?auto_83379 ?auto_83380 ) ( ON ?auto_83378 ?auto_83379 ) ( ON ?auto_83377 ?auto_83378 ) ( ON ?auto_83376 ?auto_83377 ) ( CLEAR ?auto_83374 ) ( ON ?auto_83375 ?auto_83376 ) ( CLEAR ?auto_83375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83373 ?auto_83374 ?auto_83375 )
      ( MAKE-10PILE ?auto_83373 ?auto_83374 ?auto_83375 ?auto_83376 ?auto_83377 ?auto_83378 ?auto_83379 ?auto_83380 ?auto_83381 ?auto_83382 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83393 - BLOCK
      ?auto_83394 - BLOCK
      ?auto_83395 - BLOCK
      ?auto_83396 - BLOCK
      ?auto_83397 - BLOCK
      ?auto_83398 - BLOCK
      ?auto_83399 - BLOCK
      ?auto_83400 - BLOCK
      ?auto_83401 - BLOCK
      ?auto_83402 - BLOCK
    )
    :vars
    (
      ?auto_83403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83402 ?auto_83403 ) ( ON-TABLE ?auto_83393 ) ( not ( = ?auto_83393 ?auto_83394 ) ) ( not ( = ?auto_83393 ?auto_83395 ) ) ( not ( = ?auto_83393 ?auto_83396 ) ) ( not ( = ?auto_83393 ?auto_83397 ) ) ( not ( = ?auto_83393 ?auto_83398 ) ) ( not ( = ?auto_83393 ?auto_83399 ) ) ( not ( = ?auto_83393 ?auto_83400 ) ) ( not ( = ?auto_83393 ?auto_83401 ) ) ( not ( = ?auto_83393 ?auto_83402 ) ) ( not ( = ?auto_83393 ?auto_83403 ) ) ( not ( = ?auto_83394 ?auto_83395 ) ) ( not ( = ?auto_83394 ?auto_83396 ) ) ( not ( = ?auto_83394 ?auto_83397 ) ) ( not ( = ?auto_83394 ?auto_83398 ) ) ( not ( = ?auto_83394 ?auto_83399 ) ) ( not ( = ?auto_83394 ?auto_83400 ) ) ( not ( = ?auto_83394 ?auto_83401 ) ) ( not ( = ?auto_83394 ?auto_83402 ) ) ( not ( = ?auto_83394 ?auto_83403 ) ) ( not ( = ?auto_83395 ?auto_83396 ) ) ( not ( = ?auto_83395 ?auto_83397 ) ) ( not ( = ?auto_83395 ?auto_83398 ) ) ( not ( = ?auto_83395 ?auto_83399 ) ) ( not ( = ?auto_83395 ?auto_83400 ) ) ( not ( = ?auto_83395 ?auto_83401 ) ) ( not ( = ?auto_83395 ?auto_83402 ) ) ( not ( = ?auto_83395 ?auto_83403 ) ) ( not ( = ?auto_83396 ?auto_83397 ) ) ( not ( = ?auto_83396 ?auto_83398 ) ) ( not ( = ?auto_83396 ?auto_83399 ) ) ( not ( = ?auto_83396 ?auto_83400 ) ) ( not ( = ?auto_83396 ?auto_83401 ) ) ( not ( = ?auto_83396 ?auto_83402 ) ) ( not ( = ?auto_83396 ?auto_83403 ) ) ( not ( = ?auto_83397 ?auto_83398 ) ) ( not ( = ?auto_83397 ?auto_83399 ) ) ( not ( = ?auto_83397 ?auto_83400 ) ) ( not ( = ?auto_83397 ?auto_83401 ) ) ( not ( = ?auto_83397 ?auto_83402 ) ) ( not ( = ?auto_83397 ?auto_83403 ) ) ( not ( = ?auto_83398 ?auto_83399 ) ) ( not ( = ?auto_83398 ?auto_83400 ) ) ( not ( = ?auto_83398 ?auto_83401 ) ) ( not ( = ?auto_83398 ?auto_83402 ) ) ( not ( = ?auto_83398 ?auto_83403 ) ) ( not ( = ?auto_83399 ?auto_83400 ) ) ( not ( = ?auto_83399 ?auto_83401 ) ) ( not ( = ?auto_83399 ?auto_83402 ) ) ( not ( = ?auto_83399 ?auto_83403 ) ) ( not ( = ?auto_83400 ?auto_83401 ) ) ( not ( = ?auto_83400 ?auto_83402 ) ) ( not ( = ?auto_83400 ?auto_83403 ) ) ( not ( = ?auto_83401 ?auto_83402 ) ) ( not ( = ?auto_83401 ?auto_83403 ) ) ( not ( = ?auto_83402 ?auto_83403 ) ) ( ON ?auto_83401 ?auto_83402 ) ( ON ?auto_83400 ?auto_83401 ) ( ON ?auto_83399 ?auto_83400 ) ( ON ?auto_83398 ?auto_83399 ) ( ON ?auto_83397 ?auto_83398 ) ( ON ?auto_83396 ?auto_83397 ) ( ON ?auto_83395 ?auto_83396 ) ( CLEAR ?auto_83393 ) ( ON ?auto_83394 ?auto_83395 ) ( CLEAR ?auto_83394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83393 ?auto_83394 )
      ( MAKE-10PILE ?auto_83393 ?auto_83394 ?auto_83395 ?auto_83396 ?auto_83397 ?auto_83398 ?auto_83399 ?auto_83400 ?auto_83401 ?auto_83402 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83414 - BLOCK
      ?auto_83415 - BLOCK
      ?auto_83416 - BLOCK
      ?auto_83417 - BLOCK
      ?auto_83418 - BLOCK
      ?auto_83419 - BLOCK
      ?auto_83420 - BLOCK
      ?auto_83421 - BLOCK
      ?auto_83422 - BLOCK
      ?auto_83423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83423 ) ( ON-TABLE ?auto_83414 ) ( not ( = ?auto_83414 ?auto_83415 ) ) ( not ( = ?auto_83414 ?auto_83416 ) ) ( not ( = ?auto_83414 ?auto_83417 ) ) ( not ( = ?auto_83414 ?auto_83418 ) ) ( not ( = ?auto_83414 ?auto_83419 ) ) ( not ( = ?auto_83414 ?auto_83420 ) ) ( not ( = ?auto_83414 ?auto_83421 ) ) ( not ( = ?auto_83414 ?auto_83422 ) ) ( not ( = ?auto_83414 ?auto_83423 ) ) ( not ( = ?auto_83415 ?auto_83416 ) ) ( not ( = ?auto_83415 ?auto_83417 ) ) ( not ( = ?auto_83415 ?auto_83418 ) ) ( not ( = ?auto_83415 ?auto_83419 ) ) ( not ( = ?auto_83415 ?auto_83420 ) ) ( not ( = ?auto_83415 ?auto_83421 ) ) ( not ( = ?auto_83415 ?auto_83422 ) ) ( not ( = ?auto_83415 ?auto_83423 ) ) ( not ( = ?auto_83416 ?auto_83417 ) ) ( not ( = ?auto_83416 ?auto_83418 ) ) ( not ( = ?auto_83416 ?auto_83419 ) ) ( not ( = ?auto_83416 ?auto_83420 ) ) ( not ( = ?auto_83416 ?auto_83421 ) ) ( not ( = ?auto_83416 ?auto_83422 ) ) ( not ( = ?auto_83416 ?auto_83423 ) ) ( not ( = ?auto_83417 ?auto_83418 ) ) ( not ( = ?auto_83417 ?auto_83419 ) ) ( not ( = ?auto_83417 ?auto_83420 ) ) ( not ( = ?auto_83417 ?auto_83421 ) ) ( not ( = ?auto_83417 ?auto_83422 ) ) ( not ( = ?auto_83417 ?auto_83423 ) ) ( not ( = ?auto_83418 ?auto_83419 ) ) ( not ( = ?auto_83418 ?auto_83420 ) ) ( not ( = ?auto_83418 ?auto_83421 ) ) ( not ( = ?auto_83418 ?auto_83422 ) ) ( not ( = ?auto_83418 ?auto_83423 ) ) ( not ( = ?auto_83419 ?auto_83420 ) ) ( not ( = ?auto_83419 ?auto_83421 ) ) ( not ( = ?auto_83419 ?auto_83422 ) ) ( not ( = ?auto_83419 ?auto_83423 ) ) ( not ( = ?auto_83420 ?auto_83421 ) ) ( not ( = ?auto_83420 ?auto_83422 ) ) ( not ( = ?auto_83420 ?auto_83423 ) ) ( not ( = ?auto_83421 ?auto_83422 ) ) ( not ( = ?auto_83421 ?auto_83423 ) ) ( not ( = ?auto_83422 ?auto_83423 ) ) ( ON ?auto_83422 ?auto_83423 ) ( ON ?auto_83421 ?auto_83422 ) ( ON ?auto_83420 ?auto_83421 ) ( ON ?auto_83419 ?auto_83420 ) ( ON ?auto_83418 ?auto_83419 ) ( ON ?auto_83417 ?auto_83418 ) ( ON ?auto_83416 ?auto_83417 ) ( CLEAR ?auto_83414 ) ( ON ?auto_83415 ?auto_83416 ) ( CLEAR ?auto_83415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83414 ?auto_83415 )
      ( MAKE-10PILE ?auto_83414 ?auto_83415 ?auto_83416 ?auto_83417 ?auto_83418 ?auto_83419 ?auto_83420 ?auto_83421 ?auto_83422 ?auto_83423 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83434 - BLOCK
      ?auto_83435 - BLOCK
      ?auto_83436 - BLOCK
      ?auto_83437 - BLOCK
      ?auto_83438 - BLOCK
      ?auto_83439 - BLOCK
      ?auto_83440 - BLOCK
      ?auto_83441 - BLOCK
      ?auto_83442 - BLOCK
      ?auto_83443 - BLOCK
    )
    :vars
    (
      ?auto_83444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83443 ?auto_83444 ) ( not ( = ?auto_83434 ?auto_83435 ) ) ( not ( = ?auto_83434 ?auto_83436 ) ) ( not ( = ?auto_83434 ?auto_83437 ) ) ( not ( = ?auto_83434 ?auto_83438 ) ) ( not ( = ?auto_83434 ?auto_83439 ) ) ( not ( = ?auto_83434 ?auto_83440 ) ) ( not ( = ?auto_83434 ?auto_83441 ) ) ( not ( = ?auto_83434 ?auto_83442 ) ) ( not ( = ?auto_83434 ?auto_83443 ) ) ( not ( = ?auto_83434 ?auto_83444 ) ) ( not ( = ?auto_83435 ?auto_83436 ) ) ( not ( = ?auto_83435 ?auto_83437 ) ) ( not ( = ?auto_83435 ?auto_83438 ) ) ( not ( = ?auto_83435 ?auto_83439 ) ) ( not ( = ?auto_83435 ?auto_83440 ) ) ( not ( = ?auto_83435 ?auto_83441 ) ) ( not ( = ?auto_83435 ?auto_83442 ) ) ( not ( = ?auto_83435 ?auto_83443 ) ) ( not ( = ?auto_83435 ?auto_83444 ) ) ( not ( = ?auto_83436 ?auto_83437 ) ) ( not ( = ?auto_83436 ?auto_83438 ) ) ( not ( = ?auto_83436 ?auto_83439 ) ) ( not ( = ?auto_83436 ?auto_83440 ) ) ( not ( = ?auto_83436 ?auto_83441 ) ) ( not ( = ?auto_83436 ?auto_83442 ) ) ( not ( = ?auto_83436 ?auto_83443 ) ) ( not ( = ?auto_83436 ?auto_83444 ) ) ( not ( = ?auto_83437 ?auto_83438 ) ) ( not ( = ?auto_83437 ?auto_83439 ) ) ( not ( = ?auto_83437 ?auto_83440 ) ) ( not ( = ?auto_83437 ?auto_83441 ) ) ( not ( = ?auto_83437 ?auto_83442 ) ) ( not ( = ?auto_83437 ?auto_83443 ) ) ( not ( = ?auto_83437 ?auto_83444 ) ) ( not ( = ?auto_83438 ?auto_83439 ) ) ( not ( = ?auto_83438 ?auto_83440 ) ) ( not ( = ?auto_83438 ?auto_83441 ) ) ( not ( = ?auto_83438 ?auto_83442 ) ) ( not ( = ?auto_83438 ?auto_83443 ) ) ( not ( = ?auto_83438 ?auto_83444 ) ) ( not ( = ?auto_83439 ?auto_83440 ) ) ( not ( = ?auto_83439 ?auto_83441 ) ) ( not ( = ?auto_83439 ?auto_83442 ) ) ( not ( = ?auto_83439 ?auto_83443 ) ) ( not ( = ?auto_83439 ?auto_83444 ) ) ( not ( = ?auto_83440 ?auto_83441 ) ) ( not ( = ?auto_83440 ?auto_83442 ) ) ( not ( = ?auto_83440 ?auto_83443 ) ) ( not ( = ?auto_83440 ?auto_83444 ) ) ( not ( = ?auto_83441 ?auto_83442 ) ) ( not ( = ?auto_83441 ?auto_83443 ) ) ( not ( = ?auto_83441 ?auto_83444 ) ) ( not ( = ?auto_83442 ?auto_83443 ) ) ( not ( = ?auto_83442 ?auto_83444 ) ) ( not ( = ?auto_83443 ?auto_83444 ) ) ( ON ?auto_83442 ?auto_83443 ) ( ON ?auto_83441 ?auto_83442 ) ( ON ?auto_83440 ?auto_83441 ) ( ON ?auto_83439 ?auto_83440 ) ( ON ?auto_83438 ?auto_83439 ) ( ON ?auto_83437 ?auto_83438 ) ( ON ?auto_83436 ?auto_83437 ) ( ON ?auto_83435 ?auto_83436 ) ( ON ?auto_83434 ?auto_83435 ) ( CLEAR ?auto_83434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83434 )
      ( MAKE-10PILE ?auto_83434 ?auto_83435 ?auto_83436 ?auto_83437 ?auto_83438 ?auto_83439 ?auto_83440 ?auto_83441 ?auto_83442 ?auto_83443 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83455 - BLOCK
      ?auto_83456 - BLOCK
      ?auto_83457 - BLOCK
      ?auto_83458 - BLOCK
      ?auto_83459 - BLOCK
      ?auto_83460 - BLOCK
      ?auto_83461 - BLOCK
      ?auto_83462 - BLOCK
      ?auto_83463 - BLOCK
      ?auto_83464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83464 ) ( not ( = ?auto_83455 ?auto_83456 ) ) ( not ( = ?auto_83455 ?auto_83457 ) ) ( not ( = ?auto_83455 ?auto_83458 ) ) ( not ( = ?auto_83455 ?auto_83459 ) ) ( not ( = ?auto_83455 ?auto_83460 ) ) ( not ( = ?auto_83455 ?auto_83461 ) ) ( not ( = ?auto_83455 ?auto_83462 ) ) ( not ( = ?auto_83455 ?auto_83463 ) ) ( not ( = ?auto_83455 ?auto_83464 ) ) ( not ( = ?auto_83456 ?auto_83457 ) ) ( not ( = ?auto_83456 ?auto_83458 ) ) ( not ( = ?auto_83456 ?auto_83459 ) ) ( not ( = ?auto_83456 ?auto_83460 ) ) ( not ( = ?auto_83456 ?auto_83461 ) ) ( not ( = ?auto_83456 ?auto_83462 ) ) ( not ( = ?auto_83456 ?auto_83463 ) ) ( not ( = ?auto_83456 ?auto_83464 ) ) ( not ( = ?auto_83457 ?auto_83458 ) ) ( not ( = ?auto_83457 ?auto_83459 ) ) ( not ( = ?auto_83457 ?auto_83460 ) ) ( not ( = ?auto_83457 ?auto_83461 ) ) ( not ( = ?auto_83457 ?auto_83462 ) ) ( not ( = ?auto_83457 ?auto_83463 ) ) ( not ( = ?auto_83457 ?auto_83464 ) ) ( not ( = ?auto_83458 ?auto_83459 ) ) ( not ( = ?auto_83458 ?auto_83460 ) ) ( not ( = ?auto_83458 ?auto_83461 ) ) ( not ( = ?auto_83458 ?auto_83462 ) ) ( not ( = ?auto_83458 ?auto_83463 ) ) ( not ( = ?auto_83458 ?auto_83464 ) ) ( not ( = ?auto_83459 ?auto_83460 ) ) ( not ( = ?auto_83459 ?auto_83461 ) ) ( not ( = ?auto_83459 ?auto_83462 ) ) ( not ( = ?auto_83459 ?auto_83463 ) ) ( not ( = ?auto_83459 ?auto_83464 ) ) ( not ( = ?auto_83460 ?auto_83461 ) ) ( not ( = ?auto_83460 ?auto_83462 ) ) ( not ( = ?auto_83460 ?auto_83463 ) ) ( not ( = ?auto_83460 ?auto_83464 ) ) ( not ( = ?auto_83461 ?auto_83462 ) ) ( not ( = ?auto_83461 ?auto_83463 ) ) ( not ( = ?auto_83461 ?auto_83464 ) ) ( not ( = ?auto_83462 ?auto_83463 ) ) ( not ( = ?auto_83462 ?auto_83464 ) ) ( not ( = ?auto_83463 ?auto_83464 ) ) ( ON ?auto_83463 ?auto_83464 ) ( ON ?auto_83462 ?auto_83463 ) ( ON ?auto_83461 ?auto_83462 ) ( ON ?auto_83460 ?auto_83461 ) ( ON ?auto_83459 ?auto_83460 ) ( ON ?auto_83458 ?auto_83459 ) ( ON ?auto_83457 ?auto_83458 ) ( ON ?auto_83456 ?auto_83457 ) ( ON ?auto_83455 ?auto_83456 ) ( CLEAR ?auto_83455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83455 )
      ( MAKE-10PILE ?auto_83455 ?auto_83456 ?auto_83457 ?auto_83458 ?auto_83459 ?auto_83460 ?auto_83461 ?auto_83462 ?auto_83463 ?auto_83464 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_83475 - BLOCK
      ?auto_83476 - BLOCK
      ?auto_83477 - BLOCK
      ?auto_83478 - BLOCK
      ?auto_83479 - BLOCK
      ?auto_83480 - BLOCK
      ?auto_83481 - BLOCK
      ?auto_83482 - BLOCK
      ?auto_83483 - BLOCK
      ?auto_83484 - BLOCK
    )
    :vars
    (
      ?auto_83485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83475 ?auto_83476 ) ) ( not ( = ?auto_83475 ?auto_83477 ) ) ( not ( = ?auto_83475 ?auto_83478 ) ) ( not ( = ?auto_83475 ?auto_83479 ) ) ( not ( = ?auto_83475 ?auto_83480 ) ) ( not ( = ?auto_83475 ?auto_83481 ) ) ( not ( = ?auto_83475 ?auto_83482 ) ) ( not ( = ?auto_83475 ?auto_83483 ) ) ( not ( = ?auto_83475 ?auto_83484 ) ) ( not ( = ?auto_83476 ?auto_83477 ) ) ( not ( = ?auto_83476 ?auto_83478 ) ) ( not ( = ?auto_83476 ?auto_83479 ) ) ( not ( = ?auto_83476 ?auto_83480 ) ) ( not ( = ?auto_83476 ?auto_83481 ) ) ( not ( = ?auto_83476 ?auto_83482 ) ) ( not ( = ?auto_83476 ?auto_83483 ) ) ( not ( = ?auto_83476 ?auto_83484 ) ) ( not ( = ?auto_83477 ?auto_83478 ) ) ( not ( = ?auto_83477 ?auto_83479 ) ) ( not ( = ?auto_83477 ?auto_83480 ) ) ( not ( = ?auto_83477 ?auto_83481 ) ) ( not ( = ?auto_83477 ?auto_83482 ) ) ( not ( = ?auto_83477 ?auto_83483 ) ) ( not ( = ?auto_83477 ?auto_83484 ) ) ( not ( = ?auto_83478 ?auto_83479 ) ) ( not ( = ?auto_83478 ?auto_83480 ) ) ( not ( = ?auto_83478 ?auto_83481 ) ) ( not ( = ?auto_83478 ?auto_83482 ) ) ( not ( = ?auto_83478 ?auto_83483 ) ) ( not ( = ?auto_83478 ?auto_83484 ) ) ( not ( = ?auto_83479 ?auto_83480 ) ) ( not ( = ?auto_83479 ?auto_83481 ) ) ( not ( = ?auto_83479 ?auto_83482 ) ) ( not ( = ?auto_83479 ?auto_83483 ) ) ( not ( = ?auto_83479 ?auto_83484 ) ) ( not ( = ?auto_83480 ?auto_83481 ) ) ( not ( = ?auto_83480 ?auto_83482 ) ) ( not ( = ?auto_83480 ?auto_83483 ) ) ( not ( = ?auto_83480 ?auto_83484 ) ) ( not ( = ?auto_83481 ?auto_83482 ) ) ( not ( = ?auto_83481 ?auto_83483 ) ) ( not ( = ?auto_83481 ?auto_83484 ) ) ( not ( = ?auto_83482 ?auto_83483 ) ) ( not ( = ?auto_83482 ?auto_83484 ) ) ( not ( = ?auto_83483 ?auto_83484 ) ) ( ON ?auto_83475 ?auto_83485 ) ( not ( = ?auto_83484 ?auto_83485 ) ) ( not ( = ?auto_83483 ?auto_83485 ) ) ( not ( = ?auto_83482 ?auto_83485 ) ) ( not ( = ?auto_83481 ?auto_83485 ) ) ( not ( = ?auto_83480 ?auto_83485 ) ) ( not ( = ?auto_83479 ?auto_83485 ) ) ( not ( = ?auto_83478 ?auto_83485 ) ) ( not ( = ?auto_83477 ?auto_83485 ) ) ( not ( = ?auto_83476 ?auto_83485 ) ) ( not ( = ?auto_83475 ?auto_83485 ) ) ( ON ?auto_83476 ?auto_83475 ) ( ON ?auto_83477 ?auto_83476 ) ( ON ?auto_83478 ?auto_83477 ) ( ON ?auto_83479 ?auto_83478 ) ( ON ?auto_83480 ?auto_83479 ) ( ON ?auto_83481 ?auto_83480 ) ( ON ?auto_83482 ?auto_83481 ) ( ON ?auto_83483 ?auto_83482 ) ( ON ?auto_83484 ?auto_83483 ) ( CLEAR ?auto_83484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_83484 ?auto_83483 ?auto_83482 ?auto_83481 ?auto_83480 ?auto_83479 ?auto_83478 ?auto_83477 ?auto_83476 ?auto_83475 )
      ( MAKE-10PILE ?auto_83475 ?auto_83476 ?auto_83477 ?auto_83478 ?auto_83479 ?auto_83480 ?auto_83481 ?auto_83482 ?auto_83483 ?auto_83484 ) )
  )

)

