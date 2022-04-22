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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5873 - BLOCK
      ?auto_5874 - BLOCK
      ?auto_5875 - BLOCK
    )
    :vars
    (
      ?auto_5876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5876 ?auto_5875 ) ( CLEAR ?auto_5876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5873 ) ( ON ?auto_5874 ?auto_5873 ) ( ON ?auto_5875 ?auto_5874 ) ( not ( = ?auto_5873 ?auto_5874 ) ) ( not ( = ?auto_5873 ?auto_5875 ) ) ( not ( = ?auto_5873 ?auto_5876 ) ) ( not ( = ?auto_5874 ?auto_5875 ) ) ( not ( = ?auto_5874 ?auto_5876 ) ) ( not ( = ?auto_5875 ?auto_5876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5876 ?auto_5875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5879 - BLOCK
    )
    :vars
    (
      ?auto_5880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5879 ?auto_5880 ) ( CLEAR ?auto_5879 ) ( HAND-EMPTY ) ( not ( = ?auto_5879 ?auto_5880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5879 ?auto_5880 )
      ( MAKE-1PILE ?auto_5879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5883 - BLOCK
      ?auto_5884 - BLOCK
    )
    :vars
    (
      ?auto_5885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5885 ?auto_5884 ) ( CLEAR ?auto_5885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5883 ) ( ON ?auto_5884 ?auto_5883 ) ( not ( = ?auto_5883 ?auto_5884 ) ) ( not ( = ?auto_5883 ?auto_5885 ) ) ( not ( = ?auto_5884 ?auto_5885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5885 ?auto_5884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5886 - BLOCK
      ?auto_5887 - BLOCK
    )
    :vars
    (
      ?auto_5888 - BLOCK
      ?auto_5889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5888 ?auto_5887 ) ( CLEAR ?auto_5888 ) ( ON-TABLE ?auto_5886 ) ( ON ?auto_5887 ?auto_5886 ) ( not ( = ?auto_5886 ?auto_5887 ) ) ( not ( = ?auto_5886 ?auto_5888 ) ) ( not ( = ?auto_5887 ?auto_5888 ) ) ( HOLDING ?auto_5889 ) ( not ( = ?auto_5886 ?auto_5889 ) ) ( not ( = ?auto_5887 ?auto_5889 ) ) ( not ( = ?auto_5888 ?auto_5889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5889 )
      ( MAKE-2PILE ?auto_5886 ?auto_5887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5890 - BLOCK
      ?auto_5891 - BLOCK
    )
    :vars
    (
      ?auto_5892 - BLOCK
      ?auto_5893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5892 ?auto_5891 ) ( ON-TABLE ?auto_5890 ) ( ON ?auto_5891 ?auto_5890 ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( not ( = ?auto_5890 ?auto_5892 ) ) ( not ( = ?auto_5891 ?auto_5892 ) ) ( not ( = ?auto_5890 ?auto_5893 ) ) ( not ( = ?auto_5891 ?auto_5893 ) ) ( not ( = ?auto_5892 ?auto_5893 ) ) ( ON ?auto_5893 ?auto_5892 ) ( CLEAR ?auto_5893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5890 ?auto_5891 ?auto_5892 )
      ( MAKE-2PILE ?auto_5890 ?auto_5891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5896 - BLOCK
      ?auto_5897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5897 ) ( CLEAR ?auto_5896 ) ( ON-TABLE ?auto_5896 ) ( not ( = ?auto_5896 ?auto_5897 ) ) )
    :subtasks
    ( ( !STACK ?auto_5897 ?auto_5896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5898 - BLOCK
      ?auto_5899 - BLOCK
    )
    :vars
    (
      ?auto_5900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5898 ) ( ON-TABLE ?auto_5898 ) ( not ( = ?auto_5898 ?auto_5899 ) ) ( ON ?auto_5899 ?auto_5900 ) ( CLEAR ?auto_5899 ) ( HAND-EMPTY ) ( not ( = ?auto_5898 ?auto_5900 ) ) ( not ( = ?auto_5899 ?auto_5900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5899 ?auto_5900 )
      ( MAKE-2PILE ?auto_5898 ?auto_5899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5901 - BLOCK
      ?auto_5902 - BLOCK
    )
    :vars
    (
      ?auto_5903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5901 ?auto_5902 ) ) ( ON ?auto_5902 ?auto_5903 ) ( CLEAR ?auto_5902 ) ( not ( = ?auto_5901 ?auto_5903 ) ) ( not ( = ?auto_5902 ?auto_5903 ) ) ( HOLDING ?auto_5901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5901 )
      ( MAKE-2PILE ?auto_5901 ?auto_5902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5904 - BLOCK
      ?auto_5905 - BLOCK
    )
    :vars
    (
      ?auto_5906 - BLOCK
      ?auto_5907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5904 ?auto_5905 ) ) ( ON ?auto_5905 ?auto_5906 ) ( not ( = ?auto_5904 ?auto_5906 ) ) ( not ( = ?auto_5905 ?auto_5906 ) ) ( ON ?auto_5904 ?auto_5905 ) ( CLEAR ?auto_5904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5907 ) ( ON ?auto_5906 ?auto_5907 ) ( not ( = ?auto_5907 ?auto_5906 ) ) ( not ( = ?auto_5907 ?auto_5905 ) ) ( not ( = ?auto_5907 ?auto_5904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5907 ?auto_5906 ?auto_5905 )
      ( MAKE-2PILE ?auto_5904 ?auto_5905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5909 - BLOCK
    )
    :vars
    (
      ?auto_5910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5910 ?auto_5909 ) ( CLEAR ?auto_5910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5909 ) ( not ( = ?auto_5909 ?auto_5910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5910 ?auto_5909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5911 - BLOCK
    )
    :vars
    (
      ?auto_5912 - BLOCK
      ?auto_5913 - BLOCK
      ?auto_5914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5912 ?auto_5911 ) ( CLEAR ?auto_5912 ) ( ON-TABLE ?auto_5911 ) ( not ( = ?auto_5911 ?auto_5912 ) ) ( HOLDING ?auto_5913 ) ( CLEAR ?auto_5914 ) ( not ( = ?auto_5911 ?auto_5913 ) ) ( not ( = ?auto_5911 ?auto_5914 ) ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( not ( = ?auto_5912 ?auto_5914 ) ) ( not ( = ?auto_5913 ?auto_5914 ) ) )
    :subtasks
    ( ( !STACK ?auto_5913 ?auto_5914 )
      ( MAKE-1PILE ?auto_5911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5915 - BLOCK
    )
    :vars
    (
      ?auto_5917 - BLOCK
      ?auto_5918 - BLOCK
      ?auto_5916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5917 ?auto_5915 ) ( ON-TABLE ?auto_5915 ) ( not ( = ?auto_5915 ?auto_5917 ) ) ( CLEAR ?auto_5918 ) ( not ( = ?auto_5915 ?auto_5916 ) ) ( not ( = ?auto_5915 ?auto_5918 ) ) ( not ( = ?auto_5917 ?auto_5916 ) ) ( not ( = ?auto_5917 ?auto_5918 ) ) ( not ( = ?auto_5916 ?auto_5918 ) ) ( ON ?auto_5916 ?auto_5917 ) ( CLEAR ?auto_5916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5915 ?auto_5917 )
      ( MAKE-1PILE ?auto_5915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5919 - BLOCK
    )
    :vars
    (
      ?auto_5920 - BLOCK
      ?auto_5922 - BLOCK
      ?auto_5921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5920 ?auto_5919 ) ( ON-TABLE ?auto_5919 ) ( not ( = ?auto_5919 ?auto_5920 ) ) ( not ( = ?auto_5919 ?auto_5922 ) ) ( not ( = ?auto_5919 ?auto_5921 ) ) ( not ( = ?auto_5920 ?auto_5922 ) ) ( not ( = ?auto_5920 ?auto_5921 ) ) ( not ( = ?auto_5922 ?auto_5921 ) ) ( ON ?auto_5922 ?auto_5920 ) ( CLEAR ?auto_5922 ) ( HOLDING ?auto_5921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5921 )
      ( MAKE-1PILE ?auto_5919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5923 - BLOCK
    )
    :vars
    (
      ?auto_5925 - BLOCK
      ?auto_5926 - BLOCK
      ?auto_5924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5925 ?auto_5923 ) ( ON-TABLE ?auto_5923 ) ( not ( = ?auto_5923 ?auto_5925 ) ) ( not ( = ?auto_5923 ?auto_5926 ) ) ( not ( = ?auto_5923 ?auto_5924 ) ) ( not ( = ?auto_5925 ?auto_5926 ) ) ( not ( = ?auto_5925 ?auto_5924 ) ) ( not ( = ?auto_5926 ?auto_5924 ) ) ( ON ?auto_5926 ?auto_5925 ) ( ON ?auto_5924 ?auto_5926 ) ( CLEAR ?auto_5924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5923 ?auto_5925 ?auto_5926 )
      ( MAKE-1PILE ?auto_5923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5930 - BLOCK
      ?auto_5931 - BLOCK
      ?auto_5932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5932 ) ( CLEAR ?auto_5931 ) ( ON-TABLE ?auto_5930 ) ( ON ?auto_5931 ?auto_5930 ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5932 ) ) )
    :subtasks
    ( ( !STACK ?auto_5932 ?auto_5931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5933 - BLOCK
      ?auto_5934 - BLOCK
      ?auto_5935 - BLOCK
    )
    :vars
    (
      ?auto_5936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5934 ) ( ON-TABLE ?auto_5933 ) ( ON ?auto_5934 ?auto_5933 ) ( not ( = ?auto_5933 ?auto_5934 ) ) ( not ( = ?auto_5933 ?auto_5935 ) ) ( not ( = ?auto_5934 ?auto_5935 ) ) ( ON ?auto_5935 ?auto_5936 ) ( CLEAR ?auto_5935 ) ( HAND-EMPTY ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( not ( = ?auto_5934 ?auto_5936 ) ) ( not ( = ?auto_5935 ?auto_5936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5935 ?auto_5936 )
      ( MAKE-3PILE ?auto_5933 ?auto_5934 ?auto_5935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5937 - BLOCK
      ?auto_5938 - BLOCK
      ?auto_5939 - BLOCK
    )
    :vars
    (
      ?auto_5940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5937 ) ( not ( = ?auto_5937 ?auto_5938 ) ) ( not ( = ?auto_5937 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( ON ?auto_5939 ?auto_5940 ) ( CLEAR ?auto_5939 ) ( not ( = ?auto_5937 ?auto_5940 ) ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( HOLDING ?auto_5938 ) ( CLEAR ?auto_5937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5937 ?auto_5938 )
      ( MAKE-3PILE ?auto_5937 ?auto_5938 ?auto_5939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5941 - BLOCK
      ?auto_5942 - BLOCK
      ?auto_5943 - BLOCK
    )
    :vars
    (
      ?auto_5944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5941 ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( ON ?auto_5943 ?auto_5944 ) ( not ( = ?auto_5941 ?auto_5944 ) ) ( not ( = ?auto_5942 ?auto_5944 ) ) ( not ( = ?auto_5943 ?auto_5944 ) ) ( CLEAR ?auto_5941 ) ( ON ?auto_5942 ?auto_5943 ) ( CLEAR ?auto_5942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5944 ?auto_5943 )
      ( MAKE-3PILE ?auto_5941 ?auto_5942 ?auto_5943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5945 - BLOCK
      ?auto_5946 - BLOCK
      ?auto_5947 - BLOCK
    )
    :vars
    (
      ?auto_5948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5945 ?auto_5946 ) ) ( not ( = ?auto_5945 ?auto_5947 ) ) ( not ( = ?auto_5946 ?auto_5947 ) ) ( ON ?auto_5947 ?auto_5948 ) ( not ( = ?auto_5945 ?auto_5948 ) ) ( not ( = ?auto_5946 ?auto_5948 ) ) ( not ( = ?auto_5947 ?auto_5948 ) ) ( ON ?auto_5946 ?auto_5947 ) ( CLEAR ?auto_5946 ) ( ON-TABLE ?auto_5948 ) ( HOLDING ?auto_5945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5945 )
      ( MAKE-3PILE ?auto_5945 ?auto_5946 ?auto_5947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5949 - BLOCK
      ?auto_5950 - BLOCK
      ?auto_5951 - BLOCK
    )
    :vars
    (
      ?auto_5952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5949 ?auto_5950 ) ) ( not ( = ?auto_5949 ?auto_5951 ) ) ( not ( = ?auto_5950 ?auto_5951 ) ) ( ON ?auto_5951 ?auto_5952 ) ( not ( = ?auto_5949 ?auto_5952 ) ) ( not ( = ?auto_5950 ?auto_5952 ) ) ( not ( = ?auto_5951 ?auto_5952 ) ) ( ON ?auto_5950 ?auto_5951 ) ( ON-TABLE ?auto_5952 ) ( ON ?auto_5949 ?auto_5950 ) ( CLEAR ?auto_5949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5952 ?auto_5951 ?auto_5950 )
      ( MAKE-3PILE ?auto_5949 ?auto_5950 ?auto_5951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5955 - BLOCK
      ?auto_5956 - BLOCK
    )
    :vars
    (
      ?auto_5957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5957 ?auto_5956 ) ( CLEAR ?auto_5957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5955 ) ( ON ?auto_5956 ?auto_5955 ) ( not ( = ?auto_5955 ?auto_5956 ) ) ( not ( = ?auto_5955 ?auto_5957 ) ) ( not ( = ?auto_5956 ?auto_5957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5957 ?auto_5956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5965 - BLOCK
      ?auto_5966 - BLOCK
    )
    :vars
    (
      ?auto_5967 - BLOCK
      ?auto_5968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5965 ) ( not ( = ?auto_5965 ?auto_5966 ) ) ( not ( = ?auto_5965 ?auto_5967 ) ) ( not ( = ?auto_5966 ?auto_5967 ) ) ( ON ?auto_5967 ?auto_5968 ) ( CLEAR ?auto_5967 ) ( not ( = ?auto_5965 ?auto_5968 ) ) ( not ( = ?auto_5966 ?auto_5968 ) ) ( not ( = ?auto_5967 ?auto_5968 ) ) ( HOLDING ?auto_5966 ) ( CLEAR ?auto_5965 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5965 ?auto_5966 ?auto_5967 )
      ( MAKE-2PILE ?auto_5965 ?auto_5966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5969 - BLOCK
      ?auto_5970 - BLOCK
    )
    :vars
    (
      ?auto_5972 - BLOCK
      ?auto_5971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5969 ) ( not ( = ?auto_5969 ?auto_5970 ) ) ( not ( = ?auto_5969 ?auto_5972 ) ) ( not ( = ?auto_5970 ?auto_5972 ) ) ( ON ?auto_5972 ?auto_5971 ) ( not ( = ?auto_5969 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( not ( = ?auto_5972 ?auto_5971 ) ) ( CLEAR ?auto_5969 ) ( ON ?auto_5970 ?auto_5972 ) ( CLEAR ?auto_5970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5971 ?auto_5972 )
      ( MAKE-2PILE ?auto_5969 ?auto_5970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5973 - BLOCK
      ?auto_5974 - BLOCK
    )
    :vars
    (
      ?auto_5976 - BLOCK
      ?auto_5975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5973 ?auto_5974 ) ) ( not ( = ?auto_5973 ?auto_5976 ) ) ( not ( = ?auto_5974 ?auto_5976 ) ) ( ON ?auto_5976 ?auto_5975 ) ( not ( = ?auto_5973 ?auto_5975 ) ) ( not ( = ?auto_5974 ?auto_5975 ) ) ( not ( = ?auto_5976 ?auto_5975 ) ) ( ON ?auto_5974 ?auto_5976 ) ( CLEAR ?auto_5974 ) ( ON-TABLE ?auto_5975 ) ( HOLDING ?auto_5973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5973 )
      ( MAKE-2PILE ?auto_5973 ?auto_5974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5977 - BLOCK
      ?auto_5978 - BLOCK
    )
    :vars
    (
      ?auto_5980 - BLOCK
      ?auto_5979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5977 ?auto_5978 ) ) ( not ( = ?auto_5977 ?auto_5980 ) ) ( not ( = ?auto_5978 ?auto_5980 ) ) ( ON ?auto_5980 ?auto_5979 ) ( not ( = ?auto_5977 ?auto_5979 ) ) ( not ( = ?auto_5978 ?auto_5979 ) ) ( not ( = ?auto_5980 ?auto_5979 ) ) ( ON ?auto_5978 ?auto_5980 ) ( ON-TABLE ?auto_5979 ) ( ON ?auto_5977 ?auto_5978 ) ( CLEAR ?auto_5977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5979 ?auto_5980 ?auto_5978 )
      ( MAKE-2PILE ?auto_5977 ?auto_5978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5983 - BLOCK
    )
    :vars
    (
      ?auto_5984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5983 ?auto_5984 ) ( CLEAR ?auto_5983 ) ( HAND-EMPTY ) ( not ( = ?auto_5983 ?auto_5984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5983 ?auto_5984 )
      ( MAKE-1PILE ?auto_5983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5985 - BLOCK
    )
    :vars
    (
      ?auto_5986 - BLOCK
      ?auto_5987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5985 ?auto_5986 ) ) ( HOLDING ?auto_5985 ) ( CLEAR ?auto_5986 ) ( ON-TABLE ?auto_5987 ) ( ON ?auto_5986 ?auto_5987 ) ( not ( = ?auto_5987 ?auto_5986 ) ) ( not ( = ?auto_5987 ?auto_5985 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5987 ?auto_5986 ?auto_5985 )
      ( MAKE-1PILE ?auto_5985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5988 - BLOCK
    )
    :vars
    (
      ?auto_5989 - BLOCK
      ?auto_5990 - BLOCK
      ?auto_5991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5988 ?auto_5989 ) ) ( CLEAR ?auto_5989 ) ( ON-TABLE ?auto_5990 ) ( ON ?auto_5989 ?auto_5990 ) ( not ( = ?auto_5990 ?auto_5989 ) ) ( not ( = ?auto_5990 ?auto_5988 ) ) ( ON ?auto_5988 ?auto_5991 ) ( CLEAR ?auto_5988 ) ( HAND-EMPTY ) ( not ( = ?auto_5988 ?auto_5991 ) ) ( not ( = ?auto_5989 ?auto_5991 ) ) ( not ( = ?auto_5990 ?auto_5991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5988 ?auto_5991 )
      ( MAKE-1PILE ?auto_5988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5992 - BLOCK
    )
    :vars
    (
      ?auto_5995 - BLOCK
      ?auto_5994 - BLOCK
      ?auto_5993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5992 ?auto_5995 ) ) ( ON-TABLE ?auto_5994 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_5992 ) ) ( ON ?auto_5992 ?auto_5993 ) ( CLEAR ?auto_5992 ) ( not ( = ?auto_5992 ?auto_5993 ) ) ( not ( = ?auto_5995 ?auto_5993 ) ) ( not ( = ?auto_5994 ?auto_5993 ) ) ( HOLDING ?auto_5995 ) ( CLEAR ?auto_5994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5994 ?auto_5995 )
      ( MAKE-1PILE ?auto_5992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5996 - BLOCK
    )
    :vars
    (
      ?auto_5999 - BLOCK
      ?auto_5998 - BLOCK
      ?auto_5997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5996 ?auto_5999 ) ) ( ON-TABLE ?auto_5998 ) ( not ( = ?auto_5998 ?auto_5999 ) ) ( not ( = ?auto_5998 ?auto_5996 ) ) ( ON ?auto_5996 ?auto_5997 ) ( not ( = ?auto_5996 ?auto_5997 ) ) ( not ( = ?auto_5999 ?auto_5997 ) ) ( not ( = ?auto_5998 ?auto_5997 ) ) ( CLEAR ?auto_5998 ) ( ON ?auto_5999 ?auto_5996 ) ( CLEAR ?auto_5999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5997 ?auto_5996 )
      ( MAKE-1PILE ?auto_5996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6000 - BLOCK
    )
    :vars
    (
      ?auto_6001 - BLOCK
      ?auto_6003 - BLOCK
      ?auto_6002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6000 ?auto_6001 ) ) ( not ( = ?auto_6003 ?auto_6001 ) ) ( not ( = ?auto_6003 ?auto_6000 ) ) ( ON ?auto_6000 ?auto_6002 ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6003 ?auto_6002 ) ) ( ON ?auto_6001 ?auto_6000 ) ( CLEAR ?auto_6001 ) ( ON-TABLE ?auto_6002 ) ( HOLDING ?auto_6003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6003 )
      ( MAKE-1PILE ?auto_6000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6004 - BLOCK
    )
    :vars
    (
      ?auto_6005 - BLOCK
      ?auto_6006 - BLOCK
      ?auto_6007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6004 ?auto_6005 ) ) ( not ( = ?auto_6006 ?auto_6005 ) ) ( not ( = ?auto_6006 ?auto_6004 ) ) ( ON ?auto_6004 ?auto_6007 ) ( not ( = ?auto_6004 ?auto_6007 ) ) ( not ( = ?auto_6005 ?auto_6007 ) ) ( not ( = ?auto_6006 ?auto_6007 ) ) ( ON ?auto_6005 ?auto_6004 ) ( ON-TABLE ?auto_6007 ) ( ON ?auto_6006 ?auto_6005 ) ( CLEAR ?auto_6006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6007 ?auto_6004 ?auto_6005 )
      ( MAKE-1PILE ?auto_6004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6009 - BLOCK
    )
    :vars
    (
      ?auto_6010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6010 ?auto_6009 ) ( CLEAR ?auto_6010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6009 ) ( not ( = ?auto_6009 ?auto_6010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6010 ?auto_6009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6011 - BLOCK
    )
    :vars
    (
      ?auto_6012 - BLOCK
      ?auto_6013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6012 ?auto_6011 ) ( CLEAR ?auto_6012 ) ( ON-TABLE ?auto_6011 ) ( not ( = ?auto_6011 ?auto_6012 ) ) ( HOLDING ?auto_6013 ) ( not ( = ?auto_6011 ?auto_6013 ) ) ( not ( = ?auto_6012 ?auto_6013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6013 )
      ( MAKE-1PILE ?auto_6011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6014 - BLOCK
    )
    :vars
    (
      ?auto_6015 - BLOCK
      ?auto_6016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6015 ?auto_6014 ) ( ON-TABLE ?auto_6014 ) ( not ( = ?auto_6014 ?auto_6015 ) ) ( not ( = ?auto_6014 ?auto_6016 ) ) ( not ( = ?auto_6015 ?auto_6016 ) ) ( ON ?auto_6016 ?auto_6015 ) ( CLEAR ?auto_6016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6014 ?auto_6015 )
      ( MAKE-1PILE ?auto_6014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6017 - BLOCK
    )
    :vars
    (
      ?auto_6018 - BLOCK
      ?auto_6019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6018 ?auto_6017 ) ( ON-TABLE ?auto_6017 ) ( not ( = ?auto_6017 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( HOLDING ?auto_6019 ) ( CLEAR ?auto_6018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6017 ?auto_6018 ?auto_6019 )
      ( MAKE-1PILE ?auto_6017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6020 - BLOCK
    )
    :vars
    (
      ?auto_6021 - BLOCK
      ?auto_6022 - BLOCK
      ?auto_6023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6021 ?auto_6020 ) ( ON-TABLE ?auto_6020 ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( not ( = ?auto_6020 ?auto_6022 ) ) ( not ( = ?auto_6021 ?auto_6022 ) ) ( CLEAR ?auto_6021 ) ( ON ?auto_6022 ?auto_6023 ) ( CLEAR ?auto_6022 ) ( HAND-EMPTY ) ( not ( = ?auto_6020 ?auto_6023 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( not ( = ?auto_6022 ?auto_6023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6022 ?auto_6023 )
      ( MAKE-1PILE ?auto_6020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6032 - BLOCK
    )
    :vars
    (
      ?auto_6035 - BLOCK
      ?auto_6033 - BLOCK
      ?auto_6034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6032 ?auto_6035 ) ) ( not ( = ?auto_6032 ?auto_6033 ) ) ( not ( = ?auto_6035 ?auto_6033 ) ) ( ON ?auto_6033 ?auto_6034 ) ( not ( = ?auto_6032 ?auto_6034 ) ) ( not ( = ?auto_6035 ?auto_6034 ) ) ( not ( = ?auto_6033 ?auto_6034 ) ) ( ON ?auto_6035 ?auto_6033 ) ( CLEAR ?auto_6035 ) ( HOLDING ?auto_6032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6032 ?auto_6035 )
      ( MAKE-1PILE ?auto_6032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6036 - BLOCK
    )
    :vars
    (
      ?auto_6037 - BLOCK
      ?auto_6038 - BLOCK
      ?auto_6039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6036 ?auto_6037 ) ) ( not ( = ?auto_6036 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( ON ?auto_6038 ?auto_6039 ) ( not ( = ?auto_6036 ?auto_6039 ) ) ( not ( = ?auto_6037 ?auto_6039 ) ) ( not ( = ?auto_6038 ?auto_6039 ) ) ( ON ?auto_6037 ?auto_6038 ) ( ON ?auto_6036 ?auto_6037 ) ( CLEAR ?auto_6036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6039 ?auto_6038 ?auto_6037 )
      ( MAKE-1PILE ?auto_6036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6042 - BLOCK
      ?auto_6043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6043 ) ( CLEAR ?auto_6042 ) ( ON-TABLE ?auto_6042 ) ( not ( = ?auto_6042 ?auto_6043 ) ) )
    :subtasks
    ( ( !STACK ?auto_6043 ?auto_6042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6044 - BLOCK
      ?auto_6045 - BLOCK
    )
    :vars
    (
      ?auto_6046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6044 ) ( ON-TABLE ?auto_6044 ) ( not ( = ?auto_6044 ?auto_6045 ) ) ( ON ?auto_6045 ?auto_6046 ) ( CLEAR ?auto_6045 ) ( HAND-EMPTY ) ( not ( = ?auto_6044 ?auto_6046 ) ) ( not ( = ?auto_6045 ?auto_6046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6045 ?auto_6046 )
      ( MAKE-2PILE ?auto_6044 ?auto_6045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6047 - BLOCK
      ?auto_6048 - BLOCK
    )
    :vars
    (
      ?auto_6049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6047 ?auto_6048 ) ) ( ON ?auto_6048 ?auto_6049 ) ( CLEAR ?auto_6048 ) ( not ( = ?auto_6047 ?auto_6049 ) ) ( not ( = ?auto_6048 ?auto_6049 ) ) ( HOLDING ?auto_6047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6047 )
      ( MAKE-2PILE ?auto_6047 ?auto_6048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6050 - BLOCK
      ?auto_6051 - BLOCK
    )
    :vars
    (
      ?auto_6052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6050 ?auto_6051 ) ) ( ON ?auto_6051 ?auto_6052 ) ( not ( = ?auto_6050 ?auto_6052 ) ) ( not ( = ?auto_6051 ?auto_6052 ) ) ( ON ?auto_6050 ?auto_6051 ) ( CLEAR ?auto_6050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6052 ?auto_6051 )
      ( MAKE-2PILE ?auto_6050 ?auto_6051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6053 - BLOCK
      ?auto_6054 - BLOCK
    )
    :vars
    (
      ?auto_6055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6053 ?auto_6054 ) ) ( ON ?auto_6054 ?auto_6055 ) ( not ( = ?auto_6053 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( ON-TABLE ?auto_6055 ) ( HOLDING ?auto_6053 ) ( CLEAR ?auto_6054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6055 ?auto_6054 ?auto_6053 )
      ( MAKE-2PILE ?auto_6053 ?auto_6054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6056 - BLOCK
      ?auto_6057 - BLOCK
    )
    :vars
    (
      ?auto_6058 - BLOCK
      ?auto_6059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6056 ?auto_6057 ) ) ( ON ?auto_6057 ?auto_6058 ) ( not ( = ?auto_6056 ?auto_6058 ) ) ( not ( = ?auto_6057 ?auto_6058 ) ) ( ON-TABLE ?auto_6058 ) ( CLEAR ?auto_6057 ) ( ON ?auto_6056 ?auto_6059 ) ( CLEAR ?auto_6056 ) ( HAND-EMPTY ) ( not ( = ?auto_6056 ?auto_6059 ) ) ( not ( = ?auto_6057 ?auto_6059 ) ) ( not ( = ?auto_6058 ?auto_6059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6056 ?auto_6059 )
      ( MAKE-2PILE ?auto_6056 ?auto_6057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6060 - BLOCK
      ?auto_6061 - BLOCK
    )
    :vars
    (
      ?auto_6063 - BLOCK
      ?auto_6062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6060 ?auto_6061 ) ) ( not ( = ?auto_6060 ?auto_6063 ) ) ( not ( = ?auto_6061 ?auto_6063 ) ) ( ON-TABLE ?auto_6063 ) ( ON ?auto_6060 ?auto_6062 ) ( CLEAR ?auto_6060 ) ( not ( = ?auto_6060 ?auto_6062 ) ) ( not ( = ?auto_6061 ?auto_6062 ) ) ( not ( = ?auto_6063 ?auto_6062 ) ) ( HOLDING ?auto_6061 ) ( CLEAR ?auto_6063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6063 ?auto_6061 )
      ( MAKE-2PILE ?auto_6060 ?auto_6061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6064 - BLOCK
      ?auto_6065 - BLOCK
    )
    :vars
    (
      ?auto_6066 - BLOCK
      ?auto_6067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6064 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) ( ON-TABLE ?auto_6066 ) ( ON ?auto_6064 ?auto_6067 ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6065 ?auto_6067 ) ) ( not ( = ?auto_6066 ?auto_6067 ) ) ( CLEAR ?auto_6066 ) ( ON ?auto_6065 ?auto_6064 ) ( CLEAR ?auto_6065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6067 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6067 ?auto_6064 )
      ( MAKE-2PILE ?auto_6064 ?auto_6065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6068 - BLOCK
      ?auto_6069 - BLOCK
    )
    :vars
    (
      ?auto_6071 - BLOCK
      ?auto_6070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6068 ?auto_6069 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6069 ?auto_6071 ) ) ( ON ?auto_6068 ?auto_6070 ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( not ( = ?auto_6071 ?auto_6070 ) ) ( ON ?auto_6069 ?auto_6068 ) ( CLEAR ?auto_6069 ) ( ON-TABLE ?auto_6070 ) ( HOLDING ?auto_6071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6071 )
      ( MAKE-2PILE ?auto_6068 ?auto_6069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6072 - BLOCK
      ?auto_6073 - BLOCK
    )
    :vars
    (
      ?auto_6075 - BLOCK
      ?auto_6074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6075 ) ) ( not ( = ?auto_6073 ?auto_6075 ) ) ( ON ?auto_6072 ?auto_6074 ) ( not ( = ?auto_6072 ?auto_6074 ) ) ( not ( = ?auto_6073 ?auto_6074 ) ) ( not ( = ?auto_6075 ?auto_6074 ) ) ( ON ?auto_6073 ?auto_6072 ) ( ON-TABLE ?auto_6074 ) ( ON ?auto_6075 ?auto_6073 ) ( CLEAR ?auto_6075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6074 ?auto_6072 ?auto_6073 )
      ( MAKE-2PILE ?auto_6072 ?auto_6073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6079 - BLOCK
      ?auto_6080 - BLOCK
      ?auto_6081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6081 ) ( CLEAR ?auto_6080 ) ( ON-TABLE ?auto_6079 ) ( ON ?auto_6080 ?auto_6079 ) ( not ( = ?auto_6079 ?auto_6080 ) ) ( not ( = ?auto_6079 ?auto_6081 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) )
    :subtasks
    ( ( !STACK ?auto_6081 ?auto_6080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6082 - BLOCK
      ?auto_6083 - BLOCK
      ?auto_6084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6083 ) ( ON-TABLE ?auto_6082 ) ( ON ?auto_6083 ?auto_6082 ) ( not ( = ?auto_6082 ?auto_6083 ) ) ( not ( = ?auto_6082 ?auto_6084 ) ) ( not ( = ?auto_6083 ?auto_6084 ) ) ( ON-TABLE ?auto_6084 ) ( CLEAR ?auto_6084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_6084 )
      ( MAKE-3PILE ?auto_6082 ?auto_6083 ?auto_6084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6085 - BLOCK
      ?auto_6086 - BLOCK
      ?auto_6087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6085 ) ( not ( = ?auto_6085 ?auto_6086 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( ON-TABLE ?auto_6087 ) ( CLEAR ?auto_6087 ) ( HOLDING ?auto_6086 ) ( CLEAR ?auto_6085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6085 ?auto_6086 )
      ( MAKE-3PILE ?auto_6085 ?auto_6086 ?auto_6087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6088 - BLOCK
      ?auto_6089 - BLOCK
      ?auto_6090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6088 ) ( not ( = ?auto_6088 ?auto_6089 ) ) ( not ( = ?auto_6088 ?auto_6090 ) ) ( not ( = ?auto_6089 ?auto_6090 ) ) ( ON-TABLE ?auto_6090 ) ( CLEAR ?auto_6088 ) ( ON ?auto_6089 ?auto_6090 ) ( CLEAR ?auto_6089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6090 )
      ( MAKE-3PILE ?auto_6088 ?auto_6089 ?auto_6090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6091 - BLOCK
      ?auto_6092 - BLOCK
      ?auto_6093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6091 ?auto_6092 ) ) ( not ( = ?auto_6091 ?auto_6093 ) ) ( not ( = ?auto_6092 ?auto_6093 ) ) ( ON-TABLE ?auto_6093 ) ( ON ?auto_6092 ?auto_6093 ) ( CLEAR ?auto_6092 ) ( HOLDING ?auto_6091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6091 )
      ( MAKE-3PILE ?auto_6091 ?auto_6092 ?auto_6093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6094 - BLOCK
      ?auto_6095 - BLOCK
      ?auto_6096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6094 ?auto_6095 ) ) ( not ( = ?auto_6094 ?auto_6096 ) ) ( not ( = ?auto_6095 ?auto_6096 ) ) ( ON-TABLE ?auto_6096 ) ( ON ?auto_6095 ?auto_6096 ) ( ON ?auto_6094 ?auto_6095 ) ( CLEAR ?auto_6094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6096 ?auto_6095 )
      ( MAKE-3PILE ?auto_6094 ?auto_6095 ?auto_6096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6097 - BLOCK
      ?auto_6098 - BLOCK
      ?auto_6099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6097 ?auto_6098 ) ) ( not ( = ?auto_6097 ?auto_6099 ) ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( ON-TABLE ?auto_6099 ) ( ON ?auto_6098 ?auto_6099 ) ( HOLDING ?auto_6097 ) ( CLEAR ?auto_6098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6099 ?auto_6098 ?auto_6097 )
      ( MAKE-3PILE ?auto_6097 ?auto_6098 ?auto_6099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6100 - BLOCK
      ?auto_6101 - BLOCK
      ?auto_6102 - BLOCK
    )
    :vars
    (
      ?auto_6103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6100 ?auto_6101 ) ) ( not ( = ?auto_6100 ?auto_6102 ) ) ( not ( = ?auto_6101 ?auto_6102 ) ) ( ON-TABLE ?auto_6102 ) ( ON ?auto_6101 ?auto_6102 ) ( CLEAR ?auto_6101 ) ( ON ?auto_6100 ?auto_6103 ) ( CLEAR ?auto_6100 ) ( HAND-EMPTY ) ( not ( = ?auto_6100 ?auto_6103 ) ) ( not ( = ?auto_6101 ?auto_6103 ) ) ( not ( = ?auto_6102 ?auto_6103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6100 ?auto_6103 )
      ( MAKE-3PILE ?auto_6100 ?auto_6101 ?auto_6102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6104 - BLOCK
      ?auto_6105 - BLOCK
      ?auto_6106 - BLOCK
    )
    :vars
    (
      ?auto_6107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6104 ?auto_6105 ) ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( not ( = ?auto_6105 ?auto_6106 ) ) ( ON-TABLE ?auto_6106 ) ( ON ?auto_6104 ?auto_6107 ) ( CLEAR ?auto_6104 ) ( not ( = ?auto_6104 ?auto_6107 ) ) ( not ( = ?auto_6105 ?auto_6107 ) ) ( not ( = ?auto_6106 ?auto_6107 ) ) ( HOLDING ?auto_6105 ) ( CLEAR ?auto_6106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6106 ?auto_6105 )
      ( MAKE-3PILE ?auto_6104 ?auto_6105 ?auto_6106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6108 - BLOCK
      ?auto_6109 - BLOCK
      ?auto_6110 - BLOCK
    )
    :vars
    (
      ?auto_6111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6108 ?auto_6109 ) ) ( not ( = ?auto_6108 ?auto_6110 ) ) ( not ( = ?auto_6109 ?auto_6110 ) ) ( ON-TABLE ?auto_6110 ) ( ON ?auto_6108 ?auto_6111 ) ( not ( = ?auto_6108 ?auto_6111 ) ) ( not ( = ?auto_6109 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( CLEAR ?auto_6110 ) ( ON ?auto_6109 ?auto_6108 ) ( CLEAR ?auto_6109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6111 ?auto_6108 )
      ( MAKE-3PILE ?auto_6108 ?auto_6109 ?auto_6110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6112 - BLOCK
      ?auto_6113 - BLOCK
      ?auto_6114 - BLOCK
    )
    :vars
    (
      ?auto_6115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6112 ?auto_6113 ) ) ( not ( = ?auto_6112 ?auto_6114 ) ) ( not ( = ?auto_6113 ?auto_6114 ) ) ( ON ?auto_6112 ?auto_6115 ) ( not ( = ?auto_6112 ?auto_6115 ) ) ( not ( = ?auto_6113 ?auto_6115 ) ) ( not ( = ?auto_6114 ?auto_6115 ) ) ( ON ?auto_6113 ?auto_6112 ) ( CLEAR ?auto_6113 ) ( ON-TABLE ?auto_6115 ) ( HOLDING ?auto_6114 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6114 )
      ( MAKE-3PILE ?auto_6112 ?auto_6113 ?auto_6114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6116 - BLOCK
      ?auto_6117 - BLOCK
      ?auto_6118 - BLOCK
    )
    :vars
    (
      ?auto_6119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6116 ?auto_6117 ) ) ( not ( = ?auto_6116 ?auto_6118 ) ) ( not ( = ?auto_6117 ?auto_6118 ) ) ( ON ?auto_6116 ?auto_6119 ) ( not ( = ?auto_6116 ?auto_6119 ) ) ( not ( = ?auto_6117 ?auto_6119 ) ) ( not ( = ?auto_6118 ?auto_6119 ) ) ( ON ?auto_6117 ?auto_6116 ) ( ON-TABLE ?auto_6119 ) ( ON ?auto_6118 ?auto_6117 ) ( CLEAR ?auto_6118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6119 ?auto_6116 ?auto_6117 )
      ( MAKE-3PILE ?auto_6116 ?auto_6117 ?auto_6118 ) )
  )

)

