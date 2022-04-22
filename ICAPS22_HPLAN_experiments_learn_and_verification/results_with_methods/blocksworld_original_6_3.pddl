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
      ?auto_44823 - BLOCK
      ?auto_44824 - BLOCK
      ?auto_44825 - BLOCK
      ?auto_44826 - BLOCK
      ?auto_44827 - BLOCK
      ?auto_44828 - BLOCK
    )
    :vars
    (
      ?auto_44829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44829 ?auto_44828 ) ( CLEAR ?auto_44829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44823 ) ( ON ?auto_44824 ?auto_44823 ) ( ON ?auto_44825 ?auto_44824 ) ( ON ?auto_44826 ?auto_44825 ) ( ON ?auto_44827 ?auto_44826 ) ( ON ?auto_44828 ?auto_44827 ) ( not ( = ?auto_44823 ?auto_44824 ) ) ( not ( = ?auto_44823 ?auto_44825 ) ) ( not ( = ?auto_44823 ?auto_44826 ) ) ( not ( = ?auto_44823 ?auto_44827 ) ) ( not ( = ?auto_44823 ?auto_44828 ) ) ( not ( = ?auto_44823 ?auto_44829 ) ) ( not ( = ?auto_44824 ?auto_44825 ) ) ( not ( = ?auto_44824 ?auto_44826 ) ) ( not ( = ?auto_44824 ?auto_44827 ) ) ( not ( = ?auto_44824 ?auto_44828 ) ) ( not ( = ?auto_44824 ?auto_44829 ) ) ( not ( = ?auto_44825 ?auto_44826 ) ) ( not ( = ?auto_44825 ?auto_44827 ) ) ( not ( = ?auto_44825 ?auto_44828 ) ) ( not ( = ?auto_44825 ?auto_44829 ) ) ( not ( = ?auto_44826 ?auto_44827 ) ) ( not ( = ?auto_44826 ?auto_44828 ) ) ( not ( = ?auto_44826 ?auto_44829 ) ) ( not ( = ?auto_44827 ?auto_44828 ) ) ( not ( = ?auto_44827 ?auto_44829 ) ) ( not ( = ?auto_44828 ?auto_44829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44829 ?auto_44828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44831 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_44831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44832 - BLOCK
    )
    :vars
    (
      ?auto_44833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44832 ?auto_44833 ) ( CLEAR ?auto_44832 ) ( HAND-EMPTY ) ( not ( = ?auto_44832 ?auto_44833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44832 ?auto_44833 )
      ( MAKE-1PILE ?auto_44832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44839 - BLOCK
      ?auto_44840 - BLOCK
      ?auto_44841 - BLOCK
      ?auto_44842 - BLOCK
      ?auto_44843 - BLOCK
    )
    :vars
    (
      ?auto_44844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44844 ?auto_44843 ) ( CLEAR ?auto_44844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44839 ) ( ON ?auto_44840 ?auto_44839 ) ( ON ?auto_44841 ?auto_44840 ) ( ON ?auto_44842 ?auto_44841 ) ( ON ?auto_44843 ?auto_44842 ) ( not ( = ?auto_44839 ?auto_44840 ) ) ( not ( = ?auto_44839 ?auto_44841 ) ) ( not ( = ?auto_44839 ?auto_44842 ) ) ( not ( = ?auto_44839 ?auto_44843 ) ) ( not ( = ?auto_44839 ?auto_44844 ) ) ( not ( = ?auto_44840 ?auto_44841 ) ) ( not ( = ?auto_44840 ?auto_44842 ) ) ( not ( = ?auto_44840 ?auto_44843 ) ) ( not ( = ?auto_44840 ?auto_44844 ) ) ( not ( = ?auto_44841 ?auto_44842 ) ) ( not ( = ?auto_44841 ?auto_44843 ) ) ( not ( = ?auto_44841 ?auto_44844 ) ) ( not ( = ?auto_44842 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44844 ) ) ( not ( = ?auto_44843 ?auto_44844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44844 ?auto_44843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44845 - BLOCK
      ?auto_44846 - BLOCK
      ?auto_44847 - BLOCK
      ?auto_44848 - BLOCK
      ?auto_44849 - BLOCK
    )
    :vars
    (
      ?auto_44850 - BLOCK
      ?auto_44851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44850 ?auto_44849 ) ( CLEAR ?auto_44850 ) ( ON-TABLE ?auto_44845 ) ( ON ?auto_44846 ?auto_44845 ) ( ON ?auto_44847 ?auto_44846 ) ( ON ?auto_44848 ?auto_44847 ) ( ON ?auto_44849 ?auto_44848 ) ( not ( = ?auto_44845 ?auto_44846 ) ) ( not ( = ?auto_44845 ?auto_44847 ) ) ( not ( = ?auto_44845 ?auto_44848 ) ) ( not ( = ?auto_44845 ?auto_44849 ) ) ( not ( = ?auto_44845 ?auto_44850 ) ) ( not ( = ?auto_44846 ?auto_44847 ) ) ( not ( = ?auto_44846 ?auto_44848 ) ) ( not ( = ?auto_44846 ?auto_44849 ) ) ( not ( = ?auto_44846 ?auto_44850 ) ) ( not ( = ?auto_44847 ?auto_44848 ) ) ( not ( = ?auto_44847 ?auto_44849 ) ) ( not ( = ?auto_44847 ?auto_44850 ) ) ( not ( = ?auto_44848 ?auto_44849 ) ) ( not ( = ?auto_44848 ?auto_44850 ) ) ( not ( = ?auto_44849 ?auto_44850 ) ) ( HOLDING ?auto_44851 ) ( not ( = ?auto_44845 ?auto_44851 ) ) ( not ( = ?auto_44846 ?auto_44851 ) ) ( not ( = ?auto_44847 ?auto_44851 ) ) ( not ( = ?auto_44848 ?auto_44851 ) ) ( not ( = ?auto_44849 ?auto_44851 ) ) ( not ( = ?auto_44850 ?auto_44851 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_44851 )
      ( MAKE-5PILE ?auto_44845 ?auto_44846 ?auto_44847 ?auto_44848 ?auto_44849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44852 - BLOCK
      ?auto_44853 - BLOCK
      ?auto_44854 - BLOCK
      ?auto_44855 - BLOCK
      ?auto_44856 - BLOCK
    )
    :vars
    (
      ?auto_44858 - BLOCK
      ?auto_44857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44858 ?auto_44856 ) ( ON-TABLE ?auto_44852 ) ( ON ?auto_44853 ?auto_44852 ) ( ON ?auto_44854 ?auto_44853 ) ( ON ?auto_44855 ?auto_44854 ) ( ON ?auto_44856 ?auto_44855 ) ( not ( = ?auto_44852 ?auto_44853 ) ) ( not ( = ?auto_44852 ?auto_44854 ) ) ( not ( = ?auto_44852 ?auto_44855 ) ) ( not ( = ?auto_44852 ?auto_44856 ) ) ( not ( = ?auto_44852 ?auto_44858 ) ) ( not ( = ?auto_44853 ?auto_44854 ) ) ( not ( = ?auto_44853 ?auto_44855 ) ) ( not ( = ?auto_44853 ?auto_44856 ) ) ( not ( = ?auto_44853 ?auto_44858 ) ) ( not ( = ?auto_44854 ?auto_44855 ) ) ( not ( = ?auto_44854 ?auto_44856 ) ) ( not ( = ?auto_44854 ?auto_44858 ) ) ( not ( = ?auto_44855 ?auto_44856 ) ) ( not ( = ?auto_44855 ?auto_44858 ) ) ( not ( = ?auto_44856 ?auto_44858 ) ) ( not ( = ?auto_44852 ?auto_44857 ) ) ( not ( = ?auto_44853 ?auto_44857 ) ) ( not ( = ?auto_44854 ?auto_44857 ) ) ( not ( = ?auto_44855 ?auto_44857 ) ) ( not ( = ?auto_44856 ?auto_44857 ) ) ( not ( = ?auto_44858 ?auto_44857 ) ) ( ON ?auto_44857 ?auto_44858 ) ( CLEAR ?auto_44857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44852 ?auto_44853 ?auto_44854 ?auto_44855 ?auto_44856 ?auto_44858 )
      ( MAKE-5PILE ?auto_44852 ?auto_44853 ?auto_44854 ?auto_44855 ?auto_44856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44861 - BLOCK
      ?auto_44862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44862 ) ( CLEAR ?auto_44861 ) ( ON-TABLE ?auto_44861 ) ( not ( = ?auto_44861 ?auto_44862 ) ) )
    :subtasks
    ( ( !STACK ?auto_44862 ?auto_44861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44863 - BLOCK
      ?auto_44864 - BLOCK
    )
    :vars
    (
      ?auto_44865 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44863 ) ( ON-TABLE ?auto_44863 ) ( not ( = ?auto_44863 ?auto_44864 ) ) ( ON ?auto_44864 ?auto_44865 ) ( CLEAR ?auto_44864 ) ( HAND-EMPTY ) ( not ( = ?auto_44863 ?auto_44865 ) ) ( not ( = ?auto_44864 ?auto_44865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44864 ?auto_44865 )
      ( MAKE-2PILE ?auto_44863 ?auto_44864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44866 - BLOCK
      ?auto_44867 - BLOCK
    )
    :vars
    (
      ?auto_44868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44866 ?auto_44867 ) ) ( ON ?auto_44867 ?auto_44868 ) ( CLEAR ?auto_44867 ) ( not ( = ?auto_44866 ?auto_44868 ) ) ( not ( = ?auto_44867 ?auto_44868 ) ) ( HOLDING ?auto_44866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44866 )
      ( MAKE-2PILE ?auto_44866 ?auto_44867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44869 - BLOCK
      ?auto_44870 - BLOCK
    )
    :vars
    (
      ?auto_44871 - BLOCK
      ?auto_44874 - BLOCK
      ?auto_44875 - BLOCK
      ?auto_44873 - BLOCK
      ?auto_44872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44869 ?auto_44870 ) ) ( ON ?auto_44870 ?auto_44871 ) ( not ( = ?auto_44869 ?auto_44871 ) ) ( not ( = ?auto_44870 ?auto_44871 ) ) ( ON ?auto_44869 ?auto_44870 ) ( CLEAR ?auto_44869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44874 ) ( ON ?auto_44875 ?auto_44874 ) ( ON ?auto_44873 ?auto_44875 ) ( ON ?auto_44872 ?auto_44873 ) ( ON ?auto_44871 ?auto_44872 ) ( not ( = ?auto_44874 ?auto_44875 ) ) ( not ( = ?auto_44874 ?auto_44873 ) ) ( not ( = ?auto_44874 ?auto_44872 ) ) ( not ( = ?auto_44874 ?auto_44871 ) ) ( not ( = ?auto_44874 ?auto_44870 ) ) ( not ( = ?auto_44874 ?auto_44869 ) ) ( not ( = ?auto_44875 ?auto_44873 ) ) ( not ( = ?auto_44875 ?auto_44872 ) ) ( not ( = ?auto_44875 ?auto_44871 ) ) ( not ( = ?auto_44875 ?auto_44870 ) ) ( not ( = ?auto_44875 ?auto_44869 ) ) ( not ( = ?auto_44873 ?auto_44872 ) ) ( not ( = ?auto_44873 ?auto_44871 ) ) ( not ( = ?auto_44873 ?auto_44870 ) ) ( not ( = ?auto_44873 ?auto_44869 ) ) ( not ( = ?auto_44872 ?auto_44871 ) ) ( not ( = ?auto_44872 ?auto_44870 ) ) ( not ( = ?auto_44872 ?auto_44869 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44874 ?auto_44875 ?auto_44873 ?auto_44872 ?auto_44871 ?auto_44870 )
      ( MAKE-2PILE ?auto_44869 ?auto_44870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44880 - BLOCK
      ?auto_44881 - BLOCK
      ?auto_44882 - BLOCK
      ?auto_44883 - BLOCK
    )
    :vars
    (
      ?auto_44884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44884 ?auto_44883 ) ( CLEAR ?auto_44884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44880 ) ( ON ?auto_44881 ?auto_44880 ) ( ON ?auto_44882 ?auto_44881 ) ( ON ?auto_44883 ?auto_44882 ) ( not ( = ?auto_44880 ?auto_44881 ) ) ( not ( = ?auto_44880 ?auto_44882 ) ) ( not ( = ?auto_44880 ?auto_44883 ) ) ( not ( = ?auto_44880 ?auto_44884 ) ) ( not ( = ?auto_44881 ?auto_44882 ) ) ( not ( = ?auto_44881 ?auto_44883 ) ) ( not ( = ?auto_44881 ?auto_44884 ) ) ( not ( = ?auto_44882 ?auto_44883 ) ) ( not ( = ?auto_44882 ?auto_44884 ) ) ( not ( = ?auto_44883 ?auto_44884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44884 ?auto_44883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44885 - BLOCK
      ?auto_44886 - BLOCK
      ?auto_44887 - BLOCK
      ?auto_44888 - BLOCK
    )
    :vars
    (
      ?auto_44889 - BLOCK
      ?auto_44890 - BLOCK
      ?auto_44891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44889 ?auto_44888 ) ( CLEAR ?auto_44889 ) ( ON-TABLE ?auto_44885 ) ( ON ?auto_44886 ?auto_44885 ) ( ON ?auto_44887 ?auto_44886 ) ( ON ?auto_44888 ?auto_44887 ) ( not ( = ?auto_44885 ?auto_44886 ) ) ( not ( = ?auto_44885 ?auto_44887 ) ) ( not ( = ?auto_44885 ?auto_44888 ) ) ( not ( = ?auto_44885 ?auto_44889 ) ) ( not ( = ?auto_44886 ?auto_44887 ) ) ( not ( = ?auto_44886 ?auto_44888 ) ) ( not ( = ?auto_44886 ?auto_44889 ) ) ( not ( = ?auto_44887 ?auto_44888 ) ) ( not ( = ?auto_44887 ?auto_44889 ) ) ( not ( = ?auto_44888 ?auto_44889 ) ) ( HOLDING ?auto_44890 ) ( CLEAR ?auto_44891 ) ( not ( = ?auto_44885 ?auto_44890 ) ) ( not ( = ?auto_44885 ?auto_44891 ) ) ( not ( = ?auto_44886 ?auto_44890 ) ) ( not ( = ?auto_44886 ?auto_44891 ) ) ( not ( = ?auto_44887 ?auto_44890 ) ) ( not ( = ?auto_44887 ?auto_44891 ) ) ( not ( = ?auto_44888 ?auto_44890 ) ) ( not ( = ?auto_44888 ?auto_44891 ) ) ( not ( = ?auto_44889 ?auto_44890 ) ) ( not ( = ?auto_44889 ?auto_44891 ) ) ( not ( = ?auto_44890 ?auto_44891 ) ) )
    :subtasks
    ( ( !STACK ?auto_44890 ?auto_44891 )
      ( MAKE-4PILE ?auto_44885 ?auto_44886 ?auto_44887 ?auto_44888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44892 - BLOCK
      ?auto_44893 - BLOCK
      ?auto_44894 - BLOCK
      ?auto_44895 - BLOCK
    )
    :vars
    (
      ?auto_44897 - BLOCK
      ?auto_44896 - BLOCK
      ?auto_44898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44897 ?auto_44895 ) ( ON-TABLE ?auto_44892 ) ( ON ?auto_44893 ?auto_44892 ) ( ON ?auto_44894 ?auto_44893 ) ( ON ?auto_44895 ?auto_44894 ) ( not ( = ?auto_44892 ?auto_44893 ) ) ( not ( = ?auto_44892 ?auto_44894 ) ) ( not ( = ?auto_44892 ?auto_44895 ) ) ( not ( = ?auto_44892 ?auto_44897 ) ) ( not ( = ?auto_44893 ?auto_44894 ) ) ( not ( = ?auto_44893 ?auto_44895 ) ) ( not ( = ?auto_44893 ?auto_44897 ) ) ( not ( = ?auto_44894 ?auto_44895 ) ) ( not ( = ?auto_44894 ?auto_44897 ) ) ( not ( = ?auto_44895 ?auto_44897 ) ) ( CLEAR ?auto_44896 ) ( not ( = ?auto_44892 ?auto_44898 ) ) ( not ( = ?auto_44892 ?auto_44896 ) ) ( not ( = ?auto_44893 ?auto_44898 ) ) ( not ( = ?auto_44893 ?auto_44896 ) ) ( not ( = ?auto_44894 ?auto_44898 ) ) ( not ( = ?auto_44894 ?auto_44896 ) ) ( not ( = ?auto_44895 ?auto_44898 ) ) ( not ( = ?auto_44895 ?auto_44896 ) ) ( not ( = ?auto_44897 ?auto_44898 ) ) ( not ( = ?auto_44897 ?auto_44896 ) ) ( not ( = ?auto_44898 ?auto_44896 ) ) ( ON ?auto_44898 ?auto_44897 ) ( CLEAR ?auto_44898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44892 ?auto_44893 ?auto_44894 ?auto_44895 ?auto_44897 )
      ( MAKE-4PILE ?auto_44892 ?auto_44893 ?auto_44894 ?auto_44895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44899 - BLOCK
      ?auto_44900 - BLOCK
      ?auto_44901 - BLOCK
      ?auto_44902 - BLOCK
    )
    :vars
    (
      ?auto_44905 - BLOCK
      ?auto_44904 - BLOCK
      ?auto_44903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44905 ?auto_44902 ) ( ON-TABLE ?auto_44899 ) ( ON ?auto_44900 ?auto_44899 ) ( ON ?auto_44901 ?auto_44900 ) ( ON ?auto_44902 ?auto_44901 ) ( not ( = ?auto_44899 ?auto_44900 ) ) ( not ( = ?auto_44899 ?auto_44901 ) ) ( not ( = ?auto_44899 ?auto_44902 ) ) ( not ( = ?auto_44899 ?auto_44905 ) ) ( not ( = ?auto_44900 ?auto_44901 ) ) ( not ( = ?auto_44900 ?auto_44902 ) ) ( not ( = ?auto_44900 ?auto_44905 ) ) ( not ( = ?auto_44901 ?auto_44902 ) ) ( not ( = ?auto_44901 ?auto_44905 ) ) ( not ( = ?auto_44902 ?auto_44905 ) ) ( not ( = ?auto_44899 ?auto_44904 ) ) ( not ( = ?auto_44899 ?auto_44903 ) ) ( not ( = ?auto_44900 ?auto_44904 ) ) ( not ( = ?auto_44900 ?auto_44903 ) ) ( not ( = ?auto_44901 ?auto_44904 ) ) ( not ( = ?auto_44901 ?auto_44903 ) ) ( not ( = ?auto_44902 ?auto_44904 ) ) ( not ( = ?auto_44902 ?auto_44903 ) ) ( not ( = ?auto_44905 ?auto_44904 ) ) ( not ( = ?auto_44905 ?auto_44903 ) ) ( not ( = ?auto_44904 ?auto_44903 ) ) ( ON ?auto_44904 ?auto_44905 ) ( CLEAR ?auto_44904 ) ( HOLDING ?auto_44903 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44903 )
      ( MAKE-4PILE ?auto_44899 ?auto_44900 ?auto_44901 ?auto_44902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44906 - BLOCK
      ?auto_44907 - BLOCK
      ?auto_44908 - BLOCK
      ?auto_44909 - BLOCK
    )
    :vars
    (
      ?auto_44911 - BLOCK
      ?auto_44912 - BLOCK
      ?auto_44910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44911 ?auto_44909 ) ( ON-TABLE ?auto_44906 ) ( ON ?auto_44907 ?auto_44906 ) ( ON ?auto_44908 ?auto_44907 ) ( ON ?auto_44909 ?auto_44908 ) ( not ( = ?auto_44906 ?auto_44907 ) ) ( not ( = ?auto_44906 ?auto_44908 ) ) ( not ( = ?auto_44906 ?auto_44909 ) ) ( not ( = ?auto_44906 ?auto_44911 ) ) ( not ( = ?auto_44907 ?auto_44908 ) ) ( not ( = ?auto_44907 ?auto_44909 ) ) ( not ( = ?auto_44907 ?auto_44911 ) ) ( not ( = ?auto_44908 ?auto_44909 ) ) ( not ( = ?auto_44908 ?auto_44911 ) ) ( not ( = ?auto_44909 ?auto_44911 ) ) ( not ( = ?auto_44906 ?auto_44912 ) ) ( not ( = ?auto_44906 ?auto_44910 ) ) ( not ( = ?auto_44907 ?auto_44912 ) ) ( not ( = ?auto_44907 ?auto_44910 ) ) ( not ( = ?auto_44908 ?auto_44912 ) ) ( not ( = ?auto_44908 ?auto_44910 ) ) ( not ( = ?auto_44909 ?auto_44912 ) ) ( not ( = ?auto_44909 ?auto_44910 ) ) ( not ( = ?auto_44911 ?auto_44912 ) ) ( not ( = ?auto_44911 ?auto_44910 ) ) ( not ( = ?auto_44912 ?auto_44910 ) ) ( ON ?auto_44912 ?auto_44911 ) ( ON ?auto_44910 ?auto_44912 ) ( CLEAR ?auto_44910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44906 ?auto_44907 ?auto_44908 ?auto_44909 ?auto_44911 ?auto_44912 )
      ( MAKE-4PILE ?auto_44906 ?auto_44907 ?auto_44908 ?auto_44909 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44916 - BLOCK
      ?auto_44917 - BLOCK
      ?auto_44918 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44918 ) ( CLEAR ?auto_44917 ) ( ON-TABLE ?auto_44916 ) ( ON ?auto_44917 ?auto_44916 ) ( not ( = ?auto_44916 ?auto_44917 ) ) ( not ( = ?auto_44916 ?auto_44918 ) ) ( not ( = ?auto_44917 ?auto_44918 ) ) )
    :subtasks
    ( ( !STACK ?auto_44918 ?auto_44917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44919 - BLOCK
      ?auto_44920 - BLOCK
      ?auto_44921 - BLOCK
    )
    :vars
    (
      ?auto_44922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44920 ) ( ON-TABLE ?auto_44919 ) ( ON ?auto_44920 ?auto_44919 ) ( not ( = ?auto_44919 ?auto_44920 ) ) ( not ( = ?auto_44919 ?auto_44921 ) ) ( not ( = ?auto_44920 ?auto_44921 ) ) ( ON ?auto_44921 ?auto_44922 ) ( CLEAR ?auto_44921 ) ( HAND-EMPTY ) ( not ( = ?auto_44919 ?auto_44922 ) ) ( not ( = ?auto_44920 ?auto_44922 ) ) ( not ( = ?auto_44921 ?auto_44922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44921 ?auto_44922 )
      ( MAKE-3PILE ?auto_44919 ?auto_44920 ?auto_44921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44923 - BLOCK
      ?auto_44924 - BLOCK
      ?auto_44925 - BLOCK
    )
    :vars
    (
      ?auto_44926 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44923 ) ( not ( = ?auto_44923 ?auto_44924 ) ) ( not ( = ?auto_44923 ?auto_44925 ) ) ( not ( = ?auto_44924 ?auto_44925 ) ) ( ON ?auto_44925 ?auto_44926 ) ( CLEAR ?auto_44925 ) ( not ( = ?auto_44923 ?auto_44926 ) ) ( not ( = ?auto_44924 ?auto_44926 ) ) ( not ( = ?auto_44925 ?auto_44926 ) ) ( HOLDING ?auto_44924 ) ( CLEAR ?auto_44923 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44923 ?auto_44924 )
      ( MAKE-3PILE ?auto_44923 ?auto_44924 ?auto_44925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44927 - BLOCK
      ?auto_44928 - BLOCK
      ?auto_44929 - BLOCK
    )
    :vars
    (
      ?auto_44930 - BLOCK
      ?auto_44931 - BLOCK
      ?auto_44933 - BLOCK
      ?auto_44932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44927 ) ( not ( = ?auto_44927 ?auto_44928 ) ) ( not ( = ?auto_44927 ?auto_44929 ) ) ( not ( = ?auto_44928 ?auto_44929 ) ) ( ON ?auto_44929 ?auto_44930 ) ( not ( = ?auto_44927 ?auto_44930 ) ) ( not ( = ?auto_44928 ?auto_44930 ) ) ( not ( = ?auto_44929 ?auto_44930 ) ) ( CLEAR ?auto_44927 ) ( ON ?auto_44928 ?auto_44929 ) ( CLEAR ?auto_44928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44931 ) ( ON ?auto_44933 ?auto_44931 ) ( ON ?auto_44932 ?auto_44933 ) ( ON ?auto_44930 ?auto_44932 ) ( not ( = ?auto_44931 ?auto_44933 ) ) ( not ( = ?auto_44931 ?auto_44932 ) ) ( not ( = ?auto_44931 ?auto_44930 ) ) ( not ( = ?auto_44931 ?auto_44929 ) ) ( not ( = ?auto_44931 ?auto_44928 ) ) ( not ( = ?auto_44933 ?auto_44932 ) ) ( not ( = ?auto_44933 ?auto_44930 ) ) ( not ( = ?auto_44933 ?auto_44929 ) ) ( not ( = ?auto_44933 ?auto_44928 ) ) ( not ( = ?auto_44932 ?auto_44930 ) ) ( not ( = ?auto_44932 ?auto_44929 ) ) ( not ( = ?auto_44932 ?auto_44928 ) ) ( not ( = ?auto_44927 ?auto_44931 ) ) ( not ( = ?auto_44927 ?auto_44933 ) ) ( not ( = ?auto_44927 ?auto_44932 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44931 ?auto_44933 ?auto_44932 ?auto_44930 ?auto_44929 )
      ( MAKE-3PILE ?auto_44927 ?auto_44928 ?auto_44929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44934 - BLOCK
      ?auto_44935 - BLOCK
      ?auto_44936 - BLOCK
    )
    :vars
    (
      ?auto_44938 - BLOCK
      ?auto_44939 - BLOCK
      ?auto_44940 - BLOCK
      ?auto_44937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44934 ?auto_44935 ) ) ( not ( = ?auto_44934 ?auto_44936 ) ) ( not ( = ?auto_44935 ?auto_44936 ) ) ( ON ?auto_44936 ?auto_44938 ) ( not ( = ?auto_44934 ?auto_44938 ) ) ( not ( = ?auto_44935 ?auto_44938 ) ) ( not ( = ?auto_44936 ?auto_44938 ) ) ( ON ?auto_44935 ?auto_44936 ) ( CLEAR ?auto_44935 ) ( ON-TABLE ?auto_44939 ) ( ON ?auto_44940 ?auto_44939 ) ( ON ?auto_44937 ?auto_44940 ) ( ON ?auto_44938 ?auto_44937 ) ( not ( = ?auto_44939 ?auto_44940 ) ) ( not ( = ?auto_44939 ?auto_44937 ) ) ( not ( = ?auto_44939 ?auto_44938 ) ) ( not ( = ?auto_44939 ?auto_44936 ) ) ( not ( = ?auto_44939 ?auto_44935 ) ) ( not ( = ?auto_44940 ?auto_44937 ) ) ( not ( = ?auto_44940 ?auto_44938 ) ) ( not ( = ?auto_44940 ?auto_44936 ) ) ( not ( = ?auto_44940 ?auto_44935 ) ) ( not ( = ?auto_44937 ?auto_44938 ) ) ( not ( = ?auto_44937 ?auto_44936 ) ) ( not ( = ?auto_44937 ?auto_44935 ) ) ( not ( = ?auto_44934 ?auto_44939 ) ) ( not ( = ?auto_44934 ?auto_44940 ) ) ( not ( = ?auto_44934 ?auto_44937 ) ) ( HOLDING ?auto_44934 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44934 )
      ( MAKE-3PILE ?auto_44934 ?auto_44935 ?auto_44936 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44941 - BLOCK
      ?auto_44942 - BLOCK
      ?auto_44943 - BLOCK
    )
    :vars
    (
      ?auto_44945 - BLOCK
      ?auto_44944 - BLOCK
      ?auto_44947 - BLOCK
      ?auto_44946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44941 ?auto_44942 ) ) ( not ( = ?auto_44941 ?auto_44943 ) ) ( not ( = ?auto_44942 ?auto_44943 ) ) ( ON ?auto_44943 ?auto_44945 ) ( not ( = ?auto_44941 ?auto_44945 ) ) ( not ( = ?auto_44942 ?auto_44945 ) ) ( not ( = ?auto_44943 ?auto_44945 ) ) ( ON ?auto_44942 ?auto_44943 ) ( ON-TABLE ?auto_44944 ) ( ON ?auto_44947 ?auto_44944 ) ( ON ?auto_44946 ?auto_44947 ) ( ON ?auto_44945 ?auto_44946 ) ( not ( = ?auto_44944 ?auto_44947 ) ) ( not ( = ?auto_44944 ?auto_44946 ) ) ( not ( = ?auto_44944 ?auto_44945 ) ) ( not ( = ?auto_44944 ?auto_44943 ) ) ( not ( = ?auto_44944 ?auto_44942 ) ) ( not ( = ?auto_44947 ?auto_44946 ) ) ( not ( = ?auto_44947 ?auto_44945 ) ) ( not ( = ?auto_44947 ?auto_44943 ) ) ( not ( = ?auto_44947 ?auto_44942 ) ) ( not ( = ?auto_44946 ?auto_44945 ) ) ( not ( = ?auto_44946 ?auto_44943 ) ) ( not ( = ?auto_44946 ?auto_44942 ) ) ( not ( = ?auto_44941 ?auto_44944 ) ) ( not ( = ?auto_44941 ?auto_44947 ) ) ( not ( = ?auto_44941 ?auto_44946 ) ) ( ON ?auto_44941 ?auto_44942 ) ( CLEAR ?auto_44941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44944 ?auto_44947 ?auto_44946 ?auto_44945 ?auto_44943 ?auto_44942 )
      ( MAKE-3PILE ?auto_44941 ?auto_44942 ?auto_44943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44951 - BLOCK
      ?auto_44952 - BLOCK
      ?auto_44953 - BLOCK
    )
    :vars
    (
      ?auto_44954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44954 ?auto_44953 ) ( CLEAR ?auto_44954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44951 ) ( ON ?auto_44952 ?auto_44951 ) ( ON ?auto_44953 ?auto_44952 ) ( not ( = ?auto_44951 ?auto_44952 ) ) ( not ( = ?auto_44951 ?auto_44953 ) ) ( not ( = ?auto_44951 ?auto_44954 ) ) ( not ( = ?auto_44952 ?auto_44953 ) ) ( not ( = ?auto_44952 ?auto_44954 ) ) ( not ( = ?auto_44953 ?auto_44954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44954 ?auto_44953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44955 - BLOCK
      ?auto_44956 - BLOCK
      ?auto_44957 - BLOCK
    )
    :vars
    (
      ?auto_44958 - BLOCK
      ?auto_44959 - BLOCK
      ?auto_44960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44958 ?auto_44957 ) ( CLEAR ?auto_44958 ) ( ON-TABLE ?auto_44955 ) ( ON ?auto_44956 ?auto_44955 ) ( ON ?auto_44957 ?auto_44956 ) ( not ( = ?auto_44955 ?auto_44956 ) ) ( not ( = ?auto_44955 ?auto_44957 ) ) ( not ( = ?auto_44955 ?auto_44958 ) ) ( not ( = ?auto_44956 ?auto_44957 ) ) ( not ( = ?auto_44956 ?auto_44958 ) ) ( not ( = ?auto_44957 ?auto_44958 ) ) ( HOLDING ?auto_44959 ) ( CLEAR ?auto_44960 ) ( not ( = ?auto_44955 ?auto_44959 ) ) ( not ( = ?auto_44955 ?auto_44960 ) ) ( not ( = ?auto_44956 ?auto_44959 ) ) ( not ( = ?auto_44956 ?auto_44960 ) ) ( not ( = ?auto_44957 ?auto_44959 ) ) ( not ( = ?auto_44957 ?auto_44960 ) ) ( not ( = ?auto_44958 ?auto_44959 ) ) ( not ( = ?auto_44958 ?auto_44960 ) ) ( not ( = ?auto_44959 ?auto_44960 ) ) )
    :subtasks
    ( ( !STACK ?auto_44959 ?auto_44960 )
      ( MAKE-3PILE ?auto_44955 ?auto_44956 ?auto_44957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44961 - BLOCK
      ?auto_44962 - BLOCK
      ?auto_44963 - BLOCK
    )
    :vars
    (
      ?auto_44964 - BLOCK
      ?auto_44966 - BLOCK
      ?auto_44965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44964 ?auto_44963 ) ( ON-TABLE ?auto_44961 ) ( ON ?auto_44962 ?auto_44961 ) ( ON ?auto_44963 ?auto_44962 ) ( not ( = ?auto_44961 ?auto_44962 ) ) ( not ( = ?auto_44961 ?auto_44963 ) ) ( not ( = ?auto_44961 ?auto_44964 ) ) ( not ( = ?auto_44962 ?auto_44963 ) ) ( not ( = ?auto_44962 ?auto_44964 ) ) ( not ( = ?auto_44963 ?auto_44964 ) ) ( CLEAR ?auto_44966 ) ( not ( = ?auto_44961 ?auto_44965 ) ) ( not ( = ?auto_44961 ?auto_44966 ) ) ( not ( = ?auto_44962 ?auto_44965 ) ) ( not ( = ?auto_44962 ?auto_44966 ) ) ( not ( = ?auto_44963 ?auto_44965 ) ) ( not ( = ?auto_44963 ?auto_44966 ) ) ( not ( = ?auto_44964 ?auto_44965 ) ) ( not ( = ?auto_44964 ?auto_44966 ) ) ( not ( = ?auto_44965 ?auto_44966 ) ) ( ON ?auto_44965 ?auto_44964 ) ( CLEAR ?auto_44965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44961 ?auto_44962 ?auto_44963 ?auto_44964 )
      ( MAKE-3PILE ?auto_44961 ?auto_44962 ?auto_44963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44967 - BLOCK
      ?auto_44968 - BLOCK
      ?auto_44969 - BLOCK
    )
    :vars
    (
      ?auto_44971 - BLOCK
      ?auto_44970 - BLOCK
      ?auto_44972 - BLOCK
      ?auto_44973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44971 ?auto_44969 ) ( ON-TABLE ?auto_44967 ) ( ON ?auto_44968 ?auto_44967 ) ( ON ?auto_44969 ?auto_44968 ) ( not ( = ?auto_44967 ?auto_44968 ) ) ( not ( = ?auto_44967 ?auto_44969 ) ) ( not ( = ?auto_44967 ?auto_44971 ) ) ( not ( = ?auto_44968 ?auto_44969 ) ) ( not ( = ?auto_44968 ?auto_44971 ) ) ( not ( = ?auto_44969 ?auto_44971 ) ) ( not ( = ?auto_44967 ?auto_44970 ) ) ( not ( = ?auto_44967 ?auto_44972 ) ) ( not ( = ?auto_44968 ?auto_44970 ) ) ( not ( = ?auto_44968 ?auto_44972 ) ) ( not ( = ?auto_44969 ?auto_44970 ) ) ( not ( = ?auto_44969 ?auto_44972 ) ) ( not ( = ?auto_44971 ?auto_44970 ) ) ( not ( = ?auto_44971 ?auto_44972 ) ) ( not ( = ?auto_44970 ?auto_44972 ) ) ( ON ?auto_44970 ?auto_44971 ) ( CLEAR ?auto_44970 ) ( HOLDING ?auto_44972 ) ( CLEAR ?auto_44973 ) ( ON-TABLE ?auto_44973 ) ( not ( = ?auto_44973 ?auto_44972 ) ) ( not ( = ?auto_44967 ?auto_44973 ) ) ( not ( = ?auto_44968 ?auto_44973 ) ) ( not ( = ?auto_44969 ?auto_44973 ) ) ( not ( = ?auto_44971 ?auto_44973 ) ) ( not ( = ?auto_44970 ?auto_44973 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44973 ?auto_44972 )
      ( MAKE-3PILE ?auto_44967 ?auto_44968 ?auto_44969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44974 - BLOCK
      ?auto_44975 - BLOCK
      ?auto_44976 - BLOCK
    )
    :vars
    (
      ?auto_44978 - BLOCK
      ?auto_44977 - BLOCK
      ?auto_44979 - BLOCK
      ?auto_44980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44978 ?auto_44976 ) ( ON-TABLE ?auto_44974 ) ( ON ?auto_44975 ?auto_44974 ) ( ON ?auto_44976 ?auto_44975 ) ( not ( = ?auto_44974 ?auto_44975 ) ) ( not ( = ?auto_44974 ?auto_44976 ) ) ( not ( = ?auto_44974 ?auto_44978 ) ) ( not ( = ?auto_44975 ?auto_44976 ) ) ( not ( = ?auto_44975 ?auto_44978 ) ) ( not ( = ?auto_44976 ?auto_44978 ) ) ( not ( = ?auto_44974 ?auto_44977 ) ) ( not ( = ?auto_44974 ?auto_44979 ) ) ( not ( = ?auto_44975 ?auto_44977 ) ) ( not ( = ?auto_44975 ?auto_44979 ) ) ( not ( = ?auto_44976 ?auto_44977 ) ) ( not ( = ?auto_44976 ?auto_44979 ) ) ( not ( = ?auto_44978 ?auto_44977 ) ) ( not ( = ?auto_44978 ?auto_44979 ) ) ( not ( = ?auto_44977 ?auto_44979 ) ) ( ON ?auto_44977 ?auto_44978 ) ( CLEAR ?auto_44980 ) ( ON-TABLE ?auto_44980 ) ( not ( = ?auto_44980 ?auto_44979 ) ) ( not ( = ?auto_44974 ?auto_44980 ) ) ( not ( = ?auto_44975 ?auto_44980 ) ) ( not ( = ?auto_44976 ?auto_44980 ) ) ( not ( = ?auto_44978 ?auto_44980 ) ) ( not ( = ?auto_44977 ?auto_44980 ) ) ( ON ?auto_44979 ?auto_44977 ) ( CLEAR ?auto_44979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44974 ?auto_44975 ?auto_44976 ?auto_44978 ?auto_44977 )
      ( MAKE-3PILE ?auto_44974 ?auto_44975 ?auto_44976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44981 - BLOCK
      ?auto_44982 - BLOCK
      ?auto_44983 - BLOCK
    )
    :vars
    (
      ?auto_44984 - BLOCK
      ?auto_44986 - BLOCK
      ?auto_44985 - BLOCK
      ?auto_44987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44984 ?auto_44983 ) ( ON-TABLE ?auto_44981 ) ( ON ?auto_44982 ?auto_44981 ) ( ON ?auto_44983 ?auto_44982 ) ( not ( = ?auto_44981 ?auto_44982 ) ) ( not ( = ?auto_44981 ?auto_44983 ) ) ( not ( = ?auto_44981 ?auto_44984 ) ) ( not ( = ?auto_44982 ?auto_44983 ) ) ( not ( = ?auto_44982 ?auto_44984 ) ) ( not ( = ?auto_44983 ?auto_44984 ) ) ( not ( = ?auto_44981 ?auto_44986 ) ) ( not ( = ?auto_44981 ?auto_44985 ) ) ( not ( = ?auto_44982 ?auto_44986 ) ) ( not ( = ?auto_44982 ?auto_44985 ) ) ( not ( = ?auto_44983 ?auto_44986 ) ) ( not ( = ?auto_44983 ?auto_44985 ) ) ( not ( = ?auto_44984 ?auto_44986 ) ) ( not ( = ?auto_44984 ?auto_44985 ) ) ( not ( = ?auto_44986 ?auto_44985 ) ) ( ON ?auto_44986 ?auto_44984 ) ( not ( = ?auto_44987 ?auto_44985 ) ) ( not ( = ?auto_44981 ?auto_44987 ) ) ( not ( = ?auto_44982 ?auto_44987 ) ) ( not ( = ?auto_44983 ?auto_44987 ) ) ( not ( = ?auto_44984 ?auto_44987 ) ) ( not ( = ?auto_44986 ?auto_44987 ) ) ( ON ?auto_44985 ?auto_44986 ) ( CLEAR ?auto_44985 ) ( HOLDING ?auto_44987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44987 )
      ( MAKE-3PILE ?auto_44981 ?auto_44982 ?auto_44983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44988 - BLOCK
      ?auto_44989 - BLOCK
      ?auto_44990 - BLOCK
    )
    :vars
    (
      ?auto_44991 - BLOCK
      ?auto_44992 - BLOCK
      ?auto_44994 - BLOCK
      ?auto_44993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44991 ?auto_44990 ) ( ON-TABLE ?auto_44988 ) ( ON ?auto_44989 ?auto_44988 ) ( ON ?auto_44990 ?auto_44989 ) ( not ( = ?auto_44988 ?auto_44989 ) ) ( not ( = ?auto_44988 ?auto_44990 ) ) ( not ( = ?auto_44988 ?auto_44991 ) ) ( not ( = ?auto_44989 ?auto_44990 ) ) ( not ( = ?auto_44989 ?auto_44991 ) ) ( not ( = ?auto_44990 ?auto_44991 ) ) ( not ( = ?auto_44988 ?auto_44992 ) ) ( not ( = ?auto_44988 ?auto_44994 ) ) ( not ( = ?auto_44989 ?auto_44992 ) ) ( not ( = ?auto_44989 ?auto_44994 ) ) ( not ( = ?auto_44990 ?auto_44992 ) ) ( not ( = ?auto_44990 ?auto_44994 ) ) ( not ( = ?auto_44991 ?auto_44992 ) ) ( not ( = ?auto_44991 ?auto_44994 ) ) ( not ( = ?auto_44992 ?auto_44994 ) ) ( ON ?auto_44992 ?auto_44991 ) ( not ( = ?auto_44993 ?auto_44994 ) ) ( not ( = ?auto_44988 ?auto_44993 ) ) ( not ( = ?auto_44989 ?auto_44993 ) ) ( not ( = ?auto_44990 ?auto_44993 ) ) ( not ( = ?auto_44991 ?auto_44993 ) ) ( not ( = ?auto_44992 ?auto_44993 ) ) ( ON ?auto_44994 ?auto_44992 ) ( ON ?auto_44993 ?auto_44994 ) ( CLEAR ?auto_44993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44988 ?auto_44989 ?auto_44990 ?auto_44991 ?auto_44992 ?auto_44994 )
      ( MAKE-3PILE ?auto_44988 ?auto_44989 ?auto_44990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44999 - BLOCK
      ?auto_45000 - BLOCK
      ?auto_45001 - BLOCK
      ?auto_45002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45002 ) ( CLEAR ?auto_45001 ) ( ON-TABLE ?auto_44999 ) ( ON ?auto_45000 ?auto_44999 ) ( ON ?auto_45001 ?auto_45000 ) ( not ( = ?auto_44999 ?auto_45000 ) ) ( not ( = ?auto_44999 ?auto_45001 ) ) ( not ( = ?auto_44999 ?auto_45002 ) ) ( not ( = ?auto_45000 ?auto_45001 ) ) ( not ( = ?auto_45000 ?auto_45002 ) ) ( not ( = ?auto_45001 ?auto_45002 ) ) )
    :subtasks
    ( ( !STACK ?auto_45002 ?auto_45001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45003 - BLOCK
      ?auto_45004 - BLOCK
      ?auto_45005 - BLOCK
      ?auto_45006 - BLOCK
    )
    :vars
    (
      ?auto_45007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45005 ) ( ON-TABLE ?auto_45003 ) ( ON ?auto_45004 ?auto_45003 ) ( ON ?auto_45005 ?auto_45004 ) ( not ( = ?auto_45003 ?auto_45004 ) ) ( not ( = ?auto_45003 ?auto_45005 ) ) ( not ( = ?auto_45003 ?auto_45006 ) ) ( not ( = ?auto_45004 ?auto_45005 ) ) ( not ( = ?auto_45004 ?auto_45006 ) ) ( not ( = ?auto_45005 ?auto_45006 ) ) ( ON ?auto_45006 ?auto_45007 ) ( CLEAR ?auto_45006 ) ( HAND-EMPTY ) ( not ( = ?auto_45003 ?auto_45007 ) ) ( not ( = ?auto_45004 ?auto_45007 ) ) ( not ( = ?auto_45005 ?auto_45007 ) ) ( not ( = ?auto_45006 ?auto_45007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45006 ?auto_45007 )
      ( MAKE-4PILE ?auto_45003 ?auto_45004 ?auto_45005 ?auto_45006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45008 - BLOCK
      ?auto_45009 - BLOCK
      ?auto_45010 - BLOCK
      ?auto_45011 - BLOCK
    )
    :vars
    (
      ?auto_45012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45008 ) ( ON ?auto_45009 ?auto_45008 ) ( not ( = ?auto_45008 ?auto_45009 ) ) ( not ( = ?auto_45008 ?auto_45010 ) ) ( not ( = ?auto_45008 ?auto_45011 ) ) ( not ( = ?auto_45009 ?auto_45010 ) ) ( not ( = ?auto_45009 ?auto_45011 ) ) ( not ( = ?auto_45010 ?auto_45011 ) ) ( ON ?auto_45011 ?auto_45012 ) ( CLEAR ?auto_45011 ) ( not ( = ?auto_45008 ?auto_45012 ) ) ( not ( = ?auto_45009 ?auto_45012 ) ) ( not ( = ?auto_45010 ?auto_45012 ) ) ( not ( = ?auto_45011 ?auto_45012 ) ) ( HOLDING ?auto_45010 ) ( CLEAR ?auto_45009 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45008 ?auto_45009 ?auto_45010 )
      ( MAKE-4PILE ?auto_45008 ?auto_45009 ?auto_45010 ?auto_45011 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45013 - BLOCK
      ?auto_45014 - BLOCK
      ?auto_45015 - BLOCK
      ?auto_45016 - BLOCK
    )
    :vars
    (
      ?auto_45017 - BLOCK
      ?auto_45018 - BLOCK
      ?auto_45019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45013 ) ( ON ?auto_45014 ?auto_45013 ) ( not ( = ?auto_45013 ?auto_45014 ) ) ( not ( = ?auto_45013 ?auto_45015 ) ) ( not ( = ?auto_45013 ?auto_45016 ) ) ( not ( = ?auto_45014 ?auto_45015 ) ) ( not ( = ?auto_45014 ?auto_45016 ) ) ( not ( = ?auto_45015 ?auto_45016 ) ) ( ON ?auto_45016 ?auto_45017 ) ( not ( = ?auto_45013 ?auto_45017 ) ) ( not ( = ?auto_45014 ?auto_45017 ) ) ( not ( = ?auto_45015 ?auto_45017 ) ) ( not ( = ?auto_45016 ?auto_45017 ) ) ( CLEAR ?auto_45014 ) ( ON ?auto_45015 ?auto_45016 ) ( CLEAR ?auto_45015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45018 ) ( ON ?auto_45019 ?auto_45018 ) ( ON ?auto_45017 ?auto_45019 ) ( not ( = ?auto_45018 ?auto_45019 ) ) ( not ( = ?auto_45018 ?auto_45017 ) ) ( not ( = ?auto_45018 ?auto_45016 ) ) ( not ( = ?auto_45018 ?auto_45015 ) ) ( not ( = ?auto_45019 ?auto_45017 ) ) ( not ( = ?auto_45019 ?auto_45016 ) ) ( not ( = ?auto_45019 ?auto_45015 ) ) ( not ( = ?auto_45013 ?auto_45018 ) ) ( not ( = ?auto_45013 ?auto_45019 ) ) ( not ( = ?auto_45014 ?auto_45018 ) ) ( not ( = ?auto_45014 ?auto_45019 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45018 ?auto_45019 ?auto_45017 ?auto_45016 )
      ( MAKE-4PILE ?auto_45013 ?auto_45014 ?auto_45015 ?auto_45016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45020 - BLOCK
      ?auto_45021 - BLOCK
      ?auto_45022 - BLOCK
      ?auto_45023 - BLOCK
    )
    :vars
    (
      ?auto_45025 - BLOCK
      ?auto_45026 - BLOCK
      ?auto_45024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45020 ) ( not ( = ?auto_45020 ?auto_45021 ) ) ( not ( = ?auto_45020 ?auto_45022 ) ) ( not ( = ?auto_45020 ?auto_45023 ) ) ( not ( = ?auto_45021 ?auto_45022 ) ) ( not ( = ?auto_45021 ?auto_45023 ) ) ( not ( = ?auto_45022 ?auto_45023 ) ) ( ON ?auto_45023 ?auto_45025 ) ( not ( = ?auto_45020 ?auto_45025 ) ) ( not ( = ?auto_45021 ?auto_45025 ) ) ( not ( = ?auto_45022 ?auto_45025 ) ) ( not ( = ?auto_45023 ?auto_45025 ) ) ( ON ?auto_45022 ?auto_45023 ) ( CLEAR ?auto_45022 ) ( ON-TABLE ?auto_45026 ) ( ON ?auto_45024 ?auto_45026 ) ( ON ?auto_45025 ?auto_45024 ) ( not ( = ?auto_45026 ?auto_45024 ) ) ( not ( = ?auto_45026 ?auto_45025 ) ) ( not ( = ?auto_45026 ?auto_45023 ) ) ( not ( = ?auto_45026 ?auto_45022 ) ) ( not ( = ?auto_45024 ?auto_45025 ) ) ( not ( = ?auto_45024 ?auto_45023 ) ) ( not ( = ?auto_45024 ?auto_45022 ) ) ( not ( = ?auto_45020 ?auto_45026 ) ) ( not ( = ?auto_45020 ?auto_45024 ) ) ( not ( = ?auto_45021 ?auto_45026 ) ) ( not ( = ?auto_45021 ?auto_45024 ) ) ( HOLDING ?auto_45021 ) ( CLEAR ?auto_45020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45020 ?auto_45021 )
      ( MAKE-4PILE ?auto_45020 ?auto_45021 ?auto_45022 ?auto_45023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45027 - BLOCK
      ?auto_45028 - BLOCK
      ?auto_45029 - BLOCK
      ?auto_45030 - BLOCK
    )
    :vars
    (
      ?auto_45032 - BLOCK
      ?auto_45031 - BLOCK
      ?auto_45033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45027 ) ( not ( = ?auto_45027 ?auto_45028 ) ) ( not ( = ?auto_45027 ?auto_45029 ) ) ( not ( = ?auto_45027 ?auto_45030 ) ) ( not ( = ?auto_45028 ?auto_45029 ) ) ( not ( = ?auto_45028 ?auto_45030 ) ) ( not ( = ?auto_45029 ?auto_45030 ) ) ( ON ?auto_45030 ?auto_45032 ) ( not ( = ?auto_45027 ?auto_45032 ) ) ( not ( = ?auto_45028 ?auto_45032 ) ) ( not ( = ?auto_45029 ?auto_45032 ) ) ( not ( = ?auto_45030 ?auto_45032 ) ) ( ON ?auto_45029 ?auto_45030 ) ( ON-TABLE ?auto_45031 ) ( ON ?auto_45033 ?auto_45031 ) ( ON ?auto_45032 ?auto_45033 ) ( not ( = ?auto_45031 ?auto_45033 ) ) ( not ( = ?auto_45031 ?auto_45032 ) ) ( not ( = ?auto_45031 ?auto_45030 ) ) ( not ( = ?auto_45031 ?auto_45029 ) ) ( not ( = ?auto_45033 ?auto_45032 ) ) ( not ( = ?auto_45033 ?auto_45030 ) ) ( not ( = ?auto_45033 ?auto_45029 ) ) ( not ( = ?auto_45027 ?auto_45031 ) ) ( not ( = ?auto_45027 ?auto_45033 ) ) ( not ( = ?auto_45028 ?auto_45031 ) ) ( not ( = ?auto_45028 ?auto_45033 ) ) ( CLEAR ?auto_45027 ) ( ON ?auto_45028 ?auto_45029 ) ( CLEAR ?auto_45028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45031 ?auto_45033 ?auto_45032 ?auto_45030 ?auto_45029 )
      ( MAKE-4PILE ?auto_45027 ?auto_45028 ?auto_45029 ?auto_45030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45034 - BLOCK
      ?auto_45035 - BLOCK
      ?auto_45036 - BLOCK
      ?auto_45037 - BLOCK
    )
    :vars
    (
      ?auto_45040 - BLOCK
      ?auto_45039 - BLOCK
      ?auto_45038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45034 ?auto_45035 ) ) ( not ( = ?auto_45034 ?auto_45036 ) ) ( not ( = ?auto_45034 ?auto_45037 ) ) ( not ( = ?auto_45035 ?auto_45036 ) ) ( not ( = ?auto_45035 ?auto_45037 ) ) ( not ( = ?auto_45036 ?auto_45037 ) ) ( ON ?auto_45037 ?auto_45040 ) ( not ( = ?auto_45034 ?auto_45040 ) ) ( not ( = ?auto_45035 ?auto_45040 ) ) ( not ( = ?auto_45036 ?auto_45040 ) ) ( not ( = ?auto_45037 ?auto_45040 ) ) ( ON ?auto_45036 ?auto_45037 ) ( ON-TABLE ?auto_45039 ) ( ON ?auto_45038 ?auto_45039 ) ( ON ?auto_45040 ?auto_45038 ) ( not ( = ?auto_45039 ?auto_45038 ) ) ( not ( = ?auto_45039 ?auto_45040 ) ) ( not ( = ?auto_45039 ?auto_45037 ) ) ( not ( = ?auto_45039 ?auto_45036 ) ) ( not ( = ?auto_45038 ?auto_45040 ) ) ( not ( = ?auto_45038 ?auto_45037 ) ) ( not ( = ?auto_45038 ?auto_45036 ) ) ( not ( = ?auto_45034 ?auto_45039 ) ) ( not ( = ?auto_45034 ?auto_45038 ) ) ( not ( = ?auto_45035 ?auto_45039 ) ) ( not ( = ?auto_45035 ?auto_45038 ) ) ( ON ?auto_45035 ?auto_45036 ) ( CLEAR ?auto_45035 ) ( HOLDING ?auto_45034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45034 )
      ( MAKE-4PILE ?auto_45034 ?auto_45035 ?auto_45036 ?auto_45037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45041 - BLOCK
      ?auto_45042 - BLOCK
      ?auto_45043 - BLOCK
      ?auto_45044 - BLOCK
    )
    :vars
    (
      ?auto_45047 - BLOCK
      ?auto_45046 - BLOCK
      ?auto_45045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45041 ?auto_45042 ) ) ( not ( = ?auto_45041 ?auto_45043 ) ) ( not ( = ?auto_45041 ?auto_45044 ) ) ( not ( = ?auto_45042 ?auto_45043 ) ) ( not ( = ?auto_45042 ?auto_45044 ) ) ( not ( = ?auto_45043 ?auto_45044 ) ) ( ON ?auto_45044 ?auto_45047 ) ( not ( = ?auto_45041 ?auto_45047 ) ) ( not ( = ?auto_45042 ?auto_45047 ) ) ( not ( = ?auto_45043 ?auto_45047 ) ) ( not ( = ?auto_45044 ?auto_45047 ) ) ( ON ?auto_45043 ?auto_45044 ) ( ON-TABLE ?auto_45046 ) ( ON ?auto_45045 ?auto_45046 ) ( ON ?auto_45047 ?auto_45045 ) ( not ( = ?auto_45046 ?auto_45045 ) ) ( not ( = ?auto_45046 ?auto_45047 ) ) ( not ( = ?auto_45046 ?auto_45044 ) ) ( not ( = ?auto_45046 ?auto_45043 ) ) ( not ( = ?auto_45045 ?auto_45047 ) ) ( not ( = ?auto_45045 ?auto_45044 ) ) ( not ( = ?auto_45045 ?auto_45043 ) ) ( not ( = ?auto_45041 ?auto_45046 ) ) ( not ( = ?auto_45041 ?auto_45045 ) ) ( not ( = ?auto_45042 ?auto_45046 ) ) ( not ( = ?auto_45042 ?auto_45045 ) ) ( ON ?auto_45042 ?auto_45043 ) ( ON ?auto_45041 ?auto_45042 ) ( CLEAR ?auto_45041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45046 ?auto_45045 ?auto_45047 ?auto_45044 ?auto_45043 ?auto_45042 )
      ( MAKE-4PILE ?auto_45041 ?auto_45042 ?auto_45043 ?auto_45044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45050 - BLOCK
      ?auto_45051 - BLOCK
    )
    :vars
    (
      ?auto_45052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45052 ?auto_45051 ) ( CLEAR ?auto_45052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45050 ) ( ON ?auto_45051 ?auto_45050 ) ( not ( = ?auto_45050 ?auto_45051 ) ) ( not ( = ?auto_45050 ?auto_45052 ) ) ( not ( = ?auto_45051 ?auto_45052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45052 ?auto_45051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45053 - BLOCK
      ?auto_45054 - BLOCK
    )
    :vars
    (
      ?auto_45055 - BLOCK
      ?auto_45056 - BLOCK
      ?auto_45057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45055 ?auto_45054 ) ( CLEAR ?auto_45055 ) ( ON-TABLE ?auto_45053 ) ( ON ?auto_45054 ?auto_45053 ) ( not ( = ?auto_45053 ?auto_45054 ) ) ( not ( = ?auto_45053 ?auto_45055 ) ) ( not ( = ?auto_45054 ?auto_45055 ) ) ( HOLDING ?auto_45056 ) ( CLEAR ?auto_45057 ) ( not ( = ?auto_45053 ?auto_45056 ) ) ( not ( = ?auto_45053 ?auto_45057 ) ) ( not ( = ?auto_45054 ?auto_45056 ) ) ( not ( = ?auto_45054 ?auto_45057 ) ) ( not ( = ?auto_45055 ?auto_45056 ) ) ( not ( = ?auto_45055 ?auto_45057 ) ) ( not ( = ?auto_45056 ?auto_45057 ) ) )
    :subtasks
    ( ( !STACK ?auto_45056 ?auto_45057 )
      ( MAKE-2PILE ?auto_45053 ?auto_45054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45058 - BLOCK
      ?auto_45059 - BLOCK
    )
    :vars
    (
      ?auto_45060 - BLOCK
      ?auto_45061 - BLOCK
      ?auto_45062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45060 ?auto_45059 ) ( ON-TABLE ?auto_45058 ) ( ON ?auto_45059 ?auto_45058 ) ( not ( = ?auto_45058 ?auto_45059 ) ) ( not ( = ?auto_45058 ?auto_45060 ) ) ( not ( = ?auto_45059 ?auto_45060 ) ) ( CLEAR ?auto_45061 ) ( not ( = ?auto_45058 ?auto_45062 ) ) ( not ( = ?auto_45058 ?auto_45061 ) ) ( not ( = ?auto_45059 ?auto_45062 ) ) ( not ( = ?auto_45059 ?auto_45061 ) ) ( not ( = ?auto_45060 ?auto_45062 ) ) ( not ( = ?auto_45060 ?auto_45061 ) ) ( not ( = ?auto_45062 ?auto_45061 ) ) ( ON ?auto_45062 ?auto_45060 ) ( CLEAR ?auto_45062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45058 ?auto_45059 ?auto_45060 )
      ( MAKE-2PILE ?auto_45058 ?auto_45059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45063 - BLOCK
      ?auto_45064 - BLOCK
    )
    :vars
    (
      ?auto_45065 - BLOCK
      ?auto_45067 - BLOCK
      ?auto_45066 - BLOCK
      ?auto_45068 - BLOCK
      ?auto_45069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45065 ?auto_45064 ) ( ON-TABLE ?auto_45063 ) ( ON ?auto_45064 ?auto_45063 ) ( not ( = ?auto_45063 ?auto_45064 ) ) ( not ( = ?auto_45063 ?auto_45065 ) ) ( not ( = ?auto_45064 ?auto_45065 ) ) ( not ( = ?auto_45063 ?auto_45067 ) ) ( not ( = ?auto_45063 ?auto_45066 ) ) ( not ( = ?auto_45064 ?auto_45067 ) ) ( not ( = ?auto_45064 ?auto_45066 ) ) ( not ( = ?auto_45065 ?auto_45067 ) ) ( not ( = ?auto_45065 ?auto_45066 ) ) ( not ( = ?auto_45067 ?auto_45066 ) ) ( ON ?auto_45067 ?auto_45065 ) ( CLEAR ?auto_45067 ) ( HOLDING ?auto_45066 ) ( CLEAR ?auto_45068 ) ( ON-TABLE ?auto_45069 ) ( ON ?auto_45068 ?auto_45069 ) ( not ( = ?auto_45069 ?auto_45068 ) ) ( not ( = ?auto_45069 ?auto_45066 ) ) ( not ( = ?auto_45068 ?auto_45066 ) ) ( not ( = ?auto_45063 ?auto_45068 ) ) ( not ( = ?auto_45063 ?auto_45069 ) ) ( not ( = ?auto_45064 ?auto_45068 ) ) ( not ( = ?auto_45064 ?auto_45069 ) ) ( not ( = ?auto_45065 ?auto_45068 ) ) ( not ( = ?auto_45065 ?auto_45069 ) ) ( not ( = ?auto_45067 ?auto_45068 ) ) ( not ( = ?auto_45067 ?auto_45069 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45069 ?auto_45068 ?auto_45066 )
      ( MAKE-2PILE ?auto_45063 ?auto_45064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45070 - BLOCK
      ?auto_45071 - BLOCK
    )
    :vars
    (
      ?auto_45074 - BLOCK
      ?auto_45073 - BLOCK
      ?auto_45072 - BLOCK
      ?auto_45075 - BLOCK
      ?auto_45076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45074 ?auto_45071 ) ( ON-TABLE ?auto_45070 ) ( ON ?auto_45071 ?auto_45070 ) ( not ( = ?auto_45070 ?auto_45071 ) ) ( not ( = ?auto_45070 ?auto_45074 ) ) ( not ( = ?auto_45071 ?auto_45074 ) ) ( not ( = ?auto_45070 ?auto_45073 ) ) ( not ( = ?auto_45070 ?auto_45072 ) ) ( not ( = ?auto_45071 ?auto_45073 ) ) ( not ( = ?auto_45071 ?auto_45072 ) ) ( not ( = ?auto_45074 ?auto_45073 ) ) ( not ( = ?auto_45074 ?auto_45072 ) ) ( not ( = ?auto_45073 ?auto_45072 ) ) ( ON ?auto_45073 ?auto_45074 ) ( CLEAR ?auto_45075 ) ( ON-TABLE ?auto_45076 ) ( ON ?auto_45075 ?auto_45076 ) ( not ( = ?auto_45076 ?auto_45075 ) ) ( not ( = ?auto_45076 ?auto_45072 ) ) ( not ( = ?auto_45075 ?auto_45072 ) ) ( not ( = ?auto_45070 ?auto_45075 ) ) ( not ( = ?auto_45070 ?auto_45076 ) ) ( not ( = ?auto_45071 ?auto_45075 ) ) ( not ( = ?auto_45071 ?auto_45076 ) ) ( not ( = ?auto_45074 ?auto_45075 ) ) ( not ( = ?auto_45074 ?auto_45076 ) ) ( not ( = ?auto_45073 ?auto_45075 ) ) ( not ( = ?auto_45073 ?auto_45076 ) ) ( ON ?auto_45072 ?auto_45073 ) ( CLEAR ?auto_45072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45070 ?auto_45071 ?auto_45074 ?auto_45073 )
      ( MAKE-2PILE ?auto_45070 ?auto_45071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45077 - BLOCK
      ?auto_45078 - BLOCK
    )
    :vars
    (
      ?auto_45080 - BLOCK
      ?auto_45079 - BLOCK
      ?auto_45083 - BLOCK
      ?auto_45081 - BLOCK
      ?auto_45082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45080 ?auto_45078 ) ( ON-TABLE ?auto_45077 ) ( ON ?auto_45078 ?auto_45077 ) ( not ( = ?auto_45077 ?auto_45078 ) ) ( not ( = ?auto_45077 ?auto_45080 ) ) ( not ( = ?auto_45078 ?auto_45080 ) ) ( not ( = ?auto_45077 ?auto_45079 ) ) ( not ( = ?auto_45077 ?auto_45083 ) ) ( not ( = ?auto_45078 ?auto_45079 ) ) ( not ( = ?auto_45078 ?auto_45083 ) ) ( not ( = ?auto_45080 ?auto_45079 ) ) ( not ( = ?auto_45080 ?auto_45083 ) ) ( not ( = ?auto_45079 ?auto_45083 ) ) ( ON ?auto_45079 ?auto_45080 ) ( ON-TABLE ?auto_45081 ) ( not ( = ?auto_45081 ?auto_45082 ) ) ( not ( = ?auto_45081 ?auto_45083 ) ) ( not ( = ?auto_45082 ?auto_45083 ) ) ( not ( = ?auto_45077 ?auto_45082 ) ) ( not ( = ?auto_45077 ?auto_45081 ) ) ( not ( = ?auto_45078 ?auto_45082 ) ) ( not ( = ?auto_45078 ?auto_45081 ) ) ( not ( = ?auto_45080 ?auto_45082 ) ) ( not ( = ?auto_45080 ?auto_45081 ) ) ( not ( = ?auto_45079 ?auto_45082 ) ) ( not ( = ?auto_45079 ?auto_45081 ) ) ( ON ?auto_45083 ?auto_45079 ) ( CLEAR ?auto_45083 ) ( HOLDING ?auto_45082 ) ( CLEAR ?auto_45081 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45081 ?auto_45082 )
      ( MAKE-2PILE ?auto_45077 ?auto_45078 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45084 - BLOCK
      ?auto_45085 - BLOCK
    )
    :vars
    (
      ?auto_45088 - BLOCK
      ?auto_45087 - BLOCK
      ?auto_45089 - BLOCK
      ?auto_45090 - BLOCK
      ?auto_45086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45088 ?auto_45085 ) ( ON-TABLE ?auto_45084 ) ( ON ?auto_45085 ?auto_45084 ) ( not ( = ?auto_45084 ?auto_45085 ) ) ( not ( = ?auto_45084 ?auto_45088 ) ) ( not ( = ?auto_45085 ?auto_45088 ) ) ( not ( = ?auto_45084 ?auto_45087 ) ) ( not ( = ?auto_45084 ?auto_45089 ) ) ( not ( = ?auto_45085 ?auto_45087 ) ) ( not ( = ?auto_45085 ?auto_45089 ) ) ( not ( = ?auto_45088 ?auto_45087 ) ) ( not ( = ?auto_45088 ?auto_45089 ) ) ( not ( = ?auto_45087 ?auto_45089 ) ) ( ON ?auto_45087 ?auto_45088 ) ( ON-TABLE ?auto_45090 ) ( not ( = ?auto_45090 ?auto_45086 ) ) ( not ( = ?auto_45090 ?auto_45089 ) ) ( not ( = ?auto_45086 ?auto_45089 ) ) ( not ( = ?auto_45084 ?auto_45086 ) ) ( not ( = ?auto_45084 ?auto_45090 ) ) ( not ( = ?auto_45085 ?auto_45086 ) ) ( not ( = ?auto_45085 ?auto_45090 ) ) ( not ( = ?auto_45088 ?auto_45086 ) ) ( not ( = ?auto_45088 ?auto_45090 ) ) ( not ( = ?auto_45087 ?auto_45086 ) ) ( not ( = ?auto_45087 ?auto_45090 ) ) ( ON ?auto_45089 ?auto_45087 ) ( CLEAR ?auto_45090 ) ( ON ?auto_45086 ?auto_45089 ) ( CLEAR ?auto_45086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45084 ?auto_45085 ?auto_45088 ?auto_45087 ?auto_45089 )
      ( MAKE-2PILE ?auto_45084 ?auto_45085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45091 - BLOCK
      ?auto_45092 - BLOCK
    )
    :vars
    (
      ?auto_45094 - BLOCK
      ?auto_45093 - BLOCK
      ?auto_45096 - BLOCK
      ?auto_45097 - BLOCK
      ?auto_45095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45094 ?auto_45092 ) ( ON-TABLE ?auto_45091 ) ( ON ?auto_45092 ?auto_45091 ) ( not ( = ?auto_45091 ?auto_45092 ) ) ( not ( = ?auto_45091 ?auto_45094 ) ) ( not ( = ?auto_45092 ?auto_45094 ) ) ( not ( = ?auto_45091 ?auto_45093 ) ) ( not ( = ?auto_45091 ?auto_45096 ) ) ( not ( = ?auto_45092 ?auto_45093 ) ) ( not ( = ?auto_45092 ?auto_45096 ) ) ( not ( = ?auto_45094 ?auto_45093 ) ) ( not ( = ?auto_45094 ?auto_45096 ) ) ( not ( = ?auto_45093 ?auto_45096 ) ) ( ON ?auto_45093 ?auto_45094 ) ( not ( = ?auto_45097 ?auto_45095 ) ) ( not ( = ?auto_45097 ?auto_45096 ) ) ( not ( = ?auto_45095 ?auto_45096 ) ) ( not ( = ?auto_45091 ?auto_45095 ) ) ( not ( = ?auto_45091 ?auto_45097 ) ) ( not ( = ?auto_45092 ?auto_45095 ) ) ( not ( = ?auto_45092 ?auto_45097 ) ) ( not ( = ?auto_45094 ?auto_45095 ) ) ( not ( = ?auto_45094 ?auto_45097 ) ) ( not ( = ?auto_45093 ?auto_45095 ) ) ( not ( = ?auto_45093 ?auto_45097 ) ) ( ON ?auto_45096 ?auto_45093 ) ( ON ?auto_45095 ?auto_45096 ) ( CLEAR ?auto_45095 ) ( HOLDING ?auto_45097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45097 )
      ( MAKE-2PILE ?auto_45091 ?auto_45092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45098 - BLOCK
      ?auto_45099 - BLOCK
    )
    :vars
    (
      ?auto_45100 - BLOCK
      ?auto_45101 - BLOCK
      ?auto_45104 - BLOCK
      ?auto_45102 - BLOCK
      ?auto_45103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45100 ?auto_45099 ) ( ON-TABLE ?auto_45098 ) ( ON ?auto_45099 ?auto_45098 ) ( not ( = ?auto_45098 ?auto_45099 ) ) ( not ( = ?auto_45098 ?auto_45100 ) ) ( not ( = ?auto_45099 ?auto_45100 ) ) ( not ( = ?auto_45098 ?auto_45101 ) ) ( not ( = ?auto_45098 ?auto_45104 ) ) ( not ( = ?auto_45099 ?auto_45101 ) ) ( not ( = ?auto_45099 ?auto_45104 ) ) ( not ( = ?auto_45100 ?auto_45101 ) ) ( not ( = ?auto_45100 ?auto_45104 ) ) ( not ( = ?auto_45101 ?auto_45104 ) ) ( ON ?auto_45101 ?auto_45100 ) ( not ( = ?auto_45102 ?auto_45103 ) ) ( not ( = ?auto_45102 ?auto_45104 ) ) ( not ( = ?auto_45103 ?auto_45104 ) ) ( not ( = ?auto_45098 ?auto_45103 ) ) ( not ( = ?auto_45098 ?auto_45102 ) ) ( not ( = ?auto_45099 ?auto_45103 ) ) ( not ( = ?auto_45099 ?auto_45102 ) ) ( not ( = ?auto_45100 ?auto_45103 ) ) ( not ( = ?auto_45100 ?auto_45102 ) ) ( not ( = ?auto_45101 ?auto_45103 ) ) ( not ( = ?auto_45101 ?auto_45102 ) ) ( ON ?auto_45104 ?auto_45101 ) ( ON ?auto_45103 ?auto_45104 ) ( ON ?auto_45102 ?auto_45103 ) ( CLEAR ?auto_45102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45098 ?auto_45099 ?auto_45100 ?auto_45101 ?auto_45104 ?auto_45103 )
      ( MAKE-2PILE ?auto_45098 ?auto_45099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45110 - BLOCK
      ?auto_45111 - BLOCK
      ?auto_45112 - BLOCK
      ?auto_45113 - BLOCK
      ?auto_45114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45114 ) ( CLEAR ?auto_45113 ) ( ON-TABLE ?auto_45110 ) ( ON ?auto_45111 ?auto_45110 ) ( ON ?auto_45112 ?auto_45111 ) ( ON ?auto_45113 ?auto_45112 ) ( not ( = ?auto_45110 ?auto_45111 ) ) ( not ( = ?auto_45110 ?auto_45112 ) ) ( not ( = ?auto_45110 ?auto_45113 ) ) ( not ( = ?auto_45110 ?auto_45114 ) ) ( not ( = ?auto_45111 ?auto_45112 ) ) ( not ( = ?auto_45111 ?auto_45113 ) ) ( not ( = ?auto_45111 ?auto_45114 ) ) ( not ( = ?auto_45112 ?auto_45113 ) ) ( not ( = ?auto_45112 ?auto_45114 ) ) ( not ( = ?auto_45113 ?auto_45114 ) ) )
    :subtasks
    ( ( !STACK ?auto_45114 ?auto_45113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45115 - BLOCK
      ?auto_45116 - BLOCK
      ?auto_45117 - BLOCK
      ?auto_45118 - BLOCK
      ?auto_45119 - BLOCK
    )
    :vars
    (
      ?auto_45120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45118 ) ( ON-TABLE ?auto_45115 ) ( ON ?auto_45116 ?auto_45115 ) ( ON ?auto_45117 ?auto_45116 ) ( ON ?auto_45118 ?auto_45117 ) ( not ( = ?auto_45115 ?auto_45116 ) ) ( not ( = ?auto_45115 ?auto_45117 ) ) ( not ( = ?auto_45115 ?auto_45118 ) ) ( not ( = ?auto_45115 ?auto_45119 ) ) ( not ( = ?auto_45116 ?auto_45117 ) ) ( not ( = ?auto_45116 ?auto_45118 ) ) ( not ( = ?auto_45116 ?auto_45119 ) ) ( not ( = ?auto_45117 ?auto_45118 ) ) ( not ( = ?auto_45117 ?auto_45119 ) ) ( not ( = ?auto_45118 ?auto_45119 ) ) ( ON ?auto_45119 ?auto_45120 ) ( CLEAR ?auto_45119 ) ( HAND-EMPTY ) ( not ( = ?auto_45115 ?auto_45120 ) ) ( not ( = ?auto_45116 ?auto_45120 ) ) ( not ( = ?auto_45117 ?auto_45120 ) ) ( not ( = ?auto_45118 ?auto_45120 ) ) ( not ( = ?auto_45119 ?auto_45120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45119 ?auto_45120 )
      ( MAKE-5PILE ?auto_45115 ?auto_45116 ?auto_45117 ?auto_45118 ?auto_45119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45121 - BLOCK
      ?auto_45122 - BLOCK
      ?auto_45123 - BLOCK
      ?auto_45124 - BLOCK
      ?auto_45125 - BLOCK
    )
    :vars
    (
      ?auto_45126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45121 ) ( ON ?auto_45122 ?auto_45121 ) ( ON ?auto_45123 ?auto_45122 ) ( not ( = ?auto_45121 ?auto_45122 ) ) ( not ( = ?auto_45121 ?auto_45123 ) ) ( not ( = ?auto_45121 ?auto_45124 ) ) ( not ( = ?auto_45121 ?auto_45125 ) ) ( not ( = ?auto_45122 ?auto_45123 ) ) ( not ( = ?auto_45122 ?auto_45124 ) ) ( not ( = ?auto_45122 ?auto_45125 ) ) ( not ( = ?auto_45123 ?auto_45124 ) ) ( not ( = ?auto_45123 ?auto_45125 ) ) ( not ( = ?auto_45124 ?auto_45125 ) ) ( ON ?auto_45125 ?auto_45126 ) ( CLEAR ?auto_45125 ) ( not ( = ?auto_45121 ?auto_45126 ) ) ( not ( = ?auto_45122 ?auto_45126 ) ) ( not ( = ?auto_45123 ?auto_45126 ) ) ( not ( = ?auto_45124 ?auto_45126 ) ) ( not ( = ?auto_45125 ?auto_45126 ) ) ( HOLDING ?auto_45124 ) ( CLEAR ?auto_45123 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45121 ?auto_45122 ?auto_45123 ?auto_45124 )
      ( MAKE-5PILE ?auto_45121 ?auto_45122 ?auto_45123 ?auto_45124 ?auto_45125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45127 - BLOCK
      ?auto_45128 - BLOCK
      ?auto_45129 - BLOCK
      ?auto_45130 - BLOCK
      ?auto_45131 - BLOCK
    )
    :vars
    (
      ?auto_45132 - BLOCK
      ?auto_45133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45127 ) ( ON ?auto_45128 ?auto_45127 ) ( ON ?auto_45129 ?auto_45128 ) ( not ( = ?auto_45127 ?auto_45128 ) ) ( not ( = ?auto_45127 ?auto_45129 ) ) ( not ( = ?auto_45127 ?auto_45130 ) ) ( not ( = ?auto_45127 ?auto_45131 ) ) ( not ( = ?auto_45128 ?auto_45129 ) ) ( not ( = ?auto_45128 ?auto_45130 ) ) ( not ( = ?auto_45128 ?auto_45131 ) ) ( not ( = ?auto_45129 ?auto_45130 ) ) ( not ( = ?auto_45129 ?auto_45131 ) ) ( not ( = ?auto_45130 ?auto_45131 ) ) ( ON ?auto_45131 ?auto_45132 ) ( not ( = ?auto_45127 ?auto_45132 ) ) ( not ( = ?auto_45128 ?auto_45132 ) ) ( not ( = ?auto_45129 ?auto_45132 ) ) ( not ( = ?auto_45130 ?auto_45132 ) ) ( not ( = ?auto_45131 ?auto_45132 ) ) ( CLEAR ?auto_45129 ) ( ON ?auto_45130 ?auto_45131 ) ( CLEAR ?auto_45130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45133 ) ( ON ?auto_45132 ?auto_45133 ) ( not ( = ?auto_45133 ?auto_45132 ) ) ( not ( = ?auto_45133 ?auto_45131 ) ) ( not ( = ?auto_45133 ?auto_45130 ) ) ( not ( = ?auto_45127 ?auto_45133 ) ) ( not ( = ?auto_45128 ?auto_45133 ) ) ( not ( = ?auto_45129 ?auto_45133 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45133 ?auto_45132 ?auto_45131 )
      ( MAKE-5PILE ?auto_45127 ?auto_45128 ?auto_45129 ?auto_45130 ?auto_45131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45134 - BLOCK
      ?auto_45135 - BLOCK
      ?auto_45136 - BLOCK
      ?auto_45137 - BLOCK
      ?auto_45138 - BLOCK
    )
    :vars
    (
      ?auto_45140 - BLOCK
      ?auto_45139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45134 ) ( ON ?auto_45135 ?auto_45134 ) ( not ( = ?auto_45134 ?auto_45135 ) ) ( not ( = ?auto_45134 ?auto_45136 ) ) ( not ( = ?auto_45134 ?auto_45137 ) ) ( not ( = ?auto_45134 ?auto_45138 ) ) ( not ( = ?auto_45135 ?auto_45136 ) ) ( not ( = ?auto_45135 ?auto_45137 ) ) ( not ( = ?auto_45135 ?auto_45138 ) ) ( not ( = ?auto_45136 ?auto_45137 ) ) ( not ( = ?auto_45136 ?auto_45138 ) ) ( not ( = ?auto_45137 ?auto_45138 ) ) ( ON ?auto_45138 ?auto_45140 ) ( not ( = ?auto_45134 ?auto_45140 ) ) ( not ( = ?auto_45135 ?auto_45140 ) ) ( not ( = ?auto_45136 ?auto_45140 ) ) ( not ( = ?auto_45137 ?auto_45140 ) ) ( not ( = ?auto_45138 ?auto_45140 ) ) ( ON ?auto_45137 ?auto_45138 ) ( CLEAR ?auto_45137 ) ( ON-TABLE ?auto_45139 ) ( ON ?auto_45140 ?auto_45139 ) ( not ( = ?auto_45139 ?auto_45140 ) ) ( not ( = ?auto_45139 ?auto_45138 ) ) ( not ( = ?auto_45139 ?auto_45137 ) ) ( not ( = ?auto_45134 ?auto_45139 ) ) ( not ( = ?auto_45135 ?auto_45139 ) ) ( not ( = ?auto_45136 ?auto_45139 ) ) ( HOLDING ?auto_45136 ) ( CLEAR ?auto_45135 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45134 ?auto_45135 ?auto_45136 )
      ( MAKE-5PILE ?auto_45134 ?auto_45135 ?auto_45136 ?auto_45137 ?auto_45138 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45141 - BLOCK
      ?auto_45142 - BLOCK
      ?auto_45143 - BLOCK
      ?auto_45144 - BLOCK
      ?auto_45145 - BLOCK
    )
    :vars
    (
      ?auto_45146 - BLOCK
      ?auto_45147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45141 ) ( ON ?auto_45142 ?auto_45141 ) ( not ( = ?auto_45141 ?auto_45142 ) ) ( not ( = ?auto_45141 ?auto_45143 ) ) ( not ( = ?auto_45141 ?auto_45144 ) ) ( not ( = ?auto_45141 ?auto_45145 ) ) ( not ( = ?auto_45142 ?auto_45143 ) ) ( not ( = ?auto_45142 ?auto_45144 ) ) ( not ( = ?auto_45142 ?auto_45145 ) ) ( not ( = ?auto_45143 ?auto_45144 ) ) ( not ( = ?auto_45143 ?auto_45145 ) ) ( not ( = ?auto_45144 ?auto_45145 ) ) ( ON ?auto_45145 ?auto_45146 ) ( not ( = ?auto_45141 ?auto_45146 ) ) ( not ( = ?auto_45142 ?auto_45146 ) ) ( not ( = ?auto_45143 ?auto_45146 ) ) ( not ( = ?auto_45144 ?auto_45146 ) ) ( not ( = ?auto_45145 ?auto_45146 ) ) ( ON ?auto_45144 ?auto_45145 ) ( ON-TABLE ?auto_45147 ) ( ON ?auto_45146 ?auto_45147 ) ( not ( = ?auto_45147 ?auto_45146 ) ) ( not ( = ?auto_45147 ?auto_45145 ) ) ( not ( = ?auto_45147 ?auto_45144 ) ) ( not ( = ?auto_45141 ?auto_45147 ) ) ( not ( = ?auto_45142 ?auto_45147 ) ) ( not ( = ?auto_45143 ?auto_45147 ) ) ( CLEAR ?auto_45142 ) ( ON ?auto_45143 ?auto_45144 ) ( CLEAR ?auto_45143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45147 ?auto_45146 ?auto_45145 ?auto_45144 )
      ( MAKE-5PILE ?auto_45141 ?auto_45142 ?auto_45143 ?auto_45144 ?auto_45145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45148 - BLOCK
      ?auto_45149 - BLOCK
      ?auto_45150 - BLOCK
      ?auto_45151 - BLOCK
      ?auto_45152 - BLOCK
    )
    :vars
    (
      ?auto_45154 - BLOCK
      ?auto_45153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45148 ) ( not ( = ?auto_45148 ?auto_45149 ) ) ( not ( = ?auto_45148 ?auto_45150 ) ) ( not ( = ?auto_45148 ?auto_45151 ) ) ( not ( = ?auto_45148 ?auto_45152 ) ) ( not ( = ?auto_45149 ?auto_45150 ) ) ( not ( = ?auto_45149 ?auto_45151 ) ) ( not ( = ?auto_45149 ?auto_45152 ) ) ( not ( = ?auto_45150 ?auto_45151 ) ) ( not ( = ?auto_45150 ?auto_45152 ) ) ( not ( = ?auto_45151 ?auto_45152 ) ) ( ON ?auto_45152 ?auto_45154 ) ( not ( = ?auto_45148 ?auto_45154 ) ) ( not ( = ?auto_45149 ?auto_45154 ) ) ( not ( = ?auto_45150 ?auto_45154 ) ) ( not ( = ?auto_45151 ?auto_45154 ) ) ( not ( = ?auto_45152 ?auto_45154 ) ) ( ON ?auto_45151 ?auto_45152 ) ( ON-TABLE ?auto_45153 ) ( ON ?auto_45154 ?auto_45153 ) ( not ( = ?auto_45153 ?auto_45154 ) ) ( not ( = ?auto_45153 ?auto_45152 ) ) ( not ( = ?auto_45153 ?auto_45151 ) ) ( not ( = ?auto_45148 ?auto_45153 ) ) ( not ( = ?auto_45149 ?auto_45153 ) ) ( not ( = ?auto_45150 ?auto_45153 ) ) ( ON ?auto_45150 ?auto_45151 ) ( CLEAR ?auto_45150 ) ( HOLDING ?auto_45149 ) ( CLEAR ?auto_45148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45148 ?auto_45149 )
      ( MAKE-5PILE ?auto_45148 ?auto_45149 ?auto_45150 ?auto_45151 ?auto_45152 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45155 - BLOCK
      ?auto_45156 - BLOCK
      ?auto_45157 - BLOCK
      ?auto_45158 - BLOCK
      ?auto_45159 - BLOCK
    )
    :vars
    (
      ?auto_45161 - BLOCK
      ?auto_45160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45155 ) ( not ( = ?auto_45155 ?auto_45156 ) ) ( not ( = ?auto_45155 ?auto_45157 ) ) ( not ( = ?auto_45155 ?auto_45158 ) ) ( not ( = ?auto_45155 ?auto_45159 ) ) ( not ( = ?auto_45156 ?auto_45157 ) ) ( not ( = ?auto_45156 ?auto_45158 ) ) ( not ( = ?auto_45156 ?auto_45159 ) ) ( not ( = ?auto_45157 ?auto_45158 ) ) ( not ( = ?auto_45157 ?auto_45159 ) ) ( not ( = ?auto_45158 ?auto_45159 ) ) ( ON ?auto_45159 ?auto_45161 ) ( not ( = ?auto_45155 ?auto_45161 ) ) ( not ( = ?auto_45156 ?auto_45161 ) ) ( not ( = ?auto_45157 ?auto_45161 ) ) ( not ( = ?auto_45158 ?auto_45161 ) ) ( not ( = ?auto_45159 ?auto_45161 ) ) ( ON ?auto_45158 ?auto_45159 ) ( ON-TABLE ?auto_45160 ) ( ON ?auto_45161 ?auto_45160 ) ( not ( = ?auto_45160 ?auto_45161 ) ) ( not ( = ?auto_45160 ?auto_45159 ) ) ( not ( = ?auto_45160 ?auto_45158 ) ) ( not ( = ?auto_45155 ?auto_45160 ) ) ( not ( = ?auto_45156 ?auto_45160 ) ) ( not ( = ?auto_45157 ?auto_45160 ) ) ( ON ?auto_45157 ?auto_45158 ) ( CLEAR ?auto_45155 ) ( ON ?auto_45156 ?auto_45157 ) ( CLEAR ?auto_45156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45160 ?auto_45161 ?auto_45159 ?auto_45158 ?auto_45157 )
      ( MAKE-5PILE ?auto_45155 ?auto_45156 ?auto_45157 ?auto_45158 ?auto_45159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45162 - BLOCK
      ?auto_45163 - BLOCK
      ?auto_45164 - BLOCK
      ?auto_45165 - BLOCK
      ?auto_45166 - BLOCK
    )
    :vars
    (
      ?auto_45168 - BLOCK
      ?auto_45167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45162 ?auto_45163 ) ) ( not ( = ?auto_45162 ?auto_45164 ) ) ( not ( = ?auto_45162 ?auto_45165 ) ) ( not ( = ?auto_45162 ?auto_45166 ) ) ( not ( = ?auto_45163 ?auto_45164 ) ) ( not ( = ?auto_45163 ?auto_45165 ) ) ( not ( = ?auto_45163 ?auto_45166 ) ) ( not ( = ?auto_45164 ?auto_45165 ) ) ( not ( = ?auto_45164 ?auto_45166 ) ) ( not ( = ?auto_45165 ?auto_45166 ) ) ( ON ?auto_45166 ?auto_45168 ) ( not ( = ?auto_45162 ?auto_45168 ) ) ( not ( = ?auto_45163 ?auto_45168 ) ) ( not ( = ?auto_45164 ?auto_45168 ) ) ( not ( = ?auto_45165 ?auto_45168 ) ) ( not ( = ?auto_45166 ?auto_45168 ) ) ( ON ?auto_45165 ?auto_45166 ) ( ON-TABLE ?auto_45167 ) ( ON ?auto_45168 ?auto_45167 ) ( not ( = ?auto_45167 ?auto_45168 ) ) ( not ( = ?auto_45167 ?auto_45166 ) ) ( not ( = ?auto_45167 ?auto_45165 ) ) ( not ( = ?auto_45162 ?auto_45167 ) ) ( not ( = ?auto_45163 ?auto_45167 ) ) ( not ( = ?auto_45164 ?auto_45167 ) ) ( ON ?auto_45164 ?auto_45165 ) ( ON ?auto_45163 ?auto_45164 ) ( CLEAR ?auto_45163 ) ( HOLDING ?auto_45162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45162 )
      ( MAKE-5PILE ?auto_45162 ?auto_45163 ?auto_45164 ?auto_45165 ?auto_45166 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45169 - BLOCK
      ?auto_45170 - BLOCK
      ?auto_45171 - BLOCK
      ?auto_45172 - BLOCK
      ?auto_45173 - BLOCK
    )
    :vars
    (
      ?auto_45174 - BLOCK
      ?auto_45175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45169 ?auto_45170 ) ) ( not ( = ?auto_45169 ?auto_45171 ) ) ( not ( = ?auto_45169 ?auto_45172 ) ) ( not ( = ?auto_45169 ?auto_45173 ) ) ( not ( = ?auto_45170 ?auto_45171 ) ) ( not ( = ?auto_45170 ?auto_45172 ) ) ( not ( = ?auto_45170 ?auto_45173 ) ) ( not ( = ?auto_45171 ?auto_45172 ) ) ( not ( = ?auto_45171 ?auto_45173 ) ) ( not ( = ?auto_45172 ?auto_45173 ) ) ( ON ?auto_45173 ?auto_45174 ) ( not ( = ?auto_45169 ?auto_45174 ) ) ( not ( = ?auto_45170 ?auto_45174 ) ) ( not ( = ?auto_45171 ?auto_45174 ) ) ( not ( = ?auto_45172 ?auto_45174 ) ) ( not ( = ?auto_45173 ?auto_45174 ) ) ( ON ?auto_45172 ?auto_45173 ) ( ON-TABLE ?auto_45175 ) ( ON ?auto_45174 ?auto_45175 ) ( not ( = ?auto_45175 ?auto_45174 ) ) ( not ( = ?auto_45175 ?auto_45173 ) ) ( not ( = ?auto_45175 ?auto_45172 ) ) ( not ( = ?auto_45169 ?auto_45175 ) ) ( not ( = ?auto_45170 ?auto_45175 ) ) ( not ( = ?auto_45171 ?auto_45175 ) ) ( ON ?auto_45171 ?auto_45172 ) ( ON ?auto_45170 ?auto_45171 ) ( ON ?auto_45169 ?auto_45170 ) ( CLEAR ?auto_45169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45175 ?auto_45174 ?auto_45173 ?auto_45172 ?auto_45171 ?auto_45170 )
      ( MAKE-5PILE ?auto_45169 ?auto_45170 ?auto_45171 ?auto_45172 ?auto_45173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45177 - BLOCK
    )
    :vars
    (
      ?auto_45178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45178 ?auto_45177 ) ( CLEAR ?auto_45178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45177 ) ( not ( = ?auto_45177 ?auto_45178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45178 ?auto_45177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45179 - BLOCK
    )
    :vars
    (
      ?auto_45180 - BLOCK
      ?auto_45181 - BLOCK
      ?auto_45182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45180 ?auto_45179 ) ( CLEAR ?auto_45180 ) ( ON-TABLE ?auto_45179 ) ( not ( = ?auto_45179 ?auto_45180 ) ) ( HOLDING ?auto_45181 ) ( CLEAR ?auto_45182 ) ( not ( = ?auto_45179 ?auto_45181 ) ) ( not ( = ?auto_45179 ?auto_45182 ) ) ( not ( = ?auto_45180 ?auto_45181 ) ) ( not ( = ?auto_45180 ?auto_45182 ) ) ( not ( = ?auto_45181 ?auto_45182 ) ) )
    :subtasks
    ( ( !STACK ?auto_45181 ?auto_45182 )
      ( MAKE-1PILE ?auto_45179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45183 - BLOCK
    )
    :vars
    (
      ?auto_45186 - BLOCK
      ?auto_45184 - BLOCK
      ?auto_45185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45186 ?auto_45183 ) ( ON-TABLE ?auto_45183 ) ( not ( = ?auto_45183 ?auto_45186 ) ) ( CLEAR ?auto_45184 ) ( not ( = ?auto_45183 ?auto_45185 ) ) ( not ( = ?auto_45183 ?auto_45184 ) ) ( not ( = ?auto_45186 ?auto_45185 ) ) ( not ( = ?auto_45186 ?auto_45184 ) ) ( not ( = ?auto_45185 ?auto_45184 ) ) ( ON ?auto_45185 ?auto_45186 ) ( CLEAR ?auto_45185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45183 ?auto_45186 )
      ( MAKE-1PILE ?auto_45183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45187 - BLOCK
    )
    :vars
    (
      ?auto_45189 - BLOCK
      ?auto_45188 - BLOCK
      ?auto_45190 - BLOCK
      ?auto_45191 - BLOCK
      ?auto_45193 - BLOCK
      ?auto_45192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45189 ?auto_45187 ) ( ON-TABLE ?auto_45187 ) ( not ( = ?auto_45187 ?auto_45189 ) ) ( not ( = ?auto_45187 ?auto_45188 ) ) ( not ( = ?auto_45187 ?auto_45190 ) ) ( not ( = ?auto_45189 ?auto_45188 ) ) ( not ( = ?auto_45189 ?auto_45190 ) ) ( not ( = ?auto_45188 ?auto_45190 ) ) ( ON ?auto_45188 ?auto_45189 ) ( CLEAR ?auto_45188 ) ( HOLDING ?auto_45190 ) ( CLEAR ?auto_45191 ) ( ON-TABLE ?auto_45193 ) ( ON ?auto_45192 ?auto_45193 ) ( ON ?auto_45191 ?auto_45192 ) ( not ( = ?auto_45193 ?auto_45192 ) ) ( not ( = ?auto_45193 ?auto_45191 ) ) ( not ( = ?auto_45193 ?auto_45190 ) ) ( not ( = ?auto_45192 ?auto_45191 ) ) ( not ( = ?auto_45192 ?auto_45190 ) ) ( not ( = ?auto_45191 ?auto_45190 ) ) ( not ( = ?auto_45187 ?auto_45191 ) ) ( not ( = ?auto_45187 ?auto_45193 ) ) ( not ( = ?auto_45187 ?auto_45192 ) ) ( not ( = ?auto_45189 ?auto_45191 ) ) ( not ( = ?auto_45189 ?auto_45193 ) ) ( not ( = ?auto_45189 ?auto_45192 ) ) ( not ( = ?auto_45188 ?auto_45191 ) ) ( not ( = ?auto_45188 ?auto_45193 ) ) ( not ( = ?auto_45188 ?auto_45192 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45193 ?auto_45192 ?auto_45191 ?auto_45190 )
      ( MAKE-1PILE ?auto_45187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45194 - BLOCK
    )
    :vars
    (
      ?auto_45195 - BLOCK
      ?auto_45200 - BLOCK
      ?auto_45199 - BLOCK
      ?auto_45196 - BLOCK
      ?auto_45197 - BLOCK
      ?auto_45198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45195 ?auto_45194 ) ( ON-TABLE ?auto_45194 ) ( not ( = ?auto_45194 ?auto_45195 ) ) ( not ( = ?auto_45194 ?auto_45200 ) ) ( not ( = ?auto_45194 ?auto_45199 ) ) ( not ( = ?auto_45195 ?auto_45200 ) ) ( not ( = ?auto_45195 ?auto_45199 ) ) ( not ( = ?auto_45200 ?auto_45199 ) ) ( ON ?auto_45200 ?auto_45195 ) ( CLEAR ?auto_45196 ) ( ON-TABLE ?auto_45197 ) ( ON ?auto_45198 ?auto_45197 ) ( ON ?auto_45196 ?auto_45198 ) ( not ( = ?auto_45197 ?auto_45198 ) ) ( not ( = ?auto_45197 ?auto_45196 ) ) ( not ( = ?auto_45197 ?auto_45199 ) ) ( not ( = ?auto_45198 ?auto_45196 ) ) ( not ( = ?auto_45198 ?auto_45199 ) ) ( not ( = ?auto_45196 ?auto_45199 ) ) ( not ( = ?auto_45194 ?auto_45196 ) ) ( not ( = ?auto_45194 ?auto_45197 ) ) ( not ( = ?auto_45194 ?auto_45198 ) ) ( not ( = ?auto_45195 ?auto_45196 ) ) ( not ( = ?auto_45195 ?auto_45197 ) ) ( not ( = ?auto_45195 ?auto_45198 ) ) ( not ( = ?auto_45200 ?auto_45196 ) ) ( not ( = ?auto_45200 ?auto_45197 ) ) ( not ( = ?auto_45200 ?auto_45198 ) ) ( ON ?auto_45199 ?auto_45200 ) ( CLEAR ?auto_45199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45194 ?auto_45195 ?auto_45200 )
      ( MAKE-1PILE ?auto_45194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45201 - BLOCK
    )
    :vars
    (
      ?auto_45204 - BLOCK
      ?auto_45203 - BLOCK
      ?auto_45207 - BLOCK
      ?auto_45206 - BLOCK
      ?auto_45202 - BLOCK
      ?auto_45205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45204 ?auto_45201 ) ( ON-TABLE ?auto_45201 ) ( not ( = ?auto_45201 ?auto_45204 ) ) ( not ( = ?auto_45201 ?auto_45203 ) ) ( not ( = ?auto_45201 ?auto_45207 ) ) ( not ( = ?auto_45204 ?auto_45203 ) ) ( not ( = ?auto_45204 ?auto_45207 ) ) ( not ( = ?auto_45203 ?auto_45207 ) ) ( ON ?auto_45203 ?auto_45204 ) ( ON-TABLE ?auto_45206 ) ( ON ?auto_45202 ?auto_45206 ) ( not ( = ?auto_45206 ?auto_45202 ) ) ( not ( = ?auto_45206 ?auto_45205 ) ) ( not ( = ?auto_45206 ?auto_45207 ) ) ( not ( = ?auto_45202 ?auto_45205 ) ) ( not ( = ?auto_45202 ?auto_45207 ) ) ( not ( = ?auto_45205 ?auto_45207 ) ) ( not ( = ?auto_45201 ?auto_45205 ) ) ( not ( = ?auto_45201 ?auto_45206 ) ) ( not ( = ?auto_45201 ?auto_45202 ) ) ( not ( = ?auto_45204 ?auto_45205 ) ) ( not ( = ?auto_45204 ?auto_45206 ) ) ( not ( = ?auto_45204 ?auto_45202 ) ) ( not ( = ?auto_45203 ?auto_45205 ) ) ( not ( = ?auto_45203 ?auto_45206 ) ) ( not ( = ?auto_45203 ?auto_45202 ) ) ( ON ?auto_45207 ?auto_45203 ) ( CLEAR ?auto_45207 ) ( HOLDING ?auto_45205 ) ( CLEAR ?auto_45202 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45206 ?auto_45202 ?auto_45205 )
      ( MAKE-1PILE ?auto_45201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45208 - BLOCK
    )
    :vars
    (
      ?auto_45213 - BLOCK
      ?auto_45210 - BLOCK
      ?auto_45212 - BLOCK
      ?auto_45211 - BLOCK
      ?auto_45214 - BLOCK
      ?auto_45209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45213 ?auto_45208 ) ( ON-TABLE ?auto_45208 ) ( not ( = ?auto_45208 ?auto_45213 ) ) ( not ( = ?auto_45208 ?auto_45210 ) ) ( not ( = ?auto_45208 ?auto_45212 ) ) ( not ( = ?auto_45213 ?auto_45210 ) ) ( not ( = ?auto_45213 ?auto_45212 ) ) ( not ( = ?auto_45210 ?auto_45212 ) ) ( ON ?auto_45210 ?auto_45213 ) ( ON-TABLE ?auto_45211 ) ( ON ?auto_45214 ?auto_45211 ) ( not ( = ?auto_45211 ?auto_45214 ) ) ( not ( = ?auto_45211 ?auto_45209 ) ) ( not ( = ?auto_45211 ?auto_45212 ) ) ( not ( = ?auto_45214 ?auto_45209 ) ) ( not ( = ?auto_45214 ?auto_45212 ) ) ( not ( = ?auto_45209 ?auto_45212 ) ) ( not ( = ?auto_45208 ?auto_45209 ) ) ( not ( = ?auto_45208 ?auto_45211 ) ) ( not ( = ?auto_45208 ?auto_45214 ) ) ( not ( = ?auto_45213 ?auto_45209 ) ) ( not ( = ?auto_45213 ?auto_45211 ) ) ( not ( = ?auto_45213 ?auto_45214 ) ) ( not ( = ?auto_45210 ?auto_45209 ) ) ( not ( = ?auto_45210 ?auto_45211 ) ) ( not ( = ?auto_45210 ?auto_45214 ) ) ( ON ?auto_45212 ?auto_45210 ) ( CLEAR ?auto_45214 ) ( ON ?auto_45209 ?auto_45212 ) ( CLEAR ?auto_45209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45208 ?auto_45213 ?auto_45210 ?auto_45212 )
      ( MAKE-1PILE ?auto_45208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45215 - BLOCK
    )
    :vars
    (
      ?auto_45218 - BLOCK
      ?auto_45219 - BLOCK
      ?auto_45216 - BLOCK
      ?auto_45220 - BLOCK
      ?auto_45221 - BLOCK
      ?auto_45217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45218 ?auto_45215 ) ( ON-TABLE ?auto_45215 ) ( not ( = ?auto_45215 ?auto_45218 ) ) ( not ( = ?auto_45215 ?auto_45219 ) ) ( not ( = ?auto_45215 ?auto_45216 ) ) ( not ( = ?auto_45218 ?auto_45219 ) ) ( not ( = ?auto_45218 ?auto_45216 ) ) ( not ( = ?auto_45219 ?auto_45216 ) ) ( ON ?auto_45219 ?auto_45218 ) ( ON-TABLE ?auto_45220 ) ( not ( = ?auto_45220 ?auto_45221 ) ) ( not ( = ?auto_45220 ?auto_45217 ) ) ( not ( = ?auto_45220 ?auto_45216 ) ) ( not ( = ?auto_45221 ?auto_45217 ) ) ( not ( = ?auto_45221 ?auto_45216 ) ) ( not ( = ?auto_45217 ?auto_45216 ) ) ( not ( = ?auto_45215 ?auto_45217 ) ) ( not ( = ?auto_45215 ?auto_45220 ) ) ( not ( = ?auto_45215 ?auto_45221 ) ) ( not ( = ?auto_45218 ?auto_45217 ) ) ( not ( = ?auto_45218 ?auto_45220 ) ) ( not ( = ?auto_45218 ?auto_45221 ) ) ( not ( = ?auto_45219 ?auto_45217 ) ) ( not ( = ?auto_45219 ?auto_45220 ) ) ( not ( = ?auto_45219 ?auto_45221 ) ) ( ON ?auto_45216 ?auto_45219 ) ( ON ?auto_45217 ?auto_45216 ) ( CLEAR ?auto_45217 ) ( HOLDING ?auto_45221 ) ( CLEAR ?auto_45220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45220 ?auto_45221 )
      ( MAKE-1PILE ?auto_45215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45222 - BLOCK
    )
    :vars
    (
      ?auto_45228 - BLOCK
      ?auto_45223 - BLOCK
      ?auto_45224 - BLOCK
      ?auto_45226 - BLOCK
      ?auto_45225 - BLOCK
      ?auto_45227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45228 ?auto_45222 ) ( ON-TABLE ?auto_45222 ) ( not ( = ?auto_45222 ?auto_45228 ) ) ( not ( = ?auto_45222 ?auto_45223 ) ) ( not ( = ?auto_45222 ?auto_45224 ) ) ( not ( = ?auto_45228 ?auto_45223 ) ) ( not ( = ?auto_45228 ?auto_45224 ) ) ( not ( = ?auto_45223 ?auto_45224 ) ) ( ON ?auto_45223 ?auto_45228 ) ( ON-TABLE ?auto_45226 ) ( not ( = ?auto_45226 ?auto_45225 ) ) ( not ( = ?auto_45226 ?auto_45227 ) ) ( not ( = ?auto_45226 ?auto_45224 ) ) ( not ( = ?auto_45225 ?auto_45227 ) ) ( not ( = ?auto_45225 ?auto_45224 ) ) ( not ( = ?auto_45227 ?auto_45224 ) ) ( not ( = ?auto_45222 ?auto_45227 ) ) ( not ( = ?auto_45222 ?auto_45226 ) ) ( not ( = ?auto_45222 ?auto_45225 ) ) ( not ( = ?auto_45228 ?auto_45227 ) ) ( not ( = ?auto_45228 ?auto_45226 ) ) ( not ( = ?auto_45228 ?auto_45225 ) ) ( not ( = ?auto_45223 ?auto_45227 ) ) ( not ( = ?auto_45223 ?auto_45226 ) ) ( not ( = ?auto_45223 ?auto_45225 ) ) ( ON ?auto_45224 ?auto_45223 ) ( ON ?auto_45227 ?auto_45224 ) ( CLEAR ?auto_45226 ) ( ON ?auto_45225 ?auto_45227 ) ( CLEAR ?auto_45225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45222 ?auto_45228 ?auto_45223 ?auto_45224 ?auto_45227 )
      ( MAKE-1PILE ?auto_45222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45229 - BLOCK
    )
    :vars
    (
      ?auto_45231 - BLOCK
      ?auto_45230 - BLOCK
      ?auto_45234 - BLOCK
      ?auto_45233 - BLOCK
      ?auto_45235 - BLOCK
      ?auto_45232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45231 ?auto_45229 ) ( ON-TABLE ?auto_45229 ) ( not ( = ?auto_45229 ?auto_45231 ) ) ( not ( = ?auto_45229 ?auto_45230 ) ) ( not ( = ?auto_45229 ?auto_45234 ) ) ( not ( = ?auto_45231 ?auto_45230 ) ) ( not ( = ?auto_45231 ?auto_45234 ) ) ( not ( = ?auto_45230 ?auto_45234 ) ) ( ON ?auto_45230 ?auto_45231 ) ( not ( = ?auto_45233 ?auto_45235 ) ) ( not ( = ?auto_45233 ?auto_45232 ) ) ( not ( = ?auto_45233 ?auto_45234 ) ) ( not ( = ?auto_45235 ?auto_45232 ) ) ( not ( = ?auto_45235 ?auto_45234 ) ) ( not ( = ?auto_45232 ?auto_45234 ) ) ( not ( = ?auto_45229 ?auto_45232 ) ) ( not ( = ?auto_45229 ?auto_45233 ) ) ( not ( = ?auto_45229 ?auto_45235 ) ) ( not ( = ?auto_45231 ?auto_45232 ) ) ( not ( = ?auto_45231 ?auto_45233 ) ) ( not ( = ?auto_45231 ?auto_45235 ) ) ( not ( = ?auto_45230 ?auto_45232 ) ) ( not ( = ?auto_45230 ?auto_45233 ) ) ( not ( = ?auto_45230 ?auto_45235 ) ) ( ON ?auto_45234 ?auto_45230 ) ( ON ?auto_45232 ?auto_45234 ) ( ON ?auto_45235 ?auto_45232 ) ( CLEAR ?auto_45235 ) ( HOLDING ?auto_45233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45233 )
      ( MAKE-1PILE ?auto_45229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45236 - BLOCK
    )
    :vars
    (
      ?auto_45238 - BLOCK
      ?auto_45239 - BLOCK
      ?auto_45240 - BLOCK
      ?auto_45241 - BLOCK
      ?auto_45242 - BLOCK
      ?auto_45237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45238 ?auto_45236 ) ( ON-TABLE ?auto_45236 ) ( not ( = ?auto_45236 ?auto_45238 ) ) ( not ( = ?auto_45236 ?auto_45239 ) ) ( not ( = ?auto_45236 ?auto_45240 ) ) ( not ( = ?auto_45238 ?auto_45239 ) ) ( not ( = ?auto_45238 ?auto_45240 ) ) ( not ( = ?auto_45239 ?auto_45240 ) ) ( ON ?auto_45239 ?auto_45238 ) ( not ( = ?auto_45241 ?auto_45242 ) ) ( not ( = ?auto_45241 ?auto_45237 ) ) ( not ( = ?auto_45241 ?auto_45240 ) ) ( not ( = ?auto_45242 ?auto_45237 ) ) ( not ( = ?auto_45242 ?auto_45240 ) ) ( not ( = ?auto_45237 ?auto_45240 ) ) ( not ( = ?auto_45236 ?auto_45237 ) ) ( not ( = ?auto_45236 ?auto_45241 ) ) ( not ( = ?auto_45236 ?auto_45242 ) ) ( not ( = ?auto_45238 ?auto_45237 ) ) ( not ( = ?auto_45238 ?auto_45241 ) ) ( not ( = ?auto_45238 ?auto_45242 ) ) ( not ( = ?auto_45239 ?auto_45237 ) ) ( not ( = ?auto_45239 ?auto_45241 ) ) ( not ( = ?auto_45239 ?auto_45242 ) ) ( ON ?auto_45240 ?auto_45239 ) ( ON ?auto_45237 ?auto_45240 ) ( ON ?auto_45242 ?auto_45237 ) ( ON ?auto_45241 ?auto_45242 ) ( CLEAR ?auto_45241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45236 ?auto_45238 ?auto_45239 ?auto_45240 ?auto_45237 ?auto_45242 )
      ( MAKE-1PILE ?auto_45236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45249 - BLOCK
      ?auto_45250 - BLOCK
      ?auto_45251 - BLOCK
      ?auto_45252 - BLOCK
      ?auto_45253 - BLOCK
      ?auto_45254 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45254 ) ( CLEAR ?auto_45253 ) ( ON-TABLE ?auto_45249 ) ( ON ?auto_45250 ?auto_45249 ) ( ON ?auto_45251 ?auto_45250 ) ( ON ?auto_45252 ?auto_45251 ) ( ON ?auto_45253 ?auto_45252 ) ( not ( = ?auto_45249 ?auto_45250 ) ) ( not ( = ?auto_45249 ?auto_45251 ) ) ( not ( = ?auto_45249 ?auto_45252 ) ) ( not ( = ?auto_45249 ?auto_45253 ) ) ( not ( = ?auto_45249 ?auto_45254 ) ) ( not ( = ?auto_45250 ?auto_45251 ) ) ( not ( = ?auto_45250 ?auto_45252 ) ) ( not ( = ?auto_45250 ?auto_45253 ) ) ( not ( = ?auto_45250 ?auto_45254 ) ) ( not ( = ?auto_45251 ?auto_45252 ) ) ( not ( = ?auto_45251 ?auto_45253 ) ) ( not ( = ?auto_45251 ?auto_45254 ) ) ( not ( = ?auto_45252 ?auto_45253 ) ) ( not ( = ?auto_45252 ?auto_45254 ) ) ( not ( = ?auto_45253 ?auto_45254 ) ) )
    :subtasks
    ( ( !STACK ?auto_45254 ?auto_45253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45255 - BLOCK
      ?auto_45256 - BLOCK
      ?auto_45257 - BLOCK
      ?auto_45258 - BLOCK
      ?auto_45259 - BLOCK
      ?auto_45260 - BLOCK
    )
    :vars
    (
      ?auto_45261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45259 ) ( ON-TABLE ?auto_45255 ) ( ON ?auto_45256 ?auto_45255 ) ( ON ?auto_45257 ?auto_45256 ) ( ON ?auto_45258 ?auto_45257 ) ( ON ?auto_45259 ?auto_45258 ) ( not ( = ?auto_45255 ?auto_45256 ) ) ( not ( = ?auto_45255 ?auto_45257 ) ) ( not ( = ?auto_45255 ?auto_45258 ) ) ( not ( = ?auto_45255 ?auto_45259 ) ) ( not ( = ?auto_45255 ?auto_45260 ) ) ( not ( = ?auto_45256 ?auto_45257 ) ) ( not ( = ?auto_45256 ?auto_45258 ) ) ( not ( = ?auto_45256 ?auto_45259 ) ) ( not ( = ?auto_45256 ?auto_45260 ) ) ( not ( = ?auto_45257 ?auto_45258 ) ) ( not ( = ?auto_45257 ?auto_45259 ) ) ( not ( = ?auto_45257 ?auto_45260 ) ) ( not ( = ?auto_45258 ?auto_45259 ) ) ( not ( = ?auto_45258 ?auto_45260 ) ) ( not ( = ?auto_45259 ?auto_45260 ) ) ( ON ?auto_45260 ?auto_45261 ) ( CLEAR ?auto_45260 ) ( HAND-EMPTY ) ( not ( = ?auto_45255 ?auto_45261 ) ) ( not ( = ?auto_45256 ?auto_45261 ) ) ( not ( = ?auto_45257 ?auto_45261 ) ) ( not ( = ?auto_45258 ?auto_45261 ) ) ( not ( = ?auto_45259 ?auto_45261 ) ) ( not ( = ?auto_45260 ?auto_45261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45260 ?auto_45261 )
      ( MAKE-6PILE ?auto_45255 ?auto_45256 ?auto_45257 ?auto_45258 ?auto_45259 ?auto_45260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45262 - BLOCK
      ?auto_45263 - BLOCK
      ?auto_45264 - BLOCK
      ?auto_45265 - BLOCK
      ?auto_45266 - BLOCK
      ?auto_45267 - BLOCK
    )
    :vars
    (
      ?auto_45268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45262 ) ( ON ?auto_45263 ?auto_45262 ) ( ON ?auto_45264 ?auto_45263 ) ( ON ?auto_45265 ?auto_45264 ) ( not ( = ?auto_45262 ?auto_45263 ) ) ( not ( = ?auto_45262 ?auto_45264 ) ) ( not ( = ?auto_45262 ?auto_45265 ) ) ( not ( = ?auto_45262 ?auto_45266 ) ) ( not ( = ?auto_45262 ?auto_45267 ) ) ( not ( = ?auto_45263 ?auto_45264 ) ) ( not ( = ?auto_45263 ?auto_45265 ) ) ( not ( = ?auto_45263 ?auto_45266 ) ) ( not ( = ?auto_45263 ?auto_45267 ) ) ( not ( = ?auto_45264 ?auto_45265 ) ) ( not ( = ?auto_45264 ?auto_45266 ) ) ( not ( = ?auto_45264 ?auto_45267 ) ) ( not ( = ?auto_45265 ?auto_45266 ) ) ( not ( = ?auto_45265 ?auto_45267 ) ) ( not ( = ?auto_45266 ?auto_45267 ) ) ( ON ?auto_45267 ?auto_45268 ) ( CLEAR ?auto_45267 ) ( not ( = ?auto_45262 ?auto_45268 ) ) ( not ( = ?auto_45263 ?auto_45268 ) ) ( not ( = ?auto_45264 ?auto_45268 ) ) ( not ( = ?auto_45265 ?auto_45268 ) ) ( not ( = ?auto_45266 ?auto_45268 ) ) ( not ( = ?auto_45267 ?auto_45268 ) ) ( HOLDING ?auto_45266 ) ( CLEAR ?auto_45265 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45262 ?auto_45263 ?auto_45264 ?auto_45265 ?auto_45266 )
      ( MAKE-6PILE ?auto_45262 ?auto_45263 ?auto_45264 ?auto_45265 ?auto_45266 ?auto_45267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45269 - BLOCK
      ?auto_45270 - BLOCK
      ?auto_45271 - BLOCK
      ?auto_45272 - BLOCK
      ?auto_45273 - BLOCK
      ?auto_45274 - BLOCK
    )
    :vars
    (
      ?auto_45275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45269 ) ( ON ?auto_45270 ?auto_45269 ) ( ON ?auto_45271 ?auto_45270 ) ( ON ?auto_45272 ?auto_45271 ) ( not ( = ?auto_45269 ?auto_45270 ) ) ( not ( = ?auto_45269 ?auto_45271 ) ) ( not ( = ?auto_45269 ?auto_45272 ) ) ( not ( = ?auto_45269 ?auto_45273 ) ) ( not ( = ?auto_45269 ?auto_45274 ) ) ( not ( = ?auto_45270 ?auto_45271 ) ) ( not ( = ?auto_45270 ?auto_45272 ) ) ( not ( = ?auto_45270 ?auto_45273 ) ) ( not ( = ?auto_45270 ?auto_45274 ) ) ( not ( = ?auto_45271 ?auto_45272 ) ) ( not ( = ?auto_45271 ?auto_45273 ) ) ( not ( = ?auto_45271 ?auto_45274 ) ) ( not ( = ?auto_45272 ?auto_45273 ) ) ( not ( = ?auto_45272 ?auto_45274 ) ) ( not ( = ?auto_45273 ?auto_45274 ) ) ( ON ?auto_45274 ?auto_45275 ) ( not ( = ?auto_45269 ?auto_45275 ) ) ( not ( = ?auto_45270 ?auto_45275 ) ) ( not ( = ?auto_45271 ?auto_45275 ) ) ( not ( = ?auto_45272 ?auto_45275 ) ) ( not ( = ?auto_45273 ?auto_45275 ) ) ( not ( = ?auto_45274 ?auto_45275 ) ) ( CLEAR ?auto_45272 ) ( ON ?auto_45273 ?auto_45274 ) ( CLEAR ?auto_45273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45275 ?auto_45274 )
      ( MAKE-6PILE ?auto_45269 ?auto_45270 ?auto_45271 ?auto_45272 ?auto_45273 ?auto_45274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45276 - BLOCK
      ?auto_45277 - BLOCK
      ?auto_45278 - BLOCK
      ?auto_45279 - BLOCK
      ?auto_45280 - BLOCK
      ?auto_45281 - BLOCK
    )
    :vars
    (
      ?auto_45282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45276 ) ( ON ?auto_45277 ?auto_45276 ) ( ON ?auto_45278 ?auto_45277 ) ( not ( = ?auto_45276 ?auto_45277 ) ) ( not ( = ?auto_45276 ?auto_45278 ) ) ( not ( = ?auto_45276 ?auto_45279 ) ) ( not ( = ?auto_45276 ?auto_45280 ) ) ( not ( = ?auto_45276 ?auto_45281 ) ) ( not ( = ?auto_45277 ?auto_45278 ) ) ( not ( = ?auto_45277 ?auto_45279 ) ) ( not ( = ?auto_45277 ?auto_45280 ) ) ( not ( = ?auto_45277 ?auto_45281 ) ) ( not ( = ?auto_45278 ?auto_45279 ) ) ( not ( = ?auto_45278 ?auto_45280 ) ) ( not ( = ?auto_45278 ?auto_45281 ) ) ( not ( = ?auto_45279 ?auto_45280 ) ) ( not ( = ?auto_45279 ?auto_45281 ) ) ( not ( = ?auto_45280 ?auto_45281 ) ) ( ON ?auto_45281 ?auto_45282 ) ( not ( = ?auto_45276 ?auto_45282 ) ) ( not ( = ?auto_45277 ?auto_45282 ) ) ( not ( = ?auto_45278 ?auto_45282 ) ) ( not ( = ?auto_45279 ?auto_45282 ) ) ( not ( = ?auto_45280 ?auto_45282 ) ) ( not ( = ?auto_45281 ?auto_45282 ) ) ( ON ?auto_45280 ?auto_45281 ) ( CLEAR ?auto_45280 ) ( ON-TABLE ?auto_45282 ) ( HOLDING ?auto_45279 ) ( CLEAR ?auto_45278 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45276 ?auto_45277 ?auto_45278 ?auto_45279 )
      ( MAKE-6PILE ?auto_45276 ?auto_45277 ?auto_45278 ?auto_45279 ?auto_45280 ?auto_45281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45283 - BLOCK
      ?auto_45284 - BLOCK
      ?auto_45285 - BLOCK
      ?auto_45286 - BLOCK
      ?auto_45287 - BLOCK
      ?auto_45288 - BLOCK
    )
    :vars
    (
      ?auto_45289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45283 ) ( ON ?auto_45284 ?auto_45283 ) ( ON ?auto_45285 ?auto_45284 ) ( not ( = ?auto_45283 ?auto_45284 ) ) ( not ( = ?auto_45283 ?auto_45285 ) ) ( not ( = ?auto_45283 ?auto_45286 ) ) ( not ( = ?auto_45283 ?auto_45287 ) ) ( not ( = ?auto_45283 ?auto_45288 ) ) ( not ( = ?auto_45284 ?auto_45285 ) ) ( not ( = ?auto_45284 ?auto_45286 ) ) ( not ( = ?auto_45284 ?auto_45287 ) ) ( not ( = ?auto_45284 ?auto_45288 ) ) ( not ( = ?auto_45285 ?auto_45286 ) ) ( not ( = ?auto_45285 ?auto_45287 ) ) ( not ( = ?auto_45285 ?auto_45288 ) ) ( not ( = ?auto_45286 ?auto_45287 ) ) ( not ( = ?auto_45286 ?auto_45288 ) ) ( not ( = ?auto_45287 ?auto_45288 ) ) ( ON ?auto_45288 ?auto_45289 ) ( not ( = ?auto_45283 ?auto_45289 ) ) ( not ( = ?auto_45284 ?auto_45289 ) ) ( not ( = ?auto_45285 ?auto_45289 ) ) ( not ( = ?auto_45286 ?auto_45289 ) ) ( not ( = ?auto_45287 ?auto_45289 ) ) ( not ( = ?auto_45288 ?auto_45289 ) ) ( ON ?auto_45287 ?auto_45288 ) ( ON-TABLE ?auto_45289 ) ( CLEAR ?auto_45285 ) ( ON ?auto_45286 ?auto_45287 ) ( CLEAR ?auto_45286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45289 ?auto_45288 ?auto_45287 )
      ( MAKE-6PILE ?auto_45283 ?auto_45284 ?auto_45285 ?auto_45286 ?auto_45287 ?auto_45288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45290 - BLOCK
      ?auto_45291 - BLOCK
      ?auto_45292 - BLOCK
      ?auto_45293 - BLOCK
      ?auto_45294 - BLOCK
      ?auto_45295 - BLOCK
    )
    :vars
    (
      ?auto_45296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45290 ) ( ON ?auto_45291 ?auto_45290 ) ( not ( = ?auto_45290 ?auto_45291 ) ) ( not ( = ?auto_45290 ?auto_45292 ) ) ( not ( = ?auto_45290 ?auto_45293 ) ) ( not ( = ?auto_45290 ?auto_45294 ) ) ( not ( = ?auto_45290 ?auto_45295 ) ) ( not ( = ?auto_45291 ?auto_45292 ) ) ( not ( = ?auto_45291 ?auto_45293 ) ) ( not ( = ?auto_45291 ?auto_45294 ) ) ( not ( = ?auto_45291 ?auto_45295 ) ) ( not ( = ?auto_45292 ?auto_45293 ) ) ( not ( = ?auto_45292 ?auto_45294 ) ) ( not ( = ?auto_45292 ?auto_45295 ) ) ( not ( = ?auto_45293 ?auto_45294 ) ) ( not ( = ?auto_45293 ?auto_45295 ) ) ( not ( = ?auto_45294 ?auto_45295 ) ) ( ON ?auto_45295 ?auto_45296 ) ( not ( = ?auto_45290 ?auto_45296 ) ) ( not ( = ?auto_45291 ?auto_45296 ) ) ( not ( = ?auto_45292 ?auto_45296 ) ) ( not ( = ?auto_45293 ?auto_45296 ) ) ( not ( = ?auto_45294 ?auto_45296 ) ) ( not ( = ?auto_45295 ?auto_45296 ) ) ( ON ?auto_45294 ?auto_45295 ) ( ON-TABLE ?auto_45296 ) ( ON ?auto_45293 ?auto_45294 ) ( CLEAR ?auto_45293 ) ( HOLDING ?auto_45292 ) ( CLEAR ?auto_45291 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45290 ?auto_45291 ?auto_45292 )
      ( MAKE-6PILE ?auto_45290 ?auto_45291 ?auto_45292 ?auto_45293 ?auto_45294 ?auto_45295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45297 - BLOCK
      ?auto_45298 - BLOCK
      ?auto_45299 - BLOCK
      ?auto_45300 - BLOCK
      ?auto_45301 - BLOCK
      ?auto_45302 - BLOCK
    )
    :vars
    (
      ?auto_45303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45297 ) ( ON ?auto_45298 ?auto_45297 ) ( not ( = ?auto_45297 ?auto_45298 ) ) ( not ( = ?auto_45297 ?auto_45299 ) ) ( not ( = ?auto_45297 ?auto_45300 ) ) ( not ( = ?auto_45297 ?auto_45301 ) ) ( not ( = ?auto_45297 ?auto_45302 ) ) ( not ( = ?auto_45298 ?auto_45299 ) ) ( not ( = ?auto_45298 ?auto_45300 ) ) ( not ( = ?auto_45298 ?auto_45301 ) ) ( not ( = ?auto_45298 ?auto_45302 ) ) ( not ( = ?auto_45299 ?auto_45300 ) ) ( not ( = ?auto_45299 ?auto_45301 ) ) ( not ( = ?auto_45299 ?auto_45302 ) ) ( not ( = ?auto_45300 ?auto_45301 ) ) ( not ( = ?auto_45300 ?auto_45302 ) ) ( not ( = ?auto_45301 ?auto_45302 ) ) ( ON ?auto_45302 ?auto_45303 ) ( not ( = ?auto_45297 ?auto_45303 ) ) ( not ( = ?auto_45298 ?auto_45303 ) ) ( not ( = ?auto_45299 ?auto_45303 ) ) ( not ( = ?auto_45300 ?auto_45303 ) ) ( not ( = ?auto_45301 ?auto_45303 ) ) ( not ( = ?auto_45302 ?auto_45303 ) ) ( ON ?auto_45301 ?auto_45302 ) ( ON-TABLE ?auto_45303 ) ( ON ?auto_45300 ?auto_45301 ) ( CLEAR ?auto_45298 ) ( ON ?auto_45299 ?auto_45300 ) ( CLEAR ?auto_45299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45303 ?auto_45302 ?auto_45301 ?auto_45300 )
      ( MAKE-6PILE ?auto_45297 ?auto_45298 ?auto_45299 ?auto_45300 ?auto_45301 ?auto_45302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45304 - BLOCK
      ?auto_45305 - BLOCK
      ?auto_45306 - BLOCK
      ?auto_45307 - BLOCK
      ?auto_45308 - BLOCK
      ?auto_45309 - BLOCK
    )
    :vars
    (
      ?auto_45310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45304 ) ( not ( = ?auto_45304 ?auto_45305 ) ) ( not ( = ?auto_45304 ?auto_45306 ) ) ( not ( = ?auto_45304 ?auto_45307 ) ) ( not ( = ?auto_45304 ?auto_45308 ) ) ( not ( = ?auto_45304 ?auto_45309 ) ) ( not ( = ?auto_45305 ?auto_45306 ) ) ( not ( = ?auto_45305 ?auto_45307 ) ) ( not ( = ?auto_45305 ?auto_45308 ) ) ( not ( = ?auto_45305 ?auto_45309 ) ) ( not ( = ?auto_45306 ?auto_45307 ) ) ( not ( = ?auto_45306 ?auto_45308 ) ) ( not ( = ?auto_45306 ?auto_45309 ) ) ( not ( = ?auto_45307 ?auto_45308 ) ) ( not ( = ?auto_45307 ?auto_45309 ) ) ( not ( = ?auto_45308 ?auto_45309 ) ) ( ON ?auto_45309 ?auto_45310 ) ( not ( = ?auto_45304 ?auto_45310 ) ) ( not ( = ?auto_45305 ?auto_45310 ) ) ( not ( = ?auto_45306 ?auto_45310 ) ) ( not ( = ?auto_45307 ?auto_45310 ) ) ( not ( = ?auto_45308 ?auto_45310 ) ) ( not ( = ?auto_45309 ?auto_45310 ) ) ( ON ?auto_45308 ?auto_45309 ) ( ON-TABLE ?auto_45310 ) ( ON ?auto_45307 ?auto_45308 ) ( ON ?auto_45306 ?auto_45307 ) ( CLEAR ?auto_45306 ) ( HOLDING ?auto_45305 ) ( CLEAR ?auto_45304 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45304 ?auto_45305 )
      ( MAKE-6PILE ?auto_45304 ?auto_45305 ?auto_45306 ?auto_45307 ?auto_45308 ?auto_45309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45311 - BLOCK
      ?auto_45312 - BLOCK
      ?auto_45313 - BLOCK
      ?auto_45314 - BLOCK
      ?auto_45315 - BLOCK
      ?auto_45316 - BLOCK
    )
    :vars
    (
      ?auto_45317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45311 ) ( not ( = ?auto_45311 ?auto_45312 ) ) ( not ( = ?auto_45311 ?auto_45313 ) ) ( not ( = ?auto_45311 ?auto_45314 ) ) ( not ( = ?auto_45311 ?auto_45315 ) ) ( not ( = ?auto_45311 ?auto_45316 ) ) ( not ( = ?auto_45312 ?auto_45313 ) ) ( not ( = ?auto_45312 ?auto_45314 ) ) ( not ( = ?auto_45312 ?auto_45315 ) ) ( not ( = ?auto_45312 ?auto_45316 ) ) ( not ( = ?auto_45313 ?auto_45314 ) ) ( not ( = ?auto_45313 ?auto_45315 ) ) ( not ( = ?auto_45313 ?auto_45316 ) ) ( not ( = ?auto_45314 ?auto_45315 ) ) ( not ( = ?auto_45314 ?auto_45316 ) ) ( not ( = ?auto_45315 ?auto_45316 ) ) ( ON ?auto_45316 ?auto_45317 ) ( not ( = ?auto_45311 ?auto_45317 ) ) ( not ( = ?auto_45312 ?auto_45317 ) ) ( not ( = ?auto_45313 ?auto_45317 ) ) ( not ( = ?auto_45314 ?auto_45317 ) ) ( not ( = ?auto_45315 ?auto_45317 ) ) ( not ( = ?auto_45316 ?auto_45317 ) ) ( ON ?auto_45315 ?auto_45316 ) ( ON-TABLE ?auto_45317 ) ( ON ?auto_45314 ?auto_45315 ) ( ON ?auto_45313 ?auto_45314 ) ( CLEAR ?auto_45311 ) ( ON ?auto_45312 ?auto_45313 ) ( CLEAR ?auto_45312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45317 ?auto_45316 ?auto_45315 ?auto_45314 ?auto_45313 )
      ( MAKE-6PILE ?auto_45311 ?auto_45312 ?auto_45313 ?auto_45314 ?auto_45315 ?auto_45316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45318 - BLOCK
      ?auto_45319 - BLOCK
      ?auto_45320 - BLOCK
      ?auto_45321 - BLOCK
      ?auto_45322 - BLOCK
      ?auto_45323 - BLOCK
    )
    :vars
    (
      ?auto_45324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45318 ?auto_45319 ) ) ( not ( = ?auto_45318 ?auto_45320 ) ) ( not ( = ?auto_45318 ?auto_45321 ) ) ( not ( = ?auto_45318 ?auto_45322 ) ) ( not ( = ?auto_45318 ?auto_45323 ) ) ( not ( = ?auto_45319 ?auto_45320 ) ) ( not ( = ?auto_45319 ?auto_45321 ) ) ( not ( = ?auto_45319 ?auto_45322 ) ) ( not ( = ?auto_45319 ?auto_45323 ) ) ( not ( = ?auto_45320 ?auto_45321 ) ) ( not ( = ?auto_45320 ?auto_45322 ) ) ( not ( = ?auto_45320 ?auto_45323 ) ) ( not ( = ?auto_45321 ?auto_45322 ) ) ( not ( = ?auto_45321 ?auto_45323 ) ) ( not ( = ?auto_45322 ?auto_45323 ) ) ( ON ?auto_45323 ?auto_45324 ) ( not ( = ?auto_45318 ?auto_45324 ) ) ( not ( = ?auto_45319 ?auto_45324 ) ) ( not ( = ?auto_45320 ?auto_45324 ) ) ( not ( = ?auto_45321 ?auto_45324 ) ) ( not ( = ?auto_45322 ?auto_45324 ) ) ( not ( = ?auto_45323 ?auto_45324 ) ) ( ON ?auto_45322 ?auto_45323 ) ( ON-TABLE ?auto_45324 ) ( ON ?auto_45321 ?auto_45322 ) ( ON ?auto_45320 ?auto_45321 ) ( ON ?auto_45319 ?auto_45320 ) ( CLEAR ?auto_45319 ) ( HOLDING ?auto_45318 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45318 )
      ( MAKE-6PILE ?auto_45318 ?auto_45319 ?auto_45320 ?auto_45321 ?auto_45322 ?auto_45323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45325 - BLOCK
      ?auto_45326 - BLOCK
      ?auto_45327 - BLOCK
      ?auto_45328 - BLOCK
      ?auto_45329 - BLOCK
      ?auto_45330 - BLOCK
    )
    :vars
    (
      ?auto_45331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45325 ?auto_45326 ) ) ( not ( = ?auto_45325 ?auto_45327 ) ) ( not ( = ?auto_45325 ?auto_45328 ) ) ( not ( = ?auto_45325 ?auto_45329 ) ) ( not ( = ?auto_45325 ?auto_45330 ) ) ( not ( = ?auto_45326 ?auto_45327 ) ) ( not ( = ?auto_45326 ?auto_45328 ) ) ( not ( = ?auto_45326 ?auto_45329 ) ) ( not ( = ?auto_45326 ?auto_45330 ) ) ( not ( = ?auto_45327 ?auto_45328 ) ) ( not ( = ?auto_45327 ?auto_45329 ) ) ( not ( = ?auto_45327 ?auto_45330 ) ) ( not ( = ?auto_45328 ?auto_45329 ) ) ( not ( = ?auto_45328 ?auto_45330 ) ) ( not ( = ?auto_45329 ?auto_45330 ) ) ( ON ?auto_45330 ?auto_45331 ) ( not ( = ?auto_45325 ?auto_45331 ) ) ( not ( = ?auto_45326 ?auto_45331 ) ) ( not ( = ?auto_45327 ?auto_45331 ) ) ( not ( = ?auto_45328 ?auto_45331 ) ) ( not ( = ?auto_45329 ?auto_45331 ) ) ( not ( = ?auto_45330 ?auto_45331 ) ) ( ON ?auto_45329 ?auto_45330 ) ( ON-TABLE ?auto_45331 ) ( ON ?auto_45328 ?auto_45329 ) ( ON ?auto_45327 ?auto_45328 ) ( ON ?auto_45326 ?auto_45327 ) ( ON ?auto_45325 ?auto_45326 ) ( CLEAR ?auto_45325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45331 ?auto_45330 ?auto_45329 ?auto_45328 ?auto_45327 ?auto_45326 )
      ( MAKE-6PILE ?auto_45325 ?auto_45326 ?auto_45327 ?auto_45328 ?auto_45329 ?auto_45330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45337 - BLOCK
      ?auto_45338 - BLOCK
      ?auto_45339 - BLOCK
      ?auto_45340 - BLOCK
      ?auto_45341 - BLOCK
    )
    :vars
    (
      ?auto_45342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45342 ?auto_45341 ) ( CLEAR ?auto_45342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45337 ) ( ON ?auto_45338 ?auto_45337 ) ( ON ?auto_45339 ?auto_45338 ) ( ON ?auto_45340 ?auto_45339 ) ( ON ?auto_45341 ?auto_45340 ) ( not ( = ?auto_45337 ?auto_45338 ) ) ( not ( = ?auto_45337 ?auto_45339 ) ) ( not ( = ?auto_45337 ?auto_45340 ) ) ( not ( = ?auto_45337 ?auto_45341 ) ) ( not ( = ?auto_45337 ?auto_45342 ) ) ( not ( = ?auto_45338 ?auto_45339 ) ) ( not ( = ?auto_45338 ?auto_45340 ) ) ( not ( = ?auto_45338 ?auto_45341 ) ) ( not ( = ?auto_45338 ?auto_45342 ) ) ( not ( = ?auto_45339 ?auto_45340 ) ) ( not ( = ?auto_45339 ?auto_45341 ) ) ( not ( = ?auto_45339 ?auto_45342 ) ) ( not ( = ?auto_45340 ?auto_45341 ) ) ( not ( = ?auto_45340 ?auto_45342 ) ) ( not ( = ?auto_45341 ?auto_45342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45342 ?auto_45341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45356 - BLOCK
      ?auto_45357 - BLOCK
      ?auto_45358 - BLOCK
      ?auto_45359 - BLOCK
      ?auto_45360 - BLOCK
    )
    :vars
    (
      ?auto_45361 - BLOCK
      ?auto_45362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45356 ) ( ON ?auto_45357 ?auto_45356 ) ( ON ?auto_45358 ?auto_45357 ) ( ON ?auto_45359 ?auto_45358 ) ( not ( = ?auto_45356 ?auto_45357 ) ) ( not ( = ?auto_45356 ?auto_45358 ) ) ( not ( = ?auto_45356 ?auto_45359 ) ) ( not ( = ?auto_45356 ?auto_45360 ) ) ( not ( = ?auto_45356 ?auto_45361 ) ) ( not ( = ?auto_45357 ?auto_45358 ) ) ( not ( = ?auto_45357 ?auto_45359 ) ) ( not ( = ?auto_45357 ?auto_45360 ) ) ( not ( = ?auto_45357 ?auto_45361 ) ) ( not ( = ?auto_45358 ?auto_45359 ) ) ( not ( = ?auto_45358 ?auto_45360 ) ) ( not ( = ?auto_45358 ?auto_45361 ) ) ( not ( = ?auto_45359 ?auto_45360 ) ) ( not ( = ?auto_45359 ?auto_45361 ) ) ( not ( = ?auto_45360 ?auto_45361 ) ) ( ON ?auto_45361 ?auto_45362 ) ( CLEAR ?auto_45361 ) ( not ( = ?auto_45356 ?auto_45362 ) ) ( not ( = ?auto_45357 ?auto_45362 ) ) ( not ( = ?auto_45358 ?auto_45362 ) ) ( not ( = ?auto_45359 ?auto_45362 ) ) ( not ( = ?auto_45360 ?auto_45362 ) ) ( not ( = ?auto_45361 ?auto_45362 ) ) ( HOLDING ?auto_45360 ) ( CLEAR ?auto_45359 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45356 ?auto_45357 ?auto_45358 ?auto_45359 ?auto_45360 ?auto_45361 )
      ( MAKE-5PILE ?auto_45356 ?auto_45357 ?auto_45358 ?auto_45359 ?auto_45360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45363 - BLOCK
      ?auto_45364 - BLOCK
      ?auto_45365 - BLOCK
      ?auto_45366 - BLOCK
      ?auto_45367 - BLOCK
    )
    :vars
    (
      ?auto_45369 - BLOCK
      ?auto_45368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45363 ) ( ON ?auto_45364 ?auto_45363 ) ( ON ?auto_45365 ?auto_45364 ) ( ON ?auto_45366 ?auto_45365 ) ( not ( = ?auto_45363 ?auto_45364 ) ) ( not ( = ?auto_45363 ?auto_45365 ) ) ( not ( = ?auto_45363 ?auto_45366 ) ) ( not ( = ?auto_45363 ?auto_45367 ) ) ( not ( = ?auto_45363 ?auto_45369 ) ) ( not ( = ?auto_45364 ?auto_45365 ) ) ( not ( = ?auto_45364 ?auto_45366 ) ) ( not ( = ?auto_45364 ?auto_45367 ) ) ( not ( = ?auto_45364 ?auto_45369 ) ) ( not ( = ?auto_45365 ?auto_45366 ) ) ( not ( = ?auto_45365 ?auto_45367 ) ) ( not ( = ?auto_45365 ?auto_45369 ) ) ( not ( = ?auto_45366 ?auto_45367 ) ) ( not ( = ?auto_45366 ?auto_45369 ) ) ( not ( = ?auto_45367 ?auto_45369 ) ) ( ON ?auto_45369 ?auto_45368 ) ( not ( = ?auto_45363 ?auto_45368 ) ) ( not ( = ?auto_45364 ?auto_45368 ) ) ( not ( = ?auto_45365 ?auto_45368 ) ) ( not ( = ?auto_45366 ?auto_45368 ) ) ( not ( = ?auto_45367 ?auto_45368 ) ) ( not ( = ?auto_45369 ?auto_45368 ) ) ( CLEAR ?auto_45366 ) ( ON ?auto_45367 ?auto_45369 ) ( CLEAR ?auto_45367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45368 ?auto_45369 )
      ( MAKE-5PILE ?auto_45363 ?auto_45364 ?auto_45365 ?auto_45366 ?auto_45367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45370 - BLOCK
      ?auto_45371 - BLOCK
      ?auto_45372 - BLOCK
      ?auto_45373 - BLOCK
      ?auto_45374 - BLOCK
    )
    :vars
    (
      ?auto_45375 - BLOCK
      ?auto_45376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45370 ) ( ON ?auto_45371 ?auto_45370 ) ( ON ?auto_45372 ?auto_45371 ) ( not ( = ?auto_45370 ?auto_45371 ) ) ( not ( = ?auto_45370 ?auto_45372 ) ) ( not ( = ?auto_45370 ?auto_45373 ) ) ( not ( = ?auto_45370 ?auto_45374 ) ) ( not ( = ?auto_45370 ?auto_45375 ) ) ( not ( = ?auto_45371 ?auto_45372 ) ) ( not ( = ?auto_45371 ?auto_45373 ) ) ( not ( = ?auto_45371 ?auto_45374 ) ) ( not ( = ?auto_45371 ?auto_45375 ) ) ( not ( = ?auto_45372 ?auto_45373 ) ) ( not ( = ?auto_45372 ?auto_45374 ) ) ( not ( = ?auto_45372 ?auto_45375 ) ) ( not ( = ?auto_45373 ?auto_45374 ) ) ( not ( = ?auto_45373 ?auto_45375 ) ) ( not ( = ?auto_45374 ?auto_45375 ) ) ( ON ?auto_45375 ?auto_45376 ) ( not ( = ?auto_45370 ?auto_45376 ) ) ( not ( = ?auto_45371 ?auto_45376 ) ) ( not ( = ?auto_45372 ?auto_45376 ) ) ( not ( = ?auto_45373 ?auto_45376 ) ) ( not ( = ?auto_45374 ?auto_45376 ) ) ( not ( = ?auto_45375 ?auto_45376 ) ) ( ON ?auto_45374 ?auto_45375 ) ( CLEAR ?auto_45374 ) ( ON-TABLE ?auto_45376 ) ( HOLDING ?auto_45373 ) ( CLEAR ?auto_45372 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45370 ?auto_45371 ?auto_45372 ?auto_45373 )
      ( MAKE-5PILE ?auto_45370 ?auto_45371 ?auto_45372 ?auto_45373 ?auto_45374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45377 - BLOCK
      ?auto_45378 - BLOCK
      ?auto_45379 - BLOCK
      ?auto_45380 - BLOCK
      ?auto_45381 - BLOCK
    )
    :vars
    (
      ?auto_45383 - BLOCK
      ?auto_45382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45377 ) ( ON ?auto_45378 ?auto_45377 ) ( ON ?auto_45379 ?auto_45378 ) ( not ( = ?auto_45377 ?auto_45378 ) ) ( not ( = ?auto_45377 ?auto_45379 ) ) ( not ( = ?auto_45377 ?auto_45380 ) ) ( not ( = ?auto_45377 ?auto_45381 ) ) ( not ( = ?auto_45377 ?auto_45383 ) ) ( not ( = ?auto_45378 ?auto_45379 ) ) ( not ( = ?auto_45378 ?auto_45380 ) ) ( not ( = ?auto_45378 ?auto_45381 ) ) ( not ( = ?auto_45378 ?auto_45383 ) ) ( not ( = ?auto_45379 ?auto_45380 ) ) ( not ( = ?auto_45379 ?auto_45381 ) ) ( not ( = ?auto_45379 ?auto_45383 ) ) ( not ( = ?auto_45380 ?auto_45381 ) ) ( not ( = ?auto_45380 ?auto_45383 ) ) ( not ( = ?auto_45381 ?auto_45383 ) ) ( ON ?auto_45383 ?auto_45382 ) ( not ( = ?auto_45377 ?auto_45382 ) ) ( not ( = ?auto_45378 ?auto_45382 ) ) ( not ( = ?auto_45379 ?auto_45382 ) ) ( not ( = ?auto_45380 ?auto_45382 ) ) ( not ( = ?auto_45381 ?auto_45382 ) ) ( not ( = ?auto_45383 ?auto_45382 ) ) ( ON ?auto_45381 ?auto_45383 ) ( ON-TABLE ?auto_45382 ) ( CLEAR ?auto_45379 ) ( ON ?auto_45380 ?auto_45381 ) ( CLEAR ?auto_45380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45382 ?auto_45383 ?auto_45381 )
      ( MAKE-5PILE ?auto_45377 ?auto_45378 ?auto_45379 ?auto_45380 ?auto_45381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45384 - BLOCK
      ?auto_45385 - BLOCK
      ?auto_45386 - BLOCK
      ?auto_45387 - BLOCK
      ?auto_45388 - BLOCK
    )
    :vars
    (
      ?auto_45390 - BLOCK
      ?auto_45389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45384 ) ( ON ?auto_45385 ?auto_45384 ) ( not ( = ?auto_45384 ?auto_45385 ) ) ( not ( = ?auto_45384 ?auto_45386 ) ) ( not ( = ?auto_45384 ?auto_45387 ) ) ( not ( = ?auto_45384 ?auto_45388 ) ) ( not ( = ?auto_45384 ?auto_45390 ) ) ( not ( = ?auto_45385 ?auto_45386 ) ) ( not ( = ?auto_45385 ?auto_45387 ) ) ( not ( = ?auto_45385 ?auto_45388 ) ) ( not ( = ?auto_45385 ?auto_45390 ) ) ( not ( = ?auto_45386 ?auto_45387 ) ) ( not ( = ?auto_45386 ?auto_45388 ) ) ( not ( = ?auto_45386 ?auto_45390 ) ) ( not ( = ?auto_45387 ?auto_45388 ) ) ( not ( = ?auto_45387 ?auto_45390 ) ) ( not ( = ?auto_45388 ?auto_45390 ) ) ( ON ?auto_45390 ?auto_45389 ) ( not ( = ?auto_45384 ?auto_45389 ) ) ( not ( = ?auto_45385 ?auto_45389 ) ) ( not ( = ?auto_45386 ?auto_45389 ) ) ( not ( = ?auto_45387 ?auto_45389 ) ) ( not ( = ?auto_45388 ?auto_45389 ) ) ( not ( = ?auto_45390 ?auto_45389 ) ) ( ON ?auto_45388 ?auto_45390 ) ( ON-TABLE ?auto_45389 ) ( ON ?auto_45387 ?auto_45388 ) ( CLEAR ?auto_45387 ) ( HOLDING ?auto_45386 ) ( CLEAR ?auto_45385 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45384 ?auto_45385 ?auto_45386 )
      ( MAKE-5PILE ?auto_45384 ?auto_45385 ?auto_45386 ?auto_45387 ?auto_45388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45391 - BLOCK
      ?auto_45392 - BLOCK
      ?auto_45393 - BLOCK
      ?auto_45394 - BLOCK
      ?auto_45395 - BLOCK
    )
    :vars
    (
      ?auto_45397 - BLOCK
      ?auto_45396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45391 ) ( ON ?auto_45392 ?auto_45391 ) ( not ( = ?auto_45391 ?auto_45392 ) ) ( not ( = ?auto_45391 ?auto_45393 ) ) ( not ( = ?auto_45391 ?auto_45394 ) ) ( not ( = ?auto_45391 ?auto_45395 ) ) ( not ( = ?auto_45391 ?auto_45397 ) ) ( not ( = ?auto_45392 ?auto_45393 ) ) ( not ( = ?auto_45392 ?auto_45394 ) ) ( not ( = ?auto_45392 ?auto_45395 ) ) ( not ( = ?auto_45392 ?auto_45397 ) ) ( not ( = ?auto_45393 ?auto_45394 ) ) ( not ( = ?auto_45393 ?auto_45395 ) ) ( not ( = ?auto_45393 ?auto_45397 ) ) ( not ( = ?auto_45394 ?auto_45395 ) ) ( not ( = ?auto_45394 ?auto_45397 ) ) ( not ( = ?auto_45395 ?auto_45397 ) ) ( ON ?auto_45397 ?auto_45396 ) ( not ( = ?auto_45391 ?auto_45396 ) ) ( not ( = ?auto_45392 ?auto_45396 ) ) ( not ( = ?auto_45393 ?auto_45396 ) ) ( not ( = ?auto_45394 ?auto_45396 ) ) ( not ( = ?auto_45395 ?auto_45396 ) ) ( not ( = ?auto_45397 ?auto_45396 ) ) ( ON ?auto_45395 ?auto_45397 ) ( ON-TABLE ?auto_45396 ) ( ON ?auto_45394 ?auto_45395 ) ( CLEAR ?auto_45392 ) ( ON ?auto_45393 ?auto_45394 ) ( CLEAR ?auto_45393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45396 ?auto_45397 ?auto_45395 ?auto_45394 )
      ( MAKE-5PILE ?auto_45391 ?auto_45392 ?auto_45393 ?auto_45394 ?auto_45395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45398 - BLOCK
      ?auto_45399 - BLOCK
      ?auto_45400 - BLOCK
      ?auto_45401 - BLOCK
      ?auto_45402 - BLOCK
    )
    :vars
    (
      ?auto_45403 - BLOCK
      ?auto_45404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45398 ) ( not ( = ?auto_45398 ?auto_45399 ) ) ( not ( = ?auto_45398 ?auto_45400 ) ) ( not ( = ?auto_45398 ?auto_45401 ) ) ( not ( = ?auto_45398 ?auto_45402 ) ) ( not ( = ?auto_45398 ?auto_45403 ) ) ( not ( = ?auto_45399 ?auto_45400 ) ) ( not ( = ?auto_45399 ?auto_45401 ) ) ( not ( = ?auto_45399 ?auto_45402 ) ) ( not ( = ?auto_45399 ?auto_45403 ) ) ( not ( = ?auto_45400 ?auto_45401 ) ) ( not ( = ?auto_45400 ?auto_45402 ) ) ( not ( = ?auto_45400 ?auto_45403 ) ) ( not ( = ?auto_45401 ?auto_45402 ) ) ( not ( = ?auto_45401 ?auto_45403 ) ) ( not ( = ?auto_45402 ?auto_45403 ) ) ( ON ?auto_45403 ?auto_45404 ) ( not ( = ?auto_45398 ?auto_45404 ) ) ( not ( = ?auto_45399 ?auto_45404 ) ) ( not ( = ?auto_45400 ?auto_45404 ) ) ( not ( = ?auto_45401 ?auto_45404 ) ) ( not ( = ?auto_45402 ?auto_45404 ) ) ( not ( = ?auto_45403 ?auto_45404 ) ) ( ON ?auto_45402 ?auto_45403 ) ( ON-TABLE ?auto_45404 ) ( ON ?auto_45401 ?auto_45402 ) ( ON ?auto_45400 ?auto_45401 ) ( CLEAR ?auto_45400 ) ( HOLDING ?auto_45399 ) ( CLEAR ?auto_45398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45398 ?auto_45399 )
      ( MAKE-5PILE ?auto_45398 ?auto_45399 ?auto_45400 ?auto_45401 ?auto_45402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45405 - BLOCK
      ?auto_45406 - BLOCK
      ?auto_45407 - BLOCK
      ?auto_45408 - BLOCK
      ?auto_45409 - BLOCK
    )
    :vars
    (
      ?auto_45410 - BLOCK
      ?auto_45411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45405 ) ( not ( = ?auto_45405 ?auto_45406 ) ) ( not ( = ?auto_45405 ?auto_45407 ) ) ( not ( = ?auto_45405 ?auto_45408 ) ) ( not ( = ?auto_45405 ?auto_45409 ) ) ( not ( = ?auto_45405 ?auto_45410 ) ) ( not ( = ?auto_45406 ?auto_45407 ) ) ( not ( = ?auto_45406 ?auto_45408 ) ) ( not ( = ?auto_45406 ?auto_45409 ) ) ( not ( = ?auto_45406 ?auto_45410 ) ) ( not ( = ?auto_45407 ?auto_45408 ) ) ( not ( = ?auto_45407 ?auto_45409 ) ) ( not ( = ?auto_45407 ?auto_45410 ) ) ( not ( = ?auto_45408 ?auto_45409 ) ) ( not ( = ?auto_45408 ?auto_45410 ) ) ( not ( = ?auto_45409 ?auto_45410 ) ) ( ON ?auto_45410 ?auto_45411 ) ( not ( = ?auto_45405 ?auto_45411 ) ) ( not ( = ?auto_45406 ?auto_45411 ) ) ( not ( = ?auto_45407 ?auto_45411 ) ) ( not ( = ?auto_45408 ?auto_45411 ) ) ( not ( = ?auto_45409 ?auto_45411 ) ) ( not ( = ?auto_45410 ?auto_45411 ) ) ( ON ?auto_45409 ?auto_45410 ) ( ON-TABLE ?auto_45411 ) ( ON ?auto_45408 ?auto_45409 ) ( ON ?auto_45407 ?auto_45408 ) ( CLEAR ?auto_45405 ) ( ON ?auto_45406 ?auto_45407 ) ( CLEAR ?auto_45406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45411 ?auto_45410 ?auto_45409 ?auto_45408 ?auto_45407 )
      ( MAKE-5PILE ?auto_45405 ?auto_45406 ?auto_45407 ?auto_45408 ?auto_45409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45412 - BLOCK
      ?auto_45413 - BLOCK
      ?auto_45414 - BLOCK
      ?auto_45415 - BLOCK
      ?auto_45416 - BLOCK
    )
    :vars
    (
      ?auto_45418 - BLOCK
      ?auto_45417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45412 ?auto_45413 ) ) ( not ( = ?auto_45412 ?auto_45414 ) ) ( not ( = ?auto_45412 ?auto_45415 ) ) ( not ( = ?auto_45412 ?auto_45416 ) ) ( not ( = ?auto_45412 ?auto_45418 ) ) ( not ( = ?auto_45413 ?auto_45414 ) ) ( not ( = ?auto_45413 ?auto_45415 ) ) ( not ( = ?auto_45413 ?auto_45416 ) ) ( not ( = ?auto_45413 ?auto_45418 ) ) ( not ( = ?auto_45414 ?auto_45415 ) ) ( not ( = ?auto_45414 ?auto_45416 ) ) ( not ( = ?auto_45414 ?auto_45418 ) ) ( not ( = ?auto_45415 ?auto_45416 ) ) ( not ( = ?auto_45415 ?auto_45418 ) ) ( not ( = ?auto_45416 ?auto_45418 ) ) ( ON ?auto_45418 ?auto_45417 ) ( not ( = ?auto_45412 ?auto_45417 ) ) ( not ( = ?auto_45413 ?auto_45417 ) ) ( not ( = ?auto_45414 ?auto_45417 ) ) ( not ( = ?auto_45415 ?auto_45417 ) ) ( not ( = ?auto_45416 ?auto_45417 ) ) ( not ( = ?auto_45418 ?auto_45417 ) ) ( ON ?auto_45416 ?auto_45418 ) ( ON-TABLE ?auto_45417 ) ( ON ?auto_45415 ?auto_45416 ) ( ON ?auto_45414 ?auto_45415 ) ( ON ?auto_45413 ?auto_45414 ) ( CLEAR ?auto_45413 ) ( HOLDING ?auto_45412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45412 )
      ( MAKE-5PILE ?auto_45412 ?auto_45413 ?auto_45414 ?auto_45415 ?auto_45416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45419 - BLOCK
      ?auto_45420 - BLOCK
      ?auto_45421 - BLOCK
      ?auto_45422 - BLOCK
      ?auto_45423 - BLOCK
    )
    :vars
    (
      ?auto_45424 - BLOCK
      ?auto_45425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45419 ?auto_45420 ) ) ( not ( = ?auto_45419 ?auto_45421 ) ) ( not ( = ?auto_45419 ?auto_45422 ) ) ( not ( = ?auto_45419 ?auto_45423 ) ) ( not ( = ?auto_45419 ?auto_45424 ) ) ( not ( = ?auto_45420 ?auto_45421 ) ) ( not ( = ?auto_45420 ?auto_45422 ) ) ( not ( = ?auto_45420 ?auto_45423 ) ) ( not ( = ?auto_45420 ?auto_45424 ) ) ( not ( = ?auto_45421 ?auto_45422 ) ) ( not ( = ?auto_45421 ?auto_45423 ) ) ( not ( = ?auto_45421 ?auto_45424 ) ) ( not ( = ?auto_45422 ?auto_45423 ) ) ( not ( = ?auto_45422 ?auto_45424 ) ) ( not ( = ?auto_45423 ?auto_45424 ) ) ( ON ?auto_45424 ?auto_45425 ) ( not ( = ?auto_45419 ?auto_45425 ) ) ( not ( = ?auto_45420 ?auto_45425 ) ) ( not ( = ?auto_45421 ?auto_45425 ) ) ( not ( = ?auto_45422 ?auto_45425 ) ) ( not ( = ?auto_45423 ?auto_45425 ) ) ( not ( = ?auto_45424 ?auto_45425 ) ) ( ON ?auto_45423 ?auto_45424 ) ( ON-TABLE ?auto_45425 ) ( ON ?auto_45422 ?auto_45423 ) ( ON ?auto_45421 ?auto_45422 ) ( ON ?auto_45420 ?auto_45421 ) ( ON ?auto_45419 ?auto_45420 ) ( CLEAR ?auto_45419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45425 ?auto_45424 ?auto_45423 ?auto_45422 ?auto_45421 ?auto_45420 )
      ( MAKE-5PILE ?auto_45419 ?auto_45420 ?auto_45421 ?auto_45422 ?auto_45423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45427 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45427 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_45427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45428 - BLOCK
    )
    :vars
    (
      ?auto_45429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45428 ?auto_45429 ) ( CLEAR ?auto_45428 ) ( HAND-EMPTY ) ( not ( = ?auto_45428 ?auto_45429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45428 ?auto_45429 )
      ( MAKE-1PILE ?auto_45428 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45430 - BLOCK
    )
    :vars
    (
      ?auto_45431 - BLOCK
      ?auto_45435 - BLOCK
      ?auto_45434 - BLOCK
      ?auto_45433 - BLOCK
      ?auto_45432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45430 ?auto_45431 ) ) ( HOLDING ?auto_45430 ) ( CLEAR ?auto_45431 ) ( ON-TABLE ?auto_45435 ) ( ON ?auto_45434 ?auto_45435 ) ( ON ?auto_45433 ?auto_45434 ) ( ON ?auto_45432 ?auto_45433 ) ( ON ?auto_45431 ?auto_45432 ) ( not ( = ?auto_45435 ?auto_45434 ) ) ( not ( = ?auto_45435 ?auto_45433 ) ) ( not ( = ?auto_45435 ?auto_45432 ) ) ( not ( = ?auto_45435 ?auto_45431 ) ) ( not ( = ?auto_45435 ?auto_45430 ) ) ( not ( = ?auto_45434 ?auto_45433 ) ) ( not ( = ?auto_45434 ?auto_45432 ) ) ( not ( = ?auto_45434 ?auto_45431 ) ) ( not ( = ?auto_45434 ?auto_45430 ) ) ( not ( = ?auto_45433 ?auto_45432 ) ) ( not ( = ?auto_45433 ?auto_45431 ) ) ( not ( = ?auto_45433 ?auto_45430 ) ) ( not ( = ?auto_45432 ?auto_45431 ) ) ( not ( = ?auto_45432 ?auto_45430 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45435 ?auto_45434 ?auto_45433 ?auto_45432 ?auto_45431 ?auto_45430 )
      ( MAKE-1PILE ?auto_45430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45436 - BLOCK
    )
    :vars
    (
      ?auto_45439 - BLOCK
      ?auto_45440 - BLOCK
      ?auto_45441 - BLOCK
      ?auto_45437 - BLOCK
      ?auto_45438 - BLOCK
      ?auto_45442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45436 ?auto_45439 ) ) ( CLEAR ?auto_45439 ) ( ON-TABLE ?auto_45440 ) ( ON ?auto_45441 ?auto_45440 ) ( ON ?auto_45437 ?auto_45441 ) ( ON ?auto_45438 ?auto_45437 ) ( ON ?auto_45439 ?auto_45438 ) ( not ( = ?auto_45440 ?auto_45441 ) ) ( not ( = ?auto_45440 ?auto_45437 ) ) ( not ( = ?auto_45440 ?auto_45438 ) ) ( not ( = ?auto_45440 ?auto_45439 ) ) ( not ( = ?auto_45440 ?auto_45436 ) ) ( not ( = ?auto_45441 ?auto_45437 ) ) ( not ( = ?auto_45441 ?auto_45438 ) ) ( not ( = ?auto_45441 ?auto_45439 ) ) ( not ( = ?auto_45441 ?auto_45436 ) ) ( not ( = ?auto_45437 ?auto_45438 ) ) ( not ( = ?auto_45437 ?auto_45439 ) ) ( not ( = ?auto_45437 ?auto_45436 ) ) ( not ( = ?auto_45438 ?auto_45439 ) ) ( not ( = ?auto_45438 ?auto_45436 ) ) ( ON ?auto_45436 ?auto_45442 ) ( CLEAR ?auto_45436 ) ( HAND-EMPTY ) ( not ( = ?auto_45436 ?auto_45442 ) ) ( not ( = ?auto_45439 ?auto_45442 ) ) ( not ( = ?auto_45440 ?auto_45442 ) ) ( not ( = ?auto_45441 ?auto_45442 ) ) ( not ( = ?auto_45437 ?auto_45442 ) ) ( not ( = ?auto_45438 ?auto_45442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45436 ?auto_45442 )
      ( MAKE-1PILE ?auto_45436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45443 - BLOCK
    )
    :vars
    (
      ?auto_45445 - BLOCK
      ?auto_45446 - BLOCK
      ?auto_45444 - BLOCK
      ?auto_45448 - BLOCK
      ?auto_45449 - BLOCK
      ?auto_45447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45443 ?auto_45445 ) ) ( ON-TABLE ?auto_45446 ) ( ON ?auto_45444 ?auto_45446 ) ( ON ?auto_45448 ?auto_45444 ) ( ON ?auto_45449 ?auto_45448 ) ( not ( = ?auto_45446 ?auto_45444 ) ) ( not ( = ?auto_45446 ?auto_45448 ) ) ( not ( = ?auto_45446 ?auto_45449 ) ) ( not ( = ?auto_45446 ?auto_45445 ) ) ( not ( = ?auto_45446 ?auto_45443 ) ) ( not ( = ?auto_45444 ?auto_45448 ) ) ( not ( = ?auto_45444 ?auto_45449 ) ) ( not ( = ?auto_45444 ?auto_45445 ) ) ( not ( = ?auto_45444 ?auto_45443 ) ) ( not ( = ?auto_45448 ?auto_45449 ) ) ( not ( = ?auto_45448 ?auto_45445 ) ) ( not ( = ?auto_45448 ?auto_45443 ) ) ( not ( = ?auto_45449 ?auto_45445 ) ) ( not ( = ?auto_45449 ?auto_45443 ) ) ( ON ?auto_45443 ?auto_45447 ) ( CLEAR ?auto_45443 ) ( not ( = ?auto_45443 ?auto_45447 ) ) ( not ( = ?auto_45445 ?auto_45447 ) ) ( not ( = ?auto_45446 ?auto_45447 ) ) ( not ( = ?auto_45444 ?auto_45447 ) ) ( not ( = ?auto_45448 ?auto_45447 ) ) ( not ( = ?auto_45449 ?auto_45447 ) ) ( HOLDING ?auto_45445 ) ( CLEAR ?auto_45449 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45446 ?auto_45444 ?auto_45448 ?auto_45449 ?auto_45445 )
      ( MAKE-1PILE ?auto_45443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45450 - BLOCK
    )
    :vars
    (
      ?auto_45452 - BLOCK
      ?auto_45455 - BLOCK
      ?auto_45454 - BLOCK
      ?auto_45453 - BLOCK
      ?auto_45451 - BLOCK
      ?auto_45456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45450 ?auto_45452 ) ) ( ON-TABLE ?auto_45455 ) ( ON ?auto_45454 ?auto_45455 ) ( ON ?auto_45453 ?auto_45454 ) ( ON ?auto_45451 ?auto_45453 ) ( not ( = ?auto_45455 ?auto_45454 ) ) ( not ( = ?auto_45455 ?auto_45453 ) ) ( not ( = ?auto_45455 ?auto_45451 ) ) ( not ( = ?auto_45455 ?auto_45452 ) ) ( not ( = ?auto_45455 ?auto_45450 ) ) ( not ( = ?auto_45454 ?auto_45453 ) ) ( not ( = ?auto_45454 ?auto_45451 ) ) ( not ( = ?auto_45454 ?auto_45452 ) ) ( not ( = ?auto_45454 ?auto_45450 ) ) ( not ( = ?auto_45453 ?auto_45451 ) ) ( not ( = ?auto_45453 ?auto_45452 ) ) ( not ( = ?auto_45453 ?auto_45450 ) ) ( not ( = ?auto_45451 ?auto_45452 ) ) ( not ( = ?auto_45451 ?auto_45450 ) ) ( ON ?auto_45450 ?auto_45456 ) ( not ( = ?auto_45450 ?auto_45456 ) ) ( not ( = ?auto_45452 ?auto_45456 ) ) ( not ( = ?auto_45455 ?auto_45456 ) ) ( not ( = ?auto_45454 ?auto_45456 ) ) ( not ( = ?auto_45453 ?auto_45456 ) ) ( not ( = ?auto_45451 ?auto_45456 ) ) ( CLEAR ?auto_45451 ) ( ON ?auto_45452 ?auto_45450 ) ( CLEAR ?auto_45452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45456 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45456 ?auto_45450 )
      ( MAKE-1PILE ?auto_45450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45457 - BLOCK
    )
    :vars
    (
      ?auto_45463 - BLOCK
      ?auto_45459 - BLOCK
      ?auto_45458 - BLOCK
      ?auto_45462 - BLOCK
      ?auto_45461 - BLOCK
      ?auto_45460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45457 ?auto_45463 ) ) ( ON-TABLE ?auto_45459 ) ( ON ?auto_45458 ?auto_45459 ) ( ON ?auto_45462 ?auto_45458 ) ( not ( = ?auto_45459 ?auto_45458 ) ) ( not ( = ?auto_45459 ?auto_45462 ) ) ( not ( = ?auto_45459 ?auto_45461 ) ) ( not ( = ?auto_45459 ?auto_45463 ) ) ( not ( = ?auto_45459 ?auto_45457 ) ) ( not ( = ?auto_45458 ?auto_45462 ) ) ( not ( = ?auto_45458 ?auto_45461 ) ) ( not ( = ?auto_45458 ?auto_45463 ) ) ( not ( = ?auto_45458 ?auto_45457 ) ) ( not ( = ?auto_45462 ?auto_45461 ) ) ( not ( = ?auto_45462 ?auto_45463 ) ) ( not ( = ?auto_45462 ?auto_45457 ) ) ( not ( = ?auto_45461 ?auto_45463 ) ) ( not ( = ?auto_45461 ?auto_45457 ) ) ( ON ?auto_45457 ?auto_45460 ) ( not ( = ?auto_45457 ?auto_45460 ) ) ( not ( = ?auto_45463 ?auto_45460 ) ) ( not ( = ?auto_45459 ?auto_45460 ) ) ( not ( = ?auto_45458 ?auto_45460 ) ) ( not ( = ?auto_45462 ?auto_45460 ) ) ( not ( = ?auto_45461 ?auto_45460 ) ) ( ON ?auto_45463 ?auto_45457 ) ( CLEAR ?auto_45463 ) ( ON-TABLE ?auto_45460 ) ( HOLDING ?auto_45461 ) ( CLEAR ?auto_45462 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45459 ?auto_45458 ?auto_45462 ?auto_45461 )
      ( MAKE-1PILE ?auto_45457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45464 - BLOCK
    )
    :vars
    (
      ?auto_45467 - BLOCK
      ?auto_45465 - BLOCK
      ?auto_45470 - BLOCK
      ?auto_45466 - BLOCK
      ?auto_45468 - BLOCK
      ?auto_45469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45464 ?auto_45467 ) ) ( ON-TABLE ?auto_45465 ) ( ON ?auto_45470 ?auto_45465 ) ( ON ?auto_45466 ?auto_45470 ) ( not ( = ?auto_45465 ?auto_45470 ) ) ( not ( = ?auto_45465 ?auto_45466 ) ) ( not ( = ?auto_45465 ?auto_45468 ) ) ( not ( = ?auto_45465 ?auto_45467 ) ) ( not ( = ?auto_45465 ?auto_45464 ) ) ( not ( = ?auto_45470 ?auto_45466 ) ) ( not ( = ?auto_45470 ?auto_45468 ) ) ( not ( = ?auto_45470 ?auto_45467 ) ) ( not ( = ?auto_45470 ?auto_45464 ) ) ( not ( = ?auto_45466 ?auto_45468 ) ) ( not ( = ?auto_45466 ?auto_45467 ) ) ( not ( = ?auto_45466 ?auto_45464 ) ) ( not ( = ?auto_45468 ?auto_45467 ) ) ( not ( = ?auto_45468 ?auto_45464 ) ) ( ON ?auto_45464 ?auto_45469 ) ( not ( = ?auto_45464 ?auto_45469 ) ) ( not ( = ?auto_45467 ?auto_45469 ) ) ( not ( = ?auto_45465 ?auto_45469 ) ) ( not ( = ?auto_45470 ?auto_45469 ) ) ( not ( = ?auto_45466 ?auto_45469 ) ) ( not ( = ?auto_45468 ?auto_45469 ) ) ( ON ?auto_45467 ?auto_45464 ) ( ON-TABLE ?auto_45469 ) ( CLEAR ?auto_45466 ) ( ON ?auto_45468 ?auto_45467 ) ( CLEAR ?auto_45468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45469 ?auto_45464 ?auto_45467 )
      ( MAKE-1PILE ?auto_45464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45471 - BLOCK
    )
    :vars
    (
      ?auto_45475 - BLOCK
      ?auto_45474 - BLOCK
      ?auto_45477 - BLOCK
      ?auto_45473 - BLOCK
      ?auto_45472 - BLOCK
      ?auto_45476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45471 ?auto_45475 ) ) ( ON-TABLE ?auto_45474 ) ( ON ?auto_45477 ?auto_45474 ) ( not ( = ?auto_45474 ?auto_45477 ) ) ( not ( = ?auto_45474 ?auto_45473 ) ) ( not ( = ?auto_45474 ?auto_45472 ) ) ( not ( = ?auto_45474 ?auto_45475 ) ) ( not ( = ?auto_45474 ?auto_45471 ) ) ( not ( = ?auto_45477 ?auto_45473 ) ) ( not ( = ?auto_45477 ?auto_45472 ) ) ( not ( = ?auto_45477 ?auto_45475 ) ) ( not ( = ?auto_45477 ?auto_45471 ) ) ( not ( = ?auto_45473 ?auto_45472 ) ) ( not ( = ?auto_45473 ?auto_45475 ) ) ( not ( = ?auto_45473 ?auto_45471 ) ) ( not ( = ?auto_45472 ?auto_45475 ) ) ( not ( = ?auto_45472 ?auto_45471 ) ) ( ON ?auto_45471 ?auto_45476 ) ( not ( = ?auto_45471 ?auto_45476 ) ) ( not ( = ?auto_45475 ?auto_45476 ) ) ( not ( = ?auto_45474 ?auto_45476 ) ) ( not ( = ?auto_45477 ?auto_45476 ) ) ( not ( = ?auto_45473 ?auto_45476 ) ) ( not ( = ?auto_45472 ?auto_45476 ) ) ( ON ?auto_45475 ?auto_45471 ) ( ON-TABLE ?auto_45476 ) ( ON ?auto_45472 ?auto_45475 ) ( CLEAR ?auto_45472 ) ( HOLDING ?auto_45473 ) ( CLEAR ?auto_45477 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45474 ?auto_45477 ?auto_45473 )
      ( MAKE-1PILE ?auto_45471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45478 - BLOCK
    )
    :vars
    (
      ?auto_45479 - BLOCK
      ?auto_45482 - BLOCK
      ?auto_45480 - BLOCK
      ?auto_45481 - BLOCK
      ?auto_45483 - BLOCK
      ?auto_45484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45478 ?auto_45479 ) ) ( ON-TABLE ?auto_45482 ) ( ON ?auto_45480 ?auto_45482 ) ( not ( = ?auto_45482 ?auto_45480 ) ) ( not ( = ?auto_45482 ?auto_45481 ) ) ( not ( = ?auto_45482 ?auto_45483 ) ) ( not ( = ?auto_45482 ?auto_45479 ) ) ( not ( = ?auto_45482 ?auto_45478 ) ) ( not ( = ?auto_45480 ?auto_45481 ) ) ( not ( = ?auto_45480 ?auto_45483 ) ) ( not ( = ?auto_45480 ?auto_45479 ) ) ( not ( = ?auto_45480 ?auto_45478 ) ) ( not ( = ?auto_45481 ?auto_45483 ) ) ( not ( = ?auto_45481 ?auto_45479 ) ) ( not ( = ?auto_45481 ?auto_45478 ) ) ( not ( = ?auto_45483 ?auto_45479 ) ) ( not ( = ?auto_45483 ?auto_45478 ) ) ( ON ?auto_45478 ?auto_45484 ) ( not ( = ?auto_45478 ?auto_45484 ) ) ( not ( = ?auto_45479 ?auto_45484 ) ) ( not ( = ?auto_45482 ?auto_45484 ) ) ( not ( = ?auto_45480 ?auto_45484 ) ) ( not ( = ?auto_45481 ?auto_45484 ) ) ( not ( = ?auto_45483 ?auto_45484 ) ) ( ON ?auto_45479 ?auto_45478 ) ( ON-TABLE ?auto_45484 ) ( ON ?auto_45483 ?auto_45479 ) ( CLEAR ?auto_45480 ) ( ON ?auto_45481 ?auto_45483 ) ( CLEAR ?auto_45481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45484 ?auto_45478 ?auto_45479 ?auto_45483 )
      ( MAKE-1PILE ?auto_45478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45485 - BLOCK
    )
    :vars
    (
      ?auto_45488 - BLOCK
      ?auto_45486 - BLOCK
      ?auto_45487 - BLOCK
      ?auto_45490 - BLOCK
      ?auto_45489 - BLOCK
      ?auto_45491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45485 ?auto_45488 ) ) ( ON-TABLE ?auto_45486 ) ( not ( = ?auto_45486 ?auto_45487 ) ) ( not ( = ?auto_45486 ?auto_45490 ) ) ( not ( = ?auto_45486 ?auto_45489 ) ) ( not ( = ?auto_45486 ?auto_45488 ) ) ( not ( = ?auto_45486 ?auto_45485 ) ) ( not ( = ?auto_45487 ?auto_45490 ) ) ( not ( = ?auto_45487 ?auto_45489 ) ) ( not ( = ?auto_45487 ?auto_45488 ) ) ( not ( = ?auto_45487 ?auto_45485 ) ) ( not ( = ?auto_45490 ?auto_45489 ) ) ( not ( = ?auto_45490 ?auto_45488 ) ) ( not ( = ?auto_45490 ?auto_45485 ) ) ( not ( = ?auto_45489 ?auto_45488 ) ) ( not ( = ?auto_45489 ?auto_45485 ) ) ( ON ?auto_45485 ?auto_45491 ) ( not ( = ?auto_45485 ?auto_45491 ) ) ( not ( = ?auto_45488 ?auto_45491 ) ) ( not ( = ?auto_45486 ?auto_45491 ) ) ( not ( = ?auto_45487 ?auto_45491 ) ) ( not ( = ?auto_45490 ?auto_45491 ) ) ( not ( = ?auto_45489 ?auto_45491 ) ) ( ON ?auto_45488 ?auto_45485 ) ( ON-TABLE ?auto_45491 ) ( ON ?auto_45489 ?auto_45488 ) ( ON ?auto_45490 ?auto_45489 ) ( CLEAR ?auto_45490 ) ( HOLDING ?auto_45487 ) ( CLEAR ?auto_45486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45486 ?auto_45487 )
      ( MAKE-1PILE ?auto_45485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45492 - BLOCK
    )
    :vars
    (
      ?auto_45495 - BLOCK
      ?auto_45498 - BLOCK
      ?auto_45494 - BLOCK
      ?auto_45496 - BLOCK
      ?auto_45497 - BLOCK
      ?auto_45493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45492 ?auto_45495 ) ) ( ON-TABLE ?auto_45498 ) ( not ( = ?auto_45498 ?auto_45494 ) ) ( not ( = ?auto_45498 ?auto_45496 ) ) ( not ( = ?auto_45498 ?auto_45497 ) ) ( not ( = ?auto_45498 ?auto_45495 ) ) ( not ( = ?auto_45498 ?auto_45492 ) ) ( not ( = ?auto_45494 ?auto_45496 ) ) ( not ( = ?auto_45494 ?auto_45497 ) ) ( not ( = ?auto_45494 ?auto_45495 ) ) ( not ( = ?auto_45494 ?auto_45492 ) ) ( not ( = ?auto_45496 ?auto_45497 ) ) ( not ( = ?auto_45496 ?auto_45495 ) ) ( not ( = ?auto_45496 ?auto_45492 ) ) ( not ( = ?auto_45497 ?auto_45495 ) ) ( not ( = ?auto_45497 ?auto_45492 ) ) ( ON ?auto_45492 ?auto_45493 ) ( not ( = ?auto_45492 ?auto_45493 ) ) ( not ( = ?auto_45495 ?auto_45493 ) ) ( not ( = ?auto_45498 ?auto_45493 ) ) ( not ( = ?auto_45494 ?auto_45493 ) ) ( not ( = ?auto_45496 ?auto_45493 ) ) ( not ( = ?auto_45497 ?auto_45493 ) ) ( ON ?auto_45495 ?auto_45492 ) ( ON-TABLE ?auto_45493 ) ( ON ?auto_45497 ?auto_45495 ) ( ON ?auto_45496 ?auto_45497 ) ( CLEAR ?auto_45498 ) ( ON ?auto_45494 ?auto_45496 ) ( CLEAR ?auto_45494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45493 ?auto_45492 ?auto_45495 ?auto_45497 ?auto_45496 )
      ( MAKE-1PILE ?auto_45492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45499 - BLOCK
    )
    :vars
    (
      ?auto_45505 - BLOCK
      ?auto_45500 - BLOCK
      ?auto_45504 - BLOCK
      ?auto_45503 - BLOCK
      ?auto_45501 - BLOCK
      ?auto_45502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45499 ?auto_45505 ) ) ( not ( = ?auto_45500 ?auto_45504 ) ) ( not ( = ?auto_45500 ?auto_45503 ) ) ( not ( = ?auto_45500 ?auto_45501 ) ) ( not ( = ?auto_45500 ?auto_45505 ) ) ( not ( = ?auto_45500 ?auto_45499 ) ) ( not ( = ?auto_45504 ?auto_45503 ) ) ( not ( = ?auto_45504 ?auto_45501 ) ) ( not ( = ?auto_45504 ?auto_45505 ) ) ( not ( = ?auto_45504 ?auto_45499 ) ) ( not ( = ?auto_45503 ?auto_45501 ) ) ( not ( = ?auto_45503 ?auto_45505 ) ) ( not ( = ?auto_45503 ?auto_45499 ) ) ( not ( = ?auto_45501 ?auto_45505 ) ) ( not ( = ?auto_45501 ?auto_45499 ) ) ( ON ?auto_45499 ?auto_45502 ) ( not ( = ?auto_45499 ?auto_45502 ) ) ( not ( = ?auto_45505 ?auto_45502 ) ) ( not ( = ?auto_45500 ?auto_45502 ) ) ( not ( = ?auto_45504 ?auto_45502 ) ) ( not ( = ?auto_45503 ?auto_45502 ) ) ( not ( = ?auto_45501 ?auto_45502 ) ) ( ON ?auto_45505 ?auto_45499 ) ( ON-TABLE ?auto_45502 ) ( ON ?auto_45501 ?auto_45505 ) ( ON ?auto_45503 ?auto_45501 ) ( ON ?auto_45504 ?auto_45503 ) ( CLEAR ?auto_45504 ) ( HOLDING ?auto_45500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45500 )
      ( MAKE-1PILE ?auto_45499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45506 - BLOCK
    )
    :vars
    (
      ?auto_45511 - BLOCK
      ?auto_45507 - BLOCK
      ?auto_45509 - BLOCK
      ?auto_45510 - BLOCK
      ?auto_45508 - BLOCK
      ?auto_45512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45506 ?auto_45511 ) ) ( not ( = ?auto_45507 ?auto_45509 ) ) ( not ( = ?auto_45507 ?auto_45510 ) ) ( not ( = ?auto_45507 ?auto_45508 ) ) ( not ( = ?auto_45507 ?auto_45511 ) ) ( not ( = ?auto_45507 ?auto_45506 ) ) ( not ( = ?auto_45509 ?auto_45510 ) ) ( not ( = ?auto_45509 ?auto_45508 ) ) ( not ( = ?auto_45509 ?auto_45511 ) ) ( not ( = ?auto_45509 ?auto_45506 ) ) ( not ( = ?auto_45510 ?auto_45508 ) ) ( not ( = ?auto_45510 ?auto_45511 ) ) ( not ( = ?auto_45510 ?auto_45506 ) ) ( not ( = ?auto_45508 ?auto_45511 ) ) ( not ( = ?auto_45508 ?auto_45506 ) ) ( ON ?auto_45506 ?auto_45512 ) ( not ( = ?auto_45506 ?auto_45512 ) ) ( not ( = ?auto_45511 ?auto_45512 ) ) ( not ( = ?auto_45507 ?auto_45512 ) ) ( not ( = ?auto_45509 ?auto_45512 ) ) ( not ( = ?auto_45510 ?auto_45512 ) ) ( not ( = ?auto_45508 ?auto_45512 ) ) ( ON ?auto_45511 ?auto_45506 ) ( ON-TABLE ?auto_45512 ) ( ON ?auto_45508 ?auto_45511 ) ( ON ?auto_45510 ?auto_45508 ) ( ON ?auto_45509 ?auto_45510 ) ( ON ?auto_45507 ?auto_45509 ) ( CLEAR ?auto_45507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45512 ?auto_45506 ?auto_45511 ?auto_45508 ?auto_45510 ?auto_45509 )
      ( MAKE-1PILE ?auto_45506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45517 - BLOCK
      ?auto_45518 - BLOCK
      ?auto_45519 - BLOCK
      ?auto_45520 - BLOCK
    )
    :vars
    (
      ?auto_45521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45521 ?auto_45520 ) ( CLEAR ?auto_45521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45517 ) ( ON ?auto_45518 ?auto_45517 ) ( ON ?auto_45519 ?auto_45518 ) ( ON ?auto_45520 ?auto_45519 ) ( not ( = ?auto_45517 ?auto_45518 ) ) ( not ( = ?auto_45517 ?auto_45519 ) ) ( not ( = ?auto_45517 ?auto_45520 ) ) ( not ( = ?auto_45517 ?auto_45521 ) ) ( not ( = ?auto_45518 ?auto_45519 ) ) ( not ( = ?auto_45518 ?auto_45520 ) ) ( not ( = ?auto_45518 ?auto_45521 ) ) ( not ( = ?auto_45519 ?auto_45520 ) ) ( not ( = ?auto_45519 ?auto_45521 ) ) ( not ( = ?auto_45520 ?auto_45521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45521 ?auto_45520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45522 - BLOCK
      ?auto_45523 - BLOCK
      ?auto_45524 - BLOCK
      ?auto_45525 - BLOCK
    )
    :vars
    (
      ?auto_45526 - BLOCK
      ?auto_45527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45526 ?auto_45525 ) ( CLEAR ?auto_45526 ) ( ON-TABLE ?auto_45522 ) ( ON ?auto_45523 ?auto_45522 ) ( ON ?auto_45524 ?auto_45523 ) ( ON ?auto_45525 ?auto_45524 ) ( not ( = ?auto_45522 ?auto_45523 ) ) ( not ( = ?auto_45522 ?auto_45524 ) ) ( not ( = ?auto_45522 ?auto_45525 ) ) ( not ( = ?auto_45522 ?auto_45526 ) ) ( not ( = ?auto_45523 ?auto_45524 ) ) ( not ( = ?auto_45523 ?auto_45525 ) ) ( not ( = ?auto_45523 ?auto_45526 ) ) ( not ( = ?auto_45524 ?auto_45525 ) ) ( not ( = ?auto_45524 ?auto_45526 ) ) ( not ( = ?auto_45525 ?auto_45526 ) ) ( HOLDING ?auto_45527 ) ( not ( = ?auto_45522 ?auto_45527 ) ) ( not ( = ?auto_45523 ?auto_45527 ) ) ( not ( = ?auto_45524 ?auto_45527 ) ) ( not ( = ?auto_45525 ?auto_45527 ) ) ( not ( = ?auto_45526 ?auto_45527 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_45527 )
      ( MAKE-4PILE ?auto_45522 ?auto_45523 ?auto_45524 ?auto_45525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45528 - BLOCK
      ?auto_45529 - BLOCK
      ?auto_45530 - BLOCK
      ?auto_45531 - BLOCK
    )
    :vars
    (
      ?auto_45532 - BLOCK
      ?auto_45533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45532 ?auto_45531 ) ( ON-TABLE ?auto_45528 ) ( ON ?auto_45529 ?auto_45528 ) ( ON ?auto_45530 ?auto_45529 ) ( ON ?auto_45531 ?auto_45530 ) ( not ( = ?auto_45528 ?auto_45529 ) ) ( not ( = ?auto_45528 ?auto_45530 ) ) ( not ( = ?auto_45528 ?auto_45531 ) ) ( not ( = ?auto_45528 ?auto_45532 ) ) ( not ( = ?auto_45529 ?auto_45530 ) ) ( not ( = ?auto_45529 ?auto_45531 ) ) ( not ( = ?auto_45529 ?auto_45532 ) ) ( not ( = ?auto_45530 ?auto_45531 ) ) ( not ( = ?auto_45530 ?auto_45532 ) ) ( not ( = ?auto_45531 ?auto_45532 ) ) ( not ( = ?auto_45528 ?auto_45533 ) ) ( not ( = ?auto_45529 ?auto_45533 ) ) ( not ( = ?auto_45530 ?auto_45533 ) ) ( not ( = ?auto_45531 ?auto_45533 ) ) ( not ( = ?auto_45532 ?auto_45533 ) ) ( ON ?auto_45533 ?auto_45532 ) ( CLEAR ?auto_45533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45528 ?auto_45529 ?auto_45530 ?auto_45531 ?auto_45532 )
      ( MAKE-4PILE ?auto_45528 ?auto_45529 ?auto_45530 ?auto_45531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45534 - BLOCK
      ?auto_45535 - BLOCK
      ?auto_45536 - BLOCK
      ?auto_45537 - BLOCK
    )
    :vars
    (
      ?auto_45538 - BLOCK
      ?auto_45539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45538 ?auto_45537 ) ( ON-TABLE ?auto_45534 ) ( ON ?auto_45535 ?auto_45534 ) ( ON ?auto_45536 ?auto_45535 ) ( ON ?auto_45537 ?auto_45536 ) ( not ( = ?auto_45534 ?auto_45535 ) ) ( not ( = ?auto_45534 ?auto_45536 ) ) ( not ( = ?auto_45534 ?auto_45537 ) ) ( not ( = ?auto_45534 ?auto_45538 ) ) ( not ( = ?auto_45535 ?auto_45536 ) ) ( not ( = ?auto_45535 ?auto_45537 ) ) ( not ( = ?auto_45535 ?auto_45538 ) ) ( not ( = ?auto_45536 ?auto_45537 ) ) ( not ( = ?auto_45536 ?auto_45538 ) ) ( not ( = ?auto_45537 ?auto_45538 ) ) ( not ( = ?auto_45534 ?auto_45539 ) ) ( not ( = ?auto_45535 ?auto_45539 ) ) ( not ( = ?auto_45536 ?auto_45539 ) ) ( not ( = ?auto_45537 ?auto_45539 ) ) ( not ( = ?auto_45538 ?auto_45539 ) ) ( HOLDING ?auto_45539 ) ( CLEAR ?auto_45538 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45534 ?auto_45535 ?auto_45536 ?auto_45537 ?auto_45538 ?auto_45539 )
      ( MAKE-4PILE ?auto_45534 ?auto_45535 ?auto_45536 ?auto_45537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45540 - BLOCK
      ?auto_45541 - BLOCK
      ?auto_45542 - BLOCK
      ?auto_45543 - BLOCK
    )
    :vars
    (
      ?auto_45544 - BLOCK
      ?auto_45545 - BLOCK
      ?auto_45546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45544 ?auto_45543 ) ( ON-TABLE ?auto_45540 ) ( ON ?auto_45541 ?auto_45540 ) ( ON ?auto_45542 ?auto_45541 ) ( ON ?auto_45543 ?auto_45542 ) ( not ( = ?auto_45540 ?auto_45541 ) ) ( not ( = ?auto_45540 ?auto_45542 ) ) ( not ( = ?auto_45540 ?auto_45543 ) ) ( not ( = ?auto_45540 ?auto_45544 ) ) ( not ( = ?auto_45541 ?auto_45542 ) ) ( not ( = ?auto_45541 ?auto_45543 ) ) ( not ( = ?auto_45541 ?auto_45544 ) ) ( not ( = ?auto_45542 ?auto_45543 ) ) ( not ( = ?auto_45542 ?auto_45544 ) ) ( not ( = ?auto_45543 ?auto_45544 ) ) ( not ( = ?auto_45540 ?auto_45545 ) ) ( not ( = ?auto_45541 ?auto_45545 ) ) ( not ( = ?auto_45542 ?auto_45545 ) ) ( not ( = ?auto_45543 ?auto_45545 ) ) ( not ( = ?auto_45544 ?auto_45545 ) ) ( CLEAR ?auto_45544 ) ( ON ?auto_45545 ?auto_45546 ) ( CLEAR ?auto_45545 ) ( HAND-EMPTY ) ( not ( = ?auto_45540 ?auto_45546 ) ) ( not ( = ?auto_45541 ?auto_45546 ) ) ( not ( = ?auto_45542 ?auto_45546 ) ) ( not ( = ?auto_45543 ?auto_45546 ) ) ( not ( = ?auto_45544 ?auto_45546 ) ) ( not ( = ?auto_45545 ?auto_45546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45545 ?auto_45546 )
      ( MAKE-4PILE ?auto_45540 ?auto_45541 ?auto_45542 ?auto_45543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45561 - BLOCK
      ?auto_45562 - BLOCK
      ?auto_45563 - BLOCK
      ?auto_45564 - BLOCK
    )
    :vars
    (
      ?auto_45567 - BLOCK
      ?auto_45566 - BLOCK
      ?auto_45565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45561 ) ( ON ?auto_45562 ?auto_45561 ) ( ON ?auto_45563 ?auto_45562 ) ( not ( = ?auto_45561 ?auto_45562 ) ) ( not ( = ?auto_45561 ?auto_45563 ) ) ( not ( = ?auto_45561 ?auto_45564 ) ) ( not ( = ?auto_45561 ?auto_45567 ) ) ( not ( = ?auto_45562 ?auto_45563 ) ) ( not ( = ?auto_45562 ?auto_45564 ) ) ( not ( = ?auto_45562 ?auto_45567 ) ) ( not ( = ?auto_45563 ?auto_45564 ) ) ( not ( = ?auto_45563 ?auto_45567 ) ) ( not ( = ?auto_45564 ?auto_45567 ) ) ( not ( = ?auto_45561 ?auto_45566 ) ) ( not ( = ?auto_45562 ?auto_45566 ) ) ( not ( = ?auto_45563 ?auto_45566 ) ) ( not ( = ?auto_45564 ?auto_45566 ) ) ( not ( = ?auto_45567 ?auto_45566 ) ) ( ON ?auto_45566 ?auto_45565 ) ( not ( = ?auto_45561 ?auto_45565 ) ) ( not ( = ?auto_45562 ?auto_45565 ) ) ( not ( = ?auto_45563 ?auto_45565 ) ) ( not ( = ?auto_45564 ?auto_45565 ) ) ( not ( = ?auto_45567 ?auto_45565 ) ) ( not ( = ?auto_45566 ?auto_45565 ) ) ( ON ?auto_45567 ?auto_45566 ) ( CLEAR ?auto_45567 ) ( HOLDING ?auto_45564 ) ( CLEAR ?auto_45563 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45561 ?auto_45562 ?auto_45563 ?auto_45564 ?auto_45567 )
      ( MAKE-4PILE ?auto_45561 ?auto_45562 ?auto_45563 ?auto_45564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45568 - BLOCK
      ?auto_45569 - BLOCK
      ?auto_45570 - BLOCK
      ?auto_45571 - BLOCK
    )
    :vars
    (
      ?auto_45574 - BLOCK
      ?auto_45573 - BLOCK
      ?auto_45572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45568 ) ( ON ?auto_45569 ?auto_45568 ) ( ON ?auto_45570 ?auto_45569 ) ( not ( = ?auto_45568 ?auto_45569 ) ) ( not ( = ?auto_45568 ?auto_45570 ) ) ( not ( = ?auto_45568 ?auto_45571 ) ) ( not ( = ?auto_45568 ?auto_45574 ) ) ( not ( = ?auto_45569 ?auto_45570 ) ) ( not ( = ?auto_45569 ?auto_45571 ) ) ( not ( = ?auto_45569 ?auto_45574 ) ) ( not ( = ?auto_45570 ?auto_45571 ) ) ( not ( = ?auto_45570 ?auto_45574 ) ) ( not ( = ?auto_45571 ?auto_45574 ) ) ( not ( = ?auto_45568 ?auto_45573 ) ) ( not ( = ?auto_45569 ?auto_45573 ) ) ( not ( = ?auto_45570 ?auto_45573 ) ) ( not ( = ?auto_45571 ?auto_45573 ) ) ( not ( = ?auto_45574 ?auto_45573 ) ) ( ON ?auto_45573 ?auto_45572 ) ( not ( = ?auto_45568 ?auto_45572 ) ) ( not ( = ?auto_45569 ?auto_45572 ) ) ( not ( = ?auto_45570 ?auto_45572 ) ) ( not ( = ?auto_45571 ?auto_45572 ) ) ( not ( = ?auto_45574 ?auto_45572 ) ) ( not ( = ?auto_45573 ?auto_45572 ) ) ( ON ?auto_45574 ?auto_45573 ) ( CLEAR ?auto_45570 ) ( ON ?auto_45571 ?auto_45574 ) ( CLEAR ?auto_45571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45572 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45572 ?auto_45573 ?auto_45574 )
      ( MAKE-4PILE ?auto_45568 ?auto_45569 ?auto_45570 ?auto_45571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45575 - BLOCK
      ?auto_45576 - BLOCK
      ?auto_45577 - BLOCK
      ?auto_45578 - BLOCK
    )
    :vars
    (
      ?auto_45580 - BLOCK
      ?auto_45581 - BLOCK
      ?auto_45579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45575 ) ( ON ?auto_45576 ?auto_45575 ) ( not ( = ?auto_45575 ?auto_45576 ) ) ( not ( = ?auto_45575 ?auto_45577 ) ) ( not ( = ?auto_45575 ?auto_45578 ) ) ( not ( = ?auto_45575 ?auto_45580 ) ) ( not ( = ?auto_45576 ?auto_45577 ) ) ( not ( = ?auto_45576 ?auto_45578 ) ) ( not ( = ?auto_45576 ?auto_45580 ) ) ( not ( = ?auto_45577 ?auto_45578 ) ) ( not ( = ?auto_45577 ?auto_45580 ) ) ( not ( = ?auto_45578 ?auto_45580 ) ) ( not ( = ?auto_45575 ?auto_45581 ) ) ( not ( = ?auto_45576 ?auto_45581 ) ) ( not ( = ?auto_45577 ?auto_45581 ) ) ( not ( = ?auto_45578 ?auto_45581 ) ) ( not ( = ?auto_45580 ?auto_45581 ) ) ( ON ?auto_45581 ?auto_45579 ) ( not ( = ?auto_45575 ?auto_45579 ) ) ( not ( = ?auto_45576 ?auto_45579 ) ) ( not ( = ?auto_45577 ?auto_45579 ) ) ( not ( = ?auto_45578 ?auto_45579 ) ) ( not ( = ?auto_45580 ?auto_45579 ) ) ( not ( = ?auto_45581 ?auto_45579 ) ) ( ON ?auto_45580 ?auto_45581 ) ( ON ?auto_45578 ?auto_45580 ) ( CLEAR ?auto_45578 ) ( ON-TABLE ?auto_45579 ) ( HOLDING ?auto_45577 ) ( CLEAR ?auto_45576 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45575 ?auto_45576 ?auto_45577 )
      ( MAKE-4PILE ?auto_45575 ?auto_45576 ?auto_45577 ?auto_45578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45582 - BLOCK
      ?auto_45583 - BLOCK
      ?auto_45584 - BLOCK
      ?auto_45585 - BLOCK
    )
    :vars
    (
      ?auto_45588 - BLOCK
      ?auto_45587 - BLOCK
      ?auto_45586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45582 ) ( ON ?auto_45583 ?auto_45582 ) ( not ( = ?auto_45582 ?auto_45583 ) ) ( not ( = ?auto_45582 ?auto_45584 ) ) ( not ( = ?auto_45582 ?auto_45585 ) ) ( not ( = ?auto_45582 ?auto_45588 ) ) ( not ( = ?auto_45583 ?auto_45584 ) ) ( not ( = ?auto_45583 ?auto_45585 ) ) ( not ( = ?auto_45583 ?auto_45588 ) ) ( not ( = ?auto_45584 ?auto_45585 ) ) ( not ( = ?auto_45584 ?auto_45588 ) ) ( not ( = ?auto_45585 ?auto_45588 ) ) ( not ( = ?auto_45582 ?auto_45587 ) ) ( not ( = ?auto_45583 ?auto_45587 ) ) ( not ( = ?auto_45584 ?auto_45587 ) ) ( not ( = ?auto_45585 ?auto_45587 ) ) ( not ( = ?auto_45588 ?auto_45587 ) ) ( ON ?auto_45587 ?auto_45586 ) ( not ( = ?auto_45582 ?auto_45586 ) ) ( not ( = ?auto_45583 ?auto_45586 ) ) ( not ( = ?auto_45584 ?auto_45586 ) ) ( not ( = ?auto_45585 ?auto_45586 ) ) ( not ( = ?auto_45588 ?auto_45586 ) ) ( not ( = ?auto_45587 ?auto_45586 ) ) ( ON ?auto_45588 ?auto_45587 ) ( ON ?auto_45585 ?auto_45588 ) ( ON-TABLE ?auto_45586 ) ( CLEAR ?auto_45583 ) ( ON ?auto_45584 ?auto_45585 ) ( CLEAR ?auto_45584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45586 ?auto_45587 ?auto_45588 ?auto_45585 )
      ( MAKE-4PILE ?auto_45582 ?auto_45583 ?auto_45584 ?auto_45585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45589 - BLOCK
      ?auto_45590 - BLOCK
      ?auto_45591 - BLOCK
      ?auto_45592 - BLOCK
    )
    :vars
    (
      ?auto_45595 - BLOCK
      ?auto_45593 - BLOCK
      ?auto_45594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45589 ) ( not ( = ?auto_45589 ?auto_45590 ) ) ( not ( = ?auto_45589 ?auto_45591 ) ) ( not ( = ?auto_45589 ?auto_45592 ) ) ( not ( = ?auto_45589 ?auto_45595 ) ) ( not ( = ?auto_45590 ?auto_45591 ) ) ( not ( = ?auto_45590 ?auto_45592 ) ) ( not ( = ?auto_45590 ?auto_45595 ) ) ( not ( = ?auto_45591 ?auto_45592 ) ) ( not ( = ?auto_45591 ?auto_45595 ) ) ( not ( = ?auto_45592 ?auto_45595 ) ) ( not ( = ?auto_45589 ?auto_45593 ) ) ( not ( = ?auto_45590 ?auto_45593 ) ) ( not ( = ?auto_45591 ?auto_45593 ) ) ( not ( = ?auto_45592 ?auto_45593 ) ) ( not ( = ?auto_45595 ?auto_45593 ) ) ( ON ?auto_45593 ?auto_45594 ) ( not ( = ?auto_45589 ?auto_45594 ) ) ( not ( = ?auto_45590 ?auto_45594 ) ) ( not ( = ?auto_45591 ?auto_45594 ) ) ( not ( = ?auto_45592 ?auto_45594 ) ) ( not ( = ?auto_45595 ?auto_45594 ) ) ( not ( = ?auto_45593 ?auto_45594 ) ) ( ON ?auto_45595 ?auto_45593 ) ( ON ?auto_45592 ?auto_45595 ) ( ON-TABLE ?auto_45594 ) ( ON ?auto_45591 ?auto_45592 ) ( CLEAR ?auto_45591 ) ( HOLDING ?auto_45590 ) ( CLEAR ?auto_45589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45589 ?auto_45590 )
      ( MAKE-4PILE ?auto_45589 ?auto_45590 ?auto_45591 ?auto_45592 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45596 - BLOCK
      ?auto_45597 - BLOCK
      ?auto_45598 - BLOCK
      ?auto_45599 - BLOCK
    )
    :vars
    (
      ?auto_45601 - BLOCK
      ?auto_45600 - BLOCK
      ?auto_45602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45596 ) ( not ( = ?auto_45596 ?auto_45597 ) ) ( not ( = ?auto_45596 ?auto_45598 ) ) ( not ( = ?auto_45596 ?auto_45599 ) ) ( not ( = ?auto_45596 ?auto_45601 ) ) ( not ( = ?auto_45597 ?auto_45598 ) ) ( not ( = ?auto_45597 ?auto_45599 ) ) ( not ( = ?auto_45597 ?auto_45601 ) ) ( not ( = ?auto_45598 ?auto_45599 ) ) ( not ( = ?auto_45598 ?auto_45601 ) ) ( not ( = ?auto_45599 ?auto_45601 ) ) ( not ( = ?auto_45596 ?auto_45600 ) ) ( not ( = ?auto_45597 ?auto_45600 ) ) ( not ( = ?auto_45598 ?auto_45600 ) ) ( not ( = ?auto_45599 ?auto_45600 ) ) ( not ( = ?auto_45601 ?auto_45600 ) ) ( ON ?auto_45600 ?auto_45602 ) ( not ( = ?auto_45596 ?auto_45602 ) ) ( not ( = ?auto_45597 ?auto_45602 ) ) ( not ( = ?auto_45598 ?auto_45602 ) ) ( not ( = ?auto_45599 ?auto_45602 ) ) ( not ( = ?auto_45601 ?auto_45602 ) ) ( not ( = ?auto_45600 ?auto_45602 ) ) ( ON ?auto_45601 ?auto_45600 ) ( ON ?auto_45599 ?auto_45601 ) ( ON-TABLE ?auto_45602 ) ( ON ?auto_45598 ?auto_45599 ) ( CLEAR ?auto_45596 ) ( ON ?auto_45597 ?auto_45598 ) ( CLEAR ?auto_45597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45602 ?auto_45600 ?auto_45601 ?auto_45599 ?auto_45598 )
      ( MAKE-4PILE ?auto_45596 ?auto_45597 ?auto_45598 ?auto_45599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45603 - BLOCK
      ?auto_45604 - BLOCK
      ?auto_45605 - BLOCK
      ?auto_45606 - BLOCK
    )
    :vars
    (
      ?auto_45609 - BLOCK
      ?auto_45607 - BLOCK
      ?auto_45608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45603 ?auto_45604 ) ) ( not ( = ?auto_45603 ?auto_45605 ) ) ( not ( = ?auto_45603 ?auto_45606 ) ) ( not ( = ?auto_45603 ?auto_45609 ) ) ( not ( = ?auto_45604 ?auto_45605 ) ) ( not ( = ?auto_45604 ?auto_45606 ) ) ( not ( = ?auto_45604 ?auto_45609 ) ) ( not ( = ?auto_45605 ?auto_45606 ) ) ( not ( = ?auto_45605 ?auto_45609 ) ) ( not ( = ?auto_45606 ?auto_45609 ) ) ( not ( = ?auto_45603 ?auto_45607 ) ) ( not ( = ?auto_45604 ?auto_45607 ) ) ( not ( = ?auto_45605 ?auto_45607 ) ) ( not ( = ?auto_45606 ?auto_45607 ) ) ( not ( = ?auto_45609 ?auto_45607 ) ) ( ON ?auto_45607 ?auto_45608 ) ( not ( = ?auto_45603 ?auto_45608 ) ) ( not ( = ?auto_45604 ?auto_45608 ) ) ( not ( = ?auto_45605 ?auto_45608 ) ) ( not ( = ?auto_45606 ?auto_45608 ) ) ( not ( = ?auto_45609 ?auto_45608 ) ) ( not ( = ?auto_45607 ?auto_45608 ) ) ( ON ?auto_45609 ?auto_45607 ) ( ON ?auto_45606 ?auto_45609 ) ( ON-TABLE ?auto_45608 ) ( ON ?auto_45605 ?auto_45606 ) ( ON ?auto_45604 ?auto_45605 ) ( CLEAR ?auto_45604 ) ( HOLDING ?auto_45603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45603 )
      ( MAKE-4PILE ?auto_45603 ?auto_45604 ?auto_45605 ?auto_45606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45610 - BLOCK
      ?auto_45611 - BLOCK
      ?auto_45612 - BLOCK
      ?auto_45613 - BLOCK
    )
    :vars
    (
      ?auto_45616 - BLOCK
      ?auto_45615 - BLOCK
      ?auto_45614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45610 ?auto_45611 ) ) ( not ( = ?auto_45610 ?auto_45612 ) ) ( not ( = ?auto_45610 ?auto_45613 ) ) ( not ( = ?auto_45610 ?auto_45616 ) ) ( not ( = ?auto_45611 ?auto_45612 ) ) ( not ( = ?auto_45611 ?auto_45613 ) ) ( not ( = ?auto_45611 ?auto_45616 ) ) ( not ( = ?auto_45612 ?auto_45613 ) ) ( not ( = ?auto_45612 ?auto_45616 ) ) ( not ( = ?auto_45613 ?auto_45616 ) ) ( not ( = ?auto_45610 ?auto_45615 ) ) ( not ( = ?auto_45611 ?auto_45615 ) ) ( not ( = ?auto_45612 ?auto_45615 ) ) ( not ( = ?auto_45613 ?auto_45615 ) ) ( not ( = ?auto_45616 ?auto_45615 ) ) ( ON ?auto_45615 ?auto_45614 ) ( not ( = ?auto_45610 ?auto_45614 ) ) ( not ( = ?auto_45611 ?auto_45614 ) ) ( not ( = ?auto_45612 ?auto_45614 ) ) ( not ( = ?auto_45613 ?auto_45614 ) ) ( not ( = ?auto_45616 ?auto_45614 ) ) ( not ( = ?auto_45615 ?auto_45614 ) ) ( ON ?auto_45616 ?auto_45615 ) ( ON ?auto_45613 ?auto_45616 ) ( ON-TABLE ?auto_45614 ) ( ON ?auto_45612 ?auto_45613 ) ( ON ?auto_45611 ?auto_45612 ) ( ON ?auto_45610 ?auto_45611 ) ( CLEAR ?auto_45610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45614 ?auto_45615 ?auto_45616 ?auto_45613 ?auto_45612 ?auto_45611 )
      ( MAKE-4PILE ?auto_45610 ?auto_45611 ?auto_45612 ?auto_45613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45619 - BLOCK
      ?auto_45620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45620 ) ( CLEAR ?auto_45619 ) ( ON-TABLE ?auto_45619 ) ( not ( = ?auto_45619 ?auto_45620 ) ) )
    :subtasks
    ( ( !STACK ?auto_45620 ?auto_45619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45621 - BLOCK
      ?auto_45622 - BLOCK
    )
    :vars
    (
      ?auto_45623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45621 ) ( ON-TABLE ?auto_45621 ) ( not ( = ?auto_45621 ?auto_45622 ) ) ( ON ?auto_45622 ?auto_45623 ) ( CLEAR ?auto_45622 ) ( HAND-EMPTY ) ( not ( = ?auto_45621 ?auto_45623 ) ) ( not ( = ?auto_45622 ?auto_45623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45622 ?auto_45623 )
      ( MAKE-2PILE ?auto_45621 ?auto_45622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45624 - BLOCK
      ?auto_45625 - BLOCK
    )
    :vars
    (
      ?auto_45626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45624 ?auto_45625 ) ) ( ON ?auto_45625 ?auto_45626 ) ( CLEAR ?auto_45625 ) ( not ( = ?auto_45624 ?auto_45626 ) ) ( not ( = ?auto_45625 ?auto_45626 ) ) ( HOLDING ?auto_45624 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45624 )
      ( MAKE-2PILE ?auto_45624 ?auto_45625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45627 - BLOCK
      ?auto_45628 - BLOCK
    )
    :vars
    (
      ?auto_45629 - BLOCK
      ?auto_45631 - BLOCK
      ?auto_45632 - BLOCK
      ?auto_45630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45627 ?auto_45628 ) ) ( ON ?auto_45628 ?auto_45629 ) ( not ( = ?auto_45627 ?auto_45629 ) ) ( not ( = ?auto_45628 ?auto_45629 ) ) ( ON ?auto_45627 ?auto_45628 ) ( CLEAR ?auto_45627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45631 ) ( ON ?auto_45632 ?auto_45631 ) ( ON ?auto_45630 ?auto_45632 ) ( ON ?auto_45629 ?auto_45630 ) ( not ( = ?auto_45631 ?auto_45632 ) ) ( not ( = ?auto_45631 ?auto_45630 ) ) ( not ( = ?auto_45631 ?auto_45629 ) ) ( not ( = ?auto_45631 ?auto_45628 ) ) ( not ( = ?auto_45631 ?auto_45627 ) ) ( not ( = ?auto_45632 ?auto_45630 ) ) ( not ( = ?auto_45632 ?auto_45629 ) ) ( not ( = ?auto_45632 ?auto_45628 ) ) ( not ( = ?auto_45632 ?auto_45627 ) ) ( not ( = ?auto_45630 ?auto_45629 ) ) ( not ( = ?auto_45630 ?auto_45628 ) ) ( not ( = ?auto_45630 ?auto_45627 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45631 ?auto_45632 ?auto_45630 ?auto_45629 ?auto_45628 )
      ( MAKE-2PILE ?auto_45627 ?auto_45628 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45633 - BLOCK
      ?auto_45634 - BLOCK
    )
    :vars
    (
      ?auto_45638 - BLOCK
      ?auto_45636 - BLOCK
      ?auto_45635 - BLOCK
      ?auto_45637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45633 ?auto_45634 ) ) ( ON ?auto_45634 ?auto_45638 ) ( not ( = ?auto_45633 ?auto_45638 ) ) ( not ( = ?auto_45634 ?auto_45638 ) ) ( ON-TABLE ?auto_45636 ) ( ON ?auto_45635 ?auto_45636 ) ( ON ?auto_45637 ?auto_45635 ) ( ON ?auto_45638 ?auto_45637 ) ( not ( = ?auto_45636 ?auto_45635 ) ) ( not ( = ?auto_45636 ?auto_45637 ) ) ( not ( = ?auto_45636 ?auto_45638 ) ) ( not ( = ?auto_45636 ?auto_45634 ) ) ( not ( = ?auto_45636 ?auto_45633 ) ) ( not ( = ?auto_45635 ?auto_45637 ) ) ( not ( = ?auto_45635 ?auto_45638 ) ) ( not ( = ?auto_45635 ?auto_45634 ) ) ( not ( = ?auto_45635 ?auto_45633 ) ) ( not ( = ?auto_45637 ?auto_45638 ) ) ( not ( = ?auto_45637 ?auto_45634 ) ) ( not ( = ?auto_45637 ?auto_45633 ) ) ( HOLDING ?auto_45633 ) ( CLEAR ?auto_45634 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45636 ?auto_45635 ?auto_45637 ?auto_45638 ?auto_45634 ?auto_45633 )
      ( MAKE-2PILE ?auto_45633 ?auto_45634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45639 - BLOCK
      ?auto_45640 - BLOCK
    )
    :vars
    (
      ?auto_45642 - BLOCK
      ?auto_45641 - BLOCK
      ?auto_45643 - BLOCK
      ?auto_45644 - BLOCK
      ?auto_45645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45639 ?auto_45640 ) ) ( ON ?auto_45640 ?auto_45642 ) ( not ( = ?auto_45639 ?auto_45642 ) ) ( not ( = ?auto_45640 ?auto_45642 ) ) ( ON-TABLE ?auto_45641 ) ( ON ?auto_45643 ?auto_45641 ) ( ON ?auto_45644 ?auto_45643 ) ( ON ?auto_45642 ?auto_45644 ) ( not ( = ?auto_45641 ?auto_45643 ) ) ( not ( = ?auto_45641 ?auto_45644 ) ) ( not ( = ?auto_45641 ?auto_45642 ) ) ( not ( = ?auto_45641 ?auto_45640 ) ) ( not ( = ?auto_45641 ?auto_45639 ) ) ( not ( = ?auto_45643 ?auto_45644 ) ) ( not ( = ?auto_45643 ?auto_45642 ) ) ( not ( = ?auto_45643 ?auto_45640 ) ) ( not ( = ?auto_45643 ?auto_45639 ) ) ( not ( = ?auto_45644 ?auto_45642 ) ) ( not ( = ?auto_45644 ?auto_45640 ) ) ( not ( = ?auto_45644 ?auto_45639 ) ) ( CLEAR ?auto_45640 ) ( ON ?auto_45639 ?auto_45645 ) ( CLEAR ?auto_45639 ) ( HAND-EMPTY ) ( not ( = ?auto_45639 ?auto_45645 ) ) ( not ( = ?auto_45640 ?auto_45645 ) ) ( not ( = ?auto_45642 ?auto_45645 ) ) ( not ( = ?auto_45641 ?auto_45645 ) ) ( not ( = ?auto_45643 ?auto_45645 ) ) ( not ( = ?auto_45644 ?auto_45645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45639 ?auto_45645 )
      ( MAKE-2PILE ?auto_45639 ?auto_45640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45646 - BLOCK
      ?auto_45647 - BLOCK
    )
    :vars
    (
      ?auto_45652 - BLOCK
      ?auto_45651 - BLOCK
      ?auto_45649 - BLOCK
      ?auto_45648 - BLOCK
      ?auto_45650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45646 ?auto_45647 ) ) ( not ( = ?auto_45646 ?auto_45652 ) ) ( not ( = ?auto_45647 ?auto_45652 ) ) ( ON-TABLE ?auto_45651 ) ( ON ?auto_45649 ?auto_45651 ) ( ON ?auto_45648 ?auto_45649 ) ( ON ?auto_45652 ?auto_45648 ) ( not ( = ?auto_45651 ?auto_45649 ) ) ( not ( = ?auto_45651 ?auto_45648 ) ) ( not ( = ?auto_45651 ?auto_45652 ) ) ( not ( = ?auto_45651 ?auto_45647 ) ) ( not ( = ?auto_45651 ?auto_45646 ) ) ( not ( = ?auto_45649 ?auto_45648 ) ) ( not ( = ?auto_45649 ?auto_45652 ) ) ( not ( = ?auto_45649 ?auto_45647 ) ) ( not ( = ?auto_45649 ?auto_45646 ) ) ( not ( = ?auto_45648 ?auto_45652 ) ) ( not ( = ?auto_45648 ?auto_45647 ) ) ( not ( = ?auto_45648 ?auto_45646 ) ) ( ON ?auto_45646 ?auto_45650 ) ( CLEAR ?auto_45646 ) ( not ( = ?auto_45646 ?auto_45650 ) ) ( not ( = ?auto_45647 ?auto_45650 ) ) ( not ( = ?auto_45652 ?auto_45650 ) ) ( not ( = ?auto_45651 ?auto_45650 ) ) ( not ( = ?auto_45649 ?auto_45650 ) ) ( not ( = ?auto_45648 ?auto_45650 ) ) ( HOLDING ?auto_45647 ) ( CLEAR ?auto_45652 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45651 ?auto_45649 ?auto_45648 ?auto_45652 ?auto_45647 )
      ( MAKE-2PILE ?auto_45646 ?auto_45647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45653 - BLOCK
      ?auto_45654 - BLOCK
    )
    :vars
    (
      ?auto_45657 - BLOCK
      ?auto_45656 - BLOCK
      ?auto_45659 - BLOCK
      ?auto_45658 - BLOCK
      ?auto_45655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45653 ?auto_45654 ) ) ( not ( = ?auto_45653 ?auto_45657 ) ) ( not ( = ?auto_45654 ?auto_45657 ) ) ( ON-TABLE ?auto_45656 ) ( ON ?auto_45659 ?auto_45656 ) ( ON ?auto_45658 ?auto_45659 ) ( ON ?auto_45657 ?auto_45658 ) ( not ( = ?auto_45656 ?auto_45659 ) ) ( not ( = ?auto_45656 ?auto_45658 ) ) ( not ( = ?auto_45656 ?auto_45657 ) ) ( not ( = ?auto_45656 ?auto_45654 ) ) ( not ( = ?auto_45656 ?auto_45653 ) ) ( not ( = ?auto_45659 ?auto_45658 ) ) ( not ( = ?auto_45659 ?auto_45657 ) ) ( not ( = ?auto_45659 ?auto_45654 ) ) ( not ( = ?auto_45659 ?auto_45653 ) ) ( not ( = ?auto_45658 ?auto_45657 ) ) ( not ( = ?auto_45658 ?auto_45654 ) ) ( not ( = ?auto_45658 ?auto_45653 ) ) ( ON ?auto_45653 ?auto_45655 ) ( not ( = ?auto_45653 ?auto_45655 ) ) ( not ( = ?auto_45654 ?auto_45655 ) ) ( not ( = ?auto_45657 ?auto_45655 ) ) ( not ( = ?auto_45656 ?auto_45655 ) ) ( not ( = ?auto_45659 ?auto_45655 ) ) ( not ( = ?auto_45658 ?auto_45655 ) ) ( CLEAR ?auto_45657 ) ( ON ?auto_45654 ?auto_45653 ) ( CLEAR ?auto_45654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45655 ?auto_45653 )
      ( MAKE-2PILE ?auto_45653 ?auto_45654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45660 - BLOCK
      ?auto_45661 - BLOCK
    )
    :vars
    (
      ?auto_45665 - BLOCK
      ?auto_45663 - BLOCK
      ?auto_45662 - BLOCK
      ?auto_45666 - BLOCK
      ?auto_45664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45660 ?auto_45661 ) ) ( not ( = ?auto_45660 ?auto_45665 ) ) ( not ( = ?auto_45661 ?auto_45665 ) ) ( ON-TABLE ?auto_45663 ) ( ON ?auto_45662 ?auto_45663 ) ( ON ?auto_45666 ?auto_45662 ) ( not ( = ?auto_45663 ?auto_45662 ) ) ( not ( = ?auto_45663 ?auto_45666 ) ) ( not ( = ?auto_45663 ?auto_45665 ) ) ( not ( = ?auto_45663 ?auto_45661 ) ) ( not ( = ?auto_45663 ?auto_45660 ) ) ( not ( = ?auto_45662 ?auto_45666 ) ) ( not ( = ?auto_45662 ?auto_45665 ) ) ( not ( = ?auto_45662 ?auto_45661 ) ) ( not ( = ?auto_45662 ?auto_45660 ) ) ( not ( = ?auto_45666 ?auto_45665 ) ) ( not ( = ?auto_45666 ?auto_45661 ) ) ( not ( = ?auto_45666 ?auto_45660 ) ) ( ON ?auto_45660 ?auto_45664 ) ( not ( = ?auto_45660 ?auto_45664 ) ) ( not ( = ?auto_45661 ?auto_45664 ) ) ( not ( = ?auto_45665 ?auto_45664 ) ) ( not ( = ?auto_45663 ?auto_45664 ) ) ( not ( = ?auto_45662 ?auto_45664 ) ) ( not ( = ?auto_45666 ?auto_45664 ) ) ( ON ?auto_45661 ?auto_45660 ) ( CLEAR ?auto_45661 ) ( ON-TABLE ?auto_45664 ) ( HOLDING ?auto_45665 ) ( CLEAR ?auto_45666 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45663 ?auto_45662 ?auto_45666 ?auto_45665 )
      ( MAKE-2PILE ?auto_45660 ?auto_45661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45667 - BLOCK
      ?auto_45668 - BLOCK
    )
    :vars
    (
      ?auto_45672 - BLOCK
      ?auto_45671 - BLOCK
      ?auto_45673 - BLOCK
      ?auto_45670 - BLOCK
      ?auto_45669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45667 ?auto_45668 ) ) ( not ( = ?auto_45667 ?auto_45672 ) ) ( not ( = ?auto_45668 ?auto_45672 ) ) ( ON-TABLE ?auto_45671 ) ( ON ?auto_45673 ?auto_45671 ) ( ON ?auto_45670 ?auto_45673 ) ( not ( = ?auto_45671 ?auto_45673 ) ) ( not ( = ?auto_45671 ?auto_45670 ) ) ( not ( = ?auto_45671 ?auto_45672 ) ) ( not ( = ?auto_45671 ?auto_45668 ) ) ( not ( = ?auto_45671 ?auto_45667 ) ) ( not ( = ?auto_45673 ?auto_45670 ) ) ( not ( = ?auto_45673 ?auto_45672 ) ) ( not ( = ?auto_45673 ?auto_45668 ) ) ( not ( = ?auto_45673 ?auto_45667 ) ) ( not ( = ?auto_45670 ?auto_45672 ) ) ( not ( = ?auto_45670 ?auto_45668 ) ) ( not ( = ?auto_45670 ?auto_45667 ) ) ( ON ?auto_45667 ?auto_45669 ) ( not ( = ?auto_45667 ?auto_45669 ) ) ( not ( = ?auto_45668 ?auto_45669 ) ) ( not ( = ?auto_45672 ?auto_45669 ) ) ( not ( = ?auto_45671 ?auto_45669 ) ) ( not ( = ?auto_45673 ?auto_45669 ) ) ( not ( = ?auto_45670 ?auto_45669 ) ) ( ON ?auto_45668 ?auto_45667 ) ( ON-TABLE ?auto_45669 ) ( CLEAR ?auto_45670 ) ( ON ?auto_45672 ?auto_45668 ) ( CLEAR ?auto_45672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45669 ?auto_45667 ?auto_45668 )
      ( MAKE-2PILE ?auto_45667 ?auto_45668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45674 - BLOCK
      ?auto_45675 - BLOCK
    )
    :vars
    (
      ?auto_45679 - BLOCK
      ?auto_45676 - BLOCK
      ?auto_45678 - BLOCK
      ?auto_45680 - BLOCK
      ?auto_45677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45674 ?auto_45675 ) ) ( not ( = ?auto_45674 ?auto_45679 ) ) ( not ( = ?auto_45675 ?auto_45679 ) ) ( ON-TABLE ?auto_45676 ) ( ON ?auto_45678 ?auto_45676 ) ( not ( = ?auto_45676 ?auto_45678 ) ) ( not ( = ?auto_45676 ?auto_45680 ) ) ( not ( = ?auto_45676 ?auto_45679 ) ) ( not ( = ?auto_45676 ?auto_45675 ) ) ( not ( = ?auto_45676 ?auto_45674 ) ) ( not ( = ?auto_45678 ?auto_45680 ) ) ( not ( = ?auto_45678 ?auto_45679 ) ) ( not ( = ?auto_45678 ?auto_45675 ) ) ( not ( = ?auto_45678 ?auto_45674 ) ) ( not ( = ?auto_45680 ?auto_45679 ) ) ( not ( = ?auto_45680 ?auto_45675 ) ) ( not ( = ?auto_45680 ?auto_45674 ) ) ( ON ?auto_45674 ?auto_45677 ) ( not ( = ?auto_45674 ?auto_45677 ) ) ( not ( = ?auto_45675 ?auto_45677 ) ) ( not ( = ?auto_45679 ?auto_45677 ) ) ( not ( = ?auto_45676 ?auto_45677 ) ) ( not ( = ?auto_45678 ?auto_45677 ) ) ( not ( = ?auto_45680 ?auto_45677 ) ) ( ON ?auto_45675 ?auto_45674 ) ( ON-TABLE ?auto_45677 ) ( ON ?auto_45679 ?auto_45675 ) ( CLEAR ?auto_45679 ) ( HOLDING ?auto_45680 ) ( CLEAR ?auto_45678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45676 ?auto_45678 ?auto_45680 )
      ( MAKE-2PILE ?auto_45674 ?auto_45675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45681 - BLOCK
      ?auto_45682 - BLOCK
    )
    :vars
    (
      ?auto_45686 - BLOCK
      ?auto_45687 - BLOCK
      ?auto_45685 - BLOCK
      ?auto_45684 - BLOCK
      ?auto_45683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45681 ?auto_45682 ) ) ( not ( = ?auto_45681 ?auto_45686 ) ) ( not ( = ?auto_45682 ?auto_45686 ) ) ( ON-TABLE ?auto_45687 ) ( ON ?auto_45685 ?auto_45687 ) ( not ( = ?auto_45687 ?auto_45685 ) ) ( not ( = ?auto_45687 ?auto_45684 ) ) ( not ( = ?auto_45687 ?auto_45686 ) ) ( not ( = ?auto_45687 ?auto_45682 ) ) ( not ( = ?auto_45687 ?auto_45681 ) ) ( not ( = ?auto_45685 ?auto_45684 ) ) ( not ( = ?auto_45685 ?auto_45686 ) ) ( not ( = ?auto_45685 ?auto_45682 ) ) ( not ( = ?auto_45685 ?auto_45681 ) ) ( not ( = ?auto_45684 ?auto_45686 ) ) ( not ( = ?auto_45684 ?auto_45682 ) ) ( not ( = ?auto_45684 ?auto_45681 ) ) ( ON ?auto_45681 ?auto_45683 ) ( not ( = ?auto_45681 ?auto_45683 ) ) ( not ( = ?auto_45682 ?auto_45683 ) ) ( not ( = ?auto_45686 ?auto_45683 ) ) ( not ( = ?auto_45687 ?auto_45683 ) ) ( not ( = ?auto_45685 ?auto_45683 ) ) ( not ( = ?auto_45684 ?auto_45683 ) ) ( ON ?auto_45682 ?auto_45681 ) ( ON-TABLE ?auto_45683 ) ( ON ?auto_45686 ?auto_45682 ) ( CLEAR ?auto_45685 ) ( ON ?auto_45684 ?auto_45686 ) ( CLEAR ?auto_45684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45683 ?auto_45681 ?auto_45682 ?auto_45686 )
      ( MAKE-2PILE ?auto_45681 ?auto_45682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45688 - BLOCK
      ?auto_45689 - BLOCK
    )
    :vars
    (
      ?auto_45693 - BLOCK
      ?auto_45694 - BLOCK
      ?auto_45690 - BLOCK
      ?auto_45691 - BLOCK
      ?auto_45692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45688 ?auto_45689 ) ) ( not ( = ?auto_45688 ?auto_45693 ) ) ( not ( = ?auto_45689 ?auto_45693 ) ) ( ON-TABLE ?auto_45694 ) ( not ( = ?auto_45694 ?auto_45690 ) ) ( not ( = ?auto_45694 ?auto_45691 ) ) ( not ( = ?auto_45694 ?auto_45693 ) ) ( not ( = ?auto_45694 ?auto_45689 ) ) ( not ( = ?auto_45694 ?auto_45688 ) ) ( not ( = ?auto_45690 ?auto_45691 ) ) ( not ( = ?auto_45690 ?auto_45693 ) ) ( not ( = ?auto_45690 ?auto_45689 ) ) ( not ( = ?auto_45690 ?auto_45688 ) ) ( not ( = ?auto_45691 ?auto_45693 ) ) ( not ( = ?auto_45691 ?auto_45689 ) ) ( not ( = ?auto_45691 ?auto_45688 ) ) ( ON ?auto_45688 ?auto_45692 ) ( not ( = ?auto_45688 ?auto_45692 ) ) ( not ( = ?auto_45689 ?auto_45692 ) ) ( not ( = ?auto_45693 ?auto_45692 ) ) ( not ( = ?auto_45694 ?auto_45692 ) ) ( not ( = ?auto_45690 ?auto_45692 ) ) ( not ( = ?auto_45691 ?auto_45692 ) ) ( ON ?auto_45689 ?auto_45688 ) ( ON-TABLE ?auto_45692 ) ( ON ?auto_45693 ?auto_45689 ) ( ON ?auto_45691 ?auto_45693 ) ( CLEAR ?auto_45691 ) ( HOLDING ?auto_45690 ) ( CLEAR ?auto_45694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45694 ?auto_45690 )
      ( MAKE-2PILE ?auto_45688 ?auto_45689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45695 - BLOCK
      ?auto_45696 - BLOCK
    )
    :vars
    (
      ?auto_45697 - BLOCK
      ?auto_45701 - BLOCK
      ?auto_45698 - BLOCK
      ?auto_45699 - BLOCK
      ?auto_45700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45695 ?auto_45696 ) ) ( not ( = ?auto_45695 ?auto_45697 ) ) ( not ( = ?auto_45696 ?auto_45697 ) ) ( ON-TABLE ?auto_45701 ) ( not ( = ?auto_45701 ?auto_45698 ) ) ( not ( = ?auto_45701 ?auto_45699 ) ) ( not ( = ?auto_45701 ?auto_45697 ) ) ( not ( = ?auto_45701 ?auto_45696 ) ) ( not ( = ?auto_45701 ?auto_45695 ) ) ( not ( = ?auto_45698 ?auto_45699 ) ) ( not ( = ?auto_45698 ?auto_45697 ) ) ( not ( = ?auto_45698 ?auto_45696 ) ) ( not ( = ?auto_45698 ?auto_45695 ) ) ( not ( = ?auto_45699 ?auto_45697 ) ) ( not ( = ?auto_45699 ?auto_45696 ) ) ( not ( = ?auto_45699 ?auto_45695 ) ) ( ON ?auto_45695 ?auto_45700 ) ( not ( = ?auto_45695 ?auto_45700 ) ) ( not ( = ?auto_45696 ?auto_45700 ) ) ( not ( = ?auto_45697 ?auto_45700 ) ) ( not ( = ?auto_45701 ?auto_45700 ) ) ( not ( = ?auto_45698 ?auto_45700 ) ) ( not ( = ?auto_45699 ?auto_45700 ) ) ( ON ?auto_45696 ?auto_45695 ) ( ON-TABLE ?auto_45700 ) ( ON ?auto_45697 ?auto_45696 ) ( ON ?auto_45699 ?auto_45697 ) ( CLEAR ?auto_45701 ) ( ON ?auto_45698 ?auto_45699 ) ( CLEAR ?auto_45698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45700 ?auto_45695 ?auto_45696 ?auto_45697 ?auto_45699 )
      ( MAKE-2PILE ?auto_45695 ?auto_45696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45702 - BLOCK
      ?auto_45703 - BLOCK
    )
    :vars
    (
      ?auto_45706 - BLOCK
      ?auto_45705 - BLOCK
      ?auto_45707 - BLOCK
      ?auto_45708 - BLOCK
      ?auto_45704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45702 ?auto_45703 ) ) ( not ( = ?auto_45702 ?auto_45706 ) ) ( not ( = ?auto_45703 ?auto_45706 ) ) ( not ( = ?auto_45705 ?auto_45707 ) ) ( not ( = ?auto_45705 ?auto_45708 ) ) ( not ( = ?auto_45705 ?auto_45706 ) ) ( not ( = ?auto_45705 ?auto_45703 ) ) ( not ( = ?auto_45705 ?auto_45702 ) ) ( not ( = ?auto_45707 ?auto_45708 ) ) ( not ( = ?auto_45707 ?auto_45706 ) ) ( not ( = ?auto_45707 ?auto_45703 ) ) ( not ( = ?auto_45707 ?auto_45702 ) ) ( not ( = ?auto_45708 ?auto_45706 ) ) ( not ( = ?auto_45708 ?auto_45703 ) ) ( not ( = ?auto_45708 ?auto_45702 ) ) ( ON ?auto_45702 ?auto_45704 ) ( not ( = ?auto_45702 ?auto_45704 ) ) ( not ( = ?auto_45703 ?auto_45704 ) ) ( not ( = ?auto_45706 ?auto_45704 ) ) ( not ( = ?auto_45705 ?auto_45704 ) ) ( not ( = ?auto_45707 ?auto_45704 ) ) ( not ( = ?auto_45708 ?auto_45704 ) ) ( ON ?auto_45703 ?auto_45702 ) ( ON-TABLE ?auto_45704 ) ( ON ?auto_45706 ?auto_45703 ) ( ON ?auto_45708 ?auto_45706 ) ( ON ?auto_45707 ?auto_45708 ) ( CLEAR ?auto_45707 ) ( HOLDING ?auto_45705 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45705 )
      ( MAKE-2PILE ?auto_45702 ?auto_45703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45709 - BLOCK
      ?auto_45710 - BLOCK
    )
    :vars
    (
      ?auto_45712 - BLOCK
      ?auto_45711 - BLOCK
      ?auto_45713 - BLOCK
      ?auto_45714 - BLOCK
      ?auto_45715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45709 ?auto_45710 ) ) ( not ( = ?auto_45709 ?auto_45712 ) ) ( not ( = ?auto_45710 ?auto_45712 ) ) ( not ( = ?auto_45711 ?auto_45713 ) ) ( not ( = ?auto_45711 ?auto_45714 ) ) ( not ( = ?auto_45711 ?auto_45712 ) ) ( not ( = ?auto_45711 ?auto_45710 ) ) ( not ( = ?auto_45711 ?auto_45709 ) ) ( not ( = ?auto_45713 ?auto_45714 ) ) ( not ( = ?auto_45713 ?auto_45712 ) ) ( not ( = ?auto_45713 ?auto_45710 ) ) ( not ( = ?auto_45713 ?auto_45709 ) ) ( not ( = ?auto_45714 ?auto_45712 ) ) ( not ( = ?auto_45714 ?auto_45710 ) ) ( not ( = ?auto_45714 ?auto_45709 ) ) ( ON ?auto_45709 ?auto_45715 ) ( not ( = ?auto_45709 ?auto_45715 ) ) ( not ( = ?auto_45710 ?auto_45715 ) ) ( not ( = ?auto_45712 ?auto_45715 ) ) ( not ( = ?auto_45711 ?auto_45715 ) ) ( not ( = ?auto_45713 ?auto_45715 ) ) ( not ( = ?auto_45714 ?auto_45715 ) ) ( ON ?auto_45710 ?auto_45709 ) ( ON-TABLE ?auto_45715 ) ( ON ?auto_45712 ?auto_45710 ) ( ON ?auto_45714 ?auto_45712 ) ( ON ?auto_45713 ?auto_45714 ) ( ON ?auto_45711 ?auto_45713 ) ( CLEAR ?auto_45711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45715 ?auto_45709 ?auto_45710 ?auto_45712 ?auto_45714 ?auto_45713 )
      ( MAKE-2PILE ?auto_45709 ?auto_45710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45719 - BLOCK
      ?auto_45720 - BLOCK
      ?auto_45721 - BLOCK
    )
    :vars
    (
      ?auto_45722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45722 ?auto_45721 ) ( CLEAR ?auto_45722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45719 ) ( ON ?auto_45720 ?auto_45719 ) ( ON ?auto_45721 ?auto_45720 ) ( not ( = ?auto_45719 ?auto_45720 ) ) ( not ( = ?auto_45719 ?auto_45721 ) ) ( not ( = ?auto_45719 ?auto_45722 ) ) ( not ( = ?auto_45720 ?auto_45721 ) ) ( not ( = ?auto_45720 ?auto_45722 ) ) ( not ( = ?auto_45721 ?auto_45722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45722 ?auto_45721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45723 - BLOCK
      ?auto_45724 - BLOCK
      ?auto_45725 - BLOCK
    )
    :vars
    (
      ?auto_45726 - BLOCK
      ?auto_45727 - BLOCK
      ?auto_45728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45726 ?auto_45725 ) ( CLEAR ?auto_45726 ) ( ON-TABLE ?auto_45723 ) ( ON ?auto_45724 ?auto_45723 ) ( ON ?auto_45725 ?auto_45724 ) ( not ( = ?auto_45723 ?auto_45724 ) ) ( not ( = ?auto_45723 ?auto_45725 ) ) ( not ( = ?auto_45723 ?auto_45726 ) ) ( not ( = ?auto_45724 ?auto_45725 ) ) ( not ( = ?auto_45724 ?auto_45726 ) ) ( not ( = ?auto_45725 ?auto_45726 ) ) ( HOLDING ?auto_45727 ) ( CLEAR ?auto_45728 ) ( not ( = ?auto_45723 ?auto_45727 ) ) ( not ( = ?auto_45723 ?auto_45728 ) ) ( not ( = ?auto_45724 ?auto_45727 ) ) ( not ( = ?auto_45724 ?auto_45728 ) ) ( not ( = ?auto_45725 ?auto_45727 ) ) ( not ( = ?auto_45725 ?auto_45728 ) ) ( not ( = ?auto_45726 ?auto_45727 ) ) ( not ( = ?auto_45726 ?auto_45728 ) ) ( not ( = ?auto_45727 ?auto_45728 ) ) )
    :subtasks
    ( ( !STACK ?auto_45727 ?auto_45728 )
      ( MAKE-3PILE ?auto_45723 ?auto_45724 ?auto_45725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45729 - BLOCK
      ?auto_45730 - BLOCK
      ?auto_45731 - BLOCK
    )
    :vars
    (
      ?auto_45732 - BLOCK
      ?auto_45734 - BLOCK
      ?auto_45733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45732 ?auto_45731 ) ( ON-TABLE ?auto_45729 ) ( ON ?auto_45730 ?auto_45729 ) ( ON ?auto_45731 ?auto_45730 ) ( not ( = ?auto_45729 ?auto_45730 ) ) ( not ( = ?auto_45729 ?auto_45731 ) ) ( not ( = ?auto_45729 ?auto_45732 ) ) ( not ( = ?auto_45730 ?auto_45731 ) ) ( not ( = ?auto_45730 ?auto_45732 ) ) ( not ( = ?auto_45731 ?auto_45732 ) ) ( CLEAR ?auto_45734 ) ( not ( = ?auto_45729 ?auto_45733 ) ) ( not ( = ?auto_45729 ?auto_45734 ) ) ( not ( = ?auto_45730 ?auto_45733 ) ) ( not ( = ?auto_45730 ?auto_45734 ) ) ( not ( = ?auto_45731 ?auto_45733 ) ) ( not ( = ?auto_45731 ?auto_45734 ) ) ( not ( = ?auto_45732 ?auto_45733 ) ) ( not ( = ?auto_45732 ?auto_45734 ) ) ( not ( = ?auto_45733 ?auto_45734 ) ) ( ON ?auto_45733 ?auto_45732 ) ( CLEAR ?auto_45733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45729 ?auto_45730 ?auto_45731 ?auto_45732 )
      ( MAKE-3PILE ?auto_45729 ?auto_45730 ?auto_45731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45735 - BLOCK
      ?auto_45736 - BLOCK
      ?auto_45737 - BLOCK
    )
    :vars
    (
      ?auto_45738 - BLOCK
      ?auto_45739 - BLOCK
      ?auto_45740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45738 ?auto_45737 ) ( ON-TABLE ?auto_45735 ) ( ON ?auto_45736 ?auto_45735 ) ( ON ?auto_45737 ?auto_45736 ) ( not ( = ?auto_45735 ?auto_45736 ) ) ( not ( = ?auto_45735 ?auto_45737 ) ) ( not ( = ?auto_45735 ?auto_45738 ) ) ( not ( = ?auto_45736 ?auto_45737 ) ) ( not ( = ?auto_45736 ?auto_45738 ) ) ( not ( = ?auto_45737 ?auto_45738 ) ) ( not ( = ?auto_45735 ?auto_45739 ) ) ( not ( = ?auto_45735 ?auto_45740 ) ) ( not ( = ?auto_45736 ?auto_45739 ) ) ( not ( = ?auto_45736 ?auto_45740 ) ) ( not ( = ?auto_45737 ?auto_45739 ) ) ( not ( = ?auto_45737 ?auto_45740 ) ) ( not ( = ?auto_45738 ?auto_45739 ) ) ( not ( = ?auto_45738 ?auto_45740 ) ) ( not ( = ?auto_45739 ?auto_45740 ) ) ( ON ?auto_45739 ?auto_45738 ) ( CLEAR ?auto_45739 ) ( HOLDING ?auto_45740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45740 )
      ( MAKE-3PILE ?auto_45735 ?auto_45736 ?auto_45737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45741 - BLOCK
      ?auto_45742 - BLOCK
      ?auto_45743 - BLOCK
    )
    :vars
    (
      ?auto_45744 - BLOCK
      ?auto_45745 - BLOCK
      ?auto_45746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45744 ?auto_45743 ) ( ON-TABLE ?auto_45741 ) ( ON ?auto_45742 ?auto_45741 ) ( ON ?auto_45743 ?auto_45742 ) ( not ( = ?auto_45741 ?auto_45742 ) ) ( not ( = ?auto_45741 ?auto_45743 ) ) ( not ( = ?auto_45741 ?auto_45744 ) ) ( not ( = ?auto_45742 ?auto_45743 ) ) ( not ( = ?auto_45742 ?auto_45744 ) ) ( not ( = ?auto_45743 ?auto_45744 ) ) ( not ( = ?auto_45741 ?auto_45745 ) ) ( not ( = ?auto_45741 ?auto_45746 ) ) ( not ( = ?auto_45742 ?auto_45745 ) ) ( not ( = ?auto_45742 ?auto_45746 ) ) ( not ( = ?auto_45743 ?auto_45745 ) ) ( not ( = ?auto_45743 ?auto_45746 ) ) ( not ( = ?auto_45744 ?auto_45745 ) ) ( not ( = ?auto_45744 ?auto_45746 ) ) ( not ( = ?auto_45745 ?auto_45746 ) ) ( ON ?auto_45745 ?auto_45744 ) ( ON ?auto_45746 ?auto_45745 ) ( CLEAR ?auto_45746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45741 ?auto_45742 ?auto_45743 ?auto_45744 ?auto_45745 )
      ( MAKE-3PILE ?auto_45741 ?auto_45742 ?auto_45743 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45747 - BLOCK
      ?auto_45748 - BLOCK
      ?auto_45749 - BLOCK
    )
    :vars
    (
      ?auto_45751 - BLOCK
      ?auto_45752 - BLOCK
      ?auto_45750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45751 ?auto_45749 ) ( ON-TABLE ?auto_45747 ) ( ON ?auto_45748 ?auto_45747 ) ( ON ?auto_45749 ?auto_45748 ) ( not ( = ?auto_45747 ?auto_45748 ) ) ( not ( = ?auto_45747 ?auto_45749 ) ) ( not ( = ?auto_45747 ?auto_45751 ) ) ( not ( = ?auto_45748 ?auto_45749 ) ) ( not ( = ?auto_45748 ?auto_45751 ) ) ( not ( = ?auto_45749 ?auto_45751 ) ) ( not ( = ?auto_45747 ?auto_45752 ) ) ( not ( = ?auto_45747 ?auto_45750 ) ) ( not ( = ?auto_45748 ?auto_45752 ) ) ( not ( = ?auto_45748 ?auto_45750 ) ) ( not ( = ?auto_45749 ?auto_45752 ) ) ( not ( = ?auto_45749 ?auto_45750 ) ) ( not ( = ?auto_45751 ?auto_45752 ) ) ( not ( = ?auto_45751 ?auto_45750 ) ) ( not ( = ?auto_45752 ?auto_45750 ) ) ( ON ?auto_45752 ?auto_45751 ) ( HOLDING ?auto_45750 ) ( CLEAR ?auto_45752 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45747 ?auto_45748 ?auto_45749 ?auto_45751 ?auto_45752 ?auto_45750 )
      ( MAKE-3PILE ?auto_45747 ?auto_45748 ?auto_45749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45753 - BLOCK
      ?auto_45754 - BLOCK
      ?auto_45755 - BLOCK
    )
    :vars
    (
      ?auto_45757 - BLOCK
      ?auto_45758 - BLOCK
      ?auto_45756 - BLOCK
      ?auto_45759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45757 ?auto_45755 ) ( ON-TABLE ?auto_45753 ) ( ON ?auto_45754 ?auto_45753 ) ( ON ?auto_45755 ?auto_45754 ) ( not ( = ?auto_45753 ?auto_45754 ) ) ( not ( = ?auto_45753 ?auto_45755 ) ) ( not ( = ?auto_45753 ?auto_45757 ) ) ( not ( = ?auto_45754 ?auto_45755 ) ) ( not ( = ?auto_45754 ?auto_45757 ) ) ( not ( = ?auto_45755 ?auto_45757 ) ) ( not ( = ?auto_45753 ?auto_45758 ) ) ( not ( = ?auto_45753 ?auto_45756 ) ) ( not ( = ?auto_45754 ?auto_45758 ) ) ( not ( = ?auto_45754 ?auto_45756 ) ) ( not ( = ?auto_45755 ?auto_45758 ) ) ( not ( = ?auto_45755 ?auto_45756 ) ) ( not ( = ?auto_45757 ?auto_45758 ) ) ( not ( = ?auto_45757 ?auto_45756 ) ) ( not ( = ?auto_45758 ?auto_45756 ) ) ( ON ?auto_45758 ?auto_45757 ) ( CLEAR ?auto_45758 ) ( ON ?auto_45756 ?auto_45759 ) ( CLEAR ?auto_45756 ) ( HAND-EMPTY ) ( not ( = ?auto_45753 ?auto_45759 ) ) ( not ( = ?auto_45754 ?auto_45759 ) ) ( not ( = ?auto_45755 ?auto_45759 ) ) ( not ( = ?auto_45757 ?auto_45759 ) ) ( not ( = ?auto_45758 ?auto_45759 ) ) ( not ( = ?auto_45756 ?auto_45759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45756 ?auto_45759 )
      ( MAKE-3PILE ?auto_45753 ?auto_45754 ?auto_45755 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45760 - BLOCK
      ?auto_45761 - BLOCK
      ?auto_45762 - BLOCK
    )
    :vars
    (
      ?auto_45764 - BLOCK
      ?auto_45766 - BLOCK
      ?auto_45765 - BLOCK
      ?auto_45763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45764 ?auto_45762 ) ( ON-TABLE ?auto_45760 ) ( ON ?auto_45761 ?auto_45760 ) ( ON ?auto_45762 ?auto_45761 ) ( not ( = ?auto_45760 ?auto_45761 ) ) ( not ( = ?auto_45760 ?auto_45762 ) ) ( not ( = ?auto_45760 ?auto_45764 ) ) ( not ( = ?auto_45761 ?auto_45762 ) ) ( not ( = ?auto_45761 ?auto_45764 ) ) ( not ( = ?auto_45762 ?auto_45764 ) ) ( not ( = ?auto_45760 ?auto_45766 ) ) ( not ( = ?auto_45760 ?auto_45765 ) ) ( not ( = ?auto_45761 ?auto_45766 ) ) ( not ( = ?auto_45761 ?auto_45765 ) ) ( not ( = ?auto_45762 ?auto_45766 ) ) ( not ( = ?auto_45762 ?auto_45765 ) ) ( not ( = ?auto_45764 ?auto_45766 ) ) ( not ( = ?auto_45764 ?auto_45765 ) ) ( not ( = ?auto_45766 ?auto_45765 ) ) ( ON ?auto_45765 ?auto_45763 ) ( CLEAR ?auto_45765 ) ( not ( = ?auto_45760 ?auto_45763 ) ) ( not ( = ?auto_45761 ?auto_45763 ) ) ( not ( = ?auto_45762 ?auto_45763 ) ) ( not ( = ?auto_45764 ?auto_45763 ) ) ( not ( = ?auto_45766 ?auto_45763 ) ) ( not ( = ?auto_45765 ?auto_45763 ) ) ( HOLDING ?auto_45766 ) ( CLEAR ?auto_45764 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45760 ?auto_45761 ?auto_45762 ?auto_45764 ?auto_45766 )
      ( MAKE-3PILE ?auto_45760 ?auto_45761 ?auto_45762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45767 - BLOCK
      ?auto_45768 - BLOCK
      ?auto_45769 - BLOCK
    )
    :vars
    (
      ?auto_45771 - BLOCK
      ?auto_45772 - BLOCK
      ?auto_45770 - BLOCK
      ?auto_45773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45771 ?auto_45769 ) ( ON-TABLE ?auto_45767 ) ( ON ?auto_45768 ?auto_45767 ) ( ON ?auto_45769 ?auto_45768 ) ( not ( = ?auto_45767 ?auto_45768 ) ) ( not ( = ?auto_45767 ?auto_45769 ) ) ( not ( = ?auto_45767 ?auto_45771 ) ) ( not ( = ?auto_45768 ?auto_45769 ) ) ( not ( = ?auto_45768 ?auto_45771 ) ) ( not ( = ?auto_45769 ?auto_45771 ) ) ( not ( = ?auto_45767 ?auto_45772 ) ) ( not ( = ?auto_45767 ?auto_45770 ) ) ( not ( = ?auto_45768 ?auto_45772 ) ) ( not ( = ?auto_45768 ?auto_45770 ) ) ( not ( = ?auto_45769 ?auto_45772 ) ) ( not ( = ?auto_45769 ?auto_45770 ) ) ( not ( = ?auto_45771 ?auto_45772 ) ) ( not ( = ?auto_45771 ?auto_45770 ) ) ( not ( = ?auto_45772 ?auto_45770 ) ) ( ON ?auto_45770 ?auto_45773 ) ( not ( = ?auto_45767 ?auto_45773 ) ) ( not ( = ?auto_45768 ?auto_45773 ) ) ( not ( = ?auto_45769 ?auto_45773 ) ) ( not ( = ?auto_45771 ?auto_45773 ) ) ( not ( = ?auto_45772 ?auto_45773 ) ) ( not ( = ?auto_45770 ?auto_45773 ) ) ( CLEAR ?auto_45771 ) ( ON ?auto_45772 ?auto_45770 ) ( CLEAR ?auto_45772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45773 ?auto_45770 )
      ( MAKE-3PILE ?auto_45767 ?auto_45768 ?auto_45769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45788 - BLOCK
      ?auto_45789 - BLOCK
      ?auto_45790 - BLOCK
    )
    :vars
    (
      ?auto_45792 - BLOCK
      ?auto_45791 - BLOCK
      ?auto_45794 - BLOCK
      ?auto_45793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45788 ) ( ON ?auto_45789 ?auto_45788 ) ( not ( = ?auto_45788 ?auto_45789 ) ) ( not ( = ?auto_45788 ?auto_45790 ) ) ( not ( = ?auto_45788 ?auto_45792 ) ) ( not ( = ?auto_45789 ?auto_45790 ) ) ( not ( = ?auto_45789 ?auto_45792 ) ) ( not ( = ?auto_45790 ?auto_45792 ) ) ( not ( = ?auto_45788 ?auto_45791 ) ) ( not ( = ?auto_45788 ?auto_45794 ) ) ( not ( = ?auto_45789 ?auto_45791 ) ) ( not ( = ?auto_45789 ?auto_45794 ) ) ( not ( = ?auto_45790 ?auto_45791 ) ) ( not ( = ?auto_45790 ?auto_45794 ) ) ( not ( = ?auto_45792 ?auto_45791 ) ) ( not ( = ?auto_45792 ?auto_45794 ) ) ( not ( = ?auto_45791 ?auto_45794 ) ) ( ON ?auto_45794 ?auto_45793 ) ( not ( = ?auto_45788 ?auto_45793 ) ) ( not ( = ?auto_45789 ?auto_45793 ) ) ( not ( = ?auto_45790 ?auto_45793 ) ) ( not ( = ?auto_45792 ?auto_45793 ) ) ( not ( = ?auto_45791 ?auto_45793 ) ) ( not ( = ?auto_45794 ?auto_45793 ) ) ( ON ?auto_45791 ?auto_45794 ) ( ON-TABLE ?auto_45793 ) ( ON ?auto_45792 ?auto_45791 ) ( CLEAR ?auto_45792 ) ( HOLDING ?auto_45790 ) ( CLEAR ?auto_45789 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45788 ?auto_45789 ?auto_45790 ?auto_45792 )
      ( MAKE-3PILE ?auto_45788 ?auto_45789 ?auto_45790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45795 - BLOCK
      ?auto_45796 - BLOCK
      ?auto_45797 - BLOCK
    )
    :vars
    (
      ?auto_45800 - BLOCK
      ?auto_45801 - BLOCK
      ?auto_45799 - BLOCK
      ?auto_45798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45795 ) ( ON ?auto_45796 ?auto_45795 ) ( not ( = ?auto_45795 ?auto_45796 ) ) ( not ( = ?auto_45795 ?auto_45797 ) ) ( not ( = ?auto_45795 ?auto_45800 ) ) ( not ( = ?auto_45796 ?auto_45797 ) ) ( not ( = ?auto_45796 ?auto_45800 ) ) ( not ( = ?auto_45797 ?auto_45800 ) ) ( not ( = ?auto_45795 ?auto_45801 ) ) ( not ( = ?auto_45795 ?auto_45799 ) ) ( not ( = ?auto_45796 ?auto_45801 ) ) ( not ( = ?auto_45796 ?auto_45799 ) ) ( not ( = ?auto_45797 ?auto_45801 ) ) ( not ( = ?auto_45797 ?auto_45799 ) ) ( not ( = ?auto_45800 ?auto_45801 ) ) ( not ( = ?auto_45800 ?auto_45799 ) ) ( not ( = ?auto_45801 ?auto_45799 ) ) ( ON ?auto_45799 ?auto_45798 ) ( not ( = ?auto_45795 ?auto_45798 ) ) ( not ( = ?auto_45796 ?auto_45798 ) ) ( not ( = ?auto_45797 ?auto_45798 ) ) ( not ( = ?auto_45800 ?auto_45798 ) ) ( not ( = ?auto_45801 ?auto_45798 ) ) ( not ( = ?auto_45799 ?auto_45798 ) ) ( ON ?auto_45801 ?auto_45799 ) ( ON-TABLE ?auto_45798 ) ( ON ?auto_45800 ?auto_45801 ) ( CLEAR ?auto_45796 ) ( ON ?auto_45797 ?auto_45800 ) ( CLEAR ?auto_45797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45798 ?auto_45799 ?auto_45801 ?auto_45800 )
      ( MAKE-3PILE ?auto_45795 ?auto_45796 ?auto_45797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45802 - BLOCK
      ?auto_45803 - BLOCK
      ?auto_45804 - BLOCK
    )
    :vars
    (
      ?auto_45807 - BLOCK
      ?auto_45808 - BLOCK
      ?auto_45806 - BLOCK
      ?auto_45805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45802 ) ( not ( = ?auto_45802 ?auto_45803 ) ) ( not ( = ?auto_45802 ?auto_45804 ) ) ( not ( = ?auto_45802 ?auto_45807 ) ) ( not ( = ?auto_45803 ?auto_45804 ) ) ( not ( = ?auto_45803 ?auto_45807 ) ) ( not ( = ?auto_45804 ?auto_45807 ) ) ( not ( = ?auto_45802 ?auto_45808 ) ) ( not ( = ?auto_45802 ?auto_45806 ) ) ( not ( = ?auto_45803 ?auto_45808 ) ) ( not ( = ?auto_45803 ?auto_45806 ) ) ( not ( = ?auto_45804 ?auto_45808 ) ) ( not ( = ?auto_45804 ?auto_45806 ) ) ( not ( = ?auto_45807 ?auto_45808 ) ) ( not ( = ?auto_45807 ?auto_45806 ) ) ( not ( = ?auto_45808 ?auto_45806 ) ) ( ON ?auto_45806 ?auto_45805 ) ( not ( = ?auto_45802 ?auto_45805 ) ) ( not ( = ?auto_45803 ?auto_45805 ) ) ( not ( = ?auto_45804 ?auto_45805 ) ) ( not ( = ?auto_45807 ?auto_45805 ) ) ( not ( = ?auto_45808 ?auto_45805 ) ) ( not ( = ?auto_45806 ?auto_45805 ) ) ( ON ?auto_45808 ?auto_45806 ) ( ON-TABLE ?auto_45805 ) ( ON ?auto_45807 ?auto_45808 ) ( ON ?auto_45804 ?auto_45807 ) ( CLEAR ?auto_45804 ) ( HOLDING ?auto_45803 ) ( CLEAR ?auto_45802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45802 ?auto_45803 )
      ( MAKE-3PILE ?auto_45802 ?auto_45803 ?auto_45804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45809 - BLOCK
      ?auto_45810 - BLOCK
      ?auto_45811 - BLOCK
    )
    :vars
    (
      ?auto_45813 - BLOCK
      ?auto_45812 - BLOCK
      ?auto_45815 - BLOCK
      ?auto_45814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45809 ) ( not ( = ?auto_45809 ?auto_45810 ) ) ( not ( = ?auto_45809 ?auto_45811 ) ) ( not ( = ?auto_45809 ?auto_45813 ) ) ( not ( = ?auto_45810 ?auto_45811 ) ) ( not ( = ?auto_45810 ?auto_45813 ) ) ( not ( = ?auto_45811 ?auto_45813 ) ) ( not ( = ?auto_45809 ?auto_45812 ) ) ( not ( = ?auto_45809 ?auto_45815 ) ) ( not ( = ?auto_45810 ?auto_45812 ) ) ( not ( = ?auto_45810 ?auto_45815 ) ) ( not ( = ?auto_45811 ?auto_45812 ) ) ( not ( = ?auto_45811 ?auto_45815 ) ) ( not ( = ?auto_45813 ?auto_45812 ) ) ( not ( = ?auto_45813 ?auto_45815 ) ) ( not ( = ?auto_45812 ?auto_45815 ) ) ( ON ?auto_45815 ?auto_45814 ) ( not ( = ?auto_45809 ?auto_45814 ) ) ( not ( = ?auto_45810 ?auto_45814 ) ) ( not ( = ?auto_45811 ?auto_45814 ) ) ( not ( = ?auto_45813 ?auto_45814 ) ) ( not ( = ?auto_45812 ?auto_45814 ) ) ( not ( = ?auto_45815 ?auto_45814 ) ) ( ON ?auto_45812 ?auto_45815 ) ( ON-TABLE ?auto_45814 ) ( ON ?auto_45813 ?auto_45812 ) ( ON ?auto_45811 ?auto_45813 ) ( CLEAR ?auto_45809 ) ( ON ?auto_45810 ?auto_45811 ) ( CLEAR ?auto_45810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45814 ?auto_45815 ?auto_45812 ?auto_45813 ?auto_45811 )
      ( MAKE-3PILE ?auto_45809 ?auto_45810 ?auto_45811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45816 - BLOCK
      ?auto_45817 - BLOCK
      ?auto_45818 - BLOCK
    )
    :vars
    (
      ?auto_45820 - BLOCK
      ?auto_45822 - BLOCK
      ?auto_45819 - BLOCK
      ?auto_45821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45816 ?auto_45817 ) ) ( not ( = ?auto_45816 ?auto_45818 ) ) ( not ( = ?auto_45816 ?auto_45820 ) ) ( not ( = ?auto_45817 ?auto_45818 ) ) ( not ( = ?auto_45817 ?auto_45820 ) ) ( not ( = ?auto_45818 ?auto_45820 ) ) ( not ( = ?auto_45816 ?auto_45822 ) ) ( not ( = ?auto_45816 ?auto_45819 ) ) ( not ( = ?auto_45817 ?auto_45822 ) ) ( not ( = ?auto_45817 ?auto_45819 ) ) ( not ( = ?auto_45818 ?auto_45822 ) ) ( not ( = ?auto_45818 ?auto_45819 ) ) ( not ( = ?auto_45820 ?auto_45822 ) ) ( not ( = ?auto_45820 ?auto_45819 ) ) ( not ( = ?auto_45822 ?auto_45819 ) ) ( ON ?auto_45819 ?auto_45821 ) ( not ( = ?auto_45816 ?auto_45821 ) ) ( not ( = ?auto_45817 ?auto_45821 ) ) ( not ( = ?auto_45818 ?auto_45821 ) ) ( not ( = ?auto_45820 ?auto_45821 ) ) ( not ( = ?auto_45822 ?auto_45821 ) ) ( not ( = ?auto_45819 ?auto_45821 ) ) ( ON ?auto_45822 ?auto_45819 ) ( ON-TABLE ?auto_45821 ) ( ON ?auto_45820 ?auto_45822 ) ( ON ?auto_45818 ?auto_45820 ) ( ON ?auto_45817 ?auto_45818 ) ( CLEAR ?auto_45817 ) ( HOLDING ?auto_45816 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45816 )
      ( MAKE-3PILE ?auto_45816 ?auto_45817 ?auto_45818 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45823 - BLOCK
      ?auto_45824 - BLOCK
      ?auto_45825 - BLOCK
    )
    :vars
    (
      ?auto_45827 - BLOCK
      ?auto_45828 - BLOCK
      ?auto_45829 - BLOCK
      ?auto_45826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45823 ?auto_45824 ) ) ( not ( = ?auto_45823 ?auto_45825 ) ) ( not ( = ?auto_45823 ?auto_45827 ) ) ( not ( = ?auto_45824 ?auto_45825 ) ) ( not ( = ?auto_45824 ?auto_45827 ) ) ( not ( = ?auto_45825 ?auto_45827 ) ) ( not ( = ?auto_45823 ?auto_45828 ) ) ( not ( = ?auto_45823 ?auto_45829 ) ) ( not ( = ?auto_45824 ?auto_45828 ) ) ( not ( = ?auto_45824 ?auto_45829 ) ) ( not ( = ?auto_45825 ?auto_45828 ) ) ( not ( = ?auto_45825 ?auto_45829 ) ) ( not ( = ?auto_45827 ?auto_45828 ) ) ( not ( = ?auto_45827 ?auto_45829 ) ) ( not ( = ?auto_45828 ?auto_45829 ) ) ( ON ?auto_45829 ?auto_45826 ) ( not ( = ?auto_45823 ?auto_45826 ) ) ( not ( = ?auto_45824 ?auto_45826 ) ) ( not ( = ?auto_45825 ?auto_45826 ) ) ( not ( = ?auto_45827 ?auto_45826 ) ) ( not ( = ?auto_45828 ?auto_45826 ) ) ( not ( = ?auto_45829 ?auto_45826 ) ) ( ON ?auto_45828 ?auto_45829 ) ( ON-TABLE ?auto_45826 ) ( ON ?auto_45827 ?auto_45828 ) ( ON ?auto_45825 ?auto_45827 ) ( ON ?auto_45824 ?auto_45825 ) ( ON ?auto_45823 ?auto_45824 ) ( CLEAR ?auto_45823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45826 ?auto_45829 ?auto_45828 ?auto_45827 ?auto_45825 ?auto_45824 )
      ( MAKE-3PILE ?auto_45823 ?auto_45824 ?auto_45825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45833 - BLOCK
      ?auto_45834 - BLOCK
      ?auto_45835 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_45835 ) ( CLEAR ?auto_45834 ) ( ON-TABLE ?auto_45833 ) ( ON ?auto_45834 ?auto_45833 ) ( not ( = ?auto_45833 ?auto_45834 ) ) ( not ( = ?auto_45833 ?auto_45835 ) ) ( not ( = ?auto_45834 ?auto_45835 ) ) )
    :subtasks
    ( ( !STACK ?auto_45835 ?auto_45834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45836 - BLOCK
      ?auto_45837 - BLOCK
      ?auto_45838 - BLOCK
    )
    :vars
    (
      ?auto_45839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45837 ) ( ON-TABLE ?auto_45836 ) ( ON ?auto_45837 ?auto_45836 ) ( not ( = ?auto_45836 ?auto_45837 ) ) ( not ( = ?auto_45836 ?auto_45838 ) ) ( not ( = ?auto_45837 ?auto_45838 ) ) ( ON ?auto_45838 ?auto_45839 ) ( CLEAR ?auto_45838 ) ( HAND-EMPTY ) ( not ( = ?auto_45836 ?auto_45839 ) ) ( not ( = ?auto_45837 ?auto_45839 ) ) ( not ( = ?auto_45838 ?auto_45839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45838 ?auto_45839 )
      ( MAKE-3PILE ?auto_45836 ?auto_45837 ?auto_45838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45840 - BLOCK
      ?auto_45841 - BLOCK
      ?auto_45842 - BLOCK
    )
    :vars
    (
      ?auto_45843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45840 ) ( not ( = ?auto_45840 ?auto_45841 ) ) ( not ( = ?auto_45840 ?auto_45842 ) ) ( not ( = ?auto_45841 ?auto_45842 ) ) ( ON ?auto_45842 ?auto_45843 ) ( CLEAR ?auto_45842 ) ( not ( = ?auto_45840 ?auto_45843 ) ) ( not ( = ?auto_45841 ?auto_45843 ) ) ( not ( = ?auto_45842 ?auto_45843 ) ) ( HOLDING ?auto_45841 ) ( CLEAR ?auto_45840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45840 ?auto_45841 )
      ( MAKE-3PILE ?auto_45840 ?auto_45841 ?auto_45842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45844 - BLOCK
      ?auto_45845 - BLOCK
      ?auto_45846 - BLOCK
    )
    :vars
    (
      ?auto_45847 - BLOCK
      ?auto_45848 - BLOCK
      ?auto_45849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45844 ) ( not ( = ?auto_45844 ?auto_45845 ) ) ( not ( = ?auto_45844 ?auto_45846 ) ) ( not ( = ?auto_45845 ?auto_45846 ) ) ( ON ?auto_45846 ?auto_45847 ) ( not ( = ?auto_45844 ?auto_45847 ) ) ( not ( = ?auto_45845 ?auto_45847 ) ) ( not ( = ?auto_45846 ?auto_45847 ) ) ( CLEAR ?auto_45844 ) ( ON ?auto_45845 ?auto_45846 ) ( CLEAR ?auto_45845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45848 ) ( ON ?auto_45849 ?auto_45848 ) ( ON ?auto_45847 ?auto_45849 ) ( not ( = ?auto_45848 ?auto_45849 ) ) ( not ( = ?auto_45848 ?auto_45847 ) ) ( not ( = ?auto_45848 ?auto_45846 ) ) ( not ( = ?auto_45848 ?auto_45845 ) ) ( not ( = ?auto_45849 ?auto_45847 ) ) ( not ( = ?auto_45849 ?auto_45846 ) ) ( not ( = ?auto_45849 ?auto_45845 ) ) ( not ( = ?auto_45844 ?auto_45848 ) ) ( not ( = ?auto_45844 ?auto_45849 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45848 ?auto_45849 ?auto_45847 ?auto_45846 )
      ( MAKE-3PILE ?auto_45844 ?auto_45845 ?auto_45846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45850 - BLOCK
      ?auto_45851 - BLOCK
      ?auto_45852 - BLOCK
    )
    :vars
    (
      ?auto_45855 - BLOCK
      ?auto_45853 - BLOCK
      ?auto_45854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45850 ?auto_45851 ) ) ( not ( = ?auto_45850 ?auto_45852 ) ) ( not ( = ?auto_45851 ?auto_45852 ) ) ( ON ?auto_45852 ?auto_45855 ) ( not ( = ?auto_45850 ?auto_45855 ) ) ( not ( = ?auto_45851 ?auto_45855 ) ) ( not ( = ?auto_45852 ?auto_45855 ) ) ( ON ?auto_45851 ?auto_45852 ) ( CLEAR ?auto_45851 ) ( ON-TABLE ?auto_45853 ) ( ON ?auto_45854 ?auto_45853 ) ( ON ?auto_45855 ?auto_45854 ) ( not ( = ?auto_45853 ?auto_45854 ) ) ( not ( = ?auto_45853 ?auto_45855 ) ) ( not ( = ?auto_45853 ?auto_45852 ) ) ( not ( = ?auto_45853 ?auto_45851 ) ) ( not ( = ?auto_45854 ?auto_45855 ) ) ( not ( = ?auto_45854 ?auto_45852 ) ) ( not ( = ?auto_45854 ?auto_45851 ) ) ( not ( = ?auto_45850 ?auto_45853 ) ) ( not ( = ?auto_45850 ?auto_45854 ) ) ( HOLDING ?auto_45850 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45850 )
      ( MAKE-3PILE ?auto_45850 ?auto_45851 ?auto_45852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45856 - BLOCK
      ?auto_45857 - BLOCK
      ?auto_45858 - BLOCK
    )
    :vars
    (
      ?auto_45859 - BLOCK
      ?auto_45860 - BLOCK
      ?auto_45861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45856 ?auto_45857 ) ) ( not ( = ?auto_45856 ?auto_45858 ) ) ( not ( = ?auto_45857 ?auto_45858 ) ) ( ON ?auto_45858 ?auto_45859 ) ( not ( = ?auto_45856 ?auto_45859 ) ) ( not ( = ?auto_45857 ?auto_45859 ) ) ( not ( = ?auto_45858 ?auto_45859 ) ) ( ON ?auto_45857 ?auto_45858 ) ( ON-TABLE ?auto_45860 ) ( ON ?auto_45861 ?auto_45860 ) ( ON ?auto_45859 ?auto_45861 ) ( not ( = ?auto_45860 ?auto_45861 ) ) ( not ( = ?auto_45860 ?auto_45859 ) ) ( not ( = ?auto_45860 ?auto_45858 ) ) ( not ( = ?auto_45860 ?auto_45857 ) ) ( not ( = ?auto_45861 ?auto_45859 ) ) ( not ( = ?auto_45861 ?auto_45858 ) ) ( not ( = ?auto_45861 ?auto_45857 ) ) ( not ( = ?auto_45856 ?auto_45860 ) ) ( not ( = ?auto_45856 ?auto_45861 ) ) ( ON ?auto_45856 ?auto_45857 ) ( CLEAR ?auto_45856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45860 ?auto_45861 ?auto_45859 ?auto_45858 ?auto_45857 )
      ( MAKE-3PILE ?auto_45856 ?auto_45857 ?auto_45858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45862 - BLOCK
      ?auto_45863 - BLOCK
      ?auto_45864 - BLOCK
    )
    :vars
    (
      ?auto_45866 - BLOCK
      ?auto_45865 - BLOCK
      ?auto_45867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45862 ?auto_45863 ) ) ( not ( = ?auto_45862 ?auto_45864 ) ) ( not ( = ?auto_45863 ?auto_45864 ) ) ( ON ?auto_45864 ?auto_45866 ) ( not ( = ?auto_45862 ?auto_45866 ) ) ( not ( = ?auto_45863 ?auto_45866 ) ) ( not ( = ?auto_45864 ?auto_45866 ) ) ( ON ?auto_45863 ?auto_45864 ) ( ON-TABLE ?auto_45865 ) ( ON ?auto_45867 ?auto_45865 ) ( ON ?auto_45866 ?auto_45867 ) ( not ( = ?auto_45865 ?auto_45867 ) ) ( not ( = ?auto_45865 ?auto_45866 ) ) ( not ( = ?auto_45865 ?auto_45864 ) ) ( not ( = ?auto_45865 ?auto_45863 ) ) ( not ( = ?auto_45867 ?auto_45866 ) ) ( not ( = ?auto_45867 ?auto_45864 ) ) ( not ( = ?auto_45867 ?auto_45863 ) ) ( not ( = ?auto_45862 ?auto_45865 ) ) ( not ( = ?auto_45862 ?auto_45867 ) ) ( HOLDING ?auto_45862 ) ( CLEAR ?auto_45863 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45865 ?auto_45867 ?auto_45866 ?auto_45864 ?auto_45863 ?auto_45862 )
      ( MAKE-3PILE ?auto_45862 ?auto_45863 ?auto_45864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45868 - BLOCK
      ?auto_45869 - BLOCK
      ?auto_45870 - BLOCK
    )
    :vars
    (
      ?auto_45871 - BLOCK
      ?auto_45872 - BLOCK
      ?auto_45873 - BLOCK
      ?auto_45874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45868 ?auto_45869 ) ) ( not ( = ?auto_45868 ?auto_45870 ) ) ( not ( = ?auto_45869 ?auto_45870 ) ) ( ON ?auto_45870 ?auto_45871 ) ( not ( = ?auto_45868 ?auto_45871 ) ) ( not ( = ?auto_45869 ?auto_45871 ) ) ( not ( = ?auto_45870 ?auto_45871 ) ) ( ON ?auto_45869 ?auto_45870 ) ( ON-TABLE ?auto_45872 ) ( ON ?auto_45873 ?auto_45872 ) ( ON ?auto_45871 ?auto_45873 ) ( not ( = ?auto_45872 ?auto_45873 ) ) ( not ( = ?auto_45872 ?auto_45871 ) ) ( not ( = ?auto_45872 ?auto_45870 ) ) ( not ( = ?auto_45872 ?auto_45869 ) ) ( not ( = ?auto_45873 ?auto_45871 ) ) ( not ( = ?auto_45873 ?auto_45870 ) ) ( not ( = ?auto_45873 ?auto_45869 ) ) ( not ( = ?auto_45868 ?auto_45872 ) ) ( not ( = ?auto_45868 ?auto_45873 ) ) ( CLEAR ?auto_45869 ) ( ON ?auto_45868 ?auto_45874 ) ( CLEAR ?auto_45868 ) ( HAND-EMPTY ) ( not ( = ?auto_45868 ?auto_45874 ) ) ( not ( = ?auto_45869 ?auto_45874 ) ) ( not ( = ?auto_45870 ?auto_45874 ) ) ( not ( = ?auto_45871 ?auto_45874 ) ) ( not ( = ?auto_45872 ?auto_45874 ) ) ( not ( = ?auto_45873 ?auto_45874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45868 ?auto_45874 )
      ( MAKE-3PILE ?auto_45868 ?auto_45869 ?auto_45870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45875 - BLOCK
      ?auto_45876 - BLOCK
      ?auto_45877 - BLOCK
    )
    :vars
    (
      ?auto_45880 - BLOCK
      ?auto_45879 - BLOCK
      ?auto_45881 - BLOCK
      ?auto_45878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45875 ?auto_45876 ) ) ( not ( = ?auto_45875 ?auto_45877 ) ) ( not ( = ?auto_45876 ?auto_45877 ) ) ( ON ?auto_45877 ?auto_45880 ) ( not ( = ?auto_45875 ?auto_45880 ) ) ( not ( = ?auto_45876 ?auto_45880 ) ) ( not ( = ?auto_45877 ?auto_45880 ) ) ( ON-TABLE ?auto_45879 ) ( ON ?auto_45881 ?auto_45879 ) ( ON ?auto_45880 ?auto_45881 ) ( not ( = ?auto_45879 ?auto_45881 ) ) ( not ( = ?auto_45879 ?auto_45880 ) ) ( not ( = ?auto_45879 ?auto_45877 ) ) ( not ( = ?auto_45879 ?auto_45876 ) ) ( not ( = ?auto_45881 ?auto_45880 ) ) ( not ( = ?auto_45881 ?auto_45877 ) ) ( not ( = ?auto_45881 ?auto_45876 ) ) ( not ( = ?auto_45875 ?auto_45879 ) ) ( not ( = ?auto_45875 ?auto_45881 ) ) ( ON ?auto_45875 ?auto_45878 ) ( CLEAR ?auto_45875 ) ( not ( = ?auto_45875 ?auto_45878 ) ) ( not ( = ?auto_45876 ?auto_45878 ) ) ( not ( = ?auto_45877 ?auto_45878 ) ) ( not ( = ?auto_45880 ?auto_45878 ) ) ( not ( = ?auto_45879 ?auto_45878 ) ) ( not ( = ?auto_45881 ?auto_45878 ) ) ( HOLDING ?auto_45876 ) ( CLEAR ?auto_45877 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45879 ?auto_45881 ?auto_45880 ?auto_45877 ?auto_45876 )
      ( MAKE-3PILE ?auto_45875 ?auto_45876 ?auto_45877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45882 - BLOCK
      ?auto_45883 - BLOCK
      ?auto_45884 - BLOCK
    )
    :vars
    (
      ?auto_45886 - BLOCK
      ?auto_45888 - BLOCK
      ?auto_45887 - BLOCK
      ?auto_45885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45882 ?auto_45883 ) ) ( not ( = ?auto_45882 ?auto_45884 ) ) ( not ( = ?auto_45883 ?auto_45884 ) ) ( ON ?auto_45884 ?auto_45886 ) ( not ( = ?auto_45882 ?auto_45886 ) ) ( not ( = ?auto_45883 ?auto_45886 ) ) ( not ( = ?auto_45884 ?auto_45886 ) ) ( ON-TABLE ?auto_45888 ) ( ON ?auto_45887 ?auto_45888 ) ( ON ?auto_45886 ?auto_45887 ) ( not ( = ?auto_45888 ?auto_45887 ) ) ( not ( = ?auto_45888 ?auto_45886 ) ) ( not ( = ?auto_45888 ?auto_45884 ) ) ( not ( = ?auto_45888 ?auto_45883 ) ) ( not ( = ?auto_45887 ?auto_45886 ) ) ( not ( = ?auto_45887 ?auto_45884 ) ) ( not ( = ?auto_45887 ?auto_45883 ) ) ( not ( = ?auto_45882 ?auto_45888 ) ) ( not ( = ?auto_45882 ?auto_45887 ) ) ( ON ?auto_45882 ?auto_45885 ) ( not ( = ?auto_45882 ?auto_45885 ) ) ( not ( = ?auto_45883 ?auto_45885 ) ) ( not ( = ?auto_45884 ?auto_45885 ) ) ( not ( = ?auto_45886 ?auto_45885 ) ) ( not ( = ?auto_45888 ?auto_45885 ) ) ( not ( = ?auto_45887 ?auto_45885 ) ) ( CLEAR ?auto_45884 ) ( ON ?auto_45883 ?auto_45882 ) ( CLEAR ?auto_45883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45885 ?auto_45882 )
      ( MAKE-3PILE ?auto_45882 ?auto_45883 ?auto_45884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45889 - BLOCK
      ?auto_45890 - BLOCK
      ?auto_45891 - BLOCK
    )
    :vars
    (
      ?auto_45893 - BLOCK
      ?auto_45892 - BLOCK
      ?auto_45895 - BLOCK
      ?auto_45894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45889 ?auto_45890 ) ) ( not ( = ?auto_45889 ?auto_45891 ) ) ( not ( = ?auto_45890 ?auto_45891 ) ) ( not ( = ?auto_45889 ?auto_45893 ) ) ( not ( = ?auto_45890 ?auto_45893 ) ) ( not ( = ?auto_45891 ?auto_45893 ) ) ( ON-TABLE ?auto_45892 ) ( ON ?auto_45895 ?auto_45892 ) ( ON ?auto_45893 ?auto_45895 ) ( not ( = ?auto_45892 ?auto_45895 ) ) ( not ( = ?auto_45892 ?auto_45893 ) ) ( not ( = ?auto_45892 ?auto_45891 ) ) ( not ( = ?auto_45892 ?auto_45890 ) ) ( not ( = ?auto_45895 ?auto_45893 ) ) ( not ( = ?auto_45895 ?auto_45891 ) ) ( not ( = ?auto_45895 ?auto_45890 ) ) ( not ( = ?auto_45889 ?auto_45892 ) ) ( not ( = ?auto_45889 ?auto_45895 ) ) ( ON ?auto_45889 ?auto_45894 ) ( not ( = ?auto_45889 ?auto_45894 ) ) ( not ( = ?auto_45890 ?auto_45894 ) ) ( not ( = ?auto_45891 ?auto_45894 ) ) ( not ( = ?auto_45893 ?auto_45894 ) ) ( not ( = ?auto_45892 ?auto_45894 ) ) ( not ( = ?auto_45895 ?auto_45894 ) ) ( ON ?auto_45890 ?auto_45889 ) ( CLEAR ?auto_45890 ) ( ON-TABLE ?auto_45894 ) ( HOLDING ?auto_45891 ) ( CLEAR ?auto_45893 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45892 ?auto_45895 ?auto_45893 ?auto_45891 )
      ( MAKE-3PILE ?auto_45889 ?auto_45890 ?auto_45891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45896 - BLOCK
      ?auto_45897 - BLOCK
      ?auto_45898 - BLOCK
    )
    :vars
    (
      ?auto_45901 - BLOCK
      ?auto_45902 - BLOCK
      ?auto_45899 - BLOCK
      ?auto_45900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45896 ?auto_45897 ) ) ( not ( = ?auto_45896 ?auto_45898 ) ) ( not ( = ?auto_45897 ?auto_45898 ) ) ( not ( = ?auto_45896 ?auto_45901 ) ) ( not ( = ?auto_45897 ?auto_45901 ) ) ( not ( = ?auto_45898 ?auto_45901 ) ) ( ON-TABLE ?auto_45902 ) ( ON ?auto_45899 ?auto_45902 ) ( ON ?auto_45901 ?auto_45899 ) ( not ( = ?auto_45902 ?auto_45899 ) ) ( not ( = ?auto_45902 ?auto_45901 ) ) ( not ( = ?auto_45902 ?auto_45898 ) ) ( not ( = ?auto_45902 ?auto_45897 ) ) ( not ( = ?auto_45899 ?auto_45901 ) ) ( not ( = ?auto_45899 ?auto_45898 ) ) ( not ( = ?auto_45899 ?auto_45897 ) ) ( not ( = ?auto_45896 ?auto_45902 ) ) ( not ( = ?auto_45896 ?auto_45899 ) ) ( ON ?auto_45896 ?auto_45900 ) ( not ( = ?auto_45896 ?auto_45900 ) ) ( not ( = ?auto_45897 ?auto_45900 ) ) ( not ( = ?auto_45898 ?auto_45900 ) ) ( not ( = ?auto_45901 ?auto_45900 ) ) ( not ( = ?auto_45902 ?auto_45900 ) ) ( not ( = ?auto_45899 ?auto_45900 ) ) ( ON ?auto_45897 ?auto_45896 ) ( ON-TABLE ?auto_45900 ) ( CLEAR ?auto_45901 ) ( ON ?auto_45898 ?auto_45897 ) ( CLEAR ?auto_45898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45900 ?auto_45896 ?auto_45897 )
      ( MAKE-3PILE ?auto_45896 ?auto_45897 ?auto_45898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45903 - BLOCK
      ?auto_45904 - BLOCK
      ?auto_45905 - BLOCK
    )
    :vars
    (
      ?auto_45907 - BLOCK
      ?auto_45906 - BLOCK
      ?auto_45909 - BLOCK
      ?auto_45908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45903 ?auto_45904 ) ) ( not ( = ?auto_45903 ?auto_45905 ) ) ( not ( = ?auto_45904 ?auto_45905 ) ) ( not ( = ?auto_45903 ?auto_45907 ) ) ( not ( = ?auto_45904 ?auto_45907 ) ) ( not ( = ?auto_45905 ?auto_45907 ) ) ( ON-TABLE ?auto_45906 ) ( ON ?auto_45909 ?auto_45906 ) ( not ( = ?auto_45906 ?auto_45909 ) ) ( not ( = ?auto_45906 ?auto_45907 ) ) ( not ( = ?auto_45906 ?auto_45905 ) ) ( not ( = ?auto_45906 ?auto_45904 ) ) ( not ( = ?auto_45909 ?auto_45907 ) ) ( not ( = ?auto_45909 ?auto_45905 ) ) ( not ( = ?auto_45909 ?auto_45904 ) ) ( not ( = ?auto_45903 ?auto_45906 ) ) ( not ( = ?auto_45903 ?auto_45909 ) ) ( ON ?auto_45903 ?auto_45908 ) ( not ( = ?auto_45903 ?auto_45908 ) ) ( not ( = ?auto_45904 ?auto_45908 ) ) ( not ( = ?auto_45905 ?auto_45908 ) ) ( not ( = ?auto_45907 ?auto_45908 ) ) ( not ( = ?auto_45906 ?auto_45908 ) ) ( not ( = ?auto_45909 ?auto_45908 ) ) ( ON ?auto_45904 ?auto_45903 ) ( ON-TABLE ?auto_45908 ) ( ON ?auto_45905 ?auto_45904 ) ( CLEAR ?auto_45905 ) ( HOLDING ?auto_45907 ) ( CLEAR ?auto_45909 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45906 ?auto_45909 ?auto_45907 )
      ( MAKE-3PILE ?auto_45903 ?auto_45904 ?auto_45905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45910 - BLOCK
      ?auto_45911 - BLOCK
      ?auto_45912 - BLOCK
    )
    :vars
    (
      ?auto_45916 - BLOCK
      ?auto_45915 - BLOCK
      ?auto_45914 - BLOCK
      ?auto_45913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45910 ?auto_45911 ) ) ( not ( = ?auto_45910 ?auto_45912 ) ) ( not ( = ?auto_45911 ?auto_45912 ) ) ( not ( = ?auto_45910 ?auto_45916 ) ) ( not ( = ?auto_45911 ?auto_45916 ) ) ( not ( = ?auto_45912 ?auto_45916 ) ) ( ON-TABLE ?auto_45915 ) ( ON ?auto_45914 ?auto_45915 ) ( not ( = ?auto_45915 ?auto_45914 ) ) ( not ( = ?auto_45915 ?auto_45916 ) ) ( not ( = ?auto_45915 ?auto_45912 ) ) ( not ( = ?auto_45915 ?auto_45911 ) ) ( not ( = ?auto_45914 ?auto_45916 ) ) ( not ( = ?auto_45914 ?auto_45912 ) ) ( not ( = ?auto_45914 ?auto_45911 ) ) ( not ( = ?auto_45910 ?auto_45915 ) ) ( not ( = ?auto_45910 ?auto_45914 ) ) ( ON ?auto_45910 ?auto_45913 ) ( not ( = ?auto_45910 ?auto_45913 ) ) ( not ( = ?auto_45911 ?auto_45913 ) ) ( not ( = ?auto_45912 ?auto_45913 ) ) ( not ( = ?auto_45916 ?auto_45913 ) ) ( not ( = ?auto_45915 ?auto_45913 ) ) ( not ( = ?auto_45914 ?auto_45913 ) ) ( ON ?auto_45911 ?auto_45910 ) ( ON-TABLE ?auto_45913 ) ( ON ?auto_45912 ?auto_45911 ) ( CLEAR ?auto_45914 ) ( ON ?auto_45916 ?auto_45912 ) ( CLEAR ?auto_45916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45913 ?auto_45910 ?auto_45911 ?auto_45912 )
      ( MAKE-3PILE ?auto_45910 ?auto_45911 ?auto_45912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45917 - BLOCK
      ?auto_45918 - BLOCK
      ?auto_45919 - BLOCK
    )
    :vars
    (
      ?auto_45920 - BLOCK
      ?auto_45922 - BLOCK
      ?auto_45923 - BLOCK
      ?auto_45921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45917 ?auto_45918 ) ) ( not ( = ?auto_45917 ?auto_45919 ) ) ( not ( = ?auto_45918 ?auto_45919 ) ) ( not ( = ?auto_45917 ?auto_45920 ) ) ( not ( = ?auto_45918 ?auto_45920 ) ) ( not ( = ?auto_45919 ?auto_45920 ) ) ( ON-TABLE ?auto_45922 ) ( not ( = ?auto_45922 ?auto_45923 ) ) ( not ( = ?auto_45922 ?auto_45920 ) ) ( not ( = ?auto_45922 ?auto_45919 ) ) ( not ( = ?auto_45922 ?auto_45918 ) ) ( not ( = ?auto_45923 ?auto_45920 ) ) ( not ( = ?auto_45923 ?auto_45919 ) ) ( not ( = ?auto_45923 ?auto_45918 ) ) ( not ( = ?auto_45917 ?auto_45922 ) ) ( not ( = ?auto_45917 ?auto_45923 ) ) ( ON ?auto_45917 ?auto_45921 ) ( not ( = ?auto_45917 ?auto_45921 ) ) ( not ( = ?auto_45918 ?auto_45921 ) ) ( not ( = ?auto_45919 ?auto_45921 ) ) ( not ( = ?auto_45920 ?auto_45921 ) ) ( not ( = ?auto_45922 ?auto_45921 ) ) ( not ( = ?auto_45923 ?auto_45921 ) ) ( ON ?auto_45918 ?auto_45917 ) ( ON-TABLE ?auto_45921 ) ( ON ?auto_45919 ?auto_45918 ) ( ON ?auto_45920 ?auto_45919 ) ( CLEAR ?auto_45920 ) ( HOLDING ?auto_45923 ) ( CLEAR ?auto_45922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45922 ?auto_45923 )
      ( MAKE-3PILE ?auto_45917 ?auto_45918 ?auto_45919 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45924 - BLOCK
      ?auto_45925 - BLOCK
      ?auto_45926 - BLOCK
    )
    :vars
    (
      ?auto_45927 - BLOCK
      ?auto_45929 - BLOCK
      ?auto_45930 - BLOCK
      ?auto_45928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45924 ?auto_45925 ) ) ( not ( = ?auto_45924 ?auto_45926 ) ) ( not ( = ?auto_45925 ?auto_45926 ) ) ( not ( = ?auto_45924 ?auto_45927 ) ) ( not ( = ?auto_45925 ?auto_45927 ) ) ( not ( = ?auto_45926 ?auto_45927 ) ) ( ON-TABLE ?auto_45929 ) ( not ( = ?auto_45929 ?auto_45930 ) ) ( not ( = ?auto_45929 ?auto_45927 ) ) ( not ( = ?auto_45929 ?auto_45926 ) ) ( not ( = ?auto_45929 ?auto_45925 ) ) ( not ( = ?auto_45930 ?auto_45927 ) ) ( not ( = ?auto_45930 ?auto_45926 ) ) ( not ( = ?auto_45930 ?auto_45925 ) ) ( not ( = ?auto_45924 ?auto_45929 ) ) ( not ( = ?auto_45924 ?auto_45930 ) ) ( ON ?auto_45924 ?auto_45928 ) ( not ( = ?auto_45924 ?auto_45928 ) ) ( not ( = ?auto_45925 ?auto_45928 ) ) ( not ( = ?auto_45926 ?auto_45928 ) ) ( not ( = ?auto_45927 ?auto_45928 ) ) ( not ( = ?auto_45929 ?auto_45928 ) ) ( not ( = ?auto_45930 ?auto_45928 ) ) ( ON ?auto_45925 ?auto_45924 ) ( ON-TABLE ?auto_45928 ) ( ON ?auto_45926 ?auto_45925 ) ( ON ?auto_45927 ?auto_45926 ) ( CLEAR ?auto_45929 ) ( ON ?auto_45930 ?auto_45927 ) ( CLEAR ?auto_45930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45928 ?auto_45924 ?auto_45925 ?auto_45926 ?auto_45927 )
      ( MAKE-3PILE ?auto_45924 ?auto_45925 ?auto_45926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45931 - BLOCK
      ?auto_45932 - BLOCK
      ?auto_45933 - BLOCK
    )
    :vars
    (
      ?auto_45934 - BLOCK
      ?auto_45937 - BLOCK
      ?auto_45936 - BLOCK
      ?auto_45935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45931 ?auto_45932 ) ) ( not ( = ?auto_45931 ?auto_45933 ) ) ( not ( = ?auto_45932 ?auto_45933 ) ) ( not ( = ?auto_45931 ?auto_45934 ) ) ( not ( = ?auto_45932 ?auto_45934 ) ) ( not ( = ?auto_45933 ?auto_45934 ) ) ( not ( = ?auto_45937 ?auto_45936 ) ) ( not ( = ?auto_45937 ?auto_45934 ) ) ( not ( = ?auto_45937 ?auto_45933 ) ) ( not ( = ?auto_45937 ?auto_45932 ) ) ( not ( = ?auto_45936 ?auto_45934 ) ) ( not ( = ?auto_45936 ?auto_45933 ) ) ( not ( = ?auto_45936 ?auto_45932 ) ) ( not ( = ?auto_45931 ?auto_45937 ) ) ( not ( = ?auto_45931 ?auto_45936 ) ) ( ON ?auto_45931 ?auto_45935 ) ( not ( = ?auto_45931 ?auto_45935 ) ) ( not ( = ?auto_45932 ?auto_45935 ) ) ( not ( = ?auto_45933 ?auto_45935 ) ) ( not ( = ?auto_45934 ?auto_45935 ) ) ( not ( = ?auto_45937 ?auto_45935 ) ) ( not ( = ?auto_45936 ?auto_45935 ) ) ( ON ?auto_45932 ?auto_45931 ) ( ON-TABLE ?auto_45935 ) ( ON ?auto_45933 ?auto_45932 ) ( ON ?auto_45934 ?auto_45933 ) ( ON ?auto_45936 ?auto_45934 ) ( CLEAR ?auto_45936 ) ( HOLDING ?auto_45937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45937 )
      ( MAKE-3PILE ?auto_45931 ?auto_45932 ?auto_45933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45938 - BLOCK
      ?auto_45939 - BLOCK
      ?auto_45940 - BLOCK
    )
    :vars
    (
      ?auto_45944 - BLOCK
      ?auto_45943 - BLOCK
      ?auto_45942 - BLOCK
      ?auto_45941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45938 ?auto_45939 ) ) ( not ( = ?auto_45938 ?auto_45940 ) ) ( not ( = ?auto_45939 ?auto_45940 ) ) ( not ( = ?auto_45938 ?auto_45944 ) ) ( not ( = ?auto_45939 ?auto_45944 ) ) ( not ( = ?auto_45940 ?auto_45944 ) ) ( not ( = ?auto_45943 ?auto_45942 ) ) ( not ( = ?auto_45943 ?auto_45944 ) ) ( not ( = ?auto_45943 ?auto_45940 ) ) ( not ( = ?auto_45943 ?auto_45939 ) ) ( not ( = ?auto_45942 ?auto_45944 ) ) ( not ( = ?auto_45942 ?auto_45940 ) ) ( not ( = ?auto_45942 ?auto_45939 ) ) ( not ( = ?auto_45938 ?auto_45943 ) ) ( not ( = ?auto_45938 ?auto_45942 ) ) ( ON ?auto_45938 ?auto_45941 ) ( not ( = ?auto_45938 ?auto_45941 ) ) ( not ( = ?auto_45939 ?auto_45941 ) ) ( not ( = ?auto_45940 ?auto_45941 ) ) ( not ( = ?auto_45944 ?auto_45941 ) ) ( not ( = ?auto_45943 ?auto_45941 ) ) ( not ( = ?auto_45942 ?auto_45941 ) ) ( ON ?auto_45939 ?auto_45938 ) ( ON-TABLE ?auto_45941 ) ( ON ?auto_45940 ?auto_45939 ) ( ON ?auto_45944 ?auto_45940 ) ( ON ?auto_45942 ?auto_45944 ) ( ON ?auto_45943 ?auto_45942 ) ( CLEAR ?auto_45943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45941 ?auto_45938 ?auto_45939 ?auto_45940 ?auto_45944 ?auto_45942 )
      ( MAKE-3PILE ?auto_45938 ?auto_45939 ?auto_45940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45947 - BLOCK
      ?auto_45948 - BLOCK
    )
    :vars
    (
      ?auto_45949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45949 ?auto_45948 ) ( CLEAR ?auto_45949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45947 ) ( ON ?auto_45948 ?auto_45947 ) ( not ( = ?auto_45947 ?auto_45948 ) ) ( not ( = ?auto_45947 ?auto_45949 ) ) ( not ( = ?auto_45948 ?auto_45949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45949 ?auto_45948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45950 - BLOCK
      ?auto_45951 - BLOCK
    )
    :vars
    (
      ?auto_45952 - BLOCK
      ?auto_45953 - BLOCK
      ?auto_45954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45952 ?auto_45951 ) ( CLEAR ?auto_45952 ) ( ON-TABLE ?auto_45950 ) ( ON ?auto_45951 ?auto_45950 ) ( not ( = ?auto_45950 ?auto_45951 ) ) ( not ( = ?auto_45950 ?auto_45952 ) ) ( not ( = ?auto_45951 ?auto_45952 ) ) ( HOLDING ?auto_45953 ) ( CLEAR ?auto_45954 ) ( not ( = ?auto_45950 ?auto_45953 ) ) ( not ( = ?auto_45950 ?auto_45954 ) ) ( not ( = ?auto_45951 ?auto_45953 ) ) ( not ( = ?auto_45951 ?auto_45954 ) ) ( not ( = ?auto_45952 ?auto_45953 ) ) ( not ( = ?auto_45952 ?auto_45954 ) ) ( not ( = ?auto_45953 ?auto_45954 ) ) )
    :subtasks
    ( ( !STACK ?auto_45953 ?auto_45954 )
      ( MAKE-2PILE ?auto_45950 ?auto_45951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45955 - BLOCK
      ?auto_45956 - BLOCK
    )
    :vars
    (
      ?auto_45958 - BLOCK
      ?auto_45959 - BLOCK
      ?auto_45957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45958 ?auto_45956 ) ( ON-TABLE ?auto_45955 ) ( ON ?auto_45956 ?auto_45955 ) ( not ( = ?auto_45955 ?auto_45956 ) ) ( not ( = ?auto_45955 ?auto_45958 ) ) ( not ( = ?auto_45956 ?auto_45958 ) ) ( CLEAR ?auto_45959 ) ( not ( = ?auto_45955 ?auto_45957 ) ) ( not ( = ?auto_45955 ?auto_45959 ) ) ( not ( = ?auto_45956 ?auto_45957 ) ) ( not ( = ?auto_45956 ?auto_45959 ) ) ( not ( = ?auto_45958 ?auto_45957 ) ) ( not ( = ?auto_45958 ?auto_45959 ) ) ( not ( = ?auto_45957 ?auto_45959 ) ) ( ON ?auto_45957 ?auto_45958 ) ( CLEAR ?auto_45957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45955 ?auto_45956 ?auto_45958 )
      ( MAKE-2PILE ?auto_45955 ?auto_45956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45960 - BLOCK
      ?auto_45961 - BLOCK
    )
    :vars
    (
      ?auto_45963 - BLOCK
      ?auto_45962 - BLOCK
      ?auto_45964 - BLOCK
      ?auto_45965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45963 ?auto_45961 ) ( ON-TABLE ?auto_45960 ) ( ON ?auto_45961 ?auto_45960 ) ( not ( = ?auto_45960 ?auto_45961 ) ) ( not ( = ?auto_45960 ?auto_45963 ) ) ( not ( = ?auto_45961 ?auto_45963 ) ) ( not ( = ?auto_45960 ?auto_45962 ) ) ( not ( = ?auto_45960 ?auto_45964 ) ) ( not ( = ?auto_45961 ?auto_45962 ) ) ( not ( = ?auto_45961 ?auto_45964 ) ) ( not ( = ?auto_45963 ?auto_45962 ) ) ( not ( = ?auto_45963 ?auto_45964 ) ) ( not ( = ?auto_45962 ?auto_45964 ) ) ( ON ?auto_45962 ?auto_45963 ) ( CLEAR ?auto_45962 ) ( HOLDING ?auto_45964 ) ( CLEAR ?auto_45965 ) ( ON-TABLE ?auto_45965 ) ( not ( = ?auto_45965 ?auto_45964 ) ) ( not ( = ?auto_45960 ?auto_45965 ) ) ( not ( = ?auto_45961 ?auto_45965 ) ) ( not ( = ?auto_45963 ?auto_45965 ) ) ( not ( = ?auto_45962 ?auto_45965 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45965 ?auto_45964 )
      ( MAKE-2PILE ?auto_45960 ?auto_45961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45966 - BLOCK
      ?auto_45967 - BLOCK
    )
    :vars
    (
      ?auto_45970 - BLOCK
      ?auto_45969 - BLOCK
      ?auto_45968 - BLOCK
      ?auto_45971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45970 ?auto_45967 ) ( ON-TABLE ?auto_45966 ) ( ON ?auto_45967 ?auto_45966 ) ( not ( = ?auto_45966 ?auto_45967 ) ) ( not ( = ?auto_45966 ?auto_45970 ) ) ( not ( = ?auto_45967 ?auto_45970 ) ) ( not ( = ?auto_45966 ?auto_45969 ) ) ( not ( = ?auto_45966 ?auto_45968 ) ) ( not ( = ?auto_45967 ?auto_45969 ) ) ( not ( = ?auto_45967 ?auto_45968 ) ) ( not ( = ?auto_45970 ?auto_45969 ) ) ( not ( = ?auto_45970 ?auto_45968 ) ) ( not ( = ?auto_45969 ?auto_45968 ) ) ( ON ?auto_45969 ?auto_45970 ) ( CLEAR ?auto_45971 ) ( ON-TABLE ?auto_45971 ) ( not ( = ?auto_45971 ?auto_45968 ) ) ( not ( = ?auto_45966 ?auto_45971 ) ) ( not ( = ?auto_45967 ?auto_45971 ) ) ( not ( = ?auto_45970 ?auto_45971 ) ) ( not ( = ?auto_45969 ?auto_45971 ) ) ( ON ?auto_45968 ?auto_45969 ) ( CLEAR ?auto_45968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45966 ?auto_45967 ?auto_45970 ?auto_45969 )
      ( MAKE-2PILE ?auto_45966 ?auto_45967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45972 - BLOCK
      ?auto_45973 - BLOCK
    )
    :vars
    (
      ?auto_45977 - BLOCK
      ?auto_45975 - BLOCK
      ?auto_45974 - BLOCK
      ?auto_45976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45977 ?auto_45973 ) ( ON-TABLE ?auto_45972 ) ( ON ?auto_45973 ?auto_45972 ) ( not ( = ?auto_45972 ?auto_45973 ) ) ( not ( = ?auto_45972 ?auto_45977 ) ) ( not ( = ?auto_45973 ?auto_45977 ) ) ( not ( = ?auto_45972 ?auto_45975 ) ) ( not ( = ?auto_45972 ?auto_45974 ) ) ( not ( = ?auto_45973 ?auto_45975 ) ) ( not ( = ?auto_45973 ?auto_45974 ) ) ( not ( = ?auto_45977 ?auto_45975 ) ) ( not ( = ?auto_45977 ?auto_45974 ) ) ( not ( = ?auto_45975 ?auto_45974 ) ) ( ON ?auto_45975 ?auto_45977 ) ( not ( = ?auto_45976 ?auto_45974 ) ) ( not ( = ?auto_45972 ?auto_45976 ) ) ( not ( = ?auto_45973 ?auto_45976 ) ) ( not ( = ?auto_45977 ?auto_45976 ) ) ( not ( = ?auto_45975 ?auto_45976 ) ) ( ON ?auto_45974 ?auto_45975 ) ( CLEAR ?auto_45974 ) ( HOLDING ?auto_45976 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45976 )
      ( MAKE-2PILE ?auto_45972 ?auto_45973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45978 - BLOCK
      ?auto_45979 - BLOCK
    )
    :vars
    (
      ?auto_45982 - BLOCK
      ?auto_45983 - BLOCK
      ?auto_45980 - BLOCK
      ?auto_45981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45982 ?auto_45979 ) ( ON-TABLE ?auto_45978 ) ( ON ?auto_45979 ?auto_45978 ) ( not ( = ?auto_45978 ?auto_45979 ) ) ( not ( = ?auto_45978 ?auto_45982 ) ) ( not ( = ?auto_45979 ?auto_45982 ) ) ( not ( = ?auto_45978 ?auto_45983 ) ) ( not ( = ?auto_45978 ?auto_45980 ) ) ( not ( = ?auto_45979 ?auto_45983 ) ) ( not ( = ?auto_45979 ?auto_45980 ) ) ( not ( = ?auto_45982 ?auto_45983 ) ) ( not ( = ?auto_45982 ?auto_45980 ) ) ( not ( = ?auto_45983 ?auto_45980 ) ) ( ON ?auto_45983 ?auto_45982 ) ( not ( = ?auto_45981 ?auto_45980 ) ) ( not ( = ?auto_45978 ?auto_45981 ) ) ( not ( = ?auto_45979 ?auto_45981 ) ) ( not ( = ?auto_45982 ?auto_45981 ) ) ( not ( = ?auto_45983 ?auto_45981 ) ) ( ON ?auto_45980 ?auto_45983 ) ( ON ?auto_45981 ?auto_45980 ) ( CLEAR ?auto_45981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45978 ?auto_45979 ?auto_45982 ?auto_45983 ?auto_45980 )
      ( MAKE-2PILE ?auto_45978 ?auto_45979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45984 - BLOCK
      ?auto_45985 - BLOCK
    )
    :vars
    (
      ?auto_45987 - BLOCK
      ?auto_45986 - BLOCK
      ?auto_45988 - BLOCK
      ?auto_45989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45987 ?auto_45985 ) ( ON-TABLE ?auto_45984 ) ( ON ?auto_45985 ?auto_45984 ) ( not ( = ?auto_45984 ?auto_45985 ) ) ( not ( = ?auto_45984 ?auto_45987 ) ) ( not ( = ?auto_45985 ?auto_45987 ) ) ( not ( = ?auto_45984 ?auto_45986 ) ) ( not ( = ?auto_45984 ?auto_45988 ) ) ( not ( = ?auto_45985 ?auto_45986 ) ) ( not ( = ?auto_45985 ?auto_45988 ) ) ( not ( = ?auto_45987 ?auto_45986 ) ) ( not ( = ?auto_45987 ?auto_45988 ) ) ( not ( = ?auto_45986 ?auto_45988 ) ) ( ON ?auto_45986 ?auto_45987 ) ( not ( = ?auto_45989 ?auto_45988 ) ) ( not ( = ?auto_45984 ?auto_45989 ) ) ( not ( = ?auto_45985 ?auto_45989 ) ) ( not ( = ?auto_45987 ?auto_45989 ) ) ( not ( = ?auto_45986 ?auto_45989 ) ) ( ON ?auto_45988 ?auto_45986 ) ( HOLDING ?auto_45989 ) ( CLEAR ?auto_45988 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45984 ?auto_45985 ?auto_45987 ?auto_45986 ?auto_45988 ?auto_45989 )
      ( MAKE-2PILE ?auto_45984 ?auto_45985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45990 - BLOCK
      ?auto_45991 - BLOCK
    )
    :vars
    (
      ?auto_45994 - BLOCK
      ?auto_45995 - BLOCK
      ?auto_45992 - BLOCK
      ?auto_45993 - BLOCK
      ?auto_45996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45994 ?auto_45991 ) ( ON-TABLE ?auto_45990 ) ( ON ?auto_45991 ?auto_45990 ) ( not ( = ?auto_45990 ?auto_45991 ) ) ( not ( = ?auto_45990 ?auto_45994 ) ) ( not ( = ?auto_45991 ?auto_45994 ) ) ( not ( = ?auto_45990 ?auto_45995 ) ) ( not ( = ?auto_45990 ?auto_45992 ) ) ( not ( = ?auto_45991 ?auto_45995 ) ) ( not ( = ?auto_45991 ?auto_45992 ) ) ( not ( = ?auto_45994 ?auto_45995 ) ) ( not ( = ?auto_45994 ?auto_45992 ) ) ( not ( = ?auto_45995 ?auto_45992 ) ) ( ON ?auto_45995 ?auto_45994 ) ( not ( = ?auto_45993 ?auto_45992 ) ) ( not ( = ?auto_45990 ?auto_45993 ) ) ( not ( = ?auto_45991 ?auto_45993 ) ) ( not ( = ?auto_45994 ?auto_45993 ) ) ( not ( = ?auto_45995 ?auto_45993 ) ) ( ON ?auto_45992 ?auto_45995 ) ( CLEAR ?auto_45992 ) ( ON ?auto_45993 ?auto_45996 ) ( CLEAR ?auto_45993 ) ( HAND-EMPTY ) ( not ( = ?auto_45990 ?auto_45996 ) ) ( not ( = ?auto_45991 ?auto_45996 ) ) ( not ( = ?auto_45994 ?auto_45996 ) ) ( not ( = ?auto_45995 ?auto_45996 ) ) ( not ( = ?auto_45992 ?auto_45996 ) ) ( not ( = ?auto_45993 ?auto_45996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45993 ?auto_45996 )
      ( MAKE-2PILE ?auto_45990 ?auto_45991 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45997 - BLOCK
      ?auto_45998 - BLOCK
    )
    :vars
    (
      ?auto_45999 - BLOCK
      ?auto_46001 - BLOCK
      ?auto_46003 - BLOCK
      ?auto_46002 - BLOCK
      ?auto_46000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45999 ?auto_45998 ) ( ON-TABLE ?auto_45997 ) ( ON ?auto_45998 ?auto_45997 ) ( not ( = ?auto_45997 ?auto_45998 ) ) ( not ( = ?auto_45997 ?auto_45999 ) ) ( not ( = ?auto_45998 ?auto_45999 ) ) ( not ( = ?auto_45997 ?auto_46001 ) ) ( not ( = ?auto_45997 ?auto_46003 ) ) ( not ( = ?auto_45998 ?auto_46001 ) ) ( not ( = ?auto_45998 ?auto_46003 ) ) ( not ( = ?auto_45999 ?auto_46001 ) ) ( not ( = ?auto_45999 ?auto_46003 ) ) ( not ( = ?auto_46001 ?auto_46003 ) ) ( ON ?auto_46001 ?auto_45999 ) ( not ( = ?auto_46002 ?auto_46003 ) ) ( not ( = ?auto_45997 ?auto_46002 ) ) ( not ( = ?auto_45998 ?auto_46002 ) ) ( not ( = ?auto_45999 ?auto_46002 ) ) ( not ( = ?auto_46001 ?auto_46002 ) ) ( ON ?auto_46002 ?auto_46000 ) ( CLEAR ?auto_46002 ) ( not ( = ?auto_45997 ?auto_46000 ) ) ( not ( = ?auto_45998 ?auto_46000 ) ) ( not ( = ?auto_45999 ?auto_46000 ) ) ( not ( = ?auto_46001 ?auto_46000 ) ) ( not ( = ?auto_46003 ?auto_46000 ) ) ( not ( = ?auto_46002 ?auto_46000 ) ) ( HOLDING ?auto_46003 ) ( CLEAR ?auto_46001 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45997 ?auto_45998 ?auto_45999 ?auto_46001 ?auto_46003 )
      ( MAKE-2PILE ?auto_45997 ?auto_45998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46004 - BLOCK
      ?auto_46005 - BLOCK
    )
    :vars
    (
      ?auto_46009 - BLOCK
      ?auto_46007 - BLOCK
      ?auto_46010 - BLOCK
      ?auto_46008 - BLOCK
      ?auto_46006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46009 ?auto_46005 ) ( ON-TABLE ?auto_46004 ) ( ON ?auto_46005 ?auto_46004 ) ( not ( = ?auto_46004 ?auto_46005 ) ) ( not ( = ?auto_46004 ?auto_46009 ) ) ( not ( = ?auto_46005 ?auto_46009 ) ) ( not ( = ?auto_46004 ?auto_46007 ) ) ( not ( = ?auto_46004 ?auto_46010 ) ) ( not ( = ?auto_46005 ?auto_46007 ) ) ( not ( = ?auto_46005 ?auto_46010 ) ) ( not ( = ?auto_46009 ?auto_46007 ) ) ( not ( = ?auto_46009 ?auto_46010 ) ) ( not ( = ?auto_46007 ?auto_46010 ) ) ( ON ?auto_46007 ?auto_46009 ) ( not ( = ?auto_46008 ?auto_46010 ) ) ( not ( = ?auto_46004 ?auto_46008 ) ) ( not ( = ?auto_46005 ?auto_46008 ) ) ( not ( = ?auto_46009 ?auto_46008 ) ) ( not ( = ?auto_46007 ?auto_46008 ) ) ( ON ?auto_46008 ?auto_46006 ) ( not ( = ?auto_46004 ?auto_46006 ) ) ( not ( = ?auto_46005 ?auto_46006 ) ) ( not ( = ?auto_46009 ?auto_46006 ) ) ( not ( = ?auto_46007 ?auto_46006 ) ) ( not ( = ?auto_46010 ?auto_46006 ) ) ( not ( = ?auto_46008 ?auto_46006 ) ) ( CLEAR ?auto_46007 ) ( ON ?auto_46010 ?auto_46008 ) ( CLEAR ?auto_46010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46006 ?auto_46008 )
      ( MAKE-2PILE ?auto_46004 ?auto_46005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46011 - BLOCK
      ?auto_46012 - BLOCK
    )
    :vars
    (
      ?auto_46014 - BLOCK
      ?auto_46015 - BLOCK
      ?auto_46017 - BLOCK
      ?auto_46016 - BLOCK
      ?auto_46013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46014 ?auto_46012 ) ( ON-TABLE ?auto_46011 ) ( ON ?auto_46012 ?auto_46011 ) ( not ( = ?auto_46011 ?auto_46012 ) ) ( not ( = ?auto_46011 ?auto_46014 ) ) ( not ( = ?auto_46012 ?auto_46014 ) ) ( not ( = ?auto_46011 ?auto_46015 ) ) ( not ( = ?auto_46011 ?auto_46017 ) ) ( not ( = ?auto_46012 ?auto_46015 ) ) ( not ( = ?auto_46012 ?auto_46017 ) ) ( not ( = ?auto_46014 ?auto_46015 ) ) ( not ( = ?auto_46014 ?auto_46017 ) ) ( not ( = ?auto_46015 ?auto_46017 ) ) ( not ( = ?auto_46016 ?auto_46017 ) ) ( not ( = ?auto_46011 ?auto_46016 ) ) ( not ( = ?auto_46012 ?auto_46016 ) ) ( not ( = ?auto_46014 ?auto_46016 ) ) ( not ( = ?auto_46015 ?auto_46016 ) ) ( ON ?auto_46016 ?auto_46013 ) ( not ( = ?auto_46011 ?auto_46013 ) ) ( not ( = ?auto_46012 ?auto_46013 ) ) ( not ( = ?auto_46014 ?auto_46013 ) ) ( not ( = ?auto_46015 ?auto_46013 ) ) ( not ( = ?auto_46017 ?auto_46013 ) ) ( not ( = ?auto_46016 ?auto_46013 ) ) ( ON ?auto_46017 ?auto_46016 ) ( CLEAR ?auto_46017 ) ( ON-TABLE ?auto_46013 ) ( HOLDING ?auto_46015 ) ( CLEAR ?auto_46014 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46011 ?auto_46012 ?auto_46014 ?auto_46015 )
      ( MAKE-2PILE ?auto_46011 ?auto_46012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46018 - BLOCK
      ?auto_46019 - BLOCK
    )
    :vars
    (
      ?auto_46024 - BLOCK
      ?auto_46020 - BLOCK
      ?auto_46021 - BLOCK
      ?auto_46023 - BLOCK
      ?auto_46022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46024 ?auto_46019 ) ( ON-TABLE ?auto_46018 ) ( ON ?auto_46019 ?auto_46018 ) ( not ( = ?auto_46018 ?auto_46019 ) ) ( not ( = ?auto_46018 ?auto_46024 ) ) ( not ( = ?auto_46019 ?auto_46024 ) ) ( not ( = ?auto_46018 ?auto_46020 ) ) ( not ( = ?auto_46018 ?auto_46021 ) ) ( not ( = ?auto_46019 ?auto_46020 ) ) ( not ( = ?auto_46019 ?auto_46021 ) ) ( not ( = ?auto_46024 ?auto_46020 ) ) ( not ( = ?auto_46024 ?auto_46021 ) ) ( not ( = ?auto_46020 ?auto_46021 ) ) ( not ( = ?auto_46023 ?auto_46021 ) ) ( not ( = ?auto_46018 ?auto_46023 ) ) ( not ( = ?auto_46019 ?auto_46023 ) ) ( not ( = ?auto_46024 ?auto_46023 ) ) ( not ( = ?auto_46020 ?auto_46023 ) ) ( ON ?auto_46023 ?auto_46022 ) ( not ( = ?auto_46018 ?auto_46022 ) ) ( not ( = ?auto_46019 ?auto_46022 ) ) ( not ( = ?auto_46024 ?auto_46022 ) ) ( not ( = ?auto_46020 ?auto_46022 ) ) ( not ( = ?auto_46021 ?auto_46022 ) ) ( not ( = ?auto_46023 ?auto_46022 ) ) ( ON ?auto_46021 ?auto_46023 ) ( ON-TABLE ?auto_46022 ) ( CLEAR ?auto_46024 ) ( ON ?auto_46020 ?auto_46021 ) ( CLEAR ?auto_46020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46022 ?auto_46023 ?auto_46021 )
      ( MAKE-2PILE ?auto_46018 ?auto_46019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46039 - BLOCK
      ?auto_46040 - BLOCK
    )
    :vars
    (
      ?auto_46041 - BLOCK
      ?auto_46044 - BLOCK
      ?auto_46045 - BLOCK
      ?auto_46043 - BLOCK
      ?auto_46042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46039 ) ( not ( = ?auto_46039 ?auto_46040 ) ) ( not ( = ?auto_46039 ?auto_46041 ) ) ( not ( = ?auto_46040 ?auto_46041 ) ) ( not ( = ?auto_46039 ?auto_46044 ) ) ( not ( = ?auto_46039 ?auto_46045 ) ) ( not ( = ?auto_46040 ?auto_46044 ) ) ( not ( = ?auto_46040 ?auto_46045 ) ) ( not ( = ?auto_46041 ?auto_46044 ) ) ( not ( = ?auto_46041 ?auto_46045 ) ) ( not ( = ?auto_46044 ?auto_46045 ) ) ( not ( = ?auto_46043 ?auto_46045 ) ) ( not ( = ?auto_46039 ?auto_46043 ) ) ( not ( = ?auto_46040 ?auto_46043 ) ) ( not ( = ?auto_46041 ?auto_46043 ) ) ( not ( = ?auto_46044 ?auto_46043 ) ) ( ON ?auto_46043 ?auto_46042 ) ( not ( = ?auto_46039 ?auto_46042 ) ) ( not ( = ?auto_46040 ?auto_46042 ) ) ( not ( = ?auto_46041 ?auto_46042 ) ) ( not ( = ?auto_46044 ?auto_46042 ) ) ( not ( = ?auto_46045 ?auto_46042 ) ) ( not ( = ?auto_46043 ?auto_46042 ) ) ( ON ?auto_46045 ?auto_46043 ) ( ON-TABLE ?auto_46042 ) ( ON ?auto_46044 ?auto_46045 ) ( ON ?auto_46041 ?auto_46044 ) ( CLEAR ?auto_46041 ) ( HOLDING ?auto_46040 ) ( CLEAR ?auto_46039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46039 ?auto_46040 ?auto_46041 )
      ( MAKE-2PILE ?auto_46039 ?auto_46040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46046 - BLOCK
      ?auto_46047 - BLOCK
    )
    :vars
    (
      ?auto_46049 - BLOCK
      ?auto_46051 - BLOCK
      ?auto_46052 - BLOCK
      ?auto_46048 - BLOCK
      ?auto_46050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46046 ) ( not ( = ?auto_46046 ?auto_46047 ) ) ( not ( = ?auto_46046 ?auto_46049 ) ) ( not ( = ?auto_46047 ?auto_46049 ) ) ( not ( = ?auto_46046 ?auto_46051 ) ) ( not ( = ?auto_46046 ?auto_46052 ) ) ( not ( = ?auto_46047 ?auto_46051 ) ) ( not ( = ?auto_46047 ?auto_46052 ) ) ( not ( = ?auto_46049 ?auto_46051 ) ) ( not ( = ?auto_46049 ?auto_46052 ) ) ( not ( = ?auto_46051 ?auto_46052 ) ) ( not ( = ?auto_46048 ?auto_46052 ) ) ( not ( = ?auto_46046 ?auto_46048 ) ) ( not ( = ?auto_46047 ?auto_46048 ) ) ( not ( = ?auto_46049 ?auto_46048 ) ) ( not ( = ?auto_46051 ?auto_46048 ) ) ( ON ?auto_46048 ?auto_46050 ) ( not ( = ?auto_46046 ?auto_46050 ) ) ( not ( = ?auto_46047 ?auto_46050 ) ) ( not ( = ?auto_46049 ?auto_46050 ) ) ( not ( = ?auto_46051 ?auto_46050 ) ) ( not ( = ?auto_46052 ?auto_46050 ) ) ( not ( = ?auto_46048 ?auto_46050 ) ) ( ON ?auto_46052 ?auto_46048 ) ( ON-TABLE ?auto_46050 ) ( ON ?auto_46051 ?auto_46052 ) ( ON ?auto_46049 ?auto_46051 ) ( CLEAR ?auto_46046 ) ( ON ?auto_46047 ?auto_46049 ) ( CLEAR ?auto_46047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46050 ?auto_46048 ?auto_46052 ?auto_46051 ?auto_46049 )
      ( MAKE-2PILE ?auto_46046 ?auto_46047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46053 - BLOCK
      ?auto_46054 - BLOCK
    )
    :vars
    (
      ?auto_46055 - BLOCK
      ?auto_46059 - BLOCK
      ?auto_46058 - BLOCK
      ?auto_46056 - BLOCK
      ?auto_46057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46053 ?auto_46054 ) ) ( not ( = ?auto_46053 ?auto_46055 ) ) ( not ( = ?auto_46054 ?auto_46055 ) ) ( not ( = ?auto_46053 ?auto_46059 ) ) ( not ( = ?auto_46053 ?auto_46058 ) ) ( not ( = ?auto_46054 ?auto_46059 ) ) ( not ( = ?auto_46054 ?auto_46058 ) ) ( not ( = ?auto_46055 ?auto_46059 ) ) ( not ( = ?auto_46055 ?auto_46058 ) ) ( not ( = ?auto_46059 ?auto_46058 ) ) ( not ( = ?auto_46056 ?auto_46058 ) ) ( not ( = ?auto_46053 ?auto_46056 ) ) ( not ( = ?auto_46054 ?auto_46056 ) ) ( not ( = ?auto_46055 ?auto_46056 ) ) ( not ( = ?auto_46059 ?auto_46056 ) ) ( ON ?auto_46056 ?auto_46057 ) ( not ( = ?auto_46053 ?auto_46057 ) ) ( not ( = ?auto_46054 ?auto_46057 ) ) ( not ( = ?auto_46055 ?auto_46057 ) ) ( not ( = ?auto_46059 ?auto_46057 ) ) ( not ( = ?auto_46058 ?auto_46057 ) ) ( not ( = ?auto_46056 ?auto_46057 ) ) ( ON ?auto_46058 ?auto_46056 ) ( ON-TABLE ?auto_46057 ) ( ON ?auto_46059 ?auto_46058 ) ( ON ?auto_46055 ?auto_46059 ) ( ON ?auto_46054 ?auto_46055 ) ( CLEAR ?auto_46054 ) ( HOLDING ?auto_46053 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46053 )
      ( MAKE-2PILE ?auto_46053 ?auto_46054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46060 - BLOCK
      ?auto_46061 - BLOCK
    )
    :vars
    (
      ?auto_46066 - BLOCK
      ?auto_46063 - BLOCK
      ?auto_46064 - BLOCK
      ?auto_46065 - BLOCK
      ?auto_46062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46060 ?auto_46061 ) ) ( not ( = ?auto_46060 ?auto_46066 ) ) ( not ( = ?auto_46061 ?auto_46066 ) ) ( not ( = ?auto_46060 ?auto_46063 ) ) ( not ( = ?auto_46060 ?auto_46064 ) ) ( not ( = ?auto_46061 ?auto_46063 ) ) ( not ( = ?auto_46061 ?auto_46064 ) ) ( not ( = ?auto_46066 ?auto_46063 ) ) ( not ( = ?auto_46066 ?auto_46064 ) ) ( not ( = ?auto_46063 ?auto_46064 ) ) ( not ( = ?auto_46065 ?auto_46064 ) ) ( not ( = ?auto_46060 ?auto_46065 ) ) ( not ( = ?auto_46061 ?auto_46065 ) ) ( not ( = ?auto_46066 ?auto_46065 ) ) ( not ( = ?auto_46063 ?auto_46065 ) ) ( ON ?auto_46065 ?auto_46062 ) ( not ( = ?auto_46060 ?auto_46062 ) ) ( not ( = ?auto_46061 ?auto_46062 ) ) ( not ( = ?auto_46066 ?auto_46062 ) ) ( not ( = ?auto_46063 ?auto_46062 ) ) ( not ( = ?auto_46064 ?auto_46062 ) ) ( not ( = ?auto_46065 ?auto_46062 ) ) ( ON ?auto_46064 ?auto_46065 ) ( ON-TABLE ?auto_46062 ) ( ON ?auto_46063 ?auto_46064 ) ( ON ?auto_46066 ?auto_46063 ) ( ON ?auto_46061 ?auto_46066 ) ( ON ?auto_46060 ?auto_46061 ) ( CLEAR ?auto_46060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46062 ?auto_46065 ?auto_46064 ?auto_46063 ?auto_46066 ?auto_46061 )
      ( MAKE-2PILE ?auto_46060 ?auto_46061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46071 - BLOCK
      ?auto_46072 - BLOCK
      ?auto_46073 - BLOCK
      ?auto_46074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46074 ) ( CLEAR ?auto_46073 ) ( ON-TABLE ?auto_46071 ) ( ON ?auto_46072 ?auto_46071 ) ( ON ?auto_46073 ?auto_46072 ) ( not ( = ?auto_46071 ?auto_46072 ) ) ( not ( = ?auto_46071 ?auto_46073 ) ) ( not ( = ?auto_46071 ?auto_46074 ) ) ( not ( = ?auto_46072 ?auto_46073 ) ) ( not ( = ?auto_46072 ?auto_46074 ) ) ( not ( = ?auto_46073 ?auto_46074 ) ) )
    :subtasks
    ( ( !STACK ?auto_46074 ?auto_46073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46075 - BLOCK
      ?auto_46076 - BLOCK
      ?auto_46077 - BLOCK
      ?auto_46078 - BLOCK
    )
    :vars
    (
      ?auto_46079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46077 ) ( ON-TABLE ?auto_46075 ) ( ON ?auto_46076 ?auto_46075 ) ( ON ?auto_46077 ?auto_46076 ) ( not ( = ?auto_46075 ?auto_46076 ) ) ( not ( = ?auto_46075 ?auto_46077 ) ) ( not ( = ?auto_46075 ?auto_46078 ) ) ( not ( = ?auto_46076 ?auto_46077 ) ) ( not ( = ?auto_46076 ?auto_46078 ) ) ( not ( = ?auto_46077 ?auto_46078 ) ) ( ON ?auto_46078 ?auto_46079 ) ( CLEAR ?auto_46078 ) ( HAND-EMPTY ) ( not ( = ?auto_46075 ?auto_46079 ) ) ( not ( = ?auto_46076 ?auto_46079 ) ) ( not ( = ?auto_46077 ?auto_46079 ) ) ( not ( = ?auto_46078 ?auto_46079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46078 ?auto_46079 )
      ( MAKE-4PILE ?auto_46075 ?auto_46076 ?auto_46077 ?auto_46078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46080 - BLOCK
      ?auto_46081 - BLOCK
      ?auto_46082 - BLOCK
      ?auto_46083 - BLOCK
    )
    :vars
    (
      ?auto_46084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46080 ) ( ON ?auto_46081 ?auto_46080 ) ( not ( = ?auto_46080 ?auto_46081 ) ) ( not ( = ?auto_46080 ?auto_46082 ) ) ( not ( = ?auto_46080 ?auto_46083 ) ) ( not ( = ?auto_46081 ?auto_46082 ) ) ( not ( = ?auto_46081 ?auto_46083 ) ) ( not ( = ?auto_46082 ?auto_46083 ) ) ( ON ?auto_46083 ?auto_46084 ) ( CLEAR ?auto_46083 ) ( not ( = ?auto_46080 ?auto_46084 ) ) ( not ( = ?auto_46081 ?auto_46084 ) ) ( not ( = ?auto_46082 ?auto_46084 ) ) ( not ( = ?auto_46083 ?auto_46084 ) ) ( HOLDING ?auto_46082 ) ( CLEAR ?auto_46081 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46080 ?auto_46081 ?auto_46082 )
      ( MAKE-4PILE ?auto_46080 ?auto_46081 ?auto_46082 ?auto_46083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46085 - BLOCK
      ?auto_46086 - BLOCK
      ?auto_46087 - BLOCK
      ?auto_46088 - BLOCK
    )
    :vars
    (
      ?auto_46089 - BLOCK
      ?auto_46090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46085 ) ( ON ?auto_46086 ?auto_46085 ) ( not ( = ?auto_46085 ?auto_46086 ) ) ( not ( = ?auto_46085 ?auto_46087 ) ) ( not ( = ?auto_46085 ?auto_46088 ) ) ( not ( = ?auto_46086 ?auto_46087 ) ) ( not ( = ?auto_46086 ?auto_46088 ) ) ( not ( = ?auto_46087 ?auto_46088 ) ) ( ON ?auto_46088 ?auto_46089 ) ( not ( = ?auto_46085 ?auto_46089 ) ) ( not ( = ?auto_46086 ?auto_46089 ) ) ( not ( = ?auto_46087 ?auto_46089 ) ) ( not ( = ?auto_46088 ?auto_46089 ) ) ( CLEAR ?auto_46086 ) ( ON ?auto_46087 ?auto_46088 ) ( CLEAR ?auto_46087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46090 ) ( ON ?auto_46089 ?auto_46090 ) ( not ( = ?auto_46090 ?auto_46089 ) ) ( not ( = ?auto_46090 ?auto_46088 ) ) ( not ( = ?auto_46090 ?auto_46087 ) ) ( not ( = ?auto_46085 ?auto_46090 ) ) ( not ( = ?auto_46086 ?auto_46090 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46090 ?auto_46089 ?auto_46088 )
      ( MAKE-4PILE ?auto_46085 ?auto_46086 ?auto_46087 ?auto_46088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46091 - BLOCK
      ?auto_46092 - BLOCK
      ?auto_46093 - BLOCK
      ?auto_46094 - BLOCK
    )
    :vars
    (
      ?auto_46096 - BLOCK
      ?auto_46095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46091 ) ( not ( = ?auto_46091 ?auto_46092 ) ) ( not ( = ?auto_46091 ?auto_46093 ) ) ( not ( = ?auto_46091 ?auto_46094 ) ) ( not ( = ?auto_46092 ?auto_46093 ) ) ( not ( = ?auto_46092 ?auto_46094 ) ) ( not ( = ?auto_46093 ?auto_46094 ) ) ( ON ?auto_46094 ?auto_46096 ) ( not ( = ?auto_46091 ?auto_46096 ) ) ( not ( = ?auto_46092 ?auto_46096 ) ) ( not ( = ?auto_46093 ?auto_46096 ) ) ( not ( = ?auto_46094 ?auto_46096 ) ) ( ON ?auto_46093 ?auto_46094 ) ( CLEAR ?auto_46093 ) ( ON-TABLE ?auto_46095 ) ( ON ?auto_46096 ?auto_46095 ) ( not ( = ?auto_46095 ?auto_46096 ) ) ( not ( = ?auto_46095 ?auto_46094 ) ) ( not ( = ?auto_46095 ?auto_46093 ) ) ( not ( = ?auto_46091 ?auto_46095 ) ) ( not ( = ?auto_46092 ?auto_46095 ) ) ( HOLDING ?auto_46092 ) ( CLEAR ?auto_46091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46091 ?auto_46092 )
      ( MAKE-4PILE ?auto_46091 ?auto_46092 ?auto_46093 ?auto_46094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46097 - BLOCK
      ?auto_46098 - BLOCK
      ?auto_46099 - BLOCK
      ?auto_46100 - BLOCK
    )
    :vars
    (
      ?auto_46102 - BLOCK
      ?auto_46101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46097 ) ( not ( = ?auto_46097 ?auto_46098 ) ) ( not ( = ?auto_46097 ?auto_46099 ) ) ( not ( = ?auto_46097 ?auto_46100 ) ) ( not ( = ?auto_46098 ?auto_46099 ) ) ( not ( = ?auto_46098 ?auto_46100 ) ) ( not ( = ?auto_46099 ?auto_46100 ) ) ( ON ?auto_46100 ?auto_46102 ) ( not ( = ?auto_46097 ?auto_46102 ) ) ( not ( = ?auto_46098 ?auto_46102 ) ) ( not ( = ?auto_46099 ?auto_46102 ) ) ( not ( = ?auto_46100 ?auto_46102 ) ) ( ON ?auto_46099 ?auto_46100 ) ( ON-TABLE ?auto_46101 ) ( ON ?auto_46102 ?auto_46101 ) ( not ( = ?auto_46101 ?auto_46102 ) ) ( not ( = ?auto_46101 ?auto_46100 ) ) ( not ( = ?auto_46101 ?auto_46099 ) ) ( not ( = ?auto_46097 ?auto_46101 ) ) ( not ( = ?auto_46098 ?auto_46101 ) ) ( CLEAR ?auto_46097 ) ( ON ?auto_46098 ?auto_46099 ) ( CLEAR ?auto_46098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46101 ?auto_46102 ?auto_46100 ?auto_46099 )
      ( MAKE-4PILE ?auto_46097 ?auto_46098 ?auto_46099 ?auto_46100 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46103 - BLOCK
      ?auto_46104 - BLOCK
      ?auto_46105 - BLOCK
      ?auto_46106 - BLOCK
    )
    :vars
    (
      ?auto_46108 - BLOCK
      ?auto_46107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46103 ?auto_46104 ) ) ( not ( = ?auto_46103 ?auto_46105 ) ) ( not ( = ?auto_46103 ?auto_46106 ) ) ( not ( = ?auto_46104 ?auto_46105 ) ) ( not ( = ?auto_46104 ?auto_46106 ) ) ( not ( = ?auto_46105 ?auto_46106 ) ) ( ON ?auto_46106 ?auto_46108 ) ( not ( = ?auto_46103 ?auto_46108 ) ) ( not ( = ?auto_46104 ?auto_46108 ) ) ( not ( = ?auto_46105 ?auto_46108 ) ) ( not ( = ?auto_46106 ?auto_46108 ) ) ( ON ?auto_46105 ?auto_46106 ) ( ON-TABLE ?auto_46107 ) ( ON ?auto_46108 ?auto_46107 ) ( not ( = ?auto_46107 ?auto_46108 ) ) ( not ( = ?auto_46107 ?auto_46106 ) ) ( not ( = ?auto_46107 ?auto_46105 ) ) ( not ( = ?auto_46103 ?auto_46107 ) ) ( not ( = ?auto_46104 ?auto_46107 ) ) ( ON ?auto_46104 ?auto_46105 ) ( CLEAR ?auto_46104 ) ( HOLDING ?auto_46103 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46103 )
      ( MAKE-4PILE ?auto_46103 ?auto_46104 ?auto_46105 ?auto_46106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46109 - BLOCK
      ?auto_46110 - BLOCK
      ?auto_46111 - BLOCK
      ?auto_46112 - BLOCK
    )
    :vars
    (
      ?auto_46114 - BLOCK
      ?auto_46113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46109 ?auto_46110 ) ) ( not ( = ?auto_46109 ?auto_46111 ) ) ( not ( = ?auto_46109 ?auto_46112 ) ) ( not ( = ?auto_46110 ?auto_46111 ) ) ( not ( = ?auto_46110 ?auto_46112 ) ) ( not ( = ?auto_46111 ?auto_46112 ) ) ( ON ?auto_46112 ?auto_46114 ) ( not ( = ?auto_46109 ?auto_46114 ) ) ( not ( = ?auto_46110 ?auto_46114 ) ) ( not ( = ?auto_46111 ?auto_46114 ) ) ( not ( = ?auto_46112 ?auto_46114 ) ) ( ON ?auto_46111 ?auto_46112 ) ( ON-TABLE ?auto_46113 ) ( ON ?auto_46114 ?auto_46113 ) ( not ( = ?auto_46113 ?auto_46114 ) ) ( not ( = ?auto_46113 ?auto_46112 ) ) ( not ( = ?auto_46113 ?auto_46111 ) ) ( not ( = ?auto_46109 ?auto_46113 ) ) ( not ( = ?auto_46110 ?auto_46113 ) ) ( ON ?auto_46110 ?auto_46111 ) ( ON ?auto_46109 ?auto_46110 ) ( CLEAR ?auto_46109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46113 ?auto_46114 ?auto_46112 ?auto_46111 ?auto_46110 )
      ( MAKE-4PILE ?auto_46109 ?auto_46110 ?auto_46111 ?auto_46112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46115 - BLOCK
      ?auto_46116 - BLOCK
      ?auto_46117 - BLOCK
      ?auto_46118 - BLOCK
    )
    :vars
    (
      ?auto_46119 - BLOCK
      ?auto_46120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46115 ?auto_46116 ) ) ( not ( = ?auto_46115 ?auto_46117 ) ) ( not ( = ?auto_46115 ?auto_46118 ) ) ( not ( = ?auto_46116 ?auto_46117 ) ) ( not ( = ?auto_46116 ?auto_46118 ) ) ( not ( = ?auto_46117 ?auto_46118 ) ) ( ON ?auto_46118 ?auto_46119 ) ( not ( = ?auto_46115 ?auto_46119 ) ) ( not ( = ?auto_46116 ?auto_46119 ) ) ( not ( = ?auto_46117 ?auto_46119 ) ) ( not ( = ?auto_46118 ?auto_46119 ) ) ( ON ?auto_46117 ?auto_46118 ) ( ON-TABLE ?auto_46120 ) ( ON ?auto_46119 ?auto_46120 ) ( not ( = ?auto_46120 ?auto_46119 ) ) ( not ( = ?auto_46120 ?auto_46118 ) ) ( not ( = ?auto_46120 ?auto_46117 ) ) ( not ( = ?auto_46115 ?auto_46120 ) ) ( not ( = ?auto_46116 ?auto_46120 ) ) ( ON ?auto_46116 ?auto_46117 ) ( HOLDING ?auto_46115 ) ( CLEAR ?auto_46116 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46120 ?auto_46119 ?auto_46118 ?auto_46117 ?auto_46116 ?auto_46115 )
      ( MAKE-4PILE ?auto_46115 ?auto_46116 ?auto_46117 ?auto_46118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46121 - BLOCK
      ?auto_46122 - BLOCK
      ?auto_46123 - BLOCK
      ?auto_46124 - BLOCK
    )
    :vars
    (
      ?auto_46125 - BLOCK
      ?auto_46126 - BLOCK
      ?auto_46127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46121 ?auto_46122 ) ) ( not ( = ?auto_46121 ?auto_46123 ) ) ( not ( = ?auto_46121 ?auto_46124 ) ) ( not ( = ?auto_46122 ?auto_46123 ) ) ( not ( = ?auto_46122 ?auto_46124 ) ) ( not ( = ?auto_46123 ?auto_46124 ) ) ( ON ?auto_46124 ?auto_46125 ) ( not ( = ?auto_46121 ?auto_46125 ) ) ( not ( = ?auto_46122 ?auto_46125 ) ) ( not ( = ?auto_46123 ?auto_46125 ) ) ( not ( = ?auto_46124 ?auto_46125 ) ) ( ON ?auto_46123 ?auto_46124 ) ( ON-TABLE ?auto_46126 ) ( ON ?auto_46125 ?auto_46126 ) ( not ( = ?auto_46126 ?auto_46125 ) ) ( not ( = ?auto_46126 ?auto_46124 ) ) ( not ( = ?auto_46126 ?auto_46123 ) ) ( not ( = ?auto_46121 ?auto_46126 ) ) ( not ( = ?auto_46122 ?auto_46126 ) ) ( ON ?auto_46122 ?auto_46123 ) ( CLEAR ?auto_46122 ) ( ON ?auto_46121 ?auto_46127 ) ( CLEAR ?auto_46121 ) ( HAND-EMPTY ) ( not ( = ?auto_46121 ?auto_46127 ) ) ( not ( = ?auto_46122 ?auto_46127 ) ) ( not ( = ?auto_46123 ?auto_46127 ) ) ( not ( = ?auto_46124 ?auto_46127 ) ) ( not ( = ?auto_46125 ?auto_46127 ) ) ( not ( = ?auto_46126 ?auto_46127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46121 ?auto_46127 )
      ( MAKE-4PILE ?auto_46121 ?auto_46122 ?auto_46123 ?auto_46124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46128 - BLOCK
      ?auto_46129 - BLOCK
      ?auto_46130 - BLOCK
      ?auto_46131 - BLOCK
    )
    :vars
    (
      ?auto_46134 - BLOCK
      ?auto_46133 - BLOCK
      ?auto_46132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46128 ?auto_46129 ) ) ( not ( = ?auto_46128 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46131 ) ) ( not ( = ?auto_46129 ?auto_46130 ) ) ( not ( = ?auto_46129 ?auto_46131 ) ) ( not ( = ?auto_46130 ?auto_46131 ) ) ( ON ?auto_46131 ?auto_46134 ) ( not ( = ?auto_46128 ?auto_46134 ) ) ( not ( = ?auto_46129 ?auto_46134 ) ) ( not ( = ?auto_46130 ?auto_46134 ) ) ( not ( = ?auto_46131 ?auto_46134 ) ) ( ON ?auto_46130 ?auto_46131 ) ( ON-TABLE ?auto_46133 ) ( ON ?auto_46134 ?auto_46133 ) ( not ( = ?auto_46133 ?auto_46134 ) ) ( not ( = ?auto_46133 ?auto_46131 ) ) ( not ( = ?auto_46133 ?auto_46130 ) ) ( not ( = ?auto_46128 ?auto_46133 ) ) ( not ( = ?auto_46129 ?auto_46133 ) ) ( ON ?auto_46128 ?auto_46132 ) ( CLEAR ?auto_46128 ) ( not ( = ?auto_46128 ?auto_46132 ) ) ( not ( = ?auto_46129 ?auto_46132 ) ) ( not ( = ?auto_46130 ?auto_46132 ) ) ( not ( = ?auto_46131 ?auto_46132 ) ) ( not ( = ?auto_46134 ?auto_46132 ) ) ( not ( = ?auto_46133 ?auto_46132 ) ) ( HOLDING ?auto_46129 ) ( CLEAR ?auto_46130 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46133 ?auto_46134 ?auto_46131 ?auto_46130 ?auto_46129 )
      ( MAKE-4PILE ?auto_46128 ?auto_46129 ?auto_46130 ?auto_46131 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46135 - BLOCK
      ?auto_46136 - BLOCK
      ?auto_46137 - BLOCK
      ?auto_46138 - BLOCK
    )
    :vars
    (
      ?auto_46141 - BLOCK
      ?auto_46139 - BLOCK
      ?auto_46140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46135 ?auto_46136 ) ) ( not ( = ?auto_46135 ?auto_46137 ) ) ( not ( = ?auto_46135 ?auto_46138 ) ) ( not ( = ?auto_46136 ?auto_46137 ) ) ( not ( = ?auto_46136 ?auto_46138 ) ) ( not ( = ?auto_46137 ?auto_46138 ) ) ( ON ?auto_46138 ?auto_46141 ) ( not ( = ?auto_46135 ?auto_46141 ) ) ( not ( = ?auto_46136 ?auto_46141 ) ) ( not ( = ?auto_46137 ?auto_46141 ) ) ( not ( = ?auto_46138 ?auto_46141 ) ) ( ON ?auto_46137 ?auto_46138 ) ( ON-TABLE ?auto_46139 ) ( ON ?auto_46141 ?auto_46139 ) ( not ( = ?auto_46139 ?auto_46141 ) ) ( not ( = ?auto_46139 ?auto_46138 ) ) ( not ( = ?auto_46139 ?auto_46137 ) ) ( not ( = ?auto_46135 ?auto_46139 ) ) ( not ( = ?auto_46136 ?auto_46139 ) ) ( ON ?auto_46135 ?auto_46140 ) ( not ( = ?auto_46135 ?auto_46140 ) ) ( not ( = ?auto_46136 ?auto_46140 ) ) ( not ( = ?auto_46137 ?auto_46140 ) ) ( not ( = ?auto_46138 ?auto_46140 ) ) ( not ( = ?auto_46141 ?auto_46140 ) ) ( not ( = ?auto_46139 ?auto_46140 ) ) ( CLEAR ?auto_46137 ) ( ON ?auto_46136 ?auto_46135 ) ( CLEAR ?auto_46136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46140 ?auto_46135 )
      ( MAKE-4PILE ?auto_46135 ?auto_46136 ?auto_46137 ?auto_46138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46142 - BLOCK
      ?auto_46143 - BLOCK
      ?auto_46144 - BLOCK
      ?auto_46145 - BLOCK
    )
    :vars
    (
      ?auto_46148 - BLOCK
      ?auto_46147 - BLOCK
      ?auto_46146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46142 ?auto_46143 ) ) ( not ( = ?auto_46142 ?auto_46144 ) ) ( not ( = ?auto_46142 ?auto_46145 ) ) ( not ( = ?auto_46143 ?auto_46144 ) ) ( not ( = ?auto_46143 ?auto_46145 ) ) ( not ( = ?auto_46144 ?auto_46145 ) ) ( ON ?auto_46145 ?auto_46148 ) ( not ( = ?auto_46142 ?auto_46148 ) ) ( not ( = ?auto_46143 ?auto_46148 ) ) ( not ( = ?auto_46144 ?auto_46148 ) ) ( not ( = ?auto_46145 ?auto_46148 ) ) ( ON-TABLE ?auto_46147 ) ( ON ?auto_46148 ?auto_46147 ) ( not ( = ?auto_46147 ?auto_46148 ) ) ( not ( = ?auto_46147 ?auto_46145 ) ) ( not ( = ?auto_46147 ?auto_46144 ) ) ( not ( = ?auto_46142 ?auto_46147 ) ) ( not ( = ?auto_46143 ?auto_46147 ) ) ( ON ?auto_46142 ?auto_46146 ) ( not ( = ?auto_46142 ?auto_46146 ) ) ( not ( = ?auto_46143 ?auto_46146 ) ) ( not ( = ?auto_46144 ?auto_46146 ) ) ( not ( = ?auto_46145 ?auto_46146 ) ) ( not ( = ?auto_46148 ?auto_46146 ) ) ( not ( = ?auto_46147 ?auto_46146 ) ) ( ON ?auto_46143 ?auto_46142 ) ( CLEAR ?auto_46143 ) ( ON-TABLE ?auto_46146 ) ( HOLDING ?auto_46144 ) ( CLEAR ?auto_46145 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46147 ?auto_46148 ?auto_46145 ?auto_46144 )
      ( MAKE-4PILE ?auto_46142 ?auto_46143 ?auto_46144 ?auto_46145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46149 - BLOCK
      ?auto_46150 - BLOCK
      ?auto_46151 - BLOCK
      ?auto_46152 - BLOCK
    )
    :vars
    (
      ?auto_46153 - BLOCK
      ?auto_46155 - BLOCK
      ?auto_46154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46149 ?auto_46150 ) ) ( not ( = ?auto_46149 ?auto_46151 ) ) ( not ( = ?auto_46149 ?auto_46152 ) ) ( not ( = ?auto_46150 ?auto_46151 ) ) ( not ( = ?auto_46150 ?auto_46152 ) ) ( not ( = ?auto_46151 ?auto_46152 ) ) ( ON ?auto_46152 ?auto_46153 ) ( not ( = ?auto_46149 ?auto_46153 ) ) ( not ( = ?auto_46150 ?auto_46153 ) ) ( not ( = ?auto_46151 ?auto_46153 ) ) ( not ( = ?auto_46152 ?auto_46153 ) ) ( ON-TABLE ?auto_46155 ) ( ON ?auto_46153 ?auto_46155 ) ( not ( = ?auto_46155 ?auto_46153 ) ) ( not ( = ?auto_46155 ?auto_46152 ) ) ( not ( = ?auto_46155 ?auto_46151 ) ) ( not ( = ?auto_46149 ?auto_46155 ) ) ( not ( = ?auto_46150 ?auto_46155 ) ) ( ON ?auto_46149 ?auto_46154 ) ( not ( = ?auto_46149 ?auto_46154 ) ) ( not ( = ?auto_46150 ?auto_46154 ) ) ( not ( = ?auto_46151 ?auto_46154 ) ) ( not ( = ?auto_46152 ?auto_46154 ) ) ( not ( = ?auto_46153 ?auto_46154 ) ) ( not ( = ?auto_46155 ?auto_46154 ) ) ( ON ?auto_46150 ?auto_46149 ) ( ON-TABLE ?auto_46154 ) ( CLEAR ?auto_46152 ) ( ON ?auto_46151 ?auto_46150 ) ( CLEAR ?auto_46151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46154 ?auto_46149 ?auto_46150 )
      ( MAKE-4PILE ?auto_46149 ?auto_46150 ?auto_46151 ?auto_46152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46156 - BLOCK
      ?auto_46157 - BLOCK
      ?auto_46158 - BLOCK
      ?auto_46159 - BLOCK
    )
    :vars
    (
      ?auto_46160 - BLOCK
      ?auto_46162 - BLOCK
      ?auto_46161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46156 ?auto_46157 ) ) ( not ( = ?auto_46156 ?auto_46158 ) ) ( not ( = ?auto_46156 ?auto_46159 ) ) ( not ( = ?auto_46157 ?auto_46158 ) ) ( not ( = ?auto_46157 ?auto_46159 ) ) ( not ( = ?auto_46158 ?auto_46159 ) ) ( not ( = ?auto_46156 ?auto_46160 ) ) ( not ( = ?auto_46157 ?auto_46160 ) ) ( not ( = ?auto_46158 ?auto_46160 ) ) ( not ( = ?auto_46159 ?auto_46160 ) ) ( ON-TABLE ?auto_46162 ) ( ON ?auto_46160 ?auto_46162 ) ( not ( = ?auto_46162 ?auto_46160 ) ) ( not ( = ?auto_46162 ?auto_46159 ) ) ( not ( = ?auto_46162 ?auto_46158 ) ) ( not ( = ?auto_46156 ?auto_46162 ) ) ( not ( = ?auto_46157 ?auto_46162 ) ) ( ON ?auto_46156 ?auto_46161 ) ( not ( = ?auto_46156 ?auto_46161 ) ) ( not ( = ?auto_46157 ?auto_46161 ) ) ( not ( = ?auto_46158 ?auto_46161 ) ) ( not ( = ?auto_46159 ?auto_46161 ) ) ( not ( = ?auto_46160 ?auto_46161 ) ) ( not ( = ?auto_46162 ?auto_46161 ) ) ( ON ?auto_46157 ?auto_46156 ) ( ON-TABLE ?auto_46161 ) ( ON ?auto_46158 ?auto_46157 ) ( CLEAR ?auto_46158 ) ( HOLDING ?auto_46159 ) ( CLEAR ?auto_46160 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46162 ?auto_46160 ?auto_46159 )
      ( MAKE-4PILE ?auto_46156 ?auto_46157 ?auto_46158 ?auto_46159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46163 - BLOCK
      ?auto_46164 - BLOCK
      ?auto_46165 - BLOCK
      ?auto_46166 - BLOCK
    )
    :vars
    (
      ?auto_46167 - BLOCK
      ?auto_46168 - BLOCK
      ?auto_46169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46163 ?auto_46164 ) ) ( not ( = ?auto_46163 ?auto_46165 ) ) ( not ( = ?auto_46163 ?auto_46166 ) ) ( not ( = ?auto_46164 ?auto_46165 ) ) ( not ( = ?auto_46164 ?auto_46166 ) ) ( not ( = ?auto_46165 ?auto_46166 ) ) ( not ( = ?auto_46163 ?auto_46167 ) ) ( not ( = ?auto_46164 ?auto_46167 ) ) ( not ( = ?auto_46165 ?auto_46167 ) ) ( not ( = ?auto_46166 ?auto_46167 ) ) ( ON-TABLE ?auto_46168 ) ( ON ?auto_46167 ?auto_46168 ) ( not ( = ?auto_46168 ?auto_46167 ) ) ( not ( = ?auto_46168 ?auto_46166 ) ) ( not ( = ?auto_46168 ?auto_46165 ) ) ( not ( = ?auto_46163 ?auto_46168 ) ) ( not ( = ?auto_46164 ?auto_46168 ) ) ( ON ?auto_46163 ?auto_46169 ) ( not ( = ?auto_46163 ?auto_46169 ) ) ( not ( = ?auto_46164 ?auto_46169 ) ) ( not ( = ?auto_46165 ?auto_46169 ) ) ( not ( = ?auto_46166 ?auto_46169 ) ) ( not ( = ?auto_46167 ?auto_46169 ) ) ( not ( = ?auto_46168 ?auto_46169 ) ) ( ON ?auto_46164 ?auto_46163 ) ( ON-TABLE ?auto_46169 ) ( ON ?auto_46165 ?auto_46164 ) ( CLEAR ?auto_46167 ) ( ON ?auto_46166 ?auto_46165 ) ( CLEAR ?auto_46166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46169 ?auto_46163 ?auto_46164 ?auto_46165 )
      ( MAKE-4PILE ?auto_46163 ?auto_46164 ?auto_46165 ?auto_46166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46170 - BLOCK
      ?auto_46171 - BLOCK
      ?auto_46172 - BLOCK
      ?auto_46173 - BLOCK
    )
    :vars
    (
      ?auto_46176 - BLOCK
      ?auto_46175 - BLOCK
      ?auto_46174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46170 ?auto_46171 ) ) ( not ( = ?auto_46170 ?auto_46172 ) ) ( not ( = ?auto_46170 ?auto_46173 ) ) ( not ( = ?auto_46171 ?auto_46172 ) ) ( not ( = ?auto_46171 ?auto_46173 ) ) ( not ( = ?auto_46172 ?auto_46173 ) ) ( not ( = ?auto_46170 ?auto_46176 ) ) ( not ( = ?auto_46171 ?auto_46176 ) ) ( not ( = ?auto_46172 ?auto_46176 ) ) ( not ( = ?auto_46173 ?auto_46176 ) ) ( ON-TABLE ?auto_46175 ) ( not ( = ?auto_46175 ?auto_46176 ) ) ( not ( = ?auto_46175 ?auto_46173 ) ) ( not ( = ?auto_46175 ?auto_46172 ) ) ( not ( = ?auto_46170 ?auto_46175 ) ) ( not ( = ?auto_46171 ?auto_46175 ) ) ( ON ?auto_46170 ?auto_46174 ) ( not ( = ?auto_46170 ?auto_46174 ) ) ( not ( = ?auto_46171 ?auto_46174 ) ) ( not ( = ?auto_46172 ?auto_46174 ) ) ( not ( = ?auto_46173 ?auto_46174 ) ) ( not ( = ?auto_46176 ?auto_46174 ) ) ( not ( = ?auto_46175 ?auto_46174 ) ) ( ON ?auto_46171 ?auto_46170 ) ( ON-TABLE ?auto_46174 ) ( ON ?auto_46172 ?auto_46171 ) ( ON ?auto_46173 ?auto_46172 ) ( CLEAR ?auto_46173 ) ( HOLDING ?auto_46176 ) ( CLEAR ?auto_46175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46175 ?auto_46176 )
      ( MAKE-4PILE ?auto_46170 ?auto_46171 ?auto_46172 ?auto_46173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46177 - BLOCK
      ?auto_46178 - BLOCK
      ?auto_46179 - BLOCK
      ?auto_46180 - BLOCK
    )
    :vars
    (
      ?auto_46183 - BLOCK
      ?auto_46181 - BLOCK
      ?auto_46182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46177 ?auto_46178 ) ) ( not ( = ?auto_46177 ?auto_46179 ) ) ( not ( = ?auto_46177 ?auto_46180 ) ) ( not ( = ?auto_46178 ?auto_46179 ) ) ( not ( = ?auto_46178 ?auto_46180 ) ) ( not ( = ?auto_46179 ?auto_46180 ) ) ( not ( = ?auto_46177 ?auto_46183 ) ) ( not ( = ?auto_46178 ?auto_46183 ) ) ( not ( = ?auto_46179 ?auto_46183 ) ) ( not ( = ?auto_46180 ?auto_46183 ) ) ( ON-TABLE ?auto_46181 ) ( not ( = ?auto_46181 ?auto_46183 ) ) ( not ( = ?auto_46181 ?auto_46180 ) ) ( not ( = ?auto_46181 ?auto_46179 ) ) ( not ( = ?auto_46177 ?auto_46181 ) ) ( not ( = ?auto_46178 ?auto_46181 ) ) ( ON ?auto_46177 ?auto_46182 ) ( not ( = ?auto_46177 ?auto_46182 ) ) ( not ( = ?auto_46178 ?auto_46182 ) ) ( not ( = ?auto_46179 ?auto_46182 ) ) ( not ( = ?auto_46180 ?auto_46182 ) ) ( not ( = ?auto_46183 ?auto_46182 ) ) ( not ( = ?auto_46181 ?auto_46182 ) ) ( ON ?auto_46178 ?auto_46177 ) ( ON-TABLE ?auto_46182 ) ( ON ?auto_46179 ?auto_46178 ) ( ON ?auto_46180 ?auto_46179 ) ( CLEAR ?auto_46181 ) ( ON ?auto_46183 ?auto_46180 ) ( CLEAR ?auto_46183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46182 ?auto_46177 ?auto_46178 ?auto_46179 ?auto_46180 )
      ( MAKE-4PILE ?auto_46177 ?auto_46178 ?auto_46179 ?auto_46180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46184 - BLOCK
      ?auto_46185 - BLOCK
      ?auto_46186 - BLOCK
      ?auto_46187 - BLOCK
    )
    :vars
    (
      ?auto_46189 - BLOCK
      ?auto_46188 - BLOCK
      ?auto_46190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46184 ?auto_46185 ) ) ( not ( = ?auto_46184 ?auto_46186 ) ) ( not ( = ?auto_46184 ?auto_46187 ) ) ( not ( = ?auto_46185 ?auto_46186 ) ) ( not ( = ?auto_46185 ?auto_46187 ) ) ( not ( = ?auto_46186 ?auto_46187 ) ) ( not ( = ?auto_46184 ?auto_46189 ) ) ( not ( = ?auto_46185 ?auto_46189 ) ) ( not ( = ?auto_46186 ?auto_46189 ) ) ( not ( = ?auto_46187 ?auto_46189 ) ) ( not ( = ?auto_46188 ?auto_46189 ) ) ( not ( = ?auto_46188 ?auto_46187 ) ) ( not ( = ?auto_46188 ?auto_46186 ) ) ( not ( = ?auto_46184 ?auto_46188 ) ) ( not ( = ?auto_46185 ?auto_46188 ) ) ( ON ?auto_46184 ?auto_46190 ) ( not ( = ?auto_46184 ?auto_46190 ) ) ( not ( = ?auto_46185 ?auto_46190 ) ) ( not ( = ?auto_46186 ?auto_46190 ) ) ( not ( = ?auto_46187 ?auto_46190 ) ) ( not ( = ?auto_46189 ?auto_46190 ) ) ( not ( = ?auto_46188 ?auto_46190 ) ) ( ON ?auto_46185 ?auto_46184 ) ( ON-TABLE ?auto_46190 ) ( ON ?auto_46186 ?auto_46185 ) ( ON ?auto_46187 ?auto_46186 ) ( ON ?auto_46189 ?auto_46187 ) ( CLEAR ?auto_46189 ) ( HOLDING ?auto_46188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46188 )
      ( MAKE-4PILE ?auto_46184 ?auto_46185 ?auto_46186 ?auto_46187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46191 - BLOCK
      ?auto_46192 - BLOCK
      ?auto_46193 - BLOCK
      ?auto_46194 - BLOCK
    )
    :vars
    (
      ?auto_46195 - BLOCK
      ?auto_46197 - BLOCK
      ?auto_46196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46191 ?auto_46192 ) ) ( not ( = ?auto_46191 ?auto_46193 ) ) ( not ( = ?auto_46191 ?auto_46194 ) ) ( not ( = ?auto_46192 ?auto_46193 ) ) ( not ( = ?auto_46192 ?auto_46194 ) ) ( not ( = ?auto_46193 ?auto_46194 ) ) ( not ( = ?auto_46191 ?auto_46195 ) ) ( not ( = ?auto_46192 ?auto_46195 ) ) ( not ( = ?auto_46193 ?auto_46195 ) ) ( not ( = ?auto_46194 ?auto_46195 ) ) ( not ( = ?auto_46197 ?auto_46195 ) ) ( not ( = ?auto_46197 ?auto_46194 ) ) ( not ( = ?auto_46197 ?auto_46193 ) ) ( not ( = ?auto_46191 ?auto_46197 ) ) ( not ( = ?auto_46192 ?auto_46197 ) ) ( ON ?auto_46191 ?auto_46196 ) ( not ( = ?auto_46191 ?auto_46196 ) ) ( not ( = ?auto_46192 ?auto_46196 ) ) ( not ( = ?auto_46193 ?auto_46196 ) ) ( not ( = ?auto_46194 ?auto_46196 ) ) ( not ( = ?auto_46195 ?auto_46196 ) ) ( not ( = ?auto_46197 ?auto_46196 ) ) ( ON ?auto_46192 ?auto_46191 ) ( ON-TABLE ?auto_46196 ) ( ON ?auto_46193 ?auto_46192 ) ( ON ?auto_46194 ?auto_46193 ) ( ON ?auto_46195 ?auto_46194 ) ( ON ?auto_46197 ?auto_46195 ) ( CLEAR ?auto_46197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46196 ?auto_46191 ?auto_46192 ?auto_46193 ?auto_46194 ?auto_46195 )
      ( MAKE-4PILE ?auto_46191 ?auto_46192 ?auto_46193 ?auto_46194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46199 - BLOCK
    )
    :vars
    (
      ?auto_46200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46200 ?auto_46199 ) ( CLEAR ?auto_46200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46199 ) ( not ( = ?auto_46199 ?auto_46200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46200 ?auto_46199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46201 - BLOCK
    )
    :vars
    (
      ?auto_46202 - BLOCK
      ?auto_46203 - BLOCK
      ?auto_46204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46202 ?auto_46201 ) ( CLEAR ?auto_46202 ) ( ON-TABLE ?auto_46201 ) ( not ( = ?auto_46201 ?auto_46202 ) ) ( HOLDING ?auto_46203 ) ( CLEAR ?auto_46204 ) ( not ( = ?auto_46201 ?auto_46203 ) ) ( not ( = ?auto_46201 ?auto_46204 ) ) ( not ( = ?auto_46202 ?auto_46203 ) ) ( not ( = ?auto_46202 ?auto_46204 ) ) ( not ( = ?auto_46203 ?auto_46204 ) ) )
    :subtasks
    ( ( !STACK ?auto_46203 ?auto_46204 )
      ( MAKE-1PILE ?auto_46201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46205 - BLOCK
    )
    :vars
    (
      ?auto_46207 - BLOCK
      ?auto_46208 - BLOCK
      ?auto_46206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46207 ?auto_46205 ) ( ON-TABLE ?auto_46205 ) ( not ( = ?auto_46205 ?auto_46207 ) ) ( CLEAR ?auto_46208 ) ( not ( = ?auto_46205 ?auto_46206 ) ) ( not ( = ?auto_46205 ?auto_46208 ) ) ( not ( = ?auto_46207 ?auto_46206 ) ) ( not ( = ?auto_46207 ?auto_46208 ) ) ( not ( = ?auto_46206 ?auto_46208 ) ) ( ON ?auto_46206 ?auto_46207 ) ( CLEAR ?auto_46206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46205 ?auto_46207 )
      ( MAKE-1PILE ?auto_46205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46209 - BLOCK
    )
    :vars
    (
      ?auto_46211 - BLOCK
      ?auto_46212 - BLOCK
      ?auto_46210 - BLOCK
      ?auto_46213 - BLOCK
      ?auto_46214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46211 ?auto_46209 ) ( ON-TABLE ?auto_46209 ) ( not ( = ?auto_46209 ?auto_46211 ) ) ( not ( = ?auto_46209 ?auto_46212 ) ) ( not ( = ?auto_46209 ?auto_46210 ) ) ( not ( = ?auto_46211 ?auto_46212 ) ) ( not ( = ?auto_46211 ?auto_46210 ) ) ( not ( = ?auto_46212 ?auto_46210 ) ) ( ON ?auto_46212 ?auto_46211 ) ( CLEAR ?auto_46212 ) ( HOLDING ?auto_46210 ) ( CLEAR ?auto_46213 ) ( ON-TABLE ?auto_46214 ) ( ON ?auto_46213 ?auto_46214 ) ( not ( = ?auto_46214 ?auto_46213 ) ) ( not ( = ?auto_46214 ?auto_46210 ) ) ( not ( = ?auto_46213 ?auto_46210 ) ) ( not ( = ?auto_46209 ?auto_46213 ) ) ( not ( = ?auto_46209 ?auto_46214 ) ) ( not ( = ?auto_46211 ?auto_46213 ) ) ( not ( = ?auto_46211 ?auto_46214 ) ) ( not ( = ?auto_46212 ?auto_46213 ) ) ( not ( = ?auto_46212 ?auto_46214 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46214 ?auto_46213 ?auto_46210 )
      ( MAKE-1PILE ?auto_46209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46215 - BLOCK
    )
    :vars
    (
      ?auto_46217 - BLOCK
      ?auto_46218 - BLOCK
      ?auto_46219 - BLOCK
      ?auto_46216 - BLOCK
      ?auto_46220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46217 ?auto_46215 ) ( ON-TABLE ?auto_46215 ) ( not ( = ?auto_46215 ?auto_46217 ) ) ( not ( = ?auto_46215 ?auto_46218 ) ) ( not ( = ?auto_46215 ?auto_46219 ) ) ( not ( = ?auto_46217 ?auto_46218 ) ) ( not ( = ?auto_46217 ?auto_46219 ) ) ( not ( = ?auto_46218 ?auto_46219 ) ) ( ON ?auto_46218 ?auto_46217 ) ( CLEAR ?auto_46216 ) ( ON-TABLE ?auto_46220 ) ( ON ?auto_46216 ?auto_46220 ) ( not ( = ?auto_46220 ?auto_46216 ) ) ( not ( = ?auto_46220 ?auto_46219 ) ) ( not ( = ?auto_46216 ?auto_46219 ) ) ( not ( = ?auto_46215 ?auto_46216 ) ) ( not ( = ?auto_46215 ?auto_46220 ) ) ( not ( = ?auto_46217 ?auto_46216 ) ) ( not ( = ?auto_46217 ?auto_46220 ) ) ( not ( = ?auto_46218 ?auto_46216 ) ) ( not ( = ?auto_46218 ?auto_46220 ) ) ( ON ?auto_46219 ?auto_46218 ) ( CLEAR ?auto_46219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46215 ?auto_46217 ?auto_46218 )
      ( MAKE-1PILE ?auto_46215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46221 - BLOCK
    )
    :vars
    (
      ?auto_46225 - BLOCK
      ?auto_46224 - BLOCK
      ?auto_46226 - BLOCK
      ?auto_46223 - BLOCK
      ?auto_46222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46225 ?auto_46221 ) ( ON-TABLE ?auto_46221 ) ( not ( = ?auto_46221 ?auto_46225 ) ) ( not ( = ?auto_46221 ?auto_46224 ) ) ( not ( = ?auto_46221 ?auto_46226 ) ) ( not ( = ?auto_46225 ?auto_46224 ) ) ( not ( = ?auto_46225 ?auto_46226 ) ) ( not ( = ?auto_46224 ?auto_46226 ) ) ( ON ?auto_46224 ?auto_46225 ) ( ON-TABLE ?auto_46223 ) ( not ( = ?auto_46223 ?auto_46222 ) ) ( not ( = ?auto_46223 ?auto_46226 ) ) ( not ( = ?auto_46222 ?auto_46226 ) ) ( not ( = ?auto_46221 ?auto_46222 ) ) ( not ( = ?auto_46221 ?auto_46223 ) ) ( not ( = ?auto_46225 ?auto_46222 ) ) ( not ( = ?auto_46225 ?auto_46223 ) ) ( not ( = ?auto_46224 ?auto_46222 ) ) ( not ( = ?auto_46224 ?auto_46223 ) ) ( ON ?auto_46226 ?auto_46224 ) ( CLEAR ?auto_46226 ) ( HOLDING ?auto_46222 ) ( CLEAR ?auto_46223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46223 ?auto_46222 )
      ( MAKE-1PILE ?auto_46221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46227 - BLOCK
    )
    :vars
    (
      ?auto_46231 - BLOCK
      ?auto_46229 - BLOCK
      ?auto_46230 - BLOCK
      ?auto_46228 - BLOCK
      ?auto_46232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46231 ?auto_46227 ) ( ON-TABLE ?auto_46227 ) ( not ( = ?auto_46227 ?auto_46231 ) ) ( not ( = ?auto_46227 ?auto_46229 ) ) ( not ( = ?auto_46227 ?auto_46230 ) ) ( not ( = ?auto_46231 ?auto_46229 ) ) ( not ( = ?auto_46231 ?auto_46230 ) ) ( not ( = ?auto_46229 ?auto_46230 ) ) ( ON ?auto_46229 ?auto_46231 ) ( ON-TABLE ?auto_46228 ) ( not ( = ?auto_46228 ?auto_46232 ) ) ( not ( = ?auto_46228 ?auto_46230 ) ) ( not ( = ?auto_46232 ?auto_46230 ) ) ( not ( = ?auto_46227 ?auto_46232 ) ) ( not ( = ?auto_46227 ?auto_46228 ) ) ( not ( = ?auto_46231 ?auto_46232 ) ) ( not ( = ?auto_46231 ?auto_46228 ) ) ( not ( = ?auto_46229 ?auto_46232 ) ) ( not ( = ?auto_46229 ?auto_46228 ) ) ( ON ?auto_46230 ?auto_46229 ) ( CLEAR ?auto_46228 ) ( ON ?auto_46232 ?auto_46230 ) ( CLEAR ?auto_46232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46227 ?auto_46231 ?auto_46229 ?auto_46230 )
      ( MAKE-1PILE ?auto_46227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46233 - BLOCK
    )
    :vars
    (
      ?auto_46238 - BLOCK
      ?auto_46235 - BLOCK
      ?auto_46237 - BLOCK
      ?auto_46236 - BLOCK
      ?auto_46234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46238 ?auto_46233 ) ( ON-TABLE ?auto_46233 ) ( not ( = ?auto_46233 ?auto_46238 ) ) ( not ( = ?auto_46233 ?auto_46235 ) ) ( not ( = ?auto_46233 ?auto_46237 ) ) ( not ( = ?auto_46238 ?auto_46235 ) ) ( not ( = ?auto_46238 ?auto_46237 ) ) ( not ( = ?auto_46235 ?auto_46237 ) ) ( ON ?auto_46235 ?auto_46238 ) ( not ( = ?auto_46236 ?auto_46234 ) ) ( not ( = ?auto_46236 ?auto_46237 ) ) ( not ( = ?auto_46234 ?auto_46237 ) ) ( not ( = ?auto_46233 ?auto_46234 ) ) ( not ( = ?auto_46233 ?auto_46236 ) ) ( not ( = ?auto_46238 ?auto_46234 ) ) ( not ( = ?auto_46238 ?auto_46236 ) ) ( not ( = ?auto_46235 ?auto_46234 ) ) ( not ( = ?auto_46235 ?auto_46236 ) ) ( ON ?auto_46237 ?auto_46235 ) ( ON ?auto_46234 ?auto_46237 ) ( CLEAR ?auto_46234 ) ( HOLDING ?auto_46236 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46236 )
      ( MAKE-1PILE ?auto_46233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46239 - BLOCK
    )
    :vars
    (
      ?auto_46243 - BLOCK
      ?auto_46241 - BLOCK
      ?auto_46242 - BLOCK
      ?auto_46240 - BLOCK
      ?auto_46244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46243 ?auto_46239 ) ( ON-TABLE ?auto_46239 ) ( not ( = ?auto_46239 ?auto_46243 ) ) ( not ( = ?auto_46239 ?auto_46241 ) ) ( not ( = ?auto_46239 ?auto_46242 ) ) ( not ( = ?auto_46243 ?auto_46241 ) ) ( not ( = ?auto_46243 ?auto_46242 ) ) ( not ( = ?auto_46241 ?auto_46242 ) ) ( ON ?auto_46241 ?auto_46243 ) ( not ( = ?auto_46240 ?auto_46244 ) ) ( not ( = ?auto_46240 ?auto_46242 ) ) ( not ( = ?auto_46244 ?auto_46242 ) ) ( not ( = ?auto_46239 ?auto_46244 ) ) ( not ( = ?auto_46239 ?auto_46240 ) ) ( not ( = ?auto_46243 ?auto_46244 ) ) ( not ( = ?auto_46243 ?auto_46240 ) ) ( not ( = ?auto_46241 ?auto_46244 ) ) ( not ( = ?auto_46241 ?auto_46240 ) ) ( ON ?auto_46242 ?auto_46241 ) ( ON ?auto_46244 ?auto_46242 ) ( ON ?auto_46240 ?auto_46244 ) ( CLEAR ?auto_46240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46239 ?auto_46243 ?auto_46241 ?auto_46242 ?auto_46244 )
      ( MAKE-1PILE ?auto_46239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46245 - BLOCK
    )
    :vars
    (
      ?auto_46249 - BLOCK
      ?auto_46248 - BLOCK
      ?auto_46247 - BLOCK
      ?auto_46250 - BLOCK
      ?auto_46246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46249 ?auto_46245 ) ( ON-TABLE ?auto_46245 ) ( not ( = ?auto_46245 ?auto_46249 ) ) ( not ( = ?auto_46245 ?auto_46248 ) ) ( not ( = ?auto_46245 ?auto_46247 ) ) ( not ( = ?auto_46249 ?auto_46248 ) ) ( not ( = ?auto_46249 ?auto_46247 ) ) ( not ( = ?auto_46248 ?auto_46247 ) ) ( ON ?auto_46248 ?auto_46249 ) ( not ( = ?auto_46250 ?auto_46246 ) ) ( not ( = ?auto_46250 ?auto_46247 ) ) ( not ( = ?auto_46246 ?auto_46247 ) ) ( not ( = ?auto_46245 ?auto_46246 ) ) ( not ( = ?auto_46245 ?auto_46250 ) ) ( not ( = ?auto_46249 ?auto_46246 ) ) ( not ( = ?auto_46249 ?auto_46250 ) ) ( not ( = ?auto_46248 ?auto_46246 ) ) ( not ( = ?auto_46248 ?auto_46250 ) ) ( ON ?auto_46247 ?auto_46248 ) ( ON ?auto_46246 ?auto_46247 ) ( HOLDING ?auto_46250 ) ( CLEAR ?auto_46246 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46245 ?auto_46249 ?auto_46248 ?auto_46247 ?auto_46246 ?auto_46250 )
      ( MAKE-1PILE ?auto_46245 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46251 - BLOCK
    )
    :vars
    (
      ?auto_46253 - BLOCK
      ?auto_46254 - BLOCK
      ?auto_46255 - BLOCK
      ?auto_46256 - BLOCK
      ?auto_46252 - BLOCK
      ?auto_46257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46253 ?auto_46251 ) ( ON-TABLE ?auto_46251 ) ( not ( = ?auto_46251 ?auto_46253 ) ) ( not ( = ?auto_46251 ?auto_46254 ) ) ( not ( = ?auto_46251 ?auto_46255 ) ) ( not ( = ?auto_46253 ?auto_46254 ) ) ( not ( = ?auto_46253 ?auto_46255 ) ) ( not ( = ?auto_46254 ?auto_46255 ) ) ( ON ?auto_46254 ?auto_46253 ) ( not ( = ?auto_46256 ?auto_46252 ) ) ( not ( = ?auto_46256 ?auto_46255 ) ) ( not ( = ?auto_46252 ?auto_46255 ) ) ( not ( = ?auto_46251 ?auto_46252 ) ) ( not ( = ?auto_46251 ?auto_46256 ) ) ( not ( = ?auto_46253 ?auto_46252 ) ) ( not ( = ?auto_46253 ?auto_46256 ) ) ( not ( = ?auto_46254 ?auto_46252 ) ) ( not ( = ?auto_46254 ?auto_46256 ) ) ( ON ?auto_46255 ?auto_46254 ) ( ON ?auto_46252 ?auto_46255 ) ( CLEAR ?auto_46252 ) ( ON ?auto_46256 ?auto_46257 ) ( CLEAR ?auto_46256 ) ( HAND-EMPTY ) ( not ( = ?auto_46251 ?auto_46257 ) ) ( not ( = ?auto_46253 ?auto_46257 ) ) ( not ( = ?auto_46254 ?auto_46257 ) ) ( not ( = ?auto_46255 ?auto_46257 ) ) ( not ( = ?auto_46256 ?auto_46257 ) ) ( not ( = ?auto_46252 ?auto_46257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46256 ?auto_46257 )
      ( MAKE-1PILE ?auto_46251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46258 - BLOCK
    )
    :vars
    (
      ?auto_46263 - BLOCK
      ?auto_46262 - BLOCK
      ?auto_46260 - BLOCK
      ?auto_46261 - BLOCK
      ?auto_46264 - BLOCK
      ?auto_46259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46263 ?auto_46258 ) ( ON-TABLE ?auto_46258 ) ( not ( = ?auto_46258 ?auto_46263 ) ) ( not ( = ?auto_46258 ?auto_46262 ) ) ( not ( = ?auto_46258 ?auto_46260 ) ) ( not ( = ?auto_46263 ?auto_46262 ) ) ( not ( = ?auto_46263 ?auto_46260 ) ) ( not ( = ?auto_46262 ?auto_46260 ) ) ( ON ?auto_46262 ?auto_46263 ) ( not ( = ?auto_46261 ?auto_46264 ) ) ( not ( = ?auto_46261 ?auto_46260 ) ) ( not ( = ?auto_46264 ?auto_46260 ) ) ( not ( = ?auto_46258 ?auto_46264 ) ) ( not ( = ?auto_46258 ?auto_46261 ) ) ( not ( = ?auto_46263 ?auto_46264 ) ) ( not ( = ?auto_46263 ?auto_46261 ) ) ( not ( = ?auto_46262 ?auto_46264 ) ) ( not ( = ?auto_46262 ?auto_46261 ) ) ( ON ?auto_46260 ?auto_46262 ) ( ON ?auto_46261 ?auto_46259 ) ( CLEAR ?auto_46261 ) ( not ( = ?auto_46258 ?auto_46259 ) ) ( not ( = ?auto_46263 ?auto_46259 ) ) ( not ( = ?auto_46262 ?auto_46259 ) ) ( not ( = ?auto_46260 ?auto_46259 ) ) ( not ( = ?auto_46261 ?auto_46259 ) ) ( not ( = ?auto_46264 ?auto_46259 ) ) ( HOLDING ?auto_46264 ) ( CLEAR ?auto_46260 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46258 ?auto_46263 ?auto_46262 ?auto_46260 ?auto_46264 )
      ( MAKE-1PILE ?auto_46258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46265 - BLOCK
    )
    :vars
    (
      ?auto_46269 - BLOCK
      ?auto_46268 - BLOCK
      ?auto_46266 - BLOCK
      ?auto_46267 - BLOCK
      ?auto_46270 - BLOCK
      ?auto_46271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46269 ?auto_46265 ) ( ON-TABLE ?auto_46265 ) ( not ( = ?auto_46265 ?auto_46269 ) ) ( not ( = ?auto_46265 ?auto_46268 ) ) ( not ( = ?auto_46265 ?auto_46266 ) ) ( not ( = ?auto_46269 ?auto_46268 ) ) ( not ( = ?auto_46269 ?auto_46266 ) ) ( not ( = ?auto_46268 ?auto_46266 ) ) ( ON ?auto_46268 ?auto_46269 ) ( not ( = ?auto_46267 ?auto_46270 ) ) ( not ( = ?auto_46267 ?auto_46266 ) ) ( not ( = ?auto_46270 ?auto_46266 ) ) ( not ( = ?auto_46265 ?auto_46270 ) ) ( not ( = ?auto_46265 ?auto_46267 ) ) ( not ( = ?auto_46269 ?auto_46270 ) ) ( not ( = ?auto_46269 ?auto_46267 ) ) ( not ( = ?auto_46268 ?auto_46270 ) ) ( not ( = ?auto_46268 ?auto_46267 ) ) ( ON ?auto_46266 ?auto_46268 ) ( ON ?auto_46267 ?auto_46271 ) ( not ( = ?auto_46265 ?auto_46271 ) ) ( not ( = ?auto_46269 ?auto_46271 ) ) ( not ( = ?auto_46268 ?auto_46271 ) ) ( not ( = ?auto_46266 ?auto_46271 ) ) ( not ( = ?auto_46267 ?auto_46271 ) ) ( not ( = ?auto_46270 ?auto_46271 ) ) ( CLEAR ?auto_46266 ) ( ON ?auto_46270 ?auto_46267 ) ( CLEAR ?auto_46270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46271 ?auto_46267 )
      ( MAKE-1PILE ?auto_46265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46272 - BLOCK
    )
    :vars
    (
      ?auto_46274 - BLOCK
      ?auto_46278 - BLOCK
      ?auto_46276 - BLOCK
      ?auto_46273 - BLOCK
      ?auto_46277 - BLOCK
      ?auto_46275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46274 ?auto_46272 ) ( ON-TABLE ?auto_46272 ) ( not ( = ?auto_46272 ?auto_46274 ) ) ( not ( = ?auto_46272 ?auto_46278 ) ) ( not ( = ?auto_46272 ?auto_46276 ) ) ( not ( = ?auto_46274 ?auto_46278 ) ) ( not ( = ?auto_46274 ?auto_46276 ) ) ( not ( = ?auto_46278 ?auto_46276 ) ) ( ON ?auto_46278 ?auto_46274 ) ( not ( = ?auto_46273 ?auto_46277 ) ) ( not ( = ?auto_46273 ?auto_46276 ) ) ( not ( = ?auto_46277 ?auto_46276 ) ) ( not ( = ?auto_46272 ?auto_46277 ) ) ( not ( = ?auto_46272 ?auto_46273 ) ) ( not ( = ?auto_46274 ?auto_46277 ) ) ( not ( = ?auto_46274 ?auto_46273 ) ) ( not ( = ?auto_46278 ?auto_46277 ) ) ( not ( = ?auto_46278 ?auto_46273 ) ) ( ON ?auto_46273 ?auto_46275 ) ( not ( = ?auto_46272 ?auto_46275 ) ) ( not ( = ?auto_46274 ?auto_46275 ) ) ( not ( = ?auto_46278 ?auto_46275 ) ) ( not ( = ?auto_46276 ?auto_46275 ) ) ( not ( = ?auto_46273 ?auto_46275 ) ) ( not ( = ?auto_46277 ?auto_46275 ) ) ( ON ?auto_46277 ?auto_46273 ) ( CLEAR ?auto_46277 ) ( ON-TABLE ?auto_46275 ) ( HOLDING ?auto_46276 ) ( CLEAR ?auto_46278 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46272 ?auto_46274 ?auto_46278 ?auto_46276 )
      ( MAKE-1PILE ?auto_46272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46279 - BLOCK
    )
    :vars
    (
      ?auto_46285 - BLOCK
      ?auto_46284 - BLOCK
      ?auto_46280 - BLOCK
      ?auto_46282 - BLOCK
      ?auto_46283 - BLOCK
      ?auto_46281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46285 ?auto_46279 ) ( ON-TABLE ?auto_46279 ) ( not ( = ?auto_46279 ?auto_46285 ) ) ( not ( = ?auto_46279 ?auto_46284 ) ) ( not ( = ?auto_46279 ?auto_46280 ) ) ( not ( = ?auto_46285 ?auto_46284 ) ) ( not ( = ?auto_46285 ?auto_46280 ) ) ( not ( = ?auto_46284 ?auto_46280 ) ) ( ON ?auto_46284 ?auto_46285 ) ( not ( = ?auto_46282 ?auto_46283 ) ) ( not ( = ?auto_46282 ?auto_46280 ) ) ( not ( = ?auto_46283 ?auto_46280 ) ) ( not ( = ?auto_46279 ?auto_46283 ) ) ( not ( = ?auto_46279 ?auto_46282 ) ) ( not ( = ?auto_46285 ?auto_46283 ) ) ( not ( = ?auto_46285 ?auto_46282 ) ) ( not ( = ?auto_46284 ?auto_46283 ) ) ( not ( = ?auto_46284 ?auto_46282 ) ) ( ON ?auto_46282 ?auto_46281 ) ( not ( = ?auto_46279 ?auto_46281 ) ) ( not ( = ?auto_46285 ?auto_46281 ) ) ( not ( = ?auto_46284 ?auto_46281 ) ) ( not ( = ?auto_46280 ?auto_46281 ) ) ( not ( = ?auto_46282 ?auto_46281 ) ) ( not ( = ?auto_46283 ?auto_46281 ) ) ( ON ?auto_46283 ?auto_46282 ) ( ON-TABLE ?auto_46281 ) ( CLEAR ?auto_46284 ) ( ON ?auto_46280 ?auto_46283 ) ( CLEAR ?auto_46280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46281 ?auto_46282 ?auto_46283 )
      ( MAKE-1PILE ?auto_46279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46286 - BLOCK
    )
    :vars
    (
      ?auto_46292 - BLOCK
      ?auto_46287 - BLOCK
      ?auto_46291 - BLOCK
      ?auto_46290 - BLOCK
      ?auto_46289 - BLOCK
      ?auto_46288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46292 ?auto_46286 ) ( ON-TABLE ?auto_46286 ) ( not ( = ?auto_46286 ?auto_46292 ) ) ( not ( = ?auto_46286 ?auto_46287 ) ) ( not ( = ?auto_46286 ?auto_46291 ) ) ( not ( = ?auto_46292 ?auto_46287 ) ) ( not ( = ?auto_46292 ?auto_46291 ) ) ( not ( = ?auto_46287 ?auto_46291 ) ) ( not ( = ?auto_46290 ?auto_46289 ) ) ( not ( = ?auto_46290 ?auto_46291 ) ) ( not ( = ?auto_46289 ?auto_46291 ) ) ( not ( = ?auto_46286 ?auto_46289 ) ) ( not ( = ?auto_46286 ?auto_46290 ) ) ( not ( = ?auto_46292 ?auto_46289 ) ) ( not ( = ?auto_46292 ?auto_46290 ) ) ( not ( = ?auto_46287 ?auto_46289 ) ) ( not ( = ?auto_46287 ?auto_46290 ) ) ( ON ?auto_46290 ?auto_46288 ) ( not ( = ?auto_46286 ?auto_46288 ) ) ( not ( = ?auto_46292 ?auto_46288 ) ) ( not ( = ?auto_46287 ?auto_46288 ) ) ( not ( = ?auto_46291 ?auto_46288 ) ) ( not ( = ?auto_46290 ?auto_46288 ) ) ( not ( = ?auto_46289 ?auto_46288 ) ) ( ON ?auto_46289 ?auto_46290 ) ( ON-TABLE ?auto_46288 ) ( ON ?auto_46291 ?auto_46289 ) ( CLEAR ?auto_46291 ) ( HOLDING ?auto_46287 ) ( CLEAR ?auto_46292 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46286 ?auto_46292 ?auto_46287 )
      ( MAKE-1PILE ?auto_46286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46293 - BLOCK
    )
    :vars
    (
      ?auto_46295 - BLOCK
      ?auto_46294 - BLOCK
      ?auto_46299 - BLOCK
      ?auto_46298 - BLOCK
      ?auto_46296 - BLOCK
      ?auto_46297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46295 ?auto_46293 ) ( ON-TABLE ?auto_46293 ) ( not ( = ?auto_46293 ?auto_46295 ) ) ( not ( = ?auto_46293 ?auto_46294 ) ) ( not ( = ?auto_46293 ?auto_46299 ) ) ( not ( = ?auto_46295 ?auto_46294 ) ) ( not ( = ?auto_46295 ?auto_46299 ) ) ( not ( = ?auto_46294 ?auto_46299 ) ) ( not ( = ?auto_46298 ?auto_46296 ) ) ( not ( = ?auto_46298 ?auto_46299 ) ) ( not ( = ?auto_46296 ?auto_46299 ) ) ( not ( = ?auto_46293 ?auto_46296 ) ) ( not ( = ?auto_46293 ?auto_46298 ) ) ( not ( = ?auto_46295 ?auto_46296 ) ) ( not ( = ?auto_46295 ?auto_46298 ) ) ( not ( = ?auto_46294 ?auto_46296 ) ) ( not ( = ?auto_46294 ?auto_46298 ) ) ( ON ?auto_46298 ?auto_46297 ) ( not ( = ?auto_46293 ?auto_46297 ) ) ( not ( = ?auto_46295 ?auto_46297 ) ) ( not ( = ?auto_46294 ?auto_46297 ) ) ( not ( = ?auto_46299 ?auto_46297 ) ) ( not ( = ?auto_46298 ?auto_46297 ) ) ( not ( = ?auto_46296 ?auto_46297 ) ) ( ON ?auto_46296 ?auto_46298 ) ( ON-TABLE ?auto_46297 ) ( ON ?auto_46299 ?auto_46296 ) ( CLEAR ?auto_46295 ) ( ON ?auto_46294 ?auto_46299 ) ( CLEAR ?auto_46294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46297 ?auto_46298 ?auto_46296 ?auto_46299 )
      ( MAKE-1PILE ?auto_46293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46314 - BLOCK
    )
    :vars
    (
      ?auto_46317 - BLOCK
      ?auto_46320 - BLOCK
      ?auto_46318 - BLOCK
      ?auto_46319 - BLOCK
      ?auto_46315 - BLOCK
      ?auto_46316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46314 ?auto_46317 ) ) ( not ( = ?auto_46314 ?auto_46320 ) ) ( not ( = ?auto_46314 ?auto_46318 ) ) ( not ( = ?auto_46317 ?auto_46320 ) ) ( not ( = ?auto_46317 ?auto_46318 ) ) ( not ( = ?auto_46320 ?auto_46318 ) ) ( not ( = ?auto_46319 ?auto_46315 ) ) ( not ( = ?auto_46319 ?auto_46318 ) ) ( not ( = ?auto_46315 ?auto_46318 ) ) ( not ( = ?auto_46314 ?auto_46315 ) ) ( not ( = ?auto_46314 ?auto_46319 ) ) ( not ( = ?auto_46317 ?auto_46315 ) ) ( not ( = ?auto_46317 ?auto_46319 ) ) ( not ( = ?auto_46320 ?auto_46315 ) ) ( not ( = ?auto_46320 ?auto_46319 ) ) ( ON ?auto_46319 ?auto_46316 ) ( not ( = ?auto_46314 ?auto_46316 ) ) ( not ( = ?auto_46317 ?auto_46316 ) ) ( not ( = ?auto_46320 ?auto_46316 ) ) ( not ( = ?auto_46318 ?auto_46316 ) ) ( not ( = ?auto_46319 ?auto_46316 ) ) ( not ( = ?auto_46315 ?auto_46316 ) ) ( ON ?auto_46315 ?auto_46319 ) ( ON-TABLE ?auto_46316 ) ( ON ?auto_46318 ?auto_46315 ) ( ON ?auto_46320 ?auto_46318 ) ( ON ?auto_46317 ?auto_46320 ) ( CLEAR ?auto_46317 ) ( HOLDING ?auto_46314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46314 ?auto_46317 )
      ( MAKE-1PILE ?auto_46314 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46321 - BLOCK
    )
    :vars
    (
      ?auto_46323 - BLOCK
      ?auto_46322 - BLOCK
      ?auto_46327 - BLOCK
      ?auto_46325 - BLOCK
      ?auto_46326 - BLOCK
      ?auto_46324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46321 ?auto_46323 ) ) ( not ( = ?auto_46321 ?auto_46322 ) ) ( not ( = ?auto_46321 ?auto_46327 ) ) ( not ( = ?auto_46323 ?auto_46322 ) ) ( not ( = ?auto_46323 ?auto_46327 ) ) ( not ( = ?auto_46322 ?auto_46327 ) ) ( not ( = ?auto_46325 ?auto_46326 ) ) ( not ( = ?auto_46325 ?auto_46327 ) ) ( not ( = ?auto_46326 ?auto_46327 ) ) ( not ( = ?auto_46321 ?auto_46326 ) ) ( not ( = ?auto_46321 ?auto_46325 ) ) ( not ( = ?auto_46323 ?auto_46326 ) ) ( not ( = ?auto_46323 ?auto_46325 ) ) ( not ( = ?auto_46322 ?auto_46326 ) ) ( not ( = ?auto_46322 ?auto_46325 ) ) ( ON ?auto_46325 ?auto_46324 ) ( not ( = ?auto_46321 ?auto_46324 ) ) ( not ( = ?auto_46323 ?auto_46324 ) ) ( not ( = ?auto_46322 ?auto_46324 ) ) ( not ( = ?auto_46327 ?auto_46324 ) ) ( not ( = ?auto_46325 ?auto_46324 ) ) ( not ( = ?auto_46326 ?auto_46324 ) ) ( ON ?auto_46326 ?auto_46325 ) ( ON-TABLE ?auto_46324 ) ( ON ?auto_46327 ?auto_46326 ) ( ON ?auto_46322 ?auto_46327 ) ( ON ?auto_46323 ?auto_46322 ) ( ON ?auto_46321 ?auto_46323 ) ( CLEAR ?auto_46321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46324 ?auto_46325 ?auto_46326 ?auto_46327 ?auto_46322 ?auto_46323 )
      ( MAKE-1PILE ?auto_46321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46333 - BLOCK
      ?auto_46334 - BLOCK
      ?auto_46335 - BLOCK
      ?auto_46336 - BLOCK
      ?auto_46337 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46337 ) ( CLEAR ?auto_46336 ) ( ON-TABLE ?auto_46333 ) ( ON ?auto_46334 ?auto_46333 ) ( ON ?auto_46335 ?auto_46334 ) ( ON ?auto_46336 ?auto_46335 ) ( not ( = ?auto_46333 ?auto_46334 ) ) ( not ( = ?auto_46333 ?auto_46335 ) ) ( not ( = ?auto_46333 ?auto_46336 ) ) ( not ( = ?auto_46333 ?auto_46337 ) ) ( not ( = ?auto_46334 ?auto_46335 ) ) ( not ( = ?auto_46334 ?auto_46336 ) ) ( not ( = ?auto_46334 ?auto_46337 ) ) ( not ( = ?auto_46335 ?auto_46336 ) ) ( not ( = ?auto_46335 ?auto_46337 ) ) ( not ( = ?auto_46336 ?auto_46337 ) ) )
    :subtasks
    ( ( !STACK ?auto_46337 ?auto_46336 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46338 - BLOCK
      ?auto_46339 - BLOCK
      ?auto_46340 - BLOCK
      ?auto_46341 - BLOCK
      ?auto_46342 - BLOCK
    )
    :vars
    (
      ?auto_46343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46341 ) ( ON-TABLE ?auto_46338 ) ( ON ?auto_46339 ?auto_46338 ) ( ON ?auto_46340 ?auto_46339 ) ( ON ?auto_46341 ?auto_46340 ) ( not ( = ?auto_46338 ?auto_46339 ) ) ( not ( = ?auto_46338 ?auto_46340 ) ) ( not ( = ?auto_46338 ?auto_46341 ) ) ( not ( = ?auto_46338 ?auto_46342 ) ) ( not ( = ?auto_46339 ?auto_46340 ) ) ( not ( = ?auto_46339 ?auto_46341 ) ) ( not ( = ?auto_46339 ?auto_46342 ) ) ( not ( = ?auto_46340 ?auto_46341 ) ) ( not ( = ?auto_46340 ?auto_46342 ) ) ( not ( = ?auto_46341 ?auto_46342 ) ) ( ON ?auto_46342 ?auto_46343 ) ( CLEAR ?auto_46342 ) ( HAND-EMPTY ) ( not ( = ?auto_46338 ?auto_46343 ) ) ( not ( = ?auto_46339 ?auto_46343 ) ) ( not ( = ?auto_46340 ?auto_46343 ) ) ( not ( = ?auto_46341 ?auto_46343 ) ) ( not ( = ?auto_46342 ?auto_46343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46342 ?auto_46343 )
      ( MAKE-5PILE ?auto_46338 ?auto_46339 ?auto_46340 ?auto_46341 ?auto_46342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46344 - BLOCK
      ?auto_46345 - BLOCK
      ?auto_46346 - BLOCK
      ?auto_46347 - BLOCK
      ?auto_46348 - BLOCK
    )
    :vars
    (
      ?auto_46349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46344 ) ( ON ?auto_46345 ?auto_46344 ) ( ON ?auto_46346 ?auto_46345 ) ( not ( = ?auto_46344 ?auto_46345 ) ) ( not ( = ?auto_46344 ?auto_46346 ) ) ( not ( = ?auto_46344 ?auto_46347 ) ) ( not ( = ?auto_46344 ?auto_46348 ) ) ( not ( = ?auto_46345 ?auto_46346 ) ) ( not ( = ?auto_46345 ?auto_46347 ) ) ( not ( = ?auto_46345 ?auto_46348 ) ) ( not ( = ?auto_46346 ?auto_46347 ) ) ( not ( = ?auto_46346 ?auto_46348 ) ) ( not ( = ?auto_46347 ?auto_46348 ) ) ( ON ?auto_46348 ?auto_46349 ) ( CLEAR ?auto_46348 ) ( not ( = ?auto_46344 ?auto_46349 ) ) ( not ( = ?auto_46345 ?auto_46349 ) ) ( not ( = ?auto_46346 ?auto_46349 ) ) ( not ( = ?auto_46347 ?auto_46349 ) ) ( not ( = ?auto_46348 ?auto_46349 ) ) ( HOLDING ?auto_46347 ) ( CLEAR ?auto_46346 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46344 ?auto_46345 ?auto_46346 ?auto_46347 )
      ( MAKE-5PILE ?auto_46344 ?auto_46345 ?auto_46346 ?auto_46347 ?auto_46348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46350 - BLOCK
      ?auto_46351 - BLOCK
      ?auto_46352 - BLOCK
      ?auto_46353 - BLOCK
      ?auto_46354 - BLOCK
    )
    :vars
    (
      ?auto_46355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46350 ) ( ON ?auto_46351 ?auto_46350 ) ( ON ?auto_46352 ?auto_46351 ) ( not ( = ?auto_46350 ?auto_46351 ) ) ( not ( = ?auto_46350 ?auto_46352 ) ) ( not ( = ?auto_46350 ?auto_46353 ) ) ( not ( = ?auto_46350 ?auto_46354 ) ) ( not ( = ?auto_46351 ?auto_46352 ) ) ( not ( = ?auto_46351 ?auto_46353 ) ) ( not ( = ?auto_46351 ?auto_46354 ) ) ( not ( = ?auto_46352 ?auto_46353 ) ) ( not ( = ?auto_46352 ?auto_46354 ) ) ( not ( = ?auto_46353 ?auto_46354 ) ) ( ON ?auto_46354 ?auto_46355 ) ( not ( = ?auto_46350 ?auto_46355 ) ) ( not ( = ?auto_46351 ?auto_46355 ) ) ( not ( = ?auto_46352 ?auto_46355 ) ) ( not ( = ?auto_46353 ?auto_46355 ) ) ( not ( = ?auto_46354 ?auto_46355 ) ) ( CLEAR ?auto_46352 ) ( ON ?auto_46353 ?auto_46354 ) ( CLEAR ?auto_46353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46355 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46355 ?auto_46354 )
      ( MAKE-5PILE ?auto_46350 ?auto_46351 ?auto_46352 ?auto_46353 ?auto_46354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46356 - BLOCK
      ?auto_46357 - BLOCK
      ?auto_46358 - BLOCK
      ?auto_46359 - BLOCK
      ?auto_46360 - BLOCK
    )
    :vars
    (
      ?auto_46361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46356 ) ( ON ?auto_46357 ?auto_46356 ) ( not ( = ?auto_46356 ?auto_46357 ) ) ( not ( = ?auto_46356 ?auto_46358 ) ) ( not ( = ?auto_46356 ?auto_46359 ) ) ( not ( = ?auto_46356 ?auto_46360 ) ) ( not ( = ?auto_46357 ?auto_46358 ) ) ( not ( = ?auto_46357 ?auto_46359 ) ) ( not ( = ?auto_46357 ?auto_46360 ) ) ( not ( = ?auto_46358 ?auto_46359 ) ) ( not ( = ?auto_46358 ?auto_46360 ) ) ( not ( = ?auto_46359 ?auto_46360 ) ) ( ON ?auto_46360 ?auto_46361 ) ( not ( = ?auto_46356 ?auto_46361 ) ) ( not ( = ?auto_46357 ?auto_46361 ) ) ( not ( = ?auto_46358 ?auto_46361 ) ) ( not ( = ?auto_46359 ?auto_46361 ) ) ( not ( = ?auto_46360 ?auto_46361 ) ) ( ON ?auto_46359 ?auto_46360 ) ( CLEAR ?auto_46359 ) ( ON-TABLE ?auto_46361 ) ( HOLDING ?auto_46358 ) ( CLEAR ?auto_46357 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46356 ?auto_46357 ?auto_46358 )
      ( MAKE-5PILE ?auto_46356 ?auto_46357 ?auto_46358 ?auto_46359 ?auto_46360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46362 - BLOCK
      ?auto_46363 - BLOCK
      ?auto_46364 - BLOCK
      ?auto_46365 - BLOCK
      ?auto_46366 - BLOCK
    )
    :vars
    (
      ?auto_46367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46362 ) ( ON ?auto_46363 ?auto_46362 ) ( not ( = ?auto_46362 ?auto_46363 ) ) ( not ( = ?auto_46362 ?auto_46364 ) ) ( not ( = ?auto_46362 ?auto_46365 ) ) ( not ( = ?auto_46362 ?auto_46366 ) ) ( not ( = ?auto_46363 ?auto_46364 ) ) ( not ( = ?auto_46363 ?auto_46365 ) ) ( not ( = ?auto_46363 ?auto_46366 ) ) ( not ( = ?auto_46364 ?auto_46365 ) ) ( not ( = ?auto_46364 ?auto_46366 ) ) ( not ( = ?auto_46365 ?auto_46366 ) ) ( ON ?auto_46366 ?auto_46367 ) ( not ( = ?auto_46362 ?auto_46367 ) ) ( not ( = ?auto_46363 ?auto_46367 ) ) ( not ( = ?auto_46364 ?auto_46367 ) ) ( not ( = ?auto_46365 ?auto_46367 ) ) ( not ( = ?auto_46366 ?auto_46367 ) ) ( ON ?auto_46365 ?auto_46366 ) ( ON-TABLE ?auto_46367 ) ( CLEAR ?auto_46363 ) ( ON ?auto_46364 ?auto_46365 ) ( CLEAR ?auto_46364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46367 ?auto_46366 ?auto_46365 )
      ( MAKE-5PILE ?auto_46362 ?auto_46363 ?auto_46364 ?auto_46365 ?auto_46366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46368 - BLOCK
      ?auto_46369 - BLOCK
      ?auto_46370 - BLOCK
      ?auto_46371 - BLOCK
      ?auto_46372 - BLOCK
    )
    :vars
    (
      ?auto_46373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46368 ) ( not ( = ?auto_46368 ?auto_46369 ) ) ( not ( = ?auto_46368 ?auto_46370 ) ) ( not ( = ?auto_46368 ?auto_46371 ) ) ( not ( = ?auto_46368 ?auto_46372 ) ) ( not ( = ?auto_46369 ?auto_46370 ) ) ( not ( = ?auto_46369 ?auto_46371 ) ) ( not ( = ?auto_46369 ?auto_46372 ) ) ( not ( = ?auto_46370 ?auto_46371 ) ) ( not ( = ?auto_46370 ?auto_46372 ) ) ( not ( = ?auto_46371 ?auto_46372 ) ) ( ON ?auto_46372 ?auto_46373 ) ( not ( = ?auto_46368 ?auto_46373 ) ) ( not ( = ?auto_46369 ?auto_46373 ) ) ( not ( = ?auto_46370 ?auto_46373 ) ) ( not ( = ?auto_46371 ?auto_46373 ) ) ( not ( = ?auto_46372 ?auto_46373 ) ) ( ON ?auto_46371 ?auto_46372 ) ( ON-TABLE ?auto_46373 ) ( ON ?auto_46370 ?auto_46371 ) ( CLEAR ?auto_46370 ) ( HOLDING ?auto_46369 ) ( CLEAR ?auto_46368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46368 ?auto_46369 )
      ( MAKE-5PILE ?auto_46368 ?auto_46369 ?auto_46370 ?auto_46371 ?auto_46372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46374 - BLOCK
      ?auto_46375 - BLOCK
      ?auto_46376 - BLOCK
      ?auto_46377 - BLOCK
      ?auto_46378 - BLOCK
    )
    :vars
    (
      ?auto_46379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46374 ) ( not ( = ?auto_46374 ?auto_46375 ) ) ( not ( = ?auto_46374 ?auto_46376 ) ) ( not ( = ?auto_46374 ?auto_46377 ) ) ( not ( = ?auto_46374 ?auto_46378 ) ) ( not ( = ?auto_46375 ?auto_46376 ) ) ( not ( = ?auto_46375 ?auto_46377 ) ) ( not ( = ?auto_46375 ?auto_46378 ) ) ( not ( = ?auto_46376 ?auto_46377 ) ) ( not ( = ?auto_46376 ?auto_46378 ) ) ( not ( = ?auto_46377 ?auto_46378 ) ) ( ON ?auto_46378 ?auto_46379 ) ( not ( = ?auto_46374 ?auto_46379 ) ) ( not ( = ?auto_46375 ?auto_46379 ) ) ( not ( = ?auto_46376 ?auto_46379 ) ) ( not ( = ?auto_46377 ?auto_46379 ) ) ( not ( = ?auto_46378 ?auto_46379 ) ) ( ON ?auto_46377 ?auto_46378 ) ( ON-TABLE ?auto_46379 ) ( ON ?auto_46376 ?auto_46377 ) ( CLEAR ?auto_46374 ) ( ON ?auto_46375 ?auto_46376 ) ( CLEAR ?auto_46375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46379 ?auto_46378 ?auto_46377 ?auto_46376 )
      ( MAKE-5PILE ?auto_46374 ?auto_46375 ?auto_46376 ?auto_46377 ?auto_46378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46380 - BLOCK
      ?auto_46381 - BLOCK
      ?auto_46382 - BLOCK
      ?auto_46383 - BLOCK
      ?auto_46384 - BLOCK
    )
    :vars
    (
      ?auto_46385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46380 ?auto_46381 ) ) ( not ( = ?auto_46380 ?auto_46382 ) ) ( not ( = ?auto_46380 ?auto_46383 ) ) ( not ( = ?auto_46380 ?auto_46384 ) ) ( not ( = ?auto_46381 ?auto_46382 ) ) ( not ( = ?auto_46381 ?auto_46383 ) ) ( not ( = ?auto_46381 ?auto_46384 ) ) ( not ( = ?auto_46382 ?auto_46383 ) ) ( not ( = ?auto_46382 ?auto_46384 ) ) ( not ( = ?auto_46383 ?auto_46384 ) ) ( ON ?auto_46384 ?auto_46385 ) ( not ( = ?auto_46380 ?auto_46385 ) ) ( not ( = ?auto_46381 ?auto_46385 ) ) ( not ( = ?auto_46382 ?auto_46385 ) ) ( not ( = ?auto_46383 ?auto_46385 ) ) ( not ( = ?auto_46384 ?auto_46385 ) ) ( ON ?auto_46383 ?auto_46384 ) ( ON-TABLE ?auto_46385 ) ( ON ?auto_46382 ?auto_46383 ) ( ON ?auto_46381 ?auto_46382 ) ( CLEAR ?auto_46381 ) ( HOLDING ?auto_46380 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46380 )
      ( MAKE-5PILE ?auto_46380 ?auto_46381 ?auto_46382 ?auto_46383 ?auto_46384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46386 - BLOCK
      ?auto_46387 - BLOCK
      ?auto_46388 - BLOCK
      ?auto_46389 - BLOCK
      ?auto_46390 - BLOCK
    )
    :vars
    (
      ?auto_46391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46386 ?auto_46387 ) ) ( not ( = ?auto_46386 ?auto_46388 ) ) ( not ( = ?auto_46386 ?auto_46389 ) ) ( not ( = ?auto_46386 ?auto_46390 ) ) ( not ( = ?auto_46387 ?auto_46388 ) ) ( not ( = ?auto_46387 ?auto_46389 ) ) ( not ( = ?auto_46387 ?auto_46390 ) ) ( not ( = ?auto_46388 ?auto_46389 ) ) ( not ( = ?auto_46388 ?auto_46390 ) ) ( not ( = ?auto_46389 ?auto_46390 ) ) ( ON ?auto_46390 ?auto_46391 ) ( not ( = ?auto_46386 ?auto_46391 ) ) ( not ( = ?auto_46387 ?auto_46391 ) ) ( not ( = ?auto_46388 ?auto_46391 ) ) ( not ( = ?auto_46389 ?auto_46391 ) ) ( not ( = ?auto_46390 ?auto_46391 ) ) ( ON ?auto_46389 ?auto_46390 ) ( ON-TABLE ?auto_46391 ) ( ON ?auto_46388 ?auto_46389 ) ( ON ?auto_46387 ?auto_46388 ) ( ON ?auto_46386 ?auto_46387 ) ( CLEAR ?auto_46386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46391 ?auto_46390 ?auto_46389 ?auto_46388 ?auto_46387 )
      ( MAKE-5PILE ?auto_46386 ?auto_46387 ?auto_46388 ?auto_46389 ?auto_46390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46392 - BLOCK
      ?auto_46393 - BLOCK
      ?auto_46394 - BLOCK
      ?auto_46395 - BLOCK
      ?auto_46396 - BLOCK
    )
    :vars
    (
      ?auto_46397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46392 ?auto_46393 ) ) ( not ( = ?auto_46392 ?auto_46394 ) ) ( not ( = ?auto_46392 ?auto_46395 ) ) ( not ( = ?auto_46392 ?auto_46396 ) ) ( not ( = ?auto_46393 ?auto_46394 ) ) ( not ( = ?auto_46393 ?auto_46395 ) ) ( not ( = ?auto_46393 ?auto_46396 ) ) ( not ( = ?auto_46394 ?auto_46395 ) ) ( not ( = ?auto_46394 ?auto_46396 ) ) ( not ( = ?auto_46395 ?auto_46396 ) ) ( ON ?auto_46396 ?auto_46397 ) ( not ( = ?auto_46392 ?auto_46397 ) ) ( not ( = ?auto_46393 ?auto_46397 ) ) ( not ( = ?auto_46394 ?auto_46397 ) ) ( not ( = ?auto_46395 ?auto_46397 ) ) ( not ( = ?auto_46396 ?auto_46397 ) ) ( ON ?auto_46395 ?auto_46396 ) ( ON-TABLE ?auto_46397 ) ( ON ?auto_46394 ?auto_46395 ) ( ON ?auto_46393 ?auto_46394 ) ( HOLDING ?auto_46392 ) ( CLEAR ?auto_46393 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46397 ?auto_46396 ?auto_46395 ?auto_46394 ?auto_46393 ?auto_46392 )
      ( MAKE-5PILE ?auto_46392 ?auto_46393 ?auto_46394 ?auto_46395 ?auto_46396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46398 - BLOCK
      ?auto_46399 - BLOCK
      ?auto_46400 - BLOCK
      ?auto_46401 - BLOCK
      ?auto_46402 - BLOCK
    )
    :vars
    (
      ?auto_46403 - BLOCK
      ?auto_46404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46398 ?auto_46399 ) ) ( not ( = ?auto_46398 ?auto_46400 ) ) ( not ( = ?auto_46398 ?auto_46401 ) ) ( not ( = ?auto_46398 ?auto_46402 ) ) ( not ( = ?auto_46399 ?auto_46400 ) ) ( not ( = ?auto_46399 ?auto_46401 ) ) ( not ( = ?auto_46399 ?auto_46402 ) ) ( not ( = ?auto_46400 ?auto_46401 ) ) ( not ( = ?auto_46400 ?auto_46402 ) ) ( not ( = ?auto_46401 ?auto_46402 ) ) ( ON ?auto_46402 ?auto_46403 ) ( not ( = ?auto_46398 ?auto_46403 ) ) ( not ( = ?auto_46399 ?auto_46403 ) ) ( not ( = ?auto_46400 ?auto_46403 ) ) ( not ( = ?auto_46401 ?auto_46403 ) ) ( not ( = ?auto_46402 ?auto_46403 ) ) ( ON ?auto_46401 ?auto_46402 ) ( ON-TABLE ?auto_46403 ) ( ON ?auto_46400 ?auto_46401 ) ( ON ?auto_46399 ?auto_46400 ) ( CLEAR ?auto_46399 ) ( ON ?auto_46398 ?auto_46404 ) ( CLEAR ?auto_46398 ) ( HAND-EMPTY ) ( not ( = ?auto_46398 ?auto_46404 ) ) ( not ( = ?auto_46399 ?auto_46404 ) ) ( not ( = ?auto_46400 ?auto_46404 ) ) ( not ( = ?auto_46401 ?auto_46404 ) ) ( not ( = ?auto_46402 ?auto_46404 ) ) ( not ( = ?auto_46403 ?auto_46404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46398 ?auto_46404 )
      ( MAKE-5PILE ?auto_46398 ?auto_46399 ?auto_46400 ?auto_46401 ?auto_46402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46405 - BLOCK
      ?auto_46406 - BLOCK
      ?auto_46407 - BLOCK
      ?auto_46408 - BLOCK
      ?auto_46409 - BLOCK
    )
    :vars
    (
      ?auto_46411 - BLOCK
      ?auto_46410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46405 ?auto_46406 ) ) ( not ( = ?auto_46405 ?auto_46407 ) ) ( not ( = ?auto_46405 ?auto_46408 ) ) ( not ( = ?auto_46405 ?auto_46409 ) ) ( not ( = ?auto_46406 ?auto_46407 ) ) ( not ( = ?auto_46406 ?auto_46408 ) ) ( not ( = ?auto_46406 ?auto_46409 ) ) ( not ( = ?auto_46407 ?auto_46408 ) ) ( not ( = ?auto_46407 ?auto_46409 ) ) ( not ( = ?auto_46408 ?auto_46409 ) ) ( ON ?auto_46409 ?auto_46411 ) ( not ( = ?auto_46405 ?auto_46411 ) ) ( not ( = ?auto_46406 ?auto_46411 ) ) ( not ( = ?auto_46407 ?auto_46411 ) ) ( not ( = ?auto_46408 ?auto_46411 ) ) ( not ( = ?auto_46409 ?auto_46411 ) ) ( ON ?auto_46408 ?auto_46409 ) ( ON-TABLE ?auto_46411 ) ( ON ?auto_46407 ?auto_46408 ) ( ON ?auto_46405 ?auto_46410 ) ( CLEAR ?auto_46405 ) ( not ( = ?auto_46405 ?auto_46410 ) ) ( not ( = ?auto_46406 ?auto_46410 ) ) ( not ( = ?auto_46407 ?auto_46410 ) ) ( not ( = ?auto_46408 ?auto_46410 ) ) ( not ( = ?auto_46409 ?auto_46410 ) ) ( not ( = ?auto_46411 ?auto_46410 ) ) ( HOLDING ?auto_46406 ) ( CLEAR ?auto_46407 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46411 ?auto_46409 ?auto_46408 ?auto_46407 ?auto_46406 )
      ( MAKE-5PILE ?auto_46405 ?auto_46406 ?auto_46407 ?auto_46408 ?auto_46409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46412 - BLOCK
      ?auto_46413 - BLOCK
      ?auto_46414 - BLOCK
      ?auto_46415 - BLOCK
      ?auto_46416 - BLOCK
    )
    :vars
    (
      ?auto_46418 - BLOCK
      ?auto_46417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46412 ?auto_46413 ) ) ( not ( = ?auto_46412 ?auto_46414 ) ) ( not ( = ?auto_46412 ?auto_46415 ) ) ( not ( = ?auto_46412 ?auto_46416 ) ) ( not ( = ?auto_46413 ?auto_46414 ) ) ( not ( = ?auto_46413 ?auto_46415 ) ) ( not ( = ?auto_46413 ?auto_46416 ) ) ( not ( = ?auto_46414 ?auto_46415 ) ) ( not ( = ?auto_46414 ?auto_46416 ) ) ( not ( = ?auto_46415 ?auto_46416 ) ) ( ON ?auto_46416 ?auto_46418 ) ( not ( = ?auto_46412 ?auto_46418 ) ) ( not ( = ?auto_46413 ?auto_46418 ) ) ( not ( = ?auto_46414 ?auto_46418 ) ) ( not ( = ?auto_46415 ?auto_46418 ) ) ( not ( = ?auto_46416 ?auto_46418 ) ) ( ON ?auto_46415 ?auto_46416 ) ( ON-TABLE ?auto_46418 ) ( ON ?auto_46414 ?auto_46415 ) ( ON ?auto_46412 ?auto_46417 ) ( not ( = ?auto_46412 ?auto_46417 ) ) ( not ( = ?auto_46413 ?auto_46417 ) ) ( not ( = ?auto_46414 ?auto_46417 ) ) ( not ( = ?auto_46415 ?auto_46417 ) ) ( not ( = ?auto_46416 ?auto_46417 ) ) ( not ( = ?auto_46418 ?auto_46417 ) ) ( CLEAR ?auto_46414 ) ( ON ?auto_46413 ?auto_46412 ) ( CLEAR ?auto_46413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46417 ?auto_46412 )
      ( MAKE-5PILE ?auto_46412 ?auto_46413 ?auto_46414 ?auto_46415 ?auto_46416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46419 - BLOCK
      ?auto_46420 - BLOCK
      ?auto_46421 - BLOCK
      ?auto_46422 - BLOCK
      ?auto_46423 - BLOCK
    )
    :vars
    (
      ?auto_46425 - BLOCK
      ?auto_46424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46419 ?auto_46420 ) ) ( not ( = ?auto_46419 ?auto_46421 ) ) ( not ( = ?auto_46419 ?auto_46422 ) ) ( not ( = ?auto_46419 ?auto_46423 ) ) ( not ( = ?auto_46420 ?auto_46421 ) ) ( not ( = ?auto_46420 ?auto_46422 ) ) ( not ( = ?auto_46420 ?auto_46423 ) ) ( not ( = ?auto_46421 ?auto_46422 ) ) ( not ( = ?auto_46421 ?auto_46423 ) ) ( not ( = ?auto_46422 ?auto_46423 ) ) ( ON ?auto_46423 ?auto_46425 ) ( not ( = ?auto_46419 ?auto_46425 ) ) ( not ( = ?auto_46420 ?auto_46425 ) ) ( not ( = ?auto_46421 ?auto_46425 ) ) ( not ( = ?auto_46422 ?auto_46425 ) ) ( not ( = ?auto_46423 ?auto_46425 ) ) ( ON ?auto_46422 ?auto_46423 ) ( ON-TABLE ?auto_46425 ) ( ON ?auto_46419 ?auto_46424 ) ( not ( = ?auto_46419 ?auto_46424 ) ) ( not ( = ?auto_46420 ?auto_46424 ) ) ( not ( = ?auto_46421 ?auto_46424 ) ) ( not ( = ?auto_46422 ?auto_46424 ) ) ( not ( = ?auto_46423 ?auto_46424 ) ) ( not ( = ?auto_46425 ?auto_46424 ) ) ( ON ?auto_46420 ?auto_46419 ) ( CLEAR ?auto_46420 ) ( ON-TABLE ?auto_46424 ) ( HOLDING ?auto_46421 ) ( CLEAR ?auto_46422 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46425 ?auto_46423 ?auto_46422 ?auto_46421 )
      ( MAKE-5PILE ?auto_46419 ?auto_46420 ?auto_46421 ?auto_46422 ?auto_46423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46426 - BLOCK
      ?auto_46427 - BLOCK
      ?auto_46428 - BLOCK
      ?auto_46429 - BLOCK
      ?auto_46430 - BLOCK
    )
    :vars
    (
      ?auto_46432 - BLOCK
      ?auto_46431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46426 ?auto_46427 ) ) ( not ( = ?auto_46426 ?auto_46428 ) ) ( not ( = ?auto_46426 ?auto_46429 ) ) ( not ( = ?auto_46426 ?auto_46430 ) ) ( not ( = ?auto_46427 ?auto_46428 ) ) ( not ( = ?auto_46427 ?auto_46429 ) ) ( not ( = ?auto_46427 ?auto_46430 ) ) ( not ( = ?auto_46428 ?auto_46429 ) ) ( not ( = ?auto_46428 ?auto_46430 ) ) ( not ( = ?auto_46429 ?auto_46430 ) ) ( ON ?auto_46430 ?auto_46432 ) ( not ( = ?auto_46426 ?auto_46432 ) ) ( not ( = ?auto_46427 ?auto_46432 ) ) ( not ( = ?auto_46428 ?auto_46432 ) ) ( not ( = ?auto_46429 ?auto_46432 ) ) ( not ( = ?auto_46430 ?auto_46432 ) ) ( ON ?auto_46429 ?auto_46430 ) ( ON-TABLE ?auto_46432 ) ( ON ?auto_46426 ?auto_46431 ) ( not ( = ?auto_46426 ?auto_46431 ) ) ( not ( = ?auto_46427 ?auto_46431 ) ) ( not ( = ?auto_46428 ?auto_46431 ) ) ( not ( = ?auto_46429 ?auto_46431 ) ) ( not ( = ?auto_46430 ?auto_46431 ) ) ( not ( = ?auto_46432 ?auto_46431 ) ) ( ON ?auto_46427 ?auto_46426 ) ( ON-TABLE ?auto_46431 ) ( CLEAR ?auto_46429 ) ( ON ?auto_46428 ?auto_46427 ) ( CLEAR ?auto_46428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46431 ?auto_46426 ?auto_46427 )
      ( MAKE-5PILE ?auto_46426 ?auto_46427 ?auto_46428 ?auto_46429 ?auto_46430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46433 - BLOCK
      ?auto_46434 - BLOCK
      ?auto_46435 - BLOCK
      ?auto_46436 - BLOCK
      ?auto_46437 - BLOCK
    )
    :vars
    (
      ?auto_46439 - BLOCK
      ?auto_46438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46433 ?auto_46434 ) ) ( not ( = ?auto_46433 ?auto_46435 ) ) ( not ( = ?auto_46433 ?auto_46436 ) ) ( not ( = ?auto_46433 ?auto_46437 ) ) ( not ( = ?auto_46434 ?auto_46435 ) ) ( not ( = ?auto_46434 ?auto_46436 ) ) ( not ( = ?auto_46434 ?auto_46437 ) ) ( not ( = ?auto_46435 ?auto_46436 ) ) ( not ( = ?auto_46435 ?auto_46437 ) ) ( not ( = ?auto_46436 ?auto_46437 ) ) ( ON ?auto_46437 ?auto_46439 ) ( not ( = ?auto_46433 ?auto_46439 ) ) ( not ( = ?auto_46434 ?auto_46439 ) ) ( not ( = ?auto_46435 ?auto_46439 ) ) ( not ( = ?auto_46436 ?auto_46439 ) ) ( not ( = ?auto_46437 ?auto_46439 ) ) ( ON-TABLE ?auto_46439 ) ( ON ?auto_46433 ?auto_46438 ) ( not ( = ?auto_46433 ?auto_46438 ) ) ( not ( = ?auto_46434 ?auto_46438 ) ) ( not ( = ?auto_46435 ?auto_46438 ) ) ( not ( = ?auto_46436 ?auto_46438 ) ) ( not ( = ?auto_46437 ?auto_46438 ) ) ( not ( = ?auto_46439 ?auto_46438 ) ) ( ON ?auto_46434 ?auto_46433 ) ( ON-TABLE ?auto_46438 ) ( ON ?auto_46435 ?auto_46434 ) ( CLEAR ?auto_46435 ) ( HOLDING ?auto_46436 ) ( CLEAR ?auto_46437 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46439 ?auto_46437 ?auto_46436 )
      ( MAKE-5PILE ?auto_46433 ?auto_46434 ?auto_46435 ?auto_46436 ?auto_46437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46440 - BLOCK
      ?auto_46441 - BLOCK
      ?auto_46442 - BLOCK
      ?auto_46443 - BLOCK
      ?auto_46444 - BLOCK
    )
    :vars
    (
      ?auto_46446 - BLOCK
      ?auto_46445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46440 ?auto_46441 ) ) ( not ( = ?auto_46440 ?auto_46442 ) ) ( not ( = ?auto_46440 ?auto_46443 ) ) ( not ( = ?auto_46440 ?auto_46444 ) ) ( not ( = ?auto_46441 ?auto_46442 ) ) ( not ( = ?auto_46441 ?auto_46443 ) ) ( not ( = ?auto_46441 ?auto_46444 ) ) ( not ( = ?auto_46442 ?auto_46443 ) ) ( not ( = ?auto_46442 ?auto_46444 ) ) ( not ( = ?auto_46443 ?auto_46444 ) ) ( ON ?auto_46444 ?auto_46446 ) ( not ( = ?auto_46440 ?auto_46446 ) ) ( not ( = ?auto_46441 ?auto_46446 ) ) ( not ( = ?auto_46442 ?auto_46446 ) ) ( not ( = ?auto_46443 ?auto_46446 ) ) ( not ( = ?auto_46444 ?auto_46446 ) ) ( ON-TABLE ?auto_46446 ) ( ON ?auto_46440 ?auto_46445 ) ( not ( = ?auto_46440 ?auto_46445 ) ) ( not ( = ?auto_46441 ?auto_46445 ) ) ( not ( = ?auto_46442 ?auto_46445 ) ) ( not ( = ?auto_46443 ?auto_46445 ) ) ( not ( = ?auto_46444 ?auto_46445 ) ) ( not ( = ?auto_46446 ?auto_46445 ) ) ( ON ?auto_46441 ?auto_46440 ) ( ON-TABLE ?auto_46445 ) ( ON ?auto_46442 ?auto_46441 ) ( CLEAR ?auto_46444 ) ( ON ?auto_46443 ?auto_46442 ) ( CLEAR ?auto_46443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46445 ?auto_46440 ?auto_46441 ?auto_46442 )
      ( MAKE-5PILE ?auto_46440 ?auto_46441 ?auto_46442 ?auto_46443 ?auto_46444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46447 - BLOCK
      ?auto_46448 - BLOCK
      ?auto_46449 - BLOCK
      ?auto_46450 - BLOCK
      ?auto_46451 - BLOCK
    )
    :vars
    (
      ?auto_46452 - BLOCK
      ?auto_46453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46447 ?auto_46448 ) ) ( not ( = ?auto_46447 ?auto_46449 ) ) ( not ( = ?auto_46447 ?auto_46450 ) ) ( not ( = ?auto_46447 ?auto_46451 ) ) ( not ( = ?auto_46448 ?auto_46449 ) ) ( not ( = ?auto_46448 ?auto_46450 ) ) ( not ( = ?auto_46448 ?auto_46451 ) ) ( not ( = ?auto_46449 ?auto_46450 ) ) ( not ( = ?auto_46449 ?auto_46451 ) ) ( not ( = ?auto_46450 ?auto_46451 ) ) ( not ( = ?auto_46447 ?auto_46452 ) ) ( not ( = ?auto_46448 ?auto_46452 ) ) ( not ( = ?auto_46449 ?auto_46452 ) ) ( not ( = ?auto_46450 ?auto_46452 ) ) ( not ( = ?auto_46451 ?auto_46452 ) ) ( ON-TABLE ?auto_46452 ) ( ON ?auto_46447 ?auto_46453 ) ( not ( = ?auto_46447 ?auto_46453 ) ) ( not ( = ?auto_46448 ?auto_46453 ) ) ( not ( = ?auto_46449 ?auto_46453 ) ) ( not ( = ?auto_46450 ?auto_46453 ) ) ( not ( = ?auto_46451 ?auto_46453 ) ) ( not ( = ?auto_46452 ?auto_46453 ) ) ( ON ?auto_46448 ?auto_46447 ) ( ON-TABLE ?auto_46453 ) ( ON ?auto_46449 ?auto_46448 ) ( ON ?auto_46450 ?auto_46449 ) ( CLEAR ?auto_46450 ) ( HOLDING ?auto_46451 ) ( CLEAR ?auto_46452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46452 ?auto_46451 )
      ( MAKE-5PILE ?auto_46447 ?auto_46448 ?auto_46449 ?auto_46450 ?auto_46451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46454 - BLOCK
      ?auto_46455 - BLOCK
      ?auto_46456 - BLOCK
      ?auto_46457 - BLOCK
      ?auto_46458 - BLOCK
    )
    :vars
    (
      ?auto_46460 - BLOCK
      ?auto_46459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46454 ?auto_46455 ) ) ( not ( = ?auto_46454 ?auto_46456 ) ) ( not ( = ?auto_46454 ?auto_46457 ) ) ( not ( = ?auto_46454 ?auto_46458 ) ) ( not ( = ?auto_46455 ?auto_46456 ) ) ( not ( = ?auto_46455 ?auto_46457 ) ) ( not ( = ?auto_46455 ?auto_46458 ) ) ( not ( = ?auto_46456 ?auto_46457 ) ) ( not ( = ?auto_46456 ?auto_46458 ) ) ( not ( = ?auto_46457 ?auto_46458 ) ) ( not ( = ?auto_46454 ?auto_46460 ) ) ( not ( = ?auto_46455 ?auto_46460 ) ) ( not ( = ?auto_46456 ?auto_46460 ) ) ( not ( = ?auto_46457 ?auto_46460 ) ) ( not ( = ?auto_46458 ?auto_46460 ) ) ( ON-TABLE ?auto_46460 ) ( ON ?auto_46454 ?auto_46459 ) ( not ( = ?auto_46454 ?auto_46459 ) ) ( not ( = ?auto_46455 ?auto_46459 ) ) ( not ( = ?auto_46456 ?auto_46459 ) ) ( not ( = ?auto_46457 ?auto_46459 ) ) ( not ( = ?auto_46458 ?auto_46459 ) ) ( not ( = ?auto_46460 ?auto_46459 ) ) ( ON ?auto_46455 ?auto_46454 ) ( ON-TABLE ?auto_46459 ) ( ON ?auto_46456 ?auto_46455 ) ( ON ?auto_46457 ?auto_46456 ) ( CLEAR ?auto_46460 ) ( ON ?auto_46458 ?auto_46457 ) ( CLEAR ?auto_46458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46459 ?auto_46454 ?auto_46455 ?auto_46456 ?auto_46457 )
      ( MAKE-5PILE ?auto_46454 ?auto_46455 ?auto_46456 ?auto_46457 ?auto_46458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46461 - BLOCK
      ?auto_46462 - BLOCK
      ?auto_46463 - BLOCK
      ?auto_46464 - BLOCK
      ?auto_46465 - BLOCK
    )
    :vars
    (
      ?auto_46467 - BLOCK
      ?auto_46466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46461 ?auto_46462 ) ) ( not ( = ?auto_46461 ?auto_46463 ) ) ( not ( = ?auto_46461 ?auto_46464 ) ) ( not ( = ?auto_46461 ?auto_46465 ) ) ( not ( = ?auto_46462 ?auto_46463 ) ) ( not ( = ?auto_46462 ?auto_46464 ) ) ( not ( = ?auto_46462 ?auto_46465 ) ) ( not ( = ?auto_46463 ?auto_46464 ) ) ( not ( = ?auto_46463 ?auto_46465 ) ) ( not ( = ?auto_46464 ?auto_46465 ) ) ( not ( = ?auto_46461 ?auto_46467 ) ) ( not ( = ?auto_46462 ?auto_46467 ) ) ( not ( = ?auto_46463 ?auto_46467 ) ) ( not ( = ?auto_46464 ?auto_46467 ) ) ( not ( = ?auto_46465 ?auto_46467 ) ) ( ON ?auto_46461 ?auto_46466 ) ( not ( = ?auto_46461 ?auto_46466 ) ) ( not ( = ?auto_46462 ?auto_46466 ) ) ( not ( = ?auto_46463 ?auto_46466 ) ) ( not ( = ?auto_46464 ?auto_46466 ) ) ( not ( = ?auto_46465 ?auto_46466 ) ) ( not ( = ?auto_46467 ?auto_46466 ) ) ( ON ?auto_46462 ?auto_46461 ) ( ON-TABLE ?auto_46466 ) ( ON ?auto_46463 ?auto_46462 ) ( ON ?auto_46464 ?auto_46463 ) ( ON ?auto_46465 ?auto_46464 ) ( CLEAR ?auto_46465 ) ( HOLDING ?auto_46467 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46467 )
      ( MAKE-5PILE ?auto_46461 ?auto_46462 ?auto_46463 ?auto_46464 ?auto_46465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46468 - BLOCK
      ?auto_46469 - BLOCK
      ?auto_46470 - BLOCK
      ?auto_46471 - BLOCK
      ?auto_46472 - BLOCK
    )
    :vars
    (
      ?auto_46474 - BLOCK
      ?auto_46473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46468 ?auto_46469 ) ) ( not ( = ?auto_46468 ?auto_46470 ) ) ( not ( = ?auto_46468 ?auto_46471 ) ) ( not ( = ?auto_46468 ?auto_46472 ) ) ( not ( = ?auto_46469 ?auto_46470 ) ) ( not ( = ?auto_46469 ?auto_46471 ) ) ( not ( = ?auto_46469 ?auto_46472 ) ) ( not ( = ?auto_46470 ?auto_46471 ) ) ( not ( = ?auto_46470 ?auto_46472 ) ) ( not ( = ?auto_46471 ?auto_46472 ) ) ( not ( = ?auto_46468 ?auto_46474 ) ) ( not ( = ?auto_46469 ?auto_46474 ) ) ( not ( = ?auto_46470 ?auto_46474 ) ) ( not ( = ?auto_46471 ?auto_46474 ) ) ( not ( = ?auto_46472 ?auto_46474 ) ) ( ON ?auto_46468 ?auto_46473 ) ( not ( = ?auto_46468 ?auto_46473 ) ) ( not ( = ?auto_46469 ?auto_46473 ) ) ( not ( = ?auto_46470 ?auto_46473 ) ) ( not ( = ?auto_46471 ?auto_46473 ) ) ( not ( = ?auto_46472 ?auto_46473 ) ) ( not ( = ?auto_46474 ?auto_46473 ) ) ( ON ?auto_46469 ?auto_46468 ) ( ON-TABLE ?auto_46473 ) ( ON ?auto_46470 ?auto_46469 ) ( ON ?auto_46471 ?auto_46470 ) ( ON ?auto_46472 ?auto_46471 ) ( ON ?auto_46474 ?auto_46472 ) ( CLEAR ?auto_46474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46473 ?auto_46468 ?auto_46469 ?auto_46470 ?auto_46471 ?auto_46472 )
      ( MAKE-5PILE ?auto_46468 ?auto_46469 ?auto_46470 ?auto_46471 ?auto_46472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46481 - BLOCK
      ?auto_46482 - BLOCK
      ?auto_46483 - BLOCK
      ?auto_46484 - BLOCK
      ?auto_46485 - BLOCK
      ?auto_46486 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46486 ) ( CLEAR ?auto_46485 ) ( ON-TABLE ?auto_46481 ) ( ON ?auto_46482 ?auto_46481 ) ( ON ?auto_46483 ?auto_46482 ) ( ON ?auto_46484 ?auto_46483 ) ( ON ?auto_46485 ?auto_46484 ) ( not ( = ?auto_46481 ?auto_46482 ) ) ( not ( = ?auto_46481 ?auto_46483 ) ) ( not ( = ?auto_46481 ?auto_46484 ) ) ( not ( = ?auto_46481 ?auto_46485 ) ) ( not ( = ?auto_46481 ?auto_46486 ) ) ( not ( = ?auto_46482 ?auto_46483 ) ) ( not ( = ?auto_46482 ?auto_46484 ) ) ( not ( = ?auto_46482 ?auto_46485 ) ) ( not ( = ?auto_46482 ?auto_46486 ) ) ( not ( = ?auto_46483 ?auto_46484 ) ) ( not ( = ?auto_46483 ?auto_46485 ) ) ( not ( = ?auto_46483 ?auto_46486 ) ) ( not ( = ?auto_46484 ?auto_46485 ) ) ( not ( = ?auto_46484 ?auto_46486 ) ) ( not ( = ?auto_46485 ?auto_46486 ) ) )
    :subtasks
    ( ( !STACK ?auto_46486 ?auto_46485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46487 - BLOCK
      ?auto_46488 - BLOCK
      ?auto_46489 - BLOCK
      ?auto_46490 - BLOCK
      ?auto_46491 - BLOCK
      ?auto_46492 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46491 ) ( ON-TABLE ?auto_46487 ) ( ON ?auto_46488 ?auto_46487 ) ( ON ?auto_46489 ?auto_46488 ) ( ON ?auto_46490 ?auto_46489 ) ( ON ?auto_46491 ?auto_46490 ) ( not ( = ?auto_46487 ?auto_46488 ) ) ( not ( = ?auto_46487 ?auto_46489 ) ) ( not ( = ?auto_46487 ?auto_46490 ) ) ( not ( = ?auto_46487 ?auto_46491 ) ) ( not ( = ?auto_46487 ?auto_46492 ) ) ( not ( = ?auto_46488 ?auto_46489 ) ) ( not ( = ?auto_46488 ?auto_46490 ) ) ( not ( = ?auto_46488 ?auto_46491 ) ) ( not ( = ?auto_46488 ?auto_46492 ) ) ( not ( = ?auto_46489 ?auto_46490 ) ) ( not ( = ?auto_46489 ?auto_46491 ) ) ( not ( = ?auto_46489 ?auto_46492 ) ) ( not ( = ?auto_46490 ?auto_46491 ) ) ( not ( = ?auto_46490 ?auto_46492 ) ) ( not ( = ?auto_46491 ?auto_46492 ) ) ( ON-TABLE ?auto_46492 ) ( CLEAR ?auto_46492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_46492 )
      ( MAKE-6PILE ?auto_46487 ?auto_46488 ?auto_46489 ?auto_46490 ?auto_46491 ?auto_46492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46493 - BLOCK
      ?auto_46494 - BLOCK
      ?auto_46495 - BLOCK
      ?auto_46496 - BLOCK
      ?auto_46497 - BLOCK
      ?auto_46498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46493 ) ( ON ?auto_46494 ?auto_46493 ) ( ON ?auto_46495 ?auto_46494 ) ( ON ?auto_46496 ?auto_46495 ) ( not ( = ?auto_46493 ?auto_46494 ) ) ( not ( = ?auto_46493 ?auto_46495 ) ) ( not ( = ?auto_46493 ?auto_46496 ) ) ( not ( = ?auto_46493 ?auto_46497 ) ) ( not ( = ?auto_46493 ?auto_46498 ) ) ( not ( = ?auto_46494 ?auto_46495 ) ) ( not ( = ?auto_46494 ?auto_46496 ) ) ( not ( = ?auto_46494 ?auto_46497 ) ) ( not ( = ?auto_46494 ?auto_46498 ) ) ( not ( = ?auto_46495 ?auto_46496 ) ) ( not ( = ?auto_46495 ?auto_46497 ) ) ( not ( = ?auto_46495 ?auto_46498 ) ) ( not ( = ?auto_46496 ?auto_46497 ) ) ( not ( = ?auto_46496 ?auto_46498 ) ) ( not ( = ?auto_46497 ?auto_46498 ) ) ( ON-TABLE ?auto_46498 ) ( CLEAR ?auto_46498 ) ( HOLDING ?auto_46497 ) ( CLEAR ?auto_46496 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46493 ?auto_46494 ?auto_46495 ?auto_46496 ?auto_46497 )
      ( MAKE-6PILE ?auto_46493 ?auto_46494 ?auto_46495 ?auto_46496 ?auto_46497 ?auto_46498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46499 - BLOCK
      ?auto_46500 - BLOCK
      ?auto_46501 - BLOCK
      ?auto_46502 - BLOCK
      ?auto_46503 - BLOCK
      ?auto_46504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46499 ) ( ON ?auto_46500 ?auto_46499 ) ( ON ?auto_46501 ?auto_46500 ) ( ON ?auto_46502 ?auto_46501 ) ( not ( = ?auto_46499 ?auto_46500 ) ) ( not ( = ?auto_46499 ?auto_46501 ) ) ( not ( = ?auto_46499 ?auto_46502 ) ) ( not ( = ?auto_46499 ?auto_46503 ) ) ( not ( = ?auto_46499 ?auto_46504 ) ) ( not ( = ?auto_46500 ?auto_46501 ) ) ( not ( = ?auto_46500 ?auto_46502 ) ) ( not ( = ?auto_46500 ?auto_46503 ) ) ( not ( = ?auto_46500 ?auto_46504 ) ) ( not ( = ?auto_46501 ?auto_46502 ) ) ( not ( = ?auto_46501 ?auto_46503 ) ) ( not ( = ?auto_46501 ?auto_46504 ) ) ( not ( = ?auto_46502 ?auto_46503 ) ) ( not ( = ?auto_46502 ?auto_46504 ) ) ( not ( = ?auto_46503 ?auto_46504 ) ) ( ON-TABLE ?auto_46504 ) ( CLEAR ?auto_46502 ) ( ON ?auto_46503 ?auto_46504 ) ( CLEAR ?auto_46503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46504 )
      ( MAKE-6PILE ?auto_46499 ?auto_46500 ?auto_46501 ?auto_46502 ?auto_46503 ?auto_46504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46505 - BLOCK
      ?auto_46506 - BLOCK
      ?auto_46507 - BLOCK
      ?auto_46508 - BLOCK
      ?auto_46509 - BLOCK
      ?auto_46510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46505 ) ( ON ?auto_46506 ?auto_46505 ) ( ON ?auto_46507 ?auto_46506 ) ( not ( = ?auto_46505 ?auto_46506 ) ) ( not ( = ?auto_46505 ?auto_46507 ) ) ( not ( = ?auto_46505 ?auto_46508 ) ) ( not ( = ?auto_46505 ?auto_46509 ) ) ( not ( = ?auto_46505 ?auto_46510 ) ) ( not ( = ?auto_46506 ?auto_46507 ) ) ( not ( = ?auto_46506 ?auto_46508 ) ) ( not ( = ?auto_46506 ?auto_46509 ) ) ( not ( = ?auto_46506 ?auto_46510 ) ) ( not ( = ?auto_46507 ?auto_46508 ) ) ( not ( = ?auto_46507 ?auto_46509 ) ) ( not ( = ?auto_46507 ?auto_46510 ) ) ( not ( = ?auto_46508 ?auto_46509 ) ) ( not ( = ?auto_46508 ?auto_46510 ) ) ( not ( = ?auto_46509 ?auto_46510 ) ) ( ON-TABLE ?auto_46510 ) ( ON ?auto_46509 ?auto_46510 ) ( CLEAR ?auto_46509 ) ( HOLDING ?auto_46508 ) ( CLEAR ?auto_46507 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46505 ?auto_46506 ?auto_46507 ?auto_46508 )
      ( MAKE-6PILE ?auto_46505 ?auto_46506 ?auto_46507 ?auto_46508 ?auto_46509 ?auto_46510 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46511 - BLOCK
      ?auto_46512 - BLOCK
      ?auto_46513 - BLOCK
      ?auto_46514 - BLOCK
      ?auto_46515 - BLOCK
      ?auto_46516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46511 ) ( ON ?auto_46512 ?auto_46511 ) ( ON ?auto_46513 ?auto_46512 ) ( not ( = ?auto_46511 ?auto_46512 ) ) ( not ( = ?auto_46511 ?auto_46513 ) ) ( not ( = ?auto_46511 ?auto_46514 ) ) ( not ( = ?auto_46511 ?auto_46515 ) ) ( not ( = ?auto_46511 ?auto_46516 ) ) ( not ( = ?auto_46512 ?auto_46513 ) ) ( not ( = ?auto_46512 ?auto_46514 ) ) ( not ( = ?auto_46512 ?auto_46515 ) ) ( not ( = ?auto_46512 ?auto_46516 ) ) ( not ( = ?auto_46513 ?auto_46514 ) ) ( not ( = ?auto_46513 ?auto_46515 ) ) ( not ( = ?auto_46513 ?auto_46516 ) ) ( not ( = ?auto_46514 ?auto_46515 ) ) ( not ( = ?auto_46514 ?auto_46516 ) ) ( not ( = ?auto_46515 ?auto_46516 ) ) ( ON-TABLE ?auto_46516 ) ( ON ?auto_46515 ?auto_46516 ) ( CLEAR ?auto_46513 ) ( ON ?auto_46514 ?auto_46515 ) ( CLEAR ?auto_46514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46516 ?auto_46515 )
      ( MAKE-6PILE ?auto_46511 ?auto_46512 ?auto_46513 ?auto_46514 ?auto_46515 ?auto_46516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46517 - BLOCK
      ?auto_46518 - BLOCK
      ?auto_46519 - BLOCK
      ?auto_46520 - BLOCK
      ?auto_46521 - BLOCK
      ?auto_46522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46517 ) ( ON ?auto_46518 ?auto_46517 ) ( not ( = ?auto_46517 ?auto_46518 ) ) ( not ( = ?auto_46517 ?auto_46519 ) ) ( not ( = ?auto_46517 ?auto_46520 ) ) ( not ( = ?auto_46517 ?auto_46521 ) ) ( not ( = ?auto_46517 ?auto_46522 ) ) ( not ( = ?auto_46518 ?auto_46519 ) ) ( not ( = ?auto_46518 ?auto_46520 ) ) ( not ( = ?auto_46518 ?auto_46521 ) ) ( not ( = ?auto_46518 ?auto_46522 ) ) ( not ( = ?auto_46519 ?auto_46520 ) ) ( not ( = ?auto_46519 ?auto_46521 ) ) ( not ( = ?auto_46519 ?auto_46522 ) ) ( not ( = ?auto_46520 ?auto_46521 ) ) ( not ( = ?auto_46520 ?auto_46522 ) ) ( not ( = ?auto_46521 ?auto_46522 ) ) ( ON-TABLE ?auto_46522 ) ( ON ?auto_46521 ?auto_46522 ) ( ON ?auto_46520 ?auto_46521 ) ( CLEAR ?auto_46520 ) ( HOLDING ?auto_46519 ) ( CLEAR ?auto_46518 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46517 ?auto_46518 ?auto_46519 )
      ( MAKE-6PILE ?auto_46517 ?auto_46518 ?auto_46519 ?auto_46520 ?auto_46521 ?auto_46522 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46523 - BLOCK
      ?auto_46524 - BLOCK
      ?auto_46525 - BLOCK
      ?auto_46526 - BLOCK
      ?auto_46527 - BLOCK
      ?auto_46528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46523 ) ( ON ?auto_46524 ?auto_46523 ) ( not ( = ?auto_46523 ?auto_46524 ) ) ( not ( = ?auto_46523 ?auto_46525 ) ) ( not ( = ?auto_46523 ?auto_46526 ) ) ( not ( = ?auto_46523 ?auto_46527 ) ) ( not ( = ?auto_46523 ?auto_46528 ) ) ( not ( = ?auto_46524 ?auto_46525 ) ) ( not ( = ?auto_46524 ?auto_46526 ) ) ( not ( = ?auto_46524 ?auto_46527 ) ) ( not ( = ?auto_46524 ?auto_46528 ) ) ( not ( = ?auto_46525 ?auto_46526 ) ) ( not ( = ?auto_46525 ?auto_46527 ) ) ( not ( = ?auto_46525 ?auto_46528 ) ) ( not ( = ?auto_46526 ?auto_46527 ) ) ( not ( = ?auto_46526 ?auto_46528 ) ) ( not ( = ?auto_46527 ?auto_46528 ) ) ( ON-TABLE ?auto_46528 ) ( ON ?auto_46527 ?auto_46528 ) ( ON ?auto_46526 ?auto_46527 ) ( CLEAR ?auto_46524 ) ( ON ?auto_46525 ?auto_46526 ) ( CLEAR ?auto_46525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46528 ?auto_46527 ?auto_46526 )
      ( MAKE-6PILE ?auto_46523 ?auto_46524 ?auto_46525 ?auto_46526 ?auto_46527 ?auto_46528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46529 - BLOCK
      ?auto_46530 - BLOCK
      ?auto_46531 - BLOCK
      ?auto_46532 - BLOCK
      ?auto_46533 - BLOCK
      ?auto_46534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46529 ) ( not ( = ?auto_46529 ?auto_46530 ) ) ( not ( = ?auto_46529 ?auto_46531 ) ) ( not ( = ?auto_46529 ?auto_46532 ) ) ( not ( = ?auto_46529 ?auto_46533 ) ) ( not ( = ?auto_46529 ?auto_46534 ) ) ( not ( = ?auto_46530 ?auto_46531 ) ) ( not ( = ?auto_46530 ?auto_46532 ) ) ( not ( = ?auto_46530 ?auto_46533 ) ) ( not ( = ?auto_46530 ?auto_46534 ) ) ( not ( = ?auto_46531 ?auto_46532 ) ) ( not ( = ?auto_46531 ?auto_46533 ) ) ( not ( = ?auto_46531 ?auto_46534 ) ) ( not ( = ?auto_46532 ?auto_46533 ) ) ( not ( = ?auto_46532 ?auto_46534 ) ) ( not ( = ?auto_46533 ?auto_46534 ) ) ( ON-TABLE ?auto_46534 ) ( ON ?auto_46533 ?auto_46534 ) ( ON ?auto_46532 ?auto_46533 ) ( ON ?auto_46531 ?auto_46532 ) ( CLEAR ?auto_46531 ) ( HOLDING ?auto_46530 ) ( CLEAR ?auto_46529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46529 ?auto_46530 )
      ( MAKE-6PILE ?auto_46529 ?auto_46530 ?auto_46531 ?auto_46532 ?auto_46533 ?auto_46534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46535 - BLOCK
      ?auto_46536 - BLOCK
      ?auto_46537 - BLOCK
      ?auto_46538 - BLOCK
      ?auto_46539 - BLOCK
      ?auto_46540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46535 ) ( not ( = ?auto_46535 ?auto_46536 ) ) ( not ( = ?auto_46535 ?auto_46537 ) ) ( not ( = ?auto_46535 ?auto_46538 ) ) ( not ( = ?auto_46535 ?auto_46539 ) ) ( not ( = ?auto_46535 ?auto_46540 ) ) ( not ( = ?auto_46536 ?auto_46537 ) ) ( not ( = ?auto_46536 ?auto_46538 ) ) ( not ( = ?auto_46536 ?auto_46539 ) ) ( not ( = ?auto_46536 ?auto_46540 ) ) ( not ( = ?auto_46537 ?auto_46538 ) ) ( not ( = ?auto_46537 ?auto_46539 ) ) ( not ( = ?auto_46537 ?auto_46540 ) ) ( not ( = ?auto_46538 ?auto_46539 ) ) ( not ( = ?auto_46538 ?auto_46540 ) ) ( not ( = ?auto_46539 ?auto_46540 ) ) ( ON-TABLE ?auto_46540 ) ( ON ?auto_46539 ?auto_46540 ) ( ON ?auto_46538 ?auto_46539 ) ( ON ?auto_46537 ?auto_46538 ) ( CLEAR ?auto_46535 ) ( ON ?auto_46536 ?auto_46537 ) ( CLEAR ?auto_46536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46540 ?auto_46539 ?auto_46538 ?auto_46537 )
      ( MAKE-6PILE ?auto_46535 ?auto_46536 ?auto_46537 ?auto_46538 ?auto_46539 ?auto_46540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46541 - BLOCK
      ?auto_46542 - BLOCK
      ?auto_46543 - BLOCK
      ?auto_46544 - BLOCK
      ?auto_46545 - BLOCK
      ?auto_46546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46541 ?auto_46542 ) ) ( not ( = ?auto_46541 ?auto_46543 ) ) ( not ( = ?auto_46541 ?auto_46544 ) ) ( not ( = ?auto_46541 ?auto_46545 ) ) ( not ( = ?auto_46541 ?auto_46546 ) ) ( not ( = ?auto_46542 ?auto_46543 ) ) ( not ( = ?auto_46542 ?auto_46544 ) ) ( not ( = ?auto_46542 ?auto_46545 ) ) ( not ( = ?auto_46542 ?auto_46546 ) ) ( not ( = ?auto_46543 ?auto_46544 ) ) ( not ( = ?auto_46543 ?auto_46545 ) ) ( not ( = ?auto_46543 ?auto_46546 ) ) ( not ( = ?auto_46544 ?auto_46545 ) ) ( not ( = ?auto_46544 ?auto_46546 ) ) ( not ( = ?auto_46545 ?auto_46546 ) ) ( ON-TABLE ?auto_46546 ) ( ON ?auto_46545 ?auto_46546 ) ( ON ?auto_46544 ?auto_46545 ) ( ON ?auto_46543 ?auto_46544 ) ( ON ?auto_46542 ?auto_46543 ) ( CLEAR ?auto_46542 ) ( HOLDING ?auto_46541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46541 )
      ( MAKE-6PILE ?auto_46541 ?auto_46542 ?auto_46543 ?auto_46544 ?auto_46545 ?auto_46546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46547 - BLOCK
      ?auto_46548 - BLOCK
      ?auto_46549 - BLOCK
      ?auto_46550 - BLOCK
      ?auto_46551 - BLOCK
      ?auto_46552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46547 ?auto_46548 ) ) ( not ( = ?auto_46547 ?auto_46549 ) ) ( not ( = ?auto_46547 ?auto_46550 ) ) ( not ( = ?auto_46547 ?auto_46551 ) ) ( not ( = ?auto_46547 ?auto_46552 ) ) ( not ( = ?auto_46548 ?auto_46549 ) ) ( not ( = ?auto_46548 ?auto_46550 ) ) ( not ( = ?auto_46548 ?auto_46551 ) ) ( not ( = ?auto_46548 ?auto_46552 ) ) ( not ( = ?auto_46549 ?auto_46550 ) ) ( not ( = ?auto_46549 ?auto_46551 ) ) ( not ( = ?auto_46549 ?auto_46552 ) ) ( not ( = ?auto_46550 ?auto_46551 ) ) ( not ( = ?auto_46550 ?auto_46552 ) ) ( not ( = ?auto_46551 ?auto_46552 ) ) ( ON-TABLE ?auto_46552 ) ( ON ?auto_46551 ?auto_46552 ) ( ON ?auto_46550 ?auto_46551 ) ( ON ?auto_46549 ?auto_46550 ) ( ON ?auto_46548 ?auto_46549 ) ( ON ?auto_46547 ?auto_46548 ) ( CLEAR ?auto_46547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46552 ?auto_46551 ?auto_46550 ?auto_46549 ?auto_46548 )
      ( MAKE-6PILE ?auto_46547 ?auto_46548 ?auto_46549 ?auto_46550 ?auto_46551 ?auto_46552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46553 - BLOCK
      ?auto_46554 - BLOCK
      ?auto_46555 - BLOCK
      ?auto_46556 - BLOCK
      ?auto_46557 - BLOCK
      ?auto_46558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46553 ?auto_46554 ) ) ( not ( = ?auto_46553 ?auto_46555 ) ) ( not ( = ?auto_46553 ?auto_46556 ) ) ( not ( = ?auto_46553 ?auto_46557 ) ) ( not ( = ?auto_46553 ?auto_46558 ) ) ( not ( = ?auto_46554 ?auto_46555 ) ) ( not ( = ?auto_46554 ?auto_46556 ) ) ( not ( = ?auto_46554 ?auto_46557 ) ) ( not ( = ?auto_46554 ?auto_46558 ) ) ( not ( = ?auto_46555 ?auto_46556 ) ) ( not ( = ?auto_46555 ?auto_46557 ) ) ( not ( = ?auto_46555 ?auto_46558 ) ) ( not ( = ?auto_46556 ?auto_46557 ) ) ( not ( = ?auto_46556 ?auto_46558 ) ) ( not ( = ?auto_46557 ?auto_46558 ) ) ( ON-TABLE ?auto_46558 ) ( ON ?auto_46557 ?auto_46558 ) ( ON ?auto_46556 ?auto_46557 ) ( ON ?auto_46555 ?auto_46556 ) ( ON ?auto_46554 ?auto_46555 ) ( HOLDING ?auto_46553 ) ( CLEAR ?auto_46554 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46558 ?auto_46557 ?auto_46556 ?auto_46555 ?auto_46554 ?auto_46553 )
      ( MAKE-6PILE ?auto_46553 ?auto_46554 ?auto_46555 ?auto_46556 ?auto_46557 ?auto_46558 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46559 - BLOCK
      ?auto_46560 - BLOCK
      ?auto_46561 - BLOCK
      ?auto_46562 - BLOCK
      ?auto_46563 - BLOCK
      ?auto_46564 - BLOCK
    )
    :vars
    (
      ?auto_46565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46559 ?auto_46560 ) ) ( not ( = ?auto_46559 ?auto_46561 ) ) ( not ( = ?auto_46559 ?auto_46562 ) ) ( not ( = ?auto_46559 ?auto_46563 ) ) ( not ( = ?auto_46559 ?auto_46564 ) ) ( not ( = ?auto_46560 ?auto_46561 ) ) ( not ( = ?auto_46560 ?auto_46562 ) ) ( not ( = ?auto_46560 ?auto_46563 ) ) ( not ( = ?auto_46560 ?auto_46564 ) ) ( not ( = ?auto_46561 ?auto_46562 ) ) ( not ( = ?auto_46561 ?auto_46563 ) ) ( not ( = ?auto_46561 ?auto_46564 ) ) ( not ( = ?auto_46562 ?auto_46563 ) ) ( not ( = ?auto_46562 ?auto_46564 ) ) ( not ( = ?auto_46563 ?auto_46564 ) ) ( ON-TABLE ?auto_46564 ) ( ON ?auto_46563 ?auto_46564 ) ( ON ?auto_46562 ?auto_46563 ) ( ON ?auto_46561 ?auto_46562 ) ( ON ?auto_46560 ?auto_46561 ) ( CLEAR ?auto_46560 ) ( ON ?auto_46559 ?auto_46565 ) ( CLEAR ?auto_46559 ) ( HAND-EMPTY ) ( not ( = ?auto_46559 ?auto_46565 ) ) ( not ( = ?auto_46560 ?auto_46565 ) ) ( not ( = ?auto_46561 ?auto_46565 ) ) ( not ( = ?auto_46562 ?auto_46565 ) ) ( not ( = ?auto_46563 ?auto_46565 ) ) ( not ( = ?auto_46564 ?auto_46565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46559 ?auto_46565 )
      ( MAKE-6PILE ?auto_46559 ?auto_46560 ?auto_46561 ?auto_46562 ?auto_46563 ?auto_46564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46566 - BLOCK
      ?auto_46567 - BLOCK
      ?auto_46568 - BLOCK
      ?auto_46569 - BLOCK
      ?auto_46570 - BLOCK
      ?auto_46571 - BLOCK
    )
    :vars
    (
      ?auto_46572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46566 ?auto_46567 ) ) ( not ( = ?auto_46566 ?auto_46568 ) ) ( not ( = ?auto_46566 ?auto_46569 ) ) ( not ( = ?auto_46566 ?auto_46570 ) ) ( not ( = ?auto_46566 ?auto_46571 ) ) ( not ( = ?auto_46567 ?auto_46568 ) ) ( not ( = ?auto_46567 ?auto_46569 ) ) ( not ( = ?auto_46567 ?auto_46570 ) ) ( not ( = ?auto_46567 ?auto_46571 ) ) ( not ( = ?auto_46568 ?auto_46569 ) ) ( not ( = ?auto_46568 ?auto_46570 ) ) ( not ( = ?auto_46568 ?auto_46571 ) ) ( not ( = ?auto_46569 ?auto_46570 ) ) ( not ( = ?auto_46569 ?auto_46571 ) ) ( not ( = ?auto_46570 ?auto_46571 ) ) ( ON-TABLE ?auto_46571 ) ( ON ?auto_46570 ?auto_46571 ) ( ON ?auto_46569 ?auto_46570 ) ( ON ?auto_46568 ?auto_46569 ) ( ON ?auto_46566 ?auto_46572 ) ( CLEAR ?auto_46566 ) ( not ( = ?auto_46566 ?auto_46572 ) ) ( not ( = ?auto_46567 ?auto_46572 ) ) ( not ( = ?auto_46568 ?auto_46572 ) ) ( not ( = ?auto_46569 ?auto_46572 ) ) ( not ( = ?auto_46570 ?auto_46572 ) ) ( not ( = ?auto_46571 ?auto_46572 ) ) ( HOLDING ?auto_46567 ) ( CLEAR ?auto_46568 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46571 ?auto_46570 ?auto_46569 ?auto_46568 ?auto_46567 )
      ( MAKE-6PILE ?auto_46566 ?auto_46567 ?auto_46568 ?auto_46569 ?auto_46570 ?auto_46571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46573 - BLOCK
      ?auto_46574 - BLOCK
      ?auto_46575 - BLOCK
      ?auto_46576 - BLOCK
      ?auto_46577 - BLOCK
      ?auto_46578 - BLOCK
    )
    :vars
    (
      ?auto_46579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46573 ?auto_46574 ) ) ( not ( = ?auto_46573 ?auto_46575 ) ) ( not ( = ?auto_46573 ?auto_46576 ) ) ( not ( = ?auto_46573 ?auto_46577 ) ) ( not ( = ?auto_46573 ?auto_46578 ) ) ( not ( = ?auto_46574 ?auto_46575 ) ) ( not ( = ?auto_46574 ?auto_46576 ) ) ( not ( = ?auto_46574 ?auto_46577 ) ) ( not ( = ?auto_46574 ?auto_46578 ) ) ( not ( = ?auto_46575 ?auto_46576 ) ) ( not ( = ?auto_46575 ?auto_46577 ) ) ( not ( = ?auto_46575 ?auto_46578 ) ) ( not ( = ?auto_46576 ?auto_46577 ) ) ( not ( = ?auto_46576 ?auto_46578 ) ) ( not ( = ?auto_46577 ?auto_46578 ) ) ( ON-TABLE ?auto_46578 ) ( ON ?auto_46577 ?auto_46578 ) ( ON ?auto_46576 ?auto_46577 ) ( ON ?auto_46575 ?auto_46576 ) ( ON ?auto_46573 ?auto_46579 ) ( not ( = ?auto_46573 ?auto_46579 ) ) ( not ( = ?auto_46574 ?auto_46579 ) ) ( not ( = ?auto_46575 ?auto_46579 ) ) ( not ( = ?auto_46576 ?auto_46579 ) ) ( not ( = ?auto_46577 ?auto_46579 ) ) ( not ( = ?auto_46578 ?auto_46579 ) ) ( CLEAR ?auto_46575 ) ( ON ?auto_46574 ?auto_46573 ) ( CLEAR ?auto_46574 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46579 ?auto_46573 )
      ( MAKE-6PILE ?auto_46573 ?auto_46574 ?auto_46575 ?auto_46576 ?auto_46577 ?auto_46578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46580 - BLOCK
      ?auto_46581 - BLOCK
      ?auto_46582 - BLOCK
      ?auto_46583 - BLOCK
      ?auto_46584 - BLOCK
      ?auto_46585 - BLOCK
    )
    :vars
    (
      ?auto_46586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46580 ?auto_46581 ) ) ( not ( = ?auto_46580 ?auto_46582 ) ) ( not ( = ?auto_46580 ?auto_46583 ) ) ( not ( = ?auto_46580 ?auto_46584 ) ) ( not ( = ?auto_46580 ?auto_46585 ) ) ( not ( = ?auto_46581 ?auto_46582 ) ) ( not ( = ?auto_46581 ?auto_46583 ) ) ( not ( = ?auto_46581 ?auto_46584 ) ) ( not ( = ?auto_46581 ?auto_46585 ) ) ( not ( = ?auto_46582 ?auto_46583 ) ) ( not ( = ?auto_46582 ?auto_46584 ) ) ( not ( = ?auto_46582 ?auto_46585 ) ) ( not ( = ?auto_46583 ?auto_46584 ) ) ( not ( = ?auto_46583 ?auto_46585 ) ) ( not ( = ?auto_46584 ?auto_46585 ) ) ( ON-TABLE ?auto_46585 ) ( ON ?auto_46584 ?auto_46585 ) ( ON ?auto_46583 ?auto_46584 ) ( ON ?auto_46580 ?auto_46586 ) ( not ( = ?auto_46580 ?auto_46586 ) ) ( not ( = ?auto_46581 ?auto_46586 ) ) ( not ( = ?auto_46582 ?auto_46586 ) ) ( not ( = ?auto_46583 ?auto_46586 ) ) ( not ( = ?auto_46584 ?auto_46586 ) ) ( not ( = ?auto_46585 ?auto_46586 ) ) ( ON ?auto_46581 ?auto_46580 ) ( CLEAR ?auto_46581 ) ( ON-TABLE ?auto_46586 ) ( HOLDING ?auto_46582 ) ( CLEAR ?auto_46583 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46585 ?auto_46584 ?auto_46583 ?auto_46582 )
      ( MAKE-6PILE ?auto_46580 ?auto_46581 ?auto_46582 ?auto_46583 ?auto_46584 ?auto_46585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46587 - BLOCK
      ?auto_46588 - BLOCK
      ?auto_46589 - BLOCK
      ?auto_46590 - BLOCK
      ?auto_46591 - BLOCK
      ?auto_46592 - BLOCK
    )
    :vars
    (
      ?auto_46593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46587 ?auto_46588 ) ) ( not ( = ?auto_46587 ?auto_46589 ) ) ( not ( = ?auto_46587 ?auto_46590 ) ) ( not ( = ?auto_46587 ?auto_46591 ) ) ( not ( = ?auto_46587 ?auto_46592 ) ) ( not ( = ?auto_46588 ?auto_46589 ) ) ( not ( = ?auto_46588 ?auto_46590 ) ) ( not ( = ?auto_46588 ?auto_46591 ) ) ( not ( = ?auto_46588 ?auto_46592 ) ) ( not ( = ?auto_46589 ?auto_46590 ) ) ( not ( = ?auto_46589 ?auto_46591 ) ) ( not ( = ?auto_46589 ?auto_46592 ) ) ( not ( = ?auto_46590 ?auto_46591 ) ) ( not ( = ?auto_46590 ?auto_46592 ) ) ( not ( = ?auto_46591 ?auto_46592 ) ) ( ON-TABLE ?auto_46592 ) ( ON ?auto_46591 ?auto_46592 ) ( ON ?auto_46590 ?auto_46591 ) ( ON ?auto_46587 ?auto_46593 ) ( not ( = ?auto_46587 ?auto_46593 ) ) ( not ( = ?auto_46588 ?auto_46593 ) ) ( not ( = ?auto_46589 ?auto_46593 ) ) ( not ( = ?auto_46590 ?auto_46593 ) ) ( not ( = ?auto_46591 ?auto_46593 ) ) ( not ( = ?auto_46592 ?auto_46593 ) ) ( ON ?auto_46588 ?auto_46587 ) ( ON-TABLE ?auto_46593 ) ( CLEAR ?auto_46590 ) ( ON ?auto_46589 ?auto_46588 ) ( CLEAR ?auto_46589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46593 ?auto_46587 ?auto_46588 )
      ( MAKE-6PILE ?auto_46587 ?auto_46588 ?auto_46589 ?auto_46590 ?auto_46591 ?auto_46592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46594 - BLOCK
      ?auto_46595 - BLOCK
      ?auto_46596 - BLOCK
      ?auto_46597 - BLOCK
      ?auto_46598 - BLOCK
      ?auto_46599 - BLOCK
    )
    :vars
    (
      ?auto_46600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46594 ?auto_46595 ) ) ( not ( = ?auto_46594 ?auto_46596 ) ) ( not ( = ?auto_46594 ?auto_46597 ) ) ( not ( = ?auto_46594 ?auto_46598 ) ) ( not ( = ?auto_46594 ?auto_46599 ) ) ( not ( = ?auto_46595 ?auto_46596 ) ) ( not ( = ?auto_46595 ?auto_46597 ) ) ( not ( = ?auto_46595 ?auto_46598 ) ) ( not ( = ?auto_46595 ?auto_46599 ) ) ( not ( = ?auto_46596 ?auto_46597 ) ) ( not ( = ?auto_46596 ?auto_46598 ) ) ( not ( = ?auto_46596 ?auto_46599 ) ) ( not ( = ?auto_46597 ?auto_46598 ) ) ( not ( = ?auto_46597 ?auto_46599 ) ) ( not ( = ?auto_46598 ?auto_46599 ) ) ( ON-TABLE ?auto_46599 ) ( ON ?auto_46598 ?auto_46599 ) ( ON ?auto_46594 ?auto_46600 ) ( not ( = ?auto_46594 ?auto_46600 ) ) ( not ( = ?auto_46595 ?auto_46600 ) ) ( not ( = ?auto_46596 ?auto_46600 ) ) ( not ( = ?auto_46597 ?auto_46600 ) ) ( not ( = ?auto_46598 ?auto_46600 ) ) ( not ( = ?auto_46599 ?auto_46600 ) ) ( ON ?auto_46595 ?auto_46594 ) ( ON-TABLE ?auto_46600 ) ( ON ?auto_46596 ?auto_46595 ) ( CLEAR ?auto_46596 ) ( HOLDING ?auto_46597 ) ( CLEAR ?auto_46598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46599 ?auto_46598 ?auto_46597 )
      ( MAKE-6PILE ?auto_46594 ?auto_46595 ?auto_46596 ?auto_46597 ?auto_46598 ?auto_46599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46601 - BLOCK
      ?auto_46602 - BLOCK
      ?auto_46603 - BLOCK
      ?auto_46604 - BLOCK
      ?auto_46605 - BLOCK
      ?auto_46606 - BLOCK
    )
    :vars
    (
      ?auto_46607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46601 ?auto_46602 ) ) ( not ( = ?auto_46601 ?auto_46603 ) ) ( not ( = ?auto_46601 ?auto_46604 ) ) ( not ( = ?auto_46601 ?auto_46605 ) ) ( not ( = ?auto_46601 ?auto_46606 ) ) ( not ( = ?auto_46602 ?auto_46603 ) ) ( not ( = ?auto_46602 ?auto_46604 ) ) ( not ( = ?auto_46602 ?auto_46605 ) ) ( not ( = ?auto_46602 ?auto_46606 ) ) ( not ( = ?auto_46603 ?auto_46604 ) ) ( not ( = ?auto_46603 ?auto_46605 ) ) ( not ( = ?auto_46603 ?auto_46606 ) ) ( not ( = ?auto_46604 ?auto_46605 ) ) ( not ( = ?auto_46604 ?auto_46606 ) ) ( not ( = ?auto_46605 ?auto_46606 ) ) ( ON-TABLE ?auto_46606 ) ( ON ?auto_46605 ?auto_46606 ) ( ON ?auto_46601 ?auto_46607 ) ( not ( = ?auto_46601 ?auto_46607 ) ) ( not ( = ?auto_46602 ?auto_46607 ) ) ( not ( = ?auto_46603 ?auto_46607 ) ) ( not ( = ?auto_46604 ?auto_46607 ) ) ( not ( = ?auto_46605 ?auto_46607 ) ) ( not ( = ?auto_46606 ?auto_46607 ) ) ( ON ?auto_46602 ?auto_46601 ) ( ON-TABLE ?auto_46607 ) ( ON ?auto_46603 ?auto_46602 ) ( CLEAR ?auto_46605 ) ( ON ?auto_46604 ?auto_46603 ) ( CLEAR ?auto_46604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46607 ?auto_46601 ?auto_46602 ?auto_46603 )
      ( MAKE-6PILE ?auto_46601 ?auto_46602 ?auto_46603 ?auto_46604 ?auto_46605 ?auto_46606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46608 - BLOCK
      ?auto_46609 - BLOCK
      ?auto_46610 - BLOCK
      ?auto_46611 - BLOCK
      ?auto_46612 - BLOCK
      ?auto_46613 - BLOCK
    )
    :vars
    (
      ?auto_46614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46608 ?auto_46609 ) ) ( not ( = ?auto_46608 ?auto_46610 ) ) ( not ( = ?auto_46608 ?auto_46611 ) ) ( not ( = ?auto_46608 ?auto_46612 ) ) ( not ( = ?auto_46608 ?auto_46613 ) ) ( not ( = ?auto_46609 ?auto_46610 ) ) ( not ( = ?auto_46609 ?auto_46611 ) ) ( not ( = ?auto_46609 ?auto_46612 ) ) ( not ( = ?auto_46609 ?auto_46613 ) ) ( not ( = ?auto_46610 ?auto_46611 ) ) ( not ( = ?auto_46610 ?auto_46612 ) ) ( not ( = ?auto_46610 ?auto_46613 ) ) ( not ( = ?auto_46611 ?auto_46612 ) ) ( not ( = ?auto_46611 ?auto_46613 ) ) ( not ( = ?auto_46612 ?auto_46613 ) ) ( ON-TABLE ?auto_46613 ) ( ON ?auto_46608 ?auto_46614 ) ( not ( = ?auto_46608 ?auto_46614 ) ) ( not ( = ?auto_46609 ?auto_46614 ) ) ( not ( = ?auto_46610 ?auto_46614 ) ) ( not ( = ?auto_46611 ?auto_46614 ) ) ( not ( = ?auto_46612 ?auto_46614 ) ) ( not ( = ?auto_46613 ?auto_46614 ) ) ( ON ?auto_46609 ?auto_46608 ) ( ON-TABLE ?auto_46614 ) ( ON ?auto_46610 ?auto_46609 ) ( ON ?auto_46611 ?auto_46610 ) ( CLEAR ?auto_46611 ) ( HOLDING ?auto_46612 ) ( CLEAR ?auto_46613 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46613 ?auto_46612 )
      ( MAKE-6PILE ?auto_46608 ?auto_46609 ?auto_46610 ?auto_46611 ?auto_46612 ?auto_46613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46615 - BLOCK
      ?auto_46616 - BLOCK
      ?auto_46617 - BLOCK
      ?auto_46618 - BLOCK
      ?auto_46619 - BLOCK
      ?auto_46620 - BLOCK
    )
    :vars
    (
      ?auto_46621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46615 ?auto_46616 ) ) ( not ( = ?auto_46615 ?auto_46617 ) ) ( not ( = ?auto_46615 ?auto_46618 ) ) ( not ( = ?auto_46615 ?auto_46619 ) ) ( not ( = ?auto_46615 ?auto_46620 ) ) ( not ( = ?auto_46616 ?auto_46617 ) ) ( not ( = ?auto_46616 ?auto_46618 ) ) ( not ( = ?auto_46616 ?auto_46619 ) ) ( not ( = ?auto_46616 ?auto_46620 ) ) ( not ( = ?auto_46617 ?auto_46618 ) ) ( not ( = ?auto_46617 ?auto_46619 ) ) ( not ( = ?auto_46617 ?auto_46620 ) ) ( not ( = ?auto_46618 ?auto_46619 ) ) ( not ( = ?auto_46618 ?auto_46620 ) ) ( not ( = ?auto_46619 ?auto_46620 ) ) ( ON-TABLE ?auto_46620 ) ( ON ?auto_46615 ?auto_46621 ) ( not ( = ?auto_46615 ?auto_46621 ) ) ( not ( = ?auto_46616 ?auto_46621 ) ) ( not ( = ?auto_46617 ?auto_46621 ) ) ( not ( = ?auto_46618 ?auto_46621 ) ) ( not ( = ?auto_46619 ?auto_46621 ) ) ( not ( = ?auto_46620 ?auto_46621 ) ) ( ON ?auto_46616 ?auto_46615 ) ( ON-TABLE ?auto_46621 ) ( ON ?auto_46617 ?auto_46616 ) ( ON ?auto_46618 ?auto_46617 ) ( CLEAR ?auto_46620 ) ( ON ?auto_46619 ?auto_46618 ) ( CLEAR ?auto_46619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46621 ?auto_46615 ?auto_46616 ?auto_46617 ?auto_46618 )
      ( MAKE-6PILE ?auto_46615 ?auto_46616 ?auto_46617 ?auto_46618 ?auto_46619 ?auto_46620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46622 - BLOCK
      ?auto_46623 - BLOCK
      ?auto_46624 - BLOCK
      ?auto_46625 - BLOCK
      ?auto_46626 - BLOCK
      ?auto_46627 - BLOCK
    )
    :vars
    (
      ?auto_46628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46622 ?auto_46623 ) ) ( not ( = ?auto_46622 ?auto_46624 ) ) ( not ( = ?auto_46622 ?auto_46625 ) ) ( not ( = ?auto_46622 ?auto_46626 ) ) ( not ( = ?auto_46622 ?auto_46627 ) ) ( not ( = ?auto_46623 ?auto_46624 ) ) ( not ( = ?auto_46623 ?auto_46625 ) ) ( not ( = ?auto_46623 ?auto_46626 ) ) ( not ( = ?auto_46623 ?auto_46627 ) ) ( not ( = ?auto_46624 ?auto_46625 ) ) ( not ( = ?auto_46624 ?auto_46626 ) ) ( not ( = ?auto_46624 ?auto_46627 ) ) ( not ( = ?auto_46625 ?auto_46626 ) ) ( not ( = ?auto_46625 ?auto_46627 ) ) ( not ( = ?auto_46626 ?auto_46627 ) ) ( ON ?auto_46622 ?auto_46628 ) ( not ( = ?auto_46622 ?auto_46628 ) ) ( not ( = ?auto_46623 ?auto_46628 ) ) ( not ( = ?auto_46624 ?auto_46628 ) ) ( not ( = ?auto_46625 ?auto_46628 ) ) ( not ( = ?auto_46626 ?auto_46628 ) ) ( not ( = ?auto_46627 ?auto_46628 ) ) ( ON ?auto_46623 ?auto_46622 ) ( ON-TABLE ?auto_46628 ) ( ON ?auto_46624 ?auto_46623 ) ( ON ?auto_46625 ?auto_46624 ) ( ON ?auto_46626 ?auto_46625 ) ( CLEAR ?auto_46626 ) ( HOLDING ?auto_46627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46627 )
      ( MAKE-6PILE ?auto_46622 ?auto_46623 ?auto_46624 ?auto_46625 ?auto_46626 ?auto_46627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46629 - BLOCK
      ?auto_46630 - BLOCK
      ?auto_46631 - BLOCK
      ?auto_46632 - BLOCK
      ?auto_46633 - BLOCK
      ?auto_46634 - BLOCK
    )
    :vars
    (
      ?auto_46635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46629 ?auto_46630 ) ) ( not ( = ?auto_46629 ?auto_46631 ) ) ( not ( = ?auto_46629 ?auto_46632 ) ) ( not ( = ?auto_46629 ?auto_46633 ) ) ( not ( = ?auto_46629 ?auto_46634 ) ) ( not ( = ?auto_46630 ?auto_46631 ) ) ( not ( = ?auto_46630 ?auto_46632 ) ) ( not ( = ?auto_46630 ?auto_46633 ) ) ( not ( = ?auto_46630 ?auto_46634 ) ) ( not ( = ?auto_46631 ?auto_46632 ) ) ( not ( = ?auto_46631 ?auto_46633 ) ) ( not ( = ?auto_46631 ?auto_46634 ) ) ( not ( = ?auto_46632 ?auto_46633 ) ) ( not ( = ?auto_46632 ?auto_46634 ) ) ( not ( = ?auto_46633 ?auto_46634 ) ) ( ON ?auto_46629 ?auto_46635 ) ( not ( = ?auto_46629 ?auto_46635 ) ) ( not ( = ?auto_46630 ?auto_46635 ) ) ( not ( = ?auto_46631 ?auto_46635 ) ) ( not ( = ?auto_46632 ?auto_46635 ) ) ( not ( = ?auto_46633 ?auto_46635 ) ) ( not ( = ?auto_46634 ?auto_46635 ) ) ( ON ?auto_46630 ?auto_46629 ) ( ON-TABLE ?auto_46635 ) ( ON ?auto_46631 ?auto_46630 ) ( ON ?auto_46632 ?auto_46631 ) ( ON ?auto_46633 ?auto_46632 ) ( ON ?auto_46634 ?auto_46633 ) ( CLEAR ?auto_46634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46635 ?auto_46629 ?auto_46630 ?auto_46631 ?auto_46632 ?auto_46633 )
      ( MAKE-6PILE ?auto_46629 ?auto_46630 ?auto_46631 ?auto_46632 ?auto_46633 ?auto_46634 ) )
  )

)

