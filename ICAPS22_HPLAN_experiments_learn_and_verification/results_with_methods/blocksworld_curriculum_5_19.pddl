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
      ?auto_9785 - BLOCK
    )
    :vars
    (
      ?auto_9786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9785 ?auto_9786 ) ( CLEAR ?auto_9785 ) ( HAND-EMPTY ) ( not ( = ?auto_9785 ?auto_9786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9785 ?auto_9786 )
      ( !PUTDOWN ?auto_9785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9788 - BLOCK
    )
    :vars
    (
      ?auto_9789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9788 ?auto_9789 ) ( CLEAR ?auto_9788 ) ( HAND-EMPTY ) ( not ( = ?auto_9788 ?auto_9789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9788 ?auto_9789 )
      ( !PUTDOWN ?auto_9788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9792 - BLOCK
      ?auto_9793 - BLOCK
    )
    :vars
    (
      ?auto_9794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9792 ) ( ON ?auto_9793 ?auto_9794 ) ( CLEAR ?auto_9793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9792 ) ( not ( = ?auto_9792 ?auto_9793 ) ) ( not ( = ?auto_9792 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9793 ?auto_9794 )
      ( !STACK ?auto_9793 ?auto_9792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9797 - BLOCK
      ?auto_9798 - BLOCK
    )
    :vars
    (
      ?auto_9799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9797 ) ( ON ?auto_9798 ?auto_9799 ) ( CLEAR ?auto_9798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9797 ) ( not ( = ?auto_9797 ?auto_9798 ) ) ( not ( = ?auto_9797 ?auto_9799 ) ) ( not ( = ?auto_9798 ?auto_9799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9798 ?auto_9799 )
      ( !STACK ?auto_9798 ?auto_9797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9802 - BLOCK
      ?auto_9803 - BLOCK
    )
    :vars
    (
      ?auto_9804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9803 ?auto_9804 ) ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( ON ?auto_9802 ?auto_9803 ) ( CLEAR ?auto_9802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9802 )
      ( MAKE-2PILE ?auto_9802 ?auto_9803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9807 - BLOCK
      ?auto_9808 - BLOCK
    )
    :vars
    (
      ?auto_9809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9808 ?auto_9809 ) ( not ( = ?auto_9807 ?auto_9808 ) ) ( not ( = ?auto_9807 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( ON ?auto_9807 ?auto_9808 ) ( CLEAR ?auto_9807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9807 )
      ( MAKE-2PILE ?auto_9807 ?auto_9808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9813 - BLOCK
      ?auto_9814 - BLOCK
      ?auto_9815 - BLOCK
    )
    :vars
    (
      ?auto_9816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9814 ) ( ON ?auto_9815 ?auto_9816 ) ( CLEAR ?auto_9815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9813 ) ( ON ?auto_9814 ?auto_9813 ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9815 ) ) ( not ( = ?auto_9813 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9815 ?auto_9816 )
      ( !STACK ?auto_9815 ?auto_9814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9820 - BLOCK
      ?auto_9821 - BLOCK
      ?auto_9822 - BLOCK
    )
    :vars
    (
      ?auto_9823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9821 ) ( ON ?auto_9822 ?auto_9823 ) ( CLEAR ?auto_9822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9820 ) ( ON ?auto_9821 ?auto_9820 ) ( not ( = ?auto_9820 ?auto_9821 ) ) ( not ( = ?auto_9820 ?auto_9822 ) ) ( not ( = ?auto_9820 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9822 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( not ( = ?auto_9822 ?auto_9823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9822 ?auto_9823 )
      ( !STACK ?auto_9822 ?auto_9821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9827 - BLOCK
      ?auto_9828 - BLOCK
      ?auto_9829 - BLOCK
    )
    :vars
    (
      ?auto_9830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9829 ?auto_9830 ) ( ON-TABLE ?auto_9827 ) ( not ( = ?auto_9827 ?auto_9828 ) ) ( not ( = ?auto_9827 ?auto_9829 ) ) ( not ( = ?auto_9827 ?auto_9830 ) ) ( not ( = ?auto_9828 ?auto_9829 ) ) ( not ( = ?auto_9828 ?auto_9830 ) ) ( not ( = ?auto_9829 ?auto_9830 ) ) ( CLEAR ?auto_9827 ) ( ON ?auto_9828 ?auto_9829 ) ( CLEAR ?auto_9828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9827 ?auto_9828 )
      ( MAKE-3PILE ?auto_9827 ?auto_9828 ?auto_9829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9834 - BLOCK
      ?auto_9835 - BLOCK
      ?auto_9836 - BLOCK
    )
    :vars
    (
      ?auto_9837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9836 ?auto_9837 ) ( ON-TABLE ?auto_9834 ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( not ( = ?auto_9834 ?auto_9836 ) ) ( not ( = ?auto_9834 ?auto_9837 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( CLEAR ?auto_9834 ) ( ON ?auto_9835 ?auto_9836 ) ( CLEAR ?auto_9835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9834 ?auto_9835 )
      ( MAKE-3PILE ?auto_9834 ?auto_9835 ?auto_9836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9841 - BLOCK
      ?auto_9842 - BLOCK
      ?auto_9843 - BLOCK
    )
    :vars
    (
      ?auto_9844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9843 ?auto_9844 ) ( not ( = ?auto_9841 ?auto_9842 ) ) ( not ( = ?auto_9841 ?auto_9843 ) ) ( not ( = ?auto_9841 ?auto_9844 ) ) ( not ( = ?auto_9842 ?auto_9843 ) ) ( not ( = ?auto_9842 ?auto_9844 ) ) ( not ( = ?auto_9843 ?auto_9844 ) ) ( ON ?auto_9842 ?auto_9843 ) ( ON ?auto_9841 ?auto_9842 ) ( CLEAR ?auto_9841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9841 )
      ( MAKE-3PILE ?auto_9841 ?auto_9842 ?auto_9843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9848 - BLOCK
      ?auto_9849 - BLOCK
      ?auto_9850 - BLOCK
    )
    :vars
    (
      ?auto_9851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9850 ?auto_9851 ) ( not ( = ?auto_9848 ?auto_9849 ) ) ( not ( = ?auto_9848 ?auto_9850 ) ) ( not ( = ?auto_9848 ?auto_9851 ) ) ( not ( = ?auto_9849 ?auto_9850 ) ) ( not ( = ?auto_9849 ?auto_9851 ) ) ( not ( = ?auto_9850 ?auto_9851 ) ) ( ON ?auto_9849 ?auto_9850 ) ( ON ?auto_9848 ?auto_9849 ) ( CLEAR ?auto_9848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9848 )
      ( MAKE-3PILE ?auto_9848 ?auto_9849 ?auto_9850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9856 - BLOCK
      ?auto_9857 - BLOCK
      ?auto_9858 - BLOCK
      ?auto_9859 - BLOCK
    )
    :vars
    (
      ?auto_9860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9858 ) ( ON ?auto_9859 ?auto_9860 ) ( CLEAR ?auto_9859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9856 ) ( ON ?auto_9857 ?auto_9856 ) ( ON ?auto_9858 ?auto_9857 ) ( not ( = ?auto_9856 ?auto_9857 ) ) ( not ( = ?auto_9856 ?auto_9858 ) ) ( not ( = ?auto_9856 ?auto_9859 ) ) ( not ( = ?auto_9856 ?auto_9860 ) ) ( not ( = ?auto_9857 ?auto_9858 ) ) ( not ( = ?auto_9857 ?auto_9859 ) ) ( not ( = ?auto_9857 ?auto_9860 ) ) ( not ( = ?auto_9858 ?auto_9859 ) ) ( not ( = ?auto_9858 ?auto_9860 ) ) ( not ( = ?auto_9859 ?auto_9860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9859 ?auto_9860 )
      ( !STACK ?auto_9859 ?auto_9858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9865 - BLOCK
      ?auto_9866 - BLOCK
      ?auto_9867 - BLOCK
      ?auto_9868 - BLOCK
    )
    :vars
    (
      ?auto_9869 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9867 ) ( ON ?auto_9868 ?auto_9869 ) ( CLEAR ?auto_9868 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9865 ) ( ON ?auto_9866 ?auto_9865 ) ( ON ?auto_9867 ?auto_9866 ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9867 ) ) ( not ( = ?auto_9865 ?auto_9868 ) ) ( not ( = ?auto_9865 ?auto_9869 ) ) ( not ( = ?auto_9866 ?auto_9867 ) ) ( not ( = ?auto_9866 ?auto_9868 ) ) ( not ( = ?auto_9866 ?auto_9869 ) ) ( not ( = ?auto_9867 ?auto_9868 ) ) ( not ( = ?auto_9867 ?auto_9869 ) ) ( not ( = ?auto_9868 ?auto_9869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9868 ?auto_9869 )
      ( !STACK ?auto_9868 ?auto_9867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9874 - BLOCK
      ?auto_9875 - BLOCK
      ?auto_9876 - BLOCK
      ?auto_9877 - BLOCK
    )
    :vars
    (
      ?auto_9878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9877 ?auto_9878 ) ( ON-TABLE ?auto_9874 ) ( ON ?auto_9875 ?auto_9874 ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9877 ) ) ( not ( = ?auto_9874 ?auto_9878 ) ) ( not ( = ?auto_9875 ?auto_9876 ) ) ( not ( = ?auto_9875 ?auto_9877 ) ) ( not ( = ?auto_9875 ?auto_9878 ) ) ( not ( = ?auto_9876 ?auto_9877 ) ) ( not ( = ?auto_9876 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( CLEAR ?auto_9875 ) ( ON ?auto_9876 ?auto_9877 ) ( CLEAR ?auto_9876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9874 ?auto_9875 ?auto_9876 )
      ( MAKE-4PILE ?auto_9874 ?auto_9875 ?auto_9876 ?auto_9877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9883 - BLOCK
      ?auto_9884 - BLOCK
      ?auto_9885 - BLOCK
      ?auto_9886 - BLOCK
    )
    :vars
    (
      ?auto_9887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9886 ?auto_9887 ) ( ON-TABLE ?auto_9883 ) ( ON ?auto_9884 ?auto_9883 ) ( not ( = ?auto_9883 ?auto_9884 ) ) ( not ( = ?auto_9883 ?auto_9885 ) ) ( not ( = ?auto_9883 ?auto_9886 ) ) ( not ( = ?auto_9883 ?auto_9887 ) ) ( not ( = ?auto_9884 ?auto_9885 ) ) ( not ( = ?auto_9884 ?auto_9886 ) ) ( not ( = ?auto_9884 ?auto_9887 ) ) ( not ( = ?auto_9885 ?auto_9886 ) ) ( not ( = ?auto_9885 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( CLEAR ?auto_9884 ) ( ON ?auto_9885 ?auto_9886 ) ( CLEAR ?auto_9885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9883 ?auto_9884 ?auto_9885 )
      ( MAKE-4PILE ?auto_9883 ?auto_9884 ?auto_9885 ?auto_9886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9892 - BLOCK
      ?auto_9893 - BLOCK
      ?auto_9894 - BLOCK
      ?auto_9895 - BLOCK
    )
    :vars
    (
      ?auto_9896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9895 ?auto_9896 ) ( ON-TABLE ?auto_9892 ) ( not ( = ?auto_9892 ?auto_9893 ) ) ( not ( = ?auto_9892 ?auto_9894 ) ) ( not ( = ?auto_9892 ?auto_9895 ) ) ( not ( = ?auto_9892 ?auto_9896 ) ) ( not ( = ?auto_9893 ?auto_9894 ) ) ( not ( = ?auto_9893 ?auto_9895 ) ) ( not ( = ?auto_9893 ?auto_9896 ) ) ( not ( = ?auto_9894 ?auto_9895 ) ) ( not ( = ?auto_9894 ?auto_9896 ) ) ( not ( = ?auto_9895 ?auto_9896 ) ) ( ON ?auto_9894 ?auto_9895 ) ( CLEAR ?auto_9892 ) ( ON ?auto_9893 ?auto_9894 ) ( CLEAR ?auto_9893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9892 ?auto_9893 )
      ( MAKE-4PILE ?auto_9892 ?auto_9893 ?auto_9894 ?auto_9895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9901 - BLOCK
      ?auto_9902 - BLOCK
      ?auto_9903 - BLOCK
      ?auto_9904 - BLOCK
    )
    :vars
    (
      ?auto_9905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9904 ?auto_9905 ) ( ON-TABLE ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( not ( = ?auto_9901 ?auto_9903 ) ) ( not ( = ?auto_9901 ?auto_9904 ) ) ( not ( = ?auto_9901 ?auto_9905 ) ) ( not ( = ?auto_9902 ?auto_9903 ) ) ( not ( = ?auto_9902 ?auto_9904 ) ) ( not ( = ?auto_9902 ?auto_9905 ) ) ( not ( = ?auto_9903 ?auto_9904 ) ) ( not ( = ?auto_9903 ?auto_9905 ) ) ( not ( = ?auto_9904 ?auto_9905 ) ) ( ON ?auto_9903 ?auto_9904 ) ( CLEAR ?auto_9901 ) ( ON ?auto_9902 ?auto_9903 ) ( CLEAR ?auto_9902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9901 ?auto_9902 )
      ( MAKE-4PILE ?auto_9901 ?auto_9902 ?auto_9903 ?auto_9904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9910 - BLOCK
      ?auto_9911 - BLOCK
      ?auto_9912 - BLOCK
      ?auto_9913 - BLOCK
    )
    :vars
    (
      ?auto_9914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9913 ?auto_9914 ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9912 ) ) ( not ( = ?auto_9910 ?auto_9913 ) ) ( not ( = ?auto_9910 ?auto_9914 ) ) ( not ( = ?auto_9911 ?auto_9912 ) ) ( not ( = ?auto_9911 ?auto_9913 ) ) ( not ( = ?auto_9911 ?auto_9914 ) ) ( not ( = ?auto_9912 ?auto_9913 ) ) ( not ( = ?auto_9912 ?auto_9914 ) ) ( not ( = ?auto_9913 ?auto_9914 ) ) ( ON ?auto_9912 ?auto_9913 ) ( ON ?auto_9911 ?auto_9912 ) ( ON ?auto_9910 ?auto_9911 ) ( CLEAR ?auto_9910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9910 )
      ( MAKE-4PILE ?auto_9910 ?auto_9911 ?auto_9912 ?auto_9913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9919 - BLOCK
      ?auto_9920 - BLOCK
      ?auto_9921 - BLOCK
      ?auto_9922 - BLOCK
    )
    :vars
    (
      ?auto_9923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9922 ?auto_9923 ) ( not ( = ?auto_9919 ?auto_9920 ) ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( not ( = ?auto_9919 ?auto_9922 ) ) ( not ( = ?auto_9919 ?auto_9923 ) ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( not ( = ?auto_9920 ?auto_9923 ) ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( not ( = ?auto_9921 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( ON ?auto_9921 ?auto_9922 ) ( ON ?auto_9920 ?auto_9921 ) ( ON ?auto_9919 ?auto_9920 ) ( CLEAR ?auto_9919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9919 )
      ( MAKE-4PILE ?auto_9919 ?auto_9920 ?auto_9921 ?auto_9922 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9929 - BLOCK
      ?auto_9930 - BLOCK
      ?auto_9931 - BLOCK
      ?auto_9932 - BLOCK
      ?auto_9933 - BLOCK
    )
    :vars
    (
      ?auto_9934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9932 ) ( ON ?auto_9933 ?auto_9934 ) ( CLEAR ?auto_9933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9929 ) ( ON ?auto_9930 ?auto_9929 ) ( ON ?auto_9931 ?auto_9930 ) ( ON ?auto_9932 ?auto_9931 ) ( not ( = ?auto_9929 ?auto_9930 ) ) ( not ( = ?auto_9929 ?auto_9931 ) ) ( not ( = ?auto_9929 ?auto_9932 ) ) ( not ( = ?auto_9929 ?auto_9933 ) ) ( not ( = ?auto_9929 ?auto_9934 ) ) ( not ( = ?auto_9930 ?auto_9931 ) ) ( not ( = ?auto_9930 ?auto_9932 ) ) ( not ( = ?auto_9930 ?auto_9933 ) ) ( not ( = ?auto_9930 ?auto_9934 ) ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( not ( = ?auto_9931 ?auto_9934 ) ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9933 ?auto_9934 )
      ( !STACK ?auto_9933 ?auto_9932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9940 - BLOCK
      ?auto_9941 - BLOCK
      ?auto_9942 - BLOCK
      ?auto_9943 - BLOCK
      ?auto_9944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9943 ) ( ON-TABLE ?auto_9944 ) ( CLEAR ?auto_9944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9940 ) ( ON ?auto_9941 ?auto_9940 ) ( ON ?auto_9942 ?auto_9941 ) ( ON ?auto_9943 ?auto_9942 ) ( not ( = ?auto_9940 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9942 ) ) ( not ( = ?auto_9940 ?auto_9943 ) ) ( not ( = ?auto_9940 ?auto_9944 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9943 ) ) ( not ( = ?auto_9941 ?auto_9944 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9944 ) ) ( not ( = ?auto_9943 ?auto_9944 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_9944 )
      ( !STACK ?auto_9944 ?auto_9943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9950 - BLOCK
      ?auto_9951 - BLOCK
      ?auto_9952 - BLOCK
      ?auto_9953 - BLOCK
      ?auto_9954 - BLOCK
    )
    :vars
    (
      ?auto_9955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9954 ?auto_9955 ) ( ON-TABLE ?auto_9950 ) ( ON ?auto_9951 ?auto_9950 ) ( ON ?auto_9952 ?auto_9951 ) ( not ( = ?auto_9950 ?auto_9951 ) ) ( not ( = ?auto_9950 ?auto_9952 ) ) ( not ( = ?auto_9950 ?auto_9953 ) ) ( not ( = ?auto_9950 ?auto_9954 ) ) ( not ( = ?auto_9950 ?auto_9955 ) ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9953 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9951 ?auto_9955 ) ) ( not ( = ?auto_9952 ?auto_9953 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9955 ) ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9955 ) ) ( not ( = ?auto_9954 ?auto_9955 ) ) ( CLEAR ?auto_9952 ) ( ON ?auto_9953 ?auto_9954 ) ( CLEAR ?auto_9953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9950 ?auto_9951 ?auto_9952 ?auto_9953 )
      ( MAKE-5PILE ?auto_9950 ?auto_9951 ?auto_9952 ?auto_9953 ?auto_9954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9961 - BLOCK
      ?auto_9962 - BLOCK
      ?auto_9963 - BLOCK
      ?auto_9964 - BLOCK
      ?auto_9965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9965 ) ( ON-TABLE ?auto_9961 ) ( ON ?auto_9962 ?auto_9961 ) ( ON ?auto_9963 ?auto_9962 ) ( not ( = ?auto_9961 ?auto_9962 ) ) ( not ( = ?auto_9961 ?auto_9963 ) ) ( not ( = ?auto_9961 ?auto_9964 ) ) ( not ( = ?auto_9961 ?auto_9965 ) ) ( not ( = ?auto_9962 ?auto_9963 ) ) ( not ( = ?auto_9962 ?auto_9964 ) ) ( not ( = ?auto_9962 ?auto_9965 ) ) ( not ( = ?auto_9963 ?auto_9964 ) ) ( not ( = ?auto_9963 ?auto_9965 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) ( CLEAR ?auto_9963 ) ( ON ?auto_9964 ?auto_9965 ) ( CLEAR ?auto_9964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9961 ?auto_9962 ?auto_9963 ?auto_9964 )
      ( MAKE-5PILE ?auto_9961 ?auto_9962 ?auto_9963 ?auto_9964 ?auto_9965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9971 - BLOCK
      ?auto_9972 - BLOCK
      ?auto_9973 - BLOCK
      ?auto_9974 - BLOCK
      ?auto_9975 - BLOCK
    )
    :vars
    (
      ?auto_9976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9975 ?auto_9976 ) ( ON-TABLE ?auto_9971 ) ( ON ?auto_9972 ?auto_9971 ) ( not ( = ?auto_9971 ?auto_9972 ) ) ( not ( = ?auto_9971 ?auto_9973 ) ) ( not ( = ?auto_9971 ?auto_9974 ) ) ( not ( = ?auto_9971 ?auto_9975 ) ) ( not ( = ?auto_9971 ?auto_9976 ) ) ( not ( = ?auto_9972 ?auto_9973 ) ) ( not ( = ?auto_9972 ?auto_9974 ) ) ( not ( = ?auto_9972 ?auto_9975 ) ) ( not ( = ?auto_9972 ?auto_9976 ) ) ( not ( = ?auto_9973 ?auto_9974 ) ) ( not ( = ?auto_9973 ?auto_9975 ) ) ( not ( = ?auto_9973 ?auto_9976 ) ) ( not ( = ?auto_9974 ?auto_9975 ) ) ( not ( = ?auto_9974 ?auto_9976 ) ) ( not ( = ?auto_9975 ?auto_9976 ) ) ( ON ?auto_9974 ?auto_9975 ) ( CLEAR ?auto_9972 ) ( ON ?auto_9973 ?auto_9974 ) ( CLEAR ?auto_9973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9971 ?auto_9972 ?auto_9973 )
      ( MAKE-5PILE ?auto_9971 ?auto_9972 ?auto_9973 ?auto_9974 ?auto_9975 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9982 - BLOCK
      ?auto_9983 - BLOCK
      ?auto_9984 - BLOCK
      ?auto_9985 - BLOCK
      ?auto_9986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9986 ) ( ON-TABLE ?auto_9982 ) ( ON ?auto_9983 ?auto_9982 ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9984 ) ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( not ( = ?auto_9982 ?auto_9986 ) ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( not ( = ?auto_9983 ?auto_9985 ) ) ( not ( = ?auto_9983 ?auto_9986 ) ) ( not ( = ?auto_9984 ?auto_9985 ) ) ( not ( = ?auto_9984 ?auto_9986 ) ) ( not ( = ?auto_9985 ?auto_9986 ) ) ( ON ?auto_9985 ?auto_9986 ) ( CLEAR ?auto_9983 ) ( ON ?auto_9984 ?auto_9985 ) ( CLEAR ?auto_9984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9982 ?auto_9983 ?auto_9984 )
      ( MAKE-5PILE ?auto_9982 ?auto_9983 ?auto_9984 ?auto_9985 ?auto_9986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9992 - BLOCK
      ?auto_9993 - BLOCK
      ?auto_9994 - BLOCK
      ?auto_9995 - BLOCK
      ?auto_9996 - BLOCK
    )
    :vars
    (
      ?auto_9997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9996 ?auto_9997 ) ( ON-TABLE ?auto_9992 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_9995 ) ) ( not ( = ?auto_9992 ?auto_9996 ) ) ( not ( = ?auto_9992 ?auto_9997 ) ) ( not ( = ?auto_9993 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9995 ) ) ( not ( = ?auto_9993 ?auto_9996 ) ) ( not ( = ?auto_9993 ?auto_9997 ) ) ( not ( = ?auto_9994 ?auto_9995 ) ) ( not ( = ?auto_9994 ?auto_9996 ) ) ( not ( = ?auto_9994 ?auto_9997 ) ) ( not ( = ?auto_9995 ?auto_9996 ) ) ( not ( = ?auto_9995 ?auto_9997 ) ) ( not ( = ?auto_9996 ?auto_9997 ) ) ( ON ?auto_9995 ?auto_9996 ) ( ON ?auto_9994 ?auto_9995 ) ( CLEAR ?auto_9992 ) ( ON ?auto_9993 ?auto_9994 ) ( CLEAR ?auto_9993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9992 ?auto_9993 )
      ( MAKE-5PILE ?auto_9992 ?auto_9993 ?auto_9994 ?auto_9995 ?auto_9996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10003 - BLOCK
      ?auto_10004 - BLOCK
      ?auto_10005 - BLOCK
      ?auto_10006 - BLOCK
      ?auto_10007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10007 ) ( ON-TABLE ?auto_10003 ) ( not ( = ?auto_10003 ?auto_10004 ) ) ( not ( = ?auto_10003 ?auto_10005 ) ) ( not ( = ?auto_10003 ?auto_10006 ) ) ( not ( = ?auto_10003 ?auto_10007 ) ) ( not ( = ?auto_10004 ?auto_10005 ) ) ( not ( = ?auto_10004 ?auto_10006 ) ) ( not ( = ?auto_10004 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( ON ?auto_10006 ?auto_10007 ) ( ON ?auto_10005 ?auto_10006 ) ( CLEAR ?auto_10003 ) ( ON ?auto_10004 ?auto_10005 ) ( CLEAR ?auto_10004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10003 ?auto_10004 )
      ( MAKE-5PILE ?auto_10003 ?auto_10004 ?auto_10005 ?auto_10006 ?auto_10007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10013 - BLOCK
      ?auto_10014 - BLOCK
      ?auto_10015 - BLOCK
      ?auto_10016 - BLOCK
      ?auto_10017 - BLOCK
    )
    :vars
    (
      ?auto_10018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10017 ?auto_10018 ) ( not ( = ?auto_10013 ?auto_10014 ) ) ( not ( = ?auto_10013 ?auto_10015 ) ) ( not ( = ?auto_10013 ?auto_10016 ) ) ( not ( = ?auto_10013 ?auto_10017 ) ) ( not ( = ?auto_10013 ?auto_10018 ) ) ( not ( = ?auto_10014 ?auto_10015 ) ) ( not ( = ?auto_10014 ?auto_10016 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10014 ?auto_10018 ) ) ( not ( = ?auto_10015 ?auto_10016 ) ) ( not ( = ?auto_10015 ?auto_10017 ) ) ( not ( = ?auto_10015 ?auto_10018 ) ) ( not ( = ?auto_10016 ?auto_10017 ) ) ( not ( = ?auto_10016 ?auto_10018 ) ) ( not ( = ?auto_10017 ?auto_10018 ) ) ( ON ?auto_10016 ?auto_10017 ) ( ON ?auto_10015 ?auto_10016 ) ( ON ?auto_10014 ?auto_10015 ) ( ON ?auto_10013 ?auto_10014 ) ( CLEAR ?auto_10013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10013 )
      ( MAKE-5PILE ?auto_10013 ?auto_10014 ?auto_10015 ?auto_10016 ?auto_10017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10024 - BLOCK
      ?auto_10025 - BLOCK
      ?auto_10026 - BLOCK
      ?auto_10027 - BLOCK
      ?auto_10028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10028 ) ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10024 ?auto_10026 ) ) ( not ( = ?auto_10024 ?auto_10027 ) ) ( not ( = ?auto_10024 ?auto_10028 ) ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( ON ?auto_10027 ?auto_10028 ) ( ON ?auto_10026 ?auto_10027 ) ( ON ?auto_10025 ?auto_10026 ) ( ON ?auto_10024 ?auto_10025 ) ( CLEAR ?auto_10024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10024 )
      ( MAKE-5PILE ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ?auto_10028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_10034 - BLOCK
      ?auto_10035 - BLOCK
      ?auto_10036 - BLOCK
      ?auto_10037 - BLOCK
      ?auto_10038 - BLOCK
    )
    :vars
    (
      ?auto_10039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10034 ?auto_10035 ) ) ( not ( = ?auto_10034 ?auto_10036 ) ) ( not ( = ?auto_10034 ?auto_10037 ) ) ( not ( = ?auto_10034 ?auto_10038 ) ) ( not ( = ?auto_10035 ?auto_10036 ) ) ( not ( = ?auto_10035 ?auto_10037 ) ) ( not ( = ?auto_10035 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10036 ?auto_10038 ) ) ( not ( = ?auto_10037 ?auto_10038 ) ) ( ON ?auto_10034 ?auto_10039 ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( not ( = ?auto_10037 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10039 ) ) ( not ( = ?auto_10035 ?auto_10039 ) ) ( not ( = ?auto_10034 ?auto_10039 ) ) ( ON ?auto_10035 ?auto_10034 ) ( ON ?auto_10036 ?auto_10035 ) ( ON ?auto_10037 ?auto_10036 ) ( ON ?auto_10038 ?auto_10037 ) ( CLEAR ?auto_10038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_10038 ?auto_10037 ?auto_10036 ?auto_10035 ?auto_10034 )
      ( MAKE-5PILE ?auto_10034 ?auto_10035 ?auto_10036 ?auto_10037 ?auto_10038 ) )
  )

)

