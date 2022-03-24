( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b603 - block
    b186 - block
    b783 - block
    b36 - block
    b840 - block
    b102 - block
    b902 - block
    b212 - block
    b876 - block
    b841 - block
    b699 - block
    b486 - block
    b538 - block
    b770 - block
    b647 - block
    b989 - block
    b115 - block
    b709 - block
    b528 - block
    b586 - block
    b953 - block
    b668 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b603 )
    ( on b186 b603 )
    ( on b783 b186 )
    ( on b36 b783 )
    ( on b840 b36 )
    ( on b102 b840 )
    ( on b902 b102 )
    ( on b212 b902 )
    ( on b876 b212 )
    ( on b841 b876 )
    ( on b699 b841 )
    ( on b486 b699 )
    ( on b538 b486 )
    ( on b770 b538 )
    ( on b647 b770 )
    ( on b989 b647 )
    ( on b115 b989 )
    ( on b709 b115 )
    ( on b528 b709 )
    ( on b586 b528 )
    ( on b953 b586 )
    ( on b668 b953 )
    ( clear b668 )
  )
  ( :tasks
    ( Make-21Pile b186 b783 b36 b840 b102 b902 b212 b876 b841 b699 b486 b538 b770 b647 b989 b115 b709 b528 b586 b953 b668 )
  )
)
