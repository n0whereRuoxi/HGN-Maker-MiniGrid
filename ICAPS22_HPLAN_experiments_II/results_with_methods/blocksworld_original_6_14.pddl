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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64832 - BLOCK
      ?auto_64833 - BLOCK
      ?auto_64834 - BLOCK
      ?auto_64835 - BLOCK
      ?auto_64836 - BLOCK
      ?auto_64837 - BLOCK
    )
    :vars
    (
      ?auto_64838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64838 ?auto_64837 ) ( CLEAR ?auto_64838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64832 ) ( ON ?auto_64833 ?auto_64832 ) ( ON ?auto_64834 ?auto_64833 ) ( ON ?auto_64835 ?auto_64834 ) ( ON ?auto_64836 ?auto_64835 ) ( ON ?auto_64837 ?auto_64836 ) ( not ( = ?auto_64832 ?auto_64833 ) ) ( not ( = ?auto_64832 ?auto_64834 ) ) ( not ( = ?auto_64832 ?auto_64835 ) ) ( not ( = ?auto_64832 ?auto_64836 ) ) ( not ( = ?auto_64832 ?auto_64837 ) ) ( not ( = ?auto_64832 ?auto_64838 ) ) ( not ( = ?auto_64833 ?auto_64834 ) ) ( not ( = ?auto_64833 ?auto_64835 ) ) ( not ( = ?auto_64833 ?auto_64836 ) ) ( not ( = ?auto_64833 ?auto_64837 ) ) ( not ( = ?auto_64833 ?auto_64838 ) ) ( not ( = ?auto_64834 ?auto_64835 ) ) ( not ( = ?auto_64834 ?auto_64836 ) ) ( not ( = ?auto_64834 ?auto_64837 ) ) ( not ( = ?auto_64834 ?auto_64838 ) ) ( not ( = ?auto_64835 ?auto_64836 ) ) ( not ( = ?auto_64835 ?auto_64837 ) ) ( not ( = ?auto_64835 ?auto_64838 ) ) ( not ( = ?auto_64836 ?auto_64837 ) ) ( not ( = ?auto_64836 ?auto_64838 ) ) ( not ( = ?auto_64837 ?auto_64838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64838 ?auto_64837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64840 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64840 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_64840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64841 - BLOCK
    )
    :vars
    (
      ?auto_64842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64841 ?auto_64842 ) ( CLEAR ?auto_64841 ) ( HAND-EMPTY ) ( not ( = ?auto_64841 ?auto_64842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64841 ?auto_64842 )
      ( MAKE-1PILE ?auto_64841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64848 - BLOCK
      ?auto_64849 - BLOCK
      ?auto_64850 - BLOCK
      ?auto_64851 - BLOCK
      ?auto_64852 - BLOCK
    )
    :vars
    (
      ?auto_64853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64853 ?auto_64852 ) ( CLEAR ?auto_64853 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64848 ) ( ON ?auto_64849 ?auto_64848 ) ( ON ?auto_64850 ?auto_64849 ) ( ON ?auto_64851 ?auto_64850 ) ( ON ?auto_64852 ?auto_64851 ) ( not ( = ?auto_64848 ?auto_64849 ) ) ( not ( = ?auto_64848 ?auto_64850 ) ) ( not ( = ?auto_64848 ?auto_64851 ) ) ( not ( = ?auto_64848 ?auto_64852 ) ) ( not ( = ?auto_64848 ?auto_64853 ) ) ( not ( = ?auto_64849 ?auto_64850 ) ) ( not ( = ?auto_64849 ?auto_64851 ) ) ( not ( = ?auto_64849 ?auto_64852 ) ) ( not ( = ?auto_64849 ?auto_64853 ) ) ( not ( = ?auto_64850 ?auto_64851 ) ) ( not ( = ?auto_64850 ?auto_64852 ) ) ( not ( = ?auto_64850 ?auto_64853 ) ) ( not ( = ?auto_64851 ?auto_64852 ) ) ( not ( = ?auto_64851 ?auto_64853 ) ) ( not ( = ?auto_64852 ?auto_64853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64853 ?auto_64852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64854 - BLOCK
      ?auto_64855 - BLOCK
      ?auto_64856 - BLOCK
      ?auto_64857 - BLOCK
      ?auto_64858 - BLOCK
    )
    :vars
    (
      ?auto_64859 - BLOCK
      ?auto_64860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64859 ?auto_64858 ) ( CLEAR ?auto_64859 ) ( ON-TABLE ?auto_64854 ) ( ON ?auto_64855 ?auto_64854 ) ( ON ?auto_64856 ?auto_64855 ) ( ON ?auto_64857 ?auto_64856 ) ( ON ?auto_64858 ?auto_64857 ) ( not ( = ?auto_64854 ?auto_64855 ) ) ( not ( = ?auto_64854 ?auto_64856 ) ) ( not ( = ?auto_64854 ?auto_64857 ) ) ( not ( = ?auto_64854 ?auto_64858 ) ) ( not ( = ?auto_64854 ?auto_64859 ) ) ( not ( = ?auto_64855 ?auto_64856 ) ) ( not ( = ?auto_64855 ?auto_64857 ) ) ( not ( = ?auto_64855 ?auto_64858 ) ) ( not ( = ?auto_64855 ?auto_64859 ) ) ( not ( = ?auto_64856 ?auto_64857 ) ) ( not ( = ?auto_64856 ?auto_64858 ) ) ( not ( = ?auto_64856 ?auto_64859 ) ) ( not ( = ?auto_64857 ?auto_64858 ) ) ( not ( = ?auto_64857 ?auto_64859 ) ) ( not ( = ?auto_64858 ?auto_64859 ) ) ( HOLDING ?auto_64860 ) ( not ( = ?auto_64854 ?auto_64860 ) ) ( not ( = ?auto_64855 ?auto_64860 ) ) ( not ( = ?auto_64856 ?auto_64860 ) ) ( not ( = ?auto_64857 ?auto_64860 ) ) ( not ( = ?auto_64858 ?auto_64860 ) ) ( not ( = ?auto_64859 ?auto_64860 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_64860 )
      ( MAKE-5PILE ?auto_64854 ?auto_64855 ?auto_64856 ?auto_64857 ?auto_64858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64861 - BLOCK
      ?auto_64862 - BLOCK
      ?auto_64863 - BLOCK
      ?auto_64864 - BLOCK
      ?auto_64865 - BLOCK
    )
    :vars
    (
      ?auto_64867 - BLOCK
      ?auto_64866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64867 ?auto_64865 ) ( ON-TABLE ?auto_64861 ) ( ON ?auto_64862 ?auto_64861 ) ( ON ?auto_64863 ?auto_64862 ) ( ON ?auto_64864 ?auto_64863 ) ( ON ?auto_64865 ?auto_64864 ) ( not ( = ?auto_64861 ?auto_64862 ) ) ( not ( = ?auto_64861 ?auto_64863 ) ) ( not ( = ?auto_64861 ?auto_64864 ) ) ( not ( = ?auto_64861 ?auto_64865 ) ) ( not ( = ?auto_64861 ?auto_64867 ) ) ( not ( = ?auto_64862 ?auto_64863 ) ) ( not ( = ?auto_64862 ?auto_64864 ) ) ( not ( = ?auto_64862 ?auto_64865 ) ) ( not ( = ?auto_64862 ?auto_64867 ) ) ( not ( = ?auto_64863 ?auto_64864 ) ) ( not ( = ?auto_64863 ?auto_64865 ) ) ( not ( = ?auto_64863 ?auto_64867 ) ) ( not ( = ?auto_64864 ?auto_64865 ) ) ( not ( = ?auto_64864 ?auto_64867 ) ) ( not ( = ?auto_64865 ?auto_64867 ) ) ( not ( = ?auto_64861 ?auto_64866 ) ) ( not ( = ?auto_64862 ?auto_64866 ) ) ( not ( = ?auto_64863 ?auto_64866 ) ) ( not ( = ?auto_64864 ?auto_64866 ) ) ( not ( = ?auto_64865 ?auto_64866 ) ) ( not ( = ?auto_64867 ?auto_64866 ) ) ( ON ?auto_64866 ?auto_64867 ) ( CLEAR ?auto_64866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64861 ?auto_64862 ?auto_64863 ?auto_64864 ?auto_64865 ?auto_64867 )
      ( MAKE-5PILE ?auto_64861 ?auto_64862 ?auto_64863 ?auto_64864 ?auto_64865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64870 - BLOCK
      ?auto_64871 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64871 ) ( CLEAR ?auto_64870 ) ( ON-TABLE ?auto_64870 ) ( not ( = ?auto_64870 ?auto_64871 ) ) )
    :subtasks
    ( ( !STACK ?auto_64871 ?auto_64870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64872 - BLOCK
      ?auto_64873 - BLOCK
    )
    :vars
    (
      ?auto_64874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64872 ) ( ON-TABLE ?auto_64872 ) ( not ( = ?auto_64872 ?auto_64873 ) ) ( ON ?auto_64873 ?auto_64874 ) ( CLEAR ?auto_64873 ) ( HAND-EMPTY ) ( not ( = ?auto_64872 ?auto_64874 ) ) ( not ( = ?auto_64873 ?auto_64874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64873 ?auto_64874 )
      ( MAKE-2PILE ?auto_64872 ?auto_64873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64875 - BLOCK
      ?auto_64876 - BLOCK
    )
    :vars
    (
      ?auto_64877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64875 ?auto_64876 ) ) ( ON ?auto_64876 ?auto_64877 ) ( CLEAR ?auto_64876 ) ( not ( = ?auto_64875 ?auto_64877 ) ) ( not ( = ?auto_64876 ?auto_64877 ) ) ( HOLDING ?auto_64875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64875 )
      ( MAKE-2PILE ?auto_64875 ?auto_64876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64878 - BLOCK
      ?auto_64879 - BLOCK
    )
    :vars
    (
      ?auto_64880 - BLOCK
      ?auto_64883 - BLOCK
      ?auto_64882 - BLOCK
      ?auto_64881 - BLOCK
      ?auto_64884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64878 ?auto_64879 ) ) ( ON ?auto_64879 ?auto_64880 ) ( not ( = ?auto_64878 ?auto_64880 ) ) ( not ( = ?auto_64879 ?auto_64880 ) ) ( ON ?auto_64878 ?auto_64879 ) ( CLEAR ?auto_64878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64883 ) ( ON ?auto_64882 ?auto_64883 ) ( ON ?auto_64881 ?auto_64882 ) ( ON ?auto_64884 ?auto_64881 ) ( ON ?auto_64880 ?auto_64884 ) ( not ( = ?auto_64883 ?auto_64882 ) ) ( not ( = ?auto_64883 ?auto_64881 ) ) ( not ( = ?auto_64883 ?auto_64884 ) ) ( not ( = ?auto_64883 ?auto_64880 ) ) ( not ( = ?auto_64883 ?auto_64879 ) ) ( not ( = ?auto_64883 ?auto_64878 ) ) ( not ( = ?auto_64882 ?auto_64881 ) ) ( not ( = ?auto_64882 ?auto_64884 ) ) ( not ( = ?auto_64882 ?auto_64880 ) ) ( not ( = ?auto_64882 ?auto_64879 ) ) ( not ( = ?auto_64882 ?auto_64878 ) ) ( not ( = ?auto_64881 ?auto_64884 ) ) ( not ( = ?auto_64881 ?auto_64880 ) ) ( not ( = ?auto_64881 ?auto_64879 ) ) ( not ( = ?auto_64881 ?auto_64878 ) ) ( not ( = ?auto_64884 ?auto_64880 ) ) ( not ( = ?auto_64884 ?auto_64879 ) ) ( not ( = ?auto_64884 ?auto_64878 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64883 ?auto_64882 ?auto_64881 ?auto_64884 ?auto_64880 ?auto_64879 )
      ( MAKE-2PILE ?auto_64878 ?auto_64879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64889 - BLOCK
      ?auto_64890 - BLOCK
      ?auto_64891 - BLOCK
      ?auto_64892 - BLOCK
    )
    :vars
    (
      ?auto_64893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64893 ?auto_64892 ) ( CLEAR ?auto_64893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64889 ) ( ON ?auto_64890 ?auto_64889 ) ( ON ?auto_64891 ?auto_64890 ) ( ON ?auto_64892 ?auto_64891 ) ( not ( = ?auto_64889 ?auto_64890 ) ) ( not ( = ?auto_64889 ?auto_64891 ) ) ( not ( = ?auto_64889 ?auto_64892 ) ) ( not ( = ?auto_64889 ?auto_64893 ) ) ( not ( = ?auto_64890 ?auto_64891 ) ) ( not ( = ?auto_64890 ?auto_64892 ) ) ( not ( = ?auto_64890 ?auto_64893 ) ) ( not ( = ?auto_64891 ?auto_64892 ) ) ( not ( = ?auto_64891 ?auto_64893 ) ) ( not ( = ?auto_64892 ?auto_64893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64893 ?auto_64892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64894 - BLOCK
      ?auto_64895 - BLOCK
      ?auto_64896 - BLOCK
      ?auto_64897 - BLOCK
    )
    :vars
    (
      ?auto_64898 - BLOCK
      ?auto_64899 - BLOCK
      ?auto_64900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64898 ?auto_64897 ) ( CLEAR ?auto_64898 ) ( ON-TABLE ?auto_64894 ) ( ON ?auto_64895 ?auto_64894 ) ( ON ?auto_64896 ?auto_64895 ) ( ON ?auto_64897 ?auto_64896 ) ( not ( = ?auto_64894 ?auto_64895 ) ) ( not ( = ?auto_64894 ?auto_64896 ) ) ( not ( = ?auto_64894 ?auto_64897 ) ) ( not ( = ?auto_64894 ?auto_64898 ) ) ( not ( = ?auto_64895 ?auto_64896 ) ) ( not ( = ?auto_64895 ?auto_64897 ) ) ( not ( = ?auto_64895 ?auto_64898 ) ) ( not ( = ?auto_64896 ?auto_64897 ) ) ( not ( = ?auto_64896 ?auto_64898 ) ) ( not ( = ?auto_64897 ?auto_64898 ) ) ( HOLDING ?auto_64899 ) ( CLEAR ?auto_64900 ) ( not ( = ?auto_64894 ?auto_64899 ) ) ( not ( = ?auto_64894 ?auto_64900 ) ) ( not ( = ?auto_64895 ?auto_64899 ) ) ( not ( = ?auto_64895 ?auto_64900 ) ) ( not ( = ?auto_64896 ?auto_64899 ) ) ( not ( = ?auto_64896 ?auto_64900 ) ) ( not ( = ?auto_64897 ?auto_64899 ) ) ( not ( = ?auto_64897 ?auto_64900 ) ) ( not ( = ?auto_64898 ?auto_64899 ) ) ( not ( = ?auto_64898 ?auto_64900 ) ) ( not ( = ?auto_64899 ?auto_64900 ) ) )
    :subtasks
    ( ( !STACK ?auto_64899 ?auto_64900 )
      ( MAKE-4PILE ?auto_64894 ?auto_64895 ?auto_64896 ?auto_64897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64901 - BLOCK
      ?auto_64902 - BLOCK
      ?auto_64903 - BLOCK
      ?auto_64904 - BLOCK
    )
    :vars
    (
      ?auto_64906 - BLOCK
      ?auto_64907 - BLOCK
      ?auto_64905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64906 ?auto_64904 ) ( ON-TABLE ?auto_64901 ) ( ON ?auto_64902 ?auto_64901 ) ( ON ?auto_64903 ?auto_64902 ) ( ON ?auto_64904 ?auto_64903 ) ( not ( = ?auto_64901 ?auto_64902 ) ) ( not ( = ?auto_64901 ?auto_64903 ) ) ( not ( = ?auto_64901 ?auto_64904 ) ) ( not ( = ?auto_64901 ?auto_64906 ) ) ( not ( = ?auto_64902 ?auto_64903 ) ) ( not ( = ?auto_64902 ?auto_64904 ) ) ( not ( = ?auto_64902 ?auto_64906 ) ) ( not ( = ?auto_64903 ?auto_64904 ) ) ( not ( = ?auto_64903 ?auto_64906 ) ) ( not ( = ?auto_64904 ?auto_64906 ) ) ( CLEAR ?auto_64907 ) ( not ( = ?auto_64901 ?auto_64905 ) ) ( not ( = ?auto_64901 ?auto_64907 ) ) ( not ( = ?auto_64902 ?auto_64905 ) ) ( not ( = ?auto_64902 ?auto_64907 ) ) ( not ( = ?auto_64903 ?auto_64905 ) ) ( not ( = ?auto_64903 ?auto_64907 ) ) ( not ( = ?auto_64904 ?auto_64905 ) ) ( not ( = ?auto_64904 ?auto_64907 ) ) ( not ( = ?auto_64906 ?auto_64905 ) ) ( not ( = ?auto_64906 ?auto_64907 ) ) ( not ( = ?auto_64905 ?auto_64907 ) ) ( ON ?auto_64905 ?auto_64906 ) ( CLEAR ?auto_64905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64901 ?auto_64902 ?auto_64903 ?auto_64904 ?auto_64906 )
      ( MAKE-4PILE ?auto_64901 ?auto_64902 ?auto_64903 ?auto_64904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64908 - BLOCK
      ?auto_64909 - BLOCK
      ?auto_64910 - BLOCK
      ?auto_64911 - BLOCK
    )
    :vars
    (
      ?auto_64912 - BLOCK
      ?auto_64913 - BLOCK
      ?auto_64914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64912 ?auto_64911 ) ( ON-TABLE ?auto_64908 ) ( ON ?auto_64909 ?auto_64908 ) ( ON ?auto_64910 ?auto_64909 ) ( ON ?auto_64911 ?auto_64910 ) ( not ( = ?auto_64908 ?auto_64909 ) ) ( not ( = ?auto_64908 ?auto_64910 ) ) ( not ( = ?auto_64908 ?auto_64911 ) ) ( not ( = ?auto_64908 ?auto_64912 ) ) ( not ( = ?auto_64909 ?auto_64910 ) ) ( not ( = ?auto_64909 ?auto_64911 ) ) ( not ( = ?auto_64909 ?auto_64912 ) ) ( not ( = ?auto_64910 ?auto_64911 ) ) ( not ( = ?auto_64910 ?auto_64912 ) ) ( not ( = ?auto_64911 ?auto_64912 ) ) ( not ( = ?auto_64908 ?auto_64913 ) ) ( not ( = ?auto_64908 ?auto_64914 ) ) ( not ( = ?auto_64909 ?auto_64913 ) ) ( not ( = ?auto_64909 ?auto_64914 ) ) ( not ( = ?auto_64910 ?auto_64913 ) ) ( not ( = ?auto_64910 ?auto_64914 ) ) ( not ( = ?auto_64911 ?auto_64913 ) ) ( not ( = ?auto_64911 ?auto_64914 ) ) ( not ( = ?auto_64912 ?auto_64913 ) ) ( not ( = ?auto_64912 ?auto_64914 ) ) ( not ( = ?auto_64913 ?auto_64914 ) ) ( ON ?auto_64913 ?auto_64912 ) ( CLEAR ?auto_64913 ) ( HOLDING ?auto_64914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64914 )
      ( MAKE-4PILE ?auto_64908 ?auto_64909 ?auto_64910 ?auto_64911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64915 - BLOCK
      ?auto_64916 - BLOCK
      ?auto_64917 - BLOCK
      ?auto_64918 - BLOCK
    )
    :vars
    (
      ?auto_64921 - BLOCK
      ?auto_64920 - BLOCK
      ?auto_64919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64921 ?auto_64918 ) ( ON-TABLE ?auto_64915 ) ( ON ?auto_64916 ?auto_64915 ) ( ON ?auto_64917 ?auto_64916 ) ( ON ?auto_64918 ?auto_64917 ) ( not ( = ?auto_64915 ?auto_64916 ) ) ( not ( = ?auto_64915 ?auto_64917 ) ) ( not ( = ?auto_64915 ?auto_64918 ) ) ( not ( = ?auto_64915 ?auto_64921 ) ) ( not ( = ?auto_64916 ?auto_64917 ) ) ( not ( = ?auto_64916 ?auto_64918 ) ) ( not ( = ?auto_64916 ?auto_64921 ) ) ( not ( = ?auto_64917 ?auto_64918 ) ) ( not ( = ?auto_64917 ?auto_64921 ) ) ( not ( = ?auto_64918 ?auto_64921 ) ) ( not ( = ?auto_64915 ?auto_64920 ) ) ( not ( = ?auto_64915 ?auto_64919 ) ) ( not ( = ?auto_64916 ?auto_64920 ) ) ( not ( = ?auto_64916 ?auto_64919 ) ) ( not ( = ?auto_64917 ?auto_64920 ) ) ( not ( = ?auto_64917 ?auto_64919 ) ) ( not ( = ?auto_64918 ?auto_64920 ) ) ( not ( = ?auto_64918 ?auto_64919 ) ) ( not ( = ?auto_64921 ?auto_64920 ) ) ( not ( = ?auto_64921 ?auto_64919 ) ) ( not ( = ?auto_64920 ?auto_64919 ) ) ( ON ?auto_64920 ?auto_64921 ) ( ON ?auto_64919 ?auto_64920 ) ( CLEAR ?auto_64919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64915 ?auto_64916 ?auto_64917 ?auto_64918 ?auto_64921 ?auto_64920 )
      ( MAKE-4PILE ?auto_64915 ?auto_64916 ?auto_64917 ?auto_64918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64925 - BLOCK
      ?auto_64926 - BLOCK
      ?auto_64927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64927 ) ( CLEAR ?auto_64926 ) ( ON-TABLE ?auto_64925 ) ( ON ?auto_64926 ?auto_64925 ) ( not ( = ?auto_64925 ?auto_64926 ) ) ( not ( = ?auto_64925 ?auto_64927 ) ) ( not ( = ?auto_64926 ?auto_64927 ) ) )
    :subtasks
    ( ( !STACK ?auto_64927 ?auto_64926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64928 - BLOCK
      ?auto_64929 - BLOCK
      ?auto_64930 - BLOCK
    )
    :vars
    (
      ?auto_64931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64929 ) ( ON-TABLE ?auto_64928 ) ( ON ?auto_64929 ?auto_64928 ) ( not ( = ?auto_64928 ?auto_64929 ) ) ( not ( = ?auto_64928 ?auto_64930 ) ) ( not ( = ?auto_64929 ?auto_64930 ) ) ( ON ?auto_64930 ?auto_64931 ) ( CLEAR ?auto_64930 ) ( HAND-EMPTY ) ( not ( = ?auto_64928 ?auto_64931 ) ) ( not ( = ?auto_64929 ?auto_64931 ) ) ( not ( = ?auto_64930 ?auto_64931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64930 ?auto_64931 )
      ( MAKE-3PILE ?auto_64928 ?auto_64929 ?auto_64930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64932 - BLOCK
      ?auto_64933 - BLOCK
      ?auto_64934 - BLOCK
    )
    :vars
    (
      ?auto_64935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64932 ) ( not ( = ?auto_64932 ?auto_64933 ) ) ( not ( = ?auto_64932 ?auto_64934 ) ) ( not ( = ?auto_64933 ?auto_64934 ) ) ( ON ?auto_64934 ?auto_64935 ) ( CLEAR ?auto_64934 ) ( not ( = ?auto_64932 ?auto_64935 ) ) ( not ( = ?auto_64933 ?auto_64935 ) ) ( not ( = ?auto_64934 ?auto_64935 ) ) ( HOLDING ?auto_64933 ) ( CLEAR ?auto_64932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64932 ?auto_64933 )
      ( MAKE-3PILE ?auto_64932 ?auto_64933 ?auto_64934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64936 - BLOCK
      ?auto_64937 - BLOCK
      ?auto_64938 - BLOCK
    )
    :vars
    (
      ?auto_64939 - BLOCK
      ?auto_64941 - BLOCK
      ?auto_64940 - BLOCK
      ?auto_64942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64936 ) ( not ( = ?auto_64936 ?auto_64937 ) ) ( not ( = ?auto_64936 ?auto_64938 ) ) ( not ( = ?auto_64937 ?auto_64938 ) ) ( ON ?auto_64938 ?auto_64939 ) ( not ( = ?auto_64936 ?auto_64939 ) ) ( not ( = ?auto_64937 ?auto_64939 ) ) ( not ( = ?auto_64938 ?auto_64939 ) ) ( CLEAR ?auto_64936 ) ( ON ?auto_64937 ?auto_64938 ) ( CLEAR ?auto_64937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64941 ) ( ON ?auto_64940 ?auto_64941 ) ( ON ?auto_64942 ?auto_64940 ) ( ON ?auto_64939 ?auto_64942 ) ( not ( = ?auto_64941 ?auto_64940 ) ) ( not ( = ?auto_64941 ?auto_64942 ) ) ( not ( = ?auto_64941 ?auto_64939 ) ) ( not ( = ?auto_64941 ?auto_64938 ) ) ( not ( = ?auto_64941 ?auto_64937 ) ) ( not ( = ?auto_64940 ?auto_64942 ) ) ( not ( = ?auto_64940 ?auto_64939 ) ) ( not ( = ?auto_64940 ?auto_64938 ) ) ( not ( = ?auto_64940 ?auto_64937 ) ) ( not ( = ?auto_64942 ?auto_64939 ) ) ( not ( = ?auto_64942 ?auto_64938 ) ) ( not ( = ?auto_64942 ?auto_64937 ) ) ( not ( = ?auto_64936 ?auto_64941 ) ) ( not ( = ?auto_64936 ?auto_64940 ) ) ( not ( = ?auto_64936 ?auto_64942 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64941 ?auto_64940 ?auto_64942 ?auto_64939 ?auto_64938 )
      ( MAKE-3PILE ?auto_64936 ?auto_64937 ?auto_64938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64943 - BLOCK
      ?auto_64944 - BLOCK
      ?auto_64945 - BLOCK
    )
    :vars
    (
      ?auto_64949 - BLOCK
      ?auto_64947 - BLOCK
      ?auto_64948 - BLOCK
      ?auto_64946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64943 ?auto_64944 ) ) ( not ( = ?auto_64943 ?auto_64945 ) ) ( not ( = ?auto_64944 ?auto_64945 ) ) ( ON ?auto_64945 ?auto_64949 ) ( not ( = ?auto_64943 ?auto_64949 ) ) ( not ( = ?auto_64944 ?auto_64949 ) ) ( not ( = ?auto_64945 ?auto_64949 ) ) ( ON ?auto_64944 ?auto_64945 ) ( CLEAR ?auto_64944 ) ( ON-TABLE ?auto_64947 ) ( ON ?auto_64948 ?auto_64947 ) ( ON ?auto_64946 ?auto_64948 ) ( ON ?auto_64949 ?auto_64946 ) ( not ( = ?auto_64947 ?auto_64948 ) ) ( not ( = ?auto_64947 ?auto_64946 ) ) ( not ( = ?auto_64947 ?auto_64949 ) ) ( not ( = ?auto_64947 ?auto_64945 ) ) ( not ( = ?auto_64947 ?auto_64944 ) ) ( not ( = ?auto_64948 ?auto_64946 ) ) ( not ( = ?auto_64948 ?auto_64949 ) ) ( not ( = ?auto_64948 ?auto_64945 ) ) ( not ( = ?auto_64948 ?auto_64944 ) ) ( not ( = ?auto_64946 ?auto_64949 ) ) ( not ( = ?auto_64946 ?auto_64945 ) ) ( not ( = ?auto_64946 ?auto_64944 ) ) ( not ( = ?auto_64943 ?auto_64947 ) ) ( not ( = ?auto_64943 ?auto_64948 ) ) ( not ( = ?auto_64943 ?auto_64946 ) ) ( HOLDING ?auto_64943 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64943 )
      ( MAKE-3PILE ?auto_64943 ?auto_64944 ?auto_64945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64950 - BLOCK
      ?auto_64951 - BLOCK
      ?auto_64952 - BLOCK
    )
    :vars
    (
      ?auto_64955 - BLOCK
      ?auto_64954 - BLOCK
      ?auto_64956 - BLOCK
      ?auto_64953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64950 ?auto_64951 ) ) ( not ( = ?auto_64950 ?auto_64952 ) ) ( not ( = ?auto_64951 ?auto_64952 ) ) ( ON ?auto_64952 ?auto_64955 ) ( not ( = ?auto_64950 ?auto_64955 ) ) ( not ( = ?auto_64951 ?auto_64955 ) ) ( not ( = ?auto_64952 ?auto_64955 ) ) ( ON ?auto_64951 ?auto_64952 ) ( ON-TABLE ?auto_64954 ) ( ON ?auto_64956 ?auto_64954 ) ( ON ?auto_64953 ?auto_64956 ) ( ON ?auto_64955 ?auto_64953 ) ( not ( = ?auto_64954 ?auto_64956 ) ) ( not ( = ?auto_64954 ?auto_64953 ) ) ( not ( = ?auto_64954 ?auto_64955 ) ) ( not ( = ?auto_64954 ?auto_64952 ) ) ( not ( = ?auto_64954 ?auto_64951 ) ) ( not ( = ?auto_64956 ?auto_64953 ) ) ( not ( = ?auto_64956 ?auto_64955 ) ) ( not ( = ?auto_64956 ?auto_64952 ) ) ( not ( = ?auto_64956 ?auto_64951 ) ) ( not ( = ?auto_64953 ?auto_64955 ) ) ( not ( = ?auto_64953 ?auto_64952 ) ) ( not ( = ?auto_64953 ?auto_64951 ) ) ( not ( = ?auto_64950 ?auto_64954 ) ) ( not ( = ?auto_64950 ?auto_64956 ) ) ( not ( = ?auto_64950 ?auto_64953 ) ) ( ON ?auto_64950 ?auto_64951 ) ( CLEAR ?auto_64950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64954 ?auto_64956 ?auto_64953 ?auto_64955 ?auto_64952 ?auto_64951 )
      ( MAKE-3PILE ?auto_64950 ?auto_64951 ?auto_64952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64960 - BLOCK
      ?auto_64961 - BLOCK
      ?auto_64962 - BLOCK
    )
    :vars
    (
      ?auto_64963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64963 ?auto_64962 ) ( CLEAR ?auto_64963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64960 ) ( ON ?auto_64961 ?auto_64960 ) ( ON ?auto_64962 ?auto_64961 ) ( not ( = ?auto_64960 ?auto_64961 ) ) ( not ( = ?auto_64960 ?auto_64962 ) ) ( not ( = ?auto_64960 ?auto_64963 ) ) ( not ( = ?auto_64961 ?auto_64962 ) ) ( not ( = ?auto_64961 ?auto_64963 ) ) ( not ( = ?auto_64962 ?auto_64963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64963 ?auto_64962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64964 - BLOCK
      ?auto_64965 - BLOCK
      ?auto_64966 - BLOCK
    )
    :vars
    (
      ?auto_64967 - BLOCK
      ?auto_64968 - BLOCK
      ?auto_64969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64967 ?auto_64966 ) ( CLEAR ?auto_64967 ) ( ON-TABLE ?auto_64964 ) ( ON ?auto_64965 ?auto_64964 ) ( ON ?auto_64966 ?auto_64965 ) ( not ( = ?auto_64964 ?auto_64965 ) ) ( not ( = ?auto_64964 ?auto_64966 ) ) ( not ( = ?auto_64964 ?auto_64967 ) ) ( not ( = ?auto_64965 ?auto_64966 ) ) ( not ( = ?auto_64965 ?auto_64967 ) ) ( not ( = ?auto_64966 ?auto_64967 ) ) ( HOLDING ?auto_64968 ) ( CLEAR ?auto_64969 ) ( not ( = ?auto_64964 ?auto_64968 ) ) ( not ( = ?auto_64964 ?auto_64969 ) ) ( not ( = ?auto_64965 ?auto_64968 ) ) ( not ( = ?auto_64965 ?auto_64969 ) ) ( not ( = ?auto_64966 ?auto_64968 ) ) ( not ( = ?auto_64966 ?auto_64969 ) ) ( not ( = ?auto_64967 ?auto_64968 ) ) ( not ( = ?auto_64967 ?auto_64969 ) ) ( not ( = ?auto_64968 ?auto_64969 ) ) )
    :subtasks
    ( ( !STACK ?auto_64968 ?auto_64969 )
      ( MAKE-3PILE ?auto_64964 ?auto_64965 ?auto_64966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64970 - BLOCK
      ?auto_64971 - BLOCK
      ?auto_64972 - BLOCK
    )
    :vars
    (
      ?auto_64974 - BLOCK
      ?auto_64975 - BLOCK
      ?auto_64973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64974 ?auto_64972 ) ( ON-TABLE ?auto_64970 ) ( ON ?auto_64971 ?auto_64970 ) ( ON ?auto_64972 ?auto_64971 ) ( not ( = ?auto_64970 ?auto_64971 ) ) ( not ( = ?auto_64970 ?auto_64972 ) ) ( not ( = ?auto_64970 ?auto_64974 ) ) ( not ( = ?auto_64971 ?auto_64972 ) ) ( not ( = ?auto_64971 ?auto_64974 ) ) ( not ( = ?auto_64972 ?auto_64974 ) ) ( CLEAR ?auto_64975 ) ( not ( = ?auto_64970 ?auto_64973 ) ) ( not ( = ?auto_64970 ?auto_64975 ) ) ( not ( = ?auto_64971 ?auto_64973 ) ) ( not ( = ?auto_64971 ?auto_64975 ) ) ( not ( = ?auto_64972 ?auto_64973 ) ) ( not ( = ?auto_64972 ?auto_64975 ) ) ( not ( = ?auto_64974 ?auto_64973 ) ) ( not ( = ?auto_64974 ?auto_64975 ) ) ( not ( = ?auto_64973 ?auto_64975 ) ) ( ON ?auto_64973 ?auto_64974 ) ( CLEAR ?auto_64973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64970 ?auto_64971 ?auto_64972 ?auto_64974 )
      ( MAKE-3PILE ?auto_64970 ?auto_64971 ?auto_64972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64976 - BLOCK
      ?auto_64977 - BLOCK
      ?auto_64978 - BLOCK
    )
    :vars
    (
      ?auto_64979 - BLOCK
      ?auto_64981 - BLOCK
      ?auto_64980 - BLOCK
      ?auto_64982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64979 ?auto_64978 ) ( ON-TABLE ?auto_64976 ) ( ON ?auto_64977 ?auto_64976 ) ( ON ?auto_64978 ?auto_64977 ) ( not ( = ?auto_64976 ?auto_64977 ) ) ( not ( = ?auto_64976 ?auto_64978 ) ) ( not ( = ?auto_64976 ?auto_64979 ) ) ( not ( = ?auto_64977 ?auto_64978 ) ) ( not ( = ?auto_64977 ?auto_64979 ) ) ( not ( = ?auto_64978 ?auto_64979 ) ) ( not ( = ?auto_64976 ?auto_64981 ) ) ( not ( = ?auto_64976 ?auto_64980 ) ) ( not ( = ?auto_64977 ?auto_64981 ) ) ( not ( = ?auto_64977 ?auto_64980 ) ) ( not ( = ?auto_64978 ?auto_64981 ) ) ( not ( = ?auto_64978 ?auto_64980 ) ) ( not ( = ?auto_64979 ?auto_64981 ) ) ( not ( = ?auto_64979 ?auto_64980 ) ) ( not ( = ?auto_64981 ?auto_64980 ) ) ( ON ?auto_64981 ?auto_64979 ) ( CLEAR ?auto_64981 ) ( HOLDING ?auto_64980 ) ( CLEAR ?auto_64982 ) ( ON-TABLE ?auto_64982 ) ( not ( = ?auto_64982 ?auto_64980 ) ) ( not ( = ?auto_64976 ?auto_64982 ) ) ( not ( = ?auto_64977 ?auto_64982 ) ) ( not ( = ?auto_64978 ?auto_64982 ) ) ( not ( = ?auto_64979 ?auto_64982 ) ) ( not ( = ?auto_64981 ?auto_64982 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64982 ?auto_64980 )
      ( MAKE-3PILE ?auto_64976 ?auto_64977 ?auto_64978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64983 - BLOCK
      ?auto_64984 - BLOCK
      ?auto_64985 - BLOCK
    )
    :vars
    (
      ?auto_64988 - BLOCK
      ?auto_64986 - BLOCK
      ?auto_64987 - BLOCK
      ?auto_64989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64988 ?auto_64985 ) ( ON-TABLE ?auto_64983 ) ( ON ?auto_64984 ?auto_64983 ) ( ON ?auto_64985 ?auto_64984 ) ( not ( = ?auto_64983 ?auto_64984 ) ) ( not ( = ?auto_64983 ?auto_64985 ) ) ( not ( = ?auto_64983 ?auto_64988 ) ) ( not ( = ?auto_64984 ?auto_64985 ) ) ( not ( = ?auto_64984 ?auto_64988 ) ) ( not ( = ?auto_64985 ?auto_64988 ) ) ( not ( = ?auto_64983 ?auto_64986 ) ) ( not ( = ?auto_64983 ?auto_64987 ) ) ( not ( = ?auto_64984 ?auto_64986 ) ) ( not ( = ?auto_64984 ?auto_64987 ) ) ( not ( = ?auto_64985 ?auto_64986 ) ) ( not ( = ?auto_64985 ?auto_64987 ) ) ( not ( = ?auto_64988 ?auto_64986 ) ) ( not ( = ?auto_64988 ?auto_64987 ) ) ( not ( = ?auto_64986 ?auto_64987 ) ) ( ON ?auto_64986 ?auto_64988 ) ( CLEAR ?auto_64989 ) ( ON-TABLE ?auto_64989 ) ( not ( = ?auto_64989 ?auto_64987 ) ) ( not ( = ?auto_64983 ?auto_64989 ) ) ( not ( = ?auto_64984 ?auto_64989 ) ) ( not ( = ?auto_64985 ?auto_64989 ) ) ( not ( = ?auto_64988 ?auto_64989 ) ) ( not ( = ?auto_64986 ?auto_64989 ) ) ( ON ?auto_64987 ?auto_64986 ) ( CLEAR ?auto_64987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64983 ?auto_64984 ?auto_64985 ?auto_64988 ?auto_64986 )
      ( MAKE-3PILE ?auto_64983 ?auto_64984 ?auto_64985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64990 - BLOCK
      ?auto_64991 - BLOCK
      ?auto_64992 - BLOCK
    )
    :vars
    (
      ?auto_64996 - BLOCK
      ?auto_64993 - BLOCK
      ?auto_64994 - BLOCK
      ?auto_64995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64996 ?auto_64992 ) ( ON-TABLE ?auto_64990 ) ( ON ?auto_64991 ?auto_64990 ) ( ON ?auto_64992 ?auto_64991 ) ( not ( = ?auto_64990 ?auto_64991 ) ) ( not ( = ?auto_64990 ?auto_64992 ) ) ( not ( = ?auto_64990 ?auto_64996 ) ) ( not ( = ?auto_64991 ?auto_64992 ) ) ( not ( = ?auto_64991 ?auto_64996 ) ) ( not ( = ?auto_64992 ?auto_64996 ) ) ( not ( = ?auto_64990 ?auto_64993 ) ) ( not ( = ?auto_64990 ?auto_64994 ) ) ( not ( = ?auto_64991 ?auto_64993 ) ) ( not ( = ?auto_64991 ?auto_64994 ) ) ( not ( = ?auto_64992 ?auto_64993 ) ) ( not ( = ?auto_64992 ?auto_64994 ) ) ( not ( = ?auto_64996 ?auto_64993 ) ) ( not ( = ?auto_64996 ?auto_64994 ) ) ( not ( = ?auto_64993 ?auto_64994 ) ) ( ON ?auto_64993 ?auto_64996 ) ( not ( = ?auto_64995 ?auto_64994 ) ) ( not ( = ?auto_64990 ?auto_64995 ) ) ( not ( = ?auto_64991 ?auto_64995 ) ) ( not ( = ?auto_64992 ?auto_64995 ) ) ( not ( = ?auto_64996 ?auto_64995 ) ) ( not ( = ?auto_64993 ?auto_64995 ) ) ( ON ?auto_64994 ?auto_64993 ) ( CLEAR ?auto_64994 ) ( HOLDING ?auto_64995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64995 )
      ( MAKE-3PILE ?auto_64990 ?auto_64991 ?auto_64992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64997 - BLOCK
      ?auto_64998 - BLOCK
      ?auto_64999 - BLOCK
    )
    :vars
    (
      ?auto_65002 - BLOCK
      ?auto_65003 - BLOCK
      ?auto_65000 - BLOCK
      ?auto_65001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65002 ?auto_64999 ) ( ON-TABLE ?auto_64997 ) ( ON ?auto_64998 ?auto_64997 ) ( ON ?auto_64999 ?auto_64998 ) ( not ( = ?auto_64997 ?auto_64998 ) ) ( not ( = ?auto_64997 ?auto_64999 ) ) ( not ( = ?auto_64997 ?auto_65002 ) ) ( not ( = ?auto_64998 ?auto_64999 ) ) ( not ( = ?auto_64998 ?auto_65002 ) ) ( not ( = ?auto_64999 ?auto_65002 ) ) ( not ( = ?auto_64997 ?auto_65003 ) ) ( not ( = ?auto_64997 ?auto_65000 ) ) ( not ( = ?auto_64998 ?auto_65003 ) ) ( not ( = ?auto_64998 ?auto_65000 ) ) ( not ( = ?auto_64999 ?auto_65003 ) ) ( not ( = ?auto_64999 ?auto_65000 ) ) ( not ( = ?auto_65002 ?auto_65003 ) ) ( not ( = ?auto_65002 ?auto_65000 ) ) ( not ( = ?auto_65003 ?auto_65000 ) ) ( ON ?auto_65003 ?auto_65002 ) ( not ( = ?auto_65001 ?auto_65000 ) ) ( not ( = ?auto_64997 ?auto_65001 ) ) ( not ( = ?auto_64998 ?auto_65001 ) ) ( not ( = ?auto_64999 ?auto_65001 ) ) ( not ( = ?auto_65002 ?auto_65001 ) ) ( not ( = ?auto_65003 ?auto_65001 ) ) ( ON ?auto_65000 ?auto_65003 ) ( ON ?auto_65001 ?auto_65000 ) ( CLEAR ?auto_65001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64997 ?auto_64998 ?auto_64999 ?auto_65002 ?auto_65003 ?auto_65000 )
      ( MAKE-3PILE ?auto_64997 ?auto_64998 ?auto_64999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65008 - BLOCK
      ?auto_65009 - BLOCK
      ?auto_65010 - BLOCK
      ?auto_65011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65011 ) ( CLEAR ?auto_65010 ) ( ON-TABLE ?auto_65008 ) ( ON ?auto_65009 ?auto_65008 ) ( ON ?auto_65010 ?auto_65009 ) ( not ( = ?auto_65008 ?auto_65009 ) ) ( not ( = ?auto_65008 ?auto_65010 ) ) ( not ( = ?auto_65008 ?auto_65011 ) ) ( not ( = ?auto_65009 ?auto_65010 ) ) ( not ( = ?auto_65009 ?auto_65011 ) ) ( not ( = ?auto_65010 ?auto_65011 ) ) )
    :subtasks
    ( ( !STACK ?auto_65011 ?auto_65010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65012 - BLOCK
      ?auto_65013 - BLOCK
      ?auto_65014 - BLOCK
      ?auto_65015 - BLOCK
    )
    :vars
    (
      ?auto_65016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65014 ) ( ON-TABLE ?auto_65012 ) ( ON ?auto_65013 ?auto_65012 ) ( ON ?auto_65014 ?auto_65013 ) ( not ( = ?auto_65012 ?auto_65013 ) ) ( not ( = ?auto_65012 ?auto_65014 ) ) ( not ( = ?auto_65012 ?auto_65015 ) ) ( not ( = ?auto_65013 ?auto_65014 ) ) ( not ( = ?auto_65013 ?auto_65015 ) ) ( not ( = ?auto_65014 ?auto_65015 ) ) ( ON ?auto_65015 ?auto_65016 ) ( CLEAR ?auto_65015 ) ( HAND-EMPTY ) ( not ( = ?auto_65012 ?auto_65016 ) ) ( not ( = ?auto_65013 ?auto_65016 ) ) ( not ( = ?auto_65014 ?auto_65016 ) ) ( not ( = ?auto_65015 ?auto_65016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65015 ?auto_65016 )
      ( MAKE-4PILE ?auto_65012 ?auto_65013 ?auto_65014 ?auto_65015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65017 - BLOCK
      ?auto_65018 - BLOCK
      ?auto_65019 - BLOCK
      ?auto_65020 - BLOCK
    )
    :vars
    (
      ?auto_65021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65017 ) ( ON ?auto_65018 ?auto_65017 ) ( not ( = ?auto_65017 ?auto_65018 ) ) ( not ( = ?auto_65017 ?auto_65019 ) ) ( not ( = ?auto_65017 ?auto_65020 ) ) ( not ( = ?auto_65018 ?auto_65019 ) ) ( not ( = ?auto_65018 ?auto_65020 ) ) ( not ( = ?auto_65019 ?auto_65020 ) ) ( ON ?auto_65020 ?auto_65021 ) ( CLEAR ?auto_65020 ) ( not ( = ?auto_65017 ?auto_65021 ) ) ( not ( = ?auto_65018 ?auto_65021 ) ) ( not ( = ?auto_65019 ?auto_65021 ) ) ( not ( = ?auto_65020 ?auto_65021 ) ) ( HOLDING ?auto_65019 ) ( CLEAR ?auto_65018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65017 ?auto_65018 ?auto_65019 )
      ( MAKE-4PILE ?auto_65017 ?auto_65018 ?auto_65019 ?auto_65020 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65022 - BLOCK
      ?auto_65023 - BLOCK
      ?auto_65024 - BLOCK
      ?auto_65025 - BLOCK
    )
    :vars
    (
      ?auto_65026 - BLOCK
      ?auto_65028 - BLOCK
      ?auto_65027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65022 ) ( ON ?auto_65023 ?auto_65022 ) ( not ( = ?auto_65022 ?auto_65023 ) ) ( not ( = ?auto_65022 ?auto_65024 ) ) ( not ( = ?auto_65022 ?auto_65025 ) ) ( not ( = ?auto_65023 ?auto_65024 ) ) ( not ( = ?auto_65023 ?auto_65025 ) ) ( not ( = ?auto_65024 ?auto_65025 ) ) ( ON ?auto_65025 ?auto_65026 ) ( not ( = ?auto_65022 ?auto_65026 ) ) ( not ( = ?auto_65023 ?auto_65026 ) ) ( not ( = ?auto_65024 ?auto_65026 ) ) ( not ( = ?auto_65025 ?auto_65026 ) ) ( CLEAR ?auto_65023 ) ( ON ?auto_65024 ?auto_65025 ) ( CLEAR ?auto_65024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65028 ) ( ON ?auto_65027 ?auto_65028 ) ( ON ?auto_65026 ?auto_65027 ) ( not ( = ?auto_65028 ?auto_65027 ) ) ( not ( = ?auto_65028 ?auto_65026 ) ) ( not ( = ?auto_65028 ?auto_65025 ) ) ( not ( = ?auto_65028 ?auto_65024 ) ) ( not ( = ?auto_65027 ?auto_65026 ) ) ( not ( = ?auto_65027 ?auto_65025 ) ) ( not ( = ?auto_65027 ?auto_65024 ) ) ( not ( = ?auto_65022 ?auto_65028 ) ) ( not ( = ?auto_65022 ?auto_65027 ) ) ( not ( = ?auto_65023 ?auto_65028 ) ) ( not ( = ?auto_65023 ?auto_65027 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65028 ?auto_65027 ?auto_65026 ?auto_65025 )
      ( MAKE-4PILE ?auto_65022 ?auto_65023 ?auto_65024 ?auto_65025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65029 - BLOCK
      ?auto_65030 - BLOCK
      ?auto_65031 - BLOCK
      ?auto_65032 - BLOCK
    )
    :vars
    (
      ?auto_65034 - BLOCK
      ?auto_65033 - BLOCK
      ?auto_65035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65029 ) ( not ( = ?auto_65029 ?auto_65030 ) ) ( not ( = ?auto_65029 ?auto_65031 ) ) ( not ( = ?auto_65029 ?auto_65032 ) ) ( not ( = ?auto_65030 ?auto_65031 ) ) ( not ( = ?auto_65030 ?auto_65032 ) ) ( not ( = ?auto_65031 ?auto_65032 ) ) ( ON ?auto_65032 ?auto_65034 ) ( not ( = ?auto_65029 ?auto_65034 ) ) ( not ( = ?auto_65030 ?auto_65034 ) ) ( not ( = ?auto_65031 ?auto_65034 ) ) ( not ( = ?auto_65032 ?auto_65034 ) ) ( ON ?auto_65031 ?auto_65032 ) ( CLEAR ?auto_65031 ) ( ON-TABLE ?auto_65033 ) ( ON ?auto_65035 ?auto_65033 ) ( ON ?auto_65034 ?auto_65035 ) ( not ( = ?auto_65033 ?auto_65035 ) ) ( not ( = ?auto_65033 ?auto_65034 ) ) ( not ( = ?auto_65033 ?auto_65032 ) ) ( not ( = ?auto_65033 ?auto_65031 ) ) ( not ( = ?auto_65035 ?auto_65034 ) ) ( not ( = ?auto_65035 ?auto_65032 ) ) ( not ( = ?auto_65035 ?auto_65031 ) ) ( not ( = ?auto_65029 ?auto_65033 ) ) ( not ( = ?auto_65029 ?auto_65035 ) ) ( not ( = ?auto_65030 ?auto_65033 ) ) ( not ( = ?auto_65030 ?auto_65035 ) ) ( HOLDING ?auto_65030 ) ( CLEAR ?auto_65029 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65029 ?auto_65030 )
      ( MAKE-4PILE ?auto_65029 ?auto_65030 ?auto_65031 ?auto_65032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65036 - BLOCK
      ?auto_65037 - BLOCK
      ?auto_65038 - BLOCK
      ?auto_65039 - BLOCK
    )
    :vars
    (
      ?auto_65040 - BLOCK
      ?auto_65041 - BLOCK
      ?auto_65042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65036 ) ( not ( = ?auto_65036 ?auto_65037 ) ) ( not ( = ?auto_65036 ?auto_65038 ) ) ( not ( = ?auto_65036 ?auto_65039 ) ) ( not ( = ?auto_65037 ?auto_65038 ) ) ( not ( = ?auto_65037 ?auto_65039 ) ) ( not ( = ?auto_65038 ?auto_65039 ) ) ( ON ?auto_65039 ?auto_65040 ) ( not ( = ?auto_65036 ?auto_65040 ) ) ( not ( = ?auto_65037 ?auto_65040 ) ) ( not ( = ?auto_65038 ?auto_65040 ) ) ( not ( = ?auto_65039 ?auto_65040 ) ) ( ON ?auto_65038 ?auto_65039 ) ( ON-TABLE ?auto_65041 ) ( ON ?auto_65042 ?auto_65041 ) ( ON ?auto_65040 ?auto_65042 ) ( not ( = ?auto_65041 ?auto_65042 ) ) ( not ( = ?auto_65041 ?auto_65040 ) ) ( not ( = ?auto_65041 ?auto_65039 ) ) ( not ( = ?auto_65041 ?auto_65038 ) ) ( not ( = ?auto_65042 ?auto_65040 ) ) ( not ( = ?auto_65042 ?auto_65039 ) ) ( not ( = ?auto_65042 ?auto_65038 ) ) ( not ( = ?auto_65036 ?auto_65041 ) ) ( not ( = ?auto_65036 ?auto_65042 ) ) ( not ( = ?auto_65037 ?auto_65041 ) ) ( not ( = ?auto_65037 ?auto_65042 ) ) ( CLEAR ?auto_65036 ) ( ON ?auto_65037 ?auto_65038 ) ( CLEAR ?auto_65037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65041 ?auto_65042 ?auto_65040 ?auto_65039 ?auto_65038 )
      ( MAKE-4PILE ?auto_65036 ?auto_65037 ?auto_65038 ?auto_65039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65043 - BLOCK
      ?auto_65044 - BLOCK
      ?auto_65045 - BLOCK
      ?auto_65046 - BLOCK
    )
    :vars
    (
      ?auto_65047 - BLOCK
      ?auto_65048 - BLOCK
      ?auto_65049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65043 ?auto_65044 ) ) ( not ( = ?auto_65043 ?auto_65045 ) ) ( not ( = ?auto_65043 ?auto_65046 ) ) ( not ( = ?auto_65044 ?auto_65045 ) ) ( not ( = ?auto_65044 ?auto_65046 ) ) ( not ( = ?auto_65045 ?auto_65046 ) ) ( ON ?auto_65046 ?auto_65047 ) ( not ( = ?auto_65043 ?auto_65047 ) ) ( not ( = ?auto_65044 ?auto_65047 ) ) ( not ( = ?auto_65045 ?auto_65047 ) ) ( not ( = ?auto_65046 ?auto_65047 ) ) ( ON ?auto_65045 ?auto_65046 ) ( ON-TABLE ?auto_65048 ) ( ON ?auto_65049 ?auto_65048 ) ( ON ?auto_65047 ?auto_65049 ) ( not ( = ?auto_65048 ?auto_65049 ) ) ( not ( = ?auto_65048 ?auto_65047 ) ) ( not ( = ?auto_65048 ?auto_65046 ) ) ( not ( = ?auto_65048 ?auto_65045 ) ) ( not ( = ?auto_65049 ?auto_65047 ) ) ( not ( = ?auto_65049 ?auto_65046 ) ) ( not ( = ?auto_65049 ?auto_65045 ) ) ( not ( = ?auto_65043 ?auto_65048 ) ) ( not ( = ?auto_65043 ?auto_65049 ) ) ( not ( = ?auto_65044 ?auto_65048 ) ) ( not ( = ?auto_65044 ?auto_65049 ) ) ( ON ?auto_65044 ?auto_65045 ) ( CLEAR ?auto_65044 ) ( HOLDING ?auto_65043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65043 )
      ( MAKE-4PILE ?auto_65043 ?auto_65044 ?auto_65045 ?auto_65046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65050 - BLOCK
      ?auto_65051 - BLOCK
      ?auto_65052 - BLOCK
      ?auto_65053 - BLOCK
    )
    :vars
    (
      ?auto_65055 - BLOCK
      ?auto_65054 - BLOCK
      ?auto_65056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65050 ?auto_65051 ) ) ( not ( = ?auto_65050 ?auto_65052 ) ) ( not ( = ?auto_65050 ?auto_65053 ) ) ( not ( = ?auto_65051 ?auto_65052 ) ) ( not ( = ?auto_65051 ?auto_65053 ) ) ( not ( = ?auto_65052 ?auto_65053 ) ) ( ON ?auto_65053 ?auto_65055 ) ( not ( = ?auto_65050 ?auto_65055 ) ) ( not ( = ?auto_65051 ?auto_65055 ) ) ( not ( = ?auto_65052 ?auto_65055 ) ) ( not ( = ?auto_65053 ?auto_65055 ) ) ( ON ?auto_65052 ?auto_65053 ) ( ON-TABLE ?auto_65054 ) ( ON ?auto_65056 ?auto_65054 ) ( ON ?auto_65055 ?auto_65056 ) ( not ( = ?auto_65054 ?auto_65056 ) ) ( not ( = ?auto_65054 ?auto_65055 ) ) ( not ( = ?auto_65054 ?auto_65053 ) ) ( not ( = ?auto_65054 ?auto_65052 ) ) ( not ( = ?auto_65056 ?auto_65055 ) ) ( not ( = ?auto_65056 ?auto_65053 ) ) ( not ( = ?auto_65056 ?auto_65052 ) ) ( not ( = ?auto_65050 ?auto_65054 ) ) ( not ( = ?auto_65050 ?auto_65056 ) ) ( not ( = ?auto_65051 ?auto_65054 ) ) ( not ( = ?auto_65051 ?auto_65056 ) ) ( ON ?auto_65051 ?auto_65052 ) ( ON ?auto_65050 ?auto_65051 ) ( CLEAR ?auto_65050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65054 ?auto_65056 ?auto_65055 ?auto_65053 ?auto_65052 ?auto_65051 )
      ( MAKE-4PILE ?auto_65050 ?auto_65051 ?auto_65052 ?auto_65053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65059 - BLOCK
      ?auto_65060 - BLOCK
    )
    :vars
    (
      ?auto_65061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65061 ?auto_65060 ) ( CLEAR ?auto_65061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65059 ) ( ON ?auto_65060 ?auto_65059 ) ( not ( = ?auto_65059 ?auto_65060 ) ) ( not ( = ?auto_65059 ?auto_65061 ) ) ( not ( = ?auto_65060 ?auto_65061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65061 ?auto_65060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65062 - BLOCK
      ?auto_65063 - BLOCK
    )
    :vars
    (
      ?auto_65064 - BLOCK
      ?auto_65065 - BLOCK
      ?auto_65066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65064 ?auto_65063 ) ( CLEAR ?auto_65064 ) ( ON-TABLE ?auto_65062 ) ( ON ?auto_65063 ?auto_65062 ) ( not ( = ?auto_65062 ?auto_65063 ) ) ( not ( = ?auto_65062 ?auto_65064 ) ) ( not ( = ?auto_65063 ?auto_65064 ) ) ( HOLDING ?auto_65065 ) ( CLEAR ?auto_65066 ) ( not ( = ?auto_65062 ?auto_65065 ) ) ( not ( = ?auto_65062 ?auto_65066 ) ) ( not ( = ?auto_65063 ?auto_65065 ) ) ( not ( = ?auto_65063 ?auto_65066 ) ) ( not ( = ?auto_65064 ?auto_65065 ) ) ( not ( = ?auto_65064 ?auto_65066 ) ) ( not ( = ?auto_65065 ?auto_65066 ) ) )
    :subtasks
    ( ( !STACK ?auto_65065 ?auto_65066 )
      ( MAKE-2PILE ?auto_65062 ?auto_65063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65067 - BLOCK
      ?auto_65068 - BLOCK
    )
    :vars
    (
      ?auto_65070 - BLOCK
      ?auto_65069 - BLOCK
      ?auto_65071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65070 ?auto_65068 ) ( ON-TABLE ?auto_65067 ) ( ON ?auto_65068 ?auto_65067 ) ( not ( = ?auto_65067 ?auto_65068 ) ) ( not ( = ?auto_65067 ?auto_65070 ) ) ( not ( = ?auto_65068 ?auto_65070 ) ) ( CLEAR ?auto_65069 ) ( not ( = ?auto_65067 ?auto_65071 ) ) ( not ( = ?auto_65067 ?auto_65069 ) ) ( not ( = ?auto_65068 ?auto_65071 ) ) ( not ( = ?auto_65068 ?auto_65069 ) ) ( not ( = ?auto_65070 ?auto_65071 ) ) ( not ( = ?auto_65070 ?auto_65069 ) ) ( not ( = ?auto_65071 ?auto_65069 ) ) ( ON ?auto_65071 ?auto_65070 ) ( CLEAR ?auto_65071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65067 ?auto_65068 ?auto_65070 )
      ( MAKE-2PILE ?auto_65067 ?auto_65068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65072 - BLOCK
      ?auto_65073 - BLOCK
    )
    :vars
    (
      ?auto_65076 - BLOCK
      ?auto_65074 - BLOCK
      ?auto_65075 - BLOCK
      ?auto_65078 - BLOCK
      ?auto_65077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65076 ?auto_65073 ) ( ON-TABLE ?auto_65072 ) ( ON ?auto_65073 ?auto_65072 ) ( not ( = ?auto_65072 ?auto_65073 ) ) ( not ( = ?auto_65072 ?auto_65076 ) ) ( not ( = ?auto_65073 ?auto_65076 ) ) ( not ( = ?auto_65072 ?auto_65074 ) ) ( not ( = ?auto_65072 ?auto_65075 ) ) ( not ( = ?auto_65073 ?auto_65074 ) ) ( not ( = ?auto_65073 ?auto_65075 ) ) ( not ( = ?auto_65076 ?auto_65074 ) ) ( not ( = ?auto_65076 ?auto_65075 ) ) ( not ( = ?auto_65074 ?auto_65075 ) ) ( ON ?auto_65074 ?auto_65076 ) ( CLEAR ?auto_65074 ) ( HOLDING ?auto_65075 ) ( CLEAR ?auto_65078 ) ( ON-TABLE ?auto_65077 ) ( ON ?auto_65078 ?auto_65077 ) ( not ( = ?auto_65077 ?auto_65078 ) ) ( not ( = ?auto_65077 ?auto_65075 ) ) ( not ( = ?auto_65078 ?auto_65075 ) ) ( not ( = ?auto_65072 ?auto_65078 ) ) ( not ( = ?auto_65072 ?auto_65077 ) ) ( not ( = ?auto_65073 ?auto_65078 ) ) ( not ( = ?auto_65073 ?auto_65077 ) ) ( not ( = ?auto_65076 ?auto_65078 ) ) ( not ( = ?auto_65076 ?auto_65077 ) ) ( not ( = ?auto_65074 ?auto_65078 ) ) ( not ( = ?auto_65074 ?auto_65077 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65077 ?auto_65078 ?auto_65075 )
      ( MAKE-2PILE ?auto_65072 ?auto_65073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65079 - BLOCK
      ?auto_65080 - BLOCK
    )
    :vars
    (
      ?auto_65082 - BLOCK
      ?auto_65081 - BLOCK
      ?auto_65084 - BLOCK
      ?auto_65085 - BLOCK
      ?auto_65083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65082 ?auto_65080 ) ( ON-TABLE ?auto_65079 ) ( ON ?auto_65080 ?auto_65079 ) ( not ( = ?auto_65079 ?auto_65080 ) ) ( not ( = ?auto_65079 ?auto_65082 ) ) ( not ( = ?auto_65080 ?auto_65082 ) ) ( not ( = ?auto_65079 ?auto_65081 ) ) ( not ( = ?auto_65079 ?auto_65084 ) ) ( not ( = ?auto_65080 ?auto_65081 ) ) ( not ( = ?auto_65080 ?auto_65084 ) ) ( not ( = ?auto_65082 ?auto_65081 ) ) ( not ( = ?auto_65082 ?auto_65084 ) ) ( not ( = ?auto_65081 ?auto_65084 ) ) ( ON ?auto_65081 ?auto_65082 ) ( CLEAR ?auto_65085 ) ( ON-TABLE ?auto_65083 ) ( ON ?auto_65085 ?auto_65083 ) ( not ( = ?auto_65083 ?auto_65085 ) ) ( not ( = ?auto_65083 ?auto_65084 ) ) ( not ( = ?auto_65085 ?auto_65084 ) ) ( not ( = ?auto_65079 ?auto_65085 ) ) ( not ( = ?auto_65079 ?auto_65083 ) ) ( not ( = ?auto_65080 ?auto_65085 ) ) ( not ( = ?auto_65080 ?auto_65083 ) ) ( not ( = ?auto_65082 ?auto_65085 ) ) ( not ( = ?auto_65082 ?auto_65083 ) ) ( not ( = ?auto_65081 ?auto_65085 ) ) ( not ( = ?auto_65081 ?auto_65083 ) ) ( ON ?auto_65084 ?auto_65081 ) ( CLEAR ?auto_65084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65079 ?auto_65080 ?auto_65082 ?auto_65081 )
      ( MAKE-2PILE ?auto_65079 ?auto_65080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65086 - BLOCK
      ?auto_65087 - BLOCK
    )
    :vars
    (
      ?auto_65089 - BLOCK
      ?auto_65091 - BLOCK
      ?auto_65092 - BLOCK
      ?auto_65088 - BLOCK
      ?auto_65090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65089 ?auto_65087 ) ( ON-TABLE ?auto_65086 ) ( ON ?auto_65087 ?auto_65086 ) ( not ( = ?auto_65086 ?auto_65087 ) ) ( not ( = ?auto_65086 ?auto_65089 ) ) ( not ( = ?auto_65087 ?auto_65089 ) ) ( not ( = ?auto_65086 ?auto_65091 ) ) ( not ( = ?auto_65086 ?auto_65092 ) ) ( not ( = ?auto_65087 ?auto_65091 ) ) ( not ( = ?auto_65087 ?auto_65092 ) ) ( not ( = ?auto_65089 ?auto_65091 ) ) ( not ( = ?auto_65089 ?auto_65092 ) ) ( not ( = ?auto_65091 ?auto_65092 ) ) ( ON ?auto_65091 ?auto_65089 ) ( ON-TABLE ?auto_65088 ) ( not ( = ?auto_65088 ?auto_65090 ) ) ( not ( = ?auto_65088 ?auto_65092 ) ) ( not ( = ?auto_65090 ?auto_65092 ) ) ( not ( = ?auto_65086 ?auto_65090 ) ) ( not ( = ?auto_65086 ?auto_65088 ) ) ( not ( = ?auto_65087 ?auto_65090 ) ) ( not ( = ?auto_65087 ?auto_65088 ) ) ( not ( = ?auto_65089 ?auto_65090 ) ) ( not ( = ?auto_65089 ?auto_65088 ) ) ( not ( = ?auto_65091 ?auto_65090 ) ) ( not ( = ?auto_65091 ?auto_65088 ) ) ( ON ?auto_65092 ?auto_65091 ) ( CLEAR ?auto_65092 ) ( HOLDING ?auto_65090 ) ( CLEAR ?auto_65088 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65088 ?auto_65090 )
      ( MAKE-2PILE ?auto_65086 ?auto_65087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65093 - BLOCK
      ?auto_65094 - BLOCK
    )
    :vars
    (
      ?auto_65098 - BLOCK
      ?auto_65099 - BLOCK
      ?auto_65095 - BLOCK
      ?auto_65096 - BLOCK
      ?auto_65097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65098 ?auto_65094 ) ( ON-TABLE ?auto_65093 ) ( ON ?auto_65094 ?auto_65093 ) ( not ( = ?auto_65093 ?auto_65094 ) ) ( not ( = ?auto_65093 ?auto_65098 ) ) ( not ( = ?auto_65094 ?auto_65098 ) ) ( not ( = ?auto_65093 ?auto_65099 ) ) ( not ( = ?auto_65093 ?auto_65095 ) ) ( not ( = ?auto_65094 ?auto_65099 ) ) ( not ( = ?auto_65094 ?auto_65095 ) ) ( not ( = ?auto_65098 ?auto_65099 ) ) ( not ( = ?auto_65098 ?auto_65095 ) ) ( not ( = ?auto_65099 ?auto_65095 ) ) ( ON ?auto_65099 ?auto_65098 ) ( ON-TABLE ?auto_65096 ) ( not ( = ?auto_65096 ?auto_65097 ) ) ( not ( = ?auto_65096 ?auto_65095 ) ) ( not ( = ?auto_65097 ?auto_65095 ) ) ( not ( = ?auto_65093 ?auto_65097 ) ) ( not ( = ?auto_65093 ?auto_65096 ) ) ( not ( = ?auto_65094 ?auto_65097 ) ) ( not ( = ?auto_65094 ?auto_65096 ) ) ( not ( = ?auto_65098 ?auto_65097 ) ) ( not ( = ?auto_65098 ?auto_65096 ) ) ( not ( = ?auto_65099 ?auto_65097 ) ) ( not ( = ?auto_65099 ?auto_65096 ) ) ( ON ?auto_65095 ?auto_65099 ) ( CLEAR ?auto_65096 ) ( ON ?auto_65097 ?auto_65095 ) ( CLEAR ?auto_65097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65093 ?auto_65094 ?auto_65098 ?auto_65099 ?auto_65095 )
      ( MAKE-2PILE ?auto_65093 ?auto_65094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65100 - BLOCK
      ?auto_65101 - BLOCK
    )
    :vars
    (
      ?auto_65104 - BLOCK
      ?auto_65105 - BLOCK
      ?auto_65102 - BLOCK
      ?auto_65106 - BLOCK
      ?auto_65103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65104 ?auto_65101 ) ( ON-TABLE ?auto_65100 ) ( ON ?auto_65101 ?auto_65100 ) ( not ( = ?auto_65100 ?auto_65101 ) ) ( not ( = ?auto_65100 ?auto_65104 ) ) ( not ( = ?auto_65101 ?auto_65104 ) ) ( not ( = ?auto_65100 ?auto_65105 ) ) ( not ( = ?auto_65100 ?auto_65102 ) ) ( not ( = ?auto_65101 ?auto_65105 ) ) ( not ( = ?auto_65101 ?auto_65102 ) ) ( not ( = ?auto_65104 ?auto_65105 ) ) ( not ( = ?auto_65104 ?auto_65102 ) ) ( not ( = ?auto_65105 ?auto_65102 ) ) ( ON ?auto_65105 ?auto_65104 ) ( not ( = ?auto_65106 ?auto_65103 ) ) ( not ( = ?auto_65106 ?auto_65102 ) ) ( not ( = ?auto_65103 ?auto_65102 ) ) ( not ( = ?auto_65100 ?auto_65103 ) ) ( not ( = ?auto_65100 ?auto_65106 ) ) ( not ( = ?auto_65101 ?auto_65103 ) ) ( not ( = ?auto_65101 ?auto_65106 ) ) ( not ( = ?auto_65104 ?auto_65103 ) ) ( not ( = ?auto_65104 ?auto_65106 ) ) ( not ( = ?auto_65105 ?auto_65103 ) ) ( not ( = ?auto_65105 ?auto_65106 ) ) ( ON ?auto_65102 ?auto_65105 ) ( ON ?auto_65103 ?auto_65102 ) ( CLEAR ?auto_65103 ) ( HOLDING ?auto_65106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65106 )
      ( MAKE-2PILE ?auto_65100 ?auto_65101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65107 - BLOCK
      ?auto_65108 - BLOCK
    )
    :vars
    (
      ?auto_65111 - BLOCK
      ?auto_65109 - BLOCK
      ?auto_65112 - BLOCK
      ?auto_65110 - BLOCK
      ?auto_65113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65111 ?auto_65108 ) ( ON-TABLE ?auto_65107 ) ( ON ?auto_65108 ?auto_65107 ) ( not ( = ?auto_65107 ?auto_65108 ) ) ( not ( = ?auto_65107 ?auto_65111 ) ) ( not ( = ?auto_65108 ?auto_65111 ) ) ( not ( = ?auto_65107 ?auto_65109 ) ) ( not ( = ?auto_65107 ?auto_65112 ) ) ( not ( = ?auto_65108 ?auto_65109 ) ) ( not ( = ?auto_65108 ?auto_65112 ) ) ( not ( = ?auto_65111 ?auto_65109 ) ) ( not ( = ?auto_65111 ?auto_65112 ) ) ( not ( = ?auto_65109 ?auto_65112 ) ) ( ON ?auto_65109 ?auto_65111 ) ( not ( = ?auto_65110 ?auto_65113 ) ) ( not ( = ?auto_65110 ?auto_65112 ) ) ( not ( = ?auto_65113 ?auto_65112 ) ) ( not ( = ?auto_65107 ?auto_65113 ) ) ( not ( = ?auto_65107 ?auto_65110 ) ) ( not ( = ?auto_65108 ?auto_65113 ) ) ( not ( = ?auto_65108 ?auto_65110 ) ) ( not ( = ?auto_65111 ?auto_65113 ) ) ( not ( = ?auto_65111 ?auto_65110 ) ) ( not ( = ?auto_65109 ?auto_65113 ) ) ( not ( = ?auto_65109 ?auto_65110 ) ) ( ON ?auto_65112 ?auto_65109 ) ( ON ?auto_65113 ?auto_65112 ) ( ON ?auto_65110 ?auto_65113 ) ( CLEAR ?auto_65110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65107 ?auto_65108 ?auto_65111 ?auto_65109 ?auto_65112 ?auto_65113 )
      ( MAKE-2PILE ?auto_65107 ?auto_65108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65119 - BLOCK
      ?auto_65120 - BLOCK
      ?auto_65121 - BLOCK
      ?auto_65122 - BLOCK
      ?auto_65123 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65123 ) ( CLEAR ?auto_65122 ) ( ON-TABLE ?auto_65119 ) ( ON ?auto_65120 ?auto_65119 ) ( ON ?auto_65121 ?auto_65120 ) ( ON ?auto_65122 ?auto_65121 ) ( not ( = ?auto_65119 ?auto_65120 ) ) ( not ( = ?auto_65119 ?auto_65121 ) ) ( not ( = ?auto_65119 ?auto_65122 ) ) ( not ( = ?auto_65119 ?auto_65123 ) ) ( not ( = ?auto_65120 ?auto_65121 ) ) ( not ( = ?auto_65120 ?auto_65122 ) ) ( not ( = ?auto_65120 ?auto_65123 ) ) ( not ( = ?auto_65121 ?auto_65122 ) ) ( not ( = ?auto_65121 ?auto_65123 ) ) ( not ( = ?auto_65122 ?auto_65123 ) ) )
    :subtasks
    ( ( !STACK ?auto_65123 ?auto_65122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65124 - BLOCK
      ?auto_65125 - BLOCK
      ?auto_65126 - BLOCK
      ?auto_65127 - BLOCK
      ?auto_65128 - BLOCK
    )
    :vars
    (
      ?auto_65129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65127 ) ( ON-TABLE ?auto_65124 ) ( ON ?auto_65125 ?auto_65124 ) ( ON ?auto_65126 ?auto_65125 ) ( ON ?auto_65127 ?auto_65126 ) ( not ( = ?auto_65124 ?auto_65125 ) ) ( not ( = ?auto_65124 ?auto_65126 ) ) ( not ( = ?auto_65124 ?auto_65127 ) ) ( not ( = ?auto_65124 ?auto_65128 ) ) ( not ( = ?auto_65125 ?auto_65126 ) ) ( not ( = ?auto_65125 ?auto_65127 ) ) ( not ( = ?auto_65125 ?auto_65128 ) ) ( not ( = ?auto_65126 ?auto_65127 ) ) ( not ( = ?auto_65126 ?auto_65128 ) ) ( not ( = ?auto_65127 ?auto_65128 ) ) ( ON ?auto_65128 ?auto_65129 ) ( CLEAR ?auto_65128 ) ( HAND-EMPTY ) ( not ( = ?auto_65124 ?auto_65129 ) ) ( not ( = ?auto_65125 ?auto_65129 ) ) ( not ( = ?auto_65126 ?auto_65129 ) ) ( not ( = ?auto_65127 ?auto_65129 ) ) ( not ( = ?auto_65128 ?auto_65129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65128 ?auto_65129 )
      ( MAKE-5PILE ?auto_65124 ?auto_65125 ?auto_65126 ?auto_65127 ?auto_65128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65130 - BLOCK
      ?auto_65131 - BLOCK
      ?auto_65132 - BLOCK
      ?auto_65133 - BLOCK
      ?auto_65134 - BLOCK
    )
    :vars
    (
      ?auto_65135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65130 ) ( ON ?auto_65131 ?auto_65130 ) ( ON ?auto_65132 ?auto_65131 ) ( not ( = ?auto_65130 ?auto_65131 ) ) ( not ( = ?auto_65130 ?auto_65132 ) ) ( not ( = ?auto_65130 ?auto_65133 ) ) ( not ( = ?auto_65130 ?auto_65134 ) ) ( not ( = ?auto_65131 ?auto_65132 ) ) ( not ( = ?auto_65131 ?auto_65133 ) ) ( not ( = ?auto_65131 ?auto_65134 ) ) ( not ( = ?auto_65132 ?auto_65133 ) ) ( not ( = ?auto_65132 ?auto_65134 ) ) ( not ( = ?auto_65133 ?auto_65134 ) ) ( ON ?auto_65134 ?auto_65135 ) ( CLEAR ?auto_65134 ) ( not ( = ?auto_65130 ?auto_65135 ) ) ( not ( = ?auto_65131 ?auto_65135 ) ) ( not ( = ?auto_65132 ?auto_65135 ) ) ( not ( = ?auto_65133 ?auto_65135 ) ) ( not ( = ?auto_65134 ?auto_65135 ) ) ( HOLDING ?auto_65133 ) ( CLEAR ?auto_65132 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65130 ?auto_65131 ?auto_65132 ?auto_65133 )
      ( MAKE-5PILE ?auto_65130 ?auto_65131 ?auto_65132 ?auto_65133 ?auto_65134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65136 - BLOCK
      ?auto_65137 - BLOCK
      ?auto_65138 - BLOCK
      ?auto_65139 - BLOCK
      ?auto_65140 - BLOCK
    )
    :vars
    (
      ?auto_65141 - BLOCK
      ?auto_65142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65136 ) ( ON ?auto_65137 ?auto_65136 ) ( ON ?auto_65138 ?auto_65137 ) ( not ( = ?auto_65136 ?auto_65137 ) ) ( not ( = ?auto_65136 ?auto_65138 ) ) ( not ( = ?auto_65136 ?auto_65139 ) ) ( not ( = ?auto_65136 ?auto_65140 ) ) ( not ( = ?auto_65137 ?auto_65138 ) ) ( not ( = ?auto_65137 ?auto_65139 ) ) ( not ( = ?auto_65137 ?auto_65140 ) ) ( not ( = ?auto_65138 ?auto_65139 ) ) ( not ( = ?auto_65138 ?auto_65140 ) ) ( not ( = ?auto_65139 ?auto_65140 ) ) ( ON ?auto_65140 ?auto_65141 ) ( not ( = ?auto_65136 ?auto_65141 ) ) ( not ( = ?auto_65137 ?auto_65141 ) ) ( not ( = ?auto_65138 ?auto_65141 ) ) ( not ( = ?auto_65139 ?auto_65141 ) ) ( not ( = ?auto_65140 ?auto_65141 ) ) ( CLEAR ?auto_65138 ) ( ON ?auto_65139 ?auto_65140 ) ( CLEAR ?auto_65139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65142 ) ( ON ?auto_65141 ?auto_65142 ) ( not ( = ?auto_65142 ?auto_65141 ) ) ( not ( = ?auto_65142 ?auto_65140 ) ) ( not ( = ?auto_65142 ?auto_65139 ) ) ( not ( = ?auto_65136 ?auto_65142 ) ) ( not ( = ?auto_65137 ?auto_65142 ) ) ( not ( = ?auto_65138 ?auto_65142 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65142 ?auto_65141 ?auto_65140 )
      ( MAKE-5PILE ?auto_65136 ?auto_65137 ?auto_65138 ?auto_65139 ?auto_65140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65143 - BLOCK
      ?auto_65144 - BLOCK
      ?auto_65145 - BLOCK
      ?auto_65146 - BLOCK
      ?auto_65147 - BLOCK
    )
    :vars
    (
      ?auto_65148 - BLOCK
      ?auto_65149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65143 ) ( ON ?auto_65144 ?auto_65143 ) ( not ( = ?auto_65143 ?auto_65144 ) ) ( not ( = ?auto_65143 ?auto_65145 ) ) ( not ( = ?auto_65143 ?auto_65146 ) ) ( not ( = ?auto_65143 ?auto_65147 ) ) ( not ( = ?auto_65144 ?auto_65145 ) ) ( not ( = ?auto_65144 ?auto_65146 ) ) ( not ( = ?auto_65144 ?auto_65147 ) ) ( not ( = ?auto_65145 ?auto_65146 ) ) ( not ( = ?auto_65145 ?auto_65147 ) ) ( not ( = ?auto_65146 ?auto_65147 ) ) ( ON ?auto_65147 ?auto_65148 ) ( not ( = ?auto_65143 ?auto_65148 ) ) ( not ( = ?auto_65144 ?auto_65148 ) ) ( not ( = ?auto_65145 ?auto_65148 ) ) ( not ( = ?auto_65146 ?auto_65148 ) ) ( not ( = ?auto_65147 ?auto_65148 ) ) ( ON ?auto_65146 ?auto_65147 ) ( CLEAR ?auto_65146 ) ( ON-TABLE ?auto_65149 ) ( ON ?auto_65148 ?auto_65149 ) ( not ( = ?auto_65149 ?auto_65148 ) ) ( not ( = ?auto_65149 ?auto_65147 ) ) ( not ( = ?auto_65149 ?auto_65146 ) ) ( not ( = ?auto_65143 ?auto_65149 ) ) ( not ( = ?auto_65144 ?auto_65149 ) ) ( not ( = ?auto_65145 ?auto_65149 ) ) ( HOLDING ?auto_65145 ) ( CLEAR ?auto_65144 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65143 ?auto_65144 ?auto_65145 )
      ( MAKE-5PILE ?auto_65143 ?auto_65144 ?auto_65145 ?auto_65146 ?auto_65147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65150 - BLOCK
      ?auto_65151 - BLOCK
      ?auto_65152 - BLOCK
      ?auto_65153 - BLOCK
      ?auto_65154 - BLOCK
    )
    :vars
    (
      ?auto_65155 - BLOCK
      ?auto_65156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65150 ) ( ON ?auto_65151 ?auto_65150 ) ( not ( = ?auto_65150 ?auto_65151 ) ) ( not ( = ?auto_65150 ?auto_65152 ) ) ( not ( = ?auto_65150 ?auto_65153 ) ) ( not ( = ?auto_65150 ?auto_65154 ) ) ( not ( = ?auto_65151 ?auto_65152 ) ) ( not ( = ?auto_65151 ?auto_65153 ) ) ( not ( = ?auto_65151 ?auto_65154 ) ) ( not ( = ?auto_65152 ?auto_65153 ) ) ( not ( = ?auto_65152 ?auto_65154 ) ) ( not ( = ?auto_65153 ?auto_65154 ) ) ( ON ?auto_65154 ?auto_65155 ) ( not ( = ?auto_65150 ?auto_65155 ) ) ( not ( = ?auto_65151 ?auto_65155 ) ) ( not ( = ?auto_65152 ?auto_65155 ) ) ( not ( = ?auto_65153 ?auto_65155 ) ) ( not ( = ?auto_65154 ?auto_65155 ) ) ( ON ?auto_65153 ?auto_65154 ) ( ON-TABLE ?auto_65156 ) ( ON ?auto_65155 ?auto_65156 ) ( not ( = ?auto_65156 ?auto_65155 ) ) ( not ( = ?auto_65156 ?auto_65154 ) ) ( not ( = ?auto_65156 ?auto_65153 ) ) ( not ( = ?auto_65150 ?auto_65156 ) ) ( not ( = ?auto_65151 ?auto_65156 ) ) ( not ( = ?auto_65152 ?auto_65156 ) ) ( CLEAR ?auto_65151 ) ( ON ?auto_65152 ?auto_65153 ) ( CLEAR ?auto_65152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65156 ?auto_65155 ?auto_65154 ?auto_65153 )
      ( MAKE-5PILE ?auto_65150 ?auto_65151 ?auto_65152 ?auto_65153 ?auto_65154 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65157 - BLOCK
      ?auto_65158 - BLOCK
      ?auto_65159 - BLOCK
      ?auto_65160 - BLOCK
      ?auto_65161 - BLOCK
    )
    :vars
    (
      ?auto_65162 - BLOCK
      ?auto_65163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65158 ) ) ( not ( = ?auto_65157 ?auto_65159 ) ) ( not ( = ?auto_65157 ?auto_65160 ) ) ( not ( = ?auto_65157 ?auto_65161 ) ) ( not ( = ?auto_65158 ?auto_65159 ) ) ( not ( = ?auto_65158 ?auto_65160 ) ) ( not ( = ?auto_65158 ?auto_65161 ) ) ( not ( = ?auto_65159 ?auto_65160 ) ) ( not ( = ?auto_65159 ?auto_65161 ) ) ( not ( = ?auto_65160 ?auto_65161 ) ) ( ON ?auto_65161 ?auto_65162 ) ( not ( = ?auto_65157 ?auto_65162 ) ) ( not ( = ?auto_65158 ?auto_65162 ) ) ( not ( = ?auto_65159 ?auto_65162 ) ) ( not ( = ?auto_65160 ?auto_65162 ) ) ( not ( = ?auto_65161 ?auto_65162 ) ) ( ON ?auto_65160 ?auto_65161 ) ( ON-TABLE ?auto_65163 ) ( ON ?auto_65162 ?auto_65163 ) ( not ( = ?auto_65163 ?auto_65162 ) ) ( not ( = ?auto_65163 ?auto_65161 ) ) ( not ( = ?auto_65163 ?auto_65160 ) ) ( not ( = ?auto_65157 ?auto_65163 ) ) ( not ( = ?auto_65158 ?auto_65163 ) ) ( not ( = ?auto_65159 ?auto_65163 ) ) ( ON ?auto_65159 ?auto_65160 ) ( CLEAR ?auto_65159 ) ( HOLDING ?auto_65158 ) ( CLEAR ?auto_65157 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65157 ?auto_65158 )
      ( MAKE-5PILE ?auto_65157 ?auto_65158 ?auto_65159 ?auto_65160 ?auto_65161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65164 - BLOCK
      ?auto_65165 - BLOCK
      ?auto_65166 - BLOCK
      ?auto_65167 - BLOCK
      ?auto_65168 - BLOCK
    )
    :vars
    (
      ?auto_65169 - BLOCK
      ?auto_65170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65164 ) ( not ( = ?auto_65164 ?auto_65165 ) ) ( not ( = ?auto_65164 ?auto_65166 ) ) ( not ( = ?auto_65164 ?auto_65167 ) ) ( not ( = ?auto_65164 ?auto_65168 ) ) ( not ( = ?auto_65165 ?auto_65166 ) ) ( not ( = ?auto_65165 ?auto_65167 ) ) ( not ( = ?auto_65165 ?auto_65168 ) ) ( not ( = ?auto_65166 ?auto_65167 ) ) ( not ( = ?auto_65166 ?auto_65168 ) ) ( not ( = ?auto_65167 ?auto_65168 ) ) ( ON ?auto_65168 ?auto_65169 ) ( not ( = ?auto_65164 ?auto_65169 ) ) ( not ( = ?auto_65165 ?auto_65169 ) ) ( not ( = ?auto_65166 ?auto_65169 ) ) ( not ( = ?auto_65167 ?auto_65169 ) ) ( not ( = ?auto_65168 ?auto_65169 ) ) ( ON ?auto_65167 ?auto_65168 ) ( ON-TABLE ?auto_65170 ) ( ON ?auto_65169 ?auto_65170 ) ( not ( = ?auto_65170 ?auto_65169 ) ) ( not ( = ?auto_65170 ?auto_65168 ) ) ( not ( = ?auto_65170 ?auto_65167 ) ) ( not ( = ?auto_65164 ?auto_65170 ) ) ( not ( = ?auto_65165 ?auto_65170 ) ) ( not ( = ?auto_65166 ?auto_65170 ) ) ( ON ?auto_65166 ?auto_65167 ) ( CLEAR ?auto_65164 ) ( ON ?auto_65165 ?auto_65166 ) ( CLEAR ?auto_65165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65170 ?auto_65169 ?auto_65168 ?auto_65167 ?auto_65166 )
      ( MAKE-5PILE ?auto_65164 ?auto_65165 ?auto_65166 ?auto_65167 ?auto_65168 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65171 - BLOCK
      ?auto_65172 - BLOCK
      ?auto_65173 - BLOCK
      ?auto_65174 - BLOCK
      ?auto_65175 - BLOCK
    )
    :vars
    (
      ?auto_65176 - BLOCK
      ?auto_65177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65171 ?auto_65172 ) ) ( not ( = ?auto_65171 ?auto_65173 ) ) ( not ( = ?auto_65171 ?auto_65174 ) ) ( not ( = ?auto_65171 ?auto_65175 ) ) ( not ( = ?auto_65172 ?auto_65173 ) ) ( not ( = ?auto_65172 ?auto_65174 ) ) ( not ( = ?auto_65172 ?auto_65175 ) ) ( not ( = ?auto_65173 ?auto_65174 ) ) ( not ( = ?auto_65173 ?auto_65175 ) ) ( not ( = ?auto_65174 ?auto_65175 ) ) ( ON ?auto_65175 ?auto_65176 ) ( not ( = ?auto_65171 ?auto_65176 ) ) ( not ( = ?auto_65172 ?auto_65176 ) ) ( not ( = ?auto_65173 ?auto_65176 ) ) ( not ( = ?auto_65174 ?auto_65176 ) ) ( not ( = ?auto_65175 ?auto_65176 ) ) ( ON ?auto_65174 ?auto_65175 ) ( ON-TABLE ?auto_65177 ) ( ON ?auto_65176 ?auto_65177 ) ( not ( = ?auto_65177 ?auto_65176 ) ) ( not ( = ?auto_65177 ?auto_65175 ) ) ( not ( = ?auto_65177 ?auto_65174 ) ) ( not ( = ?auto_65171 ?auto_65177 ) ) ( not ( = ?auto_65172 ?auto_65177 ) ) ( not ( = ?auto_65173 ?auto_65177 ) ) ( ON ?auto_65173 ?auto_65174 ) ( ON ?auto_65172 ?auto_65173 ) ( CLEAR ?auto_65172 ) ( HOLDING ?auto_65171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65171 )
      ( MAKE-5PILE ?auto_65171 ?auto_65172 ?auto_65173 ?auto_65174 ?auto_65175 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65178 - BLOCK
      ?auto_65179 - BLOCK
      ?auto_65180 - BLOCK
      ?auto_65181 - BLOCK
      ?auto_65182 - BLOCK
    )
    :vars
    (
      ?auto_65183 - BLOCK
      ?auto_65184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65178 ?auto_65179 ) ) ( not ( = ?auto_65178 ?auto_65180 ) ) ( not ( = ?auto_65178 ?auto_65181 ) ) ( not ( = ?auto_65178 ?auto_65182 ) ) ( not ( = ?auto_65179 ?auto_65180 ) ) ( not ( = ?auto_65179 ?auto_65181 ) ) ( not ( = ?auto_65179 ?auto_65182 ) ) ( not ( = ?auto_65180 ?auto_65181 ) ) ( not ( = ?auto_65180 ?auto_65182 ) ) ( not ( = ?auto_65181 ?auto_65182 ) ) ( ON ?auto_65182 ?auto_65183 ) ( not ( = ?auto_65178 ?auto_65183 ) ) ( not ( = ?auto_65179 ?auto_65183 ) ) ( not ( = ?auto_65180 ?auto_65183 ) ) ( not ( = ?auto_65181 ?auto_65183 ) ) ( not ( = ?auto_65182 ?auto_65183 ) ) ( ON ?auto_65181 ?auto_65182 ) ( ON-TABLE ?auto_65184 ) ( ON ?auto_65183 ?auto_65184 ) ( not ( = ?auto_65184 ?auto_65183 ) ) ( not ( = ?auto_65184 ?auto_65182 ) ) ( not ( = ?auto_65184 ?auto_65181 ) ) ( not ( = ?auto_65178 ?auto_65184 ) ) ( not ( = ?auto_65179 ?auto_65184 ) ) ( not ( = ?auto_65180 ?auto_65184 ) ) ( ON ?auto_65180 ?auto_65181 ) ( ON ?auto_65179 ?auto_65180 ) ( ON ?auto_65178 ?auto_65179 ) ( CLEAR ?auto_65178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65184 ?auto_65183 ?auto_65182 ?auto_65181 ?auto_65180 ?auto_65179 )
      ( MAKE-5PILE ?auto_65178 ?auto_65179 ?auto_65180 ?auto_65181 ?auto_65182 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65186 - BLOCK
    )
    :vars
    (
      ?auto_65187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65187 ?auto_65186 ) ( CLEAR ?auto_65187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65186 ) ( not ( = ?auto_65186 ?auto_65187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65187 ?auto_65186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65188 - BLOCK
    )
    :vars
    (
      ?auto_65189 - BLOCK
      ?auto_65190 - BLOCK
      ?auto_65191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65189 ?auto_65188 ) ( CLEAR ?auto_65189 ) ( ON-TABLE ?auto_65188 ) ( not ( = ?auto_65188 ?auto_65189 ) ) ( HOLDING ?auto_65190 ) ( CLEAR ?auto_65191 ) ( not ( = ?auto_65188 ?auto_65190 ) ) ( not ( = ?auto_65188 ?auto_65191 ) ) ( not ( = ?auto_65189 ?auto_65190 ) ) ( not ( = ?auto_65189 ?auto_65191 ) ) ( not ( = ?auto_65190 ?auto_65191 ) ) )
    :subtasks
    ( ( !STACK ?auto_65190 ?auto_65191 )
      ( MAKE-1PILE ?auto_65188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65192 - BLOCK
    )
    :vars
    (
      ?auto_65194 - BLOCK
      ?auto_65195 - BLOCK
      ?auto_65193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65194 ?auto_65192 ) ( ON-TABLE ?auto_65192 ) ( not ( = ?auto_65192 ?auto_65194 ) ) ( CLEAR ?auto_65195 ) ( not ( = ?auto_65192 ?auto_65193 ) ) ( not ( = ?auto_65192 ?auto_65195 ) ) ( not ( = ?auto_65194 ?auto_65193 ) ) ( not ( = ?auto_65194 ?auto_65195 ) ) ( not ( = ?auto_65193 ?auto_65195 ) ) ( ON ?auto_65193 ?auto_65194 ) ( CLEAR ?auto_65193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65192 ?auto_65194 )
      ( MAKE-1PILE ?auto_65192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65196 - BLOCK
    )
    :vars
    (
      ?auto_65197 - BLOCK
      ?auto_65199 - BLOCK
      ?auto_65198 - BLOCK
      ?auto_65200 - BLOCK
      ?auto_65201 - BLOCK
      ?auto_65202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65197 ?auto_65196 ) ( ON-TABLE ?auto_65196 ) ( not ( = ?auto_65196 ?auto_65197 ) ) ( not ( = ?auto_65196 ?auto_65199 ) ) ( not ( = ?auto_65196 ?auto_65198 ) ) ( not ( = ?auto_65197 ?auto_65199 ) ) ( not ( = ?auto_65197 ?auto_65198 ) ) ( not ( = ?auto_65199 ?auto_65198 ) ) ( ON ?auto_65199 ?auto_65197 ) ( CLEAR ?auto_65199 ) ( HOLDING ?auto_65198 ) ( CLEAR ?auto_65200 ) ( ON-TABLE ?auto_65201 ) ( ON ?auto_65202 ?auto_65201 ) ( ON ?auto_65200 ?auto_65202 ) ( not ( = ?auto_65201 ?auto_65202 ) ) ( not ( = ?auto_65201 ?auto_65200 ) ) ( not ( = ?auto_65201 ?auto_65198 ) ) ( not ( = ?auto_65202 ?auto_65200 ) ) ( not ( = ?auto_65202 ?auto_65198 ) ) ( not ( = ?auto_65200 ?auto_65198 ) ) ( not ( = ?auto_65196 ?auto_65200 ) ) ( not ( = ?auto_65196 ?auto_65201 ) ) ( not ( = ?auto_65196 ?auto_65202 ) ) ( not ( = ?auto_65197 ?auto_65200 ) ) ( not ( = ?auto_65197 ?auto_65201 ) ) ( not ( = ?auto_65197 ?auto_65202 ) ) ( not ( = ?auto_65199 ?auto_65200 ) ) ( not ( = ?auto_65199 ?auto_65201 ) ) ( not ( = ?auto_65199 ?auto_65202 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65201 ?auto_65202 ?auto_65200 ?auto_65198 )
      ( MAKE-1PILE ?auto_65196 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65203 - BLOCK
    )
    :vars
    (
      ?auto_65205 - BLOCK
      ?auto_65207 - BLOCK
      ?auto_65206 - BLOCK
      ?auto_65208 - BLOCK
      ?auto_65204 - BLOCK
      ?auto_65209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65205 ?auto_65203 ) ( ON-TABLE ?auto_65203 ) ( not ( = ?auto_65203 ?auto_65205 ) ) ( not ( = ?auto_65203 ?auto_65207 ) ) ( not ( = ?auto_65203 ?auto_65206 ) ) ( not ( = ?auto_65205 ?auto_65207 ) ) ( not ( = ?auto_65205 ?auto_65206 ) ) ( not ( = ?auto_65207 ?auto_65206 ) ) ( ON ?auto_65207 ?auto_65205 ) ( CLEAR ?auto_65208 ) ( ON-TABLE ?auto_65204 ) ( ON ?auto_65209 ?auto_65204 ) ( ON ?auto_65208 ?auto_65209 ) ( not ( = ?auto_65204 ?auto_65209 ) ) ( not ( = ?auto_65204 ?auto_65208 ) ) ( not ( = ?auto_65204 ?auto_65206 ) ) ( not ( = ?auto_65209 ?auto_65208 ) ) ( not ( = ?auto_65209 ?auto_65206 ) ) ( not ( = ?auto_65208 ?auto_65206 ) ) ( not ( = ?auto_65203 ?auto_65208 ) ) ( not ( = ?auto_65203 ?auto_65204 ) ) ( not ( = ?auto_65203 ?auto_65209 ) ) ( not ( = ?auto_65205 ?auto_65208 ) ) ( not ( = ?auto_65205 ?auto_65204 ) ) ( not ( = ?auto_65205 ?auto_65209 ) ) ( not ( = ?auto_65207 ?auto_65208 ) ) ( not ( = ?auto_65207 ?auto_65204 ) ) ( not ( = ?auto_65207 ?auto_65209 ) ) ( ON ?auto_65206 ?auto_65207 ) ( CLEAR ?auto_65206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65203 ?auto_65205 ?auto_65207 )
      ( MAKE-1PILE ?auto_65203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65210 - BLOCK
    )
    :vars
    (
      ?auto_65212 - BLOCK
      ?auto_65216 - BLOCK
      ?auto_65213 - BLOCK
      ?auto_65214 - BLOCK
      ?auto_65211 - BLOCK
      ?auto_65215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65212 ?auto_65210 ) ( ON-TABLE ?auto_65210 ) ( not ( = ?auto_65210 ?auto_65212 ) ) ( not ( = ?auto_65210 ?auto_65216 ) ) ( not ( = ?auto_65210 ?auto_65213 ) ) ( not ( = ?auto_65212 ?auto_65216 ) ) ( not ( = ?auto_65212 ?auto_65213 ) ) ( not ( = ?auto_65216 ?auto_65213 ) ) ( ON ?auto_65216 ?auto_65212 ) ( ON-TABLE ?auto_65214 ) ( ON ?auto_65211 ?auto_65214 ) ( not ( = ?auto_65214 ?auto_65211 ) ) ( not ( = ?auto_65214 ?auto_65215 ) ) ( not ( = ?auto_65214 ?auto_65213 ) ) ( not ( = ?auto_65211 ?auto_65215 ) ) ( not ( = ?auto_65211 ?auto_65213 ) ) ( not ( = ?auto_65215 ?auto_65213 ) ) ( not ( = ?auto_65210 ?auto_65215 ) ) ( not ( = ?auto_65210 ?auto_65214 ) ) ( not ( = ?auto_65210 ?auto_65211 ) ) ( not ( = ?auto_65212 ?auto_65215 ) ) ( not ( = ?auto_65212 ?auto_65214 ) ) ( not ( = ?auto_65212 ?auto_65211 ) ) ( not ( = ?auto_65216 ?auto_65215 ) ) ( not ( = ?auto_65216 ?auto_65214 ) ) ( not ( = ?auto_65216 ?auto_65211 ) ) ( ON ?auto_65213 ?auto_65216 ) ( CLEAR ?auto_65213 ) ( HOLDING ?auto_65215 ) ( CLEAR ?auto_65211 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65214 ?auto_65211 ?auto_65215 )
      ( MAKE-1PILE ?auto_65210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65217 - BLOCK
    )
    :vars
    (
      ?auto_65221 - BLOCK
      ?auto_65218 - BLOCK
      ?auto_65220 - BLOCK
      ?auto_65219 - BLOCK
      ?auto_65222 - BLOCK
      ?auto_65223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65221 ?auto_65217 ) ( ON-TABLE ?auto_65217 ) ( not ( = ?auto_65217 ?auto_65221 ) ) ( not ( = ?auto_65217 ?auto_65218 ) ) ( not ( = ?auto_65217 ?auto_65220 ) ) ( not ( = ?auto_65221 ?auto_65218 ) ) ( not ( = ?auto_65221 ?auto_65220 ) ) ( not ( = ?auto_65218 ?auto_65220 ) ) ( ON ?auto_65218 ?auto_65221 ) ( ON-TABLE ?auto_65219 ) ( ON ?auto_65222 ?auto_65219 ) ( not ( = ?auto_65219 ?auto_65222 ) ) ( not ( = ?auto_65219 ?auto_65223 ) ) ( not ( = ?auto_65219 ?auto_65220 ) ) ( not ( = ?auto_65222 ?auto_65223 ) ) ( not ( = ?auto_65222 ?auto_65220 ) ) ( not ( = ?auto_65223 ?auto_65220 ) ) ( not ( = ?auto_65217 ?auto_65223 ) ) ( not ( = ?auto_65217 ?auto_65219 ) ) ( not ( = ?auto_65217 ?auto_65222 ) ) ( not ( = ?auto_65221 ?auto_65223 ) ) ( not ( = ?auto_65221 ?auto_65219 ) ) ( not ( = ?auto_65221 ?auto_65222 ) ) ( not ( = ?auto_65218 ?auto_65223 ) ) ( not ( = ?auto_65218 ?auto_65219 ) ) ( not ( = ?auto_65218 ?auto_65222 ) ) ( ON ?auto_65220 ?auto_65218 ) ( CLEAR ?auto_65222 ) ( ON ?auto_65223 ?auto_65220 ) ( CLEAR ?auto_65223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65217 ?auto_65221 ?auto_65218 ?auto_65220 )
      ( MAKE-1PILE ?auto_65217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65224 - BLOCK
    )
    :vars
    (
      ?auto_65230 - BLOCK
      ?auto_65229 - BLOCK
      ?auto_65227 - BLOCK
      ?auto_65226 - BLOCK
      ?auto_65225 - BLOCK
      ?auto_65228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65230 ?auto_65224 ) ( ON-TABLE ?auto_65224 ) ( not ( = ?auto_65224 ?auto_65230 ) ) ( not ( = ?auto_65224 ?auto_65229 ) ) ( not ( = ?auto_65224 ?auto_65227 ) ) ( not ( = ?auto_65230 ?auto_65229 ) ) ( not ( = ?auto_65230 ?auto_65227 ) ) ( not ( = ?auto_65229 ?auto_65227 ) ) ( ON ?auto_65229 ?auto_65230 ) ( ON-TABLE ?auto_65226 ) ( not ( = ?auto_65226 ?auto_65225 ) ) ( not ( = ?auto_65226 ?auto_65228 ) ) ( not ( = ?auto_65226 ?auto_65227 ) ) ( not ( = ?auto_65225 ?auto_65228 ) ) ( not ( = ?auto_65225 ?auto_65227 ) ) ( not ( = ?auto_65228 ?auto_65227 ) ) ( not ( = ?auto_65224 ?auto_65228 ) ) ( not ( = ?auto_65224 ?auto_65226 ) ) ( not ( = ?auto_65224 ?auto_65225 ) ) ( not ( = ?auto_65230 ?auto_65228 ) ) ( not ( = ?auto_65230 ?auto_65226 ) ) ( not ( = ?auto_65230 ?auto_65225 ) ) ( not ( = ?auto_65229 ?auto_65228 ) ) ( not ( = ?auto_65229 ?auto_65226 ) ) ( not ( = ?auto_65229 ?auto_65225 ) ) ( ON ?auto_65227 ?auto_65229 ) ( ON ?auto_65228 ?auto_65227 ) ( CLEAR ?auto_65228 ) ( HOLDING ?auto_65225 ) ( CLEAR ?auto_65226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65226 ?auto_65225 )
      ( MAKE-1PILE ?auto_65224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65231 - BLOCK
    )
    :vars
    (
      ?auto_65234 - BLOCK
      ?auto_65236 - BLOCK
      ?auto_65237 - BLOCK
      ?auto_65232 - BLOCK
      ?auto_65233 - BLOCK
      ?auto_65235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65234 ?auto_65231 ) ( ON-TABLE ?auto_65231 ) ( not ( = ?auto_65231 ?auto_65234 ) ) ( not ( = ?auto_65231 ?auto_65236 ) ) ( not ( = ?auto_65231 ?auto_65237 ) ) ( not ( = ?auto_65234 ?auto_65236 ) ) ( not ( = ?auto_65234 ?auto_65237 ) ) ( not ( = ?auto_65236 ?auto_65237 ) ) ( ON ?auto_65236 ?auto_65234 ) ( ON-TABLE ?auto_65232 ) ( not ( = ?auto_65232 ?auto_65233 ) ) ( not ( = ?auto_65232 ?auto_65235 ) ) ( not ( = ?auto_65232 ?auto_65237 ) ) ( not ( = ?auto_65233 ?auto_65235 ) ) ( not ( = ?auto_65233 ?auto_65237 ) ) ( not ( = ?auto_65235 ?auto_65237 ) ) ( not ( = ?auto_65231 ?auto_65235 ) ) ( not ( = ?auto_65231 ?auto_65232 ) ) ( not ( = ?auto_65231 ?auto_65233 ) ) ( not ( = ?auto_65234 ?auto_65235 ) ) ( not ( = ?auto_65234 ?auto_65232 ) ) ( not ( = ?auto_65234 ?auto_65233 ) ) ( not ( = ?auto_65236 ?auto_65235 ) ) ( not ( = ?auto_65236 ?auto_65232 ) ) ( not ( = ?auto_65236 ?auto_65233 ) ) ( ON ?auto_65237 ?auto_65236 ) ( ON ?auto_65235 ?auto_65237 ) ( CLEAR ?auto_65232 ) ( ON ?auto_65233 ?auto_65235 ) ( CLEAR ?auto_65233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65231 ?auto_65234 ?auto_65236 ?auto_65237 ?auto_65235 )
      ( MAKE-1PILE ?auto_65231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65238 - BLOCK
    )
    :vars
    (
      ?auto_65243 - BLOCK
      ?auto_65239 - BLOCK
      ?auto_65240 - BLOCK
      ?auto_65244 - BLOCK
      ?auto_65242 - BLOCK
      ?auto_65241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65243 ?auto_65238 ) ( ON-TABLE ?auto_65238 ) ( not ( = ?auto_65238 ?auto_65243 ) ) ( not ( = ?auto_65238 ?auto_65239 ) ) ( not ( = ?auto_65238 ?auto_65240 ) ) ( not ( = ?auto_65243 ?auto_65239 ) ) ( not ( = ?auto_65243 ?auto_65240 ) ) ( not ( = ?auto_65239 ?auto_65240 ) ) ( ON ?auto_65239 ?auto_65243 ) ( not ( = ?auto_65244 ?auto_65242 ) ) ( not ( = ?auto_65244 ?auto_65241 ) ) ( not ( = ?auto_65244 ?auto_65240 ) ) ( not ( = ?auto_65242 ?auto_65241 ) ) ( not ( = ?auto_65242 ?auto_65240 ) ) ( not ( = ?auto_65241 ?auto_65240 ) ) ( not ( = ?auto_65238 ?auto_65241 ) ) ( not ( = ?auto_65238 ?auto_65244 ) ) ( not ( = ?auto_65238 ?auto_65242 ) ) ( not ( = ?auto_65243 ?auto_65241 ) ) ( not ( = ?auto_65243 ?auto_65244 ) ) ( not ( = ?auto_65243 ?auto_65242 ) ) ( not ( = ?auto_65239 ?auto_65241 ) ) ( not ( = ?auto_65239 ?auto_65244 ) ) ( not ( = ?auto_65239 ?auto_65242 ) ) ( ON ?auto_65240 ?auto_65239 ) ( ON ?auto_65241 ?auto_65240 ) ( ON ?auto_65242 ?auto_65241 ) ( CLEAR ?auto_65242 ) ( HOLDING ?auto_65244 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65244 )
      ( MAKE-1PILE ?auto_65238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65245 - BLOCK
    )
    :vars
    (
      ?auto_65250 - BLOCK
      ?auto_65246 - BLOCK
      ?auto_65249 - BLOCK
      ?auto_65247 - BLOCK
      ?auto_65251 - BLOCK
      ?auto_65248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65250 ?auto_65245 ) ( ON-TABLE ?auto_65245 ) ( not ( = ?auto_65245 ?auto_65250 ) ) ( not ( = ?auto_65245 ?auto_65246 ) ) ( not ( = ?auto_65245 ?auto_65249 ) ) ( not ( = ?auto_65250 ?auto_65246 ) ) ( not ( = ?auto_65250 ?auto_65249 ) ) ( not ( = ?auto_65246 ?auto_65249 ) ) ( ON ?auto_65246 ?auto_65250 ) ( not ( = ?auto_65247 ?auto_65251 ) ) ( not ( = ?auto_65247 ?auto_65248 ) ) ( not ( = ?auto_65247 ?auto_65249 ) ) ( not ( = ?auto_65251 ?auto_65248 ) ) ( not ( = ?auto_65251 ?auto_65249 ) ) ( not ( = ?auto_65248 ?auto_65249 ) ) ( not ( = ?auto_65245 ?auto_65248 ) ) ( not ( = ?auto_65245 ?auto_65247 ) ) ( not ( = ?auto_65245 ?auto_65251 ) ) ( not ( = ?auto_65250 ?auto_65248 ) ) ( not ( = ?auto_65250 ?auto_65247 ) ) ( not ( = ?auto_65250 ?auto_65251 ) ) ( not ( = ?auto_65246 ?auto_65248 ) ) ( not ( = ?auto_65246 ?auto_65247 ) ) ( not ( = ?auto_65246 ?auto_65251 ) ) ( ON ?auto_65249 ?auto_65246 ) ( ON ?auto_65248 ?auto_65249 ) ( ON ?auto_65251 ?auto_65248 ) ( ON ?auto_65247 ?auto_65251 ) ( CLEAR ?auto_65247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65245 ?auto_65250 ?auto_65246 ?auto_65249 ?auto_65248 ?auto_65251 )
      ( MAKE-1PILE ?auto_65245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65258 - BLOCK
      ?auto_65259 - BLOCK
      ?auto_65260 - BLOCK
      ?auto_65261 - BLOCK
      ?auto_65262 - BLOCK
      ?auto_65263 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65263 ) ( CLEAR ?auto_65262 ) ( ON-TABLE ?auto_65258 ) ( ON ?auto_65259 ?auto_65258 ) ( ON ?auto_65260 ?auto_65259 ) ( ON ?auto_65261 ?auto_65260 ) ( ON ?auto_65262 ?auto_65261 ) ( not ( = ?auto_65258 ?auto_65259 ) ) ( not ( = ?auto_65258 ?auto_65260 ) ) ( not ( = ?auto_65258 ?auto_65261 ) ) ( not ( = ?auto_65258 ?auto_65262 ) ) ( not ( = ?auto_65258 ?auto_65263 ) ) ( not ( = ?auto_65259 ?auto_65260 ) ) ( not ( = ?auto_65259 ?auto_65261 ) ) ( not ( = ?auto_65259 ?auto_65262 ) ) ( not ( = ?auto_65259 ?auto_65263 ) ) ( not ( = ?auto_65260 ?auto_65261 ) ) ( not ( = ?auto_65260 ?auto_65262 ) ) ( not ( = ?auto_65260 ?auto_65263 ) ) ( not ( = ?auto_65261 ?auto_65262 ) ) ( not ( = ?auto_65261 ?auto_65263 ) ) ( not ( = ?auto_65262 ?auto_65263 ) ) )
    :subtasks
    ( ( !STACK ?auto_65263 ?auto_65262 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65264 - BLOCK
      ?auto_65265 - BLOCK
      ?auto_65266 - BLOCK
      ?auto_65267 - BLOCK
      ?auto_65268 - BLOCK
      ?auto_65269 - BLOCK
    )
    :vars
    (
      ?auto_65270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65268 ) ( ON-TABLE ?auto_65264 ) ( ON ?auto_65265 ?auto_65264 ) ( ON ?auto_65266 ?auto_65265 ) ( ON ?auto_65267 ?auto_65266 ) ( ON ?auto_65268 ?auto_65267 ) ( not ( = ?auto_65264 ?auto_65265 ) ) ( not ( = ?auto_65264 ?auto_65266 ) ) ( not ( = ?auto_65264 ?auto_65267 ) ) ( not ( = ?auto_65264 ?auto_65268 ) ) ( not ( = ?auto_65264 ?auto_65269 ) ) ( not ( = ?auto_65265 ?auto_65266 ) ) ( not ( = ?auto_65265 ?auto_65267 ) ) ( not ( = ?auto_65265 ?auto_65268 ) ) ( not ( = ?auto_65265 ?auto_65269 ) ) ( not ( = ?auto_65266 ?auto_65267 ) ) ( not ( = ?auto_65266 ?auto_65268 ) ) ( not ( = ?auto_65266 ?auto_65269 ) ) ( not ( = ?auto_65267 ?auto_65268 ) ) ( not ( = ?auto_65267 ?auto_65269 ) ) ( not ( = ?auto_65268 ?auto_65269 ) ) ( ON ?auto_65269 ?auto_65270 ) ( CLEAR ?auto_65269 ) ( HAND-EMPTY ) ( not ( = ?auto_65264 ?auto_65270 ) ) ( not ( = ?auto_65265 ?auto_65270 ) ) ( not ( = ?auto_65266 ?auto_65270 ) ) ( not ( = ?auto_65267 ?auto_65270 ) ) ( not ( = ?auto_65268 ?auto_65270 ) ) ( not ( = ?auto_65269 ?auto_65270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65269 ?auto_65270 )
      ( MAKE-6PILE ?auto_65264 ?auto_65265 ?auto_65266 ?auto_65267 ?auto_65268 ?auto_65269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65271 - BLOCK
      ?auto_65272 - BLOCK
      ?auto_65273 - BLOCK
      ?auto_65274 - BLOCK
      ?auto_65275 - BLOCK
      ?auto_65276 - BLOCK
    )
    :vars
    (
      ?auto_65277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65271 ) ( ON ?auto_65272 ?auto_65271 ) ( ON ?auto_65273 ?auto_65272 ) ( ON ?auto_65274 ?auto_65273 ) ( not ( = ?auto_65271 ?auto_65272 ) ) ( not ( = ?auto_65271 ?auto_65273 ) ) ( not ( = ?auto_65271 ?auto_65274 ) ) ( not ( = ?auto_65271 ?auto_65275 ) ) ( not ( = ?auto_65271 ?auto_65276 ) ) ( not ( = ?auto_65272 ?auto_65273 ) ) ( not ( = ?auto_65272 ?auto_65274 ) ) ( not ( = ?auto_65272 ?auto_65275 ) ) ( not ( = ?auto_65272 ?auto_65276 ) ) ( not ( = ?auto_65273 ?auto_65274 ) ) ( not ( = ?auto_65273 ?auto_65275 ) ) ( not ( = ?auto_65273 ?auto_65276 ) ) ( not ( = ?auto_65274 ?auto_65275 ) ) ( not ( = ?auto_65274 ?auto_65276 ) ) ( not ( = ?auto_65275 ?auto_65276 ) ) ( ON ?auto_65276 ?auto_65277 ) ( CLEAR ?auto_65276 ) ( not ( = ?auto_65271 ?auto_65277 ) ) ( not ( = ?auto_65272 ?auto_65277 ) ) ( not ( = ?auto_65273 ?auto_65277 ) ) ( not ( = ?auto_65274 ?auto_65277 ) ) ( not ( = ?auto_65275 ?auto_65277 ) ) ( not ( = ?auto_65276 ?auto_65277 ) ) ( HOLDING ?auto_65275 ) ( CLEAR ?auto_65274 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65271 ?auto_65272 ?auto_65273 ?auto_65274 ?auto_65275 )
      ( MAKE-6PILE ?auto_65271 ?auto_65272 ?auto_65273 ?auto_65274 ?auto_65275 ?auto_65276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65278 - BLOCK
      ?auto_65279 - BLOCK
      ?auto_65280 - BLOCK
      ?auto_65281 - BLOCK
      ?auto_65282 - BLOCK
      ?auto_65283 - BLOCK
    )
    :vars
    (
      ?auto_65284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65278 ) ( ON ?auto_65279 ?auto_65278 ) ( ON ?auto_65280 ?auto_65279 ) ( ON ?auto_65281 ?auto_65280 ) ( not ( = ?auto_65278 ?auto_65279 ) ) ( not ( = ?auto_65278 ?auto_65280 ) ) ( not ( = ?auto_65278 ?auto_65281 ) ) ( not ( = ?auto_65278 ?auto_65282 ) ) ( not ( = ?auto_65278 ?auto_65283 ) ) ( not ( = ?auto_65279 ?auto_65280 ) ) ( not ( = ?auto_65279 ?auto_65281 ) ) ( not ( = ?auto_65279 ?auto_65282 ) ) ( not ( = ?auto_65279 ?auto_65283 ) ) ( not ( = ?auto_65280 ?auto_65281 ) ) ( not ( = ?auto_65280 ?auto_65282 ) ) ( not ( = ?auto_65280 ?auto_65283 ) ) ( not ( = ?auto_65281 ?auto_65282 ) ) ( not ( = ?auto_65281 ?auto_65283 ) ) ( not ( = ?auto_65282 ?auto_65283 ) ) ( ON ?auto_65283 ?auto_65284 ) ( not ( = ?auto_65278 ?auto_65284 ) ) ( not ( = ?auto_65279 ?auto_65284 ) ) ( not ( = ?auto_65280 ?auto_65284 ) ) ( not ( = ?auto_65281 ?auto_65284 ) ) ( not ( = ?auto_65282 ?auto_65284 ) ) ( not ( = ?auto_65283 ?auto_65284 ) ) ( CLEAR ?auto_65281 ) ( ON ?auto_65282 ?auto_65283 ) ( CLEAR ?auto_65282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65284 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65284 ?auto_65283 )
      ( MAKE-6PILE ?auto_65278 ?auto_65279 ?auto_65280 ?auto_65281 ?auto_65282 ?auto_65283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65285 - BLOCK
      ?auto_65286 - BLOCK
      ?auto_65287 - BLOCK
      ?auto_65288 - BLOCK
      ?auto_65289 - BLOCK
      ?auto_65290 - BLOCK
    )
    :vars
    (
      ?auto_65291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65285 ) ( ON ?auto_65286 ?auto_65285 ) ( ON ?auto_65287 ?auto_65286 ) ( not ( = ?auto_65285 ?auto_65286 ) ) ( not ( = ?auto_65285 ?auto_65287 ) ) ( not ( = ?auto_65285 ?auto_65288 ) ) ( not ( = ?auto_65285 ?auto_65289 ) ) ( not ( = ?auto_65285 ?auto_65290 ) ) ( not ( = ?auto_65286 ?auto_65287 ) ) ( not ( = ?auto_65286 ?auto_65288 ) ) ( not ( = ?auto_65286 ?auto_65289 ) ) ( not ( = ?auto_65286 ?auto_65290 ) ) ( not ( = ?auto_65287 ?auto_65288 ) ) ( not ( = ?auto_65287 ?auto_65289 ) ) ( not ( = ?auto_65287 ?auto_65290 ) ) ( not ( = ?auto_65288 ?auto_65289 ) ) ( not ( = ?auto_65288 ?auto_65290 ) ) ( not ( = ?auto_65289 ?auto_65290 ) ) ( ON ?auto_65290 ?auto_65291 ) ( not ( = ?auto_65285 ?auto_65291 ) ) ( not ( = ?auto_65286 ?auto_65291 ) ) ( not ( = ?auto_65287 ?auto_65291 ) ) ( not ( = ?auto_65288 ?auto_65291 ) ) ( not ( = ?auto_65289 ?auto_65291 ) ) ( not ( = ?auto_65290 ?auto_65291 ) ) ( ON ?auto_65289 ?auto_65290 ) ( CLEAR ?auto_65289 ) ( ON-TABLE ?auto_65291 ) ( HOLDING ?auto_65288 ) ( CLEAR ?auto_65287 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65285 ?auto_65286 ?auto_65287 ?auto_65288 )
      ( MAKE-6PILE ?auto_65285 ?auto_65286 ?auto_65287 ?auto_65288 ?auto_65289 ?auto_65290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65292 - BLOCK
      ?auto_65293 - BLOCK
      ?auto_65294 - BLOCK
      ?auto_65295 - BLOCK
      ?auto_65296 - BLOCK
      ?auto_65297 - BLOCK
    )
    :vars
    (
      ?auto_65298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65292 ) ( ON ?auto_65293 ?auto_65292 ) ( ON ?auto_65294 ?auto_65293 ) ( not ( = ?auto_65292 ?auto_65293 ) ) ( not ( = ?auto_65292 ?auto_65294 ) ) ( not ( = ?auto_65292 ?auto_65295 ) ) ( not ( = ?auto_65292 ?auto_65296 ) ) ( not ( = ?auto_65292 ?auto_65297 ) ) ( not ( = ?auto_65293 ?auto_65294 ) ) ( not ( = ?auto_65293 ?auto_65295 ) ) ( not ( = ?auto_65293 ?auto_65296 ) ) ( not ( = ?auto_65293 ?auto_65297 ) ) ( not ( = ?auto_65294 ?auto_65295 ) ) ( not ( = ?auto_65294 ?auto_65296 ) ) ( not ( = ?auto_65294 ?auto_65297 ) ) ( not ( = ?auto_65295 ?auto_65296 ) ) ( not ( = ?auto_65295 ?auto_65297 ) ) ( not ( = ?auto_65296 ?auto_65297 ) ) ( ON ?auto_65297 ?auto_65298 ) ( not ( = ?auto_65292 ?auto_65298 ) ) ( not ( = ?auto_65293 ?auto_65298 ) ) ( not ( = ?auto_65294 ?auto_65298 ) ) ( not ( = ?auto_65295 ?auto_65298 ) ) ( not ( = ?auto_65296 ?auto_65298 ) ) ( not ( = ?auto_65297 ?auto_65298 ) ) ( ON ?auto_65296 ?auto_65297 ) ( ON-TABLE ?auto_65298 ) ( CLEAR ?auto_65294 ) ( ON ?auto_65295 ?auto_65296 ) ( CLEAR ?auto_65295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65298 ?auto_65297 ?auto_65296 )
      ( MAKE-6PILE ?auto_65292 ?auto_65293 ?auto_65294 ?auto_65295 ?auto_65296 ?auto_65297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65299 - BLOCK
      ?auto_65300 - BLOCK
      ?auto_65301 - BLOCK
      ?auto_65302 - BLOCK
      ?auto_65303 - BLOCK
      ?auto_65304 - BLOCK
    )
    :vars
    (
      ?auto_65305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65299 ) ( ON ?auto_65300 ?auto_65299 ) ( not ( = ?auto_65299 ?auto_65300 ) ) ( not ( = ?auto_65299 ?auto_65301 ) ) ( not ( = ?auto_65299 ?auto_65302 ) ) ( not ( = ?auto_65299 ?auto_65303 ) ) ( not ( = ?auto_65299 ?auto_65304 ) ) ( not ( = ?auto_65300 ?auto_65301 ) ) ( not ( = ?auto_65300 ?auto_65302 ) ) ( not ( = ?auto_65300 ?auto_65303 ) ) ( not ( = ?auto_65300 ?auto_65304 ) ) ( not ( = ?auto_65301 ?auto_65302 ) ) ( not ( = ?auto_65301 ?auto_65303 ) ) ( not ( = ?auto_65301 ?auto_65304 ) ) ( not ( = ?auto_65302 ?auto_65303 ) ) ( not ( = ?auto_65302 ?auto_65304 ) ) ( not ( = ?auto_65303 ?auto_65304 ) ) ( ON ?auto_65304 ?auto_65305 ) ( not ( = ?auto_65299 ?auto_65305 ) ) ( not ( = ?auto_65300 ?auto_65305 ) ) ( not ( = ?auto_65301 ?auto_65305 ) ) ( not ( = ?auto_65302 ?auto_65305 ) ) ( not ( = ?auto_65303 ?auto_65305 ) ) ( not ( = ?auto_65304 ?auto_65305 ) ) ( ON ?auto_65303 ?auto_65304 ) ( ON-TABLE ?auto_65305 ) ( ON ?auto_65302 ?auto_65303 ) ( CLEAR ?auto_65302 ) ( HOLDING ?auto_65301 ) ( CLEAR ?auto_65300 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65299 ?auto_65300 ?auto_65301 )
      ( MAKE-6PILE ?auto_65299 ?auto_65300 ?auto_65301 ?auto_65302 ?auto_65303 ?auto_65304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65306 - BLOCK
      ?auto_65307 - BLOCK
      ?auto_65308 - BLOCK
      ?auto_65309 - BLOCK
      ?auto_65310 - BLOCK
      ?auto_65311 - BLOCK
    )
    :vars
    (
      ?auto_65312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65306 ) ( ON ?auto_65307 ?auto_65306 ) ( not ( = ?auto_65306 ?auto_65307 ) ) ( not ( = ?auto_65306 ?auto_65308 ) ) ( not ( = ?auto_65306 ?auto_65309 ) ) ( not ( = ?auto_65306 ?auto_65310 ) ) ( not ( = ?auto_65306 ?auto_65311 ) ) ( not ( = ?auto_65307 ?auto_65308 ) ) ( not ( = ?auto_65307 ?auto_65309 ) ) ( not ( = ?auto_65307 ?auto_65310 ) ) ( not ( = ?auto_65307 ?auto_65311 ) ) ( not ( = ?auto_65308 ?auto_65309 ) ) ( not ( = ?auto_65308 ?auto_65310 ) ) ( not ( = ?auto_65308 ?auto_65311 ) ) ( not ( = ?auto_65309 ?auto_65310 ) ) ( not ( = ?auto_65309 ?auto_65311 ) ) ( not ( = ?auto_65310 ?auto_65311 ) ) ( ON ?auto_65311 ?auto_65312 ) ( not ( = ?auto_65306 ?auto_65312 ) ) ( not ( = ?auto_65307 ?auto_65312 ) ) ( not ( = ?auto_65308 ?auto_65312 ) ) ( not ( = ?auto_65309 ?auto_65312 ) ) ( not ( = ?auto_65310 ?auto_65312 ) ) ( not ( = ?auto_65311 ?auto_65312 ) ) ( ON ?auto_65310 ?auto_65311 ) ( ON-TABLE ?auto_65312 ) ( ON ?auto_65309 ?auto_65310 ) ( CLEAR ?auto_65307 ) ( ON ?auto_65308 ?auto_65309 ) ( CLEAR ?auto_65308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65312 ?auto_65311 ?auto_65310 ?auto_65309 )
      ( MAKE-6PILE ?auto_65306 ?auto_65307 ?auto_65308 ?auto_65309 ?auto_65310 ?auto_65311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65313 - BLOCK
      ?auto_65314 - BLOCK
      ?auto_65315 - BLOCK
      ?auto_65316 - BLOCK
      ?auto_65317 - BLOCK
      ?auto_65318 - BLOCK
    )
    :vars
    (
      ?auto_65319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65313 ) ( not ( = ?auto_65313 ?auto_65314 ) ) ( not ( = ?auto_65313 ?auto_65315 ) ) ( not ( = ?auto_65313 ?auto_65316 ) ) ( not ( = ?auto_65313 ?auto_65317 ) ) ( not ( = ?auto_65313 ?auto_65318 ) ) ( not ( = ?auto_65314 ?auto_65315 ) ) ( not ( = ?auto_65314 ?auto_65316 ) ) ( not ( = ?auto_65314 ?auto_65317 ) ) ( not ( = ?auto_65314 ?auto_65318 ) ) ( not ( = ?auto_65315 ?auto_65316 ) ) ( not ( = ?auto_65315 ?auto_65317 ) ) ( not ( = ?auto_65315 ?auto_65318 ) ) ( not ( = ?auto_65316 ?auto_65317 ) ) ( not ( = ?auto_65316 ?auto_65318 ) ) ( not ( = ?auto_65317 ?auto_65318 ) ) ( ON ?auto_65318 ?auto_65319 ) ( not ( = ?auto_65313 ?auto_65319 ) ) ( not ( = ?auto_65314 ?auto_65319 ) ) ( not ( = ?auto_65315 ?auto_65319 ) ) ( not ( = ?auto_65316 ?auto_65319 ) ) ( not ( = ?auto_65317 ?auto_65319 ) ) ( not ( = ?auto_65318 ?auto_65319 ) ) ( ON ?auto_65317 ?auto_65318 ) ( ON-TABLE ?auto_65319 ) ( ON ?auto_65316 ?auto_65317 ) ( ON ?auto_65315 ?auto_65316 ) ( CLEAR ?auto_65315 ) ( HOLDING ?auto_65314 ) ( CLEAR ?auto_65313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65313 ?auto_65314 )
      ( MAKE-6PILE ?auto_65313 ?auto_65314 ?auto_65315 ?auto_65316 ?auto_65317 ?auto_65318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65320 - BLOCK
      ?auto_65321 - BLOCK
      ?auto_65322 - BLOCK
      ?auto_65323 - BLOCK
      ?auto_65324 - BLOCK
      ?auto_65325 - BLOCK
    )
    :vars
    (
      ?auto_65326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65320 ) ( not ( = ?auto_65320 ?auto_65321 ) ) ( not ( = ?auto_65320 ?auto_65322 ) ) ( not ( = ?auto_65320 ?auto_65323 ) ) ( not ( = ?auto_65320 ?auto_65324 ) ) ( not ( = ?auto_65320 ?auto_65325 ) ) ( not ( = ?auto_65321 ?auto_65322 ) ) ( not ( = ?auto_65321 ?auto_65323 ) ) ( not ( = ?auto_65321 ?auto_65324 ) ) ( not ( = ?auto_65321 ?auto_65325 ) ) ( not ( = ?auto_65322 ?auto_65323 ) ) ( not ( = ?auto_65322 ?auto_65324 ) ) ( not ( = ?auto_65322 ?auto_65325 ) ) ( not ( = ?auto_65323 ?auto_65324 ) ) ( not ( = ?auto_65323 ?auto_65325 ) ) ( not ( = ?auto_65324 ?auto_65325 ) ) ( ON ?auto_65325 ?auto_65326 ) ( not ( = ?auto_65320 ?auto_65326 ) ) ( not ( = ?auto_65321 ?auto_65326 ) ) ( not ( = ?auto_65322 ?auto_65326 ) ) ( not ( = ?auto_65323 ?auto_65326 ) ) ( not ( = ?auto_65324 ?auto_65326 ) ) ( not ( = ?auto_65325 ?auto_65326 ) ) ( ON ?auto_65324 ?auto_65325 ) ( ON-TABLE ?auto_65326 ) ( ON ?auto_65323 ?auto_65324 ) ( ON ?auto_65322 ?auto_65323 ) ( CLEAR ?auto_65320 ) ( ON ?auto_65321 ?auto_65322 ) ( CLEAR ?auto_65321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65326 ?auto_65325 ?auto_65324 ?auto_65323 ?auto_65322 )
      ( MAKE-6PILE ?auto_65320 ?auto_65321 ?auto_65322 ?auto_65323 ?auto_65324 ?auto_65325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65327 - BLOCK
      ?auto_65328 - BLOCK
      ?auto_65329 - BLOCK
      ?auto_65330 - BLOCK
      ?auto_65331 - BLOCK
      ?auto_65332 - BLOCK
    )
    :vars
    (
      ?auto_65333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65327 ?auto_65328 ) ) ( not ( = ?auto_65327 ?auto_65329 ) ) ( not ( = ?auto_65327 ?auto_65330 ) ) ( not ( = ?auto_65327 ?auto_65331 ) ) ( not ( = ?auto_65327 ?auto_65332 ) ) ( not ( = ?auto_65328 ?auto_65329 ) ) ( not ( = ?auto_65328 ?auto_65330 ) ) ( not ( = ?auto_65328 ?auto_65331 ) ) ( not ( = ?auto_65328 ?auto_65332 ) ) ( not ( = ?auto_65329 ?auto_65330 ) ) ( not ( = ?auto_65329 ?auto_65331 ) ) ( not ( = ?auto_65329 ?auto_65332 ) ) ( not ( = ?auto_65330 ?auto_65331 ) ) ( not ( = ?auto_65330 ?auto_65332 ) ) ( not ( = ?auto_65331 ?auto_65332 ) ) ( ON ?auto_65332 ?auto_65333 ) ( not ( = ?auto_65327 ?auto_65333 ) ) ( not ( = ?auto_65328 ?auto_65333 ) ) ( not ( = ?auto_65329 ?auto_65333 ) ) ( not ( = ?auto_65330 ?auto_65333 ) ) ( not ( = ?auto_65331 ?auto_65333 ) ) ( not ( = ?auto_65332 ?auto_65333 ) ) ( ON ?auto_65331 ?auto_65332 ) ( ON-TABLE ?auto_65333 ) ( ON ?auto_65330 ?auto_65331 ) ( ON ?auto_65329 ?auto_65330 ) ( ON ?auto_65328 ?auto_65329 ) ( CLEAR ?auto_65328 ) ( HOLDING ?auto_65327 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65327 )
      ( MAKE-6PILE ?auto_65327 ?auto_65328 ?auto_65329 ?auto_65330 ?auto_65331 ?auto_65332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_65334 - BLOCK
      ?auto_65335 - BLOCK
      ?auto_65336 - BLOCK
      ?auto_65337 - BLOCK
      ?auto_65338 - BLOCK
      ?auto_65339 - BLOCK
    )
    :vars
    (
      ?auto_65340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65334 ?auto_65335 ) ) ( not ( = ?auto_65334 ?auto_65336 ) ) ( not ( = ?auto_65334 ?auto_65337 ) ) ( not ( = ?auto_65334 ?auto_65338 ) ) ( not ( = ?auto_65334 ?auto_65339 ) ) ( not ( = ?auto_65335 ?auto_65336 ) ) ( not ( = ?auto_65335 ?auto_65337 ) ) ( not ( = ?auto_65335 ?auto_65338 ) ) ( not ( = ?auto_65335 ?auto_65339 ) ) ( not ( = ?auto_65336 ?auto_65337 ) ) ( not ( = ?auto_65336 ?auto_65338 ) ) ( not ( = ?auto_65336 ?auto_65339 ) ) ( not ( = ?auto_65337 ?auto_65338 ) ) ( not ( = ?auto_65337 ?auto_65339 ) ) ( not ( = ?auto_65338 ?auto_65339 ) ) ( ON ?auto_65339 ?auto_65340 ) ( not ( = ?auto_65334 ?auto_65340 ) ) ( not ( = ?auto_65335 ?auto_65340 ) ) ( not ( = ?auto_65336 ?auto_65340 ) ) ( not ( = ?auto_65337 ?auto_65340 ) ) ( not ( = ?auto_65338 ?auto_65340 ) ) ( not ( = ?auto_65339 ?auto_65340 ) ) ( ON ?auto_65338 ?auto_65339 ) ( ON-TABLE ?auto_65340 ) ( ON ?auto_65337 ?auto_65338 ) ( ON ?auto_65336 ?auto_65337 ) ( ON ?auto_65335 ?auto_65336 ) ( ON ?auto_65334 ?auto_65335 ) ( CLEAR ?auto_65334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65340 ?auto_65339 ?auto_65338 ?auto_65337 ?auto_65336 ?auto_65335 )
      ( MAKE-6PILE ?auto_65334 ?auto_65335 ?auto_65336 ?auto_65337 ?auto_65338 ?auto_65339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65346 - BLOCK
      ?auto_65347 - BLOCK
      ?auto_65348 - BLOCK
      ?auto_65349 - BLOCK
      ?auto_65350 - BLOCK
    )
    :vars
    (
      ?auto_65351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65351 ?auto_65350 ) ( CLEAR ?auto_65351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65346 ) ( ON ?auto_65347 ?auto_65346 ) ( ON ?auto_65348 ?auto_65347 ) ( ON ?auto_65349 ?auto_65348 ) ( ON ?auto_65350 ?auto_65349 ) ( not ( = ?auto_65346 ?auto_65347 ) ) ( not ( = ?auto_65346 ?auto_65348 ) ) ( not ( = ?auto_65346 ?auto_65349 ) ) ( not ( = ?auto_65346 ?auto_65350 ) ) ( not ( = ?auto_65346 ?auto_65351 ) ) ( not ( = ?auto_65347 ?auto_65348 ) ) ( not ( = ?auto_65347 ?auto_65349 ) ) ( not ( = ?auto_65347 ?auto_65350 ) ) ( not ( = ?auto_65347 ?auto_65351 ) ) ( not ( = ?auto_65348 ?auto_65349 ) ) ( not ( = ?auto_65348 ?auto_65350 ) ) ( not ( = ?auto_65348 ?auto_65351 ) ) ( not ( = ?auto_65349 ?auto_65350 ) ) ( not ( = ?auto_65349 ?auto_65351 ) ) ( not ( = ?auto_65350 ?auto_65351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65351 ?auto_65350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65365 - BLOCK
      ?auto_65366 - BLOCK
      ?auto_65367 - BLOCK
      ?auto_65368 - BLOCK
      ?auto_65369 - BLOCK
    )
    :vars
    (
      ?auto_65370 - BLOCK
      ?auto_65371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65365 ) ( ON ?auto_65366 ?auto_65365 ) ( ON ?auto_65367 ?auto_65366 ) ( ON ?auto_65368 ?auto_65367 ) ( not ( = ?auto_65365 ?auto_65366 ) ) ( not ( = ?auto_65365 ?auto_65367 ) ) ( not ( = ?auto_65365 ?auto_65368 ) ) ( not ( = ?auto_65365 ?auto_65369 ) ) ( not ( = ?auto_65365 ?auto_65370 ) ) ( not ( = ?auto_65366 ?auto_65367 ) ) ( not ( = ?auto_65366 ?auto_65368 ) ) ( not ( = ?auto_65366 ?auto_65369 ) ) ( not ( = ?auto_65366 ?auto_65370 ) ) ( not ( = ?auto_65367 ?auto_65368 ) ) ( not ( = ?auto_65367 ?auto_65369 ) ) ( not ( = ?auto_65367 ?auto_65370 ) ) ( not ( = ?auto_65368 ?auto_65369 ) ) ( not ( = ?auto_65368 ?auto_65370 ) ) ( not ( = ?auto_65369 ?auto_65370 ) ) ( ON ?auto_65370 ?auto_65371 ) ( CLEAR ?auto_65370 ) ( not ( = ?auto_65365 ?auto_65371 ) ) ( not ( = ?auto_65366 ?auto_65371 ) ) ( not ( = ?auto_65367 ?auto_65371 ) ) ( not ( = ?auto_65368 ?auto_65371 ) ) ( not ( = ?auto_65369 ?auto_65371 ) ) ( not ( = ?auto_65370 ?auto_65371 ) ) ( HOLDING ?auto_65369 ) ( CLEAR ?auto_65368 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65365 ?auto_65366 ?auto_65367 ?auto_65368 ?auto_65369 ?auto_65370 )
      ( MAKE-5PILE ?auto_65365 ?auto_65366 ?auto_65367 ?auto_65368 ?auto_65369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65372 - BLOCK
      ?auto_65373 - BLOCK
      ?auto_65374 - BLOCK
      ?auto_65375 - BLOCK
      ?auto_65376 - BLOCK
    )
    :vars
    (
      ?auto_65377 - BLOCK
      ?auto_65378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65372 ) ( ON ?auto_65373 ?auto_65372 ) ( ON ?auto_65374 ?auto_65373 ) ( ON ?auto_65375 ?auto_65374 ) ( not ( = ?auto_65372 ?auto_65373 ) ) ( not ( = ?auto_65372 ?auto_65374 ) ) ( not ( = ?auto_65372 ?auto_65375 ) ) ( not ( = ?auto_65372 ?auto_65376 ) ) ( not ( = ?auto_65372 ?auto_65377 ) ) ( not ( = ?auto_65373 ?auto_65374 ) ) ( not ( = ?auto_65373 ?auto_65375 ) ) ( not ( = ?auto_65373 ?auto_65376 ) ) ( not ( = ?auto_65373 ?auto_65377 ) ) ( not ( = ?auto_65374 ?auto_65375 ) ) ( not ( = ?auto_65374 ?auto_65376 ) ) ( not ( = ?auto_65374 ?auto_65377 ) ) ( not ( = ?auto_65375 ?auto_65376 ) ) ( not ( = ?auto_65375 ?auto_65377 ) ) ( not ( = ?auto_65376 ?auto_65377 ) ) ( ON ?auto_65377 ?auto_65378 ) ( not ( = ?auto_65372 ?auto_65378 ) ) ( not ( = ?auto_65373 ?auto_65378 ) ) ( not ( = ?auto_65374 ?auto_65378 ) ) ( not ( = ?auto_65375 ?auto_65378 ) ) ( not ( = ?auto_65376 ?auto_65378 ) ) ( not ( = ?auto_65377 ?auto_65378 ) ) ( CLEAR ?auto_65375 ) ( ON ?auto_65376 ?auto_65377 ) ( CLEAR ?auto_65376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65378 ?auto_65377 )
      ( MAKE-5PILE ?auto_65372 ?auto_65373 ?auto_65374 ?auto_65375 ?auto_65376 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65379 - BLOCK
      ?auto_65380 - BLOCK
      ?auto_65381 - BLOCK
      ?auto_65382 - BLOCK
      ?auto_65383 - BLOCK
    )
    :vars
    (
      ?auto_65384 - BLOCK
      ?auto_65385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65379 ) ( ON ?auto_65380 ?auto_65379 ) ( ON ?auto_65381 ?auto_65380 ) ( not ( = ?auto_65379 ?auto_65380 ) ) ( not ( = ?auto_65379 ?auto_65381 ) ) ( not ( = ?auto_65379 ?auto_65382 ) ) ( not ( = ?auto_65379 ?auto_65383 ) ) ( not ( = ?auto_65379 ?auto_65384 ) ) ( not ( = ?auto_65380 ?auto_65381 ) ) ( not ( = ?auto_65380 ?auto_65382 ) ) ( not ( = ?auto_65380 ?auto_65383 ) ) ( not ( = ?auto_65380 ?auto_65384 ) ) ( not ( = ?auto_65381 ?auto_65382 ) ) ( not ( = ?auto_65381 ?auto_65383 ) ) ( not ( = ?auto_65381 ?auto_65384 ) ) ( not ( = ?auto_65382 ?auto_65383 ) ) ( not ( = ?auto_65382 ?auto_65384 ) ) ( not ( = ?auto_65383 ?auto_65384 ) ) ( ON ?auto_65384 ?auto_65385 ) ( not ( = ?auto_65379 ?auto_65385 ) ) ( not ( = ?auto_65380 ?auto_65385 ) ) ( not ( = ?auto_65381 ?auto_65385 ) ) ( not ( = ?auto_65382 ?auto_65385 ) ) ( not ( = ?auto_65383 ?auto_65385 ) ) ( not ( = ?auto_65384 ?auto_65385 ) ) ( ON ?auto_65383 ?auto_65384 ) ( CLEAR ?auto_65383 ) ( ON-TABLE ?auto_65385 ) ( HOLDING ?auto_65382 ) ( CLEAR ?auto_65381 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65379 ?auto_65380 ?auto_65381 ?auto_65382 )
      ( MAKE-5PILE ?auto_65379 ?auto_65380 ?auto_65381 ?auto_65382 ?auto_65383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65386 - BLOCK
      ?auto_65387 - BLOCK
      ?auto_65388 - BLOCK
      ?auto_65389 - BLOCK
      ?auto_65390 - BLOCK
    )
    :vars
    (
      ?auto_65391 - BLOCK
      ?auto_65392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65386 ) ( ON ?auto_65387 ?auto_65386 ) ( ON ?auto_65388 ?auto_65387 ) ( not ( = ?auto_65386 ?auto_65387 ) ) ( not ( = ?auto_65386 ?auto_65388 ) ) ( not ( = ?auto_65386 ?auto_65389 ) ) ( not ( = ?auto_65386 ?auto_65390 ) ) ( not ( = ?auto_65386 ?auto_65391 ) ) ( not ( = ?auto_65387 ?auto_65388 ) ) ( not ( = ?auto_65387 ?auto_65389 ) ) ( not ( = ?auto_65387 ?auto_65390 ) ) ( not ( = ?auto_65387 ?auto_65391 ) ) ( not ( = ?auto_65388 ?auto_65389 ) ) ( not ( = ?auto_65388 ?auto_65390 ) ) ( not ( = ?auto_65388 ?auto_65391 ) ) ( not ( = ?auto_65389 ?auto_65390 ) ) ( not ( = ?auto_65389 ?auto_65391 ) ) ( not ( = ?auto_65390 ?auto_65391 ) ) ( ON ?auto_65391 ?auto_65392 ) ( not ( = ?auto_65386 ?auto_65392 ) ) ( not ( = ?auto_65387 ?auto_65392 ) ) ( not ( = ?auto_65388 ?auto_65392 ) ) ( not ( = ?auto_65389 ?auto_65392 ) ) ( not ( = ?auto_65390 ?auto_65392 ) ) ( not ( = ?auto_65391 ?auto_65392 ) ) ( ON ?auto_65390 ?auto_65391 ) ( ON-TABLE ?auto_65392 ) ( CLEAR ?auto_65388 ) ( ON ?auto_65389 ?auto_65390 ) ( CLEAR ?auto_65389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65392 ?auto_65391 ?auto_65390 )
      ( MAKE-5PILE ?auto_65386 ?auto_65387 ?auto_65388 ?auto_65389 ?auto_65390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65393 - BLOCK
      ?auto_65394 - BLOCK
      ?auto_65395 - BLOCK
      ?auto_65396 - BLOCK
      ?auto_65397 - BLOCK
    )
    :vars
    (
      ?auto_65398 - BLOCK
      ?auto_65399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65393 ) ( ON ?auto_65394 ?auto_65393 ) ( not ( = ?auto_65393 ?auto_65394 ) ) ( not ( = ?auto_65393 ?auto_65395 ) ) ( not ( = ?auto_65393 ?auto_65396 ) ) ( not ( = ?auto_65393 ?auto_65397 ) ) ( not ( = ?auto_65393 ?auto_65398 ) ) ( not ( = ?auto_65394 ?auto_65395 ) ) ( not ( = ?auto_65394 ?auto_65396 ) ) ( not ( = ?auto_65394 ?auto_65397 ) ) ( not ( = ?auto_65394 ?auto_65398 ) ) ( not ( = ?auto_65395 ?auto_65396 ) ) ( not ( = ?auto_65395 ?auto_65397 ) ) ( not ( = ?auto_65395 ?auto_65398 ) ) ( not ( = ?auto_65396 ?auto_65397 ) ) ( not ( = ?auto_65396 ?auto_65398 ) ) ( not ( = ?auto_65397 ?auto_65398 ) ) ( ON ?auto_65398 ?auto_65399 ) ( not ( = ?auto_65393 ?auto_65399 ) ) ( not ( = ?auto_65394 ?auto_65399 ) ) ( not ( = ?auto_65395 ?auto_65399 ) ) ( not ( = ?auto_65396 ?auto_65399 ) ) ( not ( = ?auto_65397 ?auto_65399 ) ) ( not ( = ?auto_65398 ?auto_65399 ) ) ( ON ?auto_65397 ?auto_65398 ) ( ON-TABLE ?auto_65399 ) ( ON ?auto_65396 ?auto_65397 ) ( CLEAR ?auto_65396 ) ( HOLDING ?auto_65395 ) ( CLEAR ?auto_65394 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65393 ?auto_65394 ?auto_65395 )
      ( MAKE-5PILE ?auto_65393 ?auto_65394 ?auto_65395 ?auto_65396 ?auto_65397 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65400 - BLOCK
      ?auto_65401 - BLOCK
      ?auto_65402 - BLOCK
      ?auto_65403 - BLOCK
      ?auto_65404 - BLOCK
    )
    :vars
    (
      ?auto_65405 - BLOCK
      ?auto_65406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65400 ) ( ON ?auto_65401 ?auto_65400 ) ( not ( = ?auto_65400 ?auto_65401 ) ) ( not ( = ?auto_65400 ?auto_65402 ) ) ( not ( = ?auto_65400 ?auto_65403 ) ) ( not ( = ?auto_65400 ?auto_65404 ) ) ( not ( = ?auto_65400 ?auto_65405 ) ) ( not ( = ?auto_65401 ?auto_65402 ) ) ( not ( = ?auto_65401 ?auto_65403 ) ) ( not ( = ?auto_65401 ?auto_65404 ) ) ( not ( = ?auto_65401 ?auto_65405 ) ) ( not ( = ?auto_65402 ?auto_65403 ) ) ( not ( = ?auto_65402 ?auto_65404 ) ) ( not ( = ?auto_65402 ?auto_65405 ) ) ( not ( = ?auto_65403 ?auto_65404 ) ) ( not ( = ?auto_65403 ?auto_65405 ) ) ( not ( = ?auto_65404 ?auto_65405 ) ) ( ON ?auto_65405 ?auto_65406 ) ( not ( = ?auto_65400 ?auto_65406 ) ) ( not ( = ?auto_65401 ?auto_65406 ) ) ( not ( = ?auto_65402 ?auto_65406 ) ) ( not ( = ?auto_65403 ?auto_65406 ) ) ( not ( = ?auto_65404 ?auto_65406 ) ) ( not ( = ?auto_65405 ?auto_65406 ) ) ( ON ?auto_65404 ?auto_65405 ) ( ON-TABLE ?auto_65406 ) ( ON ?auto_65403 ?auto_65404 ) ( CLEAR ?auto_65401 ) ( ON ?auto_65402 ?auto_65403 ) ( CLEAR ?auto_65402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65406 ?auto_65405 ?auto_65404 ?auto_65403 )
      ( MAKE-5PILE ?auto_65400 ?auto_65401 ?auto_65402 ?auto_65403 ?auto_65404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65407 - BLOCK
      ?auto_65408 - BLOCK
      ?auto_65409 - BLOCK
      ?auto_65410 - BLOCK
      ?auto_65411 - BLOCK
    )
    :vars
    (
      ?auto_65412 - BLOCK
      ?auto_65413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65407 ) ( not ( = ?auto_65407 ?auto_65408 ) ) ( not ( = ?auto_65407 ?auto_65409 ) ) ( not ( = ?auto_65407 ?auto_65410 ) ) ( not ( = ?auto_65407 ?auto_65411 ) ) ( not ( = ?auto_65407 ?auto_65412 ) ) ( not ( = ?auto_65408 ?auto_65409 ) ) ( not ( = ?auto_65408 ?auto_65410 ) ) ( not ( = ?auto_65408 ?auto_65411 ) ) ( not ( = ?auto_65408 ?auto_65412 ) ) ( not ( = ?auto_65409 ?auto_65410 ) ) ( not ( = ?auto_65409 ?auto_65411 ) ) ( not ( = ?auto_65409 ?auto_65412 ) ) ( not ( = ?auto_65410 ?auto_65411 ) ) ( not ( = ?auto_65410 ?auto_65412 ) ) ( not ( = ?auto_65411 ?auto_65412 ) ) ( ON ?auto_65412 ?auto_65413 ) ( not ( = ?auto_65407 ?auto_65413 ) ) ( not ( = ?auto_65408 ?auto_65413 ) ) ( not ( = ?auto_65409 ?auto_65413 ) ) ( not ( = ?auto_65410 ?auto_65413 ) ) ( not ( = ?auto_65411 ?auto_65413 ) ) ( not ( = ?auto_65412 ?auto_65413 ) ) ( ON ?auto_65411 ?auto_65412 ) ( ON-TABLE ?auto_65413 ) ( ON ?auto_65410 ?auto_65411 ) ( ON ?auto_65409 ?auto_65410 ) ( CLEAR ?auto_65409 ) ( HOLDING ?auto_65408 ) ( CLEAR ?auto_65407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65407 ?auto_65408 )
      ( MAKE-5PILE ?auto_65407 ?auto_65408 ?auto_65409 ?auto_65410 ?auto_65411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65414 - BLOCK
      ?auto_65415 - BLOCK
      ?auto_65416 - BLOCK
      ?auto_65417 - BLOCK
      ?auto_65418 - BLOCK
    )
    :vars
    (
      ?auto_65420 - BLOCK
      ?auto_65419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65414 ) ( not ( = ?auto_65414 ?auto_65415 ) ) ( not ( = ?auto_65414 ?auto_65416 ) ) ( not ( = ?auto_65414 ?auto_65417 ) ) ( not ( = ?auto_65414 ?auto_65418 ) ) ( not ( = ?auto_65414 ?auto_65420 ) ) ( not ( = ?auto_65415 ?auto_65416 ) ) ( not ( = ?auto_65415 ?auto_65417 ) ) ( not ( = ?auto_65415 ?auto_65418 ) ) ( not ( = ?auto_65415 ?auto_65420 ) ) ( not ( = ?auto_65416 ?auto_65417 ) ) ( not ( = ?auto_65416 ?auto_65418 ) ) ( not ( = ?auto_65416 ?auto_65420 ) ) ( not ( = ?auto_65417 ?auto_65418 ) ) ( not ( = ?auto_65417 ?auto_65420 ) ) ( not ( = ?auto_65418 ?auto_65420 ) ) ( ON ?auto_65420 ?auto_65419 ) ( not ( = ?auto_65414 ?auto_65419 ) ) ( not ( = ?auto_65415 ?auto_65419 ) ) ( not ( = ?auto_65416 ?auto_65419 ) ) ( not ( = ?auto_65417 ?auto_65419 ) ) ( not ( = ?auto_65418 ?auto_65419 ) ) ( not ( = ?auto_65420 ?auto_65419 ) ) ( ON ?auto_65418 ?auto_65420 ) ( ON-TABLE ?auto_65419 ) ( ON ?auto_65417 ?auto_65418 ) ( ON ?auto_65416 ?auto_65417 ) ( CLEAR ?auto_65414 ) ( ON ?auto_65415 ?auto_65416 ) ( CLEAR ?auto_65415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65419 ?auto_65420 ?auto_65418 ?auto_65417 ?auto_65416 )
      ( MAKE-5PILE ?auto_65414 ?auto_65415 ?auto_65416 ?auto_65417 ?auto_65418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65421 - BLOCK
      ?auto_65422 - BLOCK
      ?auto_65423 - BLOCK
      ?auto_65424 - BLOCK
      ?auto_65425 - BLOCK
    )
    :vars
    (
      ?auto_65426 - BLOCK
      ?auto_65427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65421 ?auto_65422 ) ) ( not ( = ?auto_65421 ?auto_65423 ) ) ( not ( = ?auto_65421 ?auto_65424 ) ) ( not ( = ?auto_65421 ?auto_65425 ) ) ( not ( = ?auto_65421 ?auto_65426 ) ) ( not ( = ?auto_65422 ?auto_65423 ) ) ( not ( = ?auto_65422 ?auto_65424 ) ) ( not ( = ?auto_65422 ?auto_65425 ) ) ( not ( = ?auto_65422 ?auto_65426 ) ) ( not ( = ?auto_65423 ?auto_65424 ) ) ( not ( = ?auto_65423 ?auto_65425 ) ) ( not ( = ?auto_65423 ?auto_65426 ) ) ( not ( = ?auto_65424 ?auto_65425 ) ) ( not ( = ?auto_65424 ?auto_65426 ) ) ( not ( = ?auto_65425 ?auto_65426 ) ) ( ON ?auto_65426 ?auto_65427 ) ( not ( = ?auto_65421 ?auto_65427 ) ) ( not ( = ?auto_65422 ?auto_65427 ) ) ( not ( = ?auto_65423 ?auto_65427 ) ) ( not ( = ?auto_65424 ?auto_65427 ) ) ( not ( = ?auto_65425 ?auto_65427 ) ) ( not ( = ?auto_65426 ?auto_65427 ) ) ( ON ?auto_65425 ?auto_65426 ) ( ON-TABLE ?auto_65427 ) ( ON ?auto_65424 ?auto_65425 ) ( ON ?auto_65423 ?auto_65424 ) ( ON ?auto_65422 ?auto_65423 ) ( CLEAR ?auto_65422 ) ( HOLDING ?auto_65421 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65421 )
      ( MAKE-5PILE ?auto_65421 ?auto_65422 ?auto_65423 ?auto_65424 ?auto_65425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_65428 - BLOCK
      ?auto_65429 - BLOCK
      ?auto_65430 - BLOCK
      ?auto_65431 - BLOCK
      ?auto_65432 - BLOCK
    )
    :vars
    (
      ?auto_65433 - BLOCK
      ?auto_65434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65428 ?auto_65429 ) ) ( not ( = ?auto_65428 ?auto_65430 ) ) ( not ( = ?auto_65428 ?auto_65431 ) ) ( not ( = ?auto_65428 ?auto_65432 ) ) ( not ( = ?auto_65428 ?auto_65433 ) ) ( not ( = ?auto_65429 ?auto_65430 ) ) ( not ( = ?auto_65429 ?auto_65431 ) ) ( not ( = ?auto_65429 ?auto_65432 ) ) ( not ( = ?auto_65429 ?auto_65433 ) ) ( not ( = ?auto_65430 ?auto_65431 ) ) ( not ( = ?auto_65430 ?auto_65432 ) ) ( not ( = ?auto_65430 ?auto_65433 ) ) ( not ( = ?auto_65431 ?auto_65432 ) ) ( not ( = ?auto_65431 ?auto_65433 ) ) ( not ( = ?auto_65432 ?auto_65433 ) ) ( ON ?auto_65433 ?auto_65434 ) ( not ( = ?auto_65428 ?auto_65434 ) ) ( not ( = ?auto_65429 ?auto_65434 ) ) ( not ( = ?auto_65430 ?auto_65434 ) ) ( not ( = ?auto_65431 ?auto_65434 ) ) ( not ( = ?auto_65432 ?auto_65434 ) ) ( not ( = ?auto_65433 ?auto_65434 ) ) ( ON ?auto_65432 ?auto_65433 ) ( ON-TABLE ?auto_65434 ) ( ON ?auto_65431 ?auto_65432 ) ( ON ?auto_65430 ?auto_65431 ) ( ON ?auto_65429 ?auto_65430 ) ( ON ?auto_65428 ?auto_65429 ) ( CLEAR ?auto_65428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65434 ?auto_65433 ?auto_65432 ?auto_65431 ?auto_65430 ?auto_65429 )
      ( MAKE-5PILE ?auto_65428 ?auto_65429 ?auto_65430 ?auto_65431 ?auto_65432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65436 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_65436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65437 - BLOCK
    )
    :vars
    (
      ?auto_65438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65437 ?auto_65438 ) ( CLEAR ?auto_65437 ) ( HAND-EMPTY ) ( not ( = ?auto_65437 ?auto_65438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65437 ?auto_65438 )
      ( MAKE-1PILE ?auto_65437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65439 - BLOCK
    )
    :vars
    (
      ?auto_65440 - BLOCK
      ?auto_65442 - BLOCK
      ?auto_65441 - BLOCK
      ?auto_65444 - BLOCK
      ?auto_65443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65439 ?auto_65440 ) ) ( HOLDING ?auto_65439 ) ( CLEAR ?auto_65440 ) ( ON-TABLE ?auto_65442 ) ( ON ?auto_65441 ?auto_65442 ) ( ON ?auto_65444 ?auto_65441 ) ( ON ?auto_65443 ?auto_65444 ) ( ON ?auto_65440 ?auto_65443 ) ( not ( = ?auto_65442 ?auto_65441 ) ) ( not ( = ?auto_65442 ?auto_65444 ) ) ( not ( = ?auto_65442 ?auto_65443 ) ) ( not ( = ?auto_65442 ?auto_65440 ) ) ( not ( = ?auto_65442 ?auto_65439 ) ) ( not ( = ?auto_65441 ?auto_65444 ) ) ( not ( = ?auto_65441 ?auto_65443 ) ) ( not ( = ?auto_65441 ?auto_65440 ) ) ( not ( = ?auto_65441 ?auto_65439 ) ) ( not ( = ?auto_65444 ?auto_65443 ) ) ( not ( = ?auto_65444 ?auto_65440 ) ) ( not ( = ?auto_65444 ?auto_65439 ) ) ( not ( = ?auto_65443 ?auto_65440 ) ) ( not ( = ?auto_65443 ?auto_65439 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65442 ?auto_65441 ?auto_65444 ?auto_65443 ?auto_65440 ?auto_65439 )
      ( MAKE-1PILE ?auto_65439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65445 - BLOCK
    )
    :vars
    (
      ?auto_65450 - BLOCK
      ?auto_65448 - BLOCK
      ?auto_65449 - BLOCK
      ?auto_65447 - BLOCK
      ?auto_65446 - BLOCK
      ?auto_65451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65445 ?auto_65450 ) ) ( CLEAR ?auto_65450 ) ( ON-TABLE ?auto_65448 ) ( ON ?auto_65449 ?auto_65448 ) ( ON ?auto_65447 ?auto_65449 ) ( ON ?auto_65446 ?auto_65447 ) ( ON ?auto_65450 ?auto_65446 ) ( not ( = ?auto_65448 ?auto_65449 ) ) ( not ( = ?auto_65448 ?auto_65447 ) ) ( not ( = ?auto_65448 ?auto_65446 ) ) ( not ( = ?auto_65448 ?auto_65450 ) ) ( not ( = ?auto_65448 ?auto_65445 ) ) ( not ( = ?auto_65449 ?auto_65447 ) ) ( not ( = ?auto_65449 ?auto_65446 ) ) ( not ( = ?auto_65449 ?auto_65450 ) ) ( not ( = ?auto_65449 ?auto_65445 ) ) ( not ( = ?auto_65447 ?auto_65446 ) ) ( not ( = ?auto_65447 ?auto_65450 ) ) ( not ( = ?auto_65447 ?auto_65445 ) ) ( not ( = ?auto_65446 ?auto_65450 ) ) ( not ( = ?auto_65446 ?auto_65445 ) ) ( ON ?auto_65445 ?auto_65451 ) ( CLEAR ?auto_65445 ) ( HAND-EMPTY ) ( not ( = ?auto_65445 ?auto_65451 ) ) ( not ( = ?auto_65450 ?auto_65451 ) ) ( not ( = ?auto_65448 ?auto_65451 ) ) ( not ( = ?auto_65449 ?auto_65451 ) ) ( not ( = ?auto_65447 ?auto_65451 ) ) ( not ( = ?auto_65446 ?auto_65451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65445 ?auto_65451 )
      ( MAKE-1PILE ?auto_65445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65452 - BLOCK
    )
    :vars
    (
      ?auto_65458 - BLOCK
      ?auto_65454 - BLOCK
      ?auto_65455 - BLOCK
      ?auto_65456 - BLOCK
      ?auto_65457 - BLOCK
      ?auto_65453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65452 ?auto_65458 ) ) ( ON-TABLE ?auto_65454 ) ( ON ?auto_65455 ?auto_65454 ) ( ON ?auto_65456 ?auto_65455 ) ( ON ?auto_65457 ?auto_65456 ) ( not ( = ?auto_65454 ?auto_65455 ) ) ( not ( = ?auto_65454 ?auto_65456 ) ) ( not ( = ?auto_65454 ?auto_65457 ) ) ( not ( = ?auto_65454 ?auto_65458 ) ) ( not ( = ?auto_65454 ?auto_65452 ) ) ( not ( = ?auto_65455 ?auto_65456 ) ) ( not ( = ?auto_65455 ?auto_65457 ) ) ( not ( = ?auto_65455 ?auto_65458 ) ) ( not ( = ?auto_65455 ?auto_65452 ) ) ( not ( = ?auto_65456 ?auto_65457 ) ) ( not ( = ?auto_65456 ?auto_65458 ) ) ( not ( = ?auto_65456 ?auto_65452 ) ) ( not ( = ?auto_65457 ?auto_65458 ) ) ( not ( = ?auto_65457 ?auto_65452 ) ) ( ON ?auto_65452 ?auto_65453 ) ( CLEAR ?auto_65452 ) ( not ( = ?auto_65452 ?auto_65453 ) ) ( not ( = ?auto_65458 ?auto_65453 ) ) ( not ( = ?auto_65454 ?auto_65453 ) ) ( not ( = ?auto_65455 ?auto_65453 ) ) ( not ( = ?auto_65456 ?auto_65453 ) ) ( not ( = ?auto_65457 ?auto_65453 ) ) ( HOLDING ?auto_65458 ) ( CLEAR ?auto_65457 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65454 ?auto_65455 ?auto_65456 ?auto_65457 ?auto_65458 )
      ( MAKE-1PILE ?auto_65452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65459 - BLOCK
    )
    :vars
    (
      ?auto_65461 - BLOCK
      ?auto_65463 - BLOCK
      ?auto_65465 - BLOCK
      ?auto_65464 - BLOCK
      ?auto_65460 - BLOCK
      ?auto_65462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65459 ?auto_65461 ) ) ( ON-TABLE ?auto_65463 ) ( ON ?auto_65465 ?auto_65463 ) ( ON ?auto_65464 ?auto_65465 ) ( ON ?auto_65460 ?auto_65464 ) ( not ( = ?auto_65463 ?auto_65465 ) ) ( not ( = ?auto_65463 ?auto_65464 ) ) ( not ( = ?auto_65463 ?auto_65460 ) ) ( not ( = ?auto_65463 ?auto_65461 ) ) ( not ( = ?auto_65463 ?auto_65459 ) ) ( not ( = ?auto_65465 ?auto_65464 ) ) ( not ( = ?auto_65465 ?auto_65460 ) ) ( not ( = ?auto_65465 ?auto_65461 ) ) ( not ( = ?auto_65465 ?auto_65459 ) ) ( not ( = ?auto_65464 ?auto_65460 ) ) ( not ( = ?auto_65464 ?auto_65461 ) ) ( not ( = ?auto_65464 ?auto_65459 ) ) ( not ( = ?auto_65460 ?auto_65461 ) ) ( not ( = ?auto_65460 ?auto_65459 ) ) ( ON ?auto_65459 ?auto_65462 ) ( not ( = ?auto_65459 ?auto_65462 ) ) ( not ( = ?auto_65461 ?auto_65462 ) ) ( not ( = ?auto_65463 ?auto_65462 ) ) ( not ( = ?auto_65465 ?auto_65462 ) ) ( not ( = ?auto_65464 ?auto_65462 ) ) ( not ( = ?auto_65460 ?auto_65462 ) ) ( CLEAR ?auto_65460 ) ( ON ?auto_65461 ?auto_65459 ) ( CLEAR ?auto_65461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65462 ?auto_65459 )
      ( MAKE-1PILE ?auto_65459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65466 - BLOCK
    )
    :vars
    (
      ?auto_65468 - BLOCK
      ?auto_65467 - BLOCK
      ?auto_65471 - BLOCK
      ?auto_65469 - BLOCK
      ?auto_65470 - BLOCK
      ?auto_65472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65466 ?auto_65468 ) ) ( ON-TABLE ?auto_65467 ) ( ON ?auto_65471 ?auto_65467 ) ( ON ?auto_65469 ?auto_65471 ) ( not ( = ?auto_65467 ?auto_65471 ) ) ( not ( = ?auto_65467 ?auto_65469 ) ) ( not ( = ?auto_65467 ?auto_65470 ) ) ( not ( = ?auto_65467 ?auto_65468 ) ) ( not ( = ?auto_65467 ?auto_65466 ) ) ( not ( = ?auto_65471 ?auto_65469 ) ) ( not ( = ?auto_65471 ?auto_65470 ) ) ( not ( = ?auto_65471 ?auto_65468 ) ) ( not ( = ?auto_65471 ?auto_65466 ) ) ( not ( = ?auto_65469 ?auto_65470 ) ) ( not ( = ?auto_65469 ?auto_65468 ) ) ( not ( = ?auto_65469 ?auto_65466 ) ) ( not ( = ?auto_65470 ?auto_65468 ) ) ( not ( = ?auto_65470 ?auto_65466 ) ) ( ON ?auto_65466 ?auto_65472 ) ( not ( = ?auto_65466 ?auto_65472 ) ) ( not ( = ?auto_65468 ?auto_65472 ) ) ( not ( = ?auto_65467 ?auto_65472 ) ) ( not ( = ?auto_65471 ?auto_65472 ) ) ( not ( = ?auto_65469 ?auto_65472 ) ) ( not ( = ?auto_65470 ?auto_65472 ) ) ( ON ?auto_65468 ?auto_65466 ) ( CLEAR ?auto_65468 ) ( ON-TABLE ?auto_65472 ) ( HOLDING ?auto_65470 ) ( CLEAR ?auto_65469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65467 ?auto_65471 ?auto_65469 ?auto_65470 )
      ( MAKE-1PILE ?auto_65466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65473 - BLOCK
    )
    :vars
    (
      ?auto_65475 - BLOCK
      ?auto_65476 - BLOCK
      ?auto_65479 - BLOCK
      ?auto_65477 - BLOCK
      ?auto_65474 - BLOCK
      ?auto_65478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65473 ?auto_65475 ) ) ( ON-TABLE ?auto_65476 ) ( ON ?auto_65479 ?auto_65476 ) ( ON ?auto_65477 ?auto_65479 ) ( not ( = ?auto_65476 ?auto_65479 ) ) ( not ( = ?auto_65476 ?auto_65477 ) ) ( not ( = ?auto_65476 ?auto_65474 ) ) ( not ( = ?auto_65476 ?auto_65475 ) ) ( not ( = ?auto_65476 ?auto_65473 ) ) ( not ( = ?auto_65479 ?auto_65477 ) ) ( not ( = ?auto_65479 ?auto_65474 ) ) ( not ( = ?auto_65479 ?auto_65475 ) ) ( not ( = ?auto_65479 ?auto_65473 ) ) ( not ( = ?auto_65477 ?auto_65474 ) ) ( not ( = ?auto_65477 ?auto_65475 ) ) ( not ( = ?auto_65477 ?auto_65473 ) ) ( not ( = ?auto_65474 ?auto_65475 ) ) ( not ( = ?auto_65474 ?auto_65473 ) ) ( ON ?auto_65473 ?auto_65478 ) ( not ( = ?auto_65473 ?auto_65478 ) ) ( not ( = ?auto_65475 ?auto_65478 ) ) ( not ( = ?auto_65476 ?auto_65478 ) ) ( not ( = ?auto_65479 ?auto_65478 ) ) ( not ( = ?auto_65477 ?auto_65478 ) ) ( not ( = ?auto_65474 ?auto_65478 ) ) ( ON ?auto_65475 ?auto_65473 ) ( ON-TABLE ?auto_65478 ) ( CLEAR ?auto_65477 ) ( ON ?auto_65474 ?auto_65475 ) ( CLEAR ?auto_65474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65478 ?auto_65473 ?auto_65475 )
      ( MAKE-1PILE ?auto_65473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65480 - BLOCK
    )
    :vars
    (
      ?auto_65485 - BLOCK
      ?auto_65481 - BLOCK
      ?auto_65484 - BLOCK
      ?auto_65482 - BLOCK
      ?auto_65483 - BLOCK
      ?auto_65486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65480 ?auto_65485 ) ) ( ON-TABLE ?auto_65481 ) ( ON ?auto_65484 ?auto_65481 ) ( not ( = ?auto_65481 ?auto_65484 ) ) ( not ( = ?auto_65481 ?auto_65482 ) ) ( not ( = ?auto_65481 ?auto_65483 ) ) ( not ( = ?auto_65481 ?auto_65485 ) ) ( not ( = ?auto_65481 ?auto_65480 ) ) ( not ( = ?auto_65484 ?auto_65482 ) ) ( not ( = ?auto_65484 ?auto_65483 ) ) ( not ( = ?auto_65484 ?auto_65485 ) ) ( not ( = ?auto_65484 ?auto_65480 ) ) ( not ( = ?auto_65482 ?auto_65483 ) ) ( not ( = ?auto_65482 ?auto_65485 ) ) ( not ( = ?auto_65482 ?auto_65480 ) ) ( not ( = ?auto_65483 ?auto_65485 ) ) ( not ( = ?auto_65483 ?auto_65480 ) ) ( ON ?auto_65480 ?auto_65486 ) ( not ( = ?auto_65480 ?auto_65486 ) ) ( not ( = ?auto_65485 ?auto_65486 ) ) ( not ( = ?auto_65481 ?auto_65486 ) ) ( not ( = ?auto_65484 ?auto_65486 ) ) ( not ( = ?auto_65482 ?auto_65486 ) ) ( not ( = ?auto_65483 ?auto_65486 ) ) ( ON ?auto_65485 ?auto_65480 ) ( ON-TABLE ?auto_65486 ) ( ON ?auto_65483 ?auto_65485 ) ( CLEAR ?auto_65483 ) ( HOLDING ?auto_65482 ) ( CLEAR ?auto_65484 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65481 ?auto_65484 ?auto_65482 )
      ( MAKE-1PILE ?auto_65480 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65487 - BLOCK
    )
    :vars
    (
      ?auto_65489 - BLOCK
      ?auto_65488 - BLOCK
      ?auto_65491 - BLOCK
      ?auto_65492 - BLOCK
      ?auto_65490 - BLOCK
      ?auto_65493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65487 ?auto_65489 ) ) ( ON-TABLE ?auto_65488 ) ( ON ?auto_65491 ?auto_65488 ) ( not ( = ?auto_65488 ?auto_65491 ) ) ( not ( = ?auto_65488 ?auto_65492 ) ) ( not ( = ?auto_65488 ?auto_65490 ) ) ( not ( = ?auto_65488 ?auto_65489 ) ) ( not ( = ?auto_65488 ?auto_65487 ) ) ( not ( = ?auto_65491 ?auto_65492 ) ) ( not ( = ?auto_65491 ?auto_65490 ) ) ( not ( = ?auto_65491 ?auto_65489 ) ) ( not ( = ?auto_65491 ?auto_65487 ) ) ( not ( = ?auto_65492 ?auto_65490 ) ) ( not ( = ?auto_65492 ?auto_65489 ) ) ( not ( = ?auto_65492 ?auto_65487 ) ) ( not ( = ?auto_65490 ?auto_65489 ) ) ( not ( = ?auto_65490 ?auto_65487 ) ) ( ON ?auto_65487 ?auto_65493 ) ( not ( = ?auto_65487 ?auto_65493 ) ) ( not ( = ?auto_65489 ?auto_65493 ) ) ( not ( = ?auto_65488 ?auto_65493 ) ) ( not ( = ?auto_65491 ?auto_65493 ) ) ( not ( = ?auto_65492 ?auto_65493 ) ) ( not ( = ?auto_65490 ?auto_65493 ) ) ( ON ?auto_65489 ?auto_65487 ) ( ON-TABLE ?auto_65493 ) ( ON ?auto_65490 ?auto_65489 ) ( CLEAR ?auto_65491 ) ( ON ?auto_65492 ?auto_65490 ) ( CLEAR ?auto_65492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65493 ?auto_65487 ?auto_65489 ?auto_65490 )
      ( MAKE-1PILE ?auto_65487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65494 - BLOCK
    )
    :vars
    (
      ?auto_65497 - BLOCK
      ?auto_65495 - BLOCK
      ?auto_65500 - BLOCK
      ?auto_65496 - BLOCK
      ?auto_65498 - BLOCK
      ?auto_65499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65494 ?auto_65497 ) ) ( ON-TABLE ?auto_65495 ) ( not ( = ?auto_65495 ?auto_65500 ) ) ( not ( = ?auto_65495 ?auto_65496 ) ) ( not ( = ?auto_65495 ?auto_65498 ) ) ( not ( = ?auto_65495 ?auto_65497 ) ) ( not ( = ?auto_65495 ?auto_65494 ) ) ( not ( = ?auto_65500 ?auto_65496 ) ) ( not ( = ?auto_65500 ?auto_65498 ) ) ( not ( = ?auto_65500 ?auto_65497 ) ) ( not ( = ?auto_65500 ?auto_65494 ) ) ( not ( = ?auto_65496 ?auto_65498 ) ) ( not ( = ?auto_65496 ?auto_65497 ) ) ( not ( = ?auto_65496 ?auto_65494 ) ) ( not ( = ?auto_65498 ?auto_65497 ) ) ( not ( = ?auto_65498 ?auto_65494 ) ) ( ON ?auto_65494 ?auto_65499 ) ( not ( = ?auto_65494 ?auto_65499 ) ) ( not ( = ?auto_65497 ?auto_65499 ) ) ( not ( = ?auto_65495 ?auto_65499 ) ) ( not ( = ?auto_65500 ?auto_65499 ) ) ( not ( = ?auto_65496 ?auto_65499 ) ) ( not ( = ?auto_65498 ?auto_65499 ) ) ( ON ?auto_65497 ?auto_65494 ) ( ON-TABLE ?auto_65499 ) ( ON ?auto_65498 ?auto_65497 ) ( ON ?auto_65496 ?auto_65498 ) ( CLEAR ?auto_65496 ) ( HOLDING ?auto_65500 ) ( CLEAR ?auto_65495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65495 ?auto_65500 )
      ( MAKE-1PILE ?auto_65494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65501 - BLOCK
    )
    :vars
    (
      ?auto_65507 - BLOCK
      ?auto_65505 - BLOCK
      ?auto_65504 - BLOCK
      ?auto_65503 - BLOCK
      ?auto_65502 - BLOCK
      ?auto_65506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65501 ?auto_65507 ) ) ( ON-TABLE ?auto_65505 ) ( not ( = ?auto_65505 ?auto_65504 ) ) ( not ( = ?auto_65505 ?auto_65503 ) ) ( not ( = ?auto_65505 ?auto_65502 ) ) ( not ( = ?auto_65505 ?auto_65507 ) ) ( not ( = ?auto_65505 ?auto_65501 ) ) ( not ( = ?auto_65504 ?auto_65503 ) ) ( not ( = ?auto_65504 ?auto_65502 ) ) ( not ( = ?auto_65504 ?auto_65507 ) ) ( not ( = ?auto_65504 ?auto_65501 ) ) ( not ( = ?auto_65503 ?auto_65502 ) ) ( not ( = ?auto_65503 ?auto_65507 ) ) ( not ( = ?auto_65503 ?auto_65501 ) ) ( not ( = ?auto_65502 ?auto_65507 ) ) ( not ( = ?auto_65502 ?auto_65501 ) ) ( ON ?auto_65501 ?auto_65506 ) ( not ( = ?auto_65501 ?auto_65506 ) ) ( not ( = ?auto_65507 ?auto_65506 ) ) ( not ( = ?auto_65505 ?auto_65506 ) ) ( not ( = ?auto_65504 ?auto_65506 ) ) ( not ( = ?auto_65503 ?auto_65506 ) ) ( not ( = ?auto_65502 ?auto_65506 ) ) ( ON ?auto_65507 ?auto_65501 ) ( ON-TABLE ?auto_65506 ) ( ON ?auto_65502 ?auto_65507 ) ( ON ?auto_65503 ?auto_65502 ) ( CLEAR ?auto_65505 ) ( ON ?auto_65504 ?auto_65503 ) ( CLEAR ?auto_65504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65506 ?auto_65501 ?auto_65507 ?auto_65502 ?auto_65503 )
      ( MAKE-1PILE ?auto_65501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65508 - BLOCK
    )
    :vars
    (
      ?auto_65511 - BLOCK
      ?auto_65514 - BLOCK
      ?auto_65513 - BLOCK
      ?auto_65512 - BLOCK
      ?auto_65510 - BLOCK
      ?auto_65509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65508 ?auto_65511 ) ) ( not ( = ?auto_65514 ?auto_65513 ) ) ( not ( = ?auto_65514 ?auto_65512 ) ) ( not ( = ?auto_65514 ?auto_65510 ) ) ( not ( = ?auto_65514 ?auto_65511 ) ) ( not ( = ?auto_65514 ?auto_65508 ) ) ( not ( = ?auto_65513 ?auto_65512 ) ) ( not ( = ?auto_65513 ?auto_65510 ) ) ( not ( = ?auto_65513 ?auto_65511 ) ) ( not ( = ?auto_65513 ?auto_65508 ) ) ( not ( = ?auto_65512 ?auto_65510 ) ) ( not ( = ?auto_65512 ?auto_65511 ) ) ( not ( = ?auto_65512 ?auto_65508 ) ) ( not ( = ?auto_65510 ?auto_65511 ) ) ( not ( = ?auto_65510 ?auto_65508 ) ) ( ON ?auto_65508 ?auto_65509 ) ( not ( = ?auto_65508 ?auto_65509 ) ) ( not ( = ?auto_65511 ?auto_65509 ) ) ( not ( = ?auto_65514 ?auto_65509 ) ) ( not ( = ?auto_65513 ?auto_65509 ) ) ( not ( = ?auto_65512 ?auto_65509 ) ) ( not ( = ?auto_65510 ?auto_65509 ) ) ( ON ?auto_65511 ?auto_65508 ) ( ON-TABLE ?auto_65509 ) ( ON ?auto_65510 ?auto_65511 ) ( ON ?auto_65512 ?auto_65510 ) ( ON ?auto_65513 ?auto_65512 ) ( CLEAR ?auto_65513 ) ( HOLDING ?auto_65514 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65514 )
      ( MAKE-1PILE ?auto_65508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_65515 - BLOCK
    )
    :vars
    (
      ?auto_65520 - BLOCK
      ?auto_65518 - BLOCK
      ?auto_65517 - BLOCK
      ?auto_65519 - BLOCK
      ?auto_65521 - BLOCK
      ?auto_65516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65515 ?auto_65520 ) ) ( not ( = ?auto_65518 ?auto_65517 ) ) ( not ( = ?auto_65518 ?auto_65519 ) ) ( not ( = ?auto_65518 ?auto_65521 ) ) ( not ( = ?auto_65518 ?auto_65520 ) ) ( not ( = ?auto_65518 ?auto_65515 ) ) ( not ( = ?auto_65517 ?auto_65519 ) ) ( not ( = ?auto_65517 ?auto_65521 ) ) ( not ( = ?auto_65517 ?auto_65520 ) ) ( not ( = ?auto_65517 ?auto_65515 ) ) ( not ( = ?auto_65519 ?auto_65521 ) ) ( not ( = ?auto_65519 ?auto_65520 ) ) ( not ( = ?auto_65519 ?auto_65515 ) ) ( not ( = ?auto_65521 ?auto_65520 ) ) ( not ( = ?auto_65521 ?auto_65515 ) ) ( ON ?auto_65515 ?auto_65516 ) ( not ( = ?auto_65515 ?auto_65516 ) ) ( not ( = ?auto_65520 ?auto_65516 ) ) ( not ( = ?auto_65518 ?auto_65516 ) ) ( not ( = ?auto_65517 ?auto_65516 ) ) ( not ( = ?auto_65519 ?auto_65516 ) ) ( not ( = ?auto_65521 ?auto_65516 ) ) ( ON ?auto_65520 ?auto_65515 ) ( ON-TABLE ?auto_65516 ) ( ON ?auto_65521 ?auto_65520 ) ( ON ?auto_65519 ?auto_65521 ) ( ON ?auto_65517 ?auto_65519 ) ( ON ?auto_65518 ?auto_65517 ) ( CLEAR ?auto_65518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65516 ?auto_65515 ?auto_65520 ?auto_65521 ?auto_65519 ?auto_65517 )
      ( MAKE-1PILE ?auto_65515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65526 - BLOCK
      ?auto_65527 - BLOCK
      ?auto_65528 - BLOCK
      ?auto_65529 - BLOCK
    )
    :vars
    (
      ?auto_65530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65530 ?auto_65529 ) ( CLEAR ?auto_65530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65526 ) ( ON ?auto_65527 ?auto_65526 ) ( ON ?auto_65528 ?auto_65527 ) ( ON ?auto_65529 ?auto_65528 ) ( not ( = ?auto_65526 ?auto_65527 ) ) ( not ( = ?auto_65526 ?auto_65528 ) ) ( not ( = ?auto_65526 ?auto_65529 ) ) ( not ( = ?auto_65526 ?auto_65530 ) ) ( not ( = ?auto_65527 ?auto_65528 ) ) ( not ( = ?auto_65527 ?auto_65529 ) ) ( not ( = ?auto_65527 ?auto_65530 ) ) ( not ( = ?auto_65528 ?auto_65529 ) ) ( not ( = ?auto_65528 ?auto_65530 ) ) ( not ( = ?auto_65529 ?auto_65530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65530 ?auto_65529 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65531 - BLOCK
      ?auto_65532 - BLOCK
      ?auto_65533 - BLOCK
      ?auto_65534 - BLOCK
    )
    :vars
    (
      ?auto_65535 - BLOCK
      ?auto_65536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65535 ?auto_65534 ) ( CLEAR ?auto_65535 ) ( ON-TABLE ?auto_65531 ) ( ON ?auto_65532 ?auto_65531 ) ( ON ?auto_65533 ?auto_65532 ) ( ON ?auto_65534 ?auto_65533 ) ( not ( = ?auto_65531 ?auto_65532 ) ) ( not ( = ?auto_65531 ?auto_65533 ) ) ( not ( = ?auto_65531 ?auto_65534 ) ) ( not ( = ?auto_65531 ?auto_65535 ) ) ( not ( = ?auto_65532 ?auto_65533 ) ) ( not ( = ?auto_65532 ?auto_65534 ) ) ( not ( = ?auto_65532 ?auto_65535 ) ) ( not ( = ?auto_65533 ?auto_65534 ) ) ( not ( = ?auto_65533 ?auto_65535 ) ) ( not ( = ?auto_65534 ?auto_65535 ) ) ( HOLDING ?auto_65536 ) ( not ( = ?auto_65531 ?auto_65536 ) ) ( not ( = ?auto_65532 ?auto_65536 ) ) ( not ( = ?auto_65533 ?auto_65536 ) ) ( not ( = ?auto_65534 ?auto_65536 ) ) ( not ( = ?auto_65535 ?auto_65536 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_65536 )
      ( MAKE-4PILE ?auto_65531 ?auto_65532 ?auto_65533 ?auto_65534 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65537 - BLOCK
      ?auto_65538 - BLOCK
      ?auto_65539 - BLOCK
      ?auto_65540 - BLOCK
    )
    :vars
    (
      ?auto_65542 - BLOCK
      ?auto_65541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65542 ?auto_65540 ) ( ON-TABLE ?auto_65537 ) ( ON ?auto_65538 ?auto_65537 ) ( ON ?auto_65539 ?auto_65538 ) ( ON ?auto_65540 ?auto_65539 ) ( not ( = ?auto_65537 ?auto_65538 ) ) ( not ( = ?auto_65537 ?auto_65539 ) ) ( not ( = ?auto_65537 ?auto_65540 ) ) ( not ( = ?auto_65537 ?auto_65542 ) ) ( not ( = ?auto_65538 ?auto_65539 ) ) ( not ( = ?auto_65538 ?auto_65540 ) ) ( not ( = ?auto_65538 ?auto_65542 ) ) ( not ( = ?auto_65539 ?auto_65540 ) ) ( not ( = ?auto_65539 ?auto_65542 ) ) ( not ( = ?auto_65540 ?auto_65542 ) ) ( not ( = ?auto_65537 ?auto_65541 ) ) ( not ( = ?auto_65538 ?auto_65541 ) ) ( not ( = ?auto_65539 ?auto_65541 ) ) ( not ( = ?auto_65540 ?auto_65541 ) ) ( not ( = ?auto_65542 ?auto_65541 ) ) ( ON ?auto_65541 ?auto_65542 ) ( CLEAR ?auto_65541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65537 ?auto_65538 ?auto_65539 ?auto_65540 ?auto_65542 )
      ( MAKE-4PILE ?auto_65537 ?auto_65538 ?auto_65539 ?auto_65540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65543 - BLOCK
      ?auto_65544 - BLOCK
      ?auto_65545 - BLOCK
      ?auto_65546 - BLOCK
    )
    :vars
    (
      ?auto_65547 - BLOCK
      ?auto_65548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65547 ?auto_65546 ) ( ON-TABLE ?auto_65543 ) ( ON ?auto_65544 ?auto_65543 ) ( ON ?auto_65545 ?auto_65544 ) ( ON ?auto_65546 ?auto_65545 ) ( not ( = ?auto_65543 ?auto_65544 ) ) ( not ( = ?auto_65543 ?auto_65545 ) ) ( not ( = ?auto_65543 ?auto_65546 ) ) ( not ( = ?auto_65543 ?auto_65547 ) ) ( not ( = ?auto_65544 ?auto_65545 ) ) ( not ( = ?auto_65544 ?auto_65546 ) ) ( not ( = ?auto_65544 ?auto_65547 ) ) ( not ( = ?auto_65545 ?auto_65546 ) ) ( not ( = ?auto_65545 ?auto_65547 ) ) ( not ( = ?auto_65546 ?auto_65547 ) ) ( not ( = ?auto_65543 ?auto_65548 ) ) ( not ( = ?auto_65544 ?auto_65548 ) ) ( not ( = ?auto_65545 ?auto_65548 ) ) ( not ( = ?auto_65546 ?auto_65548 ) ) ( not ( = ?auto_65547 ?auto_65548 ) ) ( HOLDING ?auto_65548 ) ( CLEAR ?auto_65547 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65543 ?auto_65544 ?auto_65545 ?auto_65546 ?auto_65547 ?auto_65548 )
      ( MAKE-4PILE ?auto_65543 ?auto_65544 ?auto_65545 ?auto_65546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65549 - BLOCK
      ?auto_65550 - BLOCK
      ?auto_65551 - BLOCK
      ?auto_65552 - BLOCK
    )
    :vars
    (
      ?auto_65553 - BLOCK
      ?auto_65554 - BLOCK
      ?auto_65555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65553 ?auto_65552 ) ( ON-TABLE ?auto_65549 ) ( ON ?auto_65550 ?auto_65549 ) ( ON ?auto_65551 ?auto_65550 ) ( ON ?auto_65552 ?auto_65551 ) ( not ( = ?auto_65549 ?auto_65550 ) ) ( not ( = ?auto_65549 ?auto_65551 ) ) ( not ( = ?auto_65549 ?auto_65552 ) ) ( not ( = ?auto_65549 ?auto_65553 ) ) ( not ( = ?auto_65550 ?auto_65551 ) ) ( not ( = ?auto_65550 ?auto_65552 ) ) ( not ( = ?auto_65550 ?auto_65553 ) ) ( not ( = ?auto_65551 ?auto_65552 ) ) ( not ( = ?auto_65551 ?auto_65553 ) ) ( not ( = ?auto_65552 ?auto_65553 ) ) ( not ( = ?auto_65549 ?auto_65554 ) ) ( not ( = ?auto_65550 ?auto_65554 ) ) ( not ( = ?auto_65551 ?auto_65554 ) ) ( not ( = ?auto_65552 ?auto_65554 ) ) ( not ( = ?auto_65553 ?auto_65554 ) ) ( CLEAR ?auto_65553 ) ( ON ?auto_65554 ?auto_65555 ) ( CLEAR ?auto_65554 ) ( HAND-EMPTY ) ( not ( = ?auto_65549 ?auto_65555 ) ) ( not ( = ?auto_65550 ?auto_65555 ) ) ( not ( = ?auto_65551 ?auto_65555 ) ) ( not ( = ?auto_65552 ?auto_65555 ) ) ( not ( = ?auto_65553 ?auto_65555 ) ) ( not ( = ?auto_65554 ?auto_65555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65554 ?auto_65555 )
      ( MAKE-4PILE ?auto_65549 ?auto_65550 ?auto_65551 ?auto_65552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65570 - BLOCK
      ?auto_65571 - BLOCK
      ?auto_65572 - BLOCK
      ?auto_65573 - BLOCK
    )
    :vars
    (
      ?auto_65576 - BLOCK
      ?auto_65575 - BLOCK
      ?auto_65574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65570 ) ( ON ?auto_65571 ?auto_65570 ) ( ON ?auto_65572 ?auto_65571 ) ( not ( = ?auto_65570 ?auto_65571 ) ) ( not ( = ?auto_65570 ?auto_65572 ) ) ( not ( = ?auto_65570 ?auto_65573 ) ) ( not ( = ?auto_65570 ?auto_65576 ) ) ( not ( = ?auto_65571 ?auto_65572 ) ) ( not ( = ?auto_65571 ?auto_65573 ) ) ( not ( = ?auto_65571 ?auto_65576 ) ) ( not ( = ?auto_65572 ?auto_65573 ) ) ( not ( = ?auto_65572 ?auto_65576 ) ) ( not ( = ?auto_65573 ?auto_65576 ) ) ( not ( = ?auto_65570 ?auto_65575 ) ) ( not ( = ?auto_65571 ?auto_65575 ) ) ( not ( = ?auto_65572 ?auto_65575 ) ) ( not ( = ?auto_65573 ?auto_65575 ) ) ( not ( = ?auto_65576 ?auto_65575 ) ) ( ON ?auto_65575 ?auto_65574 ) ( not ( = ?auto_65570 ?auto_65574 ) ) ( not ( = ?auto_65571 ?auto_65574 ) ) ( not ( = ?auto_65572 ?auto_65574 ) ) ( not ( = ?auto_65573 ?auto_65574 ) ) ( not ( = ?auto_65576 ?auto_65574 ) ) ( not ( = ?auto_65575 ?auto_65574 ) ) ( ON ?auto_65576 ?auto_65575 ) ( CLEAR ?auto_65576 ) ( HOLDING ?auto_65573 ) ( CLEAR ?auto_65572 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65570 ?auto_65571 ?auto_65572 ?auto_65573 ?auto_65576 )
      ( MAKE-4PILE ?auto_65570 ?auto_65571 ?auto_65572 ?auto_65573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65577 - BLOCK
      ?auto_65578 - BLOCK
      ?auto_65579 - BLOCK
      ?auto_65580 - BLOCK
    )
    :vars
    (
      ?auto_65583 - BLOCK
      ?auto_65582 - BLOCK
      ?auto_65581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65577 ) ( ON ?auto_65578 ?auto_65577 ) ( ON ?auto_65579 ?auto_65578 ) ( not ( = ?auto_65577 ?auto_65578 ) ) ( not ( = ?auto_65577 ?auto_65579 ) ) ( not ( = ?auto_65577 ?auto_65580 ) ) ( not ( = ?auto_65577 ?auto_65583 ) ) ( not ( = ?auto_65578 ?auto_65579 ) ) ( not ( = ?auto_65578 ?auto_65580 ) ) ( not ( = ?auto_65578 ?auto_65583 ) ) ( not ( = ?auto_65579 ?auto_65580 ) ) ( not ( = ?auto_65579 ?auto_65583 ) ) ( not ( = ?auto_65580 ?auto_65583 ) ) ( not ( = ?auto_65577 ?auto_65582 ) ) ( not ( = ?auto_65578 ?auto_65582 ) ) ( not ( = ?auto_65579 ?auto_65582 ) ) ( not ( = ?auto_65580 ?auto_65582 ) ) ( not ( = ?auto_65583 ?auto_65582 ) ) ( ON ?auto_65582 ?auto_65581 ) ( not ( = ?auto_65577 ?auto_65581 ) ) ( not ( = ?auto_65578 ?auto_65581 ) ) ( not ( = ?auto_65579 ?auto_65581 ) ) ( not ( = ?auto_65580 ?auto_65581 ) ) ( not ( = ?auto_65583 ?auto_65581 ) ) ( not ( = ?auto_65582 ?auto_65581 ) ) ( ON ?auto_65583 ?auto_65582 ) ( CLEAR ?auto_65579 ) ( ON ?auto_65580 ?auto_65583 ) ( CLEAR ?auto_65580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65581 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65581 ?auto_65582 ?auto_65583 )
      ( MAKE-4PILE ?auto_65577 ?auto_65578 ?auto_65579 ?auto_65580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65584 - BLOCK
      ?auto_65585 - BLOCK
      ?auto_65586 - BLOCK
      ?auto_65587 - BLOCK
    )
    :vars
    (
      ?auto_65590 - BLOCK
      ?auto_65588 - BLOCK
      ?auto_65589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65584 ) ( ON ?auto_65585 ?auto_65584 ) ( not ( = ?auto_65584 ?auto_65585 ) ) ( not ( = ?auto_65584 ?auto_65586 ) ) ( not ( = ?auto_65584 ?auto_65587 ) ) ( not ( = ?auto_65584 ?auto_65590 ) ) ( not ( = ?auto_65585 ?auto_65586 ) ) ( not ( = ?auto_65585 ?auto_65587 ) ) ( not ( = ?auto_65585 ?auto_65590 ) ) ( not ( = ?auto_65586 ?auto_65587 ) ) ( not ( = ?auto_65586 ?auto_65590 ) ) ( not ( = ?auto_65587 ?auto_65590 ) ) ( not ( = ?auto_65584 ?auto_65588 ) ) ( not ( = ?auto_65585 ?auto_65588 ) ) ( not ( = ?auto_65586 ?auto_65588 ) ) ( not ( = ?auto_65587 ?auto_65588 ) ) ( not ( = ?auto_65590 ?auto_65588 ) ) ( ON ?auto_65588 ?auto_65589 ) ( not ( = ?auto_65584 ?auto_65589 ) ) ( not ( = ?auto_65585 ?auto_65589 ) ) ( not ( = ?auto_65586 ?auto_65589 ) ) ( not ( = ?auto_65587 ?auto_65589 ) ) ( not ( = ?auto_65590 ?auto_65589 ) ) ( not ( = ?auto_65588 ?auto_65589 ) ) ( ON ?auto_65590 ?auto_65588 ) ( ON ?auto_65587 ?auto_65590 ) ( CLEAR ?auto_65587 ) ( ON-TABLE ?auto_65589 ) ( HOLDING ?auto_65586 ) ( CLEAR ?auto_65585 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65584 ?auto_65585 ?auto_65586 )
      ( MAKE-4PILE ?auto_65584 ?auto_65585 ?auto_65586 ?auto_65587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65591 - BLOCK
      ?auto_65592 - BLOCK
      ?auto_65593 - BLOCK
      ?auto_65594 - BLOCK
    )
    :vars
    (
      ?auto_65595 - BLOCK
      ?auto_65597 - BLOCK
      ?auto_65596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65591 ) ( ON ?auto_65592 ?auto_65591 ) ( not ( = ?auto_65591 ?auto_65592 ) ) ( not ( = ?auto_65591 ?auto_65593 ) ) ( not ( = ?auto_65591 ?auto_65594 ) ) ( not ( = ?auto_65591 ?auto_65595 ) ) ( not ( = ?auto_65592 ?auto_65593 ) ) ( not ( = ?auto_65592 ?auto_65594 ) ) ( not ( = ?auto_65592 ?auto_65595 ) ) ( not ( = ?auto_65593 ?auto_65594 ) ) ( not ( = ?auto_65593 ?auto_65595 ) ) ( not ( = ?auto_65594 ?auto_65595 ) ) ( not ( = ?auto_65591 ?auto_65597 ) ) ( not ( = ?auto_65592 ?auto_65597 ) ) ( not ( = ?auto_65593 ?auto_65597 ) ) ( not ( = ?auto_65594 ?auto_65597 ) ) ( not ( = ?auto_65595 ?auto_65597 ) ) ( ON ?auto_65597 ?auto_65596 ) ( not ( = ?auto_65591 ?auto_65596 ) ) ( not ( = ?auto_65592 ?auto_65596 ) ) ( not ( = ?auto_65593 ?auto_65596 ) ) ( not ( = ?auto_65594 ?auto_65596 ) ) ( not ( = ?auto_65595 ?auto_65596 ) ) ( not ( = ?auto_65597 ?auto_65596 ) ) ( ON ?auto_65595 ?auto_65597 ) ( ON ?auto_65594 ?auto_65595 ) ( ON-TABLE ?auto_65596 ) ( CLEAR ?auto_65592 ) ( ON ?auto_65593 ?auto_65594 ) ( CLEAR ?auto_65593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65596 ?auto_65597 ?auto_65595 ?auto_65594 )
      ( MAKE-4PILE ?auto_65591 ?auto_65592 ?auto_65593 ?auto_65594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65598 - BLOCK
      ?auto_65599 - BLOCK
      ?auto_65600 - BLOCK
      ?auto_65601 - BLOCK
    )
    :vars
    (
      ?auto_65602 - BLOCK
      ?auto_65603 - BLOCK
      ?auto_65604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65598 ) ( not ( = ?auto_65598 ?auto_65599 ) ) ( not ( = ?auto_65598 ?auto_65600 ) ) ( not ( = ?auto_65598 ?auto_65601 ) ) ( not ( = ?auto_65598 ?auto_65602 ) ) ( not ( = ?auto_65599 ?auto_65600 ) ) ( not ( = ?auto_65599 ?auto_65601 ) ) ( not ( = ?auto_65599 ?auto_65602 ) ) ( not ( = ?auto_65600 ?auto_65601 ) ) ( not ( = ?auto_65600 ?auto_65602 ) ) ( not ( = ?auto_65601 ?auto_65602 ) ) ( not ( = ?auto_65598 ?auto_65603 ) ) ( not ( = ?auto_65599 ?auto_65603 ) ) ( not ( = ?auto_65600 ?auto_65603 ) ) ( not ( = ?auto_65601 ?auto_65603 ) ) ( not ( = ?auto_65602 ?auto_65603 ) ) ( ON ?auto_65603 ?auto_65604 ) ( not ( = ?auto_65598 ?auto_65604 ) ) ( not ( = ?auto_65599 ?auto_65604 ) ) ( not ( = ?auto_65600 ?auto_65604 ) ) ( not ( = ?auto_65601 ?auto_65604 ) ) ( not ( = ?auto_65602 ?auto_65604 ) ) ( not ( = ?auto_65603 ?auto_65604 ) ) ( ON ?auto_65602 ?auto_65603 ) ( ON ?auto_65601 ?auto_65602 ) ( ON-TABLE ?auto_65604 ) ( ON ?auto_65600 ?auto_65601 ) ( CLEAR ?auto_65600 ) ( HOLDING ?auto_65599 ) ( CLEAR ?auto_65598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65598 ?auto_65599 )
      ( MAKE-4PILE ?auto_65598 ?auto_65599 ?auto_65600 ?auto_65601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65605 - BLOCK
      ?auto_65606 - BLOCK
      ?auto_65607 - BLOCK
      ?auto_65608 - BLOCK
    )
    :vars
    (
      ?auto_65609 - BLOCK
      ?auto_65611 - BLOCK
      ?auto_65610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65605 ) ( not ( = ?auto_65605 ?auto_65606 ) ) ( not ( = ?auto_65605 ?auto_65607 ) ) ( not ( = ?auto_65605 ?auto_65608 ) ) ( not ( = ?auto_65605 ?auto_65609 ) ) ( not ( = ?auto_65606 ?auto_65607 ) ) ( not ( = ?auto_65606 ?auto_65608 ) ) ( not ( = ?auto_65606 ?auto_65609 ) ) ( not ( = ?auto_65607 ?auto_65608 ) ) ( not ( = ?auto_65607 ?auto_65609 ) ) ( not ( = ?auto_65608 ?auto_65609 ) ) ( not ( = ?auto_65605 ?auto_65611 ) ) ( not ( = ?auto_65606 ?auto_65611 ) ) ( not ( = ?auto_65607 ?auto_65611 ) ) ( not ( = ?auto_65608 ?auto_65611 ) ) ( not ( = ?auto_65609 ?auto_65611 ) ) ( ON ?auto_65611 ?auto_65610 ) ( not ( = ?auto_65605 ?auto_65610 ) ) ( not ( = ?auto_65606 ?auto_65610 ) ) ( not ( = ?auto_65607 ?auto_65610 ) ) ( not ( = ?auto_65608 ?auto_65610 ) ) ( not ( = ?auto_65609 ?auto_65610 ) ) ( not ( = ?auto_65611 ?auto_65610 ) ) ( ON ?auto_65609 ?auto_65611 ) ( ON ?auto_65608 ?auto_65609 ) ( ON-TABLE ?auto_65610 ) ( ON ?auto_65607 ?auto_65608 ) ( CLEAR ?auto_65605 ) ( ON ?auto_65606 ?auto_65607 ) ( CLEAR ?auto_65606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65610 ?auto_65611 ?auto_65609 ?auto_65608 ?auto_65607 )
      ( MAKE-4PILE ?auto_65605 ?auto_65606 ?auto_65607 ?auto_65608 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65612 - BLOCK
      ?auto_65613 - BLOCK
      ?auto_65614 - BLOCK
      ?auto_65615 - BLOCK
    )
    :vars
    (
      ?auto_65616 - BLOCK
      ?auto_65617 - BLOCK
      ?auto_65618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65612 ?auto_65613 ) ) ( not ( = ?auto_65612 ?auto_65614 ) ) ( not ( = ?auto_65612 ?auto_65615 ) ) ( not ( = ?auto_65612 ?auto_65616 ) ) ( not ( = ?auto_65613 ?auto_65614 ) ) ( not ( = ?auto_65613 ?auto_65615 ) ) ( not ( = ?auto_65613 ?auto_65616 ) ) ( not ( = ?auto_65614 ?auto_65615 ) ) ( not ( = ?auto_65614 ?auto_65616 ) ) ( not ( = ?auto_65615 ?auto_65616 ) ) ( not ( = ?auto_65612 ?auto_65617 ) ) ( not ( = ?auto_65613 ?auto_65617 ) ) ( not ( = ?auto_65614 ?auto_65617 ) ) ( not ( = ?auto_65615 ?auto_65617 ) ) ( not ( = ?auto_65616 ?auto_65617 ) ) ( ON ?auto_65617 ?auto_65618 ) ( not ( = ?auto_65612 ?auto_65618 ) ) ( not ( = ?auto_65613 ?auto_65618 ) ) ( not ( = ?auto_65614 ?auto_65618 ) ) ( not ( = ?auto_65615 ?auto_65618 ) ) ( not ( = ?auto_65616 ?auto_65618 ) ) ( not ( = ?auto_65617 ?auto_65618 ) ) ( ON ?auto_65616 ?auto_65617 ) ( ON ?auto_65615 ?auto_65616 ) ( ON-TABLE ?auto_65618 ) ( ON ?auto_65614 ?auto_65615 ) ( ON ?auto_65613 ?auto_65614 ) ( CLEAR ?auto_65613 ) ( HOLDING ?auto_65612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65612 )
      ( MAKE-4PILE ?auto_65612 ?auto_65613 ?auto_65614 ?auto_65615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_65619 - BLOCK
      ?auto_65620 - BLOCK
      ?auto_65621 - BLOCK
      ?auto_65622 - BLOCK
    )
    :vars
    (
      ?auto_65624 - BLOCK
      ?auto_65623 - BLOCK
      ?auto_65625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65619 ?auto_65620 ) ) ( not ( = ?auto_65619 ?auto_65621 ) ) ( not ( = ?auto_65619 ?auto_65622 ) ) ( not ( = ?auto_65619 ?auto_65624 ) ) ( not ( = ?auto_65620 ?auto_65621 ) ) ( not ( = ?auto_65620 ?auto_65622 ) ) ( not ( = ?auto_65620 ?auto_65624 ) ) ( not ( = ?auto_65621 ?auto_65622 ) ) ( not ( = ?auto_65621 ?auto_65624 ) ) ( not ( = ?auto_65622 ?auto_65624 ) ) ( not ( = ?auto_65619 ?auto_65623 ) ) ( not ( = ?auto_65620 ?auto_65623 ) ) ( not ( = ?auto_65621 ?auto_65623 ) ) ( not ( = ?auto_65622 ?auto_65623 ) ) ( not ( = ?auto_65624 ?auto_65623 ) ) ( ON ?auto_65623 ?auto_65625 ) ( not ( = ?auto_65619 ?auto_65625 ) ) ( not ( = ?auto_65620 ?auto_65625 ) ) ( not ( = ?auto_65621 ?auto_65625 ) ) ( not ( = ?auto_65622 ?auto_65625 ) ) ( not ( = ?auto_65624 ?auto_65625 ) ) ( not ( = ?auto_65623 ?auto_65625 ) ) ( ON ?auto_65624 ?auto_65623 ) ( ON ?auto_65622 ?auto_65624 ) ( ON-TABLE ?auto_65625 ) ( ON ?auto_65621 ?auto_65622 ) ( ON ?auto_65620 ?auto_65621 ) ( ON ?auto_65619 ?auto_65620 ) ( CLEAR ?auto_65619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65625 ?auto_65623 ?auto_65624 ?auto_65622 ?auto_65621 ?auto_65620 )
      ( MAKE-4PILE ?auto_65619 ?auto_65620 ?auto_65621 ?auto_65622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65628 - BLOCK
      ?auto_65629 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65629 ) ( CLEAR ?auto_65628 ) ( ON-TABLE ?auto_65628 ) ( not ( = ?auto_65628 ?auto_65629 ) ) )
    :subtasks
    ( ( !STACK ?auto_65629 ?auto_65628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65630 - BLOCK
      ?auto_65631 - BLOCK
    )
    :vars
    (
      ?auto_65632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65630 ) ( ON-TABLE ?auto_65630 ) ( not ( = ?auto_65630 ?auto_65631 ) ) ( ON ?auto_65631 ?auto_65632 ) ( CLEAR ?auto_65631 ) ( HAND-EMPTY ) ( not ( = ?auto_65630 ?auto_65632 ) ) ( not ( = ?auto_65631 ?auto_65632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65631 ?auto_65632 )
      ( MAKE-2PILE ?auto_65630 ?auto_65631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65633 - BLOCK
      ?auto_65634 - BLOCK
    )
    :vars
    (
      ?auto_65635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65633 ?auto_65634 ) ) ( ON ?auto_65634 ?auto_65635 ) ( CLEAR ?auto_65634 ) ( not ( = ?auto_65633 ?auto_65635 ) ) ( not ( = ?auto_65634 ?auto_65635 ) ) ( HOLDING ?auto_65633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65633 )
      ( MAKE-2PILE ?auto_65633 ?auto_65634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65636 - BLOCK
      ?auto_65637 - BLOCK
    )
    :vars
    (
      ?auto_65638 - BLOCK
      ?auto_65639 - BLOCK
      ?auto_65641 - BLOCK
      ?auto_65640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65636 ?auto_65637 ) ) ( ON ?auto_65637 ?auto_65638 ) ( not ( = ?auto_65636 ?auto_65638 ) ) ( not ( = ?auto_65637 ?auto_65638 ) ) ( ON ?auto_65636 ?auto_65637 ) ( CLEAR ?auto_65636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65639 ) ( ON ?auto_65641 ?auto_65639 ) ( ON ?auto_65640 ?auto_65641 ) ( ON ?auto_65638 ?auto_65640 ) ( not ( = ?auto_65639 ?auto_65641 ) ) ( not ( = ?auto_65639 ?auto_65640 ) ) ( not ( = ?auto_65639 ?auto_65638 ) ) ( not ( = ?auto_65639 ?auto_65637 ) ) ( not ( = ?auto_65639 ?auto_65636 ) ) ( not ( = ?auto_65641 ?auto_65640 ) ) ( not ( = ?auto_65641 ?auto_65638 ) ) ( not ( = ?auto_65641 ?auto_65637 ) ) ( not ( = ?auto_65641 ?auto_65636 ) ) ( not ( = ?auto_65640 ?auto_65638 ) ) ( not ( = ?auto_65640 ?auto_65637 ) ) ( not ( = ?auto_65640 ?auto_65636 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65639 ?auto_65641 ?auto_65640 ?auto_65638 ?auto_65637 )
      ( MAKE-2PILE ?auto_65636 ?auto_65637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65642 - BLOCK
      ?auto_65643 - BLOCK
    )
    :vars
    (
      ?auto_65646 - BLOCK
      ?auto_65644 - BLOCK
      ?auto_65647 - BLOCK
      ?auto_65645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65642 ?auto_65643 ) ) ( ON ?auto_65643 ?auto_65646 ) ( not ( = ?auto_65642 ?auto_65646 ) ) ( not ( = ?auto_65643 ?auto_65646 ) ) ( ON-TABLE ?auto_65644 ) ( ON ?auto_65647 ?auto_65644 ) ( ON ?auto_65645 ?auto_65647 ) ( ON ?auto_65646 ?auto_65645 ) ( not ( = ?auto_65644 ?auto_65647 ) ) ( not ( = ?auto_65644 ?auto_65645 ) ) ( not ( = ?auto_65644 ?auto_65646 ) ) ( not ( = ?auto_65644 ?auto_65643 ) ) ( not ( = ?auto_65644 ?auto_65642 ) ) ( not ( = ?auto_65647 ?auto_65645 ) ) ( not ( = ?auto_65647 ?auto_65646 ) ) ( not ( = ?auto_65647 ?auto_65643 ) ) ( not ( = ?auto_65647 ?auto_65642 ) ) ( not ( = ?auto_65645 ?auto_65646 ) ) ( not ( = ?auto_65645 ?auto_65643 ) ) ( not ( = ?auto_65645 ?auto_65642 ) ) ( HOLDING ?auto_65642 ) ( CLEAR ?auto_65643 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65644 ?auto_65647 ?auto_65645 ?auto_65646 ?auto_65643 ?auto_65642 )
      ( MAKE-2PILE ?auto_65642 ?auto_65643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65648 - BLOCK
      ?auto_65649 - BLOCK
    )
    :vars
    (
      ?auto_65651 - BLOCK
      ?auto_65652 - BLOCK
      ?auto_65653 - BLOCK
      ?auto_65650 - BLOCK
      ?auto_65654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65648 ?auto_65649 ) ) ( ON ?auto_65649 ?auto_65651 ) ( not ( = ?auto_65648 ?auto_65651 ) ) ( not ( = ?auto_65649 ?auto_65651 ) ) ( ON-TABLE ?auto_65652 ) ( ON ?auto_65653 ?auto_65652 ) ( ON ?auto_65650 ?auto_65653 ) ( ON ?auto_65651 ?auto_65650 ) ( not ( = ?auto_65652 ?auto_65653 ) ) ( not ( = ?auto_65652 ?auto_65650 ) ) ( not ( = ?auto_65652 ?auto_65651 ) ) ( not ( = ?auto_65652 ?auto_65649 ) ) ( not ( = ?auto_65652 ?auto_65648 ) ) ( not ( = ?auto_65653 ?auto_65650 ) ) ( not ( = ?auto_65653 ?auto_65651 ) ) ( not ( = ?auto_65653 ?auto_65649 ) ) ( not ( = ?auto_65653 ?auto_65648 ) ) ( not ( = ?auto_65650 ?auto_65651 ) ) ( not ( = ?auto_65650 ?auto_65649 ) ) ( not ( = ?auto_65650 ?auto_65648 ) ) ( CLEAR ?auto_65649 ) ( ON ?auto_65648 ?auto_65654 ) ( CLEAR ?auto_65648 ) ( HAND-EMPTY ) ( not ( = ?auto_65648 ?auto_65654 ) ) ( not ( = ?auto_65649 ?auto_65654 ) ) ( not ( = ?auto_65651 ?auto_65654 ) ) ( not ( = ?auto_65652 ?auto_65654 ) ) ( not ( = ?auto_65653 ?auto_65654 ) ) ( not ( = ?auto_65650 ?auto_65654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65648 ?auto_65654 )
      ( MAKE-2PILE ?auto_65648 ?auto_65649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65655 - BLOCK
      ?auto_65656 - BLOCK
    )
    :vars
    (
      ?auto_65661 - BLOCK
      ?auto_65657 - BLOCK
      ?auto_65659 - BLOCK
      ?auto_65660 - BLOCK
      ?auto_65658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65655 ?auto_65656 ) ) ( not ( = ?auto_65655 ?auto_65661 ) ) ( not ( = ?auto_65656 ?auto_65661 ) ) ( ON-TABLE ?auto_65657 ) ( ON ?auto_65659 ?auto_65657 ) ( ON ?auto_65660 ?auto_65659 ) ( ON ?auto_65661 ?auto_65660 ) ( not ( = ?auto_65657 ?auto_65659 ) ) ( not ( = ?auto_65657 ?auto_65660 ) ) ( not ( = ?auto_65657 ?auto_65661 ) ) ( not ( = ?auto_65657 ?auto_65656 ) ) ( not ( = ?auto_65657 ?auto_65655 ) ) ( not ( = ?auto_65659 ?auto_65660 ) ) ( not ( = ?auto_65659 ?auto_65661 ) ) ( not ( = ?auto_65659 ?auto_65656 ) ) ( not ( = ?auto_65659 ?auto_65655 ) ) ( not ( = ?auto_65660 ?auto_65661 ) ) ( not ( = ?auto_65660 ?auto_65656 ) ) ( not ( = ?auto_65660 ?auto_65655 ) ) ( ON ?auto_65655 ?auto_65658 ) ( CLEAR ?auto_65655 ) ( not ( = ?auto_65655 ?auto_65658 ) ) ( not ( = ?auto_65656 ?auto_65658 ) ) ( not ( = ?auto_65661 ?auto_65658 ) ) ( not ( = ?auto_65657 ?auto_65658 ) ) ( not ( = ?auto_65659 ?auto_65658 ) ) ( not ( = ?auto_65660 ?auto_65658 ) ) ( HOLDING ?auto_65656 ) ( CLEAR ?auto_65661 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65657 ?auto_65659 ?auto_65660 ?auto_65661 ?auto_65656 )
      ( MAKE-2PILE ?auto_65655 ?auto_65656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65662 - BLOCK
      ?auto_65663 - BLOCK
    )
    :vars
    (
      ?auto_65667 - BLOCK
      ?auto_65665 - BLOCK
      ?auto_65664 - BLOCK
      ?auto_65666 - BLOCK
      ?auto_65668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65662 ?auto_65663 ) ) ( not ( = ?auto_65662 ?auto_65667 ) ) ( not ( = ?auto_65663 ?auto_65667 ) ) ( ON-TABLE ?auto_65665 ) ( ON ?auto_65664 ?auto_65665 ) ( ON ?auto_65666 ?auto_65664 ) ( ON ?auto_65667 ?auto_65666 ) ( not ( = ?auto_65665 ?auto_65664 ) ) ( not ( = ?auto_65665 ?auto_65666 ) ) ( not ( = ?auto_65665 ?auto_65667 ) ) ( not ( = ?auto_65665 ?auto_65663 ) ) ( not ( = ?auto_65665 ?auto_65662 ) ) ( not ( = ?auto_65664 ?auto_65666 ) ) ( not ( = ?auto_65664 ?auto_65667 ) ) ( not ( = ?auto_65664 ?auto_65663 ) ) ( not ( = ?auto_65664 ?auto_65662 ) ) ( not ( = ?auto_65666 ?auto_65667 ) ) ( not ( = ?auto_65666 ?auto_65663 ) ) ( not ( = ?auto_65666 ?auto_65662 ) ) ( ON ?auto_65662 ?auto_65668 ) ( not ( = ?auto_65662 ?auto_65668 ) ) ( not ( = ?auto_65663 ?auto_65668 ) ) ( not ( = ?auto_65667 ?auto_65668 ) ) ( not ( = ?auto_65665 ?auto_65668 ) ) ( not ( = ?auto_65664 ?auto_65668 ) ) ( not ( = ?auto_65666 ?auto_65668 ) ) ( CLEAR ?auto_65667 ) ( ON ?auto_65663 ?auto_65662 ) ( CLEAR ?auto_65663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65668 ?auto_65662 )
      ( MAKE-2PILE ?auto_65662 ?auto_65663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65669 - BLOCK
      ?auto_65670 - BLOCK
    )
    :vars
    (
      ?auto_65673 - BLOCK
      ?auto_65675 - BLOCK
      ?auto_65671 - BLOCK
      ?auto_65672 - BLOCK
      ?auto_65674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65669 ?auto_65670 ) ) ( not ( = ?auto_65669 ?auto_65673 ) ) ( not ( = ?auto_65670 ?auto_65673 ) ) ( ON-TABLE ?auto_65675 ) ( ON ?auto_65671 ?auto_65675 ) ( ON ?auto_65672 ?auto_65671 ) ( not ( = ?auto_65675 ?auto_65671 ) ) ( not ( = ?auto_65675 ?auto_65672 ) ) ( not ( = ?auto_65675 ?auto_65673 ) ) ( not ( = ?auto_65675 ?auto_65670 ) ) ( not ( = ?auto_65675 ?auto_65669 ) ) ( not ( = ?auto_65671 ?auto_65672 ) ) ( not ( = ?auto_65671 ?auto_65673 ) ) ( not ( = ?auto_65671 ?auto_65670 ) ) ( not ( = ?auto_65671 ?auto_65669 ) ) ( not ( = ?auto_65672 ?auto_65673 ) ) ( not ( = ?auto_65672 ?auto_65670 ) ) ( not ( = ?auto_65672 ?auto_65669 ) ) ( ON ?auto_65669 ?auto_65674 ) ( not ( = ?auto_65669 ?auto_65674 ) ) ( not ( = ?auto_65670 ?auto_65674 ) ) ( not ( = ?auto_65673 ?auto_65674 ) ) ( not ( = ?auto_65675 ?auto_65674 ) ) ( not ( = ?auto_65671 ?auto_65674 ) ) ( not ( = ?auto_65672 ?auto_65674 ) ) ( ON ?auto_65670 ?auto_65669 ) ( CLEAR ?auto_65670 ) ( ON-TABLE ?auto_65674 ) ( HOLDING ?auto_65673 ) ( CLEAR ?auto_65672 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65675 ?auto_65671 ?auto_65672 ?auto_65673 )
      ( MAKE-2PILE ?auto_65669 ?auto_65670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65676 - BLOCK
      ?auto_65677 - BLOCK
    )
    :vars
    (
      ?auto_65680 - BLOCK
      ?auto_65679 - BLOCK
      ?auto_65678 - BLOCK
      ?auto_65682 - BLOCK
      ?auto_65681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65676 ?auto_65677 ) ) ( not ( = ?auto_65676 ?auto_65680 ) ) ( not ( = ?auto_65677 ?auto_65680 ) ) ( ON-TABLE ?auto_65679 ) ( ON ?auto_65678 ?auto_65679 ) ( ON ?auto_65682 ?auto_65678 ) ( not ( = ?auto_65679 ?auto_65678 ) ) ( not ( = ?auto_65679 ?auto_65682 ) ) ( not ( = ?auto_65679 ?auto_65680 ) ) ( not ( = ?auto_65679 ?auto_65677 ) ) ( not ( = ?auto_65679 ?auto_65676 ) ) ( not ( = ?auto_65678 ?auto_65682 ) ) ( not ( = ?auto_65678 ?auto_65680 ) ) ( not ( = ?auto_65678 ?auto_65677 ) ) ( not ( = ?auto_65678 ?auto_65676 ) ) ( not ( = ?auto_65682 ?auto_65680 ) ) ( not ( = ?auto_65682 ?auto_65677 ) ) ( not ( = ?auto_65682 ?auto_65676 ) ) ( ON ?auto_65676 ?auto_65681 ) ( not ( = ?auto_65676 ?auto_65681 ) ) ( not ( = ?auto_65677 ?auto_65681 ) ) ( not ( = ?auto_65680 ?auto_65681 ) ) ( not ( = ?auto_65679 ?auto_65681 ) ) ( not ( = ?auto_65678 ?auto_65681 ) ) ( not ( = ?auto_65682 ?auto_65681 ) ) ( ON ?auto_65677 ?auto_65676 ) ( ON-TABLE ?auto_65681 ) ( CLEAR ?auto_65682 ) ( ON ?auto_65680 ?auto_65677 ) ( CLEAR ?auto_65680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65681 ?auto_65676 ?auto_65677 )
      ( MAKE-2PILE ?auto_65676 ?auto_65677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65683 - BLOCK
      ?auto_65684 - BLOCK
    )
    :vars
    (
      ?auto_65688 - BLOCK
      ?auto_65685 - BLOCK
      ?auto_65686 - BLOCK
      ?auto_65687 - BLOCK
      ?auto_65689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65683 ?auto_65684 ) ) ( not ( = ?auto_65683 ?auto_65688 ) ) ( not ( = ?auto_65684 ?auto_65688 ) ) ( ON-TABLE ?auto_65685 ) ( ON ?auto_65686 ?auto_65685 ) ( not ( = ?auto_65685 ?auto_65686 ) ) ( not ( = ?auto_65685 ?auto_65687 ) ) ( not ( = ?auto_65685 ?auto_65688 ) ) ( not ( = ?auto_65685 ?auto_65684 ) ) ( not ( = ?auto_65685 ?auto_65683 ) ) ( not ( = ?auto_65686 ?auto_65687 ) ) ( not ( = ?auto_65686 ?auto_65688 ) ) ( not ( = ?auto_65686 ?auto_65684 ) ) ( not ( = ?auto_65686 ?auto_65683 ) ) ( not ( = ?auto_65687 ?auto_65688 ) ) ( not ( = ?auto_65687 ?auto_65684 ) ) ( not ( = ?auto_65687 ?auto_65683 ) ) ( ON ?auto_65683 ?auto_65689 ) ( not ( = ?auto_65683 ?auto_65689 ) ) ( not ( = ?auto_65684 ?auto_65689 ) ) ( not ( = ?auto_65688 ?auto_65689 ) ) ( not ( = ?auto_65685 ?auto_65689 ) ) ( not ( = ?auto_65686 ?auto_65689 ) ) ( not ( = ?auto_65687 ?auto_65689 ) ) ( ON ?auto_65684 ?auto_65683 ) ( ON-TABLE ?auto_65689 ) ( ON ?auto_65688 ?auto_65684 ) ( CLEAR ?auto_65688 ) ( HOLDING ?auto_65687 ) ( CLEAR ?auto_65686 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65685 ?auto_65686 ?auto_65687 )
      ( MAKE-2PILE ?auto_65683 ?auto_65684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65690 - BLOCK
      ?auto_65691 - BLOCK
    )
    :vars
    (
      ?auto_65695 - BLOCK
      ?auto_65696 - BLOCK
      ?auto_65693 - BLOCK
      ?auto_65692 - BLOCK
      ?auto_65694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65690 ?auto_65691 ) ) ( not ( = ?auto_65690 ?auto_65695 ) ) ( not ( = ?auto_65691 ?auto_65695 ) ) ( ON-TABLE ?auto_65696 ) ( ON ?auto_65693 ?auto_65696 ) ( not ( = ?auto_65696 ?auto_65693 ) ) ( not ( = ?auto_65696 ?auto_65692 ) ) ( not ( = ?auto_65696 ?auto_65695 ) ) ( not ( = ?auto_65696 ?auto_65691 ) ) ( not ( = ?auto_65696 ?auto_65690 ) ) ( not ( = ?auto_65693 ?auto_65692 ) ) ( not ( = ?auto_65693 ?auto_65695 ) ) ( not ( = ?auto_65693 ?auto_65691 ) ) ( not ( = ?auto_65693 ?auto_65690 ) ) ( not ( = ?auto_65692 ?auto_65695 ) ) ( not ( = ?auto_65692 ?auto_65691 ) ) ( not ( = ?auto_65692 ?auto_65690 ) ) ( ON ?auto_65690 ?auto_65694 ) ( not ( = ?auto_65690 ?auto_65694 ) ) ( not ( = ?auto_65691 ?auto_65694 ) ) ( not ( = ?auto_65695 ?auto_65694 ) ) ( not ( = ?auto_65696 ?auto_65694 ) ) ( not ( = ?auto_65693 ?auto_65694 ) ) ( not ( = ?auto_65692 ?auto_65694 ) ) ( ON ?auto_65691 ?auto_65690 ) ( ON-TABLE ?auto_65694 ) ( ON ?auto_65695 ?auto_65691 ) ( CLEAR ?auto_65693 ) ( ON ?auto_65692 ?auto_65695 ) ( CLEAR ?auto_65692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65694 ?auto_65690 ?auto_65691 ?auto_65695 )
      ( MAKE-2PILE ?auto_65690 ?auto_65691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65697 - BLOCK
      ?auto_65698 - BLOCK
    )
    :vars
    (
      ?auto_65701 - BLOCK
      ?auto_65702 - BLOCK
      ?auto_65699 - BLOCK
      ?auto_65703 - BLOCK
      ?auto_65700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65697 ?auto_65698 ) ) ( not ( = ?auto_65697 ?auto_65701 ) ) ( not ( = ?auto_65698 ?auto_65701 ) ) ( ON-TABLE ?auto_65702 ) ( not ( = ?auto_65702 ?auto_65699 ) ) ( not ( = ?auto_65702 ?auto_65703 ) ) ( not ( = ?auto_65702 ?auto_65701 ) ) ( not ( = ?auto_65702 ?auto_65698 ) ) ( not ( = ?auto_65702 ?auto_65697 ) ) ( not ( = ?auto_65699 ?auto_65703 ) ) ( not ( = ?auto_65699 ?auto_65701 ) ) ( not ( = ?auto_65699 ?auto_65698 ) ) ( not ( = ?auto_65699 ?auto_65697 ) ) ( not ( = ?auto_65703 ?auto_65701 ) ) ( not ( = ?auto_65703 ?auto_65698 ) ) ( not ( = ?auto_65703 ?auto_65697 ) ) ( ON ?auto_65697 ?auto_65700 ) ( not ( = ?auto_65697 ?auto_65700 ) ) ( not ( = ?auto_65698 ?auto_65700 ) ) ( not ( = ?auto_65701 ?auto_65700 ) ) ( not ( = ?auto_65702 ?auto_65700 ) ) ( not ( = ?auto_65699 ?auto_65700 ) ) ( not ( = ?auto_65703 ?auto_65700 ) ) ( ON ?auto_65698 ?auto_65697 ) ( ON-TABLE ?auto_65700 ) ( ON ?auto_65701 ?auto_65698 ) ( ON ?auto_65703 ?auto_65701 ) ( CLEAR ?auto_65703 ) ( HOLDING ?auto_65699 ) ( CLEAR ?auto_65702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65702 ?auto_65699 )
      ( MAKE-2PILE ?auto_65697 ?auto_65698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65704 - BLOCK
      ?auto_65705 - BLOCK
    )
    :vars
    (
      ?auto_65710 - BLOCK
      ?auto_65709 - BLOCK
      ?auto_65707 - BLOCK
      ?auto_65706 - BLOCK
      ?auto_65708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65704 ?auto_65705 ) ) ( not ( = ?auto_65704 ?auto_65710 ) ) ( not ( = ?auto_65705 ?auto_65710 ) ) ( ON-TABLE ?auto_65709 ) ( not ( = ?auto_65709 ?auto_65707 ) ) ( not ( = ?auto_65709 ?auto_65706 ) ) ( not ( = ?auto_65709 ?auto_65710 ) ) ( not ( = ?auto_65709 ?auto_65705 ) ) ( not ( = ?auto_65709 ?auto_65704 ) ) ( not ( = ?auto_65707 ?auto_65706 ) ) ( not ( = ?auto_65707 ?auto_65710 ) ) ( not ( = ?auto_65707 ?auto_65705 ) ) ( not ( = ?auto_65707 ?auto_65704 ) ) ( not ( = ?auto_65706 ?auto_65710 ) ) ( not ( = ?auto_65706 ?auto_65705 ) ) ( not ( = ?auto_65706 ?auto_65704 ) ) ( ON ?auto_65704 ?auto_65708 ) ( not ( = ?auto_65704 ?auto_65708 ) ) ( not ( = ?auto_65705 ?auto_65708 ) ) ( not ( = ?auto_65710 ?auto_65708 ) ) ( not ( = ?auto_65709 ?auto_65708 ) ) ( not ( = ?auto_65707 ?auto_65708 ) ) ( not ( = ?auto_65706 ?auto_65708 ) ) ( ON ?auto_65705 ?auto_65704 ) ( ON-TABLE ?auto_65708 ) ( ON ?auto_65710 ?auto_65705 ) ( ON ?auto_65706 ?auto_65710 ) ( CLEAR ?auto_65709 ) ( ON ?auto_65707 ?auto_65706 ) ( CLEAR ?auto_65707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65708 ?auto_65704 ?auto_65705 ?auto_65710 ?auto_65706 )
      ( MAKE-2PILE ?auto_65704 ?auto_65705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65711 - BLOCK
      ?auto_65712 - BLOCK
    )
    :vars
    (
      ?auto_65713 - BLOCK
      ?auto_65717 - BLOCK
      ?auto_65715 - BLOCK
      ?auto_65714 - BLOCK
      ?auto_65716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65711 ?auto_65712 ) ) ( not ( = ?auto_65711 ?auto_65713 ) ) ( not ( = ?auto_65712 ?auto_65713 ) ) ( not ( = ?auto_65717 ?auto_65715 ) ) ( not ( = ?auto_65717 ?auto_65714 ) ) ( not ( = ?auto_65717 ?auto_65713 ) ) ( not ( = ?auto_65717 ?auto_65712 ) ) ( not ( = ?auto_65717 ?auto_65711 ) ) ( not ( = ?auto_65715 ?auto_65714 ) ) ( not ( = ?auto_65715 ?auto_65713 ) ) ( not ( = ?auto_65715 ?auto_65712 ) ) ( not ( = ?auto_65715 ?auto_65711 ) ) ( not ( = ?auto_65714 ?auto_65713 ) ) ( not ( = ?auto_65714 ?auto_65712 ) ) ( not ( = ?auto_65714 ?auto_65711 ) ) ( ON ?auto_65711 ?auto_65716 ) ( not ( = ?auto_65711 ?auto_65716 ) ) ( not ( = ?auto_65712 ?auto_65716 ) ) ( not ( = ?auto_65713 ?auto_65716 ) ) ( not ( = ?auto_65717 ?auto_65716 ) ) ( not ( = ?auto_65715 ?auto_65716 ) ) ( not ( = ?auto_65714 ?auto_65716 ) ) ( ON ?auto_65712 ?auto_65711 ) ( ON-TABLE ?auto_65716 ) ( ON ?auto_65713 ?auto_65712 ) ( ON ?auto_65714 ?auto_65713 ) ( ON ?auto_65715 ?auto_65714 ) ( CLEAR ?auto_65715 ) ( HOLDING ?auto_65717 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65717 )
      ( MAKE-2PILE ?auto_65711 ?auto_65712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65718 - BLOCK
      ?auto_65719 - BLOCK
    )
    :vars
    (
      ?auto_65724 - BLOCK
      ?auto_65722 - BLOCK
      ?auto_65720 - BLOCK
      ?auto_65721 - BLOCK
      ?auto_65723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65718 ?auto_65719 ) ) ( not ( = ?auto_65718 ?auto_65724 ) ) ( not ( = ?auto_65719 ?auto_65724 ) ) ( not ( = ?auto_65722 ?auto_65720 ) ) ( not ( = ?auto_65722 ?auto_65721 ) ) ( not ( = ?auto_65722 ?auto_65724 ) ) ( not ( = ?auto_65722 ?auto_65719 ) ) ( not ( = ?auto_65722 ?auto_65718 ) ) ( not ( = ?auto_65720 ?auto_65721 ) ) ( not ( = ?auto_65720 ?auto_65724 ) ) ( not ( = ?auto_65720 ?auto_65719 ) ) ( not ( = ?auto_65720 ?auto_65718 ) ) ( not ( = ?auto_65721 ?auto_65724 ) ) ( not ( = ?auto_65721 ?auto_65719 ) ) ( not ( = ?auto_65721 ?auto_65718 ) ) ( ON ?auto_65718 ?auto_65723 ) ( not ( = ?auto_65718 ?auto_65723 ) ) ( not ( = ?auto_65719 ?auto_65723 ) ) ( not ( = ?auto_65724 ?auto_65723 ) ) ( not ( = ?auto_65722 ?auto_65723 ) ) ( not ( = ?auto_65720 ?auto_65723 ) ) ( not ( = ?auto_65721 ?auto_65723 ) ) ( ON ?auto_65719 ?auto_65718 ) ( ON-TABLE ?auto_65723 ) ( ON ?auto_65724 ?auto_65719 ) ( ON ?auto_65721 ?auto_65724 ) ( ON ?auto_65720 ?auto_65721 ) ( ON ?auto_65722 ?auto_65720 ) ( CLEAR ?auto_65722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65723 ?auto_65718 ?auto_65719 ?auto_65724 ?auto_65721 ?auto_65720 )
      ( MAKE-2PILE ?auto_65718 ?auto_65719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65728 - BLOCK
      ?auto_65729 - BLOCK
      ?auto_65730 - BLOCK
    )
    :vars
    (
      ?auto_65731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65731 ?auto_65730 ) ( CLEAR ?auto_65731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65728 ) ( ON ?auto_65729 ?auto_65728 ) ( ON ?auto_65730 ?auto_65729 ) ( not ( = ?auto_65728 ?auto_65729 ) ) ( not ( = ?auto_65728 ?auto_65730 ) ) ( not ( = ?auto_65728 ?auto_65731 ) ) ( not ( = ?auto_65729 ?auto_65730 ) ) ( not ( = ?auto_65729 ?auto_65731 ) ) ( not ( = ?auto_65730 ?auto_65731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65731 ?auto_65730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65732 - BLOCK
      ?auto_65733 - BLOCK
      ?auto_65734 - BLOCK
    )
    :vars
    (
      ?auto_65735 - BLOCK
      ?auto_65736 - BLOCK
      ?auto_65737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65735 ?auto_65734 ) ( CLEAR ?auto_65735 ) ( ON-TABLE ?auto_65732 ) ( ON ?auto_65733 ?auto_65732 ) ( ON ?auto_65734 ?auto_65733 ) ( not ( = ?auto_65732 ?auto_65733 ) ) ( not ( = ?auto_65732 ?auto_65734 ) ) ( not ( = ?auto_65732 ?auto_65735 ) ) ( not ( = ?auto_65733 ?auto_65734 ) ) ( not ( = ?auto_65733 ?auto_65735 ) ) ( not ( = ?auto_65734 ?auto_65735 ) ) ( HOLDING ?auto_65736 ) ( CLEAR ?auto_65737 ) ( not ( = ?auto_65732 ?auto_65736 ) ) ( not ( = ?auto_65732 ?auto_65737 ) ) ( not ( = ?auto_65733 ?auto_65736 ) ) ( not ( = ?auto_65733 ?auto_65737 ) ) ( not ( = ?auto_65734 ?auto_65736 ) ) ( not ( = ?auto_65734 ?auto_65737 ) ) ( not ( = ?auto_65735 ?auto_65736 ) ) ( not ( = ?auto_65735 ?auto_65737 ) ) ( not ( = ?auto_65736 ?auto_65737 ) ) )
    :subtasks
    ( ( !STACK ?auto_65736 ?auto_65737 )
      ( MAKE-3PILE ?auto_65732 ?auto_65733 ?auto_65734 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65738 - BLOCK
      ?auto_65739 - BLOCK
      ?auto_65740 - BLOCK
    )
    :vars
    (
      ?auto_65741 - BLOCK
      ?auto_65742 - BLOCK
      ?auto_65743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65741 ?auto_65740 ) ( ON-TABLE ?auto_65738 ) ( ON ?auto_65739 ?auto_65738 ) ( ON ?auto_65740 ?auto_65739 ) ( not ( = ?auto_65738 ?auto_65739 ) ) ( not ( = ?auto_65738 ?auto_65740 ) ) ( not ( = ?auto_65738 ?auto_65741 ) ) ( not ( = ?auto_65739 ?auto_65740 ) ) ( not ( = ?auto_65739 ?auto_65741 ) ) ( not ( = ?auto_65740 ?auto_65741 ) ) ( CLEAR ?auto_65742 ) ( not ( = ?auto_65738 ?auto_65743 ) ) ( not ( = ?auto_65738 ?auto_65742 ) ) ( not ( = ?auto_65739 ?auto_65743 ) ) ( not ( = ?auto_65739 ?auto_65742 ) ) ( not ( = ?auto_65740 ?auto_65743 ) ) ( not ( = ?auto_65740 ?auto_65742 ) ) ( not ( = ?auto_65741 ?auto_65743 ) ) ( not ( = ?auto_65741 ?auto_65742 ) ) ( not ( = ?auto_65743 ?auto_65742 ) ) ( ON ?auto_65743 ?auto_65741 ) ( CLEAR ?auto_65743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65738 ?auto_65739 ?auto_65740 ?auto_65741 )
      ( MAKE-3PILE ?auto_65738 ?auto_65739 ?auto_65740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65744 - BLOCK
      ?auto_65745 - BLOCK
      ?auto_65746 - BLOCK
    )
    :vars
    (
      ?auto_65748 - BLOCK
      ?auto_65747 - BLOCK
      ?auto_65749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65748 ?auto_65746 ) ( ON-TABLE ?auto_65744 ) ( ON ?auto_65745 ?auto_65744 ) ( ON ?auto_65746 ?auto_65745 ) ( not ( = ?auto_65744 ?auto_65745 ) ) ( not ( = ?auto_65744 ?auto_65746 ) ) ( not ( = ?auto_65744 ?auto_65748 ) ) ( not ( = ?auto_65745 ?auto_65746 ) ) ( not ( = ?auto_65745 ?auto_65748 ) ) ( not ( = ?auto_65746 ?auto_65748 ) ) ( not ( = ?auto_65744 ?auto_65747 ) ) ( not ( = ?auto_65744 ?auto_65749 ) ) ( not ( = ?auto_65745 ?auto_65747 ) ) ( not ( = ?auto_65745 ?auto_65749 ) ) ( not ( = ?auto_65746 ?auto_65747 ) ) ( not ( = ?auto_65746 ?auto_65749 ) ) ( not ( = ?auto_65748 ?auto_65747 ) ) ( not ( = ?auto_65748 ?auto_65749 ) ) ( not ( = ?auto_65747 ?auto_65749 ) ) ( ON ?auto_65747 ?auto_65748 ) ( CLEAR ?auto_65747 ) ( HOLDING ?auto_65749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65749 )
      ( MAKE-3PILE ?auto_65744 ?auto_65745 ?auto_65746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65750 - BLOCK
      ?auto_65751 - BLOCK
      ?auto_65752 - BLOCK
    )
    :vars
    (
      ?auto_65753 - BLOCK
      ?auto_65754 - BLOCK
      ?auto_65755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65753 ?auto_65752 ) ( ON-TABLE ?auto_65750 ) ( ON ?auto_65751 ?auto_65750 ) ( ON ?auto_65752 ?auto_65751 ) ( not ( = ?auto_65750 ?auto_65751 ) ) ( not ( = ?auto_65750 ?auto_65752 ) ) ( not ( = ?auto_65750 ?auto_65753 ) ) ( not ( = ?auto_65751 ?auto_65752 ) ) ( not ( = ?auto_65751 ?auto_65753 ) ) ( not ( = ?auto_65752 ?auto_65753 ) ) ( not ( = ?auto_65750 ?auto_65754 ) ) ( not ( = ?auto_65750 ?auto_65755 ) ) ( not ( = ?auto_65751 ?auto_65754 ) ) ( not ( = ?auto_65751 ?auto_65755 ) ) ( not ( = ?auto_65752 ?auto_65754 ) ) ( not ( = ?auto_65752 ?auto_65755 ) ) ( not ( = ?auto_65753 ?auto_65754 ) ) ( not ( = ?auto_65753 ?auto_65755 ) ) ( not ( = ?auto_65754 ?auto_65755 ) ) ( ON ?auto_65754 ?auto_65753 ) ( ON ?auto_65755 ?auto_65754 ) ( CLEAR ?auto_65755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65750 ?auto_65751 ?auto_65752 ?auto_65753 ?auto_65754 )
      ( MAKE-3PILE ?auto_65750 ?auto_65751 ?auto_65752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65756 - BLOCK
      ?auto_65757 - BLOCK
      ?auto_65758 - BLOCK
    )
    :vars
    (
      ?auto_65761 - BLOCK
      ?auto_65759 - BLOCK
      ?auto_65760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65761 ?auto_65758 ) ( ON-TABLE ?auto_65756 ) ( ON ?auto_65757 ?auto_65756 ) ( ON ?auto_65758 ?auto_65757 ) ( not ( = ?auto_65756 ?auto_65757 ) ) ( not ( = ?auto_65756 ?auto_65758 ) ) ( not ( = ?auto_65756 ?auto_65761 ) ) ( not ( = ?auto_65757 ?auto_65758 ) ) ( not ( = ?auto_65757 ?auto_65761 ) ) ( not ( = ?auto_65758 ?auto_65761 ) ) ( not ( = ?auto_65756 ?auto_65759 ) ) ( not ( = ?auto_65756 ?auto_65760 ) ) ( not ( = ?auto_65757 ?auto_65759 ) ) ( not ( = ?auto_65757 ?auto_65760 ) ) ( not ( = ?auto_65758 ?auto_65759 ) ) ( not ( = ?auto_65758 ?auto_65760 ) ) ( not ( = ?auto_65761 ?auto_65759 ) ) ( not ( = ?auto_65761 ?auto_65760 ) ) ( not ( = ?auto_65759 ?auto_65760 ) ) ( ON ?auto_65759 ?auto_65761 ) ( HOLDING ?auto_65760 ) ( CLEAR ?auto_65759 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65756 ?auto_65757 ?auto_65758 ?auto_65761 ?auto_65759 ?auto_65760 )
      ( MAKE-3PILE ?auto_65756 ?auto_65757 ?auto_65758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65762 - BLOCK
      ?auto_65763 - BLOCK
      ?auto_65764 - BLOCK
    )
    :vars
    (
      ?auto_65765 - BLOCK
      ?auto_65766 - BLOCK
      ?auto_65767 - BLOCK
      ?auto_65768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65765 ?auto_65764 ) ( ON-TABLE ?auto_65762 ) ( ON ?auto_65763 ?auto_65762 ) ( ON ?auto_65764 ?auto_65763 ) ( not ( = ?auto_65762 ?auto_65763 ) ) ( not ( = ?auto_65762 ?auto_65764 ) ) ( not ( = ?auto_65762 ?auto_65765 ) ) ( not ( = ?auto_65763 ?auto_65764 ) ) ( not ( = ?auto_65763 ?auto_65765 ) ) ( not ( = ?auto_65764 ?auto_65765 ) ) ( not ( = ?auto_65762 ?auto_65766 ) ) ( not ( = ?auto_65762 ?auto_65767 ) ) ( not ( = ?auto_65763 ?auto_65766 ) ) ( not ( = ?auto_65763 ?auto_65767 ) ) ( not ( = ?auto_65764 ?auto_65766 ) ) ( not ( = ?auto_65764 ?auto_65767 ) ) ( not ( = ?auto_65765 ?auto_65766 ) ) ( not ( = ?auto_65765 ?auto_65767 ) ) ( not ( = ?auto_65766 ?auto_65767 ) ) ( ON ?auto_65766 ?auto_65765 ) ( CLEAR ?auto_65766 ) ( ON ?auto_65767 ?auto_65768 ) ( CLEAR ?auto_65767 ) ( HAND-EMPTY ) ( not ( = ?auto_65762 ?auto_65768 ) ) ( not ( = ?auto_65763 ?auto_65768 ) ) ( not ( = ?auto_65764 ?auto_65768 ) ) ( not ( = ?auto_65765 ?auto_65768 ) ) ( not ( = ?auto_65766 ?auto_65768 ) ) ( not ( = ?auto_65767 ?auto_65768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65767 ?auto_65768 )
      ( MAKE-3PILE ?auto_65762 ?auto_65763 ?auto_65764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65769 - BLOCK
      ?auto_65770 - BLOCK
      ?auto_65771 - BLOCK
    )
    :vars
    (
      ?auto_65772 - BLOCK
      ?auto_65773 - BLOCK
      ?auto_65775 - BLOCK
      ?auto_65774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65772 ?auto_65771 ) ( ON-TABLE ?auto_65769 ) ( ON ?auto_65770 ?auto_65769 ) ( ON ?auto_65771 ?auto_65770 ) ( not ( = ?auto_65769 ?auto_65770 ) ) ( not ( = ?auto_65769 ?auto_65771 ) ) ( not ( = ?auto_65769 ?auto_65772 ) ) ( not ( = ?auto_65770 ?auto_65771 ) ) ( not ( = ?auto_65770 ?auto_65772 ) ) ( not ( = ?auto_65771 ?auto_65772 ) ) ( not ( = ?auto_65769 ?auto_65773 ) ) ( not ( = ?auto_65769 ?auto_65775 ) ) ( not ( = ?auto_65770 ?auto_65773 ) ) ( not ( = ?auto_65770 ?auto_65775 ) ) ( not ( = ?auto_65771 ?auto_65773 ) ) ( not ( = ?auto_65771 ?auto_65775 ) ) ( not ( = ?auto_65772 ?auto_65773 ) ) ( not ( = ?auto_65772 ?auto_65775 ) ) ( not ( = ?auto_65773 ?auto_65775 ) ) ( ON ?auto_65775 ?auto_65774 ) ( CLEAR ?auto_65775 ) ( not ( = ?auto_65769 ?auto_65774 ) ) ( not ( = ?auto_65770 ?auto_65774 ) ) ( not ( = ?auto_65771 ?auto_65774 ) ) ( not ( = ?auto_65772 ?auto_65774 ) ) ( not ( = ?auto_65773 ?auto_65774 ) ) ( not ( = ?auto_65775 ?auto_65774 ) ) ( HOLDING ?auto_65773 ) ( CLEAR ?auto_65772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65769 ?auto_65770 ?auto_65771 ?auto_65772 ?auto_65773 )
      ( MAKE-3PILE ?auto_65769 ?auto_65770 ?auto_65771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65776 - BLOCK
      ?auto_65777 - BLOCK
      ?auto_65778 - BLOCK
    )
    :vars
    (
      ?auto_65782 - BLOCK
      ?auto_65781 - BLOCK
      ?auto_65779 - BLOCK
      ?auto_65780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65782 ?auto_65778 ) ( ON-TABLE ?auto_65776 ) ( ON ?auto_65777 ?auto_65776 ) ( ON ?auto_65778 ?auto_65777 ) ( not ( = ?auto_65776 ?auto_65777 ) ) ( not ( = ?auto_65776 ?auto_65778 ) ) ( not ( = ?auto_65776 ?auto_65782 ) ) ( not ( = ?auto_65777 ?auto_65778 ) ) ( not ( = ?auto_65777 ?auto_65782 ) ) ( not ( = ?auto_65778 ?auto_65782 ) ) ( not ( = ?auto_65776 ?auto_65781 ) ) ( not ( = ?auto_65776 ?auto_65779 ) ) ( not ( = ?auto_65777 ?auto_65781 ) ) ( not ( = ?auto_65777 ?auto_65779 ) ) ( not ( = ?auto_65778 ?auto_65781 ) ) ( not ( = ?auto_65778 ?auto_65779 ) ) ( not ( = ?auto_65782 ?auto_65781 ) ) ( not ( = ?auto_65782 ?auto_65779 ) ) ( not ( = ?auto_65781 ?auto_65779 ) ) ( ON ?auto_65779 ?auto_65780 ) ( not ( = ?auto_65776 ?auto_65780 ) ) ( not ( = ?auto_65777 ?auto_65780 ) ) ( not ( = ?auto_65778 ?auto_65780 ) ) ( not ( = ?auto_65782 ?auto_65780 ) ) ( not ( = ?auto_65781 ?auto_65780 ) ) ( not ( = ?auto_65779 ?auto_65780 ) ) ( CLEAR ?auto_65782 ) ( ON ?auto_65781 ?auto_65779 ) ( CLEAR ?auto_65781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65780 ?auto_65779 )
      ( MAKE-3PILE ?auto_65776 ?auto_65777 ?auto_65778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65797 - BLOCK
      ?auto_65798 - BLOCK
      ?auto_65799 - BLOCK
    )
    :vars
    (
      ?auto_65801 - BLOCK
      ?auto_65800 - BLOCK
      ?auto_65802 - BLOCK
      ?auto_65803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65797 ) ( ON ?auto_65798 ?auto_65797 ) ( not ( = ?auto_65797 ?auto_65798 ) ) ( not ( = ?auto_65797 ?auto_65799 ) ) ( not ( = ?auto_65797 ?auto_65801 ) ) ( not ( = ?auto_65798 ?auto_65799 ) ) ( not ( = ?auto_65798 ?auto_65801 ) ) ( not ( = ?auto_65799 ?auto_65801 ) ) ( not ( = ?auto_65797 ?auto_65800 ) ) ( not ( = ?auto_65797 ?auto_65802 ) ) ( not ( = ?auto_65798 ?auto_65800 ) ) ( not ( = ?auto_65798 ?auto_65802 ) ) ( not ( = ?auto_65799 ?auto_65800 ) ) ( not ( = ?auto_65799 ?auto_65802 ) ) ( not ( = ?auto_65801 ?auto_65800 ) ) ( not ( = ?auto_65801 ?auto_65802 ) ) ( not ( = ?auto_65800 ?auto_65802 ) ) ( ON ?auto_65802 ?auto_65803 ) ( not ( = ?auto_65797 ?auto_65803 ) ) ( not ( = ?auto_65798 ?auto_65803 ) ) ( not ( = ?auto_65799 ?auto_65803 ) ) ( not ( = ?auto_65801 ?auto_65803 ) ) ( not ( = ?auto_65800 ?auto_65803 ) ) ( not ( = ?auto_65802 ?auto_65803 ) ) ( ON ?auto_65800 ?auto_65802 ) ( ON-TABLE ?auto_65803 ) ( ON ?auto_65801 ?auto_65800 ) ( CLEAR ?auto_65801 ) ( HOLDING ?auto_65799 ) ( CLEAR ?auto_65798 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65797 ?auto_65798 ?auto_65799 ?auto_65801 )
      ( MAKE-3PILE ?auto_65797 ?auto_65798 ?auto_65799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65804 - BLOCK
      ?auto_65805 - BLOCK
      ?auto_65806 - BLOCK
    )
    :vars
    (
      ?auto_65808 - BLOCK
      ?auto_65807 - BLOCK
      ?auto_65810 - BLOCK
      ?auto_65809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65804 ) ( ON ?auto_65805 ?auto_65804 ) ( not ( = ?auto_65804 ?auto_65805 ) ) ( not ( = ?auto_65804 ?auto_65806 ) ) ( not ( = ?auto_65804 ?auto_65808 ) ) ( not ( = ?auto_65805 ?auto_65806 ) ) ( not ( = ?auto_65805 ?auto_65808 ) ) ( not ( = ?auto_65806 ?auto_65808 ) ) ( not ( = ?auto_65804 ?auto_65807 ) ) ( not ( = ?auto_65804 ?auto_65810 ) ) ( not ( = ?auto_65805 ?auto_65807 ) ) ( not ( = ?auto_65805 ?auto_65810 ) ) ( not ( = ?auto_65806 ?auto_65807 ) ) ( not ( = ?auto_65806 ?auto_65810 ) ) ( not ( = ?auto_65808 ?auto_65807 ) ) ( not ( = ?auto_65808 ?auto_65810 ) ) ( not ( = ?auto_65807 ?auto_65810 ) ) ( ON ?auto_65810 ?auto_65809 ) ( not ( = ?auto_65804 ?auto_65809 ) ) ( not ( = ?auto_65805 ?auto_65809 ) ) ( not ( = ?auto_65806 ?auto_65809 ) ) ( not ( = ?auto_65808 ?auto_65809 ) ) ( not ( = ?auto_65807 ?auto_65809 ) ) ( not ( = ?auto_65810 ?auto_65809 ) ) ( ON ?auto_65807 ?auto_65810 ) ( ON-TABLE ?auto_65809 ) ( ON ?auto_65808 ?auto_65807 ) ( CLEAR ?auto_65805 ) ( ON ?auto_65806 ?auto_65808 ) ( CLEAR ?auto_65806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65809 ?auto_65810 ?auto_65807 ?auto_65808 )
      ( MAKE-3PILE ?auto_65804 ?auto_65805 ?auto_65806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65811 - BLOCK
      ?auto_65812 - BLOCK
      ?auto_65813 - BLOCK
    )
    :vars
    (
      ?auto_65815 - BLOCK
      ?auto_65814 - BLOCK
      ?auto_65817 - BLOCK
      ?auto_65816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65811 ) ( not ( = ?auto_65811 ?auto_65812 ) ) ( not ( = ?auto_65811 ?auto_65813 ) ) ( not ( = ?auto_65811 ?auto_65815 ) ) ( not ( = ?auto_65812 ?auto_65813 ) ) ( not ( = ?auto_65812 ?auto_65815 ) ) ( not ( = ?auto_65813 ?auto_65815 ) ) ( not ( = ?auto_65811 ?auto_65814 ) ) ( not ( = ?auto_65811 ?auto_65817 ) ) ( not ( = ?auto_65812 ?auto_65814 ) ) ( not ( = ?auto_65812 ?auto_65817 ) ) ( not ( = ?auto_65813 ?auto_65814 ) ) ( not ( = ?auto_65813 ?auto_65817 ) ) ( not ( = ?auto_65815 ?auto_65814 ) ) ( not ( = ?auto_65815 ?auto_65817 ) ) ( not ( = ?auto_65814 ?auto_65817 ) ) ( ON ?auto_65817 ?auto_65816 ) ( not ( = ?auto_65811 ?auto_65816 ) ) ( not ( = ?auto_65812 ?auto_65816 ) ) ( not ( = ?auto_65813 ?auto_65816 ) ) ( not ( = ?auto_65815 ?auto_65816 ) ) ( not ( = ?auto_65814 ?auto_65816 ) ) ( not ( = ?auto_65817 ?auto_65816 ) ) ( ON ?auto_65814 ?auto_65817 ) ( ON-TABLE ?auto_65816 ) ( ON ?auto_65815 ?auto_65814 ) ( ON ?auto_65813 ?auto_65815 ) ( CLEAR ?auto_65813 ) ( HOLDING ?auto_65812 ) ( CLEAR ?auto_65811 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65811 ?auto_65812 )
      ( MAKE-3PILE ?auto_65811 ?auto_65812 ?auto_65813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65818 - BLOCK
      ?auto_65819 - BLOCK
      ?auto_65820 - BLOCK
    )
    :vars
    (
      ?auto_65824 - BLOCK
      ?auto_65823 - BLOCK
      ?auto_65821 - BLOCK
      ?auto_65822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65818 ) ( not ( = ?auto_65818 ?auto_65819 ) ) ( not ( = ?auto_65818 ?auto_65820 ) ) ( not ( = ?auto_65818 ?auto_65824 ) ) ( not ( = ?auto_65819 ?auto_65820 ) ) ( not ( = ?auto_65819 ?auto_65824 ) ) ( not ( = ?auto_65820 ?auto_65824 ) ) ( not ( = ?auto_65818 ?auto_65823 ) ) ( not ( = ?auto_65818 ?auto_65821 ) ) ( not ( = ?auto_65819 ?auto_65823 ) ) ( not ( = ?auto_65819 ?auto_65821 ) ) ( not ( = ?auto_65820 ?auto_65823 ) ) ( not ( = ?auto_65820 ?auto_65821 ) ) ( not ( = ?auto_65824 ?auto_65823 ) ) ( not ( = ?auto_65824 ?auto_65821 ) ) ( not ( = ?auto_65823 ?auto_65821 ) ) ( ON ?auto_65821 ?auto_65822 ) ( not ( = ?auto_65818 ?auto_65822 ) ) ( not ( = ?auto_65819 ?auto_65822 ) ) ( not ( = ?auto_65820 ?auto_65822 ) ) ( not ( = ?auto_65824 ?auto_65822 ) ) ( not ( = ?auto_65823 ?auto_65822 ) ) ( not ( = ?auto_65821 ?auto_65822 ) ) ( ON ?auto_65823 ?auto_65821 ) ( ON-TABLE ?auto_65822 ) ( ON ?auto_65824 ?auto_65823 ) ( ON ?auto_65820 ?auto_65824 ) ( CLEAR ?auto_65818 ) ( ON ?auto_65819 ?auto_65820 ) ( CLEAR ?auto_65819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65822 ?auto_65821 ?auto_65823 ?auto_65824 ?auto_65820 )
      ( MAKE-3PILE ?auto_65818 ?auto_65819 ?auto_65820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65825 - BLOCK
      ?auto_65826 - BLOCK
      ?auto_65827 - BLOCK
    )
    :vars
    (
      ?auto_65828 - BLOCK
      ?auto_65831 - BLOCK
      ?auto_65829 - BLOCK
      ?auto_65830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65825 ?auto_65826 ) ) ( not ( = ?auto_65825 ?auto_65827 ) ) ( not ( = ?auto_65825 ?auto_65828 ) ) ( not ( = ?auto_65826 ?auto_65827 ) ) ( not ( = ?auto_65826 ?auto_65828 ) ) ( not ( = ?auto_65827 ?auto_65828 ) ) ( not ( = ?auto_65825 ?auto_65831 ) ) ( not ( = ?auto_65825 ?auto_65829 ) ) ( not ( = ?auto_65826 ?auto_65831 ) ) ( not ( = ?auto_65826 ?auto_65829 ) ) ( not ( = ?auto_65827 ?auto_65831 ) ) ( not ( = ?auto_65827 ?auto_65829 ) ) ( not ( = ?auto_65828 ?auto_65831 ) ) ( not ( = ?auto_65828 ?auto_65829 ) ) ( not ( = ?auto_65831 ?auto_65829 ) ) ( ON ?auto_65829 ?auto_65830 ) ( not ( = ?auto_65825 ?auto_65830 ) ) ( not ( = ?auto_65826 ?auto_65830 ) ) ( not ( = ?auto_65827 ?auto_65830 ) ) ( not ( = ?auto_65828 ?auto_65830 ) ) ( not ( = ?auto_65831 ?auto_65830 ) ) ( not ( = ?auto_65829 ?auto_65830 ) ) ( ON ?auto_65831 ?auto_65829 ) ( ON-TABLE ?auto_65830 ) ( ON ?auto_65828 ?auto_65831 ) ( ON ?auto_65827 ?auto_65828 ) ( ON ?auto_65826 ?auto_65827 ) ( CLEAR ?auto_65826 ) ( HOLDING ?auto_65825 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65825 )
      ( MAKE-3PILE ?auto_65825 ?auto_65826 ?auto_65827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65832 - BLOCK
      ?auto_65833 - BLOCK
      ?auto_65834 - BLOCK
    )
    :vars
    (
      ?auto_65836 - BLOCK
      ?auto_65838 - BLOCK
      ?auto_65835 - BLOCK
      ?auto_65837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65832 ?auto_65833 ) ) ( not ( = ?auto_65832 ?auto_65834 ) ) ( not ( = ?auto_65832 ?auto_65836 ) ) ( not ( = ?auto_65833 ?auto_65834 ) ) ( not ( = ?auto_65833 ?auto_65836 ) ) ( not ( = ?auto_65834 ?auto_65836 ) ) ( not ( = ?auto_65832 ?auto_65838 ) ) ( not ( = ?auto_65832 ?auto_65835 ) ) ( not ( = ?auto_65833 ?auto_65838 ) ) ( not ( = ?auto_65833 ?auto_65835 ) ) ( not ( = ?auto_65834 ?auto_65838 ) ) ( not ( = ?auto_65834 ?auto_65835 ) ) ( not ( = ?auto_65836 ?auto_65838 ) ) ( not ( = ?auto_65836 ?auto_65835 ) ) ( not ( = ?auto_65838 ?auto_65835 ) ) ( ON ?auto_65835 ?auto_65837 ) ( not ( = ?auto_65832 ?auto_65837 ) ) ( not ( = ?auto_65833 ?auto_65837 ) ) ( not ( = ?auto_65834 ?auto_65837 ) ) ( not ( = ?auto_65836 ?auto_65837 ) ) ( not ( = ?auto_65838 ?auto_65837 ) ) ( not ( = ?auto_65835 ?auto_65837 ) ) ( ON ?auto_65838 ?auto_65835 ) ( ON-TABLE ?auto_65837 ) ( ON ?auto_65836 ?auto_65838 ) ( ON ?auto_65834 ?auto_65836 ) ( ON ?auto_65833 ?auto_65834 ) ( ON ?auto_65832 ?auto_65833 ) ( CLEAR ?auto_65832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65837 ?auto_65835 ?auto_65838 ?auto_65836 ?auto_65834 ?auto_65833 )
      ( MAKE-3PILE ?auto_65832 ?auto_65833 ?auto_65834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65842 - BLOCK
      ?auto_65843 - BLOCK
      ?auto_65844 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_65844 ) ( CLEAR ?auto_65843 ) ( ON-TABLE ?auto_65842 ) ( ON ?auto_65843 ?auto_65842 ) ( not ( = ?auto_65842 ?auto_65843 ) ) ( not ( = ?auto_65842 ?auto_65844 ) ) ( not ( = ?auto_65843 ?auto_65844 ) ) )
    :subtasks
    ( ( !STACK ?auto_65844 ?auto_65843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65845 - BLOCK
      ?auto_65846 - BLOCK
      ?auto_65847 - BLOCK
    )
    :vars
    (
      ?auto_65848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_65846 ) ( ON-TABLE ?auto_65845 ) ( ON ?auto_65846 ?auto_65845 ) ( not ( = ?auto_65845 ?auto_65846 ) ) ( not ( = ?auto_65845 ?auto_65847 ) ) ( not ( = ?auto_65846 ?auto_65847 ) ) ( ON ?auto_65847 ?auto_65848 ) ( CLEAR ?auto_65847 ) ( HAND-EMPTY ) ( not ( = ?auto_65845 ?auto_65848 ) ) ( not ( = ?auto_65846 ?auto_65848 ) ) ( not ( = ?auto_65847 ?auto_65848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65847 ?auto_65848 )
      ( MAKE-3PILE ?auto_65845 ?auto_65846 ?auto_65847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65849 - BLOCK
      ?auto_65850 - BLOCK
      ?auto_65851 - BLOCK
    )
    :vars
    (
      ?auto_65852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65849 ) ( not ( = ?auto_65849 ?auto_65850 ) ) ( not ( = ?auto_65849 ?auto_65851 ) ) ( not ( = ?auto_65850 ?auto_65851 ) ) ( ON ?auto_65851 ?auto_65852 ) ( CLEAR ?auto_65851 ) ( not ( = ?auto_65849 ?auto_65852 ) ) ( not ( = ?auto_65850 ?auto_65852 ) ) ( not ( = ?auto_65851 ?auto_65852 ) ) ( HOLDING ?auto_65850 ) ( CLEAR ?auto_65849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65849 ?auto_65850 )
      ( MAKE-3PILE ?auto_65849 ?auto_65850 ?auto_65851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65853 - BLOCK
      ?auto_65854 - BLOCK
      ?auto_65855 - BLOCK
    )
    :vars
    (
      ?auto_65856 - BLOCK
      ?auto_65858 - BLOCK
      ?auto_65857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_65853 ) ( not ( = ?auto_65853 ?auto_65854 ) ) ( not ( = ?auto_65853 ?auto_65855 ) ) ( not ( = ?auto_65854 ?auto_65855 ) ) ( ON ?auto_65855 ?auto_65856 ) ( not ( = ?auto_65853 ?auto_65856 ) ) ( not ( = ?auto_65854 ?auto_65856 ) ) ( not ( = ?auto_65855 ?auto_65856 ) ) ( CLEAR ?auto_65853 ) ( ON ?auto_65854 ?auto_65855 ) ( CLEAR ?auto_65854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65858 ) ( ON ?auto_65857 ?auto_65858 ) ( ON ?auto_65856 ?auto_65857 ) ( not ( = ?auto_65858 ?auto_65857 ) ) ( not ( = ?auto_65858 ?auto_65856 ) ) ( not ( = ?auto_65858 ?auto_65855 ) ) ( not ( = ?auto_65858 ?auto_65854 ) ) ( not ( = ?auto_65857 ?auto_65856 ) ) ( not ( = ?auto_65857 ?auto_65855 ) ) ( not ( = ?auto_65857 ?auto_65854 ) ) ( not ( = ?auto_65853 ?auto_65858 ) ) ( not ( = ?auto_65853 ?auto_65857 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65858 ?auto_65857 ?auto_65856 ?auto_65855 )
      ( MAKE-3PILE ?auto_65853 ?auto_65854 ?auto_65855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65859 - BLOCK
      ?auto_65860 - BLOCK
      ?auto_65861 - BLOCK
    )
    :vars
    (
      ?auto_65862 - BLOCK
      ?auto_65864 - BLOCK
      ?auto_65863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65859 ?auto_65860 ) ) ( not ( = ?auto_65859 ?auto_65861 ) ) ( not ( = ?auto_65860 ?auto_65861 ) ) ( ON ?auto_65861 ?auto_65862 ) ( not ( = ?auto_65859 ?auto_65862 ) ) ( not ( = ?auto_65860 ?auto_65862 ) ) ( not ( = ?auto_65861 ?auto_65862 ) ) ( ON ?auto_65860 ?auto_65861 ) ( CLEAR ?auto_65860 ) ( ON-TABLE ?auto_65864 ) ( ON ?auto_65863 ?auto_65864 ) ( ON ?auto_65862 ?auto_65863 ) ( not ( = ?auto_65864 ?auto_65863 ) ) ( not ( = ?auto_65864 ?auto_65862 ) ) ( not ( = ?auto_65864 ?auto_65861 ) ) ( not ( = ?auto_65864 ?auto_65860 ) ) ( not ( = ?auto_65863 ?auto_65862 ) ) ( not ( = ?auto_65863 ?auto_65861 ) ) ( not ( = ?auto_65863 ?auto_65860 ) ) ( not ( = ?auto_65859 ?auto_65864 ) ) ( not ( = ?auto_65859 ?auto_65863 ) ) ( HOLDING ?auto_65859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65859 )
      ( MAKE-3PILE ?auto_65859 ?auto_65860 ?auto_65861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65865 - BLOCK
      ?auto_65866 - BLOCK
      ?auto_65867 - BLOCK
    )
    :vars
    (
      ?auto_65869 - BLOCK
      ?auto_65868 - BLOCK
      ?auto_65870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65865 ?auto_65866 ) ) ( not ( = ?auto_65865 ?auto_65867 ) ) ( not ( = ?auto_65866 ?auto_65867 ) ) ( ON ?auto_65867 ?auto_65869 ) ( not ( = ?auto_65865 ?auto_65869 ) ) ( not ( = ?auto_65866 ?auto_65869 ) ) ( not ( = ?auto_65867 ?auto_65869 ) ) ( ON ?auto_65866 ?auto_65867 ) ( ON-TABLE ?auto_65868 ) ( ON ?auto_65870 ?auto_65868 ) ( ON ?auto_65869 ?auto_65870 ) ( not ( = ?auto_65868 ?auto_65870 ) ) ( not ( = ?auto_65868 ?auto_65869 ) ) ( not ( = ?auto_65868 ?auto_65867 ) ) ( not ( = ?auto_65868 ?auto_65866 ) ) ( not ( = ?auto_65870 ?auto_65869 ) ) ( not ( = ?auto_65870 ?auto_65867 ) ) ( not ( = ?auto_65870 ?auto_65866 ) ) ( not ( = ?auto_65865 ?auto_65868 ) ) ( not ( = ?auto_65865 ?auto_65870 ) ) ( ON ?auto_65865 ?auto_65866 ) ( CLEAR ?auto_65865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65868 ?auto_65870 ?auto_65869 ?auto_65867 ?auto_65866 )
      ( MAKE-3PILE ?auto_65865 ?auto_65866 ?auto_65867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65871 - BLOCK
      ?auto_65872 - BLOCK
      ?auto_65873 - BLOCK
    )
    :vars
    (
      ?auto_65875 - BLOCK
      ?auto_65874 - BLOCK
      ?auto_65876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65871 ?auto_65872 ) ) ( not ( = ?auto_65871 ?auto_65873 ) ) ( not ( = ?auto_65872 ?auto_65873 ) ) ( ON ?auto_65873 ?auto_65875 ) ( not ( = ?auto_65871 ?auto_65875 ) ) ( not ( = ?auto_65872 ?auto_65875 ) ) ( not ( = ?auto_65873 ?auto_65875 ) ) ( ON ?auto_65872 ?auto_65873 ) ( ON-TABLE ?auto_65874 ) ( ON ?auto_65876 ?auto_65874 ) ( ON ?auto_65875 ?auto_65876 ) ( not ( = ?auto_65874 ?auto_65876 ) ) ( not ( = ?auto_65874 ?auto_65875 ) ) ( not ( = ?auto_65874 ?auto_65873 ) ) ( not ( = ?auto_65874 ?auto_65872 ) ) ( not ( = ?auto_65876 ?auto_65875 ) ) ( not ( = ?auto_65876 ?auto_65873 ) ) ( not ( = ?auto_65876 ?auto_65872 ) ) ( not ( = ?auto_65871 ?auto_65874 ) ) ( not ( = ?auto_65871 ?auto_65876 ) ) ( HOLDING ?auto_65871 ) ( CLEAR ?auto_65872 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65874 ?auto_65876 ?auto_65875 ?auto_65873 ?auto_65872 ?auto_65871 )
      ( MAKE-3PILE ?auto_65871 ?auto_65872 ?auto_65873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65877 - BLOCK
      ?auto_65878 - BLOCK
      ?auto_65879 - BLOCK
    )
    :vars
    (
      ?auto_65881 - BLOCK
      ?auto_65880 - BLOCK
      ?auto_65882 - BLOCK
      ?auto_65883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65877 ?auto_65878 ) ) ( not ( = ?auto_65877 ?auto_65879 ) ) ( not ( = ?auto_65878 ?auto_65879 ) ) ( ON ?auto_65879 ?auto_65881 ) ( not ( = ?auto_65877 ?auto_65881 ) ) ( not ( = ?auto_65878 ?auto_65881 ) ) ( not ( = ?auto_65879 ?auto_65881 ) ) ( ON ?auto_65878 ?auto_65879 ) ( ON-TABLE ?auto_65880 ) ( ON ?auto_65882 ?auto_65880 ) ( ON ?auto_65881 ?auto_65882 ) ( not ( = ?auto_65880 ?auto_65882 ) ) ( not ( = ?auto_65880 ?auto_65881 ) ) ( not ( = ?auto_65880 ?auto_65879 ) ) ( not ( = ?auto_65880 ?auto_65878 ) ) ( not ( = ?auto_65882 ?auto_65881 ) ) ( not ( = ?auto_65882 ?auto_65879 ) ) ( not ( = ?auto_65882 ?auto_65878 ) ) ( not ( = ?auto_65877 ?auto_65880 ) ) ( not ( = ?auto_65877 ?auto_65882 ) ) ( CLEAR ?auto_65878 ) ( ON ?auto_65877 ?auto_65883 ) ( CLEAR ?auto_65877 ) ( HAND-EMPTY ) ( not ( = ?auto_65877 ?auto_65883 ) ) ( not ( = ?auto_65878 ?auto_65883 ) ) ( not ( = ?auto_65879 ?auto_65883 ) ) ( not ( = ?auto_65881 ?auto_65883 ) ) ( not ( = ?auto_65880 ?auto_65883 ) ) ( not ( = ?auto_65882 ?auto_65883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65877 ?auto_65883 )
      ( MAKE-3PILE ?auto_65877 ?auto_65878 ?auto_65879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65884 - BLOCK
      ?auto_65885 - BLOCK
      ?auto_65886 - BLOCK
    )
    :vars
    (
      ?auto_65889 - BLOCK
      ?auto_65887 - BLOCK
      ?auto_65888 - BLOCK
      ?auto_65890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65884 ?auto_65885 ) ) ( not ( = ?auto_65884 ?auto_65886 ) ) ( not ( = ?auto_65885 ?auto_65886 ) ) ( ON ?auto_65886 ?auto_65889 ) ( not ( = ?auto_65884 ?auto_65889 ) ) ( not ( = ?auto_65885 ?auto_65889 ) ) ( not ( = ?auto_65886 ?auto_65889 ) ) ( ON-TABLE ?auto_65887 ) ( ON ?auto_65888 ?auto_65887 ) ( ON ?auto_65889 ?auto_65888 ) ( not ( = ?auto_65887 ?auto_65888 ) ) ( not ( = ?auto_65887 ?auto_65889 ) ) ( not ( = ?auto_65887 ?auto_65886 ) ) ( not ( = ?auto_65887 ?auto_65885 ) ) ( not ( = ?auto_65888 ?auto_65889 ) ) ( not ( = ?auto_65888 ?auto_65886 ) ) ( not ( = ?auto_65888 ?auto_65885 ) ) ( not ( = ?auto_65884 ?auto_65887 ) ) ( not ( = ?auto_65884 ?auto_65888 ) ) ( ON ?auto_65884 ?auto_65890 ) ( CLEAR ?auto_65884 ) ( not ( = ?auto_65884 ?auto_65890 ) ) ( not ( = ?auto_65885 ?auto_65890 ) ) ( not ( = ?auto_65886 ?auto_65890 ) ) ( not ( = ?auto_65889 ?auto_65890 ) ) ( not ( = ?auto_65887 ?auto_65890 ) ) ( not ( = ?auto_65888 ?auto_65890 ) ) ( HOLDING ?auto_65885 ) ( CLEAR ?auto_65886 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65887 ?auto_65888 ?auto_65889 ?auto_65886 ?auto_65885 )
      ( MAKE-3PILE ?auto_65884 ?auto_65885 ?auto_65886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65891 - BLOCK
      ?auto_65892 - BLOCK
      ?auto_65893 - BLOCK
    )
    :vars
    (
      ?auto_65894 - BLOCK
      ?auto_65897 - BLOCK
      ?auto_65895 - BLOCK
      ?auto_65896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65891 ?auto_65892 ) ) ( not ( = ?auto_65891 ?auto_65893 ) ) ( not ( = ?auto_65892 ?auto_65893 ) ) ( ON ?auto_65893 ?auto_65894 ) ( not ( = ?auto_65891 ?auto_65894 ) ) ( not ( = ?auto_65892 ?auto_65894 ) ) ( not ( = ?auto_65893 ?auto_65894 ) ) ( ON-TABLE ?auto_65897 ) ( ON ?auto_65895 ?auto_65897 ) ( ON ?auto_65894 ?auto_65895 ) ( not ( = ?auto_65897 ?auto_65895 ) ) ( not ( = ?auto_65897 ?auto_65894 ) ) ( not ( = ?auto_65897 ?auto_65893 ) ) ( not ( = ?auto_65897 ?auto_65892 ) ) ( not ( = ?auto_65895 ?auto_65894 ) ) ( not ( = ?auto_65895 ?auto_65893 ) ) ( not ( = ?auto_65895 ?auto_65892 ) ) ( not ( = ?auto_65891 ?auto_65897 ) ) ( not ( = ?auto_65891 ?auto_65895 ) ) ( ON ?auto_65891 ?auto_65896 ) ( not ( = ?auto_65891 ?auto_65896 ) ) ( not ( = ?auto_65892 ?auto_65896 ) ) ( not ( = ?auto_65893 ?auto_65896 ) ) ( not ( = ?auto_65894 ?auto_65896 ) ) ( not ( = ?auto_65897 ?auto_65896 ) ) ( not ( = ?auto_65895 ?auto_65896 ) ) ( CLEAR ?auto_65893 ) ( ON ?auto_65892 ?auto_65891 ) ( CLEAR ?auto_65892 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65896 ?auto_65891 )
      ( MAKE-3PILE ?auto_65891 ?auto_65892 ?auto_65893 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65898 - BLOCK
      ?auto_65899 - BLOCK
      ?auto_65900 - BLOCK
    )
    :vars
    (
      ?auto_65904 - BLOCK
      ?auto_65903 - BLOCK
      ?auto_65902 - BLOCK
      ?auto_65901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65898 ?auto_65899 ) ) ( not ( = ?auto_65898 ?auto_65900 ) ) ( not ( = ?auto_65899 ?auto_65900 ) ) ( not ( = ?auto_65898 ?auto_65904 ) ) ( not ( = ?auto_65899 ?auto_65904 ) ) ( not ( = ?auto_65900 ?auto_65904 ) ) ( ON-TABLE ?auto_65903 ) ( ON ?auto_65902 ?auto_65903 ) ( ON ?auto_65904 ?auto_65902 ) ( not ( = ?auto_65903 ?auto_65902 ) ) ( not ( = ?auto_65903 ?auto_65904 ) ) ( not ( = ?auto_65903 ?auto_65900 ) ) ( not ( = ?auto_65903 ?auto_65899 ) ) ( not ( = ?auto_65902 ?auto_65904 ) ) ( not ( = ?auto_65902 ?auto_65900 ) ) ( not ( = ?auto_65902 ?auto_65899 ) ) ( not ( = ?auto_65898 ?auto_65903 ) ) ( not ( = ?auto_65898 ?auto_65902 ) ) ( ON ?auto_65898 ?auto_65901 ) ( not ( = ?auto_65898 ?auto_65901 ) ) ( not ( = ?auto_65899 ?auto_65901 ) ) ( not ( = ?auto_65900 ?auto_65901 ) ) ( not ( = ?auto_65904 ?auto_65901 ) ) ( not ( = ?auto_65903 ?auto_65901 ) ) ( not ( = ?auto_65902 ?auto_65901 ) ) ( ON ?auto_65899 ?auto_65898 ) ( CLEAR ?auto_65899 ) ( ON-TABLE ?auto_65901 ) ( HOLDING ?auto_65900 ) ( CLEAR ?auto_65904 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65903 ?auto_65902 ?auto_65904 ?auto_65900 )
      ( MAKE-3PILE ?auto_65898 ?auto_65899 ?auto_65900 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65905 - BLOCK
      ?auto_65906 - BLOCK
      ?auto_65907 - BLOCK
    )
    :vars
    (
      ?auto_65910 - BLOCK
      ?auto_65911 - BLOCK
      ?auto_65908 - BLOCK
      ?auto_65909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65905 ?auto_65906 ) ) ( not ( = ?auto_65905 ?auto_65907 ) ) ( not ( = ?auto_65906 ?auto_65907 ) ) ( not ( = ?auto_65905 ?auto_65910 ) ) ( not ( = ?auto_65906 ?auto_65910 ) ) ( not ( = ?auto_65907 ?auto_65910 ) ) ( ON-TABLE ?auto_65911 ) ( ON ?auto_65908 ?auto_65911 ) ( ON ?auto_65910 ?auto_65908 ) ( not ( = ?auto_65911 ?auto_65908 ) ) ( not ( = ?auto_65911 ?auto_65910 ) ) ( not ( = ?auto_65911 ?auto_65907 ) ) ( not ( = ?auto_65911 ?auto_65906 ) ) ( not ( = ?auto_65908 ?auto_65910 ) ) ( not ( = ?auto_65908 ?auto_65907 ) ) ( not ( = ?auto_65908 ?auto_65906 ) ) ( not ( = ?auto_65905 ?auto_65911 ) ) ( not ( = ?auto_65905 ?auto_65908 ) ) ( ON ?auto_65905 ?auto_65909 ) ( not ( = ?auto_65905 ?auto_65909 ) ) ( not ( = ?auto_65906 ?auto_65909 ) ) ( not ( = ?auto_65907 ?auto_65909 ) ) ( not ( = ?auto_65910 ?auto_65909 ) ) ( not ( = ?auto_65911 ?auto_65909 ) ) ( not ( = ?auto_65908 ?auto_65909 ) ) ( ON ?auto_65906 ?auto_65905 ) ( ON-TABLE ?auto_65909 ) ( CLEAR ?auto_65910 ) ( ON ?auto_65907 ?auto_65906 ) ( CLEAR ?auto_65907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65909 ?auto_65905 ?auto_65906 )
      ( MAKE-3PILE ?auto_65905 ?auto_65906 ?auto_65907 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65912 - BLOCK
      ?auto_65913 - BLOCK
      ?auto_65914 - BLOCK
    )
    :vars
    (
      ?auto_65916 - BLOCK
      ?auto_65915 - BLOCK
      ?auto_65918 - BLOCK
      ?auto_65917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65912 ?auto_65913 ) ) ( not ( = ?auto_65912 ?auto_65914 ) ) ( not ( = ?auto_65913 ?auto_65914 ) ) ( not ( = ?auto_65912 ?auto_65916 ) ) ( not ( = ?auto_65913 ?auto_65916 ) ) ( not ( = ?auto_65914 ?auto_65916 ) ) ( ON-TABLE ?auto_65915 ) ( ON ?auto_65918 ?auto_65915 ) ( not ( = ?auto_65915 ?auto_65918 ) ) ( not ( = ?auto_65915 ?auto_65916 ) ) ( not ( = ?auto_65915 ?auto_65914 ) ) ( not ( = ?auto_65915 ?auto_65913 ) ) ( not ( = ?auto_65918 ?auto_65916 ) ) ( not ( = ?auto_65918 ?auto_65914 ) ) ( not ( = ?auto_65918 ?auto_65913 ) ) ( not ( = ?auto_65912 ?auto_65915 ) ) ( not ( = ?auto_65912 ?auto_65918 ) ) ( ON ?auto_65912 ?auto_65917 ) ( not ( = ?auto_65912 ?auto_65917 ) ) ( not ( = ?auto_65913 ?auto_65917 ) ) ( not ( = ?auto_65914 ?auto_65917 ) ) ( not ( = ?auto_65916 ?auto_65917 ) ) ( not ( = ?auto_65915 ?auto_65917 ) ) ( not ( = ?auto_65918 ?auto_65917 ) ) ( ON ?auto_65913 ?auto_65912 ) ( ON-TABLE ?auto_65917 ) ( ON ?auto_65914 ?auto_65913 ) ( CLEAR ?auto_65914 ) ( HOLDING ?auto_65916 ) ( CLEAR ?auto_65918 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65915 ?auto_65918 ?auto_65916 )
      ( MAKE-3PILE ?auto_65912 ?auto_65913 ?auto_65914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65919 - BLOCK
      ?auto_65920 - BLOCK
      ?auto_65921 - BLOCK
    )
    :vars
    (
      ?auto_65922 - BLOCK
      ?auto_65925 - BLOCK
      ?auto_65923 - BLOCK
      ?auto_65924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65919 ?auto_65920 ) ) ( not ( = ?auto_65919 ?auto_65921 ) ) ( not ( = ?auto_65920 ?auto_65921 ) ) ( not ( = ?auto_65919 ?auto_65922 ) ) ( not ( = ?auto_65920 ?auto_65922 ) ) ( not ( = ?auto_65921 ?auto_65922 ) ) ( ON-TABLE ?auto_65925 ) ( ON ?auto_65923 ?auto_65925 ) ( not ( = ?auto_65925 ?auto_65923 ) ) ( not ( = ?auto_65925 ?auto_65922 ) ) ( not ( = ?auto_65925 ?auto_65921 ) ) ( not ( = ?auto_65925 ?auto_65920 ) ) ( not ( = ?auto_65923 ?auto_65922 ) ) ( not ( = ?auto_65923 ?auto_65921 ) ) ( not ( = ?auto_65923 ?auto_65920 ) ) ( not ( = ?auto_65919 ?auto_65925 ) ) ( not ( = ?auto_65919 ?auto_65923 ) ) ( ON ?auto_65919 ?auto_65924 ) ( not ( = ?auto_65919 ?auto_65924 ) ) ( not ( = ?auto_65920 ?auto_65924 ) ) ( not ( = ?auto_65921 ?auto_65924 ) ) ( not ( = ?auto_65922 ?auto_65924 ) ) ( not ( = ?auto_65925 ?auto_65924 ) ) ( not ( = ?auto_65923 ?auto_65924 ) ) ( ON ?auto_65920 ?auto_65919 ) ( ON-TABLE ?auto_65924 ) ( ON ?auto_65921 ?auto_65920 ) ( CLEAR ?auto_65923 ) ( ON ?auto_65922 ?auto_65921 ) ( CLEAR ?auto_65922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65924 ?auto_65919 ?auto_65920 ?auto_65921 )
      ( MAKE-3PILE ?auto_65919 ?auto_65920 ?auto_65921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65926 - BLOCK
      ?auto_65927 - BLOCK
      ?auto_65928 - BLOCK
    )
    :vars
    (
      ?auto_65932 - BLOCK
      ?auto_65931 - BLOCK
      ?auto_65929 - BLOCK
      ?auto_65930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65926 ?auto_65927 ) ) ( not ( = ?auto_65926 ?auto_65928 ) ) ( not ( = ?auto_65927 ?auto_65928 ) ) ( not ( = ?auto_65926 ?auto_65932 ) ) ( not ( = ?auto_65927 ?auto_65932 ) ) ( not ( = ?auto_65928 ?auto_65932 ) ) ( ON-TABLE ?auto_65931 ) ( not ( = ?auto_65931 ?auto_65929 ) ) ( not ( = ?auto_65931 ?auto_65932 ) ) ( not ( = ?auto_65931 ?auto_65928 ) ) ( not ( = ?auto_65931 ?auto_65927 ) ) ( not ( = ?auto_65929 ?auto_65932 ) ) ( not ( = ?auto_65929 ?auto_65928 ) ) ( not ( = ?auto_65929 ?auto_65927 ) ) ( not ( = ?auto_65926 ?auto_65931 ) ) ( not ( = ?auto_65926 ?auto_65929 ) ) ( ON ?auto_65926 ?auto_65930 ) ( not ( = ?auto_65926 ?auto_65930 ) ) ( not ( = ?auto_65927 ?auto_65930 ) ) ( not ( = ?auto_65928 ?auto_65930 ) ) ( not ( = ?auto_65932 ?auto_65930 ) ) ( not ( = ?auto_65931 ?auto_65930 ) ) ( not ( = ?auto_65929 ?auto_65930 ) ) ( ON ?auto_65927 ?auto_65926 ) ( ON-TABLE ?auto_65930 ) ( ON ?auto_65928 ?auto_65927 ) ( ON ?auto_65932 ?auto_65928 ) ( CLEAR ?auto_65932 ) ( HOLDING ?auto_65929 ) ( CLEAR ?auto_65931 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65931 ?auto_65929 )
      ( MAKE-3PILE ?auto_65926 ?auto_65927 ?auto_65928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65933 - BLOCK
      ?auto_65934 - BLOCK
      ?auto_65935 - BLOCK
    )
    :vars
    (
      ?auto_65938 - BLOCK
      ?auto_65937 - BLOCK
      ?auto_65939 - BLOCK
      ?auto_65936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65933 ?auto_65934 ) ) ( not ( = ?auto_65933 ?auto_65935 ) ) ( not ( = ?auto_65934 ?auto_65935 ) ) ( not ( = ?auto_65933 ?auto_65938 ) ) ( not ( = ?auto_65934 ?auto_65938 ) ) ( not ( = ?auto_65935 ?auto_65938 ) ) ( ON-TABLE ?auto_65937 ) ( not ( = ?auto_65937 ?auto_65939 ) ) ( not ( = ?auto_65937 ?auto_65938 ) ) ( not ( = ?auto_65937 ?auto_65935 ) ) ( not ( = ?auto_65937 ?auto_65934 ) ) ( not ( = ?auto_65939 ?auto_65938 ) ) ( not ( = ?auto_65939 ?auto_65935 ) ) ( not ( = ?auto_65939 ?auto_65934 ) ) ( not ( = ?auto_65933 ?auto_65937 ) ) ( not ( = ?auto_65933 ?auto_65939 ) ) ( ON ?auto_65933 ?auto_65936 ) ( not ( = ?auto_65933 ?auto_65936 ) ) ( not ( = ?auto_65934 ?auto_65936 ) ) ( not ( = ?auto_65935 ?auto_65936 ) ) ( not ( = ?auto_65938 ?auto_65936 ) ) ( not ( = ?auto_65937 ?auto_65936 ) ) ( not ( = ?auto_65939 ?auto_65936 ) ) ( ON ?auto_65934 ?auto_65933 ) ( ON-TABLE ?auto_65936 ) ( ON ?auto_65935 ?auto_65934 ) ( ON ?auto_65938 ?auto_65935 ) ( CLEAR ?auto_65937 ) ( ON ?auto_65939 ?auto_65938 ) ( CLEAR ?auto_65939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65936 ?auto_65933 ?auto_65934 ?auto_65935 ?auto_65938 )
      ( MAKE-3PILE ?auto_65933 ?auto_65934 ?auto_65935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65940 - BLOCK
      ?auto_65941 - BLOCK
      ?auto_65942 - BLOCK
    )
    :vars
    (
      ?auto_65943 - BLOCK
      ?auto_65944 - BLOCK
      ?auto_65945 - BLOCK
      ?auto_65946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65940 ?auto_65941 ) ) ( not ( = ?auto_65940 ?auto_65942 ) ) ( not ( = ?auto_65941 ?auto_65942 ) ) ( not ( = ?auto_65940 ?auto_65943 ) ) ( not ( = ?auto_65941 ?auto_65943 ) ) ( not ( = ?auto_65942 ?auto_65943 ) ) ( not ( = ?auto_65944 ?auto_65945 ) ) ( not ( = ?auto_65944 ?auto_65943 ) ) ( not ( = ?auto_65944 ?auto_65942 ) ) ( not ( = ?auto_65944 ?auto_65941 ) ) ( not ( = ?auto_65945 ?auto_65943 ) ) ( not ( = ?auto_65945 ?auto_65942 ) ) ( not ( = ?auto_65945 ?auto_65941 ) ) ( not ( = ?auto_65940 ?auto_65944 ) ) ( not ( = ?auto_65940 ?auto_65945 ) ) ( ON ?auto_65940 ?auto_65946 ) ( not ( = ?auto_65940 ?auto_65946 ) ) ( not ( = ?auto_65941 ?auto_65946 ) ) ( not ( = ?auto_65942 ?auto_65946 ) ) ( not ( = ?auto_65943 ?auto_65946 ) ) ( not ( = ?auto_65944 ?auto_65946 ) ) ( not ( = ?auto_65945 ?auto_65946 ) ) ( ON ?auto_65941 ?auto_65940 ) ( ON-TABLE ?auto_65946 ) ( ON ?auto_65942 ?auto_65941 ) ( ON ?auto_65943 ?auto_65942 ) ( ON ?auto_65945 ?auto_65943 ) ( CLEAR ?auto_65945 ) ( HOLDING ?auto_65944 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65944 )
      ( MAKE-3PILE ?auto_65940 ?auto_65941 ?auto_65942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_65947 - BLOCK
      ?auto_65948 - BLOCK
      ?auto_65949 - BLOCK
    )
    :vars
    (
      ?auto_65950 - BLOCK
      ?auto_65953 - BLOCK
      ?auto_65951 - BLOCK
      ?auto_65952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65947 ?auto_65948 ) ) ( not ( = ?auto_65947 ?auto_65949 ) ) ( not ( = ?auto_65948 ?auto_65949 ) ) ( not ( = ?auto_65947 ?auto_65950 ) ) ( not ( = ?auto_65948 ?auto_65950 ) ) ( not ( = ?auto_65949 ?auto_65950 ) ) ( not ( = ?auto_65953 ?auto_65951 ) ) ( not ( = ?auto_65953 ?auto_65950 ) ) ( not ( = ?auto_65953 ?auto_65949 ) ) ( not ( = ?auto_65953 ?auto_65948 ) ) ( not ( = ?auto_65951 ?auto_65950 ) ) ( not ( = ?auto_65951 ?auto_65949 ) ) ( not ( = ?auto_65951 ?auto_65948 ) ) ( not ( = ?auto_65947 ?auto_65953 ) ) ( not ( = ?auto_65947 ?auto_65951 ) ) ( ON ?auto_65947 ?auto_65952 ) ( not ( = ?auto_65947 ?auto_65952 ) ) ( not ( = ?auto_65948 ?auto_65952 ) ) ( not ( = ?auto_65949 ?auto_65952 ) ) ( not ( = ?auto_65950 ?auto_65952 ) ) ( not ( = ?auto_65953 ?auto_65952 ) ) ( not ( = ?auto_65951 ?auto_65952 ) ) ( ON ?auto_65948 ?auto_65947 ) ( ON-TABLE ?auto_65952 ) ( ON ?auto_65949 ?auto_65948 ) ( ON ?auto_65950 ?auto_65949 ) ( ON ?auto_65951 ?auto_65950 ) ( ON ?auto_65953 ?auto_65951 ) ( CLEAR ?auto_65953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65952 ?auto_65947 ?auto_65948 ?auto_65949 ?auto_65950 ?auto_65951 )
      ( MAKE-3PILE ?auto_65947 ?auto_65948 ?auto_65949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65956 - BLOCK
      ?auto_65957 - BLOCK
    )
    :vars
    (
      ?auto_65958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65958 ?auto_65957 ) ( CLEAR ?auto_65958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_65956 ) ( ON ?auto_65957 ?auto_65956 ) ( not ( = ?auto_65956 ?auto_65957 ) ) ( not ( = ?auto_65956 ?auto_65958 ) ) ( not ( = ?auto_65957 ?auto_65958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65958 ?auto_65957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65959 - BLOCK
      ?auto_65960 - BLOCK
    )
    :vars
    (
      ?auto_65961 - BLOCK
      ?auto_65962 - BLOCK
      ?auto_65963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65961 ?auto_65960 ) ( CLEAR ?auto_65961 ) ( ON-TABLE ?auto_65959 ) ( ON ?auto_65960 ?auto_65959 ) ( not ( = ?auto_65959 ?auto_65960 ) ) ( not ( = ?auto_65959 ?auto_65961 ) ) ( not ( = ?auto_65960 ?auto_65961 ) ) ( HOLDING ?auto_65962 ) ( CLEAR ?auto_65963 ) ( not ( = ?auto_65959 ?auto_65962 ) ) ( not ( = ?auto_65959 ?auto_65963 ) ) ( not ( = ?auto_65960 ?auto_65962 ) ) ( not ( = ?auto_65960 ?auto_65963 ) ) ( not ( = ?auto_65961 ?auto_65962 ) ) ( not ( = ?auto_65961 ?auto_65963 ) ) ( not ( = ?auto_65962 ?auto_65963 ) ) )
    :subtasks
    ( ( !STACK ?auto_65962 ?auto_65963 )
      ( MAKE-2PILE ?auto_65959 ?auto_65960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65964 - BLOCK
      ?auto_65965 - BLOCK
    )
    :vars
    (
      ?auto_65968 - BLOCK
      ?auto_65966 - BLOCK
      ?auto_65967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65968 ?auto_65965 ) ( ON-TABLE ?auto_65964 ) ( ON ?auto_65965 ?auto_65964 ) ( not ( = ?auto_65964 ?auto_65965 ) ) ( not ( = ?auto_65964 ?auto_65968 ) ) ( not ( = ?auto_65965 ?auto_65968 ) ) ( CLEAR ?auto_65966 ) ( not ( = ?auto_65964 ?auto_65967 ) ) ( not ( = ?auto_65964 ?auto_65966 ) ) ( not ( = ?auto_65965 ?auto_65967 ) ) ( not ( = ?auto_65965 ?auto_65966 ) ) ( not ( = ?auto_65968 ?auto_65967 ) ) ( not ( = ?auto_65968 ?auto_65966 ) ) ( not ( = ?auto_65967 ?auto_65966 ) ) ( ON ?auto_65967 ?auto_65968 ) ( CLEAR ?auto_65967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_65964 ?auto_65965 ?auto_65968 )
      ( MAKE-2PILE ?auto_65964 ?auto_65965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65969 - BLOCK
      ?auto_65970 - BLOCK
    )
    :vars
    (
      ?auto_65972 - BLOCK
      ?auto_65971 - BLOCK
      ?auto_65973 - BLOCK
      ?auto_65974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65972 ?auto_65970 ) ( ON-TABLE ?auto_65969 ) ( ON ?auto_65970 ?auto_65969 ) ( not ( = ?auto_65969 ?auto_65970 ) ) ( not ( = ?auto_65969 ?auto_65972 ) ) ( not ( = ?auto_65970 ?auto_65972 ) ) ( not ( = ?auto_65969 ?auto_65971 ) ) ( not ( = ?auto_65969 ?auto_65973 ) ) ( not ( = ?auto_65970 ?auto_65971 ) ) ( not ( = ?auto_65970 ?auto_65973 ) ) ( not ( = ?auto_65972 ?auto_65971 ) ) ( not ( = ?auto_65972 ?auto_65973 ) ) ( not ( = ?auto_65971 ?auto_65973 ) ) ( ON ?auto_65971 ?auto_65972 ) ( CLEAR ?auto_65971 ) ( HOLDING ?auto_65973 ) ( CLEAR ?auto_65974 ) ( ON-TABLE ?auto_65974 ) ( not ( = ?auto_65974 ?auto_65973 ) ) ( not ( = ?auto_65969 ?auto_65974 ) ) ( not ( = ?auto_65970 ?auto_65974 ) ) ( not ( = ?auto_65972 ?auto_65974 ) ) ( not ( = ?auto_65971 ?auto_65974 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_65974 ?auto_65973 )
      ( MAKE-2PILE ?auto_65969 ?auto_65970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65975 - BLOCK
      ?auto_65976 - BLOCK
    )
    :vars
    (
      ?auto_65978 - BLOCK
      ?auto_65980 - BLOCK
      ?auto_65977 - BLOCK
      ?auto_65979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65978 ?auto_65976 ) ( ON-TABLE ?auto_65975 ) ( ON ?auto_65976 ?auto_65975 ) ( not ( = ?auto_65975 ?auto_65976 ) ) ( not ( = ?auto_65975 ?auto_65978 ) ) ( not ( = ?auto_65976 ?auto_65978 ) ) ( not ( = ?auto_65975 ?auto_65980 ) ) ( not ( = ?auto_65975 ?auto_65977 ) ) ( not ( = ?auto_65976 ?auto_65980 ) ) ( not ( = ?auto_65976 ?auto_65977 ) ) ( not ( = ?auto_65978 ?auto_65980 ) ) ( not ( = ?auto_65978 ?auto_65977 ) ) ( not ( = ?auto_65980 ?auto_65977 ) ) ( ON ?auto_65980 ?auto_65978 ) ( CLEAR ?auto_65979 ) ( ON-TABLE ?auto_65979 ) ( not ( = ?auto_65979 ?auto_65977 ) ) ( not ( = ?auto_65975 ?auto_65979 ) ) ( not ( = ?auto_65976 ?auto_65979 ) ) ( not ( = ?auto_65978 ?auto_65979 ) ) ( not ( = ?auto_65980 ?auto_65979 ) ) ( ON ?auto_65977 ?auto_65980 ) ( CLEAR ?auto_65977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_65975 ?auto_65976 ?auto_65978 ?auto_65980 )
      ( MAKE-2PILE ?auto_65975 ?auto_65976 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65981 - BLOCK
      ?auto_65982 - BLOCK
    )
    :vars
    (
      ?auto_65984 - BLOCK
      ?auto_65985 - BLOCK
      ?auto_65986 - BLOCK
      ?auto_65983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65984 ?auto_65982 ) ( ON-TABLE ?auto_65981 ) ( ON ?auto_65982 ?auto_65981 ) ( not ( = ?auto_65981 ?auto_65982 ) ) ( not ( = ?auto_65981 ?auto_65984 ) ) ( not ( = ?auto_65982 ?auto_65984 ) ) ( not ( = ?auto_65981 ?auto_65985 ) ) ( not ( = ?auto_65981 ?auto_65986 ) ) ( not ( = ?auto_65982 ?auto_65985 ) ) ( not ( = ?auto_65982 ?auto_65986 ) ) ( not ( = ?auto_65984 ?auto_65985 ) ) ( not ( = ?auto_65984 ?auto_65986 ) ) ( not ( = ?auto_65985 ?auto_65986 ) ) ( ON ?auto_65985 ?auto_65984 ) ( not ( = ?auto_65983 ?auto_65986 ) ) ( not ( = ?auto_65981 ?auto_65983 ) ) ( not ( = ?auto_65982 ?auto_65983 ) ) ( not ( = ?auto_65984 ?auto_65983 ) ) ( not ( = ?auto_65985 ?auto_65983 ) ) ( ON ?auto_65986 ?auto_65985 ) ( CLEAR ?auto_65986 ) ( HOLDING ?auto_65983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_65983 )
      ( MAKE-2PILE ?auto_65981 ?auto_65982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65987 - BLOCK
      ?auto_65988 - BLOCK
    )
    :vars
    (
      ?auto_65992 - BLOCK
      ?auto_65990 - BLOCK
      ?auto_65991 - BLOCK
      ?auto_65989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65992 ?auto_65988 ) ( ON-TABLE ?auto_65987 ) ( ON ?auto_65988 ?auto_65987 ) ( not ( = ?auto_65987 ?auto_65988 ) ) ( not ( = ?auto_65987 ?auto_65992 ) ) ( not ( = ?auto_65988 ?auto_65992 ) ) ( not ( = ?auto_65987 ?auto_65990 ) ) ( not ( = ?auto_65987 ?auto_65991 ) ) ( not ( = ?auto_65988 ?auto_65990 ) ) ( not ( = ?auto_65988 ?auto_65991 ) ) ( not ( = ?auto_65992 ?auto_65990 ) ) ( not ( = ?auto_65992 ?auto_65991 ) ) ( not ( = ?auto_65990 ?auto_65991 ) ) ( ON ?auto_65990 ?auto_65992 ) ( not ( = ?auto_65989 ?auto_65991 ) ) ( not ( = ?auto_65987 ?auto_65989 ) ) ( not ( = ?auto_65988 ?auto_65989 ) ) ( not ( = ?auto_65992 ?auto_65989 ) ) ( not ( = ?auto_65990 ?auto_65989 ) ) ( ON ?auto_65991 ?auto_65990 ) ( ON ?auto_65989 ?auto_65991 ) ( CLEAR ?auto_65989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_65987 ?auto_65988 ?auto_65992 ?auto_65990 ?auto_65991 )
      ( MAKE-2PILE ?auto_65987 ?auto_65988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65993 - BLOCK
      ?auto_65994 - BLOCK
    )
    :vars
    (
      ?auto_65995 - BLOCK
      ?auto_65998 - BLOCK
      ?auto_65997 - BLOCK
      ?auto_65996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_65995 ?auto_65994 ) ( ON-TABLE ?auto_65993 ) ( ON ?auto_65994 ?auto_65993 ) ( not ( = ?auto_65993 ?auto_65994 ) ) ( not ( = ?auto_65993 ?auto_65995 ) ) ( not ( = ?auto_65994 ?auto_65995 ) ) ( not ( = ?auto_65993 ?auto_65998 ) ) ( not ( = ?auto_65993 ?auto_65997 ) ) ( not ( = ?auto_65994 ?auto_65998 ) ) ( not ( = ?auto_65994 ?auto_65997 ) ) ( not ( = ?auto_65995 ?auto_65998 ) ) ( not ( = ?auto_65995 ?auto_65997 ) ) ( not ( = ?auto_65998 ?auto_65997 ) ) ( ON ?auto_65998 ?auto_65995 ) ( not ( = ?auto_65996 ?auto_65997 ) ) ( not ( = ?auto_65993 ?auto_65996 ) ) ( not ( = ?auto_65994 ?auto_65996 ) ) ( not ( = ?auto_65995 ?auto_65996 ) ) ( not ( = ?auto_65998 ?auto_65996 ) ) ( ON ?auto_65997 ?auto_65998 ) ( HOLDING ?auto_65996 ) ( CLEAR ?auto_65997 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_65993 ?auto_65994 ?auto_65995 ?auto_65998 ?auto_65997 ?auto_65996 )
      ( MAKE-2PILE ?auto_65993 ?auto_65994 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65999 - BLOCK
      ?auto_66000 - BLOCK
    )
    :vars
    (
      ?auto_66004 - BLOCK
      ?auto_66002 - BLOCK
      ?auto_66001 - BLOCK
      ?auto_66003 - BLOCK
      ?auto_66005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66004 ?auto_66000 ) ( ON-TABLE ?auto_65999 ) ( ON ?auto_66000 ?auto_65999 ) ( not ( = ?auto_65999 ?auto_66000 ) ) ( not ( = ?auto_65999 ?auto_66004 ) ) ( not ( = ?auto_66000 ?auto_66004 ) ) ( not ( = ?auto_65999 ?auto_66002 ) ) ( not ( = ?auto_65999 ?auto_66001 ) ) ( not ( = ?auto_66000 ?auto_66002 ) ) ( not ( = ?auto_66000 ?auto_66001 ) ) ( not ( = ?auto_66004 ?auto_66002 ) ) ( not ( = ?auto_66004 ?auto_66001 ) ) ( not ( = ?auto_66002 ?auto_66001 ) ) ( ON ?auto_66002 ?auto_66004 ) ( not ( = ?auto_66003 ?auto_66001 ) ) ( not ( = ?auto_65999 ?auto_66003 ) ) ( not ( = ?auto_66000 ?auto_66003 ) ) ( not ( = ?auto_66004 ?auto_66003 ) ) ( not ( = ?auto_66002 ?auto_66003 ) ) ( ON ?auto_66001 ?auto_66002 ) ( CLEAR ?auto_66001 ) ( ON ?auto_66003 ?auto_66005 ) ( CLEAR ?auto_66003 ) ( HAND-EMPTY ) ( not ( = ?auto_65999 ?auto_66005 ) ) ( not ( = ?auto_66000 ?auto_66005 ) ) ( not ( = ?auto_66004 ?auto_66005 ) ) ( not ( = ?auto_66002 ?auto_66005 ) ) ( not ( = ?auto_66001 ?auto_66005 ) ) ( not ( = ?auto_66003 ?auto_66005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66003 ?auto_66005 )
      ( MAKE-2PILE ?auto_65999 ?auto_66000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66006 - BLOCK
      ?auto_66007 - BLOCK
    )
    :vars
    (
      ?auto_66011 - BLOCK
      ?auto_66010 - BLOCK
      ?auto_66012 - BLOCK
      ?auto_66009 - BLOCK
      ?auto_66008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66011 ?auto_66007 ) ( ON-TABLE ?auto_66006 ) ( ON ?auto_66007 ?auto_66006 ) ( not ( = ?auto_66006 ?auto_66007 ) ) ( not ( = ?auto_66006 ?auto_66011 ) ) ( not ( = ?auto_66007 ?auto_66011 ) ) ( not ( = ?auto_66006 ?auto_66010 ) ) ( not ( = ?auto_66006 ?auto_66012 ) ) ( not ( = ?auto_66007 ?auto_66010 ) ) ( not ( = ?auto_66007 ?auto_66012 ) ) ( not ( = ?auto_66011 ?auto_66010 ) ) ( not ( = ?auto_66011 ?auto_66012 ) ) ( not ( = ?auto_66010 ?auto_66012 ) ) ( ON ?auto_66010 ?auto_66011 ) ( not ( = ?auto_66009 ?auto_66012 ) ) ( not ( = ?auto_66006 ?auto_66009 ) ) ( not ( = ?auto_66007 ?auto_66009 ) ) ( not ( = ?auto_66011 ?auto_66009 ) ) ( not ( = ?auto_66010 ?auto_66009 ) ) ( ON ?auto_66009 ?auto_66008 ) ( CLEAR ?auto_66009 ) ( not ( = ?auto_66006 ?auto_66008 ) ) ( not ( = ?auto_66007 ?auto_66008 ) ) ( not ( = ?auto_66011 ?auto_66008 ) ) ( not ( = ?auto_66010 ?auto_66008 ) ) ( not ( = ?auto_66012 ?auto_66008 ) ) ( not ( = ?auto_66009 ?auto_66008 ) ) ( HOLDING ?auto_66012 ) ( CLEAR ?auto_66010 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66006 ?auto_66007 ?auto_66011 ?auto_66010 ?auto_66012 )
      ( MAKE-2PILE ?auto_66006 ?auto_66007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66013 - BLOCK
      ?auto_66014 - BLOCK
    )
    :vars
    (
      ?auto_66017 - BLOCK
      ?auto_66016 - BLOCK
      ?auto_66019 - BLOCK
      ?auto_66015 - BLOCK
      ?auto_66018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66017 ?auto_66014 ) ( ON-TABLE ?auto_66013 ) ( ON ?auto_66014 ?auto_66013 ) ( not ( = ?auto_66013 ?auto_66014 ) ) ( not ( = ?auto_66013 ?auto_66017 ) ) ( not ( = ?auto_66014 ?auto_66017 ) ) ( not ( = ?auto_66013 ?auto_66016 ) ) ( not ( = ?auto_66013 ?auto_66019 ) ) ( not ( = ?auto_66014 ?auto_66016 ) ) ( not ( = ?auto_66014 ?auto_66019 ) ) ( not ( = ?auto_66017 ?auto_66016 ) ) ( not ( = ?auto_66017 ?auto_66019 ) ) ( not ( = ?auto_66016 ?auto_66019 ) ) ( ON ?auto_66016 ?auto_66017 ) ( not ( = ?auto_66015 ?auto_66019 ) ) ( not ( = ?auto_66013 ?auto_66015 ) ) ( not ( = ?auto_66014 ?auto_66015 ) ) ( not ( = ?auto_66017 ?auto_66015 ) ) ( not ( = ?auto_66016 ?auto_66015 ) ) ( ON ?auto_66015 ?auto_66018 ) ( not ( = ?auto_66013 ?auto_66018 ) ) ( not ( = ?auto_66014 ?auto_66018 ) ) ( not ( = ?auto_66017 ?auto_66018 ) ) ( not ( = ?auto_66016 ?auto_66018 ) ) ( not ( = ?auto_66019 ?auto_66018 ) ) ( not ( = ?auto_66015 ?auto_66018 ) ) ( CLEAR ?auto_66016 ) ( ON ?auto_66019 ?auto_66015 ) ( CLEAR ?auto_66019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66018 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66018 ?auto_66015 )
      ( MAKE-2PILE ?auto_66013 ?auto_66014 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66020 - BLOCK
      ?auto_66021 - BLOCK
    )
    :vars
    (
      ?auto_66026 - BLOCK
      ?auto_66025 - BLOCK
      ?auto_66022 - BLOCK
      ?auto_66023 - BLOCK
      ?auto_66024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66026 ?auto_66021 ) ( ON-TABLE ?auto_66020 ) ( ON ?auto_66021 ?auto_66020 ) ( not ( = ?auto_66020 ?auto_66021 ) ) ( not ( = ?auto_66020 ?auto_66026 ) ) ( not ( = ?auto_66021 ?auto_66026 ) ) ( not ( = ?auto_66020 ?auto_66025 ) ) ( not ( = ?auto_66020 ?auto_66022 ) ) ( not ( = ?auto_66021 ?auto_66025 ) ) ( not ( = ?auto_66021 ?auto_66022 ) ) ( not ( = ?auto_66026 ?auto_66025 ) ) ( not ( = ?auto_66026 ?auto_66022 ) ) ( not ( = ?auto_66025 ?auto_66022 ) ) ( not ( = ?auto_66023 ?auto_66022 ) ) ( not ( = ?auto_66020 ?auto_66023 ) ) ( not ( = ?auto_66021 ?auto_66023 ) ) ( not ( = ?auto_66026 ?auto_66023 ) ) ( not ( = ?auto_66025 ?auto_66023 ) ) ( ON ?auto_66023 ?auto_66024 ) ( not ( = ?auto_66020 ?auto_66024 ) ) ( not ( = ?auto_66021 ?auto_66024 ) ) ( not ( = ?auto_66026 ?auto_66024 ) ) ( not ( = ?auto_66025 ?auto_66024 ) ) ( not ( = ?auto_66022 ?auto_66024 ) ) ( not ( = ?auto_66023 ?auto_66024 ) ) ( ON ?auto_66022 ?auto_66023 ) ( CLEAR ?auto_66022 ) ( ON-TABLE ?auto_66024 ) ( HOLDING ?auto_66025 ) ( CLEAR ?auto_66026 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66020 ?auto_66021 ?auto_66026 ?auto_66025 )
      ( MAKE-2PILE ?auto_66020 ?auto_66021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66027 - BLOCK
      ?auto_66028 - BLOCK
    )
    :vars
    (
      ?auto_66031 - BLOCK
      ?auto_66029 - BLOCK
      ?auto_66030 - BLOCK
      ?auto_66033 - BLOCK
      ?auto_66032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66031 ?auto_66028 ) ( ON-TABLE ?auto_66027 ) ( ON ?auto_66028 ?auto_66027 ) ( not ( = ?auto_66027 ?auto_66028 ) ) ( not ( = ?auto_66027 ?auto_66031 ) ) ( not ( = ?auto_66028 ?auto_66031 ) ) ( not ( = ?auto_66027 ?auto_66029 ) ) ( not ( = ?auto_66027 ?auto_66030 ) ) ( not ( = ?auto_66028 ?auto_66029 ) ) ( not ( = ?auto_66028 ?auto_66030 ) ) ( not ( = ?auto_66031 ?auto_66029 ) ) ( not ( = ?auto_66031 ?auto_66030 ) ) ( not ( = ?auto_66029 ?auto_66030 ) ) ( not ( = ?auto_66033 ?auto_66030 ) ) ( not ( = ?auto_66027 ?auto_66033 ) ) ( not ( = ?auto_66028 ?auto_66033 ) ) ( not ( = ?auto_66031 ?auto_66033 ) ) ( not ( = ?auto_66029 ?auto_66033 ) ) ( ON ?auto_66033 ?auto_66032 ) ( not ( = ?auto_66027 ?auto_66032 ) ) ( not ( = ?auto_66028 ?auto_66032 ) ) ( not ( = ?auto_66031 ?auto_66032 ) ) ( not ( = ?auto_66029 ?auto_66032 ) ) ( not ( = ?auto_66030 ?auto_66032 ) ) ( not ( = ?auto_66033 ?auto_66032 ) ) ( ON ?auto_66030 ?auto_66033 ) ( ON-TABLE ?auto_66032 ) ( CLEAR ?auto_66031 ) ( ON ?auto_66029 ?auto_66030 ) ( CLEAR ?auto_66029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66032 ?auto_66033 ?auto_66030 )
      ( MAKE-2PILE ?auto_66027 ?auto_66028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66048 - BLOCK
      ?auto_66049 - BLOCK
    )
    :vars
    (
      ?auto_66051 - BLOCK
      ?auto_66052 - BLOCK
      ?auto_66054 - BLOCK
      ?auto_66053 - BLOCK
      ?auto_66050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66048 ) ( not ( = ?auto_66048 ?auto_66049 ) ) ( not ( = ?auto_66048 ?auto_66051 ) ) ( not ( = ?auto_66049 ?auto_66051 ) ) ( not ( = ?auto_66048 ?auto_66052 ) ) ( not ( = ?auto_66048 ?auto_66054 ) ) ( not ( = ?auto_66049 ?auto_66052 ) ) ( not ( = ?auto_66049 ?auto_66054 ) ) ( not ( = ?auto_66051 ?auto_66052 ) ) ( not ( = ?auto_66051 ?auto_66054 ) ) ( not ( = ?auto_66052 ?auto_66054 ) ) ( not ( = ?auto_66053 ?auto_66054 ) ) ( not ( = ?auto_66048 ?auto_66053 ) ) ( not ( = ?auto_66049 ?auto_66053 ) ) ( not ( = ?auto_66051 ?auto_66053 ) ) ( not ( = ?auto_66052 ?auto_66053 ) ) ( ON ?auto_66053 ?auto_66050 ) ( not ( = ?auto_66048 ?auto_66050 ) ) ( not ( = ?auto_66049 ?auto_66050 ) ) ( not ( = ?auto_66051 ?auto_66050 ) ) ( not ( = ?auto_66052 ?auto_66050 ) ) ( not ( = ?auto_66054 ?auto_66050 ) ) ( not ( = ?auto_66053 ?auto_66050 ) ) ( ON ?auto_66054 ?auto_66053 ) ( ON-TABLE ?auto_66050 ) ( ON ?auto_66052 ?auto_66054 ) ( ON ?auto_66051 ?auto_66052 ) ( CLEAR ?auto_66051 ) ( HOLDING ?auto_66049 ) ( CLEAR ?auto_66048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66048 ?auto_66049 ?auto_66051 )
      ( MAKE-2PILE ?auto_66048 ?auto_66049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66055 - BLOCK
      ?auto_66056 - BLOCK
    )
    :vars
    (
      ?auto_66061 - BLOCK
      ?auto_66059 - BLOCK
      ?auto_66060 - BLOCK
      ?auto_66058 - BLOCK
      ?auto_66057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66055 ) ( not ( = ?auto_66055 ?auto_66056 ) ) ( not ( = ?auto_66055 ?auto_66061 ) ) ( not ( = ?auto_66056 ?auto_66061 ) ) ( not ( = ?auto_66055 ?auto_66059 ) ) ( not ( = ?auto_66055 ?auto_66060 ) ) ( not ( = ?auto_66056 ?auto_66059 ) ) ( not ( = ?auto_66056 ?auto_66060 ) ) ( not ( = ?auto_66061 ?auto_66059 ) ) ( not ( = ?auto_66061 ?auto_66060 ) ) ( not ( = ?auto_66059 ?auto_66060 ) ) ( not ( = ?auto_66058 ?auto_66060 ) ) ( not ( = ?auto_66055 ?auto_66058 ) ) ( not ( = ?auto_66056 ?auto_66058 ) ) ( not ( = ?auto_66061 ?auto_66058 ) ) ( not ( = ?auto_66059 ?auto_66058 ) ) ( ON ?auto_66058 ?auto_66057 ) ( not ( = ?auto_66055 ?auto_66057 ) ) ( not ( = ?auto_66056 ?auto_66057 ) ) ( not ( = ?auto_66061 ?auto_66057 ) ) ( not ( = ?auto_66059 ?auto_66057 ) ) ( not ( = ?auto_66060 ?auto_66057 ) ) ( not ( = ?auto_66058 ?auto_66057 ) ) ( ON ?auto_66060 ?auto_66058 ) ( ON-TABLE ?auto_66057 ) ( ON ?auto_66059 ?auto_66060 ) ( ON ?auto_66061 ?auto_66059 ) ( CLEAR ?auto_66055 ) ( ON ?auto_66056 ?auto_66061 ) ( CLEAR ?auto_66056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66057 ?auto_66058 ?auto_66060 ?auto_66059 ?auto_66061 )
      ( MAKE-2PILE ?auto_66055 ?auto_66056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66062 - BLOCK
      ?auto_66063 - BLOCK
    )
    :vars
    (
      ?auto_66068 - BLOCK
      ?auto_66066 - BLOCK
      ?auto_66064 - BLOCK
      ?auto_66065 - BLOCK
      ?auto_66067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66062 ?auto_66063 ) ) ( not ( = ?auto_66062 ?auto_66068 ) ) ( not ( = ?auto_66063 ?auto_66068 ) ) ( not ( = ?auto_66062 ?auto_66066 ) ) ( not ( = ?auto_66062 ?auto_66064 ) ) ( not ( = ?auto_66063 ?auto_66066 ) ) ( not ( = ?auto_66063 ?auto_66064 ) ) ( not ( = ?auto_66068 ?auto_66066 ) ) ( not ( = ?auto_66068 ?auto_66064 ) ) ( not ( = ?auto_66066 ?auto_66064 ) ) ( not ( = ?auto_66065 ?auto_66064 ) ) ( not ( = ?auto_66062 ?auto_66065 ) ) ( not ( = ?auto_66063 ?auto_66065 ) ) ( not ( = ?auto_66068 ?auto_66065 ) ) ( not ( = ?auto_66066 ?auto_66065 ) ) ( ON ?auto_66065 ?auto_66067 ) ( not ( = ?auto_66062 ?auto_66067 ) ) ( not ( = ?auto_66063 ?auto_66067 ) ) ( not ( = ?auto_66068 ?auto_66067 ) ) ( not ( = ?auto_66066 ?auto_66067 ) ) ( not ( = ?auto_66064 ?auto_66067 ) ) ( not ( = ?auto_66065 ?auto_66067 ) ) ( ON ?auto_66064 ?auto_66065 ) ( ON-TABLE ?auto_66067 ) ( ON ?auto_66066 ?auto_66064 ) ( ON ?auto_66068 ?auto_66066 ) ( ON ?auto_66063 ?auto_66068 ) ( CLEAR ?auto_66063 ) ( HOLDING ?auto_66062 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66062 )
      ( MAKE-2PILE ?auto_66062 ?auto_66063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66069 - BLOCK
      ?auto_66070 - BLOCK
    )
    :vars
    (
      ?auto_66071 - BLOCK
      ?auto_66073 - BLOCK
      ?auto_66075 - BLOCK
      ?auto_66074 - BLOCK
      ?auto_66072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66069 ?auto_66070 ) ) ( not ( = ?auto_66069 ?auto_66071 ) ) ( not ( = ?auto_66070 ?auto_66071 ) ) ( not ( = ?auto_66069 ?auto_66073 ) ) ( not ( = ?auto_66069 ?auto_66075 ) ) ( not ( = ?auto_66070 ?auto_66073 ) ) ( not ( = ?auto_66070 ?auto_66075 ) ) ( not ( = ?auto_66071 ?auto_66073 ) ) ( not ( = ?auto_66071 ?auto_66075 ) ) ( not ( = ?auto_66073 ?auto_66075 ) ) ( not ( = ?auto_66074 ?auto_66075 ) ) ( not ( = ?auto_66069 ?auto_66074 ) ) ( not ( = ?auto_66070 ?auto_66074 ) ) ( not ( = ?auto_66071 ?auto_66074 ) ) ( not ( = ?auto_66073 ?auto_66074 ) ) ( ON ?auto_66074 ?auto_66072 ) ( not ( = ?auto_66069 ?auto_66072 ) ) ( not ( = ?auto_66070 ?auto_66072 ) ) ( not ( = ?auto_66071 ?auto_66072 ) ) ( not ( = ?auto_66073 ?auto_66072 ) ) ( not ( = ?auto_66075 ?auto_66072 ) ) ( not ( = ?auto_66074 ?auto_66072 ) ) ( ON ?auto_66075 ?auto_66074 ) ( ON-TABLE ?auto_66072 ) ( ON ?auto_66073 ?auto_66075 ) ( ON ?auto_66071 ?auto_66073 ) ( ON ?auto_66070 ?auto_66071 ) ( ON ?auto_66069 ?auto_66070 ) ( CLEAR ?auto_66069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66072 ?auto_66074 ?auto_66075 ?auto_66073 ?auto_66071 ?auto_66070 )
      ( MAKE-2PILE ?auto_66069 ?auto_66070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66080 - BLOCK
      ?auto_66081 - BLOCK
      ?auto_66082 - BLOCK
      ?auto_66083 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66083 ) ( CLEAR ?auto_66082 ) ( ON-TABLE ?auto_66080 ) ( ON ?auto_66081 ?auto_66080 ) ( ON ?auto_66082 ?auto_66081 ) ( not ( = ?auto_66080 ?auto_66081 ) ) ( not ( = ?auto_66080 ?auto_66082 ) ) ( not ( = ?auto_66080 ?auto_66083 ) ) ( not ( = ?auto_66081 ?auto_66082 ) ) ( not ( = ?auto_66081 ?auto_66083 ) ) ( not ( = ?auto_66082 ?auto_66083 ) ) )
    :subtasks
    ( ( !STACK ?auto_66083 ?auto_66082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66084 - BLOCK
      ?auto_66085 - BLOCK
      ?auto_66086 - BLOCK
      ?auto_66087 - BLOCK
    )
    :vars
    (
      ?auto_66088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66086 ) ( ON-TABLE ?auto_66084 ) ( ON ?auto_66085 ?auto_66084 ) ( ON ?auto_66086 ?auto_66085 ) ( not ( = ?auto_66084 ?auto_66085 ) ) ( not ( = ?auto_66084 ?auto_66086 ) ) ( not ( = ?auto_66084 ?auto_66087 ) ) ( not ( = ?auto_66085 ?auto_66086 ) ) ( not ( = ?auto_66085 ?auto_66087 ) ) ( not ( = ?auto_66086 ?auto_66087 ) ) ( ON ?auto_66087 ?auto_66088 ) ( CLEAR ?auto_66087 ) ( HAND-EMPTY ) ( not ( = ?auto_66084 ?auto_66088 ) ) ( not ( = ?auto_66085 ?auto_66088 ) ) ( not ( = ?auto_66086 ?auto_66088 ) ) ( not ( = ?auto_66087 ?auto_66088 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66087 ?auto_66088 )
      ( MAKE-4PILE ?auto_66084 ?auto_66085 ?auto_66086 ?auto_66087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66089 - BLOCK
      ?auto_66090 - BLOCK
      ?auto_66091 - BLOCK
      ?auto_66092 - BLOCK
    )
    :vars
    (
      ?auto_66093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66089 ) ( ON ?auto_66090 ?auto_66089 ) ( not ( = ?auto_66089 ?auto_66090 ) ) ( not ( = ?auto_66089 ?auto_66091 ) ) ( not ( = ?auto_66089 ?auto_66092 ) ) ( not ( = ?auto_66090 ?auto_66091 ) ) ( not ( = ?auto_66090 ?auto_66092 ) ) ( not ( = ?auto_66091 ?auto_66092 ) ) ( ON ?auto_66092 ?auto_66093 ) ( CLEAR ?auto_66092 ) ( not ( = ?auto_66089 ?auto_66093 ) ) ( not ( = ?auto_66090 ?auto_66093 ) ) ( not ( = ?auto_66091 ?auto_66093 ) ) ( not ( = ?auto_66092 ?auto_66093 ) ) ( HOLDING ?auto_66091 ) ( CLEAR ?auto_66090 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66089 ?auto_66090 ?auto_66091 )
      ( MAKE-4PILE ?auto_66089 ?auto_66090 ?auto_66091 ?auto_66092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66094 - BLOCK
      ?auto_66095 - BLOCK
      ?auto_66096 - BLOCK
      ?auto_66097 - BLOCK
    )
    :vars
    (
      ?auto_66098 - BLOCK
      ?auto_66099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66094 ) ( ON ?auto_66095 ?auto_66094 ) ( not ( = ?auto_66094 ?auto_66095 ) ) ( not ( = ?auto_66094 ?auto_66096 ) ) ( not ( = ?auto_66094 ?auto_66097 ) ) ( not ( = ?auto_66095 ?auto_66096 ) ) ( not ( = ?auto_66095 ?auto_66097 ) ) ( not ( = ?auto_66096 ?auto_66097 ) ) ( ON ?auto_66097 ?auto_66098 ) ( not ( = ?auto_66094 ?auto_66098 ) ) ( not ( = ?auto_66095 ?auto_66098 ) ) ( not ( = ?auto_66096 ?auto_66098 ) ) ( not ( = ?auto_66097 ?auto_66098 ) ) ( CLEAR ?auto_66095 ) ( ON ?auto_66096 ?auto_66097 ) ( CLEAR ?auto_66096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66099 ) ( ON ?auto_66098 ?auto_66099 ) ( not ( = ?auto_66099 ?auto_66098 ) ) ( not ( = ?auto_66099 ?auto_66097 ) ) ( not ( = ?auto_66099 ?auto_66096 ) ) ( not ( = ?auto_66094 ?auto_66099 ) ) ( not ( = ?auto_66095 ?auto_66099 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66099 ?auto_66098 ?auto_66097 )
      ( MAKE-4PILE ?auto_66094 ?auto_66095 ?auto_66096 ?auto_66097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66100 - BLOCK
      ?auto_66101 - BLOCK
      ?auto_66102 - BLOCK
      ?auto_66103 - BLOCK
    )
    :vars
    (
      ?auto_66104 - BLOCK
      ?auto_66105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66100 ) ( not ( = ?auto_66100 ?auto_66101 ) ) ( not ( = ?auto_66100 ?auto_66102 ) ) ( not ( = ?auto_66100 ?auto_66103 ) ) ( not ( = ?auto_66101 ?auto_66102 ) ) ( not ( = ?auto_66101 ?auto_66103 ) ) ( not ( = ?auto_66102 ?auto_66103 ) ) ( ON ?auto_66103 ?auto_66104 ) ( not ( = ?auto_66100 ?auto_66104 ) ) ( not ( = ?auto_66101 ?auto_66104 ) ) ( not ( = ?auto_66102 ?auto_66104 ) ) ( not ( = ?auto_66103 ?auto_66104 ) ) ( ON ?auto_66102 ?auto_66103 ) ( CLEAR ?auto_66102 ) ( ON-TABLE ?auto_66105 ) ( ON ?auto_66104 ?auto_66105 ) ( not ( = ?auto_66105 ?auto_66104 ) ) ( not ( = ?auto_66105 ?auto_66103 ) ) ( not ( = ?auto_66105 ?auto_66102 ) ) ( not ( = ?auto_66100 ?auto_66105 ) ) ( not ( = ?auto_66101 ?auto_66105 ) ) ( HOLDING ?auto_66101 ) ( CLEAR ?auto_66100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66100 ?auto_66101 )
      ( MAKE-4PILE ?auto_66100 ?auto_66101 ?auto_66102 ?auto_66103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66106 - BLOCK
      ?auto_66107 - BLOCK
      ?auto_66108 - BLOCK
      ?auto_66109 - BLOCK
    )
    :vars
    (
      ?auto_66110 - BLOCK
      ?auto_66111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66106 ) ( not ( = ?auto_66106 ?auto_66107 ) ) ( not ( = ?auto_66106 ?auto_66108 ) ) ( not ( = ?auto_66106 ?auto_66109 ) ) ( not ( = ?auto_66107 ?auto_66108 ) ) ( not ( = ?auto_66107 ?auto_66109 ) ) ( not ( = ?auto_66108 ?auto_66109 ) ) ( ON ?auto_66109 ?auto_66110 ) ( not ( = ?auto_66106 ?auto_66110 ) ) ( not ( = ?auto_66107 ?auto_66110 ) ) ( not ( = ?auto_66108 ?auto_66110 ) ) ( not ( = ?auto_66109 ?auto_66110 ) ) ( ON ?auto_66108 ?auto_66109 ) ( ON-TABLE ?auto_66111 ) ( ON ?auto_66110 ?auto_66111 ) ( not ( = ?auto_66111 ?auto_66110 ) ) ( not ( = ?auto_66111 ?auto_66109 ) ) ( not ( = ?auto_66111 ?auto_66108 ) ) ( not ( = ?auto_66106 ?auto_66111 ) ) ( not ( = ?auto_66107 ?auto_66111 ) ) ( CLEAR ?auto_66106 ) ( ON ?auto_66107 ?auto_66108 ) ( CLEAR ?auto_66107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66111 ?auto_66110 ?auto_66109 ?auto_66108 )
      ( MAKE-4PILE ?auto_66106 ?auto_66107 ?auto_66108 ?auto_66109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66112 - BLOCK
      ?auto_66113 - BLOCK
      ?auto_66114 - BLOCK
      ?auto_66115 - BLOCK
    )
    :vars
    (
      ?auto_66116 - BLOCK
      ?auto_66117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66112 ?auto_66113 ) ) ( not ( = ?auto_66112 ?auto_66114 ) ) ( not ( = ?auto_66112 ?auto_66115 ) ) ( not ( = ?auto_66113 ?auto_66114 ) ) ( not ( = ?auto_66113 ?auto_66115 ) ) ( not ( = ?auto_66114 ?auto_66115 ) ) ( ON ?auto_66115 ?auto_66116 ) ( not ( = ?auto_66112 ?auto_66116 ) ) ( not ( = ?auto_66113 ?auto_66116 ) ) ( not ( = ?auto_66114 ?auto_66116 ) ) ( not ( = ?auto_66115 ?auto_66116 ) ) ( ON ?auto_66114 ?auto_66115 ) ( ON-TABLE ?auto_66117 ) ( ON ?auto_66116 ?auto_66117 ) ( not ( = ?auto_66117 ?auto_66116 ) ) ( not ( = ?auto_66117 ?auto_66115 ) ) ( not ( = ?auto_66117 ?auto_66114 ) ) ( not ( = ?auto_66112 ?auto_66117 ) ) ( not ( = ?auto_66113 ?auto_66117 ) ) ( ON ?auto_66113 ?auto_66114 ) ( CLEAR ?auto_66113 ) ( HOLDING ?auto_66112 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66112 )
      ( MAKE-4PILE ?auto_66112 ?auto_66113 ?auto_66114 ?auto_66115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66118 - BLOCK
      ?auto_66119 - BLOCK
      ?auto_66120 - BLOCK
      ?auto_66121 - BLOCK
    )
    :vars
    (
      ?auto_66123 - BLOCK
      ?auto_66122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66118 ?auto_66119 ) ) ( not ( = ?auto_66118 ?auto_66120 ) ) ( not ( = ?auto_66118 ?auto_66121 ) ) ( not ( = ?auto_66119 ?auto_66120 ) ) ( not ( = ?auto_66119 ?auto_66121 ) ) ( not ( = ?auto_66120 ?auto_66121 ) ) ( ON ?auto_66121 ?auto_66123 ) ( not ( = ?auto_66118 ?auto_66123 ) ) ( not ( = ?auto_66119 ?auto_66123 ) ) ( not ( = ?auto_66120 ?auto_66123 ) ) ( not ( = ?auto_66121 ?auto_66123 ) ) ( ON ?auto_66120 ?auto_66121 ) ( ON-TABLE ?auto_66122 ) ( ON ?auto_66123 ?auto_66122 ) ( not ( = ?auto_66122 ?auto_66123 ) ) ( not ( = ?auto_66122 ?auto_66121 ) ) ( not ( = ?auto_66122 ?auto_66120 ) ) ( not ( = ?auto_66118 ?auto_66122 ) ) ( not ( = ?auto_66119 ?auto_66122 ) ) ( ON ?auto_66119 ?auto_66120 ) ( ON ?auto_66118 ?auto_66119 ) ( CLEAR ?auto_66118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66122 ?auto_66123 ?auto_66121 ?auto_66120 ?auto_66119 )
      ( MAKE-4PILE ?auto_66118 ?auto_66119 ?auto_66120 ?auto_66121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66124 - BLOCK
      ?auto_66125 - BLOCK
      ?auto_66126 - BLOCK
      ?auto_66127 - BLOCK
    )
    :vars
    (
      ?auto_66129 - BLOCK
      ?auto_66128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66124 ?auto_66125 ) ) ( not ( = ?auto_66124 ?auto_66126 ) ) ( not ( = ?auto_66124 ?auto_66127 ) ) ( not ( = ?auto_66125 ?auto_66126 ) ) ( not ( = ?auto_66125 ?auto_66127 ) ) ( not ( = ?auto_66126 ?auto_66127 ) ) ( ON ?auto_66127 ?auto_66129 ) ( not ( = ?auto_66124 ?auto_66129 ) ) ( not ( = ?auto_66125 ?auto_66129 ) ) ( not ( = ?auto_66126 ?auto_66129 ) ) ( not ( = ?auto_66127 ?auto_66129 ) ) ( ON ?auto_66126 ?auto_66127 ) ( ON-TABLE ?auto_66128 ) ( ON ?auto_66129 ?auto_66128 ) ( not ( = ?auto_66128 ?auto_66129 ) ) ( not ( = ?auto_66128 ?auto_66127 ) ) ( not ( = ?auto_66128 ?auto_66126 ) ) ( not ( = ?auto_66124 ?auto_66128 ) ) ( not ( = ?auto_66125 ?auto_66128 ) ) ( ON ?auto_66125 ?auto_66126 ) ( HOLDING ?auto_66124 ) ( CLEAR ?auto_66125 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66128 ?auto_66129 ?auto_66127 ?auto_66126 ?auto_66125 ?auto_66124 )
      ( MAKE-4PILE ?auto_66124 ?auto_66125 ?auto_66126 ?auto_66127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66130 - BLOCK
      ?auto_66131 - BLOCK
      ?auto_66132 - BLOCK
      ?auto_66133 - BLOCK
    )
    :vars
    (
      ?auto_66135 - BLOCK
      ?auto_66134 - BLOCK
      ?auto_66136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66130 ?auto_66131 ) ) ( not ( = ?auto_66130 ?auto_66132 ) ) ( not ( = ?auto_66130 ?auto_66133 ) ) ( not ( = ?auto_66131 ?auto_66132 ) ) ( not ( = ?auto_66131 ?auto_66133 ) ) ( not ( = ?auto_66132 ?auto_66133 ) ) ( ON ?auto_66133 ?auto_66135 ) ( not ( = ?auto_66130 ?auto_66135 ) ) ( not ( = ?auto_66131 ?auto_66135 ) ) ( not ( = ?auto_66132 ?auto_66135 ) ) ( not ( = ?auto_66133 ?auto_66135 ) ) ( ON ?auto_66132 ?auto_66133 ) ( ON-TABLE ?auto_66134 ) ( ON ?auto_66135 ?auto_66134 ) ( not ( = ?auto_66134 ?auto_66135 ) ) ( not ( = ?auto_66134 ?auto_66133 ) ) ( not ( = ?auto_66134 ?auto_66132 ) ) ( not ( = ?auto_66130 ?auto_66134 ) ) ( not ( = ?auto_66131 ?auto_66134 ) ) ( ON ?auto_66131 ?auto_66132 ) ( CLEAR ?auto_66131 ) ( ON ?auto_66130 ?auto_66136 ) ( CLEAR ?auto_66130 ) ( HAND-EMPTY ) ( not ( = ?auto_66130 ?auto_66136 ) ) ( not ( = ?auto_66131 ?auto_66136 ) ) ( not ( = ?auto_66132 ?auto_66136 ) ) ( not ( = ?auto_66133 ?auto_66136 ) ) ( not ( = ?auto_66135 ?auto_66136 ) ) ( not ( = ?auto_66134 ?auto_66136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66130 ?auto_66136 )
      ( MAKE-4PILE ?auto_66130 ?auto_66131 ?auto_66132 ?auto_66133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66137 - BLOCK
      ?auto_66138 - BLOCK
      ?auto_66139 - BLOCK
      ?auto_66140 - BLOCK
    )
    :vars
    (
      ?auto_66143 - BLOCK
      ?auto_66141 - BLOCK
      ?auto_66142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66137 ?auto_66138 ) ) ( not ( = ?auto_66137 ?auto_66139 ) ) ( not ( = ?auto_66137 ?auto_66140 ) ) ( not ( = ?auto_66138 ?auto_66139 ) ) ( not ( = ?auto_66138 ?auto_66140 ) ) ( not ( = ?auto_66139 ?auto_66140 ) ) ( ON ?auto_66140 ?auto_66143 ) ( not ( = ?auto_66137 ?auto_66143 ) ) ( not ( = ?auto_66138 ?auto_66143 ) ) ( not ( = ?auto_66139 ?auto_66143 ) ) ( not ( = ?auto_66140 ?auto_66143 ) ) ( ON ?auto_66139 ?auto_66140 ) ( ON-TABLE ?auto_66141 ) ( ON ?auto_66143 ?auto_66141 ) ( not ( = ?auto_66141 ?auto_66143 ) ) ( not ( = ?auto_66141 ?auto_66140 ) ) ( not ( = ?auto_66141 ?auto_66139 ) ) ( not ( = ?auto_66137 ?auto_66141 ) ) ( not ( = ?auto_66138 ?auto_66141 ) ) ( ON ?auto_66137 ?auto_66142 ) ( CLEAR ?auto_66137 ) ( not ( = ?auto_66137 ?auto_66142 ) ) ( not ( = ?auto_66138 ?auto_66142 ) ) ( not ( = ?auto_66139 ?auto_66142 ) ) ( not ( = ?auto_66140 ?auto_66142 ) ) ( not ( = ?auto_66143 ?auto_66142 ) ) ( not ( = ?auto_66141 ?auto_66142 ) ) ( HOLDING ?auto_66138 ) ( CLEAR ?auto_66139 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66141 ?auto_66143 ?auto_66140 ?auto_66139 ?auto_66138 )
      ( MAKE-4PILE ?auto_66137 ?auto_66138 ?auto_66139 ?auto_66140 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66144 - BLOCK
      ?auto_66145 - BLOCK
      ?auto_66146 - BLOCK
      ?auto_66147 - BLOCK
    )
    :vars
    (
      ?auto_66150 - BLOCK
      ?auto_66148 - BLOCK
      ?auto_66149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66144 ?auto_66145 ) ) ( not ( = ?auto_66144 ?auto_66146 ) ) ( not ( = ?auto_66144 ?auto_66147 ) ) ( not ( = ?auto_66145 ?auto_66146 ) ) ( not ( = ?auto_66145 ?auto_66147 ) ) ( not ( = ?auto_66146 ?auto_66147 ) ) ( ON ?auto_66147 ?auto_66150 ) ( not ( = ?auto_66144 ?auto_66150 ) ) ( not ( = ?auto_66145 ?auto_66150 ) ) ( not ( = ?auto_66146 ?auto_66150 ) ) ( not ( = ?auto_66147 ?auto_66150 ) ) ( ON ?auto_66146 ?auto_66147 ) ( ON-TABLE ?auto_66148 ) ( ON ?auto_66150 ?auto_66148 ) ( not ( = ?auto_66148 ?auto_66150 ) ) ( not ( = ?auto_66148 ?auto_66147 ) ) ( not ( = ?auto_66148 ?auto_66146 ) ) ( not ( = ?auto_66144 ?auto_66148 ) ) ( not ( = ?auto_66145 ?auto_66148 ) ) ( ON ?auto_66144 ?auto_66149 ) ( not ( = ?auto_66144 ?auto_66149 ) ) ( not ( = ?auto_66145 ?auto_66149 ) ) ( not ( = ?auto_66146 ?auto_66149 ) ) ( not ( = ?auto_66147 ?auto_66149 ) ) ( not ( = ?auto_66150 ?auto_66149 ) ) ( not ( = ?auto_66148 ?auto_66149 ) ) ( CLEAR ?auto_66146 ) ( ON ?auto_66145 ?auto_66144 ) ( CLEAR ?auto_66145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66149 ?auto_66144 )
      ( MAKE-4PILE ?auto_66144 ?auto_66145 ?auto_66146 ?auto_66147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66151 - BLOCK
      ?auto_66152 - BLOCK
      ?auto_66153 - BLOCK
      ?auto_66154 - BLOCK
    )
    :vars
    (
      ?auto_66155 - BLOCK
      ?auto_66157 - BLOCK
      ?auto_66156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66151 ?auto_66152 ) ) ( not ( = ?auto_66151 ?auto_66153 ) ) ( not ( = ?auto_66151 ?auto_66154 ) ) ( not ( = ?auto_66152 ?auto_66153 ) ) ( not ( = ?auto_66152 ?auto_66154 ) ) ( not ( = ?auto_66153 ?auto_66154 ) ) ( ON ?auto_66154 ?auto_66155 ) ( not ( = ?auto_66151 ?auto_66155 ) ) ( not ( = ?auto_66152 ?auto_66155 ) ) ( not ( = ?auto_66153 ?auto_66155 ) ) ( not ( = ?auto_66154 ?auto_66155 ) ) ( ON-TABLE ?auto_66157 ) ( ON ?auto_66155 ?auto_66157 ) ( not ( = ?auto_66157 ?auto_66155 ) ) ( not ( = ?auto_66157 ?auto_66154 ) ) ( not ( = ?auto_66157 ?auto_66153 ) ) ( not ( = ?auto_66151 ?auto_66157 ) ) ( not ( = ?auto_66152 ?auto_66157 ) ) ( ON ?auto_66151 ?auto_66156 ) ( not ( = ?auto_66151 ?auto_66156 ) ) ( not ( = ?auto_66152 ?auto_66156 ) ) ( not ( = ?auto_66153 ?auto_66156 ) ) ( not ( = ?auto_66154 ?auto_66156 ) ) ( not ( = ?auto_66155 ?auto_66156 ) ) ( not ( = ?auto_66157 ?auto_66156 ) ) ( ON ?auto_66152 ?auto_66151 ) ( CLEAR ?auto_66152 ) ( ON-TABLE ?auto_66156 ) ( HOLDING ?auto_66153 ) ( CLEAR ?auto_66154 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66157 ?auto_66155 ?auto_66154 ?auto_66153 )
      ( MAKE-4PILE ?auto_66151 ?auto_66152 ?auto_66153 ?auto_66154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66158 - BLOCK
      ?auto_66159 - BLOCK
      ?auto_66160 - BLOCK
      ?auto_66161 - BLOCK
    )
    :vars
    (
      ?auto_66164 - BLOCK
      ?auto_66162 - BLOCK
      ?auto_66163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66158 ?auto_66159 ) ) ( not ( = ?auto_66158 ?auto_66160 ) ) ( not ( = ?auto_66158 ?auto_66161 ) ) ( not ( = ?auto_66159 ?auto_66160 ) ) ( not ( = ?auto_66159 ?auto_66161 ) ) ( not ( = ?auto_66160 ?auto_66161 ) ) ( ON ?auto_66161 ?auto_66164 ) ( not ( = ?auto_66158 ?auto_66164 ) ) ( not ( = ?auto_66159 ?auto_66164 ) ) ( not ( = ?auto_66160 ?auto_66164 ) ) ( not ( = ?auto_66161 ?auto_66164 ) ) ( ON-TABLE ?auto_66162 ) ( ON ?auto_66164 ?auto_66162 ) ( not ( = ?auto_66162 ?auto_66164 ) ) ( not ( = ?auto_66162 ?auto_66161 ) ) ( not ( = ?auto_66162 ?auto_66160 ) ) ( not ( = ?auto_66158 ?auto_66162 ) ) ( not ( = ?auto_66159 ?auto_66162 ) ) ( ON ?auto_66158 ?auto_66163 ) ( not ( = ?auto_66158 ?auto_66163 ) ) ( not ( = ?auto_66159 ?auto_66163 ) ) ( not ( = ?auto_66160 ?auto_66163 ) ) ( not ( = ?auto_66161 ?auto_66163 ) ) ( not ( = ?auto_66164 ?auto_66163 ) ) ( not ( = ?auto_66162 ?auto_66163 ) ) ( ON ?auto_66159 ?auto_66158 ) ( ON-TABLE ?auto_66163 ) ( CLEAR ?auto_66161 ) ( ON ?auto_66160 ?auto_66159 ) ( CLEAR ?auto_66160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66163 ?auto_66158 ?auto_66159 )
      ( MAKE-4PILE ?auto_66158 ?auto_66159 ?auto_66160 ?auto_66161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66165 - BLOCK
      ?auto_66166 - BLOCK
      ?auto_66167 - BLOCK
      ?auto_66168 - BLOCK
    )
    :vars
    (
      ?auto_66171 - BLOCK
      ?auto_66170 - BLOCK
      ?auto_66169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66165 ?auto_66166 ) ) ( not ( = ?auto_66165 ?auto_66167 ) ) ( not ( = ?auto_66165 ?auto_66168 ) ) ( not ( = ?auto_66166 ?auto_66167 ) ) ( not ( = ?auto_66166 ?auto_66168 ) ) ( not ( = ?auto_66167 ?auto_66168 ) ) ( not ( = ?auto_66165 ?auto_66171 ) ) ( not ( = ?auto_66166 ?auto_66171 ) ) ( not ( = ?auto_66167 ?auto_66171 ) ) ( not ( = ?auto_66168 ?auto_66171 ) ) ( ON-TABLE ?auto_66170 ) ( ON ?auto_66171 ?auto_66170 ) ( not ( = ?auto_66170 ?auto_66171 ) ) ( not ( = ?auto_66170 ?auto_66168 ) ) ( not ( = ?auto_66170 ?auto_66167 ) ) ( not ( = ?auto_66165 ?auto_66170 ) ) ( not ( = ?auto_66166 ?auto_66170 ) ) ( ON ?auto_66165 ?auto_66169 ) ( not ( = ?auto_66165 ?auto_66169 ) ) ( not ( = ?auto_66166 ?auto_66169 ) ) ( not ( = ?auto_66167 ?auto_66169 ) ) ( not ( = ?auto_66168 ?auto_66169 ) ) ( not ( = ?auto_66171 ?auto_66169 ) ) ( not ( = ?auto_66170 ?auto_66169 ) ) ( ON ?auto_66166 ?auto_66165 ) ( ON-TABLE ?auto_66169 ) ( ON ?auto_66167 ?auto_66166 ) ( CLEAR ?auto_66167 ) ( HOLDING ?auto_66168 ) ( CLEAR ?auto_66171 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66170 ?auto_66171 ?auto_66168 )
      ( MAKE-4PILE ?auto_66165 ?auto_66166 ?auto_66167 ?auto_66168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66172 - BLOCK
      ?auto_66173 - BLOCK
      ?auto_66174 - BLOCK
      ?auto_66175 - BLOCK
    )
    :vars
    (
      ?auto_66176 - BLOCK
      ?auto_66177 - BLOCK
      ?auto_66178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66172 ?auto_66173 ) ) ( not ( = ?auto_66172 ?auto_66174 ) ) ( not ( = ?auto_66172 ?auto_66175 ) ) ( not ( = ?auto_66173 ?auto_66174 ) ) ( not ( = ?auto_66173 ?auto_66175 ) ) ( not ( = ?auto_66174 ?auto_66175 ) ) ( not ( = ?auto_66172 ?auto_66176 ) ) ( not ( = ?auto_66173 ?auto_66176 ) ) ( not ( = ?auto_66174 ?auto_66176 ) ) ( not ( = ?auto_66175 ?auto_66176 ) ) ( ON-TABLE ?auto_66177 ) ( ON ?auto_66176 ?auto_66177 ) ( not ( = ?auto_66177 ?auto_66176 ) ) ( not ( = ?auto_66177 ?auto_66175 ) ) ( not ( = ?auto_66177 ?auto_66174 ) ) ( not ( = ?auto_66172 ?auto_66177 ) ) ( not ( = ?auto_66173 ?auto_66177 ) ) ( ON ?auto_66172 ?auto_66178 ) ( not ( = ?auto_66172 ?auto_66178 ) ) ( not ( = ?auto_66173 ?auto_66178 ) ) ( not ( = ?auto_66174 ?auto_66178 ) ) ( not ( = ?auto_66175 ?auto_66178 ) ) ( not ( = ?auto_66176 ?auto_66178 ) ) ( not ( = ?auto_66177 ?auto_66178 ) ) ( ON ?auto_66173 ?auto_66172 ) ( ON-TABLE ?auto_66178 ) ( ON ?auto_66174 ?auto_66173 ) ( CLEAR ?auto_66176 ) ( ON ?auto_66175 ?auto_66174 ) ( CLEAR ?auto_66175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66178 ?auto_66172 ?auto_66173 ?auto_66174 )
      ( MAKE-4PILE ?auto_66172 ?auto_66173 ?auto_66174 ?auto_66175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66179 - BLOCK
      ?auto_66180 - BLOCK
      ?auto_66181 - BLOCK
      ?auto_66182 - BLOCK
    )
    :vars
    (
      ?auto_66185 - BLOCK
      ?auto_66184 - BLOCK
      ?auto_66183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66179 ?auto_66180 ) ) ( not ( = ?auto_66179 ?auto_66181 ) ) ( not ( = ?auto_66179 ?auto_66182 ) ) ( not ( = ?auto_66180 ?auto_66181 ) ) ( not ( = ?auto_66180 ?auto_66182 ) ) ( not ( = ?auto_66181 ?auto_66182 ) ) ( not ( = ?auto_66179 ?auto_66185 ) ) ( not ( = ?auto_66180 ?auto_66185 ) ) ( not ( = ?auto_66181 ?auto_66185 ) ) ( not ( = ?auto_66182 ?auto_66185 ) ) ( ON-TABLE ?auto_66184 ) ( not ( = ?auto_66184 ?auto_66185 ) ) ( not ( = ?auto_66184 ?auto_66182 ) ) ( not ( = ?auto_66184 ?auto_66181 ) ) ( not ( = ?auto_66179 ?auto_66184 ) ) ( not ( = ?auto_66180 ?auto_66184 ) ) ( ON ?auto_66179 ?auto_66183 ) ( not ( = ?auto_66179 ?auto_66183 ) ) ( not ( = ?auto_66180 ?auto_66183 ) ) ( not ( = ?auto_66181 ?auto_66183 ) ) ( not ( = ?auto_66182 ?auto_66183 ) ) ( not ( = ?auto_66185 ?auto_66183 ) ) ( not ( = ?auto_66184 ?auto_66183 ) ) ( ON ?auto_66180 ?auto_66179 ) ( ON-TABLE ?auto_66183 ) ( ON ?auto_66181 ?auto_66180 ) ( ON ?auto_66182 ?auto_66181 ) ( CLEAR ?auto_66182 ) ( HOLDING ?auto_66185 ) ( CLEAR ?auto_66184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66184 ?auto_66185 )
      ( MAKE-4PILE ?auto_66179 ?auto_66180 ?auto_66181 ?auto_66182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66186 - BLOCK
      ?auto_66187 - BLOCK
      ?auto_66188 - BLOCK
      ?auto_66189 - BLOCK
    )
    :vars
    (
      ?auto_66192 - BLOCK
      ?auto_66190 - BLOCK
      ?auto_66191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66186 ?auto_66187 ) ) ( not ( = ?auto_66186 ?auto_66188 ) ) ( not ( = ?auto_66186 ?auto_66189 ) ) ( not ( = ?auto_66187 ?auto_66188 ) ) ( not ( = ?auto_66187 ?auto_66189 ) ) ( not ( = ?auto_66188 ?auto_66189 ) ) ( not ( = ?auto_66186 ?auto_66192 ) ) ( not ( = ?auto_66187 ?auto_66192 ) ) ( not ( = ?auto_66188 ?auto_66192 ) ) ( not ( = ?auto_66189 ?auto_66192 ) ) ( ON-TABLE ?auto_66190 ) ( not ( = ?auto_66190 ?auto_66192 ) ) ( not ( = ?auto_66190 ?auto_66189 ) ) ( not ( = ?auto_66190 ?auto_66188 ) ) ( not ( = ?auto_66186 ?auto_66190 ) ) ( not ( = ?auto_66187 ?auto_66190 ) ) ( ON ?auto_66186 ?auto_66191 ) ( not ( = ?auto_66186 ?auto_66191 ) ) ( not ( = ?auto_66187 ?auto_66191 ) ) ( not ( = ?auto_66188 ?auto_66191 ) ) ( not ( = ?auto_66189 ?auto_66191 ) ) ( not ( = ?auto_66192 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66191 ) ) ( ON ?auto_66187 ?auto_66186 ) ( ON-TABLE ?auto_66191 ) ( ON ?auto_66188 ?auto_66187 ) ( ON ?auto_66189 ?auto_66188 ) ( CLEAR ?auto_66190 ) ( ON ?auto_66192 ?auto_66189 ) ( CLEAR ?auto_66192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66191 ?auto_66186 ?auto_66187 ?auto_66188 ?auto_66189 )
      ( MAKE-4PILE ?auto_66186 ?auto_66187 ?auto_66188 ?auto_66189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66193 - BLOCK
      ?auto_66194 - BLOCK
      ?auto_66195 - BLOCK
      ?auto_66196 - BLOCK
    )
    :vars
    (
      ?auto_66197 - BLOCK
      ?auto_66199 - BLOCK
      ?auto_66198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66193 ?auto_66194 ) ) ( not ( = ?auto_66193 ?auto_66195 ) ) ( not ( = ?auto_66193 ?auto_66196 ) ) ( not ( = ?auto_66194 ?auto_66195 ) ) ( not ( = ?auto_66194 ?auto_66196 ) ) ( not ( = ?auto_66195 ?auto_66196 ) ) ( not ( = ?auto_66193 ?auto_66197 ) ) ( not ( = ?auto_66194 ?auto_66197 ) ) ( not ( = ?auto_66195 ?auto_66197 ) ) ( not ( = ?auto_66196 ?auto_66197 ) ) ( not ( = ?auto_66199 ?auto_66197 ) ) ( not ( = ?auto_66199 ?auto_66196 ) ) ( not ( = ?auto_66199 ?auto_66195 ) ) ( not ( = ?auto_66193 ?auto_66199 ) ) ( not ( = ?auto_66194 ?auto_66199 ) ) ( ON ?auto_66193 ?auto_66198 ) ( not ( = ?auto_66193 ?auto_66198 ) ) ( not ( = ?auto_66194 ?auto_66198 ) ) ( not ( = ?auto_66195 ?auto_66198 ) ) ( not ( = ?auto_66196 ?auto_66198 ) ) ( not ( = ?auto_66197 ?auto_66198 ) ) ( not ( = ?auto_66199 ?auto_66198 ) ) ( ON ?auto_66194 ?auto_66193 ) ( ON-TABLE ?auto_66198 ) ( ON ?auto_66195 ?auto_66194 ) ( ON ?auto_66196 ?auto_66195 ) ( ON ?auto_66197 ?auto_66196 ) ( CLEAR ?auto_66197 ) ( HOLDING ?auto_66199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66199 )
      ( MAKE-4PILE ?auto_66193 ?auto_66194 ?auto_66195 ?auto_66196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66200 - BLOCK
      ?auto_66201 - BLOCK
      ?auto_66202 - BLOCK
      ?auto_66203 - BLOCK
    )
    :vars
    (
      ?auto_66204 - BLOCK
      ?auto_66205 - BLOCK
      ?auto_66206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66200 ?auto_66201 ) ) ( not ( = ?auto_66200 ?auto_66202 ) ) ( not ( = ?auto_66200 ?auto_66203 ) ) ( not ( = ?auto_66201 ?auto_66202 ) ) ( not ( = ?auto_66201 ?auto_66203 ) ) ( not ( = ?auto_66202 ?auto_66203 ) ) ( not ( = ?auto_66200 ?auto_66204 ) ) ( not ( = ?auto_66201 ?auto_66204 ) ) ( not ( = ?auto_66202 ?auto_66204 ) ) ( not ( = ?auto_66203 ?auto_66204 ) ) ( not ( = ?auto_66205 ?auto_66204 ) ) ( not ( = ?auto_66205 ?auto_66203 ) ) ( not ( = ?auto_66205 ?auto_66202 ) ) ( not ( = ?auto_66200 ?auto_66205 ) ) ( not ( = ?auto_66201 ?auto_66205 ) ) ( ON ?auto_66200 ?auto_66206 ) ( not ( = ?auto_66200 ?auto_66206 ) ) ( not ( = ?auto_66201 ?auto_66206 ) ) ( not ( = ?auto_66202 ?auto_66206 ) ) ( not ( = ?auto_66203 ?auto_66206 ) ) ( not ( = ?auto_66204 ?auto_66206 ) ) ( not ( = ?auto_66205 ?auto_66206 ) ) ( ON ?auto_66201 ?auto_66200 ) ( ON-TABLE ?auto_66206 ) ( ON ?auto_66202 ?auto_66201 ) ( ON ?auto_66203 ?auto_66202 ) ( ON ?auto_66204 ?auto_66203 ) ( ON ?auto_66205 ?auto_66204 ) ( CLEAR ?auto_66205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66206 ?auto_66200 ?auto_66201 ?auto_66202 ?auto_66203 ?auto_66204 )
      ( MAKE-4PILE ?auto_66200 ?auto_66201 ?auto_66202 ?auto_66203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66208 - BLOCK
    )
    :vars
    (
      ?auto_66209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66209 ?auto_66208 ) ( CLEAR ?auto_66209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66208 ) ( not ( = ?auto_66208 ?auto_66209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66209 ?auto_66208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66210 - BLOCK
    )
    :vars
    (
      ?auto_66211 - BLOCK
      ?auto_66212 - BLOCK
      ?auto_66213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66211 ?auto_66210 ) ( CLEAR ?auto_66211 ) ( ON-TABLE ?auto_66210 ) ( not ( = ?auto_66210 ?auto_66211 ) ) ( HOLDING ?auto_66212 ) ( CLEAR ?auto_66213 ) ( not ( = ?auto_66210 ?auto_66212 ) ) ( not ( = ?auto_66210 ?auto_66213 ) ) ( not ( = ?auto_66211 ?auto_66212 ) ) ( not ( = ?auto_66211 ?auto_66213 ) ) ( not ( = ?auto_66212 ?auto_66213 ) ) )
    :subtasks
    ( ( !STACK ?auto_66212 ?auto_66213 )
      ( MAKE-1PILE ?auto_66210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66214 - BLOCK
    )
    :vars
    (
      ?auto_66215 - BLOCK
      ?auto_66216 - BLOCK
      ?auto_66217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66215 ?auto_66214 ) ( ON-TABLE ?auto_66214 ) ( not ( = ?auto_66214 ?auto_66215 ) ) ( CLEAR ?auto_66216 ) ( not ( = ?auto_66214 ?auto_66217 ) ) ( not ( = ?auto_66214 ?auto_66216 ) ) ( not ( = ?auto_66215 ?auto_66217 ) ) ( not ( = ?auto_66215 ?auto_66216 ) ) ( not ( = ?auto_66217 ?auto_66216 ) ) ( ON ?auto_66217 ?auto_66215 ) ( CLEAR ?auto_66217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66214 ?auto_66215 )
      ( MAKE-1PILE ?auto_66214 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66218 - BLOCK
    )
    :vars
    (
      ?auto_66221 - BLOCK
      ?auto_66219 - BLOCK
      ?auto_66220 - BLOCK
      ?auto_66222 - BLOCK
      ?auto_66223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66221 ?auto_66218 ) ( ON-TABLE ?auto_66218 ) ( not ( = ?auto_66218 ?auto_66221 ) ) ( not ( = ?auto_66218 ?auto_66219 ) ) ( not ( = ?auto_66218 ?auto_66220 ) ) ( not ( = ?auto_66221 ?auto_66219 ) ) ( not ( = ?auto_66221 ?auto_66220 ) ) ( not ( = ?auto_66219 ?auto_66220 ) ) ( ON ?auto_66219 ?auto_66221 ) ( CLEAR ?auto_66219 ) ( HOLDING ?auto_66220 ) ( CLEAR ?auto_66222 ) ( ON-TABLE ?auto_66223 ) ( ON ?auto_66222 ?auto_66223 ) ( not ( = ?auto_66223 ?auto_66222 ) ) ( not ( = ?auto_66223 ?auto_66220 ) ) ( not ( = ?auto_66222 ?auto_66220 ) ) ( not ( = ?auto_66218 ?auto_66222 ) ) ( not ( = ?auto_66218 ?auto_66223 ) ) ( not ( = ?auto_66221 ?auto_66222 ) ) ( not ( = ?auto_66221 ?auto_66223 ) ) ( not ( = ?auto_66219 ?auto_66222 ) ) ( not ( = ?auto_66219 ?auto_66223 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66223 ?auto_66222 ?auto_66220 )
      ( MAKE-1PILE ?auto_66218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66224 - BLOCK
    )
    :vars
    (
      ?auto_66229 - BLOCK
      ?auto_66228 - BLOCK
      ?auto_66225 - BLOCK
      ?auto_66227 - BLOCK
      ?auto_66226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66229 ?auto_66224 ) ( ON-TABLE ?auto_66224 ) ( not ( = ?auto_66224 ?auto_66229 ) ) ( not ( = ?auto_66224 ?auto_66228 ) ) ( not ( = ?auto_66224 ?auto_66225 ) ) ( not ( = ?auto_66229 ?auto_66228 ) ) ( not ( = ?auto_66229 ?auto_66225 ) ) ( not ( = ?auto_66228 ?auto_66225 ) ) ( ON ?auto_66228 ?auto_66229 ) ( CLEAR ?auto_66227 ) ( ON-TABLE ?auto_66226 ) ( ON ?auto_66227 ?auto_66226 ) ( not ( = ?auto_66226 ?auto_66227 ) ) ( not ( = ?auto_66226 ?auto_66225 ) ) ( not ( = ?auto_66227 ?auto_66225 ) ) ( not ( = ?auto_66224 ?auto_66227 ) ) ( not ( = ?auto_66224 ?auto_66226 ) ) ( not ( = ?auto_66229 ?auto_66227 ) ) ( not ( = ?auto_66229 ?auto_66226 ) ) ( not ( = ?auto_66228 ?auto_66227 ) ) ( not ( = ?auto_66228 ?auto_66226 ) ) ( ON ?auto_66225 ?auto_66228 ) ( CLEAR ?auto_66225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66224 ?auto_66229 ?auto_66228 )
      ( MAKE-1PILE ?auto_66224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66230 - BLOCK
    )
    :vars
    (
      ?auto_66234 - BLOCK
      ?auto_66233 - BLOCK
      ?auto_66235 - BLOCK
      ?auto_66232 - BLOCK
      ?auto_66231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66234 ?auto_66230 ) ( ON-TABLE ?auto_66230 ) ( not ( = ?auto_66230 ?auto_66234 ) ) ( not ( = ?auto_66230 ?auto_66233 ) ) ( not ( = ?auto_66230 ?auto_66235 ) ) ( not ( = ?auto_66234 ?auto_66233 ) ) ( not ( = ?auto_66234 ?auto_66235 ) ) ( not ( = ?auto_66233 ?auto_66235 ) ) ( ON ?auto_66233 ?auto_66234 ) ( ON-TABLE ?auto_66232 ) ( not ( = ?auto_66232 ?auto_66231 ) ) ( not ( = ?auto_66232 ?auto_66235 ) ) ( not ( = ?auto_66231 ?auto_66235 ) ) ( not ( = ?auto_66230 ?auto_66231 ) ) ( not ( = ?auto_66230 ?auto_66232 ) ) ( not ( = ?auto_66234 ?auto_66231 ) ) ( not ( = ?auto_66234 ?auto_66232 ) ) ( not ( = ?auto_66233 ?auto_66231 ) ) ( not ( = ?auto_66233 ?auto_66232 ) ) ( ON ?auto_66235 ?auto_66233 ) ( CLEAR ?auto_66235 ) ( HOLDING ?auto_66231 ) ( CLEAR ?auto_66232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66232 ?auto_66231 )
      ( MAKE-1PILE ?auto_66230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66236 - BLOCK
    )
    :vars
    (
      ?auto_66237 - BLOCK
      ?auto_66238 - BLOCK
      ?auto_66239 - BLOCK
      ?auto_66240 - BLOCK
      ?auto_66241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66237 ?auto_66236 ) ( ON-TABLE ?auto_66236 ) ( not ( = ?auto_66236 ?auto_66237 ) ) ( not ( = ?auto_66236 ?auto_66238 ) ) ( not ( = ?auto_66236 ?auto_66239 ) ) ( not ( = ?auto_66237 ?auto_66238 ) ) ( not ( = ?auto_66237 ?auto_66239 ) ) ( not ( = ?auto_66238 ?auto_66239 ) ) ( ON ?auto_66238 ?auto_66237 ) ( ON-TABLE ?auto_66240 ) ( not ( = ?auto_66240 ?auto_66241 ) ) ( not ( = ?auto_66240 ?auto_66239 ) ) ( not ( = ?auto_66241 ?auto_66239 ) ) ( not ( = ?auto_66236 ?auto_66241 ) ) ( not ( = ?auto_66236 ?auto_66240 ) ) ( not ( = ?auto_66237 ?auto_66241 ) ) ( not ( = ?auto_66237 ?auto_66240 ) ) ( not ( = ?auto_66238 ?auto_66241 ) ) ( not ( = ?auto_66238 ?auto_66240 ) ) ( ON ?auto_66239 ?auto_66238 ) ( CLEAR ?auto_66240 ) ( ON ?auto_66241 ?auto_66239 ) ( CLEAR ?auto_66241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66236 ?auto_66237 ?auto_66238 ?auto_66239 )
      ( MAKE-1PILE ?auto_66236 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66242 - BLOCK
    )
    :vars
    (
      ?auto_66246 - BLOCK
      ?auto_66243 - BLOCK
      ?auto_66245 - BLOCK
      ?auto_66247 - BLOCK
      ?auto_66244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66246 ?auto_66242 ) ( ON-TABLE ?auto_66242 ) ( not ( = ?auto_66242 ?auto_66246 ) ) ( not ( = ?auto_66242 ?auto_66243 ) ) ( not ( = ?auto_66242 ?auto_66245 ) ) ( not ( = ?auto_66246 ?auto_66243 ) ) ( not ( = ?auto_66246 ?auto_66245 ) ) ( not ( = ?auto_66243 ?auto_66245 ) ) ( ON ?auto_66243 ?auto_66246 ) ( not ( = ?auto_66247 ?auto_66244 ) ) ( not ( = ?auto_66247 ?auto_66245 ) ) ( not ( = ?auto_66244 ?auto_66245 ) ) ( not ( = ?auto_66242 ?auto_66244 ) ) ( not ( = ?auto_66242 ?auto_66247 ) ) ( not ( = ?auto_66246 ?auto_66244 ) ) ( not ( = ?auto_66246 ?auto_66247 ) ) ( not ( = ?auto_66243 ?auto_66244 ) ) ( not ( = ?auto_66243 ?auto_66247 ) ) ( ON ?auto_66245 ?auto_66243 ) ( ON ?auto_66244 ?auto_66245 ) ( CLEAR ?auto_66244 ) ( HOLDING ?auto_66247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66247 )
      ( MAKE-1PILE ?auto_66242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66248 - BLOCK
    )
    :vars
    (
      ?auto_66250 - BLOCK
      ?auto_66251 - BLOCK
      ?auto_66253 - BLOCK
      ?auto_66252 - BLOCK
      ?auto_66249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66250 ?auto_66248 ) ( ON-TABLE ?auto_66248 ) ( not ( = ?auto_66248 ?auto_66250 ) ) ( not ( = ?auto_66248 ?auto_66251 ) ) ( not ( = ?auto_66248 ?auto_66253 ) ) ( not ( = ?auto_66250 ?auto_66251 ) ) ( not ( = ?auto_66250 ?auto_66253 ) ) ( not ( = ?auto_66251 ?auto_66253 ) ) ( ON ?auto_66251 ?auto_66250 ) ( not ( = ?auto_66252 ?auto_66249 ) ) ( not ( = ?auto_66252 ?auto_66253 ) ) ( not ( = ?auto_66249 ?auto_66253 ) ) ( not ( = ?auto_66248 ?auto_66249 ) ) ( not ( = ?auto_66248 ?auto_66252 ) ) ( not ( = ?auto_66250 ?auto_66249 ) ) ( not ( = ?auto_66250 ?auto_66252 ) ) ( not ( = ?auto_66251 ?auto_66249 ) ) ( not ( = ?auto_66251 ?auto_66252 ) ) ( ON ?auto_66253 ?auto_66251 ) ( ON ?auto_66249 ?auto_66253 ) ( ON ?auto_66252 ?auto_66249 ) ( CLEAR ?auto_66252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66248 ?auto_66250 ?auto_66251 ?auto_66253 ?auto_66249 )
      ( MAKE-1PILE ?auto_66248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66254 - BLOCK
    )
    :vars
    (
      ?auto_66257 - BLOCK
      ?auto_66259 - BLOCK
      ?auto_66258 - BLOCK
      ?auto_66256 - BLOCK
      ?auto_66255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66257 ?auto_66254 ) ( ON-TABLE ?auto_66254 ) ( not ( = ?auto_66254 ?auto_66257 ) ) ( not ( = ?auto_66254 ?auto_66259 ) ) ( not ( = ?auto_66254 ?auto_66258 ) ) ( not ( = ?auto_66257 ?auto_66259 ) ) ( not ( = ?auto_66257 ?auto_66258 ) ) ( not ( = ?auto_66259 ?auto_66258 ) ) ( ON ?auto_66259 ?auto_66257 ) ( not ( = ?auto_66256 ?auto_66255 ) ) ( not ( = ?auto_66256 ?auto_66258 ) ) ( not ( = ?auto_66255 ?auto_66258 ) ) ( not ( = ?auto_66254 ?auto_66255 ) ) ( not ( = ?auto_66254 ?auto_66256 ) ) ( not ( = ?auto_66257 ?auto_66255 ) ) ( not ( = ?auto_66257 ?auto_66256 ) ) ( not ( = ?auto_66259 ?auto_66255 ) ) ( not ( = ?auto_66259 ?auto_66256 ) ) ( ON ?auto_66258 ?auto_66259 ) ( ON ?auto_66255 ?auto_66258 ) ( HOLDING ?auto_66256 ) ( CLEAR ?auto_66255 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66254 ?auto_66257 ?auto_66259 ?auto_66258 ?auto_66255 ?auto_66256 )
      ( MAKE-1PILE ?auto_66254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66260 - BLOCK
    )
    :vars
    (
      ?auto_66262 - BLOCK
      ?auto_66265 - BLOCK
      ?auto_66264 - BLOCK
      ?auto_66263 - BLOCK
      ?auto_66261 - BLOCK
      ?auto_66266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66262 ?auto_66260 ) ( ON-TABLE ?auto_66260 ) ( not ( = ?auto_66260 ?auto_66262 ) ) ( not ( = ?auto_66260 ?auto_66265 ) ) ( not ( = ?auto_66260 ?auto_66264 ) ) ( not ( = ?auto_66262 ?auto_66265 ) ) ( not ( = ?auto_66262 ?auto_66264 ) ) ( not ( = ?auto_66265 ?auto_66264 ) ) ( ON ?auto_66265 ?auto_66262 ) ( not ( = ?auto_66263 ?auto_66261 ) ) ( not ( = ?auto_66263 ?auto_66264 ) ) ( not ( = ?auto_66261 ?auto_66264 ) ) ( not ( = ?auto_66260 ?auto_66261 ) ) ( not ( = ?auto_66260 ?auto_66263 ) ) ( not ( = ?auto_66262 ?auto_66261 ) ) ( not ( = ?auto_66262 ?auto_66263 ) ) ( not ( = ?auto_66265 ?auto_66261 ) ) ( not ( = ?auto_66265 ?auto_66263 ) ) ( ON ?auto_66264 ?auto_66265 ) ( ON ?auto_66261 ?auto_66264 ) ( CLEAR ?auto_66261 ) ( ON ?auto_66263 ?auto_66266 ) ( CLEAR ?auto_66263 ) ( HAND-EMPTY ) ( not ( = ?auto_66260 ?auto_66266 ) ) ( not ( = ?auto_66262 ?auto_66266 ) ) ( not ( = ?auto_66265 ?auto_66266 ) ) ( not ( = ?auto_66264 ?auto_66266 ) ) ( not ( = ?auto_66263 ?auto_66266 ) ) ( not ( = ?auto_66261 ?auto_66266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66263 ?auto_66266 )
      ( MAKE-1PILE ?auto_66260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66267 - BLOCK
    )
    :vars
    (
      ?auto_66270 - BLOCK
      ?auto_66272 - BLOCK
      ?auto_66271 - BLOCK
      ?auto_66269 - BLOCK
      ?auto_66273 - BLOCK
      ?auto_66268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66270 ?auto_66267 ) ( ON-TABLE ?auto_66267 ) ( not ( = ?auto_66267 ?auto_66270 ) ) ( not ( = ?auto_66267 ?auto_66272 ) ) ( not ( = ?auto_66267 ?auto_66271 ) ) ( not ( = ?auto_66270 ?auto_66272 ) ) ( not ( = ?auto_66270 ?auto_66271 ) ) ( not ( = ?auto_66272 ?auto_66271 ) ) ( ON ?auto_66272 ?auto_66270 ) ( not ( = ?auto_66269 ?auto_66273 ) ) ( not ( = ?auto_66269 ?auto_66271 ) ) ( not ( = ?auto_66273 ?auto_66271 ) ) ( not ( = ?auto_66267 ?auto_66273 ) ) ( not ( = ?auto_66267 ?auto_66269 ) ) ( not ( = ?auto_66270 ?auto_66273 ) ) ( not ( = ?auto_66270 ?auto_66269 ) ) ( not ( = ?auto_66272 ?auto_66273 ) ) ( not ( = ?auto_66272 ?auto_66269 ) ) ( ON ?auto_66271 ?auto_66272 ) ( ON ?auto_66269 ?auto_66268 ) ( CLEAR ?auto_66269 ) ( not ( = ?auto_66267 ?auto_66268 ) ) ( not ( = ?auto_66270 ?auto_66268 ) ) ( not ( = ?auto_66272 ?auto_66268 ) ) ( not ( = ?auto_66271 ?auto_66268 ) ) ( not ( = ?auto_66269 ?auto_66268 ) ) ( not ( = ?auto_66273 ?auto_66268 ) ) ( HOLDING ?auto_66273 ) ( CLEAR ?auto_66271 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66267 ?auto_66270 ?auto_66272 ?auto_66271 ?auto_66273 )
      ( MAKE-1PILE ?auto_66267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66274 - BLOCK
    )
    :vars
    (
      ?auto_66277 - BLOCK
      ?auto_66280 - BLOCK
      ?auto_66279 - BLOCK
      ?auto_66278 - BLOCK
      ?auto_66276 - BLOCK
      ?auto_66275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66277 ?auto_66274 ) ( ON-TABLE ?auto_66274 ) ( not ( = ?auto_66274 ?auto_66277 ) ) ( not ( = ?auto_66274 ?auto_66280 ) ) ( not ( = ?auto_66274 ?auto_66279 ) ) ( not ( = ?auto_66277 ?auto_66280 ) ) ( not ( = ?auto_66277 ?auto_66279 ) ) ( not ( = ?auto_66280 ?auto_66279 ) ) ( ON ?auto_66280 ?auto_66277 ) ( not ( = ?auto_66278 ?auto_66276 ) ) ( not ( = ?auto_66278 ?auto_66279 ) ) ( not ( = ?auto_66276 ?auto_66279 ) ) ( not ( = ?auto_66274 ?auto_66276 ) ) ( not ( = ?auto_66274 ?auto_66278 ) ) ( not ( = ?auto_66277 ?auto_66276 ) ) ( not ( = ?auto_66277 ?auto_66278 ) ) ( not ( = ?auto_66280 ?auto_66276 ) ) ( not ( = ?auto_66280 ?auto_66278 ) ) ( ON ?auto_66279 ?auto_66280 ) ( ON ?auto_66278 ?auto_66275 ) ( not ( = ?auto_66274 ?auto_66275 ) ) ( not ( = ?auto_66277 ?auto_66275 ) ) ( not ( = ?auto_66280 ?auto_66275 ) ) ( not ( = ?auto_66279 ?auto_66275 ) ) ( not ( = ?auto_66278 ?auto_66275 ) ) ( not ( = ?auto_66276 ?auto_66275 ) ) ( CLEAR ?auto_66279 ) ( ON ?auto_66276 ?auto_66278 ) ( CLEAR ?auto_66276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66275 ?auto_66278 )
      ( MAKE-1PILE ?auto_66274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66281 - BLOCK
    )
    :vars
    (
      ?auto_66282 - BLOCK
      ?auto_66286 - BLOCK
      ?auto_66287 - BLOCK
      ?auto_66284 - BLOCK
      ?auto_66283 - BLOCK
      ?auto_66285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66282 ?auto_66281 ) ( ON-TABLE ?auto_66281 ) ( not ( = ?auto_66281 ?auto_66282 ) ) ( not ( = ?auto_66281 ?auto_66286 ) ) ( not ( = ?auto_66281 ?auto_66287 ) ) ( not ( = ?auto_66282 ?auto_66286 ) ) ( not ( = ?auto_66282 ?auto_66287 ) ) ( not ( = ?auto_66286 ?auto_66287 ) ) ( ON ?auto_66286 ?auto_66282 ) ( not ( = ?auto_66284 ?auto_66283 ) ) ( not ( = ?auto_66284 ?auto_66287 ) ) ( not ( = ?auto_66283 ?auto_66287 ) ) ( not ( = ?auto_66281 ?auto_66283 ) ) ( not ( = ?auto_66281 ?auto_66284 ) ) ( not ( = ?auto_66282 ?auto_66283 ) ) ( not ( = ?auto_66282 ?auto_66284 ) ) ( not ( = ?auto_66286 ?auto_66283 ) ) ( not ( = ?auto_66286 ?auto_66284 ) ) ( ON ?auto_66284 ?auto_66285 ) ( not ( = ?auto_66281 ?auto_66285 ) ) ( not ( = ?auto_66282 ?auto_66285 ) ) ( not ( = ?auto_66286 ?auto_66285 ) ) ( not ( = ?auto_66287 ?auto_66285 ) ) ( not ( = ?auto_66284 ?auto_66285 ) ) ( not ( = ?auto_66283 ?auto_66285 ) ) ( ON ?auto_66283 ?auto_66284 ) ( CLEAR ?auto_66283 ) ( ON-TABLE ?auto_66285 ) ( HOLDING ?auto_66287 ) ( CLEAR ?auto_66286 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66281 ?auto_66282 ?auto_66286 ?auto_66287 )
      ( MAKE-1PILE ?auto_66281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66288 - BLOCK
    )
    :vars
    (
      ?auto_66291 - BLOCK
      ?auto_66292 - BLOCK
      ?auto_66293 - BLOCK
      ?auto_66290 - BLOCK
      ?auto_66294 - BLOCK
      ?auto_66289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66291 ?auto_66288 ) ( ON-TABLE ?auto_66288 ) ( not ( = ?auto_66288 ?auto_66291 ) ) ( not ( = ?auto_66288 ?auto_66292 ) ) ( not ( = ?auto_66288 ?auto_66293 ) ) ( not ( = ?auto_66291 ?auto_66292 ) ) ( not ( = ?auto_66291 ?auto_66293 ) ) ( not ( = ?auto_66292 ?auto_66293 ) ) ( ON ?auto_66292 ?auto_66291 ) ( not ( = ?auto_66290 ?auto_66294 ) ) ( not ( = ?auto_66290 ?auto_66293 ) ) ( not ( = ?auto_66294 ?auto_66293 ) ) ( not ( = ?auto_66288 ?auto_66294 ) ) ( not ( = ?auto_66288 ?auto_66290 ) ) ( not ( = ?auto_66291 ?auto_66294 ) ) ( not ( = ?auto_66291 ?auto_66290 ) ) ( not ( = ?auto_66292 ?auto_66294 ) ) ( not ( = ?auto_66292 ?auto_66290 ) ) ( ON ?auto_66290 ?auto_66289 ) ( not ( = ?auto_66288 ?auto_66289 ) ) ( not ( = ?auto_66291 ?auto_66289 ) ) ( not ( = ?auto_66292 ?auto_66289 ) ) ( not ( = ?auto_66293 ?auto_66289 ) ) ( not ( = ?auto_66290 ?auto_66289 ) ) ( not ( = ?auto_66294 ?auto_66289 ) ) ( ON ?auto_66294 ?auto_66290 ) ( ON-TABLE ?auto_66289 ) ( CLEAR ?auto_66292 ) ( ON ?auto_66293 ?auto_66294 ) ( CLEAR ?auto_66293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66289 ?auto_66290 ?auto_66294 )
      ( MAKE-1PILE ?auto_66288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66295 - BLOCK
    )
    :vars
    (
      ?auto_66300 - BLOCK
      ?auto_66297 - BLOCK
      ?auto_66301 - BLOCK
      ?auto_66296 - BLOCK
      ?auto_66298 - BLOCK
      ?auto_66299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66300 ?auto_66295 ) ( ON-TABLE ?auto_66295 ) ( not ( = ?auto_66295 ?auto_66300 ) ) ( not ( = ?auto_66295 ?auto_66297 ) ) ( not ( = ?auto_66295 ?auto_66301 ) ) ( not ( = ?auto_66300 ?auto_66297 ) ) ( not ( = ?auto_66300 ?auto_66301 ) ) ( not ( = ?auto_66297 ?auto_66301 ) ) ( not ( = ?auto_66296 ?auto_66298 ) ) ( not ( = ?auto_66296 ?auto_66301 ) ) ( not ( = ?auto_66298 ?auto_66301 ) ) ( not ( = ?auto_66295 ?auto_66298 ) ) ( not ( = ?auto_66295 ?auto_66296 ) ) ( not ( = ?auto_66300 ?auto_66298 ) ) ( not ( = ?auto_66300 ?auto_66296 ) ) ( not ( = ?auto_66297 ?auto_66298 ) ) ( not ( = ?auto_66297 ?auto_66296 ) ) ( ON ?auto_66296 ?auto_66299 ) ( not ( = ?auto_66295 ?auto_66299 ) ) ( not ( = ?auto_66300 ?auto_66299 ) ) ( not ( = ?auto_66297 ?auto_66299 ) ) ( not ( = ?auto_66301 ?auto_66299 ) ) ( not ( = ?auto_66296 ?auto_66299 ) ) ( not ( = ?auto_66298 ?auto_66299 ) ) ( ON ?auto_66298 ?auto_66296 ) ( ON-TABLE ?auto_66299 ) ( ON ?auto_66301 ?auto_66298 ) ( CLEAR ?auto_66301 ) ( HOLDING ?auto_66297 ) ( CLEAR ?auto_66300 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66295 ?auto_66300 ?auto_66297 )
      ( MAKE-1PILE ?auto_66295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66302 - BLOCK
    )
    :vars
    (
      ?auto_66307 - BLOCK
      ?auto_66304 - BLOCK
      ?auto_66303 - BLOCK
      ?auto_66308 - BLOCK
      ?auto_66306 - BLOCK
      ?auto_66305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66307 ?auto_66302 ) ( ON-TABLE ?auto_66302 ) ( not ( = ?auto_66302 ?auto_66307 ) ) ( not ( = ?auto_66302 ?auto_66304 ) ) ( not ( = ?auto_66302 ?auto_66303 ) ) ( not ( = ?auto_66307 ?auto_66304 ) ) ( not ( = ?auto_66307 ?auto_66303 ) ) ( not ( = ?auto_66304 ?auto_66303 ) ) ( not ( = ?auto_66308 ?auto_66306 ) ) ( not ( = ?auto_66308 ?auto_66303 ) ) ( not ( = ?auto_66306 ?auto_66303 ) ) ( not ( = ?auto_66302 ?auto_66306 ) ) ( not ( = ?auto_66302 ?auto_66308 ) ) ( not ( = ?auto_66307 ?auto_66306 ) ) ( not ( = ?auto_66307 ?auto_66308 ) ) ( not ( = ?auto_66304 ?auto_66306 ) ) ( not ( = ?auto_66304 ?auto_66308 ) ) ( ON ?auto_66308 ?auto_66305 ) ( not ( = ?auto_66302 ?auto_66305 ) ) ( not ( = ?auto_66307 ?auto_66305 ) ) ( not ( = ?auto_66304 ?auto_66305 ) ) ( not ( = ?auto_66303 ?auto_66305 ) ) ( not ( = ?auto_66308 ?auto_66305 ) ) ( not ( = ?auto_66306 ?auto_66305 ) ) ( ON ?auto_66306 ?auto_66308 ) ( ON-TABLE ?auto_66305 ) ( ON ?auto_66303 ?auto_66306 ) ( CLEAR ?auto_66307 ) ( ON ?auto_66304 ?auto_66303 ) ( CLEAR ?auto_66304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66305 ?auto_66308 ?auto_66306 ?auto_66303 )
      ( MAKE-1PILE ?auto_66302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66323 - BLOCK
    )
    :vars
    (
      ?auto_66326 - BLOCK
      ?auto_66327 - BLOCK
      ?auto_66329 - BLOCK
      ?auto_66328 - BLOCK
      ?auto_66324 - BLOCK
      ?auto_66325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66323 ?auto_66326 ) ) ( not ( = ?auto_66323 ?auto_66327 ) ) ( not ( = ?auto_66323 ?auto_66329 ) ) ( not ( = ?auto_66326 ?auto_66327 ) ) ( not ( = ?auto_66326 ?auto_66329 ) ) ( not ( = ?auto_66327 ?auto_66329 ) ) ( not ( = ?auto_66328 ?auto_66324 ) ) ( not ( = ?auto_66328 ?auto_66329 ) ) ( not ( = ?auto_66324 ?auto_66329 ) ) ( not ( = ?auto_66323 ?auto_66324 ) ) ( not ( = ?auto_66323 ?auto_66328 ) ) ( not ( = ?auto_66326 ?auto_66324 ) ) ( not ( = ?auto_66326 ?auto_66328 ) ) ( not ( = ?auto_66327 ?auto_66324 ) ) ( not ( = ?auto_66327 ?auto_66328 ) ) ( ON ?auto_66328 ?auto_66325 ) ( not ( = ?auto_66323 ?auto_66325 ) ) ( not ( = ?auto_66326 ?auto_66325 ) ) ( not ( = ?auto_66327 ?auto_66325 ) ) ( not ( = ?auto_66329 ?auto_66325 ) ) ( not ( = ?auto_66328 ?auto_66325 ) ) ( not ( = ?auto_66324 ?auto_66325 ) ) ( ON ?auto_66324 ?auto_66328 ) ( ON-TABLE ?auto_66325 ) ( ON ?auto_66329 ?auto_66324 ) ( ON ?auto_66327 ?auto_66329 ) ( ON ?auto_66326 ?auto_66327 ) ( CLEAR ?auto_66326 ) ( HOLDING ?auto_66323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66323 ?auto_66326 )
      ( MAKE-1PILE ?auto_66323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_66330 - BLOCK
    )
    :vars
    (
      ?auto_66333 - BLOCK
      ?auto_66335 - BLOCK
      ?auto_66334 - BLOCK
      ?auto_66332 - BLOCK
      ?auto_66331 - BLOCK
      ?auto_66336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66330 ?auto_66333 ) ) ( not ( = ?auto_66330 ?auto_66335 ) ) ( not ( = ?auto_66330 ?auto_66334 ) ) ( not ( = ?auto_66333 ?auto_66335 ) ) ( not ( = ?auto_66333 ?auto_66334 ) ) ( not ( = ?auto_66335 ?auto_66334 ) ) ( not ( = ?auto_66332 ?auto_66331 ) ) ( not ( = ?auto_66332 ?auto_66334 ) ) ( not ( = ?auto_66331 ?auto_66334 ) ) ( not ( = ?auto_66330 ?auto_66331 ) ) ( not ( = ?auto_66330 ?auto_66332 ) ) ( not ( = ?auto_66333 ?auto_66331 ) ) ( not ( = ?auto_66333 ?auto_66332 ) ) ( not ( = ?auto_66335 ?auto_66331 ) ) ( not ( = ?auto_66335 ?auto_66332 ) ) ( ON ?auto_66332 ?auto_66336 ) ( not ( = ?auto_66330 ?auto_66336 ) ) ( not ( = ?auto_66333 ?auto_66336 ) ) ( not ( = ?auto_66335 ?auto_66336 ) ) ( not ( = ?auto_66334 ?auto_66336 ) ) ( not ( = ?auto_66332 ?auto_66336 ) ) ( not ( = ?auto_66331 ?auto_66336 ) ) ( ON ?auto_66331 ?auto_66332 ) ( ON-TABLE ?auto_66336 ) ( ON ?auto_66334 ?auto_66331 ) ( ON ?auto_66335 ?auto_66334 ) ( ON ?auto_66333 ?auto_66335 ) ( ON ?auto_66330 ?auto_66333 ) ( CLEAR ?auto_66330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66336 ?auto_66332 ?auto_66331 ?auto_66334 ?auto_66335 ?auto_66333 )
      ( MAKE-1PILE ?auto_66330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66342 - BLOCK
      ?auto_66343 - BLOCK
      ?auto_66344 - BLOCK
      ?auto_66345 - BLOCK
      ?auto_66346 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66346 ) ( CLEAR ?auto_66345 ) ( ON-TABLE ?auto_66342 ) ( ON ?auto_66343 ?auto_66342 ) ( ON ?auto_66344 ?auto_66343 ) ( ON ?auto_66345 ?auto_66344 ) ( not ( = ?auto_66342 ?auto_66343 ) ) ( not ( = ?auto_66342 ?auto_66344 ) ) ( not ( = ?auto_66342 ?auto_66345 ) ) ( not ( = ?auto_66342 ?auto_66346 ) ) ( not ( = ?auto_66343 ?auto_66344 ) ) ( not ( = ?auto_66343 ?auto_66345 ) ) ( not ( = ?auto_66343 ?auto_66346 ) ) ( not ( = ?auto_66344 ?auto_66345 ) ) ( not ( = ?auto_66344 ?auto_66346 ) ) ( not ( = ?auto_66345 ?auto_66346 ) ) )
    :subtasks
    ( ( !STACK ?auto_66346 ?auto_66345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66347 - BLOCK
      ?auto_66348 - BLOCK
      ?auto_66349 - BLOCK
      ?auto_66350 - BLOCK
      ?auto_66351 - BLOCK
    )
    :vars
    (
      ?auto_66352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66350 ) ( ON-TABLE ?auto_66347 ) ( ON ?auto_66348 ?auto_66347 ) ( ON ?auto_66349 ?auto_66348 ) ( ON ?auto_66350 ?auto_66349 ) ( not ( = ?auto_66347 ?auto_66348 ) ) ( not ( = ?auto_66347 ?auto_66349 ) ) ( not ( = ?auto_66347 ?auto_66350 ) ) ( not ( = ?auto_66347 ?auto_66351 ) ) ( not ( = ?auto_66348 ?auto_66349 ) ) ( not ( = ?auto_66348 ?auto_66350 ) ) ( not ( = ?auto_66348 ?auto_66351 ) ) ( not ( = ?auto_66349 ?auto_66350 ) ) ( not ( = ?auto_66349 ?auto_66351 ) ) ( not ( = ?auto_66350 ?auto_66351 ) ) ( ON ?auto_66351 ?auto_66352 ) ( CLEAR ?auto_66351 ) ( HAND-EMPTY ) ( not ( = ?auto_66347 ?auto_66352 ) ) ( not ( = ?auto_66348 ?auto_66352 ) ) ( not ( = ?auto_66349 ?auto_66352 ) ) ( not ( = ?auto_66350 ?auto_66352 ) ) ( not ( = ?auto_66351 ?auto_66352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66351 ?auto_66352 )
      ( MAKE-5PILE ?auto_66347 ?auto_66348 ?auto_66349 ?auto_66350 ?auto_66351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66353 - BLOCK
      ?auto_66354 - BLOCK
      ?auto_66355 - BLOCK
      ?auto_66356 - BLOCK
      ?auto_66357 - BLOCK
    )
    :vars
    (
      ?auto_66358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66353 ) ( ON ?auto_66354 ?auto_66353 ) ( ON ?auto_66355 ?auto_66354 ) ( not ( = ?auto_66353 ?auto_66354 ) ) ( not ( = ?auto_66353 ?auto_66355 ) ) ( not ( = ?auto_66353 ?auto_66356 ) ) ( not ( = ?auto_66353 ?auto_66357 ) ) ( not ( = ?auto_66354 ?auto_66355 ) ) ( not ( = ?auto_66354 ?auto_66356 ) ) ( not ( = ?auto_66354 ?auto_66357 ) ) ( not ( = ?auto_66355 ?auto_66356 ) ) ( not ( = ?auto_66355 ?auto_66357 ) ) ( not ( = ?auto_66356 ?auto_66357 ) ) ( ON ?auto_66357 ?auto_66358 ) ( CLEAR ?auto_66357 ) ( not ( = ?auto_66353 ?auto_66358 ) ) ( not ( = ?auto_66354 ?auto_66358 ) ) ( not ( = ?auto_66355 ?auto_66358 ) ) ( not ( = ?auto_66356 ?auto_66358 ) ) ( not ( = ?auto_66357 ?auto_66358 ) ) ( HOLDING ?auto_66356 ) ( CLEAR ?auto_66355 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66353 ?auto_66354 ?auto_66355 ?auto_66356 )
      ( MAKE-5PILE ?auto_66353 ?auto_66354 ?auto_66355 ?auto_66356 ?auto_66357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66359 - BLOCK
      ?auto_66360 - BLOCK
      ?auto_66361 - BLOCK
      ?auto_66362 - BLOCK
      ?auto_66363 - BLOCK
    )
    :vars
    (
      ?auto_66364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66359 ) ( ON ?auto_66360 ?auto_66359 ) ( ON ?auto_66361 ?auto_66360 ) ( not ( = ?auto_66359 ?auto_66360 ) ) ( not ( = ?auto_66359 ?auto_66361 ) ) ( not ( = ?auto_66359 ?auto_66362 ) ) ( not ( = ?auto_66359 ?auto_66363 ) ) ( not ( = ?auto_66360 ?auto_66361 ) ) ( not ( = ?auto_66360 ?auto_66362 ) ) ( not ( = ?auto_66360 ?auto_66363 ) ) ( not ( = ?auto_66361 ?auto_66362 ) ) ( not ( = ?auto_66361 ?auto_66363 ) ) ( not ( = ?auto_66362 ?auto_66363 ) ) ( ON ?auto_66363 ?auto_66364 ) ( not ( = ?auto_66359 ?auto_66364 ) ) ( not ( = ?auto_66360 ?auto_66364 ) ) ( not ( = ?auto_66361 ?auto_66364 ) ) ( not ( = ?auto_66362 ?auto_66364 ) ) ( not ( = ?auto_66363 ?auto_66364 ) ) ( CLEAR ?auto_66361 ) ( ON ?auto_66362 ?auto_66363 ) ( CLEAR ?auto_66362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66364 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66364 ?auto_66363 )
      ( MAKE-5PILE ?auto_66359 ?auto_66360 ?auto_66361 ?auto_66362 ?auto_66363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66365 - BLOCK
      ?auto_66366 - BLOCK
      ?auto_66367 - BLOCK
      ?auto_66368 - BLOCK
      ?auto_66369 - BLOCK
    )
    :vars
    (
      ?auto_66370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66365 ) ( ON ?auto_66366 ?auto_66365 ) ( not ( = ?auto_66365 ?auto_66366 ) ) ( not ( = ?auto_66365 ?auto_66367 ) ) ( not ( = ?auto_66365 ?auto_66368 ) ) ( not ( = ?auto_66365 ?auto_66369 ) ) ( not ( = ?auto_66366 ?auto_66367 ) ) ( not ( = ?auto_66366 ?auto_66368 ) ) ( not ( = ?auto_66366 ?auto_66369 ) ) ( not ( = ?auto_66367 ?auto_66368 ) ) ( not ( = ?auto_66367 ?auto_66369 ) ) ( not ( = ?auto_66368 ?auto_66369 ) ) ( ON ?auto_66369 ?auto_66370 ) ( not ( = ?auto_66365 ?auto_66370 ) ) ( not ( = ?auto_66366 ?auto_66370 ) ) ( not ( = ?auto_66367 ?auto_66370 ) ) ( not ( = ?auto_66368 ?auto_66370 ) ) ( not ( = ?auto_66369 ?auto_66370 ) ) ( ON ?auto_66368 ?auto_66369 ) ( CLEAR ?auto_66368 ) ( ON-TABLE ?auto_66370 ) ( HOLDING ?auto_66367 ) ( CLEAR ?auto_66366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66365 ?auto_66366 ?auto_66367 )
      ( MAKE-5PILE ?auto_66365 ?auto_66366 ?auto_66367 ?auto_66368 ?auto_66369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66371 - BLOCK
      ?auto_66372 - BLOCK
      ?auto_66373 - BLOCK
      ?auto_66374 - BLOCK
      ?auto_66375 - BLOCK
    )
    :vars
    (
      ?auto_66376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66371 ) ( ON ?auto_66372 ?auto_66371 ) ( not ( = ?auto_66371 ?auto_66372 ) ) ( not ( = ?auto_66371 ?auto_66373 ) ) ( not ( = ?auto_66371 ?auto_66374 ) ) ( not ( = ?auto_66371 ?auto_66375 ) ) ( not ( = ?auto_66372 ?auto_66373 ) ) ( not ( = ?auto_66372 ?auto_66374 ) ) ( not ( = ?auto_66372 ?auto_66375 ) ) ( not ( = ?auto_66373 ?auto_66374 ) ) ( not ( = ?auto_66373 ?auto_66375 ) ) ( not ( = ?auto_66374 ?auto_66375 ) ) ( ON ?auto_66375 ?auto_66376 ) ( not ( = ?auto_66371 ?auto_66376 ) ) ( not ( = ?auto_66372 ?auto_66376 ) ) ( not ( = ?auto_66373 ?auto_66376 ) ) ( not ( = ?auto_66374 ?auto_66376 ) ) ( not ( = ?auto_66375 ?auto_66376 ) ) ( ON ?auto_66374 ?auto_66375 ) ( ON-TABLE ?auto_66376 ) ( CLEAR ?auto_66372 ) ( ON ?auto_66373 ?auto_66374 ) ( CLEAR ?auto_66373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66376 ?auto_66375 ?auto_66374 )
      ( MAKE-5PILE ?auto_66371 ?auto_66372 ?auto_66373 ?auto_66374 ?auto_66375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66377 - BLOCK
      ?auto_66378 - BLOCK
      ?auto_66379 - BLOCK
      ?auto_66380 - BLOCK
      ?auto_66381 - BLOCK
    )
    :vars
    (
      ?auto_66382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66377 ) ( not ( = ?auto_66377 ?auto_66378 ) ) ( not ( = ?auto_66377 ?auto_66379 ) ) ( not ( = ?auto_66377 ?auto_66380 ) ) ( not ( = ?auto_66377 ?auto_66381 ) ) ( not ( = ?auto_66378 ?auto_66379 ) ) ( not ( = ?auto_66378 ?auto_66380 ) ) ( not ( = ?auto_66378 ?auto_66381 ) ) ( not ( = ?auto_66379 ?auto_66380 ) ) ( not ( = ?auto_66379 ?auto_66381 ) ) ( not ( = ?auto_66380 ?auto_66381 ) ) ( ON ?auto_66381 ?auto_66382 ) ( not ( = ?auto_66377 ?auto_66382 ) ) ( not ( = ?auto_66378 ?auto_66382 ) ) ( not ( = ?auto_66379 ?auto_66382 ) ) ( not ( = ?auto_66380 ?auto_66382 ) ) ( not ( = ?auto_66381 ?auto_66382 ) ) ( ON ?auto_66380 ?auto_66381 ) ( ON-TABLE ?auto_66382 ) ( ON ?auto_66379 ?auto_66380 ) ( CLEAR ?auto_66379 ) ( HOLDING ?auto_66378 ) ( CLEAR ?auto_66377 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66377 ?auto_66378 )
      ( MAKE-5PILE ?auto_66377 ?auto_66378 ?auto_66379 ?auto_66380 ?auto_66381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66383 - BLOCK
      ?auto_66384 - BLOCK
      ?auto_66385 - BLOCK
      ?auto_66386 - BLOCK
      ?auto_66387 - BLOCK
    )
    :vars
    (
      ?auto_66388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66383 ) ( not ( = ?auto_66383 ?auto_66384 ) ) ( not ( = ?auto_66383 ?auto_66385 ) ) ( not ( = ?auto_66383 ?auto_66386 ) ) ( not ( = ?auto_66383 ?auto_66387 ) ) ( not ( = ?auto_66384 ?auto_66385 ) ) ( not ( = ?auto_66384 ?auto_66386 ) ) ( not ( = ?auto_66384 ?auto_66387 ) ) ( not ( = ?auto_66385 ?auto_66386 ) ) ( not ( = ?auto_66385 ?auto_66387 ) ) ( not ( = ?auto_66386 ?auto_66387 ) ) ( ON ?auto_66387 ?auto_66388 ) ( not ( = ?auto_66383 ?auto_66388 ) ) ( not ( = ?auto_66384 ?auto_66388 ) ) ( not ( = ?auto_66385 ?auto_66388 ) ) ( not ( = ?auto_66386 ?auto_66388 ) ) ( not ( = ?auto_66387 ?auto_66388 ) ) ( ON ?auto_66386 ?auto_66387 ) ( ON-TABLE ?auto_66388 ) ( ON ?auto_66385 ?auto_66386 ) ( CLEAR ?auto_66383 ) ( ON ?auto_66384 ?auto_66385 ) ( CLEAR ?auto_66384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66388 ?auto_66387 ?auto_66386 ?auto_66385 )
      ( MAKE-5PILE ?auto_66383 ?auto_66384 ?auto_66385 ?auto_66386 ?auto_66387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66389 - BLOCK
      ?auto_66390 - BLOCK
      ?auto_66391 - BLOCK
      ?auto_66392 - BLOCK
      ?auto_66393 - BLOCK
    )
    :vars
    (
      ?auto_66394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66389 ?auto_66390 ) ) ( not ( = ?auto_66389 ?auto_66391 ) ) ( not ( = ?auto_66389 ?auto_66392 ) ) ( not ( = ?auto_66389 ?auto_66393 ) ) ( not ( = ?auto_66390 ?auto_66391 ) ) ( not ( = ?auto_66390 ?auto_66392 ) ) ( not ( = ?auto_66390 ?auto_66393 ) ) ( not ( = ?auto_66391 ?auto_66392 ) ) ( not ( = ?auto_66391 ?auto_66393 ) ) ( not ( = ?auto_66392 ?auto_66393 ) ) ( ON ?auto_66393 ?auto_66394 ) ( not ( = ?auto_66389 ?auto_66394 ) ) ( not ( = ?auto_66390 ?auto_66394 ) ) ( not ( = ?auto_66391 ?auto_66394 ) ) ( not ( = ?auto_66392 ?auto_66394 ) ) ( not ( = ?auto_66393 ?auto_66394 ) ) ( ON ?auto_66392 ?auto_66393 ) ( ON-TABLE ?auto_66394 ) ( ON ?auto_66391 ?auto_66392 ) ( ON ?auto_66390 ?auto_66391 ) ( CLEAR ?auto_66390 ) ( HOLDING ?auto_66389 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66389 )
      ( MAKE-5PILE ?auto_66389 ?auto_66390 ?auto_66391 ?auto_66392 ?auto_66393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66395 - BLOCK
      ?auto_66396 - BLOCK
      ?auto_66397 - BLOCK
      ?auto_66398 - BLOCK
      ?auto_66399 - BLOCK
    )
    :vars
    (
      ?auto_66400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66395 ?auto_66396 ) ) ( not ( = ?auto_66395 ?auto_66397 ) ) ( not ( = ?auto_66395 ?auto_66398 ) ) ( not ( = ?auto_66395 ?auto_66399 ) ) ( not ( = ?auto_66396 ?auto_66397 ) ) ( not ( = ?auto_66396 ?auto_66398 ) ) ( not ( = ?auto_66396 ?auto_66399 ) ) ( not ( = ?auto_66397 ?auto_66398 ) ) ( not ( = ?auto_66397 ?auto_66399 ) ) ( not ( = ?auto_66398 ?auto_66399 ) ) ( ON ?auto_66399 ?auto_66400 ) ( not ( = ?auto_66395 ?auto_66400 ) ) ( not ( = ?auto_66396 ?auto_66400 ) ) ( not ( = ?auto_66397 ?auto_66400 ) ) ( not ( = ?auto_66398 ?auto_66400 ) ) ( not ( = ?auto_66399 ?auto_66400 ) ) ( ON ?auto_66398 ?auto_66399 ) ( ON-TABLE ?auto_66400 ) ( ON ?auto_66397 ?auto_66398 ) ( ON ?auto_66396 ?auto_66397 ) ( ON ?auto_66395 ?auto_66396 ) ( CLEAR ?auto_66395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66400 ?auto_66399 ?auto_66398 ?auto_66397 ?auto_66396 )
      ( MAKE-5PILE ?auto_66395 ?auto_66396 ?auto_66397 ?auto_66398 ?auto_66399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66401 - BLOCK
      ?auto_66402 - BLOCK
      ?auto_66403 - BLOCK
      ?auto_66404 - BLOCK
      ?auto_66405 - BLOCK
    )
    :vars
    (
      ?auto_66406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66401 ?auto_66402 ) ) ( not ( = ?auto_66401 ?auto_66403 ) ) ( not ( = ?auto_66401 ?auto_66404 ) ) ( not ( = ?auto_66401 ?auto_66405 ) ) ( not ( = ?auto_66402 ?auto_66403 ) ) ( not ( = ?auto_66402 ?auto_66404 ) ) ( not ( = ?auto_66402 ?auto_66405 ) ) ( not ( = ?auto_66403 ?auto_66404 ) ) ( not ( = ?auto_66403 ?auto_66405 ) ) ( not ( = ?auto_66404 ?auto_66405 ) ) ( ON ?auto_66405 ?auto_66406 ) ( not ( = ?auto_66401 ?auto_66406 ) ) ( not ( = ?auto_66402 ?auto_66406 ) ) ( not ( = ?auto_66403 ?auto_66406 ) ) ( not ( = ?auto_66404 ?auto_66406 ) ) ( not ( = ?auto_66405 ?auto_66406 ) ) ( ON ?auto_66404 ?auto_66405 ) ( ON-TABLE ?auto_66406 ) ( ON ?auto_66403 ?auto_66404 ) ( ON ?auto_66402 ?auto_66403 ) ( HOLDING ?auto_66401 ) ( CLEAR ?auto_66402 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66406 ?auto_66405 ?auto_66404 ?auto_66403 ?auto_66402 ?auto_66401 )
      ( MAKE-5PILE ?auto_66401 ?auto_66402 ?auto_66403 ?auto_66404 ?auto_66405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66407 - BLOCK
      ?auto_66408 - BLOCK
      ?auto_66409 - BLOCK
      ?auto_66410 - BLOCK
      ?auto_66411 - BLOCK
    )
    :vars
    (
      ?auto_66412 - BLOCK
      ?auto_66413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66407 ?auto_66408 ) ) ( not ( = ?auto_66407 ?auto_66409 ) ) ( not ( = ?auto_66407 ?auto_66410 ) ) ( not ( = ?auto_66407 ?auto_66411 ) ) ( not ( = ?auto_66408 ?auto_66409 ) ) ( not ( = ?auto_66408 ?auto_66410 ) ) ( not ( = ?auto_66408 ?auto_66411 ) ) ( not ( = ?auto_66409 ?auto_66410 ) ) ( not ( = ?auto_66409 ?auto_66411 ) ) ( not ( = ?auto_66410 ?auto_66411 ) ) ( ON ?auto_66411 ?auto_66412 ) ( not ( = ?auto_66407 ?auto_66412 ) ) ( not ( = ?auto_66408 ?auto_66412 ) ) ( not ( = ?auto_66409 ?auto_66412 ) ) ( not ( = ?auto_66410 ?auto_66412 ) ) ( not ( = ?auto_66411 ?auto_66412 ) ) ( ON ?auto_66410 ?auto_66411 ) ( ON-TABLE ?auto_66412 ) ( ON ?auto_66409 ?auto_66410 ) ( ON ?auto_66408 ?auto_66409 ) ( CLEAR ?auto_66408 ) ( ON ?auto_66407 ?auto_66413 ) ( CLEAR ?auto_66407 ) ( HAND-EMPTY ) ( not ( = ?auto_66407 ?auto_66413 ) ) ( not ( = ?auto_66408 ?auto_66413 ) ) ( not ( = ?auto_66409 ?auto_66413 ) ) ( not ( = ?auto_66410 ?auto_66413 ) ) ( not ( = ?auto_66411 ?auto_66413 ) ) ( not ( = ?auto_66412 ?auto_66413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66407 ?auto_66413 )
      ( MAKE-5PILE ?auto_66407 ?auto_66408 ?auto_66409 ?auto_66410 ?auto_66411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66414 - BLOCK
      ?auto_66415 - BLOCK
      ?auto_66416 - BLOCK
      ?auto_66417 - BLOCK
      ?auto_66418 - BLOCK
    )
    :vars
    (
      ?auto_66420 - BLOCK
      ?auto_66419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66414 ?auto_66415 ) ) ( not ( = ?auto_66414 ?auto_66416 ) ) ( not ( = ?auto_66414 ?auto_66417 ) ) ( not ( = ?auto_66414 ?auto_66418 ) ) ( not ( = ?auto_66415 ?auto_66416 ) ) ( not ( = ?auto_66415 ?auto_66417 ) ) ( not ( = ?auto_66415 ?auto_66418 ) ) ( not ( = ?auto_66416 ?auto_66417 ) ) ( not ( = ?auto_66416 ?auto_66418 ) ) ( not ( = ?auto_66417 ?auto_66418 ) ) ( ON ?auto_66418 ?auto_66420 ) ( not ( = ?auto_66414 ?auto_66420 ) ) ( not ( = ?auto_66415 ?auto_66420 ) ) ( not ( = ?auto_66416 ?auto_66420 ) ) ( not ( = ?auto_66417 ?auto_66420 ) ) ( not ( = ?auto_66418 ?auto_66420 ) ) ( ON ?auto_66417 ?auto_66418 ) ( ON-TABLE ?auto_66420 ) ( ON ?auto_66416 ?auto_66417 ) ( ON ?auto_66414 ?auto_66419 ) ( CLEAR ?auto_66414 ) ( not ( = ?auto_66414 ?auto_66419 ) ) ( not ( = ?auto_66415 ?auto_66419 ) ) ( not ( = ?auto_66416 ?auto_66419 ) ) ( not ( = ?auto_66417 ?auto_66419 ) ) ( not ( = ?auto_66418 ?auto_66419 ) ) ( not ( = ?auto_66420 ?auto_66419 ) ) ( HOLDING ?auto_66415 ) ( CLEAR ?auto_66416 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66420 ?auto_66418 ?auto_66417 ?auto_66416 ?auto_66415 )
      ( MAKE-5PILE ?auto_66414 ?auto_66415 ?auto_66416 ?auto_66417 ?auto_66418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66421 - BLOCK
      ?auto_66422 - BLOCK
      ?auto_66423 - BLOCK
      ?auto_66424 - BLOCK
      ?auto_66425 - BLOCK
    )
    :vars
    (
      ?auto_66426 - BLOCK
      ?auto_66427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66421 ?auto_66422 ) ) ( not ( = ?auto_66421 ?auto_66423 ) ) ( not ( = ?auto_66421 ?auto_66424 ) ) ( not ( = ?auto_66421 ?auto_66425 ) ) ( not ( = ?auto_66422 ?auto_66423 ) ) ( not ( = ?auto_66422 ?auto_66424 ) ) ( not ( = ?auto_66422 ?auto_66425 ) ) ( not ( = ?auto_66423 ?auto_66424 ) ) ( not ( = ?auto_66423 ?auto_66425 ) ) ( not ( = ?auto_66424 ?auto_66425 ) ) ( ON ?auto_66425 ?auto_66426 ) ( not ( = ?auto_66421 ?auto_66426 ) ) ( not ( = ?auto_66422 ?auto_66426 ) ) ( not ( = ?auto_66423 ?auto_66426 ) ) ( not ( = ?auto_66424 ?auto_66426 ) ) ( not ( = ?auto_66425 ?auto_66426 ) ) ( ON ?auto_66424 ?auto_66425 ) ( ON-TABLE ?auto_66426 ) ( ON ?auto_66423 ?auto_66424 ) ( ON ?auto_66421 ?auto_66427 ) ( not ( = ?auto_66421 ?auto_66427 ) ) ( not ( = ?auto_66422 ?auto_66427 ) ) ( not ( = ?auto_66423 ?auto_66427 ) ) ( not ( = ?auto_66424 ?auto_66427 ) ) ( not ( = ?auto_66425 ?auto_66427 ) ) ( not ( = ?auto_66426 ?auto_66427 ) ) ( CLEAR ?auto_66423 ) ( ON ?auto_66422 ?auto_66421 ) ( CLEAR ?auto_66422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66427 ?auto_66421 )
      ( MAKE-5PILE ?auto_66421 ?auto_66422 ?auto_66423 ?auto_66424 ?auto_66425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66428 - BLOCK
      ?auto_66429 - BLOCK
      ?auto_66430 - BLOCK
      ?auto_66431 - BLOCK
      ?auto_66432 - BLOCK
    )
    :vars
    (
      ?auto_66433 - BLOCK
      ?auto_66434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66428 ?auto_66429 ) ) ( not ( = ?auto_66428 ?auto_66430 ) ) ( not ( = ?auto_66428 ?auto_66431 ) ) ( not ( = ?auto_66428 ?auto_66432 ) ) ( not ( = ?auto_66429 ?auto_66430 ) ) ( not ( = ?auto_66429 ?auto_66431 ) ) ( not ( = ?auto_66429 ?auto_66432 ) ) ( not ( = ?auto_66430 ?auto_66431 ) ) ( not ( = ?auto_66430 ?auto_66432 ) ) ( not ( = ?auto_66431 ?auto_66432 ) ) ( ON ?auto_66432 ?auto_66433 ) ( not ( = ?auto_66428 ?auto_66433 ) ) ( not ( = ?auto_66429 ?auto_66433 ) ) ( not ( = ?auto_66430 ?auto_66433 ) ) ( not ( = ?auto_66431 ?auto_66433 ) ) ( not ( = ?auto_66432 ?auto_66433 ) ) ( ON ?auto_66431 ?auto_66432 ) ( ON-TABLE ?auto_66433 ) ( ON ?auto_66428 ?auto_66434 ) ( not ( = ?auto_66428 ?auto_66434 ) ) ( not ( = ?auto_66429 ?auto_66434 ) ) ( not ( = ?auto_66430 ?auto_66434 ) ) ( not ( = ?auto_66431 ?auto_66434 ) ) ( not ( = ?auto_66432 ?auto_66434 ) ) ( not ( = ?auto_66433 ?auto_66434 ) ) ( ON ?auto_66429 ?auto_66428 ) ( CLEAR ?auto_66429 ) ( ON-TABLE ?auto_66434 ) ( HOLDING ?auto_66430 ) ( CLEAR ?auto_66431 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66433 ?auto_66432 ?auto_66431 ?auto_66430 )
      ( MAKE-5PILE ?auto_66428 ?auto_66429 ?auto_66430 ?auto_66431 ?auto_66432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66435 - BLOCK
      ?auto_66436 - BLOCK
      ?auto_66437 - BLOCK
      ?auto_66438 - BLOCK
      ?auto_66439 - BLOCK
    )
    :vars
    (
      ?auto_66440 - BLOCK
      ?auto_66441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66435 ?auto_66436 ) ) ( not ( = ?auto_66435 ?auto_66437 ) ) ( not ( = ?auto_66435 ?auto_66438 ) ) ( not ( = ?auto_66435 ?auto_66439 ) ) ( not ( = ?auto_66436 ?auto_66437 ) ) ( not ( = ?auto_66436 ?auto_66438 ) ) ( not ( = ?auto_66436 ?auto_66439 ) ) ( not ( = ?auto_66437 ?auto_66438 ) ) ( not ( = ?auto_66437 ?auto_66439 ) ) ( not ( = ?auto_66438 ?auto_66439 ) ) ( ON ?auto_66439 ?auto_66440 ) ( not ( = ?auto_66435 ?auto_66440 ) ) ( not ( = ?auto_66436 ?auto_66440 ) ) ( not ( = ?auto_66437 ?auto_66440 ) ) ( not ( = ?auto_66438 ?auto_66440 ) ) ( not ( = ?auto_66439 ?auto_66440 ) ) ( ON ?auto_66438 ?auto_66439 ) ( ON-TABLE ?auto_66440 ) ( ON ?auto_66435 ?auto_66441 ) ( not ( = ?auto_66435 ?auto_66441 ) ) ( not ( = ?auto_66436 ?auto_66441 ) ) ( not ( = ?auto_66437 ?auto_66441 ) ) ( not ( = ?auto_66438 ?auto_66441 ) ) ( not ( = ?auto_66439 ?auto_66441 ) ) ( not ( = ?auto_66440 ?auto_66441 ) ) ( ON ?auto_66436 ?auto_66435 ) ( ON-TABLE ?auto_66441 ) ( CLEAR ?auto_66438 ) ( ON ?auto_66437 ?auto_66436 ) ( CLEAR ?auto_66437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66441 ?auto_66435 ?auto_66436 )
      ( MAKE-5PILE ?auto_66435 ?auto_66436 ?auto_66437 ?auto_66438 ?auto_66439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66442 - BLOCK
      ?auto_66443 - BLOCK
      ?auto_66444 - BLOCK
      ?auto_66445 - BLOCK
      ?auto_66446 - BLOCK
    )
    :vars
    (
      ?auto_66447 - BLOCK
      ?auto_66448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66442 ?auto_66443 ) ) ( not ( = ?auto_66442 ?auto_66444 ) ) ( not ( = ?auto_66442 ?auto_66445 ) ) ( not ( = ?auto_66442 ?auto_66446 ) ) ( not ( = ?auto_66443 ?auto_66444 ) ) ( not ( = ?auto_66443 ?auto_66445 ) ) ( not ( = ?auto_66443 ?auto_66446 ) ) ( not ( = ?auto_66444 ?auto_66445 ) ) ( not ( = ?auto_66444 ?auto_66446 ) ) ( not ( = ?auto_66445 ?auto_66446 ) ) ( ON ?auto_66446 ?auto_66447 ) ( not ( = ?auto_66442 ?auto_66447 ) ) ( not ( = ?auto_66443 ?auto_66447 ) ) ( not ( = ?auto_66444 ?auto_66447 ) ) ( not ( = ?auto_66445 ?auto_66447 ) ) ( not ( = ?auto_66446 ?auto_66447 ) ) ( ON-TABLE ?auto_66447 ) ( ON ?auto_66442 ?auto_66448 ) ( not ( = ?auto_66442 ?auto_66448 ) ) ( not ( = ?auto_66443 ?auto_66448 ) ) ( not ( = ?auto_66444 ?auto_66448 ) ) ( not ( = ?auto_66445 ?auto_66448 ) ) ( not ( = ?auto_66446 ?auto_66448 ) ) ( not ( = ?auto_66447 ?auto_66448 ) ) ( ON ?auto_66443 ?auto_66442 ) ( ON-TABLE ?auto_66448 ) ( ON ?auto_66444 ?auto_66443 ) ( CLEAR ?auto_66444 ) ( HOLDING ?auto_66445 ) ( CLEAR ?auto_66446 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66447 ?auto_66446 ?auto_66445 )
      ( MAKE-5PILE ?auto_66442 ?auto_66443 ?auto_66444 ?auto_66445 ?auto_66446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66449 - BLOCK
      ?auto_66450 - BLOCK
      ?auto_66451 - BLOCK
      ?auto_66452 - BLOCK
      ?auto_66453 - BLOCK
    )
    :vars
    (
      ?auto_66455 - BLOCK
      ?auto_66454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66449 ?auto_66450 ) ) ( not ( = ?auto_66449 ?auto_66451 ) ) ( not ( = ?auto_66449 ?auto_66452 ) ) ( not ( = ?auto_66449 ?auto_66453 ) ) ( not ( = ?auto_66450 ?auto_66451 ) ) ( not ( = ?auto_66450 ?auto_66452 ) ) ( not ( = ?auto_66450 ?auto_66453 ) ) ( not ( = ?auto_66451 ?auto_66452 ) ) ( not ( = ?auto_66451 ?auto_66453 ) ) ( not ( = ?auto_66452 ?auto_66453 ) ) ( ON ?auto_66453 ?auto_66455 ) ( not ( = ?auto_66449 ?auto_66455 ) ) ( not ( = ?auto_66450 ?auto_66455 ) ) ( not ( = ?auto_66451 ?auto_66455 ) ) ( not ( = ?auto_66452 ?auto_66455 ) ) ( not ( = ?auto_66453 ?auto_66455 ) ) ( ON-TABLE ?auto_66455 ) ( ON ?auto_66449 ?auto_66454 ) ( not ( = ?auto_66449 ?auto_66454 ) ) ( not ( = ?auto_66450 ?auto_66454 ) ) ( not ( = ?auto_66451 ?auto_66454 ) ) ( not ( = ?auto_66452 ?auto_66454 ) ) ( not ( = ?auto_66453 ?auto_66454 ) ) ( not ( = ?auto_66455 ?auto_66454 ) ) ( ON ?auto_66450 ?auto_66449 ) ( ON-TABLE ?auto_66454 ) ( ON ?auto_66451 ?auto_66450 ) ( CLEAR ?auto_66453 ) ( ON ?auto_66452 ?auto_66451 ) ( CLEAR ?auto_66452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66454 ?auto_66449 ?auto_66450 ?auto_66451 )
      ( MAKE-5PILE ?auto_66449 ?auto_66450 ?auto_66451 ?auto_66452 ?auto_66453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66456 - BLOCK
      ?auto_66457 - BLOCK
      ?auto_66458 - BLOCK
      ?auto_66459 - BLOCK
      ?auto_66460 - BLOCK
    )
    :vars
    (
      ?auto_66461 - BLOCK
      ?auto_66462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66456 ?auto_66457 ) ) ( not ( = ?auto_66456 ?auto_66458 ) ) ( not ( = ?auto_66456 ?auto_66459 ) ) ( not ( = ?auto_66456 ?auto_66460 ) ) ( not ( = ?auto_66457 ?auto_66458 ) ) ( not ( = ?auto_66457 ?auto_66459 ) ) ( not ( = ?auto_66457 ?auto_66460 ) ) ( not ( = ?auto_66458 ?auto_66459 ) ) ( not ( = ?auto_66458 ?auto_66460 ) ) ( not ( = ?auto_66459 ?auto_66460 ) ) ( not ( = ?auto_66456 ?auto_66461 ) ) ( not ( = ?auto_66457 ?auto_66461 ) ) ( not ( = ?auto_66458 ?auto_66461 ) ) ( not ( = ?auto_66459 ?auto_66461 ) ) ( not ( = ?auto_66460 ?auto_66461 ) ) ( ON-TABLE ?auto_66461 ) ( ON ?auto_66456 ?auto_66462 ) ( not ( = ?auto_66456 ?auto_66462 ) ) ( not ( = ?auto_66457 ?auto_66462 ) ) ( not ( = ?auto_66458 ?auto_66462 ) ) ( not ( = ?auto_66459 ?auto_66462 ) ) ( not ( = ?auto_66460 ?auto_66462 ) ) ( not ( = ?auto_66461 ?auto_66462 ) ) ( ON ?auto_66457 ?auto_66456 ) ( ON-TABLE ?auto_66462 ) ( ON ?auto_66458 ?auto_66457 ) ( ON ?auto_66459 ?auto_66458 ) ( CLEAR ?auto_66459 ) ( HOLDING ?auto_66460 ) ( CLEAR ?auto_66461 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66461 ?auto_66460 )
      ( MAKE-5PILE ?auto_66456 ?auto_66457 ?auto_66458 ?auto_66459 ?auto_66460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66463 - BLOCK
      ?auto_66464 - BLOCK
      ?auto_66465 - BLOCK
      ?auto_66466 - BLOCK
      ?auto_66467 - BLOCK
    )
    :vars
    (
      ?auto_66468 - BLOCK
      ?auto_66469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66463 ?auto_66464 ) ) ( not ( = ?auto_66463 ?auto_66465 ) ) ( not ( = ?auto_66463 ?auto_66466 ) ) ( not ( = ?auto_66463 ?auto_66467 ) ) ( not ( = ?auto_66464 ?auto_66465 ) ) ( not ( = ?auto_66464 ?auto_66466 ) ) ( not ( = ?auto_66464 ?auto_66467 ) ) ( not ( = ?auto_66465 ?auto_66466 ) ) ( not ( = ?auto_66465 ?auto_66467 ) ) ( not ( = ?auto_66466 ?auto_66467 ) ) ( not ( = ?auto_66463 ?auto_66468 ) ) ( not ( = ?auto_66464 ?auto_66468 ) ) ( not ( = ?auto_66465 ?auto_66468 ) ) ( not ( = ?auto_66466 ?auto_66468 ) ) ( not ( = ?auto_66467 ?auto_66468 ) ) ( ON-TABLE ?auto_66468 ) ( ON ?auto_66463 ?auto_66469 ) ( not ( = ?auto_66463 ?auto_66469 ) ) ( not ( = ?auto_66464 ?auto_66469 ) ) ( not ( = ?auto_66465 ?auto_66469 ) ) ( not ( = ?auto_66466 ?auto_66469 ) ) ( not ( = ?auto_66467 ?auto_66469 ) ) ( not ( = ?auto_66468 ?auto_66469 ) ) ( ON ?auto_66464 ?auto_66463 ) ( ON-TABLE ?auto_66469 ) ( ON ?auto_66465 ?auto_66464 ) ( ON ?auto_66466 ?auto_66465 ) ( CLEAR ?auto_66468 ) ( ON ?auto_66467 ?auto_66466 ) ( CLEAR ?auto_66467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66469 ?auto_66463 ?auto_66464 ?auto_66465 ?auto_66466 )
      ( MAKE-5PILE ?auto_66463 ?auto_66464 ?auto_66465 ?auto_66466 ?auto_66467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66470 - BLOCK
      ?auto_66471 - BLOCK
      ?auto_66472 - BLOCK
      ?auto_66473 - BLOCK
      ?auto_66474 - BLOCK
    )
    :vars
    (
      ?auto_66475 - BLOCK
      ?auto_66476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66470 ?auto_66471 ) ) ( not ( = ?auto_66470 ?auto_66472 ) ) ( not ( = ?auto_66470 ?auto_66473 ) ) ( not ( = ?auto_66470 ?auto_66474 ) ) ( not ( = ?auto_66471 ?auto_66472 ) ) ( not ( = ?auto_66471 ?auto_66473 ) ) ( not ( = ?auto_66471 ?auto_66474 ) ) ( not ( = ?auto_66472 ?auto_66473 ) ) ( not ( = ?auto_66472 ?auto_66474 ) ) ( not ( = ?auto_66473 ?auto_66474 ) ) ( not ( = ?auto_66470 ?auto_66475 ) ) ( not ( = ?auto_66471 ?auto_66475 ) ) ( not ( = ?auto_66472 ?auto_66475 ) ) ( not ( = ?auto_66473 ?auto_66475 ) ) ( not ( = ?auto_66474 ?auto_66475 ) ) ( ON ?auto_66470 ?auto_66476 ) ( not ( = ?auto_66470 ?auto_66476 ) ) ( not ( = ?auto_66471 ?auto_66476 ) ) ( not ( = ?auto_66472 ?auto_66476 ) ) ( not ( = ?auto_66473 ?auto_66476 ) ) ( not ( = ?auto_66474 ?auto_66476 ) ) ( not ( = ?auto_66475 ?auto_66476 ) ) ( ON ?auto_66471 ?auto_66470 ) ( ON-TABLE ?auto_66476 ) ( ON ?auto_66472 ?auto_66471 ) ( ON ?auto_66473 ?auto_66472 ) ( ON ?auto_66474 ?auto_66473 ) ( CLEAR ?auto_66474 ) ( HOLDING ?auto_66475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66475 )
      ( MAKE-5PILE ?auto_66470 ?auto_66471 ?auto_66472 ?auto_66473 ?auto_66474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66477 - BLOCK
      ?auto_66478 - BLOCK
      ?auto_66479 - BLOCK
      ?auto_66480 - BLOCK
      ?auto_66481 - BLOCK
    )
    :vars
    (
      ?auto_66482 - BLOCK
      ?auto_66483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66477 ?auto_66478 ) ) ( not ( = ?auto_66477 ?auto_66479 ) ) ( not ( = ?auto_66477 ?auto_66480 ) ) ( not ( = ?auto_66477 ?auto_66481 ) ) ( not ( = ?auto_66478 ?auto_66479 ) ) ( not ( = ?auto_66478 ?auto_66480 ) ) ( not ( = ?auto_66478 ?auto_66481 ) ) ( not ( = ?auto_66479 ?auto_66480 ) ) ( not ( = ?auto_66479 ?auto_66481 ) ) ( not ( = ?auto_66480 ?auto_66481 ) ) ( not ( = ?auto_66477 ?auto_66482 ) ) ( not ( = ?auto_66478 ?auto_66482 ) ) ( not ( = ?auto_66479 ?auto_66482 ) ) ( not ( = ?auto_66480 ?auto_66482 ) ) ( not ( = ?auto_66481 ?auto_66482 ) ) ( ON ?auto_66477 ?auto_66483 ) ( not ( = ?auto_66477 ?auto_66483 ) ) ( not ( = ?auto_66478 ?auto_66483 ) ) ( not ( = ?auto_66479 ?auto_66483 ) ) ( not ( = ?auto_66480 ?auto_66483 ) ) ( not ( = ?auto_66481 ?auto_66483 ) ) ( not ( = ?auto_66482 ?auto_66483 ) ) ( ON ?auto_66478 ?auto_66477 ) ( ON-TABLE ?auto_66483 ) ( ON ?auto_66479 ?auto_66478 ) ( ON ?auto_66480 ?auto_66479 ) ( ON ?auto_66481 ?auto_66480 ) ( ON ?auto_66482 ?auto_66481 ) ( CLEAR ?auto_66482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66483 ?auto_66477 ?auto_66478 ?auto_66479 ?auto_66480 ?auto_66481 )
      ( MAKE-5PILE ?auto_66477 ?auto_66478 ?auto_66479 ?auto_66480 ?auto_66481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66490 - BLOCK
      ?auto_66491 - BLOCK
      ?auto_66492 - BLOCK
      ?auto_66493 - BLOCK
      ?auto_66494 - BLOCK
      ?auto_66495 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_66495 ) ( CLEAR ?auto_66494 ) ( ON-TABLE ?auto_66490 ) ( ON ?auto_66491 ?auto_66490 ) ( ON ?auto_66492 ?auto_66491 ) ( ON ?auto_66493 ?auto_66492 ) ( ON ?auto_66494 ?auto_66493 ) ( not ( = ?auto_66490 ?auto_66491 ) ) ( not ( = ?auto_66490 ?auto_66492 ) ) ( not ( = ?auto_66490 ?auto_66493 ) ) ( not ( = ?auto_66490 ?auto_66494 ) ) ( not ( = ?auto_66490 ?auto_66495 ) ) ( not ( = ?auto_66491 ?auto_66492 ) ) ( not ( = ?auto_66491 ?auto_66493 ) ) ( not ( = ?auto_66491 ?auto_66494 ) ) ( not ( = ?auto_66491 ?auto_66495 ) ) ( not ( = ?auto_66492 ?auto_66493 ) ) ( not ( = ?auto_66492 ?auto_66494 ) ) ( not ( = ?auto_66492 ?auto_66495 ) ) ( not ( = ?auto_66493 ?auto_66494 ) ) ( not ( = ?auto_66493 ?auto_66495 ) ) ( not ( = ?auto_66494 ?auto_66495 ) ) )
    :subtasks
    ( ( !STACK ?auto_66495 ?auto_66494 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66496 - BLOCK
      ?auto_66497 - BLOCK
      ?auto_66498 - BLOCK
      ?auto_66499 - BLOCK
      ?auto_66500 - BLOCK
      ?auto_66501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66500 ) ( ON-TABLE ?auto_66496 ) ( ON ?auto_66497 ?auto_66496 ) ( ON ?auto_66498 ?auto_66497 ) ( ON ?auto_66499 ?auto_66498 ) ( ON ?auto_66500 ?auto_66499 ) ( not ( = ?auto_66496 ?auto_66497 ) ) ( not ( = ?auto_66496 ?auto_66498 ) ) ( not ( = ?auto_66496 ?auto_66499 ) ) ( not ( = ?auto_66496 ?auto_66500 ) ) ( not ( = ?auto_66496 ?auto_66501 ) ) ( not ( = ?auto_66497 ?auto_66498 ) ) ( not ( = ?auto_66497 ?auto_66499 ) ) ( not ( = ?auto_66497 ?auto_66500 ) ) ( not ( = ?auto_66497 ?auto_66501 ) ) ( not ( = ?auto_66498 ?auto_66499 ) ) ( not ( = ?auto_66498 ?auto_66500 ) ) ( not ( = ?auto_66498 ?auto_66501 ) ) ( not ( = ?auto_66499 ?auto_66500 ) ) ( not ( = ?auto_66499 ?auto_66501 ) ) ( not ( = ?auto_66500 ?auto_66501 ) ) ( ON-TABLE ?auto_66501 ) ( CLEAR ?auto_66501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_66501 )
      ( MAKE-6PILE ?auto_66496 ?auto_66497 ?auto_66498 ?auto_66499 ?auto_66500 ?auto_66501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66502 - BLOCK
      ?auto_66503 - BLOCK
      ?auto_66504 - BLOCK
      ?auto_66505 - BLOCK
      ?auto_66506 - BLOCK
      ?auto_66507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66502 ) ( ON ?auto_66503 ?auto_66502 ) ( ON ?auto_66504 ?auto_66503 ) ( ON ?auto_66505 ?auto_66504 ) ( not ( = ?auto_66502 ?auto_66503 ) ) ( not ( = ?auto_66502 ?auto_66504 ) ) ( not ( = ?auto_66502 ?auto_66505 ) ) ( not ( = ?auto_66502 ?auto_66506 ) ) ( not ( = ?auto_66502 ?auto_66507 ) ) ( not ( = ?auto_66503 ?auto_66504 ) ) ( not ( = ?auto_66503 ?auto_66505 ) ) ( not ( = ?auto_66503 ?auto_66506 ) ) ( not ( = ?auto_66503 ?auto_66507 ) ) ( not ( = ?auto_66504 ?auto_66505 ) ) ( not ( = ?auto_66504 ?auto_66506 ) ) ( not ( = ?auto_66504 ?auto_66507 ) ) ( not ( = ?auto_66505 ?auto_66506 ) ) ( not ( = ?auto_66505 ?auto_66507 ) ) ( not ( = ?auto_66506 ?auto_66507 ) ) ( ON-TABLE ?auto_66507 ) ( CLEAR ?auto_66507 ) ( HOLDING ?auto_66506 ) ( CLEAR ?auto_66505 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66502 ?auto_66503 ?auto_66504 ?auto_66505 ?auto_66506 )
      ( MAKE-6PILE ?auto_66502 ?auto_66503 ?auto_66504 ?auto_66505 ?auto_66506 ?auto_66507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66508 - BLOCK
      ?auto_66509 - BLOCK
      ?auto_66510 - BLOCK
      ?auto_66511 - BLOCK
      ?auto_66512 - BLOCK
      ?auto_66513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66508 ) ( ON ?auto_66509 ?auto_66508 ) ( ON ?auto_66510 ?auto_66509 ) ( ON ?auto_66511 ?auto_66510 ) ( not ( = ?auto_66508 ?auto_66509 ) ) ( not ( = ?auto_66508 ?auto_66510 ) ) ( not ( = ?auto_66508 ?auto_66511 ) ) ( not ( = ?auto_66508 ?auto_66512 ) ) ( not ( = ?auto_66508 ?auto_66513 ) ) ( not ( = ?auto_66509 ?auto_66510 ) ) ( not ( = ?auto_66509 ?auto_66511 ) ) ( not ( = ?auto_66509 ?auto_66512 ) ) ( not ( = ?auto_66509 ?auto_66513 ) ) ( not ( = ?auto_66510 ?auto_66511 ) ) ( not ( = ?auto_66510 ?auto_66512 ) ) ( not ( = ?auto_66510 ?auto_66513 ) ) ( not ( = ?auto_66511 ?auto_66512 ) ) ( not ( = ?auto_66511 ?auto_66513 ) ) ( not ( = ?auto_66512 ?auto_66513 ) ) ( ON-TABLE ?auto_66513 ) ( CLEAR ?auto_66511 ) ( ON ?auto_66512 ?auto_66513 ) ( CLEAR ?auto_66512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66513 )
      ( MAKE-6PILE ?auto_66508 ?auto_66509 ?auto_66510 ?auto_66511 ?auto_66512 ?auto_66513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66514 - BLOCK
      ?auto_66515 - BLOCK
      ?auto_66516 - BLOCK
      ?auto_66517 - BLOCK
      ?auto_66518 - BLOCK
      ?auto_66519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66514 ) ( ON ?auto_66515 ?auto_66514 ) ( ON ?auto_66516 ?auto_66515 ) ( not ( = ?auto_66514 ?auto_66515 ) ) ( not ( = ?auto_66514 ?auto_66516 ) ) ( not ( = ?auto_66514 ?auto_66517 ) ) ( not ( = ?auto_66514 ?auto_66518 ) ) ( not ( = ?auto_66514 ?auto_66519 ) ) ( not ( = ?auto_66515 ?auto_66516 ) ) ( not ( = ?auto_66515 ?auto_66517 ) ) ( not ( = ?auto_66515 ?auto_66518 ) ) ( not ( = ?auto_66515 ?auto_66519 ) ) ( not ( = ?auto_66516 ?auto_66517 ) ) ( not ( = ?auto_66516 ?auto_66518 ) ) ( not ( = ?auto_66516 ?auto_66519 ) ) ( not ( = ?auto_66517 ?auto_66518 ) ) ( not ( = ?auto_66517 ?auto_66519 ) ) ( not ( = ?auto_66518 ?auto_66519 ) ) ( ON-TABLE ?auto_66519 ) ( ON ?auto_66518 ?auto_66519 ) ( CLEAR ?auto_66518 ) ( HOLDING ?auto_66517 ) ( CLEAR ?auto_66516 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66514 ?auto_66515 ?auto_66516 ?auto_66517 )
      ( MAKE-6PILE ?auto_66514 ?auto_66515 ?auto_66516 ?auto_66517 ?auto_66518 ?auto_66519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66520 - BLOCK
      ?auto_66521 - BLOCK
      ?auto_66522 - BLOCK
      ?auto_66523 - BLOCK
      ?auto_66524 - BLOCK
      ?auto_66525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66520 ) ( ON ?auto_66521 ?auto_66520 ) ( ON ?auto_66522 ?auto_66521 ) ( not ( = ?auto_66520 ?auto_66521 ) ) ( not ( = ?auto_66520 ?auto_66522 ) ) ( not ( = ?auto_66520 ?auto_66523 ) ) ( not ( = ?auto_66520 ?auto_66524 ) ) ( not ( = ?auto_66520 ?auto_66525 ) ) ( not ( = ?auto_66521 ?auto_66522 ) ) ( not ( = ?auto_66521 ?auto_66523 ) ) ( not ( = ?auto_66521 ?auto_66524 ) ) ( not ( = ?auto_66521 ?auto_66525 ) ) ( not ( = ?auto_66522 ?auto_66523 ) ) ( not ( = ?auto_66522 ?auto_66524 ) ) ( not ( = ?auto_66522 ?auto_66525 ) ) ( not ( = ?auto_66523 ?auto_66524 ) ) ( not ( = ?auto_66523 ?auto_66525 ) ) ( not ( = ?auto_66524 ?auto_66525 ) ) ( ON-TABLE ?auto_66525 ) ( ON ?auto_66524 ?auto_66525 ) ( CLEAR ?auto_66522 ) ( ON ?auto_66523 ?auto_66524 ) ( CLEAR ?auto_66523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66525 ?auto_66524 )
      ( MAKE-6PILE ?auto_66520 ?auto_66521 ?auto_66522 ?auto_66523 ?auto_66524 ?auto_66525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66526 - BLOCK
      ?auto_66527 - BLOCK
      ?auto_66528 - BLOCK
      ?auto_66529 - BLOCK
      ?auto_66530 - BLOCK
      ?auto_66531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66526 ) ( ON ?auto_66527 ?auto_66526 ) ( not ( = ?auto_66526 ?auto_66527 ) ) ( not ( = ?auto_66526 ?auto_66528 ) ) ( not ( = ?auto_66526 ?auto_66529 ) ) ( not ( = ?auto_66526 ?auto_66530 ) ) ( not ( = ?auto_66526 ?auto_66531 ) ) ( not ( = ?auto_66527 ?auto_66528 ) ) ( not ( = ?auto_66527 ?auto_66529 ) ) ( not ( = ?auto_66527 ?auto_66530 ) ) ( not ( = ?auto_66527 ?auto_66531 ) ) ( not ( = ?auto_66528 ?auto_66529 ) ) ( not ( = ?auto_66528 ?auto_66530 ) ) ( not ( = ?auto_66528 ?auto_66531 ) ) ( not ( = ?auto_66529 ?auto_66530 ) ) ( not ( = ?auto_66529 ?auto_66531 ) ) ( not ( = ?auto_66530 ?auto_66531 ) ) ( ON-TABLE ?auto_66531 ) ( ON ?auto_66530 ?auto_66531 ) ( ON ?auto_66529 ?auto_66530 ) ( CLEAR ?auto_66529 ) ( HOLDING ?auto_66528 ) ( CLEAR ?auto_66527 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66526 ?auto_66527 ?auto_66528 )
      ( MAKE-6PILE ?auto_66526 ?auto_66527 ?auto_66528 ?auto_66529 ?auto_66530 ?auto_66531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66532 - BLOCK
      ?auto_66533 - BLOCK
      ?auto_66534 - BLOCK
      ?auto_66535 - BLOCK
      ?auto_66536 - BLOCK
      ?auto_66537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66532 ) ( ON ?auto_66533 ?auto_66532 ) ( not ( = ?auto_66532 ?auto_66533 ) ) ( not ( = ?auto_66532 ?auto_66534 ) ) ( not ( = ?auto_66532 ?auto_66535 ) ) ( not ( = ?auto_66532 ?auto_66536 ) ) ( not ( = ?auto_66532 ?auto_66537 ) ) ( not ( = ?auto_66533 ?auto_66534 ) ) ( not ( = ?auto_66533 ?auto_66535 ) ) ( not ( = ?auto_66533 ?auto_66536 ) ) ( not ( = ?auto_66533 ?auto_66537 ) ) ( not ( = ?auto_66534 ?auto_66535 ) ) ( not ( = ?auto_66534 ?auto_66536 ) ) ( not ( = ?auto_66534 ?auto_66537 ) ) ( not ( = ?auto_66535 ?auto_66536 ) ) ( not ( = ?auto_66535 ?auto_66537 ) ) ( not ( = ?auto_66536 ?auto_66537 ) ) ( ON-TABLE ?auto_66537 ) ( ON ?auto_66536 ?auto_66537 ) ( ON ?auto_66535 ?auto_66536 ) ( CLEAR ?auto_66533 ) ( ON ?auto_66534 ?auto_66535 ) ( CLEAR ?auto_66534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66537 ?auto_66536 ?auto_66535 )
      ( MAKE-6PILE ?auto_66532 ?auto_66533 ?auto_66534 ?auto_66535 ?auto_66536 ?auto_66537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66538 - BLOCK
      ?auto_66539 - BLOCK
      ?auto_66540 - BLOCK
      ?auto_66541 - BLOCK
      ?auto_66542 - BLOCK
      ?auto_66543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66538 ) ( not ( = ?auto_66538 ?auto_66539 ) ) ( not ( = ?auto_66538 ?auto_66540 ) ) ( not ( = ?auto_66538 ?auto_66541 ) ) ( not ( = ?auto_66538 ?auto_66542 ) ) ( not ( = ?auto_66538 ?auto_66543 ) ) ( not ( = ?auto_66539 ?auto_66540 ) ) ( not ( = ?auto_66539 ?auto_66541 ) ) ( not ( = ?auto_66539 ?auto_66542 ) ) ( not ( = ?auto_66539 ?auto_66543 ) ) ( not ( = ?auto_66540 ?auto_66541 ) ) ( not ( = ?auto_66540 ?auto_66542 ) ) ( not ( = ?auto_66540 ?auto_66543 ) ) ( not ( = ?auto_66541 ?auto_66542 ) ) ( not ( = ?auto_66541 ?auto_66543 ) ) ( not ( = ?auto_66542 ?auto_66543 ) ) ( ON-TABLE ?auto_66543 ) ( ON ?auto_66542 ?auto_66543 ) ( ON ?auto_66541 ?auto_66542 ) ( ON ?auto_66540 ?auto_66541 ) ( CLEAR ?auto_66540 ) ( HOLDING ?auto_66539 ) ( CLEAR ?auto_66538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66538 ?auto_66539 )
      ( MAKE-6PILE ?auto_66538 ?auto_66539 ?auto_66540 ?auto_66541 ?auto_66542 ?auto_66543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66544 - BLOCK
      ?auto_66545 - BLOCK
      ?auto_66546 - BLOCK
      ?auto_66547 - BLOCK
      ?auto_66548 - BLOCK
      ?auto_66549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_66544 ) ( not ( = ?auto_66544 ?auto_66545 ) ) ( not ( = ?auto_66544 ?auto_66546 ) ) ( not ( = ?auto_66544 ?auto_66547 ) ) ( not ( = ?auto_66544 ?auto_66548 ) ) ( not ( = ?auto_66544 ?auto_66549 ) ) ( not ( = ?auto_66545 ?auto_66546 ) ) ( not ( = ?auto_66545 ?auto_66547 ) ) ( not ( = ?auto_66545 ?auto_66548 ) ) ( not ( = ?auto_66545 ?auto_66549 ) ) ( not ( = ?auto_66546 ?auto_66547 ) ) ( not ( = ?auto_66546 ?auto_66548 ) ) ( not ( = ?auto_66546 ?auto_66549 ) ) ( not ( = ?auto_66547 ?auto_66548 ) ) ( not ( = ?auto_66547 ?auto_66549 ) ) ( not ( = ?auto_66548 ?auto_66549 ) ) ( ON-TABLE ?auto_66549 ) ( ON ?auto_66548 ?auto_66549 ) ( ON ?auto_66547 ?auto_66548 ) ( ON ?auto_66546 ?auto_66547 ) ( CLEAR ?auto_66544 ) ( ON ?auto_66545 ?auto_66546 ) ( CLEAR ?auto_66545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66549 ?auto_66548 ?auto_66547 ?auto_66546 )
      ( MAKE-6PILE ?auto_66544 ?auto_66545 ?auto_66546 ?auto_66547 ?auto_66548 ?auto_66549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66550 - BLOCK
      ?auto_66551 - BLOCK
      ?auto_66552 - BLOCK
      ?auto_66553 - BLOCK
      ?auto_66554 - BLOCK
      ?auto_66555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66550 ?auto_66551 ) ) ( not ( = ?auto_66550 ?auto_66552 ) ) ( not ( = ?auto_66550 ?auto_66553 ) ) ( not ( = ?auto_66550 ?auto_66554 ) ) ( not ( = ?auto_66550 ?auto_66555 ) ) ( not ( = ?auto_66551 ?auto_66552 ) ) ( not ( = ?auto_66551 ?auto_66553 ) ) ( not ( = ?auto_66551 ?auto_66554 ) ) ( not ( = ?auto_66551 ?auto_66555 ) ) ( not ( = ?auto_66552 ?auto_66553 ) ) ( not ( = ?auto_66552 ?auto_66554 ) ) ( not ( = ?auto_66552 ?auto_66555 ) ) ( not ( = ?auto_66553 ?auto_66554 ) ) ( not ( = ?auto_66553 ?auto_66555 ) ) ( not ( = ?auto_66554 ?auto_66555 ) ) ( ON-TABLE ?auto_66555 ) ( ON ?auto_66554 ?auto_66555 ) ( ON ?auto_66553 ?auto_66554 ) ( ON ?auto_66552 ?auto_66553 ) ( ON ?auto_66551 ?auto_66552 ) ( CLEAR ?auto_66551 ) ( HOLDING ?auto_66550 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66550 )
      ( MAKE-6PILE ?auto_66550 ?auto_66551 ?auto_66552 ?auto_66553 ?auto_66554 ?auto_66555 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66556 - BLOCK
      ?auto_66557 - BLOCK
      ?auto_66558 - BLOCK
      ?auto_66559 - BLOCK
      ?auto_66560 - BLOCK
      ?auto_66561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66556 ?auto_66557 ) ) ( not ( = ?auto_66556 ?auto_66558 ) ) ( not ( = ?auto_66556 ?auto_66559 ) ) ( not ( = ?auto_66556 ?auto_66560 ) ) ( not ( = ?auto_66556 ?auto_66561 ) ) ( not ( = ?auto_66557 ?auto_66558 ) ) ( not ( = ?auto_66557 ?auto_66559 ) ) ( not ( = ?auto_66557 ?auto_66560 ) ) ( not ( = ?auto_66557 ?auto_66561 ) ) ( not ( = ?auto_66558 ?auto_66559 ) ) ( not ( = ?auto_66558 ?auto_66560 ) ) ( not ( = ?auto_66558 ?auto_66561 ) ) ( not ( = ?auto_66559 ?auto_66560 ) ) ( not ( = ?auto_66559 ?auto_66561 ) ) ( not ( = ?auto_66560 ?auto_66561 ) ) ( ON-TABLE ?auto_66561 ) ( ON ?auto_66560 ?auto_66561 ) ( ON ?auto_66559 ?auto_66560 ) ( ON ?auto_66558 ?auto_66559 ) ( ON ?auto_66557 ?auto_66558 ) ( ON ?auto_66556 ?auto_66557 ) ( CLEAR ?auto_66556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66561 ?auto_66560 ?auto_66559 ?auto_66558 ?auto_66557 )
      ( MAKE-6PILE ?auto_66556 ?auto_66557 ?auto_66558 ?auto_66559 ?auto_66560 ?auto_66561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66562 - BLOCK
      ?auto_66563 - BLOCK
      ?auto_66564 - BLOCK
      ?auto_66565 - BLOCK
      ?auto_66566 - BLOCK
      ?auto_66567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66562 ?auto_66563 ) ) ( not ( = ?auto_66562 ?auto_66564 ) ) ( not ( = ?auto_66562 ?auto_66565 ) ) ( not ( = ?auto_66562 ?auto_66566 ) ) ( not ( = ?auto_66562 ?auto_66567 ) ) ( not ( = ?auto_66563 ?auto_66564 ) ) ( not ( = ?auto_66563 ?auto_66565 ) ) ( not ( = ?auto_66563 ?auto_66566 ) ) ( not ( = ?auto_66563 ?auto_66567 ) ) ( not ( = ?auto_66564 ?auto_66565 ) ) ( not ( = ?auto_66564 ?auto_66566 ) ) ( not ( = ?auto_66564 ?auto_66567 ) ) ( not ( = ?auto_66565 ?auto_66566 ) ) ( not ( = ?auto_66565 ?auto_66567 ) ) ( not ( = ?auto_66566 ?auto_66567 ) ) ( ON-TABLE ?auto_66567 ) ( ON ?auto_66566 ?auto_66567 ) ( ON ?auto_66565 ?auto_66566 ) ( ON ?auto_66564 ?auto_66565 ) ( ON ?auto_66563 ?auto_66564 ) ( HOLDING ?auto_66562 ) ( CLEAR ?auto_66563 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66567 ?auto_66566 ?auto_66565 ?auto_66564 ?auto_66563 ?auto_66562 )
      ( MAKE-6PILE ?auto_66562 ?auto_66563 ?auto_66564 ?auto_66565 ?auto_66566 ?auto_66567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66568 - BLOCK
      ?auto_66569 - BLOCK
      ?auto_66570 - BLOCK
      ?auto_66571 - BLOCK
      ?auto_66572 - BLOCK
      ?auto_66573 - BLOCK
    )
    :vars
    (
      ?auto_66574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66568 ?auto_66569 ) ) ( not ( = ?auto_66568 ?auto_66570 ) ) ( not ( = ?auto_66568 ?auto_66571 ) ) ( not ( = ?auto_66568 ?auto_66572 ) ) ( not ( = ?auto_66568 ?auto_66573 ) ) ( not ( = ?auto_66569 ?auto_66570 ) ) ( not ( = ?auto_66569 ?auto_66571 ) ) ( not ( = ?auto_66569 ?auto_66572 ) ) ( not ( = ?auto_66569 ?auto_66573 ) ) ( not ( = ?auto_66570 ?auto_66571 ) ) ( not ( = ?auto_66570 ?auto_66572 ) ) ( not ( = ?auto_66570 ?auto_66573 ) ) ( not ( = ?auto_66571 ?auto_66572 ) ) ( not ( = ?auto_66571 ?auto_66573 ) ) ( not ( = ?auto_66572 ?auto_66573 ) ) ( ON-TABLE ?auto_66573 ) ( ON ?auto_66572 ?auto_66573 ) ( ON ?auto_66571 ?auto_66572 ) ( ON ?auto_66570 ?auto_66571 ) ( ON ?auto_66569 ?auto_66570 ) ( CLEAR ?auto_66569 ) ( ON ?auto_66568 ?auto_66574 ) ( CLEAR ?auto_66568 ) ( HAND-EMPTY ) ( not ( = ?auto_66568 ?auto_66574 ) ) ( not ( = ?auto_66569 ?auto_66574 ) ) ( not ( = ?auto_66570 ?auto_66574 ) ) ( not ( = ?auto_66571 ?auto_66574 ) ) ( not ( = ?auto_66572 ?auto_66574 ) ) ( not ( = ?auto_66573 ?auto_66574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66568 ?auto_66574 )
      ( MAKE-6PILE ?auto_66568 ?auto_66569 ?auto_66570 ?auto_66571 ?auto_66572 ?auto_66573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66575 - BLOCK
      ?auto_66576 - BLOCK
      ?auto_66577 - BLOCK
      ?auto_66578 - BLOCK
      ?auto_66579 - BLOCK
      ?auto_66580 - BLOCK
    )
    :vars
    (
      ?auto_66581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66575 ?auto_66576 ) ) ( not ( = ?auto_66575 ?auto_66577 ) ) ( not ( = ?auto_66575 ?auto_66578 ) ) ( not ( = ?auto_66575 ?auto_66579 ) ) ( not ( = ?auto_66575 ?auto_66580 ) ) ( not ( = ?auto_66576 ?auto_66577 ) ) ( not ( = ?auto_66576 ?auto_66578 ) ) ( not ( = ?auto_66576 ?auto_66579 ) ) ( not ( = ?auto_66576 ?auto_66580 ) ) ( not ( = ?auto_66577 ?auto_66578 ) ) ( not ( = ?auto_66577 ?auto_66579 ) ) ( not ( = ?auto_66577 ?auto_66580 ) ) ( not ( = ?auto_66578 ?auto_66579 ) ) ( not ( = ?auto_66578 ?auto_66580 ) ) ( not ( = ?auto_66579 ?auto_66580 ) ) ( ON-TABLE ?auto_66580 ) ( ON ?auto_66579 ?auto_66580 ) ( ON ?auto_66578 ?auto_66579 ) ( ON ?auto_66577 ?auto_66578 ) ( ON ?auto_66575 ?auto_66581 ) ( CLEAR ?auto_66575 ) ( not ( = ?auto_66575 ?auto_66581 ) ) ( not ( = ?auto_66576 ?auto_66581 ) ) ( not ( = ?auto_66577 ?auto_66581 ) ) ( not ( = ?auto_66578 ?auto_66581 ) ) ( not ( = ?auto_66579 ?auto_66581 ) ) ( not ( = ?auto_66580 ?auto_66581 ) ) ( HOLDING ?auto_66576 ) ( CLEAR ?auto_66577 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66580 ?auto_66579 ?auto_66578 ?auto_66577 ?auto_66576 )
      ( MAKE-6PILE ?auto_66575 ?auto_66576 ?auto_66577 ?auto_66578 ?auto_66579 ?auto_66580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66582 - BLOCK
      ?auto_66583 - BLOCK
      ?auto_66584 - BLOCK
      ?auto_66585 - BLOCK
      ?auto_66586 - BLOCK
      ?auto_66587 - BLOCK
    )
    :vars
    (
      ?auto_66588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66582 ?auto_66583 ) ) ( not ( = ?auto_66582 ?auto_66584 ) ) ( not ( = ?auto_66582 ?auto_66585 ) ) ( not ( = ?auto_66582 ?auto_66586 ) ) ( not ( = ?auto_66582 ?auto_66587 ) ) ( not ( = ?auto_66583 ?auto_66584 ) ) ( not ( = ?auto_66583 ?auto_66585 ) ) ( not ( = ?auto_66583 ?auto_66586 ) ) ( not ( = ?auto_66583 ?auto_66587 ) ) ( not ( = ?auto_66584 ?auto_66585 ) ) ( not ( = ?auto_66584 ?auto_66586 ) ) ( not ( = ?auto_66584 ?auto_66587 ) ) ( not ( = ?auto_66585 ?auto_66586 ) ) ( not ( = ?auto_66585 ?auto_66587 ) ) ( not ( = ?auto_66586 ?auto_66587 ) ) ( ON-TABLE ?auto_66587 ) ( ON ?auto_66586 ?auto_66587 ) ( ON ?auto_66585 ?auto_66586 ) ( ON ?auto_66584 ?auto_66585 ) ( ON ?auto_66582 ?auto_66588 ) ( not ( = ?auto_66582 ?auto_66588 ) ) ( not ( = ?auto_66583 ?auto_66588 ) ) ( not ( = ?auto_66584 ?auto_66588 ) ) ( not ( = ?auto_66585 ?auto_66588 ) ) ( not ( = ?auto_66586 ?auto_66588 ) ) ( not ( = ?auto_66587 ?auto_66588 ) ) ( CLEAR ?auto_66584 ) ( ON ?auto_66583 ?auto_66582 ) ( CLEAR ?auto_66583 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66588 ?auto_66582 )
      ( MAKE-6PILE ?auto_66582 ?auto_66583 ?auto_66584 ?auto_66585 ?auto_66586 ?auto_66587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66589 - BLOCK
      ?auto_66590 - BLOCK
      ?auto_66591 - BLOCK
      ?auto_66592 - BLOCK
      ?auto_66593 - BLOCK
      ?auto_66594 - BLOCK
    )
    :vars
    (
      ?auto_66595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66589 ?auto_66590 ) ) ( not ( = ?auto_66589 ?auto_66591 ) ) ( not ( = ?auto_66589 ?auto_66592 ) ) ( not ( = ?auto_66589 ?auto_66593 ) ) ( not ( = ?auto_66589 ?auto_66594 ) ) ( not ( = ?auto_66590 ?auto_66591 ) ) ( not ( = ?auto_66590 ?auto_66592 ) ) ( not ( = ?auto_66590 ?auto_66593 ) ) ( not ( = ?auto_66590 ?auto_66594 ) ) ( not ( = ?auto_66591 ?auto_66592 ) ) ( not ( = ?auto_66591 ?auto_66593 ) ) ( not ( = ?auto_66591 ?auto_66594 ) ) ( not ( = ?auto_66592 ?auto_66593 ) ) ( not ( = ?auto_66592 ?auto_66594 ) ) ( not ( = ?auto_66593 ?auto_66594 ) ) ( ON-TABLE ?auto_66594 ) ( ON ?auto_66593 ?auto_66594 ) ( ON ?auto_66592 ?auto_66593 ) ( ON ?auto_66589 ?auto_66595 ) ( not ( = ?auto_66589 ?auto_66595 ) ) ( not ( = ?auto_66590 ?auto_66595 ) ) ( not ( = ?auto_66591 ?auto_66595 ) ) ( not ( = ?auto_66592 ?auto_66595 ) ) ( not ( = ?auto_66593 ?auto_66595 ) ) ( not ( = ?auto_66594 ?auto_66595 ) ) ( ON ?auto_66590 ?auto_66589 ) ( CLEAR ?auto_66590 ) ( ON-TABLE ?auto_66595 ) ( HOLDING ?auto_66591 ) ( CLEAR ?auto_66592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66594 ?auto_66593 ?auto_66592 ?auto_66591 )
      ( MAKE-6PILE ?auto_66589 ?auto_66590 ?auto_66591 ?auto_66592 ?auto_66593 ?auto_66594 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66596 - BLOCK
      ?auto_66597 - BLOCK
      ?auto_66598 - BLOCK
      ?auto_66599 - BLOCK
      ?auto_66600 - BLOCK
      ?auto_66601 - BLOCK
    )
    :vars
    (
      ?auto_66602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66596 ?auto_66597 ) ) ( not ( = ?auto_66596 ?auto_66598 ) ) ( not ( = ?auto_66596 ?auto_66599 ) ) ( not ( = ?auto_66596 ?auto_66600 ) ) ( not ( = ?auto_66596 ?auto_66601 ) ) ( not ( = ?auto_66597 ?auto_66598 ) ) ( not ( = ?auto_66597 ?auto_66599 ) ) ( not ( = ?auto_66597 ?auto_66600 ) ) ( not ( = ?auto_66597 ?auto_66601 ) ) ( not ( = ?auto_66598 ?auto_66599 ) ) ( not ( = ?auto_66598 ?auto_66600 ) ) ( not ( = ?auto_66598 ?auto_66601 ) ) ( not ( = ?auto_66599 ?auto_66600 ) ) ( not ( = ?auto_66599 ?auto_66601 ) ) ( not ( = ?auto_66600 ?auto_66601 ) ) ( ON-TABLE ?auto_66601 ) ( ON ?auto_66600 ?auto_66601 ) ( ON ?auto_66599 ?auto_66600 ) ( ON ?auto_66596 ?auto_66602 ) ( not ( = ?auto_66596 ?auto_66602 ) ) ( not ( = ?auto_66597 ?auto_66602 ) ) ( not ( = ?auto_66598 ?auto_66602 ) ) ( not ( = ?auto_66599 ?auto_66602 ) ) ( not ( = ?auto_66600 ?auto_66602 ) ) ( not ( = ?auto_66601 ?auto_66602 ) ) ( ON ?auto_66597 ?auto_66596 ) ( ON-TABLE ?auto_66602 ) ( CLEAR ?auto_66599 ) ( ON ?auto_66598 ?auto_66597 ) ( CLEAR ?auto_66598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66602 ?auto_66596 ?auto_66597 )
      ( MAKE-6PILE ?auto_66596 ?auto_66597 ?auto_66598 ?auto_66599 ?auto_66600 ?auto_66601 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66603 - BLOCK
      ?auto_66604 - BLOCK
      ?auto_66605 - BLOCK
      ?auto_66606 - BLOCK
      ?auto_66607 - BLOCK
      ?auto_66608 - BLOCK
    )
    :vars
    (
      ?auto_66609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66603 ?auto_66604 ) ) ( not ( = ?auto_66603 ?auto_66605 ) ) ( not ( = ?auto_66603 ?auto_66606 ) ) ( not ( = ?auto_66603 ?auto_66607 ) ) ( not ( = ?auto_66603 ?auto_66608 ) ) ( not ( = ?auto_66604 ?auto_66605 ) ) ( not ( = ?auto_66604 ?auto_66606 ) ) ( not ( = ?auto_66604 ?auto_66607 ) ) ( not ( = ?auto_66604 ?auto_66608 ) ) ( not ( = ?auto_66605 ?auto_66606 ) ) ( not ( = ?auto_66605 ?auto_66607 ) ) ( not ( = ?auto_66605 ?auto_66608 ) ) ( not ( = ?auto_66606 ?auto_66607 ) ) ( not ( = ?auto_66606 ?auto_66608 ) ) ( not ( = ?auto_66607 ?auto_66608 ) ) ( ON-TABLE ?auto_66608 ) ( ON ?auto_66607 ?auto_66608 ) ( ON ?auto_66603 ?auto_66609 ) ( not ( = ?auto_66603 ?auto_66609 ) ) ( not ( = ?auto_66604 ?auto_66609 ) ) ( not ( = ?auto_66605 ?auto_66609 ) ) ( not ( = ?auto_66606 ?auto_66609 ) ) ( not ( = ?auto_66607 ?auto_66609 ) ) ( not ( = ?auto_66608 ?auto_66609 ) ) ( ON ?auto_66604 ?auto_66603 ) ( ON-TABLE ?auto_66609 ) ( ON ?auto_66605 ?auto_66604 ) ( CLEAR ?auto_66605 ) ( HOLDING ?auto_66606 ) ( CLEAR ?auto_66607 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66608 ?auto_66607 ?auto_66606 )
      ( MAKE-6PILE ?auto_66603 ?auto_66604 ?auto_66605 ?auto_66606 ?auto_66607 ?auto_66608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66610 - BLOCK
      ?auto_66611 - BLOCK
      ?auto_66612 - BLOCK
      ?auto_66613 - BLOCK
      ?auto_66614 - BLOCK
      ?auto_66615 - BLOCK
    )
    :vars
    (
      ?auto_66616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66610 ?auto_66611 ) ) ( not ( = ?auto_66610 ?auto_66612 ) ) ( not ( = ?auto_66610 ?auto_66613 ) ) ( not ( = ?auto_66610 ?auto_66614 ) ) ( not ( = ?auto_66610 ?auto_66615 ) ) ( not ( = ?auto_66611 ?auto_66612 ) ) ( not ( = ?auto_66611 ?auto_66613 ) ) ( not ( = ?auto_66611 ?auto_66614 ) ) ( not ( = ?auto_66611 ?auto_66615 ) ) ( not ( = ?auto_66612 ?auto_66613 ) ) ( not ( = ?auto_66612 ?auto_66614 ) ) ( not ( = ?auto_66612 ?auto_66615 ) ) ( not ( = ?auto_66613 ?auto_66614 ) ) ( not ( = ?auto_66613 ?auto_66615 ) ) ( not ( = ?auto_66614 ?auto_66615 ) ) ( ON-TABLE ?auto_66615 ) ( ON ?auto_66614 ?auto_66615 ) ( ON ?auto_66610 ?auto_66616 ) ( not ( = ?auto_66610 ?auto_66616 ) ) ( not ( = ?auto_66611 ?auto_66616 ) ) ( not ( = ?auto_66612 ?auto_66616 ) ) ( not ( = ?auto_66613 ?auto_66616 ) ) ( not ( = ?auto_66614 ?auto_66616 ) ) ( not ( = ?auto_66615 ?auto_66616 ) ) ( ON ?auto_66611 ?auto_66610 ) ( ON-TABLE ?auto_66616 ) ( ON ?auto_66612 ?auto_66611 ) ( CLEAR ?auto_66614 ) ( ON ?auto_66613 ?auto_66612 ) ( CLEAR ?auto_66613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66616 ?auto_66610 ?auto_66611 ?auto_66612 )
      ( MAKE-6PILE ?auto_66610 ?auto_66611 ?auto_66612 ?auto_66613 ?auto_66614 ?auto_66615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66617 - BLOCK
      ?auto_66618 - BLOCK
      ?auto_66619 - BLOCK
      ?auto_66620 - BLOCK
      ?auto_66621 - BLOCK
      ?auto_66622 - BLOCK
    )
    :vars
    (
      ?auto_66623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66617 ?auto_66618 ) ) ( not ( = ?auto_66617 ?auto_66619 ) ) ( not ( = ?auto_66617 ?auto_66620 ) ) ( not ( = ?auto_66617 ?auto_66621 ) ) ( not ( = ?auto_66617 ?auto_66622 ) ) ( not ( = ?auto_66618 ?auto_66619 ) ) ( not ( = ?auto_66618 ?auto_66620 ) ) ( not ( = ?auto_66618 ?auto_66621 ) ) ( not ( = ?auto_66618 ?auto_66622 ) ) ( not ( = ?auto_66619 ?auto_66620 ) ) ( not ( = ?auto_66619 ?auto_66621 ) ) ( not ( = ?auto_66619 ?auto_66622 ) ) ( not ( = ?auto_66620 ?auto_66621 ) ) ( not ( = ?auto_66620 ?auto_66622 ) ) ( not ( = ?auto_66621 ?auto_66622 ) ) ( ON-TABLE ?auto_66622 ) ( ON ?auto_66617 ?auto_66623 ) ( not ( = ?auto_66617 ?auto_66623 ) ) ( not ( = ?auto_66618 ?auto_66623 ) ) ( not ( = ?auto_66619 ?auto_66623 ) ) ( not ( = ?auto_66620 ?auto_66623 ) ) ( not ( = ?auto_66621 ?auto_66623 ) ) ( not ( = ?auto_66622 ?auto_66623 ) ) ( ON ?auto_66618 ?auto_66617 ) ( ON-TABLE ?auto_66623 ) ( ON ?auto_66619 ?auto_66618 ) ( ON ?auto_66620 ?auto_66619 ) ( CLEAR ?auto_66620 ) ( HOLDING ?auto_66621 ) ( CLEAR ?auto_66622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66622 ?auto_66621 )
      ( MAKE-6PILE ?auto_66617 ?auto_66618 ?auto_66619 ?auto_66620 ?auto_66621 ?auto_66622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66624 - BLOCK
      ?auto_66625 - BLOCK
      ?auto_66626 - BLOCK
      ?auto_66627 - BLOCK
      ?auto_66628 - BLOCK
      ?auto_66629 - BLOCK
    )
    :vars
    (
      ?auto_66630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66624 ?auto_66625 ) ) ( not ( = ?auto_66624 ?auto_66626 ) ) ( not ( = ?auto_66624 ?auto_66627 ) ) ( not ( = ?auto_66624 ?auto_66628 ) ) ( not ( = ?auto_66624 ?auto_66629 ) ) ( not ( = ?auto_66625 ?auto_66626 ) ) ( not ( = ?auto_66625 ?auto_66627 ) ) ( not ( = ?auto_66625 ?auto_66628 ) ) ( not ( = ?auto_66625 ?auto_66629 ) ) ( not ( = ?auto_66626 ?auto_66627 ) ) ( not ( = ?auto_66626 ?auto_66628 ) ) ( not ( = ?auto_66626 ?auto_66629 ) ) ( not ( = ?auto_66627 ?auto_66628 ) ) ( not ( = ?auto_66627 ?auto_66629 ) ) ( not ( = ?auto_66628 ?auto_66629 ) ) ( ON-TABLE ?auto_66629 ) ( ON ?auto_66624 ?auto_66630 ) ( not ( = ?auto_66624 ?auto_66630 ) ) ( not ( = ?auto_66625 ?auto_66630 ) ) ( not ( = ?auto_66626 ?auto_66630 ) ) ( not ( = ?auto_66627 ?auto_66630 ) ) ( not ( = ?auto_66628 ?auto_66630 ) ) ( not ( = ?auto_66629 ?auto_66630 ) ) ( ON ?auto_66625 ?auto_66624 ) ( ON-TABLE ?auto_66630 ) ( ON ?auto_66626 ?auto_66625 ) ( ON ?auto_66627 ?auto_66626 ) ( CLEAR ?auto_66629 ) ( ON ?auto_66628 ?auto_66627 ) ( CLEAR ?auto_66628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66630 ?auto_66624 ?auto_66625 ?auto_66626 ?auto_66627 )
      ( MAKE-6PILE ?auto_66624 ?auto_66625 ?auto_66626 ?auto_66627 ?auto_66628 ?auto_66629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66631 - BLOCK
      ?auto_66632 - BLOCK
      ?auto_66633 - BLOCK
      ?auto_66634 - BLOCK
      ?auto_66635 - BLOCK
      ?auto_66636 - BLOCK
    )
    :vars
    (
      ?auto_66637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66631 ?auto_66632 ) ) ( not ( = ?auto_66631 ?auto_66633 ) ) ( not ( = ?auto_66631 ?auto_66634 ) ) ( not ( = ?auto_66631 ?auto_66635 ) ) ( not ( = ?auto_66631 ?auto_66636 ) ) ( not ( = ?auto_66632 ?auto_66633 ) ) ( not ( = ?auto_66632 ?auto_66634 ) ) ( not ( = ?auto_66632 ?auto_66635 ) ) ( not ( = ?auto_66632 ?auto_66636 ) ) ( not ( = ?auto_66633 ?auto_66634 ) ) ( not ( = ?auto_66633 ?auto_66635 ) ) ( not ( = ?auto_66633 ?auto_66636 ) ) ( not ( = ?auto_66634 ?auto_66635 ) ) ( not ( = ?auto_66634 ?auto_66636 ) ) ( not ( = ?auto_66635 ?auto_66636 ) ) ( ON ?auto_66631 ?auto_66637 ) ( not ( = ?auto_66631 ?auto_66637 ) ) ( not ( = ?auto_66632 ?auto_66637 ) ) ( not ( = ?auto_66633 ?auto_66637 ) ) ( not ( = ?auto_66634 ?auto_66637 ) ) ( not ( = ?auto_66635 ?auto_66637 ) ) ( not ( = ?auto_66636 ?auto_66637 ) ) ( ON ?auto_66632 ?auto_66631 ) ( ON-TABLE ?auto_66637 ) ( ON ?auto_66633 ?auto_66632 ) ( ON ?auto_66634 ?auto_66633 ) ( ON ?auto_66635 ?auto_66634 ) ( CLEAR ?auto_66635 ) ( HOLDING ?auto_66636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66636 )
      ( MAKE-6PILE ?auto_66631 ?auto_66632 ?auto_66633 ?auto_66634 ?auto_66635 ?auto_66636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66638 - BLOCK
      ?auto_66639 - BLOCK
      ?auto_66640 - BLOCK
      ?auto_66641 - BLOCK
      ?auto_66642 - BLOCK
      ?auto_66643 - BLOCK
    )
    :vars
    (
      ?auto_66644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66638 ?auto_66639 ) ) ( not ( = ?auto_66638 ?auto_66640 ) ) ( not ( = ?auto_66638 ?auto_66641 ) ) ( not ( = ?auto_66638 ?auto_66642 ) ) ( not ( = ?auto_66638 ?auto_66643 ) ) ( not ( = ?auto_66639 ?auto_66640 ) ) ( not ( = ?auto_66639 ?auto_66641 ) ) ( not ( = ?auto_66639 ?auto_66642 ) ) ( not ( = ?auto_66639 ?auto_66643 ) ) ( not ( = ?auto_66640 ?auto_66641 ) ) ( not ( = ?auto_66640 ?auto_66642 ) ) ( not ( = ?auto_66640 ?auto_66643 ) ) ( not ( = ?auto_66641 ?auto_66642 ) ) ( not ( = ?auto_66641 ?auto_66643 ) ) ( not ( = ?auto_66642 ?auto_66643 ) ) ( ON ?auto_66638 ?auto_66644 ) ( not ( = ?auto_66638 ?auto_66644 ) ) ( not ( = ?auto_66639 ?auto_66644 ) ) ( not ( = ?auto_66640 ?auto_66644 ) ) ( not ( = ?auto_66641 ?auto_66644 ) ) ( not ( = ?auto_66642 ?auto_66644 ) ) ( not ( = ?auto_66643 ?auto_66644 ) ) ( ON ?auto_66639 ?auto_66638 ) ( ON-TABLE ?auto_66644 ) ( ON ?auto_66640 ?auto_66639 ) ( ON ?auto_66641 ?auto_66640 ) ( ON ?auto_66642 ?auto_66641 ) ( ON ?auto_66643 ?auto_66642 ) ( CLEAR ?auto_66643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66644 ?auto_66638 ?auto_66639 ?auto_66640 ?auto_66641 ?auto_66642 )
      ( MAKE-6PILE ?auto_66638 ?auto_66639 ?auto_66640 ?auto_66641 ?auto_66642 ?auto_66643 ) )
  )

)

